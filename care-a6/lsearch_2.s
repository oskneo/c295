	.globl	lsearch_2
lsearch_2:
	testl	%esi, %esi
	jle	emptyarray	#if (n<=0)
	movslq	%esi, %rax
	leaq	-4(%rdi,%rax,4), %rax	
	movl	(%rax), %r9d	#int tmp=A[n-1];
	movl	%edx, (%rax)	#A[n-1]=target;
	cmpl	%edx, (%rdi)
	je	foundinfirst	
	#it is used to skip the loop if found in the first element
	movl	$0, %ecx	#int i=0;
loop:
	addl	$1, %ecx	#i++;
	movslq	%ecx, %r8
	cmpl	%edx, (%rdi,%r8,4)	#while(A[i]!=target)
	jne	loop
	jmp	endloop
foundinfirst:
	movl	$0, %ecx
endloop:
	movl	%r9d, (%rax)	#A[n-1]=tmp;
	leal	-1(%rsi), %eax	
	cmpl	%ecx, %eax	
	jg	found	#if(i<n-1)
	cmpl	%edx, %r9d	#else if(A[n-1]==target)
	movl	$-1, %edx	#else{return -1;}
	cmovne	%edx, %eax	#return n-1;
	ret	
emptyarray:
	movl	$-1, %eax
	ret		#return -1;
found:
	movl	%ecx, %eax
	ret	#return i
