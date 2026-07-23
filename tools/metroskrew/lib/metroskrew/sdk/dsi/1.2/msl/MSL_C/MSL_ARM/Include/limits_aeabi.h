/* MSL
 * Copyright © 1995-2007 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2007/01/29 18:12:49 $
 * $Revision: 1.2 $
 */

#ifndef _MSL_LIMITS_AEABI_H
#define _MSL_LIMITS_AEABI_H

/* Build macros based  on platform configuration */

extern const int __aeabi_MB_LEN_MAX;

#define _MSL_MB_LEN_MAX	6

#endif /* _MSL_LIMITS_AEABI_H */

/* Change record:
 * cc  060428 Integrated _AEABI_PORTABILITY_LEVEL work 
 */
 
 /* Chipwerks Change Record
  * 6/4/2006	__aeabi_MB_LEN_MAX declared for _AEABI_PORTABILITY_LEVEL macro.
  * Refer section 5.8 from "C Library ABI for the ARM architecture.pdf"
  */