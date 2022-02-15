#ifndef POKEHEARTGOLD_GYMMICK_H
#define POKEHEARTGOLD_GYMMICK_H

#define GYMMICK_NONE         0
#define GYMMICK_ECRUTEAK     1
#define GYMMICK_CIANWOOD     2
#define GYMMICK_VERMILION    3
#define GYMMICK_VIOLET       4
#define GYMMICK_AZALEA       5
#define GYMMICK_BLACKTHORN   6
#define GYMMICK_FUCHSIA      7
#define GYMMICK_VIRIDIAN     8
#define GYMMICK_SINJOH       9

union GymmickUnion {
    u8 raw[0x20];
    struct {
        u8 candles[4];
    } ecruteak;
    struct {
        BOOL winch;
    } cianwood;
    struct {
        u8 switches[2];
        u8 gates[2];
    } vermilion;
    struct {
        BOOL liftState;
    } violet;
    struct {
        u8 spiders[4];
        int switches;
    } azalea;
    struct {
        u16 x[3];
        u16 z[3];
        u8 rot[3];
    } blackthorn;
    u8 fuchsia; // unused
    u8 viridian; // unused
    struct {
        u32 choice;
    } sinjoh;
};

struct Gymmick {
    int kind;
    union GymmickUnion data;
};

void SavGymmick_Clear(struct Gymmick *gymmick);
union GymmickUnion *SavGymmick_Init(struct Gymmick *gymmick, int kind);
union GymmickUnion *SavGymmick_AssertMagic_GetData(struct Gymmick *gymmick, int kind);
int SavGymmick_GetType(struct Gymmick *gymmick);

#endif //POKEHEARTGOLD_GYMMICK_H
