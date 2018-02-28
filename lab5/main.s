	.file	"main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"It took %ld microseconds to initialize the array.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%edi, %edi
	xorl	%eax, %eax
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$A+4, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	$1374389535, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	$1, %ebx
	subq	$296, %rsp
	.cfi_def_cfa_offset 336
	call	time
	movl	%eax, %edi
	call	srand
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	getrusage
	movl	$0, A(%rip)
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%ebx, %eax
	addq	$4, %r12
	imull	%ebp
	movl	%ebx, %eax
	addl	$1, %ebx
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	movl	%edx, -4(%r12)
	call	rand
	movl	%eax, %r13d
	call	rand
	movslq	%r13d, %rcx
	movl	%r13d, %edx
	movl	%eax, %esi
	imulq	$-2147418109, %rcx, %rcx
	sarl	$31, %edx
	sarl	$31, %esi
	shrq	$32, %rcx
	addl	%r13d, %ecx
	sarl	$14, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	sall	$15, %edx
	subl	%ecx, %edx
	movslq	%eax, %rcx
	imulq	$-2147450879, %rcx, %rcx
	subl	%edx, %r13d
	movl	%r13d, %edx
	sall	$16, %edx
	shrq	$32, %rcx
	addl	%eax, %ecx
	sarl	$15, %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	sall	$16, %esi
	subl	%ecx, %esi
	subl	%esi, %eax
	orl	%eax, %edx
	movl	%edx, %eax
	cltd
	idivl	%ebx
	movl	-4(%r12), %eax
	movslq	%edx, %rdx
	movl	A(,%rdx,4), %ecx
	movl	%ecx, -4(%r12)
	cmpl	$1000000, %ebx
	movl	%eax, A(,%rdx,4)
	jne	.L3
	leaq	144(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	movq	152(%rsp), %rdx
	subq	8(%rsp), %rdx
	movl	$.LC0, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	addq	$296, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.comm	A,4000000,32
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
