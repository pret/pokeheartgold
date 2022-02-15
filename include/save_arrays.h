#ifndef POKEHEARTGOLD_SAVE_ARRAYS_H
#define POKEHEARTGOLD_SAVE_ARRAYS_H

typedef u32 (*SAVESIZEFN)(void);
typedef void (*SAVEINITFN)(void *);

struct SaveChunkHeader {
    int id;
    u32 block;
    SAVESIZEFN sizeFunc;
    SAVEINITFN initFunc;
};

struct ExtraSaveChunkHeader {
    int id;
    u32 sector;
    SAVESIZEFN sizeFunc;
    SAVEINITFN initFunc;
};

extern const struct SaveChunkHeader _020F64C4[];
extern const int _020F6460;

extern const struct ExtraSaveChunkHeader _020F6464[];
extern const int _020F645C;

#endif //POKEHEARTGOLD_SAVE_ARRAYS_H
