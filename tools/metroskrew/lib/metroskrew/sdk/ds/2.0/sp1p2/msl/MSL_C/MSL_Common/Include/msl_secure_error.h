/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:45 $
 * $Revision: 1.2.2.2 $
 */

#ifndef _MSL_SECURE_ERROR_H
#define _MSL_SECURE_ERROR_H

#include <ansi_parms.h>

_MSL_BEGIN_EXTERN_C

typedef void (*__msl_secure_user_fn_ptr)(void);

void _MSL_CDECL __msl_undefined_behavior_s(void) _MSL_CANT_THROW;

_MSL_IMP_EXP_C void _MSL_CDECL __msl_set_secure_undefined(__msl_secure_user_fn_ptr) _MSL_CANT_THROW;
_MSL_IMP_EXP_C __msl_secure_user_fn_ptr _MSL_CDECL __msl_get_secure_undefined(void) _MSL_CANT_THROW;

_MSL_END_EXTERN_C

#endif /* _MSL_SECURE_ERROR_H */

/* Change record:
 * JWW 050111 New file to handle diagnosed undefined behavior in secure library routines
 */