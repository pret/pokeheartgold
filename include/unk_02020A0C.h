#ifndef POKEHEARTGOLD_UNK_02020A0C_H
#define POKEHEARTGOLD_UNK_02020A0C_H

#include "heap.h"

typedef struct DpadMenuBox {
    u8 left;
    u8 top;
    u8 width;
    u8 height;
    u8 buttonUp;
    u8 buttonDown;
    u8 buttonLeft;
    u8 buttonRight;
} DpadMenuBox;

void DpadMenuBox_GetPosition(const DpadMenuBox *dpadBoxes, u8 *px, u8 *py);
void DpadMenuBox_GetDimensions(const DpadMenuBox *dpadBoxes, u8 *pw, u8 *ph);
u8 DpadMenuBox_GetNeighborInDirection(const DpadMenuBox *dpadBoxes, u8 *px, u8 *py, u8 *pw, u8 *ph, u8 partyMonIndex, u8 direction);

#endif // POKEHEARTGOLD_UNK_02020A0C_H
