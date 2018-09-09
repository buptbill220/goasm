//go:generate clang -S -DENABLE_SSE4_2 -target x86_64-unknown-none -masm=intel -mno-red-zone -mstackrealign -mllvm -inline-threshold=1000 -fno-asynchronous-unwind-tables -fno-exceptions -fno-rtti -O3 -fno-builtin -ffast-math -msse4 clib/common.c -o clib/common_sse4.s
//go:generate clang -S -DENABLE_AVX -target x86_64-unknown-none -masm=intel -mno-red-zone -mstackrealign -mllvm -inline-threshold=1000 -fno-asynchronous-unwind-tables -fno-exceptions -fno-rtti -O3 -fno-builtin -ffast-math -mavx clib/common.c -o clib/common_avx.s
//go:generate clang -S -DENABLE_AVX2 -target x86_64-unknown-none -masm=intel -mno-red-zone -mstackrealign -mllvm -inline-threshold=1000 -fno-asynchronous-unwind-tables -fno-exceptions -fno-rtti -O3 -fno-builtin -ffast-math -mavx2 clib/common.c -o clib/common_avx2.s
//go:generate c2goasm -a -f clib/common_sse4.s common_sse4_amd64.s
//go:generate c2goasm -a -f clib/common_avx.s common_avx_amd64.s
//go:generate c2goasm -a -f clib/common_avx2.s common_avx2_amd64.s
package goasm

import (
	"math"
	"github.com/intel-go/cpuid"
	"fmt"
	//"internal/cpu"
	"math/bits"
	"unsafe"
	"reflect"
)

type BitPosCallback func(uint64)()

var (
	AsmVectorSum func([]int64) int64
	AsmVectorMax func([]int64) int64
	AsmVectorMin func([]int64) int64
	AsmVectorMulti func([]int64, []int64)
	AsmVectorAnd func([]int64, []int64)
	AsmVectorAnd2 func([]int64, []int64, []int64)
	AsmVectorAnd4 func([]int64, []int64, []int64, []int64, []int64)
	AsmVectorOr func([]int64, []int64)
	AsmVectorOr2 func([]int64, []int64, []int64)
	AsmVectorOr4 func([]int64, []int64, []int64, []int64, []int64)
	AsmVectorAndN func([]int64, []int64)
	AsmMemcopy func([]uint8, []uint8)
	AsmMemcopyUint64 func([]uint64, []uint64)
	AsmMemset func([]uint8, uint8)
	AsmBitmapGetBitNum func([]uint64) uint64
	AsmBkdrHash func(string, uint64) uint64
	AsmHashStringAndSum func([]uint8, []uint64, uint64) uint64
	AsmBitmapGetBitList func([]uint64, []uint64) uint64

	bkdrHashIndex []uint64
)

var deBruijn64tab = []uint8{
	0, 1, 56, 2, 57, 49, 28, 3, 61, 58, 42, 50, 38, 29, 17, 4,
	62, 47, 59, 36, 45, 43, 51, 22, 53, 39, 33, 30, 24, 18, 12, 5,
	63, 55, 48, 27, 60, 41, 37, 16, 46, 35, 44, 21, 52, 32, 23, 11,
	54, 26, 40, 15, 34, 20, 31, 10, 25, 14, 19, 9, 13, 8, 7, 6,
}

var deBruijn64tabSlice = (*slice)(unsafe.Pointer(&deBruijn64tab))

type slice struct {
	addr unsafe.Pointer
	len  int64
	cap  int64
}

type strslice struct {
	addr unsafe.Pointer
	len  int64
}

