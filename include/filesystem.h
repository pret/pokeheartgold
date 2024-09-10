#ifndef POKEHEARTGOLD_FILESYSTEM_H
#define POKEHEARTGOLD_FILESYSTEM_H

#include <nitro/fs/file.h>

#include "heap.h"

/*
 * The NARC struct wraps NitroSDK type FSFile and manages the important offsets to the FATB and the FIMG chunks within the file.
 * FATB defines the regions within the FIMG to which the data are allocated.
 */
typedef struct NARC {
    FSFile file;    // Open file handle
    u32 btaf_start; // Byte offset to the FATB chunk
    u32 gmif_start; // Byte offset to the FIMG chunk
    u16 num_files;  // Number of members in the archive
} NARC;

// Defines enum NarcId used in all public methods.
// NarcId is an index into sNarcFileList
// file_id args should map from the corresponding .naix file
#include "filesystem_files_def.h"

/*
 * void ReadWholeNarcMemberByIdPair(void * dest, NarcId narc_id, s32 file_id)
 *
 * Reads the entire content of an archive member into an existing buffer
 *
 * @param dest:        Pointer to destination buffer, should be large enough to hold the data
 * @param narc_id:     Ident of NARC to read
 * @param file_id:     Index of FAT member within the NARC
 */
void ReadWholeNarcMemberByIdPair(void *dest, NarcId narc_id, s32 file_id);

/*
 * void * AllocAndReadWholeNarcMemberByIdPair(Narcid narc_id, s32 file_id, HeapID heapId)
 * void * AllocAtEndAndReadWholeNarcMemberByIdPair(Narcid narc_id, s32 file_id, HeapID heapId)
 *
 * Creates a new buffer large enough to hold the content of the archive member, then reads its data.
 * The AllocAtEnd variant is preferred for very short-lived buffers.
 *
 * @param narc_id:     Ident of NARC to read
 * @param file_id:     Index of FAT member within the NARC
 * @param heapId:     ID of the heap to alloc from
 *
 * @returns: Pointer to the allocated buffer which contains the data that was read.
 */
void *AllocAndReadWholeNarcMemberByIdPair(NarcId narc_id, s32 file_id, HeapID heapId);
void *AllocAtEndAndReadWholeNarcMemberByIdPair(NarcId narc_id, s32 file_id, HeapID heapId);

/*
 * void ReadFromNarcMemberByIdPair(void * dest, NarcId narc_id, s32 file_id, u32 offset, u32 size)
 *
 * Reads a portion of an archive member into an existing buffer
 *
 * @param dest:        Pointer to destination buffer, should be large enough to hold the data
 * @param narc_id:     Ident of NARC to read
 * @param file_id:     Index of FAT member within the NARC
 * @param offset:      Byte offset to start reading, relative to start of member, up to the end of member
 * @param size:        Number of bytes to read, up to the total size of member minus offset
 */
void ReadFromNarcMemberByIdPair(void *dest, NarcId narc_id, s32 file_id, u32 offset, u32 size);

/*
 * void * AllocAndReadFromNarcMemberByIdPair(Narcid narc_id, s32 file_id, HeapID heapId)
 * void * AllocAtEndAndReadFromNarcMemberByIdPair(Narcid narc_id, s32 file_id, HeapID heapId)
 *
 * Creates a new buffer large enough to hold the size to read, then reads the specified data slice.
 * The AllocAtEnd variant is preferred for very short-lived buffers.
 *
 * @param narc_id:     Ident of NARC to read
 * @param file_id:     Index of FAT member within the NARC
 * @param heapId:     ID of the heap to alloc from
 * @param offset:      Byte offset to start reading, relative to start of member, up to the end of member
 * @param size:        Number of bytes to read, up to the total size of member minus offset
 *
 * @returns: Pointer to the allocated buffer which contains the data that was read.
 */
void *AllocAndReadFromNarcMemberByIdPair(NarcId narc_id, s32 file_id, HeapID heapId, u32 offset, u32 size);
void *AllocAtEndAndReadFromNarcMemberByIdPair(NarcId narc_id, s32 file_id, HeapID heapId, u32 offset, u32 size);

/*
 * u32 GetNarcMemberSizeByIdPair(NarcId narc_id, s32 file_idx)
 *
 * Gets the size of a NARC member. Useful when managing the read buffer yourself and the NARC has variable
 * sized members.
 *
 * @param narc_id:     Ident of NARC to read
 * @param file_idx:     Index of FAT member within the NARC
 *
 * @returns: Size in bytes of the member
 */
u32 GetNarcMemberSizeByIdPair(NarcId narc_id, s32 file_idx);

