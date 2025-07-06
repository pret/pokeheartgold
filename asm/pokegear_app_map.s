#include "constants/species.h"
#include "constants/sndseq.h"
#include "constants/maps.h"
#include "constants/flypoints.h"
#include "constants/items.h"
#include "constants/phone_contacts.h"
#include "constants/flags.h"
#include "msgdata/msg/msg_0271.h"
#include "msgdata/msg/msg_0416.h"
#include "msgdata/msg/msg_0411.h"
#include "msgdata/msg/msg_0640.h"
#include "msgdata/msg/msg_0664.h"
	.include "asm/macros.inc"
	.include "overlay_101.inc"
	.include "global.inc"

	.text

	.extern ov101_021E9270
	.extern ov101_021E990C
	.extern ov101_021E9B70
	.extern ov101_021EA4D0
	.extern ov101_021EA608
	.extern ov101_021EA794
	.extern ov101_021EA8A8
	.extern ov101_021EAD90
	.extern ov101_021EAF40
	.extern ov101_021EB1E0
	.extern ov101_021EB2FC
	.extern ov101_021EB338
	.extern ov101_021EB4C4

	thumb_func_start ov101_021EDFF8
ov101_021EDFF8: ; 0x021EDFF8
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x90
	bl NARC_New
	add r4, r0, #0
	mov r0, #0x42
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0xa
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0x40
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0x44
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0xc
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0x3f
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0x3e
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	mov r0, #0x41
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	add r2, r4, #0
	mov r3, #0x90
	bl sub_0208820C
	ldr r0, [r5]
	mov r3, #0x5b
	lsl r3, r3, #2
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x45
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x55
	lsl r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	add r3, #0x1c
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x56
	lsl r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	add r3, #0x1c
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x57
	lsl r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	add r3, #0x1c
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x43
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r4, #0
	bl NARC_Delete
	ldr r0, [r5, #0x10]
	mov r1, #4
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r1, [r5]
	mov r0, #4
	bl FontID_Alloc
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov101_021EDFF8

	thumb_func_start ov101_021EE190
ov101_021EE190: ; 0x021EE190
	push {r4, lr}
	add r4, r0, #0
	mov r0, #4
	bl FontID_Release
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov101_021EE190

	thumb_func_start ov101_021EE1C4
ov101_021EE1C4: ; 0x021EE1C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r4, _021EE20C ; =ov101_021F7F54
	mov r6, #0
	add r5, r7, r0
_021EE1D4:
	ldrb r0, [r4, #2]
	add r1, r5, #0
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	ldrb r0, [r4, #4]
	str r0, [sp, #8]
	ldrb r0, [r4, #5]
	str r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	str r0, [sp, #0x10]
	ldr r0, [r7, #0x10]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r0, #0x74]
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #9
	blt _021EE1D4
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE20C: .word ov101_021F7F54
	thumb_func_end ov101_021EE1C4

	thumb_func_start ov101_021EE210
ov101_021EE210: ; 0x021EE210
	push {r3, r4, r5, lr}
	mov r1, #0x61
	lsl r1, r1, #2
	mov r4, #0
	add r5, r0, r1
_021EE21A:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #9
	blt _021EE21A
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021EE210

	thumb_func_start ov101_021EE230
ov101_021EE230: ; 0x021EE230
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x1b
	add r2, r1, #0
	ldr r3, [r4]
	mov r0, #0
	add r2, #0xf6
	bl NewMsgDataFromNarc
	add r1, r4, #0
	add r1, #0x88
	str r0, [r1]
	ldr r2, [r4]
	mov r0, #2
	mov r1, #0x5b
	bl MessageFormat_New_Custom
	add r1, r4, #0
	add r1, #0x8c
	str r0, [r1]
	ldr r1, [r4]
	mov r0, #0x5b
	bl String_New
	add r1, r4, #0
	add r1, #0x90
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #1
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0x9c
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xa0
	str r0, [r1]
	ldr r1, [r4]
	mov r0, #0x28
	bl String_New
	add r1, r4, #0
	add r1, #0xa4
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #4
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xa8
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #5
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xac
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #6
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xb0
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #3
	bl NewString_ReadMsgData
	add r1, r4, #0
	add r1, #0xb4
	str r0, [r1]
	mov r0, #2
	add r4, #0xb8
	strb r0, [r4]
	pop {r4, pc}
	thumb_func_end ov101_021EE230

	thumb_func_start ov101_021EE2E8
ov101_021EE2E8: ; 0x021EE2E8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xb4
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl String_Delete
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl MessageFormat_Delete
	add r4, #0x88
	ldr r0, [r4]
	bl DestroyMsgData
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EE2E8

	thumb_func_start ov101_021EE350
ov101_021EE350: ; 0x021EE350
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #2
	bl ListMenuItems_New
	add r1, r5, #0
	add r1, #0xc0
	str r0, [r1]
	mov r4, #0
_021EE364:
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xc0
	add r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r4, #7
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
	add r4, r4, #1
	cmp r4, #2
	blt _021EE364
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021EE350

	thumb_func_start ov101_021EE380
ov101_021EE380: ; 0x021EE380
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl ListMenuItems_Delete
	mov r0, #0
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov101_021EE380

	thumb_func_start ov101_021EE394
ov101_021EE394: ; 0x021EE394
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl ov100_021E6914
	ldr r0, [r4, #0x10]
	mov r1, #2
	bl PokegearApp_CreateSpriteManager
	ldr r1, [r4]
	mov r0, #0x2a
	bl ov100_021E6E20
	add r1, r4, #0
	add r1, #0x84
	str r0, [r1]
	ldr r0, [r4, #0x10]
	add r0, #0x8c
	ldr r0, [r0]
	bl SpriteSystem_GetRenderer
	mov r2, #0xf
	mov r1, #0
	lsl r2, r2, #0x10
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r1, [r4, #0x10]
	ldr r0, [r4]
	ldr r1, [r1, #0x78]
	bl TouchscreenListMenuSpawner_Create
	add r4, #0xbc
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov101_021EE394

	thumb_func_start ov101_021EE3D8
ov101_021EE3D8: ; 0x021EE3D8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xbc
	ldr r0, [r0]
	bl TouchscreenListMenuSpawner_Destroy
	ldr r0, [r4, #0x10]
	add r0, #0x8c
	ldr r0, [r0]
	bl SpriteSystem_GetRenderer
	mov r2, #3
	mov r1, #0
	lsl r2, r2, #0x12
	bl G2dRenderer_SetSubSurfaceCoords
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E58
	ldr r0, [r4, #0x10]
	bl PokegearApp_DestroySpriteManager
	ldr r0, [r4, #0x10]
	bl ov100_021E6950
	pop {r4, pc}
	thumb_func_end ov101_021EE3D8

	thumb_func_start ov101_021EE410
ov101_021EE410: ; 0x021EE410
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r6, #0
	ldr r0, [r0, #8]
	mov r7, #0x15
	str r0, [sp]
	add r4, r0, #0
_021EE422:
	ldr r1, [r5, #0x10]
	ldr r2, _021EE64C ; =ov101_021F807C
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	lsr r2, r6, #0x1f
	lsl r3, r6, #0x1f
	sub r3, r3, r2
	mov r1, #0x1f
	ror r3, r1
	add r3, r2, r3
	add r2, r6, r2
	mov r1, #0x68
	mul r1, r3
	asr r2, r2, #1
	add r3, r2, #0
	mul r3, r7
	add r1, #0x20
	add r3, #0xcb
	lsl r1, r1, #0x10
	lsl r2, r3, #0x10
	ldr r0, [r4, #0x20]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl thunk_Sprite_SetPriority
	add r6, r6, #1
	add r4, #0x28
	cmp r6, #4
	blt _021EE422
	ldr r1, [r5, #0x10]
	ldr r2, _021EE650 ; =ov101_021F80A4
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	ldr r0, [sp]
	mov r1, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl thunk_Sprite_SetPriority
	ldr r1, [r5, #0x10]
	ldr r2, _021EE654 ; =ov101_021F80CC
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	ldr r1, [r5, #0x10]
	ldr r2, _021EE658 ; =ov101_021F80F4
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	mov r7, #0
	ldr r6, [sp]
	add r4, r7, #0
_021EE4E6:
	ldr r1, [r5, #0x10]
	ldr r2, _021EE65C ; =ov101_021F811C
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	cmp r7, #0
	ble _021EE51A
	add r0, r4, #0
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021EE528
_021EE51A:
	add r0, r4, #0
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021EE528:
	bl _ffix
	add r1, r0, #0
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl Sprite_UpdateAnim
	mov r0, #1
	lsl r0, r0, #0xc
	add r7, r7, #1
	add r4, r4, r0
	add r6, #0x28
	cmp r7, #4
	blt _021EE4E6
	ldr r7, _021EE64C ; =ov101_021F807C
	mov r6, #0
_021EE54A:
	ldr r1, [r5, #0x10]
	add r3, r6, #5
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	mov r2, #0x28
	mul r2, r3
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r7, r2
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	mov r1, #0x28
	mul r1, r0
	ldr r0, [sp]
	add r4, r0, r1
	ldr r0, [r4, #0x20]
	add r1, r4, #4
	add r2, r4, #6
	bl Sprite_GetPositionXY
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl thunk_Sprite_SetPriority
	ldr r0, [r4, #0x20]
	mov r1, #1
	bl Sprite_SetAnimActiveFlag
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
	add r6, r6, #1
	cmp r6, #4
	blt _021EE54A
	mov r6, #0
	mov r7, #0x28
_021EE5A2:
	ldr r1, [r5, #0x10]
	ldr r2, _021EE660 ; =ov101_021F81E4
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6EC4
	add r1, r0, #0
	ldr r0, [sp]
	mul r1, r7
	add r4, r0, r1
	ldr r0, [r4, #0x20]
	add r1, r4, #4
	add r2, r4, #6
	bl Sprite_GetPositionXY
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Sprite_SetAnimActiveFlag
	add r6, r6, #1
	cmp r6, #0x1b
	blt _021EE5A2
	mov r4, #0
	mov r7, #0x28
_021EE5EC:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	add r1, r0, #0
	ldr r0, [sp]
	mul r1, r7
	add r6, r0, r1
	ldr r0, [r6, #0x20]
	add r1, r6, #4
	add r2, r6, #6
	bl Sprite_GetPositionXY
	ldr r0, [r6, #0x20]
	mov r1, #0
	bl Sprite_SetDrawFlag
	add r4, r4, #1
	cmp r4, #0xb
	blt _021EE5EC
	ldr r0, [sp]
	mov r1, #1
	add r0, #0xe8
	ldr r0, [r0]
	bl Sprite_SetAnimActiveFlag
	mov r1, #0x11
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #0
	bl Sprite_SetAnimActiveFlag
	mov r1, #0x11
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [r5, #0x10]
	ldr r1, [r1, #0x20]
	ldrb r1, [r1, #7]
	bl Sprite_SetAnimationFrame
	ldr r0, [sp]
	mov r1, #2
	add r0, #0xe8
	str r0, [sp]
	ldr r0, [r0]
	bl Sprite_SetAffineOverwriteMode
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE64C: .word ov101_021F807C
_021EE650: .word ov101_021F80A4
_021EE654: .word ov101_021F80CC
_021EE658: .word ov101_021F80F4
_021EE65C: .word ov101_021F811C
_021EE660: .word ov101_021F81E4
	thumb_func_end ov101_021EE410

	thumb_func_start ov101_021EE664
ov101_021EE664: ; 0x021EE664
	ldr r3, _021EE66C ; =ov100_021E6EF4
	add r0, #0x84
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_021EE66C: .word ov100_021E6EF4
	thumb_func_end ov101_021EE664

	thumb_func_start ov101_021EE670
ov101_021EE670: ; 0x021EE670
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	mov r1, #4
	ldr r0, [r0, #8]
	mov r2, #8
	str r0, [sp, #0x1c]
	mov r0, #6
	str r0, [sp]
	ldr r0, _021EE8D8 ; =0x04000050
	mov r3, #0xa
	bl G2x_SetBlendAlpha_
	mov r4, #0
	mov r6, #3
	add r7, r4, #0
_021EE694:
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	mov r2, #0
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r2, r6, #0
	add r3, r7, #0
	bl BgSetPosTextAndCommit
	add r4, r4, #1
	cmp r4, #3
	blt _021EE694
	ldr r1, _021EE8DC ; =ov101_021EB338
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x5c]
	ldr r1, _021EE8E0 ; =ov101_021EB2FC
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x60]
	add r0, r5, #0
	bl ov101_021E990C
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0xc8
	bl ov101_021E9B70
	mov r0, #0x5e
	lsl r0, r0, #2
	mov r2, #0
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0x18
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	add r3, r2, #0
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #1
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	add r0, r5, #0
	bl ov101_021EAF40
	mov r0, #0
	mvn r0, r0
	strb r0, [r5, #0xf]
	ldrb r0, [r5, #0xd]
	cmp r0, #2
	bne _021EE7BC
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #6
	add r2, r0, #0
	str r1, [sp, #4]
	add r2, #0xc
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	mov r3, #8
	str r3, [sp, #0x10]
	ldrh r4, [r0]
	lsl r4, r4, #0x15
	lsr r4, r4, #0x18
	str r4, [sp, #0x14]
	ldrh r0, [r0, #2]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	mov r3, #0x46
	lsl r3, r3, #2
	add r2, r3, #0
	add r1, r5, r3
	sub r2, #8
	sub r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov101_021EA794
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EAD90
	ldr r0, [r5, #0x10]
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r0, #0x74]
	mov r1, #5
	sub r3, #0x54
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r0, #0x74]
	mov r1, #6
	sub r3, #0x54
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0x10]
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r0, #0x74]
	mov r1, #7
	sub r3, #0x54
	bl BgSetPosTextAndCommit
	b _021EE82A
_021EE7BC:
	add r0, r5, #0
	mov r1, #0
	bl ov101_021EA4D0
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0x10
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	mov r3, #8
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #6
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	mov r3, #0x46
	lsl r3, r3, #2
	add r2, r3, #0
	add r1, r5, r3
	sub r2, #8
	sub r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov101_021EA8A8
	add r0, r5, #0
	mov r1, #0
	bl ov101_021EAD90
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl ov101_021EB4C4
_021EE82A:
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EB1E0
	add r0, r5, #0
	mov r1, #1
	bl ov101_021EA608
	add r1, r5, #0
	add r1, #0xb0
	ldr r1, [r1]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	mov r0, #0x30
	sub r1, r0, r1
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0xf
	mov r1, #0
	asr r3, r0, #0x10
	str r1, [sp]
	add r2, r5, #0
	ldr r0, _021EE8E4 ; =0x00030100
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #0x81
	add r2, #0xb0
	lsl r0, r0, #2
	ldr r2, [r2]
	add r0, r5, r0
	mov r1, #4
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [sp, #0x1c]
	mov r1, #1
	add r0, #0xe8
	str r0, [sp, #0x1c]
	ldr r0, [r0]
	bl Sprite_SetDrawFlag
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov100_021E6E84
	ldr r0, [r5, #0x10]
	mov r1, #4
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #5
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #7
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #0
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x10]
	mov r1, #3
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE8D8: .word 0x04000050
_021EE8DC: .word ov101_021EB338
_021EE8E0: .word ov101_021EB2FC
_021EE8E4: .word 0x00030100
	thumb_func_end ov101_021EE670

    .rodata

	.global ov101_021F7F44
ov101_021F7F44: ; 0x021F7F44
	.word 0x00000001
	.word 0x00000005
	.word 0x00000000
	.word 0x00000000

	.global ov101_021F7F54
ov101_021F7F54: ; 0x021F7F54
	.byte 0x05, 0x01, 0x08, 0x05, 0x03, 0x01
	.short 0x3F0
	.byte 0x05, 0x03, 0x0B, 0x0C, 0x02, 0x01
	.short 0x3D8
	.byte 0x05, 0x01, 0x0E, 0x1C, 0x04, 0x01
	.short 0x368
	.byte 0x05, 0x05, 0x12, 0x0B, 0x05, 0x01
	.short 0x331
	.byte 0x05, 0x12, 0x12, 0x0B, 0x05, 0x01
	.short 0x2FA
	.byte 0x05, 0x05, 0x14, 0x0B, 0x02, 0x01
	.short 0x2E4
	.byte 0x05, 0x12, 0x16, 0x0B, 0x02, 0x01
	.short 0x2CE
	.byte 0x00, 0x00, 0x15, 0x19, 0x02, 0x0A
	.short 0x05C
	.byte 0x00, 0x19, 0x15, 0x06, 0x02, 0x0A
	.short 0x08E

	.global ov101_021F7F9C
ov101_021F7F9C: ; 0x021F7F9C
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1F, 0x02, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00002000, 0x00000000
	.byte 0x04, 0x01, 0x1A, 0x04, 0x00, 0x02, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00002000, 0x00000000
	.byte 0x04, 0x01, 0x16, 0x04, 0x00, 0x03, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1F, 0x02, 0x00, 0x03, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00
	.word 0x00000000
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1C, 0x04, 0x00, 0x02, 0x00, 0x00
	.word 0x00000000

	.global ov101_021F807C
ov101_021F807C: ; 0x021F807C
	.word 0x00000000
	.short 0x0020, 0x0060, 0x0000, 0x0000
	.word 0x00000000, 0x00000000
	.word 0x00000002, 0x00000000, 0x00000000, 0x00000000
	.word 0x00000000

	.global ov101_021F80A4
ov101_021F80A4: ; 0x021F80A4
	.word 0x00000000
	.short 0x0010, 0x0090, 0x0000, 0x0001
	.word 0x00000000, 0x00000000, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.global ov101_021F80CC
ov101_021F80CC: ; 0x021F80CC
	.word 0x00000001
	.short 0x0020, 0x0080, 0x0000, 0x0000
	.word 0x00000001, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.global ov101_021F80F4
ov101_021F80F4: ; 0x021F80F4
	.word 0x00000001
	.short 0x0020, 0x0060, 0x0000, 0x0001
	.word 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.global ov101_021F811C
ov101_021F811C: ; 0x021F811C
	.word 0x00000001
	.short 0x0020, 0x0060, 0x0000, 0x0002
	.word 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000
	.word 0x00000001
	.short 0x0000, 0x0000, 0x0000, 0x0005
	.word 0x00000001, 0x00000002, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000
	.word 0x00000001
	.short 0x0000, 0x0000, 0x0000, 0x0006
	.word 0x00000001, 0x00000002, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000
	.word 0x00000001
	.short 0x0000, 0x0000, 0x0000, 0x0007
	.word 0x00000001, 0x00000002, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000
	.word 0x00000001
	.short 0x0000, 0x0000, 0x0000, 0x0008
	.word 0x00000001, 0x00000002, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.global ov101_021F81E4
ov101_021F81E4: ; 0x021F81E4
	.word 0x00000001
	.short 0x0000, 0x0000, 0x0000, 0x0009
	.word 0x00000003, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000
