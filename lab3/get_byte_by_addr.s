	.globl get_byte_by_addr
get_byte_by_addr:
	movl $0, %eax   
	
	# place your code for Part 3 here

	# end of Part 3
	push	%rbp
	movq	%rsp, %rbp
	movl	(%rdi), %edx
	movl	$0xff, %r9d
	movl	$3, %ecx
	subl	%esi, %ecx
	imul	$8, %ecx
	shl	%cl, %r9d
	andl	%r9d, %edx
	shr	%cl, %edx
	movl	%edx, %eax
	pop		%rbp
	ret
