	.include "asm/macros.inc"
	.include "gx_vramcnt.inc"
	.include "global.inc"

	.public gGXState
	.public GXi_VRamLockId

	.text

	arm_func_start GX_VRAMCNT_SetLCDC_
GX_VRAMCNT_SetLCDC_: ; 0x020CDB4C
	tst r0, #1
	ldrne r1, _020CDBE0 ; =0x04000240
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #2
	ldrne r1, _020CDBE4 ; =0x04000241
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #4
	ldrne r1, _020CDBE8 ; =0x04000242
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #8
	ldrne r1, _020CDBEC ; =0x04000243
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #0x10
	ldrne r1, _020CDBF0 ; =0x04000244
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #0x20
	ldrne r1, _020CDBF4 ; =0x04000245
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #0x40
	ldrne r1, _020CDBF8 ; =0x04000246
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #0x80
	ldrne r1, _020CDBFC ; =0x04000248
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #0x100
	ldrne r0, _020CDC00 ; =0x04000249
	movne r1, #0x80
	strneb r1, [r0]
	bx lr
	.align 2, 0
_020CDBE0: .word 0x04000240
_020CDBE4: .word 0x04000241
_020CDBE8: .word 0x04000242
_020CDBEC: .word 0x04000243
_020CDBF0: .word 0x04000244
_020CDBF4: .word 0x04000245
_020CDBF8: .word 0x04000246
_020CDBFC: .word 0x04000248
_020CDC00: .word 0x04000249
	arm_func_end GX_VRAMCNT_SetLCDC_

	arm_func_start GX_SetBankForBG
GX_SetBankForBG: ; 0x020CDC04
	stmdb sp!, {r3, lr}
	ldr r1, _020CDE74 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #2]
	cmp r0, #0x40
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #2]
	bgt _020CDCDC
	cmp r0, #0x40
	bge _020CDE58
	cmp r0, #0x20
	bgt _020CDCD0
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _020CDE64
_020CDC4C: ; jump table
	b _020CDE64 ; case 0
	b _020CDD78 ; case 1
	b _020CDD44 ; case 2
	b _020CDD6C ; case 3
	b _020CDD1C ; case 4
	b _020CDDB4 ; case 5
	b _020CDD38 ; case 6
	b _020CDD60 ; case 7
	b _020CDD00 ; case 8
	b _020CDDCC ; case 9
	b _020CDDE4 ; case 10
	b _020CDD88 ; case 11
	b _020CDD10 ; case 12
	b _020CDDA8 ; case 13
	b _020CDD2C ; case 14
	b _020CDD54 ; case 15
	b _020CDE14 ; case 16
	b _020CDE64 ; case 17
	b _020CDE64 ; case 18
	b _020CDE64 ; case 19
	b _020CDE64 ; case 20
	b _020CDE64 ; case 21
	b _020CDE64 ; case 22
	b _020CDE64 ; case 23
	b _020CDE64 ; case 24
	b _020CDE64 ; case 25
	b _020CDE64 ; case 26
	b _020CDE64 ; case 27
	b _020CDE64 ; case 28
	b _020CDE64 ; case 29
	b _020CDE64 ; case 30
	b _020CDE64 ; case 31
	b _020CDE48 ; case 32
_020CDCD0:
	cmp r0, #0x30
	beq _020CDE08
	b _020CDE64
_020CDCDC:
	cmp r0, #0x60
	bgt _020CDCF4
	bge _020CDE3C
	cmp r0, #0x50
	beq _020CDE24
	b _020CDE64
_020CDCF4:
	cmp r0, #0x70
	beq _020CDDFC
	b _020CDE64
_020CDD00:
	ldr r0, _020CDE78 ; =0x04000243
	mov r1, #0x81
	strb r1, [r0]
	b _020CDE64
_020CDD10:
	ldr r0, _020CDE78 ; =0x04000243
	mov r1, #0x89
	strb r1, [r0]
_020CDD1C:
	ldr r0, _020CDE7C ; =0x04000242
	mov r1, #0x81
	strb r1, [r0]
	b _020CDE64
_020CDD2C:
	ldr r0, _020CDE78 ; =0x04000243
	mov r1, #0x91
	strb r1, [r0]
_020CDD38:
	ldr r0, _020CDE7C ; =0x04000242
	mov r1, #0x89
	strb r1, [r0]
_020CDD44:
	ldr r0, _020CDE80 ; =0x04000241
	mov r1, #0x81
	strb r1, [r0]
	b _020CDE64
_020CDD54:
	ldr r0, _020CDE78 ; =0x04000243
	mov r1, #0x99
	strb r1, [r0]
_020CDD60:
	ldr r0, _020CDE7C ; =0x04000242
	mov r1, #0x91
	strb r1, [r0]
_020CDD6C:
	ldr r0, _020CDE80 ; =0x04000241
	mov r1, #0x89
	strb r1, [r0]
_020CDD78:
	ldr r0, _020CDE84 ; =0x04000240
	mov r1, #0x81
	strb r1, [r0]
	b _020CDE64
