#include "argparse.h"
#include "elfread.h"

int main(int argc, char *argv[]) {
    EncodingTask task;
    int ret = ArgParse_CreateTask(&task, argv);
    if (ret == 0) {
        ret = Elf_EncodeSymbols(&task);
    }

    ArgParse_DestroyTask(&task);
    return ret;
}
