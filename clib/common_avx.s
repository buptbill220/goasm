	.text
	.intel_syntax noprefix
	.file	"clib/common.c"
	.globl	asm_sum_avx
	.p2align	4, 0x90
	.type	asm_sum_avx,@function
asm_sum_avx:                            # @asm_sum_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rsi, rsi
	jle	.LBB0_1
# BB#2:
	lea	rcx, [rdi + 8*rsi]
	lea	rax, [rdi + 8]
	cmp	rcx, rax
	cmova	rax, rcx
	mov	rdx, rdi
	not	rdx
	add	rdx, rax
	shr	rdx, 3
	inc	rdx
	cmp	rdx, 8
	jae	.LBB0_4
# BB#3:
	xor	eax, eax
	jmp	.LBB0_14
.LBB0_1:
	xor	eax, eax
	jmp	.LBB0_15
.LBB0_4:
	movabs	r9, 4611686018427387896
	and	r9, rdx
	je	.LBB0_5
# BB#6:
	lea	rsi, [r9 - 8]
	mov	rax, rsi
	shr	rax, 3
	bt	rsi, 3
	jb	.LBB0_7
# BB#8:
	vmovdqu	xmm0, xmmword ptr [rdi]
	vmovdqu	xmm1, xmmword ptr [rdi + 16]
	vmovdqu	xmm2, xmmword ptr [rdi + 32]
	vmovdqu	xmm3, xmmword ptr [rdi + 48]
	mov	r8d, 8
	jmp	.LBB0_9
.LBB0_5:
	xor	eax, eax
	jmp	.LBB0_14
.LBB0_7:
	vpxor	xmm0, xmm0, xmm0
	xor	r8d, r8d
	vpxor	xmm1, xmm1, xmm1
	vpxor	xmm2, xmm2, xmm2
	vpxor	xmm3, xmm3, xmm3
.LBB0_9:
	test	rax, rax
	je	.LBB0_12
# BB#10:
	mov	rax, r9
	sub	rax, r8
	lea	rsi, [rdi + 8*r8 + 112]
	.p2align	4, 0x90
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	vpaddq	xmm0, xmm0, xmmword ptr [rsi - 112]
	vpaddq	xmm1, xmm1, xmmword ptr [rsi - 96]
	vpaddq	xmm2, xmm2, xmmword ptr [rsi - 80]
	vpaddq	xmm3, xmm3, xmmword ptr [rsi - 64]
	vpaddq	xmm0, xmm0, xmmword ptr [rsi - 48]
	vpaddq	xmm1, xmm1, xmmword ptr [rsi - 32]
	vpaddq	xmm2, xmm2, xmmword ptr [rsi - 16]
	vpaddq	xmm3, xmm3, xmmword ptr [rsi]
	sub	rsi, -128
	add	rax, -16
	jne	.LBB0_11
.LBB0_12:
	vpaddq	xmm0, xmm0, xmm2
	vpaddq	xmm1, xmm1, xmm3
	vpaddq	xmm0, xmm0, xmm1
	vpshufd	xmm1, xmm0, 78          # xmm1 = xmm0[2,3,0,1]
	vpaddq	xmm0, xmm0, xmm1
	vmovq	rax, xmm0
	cmp	rdx, r9
	je	.LBB0_15
# BB#13:
	lea	rdi, [rdi + 8*r9]
	.p2align	4, 0x90
.LBB0_14:                               # =>This Inner Loop Header: Depth=1
	add	rax, qword ptr [rdi]
	add	rdi, 8
	cmp	rdi, rcx
	jb	.LBB0_14
.LBB0_15:
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end0:
	.size	asm_sum_avx, .Lfunc_end0-asm_sum_avx

	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI1_0:
	.quad	-9223372036854775808    # 0x8000000000000000
	.quad	-9223372036854775808    # 0x8000000000000000
	.quad	-9223372036854775808    # 0x8000000000000000
	.quad	-9223372036854775808    # 0x8000000000000000
	.text
	.globl	asm_max_avx
	.p2align	4, 0x90
	.type	asm_max_avx,@function
asm_max_avx:                            # @asm_max_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rsi, rsi
	je	.LBB1_1
# BB#2:
	movabs	rax, -9223372036854775808
	jle	.LBB1_14
# BB#3:
	lea	rcx, [rdi + 8*rsi]
	lea	rsi, [rdi + 8]
	cmp	rcx, rsi
	cmova	rsi, rcx
	mov	rdx, rdi
	not	rdx
	add	rdx, rsi
	shr	rdx, 3
	inc	rdx
	cmp	rdx, 16
	jb	.LBB1_13
# BB#4:
	movabs	r8, 4611686018427387888
	and	r8, rdx
	je	.LBB1_13
# BB#5:
	lea	rsi, [r8 - 16]
	mov	rax, rsi
	shr	rax, 4
	bt	rsi, 4
	jb	.LBB1_6
# BB#7:
	vmovups	ymm9, ymmword ptr [rdi]
	vmovups	ymm12, ymmword ptr [rdi + 32]
	vmovups	ymm11, ymmword ptr [rdi + 64]
	vmovups	ymm8, ymmword ptr [rdi + 96]
	mov	esi, 16
	jmp	.LBB1_8
.LBB1_1:
	xor	eax, eax
	jmp	.LBB1_14
.LBB1_6:
	vmovaps	ymm9, ymmword ptr [rip + .LCPI1_0] # ymm9 = [9223372036854775808,9223372036854775808,9223372036854775808,9223372036854775808]
	xor	esi, esi
	vmovaps	ymm12, ymm9
	vmovaps	ymm11, ymm9
	vmovaps	ymm8, ymm9
.LBB1_8:
	test	rax, rax
	je	.LBB1_11
# BB#9:
	mov	rax, r8
	sub	rax, rsi
	lea	rsi, [rdi + 8*rsi + 224]
	.p2align	4, 0x90
.LBB1_10:                               # =>This Inner Loop Header: Depth=1
	vmovups	ymm4, ymmword ptr [rsi - 224]
	vmovups	ymm5, ymmword ptr [rsi - 192]
	vmovups	ymm6, ymmword ptr [rsi - 160]
	vmovups	ymm7, ymmword ptr [rsi - 128]
	vextractf128	xmm0, ymm9, 1
	vextractf128	xmm1, ymm4, 1
	vpcmpgtq	xmm0, xmm1, xmm0
	vpcmpgtq	xmm1, xmm4, xmm9
	vinsertf128	ymm10, ymm1, xmm0, 1
	vextractf128	xmm1, ymm12, 1
	vextractf128	xmm0, ymm5, 1
	vpcmpgtq	xmm0, xmm0, xmm1
	vpcmpgtq	xmm1, xmm5, xmm12
	vinsertf128	ymm0, ymm1, xmm0, 1
	vextractf128	xmm1, ymm11, 1
	vextractf128	xmm2, ymm6, 1
	vpcmpgtq	xmm1, xmm2, xmm1
	vpcmpgtq	xmm2, xmm6, xmm11
	vinsertf128	ymm2, ymm2, xmm1, 1
	vextractf128	xmm1, ymm8, 1
	vextractf128	xmm3, ymm7, 1
	vpcmpgtq	xmm1, xmm3, xmm1
	vpcmpgtq	xmm3, xmm7, xmm8
	vinsertf128	ymm13, ymm3, xmm1, 1
	vblendvpd	ymm9, ymm9, ymm4, ymm10
	vblendvpd	ymm3, ymm12, ymm5, ymm0
	vblendvpd	ymm2, ymm11, ymm6, ymm2
	vblendvpd	ymm8, ymm8, ymm7, ymm13
	vmovups	ymm4, ymmword ptr [rsi - 96]
	vmovups	ymm5, ymmword ptr [rsi - 64]
	vmovups	ymm6, ymmword ptr [rsi - 32]
	vmovups	ymm7, ymmword ptr [rsi]
	vextractf128	xmm0, ymm9, 1
	vextractf128	xmm1, ymm4, 1
	vpcmpgtq	xmm0, xmm1, xmm0
	vpcmpgtq	xmm1, xmm4, xmm9
	vinsertf128	ymm10, ymm1, xmm0, 1
	vextractf128	xmm1, ymm3, 1
	vextractf128	xmm0, ymm5, 1
	vpcmpgtq	xmm0, xmm0, xmm1
	vpcmpgtq	xmm1, xmm5, xmm3
	vinsertf128	ymm11, ymm1, xmm0, 1
	vextractf128	xmm1, ymm2, 1
	vextractf128	xmm0, ymm6, 1
	vpcmpgtq	xmm0, xmm0, xmm1
	vpcmpgtq	xmm1, xmm6, xmm2
	vinsertf128	ymm13, ymm1, xmm0, 1
	vextractf128	xmm1, ymm8, 1
	vextractf128	xmm0, ymm7, 1
	vpcmpgtq	xmm0, xmm0, xmm1
	vpcmpgtq	xmm1, xmm7, xmm8
	vinsertf128	ymm0, ymm1, xmm0, 1
	vblendvpd	ymm9, ymm9, ymm4, ymm10
	vblendvpd	ymm12, ymm3, ymm5, ymm11
	vblendvpd	ymm11, ymm2, ymm6, ymm13
	vblendvpd	ymm8, ymm8, ymm7, ymm0
	add	rsi, 256
	add	rax, -32
	jne	.LBB1_10
