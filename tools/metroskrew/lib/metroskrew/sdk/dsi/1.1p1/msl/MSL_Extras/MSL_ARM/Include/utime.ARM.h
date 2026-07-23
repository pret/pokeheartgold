/* MSL
 * Copyright © 1995-2007 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2007/01/29 19:55:43 $
 * $Revision: 1.5 $
 */

/*
 *Content:Interface file to standard UNIX-style entry points ...
 *
 */

#ifndef _MSL_UTIME_ARM_H
#define _MSL_UTIME_ARM_H

#include <ansi_parms.h> 



#define _MSL_STRUCT_UTIMEBUF_TYPE struct

_MSL_BEGIN_EXTERN_C

/* struct for utimes */

struct timeval {
	long tv_sec;/* seconds */
	long tv_usec;/* microseconds  */
};


_MSL_END_EXTERN_C


#endif /* _MSL_UTIME_ARM_H */

/* Change record:
 *	jr 041119 - added utime include to extra to support time and clock
 */