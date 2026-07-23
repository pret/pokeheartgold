/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 16:58:30 $
 * $Revision: 1.19.2.2 $
 */

// iomanip.h         // hh 971207 Changed filename from iomanip to iomanip.h

#ifndef _IOMANIP_H              // hh 971207 added standard include guards
#define _IOMANIP_H

#include <iomanip>

#ifndef _MSL_NO_CPP_NAMESPACE        // hh 971207 Added backward compatibility
#ifndef _MSL_NO_IO
	using std::resetiosflags;
	using std::setiosflags;
	using std::setbase;
	using std::setfill;
	using std::setprecision;
	using std::setw;
#endif  // _MSL_NO_IO
#endif  // _MSL_NO_CPP_NAMESPACE        // hh 971207 Added backward compatibility

#endif  // _IOMANIP_H              // hh 971207 added standard include guards

// hh 971207 Changed filename from iomanip to iomanip.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
