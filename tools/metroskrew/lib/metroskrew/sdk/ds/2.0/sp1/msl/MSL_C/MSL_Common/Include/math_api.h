/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:24 $
 * $Revision: 1.13.2.3 $
 */

#ifndef _MSL_MATH_API_H
#define	_MSL_MATH_API_H

#include <msl_t.h>


#if _MSL_LITTLE_ENDIAN
	#define __HI(x) ( sizeof(x)==8 ? *(1+(_INT32*)&x) : (*(_INT32*)&x))
	#define __LO(x) (*(_INT32*)&x)
	#define __UHI(x) ( sizeof(x)==8 ? *(1+(_UINT32*)&x) : (*(_UINT32*)&x))
	#define __ULO(x) (*(_UINT32*)&x)
#else
	#define __LO(x) ( sizeof(x)==8 ? *(1+(_INT32*)&x) : (*(_INT32*)&x))
	#define __HI(x) (*(_INT32*)&x)
	#define __ULO(x) ( sizeof(x)==8 ? *(1+(_UINT32*)&x) : (*(_UINT32*)&x))
	#define __UHI(x) (*(_UINT32*)&x)
#endif /* _MSL_LITTLE_ENDIAN */

_MSL_BEGIN_EXTERN_C

#if _MSL_FLOATING_POINT
	#if _MSL_C99
		#if __has_intrinsic(__builtin_fma)
			extern double __builtin_fma(double, double, double) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
		#endif
		
		#if __has_intrinsic(__builtin_fmaf)
			extern float __builtin_fmaf(float, float, float) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
		#endif

		double _MSL_MATH_CDECL __ieee754_lgamma_r(double, _INT32 *);


	#endif /* _MSL_C99 */
#endif /* _MSL_FLOATING_POINT */
	
	#if __has_intrinsic(__builtin___count_bits32)
		extern unsigned int __builtin___count_bits32(_UINT32) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#else
		unsigned int _MSL_MATH_CDECL __msl_generic_count_bits32(_UINT32) _MSL_CANT_THROW;
	#endif
	
	#if __has_intrinsic(__builtin___count_leading_zero32)
		extern unsigned int __builtin___count_leading_zero32(_UINT32) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#else
		unsigned int _MSL_MATH_CDECL __msl_generic_count_leading_zero32(_UINT32) _MSL_CANT_THROW;
	#endif
	
	#if __has_intrinsic(__builtin___count_trailing_zero32)
		extern unsigned int __builtin___count_trailing_zero32(_UINT32) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#endif

	#if __has_intrinsic(__builtin___count_leading_one32)
		extern unsigned int __builtin___count_leading_one32(_UINT32) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#endif
	
	#if __has_intrinsic(__builtin___count_trailing_one32)
		extern unsigned int __builtin___count_trailing_one32(_UINT32) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#endif

	#if __has_intrinsic(__builtin___rotate_left32)
		extern _UINT32 __builtin___rotate_left32(_UINT32, int) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#endif

	#if __has_intrinsic(__builtin___rotate_right32)
		extern _UINT32 __builtin___rotate_right32(_UINT32, int) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#endif

#if _MSL_LONGLONG	

	#if __has_intrinsic(__builtin___count_bits64)
		extern unsigned int __builtin___count_bits64(_UINT64) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#else
		unsigned int _MSL_MATH_CDECL __msl_generic_count_bits64(_UINT64) _MSL_CANT_THROW;
	#endif

	#if __has_intrinsic(__builtin___count_leading_zero64)
		extern unsigned int __builtin___count_leading_zero64(_UINT64) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#else
		unsigned int _MSL_MATH_CDECL __msl_generic_count_leading_zero64(_UINT64) _MSL_CANT_THROW;
	#endif

	#if __has_intrinsic(__builtin___count_trailing_zero64)
		extern unsigned int __builtin___count_trailing_zero64(_UINT64) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#else
		unsigned int _MSL_MATH_CDECL __msl_generic_count_trailing_zero64(_UINT64) _MSL_CANT_THROW;
	#endif

	#if __has_intrinsic(__builtin___count_leading_one64)
		extern unsigned int __builtin___count_leading_one64(_UINT64) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#endif

	#if __has_intrinsic(__builtin___count_trailing_one64)
		extern unsigned int __builtin___count_trailing_one64(_UINT64) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#endif

	#if __has_intrinsic(__builtin___rotate_left64)
		extern _UINT64 __builtin___rotate_left64(_UINT64, int) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#endif

	#if __has_intrinsic(__builtin___rotate_right64)
		extern _UINT64 __builtin___rotate_right64(_UINT64, int) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#endif

#endif /* _MSL_LONGLONG */	
	
_MSL_IMP_EXP_C unsigned int _MSL_MATH_CDECL __msl_count_bits32(_UINT32) _MSL_CANT_THROW;
_MSL_IMP_EXP_C unsigned int _MSL_MATH_CDECL __msl_count_leading_zero32(_UINT32) _MSL_CANT_THROW;
_MSL_IMP_EXP_C unsigned int _MSL_MATH_CDECL __msl_count_trailing_zero32(_UINT32) _MSL_CANT_THROW;
_MSL_IMP_EXP_C unsigned int _MSL_MATH_CDECL __msl_count_leading_one32(_UINT32) _MSL_CANT_THROW;
_MSL_IMP_EXP_C unsigned int _MSL_MATH_CDECL __msl_count_trailing_one32(_UINT32) _MSL_CANT_THROW;
_MSL_IMP_EXP_C _UINT32 _MSL_MATH_CDECL __msl_rotate_left32(_UINT32, int) _MSL_CANT_THROW;
_MSL_IMP_EXP_C _UINT32 _MSL_MATH_CDECL __msl_rotate_right32(_UINT32, int) _MSL_CANT_THROW;