.LBB1_11:
	vextractf128	xmm0, ymm12, 1
	vextractf128	xmm1, ymm9, 1
	vpcmpgtq	xmm0, xmm1, xmm0
	vpcmpgtq	xmm1, xmm9, xmm12
	vinsertf128	ymm0, ymm1, xmm0, 1
	vblendvpd	ymm0, ymm12, ymm9, ymm0
	vextractf128	xmm1, ymm0, 1
	vextractf128	xmm2, ymm11, 1
	vpcmpgtq	xmm1, xmm1, xmm2
	vpcmpgtq	xmm2, xmm0, xmm11
	vinsertf128	ymm1, ymm2, xmm1, 1
	vblendvpd	ymm0, ymm11, ymm0, ymm1
	vextractf128	xmm1, ymm0, 1
	vextractf128	xmm2, ymm8, 1
	vpcmpgtq	xmm1, xmm1, xmm2
	vpcmpgtq	xmm2, xmm0, xmm8
	vinsertf128	ymm1, ymm2, xmm1, 1
	vblendvpd	ymm0, ymm8, ymm0, ymm1
	vextractf128	xmm1, ymm0, 1
	vpcmpgtq	xmm2, xmm0, xmm1
	vpcmpgtq	xmm3, xmm1, xmm0
	vinsertf128	ymm2, ymm2, xmm3, 1
	vblendvpd	ymm0, ymm1, ymm0, ymm2
	vpshufd	xmm1, xmm0, 78          # xmm1 = xmm0[2,3,0,1]
	vpcmpgtq	xmm1, xmm0, xmm1
	vextractf128	xmm2, ymm0, 1
	vpcmpgtq	xmm2, xmm2, xmm0
	vpacksswb	xmm1, xmm1, xmm2
	vpextrb	esi, xmm1, 0
	vmovq	r9, xmm0
	vpextrq	rax, xmm0, 1
	test	sil, 1
	cmovne	rax, r9
	cmp	rdx, r8
	je	.LBB1_14
# BB#12:
	lea	rdi, [rdi + 8*r8]
	.p2align	4, 0x90
.LBB1_13:                               # =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rdi]
	cmp	rdx, rax
	cmovge	rax, rdx
	add	rdi, 8
	cmp	rdi, rcx
	jb	.LBB1_13
.LBB1_14:
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
.Lfunc_end1:
	.size	asm_max_avx, .Lfunc_end1-asm_max_avx

	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI2_0:
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.text
	.globl	asm_min_avx
	.p2align	4, 0x90
	.type	asm_min_avx,@function
asm_min_avx:                            # @asm_min_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rsi, rsi
	je	.LBB2_1
# BB#2:
	movabs	rax, 9223372036854775807
	jle	.LBB2_14
# BB#3:
	lea	rcx, [rdi + 8*rsi]
	lea	rsi, [rdi + 8]
	cmp	rcx, rsi
	cmova	rsi, rcx
	mov	rdx, rdi
	not	rdx
	add	rdx, rsi
	shr	rdx, 3
	inc	rdx
	cmp	rdx, 16
	jb	.LBB2_13
# BB#4:
	movabs	r8, 4611686018427387888
	and	r8, rdx
	je	.LBB2_13
# BB#5:
	lea	rsi, [r8 - 16]
	mov	rax, rsi
	shr	rax, 4
	bt	rsi, 4
	jb	.LBB2_6
# BB#7:
	vmovups	ymm9, ymmword ptr [rdi]
	vmovups	ymm12, ymmword ptr [rdi + 32]
	vmovups	ymm11, ymmword ptr [rdi + 64]
	vmovups	ymm8, ymmword ptr [rdi + 96]
	mov	esi, 16
	jmp	.LBB2_8
.LBB2_1:
	xor	eax, eax
	jmp	.LBB2_14
.LBB2_6:
	vmovaps	ymm9, ymmword ptr [rip + .LCPI2_0] # ymm9 = [9223372036854775807,9223372036854775807,9223372036854775807,9223372036854775807]
	xor	esi, esi
	vmovaps	ymm12, ymm9
	vmovaps	ymm11, ymm9
	vmovaps	ymm8, ymm9
.LBB2_8:
	test	rax, rax
	je	.LBB2_11
# BB#9:
	mov	rax, r8
	sub	rax, rsi
	lea	rsi, [rdi + 8*rsi + 224]
	.p2align	4, 0x90
.LBB2_10:                               # =>This Inner Loop Header: Depth=1
	vmovups	ymm4, ymmword ptr [rsi - 224]
	vmovups	ymm5, ymmword ptr [rsi - 192]
	vmovups	ymm6, ymmword ptr [rsi - 160]
	vmovups	ymm7, ymmword ptr [rsi - 128]
	vextractf128	xmm0, ymm9, 1
	vextractf128	xmm1, ymm4, 1
	vpcmpgtq	xmm0, xmm0, xmm1
	vpcmpgtq	xmm1, xmm9, xmm4
	vinsertf128	ymm10, ymm1, xmm0, 1
	vextractf128	xmm1, ymm12, 1
	vextractf128	xmm0, ymm5, 1
	vpcmpgtq	xmm0, xmm1, xmm0
	vpcmpgtq	xmm1, xmm12, xmm5
	vinsertf128	ymm0, ymm1, xmm0, 1
	vextractf128	xmm1, ymm11, 1
	vextractf128	xmm2, ymm6, 1
	vpcmpgtq	xmm1, xmm1, xmm2
	vpcmpgtq	xmm2, xmm11, xmm6
	vinsertf128	ymm2, ymm2, xmm1, 1
	vextractf128	xmm1, ymm8, 1
	vextractf128	xmm3, ymm7, 1
	vpcmpgtq	xmm1, xmm1, xmm3
	vpcmpgtq	xmm3, xmm8, xmm7
	vinsertf128	ymm13, ymm3, xmm1, 1
	vblendvpd	ymm9, ymm9, ymm4, ymm10
	vblendvpd	ymm3, ymm12, ymm5, ymm0
	vblendvpd	ymm2, ymm11, ymm6, ymm2
	vblendvpd	ymm8, ymm8, ymm7, ymm13
	vmovups	ymm4, ymmword ptr [rsi - 96]
	vmovups	ymm5, ymmword ptr [rsi - 64]
	vmovups	ymm6, ymmword ptr [rsi - 32]
	vmovups	ymm7, ymmword ptr [rsi]
	vextractf128	xmm0, ymm9, 1
	vextractf128	xmm1, ymm4, 1
	vpcmpgtq	xmm0, xmm0, xmm1
	vpcmpgtq	xmm1, xmm9, xmm4
	vinsertf128	ymm10, ymm1, xmm0, 1
	vextractf128	xmm1, ymm3, 1
	vextractf128	xmm0, ymm5, 1
	vpcmpgtq	xmm0, xmm1, xmm0
	vpcmpgtq	xmm1, xmm3, xmm5
	vinsertf128	ymm11, ymm1, xmm0, 1
	vextractf128	xmm1, ymm2, 1
	vextractf128	xmm0, ymm6, 1
	vpcmpgtq	xmm0, xmm1, xmm0
	vpcmpgtq	xmm1, xmm2, xmm6
	vinsertf128	ymm13, ymm1, xmm0, 1
	vextractf128	xmm1, ymm8, 1
	vextractf128	xmm0, ymm7, 1
	vpcmpgtq	xmm0, xmm1, xmm0
	vpcmpgtq	xmm1, xmm8, xmm7
	vinsertf128	ymm0, ymm1, xmm0, 1
	vblendvpd	ymm9, ymm9, ymm4, ymm10
	vblendvpd	ymm12, ymm3, ymm5, ymm11
	vblendvpd	ymm11, ymm2, ymm6, ymm13
	vblendvpd	ymm8, ymm8, ymm7, ymm0
	add	rsi, 256
	add	rax, -32
	jne	.LBB2_10
.LBB2_11:
	vextractf128	xmm0, ymm9, 1
	vextractf128	xmm1, ymm12, 1
	vpcmpgtq	xmm0, xmm1, xmm0
	vpcmpgtq	xmm1, xmm12, xmm9
	vinsertf128	ymm0, ymm1, xmm0, 1
	vblendvpd	ymm0, ymm12, ymm9, ymm0
	vextractf128	xmm1, ymm0, 1
	vextractf128	xmm2, ymm11, 1
	vpcmpgtq	xmm1, xmm2, xmm1
	vpcmpgtq	xmm2, xmm11, xmm0
	vinsertf128	ymm1, ymm2, xmm1, 1
	vblendvpd	ymm0, ymm11, ymm0, ymm1
	vextractf128	xmm1, ymm0, 1
	vextractf128	xmm2, ymm8, 1
	vpcmpgtq	xmm1, xmm2, xmm1
	vpcmpgtq	xmm2, xmm8, xmm0
	vinsertf128	ymm1, ymm2, xmm1, 1
	vblendvpd	ymm0, ymm8, ymm0, ymm1
	vextractf128	xmm1, ymm0, 1
	vpcmpgtq	xmm2, xmm1, xmm0
	vpcmpgtq	xmm3, xmm0, xmm1
	vinsertf128	ymm2, ymm2, xmm3, 1
	vblendvpd	ymm0, ymm1, ymm0, ymm2
	vpshufd	xmm1, xmm0, 78          # xmm1 = xmm0[2,3,0,1]
	vpcmpgtq	xmm1, xmm1, xmm0
	vextractf128	xmm2, ymm0, 1
	vpcmpgtq	xmm2, xmm0, xmm2
	vpacksswb	xmm1, xmm1, xmm2
	vpextrb	esi, xmm1, 0
	vmovq	r9, xmm0
	vpextrq	rax, xmm0, 1
	test	sil, 1
	cmovne	rax, r9
	cmp	rdx, r8
	je	.LBB2_14
