/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/02/04 15:37:00 $
 * $Revision: 1.17.4.1 $
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
#endif
#endif

#endif  // _OSTREAM_H

// hh 971207 Changed filename from ostream to ostream.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
