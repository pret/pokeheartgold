	.include "asm/macros.inc"
	.include "gx_load2d.inc"
	.include "global.inc"
	.public GXi_DmaId

	.bss

sSubBGExtPltt: ; 0x021E15DC
	.space 0x4

sOBJExtPlttLCDCBlk: ; 0x021E15E0
	.space 0x4

sOBJExtPltt: ; 0x021E15E4
	.space 0x4

sBGExtPlttLCDCOffset: ; 0x021E15E8
	.space 0x4

sBGExtPlttLCDCBlk: ; 0x021E15EC
	.space 0x4

sBGExtPltt: ; 0x021E15F0
	.space 0x4

sSubOBJExtPltt: ; 0x021E15F4
	.space 0x4

	.text

	arm_func_start GX_LoadBGPltt
GX_LoadBGPltt: ; 0x020CFC6C
	stmdb sp!, {r4, lr}
	ldr r3, _020CFCBC ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	beq _020CFCA8
	cmp r3, #0x1c
	bls _020CFCA8
	mov r1, r4
	add r2, lr, #0x5000000
	bl MI_DmaCopy16
	ldmia sp!, {r4, pc}
_020CFCA8:
	mov r0, r4
	mov r2, r3
	add r1, lr, #0x5000000
	bl MIi_CpuCopy16
	ldmia sp!, {r4, pc}
	.align 2, 0
_020CFCBC: .word GXi_DmaId
	arm_func_end GX_LoadBGPltt

	arm_func_start GXS_LoadBGPltt
GXS_LoadBGPltt: ; 0x020CFCC0
	stmdb sp!, {r3, lr}
	ldr r3, _020CFD14 ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _020CFCFC
	cmp r3, #0x1c
	bls _020CFCFC
	add r2, r1, #0x400
	mov r1, lr
	add r2, r2, #0x5000000
	bl MI_DmaCopy16
	ldmia sp!, {r3, pc}
_020CFCFC:
	add r1, r1, #0x400
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x5000000
	bl MIi_CpuCopy16
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CFD14: .word GXi_DmaId
	arm_func_end GXS_LoadBGPltt

	arm_func_start GX_LoadOBJPltt
GX_LoadOBJPltt: ; 0x020CFD18
	stmdb sp!, {r3, lr}
	ldr r3, _020CFD6C ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _020CFD54
	cmp r3, #0x1c
	bls _020CFD54
	add r2, r1, #0x200
	mov r1, lr
	add r2, r2, #0x5000000
	bl MI_DmaCopy16
	ldmia sp!, {r3, pc}
_020CFD54:
	add r1, r1, #0x200
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x5000000
	bl MIi_CpuCopy16
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CFD6C: .word GXi_DmaId
	arm_func_end GX_LoadOBJPltt

	arm_func_start GXS_LoadOBJPltt
GXS_LoadOBJPltt: ; 0x020CFD70
	stmdb sp!, {r3, lr}
	ldr r3, _020CFDC4 ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _020CFDAC
	cmp r3, #0x1c
	bls _020CFDAC
	add r2, r1, #0x600
	mov r1, lr
	add r2, r2, #0x5000000
	bl MI_DmaCopy16
	ldmia sp!, {r3, pc}
_020CFDAC:
	add r1, r1, #0x600
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x5000000
	bl MIi_CpuCopy16
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CFDC4: .word GXi_DmaId
	arm_func_end GXS_LoadOBJPltt

	arm_func_start GX_LoadOAM
GX_LoadOAM: ; 0x020CFDC8
	stmdb sp!, {r4, lr}
	ldr r3, _020CFE18 ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	beq _020CFE04
	cmp r3, #0x30
	bls _020CFE04
	mov r1, r4
	add r2, lr, #0x7000000
	bl MI_DmaCopy32
	ldmia sp!, {r4, pc}
_020CFE04:
	mov r0, r4
	mov r2, r3
	add r1, lr, #0x7000000
	bl MIi_CpuCopy32
	ldmia sp!, {r4, pc}
	.align 2, 0
_020CFE18: .word GXi_DmaId
	arm_func_end GX_LoadOAM

	arm_func_start GXS_LoadOAM
