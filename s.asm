	.comm	ncmp,4,4
	.globl	x
	.type	x, @function
x:
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	-32(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movl	-4(%rbp), %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	nop
	ret
	.globl	s
	.type	s, @function
s:
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$1, -4(%rbp)
	jmp	.L3
.L7:
	movl	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
	jmp	.L4
.L6:
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	x
	movl	ncmp(%rip), %eax
	addl	$1, %eax
	movl	%eax, ncmp(%rip)
	subl	$1, -8(%rbp)
.L4:
	cmpl	$0, -8(%rbp)
	jle	.L5
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jb	.L6
.L5:
	addl	$1, -4(%rbp)
.L3:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L7
	nop
	ret
