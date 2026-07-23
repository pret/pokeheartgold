/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 17:03:04 $
 * $Revision: 1.9.2.2 $
 */

#ifndef	_MSL_UNISTD_H
#define	_MSL_UNISTD_H

#include <ansi_parms.h>
#include <size_t.h>

	/* macros for whence parameter of lseek() (taken from <stdio.h> */
	#define SEEK_SET	0
	#define SEEK_CUR	1
	#define SEEK_END	2

_MSL_BEGIN_EXTERN_C

	/* The following are symbolic constants for access() */		/*- mm 991216 -*/
	/* See Posix 2.9.1 */ 										/*- mm 991216 -*/
	#define F_OK	0		/* Test for existence of file */	/*- mm 991216 -*/
	#define W_OK	2		/* Test for write permission  */	/*- mm 991216 -*/
	#define R_OK	4		/* Test for read permission   */	/*- mm 991216 -*/
	#define X_OK	1		/* Test for execute permission*/	/*- mm 010626 -*/

	#if	(__dest_os	== __win32_os || __dest_os == __mac_os)
		_MSL_IMP_EXP_C int _MSL_CDECL   		access(const char*, int) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C int _MSL_CDECL  			chdir(const char*) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C int _MSL_CDECL  			close(int) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C char* _MSL_CDECL       	cuserid(char* ) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C int _MSL_CDECL        	exec(const char*,...) _MSL_CANT_THROW;
	
		_MSL_IMP_EXP_C char* _MSL_CDECL 		getcwd(char *, int) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C char* _MSL_CDECL        	getlogin(void) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C int _MSL_CDECL 			isatty(int) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C long _MSL_CDECL			lseek(int, long, int) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C int _MSL_CDECL   		read(int , void*, __std(size_t)) _MSL_CANT_THROW;			/*- mm 000607 -*/
		_MSL_IMP_EXP_C int _MSL_CDECL 			rmdir(const char*) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C unsigned int _MSL_CDECL 	sleep(unsigned int) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C char* _MSL_CDECL      	ttyname(int ) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C int _MSL_CDECL   		unlink(const char*) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C int _MSL_CDECL  			write(int , const void*, __std(size_t)) _MSL_CANT_THROW;	/*- mm 000607 -*/
	#endif
	
	#if __dest_os == __mac_os /*- ejs 011120 -*/
	/* 	These stubs only make sense for classic MacOS, 
	 *	which ignores command line arguments and environment variables.
	 *	Feel free to change this and emulate unistd.win32.h for POSIX-capable systems! */
		
		__inline int _MSL_CDECL   execl(const char *_a,...)  _MSL_CANT_THROW {return exec(_a) ;}
		__inline int _MSL_CDECL   execv(const char *_a,...)  _MSL_CANT_THROW {return exec(_a) ;}
		__inline int _MSL_CDECL   execle(const char *_a,...) _MSL_CANT_THROW {return exec(_a) ;}
		__inline int _MSL_CDECL   execve(const char *_a,...) _MSL_CANT_THROW {return exec(_a) ;}
		__inline int _MSL_CDECL   execlp(const char *_a,...) _MSL_CANT_THROW {return exec(_a) ;}
		__inline int _MSL_CDECL   execvp(const char *_a,...) _MSL_CANT_THROW {return exec(_a) ;}
	
	#endif
	
	#if __dest_os != __win32_os	
		__inline  int _MSL_CDECL  getpid(void)  _MSL_CANT_THROW {return 9000;}					
	#endif
	
	__inline int _MSL_CDECL		  getppid(void)  _MSL_CANT_THROW	{return 8000 ;}	
	__inline int _MSL_CDECL    	  getuid(void) 	 _MSL_CANT_THROW	{return 200	 ;}	
	__inline int _MSL_CDECL	      geteuid(void)  _MSL_CANT_THROW	{return 200	 ;}
	__inline int _MSL_CDECL		  getgid(void) 	 _MSL_CANT_THROW	{return 100  ;}
	__inline int _MSL_CDECL	      getegid(void)  _MSL_CANT_THROW	{return 100  ;}
	__inline int _MSL_CDECL		  getpgrp(void)  _MSL_CANT_THROW	{return 9000 ;}

_MSL_END_EXTERN_C

#if (__dest_os	== __win32_os)
	#include <unistd.win32.h>
#endif  

#endif /* _MSL_UNISTD_H */

/* Change record:
 * mm  960927 Inserted setting of __dest_os to __mac_os when not otherwise set.
 * mf  980428 included ansi_parms.h and use #error instead of mac_os by default
 * vss 990115 removed powerTV
 * cc  000320 moved common functions here from unistd.win.h and unistd.mac.h
 * cc  000502 dest_os _getpid()
 * mm  000607 Changed definitions of read and write to accord with POSIX Standard.
 * JWW 000727 Uninlined various routines when compiling for 68K MPW
 * cc  000809 added execl and other defines to mac only.  It is too late to add to win 
 *			  will fix after pro6
 * cc  000828 made execl and others common. 
 * JWW 001208 Added case for targeting Mach-O
 * mm  010119 Completed change of mm 000607 for write and for access
 * cc  010405 removed pragma options align native and reset	 
 * cc  010409 updated defines to JWW new namespace macros
 * cc  010427 Changed exec #defines to inlines
 * JWW 010510 Removed special case for Mach-O - the cname/name.h header split is a better fix
 * cc  010517 Fixes getfamily to have void in param and removed cast to int
 * cc  010517 Removed __BUILDING_MPW__ if else
 * cc  010622 Removed ifndef __stdio__ 
 * mm  010626 Changed the value of X_OK to make it distinct from the others---WB1-23773
 * ejs 011120 Fixed exec??? variants, added spawn??? and cwait
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * cc  021029 Added __dest_os check for mac and win
 */