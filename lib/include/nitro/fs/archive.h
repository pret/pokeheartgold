#ifndef NITRO_FS_ARCHIVE_H_
#define NITRO_FS_ARCHIVE_H_

#include <nitro/os/thread.h>

struct FSFile;
struct FSArchive;

#define FS_ARCHIVE_NAME_LEN_MAX 3

#define    FS_ARCHIVE_FLAG_REGISTER    0x00000001
#define    FS_ARCHIVE_FLAG_LOADED        0x00000002
#define    FS_ARCHIVE_FLAG_TABLE_LOAD    0x00000004
#define    FS_ARCHIVE_FLAG_SUSPEND        0x00000008
#define    FS_ARCHIVE_FLAG_RUNNING        0x00000010
#define    FS_ARCHIVE_FLAG_CANCELING    0x00000020
#define    FS_ARCHIVE_FLAG_SUSPENDING    0x00000040
#define    FS_ARCHIVE_FLAG_UNLOADING    0x00000080
#define    FS_ARCHIVE_FLAG_IS_ASYNC    0x00000100
#define    FS_ARCHIVE_FLAG_IS_SYNC        0x00000200

typedef enum {
    FS_COMMAND_ASYNC_BEGIN = 0,
    FS_COMMAND_READFILE = FS_COMMAND_ASYNC_BEGIN,
    FS_COMMAND_WRITEFILE,
    FS_COMMAND_ASYNC_END,

    FS_COMMAND_SYNC_BEGIN = FS_COMMAND_ASYNC_END,
    FS_COMMAND_SEEKDIR = FS_COMMAND_SYNC_BEGIN,
    FS_COMMAND_READDIR,
    FS_COMMAND_FINDPATH,
    FS_COMMAND_GETPATH,
    FS_COMMAND_OPENFILEFAST,
    FS_COMMAND_OPENFILEDIRECT,
    FS_COMMAND_CLOSEFILE,
    FS_COMMAND_SYNC_END,

    FS_COMMAND_STATUS_BEGIN = FS_COMMAND_SYNC_END,
    FS_COMMAND_ACTIVATE = FS_COMMAND_STATUS_BEGIN,
    FS_COMMAND_IDLE,
    FS_COMMAND_SUSPEND,
    FS_COMMAND_RESUME,
    FS_COMMAND_STATUS_END,

    FS_COMMAND_INVALID
} FSCommandType;

/* Asynchronous commands*/
#define    FS_ARCHIVE_PROC_READFILE        (1 << FS_COMMAND_READFILE)
#define    FS_ARCHIVE_PROC_WRITEFILE        (1 << FS_COMMAND_WRITEFILE)
/* All asynchronous commands*/
#define    FS_ARCHIVE_PROC_ASYNC    \
    (FS_ARCHIVE_PROC_READFILE | FS_ARCHIVE_PROC_WRITEFILE)

/* Synchronous commands*/
#define    FS_ARCHIVE_PROC_SEEKDIR            (1 << FS_COMMAND_SEEKDIR)
#define    FS_ARCHIVE_PROC_READDIR            (1 << FS_COMMAND_READDIR)
#define    FS_ARCHIVE_PROC_FINDPATH        (1 << FS_COMMAND_FINDPATH)
#define    FS_ARCHIVE_PROC_GETPATH            (1 << FS_COMMAND_GETPATH)
#define    FS_ARCHIVE_PROC_OPENFILEFAST    (1 << FS_COMMAND_OPENFILEFAST)
#define    FS_ARCHIVE_PROC_OPENFILEDIRECT    (1 << FS_COMMAND_OPENFILEDIRECT)
#define    FS_ARCHIVE_PROC_CLOSEFILE        (1 << FS_COMMAND_CLOSEFILE)
/* All synchronous commands*/
#define    FS_ARCHIVE_PROC_SYNC    \
    (FS_ARCHIVE_PROC_SEEKDIR | FS_ARCHIVE_PROC_READDIR |    \
     FS_ARCHIVE_PROC_FINDPATH | FS_ARCHIVE_PROC_GETPATH |    \
    FS_ARCHIVE_PROC_OPENFILEFAST | FS_ARCHIVE_PROC_OPENFILEDIRECT | FS_ARCHIVE_PROC_CLOSEFILE)

/* Messages when status changes*/
#define    FS_ARCHIVE_PROC_ACTIVATE        (1 << FS_COMMAND_ACTIVATE)
#define    FS_ARCHIVE_PROC_IDLE            (1 << FS_COMMAND_IDLE)
#define    FS_ARCHIVE_PROC_SUSPENDING        (1 << FS_COMMAND_SUSPEND)
#define    FS_ARCHIVE_PROC_RESUME            (1 << FS_COMMAND_RESUME)
/* All messages when status changes*/
#define    FS_ARCHIVE_PROC_STATUS    \
    (FS_ARCHIVE_PROC_ACTIVATE | FS_ARCHIVE_PROC_IDLE |    \
     FS_ARCHIVE_PROC_SUSPENDING | FS_ARCHIVE_PROC_RESUME)

#define    FS_ARCHIVE_PROC_ALL    (~0)

typedef enum {
    FS_RESULT_SUCCESS = 0,
    FS_RESULT_FAILURE,
    FS_RESULT_BUSY,
    FS_RESULT_CANCELED,
    FS_RESULT_CANCELLED = FS_RESULT_CANCELED, // SDK alias
    FS_RESULT_UNSUPPORTED,
    FS_RESULT_ERROR,
    FS_RESULT_PROC_ASYNC,
    FS_RESULT_PROC_DEFAULT,
    FS_RESULT_PROC_UNKNOWN
}
FSResult;

