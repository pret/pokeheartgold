#ifndef POKEHEARTGOLD_STRING_H
#define POKEHEARTGOLD_STRING_H

typedef struct STRING {
    u16 maxsize;
    u16 size;
    u32 magic;
    u16 data[1];
    u8 padding[2];
} STRING;

void String_dtor(STRING *string);

#endif //POKEHEARTGOLD_STRING_H
