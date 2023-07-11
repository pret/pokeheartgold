#include "global.h"
#include "save_special_ribbons.h"
#include "save.h"
#include "constants/save_arrays.h"

u32 Save_SpecialRibbons_sizeof(void) {
    return sizeof(SaveSpecialRibbons);
}

void Save_SpecialRibbons_Init(SaveSpecialRibbons* argP) {
    memset(argP, 0, sizeof(SaveSpecialRibbons));
}

SaveSpecialRibbons* Save_SpecialRibbons_Get(SaveData* data) {
    return SaveArray_Get(data, SAVE_SPECIAL_RIBBONS);
}
