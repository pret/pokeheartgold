/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 16:59:26 $
 * $Revision: 1.20.2.2 $
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
#endif  // _MSL_NO_IO
#endif  // _MSL_NO_CPP_NAMESPACE      // hh 971207 Added backward compatibility

#endif  // _STREAMBUF_H              // hh 971207 added standard include guards

// hh 971207 Changed filename from streambuf to streambuf.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