func init() {
	bkdrHashIndex = make([]uint64, 256)
	base := uint64(1313131)
	for i := 0; i < 256; i++ {
		bkdrHashIndex[i] = base
		base *= 1313131
	}
	switch {
	case cpuid.EnabledAVX && cpuid.HasExtendedFeature(cpuid.AVX2):
		fmt.Println("using avx2")
		AsmVectorSum = asm_sum_avx2
		AsmVectorMax = asm_max_avx2
		AsmVectorMin = asm_min_avx2
		AsmVectorMulti = asm_multi_avx2
		AsmVectorAnd = asm_and_avx2
		AsmVectorAnd2 = asm_and2_avx2
		AsmVectorAnd4 = asm_and4_avx2
		AsmVectorOr = asm_or_avx2
		AsmVectorOr2 = asm_or2_avx2
		AsmVectorOr4 = asm_or4_avx2
		AsmVectorAndN = asm_andn_avx2
		AsmMemcopy = asm_memcopy_avx2
		AsmMemcopyUint64 = asm_memcopy_uint64_avx2
		AsmMemset = asm_memset_avx2
		AsmBitmapGetBitNum = asm_bitmap_get_bit_num_avx2
		AsmBitmapGetBitList = asm_bitmap_get_bit_list_avx2
		AsmBkdrHash = asm_bkdr_hash_avx2
		AsmHashStringAndSum = asm_multi_and_sum_avx2
	case cpuid.EnabledAVX && cpuid.HasFeature(cpuid.AVX):
		fmt.Println("using avx")
		AsmVectorSum = asm_sum_avx
		AsmVectorMax = asm_max_avx
		AsmVectorMin = asm_min_avx
		AsmVectorMulti = asm_multi_avx
		AsmVectorAnd = asm_and_avx
		AsmVectorAnd2 = asm_and2_avx
		AsmVectorAnd4 = asm_and4_avx
		AsmVectorOr = asm_or_avx
		AsmVectorOr2 = asm_or2_avx
		AsmVectorOr4 = asm_or4_avx
		AsmVectorAndN = asm_andn_avx
		AsmMemcopy = asm_memcopy_avx
		AsmMemcopyUint64 = asm_memcopy_uint64_avx
		AsmMemset = asm_memset_avx
		AsmBitmapGetBitNum = asm_bitmap_get_bit_num_avx
		AsmBitmapGetBitList = asm_bitmap_get_bit_list_avx
		AsmBkdrHash = asm_bkdr_hash_avx
		AsmHashStringAndSum = asm_multi_and_sum_avx

	case cpuid.HasFeature(cpuid.SSE4_2):
		fmt.Println("using sse2")
		AsmVectorSum = asm_sum_sse4_2
		AsmVectorMax = asm_max_sse4_2
		AsmVectorMin = asm_min_sse4_2
		AsmVectorMulti = asm_multi_sse4_2
		AsmVectorAnd = asm_and_sse4_2
		AsmVectorAnd2 = asm_and2_sse4_2
		AsmVectorAnd4 = asm_and4_sse4_2
		AsmVectorOr = asm_or_sse4_2
		AsmVectorOr2 = asm_or2_sse4_2
		AsmVectorOr4 = asm_or4_sse4_2
		AsmVectorAndN = asm_andn_sse4_2
		AsmMemcopy = asm_memcopy_sse4_2
		AsmMemcopyUint64 = asm_memcopy_uint64_sse4_2
		AsmMemset = asm_memset_sse4_2
		AsmBitmapGetBitNum = asm_bitmap_get_bit_num_sse4_2
		AsmBitmapGetBitList = asm_bitmap_get_bit_list_sse4_2
		AsmBkdrHash = asm_bkdr_hash_sse4_2
		AsmHashStringAndSum = asm_multi_and_sum_sse4_2
	default:
		fmt.Println("using default")
		AsmVectorSum = vectorSum
		AsmVectorMax = vectorMax
		AsmVectorMin = vectorMin
		AsmVectorMulti = vectorMulti
		AsmVectorAnd = vectorAnd
		AsmVectorAnd2 = vectorAnd2
		AsmVectorAnd4 = vectorAnd4
		AsmVectorOr = vectorOr
		AsmVectorOr2 = vectorOr2
		AsmVectorOr4 = vectorOr4
		AsmVectorAndN = vectorAndn
		AsmMemcopy = memcopy
		AsmMemcopyUint64 = memcopy_uint64
		AsmMemset = memset
		AsmBitmapGetBitNum = bitmapGetBitNum
		AsmBitmapGetBitList = bitmapGetBitList
		AsmBkdrHash = bkdrHash
		AsmHashStringAndSum = hashStringAdSum
	}
}

