#include "constants/maps.h"
#include "constants/sndseq.h"

#include "overlay_2/overlay_02_gear_phone.h"

#include "fieldmap.h"
#include "map_header.h"
#include "math_util.h"
#include "msgdata.h"
#include "phonebook_dat.h"
#include "sav_system_info.h"
#include "save_local_field_data.h"
#include "save_vars_flags.h"
#include "sound_radio.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "unk_02092BE8.h"

typedef struct UnkStruct_02253C86 {
    u8 unk0;
    u8 unk1;
    u16 unk2;
    u8 unk4;
    u8 unk5;
} UnkStruct_02253C86;

static const UnkStruct_02253C86 ov02_02253C84[] = {
    { 1,  0, 13,  0, 0 },
    { 1,  0, 7,   0, 0 },
    { 15, 0, 85,  1, 0 },
    { 9,  0, 93,  1, 0 },
    { 2,  0, 0,   0, 0 },
    { 6,  0, 0,   0, 0 },
    { 24, 0, 0,   0, 0 },
    { 24, 0, 142, 1, 0 },
    { 24, 0, 143, 1, 0 },
    { 24, 0, 144, 1, 0 },
    { 24, 0, 145, 1, 0 },
    { 24, 0, 146, 1, 0 },
    { 0,  0, 27,  0, 0 }
};

static u32 ov02_02251FDC(GearPhoneRingManager *gearPhone, PhoneBook *phoneBook, u32 mapId);
static u32 ov02_022521C0(GearPhoneRingManager *gearPhone, PhoneBook *phoneBook, u32 mapId);
static u8 ov02_02252218(GearPhoneRingManager *gearPhone, PhoneBook *phoneBook, u32 mapId);
static void ov02_022522AC(GearPhoneRingManager *gearPhone, BOOL a1);

String *GetPhoneBookEntryName(GearPhoneRingManager *gearPhone, enum HeapID heapID) {
    String *str;
    if (!gearPhone->active || gearPhone->callerId >= NUM_PHONE_CONTACTS) {
        str = String_New(8, heapID);
    } else {
        int phoneMsg = GetPhoneMessageGmm(gearPhone->callerId);
        MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, phoneMsg, heapID);
        str = NewString_ReadMsgData(msgData, 0);
        DestroyMsgData(msgData);
    }
    return str;
}

void GearPhoneRingManager_SetCallerParams(GearPhoneRingManager *gearPhone, u8 callerId, u8 a2, u8 a3, u8 isScriptedCall, u8 callScriptID) {
    // a4 set to 2 when passed from script
    // a5 related to message id? when passed from script
    if (callerId >= NUM_PHONE_CONTACTS) {
        gearPhone->callerId = 0xFF;
        gearPhone->unk_arr5[0] = 0xFF;
        gearPhone->unk_arr5[1] = 0;
        GF_ASSERT(FALSE);
    } else {
        gearPhone->callerId = callerId;
        gearPhone->unk_arr5[0] = a2;
        gearPhone->unk_arr5[1] = a3;
    }

    gearPhone->isScriptedCall = isScriptedCall;
    gearPhone->callScriptID = callScriptID;
}

u8 ov02_02251EE8(GearPhoneRingManager *gearPhone, Unk_PokegearSTRUCT_14 *a1) {
    MI_CpuFill8(a1, 0, 5);
    if (gearPhone->callerId >= NUM_PHONE_CONTACTS) {
        GF_ASSERT(FALSE);
        a1->unk_0 = 0xFF;
        return 0xFF;
    }
    a1->unk_0 = gearPhone->unk_arr5[0];
    a1->unk_1 = gearPhone->unk_arr5[1];
    a1->isScriptedCall = gearPhone->isScriptedCall;
    a1->callScriptID = gearPhone->callScriptID;
    a1->unk_2 = gearPhone->unk_var7;
    return gearPhone->callerId;
}

