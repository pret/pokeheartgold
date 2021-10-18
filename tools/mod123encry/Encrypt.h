#ifndef GUARD_ENCRYPT_H
#define GUARD_ENCRYPT_H

#include <fstream>
#include <string>
#include <filesystem>
#include "ntrtypes.h"
#include "Decrypt.h"

class Encryptor : public Decryptor {
    u32 FindEncryLvl2(u32 offset) { return FindDecryLvl2(offset); }
    u32 DoEncryptLvl1(u32 tableOffset);
    u32 DoEncryptLvl2(u32 tableOffset);
    void EncryptLvl1();
    void EncryptLvl2();
public:
    Encryptor(std::string &buildname, u32 ovy_id);
    Encryptor(FSOverlayInfo &_info, std::vector<u8> &_data) : Decryptor(_info, _data) {}
    void Encrypt();
};

struct EncryptOptions : public Options {
    std::string buildname;
    std::ofstream outfile;
    u32 ovy_id;

    EncryptOptions(int argc, char ** argv);
    ~EncryptOptions() = default;
    int main(void);
};


#endif //GUARD_ENCRYPT_H
