#include <stdint.h>
#include <immintrin.h>
//#include <avx2intrin.h>
//#include <avx512vlintrin.h>

#if defined ENABLE_AVX512
#define NAME(x) x##_avx512
#elif defined ENABLE_AVX2
#define NAME(x) x##_avx2
#elif defined ENABLE_AVX
#define NAME(x) x##_avx
#elif defined ENABLE_SSE4_2
#define NAME(x) x##_sse4_2
#endif

#define ALIGN(x) x __attribute__((aligned(64)))
static const uint64_t deBruijn64 = 0x03f79d71b4ca8b09;

// type int[8]__m256i
// type int[4]__m256i

int64_t NAME(asm_sum)(int64_t *beg, int64_t len) {
    int64_t sum = 0;
    int64_t *end = beg + len;
    while (beg < end) {
        sum += *beg++;
    }
    return sum;
}

int64_t NAME(asm_max)(int64_t *beg, int64_t len) {
	if (len == 0) {
        return 0;
    }
    int64_t max = 0x8000000000000000;
    int64_t *end = beg + len;
    while (beg < end) {
        if (*beg > max) {
            max = *beg;
        }
        beg++;
    }
    return max;
}

int64_t NAME(asm_min)(int64_t *beg, int64_t len) {
    if (len == 0) {
        return 0;
    }
    int64_t min = 0x7FFFFFFFFFFFFFFF;
    int64_t *end = beg + len;
    while (beg < end) {
        if (*beg < min) {
            min = *beg;
        }
        beg++;
    }
    return min;
}

void NAME(asm_multi)(int64_t *a, int64_t *b, int64_t len) {
    int64_t *end = a + len;
    while (a < end) {
        *a++ *= *b++;
    }
}

void NAME(asm_and)(int64_t *a, int64_t *b, int64_t len) {
    int64_t *end = a + len;
    while (a < end) {
        *a++ &= *b++;
    }
}

void NAME(asm_and2)(int64_t *a, int64_t *b, int64_t *c, int64_t len) {
    int64_t *end = a + len;
    while (a < end) {
        *a++ &= (*b++) & (*c++);
    }
}

void NAME(asm_and4)(int64_t *a, int64_t *b, int64_t *c, int64_t *d, int64_t *e, int64_t len) {
    int64_t *end = a + len;
    while (a < end) {
        *a++ &= (*b++) & (*c++) & (*d++) & (*e++);
    }
}

void NAME(asm_or)(int64_t *a, int64_t *b, int64_t len) {
    int64_t *end = a + len;
    while (a < end) {
        *a++ |= *b++;
    }
}

void NAME(asm_or2)(int64_t *a, int64_t *b, int64_t *c, int64_t len) {
    int64_t *end = a + len;
    while (a < end) {
        *a++ |= (*b++) | (*c++);
    }
}

void NAME(asm_or4)(int64_t *a, int64_t *b, int64_t *c, int64_t *d, int64_t *e, int64_t len) {
    int64_t *end = a + len;
    while (a < end) {
        *a++ |= (*b++) | (*c++) | (*d++) | (*e++);
    }
}

void NAME(asm_andn)(int64_t *a, int64_t *b, int64_t len) {
    int64_t *end = a + len;
    while (a < end) {
        *a++ &= ~(*b++);
    }
}

void NAME(asm_memcopy)(uint8_t *a, uint8_t *b, int64_t len) {
    uint8_t *end = a + len;
    while (a < end) {
        *a++ = *b++;
    }
}

void NAME(asm_memset)(uint8_t *a, uint8_t v, int64_t len) {
    uint8_t *end = a + len;
    while (a < end) {
        *a++ = v;
    }
}

uint64_t NAME(asm_bitmap_get_bit_num)(uint64_t *a, int64_t len) {
    uint64_t *end = a + len;
    uint64_t ret_len = 0;
    uint64_t tmp = 0;
    while (a < end) {
        tmp = *a++;
        while(tmp) {
            tmp = tmp & (tmp - 1);
            ++ret_len;
        }
    }
    return ret_len;
}

uint64_t NAME(asm_bkdr_hash) (uint8_t *a, int64_t len, uint64_t seed) {
    uint8_t *end = a + len;
    uint64_t hash = seed;
    while(a < end) {
        hash = hash * 1313131 + *a++;
    }
    return hash;
}

// 可用于hash
uint64_t NAME(asm_multi_and_sum)(uint8_t *a, uint64_t *b, int64_t len, uint64_t seed) {
    uint64_t sum = 0;
    uint8_t *end = a + len;
    while (a < end) {
        sum += (*a++) * (*b++);
    }
    sum += seed * (*--b);
    return sum;
}

static const uint8_t deBruijn64tab[64] = {
	0, 1, 56, 2, 57, 49, 28, 3, 61, 58, 42, 50, 38, 29, 17, 4,
	62, 47, 59, 36, 45, 43, 51, 22, 53, 39, 33, 30, 24, 18, 12, 5,
	63, 55, 48, 27, 60, 41, 37, 16, 46, 35, 44, 21, 52, 32, 23, 11,
	54, 26, 40, 15, 34, 20, 31, 10, 25, 14, 19, 9, 13, 8, 7, 6
};

uint64_t NAME(asm_bitmap_get_bit_list)(uint64_t *a, uint64_t *b, uint8_t* deBruijn64tab, int64_t len) {
    uint64_t *end = a + len;
    uint64_t ret_len = 0;
    uint64_t tmp = 0;
    uint64_t base = 0;
    uint64_t pos = 0;
    while (a < end) {
        tmp = *a++;
        while(tmp) {
            //__asm__ ("TZCNT %1,%0" : "=r" (pos) : "m" (tmp));
            pos = (uint64_t)deBruijn64tab[(tmp&-tmp)*deBruijn64>>58];
            *b++ = pos + base;
            tmp = tmp & (tmp - 1);
            ++ret_len;
        }
        base += 64;
    }
    return ret_len;
}