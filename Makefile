# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lbarthon <lbarthon@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/02 16:45:56 by lbarthon          #+#    #+#              #
#    Updated: 2019/10/14 13:54:09 by lbarthon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC=gcc
CFLAGS=-Wall -Werror -Wextra -fPIC
CPPFLAGS=-I includes -I libft/includes
LDFLAGS=-Llibft -lft

LINK=libft_malloc.so
NAME=libft_malloc_$(HOSTTYPE).so

LIB_DIR=libft
LIB_FILE=$(LIB_DIR)/libft.a

SRCS=./srcs/malloc.c

OBJS=$(SRCS:.c=.o)

ifeq ($(HOSTTYPE),)
	HOSTTYPE := $(shell uname -m)_$(shell uname -s)
endif

all: $(NAME)

$(NAME): $(OBJS)
	$(MAKE) -C $(LIB_DIR)
	$(CC) -shared -o $@ $^ $(LDFLAGS) 
	$(MAKE) $(LINK)

$(LINK): $(NAME)
	ln -sf $< $@

fclean: clean
	rm -f $(NAME) $(LINK)
	$(MAKE) -C $(LIB_DIR) fclean

clean:
	rm -rf $(OBJS)
	$(MAKE) -C $(LIB_DIR) clean

re: fclean all

.PHONY: all fclean clean re
