	.file	"qsorts.c"
	.text
	.p2align 4,,15
	.globl	swap
	.type	swap, @function
swap:
.LFB2:
	.cfi_startproc
	movl	(%rdi), %eax
	movl	(%rsi), %edx
	movl	%edx, (%rdi)
	movl	%eax, (%rsi)
	ret
	.cfi_endproc
.LFE2:
	.size	swap, .-swap
	.p2align 4,,15
	.globl	partition_1
	.type	partition_1, @function
partition_1:
.LFB3:
	.cfi_startproc
	movslq	%esi, %rdx
	movl	(%rdi), %r9d
	movl	%esi, %eax
	leaq	-4(%rdi,%rdx,4), %r11
	movl	$-1, %ecx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%r11), %esi
	subl	$1, %eax
	cmpl	%esi, %r9d
	jl	.L4
	movslq	%ecx, %rdx
	leaq	4(%rdi,%rdx,4), %rdx
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%rdx, %r10
	addq	$4, %rdx
	movl	-4(%rdx), %r8d
	addl	$1, %ecx
	cmpl	%r8d, %r9d
	jg	.L6
	cmpl	%ecx, %eax
	jle	.L7
	movl	%esi, (%r10)
	movl	%r8d, (%r11)
.L4:
	subq	$4, %r11
	jmp	.L3
.L7:
	rep ret
	.cfi_endproc
.LFE3:
	.size	partition_1, .-partition_1
	.p2align 4,,15
	.globl	qsort295_1
	.type	qsort295_1, @function
qsort295_1:
.LFB0:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	cmpl	$1, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%esi, %ebx
	jle	.L9
	.p2align 4,,10
	.p2align 3
.L13:
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	partition_1
	movslq	%eax, %r12
	movq	%rbp, %rdi
	subl	%r12d, %ebx
	leal	1(%r12), %esi
	leaq	4(%rbp,%r12,4), %rbp
	subl	$1, %ebx
	call	qsort295_1
	cmpl	$1, %ebx
	jg	.L13
.L9:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	qsort295_1, .-qsort295_1
	.p2align 4,,15
	.globl	partition_2
	.type	partition_2, @function
partition_2:
.LFB4:
	.cfi_startproc
	leal	-1(%rsi), %eax
	movslq	%eax, %rdx
	testl	%eax, %eax
	leaq	(%rdi,%rdx,4), %r11
	movl	(%r11), %r8d
	jle	.L20
	leal	-2(%rsi), %eax
	movq	%rdi, %rdx
	leaq	4(%rdi,%rax,4), %r9
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L19:
	movl	(%rdx), %ecx
	cmpl	%ecx, %r8d
	jl	.L17
	movslq	%eax, %rsi
	addl	$1, %eax
	leaq	(%rdi,%rsi,4), %rsi
	movl	(%rsi), %r10d
	movl	%ecx, (%rsi)
	movl	%r10d, (%rdx)
.L17:
	addq	$4, %rdx
	cmpq	%r9, %rdx
	jne	.L19
	movl	(%r11), %r8d
	movslq	%eax, %rdx
	salq	$2, %rdx
.L16:
	addq	%rdx, %rdi
	movl	(%rdi), %edx
	movl	%r8d, (%rdi)
	movl	%edx, (%r11)
	ret
.L20:
	xorl	%edx, %edx
	xorl	%eax, %eax
	jmp	.L16
	.cfi_endproc
.LFE4:
	.size	partition_2, .-partition_2
	.p2align 4,,15
	.globl	qsort295_2
	.type	qsort295_2, @function
qsort295_2:
.LFB1:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	cmpl	$1, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%esi, %ebx
	jle	.L21
	.p2align 4,,10
	.p2align 3
.L25:
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	partition_2
	movslq	%eax, %r12
	movq	%rbp, %rdi
	subl	%r12d, %ebx
	movl	%r12d, %esi
	leaq	4(%rbp,%r12,4), %rbp
	subl	$1, %ebx
	call	qsort295_2
	cmpl	$1, %ebx
	jg	.L25
.L21:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	qsort295_2, .-qsort295_2
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
