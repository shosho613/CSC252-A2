	.globl	gp
	.type	gp, @function
gp:
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -16(%rbp)
	movq	-24(%rbp), %rax
	movl	$2, (%rax)
	movl	$1, -12(%rbp)
	movl	$3, -4(%rbp)
	jmp	.L2
.L9:
	movl	$1, -16(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L3
.L6:
	movl	-4(%rbp), %eax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movl	(%rdx), %ecx
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L4
	movl	$0, -16(%rbp)
	jmp	.L5
.L4:
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.L6
.L5:
	cmpl	$0, -16(%rbp)
	je	.L7
	movl	-12(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -12(%rbp)
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
.L7:
	addl	$2, -4(%rbp)
.L2:
	movl	-12(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.L10
	movl	-28(%rbp), %eax
	imull	-28(%rbp), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L9
.L10:
	nop
	ret
