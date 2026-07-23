/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/02/04 15:34:20 $
 * $Revision: 1.17.4.1 $
 */

// iostream.h               // hh 971207 Changed filename from iostream to iostream.h

#ifndef _IOSTREAM_H              // hh 971207 added standard include guards
#define _IOSTREAM_H

#include <iostream>
#include <ostream.h>
#include <istream.h>
#include <streambuf.h>
#include <ios.h>

#ifndef _MSL_NO_CPP_NAMESPACE         // hh 971207 Added backward compatibility
#ifndef _MSL_NO_IO
	using std::cin;
	using std::cout;
	using std::cerr;
	using std::clog;
#ifndef _MSL_NO_WCHART_CPP_SUPPORT
	using std::wcin;
	using std::wcout;
	using std::wcerr;
	using std::wclog;
#endif
#endif
#endif

#endif  // _IOSTREAM_H

// hh 971207 Changed filename from iostream to iostream.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
