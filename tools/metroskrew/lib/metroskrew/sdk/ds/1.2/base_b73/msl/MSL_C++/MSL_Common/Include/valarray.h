/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 *  $Date: 2004/02/04 15:38:57 $
 *  $Revision: 1.16.4.1 $
 */

// valarray.h             // hh 971207 Changed filename from valarray to valarray.h

#ifndef _VALARRAY_H               // hh 971207 added standard include guards
#define _VALARRAY_H

#include <valarray>

#ifndef _MSL_NO_CPP_NAMESPACE            // hh 971207 Added backward compatibility
	using std::valarray;
	using std::slice;
	using std::gslice;
#endif

#endif  // _VALARRAY_H

// hh 971207 Changed filename from valarray to valarray.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
