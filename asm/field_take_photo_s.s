#include "constants/species.h"
#include "constants/maps.h"
#include "constants/sprites.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "field_take_photo.inc"
	.include "global.inc"

	.public NNS_G3dGlb
	.extern sPhotoMonCoordOffsets
	.extern sub_0206AEC0
	.extern sub_0206AF08
	.extern sub_0206AF78
	.extern sub_0206AFA4
	.extern sub_0206AFD0
	.extern sCameraParam

	.text

	thumb_func_start sub_0206B270
sub_0206B270: ; 0x0206B270
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	add r6, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnvironment
	add r4, r0, #0
	ldrb r1, [r4, #0x14]
	cmp r1, #0x14
	bls _0206B28C
	b _0206B824
_0206B28C:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0206B298: ; jump table
	.short _0206B2C2 - _0206B298 - 2 ; case 0
	.short _0206B2C8 - _0206B298 - 2 ; case 1
	.short _0206B2DC - _0206B298 - 2 ; case 2
	.short _0206B30A - _0206B298 - 2 ; case 3
	.short _0206B316 - _0206B298 - 2 ; case 4
	.short _0206B332 - _0206B298 - 2 ; case 5
	.short _0206B346 - _0206B298 - 2 ; case 6
	.short _0206B3AA - _0206B298 - 2 ; case 7
	.short _0206B416 - _0206B298 - 2 ; case 8
	.short _0206B480 - _0206B298 - 2 ; case 9
	.short _0206B4A4 - _0206B298 - 2 ; case 10
	.short _0206B4DA - _0206B298 - 2 ; case 11
	.short _0206B52C - _0206B298 - 2 ; case 12
	.short _0206B57E - _0206B298 - 2 ; case 13
	.short _0206B5A0 - _0206B298 - 2 ; case 14
	.short _0206B5BC - _0206B298 - 2 ; case 15
	.short _0206B74A - _0206B298 - 2 ; case 16
	.short _0206B768 - _0206B298 - 2 ; case 17
	.short _0206B794 - _0206B298 - 2 ; case 18
	.short _0206B7A0 - _0206B298 - 2 ; case 19
	.short _0206B81A - _0206B298 - 2 ; case 20
_0206B2C2:
	mov r0, #1
	strb r0, [r4, #0x14]
	b _0206B824
_0206B2C8:
	add r0, r5, #0
	mov r1, #3
	bl sub_0203E33C
	add r0, r6, #0
	bl sub_0205525C
	mov r0, #2
	strb r0, [r4, #0x14]
	b _0206B824
_0206B2DC:
	add r0, r5, #0
	mov r1, #1
	bl sub_02067A80
	ldr r0, [r4, #0x40]
	ldrh r2, [r0, #0x34]
	ldrh r1, [r0, #0x36]
	ldrh r0, [r0, #0x32]
	str r0, [r4]
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #4]
	str r2, [r4, #8]
	str r1, [r4, #0xc]
	mov r0, #1
	str r0, [r4, #0x10]
	add r0, r6, #0
	add r1, r4, #0
	bl sub_020537A8
	mov r0, #3
	strb r0, [r4, #0x14]
	b _0206B824
_0206B30A:
	add r0, r6, #0
	bl CallTask_RestoreOverworld
	mov r0, #4
	strb r0, [r4, #0x14]
	b _0206B824
_0206B316:
	ldr r0, [r5, #0x24]
	bl sub_0206AFD0
	ldr r1, [r4, #0x40]
	add r0, r5, #0
	bl sub_0206AF78
	ldr r1, [r4, #0x40]
	add r0, r5, #0
	bl sub_0206B880
	mov r0, #5
	strb r0, [r4, #0x14]
	b _0206B824
_0206B332:
	ldr r0, [r5, #0x3c]
	bl sub_0205F1A0
	add r1, r0, #0
	ldr r0, [r5, #0x3c]
	bl ov01_021F9FB0
	mov r0, #6
	strb r0, [r4, #0x14]
	b _0206B824
_0206B346:
	add r0, r5, #0
	bl FieldSystem_GetSaveData
	bl Save_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	ldr r1, [r4, #0x40]
	lsl r0, r0, #0x18
	add r1, #0x30
	lsr r2, r0, #0x18
	ldrb r1, [r1]
	ldr r0, [r5, #0x40]
	bl sub_0206B82C
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0x54
	bl MapObject_GetFacingVec
	mov r0, #2
	ldr r1, [sp, #0x58]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x58]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0x54
	bl MapObject_SetFacingVec
	ldr r0, [r4, #0x40]
	add r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0206B39C
	mov r0, #9
	strb r0, [r4, #0x14]
	mov r0, #2
	add r4, #0xcb
	strb r0, [r4]
	b _0206B824
_0206B39C:
	mov r0, #7
	strb r0, [r4, #0x14]
	ldr r0, [r4, #0x40]
	add r4, #0xcb
	ldrb r0, [r0, #7]
	strb r0, [r4]
	b _0206B824
_0206B3AA:
	ldrb r0, [r4, #0x17]
	ldr r1, [r4, #0x40]
	lsl r2, r0, #2
	add r0, r1, #0
	add r0, #0x6c
	ldrh r7, [r0, r2]
	add r3, r0, r2
	cmp r7, #0
	beq _0206B404
	ldr r6, _0206B6FC ; =sPhotoMonCoordOffsets
	mov r0, #1
	str r0, [sp]
	ldrh r0, [r1, #0x34]
	ldrh r6, [r6, r2]
	add r0, r0, r6
	str r0, [sp, #4]
	ldrh r0, [r1, #0x36]
	ldr r1, _0206B700 ; =sPhotoMonCoordOffsets + 2
	ldrh r1, [r1, r2]
	add r0, r0, r1
	str r0, [sp, #8]
	ldrb r0, [r3, #3]
	add r1, r7, #0
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #3]
	ldr r0, [r5, #0x3c]
	lsl r3, r3, #0x1e
	lsr r3, r3, #0x1f
	bl sub_0206AEC0
	ldrb r1, [r4, #0x17]
	lsl r1, r1, #2
	add r1, r4, r1
	str r0, [r1, #0x18]
	ldrb r0, [r4, #0x17]
	ldr r1, _0206B704 ; =ov01_021F7918
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x18]
	bl sub_0205F47C
	b _0206B40A
_0206B404:
	mov r1, #0
	add r0, r4, r2
	str r1, [r0, #0x18]
_0206B40A:
	ldrb r0, [r4, #0x17]
	add r0, r0, #1
	strb r0, [r4, #0x17]
	mov r0, #8
	strb r0, [r4, #0x14]
	b _0206B824
_0206B416:
	ldrb r1, [r4, #0x15]
	add r0, r1, #1
	strb r0, [r4, #0x15]
	cmp r1, #4
	bls _0206B4AE
	ldrb r0, [r4, #0x17]
	sub r0, r0, #1
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r5, [r0, #0x18]
	cmp r5, #0
	beq _0206B460
	add r0, r5, #0
	bl ov01_0220553C
	cmp r0, #0
	beq _0206B440
	mov r0, #1
	add r1, r5, #0
	bl ov01_021F902C
_0206B440:
	add r0, r5, #0
	add r1, sp, #0x48
	bl MapObject_GetFacingVec
	mov r0, #2
	ldr r1, [sp, #0x4c]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x4c]
	add r0, r5, #0
	add r1, sp, #0x48
	bl MapObject_SetFacingVec
	add r0, r5, #0
	bl sub_0205F484
_0206B460:
	mov r2, #0
	strb r2, [r4, #0x15]
	ldr r0, [r4, #0x40]
	ldrb r1, [r4, #0x17]
	ldrb r0, [r0, #7]
	cmp r1, r0
	blo _0206B47A
	add r0, r4, #0
	add r0, #0xc8
	strh r2, [r0]
	mov r0, #0xd
	strb r0, [r4, #0x14]
	b _0206B824
_0206B47A:
	mov r0, #7
	strb r0, [r4, #0x14]
	b _0206B824
_0206B480:
	ldr r3, [r4, #0x40]
	mov r2, #1
	ldrh r0, [r3, #0x36]
	add r1, r3, #0
	add r1, #0x44
	str r0, [sp]
	mov r0, #0xf9
	str r0, [sp, #4]
	ldrh r3, [r3, #0x34]
	ldrh r1, [r1]
	ldr r0, [r5, #0x3c]
	add r3, r3, #2
	bl sub_0206AF08
	str r0, [r4, #0x18]
	mov r0, #0xa
	strb r0, [r4, #0x14]
	b _0206B824
_0206B4A4:
	ldrb r1, [r4, #0x15]
	add r0, r1, #1
	strb r0, [r4, #0x15]
	cmp r1, #4
	bhi _0206B4B0
_0206B4AE:
	b _0206B824
_0206B4B0:
	ldr r0, [r4, #0x18]
	add r1, sp, #0x3c
	bl MapObject_GetFacingVec
	mov r0, #2
	ldr r1, [sp, #0x40]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x40]
	ldr r0, [r4, #0x18]
	add r1, sp, #0x3c
	bl MapObject_SetFacingVec
	ldr r0, [r4, #0x18]
	bl sub_0205F484
	mov r0, #0
	strb r0, [r4, #0x15]
	mov r0, #0xb
	strb r0, [r4, #0x14]
	b _0206B824
_0206B4DA:
	ldr r0, [r4, #0x40]
	ldrb r1, [r4, #0x17]
	add r2, r0, #0
	add r2, #0x6c
	lsl r1, r1, #2
	add r3, r2, r1
	ldrh r1, [r2, r1]
	cmp r1, #0
	beq _0206B51E
	mov r2, #1
	str r2, [sp]
	ldrh r2, [r0, #0x34]
	add r2, r2, #1
	str r2, [sp, #4]
	ldrh r2, [r0, #0x36]
	ldr r0, _0206B708 ; =0x0000FFFF
	add r0, r2, r0
	str r0, [sp, #8]
	ldrb r0, [r3, #3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #3]
	ldr r0, [r5, #0x3c]
	lsl r3, r3, #0x1e
	lsr r3, r3, #0x1f
	bl sub_0206AEC0
	ldr r1, _0206B704 ; =ov01_021F7918
	str r0, [r4, #0x1c]
	bl sub_0205F47C
	b _0206B526
_0206B51E:
	bl GF_AssertFail
	mov r0, #0
	str r0, [r4, #0x1c]
_0206B526:
	mov r0, #0xc
	strb r0, [r4, #0x14]
	b _0206B824
_0206B52C:
	ldrb r1, [r4, #0x15]
	add r0, r1, #1
	strb r0, [r4, #0x15]
	cmp r1, #4
	bls _0206B5C4
	ldr r5, [r4, #0x1c]
	cmp r5, #0
	beq _0206B56E
	add r0, r5, #0
	bl ov01_0220553C
	cmp r0, #0
	beq _0206B54E
	mov r0, #1
	add r1, r5, #0
	bl ov01_021F902C
_0206B54E:
	add r0, r5, #0
	add r1, sp, #0x30
	bl MapObject_GetFacingVec
	mov r0, #2
	ldr r1, [sp, #0x34]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x34]
	add r0, r5, #0
	add r1, sp, #0x30
	bl MapObject_SetFacingVec
	add r0, r5, #0
	bl sub_0205F484
_0206B56E:
	mov r1, #0
	add r0, r4, #0
	strb r1, [r4, #0x15]
	add r0, #0xc8
	strh r1, [r0]
	mov r0, #0xd
	strb r0, [r4, #0x14]
	b _0206B824
_0206B57E:
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	bl ov01_022043D8
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	bl ov01_02204424
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x10]
	bl ov01_021EB1E8
	mov r0, #0xe
	strb r0, [r4, #0x14]
	b _0206B824
_0206B5A0:
	ldr r0, [r5, #8]
	mov r1, #4
	bl sub_0206B8AC
	add r0, r6, #0
	bl CallTask_FadeFromBlack
	add r0, r4, #0
	mov r1, #0
	add r0, #0xca
	strb r1, [r0]
	mov r0, #0xf
	strb r0, [r4, #0x14]
	b _0206B824
_0206B5BC:
	add r0, #0xca
	ldrb r0, [r0]
	cmp r0, #7
	bls _0206B5C6
_0206B5C4:
	b _0206B824
_0206B5C6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206B5D2: ; jump table
	.short _0206B5E2 - _0206B5D2 - 2 ; case 0
	.short _0206B5F8 - _0206B5D2 - 2 ; case 1
	.short _0206B626 - _0206B5D2 - 2 ; case 2
	.short _0206B652 - _0206B5D2 - 2 ; case 3
	.short _0206B6BC - _0206B5D2 - 2 ; case 4
	.short _0206B6E2 - _0206B5D2 - 2 ; case 5
	.short _0206B710 - _0206B5D2 - 2 ; case 6
	.short _0206B726 - _0206B5D2 - 2 ; case 7
_0206B5E2:
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x1c]
	bl ov01_021FB514
	add r0, r4, #0
	add r0, #0xca
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xca
	strb r1, [r0]
_0206B5F8:
	add r0, r4, #0
	add r0, #0xc8
	ldrh r2, [r0]
	add r0, r4, #0
	add r0, #0xc8
	ldrh r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc8
	strh r1, [r0]
	cmp r2, #0x1e
	blo _0206B6EA
	add r0, r4, #0
	add r0, #0xca
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xca
	strb r1, [r0]
	mov r0, #0
	add r4, #0xc8
	strh r0, [r4]
	b _0206B824
_0206B626:
	ldr r0, _0206B70C ; =SEQ_SE_GS_SHUTTER
	bl PlaySE
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r2, #0
	str r0, [sp, #8]
	mov r0, #3
	mov r1, #8
	add r3, r2, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	add r0, #0xca
	ldrb r0, [r0]
	add r4, #0xca
	add r0, r0, #1
	strb r0, [r4]
	b _0206B824
_0206B652:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0206B6EA
	add r0, r5, #0
	bl FieldSystem_GetSaveData
	bl Save_PhotoAlbum_Get
	add r5, r0, #0
	bl PhotoAlbum_GetIndexOfFirstEmptySlot
	add r6, r0, #0
	add r0, sp, #0x20
	bl GF_RTC_CopyDate
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x24]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x10
	ldr r0, [sp, #0x20]
	lsl r3, r3, #0x18
	ldr r2, [sp, #0x2c]
	lsl r0, r0, #0x18
	lsr r3, r3, #8
	orr r0, r3
	orr r0, r1
	add r1, r2, #0
	orr r1, r0
	ldr r0, [r4, #0x40]
	str r1, [r0, #0x38]
	add r0, sp, #0x14
	bl GF_RTC_CopyTime
	ldr r1, [sp, #0x14]
	ldr r0, [r4, #0x40]
	add r2, r6, #0
	strh r1, [r0, #0x3c]
	ldr r1, [sp, #0x18]
	ldr r0, [r4, #0x40]
	strh r1, [r0, #0x3e]
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x44
	bl PhotoAlbum_SetPhotoAtIndex
	add r0, r4, #0
	add r0, #0xca
	ldrb r0, [r0]
	add r4, #0xca
	add r0, r0, #1
	strb r0, [r4]
	b _0206B824
_0206B6BC:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r2, #0
	str r0, [sp, #8]
	mov r0, #3
	mov r1, #9
	add r3, r2, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	add r0, #0xca
	ldrb r0, [r0]
	add r4, #0xca
	add r0, r0, #1
	strb r0, [r4]
	b _0206B824
_0206B6E2:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _0206B6EC
_0206B6EA:
	b _0206B824
_0206B6EC:
	add r0, r4, #0
	add r0, #0xca
	ldrb r0, [r0]
	add r4, #0xca
	add r0, r0, #1
	strb r0, [r4]
	b _0206B824
	nop
_0206B6FC: .word sPhotoMonCoordOffsets
_0206B700: .word sPhotoMonCoordOffsets + 2
_0206B704: .word ov01_021F7918
_0206B708: .word 0x0000FFFF
_0206B70C: .word SEQ_SE_GS_SHUTTER
_0206B710:
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x1c]
	bl ov01_021FB4F4
	add r0, r4, #0
	add r0, #0xca
	ldrb r0, [r0]
	add r4, #0xca
	add r0, r0, #1
	strb r0, [r4]
	b _0206B824
_0206B726:
	add r0, r4, #0
	add r0, #0xc8
	ldrh r2, [r0]
	add r0, r4, #0
	add r0, #0xc8
	ldrh r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc8
	strh r1, [r0]
	cmp r2, #0x1e
	blo _0206B824
	add r0, r6, #0
	bl PalleteFadeUntilFinished
	mov r0, #0x10
	strb r0, [r4, #0x14]
	b _0206B824
_0206B74A:
	bl sub_020148F4
	add r0, r4, #0
	bl sub_0206AFA4
	add r0, r5, #0
	mov r1, #0
	bl sub_0203E33C
	add r0, r6, #0
	bl sub_0205525C
	mov r0, #0x11
	strb r0, [r4, #0x14]
	b _0206B824
_0206B768:
	add r0, r5, #0
	mov r1, #0
	bl sub_02067A80
	ldrh r3, [r4, #0x30]
	ldrh r2, [r4, #0x32]
	ldrh r1, [r4, #0x34]
	ldrh r0, [r4, #0x36]
	str r0, [r4]
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #4]
	str r3, [r4, #8]
	str r2, [r4, #0xc]
	str r1, [r4, #0x10]
	add r0, r6, #0
	add r1, r4, #0
	bl sub_020537A8
	mov r0, #0x12
	strb r0, [r4, #0x14]
	b _0206B824
_0206B794:
	add r0, r6, #0
	bl CallTask_RestoreOverworld
	mov r0, #0x13
	strb r0, [r4, #0x14]
	b _0206B824
_0206B7A0:
	add r0, r5, #0
	bl FollowMon_IsActive
	cmp r0, #0
	beq _0206B814
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #1
	beq _0206B814
	add r0, r5, #0
	bl FollowMon_GetMapObject
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r2, r4, #0
	add r2, #0xd8
	add r1, r4, #0
	add r5, r0, #0
	ldrb r2, [r2]
	add r0, r6, #0
	add r1, #0xcc
	bl sub_0205FBC0
	add r0, r5, #0
	bl MapObject_GetCurrentX
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r7, r0, #0
	add r0, r6, #0
	bl MapObject_GetCurrentX
	add r5, r0, #0
	add r0, r6, #0
	bl MapObject_GetCurrentY
	ldr r1, [sp, #0x10]
	cmp r1, r5
	bne _0206B806
	cmp r7, r0
	bne _0206B806
	add r0, r6, #0
	mov r1, #1
	bl sub_02069DC8
	b _0206B80E
_0206B806:
	add r0, r6, #0
	mov r1, #0
	bl sub_02069DC8
_0206B80E:
	add r0, r6, #0
	bl sub_0205F484
_0206B814:
	mov r0, #0x14
	strb r0, [r4, #0x14]
	b _0206B824
_0206B81A:
	bl FreeToHeap
	add sp, #0x60
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206B824:
	mov r0, #0
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206B270

	thumb_func_start sub_0206B82C
sub_0206B82C: ; 0x0206B82C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	bl PlayerAvatar_GetSpriteByStateAndGender
	add r6, r0, #0
	add r0, r5, #0
	bl PlayerAvatar_GetMapObject
	add r4, r0, #0
	bl MapObject_GetManager
	add r7, r0, #0
	add r0, r4, #0
	bl MapObject_GetGfxID
	str r0, [sp]
	add r0, r4, #0
	bl sub_0205E420
	ldr r1, [sp]
	add r0, r7, #0
	add r2, r4, #0
	bl ov01_021FA108
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0205E38C
	add r0, r5, #0
	bl sub_0205C790
	cmp r0, #0
	beq _0206B876
	bl ov01_021F1640
_0206B876:
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C78C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206B82C

	thumb_func_start sub_0206B880
sub_0206B880: ; 0x0206B880
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r4, #0
	mov r7, #1
_0206B88A:
	lsl r0, r4, #1
	add r0, r5, r0
	add r0, #0x40
	ldrh r1, [r0]
	cmp r1, #0
	beq _0206B89E
	add r0, r6, #0
	add r2, r7, #0
	bl sub_02054EB0
_0206B89E:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _0206B88A
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206B880

	thumb_func_start sub_0206B8AC
sub_0206B8AC: ; 0x0206B8AC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0
	str r1, [sp]
	ldr r0, _0206B90C ; =0x00000107
	add r2, r1, #0
	add r3, r1, #0
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	ldr r0, _0206B90C ; =0x00000107
	add r2, r5, #0
	mov r3, #2
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r1, #2
	ldr r0, _0206B90C ; =0x00000107 ; =(a/2/6/1)
	add r2, r5, #0
	add r3, r1, #0
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	add r0, r5, #0
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0206B90C: .word 0x00000107 ; =(a/2/6/1)
	thumb_func_end sub_0206B8AC
