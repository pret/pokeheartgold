#ifndef GUARD_NARC_H
#define GUARD_NARC_H

struct NarcHeader
{
    uint32_t Id;
    uint16_t ByteOrderMark;
    uint16_t Version;
    uint32_t FileSize;
    uint16_t ChunkSize;
    uint16_t ChunkCount;
};

struct FileAllocationTable
{
    uint32_t Id;
    uint32_t ChunkSize;
    uint16_t FileCount;
    uint16_t Reserved;
};

struct FileAllocationTableEntry
{
    uint32_t Start;
    uint32_t End;
};

struct FileNameTable
{
    uint32_t Id;
    uint32_t ChunkSize;
};

struct FileNameTableEntry
{
    uint32_t Offset;
    uint16_t FirstFileId;
    uint16_t Utility;
};

struct FileImages
{
    uint32_t Id;
    uint32_t ChunkSize;
};

#endif //GUARD_NARC_H
