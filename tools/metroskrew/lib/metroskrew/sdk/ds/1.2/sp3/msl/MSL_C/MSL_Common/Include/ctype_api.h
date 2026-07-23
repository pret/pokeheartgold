/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:02:59 $
 * $Revision: 1.10.4.1 $
 */

#ifndef _MSL_CTYPE_API_H
#define	_MSL_CTYPE_API_H	

#include <ansi_parms.h>
#include <eof.h>										

_MSL_BEGIN_EXTERN_C										

	#if !_MSL_C_LOCALE_ONLY	
		#define __msl_cmap_size 256
	#else
		#define __msl_cmap_size 128
	#endif	

	#if !_MSL_C_LOCALE_ONLY
		extern _MSL_IMP_EXP_C const unsigned short __msl_ctype_map[__msl_cmap_size];
		extern _MSL_IMP_EXP_C const unsigned char __lower_map[__msl_cmap_size];
		extern _MSL_IMP_EXP_C const unsigned char __upper_map[__msl_cmap_size];
	#endif /* _MSL_C_LOCALE_ONLY */
	
	extern _MSL_IMP_EXP_C const unsigned short __ctype_mapC[__msl_cmap_size];
	extern _MSL_IMP_EXP_C const unsigned char __lower_mapC[__msl_cmap_size];
	extern _MSL_IMP_EXP_C const unsigned char __upper_mapC[__msl_cmap_size];
	
_MSL_END_EXTERN_C										

#define __msl_alpha		0x0001
#define __msl_blank		0x0002
#define __msl_cntrl		0x0004
#define __msl_digit		0x0008
#define __msl_graph		0x0010
#define __msl_lower		0x0020
#define __msl_print		0x0040
#define __msl_punct		0x0080
#define __msl_space		0x0100
#define __msl_upper		0x0200
#define __msl_xdigit	0x0400

#define __msl_alnum		(__msl_alpha | __msl_digit)

#endif /* _MSL_CTYPE_API_H */

/* Change record:
 * cc  011003 Moved API's out of cctype
 * JWW 020305 Recoded ctype map to use shorts instead of chars and define map bits appropriately
 * JWW 020308 Explicitly define table sizes and remove the unnecessary zero-fill macro
 * cc  020521 Added const keyword for platforms with limited RAM space
 * cc  021001 Added support for _MSL_C_LOCALE_ONLY
 */