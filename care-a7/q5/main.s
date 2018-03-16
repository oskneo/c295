	.file	"main.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Average of %ld cycles.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%edi, %edi
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	xorl	%ebx, %ebx
	call	time
	movl	%eax, %edi
	call	srand
	call	newLL
	movq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	leal	(%rbx,%rbx), %eax
	movl	%eax, A(,%rbx,4)
	call	rand
	movl	%eax, %r12d
	call	rand
	movslq	%r12d, %rcx
	movl	%r12d, %edx
	movl	%eax, %esi
	imulq	$-2147418109, %rcx, %rcx
	sarl	$31, %edx
	sarl	$31, %esi
	shrq	$32, %rcx
	addl	%r12d, %ecx
	sarl	$14, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	sall	$15, %edx
	subl	%ecx, %edx
	movslq	%eax, %rcx
	imulq	$-2147450879, %rcx, %rcx
	subl	%edx, %r12d
	movl	%r12d, %edx
	sall	$16, %edx
	shrq	$32, %rcx
	addl	%eax, %ecx
	sarl	$15, %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	sall	$16, %esi
	subl	%ecx, %esi
	leal	1(%rbx), %ecx
	subl	%esi, %eax
	orl	%eax, %edx
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	A(,%rbx,4), %eax
	movslq	%edx, %rdx
	movl	A(,%rdx,4), %ecx
	movl	%ecx, A(,%rbx,4)
	addq	$1, %rbx
	movl	%eax, A(,%rdx,4)
	cmpq	$200, %rbx
	jne	.L3
	movl	$A, %ebx
	.p2align 4,,10
	.p2align 3
.L5:
	movl	(%rbx), %esi
	movq	%rbp, %rdi
	addq	$4, %rbx
	call	appendLL
	cmpq	$A+800, %rbx
	jne	.L5
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L8:
#APP
# 44 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	$A, %edi
	movl	%esi, start_time(%rip)
	movl	%r12d, %edx
	movl	$200, %esi
	call	lsearch
	movslq	%r12d, %rsi
	movl	%eax, P(,%rsi,4)
#APP
# 56 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %edi
	
# 0 "" 2
#NO_APP
	movl	%edi, end_time(%rip)
	subl	start_time(%rip), %edi
	xorl	%eax, %eax
	cmpl	$4000, %edi
	movl	%edi, cycles(,%rsi,4)
	setge	%al
	subl	%eax, %r12d
	addl	$1, %r12d
	cmpl	$399, %r12d
	jle	.L8
	movl	$cycles, %edx
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L10:
	movslq	(%rdx), %rax
	addq	$4, %rdx
	addq	%rax, %rcx
	cmpq	$cycles+1600, %rdx
	jne	.L10
	movq	%rcx, %rax
	movabsq	$-6640827866535438581, %rdx
	movq	%rcx, total(%rip)
	imulq	%rdx
	movl	$1, %edi
	movl	$.LC0, %esi
	xorl	%eax, %eax
	addq	%rcx, %rdx
	sarq	$63, %rcx
	sarq	$8, %rdx
	subq	%rcx, %rdx
	call	__printf_chk
	popq	%rbx
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	freeLL
	.cfi_endproc
.LFE39:
	.size	main, .-main
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
	.comm	cycles,1600,32
	.comm	Q,1600,32
	.comm	P,1600,32
	.comm	A,800,32
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
