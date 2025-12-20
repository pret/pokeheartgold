#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "unk_02077678.inc"
	.include "global.inc"

	.rodata

_02100038:
	.byte 0x00, 0x01, 0x00
	.balign 4, 0
_0210003C:
	.word 0xF4, 0xF6, 0xF5
_02100048:
	.word 0xEA
	.word 0xE1
	.word 0xE3
	.word 0xEB
	.word 0xE5
	.word 0xED
	.word 0xE7
	.word 0xE4
	.word 0xEE
	.word 0xEC
	.word 0xE2
	.word 0xF1
	.word 0xE9
	.word 0xDE
	.word 0xDF
	.word 0xE6
	.word 0xDD
	.word 0xE0
	.word 0xF0
	.word 0xDB
	.word 0xDC
	.word 0xE8
	.word 0xEF
_021000A4:
	.byte 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x02, 0x01, 0x00, 0x02, 0x00, 0x01
	.byte 0x02, 0x00, 0x01, 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x02, 0x00

	.text

	thumb_func_start sub_02077678
sub_02077678: ; 0x02077678
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x17
	blo _02077684
	bl GF_AssertFail
_02077684:
	ldr r0, _0207768C ; =_02100048
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_0207768C: .word _02100048
	thumb_func_end sub_02077678

	thumb_func_start sub_02077690
sub_02077690: ; 0x02077690
	mov r0, #0x4a
	bx lr
	thumb_func_end sub_02077690

	thumb_func_start sub_02077694
sub_02077694: ; 0x02077694
	mov r0, #0xf2
	bx lr
	thumb_func_end sub_02077694

	thumb_func_start sub_02077698
sub_02077698: ; 0x02077698
	mov r0, #0xf3
	bx lr
	thumb_func_end sub_02077698

	thumb_func_start sub_0207769C
sub_0207769C: ; 0x0207769C
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x17
	blo _020776A8
	bl GF_AssertFail
_020776A8:
	ldr r0, _020776B0 ; =_021000A4
	ldrb r0, [r0, r4]
	pop {r4, pc}
	nop
_020776B0: .word _021000A4
	thumb_func_end sub_0207769C

	thumb_func_start sub_020776B4
sub_020776B4: ; 0x020776B4
	mov r0, #8
	bx lr
	thumb_func_end sub_020776B4

	thumb_func_start sub_020776B8
sub_020776B8: ; 0x020776B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r3, #0
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl sub_020776B4
	str r0, [sp, #0xc]
	add r0, r7, #0
	bl sub_02077678
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x28]
	str r4, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	bl SpriteSystem_LoadCharResObj
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020776B8

	thumb_func_start sub_020776EC
sub_020776EC: ; 0x020776EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl sub_020776B4
	str r0, [sp, #0x10]
	bl sub_02077690
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	str r5, [sp, #8]
	ldr r2, [sp, #0x10]
	add r0, r6, #0
	add r1, r7, #0
	str r4, [sp, #0xc]
	bl SpriteSystem_LoadPlttResObj
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020776EC

	thumb_func_start sub_02077720
sub_02077720: ; 0x02077720
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #0x18]
	bl sub_020776B4
	add r4, r0, #0
	bl sub_02077690
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x30]
	ldr r3, [sp, #0x18]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x34]
	add r1, r6, #0
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r2, r7, #0
	bl SpriteSystem_LoadPaletteBuffer
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02077720

	thumb_func_start sub_0207775C
sub_0207775C: ; 0x0207775C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_020776B4
	str r0, [sp, #8]
	bl sub_02077694
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r2, [sp, #8]
	add r0, r5, #0
	add r1, r4, #0
	str r6, [sp, #4]
	bl SpriteSystem_LoadCellResObj
	bl sub_020776B4
	add r6, r0, #0
	bl sub_02077698
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	str r7, [sp, #4]
	bl SpriteSystem_LoadAnimResObj
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0207775C

	thumb_func_start sub_020777A4
sub_020777A4: ; 0x020777A4
	ldr r3, _020777A8 ; =SpriteManager_UnloadCharObjById
	bx r3
	.balign 4, 0
_020777A8: .word SpriteManager_UnloadCharObjById
	thumb_func_end sub_020777A4

	thumb_func_start sub_020777AC
sub_020777AC: ; 0x020777AC
	ldr r3, _020777B0 ; =SpriteManager_UnloadPlttObjById
	bx r3
	.balign 4, 0
_020777B0: .word SpriteManager_UnloadPlttObjById
	thumb_func_end sub_020777AC

	thumb_func_start sub_020777B4
sub_020777B4: ; 0x020777B4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl SpriteManager_UnloadCellObjById
	add r0, r5, #0
	add r1, r4, #0
	bl SpriteManager_UnloadAnimObjById
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020777B4

	thumb_func_start sub_020777C8
sub_020777C8: ; 0x020777C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r6, r3, #0
	add r4, r0, #0
	add r7, r1, #0
	add r5, sp, #0
	mov r3, #6
_020777D6:
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	sub r3, r3, #1
	bne _020777D6
	ldr r0, [r6]
	str r0, [r5]
	add r0, r2, #0
	bl sub_0207769C
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r1, r7, #0
	add r2, sp, #0
	bl SpriteSystem_NewSprite
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_020777C8

	thumb_func_start thunk_ManagedSprite_DeleteAndFreeResources
thunk_ManagedSprite_DeleteAndFreeResources: ; 0x020777F8
	ldr r3, _020777FC ; =Sprite_DeleteAndFreeResources
	bx r3
	.balign 4, 0
_020777FC: .word Sprite_DeleteAndFreeResources
	thumb_func_end thunk_ManagedSprite_DeleteAndFreeResources

	thumb_func_start sub_02077800
sub_02077800: ; 0x02077800
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #3
	blo _0207780C
	bl GF_AssertFail
_0207780C:
	ldr r0, _02077814 ; =_0210003C
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_02077814: .word _0210003C
	thumb_func_end sub_02077800

	thumb_func_start sub_02077818
sub_02077818: ; 0x02077818
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #3
	blo _02077824
	bl GF_AssertFail
_02077824:
	ldr r0, _0207782C ; =_02100038
	ldrb r0, [r0, r4]
	pop {r4, pc}
	nop
_0207782C: .word _02100038
	thumb_func_end sub_02077818

	thumb_func_start sub_02077830
sub_02077830: ; 0x02077830
	mov r0, #8
	bx lr
	thumb_func_end sub_02077830

	thumb_func_start sub_02077834
sub_02077834: ; 0x02077834
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r3, #0
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl sub_02077830
	str r0, [sp, #0xc]
	add r0, r7, #0
	bl sub_02077800
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x28]
	str r4, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	bl SpriteSystem_LoadCharResObj
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02077834

	thumb_func_start sub_02077868
sub_02077868: ; 0x02077868
	ldr r3, _0207786C ; =SpriteManager_UnloadCharObjById
	bx r3
	.balign 4, 0
_0207786C: .word SpriteManager_UnloadCharObjById
	thumb_func_end sub_02077868

	thumb_func_start sub_02077870
sub_02077870: ; 0x02077870
	ldr r3, _02077874 ; =Sprite_DeleteAndFreeResources
	bx r3
	.balign 4, 0
_02077874: .word Sprite_DeleteAndFreeResources
	thumb_func_end sub_02077870
