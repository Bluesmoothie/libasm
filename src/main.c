#include "libasm.h"
#include <stdio.h>

int	main(void)
{
	const char*	str = "Hello World!";
	printf("%s = %zu", str, ft_strlen(str));
	return 0;
}
