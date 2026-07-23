/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:45 $
 * $Revision: 1.32.2.2 $
 */

#ifndef _MSL_OS_ENUM_H
#define _MSL_OS_ENUM_H

#define __undef_os		 0
#define __mac_os		 1
#define __win32_os		 3
#define __wince_os		 5
#define __ppc_eabi		 6
#define __nec_eabi_bare	 7
#define __nec_eabi_os	 8
#define __mips_bare		 9
#define __m56800_os		10          /*- mm 981023 -*/
#define __n64_os		11			/*- ad 990128 -*/
#define __mcore_bare	12			/*- vss 990624 -*/
#define __emb_68k		13			/*- beb 990804 -*/
#define __m56300_os		14          /*- rsj 990812 -*/
#define __sh_bare       15          /*- as 990824 -*/
#define __m56800E_os	16			/*- rw 000306 -*/ /*- ah 010119 -*/
#define __mac_os_x		17
#define __dolphin_os	18
#define __palm_os		19			/*- blc 020110 -*/
#define	__arm_bare		20			/*- jmm 020419 -*/
#define __starcore_bare	21			/*- lgo 040922 -*/

#endif /* _MSL_OS_ENUM_H */

/* Change record:
 * mm  981023 Added entry for __m56800_os
 * vss 990121 Removed powerTV
 * ad  992801 added nintendo support
 * vss 990604 mcore
 * beb 990804 e68k
 * ah  010119 __m56800E_os
 * cc  010326 removed be_os
 * cc  010822 added __dolphin_os
 * blc 020110 added __palm_os
 * jmm 020419 added __arm_bare
 * lgo 041109 added __starcore_bare
 */