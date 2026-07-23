/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 16:59:31 $
 * $Revision: 1.20.2.2 $
 */

// strstream.h

#ifndef _STRSTREAM_H
#define _STRSTREAM_H

#include <strstream>

#ifndef _MSL_NO_CPP_NAMESPACE
#ifndef _MSL_NO_IO
	using std::strstreambuf;
	using std::istrstream;
	using std::ostrstream;
	using std::strstream;
#endif  // _MSL_NO_IO
#endif  // _MSL_NO_CPP_NAMESPACE

#endif  // _STRSTREAM_H

// hh 990120 changed name of MSIPL flags
