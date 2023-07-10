#pragma thumb off
// Prepare to switch the definition of FX_MulFx64c
#ifdef FX_Mul32x64c
#undef FX_Mul32x64c
#endif
// Prepare to switch the definition of MATH_CountLeadingZeros
#ifdef MATH_CountLeadingZeros
#undef MATH_CountLeadingZeros
#endif
// Because CPU is in ARM mode, inline versions are used.
#define FX_Mul32x64c(v32, v64c)        FX_Mul32x64cInline(v32, v64c)
#define MATH_CountLeadingZeros(x)      MATH_CountLeadingZerosInline(x)
