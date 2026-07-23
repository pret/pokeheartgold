/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 16:59:18 $
 * $Revision: 1.17.2.2 $
 */

// slist.h

#ifndef _SLIST_H
#define _SLIST_H

#include <slist>

#ifndef _MSL_NO_CPP_NAMESPACE
	using Metrowerks::slist;
#endif

#endif // _SLIST_H

// hh 971220 fixed MOD_INCLUDE
// hh 971223 added alignment wrapper
// hh 971223 added header <iterator>
// dwa, hh 980306 added qualifier to iterator in two places
// hh 980306 removed unused argument in two places
// hh 980713 Temporarily moved member templates into class definition to support compiler
// hh 980902 #ifdef'd out exception code when ndef MSIPL_EXCEPT
// hh 990629 Rewrote
// hh 000129 Moved into namespace Metrowerks
