#ifndef POKEHEARTGOLD_WINDOW_H
#define POKEHEARTGOLD_WINDOW_H

typedef struct WINDOWTEMPLATE {
    u8 bgId;
    u8 left;
    u8 top;
    u8 width;
    u8 height;
    u8 palette;
    u16 baseBlock;
} WINDOWTEMPLATE;

typedef struct WINDOW {
    // TODO
    u8 filler[16];
} WINDOW;

#endif //POKEHEARTGOLD_WINDOW_H
