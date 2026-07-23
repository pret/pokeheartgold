/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:43 $
 * $Revision: 1.2.2.2 $
 */
 
#ifndef _MSL_CPP_STD_LOCALE_H
#define _MSL_CPP_STD_LOCALE_H

#ifdef __cplusplus

namespace std {

	using ::lconv;
	using ::localeconv;
	using ::setlocale;

} /* namespace std */

#endif /* __cplusplus */

#endif /* _MSL_CPP_STD_LOCALE_H */

/* Change record: 
 * JWW 050128 Put C items into the std namespace
 */