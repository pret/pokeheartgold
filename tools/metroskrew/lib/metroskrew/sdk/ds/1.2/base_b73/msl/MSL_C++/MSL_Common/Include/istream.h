/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/02/04 15:34:25 $
 * $Revision: 1.17.4.1 $
 */

// istream.h               // hh 971207 Changed filename from istream to istream.h

#ifndef _ISTREAM_H             // hh 971207 added standard include guards
#define _ISTREAM_H

#include <istream>

#ifndef _MSL_NO_CPP_NAMESPACE        // hh 971207 Added backward compatibility
#ifndef _MSL_NO_IO
	using std::basic_istream;
	using std::istream;
	using std::basic_iostream;
	using std::iostream;
#ifndef _MSL_NO_WCHART_CPP_SUPPORT
	using std::wistream;
	using std::wiostream;
	using std::ws;
#endif
#endif
#endif

#endif  // _ISTREAM_H

// hh 971207 Changed filename from istream to istream.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
