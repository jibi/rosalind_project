.text
.globl main

main:
	push %ebp
	mov %esp, %ebp

	movl $0, -4(%ebp)
	movl $0, -8(%ebp)
	movl $0, -12(%ebp)
	movl $0, -16(%ebp)
	sub $16, %esp 

	mov 0xc(%ebp), %ebx
	mov 0x4(%ebx), %ebx
	mov $0, %ecx

strlen:
	mov (%ebx, %ecx), %al
	cmpb $0, %al
	je cycle

	inc %ecx
	jmp strlen

cycle:
	dec %ecx
	cmpl $0, %ecx
	js bye

	movb (%ebx, %ecx), %al

	cmp $'A', %al
	je inc_A

	cmp $'C', %al
	je inc_C

	cmp $'G', %al
	je inc_G

	cmp $'T', %al
	je inc_T

	jmp cycle
inc_A:
	incl -4(%ebp)
	jmp cycle

inc_C:
	incl -8(%ebp)
	jmp cycle

inc_G:
	incl -12(%ebp)
	jmp cycle

inc_T:
	incl -16(%ebp)
	jmp cycle

bye:
	push -16(%ebp)
	push -12(%ebp)
	push -8(%ebp)
	push -4(%ebp)
	push $fstr
	call printf

	push $0
	call exit

.data
fstr:		.string "%d %d %d %d\n"

// vim: ts=8
