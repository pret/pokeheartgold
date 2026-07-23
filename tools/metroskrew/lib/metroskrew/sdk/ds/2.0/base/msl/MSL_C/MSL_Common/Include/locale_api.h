/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:24 $
 * $Revision: 1.21.2.2 $
 */
 
#ifndef _MSL_LOCALE_API_H
#define _MSL_LOCALE_API_H

#include <ansi_parms.h>
#include <wchar_t.h>						/*- mm 011130 -*/
#include <size_t.h>							/*- mm 011130 -*/

#define _MSL_LOCALE_NONE 	0						/*- mm  020212 -*/
#define _MSL_LOCALE_C  		1						/*- mm  020212 -*/
#define _MSL_LOCALE_CUTF8	2						/*- mm  020212 -*/

#ifndef _MSL_DEFAULT_LOCALE  						/*- mm  020212 -*/
	#define _MSL_DEFAULT_LOCALE  _MSL_LOCALE_C		/*- mm  020212 -*/
#endif												/*- mm  020212 -*/

#define _LOCALE_NAME_LEN    48			/*- mm 011130 -*/
#define _COMPONENT_NAME_LEN  8			/*- mm 011130 -*/
#define _LOCALE_CMPT_COUNT   5			/*- mm 011130 -*/

#pragma options align=native
#pragma warn_padding off

/*- begin mm 011130 insert -*/
#if _MSL_WIDE_CHAR					/*- mm 020404 -*/
typedef int (* __decode_mbyte) (wchar_t *, const char *,  __std(size_t));
typedef int (* __encode_mbyte) (char *, wchar_t);
#endif									/*- mm 020404 -*/

#if !_MSL_C_LOCALE_ONLY	

struct _loc_mon_cmpt_vals
{
	char * mon_decimal_point;
	char * mon_thousands_sep;
	char * mon_grouping;
	char * positive_sign;
	char * negative_sign;
	char * currency_symbol;
	char   frac_digits;
	char   p_cs_precedes;
	char   n_cs_precedes;
	char   p_sep_by_space;
	char   n_sep_by_space;
	char   p_sign_posn;
	char   n_sign_posn;
	char * int_curr_symbol;
	char   int_frac_digits;
	char   int_p_cs_precedes; 
	char   int_n_cs_precedes; 
	char   int_p_sep_by_space; 
	char   int_n_sep_by_space; 
	char   int_p_sign_posn; 
	char   int_n_sign_posn; 
};

struct _loc_mon_cmpt
{
	char   CmptName[_COMPONENT_NAME_LEN];
	char * mon_decimal_point;
	char * mon_thousands_sep;
	char * mon_grouping;
	char * positive_sign;
	char * negative_sign;
	char * currency_symbol;
	char   frac_digits;
	char   p_cs_precedes;
	char   n_cs_precedes;
	char   p_sep_by_space;
	char   n_sep_by_space;
	char   p_sign_posn;
	char   n_sign_posn;
	char * int_curr_symbol;
	char   int_frac_digits;
	char   int_p_cs_precedes; 
	char   int_n_cs_precedes; 
	char   int_p_sep_by_space; 
	char   int_n_sep_by_space; 
	char   int_p_sign_posn; 
	char   int_n_sign_posn; 
};

struct _loc_coll_cmpt
{
	char   CmptName[_COMPONENT_NAME_LEN];
	int char_start_value;							/*- mm 020718 -*/
	int char_coll_tab_size;							/*- mm 020718 -*/
	short char_spec_accents;						/*- mm 020718 -*/
	unsigned short * char_coll_table_ptr;			/*- mm 020718 -*/
	unsigned short * wchar_coll_seq_ptr;
};
#else	/*- cc 030131 -*/

struct _loc_coll_cmpt
{
	int char_start_value;
	int char_coll_tab_size;
	short char_spec_accents;
	unsigned short * char_coll_table_ptr;
};

#endif /* _MSL_C_LOCALE_ONLY */ /*- cc 030131 -*/

