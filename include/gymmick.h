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

struct Gymmick {
    int kind;
    union {
        u8 raw[0x20];
        struct {

        };
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
    };
};

#endif //POKEHEARTGOLD_GYMMICK_H
