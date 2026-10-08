#include "constants/items.h"
#include "constants/moves.h"
	.include "macros.inc"
	.include "unk_02077678.inc"
	.include "global.inc"

	.rodata


	.type sMoveCategoryGfxPlttOverrides,@object
sMoveCategoryGfxPlttOverrides:
	.byte 0, 1, 0
	.size sMoveCategoryGfxPlttOverrides,.-sMoveCategoryGfxPlttOverrides
	.balign 4, 0

	.type sMoveCategoryGfxCharFileIds,@object
sMoveCategoryGfxCharFileIds:
	.word 244, 246, 245
	.size sMoveCategoryGfxCharFileIds,.-sMoveCategoryGfxCharFileIds

	.type sTypeIconGfxCharFileIds,@object
sTypeIconGfxCharFileIds:
	.word 234
	.word 225
	.word 227
	.word 235
	.word 229
	.word 237
	.word 231
	.word 228
	.word 238
	.word 236
	.word 226
	.word 241
	.word 233
	.word 222
	.word 223
	.word 230
	.word 221
	.word 224
	.word 240
	.word 219
	.word 220
	.word 232
	.word 239
	.size sTypeIconGfxCharFileIds,.-sTypeIconGfxCharFileIds

	.type sTypeIconGfxPlttOverrides,@object
sTypeIconGfxPlttOverrides:
	.byte 0, 0, 1, 1, 0, 0, 2, 1, 0, 2, 0, 1
	.byte 2, 0, 1, 1, 2, 0, 0, 1, 1, 2, 0
	.size sTypeIconGfxPlttOverrides,.-sTypeIconGfxPlttOverrides

	.text

	thumb_func_start GetTypeIconGfxCharFileId
GetTypeIconGfxCharFileId: ; 0x02077678
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x17
	blo _02077684
	bl GF_AssertFail
_02077684:
	ldr r0, _0207768C ; =sTypeIconGfxCharFileIds
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_0207768C: .word sTypeIconGfxCharFileIds
	thumb_func_end GetTypeIconGfxCharFileId

	thumb_func_start GetMoveTypeAndCategoryIconPlttFileId
GetMoveTypeAndCategoryIconPlttFileId: ; 0x02077690
	mov r0, #74
	bx lr
	thumb_func_end GetMoveTypeAndCategoryIconPlttFileId

	thumb_func_start GetMoveTypeAndCategoryIconCellFileId
GetMoveTypeAndCategoryIconCellFileId: ; 0x02077694
	mov r0, #242
	bx lr
	thumb_func_end GetMoveTypeAndCategoryIconCellFileId

	thumb_func_start GetMoveTypeAndCategoryIconAnimFileId
GetMoveTypeAndCategoryIconAnimFileId: ; 0x02077698
	mov r0, #243
	bx lr
	thumb_func_end GetMoveTypeAndCategoryIconAnimFileId

	thumb_func_start GetTypeIconGfxPlttOverride
GetTypeIconGfxPlttOverride: ; 0x0207769C
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x17
	blo _020776A8
	bl GF_AssertFail
_020776A8:
	ldr r0, _020776B0 ; =sTypeIconGfxPlttOverrides
	ldrb r0, [r0, r4]
	pop {r4, pc}
	nop
_020776B0: .word sTypeIconGfxPlttOverrides
	thumb_func_end GetTypeIconGfxPlttOverride

	thumb_func_start GetTypeIconGfxNarcId
GetTypeIconGfxNarcId: ; 0x020776B4
	mov r0, #8 // NARC_a_0_0_8
	bx lr
	thumb_func_end GetTypeIconGfxNarcId

	thumb_func_start SpriteSystem_LoadMoveTypeIconCharResObj
