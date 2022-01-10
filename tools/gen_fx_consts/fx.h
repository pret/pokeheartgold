#ifndef GUARD_FX_H
#define GUARD_FX_H

struct FxSpec {
    const char *name;
    int intpart;
    int fracpart;
};

struct FxConst {
    const char *name;
    const struct FxSpec *fxtype;
    double value;
};

extern const struct FxConst gFxConstTable[];
extern const int gNFxConstTable;

// Generates the integer value of the fixed-point value represented by FxConst*
long long MakeFix(const struct FxConst *constdef);

// For FxSpec*, get the width in bits.
int GetFxWidth(const struct FxSpec *fxtype);

#endif //GUARD_FX_H
