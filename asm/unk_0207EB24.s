#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "unk_0207EB24.inc"
	.include "global.inc"

	.public gOverlayTemplate_Battle
	.public gNatureStatMods
	.extern sub_0207F0FC

	.text

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
	bl CalculateHpBarColor
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
	bl Sprite_TickCellOrMulticellAnimation
	ldr r0, _0207F23C ; =0x00000C65
	ldrb r0, [r6, r0]
	cmp r0, r5
	bne _0207F216
	cmp r7, #0
	beq _0207F216
	cmp r7, #5
	beq _0207F216
	ldr r0, [r4, #0x24]
	bl Sprite_GetAnimCtrlCurrentFrame
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
	bl Sprite_SetPositionXY
	b _0207F224
_0207F202:
	mov r2, #0x18
	ldrsh r2, [r4, r2]
	mov r1, #0x16
	ldrsh r1, [r4, r1]
	add r2, r2, #1
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	b _0207F224
_0207F216:
	mov r1, #0x16
	mov r2, #0x18
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x24]
	bl Sprite_SetPositionXY
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
	bl Sprite_SetPositionXY
	ldr r0, _0207F2A4 ; =0x00000678
	add r1, r6, #0
	ldr r0, [r5, r0]
	bl thunk_Sprite_SetPalIndex
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
	bl Sprite_SetMatrix
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Sprite_SetAnimCtrlCurrentFrame
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
	bl Get2dSpriteVisibleFlag
	cmp r0, #1
	bne _0207F332
	mov r0, #0x6d
	lsl r0, r0, #4
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r1, r1, #0xc
	bl Sprite_TickCellOrMulticellAnimation
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Sprite_GetAnimCtrlCurrentFrame
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
	bl Party_GetCount
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
	bl Sprite_SetPositionXY
	ldr r0, _0207F3A0 ; =0x00000748
	ldr r2, [sp, #8]
	ldr r0, [r5, r0]
	mov r1, #0x32
	bl Sprite_SetPositionXY
	ldr r0, _0207F39C ; =0x00000654
	add r6, #0x30
	ldr r0, [r7, r0]
	add r5, r5, #4
	ldr r0, [r0]
	add r4, r4, #1
	bl Party_GetCount
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
	bl Party_GetCount
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
	bl Party_GetCount
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

	.global _021018B4
_021018B4:  // const u16[7]
	.short 50  // NARC_resdat_resdat_00000050
	.short 51  // NARC_resdat_resdat_00000051
	.short 49  // NARC_resdat_resdat_00000049
	.short 48  // NARC_resdat_resdat_00000048
	.short 0xFFFF
	.short 0xFFFF
	.short 84  // NARC_resdat_resdat_00000084
	.balign 4, 0

	.global _021018C4
_021018C4:  // const Unk122_021E92D0
	.word 0x00000023
	.word 0x00000400
	.word 0x00000400
	.word 0x00000010
	.word 0x00000010

	.global _021018D8
_021018D8:  // const Unk122_021E92FC
	.word 0x00000000
	.word 0x00000080
	.word 0x00000000
	.word 0x00000020
	.word 0x00000004
	.word 0x0000007C
	.word 0x00000001
	.word 0x0000001F

	.global _021018F8
_021018F8:  // const UnkStruct_0200D2B4[]
; 0x021018F8
	.word 0x00000001
	.short 0x0040, 0x0018, 0x0000, 0x0001
	.word 0x00000003
	.word 0x00000000
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101920
	.word 0x00000001
	.short 0x0040, 0x0048, 0x0000, 0x0002
	.word 0x00000002
	.word 0x00000000
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101948
	.word 0x00000002
	.short 0x00E8, 0x00A8, 0x0000, 0x0002
	.word 0x00000001
	.word 0x00000000
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101970
	.word 0x00000002
	.short 0x00E8, 0x00B8, 0x0000, 0x0002
	.word 0x00000001
	.word 0x00000000
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101998
	.word 0x00000003
	.short 0x0024, 0x002C, 0x0000, 0x0000
	.word 0x00000001
	.word 0x00000002
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x021019C0
	.word 0x00000003
	.short 0x00A4, 0x0034, 0x0000, 0x0000
	.word 0x00000001
	.word 0x00000002
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x021019E8
	.word 0x00000003
	.short 0x0024, 0x005C, 0x0000, 0x0000
	.word 0x00000001
	.word 0x00000002
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101A10
	.word 0x00000003
	.short 0x00A4, 0x0064, 0x0000, 0x0000
	.word 0x00000001
	.word 0x00000002
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101A38
	.word 0x00000003
	.short 0x0024, 0x008C, 0x0000, 0x0000
	.word 0x00000001
	.word 0x00000002
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101A60
	.word 0x00000003
	.short 0x00A4, 0x0094, 0x0000, 0x0000
	.word 0x00000001
	.word 0x00000002
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101A88
	.word 0x0000000A
	.short 0x00A4, 0x0094, 0x0000, 0x0000
	.word 0x00000000
	.word 0x00000006
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101AB0
	.word 0x0000000A
	.short 0x00A4, 0x0094, 0x0000, 0x0000
	.word 0x00000000
	.word 0x00000006
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101AD8
	.word 0x0000000A
	.short 0x00A4, 0x0094, 0x0000, 0x0000
	.word 0x00000000
	.word 0x00000006
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101B00
	.word 0x0000000A
	.short 0x00A4, 0x0094, 0x0000, 0x0000
	.word 0x00000000
	.word 0x00000006
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101B28
	.word 0x0000000A
	.short 0x00A4, 0x0094, 0x0000, 0x0000
	.word 0x00000000
	.word 0x00000006
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101B50
	.word 0x0000000A
	.short 0x00A4, 0x0094, 0x0000, 0x0000
	.word 0x00000000
	.word 0x00000006
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101B78
	.word 0x0000000A
	.short 0x00A4, 0x0094, 0x0000, 0x0002
	.word 0x00000000
	.word 0x00000006
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101BA0
	.word 0x0000000A
	.short 0x00A4, 0x0094, 0x0000, 0x0002
	.word 0x00000000
	.word 0x00000006
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101BC8
	.word 0x0000000A
	.short 0x00A4, 0x0094, 0x0000, 0x0002
	.word 0x00000000
	.word 0x00000006
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101BF0
	.word 0x0000000A
	.short 0x00A4, 0x0094, 0x0000, 0x0002
	.word 0x00000000
	.word 0x00000006
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101C18
	.word 0x0000000A
	.short 0x00A4, 0x0094, 0x0000, 0x0002
	.word 0x00000000
	.word 0x00000006
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101C40
	.word 0x0000000A
	.short 0x00A4, 0x0094, 0x0000, 0x0002
	.word 0x00000000
	.word 0x00000006
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101C68
	.word 0x0000000B
	.short 0x00A4, 0x0094, 0x0000, 0x0000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000002
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
; 0x02101C90
	.word 0x00000003
	.short 0x0032, 0x0194, 0x0000, 0x0000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
