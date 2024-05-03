#include "filesystem.h"
#include "global.h"
#include "unk_02007FD8.h"
#include "poketool/pokegra/otherpoke.naix"

void sub_02009CD0(void *pRawCharData);

UnkStruct_02007FD4 *sub_02007FD4(HeapID heapId) {
    UnkStruct_02007FD4 *ret = AllocFromHeap(heapId, sizeof(UnkStruct_02007FD4));
    MI_CpuClearFast(ret, sizeof(UnkStruct_02007FD4));
    ret->unk_2E8 = heapId;
    ret->unk_330 = 0;
    ret->unk_2EC = 0;
    ret->unk_2F0 = 0x8000;
    ret->unk_2F4 = 0;
    ret->unk_2F8 = 0x80;
    ret->unk_2FC = AllocFromHeap(heapId, 0x8000);
    ret->unk_300 = AllocFromHeap(heapId, 0xC0);
    MI_CpuClearFast(ret->unk_300, 4);
    ret->unk_304 = AllocFromHeap(heapId, 0xC0);
    MI_CpuClearFast(ret->unk_304, 4);
    for (int i = 0; i < 4; ++i) {
        MI_CpuClearFast(&ret->unk_000[i], sizeof(UnkStruct_02007FD4_sub));
    }
    NNS_G2dSetupSoftwareSpriteCamera();
    ret->unk_333 = 0;

    NNSG2dCharacterData *charData;
    u8 *pRawCharData;
    void *pNcgrFile = AllocAndReadWholeNarcMemberByIdPair(NARC_poketool_pokegra_otherpoke, NARC_otherpoke_259_NCGR, ret->unk_2E8);  // shadow.png
    NNS_G2dGetUnpackedCharacterData(pNcgrFile, &charData);
    ret->unk_30C = charData->pixelFmt;
    ret->unk_310 = charData->mapingType;
    ret->unk_314 = charData->characterFmt;
    pRawCharData = charData->pRawData;
    sub_02009CD0(pRawCharData);
    MI_CpuFill8(ret->unk_2FC, *pRawCharData, 0x8000);
    for (int i = 0; i < 80; ++i) {
        for (int j = 0; j < 40; ++j) {
            int dstOffs = 0x5050 + 0x80 * i + j;
            int srcOffs = 0x50 * i + j;
            ret->unk_2FC[dstOffs] = pRawCharData[srcOffs];
        }
    }
    FreeToHeap(pNcgrFile);
    ret->unk_331 = 1;
    ret->unk_332 = 1;
    return ret;
}

// void sub_02008120(UnkStruct_02007FD4 *r5) {
//     sub_020094FC(r5);
//     sub_0200994C(r5);
//     NNS_G3dGeFlushBuffer();
//     G3_PushMtx();
//     G3_TexImageParam(r5->unk_2B0.attr.fmt, GX_TEXGEN_TEXCOORD, r5->unk_2B0.attr.sizeS, r5->unk_2B0.attr.sizeT, GX_TEXREPEAT_NONE, GX_TEXFLIP_NONE, r5->unk_2B0.attr.plttUse, r5->unk_2EC);
//     for (int i = 0; i < 4; ++i) {
//         if (r5->unk_000[i].unk_00_00 && !r5->unk_000[i].unk_24.unk_30_00 && !r5->unk_000[i].unk_24.unk_30_0B) {
//             if (r5->unk_000[i].unk_68 != NULL) {
//                 r5->unk_000[i].unk_68(&r5->unk_000[i], &r5->unk_000[i].unk_24);
//             }
//             NNS_G3dGeFlushBuffer();
//             if (r5->unk_333 != 1) {
//                 G3_Identity();
//             }
//             sub_0200925C(&r5->unk_000[i]);
//         }
//     }
// }
