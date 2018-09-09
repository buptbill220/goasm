package goasm

import (
	"unsafe"
)

//go:noescape
func _asm_sum_sse4_2(addr unsafe.Pointer, len int64) (ret int64)
//go:noescape
func _asm_max_sse4_2(addr unsafe.Pointer, len int64) (ret int64)
//go:noescape
func _asm_min_sse4_2(addr unsafe.Pointer, len int64) (ret int64)
//go:noescape
func _asm_multi_sse4_2(addr unsafe.Pointer, addr1 unsafe.Pointer, len int64)
//go:noescape
func _asm_and_sse4_2(addr unsafe.Pointer, addr1 unsafe.Pointer, len int64)
//go:noescape
func _asm_and2_sse4_2(addr unsafe.Pointer, addr1 unsafe.Pointer, addr2 unsafe.Pointer, len int64)
//go:noescape
func _asm_and4_sse4_2(addr unsafe.Pointer, addr1 unsafe.Pointer, addr2 unsafe.Pointer, addr3 unsafe.Pointer, addr4 unsafe.Pointer, len int64)
//go:noescape
func _asm_or_sse4_2(addr unsafe.Pointer, addr1 unsafe.Pointer, len int64)
//go:noescape
func _asm_or2_sse4_2(addr unsafe.Pointer, addr1 unsafe.Pointer, addr2 unsafe.Pointer, len int64)
//go:noescape
func _asm_or4_sse4_2(addr unsafe.Pointer, addr1 unsafe.Pointer, addr2 unsafe.Pointer, addr3 unsafe.Pointer, addr4 unsafe.Pointer, len int64)
//go:noescape
func _asm_andn_sse4_2(addr unsafe.Pointer, addr1 unsafe.Pointer, len int64)
//go:noescape
func _asm_memcopy_sse4_2(addr unsafe.Pointer, addr1 unsafe.Pointer, len int64)
//go:noescape
func _asm_memcopy_uint64_sse4_2(addr unsafe.Pointer, addr1 unsafe.Pointer, len int64)
//go:noescape
func _asm_memset_sse4_2(addr unsafe.Pointer, v uint8, len int64)
//go:noescape
func _asm_bitmap_get_bit_num_sse4_2(addr unsafe.Pointer, len int64) (ret uint64)
//go:noescape
func _asm_bkdr_hash_sse4_2(addr unsafe.Pointer,len int64, seed uint64) (ret uint64)
//go:noescape
func _asm_multi_and_sum_sse4_2(addr unsafe.Pointer, addr1 unsafe.Pointer, len  int64, seed uint64) (ret uint64)
//go:noescape
func _asm_bitmap_get_bit_list_sse4_2(addr unsafe.Pointer, addr1 unsafe.Pointer, addr2 unsafe.Pointer, len int64) (ret uint64)

func asm_sum_sse4_2(v []int64) (int64) {
	x := (*slice)(unsafe.Pointer(&v))
	return _asm_sum_sse4_2(x.addr, x.len)
}

func asm_max_sse4_2(v []int64) (int64) {
	x := (*slice)(unsafe.Pointer(&v))
	return _asm_max_sse4_2(x.addr, x.len)
}

func asm_min_sse4_2(v []int64) (int64) {
	x := (*slice)(unsafe.Pointer(&v))
	return _asm_min_sse4_2(x.addr, x.len)
}

func asm_multi_sse4_2(v []int64, v1 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	_asm_multi_sse4_2(x.addr, y.addr, x.len)
}

func asm_and_sse4_2(v []int64, v1 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	_asm_and_sse4_2(x.addr, y.addr, x.len)
}

func asm_and2_sse4_2(v []int64, v1 []int64, v2 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	z := (*slice)(unsafe.Pointer(&v2))
	_asm_and2_sse4_2(x.addr, y.addr, z.addr, x.len)
}

func asm_and4_sse4_2(v, v1, v2, v3, v4 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	z := (*slice)(unsafe.Pointer(&v2))
	a := (*slice)(unsafe.Pointer(&v3))
	b := (*slice)(unsafe.Pointer(&v4))
	_asm_and4_sse4_2(x.addr, y.addr, z.addr, a.addr, b.addr, x.len)
}

func asm_or_sse4_2(v []int64, v1 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	_asm_or_sse4_2(x.addr, y.addr, x.len)
}

func asm_or2_sse4_2(v []int64, v1 []int64, v2 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	z := (*slice)(unsafe.Pointer(&v2))
	_asm_or2_sse4_2(x.addr, y.addr, z.addr, x.len)
}

func asm_or4_sse4_2(v, v1, v2, v3, v4 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	z := (*slice)(unsafe.Pointer(&v2))
	a := (*slice)(unsafe.Pointer(&v3))
	b := (*slice)(unsafe.Pointer(&v4))
	_asm_or4_sse4_2(x.addr, y.addr, z.addr, a.addr, b.addr, x.len)
}

func asm_andn_sse4_2(v []int64, v1 []int64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	_asm_andn_sse4_2(x.addr, y.addr, x.len)
}

func asm_memcopy_sse4_2(v []uint8, v1 []uint8) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	_asm_memcopy_sse4_2(x.addr, y.addr, x.len)
}

func asm_memcopy_uint64_sse4_2(v []uint64, v1 []uint64) {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	_asm_memcopy_uint64_sse4_2(x.addr, y.addr, x.len)
}

func asm_memset_sse4_2(v []uint8, v1 uint8) {
	x := (*slice)(unsafe.Pointer(&v))
	_asm_memset_sse4_2(x.addr, v1, x.len)
}

func asm_bitmap_get_bit_num_sse4_2(v []uint64) uint64 {
	x := (*slice)(unsafe.Pointer(&v))
	return _asm_bitmap_get_bit_num_sse4_2(x.addr, x.len)
}

func asm_bkdr_hash_sse4_2(str string, seed uint64) uint64 {
	x := (*strslice)(unsafe.Pointer(&str))
	return _asm_bkdr_hash_sse4_2(x.addr, x.len, seed)
}

func asm_multi_and_sum_sse4_2(v[]uint8, v1 []uint64, seed uint64) uint64 {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	return _asm_multi_and_sum_sse4_2(x.addr, y.addr, x.len, seed)
}

func asm_bitmap_get_bit_list_sse4_2(v, v1 []uint64) uint64 {
	x := (*slice)(unsafe.Pointer(&v))
	y := (*slice)(unsafe.Pointer(&v1))
	return _asm_bitmap_get_bit_list_sse4_2(x.addr, y.addr, deBruijn64tabSlice.addr, x.len)
}