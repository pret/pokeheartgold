; Choose starter application

#include "constants/species.h"
#include "constants/sndseq.h"
#include "msgdata/msg/msg_0190.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov61_021E6FC4
ov61_021E6FC4: ; 0x021E6FC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r0, #0
	ldr r1, [r6, #4]
	mov r0, #0x5d
	bl NARC_ctor
	str r0, [sp, #0x18]
	mov r0, #0xed
	lsl r0, r0, #2
	add r5, r6, r0
	add r0, r5, #0
	str r0, [sp, #0x24]
	add r0, #0x78
	mov r4, #0
	str r5, [sp, #0x14]
	str r6, [sp, #0x10]
	add r7, r5, #0
	str r0, [sp, #0x24]
_021E6FEA:
	str r4, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r6, #4]
	ldr r1, [sp, #0x18]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r2, #9
	mov r3, #0
	bl sub_0200A3C8
	ldr r1, [sp, #0x14]
	mov r2, #6
	str r0, [r1, #0x18]
	str r4, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r6, #4]
	ldr r1, [sp, #0x18]
	str r0, [sp, #0xc]
	ldr r0, [r5, #4]
	mov r3, #0
	bl sub_0200A480
	ldr r1, [sp, #0x14]
	mov r2, #0xa
	str r0, [r1, #0x1c]
	str r4, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r6, #4]
	ldr r1, [sp, #0x18]
	str r0, [sp, #8]
	ldr r0, [r5, #8]
	mov r3, #0
	bl sub_0200A540
	ldr r1, [sp, #0x14]
	mov r2, #0x10
	str r0, [r1, #0x20]
	str r4, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, [r6, #4]
	ldr r1, [sp, #0x18]
	str r0, [sp, #8]
	ldr r0, [r5, #0xc]
	mov r3, #0
	bl sub_0200A540
	ldr r1, [sp, #0x14]
	mov r2, #0
	str r0, [r1, #0x24]
	ldr r1, [sp, #0x10]
	ldr r0, _021E7104 ; =0x00000578
	ldr r0, [r1, r0]
	mov r1, #5
	bl GetMonData
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	ldr r0, _021E7104 ; =0x00000578
	mov r2, #0
	ldr r0, [r1, r0]
	mov r1, #0x6f
	bl GetMonData
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	ldr r0, _021E7104 ; =0x00000578
	ldr r0, [r1, r0]
	bl MonIsShiny
	str r0, [sp]
	mov r0, #0
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	str r0, [sp, #4]
	str r0, [sp, #8]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x18
	ldr r0, [sp, #0x24]
	lsr r1, r1, #0x10
	lsr r2, r2, #0x18
	mov r3, #2
	bl sub_020701E4
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x78
	add r1, #0x7a
	ldrh r0, [r0]
	ldrh r1, [r1]
	ldr r2, [r6, #4]
	bl sub_0201442C
	str r0, [r7, #0x60]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x78
	add r1, #0x7c
	ldrh r0, [r0]
	ldrh r1, [r1]
	ldr r2, [r6, #4]
	bl sub_02014450
	str r0, [r7, #0x6c]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r2, [r7, #0x60]
	ldr r3, [r7, #0x6c]
	bl ov61_021E7108
	lsl r1, r4, #0x18
	ldr r2, [r6, #4]
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov61_021E7188
	ldr r0, [sp, #0x14]
	add r4, r4, #1
	add r0, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r7, r7, #4
	add r0, r0, #4
	str r0, [sp, #0x10]
	cmp r4, #3
	bge _021E70F8
	b _021E6FEA
_021E70F8:
	ldr r0, [sp, #0x18]
	bl NARC_dtor
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7104: .word 0x00000578
	thumb_func_end ov61_021E6FC4

	thumb_func_start ov61_021E7108
ov61_021E7108: ; 0x021E7108
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	add r1, sp, #0x10
	ldrb r1, [r1, #0x10]
	add r4, r2, #0
	add r6, r3, #0
	str r1, [sp]
	bl sub_0200A7BC
	add r5, r0, #0
	ldr r1, [sp]
	add r0, r7, #0
	bl sub_0200A7BC
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0200ADA4
	add r0, r7, #0
	bl sub_0200B00C
	add r0, r5, #0
	bl sub_0200AF00
	add r5, r0, #0
	add r0, r7, #0
	add r1, r5, #0
	bl sub_0200B0F8
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #2
	bl NNS_G2dGetImageLocation
	str r0, [sp, #4]
	add r0, r7, #0
	mov r1, #2
	bl NNS_G2dGetImagePaletteLocation
	mov r1, #0x32
	add r5, r0, #0
	add r0, r4, #0
	lsl r1, r1, #6
	bl DC_FlushRange
	mov r2, #0x32
	ldr r1, [sp, #4]
	add r0, r4, #0
	lsl r2, r2, #6
	bl GXS_LoadOBJ
	add r0, r6, #0
	mov r1, #0x20
	bl DC_FlushRange
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #0x20
	bl GXS_LoadOBJPltt
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov61_021E7108

	thumb_func_start ov61_021E7188
ov61_021E7188: ; 0x021E7188
	push {r4, r5, r6, lr}
	sub sp, #0x80
	add r4, r1, #0
	add r5, r0, #0
	mov r0, #0
	str r4, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r6, r2, #0
	ldr r2, [r5]
	add r3, r4, #0
	str r2, [sp, #0x14]
	ldr r2, [r5, #4]
	str r2, [sp, #0x18]
	ldr r2, [r5, #8]
	str r2, [sp, #0x1c]
	ldr r2, [r5, #0xc]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x5c
	add r2, r4, #0
	bl sub_02009D48
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	str r0, [sp, #0x2c]
	add r0, sp, #0x5c
	str r0, [sp, #0x30]
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [sp, #0x34]
	str r1, [sp, #0x38]
	str r1, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r1, [r0, #0x20]
	mov r0, #2
	str r0, [sp, #0x54]
	lsl r0, r0, #0x12
	str r0, [sp, #0x34]
	mov r0, #0x12
	lsl r0, r0, #0x10
	str r0, [sp, #0x38]
	mov r0, #0x6d
	lsl r0, r0, #2
	add r5, r5, r0
	str r1, [sp, #0x50]
	str r6, [sp, #0x58]
	lsl r4, r4, #2
	add r0, sp, #0x2c
	bl sub_02024624
	str r0, [r5, r4]
	ldr r0, [r5, r4]
	mov r1, #0
	bl sub_0202484C
	ldr r0, [r5, r4]
	mov r1, #0
	bl sub_020248F0
	ldr r0, [r5, r4]
	mov r1, #0
	bl sub_02024830
	add sp, #0x80
	pop {r4, r5, r6, pc}
	thumb_func_end ov61_021E7188

	thumb_func_start ov61_021E7220
ov61_021E7220: ; 0x021E7220
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xed
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov61_021E7248
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _021E7244 ; =0x00000568
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_02024830
	pop {r4, pc}
	.balign 4, 0
_021E7244: .word 0x00000568
	thumb_func_end ov61_021E7220

	thumb_func_start ov61_021E7248
ov61_021E7248: ; 0x021E7248
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r6, #0x6d
	add r5, r0, #0
	add r7, r4, #0
	lsl r6, r6, #2
_021E7254:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl sub_02024830
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _021E7254
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov61_021E7248

	thumb_func_start ov61_021E7268
ov61_021E7268: ; 0x021E7268
	push {r0, r1, r2, r3}
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	mov r2, #0xe5
	lsl r2, r2, #2
	add r4, r0, #0
	add r0, r2, #0
	add r0, #0x13
	ldrb r0, [r4, r0]
	ldr r5, [r4, r2]
	mov r3, #8
	add r1, r0, #1
	add r0, r2, #0
	add r0, #0x13
	strb r1, [r4, r0]
	add r2, #0x13
	ldrb r2, [r4, r2]
	add r0, sp, #0x54
	add r1, sp, #0x58
	bl ov61_021E7348
	add r2, sp, #0xc
	ldr r3, _021E7330 ; =ov61_021E73D4
	add r6, r0, #0
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021E7334 ; =ov61_021E738C
	str r0, [r2]
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	mov ip, r2
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [sp, #4]
	ldr r0, _021E7338 ; =0x0000D73F
	add r2, r7, #0
	add r0, r1, r0
	str r0, [sp, #4]
	add r0, r7, #0
	mov r1, ip
	bl VEC_Subtract
	asr r0, r6, #4
	lsl r3, r0, #1
	lsl r1, r3, #1
	ldr r2, _021E733C ; =FX_SinCosTable_
	add r3, r3, #1
	lsl r3, r3, #1
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	add r0, sp, #0x18
	bl MTX_RotX33_
	add r0, r7, #0
	add r1, sp, #0x18
	add r2, r0, #0
	bl MTX_MultVec33
	add r0, r7, #0
	add r1, sp, #0
	add r2, r0, #0
	bl VEC_Add
	add r2, r4, #0
	add r1, r5, #3
	mov r0, #0x78
	mul r0, r1
	add r2, #0x70
	add r0, r2, r0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl ov61_021E6934
	mov r0, #0x78
	mul r0, r5
	add r1, r4, r0
	ldr r0, _021E7340 ; =0x0000024E
	strh r6, [r1, r0]
	ldr r0, _021E7344 ; =0x000003A7
	ldrb r1, [r4, r0]
	cmp r1, #8
	blo _021E7324
	mov r1, #0
	strb r1, [r4, r0]
	add sp, #0x3c
	mov r0, #1
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
_021E7324:
	mov r0, #0
	add sp, #0x3c
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_021E7330: .word ov61_021E73D4
_021E7334: .word ov61_021E738C
_021E7338: .word 0x0000D73F
_021E733C: .word FX_SinCosTable_
_021E7340: .word 0x0000024E
_021E7344: .word 0x000003A7
	thumb_func_end ov61_021E7268

	thumb_func_start ov61_021E7348
ov61_021E7348: ; 0x021E7348
	push {r4, lr}
	ldr r4, [r0]
	ldr r0, [r1]
	cmp r0, r4
	blt _021E7364
	sub r0, r0, r4
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	add r0, r1, #0
	mul r0, r2
	add r1, r3, #0
	bl _s32_div_f
	b _021E7376
_021E7364:
	sub r0, r4, r0
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	add r0, r1, #0
	mul r0, r2
	add r1, r3, #0
	bl _s32_div_f
	neg r0, r0
_021E7376:
	add r0, r4, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov61_021E7348

	.rodata

	.public ov61_021E7380
ov61_021E7380:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00

	.public ov61_021E738C
ov61_021E738C: ; 0x021E738C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00

	.public ov61_021E7398
ov61_021E7398: ; 0x021E7398
	.word SPECIES_CHIKORITA
	.word SPECIES_CYNDAQUIL
	.word SPECIES_TOTODILE

	.public ov61_021E73A4
ov61_021E73A4: ; 0x021E73A4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00

	.public ov61_021E73B0
ov61_021E73B0: ; 0x021E73B0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00

	.public ov61_021E73BC
ov61_021E73BC: ; 0x021E73BC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00

	.public ov61_021E73C8
ov61_021E73C8: ; 0x021E73C8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xE0, 0x00, 0x00

ov61_021E73D4: ; 0x021E73D4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00

	.public ov61_021E73E0
ov61_021E73E0: ; 0x021E73E0
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

	.public ov61_021E73EC
ov61_021E73EC: ; 0x021E73EC
	.byte 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

	.public ov61_021E73F8
ov61_021E73F8: ; 0x021E73F8
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.public ov61_021E7408
ov61_021E7408: ; 0x021E7408
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x05, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.public ov61_021E7424
ov61_021E7424: ; 0x021E7424
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.public ov61_021E7440
ov61_021E7440: ; 0x021E7440
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.public ov61_021E745C
ov61_021E745C: ; 0x021E745C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.public ov61_021E7478
ov61_021E7478: ; 0x021E7478
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x03, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.public ov61_021E7494
ov61_021E7494: ; 0x021E7494
	.byte 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	; 0x021E74BC
