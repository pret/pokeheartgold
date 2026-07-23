/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/02/09 19:20:17 $
 * $Revision: 1.17.4.2 $
 */

// list.h               // hh 971207 Changed filename from list to list.h

#if defined(__PALMOS_TRAPS__) && __PALMOS_TRAPS__
#error The wrong List.h is being included.  You should set your access paths so that "{Compiler}/Palm OS Support" appears before any MSL access paths.
#endif

#ifndef _LIST_H             // hh 971207 added standard include guards
#define _LIST_H

#include <list>

#ifndef _MSL_NO_CPP_NAMESPACE           // hh 971207 Added backward compatibility
	using std::list;
#endif

#endif  // _LIST_H

// hh 971207 Changed filename from list to list.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
