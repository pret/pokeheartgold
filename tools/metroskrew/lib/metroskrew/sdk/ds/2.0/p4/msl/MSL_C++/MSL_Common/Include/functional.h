/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 16:58:21 $
 * $Revision: 1.20.2.2 $
 */

// functional.h            // hh 971207 Changed filename from functional to functional.h

#ifndef _FUNCTIONAL_H           // hh 971207 added standard include guards
#define _FUNCTIONAL_H

#include <functional>

#ifndef _MSL_NO_CPP_NAMESPACE             // hh 971207 Added backward compatibility
	using std::unary_function;
	using std::binary_function;
	using std::plus;
	using std::minus;
	using std::multiplies;
	using std::divides;
	using std::modulus;
	using std::negate;
	using std::equal_to;
	using std::not_equal_to;
	using std::greater;
	using std::less;
	using std::greater_equal;
	using std::less_equal;
	using std::logical_and;
	using std::logical_or;
	using std::logical_not;
	using std::unary_negate;
	using std::not1;
	using std::binary_negate;
	using std::not2;
	using std::binder1st;
	using std::bind1st;
	using std::binder2nd;
	using std::bind2nd;
	using std::pointer_to_unary_function;
	using std::pointer_to_binary_function;
	using std::ptr_fun;
	using std::mem_fun_t;
	using std::mem_fun1_t;
	using std::mem_fun;
	using std::mem_fun_ref_t;
	using std::mem_fun1_ref_t;
	using std::mem_fun_ref;
#if !defined(__MWERKS__) || (defined(__MWERKS__) && __MWERKS__ >= 0x2400)
	using std::const_mem_fun_t;
	using std::const_mem_fun1_t;
	using std::const_mem_fun_ref_t;
	using std::const_mem_fun1_ref_t;
#endif  // !defined(__MWERKS__) || (defined(__MWERKS__) && __MWERKS__ >= 0x2400)
#endif  // _MSL_NO_CPP_NAMESPACE             // hh 971207 Added backward compatibility

#endif  // _FUNCTIONAL_H           // hh 971207 added standard include guards

// hh 971207 Changed filename from functional to functional.h
// hh 971207 added standard include guards
// hh 971207 Added backward compatibility
// hh 990120 changed name of MSIPL flags
// hh 991112 modified using policy
// hh 020102 Removed pointer_to_binary_function_with_const_args
//           and pointer_to_unary_function_with_const_args.
