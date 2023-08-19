#ifndef GUARD_NARC_H
#define GUARD_NARC_H

#include <vector>

struct FileAllocationTableEntry
{
    uint32_t Start = 0;
    uint32_t End = 0;
    static std::vector<FileAllocationTableEntry> _make(std::vector<uint32_t> &sizes) {
        std::vector<FileAllocationTableEntry> ret(sizes.size());
        for (int i = 0; i < sizes.size(); i++) {
            if (i == 0) {
                ret[i].Start = 0;
            } else {
                ret[i].Start = (ret[i - 1].End + 3) & ~3;
            }
            ret[i].End = ret[i].Start + sizes[i];
        }
        return ret;
    }
};

struct FileAllocationTable
{
    uint32_t Id = 0x46415442;
    uint32_t ChunkSize = sizeof(FileAllocationTable);
    uint16_t FileCount = 0;
    uint16_t Reserved = 0;
    FileAllocationTable(std::vector<FileAllocationTableEntry> &sizes) {
        FileCount = sizes.size();
        ChunkSize += FileCount * sizeof(FileAllocationTableEntry);
    }
};

struct FileNameTableEntry
{
    uint32_t Offset = 4;
    uint16_t FirstFileId = 0;
    uint16_t Utility = 1;
};

struct FileNameTable
{
    uint32_t Id = 0x464e5442;
    uint32_t ChunkSize = sizeof(FileNameTable) + sizeof(FileNameTableEntry);
};

struct FileImages
{
    uint32_t Id = 0x46494d47;
    uint32_t ChunkSize = 0;
    template <typename T>
    explicit FileImages(std::vector<T> &data) {
        ChunkSize = data.size() * sizeof(T) + sizeof(FileImages);
    }
};

struct NarcHeader
{
    uint32_t Id = 0x4352414e;
    uint16_t ByteOrderMark = 0xFFFE;
    uint16_t Version = 0x0100;
    uint32_t FileSize = 0;
    uint16_t ChunkSize = sizeof(NarcHeader);
    uint16_t ChunkCount = 3;
    NarcHeader() = default;
    NarcHeader(FileAllocationTable &fat, FileNameTable &fnt, FileImages &img) {
        FileSize = sizeof(NarcHeader) + fat.ChunkSize + fnt.ChunkSize + img.ChunkSize;
    }
};

#endif //GUARD_NARC_H
