#include "Narc.h"

#include <algorithm>
#include <cstddef>
#include <cstdint>
#include <fstream>
#include <iomanip>
#include <ios>
#include <iostream>
#include <map>
#include <memory>
#include <regex>
#include <sstream>
#include <stack>
#include <string>
#include <vector>

#include "fnmatch.h"

#if (__GNUC__ <= 7) && !defined _MSC_VER
#include <experimental/filesystem>
namespace fs = std::experimental::filesystem;
#else
#include <filesystem>
namespace fs = std::filesystem;
#endif

using namespace std;

extern bool debug;
extern bool pack_no_fnt;

void Narc::AlignDword(ofstream& ofs, uint8_t paddingChar)
{
    if ((ofs.tellp() % 4) != 0)
    {
        for (int i = 4 - (ofs.tellp() % 4); i-- > 0; )
        {
            ofs.write(reinterpret_cast<char*>(&paddingChar), sizeof(uint8_t));
        }
    }
}

bool Narc::Cleanup(ifstream& ifs, const NarcError& e)
{
    ifs.close();

    error = e;

    return false;
}

bool Narc::Cleanup(ofstream& ofs, const NarcError& e)
{
    ofs.close();

    error = e;

    return false;
}

vector<fs::directory_entry> Narc::OrderedDirectoryIterator(const fs::path& path, bool recursive) const
{
    vector<fs::directory_entry> v;

    for (const auto& de : fs::directory_iterator(path))
    {
        v.push_back(de);
    }

    sort(v.begin(), v.end(), [](const fs::directory_entry& a, const fs::directory_entry& b)
        {
            // I fucking hate C++
            string aStr = a.path().filename().string();
            string bStr = b.path().filename().string();

            for (size_t i = 0; i < aStr.size(); ++i)
            {
                aStr[i] = tolower(aStr[i]);
            }

            for (size_t i = 0; i < bStr.size(); ++i)
            {
                bStr[i] = tolower(bStr[i]);
            }

            return aStr < bStr;
        });

    if (recursive)
    {
        size_t vSize = v.size();

        for (size_t i = 0; i < vSize; ++i)
        {
            if (is_directory(v[i]))
            {
                vector<fs::directory_entry> temp = OrderedDirectoryIterator(v[i], true);

                v.insert(v.end(), temp.begin(), temp.end());
            }
        }
    }

    return v;
}

NarcError Narc::GetError() const
{
    return error;
}

class WildcardVector : public vector<string> {
public:
    WildcardVector(fs::path fp) {
        fstream infile;
        if (!fs::exists(fp)) return;
        infile.open(fp, ios_base::in);
        string line;
        while (getline(infile, line)) {
            if (!line.empty())
            {
                // strip CR
                size_t i;
                for (i = line.size() - 1; line[i] == '\r'; i--)
                    ;
                if (i < line.size() - 1)
                    line.erase(i + 1);
                push_back(line);
            }
        }
    }
    bool matches(string fp) {
        for (string& pattern : *this) {
            if (fnmatch(pattern.c_str(), fp.c_str(), FNM_PERIOD) == 0)
                return true;
        }
        return false;
    }
};

