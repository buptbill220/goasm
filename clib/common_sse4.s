	.text
	.intel_syntax noprefix
	.file	"clib/common.c"
	.globl	asm_sum_sse4_2
	.p2align	4, 0x90
	.type	asm_sum_sse4_2,@function
asm_sum_sse4_2:                         # @asm_sum_sse4_2
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
	cmp	rdx, 4
	jae	.LBB0_4
# BB#3:
	xor	eax, eax
	jmp	.LBB0_15
.LBB0_1:
	xor	eax, eax
	jmp	.LBB0_16
.LBB0_4:
	movabs	r9, 4611686018427387900
	and	r9, rdx
	je	.LBB0_5
# BB#6:
	lea	r8, [r9 - 4]
	mov	esi, r8d
	shr	esi, 2
	inc	esi
	and	rsi, 3
	je	.LBB0_7
# BB#8:
	neg	rsi
	pxor	xmm0, xmm0
	xor	eax, eax
	pxor	xmm1, xmm1
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	movdqu	xmm2, xmmword ptr [rdi + 8*rax]
	movdqu	xmm3, xmmword ptr [rdi + 8*rax + 16]
	paddq	xmm0, xmm2
	paddq	xmm1, xmm3
	add	rax, 4
	inc	rsi
	jne	.LBB0_9
	jmp	.LBB0_10
.LBB0_5:
	xor	eax, eax
	jmp	.LBB0_15
.LBB0_7:
	xor	eax, eax
	pxor	xmm0, xmm0
	pxor	xmm1, xmm1
.LBB0_10:
	cmp	r8, 12
	jb	.LBB0_13
# BB#11:
	mov	rsi, r9
	sub	rsi, rax
	lea	rax, [rdi + 8*rax + 112]
	.p2align	4, 0x90
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	movdqu	xmm2, xmmword ptr [rax - 112]
	movdqu	xmm3, xmmword ptr [rax - 96]
	movdqu	xmm4, xmmword ptr [rax - 80]
	movdqu	xmm5, xmmword ptr [rax - 64]
	paddq	xmm2, xmm0
	paddq	xmm3, xmm1
	movdqu	xmm6, xmmword ptr [rax - 48]
	movdqu	xmm7, xmmword ptr [rax - 32]
	paddq	xmm6, xmm4
	paddq	xmm6, xmm2
	paddq	xmm7, xmm5
	paddq	xmm7, xmm3
	movdqu	xmm0, xmmword ptr [rax - 16]
	movdqu	xmm1, xmmword ptr [rax]
	paddq	xmm0, xmm6
	paddq	xmm1, xmm7
	sub	rax, -128
	add	rsi, -16
	jne	.LBB0_12
.LBB0_13:
	paddq	xmm0, xmm1
	pshufd	xmm1, xmm0, 78          # xmm1 = xmm0[2,3,0,1]
	paddq	xmm1, xmm0
	movq	rax, xmm1
	cmp	rdx, r9
	je	.LBB0_16
# BB#14:
	lea	rdi, [rdi + 8*r9]
	.p2align	4, 0x90
.LBB0_15:                               # =>This Inner Loop Header: Depth=1
	add	rax, qword ptr [rdi]
	add	rdi, 8
	cmp	rdi, rcx
	jb	.LBB0_15
.LBB0_16:
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end0:
	.size	asm_sum_sse4_2, .Lfunc_end0-asm_sum_sse4_2

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_0:
	.quad	-9223372036854775808    # 0x8000000000000000
	.quad	-9223372036854775808    # 0x8000000000000000
	.text
	.globl	asm_max_sse4_2
	.p2align	4, 0x90
	.type	asm_max_sse4_2,@function
asm_max_sse4_2:                         # @asm_max_sse4_2
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
	cmp	rdx, 4
	jb	.LBB1_13
# BB#4:
	movabs	r8, 4611686018427387900
	and	r8, rdx
	je	.LBB1_13
# BB#5:
	lea	rsi, [r8 - 4]
	mov	rax, rsi
	shr	rax, 2
	bt	rsi, 2
	jb	.LBB1_6
# BB#7:
	movdqu	xmm2, xmmword ptr [rdi]
	movdqu	xmm3, xmmword ptr [rdi + 16]
	mov	esi, 4
	jmp	.LBB1_8
.LBB1_1:
	xor	eax, eax
	jmp	.LBB1_14
.LBB1_6:
	movdqa	xmm2, xmmword ptr [rip + .LCPI1_0] # xmm2 = [9223372036854775808,9223372036854775808]
	xor	esi, esi
	movdqa	xmm3, xmm2
.LBB1_8:
	test	rax, rax
	je	.LBB1_11
# BB#9:
	mov	rax, r8
	sub	rax, rsi
	lea	rsi, [rdi + 8*rsi + 48]
	.p2align	4, 0x90
.LBB1_10:                               # =>This Inner Loop Header: Depth=1
	movdqu	xmm4, xmmword ptr [rsi - 48]
	movdqu	xmm5, xmmword ptr [rsi - 32]
	movdqu	xmm6, xmmword ptr [rsi - 16]
	movdqu	xmm7, xmmword ptr [rsi]
	movdqa	xmm0, xmm4
	pcmpgtq	xmm0, xmm2
	movdqa	xmm1, xmm5
	pcmpgtq	xmm1, xmm3
	blendvpd	xmm2, xmm4
	movdqa	xmm0, xmm1
	blendvpd	xmm3, xmm5
	movdqa	xmm0, xmm6
	pcmpgtq	xmm0, xmm2
	movdqa	xmm1, xmm7
	pcmpgtq	xmm1, xmm3
	blendvpd	xmm2, xmm6
	movdqa	xmm0, xmm1
	blendvpd	xmm3, xmm7
	add	rsi, 64
	add	rax, -8
	jne	.LBB1_10
.LBB1_11:
	movdqa	xmm0, xmm2
	pcmpgtq	xmm0, xmm3
	blendvpd	xmm3, xmm2
	pshufd	xmm0, xmm3, 78          # xmm0 = xmm3[2,3,0,1]
	movdqa	xmm1, xmm3
	pcmpgtq	xmm1, xmm0
	pextrb	esi, xmm1, 0
	movq	r9, xmm3
	pextrq	rax, xmm3, 1
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
	ret
.Lfunc_end1:
	.size	asm_max_sse4_2, .Lfunc_end1-asm_max_sse4_2

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI2_0:
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.text
	.globl	asm_min_sse4_2
	.p2align	4, 0x90
	.type	asm_min_sse4_2,@function