_020CDD88:
	ldr r1, _020CDE84 ; =0x04000240
	mov r0, #0x81
	strb r0, [r1]
	mov r0, #0x89
	strb r0, [r1, #1]
	mov r0, #0x91
	strb r0, [r1, #3]
	b _020CDE64
_020CDDA8:
	ldr r0, _020CDE78 ; =0x04000243
	mov r1, #0x91
	strb r1, [r0]
_020CDDB4:
	ldr r1, _020CDE84 ; =0x04000240
	mov r0, #0x81
	strb r0, [r1]
	mov r0, #0x89
	strb r0, [r1, #2]
	b _020CDE64
_020CDDCC:
	ldr r1, _020CDE84 ; =0x04000240
	mov r0, #0x81
	strb r0, [r1]
	mov r0, #0x89
	strb r0, [r1, #3]
	b _020CDE64
_020CDDE4:
	ldr r1, _020CDE80 ; =0x04000241
	mov r0, #0x81
	strb r0, [r1]
	mov r0, #0x89
	strb r0, [r1, #2]
	b _020CDE64
_020CDDFC:
	ldr r0, _020CDE88 ; =0x04000246
	mov r1, #0x99
	strb r1, [r0]
_020CDE08:
	ldr r0, _020CDE8C ; =0x04000245
	mov r1, #0x91
	strb r1, [r0]
_020CDE14:
	ldr r0, _020CDE90 ; =0x04000244
	mov r1, #0x81
	strb r1, [r0]
	b _020CDE64
_020CDE24:
	ldr r1, _020CDE88 ; =0x04000246
	mov r0, #0x91
	strb r0, [r1]
	mov r0, #0x81
	strb r0, [r1, #-2]
	b _020CDE64
_020CDE3C:
	ldr r0, _020CDE88 ; =0x04000246
	mov r1, #0x89
	strb r1, [r0]
_020CDE48:
	ldr r0, _020CDE8C ; =0x04000245
	mov r1, #0x81
	strb r1, [r0]
	b _020CDE64
_020CDE58:
	ldr r0, _020CDE88 ; =0x04000246
	mov r1, #0x81
	strb r1, [r0]
_020CDE64:
	ldr r0, _020CDE74 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CDE74: .word gGXState
_020CDE78: .word 0x04000243
_020CDE7C: .word 0x04000242
_020CDE80: .word 0x04000241
_020CDE84: .word 0x04000240
_020CDE88: .word 0x04000246
_020CDE8C: .word 0x04000245
_020CDE90: .word 0x04000244
	arm_func_end GX_SetBankForBG

	arm_func_start GX_SetBankForOBJ
GX_SetBankForOBJ: ; 0x020CDE94
	stmdb sp!, {r3, lr}
	ldr r1, _020CDFCC ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #4]
	cmp r0, #0x30
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #4]
	bgt _020CDEFC
	cmp r0, #0x30
	bge _020CDF70
	cmp r0, #0x10
	bgt _020CDEF0
	bge _020CDF7C
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020CDFBC
_020CDEE0: ; jump table
	b _020CDFBC ; case 0
	b _020CDF44 ; case 1
	b _020CDF54 ; case 2
	b _020CDF38 ; case 3
_020CDEF0:
	cmp r0, #0x20
	beq _020CDFB0
	b _020CDFBC
_020CDEFC:
	cmp r0, #0x50
	bgt _020CDF1C
	bge _020CDF8C
	cmp r0, #0x40
	ldreq r0, _020CDFD0 ; =0x04000246
	moveq r1, #0x82
	streqb r1, [r0]
	b _020CDFBC
_020CDF1C:
	cmp r0, #0x60
	bgt _020CDF2C
	beq _020CDFA4
	b _020CDFBC
_020CDF2C:
	cmp r0, #0x70
	beq _020CDF64
	b _020CDFBC
_020CDF38:
	ldr r0, _020CDFD4 ; =0x04000241
	mov r1, #0x8a
	strb r1, [r0]
_020CDF44:
	ldr r0, _020CDFD8 ; =0x04000240
	mov r1, #0x82
	strb r1, [r0]
	b _020CDFBC
_020CDF54:
	ldr r0, _020CDFD4 ; =0x04000241
	mov r1, #0x82
	strb r1, [r0]
	b _020CDFBC
_020CDF64:
	ldr r0, _020CDFD0 ; =0x04000246
	mov r1, #0x9a
	strb r1, [r0]
_020CDF70:
	ldr r0, _020CDFDC ; =0x04000245
	mov r1, #0x92
	strb r1, [r0]
_020CDF7C:
	ldr r0, _020CDFE0 ; =0x04000244
	mov r1, #0x82
	strb r1, [r0]
	b _020CDFBC
_020CDF8C:
	ldr r1, _020CDFD0 ; =0x04000246
	mov r0, #0x92
	strb r0, [r1]
	mov r0, #0x82
	strb r0, [r1, #-2]
	b _020CDFBC
_020CDFA4:
	ldr r0, _020CDFD0 ; =0x04000246
	mov r1, #0x8a
	strb r1, [r0]
_020CDFB0:
	ldr r0, _020CDFDC ; =0x04000245
	mov r1, #0x82
	strb r1, [r0]
_020CDFBC:
	ldr r0, _020CDFCC ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CDFCC: .word gGXState
_020CDFD0: .word 0x04000246
_020CDFD4: .word 0x04000241
_020CDFD8: .word 0x04000240
_020CDFDC: .word 0x04000245
_020CDFE0: .word 0x04000244
	arm_func_end GX_SetBankForOBJ

	arm_func_start GX_SetBankForBGExtPltt
GX_SetBankForBGExtPltt: ; 0x020CDFE4
	stmdb sp!, {r3, lr}
	ldr r1, _020CE0D8 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0xe]
	cmp r0, #0x20
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0xe]
	bgt _020CE034
	cmp r0, #0x20
	bge _020CE098
	cmp r0, #0
	bgt _020CE028
	beq _020CE0B8
	b _020CE0C8
_020CE028:
	cmp r0, #0x10
	beq _020CE050
	b _020CE0C8
_020CE034:
	cmp r0, #0x40
	bgt _020CE044
	beq _020CE06C
	b _020CE0C8
_020CE044:
	cmp r0, #0x60
	beq _020CE08C
	b _020CE0C8
_020CE050:
	mov r2, #0x4000000
	ldr r1, [r2]
	mov r0, #0x84
	orr r1, r1, #0x40000000
	str r1, [r2]
	strb r0, [r2, #0x244]
	b _020CE0C8
_020CE06C:
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr r0, _020CE0DC ; =0x04000246
	orr r1, r1, #0x40000000
	str r1, [r2]
	mov r1, #0x8c
	strb r1, [r0]
	b _020CE0C8
_020CE08C:
	ldr r0, _020CE0DC ; =0x04000246
	mov r1, #0x8c
	strb r1, [r0]
_020CE098:
	ldr r0, _020CE0E0 ; =0x04000245
	mov r1, #0x84
	strb r1, [r0]
	mov r1, #0x4000000
	ldr r0, [r1]
	orr r0, r0, #0x40000000
	str r0, [r1]
	b _020CE0C8
_020CE0B8:
	mov r1, #0x4000000
	ldr r0, [r1]
	bic r0, r0, #0x40000000
	str r0, [r1]
_020CE0C8:
	ldr r0, _020CE0D8 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CE0D8: .word gGXState
_020CE0DC: .word 0x04000246
_020CE0E0: .word 0x04000245
	arm_func_end GX_SetBankForBGExtPltt

	arm_func_start GX_SetBankForOBJExtPltt
GX_SetBankForOBJExtPltt: ; 0x020CE0E4
	stmdb sp!, {r3, lr}
	ldr r1, _020CE184 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0x10]
	cmp r0, #0
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0x10]
	beq _020CE164
	cmp r0, #0x20
	beq _020CE124
	cmp r0, #0x40
	beq _020CE144
	b _020CE174
_020CE124:
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr r0, _020CE188 ; =0x04000245
	orr r1, r1, #0x80000000
	str r1, [r2]
	mov r1, #0x85
	strb r1, [r0]
	b _020CE174
_020CE144:
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr r0, _020CE18C ; =0x04000246
	orr r1, r1, #0x80000000
	str r1, [r2]
	mov r1, #0x85
	strb r1, [r0]
	b _020CE174
_020CE164:
	mov r1, #0x4000000
	ldr r0, [r1]
	bic r0, r0, #0x80000000
	str r0, [r1]
_020CE174:
	ldr r0, _020CE184 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CE184: .word gGXState
_020CE188: .word 0x04000245
_020CE18C: .word 0x04000246
	arm_func_end GX_SetBankForOBJExtPltt

	arm_func_start GX_SetBankForTex
GX_SetBankForTex: ; 0x020CE190
	stmdb sp!, {r3, lr}
	ldr r1, _020CE34C ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #8]
	cmp r0, #0
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #8]
	ldr r2, _020CE350 ; =0x04000060
	bne _020CE1D4
	ldrh r1, [r2]
	ldr r0, _020CE354 ; =0x0000CFFE
	and r0, r1, r0
	strh r0, [r2]
	b _020CE33C
_020CE1D4:
	ldrh r1, [r2]
	cmp r0, #0xf
	bic r1, r1, #0x3000
	orr r1, r1, #1
	strh r1, [r2]
	addls pc, pc, r0, lsl #2
	b _020CE33C
_020CE1F0: ; jump table
	b _020CE33C ; case 0
	b _020CE330 ; case 1
	b _020CE2FC ; case 2
	b _020CE324 ; case 3
	b _020CE2D4 ; case 4
	b _020CE230 ; case 5
	b _020CE2F0 ; case 6
	b _020CE318 ; case 7
	b _020CE2B8 ; case 8
	b _020CE248 ; case 9
	b _020CE260 ; case 10
	b _020CE278 ; case 11
	b _020CE2C8 ; case 12
	b _020CE298 ; case 13
	b _020CE2E4 ; case 14
	b _020CE30C ; case 15
_020CE230:
	mov r1, #0x83
	ldr r0, _020CE358 ; =0x04000242
	strb r1, [r2, #0x1e0]
	mov r1, #0x8b
	strb r1, [r0]
	b _020CE33C
_020CE248:
	mov r1, #0x83
	ldr r0, _020CE35C ; =0x04000243
	strb r1, [r2, #0x1e0]
	mov r1, #0x8b
	strb r1, [r0]
	b _020CE33C
_020CE260:
	ldr r1, _020CE360 ; =0x04000241
	mov r0, #0x83
	strb r0, [r1]
	mov r0, #0x8b
	strb r0, [r1, #2]
	b _020CE33C
_020CE278:
	mov r0, #0x83
	ldr r1, _020CE360 ; =0x04000241
	strb r0, [r2, #0x1e0]
	mov r0, #0x8b
	strb r0, [r1]
	mov r0, #0x93
	strb r0, [r1, #2]
	b _020CE33C
_020CE298:
	mov r0, #0x83
	ldr r1, _020CE358 ; =0x04000242
	strb r0, [r2, #0x1e0]
	mov r0, #0x8b
	strb r0, [r1]
	mov r0, #0x93
	strb r0, [r1, #1]
	b _020CE33C
_020CE2B8:
	ldr r0, _020CE35C ; =0x04000243
	mov r1, #0x83
	strb r1, [r0]
	b _020CE33C
_020CE2C8:
	ldr r0, _020CE35C ; =0x04000243
	mov r1, #0x8b
	strb r1, [r0]
_020CE2D4:
	ldr r0, _020CE358 ; =0x04000242
	mov r1, #0x83
	strb r1, [r0]
	b _020CE33C
_020CE2E4:
	ldr r0, _020CE35C ; =0x04000243
	mov r1, #0x93
	strb r1, [r0]
_020CE2F0:
	ldr r0, _020CE358 ; =0x04000242
	mov r1, #0x8b
	strb r1, [r0]
_020CE2FC:
	ldr r0, _020CE360 ; =0x04000241
	mov r1, #0x83
	strb r1, [r0]
	b _020CE33C
_020CE30C:
	ldr r0, _020CE35C ; =0x04000243
	mov r1, #0x9b
	strb r1, [r0]
_020CE318:
	ldr r0, _020CE358 ; =0x04000242
	mov r1, #0x93
	strb r1, [r0]
_020CE324:
	ldr r0, _020CE360 ; =0x04000241
	mov r1, #0x8b
	strb r1, [r0]
_020CE330:
	ldr r0, _020CE364 ; =0x04000240
	mov r1, #0x83
	strb r1, [r0]
_020CE33C:
	ldr r0, _020CE34C ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CE34C: .word gGXState
_020CE350: .word 0x04000060
_020CE354: .word 0x0000CFFE
_020CE358: .word 0x04000242
_020CE35C: .word 0x04000243
_020CE360: .word 0x04000241
_020CE364: .word 0x04000240
	arm_func_end GX_SetBankForTex

	arm_func_start GX_SetBankForTexPltt
GX_SetBankForTexPltt: ; 0x020CE368
	stmdb sp!, {r3, lr}
	ldr r1, _020CE440 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0xa]
	cmp r0, #0x30
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0xa]
	bgt _020CE3BC
	cmp r0, #0x30
	bge _020CE418
	cmp r0, #0x10
	bgt _020CE3B0
	bge _020CE424
	cmp r0, #0
	b _020CE430
_020CE3B0:
	cmp r0, #0x20
	beq _020CE3EC
	b _020CE430
_020CE3BC:
	cmp r0, #0x60
	bgt _020CE3D4
	bge _020CE3E0
	cmp r0, #0x40
	beq _020CE3FC
	b _020CE430
_020CE3D4:
	cmp r0, #0x70
	beq _020CE40C
	b _020CE430
_020CE3E0:
	ldr r0, _020CE444 ; =0x04000246
	mov r1, #0x8b
	strb r1, [r0]
_020CE3EC:
	ldr r0, _020CE448 ; =0x04000245
	mov r1, #0x83
	strb r1, [r0]
	b _020CE430
_020CE3FC:
	ldr r0, _020CE444 ; =0x04000246
	mov r1, #0x83
	strb r1, [r0]
	b _020CE430
_020CE40C:
	ldr r0, _020CE444 ; =0x04000246
	mov r1, #0x9b
	strb r1, [r0]
_020CE418:
	ldr r0, _020CE448 ; =0x04000245
	mov r1, #0x93
	strb r1, [r0]
_020CE424:
	ldr r0, _020CE44C ; =0x04000244
	mov r1, #0x83
	strb r1, [r0]
_020CE430:
	ldr r0, _020CE440 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CE440: .word gGXState
_020CE444: .word 0x04000246
_020CE448: .word 0x04000245
_020CE44C: .word 0x04000244
	arm_func_end GX_SetBankForTexPltt

	arm_func_start GX_SetBankForClearImage
GX_SetBankForClearImage: ; 0x020CE450
	stmdb sp!, {r3, lr}
	ldr r1, _020CE56C ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0xc]
	cmp r0, #0xc
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0xc]
	addls pc, pc, r0, lsl #2
	b _020CE55C
_020CE480: ; jump table
	b _020CE50C ; case 0
	b _020CE520 ; case 1
	b _020CE4C0 ; case 2
	b _020CE4B4 ; case 3
	b _020CE540 ; case 4
	b _020CE55C ; case 5
	b _020CE55C ; case 6
	b _020CE55C ; case 7
	b _020CE4EC ; case 8
	b _020CE55C ; case 9
	b _020CE55C ; case 10
	b _020CE55C ; case 11
	b _020CE4E0 ; case 12
_020CE4B4:
	ldr r0, _020CE570 ; =0x04000240
	mov r1, #0x93
	strb r1, [r0]
_020CE4C0:
	ldr r0, _020CE574 ; =0x04000241
	mov r2, #0x9b
	ldr r1, _020CE578 ; =0x04000060
	strb r2, [r0]
	ldrh r0, [r1]
	orr r0, r0, #0x4000
	strh r0, [r1]
	b _020CE55C
_020CE4E0:
	ldr r0, _020CE57C ; =0x04000242
	mov r1, #0x93
	strb r1, [r0]
_020CE4EC:
	ldr r0, _020CE580 ; =0x04000243
	mov r2, #0x9b
	ldr r1, _020CE578 ; =0x04000060
	strb r2, [r0]
	ldrh r0, [r1]
	orr r0, r0, #0x4000
	strh r0, [r1]
	b _020CE55C
_020CE50C:
	ldr r1, _020CE578 ; =0x04000060
	ldrh r0, [r1]
	bic r0, r0, #0x4000
	strh r0, [r1]
	b _020CE55C
_020CE520:
	ldr r0, _020CE570 ; =0x04000240
	mov r1, #0x9b
	strb r1, [r0]
	sub r1, r0, #0x1e0
	ldrh r0, [r1]
	orr r0, r0, #0x4000
	strh r0, [r1]
	b _020CE55C
_020CE540:
	ldr r0, _020CE57C ; =0x04000242
	mov r2, #0x9b
	ldr r1, _020CE578 ; =0x04000060
	strb r2, [r0]
	ldrh r0, [r1]
	orr r0, r0, #0x4000
	strh r0, [r1]
_020CE55C:
	ldr r0, _020CE56C ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CE56C: .word gGXState
_020CE570: .word 0x04000240
_020CE574: .word 0x04000241
_020CE578: .word 0x04000060
_020CE57C: .word 0x04000242
_020CE580: .word 0x04000243
	arm_func_end GX_SetBankForClearImage

	arm_func_start GX_SetBankForARM7
GX_SetBankForARM7: ; 0x020CE584
	stmdb sp!, {r3, lr}
	ldr r1, _020CE624 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #6]
	cmp r0, #8
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #6]
	bgt _020CE5D8
	cmp r0, #8
	bge _020CE608
	cmp r0, #4
	bgt _020CE614
	cmp r0, #0
	blt _020CE614
	beq _020CE614
	cmp r0, #4
	beq _020CE5F8
	b _020CE614
_020CE5D8:
	cmp r0, #0xc
	bne _020CE614
	ldr r1, _020CE628 ; =0x04000243
	mov r0, #0x8a
	strb r0, [r1]
	mov r0, #0x82
	strb r0, [r1, #-1]
	b _020CE614
_020CE5F8:
	ldr r0, _020CE62C ; =0x04000242
	mov r1, #0x82
	strb r1, [r0]
	b _020CE614
_020CE608:
	ldr r0, _020CE628 ; =0x04000243
	mov r1, #0x82
	strb r1, [r0]
_020CE614:
	ldr r0, _020CE624 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CE624: .word gGXState
_020CE628: .word 0x04000243
_020CE62C: .word 0x04000242
	arm_func_end GX_SetBankForARM7

	arm_func_start GX_SetBankForLCDC
GX_SetBankForLCDC: ; 0x020CE630
	ldr r1, _020CE648 ; =gGXState
	ldr ip, _020CE64C ; =GX_VRAMCNT_SetLCDC_
	ldrh r2, [r1]
	orr r2, r2, r0
	strh r2, [r1]
	bx ip
	.align 2, 0
_020CE648: .word gGXState
_020CE64C: .word GX_VRAMCNT_SetLCDC_
	arm_func_end GX_SetBankForLCDC

	arm_func_start GX_SetBankForSubBG
GX_SetBankForSubBG: ; 0x020CE650
	stmdb sp!, {r3, lr}
	ldr r1, _020CE6E8 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0x12]
	cmp r0, #0x80
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0x12]
	bgt _020CE6A4
	cmp r0, #0x80
	bge _020CE6CC
	cmp r0, #4
	bgt _020CE6D8
	cmp r0, #0
	blt _020CE6D8
	beq _020CE6D8
	cmp r0, #4
	beq _020CE6B0
	b _020CE6D8
_020CE6A4:
	cmp r0, #0x180
	beq _020CE6C0
	b _020CE6D8
_020CE6B0:
	ldr r0, _020CE6EC ; =0x04000242
	mov r1, #0x84
	strb r1, [r0]
	b _020CE6D8
_020CE6C0:
	ldr r0, _020CE6F0 ; =0x04000249
	mov r1, #0x81
	strb r1, [r0]
_020CE6CC:
	ldr r0, _020CE6F4 ; =0x04000248
	mov r1, #0x81
	strb r1, [r0]
_020CE6D8:
	ldr r0, _020CE6E8 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CE6E8: .word gGXState
_020CE6EC: .word 0x04000242
_020CE6F0: .word 0x04000249
_020CE6F4: .word 0x04000248
	arm_func_end GX_SetBankForSubBG

	arm_func_start GX_SetBankForSubOBJ
GX_SetBankForSubOBJ: ; 0x020CE6F8
	stmdb sp!, {r3, lr}
	ldr r1, _020CE75C ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0x14]
	cmp r0, #0
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0x14]
	beq _020CE74C
	cmp r0, #8
	beq _020CE740
	cmp r0, #0x100
	ldreq r0, _020CE760 ; =0x04000249
	moveq r1, #0x82
	streqb r1, [r0]
	b _020CE74C
_020CE740:
	ldr r0, _020CE764 ; =0x04000243
	mov r1, #0x84
	strb r1, [r0]
_020CE74C:
	ldr r0, _020CE75C ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CE75C: .word gGXState
_020CE760: .word 0x04000249
_020CE764: .word 0x04000243
	arm_func_end GX_SetBankForSubOBJ

	arm_func_start GX_SetBankForSubBGExtPltt
GX_SetBankForSubBGExtPltt: ; 0x020CE768
	stmdb sp!, {r3, lr}
	ldr r1, _020CE7DC ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0x16]
	cmp r0, #0
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0x16]
	beq _020CE7BC
	cmp r0, #0x80
	bne _020CE7CC
	ldr r3, _020CE7E0 ; =0x04001000
	ldr r0, _020CE7E4 ; =0x04000248
	ldr r2, [r3]
	mov r1, #0x82
	orr r2, r2, #0x40000000
	str r2, [r3]
	strb r1, [r0]
	b _020CE7CC
_020CE7BC:
	ldr r1, _020CE7E0 ; =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x40000000
	str r0, [r1]
_020CE7CC:
	ldr r0, _020CE7DC ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CE7DC: .word gGXState
_020CE7E0: .word 0x04001000
_020CE7E4: .word 0x04000248
	arm_func_end GX_SetBankForSubBGExtPltt

	arm_func_start GX_SetBankForSubOBJExtPltt
GX_SetBankForSubOBJExtPltt: ; 0x020CE7E8
	stmdb sp!, {r3, lr}
	ldr r1, _020CE85C ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0x18]
	cmp r0, #0
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0x18]
	beq _020CE83C
	cmp r0, #0x100
	bne _020CE84C
	ldr r3, _020CE860 ; =0x04001000
	ldr r0, _020CE864 ; =0x04000249
	ldr r2, [r3]
	mov r1, #0x83
	orr r2, r2, #0x80000000
	str r2, [r3]
	strb r1, [r0]
	b _020CE84C
