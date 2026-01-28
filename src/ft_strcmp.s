section .text
	global ft_strcmp

ft_strcmp:
	mov rax, 0				;Reset counter
	test rdi, rdi			;NULL check str1
	je return				;Return if NULL
	test rsi, rsi			;NULL check str2
	je return
loop:						;Compare loop
	cmp byte [rdi], 0		;Check for \0 in str1
	je return				;Return if true
	cmp byte [rsi], 0		;Check for \0 in str2
	je return				;Return if true
	mov byte rbx, [rdi]		;Copy str1 caracter to rbx
	cmp byte rbx, [rsi]		;Compare it with str2
	jne result				;If equals jump to compute return value
	inc rdi					;If not increment both strings
	inc rsi
	jmp loop				;One more time

result:
	mov rax, [rdi]			;Copy str1 to rax
	sub rax, [rsi]			;Substract str2
	je return

return:
	ret