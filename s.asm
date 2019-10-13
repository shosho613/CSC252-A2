	.comm	ncmp,4,4
	.globl	x
	.type	x, @function
x:
	movq	%rdi, -24(%rbp) //rbp - 24 = rdi
	movq	%rsi, -32(%rbp)  //rbp - 32 = rsi
	movq	-24(%rbp), %rax // rax = rbp - 24
	movl	(%rax), %eax // eax = adress of rax
	movl	%eax, -4(%rbp) //rbp - 4 = eax
	movq	-32(%rbp), %rax // rax = rbp - 32
	movl	(%rax), %edx // edx = adress of rax
	movq	-24(%rbp), %rax // rax = rbp - 24
	movl	%edx, (%rax) // adress of rax = edx
	movl	-4(%rbp), %edx // edx = rbp - 4
	movq	-32(%rbp), %rax // rax = rbp - 32
	movl	%edx, (%rax) // adress of rax = edx which = rbp - 4
	nop
	ret	// return rax
	.globl	s
	.type	s, @function // call s
s:
	subq	$32, %rsp // subtract 32 from the stack
	movq	%rdi, -24(%rbp)// rbp - 24 = rdi
	movl	%esi, -28(%rbp) //rbp - 28 = esi
	movl	$1, -4(%rbp) // rbp - 4 = 1
	jmp	.L3
.L7:
	movl	-4(%rbp), %eax // eax =  rbp - 4, eax = 1
	movl	%eax, -8(%rbp) // rbp -8 = eax, rbp -8 = 1
	jmp	.L4
.L6:
	movl	-8(%rbp), %eax // eax = rbp -8
	cltq	convert eax to rax
	salq	$2, %rax // left shift rax by 2
	leaq	-4(%rax), %rdx rdx = load memory of rax - 4
	movq	-24(%rbp), %rax rax = rbp - 24
	addq	%rax, %rdx		rdx += rax
	movl	-8(%rbp), %eax eax = rbp - 8
	cltq	convert eax to rax
	leaq	0(,%rax,4), %rcx check.
	movq	-24(%rbp), %rax rax 
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	x
	movl	ncmp(%rip), %eax
	addl	$1, %eax
	movl	%eax, ncmp(%rip)
	subl	$1, -8(%rbp)
.L4:
	cmpl	$0, -8(%rbp)// if rbp -8 is less than or equal to 0, jump to l5
	jle	.L5
	movl	-8(%rbp), %eax // eax = rbp -8;
	cltq	//change eax to rax, change 4 byte to 8 byte
	salq	$2, %rax  // left shit rax by 2
	leaq	-4(%rax), %rdx // rdx = load memory of rax - 4
	movq	-24(%rbp), %rax // rax = rbp - 24
	addq	%rdx, %rax // rax += rdx
	movl	(%rax), %edx // edx = address of rax
	movl	-8(%rbp), %eax // eax = rbp - 8;
	cltq	// change eax to rax
	leaq	0(,%rax,4), %rcx check. 
	movq	-24(%rbp), %rax rax = rbp - 24
	addq	%rcx, %rax rax += rcx
	movl	(%rax), %eax eax = adress of eax
	cmpl	%eax, %edx if edx < eax, jump
	jb	.L6
.L5:
	addl	$1, -4(%rbp) //rbp -4 += 1;
.L3:
	movl	-4(%rbp), %eax //eax = rbp -4
	cmpl	-28(%rbp), %eax // if eax < rbp -28, jump, which means if 1 < rbp -28, jump, else return
	jl	.L7
	nop
	ret
