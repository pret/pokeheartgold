#define _IN_FILESYSTEM_C // Place sNarcFileList here when filesystem.h is included

#include "global.h"
#include "filesystem.h"

static void ReadFromNarcMemberByPathAndId(void * dest, const char * path, s32 file_idx, u32 offset, u32 size) {
    FSFile file;
    u32 btaf_start = 0;
    u32 btnf_start = 0;
    u32 gmif_start = 0;
    u32 chunk_size = 0;
    u32 file_start = 0;
    u32 file_end = 0;
    u16 num_files = 0;

    FS_InitFile(&file);
    FS_OpenFile(&file, path);

    FS_SeekFile(&file, 12, FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 2);
    btaf_start = chunk_size;
    FS_SeekFile(&file, (s32)(btaf_start + 4), FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 4);
    FS_ReadFile(&file, &num_files, 2);
    GF_ASSERT(num_files > file_idx);
    btnf_start = btaf_start + chunk_size;
    FS_SeekFile(&file, (s32)(btnf_start + 4), FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 4);
    gmif_start = btnf_start + chunk_size;
    FS_SeekFile(&file, (s32)(btaf_start + 12 + 8 * file_idx), FS_SEEK_SET);
    FS_ReadFile(&file, &file_start, 4);
    FS_ReadFile(&file, &file_end, 4);
    FS_SeekFile(&file, (s32)(gmif_start + 8 + file_start + offset), FS_SEEK_SET);
    if (size == 0)
        chunk_size = file_end - file_start;
    else
        chunk_size = size;
    GF_ASSERT(chunk_size != 0);
    FS_ReadFile(&file, dest, (s32)chunk_size);
    FS_CloseFile(&file);
}

static void * AllocAndReadFromNarcMemberByPathAndId(const char * path, s32 file_idx, HeapID heapId, u32 offset, u32 size, BOOL allocMode) {
    FSFile file;
    u32 btaf_start = 0;
    u32 btnf_start = 0;
    u32 gmif_start = 0;
    u32 chunk_size = 0;
    u32 file_start = 0;
    u32 file_end = 0;
    u16 num_files = 0;
    void * dest = NULL;

    FS_InitFile(&file);
    FS_OpenFile(&file, path);

    FS_SeekFile(&file, 12, FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 2);
    btaf_start = chunk_size;
    FS_SeekFile(&file, (s32)(btaf_start + 4), FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 4);
    FS_ReadFile(&file, &num_files, 2);
    GF_ASSERT(num_files > file_idx);
    btnf_start = btaf_start + chunk_size;
    FS_SeekFile(&file, (s32)(btnf_start + 4), FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 4);
    gmif_start = btnf_start + chunk_size;
    FS_SeekFile(&file, (s32)(btaf_start + 12 + 8 * file_idx), FS_SEEK_SET);
    FS_ReadFile(&file, &file_start, 4);
    FS_ReadFile(&file, &file_end, 4);
    FS_SeekFile(&file, (s32)(gmif_start + 8 + file_start + offset), FS_SEEK_SET);
    if (size == 0)
        chunk_size = file_end - file_start;
    else
        chunk_size = size;
    GF_ASSERT(chunk_size != 0);
    switch (allocMode) {
    case 0:
        dest = AllocFromHeap(heapId, chunk_size);
        break;
    default:
        dest = AllocFromHeapAtEnd(heapId, chunk_size);
        break;
    }
    FS_ReadFile(&file, dest, (s32)chunk_size);
    FS_CloseFile(&file);
    return dest;
}

void ReadWholeNarcMemberByIdPair(void * dest, NarcId narc_id, s32 file_id) {
    ReadFromNarcMemberByPathAndId(dest, sNarcFileList[narc_id], file_id, 0, 0);
}

void * AllocAndReadWholeNarcMemberByIdPair(NarcId narc_id, s32 file_id, HeapID heapId) {
    return AllocAndReadFromNarcMemberByPathAndId(sNarcFileList[narc_id], file_id, heapId, 0, 0, FALSE);
}

void * AllocAtEndAndReadWholeNarcMemberByIdPair(NarcId narc_id, s32 file_id, HeapID heapId) {
    return AllocAndReadFromNarcMemberByPathAndId(sNarcFileList[narc_id], file_id, heapId, 0, 0, TRUE);
}

void ReadFromNarcMemberByIdPair(void * dest, NarcId narc_id, s32 file_id, u32 offset, u32 size) {
    ReadFromNarcMemberByPathAndId(dest, sNarcFileList[narc_id], file_id, offset, size);
}

void * AllocAndReadFromNarcMemberByIdPair(NarcId narc_id, s32 file_id, HeapID heapId, u32 offset, u32 size) {
    return AllocAndReadFromNarcMemberByPathAndId(sNarcFileList[narc_id], file_id, heapId, offset, size, FALSE);
}

void * AllocAtEndAndReadFromNarcMemberByIdPair(NarcId narc_id, s32 file_id, HeapID heapId, u32 offset, u32 size) {
    return AllocAndReadFromNarcMemberByPathAndId(sNarcFileList[narc_id], file_id, heapId, offset, size, TRUE);
}

