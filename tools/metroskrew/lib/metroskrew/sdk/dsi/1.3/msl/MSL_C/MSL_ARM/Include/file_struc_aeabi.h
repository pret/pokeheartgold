/* MSL
 * Copyright © 1995-2007 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2007/01/29 18:12:49 $
 * $Revision: 1.2 $
 */

/* This header file contains the definitions connected with file structures
 * to separate their definition from the stdio prototypes
 */

#ifndef _MSL_FILE_STRUC_AEABI_H
#define _MSL_FILE_STRUC_AEABI_H

extern const int __aeabi_IONBF;
#define _IONBF 2

extern const int __aeabi_IOLBF;
#define _IOLBF 1

extern const int __aeabi_IOFBF;
#define _IOFBF 0

extern const int __aeabi_BUFSIZ;
#define _MSL_BUFSIZ __aeabi_BUFSIZ

extern const int __aeabi_FOPEN_MAX;
#ifdef FOPEN_MAX
#undef FOPEN_MAX
#endif	
#define FOPEN_MAX	__aeabi_FOPEN_MAX

extern const int __aeabi_TMP_MAX;
#define TMP_MAX	__aeabi_TMP_MAX

extern const int __aeabi_FILENAME_MAX;
#define FILENAME_MAX	__aeabi_FILENAME_MAX

extern const int __aeabi_L_tmpnam;
#define L_tmpnam __aeabi_L_tmpnam

extern FILE * __aeabi_stdin;
#define	stdin __aeabi_stdin

extern FILE * __aeabi_stdout;
#define	stdout __aeabi_stdout

extern FILE * __aeabi_stderr;
#define	stderr __aeabi_stderr


#endif /* _MSL_FILE_STRUC_AEABI_H */

/* Change record:
 * cc  060428 Integrated _AEABI_PORTABILITY_LEVEL work 
 */
 
/*Chipwerks Change Record
 *
 *6/4/2006 Refer Section 5.17.3 from "C Library ABI for the ARM architecture.pdf"
 *__aeabi_IOFBF,__aeabi_IOLBF,__aeabi_IONBF,__aeabi_BUFSIZ,__aeabi_FOPEN_MAX,
 *__aeabi_TMP_MAX,__aeabi_FILENAME_MAX,__aeabi_L_tmpnam,__aeabi_stdin,__aeabi_stdout,
 * __aeabi_stderr are declared for _AEABI_PORTABILITY_LEVEL macro
 */