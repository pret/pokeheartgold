#include "constants/pokemon.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/sprites.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/std_script.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public NNS_G3dGlb

	.text

	thumb_func_start sub_02069E28
sub_02069E28: ; 0x02069E28
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #2
	add r5, r0, #0
	bl MapObject_GetParam
	lsl r1, r0, #6
	lsr r1, r1, #0x10
	lsl r1, r1, #0x1a
	lsl r0, r0, #0x18
	lsr r2, r1, #0x10
	lsr r1, r0, #0x18
	lsl r0, r4, #8
	orr r0, r2
	orr r1, r0
	add r0, r5, #0
	mov r2, #2
	bl MapObject_SetParam
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069E28

	thumb_func_start sub_02069E50
sub_02069E50: ; 0x02069E50
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x17
	bls _02069E5E
	bl GF_AssertFail
_02069E5E:
	add r0, r4, #0
	mov r1, #2
	bl MapObject_GetParam
	ldr r1, _02069E80 ; =0x000003FF
	lsl r2, r5, #0xa
	and r0, r1
	lsl r0, r0, #0x18
	add r1, r2, #0
	lsr r0, r0, #0x18
	orr r1, r0
	add r0, r4, #0
	mov r2, #2
	bl MapObject_SetParam
	pop {r3, r4, r5, pc}
	nop
_02069E80: .word 0x000003FF
	thumb_func_end sub_02069E50

	thumb_func_start sub_02069E84
sub_02069E84: ; 0x02069E84
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #2
	add r5, r0, #0
	bl MapObject_GetParam
	mov r1, #3
	and r1, r0
	asr r0, r0, #3
	lsl r1, r1, #0x18
	lsl r2, r0, #3
	lsl r0, r4, #2
	orr r0, r2
	lsr r1, r1, #0x18
	orr r1, r0
	add r0, r5, #0
	mov r2, #2
	bl MapObject_SetParam
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069E84

	thumb_func_start sub_02069EAC
sub_02069EAC: ; 0x02069EAC
	push {r3, lr}
	mov r1, #2
	bl MapObject_GetParam
	asr r1, r0, #2
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end sub_02069EAC

	thumb_func_start sub_02069EC0
sub_02069EC0: ; 0x02069EC0
	push {r3, lr}
	mov r1, #2
	bl MapObject_GetParam
	asr r1, r0, #8
	mov r0, #3
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end sub_02069EC0

	thumb_func_start sub_02069ED4
sub_02069ED4: ; 0x02069ED4
	push {r3, lr}
	mov r1, #2
	bl MapObject_GetParam
	asr r1, r0, #0xa
	mov r0, #0x3f
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end sub_02069ED4

	thumb_func_start FollowPokeMapObjectSetParams
FollowPokeMapObjectSetParams: ; 0x02069EE8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r1, r3, #0
	bl FollowingPoke_SetObjectShinyFlag
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl FollowingPoke_SetObjectFormeParam
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl MapObject_SetParam
	pop {r4, r5, r6, pc}
	thumb_func_end FollowPokeMapObjectSetParams

	thumb_func_start sub_02069F0C
