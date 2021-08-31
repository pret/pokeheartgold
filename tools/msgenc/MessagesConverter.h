#ifndef GUARD_MESSAGESCONVERTER_H
#define GUARD_MESSAGESCONVERTER_H

#include "util.h"
#include <string>
#include <fstream>
#include <map>
#include <sstream>
#include <vector>
#include <set>

using namespace std;

static inline uint16_t enc_short(uint16_t value, uint16_t & seed) {
    value ^= seed;
    seed += 18749;
    return value;
}

enum ConvertMode : uint8_t {
    CONV_ENCODE = 0,
    CONV_DECODE,
    CONV_INVALID = 0xFF,
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
    virtual void CharmapRegisterCharacter(string& code, uint16_t value);
    virtual void CmdmapRegisterCommand(string& command, uint16_t value);

protected:
    ConvertMode mode;
    string textfilename;
    string charmapfilename;
    string binfilename;

    MsgArcHeader header = {};
    vector<MsgAlloc> alloc_table;
    vector<string> vec_decoded;
    vector<u16string> vec_encoded;

    template <typename key_type, typename mapped_type> void CreateInverseMap(map<key_type, mapped_type>const& _in, map<mapped_type, key_type>& _out) {
        for (auto _pair : _in) {
            _out[_pair.second] = _pair.first;
        }
    }
    static string ReadTextFile(string& filename);
    static void WriteTextFile(string& filename, string const & contents);

public:
    MessagesConverter(ConvertMode _mode, string &_textfilename, int _key, string &_charmapfilename, string &_binfilename) :
        mode(_mode),
        textfilename(_textfilename),
        charmapfilename(_charmapfilename),
        binfilename(_binfilename)
    {
        header.key = (_key == 0) ? CalcCRC() : static_cast<uint16_t>(_key);
    }
    void ReadCharmap();
    virtual void ReadInput() = 0;
    virtual void Convert() = 0;
    virtual void WriteOutput() = 0;
    virtual ~MessagesConverter() = 0;

    uint16_t CalcCRC();

    uint16_t GetKey() {
        return header.key;
    }

    void WriteBinaryDecoded(string &filename);
};

#endif //GUARD_MESSAGESCONVERTER_H
