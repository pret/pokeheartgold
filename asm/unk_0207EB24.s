#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public _020FA484
	.public gNatureStatMods

	.text

	thumb_func_start sub_0207EB24
sub_0207EB24: ; 0x0207EB24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x20
	mov r1, #0xc
	bl GF_CreateVramTransferManager
	mov r0, #0xc
	bl sub_0200CF18
	ldr r1, _0207EBD0 ; =0x00000658
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl sub_0200CF38
	ldr r7, _0207EBD4 ; =0x0000065C
	add r2, sp, #0x24
	ldr r3, _0207EBD8 ; =_021018D8
	str r0, [r4, r7]
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r5, _0207EBDC ; =_021018C4
	stmia r2!, {r0, r1}
	add r3, sp, #0x10
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [r3]
	sub r0, r7, #4
	ldr r0, [r4, r0]
	mov r3, #0x20
	bl sub_0200CF70
	sub r1, r7, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x31
	bl sub_0200CFF4
	sub r0, r7, #4
	ldr r0, [r4, r0]
	bl sub_0200CF6C
	mov r2, #1
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r3, _0207EBE0 ; =_021018B4
	add r2, sp, #0
	mov r1, #7
_0207EBB0:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _0207EBB0
	ldr r1, _0207EBD0 ; =0x00000658
	add r2, sp, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D294
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0207EBD0: .word 0x00000658
_0207EBD4: .word 0x0000065C
_0207EBD8: .word _021018D8
_0207EBDC: .word _021018C4
_0207EBE0: .word _021018B4
	thumb_func_end sub_0207EB24

	thumb_func_start sub_0207EBE4
