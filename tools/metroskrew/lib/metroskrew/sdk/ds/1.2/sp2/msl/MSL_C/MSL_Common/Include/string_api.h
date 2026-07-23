/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:03:06 $
 * $Revision: 1.5.4.1 $
 */

#ifndef _MSL_STRING_API_H
#define _MSL_STRING_API_H

#include <ansi_parms.h>
#include <size_t.h>
#include <null.h>

#define __max_errstr	40		/*- mm 010509 -*/

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

	char * _MSL_CDECL __strerror(int , char *) _MSL_CANT_THROW;
	void * _MSL_CDECL __memrchr(const void *, int, size_t) _MSL_CANT_THROW;

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif /* _MSL_STRING_API_H */

/* Change record:
 * cc  011023 Moved in API's
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * hh  020603 Added no throw spec to functions
 */