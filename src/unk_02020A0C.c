#include "unk_02020A0C.h"

void DpadMenuBox_GetPosition(const DpadMenuBox *dpadBoxes, u8 *px, u8 *py) {
    *px = dpadBoxes->left;
    *py = dpadBoxes->top;
}

void DpadMenuBox_GetDimensions(const DpadMenuBox *dpadBoxes, u8 *pw, u8 *ph) {
    *pw = dpadBoxes->width;
    *ph = dpadBoxes->height;
}

u8 DpadMenuBox_GetNeighborInDirection(const DpadMenuBox *dpadBoxes, u8 *px, u8 *py, u8 *pw, u8 *ph, u8 partyMonIndex, u8 direction) {
    u8 neighbor = partyMonIndex;
    switch (direction) {
    case 0:
        neighbor = dpadBoxes[neighbor].buttonUp;
        break;
    case 1:
        neighbor = dpadBoxes[neighbor].buttonDown;
        break;
    case 2:
        neighbor = dpadBoxes[neighbor].buttonLeft;
        break;
    case 3:
        neighbor = dpadBoxes[neighbor].buttonRight;
        break;
    }
    if (px != NULL) {
        *px = dpadBoxes[neighbor].left;
    }
    if (py != NULL) {
        *py = dpadBoxes[neighbor].top;
    }
    if (pw != NULL) {
        *pw = dpadBoxes[neighbor].width;
    }
    if (ph != NULL) {
        *ph = dpadBoxes[neighbor].height;
    }
    return neighbor;
}
