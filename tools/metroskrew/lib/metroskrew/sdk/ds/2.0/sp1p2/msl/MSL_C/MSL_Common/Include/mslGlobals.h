/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:45 $
 * $Revision: 1.35.2.3 $
 */

#ifndef _MSLGLOBALS_H
#define _MSLGLOBALS_H

#if defined(__MC68K__) || defined(__COLDFIRE__)
	#if defined(__PALMOS_TRAPS__)
		#include <ansi_prefix.Palm_OS.h>		/* Palm */
	#elif defined(__embedded__)
		#include <ansi_prefix.E68k.h>			/* Embedded 68K */
	#else
		/* Unknown 68K */
		#error mslGlobals.h could not include prefix file
	#endif
#elif (defined(__POWERPC__) && !defined(__PPC_EABI__)) && __MACH__
	#include <ansi_prefix.mach.h>				/* PowerPC Macintosh Mach-O */
#elif (defined(__POWERPC__) && !defined(__PPC_EABI__))
	#include <ansi_prefix.mac.h>				/* PowerPC Macintosh PEF */
#elif defined(__PPCGEKKO__)
	#include <ansi_prefix.PPCEABI.Gamecube.h>	/* PowerPC Gamecube */
#elif defined(__PPC_EABI__)
	#include <ansi_prefix.PPCEABI.bare.h>		/* Embedded PowerPC */
#elif defined(__INTEL__)
	#if defined(__linux__)
		#include <ansi_prefix.Linux_x86.h>		/* Linux x86 */
	#elif !defined(UNDER_CE)
		#include <ansi_prefix.Win32.h>			/* Windows x86 */
	#else
		/* Unknown x86 */
		#error mslGlobals.h could not include prefix file
	#endif
#elif (defined(__MIPS__) && !defined(UNDER_CE))
	#if defined(__MIPS_PSX2__)
		#include <ansi_prefix.MIPS_PS2.h>		/* Playstation 2 MIPS */
	#else
		#include <ansi_prefix.MIPS_bare.h>		/* Embedded MIPS */
	#endif
#elif defined(__m56800E__) || defined(__m56800__)
    #include <ansi_prefix_dsp.h>				/* Hawk DSP */
#elif defined (__MCORE__)
	#include <ansi_prefix.MCORE_EABI_bare.h>	/* MCORE */
#elif defined (__SH__) 
	#include <ansi_prefix.SH_bare.h>			/* SH */
#elif defined (__arm)
	#include <ansi_prefix.ARM.h>				/* ARM */
#elif defined (_ENTERPRISE_C_)
	#include <ansi_prefix_StarCore.h>			/* StarCore */
#else
	/* Unknown platform! */
	#ifndef RC_INVOKED
		#error mslGlobals.h could not include prefix file
	#endif
#endif

#endif /* _MSLGLOBALS_H */


/* Change record:
 * hh  980120 created
 * mm  981028 Added #include for ansi_prefix.56800.h
 * vss 981116 MIPS doesn't want namespaces  (?)
 * mf  981118 made mips ce not include ansi_prefix.mips.bare.h
 *            and changed __MSL_LONGLONG_SUPPORT__  def to work with
 *            what is already in all msl source files
 * bs  990121 Added BEOS
 * hh  990525 Protected error from resource compiler
 * beb 990804 Added e68k
 * vss 990804 Added mcore
 * blc 990823 Added x86 Linux
 * as  990824 Added SH
 * hh  000302 Moved namespace flag to the ansi_prefix.XXX.h files
 * as  001101 Changed __mcore__ to __MCORE__ for ABI
 * JWW 001109 Updated for Mach-O
 * cc  010202 Added __MIPS_PSX2__
 * cc  010822 Added PPCGEKKO prefix file
 * cc  011212 Removed 68K and BeOS case 
 * JWW 030224 Significant cleanup:  only determine the platform prefix file and include it
 * lgo 041109 added StarCore
 * ma  041129 added ColdFire predefined symbol
 */