#if !_MSL_C_LOCALE_ONLY
struct _loc_ctype_cmpt
{

#if !_MSL_C_LOCALE_ONLY
	char   CmptName[_COMPONENT_NAME_LEN];
	const unsigned short * ctype_map_ptr;
	const unsigned char * upper_map_ptr;
	const unsigned char * lower_map_ptr;
#if _MSL_WIDE_CHAR
#if _MSL_C99
	const unsigned short * wctype_map_ptr;
	const wchar_t *       wupper_map_ptr;
	const wchar_t *       wlower_map_ptr;
#endif /* _MSL_C99 */
	__decode_mbyte  decode_mb;
	__encode_mbyte  encode_wc;
#endif	/* _MSL_WIDE_CHAR */
#endif	/* !_MSL_C_LOCALE_ONLY */					
	};

#elif _MSL_WIDE_CHAR && _MSL_C_LOCALE_ONLY

	struct _loc_ctype_cmpt
	{
	__decode_mbyte  decode_mb;
	__encode_mbyte  encode_wc;
	
	};

#endif

#if !_MSL_C_LOCALE_ONLY	

struct _loc_num_cmpt_vals
{
	char * decimal_point;
	char * thousands_sep;
	char * grouping;
};

struct _loc_num_cmpt
{
	char   CmptName[_COMPONENT_NAME_LEN];
	char * decimal_point;
	char * thousands_sep;
	char * grouping;
};

#endif /* _MSL_C_LOCALE_ONLY */

struct _loc_time_cmpt
{
#if !_MSL_C_LOCALE_ONLY
	char   CmptName[_COMPONENT_NAME_LEN];
#endif /* _MSL_C_LOCALE_ONLY */
	char * am_pm;
	char * DateTime_Format;								/*- mm 020606 -*/
	char * Twelve_hr_format;							/*- mm 020606 -*/
	char * Date_Format;									/*- mm 020606 -*/
	char * Time_Format;									/*- mm 020606 -*/
	char * Day_Names;
/*  char * IsDaylightSaving;*/							/*- mm 020617 -*/
    char * MonthNames;
    char * TimeZone;
};

#if _MSL_C_LOCALE_ONLY
	struct __locale
	{
		struct _loc_time_cmpt * 	time_cmpt_ptr;
		struct _loc_coll_cmpt * 	coll_cmpt_ptr; /*- cc 030131 -*/

	  #if _MSL_WIDE_CHAR
		struct _loc_ctype_cmpt *	ctype_cmpt_ptr;
	  #endif
	}; 
#else
struct __locale													/*- mm 011205 -*/
{
	struct __locale *   		next_locale;					/*- mm 011205 -*/
	char               			locale_name[_LOCALE_NAME_LEN];
	struct _loc_coll_cmpt * 	coll_cmpt_ptr; 
	struct _loc_ctype_cmpt *	ctype_cmpt_ptr; 
	struct _loc_mon_cmpt *  	mon_cmpt_ptr; 
	struct _loc_num_cmpt *  	num_cmpt_ptr; 
	struct _loc_time_cmpt * 	time_cmpt_ptr;
}; 
#endif /* _MSL_C_LOCALE_ONLY */

_MSL_BEGIN_EXTERN_C												/*- mm 020411 -*/

_MSL_IMP_EXP_C extern struct __locale _current_locale;			/*- mm 011205 -*/

_MSL_END_EXTERN_C												/*- mm 020411 -*/

/*- end mm 011130 insert -*/

#pragma warn_padding reset
#pragma options align=reset

#endif /* _MSL_LOCALE_API_H */

/* Change record: 
 * JWW 020306 Split off the locale implementation section from the main locale header
 * JWW 020308 Startup in the "C" locale by default
 * JWW 020312 Mark _current_locale as _MSL_IMP_EXP_C
 * mm  020411 Added _MSL_BEGIN_EXTERN _MSL_END_EXTERN wrappers round _current_locale
 * cc  020521 Added const keyword for platforms with limited RAM space
 * mm  020606 Further locale implementation changes
 * mm  020617 Deleted IsDaylightSaving from _loc_time_cmpt structure
 * mm  020718 Added structure change for collate
 * cc  021002 Added support for _MSL_C_LOCALE_ONLY
 * cc  021022 Added decode_mb and encode_wc in _loc_ctype_cmpt to the __locale struct 
 *            under _MSL_C_LOCALE_ONLY
 * cc  030114 Fixed empty struct under DSP
 * cc  030131 Added coll_cmpt_ptr to __locale and a subset of _loc_coll_cmpt when 
 *			  _MSL_C_LOCALE_ONLY is on 
 * JWW 030224 Changed __NO_WIDE_CHAR flag into the new more configurable _MSL_WIDE_CHAR
 */