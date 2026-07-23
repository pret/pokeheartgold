/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:34 $
 * $Revision: 1.13.2.2 $
 */

#ifndef _MSL_WCTYPE_API_H
#define _MSL_WCTYPE_API_H

#include <ansi_parms.h>

#if _MSL_WIDE_CHAR

	#include <eof.h>
	#include <weof.h>
	#include <wchar_t.h>
	#include <wctrans.h>
	
	_MSL_BEGIN_EXTERN_C
	
		#if !_MSL_C_LOCALE_ONLY
			#define __msl_wcmap_size 256
		#else
			#define __msl_wcmap_size 128
		#endif
		
		#if !_MSL_C_LOCALE_ONLY
			extern _MSL_IMP_EXP_C const unsigned short __msl_wctype_map[__msl_wcmap_size];
			extern _MSL_IMP_EXP_C const wchar_t __wlower_map[__msl_wcmap_size];
			extern _MSL_IMP_EXP_C const wchar_t __wupper_map[__msl_wcmap_size];
		#endif /* _MSL_C_LOCALE_ONLY */
		
		extern _MSL_IMP_EXP_C const unsigned short __wctype_mapC[__msl_wcmap_size];
		extern _MSL_IMP_EXP_C const wchar_t __wlower_mapC[__msl_wcmap_size];
		extern _MSL_IMP_EXP_C const wchar_t __wupper_mapC[__msl_wcmap_size];
	
	_MSL_END_EXTERN_C
	
	#define __msl_walpha	0x0001
	#define __msl_wblank	0x0002
	#define __msl_wcntrl	0x0004
	#define __msl_wdigit	0x0008
	#define __msl_wgraph	0x0010
	#define __msl_wlower	0x0020
	#define __msl_wprint	0x0040
	#define __msl_wpunct	0x0080
	#define __msl_wspace	0x0100
	#define __msl_wupper	0x0200
	#define __msl_wxdigit	0x0400
	
	#define __msl_walnum	(__msl_walpha | __msl_wdigit)

#endif /* _MSL_WIDE_CHAR */

#endif /* _MSL_WCTYPE_API_H */

/* Change record:
 * cc  011017 Moved APIs
 * JWW 020130 Use _MSL_WEOF for platform independent definition of WEOF
 * JWW 020305 Recoded ctype map to use shorts instead of wchar_ts and define map bits appropriately
 * JWW 020308 Explicitly define table sizes and remove the unnecessary zero-fill macro
 * cc  020521 Added const keyword for platforms with limited RAM space
 * cc  021001 Added support for _MSL_C_LOCALE_ONLY
 * JWW 030224 Changed __NO_WIDE_CHAR flag into the new more configurable _MSL_WIDE_CHAR
 */