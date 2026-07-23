/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:23 $
 * $Revision: 1.1.2.2 $
 */

#ifndef _MSL_LIMITS_API_H
#define _MSL_LIMITS_API_H

#ifndef _MSL_CHAR_BIT
	#define _MSL_CHAR_BIT				8
#endif

#ifndef _MSL_SIZEOF_SHRT
	#define _MSL_SIZEOF_SHRT			2
#endif

#ifndef _MSL_SIZEOF_INT
	#define _MSL_SIZEOF_INT				4
#endif

#ifndef _MSL_SIZEOF_LONG
	#define _MSL_SIZEOF_LONG			4
#endif

#ifndef _MSL_MB_LEN_MAX
	#define _MSL_MB_LEN_MAX				3
#endif

#if _MSL_LONGLONG
	#ifndef _MSL_SIZEOF_LONG_LONG
		#define _MSL_SIZEOF_LONG_LONG	8
	#endif
#endif /* _MSL_LONGLONG */

#ifndef _MSL_UNSIGNED_CHAR
	#ifdef __MWERKS__
		#if __option(unsigned_char)
			#define _MSL_UNSIGNED_CHAR	1
		#else
			#define _MSL_UNSIGNED_CHAR	0
		#endif
	#else
		#define _MSL_UNSIGNED_CHAR		0
	#endif /* __MWERKS__ */
#endif /* _MSL_UNSIGNED_CHAR */


#if _MSL_CHAR_BIT == 8
	#define _MSL_SCHAR_MAX				0x7f
	#define _MSL_UCHAR_MAX				0xff
#elif _MSL_CHAR_BIT == 16
	#define _MSL_SCHAR_MAX				0x7fff
	#define _MSL_UCHAR_MAX				0xffff
#elif _MSL_CHAR_BIT == 24
	#define _MSL_SCHAR_MAX				0x7fffff
	#define _MSL_UCHAR_MAX				0xffffff
#else
	#error unsupported size for _MSL_CHAR_BIT
#endif

#define _MSL_SCHAR_MIN					(~_MSL_SCHAR_MAX)

#if _MSL_UNSIGNED_CHAR
	#define _MSL_CHAR_MIN				0
	#define _MSL_CHAR_MAX				_MSL_UCHAR_MAX
#else
	#define _MSL_CHAR_MIN				_MSL_SCHAR_MIN
	#define _MSL_CHAR_MAX				_MSL_SCHAR_MAX
#endif

#if _MSL_SIZEOF_SHRT*_MSL_CHAR_BIT == 16
	#define _MSL_SHRT_MAX				0x7fff
	#define _MSL_USHRT_MAX				0xffff
#elif _MSL_SIZEOF_SHRT*_MSL_CHAR_BIT == 24
	#define _MSL_SHRT_MAX				0x7fffff
	#define _MSL_USHRT_MAX				0xffffff
#else
	#error unsupported size for sizeof short
#endif

#define _MSL_SHRT_MIN					(~_MSL_SHRT_MAX)

#if _MSL_SIZEOF_INT*_MSL_CHAR_BIT == 16
	#define _MSL_INT_MAX				0x7fff
	#define _MSL_UINT_MAX				0xffffU
#elif _MSL_SIZEOF_INT*_MSL_CHAR_BIT == 24
	#define _MSL_INT_MAX				0x7fffff
	#define _MSL_UINT_MAX				0xffffffU
#elif _MSL_SIZEOF_INT*_MSL_CHAR_BIT == 32
	#define _MSL_INT_MAX				0x7fffffff
	#define _MSL_UINT_MAX				0xffffffffU
#else
	#error unsupported size for sizeof int
#endif

#define _MSL_INT_MIN					(~_MSL_INT_MAX)

#if _MSL_SIZEOF_LONG*_MSL_CHAR_BIT == 24
	#define _MSL_LONG_MAX				0x7fffffL
	#define _MSL_ULONG_MAX				0xffffffUL
#elif _MSL_SIZEOF_LONG*_MSL_CHAR_BIT == 32
	#define _MSL_LONG_MAX				0x7fffffffL
	#define _MSL_ULONG_MAX				0xffffffffUL
#else
	#error unsupported size for sizeof long
#endif

#define _MSL_LONG_MIN					(~_MSL_LONG_MAX)

#if _MSL_LONGLONG && _MSL_C99
	#if _MSL_SIZEOF_LONG_LONG*_MSL_CHAR_BIT == 24
		#define _MSL_LLONG_MAX			0x7fffffLL
		#define _MSL_ULLONG_MAX			0xffffffULL
	#elif _MSL_SIZEOF_LONG_LONG*_MSL_CHAR_BIT == 32
		#define _MSL_LLONG_MAX			0x7fffffffLL
		#define _MSL_ULLONG_MAX			0xffffffffULL
	#elif _MSL_SIZEOF_LONG_LONG*_MSL_CHAR_BIT == 64
		#define _MSL_LLONG_MAX			0x7fffffffffffffffLL
		#define _MSL_ULLONG_MAX			0xffffffffffffffffULL
	#else
		#error unsupported size for sizeof long long
	#endif
	
	#define _MSL_LLONG_MIN				(~_MSL_LLONG_MAX)
#endif /* _MSL_LONGLONG && _MSL_C99 */

#endif /* _MSL_LIMITS_API_H */

/* Change record: 
 * JWW 050314 New file for configuring limit values independently
 */