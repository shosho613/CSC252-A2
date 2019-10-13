	.globl	gp
	.type	gp, @function
gp:
	movq	%rdi, -24(%rbp) // rbp -24 = rdi
	movl	%esi, -28(%rbp)//	rbp - 28 = esi
	movl	$0, -12(%rbp) //rbp - 12 = 0
	movl	$0, -16(%rbp) //rbp - 16 = 0
	movq	-24(%rbp), %rax //rax = rbp - 24
	movl	$2, (%rax) // adress of rax = 2
	movl	$1, -12(%rbp) rbp - 12 = 1
	movl	$3, -4(%rbp) rbp - 4 = 3
	jmp	.L2
.L9:
	movl	$1, -16(%rbp) rbp - 16 = 1
	movl	$0, -8(%rbp) rbp - 8 = 0
	jmp	.L3 jump
.L6:
	movl	-4(%rbp), %eax eax = rbp - 4
	movl	-8(%rbp), %edx edx = rbp - 8
	movslq	%edx, %rdx  change edx to rax
	leaq	0(,%rdx,4), %rcx checl
	movq	-24(%rbp), %rdx rdx = rbp - 24
	addq	%rcx, %rdx  rdx += rcx
	movl	(%rdx), %ecx ecx = adress of rdx
	movl	$0, %edx edx = 0
	divl	%ecx // edx/ecx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L4
	movl	$0, -16(%rbp)
	jmp	.L5
.L4:
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax // eax = rbp - 8
	cmpl	-12(%rbp), %eax if eax < rbp -12, jump 
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
	movl	-12(%rbp), %eax eax = rbp - 12
	cmpl	-28(%rbp), %eax if eax greater or equal to rbp - 28, JMP to L10, which means return 
	jge	.L10
	movl	-28(%rbp), %eax eax = rbp - 28
	imull	-28(%rbp), %eax eax *= rbp - 28
	cmpl	%eax, -4(%rbp) if rbp - 4 < eax, jump to L9 else return;
	jl	.L9
.L10:
	nop
	ret
