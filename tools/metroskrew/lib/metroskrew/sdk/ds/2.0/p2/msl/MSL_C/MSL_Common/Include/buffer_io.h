/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:32:23 $
 * $Revision: 1.24.2.2 $
 */

#ifndef _MSL_BUFFER_IO_H
#define _MSL_BUFFER_IO_H

#include <ansi_parms.h>
#include <cstdio>

_MSL_BEGIN_EXTERN_C

	enum {
		__align_buffer,
		__dont_align_buffer
	};
	
	void _MSL_CDECL __convert_from_newlines(unsigned char * p, __std(size_t) * n) _MSL_CANT_THROW; 					/*- hh 990121 -*/
	void _MSL_CDECL __convert_to_newlines  (unsigned char * p, __std(size_t) * n) _MSL_CANT_THROW;
	void _MSL_CDECL __prep_buffer (__std(FILE) *  ) _MSL_CANT_THROW;												/*- mf 990715 -*/
	int	 _MSL_CDECL __load_buffer (__std(FILE) *  , __std(size_t) * bytes_loaded, int alignment) _MSL_CANT_THROW;  	/*- mf 990715 -*/
	int	 _MSL_CDECL __flush_buffer(__std(FILE) *  , __std(size_t) * bytes_flushed) _MSL_CANT_THROW;  				/*- mf 990715 -*/

_MSL_END_EXTERN_C

#endif /* _MSL_BUFFER_IO_H */

/* Change record:
 * hh  971206 namespace support
 * hh  990121 Fixed __std 7 places
 * mf  990715 Arg names in prototype cause conflicts
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated defines to JWW new namespace macros
 * JWW 010618 Use cname headers exclusively to prevent namespace pollution in C++
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * hh  020603 Added no throw spec to functions
 */