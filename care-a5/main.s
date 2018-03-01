	.file	"main.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	cmpstringp
	.type	cmpstringp, @function
cmpstringp:
.LFB24:
	.cfi_startproc
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	(%rdi), %xmm0
	cvtss2sd	(%rsi), %xmm1
	jmp	strcmp
	.cfi_endproc
.LFE24:
	.size	cmpstringp, .-cmpstringp
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	u2f
	.type	u2f, @function
u2f:
.LFB23:
	.cfi_startproc
	movl	%edi, -4(%rsp)
	movss	-4(%rsp), %xmm0
	ret
	.cfi_endproc
.LFE23:
	.size	u2f, .-u2f
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"Test Case 1:\n"
.LC6:
	.string	"The total before sorting: "
.LC7:
	.string	" The total after sorting: "
.LC8:
	.string	"\nTest Case 2:\n"
.LC10:
	.string	""
	.section	.text.unlikely
.LCOLDB11:
	.section	.text.startup,"ax",@progbits
.LHOTB11:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	subq	$328, %rsp
	.cfi_def_cfa_offset 336
	movl	$.LC3, %edi
	movq	%fs:40, %rax
	movq	%rax, 312(%rsp)
	xorl	%eax, %eax
	call	puts
	leaq	20(%rsp), %rax
	leaq	112(%rsp), %rdx
	movl	$0x5060000f, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L4:
	movl	$0x43800005, (%rax)
	addq	$4, %rax
	cmpq	%rax, %rdx
	jne	.L4
	movl	$.LC6, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movss	.LC4(%rip), %xmm0
	call	f_printbits
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc
	movl	$.LC7, %esi
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
	movl	$.LC8, %edi
	call	puts
	leaq	112(%rsp), %rdi
	xorl	%esi, %esi
	movl	$2, %ecx
	pxor	%xmm0, %xmm0
	movl	$-1840700269, %r8d
	movsd	.LC9(%rip), %xmm2
	movl	$1431655766, %r9d
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L7:
	movl	%esi, %eax
	movl	%esi, %ecx
	imull	%r9d
	movl	%esi, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	leal	(%rdx,%rdx,2), %eax
	subl	%eax, %ecx
	cmpl	$1, %ecx
	sbbl	%ecx, %ecx
	addq	$4, %rdi
	notl	%ecx
	addl	$2, %ecx
.L5:
	movl	%esi, %eax
	pxor	%xmm1, %xmm1
	imull	%r8d
	movl	%esi, %eax
	sarl	$31, %eax
	addl	%esi, %edx
	sarl	$2, %edx
	subl	%eax, %edx
	leal	0(,%rdx,8), %eax
	subl	%edx, %eax
	cmpl	%eax, %esi
	sete	%al
	addl	$1, %esi
	movzbl	%al, %eax
	addl	%eax, %ecx
	cmpl	$50, %esi
	cvtsi2sd	%ecx, %xmm1
	mulsd	%xmm2, %xmm1
	cvtsd2ss	%xmm1, %xmm1
	movss	%xmm1, (%rdi)
	addss	%xmm1, %xmm0
	jne	.L7
	movl	$.LC6, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	movss	%xmm0, 12(%rsp)
	call	__printf_chk
	movss	12(%rsp), %xmm0
	call	f_printbits
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc
	movl	$.LC7, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	leaq	112(%rsp), %rdi
	movl	$50, %esi
	call	sum_float
	call	f_printbits
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc
	movl	$.LC10, %edi
	call	puts
	movq	312(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L13
	addq	$328, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L13:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE11:
	.section	.text.startup
.LHOTE11:
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC4:
	.long	1348468751
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC9:
	.long	2576980378
	.long	1069128089
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