asm_min_sse4_2:                         # @asm_min_sse4_2
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
	cmp	rdx, 4
	jb	.LBB2_13
# BB#4:
	movabs	r8, 4611686018427387900
	and	r8, rdx
	je	.LBB2_13
# BB#5:
	lea	rsi, [r8 - 4]
	mov	rax, rsi
	shr	rax, 2
	bt	rsi, 2
	jb	.LBB2_6
# BB#7:
	movdqu	xmm2, xmmword ptr [rdi]
	movdqu	xmm3, xmmword ptr [rdi + 16]
	mov	esi, 4
	jmp	.LBB2_8
.LBB2_1:
	xor	eax, eax
	jmp	.LBB2_14
.LBB2_6:
	movdqa	xmm2, xmmword ptr [rip + .LCPI2_0] # xmm2 = [9223372036854775807,9223372036854775807]
	xor	esi, esi
	movdqa	xmm3, xmm2
.LBB2_8:
	test	rax, rax
	je	.LBB2_11
# BB#9:
	mov	rax, r8
	sub	rax, rsi
	lea	rsi, [rdi + 8*rsi + 48]
	.p2align	4, 0x90
.LBB2_10:                               # =>This Inner Loop Header: Depth=1
	movdqu	xmm4, xmmword ptr [rsi - 48]
	movdqu	xmm5, xmmword ptr [rsi - 32]
	movdqu	xmm6, xmmword ptr [rsi - 16]
	movdqu	xmm7, xmmword ptr [rsi]
	movdqa	xmm0, xmm2
	pcmpgtq	xmm0, xmm4
	movdqa	xmm1, xmm3
	pcmpgtq	xmm1, xmm5
	blendvpd	xmm2, xmm4
	movdqa	xmm0, xmm1
	blendvpd	xmm3, xmm5
	movapd	xmm0, xmm2
	pcmpgtq	xmm0, xmm6
	movapd	xmm1, xmm3
	pcmpgtq	xmm1, xmm7
	blendvpd	xmm2, xmm6
	movdqa	xmm0, xmm1
	blendvpd	xmm3, xmm7
	add	rsi, 64
	add	rax, -8
	jne	.LBB2_10
.LBB2_11:
	movdqa	xmm0, xmm3
	pcmpgtq	xmm0, xmm2
	blendvpd	xmm3, xmm2
	pshufd	xmm0, xmm3, 78          # xmm0 = xmm3[2,3,0,1]
	pcmpgtq	xmm0, xmm3
	pextrb	esi, xmm0, 0
	movq	r9, xmm3
	pextrq	rax, xmm3, 1
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
	ret
.Lfunc_end2:
	.size	asm_min_sse4_2, .Lfunc_end2-asm_min_sse4_2

	.globl	asm_multi_sse4_2
	.p2align	4, 0x90
	.type	asm_multi_sse4_2,@function
asm_multi_sse4_2:                       # @asm_multi_sse4_2
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
	.size	asm_multi_sse4_2, .Lfunc_end3-asm_multi_sse4_2

	.globl	asm_and_sse4_2
	.p2align	4, 0x90
	.type	asm_and_sse4_2,@function
asm_and_sse4_2:                         # @asm_and_sse4_2
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rdx, rdx
	jle	.LBB4_18
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
	cmp	r9, 4
	jb	.LBB4_13
# BB#2:
	movabs	r8, 4611686018427387900
	and	r8, r9
	je	.LBB4_13
# BB#3:
	cmp	r10, rax
	cmova	rax, r10
	add	rax, rcx
	and	rax, -8
	lea	rcx, [rsi + rax + 8]
	cmp	rcx, rdi
	jbe	.LBB4_5
# BB#4:
	lea	rax, [rdi + rax + 8]
	cmp	rax, rsi
	ja	.LBB4_13
.LBB4_5:
	lea	rcx, [r8 - 4]
	mov	rax, rcx
	shr	rax, 2
	bt	rcx, 2
	jb	.LBB4_6
# BB#7:
	movups	xmm0, xmmword ptr [rsi]
	movups	xmm1, xmmword ptr [rsi + 16]
	movups	xmm2, xmmword ptr [rdi]
	movups	xmm3, xmmword ptr [rdi + 16]
	andps	xmm2, xmm0
	andps	xmm3, xmm1
	movups	xmmword ptr [rdi], xmm2
	movups	xmmword ptr [rdi + 16], xmm3
	mov	r11d, 4
	jmp	.LBB4_8
.LBB4_6:
	xor	r11d, r11d
.LBB4_8:
	test	rax, rax
	je	.LBB4_11
# BB#9:
	mov	rdx, r8
	sub	rdx, r11
	lea	rcx, [rsi + 8*r11 + 48]
	lea	rax, [rdi + 8*r11 + 48]
	.p2align	4, 0x90
.LBB4_10:                               # =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rcx - 48]
	movups	xmm1, xmmword ptr [rcx - 32]
	movups	xmm2, xmmword ptr [rax - 48]
	movups	xmm3, xmmword ptr [rax - 32]
	andps	xmm2, xmm0
	andps	xmm3, xmm1
	movups	xmmword ptr [rax - 48], xmm2
	movups	xmmword ptr [rax - 32], xmm3
	movups	xmm0, xmmword ptr [rcx - 16]
	movups	xmm1, xmmword ptr [rcx]
	movups	xmm2, xmmword ptr [rax - 16]
	movups	xmm3, xmmword ptr [rax]
	andps	xmm2, xmm0
	andps	xmm3, xmm1
	movups	xmmword ptr [rax - 16], xmm2
	movups	xmmword ptr [rax], xmm3
	add	rcx, 64
	add	rax, 64
	add	rdx, -8
	jne	.LBB4_10
.LBB4_11:
	cmp	r9, r8
	je	.LBB4_18
# BB#12:
	lea	rdi, [rdi + 8*r8]
	lea	rsi, [rsi + 8*r8]
.LBB4_13:
	lea	rax, [rdi + 8]
	cmp	r10, rax
	cmova	rax, r10
	mov	rcx, rdi
	not	rcx
	add	rcx, rax
	mov	eax, ecx
	shr	eax, 3
	inc	eax
	and	rax, 3
	je	.LBB4_16
# BB#14:
	neg	rax
	.p2align	4, 0x90
.LBB4_15:                               # =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rsi]
	add	rsi, 8
	and	qword ptr [rdi], rdx
	add	rdi, 8
	inc	rax
	jne	.LBB4_15
