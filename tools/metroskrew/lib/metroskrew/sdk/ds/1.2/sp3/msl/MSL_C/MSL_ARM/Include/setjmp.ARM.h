/* Metrowerks Standard Library
 * Copyright © 1995-2001 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2003/02/21 20:46:41 $
 * $Revision: 1.4 $
 */

#ifndef _MSL_SETJMP_ARM_H
#define _MSL_SETJMP_ARM_H

#define _MSL_SETJMP_LONGJMP_DEFINED

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

	typedef unsigned long jmp_buf[16];	/*	space for all 16 ARM registers, just to be safe	*/	
    
    _MSL_IMP_EXP_C void longjmp(jmp_buf env, int val);
    #define setjmp(jmp_buf) __std(__setjmp(jmp_buf))
    _MSL_IMP_EXP_C int __setjmp(jmp_buf env);

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif /* _MSL_SETJMP_ARM_H */

/* Change record:
 * JMM 020419 New file.
 * BLC 030120 Fixed for ANSI C compliance by making setjmp a macro
 */