/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:44 $
 * $Revision: 1.3.2.2 $
 */

#ifndef _MSL_CPP_STD_WCTYPE_H
#define _MSL_CPP_STD_WCTYPE_H

#ifdef __cplusplus

#if _MSL_OS_X_VERSION > 2

namespace std {

#if _MSL_WIDE_CHAR
	using ::wctrans_t;
	using ::wctype_t;
	using ::wint_t;
	using ::iswalnum;
	using ::iswalpha;
#if _MSL_C99
	using ::iswblank;
#endif /* _MSL_C99 */
	using ::iswcntrl;
	using ::iswctype;
	using ::iswdigit;
	using ::iswgraph;
	using ::iswlower;
	using ::iswprint;
	using ::iswpunct;
	using ::iswspace;
	using ::iswupper;
	using ::iswxdigit;
	using ::towctrans;
	using ::towlower;
	using ::towupper;
	using ::wctrans;
	using ::wctype;
#endif /* _MSL_WIDE_CHAR */

} /* namespace std */

#endif /* _MSL_OS_X_VERSION > 2 */

#endif /* __cplusplus */

#endif /* _MSL_CPP_STD_WCTYPE_H */

/* Change record:
 * JWW 050128 Put C items into the std namespace
 */