.LBB4_16:
	cmp	rcx, 24
	jb	.LBB4_18
	.p2align	4, 0x90
.LBB4_17:                               # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rsi]
	and	qword ptr [rdi], rax
	mov	rax, qword ptr [rsi + 8]
	and	qword ptr [rdi + 8], rax
	mov	rax, qword ptr [rsi + 16]
	and	qword ptr [rdi + 16], rax
	mov	rax, qword ptr [rsi + 24]
	and	qword ptr [rdi + 24], rax
	add	rdi, 32
	add	rsi, 32
	cmp	rdi, r10
	jb	.LBB4_17
.LBB4_18:
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end4:
	.size	asm_and_sse4_2, .Lfunc_end4-asm_and_sse4_2

	.globl	asm_and2_sse4_2
	.p2align	4, 0x90
	.type	asm_and2_sse4_2,@function
asm_and2_sse4_2:                        # @asm_and2_sse4_2
# BB#0:
	push	rbp
	mov	rbp, rsp
	push	rbx
	and	rsp, -8
	test	rcx, rcx
	jle	.LBB5_18
# BB#1:
	lea	r10, [rdi + 8*rcx]
	lea	rax, [rdi + 8]
	cmp	r10, rax
	mov	r9, rax
	cmova	r9, r10
	mov	rcx, rdi
	not	rcx
	add	r9, rcx
	shr	r9, 3
	inc	r9
	cmp	r9, 4
	jb	.LBB5_13
# BB#2:
	movabs	r8, 4611686018427387900
	and	r8, r9
	je	.LBB5_13
# BB#3:
	cmp	r10, rax
	cmova	rax, r10
	add	rax, rcx
	and	rax, -8
	lea	rcx, [rdi + rax + 8]
	lea	rbx, [rsi + rax + 8]
	lea	r11, [rdx + rax + 8]
	cmp	rdi, rbx
	sbb	al, al
	cmp	rsi, rcx
	sbb	bl, bl
	and	bl, al
	cmp	rdi, r11
	sbb	al, al
	cmp	rdx, rcx
	sbb	cl, cl
	test	bl, 1
	jne	.LBB5_13
# BB#4:
	and	al, cl
	and	al, 1
	jne	.LBB5_13
# BB#5:
	lea	rcx, [r8 - 4]
	mov	rax, rcx
	shr	rax, 2
	bt	rcx, 2
	jb	.LBB5_6
# BB#7:
	movups	xmm0, xmmword ptr [rsi]
	movups	xmm1, xmmword ptr [rsi + 16]
	movups	xmm2, xmmword ptr [rdx]
	movups	xmm3, xmmword ptr [rdx + 16]
	andps	xmm2, xmm0
	andps	xmm3, xmm1
	movups	xmm0, xmmword ptr [rdi]
	movups	xmm1, xmmword ptr [rdi + 16]
	andps	xmm0, xmm2
	andps	xmm1, xmm3
	movups	xmmword ptr [rdi], xmm0
	movups	xmmword ptr [rdi + 16], xmm1
	mov	ebx, 4
	jmp	.LBB5_8
.LBB5_6:
	xor	ebx, ebx
.LBB5_8:
	test	rax, rax
	je	.LBB5_11
# BB#9:
	mov	r11, r8
	sub	r11, rbx
	lea	rax, [rdx + 8*rbx + 48]
	lea	rcx, [rsi + 8*rbx + 48]
	lea	rbx, [rdi + 8*rbx + 48]
	.p2align	4, 0x90
.LBB5_10:                               # =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rcx - 48]
	movups	xmm1, xmmword ptr [rcx - 32]
	movups	xmm2, xmmword ptr [rax - 48]
	movups	xmm3, xmmword ptr [rax - 32]
	andps	xmm2, xmm0
	andps	xmm3, xmm1
	movups	xmm0, xmmword ptr [rbx - 48]
	movups	xmm1, xmmword ptr [rbx - 32]
	andps	xmm0, xmm2
	andps	xmm1, xmm3
	movups	xmmword ptr [rbx - 48], xmm0
	movups	xmmword ptr [rbx - 32], xmm1
	movups	xmm0, xmmword ptr [rcx - 16]
	movups	xmm1, xmmword ptr [rcx]
	movups	xmm2, xmmword ptr [rax - 16]
	movups	xmm3, xmmword ptr [rax]
	andps	xmm2, xmm0
	andps	xmm3, xmm1
	movups	xmm0, xmmword ptr [rbx - 16]
	movups	xmm1, xmmword ptr [rbx]
	andps	xmm0, xmm2
	andps	xmm1, xmm3
	movups	xmmword ptr [rbx - 16], xmm0
	movups	xmmword ptr [rbx], xmm1
	add	rax, 64
	add	rcx, 64
	add	rbx, 64
	add	r11, -8
	jne	.LBB5_10
.LBB5_11:
	cmp	r9, r8
	je	.LBB5_18
# BB#12:
	lea	rdi, [rdi + 8*r8]
	lea	rsi, [rsi + 8*r8]
	lea	rdx, [rdx + 8*r8]
.LBB5_13:
	lea	rcx, [rdi + 8]
	cmp	r10, rcx
	cmova	rcx, r10
	mov	rax, rdi
	not	rax
	add	rax, rcx
	mov	ecx, eax
	shr	ecx, 3
	inc	ecx
	and	rcx, 3
	je	.LBB5_16
# BB#14:
	neg	rcx
	.p2align	4, 0x90
.LBB5_15:                               # =>This Inner Loop Header: Depth=1
	mov	rbx, qword ptr [rdx]
	add	rdx, 8
	and	rbx, qword ptr [rsi]
	add	rsi, 8
	and	qword ptr [rdi], rbx
	add	rdi, 8
	inc	rcx
	jne	.LBB5_15
.LBB5_16:
	cmp	rax, 24
	jb	.LBB5_18
	.p2align	4, 0x90
.LBB5_17:                               # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rdx]
	and	rax, qword ptr [rsi]
	and	qword ptr [rdi], rax
	mov	rax, qword ptr [rdx + 8]
	and	rax, qword ptr [rsi + 8]
	and	qword ptr [rdi + 8], rax
	mov	rax, qword ptr [rdx + 16]
	and	rax, qword ptr [rsi + 16]
	and	qword ptr [rdi + 16], rax
	mov	rax, qword ptr [rdx + 24]
	and	rax, qword ptr [rsi + 24]
	and	qword ptr [rdi + 24], rax
	add	rdi, 32
	add	rsi, 32
	add	rdx, 32
	cmp	rdi, r10
	jb	.LBB5_17
