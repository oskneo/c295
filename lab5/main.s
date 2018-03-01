	.file	"main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"It took %ld microseconds to initialize the array.\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.section	.text.startup,"ax",@progbits
.LHOTB1:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xorl	%edi, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	$A+4, %r12d
	movl	$1, %ebp
	movl	$1374389535, %ebx
	subq	$888, %rsp
	.cfi_def_cfa_offset 928
	movq	%fs:40, %rax
	movq	%rax, 872(%rsp)
	xorl	%eax, %eax
	call	time
	movl	%eax, %edi
	call	srand
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	getrusage
	movl	$0, A(%rip)
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%ebp, %eax
	addq	$4, %r12
	imull	%ebx
	movl	%ebp, %eax
	addl	$1, %ebp
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	movl	%edx, -4(%r12)
	call	rand
	movl	%eax, %r13d
	call	rand
	movslq	%r13d, %rcx
	movl	%r13d, %edx
	imulq	$-2147418109, %rcx, %rcx
	sarl	$31, %edx
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
	cltd
	sall	$16, %r13d
	shrq	$32, %rcx
	addl	%eax, %ecx
	sarl	$15, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	sall	$16, %edx
	subl	%ecx, %edx
	subl	%edx, %eax
	orl	%r13d, %eax
	cltd
	idivl	%ebp
	movl	-4(%r12), %eax
	movslq	%edx, %rdx
	movl	A(,%rdx,4), %ecx
	movl	%ecx, -4(%r12)
	cmpl	$1000000, %ebp
	movl	%eax, A(,%rdx,4)
	jne	.L2
	leaq	432(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	movq	456(%rsp), %rdx
	addq	440(%rsp), %rdx
	movl	$.LC0, %esi
	subq	8(%rsp), %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	subq	24(%rsp), %rdx
	call	__printf_chk
	leaq	144(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	movl	$1000000, %esi
	movl	$A, %edi
	call	qsort295_1
	leaq	576(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	movq	600(%rsp), %rdx
	addq	584(%rsp), %rdx
	movl	$.LC0, %esi
	subq	152(%rsp), %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	subq	168(%rsp), %rdx
	call	__printf_chk
	leaq	288(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	movl	$1000000, %esi
	movl	$A, %edi
	call	qsort295_2
	leaq	720(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage
	movq	744(%rsp), %rdx
	addq	728(%rsp), %rdx
	xorl	%eax, %eax
	subq	296(%rsp), %rdx
	movl	$.LC0, %esi
	movl	$1, %edi
	subq	312(%rsp), %rdx
	call	__printf_chk
	movq	872(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L7
	addq	$888, %rsp
	.cfi_remember_state
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
.L7:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE1:
	.section	.text.startup
.LHOTE1:
	.comm	A,4000000,32
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
