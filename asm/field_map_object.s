#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "constants/party_menu.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0205E0BC
sub_0205E0BC: ; 0x0205E0BC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	add r7, r2, #0
	bl MapObjectMan_new
	add r4, r0, #0
	add r1, r6, #0
	bl MapObjectMan_SetFieldSysPtr
	add r0, r4, #0
	add r1, r5, #0
	bl MapObjectMan_SetCount
	add r0, r4, #0
	add r1, r7, #0
	bl sub_0205F198
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205E0BC

	thumb_func_start sub_0205E0E8
sub_0205E0E8: ; 0x0205E0E8
	push {r4, lr}
	add r4, r0, #0
	bl MapObjectMan_GetArray
	add r1, r0, #0
	mov r0, #0xb
	bl FreeToHeapExplicit
	mov r0, #0xb
	add r1, r4, #0
	bl FreeToHeapExplicit
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205E0E8

	thumb_func_start sub_0205E104
sub_0205E104: ; 0x0205E104
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r5, r2, #0
	str r3, [sp, #4]
	ldr r7, [sp, #0x20]
	bl MapObjectMan_GetCount
	add r6, r0, #0
	ldr r0, [sp]
	bl MapObjectMan_GetArray
	add r4, r0, #0
	cmp r6, #0
	beq _0205E16C
_0205E122:
	add r0, r4, #0
	bl MapObject_IsInUse
	cmp r0, #1
	bne _0205E162
	ldr r2, [sp, #4]
	add r0, r4, #0
	add r1, r5, #0
	add r3, r7, #0
	bl sub_0205ED90
	cmp r0, #0
	beq _0205E144
	cmp r0, #1
	beq _0205E162
	cmp r0, #2
	b _0205E162
_0205E144:
	add r0, r4, #0
	bl sub_0205F254
	cmp r5, r0
	beq _0205E162
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xa
	bl MapObject_TestBits
	cmp r0, #0
	bne _0205E162
	add r0, r4, #0
	bl MapObject_Remove
_0205E162:
	mov r0, #0x4b
	lsl r0, r0, #2
	add r4, r4, r0
	sub r6, r6, #1
	bne _0205E122
_0205E16C:
	ldr r0, [sp]
	bl sub_0205F1A0
	add r1, r0, #0
	ldr r0, [sp]
	bl ov01_021F9FB0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205E104

	thumb_func_start MapObjectMan_new
MapObjectMan_new: ; 0x0205E180
	push {r4, r5, r6, lr}
	mov r1, #0x4b
	add r4, r0, #0
	mov r0, #0xb
	lsl r1, r1, #2
	bl AllocFromHeap
	add r5, r0, #0
	bne _0205E196
	bl GF_AssertFail
_0205E196:
	mov r2, #0x4b
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	mov r0, #0x4b
	lsl r0, r0, #2
	add r6, r4, #0
	mul r6, r0
	mov r0, #0xb
	add r1, r6, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _0205E1BA
	bl GF_AssertFail
_0205E1BA:
	add r0, r4, #0
	mov r1, #0
	add r2, r6, #0
	bl memset
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F1A4
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end MapObjectMan_new

	thumb_func_start sub_0205E1D0
sub_0205E1D0: ; 0x0205E1D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r7, r2, #0
	add r2, sp, #0
	add r3, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r6, #0
	bl ObjectEventTemplate_GetID
	add r4, r0, #0
	add r0, r6, #0
	bl ObjectEventTemplate_ScriptIdIsFFFF
	cmp r0, #0
	bne _0205E21C
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_0205EA98
	add r4, r0, #0
	beq _0205E23E
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0205F014
	add sp, #0x20
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205E21C:
	add r0, r6, #0
	bl ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205EE10
	add r4, r0, #0
	beq _0205E23E
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0205F058
	add sp, #0x20
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205E23E:
	add r0, r5, #0
	bl sub_0205EA64
	add r4, r0, #0
	beq _0205E290
	add r0, r5, #0
	bl MapObjectMan_GetFieldSysPtr
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0205EB2C
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205EC90
	add r0, r4, #0
	add r1, r7, #0
	bl sub_0205F250
	add r0, r4, #0
	bl sub_0205EFA4
	add r0, r4, #0
	bl sub_0205EFB4
	add r0, r4, #0
	mov r1, #4
	bl MapObject_SetBits
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205EAF0
	add r0, r5, #0
	bl sub_0205F160
	bl sub_0205F16C
	add r0, r4, #0
_0205E290:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205E1D0

	thumb_func_start CreateSpecialFieldObject
CreateSpecialFieldObject: ; 0x0205E294
	push {r4, lr}
	sub sp, #0x18
	ldr r4, [sp, #0x20]
	str r4, [sp]
	ldr r4, [sp, #0x24]
	str r4, [sp, #4]
	ldr r4, [sp, #0x28]
	str r4, [sp, #8]
	mov r4, #0
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	bl CreateSpecialFieldObjectEx
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end CreateSpecialFieldObject

	thumb_func_start CreateSpecialFieldObjectEx
CreateSpecialFieldObjectEx: ; 0x0205E2B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0
	mov r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ObjectEventTemplate_SetID
	ldr r1, [sp, #0x38]
	add r0, sp, #0
	bl ObjectEventTemplate_SetSprite
	ldr r1, [sp, #0x3c]
	add r0, sp, #0
	bl ObjectEventTemplate_SetMovement
	add r0, sp, #0
	mov r1, #0
	bl ObjectEventTemplate_SetType
	add r0, sp, #0
	mov r1, #0
	bl ObjectEventTemplate_SetFlagID
	add r0, sp, #0
	mov r1, #0
	bl ObjectEventTemplate_SetScript
	add r0, sp, #0
	add r1, r7, #0
	bl ObjectEventTemplate_SetFacing
	ldr r1, [sp, #0x44]
	add r0, sp, #0
	mov r2, #0
	bl ObjectEventTemplate_SetParam
	ldr r1, [sp, #0x48]
	add r0, sp, #0
	mov r2, #1
	bl ObjectEventTemplate_SetParam
	ldr r1, [sp, #0x4c]
	add r0, sp, #0
	mov r2, #2
	bl ObjectEventTemplate_SetParam
	add r0, sp, #0
	mov r1, #0
	bl ObjectEventTemplate_SetXRange
	add r0, sp, #0
	mov r1, #0
	bl ObjectEventTemplate_SetYRange
	add r0, sp, #0
	add r1, r4, #0
	bl ObjectEventTemplate_SetXCoord
	add r0, sp, #0
	add r1, r6, #0
	bl ObjectEventTemplate_SetYCoord
	add r0, sp, #0
	mov r1, #0
	bl ObjectEventTemplate_SetHeight
	ldr r2, [sp, #0x40]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0205E1D0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end CreateSpecialFieldObjectEx

	thumb_func_start CreateMapObjectFromTemplate
CreateMapObjectFromTemplate: ; 0x0205E34C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	ldr r2, [sp, #0x18]
	add r7, r3, #0
	mov r6, #0
	bl sub_0205FA98
	str r0, [sp]
	cmp r0, #0
	beq _0205E388
	bl ObjectEventTemplate_GetFlagID
	add r4, r0, #0
	add r0, r5, #0
	bl MapObjectMan_GetFieldSysPtr
	lsl r1, r4, #0x10
	lsr r1, r1, #0x10
	bl FlagGet
	cmp r0, #0
	bne _0205E388
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r7, #0
	bl sub_0205E1D0
	add r6, r0, #0
_0205E388:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end CreateMapObjectFromTemplate

	thumb_func_start sub_0205E38C
sub_0205E38C: ; 0x0205E38C
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_SetGfxID
	add r0, r4, #0
	bl sub_0205EF48
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xe
	bl MapObject_ClearBits
	add r0, r4, #0
	bl sub_0205EFB4
	pop {r4, pc}
	thumb_func_end sub_0205E38C

	thumb_func_start sub_0205E3AC
sub_0205E3AC: ; 0x0205E3AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F73C
	cmp r0, #1
	bne _0205E3C0
	add r0, r5, #0
	bl sub_0205E420
_0205E3C0:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205E38C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205E3AC

	thumb_func_start MapObject_Remove
MapObject_Remove: ; 0x0205E3CC
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F35C
	bl sub_0205F5D4
	cmp r0, #1
	bne _0205E3E2
	add r0, r4, #0
	bl sub_0205F498
_0205E3E2:
	add r0, r4, #0
	bl sub_0205F444
	add r0, r4, #0
	bl sub_0205F348
	add r0, r4, #0
	bl sub_0205F364
	bl sub_0205F174
	add r0, r4, #0
	bl sub_0205ED80
	pop {r4, pc}
	thumb_func_end MapObject_Remove

	thumb_func_start DeleteMapObject
DeleteMapObject: ; 0x0205E400
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl MapObject_GetFlagID
	add r5, r0, #0
	add r0, r4, #0
	bl MapObject_GetFieldSysPtr
	lsl r1, r5, #0x10
	lsr r1, r1, #0x10
	bl FlagSet
	add r0, r4, #0
	bl MapObject_Remove
	pop {r3, r4, r5, pc}
	thumb_func_end DeleteMapObject

	thumb_func_start sub_0205E420
sub_0205E420: ; 0x0205E420
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F35C
	bl sub_0205F5D4
	cmp r0, #1
	bne _0205E44E
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xe
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205E444
	add r0, r4, #0
	bl sub_0205F498
_0205E444:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xe
	bl MapObject_ClearBits
_0205E44E:
	ldr r1, _0205E480 ; =0x0000FFFF
	add r0, r4, #0
	bl MapObject_SetGfxID
	ldr r1, _0205E484 ; =sub_0205FCC4
	add r0, r4, #0
	bl sub_0205F468
	ldr r1, _0205E488 ; =sub_0205FCC8
	add r0, r4, #0
	bl sub_0205F47C
	ldr r1, _0205E488 ; =sub_0205FCC8
	add r0, r4, #0
	bl sub_0205F490
	ldr r1, _0205E48C ; =sub_0205FCCC
	add r0, r4, #0
	bl sub_0205F4A4
	ldr r1, _0205E490 ; =sub_0205FCD0
	add r0, r4, #0
	bl sub_0205F4B8
	pop {r4, pc}
	.balign 4, 0
_0205E480: .word 0x0000FFFF
_0205E484: .word sub_0205FCC4
_0205E488: .word sub_0205FCC8
_0205E48C: .word sub_0205FCCC
_0205E490: .word sub_0205FCD0
	thumb_func_end sub_0205E420

	thumb_func_start sub_0205E494
sub_0205E494: ; 0x0205E494
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r4, #0
	bl MapObjectMan_GetCount
	add r6, r0, #0
	add r0, r5, #0
	bl MapObjectMan_GetArray
	mov r7, #0x4b
	add r5, r0, #0
	lsl r7, r7, #2
_0205E4AC:
	add r0, r5, #0
	mov r1, #1
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205E4BE
	add r0, r5, #0
	bl MapObject_Remove
_0205E4BE:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, r6
	blt _0205E4AC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205E494

	thumb_func_start sub_0205E4C8
sub_0205E4C8: ; 0x0205E4C8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F5D4
	cmp r0, #1
	beq _0205E4D8
	bl GF_AssertFail
_0205E4D8:
	add r0, r5, #0
	mov r4, #0
	bl MapObjectMan_GetCount
	add r6, r0, #0
	add r0, r5, #0
	bl MapObjectMan_GetArray
	mov r7, #0x4b
	add r5, r0, #0
	lsl r7, r7, #2
_0205E4EE:
	add r0, r5, #0
	mov r1, #1
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205E514
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xe
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205E514
	add r0, r5, #0
	bl sub_0205F4AC
	add r0, r5, #0
	bl sub_0205EF6C
_0205E514:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, r6
	blt _0205E4EE
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205E4C8

	thumb_func_start sub_0205E520
sub_0205E520: ; 0x0205E520
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F5D4
	cmp r0, #1
	beq _0205E530
	bl GF_AssertFail
_0205E530:
	add r0, r5, #0
	mov r4, #0
	bl MapObjectMan_GetCount
	add r6, r0, #0
	add r0, r5, #0
	bl MapObjectMan_GetArray
	mov r7, #0x4b
	add r5, r0, #0
	lsl r7, r7, #2
_0205E546:
	add r0, r5, #0
	bl MapObject_IsInUse
	cmp r0, #1
	bne _0205E574
	add r0, r5, #0
	bl sub_0205F678
	cmp r0, #1
	bne _0205E562
	add r0, r5, #0
	bl sub_0205F4C0
	b _0205E568
_0205E562:
	add r0, r5, #0
	bl sub_0205EFB4
_0205E568:
	add r0, r5, #0
	bl sub_0205EF48
	add r0, r5, #0
	bl sub_020611DC
_0205E574:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, r6
	blt _0205E546
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205E520

	thumb_func_start sub_0205E580
sub_0205E580: ; 0x0205E580
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F5D4
	cmp r0, #1
	beq _0205E590
	bl GF_AssertFail
_0205E590:
	add r0, r5, #0
	mov r4, #0
	bl MapObjectMan_GetCount
	add r6, r0, #0
	add r0, r5, #0
	bl MapObjectMan_GetArray
	mov r7, #0x4b
	add r5, r0, #0
	lsl r7, r7, #2
_0205E5A6:
	add r0, r5, #0
	bl MapObject_IsInUse
	cmp r0, #1
	bne _0205E5E0
	add r0, r5, #0
	bl MapObject_GetID
	cmp r0, #0xff
	bne _0205E5E0
	add r0, r5, #0
	bl sub_0205F678
	cmp r0, #1
	bne _0205E5CC
	add r0, r5, #0
	bl sub_0205F4C0
	b _0205E5D2
_0205E5CC:
	add r0, r5, #0
	bl sub_0205EFB4
_0205E5D2:
	add r0, r5, #0
	bl sub_0205EF48
	add r0, r5, #0
	bl sub_020611DC
	pop {r3, r4, r5, r6, r7, pc}
_0205E5E0:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, r6
	blt _0205E5A6
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205E580

	thumb_func_start Fsys_SyncMapObjectsToSaveEx
Fsys_SyncMapObjectsToSaveEx: ; 0x0205E5EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	add r6, r1, #0
	mov r0, #0
	add r5, r2, #0
	add r4, r3, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #0
	beq _0205E632
_0205E60C:
	ldr r1, [sp]
	add r0, r7, #0
	add r2, r5, #0
	bl sub_0205E680
	sub r4, r4, #1
	add r5, #0x50
	cmp r4, #0
	bgt _0205E622
	bl GF_AssertFail
_0205E622:
	add r0, r6, #0
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #0
	bne _0205E60C
_0205E632:
	cmp r4, #0
	beq _0205E642
	mov r2, #0x50
	add r0, r5, #0
	mov r1, #0
	mul r2, r4
	bl memset
_0205E642:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end Fsys_SyncMapObjectsToSaveEx

	thumb_func_start MapObjectMan_RestoreFromSave
MapObjectMan_RestoreFromSave: ; 0x0205E648
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r7, r2, #0
	beq _0205E67E
_0205E652:
	ldr r1, [r5]
	mov r0, #1
	tst r0, r1
	beq _0205E678
	add r0, r6, #0
	bl sub_0205EA64
	add r4, r0, #0
	bne _0205E668
	bl GF_AssertFail
_0205E668:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205E7C4
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0205E8EC
_0205E678:
	add r5, #0x50
	sub r7, r7, #1
	bne _0205E652
_0205E67E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end MapObjectMan_RestoreFromSave

	thumb_func_start sub_0205E680
sub_0205E680: ; 0x0205E680
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r0, #0
	add r4, r2, #0
	add r0, r5, #0
	bl MapObject_GetBitsWord
	str r0, [r4]
	add r0, r5, #0
	bl sub_0205F23C
	str r0, [r4, #4]
	add r0, r5, #0
	bl MapObject_GetID
	strb r0, [r4, #8]
	add r0, r5, #0
	bl sub_0205F254
	strh r0, [r4, #0x10]
	add r0, r5, #0
	bl MapObject_GetGfxID
	strh r0, [r4, #0x12]
	add r0, r5, #0
	bl MapObject_GetMovement
	strb r0, [r4, #9]
	add r0, r5, #0
	bl MapObject_GetType
	strh r0, [r4, #0x14]
	add r0, r5, #0
	bl MapObject_GetFlagID
	strh r0, [r4, #0x16]
	add r0, r5, #0
	bl MapObject_GetScript
	strh r0, [r4, #0x18]
	add r0, r5, #0
	bl MapObject_GetInitialFacing
	strb r0, [r4, #0xc]
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	strb r0, [r4, #0xd]
	add r0, r5, #0
	bl MapObject_GetNextFacing
	strb r0, [r4, #0xe]
	add r0, r5, #0
	mov r1, #0
	bl MapObject_GetParam
	strh r0, [r4, #0x1a]
	add r0, r5, #0
	mov r1, #1
	bl MapObject_GetParam
	strh r0, [r4, #0x1c]
	add r0, r5, #0
	mov r1, #2
	bl MapObject_GetParam
	strh r0, [r4, #0x1e]
	add r0, r5, #0
	bl MapObject_GetXRange
	strb r0, [r4, #0xa]
	add r0, r5, #0
	bl MapObject_GetYRange
	strb r0, [r4, #0xb]
	add r0, r5, #0
	bl MapObject_GetInitialX
	strh r0, [r4, #0x20]
	add r0, r5, #0
	bl MapObject_GetInitialHeight
	strh r0, [r4, #0x22]
	add r0, r5, #0
	bl MapObject_GetInitialY
	strh r0, [r4, #0x24]
	add r0, r5, #0
	bl MapObject_GetCurrentX
	strh r0, [r4, #0x26]
	add r0, r5, #0
	bl MapObject_GetCurrentHeight
	strh r0, [r4, #0x28]
	add r0, r5, #0
	bl MapObject_GetCurrentY
	strh r0, [r4, #0x2a]
	mov r0, #0x26
	mov r1, #0x2a
	ldrsh r0, [r4, r0]
	ldrsh r1, [r4, r1]
	add r2, sp, #0
	bl sub_020611C8
	add r0, r5, #0
	bl MapObject_GetPosVecYCoord
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_0205F8B8
	add r2, r0, #0
	add r0, r6, #0
	add r1, sp, #0
	bl sub_02061248
	cmp r0, #0
	bne _0205E77C
	add r0, r5, #0
	bl MapObject_GetPosVecYCoord
	str r0, [r4, #0x2c]
	b _0205E792
_0205E77C:
	add r0, r5, #0
	bl sub_0205F784
	cmp r0, #1
	bne _0205E78E
	add r0, r5, #0
	bl MapObject_GetPosVecYCoord
	str r0, [sp, #4]
_0205E78E:
	ldr r0, [sp, #4]
	str r0, [r4, #0x2c]
_0205E792:
	add r0, r5, #0
	bl sub_0205F394
	add r3, r4, #0
	add r3, #0x30
	mov r2, #0x10
_0205E79E:
	ldrb r1, [r0]
	add r0, r0, #1
	strb r1, [r3]
	add r3, r3, #1
	sub r2, r2, #1
	bne _0205E79E
	add r0, r5, #0
	bl sub_0205F3BC
	add r4, #0x40
	mov r2, #0x10
_0205E7B4:
	ldrb r1, [r0]
	add r0, r0, #1
	strb r1, [r4]
	add r4, r4, #1
	sub r2, r2, #1
	bne _0205E7B4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_0205E680

	thumb_func_start sub_0205E7C4
sub_0205E7C4: ; 0x0205E7C4
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r1, [r4]
	add r5, r0, #0
	bl sub_0205F204
	ldr r1, [r4, #4]
	add r0, r5, #0
	bl sub_0205F238
	ldrb r1, [r4, #8]
	add r0, r5, #0
	bl MapObject_SetID
	ldrh r1, [r4, #0x10]
	add r0, r5, #0
	bl sub_0205F250
	ldrh r1, [r4, #0x12]
	add r0, r5, #0
	bl MapObject_SetGfxID
	ldrb r1, [r4, #9]
	add r0, r5, #0
	bl MapObject_SetMovement
	ldrh r1, [r4, #0x14]
	add r0, r5, #0
	bl MapObject_SetType
	ldrh r1, [r4, #0x16]
	add r0, r5, #0
	bl MapObject_SetFlagID
	ldrh r1, [r4, #0x18]
	add r0, r5, #0
	bl MapObject_SetScript
	mov r1, #0xc
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl MapObject_SetInitialFacing
	mov r1, #0xd
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl MapObject_ForceSetFacingDirection
	mov r1, #0xe
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl MapObject_SetNextFacing
	mov r1, #0x1a
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0
	bl MapObject_SetParam
	mov r1, #0x1c
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	mov r2, #1
	bl MapObject_SetParam
	mov r1, #0x1e
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	mov r2, #2
	bl MapObject_SetParam
	mov r1, #0xa
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl MapObject_SetXRange
	mov r1, #0xb
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl MapObject_SetYRange
	mov r1, #0x20
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	bl MapObject_SetInitialX
	mov r1, #0x22
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	bl MapObject_SetInitialHeight
	mov r1, #0x24
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	bl MapObject_SetInitialY
	mov r1, #0x26
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	bl MapObject_SetCurrentX
	mov r1, #0x28
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	bl MapObject_SetCurrentHeight
	mov r1, #0x2a
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	bl MapObject_SetCurrentY
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r4, #0x2c]
	str r0, [sp, #4]
	add r0, r5, #0
	bl MapObject_SetPositionVec
	add r0, r5, #0
	bl sub_0205F394
	add r3, r4, #0
	add r3, #0x30
	mov r2, #0x10
_0205E8C4:
	ldrb r1, [r3]
	add r3, r3, #1
	strb r1, [r0]
	add r0, r0, #1
	sub r2, r2, #1
	bne _0205E8C4
	add r0, r5, #0
	bl sub_0205F3BC
	add r4, #0x40
	mov r2, #0x10
_0205E8DA:
	ldrb r1, [r4]
	add r4, r4, #1
	strb r1, [r0]
	add r0, r0, #1
	sub r2, r2, #1
	bne _0205E8DA
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205E7C4

	thumb_func_start sub_0205E8EC
sub_0205E8EC: ; 0x0205E8EC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205E934
	add r0, r4, #0
	bl sub_0205E954
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205F354
	add r0, r4, #0
	bl sub_0205ECE0
	add r0, r4, #0
	bl MapObject_ClearHeldMovement
	add r0, r4, #0
	bl sub_0205EFB4
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205EAF0
	add r0, r4, #0
	bl sub_0205F450
	add r0, r5, #0
	bl sub_0205F160
	bl sub_0205F16C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205E8EC

	thumb_func_start sub_0205E934
sub_0205E934: ; 0x0205E934
	push {r4, lr}
	mov r1, #5
	add r4, r0, #0
	bl MapObject_SetBits
	ldr r1, _0205E950 ; =0x00EF4248
	add r0, r4, #0
	bl MapObject_ClearBits
	add r0, r4, #0
	bl sub_0205EF5C
	pop {r4, pc}
	nop
_0205E950: .word 0x00EF4248
	thumb_func_end sub_0205E934

	thumb_func_start sub_0205E954
sub_0205E954: ; 0x0205E954
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r1, sp, #0
	bl MapObject_GetPositionVec
	add r0, r4, #0
	bl MapObject_GetCurrentX
	add r1, r0, #0
	mov r0, #2
	lsl r2, r1, #0x10
	lsl r0, r0, #0xe
	add r0, r2, r0
	str r0, [sp]
	add r0, r4, #0
	bl MapObject_SetPrevX
	add r0, r4, #0
	bl MapObject_GetCurrentHeight
	add r1, r0, #0
	add r0, r4, #0
	bl MapObject_SetPrevHeight
	add r0, r4, #0
	bl MapObject_GetCurrentY
	add r1, r0, #0
	mov r0, #2
	lsl r2, r1, #0x10
	lsl r0, r0, #0xe
	add r0, r2, r0
	str r0, [sp, #8]
	add r0, r4, #0
	bl MapObject_SetPrevY
	add r0, r4, #0
	add r1, sp, #0
	bl MapObject_SetPositionVec
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205E954

	thumb_func_start InitMapObjectsFromEventTemplates
InitMapObjectsFromEventTemplates: ; 0x0205E9AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r2, #0
	add r7, r0, #0
	add r4, r3, #0
	str r1, [sp]
	cmp r5, #0
	bne _0205E9C0
	bl GF_AssertFail
_0205E9C0:
	lsl r0, r5, #5
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, #0xb
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	bne _0205E9D4
	bl GF_AssertFail
_0205E9D4:
	ldr r2, [sp, #4]
	add r0, r6, #0
	add r1, r4, #0
	bl memcpy
	mov r0, #0xb
	mov r1, #0x14
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	bne _0205E9EE
	bl GF_AssertFail
_0205E9EE:
	ldr r0, [sp]
	str r0, [r4]
	str r5, [r4, #4]
	mov r0, #0
	str r0, [r4, #8]
	str r7, [r4, #0xc]
	add r0, r4, #0
	str r6, [r4, #0x10]
	bl sub_0205EA08
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end InitMapObjectsFromEventTemplates

	thumb_func_start sub_0205EA08
sub_0205EA08: ; 0x0205EA08
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl MapObjectMan_GetFieldSysPtr
	add r6, r5, #0
	ldr r4, [r5, #0x10]
	add r7, r0, #0
	add r6, #8
_0205EA1A:
	add r0, r4, #0
	bl ObjectEventTemplate_ScriptIdIsFFFF
	cmp r0, #1
	beq _0205EA30
	ldrh r1, [r4, #8]
	add r0, r7, #0
	bl FlagGet
	cmp r0, #0
	bne _0205EA42
_0205EA30:
	ldr r0, [r5, #0xc]
	ldr r2, [r5]
	add r1, r4, #0
	bl sub_0205E1D0
	cmp r0, #0
	bne _0205EA42
	bl GF_AssertFail
_0205EA42:
	ldr r0, [r6]
	add r4, #0x20
	add r0, r0, #1
	str r0, [r6]
	ldr r1, [r5, #8]
	ldr r0, [r5, #4]
	cmp r1, r0
	blt _0205EA1A
	ldr r1, [r5, #0x10]
	mov r0, #0xb
	bl FreeToHeapExplicit
	mov r0, #0xb
	add r1, r5, #0
	bl FreeToHeapExplicit
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205EA08

	thumb_func_start sub_0205EA64
sub_0205EA64: ; 0x0205EA64
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r4, #0
	bl MapObjectMan_GetCount
	add r6, r0, #0
	add r0, r5, #0
	bl MapObjectMan_GetArray
	mov r7, #0x4b
	add r5, r0, #0
	lsl r7, r7, #2
_0205EA7C:
	add r0, r5, #0
	mov r1, #1
	bl MapObject_GetBitsMask
	cmp r0, #0
	bne _0205EA8C
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205EA8C:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, r6
	blt _0205EA7C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205EA64

	thumb_func_start sub_0205EA98
sub_0205EA98: ; 0x0205EA98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	mov r1, #0
	add r4, r2, #0
	str r1, [sp, #4]
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	add r6, r0, #0
	bl sub_0205EEF4
	cmp r0, #1
	bne _0205EAEA
	add r7, sp, #0
_0205EAB6:
	ldr r0, [sp]
	bl sub_0205F7D4
	cmp r0, #1
	bne _0205EADA
	ldr r0, [sp]
	bl MapObject_GetID
	cmp r5, r0
	bne _0205EADA
	ldr r0, [sp]
	bl sub_0205F544
	cmp r4, r0
	bne _0205EADA
	ldr r0, [sp]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0205EADA:
	add r0, r6, #0
	add r1, r7, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	beq _0205EAB6
_0205EAEA:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205EA98

	thumb_func_start sub_0205EAF0
sub_0205EAF0: ; 0x0205EAF0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl sub_0205F19C
	add r5, r0, #0
	add r0, r4, #0
	bl MapObject_GetMovement
	cmp r0, #0x30
	beq _0205EB08
	cmp r0, #0x32
	bne _0205EB0A
_0205EB08:
	add r5, r5, #2
_0205EB0A:
	ldr r0, _0205EB28 ; =sub_0205F12C
	add r1, r4, #0
	add r2, r5, #0
	bl CreateSysTask
	add r5, r0, #0
	bne _0205EB1C
	bl GF_AssertFail
_0205EB1C:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205F338
	pop {r3, r4, r5, pc}
	nop
_0205EB28: .word sub_0205F12C
	thumb_func_end sub_0205EAF0

	thumb_func_start sub_0205EB2C
sub_0205EB2C: ; 0x0205EB2C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	bl ObjectEventTemplate_GetID
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetID
	add r0, r4, #0
	bl ObjectEventTemplate_GetSprite
	add r1, r0, #0
	add r0, r6, #0
	bl ResolveObjectGfxId
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetGfxID
	add r0, r4, #0
	bl ObjectEventTemplate_GetMovement
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetMovement
	add r0, r4, #0
	bl ObjectEventTemplate_GetType
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetType
	add r0, r4, #0
	bl ObjectEventTemplate_GetFlagID
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetFlagID
	add r0, r4, #0
	bl ObjectEventTemplate_GetScript
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetScript
	add r0, r4, #0
	bl ObjectEventTemplate_GetFacing
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetInitialFacing
	add r0, r4, #0
	mov r1, #0
	bl ObjectEventTemplate_GetParam
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0
	bl MapObject_SetParam
	add r0, r4, #0
	mov r1, #1
	bl ObjectEventTemplate_GetParam
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #1
	bl MapObject_SetParam
	add r0, r4, #0
	mov r1, #2
	bl ObjectEventTemplate_GetParam
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #2
	bl MapObject_SetParam
	add r0, r4, #0
	bl ObjectEventTemplate_GetXRange
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetXRange
	add r0, r4, #0
	bl ObjectEventTemplate_GetYRange
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetYRange
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205EBFC
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205EB2C

	thumb_func_start sub_0205EBFC
sub_0205EBFC: ; 0x0205EBFC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r4, r0, #0
	add r0, r6, #0
	bl ObjectEventTemplate_GetXCoord
	add r5, r0, #0
	mov r0, #2
	lsl r1, r5, #0x10
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp]
	add r0, r4, #0
	add r1, r5, #0
	bl MapObject_SetInitialX
	add r0, r4, #0
	add r1, r5, #0
	bl MapObject_SetPrevX
	add r0, r4, #0
	add r1, r5, #0
	bl MapObject_SetCurrentX
	add r0, r6, #0
	bl ObjectEventTemplate_GetHeight
	asr r1, r0, #3
	str r0, [sp, #4]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r5, r0, #0xc
	add r0, r4, #0
	add r1, r5, #0
	bl MapObject_SetInitialHeight
	add r0, r4, #0
	add r1, r5, #0
	bl MapObject_SetPrevHeight
	add r0, r4, #0
	add r1, r5, #0
	bl MapObject_SetCurrentHeight
	add r0, r6, #0
	bl ObjectEventTemplate_GetYCoord
	add r5, r0, #0
	mov r0, #2
	lsl r1, r5, #0x10
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, r5, #0
	bl MapObject_SetInitialY
	add r0, r4, #0
	add r1, r5, #0
	bl MapObject_SetPrevY
	add r0, r4, #0
	add r1, r5, #0
	bl MapObject_SetCurrentY
	add r0, r4, #0
	add r1, sp, #0
	bl MapObject_SetPositionVec
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205EBFC

	thumb_func_start sub_0205EC90
sub_0205EC90: ; 0x0205EC90
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _0205ECDC ; =0x00001801
	add r5, r0, #0
	bl MapObject_SetBits
	add r0, r5, #0
	bl sub_0205EFF8
	cmp r0, #1
	bne _0205ECAE
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F7B8
_0205ECAE:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F354
	add r0, r5, #0
	bl MapObject_GetInitialFacing
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_ForceSetFacingDirection
	add r0, r5, #0
	bl MapObject_GetInitialFacing
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetNextFacing
	add r0, r5, #0
	bl MapObject_ClearHeldMovement
	pop {r3, r4, r5, pc}
	nop
_0205ECDC: .word 0x00001801
	thumb_func_end sub_0205EC90

	thumb_func_start sub_0205ECE0
sub_0205ECE0: ; 0x0205ECE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl MapObject_GetMovement
	bl sub_0205FB00
	add r4, r0, #0
	bl sub_0205FB18
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F414
	add r0, r4, #0
	bl sub_0205FB1C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F428
	add r0, r4, #0
	bl sub_0205FB20
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205F43C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205ECE0

	thumb_func_start sub_0205ED18
sub_0205ED18: ; 0x0205ED18
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl MapObject_GetGfxID
	mov r1, #2
	lsl r1, r1, #0xc
	cmp r0, r1
	bne _0205ED2C
	ldr r5, _0205ED7C ; =ov01_0220724C
	b _0205ED32
_0205ED2C:
	bl sub_0205FB38
	add r5, r0, #0
_0205ED32:
	add r0, r5, #0
	bl sub_0205FB24
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205F468
	add r0, r5, #0
	bl sub_0205FB28
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205F47C
	add r0, r5, #0
	bl sub_0205FB2C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205F490
	add r0, r5, #0
	bl sub_0205FB30
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205F4A4
	add r0, r5, #0
	bl sub_0205FB34
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205F4B8
	pop {r3, r4, r5, pc}
	nop
_0205ED7C: .word ov01_0220724C
	thumb_func_end sub_0205ED18

	thumb_func_start sub_0205ED80
sub_0205ED80: ; 0x0205ED80
	ldr r3, _0205ED8C ; =memset
	mov r2, #0x4b
	mov r1, #0
	lsl r2, r2, #2
	bx r3
	nop
_0205ED8C: .word memset
	thumb_func_end sub_0205ED80

	thumb_func_start sub_0205ED90
sub_0205ED90: ; 0x0205ED90
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	add r6, r3, #0
	str r1, [sp]
	cmp r7, #0
	beq _0205EE0A
_0205ED9E:
	add r0, r6, #0
	bl ObjectEventTemplate_GetID
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetID
	cmp r4, r0
	bne _0205EE02
	add r0, r6, #0
	bl ObjectEventTemplate_ScriptIdIsFFFF
	cmp r0, #1
	bne _0205EDE8
	add r0, r6, #0
	bl ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F7D4
	cmp r0, #1
	bne _0205EDDA
	add r0, r5, #0
	bl sub_0205F544
	cmp r4, r0
	bne _0205EE02
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205EDDA:
	add r0, r5, #0
	bl sub_0205F254
	cmp r4, r0
	bne _0205EE02
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0205EDE8:
	add r0, r5, #0
	bl sub_0205F7D4
	cmp r0, #1
	bne _0205EE02
	add r0, r5, #0
	bl sub_0205F544
	ldr r1, [sp]
	cmp r1, r0
	bne _0205EE02
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0205EE02:
	sub r7, r7, #1
	add r6, #0x20
	cmp r7, #0
	bne _0205ED9E
_0205EE0A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205ED90

	thumb_func_start sub_0205EE10
sub_0205EE10: ; 0x0205EE10
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	mov r1, #0
	add r4, r2, #0
	str r1, [sp, #4]
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	add r6, r0, #0
	bl sub_0205EEF4
	cmp r0, #1
	bne _0205EE58
	add r7, sp, #0
_0205EE2E:
	ldr r0, [sp]
	bl MapObject_GetID
	cmp r5, r0
	bne _0205EE48
	ldr r0, [sp]
	bl sub_0205F254
	cmp r4, r0
	bne _0205EE48
	ldr r0, [sp]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0205EE48:
	add r0, r6, #0
	add r1, r7, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	beq _0205EE2E
_0205EE58:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205EE10

	thumb_func_start GetMapObjectByID
GetMapObjectByID: ; 0x0205EE60
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	cmp r5, #0
	bne _0205EE6E
	bl GF_AssertFail
_0205EE6E:
	add r0, r5, #0
	bl MapObjectMan_GetCount
	add r4, r0, #0
	add r0, r5, #0
	bl MapObjectMan_GetConstArray
	mov r7, #0x4b
	add r5, r0, #0
	lsl r7, r7, #2
_0205EE82:
	add r0, r5, #0
	mov r1, #1
	bl MapObject_TestBits
	cmp r0, #1
	bne _0205EEA6
	add r0, r5, #0
	bl sub_0205F7D4
	cmp r0, #0
	bne _0205EEA6
	add r0, r5, #0
	bl MapObject_GetID
	cmp r6, r0
	bne _0205EEA6
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205EEA6:
	sub r4, r4, #1
	add r5, r5, r7
	cmp r4, #0
	bgt _0205EE82
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end GetMapObjectByID

	thumb_func_start sub_0205EEB4
sub_0205EEB4: ; 0x0205EEB4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl MapObjectMan_GetCount
	add r4, r0, #0
	add r0, r5, #0
	bl MapObjectMan_GetConstArray
	mov r7, #0x4b
	add r5, r0, #0
	lsl r7, r7, #2
_0205EECC:
	add r0, r5, #0
	mov r1, #1
	bl MapObject_TestBits
	cmp r0, #1
	bne _0205EEE6
	add r0, r5, #0
	bl MapObject_GetMovement
	cmp r6, r0
	bne _0205EEE6
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205EEE6:
	sub r4, r4, #1
	add r5, r5, r7
	cmp r4, #0
	bgt _0205EECC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205EEB4

	thumb_func_start sub_0205EEF4
sub_0205EEF4: ; 0x0205EEF4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	add r4, r0, #0
	str r1, [sp]
	add r6, r3, #0
	bl MapObjectMan_GetCount
	add r7, r0, #0
	ldr r0, [r5]
	cmp r0, r7
	blt _0205EF0E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205EF0E:
	add r0, r4, #0
	bl MapObjectMan_GetConstArray
	mov r1, #0x4b
	ldr r2, [r5]
	lsl r1, r1, #2
	mul r1, r2
	add r4, r0, r1
_0205EF1E:
	ldr r0, [r5]
	add r1, r6, #0
	add r0, r0, #1
	str r0, [r5]
	add r0, r4, #0
	bl MapObject_GetBitsMask
	cmp r6, r0
	bne _0205EF38
	ldr r0, [sp]
	str r4, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205EF38:
	mov r0, #0x4b
	lsl r0, r0, #2
	add r4, r4, r0
	ldr r0, [r5]
	cmp r0, r7
	blt _0205EF1E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205EEF4

	thumb_func_start sub_0205EF48
sub_0205EF48: ; 0x0205EF48
	push {r4, lr}
	add r4, r0, #0
	mov r1, #4
	bl MapObject_SetBits
	add r0, r4, #0
	bl sub_0205EF5C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205EF48

	thumb_func_start sub_0205EF5C
sub_0205EF5C: ; 0x0205EF5C
	ldr r3, _0205EF64 ; =MapObject_ClearBits
	ldr r1, _0205EF68 ; =0x05108000
	bx r3
	nop
_0205EF64: .word MapObject_ClearBits
_0205EF68: .word 0x05108000
	thumb_func_end sub_0205EF5C

	thumb_func_start sub_0205EF6C
sub_0205EF6C: ; 0x0205EF6C
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205EF6C

	thumb_func_start ResolveObjectGfxId
ResolveObjectGfxId: ; 0x0205EF70
	push {r3, lr}
	cmp r1, #0x65
	blt _0205EF86
	cmp r1, #0x75
	bgt _0205EF86
	sub r1, #0x65
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl VarGetObjectEventGraphicsId
	add r1, r0, #0
_0205EF86:
	add r0, r1, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ResolveObjectGfxId

	thumb_func_start sub_0205EF8C
sub_0205EF8C: ; 0x0205EF8C
	push {r4, lr}
	mov r1, #1
	lsl r1, r1, #0xc
	add r4, r0, #0
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205EFA2
	add r0, r4, #0
	bl sub_02061070
_0205EFA2:
	pop {r4, pc}
	thumb_func_end sub_0205EF8C

	thumb_func_start sub_0205EFA4
sub_0205EFA4: ; 0x0205EFA4
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205ECE0
	add r0, r4, #0
	bl sub_0205FD20
	pop {r4, pc}
	thumb_func_end sub_0205EFA4

	thumb_func_start sub_0205EFB4
sub_0205EFB4: ; 0x0205EFB4
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F35C
	bl sub_0205F5D4
	cmp r0, #0
	beq _0205EFF6
	add r0, r4, #0
	bl sub_0205EF8C
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	mov r1, #0
	bl ov01_021FA2B8
	add r0, r4, #0
	bl sub_0205F678
	cmp r0, #0
	bne _0205EFF6
	add r0, r4, #0
	bl sub_0205ED18
	add r0, r4, #0
	bl sub_0205F470
	add r0, r4, #0
	bl sub_0205F66C
_0205EFF6:
	pop {r4, pc}
	thumb_func_end sub_0205EFB4

	thumb_func_start sub_0205EFF8
sub_0205EFF8: ; 0x0205EFF8
	push {r3, lr}
	bl MapObject_GetScript
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, _0205F010 ; =0x0000FFFF
	cmp r1, r0
	bne _0205F00C
	mov r0, #1
	pop {r3, pc}
_0205F00C:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0205F010: .word 0x0000FFFF
	thumb_func_end sub_0205EFF8

	thumb_func_start sub_0205F014
sub_0205F014: ; 0x0205F014
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0205F7D4
	cmp r0, #1
	beq _0205F028
	bl GF_AssertFail
_0205F028:
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F7B8
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205F250
	add r0, r4, #0
	bl ObjectEventTemplate_GetScript
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetScript
	add r0, r4, #0
	bl ObjectEventTemplate_GetFlagID
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetFlagID
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205F014

	thumb_func_start sub_0205F058
sub_0205F058: ; 0x0205F058
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r0, r6, #0
	add r4, r1, #0
	bl ObjectEventTemplate_ScriptIdIsFFFF
	cmp r0, #1
	beq _0205F06E
	bl GF_AssertFail
_0205F06E:
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F7B8
	add r0, r6, #0
	bl ObjectEventTemplate_GetScript
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetScript
	add r0, r6, #0
	bl ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetFlagID
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F250
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0205F058

	thumb_func_start sub_0205F09C
sub_0205F09C: ; 0x0205F09C
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205F538
	add r0, r0, r4
	pop {r4, pc}
	thumb_func_end sub_0205F09C

	thumb_func_start sub_0205F0A8
sub_0205F0A8: ; 0x0205F0A8
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #1
	add r5, r0, #0
	add r4, r2, #0
	bl MapObject_TestBits
	cmp r0, #0
	bne _0205F0BE
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205F0BE:
	add r0, r5, #0
	bl MapObject_GetID
	cmp r6, r0
	beq _0205F0CC
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205F0CC:
	add r0, r5, #0
	bl sub_0205F254
	cmp r4, r0
	beq _0205F0F2
	add r0, r5, #0
	bl sub_0205F7D4
	cmp r0, #0
	bne _0205F0E4
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205F0E4:
	add r0, r5, #0
	bl sub_0205F544
	cmp r4, r0
	beq _0205F0F2
	mov r0, #0
	pop {r4, r5, r6, pc}
_0205F0F2:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205F0A8

	thumb_func_start sub_0205F0F8
sub_0205F0F8: ; 0x0205F0F8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #1
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	bl MapObject_TestBits
	cmp r0, #0
	bne _0205F110
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205F110:
	add r0, r5, #0
	bl MapObject_GetGfxID
	cmp r0, r4
	beq _0205F11E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205F11E:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0205F0A8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205F0F8

	thumb_func_start sub_0205F12C
sub_0205F12C: ; 0x0205F12C
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	bl sub_0205FD30
	add r0, r4, #0
	bl MapObject_IsInUse
	cmp r0, #0
	beq _0205F146
	add r0, r4, #0
	bl sub_0205F148
_0205F146:
	pop {r4, pc}
	thumb_func_end sub_0205F12C

	thumb_func_start sub_0205F148
sub_0205F148: ; 0x0205F148
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F35C
	bl sub_0205F5D4
	cmp r0, #1
	bne _0205F15E
	add r0, r4, #0
	bl ov01_021F92A0
_0205F15E:
	pop {r4, pc}
	thumb_func_end sub_0205F148

	thumb_func_start sub_0205F160
sub_0205F160: ; 0x0205F160
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F160

	thumb_func_start MapObjectMan_SetCount
MapObjectMan_SetCount: ; 0x0205F164
	str r1, [r0, #4]
	bx lr
	thumb_func_end MapObjectMan_SetCount

	thumb_func_start MapObjectMan_GetCount
MapObjectMan_GetCount: ; 0x0205F168
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end MapObjectMan_GetCount

	thumb_func_start sub_0205F16C
sub_0205F16C: ; 0x0205F16C
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	bx lr
	thumb_func_end sub_0205F16C

	thumb_func_start sub_0205F174
sub_0205F174: ; 0x0205F174
	ldr r1, [r0, #8]
	sub r1, r1, #1
	str r1, [r0, #8]
	bx lr
	thumb_func_end sub_0205F174

	thumb_func_start sub_0205F17C
sub_0205F17C: ; 0x0205F17C
	ldr r2, [r0]
	orr r1, r2
	str r1, [r0]
	bx lr
	thumb_func_end sub_0205F17C

	thumb_func_start sub_0205F184
sub_0205F184: ; 0x0205F184
	ldr r2, [r0]
	mvn r1, r1
	and r1, r2
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F184

	thumb_func_start sub_0205F190
sub_0205F190: ; 0x0205F190
	ldr r0, [r0]
	and r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F190

	thumb_func_start sub_0205F198
sub_0205F198: ; 0x0205F198
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205F198

	thumb_func_start sub_0205F19C
sub_0205F19C: ; 0x0205F19C
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205F19C

	thumb_func_start sub_0205F1A0
sub_0205F1A0: ; 0x0205F1A0
	add r0, #0x18
	bx lr
	thumb_func_end sub_0205F1A0

	thumb_func_start sub_0205F1A4
sub_0205F1A4: ; 0x0205F1A4
	mov r2, #0x49
	lsl r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end sub_0205F1A4

	thumb_func_start sub_0205F1AC
sub_0205F1AC: ; 0x0205F1AC
	mov r1, #0x49
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end sub_0205F1AC

	thumb_func_start MapObjectMan_GetConstArray
MapObjectMan_GetConstArray: ; 0x0205F1B4
	mov r1, #0x49
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end MapObjectMan_GetConstArray

	thumb_func_start MapObjectMan_GetArray
MapObjectMan_GetArray: ; 0x0205F1BC
	mov r1, #0x49
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end MapObjectMan_GetArray

	thumb_func_start sub_0205F1C4
sub_0205F1C4: ; 0x0205F1C4
	mov r1, #0x4b
	ldr r2, [r0]
	lsl r1, r1, #2
	add r1, r2, r1
	str r1, [r0]
	bx lr
	thumb_func_end sub_0205F1C4

	thumb_func_start sub_0205F1D0
sub_0205F1D0: ; 0x0205F1D0
	mov r1, #0x4b
	ldr r2, [r0]
	lsl r1, r1, #2
	add r1, r2, r1
	str r1, [r0]
	bx lr
	thumb_func_end sub_0205F1D0

	thumb_func_start MapObjectMan_SetFieldSysPtr
MapObjectMan_SetFieldSysPtr: ; 0x0205F1DC
	mov r2, #0x4a
	lsl r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end MapObjectMan_SetFieldSysPtr

	thumb_func_start MapObjectMan_GetFieldSysPtr
MapObjectMan_GetFieldSysPtr: ; 0x0205F1E4
	mov r1, #0x4a
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end MapObjectMan_GetFieldSysPtr

	thumb_func_start FldObjSys_SetMModelNarc
FldObjSys_SetMModelNarc: ; 0x0205F1EC
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end FldObjSys_SetMModelNarc

	thumb_func_start FldObjSys_GetMModelNarc
FldObjSys_GetMModelNarc: ; 0x0205F1F0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0205F1FE
	bl GF_AssertFail
_0205F1FE:
	ldr r0, [r4, #0x14]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FldObjSys_GetMModelNarc

	thumb_func_start sub_0205F204
sub_0205F204: ; 0x0205F204
	str r1, [r0]
	bx lr
	thumb_func_end sub_0205F204

	thumb_func_start MapObject_GetBitsWord
MapObject_GetBitsWord: ; 0x0205F208
	ldr r0, [r0]
	bx lr
	thumb_func_end MapObject_GetBitsWord

	thumb_func_start MapObject_SetBits
MapObject_SetBits: ; 0x0205F20C
	ldr r2, [r0]
	orr r1, r2
	str r1, [r0]
	bx lr
	thumb_func_end MapObject_SetBits

	thumb_func_start MapObject_ClearBits
MapObject_ClearBits: ; 0x0205F214
	ldr r2, [r0]
	mvn r1, r1
	and r1, r2
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end MapObject_ClearBits

	thumb_func_start MapObject_GetBitsMask
MapObject_GetBitsMask: ; 0x0205F220
	ldr r0, [r0]
	and r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end MapObject_GetBitsMask

	thumb_func_start MapObject_TestBits
MapObject_TestBits: ; 0x0205F228
	ldr r0, [r0]
	tst r0, r1
	beq _0205F232
	mov r0, #1
	bx lr
_0205F232:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end MapObject_TestBits

	thumb_func_start sub_0205F238
sub_0205F238: ; 0x0205F238
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_0205F238

	thumb_func_start sub_0205F23C
sub_0205F23C: ; 0x0205F23C
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_0205F23C

	thumb_func_start sub_0205F240
sub_0205F240: ; 0x0205F240
	ldr r0, [r0, #4]
	and r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F240

	thumb_func_start MapObject_SetID
MapObject_SetID: ; 0x0205F248
	str r1, [r0, #8]
	bx lr
	thumb_func_end MapObject_SetID

	thumb_func_start MapObject_GetID
MapObject_GetID: ; 0x0205F24C
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end MapObject_GetID

	thumb_func_start sub_0205F250
sub_0205F250: ; 0x0205F250
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205F250

	thumb_func_start sub_0205F254
sub_0205F254: ; 0x0205F254
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205F254

	thumb_func_start MapObject_SetGfxID
MapObject_SetGfxID: ; 0x0205F258
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end MapObject_SetGfxID

	thumb_func_start MapObject_GetGfxID
MapObject_GetGfxID: ; 0x0205F25C
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end MapObject_GetGfxID

	thumb_func_start MapObject_SetMovement
MapObject_SetMovement: ; 0x0205F260
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end MapObject_SetMovement

	thumb_func_start MapObject_GetMovement
MapObject_GetMovement: ; 0x0205F264
	ldr r0, [r0, #0x14]
	bx lr
	thumb_func_end MapObject_GetMovement

	thumb_func_start MapObject_SetType
MapObject_SetType: ; 0x0205F268
	str r1, [r0, #0x18]
	bx lr
	thumb_func_end MapObject_SetType

	thumb_func_start MapObject_GetType
MapObject_GetType: ; 0x0205F26C
	ldr r0, [r0, #0x18]
	bx lr
	thumb_func_end MapObject_GetType

	thumb_func_start MapObject_SetFlagID
MapObject_SetFlagID: ; 0x0205F270
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end MapObject_SetFlagID

	thumb_func_start MapObject_GetFlagID
MapObject_GetFlagID: ; 0x0205F274
	ldr r0, [r0, #0x1c]
	bx lr
	thumb_func_end MapObject_GetFlagID

	thumb_func_start MapObject_SetScript
MapObject_SetScript: ; 0x0205F278
	str r1, [r0, #0x20]
	bx lr
	thumb_func_end MapObject_SetScript

	thumb_func_start MapObject_GetScript
MapObject_GetScript: ; 0x0205F27C
	ldr r0, [r0, #0x20]
	bx lr
	thumb_func_end MapObject_GetScript

	thumb_func_start MapObject_SetInitialFacing
MapObject_SetInitialFacing: ; 0x0205F280
	str r1, [r0, #0x24]
	bx lr
	thumb_func_end MapObject_SetInitialFacing

	thumb_func_start MapObject_GetInitialFacing
MapObject_GetInitialFacing: ; 0x0205F284
	ldr r0, [r0, #0x24]
	bx lr
	thumb_func_end MapObject_GetInitialFacing

	thumb_func_start MapObject_ForceSetFacingDirection
MapObject_ForceSetFacingDirection: ; 0x0205F288
	ldr r2, [r0, #0x28]
	str r2, [r0, #0x30]
	str r1, [r0, #0x28]
	bx lr
	thumb_func_end MapObject_ForceSetFacingDirection

	thumb_func_start MapObject_SetFacingDirection
MapObject_SetFacingDirection: ; 0x0205F290
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x80
	add r5, r0, #0
	bl MapObject_GetBitsMask
	cmp r0, #0
	bne _0205F2A6
	ldr r0, [r5, #0x28]
	str r0, [r5, #0x30]
	str r4, [r5, #0x28]
_0205F2A6:
	pop {r3, r4, r5, pc}
	thumb_func_end MapObject_SetFacingDirection

	thumb_func_start MapObject_GetFacingDirection
MapObject_GetFacingDirection: ; 0x0205F2A8
	ldr r0, [r0, #0x28]
	bx lr
	thumb_func_end MapObject_GetFacingDirection

	thumb_func_start MapObject_GetPreviousFacing
MapObject_GetPreviousFacing: ; 0x0205F2AC
	ldr r0, [r0, #0x30]
	bx lr
	thumb_func_end MapObject_GetPreviousFacing

	thumb_func_start MapObject_SetNextFacing
MapObject_SetNextFacing: ; 0x0205F2B0
	ldr r2, [r0, #0x2c]
	str r2, [r0, #0x34]
	str r1, [r0, #0x2c]
	bx lr
	thumb_func_end MapObject_SetNextFacing

	thumb_func_start MapObject_GetNextFacing
MapObject_GetNextFacing: ; 0x0205F2B8
	ldr r0, [r0, #0x2c]
	bx lr
	thumb_func_end MapObject_GetNextFacing

	thumb_func_start MapObject_SetOrQueueFacing
MapObject_SetOrQueueFacing: ; 0x0205F2BC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl MapObject_SetFacingDirection
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_SetNextFacing
	pop {r3, r4, r5, pc}
	thumb_func_end MapObject_SetOrQueueFacing

	thumb_func_start MapObject_SetParam
MapObject_SetParam: ; 0x0205F2D0
	push {r3, lr}
	cmp r2, #0
	beq _0205F2E0
	cmp r2, #1
	beq _0205F2E4
	cmp r2, #2
	beq _0205F2E8
	b _0205F2EC
_0205F2E0:
	str r1, [r0, #0x38]
	pop {r3, pc}
_0205F2E4:
	str r1, [r0, #0x3c]
	pop {r3, pc}
_0205F2E8:
	str r1, [r0, #0x40]
	pop {r3, pc}
_0205F2EC:
	bl GF_AssertFail
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end MapObject_SetParam

	thumb_func_start MapObject_GetParam
MapObject_GetParam: ; 0x0205F2F4
	push {r3, lr}
	cmp r1, #0
	beq _0205F304
	cmp r1, #1
	beq _0205F308
	cmp r1, #2
	beq _0205F30C
	b _0205F310
_0205F304:
	ldr r0, [r0, #0x38]
	pop {r3, pc}
_0205F308:
	ldr r0, [r0, #0x3c]
	pop {r3, pc}
_0205F30C:
	ldr r0, [r0, #0x40]
	pop {r3, pc}
_0205F310:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end MapObject_GetParam

	thumb_func_start MapObject_SetXRange
MapObject_SetXRange: ; 0x0205F318
	str r1, [r0, #0x44]
	bx lr
	thumb_func_end MapObject_SetXRange

	thumb_func_start MapObject_GetXRange
MapObject_GetXRange: ; 0x0205F31C
	ldr r0, [r0, #0x44]
	bx lr
	thumb_func_end MapObject_GetXRange

	thumb_func_start MapObject_SetYRange
MapObject_SetYRange: ; 0x0205F320
	str r1, [r0, #0x48]
	bx lr
	thumb_func_end MapObject_SetYRange

	thumb_func_start MapObject_GetYRange
MapObject_GetYRange: ; 0x0205F324
	ldr r0, [r0, #0x48]
	bx lr
	thumb_func_end MapObject_GetYRange

	thumb_func_start sub_0205F328
sub_0205F328: ; 0x0205F328
	add r0, #0xa0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F328

	thumb_func_start sub_0205F330
sub_0205F330: ; 0x0205F330
	add r0, #0xa0
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F330

	thumb_func_start sub_0205F338
sub_0205F338: ; 0x0205F338
	add r0, #0xb0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F338

	thumb_func_start sub_0205F340
sub_0205F340: ; 0x0205F340
	add r0, #0xb0
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F340

	thumb_func_start sub_0205F348
sub_0205F348: ; 0x0205F348
	push {r3, lr}
	bl sub_0205F340
	bl DestroySysTask
	pop {r3, pc}
	thumb_func_end sub_0205F348

	thumb_func_start sub_0205F354
sub_0205F354: ; 0x0205F354
	add r0, #0xb4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F354

	thumb_func_start sub_0205F35C
sub_0205F35C: ; 0x0205F35C
	add r0, #0xb4
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F35C

	thumb_func_start sub_0205F364
sub_0205F364: ; 0x0205F364
	ldr r3, _0205F36C ; =sub_0205F160
	add r0, #0xb4
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_0205F36C: .word sub_0205F160
	thumb_func_end sub_0205F364

	thumb_func_start sub_0205F370
sub_0205F370: ; 0x0205F370
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x10
	ble _0205F37E
	bl GF_AssertFail
_0205F37E:
	add r0, r4, #0
	bl sub_0205F394
	mov r1, #0
	add r2, r5, #0
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205F370

	thumb_func_start sub_0205F394
sub_0205F394: ; 0x0205F394
	add r0, #0xd8
	bx lr
	thumb_func_end sub_0205F394

	thumb_func_start sub_0205F398
sub_0205F398: ; 0x0205F398
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x10
	ble _0205F3A6
	bl GF_AssertFail
_0205F3A6:
	add r0, r4, #0
	bl sub_0205F3BC
	mov r1, #0
	add r2, r5, #0
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205F398

	thumb_func_start sub_0205F3BC
sub_0205F3BC: ; 0x0205F3BC
	add r0, #0xe8
	bx lr
	thumb_func_end sub_0205F3BC

	thumb_func_start sub_0205F3C0
sub_0205F3C0: ; 0x0205F3C0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x10
	ble _0205F3CE
	bl GF_AssertFail
_0205F3CE:
	add r0, r4, #0
	bl sub_0205F3E4
	mov r1, #0
	add r2, r5, #0
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205F3C0

	thumb_func_start sub_0205F3E4
sub_0205F3E4: ; 0x0205F3E4
	add r0, #0xf8
	bx lr
	thumb_func_end sub_0205F3E4

	thumb_func_start sub_0205F3E8
sub_0205F3E8: ; 0x0205F3E8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x20
	ble _0205F3F6
	bl GF_AssertFail
_0205F3F6:
	add r0, r4, #0
	bl sub_0205F40C
	mov r1, #0
	add r2, r5, #0
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205F3E8

	thumb_func_start sub_0205F40C
sub_0205F40C: ; 0x0205F40C
	mov r1, #0x42
	lsl r1, r1, #2
	add r0, r0, r1
	bx lr
	thumb_func_end sub_0205F40C

	thumb_func_start sub_0205F414
sub_0205F414: ; 0x0205F414
	add r0, #0xb8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F414

	thumb_func_start sub_0205F41C
sub_0205F41C: ; 0x0205F41C
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xb8
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F41C

	thumb_func_start sub_0205F428
sub_0205F428: ; 0x0205F428
	add r0, #0xbc
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F428

	thumb_func_start sub_0205F430
sub_0205F430: ; 0x0205F430
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xbc
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F430

	thumb_func_start sub_0205F43C
sub_0205F43C: ; 0x0205F43C
	add r0, #0xc0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F43C

	thumb_func_start sub_0205F444
sub_0205F444: ; 0x0205F444
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xc0
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F444

	thumb_func_start sub_0205F450
sub_0205F450: ; 0x0205F450
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_GetMovement
	bl sub_0205FB00
	add r1, r0, #0
	ldr r1, [r1, #0x10]
	add r0, r4, #0
	blx r1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205F450

	thumb_func_start sub_0205F468
sub_0205F468: ; 0x0205F468
	add r0, #0xc4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F468

	thumb_func_start sub_0205F470
sub_0205F470: ; 0x0205F470
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xc4
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F470

	thumb_func_start sub_0205F47C
sub_0205F47C: ; 0x0205F47C
	add r0, #0xc8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F47C

	thumb_func_start sub_0205F484
sub_0205F484: ; 0x0205F484
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xc8
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F484

	thumb_func_start sub_0205F490
sub_0205F490: ; 0x0205F490
	add r0, #0xcc
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F490

	thumb_func_start sub_0205F498
sub_0205F498: ; 0x0205F498
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xcc
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F498

	thumb_func_start sub_0205F4A4
sub_0205F4A4: ; 0x0205F4A4
	add r0, #0xd0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F4A4

	thumb_func_start sub_0205F4AC
sub_0205F4AC: ; 0x0205F4AC
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xd0
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F4AC

	thumb_func_start sub_0205F4B8
sub_0205F4B8: ; 0x0205F4B8
	add r0, #0xd4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F4B8

	thumb_func_start sub_0205F4C0
sub_0205F4C0: ; 0x0205F4C0
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xd4
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F4C0

	thumb_func_start MapObject_SetMovementCommand
MapObject_SetMovementCommand: ; 0x0205F4CC
	add r0, #0xa4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end MapObject_SetMovementCommand

	thumb_func_start MapObject_GetMovementCommand
MapObject_GetMovementCommand: ; 0x0205F4D4
	add r0, #0xa4
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end MapObject_GetMovementCommand

	thumb_func_start MapObject_SetMovementStep
MapObject_SetMovementStep: ; 0x0205F4DC
	add r0, #0xa8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end MapObject_SetMovementStep

	thumb_func_start MapObject_IncMovementStep
MapObject_IncMovementStep: ; 0x0205F4E4
	add r1, r0, #0
	add r1, #0xa8
	ldr r1, [r1]
	add r0, #0xa8
	add r1, r1, #1
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end MapObject_IncMovementStep

	thumb_func_start MapObject_GetMovementStep
MapObject_GetMovementStep: ; 0x0205F4F4
	add r0, #0xa8
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end MapObject_GetMovementStep

	thumb_func_start sub_0205F4FC
sub_0205F4FC: ; 0x0205F4FC
	add r0, #0xac
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F4FC

	thumb_func_start sub_0205F504
sub_0205F504: ; 0x0205F504
	add r0, #0xac
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F504

	thumb_func_start sub_0205F50C
sub_0205F50C: ; 0x0205F50C
	add r0, #0xae
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F50C

	thumb_func_start sub_0205F514
sub_0205F514: ; 0x0205F514
	add r0, #0xae
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F514

	thumb_func_start sub_0205F51C
sub_0205F51C: ; 0x0205F51C
	mov r2, #0x4a
	lsl r2, r2, #2
	strh r1, [r0, r2]
	bx lr
	thumb_func_end sub_0205F51C

	thumb_func_start sub_0205F524
sub_0205F524: ; 0x0205F524
	mov r1, #0x4a
	lsl r1, r1, #2
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end sub_0205F524

	thumb_func_start MapObject_GetFieldSysPtr
MapObject_GetFieldSysPtr: ; 0x0205F52C
	push {r3, lr}
	bl sub_0205F364
	bl MapObjectMan_GetFieldSysPtr
	pop {r3, pc}
	thumb_func_end MapObject_GetFieldSysPtr

	thumb_func_start sub_0205F538
sub_0205F538: ; 0x0205F538
	push {r3, lr}
	bl sub_0205F35C
	bl sub_0205F19C
	pop {r3, pc}
	thumb_func_end sub_0205F538

	thumb_func_start sub_0205F544
sub_0205F544: ; 0x0205F544
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F7D4
	cmp r0, #1
	beq _0205F554
	bl GF_AssertFail
_0205F554:
	add r0, r4, #0
	bl MapObject_GetFlagID
	pop {r4, pc}
	thumb_func_end sub_0205F544

	thumb_func_start sub_0205F55C
sub_0205F55C: ; 0x0205F55C
	ldr r3, _0205F564 ; =sub_0205F17C
	mov r1, #6
	bx r3
	nop
_0205F564: .word sub_0205F17C
	thumb_func_end sub_0205F55C

	thumb_func_start sub_0205F568
sub_0205F568: ; 0x0205F568
	ldr r3, _0205F570 ; =sub_0205F184
	mov r1, #6
	bx r3
	nop
_0205F570: .word sub_0205F184
	thumb_func_end sub_0205F568

	thumb_func_start MapObjectMan_PauseAllMovement
MapObjectMan_PauseAllMovement: ; 0x0205F574
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl MapObjectMan_GetCount
	add r4, r0, #0
	add r0, r5, #0
	bl MapObjectMan_GetArray
	mov r6, #0x4b
	add r5, r0, #0
	lsl r6, r6, #2
_0205F58A:
	add r0, r5, #0
	bl MapObject_IsInUse
	cmp r0, #0
	beq _0205F59A
	add r0, r5, #0
	bl MapObject_PauseMovement
_0205F59A:
	add r5, r5, r6
	sub r4, r4, #1
	bne _0205F58A
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end MapObjectMan_PauseAllMovement

	thumb_func_start MapObjectMan_UnpauseAllMovement
MapObjectMan_UnpauseAllMovement: ; 0x0205F5A4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl MapObjectMan_GetCount
	add r4, r0, #0
	add r0, r5, #0
	bl MapObjectMan_GetArray
	mov r6, #0x4b
	add r5, r0, #0
	lsl r6, r6, #2
_0205F5BA:
	add r0, r5, #0
	bl MapObject_IsInUse
	cmp r0, #0
	beq _0205F5CA
	add r0, r5, #0
	bl MapObject_UnpauseMovement
_0205F5CA:
	add r5, r5, r6
	sub r4, r4, #1
	bne _0205F5BA
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end MapObjectMan_UnpauseAllMovement

	thumb_func_start sub_0205F5D4
sub_0205F5D4: ; 0x0205F5D4
	push {r3, lr}
	mov r1, #1
	bl sub_0205F190
	cmp r0, #0
	beq _0205F5E4
	mov r0, #1
	pop {r3, pc}
_0205F5E4:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205F5D4

	thumb_func_start sub_0205F5E8
sub_0205F5E8: ; 0x0205F5E8
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205F35C
	add r1, r4, #0
	bl sub_0205F190
	pop {r4, pc}
	thumb_func_end sub_0205F5E8

	thumb_func_start sub_0205F5F8
sub_0205F5F8: ; 0x0205F5F8
	push {r3, lr}
	cmp r1, #0
	bne _0205F606
	mov r1, #8
	bl sub_0205F17C
	pop {r3, pc}
_0205F606:
	mov r1, #8
	bl sub_0205F184
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F5F8

	thumb_func_start sub_0205F610
sub_0205F610: ; 0x0205F610
	push {r3, lr}
	mov r1, #8
	bl sub_0205F190
	cmp r0, #0
	bne _0205F620
	mov r0, #1
	pop {r3, pc}
_0205F620:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205F610

	thumb_func_start MapObject_IsInUse
MapObject_IsInUse: ; 0x0205F624
	ldr r3, _0205F62C ; =MapObject_TestBits
	mov r1, #1
	bx r3
	nop
_0205F62C: .word MapObject_TestBits
	thumb_func_end MapObject_IsInUse

	thumb_func_start MapObject_SingleMovementSetActive
MapObject_SingleMovementSetActive: ; 0x0205F630
	ldr r3, _0205F638 ; =MapObject_SetBits
	mov r1, #2
	bx r3
	nop
_0205F638: .word MapObject_SetBits
	thumb_func_end MapObject_SingleMovementSetActive

	thumb_func_start MapObject_SingleMovementSetInactive
MapObject_SingleMovementSetInactive: ; 0x0205F63C
	ldr r3, _0205F644 ; =MapObject_ClearBits
	mov r1, #2
	bx r3
	nop
_0205F644: .word MapObject_ClearBits
	thumb_func_end MapObject_SingleMovementSetInactive

	thumb_func_start MapObject_IsSingleMovementActive
MapObject_IsSingleMovementActive: ; 0x0205F648
	ldr r3, _0205F650 ; =MapObject_TestBits
	mov r1, #2
	bx r3
	nop
_0205F650: .word MapObject_TestBits
	thumb_func_end MapObject_IsSingleMovementActive

	thumb_func_start sub_0205F654
sub_0205F654: ; 0x0205F654
	ldr r3, _0205F65C ; =MapObject_SetBits
	mov r1, #4
	bx r3
	nop
_0205F65C: .word MapObject_SetBits
	thumb_func_end sub_0205F654

	thumb_func_start sub_0205F660
sub_0205F660: ; 0x0205F660
	ldr r3, _0205F668 ; =MapObject_ClearBits
	mov r1, #8
	bx r3
	nop
_0205F668: .word MapObject_ClearBits
	thumb_func_end sub_0205F660

	thumb_func_start sub_0205F66C
sub_0205F66C: ; 0x0205F66C
	ldr r3, _0205F674 ; =MapObject_SetBits
	mov r1, #1
	lsl r1, r1, #0xe
	bx r3
	.balign 4, 0
_0205F674: .word MapObject_SetBits
	thumb_func_end sub_0205F66C

	thumb_func_start sub_0205F678
sub_0205F678: ; 0x0205F678
	ldr r3, _0205F680 ; =MapObject_TestBits
	mov r1, #1
	lsl r1, r1, #0xe
	bx r3
	.balign 4, 0
_0205F680: .word MapObject_TestBits
	thumb_func_end sub_0205F678

	thumb_func_start sub_0205F684
sub_0205F684: ; 0x0205F684
	ldr r3, _0205F68C ; =MapObject_TestBits
	mov r1, #2
	lsl r1, r1, #8
	bx r3
	.balign 4, 0
_0205F68C: .word MapObject_TestBits
	thumb_func_end sub_0205F684

	thumb_func_start sub_0205F690
sub_0205F690: ; 0x0205F690
	push {r3, lr}
	cmp r1, #1
	bne _0205F6A0
	mov r1, #2
	lsl r1, r1, #8
	bl MapObject_SetBits
	pop {r3, pc}
_0205F6A0:
	mov r1, #2
	lsl r1, r1, #8
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F690

	thumb_func_start sub_0205F6AC
sub_0205F6AC: ; 0x0205F6AC
	push {r3, lr}
	cmp r1, #1
	bne _0205F6BC
	mov r1, #1
	lsl r1, r1, #0x12
	bl MapObject_ClearBits
	pop {r3, pc}
_0205F6BC:
	mov r1, #1
	lsl r1, r1, #0x12
	bl MapObject_SetBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F6AC

	thumb_func_start sub_0205F6C8
sub_0205F6C8: ; 0x0205F6C8
	push {r3, lr}
	mov r1, #2
	lsl r1, r1, #0x12
	bl MapObject_TestBits
	cmp r0, #1
	beq _0205F6DA
	mov r0, #1
	pop {r3, pc}
_0205F6DA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F6C8

	thumb_func_start sub_0205F6E0
sub_0205F6E0: ; 0x0205F6E0
	push {r3, lr}
	cmp r1, #1
	bne _0205F6F0
	mov r1, #2
	lsl r1, r1, #0x12
	bl MapObject_SetBits
	pop {r3, pc}
_0205F6F0:
	mov r1, #2
	lsl r1, r1, #0x12
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F6E0

	thumb_func_start MapObject_PauseMovement
MapObject_PauseMovement: ; 0x0205F6FC
	ldr r3, _0205F704 ; =MapObject_SetBits
	mov r1, #0x40
	bx r3
	nop
_0205F704: .word MapObject_SetBits
	thumb_func_end MapObject_PauseMovement

	thumb_func_start MapObject_UnpauseMovement
MapObject_UnpauseMovement: ; 0x0205F708
	ldr r3, _0205F710 ; =MapObject_ClearBits
	mov r1, #0x40
	bx r3
	nop
_0205F710: .word MapObject_ClearBits
	thumb_func_end MapObject_UnpauseMovement

	thumb_func_start sub_0205F714
sub_0205F714: ; 0x0205F714
	push {r4, lr}
	mov r1, #1
	lsl r1, r1, #0x1e
	add r4, r0, #0
	bl MapObject_TestBits
	cmp r0, #1
	bne _0205F728
	mov r0, #1
	pop {r4, pc}
_0205F728:
	add r0, r4, #0
	mov r1, #0x40
	bl MapObject_TestBits
	cmp r0, #1
	bne _0205F738
	mov r0, #1
	pop {r4, pc}
_0205F738:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_0205F714

	thumb_func_start sub_0205F73C
sub_0205F73C: ; 0x0205F73C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F35C
	bl sub_0205F5D4
	cmp r0, #0
	bne _0205F750
	mov r0, #0
	pop {r4, pc}
_0205F750:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xe
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F762
	mov r0, #1
	pop {r4, pc}
_0205F762:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205F73C

	thumb_func_start sub_0205F768
sub_0205F768: ; 0x0205F768
	push {r3, lr}
	cmp r1, #1
	bne _0205F778
	mov r1, #2
	lsl r1, r1, #0x16
	bl MapObject_SetBits
	pop {r3, pc}
_0205F778:
	mov r1, #2
	lsl r1, r1, #0x16
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F768

	thumb_func_start sub_0205F784
sub_0205F784: ; 0x0205F784
	push {r3, lr}
	mov r1, #2
	lsl r1, r1, #0x16
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F796
	mov r0, #1
	pop {r3, pc}
_0205F796:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F784

	thumb_func_start sub_0205F79C
sub_0205F79C: ; 0x0205F79C
	push {r3, lr}
	cmp r1, #1
	bne _0205F7AC
	mov r1, #1
	lsl r1, r1, #0xa
	bl MapObject_SetBits
	pop {r3, pc}
_0205F7AC:
	mov r1, #1
	lsl r1, r1, #0xa
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F79C

	thumb_func_start sub_0205F7B8
sub_0205F7B8: ; 0x0205F7B8
	push {r3, lr}
	cmp r1, #1
	bne _0205F7C8
	mov r1, #2
	lsl r1, r1, #0x18
	bl MapObject_SetBits
	pop {r3, pc}
_0205F7C8:
	mov r1, #2
	lsl r1, r1, #0x18
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F7B8

	thumb_func_start sub_0205F7D4
sub_0205F7D4: ; 0x0205F7D4
	push {r3, lr}
	mov r1, #2
	lsl r1, r1, #0x18
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F7E6
	mov r0, #1
	pop {r3, pc}
_0205F7E6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F7D4

	thumb_func_start sub_0205F7EC
sub_0205F7EC: ; 0x0205F7EC
	push {r3, lr}
	cmp r1, #1
	bne _0205F7FC
	mov r1, #1
	lsl r1, r1, #0x1a
	bl MapObject_SetBits
	pop {r3, pc}
_0205F7FC:
	mov r1, #1
	lsl r1, r1, #0x1a
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F7EC

	thumb_func_start sub_0205F808
sub_0205F808: ; 0x0205F808
	push {r3, lr}
	mov r1, #1
	lsl r1, r1, #0x1a
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F81A
	mov r0, #1
	pop {r3, pc}
_0205F81A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F808

	thumb_func_start sub_0205F820
sub_0205F820: ; 0x0205F820
	push {r3, lr}
	cmp r1, #1
	bne _0205F830
	mov r1, #1
	lsl r1, r1, #0x1c
	bl MapObject_SetBits
	pop {r3, pc}
_0205F830:
	mov r1, #1
	lsl r1, r1, #0x1c
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F820

	thumb_func_start sub_0205F83C
sub_0205F83C: ; 0x0205F83C
	push {r3, lr}
	mov r1, #1
	lsl r1, r1, #0x1c
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F84E
	mov r0, #1
	pop {r3, pc}
_0205F84E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F83C

	thumb_func_start sub_0205F854
sub_0205F854: ; 0x0205F854
	push {r3, lr}
	cmp r1, #1
	bne _0205F864
	mov r1, #1
	lsl r1, r1, #0x18
	bl MapObject_SetBits
	pop {r3, pc}
_0205F864:
	mov r1, #1
	lsl r1, r1, #0x18
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F854

	thumb_func_start sub_0205F870
sub_0205F870: ; 0x0205F870
	push {r3, lr}
	mov r1, #1
	lsl r1, r1, #0x18
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F882
	mov r0, #1
	pop {r3, pc}
_0205F882:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F870

	thumb_func_start sub_0205F888
sub_0205F888: ; 0x0205F888
	push {r3, lr}
	mov r1, #0x10
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F898
	mov r0, #1
	pop {r3, pc}
_0205F898:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205F888

	thumb_func_start sub_0205F89C
sub_0205F89C: ; 0x0205F89C
	push {r3, lr}
	cmp r1, #1
	bne _0205F8AC
	mov r1, #2
	lsl r1, r1, #0x1c
	bl MapObject_SetBits
	pop {r3, pc}
_0205F8AC:
	mov r1, #2
	lsl r1, r1, #0x1c
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F89C

	thumb_func_start sub_0205F8B8
sub_0205F8B8: ; 0x0205F8B8
	push {r3, lr}
	mov r1, #2
	lsl r1, r1, #0x1c
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F8CA
	mov r0, #1
	pop {r3, pc}
_0205F8CA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F8B8

	thumb_func_start sub_0205F8D0
sub_0205F8D0: ; 0x0205F8D0
	push {r3, lr}
	mov r1, #4
	bl sub_0205F240
	cmp r0, #0
	beq _0205F8E0
	mov r0, #1
	pop {r3, pc}
_0205F8E0:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205F8D0

	thumb_func_start MapObject_GetInitialX
MapObject_GetInitialX: ; 0x0205F8E4
	ldr r0, [r0, #0x4c]
	bx lr
	thumb_func_end MapObject_GetInitialX

	thumb_func_start MapObject_SetInitialX
MapObject_SetInitialX: ; 0x0205F8E8
	str r1, [r0, #0x4c]
	bx lr
	thumb_func_end MapObject_SetInitialX

	thumb_func_start MapObject_GetInitialHeight
MapObject_GetInitialHeight: ; 0x0205F8EC
	ldr r0, [r0, #0x50]
	bx lr
	thumb_func_end MapObject_GetInitialHeight

	thumb_func_start MapObject_SetInitialHeight
MapObject_SetInitialHeight: ; 0x0205F8F0
	str r1, [r0, #0x50]
	bx lr
	thumb_func_end MapObject_SetInitialHeight

	thumb_func_start MapObject_GetInitialY
MapObject_GetInitialY: ; 0x0205F8F4
	ldr r0, [r0, #0x54]
	bx lr
	thumb_func_end MapObject_GetInitialY

	thumb_func_start MapObject_SetInitialY
MapObject_SetInitialY: ; 0x0205F8F8
	str r1, [r0, #0x54]
	bx lr
	thumb_func_end MapObject_SetInitialY

	thumb_func_start MapObject_GetPrevX
MapObject_GetPrevX: ; 0x0205F8FC
	ldr r0, [r0, #0x58]
	bx lr
	thumb_func_end MapObject_GetPrevX

	thumb_func_start MapObject_SetPrevX
MapObject_SetPrevX: ; 0x0205F900
	str r1, [r0, #0x58]
	bx lr
	thumb_func_end MapObject_SetPrevX

	thumb_func_start MapObject_GetPrevHeight
MapObject_GetPrevHeight: ; 0x0205F904
	ldr r0, [r0, #0x5c]
	bx lr
	thumb_func_end MapObject_GetPrevHeight

	thumb_func_start MapObject_SetPrevHeight
MapObject_SetPrevHeight: ; 0x0205F908
	str r1, [r0, #0x5c]
	bx lr
	thumb_func_end MapObject_SetPrevHeight

	thumb_func_start MapObject_GetPrevY
MapObject_GetPrevY: ; 0x0205F90C
	ldr r0, [r0, #0x60]
	bx lr
	thumb_func_end MapObject_GetPrevY

	thumb_func_start MapObject_SetPrevY
MapObject_SetPrevY: ; 0x0205F910
	str r1, [r0, #0x60]
	bx lr
	thumb_func_end MapObject_SetPrevY

	thumb_func_start MapObject_GetCurrentX
MapObject_GetCurrentX: ; 0x0205F914
	ldr r0, [r0, #0x64]
	bx lr
	thumb_func_end MapObject_GetCurrentX

	thumb_func_start MapObject_SetCurrentX
MapObject_SetCurrentX: ; 0x0205F918
	str r1, [r0, #0x64]
	bx lr
	thumb_func_end MapObject_SetCurrentX

	thumb_func_start MapObject_AddCurrentX
MapObject_AddCurrentX: ; 0x0205F91C
	ldr r2, [r0, #0x64]
	add r1, r2, r1
	str r1, [r0, #0x64]
	bx lr
	thumb_func_end MapObject_AddCurrentX

	thumb_func_start MapObject_GetCurrentHeight
MapObject_GetCurrentHeight: ; 0x0205F924
	ldr r0, [r0, #0x68]
	bx lr
	thumb_func_end MapObject_GetCurrentHeight

	thumb_func_start MapObject_SetCurrentHeight
MapObject_SetCurrentHeight: ; 0x0205F928
	str r1, [r0, #0x68]
	bx lr
	thumb_func_end MapObject_SetCurrentHeight

	thumb_func_start MapObject_AddCurrentHeight
MapObject_AddCurrentHeight: ; 0x0205F92C
	ldr r2, [r0, #0x68]
	add r1, r2, r1
	str r1, [r0, #0x68]
	bx lr
	thumb_func_end MapObject_AddCurrentHeight

	thumb_func_start MapObject_GetCurrentY
MapObject_GetCurrentY: ; 0x0205F934
	ldr r0, [r0, #0x6c]
	bx lr
	thumb_func_end MapObject_GetCurrentY

	thumb_func_start MapObject_SetCurrentY
MapObject_SetCurrentY: ; 0x0205F938
	str r1, [r0, #0x6c]
	bx lr
	thumb_func_end MapObject_SetCurrentY

	thumb_func_start MapObject_AddCurrentY
MapObject_AddCurrentY: ; 0x0205F93C
	ldr r2, [r0, #0x6c]
	add r1, r2, r1
	str r1, [r0, #0x6c]
	bx lr
	thumb_func_end MapObject_AddCurrentY

	thumb_func_start MapObject_GetPositionVec
MapObject_GetPositionVec: ; 0x0205F944
	add r2, r0, #0
	add r2, #0x70
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end MapObject_GetPositionVec

	thumb_func_start MapObject_SetPositionVec
MapObject_SetPositionVec: ; 0x0205F954
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x70
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end MapObject_SetPositionVec

	thumb_func_start MapObject_GetPositionVecPtr
MapObject_GetPositionVecPtr: ; 0x0205F964
	add r0, #0x70
	bx lr
	thumb_func_end MapObject_GetPositionVecPtr

	thumb_func_start MapObject_GetPosVecYCoord
MapObject_GetPosVecYCoord: ; 0x0205F968
	ldr r0, [r0, #0x74]
	bx lr
	thumb_func_end MapObject_GetPosVecYCoord

	thumb_func_start MapObject_GetFacingVec
MapObject_GetFacingVec: ; 0x0205F96C
	add r2, r0, #0
	add r2, #0x7c
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end MapObject_GetFacingVec

	thumb_func_start MapObject_SetFacingVec
MapObject_SetFacingVec: ; 0x0205F97C
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x7c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end MapObject_SetFacingVec

	thumb_func_start MapObject_GetFacingVecPtr
MapObject_GetFacingVecPtr: ; 0x0205F98C
	add r0, #0x7c
	bx lr
	thumb_func_end MapObject_GetFacingVecPtr

	thumb_func_start sub_0205F990
sub_0205F990: ; 0x0205F990
	add r2, r0, #0
	add r2, #0x88
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end sub_0205F990

	thumb_func_start sub_0205F9A0
sub_0205F9A0: ; 0x0205F9A0
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x88
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_0205F9A0

	thumb_func_start sub_0205F9B0
sub_0205F9B0: ; 0x0205F9B0
	add r2, r0, #0
	add r2, #0x94
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end sub_0205F9B0

	thumb_func_start sub_0205F9C0
sub_0205F9C0: ; 0x0205F9C0
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x94
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_0205F9C0

	thumb_func_start sub_0205F9D0
sub_0205F9D0: ; 0x0205F9D0
	push {r3, lr}
	bl MapObject_GetPosVecYCoord
	asr r1, r0, #3
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F9D0

	thumb_func_start ObjectEventTemplate_SetID
ObjectEventTemplate_SetID: ; 0x0205F9E4
	strh r1, [r0]
	bx lr
	thumb_func_end ObjectEventTemplate_SetID

	thumb_func_start ObjectEventTemplate_GetID
ObjectEventTemplate_GetID: ; 0x0205F9E8
	ldrh r0, [r0]
	bx lr
	thumb_func_end ObjectEventTemplate_GetID

	thumb_func_start ObjectEventTemplate_SetSprite
ObjectEventTemplate_SetSprite: ; 0x0205F9EC
	strh r1, [r0, #2]
	bx lr
	thumb_func_end ObjectEventTemplate_SetSprite

	thumb_func_start ObjectEventTemplate_GetSprite
ObjectEventTemplate_GetSprite: ; 0x0205F9F0
	ldrh r0, [r0, #2]
	bx lr
	thumb_func_end ObjectEventTemplate_GetSprite

	thumb_func_start ObjectEventTemplate_SetMovement
ObjectEventTemplate_SetMovement: ; 0x0205F9F4
	strh r1, [r0, #4]
	bx lr
	thumb_func_end ObjectEventTemplate_SetMovement

	thumb_func_start ObjectEventTemplate_GetMovement
ObjectEventTemplate_GetMovement: ; 0x0205F9F8
	ldrh r0, [r0, #4]
	bx lr
	thumb_func_end ObjectEventTemplate_GetMovement

	thumb_func_start ObjectEventTemplate_SetType
ObjectEventTemplate_SetType: ; 0x0205F9FC
	strh r1, [r0, #6]
	bx lr
	thumb_func_end ObjectEventTemplate_SetType

	thumb_func_start ObjectEventTemplate_GetType
ObjectEventTemplate_GetType: ; 0x0205FA00
	ldrh r0, [r0, #6]
	bx lr
	thumb_func_end ObjectEventTemplate_GetType

	thumb_func_start ObjectEventTemplate_SetFlagID
ObjectEventTemplate_SetFlagID: ; 0x0205FA04
	strh r1, [r0, #8]
	bx lr
	thumb_func_end ObjectEventTemplate_SetFlagID

	thumb_func_start ObjectEventTemplate_GetFlagID
ObjectEventTemplate_GetFlagID: ; 0x0205FA08
	ldrh r0, [r0, #8]
	bx lr
	thumb_func_end ObjectEventTemplate_GetFlagID

	thumb_func_start ObjectEventTemplate_SetScript
ObjectEventTemplate_SetScript: ; 0x0205FA0C
	strh r1, [r0, #0xa]
	bx lr
	thumb_func_end ObjectEventTemplate_SetScript

	thumb_func_start ObjectEventTemplate_GetScript
ObjectEventTemplate_GetScript: ; 0x0205FA10
	ldrh r0, [r0, #0xa]
	bx lr
	thumb_func_end ObjectEventTemplate_GetScript

	thumb_func_start ObjectEventTemplate_SetFacing
ObjectEventTemplate_SetFacing: ; 0x0205FA14
	strh r1, [r0, #0xc]
	bx lr
	thumb_func_end ObjectEventTemplate_SetFacing

	thumb_func_start ObjectEventTemplate_GetFacing
ObjectEventTemplate_GetFacing: ; 0x0205FA18
	mov r1, #0xc
	ldrsh r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ObjectEventTemplate_GetFacing

	thumb_func_start ObjectEventTemplate_SetParam
ObjectEventTemplate_SetParam: ; 0x0205FA20
	push {r3, lr}
	cmp r2, #0
	beq _0205FA30
	cmp r2, #1
	beq _0205FA34
	cmp r2, #2
	beq _0205FA38
	b _0205FA3C
_0205FA30:
	strh r1, [r0, #0xe]
	pop {r3, pc}
_0205FA34:
	strh r1, [r0, #0x10]
	pop {r3, pc}
_0205FA38:
	strh r1, [r0, #0x12]
	pop {r3, pc}
_0205FA3C:
	bl GF_AssertFail
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ObjectEventTemplate_SetParam

	thumb_func_start ObjectEventTemplate_GetParam
ObjectEventTemplate_GetParam: ; 0x0205FA44
	push {r3, lr}
	cmp r1, #0
	beq _0205FA54
	cmp r1, #1
	beq _0205FA58
	cmp r1, #2
	beq _0205FA5C
	b _0205FA60
_0205FA54:
	ldrh r0, [r0, #0xe]
	pop {r3, pc}
_0205FA58:
	ldrh r0, [r0, #0x10]
	pop {r3, pc}
_0205FA5C:
	ldrh r0, [r0, #0x12]
	pop {r3, pc}
_0205FA60:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ObjectEventTemplate_GetParam

	thumb_func_start ObjectEventTemplate_SetXRange
ObjectEventTemplate_SetXRange: ; 0x0205FA68
	strh r1, [r0, #0x14]
	bx lr
	thumb_func_end ObjectEventTemplate_SetXRange

	thumb_func_start ObjectEventTemplate_GetXRange
ObjectEventTemplate_GetXRange: ; 0x0205FA6C
	mov r1, #0x14
	ldrsh r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ObjectEventTemplate_GetXRange

	thumb_func_start ObjectEventTemplate_SetYRange
ObjectEventTemplate_SetYRange: ; 0x0205FA74
	strh r1, [r0, #0x16]
	bx lr
	thumb_func_end ObjectEventTemplate_SetYRange

	thumb_func_start ObjectEventTemplate_GetYRange
ObjectEventTemplate_GetYRange: ; 0x0205FA78
	mov r1, #0x16
	ldrsh r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ObjectEventTemplate_GetYRange

	thumb_func_start ObjectEventTemplate_SetXCoord
ObjectEventTemplate_SetXCoord: ; 0x0205FA80
	strh r1, [r0, #0x18]
	bx lr
	thumb_func_end ObjectEventTemplate_SetXCoord

	thumb_func_start ObjectEventTemplate_GetXCoord
ObjectEventTemplate_GetXCoord: ; 0x0205FA84
	ldrh r0, [r0, #0x18]
	bx lr
	thumb_func_end ObjectEventTemplate_GetXCoord

	thumb_func_start ObjectEventTemplate_SetHeight
ObjectEventTemplate_SetHeight: ; 0x0205FA88
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end ObjectEventTemplate_SetHeight

	thumb_func_start ObjectEventTemplate_GetHeight
ObjectEventTemplate_GetHeight: ; 0x0205FA8C
	ldr r0, [r0, #0x1c]
	bx lr
	thumb_func_end ObjectEventTemplate_GetHeight

	thumb_func_start ObjectEventTemplate_SetYCoord
ObjectEventTemplate_SetYCoord: ; 0x0205FA90
	strh r1, [r0, #0x1a]
	bx lr
	thumb_func_end ObjectEventTemplate_SetYCoord

	thumb_func_start ObjectEventTemplate_GetYCoord
ObjectEventTemplate_GetYCoord: ; 0x0205FA94
	ldrh r0, [r0, #0x1a]
	bx lr
	thumb_func_end ObjectEventTemplate_GetYCoord

	thumb_func_start sub_0205FA98
sub_0205FA98: ; 0x0205FA98
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	str r2, [sp]
	mov r4, #0
	add r5, r2, #0
_0205FAA4:
	add r0, r5, #0
	bl ObjectEventTemplate_ScriptIdIsFFFF
	cmp r0, #0
	bne _0205FAC0
	add r0, r5, #0
	bl ObjectEventTemplate_GetID
	cmp r6, r0
	bne _0205FAC0
	ldr r0, [sp]
	lsl r1, r4, #5
	add r0, r0, r1
	pop {r3, r4, r5, r6, r7, pc}
_0205FAC0:
	add r4, r4, #1
	add r5, #0x20
	cmp r4, r7
	blt _0205FAA4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205FA98

	thumb_func_start ObjectEventTemplate_ScriptIdIsFFFF
ObjectEventTemplate_ScriptIdIsFFFF: ; 0x0205FACC
	push {r3, lr}
	bl ObjectEventTemplate_GetScript
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, _0205FAE4 ; =0x0000FFFF
	cmp r1, r0
	bne _0205FAE0
	mov r0, #1
	pop {r3, pc}
_0205FAE0:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0205FAE4: .word 0x0000FFFF
	thumb_func_end ObjectEventTemplate_ScriptIdIsFFFF

	thumb_func_start ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF
ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF: ; 0x0205FAE8
	push {r4, lr}
	add r4, r0, #0
	bl ObjectEventTemplate_ScriptIdIsFFFF
	cmp r0, #1
	beq _0205FAF8
	bl GF_AssertFail
_0205FAF8:
	add r0, r4, #0
	bl ObjectEventTemplate_GetFlagID
	pop {r4, pc}
	thumb_func_end ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF

	thumb_func_start sub_0205FB00
sub_0205FB00: ; 0x0205FB00
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x39
	blo _0205FB0C
	bl GF_AssertFail
_0205FB0C:
	ldr r0, _0205FB14 ; =_020FD1F4
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_0205FB14: .word _020FD1F4
	thumb_func_end sub_0205FB00

	thumb_func_start sub_0205FB18
sub_0205FB18: ; 0x0205FB18
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_0205FB18

	thumb_func_start sub_0205FB1C
sub_0205FB1C: ; 0x0205FB1C
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end sub_0205FB1C

	thumb_func_start sub_0205FB20
sub_0205FB20: ; 0x0205FB20
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205FB20

	thumb_func_start sub_0205FB24
sub_0205FB24: ; 0x0205FB24
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_0205FB24

	thumb_func_start sub_0205FB28
sub_0205FB28: ; 0x0205FB28
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_0205FB28

	thumb_func_start sub_0205FB2C
sub_0205FB2C: ; 0x0205FB2C
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end sub_0205FB2C

	thumb_func_start sub_0205FB30
sub_0205FB30: ; 0x0205FB30
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205FB30

	thumb_func_start sub_0205FB34
sub_0205FB34: ; 0x0205FB34
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_0205FB34

	thumb_func_start sub_0205FB38
sub_0205FB38: ; 0x0205FB38
	push {r3, lr}
	bl GetObjectEventGfxInfoPtr
	cmp r0, #0
	bne _0205FB46
	mov r0, #0
	pop {r3, pc}
_0205FB46:
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1b
	lsl r1, r0, #2
	ldr r0, _0205FB54 ; =ov01_02209A38
	ldr r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0205FB54: .word ov01_02209A38
	thumb_func_end sub_0205FB38

	thumb_func_start sub_0205FB58
sub_0205FB58: ; 0x0205FB58
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	str r3, [sp]
	bl MapObjectMan_GetCount
	add r7, r0, #0
	add r0, r4, #0
	bl MapObjectMan_GetArray
	add r4, r0, #0
_0205FB70:
	add r0, r4, #0
	mov r1, #1
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205FBB2
	ldr r0, [sp]
	cmp r0, #0
	beq _0205FB9A
	add r0, r4, #0
	bl MapObject_GetPrevX
	cmp r5, r0
	bne _0205FB9A
	add r0, r4, #0
	bl MapObject_GetPrevY
	cmp r6, r0
	bne _0205FB9A
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205FB9A:
	add r0, r4, #0
	bl MapObject_GetCurrentX
	cmp r5, r0
	bne _0205FBB2
	add r0, r4, #0
	bl MapObject_GetCurrentY
	cmp r6, r0
	bne _0205FBB2
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205FBB2:
	mov r0, #0x4b
	lsl r0, r0, #2
	add r4, r4, r0
	sub r7, r7, #1
	bne _0205FB70
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205FB58

	thumb_func_start sub_0205FBC0
sub_0205FBC0: ; 0x0205FBC0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	ldr r1, [r4]
	add r6, r2, #0
	asr r2, r1, #4
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	add r5, r0, #0
	bl MapObject_SetCurrentX
	ldr r1, [r4, #4]
	add r0, r5, #0
	asr r2, r1, #3
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	bl MapObject_SetCurrentHeight
	ldr r1, [r4, #8]
	add r0, r5, #0
	asr r2, r1, #4
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	bl MapObject_SetCurrentY
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_SetPositionVec
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	add r1, r6, #0
	bl MapObject_ForceSetFacingDirection
	add r0, r5, #0
	bl MapObject_ClearHeldMovement
	add r0, r5, #0
	mov r1, #4
	bl MapObject_SetBits
	add r0, r5, #0
	mov r1, #0xa
	bl MapObject_ClearBits
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205FBC0

	thumb_func_start sub_0205FC2C
sub_0205FC2C: ; 0x0205FC2C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r2, #0
	mov r2, #2
	add r6, r3, #0
	lsl r3, r1, #0x10
	lsl r2, r2, #0xe
	add r2, r3, r2
	add r5, r0, #0
	str r2, [sp]
	bl MapObject_SetCurrentX
	lsl r0, r4, #0xf
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_SetCurrentHeight
	mov r0, #2
	lsl r1, r6, #0x10
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r6, #0
	bl MapObject_SetCurrentY
	add r0, r5, #0
	add r1, sp, #0
	bl MapObject_SetPositionVec
	add r0, r5, #0
	bl sub_02060F78
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl MapObject_ForceSetFacingDirection
	add r0, r5, #0
	mov r1, #4
	bl MapObject_SetBits
	add r0, r5, #0
	mov r1, #0xa
	bl MapObject_ClearBits
	add r0, r5, #0
	bl MapObject_ClearHeldMovement
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205FC2C

	thumb_func_start sub_0205FC94
sub_0205FC94: ; 0x0205FC94
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F444
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_SetMovement
	add r0, r5, #0
	bl sub_0205ECE0
	add r0, r5, #0
	bl sub_0205FD20
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205FC94

	thumb_func_start sub_0205FCB4
sub_0205FCB4: ; 0x0205FCB4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCB4

	thumb_func_start sub_0205FCB8
sub_0205FCB8: ; 0x0205FCB8
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCB8

	thumb_func_start sub_0205FCBC
sub_0205FCBC: ; 0x0205FCBC
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCBC

	thumb_func_start sub_0205FCC0
sub_0205FCC0: ; 0x0205FCC0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCC0

	thumb_func_start sub_0205FCC4
sub_0205FCC4: ; 0x0205FCC4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCC4

	thumb_func_start sub_0205FCC8
sub_0205FCC8: ; 0x0205FCC8
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCC8

	thumb_func_start sub_0205FCCC
sub_0205FCCC: ; 0x0205FCCC
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCCC

	thumb_func_start sub_0205FCD0
sub_0205FCD0: ; 0x0205FCD0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCD0

	thumb_func_start sub_0205FCD4
sub_0205FCD4: ; 0x0205FCD4
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_GetGfxID
	mov r1, #2
	lsl r1, r1, #0xc
	cmp r0, r1
	bne _0205FCE8
	ldr r0, _0205FCFC ; =ov01_0220724C
	b _0205FCEC
_0205FCE8:
	bl sub_0205FB38
_0205FCEC:
	bl sub_0205FB28
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205F47C
	pop {r4, pc}
	nop
_0205FCFC: .word ov01_0220724C
	thumb_func_end sub_0205FCD4

	thumb_func_start SaveMapObjects_SearchSpriteId
SaveMapObjects_SearchSpriteId: ; 0x0205FD00
	push {r3, r4}
	cmp r1, #0
	beq _0205FD1A
	mov r3, #1
_0205FD08:
	ldr r4, [r0]
	tst r4, r3
	beq _0205FD14
	ldrh r4, [r0, #0x12]
	cmp r4, r2
	beq _0205FD1C
_0205FD14:
	add r0, #0x50
	sub r1, r1, #1
	bne _0205FD08
_0205FD1A:
	mov r0, #0
_0205FD1C:
	pop {r3, r4}
	bx lr
	thumb_func_end SaveMapObjects_SearchSpriteId