.LBB5_18:
	lea	rsp, [rbp - 8]
	pop	rbx
	pop	rbp
	ret
.Lfunc_end5:
	.size	asm_and2_sse4_2, .Lfunc_end5-asm_and2_sse4_2

	.globl	asm_and4_sse4_2
	.p2align	4, 0x90
	.type	asm_and4_sse4_2,@function
asm_and4_sse4_2:                        # @asm_and4_sse4_2
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
	cmp	r15, 4
	jb	.LBB6_2
# BB#3:
	movabs	r10, 4611686018427387900
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
	add	rdx, 16
	add	rcx, 16
	add	r8, 16
	add	rsi, 16
	add	rdi, 16
	mov	r13, r12
	.p2align	4, 0x90
.LBB6_9:                                # =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rsi - 16]
	movups	xmm1, xmmword ptr [rsi]
	movups	xmm2, xmmword ptr [rdx - 16]
	movups	xmm3, xmmword ptr [rdx]
	andps	xmm2, xmm0
	andps	xmm3, xmm1
	movups	xmm0, xmmword ptr [rcx - 16]
	movups	xmm1, xmmword ptr [rcx]
	movups	xmm4, xmmword ptr [r8 - 16]
	movups	xmm5, xmmword ptr [r8]
	andps	xmm4, xmm0
	andps	xmm4, xmm2
	andps	xmm5, xmm1
	andps	xmm5, xmm3
	movups	xmm0, xmmword ptr [rdi - 16]
	movups	xmm1, xmmword ptr [rdi]
	andps	xmm0, xmm4
	andps	xmm1, xmm5
	movups	xmmword ptr [rdi - 16], xmm0
	movups	xmmword ptr [rdi], xmm1
	add	rdx, 32
	add	rcx, 32
	add	r8, 32
	add	rsi, 32
	add	rdi, 32
	add	r13, -4
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
	ret
.Lfunc_end6:
	.size	asm_and4_sse4_2, .Lfunc_end6-asm_and4_sse4_2

	.globl	asm_or_sse4_2
	.p2align	4, 0x90
	.type	asm_or_sse4_2,@function
asm_or_sse4_2:                          # @asm_or_sse4_2
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rdx, rdx
	jle	.LBB7_18
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
	cmp	r9, 4
	jb	.LBB7_13
# BB#2:
	movabs	r8, 4611686018427387900
	and	r8, r9
	je	.LBB7_13
# BB#3:
	cmp	r10, rax
	cmova	rax, r10
	add	rax, rcx
	and	rax, -8
	lea	rcx, [rsi + rax + 8]
	cmp	rcx, rdi
	jbe	.LBB7_5
# BB#4:
	lea	rax, [rdi + rax + 8]
	cmp	rax, rsi
	ja	.LBB7_13
.LBB7_5:
	lea	rcx, [r8 - 4]
	mov	rax, rcx
	shr	rax, 2
	bt	rcx, 2
	jb	.LBB7_6
# BB#7:
	movups	xmm0, xmmword ptr [rsi]
	movups	xmm1, xmmword ptr [rsi + 16]
	movups	xmm2, xmmword ptr [rdi]
	movups	xmm3, xmmword ptr [rdi + 16]
	orps	xmm2, xmm0
	orps	xmm3, xmm1
	movups	xmmword ptr [rdi], xmm2
	movups	xmmword ptr [rdi + 16], xmm3
	mov	r11d, 4
	jmp	.LBB7_8
.LBB7_6:
	xor	r11d, r11d
.LBB7_8:
	test	rax, rax
	je	.LBB7_11
# BB#9:
	mov	rdx, r8
	sub	rdx, r11
	lea	rcx, [rsi + 8*r11 + 48]
	lea	rax, [rdi + 8*r11 + 48]
	.p2align	4, 0x90
.LBB7_10:                               # =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rcx - 48]
	movups	xmm1, xmmword ptr [rcx - 32]
	movups	xmm2, xmmword ptr [rax - 48]
	movups	xmm3, xmmword ptr [rax - 32]
	orps	xmm2, xmm0
	orps	xmm3, xmm1
	movups	xmmword ptr [rax - 48], xmm2
	movups	xmmword ptr [rax - 32], xmm3
	movups	xmm0, xmmword ptr [rcx - 16]
	movups	xmm1, xmmword ptr [rcx]
	movups	xmm2, xmmword ptr [rax - 16]
	movups	xmm3, xmmword ptr [rax]
	orps	xmm2, xmm0
	orps	xmm3, xmm1
	movups	xmmword ptr [rax - 16], xmm2
	movups	xmmword ptr [rax], xmm3
	add	rcx, 64
	add	rax, 64
	add	rdx, -8
	jne	.LBB7_10
.LBB7_11:
	cmp	r9, r8
	je	.LBB7_18
# BB#12:
	lea	rdi, [rdi + 8*r8]
	lea	rsi, [rsi + 8*r8]
.LBB7_13:
	lea	rax, [rdi + 8]
	cmp	r10, rax
	cmova	rax, r10
	mov	rcx, rdi
	not	rcx
	add	rcx, rax
	mov	eax, ecx
	shr	eax, 3
	inc	eax
	and	rax, 3
	je	.LBB7_16
# BB#14:
	neg	rax
	.p2align	4, 0x90
.LBB7_15:                               # =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rsi]
	add	rsi, 8
	or	qword ptr [rdi], rdx
	add	rdi, 8
	inc	rax
	jne	.LBB7_15
.LBB7_16:
	cmp	rcx, 24
	jb	.LBB7_18
	.p2align	4, 0x90
.LBB7_17:                               # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rsi]
	or	qword ptr [rdi], rax
	mov	rax, qword ptr [rsi + 8]
	or	qword ptr [rdi + 8], rax
	mov	rax, qword ptr [rsi + 16]
	or	qword ptr [rdi + 16], rax
	mov	rax, qword ptr [rsi + 24]
	or	qword ptr [rdi + 24], rax
	add	rdi, 32
	add	rsi, 32
	cmp	rdi, r10
	jb	.LBB7_17
.LBB7_18:
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end7:
	.size	asm_or_sse4_2, .Lfunc_end7-asm_or_sse4_2

	.globl	asm_or2_sse4_2
	.p2align	4, 0x90
	.type	asm_or2_sse4_2,@function
