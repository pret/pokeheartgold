#define _IN_FILESYSTEM_C // Place sNarcFileList here when filesystem.h is included

#include "global.h"
#include "filesystem.h"

THUMB_FUNC void ReadFromNarcMemberByPathAndId(void * dest, const char * path, s32 file_idx, u32 offset, u32 size)
{
    FSFile file;
    register u32 chunk_starts[3];
    u32 btnf_size = 0;
    u32 chunk_size = 0;
    u32 file_start = 0;
    u32 file_end = 0;
    u16 num_files = 0;

    FS_InitFile(&file);
    FS_OpenFile(&file, path);

    FS_SeekFile(&file, 12, FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 2);
    chunk_starts[0] = chunk_size;
    FS_SeekFile(&file, (s32)(chunk_starts[0] + 4), FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 4);
    FS_ReadFile(&file, &num_files, 2);
    GF_ASSERT(num_files > file_idx);
    chunk_starts[1] = chunk_starts[0] + chunk_size;
    FS_SeekFile(&file, (s32)(chunk_starts[1] + 4), FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 4);
    btnf_size = chunk_size;
    FS_SeekFile(&file, (s32)(chunk_starts[0] + 12 + 8 * file_idx), FS_SEEK_SET);
    FS_ReadFile(&file, &file_start, 4);
    FS_ReadFile(&file, &file_end, 4);
    chunk_starts[2] = chunk_starts[1] + btnf_size;
    FS_SeekFile(&file, (s32)(chunk_starts[2] + 8 + file_start + offset), FS_SEEK_SET);
    if (size == 0)
        chunk_size = file_end - file_start;
    else
        chunk_size = size;
    GF_ASSERT(chunk_size != 0);
    FS_ReadFile(&file, dest, (s32)chunk_size);
    FS_CloseFile(&file);
}

THUMB_FUNC void * AllocAndReadFromNarcMemberByPathAndId(const char * path, s32 file_idx, u32 heap_id, u32 offset, u32 size, BOOL r4)
{
    FSFile file;
    register u32 chunk_starts[3];
    u32 btnf_size = 0;
    u32 chunk_size = 0;
    u32 file_start = 0;
    u32 file_end = 0;
    u16 num_files = 0;
    void * dest = NULL;

    FS_InitFile(&file);
    FS_OpenFile(&file, path);

    FS_SeekFile(&file, 12, FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 2);
    chunk_starts[0] = chunk_size;
    FS_SeekFile(&file, (s32)(chunk_starts[0] + 4), FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 4);
    FS_ReadFile(&file, &num_files, 2);
    GF_ASSERT(num_files > file_idx);
    chunk_starts[1] = chunk_starts[0] + chunk_size;
    FS_SeekFile(&file, (s32)(chunk_starts[1] + 4), FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 4);
    btnf_size = chunk_size;
    FS_SeekFile(&file, (s32)(chunk_starts[0] + 12 + 8 * file_idx), FS_SEEK_SET);
    FS_ReadFile(&file, &file_start, 4);
    FS_ReadFile(&file, &file_end, 4);
    chunk_starts[2] = chunk_starts[1] + btnf_size;
    FS_SeekFile(&file, (s32)(chunk_starts[2] + 8 + file_start + offset), FS_SEEK_SET);
    if (size == 0)
        chunk_size = file_end - file_start;
    else
        chunk_size = size;
    GF_ASSERT(chunk_size != 0);
    switch (r4)
    {
    case 0:
        dest = AllocFromHeap(heap_id, chunk_size);
        break;
        default:
            dest = AllocFromHeapAtEnd(heap_id, chunk_size);
            break;
    }
    FS_ReadFile(&file, dest, (s32)chunk_size);
    FS_CloseFile(&file);
    return dest;
}

THUMB_FUNC void ReadWholeNarcMemberByIdPair(void * dest, NarcId narc_id, s32 file_id)
{
    ReadFromNarcMemberByPathAndId(dest, sNarcFileList[narc_id], file_id, 0, 0);
}

