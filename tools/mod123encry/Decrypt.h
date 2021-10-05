#ifndef GUARD_DECRYPT_H
#define GUARD_DECRYPT_H

#include "NtrRom.h"

struct DecryptOptions {
    NtrRom *baserom;
    std::ofstream outfile;
    std::uint32_t ovy_id;

    int main();
};

int decrypt_main(DecryptOptions &options);

#endif //GUARD_DECRYPT_H