asm_or2_sse4_2:                         # @asm_or2_sse4_2
# BB#0:
	push	rbp
	mov	rbp, rsp
	push	rbx
	and	rsp, -8
	test	rcx, rcx
	jle	.LBB8_18
# BB#1:
	lea	r10, [rdi + 8*rcx]
	lea	rax, [rdi + 8]
	cmp	r10, rax
	mov	r9, rax
	cmova	r9, r10
	mov	rcx, rdi
	not	rcx
	add	r9, rcx
	shr	r9, 3
	inc	r9
	cmp	r9, 4
	jb	.LBB8_13
# BB#2:
	movabs	r8, 4611686018427387900
	and	r8, r9
	je	.LBB8_13
# BB#3:
	cmp	r10, rax
	cmova	rax, r10
	add	rax, rcx
	and	rax, -8
	lea	rcx, [rdi + rax + 8]
	lea	rbx, [rsi + rax + 8]
	lea	r11, [rdx + rax + 8]
	cmp	rdi, rbx
	sbb	al, al
	cmp	rsi, rcx
	sbb	bl, bl
	and	bl, al
	cmp	rdi, r11
	sbb	al, al
	cmp	rdx, rcx
	sbb	cl, cl
	test	bl, 1
	jne	.LBB8_13
# BB#4:
	and	al, cl
	and	al, 1
	jne	.LBB8_13
# BB#5:
	lea	rcx, [r8 - 4]
	mov	rax, rcx
	shr	rax, 2
	bt	rcx, 2
	jb	.LBB8_6
# BB#7:
	movups	xmm0, xmmword ptr [rsi]
	movups	xmm1, xmmword ptr [rsi + 16]
	movups	xmm2, xmmword ptr [rdx]
	movups	xmm3, xmmword ptr [rdx + 16]
	orps	xmm2, xmm0
	orps	xmm3, xmm1
	movups	xmm0, xmmword ptr [rdi]
	movups	xmm1, xmmword ptr [rdi + 16]
	orps	xmm0, xmm2
	orps	xmm1, xmm3
	movups	xmmword ptr [rdi], xmm0
	movups	xmmword ptr [rdi + 16], xmm1
	mov	ebx, 4
	jmp	.LBB8_8
.LBB8_6:
	xor	ebx, ebx
.LBB8_8:
	test	rax, rax
	je	.LBB8_11
# BB#9:
	mov	r11, r8
	sub	r11, rbx
	lea	rax, [rdx + 8*rbx + 48]
	lea	rcx, [rsi + 8*rbx + 48]
	lea	rbx, [rdi + 8*rbx + 48]
	.p2align	4, 0x90
.LBB8_10:                               # =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rcx - 48]
	movups	xmm1, xmmword ptr [rcx - 32]
	movups	xmm2, xmmword ptr [rax - 48]
	movups	xmm3, xmmword ptr [rax - 32]
	orps	xmm2, xmm0
	orps	xmm3, xmm1
	movups	xmm0, xmmword ptr [rbx - 48]
	movups	xmm1, xmmword ptr [rbx - 32]
	orps	xmm0, xmm2
	orps	xmm1, xmm3
	movups	xmmword ptr [rbx - 48], xmm0
	movups	xmmword ptr [rbx - 32], xmm1
	movups	xmm0, xmmword ptr [rcx - 16]
	movups	xmm1, xmmword ptr [rcx]
	movups	xmm2, xmmword ptr [rax - 16]
	movups	xmm3, xmmword ptr [rax]
	orps	xmm2, xmm0
	orps	xmm3, xmm1
	movups	xmm0, xmmword ptr [rbx - 16]
	movups	xmm1, xmmword ptr [rbx]
	orps	xmm0, xmm2
	orps	xmm1, xmm3
	movups	xmmword ptr [rbx - 16], xmm0
	movups	xmmword ptr [rbx], xmm1
	add	rax, 64
	add	rcx, 64
	add	rbx, 64
	add	r11, -8
	jne	.LBB8_10
.LBB8_11:
	cmp	r9, r8
	je	.LBB8_18
# BB#12:
	lea	rdi, [rdi + 8*r8]
	lea	rsi, [rsi + 8*r8]
	lea	rdx, [rdx + 8*r8]
.LBB8_13:
	lea	rcx, [rdi + 8]
	cmp	r10, rcx
	cmova	rcx, r10
	mov	rax, rdi
	not	rax
	add	rax, rcx
	mov	ecx, eax
	shr	ecx, 3
	inc	ecx
	and	rcx, 3
	je	.LBB8_16
# BB#14:
	neg	rcx
	.p2align	4, 0x90
.LBB8_15:                               # =>This Inner Loop Header: Depth=1
	mov	rbx, qword ptr [rdx]
	add	rdx, 8
	or	rbx, qword ptr [rsi]
	add	rsi, 8
	or	qword ptr [rdi], rbx
	add	rdi, 8
	inc	rcx
	jne	.LBB8_15
.LBB8_16:
	cmp	rax, 24
	jb	.LBB8_18
	.p2align	4, 0x90
.LBB8_17:                               # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rdx]
	or	rax, qword ptr [rsi]
	or	qword ptr [rdi], rax
	mov	rax, qword ptr [rdx + 8]
	or	rax, qword ptr [rsi + 8]
	or	qword ptr [rdi + 8], rax
	mov	rax, qword ptr [rdx + 16]
	or	rax, qword ptr [rsi + 16]
	or	qword ptr [rdi + 16], rax
	mov	rax, qword ptr [rdx + 24]
	or	rax, qword ptr [rsi + 24]
	or	qword ptr [rdi + 24], rax
	add	rdi, 32
	add	rsi, 32
	add	rdx, 32
	cmp	rdi, r10
	jb	.LBB8_17
.LBB8_18:
	lea	rsp, [rbp - 8]
	pop	rbx
	pop	rbp
	ret
.Lfunc_end8:
	.size	asm_or2_sse4_2, .Lfunc_end8-asm_or2_sse4_2

	.globl	asm_or4_sse4_2
	.p2align	4, 0x90
	.type	asm_or4_sse4_2,@function
asm_or4_sse4_2:                         # @asm_or4_sse4_2
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
	cmp	r15, 4
	jb	.LBB9_2
# BB#3:
	movabs	r10, 4611686018427387900
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
	add	rdx, 16
	add	rcx, 16
	add	r8, 16
	add	rsi, 16
	add	rdi, 16
	mov	r13, r12
	.p2align	4, 0x90
