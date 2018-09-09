package goasm

import (
	"testing"
)

func BenchmarkGoSum(b *testing.B) {
	for i := 0; i < b.N; i++ {
		vectorSum(sInt64)
	}
}

func BenchmarkAsmSum(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmVectorSum(sInt64)
	}
}

func BenchmarkGoMax(b *testing.B) {
	for i := 0; i < b.N; i++ {
		vectorMax(sInt64)
	}
}

func BenchmarkAsmMax(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmVectorMax(sInt64)
	}
}

func BenchmarkGoMin(b *testing.B) {
	for i := 0; i < b.N; i++ {
		vectorMin(sInt64)
	}
}

func BenchmarkAsmMin(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmVectorMin(sInt64)
	}
}

func BenchmarkGoAnd(b *testing.B) {
	for i := 0; i < b.N; i++ {
		vectorAnd(sInt64, sInt64_1)
	}
}

func BenchmarkAsmAnd(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmVectorAnd(sInt64, sInt64_1)
	}
}

func BenchmarkGoAnd2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		vectorAnd2(sInt64, sInt64_1, sInt64_2)
	}
}

func BenchmarkGoAnd2_1(b *testing.B) {
	for i := 0; i < b.N; i++ {
		vectorAnd(sInt64, sInt64_1)
		vectorAnd(sInt64, sInt64_2)
	}
}

func BenchmarkAsmAnd2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmVectorAnd2(sInt64, sInt64_1, sInt64_2)
	}
}

func BenchmarkGoAnd4(b *testing.B) {
	for i := 0; i < b.N; i++ {
		vectorAnd4(sInt64, sInt64_1, sInt64_2, sInt64_3, sInt64_4)
	}
}

func BenchmarkGoAnd4_1(b *testing.B) {
	for i := 0; i < b.N; i++ {
		vectorAnd(sInt64, sInt64_1)
		vectorAnd(sInt64, sInt64_2)
		vectorAnd(sInt64, sInt64_3)
		vectorAnd(sInt64, sInt64_4)
	}
}

func BenchmarkAsmAnd4(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmVectorAnd4(sInt64, sInt64_1, sInt64_2, sInt64_3, sInt64_4)
	}
}

func BenchmarkGoOr(b *testing.B) {
	for i := 0; i < b.N; i++ {
		vectorOr(sInt64, sInt64_1)
	}
}

func BenchmarkAsmOr(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmVectorOr(sInt64, sInt64_1)
	}
}

func BenchmarkGoOr2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		vectorOr2(sInt64, sInt64_1, sInt64_2)
	}
}

func BenchmarkGoOr2_1(b *testing.B) {
	for i := 0; i < b.N; i++ {
		vectorOr(sInt64, sInt64_1)
		vectorOr(sInt64, sInt64_2)
	}
}

func BenchmarkAsmOr2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmVectorOr2(sInt64, sInt64_1, sInt64_2)
	}
}

func BenchmarkGoOr4(b *testing.B) {
	for i := 0; i < b.N; i++ {
		vectorOr4(sInt64, sInt64_1, sInt64_2, sInt64_3, sInt64_4)
	}
}

func BenchmarkGoOr4_1(b *testing.B) {
	for i := 0; i < b.N; i++ {
		vectorOr(sInt64, sInt64_1)
		vectorOr(sInt64, sInt64_2)
		vectorOr(sInt64, sInt64_3)
		vectorOr(sInt64, sInt64_4)
	}
}

func BenchmarkAsmOr4(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmVectorOr4(sInt64, sInt64_1, sInt64_2, sInt64_3, sInt64_4)
	}
}

func BenchmarkGoAndn(b *testing.B) {
	for i := 0; i < b.N; i++ {
		vectorAndn(sInt64, sInt64_1)
	}
}

func BenchmarkAsmAndn(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmVectorAndN(sInt64, sInt64_1)
	}
}

func BenchmarkGoMulti(b *testing.B) {
	for i := 0; i < b.N; i++ {
		vectorMulti(sInt64, sInt64_1)
	}
}

func BenchmarkAsmMulti(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmVectorMulti(sInt64, sInt64_1)
	}
}

func BenchmarkGoMemcopy(b *testing.B) {
	for i := 0; i < b.N; i++ {
		memcopy(sUint8, sUint8_1)
	}
}

func BenchmarkAsmMemcopy(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmMemcopy(sUint8, sUint8_1)
	}
}

func BenchmarkGoMemcopyUint64(b *testing.B) {
	for i := 0; i < b.N; i++ {
		memcopy_uint64(s0, s7)
	}
}

func BenchmarkAsmMemcopyUint64(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmMemcopyUint64(s0, s7)
	}
}

func BenchmarkGoMemset(b *testing.B) {
	for i := 0; i < b.N; i++ {
		memset(sUint8, 0x12)
	}
}

func BenchmarkGoMemset1(b *testing.B) {
	for i := 0; i < b.N; i++ {
		memset1(sUint8, 0x12)
	}
}

func BenchmarkAsmMemset(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmMemset(sUint8, 0x12)
	}
}

func BenchmarkGoBitmapGetBitNum(b *testing.B) {
	for i := 0; i < b.N; i++ {
		bitmapGetBitNum(s0)
	}
}

func BenchmarkAsmBitmapGetBitNum(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmBitmapGetBitNum(s0)
	}
}

func BenchmarkGoBitmapGetBitList(b *testing.B) {
	for i := 0; i < b.N; i++ {
		bitmapGetBitList(s0, tmp)
	}
}

func BenchmarkAsmBitmapGetBitList(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmBitmapGetBitList(s0, tmp_1)
	}
}

func BenchmarkGoBkdrHash(b *testing.B) {
	for i := 0; i < b.N; i++ {
		bkdrHash("1234567890asdfghjklqwertyuiopzxcvbnm,1234567890e`1567890-122121212", uint64(i))
	}
}

func BenchmarkAsmBkdrHash(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmBkdrHash("1234567890asdfghjklqwertyuiopzxcvbnm,1234567890e`1567890-122121212", uint64(i))
	}
}

func BenchmarkGoStringAdSum(b *testing.B) {
	for i := 0; i < b.N; i++ {
		hashStringAdSum(sHashUint8, bkdrHashIndex, uint64(i))

	}
}

func BenchmarkAsmStringAdSum(b *testing.B) {
	for i := 0; i < b.N; i++ {
		AsmHashStringAndSum(sHashUint8_1, bkdrHashIndex, uint64(i))
	}
}