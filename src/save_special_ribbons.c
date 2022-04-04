#include "save_special_ribbons.h"
#include "save.h"
#include "constants/save_arrays.h"

u32 Save_SpecialRibbons_sizeof(void) {
    return sizeof(SaveSpecialRibbons);
}

void Save_SpecialRibbons_init(SaveSpecialRibbons* argP) {
    memset(argP, 0, sizeof(SaveSpecialRibbons));
}

SaveSpecialRibbons* Save_SpecialRibbons_get(SAVEDATA* data) {
    return SavArray_get(data, SAVE_SPECIAL_RIBBONS);
}
