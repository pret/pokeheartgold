#ifndef POKEHEARTGOLD_UNK_02019014_H
#define POKEHEARTGOLD_UNK_02019014_H

#include "unk_02022D74.h"

typedef struct GFCameraTranslationWrapper {
    GF_Camera *camera;
    u8 duration;
    u8 step;
    u8 unk_06;
    u8 active;
    u16 unk_08;
    u16 unk_0A;
    VecFx32 unk_0C;
    int unk_18; // returned from sub_02023614
    VecFx32 unk_1C;
    u8 filler_28[0x8];
    void *unk_30; // returned from sub_0200E320
} GFCameraTranslationWrapper;

struct CameraTranslationPathTemplate {
    u16 unk_0;
    u16 unk_2;
    VecFx32 unk_4;
    u32 unk_10;
};

GFCameraTranslationWrapper *CreateCameraTranslationWrapper(HeapID heapId, GF_Camera *camera);
void DeleteCameraTranslationWrapper(GFCameraTranslationWrapper *wrapper);
void SetCameraTranslationPath(GFCameraTranslationWrapper *wrapper, struct CameraTranslationPathTemplate *template, int duration);
u8 IsCameraTranslationFinished(GFCameraTranslationWrapper *wrapper);

#endif //POKEHEARTGOLD_UNK_02019014_H