.LBB9_9:                                # =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rsi - 16]
	movups	xmm1, xmmword ptr [rsi]
	movups	xmm2, xmmword ptr [rdx - 16]
	movups	xmm3, xmmword ptr [rdx]
	orps	xmm2, xmm0
	orps	xmm3, xmm1
	movups	xmm0, xmmword ptr [rcx - 16]
	movups	xmm1, xmmword ptr [rcx]
	movups	xmm4, xmmword ptr [r8 - 16]
	movups	xmm5, xmmword ptr [r8]
	orps	xmm4, xmm0
	orps	xmm4, xmm2
	orps	xmm5, xmm1
	orps	xmm5, xmm3
	movups	xmm0, xmmword ptr [rdi - 16]
	movups	xmm1, xmmword ptr [rdi]
	orps	xmm0, xmm4
	orps	xmm1, xmm5
	movups	xmmword ptr [rdi - 16], xmm0
	movups	xmmword ptr [rdi], xmm1
	add	rdx, 32
	add	rcx, 32
	add	r8, 32
	add	rsi, 32
	add	rdi, 32
	add	r13, -4
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
	ret
.Lfunc_end9:
	.size	asm_or4_sse4_2, .Lfunc_end9-asm_or4_sse4_2

	.globl	asm_andn_sse4_2
	.p2align	4, 0x90
	.type	asm_andn_sse4_2,@function
asm_andn_sse4_2:                        # @asm_andn_sse4_2
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rdx, rdx
	jle	.LBB10_18
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
	cmp	r9, 4
	jb	.LBB10_13
# BB#2:
	movabs	r8, 4611686018427387900
	and	r8, r9
	je	.LBB10_13
# BB#3:
	cmp	r10, rax
	cmova	rax, r10
	add	rax, rcx
	and	rax, -8
	lea	rcx, [rsi + rax + 8]
	cmp	rcx, rdi
	jbe	.LBB10_5
# BB#4:
	lea	rax, [rdi + rax + 8]
	cmp	rax, rsi
	ja	.LBB10_13
.LBB10_5:
	lea	rcx, [r8 - 4]
	mov	rax, rcx
	shr	rax, 2
	bt	rcx, 2
	jb	.LBB10_6
# BB#7:
	movups	xmm0, xmmword ptr [rsi]
	movups	xmm1, xmmword ptr [rsi + 16]
	movups	xmm2, xmmword ptr [rdi]
	movups	xmm3, xmmword ptr [rdi + 16]
	andnps	xmm0, xmm2
	andnps	xmm1, xmm3
	movups	xmmword ptr [rdi], xmm0
	movups	xmmword ptr [rdi + 16], xmm1
	mov	r11d, 4
	jmp	.LBB10_8
.LBB10_6:
	xor	r11d, r11d
.LBB10_8:
	test	rax, rax
	je	.LBB10_11
# BB#9:
	mov	rdx, r8
	sub	rdx, r11
	lea	rcx, [rsi + 8*r11 + 48]
	lea	rax, [rdi + 8*r11 + 48]
	.p2align	4, 0x90
.LBB10_10:                              # =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rcx - 48]
	movups	xmm1, xmmword ptr [rcx - 32]
	movups	xmm2, xmmword ptr [rax - 48]
	movups	xmm3, xmmword ptr [rax - 32]
	andnps	xmm0, xmm2
	andnps	xmm1, xmm3
	movups	xmmword ptr [rax - 48], xmm0
	movups	xmmword ptr [rax - 32], xmm1
	movups	xmm0, xmmword ptr [rcx - 16]
	movups	xmm1, xmmword ptr [rcx]
	movups	xmm2, xmmword ptr [rax - 16]
	movups	xmm3, xmmword ptr [rax]
	andnps	xmm0, xmm2
	andnps	xmm1, xmm3
	movups	xmmword ptr [rax - 16], xmm0
	movups	xmmword ptr [rax], xmm1
	add	rcx, 64
	add	rax, 64
	add	rdx, -8
	jne	.LBB10_10
.LBB10_11:
	cmp	r9, r8
	je	.LBB10_18
# BB#12:
	lea	rdi, [rdi + 8*r8]
	lea	rsi, [rsi + 8*r8]
.LBB10_13:
	lea	rax, [rdi + 8]
	cmp	r10, rax
	cmova	rax, r10
	mov	rcx, rdi
	not	rcx
	add	rcx, rax
	mov	eax, ecx
	shr	eax, 3
	inc	eax
	and	rax, 3
	je	.LBB10_16
# BB#14:
	neg	rax
	.p2align	4, 0x90
.LBB10_15:                              # =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rsi]
	add	rsi, 8
	not	rdx
	and	qword ptr [rdi], rdx
	add	rdi, 8
	inc	rax
	jne	.LBB10_15
.LBB10_16:
	cmp	rcx, 24
	jb	.LBB10_18
	.p2align	4, 0x90
.LBB10_17:                              # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rsi]
	not	rax
	and	qword ptr [rdi], rax
	mov	rax, qword ptr [rsi + 8]
	not	rax
	and	qword ptr [rdi + 8], rax
	mov	rax, qword ptr [rsi + 16]
	not	rax
	and	qword ptr [rdi + 16], rax
	mov	rax, qword ptr [rsi + 24]
	not	rax
	and	qword ptr [rdi + 24], rax
	add	rdi, 32
	add	rsi, 32
	cmp	rdi, r10
	jb	.LBB10_17
.LBB10_18:
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end10:
	.size	asm_andn_sse4_2, .Lfunc_end10-asm_andn_sse4_2

	.globl	asm_memcopy_sse4_2
	.p2align	4, 0x90
	.type	asm_memcopy_sse4_2,@function
asm_memcopy_sse4_2:                     # @asm_memcopy_sse4_2
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rdx, rdx
	jle	.LBB11_15
# BB#1:
	add	rdx, rdi
	lea	rax, [rdi + 1]
	cmp	rdx, rax
	mov	r10, rax
	cmova	r10, rdx
	sub	r10, rdi
	cmp	r10, 32
	jb	.LBB11_14
# BB#2:
	mov	r9, r10
	and	r9, -32
	je	.LBB11_14
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
	ja	.LBB11_14
.LBB11_5:
	lea	r8, [r9 - 32]
	mov	eax, r8d
	shr	eax, 5
	inc	eax
	and	rax, 3
	je	.LBB11_6
# BB#7:
	neg	rax
	xor	ecx, ecx
	.p2align	4, 0x90
