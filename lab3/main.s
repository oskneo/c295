	.file	"main.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	get_byte_by_order
	.type	get_byte_by_order, @function
get_byte_by_addr:
	movl	(%rdi), %edx
	movl	$0xff, %r9d
	movl	$3, %ecx
	subl	%esi, %ecx
	imul	$8, %ecx
	shl	%cl, %r9d
	andl	%r9d, %edx
	shr	%cl, %edx
	movl	%edx, %eax
	ret

get_byte_by_order:
.LFB23:
	.cfi_startproc
	movl	$3, %ecx
	movl	$255, %eax
	subl	%esi, %ecx
	sall	$3, %ecx
	sall	%cl, %eax
	andl	%eax, %edi
	sarl	%cl, %edi
	movzbl	%dil, %eax
	ret
	.cfi_endproc
.LFE23:
	.size	get_byte_by_order, .-get_byte_by_order
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"x = 0x%08x\n"
.LC2:
	.string	"x = %u\n"
.LC3:
	.string	"y = 0x%08x\n"
.LC4:
	.string	"y = %u\n"
.LC5:
	.string	"x = 0x"
.LC6:
	.string	"%02x"
.LC7:
	.string	"y = 0x"
	.section	.text.unlikely
.LCOLDB8:
	.section	.text.startup,"ax",@progbits
.LHOTB8:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	$19088743, %edx
	movl	$.LC1, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	$19088743, x(%rip)
	movl	$-42, y(%rip)
	call	__printf_chk
	movl	x(%rip), %edx
	movl	$.LC2, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	$24, %ebx
	movl	$255, %ebp
	call	__printf_chk
	movl	y(%rip), %edx
	movl	$.LC3, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	y(%rip), %edx
	movl	$.LC4, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	$.LC5, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.L3:
	movl	%ebx, %ecx
	movl	%ebp, %edx
	xorl	%eax, %eax
	sall	%cl, %edx
	andl	x(%rip), %edx
	movl	$.LC6, %esi
	movl	$1, %edi
	subl	$8, %ebx
	sarl	%cl, %edx
	movzbl	%dl, %edx
	call	__printf_chk
	cmpl	$-8, %ebx
	jne	.L3
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	xorl	%ebx, %ebx
	call	_IO_putc
	movl	$.LC5, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.L4:
	movl	%ebx, %esi
	movl	$x, %edi
	addl	$1, %ebx
	call	get_byte_by_addr
	movl	$.LC6, %esi
	movl	%eax, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	cmpl	$4, %ebx
	jne	.L4
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	movl	$24, %ebx
	movl	$255, %ebp
	call	_IO_putc
	movl	$.LC7, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.L5:
	movl	%ebx, %ecx
	movl	%ebp, %edx
	xorl	%eax, %eax
	sall	%cl, %edx
	andl	y(%rip), %edx
	movl	$.LC6, %esi
	movl	$1, %edi
	subl	$8, %ebx
	sarl	%cl, %edx
	movzbl	%dl, %edx
	call	__printf_chk
	cmpl	$-8, %ebx
	jne	.L5
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	xorl	%ebx, %ebx
	call	_IO_putc
	movl	$.LC7, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.L6:
	movl	%ebx, %esi
	movl	$y, %edi
	addl	$1, %ebx
	call	get_byte_by_addr
	movl	$.LC6, %esi
	movl	%eax, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	cmpl	$4, %ebx
	jne	.L6
	movq	stdout(%rip), %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movl	$10, %edi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_IO_putc
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE8:
	.section	.text.startup
.LHOTE8:
	.comm	y,4,4
	.comm	x,4,4
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
