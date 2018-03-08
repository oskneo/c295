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
	xorl	%eax, %eax
	movl	$A, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
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
	movl	$cycles, %r12d
	movq	%r12, %rbp
	.p2align 4,,10
	.p2align 3
.L5:
#APP
# 40 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	$A, %edi
	movl	%esi, start_time(%rip)
	movl	$100, %esi
	call	sum_plus
	movl	%eax, %edi
	movl	%eax, P(%rip)
#APP
# 51 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	%esi, end_time(%rip)
	subl	start_time(%rip), %esi
	cmpl	Q(%rip), %edi
	movl	%esi, 0(%rbp)
	jne	.L14
	addq	$4, %rbp
	cmpq	$cycles+80, %rbp
	jne	.L5
	movq	$0, total(%rip)
	movl	$1, %ebx
	xorl	%ebp, %ebp
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L6:
	addl	$1, %ebp
	movl	%ebx, %r13d
	addq	$4, %r12
	leal	19(%rbp), %eax
	addl	$1, %ebx
	cmpl	%r13d, %eax
	jl	.L15
.L8:
	movl	(%r12), %ecx
	cmpl	$4000, %ecx
	jg	.L6
	movl	%ebx, %edx
	xorl	%eax, %eax
	movl	$.LC1, %esi
	movl	$1, %edi
	movl	%ebx, %r13d
	addq	$4, %r12
	call	__printf_chk
	movslq	-4(%r12), %rax
	addl	$1, %ebx
	addq	%rax, total(%rip)
	leal	19(%rbp), %eax
	cmpl	%r13d, %eax
	jge	.L8
.L15:
	movq	total(%rip), %rax
	movl	$20, %ecx
	movl	$.LC2, %esi
	movl	$1, %edi
	cqto
	idivq	%rcx
	popq	%rcx
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
	movq	%rax, %rdx
	xorl	%eax, %eax
	jmp	__printf_chk
.L14:
	.cfi_restore_state
	popq	%rsi
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	movl	$.LC0, %edi
	jmp	perror
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
