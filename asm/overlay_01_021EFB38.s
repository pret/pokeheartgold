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

	thumb_func_start ov01_021EFB38
ov01_021EFB38: ; 0x021EFB38
	push {r3, lr}
	ldr r2, _021EFB5C ; =ov01_02209B64
	ldr r2, [r2, #4]
	lsl r3, r2, #2
	ldr r2, _021EFB60 ; =ov01_022068C4
	ldr r2, [r2, r3]
	blx r2
	ldr r0, _021EFB5C ; =ov01_02209B64
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	bl OS_GetTick
	mov r0, #0
	add r1, r0, #0
	bl OS_SetTick
	pop {r3, pc}
	.balign 4, 0
_021EFB5C: .word ov01_02209B64
_021EFB60: .word ov01_022068C4
	thumb_func_end ov01_021EFB38

	thumb_func_start ov01_021EFB64
ov01_021EFB64: ; 0x021EFB64
	push {r3, lr}
	cmp r0, #0xc
	blt _021EFB78
	cmp r0, #0x21
	bgt _021EFB78
	ldr r0, _021EFBE8 ; =FS_OVERLAY_ID(OVY_115)
	mov r1, #2
	bl HandleLoadOverlay
	pop {r3, pc}
_021EFB78:
	add r1, r0, #0
	sub r1, #0x22
	cmp r1, #2
	bhi _021EFB8A
	ldr r0, _021EFBEC ; =FS_OVERLAY_ID(OVY_116)
	mov r1, #2
	bl HandleLoadOverlay
	pop {r3, pc}
_021EFB8A:
	cmp r0, #0x27
	blt _021EFB9C
	cmp r0, #0x2c
	bgt _021EFB9C
	ldr r0, _021EFBF0 ; =FS_OVERLAY_ID(OVY_117)
	mov r1, #2
	bl HandleLoadOverlay
	pop {r3, pc}
_021EFB9C:
	cmp r0, #0x2d
	bne _021EFBAA
	ldr r0, _021EFBF4 ; =FS_OVERLAY_ID(OVY_118)
	mov r1, #2
	bl HandleLoadOverlay
	pop {r3, pc}
_021EFBAA:
	cmp r0, #0
	blt _021EFBBC
	cmp r0, #5
	bgt _021EFBBC
	ldr r0, _021EFBF8 ; =FS_OVERLAY_ID(OVY_120)
	mov r1, #2
	bl HandleLoadOverlay
	pop {r3, pc}
_021EFBBC:
	cmp r0, #6
	blt _021EFBCE
	cmp r0, #0xb
	bgt _021EFBCE
	ldr r0, _021EFBFC ; =FS_OVERLAY_ID(OVY_119)
	mov r1, #2
	bl HandleLoadOverlay
	pop {r3, pc}
_021EFBCE:
	cmp r0, #0x2e
	bne _021EFBDC
	ldr r0, _021EFBF8 ; =FS_OVERLAY_ID(OVY_120)
	mov r1, #2
	bl HandleLoadOverlay
	pop {r3, pc}
_021EFBDC:
	ldr r0, _021EFC00 ; =FS_OVERLAY_ID(OVY_114)
	mov r1, #2
	bl HandleLoadOverlay
	pop {r3, pc}
	nop
_021EFBE8: .word FS_OVERLAY_ID(OVY_115)
_021EFBEC: .word FS_OVERLAY_ID(OVY_116)
_021EFBF0: .word FS_OVERLAY_ID(OVY_117)
_021EFBF4: .word FS_OVERLAY_ID(OVY_118)
_021EFBF8: .word FS_OVERLAY_ID(OVY_120)
_021EFBFC: .word FS_OVERLAY_ID(OVY_119)
_021EFC00: .word FS_OVERLAY_ID(OVY_114)
	thumb_func_end ov01_021EFB64

	thumb_func_start ov01_021EFC04
ov01_021EFC04: ; 0x021EFC04
	push {r3, lr}
	cmp r0, #0xc
	blt _021EFC16
	cmp r0, #0x21
	bgt _021EFC16
	ldr r0, _021EFC78 ; =FS_OVERLAY_ID(OVY_115)
	bl UnloadOverlayByID
	pop {r3, pc}
_021EFC16:
	add r1, r0, #0
	sub r1, #0x22
	cmp r1, #2
	bhi _021EFC26
	ldr r0, _021EFC7C ; =FS_OVERLAY_ID(OVY_116)
	bl UnloadOverlayByID
	pop {r3, pc}
_021EFC26:
	cmp r0, #0x27
	blt _021EFC36
	cmp r0, #0x2c
	bgt _021EFC36
	ldr r0, _021EFC80 ; =FS_OVERLAY_ID(OVY_117)
	bl UnloadOverlayByID
	pop {r3, pc}
_021EFC36:
	cmp r0, #0x2d
	bne _021EFC42
	ldr r0, _021EFC84 ; =FS_OVERLAY_ID(OVY_118)
	bl UnloadOverlayByID
	pop {r3, pc}
_021EFC42:
	cmp r0, #0
	blt _021EFC52
	cmp r0, #5
	bgt _021EFC52
	ldr r0, _021EFC88 ; =FS_OVERLAY_ID(OVY_120)
	bl UnloadOverlayByID
	pop {r3, pc}
_021EFC52:
	cmp r0, #6
	blt _021EFC62
	cmp r0, #0xb
	bgt _021EFC62
	ldr r0, _021EFC8C ; =FS_OVERLAY_ID(OVY_119)
	bl UnloadOverlayByID
	pop {r3, pc}
_021EFC62:
	cmp r0, #0x2e
	bne _021EFC6E
	ldr r0, _021EFC88 ; =FS_OVERLAY_ID(OVY_120)
	bl UnloadOverlayByID
	pop {r3, pc}
_021EFC6E:
	ldr r0, _021EFC90 ; =FS_OVERLAY_ID(OVY_114)
	bl UnloadOverlayByID
	pop {r3, pc}
	nop
_021EFC78: .word FS_OVERLAY_ID(OVY_115)
_021EFC7C: .word FS_OVERLAY_ID(OVY_116)
_021EFC80: .word FS_OVERLAY_ID(OVY_117)
_021EFC84: .word FS_OVERLAY_ID(OVY_118)
_021EFC88: .word FS_OVERLAY_ID(OVY_120)
_021EFC8C: .word FS_OVERLAY_ID(OVY_119)
_021EFC90: .word FS_OVERLAY_ID(OVY_114)
	thumb_func_end ov01_021EFC04

	thumb_func_start ov01_021EFC94
ov01_021EFC94: ; 0x021EFC94
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, _021EFCD4 ; =ov01_02209B64
	add r6, r2, #0
	str r0, [r1, #4]
	mov r0, #0
	str r0, [r1, #8]
	ldr r0, _021EFCD8 ; =ov01_021EFB38
	mov r1, #0x24
	mov r2, #5
	mov r3, #4
	bl sub_02007200
	bl sub_0201F988
	add r4, r0, #0
	str r5, [r4, #0x10]
	str r6, [r4, #0x14]
	mov r0, #0x6d
	mov r1, #4
	bl NARC_ctor
	str r0, [r4, #0x20]
	ldr r1, [r4, #0x14]
	cmp r1, #0
	beq _021EFCCC
	mov r0, #0
	str r0, [r1]
_021EFCCC:
	mov r0, #0
	str r0, [r4, #0x18]
	pop {r4, r5, r6, pc}
	nop
_021EFCD4: .word ov01_02209B64
_021EFCD8: .word ov01_021EFB38
	thumb_func_end ov01_021EFC94

	thumb_func_start ov01_021EFCDC
ov01_021EFCDC: ; 0x021EFCDC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r4, r1, #0
	bl NARC_dtor
	ldr r1, [r5, #0xc]
	mov r0, #4
	bl FreeToHeapExplicit
	add r0, r4, #0
	bl sub_02007234
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021EFCDC

	thumb_func_start ov01_021EFCF8
ov01_021EFCF8: ; 0x021EFCF8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	mov r0, #4
	mov r1, #0x4c
	str r2, [sp]
	add r5, r3, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x4c
	add r4, r0, #0
	bl memset
	ldr r0, _021EFD38 ; =ov01_021EFD3C
	add r1, r4, #0
	mov r2, #5
	bl CreateSysTask
	str r5, [r4, #0x48]
	cmp r5, #0
	beq _021EFD28
	mov r0, #0
	str r0, [r5]
_021EFD28:
	str r6, [r4, #0xc]
	ldr r0, [sp]
	str r7, [r4, #0x10]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x18]
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EFD38: .word ov01_021EFD3C
	thumb_func_end ov01_021EFCF8

	thumb_func_start ov01_021EFD3C
ov01_021EFD3C: ; 0x021EFD3C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	ldr r1, [r4]
	cmp r1, #5
	bhi _021EFE22
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021EFD54: ; jump table
	.short _021EFD60 - _021EFD54 - 2 ; case 0
	.short _021EFD98 - _021EFD54 - 2 ; case 1
	.short _021EFDB2 - _021EFD54 - 2 ; case 2
	.short _021EFDC6 - _021EFD54 - 2 ; case 3
	.short _021EFDE0 - _021EFD54 - 2 ; case 4
	.short _021EFE04 - _021EFD54 - 2 ; case 5
_021EFD60:
	ldr r0, [r4, #0xc]
	cmp r0, #1
	bne _021EFD7A
	mov r0, #8
	str r0, [sp]
	add r0, r4, #0
	ldr r2, [r4, #0x14]
	add r0, #0x30
	mov r1, #0
	mov r3, #2
	bl ov01_021EFFB0
	b _021EFD90
_021EFD7A:
	cmp r0, #2
	bne _021EFD90
	mov r0, #8
	str r0, [sp]
	add r0, r4, #0
	ldr r2, [r4, #0x14]
	add r0, #0x30
	mov r1, #0
	mov r3, #1
	bl ov01_021EFFB0
_021EFD90:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021EFE22
_021EFD98:
	mov r0, #3
	str r0, [sp]
	add r0, r4, #0
	ldr r2, [r4, #0x10]
	ldr r3, [r4, #0xc]
	add r0, #0x18
	mov r1, #0
	bl ov01_021EFFB0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021EFE22
_021EFDB2:
	add r0, r4, #0
	add r0, #0x18
	bl ov01_021EFFBC
	cmp r0, #0
	beq _021EFE22
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021EFE22
_021EFDC6:
	mov r0, #3
	str r0, [sp]
	add r0, r4, #0
	ldr r1, [r4, #0x10]
	ldr r3, [r4, #0xc]
	add r0, #0x18
	mov r2, #0
	bl ov01_021EFFB0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021EFE22
_021EFDE0:
	add r0, r4, #0
	add r0, #0x18
	bl ov01_021EFFBC
	cmp r0, #0
	beq _021EFE22
	ldr r0, [r4, #8]
	add r1, r0, #1
	str r1, [r4, #8]
	ldr r0, [r4, #4]
	cmp r1, r0
	bne _021EFDFE
	mov r0, #5
	str r0, [r4]
	b _021EFE22
_021EFDFE:
	mov r0, #1
	str r0, [r4]
	b _021EFE22
_021EFE04:
	mov r1, #0
	str r1, [r4]
	str r1, [r4, #8]
	ldr r2, [r4, #0x48]
	cmp r2, #0
	beq _021EFE14
	mov r1, #1
	str r1, [r2]
_021EFE14:
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	add sp, #4
	pop {r3, r4, pc}
_021EFE22:
	add r4, #0x30
	add r0, r4, #0
	bl ov01_021EFFBC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EFD3C

	thumb_func_start ov01_021EFE30
ov01_021EFE30: ; 0x021EFE30
	ldr r0, [r0, #0x18]
	bx lr
	thumb_func_end ov01_021EFE30

	thumb_func_start ov01_021EFE34
ov01_021EFE34: ; 0x021EFE34
	str r1, [r0]
	str r1, [r0, #4]
	sub r1, r2, r1
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov01_021EFE34

	thumb_func_start ov01_021EFE44
ov01_021EFE44: ; 0x021EFE44
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
	bgt _021EFE6A
	str r0, [r4, #0xc]
	mov r0, #0
	pop {r4, pc}
_021EFE6A:
	str r1, [r4, #0xc]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov01_021EFE44

	thumb_func_start ov01_021EFE70
ov01_021EFE70: ; 0x021EFE70
	str r1, [r0]
	str r1, [r0, #4]
	sub r1, r2, r1
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov01_021EFE70

	thumb_func_start ov01_021EFE80
ov01_021EFE80: ; 0x021EFE80
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #0xc]
	ldr r0, [r4, #8]
	lsl r2, r2, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	ldr r1, [r4, #0x10]
	lsl r1, r1, #0xc
	bl FX_Div
	ldr r1, [r4, #4]
	add r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r0, r0, #1
	cmp r0, r1
	bgt _021EFEC0
	str r0, [r4, #0xc]
	mov r0, #0
	pop {r4, pc}
_021EFEC0:
	str r1, [r4, #0xc]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EFE80

	thumb_func_start ov01_021EFEC8
ov01_021EFEC8: ; 0x021EFEC8
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x18]
	add r5, r0, #0
	add r7, r2, #0
	add r0, r3, #0
	add r6, r1, #0
	lsl r2, r4, #0xc
	str r3, [sp]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r2, r0, #0
	sub r0, r7, r6
	mov r7, #2
	mov r3, #0
	lsl r7, r7, #0xa
	add r2, r2, r7
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r2, r2, #0xc
	orr r2, r1
	sub r2, r0, r2
	asr r1, r2, #0x1f
	lsr r0, r2, #0x13
	lsl r1, r1, #0xd
	orr r1, r0
	lsl r0, r2, #0xd
	add r0, r0, r7
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	add r1, r4, #0
	mul r1, r4
	lsl r1, r1, #0xc
	bl FX_Div
	str r6, [r5]
	ldr r1, [sp]
	str r6, [r5, #4]
	str r1, [r5, #8]
	str r0, [r5, #0xc]
	mov r0, #0
	str r0, [r5, #0x10]
	str r4, [r5, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021EFEC8

	thumb_func_start ov01_021EFF28
ov01_021EFF28: ; 0x021EFF28
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r6, [r5, #0x10]
	ldr r0, [r5, #8]
	lsl r2, r6, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsr r4, r2, #0xc
	lsl r0, r1, #0x14
	add r2, r6, #0
	orr r4, r0
	ldr r0, [r5, #0xc]
	mul r2, r6
	lsl r2, r2, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	lsl r1, r2, #2
	bl FX_Div
	ldr r1, [r5, #4]
	add r0, r4, r0
	add r0, r1, r0
	str r0, [r5]
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	add r0, r0, #1
	cmp r0, r1
	bgt _021EFF88
	str r0, [r5, #0x10]
	mov r0, #0
	pop {r4, r5, r6, pc}
_021EFF88:
	str r1, [r5, #0x10]
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021EFF28

	thumb_func_start ov01_021EFF90
ov01_021EFF90: ; 0x021EFF90
	push {r3, lr}
	cmp r0, #1
	bne _021EFF9E
	ldr r0, _021EFFA8 ; =0x0400006C
	bl GXx_SetMasterBrightness_
	pop {r3, pc}
_021EFF9E:
	ldr r0, _021EFFAC ; =0x0400106C
	bl GXx_SetMasterBrightness_
	pop {r3, pc}
	nop
_021EFFA8: .word 0x0400006C
_021EFFAC: .word 0x0400106C
	thumb_func_end ov01_021EFF90

	thumb_func_start ov01_021EFFB0
ov01_021EFFB0: ; 0x021EFFB0
	push {r3, lr}
	str r3, [r0, #0x14]
	ldr r3, [sp, #8]
	bl ov01_021EFE34
	pop {r3, pc}
	thumb_func_end ov01_021EFFB0

	thumb_func_start ov01_021EFFBC
ov01_021EFFBC: ; 0x021EFFBC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov01_021EFE44
	add r4, r0, #0
	ldr r0, _021EFFD4 ; =ov01_021EFFD8
	add r1, r5, #0
	mov r2, #0xa
	bl sub_0200E374
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EFFD4: .word ov01_021EFFD8
	thumb_func_end ov01_021EFFBC

	thumb_func_start ov01_021EFFD8
ov01_021EFFD8: ; 0x021EFFD8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r1, #0x14]
	ldr r1, [r1]
	bl ov01_021EFF90
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	thumb_func_end ov01_021EFFD8

	thumb_func_start ov01_021EFFEC
ov01_021EFFEC: ; 0x021EFFEC
	push {r4, lr}
	mov r0, #4
	mov r1, #0x30
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x30
	add r4, r0, #0
	bl memset
	ldr r0, _021F0020 ; =0x04000048
	mov r1, #0x3f
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #0x1f
	orr r2, r1
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0]
	ldrh r2, [r0]
	ldr r1, _021F0024 ; =0xFFFFC0FF
	and r1, r2
	strh r1, [r0]
	add r0, r4, #0
	pop {r4, pc}
	nop
_021F0020: .word 0x04000048
_021F0024: .word 0xFFFFC0FF
	thumb_func_end ov01_021EFFEC

	thumb_func_start ov01_021F0028
ov01_021F0028: ; 0x021F0028
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x24]
	cmp r1, #0
	beq _021F0036
	bl ov01_021F0174
_021F0036:
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021F004C ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	nop
_021F004C: .word 0xFFFF1FFF
	thumb_func_end ov01_021F0028

	thumb_func_start ov01_021F0050
ov01_021F0050: ; 0x021F0050
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5, #0x24]
	add r7, r2, #0
	str r3, [sp, #4]
	ldr r4, [sp, #0x20]
	cmp r0, #0
	beq _021F0068
	bl GF_AssertFail
_021F0068:
	mov r0, #0
	str r0, [r6, #0x18]
	ldr r1, [r6, #0x10]
	add r6, #0x18
	ldr r1, [r1, #4]
	ldr r2, [sp, #0x24]
	ldr r1, [r1, #0x1c]
	ldr r3, [sp, #0x28]
	str r1, [r5, #0x20]
	str r7, [r5, #0x18]
	str r0, [r5, #0x1c]
	ldr r0, [sp, #4]
	str r6, [r5, #0x2c]
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021EFEC8
	cmp r4, #0
	blt _021F00A8
	mov r0, #0xff
	ldr r2, _021F00D4 ; =0x04000040
	sub r0, r0, r4
	strh r0, [r2]
	add r0, r4, #1
	mov r1, #0xc0
	lsl r0, r0, #0x18
	strh r1, [r2, #4]
	lsr r0, r0, #0x18
	strh r0, [r2, #2]
	strh r1, [r2, #6]
	b _021F00C4
_021F00A8:
	add r0, r4, #0
	add r0, #0xff
	lsl r0, r0, #0x18
	mov r2, #1
	sub r2, r2, r4
	lsl r2, r2, #0x18
	ldr r1, _021F00D4 ; =0x04000040
	lsr r0, r0, #0x18
	strh r0, [r1]
	mov r0, #0xc0
	strh r0, [r1, #4]
	lsr r2, r2, #0x18
	strh r2, [r1, #2]
	strh r0, [r1, #6]
_021F00C4:
	mov r2, #1
	ldr r0, _021F00D8 ; =ov01_021F00DC
	add r1, r5, #0
	lsl r2, r2, #0xa
	bl sub_0200E374
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F00D4: .word 0x04000040
_021F00D8: .word ov01_021F00DC
	thumb_func_end ov01_021F0050

	thumb_func_start ov01_021F00DC
ov01_021F00DC: ; 0x021F00DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r2, #1
	ldr r0, _021F0104 ; =ov01_021F010C
	add r4, r1, #0
	lsl r2, r2, #0xa
	bl sub_0200E374
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r1, _021F0108 ; =ov01_021F01D0
	add r2, r4, #0
	bl ov01_021FB530
	str r0, [r4, #0x24]
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	nop
_021F0104: .word ov01_021F010C
_021F0108: .word ov01_021F01D0
	thumb_func_end ov01_021F00DC

	thumb_func_start ov01_021F010C
ov01_021F010C: ; 0x021F010C
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _021F011C
	cmp r0, #1
	beq _021F0168
	pop {r4, pc}
_021F011C:
	add r0, r4, #0
	bl ov01_021EFF28
	cmp r0, #0
	beq _021F012C
	ldr r0, [r4, #0x1c]
	add r0, r0, #1
	str r0, [r4, #0x1c]
_021F012C:
	ldr r0, [r4]
	asr r0, r0, #0xc
	bmi _021F014A
	mov r1, #0xff
	sub r1, r1, r0
	ldr r2, _021F0170 ; =0x04000040
	add r0, r0, #1
	strh r1, [r2]
	mov r1, #0xc0
	lsl r0, r0, #0x18
	strh r1, [r2, #4]
	lsr r0, r0, #0x18
	strh r0, [r2, #2]
	strh r1, [r2, #6]
	pop {r4, pc}
_021F014A:
	add r1, r0, #0
	add r1, #0xff
	lsl r1, r1, #0x18
	ldr r3, _021F0170 ; =0x04000040
	lsr r1, r1, #0x18
	strh r1, [r3]
	mov r1, #1
	sub r0, r1, r0
	mov r2, #0xc0
	lsl r0, r0, #0x18
	strh r2, [r3, #4]
	lsr r0, r0, #0x18
	strh r0, [r3, #2]
	strh r2, [r3, #6]
	pop {r4, pc}
_021F0168:
	add r0, r4, #0
	bl ov01_021F0174
	pop {r4, pc}
	.balign 4, 0
_021F0170: .word 0x04000040
	thumb_func_end ov01_021F010C

	thumb_func_start ov01_021F0174
ov01_021F0174: ; 0x021F0174
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F01C8 ; =0x04000048
	mov r2, #0x3f
	ldrh r3, [r0]
	mov r1, #0x1f
	bic r3, r2
	orr r3, r1
	mov r1, #0x20
	orr r3, r1
	strh r3, [r0]
	ldrh r3, [r0, #2]
	bic r3, r2
	add r2, r0, #0
	strh r3, [r0, #2]
	mov r3, #0
	sub r2, #8
	strh r3, [r2]
	sub r0, r0, #4
	strh r3, [r0]
	lsl r3, r1, #0x15
	ldr r2, [r3]
	ldr r0, _021F01CC ; =0xFFFF1FFF
	and r2, r0
	lsl r0, r1, #8
	orr r0, r2
	str r0, [r3]
	ldr r0, [r4, #0x2c]
	mov r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x24]
	bl ov01_021FB554
	mov r0, #0
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x28]
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #0x28]
	pop {r4, pc}
	nop
_021F01C8: .word 0x04000048
_021F01CC: .word 0xFFFF1FFF
	thumb_func_end ov01_021F0174

	thumb_func_start ov01_021F01D0
ov01_021F01D0: ; 0x021F01D0
	push {r4, lr}
	ldr r0, _021F0240 ; =0x04000006
	add r4, r1, #0
	ldrh r0, [r0]
	ldr r1, [r4, #0x18]
	bl _u32_div_f
	mov r1, #1
	tst r0, r1
	ldr r0, [r4]
	bne _021F01E8
	b _021F01EA
_021F01E8:
	neg r0, r0
_021F01EA:
	asr r2, r0, #0xc
	ldr r0, _021F0244 ; =0x000001FF
	add r1, r2, #0
	and r1, r0
	ldr r0, _021F0248 ; =0x04000010
	cmp r2, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	ldr r1, _021F024C ; =0xFFFF1FFF
	blt _021F021C
	add r3, r0, #0
	sub r3, #0x10
	ldr r2, [r3]
	and r2, r1
	lsl r1, r0, #9
	orr r1, r2
	str r1, [r3]
	add r0, #0x3a
	ldrh r2, [r0]
	mov r1, #0x3f
	bic r2, r1
	strh r2, [r0]
	pop {r4, pc}
_021F021C:
	add r3, r0, #0
	sub r3, #0x10
	ldr r2, [r3]
	and r2, r1
	lsl r1, r0, #0xa
	orr r1, r2
	str r1, [r3]
	add r0, #0x3a
	ldrh r2, [r0]
	mov r1, #0x3f
	bic r2, r1
	mov r1, #0x1f
	orr r2, r1
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0]
	pop {r4, pc}
	nop
_021F0240: .word 0x04000006
_021F0244: .word 0x000001FF
_021F0248: .word 0x04000010
_021F024C: .word 0xFFFF1FFF
	thumb_func_end ov01_021F01D0

	thumb_func_start ov01_021F0250
ov01_021F0250: ; 0x021F0250
	push {r4, r5, r6, lr}
	mov r0, #4
	mov r1, #0x48
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x48
	add r4, r0, #0
	bl memset
	ldr r0, _021F0294 ; =0x04000048
	mov r5, #0x3f
	ldrh r2, [r0]
	mov r1, #0x1f
	bic r2, r5
	add r3, r2, #0
	orr r3, r1
	mov r2, #0x20
	orr r3, r2
	strh r3, [r0]
	ldrh r6, [r0]
	ldr r3, _021F0298 ; =0xFFFFC0FF
	lsl r1, r1, #8
	and r3, r6
	orr r3, r1
	lsl r1, r2, #8
	orr r1, r3
	strh r1, [r0]
	ldrh r1, [r0, #2]
	bic r1, r5
	strh r1, [r0, #2]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_021F0294: .word 0x04000048
_021F0298: .word 0xFFFFC0FF
	thumb_func_end ov01_021F0250

	thumb_func_start ov01_021F029C
ov01_021F029C: ; 0x021F029C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x3c]
	cmp r1, #0
	beq _021F02AA
	bl ov01_021F03F8
_021F02AA:
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021F02C0 ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	nop
_021F02C0: .word 0xFFFF1FFF
	thumb_func_end ov01_021F029C

	thumb_func_start ov01_021F02C4
ov01_021F02C4: ; 0x021F02C4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x3c]
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	beq _021F02D8
	bl GF_AssertFail
_021F02D8:
	mov r1, #0
	str r1, [r5, #0x18]
	ldr r0, [r5, #0x10]
	mov r2, #0xff
	ldr r0, [r0, #4]
	add r5, #0x18
	ldr r0, [r0, #0x1c]
	lsl r2, r2, #0xc
	str r0, [r4, #0x38]
	mov r0, #0x60
	str r0, [r4, #0x30]
	str r1, [r4, #0x34]
	str r5, [r4, #0x44]
	add r0, r4, #0
	add r3, r7, #0
	str r6, [sp]
	bl ov01_021EFEC8
	add r0, r4, #0
	mov r2, #6
	ldr r3, [sp, #0x18]
	add r0, #0x18
	mov r1, #0
	lsl r2, r2, #0x10
	str r6, [sp]
	bl ov01_021EFEC8
	ldr r2, _021F0328 ; =0x04000040
	mov r1, #0xff
	strh r1, [r2]
	mov r0, #0xc0
	strh r0, [r2, #4]
	strh r1, [r2, #2]
	strh r0, [r2, #6]
	ldr r0, _021F032C ; =ov01_021F0330
	add r1, r4, #0
	lsr r2, r2, #0x10
	bl sub_0200E374
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F0328: .word 0x04000040
_021F032C: .word ov01_021F0330
	thumb_func_end ov01_021F02C4

	thumb_func_start ov01_021F0330
ov01_021F0330: ; 0x021F0330
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r2, #1
	ldr r0, _021F0358 ; =ov01_021F0360
	add r4, r1, #0
	lsl r2, r2, #0xa
	bl sub_0200E374
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x38]
	ldr r1, _021F035C ; =ov01_021F03C8
	add r2, r4, #0
	bl ov01_021FB530
	str r0, [r4, #0x3c]
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	nop
_021F0358: .word ov01_021F0360
_021F035C: .word ov01_021F03C8
	thumb_func_end ov01_021F0330

	thumb_func_start ov01_021F0360
ov01_021F0360: ; 0x021F0360
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _021F0370
	cmp r0, #1
	beq _021F03BC
	pop {r4, pc}
_021F0370:
	add r0, r4, #0
	add r0, #0x18
	bl ov01_021EFF28
	add r0, r4, #0
	bl ov01_021EFF28
	cmp r0, #0
	beq _021F0388
	ldr r0, [r4, #0x34]
	add r0, r0, #1
	str r0, [r4, #0x34]
_021F0388:
	ldr r0, [r4]
	asr r2, r0, #0xc
	ldr r0, [r4, #0x18]
	mov r4, #0xff
	asr r1, r0, #0xc
	ldr r0, _021F03C4 ; =0x04000040
	sub r3, r4, r2
	strh r3, [r0]
	mov r3, #0x60
	sub r3, r3, r1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	strh r3, [r0, #4]
	lsl r3, r2, #8
	lsl r2, r4, #8
	and r2, r3
	orr r2, r4
	add r1, #0x60
	strh r2, [r0, #2]
	lsl r2, r1, #8
	lsl r1, r4, #8
	and r2, r1
	mov r1, #0xc0
	orr r1, r2
	strh r1, [r0, #6]
	pop {r4, pc}
_021F03BC:
	add r0, r4, #0
	bl ov01_021F03F8
	pop {r4, pc}
	.balign 4, 0
_021F03C4: .word 0x04000040
	thumb_func_end ov01_021F0360

	thumb_func_start ov01_021F03C8
ov01_021F03C8: ; 0x021F03C8
	ldr r0, _021F03F0 ; =0x04000006
	ldr r1, [r1, #0x30]
	ldrh r2, [r0]
	cmp r2, r1
	ldr r1, _021F03F4 ; =0xFFFF1FFF
	bhi _021F03E2
	sub r3, r0, #6
	ldr r2, [r3]
	lsr r0, r0, #0xd
	and r1, r2
	orr r0, r1
	str r0, [r3]
	bx lr
_021F03E2:
	sub r3, r0, #6
	ldr r2, [r3]
	lsr r0, r0, #0xc
	and r1, r2
	orr r0, r1
	str r0, [r3]
	bx lr
	.balign 4, 0
_021F03F0: .word 0x04000006
_021F03F4: .word 0xFFFF1FFF
	thumb_func_end ov01_021F03C8

	thumb_func_start ov01_021F03F8
ov01_021F03F8: ; 0x021F03F8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F044C ; =0x04000048
	mov r2, #0x3f
	ldrh r3, [r0]
	mov r1, #0x1f
	bic r3, r2
	orr r3, r1
	mov r1, #0x20
	orr r3, r1
	strh r3, [r0]
	ldrh r3, [r0, #2]
	bic r3, r2
	add r2, r0, #0
	strh r3, [r0, #2]
	mov r3, #0
	sub r2, #8
	strh r3, [r2]
	sub r0, r0, #4
	strh r3, [r0]
	lsl r3, r1, #0x15
	ldr r2, [r3]
	ldr r0, _021F0450 ; =0xFFFF1FFF
	and r2, r0
	lsl r0, r1, #8
	orr r0, r2
	str r0, [r3]
	ldr r0, [r4, #0x44]
	mov r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x3c]
	bl ov01_021FB554
	mov r0, #0
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x40]
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #0x40]
	pop {r4, pc}
	nop
_021F044C: .word 0x04000048
_021F0450: .word 0xFFFF1FFF
	thumb_func_end ov01_021F03F8

	thumb_func_start ov01_021F0454
ov01_021F0454: ; 0x021F0454
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r1, #0
	ldr r1, [sp, #0x34]
	str r2, [sp, #0x10]
	lsl r1, r1, #5
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r1, r3, #0
	ldr r3, [sp, #0x30]
	mov r2, #0
	lsl r3, r3, #5
	add r6, r0, #0
	ldr r5, [sp, #0x38]
	ldr r4, [sp, #0x3c]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	add r0, r6, #0
	add r2, r5, #0
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #4
	str r0, [sp]
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #0
	add r3, sp, #0x14
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	lsl r1, r4, #0x18
	ldr r2, [sp, #0x14]
	mov r3, #0
	str r3, [sp]
	add r6, r0, #0
	ldrh r0, [r2]
	lsr r1, r1, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	add r2, #0xc
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	bl LoadRectToBgTilemapRect
	ldr r1, [sp, #0x14]
	mov r2, #0
	ldrh r0, [r1]
	add r3, r2, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp]
	ldrh r0, [r1, #2]
	lsl r1, r4, #0x18
	lsr r1, r1, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	bl BgTilemapRectChangePalette
	add r0, r6, #0
	bl FreeToHeap
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F0454

	thumb_func_start ov01_021F0500
ov01_021F0500: ; 0x021F0500
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r6, [sp, #0x38]
	add r5, r0, #0
	str r6, [sp, #0x38]
	ldr r6, [sp, #0x30]
	add r4, r1, #0
	str r6, [sp]
	ldr r6, [sp, #0x34]
	add r7, r2, #0
	str r6, [sp, #4]
	ldr r6, [sp, #0x38]
	str r3, [sp, #0x10]
	str r6, [sp, #8]
	ldr r6, [sp, #0x3c]
	str r6, [sp, #0xc]
	bl ov01_021F0454
	ldr r0, [sp, #0x30]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x34]
	add r1, r4, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	add r2, r7, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x40]
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ov01_021F0454
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0x38]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl GetBgTilemapBuffer
	add r3, r0, #0
	mov r5, #0
	mov r0, #0xf
	mov ip, r5
	str r0, [sp, #0x14]
_021F0556:
	mov r4, #0
_021F0558:
	add r0, r4, r5
	lsl r0, r0, #0x10
	lsr r2, r0, #0xf
	ldr r0, [sp, #0x14]
	ldrh r1, [r3, r2]
	sub r0, r0, r4
	lsl r0, r0, #0x10
	lsr r6, r0, #0xf
	ldrh r0, [r3, r6]
	add r4, r4, #1
	strh r0, [r3, r2]
	strh r1, [r3, r6]
	ldrh r1, [r3, r2]
	ldr r0, _021F05C0 ; =0x0000FBFF
	add r7, r1, #0
	and r7, r0
	asr r1, r1, #0xa
	mov r0, #1
	eor r0, r1
	lsl r0, r0, #0xa
	orr r0, r7
	strh r0, [r3, r2]
	ldrh r0, [r3, r6]
	ldr r1, _021F05C0 ; =0x0000FBFF
	add r2, r0, #0
	and r2, r1
	asr r1, r0, #0xa
	mov r0, #1
	eor r0, r1
	lsl r0, r0, #0xa
	orr r0, r2
	strh r0, [r3, r6]
	cmp r4, #8
	blt _021F0558
	ldr r0, [sp, #0x14]
	add r5, #0x10
	add r0, #0x10
	str r0, [sp, #0x14]
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	cmp r0, #0x18
	blt _021F0556
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0x38]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F05C0: .word 0x0000FBFF
	thumb_func_end ov01_021F0500

	thumb_func_start ov01_021F05C4
ov01_021F05C4: ; 0x021F05C4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r0, r1, #0
	add r1, r5, #4
	mov r2, #4
	bl G2dRenderer_Init
	mov r7, #0x4b
	str r0, [r5]
	mov r4, #0
	lsl r7, r7, #2
_021F05DC:
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #4
	bl Create2DGfxResObjMan
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021F05DC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F05C4

	thumb_func_start ov01_021F05F4
ov01_021F05F4: ; 0x021F05F4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl sub_02024504
	mov r6, #0x4b
	mov r4, #0
	lsl r6, r6, #2
_021F0604:
	ldr r0, [r5, r6]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021F0604
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021F05F4

	thumb_func_start ov01_021F0614
ov01_021F0614: ; 0x021F0614
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r6, [sp, #0x58]
	add r5, r1, #0
	str r6, [sp]
	mov r1, #1
	add r7, r0, #0
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x4b
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	add r4, r2, #0
	str r3, [sp, #0x2c]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x4c]
	add r1, r7, #0
	mov r3, #0
	bl AddCharResObjFromOpenNarcWithAtEndFlag
	str r0, [r4]
	str r6, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	ldr r2, [sp, #0x2c]
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	str r0, [r4, #4]
	str r6, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x50]
	add r1, r7, #0
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r4, #8]
	str r6, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x54]
	add r1, r7, #0
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r4, #0xc]
	ldr r0, [r4]
	bl sub_0200ADA4
	ldr r0, [r4]
	bl sub_0200A740
	ldr r0, [r4, #4]
	bl sub_0200B00C
	mov r0, #0
	mov r2, #0x4b
	str r6, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	add r4, #0x10
	str r1, [sp, #0x14]
	add r1, r2, #4
	ldr r1, [r5, r1]
	add r3, r6, #0
	str r1, [sp, #0x18]
	add r1, r2, #0
	add r1, #8
	ldr r1, [r5, r1]
	add r2, #0xc
	str r1, [sp, #0x1c]
	ldr r1, [r5, r2]
	add r2, r6, #0
	str r1, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r4, #0
	add r1, r6, #0
	bl CreateSpriteResourcesHeader
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F0614

	thumb_func_start ov01_021F06EC
ov01_021F06EC: ; 0x021F06EC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_0200AEB0
	ldr r0, [r4, #4]
	bl sub_0200B0A8
	mov r7, #0x4b
	mov r6, #0
	lsl r7, r7, #2
_021F0704:
	ldr r0, [r5, r7]
	ldr r1, [r4]
	bl DestroySingle2DGfxResObj
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #4
	blt _021F0704
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F06EC

	thumb_func_start ov01_021F0718
ov01_021F0718: ; 0x021F0718
	push {r4, lr}
	sub sp, #0x20
	ldr r0, [r0]
	add r1, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x28]
	str r1, [sp, #4]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	str r2, [sp, #8]
	str r0, [sp, #0x14]
	mov r0, #1
	str r0, [sp, #0x18]
	mov r0, #4
	str r0, [sp, #0x1c]
	add r0, sp, #0
	str r3, [sp, #0xc]
	bl sub_02024714
	add r4, r0, #0
	bne _021F0746
	bl GF_AssertFail
_021F0746:
	add r0, r4, #0
	add sp, #0x20
	pop {r4, pc}
	thumb_func_end ov01_021F0718

	thumb_func_start ov01_021F074C
ov01_021F074C: ; 0x021F074C
	push {r4}
	sub sp, #0xc
	str r2, [sp, #4]
	str r3, [sp, #8]
	add r2, sp, #0
	add r4, r0, #0
	str r1, [sp]
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	add sp, #0xc
	pop {r4}
	bx lr
	thumb_func_end ov01_021F074C

	thumb_func_start ov01_021F0768
ov01_021F0768: ; 0x021F0768
	push {r4, lr}
	mov r1, #0x30
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x30
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F0768

	thumb_func_start ov01_021F0780
ov01_021F0780: ; 0x021F0780
	ldr r3, _021F0784 ; =FreeToHeap
	bx r3
	.balign 4, 0
_021F0784: .word FreeToHeap
	thumb_func_end ov01_021F0780

	thumb_func_start ov01_021F0788
ov01_021F0788: ; 0x021F0788
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x2e
	ldrb r0, [r0]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	beq _021F079E
	bl GF_AssertFail
_021F079E:
	ldr r3, [sp, #0x1c]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021EFE34
	add r0, r5, #0
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r0, #0x14
	add r1, r7, #0
	bl ov01_021EFE34
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [r5, #0x28]
	add r0, r5, #0
	add r0, #0x2c
	strb r1, [r0]
	add r0, r5, #0
	ldr r1, [sp, #0x28]
	add r0, #0x2d
	strb r1, [r0]
	add r0, sp, #0x2c
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x2f
	strb r1, [r0]
	mov r0, #1
	add r5, #0x2e
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F0788

	thumb_func_start ov01_021F07E0
ov01_021F07E0: ; 0x021F07E0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x2e
	ldrb r1, [r1]
	cmp r1, #0
	bne _021F07F6
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F07F6:
	bl ov01_021EFE44
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x14
	bl ov01_021EFE44
	add r0, r5, #0
	add r0, #0x2c
	ldrb r0, [r0]
	ldr r2, [r5]
	ldr r6, [r5, #0x14]
	lsr r1, r0, #1
	sub r1, r2, r1
	lsl r1, r1, #0x10
	asr r3, r1, #0x10
	add r1, r5, #0
	add r1, #0x2d
	ldrb r2, [r1]
	add r0, r3, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	lsr r1, r2, #1
	str r0, [sp]
	add r0, r5, #0
	sub r1, r6, r1
	add r0, #0x2f
	lsl r1, r1, #0x10
	ldrb r0, [r0]
	asr r1, r1, #0x10
	add r2, r1, r2
	str r0, [sp, #4]
	lsl r2, r2, #0x10
	ldr r0, [r5, #0x28]
	asr r2, r2, #0x10
	bl ov01_021F0960
	add r0, r4, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F07E0

	thumb_func_start ov01_021F0848
ov01_021F0848: ; 0x021F0848
	push {r4, lr}
	mov r1, #0x30
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x30
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F0848

	thumb_func_start ov01_021F0860
ov01_021F0860: ; 0x021F0860
	ldr r3, _021F0864 ; =FreeToHeap
	bx r3
	.balign 4, 0
_021F0864: .word FreeToHeap
	thumb_func_end ov01_021F0860

	thumb_func_start ov01_021F0868
ov01_021F0868: ; 0x021F0868
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x2e
	ldrb r0, [r0]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	beq _021F087E
	bl GF_AssertFail
_021F087E:
	ldr r3, [sp, #0x1c]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov01_021EFE34
	add r0, r5, #0
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r0, #0x14
	add r1, r7, #0
	bl ov01_021EFE34
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [r5, #0x28]
	add r0, r5, #0
	add r0, #0x2c
	strb r1, [r0]
	add r0, r5, #0
	ldr r1, [sp, #0x28]
	add r0, #0x2d
	strb r1, [r0]
	add r0, sp, #0x2c
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x2f
	strb r1, [r0]
	mov r0, #1
	add r5, #0x2e
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F0868

	thumb_func_start ov01_021F08C0
ov01_021F08C0: ; 0x021F08C0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F08D4
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F08D4:
	add r0, r5, #0
	add r0, #0x2c
	ldrb r0, [r0]
	ldr r2, [r5]
	ldr r4, [r5, #0x14]
	lsr r1, r0, #1
	sub r1, r2, r1
	lsl r1, r1, #0x10
	asr r3, r1, #0x10
	add r1, r5, #0
	add r1, #0x2d
	ldrb r2, [r1]
	add r0, r3, r0
	lsl r0, r0, #0x10
	lsr r1, r2, #1
	sub r1, r4, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0
	add r2, r1, r2
	str r0, [sp, #4]
	lsl r2, r2, #0x10
	ldr r0, [r5, #0x28]
	asr r2, r2, #0x10
	bl ov01_021F0960
	add r0, r5, #0
	bl ov01_021EFE44
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x14
	bl ov01_021EFE44
	add r0, r5, #0
	add r0, #0x2c
	ldrb r0, [r0]
	ldr r2, [r5]
	ldr r6, [r5, #0x14]
	lsr r1, r0, #1
	sub r1, r2, r1
	lsl r1, r1, #0x10
	asr r3, r1, #0x10
	add r1, r5, #0
	add r1, #0x2d
	ldrb r2, [r1]
	add r0, r3, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	lsr r1, r2, #1
	str r0, [sp]
	add r0, r5, #0
	sub r1, r6, r1
	add r0, #0x2f
	lsl r1, r1, #0x10
	ldrb r0, [r0]
	asr r1, r1, #0x10
	add r2, r1, r2
	str r0, [sp, #4]
	lsl r2, r2, #0x10
	ldr r0, [r5, #0x28]
	asr r2, r2, #0x10
	bl ov01_021F0960
	add r0, r4, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F08C0

	thumb_func_start ov01_021F0960
ov01_021F0960: ; 0x021F0960
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r5, [sp, #0x18]
	add r4, r1, #0
	cmp r5, #0
	ble _021F09B8
	cmp r2, #0
	ble _021F09B8
	cmp r3, r5
	beq _021F09B8
	cmp r4, r2
	beq _021F09B8
	cmp r3, #0
	bge _021F097E
	mov r3, #0
_021F097E:
	mov r1, #1
	lsl r1, r1, #8
	cmp r5, r1
	ble _021F0988
	add r5, r1, #0
_021F0988:
	cmp r4, #0
	bge _021F098E
	mov r4, #0
_021F098E:
	mov r1, #1
	lsl r1, r1, #8
	cmp r2, r1
	ble _021F0998
	add r2, r1, #0
_021F0998:
	sub r1, r5, r3
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	str r1, [sp]
	sub r1, r2, r4
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	str r1, [sp, #4]
	lsl r2, r3, #0x10
	add r1, sp, #8
	lsl r3, r4, #0x10
	ldrb r1, [r1, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
_021F09B8:
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F0960

	thumb_func_start ov01_021F09BC
ov01_021F09BC: ; 0x021F09BC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #4
	mov r1, #0xcc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xcc
	add r7, r0, #0
	bl memset
	mov r4, #0
	add r5, r7, #0
_021F09D6:
	add r0, r6, #0
	bl ov01_021F0848
	str r0, [r5, #4]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x30
	blt _021F09D6
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F09BC

	thumb_func_start ov01_021F09EC
ov01_021F09EC: ; 0x021F09EC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_021F09F4:
	ldr r0, [r5, #4]
	bl ov01_021F0860
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x30
	blt _021F09F4
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021F09EC

	thumb_func_start ov01_021F0A0C
ov01_021F0A0C: ; 0x021F0A0C
	push {r3, r4}
	str r3, [r0]
	ldr r3, _021F0A48 ; =0xFFFFFFF8
	add r3, sp
	ldrb r4, [r3, #0x10]
	add r3, r0, #0
	add r3, #0xc9
	strb r4, [r3]
	add r3, r0, #0
	add r3, #0xc6
	strb r1, [r3]
	add r1, r0, #0
	add r1, #0xc7
	strb r2, [r1]
	add r1, r0, #0
	mov r2, #0
	add r1, #0xc4
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0xc5
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0xc8
	strb r2, [r1]
	mov r1, #1
	add r0, #0xca
	strb r1, [r0]
	pop {r3, r4}
	bx lr
	nop
_021F0A48: .word 0xFFFFFFF8
	thumb_func_end ov01_021F0A0C

	thumb_func_start ov01_021F0A4C
ov01_021F0A4C: ; 0x021F0A4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	add r0, #0xca
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F0A60
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021F0A60:
	add r0, r6, #0
	add r0, #0xc4
	ldrb r0, [r0]
	cmp r0, #0x30
	bhs _021F0AE4
	mov r1, #0xc8
	ldrsb r0, [r6, r1]
	sub r2, r0, #1
	add r0, r6, #0
	add r0, #0xc8
	strb r2, [r0]
	ldrsb r0, [r6, r1]
	cmp r0, #0
	bgt _021F0AE4
	add r0, r6, #0
	add r0, #0xc7
	ldrb r1, [r0]
	add r0, r6, #0
	add r0, #0xc8
	strb r1, [r0]
	add r0, r6, #0
	add r0, #0xc4
	ldrb r0, [r0]
	mov r1, #0x1d
	lsr r3, r0, #0x1f
	lsl r2, r0, #0x1d
	sub r2, r2, r3
	ror r2, r1
	add r2, r3, r2
	ldr r1, _021F0B40 ; =ov01_02206980
	mov r3, #0x20
	ldrb r1, [r1, r2]
	lsr r2, r0, #3
	lsl r4, r2, #5
	mov r2, #0xb0
	sub r2, r2, r4
	str r2, [sp]
	add r2, r6, #0
	add r2, #0xc6
	ldrb r2, [r2]
	lsl r0, r0, #2
	lsl r1, r1, #5
	str r2, [sp, #4]
	ldr r2, [r6]
	add r0, r6, r0
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	add r2, r6, #0
	str r3, [sp, #0x10]
	add r2, #0xc9
	ldrb r2, [r2]
	sub r3, #0x30
	add r1, #0x10
	str r2, [sp, #0x14]
	ldr r0, [r0, #4]
	add r2, r1, #0
	sub r3, r3, r4
	bl ov01_021F0868
	add r0, r6, #0
	add r0, #0xc4
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r6, #0
	add r0, #0xc4
	strb r1, [r0]
_021F0AE4:
	add r0, r6, #0
	add r0, #0xc5
	ldrb r4, [r0]
	add r0, r6, #0
	add r0, #0xc4
	ldrb r0, [r0]
	cmp r4, r0
	bge _021F0B1C
	lsl r0, r4, #2
	add r7, r6, #0
	add r5, r6, r0
	add r7, #0xc5
_021F0AFC:
	ldr r0, [r5, #4]
	bl ov01_021F08C0
	str r0, [sp, #0x18]
	cmp r0, #1
	bne _021F0B0E
	ldrb r0, [r7]
	add r0, r0, #1
	strb r0, [r7]
_021F0B0E:
	add r0, r6, #0
	add r0, #0xc4
	ldrb r0, [r0]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _021F0AFC
_021F0B1C:
	add r0, r6, #0
	add r0, #0xc5
	ldrb r0, [r0]
	cmp r0, #0x30
	blo _021F0B38
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _021F0B38
	mov r0, #0
	add r6, #0xca
	strb r0, [r6]
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021F0B38:
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021F0B40: .word ov01_02206980
	thumb_func_end ov01_021F0A4C

	thumb_func_start ov01_021F0B44
ov01_021F0B44: ; 0x021F0B44
	push {r4, lr}
	mov r0, #4
	mov r1, #0xe8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xe8
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov01_021F0B44

	thumb_func_start ov01_021F0B5C
ov01_021F0B5C: ; 0x021F0B5C
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xe0
	ldr r1, [r1]
	cmp r1, #0
	beq _021F0B6E
	bl ov01_021F0CDC
_021F0B6E:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F0B5C

	thumb_func_start ov01_021F0B78
ov01_021F0B78: ; 0x021F0B78
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, [sp, #0x18]
	add r7, r1, #0
	str r0, [sp, #0x18]
	add r0, r7, #0
	add r0, #0xe0
	ldr r0, [r0]
	add r6, r2, #0
	add r5, r3, #0
	cmp r0, #0
	beq _021F0B94
	bl GF_AssertFail
_021F0B94:
	mov r2, #0
	str r2, [r4, #0x18]
	ldr r0, [r4, #0x10]
	add r4, #0x18
	ldr r0, [r0, #4]
	add r3, r6, #0
	ldr r1, [r0, #0x1c]
	add r0, r7, #0
	add r0, #0xd8
	str r1, [r0]
	add r0, r7, #0
	str r2, [r7, #0x14]
	add r0, #0xe4
	str r4, [r0]
	add r0, r7, #0
	mov r1, #0xff
	bl ov01_021EFE34
	mov r4, #0
_021F0BBA:
	add r0, r4, #0
	add r1, r5, #0
	bl _u32_div_f
	ldr r0, [sp, #0x18]
	mul r0, r1
	add r1, r5, #0
	bl _u32_div_f
	add r6, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl _u32_div_f
	mov r1, #1
	tst r0, r1
	bne _021F0BE2
	add r0, r7, r4
	strb r6, [r0, #0x18]
	b _021F0BEA
_021F0BE2:
	ldr r0, [sp, #0x18]
	sub r1, r0, r6
	add r0, r7, r4
	strb r1, [r0, #0x18]
_021F0BEA:
	add r4, r4, #1
	cmp r4, #0xc0
	blt _021F0BBA
	ldr r0, _021F0C34 ; =0x04000048
	mov r1, #0x3f
	ldrh r3, [r0]
	ldr r2, [sp, #0x1c]
	bic r3, r1
	orr r3, r2
	mov r2, #0x20
	orr r3, r2
	strh r3, [r0]
	ldrh r3, [r0, #2]
	bic r3, r1
	ldr r1, [sp, #0x20]
	orr r1, r3
	strh r1, [r0, #2]
	add r1, r0, #0
	mov r3, #0
	sub r1, #8
	strh r3, [r1]
	mov r1, #0xc0
	sub r0, r0, #4
	strh r1, [r0]
	lsl r3, r2, #0x15
	ldr r1, [r3]
	ldr r0, _021F0C38 ; =0xFFFF1FFF
	and r1, r0
	lsl r0, r2, #8
	orr r0, r1
	str r0, [r3]
	ldr r0, _021F0C3C ; =ov01_021F0C40
	add r1, r7, #0
	lsl r2, r2, #5
	bl sub_0200E374
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F0C34: .word 0x04000048
_021F0C38: .word 0xFFFF1FFF
_021F0C3C: .word ov01_021F0C40
	thumb_func_end ov01_021F0B78

	thumb_func_start ov01_021F0C40
ov01_021F0C40: ; 0x021F0C40
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0xd8
	ldr r0, [r0]
	ldr r1, _021F0C74 ; =ov01_021F0CA8
	add r2, r4, #0
	bl ov01_021FB530
	add r1, r4, #0
	add r1, #0xdc
	str r0, [r1]
	mov r2, #1
	ldr r0, _021F0C78 ; =ov01_021F0C7C
	add r1, r4, #0
	lsl r2, r2, #0xa
	bl sub_0200E374
	add r4, #0xe0
	str r0, [r4]
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	nop
_021F0C74: .word ov01_021F0CA8
_021F0C78: .word ov01_021F0C7C
	thumb_func_end ov01_021F0C40

	thumb_func_start ov01_021F0C7C
ov01_021F0C7C: ; 0x021F0C7C
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _021F0C8C
	cmp r0, #1
	beq _021F0C9E
	pop {r4, pc}
_021F0C8C:
	add r0, r4, #0
	bl ov01_021EFE44
	cmp r0, #1
	bne _021F0CA4
	ldr r0, [r4, #0x14]
	add r0, r0, #1
	str r0, [r4, #0x14]
	pop {r4, pc}
_021F0C9E:
	add r0, r4, #0
	bl ov01_021F0CDC
_021F0CA4:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F0C7C

	thumb_func_start ov01_021F0CA8
ov01_021F0CA8: ; 0x021F0CA8
	ldr r0, _021F0CD4 ; =0x04000006
	ldrh r0, [r0]
	cmp r0, #0xc0
	bge _021F0CD0
	add r0, r1, r0
	ldrb r0, [r0, #0x18]
	ldr r2, [r1]
	sub r0, r2, r0
	bpl _021F0CBC
	mov r0, #0
_021F0CBC:
	lsl r1, r0, #8
	mov r0, #0xff
	lsl r0, r0, #8
	and r1, r0
	mov r0, #0xff
	orr r0, r1
	ldr r1, _021F0CD8 ; =0x04000040
	strh r0, [r1]
	mov r0, #0xc0
	strh r0, [r1, #4]
_021F0CD0:
	bx lr
	nop
_021F0CD4: .word 0x04000006
_021F0CD8: .word 0x04000040
	thumb_func_end ov01_021F0CA8

	thumb_func_start ov01_021F0CDC
ov01_021F0CDC: ; 0x021F0CDC
	push {r4, lr}
	mov r2, #1
	lsl r2, r2, #0x1a
	add r4, r0, #0
	ldr r1, [r2]
	ldr r0, _021F0D1C ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #1
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xdc
	ldr r0, [r0]
	bl ov01_021FB554
	add r0, r4, #0
	mov r1, #0
	add r0, #0xdc
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xe0
	ldr r0, [r0]
	bl DestroySysTask
	mov r0, #0
	add r4, #0xe0
	str r0, [r4]
	pop {r4, pc}
	nop
_021F0D1C: .word 0xFFFF1FFF
	thumb_func_end ov01_021F0CDC

	thumb_func_start ov01_021F0D20
ov01_021F0D20: ; 0x021F0D20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #1
	add r2, r0, #0
	tst r2, r1
	bne _021F0D42
	ldr r1, _021F0DAC ; =0x00001720
	tst r1, r0
	bne _021F0D38
	cmp r0, #0
	bne _021F0D3C
_021F0D38:
	mov r1, #0
	b _021F0D42
_021F0D3C:
	bl GF_AssertFail
	mov r1, #0
_021F0D42:
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0x18
	bhi _021F0D94
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F0D58: ; jump table
	.short _021F0D8A - _021F0D58 - 2 ; case 0
	.short _021F0D8A - _021F0D58 - 2 ; case 1
	.short _021F0D8A - _021F0D58 - 2 ; case 2
	.short _021F0D8A - _021F0D58 - 2 ; case 3
	.short _021F0D8A - _021F0D58 - 2 ; case 4
	.short _021F0D92 - _021F0D58 - 2 ; case 5
	.short _021F0D8A - _021F0D58 - 2 ; case 6
	.short _021F0D8E - _021F0D58 - 2 ; case 7
	.short _021F0D8A - _021F0D58 - 2 ; case 8
	.short _021F0D8A - _021F0D58 - 2 ; case 9
	.short _021F0D8A - _021F0D58 - 2 ; case 10
	.short _021F0D8A - _021F0D58 - 2 ; case 11
	.short _021F0D94 - _021F0D58 - 2 ; case 12
	.short _021F0D94 - _021F0D58 - 2 ; case 13
	.short _021F0D94 - _021F0D58 - 2 ; case 14
	.short _021F0D94 - _021F0D58 - 2 ; case 15
	.short _021F0D94 - _021F0D58 - 2 ; case 16
	.short _021F0D94 - _021F0D58 - 2 ; case 17
	.short _021F0D94 - _021F0D58 - 2 ; case 18
	.short _021F0D94 - _021F0D58 - 2 ; case 19
	.short _021F0D94 - _021F0D58 - 2 ; case 20
	.short _021F0D94 - _021F0D58 - 2 ; case 21
	.short _021F0D94 - _021F0D58 - 2 ; case 22
	.short _021F0D94 - _021F0D58 - 2 ; case 23
	.short _021F0D8A - _021F0D58 - 2 ; case 24
_021F0D8A:
	mov r4, #0
	b _021F0D94
_021F0D8E:
	mov r4, #2
	b _021F0D94
_021F0D92:
	mov r4, #4
_021F0D94:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	sub r0, r0, #3
	cmp r0, #1
	bhi _021F0DA2
	add r4, r4, #1
_021F0DA2:
	mov r0, #6
	mul r0, r1
	add r0, r4, r0
	pop {r3, r4, r5, pc}
	nop
_021F0DAC: .word 0x00001720
	thumb_func_end ov01_021F0D20

	thumb_func_start ov01_021F0DB0
ov01_021F0DB0: ; 0x021F0DB0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F0DC4 ; =0x0400006C
	ldr r1, [r1]
	bl GXx_SetMasterBrightness_
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	.balign 4, 0
_021F0DC4: .word 0x0400006C
	thumb_func_end ov01_021F0DB0

	thumb_func_start ov01_021F0DC8
ov01_021F0DC8: ; 0x021F0DC8
	ldr r3, _021F0DD4 ; =sub_0200E374
	mov r2, #1
	add r1, r0, #0
	ldr r0, _021F0DD8 ; =ov01_021F0DB0
	lsl r2, r2, #0xa
	bx r3
	.balign 4, 0
_021F0DD4: .word sub_0200E374
_021F0DD8: .word ov01_021F0DB0
	thumb_func_end ov01_021F0DC8

	thumb_func_start ov01_021F0DDC
ov01_021F0DDC: ; 0x021F0DDC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F0E5C ; =ov01_02209B64
	ldr r0, [r0]
	cmp r0, #0
	beq _021F0DEC
	bl GF_AssertFail
_021F0DEC:
	mov r0, #4
	mov r1, #0x18
	bl AllocFromHeap
	ldr r1, _021F0E5C ; =ov01_02209B64
	mov r2, #0x18
	str r0, [r1]
	mov r1, #0
_021F0DFC:
	strb r1, [r0]
	add r0, r0, #1
	sub r2, r2, #1
	bne _021F0DFC
	ldr r0, _021F0E5C ; =ov01_02209B64
	mov r1, #0
	ldr r2, [r0]
	strh r1, [r2]
	ldr r2, [r0]
	strb r1, [r2, #2]
	ldr r0, [r0]
	str r4, [r0, #4]
	mov r0, #2
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	bl GX_ResetBankForBG
	mov r2, #2
	ldr r1, _021F0E60 ; =0x06840000
	mov r0, #0
	lsl r2, r2, #0x10
	bl MIi_CpuClearFast
	ldr r0, _021F0E64 ; =0xC0320C04
	ldr r2, _021F0E68 ; =0x04000064
	ldr r1, _021F0E5C ; =ov01_02209B64
	str r0, [r2]
	ldr r0, _021F0E6C ; =ov01_021F1094
	ldr r1, [r1]
	lsr r2, r2, #0x10
	bl sub_0200E374
	ldr r1, _021F0E5C ; =ov01_02209B64
	mov r2, #1
	ldr r0, _021F0E70 ; =ov01_021F10C8
	ldr r1, [r1]
	lsl r2, r2, #0xa
	bl CreateSysTask
	pop {r4, pc}
	.balign 4, 0
_021F0E5C: .word ov01_02209B64
_021F0E60: .word 0x06840000
_021F0E64: .word 0xC0320C04
_021F0E68: .word 0x04000064
_021F0E6C: .word ov01_021F1094
_021F0E70: .word ov01_021F10C8
	thumb_func_end ov01_021F0DDC

	thumb_func_start ov01_021F0E74
ov01_021F0E74: ; 0x021F0E74
	push {r3, lr}
	ldr r0, _021F0E8C ; =ov01_02209B64
	ldr r0, [r0]
	cmp r0, #0
	bne _021F0E82
	bl GF_AssertFail
_021F0E82:
	ldr r0, _021F0E8C ; =ov01_02209B64
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #3]
	pop {r3, pc}
	.balign 4, 0
_021F0E8C: .word ov01_02209B64
	thumb_func_end ov01_021F0E74

	thumb_func_start ov01_021F0E90
ov01_021F0E90: ; 0x021F0E90
	push {r3, lr}
	ldr r0, _021F0EA8 ; =ov01_02209B64
	ldr r0, [r0]
	cmp r0, #0
	bne _021F0E9E
	bl GF_AssertFail
_021F0E9E:
	ldr r0, _021F0EA8 ; =ov01_02209B64
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	pop {r3, pc}
	nop
_021F0EA8: .word ov01_02209B64
	thumb_func_end ov01_021F0E90

	thumb_func_start ov01_021F0EAC
ov01_021F0EAC: ; 0x021F0EAC
	push {r3, lr}
	ldr r0, _021F0EBC ; =ov01_02209B64
	ldr r0, [r0]
	cmp r0, #0
	beq _021F0EBA
	bl sub_0201543C
_021F0EBA:
	pop {r3, pc}
	.balign 4, 0
_021F0EBC: .word ov01_02209B64
	thumb_func_end ov01_021F0EAC

	thumb_func_start ov01_021F0EC0
ov01_021F0EC0: ; 0x021F0EC0
	push {r3, lr}
	ldr r0, _021F0F04 ; =ov01_02209B64
	ldr r0, [r0]
	cmp r0, #0
	bne _021F0ECE
	bl GF_AssertFail
_021F0ECE:
	bl sub_02014F84
	ldr r0, _021F0F04 ; =ov01_02209B64
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov01_021F1210
	ldr r0, _021F0F04 ; =ov01_02209B64
	mov r1, #1
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov01_021E631C
	ldr r0, _021F0F04 ; =ov01_02209B64
	mov r1, #1
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov01_021E6340
	ldr r0, _021F0F04 ; =ov01_02209B64
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _021F0F04 ; =ov01_02209B64
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_021F0F04: .word ov01_02209B64
	thumb_func_end ov01_021F0EC0

	thumb_func_start ov01_021F0F08
ov01_021F0F08: ; 0x021F0F08
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _021F0FAC ; =ov01_02209B64
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _021F0F1C
	bl GF_AssertFail
_021F0F1C:
	ldr r0, _021F0FAC ; =ov01_02209B64
	ldr r0, [r0]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _021F0F2A
	bl GF_AssertFail
_021F0F2A:
	mov r1, #0x12
	mov r0, #4
	lsl r1, r1, #0xa
	bl AllocFromHeap
	ldr r2, _021F0FAC ; =ov01_02209B64
	mov r3, #0x12
	ldr r1, [r2]
	lsl r3, r3, #0xa
	str r0, [r1, #0xc]
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r2, [r2]
	ldr r0, _021F0FB0 ; =ov01_021F1224
	ldr r1, _021F0FB4 ; =ov01_021F1250
	ldr r2, [r2, #0xc]
	bl sub_02014DB4
	ldr r1, _021F0FAC ; =ov01_02209B64
	ldr r2, [r1]
	str r0, [r2, #8]
	ldr r0, [r1]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _021F0F64
	bl GF_AssertFail
_021F0F64:
	ldr r0, _021F0FAC ; =ov01_02209B64
	mov r1, #1
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_02015528
	ldr r0, _021F0FAC ; =ov01_02209B64
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_02015524
	add r2, r0, #0
	mov r0, #1
	mov r1, #0xe1
	lsl r0, r0, #0xc
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	mov r2, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #4
	str r2, [sp]
	bl GfGfxLoader_LoadFromOpenNarc
	add r1, r0, #0
	ldr r0, _021F0FAC ; =ov01_02209B64
	mov r2, #0
	ldr r0, [r0]
	add r3, r2, #0
	ldr r0, [r0, #8]
	bl sub_0201526C
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021F0FAC: .word ov01_02209B64
_021F0FB0: .word ov01_021F1224
_021F0FB4: .word ov01_021F1250
	thumb_func_end ov01_021F0F08

	thumb_func_start ov01_021F0FB8
ov01_021F0FB8: ; 0x021F0FB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, _021F1004 ; =ov01_02209B64
	ldr r0, [r0]
	cmp r0, #0
	bne _021F0FD4
	bl GF_AssertFail
_021F0FD4:
	ldr r0, _021F1004 ; =ov01_02209B64
	ldr r0, [r0]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _021F0FE2
	bl GF_AssertFail
_021F0FE2:
	mov r4, #0
	cmp r5, #0
	bls _021F0FFE
	ldr r6, _021F1004 ; =ov01_02209B64
	add r7, sp, #0
_021F0FEC:
	ldr r0, [r6]
	add r1, r4, #0
	ldr r0, [r0, #8]
	add r2, r7, #0
	bl sub_02015484
	add r4, r4, #1
	cmp r4, r5
	blo _021F0FEC
_021F0FFE:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021F1004: .word ov01_02209B64
	thumb_func_end ov01_021F0FB8

	thumb_func_start ov01_021F1008
ov01_021F1008: ; 0x021F1008
	push {r3, lr}
	ldr r0, _021F1040 ; =ov01_02209B64
	ldr r0, [r0]
	cmp r0, #0
	bne _021F1016
	bl GF_AssertFail
_021F1016:
	ldr r0, _021F1040 ; =ov01_02209B64
	ldr r0, [r0]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _021F1024
	mov r0, #1
	pop {r3, pc}
_021F1024:
	bl sub_02015460
	ldr r0, _021F1040 ; =ov01_02209B64
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_020154B0
	cmp r0, #0
	bne _021F103A
	mov r0, #1
	pop {r3, pc}
_021F103A:
	mov r0, #0
	pop {r3, pc}
	nop
_021F1040: .word ov01_02209B64
	thumb_func_end ov01_021F1008

	thumb_func_start ov01_021F1044
ov01_021F1044: ; 0x021F1044
	push {r3, lr}
	ldr r0, _021F105C ; =ov01_02209B64
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_020154B0
	cmp r0, #0
	bne _021F1058
	mov r0, #1
	pop {r3, pc}
_021F1058:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_021F105C: .word ov01_02209B64
	thumb_func_end ov01_021F1044

	thumb_func_start ov01_021F1060
ov01_021F1060: ; 0x021F1060
	push {r3, lr}
	ldr r0, _021F1090 ; =ov01_02209B64
	ldr r0, [r0]
	cmp r0, #0
	bne _021F106E
	bl GF_AssertFail
_021F106E:
	ldr r0, _021F1090 ; =ov01_02209B64
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_02014EBC
	ldr r0, _021F1090 ; =ov01_02209B64
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl FreeToHeap
	ldr r0, _021F1090 ; =ov01_02209B64
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r0, [r0]
	str r2, [r0, #0xc]
	pop {r3, pc}
	.balign 4, 0
_021F1090: .word ov01_02209B64
	thumb_func_end ov01_021F1060

	thumb_func_start ov01_021F1094
ov01_021F1094: ; 0x021F1094
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrh r0, [r4]
	cmp r0, #0
	beq _021F10A6
	cmp r0, #1
	beq _021F10AC
	pop {r3, r4, r5, pc}
_021F10A6:
	add r0, r0, #1
	strh r0, [r4]
	pop {r3, r4, r5, pc}
_021F10AC:
	ldrb r0, [r4, #3]
	cmp r0, #1
	bne _021F10C4
	ldr r0, [r4, #4]
	bl ov01_021F1148
	add r0, r5, #0
	bl DestroySysTask
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
_021F10C4:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1094

	thumb_func_start ov01_021F10C8
ov01_021F10C8: ; 0x021F10C8
	push {r4, r5, lr}
	sub sp, #0x3c
	add r4, r1, #0
	add r5, r0, #0
	ldrh r0, [r4]
	cmp r0, #2
	bne _021F1136
	bl sub_02014DA0
	add r1, sp, #0x30
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	ldr r3, _021F113C ; =ov01_022067E0
	str r0, [r1, #8]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x24
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add r0, sp, #0
	bl MTX_Identity33_
	add r0, sp, #0x30
	bl NNS_G3dGlbSetBaseTrans
	add r0, sp, #0x24
	bl NNS_G3dGlbSetBaseScale
	ldr r1, _021F1140 ; =NNS_G3dGlb + 0xBC
	add r0, sp, #0
	bl MI_Copy36B
	ldr r1, _021F1144 ; =NNS_G3dGlb + 0x80
	mov r0, #0xa4
	ldr r2, [r1, #0x7c]
	bic r2, r0
	str r2, [r1, #0x7c]
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov01_021E631C
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov01_021E6340
	mov r0, #0
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #1
	strb r0, [r4, #2]
	add r0, r5, #0
	bl DestroySysTask
_021F1136:
	add sp, #0x3c
	pop {r4, r5, pc}
	nop
_021F113C: .word ov01_022067E0
_021F1140: .word NNS_G3dGlb + 0xBC
_021F1144: .word NNS_G3dGlb + 0x80
	thumb_func_end ov01_021F10C8

	thumb_func_start ov01_021F1148
ov01_021F1148: ; 0x021F1148
	push {r4, r5, lr}
	sub sp, #0x6c
	ldr r5, _021F11F8 ; =ov01_0220689C
	add r4, r0, #0
	add r3, sp, #0x44
	mov r2, #5
_021F1154:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021F1154
	add r0, sp, #0x44
	bl GX_SetBanks
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r5, _021F11FC ; =ov01_022067FC
	add r3, sp, #0x34
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r0, [r4, #8]
	bl ov01_021E6050
	ldr r2, _021F1200 ; =0x0400000E
	mov r0, #0x43
	ldrh r1, [r2]
	and r1, r0
	ldr r0, _021F1204 ; =0x00004884
	orr r0, r1
	strh r0, [r2]
	mov r0, #3
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, sp, #0x24
	bl MTX_Identity22_
	mov r2, #0
	str r2, [sp]
	ldr r0, _021F1208 ; =0x04000030
	add r1, sp, #0x24
	add r3, r2, #0
	str r2, [sp, #4]
	bl G2x_SetBGyAffine_
	ldr r5, _021F120C ; =ov01_02206844
	add r3, sp, #8
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
	ldr r0, [r4, #8]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	mov r3, #4
	bl BG_ClearCharDataRange
	ldr r0, [r4, #8]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0x6c
	pop {r4, r5, pc}
	.balign 4, 0
_021F11F8: .word ov01_0220689C
_021F11FC: .word ov01_022067FC
_021F1200: .word 0x0400000E
_021F1204: .word 0x00004884
_021F1208: .word 0x04000030
_021F120C: .word ov01_02206844
	thumb_func_end ov01_021F1148

	thumb_func_start ov01_021F1210
ov01_021F1210: ; 0x021F1210
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #8]
	bl ov01_021E6048
	pop {r4, pc}
	thumb_func_end ov01_021F1210

	thumb_func_start ov01_021F1224
ov01_021F1224: ; 0x021F1224
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021F124C ; =ov01_02209B64
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _021F1236
	bl GF_AssertFail
_021F1236:
	cmp r4, #0
	beq _021F123E
	bl GF_AssertFail
_021F123E:
	ldr r0, _021F124C ; =ov01_02209B64
	ldr r2, [r0]
	ldr r0, [r2, #0x10]
	add r1, r0, r5
	str r1, [r2, #0x10]
	pop {r3, r4, r5, pc}
	nop
_021F124C: .word ov01_02209B64
	thumb_func_end ov01_021F1224

	thumb_func_start ov01_021F1250
ov01_021F1250: ; 0x021F1250
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021F1278 ; =ov01_02209B64
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _021F1262
	bl GF_AssertFail
_021F1262:
	cmp r4, #0
	beq _021F126A
	bl GF_AssertFail
_021F126A:
	ldr r0, _021F1278 ; =ov01_02209B64
	ldr r2, [r0]
	ldr r0, [r2, #0x14]
	add r1, r0, r5
	str r1, [r2, #0x14]
	pop {r3, r4, r5, pc}
	nop
_021F1278: .word ov01_02209B64
	thumb_func_end ov01_021F1250

	thumb_func_start ov01_021F127C
ov01_021F127C: ; 0x021F127C
	ldr r3, _021F1288 ; =sub_0200E33C
	mov r2, #1
	add r1, r0, #0
	ldr r0, _021F128C ; =ov01_021F1290
	lsl r2, r2, #0xa
	bx r3
	.balign 4, 0
_021F1288: .word sub_0200E33C
_021F128C: .word ov01_021F1290
	thumb_func_end ov01_021F127C

	thumb_func_start ov01_021F1290
ov01_021F1290: ; 0x021F1290
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #8]
	cmp r0, #2
	blo _021F12A4
	ldr r0, [r4]
	bl sub_02014C08
	mov r0, #0
	str r0, [r4, #8]
_021F12A4:
	ldr r0, [r4]
	bl sub_02014C40
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F1290

	thumb_func_start ov01_021F12B4
ov01_021F12B4: ; 0x021F12B4
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl sub_02014AD8
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #8]
	add r0, r4, #0
	bl ov01_021F127C
	str r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F12B4

	thumb_func_start ov01_021F12D0
ov01_021F12D0: ; 0x021F12D0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl DestroySysTask
	ldr r0, [r4]
	bl sub_02014B9C
	ldr r0, [r4]
	bl sub_02014BD8
	pop {r4, pc}
	thumb_func_end ov01_021F12D0

	thumb_func_start ov01_021F12E8
ov01_021F12E8: ; 0x021F12E8
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r4, [sp, #0x20]
	add r5, sp, #0x10
	str r4, [sp]
	mov r4, #0x14
	ldrsh r4, [r5, r4]
	str r4, [sp, #4]
	ldr r4, [sp, #0x28]
	str r4, [sp, #8]
	ldr r4, [sp, #0x2c]
	str r4, [sp, #0xc]
	ldr r4, [sp, #0x30]
	str r4, [sp, #0x10]
	ldr r0, [r0]
	bl sub_02014B08
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F12E8

	thumb_func_start ov01_021F1310
ov01_021F1310: ; 0x021F1310
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, [r0]
	add r7, r1, #0
	bl sub_02014BF8
	add r5, r0, #0
	mov r6, #0
_021F131E:
	ldr r0, [r5]
	add r1, r7, #0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	add r0, r6, #0
	bl _u32_div_f
	mov r1, #1
	tst r0, r1
	bne _021F1336
	lsl r0, r4, #0x10
	b _021F133A
_021F1336:
	neg r0, r4
	lsl r0, r0, #0x10
_021F133A:
	lsr r0, r0, #0x10
	str r0, [r5]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #0xc0
	blt _021F131E
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F1310

	.rodata

ov01_022067D0:
	.byte 0xFF, 0xFB, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov01_022067E0: ; 0x022067E0
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov01_022067FC: ; 0x022067FC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x01
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov01_02206844: ; 0x02206844
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x1F, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00
	.byte 0x2D, 0x00, 0x16, 0x00, 0x2D, 0x00, 0x44, 0x00, 0x5A, 0x00, 0x43, 0x00, 0x5B, 0x00, 0x71, 0x00
	.byte 0x87, 0x00, 0x70, 0x00, 0x87, 0x00, 0x9E, 0x00, 0xB4, 0x00, 0x9D, 0x00

ov01_0220689C: ; 0x0220689C
	.byte 0x06, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov01_022068C4: ; 0x022068C4
	.word ov120_0225FA5C
	.word ov120_0225FA68
	.word ov120_0225FCFC
	.word ov120_0225FD08
	.word ov120_0225FBAC
	.word ov120_0225FBB8
	.word ov119_0225F37C
	.word ov119_0225F020
	.word ov119_0225FA2C
	.word ov119_0225F670
	.word ov119_02260258
	.word ov119_0225FF9C
	.word ov115_0225F704
	.word ov115_0225F728
	.word ov115_0225F74C
	.word ov115_0225F770
	.word ov115_0225F794
	.word ov115_0225F7B8
	.word ov115_0225F7DC
	.word ov115_0225F800
	.word ov115_0225F824
	.word ov115_0225F848
	.word ov115_0225F86C
	.word ov115_0225F890
	.word ov115_0225F8B4
	.word ov115_0225F8D8
	.word ov115_0225F8FC
	.word ov115_0225F920
	.word ov115_0225F944
	.word ov115_022602C0
	.word ov115_022602E4
	.word ov115_02260308
	.word ov115_0226032C
	.word ov115_02260350
	.word ov116_0225F054
	.word ov116_0225F364
	.word ov116_0225F374
	.word ov114_0225F020
	.word ov114_0225F280
	.word ov117_0225F020
	.word ov117_0225F4D4
	.word ov117_0225F4E4
	.word ov117_0225F4F4
	.word ov117_0225F504
	.word ov117_0225F514
	.word ov118_0225F020
	.word ov120_0225F714

ov01_02206980: ; 0x02206980
	.byte 0x00, 0x02, 0x05, 0x07, 0x01, 0x06, 0x03, 0x04

	.bss

ov01_02209B64: ; 0x02209B64
	.space 0xC