GXS_LoadOAM: ; 0x020CFE1C
	stmdb sp!, {r3, lr}
	ldr r3, _020CFE70 ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _020CFE58
	cmp r3, #0x30
	bls _020CFE58
	add r2, r1, #0x400
	mov r1, lr
	add r2, r2, #0x7000000
	bl MI_DmaCopy32
	ldmia sp!, {r3, pc}
_020CFE58:
	add r1, r1, #0x400
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x7000000
	bl MIi_CpuCopy32
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CFE70: .word GXi_DmaId
	arm_func_end GXS_LoadOAM

	arm_func_start GX_LoadOBJ
GX_LoadOBJ: ; 0x020CFE74
	stmdb sp!, {r4, lr}
	ldr r3, _020CFEC8 ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	mov ip, #0x6400000
	beq _020CFEB4
	cmp r3, #0x30
	bls _020CFEB4
	mov r1, r4
	add r2, ip, lr
	bl MI_DmaCopy32
	ldmia sp!, {r4, pc}
_020CFEB4:
	mov r0, r4
	mov r2, r3
	add r1, ip, lr
	bl MIi_CpuCopy32
	ldmia sp!, {r4, pc}
	.align 2, 0
_020CFEC8: .word GXi_DmaId
	arm_func_end GX_LoadOBJ

	arm_func_start GXS_LoadOBJ
GXS_LoadOBJ: ; 0x020CFECC
	stmdb sp!, {r4, lr}
	ldr r3, _020CFF20 ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	mov ip, #0x6600000
	beq _020CFF0C
	cmp r3, #0x30
	bls _020CFF0C
	mov r1, r4
	add r2, ip, lr
	bl MI_DmaCopy32
	ldmia sp!, {r4, pc}
_020CFF0C:
	mov r0, r4
	mov r2, r3
	add r1, ip, lr
	bl MIi_CpuCopy32
	ldmia sp!, {r4, pc}
	.align 2, 0
_020CFF20: .word GXi_DmaId
	arm_func_end GXS_LoadOBJ

	arm_func_start GX_LoadBG0Scr
GX_LoadBG0Scr: ; 0x020CFF24
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG0ScrPtr
	ldr r1, _020CFF80 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020CFF6C
	cmp r4, #0x1c
	bls _020CFF6C
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_020CFF6C:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020CFF80: .word GXi_DmaId
	arm_func_end GX_LoadBG0Scr

	arm_func_start GXS_LoadBG0Scr
GXS_LoadBG0Scr: ; 0x020CFF84
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG0ScrPtr
	ldr r1, _020CFFE0 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020CFFCC
	cmp r4, #0x1c
	bls _020CFFCC
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_020CFFCC:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020CFFE0: .word GXi_DmaId
	arm_func_end GXS_LoadBG0Scr

	arm_func_start GX_LoadBG1Scr
GX_LoadBG1Scr: ; 0x020CFFE4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG1ScrPtr
	ldr r1, _020D0040 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020D002C
	cmp r4, #0x1c
	bls _020D002C
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_020D002C:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D0040: .word GXi_DmaId
	arm_func_end GX_LoadBG1Scr

	arm_func_start GXS_LoadBG1Scr
GXS_LoadBG1Scr: ; 0x020D0044
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG1ScrPtr
	ldr r1, _020D00A0 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020D008C
	cmp r4, #0x1c
	bls _020D008C
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_020D008C:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D00A0: .word GXi_DmaId
	arm_func_end GXS_LoadBG1Scr

	arm_func_start GX_LoadBG2Scr
GX_LoadBG2Scr: ; 0x020D00A4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG2ScrPtr
	ldr r1, _020D0100 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020D00EC
	cmp r4, #0x1c
	bls _020D00EC
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_020D00EC:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D0100: .word GXi_DmaId
	arm_func_end GX_LoadBG2Scr

	arm_func_start GXS_LoadBG2Scr
GXS_LoadBG2Scr: ; 0x020D0104
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG2ScrPtr
	ldr r1, _020D0160 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020D014C
	cmp r4, #0x1c
	bls _020D014C
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_020D014C:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D0160: .word GXi_DmaId
	arm_func_end GXS_LoadBG2Scr

	arm_func_start GX_LoadBG3Scr
