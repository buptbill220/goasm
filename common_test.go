package goasm

import (
	"testing"
	"math/rand"
	"fmt"
	"github.com/stretchr/testify/assert"
	"time"
)

const vector_len = 1024

var (
	s0, s1, s2, s3, s4, s5, s6, s7 []uint64
	tmp, tmp_1 []uint64
	sInt64, sInt64_1, sInt64_2, sInt64_3, sInt64_4 []int64
	sUint8, sUint8_1 []uint8
	sHashUint8, sHashUint8_1 []uint8
)

func init() {
	rand.Seed(time.Now().UnixNano())
	s0 = make([]uint64, vector_len)
	s1 = make([]uint64, vector_len)
	s2 = make([]uint64, vector_len)
	s3 = make([]uint64, vector_len)
	s4 = make([]uint64, vector_len)
	s5 = make([]uint64, vector_len)
	s6 = make([]uint64, vector_len)
	s7 = make([]uint64, vector_len)
	tmp = make([]uint64, vector_len * 64)
	tmp_1 = make([]uint64, vector_len * 64)
	sInt64 = make([]int64, vector_len)
	sInt64_1 = make([]int64, vector_len)
	sInt64_2 = make([]int64, vector_len)
	sInt64_3 = make([]int64, vector_len)
	sInt64_4 = make([]int64, vector_len)
	sUint8 = make([]uint8, vector_len)
	sUint8_1 = make([]uint8, vector_len)
	for i := 0; i < vector_len; i++ {
		s0[i] = uint64(rand.Int63())
		s1[i] = s0[i]
		s2[i] = s1[i]
		s3[i] = s2[i]
		s4[i] = uint64(rand.Int63())
		s5[i] = s4[i]
		s6[i] = s5[i]
		s7[i] = s6[i]
		tmp[i] = uint64(rand.Int63())
		sInt64[i] = int64(rand.Int63())
		sInt64_1[i] = int64(rand.Int63())
		sInt64_2[i] = int64(rand.Int63())
		sInt64_3[i] = int64(rand.Int63())
		sInt64_4[i] = int64(rand.Int63())
		sUint8[i] = uint8(rand.Int63())
		sUint8_1[i] = uint8(rand.Int63())
	}
	sHashUint8, sHashUint8_1 = GetArrayUint8WithLen(64)
}

func GetArrayInt64() ([]int64, []int64) {
	a := make([]int64, vector_len)
	b := make([]int64, vector_len)
	for i := 0; i < vector_len; i++ {
		a[i] = int64(rand.Int63())
		b[i] = a[i]
	}
	return a, b
}

func GetArrayUInt64() ([]uint64, []uint64) {
	a := make([]uint64, vector_len)
	b := make([]uint64, vector_len)
	for i := 0; i < vector_len; i++ {
		a[i] = uint64(rand.Int63())
		b[i] = a[i]
	}
	return a, b
}

func GetArrayUint8() ([]uint8, []uint8) {
	a := make([]uint8, vector_len)
	b := make([]uint8, vector_len)
	for i := 0; i < vector_len; i++ {
		a[i] = uint8(rand.Int63())
		b[i] = a[i]
	}
	return a, b
}

func GetArrayUint8WithLen(len int) ([]uint8, []uint8) {
	a := make([]uint8, len)
	b := make([]uint8, len)
	for i := 0; i < len; i++ {
		a[i] = uint8(rand.Int63())
		b[i] = a[i]
	}
	return a, b
}

func TestAsmSum(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, b := GetArrayInt64()
		c, d := vectorSum(a), AsmVectorSum(b)
		fmt.Printf("test asm sum, go %d, asm %d\n", c, d)
		assert.Equal(t, c, d)
	}
}

func TestAsmMax(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, b := GetArrayInt64()
		c, d := vectorMax(a), AsmVectorMax(b)
		fmt.Printf("test asm max, go %d, asm %d\n", c, d)
		assert.Equal(t, c, d)
	}
}

func TestAsmMin(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, b := GetArrayInt64()
		c, d := vectorMin(a), AsmVectorMin(b)
		fmt.Printf("test asm min, go %d, asm %d\n", c, d)
		assert.Equal(t, c, d)
	}
}


