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
	.include "overlay_01_021EA8E0.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021EA8E0
ov01_021EA8E0: ; 0x021EA8E0
	push {r4, lr}
	mov r0, #4
	mov r1, #0x48
	bl Heap_Alloc
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x48
	bl MIi_CpuClear32
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EA8E0

	thumb_func_start ov01_021EA8FC
ov01_021EA8FC: ; 0x021EA8FC
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #4
	bl Heap_FreeExplicit
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EA8FC

	thumb_func_start ov01_021EA910
ov01_021EA910: ; 0x021EA910
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #8]
	add r7, r1, #0
	mov r4, #0
	add r5, r0, #0
	add r6, r0, #0
_021EA91E:
	mov r0, #1
	lsl r0, r4
	tst r0, r7
	beq _021EA938
	mov r1, #0
	mov r2, #2
	mov r3, #4
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	add r0, r4, #0
	bl NNS_G3dGlbLightVector
_021EA938:
	add r1, r4, #4
	mov r0, #1
	lsl r0, r1
	tst r0, r7
	beq _021EA94A
	ldrh r1, [r6, #0x18]
	add r0, r4, #0
	bl NNS_G3dGlbLightColor
_021EA94A:
	add r4, r4, #1
	add r5, r5, #6
	add r6, r6, #2
	cmp r4, #4
	blt _021EA91E
	mov r0, #3
	lsl r0, r0, #8
	tst r0, r7
	beq _021EA96C
	ldr r0, [sp, #8]
	ldr r1, [sp, #8]
	ldr r2, [sp, #8]
	ldrh r0, [r0, #0x20]
	ldrh r1, [r1, #0x22]
	ldr r2, [r2, #0x28]
	bl NNS_G3dGlbMaterialColorDiffAmb
_021EA96C:
	mov r0, #3
	lsl r0, r0, #0xa
	tst r0, r7
	beq _021EA984
	ldr r0, [sp, #8]
	ldr r1, [sp, #8]
	ldr r2, [sp, #8]
	ldrh r0, [r0, #0x24]
	ldrh r1, [r1, #0x26]
	ldr r2, [r2, #0x2c]
	bl NNS_G3dGlbMaterialColorSpecEmi
_021EA984:
	mov r0, #1
	lsl r0, r0, #0xc
	cmp r7, r0
	blt _021EA9AC
	ldr r0, [sp, #8]
	ldr r1, [sp, #8]
	ldr r0, [r0, #0x40]
	ldr r2, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #8]
	ldr r3, [sp, #8]
	ldr r0, [r0, #0x44]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [r1, #0x34]
	ldr r0, [r0, #0x30]
	ldr r2, [r2, #0x38]
	ldr r3, [r3, #0x3c]
	bl NNS_G3dGlbPolygonAttr
_021EA9AC:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021EA910

	thumb_func_start ov01_021EA9B0
ov01_021EA9B0: ; 0x021EA9B0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #1
	add r4, r2, #0
	lsl r0, r0, #8
	add r6, r1, #0
	tst r0, r4
	beq _021EA9C8
	ldrh r1, [r5, #0x20]
	add r0, r6, #0
	bl NNS_G3dMdlSetMdlDiffAll
_021EA9C8:
	mov r0, #2
	lsl r0, r0, #8
	tst r0, r4
	beq _021EA9D8
	ldrh r1, [r5, #0x22]
	add r0, r6, #0
	bl NNS_G3dMdlSetMdlAmbAll
_021EA9D8:
	mov r0, #1
	lsl r0, r0, #0xa
	tst r0, r4
	beq _021EA9E8
	ldrh r1, [r5, #0x24]
	add r0, r6, #0
	bl NNS_G3dMdlSetMdlSpecAll
_021EA9E8:
	mov r0, #2
	lsl r0, r0, #0xa
	tst r0, r4
	beq _021EA9F8
	ldrh r1, [r5, #0x26]
	add r0, r6, #0
	bl NNS_G3dMdlSetMdlEmiAll
_021EA9F8:
	mov r0, #1
	lsl r0, r0, #0xc
	tst r0, r4
	beq _021EAA08
	ldr r1, [r5, #0x30]
	add r0, r6, #0
	bl NNS_G3dMdlSetMdlLightEnableFlagAll
_021EAA08:
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r4
	beq _021EAA18
	ldr r1, [r5, #0x34]
	add r0, r6, #0
	bl NNS_G3dMdlSetMdlPolygonModeAll
_021EAA18:
	mov r0, #1
	lsl r0, r0, #0xe
	tst r0, r4
	beq _021EAA28
	ldr r1, [r5, #0x38]
	add r0, r6, #0
	bl NNS_G3dMdlSetMdlCullModeAll
_021EAA28:
	mov r0, #2
	lsl r0, r0, #0xe
	tst r0, r4
	beq _021EAA38
	ldr r1, [r5, #0x3c]
	add r0, r6, #0
	bl NNS_G3dMdlSetMdlPolygonIDAll
_021EAA38:
	mov r0, #1
	lsl r0, r0, #0x10
	tst r0, r4
	beq _021EAA48
	ldr r1, [r5, #0x40]
	add r0, r6, #0
	bl NNS_G3dMdlSetMdlAlphaAll
_021EAA48:
	mov r1, #2
	lsl r1, r1, #0x10
	add r0, r4, #0
	tst r0, r1
	beq _021EAA5E
	ldr r2, [r5, #0x44]
	lsr r1, r1, #2
	add r0, r6, #0
	and r1, r2
	bl NNS_G3dMdlSetMdlFogEnableFlagAll
_021EAA5E:
	mov r1, #1
	lsl r1, r1, #0x12
	add r0, r4, #0
	tst r0, r1
	beq _021EAA74
	ldr r2, [r5, #0x44]
	lsr r1, r1, #4
	add r0, r6, #0
	and r1, r2
	bl NNS_G3dMdlSetMdlDepthTestCondAll
_021EAA74:
	mov r1, #2
	lsl r1, r1, #0x12
	add r0, r4, #0
	tst r0, r1
	beq _021EAA8A
	ldr r2, [r5, #0x44]
	lsr r1, r1, #6
	add r0, r6, #0
	and r1, r2
	bl NNS_G3dMdlSetMdl1DotAll
_021EAA8A:
	mov r1, #1
	lsl r1, r1, #0x14
	add r0, r4, #0
	tst r0, r1
	beq _021EAAA0
	ldr r2, [r5, #0x44]
	lsr r1, r1, #8
	add r0, r6, #0
	and r1, r2
	bl NNS_G3dMdlSetMdlFarClipAll
_021EAAA0:
	mov r1, #2
	lsl r1, r1, #0x14
	add r0, r4, #0
	tst r0, r1
	beq _021EAAB6
	ldr r2, [r5, #0x44]
	lsr r1, r1, #0xa
	add r0, r6, #0
	and r1, r2
	bl NNS_G3dMdlSetMdlXLDepthUpdateAll
_021EAAB6:
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021EA9B0

	thumb_func_start ov01_021EAAB8
ov01_021EAAB8: ; 0x021EAAB8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #6
	add r4, r1, #0
	mul r4, r0
	strh r2, [r5, r4]
	add r2, r5, #2
	strh r3, [r2, r4]
	add r6, sp, #0
	mov r0, #0x10
	ldrsh r0, [r6, r0]
	add r3, r5, #4
	strh r0, [r3, r4]
	add r0, r1, #0
	ldrsh r1, [r5, r4]
	ldrsh r2, [r2, r4]
	ldrsh r3, [r3, r4]
	bl NNS_G3dGlbLightVector
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021EAAB8

	thumb_func_start ov01_021EAAE0
ov01_021EAAE0: ; 0x021EAAE0
	push {r4, lr}
	add r4, r0, #0
	add r4, #0x18
	lsl r3, r1, #1
	strh r2, [r4, r3]
	add r0, r1, #0
	ldrh r1, [r4, r3]
	bl NNS_G3dGlbLightColor
	pop {r4, pc}
	thumb_func_end ov01_021EAAE0

	thumb_func_start ov01_021EAAF4
ov01_021EAAF4: ; 0x021EAAF4
	push {r3, lr}
	strh r1, [r0, #0x20]
	str r2, [r0, #0x28]
	cmp r3, #1
	bne _021EAB06
	mov r1, #1
	lsl r1, r1, #8
	bl ov01_021EA910
_021EAB06:
	pop {r3, pc}
	thumb_func_end ov01_021EAAF4

	thumb_func_start ov01_021EAB08
ov01_021EAB08: ; 0x021EAB08
	push {r3, lr}
	strh r1, [r0, #0x22]
	cmp r2, #1
	bne _021EAB18
	mov r1, #2
	lsl r1, r1, #8
	bl ov01_021EA910
_021EAB18:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021EAB08

	thumb_func_start ov01_021EAB1C
ov01_021EAB1C: ; 0x021EAB1C
	push {r3, lr}
	strh r1, [r0, #0x24]
	str r2, [r0, #0x2c]
	cmp r3, #1
	bne _021EAB2E
	mov r1, #1
	lsl r1, r1, #0xa
	bl ov01_021EA910
_021EAB2E:
	pop {r3, pc}
	thumb_func_end ov01_021EAB1C

	thumb_func_start ov01_021EAB30
ov01_021EAB30: ; 0x021EAB30
	push {r3, lr}
	strh r1, [r0, #0x26]
	cmp r2, #1
	bne _021EAB40
	mov r1, #2
	lsl r1, r1, #0xa
	bl ov01_021EA910
_021EAB40:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021EAB30

	thumb_func_start ov01_021EAB44
ov01_021EAB44: ; 0x021EAB44
	push {r3, lr}
	str r1, [r0, #0x34]
	cmp r2, #1
	bne _021EAB54
	mov r1, #2
	lsl r1, r1, #0xc
	bl ov01_021EA910
_021EAB54:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021EAB44

	thumb_func_start ov01_021EAB58
ov01_021EAB58: ; 0x021EAB58
	push {r3, lr}
	str r1, [r0, #0x38]
	cmp r2, #1
	bne _021EAB68
	mov r1, #1
	lsl r1, r1, #0xe
	bl ov01_021EA910
_021EAB68:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021EAB58

	thumb_func_start ov01_021EAB6C
ov01_021EAB6C: ; 0x021EAB6C
	push {r3, lr}
	str r1, [r0, #0x40]
	cmp r2, #1
	bne _021EAB7C
	mov r1, #1
	lsl r1, r1, #0x10
	bl ov01_021EA910
_021EAB7C:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021EAB6C

	thumb_func_start ov01_021EAB80
ov01_021EAB80: ; 0x021EAB80
	push {r3, lr}
	cmp r2, #1
	ldr r2, [r0, #0x44]
	bne _021EAB8E
	tst r2, r1
	beq _021EAB92
	pop {r3, pc}
_021EAB8E:
	tst r2, r1
	beq _021EABA4
_021EAB92:
	ldr r2, [r0, #0x44]
	eor r1, r2
	str r1, [r0, #0x44]
	cmp r3, #1
	bne _021EABA4
	mov r1, #1
	lsl r1, r1, #0xc
	bl ov01_021EA910
_021EABA4:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021EAB80
