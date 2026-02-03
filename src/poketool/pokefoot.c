#include "poketool/pokefoot/pokefoot.naix"

#include "filesystem.h"

NarcId ov18_021E5900(void);
int ov18_021E5904(int a0);
int ov18_021E5908(void);

NarcId ov18_021E5900(void) {
    return NARC_poketool_pokefoot_pokefoot;
}

int ov18_021E5904(int a0) {
    return a0 + NARC_pokefoot_pokefoot_00000003_NCGR_lz;
}

int ov18_021E5908(void) {
    return NARC_pokefoot_pokefoot_00000000_NCLR;
}
