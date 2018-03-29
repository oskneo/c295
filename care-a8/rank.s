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
	leal	3(%rsi), %r14d
	testl	%esi, %esi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	cmovns	%esi, %r14d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	andl	$-4, %r14d
	movq	%rdx, -40(%rsp)
	movq	%rcx, -16(%rsp)
	movq	%r8, -8(%rsp)
	movq	%r9, -32(%rsp)
	jle	.L90
	leal	-1(%r14), %eax
	leaq	12(%rdi), %r12
	movl	%r14d, -20(%rsp)
	xorl	%ebx, %ebx
	xorl	%r15d, %r15d
	shrl	$2, %eax
	movq	%r12, %r11
	leal	4(,%rax,4), %ebp
	movl	%eax, %ecx
	salq	$4, %rcx
	leaq	28(%rdi,%rcx), %r8
	movslq	%ebp, %rcx
	leaq	(%rdi,%rcx,4), %rax
	movq	%rax, -48(%rsp)
	leal	-1(%rsi), %eax
	movq	-48(%rsp), %r14
	subl	%ebp, %eax
	leaq	1(%rcx,%rax), %rcx
	leaq	(%rdi,%rcx,4), %r10
	movl	%ebp, %ecx
	leaq	1(%rcx,%rax), %rax
	leaq	(%rdi,%rcx,4), %r13
	leaq	(%rdi,%rax,4), %r9
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L67:
	movl	$1, (%rdx)
	movss	-12(%r11), %xmm0
	movq	%r12, %rcx
	.p2align 4,,10
	.p2align 3