_020CE83C:
	ldr r1, _020CE860 ; =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x80000000
	str r0, [r1]
_020CE84C:
	ldr r0, _020CE85C ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CE85C: .word gGXState
_020CE860: .word 0x04001000
_020CE864: .word 0x04000249
	arm_func_end GX_SetBankForSubOBJExtPltt

	arm_func_start resetBankForX_
resetBankForX_: ; 0x020CE868
	stmdb sp!, {r4, lr}
	ldrh r4, [r0]
	mov r2, #0
	ldr r1, _020CE898 ; =gGXState
	strh r2, [r0]
	ldrh r2, [r1]
	mov r0, r4
	orr r2, r2, r4
	strh r2, [r1]
	bl GX_VRAMCNT_SetLCDC_
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020CE898: .word gGXState
	arm_func_end resetBankForX_

	arm_func_start GX_ResetBankForBG
GX_ResetBankForBG: ; 0x020CE89C
	ldr ip, _020CE8A8 ; =resetBankForX_
	ldr r0, _020CE8AC ; =gGXState + 0x02
	bx ip
	.align 2, 0
_020CE8A8: .word resetBankForX_
_020CE8AC: .word gGXState + 0x02
	arm_func_end GX_ResetBankForBG

	arm_func_start GX_ResetBankForOBJ
