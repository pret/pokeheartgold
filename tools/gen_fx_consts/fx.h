#ifndef GUARD_FX_H
#define GUARD_FX_H

#include <string.h>

struct FxSpec {
    const char *name;
    int intpart;
    int fracpart;
};

struct FxConst {
    char *name;
    const struct FxSpec *fxtype;
    double value;
};

extern struct FxConst *gFxConstTable;
extern size_t gNFxConstTable;

// Init and delete the above two objects
void FxConstTableInit(void);
void FxConstTableEnd(void);

// Generates the integer value of the fixed-point value represented by FxConst*
long long MakeFix(const struct FxConst *constdef);

// For FxSpec*, get the width in bits.
int GetFxWidth(const struct FxSpec *fxtype);

#endif //GUARD_FX_H
