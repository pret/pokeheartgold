/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 16:59:41 $
 * $Revision: 1.19.2.2 $
 */

// typeinfo.h

#ifndef _TYPEINFO_H
#define _TYPEINFO_H

#include <typeinfo>

#ifndef _MSL_NO_CPP_NAMESPACE
	using std::type_info;
	using std::bad_cast;
	using std::bad_typeid;
#endif  // _MSL_NO_CPP_NAMESPACE

#endif  // _TYPEINFO_H

// hh 971206  Added namespace support
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
