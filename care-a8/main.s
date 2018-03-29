	.file	"main.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s %f"
.LC1:
	.string	"Rank"
.LC2:
	.string	"Grade"
.LC3:
	.string	"Name"
.LC4:
	.string	"%15s  %5s  %4s\n"
.LC5:
	.string	"----"
.LC6:
	.string	"-----"
.LC7:
	.string	"----------"
.LC8:
	.string	"%15s  %2.2f  %3d\n"
.LC9:
	.string	"Number who passed: %d/%d\n"
.LC10:
	.string	"  Passing average: %2.2f\n"
.LC11:
	.string	"  Overall average: %2.2f\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC12:
	.string	"Sample %d completed in %d cycles.\n"
	.section	.rodata.str1.1
.LC13:
	.string	"Average of %ld cycles.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB48:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$grades, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	$names, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L3:
	movq	stdin(%rip), %rdx
	movl	$1024, %esi
	movl	$buf, %edi
	call	fgets
	movq	%rbp, %rcx
	movq	%rax, nul(%rip)
	movq	%rbx, %rdx
	xorl	%eax, %eax
	movl	$.LC0, %esi
	movl	$buf, %edi
	addq	$20, %rbx
	addq	$4, %rbp
	call	__isoc99_sscanf
	cmpq	$names+600, %rbx
	jne	.L3
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L6:
#APP
# 35 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	$num_passed, %r9d
	movl	%esi, start_time(%rip)
	movl	$passing_avg, %r8d
	movl	$avg, %ecx
	movl	$ranks, %edx
	movl	$30, %esi
	movl	$grades, %edi
	call	compute_ranks
#APP
# 46 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	%esi, end_time(%rip)
	subl	start_time(%rip), %esi
	movslq	%ebp, %rax
	movl	%esi, cycles(,%rax,4)
	xorl	%eax, %eax
	cmpl	$20000, %esi
	setge	%al
	subl	%eax, %ebp
	addl	$1, %ebp
	cmpl	$19, %ebp
	jle	.L6
	movl	$.LC1, %r8d
	movl	$.LC2, %ecx
	movl	$.LC3, %edx
	movl	$.LC4, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	$names, %ebp
	movl	$.LC5, %r8d
	movl	$.LC6, %ecx
	movl	$.LC7, %edx
	movl	$.LC4, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	__printf_chk
	.p2align 4,,10
	.p2align 3
.L8:
	movss	grades(%rbx), %xmm0
	movl	ranks(%rbx), %ecx
	movq	%rbp, %rdx
	movl	$.LC8, %esi
	movl	$1, %edi
	movl	$1, %eax
	cvtps2pd	%xmm0, %xmm0
	addq	$4, %rbx
	addq	$20, %rbp
	call	__printf_chk
	cmpq	$120, %rbx
	jne	.L8
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	movl	$cycles+4, %ebp
	movb	$1, %bl
	call	_IO_putc
	movl	num_passed(%rip), %edx
	movl	$30, %ecx
	movl	$.LC9, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movss	passing_avg(%rip), %xmm0
	movl	$.LC10, %esi
	movl	$1, %edi
	movl	$1, %eax
	cvtps2pd	%xmm0, %xmm0
	call	__printf_chk
	movss	avg(%rip), %xmm0
	movl	$.LC11, %esi
	movl	$1, %edi
	movl	$1, %eax
	cvtps2pd	%xmm0, %xmm0
	call	__printf_chk
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc
	movl	cycles(%rip), %ecx
	movl	$1, %edx
	movl	$.LC12, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	movq	$0, total(%rip)
	call	__printf_chk
	.p2align 4,,10
	.p2align 3
.L9:
	movl	0(%rbp), %ecx
	addl	$1, %ebx
	xorl	%eax, %eax
	movl	%ebx, %edx
	movl	$.LC12, %esi
	movl	$1, %edi
	call	__printf_chk
	leal	-1(%rbx), %eax
	cmpl	$9, %eax
	jle	.L10
	movslq	0(%rbp), %rax
	addq	%rax, total(%rip)
.L10:
	addq	$4, %rbp
	cmpl	$20, %ebx
	jne	.L9
	movq	total(%rip), %rcx
	movabsq	$7378697629483820647, %rdx
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	movq	%rcx, %rax
	sarq	$63, %rcx
	movl	$.LC13, %esi
	imulq	%rdx
	movl	$1, %edi
	xorl	%eax, %eax
	sarq	$2, %rdx
	subq	%rcx, %rdx
	jmp	__printf_chk
	.cfi_endproc
.LFE48:
	.size	main, .-main
	.comm	nul,8,8
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
	.comm	num_passed,4,4
	.comm	passing_avg,4,4
	.comm	avg,4,4
	.comm	ranks,120,32
	.comm	grades,120,32
	.comm	names,600,32
	.comm	buf,1024,32
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