/*
 * NARC * NARC_New(NarcId narc_id, HeapID heapId)
 *
 * Constructs a new NARC which contains an open FSFile to the corresponding archive.
 * Useful to reduce overhead when reading from the same NARC multiple times.
 *
 * @param narc_id:     Ident of NARC to open
 * @param heapId:     ID of the heap to alloc from
 *
 * @returns: Pointer to the newly-allocated NARC
 */
NARC *NARC_New(NarcId narc_id, HeapID heapId);

/*
 * void NARC_Delete(NARC * narc)
 *
 * Closes the wrapped FSFile and returns the NARC allocation to the heap from whence it came.
 *
 * @param narc:        Pointer to the NARC
 */
void NARC_Delete(NARC *narc);

/*
 * void * NARC_AllocAndReadWholeMember(NARC * narc, u32 file_id, HeapID heapId)
 *
 * Creates a new buffer large enough to hold the content of the archive member, then reads its data.
 *
 * @param narc:        Pointer to the NARC
 * @param file_id:     Index of FAT member within the NARC
 * @param heapId:     ID of the heap to alloc from
 *
 * @returns: Pointer to the allocated buffer which contains the data that was read.
 */
void *NARC_AllocAndReadWholeMember(NARC *narc, u32 file_id, HeapID heapId);

/*
 * void * NARC_ReadWholeMember(NARC * narc, u32 file_id, void * dest)
 *
 * Reads NARC member to preallocated buffer dest, which should be large enough to hold the data.
 *
 * @param narc:        Pointer to the NARC
 * @param file_id:     Index of FAT member within the NARC
 * @param dest:        Pointer to the destination buffer
 */
void NARC_ReadWholeMember(NARC *narc, u32 file_id, void *dest);

/*
 * u32 NARC_GetMemberSize(NARC * narc, u32 file_id)
 *
 * Gets the size of a NARC member. Useful when managing the read buffer yourself and the NARC has variable
 * sized members.
 *
 * @param narc:         Pointer to the NARC
 * @param file_idx:     Index of FAT member within the NARC
 *
 * @returns: Size in bytes of the member
 */
u32 NARC_GetMemberSize(NARC *narc, u32 file_id);

/*
 * void NARC_ReadFromMember(NARC * narc, u32 file_id, u32 pos, u32 size, void * dest)
 *
 * Reads a portion of an archive member into an existing buffer
 *
 * @param narc:        Pointer to the NARC
 * @param file_id:     Index of FAT member within the NARC
 * @param pos:         Byte offset to start reading, relative to start of member, up to the end of member
 * @param size:        Number of bytes to read, up to the total size of member minus offset
 * @param dest:        Pointer to destination buffer, should be large enough to hold the data
 */
void NARC_ReadFromMember(NARC *narc, u32 file_id, u32 pos, u32 size, void *dest);

/*
 * void NARC_ReadFromAbsolutePos(NARC * narc, u32 pos, u32 size, void * dest)
 *
 * Reads a portion of the archive file from the specified cursor position into an existing buffer
 *
 * @param narc:        Pointer to the NARC
 * @param pos:         Byte offset to start reading
 * @param size:        Number of bytes to read, up to the total size of member minus offset
 * @param dest:        Pointer to destination buffer, should be large enough to hold the data
 */
void NARC_ReadFromAbsolutePos(NARC *narc, u32 pos, u32 size, void *dest);

/*
 * void NARC_GetMemberImageStartOffset(NARC * narc, u32 file_id, u32 * ret_p)
 *
 * Determines the start offset in the flat NARC of the specified member, this is gmif_offset + fatb[file_id].start
 *
 * @param narc:         Pointer to the NARC
 * @param file_id:      Index of FAT member within the NARC
 * @param ret_p:        Pointer to u32 which will hold the return value of this routine
 */
void NARC_GetMemberImageStartOffset(NARC *narc, u32 file_id, u32 *ret_p);

/*
 * void NARC_ReadFile(NARC * narc, u32 size, void * dest)
 *
 * Reads a portion of the archive file from the current cursor into an existing buffer
 *
 * @param narc:        Pointer to the NARC
 * @param size:        Number of bytes to read, up to the total size of member minus offset
 * @param dest:        Pointer to destination buffer, should be large enough to hold the data
 */
void NARC_ReadFile(NARC *narc, u32 size, void *dest);

/*
 * u16 NARC_GetFileCount(NARC * narc)
 *
 * Gets the total number of archive members
 *
 * @param narc:        Pointer to the NARC
 *
 * @returns: Number of archive members
 */
u16 NARC_GetFileCount(NARC *narc);

#endif // POKEHEARTGOLD_FILESYSTEM_H