sub_02069F0C: ; 0x02069F0C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r6, r2, #0
	ldr r1, [sp, #0x18]
	add r5, r0, #0
	add r7, r3, #0
	mov r2, #2
	bl MapObject_SetParam
	add r0, r5, #0
	add r1, r7, #0
	bl FollowingPoke_SetObjectShinyFlag
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl FollowingPoke_SetObjectFormeParam
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl MapObject_SetParam
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02069F0C

	thumb_func_start FollowPokeFsysParamSet
FollowPokeFsysParamSet: ; 0x02069F3C
	push {r3, r4}
	add r4, r0, #0
	add r4, #0xf4
	str r1, [r4]
	add r1, r0, #0
	add r1, #0xfb
	strb r3, [r1]
	add r1, r0, #0
	add r1, #0xfc
	strh r2, [r1]
	ldr r1, _02069F60 ; =0xFFFFFFF8
	add r0, #0xf8
	add r1, sp
	ldrb r1, [r1, #0x10]
	strb r1, [r0]
	pop {r3, r4}
	bx lr
	nop
_02069F60: .word 0xFFFFFFF8
	thumb_func_end FollowPokeFsysParamSet

	thumb_func_start sub_02069F64
sub_02069F64: ; 0x02069F64
	push {r3, lr}
	bl SpeciesToOverworldModelIndexOffset
	add r2, r0, #0
	add r0, sp, #0
	mov r1, #0x8d
	bl ReadWholeNarcMemberByIdPair
	add r0, sp, #0
	ldrb r0, [r0, #1]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02069F64

	thumb_func_start sub_02069F7C
sub_02069F7C: ; 0x02069F7C
	ldr r3, _02069F84 ; =MapObject_GetParam
	mov r1, #0
	bx r3
	nop
_02069F84: .word MapObject_GetParam
	thumb_func_end sub_02069F7C

	thumb_func_start FollowingPokemon_IsActive
FollowingPokemon_IsActive: ; 0x02069F88
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xfa
	ldrb r1, [r1]
	cmp r1, #0
	bne _02069F98
	mov r0, #0
	pop {r3, pc}
_02069F98:
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	bl CountAlivePokemon
	cmp r0, #0
	beq _02069FAA
	mov r0, #1
	pop {r3, pc}
_02069FAA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end FollowingPokemon_IsActive

	thumb_func_start sub_02069FB0
sub_02069FB0: ; 0x02069FB0
	push {r4, lr}
	add r4, r0, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02069FD0
	add r4, #0xe4
	ldr r0, [r4]
	bl sub_0205F684
	cmp r0, #0
	bne _02069FCC
	mov r0, #1
	pop {r4, pc}
_02069FCC:
	mov r0, #0
	pop {r4, pc}
_02069FD0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02069FB0

	thumb_func_start sub_02069FD4
sub_02069FD4: ; 0x02069FD4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_FollowPoke_get
	bl SavFollowPoke_GetMapId
	add r5, #0xe4
	add r4, r0, #0
	ldr r0, [r5]
	bl sub_02069F7C
	add r1, r4, #0
	bl sub_02069FF4
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069FD4

	thumb_func_start sub_02069FF4
sub_02069FF4: ; 0x02069FF4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	sub r0, #0x32
	add r6, r1, #0
	cmp r0, #1
	bhi _0206A00E
	add r0, r6, #0
	bl sub_0206A0A4
	cmp r0, #0
	bne _0206A00E
	mov r0, #0
	pop {r4, r5, r6, pc}
_0206A00E:
	add r0, r6, #0
	bl MapHeader_GetFollowMode
	cmp r0, #0
	beq _0206A022
	cmp r0, #1
	beq _0206A026
	cmp r0, #2
	beq _0206A038
	b _0206A03A
_0206A022:
	mov r4, #0
	b _0206A03A
_0206A026:
	add r0, r5, #0
	bl sub_02069F64
	cmp r0, #0
	beq _0206A034
	mov r4, #0
	b _0206A03A
_0206A034:
	mov r4, #1
	b _0206A03A
_0206A038:
	mov r4, #1
_0206A03A:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02069FF4

	thumb_func_start sub_0206A040
sub_0206A040: ; 0x0206A040
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F690
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F6E0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0206A040

	thumb_func_start sub_0206A054
sub_0206A054: ; 0x0206A054
	push {r4, lr}
	add r0, #0xe4
	ldr r4, [r0]
	mov r1, #1
	add r0, r4, #0
	bl sub_02069DC8
	add r0, r4, #0
	mov r1, #0
	bl sub_02069DEC
	pop {r4, pc}
	thumb_func_end sub_0206A054

	thumb_func_start sub_0206A06C
sub_0206A06C: ; 0x0206A06C
	mov r1, #0
	strb r1, [r0, #0x16]
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #0x1c]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	strb r1, [r0, #0x15]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0206A06C

	thumb_func_start FollowingPoke_SetObjectShinyFlag
FollowingPoke_SetObjectShinyFlag: ; 0x0206A080
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #2
	add r5, r0, #0
	bl MapObject_GetParam
	asr r0, r0, #1
	lsl r1, r0, #1
	cmp r4, #0
	beq _0206A098
	mov r0, #1
	orr r1, r0
_0206A098:
	add r0, r5, #0
	mov r2, #2
	bl MapObject_SetParam
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end FollowingPoke_SetObjectShinyFlag

	thumb_func_start sub_0206A0A4
sub_0206A0A4: ; 0x0206A0A4
	cmp r0, #0x6f
	bgt _0206A0AC
	beq _0206A0D6
	b _0206A0DA
_0206A0AC:
	mov r1, #0x53
	lsl r1, r1, #2
	sub r0, r0, r1
	cmp r0, #9
	bhi _0206A0DA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206A0C2: ; jump table
	.short _0206A0D6 - _0206A0C2 - 2 ; case 0
	.short _0206A0D6 - _0206A0C2 - 2 ; case 1
	.short _0206A0D6 - _0206A0C2 - 2 ; case 2
	.short _0206A0D6 - _0206A0C2 - 2 ; case 3
	.short _0206A0D6 - _0206A0C2 - 2 ; case 4
	.short _0206A0D6 - _0206A0C2 - 2 ; case 5
	.short _0206A0D6 - _0206A0C2 - 2 ; case 6
	.short _0206A0D6 - _0206A0C2 - 2 ; case 7
	.short _0206A0D6 - _0206A0C2 - 2 ; case 8
	.short _0206A0D6 - _0206A0C2 - 2 ; case 9
_0206A0D6:
	mov r0, #0
	bx lr
_0206A0DA:
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end sub_0206A0A4

	thumb_func_start FollowingPoke_SetObjectFormeParam
FollowingPoke_SetObjectFormeParam: ; 0x0206A0E0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r0, #0
	add r0, r6, #0
	add r5, r2, #0
	bl SpeciesToOverworldModelIndexOffset
	add r4, r0, #0
	add r0, r6, #0
	bl OverworldModelLookupFormeCount
	cmp r0, #0
	ble _0206A106
	cmp r5, r0
	bgt _0206A102
	add r4, r4, r5
	b _0206A106
_0206A102:
	bl GF_AssertFail
_0206A106:
	add r0, sp, #0
	mov r1, #0x8d
	add r2, r4, #0
	bl ReadWholeNarcMemberByIdPair
	add r1, sp, #0
	ldrb r2, [r1, #1]
	ldrb r1, [r1, #2]
	add r0, r7, #0
	lsl r2, r2, #8
	orr r1, r2
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	mov r2, #1
	bl MapObject_SetParam
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end FollowingPoke_SetObjectFormeParam

	thumb_func_start CreateFollowingSpriteFieldObject
CreateFollowingSpriteFieldObject: ; 0x0206A128
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r2, #0
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r3, #0
	bl FollowingPokemon_GetSpriteID
	str r0, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x20]
	add r0, r4, #0
	bl CreateSpecialFieldObject
	add r4, r0, #0
	bne _0206A15A
	bl GF_AssertFail
_0206A15A:
	add r0, r4, #0
	mov r1, #0xfd
	bl MapObject_SetID
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetType
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetFlagID
	ldr r1, _0206A1D0 ; =std_following_mon
	add r0, r4, #0
	bl MapObject_SetScript
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl MapObject_SetParam
	lsl r2, r6, #0x18
	ldr r3, [sp, #0x2c]
	add r0, r4, #0
	add r1, r5, #0
	lsr r2, r2, #0x18
	bl FollowPokeMapObjectSetParams
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl MapObject_SetXRange
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl MapObject_SetYRange
	mov r1, #9
	add r0, r4, #0
	lsl r1, r1, #0xa
	bl MapObject_SetBits
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #6
	bl MapObject_ClearBits
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F89C
	add r0, r4, #0
	mov r1, #1
	bl sub_02069DC8
	add r0, r4, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0206A1D0: .word std_following_mon
	thumb_func_end CreateFollowingSpriteFieldObject

	thumb_func_start sub_0206A1D4
sub_0206A1D4: ; 0x0206A1D4
	push {r4, lr}
	mov r1, #0xc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	strh r0, [r4, #4]
	str r0, [r4]
	strh r0, [r4, #6]
	str r0, [r4, #8]
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_0206A1D4

	thumb_func_start sub_0206A1F4
sub_0206A1F4: ; 0x0206A1F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	add r4, r1, #0
	cmp r0, #0
	bne _0206A206
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_0206A206:
	mov r1, #MON_DATA_MOOD
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	mov r2, #0
	strb r0, [r1]
	ldrsb r0, [r1, r2]
	add r3, r0, r4
	cmp r3, #0x7f
	ble _0206A222
	mov r0, #0x7f
	strb r0, [r1]
	b _0206A232
_0206A222:
	add r0, r2, #0
	sub r0, #0x7f
	cmp r3, r0
	bge _0206A230
	sub r2, #0x7f
	strb r2, [r1]
	b _0206A232
_0206A230:
	strb r3, [r1]
_0206A232:
	ldr r0, [r5, #8]
	mov r1, #MON_DATA_MOOD
	add r2, sp, #0
	bl SetMonData
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0206A1F4

	thumb_func_start sub_0206A240
sub_0206A240: ; 0x0206A240
	push {r0, r1, r2, r3}
	push {r3, lr}
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _0206A256
	bl GF_AssertFail
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
_0206A256:
	mov r1, #MON_DATA_MOOD
	add r2, sp, #0xc
	bl SetMonData
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end sub_0206A240

	thumb_func_start sub_0206A268
sub_0206A268: ; 0x0206A268
	push {r3, lr}
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _0206A278
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_0206A278:
	mov r1, #MON_DATA_MOOD
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206A268

	thumb_func_start sub_0206A288
sub_0206A288: ; 0x0206A288
	push {r3, r4, lr}
	sub sp, #4
	cmp r2, #0
	beq _0206A2BC
	ldrh r4, [r0, #6]
	cmp r4, #0
	beq _0206A2A2
	ldrh r4, [r0, #4]
	cmp r4, r2
	bne _0206A2A2
	ldr r4, [r0]
	cmp r4, r3
	beq _0206A2BC
_0206A2A2:
	strh r2, [r0, #4]
	str r3, [r0]
	mov r3, #0
	add r2, sp, #0
	strb r3, [r2]
	mov r2, #1
	strh r2, [r0, #6]
	str r1, [r0, #8]
	add r0, r1, #0
	mov r1, #MON_DATA_MOOD
	add r2, sp, #0
	bl SetMonData
_0206A2BC:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_0206A288

	thumb_func_start sub_0206A2C0
sub_0206A2C0: ; 0x0206A2C0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0206A2D4
	bl GF_AssertFail
	add sp, #4
	pop {r3, r4, pc}
_0206A2D4:
	mov r1, #MON_DATA_MOOD
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	strb r0, [r1]
	mov r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0206A2EE
	add r0, r0, #1
	strb r0, [r1]
	b _0206A2F4
_0206A2EE:
	ble _0206A2F4
	sub r0, r0, #1
	strb r0, [r1]
_0206A2F4:
	ldr r0, [r4, #8]
	mov r1, #MON_DATA_MOOD
	add r2, sp, #0
	bl SetMonData
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206A2C0

	thumb_func_start SpeciesToOverworldModelIndexOffset
SpeciesToOverworldModelIndexOffset: ; 0x0206A304
	lsl r1, r0, #1
	ldr r0, _0206A30C ; =_020FF088
	ldrh r0, [r0, r1]
	bx lr
	.balign 4, 0
_0206A30C: .word _020FF088
	thumb_func_end SpeciesToOverworldModelIndexOffset

	thumb_func_start OverworldModelLookupFormeCount
OverworldModelLookupFormeCount: ; 0x0206A310
	push {r3, lr}
	cmp r0, #0
	ble _0206A31C
	ldr r1, _0206A330 ; =NATIONAL_DEX_COUNT
	cmp r0, r1
	ble _0206A324
_0206A31C:
	bl GF_AssertFail
	mov r0, #0
	b _0206A326
_0206A324:
	sub r0, r0, #1
_0206A326:
	lsl r1, r0, #1
	ldr r0, _0206A334 ; =_020FE8D4
	ldrh r0, [r0, r1]
	pop {r3, pc}
	nop
_0206A330: .word NATIONAL_DEX_COUNT
_0206A334: .word _020FE8D4
	thumb_func_end OverworldModelLookupFormeCount

	thumb_func_start OverworldModelLookupHasFemaleForme
OverworldModelLookupHasFemaleForme: ; 0x0206A338
	push {r3, lr}
	cmp r0, #0
	ble _0206A344
	ldr r1, _0206A358 ; =NATIONAL_DEX_COUNT
	cmp r0, r1
	ble _0206A34C
_0206A344:
	bl GF_AssertFail
	mov r0, #0
	b _0206A34E
_0206A34C:
	sub r0, r0, #1
_0206A34E:
	lsl r1, r0, #1
	ldr r0, _0206A35C ; =_020FECAE
	ldrh r0, [r0, r1]
	pop {r3, pc}
	nop
_0206A358: .word NATIONAL_DEX_COUNT
_0206A35C: .word _020FECAE
	thumb_func_end OverworldModelLookupHasFemaleForme

	.rodata

_020FE8D4:
	.short 0          ; SPECIES_BULBASAUR
	.short 0          ; SPECIES_IVYSAUR
	.short 0          ; SPECIES_VENUSAUR
	.short 0          ; SPECIES_CHARMANDER
	.short 0          ; SPECIES_CHARMELEON
	.short 0          ; SPECIES_CHARIZARD
	.short 0          ; SPECIES_SQUIRTLE
	.short 0          ; SPECIES_WARTORTLE
	.short 0          ; SPECIES_BLASTOISE
	.short 0          ; SPECIES_CATERPIE
	.short 0          ; SPECIES_METAPOD
	.short 0          ; SPECIES_BUTTERFREE
	.short 0          ; SPECIES_WEEDLE
	.short 0          ; SPECIES_KAKUNA
	.short 0          ; SPECIES_BEEDRILL
	.short 0          ; SPECIES_PIDGEY
	.short 0          ; SPECIES_PIDGEOTTO
	.short 0          ; SPECIES_PIDGEOT
	.short 0          ; SPECIES_RATTATA
	.short 0          ; SPECIES_RATICATE
	.short 0          ; SPECIES_SPEAROW
	.short 0          ; SPECIES_FEAROW
	.short 0          ; SPECIES_EKANS
	.short 0          ; SPECIES_ARBOK
	.short 0          ; SPECIES_PIKACHU
	.short 0          ; SPECIES_RAICHU
	.short 0          ; SPECIES_SANDSHREW
	.short 0          ; SPECIES_SANDSLASH
	.short 0          ; SPECIES_NIDORAN_F
	.short 0          ; SPECIES_NIDORINA
	.short 0          ; SPECIES_NIDOQUEEN
	.short 0          ; SPECIES_NIDORAN_M
	.short 0          ; SPECIES_NIDORINO
	.short 0          ; SPECIES_NIDOKING
	.short 0          ; SPECIES_CLEFAIRY
	.short 0          ; SPECIES_CLEFABLE
	.short 0          ; SPECIES_VULPIX
	.short 0          ; SPECIES_NINETALES
	.short 0          ; SPECIES_JIGGLYPUFF
	.short 0          ; SPECIES_WIGGLYTUFF
	.short 0          ; SPECIES_ZUBAT
	.short 0          ; SPECIES_GOLBAT
	.short 0          ; SPECIES_ODDISH
	.short 0          ; SPECIES_GLOOM
	.short 0          ; SPECIES_VILEPLUME
	.short 0          ; SPECIES_PARAS
	.short 0          ; SPECIES_PARASECT
	.short 0          ; SPECIES_VENONAT
	.short 0          ; SPECIES_VENOMOTH
	.short 0          ; SPECIES_DIGLETT
	.short 0          ; SPECIES_DUGTRIO
	.short 0          ; SPECIES_MEOWTH
	.short 0          ; SPECIES_PERSIAN
	.short 0          ; SPECIES_PSYDUCK
	.short 0          ; SPECIES_GOLDUCK
	.short 0          ; SPECIES_MANKEY
	.short 0          ; SPECIES_PRIMEAPE
	.short 0          ; SPECIES_GROWLITHE
	.short 0          ; SPECIES_ARCANINE
	.short 0          ; SPECIES_POLIWAG
	.short 0          ; SPECIES_POLIWHIRL
	.short 0          ; SPECIES_POLIWRATH
	.short 0          ; SPECIES_ABRA
	.short 0          ; SPECIES_KADABRA
	.short 0          ; SPECIES_ALAKAZAM
	.short 0          ; SPECIES_MACHOP
	.short 0          ; SPECIES_MACHOKE
	.short 0          ; SPECIES_MACHAMP
	.short 0          ; SPECIES_BELLSPROUT
	.short 0          ; SPECIES_WEEPINBELL
	.short 0          ; SPECIES_VICTREEBEL
	.short 0          ; SPECIES_TENTACOOL
	.short 0          ; SPECIES_TENTACRUEL
	.short 0          ; SPECIES_GEODUDE
	.short 0          ; SPECIES_GRAVELER
	.short 0          ; SPECIES_GOLEM
	.short 0          ; SPECIES_PONYTA
	.short 0          ; SPECIES_RAPIDASH
	.short 0          ; SPECIES_SLOWPOKE
	.short 0          ; SPECIES_SLOWBRO
	.short 0          ; SPECIES_MAGNEMITE
	.short 0          ; SPECIES_MAGNETON
	.short 0          ; SPECIES_FARFETCHD
	.short 0          ; SPECIES_DODUO
	.short 0          ; SPECIES_DODRIO
	.short 0          ; SPECIES_SEEL
	.short 0          ; SPECIES_DEWGONG
	.short 0          ; SPECIES_GRIMER
	.short 0          ; SPECIES_MUK
	.short 0          ; SPECIES_SHELLDER
	.short 0          ; SPECIES_CLOYSTER
	.short 0          ; SPECIES_GASTLY
	.short 0          ; SPECIES_HAUNTER
	.short 0          ; SPECIES_GENGAR
	.short 0          ; SPECIES_ONIX
	.short 0          ; SPECIES_DROWZEE
	.short 0          ; SPECIES_HYPNO
	.short 0          ; SPECIES_KRABBY
	.short 0          ; SPECIES_KINGLER
	.short 0          ; SPECIES_VOLTORB
	.short 0          ; SPECIES_ELECTRODE
	.short 0          ; SPECIES_EXEGGCUTE
	.short 0          ; SPECIES_EXEGGUTOR
	.short 0          ; SPECIES_CUBONE
	.short 0          ; SPECIES_MAROWAK
	.short 0          ; SPECIES_HITMONLEE
	.short 0          ; SPECIES_HITMONCHAN
	.short 0          ; SPECIES_LICKITUNG
	.short 0          ; SPECIES_KOFFING
	.short 0          ; SPECIES_WEEZING
	.short 0          ; SPECIES_RHYHORN
	.short 0          ; SPECIES_RHYDON
	.short 0          ; SPECIES_CHANSEY
	.short 0          ; SPECIES_TANGELA
	.short 0          ; SPECIES_KANGASKHAN
	.short 0          ; SPECIES_HORSEA
	.short 0          ; SPECIES_SEADRA
	.short 0          ; SPECIES_GOLDEEN
	.short 0          ; SPECIES_SEAKING
	.short 0          ; SPECIES_STARYU
	.short 0          ; SPECIES_STARMIE
	.short 0          ; SPECIES_MR_MIME
	.short 0          ; SPECIES_SCYTHER
	.short 0          ; SPECIES_JYNX
	.short 0          ; SPECIES_ELECTABUZZ
	.short 0          ; SPECIES_MAGMAR
	.short 0          ; SPECIES_PINSIR
	.short 0          ; SPECIES_TAUROS
	.short 0          ; SPECIES_MAGIKARP
	.short 0          ; SPECIES_GYARADOS
	.short 0          ; SPECIES_LAPRAS
	.short 0          ; SPECIES_DITTO
	.short 0          ; SPECIES_EEVEE
	.short 0          ; SPECIES_VAPOREON
	.short 0          ; SPECIES_JOLTEON
	.short 0          ; SPECIES_FLAREON
	.short 0          ; SPECIES_PORYGON
	.short 0          ; SPECIES_OMANYTE
	.short 0          ; SPECIES_OMASTAR
	.short 0          ; SPECIES_KABUTO
	.short 0          ; SPECIES_KABUTOPS
	.short 0          ; SPECIES_AERODACTYL
	.short 0          ; SPECIES_SNORLAX
	.short 0          ; SPECIES_ARTICUNO
	.short 0          ; SPECIES_ZAPDOS
	.short 0          ; SPECIES_MOLTRES
	.short 0          ; SPECIES_DRATINI
	.short 0          ; SPECIES_DRAGONAIR
	.short 0          ; SPECIES_DRAGONITE
	.short 0          ; SPECIES_MEWTWO
	.short 0          ; SPECIES_MEW
	.short 0          ; SPECIES_CHIKORITA
	.short 0          ; SPECIES_BAYLEEF
	.short 0          ; SPECIES_MEGANIUM
	.short 0          ; SPECIES_CYNDAQUIL
	.short 0          ; SPECIES_QUILAVA
	.short 0          ; SPECIES_TYPHLOSION
	.short 0          ; SPECIES_TOTODILE
	.short 0          ; SPECIES_CROCONAW
	.short 0          ; SPECIES_FERALIGATR
	.short 0          ; SPECIES_SENTRET
	.short 0          ; SPECIES_FURRET
	.short 0          ; SPECIES_HOOTHOOT
	.short 0          ; SPECIES_NOCTOWL
	.short 0          ; SPECIES_LEDYBA
	.short 0          ; SPECIES_LEDIAN
	.short 0          ; SPECIES_SPINARAK
	.short 0          ; SPECIES_ARIADOS
	.short 0          ; SPECIES_CROBAT
	.short 0          ; SPECIES_CHINCHOU
	.short 0          ; SPECIES_LANTURN
	.short 1          ; SPECIES_PICHU
	.short 0          ; SPECIES_CLEFFA
	.short 0          ; SPECIES_IGGLYBUFF
	.short 0          ; SPECIES_TOGEPI
	.short 0          ; SPECIES_TOGETIC
	.short 0          ; SPECIES_NATU
	.short 0          ; SPECIES_XATU
	.short 0          ; SPECIES_MAREEP
	.short 0          ; SPECIES_FLAAFFY
	.short 0          ; SPECIES_AMPHAROS
	.short 0          ; SPECIES_BELLOSSOM
	.short 0          ; SPECIES_MARILL
	.short 0          ; SPECIES_AZUMARILL
	.short 0          ; SPECIES_SUDOWOODO
	.short 0          ; SPECIES_POLITOED
	.short 0          ; SPECIES_HOPPIP
	.short 0          ; SPECIES_SKIPLOOM
	.short 0          ; SPECIES_JUMPLUFF
	.short 0          ; SPECIES_AIPOM
	.short 0          ; SPECIES_SUNKERN
	.short 0          ; SPECIES_SUNFLORA
	.short 0          ; SPECIES_YANMA
	.short 0          ; SPECIES_WOOPER
	.short 0          ; SPECIES_QUAGSIRE
	.short 0          ; SPECIES_ESPEON
	.short 0          ; SPECIES_UMBREON
	.short 0          ; SPECIES_MURKROW
	.short 0          ; SPECIES_SLOWKING
	.short 0          ; SPECIES_MISDREAVUS
	.short 27         ; SPECIES_UNOWN
	.short 0          ; SPECIES_WOBBUFFET
	.short 0          ; SPECIES_GIRAFARIG
	.short 0          ; SPECIES_PINECO
	.short 0          ; SPECIES_FORRETRESS
	.short 0          ; SPECIES_DUNSPARCE
	.short 0          ; SPECIES_GLIGAR
	.short 0          ; SPECIES_STEELIX
	.short 0          ; SPECIES_SNUBBULL
	.short 0          ; SPECIES_GRANBULL
	.short 0          ; SPECIES_QWILFISH
	.short 0          ; SPECIES_SCIZOR
	.short 0          ; SPECIES_SHUCKLE
	.short 0          ; SPECIES_HERACROSS
	.short 0          ; SPECIES_SNEASEL
	.short 0          ; SPECIES_TEDDIURSA
	.short 0          ; SPECIES_URSARING
	.short 0          ; SPECIES_SLUGMA
	.short 0          ; SPECIES_MAGCARGO
	.short 0          ; SPECIES_SWINUB
	.short 0          ; SPECIES_PILOSWINE
	.short 0          ; SPECIES_CORSOLA
	.short 0          ; SPECIES_REMORAID
	.short 0          ; SPECIES_OCTILLERY
	.short 0          ; SPECIES_DELIBIRD
	.short 0          ; SPECIES_MANTINE
	.short 0          ; SPECIES_SKARMORY
	.short 0          ; SPECIES_HOUNDOUR
	.short 0          ; SPECIES_HOUNDOOM
	.short 0          ; SPECIES_KINGDRA
	.short 0          ; SPECIES_PHANPY
	.short 0          ; SPECIES_DONPHAN
	.short 0          ; SPECIES_PORYGON2
	.short 0          ; SPECIES_STANTLER
	.short 0          ; SPECIES_SMEARGLE
	.short 0          ; SPECIES_TYROGUE
	.short 0          ; SPECIES_HITMONTOP
	.short 0          ; SPECIES_SMOOCHUM
	.short 0          ; SPECIES_ELEKID
	.short 0          ; SPECIES_MAGBY
	.short 0          ; SPECIES_MILTANK
	.short 0          ; SPECIES_BLISSEY
	.short 0          ; SPECIES_RAIKOU
	.short 0          ; SPECIES_ENTEI
	.short 0          ; SPECIES_SUICUNE
	.short 0          ; SPECIES_LARVITAR
	.short 0          ; SPECIES_PUPITAR
	.short 0          ; SPECIES_TYRANITAR
	.short 0          ; SPECIES_LUGIA
	.short 0          ; SPECIES_HO_OH
	.short 0          ; SPECIES_CELEBI
	.short 0          ; SPECIES_TREECKO
	.short 0          ; SPECIES_GROVYLE
	.short 0          ; SPECIES_SCEPTILE
	.short 0          ; SPECIES_TORCHIC
	.short 0          ; SPECIES_COMBUSKEN
	.short 0          ; SPECIES_BLAZIKEN
	.short 0          ; SPECIES_MUDKIP
	.short 0          ; SPECIES_MARSHTOMP
	.short 0          ; SPECIES_SWAMPERT
	.short 0          ; SPECIES_POOCHYENA
	.short 0          ; SPECIES_MIGHTYENA
	.short 0          ; SPECIES_ZIGZAGOON
	.short 0          ; SPECIES_LINOONE
	.short 0          ; SPECIES_WURMPLE
	.short 0          ; SPECIES_SILCOON
	.short 0          ; SPECIES_BEAUTIFLY
	.short 0          ; SPECIES_CASCOON
	.short 0          ; SPECIES_DUSTOX
	.short 0          ; SPECIES_LOTAD
	.short 0          ; SPECIES_LOMBRE
	.short 0          ; SPECIES_LUDICOLO
	.short 0          ; SPECIES_SEEDOT
	.short 0          ; SPECIES_NUZLEAF
	.short 0          ; SPECIES_SHIFTRY
	.short 0          ; SPECIES_TAILLOW
	.short 0          ; SPECIES_SWELLOW
	.short 0          ; SPECIES_WINGULL
	.short 0          ; SPECIES_PELIPPER
	.short 0          ; SPECIES_RALTS
	.short 0          ; SPECIES_KIRLIA
	.short 0          ; SPECIES_GARDEVOIR
	.short 0          ; SPECIES_SURSKIT
	.short 0          ; SPECIES_MASQUERAIN
	.short 0          ; SPECIES_SHROOMISH
	.short 0          ; SPECIES_BRELOOM
	.short 0          ; SPECIES_SLAKOTH
	.short 0          ; SPECIES_VIGOROTH
	.short 0          ; SPECIES_SLAKING
	.short 0          ; SPECIES_NINCADA
	.short 0          ; SPECIES_NINJASK
	.short 0          ; SPECIES_SHEDINJA
	.short 0          ; SPECIES_WHISMUR
	.short 0          ; SPECIES_LOUDRED
	.short 0          ; SPECIES_EXPLOUD
	.short 0          ; SPECIES_MAKUHITA
	.short 0          ; SPECIES_HARIYAMA
	.short 0          ; SPECIES_AZURILL
	.short 0          ; SPECIES_NOSEPASS
	.short 0          ; SPECIES_SKITTY
	.short 0          ; SPECIES_DELCATTY
	.short 0          ; SPECIES_SABLEYE
	.short 0          ; SPECIES_MAWILE
	.short 0          ; SPECIES_ARON
	.short 0          ; SPECIES_LAIRON
	.short 0          ; SPECIES_AGGRON
	.short 0          ; SPECIES_MEDITITE
	.short 0          ; SPECIES_MEDICHAM
	.short 0          ; SPECIES_ELECTRIKE
	.short 0          ; SPECIES_MANECTRIC
	.short 0          ; SPECIES_PLUSLE
	.short 0          ; SPECIES_MINUN
	.short 0          ; SPECIES_VOLBEAT
	.short 0          ; SPECIES_ILLUMISE
	.short 0          ; SPECIES_ROSELIA
	.short 0          ; SPECIES_GULPIN
	.short 0          ; SPECIES_SWALOT
	.short 0          ; SPECIES_CARVANHA
	.short 0          ; SPECIES_SHARPEDO
	.short 0          ; SPECIES_WAILMER
	.short 0          ; SPECIES_WAILORD
	.short 0          ; SPECIES_NUMEL
	.short 0          ; SPECIES_CAMERUPT
	.short 0          ; SPECIES_TORKOAL
	.short 0          ; SPECIES_SPOINK
	.short 0          ; SPECIES_GRUMPIG
	.short 0          ; SPECIES_SPINDA
	.short 0          ; SPECIES_TRAPINCH
	.short 0          ; SPECIES_VIBRAVA
	.short 0          ; SPECIES_FLYGON
	.short 0          ; SPECIES_CACNEA
	.short 0          ; SPECIES_CACTURNE
	.short 0          ; SPECIES_SWABLU
	.short 0          ; SPECIES_ALTARIA
	.short 0          ; SPECIES_ZANGOOSE
	.short 0          ; SPECIES_SEVIPER
	.short 0          ; SPECIES_LUNATONE
	.short 0          ; SPECIES_SOLROCK
	.short 0          ; SPECIES_BARBOACH
	.short 0          ; SPECIES_WHISCASH
	.short 0          ; SPECIES_CORPHISH
	.short 0          ; SPECIES_CRAWDAUNT
	.short 0          ; SPECIES_BALTOY
	.short 0          ; SPECIES_CLAYDOL
	.short 0          ; SPECIES_LILEEP
	.short 0          ; SPECIES_CRADILY
	.short 0          ; SPECIES_ANORITH
	.short 0          ; SPECIES_ARMALDO
	.short 0          ; SPECIES_FEEBAS
	.short 0          ; SPECIES_MILOTIC
	.short 0          ; SPECIES_CASTFORM
	.short 0          ; SPECIES_KECLEON
	.short 0          ; SPECIES_SHUPPET
	.short 0          ; SPECIES_BANETTE
	.short 0          ; SPECIES_DUSKULL
	.short 0          ; SPECIES_DUSCLOPS
	.short 0          ; SPECIES_TROPIUS
	.short 0          ; SPECIES_CHIMECHO
	.short 0          ; SPECIES_ABSOL
	.short 0          ; SPECIES_WYNAUT
	.short 0          ; SPECIES_SNORUNT
	.short 0          ; SPECIES_GLALIE
	.short 0          ; SPECIES_SPHEAL
	.short 0          ; SPECIES_SEALEO
	.short 0          ; SPECIES_WALREIN
	.short 0          ; SPECIES_CLAMPERL
	.short 0          ; SPECIES_HUNTAIL
	.short 0          ; SPECIES_GOREBYSS
	.short 0          ; SPECIES_RELICANTH
	.short 0          ; SPECIES_LUVDISC
	.short 0          ; SPECIES_BAGON
	.short 0          ; SPECIES_SHELGON
	.short 0          ; SPECIES_SALAMENCE
	.short 0          ; SPECIES_BELDUM
	.short 0          ; SPECIES_METANG
	.short 0          ; SPECIES_METAGROSS
	.short 0          ; SPECIES_REGIROCK
	.short 0          ; SPECIES_REGICE
	.short 0          ; SPECIES_REGISTEEL
	.short 0          ; SPECIES_LATIAS
	.short 0          ; SPECIES_LATIOS
	.short 0          ; SPECIES_KYOGRE
	.short 0          ; SPECIES_GROUDON
	.short 0          ; SPECIES_RAYQUAZA
	.short 0          ; SPECIES_JIRACHI
	.short 3          ; SPECIES_DEOXYS
	.short 0          ; SPECIES_TURTWIG
	.short 0          ; SPECIES_GROTLE
	.short 0          ; SPECIES_TORTERRA
	.short 0          ; SPECIES_CHIMCHAR
	.short 0          ; SPECIES_MONFERNO
	.short 0          ; SPECIES_INFERNAPE
	.short 0          ; SPECIES_PIPLUP
	.short 0          ; SPECIES_PRINPLUP
	.short 0          ; SPECIES_EMPOLEON
	.short 0          ; SPECIES_STARLY
	.short 0          ; SPECIES_STARAVIA
	.short 0          ; SPECIES_STARAPTOR
	.short 0          ; SPECIES_BIDOOF
	.short 0          ; SPECIES_BIBAREL
	.short 0          ; SPECIES_KRICKETOT
	.short 0          ; SPECIES_KRICKETUNE
	.short 0          ; SPECIES_SHINX
	.short 0          ; SPECIES_LUXIO
	.short 0          ; SPECIES_LUXRAY
	.short 0          ; SPECIES_BUDEW
	.short 0          ; SPECIES_ROSERADE
	.short 0          ; SPECIES_CRANIDOS
	.short 0          ; SPECIES_RAMPARDOS
	.short 0          ; SPECIES_SHIELDON
	.short 0          ; SPECIES_BASTIODON
	.short 2          ; SPECIES_BURMY
	.short 2          ; SPECIES_WORMADAM
	.short 0          ; SPECIES_MOTHIM
	.short 0          ; SPECIES_COMBEE
	.short 0          ; SPECIES_VESPIQUEN
	.short 0          ; SPECIES_PACHIRISU
	.short 0          ; SPECIES_BUIZEL
	.short 0          ; SPECIES_FLOATZEL
	.short 0          ; SPECIES_CHERUBI
	.short 0          ; SPECIES_CHERRIM
	.short 1          ; SPECIES_SHELLOS
	.short 1          ; SPECIES_GASTRODON
	.short 0          ; SPECIES_AMBIPOM
	.short 0          ; SPECIES_DRIFLOON
	.short 0          ; SPECIES_DRIFBLIM
	.short 0          ; SPECIES_BUNEARY
	.short 0          ; SPECIES_LOPUNNY
	.short 0          ; SPECIES_MISMAGIUS
	.short 0          ; SPECIES_HONCHKROW
	.short 0          ; SPECIES_GLAMEOW
	.short 0          ; SPECIES_PURUGLY
	.short 0          ; SPECIES_CHINGLING
	.short 0          ; SPECIES_STUNKY
	.short 0          ; SPECIES_SKUNTANK
	.short 0          ; SPECIES_BRONZOR
	.short 0          ; SPECIES_BRONZONG
	.short 0          ; SPECIES_BONSLY
	.short 0          ; SPECIES_MIME_JR
	.short 0          ; SPECIES_HAPPINY
	.short 0          ; SPECIES_CHATOT
	.short 0          ; SPECIES_SPIRITOMB
	.short 0          ; SPECIES_GIBLE
	.short 0          ; SPECIES_GABITE
	.short 0          ; SPECIES_GARCHOMP
	.short 0          ; SPECIES_MUNCHLAX
	.short 0          ; SPECIES_RIOLU
	.short 0          ; SPECIES_LUCARIO
	.short 0          ; SPECIES_HIPPOPOTAS
	.short 0          ; SPECIES_HIPPOWDON
	.short 0          ; SPECIES_SKORUPI
	.short 0          ; SPECIES_DRAPION
	.short 0          ; SPECIES_CROAGUNK
	.short 0          ; SPECIES_TOXICROAK
	.short 0          ; SPECIES_CARNIVINE
	.short 0          ; SPECIES_FINNEON
	.short 0          ; SPECIES_LUMINEON
	.short 0          ; SPECIES_MANTYKE
	.short 0          ; SPECIES_SNOVER
	.short 0          ; SPECIES_ABOMASNOW
	.short 0          ; SPECIES_WEAVILE
	.short 0          ; SPECIES_MAGNEZONE
	.short 0          ; SPECIES_LICKILICKY
	.short 0          ; SPECIES_RHYPERIOR
	.short 0          ; SPECIES_TANGROWTH
	.short 0          ; SPECIES_ELECTIVIRE
	.short 0          ; SPECIES_MAGMORTAR
	.short 0          ; SPECIES_TOGEKISS
	.short 0          ; SPECIES_YANMEGA
	.short 0          ; SPECIES_LEAFEON
	.short 0          ; SPECIES_GLACEON
	.short 0          ; SPECIES_GLISCOR
	.short 0          ; SPECIES_MAMOSWINE
	.short 0          ; SPECIES_PORYGON_Z
	.short 0          ; SPECIES_GALLADE
	.short 0          ; SPECIES_PROBOPASS
	.short 0          ; SPECIES_DUSKNOIR
	.short 0          ; SPECIES_FROSLASS
	.short 5          ; SPECIES_ROTOM
	.short 0          ; SPECIES_UXIE
	.short 0          ; SPECIES_MESPRIT
	.short 0          ; SPECIES_AZELF
	.short 0          ; SPECIES_DIALGA
	.short 0          ; SPECIES_PALKIA
	.short 0          ; SPECIES_HEATRAN
	.short 0          ; SPECIES_REGIGIGAS
	.short 1          ; SPECIES_GIRATINA
	.short 0          ; SPECIES_CRESSELIA
	.short 0          ; SPECIES_PHIONE
	.short 0          ; SPECIES_MANAPHY
	.short 0          ; SPECIES_DARKRAI
	.short 1          ; SPECIES_SHAYMIN
	.short 17         ; SPECIES_ARCEUS

_020FECAE:
	.short 0          ; SPECIES_BULBASAUR
	.short 0          ; SPECIES_IVYSAUR
	.short 1          ; SPECIES_VENUSAUR
	.short 0          ; SPECIES_CHARMANDER
	.short 0          ; SPECIES_CHARMELEON
	.short 0          ; SPECIES_CHARIZARD
	.short 0          ; SPECIES_SQUIRTLE
	.short 0          ; SPECIES_WARTORTLE
	.short 0          ; SPECIES_BLASTOISE
	.short 0          ; SPECIES_CATERPIE
	.short 0          ; SPECIES_METAPOD
	.short 0          ; SPECIES_BUTTERFREE
	.short 0          ; SPECIES_WEEDLE
	.short 0          ; SPECIES_KAKUNA
	.short 0          ; SPECIES_BEEDRILL
	.short 0          ; SPECIES_PIDGEY
	.short 0          ; SPECIES_PIDGEOTTO
	.short 0          ; SPECIES_PIDGEOT
	.short 0          ; SPECIES_RATTATA
	.short 0          ; SPECIES_RATICATE
	.short 0          ; SPECIES_SPEAROW
	.short 0          ; SPECIES_FEAROW
	.short 0          ; SPECIES_EKANS
	.short 0          ; SPECIES_ARBOK
	.short 1          ; SPECIES_PIKACHU
	.short 0          ; SPECIES_RAICHU
	.short 0          ; SPECIES_SANDSHREW
	.short 0          ; SPECIES_SANDSLASH
	.short 0          ; SPECIES_NIDORAN_F
	.short 0          ; SPECIES_NIDORINA
	.short 0          ; SPECIES_NIDOQUEEN
	.short 0          ; SPECIES_NIDORAN_M
	.short 0          ; SPECIES_NIDORINO
	.short 0          ; SPECIES_NIDOKING
	.short 0          ; SPECIES_CLEFAIRY
	.short 0          ; SPECIES_CLEFABLE
	.short 0          ; SPECIES_VULPIX
	.short 0          ; SPECIES_NINETALES
	.short 0          ; SPECIES_JIGGLYPUFF
	.short 0          ; SPECIES_WIGGLYTUFF
	.short 0          ; SPECIES_ZUBAT
	.short 0          ; SPECIES_GOLBAT
	.short 0          ; SPECIES_ODDISH
	.short 0          ; SPECIES_GLOOM
	.short 0          ; SPECIES_VILEPLUME
	.short 0          ; SPECIES_PARAS
	.short 0          ; SPECIES_PARASECT
	.short 0          ; SPECIES_VENONAT
	.short 0          ; SPECIES_VENOMOTH
	.short 0          ; SPECIES_DIGLETT
	.short 0          ; SPECIES_DUGTRIO
	.short 0          ; SPECIES_MEOWTH
	.short 0          ; SPECIES_PERSIAN
	.short 0          ; SPECIES_PSYDUCK
	.short 0          ; SPECIES_GOLDUCK
	.short 0          ; SPECIES_MANKEY
	.short 0          ; SPECIES_PRIMEAPE
	.short 0          ; SPECIES_GROWLITHE
	.short 0          ; SPECIES_ARCANINE
	.short 0          ; SPECIES_POLIWAG
	.short 0          ; SPECIES_POLIWHIRL
	.short 0          ; SPECIES_POLIWRATH
	.short 0          ; SPECIES_ABRA
	.short 0          ; SPECIES_KADABRA
	.short 0          ; SPECIES_ALAKAZAM
	.short 0          ; SPECIES_MACHOP
	.short 0          ; SPECIES_MACHOKE
	.short 0          ; SPECIES_MACHAMP
	.short 0          ; SPECIES_BELLSPROUT
	.short 0          ; SPECIES_WEEPINBELL
	.short 0          ; SPECIES_VICTREEBEL
	.short 0          ; SPECIES_TENTACOOL
	.short 0          ; SPECIES_TENTACRUEL
	.short 0          ; SPECIES_GEODUDE
	.short 0          ; SPECIES_GRAVELER
	.short 0          ; SPECIES_GOLEM
	.short 0          ; SPECIES_PONYTA
	.short 0          ; SPECIES_RAPIDASH
	.short 0          ; SPECIES_SLOWPOKE
	.short 0          ; SPECIES_SLOWBRO
	.short 0          ; SPECIES_MAGNEMITE
	.short 0          ; SPECIES_MAGNETON
	.short 0          ; SPECIES_FARFETCHD
	.short 0          ; SPECIES_DODUO
	.short 0          ; SPECIES_DODRIO
	.short 0          ; SPECIES_SEEL
	.short 0          ; SPECIES_DEWGONG
	.short 0          ; SPECIES_GRIMER
	.short 0          ; SPECIES_MUK
	.short 0          ; SPECIES_SHELLDER
	.short 0          ; SPECIES_CLOYSTER
	.short 0          ; SPECIES_GASTLY
	.short 0          ; SPECIES_HAUNTER
	.short 0          ; SPECIES_GENGAR
	.short 0          ; SPECIES_ONIX
	.short 0          ; SPECIES_DROWZEE
	.short 0          ; SPECIES_HYPNO
	.short 0          ; SPECIES_KRABBY
	.short 0          ; SPECIES_KINGLER
	.short 0          ; SPECIES_VOLTORB
	.short 0          ; SPECIES_ELECTRODE
	.short 0          ; SPECIES_EXEGGCUTE
	.short 0          ; SPECIES_EXEGGUTOR
	.short 0          ; SPECIES_CUBONE
	.short 0          ; SPECIES_MAROWAK
	.short 0          ; SPECIES_HITMONLEE
	.short 0          ; SPECIES_HITMONCHAN
	.short 0          ; SPECIES_LICKITUNG
	.short 0          ; SPECIES_KOFFING
	.short 0          ; SPECIES_WEEZING
	.short 0          ; SPECIES_RHYHORN
	.short 0          ; SPECIES_RHYDON
	.short 0          ; SPECIES_CHANSEY
	.short 0          ; SPECIES_TANGELA
	.short 0          ; SPECIES_KANGASKHAN
	.short 0          ; SPECIES_HORSEA
	.short 0          ; SPECIES_SEADRA
	.short 0          ; SPECIES_GOLDEEN
	.short 0          ; SPECIES_SEAKING
	.short 0          ; SPECIES_STARYU
	.short 0          ; SPECIES_STARMIE
	.short 0          ; SPECIES_MR_MIME
	.short 0          ; SPECIES_SCYTHER
	.short 0          ; SPECIES_JYNX
	.short 0          ; SPECIES_ELECTABUZZ
	.short 0          ; SPECIES_MAGMAR
	.short 0          ; SPECIES_PINSIR
	.short 0          ; SPECIES_TAUROS
	.short 0          ; SPECIES_MAGIKARP
	.short 0          ; SPECIES_GYARADOS
	.short 0          ; SPECIES_LAPRAS
	.short 0          ; SPECIES_DITTO
	.short 0          ; SPECIES_EEVEE
	.short 0          ; SPECIES_VAPOREON
	.short 0          ; SPECIES_JOLTEON
	.short 0          ; SPECIES_FLAREON
	.short 0          ; SPECIES_PORYGON
	.short 0          ; SPECIES_OMANYTE
	.short 0          ; SPECIES_OMASTAR
	.short 0          ; SPECIES_KABUTO
	.short 0          ; SPECIES_KABUTOPS
	.short 0          ; SPECIES_AERODACTYL
	.short 0          ; SPECIES_SNORLAX
	.short 0          ; SPECIES_ARTICUNO
	.short 0          ; SPECIES_ZAPDOS
	.short 0          ; SPECIES_MOLTRES
	.short 0          ; SPECIES_DRATINI
	.short 0          ; SPECIES_DRAGONAIR
	.short 0          ; SPECIES_DRAGONITE
	.short 0          ; SPECIES_MEWTWO
	.short 0          ; SPECIES_MEW
	.short 0          ; SPECIES_CHIKORITA
	.short 0          ; SPECIES_BAYLEEF
	.short 1          ; SPECIES_MEGANIUM
	.short 0          ; SPECIES_CYNDAQUIL
	.short 0          ; SPECIES_QUILAVA
	.short 0          ; SPECIES_TYPHLOSION
	.short 0          ; SPECIES_TOTODILE
	.short 0          ; SPECIES_CROCONAW
	.short 0          ; SPECIES_FERALIGATR
	.short 0          ; SPECIES_SENTRET
	.short 0          ; SPECIES_FURRET
	.short 0          ; SPECIES_HOOTHOOT
	.short 0          ; SPECIES_NOCTOWL
	.short 0          ; SPECIES_LEDYBA
	.short 0          ; SPECIES_LEDIAN
	.short 0          ; SPECIES_SPINARAK
	.short 0          ; SPECIES_ARIADOS
	.short 0          ; SPECIES_CROBAT
	.short 0          ; SPECIES_CHINCHOU
	.short 0          ; SPECIES_LANTURN
	.short 0          ; SPECIES_PICHU
	.short 0          ; SPECIES_CLEFFA
	.short 0          ; SPECIES_IGGLYBUFF
	.short 0          ; SPECIES_TOGEPI
	.short 0          ; SPECIES_TOGETIC
	.short 0          ; SPECIES_NATU
	.short 0          ; SPECIES_XATU
	.short 0          ; SPECIES_MAREEP
	.short 0          ; SPECIES_FLAAFFY
	.short 0          ; SPECIES_AMPHAROS
	.short 0          ; SPECIES_BELLOSSOM
	.short 0          ; SPECIES_MARILL
	.short 0          ; SPECIES_AZUMARILL
	.short 0          ; SPECIES_SUDOWOODO
	.short 0          ; SPECIES_POLITOED
	.short 0          ; SPECIES_HOPPIP
	.short 0          ; SPECIES_SKIPLOOM
	.short 0          ; SPECIES_JUMPLUFF
	.short 0          ; SPECIES_AIPOM
	.short 0          ; SPECIES_SUNKERN
	.short 0          ; SPECIES_SUNFLORA
	.short 0          ; SPECIES_YANMA
	.short 0          ; SPECIES_WOOPER
	.short 0          ; SPECIES_QUAGSIRE
	.short 0          ; SPECIES_ESPEON
	.short 0          ; SPECIES_UMBREON
	.short 0          ; SPECIES_MURKROW
	.short 0          ; SPECIES_SLOWKING
	.short 0          ; SPECIES_MISDREAVUS
	.short 0          ; SPECIES_UNOWN
	.short 1          ; SPECIES_WOBBUFFET
	.short 0          ; SPECIES_GIRAFARIG
	.short 0          ; SPECIES_PINECO
	.short 0          ; SPECIES_FORRETRESS
	.short 0          ; SPECIES_DUNSPARCE
	.short 0          ; SPECIES_GLIGAR
	.short 1          ; SPECIES_STEELIX
	.short 0          ; SPECIES_SNUBBULL
	.short 0          ; SPECIES_GRANBULL
	.short 0          ; SPECIES_QWILFISH
	.short 0          ; SPECIES_SCIZOR
	.short 0          ; SPECIES_SHUCKLE
	.short 1          ; SPECIES_HERACROSS
	.short 0          ; SPECIES_SNEASEL
	.short 0          ; SPECIES_TEDDIURSA
	.short 0          ; SPECIES_URSARING
	.short 0          ; SPECIES_SLUGMA
	.short 0          ; SPECIES_MAGCARGO
	.short 0          ; SPECIES_SWINUB
	.short 0          ; SPECIES_PILOSWINE
	.short 0          ; SPECIES_CORSOLA
	.short 0          ; SPECIES_REMORAID
	.short 0          ; SPECIES_OCTILLERY
	.short 0          ; SPECIES_DELIBIRD
	.short 0          ; SPECIES_MANTINE
	.short 0          ; SPECIES_SKARMORY
	.short 0          ; SPECIES_HOUNDOUR
	.short 0          ; SPECIES_HOUNDOOM
	.short 0          ; SPECIES_KINGDRA
	.short 0          ; SPECIES_PHANPY
	.short 0          ; SPECIES_DONPHAN
	.short 0          ; SPECIES_PORYGON2
	.short 0          ; SPECIES_STANTLER
	.short 0          ; SPECIES_SMEARGLE
	.short 0          ; SPECIES_TYROGUE
	.short 0          ; SPECIES_HITMONTOP
	.short 0          ; SPECIES_SMOOCHUM
	.short 0          ; SPECIES_ELEKID
	.short 0          ; SPECIES_MAGBY
	.short 0          ; SPECIES_MILTANK
	.short 0          ; SPECIES_BLISSEY
	.short 0          ; SPECIES_RAIKOU
	.short 0          ; SPECIES_ENTEI
	.short 0          ; SPECIES_SUICUNE
	.short 0          ; SPECIES_LARVITAR
	.short 0          ; SPECIES_PUPITAR
	.short 0          ; SPECIES_TYRANITAR
	.short 0          ; SPECIES_LUGIA
	.short 0          ; SPECIES_HO_OH
	.short 0          ; SPECIES_CELEBI
	.short 0          ; SPECIES_TREECKO
	.short 0          ; SPECIES_GROVYLE
	.short 0          ; SPECIES_SCEPTILE
	.short 0          ; SPECIES_TORCHIC
	.short 0          ; SPECIES_COMBUSKEN
	.short 0          ; SPECIES_BLAZIKEN
	.short 0          ; SPECIES_MUDKIP
	.short 0          ; SPECIES_MARSHTOMP
	.short 0          ; SPECIES_SWAMPERT
	.short 0          ; SPECIES_POOCHYENA
	.short 0          ; SPECIES_MIGHTYENA
	.short 0          ; SPECIES_ZIGZAGOON
	.short 0          ; SPECIES_LINOONE
	.short 0          ; SPECIES_WURMPLE
	.short 0          ; SPECIES_SILCOON
	.short 0          ; SPECIES_BEAUTIFLY
	.short 0          ; SPECIES_CASCOON
	.short 0          ; SPECIES_DUSTOX
	.short 0          ; SPECIES_LOTAD
	.short 0          ; SPECIES_LOMBRE
	.short 0          ; SPECIES_LUDICOLO
	.short 0          ; SPECIES_SEEDOT
	.short 0          ; SPECIES_NUZLEAF
	.short 0          ; SPECIES_SHIFTRY
	.short 0          ; SPECIES_TAILLOW
	.short 0          ; SPECIES_SWELLOW
	.short 0          ; SPECIES_WINGULL
	.short 0          ; SPECIES_PELIPPER
	.short 0          ; SPECIES_RALTS
	.short 0          ; SPECIES_KIRLIA
	.short 0          ; SPECIES_GARDEVOIR
	.short 0          ; SPECIES_SURSKIT
	.short 0          ; SPECIES_MASQUERAIN
	.short 0          ; SPECIES_SHROOMISH
	.short 0          ; SPECIES_BRELOOM
	.short 0          ; SPECIES_SLAKOTH
	.short 0          ; SPECIES_VIGOROTH
	.short 0          ; SPECIES_SLAKING
	.short 0          ; SPECIES_NINCADA
	.short 0          ; SPECIES_NINJASK
	.short 0          ; SPECIES_SHEDINJA
	.short 0          ; SPECIES_WHISMUR
	.short 0          ; SPECIES_LOUDRED
	.short 0          ; SPECIES_EXPLOUD
	.short 0          ; SPECIES_MAKUHITA
	.short 0          ; SPECIES_HARIYAMA
	.short 0          ; SPECIES_AZURILL
	.short 0          ; SPECIES_NOSEPASS
	.short 0          ; SPECIES_SKITTY
	.short 0          ; SPECIES_DELCATTY
	.short 0          ; SPECIES_SABLEYE
	.short 0          ; SPECIES_MAWILE
	.short 0          ; SPECIES_ARON
	.short 0          ; SPECIES_LAIRON
	.short 0          ; SPECIES_AGGRON
	.short 0          ; SPECIES_MEDITITE
	.short 0          ; SPECIES_MEDICHAM
	.short 0          ; SPECIES_ELECTRIKE
	.short 0          ; SPECIES_MANECTRIC
	.short 0          ; SPECIES_PLUSLE
	.short 0          ; SPECIES_MINUN
	.short 0          ; SPECIES_VOLBEAT
	.short 0          ; SPECIES_ILLUMISE
	.short 0          ; SPECIES_ROSELIA
	.short 0          ; SPECIES_GULPIN
	.short 0          ; SPECIES_SWALOT
	.short 0          ; SPECIES_CARVANHA
	.short 0          ; SPECIES_SHARPEDO
	.short 0          ; SPECIES_WAILMER
	.short 0          ; SPECIES_WAILORD
	.short 0          ; SPECIES_NUMEL
	.short 0          ; SPECIES_CAMERUPT
	.short 0          ; SPECIES_TORKOAL
	.short 0          ; SPECIES_SPOINK
	.short 0          ; SPECIES_GRUMPIG
	.short 0          ; SPECIES_SPINDA
	.short 0          ; SPECIES_TRAPINCH
	.short 0          ; SPECIES_VIBRAVA
	.short 0          ; SPECIES_FLYGON
	.short 0          ; SPECIES_CACNEA
	.short 0          ; SPECIES_CACTURNE
	.short 0          ; SPECIES_SWABLU
	.short 0          ; SPECIES_ALTARIA
	.short 0          ; SPECIES_ZANGOOSE
	.short 0          ; SPECIES_SEVIPER
	.short 0          ; SPECIES_LUNATONE
	.short 0          ; SPECIES_SOLROCK
	.short 0          ; SPECIES_BARBOACH
	.short 0          ; SPECIES_WHISCASH
	.short 0          ; SPECIES_CORPHISH
	.short 0          ; SPECIES_CRAWDAUNT
	.short 0          ; SPECIES_BALTOY
	.short 0          ; SPECIES_CLAYDOL
	.short 0          ; SPECIES_LILEEP
	.short 0          ; SPECIES_CRADILY
	.short 0          ; SPECIES_ANORITH
	.short 0          ; SPECIES_ARMALDO
	.short 0          ; SPECIES_FEEBAS
	.short 0          ; SPECIES_MILOTIC
	.short 0          ; SPECIES_CASTFORM
	.short 0          ; SPECIES_KECLEON
	.short 0          ; SPECIES_SHUPPET
	.short 0          ; SPECIES_BANETTE
	.short 0          ; SPECIES_DUSKULL
	.short 0          ; SPECIES_DUSCLOPS
	.short 0          ; SPECIES_TROPIUS
	.short 0          ; SPECIES_CHIMECHO
	.short 0          ; SPECIES_ABSOL
	.short 0          ; SPECIES_WYNAUT
	.short 0          ; SPECIES_SNORUNT
	.short 0          ; SPECIES_GLALIE
	.short 0          ; SPECIES_SPHEAL
	.short 0          ; SPECIES_SEALEO
	.short 0          ; SPECIES_WALREIN
	.short 0          ; SPECIES_CLAMPERL
	.short 0          ; SPECIES_HUNTAIL
	.short 0          ; SPECIES_GOREBYSS
	.short 0          ; SPECIES_RELICANTH
	.short 0          ; SPECIES_LUVDISC
	.short 0          ; SPECIES_BAGON
	.short 0          ; SPECIES_SHELGON
	.short 0          ; SPECIES_SALAMENCE
	.short 0          ; SPECIES_BELDUM
	.short 0          ; SPECIES_METANG
	.short 0          ; SPECIES_METAGROSS
	.short 0          ; SPECIES_REGIROCK
	.short 0          ; SPECIES_REGICE
	.short 0          ; SPECIES_REGISTEEL
	.short 0          ; SPECIES_LATIAS
	.short 0          ; SPECIES_LATIOS
	.short 0          ; SPECIES_KYOGRE
	.short 0          ; SPECIES_GROUDON
	.short 0          ; SPECIES_RAYQUAZA
	.short 0          ; SPECIES_JIRACHI
	.short 0          ; SPECIES_DEOXYS
	.short 0          ; SPECIES_TURTWIG
	.short 0          ; SPECIES_GROTLE
	.short 0          ; SPECIES_TORTERRA
	.short 0          ; SPECIES_CHIMCHAR
	.short 0          ; SPECIES_MONFERNO
	.short 0          ; SPECIES_INFERNAPE
	.short 0          ; SPECIES_PIPLUP
	.short 0          ; SPECIES_PRINPLUP
	.short 0          ; SPECIES_EMPOLEON
	.short 0          ; SPECIES_STARLY
	.short 0          ; SPECIES_STARAVIA
	.short 0          ; SPECIES_STARAPTOR
	.short 0          ; SPECIES_BIDOOF
	.short 0          ; SPECIES_BIBAREL
	.short 0          ; SPECIES_KRICKETOT
	.short 0          ; SPECIES_KRICKETUNE
	.short 0          ; SPECIES_SHINX
	.short 0          ; SPECIES_LUXIO
	.short 0          ; SPECIES_LUXRAY
	.short 0          ; SPECIES_BUDEW
	.short 0          ; SPECIES_ROSERADE
	.short 0          ; SPECIES_CRANIDOS
	.short 0          ; SPECIES_RAMPARDOS
	.short 0          ; SPECIES_SHIELDON
	.short 0          ; SPECIES_BASTIODON
	.short 0          ; SPECIES_BURMY
	.short 0          ; SPECIES_WORMADAM
	.short 0          ; SPECIES_MOTHIM
	.short 1          ; SPECIES_COMBEE
	.short 0          ; SPECIES_VESPIQUEN
	.short 0          ; SPECIES_PACHIRISU
	.short 0          ; SPECIES_BUIZEL
	.short 0          ; SPECIES_FLOATZEL
	.short 0          ; SPECIES_CHERUBI
	.short 0          ; SPECIES_CHERRIM
	.short 0          ; SPECIES_SHELLOS
	.short 0          ; SPECIES_GASTRODON
	.short 0          ; SPECIES_AMBIPOM
	.short 0          ; SPECIES_DRIFLOON
	.short 0          ; SPECIES_DRIFBLIM
	.short 0          ; SPECIES_BUNEARY
	.short 0          ; SPECIES_LOPUNNY
	.short 0          ; SPECIES_MISMAGIUS
	.short 0          ; SPECIES_HONCHKROW
	.short 0          ; SPECIES_GLAMEOW
	.short 0          ; SPECIES_PURUGLY
	.short 0          ; SPECIES_CHINGLING
	.short 0          ; SPECIES_STUNKY
	.short 0          ; SPECIES_SKUNTANK
	.short 0          ; SPECIES_BRONZOR
	.short 0          ; SPECIES_BRONZONG
	.short 0          ; SPECIES_BONSLY
	.short 0          ; SPECIES_MIME_JR
	.short 0          ; SPECIES_HAPPINY
	.short 0          ; SPECIES_CHATOT
	.short 0          ; SPECIES_SPIRITOMB
	.short 1          ; SPECIES_GIBLE
	.short 1          ; SPECIES_GABITE
	.short 1          ; SPECIES_GARCHOMP
	.short 0          ; SPECIES_MUNCHLAX
	.short 0          ; SPECIES_RIOLU
	.short 0          ; SPECIES_LUCARIO
	.short 1          ; SPECIES_HIPPOPOTAS
	.short 1          ; SPECIES_HIPPOWDON
	.short 0          ; SPECIES_SKORUPI
	.short 0          ; SPECIES_DRAPION
	.short 0          ; SPECIES_CROAGUNK
	.short 0          ; SPECIES_TOXICROAK
	.short 0          ; SPECIES_CARNIVINE
	.short 0          ; SPECIES_FINNEON
	.short 0          ; SPECIES_LUMINEON
	.short 0          ; SPECIES_MANTYKE
	.short 0          ; SPECIES_SNOVER
	.short 0          ; SPECIES_ABOMASNOW
	.short 0          ; SPECIES_WEAVILE
	.short 0          ; SPECIES_MAGNEZONE
	.short 0          ; SPECIES_LICKILICKY
	.short 0          ; SPECIES_RHYPERIOR
	.short 0          ; SPECIES_TANGROWTH
	.short 0          ; SPECIES_ELECTIVIRE
	.short 0          ; SPECIES_MAGMORTAR
	.short 0          ; SPECIES_TOGEKISS
	.short 0          ; SPECIES_YANMEGA
	.short 0          ; SPECIES_LEAFEON
	.short 0          ; SPECIES_GLACEON
	.short 0          ; SPECIES_GLISCOR
	.short 0          ; SPECIES_MAMOSWINE
	.short 0          ; SPECIES_PORYGON_Z
	.short 0          ; SPECIES_GALLADE
	.short 0          ; SPECIES_PROBOPASS
	.short 0          ; SPECIES_DUSKNOIR
	.short 0          ; SPECIES_FROSLASS
	.short 0          ; SPECIES_ROTOM
	.short 0          ; SPECIES_UXIE
	.short 0          ; SPECIES_MESPRIT
	.short 0          ; SPECIES_AZELF
	.short 0          ; SPECIES_DIALGA
	.short 0          ; SPECIES_PALKIA
	.short 0          ; SPECIES_HEATRAN
	.short 0          ; SPECIES_REGIGIGAS
	.short 0          ; SPECIES_GIRATINA
	.short 0          ; SPECIES_CRESSELIA
	.short 0          ; SPECIES_PHIONE
	.short 0          ; SPECIES_MANAPHY
	.short 0          ; SPECIES_DARKRAI
	.short 0          ; SPECIES_SHAYMIN
	.short 0          ; SPECIES_ARCEUS

_020FF088:
	.short 0x0000
	.short 0x0000
	.short 0x0001
	.short 0x0002
	.short 0x0004
	.short 0x0005
	.short 0x0006
	.short 0x0007
	.short 0x0008
	.short 0x0009
	.short 0x000A
	.short 0x000B
	.short 0x000C
	.short 0x000D
	.short 0x000E
	.short 0x000F
	.short 0x0010
	.short 0x0011
	.short 0x0012
	.short 0x0013
	.short 0x0014
	.short 0x0015
	.short 0x0016
	.short 0x0017
	.short 0x0018
	.short 0x0019
	.short 0x001B
	.short 0x001C
	.short 0x001D
	.short 0x001E
	.short 0x001F
	.short 0x0020
	.short 0x0021
	.short 0x0022
	.short 0x0023
	.short 0x0024
	.short 0x0025
	.short 0x0026
	.short 0x0027
	.short 0x0028
	.short 0x0029
	.short 0x002A
	.short 0x002B
	.short 0x002C
	.short 0x002D
	.short 0x002E
	.short 0x002F
	.short 0x0030
	.short 0x0031
	.short 0x0032
	.short 0x0033
	.short 0x0034
	.short 0x0035
	.short 0x0036
	.short 0x0037
	.short 0x0038
	.short 0x0039
	.short 0x003A
	.short 0x003B
	.short 0x003C
	.short 0x003D
	.short 0x003E
	.short 0x003F
	.short 0x0040
	.short 0x0041
	.short 0x0042
	.short 0x0043
	.short 0x0044
	.short 0x0045
	.short 0x0046
	.short 0x0047
	.short 0x0048
	.short 0x0049
	.short 0x004A
	.short 0x004B
	.short 0x004C
	.short 0x004D
	.short 0x004E
	.short 0x004F
	.short 0x0050
	.short 0x0051
	.short 0x0052
	.short 0x0053
	.short 0x0054
	.short 0x0055
	.short 0x0056
	.short 0x0057
	.short 0x0058
	.short 0x0059
	.short 0x005A
	.short 0x005B
	.short 0x005C
	.short 0x005D
	.short 0x005E
	.short 0x005F
	.short 0x0060
	.short 0x0061
	.short 0x0062
	.short 0x0063
	.short 0x0064
	.short 0x0065
	.short 0x0066
	.short 0x0067
	.short 0x0068
	.short 0x0069
	.short 0x006A
	.short 0x006B
	.short 0x006C
	.short 0x006D
	.short 0x006E
	.short 0x006F
	.short 0x0070
	.short 0x0071
	.short 0x0072
	.short 0x0073
	.short 0x0074
	.short 0x0075
	.short 0x0076
	.short 0x0077
	.short 0x0078
	.short 0x0079
	.short 0x007A
	.short 0x007B
	.short 0x007C
	.short 0x007D
	.short 0x007E
	.short 0x007F
	.short 0x0080
	.short 0x0081
	.short 0x0082
	.short 0x0083
	.short 0x0084
	.short 0x0085
	.short 0x0086
	.short 0x0087
	.short 0x0088
	.short 0x0089
	.short 0x008A
	.short 0x008B
	.short 0x008C
	.short 0x008D
	.short 0x008E
	.short 0x008F
	.short 0x0090
	.short 0x0091
	.short 0x0092
	.short 0x0093
	.short 0x0094
	.short 0x0095
	.short 0x0096
	.short 0x0097
	.short 0x0098
	.short 0x0099
	.short 0x009A
	.short 0x009B
	.short 0x009D
	.short 0x009E
	.short 0x009F
	.short 0x00A0
	.short 0x00A1
	.short 0x00A2
	.short 0x00A3
	.short 0x00A4
	.short 0x00A5
	.short 0x00A6
	.short 0x00A7
	.short 0x00A8
	.short 0x00A9
	.short 0x00AA
	.short 0x00AB
	.short 0x00AC
	.short 0x00AD
	.short 0x00AE
	.short 0x00B0
	.short 0x00B1
	.short 0x00B2
	.short 0x00B3
	.short 0x00B4
	.short 0x00B5
	.short 0x00B6
	.short 0x00B7
	.short 0x00B8
	.short 0x00B9
	.short 0x00BA
	.short 0x00BB
	.short 0x00BC
	.short 0x00BD
	.short 0x00BE
	.short 0x00BF
	.short 0x00C0
	.short 0x00C1
	.short 0x00C2
	.short 0x00C3
	.short 0x00C4
	.short 0x00C5
	.short 0x00C6
	.short 0x00C7
	.short 0x00C8
	.short 0x00C9
	.short 0x00CA
	.short 0x00CB
	.short 0x00CC
	.short 0x00E8
	.short 0x00EA
	.short 0x00EB
	.short 0x00EC
	.short 0x00ED
	.short 0x00EE
	.short 0x00EF
	.short 0x00F1
	.short 0x00F2
	.short 0x00F3
	.short 0x00F4
	.short 0x00F5
	.short 0x00F6
	.short 0x00F8
	.short 0x00F9
	.short 0x00FA
	.short 0x00FB
	.short 0x00FC
	.short 0x00FD
	.short 0x00FE
	.short 0x00FF
	.short 0x0100
	.short 0x0101
	.short 0x0102
	.short 0x0103
	.short 0x0104
	.short 0x0105
	.short 0x0106
	.short 0x0107
	.short 0x0108
	.short 0x0109
	.short 0x010A
	.short 0x010B
	.short 0x010C
	.short 0x010D
	.short 0x010E
	.short 0x010F
	.short 0x0110
	.short 0x0111
	.short 0x0112
	.short 0x0113
	.short 0x0114
	.short 0x0115
	.short 0x0116
	.short 0x0117
	.short 0x0118
	.short 0x0119
	.short 0x011A
	.short 0x011B
	.short 0x011C
	.short 0x011D
	.short 0x011E
	.short 0x011F
	.short 0x0120
	.short 0x0121
	.short 0x0122
	.short 0x0123
	.short 0x0124
	.short 0x0125
	.short 0x0126
	.short 0x0127
	.short 0x0128
	.short 0x0129
	.short 0x012A
	.short 0x012B
	.short 0x012C
	.short 0x012D
	.short 0x012E
	.short 0x012F
	.short 0x0130
	.short 0x0131
	.short 0x0132
	.short 0x0133
	.short 0x0134
	.short 0x0135
	.short 0x0136
	.short 0x0137
	.short 0x0138
	.short 0x0139
	.short 0x013A
	.short 0x013B
	.short 0x013C
	.short 0x013D
	.short 0x013E
	.short 0x013F
	.short 0x0140
	.short 0x0141
	.short 0x0142
	.short 0x0143
	.short 0x0144
	.short 0x0145
	.short 0x0146
	.short 0x0147
	.short 0x0148
	.short 0x0149
	.short 0x014A
	.short 0x014B
	.short 0x014C
	.short 0x014D
	.short 0x014E
	.short 0x014F
	.short 0x0150
	.short 0x0151
	.short 0x0152
	.short 0x0153
	.short 0x0154
	.short 0x0155
	.short 0x0156
	.short 0x0157
	.short 0x0158
	.short 0x0159
	.short 0x015A
	.short 0x015B
	.short 0x015C
	.short 0x015D
	.short 0x015E
	.short 0x015F
	.short 0x0160
	.short 0x0161
	.short 0x0162
	.short 0x0163
	.short 0x0164
	.short 0x0165
	.short 0x0166
	.short 0x0167
	.short 0x0168
	.short 0x0169
	.short 0x016A
	.short 0x016B
	.short 0x016C
	.short 0x016D
	.short 0x016E
	.short 0x016F
	.short 0x0170
	.short 0x0171
	.short 0x0172
	.short 0x0173
	.short 0x0174
	.short 0x0175
	.short 0x0176
	.short 0x0177
	.short 0x0178
	.short 0x0179
	.short 0x017A
	.short 0x017B
	.short 0x017C
	.short 0x017D
	.short 0x017E
	.short 0x017F
	.short 0x0180
	.short 0x0181
	.short 0x0182
	.short 0x0183
	.short 0x0184
	.short 0x0185
	.short 0x0186
	.short 0x0187
	.short 0x0188
	.short 0x0189
	.short 0x018A
	.short 0x018B
	.short 0x018C
	.short 0x018D
	.short 0x018E
	.short 0x018F
	.short 0x0190
	.short 0x0191
	.short 0x0192
	.short 0x0193
	.short 0x0194
	.short 0x0195
	.short 0x0196
	.short 0x0197
	.short 0x0198
	.short 0x0199
	.short 0x019A
	.short 0x019B
	.short 0x019C
	.short 0x019D
	.short 0x019E
	.short 0x019F
	.short 0x01A0
	.short 0x01A1
	.short 0x01A2
	.short 0x01A3
	.short 0x01A7
	.short 0x01A8
	.short 0x01A9
	.short 0x01AA
	.short 0x01AB
	.short 0x01AC
	.short 0x01AD
	.short 0x01AE
	.short 0x01AF
	.short 0x01B0
	.short 0x01B1
	.short 0x01B2
	.short 0x01B3
	.short 0x01B4
	.short 0x01B5
	.short 0x01B6
	.short 0x01B7
	.short 0x01B8
	.short 0x01B9
	.short 0x01BA
	.short 0x01BB
	.short 0x01BC
	.short 0x01BD
	.short 0x01BE
	.short 0x01BF
	.short 0x01C0
	.short 0x01C3
	.short 0x01C6
	.short 0x01C7
	.short 0x01C9
	.short 0x01CA
	.short 0x01CB
	.short 0x01CC
	.short 0x01CD
	.short 0x01CE
	.short 0x01CF
	.short 0x01D1
	.short 0x01D3
	.short 0x01D4
	.short 0x01D5
	.short 0x01D6
	.short 0x01D7
	.short 0x01D8
	.short 0x01D9
	.short 0x01DA
	.short 0x01DB
	.short 0x01DC
	.short 0x01DD
	.short 0x01DE
	.short 0x01DF
	.short 0x01E0
	.short 0x01E1
	.short 0x01E2
	.short 0x01E3
	.short 0x01E4
	.short 0x01E5
	.short 0x01E6
	.short 0x01E8
	.short 0x01EA
	.short 0x01EC
	.short 0x01ED
	.short 0x01EE
	.short 0x01EF
	.short 0x01F1
	.short 0x01F3
	.short 0x01F4
	.short 0x01F5
	.short 0x01F6
	.short 0x01F7
	.short 0x01F8
	.short 0x01F9
	.short 0x01FA
	.short 0x01FB
	.short 0x01FC
	.short 0x01FD
	.short 0x01FE
	.short 0x01FF
	.short 0x0200
	.short 0x0201
	.short 0x0202
	.short 0x0203
	.short 0x0204
	.short 0x0205
	.short 0x0206
	.short 0x0207
	.short 0x0208
	.short 0x0209
	.short 0x020A
	.short 0x020B
	.short 0x020C
	.short 0x020D
	.short 0x020E
	.short 0x020F
	.short 0x0215
	.short 0x0216
	.short 0x0217
	.short 0x0218
	.short 0x0219
	.short 0x021A
	.short 0x021B
	.short 0x021C
	.short 0x021E
	.short 0x021F
	.short 0x0220
	.short 0x0221
	.short 0x0222
	.short 0x0224
