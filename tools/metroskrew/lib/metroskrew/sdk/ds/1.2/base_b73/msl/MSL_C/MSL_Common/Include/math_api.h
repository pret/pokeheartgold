/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/05/27 16:18:29 $
 * $Revision: 1.6.4.2 $
 */

#ifndef _MSL_MATH_API_H
#define	_MSL_MATH_API_H

#include <ansi_parms.h>
#include <msl_t.h>

_MSL_BEGIN_EXTERN_C

	#if _MSL_C99
		#if __has_intrinsic(__builtin_fma)
			extern double __builtin_fma(double, double, double) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
		#else
			_MSL_IMP_EXP_C double _MSL_MATH_CDECL __msl_fma(double, double, double) _MSL_CANT_THROW;
		#endif
			
		#if __has_intrinsic(__builtin_fmaf)
			extern float __builtin_fmaf(float, float, float) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
		#else
			_MSL_IMP_EXP_C float _MSL_MATH_CDECL __msl_fmaf(float, float, float) _MSL_CANT_THROW;
		#endif
	#endif
	
	#if __has_intrinsic(__builtin___count_leading_zero32)
		extern unsigned int __builtin___count_leading_zero32(_UINT32) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#else
		unsigned int _MSL_MATH_CDECL __msl_generic_count_leading_zero32(_UINT32) _MSL_CANT_THROW;
	#endif
	
	#if __has_intrinsic(__builtin___count_trailing_zero32)
		extern unsigned int __builtin___count_trailing_zero32(_UINT32) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#else
		unsigned int _MSL_MATH_CDECL __msl_generic_count_trailing_zero32(_UINT32) _MSL_CANT_THROW;
	#endif
	
#if _MSL_LONGLONG
	#if __has_intrinsic(__builtin___count_leading_zero64)
		extern unsigned int __builtin___count_leading_zero64(_UINT64) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#else
		unsigned int _MSL_MATH_CDECL __msl_generic_count_leading_zero64(_UINT64) _MSL_CANT_THROW;
	#endif
	
	#if __has_intrinsic(__builtin___count_bits64)
		extern unsigned int __builtin___count_bits64(_UINT64) _MSL_CANT_THROW _MSL_ATTRIBUTE_CONST;
	#else
		unsigned int _MSL_MATH_CDECL __msl_generic_count_bits64(_UINT64) _MSL_CANT_THROW;
	#endif
#endif
	
	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_leading_zero32(_UINT32) _MSL_CANT_THROW;
	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_leading_zero32(_UINT32 x) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___count_leading_zero32)
		return __builtin___count_leading_zero32(x);
	#else
		return __msl_generic_count_leading_zero32(x);
	#endif
	}
	
	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_trailing_zero32(_UINT32) _MSL_CANT_THROW;
	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_trailing_zero32(_UINT32 x) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___count_trailing_zero32)
		return __builtin___count_trailing_zero32(x);
	#else
		return __msl_generic_count_trailing_zero32(x);
	#endif
	}
	
#if _MSL_LONGLONG
	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_leading_zero64(_UINT64) _MSL_CANT_THROW;
	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_leading_zero64(_UINT64 x) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___count_leading_zero64)
		return __builtin___count_leading_zero64(x);
	#else
		return __msl_generic_count_leading_zero64(x);
	#endif
	}
	
	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_bits64(_UINT64) _MSL_CANT_THROW;
	_MSL_INLINE unsigned int _MSL_MATH_CDECL __msl_count_bits64(_UINT64 x) _MSL_CANT_THROW
	{
	#if __has_intrinsic(__builtin___count_bits64)
		return __builtin___count_bits64(x);
	#else
		return __msl_generic_count_bits64(x);
	#endif
	}
#endif

_MSL_END_EXTERN_C

#endif /* _MSL_MATH_API_H */

/* Change record:
 * JWW 030321 New file to define the MSL API for math helpers
 * ejs 030424 Added _MSL_IMP_EXP_C for non-inlined routines __msl_fma, __msl_fmaf
 * JWW 030612 Added prototypes for __builtin_xxx compiler intrinsics
 * ejs 030613 Standardize the __builtin_xxx types
 */