#include "pokeathlon/pokeathlon.h"

extern void ov96_0220E22C(void);
extern void ov96_0220E2DC(void);
extern void ov96_0220E394(void);
extern void ov96_022117EC(void);
extern void ov96_02211870(void);
extern void ov96_02215984(void);
extern void ov96_022159F0(void);
extern void ov96_02215A70(void);

u8 ov96_0221DC80[] = {0x00, 0x04, 0x02, 0x01, 0x00, 0x01, 0x00, 0x01};

void* ov96_0221DC88[] = {
    ov96_022117EC,
    ov96_02211870
};

void* ov96_0221DC90[] = {
    ov96_02215984,
    ov96_022159F0,
    ov96_02215A70,
    NULL
};

//u8 _0221DCA0[0x900]; // Non-matching yet if moved here (not sure why)

u8 ov96_0221E5A0[4];
u8 ov96_0221E5A4[0x1c];
