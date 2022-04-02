#include "constants/species.h"
#include "constants/maps.h"
#include "constants/sprites.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public NNS_G3dGlb

	.text

	thumb_func_start FieldSys_TakePhoto
FieldSys_TakePhoto: ; 0x0206A798
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0xdc
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0xdc
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	strb r0, [r4, #0x14]
	strb r0, [r4, #0x15]
	strb r0, [r4, #0x17]
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	strh r0, [r4, #0x30]
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	strh r0, [r4, #0x32]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	strh r0, [r4, #0x34]
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	strh r0, [r4, #0x36]
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _0206A7FE
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r1, r4, #0
	add r7, r0, #0
	add r1, #0xcc
	bl MapObject_GetPositionVec
	add r0, r7, #0
	bl MapObject_GetFacingDirection
	add r1, r4, #0
	add r1, #0xd8
	strb r0, [r1]
_0206A7FE:
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	bl Save_PhotoAlbum_get
	bl PhotoAlbum_GetIndexOfFirstEmptySlot
	cmp r0, #0xff
	beq _0206A858
	mov r1, #1 // (a/2/5/4) >> 8
	add r0, sp, #0x18
	lsl r1, r1, #8
	add r2, r6, #0
	bl ReadWholeNarcMemberByIdPair
	add r3, sp, #0x18
	ldrh r0, [r3, #4]
	add r1, r5, #0
	str r0, [sp]
	ldrh r0, [r3, #6]
	str r0, [sp, #4]
	ldrh r0, [r3, #0xc]
	str r0, [sp, #8]
	ldrh r0, [r3, #0xe]
	str r0, [sp, #0xc]
	ldrb r0, [r3, #9]
	str r0, [sp, #0x10]
	ldrh r0, [r3, #0xa]
	str r0, [sp, #0x14]
	ldrh r2, [r3, #2]
	add r0, r4, #0
	ldrh r3, [r3]
	lsl r2, r2, #0x18
	add r0, #0x44
	lsr r2, r2, #0x18
	bl sub_0206B014
	add r0, r4, #0
	add r0, #0x44
	str r0, [r4, #0x40]
	ldr r0, [r5, #0x10]
	ldr r1, _0206A85C ; =sub_0206B270
	add r2, r4, #0
	bl TaskManager_Call
_0206A858:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206A85C: .word sub_0206B270
	thumb_func_end FieldSys_TakePhoto

	thumb_func_start sub_0206A860
sub_0206A860: ; 0x0206A860
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0xbc
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0xbc
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	add r1, r4, #0
	add r1, #0x94
	strh r0, [r1]
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r1, r4, #0
	add r1, #0x96
	strh r0, [r1]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, r4, #0
	add r1, #0x98
	strh r0, [r1]
	ldr r0, [r5, #0x20]
	ldr r1, [r0]
	add r0, r4, #0
	add r0, #0x9a
	strh r1, [r0]
	ldr r0, [r5, #0xc]
	bl Save_PhotoAlbum_get
	add r1, r4, #0
	add r1, #0xb8
	str r0, [r1]
	ldr r0, [r5, #0x10]
	ldr r1, _0206A8BC ; =sub_0206A8E4
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0206A8BC: .word sub_0206A8E4
	thumb_func_end sub_0206A860

	thumb_func_start sub_0206A8C0
sub_0206A8C0: ; 0x0206A8C0
	push {r4, lr}
	add r4, r1, #0
	add r1, r0, #0
	add r1, #0xc
	str r1, [r4]
	ldrb r1, [r0, #0xa]
	add r0, #0xb8
	strb r1, [r4, #4]
	ldr r0, [r0]
	bl PhotoAlbum_GetNumSaved
	strb r0, [r4, #5]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206A8C0

	thumb_func_start sub_0206A8DC
sub_0206A8DC: ; 0x0206A8DC
	add r0, #0x90
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0206A8DC

	thumb_func_start sub_0206A8E4
sub_0206A8E4: ; 0x0206A8E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #8
	bhi _0206A99C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206A908: ; jump table
	.short _0206A91A - _0206A908 - 2 ; case 0
	.short _0206A928 - _0206A908 - 2 ; case 1
	.short _0206A936 - _0206A908 - 2 ; case 2
	.short _0206A944 - _0206A908 - 2 ; case 3
	.short _0206A952 - _0206A908 - 2 ; case 4
	.short _0206A960 - _0206A908 - 2 ; case 5
	.short _0206A96E - _0206A908 - 2 ; case 6
	.short _0206A97C - _0206A908 - 2 ; case 7
	.short _0206A98A - _0206A908 - 2 ; case 8
_0206A91A:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206A9A0
	str r0, [r4]
	b _0206A99C
_0206A928:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206A9B4
	str r0, [r4]
	b _0206A99C
_0206A936:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206A9E8
	str r0, [r4]
	b _0206A99C
_0206A944:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206AAE4
	str r0, [r4]
	b _0206A99C
_0206A952:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206AAD4
	str r0, [r4]
	b _0206A99C
_0206A960:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206AB2C
	str r0, [r4]
	b _0206A99C
_0206A96E:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206AA4C
	str r0, [r4]
	b _0206A99C
_0206A97C:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206AB78
	str r0, [r4]
	b _0206A99C
_0206A98A:
	add r0, r6, #0
	mov r1, #0
	bl sub_02067A80
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_0206A99C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0206A8E4

	thumb_func_start sub_0206A9A0
sub_0206A9A0: ; 0x0206A9A0
	push {r4, lr}
	add r4, r2, #0
	ldrb r2, [r4, #0xa]
	mov r1, #0
	bl sub_0203EBA4
	add r4, #0xb4
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_0206A9A0

	thumb_func_start sub_0206A9B4
sub_0206A9B4: ; 0x0206A9B4
	push {r3, r4, r5, lr}
	add r5, r2, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _0206A9C4
	mov r0, #1
	pop {r3, r4, r5, pc}
_0206A9C4:
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	ldrb r4, [r0, #1]
	strb r4, [r5, #8]
	ldrb r0, [r0, #2]
	strb r0, [r5, #0xa]
	add r5, #0xb4
	ldr r0, [r5]
	bl FreeToHeap
	cmp r4, #1
	bne _0206A9E2
	mov r0, #2
	pop {r3, r4, r5, pc}
_0206A9E2:
	mov r0, #7
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0206A9B4

	thumb_func_start sub_0206A9E8
sub_0206A9E8: ; 0x0206A9E8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x10
	add r4, r2, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x10
	add r6, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0xb8
	add r1, r4, #0
	ldrb r2, [r4, #0xa]
	ldr r0, [r0]
	add r1, #0xc
	bl PhotoAlbum_GetPhotoByIndex
	add r0, r4, #0
	add r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0
	beq _0206AA1E
	mov r0, #2
	b _0206AA20
_0206AA1E:
	ldrb r0, [r4, #0x13]
_0206AA20:
	strb r0, [r4, #0xb]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x90
	str r1, [r0]
	str r4, [r6, #8]
	ldr r0, [r5, #0x70]
	ldr r1, _0206AA48 ; =sub_0206ABB0
	strb r0, [r4, #9]
	mov r0, #5
	str r0, [r5, #0x70]
	add r0, r5, #0
	add r0, #0xdc
	str r4, [r0]
	ldr r0, [r5, #0x10]
	add r2, r6, #0
	bl TaskManager_Call
	mov r0, #3
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0206AA48: .word sub_0206ABB0
	thumb_func_end sub_0206A9E8

	thumb_func_start sub_0206AA4C
sub_0206AA4C: ; 0x0206AA4C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	str r1, [sp]
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _0206AA5E
	cmp r1, #1
	beq _0206AA9A
	b _0206AACE
_0206AA5E:
	bl sub_020148F4
	ldrb r0, [r5, #0xb]
	mov r6, #0
	cmp r0, #0
	ble _0206AA8C
	add r4, r5, #0
	add r7, r6, #0
_0206AA6E:
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	beq _0206AA82
	bl MapObject_Remove
	add r0, r4, #0
	add r0, #0x9c
	str r7, [r0]
_0206AA82:
	ldrb r0, [r5, #0xb]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0206AA6E
_0206AA8C:
	ldr r0, [sp]
	bl sub_0205525C
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _0206AACE
_0206AA9A:
	ldrb r1, [r5, #9]
	str r1, [r0, #0x70]
	mov r1, #0
	add r0, #0xdc
	str r1, [r0]
	add r0, r5, #0
	str r1, [r5, #4]
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #2
	beq _0206AAB6
	cmp r0, #3
	beq _0206AAC0
	b _0206AACA
_0206AAB6:
	ldrb r0, [r5, #0xa]
	sub r0, r0, #1
	strb r0, [r5, #0xa]
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0206AAC0:
	ldrb r0, [r5, #0xa]
	add r0, r0, #1
	strb r0, [r5, #0xa]
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0206AACA:
	add r0, r1, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206AACE:
	mov r0, #6
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206AA4C

	thumb_func_start sub_0206AAD4
sub_0206AAD4: ; 0x0206AAD4
	add r2, #0x90
	ldr r0, [r2]
	cmp r0, #0
	bne _0206AAE0
	mov r0, #4
	bx lr
_0206AAE0:
	mov r0, #5
	bx lr
	thumb_func_end sub_0206AAD4

	thumb_func_start sub_0206AAE4
sub_0206AAE4: ; 0x0206AAE4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r2, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0206AAF6
	cmp r0, #1
	beq _0206AB14
	b _0206AB26
_0206AAF6:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0206AB26
_0206AB14:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0206AB26
	mov r0, #0
	str r0, [r4, #4]
	add sp, #0xc
	mov r0, #4
	pop {r3, r4, pc}
_0206AB26:
	mov r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end sub_0206AAE4

	thumb_func_start sub_0206AB2C
sub_0206AB2C: ; 0x0206AB2C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r2, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0206AB3E
	cmp r0, #1
	beq _0206AB5E
	b _0206AB70
_0206AB3E:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0206AB70
_0206AB5E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0206AB70
	mov r0, #0
	str r0, [r4, #4]
	add sp, #0xc
	mov r0, #6
	pop {r3, r4, pc}
_0206AB70:
	mov r0, #5
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206AB2C

	thumb_func_start sub_0206AB78
sub_0206AB78: ; 0x0206AB78
	push {r3, r4, lr}
	sub sp, #0x14
	add r0, r2, #0
	add r0, #0x98
	ldrh r3, [r0]
	add r0, r2, #0
	add r4, r2, #0
	add r0, #0x96
	add r4, #0x94
	add r2, #0x9a
	ldrh r0, [r0]
	ldrh r4, [r4]
	ldrh r2, [r2]
	str r2, [sp]
	mov r2, #0
	mvn r2, r2
	str r0, [sp, #0xc]
	add r0, r1, #0
	add r1, sp, #0
	str r2, [sp, #4]
	str r4, [sp, #8]
	str r3, [sp, #0x10]
	bl sub_020537A8
	mov r0, #8
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206AB78

	; File boundary before here

	thumb_func_start sub_0206ABB0
sub_0206ABB0: ; 0x0206ABB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	add r7, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r7, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4, #8]
	ldr r1, [r4]
	add r5, r0, #0
	add r5, #0xc
	cmp r1, #9
	bls _0206ABD2
	b _0206AEA2
_0206ABD2:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0206ABDE: ; jump table
	.short _0206ABF2 - _0206ABDE - 2 ; case 0
	.short _0206AC28 - _0206ABDE - 2 ; case 1
	.short _0206AC36 - _0206ABDE - 2 ; case 2
	.short _0206AC98 - _0206ABDE - 2 ; case 3
	.short _0206ACD6 - _0206ABDE - 2 ; case 4
	.short _0206AD44 - _0206ABDE - 2 ; case 5
	.short _0206ADA4 - _0206ABDE - 2 ; case 6
	.short _0206ADCA - _0206ABDE - 2 ; case 7
	.short _0206ADFA - _0206ABDE - 2 ; case 8
	.short _0206AE50 - _0206ABDE - 2 ; case 9
_0206ABF2:
	add r0, r6, #0
	mov r1, #1
	bl sub_02067A80
	ldrh r0, [r5, #0x3c]
	ldrh r1, [r5, #0x3e]
	bl sub_02014904
	ldrh r2, [r5, #0x36]
	ldrh r1, [r5, #0x34]
	ldrh r0, [r5, #0x32]
	str r0, [sp, #0x40]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x44]
	mov r0, #1
	str r1, [sp, #0x48]
	str r0, [sp, #0x50]
	str r2, [sp, #0x4c]
	add r0, r7, #0
	add r1, sp, #0x40
	bl sub_020537A8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206AEA2
_0206AC28:
	add r0, r7, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206AEA2
_0206AC36:
	ldr r0, [r6, #0x24]
	bl sub_0206AFD0
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0206AF78
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0206B880
	ldr r1, _0206AEA8 ; =0xBCFC0304
	ldr r0, _0206AEAC ; =NNS_G3dGlb + 0x80
	str r1, [r0, #0x20]
	add r0, r6, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	add r5, #0x30
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldrb r1, [r5]
	ldr r0, [r6, #0x40]
	bl sub_0206B82C
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0x34
	bl MapObject_GetFacingVec
	mov r0, #2
	ldr r1, [sp, #0x38]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x38]
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0x34
	bl MapObject_SetFacingVec
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206AEA2
_0206AC98:
	ldr r0, [r6, #0x3c]
	bl sub_0205F1A0
	add r1, r0, #0
	ldr r0, [r6, #0x3c]
	bl ov01_021F9FB0
	add r0, r6, #0
	add r0, #0xc8
	ldr r0, [r0]
	bl ov01_022043D8
	add r0, r6, #0
	add r0, #0xc8
	ldr r0, [r0]
	bl ov01_02204424
	ldr r0, [r6, #4]
	ldr r0, [r0, #0x10]
	bl ov01_021EB1E8
	add r5, #0x44
	ldrh r0, [r5]
	cmp r0, #0
	beq _0206ACD0
	mov r0, #6
	str r0, [r4]
	b _0206AEA2
_0206ACD0:
	mov r0, #4
	str r0, [r4]
	b _0206AEA2
_0206ACD6:
	ldrb r1, [r4, #0xc]
	add r2, r5, #0
	add r2, #0x6c
	lsl r1, r1, #2
	ldrh r7, [r2, r1]
	add r3, r2, r1
	cmp r7, #0
	beq _0206AD36
	ldr r2, _0206AEB0 ; =sPhotoMonCoordOffsets + 4
	mov r0, #1
	str r0, [sp]
	ldrh r0, [r5, #0x34]
	ldrh r2, [r2, r1]
	add r0, r0, r2
	ldr r2, _0206AEB4 ; =sPhotoMonCoordOffsets + 6
	str r0, [sp, #4]
	ldrh r0, [r5, #0x36]
	ldrh r1, [r2, r1]
	add r0, r0, r1
	str r0, [sp, #8]
	ldrb r0, [r3, #3]
	add r1, r7, #0
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #3]
	ldr r0, [r6, #0x3c]
	lsl r3, r3, #0x1e
	lsr r3, r3, #0x1f
	bl sub_0206AEC0
	ldrb r1, [r4, #0xc]
	ldr r2, [r4, #8]
	lsl r1, r1, #2
	add r1, r2, r1
	add r1, #0x9c
	str r0, [r1]
	ldrb r0, [r4, #0xc]
	ldr r1, [r4, #8]
	lsl r0, r0, #2
	add r0, r1, r0
	add r0, #0x9c
	ldr r0, [r0]
	ldr r1, _0206AEB8 ; =ov01_021F7918
	bl sub_0205F47C
	b _0206AD3E
_0206AD36:
	add r0, r0, r1
	mov r2, #0
	add r0, #0x9c
	str r2, [r0]
_0206AD3E:
	mov r0, #5
	str r0, [r4]
	b _0206AEA2
_0206AD44:
	ldrb r1, [r4, #0xc]
	lsl r1, r1, #2
	add r0, r0, r1
	add r0, #0x9c
	ldr r6, [r0]
	cmp r6, #0
	beq _0206AD84
	add r0, r6, #0
	bl ov01_0220553C
	cmp r0, #0
	beq _0206AD64
	mov r0, #1
	add r1, r6, #0
	bl ov01_021F902C
_0206AD64:
	add r0, r6, #0
	add r1, sp, #0x28
	bl MapObject_GetFacingVec
	mov r0, #2
	ldr r1, [sp, #0x2c]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x2c]
	add r0, r6, #0
	add r1, sp, #0x28
	bl MapObject_SetFacingVec
	add r0, r6, #0
	bl sub_0205F484
_0206AD84:
	ldrb r0, [r4, #0xc]
	add r0, r0, #1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0xc]
	ldrb r0, [r5, #7]
	cmp r1, r0
	blo _0206AD9E
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x54
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0206AD9E:
	mov r0, #4
	str r0, [r4]
	b _0206AEA2
_0206ADA4:
	ldrh r0, [r5, #0x36]
	add r1, r5, #0
	add r1, #0x44
	str r0, [sp]
	mov r0, #0xf9
	str r0, [sp, #4]
	ldrh r3, [r5, #0x34]
	ldrh r1, [r1]
	ldr r0, [r6, #0x3c]
	mov r2, #1
	add r3, r3, #2
	bl sub_0206AF08
	ldr r1, [r4, #8]
	add r1, #0x9c
	str r0, [r1]
	mov r0, #7
	str r0, [r4]
	b _0206AEA2
_0206ADCA:
	add r0, #0x9c
	ldr r0, [r0]
	add r1, sp, #0x1c
	bl MapObject_GetFacingVec
	mov r0, #2
	ldr r1, [sp, #0x20]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x20]
	ldr r0, [r4, #8]
	add r1, sp, #0x1c
	add r0, #0x9c
	ldr r0, [r0]
	bl MapObject_SetFacingVec
	ldr r0, [r4, #8]
	add r0, #0x9c
	ldr r0, [r0]
	bl sub_0205F484
	mov r0, #8
	str r0, [r4]
	b _0206AEA2
_0206ADFA:
	add r1, r5, #0
	add r1, #0x6c
	ldrh r1, [r1]
	add r3, r5, #0
	add r3, #0x6c
	cmp r1, #0
	beq _0206AE44
	mov r0, #1
	str r0, [sp]
	ldrh r0, [r5, #0x34]
	add r0, r0, #1
	str r0, [sp, #4]
	ldrh r2, [r5, #0x36]
	ldr r0, _0206AEBC ; =0x0000FFFF
	add r0, r2, r0
	str r0, [sp, #8]
	ldrb r0, [r3, #3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #3]
	ldr r0, [r6, #0x3c]
	lsl r3, r3, #0x1e
	lsr r3, r3, #0x1f
	bl sub_0206AEC0
	ldr r1, [r4, #8]
	add r1, #0xa0
	str r0, [r1]
	ldr r0, [r4, #8]
	ldr r1, _0206AEB8 ; =ov01_021F7918
	add r0, #0xa0
	ldr r0, [r0]
	bl sub_0205F47C
	b _0206AE4A
_0206AE44:
	mov r1, #0
	add r0, #0xa0
	str r1, [r0]
_0206AE4A:
	mov r0, #9
	str r0, [r4]
	b _0206AEA2
_0206AE50:
	add r0, #0xa0
	ldr r0, [r0]
	cmp r0, #0
	beq _0206AE96
	add r1, sp, #0x10
	bl MapObject_GetFacingVec
	mov r0, #2
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x14]
	ldr r0, [r4, #8]
	add r1, sp, #0x10
	add r0, #0xa0
	ldr r0, [r0]
	bl MapObject_SetFacingVec
	ldr r0, [r4, #8]
	add r0, #0xa0
	ldr r0, [r0]
	bl sub_0205F484
	ldr r0, [r4, #8]
	add r0, #0xa0
	ldr r5, [r0]
	add r0, r5, #0
	bl ov01_0220553C
	cmp r0, #0
	beq _0206AE96
	mov r0, #1
	add r1, r5, #0
	bl ov01_021F902C
_0206AE96:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x54
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0206AEA2:
	mov r0, #0
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0206AEA8: .word 0xBCFC0304
_0206AEAC: .word NNS_G3dGlb + 0x80
_0206AEB0: .word sPhotoMonCoordOffsets + 4
_0206AEB4: .word sPhotoMonCoordOffsets + 6
_0206AEB8: .word ov01_021F7918
_0206AEBC: .word 0x0000FFFF
	thumb_func_end sub_0206ABB0

	thumb_func_start sub_0206AEC0
sub_0206AEC0: ; 0x0206AEC0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r2, #0
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r3, #0
	bl FollowingPokemon_GetSpriteID
	add r1, r0, #0
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x18]
	str r0, [sp]
	mov r0, #0xfd
	str r0, [sp, #4]
	ldr r3, [sp, #0x1c]
	add r0, r4, #0
	bl sub_0206AF08
	mov r1, #0
	mov r2, #2
	add r4, r0, #0
	bl MapObject_SetParam
	lsl r2, r6, #0x18
	ldr r3, [sp, #0x24]
	add r0, r4, #0
	add r1, r5, #0
	lsr r2, r2, #0x18
	bl FollowPokeMapObjectSetParams
	add r0, r4, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0206AEC0

	thumb_func_start sub_0206AF08
sub_0206AF08: ; 0x0206AF08
	push {r3, r4, lr}
	sub sp, #0xc
	str r1, [sp]
	mov r1, #0
	add r4, r2, #0
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	add r1, r3, #0
	ldr r2, [sp, #0x18]
	add r3, r4, #0
	bl CreateSpecialFieldObject
	add r4, r0, #0
	bne _0206AF2A
	bl GF_AssertFail
_0206AF2A:
	ldr r1, [sp, #0x1c]
	add r0, r4, #0
	bl MapObject_SetID
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetType
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetFlagID
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
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end sub_0206AF08

	thumb_func_start sub_0206AF78
sub_0206AF78: ; 0x0206AF78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r4, sp, #0
	add r6, sp, #4
	mov r7, #1
_0206AF8E:
	ldr r0, [r5, #0x3c]
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0205EEF4
	cmp r0, #0
	bne _0206AF8E
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206AF78

	thumb_func_start sub_0206AFA4
sub_0206AFA4: ; 0x0206AFA4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r0, #0xcb
	ldrb r0, [r0]
	mov r4, #0
	cmp r0, #0
	ble _0206AFCC
	add r5, r6, #0
_0206AFB4:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	beq _0206AFBE
	bl MapObject_Remove
_0206AFBE:
	add r0, r6, #0
	add r0, #0xcb
	ldrb r0, [r0]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0206AFB4
_0206AFCC:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0206AFA4

	thumb_func_start sub_0206AFD0
sub_0206AFD0: ; 0x0206AFD0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0206B008 ; =_021100C4
	add r1, r4, #0
	ldr r0, [r0]
	bl GF_Camera_SetDistance
	ldr r0, _0206B00C ; =_021100C4 + 4
	add r1, r4, #0
	bl GF_Camera_SetAngle
	ldr r0, _0206B008 ; =_021100C4
	add r1, r4, #0
	ldrh r0, [r0, #0xe]
	bl GF_Camera_SetPerspectiveAngle
	ldr r0, _0206B008 ; =_021100C4
	add r1, r4, #0
	ldrh r0, [r0, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020233D8
	ldr r0, _0206B010 ; =_021100C4 + 24
	add r1, r4, #0
	bl GF_Camera_ShiftBy
	pop {r4, pc}
	.balign 4, 0
_0206B008: .word _021100C4
_0206B00C: .word _021100C4 + 4
_0206B010: .word _021100C4 + 24
	thumb_func_end sub_0206AFD0

	thumb_func_start sub_0206B014
sub_0206B014: ; 0x0206B014
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl Fsys_GetSaveDataPtr
	add r7, r0, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r6, r0, #0
	add r0, r7, #0
	bl SavArray_PlayerParty_get
	str r0, [sp, #8]
	add r0, r5, #0
	bl Photo_init
	add r0, sp, #0x2c
	bl GF_RTC_CopyDate
	ldr r0, [sp, #0x34]
	ldr r3, [sp, #0x30]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x10
	ldr r0, [sp, #0x2c]
	lsl r3, r3, #0x18
	lsl r0, r0, #0x18
	lsr r3, r3, #8
	orr r0, r3
	ldr r2, [sp, #0x38]
	orr r0, r1
	orr r0, r2
	str r0, [r5, #0x38]
	ldr r0, [sp, #8]
	bl GetPartyCount
	str r0, [sp, #0xc]
	add r0, r6, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r5, #0
	add r0, #8
	bl CopyU16StringArray
	add r0, r6, #0
	bl PlayerProfile_GetTrainerGender
	ldrb r1, [r5, #4]
	mov r2, #1
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #1
	and r0, r2
	orr r0, r1
	strb r0, [r5, #4]
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetState
	add r1, r5, #0
	add r1, #0x30
	strb r0, [r1]
	ldr r0, [sp, #0x50]
	strh r0, [r5, #0x34]
	ldr r0, [sp, #0x54]
	strh r0, [r5, #0x36]
	ldr r0, [sp, #4]
	strh r0, [r5, #0x32]
	ldrb r1, [r5, #4]
	mov r0, #0xfe
	bic r1, r0
	ldr r0, [sp]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x18
	orr r0, r1
	strb r0, [r5, #4]
	add r0, sp, #0x20
	bl GF_RTC_CopyTime
	ldr r0, [sp, #0x20]
	add r1, r5, #0
	strh r0, [r5, #0x3c]
	ldr r0, [sp, #0x24]
	add r1, #0x48
	strh r0, [r5, #0x3e]
	ldr r0, _0206B26C ; =_021100C4
	mov r2, #0x24
	bl MI_CpuCopy8
	add r0, r5, #0
	ldr r1, [sp, #0x58]
	add r0, #0x40
	strh r1, [r0]
	add r0, r5, #0
	ldr r1, [sp, #0x5c]
	add r0, #0x42
	strh r1, [r0]
	add r1, sp, #0x40
	add r0, r5, #0
	ldrh r2, [r1, #0x20]
	add r0, #0x46
	strh r2, [r0]
	add r0, r5, #0
	ldrh r1, [r1, #0x24]
	add r0, #0x44
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0206B0FE
	mov r0, #1
	b _0206B100
_0206B0FE:
	ldr r0, [sp, #0xc]
_0206B100:
	strb r0, [r5, #7]
	ldr r0, [sp, #8]
	bl GetFirstAliveMonInParty_CrashIfNone
	add r2, r5, #0
	mov r1, #0x75
	add r2, #0x18
	add r4, r0, #0
	bl GetMonData
	add r0, r5, #0
	add r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	bne _0206B1D2
	ldr r0, [sp, #0xc]
	mov r7, #0
	cmp r0, #0
	bgt _0206B128
	b _0206B266
_0206B128:
	mov r0, #1
	str r0, [sp, #0x1c]
	mov r0, #2
	str r0, [sp, #0x18]
	mov r0, #1
	add r4, r5, #0
	str r0, [sp, #0x14]
	mov r0, #2
	add r4, #0x6f
	str r0, [sp, #0x10]
_0206B13C:
	ldr r0, [sp, #8]
	add r1, r7, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0206B172
	add r1, r5, #0
	add r1, #0x6c
	mov r0, #0
	strh r0, [r1]
	add r1, r5, #0
	add r1, #0x6e
	strb r0, [r1]
	ldrb r1, [r4]
	ldr r0, [sp, #0x14]
	bic r1, r0
	strb r1, [r4]
	ldrb r1, [r4]
	ldr r0, [sp, #0x10]
	bic r1, r0
	strb r1, [r4]
	b _0206B1C2
_0206B172:
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x6c
	strh r0, [r1]
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x6e
	strb r0, [r1]
	add r0, r6, #0
	bl MonIsShiny
	ldrb r1, [r4]
	ldr r2, [sp, #0x1c]
	bic r1, r2
	mov r2, #1
	and r0, r2
	orr r0, r1
	strb r0, [r4]
	add r0, r6, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r4]
	ldr r2, [sp, #0x18]
	lsr r0, r0, #0x1e
	bic r1, r2
	orr r0, r1
	strb r0, [r4]
_0206B1C2:
	ldr r0, [sp, #0xc]
	add r7, r7, #1
	add r5, r5, #4
	add r4, r4, #4
	cmp r7, r0
	blt _0206B13C
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
_0206B1D2:
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x6c
	strh r0, [r1]
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x6e
	strb r0, [r1]
	add r0, r4, #0
	bl MonIsShiny
	add r1, r5, #0
	add r1, #0x6f
	ldrb r2, [r1]
	mov r1, #1
	bic r2, r1
	mov r1, #1
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	add r0, r5, #0
	add r0, #0x6f
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x6f
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	add r2, r5, #0
	add r2, #0x6f
	ldrb r1, [r1]
	mov r3, #2
	lsr r0, r0, #0x1e
	bic r1, r3
	orr r1, r0
	add r0, r5, #0
	add r0, #0x6f
	strb r1, [r0]
	add r1, r5, #4
	mov r3, #1
	add r2, r2, #4
	mov r0, #0
	mov r5, #1
	mov r6, #2
_0206B244:
	add r4, r1, #0
	add r4, #0x6c
	strh r0, [r4]
	add r4, r1, #0
	add r4, #0x6e
	strb r0, [r4]
	ldrb r4, [r2]
	add r3, r3, #1
	add r1, r1, #4
	bic r4, r5
	strb r4, [r2]
	ldrb r4, [r2]
	bic r4, r6
	strb r4, [r2]
	add r2, r2, #4
	cmp r3, #6
	blt _0206B244
_0206B266:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_0206B26C: .word _021100C4
	thumb_func_end sub_0206B014

	thumb_func_start sub_0206B270
sub_0206B270: ; 0x0206B270
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	add r6, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
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
	bl sub_020552A4
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
	bl Fsys_GetSaveDataPtr
	bl Sav2_PlayerData_GetProfileAddr
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
	ldr r6, _0206B6FC ; =sPhotoMonCoordOffsets + 4
	mov r0, #1
	str r0, [sp]
	ldrh r0, [r1, #0x34]
	ldrh r6, [r6, r2]
	add r0, r0, r6
	str r0, [sp, #4]
	ldrh r0, [r1, #0x36]
	ldr r1, _0206B700 ; =sPhotoMonCoordOffsets + 6
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
	bl sub_0205532C
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
	bl Fsys_GetSaveDataPtr
	bl Save_PhotoAlbum_get
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
_0206B6FC: .word sPhotoMonCoordOffsets + 4
_0206B700: .word sPhotoMonCoordOffsets + 6
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
	bl sub_020552E8
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
	bl sub_020552A4
	mov r0, #0x13
	strb r0, [r4, #0x14]
	b _0206B824
_0206B7A0:
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _0206B814
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #1
	beq _0206B814
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
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
	bl sub_0205C898
	add r6, r0, #0
	add r0, r5, #0
	bl PlayerAvatar_GetMapObject
	add r4, r0, #0
	bl sub_0205F35C
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

	.rodata

sPhotoMonCoordOffsets:
	.short 0x0001, 0xFFFF
	.short 0x0002, 0x0000
	.short 0x0001, 0xFFFF
	.short 0xFFFF, 0xFFFF
	.short 0x0003, 0xFFFF
	.short 0x0000, 0xFFFE
	.short 0x0002, 0xFFFE

	.data

_021100C4:
	.byte 0xC1, 0xAE, 0x29, 0x00, 0x00, 0xEE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x02
	.byte 0x96, 0x00, 0x00, 0x00, 0x84, 0x03, 0x00, 0x00, 0x00, 0x05, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0xFD, 0xFF

