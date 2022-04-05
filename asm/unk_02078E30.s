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

	thumb_func_start sub_02078E30
sub_02078E30: ; 0x02078E30
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _02079014 ; =0xFFFFE0FF
	ldr r3, _02079018 ; =0x04001000
	and r2, r1
	str r2, [r0]
	ldr r2, [r3]
	add r0, #0x50
	and r1, r2
	str r1, [r3]
	mov r1, #0
	strh r1, [r0]
	add r3, #0x50
	ldr r2, _0207901C ; =0x04000304
	strh r1, [r3]
	ldrh r1, [r2]
	ldr r0, _02079020 ; =0xFFFF7FFF
	and r0, r1
	strh r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	mov r1, #0xc
	mov r0, #3
	lsl r2, r1, #0xe
	bl CreateHeap
	mov r0, #0x15
	mov r1, #0xc
	bl NARC_ctor
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02079BD8
	add r5, r0, #0
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xc
	mov r1, #3
	str r0, [sp, #8]
	mov r0, #2
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	add r0, r5, #0
	bl sub_02079CE4
	bl sub_02079700
	ldr r0, [r5]
	bl sub_02079758
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02079A14
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	mov r1, #0
	mov r0, #0x39
	add r2, r1, #0
	bl sub_02004EC4
	add r0, r5, #0
	bl sub_0207CF98
	add r0, r5, #0
	bl sub_0207CDCC
	add r0, r5, #0
	bl sub_0207EB24
	add r0, r5, #0
	bl sub_0207EDD4
	add r0, r5, #0
	bl sub_02079D38
	add r0, r5, #0
	bl sub_0207A22C
	ldr r1, _02079024 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	mov r2, #1
	bl sub_0207B51C
	ldr r1, _02079028 ; =0x00000654
	ldr r3, [r5, r1]
	add r0, r3, #0
	add r0, #0x24
	ldrb r2, [r0]
	cmp r2, #5
	beq _02078F1C
	cmp r2, #0x10
	bne _02078F32
_02078F1C:
	ldrh r0, [r3, #0x28]
	bl sub_020817C4
	cmp r0, #0
	bne _02078FE4
	add r0, r5, #0
	mov r1, #0x21
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078F32:
	cmp r2, #6
	bne _02078F42
	add r0, r5, #0
	mov r1, #0x22
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078F42:
	cmp r2, #9
	beq _02078F4A
	cmp r2, #0xe
	bne _02078F56
_02078F4A:
	add r0, r5, #0
	mov r1, #0x20
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078F56:
	cmp r2, #7
	beq _02078F6A
	cmp r2, #8
	beq _02078F6A
	add r0, r2, #0
	add r0, #0xf5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02078F76
_02078F6A:
	ldr r0, _0207902C ; =0x00000678
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_0200DD08
	b _02078FE4
_02078F76:
	cmp r2, #2
	beq _02078F7E
	cmp r2, #0x11
	bne _02078F8A
_02078F7E:
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078F8A:
	cmp r2, #0xf
	bne _02078F9A
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078F9A:
	cmp r2, #0x15
	bne _02078FAA
	add r0, r5, #0
	mov r1, #0xb8
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078FAA:
	cmp r2, #0x16
	bne _02078FBA
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078FBA:
	cmp r2, #0x17
	bne _02078FCA
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078FCA:
	cmp r2, #0xa
	beq _02078FDA
	add r0, r5, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078FDA:
	add r1, #0x24
	ldr r0, [r5, r1]
	mov r1, #1
	bl sub_0200DD08
_02078FE4:
	add r0, r5, #0
	bl sub_0207A89C
	mov r0, #1
	bl sub_02002B8C
	ldr r0, _02079030 ; =sub_020796B8
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	mov r0, #2
	bl sub_0203A994
	mov r0, #4
	mov r1, #0xc
	bl FontID_Alloc
	add r0, r4, #0
	bl NARC_dtor
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02079014: .word 0xFFFFE0FF
_02079018: .word 0x04001000
_0207901C: .word 0x04000304
_02079020: .word 0xFFFF7FFF
_02079024: .word 0x00000C65
_02079028: .word 0x00000654
_0207902C: .word 0x00000678
_02079030: .word sub_020796B8
	thumb_func_end sub_02078E30

	thumb_func_start sub_02079034
sub_02079034: ; 0x02079034
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #0x21
	bhi _020790AE
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02079050: ; jump table
	.short _02079094 - _02079050 - 2 ; case 0
	.short _0207909C - _02079050 - 2 ; case 1
	.short _020790A4 - _02079050 - 2 ; case 2
	.short _020790B6 - _02079050 - 2 ; case 3
	.short _020790BE - _02079050 - 2 ; case 4
	.short _020790C6 - _02079050 - 2 ; case 5
	.short _020790D0 - _02079050 - 2 ; case 6
	.short _020790D8 - _02079050 - 2 ; case 7
	.short _020790E0 - _02079050 - 2 ; case 8
	.short _020790E8 - _02079050 - 2 ; case 9
	.short _020790F0 - _02079050 - 2 ; case 10
	.short _020790F8 - _02079050 - 2 ; case 11
	.short _02079100 - _02079050 - 2 ; case 12
	.short _02079108 - _02079050 - 2 ; case 13
	.short _02079110 - _02079050 - 2 ; case 14
	.short _02079118 - _02079050 - 2 ; case 15
	.short _02079120 - _02079050 - 2 ; case 16
	.short _02079128 - _02079050 - 2 ; case 17
	.short _02079130 - _02079050 - 2 ; case 18
	.short _02079138 - _02079050 - 2 ; case 19
	.short _02079140 - _02079050 - 2 ; case 20
	.short _02079148 - _02079050 - 2 ; case 21
	.short _02079150 - _02079050 - 2 ; case 22
	.short _02079158 - _02079050 - 2 ; case 23
	.short _02079160 - _02079050 - 2 ; case 24
	.short _02079168 - _02079050 - 2 ; case 25
	.short _02079170 - _02079050 - 2 ; case 26
	.short _02079178 - _02079050 - 2 ; case 27
	.short _02079180 - _02079050 - 2 ; case 28
	.short _02079198 - _02079050 - 2 ; case 29
	.short _020791A6 - _02079050 - 2 ; case 30
	.short _020791AE - _02079050 - 2 ; case 31
	.short _020791C8 - _02079050 - 2 ; case 32
	.short _020791D6 - _02079050 - 2 ; case 33
_02079094:
	bl sub_02079280
	str r0, [r4]
	b _020791EE
_0207909C:
	bl sub_02079308
	str r0, [r4]
	b _020791EE
_020790A4:
	add r1, r4, #0
	bl sub_0207BC1C
	cmp r0, #1
	beq _020790B0
_020790AE:
	b _020791EE
_020790B0:
	mov r0, #1
	str r0, [r4]
	b _020791EE
_020790B6:
	bl sub_02080B74
	str r0, [r4]
	b _020791EE
_020790BE:
	bl sub_020793C0
	str r0, [r4]
	b _020791EE
_020790C6:
	ldr r1, _02079214 ; =0x00000C54
	ldr r1, [r5, r1]
	blx r1
	str r0, [r4]
	b _020791EE
_020790D0:
	bl sub_02082738
	str r0, [r4]
	b _020791EE
_020790D8:
	bl sub_02081820
	str r0, [r4]
	b _020791EE
_020790E0:
	bl sub_02079400
	str r0, [r4]
	b _020791EE
_020790E8:
	bl sub_0207C728
	str r0, [r4]
	b _020791EE
_020790F0:
	bl sub_0207C74C
	str r0, [r4]
	b _020791EE
_020790F8:
	bl sub_0207C6BC
	str r0, [r4]
	b _020791EE
_02079100:
	bl sub_0207C6DC
	str r0, [r4]
	b _020791EE
_02079108:
	bl sub_0207C70C
	str r0, [r4]
	b _020791EE
_02079110:
	bl sub_0207C908
	str r0, [r4]
	b _020791EE
_02079118:
	bl sub_02079440
	str r0, [r4]
	b _020791EE
_02079120:
	bl sub_0207C400
	str r0, [r4]
	b _020791EE
_02079128:
	bl sub_0207F694
	str r0, [r4]
	b _020791EE
_02079130:
	bl sub_0207F6E8
	str r0, [r4]
	b _020791EE
_02079138:
	bl sub_0207F720
	str r0, [r4]
	b _020791EE
_02079140:
	bl sub_0207FA08
	str r0, [r4]
	b _020791EE
_02079148:
	bl sub_02079550
	str r0, [r4]
	b _020791EE
_02079150:
	bl sub_02082370
	str r0, [r4]
	b _020791EE
_02079158:
	bl sub_02080610
	str r0, [r4]
	b _020791EE
_02079160:
	bl sub_020794C8
	str r0, [r4]
	b _020791EE
_02079168:
	bl sub_020794EC
	str r0, [r4]
	b _020791EE
_02079170:
	bl sub_020794F0
	str r0, [r4]
	b _020791EE
_02079178:
	bl sub_020794FC
	str r0, [r4]
	b _020791EE
_02079180:
	bl sub_0207B600
	cmp r0, #0
	bne _0207918E
	mov r0, #0x1d
	str r0, [r4]
	b _020791EE
_0207918E:
	cmp r0, #3
	bne _020791EE
	mov r0, #1
	str r0, [r4]
	b _020791EE
_02079198:
	bl sub_0207FD6C
	cmp r0, #1
	bne _020791EE
	mov r0, #1
	str r0, [r4]
	b _020791EE
_020791A6:
	bl sub_0207BD78
	str r0, [r4]
	b _020791EE
_020791AE:
	bl PartyMenu_AnimateIconFormeChange
	cmp r0, #1
	bne _020791C2
	add r0, r5, #0
	bl sub_0207CB6C
	mov r0, #0x19
	str r0, [r4]
	b _020791EE
_020791C2:
	mov r0, #0x1f
	str r0, [r4]
	b _020791EE
_020791C8:
	mov r0, #1
	mov r1, #0xc
	bl sub_020880CC
	mov r0, #0x21
	str r0, [r4]
	b _020791EE
_020791D6:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _020791EE
	ldr r0, _02079218 ; =0x00000C65
	ldrb r1, [r5, r0]
	ldr r0, _0207921C ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x26
	strb r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
_020791EE:
	add r0, r5, #0
	bl sub_0207F178
	add r0, r5, #0
	bl sub_0207F2F8
	add r0, r5, #0
	bl sub_0207AC20
	add r0, r5, #0
	bl sub_02079230
	ldr r0, _02079220 ; =0x0000065C
	ldr r0, [r5, r0]
	bl sub_0200D020
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02079214: .word 0x00000C54
_02079218: .word 0x00000C65
_0207921C: .word 0x00000654
_02079220: .word 0x0000065C
	thumb_func_end sub_02079034

	thumb_func_start sub_02079224
sub_02079224: ; 0x02079224
	ldr r2, _0207922C ; =0x00000C7C
	str r1, [r0, r2]
	bx lr
	nop
_0207922C: .word 0x00000C7C
	thumb_func_end sub_02079224

	thumb_func_start sub_02079230
sub_02079230: ; 0x02079230
	push {r3, lr}
	ldr r1, _02079278 ; =0x00000C7C
	ldr r2, [r0, r1]
	cmp r2, #0
	beq _02079258
	sub r2, r1, #4
	ldr r3, [r0, r2]
	add r3, #0xc
	str r3, [r0, r2]
	ldr r2, [r0, r2]
	cmp r2, #0x28
	ble _0207924E
	mov r2, #0x28
	sub r1, r1, #4
	str r2, [r0, r1]
_0207924E:
	ldr r1, _0207927C ; =0x00000C78
	ldr r1, [r0, r1]
	bl sub_0207F334
	pop {r3, pc}
_02079258:
	sub r2, r1, #4
	ldr r3, [r0, r2]
	sub r3, #0xc
	str r3, [r0, r2]
	ldr r2, [r0, r2]
	cmp r2, #0
	bge _0207926C
	mov r2, #0
	sub r1, r1, #4
	str r2, [r0, r1]
_0207926C:
	ldr r1, _0207927C ; =0x00000C78
	ldr r1, [r0, r1]
	bl sub_0207F334
	pop {r3, pc}
	nop
_02079278: .word 0x00000C7C
_0207927C: .word 0x00000C78
	thumb_func_end sub_02079230

	thumb_func_start sub_02079280
sub_02079280: ; 0x02079280
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _020792FA
	ldr r0, _02079300 ; =0x00000654
	ldr r2, [r4, r0]
	add r0, r2, #0
	add r0, #0x24
	ldrb r1, [r0]
	cmp r1, #5
	beq _0207929E
	cmp r1, #0x10
	bne _020792B6
_0207929E:
	ldrh r0, [r2, #0x28]
	bl sub_020817C4
	cmp r0, #1
	bne _020792B2
	ldr r0, _02079304 ; =0x00000C62
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #7
	pop {r4, pc}
_020792B2:
	mov r0, #4
	pop {r4, pc}
_020792B6:
	cmp r1, #6
	bne _020792BE
	mov r0, #0x15
	pop {r4, pc}
_020792BE:
	cmp r1, #7
	bne _020792CA
	add r0, r4, #0
	bl sub_020822CC
	pop {r4, pc}
_020792CA:
	cmp r1, #8
	bne _020792D6
	add r0, r4, #0
	bl sub_02081ED0
	pop {r4, pc}
_020792D6:
	add r0, r1, #0
	add r0, #0xf5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _020792E6
	mov r0, #0xe
	pop {r4, pc}
_020792E6:
	cmp r1, #9
	bne _020792EE
	mov r0, #8
	pop {r4, pc}
_020792EE:
	cmp r1, #0xa
	bne _020792F6
	mov r0, #0x10
	pop {r4, pc}
_020792F6:
	mov r0, #1
	pop {r4, pc}
_020792FA:
	mov r0, #0
	pop {r4, pc}
	nop
_02079300: .word 0x00000654
_02079304: .word 0x00000C62
	thumb_func_end sub_02079280

	thumb_func_start sub_02079308
sub_02079308: ; 0x02079308
	push {r4, lr}
	add r4, r0, #0
	bl sub_0207ADB8
	cmp r0, #4
	bhi _020793B6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02079320: ; jump table
	.short _0207932A - _02079320 - 2 ; case 0
	.short _020793B6 - _02079320 - 2 ; case 1
	.short _0207938C - _02079320 - 2 ; case 2
	.short _0207937E - _02079320 - 2 ; case 3
	.short _02079376 - _02079320 - 2 ; case 4
_0207932A:
	ldr r0, _020793BC ; =0x00000654
	ldr r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #3
	bgt _0207933C
	beq _0207934E
	b _0207936A
_0207933C:
	cmp r0, #0x14
	bgt _0207936A
	cmp r0, #0xe
	blt _0207936A
	beq _02079358
	cmp r0, #0x13
	beq _02079362
	cmp r0, #0x14
	bne _0207936A
_0207934E:
	mov r0, #0
	add r1, #0x27
	strb r0, [r1]
	mov r0, #0x20
	pop {r4, pc}
_02079358:
	add r0, r4, #0
	bl sub_02082868
	mov r0, #0x18
	pop {r4, pc}
_02079362:
	add r0, r4, #0
	bl sub_0207CA30
	pop {r4, pc}
_0207936A:
	add r0, r4, #0
	mov r1, #1
	bl sub_02079224
	mov r0, #2
	pop {r4, pc}
_02079376:
	add r0, r4, #0
	bl sub_0207B7E0
	pop {r4, pc}
_0207937E:
	ldr r0, _020793BC ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
_0207938C:
	ldr r0, _020793BC ; =0x00000654
	ldr r2, [r4, r0]
	add r1, r2, #0
	add r1, #0x24
	ldrb r1, [r1]
	cmp r1, #0xf
	beq _020793A4
	mov r0, #1
	add r2, #0x27
	strb r0, [r2]
	mov r0, #0x20
	pop {r4, pc}
_020793A4:
	add r0, #0x24
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DD08
	add r0, r4, #0
	bl sub_020807AC
	pop {r4, pc}
_020793B6:
	mov r0, #1
	pop {r4, pc}
	nop
_020793BC: .word 0x00000654
	thumb_func_end sub_02079308

	thumb_func_start sub_020793C0
sub_020793C0: ; 0x020793C0
	push {r4, lr}
	add r4, r0, #0
	bl sub_0207C0DC
	cmp r0, #0
	beq _020793D0
	cmp r0, #2
	bne _020793E2
_020793D0:
	ldr r0, _020793F8 ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	bl sub_0207C288
	pop {r4, pc}
_020793E2:
	cmp r0, #3
	bne _020793F4
	ldr r0, _020793FC ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
_020793F4:
	mov r0, #4
	pop {r4, pc}
	.balign 4, 0
_020793F8: .word 0x00000678
_020793FC: .word 0x00000654
	thumb_func_end sub_020793C0

	thumb_func_start sub_02079400
sub_02079400: ; 0x02079400
	push {r4, lr}
	add r4, r0, #0
	bl sub_0207C0DC
	cmp r0, #0
	beq _02079410
	cmp r0, #2
	bne _02079422
_02079410:
	ldr r0, _02079438 ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	bl sub_0207C400
	pop {r4, pc}
_02079422:
	cmp r0, #3
	bne _02079434
	ldr r0, _0207943C ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
_02079434:
	mov r0, #8
	pop {r4, pc}
	.balign 4, 0
_02079438: .word 0x00000678
_0207943C: .word 0x00000654
	thumb_func_end sub_02079400

	thumb_func_start sub_02079440
sub_02079440: ; 0x02079440
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _020794C0 ; =0x00000824
	add r4, r0, #0
	ldr r1, [r4, r1]
	bl sub_0207E93C
	add r2, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r2, r0
	beq _02079460
	add r0, r0, #1
	cmp r2, r0
	beq _020794BA
	b _020794AE
_02079460:
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	mov r0, #0x8d
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl sub_0200E5D4
	mov r0, #0x8d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	add r0, r4, #0
	bl sub_0207CB20
	bl sub_0207CB90
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _020794C4 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add sp, #4
	mov r0, #1
	pop {r3, r4, pc}
_020794AE:
	add r0, r4, #0
	add r1, sp, #0
	blx r2
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, pc}
_020794BA:
	mov r0, #0xf
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_020794C0: .word 0x00000824
_020794C4: .word 0x00000678
	thumb_func_end sub_02079440

	thumb_func_start sub_020794C8
sub_020794C8: ; 0x020794C8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020794E4 ; =0x00000C64
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _020794DE
	ldr r0, _020794E8 ; =0x00000C62
	ldrb r0, [r4, r0]
	pop {r4, pc}
_020794DE:
	mov r0, #0x18
	pop {r4, pc}
	nop
_020794E4: .word 0x00000C64
_020794E8: .word 0x00000C62
	thumb_func_end sub_020794C8

	thumb_func_start sub_020794EC
sub_020794EC: ; 0x020794EC
	mov r0, #0x20
	bx lr
	thumb_func_end sub_020794EC

	thumb_func_start sub_020794F0
sub_020794F0: ; 0x020794F0
	push {r3, lr}
	bl sub_0207DBCC
	mov r0, #0x1b
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020794F0

	thumb_func_start sub_020794FC
sub_020794FC: ; 0x020794FC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02079544 ; =0x00000C88
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _02079512
	cmp r0, #2
	beq _02079528
	b _0207953E
_02079512:
	ldr r0, _02079544 ; =0x00000C88
	ldr r0, [r4, r0]
	bl sub_02016624
	bl sub_0207CB90
	ldr r1, _02079548 ; =0x00000C58
	add r0, r4, #0
	ldr r1, [r4, r1]
	blx r1
	pop {r4, pc}
_02079528:
	ldr r0, _02079544 ; =0x00000C88
	ldr r0, [r4, r0]
	bl sub_02016624
	bl sub_0207CB90
	ldr r1, _0207954C ; =0x00000C5C
	add r0, r4, #0
	ldr r1, [r4, r1]
	blx r1
	pop {r4, pc}
_0207953E:
	mov r0, #0x1b
	pop {r4, pc}
	nop
_02079544: .word 0x00000C88
_02079548: .word 0x00000C58
_0207954C: .word 0x00000C5C
	thumb_func_end sub_020794FC

	thumb_func_start sub_02079550
sub_02079550: ; 0x02079550
	push {r4, lr}
	add r4, r0, #0
	bl sub_0207C0DC
	cmp r0, #0
	beq _02079560
	cmp r0, #2
	bne _020795B4
_02079560:
	ldr r0, _020795CC ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DD08
	ldr r0, _020795D0 ; =0x00000C65
	mov r1, #0x30
	ldrb r0, [r4, r0]
	add r2, r0, #0
	mul r2, r1
	ldr r0, _020795D4 ; =0x00000838
	add r2, r4, r2
	ldrb r0, [r2, r0]
	cmp r0, #1
	beq _02079586
	add r0, r4, #0
	bl sub_02082134
	pop {r4, pc}
_02079586:
	add r0, r4, #0
	sub r1, #0x31
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _020795D8 ; =0x00000654
	mov r2, #0x1f
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _020795DC ; =0x00000C62
	mov r1, #0x19
	strb r1, [r4, r0]
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x66
	bl ReadMsgDataIntoString
	mov r0, #0x18
	pop {r4, pc}
_020795B4:
	cmp r0, #3
	bne _020795C6
	ldr r0, _020795D8 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
_020795C6:
	mov r0, #0x15
	pop {r4, pc}
	nop
_020795CC: .word 0x00000678
_020795D0: .word 0x00000C65
_020795D4: .word 0x00000838
_020795D8: .word 0x00000654
_020795DC: .word 0x00000C62
	thumb_func_end sub_02079550

	thumb_func_start sub_020795E0
sub_020795E0: ; 0x020795E0
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl OverlayManager_GetData
	add r6, r0, #0
	mov r0, #0
	bl sub_02002B8C
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	bl sub_0207EFA4
	add r0, r6, #0
	bl sub_0207CF68
	ldr r0, [r6]
	bl sub_020798C4
	bl sub_02021238
	bl GF_DestroyVramTransferManager
	ldr r7, _0207969C ; =0x00000828
	mov r4, #0
	add r5, r6, #0
_02079618:
	ldr r0, [r5, r7]
	bl String_dtor
	add r4, r4, #1
	add r5, #0x30
	cmp r4, #6
	blo _02079618
	ldr r0, _020796A0 ; =0x000007C8
	ldr r0, [r6, r0]
	bl String_dtor
	ldr r0, _020796A4 ; =0x000007CC
	ldr r0, [r6, r0]
	bl String_dtor
	mov r7, #0x7d
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #4
_0207963E:
	ldr r0, [r4, r7]
	bl String_dtor
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #0x14
	blo _0207963E
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	bl DestroyMsgData
	ldr r0, _020796A8 ; =0x000007BC
	ldr r0, [r6, r0]
	bl MessagePrinter_delete
	ldr r0, _020796AC ; =0x000007C4
	ldr r0, [r6, r0]
	bl ScrStrBufs_delete
	ldr r0, _020796B0 ; =0x00000C74
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _02079672
	bl sub_0207495C
_02079672:
	ldr r0, _020796B4 ; =0x00000654
	ldr r0, [r6, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _02079682
	bl sub_02004B10
_02079682:
	mov r0, #4
	bl FontID_Release
	ldr r0, [sp]
	bl OverlayManager_FreeData
	mov r0, #0xc
	bl DestroyHeap
	bl sub_0203A964
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207969C: .word 0x00000828
_020796A0: .word 0x000007C8
_020796A4: .word 0x000007CC
_020796A8: .word 0x000007BC
_020796AC: .word 0x000007C4
_020796B0: .word 0x00000C74
_020796B4: .word 0x00000654
	thumb_func_end sub_020795E0

	thumb_func_start sub_020796B8
sub_020796B8: ; 0x020796B8
	push {r4, lr}
	ldr r3, _020796F4 ; =0x00000C78
	add r4, r0, #0
	ldr r0, [r4]
	ldr r3, [r4, r3]
	mov r1, #4
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r3, _020796F4 ; =0x00000C78
	ldr r0, [r4]
	ldr r3, [r4, r3]
	mov r1, #6
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r0, [r4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl GF_RunVramTransferTasks
	bl sub_0200D034
	ldr r3, _020796F8 ; =OS_IRQTable
	ldr r1, _020796FC ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_020796F4: .word 0x00000C78
_020796F8: .word OS_IRQTable
_020796FC: .word 0x00003FF8
	thumb_func_end sub_020796B8

	thumb_func_start sub_02079700
sub_02079700: ; 0x02079700
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0207971C ; =_021013E4
	add r3, sp, #0
	mov r2, #5
_0207970A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0207970A
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_0207971C: .word _021013E4
	thumb_func_end sub_02079700

	thumb_func_start sub_02079720
sub_02079720: ; 0x02079720
	push {r4, r5, lr}
	sub sp, #0x1c
	ldr r5, _02079754 ; =_02101370
	add r4, r0, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	add sp, #0x1c
	pop {r4, r5, pc}
	nop
_02079754: .word _02101370
	thumb_func_end sub_02079720

	thumb_func_start sub_02079758
sub_02079758: ; 0x02079758
	push {r4, r5, lr}
	sub sp, #0xd4
	ldr r5, _020798A4 ; =_021012BC
	add r3, sp, #0xc4
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _020798A8 ; =_02101354
	add r3, sp, #0xa8
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _020798AC ; =_021013A8
	add r3, sp, #0x8c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _020798B0 ; =_0210131C
	add r3, sp, #0x70
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _020798B4 ; =_021012E4
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _020798B8 ; =_02101338
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	add r0, r4, #0
	mov r1, #6
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r5, _020798BC ; =_0210138C
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #4
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _020798C0 ; =_02101300
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #5
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0xc
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0xc
	bl BG_ClearCharDataRange
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	mov r3, #0xc
	bl BG_ClearCharDataRange
	add sp, #0xd4
	pop {r4, r5, pc}
	nop
_020798A4: .word _021012BC
_020798A8: .word _02101354
_020798AC: .word _021013A8
_020798B0: .word _0210131C
_020798B4: .word _021012E4
_020798B8: .word _02101338
_020798BC: .word _0210138C
_020798C0: .word _02101300
	thumb_func_end sub_02079758

	thumb_func_start sub_020798C4
sub_020798C4: ; 0x020798C4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1f
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0x13
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	mov r0, #0xc
	add r1, r4, #0
	bl FreeToHeapExplicit
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020798C4

	thumb_func_start sub_0207991C
sub_0207991C: ; 0x0207991C
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	bne _0207994A
	mov r0, #0
	add r1, r0, #0
	bl ToggleBgLayer
	ldr r0, [r4]
	mov r1, #0
	bl FreeBgTilemapBuffer
	mov r0, #1
	mov r1, #0
	add r2, r0, #0
	bl GX_SetGraphicsMode
	mov r0, #0xc
	bl sub_0207997C
	ldr r1, _02079978 ; =0x00000C84
	str r0, [r4, r1]
	pop {r4, pc}
_0207994A:
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, _02079978 ; =0x00000C84
	ldr r0, [r4, r0]
	bl sub_02079A0C
	mov r1, #0
	mov r0, #1
	add r2, r1, #0
	bl GX_SetGraphicsMode
	ldr r0, [r4]
	bl sub_02079720
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0xc
	bl BG_ClearCharDataRange
	pop {r4, pc}
	.balign 4, 0
_02079978: .word 0x00000C84
	thumb_func_end sub_0207991C

	thumb_func_start sub_0207997C
sub_0207997C: ; 0x0207997C
	push {r3, lr}
	sub sp, #8
	mov r1, #2
	str r1, [sp]
	ldr r1, _02079998 ; =sub_0207999C
	mov r2, #1
	str r1, [sp, #4]
	mov r1, #0
	add r3, r1, #0
	bl GF_3DVramMan_Create
	add sp, #8
	pop {r3, pc}
	nop
_02079998: .word sub_0207999C
	thumb_func_end sub_0207997C

	thumb_func_start sub_0207999C
sub_0207999C: ; 0x0207999C
	push {r3, lr}
	ldr r0, _020799F4 ; =0x04000060
	ldr r1, _020799F8 ; =0xFFFFCFFD
	ldrh r2, [r0]
	and r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	add r2, r1, #2
	add r1, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _020799FC ; =0x0000CFFB
	and r3, r2
	strh r3, [r0]
	ldrh r3, [r0]
	sub r2, #0x1c
	and r3, r1
	mov r1, #8
	orr r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	and r1, r2
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _02079A00 ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _02079A04 ; =0xBFFF0000
	ldr r0, _02079A08 ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	nop
_020799F4: .word 0x04000060
_020799F8: .word 0xFFFFCFFD
_020799FC: .word 0x0000CFFB
_02079A00: .word 0x00007FFF
_02079A04: .word 0xBFFF0000
_02079A08: .word 0x04000580
	thumb_func_end sub_0207999C

	thumb_func_start sub_02079A0C
sub_02079A0C: ; 0x02079A0C
	ldr r3, _02079A10 ; =GF_3DVramMan_Delete
	bx r3
	.balign 4, 0
_02079A10: .word GF_3DVramMan_Delete
	thumb_func_end sub_02079A0C

	thumb_func_start sub_02079A14
sub_02079A14: ; 0x02079A14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	add r4, r1, #0
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0xf
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0x11
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0xc
	bl NARC_AllocAndReadWholeMember
	add r1, sp, #0x10
	add r7, r0, #0
	bl NNS_G2dGetUnpackedPaletteData
	ldr r1, [sp, #0x10]
	mov r0, #0xc
	ldr r1, [r1, #8]
	bl AllocFromHeap
	ldr r2, [sp, #0x10]
	add r6, r0, #0
	ldr r1, [r2, #0xc]
	ldr r2, [r2, #8]
	bl memcpy
	mov r3, #0
	strh r3, [r6]
	ldr r2, [sp, #0x10]
	mov r0, #3
	ldr r2, [r2, #8]
	add r1, r6, #0
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	bl BG_LoadPlttData
	add r0, r6, #0
	bl FreeToHeap
	ldr r1, [sp, #0x10]
	ldr r0, _02079BCC ; =0x00000554
	ldr r1, [r1, #0xc]
	mov r2, #1
	add r0, r5, r0
	add r1, #0x60
	lsl r2, r2, #8
	bl memcpy
	add r0, r7, #0
	bl FreeToHeap
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0xc
	bl LoadFontPal1
	mov r0, #4
	mov r1, #0x40
	mov r2, #0xc
	bl LoadFontPal1
	mov r1, #0
	str r1, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r0, [r5]
	mov r2, #1
	mov r3, #0xe
	bl LoadUserFrameGfx1
	mov r0, #0xa
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0x1a
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	ldr r0, _02079BD0 ; =0x00000654
	ldr r0, [r5, r0]
	ldr r0, [r0, #0xc]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r0, [r5]
	mov r1, #0
	mov r2, #0x2a
	mov r3, #0xf
	bl LoadUserFrameGfx2
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #3
	mov r3, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r3, #0x20
	mov r1, #4
	str r3, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r1, #0xc
	str r1, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0xe
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0x18
	mov r3, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0x19
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0x40
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r2, #0xc5
	lsl r2, r2, #2
	ldr r3, _02079BD4 ; =0x00000494
	add r1, r5, r2
	add r2, #0xc0
	mov r0, #0xc
	add r2, r5, r2
	add r3, r5, r3
	bl sub_0207CAAC
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02079BCC: .word 0x00000554
_02079BD0: .word 0x00000654
_02079BD4: .word 0x00000494
	thumb_func_end sub_02079A14

	thumb_func_start sub_02079BD8
sub_02079BD8: ; 0x02079BD8
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _02079CC4 ; =0x00000CA8
	mov r2, #0xc
	add r5, r0, #0
	bl OverlayManager_CreateAndGetData
	ldr r2, _02079CC4 ; =0x00000CA8
	mov r1, #0
	add r4, r0, #0
	bl memset
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	ldr r1, _02079CC8 ; =0x00000654
	str r0, [r4, r1]
	mov r0, #0xc
	bl BgConfig_Alloc
	str r0, [r4]
	ldr r0, _02079CC8 ; =0x00000654
	ldr r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	bne _02079C20
	ldr r0, [r1, #0x14]
	cmp r0, #0
	beq _02079C20
	mov r0, #0xc
	bl sub_02074944
	ldr r1, _02079CCC ; =0x00000C74
	str r0, [r4, r1]
	b _02079C26
_02079C20:
	ldr r0, _02079CCC ; =0x00000C74
	mov r1, #0
	str r1, [r4, r0]
_02079C26:
	mov r2, #0x4b
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #2
	mov r3, #0xc
	bl NewMsgDataFromNarc
	mov r1, #0x1f
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0xf
	mov r1, #0xe
	mov r2, #0
	mov r3, #0xc
	bl MessagePrinter_new
	ldr r1, _02079CD0 ; =0x000007BC
	str r0, [r4, r1]
	mov r0, #0xc
	bl ScrStrBufs_new
	ldr r1, _02079CD4 ; =0x000007C4
	mov r6, #0
	add r7, r1, #0
	str r0, [r4, r1]
	add r5, r4, #0
	add r7, #0x64
_02079C5C:
	mov r0, #0xb
	mov r1, #0xc
	bl String_ctor
	str r0, [r5, r7]
	add r6, r6, #1
	add r5, #0x30
	cmp r6, #6
	blo _02079C5C
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #0xc
	bl String_ctor
	ldr r1, _02079CD8 ; =0x000007C8
	str r0, [r4, r1]
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #0xc
	bl String_ctor
	ldr r1, _02079CDC ; =0x000007CC
	mov r6, #0
	str r0, [r4, r1]
	add r5, r4, #0
	add r7, r1, #4
_02079C90:
	mov r0, #0x20
	mov r1, #0xc
	bl String_ctor
	str r0, [r5, r7]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #0x14
	blo _02079C90
	ldr r1, _02079CE0 ; =0x00000C7C
	mov r0, #0
	str r0, [r4, r1]
	ldr r0, _02079CC8 ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x26
	ldrb r2, [r0]
	add r0, r1, #0
	sub r0, #0x17
	strb r2, [r4, r0]
	add r0, r1, #0
	sub r0, #0x17
	ldrb r0, [r4, r0]
	sub r1, #0x16
	strb r0, [r4, r1]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02079CC4: .word 0x00000CA8
_02079CC8: .word 0x00000654
_02079CCC: .word 0x00000C74
_02079CD0: .word 0x000007BC
_02079CD4: .word 0x000007C4
_02079CD8: .word 0x000007C8
_02079CDC: .word 0x000007CC
_02079CE0: .word 0x00000C7C
	thumb_func_end sub_02079BD8

	thumb_func_start sub_02079CE4
sub_02079CE4: ; 0x02079CE4
	push {r3, r4}
	ldr r2, _02079D30 ; =0x00000654
	mov r3, #0x80
	ldr r1, [r0, r2]
	add r1, #0x24
	ldrb r4, [r1]
	add r1, r4, #0
	tst r1, r3
	beq _02079D10
	ldr r1, _02079D34 ; =0x00000C63
	ldrb r4, [r0, r1]
	orr r4, r3
	strb r4, [r0, r1]
	ldr r1, [r0, r2]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	add r1, #0x24
	eor r0, r3
	strb r0, [r1]
	pop {r3, r4}
	bx lr
_02079D10:
	cmp r4, #0x15
	bne _02079D20
	ldr r1, _02079D34 ; =0x00000C63
	ldrb r2, [r0, r1]
	orr r2, r3
	strb r2, [r0, r1]
	pop {r3, r4}
	bx lr
_02079D20:
	ldr r2, _02079D34 ; =0x00000C63
	mov r1, #0x80
	ldrb r3, [r0, r2]
	bic r3, r1
	strb r3, [r0, r2]
	pop {r3, r4}
	bx lr
	nop
_02079D30: .word 0x00000654
_02079D34: .word 0x00000C63
	thumb_func_end sub_02079CE4

	thumb_func_start sub_02079D38
sub_02079D38: ; 0x02079D38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02079E0C ; =0x00000654
	mov r4, #3
	ldr r1, [r5, r0]
	add r0, r1, #0
	add r0, #0x25
	ldrb r0, [r0]
	cmp r0, #2
	bne _02079D54
	ldr r1, _02079E10 ; =_0210144C
	ldr r0, _02079E14 ; =0x00000948
	str r1, [r5, r0]
	b _02079D84
_02079D54:
	add r1, #0x24
	ldrb r1, [r1]
	cmp r1, #2
	beq _02079D6C
	cmp r1, #0x11
	beq _02079D6C
	add r0, r1, #0
	add r0, #0xea
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02079D74
_02079D6C:
	ldr r1, _02079E18 ; =_0210148C
	ldr r0, _02079E14 ; =0x00000948
	str r1, [r5, r0]
	b _02079D84
_02079D74:
	cmp r1, #0x15
	ldr r0, _02079E14 ; =0x00000948
	bne _02079D80
	ldr r1, _02079E1C ; =_021014CC
	str r1, [r5, r0]
	b _02079D84
_02079D80:
	ldr r1, _02079E20 ; =_0210140C
	str r1, [r5, r0]
_02079D84:
	ldr r0, _02079E0C ; =0x00000654
	ldr r1, [r5, r0]
	add r1, #0x24
	ldrb r1, [r1]
	cmp r1, #2
	beq _02079DDE
	cmp r1, #0x11
	beq _02079DDE
	cmp r1, #0x17
	beq _02079DDE
	cmp r1, #0x16
	beq _02079DDE
	add r0, #0x2c
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, _02079E24 ; =0x00000684
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02079E24 ; =0x00000684
	add r1, sp, #0
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE00
	ldr r0, _02079E24 ; =0x00000684
	add r3, sp, #0
	mov r2, #0
	ldrsh r2, [r3, r2]
	mov r1, #2
	ldrsh r1, [r3, r1]
	sub r2, #8
	lsl r2, r2, #0x10
	ldr r0, [r5, r0]
	asr r2, r2, #0x10
	bl sub_0200DD88
	mov r0, #1
	eor r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02079DDE:
	ldr r0, _02079E0C ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #4
	beq _02079DEE
	cmp r0, #0x15
	bne _02079E00
_02079DEE:
	ldr r0, _02079E24 ; =0x00000684
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	mov r0, #2
	eor r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02079E00:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D998
	pop {r3, r4, r5, pc}
	nop
_02079E0C: .word 0x00000654
_02079E10: .word _0210144C
_02079E14: .word 0x00000948
_02079E18: .word _0210148C
_02079E1C: .word _021014CC
_02079E20: .word _0210140C
_02079E24: .word 0x00000684
	thumb_func_end sub_02079D38

	thumb_func_start sub_02079E28
sub_02079E28: ; 0x02079E28
	mov r2, #0x30
	mul r2, r1
	add r1, r0, r2
	ldr r0, _02079E34 ; =0x00000855
	ldrb r0, [r1, r0]
	bx lr
	.balign 4, 0
_02079E34: .word 0x00000855
	thumb_func_end sub_02079E28

	thumb_func_start sub_02079E38
sub_02079E38: ; 0x02079E38
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp]
	add r5, r0, #0
	ldr r0, [sp]
	mov r1, #0x30
	add r4, r0, #0
	ldr r0, _02079F84 ; =0x00000855
	mul r4, r1
	add r0, r5, r0
	mov r1, #0
	str r0, [sp, #8]
	strb r1, [r0, r4]
	ldr r0, _02079F88 ; =0x00000654
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyCount
	ldr r1, [sp]
	cmp r0, r1
	bgt _02079E68
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02079E68:
	ldr r0, _02079F88 ; =0x00000654
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	bne _02079E8A
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02079E8A:
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0207D294
	ldr r0, [sp]
	mov r1, #0x30
	add r6, r0, #0
	mul r6, r1
	ldr r1, _02079F8C ; =0x0000082C
	ldr r0, [sp, #4]
	add r2, r5, r6
	strh r0, [r2, r1]
	add r0, r7, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	ldr r1, _02079F90 ; =0x0000082E
	add r2, r5, r6
	strh r0, [r2, r1]
	add r0, r7, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	mov r1, #0x83
	add r2, r5, r6
	lsl r1, r1, #4
	strh r0, [r2, r1]
	add r0, r7, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	ldr r1, _02079F94 ; =0x00000832
	add r2, r5, r6
	strh r0, [r2, r1]
	add r0, r7, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	ldr r1, _02079F98 ; =0x00000834
	add r2, r5, r6
	strh r0, [r2, r1]
	add r0, r7, #0
	mov r1, #0xa2
	mov r2, #0
	bl GetMonData
	ldr r1, _02079F9C ; =0x0000083A
	add r2, r5, r6
	strh r0, [r2, r1]
	add r0, r7, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	ldr r1, _02079FA0 ; =0x00000838
	add r2, r5, r6
	strb r0, [r2, r1]
	add r0, r7, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	ldr r1, _02079FA4 ; =0x00000839
	add r2, r5, r6
	strb r0, [r2, r1]
	add r0, r7, #0
	mov r1, #0xb0
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	ldr r0, _02079FA8 ; =0x00000836
	bne _02079F30
	add r2, r5, r0
	ldrh r1, [r2, r4]
	ldr r0, _02079FAC ; =0xFFFFEFFF
	and r0, r1
	b _02079F3A
_02079F30:
	add r2, r5, r0
	ldrh r1, [r2, r4]
	mov r0, #1
	lsl r0, r0, #0xc
	orr r0, r1
_02079F3A:
	strh r0, [r2, r4]
	ldr r0, _02079FA8 ; =0x00000836
	add r6, r5, r0
	add r0, r7, #0
	bl GetMonGender
	lsl r0, r0, #0x1e
	ldrh r2, [r6, r4]
	ldr r1, _02079FB0 ; =0xFFFF9FFF
	lsr r0, r0, #0x11
	and r1, r2
	orr r0, r1
	strh r0, [r6, r4]
	ldr r0, [sp, #8]
	mov r1, #1
	strb r1, [r0, r4]
	add r0, r7, #0
	bl sub_0208AD64
	lsl r0, r0, #0x18
	ldrh r1, [r6, r4]
	ldr r2, _02079FB4 ; =0xFFFFF000
	lsr r0, r0, #0x18
	and r1, r2
	lsr r2, r2, #0x14
	and r0, r2
	orr r0, r1
	strh r0, [r6, r4]
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_02079FB8
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02079F84: .word 0x00000855
_02079F88: .word 0x00000654
_02079F8C: .word 0x0000082C
_02079F90: .word 0x0000082E
_02079F94: .word 0x00000832
_02079F98: .word 0x00000834
_02079F9C: .word 0x0000083A
_02079FA0: .word 0x00000838
_02079FA4: .word 0x00000839
_02079FA8: .word 0x00000836
_02079FAC: .word 0xFFFFEFFF
_02079FB0: .word 0xFFFF9FFF
_02079FB4: .word 0xFFFFF000
	thumb_func_end sub_02079E38

	thumb_func_start sub_02079FB8
sub_02079FB8: ; 0x02079FB8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _0207A048 ; =0x00000654
	add r5, r1, #0
	ldr r1, [r7, r0]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0xd
	bne _0207A044
	mov r0, #0x30
	add r6, r2, #0
	mul r6, r0
	ldr r0, _0207A04C ; =0x00000838
	add r3, r7, r6
	ldrb r2, [r3, r0]
	cmp r2, #1
	beq _02079FE4
	sub r0, #0xa
	ldrh r0, [r3, r0]
	cmp r0, #0
	bne _02079FF2
_02079FE4:
	ldr r0, _0207A050 ; =0x00000836
	add r2, r7, r0
	ldrh r1, [r2, r6]
	ldr r0, _0207A054 ; =0xFFFF7FFF
	and r0, r1
	strh r0, [r2, r6]
	pop {r3, r4, r5, r6, r7, pc}
_02079FF2:
	add r1, #0x2e
	ldrb r1, [r1]
	add r0, r5, #0
	bl sub_0207A058
	str r0, [sp]
	mov r4, #0
_0207A000:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0207A016
	add r4, r4, #1
	cmp r4, #4
	blo _0207A000
_0207A016:
	ldr r0, _0207A048 ; =0x00000654
	ldr r0, [r7, r0]
	add r0, #0x2f
	ldrb r1, [r0]
	ldr r0, [sp]
	cmp r1, r0
	bhi _0207A038
	cmp r4, #2
	blo _0207A038
	ldr r0, _0207A050 ; =0x00000836
	add r2, r7, r0
	ldrh r1, [r2, r6]
	mov r0, #2
	lsl r0, r0, #0xe
	orr r0, r1
	strh r0, [r2, r6]
	pop {r3, r4, r5, r6, r7, pc}
_0207A038:
	ldr r0, _0207A050 ; =0x00000836
	add r2, r7, r0
	ldrh r1, [r2, r6]
	ldr r0, _0207A054 ; =0xFFFF7FFF
	and r0, r1
	strh r0, [r2, r6]
_0207A044:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207A048: .word 0x00000654
_0207A04C: .word 0x00000838
_0207A050: .word 0x00000836
_0207A054: .word 0xFFFF7FFF
	thumb_func_end sub_02079FB8

	thumb_func_start sub_0207A058
sub_0207A058: ; 0x0207A058
	push {r3, r4, r5, lr}
	add r5, r0, #0
	cmp r1, #4
	bls _0207A062
	b _0207A166
_0207A062:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0207A06E: ; jump table
	.short _0207A078 - _0207A06E - 2 ; case 0
	.short _0207A0A8 - _0207A06E - 2 ; case 1
	.short _0207A0D8 - _0207A06E - 2 ; case 2
	.short _0207A108 - _0207A06E - 2 ; case 3
	.short _0207A138 - _0207A06E - 2 ; case 4
_0207A078:
	mov r1, #0x7b
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x7c
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x7d
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x7e
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	b _0207A166
_0207A0A8:
	mov r1, #0x7f
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x80
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x81
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x82
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	b _0207A166
_0207A0D8:
	mov r1, #0x83
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x84
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x85
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x86
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	b _0207A166
_0207A108:
	mov r1, #0x87
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x88
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x89
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x8a
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	b _0207A166
_0207A138:
	mov r1, #0x8b
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x8c
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x8d
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x8e
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
_0207A166:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0207A058

	thumb_func_start sub_0207A16C
sub_0207A16C: ; 0x0207A16C
	mov r1, #0x11
	lsl r1, r1, #6
	add r0, r0, r1
	bx lr
	thumb_func_end sub_0207A16C

	thumb_func_start sub_0207A174
sub_0207A174: ; 0x0207A174
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r4, #0
	beq _0207A194
	ldr r0, _0207A224 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0207A19C
	cmp r4, #1
	bne _0207A19C
_0207A194:
	mov r0, #0xc5
	lsl r0, r0, #2
	add r0, r5, r0
	b _0207A1A2
_0207A19C:
	mov r0, #0xf5
	lsl r0, r0, #2
	add r0, r5, r0
_0207A1A2:
	mov r1, #0x30
	mul r1, r4
	ldr r2, _0207A228 ; =0x0000083C
	add r1, r5, r1
	strb r6, [r1, r2]
	add r2, r2, #1
	strb r7, [r1, r2]
	mov r2, #0x10
	str r2, [sp]
	mov r1, #6
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r5]
	mov r1, #2
	add r2, r6, #0
	add r3, r7, #0
	bl CopyToBgTilemapRect
	add r0, sp, #0x20
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _0207A1FC
	add r0, r7, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x10
	add r3, r6, #6
	str r0, [sp, #0xc]
	lsl r3, r3, #0x18
	ldr r0, [r5]
	mov r1, #2
	mov r2, #0x4b
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
_0207A1FC:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	add r0, r4, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #2
	add r2, r6, #0
	add r3, r7, #0
	bl BgTilemapRectChangePalette
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207A7F4
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207A224: .word 0x00000654
_0207A228: .word 0x0000083C
	thumb_func_end sub_0207A174

	thumb_func_start sub_0207A22C
sub_0207A22C: ; 0x0207A22C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207A2A0 ; =0x00000654
	ldr r2, [r4, r0]
	add r0, r2, #0
	add r0, #0x25
	ldrb r0, [r0]
	cmp r0, #2
	bne _0207A242
	ldr r1, _0207A2A4 ; =_02101554
	b _0207A244
_0207A242:
	ldr r1, _0207A2A8 ; =_0210150C
_0207A244:
	add r2, #0x24
	ldrb r0, [r2]
	cmp r0, #0x10
	bne _0207A254
	add r0, r4, #0
	bl sub_0207A3C8
	b _0207A28C
_0207A254:
	cmp r0, #6
	bne _0207A260
	add r0, r4, #0
	bl sub_0207A4B4
	b _0207A28C
_0207A260:
	cmp r0, #0xd
	bne _0207A26C
	add r0, r4, #0
	bl sub_0207A5A0
	b _0207A28C
_0207A26C:
	cmp r0, #2
	beq _0207A27E
	cmp r0, #0x11
	beq _0207A27E
	add r0, #0xea
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0207A286
_0207A27E:
	add r0, r4, #0
	bl sub_0207A68C
	b _0207A28C
_0207A286:
	add r0, r4, #0
	bl sub_0207A2AC
_0207A28C:
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	pop {r4, pc}
	nop
_0207A2A0: .word 0x00000654
_0207A2A4: .word _02101554
_0207A2A8: .word _0210150C
	thumb_func_end sub_0207A22C

	thumb_func_start sub_0207A2AC
sub_0207A2AC: ; 0x0207A2AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x14
	mov r1, #0xc
	bl NARC_ctor
	str r0, [sp, #8]
	mov r4, #0
_0207A2C0:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02079E38
	cmp r0, #1
	bne _0207A392
	mov r0, #0x30
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0207A3BC ; =0x00000838
	str r1, [sp, #4]
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0207A2FE
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	mov r0, #0
	str r0, [sp]
	add r3, r6, r2
	ldrh r2, [r6, r2]
	ldrh r3, [r3, #2]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0207A174
	b _0207A31E
_0207A2FE:
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	mov r0, #1
	str r0, [sp]
	add r3, r6, r2
	ldrh r2, [r6, r2]
	ldrh r3, [r3, #2]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0207A174
_0207A31E:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D5DC
	mov r0, #0xc
	mul r0, r4
	add r7, r6, r0
	ldr r0, [sp, #8]
	add r1, r4, #0
	str r0, [sp]
	ldrh r2, [r7, #4]
	ldrh r3, [r7, #6]
	add r0, r5, #0
	bl sub_0207EBE4
	ldrh r2, [r7, #8]
	ldrh r3, [r7, #0xa]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207EF5C
	ldr r3, [sp, #4]
	ldr r2, _0207A3C0 ; =0x00000834
	add r0, r5, #0
	ldrh r2, [r3, r2]
	add r1, r4, #0
	bl sub_0207F004
	mov r2, #4
	mov r3, #6
	ldrsh r2, [r7, r2]
	ldrsh r3, [r7, r3]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F064
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F0C8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F098
	mov r2, #0x30
	mul r2, r4
	add r3, r5, r2
	ldr r2, _0207A3C4 ; =0x00000836
	add r0, r5, #0
	ldrh r2, [r3, r2]
	add r1, r4, #0
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	b _0207A3A8
_0207A392:
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	add r7, r6, r2
	mov r3, #2
	ldrsh r2, [r6, r2]
	ldrsh r3, [r7, r3]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207A780
_0207A3A8:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _0207A2C0
	ldr r0, [sp, #8]
	bl NARC_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207A3BC: .word 0x00000838
_0207A3C0: .word 0x00000834
_0207A3C4: .word 0x00000836
	thumb_func_end sub_0207A2AC

	thumb_func_start sub_0207A3C8
sub_0207A3C8: ; 0x0207A3C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r1, [sp, #4]
	mov r0, #0x14
	mov r1, #0xc
	bl NARC_ctor
	str r0, [sp, #8]
	mov r4, #0
_0207A3DC:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02079E38
	cmp r0, #1
	bne _0207A47C
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r3, [sp, #4]
	add r6, r0, r2
	mov r0, #0
	str r0, [sp]
	ldrh r2, [r3, r2]
	ldrh r3, [r6, #2]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0207A174
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D710
	ldr r0, [sp, #8]
	add r1, r4, #0
	str r0, [sp]
	ldrh r2, [r6, #4]
	ldrh r3, [r6, #6]
	add r0, r5, #0
	bl sub_0207EBE4
	ldrh r2, [r6, #8]
	ldrh r3, [r6, #0xa]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207EF5C
	mov r0, #0x30
	add r7, r4, #0
	mul r7, r0
	ldr r2, _0207A4AC ; =0x00000834
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F004
	mov r2, #4
	mov r3, #6
	ldrsh r2, [r6, r2]
	ldrsh r3, [r6, r3]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F064
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F0C8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F098
	ldr r2, _0207A4B0 ; =0x00000836
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	b _0207A496
_0207A47C:
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r6, [sp, #4]
	add r3, r0, r2
	ldrsh r2, [r6, r2]
	mov r6, #2
	ldrsh r3, [r3, r6]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207A780
_0207A496:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _0207A3DC
	ldr r0, [sp, #8]
	bl NARC_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0207A4AC: .word 0x00000834
_0207A4B0: .word 0x00000836
	thumb_func_end sub_0207A3C8

	thumb_func_start sub_0207A4B4
sub_0207A4B4: ; 0x0207A4B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r1, [sp, #4]
	mov r0, #0x14
	mov r1, #0xc
	bl NARC_ctor
	str r0, [sp, #8]
	mov r4, #0
_0207A4C8:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02079E38
	cmp r0, #1
	bne _0207A568
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r3, [sp, #4]
	add r6, r0, r2
	mov r0, #0
	str r0, [sp]
	ldrh r2, [r3, r2]
	ldrh r3, [r6, #2]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0207A174
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D7A8
	ldr r0, [sp, #8]
	add r1, r4, #0
	str r0, [sp]
	ldrh r2, [r6, #4]
	ldrh r3, [r6, #6]
	add r0, r5, #0
	bl sub_0207EBE4
	ldrh r2, [r6, #8]
	ldrh r3, [r6, #0xa]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207EF5C
	mov r0, #0x30
	add r7, r4, #0
	mul r7, r0
	ldr r2, _0207A598 ; =0x00000834
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F004
	mov r2, #4
	mov r3, #6
	ldrsh r2, [r6, r2]
	ldrsh r3, [r6, r3]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F064
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F0C8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F098
	ldr r2, _0207A59C ; =0x00000836
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	b _0207A582
_0207A568:
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r6, [sp, #4]
	add r3, r0, r2
	ldrsh r2, [r6, r2]
	mov r6, #2
	ldrsh r3, [r3, r6]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207A780
_0207A582:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _0207A4C8
	ldr r0, [sp, #8]
	bl NARC_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0207A598: .word 0x00000834
_0207A59C: .word 0x00000836
	thumb_func_end sub_0207A4B4

	thumb_func_start sub_0207A5A0
sub_0207A5A0: ; 0x0207A5A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r1, [sp, #4]
	mov r0, #0x14
	mov r1, #0xc
	bl NARC_ctor
	str r0, [sp, #8]
	mov r4, #0
_0207A5B4:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02079E38
	cmp r0, #1
	bne _0207A654
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r3, [sp, #4]
	add r6, r0, r2
	mov r0, #0
	str r0, [sp]
	ldrh r2, [r3, r2]
	ldrh r3, [r6, #2]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0207A174
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D840
	ldr r0, [sp, #8]
	add r1, r4, #0
	str r0, [sp]
	ldrh r2, [r6, #4]
	ldrh r3, [r6, #6]
	add r0, r5, #0
	bl sub_0207EBE4
	ldrh r2, [r6, #8]
	ldrh r3, [r6, #0xa]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207EF5C
	mov r0, #0x30
	add r7, r4, #0
	mul r7, r0
	ldr r2, _0207A684 ; =0x00000834
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F004
	mov r2, #4
	mov r3, #6
	ldrsh r2, [r6, r2]
	ldrsh r3, [r6, r3]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F064
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F0C8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F098
	ldr r2, _0207A688 ; =0x00000836
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	b _0207A66E
_0207A654:
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r6, [sp, #4]
	add r3, r0, r2
	ldrsh r2, [r6, r2]
	mov r6, #2
	ldrsh r3, [r3, r6]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207A780
_0207A66E:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _0207A5B4
	ldr r0, [sp, #8]
	bl NARC_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0207A684: .word 0x00000834
_0207A688: .word 0x00000836
	thumb_func_end sub_0207A5A0

	thumb_func_start sub_0207A68C
sub_0207A68C: ; 0x0207A68C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r1, [sp, #4]
	mov r0, #0x14
	mov r1, #0xc
	bl NARC_ctor
	str r0, [sp, #8]
	mov r4, #0
_0207A6A0:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02079E38
	cmp r0, #1
	bne _0207A748
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r3, [sp, #4]
	add r6, r0, r2
	mov r0, #0
	str r0, [sp]
	ldrh r2, [r3, r2]
	ldrh r3, [r6, #2]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0207A174
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D8A4
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D8EC
	ldr r0, [sp, #8]
	add r1, r4, #0
	str r0, [sp]
	ldrh r2, [r6, #4]
	ldrh r3, [r6, #6]
	add r0, r5, #0
	bl sub_0207EBE4
	ldrh r2, [r6, #8]
	ldrh r3, [r6, #0xa]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207EF5C
	mov r0, #0x30
	add r7, r4, #0
	mul r7, r0
	ldr r2, _0207A778 ; =0x00000834
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F004
	mov r2, #4
	mov r3, #6
	ldrsh r2, [r6, r2]
	ldrsh r3, [r6, r3]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F064
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F0C8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F098
	ldr r2, _0207A77C ; =0x00000836
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	b _0207A762
_0207A748:
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r6, [sp, #4]
	add r3, r0, r2
	ldrsh r2, [r6, r2]
	mov r6, #2
	ldrsh r3, [r3, r6]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207A780
_0207A762:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _0207A6A0
	ldr r0, [sp, #8]
	bl NARC_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0207A778: .word 0x00000834
_0207A77C: .word 0x00000836
	thumb_func_end sub_0207A68C

	thumb_func_start sub_0207A780
sub_0207A780: ; 0x0207A780
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r1, #0
	add r4, r2, #0
	mov r1, #0x10
	add r5, r0, #0
	ldr r2, _0207A7F0 ; =0x00000494
	str r1, [sp]
	mov r0, #6
	add r6, r3, #0
	lsl r3, r6, #0x18
	str r0, [sp, #4]
	add r2, r5, r2
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r1, [sp, #0x14]
	str r0, [sp, #0x18]
	lsl r2, r4, #0x18
	ldr r0, [r5]
	mov r1, #2
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl CopyToBgTilemapRect
	mov r0, #0x10
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	lsl r2, r4, #0x18
	lsl r3, r6, #0x18
	ldr r0, [r5]
	mov r1, #2
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl BgTilemapRectChangePalette
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #7
	bl sub_0207EFC4
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0
	bl sub_0207F004
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0207F0C8
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207A7F0: .word 0x00000494
	thumb_func_end sub_0207A780

	thumb_func_start sub_0207A7F4
sub_0207A7F4: ; 0x0207A7F4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0207A870 ; =0x00000654
	add r6, r1, #0
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	ldr r1, _0207A874 ; =0x00000C63
	ldrb r2, [r5, r1]
	lsl r3, r2, #0x19
	lsr r3, r3, #0x1f
	cmp r3, #1
	bne _0207A824
	add r1, r1, #2
	ldrb r1, [r5, r1]
	cmp r6, r1
	beq _0207A820
	lsl r1, r2, #0x1a
	lsr r1, r1, #0x1a
	cmp r6, r1
	bne _0207A824
_0207A820:
	mov r4, #7
	b _0207A858
_0207A824:
	ldr r1, _0207A878 ; =0x00000C65
	ldrb r1, [r5, r1]
	cmp r6, r1
	bne _0207A830
	mov r4, #4
	b _0207A832
_0207A830:
	mov r4, #0
_0207A832:
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0207A846
	add r0, r4, #2
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	b _0207A858
_0207A846:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207A880
	cmp r0, #1
	bne _0207A858
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0207A858:
	ldr r1, _0207A87C ; =0x00000554
	add r3, r6, #3
	add r2, r5, r1
	lsl r1, r4, #5
	lsl r3, r3, #0x15
	add r1, r2, r1
	mov r0, #2
	mov r2, #0x10
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207A870: .word 0x00000654
_0207A874: .word 0x00000C63
_0207A878: .word 0x00000C65
_0207A87C: .word 0x00000554
	thumb_func_end sub_0207A7F4

	thumb_func_start sub_0207A880
sub_0207A880: ; 0x0207A880
	ldr r2, _0207A898 ; =0x00000654
	ldr r0, [r0, r2]
	add r0, #0x25
	ldrb r0, [r0]
	cmp r0, #2
	bne _0207A892
	mov r0, #1
	tst r1, r0
	bne _0207A894
_0207A892:
	mov r0, #0
_0207A894:
	bx lr
	nop
_0207A898: .word 0x00000654
	thumb_func_end sub_0207A880

	thumb_func_start sub_0207A89C
sub_0207A89C: ; 0x0207A89C
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r3, #0
	ldr r0, _0207A8EC ; =0x00000C65
	str r3, [sp]
	ldrb r0, [r4, r0]
	add r1, sp, #0xc
	add r1, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, _0207A8F0 ; =0x00000948
	add r2, sp, #0xc
	ldr r0, [r4, r0]
	bl sub_02020A24
	ldr r0, _0207A8F4 ; =0x00000654
	ldr r1, _0207A8EC ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	add r0, #0x25
	ldrb r0, [r0]
	bl sub_0207B5EC
	add r1, r0, #0
	ldr r0, _0207A8F8 ; =0x00000678
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0207A8F8 ; =0x00000678
	add r2, sp, #0xc
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r4, r0]
	bl sub_0200DD88
	add sp, #0x10
	pop {r4, pc}
	nop
_0207A8EC: .word 0x00000C65
_0207A8F0: .word 0x00000948
_0207A8F4: .word 0x00000654
_0207A8F8: .word 0x00000678
	thumb_func_end sub_0207A89C

	thumb_func_start sub_0207A8FC
sub_0207A8FC: ; 0x0207A8FC
	push {r3, lr}
	bl sub_0207A99C
	cmp r0, #1
	bne _0207A90A
	mov r0, #1
	pop {r3, pc}
_0207A90A:
	mov r0, #5
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0207A8FC

	thumb_func_start sub_0207A910
sub_0207A910: ; 0x0207A910
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	sub r0, r4, #6
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #1
	bhi _0207A92C
	ldr r0, _0207A97C ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	b _0207A960
_0207A92C:
	ldr r0, _0207A980 ; =0x00000654
	lsl r1, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	add r0, #0x25
	ldrb r0, [r0]
	bl sub_0207B5EC
	add r1, r0, #0
	ldr r0, _0207A97C ; =0x00000678
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0207A97C ; =0x00000678
	mov r1, #1
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0207A97C ; =0x00000678
	lsl r1, r6, #0x10
	lsl r2, r7, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
_0207A960:
	ldr r0, _0207A984 ; =0x00000C65
	mov r2, #0
	ldrb r1, [r5, r0]
	strb r4, [r5, r0]
	add r0, r5, #0
	bl sub_0207B51C
	ldr r1, _0207A984 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	mov r2, #1
	bl sub_0207B51C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207A97C: .word 0x00000678
_0207A980: .word 0x00000654
_0207A984: .word 0x00000C65
	thumb_func_end sub_0207A910

	thumb_func_start sub_0207A988
sub_0207A988: ; 0x0207A988
	push {r3, lr}
	bl sub_0207A910
	ldr r0, _0207A998 ; =0x000005DC
	bl PlaySE
	pop {r3, pc}
	nop
_0207A998: .word 0x000005DC
	thumb_func_end sub_0207A988

	thumb_func_start sub_0207A99C
sub_0207A99C: ; 0x0207A99C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, _0207AABC ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x4c]
	mov r3, #4
	tst r1, r0
	beq _0207A9B2
	mov r3, #0
	b _0207A9CE
_0207A9B2:
	mov r1, #0x80
	tst r1, r0
	beq _0207A9BC
	mov r3, #1
	b _0207A9CE
_0207A9BC:
	mov r1, #0x20
	tst r1, r0
	beq _0207A9C6
	mov r3, #2
	b _0207A9CE
_0207A9C6:
	mov r1, #0x10
	tst r0, r1
	beq _0207A9CE
	mov r3, #3
_0207A9CE:
	cmp r3, #4
	bne _0207A9D8
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_0207A9D8:
	ldr r5, _0207AAC0 ; =0x00000C65
	ldrb r0, [r4, r5]
	cmp r0, #6
	bne _0207AA14
	cmp r3, #0
	add r1, sp, #0
	bne _0207AA06
	add r5, r5, #1
	ldrb r6, [r4, r5]
	mov r5, #1
	ldr r3, _0207AAC4 ; =_021012CC
	and r5, r6
	add r6, r5, #2
	mov r5, #6
	mul r5, r6
	add r0, r4, #0
	add r1, #1
	add r2, sp, #0
	add r3, r3, r5
	bl sub_0207AB20
	add r1, r0, #0
	b _0207AA96
_0207AA06:
	add r0, r4, #0
	add r1, #1
	add r2, sp, #0
	bl sub_0207AAD0
	add r1, r0, #0
	b _0207AA96
_0207AA14:
	cmp r0, #7
	bne _0207AA88
	ldr r0, _0207AAC8 ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0207AA56
	cmp r0, #0x11
	beq _0207AA56
	cmp r0, #0x17
	beq _0207AA56
	cmp r0, #0x16
	beq _0207AA56
	cmp r3, #0
	bne _0207AA56
	add r5, r5, #1
	ldrb r6, [r4, r5]
	mov r5, #1
	add r1, sp, #0
	and r5, r6
	add r6, r5, #2
	mov r5, #6
	ldr r3, _0207AAC4 ; =_021012CC
	mul r5, r6
	add r0, r4, #0
	add r1, #1
	add r2, sp, #0
	add r3, r3, r5
	bl sub_0207AB20
	add r1, r0, #0
	b _0207AA96
_0207AA56:
	cmp r3, #1
	add r1, sp, #0
	bne _0207AA7A
	ldr r5, _0207AACC ; =0x00000C66
	ldr r3, _0207AAC4 ; =_021012CC
	ldrb r6, [r4, r5]
	mov r5, #1
	add r0, r4, #0
	and r6, r5
	mov r5, #6
	mul r5, r6
	add r1, #1
	add r2, sp, #0
	add r3, r3, r5
	bl sub_0207AB20
	add r1, r0, #0
	b _0207AA96
_0207AA7A:
	add r0, r4, #0
	add r1, #1
	add r2, sp, #0
	bl sub_0207AAD0
	add r1, r0, #0
	b _0207AA96
_0207AA88:
	add r1, sp, #0
	add r0, r4, #0
	add r1, #1
	add r2, sp, #0
	bl sub_0207AAD0
	add r1, r0, #0
_0207AA96:
	ldr r0, _0207AAC0 ; =0x00000C65
	ldrb r0, [r4, r0]
	cmp r1, r0
	beq _0207AAB4
	cmp r1, #0xff
	beq _0207AAB4
	add r3, sp, #0
	ldrb r2, [r3, #1]
	ldrb r3, [r3]
	add r0, r4, #0
	bl sub_0207A988
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0207AAB4:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0207AABC: .word gSystem
_0207AAC0: .word 0x00000C65
_0207AAC4: .word _021012CC
_0207AAC8: .word 0x00000654
_0207AACC: .word 0x00000C66
	thumb_func_end sub_0207A99C

	thumb_func_start sub_0207AAD0
sub_0207AAD0: ; 0x0207AAD0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _0207AB18 ; =0x00000C65
	add r7, r1, #0
	ldrb r4, [r5, r0]
	str r2, [sp, #0xc]
	add r6, r3, #0
_0207AAE0:
	mov r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, _0207AB1C ; =0x00000948
	str r6, [sp, #8]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0xc]
	add r1, r7, #0
	mov r3, #0
	bl sub_02020A24
	add r4, r0, #0
	cmp r4, #6
	beq _0207AB10
	cmp r4, #7
	beq _0207AB10
	cmp r4, #0xff
	beq _0207AB10
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02079E28
	cmp r0, #0
	beq _0207AAE0
_0207AB10:
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207AB18: .word 0x00000C65
_0207AB1C: .word 0x00000948
	thumb_func_end sub_0207AAD0

	thumb_func_start sub_0207AB20
sub_0207AB20: ; 0x0207AB20
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r7, r1, #0
	str r2, [sp, #0xc]
	add r5, r3, #0
	mov r4, #0
_0207AB2E:
	cmp r4, #6
	beq _0207AB64
	ldrb r1, [r5, r4]
	add r0, r6, #0
	bl sub_02079E28
	cmp r0, #0
	beq _0207AB5C
	mov r3, #0
	str r3, [sp]
	ldrb r0, [r5, r4]
	ldr r2, [sp, #0xc]
	add r1, r7, #0
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, _0207AB80 ; =0x00000948
	ldr r0, [r6, r0]
	bl sub_02020A24
	add sp, #0x10
	ldrb r0, [r5, r4]
	pop {r3, r4, r5, r6, r7, pc}
_0207AB5C:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	b _0207AB2E
_0207AB64:
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, _0207AB80 ; =0x00000948
	ldr r2, [sp, #0xc]
	ldr r0, [r6, r0]
	add r1, r7, #0
	bl sub_02020A24
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207AB80: .word 0x00000948
	thumb_func_end sub_0207AB20

	thumb_func_start sub_0207AB84
sub_0207AB84: ; 0x0207AB84
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0xfa
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0207ABA4
	ldr r0, _0207AC10 ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	b _0207ABF0
_0207ABA4:
	mov r3, #0
	ldr r0, _0207AC14 ; =0x00000C65
	str r3, [sp]
	ldrb r0, [r5, r0]
	add r1, sp, #0xc
	add r1, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, _0207AC18 ; =0x00000948
	add r2, sp, #0xc
	ldr r0, [r5, r0]
	bl sub_02020A24
	ldr r0, _0207AC1C ; =0x00000654
	add r1, r4, #0
	ldr r0, [r5, r0]
	add r0, #0x25
	ldrb r0, [r0]
	bl sub_0207B5EC
	add r1, r0, #0
	ldr r0, _0207AC10 ; =0x00000678
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0207AC10 ; =0x00000678
	mov r1, #1
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0207AC10 ; =0x00000678
	add r2, sp, #0xc
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r5, r0]
	bl sub_0200DD88
_0207ABF0:
	ldr r0, _0207AC14 ; =0x00000C65
	mov r2, #0
	ldrb r1, [r5, r0]
	strb r4, [r5, r0]
	add r0, r5, #0
	bl sub_0207B51C
	ldr r1, _0207AC14 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	mov r2, #1
	bl sub_0207B51C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0207AC10: .word 0x00000678
_0207AC14: .word 0x00000C65
_0207AC18: .word 0x00000948
_0207AC1C: .word 0x00000654
	thumb_func_end sub_0207AB84

	thumb_func_start sub_0207AC20
sub_0207AC20: ; 0x0207AC20
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0xc6
	lsl r0, r0, #4
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _0207AC6C
	cmp r1, #1
	beq _0207AC3C
	cmp r1, #2
	beq _0207AC68
	add sp, #4
	pop {r3, r4, pc}
_0207AC3C:
	add r0, r0, #1
	ldrb r0, [r4, r0]
	add r1, sp, #0
	add r1, #2
	add r2, sp, #0
	bl sub_0207BBFC
	add r3, sp, #0
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, r4, #0
	bl sub_0207F2A8
	mov r0, #0xc6
	lsl r0, r0, #4
	ldrb r1, [r4, r0]
	add sp, #4
	add r1, r1, #1
	strb r1, [r4, r0]
	pop {r3, r4, pc}
_0207AC68:
	mov r1, #0
	strb r1, [r4, r0]
_0207AC6C:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_0207AC20

	thumb_func_start sub_0207AC70
sub_0207AC70: ; 0x0207AC70
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, _0207AD50 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _0207AD54 ; =0x00000C65
	ldrb r1, [r5, r0]
	cmp r1, #6
	bne _0207AC88
	mov r0, #4
	pop {r3, r4, r5, pc}
_0207AC88:
	cmp r1, #7
	bne _0207ACAA
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _0207AD58 ; =0x00000C63
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0207AD4A
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207CB3C
	mov r0, #3
	pop {r3, r4, r5, pc}
_0207ACAA:
	ldr r0, _0207AD5C ; =0x00000654
	ldr r2, [r5, r0]
	add r2, #0x24
	ldrb r2, [r2]
	cmp r2, #3
	beq _0207ACBA
	cmp r2, #0x13
	bne _0207ACC4
_0207ACBA:
	ldr r0, _0207AD60 ; =0x000005DC
	bl PlaySE
	mov r0, #0
	pop {r3, r4, r5, pc}
_0207ACC4:
	cmp r2, #0x14
	beq _0207ACCC
	cmp r2, #0xe
	bne _0207ACEE
_0207ACCC:
	mov r0, #0x30
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0207AD64 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0207ACE4
	ldr r0, _0207AD60 ; =0x000005DC
	bl PlaySE
	mov r0, #0
	pop {r3, r4, r5, pc}
_0207ACE4:
	ldr r0, _0207AD68 ; =0x000005F2
	bl PlaySE
	mov r0, #5
	pop {r3, r4, r5, pc}
_0207ACEE:
	cmp r2, #0xf
	bne _0207AD2A
	mov r2, #0x30
	mul r2, r1
	ldr r1, _0207AD64 ; =0x00000838
	add r2, r5, r2
	ldrb r1, [r2, r1]
	cmp r1, #0
	bne _0207AD20
	sub r0, #0x78
	bl PlaySE
	add r0, r5, #0
	bl sub_0207E068
	ldr r1, _0207AD54 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207F3A4
	add r0, r5, #0
	bl sub_0207AFC4
	mov r0, #0
	pop {r3, r4, r5, pc}
_0207AD20:
	sub r0, #0x62
	bl PlaySE
	mov r0, #5
	pop {r3, r4, r5, pc}
_0207AD2A:
	sub r0, #0x78
	bl PlaySE
	add r0, r5, #0
	bl sub_0207E068
	ldr r1, _0207AD54 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207F3A4
	add r0, r5, #0
	bl sub_0207AFC4
	mov r0, #0
	pop {r3, r4, r5, pc}
_0207AD4A:
	mov r0, #5
	pop {r3, r4, r5, pc}
	nop
_0207AD50: .word 0x04000050
_0207AD54: .word 0x00000C65
_0207AD58: .word 0x00000C63
_0207AD5C: .word 0x00000654
_0207AD60: .word 0x000005DC
_0207AD64: .word 0x00000838
_0207AD68: .word 0x000005F2
	thumb_func_end sub_0207AC70

	thumb_func_start sub_0207AD6C
sub_0207AD6C: ; 0x0207AD6C
	push {r3, lr}
	ldr r2, _0207ADAC ; =0x00000654
	mov r1, #0
	ldr r2, [r0, r2]
	add r0, r2, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0207AD8C
	cmp r0, #0x11
	beq _0207AD8C
	add r0, #0xea
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0207AD94
_0207AD8C:
	ldr r0, _0207ADB0 ; =_02110104
	bl sub_02025224
	pop {r3, pc}
_0207AD94:
	add r2, #0x25
	ldrb r0, [r2]
	cmp r0, #2
	bne _0207AD9E
	mov r1, #1
_0207AD9E:
	ldr r2, _0207ADB4 ; =_02110128
	lsl r0, r1, #5
	add r0, r2, r0
	bl sub_02025224
	pop {r3, pc}
	nop
_0207ADAC: .word 0x00000654
_0207ADB0: .word _02110104
_0207ADB4: .word _02110128
	thumb_func_end sub_0207AD6C

	thumb_func_start sub_0207ADB8
sub_0207ADB8: ; 0x0207ADB8
	push {r4, r5, r6, lr}
	mov r1, #0xc9
	add r4, r0, #0
	lsl r1, r1, #4
	add r5, r4, r1
	ldr r1, [r5, #0xc]
	cmp r1, #1
	bne _0207ADDC
	bl sub_0207CC24
	cmp r0, #0
	bne _0207ADD8
	ldr r0, [r5, #8]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
_0207ADD8:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207ADDC:
	bl sub_0207AD6C
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	beq _0207AEBE
	cmp r5, #7
	bhi _0207AE44
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207ADFA: ; jump table
	.short _0207AE0A - _0207ADFA - 2 ; case 0
	.short _0207AE0A - _0207ADFA - 2 ; case 1
	.short _0207AE0A - _0207ADFA - 2 ; case 2
	.short _0207AE0A - _0207ADFA - 2 ; case 3
	.short _0207AE0A - _0207ADFA - 2 ; case 4
	.short _0207AE0A - _0207ADFA - 2 ; case 5
	.short _0207AE3A - _0207ADFA - 2 ; case 6
	.short _0207AE90 - _0207ADFA - 2 ; case 7
_0207AE0A:
	ldr r0, _0207AFAC ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl GetPartyCount
	cmp r5, r0
	bhs _0207AE44
	ldr r0, _0207AFB0 ; =0x00000948
	lsl r3, r5, #3
	ldr r6, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r6, r3]
	add r3, r6, r3
	ldrb r3, [r3, #1]
	add r1, r5, #0
	bl sub_0207A910
	add r0, r4, #0
	mov r1, #1
	bl sub_0207AC70
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
_0207AE3A:
	ldr r0, _0207AFB4 ; =0x00000C63
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _0207AE46
_0207AE44:
	b _0207AFA6
_0207AE46:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	ldr r0, _0207AFB8 ; =0x00000C65
	mov r1, #7
	strb r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	bl sub_0207CB3C
	ldr r0, _0207AFBC ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _0207AFB0 ; =0x00000948
	mov r1, #7
	ldr r3, [r4, r0]
	add r0, r4, #0
	add r2, r3, #0
	add r2, #0x38
	add r3, #0x39
	ldrb r2, [r2]
	ldrb r3, [r3]
	bl sub_0207A910
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #1
	bl sub_0207CBD0
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207AE90:
	ldr r0, _0207AFB0 ; =0x00000948
	mov r1, #6
	ldr r3, [r4, r0]
	add r0, r4, #0
	add r2, r3, #0
	add r2, #0x30
	add r3, #0x31
	ldrb r2, [r2]
	ldrb r3, [r3]
	bl sub_0207A988
	add r0, r4, #0
	mov r1, #1
	bl sub_0207AC70
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #8
	mov r3, #1
	bl sub_0207CBD0
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207AEBE:
	ldr r0, _0207AFC0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207AF36
	ldr r0, _0207AFB8 ; =0x00000C65
	ldrb r1, [r4, r0]
	cmp r1, #7
	bne _0207AEFA
	ldr r0, _0207AFB0 ; =0x00000948
	lsl r5, r1, #3
	ldr r3, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r3, r5]
	add r3, r3, r5
	ldrb r3, [r3, #1]
	bl sub_0207A910
	add r0, r4, #0
	mov r1, #0
	bl sub_0207AC70
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #9
	mov r3, #0
	bl sub_0207CBD0
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207AEFA:
	cmp r1, #6
	bne _0207AF28
	ldr r0, _0207AFB0 ; =0x00000948
	lsl r5, r1, #3
	ldr r3, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r3, r5]
	add r3, r3, r5
	ldrb r3, [r3, #1]
	bl sub_0207A988
	add r0, r4, #0
	mov r1, #0
	bl sub_0207AC70
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #8
	mov r3, #0
	bl sub_0207CBD0
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207AF28:
	add r0, r4, #0
	mov r1, #0
	bl sub_0207AC70
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
_0207AF36:
	mov r0, #2
	tst r0, r1
	beq _0207AF9E
	ldr r0, _0207AFB4 ; =0x00000C63
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0207AF9E
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	add r0, r4, #0
	mov r1, #0
	bl sub_0207CB3C
	ldr r0, _0207AFBC ; =0x04000050
	mov r3, #0
	strh r3, [r0]
	ldr r0, _0207AFB8 ; =0x00000C65
	ldrb r0, [r4, r0]
	cmp r0, #7
	bne _0207AF78
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	bl sub_0207CBD0
	b _0207AF9A
_0207AF78:
	ldr r0, _0207AFB0 ; =0x00000948
	mov r1, #7
	ldr r3, [r4, r0]
	add r0, r4, #0
	add r2, r3, #0
	add r2, #0x38
	add r3, #0x39
	ldrb r2, [r2]
	ldrb r3, [r3]
	bl sub_0207A910
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #1
	bl sub_0207CBD0
_0207AF9A:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207AF9E:
	add r0, r4, #0
	bl sub_0207A8FC
	add r6, r0, #0
_0207AFA6:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_0207AFAC: .word 0x00000654
_0207AFB0: .word 0x00000948
_0207AFB4: .word 0x00000C63
_0207AFB8: .word 0x00000C65
_0207AFBC: .word 0x04000050
_0207AFC0: .word gSystem
	thumb_func_end sub_0207ADB8

	thumb_func_start sub_0207AFC4
sub_0207AFC4: ; 0x0207AFC4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x81
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	mov r0, #0xc
	mov r1, #8
	bl AllocFromHeap
	add r5, r0, #0
	ldr r0, _0207B0A8 ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0xf
	bgt _0207AFFC
	bge _0207B034
	cmp r0, #2
	bgt _0207B070
	cmp r0, #0
	blt _0207B070
	beq _0207B01C
	cmp r0, #2
	beq _0207B028
	b _0207B070
_0207AFFC:
	sub r0, #0x11
	cmp r0, #6
	bhi _0207B070
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207B00E: ; jump table
	.short _0207B028 - _0207B00E - 2 ; case 0
	.short _0207B040 - _0207B00E - 2 ; case 1
	.short _0207B070 - _0207B00E - 2 ; case 2
	.short _0207B070 - _0207B00E - 2 ; case 3
	.short _0207B04C - _0207B00E - 2 ; case 4
	.short _0207B058 - _0207B00E - 2 ; case 5
	.short _0207B064 - _0207B00E - 2 ; case 6
_0207B01C:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B0B0
	add r2, r0, #0
	b _0207B07A
_0207B028:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B23C
	add r2, r0, #0
	b _0207B07A
_0207B034:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B1BC
	add r2, r0, #0
	b _0207B07A
_0207B040:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B1C8
	add r2, r0, #0
	b _0207B07A
_0207B04C:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B32C
	add r2, r0, #0
	b _0207B07A
_0207B058:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B28C
	add r2, r0, #0
	b _0207B07A
_0207B064:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B2DC
	add r2, r0, #0
	b _0207B07A
_0207B070:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B200
	add r2, r0, #0
_0207B07A:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207D0E4
	mov r0, #0xc
	add r1, r5, #0
	bl FreeToHeapExplicit
	add r0, r4, #0
	bl sub_0207D1C8
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAD8
	ldr r0, _0207B0AC ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DD08
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0207B0A8: .word 0x00000654
_0207B0AC: .word 0x00000678
	thumb_func_end sub_0207AFC4

	thumb_func_start sub_0207B0B0
sub_0207B0B0: ; 0x0207B0B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp, #4]
	ldr r1, _0207B1B0 ; =0x00000654
	str r0, [sp]
	ldr r0, [r0, r1]
	ldr r2, _0207B1B4 ; =0x00000C65
	ldr r1, [sp]
	ldr r0, [r0]
	ldrb r1, [r1, r2]
	bl GetPartyMonByIndex
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	mov r1, #1
	strb r1, [r0]
	mov r4, #0
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r1, _0207B1B0 ; =0x00000654
	ldr r0, [sp]
	ldr r0, [r0, r1]
	ldr r0, [r0, #0x1c]
	bl sub_02067584
	cmp r0, #0
	bne _0207B19E
	ldr r0, _0207B1B4 ; =0x00000C65
	ldr r1, [sp]
	ldrb r2, [r1, r0]
	mov r1, #0x30
	add r3, r2, #0
	ldr r2, [sp]
	mul r3, r1
	add r3, r2, r3
	ldr r2, _0207B1B8 ; =0x00000838
	ldrb r3, [r3, r2]
	cmp r3, #0
	bne _0207B184
	ldr r3, [sp, #4]
	add r6, r4, #0
	strb r6, [r3, r5]
	add r3, r5, #1
	lsl r3, r3, #0x18
	lsr r5, r3, #0x18
	ldr r3, [sp]
	ldrb r0, [r3, r0]
	mul r1, r0
	add r0, r3, #0
	add r1, r0, r1
	sub r0, r2, #4
	ldrh r0, [r1, r0]
	bl ItemIdIsMail
	cmp r0, #1
	bne _0207B128
	mov r1, #5
	ldr r0, [sp, #4]
	b _0207B12C
_0207B128:
	ldr r0, [sp, #4]
	mov r1, #2
_0207B12C:
	strb r1, [r0, r5]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, [sp, #4]
	mov r1, #9
	strb r1, [r0, r2]
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	mov r6, #0
_0207B142:
	add r1, r6, #0
	ldr r0, [sp, #8]
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	beq _0207B1AA
	add r0, r7, #0
	bl sub_0207BCC0
	cmp r0, #0xff
	beq _0207B178
	ldr r1, [sp, #4]
	add r2, r4, #0
	strb r0, [r1, r5]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r0, [sp]
	add r1, r7, #0
	bl sub_0207D0A0
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0207B178:
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #4
	blo _0207B142
	b _0207B1AA
_0207B184:
	ldr r0, [sp, #4]
	add r1, r4, #0
	strb r1, [r0, r5]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, [sp, #4]
	mov r1, #9
	strb r1, [r0, r2]
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	b _0207B1AA
_0207B19E:
	ldr r0, [sp, #4]
	mov r1, #9
	strb r1, [r0, r5]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_0207B1AA:
	add r0, r5, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207B1B0: .word 0x00000654
_0207B1B4: .word 0x00000C65
_0207B1B8: .word 0x00000838
	thumb_func_end sub_0207B0B0

	thumb_func_start sub_0207B1BC
sub_0207B1BC: ; 0x0207B1BC
	mov r0, #0xe
	strb r0, [r1]
	mov r0, #9
	strb r0, [r1, #1]
	mov r0, #2
	bx lr
	thumb_func_end sub_0207B1BC

	thumb_func_start sub_0207B1C8
sub_0207B1C8: ; 0x0207B1C8
	ldr r2, _0207B1F8 ; =0x00000C65
	ldrb r3, [r0, r2]
	mov r2, #0x30
	mul r2, r3
	add r2, r0, r2
	ldr r0, _0207B1FC ; =0x00000838
	ldrb r0, [r2, r0]
	cmp r0, #0
	bne _0207B1EA
	mov r0, #8
	strb r0, [r1]
	mov r0, #1
	strb r0, [r1, #1]
	mov r0, #9
	strb r0, [r1, #2]
	mov r0, #3
	bx lr
_0207B1EA:
	mov r0, #1
	strb r0, [r1]
	mov r0, #9
	strb r0, [r1, #1]
	mov r0, #2
	bx lr
	nop
_0207B1F8: .word 0x00000C65
_0207B1FC: .word 0x00000838
	thumb_func_end sub_0207B1C8

	thumb_func_start sub_0207B200
sub_0207B200: ; 0x0207B200
	ldr r2, _0207B234 ; =0x00000C65
	ldrb r3, [r0, r2]
	mov r2, #0x30
	mul r2, r3
	add r2, r0, r2
	ldr r0, _0207B238 ; =0x00000836
	ldrh r0, [r2, r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0207B226
	mov r0, #0xd
	strb r0, [r1]
	mov r0, #1
	strb r0, [r1, #1]
	mov r0, #9
	strb r0, [r1, #2]
	mov r0, #3
	bx lr
_0207B226:
	mov r0, #1
	strb r0, [r1]
	mov r0, #9
	strb r0, [r1, #1]
	mov r0, #2
	bx lr
	nop
_0207B234: .word 0x00000C65
_0207B238: .word 0x00000836
	thumb_func_end sub_0207B200

	thumb_func_start sub_0207B23C
sub_0207B23C: ; 0x0207B23C
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _0207B288 ; =0x00000C65
	ldrb r1, [r0, r1]
	bl sub_0207B364
	cmp r0, #0
	beq _0207B256
	cmp r0, #1
	beq _0207B262
	cmp r0, #2
	beq _0207B272
	b _0207B282
_0207B256:
	mov r0, #1
	strb r0, [r4]
	mov r0, #9
	strb r0, [r4, #1]
	mov r0, #2
	pop {r4, pc}
_0207B262:
	mov r0, #0xb
	strb r0, [r4]
	mov r0, #1
	strb r0, [r4, #1]
	mov r0, #9
	strb r0, [r4, #2]
	mov r0, #3
	pop {r4, pc}
_0207B272:
	mov r0, #0xc
	strb r0, [r4]
	mov r0, #1
	strb r0, [r4, #1]
	mov r0, #9
	strb r0, [r4, #2]
	mov r0, #3
	pop {r4, pc}
_0207B282:
	mov r0, #0
	pop {r4, pc}
	nop
_0207B288: .word 0x00000C65
	thumb_func_end sub_0207B23C

	thumb_func_start sub_0207B28C
sub_0207B28C: ; 0x0207B28C
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _0207B2D8 ; =0x00000C65
	ldrb r1, [r0, r1]
	bl sub_0207B418
	cmp r0, #0
	beq _0207B2A6
	cmp r0, #1
	beq _0207B2B2
	cmp r0, #2
	beq _0207B2C2
	b _0207B2D2
_0207B2A6:
	mov r0, #1
	strb r0, [r4]
	mov r0, #9
	strb r0, [r4, #1]
	mov r0, #2
	pop {r4, pc}
_0207B2B2:
	mov r0, #0xb
	strb r0, [r4]
	mov r0, #1
	strb r0, [r4, #1]
	mov r0, #9
	strb r0, [r4, #2]
	mov r0, #3
	pop {r4, pc}
_0207B2C2:
	mov r0, #0xc
	strb r0, [r4]
	mov r0, #1
	strb r0, [r4, #1]
	mov r0, #9
	strb r0, [r4, #2]
	mov r0, #3
	pop {r4, pc}
_0207B2D2:
	mov r0, #0
	pop {r4, pc}
	nop
_0207B2D8: .word 0x00000C65
	thumb_func_end sub_0207B28C

	thumb_func_start sub_0207B2DC
sub_0207B2DC: ; 0x0207B2DC
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _0207B328 ; =0x00000C65
	ldrb r1, [r0, r1]
	bl sub_0207B4A0
	cmp r0, #0
	beq _0207B2F6
	cmp r0, #1
	beq _0207B302
	cmp r0, #2
	beq _0207B312
	b _0207B322
_0207B2F6:
	mov r0, #1
	strb r0, [r4]
	mov r0, #9
	strb r0, [r4, #1]
	mov r0, #2
	pop {r4, pc}
_0207B302:
	mov r0, #0xb
	strb r0, [r4]
	mov r0, #1
	strb r0, [r4, #1]
	mov r0, #9
	strb r0, [r4, #2]
	mov r0, #3
	pop {r4, pc}
_0207B312:
	mov r0, #0xc
	strb r0, [r4]
	mov r0, #1
	strb r0, [r4, #1]
	mov r0, #9
	strb r0, [r4, #2]
	mov r0, #3
	pop {r4, pc}
_0207B322:
	mov r0, #0
	pop {r4, pc}
	nop
_0207B328: .word 0x00000C65
	thumb_func_end sub_0207B2DC

	thumb_func_start sub_0207B32C
sub_0207B32C: ; 0x0207B32C
	ldr r2, _0207B35C ; =0x00000C65
	ldrb r3, [r0, r2]
	mov r2, #0x30
	mul r2, r3
	add r2, r0, r2
	ldr r0, _0207B360 ; =0x00000838
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _0207B34E
	mov r0, #1
	strb r0, [r1]
	mov r0, #0xf
	strb r0, [r1, #1]
	mov r0, #9
	strb r0, [r1, #2]
	mov r0, #3
	bx lr
_0207B34E:
	mov r0, #1
	strb r0, [r1]
	mov r0, #9
	strb r0, [r1, #1]
	mov r0, #2
	bx lr
	nop
_0207B35C: .word 0x00000C65
_0207B360: .word 0x00000838
	thumb_func_end sub_0207B32C

	thumb_func_start sub_0207B364
sub_0207B364: ; 0x0207B364
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0207B408 ; =0x00000654
	add r4, r1, #0
	ldr r2, [r5, r0]
	ldr r0, [r2, #0x14]
	cmp r0, #0
	beq _0207B392
	ldr r0, [r2]
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, _0207B408 ; =0x00000654
	ldr r2, _0207B40C ; =0x00000C74
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	ldr r0, [r0, #0x14]
	bl sub_0207496C
	cmp r0, #0
	bne _0207B392
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207B392:
	ldr r0, _0207B408 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0207B3B8
	mov r0, #0x30
	mul r0, r4
	ldr r1, _0207B410 ; =0x0000082C
	add r2, r5, r0
	ldrh r0, [r2, r1]
	add r1, #0xd
	ldrb r1, [r2, r1]
	bl IsPokemonLegendaryOrMythical
	cmp r0, #1
	bne _0207B3B8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207B3B8:
	ldr r1, _0207B408 ; =0x00000654
	mov r0, #0
	ldr r2, [r5, r1]
	add r1, r2, #0
	add r1, #0x36
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r3, r1, #0x1c
	beq _0207B3E4
	add r1, r4, #1
_0207B3CC:
	add r6, r2, r0
	add r6, #0x30
	ldrb r6, [r6]
	cmp r1, r6
	bne _0207B3DA
	mov r0, #2
	pop {r4, r5, r6, pc}
_0207B3DA:
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, r3
	blo _0207B3CC
_0207B3E4:
	mov r0, #0x30
	mul r0, r4
	add r3, r5, r0
	ldr r0, _0207B414 ; =0x00000838
	ldrb r1, [r3, r0]
	cmp r1, #1
	beq _0207B3FE
	sub r0, r0, #6
	add r2, #0x37
	ldrh r1, [r3, r0]
	ldrb r0, [r2]
	cmp r1, r0
	ble _0207B402
_0207B3FE:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207B402:
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0207B408: .word 0x00000654
_0207B40C: .word 0x00000C74
_0207B410: .word 0x0000082C
_0207B414: .word 0x00000838
	thumb_func_end sub_0207B364

	thumb_func_start sub_0207B418
sub_0207B418: ; 0x0207B418
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0207B494 ; =0x00000654
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _0207B444
	mov r0, #0x30
	mul r0, r4
	ldr r1, _0207B498 ; =0x0000082C
	add r2, r5, r0
	ldrh r0, [r2, r1]
	add r1, #0xd
	ldrb r1, [r2, r1]
	bl IsPokemonLegendaryOrMythical
	cmp r0, #1
	bne _0207B444
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207B444:
	ldr r1, _0207B494 ; =0x00000654
	mov r0, #0
	ldr r2, [r5, r1]
	add r1, r2, #0
	add r1, #0x36
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r3, r1, #0x1c
	beq _0207B470
	add r1, r4, #1
_0207B458:
	add r6, r2, r0
	add r6, #0x30
	ldrb r6, [r6]
	cmp r1, r6
	bne _0207B466
	mov r0, #2
	pop {r4, r5, r6, pc}
_0207B466:
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, r3
	blo _0207B458
_0207B470:
	mov r0, #0x30
	mul r0, r4
	add r3, r5, r0
	ldr r0, _0207B49C ; =0x00000838
	ldrb r1, [r3, r0]
	cmp r1, #1
	beq _0207B48A
	sub r0, r0, #6
	add r2, #0x37
	ldrh r1, [r3, r0]
	ldrb r0, [r2]
	cmp r1, r0
	bge _0207B48E
_0207B48A:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207B48E:
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0207B494: .word 0x00000654
_0207B498: .word 0x0000082C
_0207B49C: .word 0x00000838
	thumb_func_end sub_0207B418

	thumb_func_start sub_0207B4A0
sub_0207B4A0: ; 0x0207B4A0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0207B510 ; =0x00000654
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _0207B4CC
	mov r0, #0x30
	mul r0, r4
	ldr r1, _0207B514 ; =0x0000082C
	add r2, r5, r0
	ldrh r0, [r2, r1]
	add r1, #0xd
	ldrb r1, [r2, r1]
	bl IsPokemonLegendaryOrMythical
	cmp r0, #1
	bne _0207B4CC
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207B4CC:
	ldr r1, _0207B510 ; =0x00000654
	mov r0, #0
	ldr r2, [r5, r1]
	add r1, r2, #0
	add r1, #0x36
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r3, r1, #0x1c
	beq _0207B4F8
	add r1, r4, #1
_0207B4E0:
	add r6, r2, r0
	add r6, #0x30
	ldrb r6, [r6]
	cmp r1, r6
	bne _0207B4EE
	mov r0, #2
	pop {r4, r5, r6, pc}
_0207B4EE:
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, r3
	blo _0207B4E0
_0207B4F8:
	mov r0, #0x30
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0207B518 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0207B50A
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207B50A:
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0207B510: .word 0x00000654
_0207B514: .word 0x0000082C
_0207B518: .word 0x00000838
	thumb_func_end sub_0207B4A0

	thumb_func_start sub_0207B51C
sub_0207B51C: ; 0x0207B51C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #6
	bne _0207B556
	mov r0, #0x1a
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_020249A8
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r6, #0
	bne _0207B540
	mov r0, #2
	and r0, r1
	b _0207B546
_0207B540:
	mov r0, #2
	and r0, r1
	add r0, r0, #1
_0207B546:
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x1a
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	pop {r4, r5, r6, pc}
_0207B556:
	cmp r4, #7
	bne _0207B584
	ldr r0, _0207B5E4 ; =0x00000684
	ldr r0, [r5, r0]
	bl sub_020249A8
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r6, #0
	bne _0207B570
	mov r0, #2
	and r0, r1
	b _0207B576
_0207B570:
	mov r0, #2
	and r0, r1
	add r0, r0, #1
_0207B576:
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, _0207B5E4 ; =0x00000684
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	pop {r4, r5, r6, pc}
_0207B584:
	cmp r6, #0
	ldr r1, _0207B5E8 ; =0x0000083E
	bne _0207B5B2
	mov r0, #0x30
	add r3, r5, r1
	mul r0, r4
	ldrsh r2, [r3, r0]
	add r1, r1, #2
	sub r2, r2, #2
	strh r2, [r3, r0]
	add r2, r5, r1
	ldrsh r1, [r2, r0]
	sub r1, r1, #2
	strh r1, [r2, r0]
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	b _0207B5D8
_0207B5B2:
	mov r0, #0x30
	add r3, r5, r1
	mul r0, r4
	ldrsh r2, [r3, r0]
	add r1, r1, #2
	add r2, r2, #2
	strh r2, [r3, r0]
	add r2, r5, r1
	ldrsh r1, [r2, r0]
	add r1, r1, #2
	strh r1, [r2, r0]
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
_0207B5D8:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207A7F4
	pop {r4, r5, r6, pc}
	nop
_0207B5E4: .word 0x00000684
_0207B5E8: .word 0x0000083E
	thumb_func_end sub_0207B51C

	thumb_func_start sub_0207B5EC
sub_0207B5EC: ; 0x0207B5EC
	cmp r1, #0
	beq _0207B5F8
	cmp r0, #0
	beq _0207B5FC
	cmp r1, #1
	bne _0207B5FC
_0207B5F8:
	mov r0, #1
	bx lr
_0207B5FC:
	mov r0, #0
	bx lr
	thumb_func_end sub_0207B5EC

	thumb_func_start sub_0207B600
sub_0207B600: ; 0x0207B600
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0xc9
	add r4, r0, #0
	lsl r1, r1, #4
	add r5, r4, r1
	ldr r1, [r5, #0xc]
	cmp r1, #1
	bne _0207B640
	bl sub_0207CC24
	cmp r0, #0
	bne _0207B63C
	ldr r0, _0207B7C4 ; =0x00000C65
	ldrb r0, [r4, r0]
	cmp r0, #7
	beq _0207B634
	ldr r0, _0207B7C8 ; =0x00000684
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020249D4
	ldr r0, _0207B7C8 ; =0x00000684
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
_0207B634:
	ldr r0, [r5, #8]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_0207B63C:
	mov r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_0207B640:
	bl sub_0207AD6C
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _0207B746
	cmp r6, #6
	bhi _0207B67A
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207B65E: ; jump table
	.short _0207B66C - _0207B65E - 2 ; case 0
	.short _0207B66C - _0207B65E - 2 ; case 1
	.short _0207B66C - _0207B65E - 2 ; case 2
	.short _0207B66C - _0207B65E - 2 ; case 3
	.short _0207B66C - _0207B65E - 2 ; case 4
	.short _0207B66C - _0207B65E - 2 ; case 5
	.short _0207B728 - _0207B65E - 2 ; case 6
_0207B66C:
	ldr r0, _0207B7CC ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl GetPartyCount
	cmp r6, r0
	blo _0207B67C
_0207B67A:
	b _0207B7C0
_0207B67C:
	ldr r0, _0207B7C4 ; =0x00000C65
	ldrb r5, [r4, r0]
	strb r6, [r4, r0]
	ldr r0, _0207B7D0 ; =0x000005DC
	bl PlaySE
	ldr r0, _0207B7D4 ; =0x00000C63
	ldrb r1, [r4, r0]
	add r0, r0, #2
	ldrb r0, [r4, r0]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	cmp r0, r1
	bne _0207B6D2
	cmp r5, r0
	beq _0207B6C8
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	mov r2, #0
	bl sub_0207B51C
	ldr r1, _0207B7C4 ; =0x00000C65
	add r0, r4, #0
	ldrb r1, [r4, r1]
	mov r2, #1
	bl sub_0207B51C
	ldr r0, _0207B7D8 ; =0x00000948
	lsl r3, r6, #3
	ldr r5, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r5, r3]
	add r3, r5, r3
	ldrb r3, [r3, #1]
	add r1, r6, #0
	bl sub_0207A910
_0207B6C8:
	add r0, r4, #0
	bl sub_0207FBC8
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0207B6D2:
	cmp r5, r0
	beq _0207B6E6
	cmp r5, r1
	beq _0207B6E6
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	mov r2, #0
	bl sub_0207B51C
_0207B6E6:
	ldr r0, _0207B7D4 ; =0x00000C63
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1a
	lsr r1, r0, #0x1a
	cmp r5, r1
	bne _0207B6FA
	add r0, r4, #0
	mov r2, #0
	bl sub_0207B51C
_0207B6FA:
	ldr r0, _0207B7C4 ; =0x00000C65
	ldrb r1, [r4, r0]
	cmp r5, r1
	beq _0207B70A
	add r0, r4, #0
	mov r2, #1
	bl sub_0207B51C
_0207B70A:
	ldr r0, _0207B7D8 ; =0x00000948
	lsl r3, r6, #3
	ldr r5, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r5, r3]
	add r3, r5, r3
	ldrb r3, [r3, #1]
	add r1, r6, #0
	bl sub_0207A910
	add r0, r4, #0
	bl sub_0207FC1C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0207B728:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #0
	bl sub_0207CBD0
	mov r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_0207B746:
	ldr r0, _0207B7DC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207B7A0
	ldr r0, _0207B7C4 ; =0x00000C65
	ldrb r1, [r4, r0]
	cmp r1, #7
	blo _0207B776
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #0
	bl sub_0207CBD0
	mov r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_0207B776:
	sub r0, r0, #2
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	cmp r1, r0
	ldr r0, _0207B7D0 ; =0x000005DC
	bne _0207B792
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0207B792:
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FC1C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0207B7A0:
	mov r0, #2
	tst r0, r1
	beq _0207B7B8
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0207B7B8:
	add r0, r4, #0
	bl sub_0207A8FC
	add r7, r0, #0
_0207B7C0:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207B7C4: .word 0x00000C65
_0207B7C8: .word 0x00000684
_0207B7CC: .word 0x00000654
_0207B7D0: .word 0x000005DC
_0207B7D4: .word 0x00000C63
_0207B7D8: .word 0x00000948
_0207B7DC: .word gSystem
	thumb_func_end sub_0207B600

	thumb_func_start sub_0207B7E0
sub_0207B7E0: ; 0x0207B7E0
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r1, _0207BA64 ; =0x00000654
	add r4, r0, #0
	ldr r3, [r4, r1]
	mov r0, #0
	add r1, r3, #0
	add r1, #0x36
	ldrb r1, [r1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	beq _0207B88A
_0207B7F8:
	add r2, r3, r0
	add r2, #0x30
	ldrb r2, [r2]
	cmp r2, #0
	bne _0207B880
	add r3, #0x36
	ldrb r0, [r3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #6
	bhi _0207B864
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207B81A: ; jump table
	.short _0207B864 - _0207B81A - 2 ; case 0
	.short _0207B864 - _0207B81A - 2 ; case 1
	.short _0207B828 - _0207B81A - 2 ; case 2
	.short _0207B834 - _0207B81A - 2 ; case 3
	.short _0207B840 - _0207B81A - 2 ; case 4
	.short _0207B84C - _0207B81A - 2 ; case 5
	.short _0207B858 - _0207B81A - 2 ; case 6
_0207B828:
	add r0, r4, #0
	mov r1, #0x67
	mov r2, #1
	bl sub_0207DAEC
	b _0207B86E
_0207B834:
	add r0, r4, #0
	mov r1, #0x6c
	mov r2, #1
	bl sub_0207DAEC
	b _0207B86E
_0207B840:
	add r0, r4, #0
	mov r1, #0x6d
	mov r2, #1
	bl sub_0207DAEC
	b _0207B86E
_0207B84C:
	add r0, r4, #0
	mov r1, #0x6e
	mov r2, #1
	bl sub_0207DAEC
	b _0207B86E
_0207B858:
	add r0, r4, #0
	mov r1, #0x6f
	mov r2, #1
	bl sub_0207DAEC
	b _0207B86E
_0207B864:
	add r0, r4, #0
	mov r1, #0x1e
	mov r2, #1
	bl sub_0207DAEC
_0207B86E:
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B880:
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, r1
	blo _0207B7F8
_0207B88A:
	ldr r0, [r3, #0x14]
	cmp r0, #0
	beq _0207B98E
	ldr r2, _0207BA70 ; =0x00000C74
	ldr r1, [r3]
	ldr r2, [r4, r2]
	add r3, #0x30
	bl sub_02074A6C
	cmp r0, #8
	bhi _0207B98E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207B8AC: ; jump table
	.short _0207B98E - _0207B8AC - 2 ; case 0
	.short _0207B8BE - _0207B8AC - 2 ; case 1
	.short _0207B91E - _0207B8AC - 2 ; case 2
	.short _0207B93A - _0207B8AC - 2 ; case 3
	.short _0207B98E - _0207B8AC - 2 ; case 4
	.short _0207B98E - _0207B8AC - 2 ; case 5
	.short _0207B956 - _0207B8AC - 2 ; case 6
	.short _0207B98E - _0207B8AC - 2 ; case 7
	.short _0207B972 - _0207B8AC - 2 ; case 8
_0207B8BE:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0xa7
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _0207BA64 ; =0x00000654
	mov r1, #3
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x14]
	bl sub_020290FC
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0207BA74 ; =0x000007C4
	mov r3, #3
	ldr r0, [r4, r0]
	bl BufferIntegerAsString
	ldr r1, _0207BA74 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B91E:
	add r0, r4, #0
	mov r1, #0xa5
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B93A:
	add r0, r4, #0
	mov r1, #0xa6
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B956:
	add r0, r4, #0
	mov r1, #0xa8
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B972:
	add r0, r4, #0
	mov r1, #0xbf
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B98E:
	ldr r0, _0207BA64 ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0207B9E6
	add r0, r4, #0
	bl sub_0207BA78
	cmp r0, #0
	beq _0207B9E6
	cmp r0, #1
	beq _0207B9AE
	cmp r0, #2
	beq _0207B9CA
	b _0207B9E6
_0207B9AE:
	add r0, r4, #0
	mov r1, #0xa5
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B9CA:
	add r0, r4, #0
	mov r1, #0xa6
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B9E6:
	ldr r0, _0207BA64 ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _0207BA1C
	add r0, r4, #0
	bl sub_0207BB14
	cmp r0, #0
	beq _0207BA1C
	cmp r0, #1
	bne _0207BA1C
	add r0, r4, #0
	mov r1, #0xbb
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207BA1C:
	ldr r0, _0207BA64 ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _0207BA52
	add r0, r4, #0
	bl sub_0207BB88
	cmp r0, #0
	beq _0207BA52
	cmp r0, #1
	bne _0207BA52
	add r0, r4, #0
	mov r1, #0xa5
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207BA52:
	ldr r0, _0207BA64 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0207BA64: .word 0x00000654
_0207BA68: .word 0x00000C62
_0207BA6C: .word 0x000005F2
_0207BA70: .word 0x00000C74
_0207BA74: .word 0x000007C4
	thumb_func_end sub_0207B7E0

	thumb_func_start sub_0207BA78
sub_0207BA78: ; 0x0207BA78
	push {r4, r5, r6, r7}
	add r5, r0, #0
	mov r0, #0
	mov ip, r0
	ldr r0, _0207BB08 ; =0x00000654
	ldr r4, [r5, r0]
_0207BA84:
	mov r0, ip
	add r0, r4, r0
	add r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _0207BB02
	mov r0, ip
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	cmp r3, #6
	bhs _0207BAF4
	mov r0, ip
	add r7, r4, r0
_0207BAA0:
	add r0, r4, r3
	add r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _0207BAF4
	add r0, r4, r3
	add r0, #0x30
	ldrb r1, [r0]
	mov r0, #0x30
	ldr r6, _0207BB0C ; =0x000007FC
	mul r0, r1
	add r2, r5, r0
	add r0, r7, #0
	add r0, #0x30
	ldrb r1, [r0]
	mov r0, #0x30
	ldrh r6, [r2, r6]
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0207BB0C ; =0x000007FC
	ldrh r0, [r1, r0]
	cmp r0, r6
	bne _0207BAD4
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_0207BAD4:
	ldr r0, _0207BB10 ; =0x00000804
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _0207BAEA
	ldr r1, _0207BB10 ; =0x00000804
	ldrh r1, [r2, r1]
	cmp r0, r1
	bne _0207BAEA
	mov r0, #2
	pop {r4, r5, r6, r7}
	bx lr
_0207BAEA:
	add r0, r3, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	cmp r3, #6
	blo _0207BAA0
_0207BAF4:
	mov r0, ip
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov ip, r0
	cmp r0, #5
	blo _0207BA84
_0207BB02:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0207BB08: .word 0x00000654
_0207BB0C: .word 0x000007FC
_0207BB10: .word 0x00000804
	thumb_func_end sub_0207BA78

	thumb_func_start sub_0207BB14
sub_0207BB14: ; 0x0207BB14
	push {r4, r5, r6, r7}
	ldr r1, _0207BB80 ; =0x00000654
	mov r3, #0
	ldr r5, [r0, r1]
_0207BB1C:
	add r1, r5, r3
	add r1, #0x30
	ldrb r1, [r1]
	cmp r1, #0
	beq _0207BB7A
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #6
	bhs _0207BB70
	add r2, r5, r3
_0207BB32:
	add r1, r5, r4
	add r1, #0x30
	ldrb r1, [r1]
	cmp r1, #0
	beq _0207BB70
	add r1, r2, #0
	add r1, #0x30
	ldrb r6, [r1]
	mov r1, #0x30
	mul r1, r6
	add r6, r0, r1
	ldr r1, _0207BB84 ; =0x000007FC
	ldrh r1, [r6, r1]
	add r6, r5, r4
	add r6, #0x30
	ldrb r7, [r6]
	mov r6, #0x30
	mul r6, r7
	add r7, r0, r6
	ldr r6, _0207BB84 ; =0x000007FC
	ldrh r6, [r7, r6]
	cmp r1, r6
	beq _0207BB66
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_0207BB66:
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #6
	blo _0207BB32
_0207BB70:
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #5
	blo _0207BB1C
_0207BB7A:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0207BB80: .word 0x00000654
_0207BB84: .word 0x000007FC
	thumb_func_end sub_0207BB14

	thumb_func_start sub_0207BB88
sub_0207BB88: ; 0x0207BB88
	push {r4, r5, r6, r7}
	ldr r1, _0207BBF4 ; =0x00000654
	mov r3, #0
	ldr r5, [r0, r1]
_0207BB90:
	add r1, r5, r3
	add r1, #0x30
	ldrb r1, [r1]
	cmp r1, #0
	beq _0207BBEE
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #6
	bhs _0207BBE4
	add r2, r5, r3
_0207BBA6:
	add r1, r5, r4
	add r1, #0x30
	ldrb r1, [r1]
	cmp r1, #0
	beq _0207BBE4
	add r1, r2, #0
	add r1, #0x30
	ldrb r6, [r1]
	mov r1, #0x30
	mul r1, r6
	add r6, r0, r1
	ldr r1, _0207BBF8 ; =0x000007FC
	ldrh r1, [r6, r1]
	add r6, r5, r4
	add r6, #0x30
	ldrb r7, [r6]
	mov r6, #0x30
	mul r6, r7
	add r7, r0, r6
	ldr r6, _0207BBF8 ; =0x000007FC
	ldrh r6, [r7, r6]
	cmp r1, r6
	bne _0207BBDA
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_0207BBDA:
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #6
	blo _0207BBA6
_0207BBE4:
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #5
	blo _0207BB90
_0207BBEE:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0207BBF4: .word 0x00000654
_0207BBF8: .word 0x000007FC
	thumb_func_end sub_0207BB88

	thumb_func_start sub_0207BBFC
sub_0207BBFC: ; 0x0207BBFC
	lsl r3, r0, #1
	ldr r0, _0207BC14 ; =_021012B0
	ldrb r0, [r0, r3]
	lsl r0, r0, #3
	add r0, #0x14
	strh r0, [r1]
	ldr r0, _0207BC18 ; =_021012B0 + 1
	ldrb r0, [r0, r3]
	lsl r0, r0, #3
	add r0, #0x14
	strh r0, [r2]
	bx lr
	.balign 4, 0
_0207BC14: .word _021012B0
_0207BC18: .word _021012B0 + 1
	thumb_func_end sub_0207BBFC

	thumb_func_start sub_0207BC1C
sub_0207BC1C: ; 0x0207BC1C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _0207BCB4 ; =0x00000824
	add r5, r0, #0
	ldr r1, [r5, r1]
	bl sub_0207E778
	add r2, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r2, r0
	beq _0207BC3C
	add r0, r0, #1
	cmp r2, r0
	beq _0207BCB0
	b _0207BCAA
_0207BC3C:
	add r0, r5, #0
	mov r1, #0
	bl sub_02079224
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	ldr r0, _0207BCB8 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r1, [r0]
	cmp r1, #2
	beq _0207BC76
	cmp r1, #0x11
	beq _0207BC76
	add r0, r1, #0
	add r0, #0xea
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0207BC82
_0207BC76:
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	b _0207BC9C
_0207BC82:
	cmp r1, #0x15
	bne _0207BC92
	add r0, r5, #0
	mov r1, #0xb8
	mov r2, #1
	bl sub_0207DAC4
	b _0207BC9C
_0207BC92:
	add r0, r5, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
_0207BC9C:
	ldr r0, _0207BCBC ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DD08
	mov r0, #1
	pop {r3, r4, r5, pc}
_0207BCAA:
	add r0, r5, #0
	add r1, r4, #0
	blx r2
_0207BCB0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0207BCB4: .word 0x00000824
_0207BCB8: .word 0x00000654
_0207BCBC: .word 0x00000678
	thumb_func_end sub_0207BC1C

	thumb_func_start sub_0207BCC0
sub_0207BCC0: ; 0x0207BCC0
	ldr r2, _0207BCE4 ; =_021013C4
	mov r3, #0
_0207BCC4:
	lsl r1, r3, #1
	ldrh r1, [r2, r1]
	cmp r0, r1
	bne _0207BCD4
	add r3, #0x10
	lsl r0, r3, #0x18
	lsr r0, r0, #0x18
	bx lr
_0207BCD4:
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #0x10
	blo _0207BCC4
	mov r0, #0xff
	bx lr
	nop
_0207BCE4: .word _021013C4
	thumb_func_end sub_0207BCC0

	thumb_func_start sub_0207BCE8
sub_0207BCE8: ; 0x0207BCE8
	push {r4, lr}
	add r4, r0, #0
	bl sub_0207BFD8
	cmp r0, #0
	beq _0207BCFE
	cmp r0, #1
	beq _0207BD40
	cmp r0, #2
	beq _0207BD50
	b _0207BD5A
_0207BCFE:
	ldr r0, _0207BD60 ; =0x000005EC
	bl PlaySE
	ldr r0, _0207BD64 ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DD08
	ldr r0, _0207BD68 ; =0x00000C65
	mov r1, #0x30
	ldrb r2, [r4, r0]
	mul r1, r2
	add r3, r4, r1
	mov r1, #0x83
	lsl r1, r1, #4
	ldrh r2, [r3, r1]
	sub r1, r1, #2
	ldrh r1, [r3, r1]
	sub r2, r2, r1
	add r1, r0, #3
	ldrh r1, [r4, r1]
	cmp r2, r1
	bge _0207BD30
	add r0, r0, #3
	strh r2, [r4, r0]
_0207BD30:
	ldr r0, _0207BD6C ; =0x00000C6A
	mov r1, #2
	strh r1, [r4, r0]
	mov r1, #0
	add r0, r0, #2
	strh r1, [r4, r0]
	mov r0, #0x1e
	pop {r4, pc}
_0207BD40:
	ldr r0, _0207BD70 ; =0x000005DC
	bl PlaySE
	ldr r0, _0207BD6C ; =0x00000C6A
	mov r1, #1
	strh r1, [r4, r0]
	mov r0, #0x18
	pop {r4, pc}
_0207BD50:
	ldr r0, _0207BD74 ; =0x000005F2
	bl PlaySE
	mov r0, #0x1e
	pop {r4, pc}
_0207BD5A:
	mov r0, #0x1e
	pop {r4, pc}
	nop
_0207BD60: .word 0x000005EC
_0207BD64: .word 0x00000678
_0207BD68: .word 0x00000C65
_0207BD6C: .word 0x00000C6A
_0207BD70: .word 0x000005DC
_0207BD74: .word 0x000005F2
	thumb_func_end sub_0207BCE8

	thumb_func_start sub_0207BD78
sub_0207BD78: ; 0x0207BD78
	push {r4, r5, r6, lr}
	sub sp, #8
	mov r1, #0xc9
	add r4, r0, #0
	lsl r1, r1, #4
	add r5, r4, r1
	ldr r2, [r5, #0xc]
	cmp r2, #1
	bne _0207BDBA
	bl sub_0207CC24
	cmp r0, #0
	bne _0207BDB4
	ldr r0, _0207BFB0 ; =0x00000C65
	ldrb r0, [r4, r0]
	cmp r0, #7
	beq _0207BDAE
	ldr r0, _0207BFB4 ; =0x00000684
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020249D4
	ldr r0, _0207BFB4 ; =0x00000684
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
_0207BDAE:
	add sp, #8
	ldr r0, [r5, #8]
	pop {r4, r5, r6, pc}
_0207BDB4:
	add sp, #8
	mov r0, #0x1e
	pop {r4, r5, r6, pc}
_0207BDBA:
	add r2, r1, #0
	sub r2, #0x26
	ldrh r2, [r4, r2]
	cmp r2, #4
	bhi _0207BE14
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0207BDD0: ; jump table
	.short _0207BDDA - _0207BDD0 - 2 ; case 0
	.short _0207BEB2 - _0207BDD0 - 2 ; case 1
	.short _0207BEDA - _0207BDD0 - 2 ; case 2
	.short _0207BF02 - _0207BDD0 - 2 ; case 3
	.short _0207BF88 - _0207BDD0 - 2 ; case 4
_0207BDDA:
	bl sub_0207AD6C
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	beq _0207BE54
	cmp r5, #6
	bhi _0207BE14
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207BDF8: ; jump table
	.short _0207BE06 - _0207BDF8 - 2 ; case 0
	.short _0207BE06 - _0207BDF8 - 2 ; case 1
	.short _0207BE06 - _0207BDF8 - 2 ; case 2
	.short _0207BE06 - _0207BDF8 - 2 ; case 3
	.short _0207BE06 - _0207BDF8 - 2 ; case 4
	.short _0207BE06 - _0207BDF8 - 2 ; case 5
	.short _0207BE34 - _0207BDF8 - 2 ; case 6
_0207BE06:
	ldr r0, _0207BFB8 ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl GetPartyCount
	cmp r5, r0
	blo _0207BE16
_0207BE14:
	b _0207BFAA
_0207BE16:
	ldr r0, _0207BFBC ; =0x00000948
	lsl r3, r5, #3
	ldr r6, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r6, r3]
	add r3, r6, r3
	ldrb r3, [r3, #1]
	add r1, r5, #0
	bl sub_0207A910
	add r0, r4, #0
	bl sub_0207BCE8
	add sp, #8
	pop {r4, r5, r6, pc}
_0207BE34:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	add r0, r4, #0
	mov r1, #9
	mov r2, #1
	mov r3, #0
	bl sub_0207CBD0
	add sp, #8
	mov r0, #0x1e
	pop {r4, r5, r6, pc}
_0207BE54:
	ldr r0, _0207BFC0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207BE90
	ldr r0, _0207BFB0 ; =0x00000C65
	ldrb r0, [r4, r0]
	cmp r0, #6
	blo _0207BE86
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	add r0, r4, #0
	mov r1, #9
	mov r2, #1
	mov r3, #0
	bl sub_0207CBD0
	add sp, #8
	mov r0, #0x1e
	pop {r4, r5, r6, pc}
_0207BE86:
	add r0, r4, #0
	bl sub_0207BCE8
	add sp, #8
	pop {r4, r5, r6, pc}
_0207BE90:
	mov r0, #2
	tst r0, r1
	beq _0207BEAA
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0207BEAA:
	add r0, r4, #0
	bl sub_0207A8FC
	b _0207BFAA
_0207BEB2:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	ldr r0, _0207BFC4 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _0207BFC8 ; =0x00000C6A
	mov r1, #0
	strh r1, [r4, r0]
	b _0207BFAA
_0207BEDA:
	sub r1, #0x2d
	ldrb r1, [r4, r1]
	mov r2, #0
	mvn r2, r2
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207C048
	cmp r0, #1
	bne _0207BFAA
	ldr r0, _0207BFCC ; =0x000005EC
	bl PlaySE
	ldr r0, _0207BFC8 ; =0x00000C6A
	mov r1, #3
	strh r1, [r4, r0]
	mov r1, #0
	add r0, r0, #2
	strh r1, [r4, r0]
	b _0207BFAA
_0207BF02:
	sub r1, #0x2b
	ldrb r1, [r4, r1]
	mov r2, #1
	bl sub_0207C048
	cmp r0, #1
	bne _0207BFAA
	ldr r0, _0207BFB8 ; =0x00000654
	ldr r1, _0207BFB0 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x41
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207BFD0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r2, _0207BFD4 ; =0x00000C6C
	str r1, [sp, #4]
	ldr r0, _0207BFD0 ; =0x000007C4
	ldrh r2, [r4, r2]
	ldr r0, [r4, r0]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r1, _0207BFD0 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BFC8 ; =0x00000C6A
	mov r1, #4
	strh r1, [r4, r0]
	mov r1, #0x1e
	sub r0, #8
	strb r1, [r4, r0]
	add sp, #8
	mov r0, #0x18
	pop {r4, r5, r6, pc}
_0207BF88:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	ldr r0, _0207BFC4 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	bl sub_0207FBC8
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0207BFAA:
	mov r0, #0x1e
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207BFB0: .word 0x00000C65
_0207BFB4: .word 0x00000684
_0207BFB8: .word 0x00000654
_0207BFBC: .word 0x00000948
_0207BFC0: .word gSystem
_0207BFC4: .word 0x00000678
_0207BFC8: .word 0x00000C6A
_0207BFCC: .word 0x000005EC
_0207BFD0: .word 0x000007C4
_0207BFD4: .word 0x00000C6C
	thumb_func_end sub_0207BD78

	thumb_func_start sub_0207BFD8
sub_0207BFD8: ; 0x0207BFD8
	push {r3, r4, r5, lr}
	ldr r2, _0207C038 ; =0x00000C65
	add r4, r0, #0
	ldrb r1, [r4, r2]
	mov r0, #0x30
	ldr r3, _0207C03C ; =0x00000838
	mul r0, r1
	add r0, r4, r0
	ldrb r5, [r0, r3]
	cmp r5, #0
	beq _0207BFF2
	mov r0, #2
	pop {r3, r4, r5, pc}
_0207BFF2:
	sub r2, r2, #2
	ldrb r2, [r4, r2]
	lsl r2, r2, #0x1a
	lsr r2, r2, #0x1a
	cmp r1, r2
	beq _0207C010
	add r1, r3, #0
	sub r1, #0xa
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _0207C010
	sub r3, #8
	ldrh r0, [r0, r3]
	cmp r1, r0
	bne _0207C032
_0207C010:
	ldr r0, _0207C040 ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	mov r1, #0x78
	mov r2, #1
	bl sub_0207DAEC
	ldr r1, _0207C044 ; =0x00000C6A
	mov r0, #1
	strh r0, [r4, r1]
	mov r2, #0x1e
	sub r1, #8
	strb r2, [r4, r1]
	pop {r3, r4, r5, pc}
_0207C032:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0207C038: .word 0x00000C65
_0207C03C: .word 0x00000838
_0207C040: .word 0x00000678
_0207C044: .word 0x00000C6A
	thumb_func_end sub_0207BFD8

	thumb_func_start sub_0207C048
sub_0207C048: ; 0x0207C048
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r3, #0x30
	add r4, r6, #0
	mul r4, r3
	ldr r3, _0207C0CC ; =0x0000082E
	add r5, r0, #0
	add r7, r5, r3
	lsl r2, r2, #0x10
	ldrh r3, [r7, r4]
	lsr r2, r2, #0x10
	add r2, r3, r2
	ldr r3, _0207C0D0 ; =0x00000C6C
	strh r2, [r7, r4]
	ldrh r2, [r5, r3]
	add r2, r2, #1
	strh r2, [r5, r3]
	bl sub_0207D480
	lsl r1, r6, #2
	add r1, r6, r1
	add r1, r1, #3
	add r0, r5, #4
	lsl r1, r1, #4
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D440
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D4EC
	ldr r1, _0207C0D4 ; =0x00000C68
	ldrh r0, [r5, r1]
	add r1, r1, #4
	ldrh r1, [r5, r1]
	cmp r0, r1
	beq _0207C0AA
	mov r1, #0x83
	add r2, r5, r4
	lsl r1, r1, #4
	ldrh r0, [r7, r4]
	ldrh r1, [r2, r1]
	cmp r0, r1
	bne _0207C0C6
_0207C0AA:
	ldr r0, _0207C0D8 ; =0x00000654
	add r1, r6, #0
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	ldrh r1, [r7, r4]
	add r2, sp, #0
	str r1, [sp]
	mov r1, #0xa3
	bl SetMonData
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207C0C6:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207C0CC: .word 0x0000082E
_0207C0D0: .word 0x00000C6C
_0207C0D4: .word 0x00000C68
_0207C0D8: .word 0x00000654
	thumb_func_end sub_0207C048

	thumb_func_start sub_0207C0DC
sub_0207C0DC: ; 0x0207C0DC
	push {r4, r5, r6, lr}
	mov r1, #0xc9
	add r4, r0, #0
	lsl r1, r1, #4
	add r5, r4, r1
	ldr r1, [r5, #0xc]
	cmp r1, #1
	bne _0207C100
	bl sub_0207CC24
	cmp r0, #0
	bne _0207C0FC
	ldr r0, [r5, #8]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
_0207C0FC:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C100:
	bl sub_0207AD6C
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	beq _0207C1AE
	cmp r5, #6
	bhi _0207C204
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207C11E: ; jump table
	.short _0207C12C - _0207C11E - 2 ; case 0
	.short _0207C12C - _0207C11E - 2 ; case 1
	.short _0207C12C - _0207C11E - 2 ; case 2
	.short _0207C12C - _0207C11E - 2 ; case 3
	.short _0207C12C - _0207C11E - 2 ; case 4
	.short _0207C12C - _0207C11E - 2 ; case 5
	.short _0207C176 - _0207C11E - 2 ; case 6
_0207C12C:
	ldr r0, _0207C268 ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl GetPartyCount
	cmp r5, r0
	bhs _0207C204
	ldr r0, _0207C26C ; =0x00000948
	lsl r3, r5, #3
	ldr r6, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r6, r3]
	add r3, r6, r3
	ldrb r3, [r3, #1]
	add r1, r5, #0
	bl sub_0207A910
	ldr r0, _0207C270 ; =0x00000C65
	strb r5, [r4, r0]
	ldrb r1, [r4, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0207C274 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0207C16C
	ldr r0, _0207C278 ; =0x000005DC
	bl PlaySE
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207C16C:
	ldr r0, _0207C27C ; =0x000005F2
	bl PlaySE
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C176:
	ldr r0, _0207C280 ; =0x00000C63
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0207C204
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _0207C26C ; =0x00000948
	mov r1, #7
	ldr r3, [r4, r0]
	add r0, r4, #0
	add r2, r3, #0
	add r2, #0x38
	add r3, #0x39
	ldrb r2, [r2]
	ldrb r3, [r3]
	bl sub_0207A910
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #1
	bl sub_0207CBD0
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C1AE:
	ldr r0, _0207C284 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207C204
	ldr r0, _0207C270 ; =0x00000C65
	ldrb r1, [r4, r0]
	cmp r1, #7
	bne _0207C1E2
	sub r0, r0, #2
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0207C200
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #0
	bl sub_0207CBD0
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C1E2:
	mov r0, #0x30
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0207C274 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0207C1FA
	ldr r0, _0207C278 ; =0x000005DC
	bl PlaySE
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207C1FA:
	ldr r0, _0207C27C ; =0x000005F2
	bl PlaySE
_0207C200:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C204:
	ldr r0, _0207C284 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _0207C260
	ldr r0, _0207C280 ; =0x00000C63
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0207C25C
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _0207C270 ; =0x00000C65
	ldrb r0, [r4, r0]
	cmp r0, #7
	bne _0207C236
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #0
	bl sub_0207CBD0
	b _0207C258
_0207C236:
	ldr r0, _0207C26C ; =0x00000948
	mov r1, #7
	ldr r3, [r4, r0]
	add r0, r4, #0
	add r2, r3, #0
	add r2, #0x38
	add r3, #0x39
	ldrb r2, [r2]
	ldrb r3, [r3]
	bl sub_0207A910
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #1
	bl sub_0207CBD0
_0207C258:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C25C:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C260:
	add r0, r4, #0
	bl sub_0207A8FC
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207C268: .word 0x00000654
_0207C26C: .word 0x00000948
_0207C270: .word 0x00000C65
_0207C274: .word 0x00000838
_0207C278: .word 0x000005DC
_0207C27C: .word 0x000005F2
_0207C280: .word 0x00000C63
_0207C284: .word gSystem
	thumb_func_end sub_0207C0DC

	thumb_func_start sub_0207C288
sub_0207C288: ; 0x0207C288
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0207C3C0 ; =0x00000654
	mov r1, #0
	ldr r0, [r5, r0]
	mov r2, #0xc
	ldrh r0, [r0, #0x28]
	bl LoadItemDataOrGfx
	add r4, r0, #0
	ldr r0, _0207C3C0 ; =0x00000654
	ldr r2, [r5, r0]
	ldr r0, _0207C3C4 ; =0x000001D2
	ldrh r1, [r2, #0x28]
	cmp r1, r0
	bne _0207C2D2
	ldr r1, _0207C3C8 ; =0x00000C65
	ldr r0, [r2]
	ldrb r1, [r5, r1]
	bl GetPartyMonByIndex
	bl Mon_CanUseGracidea
	cmp r0, #1
	bne _0207C2D2
	ldr r0, _0207C3C0 ; =0x00000654
	mov r1, #1
	ldr r0, [r5, r0]
	strh r1, [r0, #0x3c]
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl sub_0207CB54
	mov r0, #0x1f
	pop {r3, r4, r5, pc}
_0207C2D2:
	add r0, r4, #0
	mov r1, #0x22
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _0207C2EA
	add r0, r4, #0
	mov r1, #0x23
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0207C2FC
_0207C2EA:
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	mov r1, #0
	bl sub_02082654
	mov r0, #6
	pop {r3, r4, r5, pc}
_0207C2FC:
	add r0, r4, #0
	mov r1, #0x24
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0207C326
	add r0, r4, #0
	mov r1, #0x25
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _0207C326
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	mov r1, #1
	bl sub_02082654
	mov r0, #6
	pop {r3, r4, r5, pc}
_0207C326:
	ldr r0, _0207C3C0 ; =0x00000654
	ldr r2, _0207C3C8 ; =0x00000C65
	ldr r1, [r5, r0]
	mov r0, #0xc
	str r0, [sp]
	ldr r0, [r1]
	ldrh r1, [r1, #0x28]
	ldrb r2, [r5, r2]
	mov r3, #0
	bl CanUseItemOnMonInParty
	cmp r0, #1
	bne _0207C3A0
	ldr r0, _0207C3C0 ; =0x00000654
	mov r2, #1
	ldr r1, [r5, r0]
	mov r3, #0xc
	ldr r0, [r1, #4]
	ldrh r1, [r1, #0x28]
	bl Bag_TakeItem
	add r0, r4, #0
	mov r1, #0x1a
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0207C398
	ldr r0, _0207C3C0 ; =0x00000654
	ldr r1, _0207C3C8 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, _0207C3C0 ; =0x00000654
	mov r2, #3
	ldr r3, [r5, r0]
	add r0, r3, #0
	add r0, #0x40
	str r0, [sp]
	ldrh r3, [r3, #0x28]
	mov r0, #0
	bl GetMonEvolution
	ldr r1, _0207C3C0 ; =0x00000654
	ldr r2, [r5, r1]
	strh r0, [r2, #0x3c]
	ldr r0, [r5, r1]
	mov r2, #8
	add r0, #0x27
	strb r2, [r0]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x20
	pop {r3, r4, r5, pc}
_0207C398:
	add r0, r5, #0
	bl sub_020812E8
	b _0207C3B6
_0207C3A0:
	add r0, r5, #0
	mov r1, #0x66
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207C3C8 ; =0x00000C65
	mov r1, #7
	strb r1, [r5, r0]
	ldr r1, _0207C3CC ; =sub_02081378
	sub r0, #0x11
	str r1, [r5, r0]
_0207C3B6:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #5
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0207C3C0: .word 0x00000654
_0207C3C4: .word 0x000001D2
_0207C3C8: .word 0x00000C65
_0207C3CC: .word sub_02081378
	thumb_func_end sub_0207C288

	thumb_func_start sub_0207C3D0
sub_0207C3D0: ; 0x0207C3D0
	push {r3, lr}
	ldr r1, _0207C3F8 ; =0x00000C65
	ldrb r2, [r0, r1]
	mov r1, #0x30
	mul r1, r2
	add r1, r0, r1
	ldr r0, _0207C3FC ; =0x00000834
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _0207C3E8
	mov r0, #0
	pop {r3, pc}
_0207C3E8:
	bl ItemIdIsMail
	cmp r0, #1
	bne _0207C3F4
	mov r0, #2
	pop {r3, pc}
_0207C3F4:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0207C3F8: .word 0x00000C65
_0207C3FC: .word 0x00000834
	thumb_func_end sub_0207C3D0

	thumb_func_start sub_0207C400
sub_0207C400: ; 0x0207C400
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0207C5C4 ; =0x00000654
	ldr r1, _0207C5C8 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	mov r4, #0
	ldr r0, [r0]
	mvn r4, r4
	bl GetPartyMonByIndex
	ldr r1, _0207C5C4 ; =0x00000654
	add r7, r0, #0
	ldr r1, [r5, r1]
	ldr r6, [r1, #0x1c]
	ldrh r1, [r1, #0x28]
	cmp r1, #0x70
	bne _0207C4B6
	mov r1, #5
	mov r2, #0
	bl GetMonData
	ldr r1, _0207C5CC ; =0x000001E7
	cmp r0, r1
	beq _0207C478
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0xbd
	bl ReadMsgDataIntoString
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207C5D0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207C5C4 ; =0x00000654
	ldr r0, _0207C5D0 ; =0x000007C4
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	ldrh r2, [r2, #0x28]
	mov r1, #1
	bl BufferItemNameWithIndefArticle
	ldr r2, _0207C5D0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r4, #0xb
	b _0207C4B6
_0207C478:
	cmp r6, #0
	beq _0207C4B6
	ldr r0, [r6, #0x20]
	ldr r0, [r0]
	cmp r0, #2
	bne _0207C4B6
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0xbe
	bl ReadMsgDataIntoString
	ldr r2, _0207C5C4 ; =0x00000654
	ldr r0, _0207C5D0 ; =0x000007C4
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	ldrh r2, [r2, #0x28]
	mov r1, #0
	bl BufferItemName
	ldr r2, _0207C5D0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r4, #0xb
_0207C4B6:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0207C59E
	add r0, r5, #0
	bl sub_0207C3D0
	cmp r0, #0
	beq _0207C4D2
	cmp r0, #1
	beq _0207C53E
	cmp r0, #2
	beq _0207C58C
	b _0207C59E
_0207C4D2:
	ldr r0, _0207C5C4 ; =0x00000654
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x28]
	bl ItemIdIsMail
	cmp r0, #1
	bne _0207C4EE
	ldr r0, _0207C5C4 ; =0x00000654
	mov r1, #6
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0207C4EE:
	add r0, r5, #0
	add r1, r7, #0
	add r2, sp, #0
	bl sub_0207C5D4
	mov r2, #0x1f
	lsl r2, r2, #6
	add r4, r0, #0
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x6b
	bl ReadMsgDataIntoString
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207C5D0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207C5C4 ; =0x00000654
	ldr r0, _0207C5D0 ; =0x000007C4
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	ldrh r2, [r2, #0x28]
	mov r1, #1
	bl BufferItemName
	ldr r2, _0207C5D0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	b _0207C59E
_0207C53E:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x4f
	bl ReadMsgDataIntoString
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207C5D0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207C5C8 ; =0x00000C65
	ldr r3, _0207C5D0 ; =0x000007C4
	ldrb r4, [r5, r2]
	mov r2, #0x30
	ldr r0, [r5, r3]
	mul r2, r4
	add r2, r5, r2
	add r3, #0x70
	ldrh r2, [r2, r3]
	mov r1, #1
	bl BufferItemNameWithIndefArticle
	ldr r2, _0207C5D0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r4, #9
	b _0207C59E
_0207C58C:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x4e
	bl ReadMsgDataIntoString
	mov r4, #0xb
_0207C59E:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	mov r2, #0x2a
	mov r3, #0xf
	bl DrawFrameAndWindow2
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl sub_0207DB30
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207C5C4: .word 0x00000654
_0207C5C8: .word 0x00000C65
_0207C5CC: .word 0x000001E7
_0207C5D0: .word 0x000007C4
	thumb_func_end sub_0207C400

	thumb_func_start sub_0207C5D4
sub_0207C5D4: ; 0x0207C5D4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, _0207C64C ; =0x00000654
	add r6, r1, #0
	ldr r1, [r5, r0]
	add r4, r2, #0
	ldrh r1, [r1, #0x28]
	mov r2, #1
	mov r3, #0xc
	str r1, [sp]
	ldr r1, [r5, r0]
	ldr r0, [r1, #4]
	ldrh r1, [r1, #0x28]
	bl Bag_TakeItem
	add r0, r6, #0
	mov r1, #6
	add r2, sp, #0
	bl SetMonData
	add r0, r6, #0
	bl Pokemon_UpdateArceusForme
	add r0, r6, #0
	bl Mon_UpdateGiratinaForme
	str r0, [r4]
	ldr r1, _0207C650 ; =0x00000C65
	ldr r0, _0207C64C ; =0x00000654
	ldrb r3, [r5, r1]
	ldr r0, [r5, r0]
	mov r2, #0x30
	add r6, r3, #0
	mul r6, r2
	ldrh r0, [r0, #0x28]
	ldr r3, _0207C654 ; =0x00000834
	add r6, r5, r6
	strh r0, [r6, r3]
	ldrb r1, [r5, r1]
	add r0, r5, #0
	mul r2, r1
	add r2, r5, r2
	ldrh r2, [r2, r3]
	bl sub_0207F004
	ldr r0, [sp]
	cmp r0, #0x70
	bne _0207C646
	mov r0, #0
	ldr r1, [r4]
	mvn r0, r0
	cmp r1, r0
	beq _0207C646
	add sp, #4
	mov r0, #0xc
	pop {r3, r4, r5, r6, pc}
_0207C646:
	mov r0, #0xb
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0207C64C: .word 0x00000654
_0207C650: .word 0x00000C65
_0207C654: .word 0x00000834
	thumb_func_end sub_0207C5D4

	thumb_func_start sub_0207C658
sub_0207C658: ; 0x0207C658
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0207C6B0 ; =0x00000654
	add r5, r1, #0
	ldr r0, [r4, r0]
	lsl r1, r2, #0x10
	ldr r0, [r0, #4]
	lsr r1, r1, #0x10
	mov r2, #1
	mov r3, #0xc
	bl Bag_AddItem
	add r0, r5, #0
	mov r1, #6
	add r2, sp, #0x1c
	bl SetMonData
	add r0, r5, #0
	bl Pokemon_UpdateArceusForme
	add r0, r5, #0
	bl Mon_UpdateGiratinaForme
	ldr r1, _0207C6B4 ; =0x00000C65
	mov r2, #0x30
	ldrb r3, [r4, r1]
	ldr r0, [sp, #0x1c]
	add r5, r3, #0
	mul r5, r2
	ldr r3, _0207C6B8 ; =0x00000834
	add r5, r4, r5
	strh r0, [r5, r3]
	ldrb r1, [r4, r1]
	add r0, r4, #0
	mul r2, r1
	add r2, r4, r2
	ldrh r2, [r2, r3]
	bl sub_0207F004
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_0207C6B0: .word 0x00000654
_0207C6B4: .word 0x00000C65
_0207C6B8: .word 0x00000834
	thumb_func_end sub_0207C658

	thumb_func_start sub_0207C6BC
sub_0207C6BC: ; 0x0207C6BC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207C6D8 ; =0x00000C64
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0207C6D4
	add r0, r4, #0
	bl sub_0207C8B4
	pop {r4, pc}
_0207C6D4:
	mov r0, #0xb
	pop {r4, pc}
	.balign 4, 0
_0207C6D8: .word 0x00000C64
	thumb_func_end sub_0207C6BC

	thumb_func_start sub_0207C6DC
sub_0207C6DC: ; 0x0207C6DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207C708 ; =0x00000C64
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0207C702
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl sub_0207CB54
	mov r0, #0xd
	pop {r4, pc}
_0207C702:
	mov r0, #0xc
	pop {r4, pc}
	nop
_0207C708: .word 0x00000C64
	thumb_func_end sub_0207C6DC

	thumb_func_start sub_0207C70C
sub_0207C70C: ; 0x0207C70C
	push {r4, lr}
	add r4, r0, #0
	bl PartyMenu_AnimateIconFormeChange
	cmp r0, #1
	bne _0207C722
	add r0, r4, #0
	bl sub_0207CB6C
	mov r0, #0xb
	pop {r4, pc}
_0207C722:
	mov r0, #0xd
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0207C70C

	thumb_func_start sub_0207C728
sub_0207C728: ; 0x0207C728
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207C748 ; =0x00000C64
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0207C742
	add r0, r4, #0
	bl sub_0207DBCC
	mov r0, #0xa
	pop {r4, pc}
_0207C742:
	mov r0, #9
	pop {r4, pc}
	nop
_0207C748: .word 0x00000C64
	thumb_func_end sub_0207C728

	thumb_func_start sub_0207C74C
sub_0207C74C: ; 0x0207C74C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0207C8A0 ; =0x00000C88
	ldr r0, [r5, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _0207C766
	cmp r0, #2
	bne _0207C764
	b _0207C882
_0207C764:
	b _0207C898
_0207C766:
	ldr r0, _0207C8A0 ; =0x00000C88
	ldr r0, [r5, r0]
	bl sub_02016624
	bl sub_0207CB90
	ldr r0, _0207C8A4 ; =0x00000654
	ldr r1, _0207C8A8 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	str r0, [sp]
	ldr r0, _0207C8A4 ; =0x00000654
	add r2, sp, #4
	ldr r0, [r5, r0]
	ldrh r6, [r0, #0x28]
	ldr r0, _0207C8A8 ; =0x00000C65
	ldrb r1, [r5, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0207C8AC ; =0x00000834
	ldrh r4, [r1, r0]
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_0207C5D4
	add r7, r0, #0
	ldr r0, _0207C8A4 ; =0x00000654
	add r1, r4, #0
	ldr r0, [r5, r0]
	mov r2, #1
	ldr r0, [r0, #4]
	mov r3, #0xc
	bl Bag_AddItem
	cmp r0, #0
	bne _0207C7D6
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0207C658
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x54
	bl ReadMsgDataIntoString
	mov r7, #0xb
	b _0207C86A
_0207C7D6:
	ldr r0, _0207C8A4 ; =0x00000654
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x28]
	bl ItemIdIsMail
	cmp r0, #1
	bne _0207C812
	ldr r0, _0207C8A4 ; =0x00000654
	lsl r1, r4, #0x10
	ldr r0, [r5, r0]
	lsr r1, r1, #0x10
	ldr r0, [r0, #4]
	mov r2, #1
	mov r3, #0xc
	bl Bag_TakeItem
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0207C658
	ldr r0, _0207C8A4 ; =0x00000654
	mov r1, #6
	ldr r0, [r5, r0]
	add sp, #8
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0207C812:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x55
	bl ReadMsgDataIntoString
	ldr r0, _0207C8B0 ; =0x000007C4
	mov r1, #1
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl BufferItemName
	ldr r0, _0207C8B0 ; =0x000007C4
	mov r1, #2
	ldr r0, [r5, r0]
	add r2, r6, #0
	bl BufferItemName
	ldr r2, _0207C8B0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	cmp r6, #0x70
	beq _0207C860
	cmp r4, #0x70
	bne _0207C860
	mov r0, #0
	ldr r1, [sp, #4]
	mvn r0, r0
	cmp r1, r0
	beq _0207C860
	mov r7, #0xc
	b _0207C86A
_0207C860:
	cmp r6, #0x70
	bne _0207C86A
	cmp r4, #0x70
	bne _0207C86A
	mov r7, #0xb
_0207C86A:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl sub_0207DB30
	add sp, #8
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0207C882:
	ldr r0, _0207C8A0 ; =0x00000C88
	ldr r0, [r5, r0]
	bl sub_02016624
	bl sub_0207CB90
	add r0, r5, #0
	bl sub_0207C8B4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0207C898:
	mov r0, #0xa
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207C8A0: .word 0x00000C88
_0207C8A4: .word 0x00000654
_0207C8A8: .word 0x00000C65
_0207C8AC: .word 0x00000834
_0207C8B0: .word 0x000007C4
	thumb_func_end sub_0207C74C

	thumb_func_start sub_0207C8B4
sub_0207C8B4: ; 0x0207C8B4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207C900 ; =0x00000654
	ldr r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0207C8F4
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _0207C904 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	ldr r0, _0207C900 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x24
	strb r1, [r0]
	mov r0, #1
	pop {r4, pc}
_0207C8F4:
	mov r0, #0xa
	add r1, #0x27
	strb r0, [r1]
	mov r0, #0x20
	pop {r4, pc}
	nop
_0207C900: .word 0x00000654
_0207C904: .word 0x00000678
	thumb_func_end sub_0207C8B4

	thumb_func_start sub_0207C908
sub_0207C908: ; 0x0207C908
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0207CA20 ; =0x00000654
	ldr r1, _0207CA24 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r7, r0, #0
	ldr r0, _0207CA20 ; =0x00000654
	add r2, sp, #4
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x28]
	str r0, [sp]
	ldr r0, _0207CA24 ; =0x00000C65
	ldrb r1, [r5, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0207CA28 ; =0x00000834
	ldrh r4, [r1, r0]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0207C5D4
	add r6, r0, #0
	cmp r4, #0x70
	bne _0207C950
	cmp r6, #0xb
	bne _0207C950
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0207C950
	mov r6, #0xc
_0207C950:
	cmp r4, #0
	bne _0207C998
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x6b
	bl ReadMsgDataIntoString
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207CA2C ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207CA20 ; =0x00000654
	ldr r0, _0207CA2C ; =0x000007C4
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	ldrh r2, [r2, #0x28]
	mov r1, #1
	bl BufferItemName
	ldr r2, _0207CA2C ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	b _0207C9E2
_0207C998:
	ldr r0, _0207CA20 ; =0x00000654
	lsl r1, r4, #0x10
	ldr r0, [r5, r0]
	lsr r1, r1, #0x10
	ldr r0, [r0, #4]
	mov r2, #1
	mov r3, #0xc
	bl Bag_AddItem
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x55
	bl ReadMsgDataIntoString
	ldr r0, _0207CA2C ; =0x000007C4
	mov r1, #1
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl BufferItemName
	ldr r0, _0207CA2C ; =0x000007C4
	ldr r2, [sp]
	ldr r0, [r5, r0]
	mov r1, #2
	bl BufferItemName
	ldr r2, _0207CA2C ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
_0207C9E2:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	mov r2, #0x2a
	mov r3, #0xf
	bl DrawFrameAndWindow2
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl sub_0207DB30
	ldr r0, _0207CA20 ; =0x00000654
	ldr r1, [r5, r0]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _0207CA18
	mov r0, #0xa
	add r1, #0x24
	strb r0, [r1]
_0207CA18:
	add r0, r6, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207CA20: .word 0x00000654
_0207CA24: .word 0x00000C65
_0207CA28: .word 0x00000834
_0207CA2C: .word 0x000007C4
	thumb_func_end sub_0207C908

	thumb_func_start sub_0207CA30
sub_0207CA30: ; 0x0207CA30
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207CA80 ; =0x00000C65
	ldrb r1, [r4, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0207CA84 ; =0x0000083A
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _0207CA54
	ldr r0, _0207CA88 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
_0207CA54:
	ldr r0, _0207CA8C ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	mov r1, #0xb3
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207CA90 ; =sub_0207FAA8
	ldr r1, _0207CA94 ; =0x00000C58
	ldr r2, _0207CA98 ; =sub_0207FAD4
	str r0, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r4, r1]
	mov r0, #0x18
	pop {r4, pc}
	nop
_0207CA80: .word 0x00000C65
_0207CA84: .word 0x0000083A
_0207CA88: .word 0x00000654
_0207CA8C: .word 0x00000678
_0207CA90: .word sub_0207FAA8
_0207CA94: .word 0x00000C58
_0207CA98: .word sub_0207FAD4
	thumb_func_end sub_0207CA30

	thumb_func_start sub_0207CA9C
sub_0207CA9C: ; 0x0207CA9C
	mov r0, #0x14
	bx lr
	thumb_func_end sub_0207CA9C

	thumb_func_start sub_0207CAA0
sub_0207CAA0: ; 0x0207CAA0
	mov r0, #0x15
	bx lr
	thumb_func_end sub_0207CAA0

	thumb_func_start sub_0207CAA4
sub_0207CAA4: ; 0x0207CAA4
	mov r0, #0x13
	bx lr
	thumb_func_end sub_0207CAA4

	thumb_func_start sub_0207CAA8
sub_0207CAA8: ; 0x0207CAA8
	mov r0, #0x12
	bx lr
	thumb_func_end sub_0207CAA8

	thumb_func_start sub_0207CAAC
sub_0207CAAC: ; 0x0207CAAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	mov r0, #0x15
	mov r1, #0x16
	add r2, r4, #0
	add r7, r3, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	add r1, sp, #0xc
	str r0, [sp, #8]
	bl NNS_G2dGetUnpackedScreenData
	ldr r0, [sp, #0xc]
	mov r4, #0
	str r0, [sp, #4]
	add r0, #0xc
	str r0, [sp, #4]
	str r0, [sp]
_0207CAD6:
	ldr r1, [sp]
	add r0, r5, #0
	mov r2, #0x20
	bl memcpy
	add r1, r4, #6
	lsl r2, r1, #6
	ldr r1, [sp, #4]
	add r0, r6, #0
	add r1, r1, r2
	mov r2, #0x20
	bl memcpy
	add r1, r4, #0
	add r1, #0xc
	lsl r2, r1, #6
	ldr r1, [sp, #4]
	add r0, r7, #0
	add r1, r1, r2
	mov r2, #0x20
	bl memcpy
	ldr r0, [sp]
	add r4, r4, #1
	add r0, #0x40
	str r0, [sp]
	add r5, #0x20
	add r6, #0x20
	add r7, #0x20
	cmp r4, #6
	blo _0207CAD6
	ldr r0, [sp, #8]
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0207CAAC

	thumb_func_start sub_0207CB20
sub_0207CB20: ; 0x0207CB20
	push {r4, lr}
	ldr r1, _0207CB38 ; =0x00000824
	add r4, r0, #0
	ldr r1, [r4, r1]
	bl sub_0207E618
	mov r0, #0x82
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ListMenuItems_dtor
	pop {r4, pc}
	.balign 4, 0
_0207CB38: .word 0x00000824
	thumb_func_end sub_0207CB20

	thumb_func_start sub_0207CB3C
sub_0207CB3C: ; 0x0207CB3C
	push {r3, lr}
	ldr r2, _0207CB50 ; =0x00000654
	ldr r0, [r0, r2]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _0207CB4C
	bl sub_02018410
_0207CB4C:
	pop {r3, pc}
	nop
_0207CB50: .word 0x00000654
	thumb_func_end sub_0207CB3C

	thumb_func_start sub_0207CB54
sub_0207CB54: ; 0x0207CB54
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207CB68 ; =FS_OVERLAY_ID(OVY_94)
	mov r1, #2
	bl HandleLoadOverlay
	add r0, r4, #0
	bl PartyMenu_InitIconFormeChangeWork
	pop {r4, pc}
	.balign 4, 0
_0207CB68: .word FS_OVERLAY_ID(OVY_94)
	thumb_func_end sub_0207CB54

	thumb_func_start sub_0207CB6C
sub_0207CB6C: ; 0x0207CB6C
	ldr r3, _0207CB74 ; =UnloadOverlayByID
	ldr r0, _0207CB78 ; =FS_OVERLAY_ID(OVY_94)
	bx r3
	nop
_0207CB74: .word UnloadOverlayByID
_0207CB78: .word FS_OVERLAY_ID(OVY_94)
	thumb_func_end sub_0207CB6C

	.rodata

_021012B0:
	.byte 0x01, 0x03
	.byte 0x1A, 0x03
	.byte 0x01, 0x0A
	.byte 0x1A, 0x0A
	.byte 0x01, 0x11
	.byte 0x1A, 0x11
_021012BC:
	.word 1, 0, 0, 0
_021012CC:
	.byte 0x00, 0x02, 0x04, 0x01, 0x03, 0x05
	.byte 0x01, 0x03, 0x05, 0x00, 0x02, 0x04
	.byte 0x04, 0x02, 0x00, 0x05, 0x03, 0x01
	.byte 0x05, 0x03, 0x01, 0x04, 0x02, 0x00
_021012E4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101300:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0210131C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x04
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101338:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02101354:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101370:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0210138C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021013A8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021013C4:
	.short MOVE_CUT
	.short MOVE_FLY
	.short MOVE_SURF
	.short MOVE_STRENGTH
	.short MOVE_ROCK_SMASH
	.short MOVE_WATERFALL
	.short MOVE_ROCK_CLIMB
	.short MOVE_WHIRLPOOL
	.short MOVE_FLASH
	.short MOVE_TELEPORT
	.short MOVE_DIG
	.short MOVE_SWEET_SCENT
	.short MOVE_CHATTER
	.short MOVE_HEADBUTT
	.short MOVE_MILK_DRINK
	.short MOVE_SOFT_BOILED
_021013E4:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
_0210140C:
	.byte 0x40, 0x19, 0x00, 0x00
	.byte 0x07, 0x02, 0x07, 0x01, 0xC0, 0x21, 0x00, 0x00, 0x07, 0x03, 0x00, 0x02, 0x40, 0x49, 0x00, 0x00
	.byte 0x00, 0x04, 0x01, 0x03, 0xC0, 0x51, 0x00, 0x00, 0x01, 0x05, 0x02, 0x04, 0x40, 0x79, 0x00, 0x00
	.byte 0x02, 0x07, 0x03, 0x05, 0xC0, 0x81, 0x00, 0x00, 0x03, 0x07, 0x04, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0xA8, 0x00, 0x00, 0x05, 0x01, 0x05, 0x00
_0210144C:
	.byte 0x40, 0x19, 0x00, 0x00
	.byte 0x04, 0x02, 0x01, 0x01, 0xC0, 0x19, 0x00, 0x00, 0x07, 0x03, 0x00, 0x00, 0x40, 0x49, 0x00, 0x00
	.byte 0x00, 0x04, 0x03, 0x03, 0xC0, 0x49, 0x00, 0x00, 0x01, 0x05, 0x02, 0x02, 0x40, 0x79, 0x00, 0x00
	.byte 0x02, 0x00, 0x05, 0x05, 0xC0, 0x79, 0x00, 0x00, 0x03, 0x07, 0x04, 0x04, 0xE0, 0xA8, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0xA8, 0x00, 0x00, 0x05, 0x01, 0xFF, 0xFF
_0210148C:
	.byte 0x40, 0x19, 0x00, 0x00
	.byte 0x07, 0x02, 0x07, 0x01, 0xC0, 0x21, 0x00, 0x00, 0x07, 0x03, 0x00, 0x02, 0x40, 0x49, 0x00, 0x00
	.byte 0x00, 0x04, 0x01, 0x03, 0xC0, 0x51, 0x00, 0x00, 0x01, 0x05, 0x02, 0x04, 0x40, 0x79, 0x00, 0x00
	.byte 0x02, 0x06, 0x03, 0x05, 0xC0, 0x81, 0x00, 0x00, 0x03, 0x06, 0x04, 0x06, 0xE0, 0xA8, 0x00, 0x00
	.byte 0x05, 0x07, 0x05, 0x07, 0xE0, 0xB8, 0x00, 0x00, 0x06, 0x01, 0x06, 0x00
_021014CC:
	.byte 0x40, 0x19, 0x00, 0x00, 0x05, 0x02, 0x05, 0x01
	.byte 0xC0, 0x21, 0x00, 0x00, 0x05, 0x03, 0x00, 0x02
	.byte 0x40, 0x49, 0x00, 0x00, 0x00, 0x04, 0x01, 0x03
	.byte 0xC0, 0x51, 0x00, 0x00, 0x01, 0x05, 0x02, 0x04
	.byte 0x40, 0x79, 0x00, 0x00, 0x02, 0x00, 0x03, 0x05
	.byte 0xC0, 0x81, 0x00, 0x00, 0x03, 0x00, 0x04, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0210150C:
	.short 0x0000, 0x0000, 0x001E, 0x0010
	.short 0x0010, 0x000E, 0x0010, 0x0001
	.short 0x009E, 0x0018, 0x0090, 0x0016
	.short 0x0000, 0x0006, 0x001E, 0x0040
	.short 0x0010, 0x003E, 0x0010, 0x0007
	.short 0x009E, 0x0048, 0x0090, 0x0046
	.short 0x0000, 0x000C, 0x001E, 0x0070
	.short 0x0010, 0x006E, 0x0010, 0x000D
	.short 0x009E, 0x0078, 0x0090, 0x0076
_02101554:
	.short 0x0000, 0x0000, 0x001E, 0x0010
	.short 0x0010, 0x000E, 0x0010, 0x0000
	.short 0x009E, 0x0010, 0x0090, 0x000E
	.short 0x0000, 0x0006, 0x001E, 0x0040
	.short 0x0010, 0x003E, 0x0010, 0x0006
	.short 0x009E, 0x0040, 0x0090, 0x003E
	.short 0x0000, 0x000C, 0x001E, 0x0070
	.short 0x0010, 0x006E, 0x0010, 0x000C
	.short 0x009E, 0x0070, 0x0090, 0x006E

	.public _0210159C
_0210159C:
	.word sub_02078E30, sub_02079034, sub_020795E0, 0xFFFFFFFF

	.data

_02110104:
	.byte 0x00, 0x30, 0x00, 0x80, 0x08, 0x38, 0x80, 0x00, 0x30, 0x60, 0x00, 0x80
	.byte 0x38, 0x68, 0x80, 0x00, 0x60, 0x90, 0x00, 0x80, 0x68, 0x98, 0x80, 0x00, 0xB0, 0xC0, 0xC8, 0x00
	.byte 0xA0, 0xB0, 0xC8, 0x00, 0xFF, 0x00, 0x00, 0x00
_02110128:
	.byte 0x00, 0x30, 0x00, 0x80, 0x08, 0x38, 0x80, 0x00
	.byte 0x30, 0x60, 0x00, 0x80, 0x38, 0x68, 0x80, 0x00, 0x60, 0x90, 0x00, 0x80, 0x68, 0x98, 0x80, 0x00
	.byte 0x98, 0xC0, 0xC8, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x80, 0x00, 0x30, 0x80, 0x00
	.byte 0x30, 0x60, 0x00, 0x80, 0x30, 0x60, 0x80, 0x00, 0x60, 0x90, 0x00, 0x80, 0x60, 0x90, 0x80, 0x00
	.byte 0x98, 0xC0, 0xC8, 0x00, 0xFF, 0x00, 0x00, 0x00