THUMB_FUNC void * AllocAndReadWholeNarcMemberByIdPair(NarcId narc_id, s32 file_id, u32 heap_id)
{
    return AllocAndReadFromNarcMemberByPathAndId(sNarcFileList[narc_id], file_id, heap_id, 0, 0, FALSE);
}

THUMB_FUNC void * AllocAtEndAndReadWholeNarcMemberByIdPair(NarcId narc_id, s32 file_id, u32 heap_id)
{
    return AllocAndReadFromNarcMemberByPathAndId(sNarcFileList[narc_id], file_id, heap_id, 0, 0, TRUE);
}

THUMB_FUNC void ReadFromNarcMemberByIdPair(void * dest, NarcId narc_id, s32 file_id, u32 offset, u32 size)
{
    ReadFromNarcMemberByPathAndId(dest, sNarcFileList[narc_id], file_id, offset, size);
}

THUMB_FUNC void * AllocAndReadFromNarcMemberByIdPair(NarcId narc_id, s32 file_id, u32 heap_id, u32 offset, u32 size)
{
    return AllocAndReadFromNarcMemberByPathAndId(sNarcFileList[narc_id], file_id, heap_id, offset, size, FALSE);
}

THUMB_FUNC void * AllocAtEndAndReadFromNarcMemberByIdPair(NarcId narc_id, s32 file_id, u32 heap_id, u32 offset, u32 size)
{
    return AllocAndReadFromNarcMemberByPathAndId(sNarcFileList[narc_id], file_id, heap_id, offset, size, TRUE);
}

THUMB_FUNC u32 GetNarcMemberSizeByIdPair(NarcId narc_id, s32 file_idx)
{
    FSFile file;
    register u32 chunk_starts[3];
    u32 btnf_size = 0;
    u32 chunk_size = 0;
    u32 file_start = 0;
    u32 file_end = 0;
    u16 num_files = 0;

    FS_InitFile(&file);
    FS_OpenFile(&file, sNarcFileList[narc_id]);

    FS_SeekFile(&file, 12, FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 2);
    chunk_starts[0] = chunk_size;
    FS_SeekFile(&file, (s32)(chunk_starts[0] + 4), FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 4);
    FS_ReadFile(&file, &num_files, 2);
    GF_ASSERT(num_files > file_idx);
    chunk_starts[1] = chunk_starts[0] + chunk_size;
    FS_SeekFile(&file, (s32)(chunk_starts[1] + 4), FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 4);
    btnf_size = chunk_size;
    FS_SeekFile(&file, (s32)(chunk_starts[0] + 12 + 8 * file_idx), FS_SEEK_SET);
    FS_ReadFile(&file, &file_start, 4);
    FS_ReadFile(&file, &file_end, 4);
    chunk_starts[2] = chunk_starts[1] + btnf_size;
    FS_SeekFile(&file, (s32)(chunk_starts[2] + 8 + file_start + 0), FS_SEEK_SET);
    chunk_size = file_end - file_start;
    GF_ASSERT(chunk_size != 0);
    // Bug: File is never closed
    return chunk_size;
}

THUMB_FUNC NARC * NARC_ctor(NarcId narc_id, u32 heap_id)
{
    NARC * narc = (NARC *)AllocFromHeap(heap_id, sizeof(NARC));
    u32 btnf_start;
    u32 chunk_size;
    if (narc != NULL)
    {
        narc->btaf_start = 0;
        FS_InitFile(&narc->file);
        FS_OpenFile(&narc->file, sNarcFileList[narc_id]);
        FS_SeekFile(&narc->file, 12, FS_SEEK_SET);
        FS_ReadFile(&narc->file, &narc->btaf_start, 2);
        FS_SeekFile(&narc->file, (s32)(narc->btaf_start + 4), FS_SEEK_SET);
        FS_ReadFile(&narc->file, &chunk_size, 4);
        FS_ReadFile(&narc->file, &narc->num_files, 2);
        btnf_start = narc->btaf_start + chunk_size;
        FS_SeekFile(&narc->file, (s32)(btnf_start + 4), FS_SEEK_SET);
        FS_ReadFile(&narc->file, &chunk_size, 4);
        narc->gmif_start = btnf_start + chunk_size;
    }
    return narc;
}