sub_0207EBE4: ; 0x0207EBE4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r5, r0, #0
	ldr r0, _0207ECCC ; =0x00000654
	str r3, [sp, #8]
	ldr r0, [r5, r0]
	add r4, r2, #0
	ldr r0, [r0]
	add r7, r1, #0
	bl GetPartyMonByIndex
	lsl r1, r4, #0x10
	asr r6, r1, #0x10
	add r4, r7, #0
	mov r1, #0x30
	mul r4, r1
	ldr r2, _0207ECD0 ; =0x0000083E
	add r3, r5, r4
	strh r6, [r3, r2]
	ldr r1, [sp, #8]
	add r2, r2, #2
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	str r1, [sp, #0xc]
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x10]
	strh r1, [r3, r2]
	add r7, r7, #4
	bl Pokemon_GetIconNaix
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r1, _0207ECD4 ; =0x00000658
	str r7, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x58]
	bl sub_0200E2B8
	ldr r0, [sp, #0x10]
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x14]
	str r7, [sp, #0x1c]
	add r1, sp, #0x1c
	strh r6, [r1, #4]
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x14]
	strh r0, [r1, #6]
	mov r0, #0
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	str r0, [sp, #0x28]
	ldr r0, _0207ECD8 ; =0x00000839
	add r7, r5, r0
	sub r0, #0xd
	add r0, r5, r0
	str r0, [sp, #0x18]
	ldrh r0, [r0, r4]
	ldrb r1, [r7, r4]
	bl GetMonIconPaletteEx
	add r0, r0, #3
	str r0, [sp, #0x2c]
	mov r0, #1
	str r0, [sp, #0x30]
	mov r0, #0
	ldr r1, _0207ECD4 ; =0x00000658
	str r0, [sp, #0x34]
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	str r0, [sp, #0x40]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, sp, #0x1c
	bl sub_0200D2B4
	ldr r1, _0207ECDC ; =0x0000084C
	add r2, r5, r4
	str r0, [r2, r1]
	mov r0, #1
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x18]
	ldrb r1, [r7, r4]
	ldrh r0, [r0, r4]
	ldr r2, [sp, #0x14]
	bl GetMonIconPaletteEx
	add r0, r0, #1
	str r0, [sp, #0x2c]
	add r2, sp, #0x1c
	strh r6, [r2, #4]
	mov r1, #1
	ldr r0, [sp, #8]
	lsl r1, r1, #8
	add r0, r0, r1
	strh r0, [r2, #6]
	ldr r1, _0207ECD4 ; =0x00000658
	add r2, sp, #0x1c
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl sub_0200D2B4
	mov r1, #0x85
	add r2, r5, r4
	lsl r1, r1, #4
	str r0, [r2, r1]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0207ECCC: .word 0x00000654
_0207ECD0: .word 0x0000083E
_0207ECD4: .word 0x00000658
_0207ECD8: .word 0x00000839
_0207ECDC: .word 0x0000084C
	thumb_func_end sub_0207EBE4

	thumb_func_start sub_0207ECE0
sub_0207ECE0: ; 0x0207ECE0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, _0207EDCC ; =0x00000654
	add r6, r1, #0
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r7, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xc]
	add r0, r7, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	mov r0, #0x14
	mov r1, #0xc
	bl NARC_ctor
	str r0, [sp, #0x10]
	mov r0, #0x30
	add r4, r6, #0
	mul r4, r0
	ldr r0, _0207EDD0 ; =0x0000084C
	add r6, r5, r0
	ldr r0, [r6, r4]
	bl sub_02024B1C
	mov r1, #1
	bl NNS_G2dGetImageLocation
	str r0, [sp, #0x14]
	add r0, r7, #0
	bl Pokemon_GetIconNaix
	add r1, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x10]
	mov r2, #0
	mov r3, #0xc
	bl GfGfxLoader_LoadFromOpenNarc
	add r1, sp, #0x18
	str r0, [sp, #4]
	bl NNS_G2dGetUnpackedCharacterData
	cmp r0, #0
	beq _0207ED8E
	ldr r1, [sp, #0x18]
	ldr r0, [r1, #0x14]
	ldr r1, [r1, #0x10]
	bl DC_FlushRange
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x14]
	ldr r0, [r2, #0x14]
	ldr r2, [r2, #0x10]
	bl GX_LoadOBJ
	mov r0, #0x85
	add r1, r5, r4
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl sub_02024B1C
	mov r1, #2
	bl NNS_G2dGetImageLocation
	ldr r1, [sp, #0x18]
	add r7, r0, #0
	ldr r0, [r1, #0x14]
	ldr r1, [r1, #0x10]
	bl DC_FlushRange
	ldr r2, [sp, #0x18]
	add r1, r7, #0
	ldr r0, [r2, #0x14]
	ldr r2, [r2, #0x10]
	bl GXS_LoadOBJ
_0207ED8E:
	ldr r0, [sp, #4]
	bl FreeToHeap
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	mov r2, #0
	bl GetMonIconPaletteEx
	add r1, r0, #0
	ldr r0, [r6, r4]
	add r1, r1, #3
	bl sub_0200DD08
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	mov r2, #0
	bl GetMonIconPaletteEx
	add r2, r0, #0
	mov r0, #0x85
	add r1, r5, r4
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, r2, #1
	bl sub_0200DD08
	ldr r0, [sp, #0x10]
	bl NARC_dtor
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207EDCC: .word 0x00000654
_0207EDD0: .word 0x0000084C
	thumb_func_end sub_0207ECE0

	thumb_func_start sub_0207EDD4
sub_0207EDD4: ; 0x0207EDD4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r1, _0207EF1C ; =0x00000658
	add r5, r0, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, _0207EF20 ; =_021018F8
	bl sub_0200D2B4
	ldr r1, _0207EF24 ; =0x00000678
	ldr r2, _0207EF28 ; =_02101920
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x20
	sub r1, #0x1c
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl sub_0200D2B4
	ldr r1, _0207EF2C ; =0x0000067C
	ldr r2, _0207EF30 ; =_02101948
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x24
	sub r1, #0x20
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl sub_0200D2B4
	mov r1, #0x1a
	lsl r1, r1, #6
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x28
	sub r1, #0x24
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _0207EF34 ; =_02101970
	bl sub_0200D2B4
	ldr r1, _0207EF38 ; =0x00000684
	ldr r2, _0207EF3C ; =_02101C68
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x2c
	sub r1, #0x28
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl sub_0200D2B4
	mov r1, #0x6d
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, _0207EF20 ; =_021018F8
	mov r4, #0
	str r4, [sp, #4]
	add r6, r5, #0
	str r0, [sp]
	add r7, r5, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
_0207EE52:
	ldr r0, _0207EF1C ; =0x00000658
	ldr r1, _0207EF40 ; =0x0000065C
	add r3, r4, #0
	ldr r2, [sp, #8]
	add r3, #0xa0
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r2, r3
	bl sub_0200D2B4
	ldr r1, _0207EF44 ; =0x00000688
	str r0, [r6, r1]
	ldr r1, [sp]
	mov r0, #0xa4
	ldrsh r1, [r1, r0]
	ldr r0, _0207EF48 ; =0x00000842
	strh r1, [r7, r0]
	ldr r1, [sp]
	mov r0, #0xa6
	ldrsh r1, [r1, r0]
	ldr r0, _0207EF4C ; =0x00000844
	strh r1, [r7, r0]
	ldr r0, _0207EF44 ; =0x00000688
	mov r1, #0
	ldr r0, [r6, r0]
	bl Set2dSpriteVisibleFlag
	mov r2, #0x19
	ldr r0, _0207EF1C ; =0x00000658
	ldr r1, _0207EF40 ; =0x0000065C
	lsl r2, r2, #4
	add r3, r4, r2
	ldr r2, [sp, #0xc]
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r2, r3
	bl sub_0200D2B4
	mov r1, #0x6a
	lsl r1, r1, #4
	mov r2, #0xa
	str r0, [r6, r1]
	add r0, r1, #0
	lsl r2, r2, #6
	sub r0, #0x48
	sub r1, #0x44
	add r3, r4, r2
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r2, r3
	bl sub_0200D2B4
	ldr r1, _0207EF50 ; =0x000006B8
	add r4, #0x28
	str r0, [r6, r1]
	ldr r0, [sp]
	add r6, r6, #4
	add r0, #0x28
	str r0, [sp]
	ldr r0, [sp, #4]
	add r7, #0x30
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #6
	blo _0207EE52
	add r7, r1, #0
	mov r6, #0
	add r4, r5, #0
	add r7, #0x90
_0207EEDE:
	ldr r0, _0207EF1C ; =0x00000658
	ldr r1, _0207EF40 ; =0x0000065C
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _0207EF54 ; =_02101C90
	bl sub_0200D2B4
	ldr r1, _0207EF58 ; =0x00000748
	str r0, [r4, r1]
	ldr r0, [r4, r7]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #6
	blo _0207EEDE
	ldr r0, _0207EF2C ; =0x0000067C
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0207EF1C: .word 0x00000658
_0207EF20: .word _021018F8
_0207EF24: .word 0x00000678
_0207EF28: .word _02101920
_0207EF2C: .word 0x0000067C
_0207EF30: .word _02101948
_0207EF34: .word _02101970
_0207EF38: .word 0x00000684
_0207EF3C: .word _02101C68
_0207EF40: .word 0x0000065C
_0207EF44: .word 0x00000688
_0207EF48: .word 0x00000842
_0207EF4C: .word 0x00000844
_0207EF50: .word 0x000006B8
_0207EF54: .word _02101C90
_0207EF58: .word 0x00000748
	thumb_func_end sub_0207EDD4

	thumb_func_start sub_0207EF5C
sub_0207EF5C: ; 0x0207EF5C
	push {r3, r4, r5, lr}
	sub sp, #0x28
	add r4, r1, #0
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	add r0, sp, #0
	strh r2, [r0, #4]
	strh r3, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	mov r0, #1
	str r1, [sp, #0x10]
	str r1, [sp, #0x18]
	str r1, [sp, #0x1c]
	str r1, [sp, #0x20]
	str r1, [sp, #0x24]
	ldr r1, _0207EFA0 ; =0x00000658
	str r0, [sp, #0xc]
	str r0, [sp, #0x14]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, sp, #0
	bl sub_0200D2B4
	lsl r1, r4, #2
	add r2, r5, r1
	mov r1, #0x66
	lsl r1, r1, #4
	str r0, [r2, r1]
	add sp, #0x28
	pop {r3, r4, r5, pc}
	nop
_0207EFA0: .word 0x00000658
	thumb_func_end sub_0207EF5C

	thumb_func_start sub_0207EFA4
sub_0207EFA4: ; 0x0207EFA4
	push {r4, lr}
	ldr r1, _0207EFC0 ; =0x00000658
	add r4, r0, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D0E4
	ldr r0, _0207EFC0 ; =0x00000658
	ldr r0, [r4, r0]
	bl sub_0200D108
	pop {r4, pc}
	nop
_0207EFC0: .word 0x00000658
	thumb_func_end sub_0207EFA4

	thumb_func_start sub_0207EFC4
sub_0207EFC4: ; 0x0207EFC4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	mov r2, #0x66
	lsl r2, r2, #4
	add r3, r1, #0
	add r5, r0, r2
	add r3, #0xa
	add r2, #0xe8
	add r7, r0, r2
	lsl r0, r1, #2
	lsl r4, r3, #2
	str r0, [sp]
	cmp r6, #7
	ldr r0, [r5, r4]
	bne _0207EFEA
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, r6, r7, pc}
_0207EFEA:
	add r1, r6, #0
	bl Set2dSpriteAnimSeqNo
	ldr r0, [sp]
	add r1, r6, #0
	ldr r0, [r7, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, r4]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0207EFC4

	thumb_func_start sub_0207F004
sub_0207F004: ; 0x0207F004
	push {r3, r4, r5, lr}
	mov r3, #0x66
	lsl r3, r3, #4
	add r1, #0x10
	add r5, r0, r3
	lsl r4, r1, #2
	cmp r2, #0
	bne _0207F01E
	ldr r0, [r5, r4]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, pc}
_0207F01E:
	add r0, r2, #0
	bl ItemIdIsMail
	cmp r0, #1
	ldr r0, [r5, r4]
	bne _0207F032
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	b _0207F038
_0207F032:
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
_0207F038:
	ldr r0, [r5, r4]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0207F004

	thumb_func_start sub_0207F044
sub_0207F044: ; 0x0207F044
	push {r3, r4, r5, lr}
	mov r2, #0x66
	lsl r2, r2, #4
	add r1, #0x10
	lsl r4, r1, #2
	add r5, r0, r2
	ldr r0, [r5, r4]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, r4]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0207F044

	thumb_func_start sub_0207F064
sub_0207F064: ; 0x0207F064
	push {r4, r5, r6, lr}
	ldr r6, _0207F094 ; =0x00000846
	add r5, r1, #0
	mov r4, #0x30
	mul r5, r4
	add r1, #0x10
	lsl r1, r1, #2
	add r4, r0, r6
	add r2, #8
	strh r2, [r4, r5]
	add r2, r6, #2
	add r2, r0, r2
	add r3, #8
	add r1, r0, r1
	mov r0, #0x66
	strh r3, [r2, r5]
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	ldrsh r1, [r4, r5]
	ldrsh r2, [r2, r5]
	bl sub_0200DD88
	pop {r4, r5, r6, pc}
	nop
_0207F094: .word 0x00000846
	thumb_func_end sub_0207F064

	thumb_func_start sub_0207F098
sub_0207F098: ; 0x0207F098
	add r2, r0, #0
	add r3, r1, #0
	mov r0, #0x30
	mul r3, r0
	add r1, #0x16
	lsl r0, r1, #2
	add r1, r2, r0
	mov r0, #0x66
	add r3, r2, r3
	lsl r0, r0, #4
	ldr r2, _0207F0C0 ; =0x00000846
	ldr r0, [r1, r0]
	ldrsh r1, [r3, r2]
	add r2, r2, #2
	ldrsh r2, [r3, r2]
	add r1, #8
	lsl r1, r1, #0x10
	ldr r3, _0207F0C4 ; =sub_0200DD88
	asr r1, r1, #0x10
	bx r3
	.balign 4, 0
_0207F0C0: .word 0x00000846
_0207F0C4: .word sub_0200DD88
	thumb_func_end sub_0207F098

	thumb_func_start sub_0207F0C8
sub_0207F0C8: ; 0x0207F0C8
	push {r4, lr}
	mov r2, #0x66
	mov r4, #0x30
	lsl r2, r2, #4
	add r3, r0, r2
	add r2, r1, #0
	mul r4, r1
	add r1, r0, r4
	ldr r0, _0207F0F8 ; =0x0000083A
	add r2, #0x16
	ldrh r0, [r1, r0]
	lsl r2, r2, #2
	cmp r0, #0
	ldr r0, [r3, r2]
	bne _0207F0EE
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	pop {r4, pc}
_0207F0EE:
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r4, pc}
	nop
_0207F0F8: .word 0x0000083A
	thumb_func_end sub_0207F0C8

	thumb_func_start sub_0207F0FC
sub_0207F0FC: ; 0x0207F0FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020249A8
	cmp r4, r0
	beq _0207F11A
	add r0, r5, #0
	mov r1, #0
	bl sub_020249D4
	add r0, r5, #0
	add r1, r4, #0
	bl Set2dSpriteAnimSeqNo
_0207F11A:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0207F0FC

	thumb_func_start sub_0207F11C
sub_0207F11C: ; 0x0207F11C
	push {r3, lr}
	add r2, r0, #0
	ldrh r0, [r2, #6]
	cmp r0, #0
	bne _0207F12A
	mov r0, #0
	pop {r3, pc}
_0207F12A:
	ldrh r1, [r2, #0xe]
	lsl r1, r1, #0x14
	lsr r1, r1, #0x14
	cmp r1, #7
	beq _0207F140
	cmp r1, #0
	beq _0207F140
	cmp r1, #6
	beq _0207F140
	mov r0, #5
	pop {r3, pc}
_0207F140:
	ldrh r1, [r2, #8]
	mov r2, #0x30
	bl sub_020880B0
	cmp r0, #4
	bhi _0207F172
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207F158: ; jump table
	.short _0207F172 - _0207F158 - 2 ; case 0
	.short _0207F16E - _0207F158 - 2 ; case 1
	.short _0207F16A - _0207F158 - 2 ; case 2
	.short _0207F166 - _0207F158 - 2 ; case 3
	.short _0207F162 - _0207F158 - 2 ; case 4
_0207F162:
	mov r0, #1
	pop {r3, pc}
_0207F166:
	mov r0, #2
	pop {r3, pc}
_0207F16A:
	mov r0, #3
	pop {r3, pc}
_0207F16E:
	mov r0, #4
	pop {r3, pc}
_0207F172:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0207F11C

	thumb_func_start sub_0207F178
sub_0207F178: ; 0x0207F178
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _0207F230 ; =0x00000828
	mov r5, #0
	add r0, r6, r0
	str r0, [sp]
_0207F184:
	mov r0, #0x30
	add r1, r5, #0
	mul r1, r0
	ldr r0, [sp]
	add r4, r0, r1
	add r0, r4, #0
	add r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0207F224
	mov r0, #0xc5
	lsl r0, r0, #4
	ldrb r0, [r6, r0]
	cmp r0, #1
	bne _0207F1B6
	ldr r0, _0207F234 ; =0x00000C4C
	ldrb r0, [r6, r0]
	cmp r0, r5
	beq _0207F1B2
	ldr r0, _0207F238 ; =0x00000C4D
	ldrb r0, [r6, r0]
	cmp r0, r5
	bne _0207F1B6
_0207F1B2:
	mov r7, #0
	b _0207F1BE
_0207F1B6:
	add r0, r4, #0
	bl sub_0207F11C
	add r7, r0, #0
_0207F1BE:
	lsl r1, r7, #0x18
	ldr r0, [r4, #0x24]
	lsr r1, r1, #0x18
	bl sub_0207F0FC
	mov r1, #1
	ldr r0, [r4, #0x24]
	lsl r1, r1, #0xc
	bl sub_020249B0
	ldr r0, _0207F23C ; =0x00000C65
	ldrb r0, [r6, r0]
	cmp r0, r5
	bne _0207F216
	cmp r7, #0
	beq _0207F216
	cmp r7, #5
	beq _0207F216
	ldr r0, [r4, #0x24]
	bl sub_020249F8
	cmp r0, #0
	ldr r0, [r4, #0x24]
	bne _0207F202
	mov r2, #0x18
	ldrsh r2, [r4, r2]
	mov r1, #0x16
	ldrsh r1, [r4, r1]
	sub r2, r2, #3
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	b _0207F224
_0207F202:
	mov r2, #0x18
	ldrsh r2, [r4, r2]
	mov r1, #0x16
	ldrsh r1, [r4, r1]
	add r2, r2, #1
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	b _0207F224
_0207F216:
	mov r1, #0x16
	mov r2, #0x18
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x24]
	bl sub_0200DD88
_0207F224:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #6
	blo _0207F184
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207F230: .word 0x00000828
_0207F234: .word 0x00000C4C
_0207F238: .word 0x00000C4D
_0207F23C: .word 0x00000C65
	thumb_func_end sub_0207F178

	thumb_func_start sub_0207F240
sub_0207F240: ; 0x0207F240
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, _0207F29C ; =0x00000948
	add r4, r1, #0
	ldr r1, [r5, r0]
	lsl r0, r4, #3
	add r0, r1, r0
	add r1, sp, #0
	add r6, r2, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02020A0C
	ldr r0, _0207F2A0 ; =0x00000654
	add r1, r4, #0
	ldr r0, [r5, r0]
	add r0, #0x25
	ldrb r0, [r0]
	bl sub_0207B5EC
	add r1, r0, #0
	ldr r0, _0207F2A4 ; =0x00000678
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0207F2A4 ; =0x00000678
	mov r1, #1
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0207F2A4 ; =0x00000678
	add r2, sp, #0
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r5, r0]
	bl sub_0200DD88
	ldr r0, _0207F2A4 ; =0x00000678
	add r1, r6, #0
	ldr r0, [r5, r0]
	bl sub_0200DD08
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0207F29C: .word 0x00000948
_0207F2A0: .word 0x00000654
_0207F2A4: .word 0x00000678
	thumb_func_end sub_0207F240

	thumb_func_start sub_0207F2A8
sub_0207F2A8: ; 0x0207F2A8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	lsl r0, r1, #0xc
	str r0, [sp]
	mov r0, #1
	lsl r1, r2, #0xc
	lsl r0, r0, #0x14
	str r1, [sp, #4]
	add r0, r1, r0
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl sub_020247D4
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020249D4
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0207F2A8

	thumb_func_start sub_0207F2F8
sub_0207F2F8: ; 0x0207F2F8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020248B8
	cmp r0, #1
	bne _0207F332
	mov r0, #0x6d
	lsl r0, r0, #4
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r1, r1, #0xc
	bl sub_020249B0
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020249F8
	cmp r0, #2
	bne _0207F332
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0207F332:
	pop {r4, pc}
	thumb_func_end sub_0207F2F8

	thumb_func_start sub_0207F334
sub_0207F334: ; 0x0207F334
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	ldr r0, _0207F39C ; =0x00000654
	str r1, [sp]
	ldr r0, [r7, r0]
	mov r4, #0
	ldr r0, [r0]
	bl GetPartyCount
	cmp r0, #0
	ble _0207F398
	mov r0, #0x72
	ldr r1, [sp]
	lsl r0, r0, #2
	sub r1, r0, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	ldr r2, [sp]
	add r0, #0x14
	sub r0, r0, r2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add r6, r7, #0
	add r5, r7, #0
	str r1, [sp, #4]
	str r0, [sp, #8]
_0207F36A:
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	ldr r2, [sp, #4]
	mov r1, #0x1e
	bl sub_0200DD88
	ldr r0, _0207F3A0 ; =0x00000748
	ldr r2, [sp, #8]
	ldr r0, [r5, r0]
	mov r1, #0x32
	bl sub_0200DD88
	ldr r0, _0207F39C ; =0x00000654
	add r6, #0x30
	ldr r0, [r7, r0]
	add r5, r5, #4
	ldr r0, [r0]
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _0207F36A
_0207F398:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207F39C: .word 0x00000654
_0207F3A0: .word 0x00000748
	thumb_func_end sub_0207F334

	thumb_func_start sub_0207F3A4
sub_0207F3A4: ; 0x0207F3A4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _0207F420 ; =0x00000654
	str r1, [sp]
	ldr r0, [r7, r0]
	mov r4, #0
	ldr r0, [r0]
	bl GetPartyCount
	cmp r0, #0
	ble _0207F3E8
	add r6, r7, #0
	add r5, r7, #0
_0207F3BE:
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, _0207F424 ; =0x00000748
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0207F420 ; =0x00000654
	add r6, #0x30
	ldr r0, [r7, r0]
	add r5, r5, #4
	ldr r0, [r0]
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _0207F3BE
_0207F3E8:
	ldr r0, [sp]
	mov r1, #0x30
	add r4, r0, #0
	mul r4, r1
	mov r0, #0x85
	add r1, r7, r4
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r1, _0207F428 ; =0x00000836
	add r0, r7, r4
	ldrh r0, [r0, r1]
	lsl r0, r0, #0x14
	lsr r0, r0, #0x14
	cmp r0, #7
	beq _0207F41C
	ldr r0, [sp]
	sub r1, #0xee
	lsl r0, r0, #2
	add r0, r7, r0
	ldr r0, [r0, r1]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
_0207F41C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207F420: .word 0x00000654
_0207F424: .word 0x00000748
_0207F428: .word 0x00000836
	thumb_func_end sub_0207F3A4

	.rodata

_021018B4:
	.short 0x0032, 0x0033, 0x0031, 0x0030, 0xFFFF, 0xFFFF, 0x0054, 0x0000
_021018C4:
	.byte 0x23, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
_021018D8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
_021018F8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x40, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101920:
	.byte 0x01, 0x00, 0x00, 0x00, 0x40, 0x00, 0x48, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101948:
	.byte 0x02, 0x00, 0x00, 0x00, 0xE8, 0x00, 0xA8, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101970:
	.byte 0x02, 0x00, 0x00, 0x00, 0xE8, 0x00, 0xB8, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101998:
	.byte 0x03, 0x00, 0x00, 0x00, 0x24, 0x00, 0x2C, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
; 0x021019C0
	.byte 0x03, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x34, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
; 0x021019E8
	.byte 0x03, 0x00, 0x00, 0x00, 0x24, 0x00, 0x5C, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
; 0x02101A10
	.byte 0x03, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
; 0x02101A38
	.byte 0x03, 0x00, 0x00, 0x00, 0x24, 0x00, 0x8C, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
; 0x02101A60
	.byte 0x03, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	; File boundary

_02101C68:
	.byte 0x0B, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101C90:
	.byte 0x03, 0x00, 0x00, 0x00, 0x32, 0x00, 0x94, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
