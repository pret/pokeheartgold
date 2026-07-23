/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/02/04 15:36:41 $
 * $Revision: 1.16.4.1 $
 */

// numeric.h          // hh 971207 Changed filename from numeric to numeric.h

#ifndef _NUMERIC_H             // hh 971207 added standard include guards
#define _NUMERIC_H

#include <numeric>

#ifndef _MSL_NO_CPP_NAMESPACE           // hh 971207 Added backward compatibility
	using std::accumulate;
	using std::inner_product;
	using std::partial_sum;
	using std::adjacent_difference;
#endif

#endif  // _NUMERIC_H

// hh 971207 Changed filename from numeric to numeric.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991113 modified using policy
