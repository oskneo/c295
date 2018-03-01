

.string1:
	.string "Please enter your name: "
.string2:
	.string "Thank you %s!\n"
.string3:
	.string "Please enter your year of birth: "


	.globl get_age



get_age:
	push %rbx              
	push %rbp              # callee saved registers

	                       # local variables:
	leaq -8(%rsp), %rsp    #   - endptr
	leaq -24(%rsp), %rsp   #   - name_str[24]
	leaq -24(%rsp), %rsp   #   - year_of_birth[24]
	mov %rsp, %rbp

	movq $.string1, %rdi
	xorl %eax, %eax
	call printf            # printf("Please enter your name: ");

	leaq 24(%rbp), %rdi
	
	call gets              # gets(name_str);

	# add your code here
	
	movq $.string2, %rdi
	addq $24, %rbp
	movq %rbp, %rsi
	xorl %eax, %eax
	
	call printf
	
askYear:
	
	movq $.string3, %rdi
	xorl %eax, %eax
	
	call printf
	
	leaq 24(%rbp), %rdi
	call gets
	jmp second
	
str2int:
	movl $0, %ecx
	movb 24(%rbp), %cl
	subb $48, %cl
	imull $1000, %ecx
	addl %ecx, %eax
	
	movl $0, %ecx
	movb 25(%rbp), %cl
	subb $48, %cl
	imull $100, %ecx
	addl %ecx, %eax
	
	movl $0, %ecx
	movb 26(%rbp), %cl
	subb $48, %cl
	imull $10, %ecx
	addl %ecx, %eax
	
	movl $0, %ecx
	movb 27(%rbp), %cl
	subb $48, %cl
	addl %ecx, %eax
	

	
	
	
	jmp third
	
	
.string4:
	.string "%s is not a valid year.\n"
	
second:
	
	#addq $24, %rbp
	leaq 24(%rbp), %rsi
	xorl %eax, %eax
	jmp str2int

invalid:
	movq $.string4, %rdi
	xorl %eax, %eax
	
	call printf
	
	jmp askYear
	
	
third:
	cmpl $1900, %eax
	jl invalid
	cmpl $2014, %eax
	jg invalid
	
	movq $0, %rcx
	movl $2017, %ecx
	subl %eax, %ecx
	movq %rcx, %rax


	leaq 56(%rsp), %rsp
	popq %rbp
	popq %rbx
	ret
	
	

	
