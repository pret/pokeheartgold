/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:44 $
 * $Revision: 1.5.2.3 $
 */

#if defined(__STDC_WANT_SECURE_LIB__) && __STDC_WANT_SECURE_LIB__

	#ifndef __STDC_SECURE_LIB__
		#define __STDC_SECURE_LIB__	200411L
	#endif /* __STDC_SECURE_LIB__ */

	#ifndef _MSL_ERRNO_T
		#define _MSL_ERRNO_T
		typedef int errno_t;
	#endif /* _MSL_ERRNO_T */

#endif /* __STDC_WANT_SECURE_LIB__ */


/* Change record:
 * JWW 040311 Created new file for tracking __STDC_SECURE_LIB__ and errno_t
 */