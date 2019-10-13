	.globl	NP
	.data
	.align 4
	.type	NP, @object
NP:
	.long	14
.LC0:
	.string	"Press CTRL+C to exit."
	.align 8
.LC1:
	 .string "Enter a positive integer for key size: "

	 .align 8
.LC2:
	.string	"%d"
	.align 8
.LC3:
	.string	"Sorry, did not understand your input. Repeating question."
	.align 8
.LC4:
	.string	"Whoops! That's too small. Please enter a higher number!"
	.align 8
.LC5:
	.string	"Whoops! That's too big. Please enter a smaller number!"
.LC6:
	.string	"%d is just right!\n"
	.globl	ask
	.type	ask, @function
ask:
	subq	$16, %rsp
	leaq	.LC0(%rip), %rdi
	call	puts
.L7:
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax eax = 0;
	call	printf //call printf lc1
	leaq	-4(%rbp), %rax rax = adress of -4
	movq	%rax, %rsi rsi = rax
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	scanf
	testl	%eax, %eax
	jne	.L2
	leaq	.LC3(%rip), %rdi
	call	puts
	jmp	.L7
.L2:
	movl	-4(%rbp), %eax
	cmpl	$4, %eax
	jg	.L4
	leaq	.LC4(%rip), %rdi
	call	puts
	jmp	.L7
.L4:
	movl	-4(%rbp), %edx
	movl	NP(%rip), %eax
	cmpl	%eax, %edx if edx is less than or eqaul to eax
	jle	.L5
	leaq	.LC5(%rip), %rdi
	call	puts
	jmp	.L7
.L5:
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf
	movl	-4(%rbp), %eax
	ret