BOOL ov02_02251F20(GearPhoneRingManager *gearPhone) {
    Location *position = LocalFieldData_GetCurrentPosition(Save_LocalFieldData_Get(gearPhone->saveData));

    if (!MapHeader_CanReceivePhoneCalls(position->mapId)) {
        return FALSE;
    }

    if (gearPhone->active || gearPhone->unk_var8 < gearPhone->unk_varC) {
        return FALSE;
    }

    PhoneBook *phoneBook = AllocAndReadPhoneBook(HEAP_ID_FIELD1);
    u32 var = ov02_022521C0(gearPhone, phoneBook, position->mapId);
    if (var) {
        FreePhoneBook(phoneBook);
        if (var == 2) {
            gearPhone->sys->unkD2_7 = 1;
            StartMapSceneScript(gearPhone->sys, 0x7FF, 0);
            return TRUE;
        }
        ov02_022522AC(gearPhone, 1);
        return FALSE;
    }
    u32 rand = MTRandom() % 100;

    if (rand > gearPhone->unk_var12) {
        FreePhoneBook(phoneBook);
        gearPhone->unk_var8 = 0;
        return FALSE;
    }

    var = ov02_02251FDC(gearPhone, phoneBook, position->mapId);
    FreePhoneBook(phoneBook);

    if (var == 0) {
        gearPhone->unk_var8 = 0;
    }
    return FALSE;
}

