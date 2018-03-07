	.file	"main.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Error:  sum mismatch"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Sample %d completed in %d cycles.\n"
	.section	.rodata.str1.1
.LC2:
	.string	"Average of %ld cycles.\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB3:
	.section	.text.startup,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	xorl	%edi, %edi
	movl	$A, %ebx
	subq	$312, %rsp
	.cfi_def_cfa_offset 336
	movq	%fs:40, %rax
	movq	%rax, 296(%rsp)
	xorl	%eax, %eax
	call	time
	movl	%eax, %edi
	call	srand
	movl	$0, Q(%rip)
	.p2align 4,,10
	.p2align 3
.L3:
	call	rand
	cltd
	shrl	$22, %edx
	addl	%edx, %eax
	andl	$1023, %eax
	subl	%edx, %eax
	subl	$512, %eax
	testl	%eax, %eax
	movl	%eax, (%rbx)
	jle	.L2
	addl	%eax, Q(%rip)
.L2:
	addq	$4, %rbx
	cmpq	$A+400, %rbx
	jne	.L3
	movl	$cycles, %ebx
	movq	%rbx, %rbp
	.p2align 4,,10
	.p2align 3
.L6:
	xorl	%edi, %edi
	movq	%rsp, %rsi
	call	getrusage
	movl	$100, %esi
	movl	$A, %edi
	call	sum_plus
	leaq	144(%rsp), %rsi
	xorl	%edi, %edi
	movl	%eax, P(%rip)
	call	getrusage
	movq	144(%rsp), %rax
	subq	(%rsp), %rax
	imull	$10000000, %eax, %eax
	subl	8(%rsp), %eax
	addl	152(%rsp), %eax
	movl	%eax, 0(%rbp)
	movl	Q(%rip), %eax
	cmpl	%eax, P(%rip)
	jne	.L14
	addq	$4, %rbp
	cmpq	$cycles+80, %rbp
	jne	.L6
	movq	$0, total(%rip)
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L7:
	movl	(%rbx), %ecx
	addl	$1, %ebp
	xorl	%eax, %eax
	movl	%ebp, %edx
	movl	$.LC1, %esi
	movl	$1, %edi
	addq	$4, %rbx
	call	__printf_chk
	movslq	-4(%rbx), %rax
	addq	total(%rip), %rax
	cmpl	$20, %ebp
	movq	%rax, total(%rip)
	jne	.L7
	movl	$20, %ecx
	cqto
	movl	$.LC2, %esi
	idivq	%rcx
	movl	$1, %edi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk
.L1:
	movq	296(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L15
	addq	$312, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L14:
	.cfi_restore_state
	movl	$.LC0, %edi
	call	perror
	jmp	.L1
.L15:
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE3:
	.section	.text.startup
.LHOTE3:
	.globl	end_time
	.data
	.align 4
	.type	end_time, @object
	.size	end_time, 4
end_time:
	.long	125
	.globl	start_time
	.align 4
	.type	start_time, @object
	.size	start_time, 4
start_time:
	.long	150
	.comm	total,8,8
	.comm	cycles,80,32
	.comm	Q,4,4
	.comm	P,4,4
	.comm	A,400,32
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
