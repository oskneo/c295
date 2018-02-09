.globl hex_str
hex_str:
movl $edi, %eax

movl	$0, %ecx

loop:
movl $0, %edx
movl $10, %ebx
divl %ebx
addl $48, %edx
pushl %edx
incl %ecx
cmpl $0, %eax
jz   next
jmp loop

next:
cmpl $0, %ecx
jz   exit
decl %ecx
movl $4, %eax
movl %esp, %ecx
movl $1, %ebx
movl $1, %edx
int  $0x80
addl $4, %esp
jmp  next

exit:



ret
