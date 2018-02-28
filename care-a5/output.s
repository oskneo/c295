	.file	"output.c"
	.text
	.p2align 4,,15
	.globl	bitstr
	.type	bitstr, @function
bitstr:
.LFB24:
	.cfi_startproc
	movslq	%edx, %rcx
	testl	%edx, %edx
	movq	%rsi, %rax
	movb	$0, (%rsi,%rcx)
	leal	-1(%rdx), %r9d
	je	.L5
	movl	%r9d, %r8d
	movslq	%r9d, %r9
	xorl	%edx, %edx
	notq	%r8
	addq	%rsi, %r9
	.p2align 4,,10
	.p2align 3
.L4:
	movl	%edi, %ecx
	shrq	%rdi
	andl	$1, %ecx
	addl	$48, %ecx
	movb	%cl, (%r9,%rdx)
	subq	$1, %rdx
	cmpq	%r8, %rdx
	jne	.L4
.L5:
	rep ret
	.cfi_endproc
.LFE24:
	.size	bitstr, .-bitstr
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%8x"
	.text
	.p2align 4,,15
	.globl	f_printbits
	.type	f_printbits, @function
f_printbits:
.LFB25:
	.cfi_startproc
	movss	%xmm0, -12(%rsp)
	movl	-12(%rsp), %edx
	movl	$.LC0, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	jmp	__printf_chk
	.cfi_endproc
.LFE25:
	.size	f_printbits, .-f_printbits
	.section	.rodata.str1.1
.LC1:
	.string	"%e\n"
.LC2:
	.string	"%e = %c 0.%s x 2^-126\n"
.LC3:
	.string	"%e = %c 1.%s x 2^%d\n"
	.text
	.p2align 4,,15
	.globl	f_print
	.type	f_print, @function
f_print:
.LFB26:
	.cfi_startproc
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movd	%xmm0, 12(%rsp)
	movl	12(%rsp), %esi
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movl	%esi, %eax
	movl	%esi, %r8d
	shrl	$31, %eax
	cmpl	$1, %eax
	sbbl	%edx, %edx
	shrl	$23, %r8d
	andl	$8388607, %esi
	andl	$-2, %edx
	movzbl	%r8b, %r8d
	addl	$45, %edx
	cmpl	$255, %r8d
	je	.L20
	testl	%r8d, %r8d
	jne	.L12
	leaq	16(%rsp), %rcx
	leaq	15(%rsp), %r8
	movb	$0, 39(%rsp)
	leaq	22(%rcx), %rax
	.p2align 4,,10
	.p2align 3
.L14:
	movl	%esi, %edi
	subq	$1, %rax
	shrq	%rsi
	andl	$1, %edi
	addl	$48, %edi
	movb	%dil, 1(%rax)
	cmpq	%r8, %rax
	jne	.L14
	unpcklps	%xmm0, %xmm0
	movsbl	%dl, %edx
	movl	$.LC2, %esi
	movl	$1, %edi
	movl	$1, %eax
	cvtps2pd	%xmm0, %xmm0
	call	__printf_chk
.L8:
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L21
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	.cfi_restore_state
	leaq	16(%rsp), %rcx
	leaq	15(%rsp), %r9
	subl	$127, %r8d
	movb	$0, 39(%rsp)
	leaq	22(%rcx), %rax
	.p2align 4,,10
	.p2align 3
.L16:
	movl	%esi, %edi
	subq	$1, %rax
	shrq	%rsi
	andl	$1, %edi
	addl	$48, %edi
	movb	%dil, 1(%rax)
	cmpq	%r9, %rax
	jne	.L16
	unpcklps	%xmm0, %xmm0
	movsbl	%dl, %edx
	movl	$.LC3, %esi
	movl	$1, %edi
	movl	$1, %eax
	cvtps2pd	%xmm0, %xmm0
	call	__printf_chk
	jmp	.L8
.L20:
	unpcklps	%xmm0, %xmm0
	movl	$.LC1, %esi
	movl	$1, %edi
	movl	$1, %eax
	cvtps2pd	%xmm0, %xmm0
	call	__printf_chk
	jmp	.L8
.L21:
	call	__stack_chk_fail
	.cfi_endproc
.LFE26:
	.size	f_print, .-f_print
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
