/* MSL
 * Copyright © 1995-2007 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2007/01/29 18:20:18 $
 * $Revision: 1.22 $
 */

// set.h          // hh 971207 Changed filename from set to set.h

#ifndef _SET_H            // hh 971207 added standard include guards
#define _SET_H

#include <set>

#ifndef _MSL_NO_CPP_NAMESPACE            // hh 971207 Added backward compatibility
	using std::set;
	using std::multiset;
#endif  // _MSL_NO_CPP_NAMESPACE            // hh 971207 Added backward compatibility

#endif  // _SET_H            // hh 971207 added standard include guards

// hh 971207 Changed filename from set to set.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