typedef FSResult (*FS_ARCHIVE_READ_FUNC) (struct FSArchive *p, void *dst, u32 pos, u32 size);
typedef FSResult (*FS_ARCHIVE_WRITE_FUNC) (struct FSArchive *p, const void *src, u32 pos, u32 size);
typedef FSResult (*FS_ARCHIVE_PROC_FUNC) (struct FSFile *, FSCommandType);

typedef struct
{
    struct FSFile * prev;
    struct FSFile * next;
}
FSFileLink;

typedef struct
{
    u32 start;
    u16 index;
    u16 parent;
} FSArchiveFNT;

typedef struct
{
    u32 top;
    u32 bottom;
} FSArchiveFAT;

typedef struct FSArchive
{
    union
    {
        char ptr[4];
        u32 pack;
    } name;
    struct FSArchive * next;
    struct FSArchive * prev;
    OSThreadQueue sync_q;
    OSThreadQueue stat_q;
    u32 flag;
    FSFileLink list;
    u32 base;
    u32 fat;
    u32 fat_size;
    u32 fnt;
    u32 fnt_size;
    u32 fat_bak;
    u32 fnt_bak;
    void * load_mem;
    FS_ARCHIVE_READ_FUNC read_func;
    FS_ARCHIVE_WRITE_FUNC write_func;
    FS_ARCHIVE_READ_FUNC table_func;
    FS_ARCHIVE_PROC_FUNC proc;
    u32 proc_flag;
} FSArchive;

static inline BOOL FS_IsArchiveLoaded(volatile const FSArchive * p_arc)
{
    return (p_arc->flag & FS_ARCHIVE_FLAG_LOADED) ? TRUE : FALSE;
}

static inline u32 FS_GetArchiveOffset(const FSArchive * p_arc, u32 pos)
{
    return p_arc->base + pos;
}

static inline BOOL FSi_IsArchiveCanceling(volatile const FSArchive * p_arc)
{
    return (p_arc->flag & FS_ARCHIVE_FLAG_CANCELING) != 0;
}

static inline BOOL FS_IsArchiveSuspended(volatile const FSArchive * p_arc)
{
    return (p_arc->flag & FS_ARCHIVE_FLAG_SUSPEND) ? TRUE : FALSE;
}

static inline BOOL FSi_IsArchiveSuspending(volatile const FSArchive * p_arc)
{
    return (p_arc->flag & FS_ARCHIVE_FLAG_SUSPENDING) != 0;
}

static inline BOOL FSi_IsArchiveRunning(volatile const FSArchive * p_arc)
{
    return (p_arc->flag & FS_ARCHIVE_FLAG_RUNNING) != 0;
}

static inline BOOL FSi_IsArchiveUnloading(volatile const FSArchive * p_arc)
{
    return (p_arc->flag & FS_ARCHIVE_FLAG_UNLOADING) != 0;
}

static inline BOOL FSi_IsArchiveAsync(volatile const FSArchive * p_arc)
{
    return (p_arc->flag & FS_ARCHIVE_FLAG_IS_ASYNC) != 0;
}

static inline BOOL FSi_IsArchiveSync(volatile const FSArchive * p_arc)
{
    return (p_arc->flag & FS_ARCHIVE_FLAG_IS_SYNC) != 0;
}

static inline BOOL FS_IsArchiveTableLoaded(volatile const FSArchive * p_arc)
{
    return (p_arc->flag & FS_ARCHIVE_FLAG_TABLE_LOAD) ? TRUE : FALSE;
}

u32 FSi_GetPackedName(const char * name, int name_len);
FSResult FSi_ReadMemCallback(struct FSArchive * p_arc, void * dest, u32 pos, u32 size);
FSResult FSi_WriteMemCallback(struct FSArchive * p_arc, const void * src, u32 pos, u32 size);
FSResult FSi_ReadMemoryCore(struct FSArchive * p_arc, void * dest, u32 pos, u32 size);
struct FSFile * FSi_NextCommand(struct FSArchive * p_arc);
void FSi_ExecuteAsyncCommand(struct FSFile * p_file);
BOOL FSi_ExecuteSyncCommand(struct FSFile * file);
BOOL FSi_SendCommand(struct FSFile * file, FSCommandType command);
void FS_InitArchive(struct FSArchive * p_arc);
struct FSArchive * const FS_FindArchive(const char * path, int offset);
BOOL FS_RegisterArchiveName(struct FSArchive * p_arc, const char * name, int name_len);
void FS_ReleaseArchiveName(struct FSArchive * p_arc);
BOOL FS_LoadArchive(struct FSArchive * p_arc, u32 base, u32 fat, u32 fat_size, u32 fnt, u32 fnt_size, FS_ARCHIVE_READ_FUNC read_func, FS_ARCHIVE_WRITE_FUNC write_func);
BOOL FS_UnloadArchive(struct FSArchive * p_arc);
u32 FS_LoadArchiveTables(struct FSArchive *p_arc, void *p_mem, u32 max_size);
void * FS_UnloadArchiveTables(struct FSArchive * p_arc);
BOOL FS_SuspendArchive(struct FSArchive * p_arc);
BOOL FS_ResumeArchive(struct FSArchive * p_arc);
void FS_SetArchiveProc(struct FSArchive * p_arc, FS_ARCHIVE_PROC_FUNC proc, u32 flags);
void FS_NotifyArchiveAsyncEnd(struct FSArchive *p_arc, FSResult ret);

#endif //NITRO_FS_ARCHIVE_H_
