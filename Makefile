# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lbarthon <lbarthon@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/02 16:45:56 by lbarthon          #+#    #+#              #
#    Updated: 2019/10/03 11:09:09 by lbarthon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC=@gcc
CFLAGS=-g -Wall -Werror -Wextra -I includes
#CFLAGS=-g -I includes

NAME=libft_malloc_$(HOSTTYPE).so

SRCS=./srcs/*
OBJS=$(SRCS:.c=.o)

ifeq ($(HOSTTYPE),)
	HOSTTYPE := $(shell uname -m)_$(shell uname -s)
endif

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS)

fclean: clean
	@rm -f $(NAME)

clean:
	@rm -rf $(OBJS)

re: fclean all

.PHONY: all fclean clean re
