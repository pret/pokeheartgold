#include <iostream>
#include <string>
#include "Options.h"
#include "Decrypt.h"

int main(int argc, char ** argv) {
    // Usage: mod123encry MODE INFILE OUTFILE BASEROM OVY_ID
    try {
        Options options(argc, argv);
        return options.main();
    } catch (std::exception &e) {
        std::cerr << "An exception has occurred: " << e.what() << std::endl;
        return 1;
    }
    return 0;
}
