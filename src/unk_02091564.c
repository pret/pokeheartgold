#include "unk_02091564.h"

#include "unk_02033AE0.h"
#include "unk_02056D7C.h"
#include "unk_02058034.h"
#include "unk_02056D7C.h"
#include "unk_02058AEC.h"
#include "unk_0205A44C.h"
#include "scrcmd_20.h"
#include "scrcmd_battle_castle.h"
#include "scrcmd_battle_arcade.h"
#include "main.h"
#include "oaks_speech.h"

FS_EXTERN_OVERLAY(OVY_53);
const OverlayManagerTemplate gApplication_OakSpeech = {OakSpeech_Init, OakSpeech_Main, OakSpeech_Exit, FS_OVERLAY_ID(OVY_53)};

static const UnkStruct_02091564 sUnkTable_02106078[] = {
    { sub_020576C0, sub_02057798, NULL },
    { sub_0205779C, sub_02057A08, NULL },
    { sub_02091570, sub_020342C4, NULL },
    { sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_0205776C, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_020573AC, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_020588CC, sub_02091588, sub_020588DC},
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02057D50, sub_020342C4, NULL },
	{ sub_02058720, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_0205A408, PlayerProfile_sizeof, NULL },
	{ sub_0205A430, sub_020342C4, NULL },
	{ sub_0205A40C, sub_020342C4, NULL },
	{ sub_0205A4C4, sub_020342C4, NULL },
	{ sub_0205A410, sub_020342C0, NULL },
	{ sub_0205A44C, sub_020342C4, NULL },
	{ sub_0205A46C, sub_020342C0, NULL },
	{ sub_0205A498, sub_02091588, sub_0205A4B4},
	{ sub_02059AE4, sub_02059B08, sub_02059B18},
	{ sub_02059B34, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C0, NULL },
	{ sub_02091570, sub_020915A8, NULL },
	{ sub_02091570, sub_020342C0, NULL },
	{ sub_02091570, sub_020342C0, NULL },
	{ sub_02091570, sub_020342C0, NULL },
	{ sub_02091570, sub_02091590, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_02091598, NULL },
	{ sub_02091570, sub_020915A0, NULL },
	{ sub_02091570, sub_020915A4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C4, NULL },
	{ sub_02091570, sub_020342C0, NULL },
	{ sub_02091570, sub_020342C0, NULL },
	{ sub_02091570, sub_020915AC, NULL },
	{ sub_02091570, sub_020342C0, NULL },
	{ sub_02091570, sub_020342C0, NULL },
	{ sub_02091570, sub_020342C0, NULL },
	{ sub_02091570, sub_02091564, NULL },
	{ sub_02091570, sub_02091568, NULL },
	{ sub_0204F85C, sub_020342B8, NULL },
	{ sub_0204FE58, sub_020342B8, NULL },
	{ sub_02050398, sub_020342B8, NULL }
};

s32 sub_02091564() {
    return 24;
}

s32 sub_02091568() {
    return 89 << 4;
}

void sub_02091570(void) {}

void sub_02091574(void* arg0) {
	sub_0203410C(&sUnkTable_02106078, sizeof(sUnkTable_02106078) / sizeof(sUnkTable_02106078[0]), arg0);
}

s32 sub_02091588(void) {
    return 0x0000066c;
}

s32 sub_02091590(void) {
    return 47 << 6;
}

s32 sub_02091598(void) {
    return 63 << 4;
}

s32 sub_020915A0() {
    return 10;
}

s32 sub_020915A4() {
    return 50;
}

s32 sub_020915A8()
{
    return 4;
}

s32 sub_020915AC()
{
    return 4;
}
