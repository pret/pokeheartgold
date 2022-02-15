#ifndef NITRO_FS_FILE_H_
#define NITRO_FS_FILE_H_

#include <nitro/fs/archive.h>

#define FS_FILE_STATUS_BUSY      0x00000001
#define FS_FILE_STATUS_CANCEL    0x00000002
#define FS_FILE_STATUS_SYNC      0x00000004
#define FS_FILE_STATUS_ASYNC     0x00000008
#define FS_FILE_STATUS_IS_FILE   0x00000010
#define FS_FILE_STATUS_IS_DIR    0x00000020
#define FS_FILE_STATUS_OPERATING 0x00000040

#define FS_FILE_NAME_MAX 127

typedef enum FSSeekFileMode
{
    FS_SEEK_SET = 0,
    FS_SEEK_CUR,
    FS_SEEK_END
} FSSeekFileMode;

struct FSFile;

#define FS_DMA_NOT_USE ((u32)~0)

typedef struct FSDirPos
{
    struct FSArchive *arc;
    u16 own_id;
    u16 index;
    u32 pos;
}
FSDirPos; // size = 0xC

typedef struct FSFileID
{
    struct FSArchive *arc;
    u32 file_id;
}
FSFileID;

typedef struct
{
    union
    {
        FSFileID file_id;
        FSDirPos dir_id;
    };
    u32 is_directory;
    u32 name_len;
    char name[128];
}
FSDirEntry;


typedef struct
{
    FSDirPos pos;
}
FSSeekDirInfo;


typedef struct
{
    FSDirEntry *p_entry;
    BOOL skip_string;
}
FSReadDirInfo;


typedef struct
{
    FSDirPos pos;
    const char *path;
    BOOL find_directory;
    union
    {
        FSFileID *file;
        FSDirPos *dir;
    }
    result;
}
FSFindPathInfo;


typedef struct
{
    u8 *buf;
    u32 buf_len;
    u16 total_len;
    u16 dir_id;
}
FSGetPathInfo;


typedef struct
{
    FSFileID id;
}
FSOpenFileFastInfo;


typedef struct
{
    u32 top;
    u32 bottom;
    u32 index;
}
FSOpenFileDirectInfo;


typedef struct
{
    u32 reserved;
}
FSCloseFileInfo;


typedef struct
{
    void *dst;
    u32 len_org;
    u32 len;
}
FSReadFileInfo;


typedef struct
{
    const void *src;
    u32 len_org;
    u32 len;
}
FSWriteFileInfo;

typedef struct FSFile
{
    FSFileLink link;                         // 0x00
    struct FSArchive *arc;                   // 0x08
    u32 stat;                                // 0xC
    FSCommandType command;                   // 0x10
    FSResult error;                          // 0x14
    OSThreadQueue queue[1];                  // 0x18
    union {
        struct
        {
            u32 own_id;                      // 0x20
            u32 top;                         // 0x24
            u32 bottom;                      // 0x28
            u32 pos;                         // 0x2C
        } file;
        struct
        {
            FSDirPos pos;                    // 0x20
            u32 parent;                      // 0x2C
        } dir;
    } prop;                                  // 0x20

    union {
        FSReadFileInfo readfile;             // 0x30
        FSWriteFileInfo writefile;           // 0x30

        FSSeekDirInfo seekdir;               // 0x30
        FSReadDirInfo readdir;               // 0x30
        FSFindPathInfo findpath;             // 0x30
        FSGetPathInfo getpath;               // 0x30
        FSOpenFileFastInfo openfilefast;     // 0x30
        FSOpenFileDirectInfo openfiledirect; // 0x30
        FSCloseFileInfo closefile;           // 0x30
    } arg;                                   // 0x30
}
FSFile; // size = 0x50

void FS_Init(u32 default_dma_no);
BOOL FS_IsAvailable(void);
void FS_InitFile(FSFile * p_file);
int FSi_ReadFileCore(FSFile * p_file, void * dst, s32 len, BOOL async);
BOOL FS_ConvertPathToFileID(FSFileID * p_file_id, const char * path);
BOOL FS_OpenFileDirect(FSFile * p_file, FSArchive * p_arc, u32 image_top, u32 image_bottom, u32 file_index);
BOOL FS_OpenFileFast(FSFile * p_file, FSFileID file_id);
BOOL FS_OpenFile(FSFile * p_file, const char * path);
BOOL FS_CloseFile(FSFile * p_file);
BOOL FS_WaitAsync(FSFile * p_file);
int FS_ReadFileAsync(FSFile * p_file, void * dst, s32 len);
int FS_ReadFile(FSFile * p_file, void * dst, s32 len);
BOOL FS_SeekFile(FSFile * p_file, s32 offset, FSSeekFileMode origin);
BOOL FS_ChangeDir(const char * path);
u32 FS_SetDefaultDMA(u32 dma_no);

static inline u32 const FS_GetFileImageTop(volatile const FSFile * p_file) {
    return p_file->prop.file.top;
}

static inline u32 const FS_GetLength(volatile const FSFile * p_file)
{
    return p_file->prop.file.bottom - p_file->prop.file.top;
}

static inline BOOL FS_IsCanceling(volatile const FSFile * p_file)
{
    return (p_file->stat & FS_FILE_STATUS_CANCEL) ? TRUE : FALSE;
}

static inline BOOL FS_IsFileSyncMode(volatile const FSFile * p_file)
{
    return (p_file->stat & FS_FILE_STATUS_SYNC) ? TRUE : FALSE;
}

static inline BOOL FS_IsBusy(volatile const FSFile * p_file)
{
    return p_file->stat & FS_FILE_STATUS_BUSY ? TRUE : FALSE;
}

static inline BOOL FS_IsSucceeded(volatile const FSFile * p_file)
{
    return (p_file->error == FS_RESULT_SUCCESS) ? TRUE : FALSE;
}

static inline BOOL FS_IsDir(volatile const FSFile * p_file)
{
    return (p_file->stat & FS_FILE_STATUS_IS_DIR) ? TRUE : FALSE;
}

u32 FS_TryLoadTable(void *p_mem, u32 maxsize);

#endif //NITRO_FS_FILE_H_
