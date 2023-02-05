	.include "asm/macros.inc"
	.include "gx_load3d.inc"
	.include "global.inc"
	.public GXi_DmaId
	.public GX_ResetBankForClearImage

	.bss

sClrImg: ; 0x021E15F8
	.space 0x4

sTexLCDCBlk1: ; 0x021E15FC
	.space 0x4

sTexPlttLCDCBlk: ; 0x021E1600
	.space 0x4

sTexPltt: ; 0x021E1604
	.space 0x4

sClrImgLCDCBlk: ; 0x021E1608
	.space 0x4

sTex: ; 0x021E160C
	.space 0x4

sTexLCDCBlk2: ; 0x021E1610
	.space 0x4

sSzTexBlk1: ; 0x021E1614
	.space 0x4

	.text

	arm_func_start GX_BeginLoadTex
GX_BeginLoadTex: ; 0x020D08EC
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForTex
	mov r1, #6
	mul lr, r0, r1
	ldr r2, _020D0938 ; =sTexStartAddrTable
	ldr r1, _020D093C ; =sTexStartAddrTable + 2
	ldrh ip, [r2, lr]
	ldr r2, _020D0940 ; =sTexStartAddrTable + 4
	ldrh r3, [r1, lr]
	ldr r1, _020D0944 ; =sClrImg
	ldrh r2, [r2, lr]
	str r0, [r1, #0x14]
	mov r0, ip, lsl #0xc
	str r0, [r1, #4]
	mov r0, r3, lsl #0xc
	str r0, [r1, #0x18]
	mov r0, r2, lsl #0xc
	str r0, [r1, #0x1c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D0938: .word sTexStartAddrTable
_020D093C: .word sTexStartAddrTable + 2
_020D0940: .word sTexStartAddrTable + 4
_020D0944: .word sClrImg
	arm_func_end GX_BeginLoadTex

	arm_func_start GX_LoadTex
GX_LoadTex: ; 0x020D0948
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r3, _020D0A80 ; =sClrImg
	mov r7, r0
	ldr r4, [r3, #0x18]
	mov ip, r1
	cmp r4, #0
	ldreq r0, [r3, #4]
	mov r6, r2
	addeq r2, r0, ip
	beq _020D0A34
	ldr r2, [r3, #0x1c]
	add r0, ip, r6
	cmp r0, r2
	ldrlo r0, [r3, #4]
	addlo r2, r0, ip
	blo _020D0A34
	cmp ip, r2
	addhs r0, r4, ip
	subhs r2, r0, r2
	bhs _020D0A34
	ldr r0, _020D0A84 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	sub r5, r2, ip
	cmp r0, r1
	ldr lr, [r3, #4]
	beq _020D09D4
	cmp r5, #0x30
	bls _020D09D4
	mov r1, r7
	mov r3, r5
	add r2, lr, ip
	bl MI_DmaCopy32
	b _020D09E4
_020D09D4:
	mov r0, r7
	mov r2, r5
	add r1, lr, ip
	bl MIi_CpuCopy32
_020D09E4:
	ldr r0, _020D0A84 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _020D0A1C
	mov ip, #0
	str ip, [sp]
	mov r2, r4
	add r1, r7, r5
	sub r3, r6, r5
	str ip, [sp, #4]
	bl MI_DmaCopy32Async
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020D0A1C:
	mov r1, r4
	add r0, r7, r5
	sub r2, r6, r5
	bl MIi_CpuCopy32
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020D0A34:
	ldr r0, _020D0A84 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _020D0A68
	mov r4, #0
	str r4, [sp]
	mov r1, r7
	mov r3, r6
	str r4, [sp, #4]
	bl MI_DmaCopy32Async
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020D0A68:
	mov r1, r2
	mov r0, r7
	mov r2, r6
	bl MIi_CpuCopy32
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020D0A80: .word sClrImg
_020D0A84: .word GXi_DmaId
	arm_func_end GX_LoadTex

	arm_func_start GX_EndLoadTex
GX_EndLoadTex: ; 0x020D0A88
	stmdb sp!, {r3, lr}
	ldr r0, _020D0ACC ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _020D0AA4
	bl MI_WaitDma
_020D0AA4:
	ldr r0, _020D0AD0 ; =sClrImg
	ldr r0, [r0, #0x14]
	bl GX_SetBankForTex
	ldr r0, _020D0AD0 ; =sClrImg
	mov r1, #0
	str r1, [r0, #0x1c]
	str r1, [r0, #0x18]
	str r1, [r0, #4]
	str r1, [r0, #0x14]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D0ACC: .word GXi_DmaId
_020D0AD0: .word sClrImg
	arm_func_end GX_EndLoadTex

	arm_func_start GX_BeginLoadTexPltt
GX_BeginLoadTexPltt: ; 0x020D0AD4
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForTexPltt
	mov r3, r0, asr #4
	ldr r1, _020D0B00 ; =sClrImg
	ldr r2, _020D0B04 ; =sTexPlttStartAddrTable
	mov r3, r3, lsl #1
	ldrh r2, [r2, r3]
	str r0, [r1, #0xc]
	mov r0, r2, lsl #0xc
	str r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D0B00: .word sClrImg
_020D0B04: .word sTexPlttStartAddrTable
	arm_func_end GX_BeginLoadTexPltt

	arm_func_start GX_LoadTexPltt
GX_LoadTexPltt: ; 0x020D0B08
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r3, _020D0B6C ; =GXi_DmaId
	ldr lr, _020D0B70 ; =sClrImg
	ldr r4, [r3]
	mvn ip, #0
	mov r6, r0
	mov r5, r1
	mov r3, r2
	cmp r4, ip
	ldr lr, [lr, #8]
	beq _020D0B5C
	mov ip, #0
	str ip, [sp]
	mov r0, r4
	mov r1, r6
	add r2, lr, r5
	str ip, [sp, #4]
	bl MI_DmaCopy32Async
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
_020D0B5C:
	add r1, lr, r5
	bl MIi_CpuCopy32
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D0B6C: .word GXi_DmaId
_020D0B70: .word sClrImg
	arm_func_end GX_LoadTexPltt

	arm_func_start GX_EndLoadTexPltt
GX_EndLoadTexPltt: ; 0x020D0B74
	stmdb sp!, {r3, lr}
	ldr r0, _020D0BB0 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _020D0B90
	bl MI_WaitDma
_020D0B90:
	ldr r0, _020D0BB4 ; =sClrImg
	ldr r0, [r0, #0xc]
	bl GX_SetBankForTexPltt
	ldr r0, _020D0BB4 ; =sClrImg
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D0BB0: .word GXi_DmaId
_020D0BB4: .word sClrImg
	arm_func_end GX_EndLoadTexPltt

	arm_func_start GX_BeginLoadClearImage
GX_BeginLoadClearImage: ; 0x020D0BB8
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForClearImage
	ldr r1, _020D0C38 ; =sClrImg
	cmp r0, #0xc
	str r0, [r1]
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_020D0BD4: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _020D0C20 ; case 1
	b _020D0C08 ; case 2
	b _020D0C08 ; case 3
	b _020D0C2C ; case 4
	ldmia sp!, {r3, pc} ; case 5
	ldmia sp!, {r3, pc} ; case 6
	ldmia sp!, {r3, pc} ; case 7
	b _020D0C14 ; case 8
	ldmia sp!, {r3, pc} ; case 9
	ldmia sp!, {r3, pc} ; case 10
	ldmia sp!, {r3, pc} ; case 11
	b _020D0C14 ; case 12
_020D0C08:
	mov r0, #0x6800000
	str r0, [r1, #0x10]
	ldmia sp!, {r3, pc}
_020D0C14:
	ldr r0, _020D0C3C ; =0x06840000
	str r0, [r1, #0x10]
	ldmia sp!, {r3, pc}
_020D0C20:
	ldr r0, _020D0C40 ; =0x067E0000
	str r0, [r1, #0x10]
	ldmia sp!, {r3, pc}
_020D0C2C:
	ldr r0, _020D0C44 ; =0x06820000
	str r0, [r1, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D0C38: .word sClrImg
_020D0C3C: .word 0x06840000
_020D0C40: .word 0x067E0000
_020D0C44: .word 0x06820000
	arm_func_end GX_BeginLoadClearImage

	arm_func_start GX_LoadClearImageColor
GX_LoadClearImageColor: ; 0x020D0C48
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _020D0CA8 ; =GXi_DmaId
	ldr ip, _020D0CAC ; =sClrImg
	ldr lr, [r2]
	mvn r2, #0
	mov r4, r0
	mov r3, r1
	cmp lr, r2
	ldr r2, [ip, #0x10]
	beq _020D0C94
	mov ip, #0
	str ip, [sp]
	mov r0, lr
	mov r1, r4
	str ip, [sp, #4]
	bl MI_DmaCopy32Async
	add sp, sp, #8
	ldmia sp!, {r4, pc}
_020D0C94:
	mov r1, r2
	mov r2, r3
	bl MIi_CpuCopy32
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D0CA8: .word GXi_DmaId
_020D0CAC: .word sClrImg
	arm_func_end GX_LoadClearImageColor

	arm_func_start GX_LoadClearImageDepth
GX_LoadClearImageDepth: ; 0x020D0CB0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r2, _020D0D14 ; =GXi_DmaId
	ldr ip, _020D0D18 ; =sClrImg
	ldr lr, [r2]
	mvn r2, #0
	mov r5, r0
	mov r3, r1
	cmp lr, r2
	ldr r4, [ip, #0x10]
	beq _020D0D00
	mov ip, #0
	str ip, [sp]
	mov r0, lr
	mov r1, r5
	add r2, r4, #0x20000
	str ip, [sp, #4]
	bl MI_DmaCopy32Async
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
_020D0D00:
	mov r2, r3
	add r1, r4, #0x20000
	bl MIi_CpuCopy32
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020D0D14: .word GXi_DmaId
_020D0D18: .word sClrImg
	arm_func_end GX_LoadClearImageDepth

	arm_func_start GX_EndLoadClearImage
GX_EndLoadClearImage: ; 0x020D0D1C
	stmdb sp!, {r3, lr}
	ldr r0, _020D0D58 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _020D0D38
	bl MI_WaitDma
_020D0D38:
	ldr r0, _020D0D5C ; =sClrImg
	ldr r0, [r0]
	bl GX_SetBankForClearImage
	ldr r0, _020D0D5C ; =sClrImg
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D0D58: .word GXi_DmaId
_020D0D5C: .word sClrImg
	arm_func_end GX_EndLoadClearImage

	.rodata

sTexPlttStartAddrTable: ; 0x0210D5E0
	.short 0x0000
	.short 0x6880
	.short 0x6890
	.short 0x6880
	.short 0x6894
	.short 0x0000
	.short 0x6890
	.short 0x6880

sTexStartAddrTable: ; 0x0210D5F0
	.short 0x0000, 0x0000, 0x0000
	.short 0x6800, 0x0000, 0x0000
	.short 0x6820, 0x0000, 0x0000
	.short 0x6800, 0x0000, 0x0000
	.short 0x6840, 0x0000, 0x0000
	.short 0x6800, 0x6840, 0x0020
	.short 0x6820, 0x0000, 0x0000
	.short 0x6800, 0x0000, 0x0000
	.short 0x6860, 0x0000, 0x0000
	.short 0x6800, 0x6860, 0x0020
	.short 0x6820, 0x6860, 0x0020
	.short 0x6800, 0x6860, 0x0040
	.short 0x6840, 0x0000, 0x0000
	.short 0x6800, 0x6840, 0x0020
	.short 0x6820, 0x0000, 0x0000
	.short 0x6800, 0x0000, 0x0000