.LBB11_8:                               # =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rsi + rcx]
	movups	xmm1, xmmword ptr [rsi + rcx + 16]
	movups	xmmword ptr [rdi + rcx], xmm0
	movups	xmmword ptr [rdi + rcx + 16], xmm1
	add	rcx, 32
	inc	rax
	jne	.LBB11_8
	jmp	.LBB11_9
.LBB11_6:
	xor	ecx, ecx
.LBB11_9:
	cmp	r8, 96
	jb	.LBB11_12
# BB#10:
	mov	r8, r9
	sub	r8, rcx
	lea	rax, [rsi + rcx + 112]
	lea	rcx, [rdi + rcx + 112]
	.p2align	4, 0x90
.LBB11_11:                              # =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rax - 112]
	movups	xmm1, xmmword ptr [rax - 96]
	movups	xmmword ptr [rcx - 112], xmm0
	movups	xmmword ptr [rcx - 96], xmm1
	movups	xmm0, xmmword ptr [rax - 80]
	movups	xmm1, xmmword ptr [rax - 64]
	movups	xmmword ptr [rcx - 80], xmm0
	movups	xmmword ptr [rcx - 64], xmm1
	movups	xmm0, xmmword ptr [rax - 48]
	movups	xmm1, xmmword ptr [rax - 32]
	movups	xmmword ptr [rcx - 48], xmm0
	movups	xmmword ptr [rcx - 32], xmm1
	movups	xmm0, xmmword ptr [rax - 16]
	movups	xmm1, xmmword ptr [rax]
	movups	xmmword ptr [rcx - 16], xmm0
	movups	xmmword ptr [rcx], xmm1
	sub	rax, -128
	sub	rcx, -128
	add	r8, -128
	jne	.LBB11_11
.LBB11_12:
	cmp	r10, r9
	je	.LBB11_15
# BB#13:
	add	rdi, r9
	add	rsi, r9
	.p2align	4, 0x90
.LBB11_14:                              # =>This Inner Loop Header: Depth=1
	movzx	eax, byte ptr [rsi]
	inc	rsi
	mov	byte ptr [rdi], al
	inc	rdi
	cmp	rdi, rdx
	jb	.LBB11_14
.LBB11_15:
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end11:
	.size	asm_memcopy_sse4_2, .Lfunc_end11-asm_memcopy_sse4_2

	.globl	asm_memcopy_uint64_sse4_2
	.p2align	4, 0x90
	.type	asm_memcopy_uint64_sse4_2,@function
asm_memcopy_uint64_sse4_2:              # @asm_memcopy_uint64_sse4_2
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rdx, rdx
	jle	.LBB12_19
# BB#1:
	lea	r11, [rdi + 8*rdx]
	lea	rax, [rdi + 8]
	cmp	r11, rax
	mov	r10, rax
	cmova	r10, r11
	mov	rcx, rdi
	not	rcx
	add	r10, rcx
	shr	r10, 3
	inc	r10
	cmp	r10, 4
	jb	.LBB12_14
# BB#2:
	movabs	r9, 4611686018427387900
	and	r9, r10
	je	.LBB12_14
# BB#3:
	cmp	r11, rax
	cmova	rax, r11
	add	rax, rcx
	and	rax, -8
	lea	rcx, [rsi + rax + 8]
	cmp	rcx, rdi
	jbe	.LBB12_5
# BB#4:
	lea	rax, [rdi + rax + 8]
	cmp	rax, rsi
	ja	.LBB12_14
.LBB12_5:
	lea	r8, [r9 - 4]
	mov	ecx, r8d
	shr	ecx, 2
	inc	ecx
	and	rcx, 3
	je	.LBB12_6
# BB#7:
	neg	rcx
	xor	eax, eax
	.p2align	4, 0x90
.LBB12_8:                               # =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rsi + 8*rax]
	movups	xmm1, xmmword ptr [rsi + 8*rax + 16]
	movups	xmmword ptr [rdi + 8*rax], xmm0
	movups	xmmword ptr [rdi + 8*rax + 16], xmm1
	add	rax, 4
	inc	rcx
	jne	.LBB12_8
	jmp	.LBB12_9
.LBB12_6:
	xor	eax, eax
.LBB12_9:
	cmp	r8, 12
	jb	.LBB12_12
# BB#10:
	mov	rdx, r9
	sub	rdx, rax
	lea	rcx, [rsi + 8*rax + 112]
	lea	rax, [rdi + 8*rax + 112]
	.p2align	4, 0x90
.LBB12_11:                              # =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rcx - 112]
	movups	xmm1, xmmword ptr [rcx - 96]
	movups	xmmword ptr [rax - 112], xmm0
	movups	xmmword ptr [rax - 96], xmm1
	movups	xmm0, xmmword ptr [rcx - 80]
	movups	xmm1, xmmword ptr [rcx - 64]
	movups	xmmword ptr [rax - 80], xmm0
	movups	xmmword ptr [rax - 64], xmm1
	movups	xmm0, xmmword ptr [rcx - 48]
	movups	xmm1, xmmword ptr [rcx - 32]
	movups	xmmword ptr [rax - 48], xmm0
	movups	xmmword ptr [rax - 32], xmm1
	movups	xmm0, xmmword ptr [rcx - 16]
	movups	xmm1, xmmword ptr [rcx]
	movups	xmmword ptr [rax - 16], xmm0
	movups	xmmword ptr [rax], xmm1
	sub	rcx, -128
	sub	rax, -128
	add	rdx, -16
	jne	.LBB12_11
.LBB12_12:
	cmp	r10, r9
	je	.LBB12_19
# BB#13:
	lea	rdi, [rdi + 8*r9]
	lea	rsi, [rsi + 8*r9]
.LBB12_14:
	lea	rax, [rdi + 8]
	cmp	r11, rax
	cmova	rax, r11
	mov	rcx, rdi
	not	rcx
	add	rcx, rax
	mov	eax, ecx
	shr	eax, 3
	inc	eax
	and	rax, 7
	je	.LBB12_17
# BB#15:
	neg	rax
	.p2align	4, 0x90
.LBB12_16:                              # =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rsi]
	add	rsi, 8
	mov	qword ptr [rdi], rdx
	add	rdi, 8
	inc	rax
	jne	.LBB12_16
.LBB12_17:
	cmp	rcx, 56
	jb	.LBB12_19
	.p2align	4, 0x90
.LBB12_18:                              # =>This Inner Loop Header: Depth=1
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
	cmp	rdi, r11
	jb	.LBB12_18
