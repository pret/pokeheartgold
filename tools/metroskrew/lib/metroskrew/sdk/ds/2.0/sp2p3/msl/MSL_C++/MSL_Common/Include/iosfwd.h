/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 16:58:33 $
 * $Revision: 1.20.2.2 $
 */

// iosfwd.h             // hh 971207 Changed filename from iosfwd to iosfwd.h

#ifndef _IOSFWD_H              // hh 971207 added standard include guards
#define _IOSFWD_H

#include <iosfwd>

#ifndef _MSL_NO_CPP_NAMESPACE              // hh 971207 Added backward compatibility
	using std::char_traits;
	using std::allocator;
#ifndef _MSL_NO_IO
	using std::basic_ios;
	using std::basic_streambuf;
	using std::basic_istream;
	using std::basic_ostream;
	using std::basic_iostream;
	using std::basic_stringbuf;
	using std::basic_istringstream;
	using std::basic_ostringstream;
	using std::basic_stringstream;
	using std::basic_filebuf;
	using std::basic_ifstream;
	using std::basic_ofstream;
	using std::basic_fstream;
	using std::istreambuf_iterator;
	using std::ostreambuf_iterator;
	using std::ios;
	using std::streambuf;
	using std::istream;
	using std::ostream;
	using std::iostream;
	using std::stringbuf;
	using std::istringstream;
	using std::ostringstream;
	using std::stringstream;
	using std::filebuf;
	using std::ifstream;
	using std::ofstream;
	using std::fstream;
	using std::fpos;
	using std::streampos;
#ifndef _MSL_NO_WCHART_CPP_SUPPORT
	using std::wios;
	using std::wstreambuf;
	using std::wistream;
	using std::wostream;
	using std::wiostream;
	using std::wstringbuf;
	using std::wistringstream;
	using std::wostringstream;
	using std::wstringstream;
	using std::wfilebuf;
	using std::wifstream;
	using std::wofstream;
	using std::wfstream;
	using std::wstreampos;
#endif  // _MSL_NO_WCHART_CPP_SUPPORT
#endif  // _MSL_NO_IO
#endif  // _MSL_NO_CPP_NAMESPACE              // hh 971207 Added backward compatibility

#endif  // _IOSFWD_H              // hh 971207 added standard include guards

// hh 971207 Changed filename from iosfwd to iosfwd.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
