#include "application/capsule_menu/defs.h"

int ov57_0223A07C(BallCapsule *capsule) {
    int i;
    int result = 0;
    int sealCount;
    SEAL *seal;

    sealCount = 0;

    for (i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        seal = CapsuleGetSealI(capsule, i);

        if (SealOnCapsuleGetID(seal) != 0) {
            sealCount++;
        }
    }

    if (sealCount != 0) {
        result = 1;
    }

    return result;
}