GX_LoadBG3Scr: ; 0x020D0164
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG3ScrPtr
	ldr r1, _020D01C0 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020D01AC
	cmp r4, #0x1c
	bls _020D01AC
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_020D01AC:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D01C0: .word GXi_DmaId
	arm_func_end GX_LoadBG3Scr

	arm_func_start GXS_LoadBG3Scr
GXS_LoadBG3Scr: ; 0x020D01C4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG3ScrPtr
	ldr r1, _020D0220 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020D020C
	cmp r4, #0x1c
	bls _020D020C
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_020D020C:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D0220: .word GXi_DmaId
	arm_func_end GXS_LoadBG3Scr

	arm_func_start GX_LoadBG0Char
GX_LoadBG0Char: ; 0x020D0224
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG0CharPtr
	ldr r1, _020D0280 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020D026C
	cmp r4, #0x30
	bls _020D026C
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy32
	ldmia sp!, {r4, r5, r6, pc}
_020D026C:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D0280: .word GXi_DmaId
	arm_func_end GX_LoadBG0Char

	arm_func_start GXS_LoadBG0Char
GXS_LoadBG0Char: ; 0x020D0284
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG0CharPtr
	ldr r1, _020D02E0 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020D02CC
	cmp r4, #0x30
	bls _020D02CC
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy32
	ldmia sp!, {r4, r5, r6, pc}
_020D02CC:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D02E0: .word GXi_DmaId
	arm_func_end GXS_LoadBG0Char

	arm_func_start GX_LoadBG1Char
GX_LoadBG1Char: ; 0x020D02E4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG1CharPtr
	ldr r1, _020D0340 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020D032C
	cmp r4, #0x30
	bls _020D032C
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy32
	ldmia sp!, {r4, r5, r6, pc}
_020D032C:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D0340: .word GXi_DmaId
	arm_func_end GX_LoadBG1Char

	arm_func_start GXS_LoadBG1Char
GXS_LoadBG1Char: ; 0x020D0344
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG1CharPtr
	ldr r1, _020D03A0 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020D038C
	cmp r4, #0x30
	bls _020D038C
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy32
	ldmia sp!, {r4, r5, r6, pc}
_020D038C:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D03A0: .word GXi_DmaId
	arm_func_end GXS_LoadBG1Char

	arm_func_start GX_LoadBG2Char
GX_LoadBG2Char: ; 0x020D03A4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG2CharPtr
	ldr r1, _020D0400 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020D03EC
	cmp r4, #0x30
	bls _020D03EC
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy32
	ldmia sp!, {r4, r5, r6, pc}
_020D03EC:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D0400: .word GXi_DmaId
	arm_func_end GX_LoadBG2Char

	arm_func_start GXS_LoadBG2Char
GXS_LoadBG2Char: ; 0x020D0404
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG2CharPtr
	ldr r1, _020D0460 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020D044C
	cmp r4, #0x30
	bls _020D044C
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy32
	ldmia sp!, {r4, r5, r6, pc}
_020D044C:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D0460: .word GXi_DmaId
	arm_func_end GXS_LoadBG2Char

	arm_func_start GX_LoadBG3Char
GX_LoadBG3Char: ; 0x020D0464
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG3CharPtr
	ldr r1, _020D04C0 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020D04AC
	cmp r4, #0x30
	bls _020D04AC
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy32
	ldmia sp!, {r4, r5, r6, pc}
_020D04AC:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D04C0: .word GXi_DmaId
	arm_func_end GX_LoadBG3Char

	arm_func_start GXS_LoadBG3Char
GXS_LoadBG3Char: ; 0x020D04C4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG3CharPtr
	ldr r1, _020D0520 ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020D050C
	cmp r4, #0x30
	bls _020D050C
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy32
	ldmia sp!, {r4, r5, r6, pc}
_020D050C:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MIi_CpuCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D0520: .word GXi_DmaId
	arm_func_end GXS_LoadBG3Char

	arm_func_start GX_BeginLoadBGExtPltt
