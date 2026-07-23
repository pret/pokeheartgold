/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/02/04 15:38:42 $
 * $Revision: 1.16.4.1 $
 */

// typeinfo.h

#ifndef _TYPEINFO_H
#define _TYPEINFO_H

#include <typeinfo>

#ifndef _MSL_NO_CPP_NAMESPACE
	using std::type_info;
	using std::bad_cast;
	using std::bad_typeid;
#endif

#endif  // _TYPEINFO_H

// hh 971206  Added namespace support
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
