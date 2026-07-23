/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:45 $
 * $Revision: 1.42.2.2 $
 */

#include <ansi_parms.h>

#if !(defined(_MSL_CLASSIC_MALLOC) || defined(_MSL_PRO4_MALLOC))

	#ifndef _MSL_POOL_ALLOC_H
	#define _MSL_POOL_ALLOC_H

	#include <ansi_parms.h>
	#include <size_t.h>

	#pragma options align=native

	#define __heap_version	2									/*- jg 980115 -*/ /*- hh 990227 -*/

	_MSL_BEGIN_EXTERN_C

	void * _MSL_CDECL			__sys_alloc(__std(size_t)  );	/*- mf 990715 -*/
	void   _MSL_CDECL			__sys_free(void *  );			/*- mf 990715 -*/
	
	__std(size_t) _MSL_CDECL	__sys_pointer_size(void* ptr);  /*- hh 000523 -*/

	typedef struct __mem_pool
	{
		void* reserved[14];
	} __mem_pool;

	_MSL_IMP_EXP_C void  _MSL_CDECL __init_pool_obj(__mem_pool* pool_obj) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C void* _MSL_CDECL __pool_alloc(__mem_pool* pool_obj, __std(size_t) size) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C void  _MSL_CDECL __pool_free(__mem_pool* pool_obj, void* ptr) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C void* _MSL_CDECL __pool_realloc(__mem_pool* pool_obj, void* ptr, __std(size_t) size) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C void* _MSL_CDECL __pool_alloc_clear(__mem_pool* pool_obj, __std(size_t) size) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C void	 _MSL_CDECL __pool_free_all(__mem_pool* pool) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C void	 _MSL_CDECL __malloc_free_all(void) _MSL_CANT_THROW;

	#if !_MSL_OS_ALLOC_SUPPORT
		_MSL_IMP_EXP_C int _MSL_CDECL init_alloc(void * , __std(size_t) heap_size) _MSL_CANT_THROW; /*- hh 990504 -*/
	#endif /* !_MSL_OS_ALLOC_SUPPORT */

	_MSL_END_EXTERN_C

	#pragma options align=reset

	#endif /* _MSL_POOL_ALLOC_H */

#else /* _MSL_CLASSIC_MALLOC */

	#ifndef _MSL_POOL_ALLOC_H
	#define _MSL_POOL_ALLOC_H

	#include <ansi_parms.h>

	#pragma options align=native

	typedef signed long tag_word;

	typedef struct block_header {
		tag_word				tag;
		struct block_header *	prev;
		struct block_header *	next;
	} block_header;

	typedef struct list_header {
		block_header *		rover;
		block_header		header;
	} list_header;

	typedef struct heap_header {
		struct heap_header* 	prev;
		struct heap_header*		next;
	} heap_header;

	#ifdef __MIPS__
		typedef unsigned int mem_size;
	#else
		typedef unsigned long mem_size;
	#endif /* __MIPS__ */

	struct mem_pool_obj;
	typedef void *	(*sys_alloc_ptr)(mem_size  , struct mem_pool_obj*); /*- mf 990715 -*/
	typedef void	(*sys_free_ptr)(void *   , struct mem_pool_obj*);	/*- mf 990715 -*/

	typedef struct pool_options{
		sys_alloc_ptr	sys_alloc_func;
		sys_free_ptr	sys_free_func;
		mem_size		min_heap_size;
	#ifndef __ALTIVEC__
		int				always_search_first;
	#else
		char			always_search_first;			/* for ALTIVEC */
		char			block_alignment;
		char			reserved1;
		char			reserved2;
	#endif /* __ALTIVEC__ */
	} pool_options;

	typedef struct mem_pool_obj {
		list_header		free_list;
	#if _MSL_OS_ALLOC_SUPPORT
		pool_options	options;
		heap_header*	heap_list;
		void*			userData;
	#endif /* _MSL_OS_ALLOC_SUPPORT */
	} mem_pool_obj;

	#define __heap_version	1																/*- jg 980115 -*/

	_MSL_BEGIN_EXTERN_C

	_MSL_IMP_EXP_C extern mem_pool_obj __malloc_pool;							/*- vss 980901 -*/

	#ifdef __ALTIVEC__
		void _MSL_CDECL	__init_align_pool_obj(mem_pool_obj * pool_obj, char align) _MSL_CANT_THROW;
	#endif /* __ALTIVEC__ */
	
	void   _MSL_CDECL __init_pool_obj(mem_pool_obj * pool_obj) _MSL_CANT_THROW;
	int	   _MSL_CDECL __pool_preallocate(mem_pool_obj * pool_obj, mem_size  ) _MSL_CANT_THROW;  			/*- mf 990715 -*/
	void   _MSL_CDECL __pool_preassign(mem_pool_obj * pool_obj, void *   , mem_size  ) _MSL_CANT_THROW; 	/*- mf 990715 -*/
	void * _MSL_CDECL __pool_alloc(mem_pool_obj * pool_obj, mem_size  ) _MSL_CANT_THROW; 					/*- mf 990715 -*/
	void * _MSL_CDECL __pool_alloc_clear(mem_pool_obj * pool_obj, mem_size  ) _MSL_CANT_THROW; 			    /*- mf 990715 -*/
	void * _MSL_CDECL __pool_realloc(mem_pool_obj * pool_obj, void *   ,	mem_size  ) _MSL_CANT_THROW; 	/*- mf 990715 -*/
	void   _MSL_CDECL __pool_free(mem_pool_obj * pool_obj, void *   ) _MSL_CANT_THROW; 					    /*- mf 990715 -*/
	
	_MSL_IMP_EXP_C void	_MSL_CDECL __pool_free_all(mem_pool_obj * pool_obj) _MSL_CANT_THROW;

	void * _MSL_CDECL __sys_alloc(mem_size  , mem_pool_obj*) _MSL_CANT_THROW;  								/*- mf 990715 -*/
	void   _MSL_CDECL __sys_free(void *  , mem_pool_obj*) _MSL_CANT_THROW;  								/*- mf 990715 -*/

	#if !_MSL_OS_ALLOC_SUPPORT
		_MSL_IMP_EXP_C int _MSL_CDECL init_alloc(void * , mem_size ) _MSL_CANT_THROW;
	#endif /* !_MSL_OS_ALLOC_SUPPORT */

	_MSL_END_EXTERN_C

	#pragma options align=reset

	#endif /* _MSL_POOL_ALLOC_H */

#endif /* _MSL_CLASSIC_MALLOC */

/* Change record:
 * MEA 970720 Changed __no_os to _No_Alloc_OS_Support.
 * mm  970905 added include of ansi_parms.h to avoid need for prefix file
 * jg  980115 added __heap_version definition
 * vss 980901 add extern __malloc_pool
 * hh  990227 rewrote allocation functions
 * bobc990302 support for AltiVec (specify alignment for the pool).
 * hh  990504 Corrected prototype for init_alloc()
 * mf  990715 Arg names in prototypes cause conflicts
 * hh  000523 Added __sys_pointer_size
 * cc  010409 updated defines to JWW new namespace macros 
 * hh  010424 Modified malloc system to handle multiple pools
 * JWW 010813 Changed some size_t to __std(size_t)
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * hh  020214 Renamed _MSL_PRO4_MALLOC to _MSL_CLASSIC_MALLOC
 * hh  020603 Added no throw spec to functions
 * JWW 040401 Changed _No_Alloc_OS_Support to _MSL_OS_ALLOC_SUPPORT
 */