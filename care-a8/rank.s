	.file	"rank.c"
	.text
	.p2align 4,,15
	.globl	compute_ranks
	.type	compute_ranks, @function
compute_ranks:
.LFB0:
	.cfi_startproc
	testl	%esi, %esi
	movl	$0, (%r9)
	movl	$0x00000000, (%rcx)
	movl	$0x00000000, (%r8)
	jle	.L1
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L4:
	movl	$1, (%rdx,%r10,4)
	addq	$1, %r10
	cmpl	%r10d, %esi
	jg	.L4
	movslq	%esi, %rax
	xorl	%r10d, %r10d
	leaq	(%rdi,%rax,4), %r11
	.p2align 4,,10
	.p2align 3
.L15:
	cmpq	%rdi, %r11
	jbe	.L9
	movss	(%rdi,%r10,4), %xmm1
	movq	%rdi, %rax
	.p2align 4,,10
	.p2align 3
.L10:
	movss	(%rax), %xmm0
	ucomiss	%xmm1, %xmm0
	jbe	.L5
	addl	$1, (%rdx,%r10,4)
.L5:
	addq	$4, %rax
	cmpq	%rax, %r11
	ja	.L10
.L9:
	addq	$1, %r10
	cmpl	%r10d, %esi
	jg	.L15
	leal	-1(%rsi), %edx
	movss	(%rcx), %xmm0
	movq	%rdi, %rax
	leaq	4(%rdi,%rdx,4), %rdx
	.p2align 4,,10
	.p2align 3
.L14:
	addss	(%rax), %xmm0
	movss	%xmm0, (%rcx)
	movss	(%rax), %xmm1
	ucomiss	.LC1(%rip), %xmm1
	jb	.L11
	addss	(%r8), %xmm1
	movss	%xmm1, (%r8)
	addl	$1, (%r9)
	movss	(%rcx), %xmm0
.L11:
	addq	$4, %rax
	cmpq	%rdx, %rax
	jne	.L14
	cvtsi2ss	%esi, %xmm1
	movl	(%r9), %eax
	testl	%eax, %eax
	divss	%xmm1, %xmm0
	movss	%xmm0, (%rcx)
	je	.L1
	cvtsi2ss	%eax, %xmm1
	movss	(%r8), %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, (%r8)
	ret
.L1:
	rep ret
	.cfi_endproc
.LFE0:
	.size	compute_ranks, .-compute_ranks
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC1:
	.long	1112014848
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
