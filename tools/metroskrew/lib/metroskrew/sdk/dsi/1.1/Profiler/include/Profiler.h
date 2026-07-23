/*
	Profiler.h
	
	The main entry points for the Profiler.
	
	Copyright © 1996-2003 Metrowerks Corporation.  All rights reserved.
 */

#ifndef __PROFILER__
#define __PROFILER__

typedef enum { collectDetailed, collectSummary } ProfilerCollectionMethod;
typedef enum { bestTimeBase = 4 } ProfilerTimeBase;

#ifdef __cplusplus
	extern "C" {
#endif

#if PRAGMA_IMPORT_SUPPORTED
	#pragma import on
#endif

/*
  The following call turns on the trace collector and sets the buffer size.
 */
long TraceInit(long traceBufferSize);

/*
  Turn off the trace collector.  This releases the memory holding
  the trace buffer.
 */
long TraceTerm();

/*
  Clear out the trace buffer.  This does not stop the recording of new information.
 */
long TraceClear();

/*
  Turn on and off collecting trace info.
 */
long TraceSetStatus(long enabled);

/*
  The following call turns on the Profiler and starts the underlying timebase.
 */
long ProfilerInit(short /*ProfilerCollectionMethod*/ method, short /*ProfilerTimeBase*/ timeBase, long numFunctions, short stackDepth);

/*
  Turn off the profiler and stop the timebase.  This releases the memory holding
  the recorded data.
 */
void ProfilerTerm(void);

/*
  Turn on and off the profiler.  This pauses the timebase, and the recording of data.
 */
void ProfilerSetStatus(short on);
short ProfilerGetStatus(void);

/*
  Return the data buffer sizes that the profiler has currently used.  This is useful
  for tuning the buffer sizes passed to ProfilerInit.
 */
void ProfilerGetDataSizes(long *functionSize, long *stackSize);

/*
  Dump the current buffer of profile information to the given file.  If it exists, append
  and increment a number to the filename.  This does not clear the profile information.
  The filename should be a Pascal string.
 */
long ProfilerDump(char* filename);

void CWProfileDataReady();

/*
  Clear out the profile buffer.  This does not stop the recording of new information.
 */
void ProfilerClear(void);

#if PRAGMA_IMPORT_SUPPORTED
	#pragma import off
#endif

#ifdef __cplusplus
	}
#endif

#endif