GX_ResetBankForOBJ: ; 0x020CE8B0
	ldr ip, _020CE8BC ; =resetBankForX_
	ldr r0, _020CE8C0 ; =gGXState + 0x04
	bx ip
	.align 2, 0
_020CE8BC: .word resetBankForX_
_020CE8C0: .word gGXState + 0x04
	arm_func_end GX_ResetBankForOBJ

	arm_func_start GX_ResetBankForBGExtPltt
GX_ResetBankForBGExtPltt: ; 0x020CE8C4
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr ip, _020CE8E0 ; =resetBankForX_
	bic r1, r1, #0x40000000
	ldr r0, _020CE8E4 ; =gGXState + 0x0E
	str r1, [r2]
	bx ip
	.align 2, 0
_020CE8E0: .word resetBankForX_
_020CE8E4: .word gGXState + 0x0E
	arm_func_end GX_ResetBankForBGExtPltt

	arm_func_start GX_ResetBankForOBJExtPltt
GX_ResetBankForOBJExtPltt: ; 0x020CE8E8
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr ip, _020CE904 ; =resetBankForX_
	bic r1, r1, #0x80000000
	ldr r0, _020CE908 ; =gGXState + 0x10
	str r1, [r2]
	bx ip
	.align 2, 0
_020CE904: .word resetBankForX_
_020CE908: .word gGXState + 0x10
	arm_func_end GX_ResetBankForOBJExtPltt

	arm_func_start GX_ResetBankForTex
