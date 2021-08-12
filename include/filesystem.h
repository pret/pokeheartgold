#ifndef POKEHEARTGOLD_FILESYSTEM_H
#define POKEHEARTGOLD_FILESYSTEM_H

#include <nitro/fs/file.h>
#include "heap.h"

typedef struct NARC
{
    FSFile file;
    u32 btaf_start;
    u32 gmif_start;
    u16 num_files;
} NARC;

#include "filesystem_files_def.h"

void ReadFromNarcMemberByPathAndId(void * dest, const char * path, s32 file_idx, u32 offset, u32 size);
void * AllocAndReadFromNarcMemberByPathAndId(const char * path, s32 file_idx, u32 heap_id, u32 offset, u32 size, BOOL r4);
void ReadWholeNarcMemberByIdPair(void * dest, NarcId narc_id, s32 file_id);
void * AllocAndReadWholeNarcMemberByIdPair(NarcId narc_id, s32 file_id, u32 heap_id);
void * AllocAtEndAndReadWholeNarcMemberByIdPair(NarcId narc_id, s32 file_id, u32 heap_id);
void ReadFromNarcMemberByIdPair(void * dest, NarcId narc_id, s32 file_id, u32 offset, u32 size);
void * AllocAndReadFromNarcMemberByIdPair(NarcId narc_id, s32 file_id, u32 heap_id, u32 offset, u32 size);
void * AllocAtEndAndReadFromNarcMemberByIdPair(NarcId narc_id, s32 file_id, u32 heap_id, u32 offset, u32 size);
u32 GetNarcMemberSizeByIdPair(NarcId narc_id, s32 file_idx);
NARC * NARC_ctor(NarcId narc_id, u32 heap_id);
void NARC_dtor(NARC * narc);
void * NARC_AllocAndReadWholeMember(NARC * narc, u32 file_id, u32 heap_id);
void NARC_ReadWholeMember(NARC * narc, u32 file_id, void * dest);
u32 NARC_GetMemberSize(NARC * narc, u32 file_id);
void NARC_ReadFromMember(NARC * narc, u32 file_id, u32 pos, u32 size, void * dest);
void NARC_ReadFromAbsolutePos(NARC * narc, u32 pos, u32 size, void * dest);
void NARC_GetMemberImageStartOffset(NARC * narc, u32 file_id, u32 * ret_p);
void NARC_ReadFile(NARC * narc, u32 size, void * dest);
u16 NARC_GetFileCount(NARC * narc);

#endif //POKEHEARTGOLD_FILESYSTEM_H
