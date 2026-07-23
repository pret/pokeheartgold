/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/02/04 15:37:08 $
 * $Revision: 1.16.4.1 $
 */

// queue.h             // hh 971207 Changed filename from queue to queue.h

#ifndef _QUEUE_H               // hh 971207 added standard include guards
#define _QUEUE_H

#include <queue>

#ifndef _MSL_NO_CPP_NAMESPACE          // hh 971207 Added backward compatibility
	using std::queue;
	using std::priority_queue;
#endif

#endif  // _QUEUE_H

// hh 971207 Changed filename from queue to queue.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
