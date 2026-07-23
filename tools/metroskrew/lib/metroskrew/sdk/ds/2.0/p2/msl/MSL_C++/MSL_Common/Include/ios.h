/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 16:58:31 $
 * $Revision: 1.20.2.2 $
 */

// ios.h            // hh 971207 Changed filename from ios to ios.h

#ifndef _IOS_H             // hh 971207 added standard include guards
#define _IOS_H

#include <ios>

#ifndef _MSL_NO_CPP_NAMESPACE       // hh 971207 Added backward compatibility
#ifndef _MSL_NO_IO
	using std::streamoff;
	using std::streamsize;
	using std::fpos;
	using std::ios_base;
	using std::basic_ios;
	using std::ios;
#ifndef _MSL_NO_WCHART_CPP_SUPPORT
	using std::wios;
#endif
	using std::boolalpha;
	using std::noboolalpha;
	using std::showbase;
	using std::noshowbase;
	using std::showpoint;
	using std::noshowpoint;
	using std::showpos;
	using std::noshowpos;
	using std::skipws;
	using std::noskipws;
	using std::uppercase;
	using std::nouppercase;
	using std::internal;
	using std::left;
	using std::right;
	using std::dec;
	using std::hex;
	using std::oct;
	using std::fixed;
	using std::scientific;
#endif  // _MSL_NO_IO
#endif  // _MSL_NO_CPP_NAMESPACE       // hh 971207 Added backward compatibility

#endif  // _IOS_H             // hh 971207 added standard include guards

// hh 971207 Changed filename from ios to ios.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