bool Narc::Pack(const fs::path& fileName, const fs::path& directory)
{
    ofstream ofs(fileName, ios::binary);

    if (!ofs.good()) { return Cleanup(ofs, NarcError::InvalidOutputFile); }

    vector<FileAllocationTableEntry> fatEntries;
    uint16_t directoryCounter = 1;

    WildcardVector ignore_patterns(directory / ".knarcignore");
    ignore_patterns.push_back(".*ignore");
    ignore_patterns.push_back(".*keep");
    WildcardVector keep_patterns(directory / ".knarckeep");

    for (const auto& de : OrderedDirectoryIterator(directory, true))
    {
        if (is_directory(de))
        {
            ++directoryCounter;
        }
        else if (keep_patterns.matches(de.path().filename().string()) || !ignore_patterns.matches(de.path().filename().string()))
        {
            if (debug) {
                cerr << "DEBUG: adding file " << de.path() << endl;
            }
            fatEntries.push_back(FileAllocationTableEntry
                {
                    .Start = 0x0,
                    .End = 0x0
                });

            if (fatEntries.size() > 1)
            {
                fatEntries.back().Start = fatEntries.rbegin()[1].End;

                if ((fatEntries.rbegin()[1].End % 4) != 0)
                {
                    fatEntries.back().Start += 4 - (fatEntries.rbegin()[1].End % 4);
                }
            }

            fatEntries.back().End = fatEntries.back().Start + static_cast<uint32_t>(file_size(de));
        }
    }

    FileAllocationTable fat
    {
        .Id = 0x46415442, // BTAF
        .ChunkSize = static_cast<uint32_t>(sizeof(FileAllocationTable) + ((uint32_t)fatEntries.size() * sizeof(FileAllocationTableEntry))),
        .FileCount = static_cast<uint16_t>(fatEntries.size()),
        .Reserved = 0x0
    };

    map<fs::path, string> subTables;
    vector<fs::path> paths;

    directoryCounter = 0;

    for (const auto& de : OrderedDirectoryIterator(directory, true))
    {
        if (!subTables.count(de.path().parent_path()) && (keep_patterns.matches(de.path().filename().string()) || !ignore_patterns.matches(de.path().filename().string())))
        {
            subTables.insert({ de.path().parent_path(), "" });
            paths.push_back(de.path().parent_path());
        }

        if (is_directory(de))
        {
            ++directoryCounter;

            subTables[de.path().parent_path()] += static_cast<uint8_t>(0x80 + de.path().filename().string().size());
            subTables[de.path().parent_path()] += de.path().filename().string();
            subTables[de.path().parent_path()] += (0xF000 + directoryCounter) & 0xFF;
            subTables[de.path().parent_path()] += (0xF000 + directoryCounter) >> 8;
        }
        else if (keep_patterns.matches(de.path().filename().string()) || !ignore_patterns.matches(de.path().filename().string()))
        {
            subTables[de.path().parent_path()] += static_cast<uint8_t>(de.path().filename().string().size());
            subTables[de.path().parent_path()] += de.path().filename().string();
        }
    }

    for (auto& subTable : subTables)
    {
        subTable.second += '\0';
    }

    vector<FileNameTableEntry> fntEntries;

    if (!pack_no_fnt)
    {
        fntEntries.push_back(
            {
                .Offset = static_cast<uint32_t>((directoryCounter + 1) * sizeof(FileNameTableEntry)),
                .FirstFileId = 0x0,
                .Utility = static_cast<uint16_t>(directoryCounter + 1)
            });

        for (uint16_t i = 0; i < directoryCounter; ++i)
        {
            fntEntries.push_back(
                {
                    .Offset = static_cast<uint32_t>(fntEntries.back().Offset + subTables[paths[i]].size()),
                    .FirstFileId = fntEntries.back().FirstFileId,
                    .Utility = 0x0
                });

            for (size_t j = 0; j < (subTables[paths[i]].size() - 1); ++j)
            {
                if (static_cast<uint8_t>(subTables[paths[i]][j]) <= 0x7F)
                {
                    j += static_cast<uint8_t>(subTables[paths[i]][j]);
                    ++fntEntries.back().FirstFileId;
                }
                else if (static_cast<uint8_t>(subTables[paths[i]][j]) <= 0xFF)
                {
                    j += static_cast<uint8_t>(subTables[paths[i]][j]) - 0x80 + 0x2;
                }
            }

            fntEntries.back().Utility = 0xF000 + (find(paths.begin(), paths.end(), paths[i + 1].parent_path()) - paths.begin());
        }
    }
    else
    {
        fntEntries.push_back(
            {
                .Offset = 0x4,
                .FirstFileId = 0x0,
                .Utility = 0x1
            });
    }

    FileNameTable fnt
    {
        .Id = 0x464E5442, // BTNF
        .ChunkSize = static_cast<uint32_t>(sizeof(FileNameTable) + (fntEntries.size() * sizeof(FileNameTableEntry)))
    };

    if (!pack_no_fnt)
    {
        for (const auto& subTable : subTables)
        {
            fnt.ChunkSize += subTable.second.size();
        }
    }

    if ((fnt.ChunkSize % 4) != 0)
    {
        fnt.ChunkSize += 4 - (fnt.ChunkSize % 4);
    }

    FileImages fi
    {
        .Id = 0x46494D47, // GMIF
        .ChunkSize = static_cast<uint32_t>(sizeof(FileImages) + fatEntries.back().End)
    };

    if ((fi.ChunkSize % 4) != 0)
    {
        fi.ChunkSize += 4 - (fi.ChunkSize % 4);
    }

    Header header
    {
        .Id = 0x4352414E, // NARC
        .ByteOrderMark = 0xFFFE,
        .Version = 0x100,
        .FileSize = static_cast<uint32_t>(sizeof(Header) + fat.ChunkSize + fnt.ChunkSize + fi.ChunkSize),
        .ChunkSize = sizeof(Header),
        .ChunkCount = 0x3
    };

    ofs.write(reinterpret_cast<char*>(&header), sizeof(Header));
    ofs.write(reinterpret_cast<char*>(&fat), sizeof(FileAllocationTable));

    for (auto& entry : fatEntries)
    {
        ofs.write(reinterpret_cast<char*>(&entry), sizeof(FileAllocationTableEntry));
    }

    ofs.write(reinterpret_cast<char*>(&fnt), sizeof(FileNameTable));

    for (auto& entry : fntEntries)
    {
        ofs.write(reinterpret_cast<char*>(&entry), sizeof(FileNameTableEntry));
    }

    if (!pack_no_fnt)
    {
        for (const auto& path : paths)
        {
            ofs << subTables[path];
        }
    }

    AlignDword(ofs, 0xFF);

    ofs.write(reinterpret_cast<char*>(&fi), sizeof(FileImages));

    for (const auto& de : OrderedDirectoryIterator(directory, true))
    {
        if (is_directory(de))
        {
            continue;
        }

        if (!(keep_patterns.matches(de.path().filename().string()) || !ignore_patterns.matches(de.path().filename().string())))
        {
            continue;
        }

        ifstream ifs(de.path(), ios::binary | ios::ate);

        if (!ifs.good())
        {
            ifs.close();

            return Cleanup(ofs, NarcError::InvalidInputFile);
        }

        streampos length = ifs.tellg();
        unique_ptr<char[]> buffer = make_unique<char[]>(static_cast<unsigned int>(length));

        ifs.seekg(0);
        ifs.read(buffer.get(), length);
        ifs.close();

        ofs.write(buffer.get(), length);

        AlignDword(ofs, 0xFF);
    }

    ofs.close();

    return error == NarcError::None ? true : false;
}

