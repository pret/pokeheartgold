/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/05/22 19:25:22 $
 * $Revision: 1.6.2.3 $
 */

#ifndef	__PREFIX_NITRO__
#define	__PREFIX_NITRO__

	
#define _MSL_THREADSAFE 1

#define _MSL_LOCALDATA_AVAILABLE 0

#define _MSL_OS_DIRECT_MALLOC

#define _MSL_OS_ALLOC_SUPPORT 1

#define _MSL_NEEDS_EXTRAS 1

/* Resolve duplicate time() warning in DS2.0 */
#define _MSL_OS_TIME_SUPPORT 0

#define SDK_ARM9	1


#endif	/* __PREFIX_NITRO__ */

/* Change record:
 * cc  040322 Added for Nitro OS features
 */