#ifdef NONMATCHING
// FIXME: https://decomp.me/scratch/KW1m7 down to stack swaps between bugContestFlag and var -adrienn
static u32 ov02_02251FDC(GearPhoneRingManager *gearPhone, PhoneBook *phoneBook, u32 mapId) {
    u8 ret;
    u8 var;
    u8 bugContestFlag;
    PhoneContact *contact;

    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(gearPhone->saveData);
    Save_PlayerData_GetProfile(gearPhone->saveData);
    SAVE_MISC_DATA *miscData = Save_Misc_Get(gearPhone->saveData);
    u32 slot = SavePokegear_FindEmptyPhonebookSlot(gearPhone->pokegearData);
    contact = SavePokegear_AllocAndCopyPhonebook(gearPhone->pokegearData, HEAP_ID_FIELD1);
    u8 *ptr = Heap_AllocAtEnd(HEAP_ID_FIELD1, slot);
    MI_CpuFill8(ptr, 0xFF, slot);
    u16 rand = LCRandom() % 1000;

    if (rand < 500) {
        var = 0;
    } else if (rand < 800) {
        var = 1;
    } else {
        var = 2;
    }

    u8 index = 0;
    for (u8 i = 0; i < slot; i++) {
        u8 id = contact[i].id;
        if (phoneBook->entries[id].unkF == var) {
            // doesn't match with a switch statement
            if (phoneBook->entries[id].type == 0 || phoneBook->entries[id].type == 12 || phoneBook->entries[id].type == 11 || phoneBook->entries[id].type == 10 || phoneBook->entries[id].type == 14) {
                ptr[index++] = id;
            }
        }
    }

    if (index == 0) {
        Heap_Free(contact);
        Heap_Free(ptr);
        return 0;
    }

    MI_CpuFill8(contact, 0xFF, slot);
    SysInfo_RTC *rtc = Save_SysInfo_RTC_Get(gearPhone->saveData);
    u8 hour = rtc->time.hour;
    bugContestFlag = Save_VarsFlags_CheckBugContestFlag(varsFlags);
    ret = 0;

    if (sub_0202AAD4(miscData, var) == index) {
        sub_0202AA9C(miscData, var);
    }

    for (u8 j = 0; j < index; j++) {
        if (mapId == phoneBook->entries[ptr[j]].mapId || sub_0202AA44(miscData, var, ptr[j]) || (ptr[j] == 8 && (sub_02095FF8(hour) || Save_VarsFlags_IsInRocketTakeover(varsFlags)))) {
            continue;
        }
        if (phoneBook->entries[ptr[j]].mapId != MAP_NATIONAL_PARK || !bugContestFlag) {
            contact[ret++].id = ptr[j];
        }
    }

    if (ret != 0) {
        slot = (MTRandom() % (ret * 100));
        rand = slot / 100;
        GearPhoneRingManager_SetCallerParams(gearPhone, contact[(u8)rand].id, var, index, 0, 0);
        GearPhoneRingManager_StartRinging(gearPhone);
        ov02_022522AC(gearPhone, 1);
    }

    Heap_Free(contact);
    Heap_Free(ptr);

    return ret;
}
#else
// clang-format off
extern u32 _u32_div_f(u32 a1, u32 a2);
extern s32 _s32_div_f(s32 a1, s32 a2);
asm static u32 ov02_02251FDC(GearPhoneRingManager *gearPhone, PhoneBook *phoneBook, u32 mapId) {
    push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r0, [sp, #8]
	ldr r0, [r0, #0x38]
	add r6, r1, #0
	str r2, [sp, #0xc]
	bl Save_VarsFlags_Get
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x38]
	bl Save_PlayerData_GetProfile
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x38]
	bl Save_Misc_Get
	str r0, [sp, #0x18]
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x30]
	bl SavePokegear_FindEmptyPhonebookSlot
	str r0, [sp, #0x2c]
	ldr r0, [sp, #8]
	mov r1, #4
	ldr r0, [r0, #0x30]
	bl SavePokegear_AllocAndCopyPhonebook
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x2c]
	mov r0, #4
	bl Heap_AllocAtEnd
	ldr r2, [sp, #0x2c]
	mov r1, #0xff
	add r4, r0, #0
	bl MI_CpuFill8
	bl LCRandom
	mov r1, #0xfa
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r1, r0, #0x10
	mov r0, #0x7d
	lsl r0, r0, #2
	cmp r1, r0
	bhs _02252046
	mov r0, #0
	str r0, [sp, #0x24]
	b _02252058
_02252046:
	mov r0, #0x32
	lsl r0, r0, #4
	cmp r1, r0
	bhs _02252054
	mov r0, #1
	str r0, [sp, #0x24]
	b _02252058
_02252054:
	mov r0, #2
	str r0, [sp, #0x24]
_02252058:
	ldr r0, [sp, #0x2c]
	mov r7, #0
	add r2, r7, #0
	cmp r0, #0
	bls _022520A2
_02252062:
	ldr r0, [sp, #0x20]
	mov r1, #0x14
	ldrb r3, [r0, r2]
	ldr r0, [r6, #4]
	mul r1, r3
	add r5, r0, r1
	ldrb r1, [r5, #0xf]
	ldr r0, [sp, #0x24]
	cmp r0, r1
	bne _02252096
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _0225208C
	cmp r0, #0xc
	beq _0225208C
	cmp r0, #0xb
	beq _0225208C
	cmp r0, #0xa
	beq _0225208C
	cmp r0, #0xe
	bne _02252096
_0225208C:
	add r1, r7, #1
	add r0, r7, #0
	lsl r1, r1, #0x18
	lsr r7, r1, #0x18
	strb r3, [r4, r0]
_02252096:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, [sp, #0x2c]
	cmp r2, r0
	blo _02252062
_022520A2:
	cmp r7, #0
	bne _022520B8
	ldr r0, [sp, #0x20]
	bl Heap_Free
	add r0, r4, #0
	bl Heap_Free
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022520B8:
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x2c]
	mov r1, #0xff
	bl MI_CpuFill8
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x38]
	bl Save_SysInfo_RTC_Get
	ldr r0, [r0, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	bl Save_VarsFlags_CheckBugContestFlag
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	bl sub_0202AAD4
	cmp r0, r7
	bne _022520F6
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	bl sub_0202AA9C
_022520F6:
	mov r5, #0
	cmp r7, #0
	bls _02252164
_022520FC:
	ldrb r2, [r4, r5]
	mov r1, #0x14
	ldr r0, [r6, #4]
	mul r1, r2
	add r0, r0, r1
	ldrh r1, [r0, #6]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	beq _0225215A
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	bl sub_0202AA44
	cmp r0, #0
	bne _0225215A
	ldrb r0, [r4, r5]
	cmp r0, #8
	bne _02252134
	ldr r0, [sp, #0x14]
	bl sub_02095FF8
	cmp r0, #0
	bne _0225215A
	ldr r0, [sp, #0x1c]
	bl Save_VarsFlags_IsInRocketTakeover
	cmp r0, #0
	bne _0225215A
_02252134:
	ldrb r1, [r4, r5]
	mov r2, #0x14
	ldr r0, [r6, #4]
	mul r2, r1
	add r0, r0, r2
	ldrh r0, [r0, #6]
	cmp r0, #0x60
	bne _0225214A
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0225215A
_0225214A:
	ldr r0, [sp, #0x28]
	add r2, r0, #0
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	str r2, [sp, #0x28]
	ldr r2, [sp, #0x20]
	strb r1, [r2, r0]
_0225215A:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, r7
	blo _022520FC
_02252164:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _022521AC
	bl MTRandom
	ldr r2, [sp, #0x28]
	mov r1, #0x64
	mul r1, r2
	bl _u32_div_f
	add r0, r1, #0
	mov r1, #0x64
	bl _u32_div_f
	add r1, r0, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	mov r0, #0
	lsl r1, r1, #0x18
	str r0, [sp]
	lsr r2, r1, #0x18
	str r0, [sp, #4]
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #8]
	ldrb r1, [r1, r2]
	ldr r2, [sp, #0x24]
	add r3, r7, #0
	bl GearPhoneRingManager_SetCallerParams
	ldr r0, [sp, #8]
	bl GearPhoneRingManager_StartRinging
	ldr r0, [sp, #8]
	mov r1, #1
	bl ov02_022522AC
_022521AC:
	ldr r0, [sp, #0x20]
	bl Heap_Free
	add r0, r4, #0
	bl Heap_Free
	ldr r0, [sp, #0x28]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
}
// clang-format on
#endif

static u32 ov02_022521C0(GearPhoneRingManager *gearPhone, PhoneBook *phoneBook, u32 mapId) {
    u8 r6 = ov02_02252218(gearPhone, phoneBook, mapId);
    if (r6 == 0xFF) {
        return FALSE;
    }
    GearPhoneRingManager_SetCallerParams(gearPhone, ov02_02253C84[r6].unk0, 0xFF, 0, 3, ov02_02253C84[r6].unk2);
    GearPhoneRingManager_StartRinging(gearPhone);
    gearPhone->unk_var7 = r6;
    return ov02_02253C84[r6].unk4 + 1;
}

// FIXME: This is a fakematch from decomp.me, it doesn't match locally without the label https://decomp.me/scratch/YdDak
static u8 ov02_02252218(GearPhoneRingManager *gearPhone, PhoneBook *phoneBook, u32 mapId) {
    u8 *ptr = Heap_AllocAtEnd(HEAP_ID_FIELD1, 13);
    MI_CpuFill8(ptr, 0, 13);

    int cnt = 0;
    for (int i = 0; i < 13; i++) {
        if (sub_0202F08C(gearPhone->savingsData, i) == 0) {
            continue;
        }
        PhoneBookEntry *entry = &phoneBook->entries[ov02_02253C84[i].unk0];
        if (entry->id == PHONE_CONTACT_DAY_C_MAN) {
            if (SavePokegear_IsNumberRegistered(gearPhone->pokegearData, PHONE_CONTACT_DAY_C_MAN) != 0xFF) {
                // had to do this to match
                goto LABEL;
            } else {
                continue;
            }
        } else if (entry->mapId == mapId) {
            continue;
        }
LABEL:
        ptr[cnt++] = i;
    }

    if (cnt == 0) {
        Heap_Free(ptr);
        return 0xFF;
    }

    u8 ret = ptr[LCRandom() % cnt];
    Heap_Free(ptr);
    return ret;
}

static void ov02_022522AC(GearPhoneRingManager *gearPhone, BOOL a1) {
    GearPhone_ToggleRinging(gearPhone, a1);
}

int GetRadioMusicPlayingSeq(void) {
    u16 seq = SndRadio_GetSeqNo();
    switch (seq) {
    case SEQ_GS_RADIO_MARCH:
    case SEQ_GS_P_RADIO_MARCH:
        return 1;
    case SEQ_GS_RADIO_KOMORIUTA:
    case SEQ_GS_P_RADIO_KOMORIUTA:
        return 2;
    case SEQ_GS_RADIO_R_101:
        return 3;
    case SEQ_GS_RADIO_R_201:
        return 4;
    case SEQ_GS_RADIO_UNKNOWN:
        return 6;
    case SEQ_GS_HUE:
    case SEQ_GS_P_HUE:
        return 5;
    }
    return 0;
}