.LBB12_19:
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end12:
	.size	asm_memcopy_uint64_sse4_2, .Lfunc_end12-asm_memcopy_uint64_sse4_2

	.globl	asm_memset_sse4_2
	.p2align	4, 0x90
	.type	asm_memset_sse4_2,@function
asm_memset_sse4_2:                      # @asm_memset_sse4_2
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
	cmp	r11, 32
	jb	.LBB13_12
# BB#2:
	mov	r8, r11
	and	r8, -32
	mov	r10, r11
	and	r10, -32
	je	.LBB13_12
# BB#3:
	movzx	eax, sil
	movd	xmm0, eax
	pxor	xmm1, xmm1
	pshufb	xmm0, xmm1
	lea	r9, [r10 - 32]
	mov	ecx, r9d
	shr	ecx, 5
	inc	ecx
	and	rcx, 7
	je	.LBB13_4
# BB#5:
	neg	rcx
	xor	eax, eax
	.p2align	4, 0x90
.LBB13_6:                               # =>This Inner Loop Header: Depth=1
	movdqu	xmmword ptr [rdi + rax], xmm0
	movdqu	xmmword ptr [rdi + rax + 16], xmm0
	add	rax, 32
	inc	rcx
	jne	.LBB13_6
	jmp	.LBB13_7
.LBB13_4:
	xor	eax, eax
.LBB13_7:
	cmp	r9, 224
	jb	.LBB13_10
# BB#8:
	mov	rcx, r10
	sub	rcx, rax
	lea	rax, [rdi + rax + 240]
	.p2align	4, 0x90
.LBB13_9:                               # =>This Inner Loop Header: Depth=1
	movdqu	xmmword ptr [rax - 240], xmm0
	movdqu	xmmword ptr [rax - 224], xmm0
	movdqu	xmmword ptr [rax - 208], xmm0
	movdqu	xmmword ptr [rax - 192], xmm0
	movdqu	xmmword ptr [rax - 176], xmm0
	movdqu	xmmword ptr [rax - 160], xmm0
	movdqu	xmmword ptr [rax - 144], xmm0
	movdqu	xmmword ptr [rax - 128], xmm0
	movdqu	xmmword ptr [rax - 112], xmm0
	movdqu	xmmword ptr [rax - 96], xmm0
	movdqu	xmmword ptr [rax - 80], xmm0
	movdqu	xmmword ptr [rax - 64], xmm0
	movdqu	xmmword ptr [rax - 48], xmm0
	movdqu	xmmword ptr [rax - 32], xmm0
	movdqu	xmmword ptr [rax - 16], xmm0
	movdqu	xmmword ptr [rax], xmm0
	add	rax, 256
	add	rcx, -256
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
	ret
.Lfunc_end13:
	.size	asm_memset_sse4_2, .Lfunc_end13-asm_memset_sse4_2

	.globl	asm_bitmap_get_bit_num_sse4_2
	.p2align	4, 0x90
	.type	asm_bitmap_get_bit_num_sse4_2,@function
asm_bitmap_get_bit_num_sse4_2:          # @asm_bitmap_get_bit_num_sse4_2
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
	.size	asm_bitmap_get_bit_num_sse4_2, .Lfunc_end14-asm_bitmap_get_bit_num_sse4_2

	.globl	asm_bkdr_hash_sse4_2
	.p2align	4, 0x90
	.type	asm_bkdr_hash_sse4_2,@function
asm_bkdr_hash_sse4_2:                   # @asm_bkdr_hash_sse4_2
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
	.size	asm_bkdr_hash_sse4_2, .Lfunc_end15-asm_bkdr_hash_sse4_2

	.globl	asm_multi_and_sum_sse4_2
	.p2align	4, 0x90
	.type	asm_multi_and_sum_sse4_2,@function
asm_multi_and_sum_sse4_2:               # @asm_multi_and_sum_sse4_2
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
	.size	asm_multi_and_sum_sse4_2, .Lfunc_end16-asm_multi_and_sum_sse4_2

	.globl	asm_bitmap_get_bit_list_sse4_2
	.p2align	4, 0x90
	.type	asm_bitmap_get_bit_list_sse4_2,@function
asm_bitmap_get_bit_list_sse4_2:         # @asm_bitmap_get_bit_list_sse4_2
# BB#0:
	push	rbp
	mov	rbp, rsp
	push	rbx
	and	rsp, -8
	test	rcx, rcx
	mov	rax, rsi
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
	.size	asm_bitmap_get_bit_list_sse4_2, .Lfunc_end17-asm_bitmap_get_bit_list_sse4_2

	.globl	asm_bitmap_bit_one_mask_sse4_2
	.p2align	4, 0x90
	.type	asm_bitmap_bit_one_mask_sse4_2,@function
asm_bitmap_bit_one_mask_sse4_2:         # @asm_bitmap_bit_one_mask_sse4_2
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rdx, rdx
	jle	.LBB18_8
# BB#1:
	lea	r8, [rdi + 8*rdx]
	xor	edx, edx
	.p2align	4, 0x90
.LBB18_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB18_4 Depth 2
	mov	r9, qword ptr [rdi]
	test	r9, r9
	je	.LBB18_7
# BB#3:                                 #   in Loop: Header=BB18_2 Depth=1
	mov	rax, r9
	.p2align	4, 0x90
.LBB18_4:                               #   Parent Loop BB18_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	rcx, rdx
	shr	rcx, 6
	mov	rcx, qword ptr [rsi + 8*rcx]
	bt	rcx, rdx
	jb	.LBB18_6
# BB#5:                                 #   in Loop: Header=BB18_4 Depth=2
	mov	rcx, rax
	neg	rcx
	and	rcx, rax
	not	rcx
	and	r9, rcx
	mov	qword ptr [rdi], r9
.LBB18_6:                               #   in Loop: Header=BB18_4 Depth=2
	lea	rcx, [rax - 1]
	inc	rdx
	and	rax, rcx
	jne	.LBB18_4
.LBB18_7:                               #   in Loop: Header=BB18_2 Depth=1
	add	rdi, 8
	cmp	rdi, r8
	jb	.LBB18_2
.LBB18_8:
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end18:
	.size	asm_bitmap_bit_one_mask_sse4_2, .Lfunc_end18-asm_bitmap_bit_one_mask_sse4_2


	.ident	"Apple LLVM version 8.1.0 (clang-802.0.42)"
	.section	".note.GNU-stack","",@progbits