u32 GetNarcMemberSizeByIdPair(NarcId narc_id, s32 file_idx) {
    FSFile file;
    u32 chunk_size = 0;
    u32 btaf_start = 0;
    u32 btnf_start = 0;
    u32 gmif_start = 0;
    u32 file_start = 0;
    u32 file_end = 0;
    u16 num_files = 0;

    FS_InitFile(&file);
    FS_OpenFile(&file, sNarcFileList[narc_id]);

    FS_SeekFile(&file, 12, FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 2);
    btaf_start = chunk_size;
    FS_SeekFile(&file, (s32)(btaf_start + 4), FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 4);
    FS_ReadFile(&file, &num_files, 2);
    GF_ASSERT(num_files > file_idx);
    btnf_start = btaf_start + chunk_size;
    FS_SeekFile(&file, (s32)(btnf_start + 4), FS_SEEK_SET);
    FS_ReadFile(&file, &chunk_size, 4);
    gmif_start = btnf_start + chunk_size;
    FS_SeekFile(&file, (s32)(btaf_start + 12 + 8 * file_idx), FS_SEEK_SET);
    FS_ReadFile(&file, &file_start, 4);
    FS_ReadFile(&file, &file_end, 4);
    FS_SeekFile(&file, (s32)(gmif_start + 8 + file_start + 0), FS_SEEK_SET);
    chunk_size = file_end - file_start;
    GF_ASSERT(chunk_size != 0);
    // Bug: File is never closed
    return chunk_size;
}

NARC * NARC_New(NarcId narc_id, HeapID heapId) {
    NARC * narc = (NARC *)AllocFromHeap(heapId, sizeof(NARC));
    u32 btnf_start;
    u32 chunk_size;
    if (narc != NULL) {
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

void NARC_Delete(NARC * narc) {
    FS_CloseFile(&narc->file);
    FreeToHeap(narc); // free to heap
}

void * NARC_AllocAndReadWholeMember(NARC * narc, u32 file_id, HeapID heapId) {
    u32 file_start;
    u32 file_end;
    void * dest;
    GF_ASSERT(narc->num_files > file_id);
    FS_SeekFile(&narc->file, (s32)(narc->btaf_start + 12 + 8 * file_id), FS_SEEK_SET);
    FS_ReadFile(&narc->file, &file_start, 4);
    FS_ReadFile(&narc->file, &file_end, 4);
    FS_SeekFile(&narc->file, (s32)(narc->gmif_start + 8 + file_start), FS_SEEK_SET);
    dest = AllocFromHeap(heapId, file_end - file_start);
    if (dest != NULL) {
        FS_ReadFile(&narc->file, dest, (s32)(file_end - file_start));
    }
    return dest;
}

void NARC_ReadWholeMember(NARC * narc, u32 file_id, void * dest) {
    u32 file_start;
    u32 file_end;
    GF_ASSERT(narc->num_files > file_id);
    FS_SeekFile(&narc->file, (s32)(narc->btaf_start + 12 + 8 * file_id), FS_SEEK_SET);
    FS_ReadFile(&narc->file, &file_start, 4);
    FS_ReadFile(&narc->file, &file_end, 4);
    FS_SeekFile(&narc->file, (s32)(narc->gmif_start + 8 + file_start), FS_SEEK_SET);
    FS_ReadFile(&narc->file, dest, (s32)(file_end - file_start));
}

u32 NARC_GetMemberSize(NARC * narc, u32 file_id) {
    u32 file_start;
    u32 file_end;
    GF_ASSERT(narc->num_files > file_id);
    FS_SeekFile(&narc->file, (s32)(narc->btaf_start + 12 + 8 * file_id), FS_SEEK_SET);
    FS_ReadFile(&narc->file, &file_start, 4);
    FS_ReadFile(&narc->file, &file_end, 4);
    return file_end - file_start;
}

void NARC_ReadFromMember(NARC * narc, u32 file_id, u32 pos, u32 size, void * dest) {
    u32 file_start;
    GF_ASSERT(narc->num_files > file_id);
    FS_SeekFile(&narc->file, (s32)(narc->btaf_start + 12 + 8 * file_id), FS_SEEK_SET);
    FS_ReadFile(&narc->file, &file_start, 4);
    FS_SeekFile(&narc->file, (s32)(narc->gmif_start + 8 + file_start + pos), FS_SEEK_SET);
    FS_ReadFile(&narc->file, dest, (s32)size);
}

void NARC_ReadFromAbsolutePos(NARC * narc, u32 pos, u32 size, void * dest) {
    FS_SeekFile(&narc->file, pos, FS_SEEK_SET);
    FS_ReadFile(&narc->file, dest, size);
}

void NARC_GetMemberImageStartOffset(NARC * narc, u32 file_id, u32 * ret_p) {
    u32 file_start;
    GF_ASSERT(narc->num_files > file_id);
    FS_SeekFile(&narc->file, (s32)(narc->btaf_start + 12 + 8 * file_id), FS_SEEK_SET);
    FS_ReadFile(&narc->file, &file_start, 4);
    *ret_p = (u32)(narc->gmif_start + 8 + file_start);
}

void NARC_ReadFile(NARC * narc, u32 size, void * dest) {
    FS_ReadFile(&narc->file, dest, (s32)size);
}

u16 NARC_GetFileCount(NARC * narc) {
    return narc->num_files;
}
