#ifndef GUARD_MESSAGESCONVERTER_H
#define GUARD_MESSAGESCONVERTER_H

#include <string>
#include <fstream>
#include <map>
#include <sstream>
#include <vector>

using namespace std;

enum ConvertMode {
    CONV_ENCODE = 0,
    CONV_DECODE
};

struct MsgArcHeader
{
    uint16_t count;
    uint16_t key;
};

struct MsgAlloc
{
    uint32_t offset;
    uint32_t length;
};

class MessagesConverter{
    ConvertMode mode;
    string textfilename;
    string keyfilename;
    string charmapfilename;
    string binfilename;
    map<string, uint16_t> charmap;

    MsgArcHeader header = {};
    vector<MsgAlloc> alloc_table;
    vector<string> files;
    vector<u16string> outfiles;

    map<string, uint16_t> cmdmap = {
        {"STRVAR", 0x0100},
        {"YESNO", 0x200},
        {"PAUSE", 0x201},
        {"WAIT", 0x202},
        {"CURSOR_X", 0x203},
        {"CURSOR_Y", 0x204},
        {"COLOR", 0xFF00},
        {"SIZE", 0xFF01}
    };
    map <uint16_t, string> cmdmap_dec;
    map <uint16_t, string> charmap_dec;

    static string ReadTextFile(string& filename);
    void ReadKeyFile(string& keyfname);
    void ReadCharmap(string& filename);
    void ReadMessagesFromText(string& filename);
    void ReadTextAndKey();
    void WriteMessagesToText(string& filename);
    static void WriteTextFile(string& filename, string const& contents);
    static void WriteBinaryFile(string& filename, void* data, streamsize size);
    void ReadMessagesFromBin(string& filename);
    void WriteMessagesToBin(string& filename);
    void ReadBinary();
    void EncodeMessages();
    void DecodeMessages();
    void WriteTextAndKey();
    void WriteBinary();
    static u16string DecodeTrainerNameMessage(u16string const &message);
    template <typename key_type, typename mapped_type> void CreateInverseMap(map<key_type, mapped_type>const& _in, map<mapped_type, key_type>& _out) {
        for (auto _pair : _in) {
            _out[_pair.second] = _pair.first;
        }
    }
    void CreateInverseMaps();
public:
    MessagesConverter(ConvertMode _mode, string &_textfilename, string &_keyfilename, string &_charmapfilename, string &_binfilename) :
        mode(_mode),
        textfilename(_textfilename),
        keyfilename(_keyfilename),
        charmapfilename(_charmapfilename),
        binfilename(_binfilename)
    {
        ReadCharmap(charmapfilename);
        if (mode == CONV_DECODE)
            CreateInverseMaps();
    }
    void ReadInput() {
        mode == CONV_ENCODE ? ReadTextAndKey() : ReadBinary();
    }
    void Convert() {
        mode == CONV_ENCODE ? EncodeMessages() : DecodeMessages();
    }
    void WriteOutput() {
        mode == CONV_ENCODE ? WriteBinary() : WriteTextAndKey();
    }
};

#endif //GUARD_MESSAGESCONVERTER_H
