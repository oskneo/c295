	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	cmpstringp
	.type	cmpstringp, @function
cmpstringp:
.LFB25:
	.cfi_startproc
	movss	(%rdi), %xmm0
	movss	(%rsi), %xmm1
	cvtps2pd	%xmm0, %xmm0
	cvtps2pd	%xmm1, %xmm1
	jmp	strcmp
	.cfi_endproc
.LFE25:
	.size	cmpstringp, .-cmpstringp
	.p2align 4,,15
	.globl	u2f
	.type	u2f, @function
u2f:
.LFB24:
	.cfi_startproc
	movl	%edi, -4(%rsp)
	movss	-4(%rsp), %xmm0
	ret
	.cfi_endproc
.LFE24:
	.size	u2f, .-u2f
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Test Case 1:\n"
.LC4:
	.string	"The total before sorting: "
.LC5:
	.string	" The total after sorting: "
.LC6:
	.string	"\nTest Case 2:\n"
.LC8:
	.string	""
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB26:
	.cfi_startproc
	subq	$328, %rsp
	.cfi_def_cfa_offset 336
	movl	$.LC1, %edi
	call	puts
	leaq	20(%rsp), %rax
	leaq	112(%rsp), %rdx
	movl	$0x5060000f, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L5:
	movl	$0x43800005, (%rax)
	addq	$4, %rax
	cmpq	%rdx, %rax
	jne	.L5
	movl	$.LC4, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movss	.LC2(%rip), %xmm0
	call	f_printbits
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc
	movl	$.LC5, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	leaq	16(%rsp), %rdi
	movl	$cmpstringp, %ecx
	movl	$4, %edx
	movl	$24, %esi
	xorl	%eax, %eax
	call	qsort_r
	leaq	16(%rsp), %rdi
	movl	$24, %esi
	call	sum_float
	call	f_printbits
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc
	movl	$.LC6, %edi
	call	puts
	leaq	112(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	$2, %esi
	xorps	%xmm0, %xmm0
	movl	$-1840700269, %r8d
	movsd	.LC7(%rip), %xmm2
	movl	$1431655766, %r9d
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L8:
	movl	%ecx, %eax
	movl	%ecx, %esi
	imull	%r9d
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	leal	(%rdx,%rdx,2), %eax
	subl	%eax, %esi
	cmpl	$1, %esi
	sbbl	%esi, %esi
	addq	$4, %rdi
	notl	%esi
	addl	$2, %esi
.L6:
	movl	%ecx, %eax
	imull	%r8d
	movl	%ecx, %eax
	sarl	$31, %eax
	addl	%ecx, %edx
	sarl	$2, %edx
	subl	%eax, %edx
	leal	0(,%rdx,8), %eax
	subl	%edx, %eax
	cmpl	%eax, %ecx
	sete	%al
	addl	$1, %ecx
	movzbl	%al, %eax
	addl	%eax, %esi
	cmpl	$50, %ecx
	cvtsi2sd	%esi, %xmm1
	mulsd	%xmm2, %xmm1
	unpcklpd	%xmm1, %xmm1
	cvtpd2ps	%xmm1, %xmm1
	movss	%xmm1, (%rdi)
	addss	%xmm1, %xmm0
	jne	.L8
	movl	$.LC4, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	movss	%xmm0, 12(%rsp)
	call	__printf_chk
	movss	12(%rsp), %xmm0
	call	f_printbits
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc
	movl	$.LC5, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	leaq	112(%rsp), %rdi
	movl	$cmpstringp, %ecx
	movl	$4, %edx
	movl	$50, %esi
	xorl	%eax, %eax
	call	qsort_r
	leaq	112(%rsp), %rdi
	movl	$50, %esi
	call	sum_float
	call	f_printbits
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc
	movl	$.LC8, %edi
	call	puts
	addq	$328, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC2:
	.long	1348468751
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	2576980378
	.long	1069128089
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
