#include <cstring>
#include <iostream>
#include <string>

#include "Narc.h"

using namespace std;

bool debug = false;
bool pack_no_fnt = true;
bool output_header = false;

void PrintError(NarcError error)
{
    switch (error)
    {
        case NarcError::None:								cout << "ERROR: No error???" << endl;										break;
        case NarcError::InvalidInputFile:					cout << "ERROR: Invalid input file" << endl;								break;
        case NarcError::InvalidHeaderId:					cout << "ERROR: Invalid header ID" << endl;									break;
        case NarcError::InvalidByteOrderMark:				cout << "ERROR: Invalid byte order mark" << endl;							break;
        case NarcError::InvalidVersion:						cout << "ERROR: Invalid NARC version" << endl;								break;
        case NarcError::InvalidHeaderSize:					cout << "ERROR: Invalid header size" << endl;								break;
        case NarcError::InvalidChunkCount:					cout << "ERROR: Invalid chunk count" << endl;								break;
        case NarcError::InvalidFileAllocationTableId:		cout << "ERROR: Invalid file allocation table ID" << endl;					break;
        case NarcError::InvalidFileAllocationTableReserved:	cout << "ERROR: Invalid file allocation table reserved section" << endl;	break;
        case NarcError::InvalidFileNameTableId:				cout << "ERROR: Invalid file name table ID" << endl;						break;
        case NarcError::InvalidFileNameTableEntryId:		cout << "ERROR: Invalid file name table entry ID" << endl;					break;
        case NarcError::InvalidFileImagesId:				cout << "ERROR: Invalid file images ID" << endl;							break;
        case NarcError::InvalidOutputFile:					cout << "ERROR: Invalid output file" << endl;								break;
        default:											cout << "ERROR: Unknown error???" << endl;									break;
    }
}

static inline void usage() {
    cout << "OVERVIEW: Knarc" << endl << endl;
    cout << "USAGE: knarc [options] -d DIRECTORY [-p TARGET | -u SOURCE]" << endl << endl;
    cout << "OPTIONS:" << endl;
    cout << "\t-d DIRECTORY\tDirectory to pack from/unpack to" << endl;
    cout << "\t-p TARGET\tPack to the target NARC" << endl;
    cout << "\t-u SOURCE\tUnpack from the source NARC" << endl;
    cout << "\t-n\tBuild the filename table (default: discards filenames)" << endl;
    cout << "\t-D/--debug\tPrint additional debug messages" << endl;
    cout << "\t-h/--help\tPrint this message and exit" << endl;
    cout << "\t-i\tOutput a .naix header" << endl;
}

int main(int argc, char* argv[])
{
    string directory = "";
    string fileName = "";
    bool pack = false;

    for (int i = 1; i < argc; ++i)
    {
        if (!strcmp(argv[i], "-d"))
        {
            if (i == (argc - 1))
            {
                cerr << "ERROR: No directory specified" << endl;

                return 1;
            }

            if (!directory.empty()) {
                cerr << "ERROR: Multiple directories specified" << endl;
                return 1;
            }
            directory = argv[++i];
        }
        else if (!strcmp(argv[i], "-p"))
        {
            if (i == (argc - 1))
            {
                cerr << "ERROR: No NARC specified to pack to" << endl;

                return 1;
            }

            if (!fileName.empty()) {
                cerr << "ERROR: Multiple files specified" << endl;
                return 1;
            }
            fileName = argv[++i];
            pack = true;
        }
        else if (!strcmp(argv[i], "-u"))
        {
            if (i == (argc - 1))
            {
                cerr << "ERROR: No NARC specified to unpack from" << endl;

                return 1;
            }

            if (!fileName.empty()) {
                cerr << "ERROR: Multiple files specified" << endl;
                return 1;
            }
            fileName = argv[++i];
        } else if (!strcmp(argv[i], "-D") || !strcmp(argv[i], "--debug")) {
            debug = true;
        } else if (!strcmp(argv[i], "-h") || !strcmp(argv[i], "--help")) {
            usage();
            return 0;
        }
        else if (!strcmp(argv[i], "-n")) {
            pack_no_fnt = false;
        }
        else if (!strcmp(argv[i], "-i")) {
            output_header = true;
        }
        else {
            usage();
            cerr << "ERROR: Unrecognized argument: " << argv[i] << endl;
            return 1;
        }
    }

    if (fileName.empty()) {
        cerr << "ERROR: Missing -u or -p" << endl;
        return 1;
    }
    if (directory.empty()) {
        cerr << "ERROR: Missing -d" << endl;
        return 1;
    }

    Narc narc;

    if (pack)
    {
        if (!narc.Pack(fileName, directory))
        {
            PrintError(narc.GetError());

            return 1;
        }
    }
    else
    {
        if (!narc.Unpack(fileName, directory))
        {
            PrintError(narc.GetError());

            return 1;
        }
    }

    return 0;
}