# BB#12:
	lea	rdi, [rdi + 8*r8]
	.p2align	4, 0x90
.LBB2_13:                               # =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rdi]
	cmp	rdx, rax
	cmovle	rax, rdx
	add	rdi, 8
	cmp	rdi, rcx
	jb	.LBB2_13
.LBB2_14:
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
.Lfunc_end2:
	.size	asm_min_avx, .Lfunc_end2-asm_min_avx

	.globl	asm_multi_avx
	.p2align	4, 0x90
	.type	asm_multi_avx,@function
asm_multi_avx:                          # @asm_multi_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rdx, rdx
	jle	.LBB3_6
# BB#1:
	lea	rax, [rdi + 8*rdx]
	lea	rdx, [rdi + 8]
	cmp	rax, rdx
	cmova	rdx, rax
	mov	r8, rdi
	not	r8
	add	r8, rdx
	mov	edx, r8d
	shr	edx, 3
	inc	edx
	and	rdx, 3
	je	.LBB3_4
# BB#2:
	neg	rdx
	.p2align	4, 0x90
.LBB3_3:                                # =>This Inner Loop Header: Depth=1
	mov	rcx, qword ptr [rdi]
	imul	rcx, qword ptr [rsi]
	add	rsi, 8
	mov	qword ptr [rdi], rcx
	lea	rdi, [rdi + 8]
	inc	rdx
	jne	.LBB3_3
.LBB3_4:
	cmp	r8, 24
	jb	.LBB3_6
	.p2align	4, 0x90
.LBB3_5:                                # =>This Inner Loop Header: Depth=1
	mov	rcx, qword ptr [rdi]
	imul	rcx, qword ptr [rsi]
	mov	qword ptr [rdi], rcx
	mov	rcx, qword ptr [rdi + 8]
	imul	rcx, qword ptr [rsi + 8]
	mov	qword ptr [rdi + 8], rcx
	mov	rcx, qword ptr [rdi + 16]
	imul	rcx, qword ptr [rsi + 16]
	mov	qword ptr [rdi + 16], rcx
	mov	rcx, qword ptr [rdi + 24]
	imul	rcx, qword ptr [rsi + 24]
	mov	qword ptr [rdi + 24], rcx
	add	rdi, 32
	add	rsi, 32
	cmp	rdi, rax
	jb	.LBB3_5
.LBB3_6:
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end3:
	.size	asm_multi_avx, .Lfunc_end3-asm_multi_avx

	.globl	asm_and_avx
	.p2align	4, 0x90
	.type	asm_and_avx,@function
asm_and_avx:                            # @asm_and_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rdx, rdx
	jle	.LBB4_14
# BB#1:
	lea	r8, [rdi + 8*rdx]
	lea	rcx, [rdi + 8]
	cmp	r8, rcx
	mov	r10, rcx
	cmova	r10, r8
	mov	rax, rdi
	not	rax
	add	r10, rax
	shr	r10, 3
	inc	r10
	cmp	r10, 16
	jb	.LBB4_2
# BB#3:
	movabs	r9, 4611686018427387888
	and	r9, r10
	je	.LBB4_2
# BB#4:
	cmp	r8, rcx
	cmova	rcx, r8
	add	rcx, rax
	and	rcx, -8
	lea	rax, [rsi + rcx + 8]
	cmp	rax, rdi
	jbe	.LBB4_6
# BB#5:
	lea	rax, [rdi + rcx + 8]
	cmp	rax, rsi
	jbe	.LBB4_6
.LBB4_2:
	mov	rcx, rdi
	mov	rdx, rsi
.LBB4_9:
	lea	rsi, [rcx + 8]
	cmp	r8, rsi
	cmova	rsi, r8
	mov	rax, rcx
	not	rax
	add	rax, rsi
	mov	esi, eax
	shr	esi, 3
	inc	esi
	and	rsi, 3
	je	.LBB4_12
# BB#10:
	neg	rsi
	.p2align	4, 0x90
.LBB4_11:                               # =>This Inner Loop Header: Depth=1
	mov	rdi, qword ptr [rdx]
	add	rdx, 8
	and	qword ptr [rcx], rdi
	add	rcx, 8
	inc	rsi
	jne	.LBB4_11
.LBB4_12:
	cmp	rax, 24
	jb	.LBB4_14
	.p2align	4, 0x90
.LBB4_13:                               # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rdx]
	and	qword ptr [rcx], rax
	mov	rax, qword ptr [rdx + 8]
	and	qword ptr [rcx + 8], rax
	mov	rax, qword ptr [rdx + 16]
	and	qword ptr [rcx + 16], rax
	mov	rax, qword ptr [rdx + 24]
	and	qword ptr [rcx + 24], rax
	add	rcx, 32
	add	rdx, 32
	cmp	rcx, r8
	jb	.LBB4_13
.LBB4_14:
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
.LBB4_6:
	lea	rcx, [rdi + 8*r9]
	lea	rdx, [rsi + 8*r9]
	add	rsi, 96
	add	rdi, 96
	mov	rax, r9
	.p2align	4, 0x90
.LBB4_7:                                # =>This Inner Loop Header: Depth=1
	vmovups	ymm0, ymmword ptr [rdi - 96]
	vmovups	ymm1, ymmword ptr [rdi - 64]
	vmovups	ymm2, ymmword ptr [rdi - 32]
	vmovups	ymm3, ymmword ptr [rdi]
	vandps	ymm0, ymm0, ymmword ptr [rsi - 96]
	vandps	ymm1, ymm1, ymmword ptr [rsi - 64]
	vandps	ymm2, ymm2, ymmword ptr [rsi - 32]
	vandps	ymm3, ymm3, ymmword ptr [rsi]
	vmovups	ymmword ptr [rdi - 96], ymm0
	vmovups	ymmword ptr [rdi - 64], ymm1
	vmovups	ymmword ptr [rdi - 32], ymm2
	vmovups	ymmword ptr [rdi], ymm3
	sub	rsi, -128
	sub	rdi, -128
	add	rax, -16
	jne	.LBB4_7
# BB#8:
	cmp	r10, r9
	jne	.LBB4_9
	jmp	.LBB4_14
.Lfunc_end4:
	.size	asm_and_avx, .Lfunc_end4-asm_and_avx

	.globl	asm_and2_avx
	.p2align	4, 0x90
	.type	asm_and2_avx,@function
asm_and2_avx:                           # @asm_and2_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	push	rbx
	and	rsp, -8
	test	rcx, rcx
	jle	.LBB5_14
# BB#1:
	lea	r8, [rdi + 8*rcx]
	lea	rax, [rdi + 8]
	cmp	r8, rax
	mov	r10, rax
	cmova	r10, r8
	mov	rcx, rdi
	not	rcx
	add	r10, rcx
	shr	r10, 3
	inc	r10
	cmp	r10, 16
	jb	.LBB5_2
# BB#3:
	movabs	r11, 4611686018427387888
	and	r11, r10
	je	.LBB5_2
# BB#4:
	cmp	r8, rax
	cmova	rax, r8
	add	rax, rcx
	and	rax, -8
	lea	rcx, [rdi + rax + 8]
	lea	rbx, [rsi + rax + 8]
	lea	r9, [rdx + rax + 8]
	cmp	rdi, rbx
	sbb	al, al
	cmp	rsi, rcx
	sbb	bl, bl
	and	bl, al
	cmp	rdi, r9
	sbb	al, al
	cmp	rdx, rcx
	sbb	cl, cl
	test	bl, 1
	jne	.LBB5_2
# BB#5:
	and	al, cl
	and	al, 1
	jne	.LBB5_2
# BB#6:
	lea	rcx, [rdi + 8*r11]
	lea	r9, [rsi + 8*r11]
	lea	rax, [rdx + 8*r11]
	add	rdx, 96
	add	rsi, 96
	add	rdi, 96
	mov	rbx, r11
	.p2align	4, 0x90
.LBB5_7:                                # =>This Inner Loop Header: Depth=1
	vmovups	ymm0, ymmword ptr [rdx - 96]
	vmovups	ymm1, ymmword ptr [rdx - 64]
	vmovups	ymm2, ymmword ptr [rdx - 32]
	vmovups	ymm3, ymmword ptr [rdx]
	vandps	ymm0, ymm0, ymmword ptr [rsi - 96]
	vandps	ymm1, ymm1, ymmword ptr [rsi - 64]
	vandps	ymm2, ymm2, ymmword ptr [rsi - 32]
	vandps	ymm3, ymm3, ymmword ptr [rsi]
	vandps	ymm0, ymm0, ymmword ptr [rdi - 96]
	vandps	ymm1, ymm1, ymmword ptr [rdi - 64]
	vandps	ymm2, ymm2, ymmword ptr [rdi - 32]
	vandps	ymm3, ymm3, ymmword ptr [rdi]
	vmovups	ymmword ptr [rdi - 96], ymm0
	vmovups	ymmword ptr [rdi - 64], ymm1
	vmovups	ymmword ptr [rdi - 32], ymm2
	vmovups	ymmword ptr [rdi], ymm3
	sub	rdx, -128
	sub	rsi, -128
	sub	rdi, -128
	add	rbx, -16
	jne	.LBB5_7
