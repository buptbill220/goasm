package goasm

import (
	"unsafe"
)

//go:noescape
func _asm_sum_avx(addr unsafe.Pointer, len int64) (ret int64)
//go:noescape
func _asm_max_avx(addr unsafe.Pointer, len int64) (ret int64)
//go:noescape
func _asm_min_avx(addr unsafe.Pointer, len int64) (ret int64)
//go:noescape
func _asm_multi_avx(addr unsafe.Pointer, addr1 unsafe.Pointer, len int64)
//go:noescape
func _asm_and_avx(addr unsafe.Pointer, addr1 unsafe.Pointer, len int64)
//go:noescape
func _asm_and2_avx(addr unsafe.Pointer, addr1 unsafe.Pointer, addr2 unsafe.Pointer, len int64)
//go:noescape
func _asm_and4_avx(addr unsafe.Pointer, addr1 unsafe.Pointer, addr2 unsafe.Pointer, addr3 unsafe.Pointer, addr4 unsafe.Pointer, len int64)
//go:noescape
func _asm_or_avx(addr unsafe.Pointer, addr1 unsafe.Pointer, len int64)
//go:noescape
func _asm_or2_avx(addr unsafe.Pointer, addr1 unsafe.Pointer, addr2 unsafe.Pointer, len int64)
//go:noescape
func _asm_or4_avx(addr unsafe.Pointer, addr1 unsafe.Pointer, addr2 unsafe.Pointer, addr3 unsafe.Pointer, addr4 unsafe.Pointer, len int64)
//go:noescape
func _asm_andn_avx(addr unsafe.Pointer, addr1 unsafe.Pointer, len int64)
//go:noescape
func _asm_memcopy_avx(addr unsafe.Pointer, addr1 unsafe.Pointer, len int64)
//go:noescape
func _asm_memcopy_uint64_avx(addr unsafe.Pointer, addr1 unsafe.Pointer, len int64)
//go:noescape
func _asm_memset_avx(addr unsafe.Pointer, v uint8, len int64)
//go:noescape
func _asm_bitmap_get_bit_num_avx(addr unsafe.Pointer, len int64) (ret uint64)
//go:noescape
func _asm_bkdr_hash_avx(addr unsafe.Pointer,len int64, seed uint64) (ret uint64)
//go:noescape
func _asm_multi_and_sum_avx(addr unsafe.Pointer, addr1 unsafe.Pointer, len  int64, seed uint64) (ret uint64)
//go:noescape
func _asm_bitmap_get_bit_list_avx(addr unsafe.Pointer, addr1 unsafe.Pointer, addr2 unsafe.Pointer, len int64) (ret uint64)
//go:noescape
func _asm_bitmap_bit_one_mask_avx(addr unsafe.Pointer, addr1 unsafe.Pointer, len int64)

func asm_sum_avx(v []int64) (int64) {
	x := (*slice)(unsafe.Pointer(&v))
	return _asm_sum_avx(x.addr, x.len)
}

func asm_max_avx(v []int64) (int64) {
	x := (*slice)(unsafe.Pointer(&v))
	return _asm_max_avx(x.addr, x.len)
}

func asm_min_avx(v []int64) (int64) {
	x := (*slice)(unsafe.Pointer(&v))
	return _asm_min_avx(x.addr, x.len)
}

func asm_multi_avx(v []int64, v1 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	_asm_multi_avx(x.addr, y.addr, x.len)
}

func asm_and_avx(v []int64, v1 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	_asm_and_avx(x.addr, y.addr, x.len)
}

func asm_and2_avx(v []int64, v1 []int64, v2 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	z := (*slice)(unsafe.Pointer(&v2))
	_asm_and2_avx(x.addr, y.addr, z.addr, x.len)
}

func asm_and4_avx(v, v1, v2, v3, v4 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	z := (*slice)(unsafe.Pointer(&v2))
	a := (*slice)(unsafe.Pointer(&v3))
	b := (*slice)(unsafe.Pointer(&v4))
	_asm_and4_avx(x.addr, y.addr, z.addr, a.addr, b.addr, x.len)
}

func asm_or_avx(v []int64, v1 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	_asm_or_avx(x.addr, y.addr, x.len)
}

func asm_or2_avx(v []int64, v1 []int64, v2 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	z := (*slice)(unsafe.Pointer(&v2))
	_asm_or2_avx(x.addr, y.addr, z.addr, x.len)
}

func asm_or4_avx(v, v1, v2, v3, v4 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	z := (*slice)(unsafe.Pointer(&v2))
	a := (*slice)(unsafe.Pointer(&v3))
	b := (*slice)(unsafe.Pointer(&v4))
	_asm_or4_avx(x.addr, y.addr, z.addr, a.addr, b.addr, x.len)
}

func asm_andn_avx(v []int64, v1 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	_asm_andn_avx(x.addr, y.addr, x.len)
}

func asm_memcopy_avx(v []uint8, v1 []uint8) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	_asm_memcopy_avx(x.addr, y.addr, x.len)
}

func asm_memcopy_uint64_avx(v []uint64, v1 []uint64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	_asm_memcopy_uint64_avx(x.addr, y.addr, x.len)
}

func asm_memset_avx(v []uint8, v1 uint8) {
	x := (*slice)(unsafe.Pointer(&v))
	_asm_memset_avx(x.addr, v1, x.len)
}

func asm_bitmap_get_bit_num_avx(v []uint64) uint64 {
	x := (*slice)(unsafe.Pointer(&v))
	return _asm_bitmap_get_bit_num_avx(x.addr, x.len)
}

func asm_bkdr_hash_avx(str string, seed uint64) uint64 {
	x := (*strslice)(unsafe.Pointer(&str))
	return _asm_bkdr_hash_avx(x.addr, x.len, seed)
}

func asm_multi_and_sum_avx(v[]uint8, v1 []uint64, seed uint64) uint64 {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	return _asm_multi_and_sum_avx(x.addr, y.addr, x.len, seed)
}

func asm_bitmap_get_bit_list_avx(v, v1 []uint64) uint64 {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	return _asm_bitmap_get_bit_list_avx(x.addr, y.addr, deBruijn64tabSlice.addr, x.len)
}

func asm_bitmap_bit_one_mask_avx(v, v1 []uint64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	_asm_bitmap_bit_one_mask_avx(x.addr, y.addr, x.len)
}