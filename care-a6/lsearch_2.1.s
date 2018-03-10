	.file	"lsearch_2.c"
	.text
	.globl	lsearch_2
	.type	lsearch_2, @function
lsearch_2:
.LFB0:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L5
	movslq	%esi, %rax
	leaq	-4(%rdi,%rax,4), %rax
	movl	(%rax), %r9d
	movl	%edx, (%rax)
	cmpl	%edx, (%rdi)
	je	.L6
	movl	$0, %ecx
.L4:
	addl	$1, %ecx
	movslq	%ecx, %r8
	cmpl	%edx, (%rdi,%r8,4)
	jne	.L4
	jmp	.L3
.L6:
	movl	$0, %ecx
.L3:
	movl	%r9d, (%rax)
	leal	-1(%rsi), %eax
	cmpl	%ecx, %eax
	jg	.L7
	cmpl	%edx, %r9d
	movl	$-1, %edx
	cmovne	%edx, %eax
	ret
.L5:
	movl	$-1, %eax
	ret
.L7:
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	lsearch_2, .-lsearch_2
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
