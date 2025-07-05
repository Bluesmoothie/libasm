section .text
	global ft_strcmp

ft_strcmp:
	mov rax, 0
	test rdi, rdi
	je return
	test rsi, rsi
	je return
loop:
	cmp byte [rdi], 0
	je return
	cmp byte [rsi], 0
	je return
	mov byte rbx, [rdi]
	cmp byte rbx, [rsi]
	jne result
	inc rdi
	inc rsi
	jmp loop

result:
	mov rax, [rdi]
	sub rax, [rsi]
	je return

return:
	ret