GX_ResetBankForTex: ; 0x020CE90C
	ldr ip, _020CE918 ; =resetBankForX_
	ldr r0, _020CE91C ; =gGXState + 0x08
	bx ip
	.align 2, 0
_020CE918: .word resetBankForX_
_020CE91C: .word gGXState + 0x08
	arm_func_end GX_ResetBankForTex

	arm_func_start GX_ResetBankForTexPltt
GX_ResetBankForTexPltt: ; 0x020CE920
	ldr ip, _020CE92C ; =resetBankForX_
	ldr r0, _020CE930 ; =gGXState + 0x0A
	bx ip
	.align 2, 0
_020CE92C: .word resetBankForX_
_020CE930: .word gGXState + 0x0A
	arm_func_end GX_ResetBankForTexPltt

	arm_func_start GX_ResetBankForClearImage
GX_ResetBankForClearImage: ; 0x020CE934
	ldr ip, _020CE940 ; =resetBankForX_
	ldr r0, _020CE944 ; =gGXState + 0x0C
	bx ip
	.align 2, 0
_020CE940: .word resetBankForX_
_020CE944: .word gGXState + 0x0C
	arm_func_end GX_ResetBankForClearImage

	arm_func_start GX_ResetBankForSubBG
GX_ResetBankForSubBG: ; 0x020CE948
	ldr ip, _020CE954 ; =resetBankForX_
	ldr r0, _020CE958 ; =gGXState + 0x12
	bx ip
	.align 2, 0
