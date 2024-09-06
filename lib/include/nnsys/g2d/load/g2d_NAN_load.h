#ifndef NNSYS_G2D_LOAD_G2D_NAN_LOAD_H_
#define NNSYS_G2D_LOAD_G2D_NAN_LOAD_H_

#include <nnsys/g2d/fmt/g2d_Anim_data.h>

BOOL NNS_G2dGetUnpackedAnimBank(void *pNanrFile, NNSG2dAnimBankData **ppAnimBank);
BOOL NNS_G2dGetUnpackedMCAnimBank(void *pNanrFile, NNSG2dAnimBankData **ppAnimBank);
const NNSG2dAnimSequenceData *NNS_G2dGetAnimSequenceByIdx(const NNSG2dAnimBankData *pAnimBank, u16 idx);

#endif // NNSYS_G2D_LOAD_G2D_NAN_LOAD_H_