func TestAsmAnd(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, a1 := GetArrayInt64()
		b, b1 := GetArrayInt64()
		vectorAnd(a, b)
		AsmVectorAnd(a1, b1)
		for i, v := range a {
			assert.Equal(t, v, a1[i])
		}
	}
	a := []int64{0xff,0xff,0xff,0xff}
	b := []int64{1,2,3,4}
	AsmVectorAnd(a, b)
	for i, v := range a {
		assert.Equal(t, v, b[i])
	}
}


func TestAsmAnd2(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, a1 := GetArrayInt64()
		b, b1 := GetArrayInt64()
		c, c1 := GetArrayInt64()
		vectorAnd2(a, b, c)
		AsmVectorAnd2(a1, b1, c1)
		for i, v := range a {
			assert.Equal(t, v, a1[i])
		}
	}
	a := []int64{0xff,0xff,0xff,0xff}
	b := []int64{1,2,3,4}
	c := []int64{1,2,3,4}
	AsmVectorAnd2(a, b, c)
	for i, v := range a {
		assert.Equal(t, v, b[i])
	}
}

func TestAsmAnd4(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, a1 := GetArrayInt64()
		b, b1 := GetArrayInt64()
		c, c1 := GetArrayInt64()
		d, d1 := GetArrayInt64()
		e, e1 := GetArrayInt64()
		vectorAnd4(a, b, c, d, e)
		AsmVectorAnd4(a1, b1, c1, d1,e1)
		for i, v := range a {
			assert.Equal(t, v, a1[i])
		}
	}
	a := []int64{0xff,0xff,0xff,0xff}
	b := []int64{1,2,3,4}
	c := []int64{1,2,3,4}
	d := []int64{1,2,3,4}
	e := []int64{1,2,3,4}
	AsmVectorAnd4(a, b, c, d, e)
	for i, v := range a {
		assert.Equal(t, v, b[i])
	}
}

func TestAsmOr(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, a1 := GetArrayInt64()
		b, b1 := GetArrayInt64()
		vectorOr(a, b)
		AsmVectorOr(a1, b1)
		for i, v := range a {
			assert.Equal(t, v, a1[i])
		}
	}
	b := []int64{0xff,0xff,0xff,0xff}
	a := []int64{1,2,3,4}
	AsmVectorOr(a, b)
	for i, v := range a {
		assert.Equal(t, v, b[i])
	}
}


func TestAsmOr2(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, a1 := GetArrayInt64()
		b, b1 := GetArrayInt64()
		c, c1 := GetArrayInt64()
		vectorOr2(a, b, c)
		AsmVectorOr2(a1, b1, c1)
		for i, v := range a {
			assert.Equal(t, v, a1[i])
		}
	}
	b := []int64{0xff,0xff,0xff,0xff}
	a := []int64{1,2,3,4}
	c := []int64{1,2,3,4}
	AsmVectorOr2(a, b, c)
	for i, v := range a {
		assert.Equal(t, v, b[i])
	}
}

func TestAsmOr4(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, a1 := GetArrayInt64()
		b, b1 := GetArrayInt64()
		c, c1 := GetArrayInt64()
		d, d1 := GetArrayInt64()
		e, e1 := GetArrayInt64()
		vectorOr4(a, b, c, d, e)
		AsmVectorOr4(a1, b1, c1, d1,e1)
		for i, v := range a {
			assert.Equal(t, v, a1[i])
		}
	}
	b := []int64{0xff,0xff,0xff,0xff}
	a := []int64{1,2,3,4}
	c := []int64{1,2,3,4}
	d := []int64{1,2,3,4}
	e := []int64{1,2,3,4}
	AsmVectorOr4(a, b, c, d, e)
	for i, v := range a {
		assert.Equal(t, v, b[i])
	}
}

func TestAsmAndn(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, a1 := GetArrayInt64()
		b, b1 := GetArrayInt64()
		vectorAndn(a, b)
		AsmVectorAndN(a1, b1)
		for i, v := range a {
			assert.Equal(t, v, a1[i])
		}
	}
	a := []int64{0xff,0xff,0xff,0xff}
	b := []int64{1,2,3,4}
	c := []int64{254,253,252,251}
	AsmVectorAndN(a, b)
	for i, v := range a {
		assert.Equal(t, v, c[i])
	}
}

