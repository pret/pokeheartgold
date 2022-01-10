#include <math.h>
#include "fx.h"

long long MakeFix(const struct FxConst *constdef) {
    double ret_di, ret_df, value_abs;
    long long ret_ii, ret_if, ret_val;

    if (constdef->value == 0) {
        return 0LL;
    }

    value_abs = constdef->value < 0 ? -constdef->value : constdef->value;
    ret_di = floor(value_abs);
    ret_df = value_abs - ret_di;
    ret_ii = (long long)value_abs * (1LL << constdef->fxtype->fracpart);
    ret_if = (long long)(ret_df * (double)(1LL << constdef->fxtype->fracpart) + 0.5);
    ret_ii &= ~((1LL << constdef->fxtype->fracpart) - 1);
    ret_if &= (1LL << constdef->fxtype->fracpart) - 1;
    ret_val = ret_ii + ret_if;
    if (constdef->value < 0) {
        ret_val = -ret_val;
    }
    return ret_val;
}

int GetFxWidth(const struct FxSpec *fxtype) {
    return fxtype->fracpart + fxtype->intpart + 1;
}
