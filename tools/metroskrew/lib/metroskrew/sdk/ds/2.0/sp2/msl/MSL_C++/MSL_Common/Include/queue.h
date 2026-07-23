/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 16:59:14 $
 * $Revision: 1.19.2.2 $
 */

// queue.h             // hh 971207 Changed filename from queue to queue.h

#ifndef _QUEUE_H               // hh 971207 added standard include guards
#define _QUEUE_H

#include <queue>

#ifndef _MSL_NO_CPP_NAMESPACE          // hh 971207 Added backward compatibility
	using std::queue;
	using std::priority_queue;
#endif  // _MSL_NO_CPP_NAMESPACE          // hh 971207 Added backward compatibility

#endif  // _QUEUE_H               // hh 971207 added standard include guards

// hh 971207 Changed filename from queue to queue.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
