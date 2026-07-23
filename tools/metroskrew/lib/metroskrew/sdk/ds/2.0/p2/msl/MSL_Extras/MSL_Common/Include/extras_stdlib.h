/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 17:03:03 $
 * $Revision: 1.7.2.3 $
 */

#ifndef _MSL_EXTRAS_STDLIB_H
#define _MSL_EXTRAS_STDLIB_H

#if (__dest_os == __win32_os || __dest_os == __wince_os)
	#include <extras_stdlib_win32.h>
#endif

_MSL_BEGIN_EXTERN_C

	_MSL_IMP_EXP_C int _MSL_CDECL rand_r(unsigned int *) _MSL_CANT_THROW;
	
	_MSL_IMP_EXP_C char * _MSL_CDECL itoa(int, char *, int) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C char * _MSL_CDECL ultoa(unsigned long, char *, int) _MSL_CANT_THROW;
 	
	__inline char * _MSL_CDECL ltoa(long x, char *y, int z) _MSL_CANT_THROW { return (itoa(x, y, z)); }
	
	#if _MSL_FLOATING_POINT
		_MSL_IMP_EXP_C char * _MSL_CDECL gcvt(double, int, char *) _MSL_CANT_THROW;
	#endif

_MSL_END_EXTERN_C

#endif /* _MSL_EXTRAS_STDLIB_H */

/* Change record:
 * cc  030620 Extras split to reduce namespace pollution
 * ejs 030721 Remove <unistd.h> include
 * cc  030722 Moved out _itoa, _ultoa, and _gcvt
 * cc  030722 Moved underscored functions out of extras common headers/source.  
 *            They now live in the extras_xxxx_win32.h headers/source.
 * JWW 031103 Added rand_r
 * cc  040217 Changed _No_Floating_Point to _MSL_FLOATING_POINT 
 */