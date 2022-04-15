#include "constants/sndseq.h"
#include "constants/moves.h"
#include "constants/std_script.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "constants/maps.h"
#include "constants/mmodel.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021EB1E8
ov01_021EB1E8: ; 0x021EB1E8
	mov r1, #0x62
	mov r2, #1
	lsl r1, r1, #2
	str r2, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021EB1E8

	thumb_func_start ov01_021EB1F4
ov01_021EB1F4: ; 0x021EB1F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #4
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x18
	mov r0, #0
_021EB208:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _021EB208
	add r0, r5, #0
	bl ov01_021EB64C
	str r0, [r4]
	mov r1, #0
	str r1, [r4, #4]
	str r1, [r4, #8]
	mov r0, #6
	str r0, [r4, #0xc]
	str r1, [r4, #0x14]
	mov r0, #0xe
	str r0, [r4, #0x10]
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021EB1F4

	thumb_func_start ov01_021EB234
ov01_021EB234: ; 0x021EB234
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _021EB242
	bl DestroySysTask
_021EB242:
	add r0, r4, #0
	bl ov01_021EB68C
	add r2, r4, #0
	mov r1, #0x18
	mov r0, #0
_021EB24E:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _021EB24E
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EB234

	thumb_func_start ov01_021EB260
ov01_021EB260: ; 0x021EB260
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	cmp r0, #6
	beq _021EB270
	bl GF_AssertFail
_021EB270:
	cmp r4, #0xe
	blt _021EB278
	bl GF_AssertFail
_021EB278:
	ldr r2, [r5, #4]
	cmp r2, r4
	beq _021EB2B4
	ldr r0, [r5]
	mov r1, #8
	bl ov01_021EB700
	cmp r0, #0
	bne _021EB28E
	bl GF_AssertFail
_021EB28E:
	ldr r0, [r5]
	mov r1, #0
	add r2, r4, #0
	bl ov01_021EB700
	cmp r0, #0
	bne _021EB2A0
	bl GF_AssertFail
_021EB2A0:
	ldr r0, [r5]
	mov r1, #3
	add r2, r4, #0
	bl ov01_021EB700
	cmp r0, #0
	bne _021EB2B2
	bl GF_AssertFail
_021EB2B2:
	str r4, [r5, #4]
_021EB2B4:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021EB260

	thumb_func_start FieldWeatherUpdate_UsedFlash
FieldWeatherUpdate_UsedFlash: ; 0x021EB2B8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xe
	blt _021EB2C6
	bl GF_AssertFail
_021EB2C6:
	ldr r0, [r5, #0xc]
	cmp r0, #6
	beq _021EB2D2
	str r4, [r5, #0x10]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021EB2D2:
	ldr r0, [r5, #4]
	cmp r0, r4
	bne _021EB2DC
	mov r0, #1
	pop {r3, r4, r5, pc}
_021EB2DC:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _021EB2E6
	bl GF_AssertFail
_021EB2E6:
	str r4, [r5, #8]
	ldr r0, [r5, #4]
	add r1, r4, #0
	bl ov01_021EB4B4
	cmp r0, #0
	bne _021EB302
	ldr r0, _021EB314 ; =ov01_021EB320
	mov r2, #0
	add r1, r5, #0
	str r2, [r5, #0xc]
	bl CreateSysTask
	b _021EB30E
_021EB302:
	ldr r0, _021EB318 ; =ov01_021EB3F0
	mov r2, #0
	add r1, r5, #0
	str r2, [r5, #0xc]
	bl CreateSysTask
_021EB30E:
	str r0, [r5, #0x14]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EB314: .word ov01_021EB320
_021EB318: .word ov01_021EB3F0
	thumb_func_end FieldWeatherUpdate_UsedFlash

	thumb_func_start ov01_021EB31C
ov01_021EB31C: ; 0x021EB31C
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov01_021EB31C

	thumb_func_start ov01_021EB320
ov01_021EB320: ; 0x021EB320
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4, #0xc]
	cmp r1, #5
	bhi _021EB3EE
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021EB336: ; jump table
	.short _021EB342 - _021EB336 - 2 ; case 0
	.short _021EB35C - _021EB336 - 2 ; case 1
	.short _021EB382 - _021EB336 - 2 ; case 2
	.short _021EB39C - _021EB336 - 2 ; case 3
	.short _021EB3B0 - _021EB336 - 2 ; case 4
	.short _021EB3D2 - _021EB336 - 2 ; case 5
_021EB342:
	ldr r0, [r4]
	ldr r2, [r4, #4]
	mov r1, #5
	bl ov01_021EB700
	cmp r0, #0
	bne _021EB354
	bl GF_AssertFail
_021EB354:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r4, pc}
_021EB35C:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl ov01_021EB804
	cmp r0, #3
	beq _021EB3EE
	ldr r0, [r4]
	ldr r2, [r4, #4]
	mov r1, #8
	bl ov01_021EB700
	cmp r0, #0
	bne _021EB37A
	bl GF_AssertFail
_021EB37A:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r4, pc}
_021EB382:
	ldr r0, [r4]
	ldr r2, [r4, #8]
	mov r1, #1
	bl ov01_021EB700
	cmp r0, #0
	bne _021EB394
	bl GF_AssertFail
_021EB394:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r4, pc}
_021EB39C:
	ldr r0, [r4]
	ldr r1, [r4, #8]
	bl ov01_021EB804
	cmp r0, #1
	beq _021EB3EE
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r4, pc}
_021EB3B0:
	ldr r0, [r4]
	ldr r2, [r4, #8]
	mov r1, #2
	bl ov01_021EB700
	cmp r0, #0
	bne _021EB3C2
	bl GF_AssertFail
_021EB3C2:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	str r0, [r4, #4]
	mov r0, #0
	str r0, [r4, #8]
	pop {r4, pc}
_021EB3D2:
	mov r1, #6
	str r1, [r4, #0xc]
	mov r1, #0
	str r1, [r4, #0x14]
	bl DestroySysTask
	ldr r1, [r4, #0x10]
	cmp r1, #0xe
	beq _021EB3EE
	add r0, r4, #0
	bl FieldWeatherUpdate_UsedFlash
	mov r0, #0xe
	str r0, [r4, #0x10]
_021EB3EE:
	pop {r4, pc}
	thumb_func_end ov01_021EB320

	thumb_func_start ov01_021EB3F0
ov01_021EB3F0: ; 0x021EB3F0
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4, #0xc]
	cmp r1, #4
	bhi _021EB4B2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021EB406: ; jump table
	.short _021EB410 - _021EB406 - 2 ; case 0
	.short _021EB42A - _021EB406 - 2 ; case 1
	.short _021EB43E - _021EB406 - 2 ; case 2
	.short _021EB46A - _021EB406 - 2 ; case 3
	.short _021EB490 - _021EB406 - 2 ; case 4
_021EB410:
	ldr r0, [r4]
	ldr r2, [r4, #8]
	mov r1, #1
	bl ov01_021EB700
	cmp r0, #0
	bne _021EB422
	bl GF_AssertFail
_021EB422:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r4, pc}
_021EB42A:
	ldr r0, [r4]
	ldr r1, [r4, #8]
	bl ov01_021EB804
	cmp r0, #1
	beq _021EB4B2
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r4, pc}
_021EB43E:
	ldr r0, [r4]
	ldr r2, [r4, #4]
	mov r1, #7
	bl ov01_021EB700
	cmp r0, #0
	bne _021EB450
	bl GF_AssertFail
_021EB450:
	ldr r0, [r4]
	ldr r2, [r4, #8]
	mov r1, #4
	bl ov01_021EB700
	cmp r0, #0
	bne _021EB462
	bl GF_AssertFail
_021EB462:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r4, pc}
_021EB46A:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl ov01_021EB804
	cmp r0, #3
	beq _021EB4B2
	ldr r0, [r4]
	ldr r2, [r4, #4]
	mov r1, #8
	bl ov01_021EB700
	cmp r0, #0
	bne _021EB488
	bl GF_AssertFail
_021EB488:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r4, pc}
_021EB490:
	ldr r1, [r4, #8]
	mov r2, #0
	str r1, [r4, #4]
	str r2, [r4, #8]
	mov r1, #6
	str r1, [r4, #0xc]
	str r2, [r4, #0x14]
	bl DestroySysTask
	ldr r1, [r4, #0x10]
	cmp r1, #0xe
	beq _021EB4B2
	add r0, r4, #0
	bl FieldWeatherUpdate_UsedFlash
	mov r0, #0xe
	str r0, [r4, #0x10]
_021EB4B2:
	pop {r4, pc}
	thumb_func_end ov01_021EB3F0

	thumb_func_start ov01_021EB4B4
ov01_021EB4B4: ; 0x021EB4B4
	mov r0, #0
	bx lr
	thumb_func_end ov01_021EB4B4

	thumb_func_start ov01_021EB4B8
ov01_021EB4B8: ; 0x021EB4B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r1, _021EB564 ; =0xFFFFF000
	add r6, r0, #0
	add r0, #0x14
	bl sub_02025C44
	mov r0, #0
	add r3, r6, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0xff
	lsl r0, r0, #0xc
	str r0, [sp, #0x14]
	mov r0, #3
	lsl r0, r0, #0x12
	str r0, [sp, #0x18]
	add r0, r6, #0
	add r0, #0xac
	add r1, sp, #0xc
	mov r2, #1
	add r3, #0x14
	bl sub_0200B27C
	mov r4, #0
	add r5, r6, #0
	mov r7, #0xe
_021EB4EE:
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #4
	bl Create2DGfxResObjMan
	add r4, r4, #1
	stmia r5!, {r0}
	cmp r4, #4
	blt _021EB4EE
	bl sub_0200A8FC
	add r1, r0, #0
	mov r0, #4
	lsl r1, r1, #2
	bl AllocFromHeap
	str r0, [r6, #0x10]
	mov r1, #0
	mov r2, #0x39
	bl ov01_021EB578
	ldr r0, [r6, #0x10]
	mov r1, #1
	mov r2, #0x3a
	bl ov01_021EB578
	ldr r0, [r6, #0x10]
	mov r1, #2
	mov r2, #0x37
	bl ov01_021EB578
	ldr r0, [r6, #0x10]
	mov r1, #3
	mov r2, #0x38
	bl ov01_021EB578
	mov r0, #0x40
	str r0, [sp]
	add r0, r6, #0
	add r0, #0x14
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	add r0, sp, #0
	bl SpriteList_Create
	add r1, r6, #0
	add r1, #0xf4
	str r0, [r1]
	ldr r0, _021EB568 ; =ov01_021EB56C
	add r1, r6, #0
	mov r2, #0xa
	bl CreateSysTask
	add r6, #0xf8
	str r0, [r6]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021EB564: .word 0xFFFFF000
_021EB568: .word ov01_021EB56C
	thumb_func_end ov01_021EB4B8

	thumb_func_start ov01_021EB56C
ov01_021EB56C: ; 0x021EB56C
	ldr r3, _021EB574 ; =sub_0202457C
	add r1, #0xf4
	ldr r0, [r1]
	bx r3
	.balign 4, 0
_021EB574: .word sub_0202457C
	thumb_func_end ov01_021EB56C

	thumb_func_start ov01_021EB578
ov01_021EB578: ; 0x021EB578
	push {r3, r4, r5, lr}
	add r5, r2, #0
	bl sub_0200A900
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x3f
	add r1, r5, #0
	mov r2, #0
	mov r3, #4
	bl GfGfxLoader_LoadFromNarc
	add r5, r0, #0
	add r1, r4, #0
	mov r2, #4
	bl sub_0200A908
	add r0, r5, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021EB578

	thumb_func_start ov01_021EB5A4
ov01_021EB5A4: ; 0x021EB5A4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_021EB5AC:
	ldr r0, [r6, #0x10]
	add r1, r4, #0
	bl sub_0200A900
	bl sub_0200A954
	ldr r0, [r5]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021EB5AC
	ldr r0, [r6, #0x10]
	bl FreeToHeap
	mov r0, #0
	str r0, [r6, #0x10]
	add r0, r6, #0
	add r0, #0xf4
	ldr r0, [r0]
	bl sub_02024504
	add r0, r6, #0
	mov r1, #0
	add r0, #0xf4
	str r1, [r0]
	add r0, r6, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl DestroySysTask
	mov r0, #0
	add r6, #0xf8
	str r0, [r6]
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021EB5A4

	thumb_func_start ov01_021EB5F4
ov01_021EB5F4: ; 0x021EB5F4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	ldr r1, _021EB644 ; =0x0013F000
	cmp r0, r1
	ble _021EB60A
	bl _s32_div_f
	str r1, [r4]
	b _021EB614
_021EB60A:
	ldr r2, _021EB648 ; =0xFFFC0000
	cmp r0, r2
	bge _021EB614
	add r0, r0, r1
	str r0, [r4]
_021EB614:
	mov r1, #1
	ldr r3, [r4, #4]
	lsl r1, r1, #0x14
	cmp r3, r1
	ble _021EB62E
	lsr r2, r3, #0x1f
	lsl r1, r3, #0xc
	sub r1, r1, r2
	mov r0, #0xc
	ror r1, r0
	add r0, r2, r1
	str r0, [r4, #4]
	b _021EB638
_021EB62E:
	ldr r0, _021EB648 ; =0xFFFC0000
	cmp r3, r0
	bge _021EB638
	add r0, r3, r1
	str r0, [r4, #4]
_021EB638:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020247D4
	pop {r3, r4, r5, pc}
	nop
_021EB644: .word 0x0013F000
_021EB648: .word 0xFFFC0000
	thumb_func_end ov01_021EB5F4

	thumb_func_start ov01_021EB64C
ov01_021EB64C: ; 0x021EB64C
	push {r3, r4, r5, lr}
	mov r1, #0x43
	add r5, r0, #0
	mov r0, #4
	lsl r1, r1, #2
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0x41
	lsl r0, r0, #2
	str r5, [r4, r0]
	add r0, r4, #0
	add r0, #8
	bl ov01_021EB4B8
	ldr r0, _021EB684 ; =ov01_022098B0
	mov r1, #4
	str r0, [r4]
	ldr r0, _021EB688 ; =ov01_0220675C
	str r0, [r4, #4]
	mov r0, #0x3f ; NARC_a_0_6_3
	bl NARC_ctor
	mov r1, #0x42
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EB684: .word ov01_022098B0
_021EB688: .word ov01_0220675C
	thumb_func_end ov01_021EB64C

	thumb_func_start ov01_021EB68C
ov01_021EB68C: ; 0x021EB68C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021EB6F6
	mov r5, #0
_021EB69A:
	ldr r0, [r4]
	add r1, r5, #0
	bl ov01_021EBB90
	add r5, r5, #1
	cmp r5, #0xe
	blt _021EB69A
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	mov r0, #0x41
	ldr r1, [r4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	ldr r0, [r0, #0x4c]
	add r3, r2, #0
	bl ov01_021EA864
	ldr r1, _021EB6FC ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	strh r0, [r1]
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4]
	add r0, #8
	bl ov01_021EB5A4
	mov r0, #0x42
	ldr r1, [r4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl NARC_dtor
	ldr r1, [r4]
	mov r0, #4
	bl FreeToHeapExplicit
	mov r0, #0
	str r0, [r4]
_021EB6F6:
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021EB6FC: .word 0x04000008
	thumb_func_end ov01_021EB68C

	thumb_func_start ov01_021EB700
ov01_021EB700: ; 0x021EB700
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	mov r6, #1
	cmp r4, #0xe
	ble _021EB710
	mov r0, #0
	pop {r4, r5, r6, pc}
_021EB710:
	cmp r1, #0xa
	bhi _021EB7FA
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021EB720: ; jump table
	.short _021EB736 - _021EB720 - 2 ; case 0
	.short _021EB740 - _021EB720 - 2 ; case 1
	.short _021EB74A - _021EB720 - 2 ; case 2
	.short _021EB758 - _021EB720 - 2 ; case 3
	.short _021EB766 - _021EB720 - 2 ; case 4
	.short _021EB796 - _021EB720 - 2 ; case 5
	.short _021EB7A0 - _021EB720 - 2 ; case 6
	.short _021EB7A8 - _021EB720 - 2 ; case 7
	.short _021EB7B2 - _021EB720 - 2 ; case 8
	.short _021EB7BA - _021EB720 - 2 ; case 9
	.short _021EB7DA - _021EB720 - 2 ; case 10
_021EB736:
	add r1, r4, #0
	bl ov01_021EB9A8
	add r6, r0, #0
	b _021EB7FA
_021EB740:
	add r1, r4, #0
	bl ov01_021EBA08
	add r6, r0, #0
	b _021EB7FA
_021EB74A:
	add r1, r4, #0
	mov r2, #0
	add r3, r6, #0
	bl ov01_021EBA44
	add r6, r0, #0
	b _021EB7FA
_021EB758:
	add r1, r4, #0
	mov r2, #2
	add r3, r6, #0
	bl ov01_021EBA44
	add r6, r0, #0
	b _021EB7FA
_021EB766:
	mov r0, #0x41
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r0, [r0, #0x4c]
	bl ov01_021EA854
	cmp r0, #1
	bne _021EB786
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	mov r3, #2
	bl ov01_021EBA44
	add r6, r0, #0
	b _021EB7FA
_021EB786:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	add r3, r6, #0
	bl ov01_021EBA44
	add r6, r0, #0
	b _021EB7FA
_021EB796:
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021EBB40
	b _021EB7FA
_021EB7A0:
	add r1, r4, #0
	bl ov01_021EBB68
	b _021EB7FA
_021EB7A8:
	add r1, r4, #0
	mov r2, #0
	bl ov01_021EBB40
	b _021EB7FA
_021EB7B2:
	add r1, r4, #0
	bl ov01_021EBB90
	b _021EB7FA
_021EB7BA:
	mov r0, #0x1c
	ldr r1, [r5]
	mul r0, r4
	add r0, r1, r0
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _021EB7FA
	ldr r0, _021EB800 ; =0x00000F5C
	ldr r1, [r2, r0]
	cmp r1, #1
	bne _021EB7FA
	add r0, r0, #4
	ldrh r0, [r2, r0]
	bl PlaySE
	b _021EB7FA
_021EB7DA:
	mov r0, #0x1c
	ldr r1, [r5]
	mul r0, r4
	add r0, r1, r0
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _021EB7FA
	ldr r0, _021EB800 ; =0x00000F5C
	ldr r1, [r2, r0]
	cmp r1, #1
	bne _021EB7FA
	add r0, r0, #4
	ldrh r0, [r2, r0]
	mov r1, #0
	bl StopSE
_021EB7FA:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_021EB800: .word 0x00000F5C
	thumb_func_end ov01_021EB700

	thumb_func_start ov01_021EB804
ov01_021EB804: ; 0x021EB804
	cmp r1, #0xe
	blt _021EB80C
	mov r0, #0
	bx lr
_021EB80C:
	ldr r2, [r0]
	mov r0, #0x1c
	mul r0, r1
	add r0, r2, r0
	ldrh r0, [r0, #0x10]
	bx lr
	thumb_func_end ov01_021EB804

	thumb_func_start ov01_021EB818
ov01_021EB818: ; 0x021EB818
	push {r3, lr}
	add r3, r0, #0
	str r1, [sp]
	ldr r0, _021EB82C ; =0x04000050
	mov r1, #4
	mov r2, #0x21
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	nop
_021EB82C: .word 0x04000050
	thumb_func_end ov01_021EB818

	thumb_func_start ov01_021EB830
ov01_021EB830: ; 0x021EB830
	str r1, [r0]
	str r1, [r0, #4]
	sub r1, r2, r1
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov01_021EB830

	thumb_func_start ov01_021EB840
ov01_021EB840: ; 0x021EB840
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	ldr r0, [r4, #0xc]
	mul r0, r1
	ldr r1, [r4, #0x10]
	bl _s32_div_f
	ldr r1, [r4, #4]
	add r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r0, r0, #1
	cmp r0, r1
	bgt _021EB866
	str r0, [r4, #0xc]
	mov r0, #0
	pop {r4, pc}
_021EB866:
	str r1, [r4, #0xc]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov01_021EB840

	thumb_func_start ov01_021EB86C
ov01_021EB86C: ; 0x021EB86C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov01_021EBEF0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021EBF24
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021EBF58
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021EBF94
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021EB86C

	thumb_func_start ov01_021EB898
ov01_021EB898: ; 0x021EB898
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r4, r2, #0
	add r6, r1, #0
	add r7, r3, #0
	ldr r5, [sp, #0x40]
	bl sub_0200A900
	str r0, [sp, #0x18]
	add r1, r4, #0
	bl sub_0200A9B0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	bl sub_0200A9DC
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	bl sub_0200AA08
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	bl sub_0200AA3C
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	bl sub_0200A97C
	cmp r6, #3
	bhi _021EB962
	add r1, r6, r6
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021EB8E8: ; jump table
	.short _021EB8F0 - _021EB8E8 - 2 ; case 0
	.short _021EB90E - _021EB8E8 - 2 ; case 1
	.short _021EB930 - _021EB8E8 - 2 ; case 2
	.short _021EB94A - _021EB8E8 - 2 ; case 3
_021EB8F0:
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x1c]
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #0x44]
	ldr r3, [sp, #0x20]
	str r0, [sp, #0xc]
	add r0, r7, #0
	add r1, r5, #0
	bl AddCharResObjFromOpenNarcWithAtEndFlag
	str r0, [sp, #0x14]
	b _021EB962
_021EB90E:
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x1c]
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x20]
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x44]
	add r1, r5, #0
	str r0, [sp, #0x10]
	add r0, r7, #0
	bl AddPlttResObjFromOpenNarcWithAtEndFlag
	str r0, [sp, #0x14]
	b _021EB962
_021EB930:
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	add r0, r7, #0
	add r1, r5, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [sp, #0x14]
	b _021EB962
_021EB94A:
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	add r0, r7, #0
	add r1, r5, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [sp, #0x14]
_021EB962:
	ldr r0, [sp, #0x14]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021EB898

	thumb_func_start ov01_021EB968
ov01_021EB968: ; 0x021EB968
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021EB9A4 ; =0x0000FFFF
	add r4, r2, #0
	cmp r1, r0
	beq _021EB9A0
	ldr r0, [r4]
	cmp r0, #0
	beq _021EB97E
	bl sub_0200AEB0
_021EB97E:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021EB988
	bl sub_0200B0A8
_021EB988:
	mov r6, #0
_021EB98A:
	ldr r1, [r4]
	cmp r1, #0
	beq _021EB996
	ldr r0, [r5, #8]
	bl DestroySingle2DGfxResObj
_021EB996:
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #4
	blt _021EB98A
_021EB9A0:
	pop {r4, r5, r6, pc}
	nop
_021EB9A4: .word 0x0000FFFF
	thumb_func_end ov01_021EB968

	thumb_func_start ov01_021EB9A8
ov01_021EB9A8: ; 0x021EB9A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r2, #0x1c
	ldr r3, [r5]
	mul r2, r1
	add r4, r3, r2
	ldr r1, [r4, #8]
	cmp r1, #0
	bne _021EBA00
	add r1, r4, #0
	bl ov01_021EBE4C
	cmp r0, #0
	bne _021EB9C8
	mov r0, #0
	pop {r3, r4, r5, pc}
_021EB9C8:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021EBD34
	cmp r0, #0
	bne _021EB9E0
	ldr r0, [r4, #8]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_021EB9E0:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	str r1, [r0, #8]
	ldrh r1, [r4]
	ldr r0, _021EBA04 ; =0x0000FFFF
	cmp r1, r0
	beq _021EB9F4
	ldr r0, [r4, #8]
	bl ov01_021EC028
_021EB9F4:
	ldrh r1, [r4, #2]
	add r0, r5, #0
	bl ov01_021EBD18
	mov r0, #2
	strh r0, [r4, #0x10]
_021EBA00:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EBA04: .word 0x0000FFFF
	thumb_func_end ov01_021EB9A8

	thumb_func_start ov01_021EBA08
ov01_021EBA08: ; 0x021EBA08
	push {r4, lr}
	mov r2, #0x1c
	ldr r3, [r0]
	mul r2, r1
	add r4, r3, r2
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021EBA1C
	mov r0, #1
	pop {r4, pc}
_021EBA1C:
	add r1, r4, #0
	bl ov01_021EBE4C
	cmp r0, #0
	bne _021EBA2A
	mov r0, #0
	pop {r4, pc}
_021EBA2A:
	ldr r0, _021EBA40 ; =ov01_021EBD70
	add r1, r4, #0
	mov r2, #1
	bl CreateSysTask
	str r0, [r4, #0x14]
	mov r0, #1
	strh r0, [r4, #0x10]
	mov r1, #0
	strh r1, [r4, #0x12]
	pop {r4, pc}
	.balign 4, 0
_021EBA40: .word ov01_021EBD70
	thumb_func_end ov01_021EBA08

	thumb_func_start ov01_021EBA44
ov01_021EBA44: ; 0x021EBA44
	push {r4, r5, r6, lr}
	add r5, r2, #0
	ldr r2, [r0]
	mov r0, #0x1c
	mul r0, r1
	ldrh r1, [r2, r0]
	add r4, r2, r0
	ldr r0, _021EBB2C ; =0x0000FFFF
	add r6, r3, #0
	cmp r1, r0
	beq _021EBA64
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _021EBA64
	mov r0, #0
	pop {r4, r5, r6, pc}
_021EBA64:
	ldr r1, [r4, #8]
	cmp r1, #0
	bne _021EBA6E
	mov r0, #0
	pop {r4, r5, r6, pc}
_021EBA6E:
	ldrh r0, [r4, #0x10]
	cmp r0, #2
	beq _021EBA78
	mov r0, #0
	pop {r4, r5, r6, pc}
_021EBA78:
	ldr r0, [r4, #0x18]
	mov r2, #4
	bl CreateSysTask
	ldr r1, [r4, #8]
	ldr r3, _021EBB30 ; =0x00000F48
	str r0, [r1, r3]
	ldr r0, [r4, #8]
	ldr r0, [r0, r3]
	cmp r0, #0
	bne _021EBA92
	mov r0, #0
	pop {r4, r5, r6, pc}
_021EBA92:
	mov r0, #3
	strh r0, [r4, #0x10]
	add r0, r3, #0
	ldr r1, [r4, #8]
	add r0, #0x1a
	strh r5, [r1, r0]
	add r0, r3, #0
	ldr r1, [r4, #8]
	mov r2, #0
	add r0, #0x1e
	strh r2, [r1, r0]
	ldr r1, [r4, #8]
	add r0, r1, #0
	add r0, #0xc
	str r0, [r1, #0x40]
	ldr r1, [r4, #8]
	add r0, r1, #0
	add r0, #0xc
	str r0, [r1, #0x44]
	add r0, r3, #0
	ldr r1, [r4, #8]
	add r0, #0x1c
	strh r6, [r1, r0]
	add r0, r3, #0
	ldr r1, [r4, #8]
	add r0, #0x14
	str r2, [r1, r0]
	ldr r1, [r4, #8]
	add r0, r3, #4
	ldr r6, _021EBB34 ; =NNS_G3dGlb + 0x258
	add r5, r1, r0
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	str r0, [r5]
	ldr r1, [r4, #4]
	cmp r1, #0
	ble _021EBAF8
	mov r0, #4
	bl AllocFromHeap
	ldr r2, [r4, #8]
	ldr r1, _021EBB38 ; =0x00000F58
	str r0, [r2, r1]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	ldr r0, [r0, r1]
	mov r1, #0
	bl memset
	b _021EBAFE
_021EBAF8:
	ldr r0, [r4, #8]
	add r3, #0x10
	str r2, [r0, r3]
_021EBAFE:
	ldrh r1, [r4, #2]
	ldr r0, _021EBB2C ; =0x0000FFFF
	cmp r1, r0
	beq _021EBB28
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r2, _021EBB3C ; =0x0400000C
	mov r1, #3
	ldrh r3, [r2]
	mov r0, #1
	bic r3, r1
	orr r0, r3
	strh r0, [r2]
	sub r2, r2, #4
	ldrh r3, [r2]
	mov r0, #2
	bic r3, r1
	orr r0, r3
	strh r0, [r2]
_021EBB28:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EBB2C: .word 0x0000FFFF
_021EBB30: .word 0x00000F48
_021EBB34: .word NNS_G3dGlb + 0x258
_021EBB38: .word 0x00000F58
_021EBB3C: .word 0x0400000C
	thumb_func_end ov01_021EBA44

	thumb_func_start ov01_021EBB40
ov01_021EBB40: ; 0x021EBB40
	push {r3, r4}
	ldr r3, [r0]
	mov r0, #0x1c
	mul r0, r1
	add r4, r3, r0
	ldrh r0, [r4, #0x10]
	cmp r0, #3
	bne _021EBB5E
	ldr r1, [r4, #8]
	ldr r0, _021EBB64 ; =0x00000F66
	mov r3, #5
	strh r3, [r1, r0]
	ldr r1, [r4, #8]
	sub r0, r0, #2
	strh r2, [r1, r0]
_021EBB5E:
	pop {r3, r4}
	bx lr
	nop
_021EBB64: .word 0x00000F66
	thumb_func_end ov01_021EBB40

	thumb_func_start ov01_021EBB68
ov01_021EBB68: ; 0x021EBB68
	push {r4, lr}
	mov r2, #0x1c
	ldr r3, [r0]
	mul r2, r1
	add r4, r3, r2
	bl ov01_021EB804
	cmp r0, #3
	bne _021EBB8A
	ldr r1, [r4, #8]
	ldr r0, _021EBB8C ; =0x00000F62
	mov r2, #5
	strh r2, [r1, r0]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0x18]
	mov r0, #0
	blx r2
_021EBB8A:
	pop {r4, pc}
	.balign 4, 0
_021EBB8C: .word 0x00000F62
	thumb_func_end ov01_021EBB68

	thumb_func_start ov01_021EBB90
ov01_021EBB90: ; 0x021EBB90
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x1c
	ldr r2, [r5]
	mul r0, r1
	add r4, r2, r0
	ldrh r1, [r4, #2]
	ldr r0, _021EBC8C ; =0x0000FFFF
	cmp r1, r0
	beq _021EBBCE
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, _021EBC90 ; =0x0400000C
	mov r2, #3
	ldrh r3, [r0]
	mov r1, #3
	bic r3, r2
	orr r1, r3
	strh r1, [r0]
	sub r3, r0, #4
	ldrh r6, [r3]
	mov r1, #1
	add r0, #0x44
	bic r6, r2
	orr r1, r6
	strh r1, [r3]
	mov r1, #0
	strh r1, [r0]
_021EBBCE:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _021EBBF6
	ldrh r1, [r4]
	add r0, r5, #0
	bl ov01_021EB968
	ldr r1, [r4, #0xc]
	mov r0, #4
	bl FreeToHeapExplicit
	mov r0, #0
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _021EBBF6
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #0x14]
_021EBBF6:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021EBC70
	add r0, #0xc
	bl ov01_021EC2CC
	ldrh r1, [r4]
	ldr r0, _021EBC8C ; =0x0000FFFF
	cmp r1, r0
	beq _021EBC10
	ldr r0, [r4, #8]
	bl ov01_021EC058
_021EBC10:
	ldr r0, [r4, #8]
	ldr r1, _021EBC94 ; =0x00000F5C
	ldr r1, [r0, r1]
	cmp r1, #1
	bne _021EBC1E
	bl ov01_021EDAE0
_021EBC1E:
	ldr r1, [r4, #8]
	ldr r0, _021EBC98 ; =0x00000F58
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _021EBC36
	mov r0, #4
	bl FreeToHeapExplicit
	ldr r1, [r4, #8]
	ldr r0, _021EBC98 ; =0x00000F58
	mov r2, #0
	str r2, [r1, r0]
_021EBC36:
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	bne _021EBC48
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _021EBC56
	bl DestroySysTask
	b _021EBC56
_021EBC48:
	cmp r0, #3
	bne _021EBC56
	ldr r1, [r4, #8]
	ldr r0, _021EBC9C ; =0x00000F48
	ldr r0, [r1, r0]
	bl DestroySysTask
_021EBC56:
	ldr r1, [r4, #8]
	ldr r0, _021EBCA0 ; =0x00000F6C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _021EBC64
	bl DestroySysTask
_021EBC64:
	ldr r1, [r4, #8]
	mov r0, #4
	bl FreeToHeapExplicit
	mov r0, #0
	str r0, [r4, #8]
_021EBC70:
	mov r2, #0
	str r2, [sp]
	mov r0, #0x41
	str r2, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	ldr r0, [r0, #0x4c]
	add r3, r2, #0
	bl ov01_021EA864
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021EBC8C: .word 0x0000FFFF
_021EBC90: .word 0x0400000C
_021EBC94: .word 0x00000F5C
_021EBC98: .word 0x00000F58
_021EBC9C: .word 0x00000F48
_021EBCA0: .word 0x00000F6C
	thumb_func_end ov01_021EBB90

	thumb_func_start ov01_021EBCA4
ov01_021EBCA4: ; 0x021EBCA4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrh r1, [r4, #2]
	ldr r0, _021EBD08 ; =0x0000FFFF
	cmp r1, r0
	beq _021EBCD8
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, _021EBD0C ; =0x0400000C
	mov r2, #3
	ldrh r3, [r0]
	mov r1, #3
	bic r3, r2
	orr r1, r3
	strh r1, [r0]
	sub r3, r0, #4
	ldrh r5, [r3]
	mov r1, #1
	add r0, #0x44
	bic r5, r2
	orr r1, r5
	strh r1, [r3]
	mov r1, #0
	strh r1, [r0]
_021EBCD8:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021EBD06
	add r0, #0xc
	bl ov01_021EC2CC
	ldr r0, [r4, #8]
	ldr r1, _021EBD10 ; =0x00000F5C
	ldr r1, [r0, r1]
	cmp r1, #1
	bne _021EBCF2
	bl ov01_021EDAE0
_021EBCF2:
	ldrh r0, [r4, #0x10]
	cmp r0, #3
	bne _021EBD06
	ldr r1, [r4, #8]
	ldr r0, _021EBD14 ; =0x00000F48
	ldr r0, [r1, r0]
	bl DestroySysTask
	mov r0, #2
	strh r0, [r4, #0x10]
_021EBD06:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EBD08: .word 0x0000FFFF
_021EBD0C: .word 0x0400000C
_021EBD10: .word 0x00000F5C
_021EBD14: .word 0x00000F48
	thumb_func_end ov01_021EBCA4

	thumb_func_start ov01_021EBD18
ov01_021EBD18: ; 0x021EBD18
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021EC078
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021EC0C0
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021EC114
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021EBD18

	thumb_func_start ov01_021EBD34
ov01_021EBD34: ; 0x021EBD34
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrh r1, [r4]
	add r5, r0, #0
	ldr r0, _021EBD6C ; =0x0000FFFF
	cmp r1, r0
	beq _021EBD68
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _021EBD68
	add r0, r4, #0
	bl ov01_021EBEB8
	cmp r0, #0
	bne _021EBD56
	mov r0, #0
	pop {r3, r4, r5, pc}
_021EBD56:
	ldrh r1, [r4]
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	bl ov01_021EB86C
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021EBFD0
_021EBD68:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EBD6C: .word 0x0000FFFF
	thumb_func_end ov01_021EBD34

	thumb_func_start ov01_021EBD70
ov01_021EBD70: ; 0x021EBD70
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrh r2, [r4, #0x12]
	add r5, r0, #0
	ldr r0, [r4, #8]
	cmp r2, #8
	ldr r0, [r0]
	bhi _021EBE46
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021EBD8C: ; jump table
	.short _021EBD9E - _021EBD8C - 2 ; case 0
	.short _021EBDB4 - _021EBD8C - 2 ; case 1
	.short _021EBDC4 - _021EBD8C - 2 ; case 2
	.short _021EBDD2 - _021EBD8C - 2 ; case 3
	.short _021EBDE2 - _021EBD8C - 2 ; case 4
	.short _021EBDF0 - _021EBD8C - 2 ; case 5
	.short _021EBE00 - _021EBD8C - 2 ; case 6
	.short _021EBE0E - _021EBD8C - 2 ; case 7
	.short _021EBE1E - _021EBD8C - 2 ; case 8
_021EBD9E:
	add r0, r4, #0
	bl ov01_021EBEB8
	cmp r0, #0
	bne _021EBDAC
	bl GF_AssertFail
_021EBDAC:
	ldrh r0, [r4, #0x12]
	add r0, r0, #1
	strh r0, [r4, #0x12]
	pop {r3, r4, r5, pc}
_021EBDB4:
	ldrh r1, [r4]
	ldr r2, [r4, #0xc]
	bl ov01_021EBEF0
	ldrh r0, [r4, #0x12]
	add r0, r0, #1
	strh r0, [r4, #0x12]
	pop {r3, r4, r5, pc}
_021EBDC4:
	ldrh r1, [r4, #2]
	bl ov01_021EC078
	ldrh r0, [r4, #0x12]
	add r0, r0, #1
	strh r0, [r4, #0x12]
	pop {r3, r4, r5, pc}
_021EBDD2:
	ldrh r1, [r4]
	ldr r2, [r4, #0xc]
	bl ov01_021EBF24
	ldrh r0, [r4, #0x12]
	add r0, r0, #1
	strh r0, [r4, #0x12]
	pop {r3, r4, r5, pc}
_021EBDE2:
	ldrh r1, [r4, #2]
	bl ov01_021EC0C0
	ldrh r0, [r4, #0x12]
	add r0, r0, #1
	strh r0, [r4, #0x12]
	pop {r3, r4, r5, pc}
_021EBDF0:
	ldrh r1, [r4]
	ldr r2, [r4, #0xc]
	bl ov01_021EBF58
	ldrh r0, [r4, #0x12]
	add r0, r0, #1
	strh r0, [r4, #0x12]
	pop {r3, r4, r5, pc}
_021EBE00:
	ldrh r1, [r4, #2]
	bl ov01_021EC114
	ldrh r0, [r4, #0x12]
	add r0, r0, #1
	strh r0, [r4, #0x12]
	pop {r3, r4, r5, pc}
_021EBE0E:
	ldrh r1, [r4]
	ldr r2, [r4, #0xc]
	bl ov01_021EBF94
	ldrh r0, [r4, #0x12]
	add r0, r0, #1
	strh r0, [r4, #0x12]
	pop {r3, r4, r5, pc}
_021EBE1E:
	bl ov01_021EBFD0
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	str r1, [r0, #8]
	ldrh r1, [r4]
	ldr r0, _021EBE48 ; =0x0000FFFF
	cmp r1, r0
	beq _021EBE36
	ldr r0, [r4, #8]
	bl ov01_021EC028
_021EBE36:
	mov r0, #2
	strh r0, [r4, #0x10]
	mov r0, #0
	strh r0, [r4, #0x12]
	str r0, [r4, #0x14]
	add r0, r5, #0
	bl DestroySysTask
_021EBE46:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EBE48: .word 0x0000FFFF
	thumb_func_end ov01_021EBD70

	thumb_func_start ov01_021EBE4C
ov01_021EBE4C: ; 0x021EBE4C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021EBE5C
	mov r0, #1
	pop {r3, r4, r5, pc}
_021EBE5C:
	mov r1, #0xf7
	mov r0, #4
	lsl r1, r1, #4
	bl AllocFromHeap
	str r0, [r4, #8]
	cmp r0, #0
	bne _021EBE70
	mov r0, #0
	pop {r3, r4, r5, pc}
_021EBE70:
	mov r2, #0xf7
	mov r1, #0
	lsl r2, r2, #4
	bl memset
	ldr r0, [r4, #8]
	ldr r2, _021EBEB4 ; =0x00000F62
	str r5, [r0]
	ldr r1, [r4, #8]
	mov r0, #0
	strh r0, [r1, r2]
	ldr r3, [r4, #8]
	add r1, r2, #4
	strh r0, [r3, r1]
	ldr r3, [r4, #8]
	add r1, r3, #0
	add r1, #0xc
	str r1, [r3, #0x40]
	ldr r3, [r4, #8]
	add r1, r3, #0
	add r1, #0xc
	str r1, [r3, #0x44]
	add r1, r2, #0
	ldr r3, [r4, #8]
	sub r1, #0xa
	str r0, [r3, r1]
	ldr r1, [r4, #8]
	add r2, #0xa
	str r4, [r1, #4]
	ldr r1, [r4, #8]
	str r0, [r1, r2]
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021EBEB4: .word 0x00000F62
	thumb_func_end ov01_021EBE4C

	thumb_func_start ov01_021EBEB8
ov01_021EBEB8: ; 0x021EBEB8
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4]
	ldr r0, _021EBEEC ; =0x0000FFFF
	cmp r1, r0
	beq _021EBEE8
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _021EBECE
	mov r0, #1
	pop {r4, pc}
_021EBECE:
	mov r0, #4
	mov r1, #0x64
	bl AllocFromHeap
	str r0, [r4, #0xc]
	cmp r0, #0
	bne _021EBEE0
	mov r0, #0
	pop {r4, pc}
_021EBEE0:
	mov r1, #0
	mov r2, #0x64
	bl memset
_021EBEE8:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_021EBEEC: .word 0x0000FFFF
	thumb_func_end ov01_021EBEB8

	thumb_func_start ov01_021EBEF0
ov01_021EBEF0: ; 0x021EBEF0
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _021EBF20 ; =0x0000FFFF
	add r3, r1, #0
	add r4, r2, #0
	cmp r3, r0
	beq _021EBF1A
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r3, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x18]
	ldr r3, [r5, #0x10]
	mov r1, #2
	bl ov01_021EB898
	str r0, [r4, #8]
_021EBF1A:
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021EBF20: .word 0x0000FFFF
	thumb_func_end ov01_021EBEF0

	thumb_func_start ov01_021EBF24
ov01_021EBF24: ; 0x021EBF24
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _021EBF54 ; =0x0000FFFF
	add r3, r1, #0
	add r4, r2, #0
	cmp r3, r0
	beq _021EBF4E
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r3, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x18]
	ldr r3, [r5, #0x14]
	mov r1, #3
	bl ov01_021EB898
	str r0, [r4, #0xc]
_021EBF4E:
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021EBF54: .word 0x0000FFFF
	thumb_func_end ov01_021EBF24

	thumb_func_start ov01_021EBF58
ov01_021EBF58: ; 0x021EBF58
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _021EBF90 ; =0x0000FFFF
	add r3, r1, #0
	add r4, r2, #0
	cmp r3, r0
	beq _021EBF8C
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r3, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x18]
	ldr r3, [r5, #8]
	mov r1, #0
	bl ov01_021EB898
	str r0, [r4]
	bl sub_0200ADA4
	ldr r0, [r4]
	bl sub_0200A740
_021EBF8C:
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EBF90: .word 0x0000FFFF
	thumb_func_end ov01_021EBF58

	thumb_func_start ov01_021EBF94
ov01_021EBF94: ; 0x021EBF94
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _021EBFCC ; =0x0000FFFF
	add r3, r1, #0
	add r4, r2, #0
	cmp r3, r0
	beq _021EBFC6
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	add r2, r3, #0
	ldr r0, [r5, #0x18]
	ldr r3, [r5, #0xc]
	bl ov01_021EB898
	str r0, [r4, #4]
	bl sub_0200B00C
	ldr r0, [r4, #4]
	bl sub_0200A740
_021EBFC6:
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021EBFCC: .word 0x0000FFFF
	thumb_func_end ov01_021EBF94

	thumb_func_start ov01_021EBFD0
ov01_021EBFD0: ; 0x021EBFD0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrh r1, [r4]
	add r5, r0, #0
	ldr r0, _021EC024 ; =0x0000FFFF
	cmp r1, r0
	beq _021EC022
	ldr r2, [r4, #0xc]
	mov r0, #1
	str r0, [sp]
	add r0, r2, #0
	add r0, #0x40
	add r1, r5, #0
	mov r3, #0
	bl ov01_021EC240
	ldr r0, [r4, #0xc]
	mov r1, #0
	add r0, #0x10
	mov r2, #0x30
	bl memset
	add r5, #0xfc
	ldr r1, [r5]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x10]
	ldr r1, [r4, #0xc]
	add r0, r1, #0
	add r0, #0x40
	str r0, [r1, #0x14]
	mov r1, #1
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0xc
	str r1, [r0, #0x24]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x28]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x2c]
	ldr r0, [r4, #0xc]
	mov r1, #1
	str r1, [r0, #0x38]
_021EC022:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EC024: .word 0x0000FFFF
	thumb_func_end ov01_021EBFD0

	thumb_func_start ov01_021EC028
ov01_021EC028: ; 0x021EC028
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
	add r7, r4, #0
_021EC032:
	ldr r0, [r6, #8]
	add r0, #0x10
	bl CreateSprite
	str r0, [r5, #0x4c]
	add r1, r7, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x4c]
	cmp r0, #0
	bne _021EC04C
	bl GF_AssertFail
_021EC04C:
	add r4, r4, #1
	add r5, #0x3c
	cmp r4, #0x40
	blt _021EC032
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021EC028

	thumb_func_start ov01_021EC058
ov01_021EC058: ; 0x021EC058
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
_021EC060:
	ldr r0, [r5, #0x4c]
	cmp r0, #0
	beq _021EC06C
	bl sub_02024758
	str r6, [r5, #0x4c]
_021EC06C:
	add r4, r4, #1
	add r5, #0x3c
	cmp r4, #0x40
	blt _021EC060
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021EC058

	thumb_func_start ov01_021EC078
ov01_021EC078: ; 0x021EC078
	push {r3, lr}
	sub sp, #0x18
	add r2, r0, #0
	ldr r0, _021EC0BC ; =0x0000FFFF
	cmp r1, r0
	beq _021EC0B8
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	ldr r3, [r2, #4]
	mov r2, #0xc
	mul r2, r1
	ldr r1, [r3, r2]
	mov r2, #4
	bl NARC_AllocAndReadWholeMember
	add r1, sp, #0x14
	str r0, [sp]
	bl NNS_G2dGetUnpackedPaletteData
	ldr r1, [sp, #0x14]
	mov r0, #2
	ldr r1, [r1, #0xc]
	mov r2, #0x20
	mov r3, #0xc0
	bl BG_LoadPlttData
	ldr r0, [sp]
	bl FreeToHeap
	mov r0, #0
	str r0, [sp]
_021EC0B8:
	add sp, #0x18
	pop {r3, pc}
	.balign 4, 0
_021EC0BC: .word 0x0000FFFF
	thumb_func_end ov01_021EC078

	thumb_func_start ov01_021EC0C0
ov01_021EC0C0: ; 0x021EC0C0
	push {r3, r4, lr}
	sub sp, #0x1c
	add r4, r0, #0
	ldr r0, _021EC110 ; =0x0000FFFF
	cmp r1, r0
	beq _021EC10C
	mov r2, #0xc
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r3, [r4, #4]
	mul r2, r1
	add r1, r3, r2
	ldr r0, [r4, r0]
	ldr r1, [r1, #4]
	mov r2, #4
	bl NARC_AllocAndReadWholeMember
	add r1, sp, #0x14
	str r0, [sp, #8]
	bl NNS_G2dGetUnpackedCharacterData
	ldr r3, [sp, #0x14]
	mov r0, #0
	str r0, [sp]
	mov r0, #0x41
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r3, #0x14]
	ldr r0, [r0, #8]
	ldr r3, [r3, #0x10]
	mov r1, #2
	bl BG_LoadCharTilesData
	ldr r0, [sp, #8]
	bl FreeToHeap
	mov r0, #0
	str r0, [sp, #8]
_021EC10C:
	add sp, #0x1c
	pop {r3, r4, pc}
	.balign 4, 0
_021EC110: .word 0x0000FFFF
	thumb_func_end ov01_021EC0C0

	thumb_func_start ov01_021EC114
ov01_021EC114: ; 0x021EC114
	push {r4, r5, lr}
	sub sp, #0x24
	add r4, r0, #0
	ldr r0, _021EC1B8 ; =0x0000FFFF
	add r5, r1, #0
	cmp r5, r0
	beq _021EC1B4
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r1, #0xc
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r2, [r4, #4]
	mul r1, r5
	add r1, r2, r1
	ldr r0, [r4, r0]
	ldr r1, [r1, #8]
	mov r2, #4
	bl NARC_AllocAndReadWholeMember
	str r0, [sp, #0x14]
	cmp r0, #0
	bne _021EC14A
	bl GF_AssertFail
_021EC14A:
	ldr r0, [sp, #0x14]
	add r1, sp, #0x18
	bl NNS_G2dGetUnpackedScreenData
	ldr r3, [sp, #0x18]
	mov r0, #0
	str r0, [sp]
	add r2, r3, #0
	mov r0, #0x41
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r3, [r3, #8]
	ldr r0, [r0, #8]
	mov r1, #2
	add r2, #0xc
	bl BgCopyOrUncompressTilemapBufferRangeToVram
	mov r0, #0x41
	lsl r0, r0, #2
	ldr r3, [sp, #0x18]
	ldr r0, [r4, r0]
	add r2, r3, #0
	ldr r0, [r0, #8]
	ldr r3, [r3, #8]
	mov r1, #2
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	mov r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	add r0, #0xfe
	ldr r0, [r4, r0]
	mov r2, #0
	ldr r0, [r0, #8]
	mov r1, #2
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	mov r0, #0x41
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	ldr r0, [r0, #8]
	bl BgCommitTilemapBufferToVram
	ldr r0, [sp, #0x14]
	bl FreeToHeap
	mov r0, #0
	str r0, [sp, #0x14]
_021EC1B4:
	add sp, #0x24
	pop {r4, r5, pc}
	.balign 4, 0
_021EC1B8: .word 0x0000FFFF
	thumb_func_end ov01_021EC114

	thumb_func_start ov01_021EC1BC
ov01_021EC1BC: ; 0x021EC1BC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	add r4, r1, #0
	cmp r0, #0
	beq _021EC1CC
	bl GF_AssertFail
_021EC1CC:
	cmp r4, #0
	bgt _021EC1D4
	bl GF_AssertFail
_021EC1D4:
	cmp r4, #0x28
	bls _021EC1DC
	bl GF_AssertFail
_021EC1DC:
	add r0, r5, #0
	add r0, #0xc
	str r0, [r5, #8]
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021EC1BC

	thumb_func_start ov01_021EC1E4
ov01_021EC1E4: ; 0x021EC1E4
	ldr r3, _021EC1F0 ; =memset
	mov r1, #0
	str r1, [r0, #8]
	add r0, #0xc
	mov r2, #0x28
	bx r3
	.balign 4, 0
_021EC1F0: .word memset
	thumb_func_end ov01_021EC1E4

	thumb_func_start ov01_021EC1F4
ov01_021EC1F4: ; 0x021EC1F4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	ldr r6, [r5]
	bl ov01_021EC8D8
	add r4, r0, #0
	bne _021EC208
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021EC208:
	add r1, r5, #0
	str r6, [r4]
	add r1, #0xc
	str r1, [r4, #0x34]
	ldr r1, [r5, #0x44]
	str r1, [r4, #0x38]
	ldr r1, [r5, #0x44]
	str r4, [r1, #0x34]
	str r4, [r5, #0x44]
	add r1, r7, #0
	bl ov01_021EC1BC
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _021EC22A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021EC22A:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _021EC234
	bl GF_AssertFail
_021EC234:
	ldr r0, [r4, #4]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021EC1F4

	thumb_func_start ov01_021EC240
ov01_021EC240: ; 0x021EC240
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r0, [sp, #0x2c]
	add r7, r1, #0
	add r5, r2, #0
	str r3, [sp, #0x30]
	mov r6, #0
	add r4, sp, #0x34
_021EC250:
	ldr r0, [r5]
	bl sub_0200A7FC
	add r6, r6, #1
	add r5, r5, #4
	stmia r4!, {r0}
	cmp r6, #4
	blt _021EC250
	ldr r0, [sp, #0x40]
	str r0, [sp]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x58]
	str r0, [sp, #0x10]
	ldr r0, [r7, #8]
	str r0, [sp, #0x14]
	ldr r0, [r7, #0xc]
	str r0, [sp, #0x18]
	ldr r0, [r7, #0x10]
	str r0, [sp, #0x1c]
	ldr r0, [r7, #0x14]
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x34]
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x3c]
	bl CreateSpriteResourcesHeader
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021EC240

	thumb_func_start ov01_021EC29C
ov01_021EC29C: ; 0x021EC29C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x34]
	ldr r0, [r4, #0x38]
	str r1, [r0, #0x34]
	ldr r1, [r4, #0x38]
	ldr r0, [r4, #0x34]
	str r1, [r0, #0x38]
	ldr r0, [r4, #4]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov01_021EC1E4
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x3c
	ldr r5, [r4, #4]
	bl memset
	str r5, [r4, #4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021EC29C

	thumb_func_start ov01_021EC2CC
ov01_021EC2CC: ; 0x021EC2CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x34]
	cmp r0, r5
	beq _021EC2E2
_021EC2D6:
	ldr r4, [r0, #0x34]
	bl ov01_021EC29C
	add r0, r4, #0
	cmp r4, r5
	bne _021EC2D6
_021EC2E2:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021EC2CC

	thumb_func_start ov01_021EC2E4
ov01_021EC2E4: ; 0x021EC2E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x34]
	add r6, r1, #0
	ldr r4, [r0, #0x34]
	cmp r0, r5
	beq _021EC2FC
_021EC2F2:
	blx r6
	add r0, r4, #0
	ldr r4, [r4, #0x34]
	cmp r0, r5
	bne _021EC2F2
_021EC2FC:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021EC2E4

	thumb_func_start ov01_021EC300
ov01_021EC300: ; 0x021EC300
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021EC300

	thumb_func_start ov01_021EC304
ov01_021EC304: ; 0x021EC304
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r1, #4]
	bl sub_020248AC
	add r2, r0, #0
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EC304

	thumb_func_start ov01_021EC31C
ov01_021EC31C: ; 0x021EC31C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r3, _021EC45C ; =NNS_G3dGlb + 0x258
	add r5, r2, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x18
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, _021EC460 ; =0x00000F4C
	ldr r2, [sp, #0x18]
	ldr r1, [r5, r0]
	add r0, #8
	sub r6, r2, r1
	ldr r1, [sp, #0x20]
	ldr r0, [r5, r0]
	sub r4, r1, r0
	mov r0, #1
	mov r1, #3
	lsl r0, r0, #0xe
	lsl r1, r1, #0xc
	bl FX_Div
	add r7, r0, #0
	mov r0, #0x41
	ldr r1, [r5]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r0, [r0, #0x24]
	bl GF_Camera_GetPerspectiveAngle
	str r0, [sp, #0xc]
	mov r0, #0x41
	ldr r1, [r5]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r0, [r0, #0x24]
	bl GF_Camera_GetDistance
	add r1, r0, #0
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r2, r7, #0
	add r3, sp, #0x14
	bl sub_02020E10
	mov r1, #1
	ldr r0, [sp, #0x14]
	lsl r1, r1, #0x14
	bl FX_Div
	str r0, [sp, #0x14]
	cmp r4, #0
	bgt _021EC398
	ldr r0, [sp, #0x10]
	ldr r1, _021EC464 ; =0x000BE8D0
	bl FX_Div
	b _021EC3A0
_021EC398:
	ldr r0, [sp, #0x10]
	ldr r1, _021EC468 ; =0x000BE811
	bl FX_Div
_021EC3A0:
	mov r7, #1
	lsl r7, r7, #0xc
	str r0, [sp, #0x10]
	cmp r6, #0
	bge _021EC3C8
	ldr r7, _021EC46C ; =0xFFFFF000
	asr r1, r6, #0x1f
	add r0, r6, #0
	asr r3, r7, #0xc
	add r2, r7, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r6, r2, #0xc
	orr r6, r0
_021EC3C8:
	ldr r1, [sp, #0x14]
	add r0, r6, #0
	bl FX_Div
	add r6, r0, #0
	cmp r7, #0
	bge _021EC3F0
	asr r1, r6, #0x1f
	asr r3, r7, #0x1f
	add r2, r7, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r6, r2, #0xc
	orr r6, r0
_021EC3F0:
	mov r7, #1
	lsl r7, r7, #0xc
	cmp r4, #0
	bge _021EC416
	ldr r7, _021EC46C ; =0xFFFFF000
	asr r1, r4, #0x1f
	add r0, r4, #0
	asr r3, r7, #0xc
	add r2, r7, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r4, r2, #0xc
	orr r4, r0
_021EC416:
	ldr r1, [sp, #0x10]
	add r0, r4, #0
	bl FX_Div
	add r3, r0, #0
	cmp r7, #0
	bge _021EC43E
	asr r1, r3, #0x1f
	asr r3, r7, #0x1f
	add r2, r7, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r3, r2, #0xc
	orr r3, r0
_021EC43E:
	add r0, r6, r3
	beq _021EC450
	ldr r0, _021EC460 ; =0x00000F4C
	add r2, sp, #0x18
	add r4, r5, r0
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
_021EC450:
	ldr r0, [sp, #4]
	str r6, [r0]
	ldr r0, [sp, #8]
	str r3, [r0]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EC45C: .word NNS_G3dGlb + 0x258
_021EC460: .word 0x00000F4C
_021EC464: .word 0x000BE8D0
_021EC468: .word 0x000BE811
_021EC46C: .word 0xFFFFF000
	thumb_func_end ov01_021EC31C

	thumb_func_start ov01_021EC470
ov01_021EC470: ; 0x021EC470
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r2, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov01_021EC4A8
	cmp r5, #0
	beq _021EC494
	ldr r0, [sp, #4]
	asr r1, r0, #0xc
	str r1, [r5]
	bpl _021EC494
	mov r0, #1
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [r5]
_021EC494:
	cmp r4, #0
	beq _021EC4A4
	ldr r0, [sp]
	asr r0, r0, #0xc
	str r0, [r4]
	bpl _021EC4A4
	add r0, r0, #1
	str r0, [r4]
_021EC4A4:
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021EC470

	thumb_func_start ov01_021EC4A8
ov01_021EC4A8: ; 0x021EC4A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r7, r1, #0
	str r2, [sp]
	add r0, sp, #8
	add r1, sp, #4
	add r2, r5, #0
	bl ov01_021EC31C
	ldr r4, [r5, #0x40]
	add r5, #0xc
	cmp r4, r5
	beq _021EC4EC
	add r6, sp, #0xc
_021EC4C6:
	add r0, r6, #0
	add r1, r4, #0
	bl ov01_021EC304
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	sub r0, r1, r0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #4]
	sub r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r6, #0
	bl ov01_021EB5F4
	ldr r4, [r4, #0x34]
	cmp r4, r5
	bne _021EC4C6
_021EC4EC:
	cmp r7, #0
	beq _021EC4F4
	ldr r0, [sp, #8]
	str r0, [r7]
_021EC4F4:
	ldr r0, [sp]
	cmp r0, #0
	beq _021EC4FE
	ldr r1, [sp, #4]
	str r1, [r0]
_021EC4FE:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021EC4A8

	thumb_func_start ov01_021EC504
ov01_021EC504: ; 0x021EC504
	str r1, [r0]
	strh r2, [r0, #4]
	mov r1, #0
	strh r1, [r0, #6]
	strh r3, [r0, #8]
	strh r1, [r0, #0xa]
	ldr r1, [sp]
	strh r1, [r0, #0xc]
	ldr r1, [sp, #4]
	strh r1, [r0, #0xe]
	ldr r1, [sp, #8]
	strh r1, [r0, #0x10]
	ldr r1, [sp, #0xc]
	strh r1, [r0, #0x12]
	ldr r1, [sp, #0x10]
	str r1, [r0, #0x14]
	ldr r1, [sp, #0x14]
	str r1, [r0, #0x18]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021EC504

	thumb_func_start ov01_021EC52C
ov01_021EC52C: ; 0x021EC52C
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	ldr r1, [sp]
	strh r3, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end ov01_021EC52C

	thumb_func_start ov01_021EC538
ov01_021EC538: ; 0x021EC538
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x10
	ldrsh r0, [r5, r0]
	mov r4, #0
	cmp r0, #0
	bne _021EC54C
	mov r0, #1
	orr r4, r0
	b _021EC572
_021EC54C:
	bgt _021EC552
	mov r2, #1
	b _021EC554
_021EC552:
	add r2, r4, #0
_021EC554:
	mov r0, #0xe
	ldrsh r1, [r5, r0]
	mov r0, #8
	ldrsh r0, [r5, r0]
	cmp r0, r1
	blt _021EC564
	cmp r2, #0
	beq _021EC56C
_021EC564:
	cmp r0, r1
	bgt _021EC572
	cmp r2, #1
	bne _021EC572
_021EC56C:
	mov r0, #1
	orr r4, r0
	strh r1, [r5, #8]
_021EC572:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _021EC57E
	mov r0, #2
	orr r4, r0
	b _021EC5A4
_021EC57E:
	bgt _021EC584
	mov r2, #1
	b _021EC586
_021EC584:
	mov r2, #0
_021EC586:
	mov r0, #0xc
	ldrsh r1, [r5, r0]
	mov r0, #4
	ldrsh r0, [r5, r0]
	cmp r0, r1
	blt _021EC596
	cmp r2, #0
	beq _021EC59E
_021EC596:
	cmp r0, r1
	bgt _021EC5A4
	cmp r2, #1
	bne _021EC5A4
_021EC59E:
	mov r0, #2
	orr r4, r0
	strh r1, [r5, #4]
_021EC5A4:
	mov r0, #6
	ldrsh r1, [r5, r0]
	sub r1, r1, #1
	strh r1, [r5, #6]
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bgt _021EC5F8
	mov r1, #4
	ldrsh r1, [r5, r1]
	ldr r0, [r5]
	ldr r2, [r5, #0x18]
	blx r2
	mov r0, #8
	ldrsh r1, [r5, r0]
	strh r1, [r5, #6]
	mov r1, #1
	tst r1, r4
	bne _021EC5D2
	ldrsh r1, [r5, r0]
	mov r0, #0x10
	ldrsh r0, [r5, r0]
	add r0, r1, r0
	strh r0, [r5, #8]
_021EC5D2:
	mov r0, #2
	tst r0, r4
	bne _021EC5F8
	mov r0, #0xa
	ldrsh r1, [r5, r0]
	add r1, r1, #1
	strh r1, [r5, #0xa]
	ldrsh r1, [r5, r0]
	mov r0, #0x12
	ldrsh r0, [r5, r0]
	cmp r1, r0
	blt _021EC5F8
	mov r0, #0
	strh r0, [r5, #0xa]
	mov r0, #4
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x14]
	add r0, r1, r0
	strh r0, [r5, #4]
_021EC5F8:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021EC538

	thumb_func_start ov01_021EC5FC
ov01_021EC5FC: ; 0x021EC5FC
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	ldr r1, [sp, #0x1c]
	str r2, [r4]
	cmp r1, #0
	beq _021EC64C
	cmp r1, #1
	bne _021EC630
	add r1, r3, #0
	add r3, sp, #0
	add r0, r2, #0
	ldrh r3, [r3, #0x14]
	ldr r2, [sp, #0x10]
	bl ov01_021EC678
	add r0, r4, #0
	bl ov01_021EC774
	ldr r1, [sp, #0x18]
	add r0, r4, #0
	mov r2, #1
	bl ov01_021EC790
	add sp, #8
	pop {r4, pc}
_021EC630:
	cmp r1, #2
	bne _021EC64C
	add r1, sp, #0
	ldrh r1, [r1, #0x14]
	ldr r4, [sp, #0x18]
	str r1, [sp]
	mov r1, #0x7f
	mul r1, r4
	str r1, [sp, #4]
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, [sp, #0x10]
	bl ov01_021EC6A4
_021EC64C:
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov01_021EC5FC

	thumb_func_start ov01_021EC650
ov01_021EC650: ; 0x021EC650
	push {r4, lr}
	mov r4, #1
	cmp r2, #0
	beq _021EC674
	cmp r2, #1
	bne _021EC666
	add r0, r1, #0
	bl ov01_021EC7AC
	add r4, r0, #0
	b _021EC674
_021EC666:
	cmp r2, #2
	bne _021EC674
	bl ov01_021EC728
	cmp r0, #0
	bne _021EC674
	mov r4, #0
_021EC674:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov01_021EC650

	thumb_func_start ov01_021EC678
ov01_021EC678: ; 0x021EC678
	push {r3, r4, r5, lr}
	sub sp, #8
	str r1, [sp]
	mov r1, #0
	add r4, r3, #0
	str r2, [sp, #4]
	mvn r1, r1
	mov r2, #1
	mov r3, #0
	add r5, r0, #0
	bl ov01_021EA864
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	add r2, r4, #0
	mov r3, #0x1f
	bl ov01_021EA89C
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021EC678

	thumb_func_start ov01_021EC6A4
ov01_021EC6A4: ; 0x021EC6A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r1, #0
	add r5, r0, #0
	add r0, r7, #0
	str r2, [sp]
	str r3, [sp, #4]
	ldr r4, [sp, #0x2c]
	bl ov01_021EA858
	str r0, [sp, #8]
	add r0, r7, #0
	bl ov01_021EA85C
	str r0, [sp, #0xc]
	add r0, r7, #0
	bl ov01_021EA860
	add r6, r0, #0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #4]
	add r0, r5, #4
	add r3, r4, #0
	str r7, [r5]
	bl ov01_021EB830
	add r0, sp, #0x18
	ldrh r7, [r0, #0x10]
	add r0, r5, #0
	mov r2, #0x1f
	add r1, r6, #0
	and r1, r2
	add r0, #0x18
	and r2, r7
	add r3, r4, #0
	bl ov01_021EB830
	add r0, r5, #0
	asr r1, r6, #5
	mov r3, #0x1f
	asr r2, r7, #5
	add r0, #0x2c
	and r1, r3
	and r2, r3
	add r3, r4, #0
	bl ov01_021EB830
	add r0, r5, #0
	asr r1, r6, #0xa
	mov r2, #0x1f
	asr r3, r7, #0xa
	and r1, r2
	and r2, r3
	add r0, #0x40
	add r3, r4, #0
	bl ov01_021EB830
	add r5, #0x54
	ldr r1, [sp, #8]
	ldr r2, [sp]
	add r0, r5, #0
	add r3, r4, #0
	bl ov01_021EB830
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021EC6A4

	thumb_func_start ov01_021EC728
ov01_021EC728: ; 0x021EC728
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r5, #4
	bl ov01_021EB840
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x18
	bl ov01_021EB840
	add r0, r5, #0
	add r0, #0x2c
	bl ov01_021EB840
	add r0, r5, #0
	add r0, #0x40
	bl ov01_021EB840
	add r0, r5, #0
	add r0, #0x54
	bl ov01_021EB840
	ldr r3, [r5, #0x40]
	ldr r0, [r5]
	lsl r6, r3, #0xa
	ldr r1, [r5, #0x54]
	ldr r2, [r5, #4]
	ldr r3, [r5, #0x18]
	ldr r5, [r5, #0x2c]
	lsl r5, r5, #5
	orr r3, r5
	orr r3, r6
	lsl r3, r3, #0x10
	lsr r3, r3, #0x10
	bl ov01_021EC678
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021EC728

	thumb_func_start ov01_021EC774
ov01_021EC774: ; 0x021EC774
	mov r2, #0
	add r3, r0, #0
	add r1, r2, #0
_021EC77A:
	add r0, r3, r2
	add r2, r2, #1
	strb r1, [r0, #4]
	cmp r2, #0x20
	blt _021EC77A
	ldr r0, [r3]
	add r1, r3, #4
	ldr r3, _021EC78C ; =ov01_021EA8C4
	bx r3
	.balign 4, 0
_021EC78C: .word ov01_021EA8C4
	thumb_func_end ov01_021EC774

	thumb_func_start ov01_021EC790
ov01_021EC790: ; 0x021EC790
	mov r3, #0x7f
	str r3, [r0, #0x24]
	mov r3, #0
	str r3, [r0, #0x28]
	strh r1, [r0, #0x2c]
	cmp r2, #1
	bne _021EC7A4
	mov r1, #1
	strh r1, [r0, #0x2e]
	bx lr
_021EC7A4:
	sub r1, r3, #1
	strh r1, [r0, #0x2e]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021EC790

	thumb_func_start ov01_021EC7AC
ov01_021EC7AC: ; 0x021EC7AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov01_021EC7E8
	add r4, r0, #0
	ldr r0, [r5, #0x28]
	cmp r0, #0
	bne _021EC7C4
	ldr r0, [r5]
	add r1, r5, #4
	bl ov01_021EA8C4
_021EC7C4:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021EC7AC

	thumb_func_start ov01_021EC7C8
ov01_021EC7C8: ; 0x021EC7C8
	push {r4, lr}
	add r4, r0, #0
	mov r2, #1
	str r2, [r4, #0x24]
	mov r1, #0
	str r1, [r4, #0x28]
	strh r1, [r4, #0x2c]
	strh r2, [r4, #0x2e]
	bl ov01_021EC828
	ldr r0, [r4]
	add r1, r4, #4
	bl ov01_021EA8C4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EC7C8

	thumb_func_start ov01_021EC7E8
ov01_021EC7E8: ; 0x021EC7E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0x2e
	ldrsh r1, [r5, r1]
	mov r4, #0
	cmp r1, #0
	bne _021EC7FA
	mov r4, #1
	b _021EC824
_021EC7FA:
	ldr r1, [r5, #0x24]
	cmp r1, #0
	bgt _021EC804
	mov r4, #1
	b _021EC824
_021EC804:
	ldr r1, [r5, #0x28]
	add r2, r1, #1
	str r2, [r5, #0x28]
	mov r1, #0x2c
	ldrsh r1, [r5, r1]
	cmp r2, r1
	blt _021EC824
	str r4, [r5, #0x28]
	bl ov01_021EC828
	ldr r0, [r5, #0x24]
	sub r0, r0, #1
	str r0, [r5, #0x24]
	cmp r0, #0
	bgt _021EC824
	mov r4, #1
_021EC824:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021EC7E8

	thumb_func_start ov01_021EC828
ov01_021EC828: ; 0x021EC828
	push {r3, r4}
	mov r1, #0x2e
	ldrsh r1, [r0, r1]
	ldr r2, [r0, #0x24]
	cmp r1, #0
	bge _021EC83A
	mov r1, #0x7f
	sub r2, r1, r2
	b _021EC83A
_021EC83A:
	asr r1, r2, #1
	lsr r1, r1, #0x1e
	add r1, r2, r1
	asr r4, r1, #2
	mov r3, #0x1f
	cmp r4, #0x1f
	bge _021EC856
_021EC848:
	sub r1, r3, r4
	lsl r2, r1, #2
	add r1, r0, r3
	sub r3, r3, #1
	strb r2, [r1, #4]
	cmp r3, r4
	bgt _021EC848
_021EC856:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021EC828

	thumb_func_start ov01_021EC85C
ov01_021EC85C: ; 0x021EC85C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r1, #0
	ldr r1, [sp, #0x28]
	str r0, [sp]
	str r1, [sp, #0x28]
	add r1, r2, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r7, [sp, #0x2c]
	blx r4
	ldr r0, [sp]
	mov r6, #0
	ldr r5, [r0, #0x40]
	str r6, [sp, #0x10]
	ldr r0, [r5, #0x34]
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _021EC8D2
	ldr r0, [sp]
	add r0, #0xc
	str r0, [sp]
_021EC88A:
	ldr r0, [sp]
	cmp r5, r0
	beq _021EC8D2
	mov r4, #0
	cmp r6, #0
	ble _021EC8A6
_021EC896:
	add r0, r5, #0
	blx r7
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _021EC8A6
	add r4, r4, #1
	cmp r4, r6
	blt _021EC896
_021EC8A6:
	ldr r5, [sp, #0xc]
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	ldr r0, [r0, #0x34]
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r1, r0
	blt _021EC8C6
	add r0, r1, #0
	ldr r1, [sp, #8]
	bl _s32_div_f
	cmp r1, #0
	bne _021EC8C6
	ldr r0, [sp, #0x28]
	add r6, r6, r0
_021EC8C6:
	ldr r0, [sp, #0x10]
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _021EC88A
_021EC8D2:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021EC85C

	thumb_func_start ov01_021EC8D8
ov01_021EC8D8: ; 0x021EC8D8
	mov r2, #0
	add r3, r0, #0
_021EC8DC:
	ldr r1, [r3, #0x48]
	cmp r1, #0
	bne _021EC8EC
	mov r1, #0x3c
	add r0, #0x48
	mul r1, r2
	add r0, r0, r1
	bx lr
_021EC8EC:
	add r2, r2, #1
	add r3, #0x3c
	cmp r2, #0x40
	blt _021EC8DC
	mov r0, #0
	bx lr
	thumb_func_end ov01_021EC8D8

	thumb_func_start ov01_021EC8F8
ov01_021EC8F8: ; 0x021EC8F8
	push {r3, lr}
	ldr r0, _021EC948 ; =0x00000F62
	ldrh r2, [r1, r0]
	cmp r2, #5
	bhi _021EC946
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021EC90E: ; jump table
	.short _021EC91A - _021EC90E - 2 ; case 0
	.short _021EC920 - _021EC90E - 2 ; case 1
	.short _021EC926 - _021EC90E - 2 ; case 2
	.short _021EC92C - _021EC90E - 2 ; case 3
	.short _021EC93A - _021EC90E - 2 ; case 4
	.short _021EC940 - _021EC90E - 2 ; case 5
_021EC91A:
	mov r2, #1
	strh r2, [r1, r0]
	pop {r3, pc}
_021EC920:
	mov r2, #3
	strh r2, [r1, r0]
	pop {r3, pc}
_021EC926:
	mov r2, #3
	strh r2, [r1, r0]
	pop {r3, pc}
_021EC92C:
	add r2, r0, #4
	ldrh r2, [r1, r2]
	cmp r2, #5
	bne _021EC946
	mov r2, #4
	strh r2, [r1, r0]
	pop {r3, pc}
_021EC93A:
	mov r2, #5
	strh r2, [r1, r0]
	pop {r3, pc}
_021EC940:
	ldr r0, [r1, #4]
	bl ov01_021EBCA4
_021EC946:
	pop {r3, pc}
	.balign 4, 0
_021EC948: .word 0x00000F62
	thumb_func_end ov01_021EC8F8

	thumb_func_start ov01_021EC94C
ov01_021EC94C: ; 0x021EC94C
	push {r4, r5, r6, lr}
	sub sp, #0x18
	ldr r0, _021ECB8C ; =0x00000F58
	add r4, r1, #0
	add r2, r0, #0
	add r2, #0xa
	ldrh r2, [r4, r2]
	ldr r5, [r4, r0]
	cmp r2, #5
	bhi _021ECA1A
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021EC96C: ; jump table
	.short _021EC978 - _021EC96C - 2 ; case 0
	.short _021EC9E2 - _021EC96C - 2 ; case 1
	.short _021ECA24 - _021EC96C - 2 ; case 2
	.short _021ECA96 - _021EC96C - 2 ; case 3
	.short _021ECAF4 - _021EC96C - 2 ; case 4
	.short _021ECB42 - _021EC96C - 2 ; case 5
_021EC978:
	mov r0, #0x14
	str r0, [sp]
	mov r2, #1
	str r2, [sp, #4]
	sub r0, r2, #2
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _021ECB90 ; =ov01_021ECBB4
	mov r3, #8
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl ov01_021EC504
	ldr r0, _021ECB94 ; =0x0000726F
	mov r2, #0x41
	str r0, [sp]
	ldr r0, _021ECB98 ; =0x00006B5A
	lsl r2, r2, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _021ECB9C ; =0x00000F64
	add r1, r5, #0
	ldrh r0, [r4, r0]
	add r1, #0x1c
	str r0, [sp, #0xc]
	ldr r3, [r4]
	add r0, r5, #0
	ldr r2, [r3, r2]
	add r0, #0x4c
	ldr r2, [r2, #0x4c]
	mov r3, #3
	bl ov01_021EC5FC
	mov r0, #0
	add r5, #0xb4
	str r0, [r5]
	ldr r0, _021ECBA0 ; =ov01_021EDA7C
	add r1, r4, #0
	mov r2, #0x64
	bl CreateSysTask
	ldr r1, _021ECBA4 ; =0x00000F6C
	mov r2, #0x1e
	str r0, [r4, r1]
	sub r0, r1, #4
	str r2, [r4, r0]
	mov r0, #1
	sub r1, #0xa
	strh r0, [r4, r1]
	b _021ECB60
_021EC9E2:
	add r0, r5, #0
	bl ov01_021EC538
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	ble _021ECA02
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	add r5, #0xb4
	sub r0, r0, #1
	str r0, [r5]
	b _021ECB60
_021ECA02:
	ldr r2, _021ECB9C ; =0x00000F64
	add r0, r5, #0
	ldrh r2, [r4, r2]
	add r5, #0x1c
	add r0, #0x4c
	add r1, r5, #0
	bl ov01_021EC650
	cmp r0, #1
	bne _021ECA1A
	cmp r6, #3
	beq _021ECA1C
_021ECA1A:
	b _021ECB60
_021ECA1C:
	ldr r0, _021ECBA8 ; =0x00000F62
	mov r1, #3
	strh r1, [r4, r0]
	b _021ECB60
_021ECA24:
	mov r2, #0x14
	mov r3, #1
	str r2, [sp]
	str r3, [sp, #4]
	sub r0, r3, #2
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _021ECB90 ; =ov01_021ECBB4
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl ov01_021EC504
	ldr r0, _021ECB9C ; =0x00000F64
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _021ECA66
	mov r0, #0x41
	ldr r1, [r4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r2, _021ECB94 ; =0x0000726F
	ldr r0, [r0, #0x4c]
	ldr r3, _021ECB98 ; =0x00006B5A
	mov r1, #3
	str r0, [r5, #0x1c]
	bl ov01_021EC678
	add r5, #0x1c
	add r0, r5, #0
	bl ov01_021EC7C8
_021ECA66:
	mov r0, #1
	str r0, [sp]
	ldr r0, _021ECBAC ; =ov01_021ECC70
	ldr r1, _021ECB90 ; =ov01_021ECBB4
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x14
	mov r3, #0xa
	bl ov01_021EC85C
	ldr r0, _021ECBA0 ; =ov01_021EDA7C
	add r1, r4, #0
	mov r2, #0x64
	bl CreateSysTask
	ldr r1, _021ECBA4 ; =0x00000F6C
	mov r2, #0x1e
	str r0, [r4, r1]
	sub r0, r1, #4
	str r2, [r4, r0]
	mov r0, #3
	sub r1, #0xa
	strh r0, [r4, r1]
	b _021ECB60
_021ECA96:
	mov r0, #6
	ldrsh r1, [r5, r0]
	sub r0, r1, #1
	strh r0, [r5, #6]
	cmp r1, #0
	bgt _021ECAB2
	mov r1, #4
	ldrsh r1, [r5, r1]
	add r0, r4, #0
	bl ov01_021ECBB4
	mov r0, #8
	ldrsh r0, [r5, r0]
	strh r0, [r5, #6]
_021ECAB2:
	ldr r0, _021ECBB0 ; =0x00000F66
	ldrh r0, [r4, r0]
	cmp r0, #5
	bne _021ECB60
	mov r0, #1
	mvn r0, r0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0
	mov r2, #8
	mov r3, #1
	bl ov01_021EC52C
	ldr r0, _021ECB9C ; =0x00000F64
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _021ECAE0
	add r0, r5, #0
	add r0, #0x1c
	mov r1, #1
	mov r2, #0
	bl ov01_021EC790
_021ECAE0:
	mov r0, #0
	add r5, #0xb4
	str r0, [r5]
	ldr r0, _021ECBA8 ; =0x00000F62
	mov r1, #4
	strh r1, [r4, r0]
	add r0, r4, #0
	bl ov01_021EDAE0
	b _021ECB60
_021ECAF4:
	add r0, r5, #0
	bl ov01_021EC538
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	ble _021ECB14
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	add r5, #0xb4
	sub r0, r0, #1
	str r0, [r5]
	b _021ECB60
_021ECB14:
	ldr r0, _021ECB9C ; =0x00000F64
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _021ECB26
	add r5, #0x1c
	add r0, r5, #0
	bl ov01_021EC7AC
	b _021ECB28
_021ECB26:
	mov r0, #1
_021ECB28:
	cmp r0, #1
	bne _021ECB60
	cmp r6, #3
	bne _021ECB60
	add r0, r4, #0
	ldr r1, [r4, #0x40]
	add r0, #0xc
	cmp r1, r0
	bne _021ECB60
	ldr r0, _021ECBA8 ; =0x00000F62
	mov r1, #5
	strh r1, [r4, r0]
	b _021ECB60
_021ECB42:
	add r0, #0xc
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _021ECB5A
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [r5, #0x1c]
	mov r1, #1
	add r3, r2, #0
	bl ov01_021EA864
_021ECB5A:
	ldr r0, [r4, #4]
	bl ov01_021EBCA4
_021ECB60:
	ldr r0, _021ECBA8 ; =0x00000F62
	ldrh r0, [r4, r0]
	cmp r0, #5
	beq _021ECB86
	cmp r0, #0
	beq _021ECB86
	add r0, r4, #0
	ldr r1, _021ECBAC ; =ov01_021ECC70
	add r0, #0xc
	bl ov01_021EC2E4
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov01_021EC470
	add r0, r4, #0
	bl ov01_021EC300
_021ECB86:
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_021ECB8C: .word 0x00000F58
_021ECB90: .word ov01_021ECBB4
_021ECB94: .word 0x0000726F
_021ECB98: .word 0x00006B5A
_021ECB9C: .word 0x00000F64
_021ECBA0: .word ov01_021EDA7C
_021ECBA4: .word 0x00000F6C
_021ECBA8: .word 0x00000F62
_021ECBAC: .word ov01_021ECC70
_021ECBB0: .word 0x00000F66
	thumb_func_end ov01_021EC94C

	thumb_func_start ov01_021ECBB4
ov01_021ECBB4: ; 0x021ECBB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r1, #0
	str r1, [sp, #4]
	cmp r0, #0
	ble _021ECC62
_021ECBC6:
	ldr r0, [sp]
	mov r1, #0x20
	bl ov01_021EC1F4
	add r6, r0, #0
	beq _021ECC62
	ldr r4, [r6, #8]
	bl MTRandom
	mov r1, #0
	str r1, [r4]
	mov r1, #3
	add r7, r0, #0
	bl _u32_div_f
	add r5, r1, #0
	lsl r1, r5, #0x10
	ldr r0, [r6, #4]
	lsr r1, r1, #0x10
	bl sub_020249D4
	add r0, r7, #0
	mov r1, #0x14
	bl _u32_div_f
	add r2, r5, #1
	mov r0, #0xa
	mul r0, r2
	add r0, r1, r0
	str r0, [r4, #8]
	cmp r5, #2
	bne _021ECC0C
	ldr r0, [r4, #8]
	add r0, #0xa
	str r0, [r4, #8]
_021ECC0C:
	add r0, r1, #0
	mov r1, #4
	mvn r1, r1
	bl _s32_div_f
	mov r1, #4
	add r2, r5, #1
	mvn r1, r1
	mul r1, r2
	add r0, r0, r1
	str r0, [r4, #0x10]
	cmp r5, #2
	bne _021ECC2C
	ldr r0, [r4, #0x10]
	sub r0, r0, #5
	str r0, [r4, #0x10]
_021ECC2C:
	mov r0, #0
	str r0, [r4, #0xc]
	add r0, r5, #1
	str r0, [r4, #4]
	ldr r1, _021ECC68 ; =0x0000010E
	add r0, r7, #0
	bl _u32_div_f
	mov r0, #0xf
	mul r0, r5
	add r0, r1, r0
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, _021ECC6C ; =0xFFFA0000
	add r1, sp, #0xc
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r6, #4]
	bl ov01_021EB5F4
	ldr r0, [sp, #8]
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	cmp r1, r0
	blt _021ECBC6
_021ECC62:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021ECC68: .word 0x0000010E
_021ECC6C: .word 0xFFFA0000
	thumb_func_end ov01_021ECBB4

	thumb_func_start ov01_021ECC70
ov01_021ECC70: ; 0x021ECC70
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r5, [r6, #8]
	add r0, sp, #0
	add r1, r6, #0
	bl ov01_021EC304
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _021ECC92
	cmp r0, #1
	beq _021ECCEA
	cmp r0, #2
	beq _021ECCFC
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_021ECC92:
	mov r4, #0
	mov r7, #2
_021ECC96:
	ldr r0, [r5, #0x10]
	ldr r1, [sp]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [r5, #8]
	ldr r1, [sp, #4]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #4]
	ldr r1, [r5]
	add r0, r1, #1
	str r0, [r5]
	ldr r0, [r5, #4]
	cmp r1, r0
	ble _021ECCD8
	bl MTRandom
	mov r1, #0xa
	bl _u32_div_f
	cmp r1, #7
	bhs _021ECCC8
	str r7, [r5, #0xc]
	b _021ECCD8
_021ECCC8:
	mov r0, #1
	str r0, [r5, #0xc]
	mov r0, #4
	str r0, [r5]
	ldr r0, [r6, #4]
	mov r1, #3
	bl sub_020249D4
_021ECCD8:
	add r4, r4, #1
	cmp r4, #2
	blt _021ECC96
	ldr r0, [r6, #4]
	add r1, sp, #0
	bl ov01_021EB5F4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_021ECCEA:
	ldr r1, [r5]
	sub r0, r1, #1
	str r0, [r5]
	cmp r1, #0
	bgt _021ECD02
	mov r0, #2
	add sp, #0xc
	str r0, [r5, #0xc]
	pop {r4, r5, r6, r7, pc}
_021ECCFC:
	add r0, r6, #0
	bl ov01_021EC29C
_021ECD02:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021ECC70

	thumb_func_start ov01_021ECD08
ov01_021ECD08: ; 0x021ECD08
	push {r4, r5, r6, lr}
	sub sp, #0x18
	ldr r0, _021ECF2C ; =0x00000F58
	add r5, r1, #0
	add r2, r0, #0
	add r2, #0xa
	ldrh r2, [r5, r2]
	ldr r4, [r5, r0]
	cmp r2, #5
	bhi _021ECDCC
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021ECD28: ; jump table
	.short _021ECD34 - _021ECD28 - 2 ; case 0
	.short _021ECD94 - _021ECD28 - 2 ; case 1
	.short _021ECDD6 - _021ECD28 - 2 ; case 2
	.short _021ECE3E - _021ECD28 - 2 ; case 3
	.short _021ECE96 - _021ECD28 - 2 ; case 4
	.short _021ECEE4 - _021ECD28 - 2 ; case 5
_021ECD34:
	mov r0, #6
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	sub r0, #8
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r2, #1
	ldr r0, _021ECF30 ; =ov01_021ECF4C
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r3, #0x1e
	bl ov01_021EC504
	ldr r0, _021ECF34 ; =0x0000726F
	mov r2, #0x41
	str r0, [sp]
	ldr r0, _021ECF38 ; =0x00006318
	add r1, r4, #0
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, _021ECF3C ; =0x00000F64
	lsl r2, r2, #2
	ldrh r0, [r5, r0]
	add r1, #0x1c
	str r0, [sp, #0xc]
	ldr r3, [r5]
	add r0, r4, #0
	ldr r2, [r3, r2]
	add r0, #0x4c
	ldr r2, [r2, #0x4c]
	mov r3, #3
	bl ov01_021EC5FC
	add r0, r4, #0
	mov r1, #8
	add r0, #0xb4
	str r1, [r0]
	mov r0, #0
	add r4, #0xb8
	str r0, [r4]
	ldr r0, _021ECF40 ; =0x00000F62
	mov r1, #1
	strh r1, [r5, r0]
	b _021ECF02
_021ECD94:
	add r0, r4, #0
	bl ov01_021EC538
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	ble _021ECDB4
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	add r4, #0xb4
	sub r0, r0, #1
	str r0, [r4]
	b _021ECF02
_021ECDB4:
	ldr r2, _021ECF3C ; =0x00000F64
	add r0, r4, #0
	ldrh r2, [r5, r2]
	add r4, #0x1c
	add r0, #0x4c
	add r1, r4, #0
	bl ov01_021EC650
	cmp r0, #1
	bne _021ECDCC
	cmp r6, #3
	beq _021ECDCE
_021ECDCC:
	b _021ECF02
_021ECDCE:
	ldr r0, _021ECF40 ; =0x00000F62
	mov r1, #3
	strh r1, [r5, r0]
	b _021ECF02
_021ECDD6:
	mov r2, #6
	mov r3, #3
	str r2, [sp]
	add r0, r3, #0
	str r3, [sp, #4]
	sub r0, #8
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, _021ECF30 ; =ov01_021ECF4C
	str r0, [sp, #0x14]
	add r0, r4, #0
	bl ov01_021EC504
	ldr r0, _021ECF3C ; =0x00000F64
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _021ECE1C
	mov r0, #0x41
	ldr r1, [r5]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r2, _021ECF34 ; =0x0000726F
	ldr r0, [r0, #0x4c]
	ldr r3, _021ECF38 ; =0x00006318
	mov r1, #3
	str r0, [r4, #0x1c]
	bl ov01_021EC678
	add r0, r4, #0
	add r0, #0x1c
	bl ov01_021EC7C8
_021ECE1C:
	mov r0, #0
	add r4, #0xb8
	str r0, [r4]
	mov r0, #3
	str r0, [sp]
	ldr r0, _021ECF44 ; =ov01_021ED070
	ldr r1, _021ECF30 ; =ov01_021ECF4C
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #0x14
	mov r3, #2
	bl ov01_021EC85C
	ldr r0, _021ECF40 ; =0x00000F62
	mov r1, #3
	strh r1, [r5, r0]
	b _021ECF02
_021ECE3E:
	mov r0, #6
	ldrsh r1, [r4, r0]
	sub r0, r1, #1
	strh r0, [r4, #6]
	cmp r1, #0
	bgt _021ECE5A
	mov r1, #4
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	bl ov01_021ECF4C
	mov r0, #8
	ldrsh r0, [r4, r0]
	strh r0, [r4, #6]
_021ECE5A:
	ldr r0, _021ECF48 ; =0x00000F66
	ldrh r0, [r5, r0]
	cmp r0, #5
	bne _021ECF02
	mov r0, #2
	mvn r0, r0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x1e
	mov r3, #5
	bl ov01_021EC52C
	ldr r0, _021ECF3C ; =0x00000F64
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _021ECE88
	add r0, r4, #0
	add r0, #0x1c
	mov r1, #1
	mov r2, #0
	bl ov01_021EC790
_021ECE88:
	mov r0, #0
	add r4, #0xb4
	str r0, [r4]
	ldr r0, _021ECF40 ; =0x00000F62
	mov r1, #4
	strh r1, [r5, r0]
	b _021ECF02
_021ECE96:
	add r0, r4, #0
	bl ov01_021EC538
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	ble _021ECEB6
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	add r4, #0xb4
	sub r0, r0, #1
	str r0, [r4]
	b _021ECF02
_021ECEB6:
	ldr r0, _021ECF3C ; =0x00000F64
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _021ECEC8
	add r4, #0x1c
	add r0, r4, #0
	bl ov01_021EC7AC
	b _021ECECA
_021ECEC8:
	mov r0, #1
_021ECECA:
	cmp r0, #1
	bne _021ECF02
	cmp r6, #3
	bne _021ECF02
	add r0, r5, #0
	ldr r1, [r5, #0x40]
	add r0, #0xc
	cmp r1, r0
	bne _021ECF02
	ldr r0, _021ECF40 ; =0x00000F62
	mov r1, #5
	strh r1, [r5, r0]
	b _021ECF02
_021ECEE4:
	add r0, #0xc
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _021ECEFC
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [r4, #0x1c]
	mov r1, #1
	add r3, r2, #0
	bl ov01_021EA864
_021ECEFC:
	ldr r0, [r5, #4]
	bl ov01_021EBCA4
_021ECF02:
	ldr r0, _021ECF40 ; =0x00000F62
	ldrh r0, [r5, r0]
	cmp r0, #5
	beq _021ECF28
	cmp r0, #0
	beq _021ECF28
	add r0, r5, #0
	ldr r1, _021ECF44 ; =ov01_021ED070
	add r0, #0xc
	bl ov01_021EC2E4
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov01_021EC470
	add r0, r5, #0
	bl ov01_021EC300
_021ECF28:
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021ECF2C: .word 0x00000F58
_021ECF30: .word ov01_021ECF4C
_021ECF34: .word 0x0000726F
_021ECF38: .word 0x00006318
_021ECF3C: .word 0x00000F64
_021ECF40: .word 0x00000F62
_021ECF44: .word ov01_021ED070
_021ECF48: .word 0x00000F66
	thumb_func_end ov01_021ECD08

	thumb_func_start ov01_021ECF4C
ov01_021ECF4C: ; 0x021ECF4C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	ldr r3, _021ED064 ; =ov01_0220673C
	add r2, sp, #0x48
	str r0, [sp]
	str r1, [sp, #4]
	ldmia r3!, {r0, r1}
	str r2, [sp, #0x10]
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r3, _021ED068 ; =ov01_0220674C
	add r2, sp, #0x38
	str r2, [sp, #0x14]
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r1, _021ED06C ; =0x00000F58
	ldr r0, [sp]
	ldr r6, [r0, r1]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _021ED060
	add r0, r6, #0
	str r0, [sp, #0x18]
	add r0, #0xb8
	str r0, [sp, #0x18]
	mov r0, #7
	mvn r0, r0
	lsl r0, r0, #0xc
	str r0, [sp, #0x1c]
_021ECF90:
	ldr r0, [sp]
	mov r1, #0x20
	bl ov01_021EC1F4
	add r4, r0, #0
	beq _021ED060
	ldr r0, [sp, #0x18]
	ldr r5, [r4, #8]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	add r0, r6, #0
	add r0, #0xb8
	ldr r1, [r0]
	mov r0, #0x32
	lsl r0, r0, #4
	cmp r1, r0
	blt _021ECFBE
	add r1, r6, #0
	add r1, #0xb8
	mov r0, #0
	str r0, [r1]
_021ECFBE:
	add r0, r6, #0
	add r0, #0xb8
	ldr r0, [r0]
	mov r1, #0xc8
	bl _s32_div_f
	lsl r0, r0, #2
	ldr r1, [sp, #0x10]
	str r0, [sp, #8]
	ldr r0, [r1, r0]
	str r0, [r5, #0x14]
	mov r0, #0
	str r0, [r5]
	bl MTRandom
	mov r1, #0x2a
	bl _u32_div_f
	add r0, r1, #4
	str r0, [r5, #4]
	sub r0, r0, #4
	mov r1, #0xf
	bl _s32_div_f
	add r7, r0, #0
	lsl r1, r7, #0x10
	ldr r0, [r4, #4]
	lsr r1, r1, #0x10
	bl sub_020249D4
	add r0, r7, #1
	neg r1, r0
	str r1, [r5, #0x10]
	ldr r2, [sp, #0x14]
	ldr r1, [sp, #8]
	ldr r1, [r2, r1]
	mul r1, r0
	str r1, [r5, #8]
	mov r0, #0
	str r0, [r5, #0xc]
	add r0, sp, #0x20
	add r1, r4, #0
	bl ov01_021EC304
	add r3, sp, #0x20
	ldmia r3!, {r0, r1}
	add r2, sp, #0x2c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bl MTRandom
	mov r1, #0x69
	lsl r1, r1, #2
	bl _u32_div_f
	mov r0, #1
	sub r2, r0, r7
	sub r0, #0x15
	mul r0, r2
	add r1, r0, r1
	mov r0, #7
	mvn r0, r0
	str r0, [sp, #0x30]
	mov r0, #0
	str r0, [sp, #0x34]
	str r1, [sp, #0x2c]
	lsl r0, r1, #0xc
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x1c]
	add r1, sp, #0x2c
	str r0, [sp, #0x30]
	ldr r0, [r4, #4]
	bl ov01_021EB5F4
	ldr r0, [sp, #0xc]
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _021ECF90
_021ED060:
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021ED064: .word ov01_0220673C
_021ED068: .word ov01_0220674C
_021ED06C: .word 0x00000F58
	thumb_func_end ov01_021ECF4C

	thumb_func_start ov01_021ED070
ov01_021ED070: ; 0x021ED070
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r0, sp, #0
	add r1, r5, #0
	ldr r4, [r5, #8]
	bl ov01_021EC304
	add r3, sp, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0xc
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _021ED09A
	cmp r0, #1
	beq _021ED0E6
	add sp, #0x18
	pop {r3, r4, r5, pc}
_021ED09A:
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r1, [sp, #0x10]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #0x10]
	ldr r1, [r4]
	add r0, r1, #1
	str r0, [r4]
	ldr r0, [r4, #4]
	cmp r1, r0
	ble _021ED0BE
	mov r0, #1
	str r0, [r4, #0xc]
_021ED0BE:
	ldr r0, [r4]
	ldr r1, [r4, #0x14]
	bl _s32_div_f
	cmp r1, #0
	bne _021ED0DA
	ldr r0, [r4, #0x10]
	sub r0, r0, #1
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #1
	ble _021ED0DA
	sub r0, r0, #1
	str r0, [r4, #8]
_021ED0DA:
	ldr r0, [r5, #4]
	add r1, sp, #0xc
	bl ov01_021EB5F4
	add sp, #0x18
	pop {r3, r4, r5, pc}
_021ED0E6:
	add r0, r5, #0
	bl ov01_021EC29C
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021ED070

	thumb_func_start ov01_021ED0F0
ov01_021ED0F0: ; 0x021ED0F0
	push {r4, r5, r6, lr}
	sub sp, #0x18
	ldr r0, _021ED2FC ; =0x00000F58
	add r5, r1, #0
	add r2, r0, #0
	add r2, #0xa
	ldrh r2, [r5, r2]
	ldr r4, [r5, r0]
	cmp r2, #5
	bhi _021ED1AA
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021ED110: ; jump table
	.short _021ED11C - _021ED110 - 2 ; case 0
	.short _021ED172 - _021ED110 - 2 ; case 1
	.short _021ED1B4 - _021ED110 - 2 ; case 2
	.short _021ED212 - _021ED110 - 2 ; case 3
	.short _021ED26A - _021ED110 - 2 ; case 4
	.short _021ED2B4 - _021ED110 - 2 ; case 5
_021ED11C:
	mov r0, #0x14
	str r0, [sp]
	mov r2, #2
	str r2, [sp, #4]
	sub r0, r2, #4
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r0, _021ED300 ; =ov01_021ED31C
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r3, #0x10
	bl ov01_021EC504
	ldr r0, _021ED304 ; =0x0000716F
	mov r2, #0x41
	str r0, [sp]
	ldr r0, _021ED308 ; =0x00006B5A
	lsl r2, r2, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _021ED30C ; =0x00000F64
	add r1, r4, #0
	ldrh r0, [r5, r0]
	add r1, #0x1c
	str r0, [sp, #0xc]
	ldr r3, [r5]
	add r0, r4, #0
	ldr r2, [r3, r2]
	add r0, #0x4c
	ldr r2, [r2, #0x4c]
	mov r3, #3
	bl ov01_021EC5FC
	mov r0, #0
	add r4, #0xb4
	str r0, [r4]
	ldr r0, _021ED310 ; =0x00000F62
	mov r1, #1
	strh r1, [r5, r0]
	b _021ED2D2
_021ED172:
	add r0, r4, #0
	bl ov01_021EC538
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	ble _021ED192
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	add r4, #0xb4
	sub r0, r0, #1
	str r0, [r4]
	b _021ED2D2
_021ED192:
	ldr r2, _021ED30C ; =0x00000F64
	add r0, r4, #0
	ldrh r2, [r5, r2]
	add r4, #0x1c
	add r0, #0x4c
	add r1, r4, #0
	bl ov01_021EC650
	cmp r0, #1
	bne _021ED1AA
	cmp r6, #3
	beq _021ED1AC
_021ED1AA:
	b _021ED2D2
_021ED1AC:
	ldr r0, _021ED310 ; =0x00000F62
	mov r1, #3
	strh r1, [r5, r0]
	b _021ED2D2
_021ED1B4:
	mov r2, #0x14
	mov r3, #2
	str r2, [sp]
	str r3, [sp, #4]
	sub r0, r3, #4
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r0, _021ED300 ; =ov01_021ED31C
	str r3, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, r4, #0
	bl ov01_021EC504
	ldr r0, _021ED30C ; =0x00000F64
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _021ED1F6
	mov r0, #0x41
	ldr r1, [r5]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r2, _021ED304 ; =0x0000716F
	ldr r0, [r0, #0x4c]
	ldr r3, _021ED308 ; =0x00006B5A
	mov r1, #3
	str r0, [r4, #0x1c]
	bl ov01_021EC678
	add r4, #0x1c
	add r0, r4, #0
	bl ov01_021EC7C8
_021ED1F6:
	mov r0, #1
	str r0, [sp]
	ldr r0, _021ED314 ; =ov01_021ED44C
	ldr r1, _021ED300 ; =ov01_021ED31C
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #0x14
	mov r3, #0xa
	bl ov01_021EC85C
	ldr r0, _021ED310 ; =0x00000F62
	mov r1, #3
	strh r1, [r5, r0]
	b _021ED2D2
_021ED212:
	mov r0, #6
	ldrsh r1, [r4, r0]
	sub r0, r1, #1
	strh r0, [r4, #6]
	cmp r1, #0
	bgt _021ED22E
	mov r1, #4
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	bl ov01_021ED31C
	mov r0, #8
	ldrsh r0, [r4, r0]
	strh r0, [r4, #6]
_021ED22E:
	ldr r0, _021ED318 ; =0x00000F66
	ldrh r0, [r5, r0]
	cmp r0, #5
	bne _021ED2D2
	mov r0, #9
	mvn r0, r0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x10
	mov r3, #6
	bl ov01_021EC52C
	ldr r0, _021ED30C ; =0x00000F64
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _021ED25C
	add r0, r4, #0
	add r0, #0x1c
	mov r1, #1
	mov r2, #0
	bl ov01_021EC790
_021ED25C:
	mov r0, #0x14
	add r4, #0xb4
	str r0, [r4]
	ldr r0, _021ED310 ; =0x00000F62
	mov r1, #4
	strh r1, [r5, r0]
	b _021ED2D2
_021ED26A:
	add r0, r4, #0
	bl ov01_021EC538
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	ble _021ED28A
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	add r4, #0xb4
	sub r0, r0, #1
	str r0, [r4]
	b _021ED2D2
_021ED28A:
	ldr r2, _021ED30C ; =0x00000F64
	add r0, r4, #0
	ldrh r2, [r5, r2]
	add r4, #0x1c
	add r0, #0x4c
	add r1, r4, #0
	bl ov01_021EC650
	cmp r0, #1
	bne _021ED2D2
	cmp r6, #3
	bne _021ED2D2
	add r0, r5, #0
	ldr r1, [r5, #0x40]
	add r0, #0xc
	cmp r1, r0
	bne _021ED2D2
	ldr r0, _021ED310 ; =0x00000F62
	mov r1, #5
	strh r1, [r5, r0]
	b _021ED2D2
_021ED2B4:
	add r0, #0xc
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _021ED2CC
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [r4, #0x1c]
	mov r1, #1
	add r3, r2, #0
	bl ov01_021EA864
_021ED2CC:
	ldr r0, [r5, #4]
	bl ov01_021EBCA4
_021ED2D2:
	ldr r0, _021ED310 ; =0x00000F62
	ldrh r0, [r5, r0]
	cmp r0, #5
	beq _021ED2F8
	cmp r0, #0
	beq _021ED2F8
	add r0, r5, #0
	ldr r1, _021ED314 ; =ov01_021ED44C
	add r0, #0xc
	bl ov01_021EC2E4
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov01_021EC470
	add r0, r5, #0
	bl ov01_021EC300
_021ED2F8:
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021ED2FC: .word 0x00000F58
_021ED300: .word ov01_021ED31C
_021ED304: .word 0x0000716F
_021ED308: .word 0x00006B5A
_021ED30C: .word 0x00000F64
_021ED310: .word 0x00000F62
_021ED314: .word ov01_021ED44C
_021ED318: .word 0x00000F66
	thumb_func_end ov01_021ED0F0

	thumb_func_start ov01_021ED31C
ov01_021ED31C: ; 0x021ED31C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r1, #0
	str r1, [sp, #4]
	cmp r0, #0
	bgt _021ED330
	b _021ED448
_021ED330:
	ldr r0, [sp]
	mov r1, #0x20
	bl ov01_021EC1F4
	add r4, r0, #0
	bne _021ED33E
	b _021ED448
_021ED33E:
	ldr r5, [r4, #8]
	mov r0, #0
	str r0, [r5]
	bl MTRandom
	mov r1, #5
	bl _u32_div_f
	add r0, r1, #7
	str r0, [r5, #4]
	bl MTRandom
	mov r1, #0xfa
	lsl r1, r1, #2
	bl _u32_div_f
	lsr r2, r1, #0x1f
	lsl r1, r1, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	bne _021ED370
	mov r0, #1
	b _021ED374
_021ED370:
	mov r0, #0
	mvn r0, r0
_021ED374:
	str r0, [r5, #8]
	mov r0, #1
	str r0, [r5, #0xc]
	bl MTRandom
	mov r1, #6
	bl _u32_div_f
	add r0, r1, #3
	str r0, [r5, #0x10]
	bl MTRandom
	mov r1, #5
	bl _u32_div_f
	add r0, r1, #4
	str r0, [r5, #0x14]
	bl MTRandom
	mov r1, #0x14
	bl _u32_div_f
	str r1, [sp, #8]
	add r0, sp, #0x10
	add r1, r4, #0
	bl ov01_021EC304
	bl MTRandom
	mov r1, #6
	lsl r1, r1, #6
	bl _u32_div_f
	sub r1, #0x40
	str r1, [sp, #0x10]
	bl MTRandom
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, [sp, #0x10]
	sub r1, #8
	lsl r0, r0, #0xc
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	lsl r0, r1, #0xc
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [r4, #4]
	add r1, sp, #0x10
	bl ov01_021EB5F4
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x10]
	asr r1, r1, #0xc
	asr r0, r0, #0xc
	str r1, [sp, #0x14]
	mov r1, #3
	str r0, [sp, #0x10]
	bl _s32_div_f
	mov r1, #0x32
	sub r6, r1, r0
	mov r1, #0xce
	sub r7, r1, r0
	bpl _021ED406
	bl MTRandom
	neg r1, r7
	bl _u32_div_f
	sub r1, r6, r1
	b _021ED412
_021ED406:
	bl MTRandom
	add r1, r7, #0
	bl _u32_div_f
	add r1, r6, r1
_021ED412:
	ldr r0, [sp, #0x14]
	cmp r6, r0
	bgt _021ED424
	cmp r1, r0
	blt _021ED424
	ldr r0, [r5, #4]
	lsl r0, r0, #1
	str r0, [r5, #4]
	b _021ED42E
_021ED424:
	bl MTRandom
	mov r1, #3
	and r0, r1
	str r0, [sp, #8]
_021ED42E:
	ldr r1, [sp, #8]
	ldr r0, [r4, #4]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_020249D4
	ldr r0, [sp, #0xc]
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #0xc]
	cmp r1, r0
	bge _021ED448
	b _021ED330
_021ED448:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021ED31C

	thumb_func_start ov01_021ED44C
ov01_021ED44C: ; 0x021ED44C
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r4, [r5, #8]
	add r0, sp, #0
	add r1, r5, #0
	bl ov01_021EC304
	ldr r0, [r4]
	add r1, r0, #1
	str r1, [r4]
	ldr r0, [r4, #4]
	cmp r1, r0
	blt _021ED46E
	add r0, r5, #0
	bl ov01_021EC29C
_021ED46E:
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021ED44C

	thumb_func_start ov01_021ED474
ov01_021ED474: ; 0x021ED474
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r2, #0
	ldr r2, _021ED580 ; =0x00000F62
	add r4, r0, #0
	ldrh r0, [r4, r2]
	add r5, r1, #0
	cmp r0, #5
	bhi _021ED57A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021ED492: ; jump table
	.short _021ED49E - _021ED492 - 2 ; case 0
	.short _021ED4CE - _021ED492 - 2 ; case 1
	.short _021ED4E8 - _021ED492 - 2 ; case 2
	.short _021ED518 - _021ED492 - 2 ; case 3
	.short _021ED53C - _021ED492 - 2 ; case 4
	.short _021ED55C - _021ED492 - 2 ; case 5
_021ED49E:
	str r3, [sp]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	add r5, #0x30
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	str r0, [sp, #8]
	add r0, r2, #2
	ldrh r0, [r4, r0]
	mov r2, #0x41
	lsl r2, r2, #2
	str r0, [sp, #0xc]
	ldr r3, [r4]
	add r0, r5, #0
	ldr r2, [r3, r2]
	add r3, r6, #0
	ldr r2, [r2, #0x4c]
	bl ov01_021EC5FC
	ldr r0, _021ED580 ; =0x00000F62
	mov r1, #1
	add sp, #0x10
	strh r1, [r4, r0]
	pop {r4, r5, r6, pc}
_021ED4CE:
	add r2, r2, #2
	ldrh r2, [r4, r2]
	add r5, #0x30
	add r0, r5, #0
	bl ov01_021EC650
	cmp r0, #1
	bne _021ED57A
	ldr r0, _021ED580 ; =0x00000F62
	mov r1, #3
	add sp, #0x10
	strh r1, [r4, r0]
	pop {r4, r5, r6, pc}
_021ED4E8:
	add r0, r2, #2
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _021ED50E
	mov r0, #0x41
	ldr r1, [r4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r2, r3, #0
	ldr r0, [r0, #0x4c]
	add r3, sp, #0x10
	str r0, [r5]
	ldrh r3, [r3, #0x10]
	add r1, r6, #0
	bl ov01_021EC678
	add r0, r5, #0
	bl ov01_021EC7C8
_021ED50E:
	ldr r0, _021ED580 ; =0x00000F62
	mov r1, #3
	add sp, #0x10
	strh r1, [r4, r0]
	pop {r4, r5, r6, pc}
_021ED518:
	add r0, r2, #4
	ldrh r0, [r4, r0]
	cmp r0, #5
	bne _021ED57A
	add r0, r2, #2
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _021ED532
	ldr r1, [sp, #0x28]
	add r0, r5, #0
	mov r2, #0
	bl ov01_021EC790
_021ED532:
	ldr r0, _021ED580 ; =0x00000F62
	mov r1, #4
	add sp, #0x10
	strh r1, [r4, r0]
	pop {r4, r5, r6, pc}
_021ED53C:
	add r0, r2, #2
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _021ED54C
	add r0, r5, #0
	bl ov01_021EC7AC
	b _021ED54E
_021ED54C:
	mov r0, #1
_021ED54E:
	cmp r0, #1
	bne _021ED57A
	ldr r0, _021ED580 ; =0x00000F62
	mov r1, #5
	add sp, #0x10
	strh r1, [r4, r0]
	pop {r4, r5, r6, pc}
_021ED55C:
	add r0, r2, #2
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _021ED574
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [r5]
	mov r1, #1
	add r3, r2, #0
	bl ov01_021EA864
_021ED574:
	ldr r0, [r4, #4]
	bl ov01_021EBCA4
_021ED57A:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021ED580: .word 0x00000F62
	thumb_func_end ov01_021ED474

	thumb_func_start ov01_021ED584
ov01_021ED584: ; 0x021ED584
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r0, _021ED700 ; =0x00000F58
	add r4, r1, #0
	add r1, r0, #0
	add r1, #0xa
	ldrh r1, [r4, r1]
	ldr r5, [r4, r0]
	cmp r1, #5
	bls _021ED59A
	b _021ED6FC
_021ED59A:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021ED5A6: ; jump table
	.short _021ED5B2 - _021ED5A6 - 2 ; case 0
	.short _021ED602 - _021ED5A6 - 2 ; case 1
	.short _021ED630 - _021ED5A6 - 2 ; case 2
	.short _021ED670 - _021ED5A6 - 2 ; case 3
	.short _021ED6A4 - _021ED5A6 - 2 ; case 4
	.short _021ED6DE - _021ED5A6 - 2 ; case 5
_021ED5B2:
	ldr r1, _021ED704 ; =0x00007555
	mov r2, #0x41
	str r1, [sp]
	ldr r1, _021ED708 ; =0x00007FFF
	add r0, #0xc
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	ldrh r0, [r4, r0]
	add r1, r5, #0
	lsl r2, r2, #2
	str r0, [sp, #0xc]
	ldr r3, [r4]
	add r0, r5, #0
	ldr r2, [r3, r2]
	add r0, #0x44
	ldr r2, [r2, #0x4c]
	add r1, #0x14
	mov r3, #6
	bl ov01_021EC5FC
	add r0, r5, #0
	mov r1, #0
	mov r2, #9
	mov r3, #0x1e
	bl ov01_021EB830
	mov r0, #0
	mov r1, #0x10
	bl ov01_021EB818
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, _021ED70C ; =0x00000F62
	mov r1, #1
	add sp, #0x10
	strh r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_021ED602:
	add r0, r5, #0
	add r0, #0x14
	bl ov01_021EC7AC
	add r6, r0, #0
	add r0, r5, #0
	bl ov01_021EB840
	add r7, r0, #0
	ldr r0, [r5]
	mov r1, #0x10
	sub r1, r1, r0
	bl ov01_021EB818
	cmp r6, #1
	bne _021ED6FC
	cmp r7, #1
	bne _021ED6FC
	ldr r0, _021ED70C ; =0x00000F62
	mov r1, #3
	add sp, #0x10
	strh r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_021ED630:
	add r0, #0xc
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _021ED656
	mov r0, #0x41
	ldr r1, [r4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r2, _021ED704 ; =0x00007555
	ldr r0, [r0, #0x4c]
	ldr r3, _021ED708 ; =0x00007FFF
	mov r1, #6
	str r0, [r5, #0x14]
	bl ov01_021EC678
	add r5, #0x14
	add r0, r5, #0
	bl ov01_021EC7C8
_021ED656:
	mov r0, #9
	mov r1, #7
	bl ov01_021EB818
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, _021ED70C ; =0x00000F62
	mov r1, #3
	add sp, #0x10
	strh r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_021ED670:
	add r1, r0, #0
	add r1, #0xe
	ldrh r1, [r4, r1]
	cmp r1, #5
	bne _021ED6FC
	add r0, #0xc
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _021ED68E
	add r0, r5, #0
	add r0, #0x14
	mov r1, #1
	mov r2, #0
	bl ov01_021EC790
_021ED68E:
	add r0, r5, #0
	mov r1, #9
	mov r2, #0
	mov r3, #0x1e
	bl ov01_021EB830
	ldr r0, _021ED70C ; =0x00000F62
	mov r1, #4
	add sp, #0x10
	strh r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_021ED6A4:
	add r0, #0xc
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _021ED6B8
	add r0, r5, #0
	add r0, #0x14
	bl ov01_021EC7AC
	add r6, r0, #0
	b _021ED6BA
_021ED6B8:
	mov r6, #1
_021ED6BA:
	add r0, r5, #0
	bl ov01_021EB840
	add r7, r0, #0
	ldr r0, [r5]
	mov r1, #0x10
	sub r1, r1, r0
	bl ov01_021EB818
	cmp r6, #1
	bne _021ED6FC
	cmp r7, #1
	bne _021ED6FC
	ldr r0, _021ED70C ; =0x00000F62
	mov r1, #5
	add sp, #0x10
	strh r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_021ED6DE:
	add r0, #0xc
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _021ED6F6
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [r5, #0x14]
	mov r1, #1
	add r3, r2, #0
	bl ov01_021EA864
_021ED6F6:
	ldr r0, [r4, #4]
	bl ov01_021EBCA4
_021ED6FC:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021ED700: .word 0x00000F58
_021ED704: .word 0x00007555
_021ED708: .word 0x00007FFF
_021ED70C: .word 0x00000F62
	thumb_func_end ov01_021ED584

	thumb_func_start ov01_021ED710
ov01_021ED710: ; 0x021ED710
	push {r3, r4, r5, r6, lr}
	sub sp, #0x4c
	add r6, r1, #0
	mov r0, #0x41
	ldr r1, [r6]
	lsl r0, r0, #2
	ldr r5, [r1, r0]
	ldr r0, _021ED900 ; =0x00000F58
	add r1, r0, #0
	add r1, #0xa
	ldrh r1, [r6, r1]
	ldr r4, [r6, r0]
	cmp r1, #5
	bls _021ED72E
	b _021ED8FA
_021ED72E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021ED73A: ; jump table
	.short _021ED746 - _021ED73A - 2 ; case 0
	.short _021ED79E - _021ED73A - 2 ; case 1
	.short _021ED7A8 - _021ED73A - 2 ; case 2
	.short _021ED800 - _021ED73A - 2 ; case 3
	.short _021ED81A - _021ED73A - 2 ; case 4
	.short _021ED8F4 - _021ED73A - 2 ; case 5
_021ED746:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	bl ov01_02203EA0
	ldr r1, _021ED904 ; =0x0000062C
	mov r3, #0
	str r0, [r4, r1]
	mov r0, #0xa
	str r0, [sp]
	str r3, [sp, #4]
	ldr r0, [r5, #0x4c]
	sub r1, r3, #1
	mov r2, #1
	bl ov01_021EA864
	mov r1, #0
	mov r2, #0
	ldr r0, [r5, #0x4c]
	mvn r1, r1
	add r3, r2, #0
	bl ov01_021EA89C
	mov r1, #0
	add r2, sp, #0x2c
	sub r0, r1, #1
_021ED77A:
	add r1, r1, #1
	strb r0, [r2]
	add r2, r2, #1
	cmp r1, #0x20
	blt _021ED77A
	ldr r0, [r5, #0x4c]
	add r1, sp, #0x2c
	bl ov01_021EA8C4
	mov r0, #0x63
	mov r1, #0
	lsl r0, r0, #4
	strh r1, [r4, r0]
	ldr r0, _021ED908 ; =0x00000F62
	mov r1, #1
	add sp, #0x4c
	strh r1, [r6, r0]
	pop {r3, r4, r5, r6, pc}
_021ED79E:
	mov r1, #3
	add r0, #0xa
	add sp, #0x4c
	strh r1, [r6, r0]
	pop {r3, r4, r5, r6, pc}
_021ED7A8:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	bl ov01_02203EA0
	ldr r1, _021ED904 ; =0x0000062C
	mov r3, #0
	str r0, [r4, r1]
	mov r0, #0xa
	str r0, [sp]
	str r3, [sp, #4]
	ldr r0, [r5, #0x4c]
	sub r1, r3, #1
	mov r2, #1
	bl ov01_021EA864
	mov r1, #0
	mov r2, #0
	ldr r0, [r5, #0x4c]
	mvn r1, r1
	add r3, r2, #0
	bl ov01_021EA89C
	mov r1, #0
	add r2, sp, #0xc
	sub r0, r1, #1
_021ED7DC:
	add r1, r1, #1
	strb r0, [r2]
	add r2, r2, #1
	cmp r1, #0x20
	blt _021ED7DC
	ldr r0, [r5, #0x4c]
	add r1, sp, #0xc
	bl ov01_021EA8C4
	mov r0, #0x63
	mov r1, #0
	lsl r0, r0, #4
	strh r1, [r4, r0]
	ldr r0, _021ED908 ; =0x00000F62
	mov r1, #3
	add sp, #0x4c
	strh r1, [r6, r0]
	pop {r3, r4, r5, r6, pc}
_021ED800:
	add r1, r0, #0
	add r1, #0xe
	ldrh r1, [r6, r1]
	cmp r1, #5
	bne _021ED8FA
	ldr r1, _021ED90C ; =0x00000632
	mov r2, #0
	strh r2, [r4, r1]
	mov r1, #4
	add r0, #0xa
	add sp, #0x4c
	strh r1, [r6, r0]
	pop {r3, r4, r5, r6, pc}
_021ED81A:
	ldr r0, _021ED90C ; =0x00000632
	ldrh r1, [r4, r0]
	cmp r1, #3
	bhi _021ED8FA
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021ED82E: ; jump table
	.short _021ED836 - _021ED82E - 2 ; case 0
	.short _021ED85A - _021ED82E - 2 ; case 1
	.short _021ED884 - _021ED82E - 2 ; case 2
	.short _021ED898 - _021ED82E - 2 ; case 3
_021ED836:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r1, #0
	str r0, [sp, #8]
	ldr r3, _021ED910 ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, _021ED90C ; =0x00000632
	add sp, #0x4c
	ldrh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	pop {r3, r4, r5, r6, pc}
_021ED85A:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021ED8FA
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r3, _021ED910 ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, _021ED90C ; =0x00000632
	add sp, #0x4c
	ldrh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	pop {r3, r4, r5, r6, pc}
_021ED884:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021ED8FA
	ldr r0, _021ED90C ; =0x00000632
	add sp, #0x4c
	ldrh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	pop {r3, r4, r5, r6, pc}
_021ED898:
	sub r1, r0, #2
	ldrh r1, [r4, r1]
	add r2, r1, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	sub r0, r0, #2
	ldrh r0, [r4, r0]
	bl _dfltu
	add r3, r1, #0
	add r2, r0, #0
	ldr r1, _021ED914 ; =0x40080000
	mov r0, #0
	bl _dmul
	ldr r3, _021ED918 ; =0x40380000
	mov r2, #0
	bl _ddiv
	add r3, r1, #0
	add r2, r0, #0
	ldr r1, _021ED91C ; =0x3FF00000
	mov r0, #0
	bl _dadd
	bl _d2f
	add r5, r0, #0
	ldr r0, _021ED904 ; =0x0000062C
	add r1, r5, #0
	ldr r0, [r4, r0]
	bl ov01_02203F2C
	add r0, r5, #0
	bl _f2d
	ldr r3, _021ED920 ; =0x40100000
	mov r2, #0
	bl _dgeq
	blo _021ED8FA
	ldr r0, _021ED908 ; =0x00000F62
	mov r1, #5
	add sp, #0x4c
	strh r1, [r6, r0]
	pop {r3, r4, r5, r6, pc}
_021ED8F4:
	ldr r0, [r6, #4]
	bl ov01_021EBCA4
_021ED8FA:
	add sp, #0x4c
	pop {r3, r4, r5, r6, pc}
	nop
_021ED900: .word 0x00000F58
_021ED904: .word 0x0000062C
_021ED908: .word 0x00000F62
_021ED90C: .word 0x00000632
_021ED910: .word 0x00007FFF
_021ED914: .word 0x40080000
_021ED918: .word 0x40380000
_021ED91C: .word 0x3FF00000
_021ED920: .word 0x40100000
	thumb_func_end ov01_021ED710

	thumb_func_start ov01_021ED924
ov01_021ED924: ; 0x021ED924
	push {r4, r5, r6, lr}
	sub sp, #0x48
	add r5, r1, #0
	mov r0, #0x41
	ldr r1, [r5]
	lsl r0, r0, #2
	ldr r4, [r1, r0]
	ldr r0, _021EDA40 ; =0x00000F58
	add r1, r0, #0
	add r1, #0xa
	ldrh r1, [r5, r1]
	ldr r6, [r5, r0]
	cmp r1, #5
	bhi _021EDA3A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021ED94C: ; jump table
	.short _021ED958 - _021ED94C - 2 ; case 0
	.short _021ED9B2 - _021ED94C - 2 ; case 1
	.short _021ED9BC - _021ED94C - 2 ; case 2
	.short _021EDA16 - _021ED94C - 2 ; case 3
	.short _021EDA2A - _021ED94C - 2 ; case 4
	.short _021EDA34 - _021ED94C - 2 ; case 5
_021ED958:
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	bl ov01_02203EA0
	ldr r1, _021EDA44 ; =0x0000062C
	mov r3, #0
	str r0, [r6, r1]
	mov r0, #0xa
	str r0, [sp]
	str r3, [sp, #4]
	ldr r0, [r4, #0x4c]
	sub r1, r3, #1
	mov r2, #1
	bl ov01_021EA864
	mov r1, #0
	mov r2, #0
	ldr r0, [r4, #0x4c]
	mvn r1, r1
	add r3, r2, #0
	bl ov01_021EA89C
	mov r1, #0
	add r2, sp, #0x28
	sub r0, r1, #1
_021ED98C:
	add r1, r1, #1
	strb r0, [r2]
	add r2, r2, #1
	cmp r1, #0x20
	blt _021ED98C
	ldr r0, [r4, #0x4c]
	add r1, sp, #0x28
	bl ov01_021EA8C4
	ldr r0, _021EDA44 ; =0x0000062C
	ldr r1, _021EDA48 ; =0x40800000
	ldr r0, [r6, r0]
	bl ov01_02203F2C
	ldr r0, _021EDA4C ; =0x00000F62
	mov r1, #1
	add sp, #0x48
	strh r1, [r5, r0]
	pop {r4, r5, r6, pc}
_021ED9B2:
	mov r1, #3
	add r0, #0xa
	add sp, #0x48
	strh r1, [r5, r0]
	pop {r4, r5, r6, pc}
_021ED9BC:
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	bl ov01_02203EA0
	ldr r1, _021EDA44 ; =0x0000062C
	mov r3, #0
	str r0, [r6, r1]
	mov r0, #0xa
	str r0, [sp]
	str r3, [sp, #4]
	ldr r0, [r4, #0x4c]
	sub r1, r3, #1
	mov r2, #1
	bl ov01_021EA864
	mov r1, #0
	mov r2, #0
	ldr r0, [r4, #0x4c]
	mvn r1, r1
	add r3, r2, #0
	bl ov01_021EA89C
	mov r1, #0
	add r2, sp, #8
	sub r0, r1, #1
_021ED9F0:
	add r1, r1, #1
	strb r0, [r2]
	add r2, r2, #1
	cmp r1, #0x20
	blt _021ED9F0
	ldr r0, [r4, #0x4c]
	add r1, sp, #8
	bl ov01_021EA8C4
	ldr r0, _021EDA44 ; =0x0000062C
	ldr r1, _021EDA48 ; =0x40800000
	ldr r0, [r6, r0]
	bl ov01_02203F2C
	ldr r0, _021EDA4C ; =0x00000F62
	mov r1, #3
	add sp, #0x48
	strh r1, [r5, r0]
	pop {r4, r5, r6, pc}
_021EDA16:
	add r1, r0, #0
	add r1, #0xe
	ldrh r1, [r5, r1]
	cmp r1, #5
	bne _021EDA3A
	mov r1, #4
	add r0, #0xa
	add sp, #0x48
	strh r1, [r5, r0]
	pop {r4, r5, r6, pc}
_021EDA2A:
	mov r1, #5
	add r0, #0xa
	add sp, #0x48
	strh r1, [r5, r0]
	pop {r4, r5, r6, pc}
_021EDA34:
	ldr r0, [r5, #4]
	bl ov01_021EBCA4
_021EDA3A:
	add sp, #0x48
	pop {r4, r5, r6, pc}
	nop
_021EDA40: .word 0x00000F58
_021EDA44: .word 0x0000062C
_021EDA48: .word 0x40800000
_021EDA4C: .word 0x00000F62
	thumb_func_end ov01_021ED924

	thumb_func_start ov01_021EDA50
ov01_021EDA50: ; 0x021EDA50
	push {lr}
	sub sp, #0xc
	ldr r0, _021EDA70 ; =0x00000421
	ldr r2, _021EDA74 ; =0x00000F58
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r0, r1, #0
	ldr r1, [r1, r2]
	ldr r3, _021EDA78 ; =0x00004B6F
	mov r2, #1
	bl ov01_021ED474
	add sp, #0xc
	pop {pc}
	.balign 4, 0
_021EDA70: .word 0x00000421
_021EDA74: .word 0x00000F58
_021EDA78: .word 0x00004B6F
	thumb_func_end ov01_021EDA50

	thumb_func_start ov01_021EDA7C
ov01_021EDA7C: ; 0x021EDA7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021EDAA8 ; =0x00000F68
	add r4, r1, #0
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bgt _021EDAA4
	ldr r1, _021EDAAC ; =0x00000638
	add r0, r4, #0
	bl ov01_021EDAB4
	add r0, r5, #0
	bl DestroySysTask
	ldr r0, _021EDAB0 ; =0x00000F6C
	mov r1, #0
	str r1, [r4, r0]
_021EDAA4:
	pop {r3, r4, r5, pc}
	nop
_021EDAA8: .word 0x00000F68
_021EDAAC: .word 0x00000638
_021EDAB0: .word 0x00000F6C
	thumb_func_end ov01_021EDA7C

	thumb_func_start ov01_021EDAB4
ov01_021EDAB4: ; 0x021EDAB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021EDADC ; =0x00000F5C
	add r4, r1, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021EDAC6
	bl GF_AssertFail
_021EDAC6:
	ldr r1, _021EDADC ; =0x00000F5C
	mov r0, #1
	str r0, [r5, r1]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	add r1, r1, #4
	strh r0, [r5, r1]
	bl PlaySE
	pop {r3, r4, r5, pc}
	nop
_021EDADC: .word 0x00000F5C
	thumb_func_end ov01_021EDAB4

	thumb_func_start ov01_021EDAE0
ov01_021EDAE0: ; 0x021EDAE0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xf6
	lsl r0, r0, #4
	ldrh r0, [r4, r0]
	mov r1, #0
	bl StopSE
	ldr r0, _021EDAF8 ; =0x00000F5C
	mov r1, #0
	str r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_021EDAF8: .word 0x00000F5C
	thumb_func_end ov01_021EDAE0

	.rodata

ov01_0220673C: ; 0x0220673C
	.word 16, 32, 16, 10

ov01_0220674C: ; 0x0220674C
	.word 2, 2, 2, 2

ov01_0220675C: ; 0x0220675C
	.byte 0x15, 0x00, 0x00, 0x00
	.byte 0x24, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00
	.byte 0x26, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x2A, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x1D, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00
	.byte 0x2F, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00
	.byte 0x34, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00, 0x36, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00

	.data

	.balign 4, 0
ov01_022098B0:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov01_021EC8F8
	.byte 0x00, 0x00, 0xFF, 0xFF, 0xDC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov01_021EC94C
	.byte 0x00, 0x00, 0xFF, 0xFF, 0xDC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov01_021EC94C
	.byte 0x00, 0x00, 0xFF, 0xFF, 0xDC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov01_021EC94C
	.byte 0x01, 0x00, 0xFF, 0xFF, 0xDC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov01_021ECD08
	.byte 0x01, 0x00, 0xFF, 0xFF, 0xDC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov01_021ECD08
	.byte 0x01, 0x00, 0xFF, 0xFF, 0xDC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov01_021ECD08
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov01_021EC8F8
	.byte 0x04, 0x00, 0xFF, 0xFF, 0xDC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov01_021ED0F0
	.byte 0xFF, 0xFF, 0x06, 0x00, 0xAC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov01_021ED584
	.byte 0xFF, 0xFF, 0x06, 0x00, 0xAC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov01_021ED584
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x34, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov01_021ED710
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x34, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov01_021ED924
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov01_021EDA50