_020CE954: .word resetBankForX_
_020CE958: .word gGXState + 0x12
	arm_func_end GX_ResetBankForSubBG

	arm_func_start GX_ResetBankForSubOBJ
GX_ResetBankForSubOBJ: ; 0x020CE95C
	ldr ip, _020CE968 ; =resetBankForX_
	ldr r0, _020CE96C ; =gGXState + 0x14
	bx ip
	.align 2, 0
_020CE968: .word resetBankForX_
_020CE96C: .word gGXState + 0x14
	arm_func_end GX_ResetBankForSubOBJ

	arm_func_start GX_ResetBankForSubBGExtPltt
GX_ResetBankForSubBGExtPltt: ; 0x020CE970
	ldr r2, _020CE98C ; =0x04001000
	ldr ip, _020CE990 ; =resetBankForX_
	ldr r1, [r2]
	ldr r0, _020CE994 ; =gGXState + 0x16
	bic r1, r1, #0x40000000
	str r1, [r2]
	bx ip
	.align 2, 0
_020CE98C: .word 0x04001000
_020CE990: .word resetBankForX_
_020CE994: .word gGXState + 0x16
	arm_func_end GX_ResetBankForSubBGExtPltt

	arm_func_start GX_ResetBankForSubOBJExtPltt
GX_ResetBankForSubOBJExtPltt: ; 0x020CE998
	ldr r2, _020CE9B4 ; =0x04001000
	ldr ip, _020CE9B8 ; =resetBankForX_
	ldr r1, [r2]
	ldr r0, _020CE9BC ; =gGXState + 0x18
	bic r1, r1, #0x80000000
	str r1, [r2]
	bx ip
	.align 2, 0