bool Narc::Unpack(const fs::path& fileName, const fs::path& directory)
{
    ifstream ifs(fileName, ios::binary);

    if (!ifs.good()) { return Cleanup(ifs, NarcError::InvalidInputFile); }

    Header header;
    ifs.read(reinterpret_cast<char*>(&header), sizeof(Header));

    if (header.Id != 0x4352414E) { return Cleanup(ifs, NarcError::InvalidHeaderId); }
    if (header.ByteOrderMark != 0xFFFE) { return Cleanup(ifs, NarcError::InvalidByteOrderMark); }
    if ((header.Version != 0x0100) && (header.Version != 0x0000)) { return Cleanup(ifs, NarcError::InvalidVersion); }
    if (header.ChunkSize != 0x10) { return Cleanup(ifs, NarcError::InvalidHeaderSize); }
    if (header.ChunkCount != 0x3) { return Cleanup(ifs, NarcError::InvalidChunkCount); }

    FileAllocationTable fat;
    ifs.read(reinterpret_cast<char*>(&fat), sizeof(FileAllocationTable));

    if (fat.Id != 0x46415442) { return Cleanup(ifs, NarcError::InvalidFileAllocationTableId); }
    if (fat.Reserved != 0x0) { return Cleanup(ifs, NarcError::InvalidFileAllocationTableReserved); }

    unique_ptr<FileAllocationTableEntry[]> fatEntries = make_unique<FileAllocationTableEntry[]>(fat.FileCount);

    for (uint16_t i = 0; i < fat.FileCount; ++i)
    {
        ifs.read(reinterpret_cast<char*>(&fatEntries.get()[i]), sizeof(FileAllocationTableEntry));
    }

    FileNameTable fnt;
    vector<FileNameTableEntry> FileNameTableEntries;
    ifs.read(reinterpret_cast<char*>(&fnt), sizeof(FileNameTable));

    if (fnt.Id != 0x464E5442) { return Cleanup(ifs, NarcError::InvalidFileNameTableId); }

    vector<FileNameTableEntry> fntEntries;

    do
    {
        fntEntries.push_back(FileNameTableEntry());

        ifs.read(reinterpret_cast<char*>(&fntEntries.back().Offset), sizeof(uint32_t));
        ifs.read(reinterpret_cast<char*>(&fntEntries.back().FirstFileId), sizeof(uint16_t));
        ifs.read(reinterpret_cast<char*>(&fntEntries.back().Utility), sizeof(uint16_t));
    } while (static_cast<uint32_t>(ifs.tellg()) < (header.ChunkSize + fat.ChunkSize + sizeof(FileNameTable) + fntEntries[0].Offset));

    unique_ptr<string[]> fileNames = make_unique<string[]>(0xFFFF);

    for (size_t i = 0; i < fntEntries.size(); ++i)
    {
        ifs.seekg(static_cast<uint64_t>(header.ChunkSize) + fat.ChunkSize + sizeof(FileNameTable) + fntEntries[i].Offset);

        uint16_t fileId = 0x0000;

        for (uint8_t length = 0x80; length != 0x00; ifs.read(reinterpret_cast<char*>(&length), sizeof(uint8_t)))
        {
            if (length <= 0x7F)
            {
                for (uint8_t j = 0; j < length; ++j)
                {
                    uint8_t c;
                    ifs.read(reinterpret_cast<char*>(&c), sizeof(uint8_t));

                    fileNames.get()[fntEntries[i].FirstFileId + fileId] += c;
                }

                ++fileId;
            }
            else if (length == 0x80)
            {
                // Reserved
            }
            else if (length <= 0xFF)
            {
                length -= 0x80;
                string directoryName;

                for (uint8_t j = 0; j < length; ++j)
                {
                    uint8_t c;
                    ifs.read(reinterpret_cast<char*>(&c), sizeof(uint8_t));

                    directoryName += c;
                }

                uint16_t directoryId;
                ifs.read(reinterpret_cast<char*>(&directoryId), sizeof(uint16_t));

                fileNames.get()[directoryId] = directoryName;
            }
            else
            {
                return Cleanup(ifs, NarcError::InvalidFileNameTableEntryId);
            }
        }
    }

    if ((ifs.tellg() % 4) != 0)
    {
        ifs.seekg(4 - (ifs.tellg() % 4), ios::cur);
    }

    FileImages fi;
    ifs.read(reinterpret_cast<char*>(&fi), sizeof(FileImages));

    if (fi.Id != 0x46494D47) { return Cleanup(ifs, NarcError::InvalidFileImagesId); }

    fs::create_directory(directory);
    fs::current_path(directory);

    if (fnt.ChunkSize == 0x10)
    {
        for (uint16_t i = 0; i < fat.FileCount; ++i)
        {
            ifs.seekg(static_cast<uint64_t>(header.ChunkSize) + fat.ChunkSize + fnt.ChunkSize + 8 + fatEntries.get()[i].Start);

            unique_ptr<char[]> buffer = make_unique<char[]>(fatEntries.get()[i].End - fatEntries.get()[i].Start);
            ifs.read(buffer.get(), fatEntries.get()[i].End - fatEntries.get()[i].Start);

            ostringstream oss;
            oss << fileName.stem().string() << "_" << setfill('0') << setw(8) << i << ".bin";

            ofstream ofs(oss.str(), ios::binary);

            if (!ofs.good())
            {
                ofs.close();

                return Cleanup(ifs, NarcError::InvalidOutputFile);
            }

            ofs.write(buffer.get(), fatEntries.get()[i].End - fatEntries.get()[i].Start);
            ofs.close();
        }
    }
    else
    {
        fs::path absolutePath = fs::absolute(fs::current_path());

        for (size_t i = 0; i < fntEntries.size(); ++i)
        {
            fs::current_path(absolutePath);
            stack<string> directories;

            for (uint16_t j = fntEntries[i].Utility; j > 0xF000; j = fntEntries[j - 0xF000].Utility)
            {
                directories.push(fileNames.get()[j]);
            }

            for (; !directories.empty(); directories.pop())
            {
                fs::create_directory(directories.top());
                fs::current_path(directories.top());
            }

            if (fntEntries[i].Utility >= 0xF000)
            {
                fs::create_directory(fileNames.get()[0xF000 + i]);
                fs::current_path(fileNames.get()[0xF000 + i]);
            }

            ifs.seekg(static_cast<uint64_t>(header.ChunkSize) + fat.ChunkSize + sizeof(FileNameTable) + fntEntries[i].Offset);

            uint16_t fileId = 0x0000;

            for (uint8_t length = 0x80; length != 0x00; ifs.read(reinterpret_cast<char*>(&length), sizeof(uint8_t)))
            {
                if (length <= 0x7F)
                {
                    streampos savedPosition = ifs.tellg();

                    ifs.seekg(static_cast<uint64_t>(header.ChunkSize) + fat.ChunkSize + fnt.ChunkSize + 8 + fatEntries.get()[fntEntries[i].FirstFileId + fileId].Start);

                    unique_ptr<char[]> buffer = make_unique<char[]>(fatEntries.get()[fntEntries[i].FirstFileId + fileId].End - fatEntries.get()[fntEntries[i].FirstFileId + fileId].Start);
                    ifs.read(buffer.get(), fatEntries.get()[fntEntries[i].FirstFileId + fileId].End - fatEntries.get()[fntEntries[i].FirstFileId + fileId].Start);

                    ofstream ofs(fileNames.get()[fntEntries[i].FirstFileId + fileId], ios::binary);

                    if (!ofs.good())
                    {
                        ofs.close();

                        return Cleanup(ifs, NarcError::InvalidOutputFile);
                    }

                    ofs.write(buffer.get(), fatEntries.get()[fntEntries[i].FirstFileId + fileId].End - fatEntries.get()[fntEntries[i].FirstFileId + fileId].Start);
                    ofs.close();

                    ifs.seekg(savedPosition);
                    ifs.seekg(length, ios::cur);

                    ++fileId;
                }
                else if (length == 0x80)
                {
                    // Reserved
                }
                else if (length <= 0xFF)
                {
                    ifs.seekg(static_cast<uint64_t>(length) - 0x80 + 0x2, ios::cur);
                }
                else
                {
                    return Cleanup(ifs, NarcError::InvalidFileNameTableEntryId);
                }
            }
        }
    }

    ifs.close();

    return error == NarcError::None ? true : false;
}