.L11:
	movss	-12(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L3
	addl	$1, (%rdx)
.L3:
	movss	-8(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L5
	addl	$1, (%rdx)
.L5:
	movss	-4(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L7
	addl	$1, (%rdx)
.L7:
	movss	(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L9
	addl	$1, (%rdx)
.L9:
	addq	$16, %rcx
	cmpq	%r8, %rcx
	jne	.L11
	cmpl	%ebp, %esi
	movq	%r14, %rcx
	jle	.L18
	.p2align 4,,10
	.p2align 3
.L122:
	movss	(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L15
	addl	$1, (%rdx)
.L15:
	addq	$4, %rcx
	cmpq	%r10, %rcx
	jne	.L122
.L18:
	pxor	%xmm1, %xmm1
	ucomiss	.LC0(%rip), %xmm0
	cvtsi2ss	%r15d, %xmm1
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %r15d
	jb	.L14
	pxor	%xmm1, %xmm1
	addl	$1, %ebx
	cvtsi2ss	%eax, %xmm1
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
.L14:
	movl	$1, 4(%rdx)
	movss	-8(%r11), %xmm0
	movq	%r12, %rcx
	.p2align 4,,10
	.p2align 3
.L27:
	movss	-12(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L19
	addl	$1, 4(%rdx)
.L19:
	movss	-8(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L21
	addl	$1, 4(%rdx)
.L21:
	movss	-4(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L23
	addl	$1, 4(%rdx)
.L23:
	movss	(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L25
	addl	$1, 4(%rdx)
.L25:
	addq	$16, %rcx
	cmpq	%r8, %rcx
	jne	.L27
	cmpl	%ebp, %esi
	movq	%r13, %rcx
	jle	.L34
	.p2align 4,,10
	.p2align 3
.L121:
	movss	(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L31
	addl	$1, 4(%rdx)
.L31:
	addq	$4, %rcx
	cmpq	%r9, %rcx
	jne	.L121
.L34:
	pxor	%xmm1, %xmm1
	ucomiss	.LC0(%rip), %xmm0
	cvtsi2ss	%r15d, %xmm1
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %r15d
	jb	.L30
	pxor	%xmm1, %xmm1
	addl	$1, %ebx
	cvtsi2ss	%eax, %xmm1
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
.L30:
	movl	$1, 8(%rdx)
	movss	-4(%r11), %xmm0
	movq	%r12, %rcx
	.p2align 4,,10
	.p2align 3
.L43:
	movss	-12(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L35
	addl	$1, 8(%rdx)
.L35:
	movss	-8(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L37
	addl	$1, 8(%rdx)
.L37:
	movss	-4(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L39
	addl	$1, 8(%rdx)
.L39:
	movss	(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L41
	addl	$1, 8(%rdx)
.L41:
	addq	$16, %rcx
	cmpq	%r8, %rcx
	jne	.L43
	cmpl	%ebp, %esi
	movq	%r13, %rcx
	jle	.L50
	.p2align 4,,10
	.p2align 3
.L120:
	movss	(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L47
	addl	$1, 8(%rdx)
.L47:
	addq	$4, %rcx
	cmpq	%r9, %rcx
	jne	.L120
.L50:
	pxor	%xmm1, %xmm1
	ucomiss	.LC0(%rip), %xmm0
	cvtsi2ss	%r15d, %xmm1
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %r15d
	jb	.L46
	pxor	%xmm1, %xmm1
	addl	$1, %ebx
	cvtsi2ss	%eax, %xmm1
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
.L46:
	movl	$1, 12(%rdx)
	movss	(%r11), %xmm0
	movq	%r12, %rcx
	.p2align 4,,10
	.p2align 3
.L59:
	movss	-12(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L51
	addl	$1, 12(%rdx)
.L51:
	movss	-8(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L53
	addl	$1, 12(%rdx)
.L53:
	movss	-4(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L55
	addl	$1, 12(%rdx)
.L55:
	movss	(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L57
	addl	$1, 12(%rdx)
.L57:
	addq	$16, %rcx
	cmpq	%r8, %rcx
	jne	.L59
	cmpl	%ebp, %esi
	movq	%r13, %rcx
	jle	.L66
	.p2align 4,,10
	.p2align 3
.L119:
	movss	(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L63
	addl	$1, 12(%rdx)
.L63:
	addq	$4, %rcx
	cmpq	%r9, %rcx
	jne	.L119
.L66:
	pxor	%xmm1, %xmm1
	ucomiss	.LC0(%rip), %xmm0
	cvtsi2ss	%r15d, %xmm1
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %r15d
	jb	.L62
	pxor	%xmm1, %xmm1
	addl	$1, %ebx
	cvtsi2ss	%eax, %xmm1
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
.L62:
	addq	$16, %r11
	addq	$16, %rdx
	cmpq	%r8, %r11
	jne	.L67
	cmpl	%ebp, %esi
	movl	-20(%rsp), %r14d
	jle	.L68
.L142:
	leal	-1(%rsi), %r12d
	movslq	%ebp, %rcx
	movq	-40(%rsp), %r11
	leaq	0(,%rcx,4), %r9
	movl	%r12d, %r8d
	subl	%ebp, %r8d
	movq	%r11, %rdx
	leaq	1(%rcx,%r8), %rcx
	addq	%r9, %rdx
	addq	%rdi, %r9
	leaq	(%r11,%rcx,4), %r13
	leal	-1(%r14), %ecx
	shrl	$2, %ecx
	movl	%ecx, %r8d
	leal	4(,%rcx,4), %ebp
	salq	$4, %r8
	leaq	28(%rdi,%r8), %r8
	.p2align 4,,10
	.p2align 3
.L86:
	xorl	%r10d, %r10d
	testl	%r14d, %r14d
	movl	$1, (%rdx)
	movss	(%r9), %xmm0
	jle	.L70
	leaq	12(%rdi), %rcx
	.p2align 4,,10
	.p2align 3
.L79:
	movss	-12(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L71
	addl	$1, (%rdx)
.L71:
	movss	-8(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L73
	addl	$1, (%rdx)
.L73:
	movss	-4(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L75
	addl	$1, (%rdx)
.L75:
	movss	(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L77
	addl	$1, (%rdx)
.L77:
	addq	$16, %rcx
	cmpq	%r8, %rcx
	jne	.L79
	cmpl	%ebp, %esi
	movl	%ebp, %r10d
	jle	.L85
.L70:
	movslq	%r10d, %r11
	leaq	(%rdi,%r11,4), %rcx
	movq	%rcx, -48(%rsp)
	movl	%r12d, %ecx
	subl	%r10d, %ecx
	leaq	1(%r11,%rcx), %r10
	movq	-48(%rsp), %rcx
	leaq	(%rdi,%r10,4), %r10
	.p2align 4,,10
	.p2align 3
.L84:
	movss	(%rcx), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L82
	addl	$1, (%rdx)
.L82:
	addq	$4, %rcx
	cmpq	%rcx, %r10
	jne	.L84
.L85:
	pxor	%xmm1, %xmm1
	ucomiss	.LC0(%rip), %xmm0
	cvtsi2ss	%r15d, %xmm1
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %r15d
	jb	.L81
	pxor	%xmm1, %xmm1
	addl	$1, %ebx
	cvtsi2ss	%eax, %xmm1
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
.L81:
	addq	$4, %rdx
	addq	$4, %r9
	cmpq	%rdx, %r13
	jne	.L86
.L87:
	pxor	%xmm1, %xmm1
	movq	-16(%rsp), %rdi
	pxor	%xmm0, %xmm0
	cvtsi2ss	%r15d, %xmm1
	cvtsi2ss	%esi, %xmm0
	divss	%xmm0, %xmm1
	movss	%xmm1, (%rdi)
.L88:
	testl	%ebx, %ebx
	je	.L89
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ss	%eax, %xmm0
	movq	-8(%rsp), %rax
	cvtsi2ss	%ebx, %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
.L89:
	movq	-32(%rsp), %rax
	movl	%ebx, (%rax)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
.L90:
	.cfi_restore_state
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	cmpl	%ebp, %esi
	jg	.L142
.L68:
	testl	%esi, %esi
	jle	.L88
	jmp	.L87
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