_020CE9B4: .word 0x04001000
_020CE9B8: .word resetBankForX_
_020CE9BC: .word gGXState + 0x18
	arm_func_end GX_ResetBankForSubOBJExtPltt

	arm_func_start disableBankForX_
disableBankForX_: ; 0x020CE9C0
	stmdb sp!, {r4, lr}
	ldrh r4, [r0]
	mov r1, #0
	strh r1, [r0]
	tst r4, #1
	ldrne r0, _020CEA78 ; =0x04000240
	strneb r1, [r0]
	tst r4, #2
	ldrne r0, _020CEA7C ; =0x04000241
	movne r1, #0
	strneb r1, [r0]
	tst r4, #4
	ldrne r0, _020CEA80 ; =0x04000242
	movne r1, #0
	strneb r1, [r0]
	tst r4, #8
	ldrne r0, _020CEA84 ; =0x04000243
	movne r1, #0
	strneb r1, [r0]
	tst r4, #0x10
	ldrne r0, _020CEA88 ; =0x04000244
	movne r1, #0
	strneb r1, [r0]
	tst r4, #0x20
	ldrne r0, _020CEA8C ; =0x04000245
	movne r1, #0
	strneb r1, [r0]
	tst r4, #0x40
	ldrne r0, _020CEA90 ; =0x04000246
	movne r1, #0
	strneb r1, [r0]
	tst r4, #0x80
	ldrne r0, _020CEA94 ; =0x04000248
	movne r1, #0
	strneb r1, [r0]
	tst r4, #0x100
	ldrne r0, _020CEA98 ; =0x04000249
	movne r1, #0
	strneb r1, [r0]
	ldr r1, _020CEA9C ; =GXi_VRamLockId
	mov r0, r4, lsl #0x10
	ldrh r1, [r1]
	mov r0, r0, lsr #0x10
	bl OSi_UnlockVram
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020CEA78: .word 0x04000240
_020CEA7C: .word 0x04000241
_020CEA80: .word 0x04000242
_020CEA84: .word 0x04000243
_020CEA88: .word 0x04000244
_020CEA8C: .word 0x04000245
_020CEA90: .word 0x04000246
_020CEA94: .word 0x04000248
_020CEA98: .word 0x04000249
_020CEA9C: .word GXi_VRamLockId
	arm_func_end disableBankForX_

	arm_func_start GX_DisableBankForBG
GX_DisableBankForBG: ; 0x020CEAA0
	ldr ip, _020CEAAC ; =disableBankForX_
	ldr r0, _020CEAB0 ; =gGXState + 0x02
	bx ip
	.align 2, 0
_020CEAAC: .word disableBankForX_
_020CEAB0: .word gGXState + 0x02
	arm_func_end GX_DisableBankForBG

	arm_func_start GX_DisableBankForOBJ
GX_DisableBankForOBJ: ; 0x020CEAB4
	ldr ip, _020CEAC0 ; =disableBankForX_
	ldr r0, _020CEAC4 ; =gGXState + 0x04
	bx ip
	.align 2, 0
_020CEAC0: .word disableBankForX_
_020CEAC4: .word gGXState + 0x04
	arm_func_end GX_DisableBankForOBJ

	arm_func_start GX_DisableBankForBGExtPltt
GX_DisableBankForBGExtPltt: ; 0x020CEAC8
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr ip, _020CEAE4 ; =disableBankForX_
	bic r1, r1, #0x40000000
	ldr r0, _020CEAE8 ; =gGXState + 0x0E
	str r1, [r2]
	bx ip
	.align 2, 0
_020CEAE4: .word disableBankForX_
_020CEAE8: .word gGXState + 0x0E
	arm_func_end GX_DisableBankForBGExtPltt

	arm_func_start GX_DisableBankForOBJExtPltt
GX_DisableBankForOBJExtPltt: ; 0x020CEAEC
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr ip, _020CEB08 ; =disableBankForX_
	bic r1, r1, #0x80000000
	ldr r0, _020CEB0C ; =gGXState + 0x10
	str r1, [r2]
	bx ip
	.align 2, 0
_020CEB08: .word disableBankForX_
_020CEB0C: .word gGXState + 0x10
	arm_func_end GX_DisableBankForOBJExtPltt

	arm_func_start GX_DisableBankForTex
GX_DisableBankForTex: ; 0x020CEB10
	ldr ip, _020CEB1C ; =disableBankForX_
	ldr r0, _020CEB20 ; =gGXState + 0x08
	bx ip
	.align 2, 0
_020CEB1C: .word disableBankForX_
_020CEB20: .word gGXState + 0x08
	arm_func_end GX_DisableBankForTex

	arm_func_start GX_DisableBankForTexPltt
