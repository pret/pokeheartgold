/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 16:59:04 $
 * $Revision: 1.26.2.3 $
 */

// MSLstring.h

#ifndef _MSLSTRING_H
#define _MSLSTRING_H

// _MSLstring is a special simple string class used by <stdexept>.  This
// class breaks a potentially cyclic relationship between <stdexcept> and
// <string>.  Without this class, <string> throws classes from <stdexcept>
// and <stdexcept> processes <string>.  By making <stdexcept> depend on
// _MSLstring instead of <string>, the cycle is broken.
// hh 971226

#include <mslconfig>
#include <msl_smart_pointers>
#include <stringfwd>
#include <cstring>

#ifdef __MWERKS__
#pragma options align=native
#endif

#ifdef _MSL_FORCE_ENUMS_ALWAYS_INT
	#if _MSL_FORCE_ENUMS_ALWAYS_INT
		#pragma enumsalwaysint on
	#else
		#pragma enumsalwaysint off
	#endif
#endif  // _MSL_FORCE_ENUMS_ALWAYS_INT

#ifdef _MSL_FORCE_ENABLE_BOOL_SUPPORT
	#if _MSL_FORCE_ENABLE_BOOL_SUPPORT
		#pragma bool on
	#else
		#pragma bool off
	#endif
#endif  // _MSL_FORCE_ENABLE_BOOL_SUPPORT

#ifndef _MSL_NO_CPP_NAMESPACE
	namespace std {
#endif

class _MSLstring {
public:
	_MSLstring(const char* value);
	_MSL_IMP_EXP_CPP _MSLstring(const string& value);
	const char* c_str() const;
protected:
private:
	_TR1::shared_ptr<char> data_;
};

inline
_MSLstring::_MSLstring(const char* value)
	: data_(new char [strlen(value)+1], detail::default_delete<char[]>())
{
	strcpy(const_cast<char*>(static_cast<const char*>(data_.get())), value);
}

inline
const char*
_MSLstring::c_str() const
{
	return data_.get();
}

#ifndef _MSL_NO_CPP_NAMESPACE
	} // namespace std
#endif

#ifdef _MSL_FORCE_ENUMS_ALWAYS_INT
	#pragma enumsalwaysint reset
#endif

#ifdef _MSL_FORCE_ENABLE_BOOL_SUPPORT
	#pragma bool reset
#endif

#ifdef __MWERKS__
#pragma options align=reset
#endif

#endif // _MSLSTRING_H

// hh 990120 changed name of MSIPL flags
// hh 990314 Added const char* constructor to support nonstandard const char* constructors
//           on all of the standard exceptions.
// hh 991114 Uses <stringfwd>.
// hh 000130 Installed _MSL_IMP_EXP_CPP
// hh 010402 Removed 68K CMF support
