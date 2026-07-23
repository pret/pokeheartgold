/* MSL
 * Copyright © 1995 - 2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 17:03:43 $
 * $Revision: 1.2.2.2 $
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