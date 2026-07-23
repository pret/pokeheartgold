/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/02/04 15:37:30 $
 * $Revision: 1.17.4.1 $
 */

// sstream.h             // hh 971207 Changed filename from sstream to sstream.h

#ifndef _SSTREAM_H              // hh 971207 added standard include guards
#define _SSTREAM_H

#include <sstream>

#ifndef _MSL_NO_CPP_NAMESPACE            // hh 971207 Added backward compatibility
#ifndef _MSL_NO_IO
	using std::basic_stringbuf;
	using std::stringbuf;
	using std::basic_istringstream;
	using std::istringstream;
	using std::basic_ostringstream;
	using std::ostringstream;
	using std::basic_stringstream;
	using std::stringstream;
#ifndef _MSL_NO_WCHART_CPP_SUPPORT
	using std::wstringbuf;
	using std::wistringstream;
	using std::wostringstream;
	using std::wstringstream;
#endif
#endif
#endif

#endif  // _SSTREAM_H

// hh 971207 Changed filename from sstream to sstream.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
