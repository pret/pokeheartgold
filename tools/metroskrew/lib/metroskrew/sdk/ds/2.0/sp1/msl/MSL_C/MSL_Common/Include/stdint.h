/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:05 $
 * $Revision: 1.23.2.2 $
 */

#ifndef _MSL_STDINT_H
#define _MSL_STDINT_H

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#error You must have the non-MSL C header file access path before the MSL access path
#elif __dest_os == __mac_os_x
	#include <stdint_mach.h>
#else

#include <cstdint>

#if _MSL_C99                    /*- mm 030303 -*/
#if defined(__cplusplus) && defined(_MSL_USING_NAMESPACE)
	using std::int8_t;
	using std::int16_t;
	using std::int32_t;
	using std::uint8_t;
	using std::uint16_t;
	using std::uint32_t;
	using std::int_least8_t;
	using std::int_least16_t;
	using std::int_least32_t;
	using std::uint_least8_t;
	using std::uint_least16_t;
	using std::uint_least32_t;
	using std::int_fast8_t;
	using std::int_fast16_t;
	using std::int_fast32_t;
	using std::uint_fast8_t;
	using std::uint_fast16_t;
	using std::uint_fast32_t;
#if _MSL_LONGLONG
	using std::int64_t;
	using std::uint64_t;
	using std::int_least64_t;
	using std::uint_least64_t;
	using std::int_fast64_t;
	using std::uint_fast64_t;
#endif /* _MSL_LONGLONG */
	using std::intptr_t;
	using std::uintptr_t;
	using std::intmax_t;
	using std::uintmax_t;
#endif /* defined(__cplusplus) && defined(_MSL_USING_NAMESPACE) */
#endif /* _MSL_C99 */			/*- mm 030303 -*/

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* _MSL_STDINT_H */

/* Change record:
 * blc 990323 Created.
 * hh  991113 Fixed using bug.
 * mm  000512 Updated to C99 Standard
 * JWW 001208 Added case for targeting Mach-O
 * JWW 011027 Use _MSL_USING_MW_C_HEADERS as generic header test instead of specific Mach-O test
 * JWW 020712 Added cases for building on top of the BSD C 3.1 library
 * JWW 030224 Changed __MSL_LONGLONG_SUPPORT__ flag into the new more configurable _MSL_LONGLONG
 * mm  030303 Added C99 wrappers.
 */