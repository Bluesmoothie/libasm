.PHONY				:	clean fclean re all debug FORCE

NAME				=   libasm.a

#			GCC

CC					=	cc
CFLAGS				=	-Wall -Werror -Wextra -I$(INC)
LIBSFLAGS			=	-L./ -lasm

#			NASM

NASM				=	nasm
NASMFLAGS			=	-f elf64

#			COMMON

BUILD_DIR			=	.build/
SRC_DIR				=	./src/
INC					=	include/

#			SRC

SRC_FILES			=	ft_read		\
						ft_strcmp	\
						ft_strcpy	\
						ft_strdup	\
						ft_strlen	\
						ft_write	\

SRC 				= 	$(addprefix $(SRC_DIR), $(addsuffix .s, $(SRC_FILES)))
OBJ 				= 	$(addprefix $(BUILD_DIR), $(addsuffix .o, $(SRC_FILES)))

#			RULES

all					:	$(NAME)

$(NAME)				:	$(BUILD_DIR) $(OBJ) $(INC)/libasm.h src/main.c
					ar rcs $(NAME) $(OBJ)
					$(CC) $(CFLAGS) src/main.c $(LIBSFLAGS) -o tests 

$(BUILD_DIR)		:
					mkdir -p $(BUILD_DIR)

$(BUILD_DIR)%.o		: 	$(SRC_DIR)%.s
					$(NASM) $(NASMFLAGS) $< -o $@

clean				:
					rm -rf $(BUILD_DIR)

fclean				:	clean
					rm -f $(NAME)

re					:	fclean all