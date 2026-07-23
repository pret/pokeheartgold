/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 16:58:49 $
 * $Revision: 1.19.2.2 $
 */

// map.h           // hh 971207 Changed filename from map to map.h

#ifndef _MAP_H             // hh 971207 added standard include guards
#define _MAP_H

#include <map>

#ifndef _MSL_NO_CPP_NAMESPACE       // hh 971207 Added backward compatibility
	using std::map;
	using std::multimap;
#endif  // _MSL_NO_CPP_NAMESPACE       // hh 971207 Added backward compatibility

#endif  // _MAP_H             // hh 971207 added standard include guards

// hh 971207 Changed filename from map to map.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
