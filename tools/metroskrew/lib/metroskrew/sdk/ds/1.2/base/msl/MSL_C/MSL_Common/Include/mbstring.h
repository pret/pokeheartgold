/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:03:03 $
 * $Revision: 1.11.4.1 $
 */

#ifndef _MSL_MBSTRING
#define _MSL_MBSTRING		

#include <ansi_parms.h>
#include <wchar_t.h>
#include <size_t.h>

_MSL_IMP_EXP_C  int __utf8_to_unicode(wchar_t *, const char *, __std(size_t)) _MSL_CANT_THROW;
_MSL_IMP_EXP_C  int __unicode_to_UTF8(char * _MSL_RESTRICT, wchar_t) _MSL_CANT_THROW;
_MSL_IMP_EXP_C  int __mbtowc_noconv(wchar_t *, const char *, __std(size_t)) _MSL_CANT_THROW;	/*- mm 020125 -*/
_MSL_IMP_EXP_C  int __wctomb_noconv(char *, wchar_t wchar) _MSL_CANT_THROW;						/*- mm 020125 -*/

#endif

/* Change record:
 * mm  011130 File created for implementation of locale
 * cc  011217 Added ansi_parms.h 
 * cc  020108 Added include guards
 * mm  020125 Added declarations of no conversion options for locale
 * JWW 020213 Put a pretty __std() wrapper around size_t
 * hh  020603 Added include <wchar_t.h>, <size_t.h>
 * hh  020603 Added no throw spec to functions
 */