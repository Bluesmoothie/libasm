section .text
	global ft_strlen

ft_strlen:
	mov rax, 0			//Initialize the return value to 0
	test rdi, rdi		//Check if the pointer is NULL
	je return			//Jump to return if yes
loop:
	cmp byte [rdi], 0	//Check if [rdi] == '\0'
	je return			//If yes return
	add rax, 1			//If not add 1
	inc rdi				//Increment the pointer
	jmp loop			//Return to the start of the loop

return:
	ret					//Return