GX_DisableBankForTexPltt: ; 0x020CEB24
	ldr ip, _020CEB30 ; =disableBankForX_
	ldr r0, _020CEB34 ; =gGXState + 0x0A
	bx ip
	.align 2, 0
_020CEB30: .word disableBankForX_
_020CEB34: .word gGXState + 0x0A
	arm_func_end GX_DisableBankForTexPltt

	arm_func_start GX_DisableBankForClearImage
GX_DisableBankForClearImage: ; 0x020CEB38
	ldr ip, _020CEB44 ; =disableBankForX_
	ldr r0, _020CEB48 ; =gGXState + 0x0C
	bx ip
	.align 2, 0
_020CEB44: .word disableBankForX_
_020CEB48: .word gGXState + 0x0C
	arm_func_end GX_DisableBankForClearImage

	arm_func_start GX_DisableBankForARM7
GX_DisableBankForARM7: ; 0x020CEB4C
	ldr ip, _020CEB58 ; =disableBankForX_
	ldr r0, _020CEB5C ; =gGXState + 0x06
	bx ip
	.align 2, 0
_020CEB58: .word disableBankForX_
_020CEB5C: .word gGXState + 0x06
	arm_func_end GX_DisableBankForARM7

	arm_func_start GX_DisableBankForLCDC
GX_DisableBankForLCDC: ; 0x020CEB60
	ldr ip, _020CEB6C ; =disableBankForX_
	ldr r0, _020CEB70 ; =gGXState
	bx ip
	.align 2, 0
_020CEB6C: .word disableBankForX_
_020CEB70: .word gGXState
	arm_func_end GX_DisableBankForLCDC

	arm_func_start GX_DisableBankForSubBG
GX_DisableBankForSubBG: ; 0x020CEB74
	ldr ip, _020CEB80 ; =disableBankForX_
	ldr r0, _020CEB84 ; =gGXState + 0x12
	bx ip
	.align 2, 0
_020CEB80: .word disableBankForX_
_020CEB84: .word gGXState + 0x12
	arm_func_end GX_DisableBankForSubBG

	arm_func_start GX_DisableBankForSubOBJ
GX_DisableBankForSubOBJ: ; 0x020CEB88
	ldr ip, _020CEB94 ; =disableBankForX_
	ldr r0, _020CEB98 ; =gGXState + 0x14
	bx ip
	.align 2, 0
_020CEB94: .word disableBankForX_
_020CEB98: .word gGXState + 0x14
	arm_func_end GX_DisableBankForSubOBJ

	arm_func_start GX_DisableBankForSubBGExtPltt
GX_DisableBankForSubBGExtPltt: ; 0x020CEB9C
	ldr r2, _020CEBB8 ; =0x04001000
	ldr ip, _020CEBBC ; =disableBankForX_
	ldr r1, [r2]
	ldr r0, _020CEBC0 ; =gGXState + 0x16
	bic r1, r1, #0x40000000
	str r1, [r2]
	bx ip
	.align 2, 0
_020CEBB8: .word 0x04001000
_020CEBBC: .word disableBankForX_
_020CEBC0: .word gGXState + 0x16
	arm_func_end GX_DisableBankForSubBGExtPltt

	arm_func_start GX_DisableBankForSubOBJExtPltt
GX_DisableBankForSubOBJExtPltt: ; 0x020CEBC4
	ldr r2, _020CEBE0 ; =0x04001000
	ldr ip, _020CEBE4 ; =disableBankForX_
	ldr r1, [r2]
	ldr r0, _020CEBE8 ; =gGXState + 0x18
	bic r1, r1, #0x80000000
	str r1, [r2]
	bx ip
	.align 2, 0
_020CEBE0: .word 0x04001000
_020CEBE4: .word disableBankForX_
_020CEBE8: .word gGXState + 0x18
	arm_func_end GX_DisableBankForSubOBJExtPltt

	arm_func_start GX_GetBankForOBJ
GX_GetBankForOBJ: ; 0x020CEBEC
	ldr r0, _020CEBF8 ; =gGXState
	ldrh r0, [r0, #4]
	bx lr
	.align 2, 0
_020CEBF8: .word gGXState
	arm_func_end GX_GetBankForOBJ

	arm_func_start GX_GetBankForOBJExtPltt
GX_GetBankForOBJExtPltt: ; 0x020CEBFC
	ldr r0, _020CEC08 ; =gGXState
	ldrh r0, [r0, #0x10]
	bx lr
	.align 2, 0
_020CEC08: .word gGXState
	arm_func_end GX_GetBankForOBJExtPltt

	arm_func_start GX_GetBankForLCDC
GX_GetBankForLCDC: ; 0x020CEC0C
	ldr r0, _020CEC18 ; =gGXState
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_020CEC18: .word gGXState
	arm_func_end GX_GetBankForLCDC

	arm_func_start GX_GetBankForSubOBJ
GX_GetBankForSubOBJ: ; 0x020CEC1C
	ldr r0, _020CEC28 ; =gGXState
	ldrh r0, [r0, #0x14]
	bx lr
	.align 2, 0
_020CEC28: .word gGXState
	arm_func_end GX_GetBankForSubOBJ

	arm_func_start GX_GetBankForSubOBJExtPltt
GX_GetBankForSubOBJExtPltt: ; 0x020CEC2C
	ldr r0, _020CEC38 ; =gGXState
	ldrh r0, [r0, #0x18]
	bx lr
	.align 2, 0
_020CEC38: .word gGXState
	arm_func_end GX_GetBankForSubOBJExtPltt
