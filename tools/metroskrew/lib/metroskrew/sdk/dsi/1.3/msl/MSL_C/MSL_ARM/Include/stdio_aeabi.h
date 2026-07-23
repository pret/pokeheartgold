#ifndef _MSL_STDIO_AEABI
#define _MSL_STDIO_AEABI

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#error You must have the non-MSL C header file access path before the MSL access path
#else

#include <cstdio>

#if _AEABI_PORTABILITY_LEVEL
	using std::stdout;
	using std::stdin;
	using std::stderr;
#endif

#endif /*end of _MSL_USING_MW_C_HEADERS */ 

#endif /* end of _MSL_STDIO_AEABI*/