SpriteSystem_LoadMoveTypeIconCharResObj: ; 0x020776B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r3, #0
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl GetTypeIconGfxNarcId
	str r0, [sp, #0xc]
	add r0, r7, #0
	bl GetTypeIconGfxCharFileId
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
	thumb_func_end SpriteSystem_LoadMoveTypeIconCharResObj

	thumb_func_start SpriteSystem_LoadMoveTypeAndCategoryIconsPltt
SpriteSystem_LoadMoveTypeAndCategoryIconsPltt: ; 0x020776EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl GetTypeIconGfxNarcId
	str r0, [sp, #0x10]
	bl GetMoveTypeAndCategoryIconPlttFileId
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
	thumb_func_end SpriteSystem_LoadMoveTypeAndCategoryIconsPltt

	thumb_func_start SpriteSystem_LoadMoveTypeAndCategoryIconsPlttToBuffer
SpriteSystem_LoadMoveTypeAndCategoryIconsPlttToBuffer: ; 0x02077720
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #0x18]
	bl GetTypeIconGfxNarcId
	add r4, r0, #0
	bl GetMoveTypeAndCategoryIconPlttFileId
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
	thumb_func_end SpriteSystem_LoadMoveTypeAndCategoryIconsPlttToBuffer

	thumb_func_start SpriteSystem_LoadMoveTypeAndCategoryIconsCellAndAnim
SpriteSystem_LoadMoveTypeAndCategoryIconsCellAndAnim: ; 0x0207775C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl GetTypeIconGfxNarcId
	str r0, [sp, #8]
	bl GetMoveTypeAndCategoryIconCellFileId
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r2, [sp, #8]
	add r0, r5, #0
	add r1, r4, #0
	str r6, [sp, #4]
	bl SpriteSystem_LoadCellResObj
	bl GetTypeIconGfxNarcId
	add r6, r0, #0
	bl GetMoveTypeAndCategoryIconAnimFileId
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
	thumb_func_end SpriteSystem_LoadMoveTypeAndCategoryIconsCellAndAnim

	thumb_func_start SpriteManager_UnloadMoveTypeIconCharResObjByTag
SpriteManager_UnloadMoveTypeIconCharResObjByTag: ; 0x020777A4
	ldr r3, _020777A8 ; =SpriteManager_UnloadCharObjById
	bx r3
	.balign 4, 0
_020777A8: .word SpriteManager_UnloadCharObjById
	thumb_func_end SpriteManager_UnloadMoveTypeIconCharResObjByTag

	thumb_func_start SpriteManager_UnloadMoveTypeAndCategoryIconPlttResObjByTag
SpriteManager_UnloadMoveTypeAndCategoryIconPlttResObjByTag: ; 0x020777AC
	ldr r3, _020777B0 ; =SpriteManager_UnloadPlttObjById
	bx r3
	.balign 4, 0
_020777B0: .word SpriteManager_UnloadPlttObjById
	thumb_func_end SpriteManager_UnloadMoveTypeAndCategoryIconPlttResObjByTag

	thumb_func_start SpriteManager_UnloadMoveTypeAndCategoryIconCellAndAnimResObjsByTags
SpriteManager_UnloadMoveTypeAndCategoryIconCellAndAnimResObjsByTags: ; 0x020777B4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl SpriteManager_UnloadCellObjById
	add r0, r5, #0
	add r1, r4, #0
	bl SpriteManager_UnloadAnimObjById
	pop {r3, r4, r5, pc}
	thumb_func_end SpriteManager_UnloadMoveTypeAndCategoryIconCellAndAnimResObjsByTags

	thumb_func_start SpriteSystem_CreateMoveTypeIconSprite
SpriteSystem_CreateMoveTypeIconSprite: ; 0x020777C8
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
	bl GetTypeIconGfxPlttOverride
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r1, r7, #0
	add r2, sp, #0
	bl SpriteSystem_NewSprite
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	thumb_func_end SpriteSystem_CreateMoveTypeIconSprite

	thumb_func_start MoveTypeIconSprite_DeleteAndFreeResources
MoveTypeIconSprite_DeleteAndFreeResources: ; 0x020777F8
	ldr r3, _020777FC ; =Sprite_DeleteAndFreeResources
	bx r3
	.balign 4, 0
_020777FC: .word Sprite_DeleteAndFreeResources
	thumb_func_end MoveTypeIconSprite_DeleteAndFreeResources

	thumb_func_start GetMoveCategoryIconGfxCharFileId
GetMoveCategoryIconGfxCharFileId: ; 0x02077800
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #3
	blo _0207780C
	bl GF_AssertFail
_0207780C:
	ldr r0, _02077814 ; =sMoveCategoryGfxCharFileIds
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_02077814: .word sMoveCategoryGfxCharFileIds
	thumb_func_end GetMoveCategoryIconGfxCharFileId

	thumb_func_start GetMoveCategoryIconGfxPlttOverride
GetMoveCategoryIconGfxPlttOverride: ; 0x02077818
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #3
	blo _02077824
	bl GF_AssertFail
_02077824:
	ldr r0, _0207782C ; =sMoveCategoryGfxPlttOverrides
	ldrb r0, [r0, r4]
	pop {r4, pc}
	nop
_0207782C: .word sMoveCategoryGfxPlttOverrides
	thumb_func_end GetMoveCategoryIconGfxPlttOverride

	thumb_func_start GetMoveCategoryIconGfxNarcId
GetMoveCategoryIconGfxNarcId: ; 0x02077830
	mov r0, #8  // NARC_a_0_0_8
	bx lr
	thumb_func_end GetMoveCategoryIconGfxNarcId

	thumb_func_start SpriteSystem_LoadMoveCategoryIconCharResObj
SpriteSystem_LoadMoveCategoryIconCharResObj: ; 0x02077834
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r3, #0
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl GetMoveCategoryIconGfxNarcId
	str r0, [sp, #0xc]
	add r0, r7, #0
	bl GetMoveCategoryIconGfxCharFileId
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
	thumb_func_end SpriteSystem_LoadMoveCategoryIconCharResObj

	thumb_func_start SpriteManager_UnloadMoveCategoryIconCharResObjByTag
SpriteManager_UnloadMoveCategoryIconCharResObjByTag: ; 0x02077868
	ldr r3, _0207786C ; =SpriteManager_UnloadCharObjById
	bx r3
	.balign 4, 0
_0207786C: .word SpriteManager_UnloadCharObjById
	thumb_func_end SpriteManager_UnloadMoveCategoryIconCharResObjByTag

	thumb_func_start MoveCategoryIconSprite_DeleteAndFreeResources
MoveCategoryIconSprite_DeleteAndFreeResources: ; 0x02077870
	ldr r3, _02077874 ; =Sprite_DeleteAndFreeResources
	bx r3
	.balign 4, 0
_02077874: .word Sprite_DeleteAndFreeResources
	thumb_func_end MoveCategoryIconSprite_DeleteAndFreeResources