# BB#8:
	cmp	r10, r11
	jne	.LBB5_9
	jmp	.LBB5_14
.LBB5_2:
	mov	rcx, rdi
	mov	r9, rsi
	mov	rax, rdx
.LBB5_9:
	lea	rsi, [rcx + 8]
	cmp	r8, rsi
	cmova	rsi, r8
	mov	rdx, rcx
	not	rdx
	add	rdx, rsi
	mov	esi, edx
	shr	esi, 3
	inc	esi
	and	rsi, 3
	je	.LBB5_12
# BB#10:
	neg	rsi
	.p2align	4, 0x90
.LBB5_11:                               # =>This Inner Loop Header: Depth=1
	mov	rdi, qword ptr [rax]
	add	rax, 8
	and	rdi, qword ptr [r9]
	add	r9, 8
	and	qword ptr [rcx], rdi
	add	rcx, 8
	inc	rsi
	jne	.LBB5_11
.LBB5_12:
	cmp	rdx, 24
	jb	.LBB5_14
	.p2align	4, 0x90
.LBB5_13:                               # =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rax]
	and	rdx, qword ptr [r9]
	and	qword ptr [rcx], rdx
	mov	rdx, qword ptr [rax + 8]
	and	rdx, qword ptr [r9 + 8]
	and	qword ptr [rcx + 8], rdx
	mov	rdx, qword ptr [rax + 16]
	and	rdx, qword ptr [r9 + 16]
	and	qword ptr [rcx + 16], rdx
	mov	rdx, qword ptr [rax + 24]
	and	rdx, qword ptr [r9 + 24]
	and	qword ptr [rcx + 24], rdx
	add	rcx, 32
	add	r9, 32
	add	rax, 32
	cmp	rcx, r8
	jb	.LBB5_13
.LBB5_14:
	lea	rsp, [rbp - 8]
	pop	rbx
	pop	rbp
	vzeroupper
	ret
.Lfunc_end5:
	.size	asm_and2_avx, .Lfunc_end5-asm_and2_avx

	.globl	asm_and4_avx
	.p2align	4, 0x90
	.type	asm_and4_avx,@function
asm_and4_avx:                           # @asm_and4_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	and	rsp, -8
	sub	rsp, 24
	test	r9, r9
	jle	.LBB6_16
# BB#1:
	lea	r9, [rdi + 8*r9]
	lea	rax, [rdi + 8]
	cmp	r9, rax
	mov	r15, rax
	cmova	r15, r9
	mov	rbx, rdi
	not	rbx
	add	r15, rbx
	shr	r15, 3
	inc	r15
	cmp	r15, 16
	jb	.LBB6_2
# BB#3:
	movabs	r10, 4611686018427387888
	and	r10, r15
	je	.LBB6_2
# BB#4:
	mov	qword ptr [rsp + 8], r10 # 8-byte Spill
	cmp	r9, rax
	cmova	rax, r9
	add	rax, rbx
	and	rax, -8
	lea	r12, [rdi + rax + 8]
	lea	r10, [rsi + rax + 8]
	lea	r11, [rdx + rax + 8]
	lea	r14, [rcx + rax + 8]
	lea	rax, [r8 + rax + 8]
	mov	qword ptr [rsp + 16], rax # 8-byte Spill
	cmp	rdi, r10
	sbb	al, al
	cmp	rsi, r12
	sbb	r13b, r13b
	and	r13b, al
	cmp	rdi, r11
	sbb	al, al
	cmp	rdx, r12
	sbb	bl, bl
	mov	byte ptr [rsp + 7], bl  # 1-byte Spill
	cmp	rdi, r14
	sbb	r11b, r11b
	cmp	rcx, r12
	sbb	r14b, r14b
	cmp	rdi, qword ptr [rsp + 16] # 8-byte Folded Reload
	sbb	r10b, r10b
	cmp	r8, r12
	sbb	bl, bl
	test	r13b, 1
	jne	.LBB6_2
# BB#5:
	and	al, byte ptr [rsp + 7]  # 1-byte Folded Reload
	and	al, 1
	jne	.LBB6_2
# BB#6:
	and	r11b, r14b
	and	r11b, 1
	jne	.LBB6_2
# BB#7:
	and	r10b, bl
	and	r10b, 1
	jne	.LBB6_2
# BB#8:
	mov	r12, qword ptr [rsp + 8] # 8-byte Reload
	lea	r14, [rdi + 8*r12]
	lea	r10, [rsi + 8*r12]
	lea	r11, [r8 + 8*r12]
	lea	rax, [rcx + 8*r12]
	lea	rbx, [rdx + 8*r12]
	add	rdx, 96
	add	rcx, 96
	add	r8, 96
	add	rsi, 96
	add	rdi, 96
	mov	r13, r12
	.p2align	4, 0x90
.LBB6_9:                                # =>This Inner Loop Header: Depth=1
	vmovups	ymm0, ymmword ptr [rdx - 96]
	vmovups	ymm1, ymmword ptr [rdx - 64]
	vmovups	ymm2, ymmword ptr [rdx - 32]
	vmovups	ymm3, ymmword ptr [rdx]
	vandps	ymm0, ymm0, ymmword ptr [rsi - 96]
	vandps	ymm1, ymm1, ymmword ptr [rsi - 64]
	vandps	ymm2, ymm2, ymmword ptr [rsi - 32]
	vandps	ymm3, ymm3, ymmword ptr [rsi]
	vandps	ymm0, ymm0, ymmword ptr [rcx - 96]
	vandps	ymm1, ymm1, ymmword ptr [rcx - 64]
	vandps	ymm2, ymm2, ymmword ptr [rcx - 32]
	vandps	ymm3, ymm3, ymmword ptr [rcx]
	vandps	ymm0, ymm0, ymmword ptr [r8 - 96]
	vandps	ymm1, ymm1, ymmword ptr [r8 - 64]
	vandps	ymm2, ymm2, ymmword ptr [r8 - 32]
	vandps	ymm3, ymm3, ymmword ptr [r8]
	vandps	ymm0, ymm0, ymmword ptr [rdi - 96]
	vandps	ymm1, ymm1, ymmword ptr [rdi - 64]
	vandps	ymm2, ymm2, ymmword ptr [rdi - 32]
	vandps	ymm3, ymm3, ymmword ptr [rdi]
	vmovups	ymmword ptr [rdi - 96], ymm0
	vmovups	ymmword ptr [rdi - 64], ymm1
	vmovups	ymmword ptr [rdi - 32], ymm2
	vmovups	ymmword ptr [rdi], ymm3
	sub	rdx, -128
	sub	rcx, -128
	sub	r8, -128
	sub	rsi, -128
	sub	rdi, -128
	add	r13, -16
	jne	.LBB6_9
# BB#10:
	cmp	r15, r12
	jne	.LBB6_11
	jmp	.LBB6_16
.LBB6_2:
	mov	r14, rdi
	mov	r10, rsi
	mov	r11, r8
	mov	rax, rcx
	mov	rbx, rdx
.LBB6_11:
	lea	rcx, [r14 + 8]
	cmp	r9, rcx
	mov	rdx, rcx
	cmova	rdx, r9
	mov	rsi, r14
	not	rsi
	add	rsi, rdx
	mov	rdx, rsi
	shr	rdx, 3
	bt	rsi, 3
	jb	.LBB6_12
# BB#13:
	mov	rsi, qword ptr [rbx]
	add	rbx, 8
	and	rsi, qword ptr [r10]
	add	r10, 8
	and	rsi, qword ptr [rax]
	add	rax, 8
	and	rsi, qword ptr [r11]
	add	r11, 8
	and	qword ptr [r14], rsi
	jmp	.LBB6_14
.LBB6_12:
	mov	rcx, r14
.LBB6_14:
	test	rdx, rdx
	je	.LBB6_16
	.p2align	4, 0x90
.LBB6_15:                               # =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rbx]
	and	rdx, qword ptr [r10]
	and	rdx, qword ptr [rax]
	and	rdx, qword ptr [r11]
	and	qword ptr [rcx], rdx
	mov	rdx, qword ptr [rbx + 8]
	and	rdx, qword ptr [r10 + 8]
	and	rdx, qword ptr [rax + 8]
	and	rdx, qword ptr [r11 + 8]
	and	qword ptr [rcx + 8], rdx
	add	rcx, 16
	add	r10, 16
	add	rbx, 16
	add	rax, 16
	add	r11, 16
	cmp	rcx, r9
	jb	.LBB6_15
