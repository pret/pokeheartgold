/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 16:59:06 $
 * $Revision: 1.21.2.2 $
 */

// new.h        hh 971206 Changed file name from new

#ifndef _NEW_H
#define _NEW_H

#include <new>

#ifdef _MSL_USING_NAMESPACE
	using std::size_t;
#endif

#ifndef _MSL_NO_CPP_NAMESPACE
	using std::bad_alloc;
	using std::nothrow_t;
	using std::nothrow;
	using std::new_handler;
	using std::set_new_handler;
#endif  // _MSL_NO_CPP_NAMESPACE

#endif  // _NEW_H

// hh 971206  Changed filename from new to new.h and added namespace support
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
// hh 000828 Added size_t
