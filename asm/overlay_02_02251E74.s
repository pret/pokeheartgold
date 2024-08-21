#include "constants/abilities.h"
#include "constants/species.h"
#include "constants/sndseq.h"
#include "constants/items.h"
#include "constants/pokemon.h"
#include "constants/std_script.h"
	.include "asm/macros.inc"
	.include "overlay_02.inc"
	.include "global.inc"

	.text

	thumb_func_start GetPhoneBookEntryName
GetPhoneBookEntryName: ; 0x02251E74
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r0]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	beq _02251E86
	ldrb r0, [r0, #2]
	cmp r0, #0x4b
	blo _02251E92
_02251E86:
	mov r0, #8
	add r1, r4, #0
	bl String_New
	add r5, r0, #0
	b _02251EB2
_02251E92:
	bl GetPhoneMessageGmm
	add r2, r0, #0
	mov r0, #1
	mov r1, #0x1b
	add r3, r4, #0
	bl NewMsgDataFromNarc
	add r4, r0, #0
	mov r1, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, #0
	bl DestroyMsgData
_02251EB2:
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end GetPhoneBookEntryName

	thumb_func_start ov02_02251EB8
ov02_02251EB8: ; 0x02251EB8
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0x4b
	blo _02251ED0
	mov r0, #0xff
	strb r0, [r4, #2]
	strb r0, [r4, #5]
	mov r0, #0
	strb r0, [r4, #6]
	bl GF_AssertFail
	b _02251ED6
_02251ED0:
	strb r1, [r4, #2]
	strb r2, [r4, #5]
	strb r3, [r4, #6]
_02251ED6:
	ldr r0, _02251EE4 ; =0xFFFFFFF8
	add r0, sp
	ldrb r1, [r0, #0x10]
	strb r1, [r4, #3]
	ldrb r0, [r0, #0x14]
	strb r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
_02251EE4: .word 0xFFFFFFF8
	thumb_func_end ov02_02251EB8

	thumb_func_start ov02_02251EE8
ov02_02251EE8: ; 0x02251EE8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0
	mov r2, #5
	bl MI_CpuFill8
	ldrb r0, [r5, #2]
	cmp r0, #0x4b
	blo _02251F08
	bl GF_AssertFail
	mov r0, #0xff
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02251F08:
	ldrb r0, [r5, #5]
	strb r0, [r4]
	ldrb r0, [r5, #6]
	strb r0, [r4, #1]
	ldrb r0, [r5, #3]
	strb r0, [r4, #3]
	ldrb r0, [r5, #4]
	strb r0, [r4, #4]
	ldrb r0, [r5, #7]
	strb r0, [r4, #2]
	ldrb r0, [r5, #2]
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02251EE8

	thumb_func_start ov02_02251F20
ov02_02251F20: ; 0x02251F20
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x38]
	bl Save_LocalFieldData_Get
	bl LocalFieldData_GetCurrentPosition
	add r4, r0, #0
	ldr r0, [r4]
	bl MapHeader_GetField14_1E
	cmp r0, #0
	bne _02251F3E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02251F3E:
	ldrb r0, [r5]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _02251F4E
	ldr r1, [r5, #8]
	ldr r0, [r5, #0xc]
	cmp r1, r0
	bge _02251F52
_02251F4E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02251F52:
	mov r0, #4
	bl AllocAndReadPhoneBook
	add r6, r0, #0
	ldr r2, [r4]
	add r0, r5, #0
	add r1, r6, #0
	bl ov02_022521C0
	add r7, r0, #0
	beq _02251F9C
	add r0, r6, #0
	bl FreePhoneBook
	cmp r7, #2
	bne _02251F90
	ldr r2, [r5, #0x3c]
	add r0, r2, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x80
	add r2, #0xd2
	orr r0, r1
	strb r0, [r2]
	ldr r0, [r5, #0x3c]
	ldr r1, _02251FD8 ; =0x000007FF
	mov r2, #0
	bl StartMapSceneScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02251F90:
	add r0, r5, #0
	mov r1, #1
	bl ov02_022522AC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02251F9C:
	bl MTRandom
	mov r1, #0x64
	bl _u32_div_f
	ldrh r0, [r5, #0x12]
	cmp r1, r0
	bls _02251FB8
	add r0, r6, #0
	bl FreePhoneBook
	mov r0, #0
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02251FB8:
	ldr r2, [r4]
	add r0, r5, #0
	add r1, r6, #0
	bl ov02_02251FDC
	add r4, r0, #0
	add r0, r6, #0
	bl FreePhoneBook
	cmp r4, #0
	bne _02251FD2
	mov r0, #0
	str r0, [r5, #8]
_02251FD2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02251FD8: .word 0x000007FF
	thumb_func_end ov02_02251F20

	thumb_func_start ov02_02251FDC
ov02_02251FDC: ; 0x02251FDC
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
	bl Save_PlayerData_GetProfileAddr
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x38]
	bl Save_Misc_Get
	str r0, [sp, #0x18]
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x30]
	bl GSPlayerMisc_FindEmptyGearPhonebookSlot
	str r0, [sp, #0x2c]
	ldr r0, [sp, #8]
	mov r1, #4
	ldr r0, [r0, #0x30]
	bl GSPlayerMisc_AllocAndCopyPhonebook
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x2c]
	mov r0, #4
	bl AllocFromHeapAtEnd
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
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
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
	bl ov02_02251EB8
	ldr r0, [sp, #8]
	bl sub_02092DF4
	ldr r0, [sp, #8]
	mov r1, #1
	bl ov02_022522AC
_022521AC:
	ldr r0, [sp, #0x20]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [sp, #0x28]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02251FDC

	thumb_func_start ov02_022521C0
ov02_022521C0: ; 0x022521C0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	bl ov02_02252218
	add r6, r0, #0
	cmp r6, #0xff
	bne _022521D6
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_022521D6:
	mov r0, #6
	add r4, r6, #0
	mul r4, r0
	mov r0, #3
	str r0, [sp]
	ldr r0, _0225220C ; =ov02_02253C86
	ldr r1, _02252210 ; =ov02_02253C84
	ldrh r0, [r0, r4]
	ldrb r1, [r1, r4]
	mov r2, #0xff
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	mov r3, #0
	bl ov02_02251EB8
	add r0, r5, #0
	bl sub_02092DF4
	ldr r0, _02252214 ; =ov02_02253C88
	strb r6, [r5, #7]
	ldrb r0, [r0, r4]
	add r0, r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0225220C: .word ov02_02253C86
_02252210: .word ov02_02253C84
_02252214: .word ov02_02253C88
	thumb_func_end ov02_022521C0

	thumb_func_start ov02_02252218
ov02_02252218: ; 0x02252218
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	str r1, [sp]
	mov r0, #4
	mov r1, #0xd
	str r2, [sp, #4]
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0xd
	str r0, [sp, #8]
	bl MI_CpuFill8
	mov r5, #0
	ldr r6, _022522A8 ; =ov02_02253C84
	add r4, r5, #0
_0225223A:
	lsl r1, r4, #0x18
	ldr r0, [r7, #0x34]
	lsr r1, r1, #0x18
	bl sub_0202F08C
	cmp r0, #0
	beq _02252276
	ldr r0, [sp]
	mov r1, #0x14
	ldr r2, [r0, #4]
	ldrb r0, [r6]
	mul r1, r0
	add r0, r2, r1
	ldrb r1, [r2, r1]
	cmp r1, #6
	bne _02252268
	ldr r0, [r7, #0x30]
	mov r1, #6
	bl GSPlayerMisc_IsGearNumberRegistered
	cmp r0, #0xff
	beq _02252276
	b _02252270
_02252268:
	ldrh r1, [r0, #6]
	ldr r0, [sp, #4]
	cmp r1, r0
	beq _02252276
_02252270:
	ldr r0, [sp, #8]
	strb r4, [r0, r5]
	add r5, r5, #1
_02252276:
	add r4, r4, #1
	add r6, r6, #6
	cmp r4, #0xd
	blt _0225223A
	cmp r5, #0
	bne _0225228E
	ldr r0, [sp, #8]
	bl FreeToHeap
	add sp, #0xc
	mov r0, #0xff
	pop {r4, r5, r6, r7, pc}
_0225228E:
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	ldr r0, [sp, #8]
	ldrb r4, [r0, r1]
	bl FreeToHeap
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022522A8: .word ov02_02253C84
	thumb_func_end ov02_02252218

	thumb_func_start ov02_022522AC
ov02_022522AC: ; 0x022522AC
	ldr r3, _022522B0 ; =GearPhone_ToggleRinging
	bx r3
	.balign 4, 0
_022522B0: .word GearPhone_ToggleRinging
	thumb_func_end ov02_022522AC

	thumb_func_start GetRadioMusicPlayingSeq
GetRadioMusicPlayingSeq: ; 0x022522B4
	push {r3, lr}
	bl SndRadio_GetSeqNo
	lsl r0, r0, #0x10
	ldr r2, _0225232C ; =SEQ_GS_RADIO_R_201
	lsr r0, r0, #0x10
	cmp r0, r2
	bgt _022522F0
	bge _0225231C
	add r1, r2, #0
	sub r1, #SEQ_GS_RADIO_R_201-SEQ_GS_HUE
	cmp r0, r1
	bgt _022522E8
	sub r2, #SEQ_GS_RADIO_R_201-SEQ_GS_RADIO_KOMORIUTA
	sub r1, r0, r2
	bmi _02252328
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022522E0: ; jump table
	.short _02252314 - _022522E0 - 2 ; case SEQ_GS_RADIO_KOMORIUTA
	.short _02252310 - _022522E0 - 2 ; case SEQ_GS_RADIO_MARCH
	.short _02252320 - _022522E0 - 2 ; case SEQ_GS_RADIO_UNKNOWN
	.short _02252324 - _022522E0 - 2 ; case SEQ_GS_HUE
_022522E8:
	ldr r1, _02252330 ; =SEQ_GS_RADIO_R_101
	cmp r0, r1
	beq _02252318
	b _02252328
_022522F0:
	add r1, r2, #0
	add r1, #SEQ_GS_P_RADIO_MARCH-SEQ_GS_RADIO_R_201
	cmp r0, r1
	bgt _02252308
	add r1, r2, #0
	add r1, #SEQ_GS_P_RADIO_MARCH-SEQ_GS_RADIO_R_201
	cmp r0, r1
	bge _02252310
	add r2, #SEQ_GS_P_RADIO_KOMORIUTA-SEQ_GS_RADIO_R_201
	cmp r0, r2
	beq _02252314
	b _02252328
_02252308:
	add r2, #SEQ_GS_P_HUE-SEQ_GS_RADIO_R_201
	cmp r0, r2
	beq _02252324
	b _02252328
_02252310:
	mov r0, #1
	pop {r3, pc}
_02252314:
	mov r0, #2
	pop {r3, pc}
_02252318:
	mov r0, #3
	pop {r3, pc}
_0225231C:
	mov r0, #4
	pop {r3, pc}
_02252320:
	mov r0, #6
	pop {r3, pc}
_02252324:
	mov r0, #5
	pop {r3, pc}
_02252328:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0225232C: .word SEQ_GS_RADIO_R_201
_02252330: .word SEQ_GS_RADIO_R_101
	thumb_func_end GetRadioMusicPlayingSeq

	thumb_func_start ov02_02252334
ov02_02252334: ; 0x02252334
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	bne _0225234A
	mov r0, #0
	pop {r4, r5, r6, pc}
_0225234A:
	add r0, r5, #0
	bl FollowMon_IsActive
	cmp r0, #0
	beq _022523B0
	add r0, r5, #0
	add r0, #0xf4
	ldr r1, [r0]
	mov r0, #0x7b
	lsl r0, r0, #2
	cmp r1, r0
	bne _022523B0
	ldr r0, [r5, #0xc]
	bl SaveArray_Party_Get
	bl GetFirstAliveMonInParty_CrashIfNone
	add r6, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0xf4
	ldr r0, [r0]
	cmp r4, r0
	beq _02252392
	bl GF_AssertFail
_02252392:
	add r0, r5, #0
	add r0, #0xf4
	ldr r0, [r0]
	cmp r4, r0
	beq _022523A0
	mov r0, #0
	pop {r4, r5, r6, pc}
_022523A0:
	add r5, #0xfc
	ldrh r0, [r5]
	cmp r0, #1
	bne _022523B0
	cmp r6, #0
	bne _022523B0
	mov r0, #1
	pop {r4, r5, r6, pc}
_022523B0:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02252334

	thumb_func_start ov02_022523B4
ov02_022523B4: ; 0x022523B4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	ldr r1, _022523CC ; =ov02_022523D0
	add r0, r4, #0
	bl TaskManager_Call
	pop {r4, pc}
	.balign 4, 0
_022523CC: .word ov02_022523D0
	thumb_func_end ov02_022523B4

	thumb_func_start ov02_022523D0
ov02_022523D0: ; 0x022523D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetFieldSystem
	add r4, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnvironment
	add r6, r0, #0
	ldr r0, [r5]
	cmp r0, #4
	bls _022523F4
	b _02252524
_022523F4:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02252400: ; jump table
	.short _0225240A - _02252400 - 2 ; case 0
	.short _02252426 - _02252400 - 2 ; case 1
	.short _0225246E - _02252400 - 2 ; case 2
	.short _022524D2 - _02252400 - 2 ; case 3
	.short _022524EE - _02252400 - 2 ; case 4
_0225240A:
	add r0, r4, #0
	bl FollowMon_GetMapObject
	bl MapObject_UnpauseMovement
	ldr r0, [r4, #0x10]
	ldr r1, _0225252C ; =ov01_02205A60
	mov r2, #0
	bl TaskManager_Call
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252524
_02252426:
	add r0, r4, #0
	bl FollowMon_GetMapObject
	add r1, sp, #0
	bl MapObject_GetPositionVec
	add r0, r4, #0
	bl FollowMon_IsVisible
	cmp r0, #0
	beq _0225244A
	ldr r0, [r4, #0x44]
	add r1, sp, #0
	bl ov01_022052C4
	str r0, [r6, #4]
	mov r0, #1
	b _0225244E
_0225244A:
	mov r0, #0
	str r0, [r6, #4]
_0225244E:
	str r0, [r6, #8]
	add r0, r4, #0
	mov r2, #0
	mov r1, #0x7b
	str r2, [r6]
	add r4, #0xfb
	add r0, #0xe4
	ldrb r3, [r4]
	ldr r0, [r0]
	lsl r1, r1, #2
	bl FollowMon_SetObjectParams
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252524
_0225246E:
	ldr r0, [r6, #8]
	cmp r0, #0
	beq _02252490
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	cmp r0, #4
	blt _02252524
	add r4, #0xe4
	ldr r0, [r4]
	ldr r1, _02252530 ; =0x000003CE
	bl ov01_021FA930
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252524
_02252490:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_GetManager
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_GetSpriteID
	add r7, r0, #0
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl sub_0205E420
	add r2, r4, #0
	add r2, #0xe4
	ldr r2, [r2]
	add r0, r6, #0
	add r1, r7, #0
	bl ov01_021FA108
	add r4, #0xe4
	ldr r0, [r4]
	ldr r1, _02252530 ; =0x000003CE
	bl sub_0205E38C
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252524
_022524D2:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl ov01_021FA2D4
	cmp r0, #0
	bne _02252524
	mov r0, #0
	add r4, #0xfc
	strh r0, [r4]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252524
_022524EE:
	ldr r0, [r6, #4]
	mov r5, #0
	cmp r0, #0
	bne _022524FA
	mov r5, #1
	b _0225250A
_022524FA:
	bl ov01_022052F4
	cmp r0, #0
	beq _0225250A
	ldr r0, [r6, #4]
	bl sub_02068B48
	mov r5, #1
_0225250A:
	cmp r5, #0
	beq _02252524
	add r0, r6, #0
	bl FreeToHeap
	add r0, r4, #0
	bl FollowMon_GetMapObject
	bl MapObject_PauseMovement
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02252524:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225252C: .word ov01_02205A60
_02252530: .word 0x000003CE
	thumb_func_end ov02_022523D0

	thumb_func_start ov02_02252534
ov02_02252534: ; 0x02252534
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0xf4
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	mov r2, #0xf4
	bl MI_CpuFill8
	str r5, [r4, #8]
	ldr r0, [r5, #0x10]
	ldr r1, _02252558 ; =ov02_0225255C
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02252558: .word ov02_0225255C
	thumb_func_end ov02_02252534

	thumb_func_start ov02_0225255C
ov02_0225255C: ; 0x0225255C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetFieldSystem
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #5
	bls _0225257E
	b _02252698
_0225257E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225258A: ; jump table
	.short _02252596 - _0225258A - 2 ; case 0
	.short _022525B4 - _0225258A - 2 ; case 1
	.short _022525EA - _0225258A - 2 ; case 2
	.short _0225260C - _0225258A - 2 ; case 3
	.short _02252638 - _0225258A - 2 ; case 4
	.short _0225266E - _0225258A - 2 ; case 5
_02252596:
	mov r1, #4
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	ldr r3, _022526C4 ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252698
_022525B4:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252698
	add r0, r4, #0
	bl ov02_02252898
	ldr r0, [r4, #8]
	bl FollowMon_GetMapObject
	mov r1, #1
	bl sub_02069DC8
	mov r0, #4
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr r3, _022526C4 ; =0x00007FFF
	mov r0, #3
	mov r2, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252698
_022525EA:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252698
	ldr r0, [r4, #8]
	bl FollowMon_GetMapObject
	bl sub_0205F484
	add r0, r4, #0
	mov r1, #1
	add r0, #0xf0
	strb r1, [r0]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252698
_0225260C:
	add r1, r4, #0
	add r1, #0xf2
	ldrb r1, [r1]
	add r2, r1, #1
	add r1, r4, #0
	add r1, #0xf2
	strb r2, [r1]
	add r1, r4, #0
	add r1, #0xf2
	ldrb r1, [r1]
	cmp r1, #0x1e
	blo _02252698
	bl ov02_022526C8
	add r0, r4, #0
	mov r1, #0
	add r0, #0xf2
	strb r1, [r0]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252698
_02252638:
	add r0, #0xf2
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xf2
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xf2
	ldrb r0, [r0]
	cmp r0, #0x50
	blo _02252698
	mov r0, #0x1e
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	ldr r3, _022526C4 ; =0x00007FFF
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252698
_0225266E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252698
	add r0, r4, #0
	bl ov02_022526EC
	cmp r0, #0
	beq _02252698
	add r0, r4, #0
	bl ov02_0225296C
	add r0, r4, #4
	bl ov01_021F46DC
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_02252698:
	add r0, r4, #0
	add r0, #0xf0
	ldrb r0, [r0]
	cmp r0, #0
	beq _022526AA
	add r0, r4, #0
	add r0, #0x2c
	bl ov02_022529C4
_022526AA:
	add r0, r4, #0
	add r0, #0xf1
	ldrb r0, [r0]
	cmp r0, #0
	beq _022526BC
	add r4, #0x68
	add r0, r4, #0
	bl Field3dObject_Draw
_022526BC:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_022526C4: .word 0x00007FFF
	thumb_func_end ov02_0225255C

	thumb_func_start ov02_022526C8
ov02_022526C8: ; 0x022526C8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #3
	mov r1, #0xd
	bl ov01_021F467C
	str r0, [r4, #4]
	ldr r0, _022526E8 ; =ov02_022526FC
	add r1, r4, #0
	mov r2, #0
	bl SysTask_CreateOnMainQueue
	mov r0, #0
	strb r0, [r4, #2]
	pop {r4, pc}
	nop
_022526E8: .word ov02_022526FC
	thumb_func_end ov02_022526C8

	thumb_func_start ov02_022526EC
ov02_022526EC: ; 0x022526EC
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _022526F6
	mov r0, #1
	bx lr
_022526F6:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov02_022526EC

	thumb_func_start ov02_022526FC
ov02_022526FC: ; 0x022526FC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0xee
	ldrh r0, [r0]
	cmp r0, #0
	beq _02252716
	cmp r0, #1
	beq _02252746
	add sp, #0xc
	pop {r4, r5, pc}
_02252716:
	ldr r3, _02252760 ; =ov02_02253CE0
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #8]
	ldr r0, [r0, #0x24]
	bl Camera_GetPerspectiveAngle
	add r1, sp, #0
	strh r0, [r1, #8]
	add r0, r4, #0
	add r1, sp, #0
	bl ov02_02252764
	add r0, r4, #0
	add r0, #0xee
	ldrh r0, [r0]
	add r4, #0xee
	add sp, #0xc
	add r0, r0, #1
	strh r0, [r4]
	pop {r4, r5, pc}
_02252746:
	add r0, r4, #0
	bl ov02_02252888
	cmp r0, #0
	beq _0225275A
	mov r0, #1
	strb r0, [r4, #2]
	add r0, r5, #0
	bl SysTask_Destroy
_0225275A:
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02252760: .word ov02_02253CE0
	thumb_func_end ov02_022526FC

	thumb_func_start ov02_02252764
ov02_02252764: ; 0x02252764
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0
	strb r1, [r5, #3]
	add r0, #0xe6
	strh r1, [r0]
	add r0, r5, #0
	ldr r1, [r4]
	add r0, #0xe0
	str r1, [r0]
	add r0, r5, #0
	ldrh r1, [r5]
	add r0, #0xe4
	strh r1, [r0]
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x24]
	bl Camera_GetPerspectiveAngle
	add r1, r5, #0
	add r1, #0xea
	strh r0, [r1]
	add r0, r5, #0
	ldrh r1, [r4, #8]
	add r0, #0xec
	mov r2, #1
	strh r1, [r0]
	add r0, r5, #0
	ldr r1, [r4, #4]
	add r0, #0xe8
	strh r1, [r0]
	ldr r0, _022527AC ; =ov02_0225286C
	add r1, r5, #0
	bl SysTask_CreateOnMainQueue
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022527AC: .word ov02_0225286C
	thumb_func_end ov02_02252764

	thumb_func_start ov02_022527B0
ov02_022527B0: ; 0x022527B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	ldr r3, _02252864 ; =ov02_02253CD4
	add r5, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #4
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x24]
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xe6
	ldrh r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0xe6
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0xe6
	ldrh r6, [r0]
	add r0, r5, #0
	add r0, #0xe8
	ldrh r7, [r0]
	add r0, r5, #0
	add r0, #0xea
	ldrh r4, [r0]
	add r0, r5, #0
	add r0, #0xec
	ldrh r0, [r0]
	sub r1, r0, r4
	add r0, r1, #0
	mul r0, r6
	add r1, r7, #0
	bl _s32_div_f
	add r4, r0, r4
	add r0, r5, #0
	add r0, #0xe0
	ldr r1, [r0]
	add r0, r1, #0
	mul r0, r6
	add r1, r7, #0
	bl _s32_div_f
	add r1, r5, #0
	add r1, #0xe4
	ldrh r1, [r1]
	ldr r3, _02252868 ; =FX_SinCosTable_
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0x10
	bl MTX_RotZ33_
	add r0, sp, #4
	add r1, sp, #0x10
	add r2, sp, #0x34
	bl MTX_MultVec33
	ldr r1, [sp]
	add r0, sp, #0x34
	bl Camera_SetLookAtCamUp
	lsl r0, r4, #0x10
	ldr r1, [sp]
	lsr r0, r0, #0x10
	bl Camera_SetPerspectiveAngle
	add r0, r5, #0
	add r0, #0xe6
	add r5, #0xe8
	ldrh r1, [r0]
	ldrh r0, [r5]
	cmp r1, r0
	blo _0225285E
	add sp, #0x40
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225285E:
	mov r0, #0
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02252864: .word ov02_02253CD4
_02252868: .word FX_SinCosTable_
	thumb_func_end ov02_022527B0

	thumb_func_start ov02_0225286C
ov02_0225286C: ; 0x0225286C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov02_022527B0
	cmp r0, #0
	beq _02252886
	mov r0, #1
	strb r0, [r4, #3]
	add r0, r5, #0
	bl SysTask_Destroy
_02252886:
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0225286C

	thumb_func_start ov02_02252888
ov02_02252888: ; 0x02252888
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _02252892
	mov r0, #1
	bx lr
_02252892:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov02_02252888

	thumb_func_start ov02_02252898
ov02_02252898: ; 0x02252898
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	ldr r3, _02252968 ; =ov02_02253CEC
	str r0, [sp, #8]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x1c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #4
	str r0, [r2]
	ldr r0, [sp, #8]
	mov r2, #0x20
	add r0, #0xc
	bl GF_ExpHeap_FndInitAllocator
	ldr r0, [sp, #8]
	mov r1, #0xae
	add r0, #0x1c
	mov r2, #0x4b
	mov r3, #4
	bl Field3dModel_LoadFromFilesystem
	ldr r0, [sp, #8]
	ldr r4, [sp, #8]
	ldr r7, [sp, #8]
	str r0, [sp, #0xc]
	add r0, #0x1c
	mov r5, #0
	add r4, #0xc
	add r7, #0x2c
	str r0, [sp, #0xc]
_022528D6:
	mov r0, #4
	str r0, [sp]
	mov r0, #0x14
	mul r0, r5
	str r4, [sp, #4]
	lsl r6, r5, #2
	add r3, sp, #0x1c
	ldr r1, [sp, #0xc]
	ldr r3, [r3, r6]
	add r0, r7, r0
	mov r2, #0xae
	bl Field3dModelAnimation_LoadFromFilesystem
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _022528D6
	ldr r0, [sp, #8]
	ldr r1, [sp, #8]
	add r0, #0x68
	add r1, #0x1c
	bl Field3dObject_InitFromModel
	ldr r6, [sp, #8]
	ldr r4, [sp, #8]
	mov r5, #0
	add r6, #0x68
	add r4, #0x2c
	mov r7, #0x14
_02252912:
	add r1, r5, #0
	mul r1, r7
	add r0, r6, #0
	add r1, r4, r1
	bl Field3dObject_AddAnimation
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _02252912
	ldr r0, [sp, #8]
	mov r1, #1
	add r0, #0x68
	bl Field3dObject_SetActiveFlag
	ldr r0, [sp, #8]
	mov r1, #0
	add r0, #0x2c
	bl ov02_022529A0
	ldr r0, [sp, #8]
	ldr r0, [r0, #8]
	bl FollowMon_GetMapObject
	add r1, sp, #0x10
	bl MapObject_GetPositionVec
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	add r0, #0x68
	bl Field3dObject_SetPosEx
	ldr r0, [sp, #8]
	mov r1, #1
	add r0, #0xf1
	str r0, [sp, #8]
	strb r1, [r0]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02252968: .word ov02_02253CEC
	thumb_func_end ov02_02252898

	thumb_func_start ov02_0225296C
ov02_0225296C: ; 0x0225296C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r6, r0, #0
	str r0, [sp]
	mov r5, #0
	add r4, #0x2c
	add r6, #0xc
	mov r7, #0x14
_0225297C:
	add r0, r5, #0
	mul r0, r7
	add r0, r4, r0
	add r1, r6, #0
	bl Field3dModelAnimation_Unload
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _0225297C
	ldr r0, [sp]
	add r0, #0x1c
	str r0, [sp]
	bl Field3dModel_Unload
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0225296C

	thumb_func_start ov02_022529A0
ov02_022529A0: ; 0x022529A0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	mov r7, #0x14
_022529AA:
	add r0, r4, #0
	mul r0, r7
	add r0, r5, r0
	add r1, r6, #0
	bl Field3dModelAnimation_FrameSet
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _022529AA
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_022529A0

	thumb_func_start ov02_022529C4
ov02_022529C4: ; 0x022529C4
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r6, r0, #0
	add r4, r5, #0
	mov r7, #0x14
_022529CE:
	add r0, r4, #0
	mul r0, r7
	mov r1, #1
	add r0, r6, r0
	lsl r1, r1, #0xc
	bl Field3dModelAnimation_FrameAdvanceAndCheck
	cmp r0, #0
	beq _022529E6
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_022529E6:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _022529CE
	cmp r5, #3
	bne _022529F8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022529F8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_022529C4

	thumb_func_start ov02_022529FC
ov02_022529FC: ; 0x022529FC
	push {r3, r4, r5, lr}
	mov r1, #0x8a
	add r5, r0, #0
	mov r0, #0xb
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
	mov r2, #0x8a
	add r4, r0, #0
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	str r5, [r4]
	ldr r0, [r5, #0x10]
	ldr r1, _02252A24 ; =ov02_02252A28
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02252A24: .word ov02_02252A28
	thumb_func_end ov02_022529FC

	thumb_func_start ov02_02252A28
ov02_02252A28: ; 0x02252A28
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetFieldSystem
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	add r4, r0, #0
	ldr r0, [r5]
	cmp r0, #5
	bhi _02252B3A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02252A54: ; jump table
	.short _02252A60 - _02252A54 - 2 ; case 0
	.short _02252A80 - _02252A54 - 2 ; case 1
	.short _02252AAC - _02252A54 - 2 ; case 2
	.short _02252AD2 - _02252A54 - 2 ; case 3
	.short _02252AF2 - _02252A54 - 2 ; case 4
	.short _02252B20 - _02252A54 - 2 ; case 5
_02252A60:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r1, #0
	str r0, [sp, #8]
	ldr r3, _02252B94 ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252B3A
_02252A80:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252B3A
	add r0, r4, #0
	bl ov02_02252BA4
	mov r0, #2
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r3, _02252B94 ; =0x00007FFF
	mov r0, #3
	mov r2, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252B3A
_02252AAC:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252B3A
	mov r2, #0x89
	lsl r2, r2, #2
	mov r1, #1
	strb r1, [r4, r2]
	add r0, r2, #3
	mov r3, #0
	sub r2, #0x78
	strb r3, [r4, r0]
	add r0, r4, r2
	bl Field3dObject_SetActiveFlag
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252B3A
_02252AD2:
	ldr r1, _02252B98 ; =0x00000227
	ldrb r0, [r4, r1]
	add r0, r0, #1
	strb r0, [r4, r1]
	ldrb r0, [r4, r1]
	cmp r0, #0x64
	blo _02252B3A
	mov r2, #1
	sub r0, r1, #2
	strb r2, [r4, r0]
	mov r0, #0
	strb r0, [r4, r1]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252B3A
_02252AF2:
	ldr r0, _02252B98 ; =0x00000227
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #0x96
	blo _02252B3A
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r1, #0
	str r0, [sp, #8]
	ldr r3, _02252B94 ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252B3A
_02252B20:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252B3A
	add r0, r4, #0
	bl ov02_02252DF8
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_02252B3A:
	mov r0, #0x89
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _02252B58
	add r0, r4, #0
	add r0, #0x34
	mov r1, #2
	bl ov02_02252EA8
	add r0, r4, #0
	add r0, #0x5c
	mov r1, #2
	bl ov02_02252EA8
_02252B58:
	ldr r0, _02252B9C ; =0x00000225
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _02252B6A
	sub r0, #0xa1
	add r0, r4, r0
	mov r1, #2
	bl ov02_02252EA8
_02252B6A:
	ldr r0, _02252BA0 ; =0x00000226
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _02252B8C
	add r0, r4, #0
	add r0, #0x84
	bl Field3dObject_Draw
	add r0, r4, #0
	add r0, #0xfc
	bl Field3dObject_Draw
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r4, r0
	bl Field3dObject_Draw
_02252B8C:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02252B94: .word 0x00007FFF
_02252B98: .word 0x00000227
_02252B9C: .word 0x00000225
_02252BA0: .word 0x00000226
	thumb_func_end ov02_02252A28

	thumb_func_start ov02_02252BA4
ov02_02252BA4: ; 0x02252BA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	ldr r3, _02252DEC ; =ov02_02253D14
	add r2, sp, #0x40
	str r0, [sp, #8]
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, _02252DF0 ; =ov02_02253CF8
	ldr r1, [r0, #4]
	ldr r2, [r0]
	str r1, [sp, #0x30]
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	str r2, [sp, #0x2c]
	str r0, [sp, #0x28]
	ldr r0, [sp, #8]
	str r1, [sp, #0x24]
	add r0, r0, #4
	mov r1, #4
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	ldr r4, [sp, #8]
	mov r5, #0
	add r4, #0x14
	mov r7, #0xae
	add r6, sp, #0x24
_02252BDE:
	lsl r2, r5, #2
	lsl r0, r5, #4
	ldr r2, [r6, r2]
	add r0, r4, r0
	add r1, r7, #0
	mov r3, #4
	bl Field3dModel_LoadFromFilesystem
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252BDE
	mov r1, #0x5d
	ldr r0, [sp, #8]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0xae
	mov r2, #0x55
	mov r3, #4
	bl Field3dModel_LoadFromFilesystem
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	add r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	str r0, [sp, #0x14]
	add r0, #0x14
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	str r0, [sp, #0x18]
	add r0, #0x34
	str r0, [sp, #0x18]
_02252C24:
	ldr r0, [sp, #0x10]
	mov r5, #0
	lsl r1, r0, #3
	add r0, sp, #0x40
	add r6, r0, r1
	ldr r0, [sp, #0x10]
	add r1, r0, #0
	lsl r7, r0, #4
	mov r0, #0x28
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x18]
	add r4, r0, r2
_02252C3E:
	mov r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x14]
	str r0, [sp, #4]
	mov r0, #0x14
	lsl r3, r5, #2
	mul r0, r5
	ldr r3, [r6, r3]
	add r0, r4, r0
	add r1, r1, r7
	mov r2, #0xae
	bl Field3dModelAnimation_LoadFromFilesystem
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252C3E
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	cmp r0, #2
	blo _02252C24
	ldr r0, [sp, #8]
	mov r1, #0x61
	lsl r1, r1, #2
	mov r5, #0
	add r4, r0, #4
	add r7, r0, r1
_02252C7E:
	mov r0, #4
	str r0, [sp]
	mov r0, #0x14
	mov r1, #0x5d
	mul r0, r5
	ldr r2, [sp, #8]
	lsl r1, r1, #2
	add r1, r2, r1
	lsl r6, r5, #2
	add r3, sp, #0x2c
	ldr r3, [r3, r6]
	add r0, r7, r0
	mov r2, #0xae
	str r4, [sp, #4]
	bl Field3dModelAnimation_LoadFromFilesystem
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252C7E
	ldr r4, [sp, #8]
	ldr r6, [sp, #8]
	mov r5, #0
	add r4, #0x84
	add r6, #0x14
	mov r7, #0x78
_02252CB4:
	add r0, r5, #0
	mul r0, r7
	lsl r1, r5, #4
	add r0, r4, r0
	add r1, r6, r1
	bl Field3dObject_InitFromModel
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252CB4
	mov r2, #0x6b
	ldr r0, [sp, #8]
	lsl r2, r2, #2
	add r0, r0, r2
	ldr r1, [sp, #8]
	sub r2, #0x38
	add r1, r1, r2
	bl Field3dObject_InitFromModel
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r7, [sp, #8]
	str r0, [sp, #0x20]
	add r0, #0x34
	str r0, [sp, #0x20]
	add r7, #0x84
_02252CEE:
	ldr r1, [sp, #0xc]
	mov r0, #0x28
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x20]
	add r6, r1, #0
	add r4, r0, r2
	mov r0, #0x78
	mov r5, #0
	mul r6, r0
_02252D02:
	mov r1, #0x14
	mul r1, r5
	add r0, r7, r6
	add r1, r4, r1
	bl Field3dObject_AddAnimation
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252D02
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	cmp r0, #2
	blo _02252CEE
	mov r6, #0x6b
	lsl r6, r6, #2
	add r1, r6, #0
	ldr r0, [sp, #8]
	sub r1, #0x28
	mov r5, #0
	add r4, r0, r1
	mov r7, #0x14
_02252D36:
	ldr r0, [sp, #8]
	add r1, r5, #0
	mul r1, r7
	add r0, r0, r6
	add r1, r4, r1
	bl Field3dObject_AddAnimation
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252D36
	ldr r4, [sp, #8]
	ldr r6, [sp, #8]
	mov r5, #0
	add r4, #0x84
	add r6, #0x34
	mov r7, #0x28
_02252D5A:
	mov r0, #0x78
	mul r0, r5
	add r0, r4, r0
	mov r1, #1
	bl Field3dObject_SetActiveFlag
	add r0, r5, #0
	mul r0, r7
	add r0, r6, r0
	mov r1, #2
	mov r2, #0
	bl ov02_02252E80
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252D5A
	mov r1, #0x6b
	ldr r0, [sp, #8]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0
	bl Field3dObject_SetActiveFlag
	mov r1, #0x61
	ldr r0, [sp, #8]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #2
	mov r2, #0
	bl ov02_02252E80
	ldr r0, [sp, #8]
	ldr r0, [r0]
	bl FollowMon_GetMapObject
	add r1, sp, #0x34
	bl MapObject_GetPositionVec
	ldr r4, [sp, #8]
	mov r5, #0
	add r4, #0x84
	mov r6, #0x78
_02252DB2:
	add r0, r5, #0
	mul r0, r6
	ldr r1, [sp, #0x34]
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x3c]
	add r0, r4, r0
	bl Field3dObject_SetPosEx
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252DB2
	mov r1, #0x6b
	ldr r0, [sp, #8]
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r1, [sp, #0x34]
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x3c]
	bl Field3dObject_SetPosEx
	ldr r1, _02252DF4 ; =0x00000226
	ldr r0, [sp, #8]
	mov r2, #1
	strb r2, [r0, r1]
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02252DEC: .word ov02_02253D14
_02252DF0: .word ov02_02253CF8
_02252DF4: .word 0x00000226
	thumb_func_end ov02_02252BA4

	thumb_func_start ov02_02252DF8
ov02_02252DF8: ; 0x02252DF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	str r0, [sp, #8]
	add r0, #0x14
	str r0, [sp, #8]
	add r0, r5, #0
	str r0, [sp, #4]
	add r0, #0x34
	str r0, [sp, #4]
	mov r7, #0x14
_02252E14:
	ldr r1, [sp]
	mov r0, #0x28
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #4]
	mov r4, #0
	add r6, r0, r2
_02252E22:
	add r0, r4, #0
	mul r0, r7
	add r0, r6, r0
	add r1, r5, #4
	bl Field3dModelAnimation_Unload
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _02252E22
	ldr r0, [sp]
	lsl r1, r0, #4
	ldr r0, [sp, #8]
	add r0, r0, r1
	bl Field3dModel_Unload
	ldr r0, [sp]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	cmp r0, #2
	blo _02252E14
	mov r0, #0x61
	lsl r0, r0, #2
	mov r4, #0
	add r6, r5, r0
	mov r7, #0x14
_02252E5C:
	add r0, r4, #0
	mul r0, r7
	add r0, r6, r0
	add r1, r5, #4
	bl Field3dModelAnimation_Unload
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _02252E5C
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r5, r0
	bl Field3dModel_Unload
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_02252DF8

	thumb_func_start ov02_02252E80
ov02_02252E80: ; 0x02252E80
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	mov r4, #0
	cmp r5, #0
	bls _02252EA4
_02252E8E:
	mov r0, #0x14
	mul r0, r4
	add r0, r6, r0
	add r1, r7, #0
	bl Field3dModelAnimation_FrameSet
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r5
	blo _02252E8E
_02252EA4:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02252E80

	thumb_func_start ov02_02252EA8
ov02_02252EA8: ; 0x02252EA8
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r6, r1, #0
	add r7, r0, #0
	add r4, r5, #0
	cmp r6, #0
	bls _02252ED8
_02252EB6:
	mov r0, #0x14
	mul r0, r4
	mov r1, #1
	add r0, r7, r0
	lsl r1, r1, #0xc
	bl Field3dModelAnimation_FrameAdvanceAndCheck
	cmp r0, #0
	beq _02252ECE
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_02252ECE:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blo _02252EB6
_02252ED8:
	cmp r5, r6
	bne _02252EE0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02252EE0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02252EA8

	thumb_func_start ov02_02252EE4
ov02_02252EE4: ; 0x02252EE4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	mov r1, #0xf0
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	mov r1, #0
	mov r2, #0xf0
	bl MI_CpuFill8
	add r0, r6, #0
	str r5, [r6]
	add r0, #0xef
	strb r4, [r0]
	ldr r0, [r5, #0x10]
	ldr r1, _02252F10 ; =ov02_02252F14
	add r2, r6, #0
	bl TaskManager_Call
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02252F10: .word ov02_02252F14
	thumb_func_end ov02_02252EE4

	thumb_func_start ov02_02252F14
ov02_02252F14: ; 0x02252F14
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetFieldSystem
	add r0, r5, #0
	bl TaskManager_GetEnvironment
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #4
	bhi _02252FD4
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02252F40: ; jump table
	.short _02252F4A - _02252F40 - 2 ; case 0
	.short _02252F6A - _02252F40 - 2 ; case 1
	.short _02252F96 - _02252F40 - 2 ; case 2
	.short _02252FB6 - _02252F40 - 2 ; case 3
	.short _02252FC4 - _02252F40 - 2 ; case 4
_02252F4A:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r1, #0
	str r0, [sp, #8]
	ldr r3, _02253008 ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02252FD4
_02252F6A:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252FD4
	add r0, r5, #0
	bl ov02_0225300C
	mov r0, #2
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r3, _02253008 ; =0x00007FFF
	mov r0, #3
	mov r2, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02252FD4
_02252F96:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252FD4
	add r0, r5, #0
	mov r1, #1
	add r0, #0xec
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #0
	add r0, #0xed
	strb r1, [r0]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02252FD4
_02252FB6:
	add r0, #0xed
	ldrb r0, [r0]
	cmp r0, #0
	beq _02252FD4
	add r0, r1, #1
	str r0, [r4]
	b _02252FD4
_02252FC4:
	bl ov02_02253108
	add r0, r5, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_02252FD4:
	add r0, r5, #0
	add r0, #0xec
	ldrb r0, [r0]
	cmp r0, #0
	beq _02252FEE
	add r0, r5, #0
	add r0, #0x24
	mov r1, #4
	bl ov02_02252EA8
	add r1, r5, #0
	add r1, #0xed
	strb r0, [r1]
_02252FEE:
	add r0, r5, #0
	add r0, #0xee
	ldrb r0, [r0]
	cmp r0, #0
	beq _02253000
	add r5, #0x74
	add r0, r5, #0
	bl Field3dObject_Draw
_02253000:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02253008: .word 0x00007FFF
	thumb_func_end ov02_02252F14

	thumb_func_start ov02_0225300C
ov02_0225300C: ; 0x0225300C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	ldr r4, _02253100 ; =ov02_02253D24
	add r7, r0, #0
	add r3, sp, #0x2c
	mov r2, #6
_02253018:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02253018
	ldr r3, _02253104 ; =ov02_02253D08
	add r2, sp, #0x20
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #4
	str r0, [r2]
	add r0, r7, #4
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r2, r7, #0
	add r2, #0xef
	ldrb r2, [r2]
	add r0, r7, #0
	add r0, #0x14
	lsl r3, r2, #2
	add r2, sp, #0x20
	ldr r2, [r2, r3]
	mov r1, #0xae
	mov r3, #4
	bl Field3dModel_LoadFromFilesystem
	add r0, r7, #4
	str r0, [sp, #0x10]
	add r0, r7, #0
	str r0, [sp, #8]
	add r0, #0x24
	str r0, [sp, #8]
	add r0, r7, #0
	str r0, [sp, #0xc]
	add r0, #0x14
	mov r4, #0
	str r0, [sp, #0xc]
_02253064:
	mov r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x10]
	add r3, r7, #0
	str r0, [sp, #4]
	add r3, #0xef
	ldrb r3, [r3]
	mov r0, #0x14
	add r1, r4, #0
	mul r1, r0
	ldr r0, [sp, #8]
	lsl r6, r3, #4
	add r3, sp, #0x2c
	add r0, r0, r1
	lsl r5, r4, #2
	add r3, r3, r6
	ldr r1, [sp, #0xc]
	ldr r3, [r5, r3]
	mov r2, #0xae
	bl Field3dModelAnimation_LoadFromFilesystem
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02253064
	add r0, r7, #0
	add r1, r7, #0
	add r0, #0x74
	add r1, #0x14
	bl Field3dObject_InitFromModel
	add r6, r7, #0
	add r5, r7, #0
	mov r4, #0
	add r6, #0x74
	add r5, #0x24
_022530AE:
	mov r1, #0x14
	mul r1, r4
	add r0, r6, #0
	add r1, r5, r1
	bl Field3dObject_AddAnimation
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _022530AE
	add r0, r7, #0
	add r0, #0x74
	mov r1, #1
	bl Field3dObject_SetActiveFlag
	add r0, r7, #0
	add r0, #0x24
	mov r1, #4
	mov r2, #0
	bl ov02_02252E80
	ldr r0, [r7]
	bl FollowMon_GetMapObject
	add r1, sp, #0x14
	bl MapObject_GetPositionVec
	add r0, r7, #0
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r0, #0x74
	bl Field3dObject_SetPosEx
	mov r0, #1
	add r7, #0xee
	strb r0, [r7]
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_02253100: .word ov02_02253D24
_02253104: .word ov02_02253D08
	thumb_func_end ov02_0225300C

	thumb_func_start ov02_02253108
ov02_02253108: ; 0x02253108
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r5, #0
	mov r4, #0
	add r6, #0x24
	mov r7, #0x14
_02253114:
	add r0, r4, #0
	mul r0, r7
	add r0, r6, r0
	add r1, r5, #4
	bl Field3dModelAnimation_Unload
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02253114
	add r5, #0x14
	add r0, r5, #0
	bl Field3dModel_Unload
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02253108

	thumb_func_start ov02_02253134
ov02_02253134: ; 0x02253134
	push {r3, r4, r5, r6, r7, lr}
	bl Save_FashionData_Get
	bl Save_FashionData_GetFashionCase
	ldr r6, _02253168 ; =ov02_02253D54
	add r5, r0, #0
	mov r4, #0
	mov r7, #1
_02253146:
	ldrb r1, [r6, r4]
	add r0, r5, #0
	add r2, r7, #0
	bl sub_0202BA2C
	cmp r0, #1
	bne _02253158
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02253158:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0x27
	blo _02253146
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02253168: .word ov02_02253D54
	thumb_func_end ov02_02253134

	thumb_func_start ov02_0225316C
ov02_0225316C: ; 0x0225316C
	push {r3, lr}
	bl LCRandom
	mov r1, #0x27
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r1, r0, #0x18
	ldr r0, _02253184 ; =ov02_02253D54
	ldrb r0, [r0, r1]
	pop {r3, pc}
	nop
_02253184: .word ov02_02253D54
	thumb_func_end ov02_0225316C

	thumb_func_start ov02_02253188
ov02_02253188: ; 0x02253188
	push {r3, r4, r5, lr}
	bl Save_FashionData_Get
	bl Save_FashionData_GetFashionCase
	add r4, r0, #0
	mov r5, #0
_02253196:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0202BA5C
	cmp r0, #0
	bne _022531A6
	mov r0, #0
	pop {r3, r4, r5, pc}
_022531A6:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0xe
	blo _02253196
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02253188

	thumb_func_start ov02_022531B4
ov02_022531B4: ; 0x022531B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r4, #0
	add r1, r4, #0
	add r3, r4, #0
	add r2, sp, #0
_022531C0:
	strb r3, [r2, r1]
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #0xe
	blo _022531C0
	bl Save_FashionData_Get
	bl Save_FashionData_GetFashionCase
	add r6, r0, #0
	mov r5, #0
	add r7, sp, #0
_022531DA:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202BA5C
	cmp r0, #0
	bne _022531EE
	add r0, r4, #1
	lsl r0, r0, #0x18
	strb r5, [r7, r4]
	lsr r4, r0, #0x18
_022531EE:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0xe
	blo _022531DA
	cmp r4, #0
	bne _02253206
	bl GF_AssertFail
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02253206:
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r1, r0, #0x18
	add r0, sp, #0
	ldrb r0, [r0, r1]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_022531B4

    .rodata

ov02_02253C84: ; 0x02253C84
	.byte 0x01, 0x00

ov02_02253C86: ; 0x02253C86
	.byte 0x0D, 0x00

ov02_02253C88: ; 0x02253C88
	.byte 0x00, 0x00, 0x01, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x55, 0x00, 0x01, 0x00, 0x09, 0x00, 0x5D, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00
	.byte 0x8E, 0x00, 0x01, 0x00, 0x18, 0x00, 0x8F, 0x00, 0x01, 0x00, 0x18, 0x00, 0x90, 0x00, 0x01, 0x00
	.byte 0x18, 0x00, 0x91, 0x00, 0x01, 0x00, 0x18, 0x00, 0x92, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1B, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov02_02253CD4: ; 0x02253CD4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov02_02253CE0: ; 0x02253CE0
	.byte 0x00, 0x00, 0xFF, 0xFF, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00

ov02_02253CEC: ; 0x02253CEC
	.byte 0x4C, 0x00, 0x00, 0x00
	.byte 0x4E, 0x00, 0x00, 0x00, 0x4D, 0x00, 0x00, 0x00

ov02_02253CF8: ; 0x02253CF8
	.byte 0x56, 0x00, 0x00, 0x00, 0x57, 0x00, 0x00, 0x00
	.byte 0x4F, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00

ov02_02253D08: ; 0x02253D08
	.byte 0x58, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00

ov02_02253D14: ; 0x02253D14
	.byte 0x50, 0x00, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00, 0x53, 0x00, 0x00, 0x00
	.byte 0x54, 0x00, 0x00, 0x00

ov02_02253D24: ; 0x02253D24
	.byte 0x64, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x00, 0x00
	.byte 0x59, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00
	.byte 0x5D, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x62, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00
	.byte 0x61, 0x00, 0x00, 0x00

ov02_02253D54: ; 0x02253D54
	.byte 0x2F, 0x38, 0x39, 0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0x3F, 0x40, 0x41, 0x42
	.byte 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51, 0x52
	.byte 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5A, 0x5B, 0x5F, 0x60, 0x00
