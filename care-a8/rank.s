	.file	"rank.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	compute_ranks
	.type	compute_ranks, @function
compute_ranks:
.LFB0:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	testl	%esi, %esi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leal	3(%rsi), %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	cmovns	%esi, %ebp
	movq	%rcx, -16(%rsp)
	movq	%r8, -8(%rsp)
	andl	$-4, %ebp
	testl	%esi, %esi
	jle	.L24
	leal	-1(%rsi), %ebx
	movq	%rdi, %r13
	xorl	%r14d, %r14d
	xorl	%r8d, %r8d
	xorl	%r12d, %r12d
	movl	%ebx, %eax
	leaq	4(%rdi,%rax,4), %r15
	.p2align 4,,10
	.p2align 3
.L21:
	xorl	%eax, %eax
	testl	%ebp, %ebp
	movl	$1, (%rdx)
	movss	0(%r13), %xmm0
	jle	.L4
	movl	$1, %ecx
	xorl	%eax, %eax
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L13:
	addl	$4, %eax
	cmpl	%eax, %ebp
	jle	.L39
.L14:
	movslq	%eax, %r11
	movss	(%rdi,%r11,4), %xmm1
	leaq	0(,%r11,4), %r10
	ucomiss	%xmm0, %xmm1
	jbe	.L5
	addl	$1, %ecx
	movl	%ecx, (%rdx)
.L5:
	movss	4(%rdi,%r10), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L7
	addl	$1, %ecx
	movl	%ecx, (%rdx)
.L7:
	movss	8(%rdi,%r10), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L9
	addl	$1, %ecx
	movl	%ecx, (%rdx)
.L9:
	movss	12(%rdi,%r10), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L11
	addl	$1, %ecx
	movl	%ecx, (%rdx)
.L11:
	cmpl	%ecx, %ebx
	jne	.L13
	movl	%esi, %eax
	subl	$1, %ebx
	addl	$4, %eax
	cmpl	%eax, %ebp
	jg	.L14
.L39:
	cmpl	%eax, %esi
	jle	.L15
.L4:
	movslq	%eax, %rcx
	leaq	(%rdi,%rcx,4), %rcx
	.p2align 4,,10
	.p2align 3
.L18:
	movss	(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L16
	addl	$1, (%rdx)
.L16:
	addl	$1, %eax
	addq	$4, %rcx
	cmpl	%eax, %esi
	jg	.L18
.L15:
	pxor	%xmm1, %xmm1
	ucomiss	.LC0(%rip), %xmm0
	cvtsi2ss	%r12d, %xmm1
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %r12d
	jb	.L19
	pxor	%xmm1, %xmm1
	addl	$1, %r14d
	cvtsi2ss	%r8d, %xmm1
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %r8d
.L19:
	addq	$4, %r13
	addq	$4, %rdx
	cmpq	%r13, %r15
	jne	.L21
	pxor	%xmm1, %xmm1
	movq	-16(%rsp), %rax
	pxor	%xmm0, %xmm0
	testl	%r14d, %r14d
	cvtsi2ss	%r12d, %xmm1
	cvtsi2ss	%esi, %xmm0
	divss	%xmm0, %xmm1
	movss	%xmm1, (%rax)
	je	.L2
	pxor	%xmm0, %xmm0
	movq	-8(%rsp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2ss	%r8d, %xmm0
	cvtsi2ss	%r14d, %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
.L2:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movl	%r14d, (%r9)
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L24:
	.cfi_restore_state
	xorl	%r14d, %r14d
	popq	%rbx
	.cfi_def_cfa_offset 48
	movl	%r14d, (%r9)
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	compute_ranks, .-compute_ranks
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1112014848
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
