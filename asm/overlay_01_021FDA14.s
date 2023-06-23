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
	.include "overlay_01_021FDA14.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021FDA14
ov01_021FDA14: ; 0x021FDA14
	push {r3, r4, r5, lr}
	mov r2, #0
	mov r1, #4
	add r3, r2, #0
	add r5, r0, #0
	bl ov01_021F1430
	add r4, r0, #0
	str r5, [r4]
	bl ov01_021FDA40
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FDA14

	thumb_func_start ov01_021FDA30
ov01_021FDA30: ; 0x021FDA30
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021FDA5C
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_021FDA30

	thumb_func_start ov01_021FDA40
ov01_021FDA40: ; 0x021FDA40
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #2
	mov r2, #0x23
	bl ov01_021F18D4
	ldr r0, [r4]
	mov r1, #0xd
	mov r2, #0x69
	bl ov01_021F18D4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FDA40

	thumb_func_start ov01_021FDA5C
ov01_021FDA5C: ; 0x021FDA5C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #2
	bl ov01_021F18FC
	ldr r0, [r4]
	mov r1, #0xd
	bl ov01_021F18FC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FDA5C

	thumb_func_start ov01_021FDA74
ov01_021FDA74: ; 0x021FDA74
	push {r4, r5, lr}
	sub sp, #0x24
	add r5, r0, #0
	add r4, r1, #0
	bl MapObject_GetFieldSysPtr
	str r0, [sp, #8]
	add r0, r5, #0
	bl ov01_021F146C
	mov r1, #1
	str r0, [sp, #0xc]
	bl ov01_021F1450
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r1, sp, #0x18
	str r5, [sp, #0x14]
	bl MapObject_GetPositionVec
	add r0, r5, #0
	mov r1, #2
	bl sub_0205F09C
	add r1, sp, #8
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r1, _021FDABC ; =ov01_02208F88
	add r2, sp, #0x18
	add r3, r4, #0
	bl ov01_021F1620
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_021FDABC: .word ov01_02208F88
	thumb_func_end ov01_021FDA74

	thumb_func_start ov01_021FDAC0
ov01_021FDAC0: ; 0x021FDAC0
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	bl sub_02068D98
	add r2, r4, #0
	add r3, r0, #0
	add r2, #0x14
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r5, #0
	bl sub_02068D90
	str r0, [r4, #0x10]
	ldr r0, [r4, #0x20]
	bl MapObject_GetID
	str r0, [r4]
	ldr r0, [r4, #0x20]
	bl sub_0205F254
	str r0, [r4, #4]
	ldr r0, [r4, #0x20]
	bl MapObject_GetGfxID
	str r0, [r4, #8]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	str r0, [r4, #0x30]
	mov r0, #0x40
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x10]
	cmp r0, #2
	bne _021FDB12
	mov r0, #0
	str r0, [r4, #0x34]
_021FDB12:
	ldr r1, [r4, #0x20]
	add r0, r4, #0
	add r2, sp, #0
	bl ov01_021FDC7C
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DA8
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FDD48
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FDAC0

	thumb_func_start ov01_021FDB34
ov01_021FDB34: ; 0x021FDB34
	push {r3, lr}
	ldr r0, [r1, #0xc]
	cmp r0, #1
	bne _021FDB42
	ldr r0, [r1, #0x24]
	bl sub_02023DA4
_021FDB42:
	pop {r3, pc}
	thumb_func_end ov01_021FDB34

	thumb_func_start ov01_021FDB44
ov01_021FDB44: ; 0x021FDB44
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r6, [r4, #0x20]
	add r5, r0, #0
	add r0, r6, #0
	bl MapObject_GetGfxID
	ldr r1, [r4, #8]
	cmp r1, r0
	bne _021FDB72
	ldr r1, [r4]
	ldr r2, [r4, #4]
	add r0, r6, #0
	bl sub_0205F0A8
	cmp r0, #0
	beq _021FDB72
	add r0, r6, #0
	bl MapObject_CheckFlag24
	cmp r0, #0
	bne _021FDB7C
_021FDB72:
	add r0, r5, #0
	bl ov01_021F1640
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_021FDB7C:
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x34]
	add r1, r1, r0
	mov r0, #0x12
	lsl r0, r0, #8
	str r1, [r4, #0x28]
	cmp r1, r0
	blt _021FDB96
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x34]
	neg r0, r0
	str r0, [r4, #0x34]
	b _021FDBA6
_021FDB96:
	mov r0, #0xe
	lsl r0, r0, #8
	cmp r1, r0
	bgt _021FDBA6
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x34]
	neg r0, r0
	str r0, [r4, #0x34]
_021FDBA6:
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #0
	bl ov01_021FDC7C
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DA8
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _021FDBC6
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FDD48
_021FDBC6:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FDB44

	thumb_func_start ov01_021FDBCC
ov01_021FDBCC: ; 0x021FDBCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	ldr r6, [r5, #0x20]
	add r7, r0, #0
	add r0, r6, #0
	mov r4, #0
	bl MapObject_GetGfxID
	ldr r1, [r5, #8]
	cmp r1, r0
	bne _021FDBFC
	ldr r1, [r5]
	ldr r2, [r5, #4]
	add r0, r6, #0
	bl sub_0205F0A8
	cmp r0, #0
	beq _021FDBFC
	add r0, r6, #0
	bl MapObject_CheckFlag24
	cmp r0, #0
	bne _021FDC06
_021FDBFC:
	add r0, r7, #0
	bl ov01_021F1640
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021FDC06:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _021FDC78
	ldr r0, [r5, #0x20]
	add r1, sp, #0xc
	bl MapObject_GetFacingVec
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _021FDC1C
	mov r4, #1
_021FDC1C:
	add r0, r6, #0
	bl MapObject_CheckVisible
	cmp r0, #1
	bne _021FDC28
	mov r4, #1
_021FDC28:
	cmp r4, #0
	ldr r0, [r5, #0x24]
	beq _021FDC36
	mov r1, #0
	bl sub_02023EA4
	b _021FDC3C
_021FDC36:
	mov r1, #1
	bl sub_02023EA4
_021FDC3C:
	add r0, r7, #0
	add r1, sp, #0
	bl sub_02068DB8
	ldr r0, [r5, #0x24]
	add r1, sp, #0
	bl sub_02023E50
	add r1, r5, #0
	ldr r0, [r5, #0x24]
	add r1, #0x28
	bl sub_02023E78
	ldr r0, [r5, #0x20]
	bl ov01_021F72DC
	add r4, r0, #0
	bl sub_02023EF4
	add r1, r0, #0
	ldr r0, [r5, #0x24]
	bl sub_02023EE0
	add r0, r4, #0
	bl sub_02023F30
	add r1, r0, #0
	ldr r0, [r5, #0x24]
	bl sub_02023F1C
_021FDC78:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021FDBCC

	thumb_func_start ov01_021FDC7C
ov01_021FDC7C: ; 0x021FDC7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	ldr r3, _021FDD44 ; =ov01_02208FC8
	add r4, r2, #0
	add r2, sp, #8
	add r5, r0, #0
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r6, #0
	add r1, sp, #0x20
	bl MapObject_GetFacingVec
	ldr r0, [sp, #0x20]
	str r0, [sp, #4]
	add r0, r6, #0
	bl MapObject_GetID
	cmp r0, #0xff
	bne _021FDCD2
	add r0, r6, #0
	bl MapObject_GetGfxID
	cmp r0, #0xbc
	bne _021FDCD2
	add r0, r6, #0
	bl MapObject_GetFacingDirection
	mov r1, #2
	lsl r1, r1, #0xa
	cmp r0, #1
	bne _021FDCCE
	lsl r0, r1, #1
	add r1, r1, r0
	ldr r0, [sp, #0x28]
	sub r7, r1, r0
	b _021FDCD4
_021FDCCE:
	ldr r7, [sp, #0x28]
	b _021FDCD4
_021FDCD2:
	ldr r7, [sp, #0x28]
_021FDCD4:
	ldr r0, [sp, #0x24]
	mov r1, #6
	bl _s32_div_f
	neg r0, r0
	str r0, [sp]
	add r0, r6, #0
	bl MapObject_GetID
	cmp r0, #0xfd
	bne _021FDCFE
	ldr r0, [r5, #0x14]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
	bl MapObject_GetGfxID
	cmp r0, #0xbc
	bne _021FDCFE
	mov r0, #0
	str r0, [sp]
_021FDCFE:
	add r0, r6, #0
	add r1, r4, #0
	bl MapObject_GetPositionVec
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl sub_0206121C
	ldr r2, [r4]
	ldr r1, [sp, #4]
	add r1, r2, r1
	str r1, [r4]
	mov r1, #7
	lsl r1, r1, #0xc
	ldr r2, [r4, #8]
	sub r1, r7, r1
	add r1, r2, r1
	str r1, [r4, #8]
	cmp r0, #0
	bne _021FDD2A
	mov r0, #0
	b _021FDD36
_021FDD2A:
	ldr r0, [r5, #0x10]
	ldr r2, [r4, #4]
	lsl r1, r0, #2
	add r0, sp, #8
	ldr r0, [r0, r1]
	sub r0, r2, r0
_021FDD36:
	str r0, [r4, #4]
	ldr r1, [r4, #4]
	ldr r0, [sp]
	add r0, r1, r0
	str r0, [r4, #4]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FDD44: .word ov01_02208FC8
	thumb_func_end ov01_021FDC7C

	thumb_func_start ov01_021FDD48
ov01_021FDD48: ; 0x021FDD48
	push {r4, r5, lr}
	sub sp, #0x34
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x20]
	bl MapObject_GetManager
	ldr r1, [r4, #8]
	add r2, sp, #0
	bl ov01_021F9744
	cmp r0, #0
	beq _021FDD8E
	ldr r0, [r4, #0x20]
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021FDD8E
	ldr r0, [r4, #0x18]
	mov r1, #2
	bl ov01_021F18F0
	str r0, [sp]
	add r0, r5, #0
	add r1, sp, #0x28
	bl sub_02068DB8
	ldr r0, [r4, #0x18]
	add r1, sp, #0
	add r2, sp, #0x28
	bl ov01_021F16EC
	str r0, [r4, #0x24]
	mov r0, #1
	str r0, [r4, #0xc]
_021FDD8E:
	add sp, #0x34
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FDD48

	thumb_func_start ov01_021FDD94
ov01_021FDD94: ; 0x021FDD94
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	add r4, r1, #0
	add r6, r4, #0
	add r5, r0, #0
	add r6, #0x10
	add r3, sp, #0
	mov r2, #5
_021FDDA4:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021FDDA4
	ldr r0, [r4, #8]
	mov r1, #2
	bl ov01_021F18F0
	str r0, [sp]
	add r0, r5, #0
	add r1, sp, #0x28
	bl sub_02068DB8
	ldr r0, [r4, #8]
	add r1, sp, #0
	add r2, sp, #0x28
	bl ov01_021F16EC
	str r0, [r4, #0x3c]
	ldr r5, [r4, #0x38]
	add r0, r5, #0
	bl sub_02023EF4
	add r1, r0, #0
	ldr r0, [r4, #0x3c]
	bl sub_02023EE0
	add r0, r5, #0
	bl sub_02023F70
	add r1, r0, #0
	ldr r0, [r4, #0x3c]
	bl sub_02023F40
	add r0, r5, #0
	bl sub_02023F30
	add r1, r0, #0
	ldr r0, [r4, #0x3c]
	bl sub_02023F1C
	ldr r0, [r4, #0x3c]
	mov r1, #0
	bl sub_02023F04
	ldr r0, [r4, #0x3c]
	bl sub_02023FC0
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov01_021FDD94

	thumb_func_start ov01_021FDE08
ov01_021FDE08: ; 0x021FDE08
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r3, _021FDE60 ; =ov01_02208FB0
	add r5, r0, #0
	add r4, r1, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	add r3, r5, #0
	stmia r2!, {r0, r1}
	add r3, #0x50
	ldmia r3!, {r0, r1}
	add r2, r4, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r4, #0
	str r0, [r2]
	ldr r0, [r5, #4]
	bl sub_0206121C
	mov r1, #7
	ldr r2, [r4, #8]
	lsl r1, r1, #0xc
	sub r1, r2, r1
	str r1, [r4, #8]
	cmp r0, #0
	bne _021FDE4C
	mov r0, #0
	add sp, #0x18
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_021FDE4C:
	ldr r0, [r5]
	ldr r2, [r4, #4]
	lsl r1, r0, #2
	add r0, sp, #0
	ldr r0, [r0, r1]
	sub r0, r2, r0
	str r0, [r4, #4]
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_021FDE60: .word ov01_02208FB0
	thumb_func_end ov01_021FDE08

	thumb_func_start ov01_021FDE64
ov01_021FDE64: ; 0x021FDE64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov01_021F1468
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #1
	str r5, [sp, #0xc]
	bl ov01_021F1450
	str r0, [sp, #0x10]
	add r3, sp, #0x14
	mov r2, #5
_021FDE86:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021FDE86
	str r6, [sp, #0x3c]
	add r0, sp, #8
	str r0, [sp]
	ldr r0, [sp, #0x5c]
	ldr r1, _021FDEA8 ; =ov01_02208F9C
	str r0, [sp, #4]
	ldr r3, [sp, #0x58]
	add r0, r5, #0
	add r2, r7, #0
	bl ov01_021F1620
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FDEA8: .word ov01_02208F9C
	thumb_func_end ov01_021FDE64

	thumb_func_start ov01_021FDEAC
ov01_021FDEAC: ; 0x021FDEAC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	add r6, r0, #0
	add r3, r4, #4
	mov r2, #7
_021FDEBE:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021FDEBE
	add r0, r5, #0
	bl sub_02068D90
	str r0, [r4]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r4, #0x40]
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	mov r0, #0x40
	str r0, [r4, #0x4c]
	ldr r0, [r4]
	cmp r0, #2
	bne _021FDEE6
	mov r0, #0
	str r0, [r4, #0x4c]
_021FDEE6:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x50
	bl sub_02068DB8
	add r0, r4, #0
	add r1, sp, #0
	bl ov01_021FDE08
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DA8
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FDD94
	add r0, r5, #0
	bl sub_02068D18
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov01_021FDEAC

	thumb_func_start ov01_021FDF14
ov01_021FDF14: ; 0x021FDF14
	ldr r3, _021FDF1C ; =sub_02023DA4
	ldr r0, [r1, #0x3c]
	bx r3
	nop
_021FDF1C: .word sub_02023DA4
	thumb_func_end ov01_021FDF14

	thumb_func_start ov01_021FDF20
ov01_021FDF20: ; 0x021FDF20
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r2, [r1, #0x40]
	ldr r0, [r1, #0x4c]
	add r2, r2, r0
	mov r0, #0x12
	lsl r0, r0, #8
	str r2, [r1, #0x40]
	cmp r2, r0
	blt _021FDF40
	str r0, [r1, #0x40]
	ldr r0, [r1, #0x4c]
	neg r0, r0
	str r0, [r1, #0x4c]
	b _021FDF50
_021FDF40:
	mov r0, #0xe
	lsl r0, r0, #8
	cmp r2, r0
	bgt _021FDF50
	str r0, [r1, #0x40]
	ldr r0, [r1, #0x4c]
	neg r0, r0
	str r0, [r1, #0x4c]
_021FDF50:
	add r0, r1, #0
	add r1, sp, #0
	bl ov01_021FDE08
	add r0, r4, #0
	add r1, sp, #0
	bl sub_02068DA8
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov01_021FDF20

	thumb_func_start ov01_021FDF64
ov01_021FDF64: ; 0x021FDF64
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r1, sp, #0
	bl sub_02068DB8
	ldr r0, [r4, #0x3c]
	add r1, sp, #0
	bl sub_02023E50
	ldr r0, [r4, #0x3c]
	add r4, #0x40
	add r1, r4, #0
	bl sub_02023E78
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FDF64

	thumb_func_start ov01_021FDF88
ov01_021FDF88: ; 0x021FDF88
	push {r4, r5, lr}
	sub sp, #0x24
	add r5, r0, #0
	add r4, r1, #0
	bl MapObject_GetFieldSysPtr
	str r0, [sp, #8]
	add r0, r5, #0
	bl ov01_021F146C
	mov r1, #1
	str r0, [sp, #0xc]
	bl ov01_021F1450
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r1, sp, #0x18
	str r5, [sp, #0x14]
	bl MapObject_GetPositionVec
	add r0, r5, #0
	mov r1, #2
	bl sub_0205F09C
	add r1, sp, #8
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r1, _021FDFD0 ; =ov01_02208F74
	add r2, sp, #0x18
	add r3, r4, #0
	bl ov01_021F1620
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_021FDFD0: .word ov01_02208F74
	thumb_func_end ov01_021FDF88

	thumb_func_start ov01_021FDFD4
ov01_021FDFD4: ; 0x021FDFD4
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	bl sub_02068D98
	add r2, r4, #0
	add r3, r0, #0
	add r2, #0x14
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r5, #0
	bl sub_02068D90
	str r0, [r4, #0x10]
	ldr r0, [r4, #0x20]
	bl MapObject_GetID
	str r0, [r4]
	ldr r0, [r4, #0x20]
	bl sub_0205F254
	str r0, [r4, #4]
	ldr r0, [r4, #0x20]
	bl MapObject_GetGfxID
	str r0, [r4, #8]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	str r0, [r4, #0x30]
	mov r0, #0x40
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x10]
	cmp r0, #2
	beq _021FE026
	cmp r0, #5
	bne _021FE02A
_021FE026:
	mov r0, #0
	str r0, [r4, #0x34]
_021FE02A:
	ldr r1, [r4, #0x20]
	add r0, r4, #0
	add r2, sp, #0
	bl ov01_021FDC7C
	ldr r1, [sp, #4]
	ldr r0, _021FE054 ; =0x00000514
	sub r0, r1, r0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DA8
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FE190
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021FE054: .word 0x00000514
	thumb_func_end ov01_021FDFD4

	thumb_func_start ov01_021FE058
ov01_021FE058: ; 0x021FE058
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r6, [r4, #0x20]
	add r5, r0, #0
	add r0, r6, #0
	bl MapObject_GetGfxID
	ldr r1, [r4, #8]
	cmp r1, r0
	bne _021FE086
	ldr r1, [r4]
	ldr r2, [r4, #4]
	add r0, r6, #0
	bl sub_0205F0A8
	cmp r0, #0
	beq _021FE086
	add r0, r6, #0
	bl MapObject_CheckFlag24
	cmp r0, #0
	bne _021FE090
_021FE086:
	add r0, r5, #0
	bl ov01_021F1640
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_021FE090:
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x34]
	add r1, r1, r0
	mov r0, #0x12
	lsl r0, r0, #8
	str r1, [r4, #0x28]
	cmp r1, r0
	blt _021FE0AA
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x34]
	neg r0, r0
	str r0, [r4, #0x34]
	b _021FE0BA
_021FE0AA:
	mov r0, #0xe
	lsl r0, r0, #8
	cmp r1, r0
	bgt _021FE0BA
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x34]
	neg r0, r0
	str r0, [r4, #0x34]
_021FE0BA:
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #0
	bl ov01_021FDC7C
	ldr r1, [sp, #4]
	ldr r0, _021FE0E8 ; =0x00000514
	sub r0, r1, r0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DA8
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _021FE0E2
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021FE190
_021FE0E2:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021FE0E8: .word 0x00000514
	thumb_func_end ov01_021FE058

	thumb_func_start ov01_021FE0EC
ov01_021FE0EC: ; 0x021FE0EC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r4, [r5, #0x20]
	add r6, r0, #0
	add r0, r4, #0
	bl MapObject_GetGfxID
	ldr r1, [r5, #8]
	cmp r1, r0
	bne _021FE11A
	ldr r1, [r5]
	ldr r2, [r5, #4]
	add r0, r4, #0
	bl sub_0205F0A8
	cmp r0, #0
	beq _021FE11A
	add r0, r4, #0
	bl MapObject_CheckFlag24
	cmp r0, #0
	bne _021FE124
_021FE11A:
	add r0, r6, #0
	bl ov01_021F1640
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_021FE124:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _021FE18A
	add r0, r4, #0
	bl MapObject_CheckVisible
	cmp r0, #1
	ldr r0, [r5, #0x24]
	bne _021FE13E
	mov r1, #0
	bl sub_02023EA4
	b _021FE144
_021FE13E:
	mov r1, #1
	bl sub_02023EA4
_021FE144:
	add r0, r6, #0
	add r1, sp, #0
	bl sub_02068DB8
	mov r0, #1
	ldr r1, [sp, #8]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #8]
	ldr r0, [r5, #0x24]
	add r1, sp, #0
	bl sub_02023E50
	add r1, r5, #0
	ldr r0, [r5, #0x24]
	add r1, #0x28
	bl sub_02023E78
	ldr r0, [r5, #0x20]
	bl ov01_021F72DC
	add r4, r0, #0
	bl sub_02023EF4
	add r1, r0, #0
	ldr r0, [r5, #0x24]
	bl sub_02023EE0
	add r0, r4, #0
	bl sub_02023F30
	add r1, r0, #0
	ldr r0, [r5, #0x24]
	bl sub_02023F1C
_021FE18A:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FE0EC

	thumb_func_start ov01_021FE190
ov01_021FE190: ; 0x021FE190
	push {r4, r5, lr}
	sub sp, #0x34
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x20]
	bl MapObject_GetManager
	ldr r1, [r4, #8]
	add r2, sp, #0
	bl ov01_021F9744
	cmp r0, #0
	beq _021FE1FA
	ldr r0, [r4, #0x20]
	bl ov01_021FA2D4
	cmp r0, #1
	beq _021FE1FA
	ldr r0, [r4, #0x10]
	cmp r0, #2
	ldr r0, [r4, #0x18]
	bhi _021FE1C4
	mov r1, #2
	bl ov01_021F18F0
	b _021FE1CA
_021FE1C4:
	mov r1, #0xd
	bl ov01_021F18F0
_021FE1CA:
	str r0, [sp]
	ldr r0, [r4, #0x20]
	bl ov01_0220553C
	cmp r0, #0
	beq _021FE1E2
	ldr r1, [r4, #0x20]
	ldr r2, [r4, #0x24]
	mov r0, #1
	add r3, sp, #0
	bl ov01_02205870
_021FE1E2:
	add r0, r5, #0
	add r1, sp, #0x28
	bl sub_02068DB8
	ldr r0, [r4, #0x18]
	add r1, sp, #0
	add r2, sp, #0x28
	bl ov01_021F16EC
	str r0, [r4, #0x24]
	mov r0, #1
	str r0, [r4, #0xc]
_021FE1FA:
	add sp, #0x34
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FE190

	.rodata

ov01_02208F74: ; 0x02208F74
	.word 0x00000038
	.word ov01_021FDFD4
	.word ov01_021FDB34
	.word ov01_021FE058
	.word ov01_021FE0EC

ov01_02208F88: ; 0x02208F88
	.word 0x00000038
	.word ov01_021FDAC0
	.word ov01_021FDB34
	.word ov01_021FDB44
	.word ov01_021FDBCC

ov01_02208F9C: ; 0x02208F9C
	.word 0x00000038
	.word ov01_021FDEAC
	.word ov01_021FDF14
	.word ov01_021FDF20
	.word ov01_021FDF64

ov01_02208FB0: ; 0x02208FB0
	.byte 0x00, 0xE0, 0x00, 0x00, 0x00, 0x40, 0x01, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00
	.byte 0x00, 0x40, 0x01, 0x00, 0x00, 0xE0, 0x00, 0x00

ov01_02208FC8: ; 0x02208FC8
	.byte 0x00, 0xE0, 0x00, 0x00, 0x00, 0x40, 0x01, 0x00
	.byte 0x00, 0xE0, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 0x40, 0x01, 0x00, 0x00, 0xE0, 0x00, 0x00
