/* MSL
 * Copyright © 1995-2007 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2007/01/29 18:12:14 $
 * $Revision: 1.7 $
 */

#ifndef _MSL_CPP_STD_INTTYPES_H 
#define _MSL_CPP_STD_INTTYPES_H

#if _MSL_C99

#ifdef __cplusplus

#if _MSL_OS_X_VERSION > 2

namespace std {

	using ::imaxdiv_t;
	using ::imaxabs;
	using ::imaxdiv;
	using ::strtoimax;
	using ::strtoumax;
#if _MSL_WIDE_CHAR
	using ::wcstoimax;
	using ::wcstoumax;
#endif /* _MSL_WIDE_CHAR */

} /* namespace std */

#endif /* _MSL_OS_X_VERSION > 2 */

#endif /* __cplusplus */

#endif /* _MSL_C99 */

#endif /* _MSL_CPP_STD_INTTYPES_H */

/* Change record:
 * JWW 050128 Put C items into the std namespace
 */