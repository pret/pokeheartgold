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

typedef union GymmickUnion {
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
} GymmickUnion;

typedef struct Gymmick {
    int kind;
    GymmickUnion data;
} Gymmick;

void Save_Gymmick_Clear(Gymmick *gymmick);
GymmickUnion *Save_Gymmick_Init(Gymmick *gymmick, int kind);
GymmickUnion *Save_Gymmick_AssertMagic_GetData(Gymmick *gymmick, int kind);
int Save_Gymmick_GetType(Gymmick *gymmick);

#endif //POKEHEARTGOLD_GYMMICK_H