THUMB_FUNC void NARC_dtor(NARC * narc)
{
    FS_CloseFile(&narc->file);
    FreeToHeap(narc); // free to heap
}

THUMB_FUNC void * NARC_AllocAndReadWholeMember(NARC * narc, u32 file_id, u32 heap_id)
{
    u32 file_start;
    u32 file_end;
    void * dest;
    GF_ASSERT(narc->num_files > file_id);
    FS_SeekFile(&narc->file, (s32)(narc->btaf_start + 12 + 8 * file_id), FS_SEEK_SET);
    FS_ReadFile(&narc->file, &file_start, 4);
    FS_ReadFile(&narc->file, &file_end, 4);
    FS_SeekFile(&narc->file, (s32)(narc->gmif_start + 8 + file_start), FS_SEEK_SET);
    dest = AllocFromHeap(heap_id, file_end - file_start);
    if (dest != NULL)
    {
        FS_ReadFile(&narc->file, dest, (s32)(file_end - file_start));
    }
    return dest;
}

THUMB_FUNC void NARC_ReadWholeMember(NARC * narc, u32 file_id, void * dest)
{
    u32 file_start;
    u32 file_end;
    GF_ASSERT(narc->num_files > file_id);
    FS_SeekFile(&narc->file, (s32)(narc->btaf_start + 12 + 8 * file_id), FS_SEEK_SET);
    FS_ReadFile(&narc->file, &file_start, 4);
    FS_ReadFile(&narc->file, &file_end, 4);
    FS_SeekFile(&narc->file, (s32)(narc->gmif_start + 8 + file_start), FS_SEEK_SET);
    FS_ReadFile(&narc->file, dest, (s32)(file_end - file_start));
}

THUMB_FUNC u32 NARC_GetMemberSize(NARC * narc, u32 file_id)
{
    u32 file_start;
    u32 file_end;
    GF_ASSERT(narc->num_files > file_id);
    FS_SeekFile(&narc->file, (s32)(narc->btaf_start + 12 + 8 * file_id), FS_SEEK_SET);
    FS_ReadFile(&narc->file, &file_start, 4);
    FS_ReadFile(&narc->file, &file_end, 4);
    return file_end - file_start;
}

THUMB_FUNC void NARC_ReadFromMember(NARC * narc, u32 file_id, u32 pos, u32 size, void * dest)
{
    u32 file_start;
    GF_ASSERT(narc->num_files > file_id);
    FS_SeekFile(&narc->file, (s32)(narc->btaf_start + 12 + 8 * file_id), FS_SEEK_SET);
    FS_ReadFile(&narc->file, &file_start, 4);
    FS_SeekFile(&narc->file, (s32)(narc->gmif_start + 8 + file_start + pos), FS_SEEK_SET);
    FS_ReadFile(&narc->file, dest, (s32)size);
}

THUMB_FUNC void NARC_ReadFromAbsolutePos(NARC * narc, u32 pos, u32 size, void * dest)
{
    FS_SeekFile(&narc->file, pos, FS_SEEK_SET);
    FS_ReadFile(&narc->file, dest, size);
}

THUMB_FUNC void NARC_GetMemberImageStartOffset(NARC * narc, u32 file_id, u32 * ret_p)
{
    u32 file_start;
    GF_ASSERT(narc->num_files > file_id);
    FS_SeekFile(&narc->file, (s32)(narc->btaf_start + 12 + 8 * file_id), FS_SEEK_SET);
    FS_ReadFile(&narc->file, &file_start, 4);
    *ret_p = (u32)(narc->gmif_start + 8 + file_start);
}

THUMB_FUNC void NARC_ReadFile(NARC * narc, u32 size, void * dest)
{
    FS_ReadFile(&narc->file, dest, (s32)size);
}

THUMB_FUNC u16 NARC_GetFileCount(NARC * narc)
{
    return narc->num_files;
}