func vectorSum(values []int64) int64 {
	var sum int64
	for _, v := range values {
		sum += v
	}
	return sum
}

func vectorMax(values []int64) int64 {
	if 0 == len(values) {
		return 0
	}
	var max int64 = math.MinInt64
	for _, v := range values {
		if max < v {
			max = v
		}
	}
	return max
}

func vectorMin(values []int64) int64 {
	if 0 == len(values) {
		return 0
	}
	var min int64 = math.MaxInt64
	for _, v := range values {
		if min > v {
			min = v
		}
	}
	return min
}

func vectorAnd(a, b []int64) {
	for i := range a {
		a[i] &= b[i]
	}
}

func vectorAnd2(a, b, c []int64) {
	for i := range a {
		a[i] &= b[i]
		a[i] &= c[i]
	}
}

func vectorAnd4(a, b, c, d, e []int64) {
	for i := range a {
		a[i] &= b[i]
		a[i] &= c[i]
		a[i] &= d[i]
		a[i] &= e[i]
	}
}

func vectorOr(a,b []int64) {
	for i := range a {
		a[i] |= b[i]
	}
}

func vectorOr2(a, b, c []int64) {
	for i := range a {
		a[i] |= b[i]
		a[i] |= c[i]
	}
}

func vectorOr4(a, b, c, d, e []int64) {
	for i := range a {
		a[i] |= b[i]
		a[i] |= c[i]
		a[i] |= d[i]
		a[i] |= e[i]
	}
}

func vectorAndn(a, b []int64) {
	for i := range a {
		a[i] &= ^b[i]
	}
}

func vectorMulti(a []int64, b []int64) {
	for i := range a {
		a[i] *= b[i]
	}
}

func memcopy(a []uint8, b []uint8) {
	copy(a, b)
}

func memcopy_uint64(a []uint64, b []uint64) {
	copy(a, b)
}

func memset(a []uint8, b uint8) {
	if len(a) > 0 {
		a[0] = b
	}
	pos := 1
	for pos < len(a) {
		copy(a[pos:], a[:pos])
		pos <<= 1
	}
}

func memset1(a []uint8, b uint8) {
	if len(a) > 0 {
		a[0] = b
	}
	for i := range a {
		a[i] = b
	}
}

func bitmapGetBitNum(a []uint64) uint64 {
	res := uint64(0)
	for _, num := range a {
		res += uint64(bits.OnesCount64(num))
	}
	return res
}

func bitmapGetBitList(a, b []uint64) uint64 {
	var i uint64
	pos := uint64(0)
	//base := uint64(0)
	for j, num := range a {
		for num > 0 {
			i = uint64(bits.TrailingZeros64(num))
			num = num & (num - 1)
			b[pos] = uint64(j<<6)+i
			pos++
		}
		//base += 64
	}
	return pos
}

// go noescape
func bkdrHash(str string, seed uint64) uint64 {
	ret := seed
	var b []uint8
	bh := (*reflect.SliceHeader)(unsafe.Pointer(&b))
	bh.Data = (*reflect.StringHeader)(unsafe.Pointer(&str)).Data
	bh.Len = len(str)
	bh.Cap = len(str)
	for _, c := range b {
		ret = ret * 1313131 + uint64(c)
	}
	return ret
}

func hashStringAdSum(a []uint8, b []uint64, seed uint64) uint64 {
	ret := uint64(0)
	var i int
	var c uint8
	for i, c = range a {
		ret += uint64(c) * b[i]
	}
	ret += seed * b[i]
	return ret;
}