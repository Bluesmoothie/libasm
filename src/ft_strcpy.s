section .text
	global ft_strcpy

ft_strcpy:
	mov rax, rdi			;Copy dest ptr to return register
	test rdi, rdi			;Check if dest is NULL
	je return
	test rsi, rsi			;Check if src is NULL
	je return
loop:
	mov rdx, [rsi]			;Copy src to dest
	mov [rdi], rdx
	cmp byte [rsi], 0 		;Check for the '\0'
	je return
	inc rdi
	inc rsi
	jmp loop

return:
	ret