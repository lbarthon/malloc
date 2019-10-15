/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   malloc_internal.h                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lbarthon <lbarthon@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/10/15 10:52:36 by lbarthon          #+#    #+#             */
/*   Updated: 2019/10/15 11:29:52 by lbarthon         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MALLOC_INTERNAL_H
# define MALLOC_INTERNAL_H

# define TINY_TRESHOLD 512
# define TINY_QUANTUM 16384

# define SMALL_TRESHOLD 16384
# define SMALL_QUANTUM 65536

typedef struct	s_alloc {
	t_alloc		*next;
}				t_alloc;

typedef struct	s_region {
	size_t		map_size;
	size_t		usable_size;
	void		*ptr;
	t_alloc		*alloc;
	t_region	*next;
}				t_region;

typedef struct	s_malloc {
	t_region	*tiny;
	t_region	*small;
	t_region	*large;
}				t_malloc;

size_t	align_up(size_t n, int mod);

#endif