GX_BeginLoadBGExtPltt: ; 0x020D0524
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForBGExtPltt
	ldr r1, _020D05B4 ; =sSubBGExtPltt
	cmp r0, #0x20
	str r0, [r1, #0x14]
	bgt _020D0558
	cmp r0, #0x20
	bge _020D059C
	cmp r0, #0
	ldmleia sp!, {r3, pc}
	cmp r0, #0x10
	beq _020D0574
	ldmia sp!, {r3, pc}
_020D0558:
	cmp r0, #0x40
	bgt _020D0568
	beq _020D0588
	ldmia sp!, {r3, pc}
_020D0568:
	cmp r0, #0x60
	beq _020D059C
	ldmia sp!, {r3, pc}
_020D0574:
	ldr r2, _020D05B8 ; =0x06880000
	mov r0, #0
	str r2, [r1, #0x10]
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
_020D0588:
	ldr r2, _020D05BC ; =0x06894000
	mov r0, #0x4000
	str r2, [r1, #0x10]
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
_020D059C:
	ldr r2, _020D05C0 ; =0x06890000
	ldr r0, _020D05B4 ; =sSubBGExtPltt
	mov r1, #0
	str r2, [r0, #0x10]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D05B4: .word sSubBGExtPltt
_020D05B8: .word 0x06880000
_020D05BC: .word 0x06894000
_020D05C0: .word 0x06890000
	arm_func_end GX_BeginLoadBGExtPltt

	arm_func_start GX_LoadBGExtPltt
GX_LoadBGExtPltt: ; 0x020D05C4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr ip, _020D062C ; =sSubBGExtPltt
	ldr r3, _020D0630 ; =GXi_DmaId
	ldr lr, [ip, #0x10]
	ldr r4, [ip, #0xc]
	add r5, lr, r1
	ldr lr, [r3]
	mvn ip, #0
	mov r1, r0
	mov r3, r2
	cmp lr, ip
	sub r4, r5, r4
	beq _020D061C
	mov ip, #0
	str ip, [sp]
	mov r0, lr
	mov r2, r4
	str ip, [sp, #4]
	bl MI_DmaCopy32Async
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
_020D061C:
	mov r1, r4
	bl MIi_CpuCopy32
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020D062C: .word sSubBGExtPltt
_020D0630: .word GXi_DmaId
	arm_func_end GX_LoadBGExtPltt

	arm_func_start GX_EndLoadBGExtPltt
GX_EndLoadBGExtPltt: ; 0x020D0634
	stmdb sp!, {r3, lr}
	ldr r0, _020D0674 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _020D0650
	bl MI_WaitDma
_020D0650:
	ldr r0, _020D0678 ; =sSubBGExtPltt
	ldr r0, [r0, #0x14]
	bl GX_SetBankForBGExtPltt
	ldr r0, _020D0678 ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0, #0x14]
	str r1, [r0, #0x10]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D0674: .word GXi_DmaId
_020D0678: .word sSubBGExtPltt
	arm_func_end GX_EndLoadBGExtPltt

	arm_func_start GX_BeginLoadOBJExtPltt
GX_BeginLoadOBJExtPltt: ; 0x020D067C
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForOBJExtPltt
	ldr r1, _020D06B8 ; =sSubBGExtPltt
	cmp r0, #0
	str r0, [r1, #8]
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x20
	beq _020D06AC
	cmp r0, #0x40
	ldreq r0, _020D06BC ; =0x06894000
	streq r0, [r1, #4]
	ldmia sp!, {r3, pc}
_020D06AC:
	ldr r0, _020D06C0 ; =0x06890000
	str r0, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D06B8: .word sSubBGExtPltt
_020D06BC: .word 0x06894000
_020D06C0: .word 0x06890000
	arm_func_end GX_BeginLoadOBJExtPltt

	arm_func_start GX_LoadOBJExtPltt
GX_LoadOBJExtPltt: ; 0x020D06C4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r3, _020D0728 ; =GXi_DmaId
	ldr lr, _020D072C ; =sSubBGExtPltt
	ldr r4, [r3]
	mvn ip, #0
	mov r6, r0
	mov r5, r1
	mov r3, r2
	cmp r4, ip
	ldr lr, [lr, #4]
	beq _020D0718
	mov ip, #0
	str ip, [sp]
	mov r0, r4
	mov r1, r6
	add r2, lr, r5
	str ip, [sp, #4]
	bl MI_DmaCopy32Async
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
_020D0718:
	add r1, lr, r5
	bl MIi_CpuCopy32
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D0728: .word GXi_DmaId
_020D072C: .word sSubBGExtPltt
	arm_func_end GX_LoadOBJExtPltt

	arm_func_start GX_EndLoadOBJExtPltt
GX_EndLoadOBJExtPltt: ; 0x020D0730
	stmdb sp!, {r3, lr}
	ldr r0, _020D076C ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _020D074C
	bl MI_WaitDma
_020D074C:
	ldr r0, _020D0770 ; =sSubBGExtPltt
	ldr r0, [r0, #8]
	bl GX_SetBankForOBJExtPltt
	ldr r0, _020D0770 ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D076C: .word GXi_DmaId
_020D0770: .word sSubBGExtPltt
	arm_func_end GX_EndLoadOBJExtPltt

	arm_func_start GXS_BeginLoadBGExtPltt
GXS_BeginLoadBGExtPltt: ; 0x020D0774
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForSubBGExtPltt
	ldr r1, _020D0788 ; =sSubBGExtPltt
	str r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D0788: .word sSubBGExtPltt
	arm_func_end GXS_BeginLoadBGExtPltt

	arm_func_start GXS_LoadBGExtPltt
GXS_LoadBGExtPltt: ; 0x020D078C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r3, _020D07EC ; =GXi_DmaId
	mvn ip, #0
	ldr lr, [r3]
	mov r4, r0
	mov r3, r2
	cmp lr, ip
	beq _020D07D8
	add r2, r1, #0x98000
	mov ip, #0
	str ip, [sp]
	mov r0, lr
	mov r1, r4
	add r2, r2, #0x6800000
	str ip, [sp, #4]
	bl MI_DmaCopy32Async
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_020D07D8:
	add r1, r1, #0x98000
	add r1, r1, #0x6800000
	bl MIi_CpuCopy32
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D07EC: .word GXi_DmaId
	arm_func_end GXS_LoadBGExtPltt

	arm_func_start GXS_EndLoadBGExtPltt
GXS_EndLoadBGExtPltt: ; 0x020D07F0
	stmdb sp!, {r3, lr}
	ldr r0, _020D0828 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _020D080C
	bl MI_WaitDma
_020D080C:
	ldr r0, _020D082C ; =sSubBGExtPltt
	ldr r0, [r0]
	bl GX_SetBankForSubBGExtPltt
	ldr r0, _020D082C ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D0828: .word GXi_DmaId
_020D082C: .word sSubBGExtPltt
	arm_func_end GXS_EndLoadBGExtPltt

	arm_func_start GXS_BeginLoadOBJExtPltt
GXS_BeginLoadOBJExtPltt: ; 0x020D0830
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForSubOBJExtPltt
	ldr r1, _020D0844 ; =sSubBGExtPltt
	str r0, [r1, #0x18]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D0844: .word sSubBGExtPltt
	arm_func_end GXS_BeginLoadOBJExtPltt

	arm_func_start GXS_LoadOBJExtPltt
GXS_LoadOBJExtPltt: ; 0x020D0848
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r3, _020D08A8 ; =GXi_DmaId
	mvn ip, #0
	ldr lr, [r3]
	mov r4, r0
	mov r3, r2
	cmp lr, ip
	beq _020D0894
	add r2, r1, #0x8a0000
	mov ip, #0
	str ip, [sp]
	mov r0, lr
	mov r1, r4
	add r2, r2, #0x6000000
	str ip, [sp, #4]
	bl MI_DmaCopy32Async
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_020D0894:
	add r1, r1, #0x8a0000
	add r1, r1, #0x6000000
	bl MIi_CpuCopy32
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D08A8: .word GXi_DmaId
	arm_func_end GXS_LoadOBJExtPltt

	arm_func_start GXS_EndLoadOBJExtPltt
GXS_EndLoadOBJExtPltt: ; 0x020D08AC
	stmdb sp!, {r3, lr}
	ldr r0, _020D08E4 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _020D08C8
	bl MI_WaitDma
_020D08C8:
	ldr r0, _020D08E8 ; =sSubBGExtPltt
	ldr r0, [r0, #0x18]
	bl GX_SetBankForSubOBJExtPltt
	ldr r0, _020D08E8 ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0, #0x18]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D08E4: .word GXi_DmaId
_020D08E8: .word sSubBGExtPltt
	arm_func_end GXS_EndLoadOBJExtPltt
