#ifndef POKEHEARTGOLD_CONSTANTS_RGB_H
#define POKEHEARTGOLD_CONSTANTS_RGB_H

#define RGB(r,g,b)       (((r) & 0x1F) | (((g) & 0x1F) << 5) | (((b) & 0x1F) << 10))

#define RGB_BLACK        RGB(0,0,0)
#define RGB_WHITE        RGB(31,31,31)

#endif //POKEHEARTGOLD_CONSTANTS_RGB_H
