	.file	"dynamic.c"
	.text
	.globl	new_42
	.type	new_42, @function
new_42:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$42, -20(%rbp)
	leaq	-20(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L3
	call	__stack_chk_fail
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	new_42, .-new_42
	.globl	N
	.data
	.align 4
	.type	N, @object
	.size	N, 4
N:
	.long	1
	.text
	.globl	donotmuchofanything
	.type	donotmuchofanything, @function
donotmuchofanything:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	N(%rip), %eax
	leal	-1(%rax), %edx
	movl	%edx, N(%rip)
	testl	%eax, %eax
	je	.L6
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	donotmuchofanything
	movl	N(%rip), %eax
	addl	$1, %eax
	movl	%eax, N(%rip)
.L6:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	donotmuchofanything, .-donotmuchofanything
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
