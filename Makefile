.PHONY				:	clean fclean re all debug FORCE

NAME				=   libasm.a

#			NASM

NASM				=	nasm
NASMFLAGS			=	-f elf64

#			COMMON

BUILD_DIR			=	.build/
SRC_DIR				=	./src/

#			SRC

SRC_FILES			=	main			\

SRC 				= 	$(addprefix $(SRC_DIR), $(addsuffix .s, $(SRC_FILES)))
OBJ 				= 	$(addprefix $(BUILD_DIR), $(addsuffix .o, $(SRC_FILES)))

#			RULES

all					:	$(NAME)

$(NAME)				:	$(BUILD_DIR) $(OBJ)
					ar rcs $(NAME) $(OBJ)

$(BUILD_DIR)		:
					mkdir -p $(BUILD_DIR)

$(BUILD_DIR)%.o		: 	$(SRC_DIR)%.c
					$(NASM) $(NASMFLAGS) $< -o $@

clean				:
					rm -rf $(BUILD_DIR)

fclean				:	clean
					rm -f $(NAME)

re					:	fclean all