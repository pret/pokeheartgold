/* MSL
 * Copyright © 1995-2007 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2007/01/29 18:20:16 $
 * $Revision: 1.23 $
 */

// ostream.h          // hh 971207 Changed filename from ostream to ostream.h

#ifndef _OSTREAM_H           // hh 971207 added standard include guards
#define _OSTREAM_H

#include <ostream>

#ifndef _MSL_NO_CPP_NAMESPACE          // hh 971207 Added backward compatibility
#ifndef _MSL_NO_IO
	using std::basic_ostream;
	using std::ostream;
#ifndef _MSL_NO_WCHART_CPP_SUPPORT
	using std::wostream;
#endif
	using std::endl;
	using std::ends;
	using std::flush;
#endif  // _MSL_NO_IO
#endif  // _MSL_NO_CPP_NAMESPACE          // hh 971207 Added backward compatibility

#endif  // _OSTREAM_H           // hh 971207 added standard include guards

// hh 971207 Changed filename from ostream to ostream.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
