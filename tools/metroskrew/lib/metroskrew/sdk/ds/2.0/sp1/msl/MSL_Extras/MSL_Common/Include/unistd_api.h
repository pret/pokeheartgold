/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 17:03:04 $
 * $Revision: 1.8.2.2 $
 */

#ifndef	_MSL_UNISTD_API_H
#define	_MSL_UNISTD_API_H

#include <ansi_parms.h>

_MSL_BEGIN_EXTERN_C

#if	(__dest_os	== __win32_os || __dest_os == __mac_os)
	int _MSL_CDECL __msl_vspawnl(int,const char *prog, va_list va) _MSL_CANT_THROW;
	int	_MSL_CDECL __msl_vspawnle(int,const char *prog, va_list va) _MSL_CANT_THROW;
	int	_MSL_CDECL __msl_vspawnlp(int,const char *prog, va_list va) _MSL_CANT_THROW;
	int	_MSL_CDECL __msl_vspawnlpe(int,const char *prog, va_list va) _MSL_CANT_THROW;
#endif

_MSL_END_EXTERN_C

#endif /* _MSL_UNISTD_API_H */

/* ChangeLog:
 * ejs 011119  Created
 */