func TestAsmMulti(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, a1 := GetArrayInt64()
		b, b1 := GetArrayInt64()
		vectorMulti(a, b)
		AsmVectorMulti(a1, b1)
		for i, v := range a {
			assert.Equal(t, v, a1[i])
		}
	}
	a := []int64{0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff}
	b := []int64{1,2,3,4,5,6,7,8,9,10}
	c := []int64{0xff,0x1fe,0x2fd,0x3fc,0x4fb,0x5fa,0x6f9,0x7f8,0x8f7,0x9f6}
	AsmVectorMulti(a, b)
	for i, v := range a {
		assert.Equal(t, v, c[i])
	}
}

func TestAsmMemcopy(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, a1 := GetArrayUint8()
		b, b1 := GetArrayUint8()
		memcopy(a, b)
		AsmMemcopy(a1, b1)
		for i, v := range a {
			assert.Equal(t, v, a1[i])
		}
	}
	a := []uint8{0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff}
	b := []uint8{1,2,3,4,5,6,7,8,9,10}
	AsmMemcopy(a, b)
	for i, v := range b {
		assert.Equal(t, v, b[i])
	}
}

func TestAsmMemset(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, a1 := GetArrayUint8()
		b, b1 := uint8(0xff), uint8(0xff)
		memset(a, b)
		AsmMemset(a1, b1)
		for i, v := range a {
			assert.Equal(t, v, a1[i])
		}
	}
	a := []uint8{0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff}
	b := uint8(10)
	AsmMemset(a, b)
	for _, v := range a {
		assert.Equal(t, v, b)
	}
}

func TestAsmBitmapGetBitNum(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, a1 := GetArrayUInt64()
		b, b1 := bitmapGetBitNum(a), AsmBitmapGetBitNum(a1)
		fmt.Printf("test asm bitmap get bit num, go %d, asm %d\n", b, b1)
		assert.Equal(t, b, b1)
	}
	a := []uint64{0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff}
	b := uint64(8*10)
	c := AsmBitmapGetBitNum(a)
	assert.Equal(t, b, c)
}

func TestAsmBitmapGetBitList(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, a1 := GetArrayUInt64()
		b, b1 := make([]uint64, len(a) * 64), make([]uint64, len(a) * 64)
		c, c1 := bitmapGetBitList(a, b), AsmBitmapGetBitList(a1, b1)
		fmt.Printf("test asm bitmap get bit list len, go %d, asm %d\n", c, c1)
		assert.Equal(t, c, c1)
		for j := uint64(0); j < c; j++ {
			assert.Equal(t, b[j], b1[j])
		}
	}
	a := []uint64{0xff,0xff}
	b := []uint64{
		0xff,0xff,0xff,0xff,
		0xff,0xff,0xff,0xff,
		0xff,0xff,0xff,0xff,
		0xff,0xff,0xff,0xff,
	}

	c := []uint64{0,1,2,3,4,5,6,7,64,65,66,67,68,69,70,71}
	d := AsmBitmapGetBitList(a, b)
	assert.Equal(t, d, uint64(16))
	for i, v := range b {
		assert.Equal(t, v, c[i])
	}
}

func TestAsmBkdrHash(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, a1 := "asdfghjklasdfghjkl", "asdfghjklasdfghjkl"
		c, c1 := bkdrHash(a, uint64(i)), AsmBkdrHash(a1, uint64(i))
		fmt.Printf("test asm bitmap get bkdr hash, go %d, asm %d\n", c, c1)
		assert.Equal(t, c, c1)
	}
}

func TestAsmStringAdSum(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, a1 := GetArrayUint8WithLen(64)
		c, c1 := hashStringAdSum(a, bkdrHashIndex, uint64(i)), AsmHashStringAndSum(a1, bkdrHashIndex, uint64(i))
		fmt.Printf("test asm bitmap get bkdr hash, go %d, asm %d\n", c, c1)
		assert.Equal(t, c, c1)
	}
}


func TestAsmBitmapOneBitMasl(t *testing.T) {
	for i := 0; i < 4; i++ {
		a, a1 := GetArrayUInt64()
		c, c1 := GetArrayUInt64()
		AsmBitmapBitOneMask(a, c)
		bitmapBitOneMask(a1, c1)
		for j, v := range a {
			assert.Equal(t, v, a1[j])
		}
	}
	a := []uint64{0xff,0xff}
	c := []uint64{0x33}
	AsmBitmapBitOneMask(a, c)
	assert.Equal(t, a[0], uint64(0x33))
	assert.Equal(t, a[1], uint64(0x00))
}