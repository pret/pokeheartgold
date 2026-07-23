/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/02/04 15:37:49 $
 * $Revision: 1.17.4.1 $
 */

// streambuf.h           // hh 971207 Changed filename from streambuf to streambuf.h

#ifndef _STREAMBUF_H              // hh 971207 added standard include guards
#define _STREAMBUF_H

#include <streambuf>

#ifndef _MSL_NO_CPP_NAMESPACE      // hh 971207 Added backward compatibility
#ifndef _MSL_NO_IO
	using std::basic_streambuf;
	using std::streambuf;
#ifndef _MSL_NO_WCHART_CPP_SUPPORT
	using std::wstreambuf;
#endif
#endif
#endif

#endif  // _STREAMBUF_H

// hh 971207 Changed filename from streambuf to streambuf.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