.LBB6_16:
	lea	rsp, [rbp - 40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
.Lfunc_end6:
	.size	asm_and4_avx, .Lfunc_end6-asm_and4_avx

	.globl	asm_or_avx
	.p2align	4, 0x90
	.type	asm_or_avx,@function
asm_or_avx:                             # @asm_or_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rdx, rdx
	jle	.LBB7_14
# BB#1:
	lea	r8, [rdi + 8*rdx]
	lea	rcx, [rdi + 8]
	cmp	r8, rcx
	mov	r10, rcx
	cmova	r10, r8
	mov	rax, rdi
	not	rax
	add	r10, rax
	shr	r10, 3
	inc	r10
	cmp	r10, 16
	jb	.LBB7_2
# BB#3:
	movabs	r9, 4611686018427387888
	and	r9, r10
	je	.LBB7_2
# BB#4:
	cmp	r8, rcx
	cmova	rcx, r8
	add	rcx, rax
	and	rcx, -8
	lea	rax, [rsi + rcx + 8]
	cmp	rax, rdi
	jbe	.LBB7_6
# BB#5:
	lea	rax, [rdi + rcx + 8]
	cmp	rax, rsi
	jbe	.LBB7_6
.LBB7_2:
	mov	rcx, rdi
	mov	rdx, rsi
.LBB7_9:
	lea	rsi, [rcx + 8]
	cmp	r8, rsi
	cmova	rsi, r8
	mov	rax, rcx
	not	rax
	add	rax, rsi
	mov	esi, eax
	shr	esi, 3
	inc	esi
	and	rsi, 3
	je	.LBB7_12
# BB#10:
	neg	rsi
	.p2align	4, 0x90
.LBB7_11:                               # =>This Inner Loop Header: Depth=1
	mov	rdi, qword ptr [rdx]
	add	rdx, 8
	or	qword ptr [rcx], rdi
	add	rcx, 8
	inc	rsi
	jne	.LBB7_11
.LBB7_12:
	cmp	rax, 24
	jb	.LBB7_14
	.p2align	4, 0x90
.LBB7_13:                               # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rdx]
	or	qword ptr [rcx], rax
	mov	rax, qword ptr [rdx + 8]
	or	qword ptr [rcx + 8], rax
	mov	rax, qword ptr [rdx + 16]
	or	qword ptr [rcx + 16], rax
	mov	rax, qword ptr [rdx + 24]
	or	qword ptr [rcx + 24], rax
	add	rcx, 32
	add	rdx, 32
	cmp	rcx, r8
	jb	.LBB7_13
.LBB7_14:
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
.LBB7_6:
	lea	rcx, [rdi + 8*r9]
	lea	rdx, [rsi + 8*r9]
	add	rsi, 96
	add	rdi, 96
	mov	rax, r9
	.p2align	4, 0x90
.LBB7_7:                                # =>This Inner Loop Header: Depth=1
	vmovups	ymm0, ymmword ptr [rdi - 96]
	vmovups	ymm1, ymmword ptr [rdi - 64]
	vmovups	ymm2, ymmword ptr [rdi - 32]
	vmovups	ymm3, ymmword ptr [rdi]
	vorps	ymm0, ymm0, ymmword ptr [rsi - 96]
	vorps	ymm1, ymm1, ymmword ptr [rsi - 64]
	vorps	ymm2, ymm2, ymmword ptr [rsi - 32]
	vorps	ymm3, ymm3, ymmword ptr [rsi]
	vmovups	ymmword ptr [rdi - 96], ymm0
	vmovups	ymmword ptr [rdi - 64], ymm1
	vmovups	ymmword ptr [rdi - 32], ymm2
	vmovups	ymmword ptr [rdi], ymm3
	sub	rsi, -128
	sub	rdi, -128
	add	rax, -16
	jne	.LBB7_7
# BB#8:
	cmp	r10, r9
	jne	.LBB7_9
	jmp	.LBB7_14
.Lfunc_end7:
	.size	asm_or_avx, .Lfunc_end7-asm_or_avx

	.globl	asm_or2_avx
	.p2align	4, 0x90
	.type	asm_or2_avx,@function
asm_or2_avx:                            # @asm_or2_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	push	rbx
	and	rsp, -8
	test	rcx, rcx
	jle	.LBB8_14
# BB#1:
	lea	r8, [rdi + 8*rcx]
	lea	rax, [rdi + 8]
	cmp	r8, rax
	mov	r10, rax
	cmova	r10, r8
	mov	rcx, rdi
	not	rcx
	add	r10, rcx
	shr	r10, 3
	inc	r10
	cmp	r10, 16
	jb	.LBB8_2
# BB#3:
	movabs	r11, 4611686018427387888
	and	r11, r10
	je	.LBB8_2
# BB#4:
	cmp	r8, rax
	cmova	rax, r8
	add	rax, rcx
	and	rax, -8
	lea	rcx, [rdi + rax + 8]
	lea	rbx, [rsi + rax + 8]
	lea	r9, [rdx + rax + 8]
	cmp	rdi, rbx
	sbb	al, al
	cmp	rsi, rcx
	sbb	bl, bl
	and	bl, al
	cmp	rdi, r9
	sbb	al, al
	cmp	rdx, rcx
	sbb	cl, cl
	test	bl, 1
	jne	.LBB8_2
# BB#5:
	and	al, cl
	and	al, 1
	jne	.LBB8_2
# BB#6:
	lea	rcx, [rdi + 8*r11]
	lea	r9, [rsi + 8*r11]
	lea	rax, [rdx + 8*r11]
	add	rdx, 96
	add	rsi, 96
	add	rdi, 96
	mov	rbx, r11
	.p2align	4, 0x90
.LBB8_7:                                # =>This Inner Loop Header: Depth=1
	vmovups	ymm0, ymmword ptr [rdx - 96]
	vmovups	ymm1, ymmword ptr [rdx - 64]
	vmovups	ymm2, ymmword ptr [rdx - 32]
	vmovups	ymm3, ymmword ptr [rdx]
	vorps	ymm0, ymm0, ymmword ptr [rsi - 96]
	vorps	ymm1, ymm1, ymmword ptr [rsi - 64]
	vorps	ymm2, ymm2, ymmword ptr [rsi - 32]
	vorps	ymm3, ymm3, ymmword ptr [rsi]
	vorps	ymm0, ymm0, ymmword ptr [rdi - 96]
	vorps	ymm1, ymm1, ymmword ptr [rdi - 64]
	vorps	ymm2, ymm2, ymmword ptr [rdi - 32]
	vorps	ymm3, ymm3, ymmword ptr [rdi]
	vmovups	ymmword ptr [rdi - 96], ymm0
	vmovups	ymmword ptr [rdi - 64], ymm1
	vmovups	ymmword ptr [rdi - 32], ymm2
	vmovups	ymmword ptr [rdi], ymm3
	sub	rdx, -128
	sub	rsi, -128
	sub	rdi, -128
	add	rbx, -16
	jne	.LBB8_7
# BB#8:
	cmp	r10, r11
	jne	.LBB8_9
	jmp	.LBB8_14
.LBB8_2:
	mov	rcx, rdi
	mov	r9, rsi
	mov	rax, rdx
.LBB8_9:
	lea	rsi, [rcx + 8]
	cmp	r8, rsi
	cmova	rsi, r8
	mov	rdx, rcx
	not	rdx
	add	rdx, rsi
	mov	esi, edx
	shr	esi, 3
	inc	esi
	and	rsi, 3
	je	.LBB8_12
# BB#10:
	neg	rsi
	.p2align	4, 0x90
.LBB8_11:                               # =>This Inner Loop Header: Depth=1
	mov	rdi, qword ptr [rax]
	add	rax, 8
	or	rdi, qword ptr [r9]
	add	r9, 8
	or	qword ptr [rcx], rdi
	add	rcx, 8
	inc	rsi
	jne	.LBB8_11
.LBB8_12:
	cmp	rdx, 24
	jb	.LBB8_14
	.p2align	4, 0x90
.LBB8_13:                               # =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rax]
	or	rdx, qword ptr [r9]
	or	qword ptr [rcx], rdx
	mov	rdx, qword ptr [rax + 8]
	or	rdx, qword ptr [r9 + 8]
	or	qword ptr [rcx + 8], rdx
	mov	rdx, qword ptr [rax + 16]
	or	rdx, qword ptr [r9 + 16]
	or	qword ptr [rcx + 16], rdx
	mov	rdx, qword ptr [rax + 24]
	or	rdx, qword ptr [r9 + 24]
	or	qword ptr [rcx + 24], rdx
	add	rcx, 32
	add	r9, 32
	add	rax, 32
	cmp	rcx, r8
	jb	.LBB8_13
.LBB8_14:
	lea	rsp, [rbp - 8]
	pop	rbx
	pop	rbp
	vzeroupper
	ret
.Lfunc_end8:
	.size	asm_or2_avx, .Lfunc_end8-asm_or2_avx

	.globl	asm_or4_avx
	.p2align	4, 0x90
	.type	asm_or4_avx,@function
asm_or4_avx:                            # @asm_or4_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	and	rsp, -8
	sub	rsp, 24
	test	r9, r9
	jle	.LBB9_16
# BB#1:
	lea	r9, [rdi + 8*r9]
	lea	rax, [rdi + 8]
	cmp	r9, rax
	mov	r15, rax
	cmova	r15, r9
	mov	rbx, rdi
	not	rbx
	add	r15, rbx
	shr	r15, 3
	inc	r15
	cmp	r15, 16
	jb	.LBB9_2
# BB#3:
	movabs	r10, 4611686018427387888
	and	r10, r15
	je	.LBB9_2
# BB#4:
	mov	qword ptr [rsp + 8], r10 # 8-byte Spill
	cmp	r9, rax
	cmova	rax, r9
	add	rax, rbx
	and	rax, -8
	lea	r12, [rdi + rax + 8]
	lea	r10, [rsi + rax + 8]
	lea	r11, [rdx + rax + 8]
	lea	r14, [rcx + rax + 8]
	lea	rax, [r8 + rax + 8]
	mov	qword ptr [rsp + 16], rax # 8-byte Spill
	cmp	rdi, r10
	sbb	al, al
	cmp	rsi, r12
	sbb	r13b, r13b
	and	r13b, al
	cmp	rdi, r11
	sbb	al, al
	cmp	rdx, r12
	sbb	bl, bl
	mov	byte ptr [rsp + 7], bl  # 1-byte Spill
	cmp	rdi, r14
	sbb	r11b, r11b
	cmp	rcx, r12
	sbb	r14b, r14b
	cmp	rdi, qword ptr [rsp + 16] # 8-byte Folded Reload
	sbb	r10b, r10b
	cmp	r8, r12
	sbb	bl, bl
	test	r13b, 1
	jne	.LBB9_2
# BB#5:
	and	al, byte ptr [rsp + 7]  # 1-byte Folded Reload
	and	al, 1
	jne	.LBB9_2
# BB#6:
	and	r11b, r14b
	and	r11b, 1
	jne	.LBB9_2
# BB#7:
	and	r10b, bl
	and	r10b, 1
	jne	.LBB9_2
# BB#8:
	mov	r12, qword ptr [rsp + 8] # 8-byte Reload
	lea	r14, [rdi + 8*r12]
	lea	r10, [rsi + 8*r12]
	lea	r11, [r8 + 8*r12]
	lea	rax, [rcx + 8*r12]
	lea	rbx, [rdx + 8*r12]
	add	rdx, 96
	add	rcx, 96
	add	r8, 96
	add	rsi, 96
	add	rdi, 96
	mov	r13, r12
	.p2align	4, 0x90
.LBB9_9:                                # =>This Inner Loop Header: Depth=1
	vmovups	ymm0, ymmword ptr [rdx - 96]
	vmovups	ymm1, ymmword ptr [rdx - 64]
	vmovups	ymm2, ymmword ptr [rdx - 32]
	vmovups	ymm3, ymmword ptr [rdx]
	vorps	ymm0, ymm0, ymmword ptr [rsi - 96]
	vorps	ymm1, ymm1, ymmword ptr [rsi - 64]
	vorps	ymm2, ymm2, ymmword ptr [rsi - 32]
	vorps	ymm3, ymm3, ymmword ptr [rsi]
	vorps	ymm0, ymm0, ymmword ptr [rcx - 96]
	vorps	ymm1, ymm1, ymmword ptr [rcx - 64]
	vorps	ymm2, ymm2, ymmword ptr [rcx - 32]
	vorps	ymm3, ymm3, ymmword ptr [rcx]
	vorps	ymm0, ymm0, ymmword ptr [r8 - 96]
	vorps	ymm1, ymm1, ymmword ptr [r8 - 64]
	vorps	ymm2, ymm2, ymmword ptr [r8 - 32]
	vorps	ymm3, ymm3, ymmword ptr [r8]
	vorps	ymm0, ymm0, ymmword ptr [rdi - 96]
	vorps	ymm1, ymm1, ymmword ptr [rdi - 64]
	vorps	ymm2, ymm2, ymmword ptr [rdi - 32]
	vorps	ymm3, ymm3, ymmword ptr [rdi]
	vmovups	ymmword ptr [rdi - 96], ymm0
	vmovups	ymmword ptr [rdi - 64], ymm1
	vmovups	ymmword ptr [rdi - 32], ymm2
	vmovups	ymmword ptr [rdi], ymm3
	sub	rdx, -128
	sub	rcx, -128
	sub	r8, -128
	sub	rsi, -128
	sub	rdi, -128
	add	r13, -16
	jne	.LBB9_9
# BB#10:
	cmp	r15, r12
	jne	.LBB9_11
	jmp	.LBB9_16
.LBB9_2:
	mov	r14, rdi
	mov	r10, rsi
	mov	r11, r8
	mov	rax, rcx
	mov	rbx, rdx
.LBB9_11:
	lea	rcx, [r14 + 8]
	cmp	r9, rcx
	mov	rdx, rcx
	cmova	rdx, r9
	mov	rsi, r14
	not	rsi
	add	rsi, rdx
	mov	rdx, rsi
	shr	rdx, 3
	bt	rsi, 3
	jb	.LBB9_12
# BB#13:
	mov	rsi, qword ptr [rbx]
	add	rbx, 8
	or	rsi, qword ptr [r10]
	add	r10, 8
	or	rsi, qword ptr [rax]
	add	rax, 8
	or	rsi, qword ptr [r11]
	add	r11, 8
	or	qword ptr [r14], rsi
	jmp	.LBB9_14
.LBB9_12:
	mov	rcx, r14
.LBB9_14:
	test	rdx, rdx
	je	.LBB9_16
	.p2align	4, 0x90
.LBB9_15:                               # =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rbx]
	or	rdx, qword ptr [r10]
	or	rdx, qword ptr [rax]
	or	rdx, qword ptr [r11]
	or	qword ptr [rcx], rdx
	mov	rdx, qword ptr [rbx + 8]
	or	rdx, qword ptr [r10 + 8]
	or	rdx, qword ptr [rax + 8]
	or	rdx, qword ptr [r11 + 8]
	or	qword ptr [rcx + 8], rdx
	add	rcx, 16
	add	r10, 16
	add	rbx, 16
	add	rax, 16
	add	r11, 16
	cmp	rcx, r9
	jb	.LBB9_15
.LBB9_16:
	lea	rsp, [rbp - 40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
.Lfunc_end9:
	.size	asm_or4_avx, .Lfunc_end9-asm_or4_avx

	.globl	asm_andn_avx
	.p2align	4, 0x90
	.type	asm_andn_avx,@function
asm_andn_avx:                           # @asm_andn_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rdx, rdx
	jle	.LBB10_14
# BB#1:
	lea	r8, [rdi + 8*rdx]
	lea	rcx, [rdi + 8]
	cmp	r8, rcx
	mov	r10, rcx
	cmova	r10, r8
	mov	rax, rdi
	not	rax
	add	r10, rax
	shr	r10, 3
	inc	r10
	cmp	r10, 16
	jb	.LBB10_2
# BB#3:
	movabs	r9, 4611686018427387888
	and	r9, r10
	je	.LBB10_2
# BB#4:
	cmp	r8, rcx
	cmova	rcx, r8
	add	rcx, rax
	and	rcx, -8
	lea	rax, [rsi + rcx + 8]
	cmp	rax, rdi
	jbe	.LBB10_6
# BB#5:
	lea	rax, [rdi + rcx + 8]
	cmp	rax, rsi
	jbe	.LBB10_6
.LBB10_2:
	mov	rcx, rdi
	mov	rdx, rsi
.LBB10_9:
	lea	rsi, [rcx + 8]
	cmp	r8, rsi
	cmova	rsi, r8
	mov	rax, rcx
	not	rax
	add	rax, rsi
	mov	esi, eax
	shr	esi, 3
	inc	esi
	and	rsi, 3
	je	.LBB10_12
# BB#10:
	neg	rsi
	.p2align	4, 0x90
.LBB10_11:                              # =>This Inner Loop Header: Depth=1
	mov	rdi, qword ptr [rdx]
	add	rdx, 8
	not	rdi
	and	qword ptr [rcx], rdi
	add	rcx, 8
	inc	rsi
	jne	.LBB10_11
.LBB10_12:
	cmp	rax, 24
	jb	.LBB10_14
	.p2align	4, 0x90
.LBB10_13:                              # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rdx]
	not	rax
	and	qword ptr [rcx], rax
	mov	rax, qword ptr [rdx + 8]
	not	rax
	and	qword ptr [rcx + 8], rax
	mov	rax, qword ptr [rdx + 16]
	not	rax
	and	qword ptr [rcx + 16], rax
	mov	rax, qword ptr [rdx + 24]
	not	rax
	and	qword ptr [rcx + 24], rax
	add	rcx, 32
	add	rdx, 32
	cmp	rcx, r8
	jb	.LBB10_13
.LBB10_14:
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
.LBB10_6:
	lea	rcx, [rdi + 8*r9]
	lea	rdx, [rsi + 8*r9]
	add	rsi, 96
	add	rdi, 96
	mov	rax, r9
	.p2align	4, 0x90
.LBB10_7:                               # =>This Inner Loop Header: Depth=1
	vmovups	ymm0, ymmword ptr [rsi - 96]
	vmovups	ymm1, ymmword ptr [rsi - 64]
	vmovups	ymm2, ymmword ptr [rsi - 32]
	vmovups	ymm3, ymmword ptr [rsi]
	vandnps	ymm0, ymm0, ymmword ptr [rdi - 96]
	vandnps	ymm1, ymm1, ymmword ptr [rdi - 64]
	vandnps	ymm2, ymm2, ymmword ptr [rdi - 32]
	vandnps	ymm3, ymm3, ymmword ptr [rdi]
	vmovups	ymmword ptr [rdi - 96], ymm0
	vmovups	ymmword ptr [rdi - 64], ymm1
	vmovups	ymmword ptr [rdi - 32], ymm2
	vmovups	ymmword ptr [rdi], ymm3
	sub	rsi, -128
	sub	rdi, -128
	add	rax, -16
	jne	.LBB10_7
# BB#8:
	cmp	r10, r9
	jne	.LBB10_9
	jmp	.LBB10_14
.Lfunc_end10:
	.size	asm_andn_avx, .Lfunc_end10-asm_andn_avx

	.globl	asm_memcopy_avx
	.p2align	4, 0x90
	.type	asm_memcopy_avx,@function
asm_memcopy_avx:                        # @asm_memcopy_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rdx, rdx
	jle	.LBB11_14
# BB#1:
	add	rdx, rdi
	lea	rax, [rdi + 1]
	cmp	rdx, rax
	mov	r9, rax
	cmova	r9, rdx
	sub	r9, rdi
	cmp	r9, 128
	jb	.LBB11_13
# BB#2:
	mov	r8, r9
	and	r8, -128
	je	.LBB11_13
# BB#3:
	cmp	rdx, rax
	cmova	rax, rdx
	mov	rcx, rax
	sub	rcx, rdi
	add	rcx, rsi
	cmp	rcx, rdi
	jbe	.LBB11_5
# BB#4:
	cmp	rax, rsi
	ja	.LBB11_13
.LBB11_5:
	lea	rcx, [r8 - 128]
	mov	rax, rcx
	shr	rax, 7
	bt	rcx, 7
	jb	.LBB11_6
# BB#7:
	vmovups	ymm0, ymmword ptr [rsi]
	vmovups	ymm1, ymmword ptr [rsi + 32]
	vmovups	ymm2, ymmword ptr [rsi + 64]
	vmovups	ymm3, ymmword ptr [rsi + 96]
	vmovups	ymmword ptr [rdi], ymm0
	vmovups	ymmword ptr [rdi + 32], ymm1
	vmovups	ymmword ptr [rdi + 64], ymm2
	vmovups	ymmword ptr [rdi + 96], ymm3
	mov	ecx, 128
	jmp	.LBB11_8
.LBB11_6:
	xor	ecx, ecx
.LBB11_8:
	test	rax, rax
	je	.LBB11_11
# BB#9:
	mov	r10, r8
	sub	r10, rcx
	lea	rax, [rsi + rcx + 224]
	lea	rcx, [rdi + rcx + 224]
	.p2align	4, 0x90
.LBB11_10:                              # =>This Inner Loop Header: Depth=1
	vmovups	ymm0, ymmword ptr [rax - 224]
	vmovups	ymm1, ymmword ptr [rax - 192]
	vmovups	ymm2, ymmword ptr [rax - 160]
	vmovups	ymm3, ymmword ptr [rax - 128]
	vmovups	ymmword ptr [rcx - 224], ymm0
	vmovups	ymmword ptr [rcx - 192], ymm1
	vmovups	ymmword ptr [rcx - 160], ymm2
	vmovups	ymmword ptr [rcx - 128], ymm3
	vmovups	ymm0, ymmword ptr [rax - 96]
	vmovups	ymm1, ymmword ptr [rax - 64]
	vmovups	ymm2, ymmword ptr [rax - 32]
	vmovups	ymm3, ymmword ptr [rax]
	vmovups	ymmword ptr [rcx - 96], ymm0
	vmovups	ymmword ptr [rcx - 64], ymm1
	vmovups	ymmword ptr [rcx - 32], ymm2
	vmovups	ymmword ptr [rcx], ymm3
	add	rax, 256
	add	rcx, 256
	add	r10, -256
	jne	.LBB11_10
.LBB11_11:
	cmp	r9, r8
	je	.LBB11_14
# BB#12:
	add	rdi, r8
	add	rsi, r8
	.p2align	4, 0x90
.LBB11_13:                              # =>This Inner Loop Header: Depth=1
	movzx	eax, byte ptr [rsi]
	inc	rsi
	mov	byte ptr [rdi], al
	inc	rdi
	cmp	rdi, rdx
	jb	.LBB11_13
.LBB11_14:
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
.Lfunc_end11:
	.size	asm_memcopy_avx, .Lfunc_end11-asm_memcopy_avx

	.globl	asm_memcopy_uint64_avx
	.p2align	4, 0x90
	.type	asm_memcopy_uint64_avx,@function
asm_memcopy_uint64_avx:                 # @asm_memcopy_uint64_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rdx, rdx
	jle	.LBB12_18
# BB#1:
	lea	r10, [rdi + 8*rdx]
	lea	rax, [rdi + 8]
	cmp	r10, rax
	mov	r9, rax
	cmova	r9, r10
	mov	rcx, rdi
	not	rcx
	add	r9, rcx
	shr	r9, 3
	inc	r9
	cmp	r9, 16
	jb	.LBB12_13
# BB#2:
	movabs	r8, 4611686018427387888
	and	r8, r9
	je	.LBB12_13
# BB#3:
	cmp	r10, rax
	cmova	rax, r10
	add	rax, rcx
	and	rax, -8
	lea	rcx, [rsi + rax + 8]
	cmp	rcx, rdi
	jbe	.LBB12_5
# BB#4:
	lea	rax, [rdi + rax + 8]
	cmp	rax, rsi
	ja	.LBB12_13
.LBB12_5:
	lea	rcx, [r8 - 16]
	mov	rax, rcx
	shr	rax, 4
	bt	rcx, 4
	jb	.LBB12_6
# BB#7:
	vmovups	ymm0, ymmword ptr [rsi]
	vmovups	ymm1, ymmword ptr [rsi + 32]
	vmovups	ymm2, ymmword ptr [rsi + 64]
	vmovups	ymm3, ymmword ptr [rsi + 96]
	vmovups	ymmword ptr [rdi], ymm0
	vmovups	ymmword ptr [rdi + 32], ymm1
	vmovups	ymmword ptr [rdi + 64], ymm2
	vmovups	ymmword ptr [rdi + 96], ymm3
	mov	r11d, 16
	jmp	.LBB12_8
.LBB12_6:
	xor	r11d, r11d
.LBB12_8:
	test	rax, rax
	je	.LBB12_11
# BB#9:
	mov	rdx, r8
	sub	rdx, r11
	lea	rcx, [rsi + 8*r11 + 224]
	lea	rax, [rdi + 8*r11 + 224]
	.p2align	4, 0x90
.LBB12_10:                              # =>This Inner Loop Header: Depth=1
	vmovups	ymm0, ymmword ptr [rcx - 224]
	vmovups	ymm1, ymmword ptr [rcx - 192]
	vmovups	ymm2, ymmword ptr [rcx - 160]
	vmovups	ymm3, ymmword ptr [rcx - 128]
	vmovups	ymmword ptr [rax - 224], ymm0
	vmovups	ymmword ptr [rax - 192], ymm1
	vmovups	ymmword ptr [rax - 160], ymm2
	vmovups	ymmword ptr [rax - 128], ymm3
	vmovups	ymm0, ymmword ptr [rcx - 96]
	vmovups	ymm1, ymmword ptr [rcx - 64]
	vmovups	ymm2, ymmword ptr [rcx - 32]
	vmovups	ymm3, ymmword ptr [rcx]
	vmovups	ymmword ptr [rax - 96], ymm0
	vmovups	ymmword ptr [rax - 64], ymm1
	vmovups	ymmword ptr [rax - 32], ymm2
	vmovups	ymmword ptr [rax], ymm3
	add	rcx, 256
	add	rax, 256
	add	rdx, -32
	jne	.LBB12_10
.LBB12_11:
	cmp	r9, r8
	je	.LBB12_18
# BB#12:
	lea	rdi, [rdi + 8*r8]
	lea	rsi, [rsi + 8*r8]
.LBB12_13:
	lea	rax, [rdi + 8]
	cmp	r10, rax
	cmova	rax, r10
	mov	rcx, rdi
	not	rcx
	add	rcx, rax
	mov	eax, ecx
	shr	eax, 3
	inc	eax
	and	rax, 7
	je	.LBB12_16
# BB#14:
	neg	rax
	.p2align	4, 0x90
.LBB12_15:                              # =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rsi]
	add	rsi, 8
	mov	qword ptr [rdi], rdx
	add	rdi, 8
	inc	rax
	jne	.LBB12_15
.LBB12_16:
	cmp	rcx, 56
	jb	.LBB12_18
	.p2align	4, 0x90
.LBB12_17:                              # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rsi]
	mov	qword ptr [rdi], rax
	mov	rax, qword ptr [rsi + 8]
	mov	qword ptr [rdi + 8], rax
	mov	rax, qword ptr [rsi + 16]
	mov	qword ptr [rdi + 16], rax
	mov	rax, qword ptr [rsi + 24]
	mov	qword ptr [rdi + 24], rax
	mov	rax, qword ptr [rsi + 32]
	mov	qword ptr [rdi + 32], rax
	mov	rax, qword ptr [rsi + 40]
	mov	qword ptr [rdi + 40], rax
	mov	rax, qword ptr [rsi + 48]
	mov	qword ptr [rdi + 48], rax
	mov	rax, qword ptr [rsi + 56]
	mov	qword ptr [rdi + 56], rax
	add	rdi, 64
	add	rsi, 64
	cmp	rdi, r10
	jb	.LBB12_17
.LBB12_18:
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
.Lfunc_end12:
	.size	asm_memcopy_uint64_avx, .Lfunc_end12-asm_memcopy_uint64_avx

	.globl	asm_memset_avx
	.p2align	4, 0x90
	.type	asm_memset_avx,@function
asm_memset_avx:                         # @asm_memset_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rdx, rdx
	jle	.LBB13_13
# BB#1:
	add	rdx, rdi
	lea	r11, [rdi + 1]
	cmp	rdx, r11
	cmova	r11, rdx
	sub	r11, rdi
	cmp	r11, 128
	jb	.LBB13_12
# BB#2:
	mov	r8, r11
	and	r8, -128
	mov	r10, r11
	and	r10, -128
	je	.LBB13_12
# BB#3:
	movzx	eax, sil
	vmovd	xmm0, eax
	vpxor	xmm1, xmm1, xmm1
	vpshufb	xmm0, xmm0, xmm1
	vinsertf128	ymm0, ymm0, xmm0, 1
	lea	r9, [r10 - 128]
	mov	eax, r9d
	shr	eax, 7
	inc	eax
	and	rax, 3
	je	.LBB13_4
# BB#5:
	neg	rax
	xor	ecx, ecx
	.p2align	4, 0x90
.LBB13_6:                               # =>This Inner Loop Header: Depth=1
	vmovups	ymmword ptr [rdi + rcx], ymm0
	vmovups	ymmword ptr [rdi + rcx + 32], ymm0
	vmovups	ymmword ptr [rdi + rcx + 64], ymm0
	vmovups	ymmword ptr [rdi + rcx + 96], ymm0
	sub	rcx, -128
	inc	rax
	jne	.LBB13_6
	jmp	.LBB13_7
.LBB13_4:
	xor	ecx, ecx
.LBB13_7:
	cmp	r9, 384
	jb	.LBB13_10
# BB#8:
	mov	rax, r10
	sub	rax, rcx
	lea	rcx, [rdi + rcx + 480]
	.p2align	4, 0x90
.LBB13_9:                               # =>This Inner Loop Header: Depth=1
	vmovups	ymmword ptr [rcx - 480], ymm0
	vmovups	ymmword ptr [rcx - 448], ymm0
	vmovups	ymmword ptr [rcx - 416], ymm0
	vmovups	ymmword ptr [rcx - 384], ymm0
	vmovups	ymmword ptr [rcx - 352], ymm0
	vmovups	ymmword ptr [rcx - 320], ymm0
	vmovups	ymmword ptr [rcx - 288], ymm0
	vmovups	ymmword ptr [rcx - 256], ymm0
	vmovups	ymmword ptr [rcx - 224], ymm0
	vmovups	ymmword ptr [rcx - 192], ymm0
	vmovups	ymmword ptr [rcx - 160], ymm0
	vmovups	ymmword ptr [rcx - 128], ymm0
	vmovups	ymmword ptr [rcx - 96], ymm0
	vmovups	ymmword ptr [rcx - 64], ymm0
	vmovups	ymmword ptr [rcx - 32], ymm0
	vmovups	ymmword ptr [rcx], ymm0
	add	rcx, 512
	add	rax, -512
	jne	.LBB13_9
.LBB13_10:
	cmp	r11, r10
	je	.LBB13_13
# BB#11:
	add	rdi, r8
	.p2align	4, 0x90
.LBB13_12:                              # =>This Inner Loop Header: Depth=1
	mov	byte ptr [rdi], sil
	inc	rdi
	cmp	rdi, rdx
	jb	.LBB13_12
.LBB13_13:
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
.Lfunc_end13:
	.size	asm_memset_avx, .Lfunc_end13-asm_memset_avx

	.globl	asm_bitmap_get_bit_num_avx
	.p2align	4, 0x90
	.type	asm_bitmap_get_bit_num_avx,@function
asm_bitmap_get_bit_num_avx:             # @asm_bitmap_get_bit_num_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rsi, rsi
	jle	.LBB14_1
# BB#2:
	lea	rcx, [rdi + 8*rsi]
	lea	rax, [rdi + 8]
	cmp	rcx, rax
	cmova	rax, rcx
	mov	r8, rdi
	not	r8
	add	r8, rax
	mov	esi, r8d
	shr	esi, 3
	inc	esi
	and	rsi, 7
	je	.LBB14_3
# BB#4:
	neg	rsi
	xor	eax, eax
	.p2align	4, 0x90
.LBB14_5:                               # =>This Inner Loop Header: Depth=1
	popcnt	rdx, qword ptr [rdi]
	add	rdi, 8
	add	rax, rdx
	inc	rsi
	jne	.LBB14_5
	jmp	.LBB14_6
.LBB14_1:
	xor	eax, eax
	jmp	.LBB14_8
.LBB14_3:
	xor	eax, eax
.LBB14_6:
	cmp	r8, 56
	jb	.LBB14_8
	.p2align	4, 0x90
.LBB14_7:                               # =>This Inner Loop Header: Depth=1
	popcnt	rdx, qword ptr [rdi]
	add	rdx, rax
	popcnt	rax, qword ptr [rdi + 8]
	add	rax, rdx
	popcnt	rdx, qword ptr [rdi + 16]
	add	rdx, rax
	popcnt	rax, qword ptr [rdi + 24]
	add	rax, rdx
	popcnt	rdx, qword ptr [rdi + 32]
	add	rdx, rax
	popcnt	rax, qword ptr [rdi + 40]
	add	rax, rdx
	popcnt	rdx, qword ptr [rdi + 48]
	add	rdx, rax
	popcnt	rax, qword ptr [rdi + 56]
	add	rax, rdx
	add	rdi, 64
	cmp	rdi, rcx
	jb	.LBB14_7
.LBB14_8:
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end14:
	.size	asm_bitmap_get_bit_num_avx, .Lfunc_end14-asm_bitmap_get_bit_num_avx

	.globl	asm_bkdr_hash_avx
	.p2align	4, 0x90
	.type	asm_bkdr_hash_avx,@function
asm_bkdr_hash_avx:                      # @asm_bkdr_hash_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rsi, rsi
	jle	.LBB15_3
# BB#1:
	add	rsi, rdi
	.p2align	4, 0x90
.LBB15_2:                               # =>This Inner Loop Header: Depth=1
	imul	rax, rdx, 1313131
	movzx	edx, byte ptr [rdi]
	inc	rdi
	add	rdx, rax
	cmp	rdi, rsi
	jb	.LBB15_2
.LBB15_3:
	mov	rax, rdx
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end15:
	.size	asm_bkdr_hash_avx, .Lfunc_end15-asm_bkdr_hash_avx

	.globl	asm_multi_and_sum_avx
	.p2align	4, 0x90
	.type	asm_multi_and_sum_avx,@function
asm_multi_and_sum_avx:                  # @asm_multi_and_sum_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rdx, rdx
	jle	.LBB16_1
# BB#2:
	add	rdx, rdi
	xor	r8d, r8d
	.p2align	4, 0x90
.LBB16_3:                               # =>This Inner Loop Header: Depth=1
	movzx	eax, byte ptr [rdi]
	inc	rdi
	imul	rax, qword ptr [rsi]
	add	rsi, 8
	add	r8, rax
	cmp	rdi, rdx
	jb	.LBB16_3
	jmp	.LBB16_4
.LBB16_1:
	xor	r8d, r8d
.LBB16_4:
	imul	rcx, qword ptr [rsi - 8]
	add	rcx, r8
	mov	rax, rcx
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end16:
	.size	asm_multi_and_sum_avx, .Lfunc_end16-asm_multi_and_sum_avx

	.globl	asm_bitmap_get_bit_list_avx
	.p2align	4, 0x90
	.type	asm_bitmap_get_bit_list_avx,@function
asm_bitmap_get_bit_list_avx:            # @asm_bitmap_get_bit_list_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	push	rbx
	and	rsp, -8
	mov	rax, rsi
	test	rcx, rcx
	jle	.LBB17_6
# BB#1:
	lea	r8, [rdi + 8*rcx]
	movabs	r10, 285870213051353865
	mov	r9, rdi
	mov	rax, rsi
	.p2align	4, 0x90
.LBB17_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB17_5 Depth 2
	mov	rbx, qword ptr [r9]
	add	r9, 8
	test	rbx, rbx
	je	.LBB17_2
# BB#4:                                 #   in Loop: Header=BB17_3 Depth=1
	mov	rcx, r9
	sub	rcx, rdi
	lea	r11, [8*rcx - 64]
	.p2align	4, 0x90
.LBB17_5:                               #   Parent Loop BB17_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	rcx, rbx
	neg	rcx
	and	rcx, rbx
	imul	rcx, r10
	shr	rcx, 58
	movzx	ecx, byte ptr [rdx + rcx]
	add	rcx, r11
	mov	qword ptr [rax], rcx
	add	rax, 8
	lea	rcx, [rbx - 1]
	and	rbx, rcx
	jne	.LBB17_5
.LBB17_2:                               #   in Loop: Header=BB17_3 Depth=1
	cmp	r9, r8
	jb	.LBB17_3
.LBB17_6:
	sub	rax, rsi
	sar	rax, 3
	lea	rsp, [rbp - 8]
	pop	rbx
	pop	rbp
	ret
.Lfunc_end17:
	.size	asm_bitmap_get_bit_list_avx, .Lfunc_end17-asm_bitmap_get_bit_list_avx


	.ident	"Apple LLVM version 8.1.0 (clang-802.0.42)"
	.section	".note.GNU-stack","",@progbits
