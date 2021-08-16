#ifndef GUARD_MESSAGESCONVERTER_H
#define GUARD_MESSAGESCONVERTER_H

#include "util.h"
#include <string>
#include <fstream>
#include <map>
#include <sstream>
#include <vector>

using namespace std;

static inline uint16_t enc_short(uint16_t value, uint16_t & seed) {
    value ^= seed;
    seed += 18749;
    return value;
}

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
    void encrypt(uint16_t key, int i) {
        uint32_t alloc_key = (765 * i * key) & 0xFFFF;
        alloc_key |= alloc_key << 16;
        offset ^= alloc_key;
        length ^= alloc_key;
    }
    void decrypt(uint16_t key, int i) { encrypt(key, i); }
};

static inline void EncryptU16String(u16string & message, int & i) {
    uint16_t key = i * 596947;
    for (auto & code : message) {
        code = enc_short(code, key);
    }
}

static inline void DecryptU16String(u16string & message, int & i) {
    EncryptU16String(message, i);
}

class MessagesConverter{
protected:
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
        {"STRVAR_1", 0x0100},
        {"STRVAR_3", 0x0300},
        {"STRVAR_4", 0x0400},
        {"STRVAR_34", 0x3400},
        {"YESNO", 0x200},
        {"PAUSE", 0x201},
        {"WAIT", 0x202},
        {"CURSOR_X", 0x203},
        {"CURSOR_Y", 0x204},
        {"ALN_CENTER", 0x205},
        {"ALN_RIGHT", 0x206},
        {"UNK_207", 0x207},
        {"UNK_208", 0x208},
        {"COLOR", 0xFF00},
        {"SIZE", 0xFF01},
        {"UNK_FF02", 0xFF02},
    };

    vector<uint16_t> strvar_codes = {0x0100, 0x0300, 0x0400, 0x3400};

    template <typename key_type, typename mapped_type> void CreateInverseMap(map<key_type, mapped_type>const& _in, map<mapped_type, key_type>& _out) {
        for (auto _pair : _in) {
            _out[_pair.second] = _pair.first;
        }
    }
    static string ReadTextFile(string& filename);
    static void WriteTextFile(string& filename, string const & contents);
    void ReadCharmap(string& charmapfname);
public:
    MessagesConverter(string &_textfilename, string &_keyfilename, string &_charmapfilename, string &_binfilename) :
        textfilename(_textfilename),
        keyfilename(_keyfilename),
        charmapfilename(_charmapfilename),
        binfilename(_binfilename)
    {
        ReadCharmap(charmapfilename);
    }
    virtual void ReadInput() = 0;
    virtual void Convert() = 0;
    virtual void WriteOutput() = 0;
    virtual ~MessagesConverter() = 0;
};

#endif //GUARD_MESSAGESCONVERTER_H
