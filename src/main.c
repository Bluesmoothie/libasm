#include "libasm.h"
#include <stdio.h>

int	main(void)
{
	const char*	str = "Hello World!";
	const char*	s1 = "abc";
	const char* s2 = "abd";
	char		cpy[12];
	char		buff[1024];
	ssize_t		len;
	printf("%s = %zu\n", str, ft_strlen(str));
	printf("%d\n", ft_strcmp(s1, s2));
	ft_strcpy(cpy, str, 13);
	printf("%s\n", cpy);
	len = ft_read(STDIN_FILENO, buff, 1024);
	ft_write(STDOUT_FILENO, buff, len);
	return 0;
}