#if _MSL_LONGLONG
_MSL_IMP_EXP_C unsigned int _MSL_MATH_CDECL __msl_count_bits64(_UINT64) _MSL_CANT_THROW;
_MSL_IMP_EXP_C unsigned int _MSL_MATH_CDECL __msl_count_leading_zero64(_UINT64) _MSL_CANT_THROW;
_MSL_IMP_EXP_C unsigned int _MSL_MATH_CDECL __msl_count_trailing_zero64(_UINT64) _MSL_CANT_THROW;
_MSL_IMP_EXP_C unsigned int _MSL_MATH_CDECL __msl_count_leading_one64(_UINT64) _MSL_CANT_THROW;
_MSL_IMP_EXP_C unsigned int _MSL_MATH_CDECL __msl_count_trailing_one64(_UINT64) _MSL_CANT_THROW;
_MSL_IMP_EXP_C _UINT64 _MSL_MATH_CDECL __msl_rotate_left64(_UINT64, int) _MSL_CANT_THROW;
_MSL_IMP_EXP_C _UINT64 _MSL_MATH_CDECL __msl_rotate_right64(_UINT64, int) _MSL_CANT_THROW;
#endif /* _MSL_LONGLONG */

#if _MSL_USE_INLINE

	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_bits32(_UINT32 x) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___count_bits32)
		return __builtin___count_bits32(x);
	#else
		return __msl_generic_count_bits32(x);
	#endif
	}
	
	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_leading_zero32(_UINT32 x) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___count_leading_zero32)
		return __builtin___count_leading_zero32(x);
	#else
		return __msl_generic_count_leading_zero32(x);
	#endif
	}
	
	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_trailing_zero32(_UINT32 x) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___count_trailing_zero32)
		return __builtin___count_trailing_zero32(x);
	#else
		return __msl_count_bits32((x & -x) - 1);
	#endif
	}

	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_leading_one32(_UINT32 x) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___count_leading_one32)
		return __builtin___count_leading_one32(x);
	#else
		return __msl_count_leading_zero32(~x);
	#endif
	}
	
	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_trailing_one32(_UINT32 x) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___count_trailing_one32)
		return __builtin___count_trailing_one32(x);
	#else
		return __msl_count_trailing_zero32(~x);
	#endif
	}

	_MSL_INLINE _UINT32 _MSL_MATH_CDECL __msl_rotate_left32(_UINT32 x, int n) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___rotate_left32)
		return __builtin___rotate_left32(x, n);
	#else
		n &= 0x1F;
		return (x << n) | (x >> (32-n));
	#endif
	}

	_MSL_INLINE _UINT32 _MSL_MATH_CDECL __msl_rotate_right32(_UINT32 x, int n) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___rotate_right32)
		return __builtin___rotate_right32(x, n);
	#else
		n &= 0x1F;
		return (x << (32-n)) | (x >> n);
	#endif
	}

#if _MSL_LONGLONG	

	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_bits64(_UINT64 x) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___count_bits64)
		return __builtin___count_bits64(x);
	#else
		return __msl_generic_count_bits64(x);
	#endif
	}

	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_leading_zero64(_UINT64 x) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___count_leading_zero64)
		return __builtin___count_leading_zero64(x);
	#else
		return __msl_generic_count_leading_zero64(x);
	#endif
	}
	
	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_trailing_zero64(_UINT64 x) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___count_trailing_zero64)
		return __builtin___count_trailing_zero64(x);
	#else
		return __msl_count_bits64((x & -x) - 1);
	#endif
	}
	
	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_leading_one64(_UINT64 x) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___count_leading_one64)
		return __builtin___count_leading_one64(x);
	#else
		return __msl_count_leading_zero64(~x);
	#endif
	}
	
	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_trailing_one64(_UINT64 x) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___count_trailing_one64)
		return __builtin___count_trailing_one64(x);
	#else
		return __msl_count_trailing_zero64(~x);
	#endif
	}
	
	_MSL_INLINE _UINT64 _MSL_MATH_CDECL __msl_rotate_left64(_UINT64 x, int n) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___rotate_left64)
		return __builtin___rotate_left64(x, n);
	#else
		n &= 0x3F;
		return (x << n) | (x >> (64-n));
	#endif
	}

	_MSL_INLINE _UINT64 _MSL_MATH_CDECL __msl_rotate_right64(_UINT64 x, int n) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___rotate_right64)
		return __builtin___rotate_right64(x, n);
	#else
		n &= 0x3F;
		return (x << (64-n)) | (x >> n);
	#endif
	}

#endif /* _MSL_LONGLONG */
#endif /* _MSL_USE_INLINE */

_MSL_END_EXTERN_C

#endif /* _MSL_MATH_API_H */

/* Change record:
 * JWW 030321 New file to define the MSL API for math helpers
 * ejs 030424 Added _MSL_IMP_EXP_C for non-inlined routines __msl_fma, __msl_fmaf
 * JWW 030612 Added prototypes for __builtin_xxx compiler intrinsics
 * ejs 030613 Standardize the __builtin_xxx types
 * hh  040410 Added several more intrinsics
 */