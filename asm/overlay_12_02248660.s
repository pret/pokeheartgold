#include "constants/pokemon.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text
    
	thumb_func_start ov12_02248660
ov12_02248660: ; 0x02248660
	push {r3, r4, r5, lr}
	ldr r1, _022486A4 ; =0x00003158
	add r5, r0, #0
	mov r0, #5
	bl AllocFromHeap
	add r4, r0, #0
	ldr r2, _022486A4 ; =0x00003158
	mov r0, #0
	add r1, r4, #0
	bl MIi_CpuClearFast
	add r0, r4, #0
	bl ov12_02250F44
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02251038
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224E384
	ldr r0, _022486A8 ; =0x000003DE
	add r0, r4, r0
	bl LoadAllWazaTbl
	mov r0, #5
	bl LoadAllItemData
	ldr r1, _022486AC ; =0x00002120
	str r0, [r4, r1]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022486A4: .word 0x00003158
_022486A8: .word 0x000003DE
_022486AC: .word 0x00002120
	thumb_func_end ov12_02248660

	thumb_func_start ov12_022486B0
ov12_022486B0: ; 0x022486B0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _022486F4 ; =0x0000311F
	add r5, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	bne _022486D6
	bl ov12_0223BD14
	cmp r0, #0
	beq _022486D6
	add r0, r5, #0
	bl ov12_0223BD14
	mov r1, #0x40
	tst r0, r1
	bne _022486D6
	mov r0, #0x2a
	str r0, [r4, #8]
_022486D6:
	ldr r2, [r4, #8]
	add r0, r5, #0
	lsl r3, r2, #2
	ldr r2, _022486F8 ; =ov12_0226CA90
	add r1, r4, #0
	ldr r2, [r2, r3]
	blx r2
	ldr r0, [r4, #8]
	cmp r0, #0x2d
	bne _022486EE
	mov r0, #1
	pop {r3, r4, r5, pc}
_022486EE:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_022486F4: .word 0x0000311F
_022486F8: .word ov12_0226CA90
	thumb_func_end ov12_022486B0

	thumb_func_start ov12_022486FC
ov12_022486FC: ; 0x022486FC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02248710 ; =0x00002120
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
_02248710: .word 0x00002120
	thumb_func_end ov12_022486FC

	thumb_func_start ov12_02248714
ov12_02248714: ; 0x02248714
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r6, [sp, #0x20]
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	str r3, [sp, #4]
	str r6, [sp]
	bl ov12_0224BCC4
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #4]
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov12_0224C018
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_02248714

	thumb_func_start ov12_0224873C
ov12_0224873C: ; 0x0224873C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r5, r1, #0
	bl ov12_0223A7F0
	add r7, r0, #0
	mov r4, #0
	cmp r7, #0
	ble _02248764
_0224874E:
	ldr r3, _02248774 ; =0x0000219C
	add r6, r5, r4
	ldrb r3, [r6, r3]
	ldr r0, [sp]
	add r1, r5, #0
	add r2, r4, #0
	bl ov12_0224E4FC
	add r4, r4, #1
	cmp r4, r7
	blt _0224874E
_02248764:
	ldr r0, _02248778 ; =0x00002E4C
	ldr r1, [r5, r0]
	ldr r0, _0224877C ; =0x00003122
	strh r1, [r5, r0]
	mov r0, #1
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02248774: .word 0x0000219C
_02248778: .word 0x00002E4C
_0224877C: .word 0x00003122
	thumb_func_end ov12_0224873C

	thumb_func_start ov12_02248780
ov12_02248780: ; 0x02248780
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #2
	str r0, [r4, #0xc]
	pop {r4, pc}
	thumb_func_end ov12_02248780

	thumb_func_start ov12_02248798
ov12_02248798: ; 0x02248798
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov12_02250D4C
	cmp r0, #0
	beq _022487BA
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x29
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #3
	str r0, [r4, #0xc]
	b _022487BE
_022487BA:
	mov r0, #3
	str r0, [r4, #8]
_022487BE:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02252D3C
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02248798

	thumb_func_start ov12_022487C8
ov12_022487C8: ; 0x022487C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov12_02253194
	add r2, r0, #0
	beq _022487E8
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_022487E8:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02252D3C
	add r0, r5, #0
	bl ov12_0223C0C4
	mov r0, #4
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_022487C8

	thumb_func_start ov12_022487FC
ov12_022487FC: ; 0x022487FC
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r7, r1, #0
	bl ov12_0223A7F0
	add r5, r0, #0
	mov r4, #0
	cmp r5, #0
	ble _0224882C
	add r6, r7, #0
	add r2, r4, #0
_02248812:
	mov r0, #0xb7
	strb r2, [r7, r4]
	lsl r0, r0, #6
	ldr r1, [r6, r0]
	add r0, r0, #4
	str r1, [r6, r0]
	add r3, r7, r4
	ldr r0, _02248844 ; =0x0000314C
	add r4, r4, #1
	strb r2, [r3, r0]
	add r6, #0xc0
	cmp r4, r5
	blt _02248812
_0224882C:
	ldr r0, [sp]
	mov r1, #0
	bl ov12_0223BB64
	ldr r0, [sp]
	mov r1, #1
	bl ov12_02237ED0
	mov r0, #5
	str r0, [r7, #8]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02248844: .word 0x0000314C
	thumb_func_end ov12_022487FC

	thumb_func_start ov12_02248848
ov12_02248848: ; 0x02248848
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xa0
	add r7, r0, #0
	str r1, [sp, #0x1c]
	bl ov12_0223A7F0
	str r0, [sp, #0x64]
	add r0, r7, #0
	bl ov12_0223A7E0
	str r0, [sp, #0x28]
	mov r4, #0
	ldr r0, [sp, #0x64]
	str r4, [sp, #0x60]
	cmp r0, #0
	bgt _0224886C
	bl _0224912A
_0224886C:
	ldr r0, [sp, #0x1c]
	mov r1, #0x75
	lsl r1, r1, #2
	str r0, [sp, #0x58]
	add r0, r0, r1
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x1c]
	ldr r1, _02248B84 ; =0x000021AC
	str r0, [sp, #0x50]
	str r0, [sp, #0x4c]
	str r0, [sp, #0x48]
	add r0, r0, r1
	str r0, [sp, #0x44]
	mov r1, #0x23
	ldr r0, [sp, #0x1c]
	lsl r1, r1, #8
	add r0, r0, r1
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x28]
	mov r1, #2
	and r0, r1
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x28]
	mov r1, #8
	and r0, r1
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x28]
	lsl r1, r1, #6
	and r0, r1
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x28]
	mov r1, #0x20
	and r0, r1
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x28]
	mov r1, #4
	and r0, r1
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	mov r1, #0x80
	and r0, r1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x28]
	mov r1, #1
	and r0, r1
	str r0, [sp, #0x20]
	thumb_func_end ov12_02248848

	thumb_func_start ov12_022488C8
ov12_022488C8: ; 0x022488C8
	ldr r0, [sp, #0x1c]
	add r5, r0, r4
	ldrb r0, [r0, r4]
	cmp r0, #0x11
	bls _022488D6
	bl _022490F0
_022488D6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022488E2: ; jump table
	.short _02248906 - _022488E2 - 2 ; case 0
	.short _022489E6 - _022488E2 - 2 ; case 1
	.short _022489A2 - _022488E2 - 2 ; case 2
	.short _02248C86 - _022488E2 - 2 ; case 3
	.short _02248C94 - _022488E2 - 2 ; case 4
	.short _02248D7A - _022488E2 - 2 ; case 5
	.short _02248DB4 - _022488E2 - 2 ; case 6
	.short _02248DF4 - _022488E2 - 2 ; case 7
	.short _02248E02 - _022488E2 - 2 ; case 8
	.short _02248E30 - _022488E2 - 2 ; case 9
	.short _02248EA4 - _022488E2 - 2 ; case 10
	.short _02248F02 - _022488E2 - 2 ; case 11
	.short _02248FFA - _022488E2 - 2 ; case 12
	.short _0224904A - _022488E2 - 2 ; case 13
	.short _0224907E - _022488E2 - 2 ; case 14
	.short _02249086 - _022488E2 - 2 ; case 15
	.short _022490A0 - _022488E2 - 2 ; case 16
	.short _022490E4 - _022488E2 - 2 ; case 17
_02248906:
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _0224892A
	ldr r0, [sp, #0x38]
	cmp r0, #0
	bne _0224892A
	cmp r4, #2
	bne _0224891E
	ldr r0, [sp, #0x1c]
	ldrb r0, [r0]
	cmp r0, #0xe
	bne _02248A16
_0224891E:
	cmp r4, #3
	bne _0224892A
	ldr r0, [sp, #0x1c]
	ldrb r0, [r0, #1]
	cmp r0, #0xe
	bne _02248A16
_0224892A:
	add r0, r4, #0
	bl MaskOfFlagNo
	ldr r2, _02248B88 ; =0x00003108
	ldr r1, [sp, #0x1c]
	ldrb r1, [r1, r2]
	tst r0, r1
	beq _02248948
	mov r0, #0xd
	strb r0, [r5]
	ldr r1, _02248B8C ; =0x000021A8
	ldr r0, [sp, #0x58]
	mov r2, #0x28
	str r2, [r0, r1]
	b _022490F0
_02248948:
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_022567A0
	cmp r0, #0
	bne _0224896C
	ldr r0, [sp, #0x54]
	mov r2, #0xd
	ldr r1, [r0]
	mov r0, #2
	orr r1, r0
	ldr r0, [sp, #0x54]
	str r1, [r0]
	ldr r1, _02248B8C ; =0x000021A8
	ldr r0, [sp, #0x58]
	strb r2, [r5]
	str r2, [r0, r1]
	b _022490F0
_0224896C:
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_0223A7E8
	bl ov12_02261264
	cmp r0, #1
	beq _02248988
	mov r1, #0x15
	ldr r0, [sp, #0x1c]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _0224899C
_02248988:
	ldr r3, _02248B90 ; =0x0000219C
	ldr r1, [sp, #0x1c]
	ldrb r3, [r5, r3]
	add r0, r7, #0
	add r2, r4, #0
	bl ov12_02262B80
	mov r0, #1
	strb r0, [r5]
	b _022490F0
_0224899C:
	mov r0, #2
	strb r0, [r5]
	b _022490F0
_022489A2:
	ldr r0, [sp, #0x64]
	mov r6, #0
	cmp r0, #0
	ble _022489CE
_022489AA:
	cmp r6, r4
	beq _022489C6
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0223A7E8
	bl ov12_02261264
	cmp r0, #1
	bne _022489C6
	ldr r0, [sp, #0x1c]
	ldrb r0, [r0, r6]
	cmp r0, #0xe
	bne _022489CE
_022489C6:
	ldr r0, [sp, #0x64]
	add r6, r6, #1
	cmp r6, r0
	blt _022489AA
_022489CE:
	ldr r0, [sp, #0x64]
	cmp r6, r0
	bne _02248A16
	ldr r3, _02248B90 ; =0x0000219C
	ldr r1, [sp, #0x1c]
	ldrb r3, [r5, r3]
	add r0, r7, #0
	add r2, r4, #0
	bl ov12_02262B80
	mov r0, #1
	strb r0, [r5]
_022489E6:
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #0
	beq _02248A16
	mov r1, #0x23
	ldr r0, [sp, #0x50]
	lsl r1, r1, #8
	ldrb r2, [r0, r1]
	ldr r1, _02248B94 ; =0x000021B4
	ldr r0, [sp, #0x58]
	str r2, [r0, r1]
	ldr r0, [sp, #0x34]
	cmp r0, #0
	beq _02248A3A
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #1
	beq _02248A18
	cmp r0, #4
	beq _02248A28
_02248A16:
	b _022490F0
_02248A18:
	mov r0, #0x11
	strb r0, [r5]
	mov r1, #0xd
	strb r1, [r5, #4]
	ldr r2, _02248B8C ; =0x000021A8
	ldr r1, [sp, #0x58]
	str r0, [r1, r2]
	b _022490F0
_02248A28:
	mov r0, #0x11
	strb r0, [r5]
	mov r0, #0xd
	strb r0, [r5, #4]
	ldr r1, _02248B8C ; =0x000021A8
	ldr r0, [sp, #0x58]
	mov r2, #0x10
	str r2, [r0, r1]
	b _022490F0
_02248A3A:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _02248ABC
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #5
	bhi _02248AFE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02248A58: ; jump table
	.short _022490F0 - _02248A58 - 2 ; case 0
	.short _02248A64 - _02248A58 - 2 ; case 1
	.short _02248A74 - _02248A58 - 2 ; case 2
	.short _02248A86 - _02248A58 - 2 ; case 3
	.short _02248A98 - _02248A58 - 2 ; case 4
	.short _02248AAA - _02248A58 - 2 ; case 5
_02248A64:
	mov r0, #0x11
	strb r0, [r5]
	mov r1, #0xd
	strb r1, [r5, #4]
	ldr r2, _02248B8C ; =0x000021A8
	ldr r1, [sp, #0x58]
	str r0, [r1, r2]
	b _022490F0
_02248A74:
	mov r0, #0x11
	strb r0, [r5]
	mov r0, #0xd
	strb r0, [r5, #4]
	ldr r1, _02248B8C ; =0x000021A8
	ldr r0, [sp, #0x58]
	mov r2, #0x12
	str r2, [r0, r1]
	b _022490F0
_02248A86:
	mov r0, #0x11
	strb r0, [r5]
	mov r0, #0xd
	strb r0, [r5, #4]
	ldr r1, _02248B8C ; =0x000021A8
	ldr r0, [sp, #0x58]
	mov r2, #0x13
	str r2, [r0, r1]
	b _022490F0
_02248A98:
	mov r0, #0x11
	strb r0, [r5]
	mov r0, #0xd
	strb r0, [r5, #4]
	ldr r1, _02248B8C ; =0x000021A8
	ldr r0, [sp, #0x58]
	mov r2, #0x10
	str r2, [r0, r1]
	b _022490F0
_02248AAA:
	mov r0, #0x11
	strb r0, [r5]
	mov r0, #0xd
	strb r0, [r5]
	ldr r1, _02248B8C ; =0x000021A8
	ldr r0, [sp, #0x58]
	mov r2, #0x14
	str r2, [r0, r1]
	b _022490F0
_02248ABC:
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #0xff
	beq _02248AD2
	ldr r1, _02248B98 ; =0x0000314C
	mov r0, #1
	ldrb r2, [r5, r1]
	orr r0, r2
	strb r0, [r5, r1]
_02248AD2:
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #4
	bgt _02248AF8
	cmp r0, #0
	blt _02248AFE
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02248AEE: ; jump table
	.short _022490F0 - _02248AEE - 2 ; case 0
	.short _02248B00 - _02248AEE - 2 ; case 1
	.short _02248BB6 - _02248AEE - 2 ; case 2
	.short _02248C2C - _02248AEE - 2 ; case 3
	.short _02248C3A - _02248AEE - 2 ; case 4
_02248AF8:
	cmp r0, #0xff
	bne _02248AFE
	b _02248C48
_02248AFE:
	b _022490F0
_02248B00:
	mov r0, #0
	mvn r0, r0
	str r0, [sp]
	ldr r1, [sp, #0x1c]
	add r0, r7, #0
	add r2, r4, #0
	mov r3, #0
	bl ov12_022517EC
	cmp r0, #0xf
	bne _02248B40
	ldr r0, [sp, #0x54]
	ldr r1, [r0]
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r1, r0
	ldr r0, [sp, #0x54]
	str r1, [r0]
	add r0, r7, #0
	bl ov12_0223B514
	mov r1, #0x10
	tst r0, r1
	beq _02248B38
	mov r0, #0xd
	strb r0, [r5]
	b _02248BAC
_02248B38:
	mov r0, #0x11
	strb r0, [r5]
	strb r1, [r5, #4]
	b _02248BAC
_02248B40:
	ldr r3, _02248B9C ; =0x00002DEC
	ldr r0, [sp, #0x4c]
	ldrh r0, [r0, r3]
	cmp r0, #0
	beq _02248BA8
	ldr r0, [sp, #0x4c]
	add r1, r3, #2
	ldrh r2, [r0, r1]
	ldr r1, _02248BA0 ; =0x000030BC
	ldr r0, [sp, #0x48]
	strh r2, [r0, r1]
	ldr r0, [sp, #0x4c]
	sub r1, #8
	ldrh r2, [r0, r3]
	ldr r0, [sp, #0x48]
	strh r2, [r0, r1]
	ldr r1, _02248BA4 ; =0x000021B0
	ldr r0, [sp, #0x58]
	mov r2, #0
	str r2, [r0, r1]
	add r0, r7, #0
	bl ov12_0223B514
	mov r1, #0x10
	tst r0, r1
	beq _02248B7A
	mov r0, #0xd
	strb r0, [r5]
	b _02248BAC
_02248B7A:
	mov r0, #0x11
	strb r0, [r5]
	mov r0, #0xd
	strb r0, [r5, #4]
	b _02248BAC
	.balign 4, 0
_02248B84: .word 0x000021AC
_02248B88: .word 0x00003108
_02248B8C: .word 0x000021A8
_02248B90: .word 0x0000219C
_02248B94: .word 0x000021B4
_02248B98: .word 0x0000314C
_02248B9C: .word 0x00002DEC
_02248BA0: .word 0x000030BC
_02248BA4: .word 0x000021B0
_02248BA8:
	mov r0, #3
	strb r0, [r5]
_02248BAC:
	ldr r1, _02248EB8 ; =0x000021A8
	ldr r0, [sp, #0x58]
	mov r2, #0xd
	str r2, [r0, r1]
	b _022490F0
_02248BB6:
	add r0, r7, #0
	bl ov12_0223A7E0
	mov r1, #1
	lsl r1, r1, #0xc
	tst r0, r1
	beq _02248BD6
	mov r0, #0x11
	strb r0, [r5]
	mov r0, #0xd
	strb r0, [r5, #4]
	ldr r1, _02248EB8 ; =0x000021A8
	ldr r0, [sp, #0x58]
	mov r2, #0x15
	str r2, [r0, r1]
	b _022490F0
_02248BD6:
	add r0, r7, #0
	bl ov12_0223A7E0
	mov r1, #0x84
	tst r0, r1
	beq _02248C1E
	ldr r1, _02248EBC ; =0x00000251
	add r0, sp, #0x78
	strh r1, [r0, #6]
	mov r1, #0
	strb r1, [r0, #5]
	mov r0, sp
	str r0, [sp, #0x68]
	sub r0, #8
	str r0, [sp, #0x68]
	add r2, sp, #0x7c
	add r3, r0, #0
	mov r6, #4
_02248BFA:
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r6, r6, #1
	bne _02248BFA
	ldr r0, [r2]
	add r1, r4, #0
	str r0, [r3]
	ldr r0, [sp, #0x68]
	ldmia r0!, {r2, r3}
	str r0, [sp, #0x68]
	add r0, r7, #0
	bl ov12_022639B8
	mov r0, #0xf
	strb r0, [r5]
	mov r0, #0
	strb r0, [r5, #4]
	b _022490F0
_02248C1E:
	ldr r1, _02248EB8 ; =0x000021A8
	ldr r0, [sp, #0x58]
	mov r2, #0xe
	str r2, [r0, r1]
	mov r0, #7
	strb r0, [r5]
	b _022490F0
_02248C2C:
	ldr r1, _02248EB8 ; =0x000021A8
	ldr r0, [sp, #0x58]
	mov r2, #0xf
	str r2, [r0, r1]
	mov r0, #9
	strb r0, [r5]
	b _022490F0
_02248C3A:
	ldr r1, _02248EB8 ; =0x000021A8
	ldr r0, [sp, #0x58]
	mov r2, #0x10
	str r2, [r0, r1]
	mov r0, #0xb
	strb r0, [r5]
	b _022490F0
_02248C48:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	beq _02248C6A
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_02263CCC
	mov r0, #0
	strb r0, [r5]
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_0223AB6C
	ldr r1, [sp, #0x1c]
	mov r2, #0
	strb r2, [r1, r0]
	b _022490F0
_02248C6A:
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _02248CB2
	cmp r4, #2
	bne _02248CB2
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_02263CCC
	ldr r0, [sp, #0x1c]
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #2]
	b _022490F0
_02248C86:
	ldr r1, [sp, #0x1c]
	add r0, r7, #0
	add r2, r4, #0
	bl ov12_02262F40
	mov r0, #4
	strb r0, [r5]
_02248C94:
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #0xff
	bne _02248CA6
	mov r0, #0
	strb r0, [r5]
	b _022490F0
_02248CA6:
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #0
	bne _02248CB4
_02248CB2:
	b _022490F0
_02248CB4:
	mov r1, #0x23
	ldr r0, [sp, #0x50]
	lsl r1, r1, #8
	ldrb r0, [r0, r1]
	sub r3, r0, #1
	cmp r3, #4
	bne _02248CD0
	ldr r1, _02248EB8 ; =0x000021A8
	ldr r0, [sp, #0x58]
	mov r2, #0x10
	str r2, [r0, r1]
	mov r0, #0xb
	strb r0, [r5]
	b _022490F0
_02248CD0:
	add r0, sp, #0x7c
	str r0, [sp]
	ldr r1, [sp, #0x1c]
	add r0, r7, #0
	add r2, r4, #0
	bl ov12_02251A28
	cmp r0, #0
	bne _02248D38
	add r0, r7, #0
	bl ov12_0223B514
	mov r1, #0x10
	tst r0, r1
	beq _02248D06
	add r0, r7, #0
	mov r1, #1
	bl ov12_0223BFFC
	add r0, r7, #0
	bl ov12_0223A7E4
	add r1, r0, #0
	add r0, r7, #0
	bl ov12_022581BC
	b _022490F0
_02248D06:
	mov r0, sp
	str r0, [sp, #0x6c]
	sub r0, #8
	str r0, [sp, #0x6c]
	add r2, sp, #0x7c
	add r3, r0, #0
	mov r6, #4
_02248D14:
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r6, r6, #1
	bne _02248D14
	ldr r0, [r2]
	add r1, r4, #0
	str r0, [r3]
	ldr r0, [sp, #0x6c]
	ldmia r0!, {r2, r3}
	str r0, [sp, #0x6c]
	add r0, r7, #0
	bl ov12_022639B8
	mov r0, #0xf
	strb r0, [r5]
	mov r0, #3
	strb r0, [r5, #4]
	b _022490F0
_02248D38:
	mov r3, #0x23
	ldr r0, [sp, #0x50]
	lsl r3, r3, #8
	ldrb r2, [r0, r3]
	ldr r1, _02248EC0 ; =0x000021B0
	ldr r0, [sp, #0x58]
	str r2, [r0, r1]
	ldr r0, [sp, #0x50]
	ldrb r0, [r0, r3]
	ldr r3, _02248EC4 ; =0x000030BC
	sub r1, r0, #1
	ldr r0, [sp, #0x48]
	strh r1, [r0, r3]
	ldrh r0, [r0, r3]
	lsl r1, r0, #1
	ldr r0, [sp, #0x4c]
	add r1, r0, r1
	ldr r0, _02248EC8 ; =0x00002D4C
	ldrh r2, [r1, r0]
	add r1, r3, #0
	ldr r0, [sp, #0x48]
	sub r1, #8
	strh r2, [r0, r1]
	mov r0, #5
	strb r0, [r5]
	add r0, r3, #0
	add r0, #0x90
	ldrb r1, [r5, r0]
	mov r0, #2
	add r3, #0x90
	orr r0, r1
	strb r0, [r5, r3]
	b _022490F0
_02248D7A:
	add r0, sp, #0x78
	str r0, [sp]
	ldr r1, _02248EC4 ; =0x000030BC
	ldr r0, [sp, #0x48]
	lsl r2, r4, #0x18
	ldrh r0, [r0, r1]
	ldr r1, [sp, #0x1c]
	ldr r3, [sp, #0x28]
	str r0, [sp, #4]
	ldr r0, [sp, #0x44]
	lsr r2, r2, #0x18
	str r0, [sp, #8]
	add r0, r7, #0
	bl ov12_0224DB64
	cmp r0, #0
	beq _02248DAE
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x78]
	add r0, r7, #0
	add r3, r4, #0
	bl ov12_02262FFC
	mov r0, #6
	strb r0, [r5]
	b _022490F0
_02248DAE:
	mov r0, #0xd
	strb r0, [r5]
	b _022490F0
_02248DB4:
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #0xff
	bne _02248DC6
	mov r0, #3
	strb r0, [r5]
	b _022490F0
_02248DC6:
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #0
	bne _02248DD4
	b _022490F0
_02248DD4:
	mov r1, #0x23
	ldr r0, [sp, #0x50]
	lsl r1, r1, #8
	ldrb r0, [r0, r1]
	ldr r1, _02248ECC ; =0x000021AC
	sub r2, r0, #1
	ldr r0, [sp, #0x58]
	str r2, [r0, r1]
	mov r0, #0xd
	strb r0, [r5]
	ldr r1, _02248ED0 ; =0x0000314C
	mov r0, #4
	ldrb r2, [r5, r1]
	orr r0, r2
	strb r0, [r5, r1]
	b _022490F0
_02248DF4:
	ldr r1, [sp, #0x1c]
	add r0, r7, #0
	add r2, r4, #0
	bl ov12_02263138
	mov r0, #8
	strb r0, [r5]
_02248E02:
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #0xff
	bne _02248E14
	mov r0, #0
	strb r0, [r5]
	b _022490F0
_02248E14:
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #0
	beq _02248EE0
	ldr r0, [sp, #0x40]
	ldr r1, _02248EC0 ; =0x000021B0
	ldr r2, [r0]
	ldr r0, [sp, #0x58]
	str r2, [r0, r1]
	mov r0, #0xd
	strb r0, [r5]
	b _022490F0
_02248E30:
	ldr r1, [sp, #0x1c]
	add r0, r7, #0
	add r2, r4, #0
	mov r6, #6
	bl ov12_02255920
	str r0, [sp, #0x5c]
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_0223AB0C
	cmp r0, #4
	beq _02248E56
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_0223AB0C
	cmp r0, #5
	bne _02248E8E
_02248E56:
	ldr r0, [sp, #0x28]
	cmp r0, #3
	beq _02248E74
	cmp r0, #7
	beq _02248E74
	cmp r0, #0x83
	beq _02248E74
	cmp r0, #0x13
	bne _02248E8E
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_0223AB0C
	cmp r0, #4
	bne _02248E8E
_02248E74:
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_0223AB6C
	lsl r1, r0, #4
	ldr r0, [sp, #0x1c]
	add r2, r0, r1
	ldr r0, _02248EB8 ; =0x000021A8
	ldr r1, [r2, r0]
	cmp r1, #0xf
	bne _02248E8E
	add r0, #8
	ldr r6, [r2, r0]
_02248E8E:
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x1c]
	str r0, [sp]
	add r0, r7, #0
	add r2, r4, #0
	mov r3, #0
	str r6, [sp, #4]
	bl ov12_022632DC
	mov r0, #0xa
	strb r0, [r5]
_02248EA4:
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #0xff
	bne _02248ED4
	mov r0, #0
	strb r0, [r5]
	b _022490F0
	nop
_02248EB8: .word 0x000021A8
_02248EBC: .word 0x00000251
_02248EC0: .word 0x000021B0
_02248EC4: .word 0x000030BC
_02248EC8: .word 0x00002D4C
_02248ECC: .word 0x000021AC
_02248ED0: .word 0x0000314C
_02248ED4:
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #0
	bne _02248EE2
_02248EE0:
	b _022490F0
_02248EE2:
	mov r3, #0x23
	ldr r0, [sp, #0x50]
	lsl r3, r3, #8
	ldrb r0, [r0, r3]
	ldr r1, _0224917C ; =0x000021B0
	sub r2, r0, #1
	ldr r0, [sp, #0x58]
	str r2, [r0, r1]
	ldr r0, [sp, #0x50]
	sub r1, #0x10
	ldrb r0, [r0, r3]
	sub r0, r0, #1
	strb r0, [r5, r1]
	mov r0, #0xd
	strb r0, [r5]
	b _022490F0
_02248F02:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _02248F22
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r1, [sp, #0x1c]
	ldr r3, _02249180 ; =0x000003BB
	add r0, r7, #0
	add r2, r4, #0
	bl ov12_0226337C
	mov r0, #0xc
	strb r0, [r5]
	b _022490F0
_02248F22:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _02248F8E
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	bne _02248F8E
	add r0, r7, #0
	bl ov12_0223B514
	mov r1, #0x10
	tst r0, r1
	beq _02248F52
	add r0, r7, #0
	mov r1, #1
	bl ov12_0223BFFC
	add r0, r7, #0
	bl ov12_0223A7E4
	add r1, r0, #0
	add r0, r7, #0
	bl ov12_022581BC
	b _022490F0
_02248F52:
	mov r1, #0
	add r0, sp, #0x78
	strb r1, [r0, #5]
	ldr r1, _02249184 ; =0x00000319
	add r2, sp, #0x7c
	strh r1, [r0, #6]
	mov r0, sp
	str r0, [sp, #0x70]
	sub r0, #8
	str r0, [sp, #0x70]
	add r3, r0, #0
	mov r6, #4
_02248F6A:
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r6, r6, #1
	bne _02248F6A
	ldr r0, [r2]
	add r1, r4, #0
	str r0, [r3]
	ldr r0, [sp, #0x70]
	ldmia r0!, {r2, r3}
	str r0, [sp, #0x70]
	add r0, r7, #0
	bl ov12_022639B8
	mov r0, #0xf
	strb r0, [r5]
	mov r0, #0
	strb r0, [r5, #4]
	b _022490F0
_02248F8E:
	ldr r1, [sp, #0x1c]
	add r0, r7, #0
	add r2, r4, #0
	add r3, sp, #0x7c
	bl ov12_02252980
	cmp r0, #0
	beq _02248FF4
	add r0, r7, #0
	bl ov12_0223B514
	mov r1, #0x10
	tst r0, r1
	beq _02248FC2
	add r0, r7, #0
	mov r1, #1
	bl ov12_0223BFFC
	add r0, r7, #0
	bl ov12_0223A7E4
	add r1, r0, #0
	add r0, r7, #0
	bl ov12_022581BC
	b _022490F0
_02248FC2:
	mov r0, sp
	str r0, [sp, #0x74]
	sub r0, #8
	str r0, [sp, #0x74]
	add r2, sp, #0x7c
	add r3, r0, #0
	mov r6, #4
_02248FD0:
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r6, r6, #1
	bne _02248FD0
	ldr r0, [r2]
	add r1, r4, #0
	str r0, [r3]
	ldr r0, [sp, #0x74]
	ldmia r0!, {r2, r3}
	str r0, [sp, #0x74]
	add r0, r7, #0
	bl ov12_022639B8
	mov r0, #0xf
	strb r0, [r5]
	mov r0, #0
	strb r0, [r5, #4]
	b _022490F0
_02248FF4:
	mov r0, #0xc
	strb r0, [r5]
	b _022490F0
_02248FFA:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _02249024
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #0
	beq _02249028
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #0xff
	bne _0224901E
	mov r0, #0
	strb r0, [r5]
	b _02249028
_0224901E:
	mov r0, #0xd
	strb r0, [r5]
	b _02249028
_02249024:
	mov r0, #0xd
	strb r0, [r5]
_02249028:
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _022490F0
	ldr r0, [sp, #0x38]
	cmp r0, #0
	bne _022490F0
	ldrb r0, [r5]
	cmp r0, #0xd
	bne _022490F0
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_0223AB6C
	ldr r1, [sp, #0x1c]
	mov r2, #0xd
	strb r2, [r1, r0]
	b _022490F0
_0224904A:
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_02263CCC
	ldr r0, [sp, #0x28]
	cmp r0, #7
	bne _02249072
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_0223AB6C
	ldr r1, [sp, #0x1c]
	ldrb r0, [r1, r0]
	cmp r0, #0xe
	bne _0224907A
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_02263F30
	b _0224907A
_02249072:
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_02263F30
_0224907A:
	mov r0, #0xe
	strb r0, [r5]
_0224907E:
	ldr r0, [sp, #0x60]
	add r0, r0, #1
	str r0, [sp, #0x60]
	b _022490F0
_02249086:
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0225682C
	cmp r0, #0
	beq _022490F0
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_0224EDC0
	ldrb r0, [r5, #4]
	strb r0, [r5]
	b _022490F0
_022490A0:
	mov r1, #2
	add r0, sp, #0x78
	strb r1, [r0, #5]
	mov r1, #0x26
	lsl r1, r1, #4
	strh r1, [r0, #6]
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	bl ov12_022522E0
	str r0, [sp, #0x80]
	mov r0, sp
	sub r0, #8
	mov ip, r0
	add r2, sp, #0x7c
	add r3, r0, #0
	mov r6, #4
_022490C2:
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r6, r6, #1
	bne _022490C2
	ldr r0, [r2]
	add r1, r4, #0
	str r0, [r3]
	mov r0, ip
	ldmia r0!, {r2, r3}
	add r0, r7, #0
	bl ov12_022639B8
	mov r0, #0xf
	strb r0, [r5]
	mov r0, #0xd
	strb r0, [r5, #4]
	b _022490F0
_022490E4:
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_02263E18
	ldrb r0, [r5, #4]
	strb r0, [r5]
_022490F0:
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #0x50]
	add r0, #0x10
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x54]
	add r4, r4, #1
	add r0, #0x40
	str r0, [sp, #0x54]
	mov r0, #1
	lsl r0, r0, #8
	add r1, r1, r0
	str r1, [sp, #0x50]
	ldr r1, [sp, #0x4c]
	add r1, #0xc0
	str r1, [sp, #0x4c]
	ldr r1, [sp, #0x48]
	add r1, r1, #2
	str r1, [sp, #0x48]
	ldr r1, [sp, #0x44]
	add r1, #0x10
	str r1, [sp, #0x44]
	ldr r1, [sp, #0x40]
	add r0, r1, r0
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x64]
	cmp r4, r0
	bge _0224912A
	bl ov12_022488C8
_0224912A:
	ldr r1, [sp, #0x60]
	ldr r0, [sp, #0x64]
	cmp r1, r0
	bne _02249176
	ldr r1, [sp, #0x1c]
	add r0, r7, #0
	bl ov12_0224E414
	add r0, r7, #0
	mov r1, #0
	bl ov12_02237ED0
	ldr r0, [sp, #0x1c]
	mov r1, #6
	str r1, [r0, #8]
	ldr r0, [sp, #0x64]
	mov r6, #0
	cmp r0, #0
	ble _02249176
	ldr r4, [sp, #0x1c]
_02249152:
	ldr r0, _02249188 ; =0x000021A8
	ldr r0, [r4, r0]
	cmp r0, #0xf
	bne _0224916C
	ldr r1, [sp, #0x1c]
	add r0, r7, #0
	add r3, r1, #0
	add r5, r3, r6
	ldr r3, _0224918C ; =0x000021A0
	add r2, r6, #0
	ldrb r3, [r5, r3]
	bl ov12_02256F78
_0224916C:
	ldr r0, [sp, #0x64]
	add r6, r6, #1
	add r4, #0x10
	cmp r6, r0
	blt _02249152
_02249176:
	add sp, #0xa0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224917C: .word 0x000021B0
_02249180: .word 0x000003BB
_02249184: .word 0x00000319
_02249188: .word 0x000021A8
_0224918C: .word 0x000021A0
	thumb_func_end ov12_022488C8

	thumb_func_start ov12_02249190
ov12_02249190: ; 0x02249190
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #4]
	add r5, r1, #0
	bl ov12_0223A7F0
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	bl ov12_0223A7E0
	mov r2, #0x22
	lsl r2, r2, #4
	mov r1, #0
	tst r2, r0
	beq _022491C6
	ldr r0, [sp, #0x14]
	add r4, r1, #0
	cmp r0, #0
	ble _022491C4
	ldr r1, _02249300 ; =0x000021E8
_022491B8:
	add r0, r5, r4
	strb r4, [r0, r1]
	ldr r0, [sp, #0x14]
	add r4, r4, #1
	cmp r4, r0
	blt _022491B8
_022491C4:
	b _022492F8
_022491C6:
	mov r2, #4
	tst r0, r2
	beq _022491EE
	ldr r0, [sp, #0x14]
	add r4, r1, #0
	cmp r0, #0
	ble _02249206
	ldr r2, _02249304 ; =0x000021B4
	add r3, r5, #0
_022491D8:
	ldr r0, [r3, r2]
	cmp r0, #4
	bne _022491E2
	mov r1, #5
	b _02249206
_022491E2:
	ldr r0, [sp, #0x14]
	add r4, r4, #1
	add r3, #0x10
	cmp r4, r0
	blt _022491D8
	b _02249206
_022491EE:
	ldr r0, _02249304 ; =0x000021B4
	ldr r0, [r5, r0]
	cmp r0, #4
	bne _022491FA
	add r4, r1, #0
	mov r1, #5
_022491FA:
	ldr r0, _02249308 ; =0x000021D4
	ldr r0, [r5, r0]
	cmp r0, #4
	bne _02249206
	mov r4, #2
	mov r1, #5
_02249206:
	cmp r1, #5
	bne _0224922E
	ldr r0, _02249300 ; =0x000021E8
	ldr r2, [sp, #0x14]
	strb r4, [r5, r0]
	mov r1, #1
	mov r0, #0
	cmp r2, #0
	ble _022492F8
	ldr r3, _02249300 ; =0x000021E8
_0224921A:
	cmp r0, r4
	beq _02249224
	add r2, r5, r1
	strb r0, [r2, r3]
	add r1, r1, #1
_02249224:
	ldr r2, [sp, #0x14]
	add r0, r0, #1
	cmp r0, r2
	blt _0224921A
	b _022492F8
_0224922E:
	ldr r0, [sp, #0x14]
	mov r2, #0
	cmp r0, #0
	ble _02249256
	ldr r4, _02249300 ; =0x000021E8
	add r0, r5, #0
	add r6, r4, #0
	sub r6, #0x34
_0224923E:
	ldr r3, [r0, r6]
	sub r3, r3, #2
	cmp r3, #1
	bhi _0224924C
	add r3, r5, r1
	strb r2, [r3, r4]
	add r1, r1, #1
_0224924C:
	ldr r3, [sp, #0x14]
	add r2, r2, #1
	add r0, #0x10
	cmp r2, r3
	blt _0224923E
_02249256:
	ldr r0, [sp, #0x14]
	mov r2, #0
	cmp r0, #0
	ble _02249280
	ldr r4, _02249300 ; =0x000021E8
	add r0, r5, #0
	add r6, r4, #0
	sub r6, #0x34
_02249266:
	ldr r3, [r0, r6]
	cmp r3, #2
	beq _02249276
	cmp r3, #3
	beq _02249276
	add r3, r5, r1
	strb r2, [r3, r4]
	add r1, r1, #1
_02249276:
	ldr r3, [sp, #0x14]
	add r2, r2, #1
	add r0, #0x10
	cmp r2, r3
	blt _02249266
_02249280:
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	sub r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #0
	ble _022492F8
_0224928E:
	ldr r0, [sp, #8]
	add r7, r0, #1
	ldr r0, [sp, #0x14]
	cmp r7, r0
	bge _022492EC
	ldr r0, [sp, #8]
	add r0, r5, r0
	str r0, [sp, #0x10]
_0224929E:
	ldr r1, [sp, #0x10]
	ldr r0, _02249300 ; =0x000021E8
	ldrb r6, [r1, r0]
	add r1, r5, r7
	ldrb r4, [r1, r0]
	lsl r0, r6, #4
	str r1, [sp, #0xc]
	add r1, r5, r0
	ldr r0, _02249304 ; =0x000021B4
	ldr r0, [r1, r0]
	lsl r1, r4, #4
	add r2, r5, r1
	ldr r1, _02249304 ; =0x000021B4
	ldr r1, [r2, r1]
	cmp r0, r1
	bne _022492E4
	cmp r0, #1
	beq _022492C6
	mov r0, #1
	b _022492C8
_022492C6:
	mov r0, #0
_022492C8:
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	add r3, r4, #0
	bl ov12_0224FC48
	cmp r0, #0
	beq _022492E4
	ldr r1, [sp, #0x10]
	ldr r0, _02249300 ; =0x000021E8
	strb r4, [r1, r0]
	ldr r1, [sp, #0xc]
	strb r6, [r1, r0]
_022492E4:
	ldr r0, [sp, #0x14]
	add r7, r7, #1
	cmp r7, r0
	blt _0224929E
_022492EC:
	ldr r0, [sp, #8]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [sp, #8]
	cmp r1, r0
	blt _0224928E
_022492F8:
	mov r0, #7
	str r0, [r5, #8]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02249300: .word 0x000021E8
_02249304: .word 0x000021B4
_02249308: .word 0x000021D4
	thumb_func_end ov12_02249190

	thumb_func_start ov12_0224930C
ov12_0224930C: ; 0x0224930C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	bl ov12_0223A7F0
	add r7, r0, #0
_0224931E:
	ldr r0, [r4, #0x28]
	cmp r0, #3
	bls _02249326
	b _02249438
_02249326:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02249332: ; jump table
	.short _0224933A - _02249332 - 2 ; case 0
	.short _022493D4 - _02249332 - 2 ; case 1
	.short _02249412 - _02249332 - 2 ; case 2
	.short _02249430 - _02249332 - 2 ; case 3
_0224933A:
	ldr r0, [r4, #0x2c]
	cmp r0, r7
	bge _022493C8
	add r6, r4, #0
	add r6, #0x2c
_02249344:
	add r1, r4, r0
	ldr r0, _0224944C ; =0x000021E8
	ldrb r5, [r1, r0]
	add r0, r5, #0
	bl MaskOfFlagNo
	ldr r1, _02249450 ; =0x00003108
	ldrb r1, [r4, r1]
	tst r0, r1
	ldr r0, [r6]
	beq _02249360
	add r0, r0, #1
	str r0, [r6]
	b _022493C2
_02249360:
	add r0, r0, #1
	str r0, [r6]
	mov r0, #0xc0
	mul r0, r5
	add r1, r4, r0
	ldr r0, _02249454 ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #7
	tst r0, r1
	bne _022493C2
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_022522F0
	mov r1, #0x42
	lsl r1, r1, #2
	cmp r0, r1
	bne _022493C2
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_02252C40
	cmp r0, #0
	bne _022493C2
	lsl r0, r5, #6
	add r1, r4, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _022493C2
	ldr r0, [sp]
	bl ov12_022642F0
	mov r0, #0x46
	lsl r0, r0, #2
	str r5, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xe8
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #8
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022493C2:
	ldr r0, [r4, #0x2c]
	cmp r0, r7
	blt _02249344
_022493C8:
	mov r0, #0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	b _02249438
_022493D4:
	mov r6, #0
	cmp r7, #0
	ble _0224940A
	add r5, r4, #0
_022493DC:
	ldr r0, _02249458 ; =0x00002DB0
	ldr r1, [r5, r0]
	mov r0, #2
	lsl r0, r0, #0x16
	tst r0, r1
	beq _02249402
	add r0, r4, #0
	add r1, r6, #0
	bl ov12_022522F0
	cmp r0, #0x63
	beq _02249402
	ldr r0, _02249458 ; =0x00002DB0
	ldr r1, [r5, r0]
	mov r0, #2
	lsl r0, r0, #0x16
	and r1, r0
	ldr r0, _02249458 ; =0x00002DB0
	str r1, [r5, r0]
_02249402:
	add r6, r6, #1
	add r5, #0xc0
	cmp r6, r7
	blt _022493DC
_0224940A:
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	b _02249438
_02249412:
	mov r6, #0
	add r5, r4, #0
_02249416:
	ldr r0, [sp]
	bl ov12_0223BD98
	ldr r1, _0224945C ; =0x0000310C
	add r6, r6, #1
	strh r0, [r5, r1]
	add r5, r5, #2
	cmp r6, #4
	blt _02249416
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	b _02249438
_02249430:
	mov r0, #0
	str r0, [r4, #0x28]
	mov r0, #2
	str r0, [sp, #4]
_02249438:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _02249440
	b _0224931E
_02249440:
	cmp r0, #2
	bne _02249448
	mov r0, #8
	str r0, [r4, #8]
_02249448:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224944C: .word 0x000021E8
_02249450: .word 0x00003108
_02249454: .word 0x00002DAC
_02249458: .word 0x00002DB0
_0224945C: .word 0x0000310C
	thumb_func_end ov12_0224930C

	thumb_func_start ov12_02249460
ov12_02249460: ; 0x02249460
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r4, r1, #0
	bl ov12_0223A7F0
	add r5, r0, #0
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_022581BC
	cmp r0, #0
	bne _022494CC
	ldr r1, _022494D0 ; =0x00003150
	mov r0, #0
	str r0, [r4, r1]
	cmp r5, #0
	ble _0224949C
	ldr r3, _022494D0 ; =0x00003150
	ldr r2, _022494D4 ; =0x000021A8
	add r1, r4, #0
_02249488:
	ldr r6, [r1, r2]
	cmp r6, #0x28
	beq _02249494
	ldr r6, [r4, r3]
	add r6, r6, #1
	str r6, [r4, r3]
_02249494:
	add r0, r0, #1
	add r1, #0x10
	cmp r0, r5
	blt _02249488
_0224949C:
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_02252D3C
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, r5
	bne _022494BC
	add r0, r4, #0
	mov r1, #0
	add r0, #0xec
	str r1, [r0]
	mov r0, #9
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022494BC:
	add r1, r4, r0
	ldr r0, _022494D8 ; =0x000021E8
	ldrb r1, [r1, r0]
	sub r0, #0x40
	lsl r1, r1, #4
	add r1, r4, r1
	ldr r0, [r1, r0]
	str r0, [r4, #8]
_022494CC:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022494D0: .word 0x00003150
_022494D4: .word 0x000021A8
_022494D8: .word 0x000021E8
	thumb_func_end ov12_02249460

	thumb_func_start ov12_022494DC
ov12_022494DC: ; 0x022494DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp]
	add r4, r1, #0
	mov r5, #0
	bl ov12_0223A7F0
	str r0, [sp, #4]
_022494EC:
	ldr r1, [r4, #8]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #1
	bl ov12_0224DC74
	cmp r0, #1
	beq _02249516
	ldr r1, [r4, #8]
	add r0, r4, #0
	add r2, r1, #0
	bl ov12_0224DD18
	cmp r0, #1
	beq _02249516
	ldr r0, [sp]
	add r1, r4, #0
	bl ov12_0224D7EC
	cmp r0, #1
	bne _02249518
_02249516:
	b _02249CBE
_02249518:
	ldr r0, [r4, #0x10]
	cmp r0, #0xd
	bhi _022495F2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224952A: ; jump table
	.short _02249546 - _0224952A - 2 ; case 0
	.short _02249600 - _0224952A - 2 ; case 1
	.short _022496AA - _0224952A - 2 ; case 2
	.short _02249756 - _0224952A - 2 ; case 3
	.short _02249804 - _0224952A - 2 ; case 4
	.short _02249880 - _0224952A - 2 ; case 5
	.short _022498FC - _0224952A - 2 ; case 6
	.short _022499BC - _0224952A - 2 ; case 7
	.short _02249A4C - _0224952A - 2 ; case 8
	.short _02249ADC - _0224952A - 2 ; case 9
	.short _02249B70 - _0224952A - 2 ; case 10
	.short _02249C06 - _0224952A - 2 ; case 11
	.short _02249C48 - _0224952A - 2 ; case 12
	.short _02249CA0 - _0224952A - 2 ; case 13
_02249546:
	ldr r6, [r4, #0x14]
	cmp r6, #2
	bge _022495EE
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r4, r0
	str r0, [sp, #0x38]
	add r0, r4, #0
	str r0, [sp, #8]
	add r0, #0x14
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0x1c]
	mov r0, #0x1c
	str r0, [sp, #0x18]
_02249564:
	lsl r0, r6, #2
	mov r1, #0x6f
	add r0, r4, r0
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	mov r1, #1
	tst r1, r2
	beq _022495DA
	ldr r1, [sp, #0x38]
	lsl r3, r6, #3
	ldr r7, [r1, r3]
	ldr r2, [sp, #0x18]
	add r1, r7, #0
	str r7, [sp, #0x2c]
	bic r1, r2
	str r1, [sp, #0x2c]
	lsl r1, r7, #0x1b
	lsr r1, r1, #0x1d
	sub r1, r1, #1
	lsl r1, r1, #0x1d
	lsr r2, r1, #0x1b
	ldr r1, [sp, #0x2c]
	orr r2, r1
	ldr r1, [sp, #0x38]
	str r2, [r1, r3]
	ldr r1, [r1, r3]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1d
	bne _022495DA
	mov r1, #0x6f
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	ldr r1, [sp, #0x1c]
	bic r2, r1
	mov r1, #0x6f
	lsl r1, r1, #2
	str r2, [r0, r1]
	mov r1, #0x73
	add r0, r1, #0
	add r0, #0xb1
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x32
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add r1, r4, #0
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	ldr r0, [sp]
	add r2, r6, #0
	bl ov12_02257E98
	mov r1, #0x46
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r5, #1
_022495DA:
	ldr r0, [sp, #8]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #8]
	cmp r5, #0
	str r1, [r0]
	bne _022495EE
	ldr r6, [r4, #0x14]
	cmp r6, #2
	blt _02249564
_022495EE:
	cmp r5, #0
	beq _022495F4
_022495F2:
	b _02249CA2
_022495F4:
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0x14]
	b _02249CA2
_02249600:
	ldr r6, [r4, #0x14]
	cmp r6, #2
	bge _0224969A
	mov r0, #0x71
	lsl r0, r0, #2
	add r7, r4, r0
	add r0, r4, #0
	str r0, [sp, #0xc]
	add r0, #0x14
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x20]
_02249618:
	lsl r0, r6, #2
	add r3, r4, r0
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r1, [r3, r0]
	mov r0, #2
	tst r0, r1
	beq _02249686
	lsl r2, r6, #3
	ldr r1, [r7, r2]
	ldr r0, _02249938 ; =0xFFFFFC7F
	and r0, r1
	str r0, [sp, #0x30]
	lsl r0, r1, #0x16
	lsr r0, r0, #0x1d
	sub r0, r0, #1
	lsl r0, r0, #0x1d
	lsr r1, r0, #0x16
	ldr r0, [sp, #0x30]
	orr r0, r1
	str r0, [r7, r2]
	ldr r0, [r7, r2]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1d
	bne _02249686
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r3, r0]
	ldr r1, [sp, #0x20]
	mov r2, #0x32
	bic r0, r1
	mov r1, #0x6f
	lsl r1, r1, #2
	str r0, [r3, r1]
	mov r1, #0x71
	add r0, r1, #0
	add r0, #0xb3
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add r1, r4, #0
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	ldr r0, [sp]
	add r2, r6, #0
	bl ov12_02257E98
	mov r1, #0x46
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r5, #1
_02249686:
	ldr r0, [sp, #0xc]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0xc]
	cmp r5, #0
	str r1, [r0]
	bne _0224969A
	ldr r6, [r4, #0x14]
	cmp r6, #2
	blt _02249618
_0224969A:
	cmp r5, #0
	bne _02249748
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0x14]
	b _02249CA2
_022496AA:
	ldr r6, [r4, #0x14]
	cmp r6, #2
	bge _02249744
	mov r0, #0x71
	lsl r0, r0, #2
	add r7, r4, r0
	add r0, r4, #0
	str r0, [sp, #0x10]
	add r0, #0x14
	str r0, [sp, #0x10]
	mov r0, #0x40
	str r0, [sp, #0x24]
_022496C2:
	lsl r0, r6, #2
	add r3, r4, r0
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r1, [r3, r0]
	mov r0, #0x40
	tst r0, r1
	beq _02249730
	lsl r2, r6, #3
	ldr r1, [r7, r2]
	ldr r0, _0224993C ; =0xFFFF8FFF
	and r0, r1
	str r0, [sp, #0x34]
	lsl r0, r1, #0x11
	lsr r0, r0, #0x1d
	sub r0, r0, #1
	lsl r0, r0, #0x1d
	lsr r1, r0, #0x11
	ldr r0, [sp, #0x34]
	orr r0, r1
	str r0, [r7, r2]
	ldr r0, [r7, r2]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1d
	bne _02249730
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r3, r0]
	ldr r1, [sp, #0x24]
	mov r2, #0x32
	bic r0, r1
	mov r1, #0x6f
	lsl r1, r1, #2
	str r0, [r3, r1]
	mov r1, #0x36
	add r0, r1, #0
	add r0, #0xee
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add r1, r4, #0
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	ldr r0, [sp]
	add r2, r6, #0
	bl ov12_02257E98
	mov r1, #0x46
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r5, #1
_02249730:
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x10]
	cmp r5, #0
	str r1, [r0]
	bne _02249744
	ldr r6, [r4, #0x14]
	cmp r6, #2
	blt _022496C2
_02249744:
	cmp r5, #0
	beq _0224974A
_02249748:
	b _02249CA2
_0224974A:
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0x14]
	b _02249CA2
_02249756:
	ldr r7, [r4, #0x14]
	cmp r7, #2
	bge _022497F4
	mov r0, #0x71
	lsl r0, r0, #2
	add r6, r4, r0
	add r0, r4, #0
	str r0, [sp, #0x14]
	add r0, #0x14
	str r0, [sp, #0x14]
	mov r0, #8
	str r0, [sp, #0x28]
_0224976E:
	lsl r0, r7, #2
	add r3, r4, r0
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r1, [r3, r0]
	mov r0, #8
	tst r0, r1
	beq _022497E0
	lsl r0, r7, #3
	ldr r2, [r6, r0]
	ldr r1, _02249940 ; =0xFFF1FFFF
	and r1, r2
	mov ip, r1
	lsl r1, r2, #0xc
	lsr r1, r1, #0x1d
	sub r1, r1, #1
	lsl r1, r1, #0x1d
	lsr r2, r1, #0xc
	mov r1, ip
	orr r1, r2
	str r1, [r6, r0]
	ldr r1, [r6, r0]
	lsl r1, r1, #0xc
	lsr r1, r1, #0x1d
	bne _022497E0
	mov r1, #0x6f
	lsl r1, r1, #2
	ldr r1, [r3, r1]
	ldr r2, [sp, #0x28]
	bic r1, r2
	mov r2, #0x6f
	lsl r2, r2, #2
	str r1, [r3, r2]
	ldr r0, [r6, r0]
	lsl r0, r0, #0xf
	lsr r1, r0, #0x1e
	add r0, r2, #0
	sub r0, #0xa4
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x6e
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add r1, r4, #0
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	ldr r0, [sp]
	add r2, r7, #0
	bl ov12_02257E98
	mov r1, #0x46
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r5, #1
_022497E0:
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x14]
	cmp r5, #0
	str r1, [r0]
	bne _022497F4
	ldr r7, [r4, #0x14]
	cmp r7, #2
	blt _0224976E
_022497F4:
	cmp r5, #0
	bne _02249872
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0x14]
	b _02249CA2
_02249804:
	ldr r6, [r4, #0x14]
	cmp r6, #2
	bge _0224986E
	add r7, r4, #0
	add r7, #0x14
_0224980E:
	lsl r0, r6, #2
	mov r1, #0x6f
	add r0, r4, r0
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	mov r1, #3
	lsl r1, r1, #8
	tst r1, r2
	beq _0224985E
	mov r1, #0x6f
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	sub r1, #0xbc
	sub r2, r2, r1
	mov r1, #0x6f
	lsl r1, r1, #2
	str r2, [r0, r1]
	ldr r1, [r0, r1]
	mov r0, #3
	lsl r0, r0, #8
	tst r0, r1
	bne _0224985E
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xe9
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add r1, r4, #0
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	ldr r0, [sp]
	add r2, r6, #0
	bl ov12_02257E98
	mov r1, #0x46
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r5, #1
_0224985E:
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	cmp r5, #0
	bne _0224986E
	ldr r6, [r4, #0x14]
	cmp r6, #2
	blt _0224980E
_0224986E:
	cmp r5, #0
	beq _02249874
_02249872:
	b _02249CA2
_02249874:
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0x14]
	b _02249CA2
_02249880:
	ldr r6, [r4, #0x14]
	cmp r6, #2
	bge _022498EC
	add r7, r4, #0
	add r7, #0x14
_0224988A:
	lsl r0, r6, #2
	mov r1, #0x6f
	add r0, r4, r0
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	mov r1, #7
	lsl r1, r1, #0xc
	tst r1, r2
	beq _022498DC
	mov r1, #0x6f
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	mov r1, #1
	lsl r1, r1, #0xc
	sub r2, r2, r1
	mov r1, #0x6f
	lsl r1, r1, #2
	str r2, [r0, r1]
	ldr r1, [r0, r1]
	mov r0, #7
	lsl r0, r0, #0xc
	tst r0, r1
	bne _022498DC
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xfa
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add r1, r4, #0
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	ldr r0, [sp]
	add r2, r6, #0
	bl ov12_02257E98
	mov r1, #0x46
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r5, #1
_022498DC:
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	cmp r5, #0
	bne _022498EC
	ldr r6, [r4, #0x14]
	cmp r6, #2
	blt _0224988A
_022498EC:
	cmp r5, #0
	bne _022499AE
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0x14]
	b _02249CA2
_022498FC:
	ldr r0, [r4, #0x14]
	ldr r1, [sp, #4]
	cmp r0, r1
	bge _022499AA
	add r6, r4, #0
	mov r7, #2
	add r6, #0x14
_0224990A:
	add r1, r4, r0
	ldr r0, _02249944 ; =0x000021EC
	ldrb r2, [r1, r0]
	mov r0, #0x63
	lsl r0, r0, #2
	add r1, r4, r2
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02249998
	mov r0, #0x63
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	sub r3, r0, #1
	mov r0, #0x63
	lsl r0, r0, #2
	strb r3, [r1, r0]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02249998
	mov r0, #0xc0
	mul r0, r2
	ldr r3, _02249948 ; =0x00002D8C
	b _0224994C
	.balign 4, 0
_02249938: .word 0xFFFFFC7F
_0224993C: .word 0xFFFF8FFF
_02249940: .word 0xFFF1FFFF
_02249944: .word 0x000021EC
_02249948: .word 0x00002D8C
_0224994C:
	add r0, r4, r0
	ldr r3, [r0, r3]
	cmp r3, #0
	beq _02249998
	mov r3, #0x46
	lsl r3, r3, #2
	str r2, [r4, r3]
	add r3, r4, #0
	add r3, #0xf5
	strb r7, [r3]
	add r5, r4, #0
	ldr r3, _02249C84 ; =0x00000215
	add r5, #0xf6
	strh r3, [r5]
	sub r3, #0x5d
	ldrb r1, [r1, r3]
	lsl r1, r1, #8
	orr r2, r1
	add r1, r4, #0
	add r1, #0xf8
	str r2, [r1]
	ldr r1, _02249C88 ; =0x00002D90
	ldr r0, [r0, r1]
	add r1, r7, #0
	bl ov12_02253178
	ldr r1, _02249C8C ; =0x0000215C
	mov r2, #0x88
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r5, #1
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_02249998:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	cmp r5, #0
	bne _022499AA
	ldr r0, [r4, #0x14]
	ldr r1, [sp, #4]
	cmp r0, r1
	blt _0224990A
_022499AA:
	cmp r5, #0
	beq _022499B0
_022499AE:
	b _02249CA2
_022499B0:
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0x14]
	b _02249CA2
_022499BC:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r2, #3
	tst r2, r1
	beq _02249A44
	mov r2, #2
	tst r1, r2
	beq _022499F2
	add r0, r4, #0
	ldr r1, _02249C90 ; =0x00000321
	add r0, #0xf6
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xf5
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x68
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	b _02249A3A
_022499F2:
	add r1, r0, #4
	ldr r1, [r4, r1]
	sub r2, r1, #1
	add r1, r0, #4
	str r2, [r4, r1]
	add r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02249A18
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xea
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	b _02249A3A
_02249A18:
	add r0, r4, #0
	ldr r1, _02249C90 ; =0x00000321
	add r0, #0xf6
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xf5
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x68
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_02249A3A:
	mov r0, #0x4e
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r5, #1
_02249A44:
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	b _02249CA2
_02249A4C:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r2, #0xc
	tst r2, r1
	beq _02249AD4
	mov r2, #8
	tst r1, r2
	beq _02249A82
	add r0, r4, #0
	ldr r1, _02249C94 ; =0x00000325
	add r0, #0xf6
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xf5
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x68
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	b _02249ACA
_02249A82:
	add r1, r0, #4
	ldr r1, [r4, r1]
	sub r2, r1, #1
	add r1, r0, #4
	str r2, [r4, r1]
	add r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02249AA8
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xeb
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	b _02249ACA
_02249AA8:
	add r0, r4, #0
	ldr r1, _02249C94 ; =0x00000325
	add r0, #0xf6
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xf5
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x68
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_02249ACA:
	mov r0, #0x4e
	mov r1, #0x15
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r5, #1
_02249AD4:
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	b _02249CA2
_02249ADC:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r2, #0x30
	tst r2, r1
	beq _02249B68
	mov r2, #0x20
	tst r1, r2
	beq _02249B14
	mov r1, #0xca
	add r0, r4, #0
	lsl r1, r1, #2
	add r0, #0xf6
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xf5
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x68
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	b _02249B5E
_02249B14:
	add r1, r0, #4
	ldr r1, [r4, r1]
	sub r2, r1, #1
	add r1, r0, #4
	str r2, [r4, r1]
	add r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02249B3A
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xec
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	b _02249B5E
_02249B3A:
	mov r1, #0xca
	add r0, r4, #0
	lsl r1, r1, #2
	add r0, #0xf6
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xf5
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x68
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_02249B5E:
	mov r0, #0x4e
	mov r1, #0x16
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r5, #1
_02249B68:
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	b _02249CA2
_02249B70:
	mov r0, #6
	lsl r0, r0, #6
	ldr r2, [r4, r0]
	mov r1, #0xc0
	add r0, r2, #0
	tst r0, r1
	beq _02249BFE
	mov r0, #0x80
	tst r0, r2
	beq _02249BA8
	add r0, r4, #0
	ldr r1, _02249C98 ; =0x0000032B
	add r0, #0xf6
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xf5
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x68
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	b _02249BF4
_02249BA8:
	add r0, r1, #0
	add r0, #0xc4
	ldr r0, [r4, r0]
	sub r2, r0, #1
	add r0, r1, #0
	add r0, #0xc4
	add r1, #0xc4
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _02249BD2
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xed
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	b _02249BF4
_02249BD2:
	add r0, r4, #0
	ldr r1, _02249C98 ; =0x0000032B
	add r0, #0xf6
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xf5
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x68
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_02249BF4:
	mov r0, #0x4e
	mov r1, #0x14
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r5, #1
_02249BFE:
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	b _02249CA2
_02249C06:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #2
	lsl r0, r0, #0xe
	tst r0, r1
	beq _02249C40
	add r0, r4, #0
	ldr r1, _02249C9C ; =0x0000032D
	add r0, #0xf6
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xf5
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x68
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r1, #0x12
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x4e
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r5, #1
_02249C40:
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	b _02249CA2
_02249C48:
	mov r1, #6
	lsl r1, r1, #6
	ldr r3, [r4, r1]
	mov r2, #7
	lsl r2, r2, #0xc
	add r0, r3, #0
	tst r0, r2
	beq _02249C7A
	mov r0, #1
	lsl r0, r0, #0xc
	sub r0, r3, r0
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	tst r0, r2
	bne _02249C7A
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xee
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r5, #1
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_02249C7A:
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	b _02249CA2
	nop
_02249C84: .word 0x00000215
_02249C88: .word 0x00002D90
_02249C8C: .word 0x0000215C
_02249C90: .word 0x00000321
_02249C94: .word 0x00000325
_02249C98: .word 0x0000032B
_02249C9C: .word 0x0000032D
_02249CA0:
	mov r5, #2
_02249CA2:
	cmp r5, #0
	bne _02249CA8
	b _022494EC
_02249CA8:
	cmp r5, #1
	bne _02249CB2
	ldr r0, [sp]
	bl ov12_022642F0
_02249CB2:
	cmp r5, #2
	bne _02249CBE
	mov r0, #0
	str r0, [r4, #0x10]
	mov r0, #0xa
	str r0, [r4, #8]
_02249CBE:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_022494DC

	thumb_func_start ov12_02249CC4
ov12_02249CC4: ; 0x02249CC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	mov r1, #0
	str r1, [sp, #0x10]
	str r0, [sp, #4]
	bl ov12_0223A7F0
	ldr r1, [r4, #8]
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #1
	bl ov12_0224DC74
	cmp r0, #1
	beq _02249D00
	ldr r1, [r4, #8]
	add r0, r4, #0
	add r2, r1, #0
	bl ov12_0224DD18
	cmp r0, #1
	beq _02249D00
	ldr r0, [sp, #4]
	add r1, r4, #0
	bl ov12_0224D7EC
	cmp r0, #1
	bne _02249D04
_02249D00:
	bl ov12_0224A6E0
_02249D04:
	ldr r1, [r4, #0x1c]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	blt _02249D10
	bl _0224A6D6
_02249D10:
	ldr r0, _0224A040 ; =0x000021EC
	add r1, r4, r1
	ldrb r5, [r1, r0]
	add r0, r5, #0
	bl MaskOfFlagNo
	ldr r1, _0224A044 ; =0x00003108
	ldrb r1, [r4, r1]
	tst r0, r1
	beq _02249D2E
	ldr r0, [r4, #0x1c]
	add r0, r0, #1
	str r0, [r4, #0x1c]
	bl _0224A6CA
_02249D2E:
	ldr r0, [r4, #0x18]
	cmp r0, #0x1a
	bls _02249D38
	bl _0224A6BA
_02249D38:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02249D44: ; jump table
	.short _02249D7A - _02249D44 - 2 ; case 0
	.short _02249DE2 - _02249D44 - 2 ; case 1
	.short _02249E64 - _02249D44 - 2 ; case 2
	.short _02249E80 - _02249D44 - 2 ; case 3
	.short _02249E9C - _02249D44 - 2 ; case 4
	.short _02249EB8 - _02249D44 - 2 ; case 5
	.short _02249F22 - _02249D44 - 2 ; case 6
	.short _02249F74 - _02249D44 - 2 ; case 7
	.short _02249FF4 - _02249D44 - 2 ; case 8
	.short _0224A030 - _02249D44 - 2 ; case 9
	.short _0224A09E - _02249D44 - 2 ; case 10
	.short _0224A0DC - _02249D44 - 2 ; case 11
	.short _0224A154 - _02249D44 - 2 ; case 12
	.short _0224A1D8 - _02249D44 - 2 ; case 13
	.short _0224A2D8 - _02249D44 - 2 ; case 14
	.short _0224A340 - _02249D44 - 2 ; case 15
	.short _0224A3F4 - _02249D44 - 2 ; case 16
	.short _0224A484 - _02249D44 - 2 ; case 17
	.short _0224A4A2 - _02249D44 - 2 ; case 18
	.short _0224A4E8 - _02249D44 - 2 ; case 19
	.short _0224A534 - _02249D44 - 2 ; case 20
	.short _0224A57E - _02249D44 - 2 ; case 21
	.short _0224A5C8 - _02249D44 - 2 ; case 22
	.short _0224A612 - _02249D44 - 2 ; case 23
	.short _0224A662 - _02249D44 - 2 ; case 24
	.short _0224A696 - _02249D44 - 2 ; case 25
	.short _0224A6B0 - _02249D44 - 2 ; case 26
_02249D7A:
	mov r6, #0xc0
	add r0, r5, #0
	mul r0, r6
	add r3, r4, r0
	mov r0, #0xb7
	lsl r0, r0, #6
	mov r1, #1
	ldr r2, [r3, r0]
	lsl r1, r1, #0xa
	tst r1, r2
	beq _02249DD8
	add r1, r0, #0
	sub r1, #0x34
	ldr r2, [r3, r1]
	add r1, r0, #0
	sub r1, #0x30
	ldr r1, [r3, r1]
	cmp r2, r1
	beq _02249DD8
	cmp r2, #0
	beq _02249DD8
	add r0, #0xc
	ldr r0, [r3, r0]
	lsl r0, r0, #0xd
	lsr r0, r0, #0x1d
	beq _02249DBE
	add r6, #0x58
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xef
	str r5, [r4, r6]
	bl ReadBattleScriptFromNarc
	b _02249DCC
_02249DBE:
	add r6, #0x58
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x89
	str r5, [r4, r6]
	bl ReadBattleScriptFromNarc
_02249DCC:
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_02249DD8:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	bl _0224A6BA
_02249DE2:
	mov r6, #0xc0
	add r0, r5, #0
	mul r0, r6
	add r3, r4, r0
	mov r0, #0xb7
	lsl r0, r0, #6
	mov r1, #1
	ldr r2, [r3, r0]
	lsl r1, r1, #0x18
	tst r1, r2
	beq _02249E5A
	add r1, r0, #0
	sub r1, #0x34
	ldr r2, [r3, r1]
	add r1, r0, #0
	sub r1, #0x30
	ldr r1, [r3, r1]
	cmp r2, r1
	beq _02249E5A
	cmp r2, #0
	beq _02249E5A
	add r1, r0, #0
	add r1, #0xc
	ldr r1, [r3, r1]
	lsl r1, r1, #0xd
	lsr r1, r1, #0x1d
	beq _02249E28
	add r6, #0x58
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xef
	str r5, [r4, r6]
	bl ReadBattleScriptFromNarc
	b _02249E4E
_02249E28:
	add r1, r6, #0
	add r1, #0x58
	str r5, [r4, r1]
	add r1, r6, #0
	add r1, #0xc8
	add r6, #0x64
	str r1, [r4, r6]
	sub r0, #0x30
	ldr r0, [r3, r0]
	mov r1, #0x10
	bl ov12_02253178
	ldr r1, _0224A048 ; =0x0000215C
	mov r2, #0xa9
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
_02249E4E:
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_02249E5A:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	bl _0224A6BA
_02249E64:
	ldr r0, [sp, #4]
	add r1, r4, #0
	add r2, r5, #0
	bl ov12_02253068
	cmp r0, #1
	bne _02249E76
	mov r0, #1
	str r0, [sp, #0x10]
_02249E76:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	bl _0224A6BA
_02249E80:
	ldr r0, [sp, #4]
	add r1, r4, #0
	add r2, r5, #0
	bl ov12_0225471C
	cmp r0, #1
	bne _02249E92
	mov r0, #1
	str r0, [sp, #0x10]
_02249E92:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	bl _0224A6BA
_02249E9C:
	ldr r0, [sp, #4]
	add r1, r4, #0
	add r2, r5, #0
	bl ov12_02254D80
	cmp r0, #1
	bne _02249EAE
	mov r0, #1
	str r0, [sp, #0x10]
_02249EAE:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	bl _0224A6BA
_02249EB8:
	mov r3, #0xc0
	add r0, r5, #0
	mul r0, r3
	mov r2, #0xb7
	add r6, r4, r0
	lsl r2, r2, #6
	ldr r0, [r6, r2]
	mov r1, #4
	tst r1, r0
	beq _02249F1A
	mov r1, #3
	and r0, r1
	add r1, r0, #0
	mul r1, r3
	add r0, r4, r1
	sub r2, #0x34
	ldr r0, [r0, r2]
	cmp r0, #0
	beq _02249F1A
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_022527CC
	cmp r0, #0x62
	beq _02249F1A
	ldr r0, _0224A04C ; =0x00002D8C
	ldr r1, [r6, r0]
	cmp r1, #0
	beq _02249F1A
	add r0, #0x34
	ldr r1, [r6, r0]
	mov r0, #3
	and r1, r0
	mov r0, #0x47
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r0, #4
	str r5, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x45
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_02249F1A:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_02249F22:
	mov r2, #0xc0
	add r0, r5, #0
	mul r0, r2
	ldr r3, _0224A050 ; =0x00002DAC
	add r0, r4, r0
	ldr r1, [r0, r3]
	mov r6, #8
	tst r1, r6
	beq _02249F6C
	add r1, r3, #0
	sub r1, #0x20
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _02249F6C
	add r2, #0x58
	str r5, [r4, r2]
	sub r3, #0x1c
	ldr r1, [r0, r3]
	add r0, r6, #0
	sub r0, #9
	mul r0, r1
	add r1, r6, #0
	bl ov12_02253178
	ldr r1, _0224A048 ; =0x0000215C
	mov r2, #0x17
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_02249F6C:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_02249F74:
	mov r0, #0xc0
	mul r0, r5
	ldr r1, _0224A050 ; =0x00002DAC
	add r6, r4, r0
	ldr r0, [r6, r1]
	mov r2, #0x80
	tst r0, r2
	beq _02249FEC
	add r0, r1, #0
	sub r0, #0x20
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _02249FEC
	add r2, #0x98
	str r5, [r4, r2]
	sub r1, #0x1c
	ldr r0, [r6, r1]
	mov r1, #0x10
	bl ov12_02253178
	ldr r1, _0224A048 ; =0x0000215C
	str r0, [r4, r1]
	ldr r1, _0224A050 ; =0x00002DAC
	mov r0, #0xf
	ldr r2, [r6, r1]
	lsl r0, r0, #8
	add r3, r2, #0
	and r3, r0
	cmp r3, r0
	beq _02249FB8
	mov r0, #1
	lsl r0, r0, #8
	add r0, r2, r0
	str r0, [r6, r1]
_02249FB8:
	ldr r2, _0224A050 ; =0x00002DAC
	ldr r0, _0224A048 ; =0x0000215C
	ldr r3, [r6, r2]
	mov r2, #0xf
	lsl r2, r2, #8
	and r2, r3
	ldr r1, [r4, r0]
	lsr r2, r2, #8
	mul r2, r1
	str r2, [r4, r0]
	mov r1, #0
	ldr r2, [r4, r0]
	mvn r1, r1
	mul r1, r2
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x17
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_02249FEC:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_02249FF4:
	mov r0, #0xc0
	add r1, r5, #0
	mul r1, r0
	add r6, r4, r1
	ldr r1, _0224A050 ; =0x00002DAC
	mov r2, #0x10
	ldr r3, [r6, r1]
	tst r2, r3
	beq _0224A028
	sub r1, #0x20
	ldr r1, [r6, r1]
	cmp r1, #0
	beq _0224A028
	add r0, #0x58
	str r5, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1a
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_0224A028:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A030:
	mov r6, #0xc0
	add r0, r5, #0
	mul r0, r6
	add r3, r4, r0
	ldr r7, _0224A054 ; =0x00002DB0
	ldr r0, _0224A044 ; =0x00003108
	b _0224A058
	nop
_0224A040: .word 0x000021EC
_0224A044: .word 0x00003108
_0224A048: .word 0x0000215C
_0224A04C: .word 0x00002D8C
_0224A050: .word 0x00002DAC
_0224A054: .word 0x00002DB0
_0224A058:
	ldr r2, [r3, r7]
	lsl r0, r0, #0x18
	tst r0, r2
	beq _0224A096
	add r0, r7, #0
	sub r0, #0x24
	ldr r0, [r3, r0]
	cmp r0, #0
	beq _0224A096
	sub r0, r7, #4
	ldr r1, [r3, r0]
	mov r0, #7
	tst r0, r1
	beq _0224A090
	add r6, #0x58
	str r5, [r4, r6]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x5e
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
	b _0224A096
_0224A090:
	ldr r0, _0224A398 ; =0xF7FFFFFF
	and r0, r2
	str r0, [r3, r7]
_0224A096:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A09E:
	mov r0, #0xc0
	add r1, r5, #0
	mul r1, r0
	add r6, r4, r1
	ldr r1, _0224A39C ; =0x00002DB0
	mov r2, #1
	ldr r3, [r6, r1]
	lsl r2, r2, #0x1c
	tst r2, r3
	beq _0224A0D4
	sub r1, #0x24
	ldr r1, [r6, r1]
	cmp r1, #0
	beq _0224A0D4
	add r0, #0x58
	str r5, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x62
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_0224A0D4:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A0DC:
	mov r0, #0xc0
	add r1, r5, #0
	mul r1, r0
	add r6, r4, r1
	ldr r1, _0224A39C ; =0x00002DB0
	mov r7, #0xe
	ldr r3, [r6, r1]
	lsl r7, r7, #0xc
	add r2, r3, #0
	tst r2, r7
	beq _0224A14C
	add r2, r1, #0
	sub r2, #0x24
	ldr r2, [r6, r2]
	cmp r2, #0
	beq _0224A14C
	mov r2, #2
	lsl r2, r2, #0xc
	sub r2, r3, r2
	str r2, [r6, r1]
	ldr r2, [r6, r1]
	tst r2, r7
	beq _0224A128
	sub r1, #0x20
	ldr r1, [r6, r1]
	sub r0, #0xc1
	mul r0, r1
	mov r1, #0x10
	bl ov12_02253178
	ldr r1, _0224A3A0 ; =0x0000215C
	mov r2, #0x3b
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	b _0224A132
_0224A128:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x3c
	bl ReadBattleScriptFromNarc
_0224A132:
	ldr r0, _0224A3A4 ; =0x00002DEA
	ldrh r1, [r6, r0]
	mov r0, #0x49
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, #0xc
	str r5, [r4, r0]
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_0224A14C:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A154:
	mov r0, #0x7b
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r4, #0
	mov r2, #4
	add r3, r5, #0
	bl ov12_02252324
	mov r1, #0x4e
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0xc0
	mul r0, r5
	add r6, r4, r0
	ldr r0, _0224A3A8 ; =0x00002DAC
	ldr r1, [r6, r0]
	mov r0, #7
	tst r0, r1
	beq _0224A1D0
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_022527CC
	cmp r0, #0x62
	beq _0224A1D0
	ldr r1, _0224A3AC ; =0x00002D8C
	ldr r0, [r6, r1]
	cmp r0, #0
	beq _0224A1D0
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224A1D0
	add r0, r1, #4
	ldr r1, [r6, r0]
	mov r0, #0
	mvn r0, r0
	mul r0, r1
	mov r1, #8
	bl ov12_02253178
	ldr r1, _0224A3A0 ; =0x0000215C
	ldr r2, _0224A3B0 ; =0x00000107
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, _0224A3B4 ; =0x0000213C
	mov r1, #0x40
	ldr r2, [r4, r0]
	orr r2, r1
	str r2, [r4, r0]
	add r1, #0xd8
	str r5, [r4, r1]
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_0224A1D0:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A1D8:
	mov r0, #0xc0
	mul r0, r5
	add r7, r4, r0
	ldr r0, _0224A39C ; =0x00002DB0
	ldr r1, [r7, r0]
	mov r0, #0x70
	tst r0, r1
	beq _0224A2C8
	ldr r0, [sp, #0xc]
	mov r6, #0
	cmp r0, #0
	ble _0224A23A
_0224A1F0:
	mov r0, #0xc0
	mul r0, r6
	add r2, r4, r0
	ldr r0, _0224A3A8 ; =0x00002DAC
	ldr r1, [r2, r0]
	mov r0, #7
	tst r0, r1
	beq _0224A22E
	ldr r0, _0224A3AC ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0224A22E
	add r0, r4, #0
	add r1, r6, #0
	bl ov12_022527CC
	cmp r0, #0x2b
	beq _0224A22E
	mov r0, #0x46
	lsl r0, r0, #2
	str r6, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x13
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	b _0224A23A
_0224A22E:
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r0, [sp, #0xc]
	cmp r6, r0
	blt _0224A1F0
_0224A23A:
	ldr r0, [sp, #0xc]
	cmp r6, r0
	beq _0224A246
	mov r0, #2
	str r0, [sp, #0x10]
	b _0224A6BA
_0224A246:
	ldr r0, _0224A39C ; =0x00002DB0
	ldr r1, [r7, r0]
	sub r1, #0x10
	str r1, [r7, r0]
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_02252218
	cmp r0, #0
	ldr r2, _0224A39C ; =0x00002DB0
	beq _0224A280
	ldr r1, [r7, r2]
	mov r0, #0x70
	bic r1, r0
	mov r6, #0xf1
	add r0, r5, #0
	str r1, [r7, r2]
	bl MaskOfFlagNo
	add r3, r6, #0
	add r3, #0x8f
	lsl r2, r0, #8
	add r0, r6, #0
	sub r0, #0xf2
	ldr r1, [r4, r3]
	eor r0, r2
	and r0, r1
	str r0, [r4, r3]
	b _0224A2AC
_0224A280:
	ldr r1, [r7, r2]
	mov r0, #0x70
	tst r0, r1
	beq _0224A28C
	mov r6, #0xf0
	b _0224A2AC
_0224A28C:
	mov r0, #0x70
	bic r1, r0
	mov r6, #0xf1
	add r0, r5, #0
	str r1, [r7, r2]
	bl MaskOfFlagNo
	add r3, r6, #0
	add r3, #0x8f
	lsl r2, r0, #8
	add r0, r6, #0
	sub r0, #0xf2
	ldr r1, [r4, r3]
	eor r0, r2
	and r0, r1
	str r0, [r4, r3]
_0224A2AC:
	mov r0, #0x46
	lsl r0, r0, #2
	str r5, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	add r2, r6, #0
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_0224A2C8:
	ldr r0, [sp, #0x10]
	cmp r0, #2
	bne _0224A2D0
	b _0224A6BA
_0224A2D0:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A2D8:
	mov r2, #0xc0
	add r0, r5, #0
	mul r0, r2
	add r6, r4, r0
	ldr r0, _0224A39C ; =0x00002DB0
	lsl r2, r2, #4
	ldr r1, [r6, r0]
	tst r2, r1
	beq _0224A338
	mov r2, #1
	lsl r2, r2, #0xa
	sub r1, r1, r2
	str r1, [r6, r0]
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_02252218
	cmp r0, #0
	beq _0224A30A
	ldr r1, _0224A39C ; =0x00002DB0
	ldr r0, _0224A3B8 ; =0xFFFFF3FF
	ldr r2, [r6, r1]
	and r0, r2
	str r0, [r6, r1]
	b _0224A338
_0224A30A:
	ldr r0, _0224A39C ; =0x00002DB0
	ldr r1, [r6, r0]
	mov r0, #3
	lsl r0, r0, #0xa
	tst r0, r1
	bne _0224A338
	mov r0, #7
	tst r0, r1
	bne _0224A338
	add r0, r4, #0
	add r0, #0x94
	str r5, [r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x33
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_0224A338:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A340:
	mov r0, #0xc0
	add r6, r5, #0
	mul r6, r0
	add r0, r4, r6
	ldr r1, _0224A3BC ; =0x00002DE8
	mov ip, r0
	ldrh r3, [r0, r1]
	cmp r3, #0
	beq _0224A3EC
	ldr r7, _0224A3C0 ; =0x00002D4C
	mov r2, #0
	mov r1, ip
_0224A358:
	ldrh r0, [r1, r7]
	cmp r3, r0
	beq _0224A366
	add r2, r2, #1
	add r1, r1, #2
	cmp r2, #4
	blt _0224A358
_0224A366:
	cmp r2, #4
	bne _0224A376
	ldr r0, _0224A3C4 ; =0x00002DC8
	add r1, r4, r0
	ldr r2, [r1, r6]
	mov r0, #7
	bic r2, r0
	str r2, [r1, r6]
_0224A376:
	ldr r1, _0224A3C4 ; =0x00002DC8
	add r0, r4, r6
	ldr r0, [r0, r1]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	beq _0224A3C8
	add r2, r4, r1
	ldr r1, [r2, r6]
	mov r3, #7
	bic r1, r3
	sub r3, r0, #1
	mov r0, #7
	and r0, r3
	orr r0, r1
	str r0, [r2, r6]
	b _0224A3EC
	nop
_0224A398: .word 0xF7FFFFFF
_0224A39C: .word 0x00002DB0
_0224A3A0: .word 0x0000215C
_0224A3A4: .word 0x00002DEA
_0224A3A8: .word 0x00002DAC
_0224A3AC: .word 0x00002D8C
_0224A3B0: .word 0x00000107
_0224A3B4: .word 0x0000213C
_0224A3B8: .word 0xFFFFF3FF
_0224A3BC: .word 0x00002DE8
_0224A3C0: .word 0x00002D4C
_0224A3C4: .word 0x00002DC8
_0224A3C8:
	mov r2, #0
	add r1, #0x20
	mov r0, ip
	strh r2, [r0, r1]
	mov r0, #0x46
	lsl r0, r0, #2
	str r5, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x48
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_0224A3EC:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A3F4:
	mov r0, #0xc0
	add r6, r5, #0
	mul r6, r0
	add r0, r4, r6
	ldr r1, _0224A6E4 ; =0x00002DEC
	str r0, [sp, #8]
	ldrh r2, [r0, r1]
	cmp r2, #0
	beq _0224A47C
	ldr r7, _0224A6E8 ; =0x00002D4C
	mov r3, #0
	add r1, r0, #0
_0224A40C:
	ldrh r0, [r1, r7]
	cmp r2, r0
	beq _0224A41A
	add r3, r3, #1
	add r1, r1, #2
	cmp r3, #4
	blt _0224A40C
_0224A41A:
	cmp r3, #4
	beq _0224A42C
	beq _0224A438
	ldr r0, [sp, #8]
	add r1, r0, r3
	ldr r0, _0224A6EC ; =0x00002D6C
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0224A438
_0224A42C:
	ldr r0, _0224A6F0 ; =0x00002DC8
	add r2, r4, r0
	ldr r1, [r2, r6]
	mov r0, #0x38
	bic r1, r0
	str r1, [r2, r6]
_0224A438:
	ldr r1, _0224A6F0 ; =0x00002DC8
	add r0, r4, r6
	ldr r0, [r0, r1]
	lsl r0, r0, #0x1a
	lsr r2, r0, #0x1d
	beq _0224A458
	add r1, r4, r1
	sub r2, r2, #1
	lsl r2, r2, #0x1d
	ldr r0, [r1, r6]
	mov r3, #0x38
	bic r0, r3
	lsr r2, r2, #0x1a
	orr r0, r2
	str r0, [r1, r6]
	b _0224A47C
_0224A458:
	ldr r0, [sp, #8]
	mov r2, #0
	add r1, #0x24
	strh r2, [r0, r1]
	mov r0, #0x46
	lsl r0, r0, #2
	str r5, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x4a
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_0224A47C:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A484:
	mov r0, #0xc0
	mul r0, r5
	add r3, r4, r0
	mov r0, #0xb7
	lsl r0, r0, #6
	ldr r2, [r3, r0]
	mov r1, #0x18
	tst r1, r2
	beq _0224A49A
	sub r2, #8
	str r2, [r3, r0]
_0224A49A:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A4A2:
	mov r0, #0xc0
	mul r0, r5
	ldr r2, _0224A6F0 ; =0x00002DC8
	add r5, r4, r0
	ldr r1, [r5, r2]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1e
	beq _0224A4E0
	add r3, r4, r2
	ldr r6, [r3, r0]
	mov r1, #0xc0
	add r7, r6, #0
	bic r7, r1
	lsl r1, r6, #0x18
	lsr r1, r1, #0x1e
	sub r1, r1, #1
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x18
	orr r1, r7
	str r1, [r3, r0]
	ldr r0, [r3, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	bne _0224A4E0
	add r0, r2, #0
	sub r0, #8
	ldr r1, [r5, r0]
	ldr r0, _0224A6F4 ; =0xFFFFFDFF
	sub r2, #8
	and r0, r1
	str r0, [r5, r2]
_0224A4E0:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A4E8:
	ldr r0, _0224A6F0 ; =0x00002DC8
	mov r2, #0xc0
	add r3, r5, #0
	mul r3, r2
	add r1, r4, r0
	ldr r7, [r1, r3]
	lsl r0, r7, #0x15
	lsr r6, r0, #0x1d
	beq _0224A52C
	ldr r0, _0224A6F8 ; =0xFFFFF8FF
	and r7, r0
	sub r0, r6, #1
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x15
	orr r0, r7
	str r0, [r1, r3]
	ldr r0, [r1, r3]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x1d
	bne _0224A52C
	add r0, r2, #0
	add r0, #0x58
	str r5, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	add r2, #0x60
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_0224A52C:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A534:
	ldr r0, _0224A6FC ; =0x00002DCC
	mov r1, #0xc0
	add r3, r5, #0
	mul r3, r1
	add r2, r4, r0
	ldr r7, [r2, r3]
	lsl r0, r7, #0x10
	lsr r6, r0, #0x1d
	beq _0224A576
	ldr r0, _0224A700 ; =0xFFFF1FFF
	and r7, r0
	sub r0, r6, #1
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x10
	orr r0, r7
	str r0, [r2, r3]
	ldr r0, [r2, r3]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1d
	bne _0224A576
	add r1, #0x58
	str r5, [r4, r1]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xf2
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_0224A576:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A57E:
	ldr r0, _0224A6FC ; =0x00002DCC
	mov r1, #0xc0
	add r3, r5, #0
	mul r3, r1
	add r2, r4, r0
	ldr r7, [r2, r3]
	lsl r0, r7, #0xd
	lsr r6, r0, #0x1d
	beq _0224A5C0
	ldr r0, _0224A704 ; =0xFFF8FFFF
	and r7, r0
	sub r0, r6, #1
	lsl r0, r0, #0x1d
	lsr r0, r0, #0xd
	orr r0, r7
	str r0, [r2, r3]
	ldr r0, [r2, r3]
	lsl r0, r0, #0xd
	lsr r0, r0, #0x1d
	bne _0224A5C0
	add r1, #0x58
	str r5, [r4, r1]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xf3
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_0224A5C0:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A5C8:
	ldr r0, _0224A6FC ; =0x00002DCC
	mov r1, #0xc0
	add r3, r5, #0
	mul r3, r1
	add r2, r4, r0
	ldr r7, [r2, r3]
	lsl r0, r7, #0xa
	lsr r6, r0, #0x1d
	beq _0224A60A
	ldr r0, _0224A708 ; =0xFFC7FFFF
	and r7, r0
	sub r0, r6, #1
	lsl r0, r0, #0x1d
	lsr r0, r0, #0xa
	orr r0, r7
	str r0, [r2, r3]
	ldr r0, [r2, r3]
	lsl r0, r0, #0xa
	lsr r0, r0, #0x1d
	bne _0224A60A
	add r1, #0x58
	str r5, [r4, r1]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xf4
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_0224A60A:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A612:
	mov r6, #0xc0
	add r0, r5, #0
	mul r0, r6
	mov r3, #0xb7
	add r1, r4, r0
	lsl r3, r3, #6
	ldr r0, [r1, r3]
	lsl r2, r6, #5
	tst r2, r0
	beq _0224A65A
	mov r2, #2
	lsl r2, r2, #0xa
	sub r0, r0, r2
	str r0, [r1, r3]
	ldr r1, [r1, r3]
	lsl r0, r6, #5
	tst r0, r1
	bne _0224A65A
	add r0, r4, #0
	add r0, #0x94
	str r5, [r0]
	add r0, r4, #0
	mov r1, #4
	add r0, #0x88
	str r1, [r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x12
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_0224A65A:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A662:
	ldr r0, [sp, #4]
	add r1, r4, #0
	add r2, r5, #0
	add r3, sp, #0x14
	bl ov12_02254E7C
	cmp r0, #1
	bne _0224A68E
	mov r0, #0x46
	lsl r0, r0, #2
	str r5, [r4, r0]
	ldr r2, [sp, #0x14]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #0x10]
_0224A68E:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A696:
	ldr r0, [sp, #4]
	add r1, r4, #0
	add r2, r5, #0
	bl ov12_0225551C
	cmp r0, #1
	bne _0224A6A8
	mov r0, #1
	str r0, [sp, #0x10]
_0224A6A8:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	b _0224A6BA
_0224A6B0:
	mov r0, #0
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x1c]
	add r0, r0, #1
	str r0, [r4, #0x1c]
_0224A6BA:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0224A6CA
	ldr r0, [sp, #4]
	bl ov12_022642F0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_0224A6CA:
	ldr r1, [r4, #0x1c]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bge _0224A6D6
	bl _02249D10
_0224A6D6:
	mov r0, #0
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	mov r0, #0xb
	str r0, [r4, #8]
	thumb_func_end ov12_02249CC4

	thumb_func_start ov12_0224A6E0
ov12_0224A6E0: ; 0x0224A6E0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224A6E4: .word 0x00002DEC
_0224A6E8: .word 0x00002D4C
_0224A6EC: .word 0x00002D6C
_0224A6F0: .word 0x00002DC8
_0224A6F4: .word 0xFFFFFDFF
_0224A6F8: .word 0xFFFFF8FF
_0224A6FC: .word 0x00002DCC
_0224A700: .word 0xFFFF1FFF
_0224A704: .word 0xFFF8FFFF
_0224A708: .word 0xFFC7FFFF
	thumb_func_end ov12_0224A6E0

	thumb_func_start ov12_0224A70C
ov12_0224A70C: ; 0x0224A70C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	str r0, [sp]
	bl ov12_0223A7F0
	ldr r1, [r4, #8]
	add r7, r0, #0
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #1
	bl ov12_0224DC74
	cmp r0, #1
	bne _0224A72C
	b _0224A93C
_0224A72C:
	ldr r0, [sp]
	bl ov12_022642F0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0224A744
	cmp r0, #1
	beq _0224A82E
	cmp r0, #2
	bne _0224A742
	b _0224A8F4
_0224A742:
	b _0224A932
_0224A744:
	ldr r0, [r4, #0x24]
	cmp r0, r7
	bge _0224A824
	add r5, r4, #0
	add r5, #0x24
_0224A74E:
	add r1, r4, r0
	ldr r0, _0224A940 ; =0x000021EC
	ldrb r6, [r1, r0]
	add r0, r6, #0
	bl MaskOfFlagNo
	ldr r1, _0224A944 ; =0x00003108
	ldrb r1, [r4, r1]
	tst r0, r1
	ldr r0, [r5]
	beq _0224A76A
	add r0, r0, #1
	str r0, [r5]
	b _0224A81E
_0224A76A:
	add r0, r0, #1
	mov r1, #0x62
	str r0, [r5]
	add r0, r4, r6
	lsl r1, r1, #2
	ldrb r1, [r0, r1]
	cmp r1, #0
	beq _0224A81E
	mov r1, #0x62
	lsl r1, r1, #2
	ldrb r1, [r0, r1]
	sub r2, r1, #1
	mov r1, #0x62
	lsl r1, r1, #2
	strb r2, [r0, r1]
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _0224A81E
	mov r0, #0xc0
	mul r0, r6
	add r1, r4, r0
	ldr r0, _0224A948 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0224A81E
	ldr r0, [sp]
	add r1, r6, #0
	bl ov12_0223AB1C
	mov r2, #0x6f
	lsl r2, r2, #2
	add r1, r4, r2
	lsl r5, r0, #2
	ldr r3, [r1, r5]
	mov r0, #0x10
	bic r3, r0
	add r0, r4, #0
	str r3, [r1, r5]
	add r2, #0x1f
	add r0, #0xf6
	strh r2, [r0]
	add r0, r4, #0
	mov r1, #0xa
	add r0, #0xf5
	strb r1, [r0]
	add r0, r4, #0
	add r1, r6, #0
	bl ov12_022522E0
	add r1, r4, #0
	add r1, #0xf8
	str r0, [r1]
	mov r0, #0x19
	lsl r0, r0, #4
	add r1, r4, #0
	add r3, r4, r0
	lsl r2, r6, #1
	ldrh r5, [r3, r2]
	add r1, #0xfc
	str r5, [r1]
	add r1, r0, #0
	sub r1, #0x78
	str r6, [r4, r1]
	lsl r1, r6, #2
	add r5, r0, #0
	add r1, r4, r1
	add r5, #8
	ldr r6, [r1, r5]
	add r5, r0, #0
	sub r5, #0x74
	str r6, [r4, r5]
	ldrh r3, [r3, r2]
	add r2, r0, #0
	sub r2, #0x6c
	str r3, [r4, r2]
	add r0, #0x18
	ldr r1, [r1, r0]
	ldr r0, _0224A94C ; =0x0000215C
	mov r2, #0x79
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #8
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0224A81E:
	ldr r0, [r4, #0x24]
	cmp r0, r7
	blt _0224A74E
_0224A824:
	ldr r0, [r4, #0x20]
	add r0, r0, #1
	str r0, [r4, #0x20]
	mov r0, #0
	str r0, [r4, #0x24]
_0224A82E:
	ldr r0, [r4, #0x24]
	cmp r0, r7
	bge _0224A8EA
	add r5, r4, #0
	add r5, #0x24
_0224A838:
	add r1, r4, r0
	ldr r0, _0224A940 ; =0x000021EC
	ldrb r6, [r1, r0]
	add r0, r6, #0
	bl MaskOfFlagNo
	ldr r1, _0224A944 ; =0x00003108
	ldrb r1, [r4, r1]
	tst r0, r1
	ldr r0, [r5]
	beq _0224A854
	add r0, r0, #1
	str r0, [r5]
	b _0224A8E4
_0224A854:
	add r0, r0, #1
	str r0, [r5]
	mov r0, #0xc0
	mul r0, r6
	mov r1, #0xb7
	add r3, r4, r0
	lsl r1, r1, #6
	ldr r2, [r3, r1]
	mov r1, #0x20
	tst r1, r2
	beq _0224A8E4
	ldr r7, _0224A950 ; =0x00002DC8
	add r2, r4, r7
	ldr r1, [r2, r0]
	lsl r1, r1, #0x11
	lsr r1, r1, #0x1e
	bne _0224A8AE
	add r1, r7, #0
	sub r1, #8
	add r1, r4, r1
	str r1, [sp, #4]
	ldr r1, [r1, r0]
	mov r5, #0x20
	bic r1, r5
	ldr r5, [sp, #4]
	sub r7, #0x3c
	str r1, [r5, r0]
	ldr r0, [r2, r0]
	lsl r0, r0, #0x11
	lsr r1, r0, #0x1e
	mov r0, #0x13
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r3, r7]
	ldr r1, _0224A94C ; =0x0000215C
	neg r0, r0
	str r0, [r4, r1]
	add r0, r1, #0
	sub r0, #0x20
	ldr r2, [r4, r0]
	mov r0, #0x40
	orr r0, r2
	sub r1, #0x20
	str r0, [r4, r1]
	b _0224A8C8
_0224A8AE:
	mov r3, #0x13
	lsl r3, r3, #4
	str r1, [r4, r3]
	ldr r3, [r2, r0]
	ldr r1, _0224A954 ; =0xFFFF9FFF
	and r1, r3
	lsl r3, r3, #0x11
	lsr r3, r3, #0x1e
	sub r3, r3, #1
	lsl r3, r3, #0x1e
	lsr r3, r3, #0x11
	orr r1, r3
	str r1, [r2, r0]
_0224A8C8:
	mov r0, #0x46
	lsl r0, r0, #2
	str r6, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x66
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #8
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0224A8E4:
	ldr r0, [r4, #0x24]
	cmp r0, r7
	blt _0224A838
_0224A8EA:
	ldr r0, [r4, #0x20]
	add r0, r0, #1
	str r0, [r4, #0x20]
	mov r0, #0
	str r0, [r4, #0x24]
_0224A8F4:
	mov r1, #6
	lsl r1, r1, #6
	ldr r3, [r4, r1]
	mov r2, #7
	lsl r2, r2, #0x10
	add r0, r3, #0
	tst r0, r2
	beq _0224A928
	mov r0, #1
	lsl r0, r0, #0x10
	sub r0, r3, r0
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	tst r0, r2
	bne _0224A928
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xfb
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #8
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0224A928:
	ldr r0, [r4, #0x20]
	add r0, r0, #1
	str r0, [r4, #0x20]
	mov r0, #0
	str r0, [r4, #0x24]
_0224A932:
	mov r0, #0
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	mov r0, #0xc
	str r0, [r4, #8]
_0224A93C:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224A940: .word 0x000021EC
_0224A944: .word 0x00003108
_0224A948: .word 0x00002D8C
_0224A94C: .word 0x0000215C
_0224A950: .word 0x00002DC8
_0224A954: .word 0xFFFF9FFF
	thumb_func_end ov12_0224A70C

	thumb_func_start ov12_0224A958
ov12_0224A958: ; 0x0224A958
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4, #8]
	add r5, r0, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov12_0224DD18
	cmp r0, #1
	beq _0224A9AC
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224D7EC
	cmp r0, #1
	beq _0224A9AC
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224D540
	cmp r0, #1
	beq _0224A9AC
	mov r1, #0x15
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r0, r0, #1
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x24
	ldr r0, [r4, r0]
	add r1, #0x24
	add r0, r0, #1
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov12_02250F44
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02251710
	mov r0, #2
	str r0, [r4, #8]
_0224A9AC:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0224A958

	thumb_func_start ov12_0224A9B0
ov12_0224A9B0: ; 0x0224A9B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r4, #0
	add r1, r5, r0
	ldr r0, _0224AAD8 ; =0x000021E8
	ldrb r2, [r1, r0]
	lsl r0, r2, #6
	add r1, r5, r0
	mov r0, #0x75
	str r2, [r5, #0x64]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0224A9E4
	mov r0, #0xc1
	mov r1, #0xa5
	lsl r0, r0, #6
	str r1, [r5, r0]
	mov r4, #1
	b _0224AAA8
_0224A9E4:
	mov r0, #0xc0
	mul r0, r2
	ldr r6, _0224AADC ; =0x00002DEC
	add r0, r5, r0
	ldrh r1, [r0, r6]
	cmp r1, #0
	beq _0224AA0C
	add r3, r6, #2
	ldrh r3, [r0, r3]
	sub r6, #0xa0
	lsl r3, r3, #1
	add r0, r0, r3
	ldrh r0, [r0, r6]
	cmp r1, r0
	bne _0224AA0C
	mov r0, #0xc1
	lsl r0, r0, #6
	str r1, [r5, r0]
	mov r4, #1
	b _0224AAA8
_0224AA0C:
	cmp r1, #0
	beq _0224AA5E
	mov r7, #0xc0
	add r0, r2, #0
	mul r0, r7
	ldr r3, _0224AAE0 ; =0x00002DEE
	add r0, r5, r0
	ldrh r6, [r0, r3]
	lsl r6, r6, #1
	add r6, r0, r6
	add r0, r3, #0
	sub r0, #0xa2
	ldrh r0, [r6, r0]
	cmp r1, r0
	beq _0224AA5E
	mov r1, #0xc1
	lsl r1, r1, #6
	str r0, [r5, r1]
	ldr r1, [r5, #0x64]
	mov r0, #0
	add r2, r1, #0
	mul r2, r7
	add r2, r5, r2
	sub r1, r3, #2
	strh r0, [r2, r1]
	ldr r1, [r5, #0x64]
	mov r4, #1
	add r2, r1, #0
	mul r2, r7
	add r1, r5, r2
	strh r0, [r1, r3]
	ldr r0, [r5, #0x64]
	sub r3, #0x26
	add r2, r0, #0
	add r3, r5, r3
	mul r2, r7
	ldr r1, [r3, r2]
	mov r0, #0x38
	bic r1, r0
	str r1, [r3, r2]
	b _0224AAA8
_0224AA5E:
	add r0, r5, #0
	add r1, r2, #0
	bl ov12_022567A0
	cmp r0, #0
	bne _0224AA7A
	ldr r0, [r5, #0x64]
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _0224AAE4 ; =0x0000304C
	ldr r1, [r1, r0]
	sub r0, #0xc
	str r1, [r5, r0]
	b _0224AAA8
_0224AA7A:
	ldr r2, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r2
	lsl r1, r2, #1
	add r3, r5, r0
	add r0, r5, r1
	ldr r1, _0224AAE8 ; =0x000030BC
	ldrh r2, [r0, r1]
	lsl r2, r2, #1
	add r3, r3, r2
	ldr r2, _0224AAEC ; =0x00002D4C
	ldrh r3, [r3, r2]
	add r2, r1, #0
	sub r2, #8
	ldrh r0, [r0, r2]
	cmp r0, r3
	beq _0224AAA4
	sub r1, #0x7c
	str r3, [r5, r1]
	mov r4, #1
	b _0224AAA8
_0224AAA4:
	sub r1, #0x7c
	str r3, [r5, r1]
_0224AAA8:
	mov r3, #0xc1
	lsl r3, r3, #6
	ldr r1, [r5, r3]
	add r0, r3, #4
	str r1, [r5, r0]
	mov r0, #0x17
	str r0, [r5, #8]
	str r4, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r3, [r5, r3]
	ldr r0, [sp, #8]
	lsl r3, r3, #0x10
	ldr r2, [r5, #0x64]
	add r1, r5, #0
	lsr r3, r3, #0x10
	bl ov12_022506D4
	str r0, [r5, #0x6c]
	ldr r0, [sp, #8]
	bl ov12_022642F0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0224AAD8: .word 0x000021E8
_0224AADC: .word 0x00002DEC
_0224AAE0: .word 0x00002DEE
_0224AAE4: .word 0x0000304C
_0224AAE8: .word 0x000030BC
_0224AAEC: .word 0x00002D4C
	thumb_func_end ov12_0224A9B0

	thumb_func_start ov12_0224AAF0
ov12_0224AAF0: ; 0x0224AAF0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0xec
	ldr r2, [r2]
	add r7, r0, #0
	add r3, r4, r2
	ldr r2, _0224AC2C ; =0x000021E8
	ldrb r2, [r3, r2]
	str r2, [r4, #0x64]
	bl ov12_02253DA0
	str r0, [r4, #0x6c]
	ldr r0, _0224AC30 ; =0x000021B0
	ldr r1, [r4, #0x64]
	add r2, r4, r0
	lsl r0, r1, #4
	add r6, r2, r0
	add r0, r7, #0
	bl ov12_0223AB1C
	cmp r0, #0
	beq _0224AB98
	ldr r0, [r4, #0x64]
	asr r0, r0, #1
	add r1, r4, r0
	ldr r0, _0224AC34 ; =0x000003D1
	ldrb r2, [r1, r0]
	cmp r2, #4
	bhi _0224AB84
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0224AB38: ; jump table
	.short _0224AB42 - _0224AB38 - 2 ; case 0
	.short _0224AB46 - _0224AB38 - 2 ; case 1
	.short _0224AB4A - _0224AB38 - 2 ; case 2
	.short _0224AB74 - _0224AB38 - 2 ; case 3
	.short _0224AB82 - _0224AB38 - 2 ; case 4
_0224AB42:
	ldr r5, _0224AC38 ; =0x00000121
	b _0224AB84
_0224AB46:
	ldr r5, _0224AC3C ; =0x0000010B
	b _0224AB84
_0224AB4A:
	add r0, r0, #2
	ldrb r0, [r1, r0]
	mov r1, #1
	tst r1, r0
	beq _0224AB64
	mov r1, #0x3e
	add r2, r0, #0
	tst r2, r1
	beq _0224AB64
	mov r0, #6
	add r1, #0xf2
	str r0, [r4, r1]
	b _0224AB6E
_0224AB64:
	bl LowestFlagNo
	mov r1, #0x13
	lsl r1, r1, #4
	str r0, [r4, r1]
_0224AB6E:
	mov r5, #0x43
	lsl r5, r5, #2
	b _0224AB84
_0224AB74:
	add r0, r0, #2
	ldrb r0, [r1, r0]
	mov r5, #0x13
	lsl r5, r5, #4
	str r0, [r4, r5]
	sub r5, #0x23
	b _0224AB84
_0224AB82:
	ldr r5, _0224AC40 ; =0x0000010E
_0224AB84:
	ldr r1, [r4, #0x64]
	mov r0, #1
	bic r1, r0
	ldr r0, _0224AC44 ; =0x000003D6
	add r1, r4, r1
	ldrh r1, [r1, r0]
	mov r0, #0x4a
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0224AC0A
_0224AB98:
	ldrb r0, [r6, #2]
	cmp r0, #3
	bhi _0224AC02
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224ABAA: ; jump table
	.short _0224ABB2 - _0224ABAA - 2 ; case 0
	.short _0224ABB2 - _0224ABAA - 2 ; case 1
	.short _0224ABC8 - _0224ABAA - 2 ; case 2
	.short _0224ABB2 - _0224ABAA - 2 ; case 3
_0224ABB2:
	ldrh r1, [r6]
	ldr r0, _0224AC48 ; =0x0000FFC1
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bhi _0224ABC4
	mov r5, #0xde
	b _0224AC02
_0224ABC4:
	mov r5, #0xdf
	b _0224AC02
_0224ABC8:
	add r0, r7, #0
	mov r5, #0xb
	bl ov12_0223A7E0
	mov r1, #1
	tst r0, r1
	bne _0224AC02
	add r0, r7, #0
	bl ov12_0223A7E0
	mov r1, #1
	lsl r1, r1, #0xa
	tst r0, r1
	bne _0224AC02
	add r0, r7, #0
	bl ov12_0223AA80
	ldrh r1, [r6]
	mov r2, #1
	mov r3, #5
	bl Bag_TakeItem
	add r0, r7, #0
	bl ov12_0223AA84
	ldrh r1, [r6]
	ldrb r2, [r6, #2]
	bl BagCursor_Battle_SetLastUsedItem
_0224AC02:
	ldrh r1, [r6]
	mov r0, #0x4a
	lsl r0, r0, #2
	str r1, [r4, r0]
_0224AC0A:
	add r0, r4, #0
	mov r1, #1
	add r2, r5, #0
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x28
	str r0, [r4, #0xc]
	ldr r1, _0224AC4C ; =0x0000216C
	mov r0, #2
	ldr r2, [r4, r1]
	lsl r0, r0, #0x1e
	orr r0, r2
	str r0, [r4, r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224AC2C: .word 0x000021E8
_0224AC30: .word 0x000021B0
_0224AC34: .word 0x000003D1
_0224AC38: .word 0x00000121
_0224AC3C: .word 0x0000010B
_0224AC40: .word 0x0000010E
_0224AC44: .word 0x000003D6
_0224AC48: .word 0x0000FFC1
_0224AC4C: .word 0x0000216C
	thumb_func_end ov12_0224AAF0

	thumb_func_start ov12_0224AC50
ov12_0224AC50: ; 0x0224AC50
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	mov r2, #9
	bl ReadBattleScriptFromNarc
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	ldr r1, _0224AC90 ; =0x000021E8
	add r0, r4, r0
	ldrb r0, [r0, r1]
	mov r2, #0
	str r0, [r4, #0x64]
	str r0, [r4, #0x78]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x29
	str r0, [r4, #0xc]
	mov r0, #0x4e
	lsl r0, r0, #2
	str r2, [r4, r0]
	add r0, r1, #0
	sub r0, #0x7c
	ldr r2, [r4, r0]
	mov r0, #2
	lsl r0, r0, #0x1e
	orr r0, r2
	sub r1, #0x7c
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_0224AC90: .word 0x000021E8
	thumb_func_end ov12_0224AC50

	thumb_func_start ov12_0224AC94
ov12_0224AC94: ; 0x0224AC94
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r1, #0xec
	ldr r1, [r1]
	add r5, r0, #0
	add r2, r4, r1
	ldr r1, _0224AD4C ; =0x000021E8
	ldrb r1, [r2, r1]
	str r1, [r4, #0x64]
	bl ov12_0223AB1C
	cmp r0, #0
	beq _0224AD06
	add r0, r5, #0
	bl ov12_0223A7E0
	mov r1, #4
	tst r0, r1
	bne _0224AD06
	ldr r0, [r4, #0x64]
	mov r2, #0xc0
	add r1, r0, #0
	mul r1, r2
	ldr r0, _0224AD50 ; =0x00002DB0
	add r1, r4, r1
	ldr r1, [r1, r0]
	ldr r0, _0224AD54 ; =0x0400E000
	tst r0, r1
	beq _0224ACEA
	add r0, r4, #0
	mov r1, #1
	add r2, #0x5e
	bl ReadBattleScriptFromNarc
	add r0, r4, #0
	mov r1, #0
	add r0, #0xb4
	str r1, [r0]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x28
	str r0, [r4, #0xc]
	pop {r3, r4, r5, pc}
_0224ACEA:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xe6
	bl ReadBattleScriptFromNarc
	add r0, r4, #0
	mov r1, #0
	add r0, #0xb4
	str r1, [r0]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x2c
	str r0, [r4, #0xc]
	pop {r3, r4, r5, pc}
_0224AD06:
	ldr r2, [r4, #0x64]
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02252B68
	cmp r0, #0
	beq _0224AD30
	add r0, r4, #0
	mov r1, #1
	mov r2, #3
	bl ReadBattleScriptFromNarc
	add r0, r4, #0
	mov r1, #0
	add r0, #0xb4
	str r1, [r0]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x2c
	str r0, [r4, #0xc]
	pop {r3, r4, r5, pc}
_0224AD30:
	add r0, r4, #0
	mov r1, #1
	mov r2, #8
	bl ReadBattleScriptFromNarc
	add r0, r4, #0
	mov r1, #0
	add r0, #0xb4
	str r1, [r0]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x28
	str r0, [r4, #0xc]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224AD4C: .word 0x000021E8
_0224AD50: .word 0x00002DB0
_0224AD54: .word 0x0400E000
	thumb_func_end ov12_0224AC94

	thumb_func_start ov12_0224AD58
ov12_0224AD58: ; 0x0224AD58
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0224AD9C ; =0x00000113
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	mov r0, #0
	str r0, [r4, #0x64]
	mov r0, #1
	str r0, [r4, #0x6c]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x28
	str r0, [r4, #0xc]
	mov r0, #0x4a
	mov r1, #5
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	bl ov12_0223B6B4
	sub r1, r0, #1
	add r0, r5, #0
	bl ov12_0223B6C0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov12_02263A1C
	pop {r3, r4, r5, pc}
	nop
_0224AD9C: .word 0x00000113
	thumb_func_end ov12_0224AD58

	thumb_func_start ov12_0224ADA0
ov12_0224ADA0: ; 0x0224ADA0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xe3
	bl ReadBattleScriptFromNarc
	mov r0, #0
	str r0, [r4, #0x64]
	mov r0, #1
	str r0, [r4, #0x6c]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x28
	str r0, [r4, #0xc]
	add r0, r5, #0
	bl ov12_0223BD98
	mov r1, #0xa
	bl _s32_div_f
	mov r0, #0x4e
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, _0224ADFC ; =0x0000311D
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _0224ADDE
	sub r1, r1, #1
	strb r1, [r4, r0]
_0224ADDE:
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0224ADFA
	mov r1, #1
	sub r0, #8
	str r1, [r4, r0]
	ldr r0, _0224AE00 ; =0x0000311C
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _0224ADFA
	sub r1, r1, #1
	strb r1, [r4, r0]
_0224ADFA:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224ADFC: .word 0x0000311D
_0224AE00: .word 0x0000311C
	thumb_func_end ov12_0224ADA0

	thumb_func_start ov12_0224AE04
ov12_0224AE04: ; 0x0224AE04
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xe4
	bl ReadBattleScriptFromNarc
	mov r0, #0
	str r0, [r4, #0x64]
	mov r0, #1
	str r0, [r4, #0x6c]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x28
	str r0, [r4, #0xc]
	add r0, r5, #0
	bl ov12_0223BD98
	mov r1, #0xa
	bl _s32_div_f
	mov r0, #0x4e
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, _0224AE5C ; =0x0000311C
	ldrb r1, [r4, r0]
	cmp r1, #0xc
	bhs _0224AE42
	add r1, r1, #1
	strb r1, [r4, r0]
_0224AE42:
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224AE58
	ldr r0, _0224AE60 ; =0x0000311D
	ldrb r1, [r4, r0]
	cmp r1, #0xc
	bhs _0224AE58
	add r1, r1, #1
	strb r1, [r4, r0]
_0224AE58:
	pop {r3, r4, r5, pc}
	nop
_0224AE5C: .word 0x0000311C
_0224AE60: .word 0x0000311D
	thumb_func_end ov12_0224AE04

	thumb_func_start ov12_0224AE64
ov12_0224AE64: ; 0x0224AE64
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xe5
	bl ReadBattleScriptFromNarc
	mov r0, #0
	str r0, [r4, #0x64]
	mov r0, #1
	str r0, [r4, #0x6c]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x28
	str r0, [r4, #0xc]
	pop {r4, pc}
	thumb_func_end ov12_0224AE64

	thumb_func_start ov12_0224AE84
ov12_0224AE84: ; 0x0224AE84
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xb
	bl ReadBattleScriptFromNarc
	mov r0, #0
	str r0, [r4, #0x64]
	mov r0, #1
	str r0, [r4, #0x6c]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x28
	ldr r1, _0224AEC8 ; =0x000001F3
	str r0, [r4, #0xc]
	add r0, r1, #0
	sub r0, #0xcb
	str r1, [r4, r0]
	add r0, r5, #0
	bl ov12_0223B6B4
	sub r1, r0, #1
	add r0, r5, #0
	bl ov12_0223B6C0
	ldr r1, _0224AECC ; =0x0000216C
	mov r0, #2
	ldr r2, [r4, r1]
	lsl r0, r0, #0x1e
	orr r0, r2
	str r0, [r4, r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224AEC8: .word 0x000001F3
_0224AECC: .word 0x0000216C
	thumb_func_end ov12_0224AE84

	thumb_func_start ov12_0224AED0
ov12_0224AED0: ; 0x0224AED0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	bl ov12_0223A7E0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov12_0223AA40
	str r0, [sp, #0x28]
	mov r0, #0x84
	tst r0, r6
	beq _0224AEF6
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224AEF6:
	ldr r1, [r4, #0x64]
	add r0, r5, #0
	bl ov12_0223AB1C
	cmp r0, #0
	beq _0224AF08
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224AF08:
	mov r0, #0x40
	tst r0, r6
	beq _0224AF20
	ldr r1, [r4, #0x64]
	add r0, r5, #0
	bl ov12_0223AB0C
	cmp r0, #4
	bne _0224AF20
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224AF20:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02256854
	cmp r0, #1
	bne _0224AF32
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224AF32:
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl ov12_022567A0
	cmp r0, #0
	bne _0224AF44
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224AF44:
	ldr r0, _0224B1D0 ; =0x00003044
	ldr r0, [r4, r0]
	cmp r0, #0x75
	bne _0224AF5E
	ldr r0, _0224B1D4 ; =0x0000213C
	ldr r1, [r4, r0]
	mov r0, #2
	lsl r0, r0, #8
	tst r0, r1
	beq _0224AF5E
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224AF5E:
	ldr r0, [sp, #0x28]
	bl PlayerProfile_CountBadges
	cmp r0, #8
	blt _0224AF6E
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224AF6E:
	ldr r0, [sp, #0x28]
	mov r6, #0xa
	bl PlayerProfile_CountBadges
	cmp r0, #1
	blt _0224AF7C
	mov r6, #0x14
_0224AF7C:
	ldr r0, [sp, #0x28]
	bl PlayerProfile_CountBadges
	cmp r0, #2
	blt _0224AF88
	mov r6, #0x1e
_0224AF88:
	ldr r0, [sp, #0x28]
	mov r1, #3
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _0224AF96
	mov r6, #0x32
_0224AF96:
	ldr r0, [sp, #0x28]
	mov r1, #5
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _0224AFA4
	mov r6, #0x46
_0224AFA4:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	str r0, [sp, #0x20]
	add r1, r4, r0
	ldr r0, _0224B1D8 ; =0x00002D74
	ldrb r0, [r1, r0]
	cmp r0, r6
	bhi _0224AFBC
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224AFBC:
	add r0, r5, #0
	bl ov12_0223BD98
	ldr r1, [sp, #0x20]
	lsl r0, r0, #0x18
	add r2, r4, r1
	ldr r1, _0224B1D8 ; =0x00002D74
	lsr r0, r0, #0x18
	ldrb r2, [r2, r1]
	add r2, r6, r2
	mul r0, r2
	asr r0, r0, #8
	cmp r0, r6
	bge _0224AFDE
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224AFDE:
	ldr r0, _0224B1D0 ; =0x00003044
	ldr r0, [r4, r0]
	cmp r0, #0x63
	bne _0224AFF6
	add r1, #0x3c
	add r0, r4, r1
	ldr r1, [sp, #0x20]
	ldr r2, [r0, r1]
	ldr r1, _0224B1DC ; =0xFF7FFFFF
	and r2, r1
	ldr r1, [sp, #0x20]
	str r2, [r0, r1]
_0224AFF6:
	ldr r0, [r4, #0x64]
	mov r1, #0xc0
	mul r1, r0
	str r0, [sp, #0x1c]
	ldr r0, _0224B1E0 ; =0x00002DAC
	add r1, r4, r1
	ldr r1, [r1, r0]
	mov r0, #7
	tst r0, r1
	beq _0224B020
	ldr r0, _0224B1D0 ; =0x00003044
	ldr r0, [r4, r0]
	cmp r0, #0xad
	beq _0224B016
	cmp r0, #0xd6
	bne _0224B020
_0224B016:
	mov r0, #0xfe
	str r0, [r7]
	add sp, #0x30
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224B020:
	ldr r0, [sp, #0x1c]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _0224B1D8 ; =0x00002D74
	add r1, r4, r1
	ldrb r0, [r1, r0]
	str r0, [sp, #0x24]
	add r0, r5, #0
	bl ov12_0223BD98
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0x18
	add r1, r6, r1
	lsr r0, r0, #0x18
	mul r0, r1
	asr r0, r0, #8
	cmp r0, r6
	bge _0224B108
	ldr r0, [sp, #0x1c]
	lsl r0, r0, #1
	add r1, r4, r0
	ldr r0, _0224B1E4 ; =0x000030BC
	ldrh r0, [r1, r0]
	bl MaskOfFlagNo
	add r3, r0, #0
	mov r0, #0
	mvn r0, r0
	str r0, [sp]
	ldr r2, [r4, #0x64]
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_022517EC
	add r6, r0, #0
	cmp r6, #0xf
	bne _0224B074
	mov r0, #0xff
	str r0, [r7]
	add sp, #0x30
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224B074:
	add r0, r5, #0
	bl ov12_0223BD98
	mov r1, #3
	and r0, r1
	str r0, [sp, #0x2c]
	bl MaskOfFlagNo
	tst r0, r6
	bne _0224B074
	ldr r0, [r4, #0x64]
	ldr r3, _0224B1E4 ; =0x000030BC
	lsl r0, r0, #1
	add r1, r4, r0
	ldr r0, [sp, #0x2c]
	strh r0, [r1, r3]
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	lsl r1, r1, #1
	add r1, r4, r1
	ldrh r1, [r1, r3]
	add r0, r4, r0
	lsl r1, r1, #1
	add r1, r0, r1
	ldr r0, _0224B1E8 ; =0x00002D4C
	ldrh r1, [r1, r0]
	add r0, r3, #0
	sub r0, #0x7c
	str r1, [r4, r0]
	add r0, r3, #0
	sub r0, #0x7c
	ldr r1, [r4, r0]
	add r0, r3, #0
	sub r0, #0x78
	str r1, [r4, r0]
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	sub r3, #0x7c
	ldr r3, [r4, r3]
	ldr r2, [r4, #0x64]
	lsl r3, r3, #0x10
	add r0, r5, #0
	add r1, r4, #0
	lsr r3, r3, #0x10
	bl ov12_022506D4
	str r0, [r4, #0x6c]
	cmp r0, #0xff
	bne _0224B0E8
	ldr r2, [r4, #0x64]
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02253DA0
	b _0224B0E8
_0224B0E8:
	ldr r1, [r4, #0x64]
	add sp, #0x30
	lsl r1, r1, #4
	add r2, r4, r1
	ldr r1, _0224B1EC ; =0x000021AC
	str r0, [r2, r1]
	mov r0, #1
	lsl r0, r0, #8
	str r0, [r7]
	ldr r1, _0224B1F0 ; =0x00002184
	mov r0, #1
	ldr r2, [r4, r1]
	orr r0, r2
	str r0, [r4, r1]
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0224B108:
	ldr r0, [sp, #0x24]
	sub r0, r0, r6
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r5, #0
	bl ov12_0223BD98
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	cmp r0, r6
	bge _0224B160
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r2, r4, r0
	ldr r0, _0224B1E0 ; =0x00002DAC
	ldr r0, [r2, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bne _0224B160
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x48
	beq _0224B160
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0xf
	beq _0224B160
	mov r1, #6
	lsl r1, r1, #6
	mov r0, #0xf
	ldr r2, [r4, r1]
	lsl r0, r0, #8
	tst r0, r2
	bne _0224B160
	sub r1, #0x7f
	add sp, #0x30
	str r1, [r7]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224B160:
	ldr r0, [sp, #0x18]
	sub r0, r0, r6
	cmp r0, r6
	bge _0224B1C6
	ldr r1, [r4, #0x64]
	mov r0, #0x46
	str r1, [r4, #0x6c]
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r1, [r4, #0x64]
	mov r3, #0
	str r3, [sp]
	mov r0, #0x28
	str r0, [sp, #4]
	lsl r0, r1, #0x18
	str r3, [sp, #8]
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r2, #1
	add r0, r5, #0
	add r1, r4, #0
	str r2, [sp, #0x14]
	bl ov12_02256FF8
	ldr r2, _0224B1F4 ; =0x0000215C
	add r1, r4, #0
	str r0, [r4, r2]
	ldr r2, [r4, r2]
	add r0, r5, #0
	bl ov12_02257C30
	ldr r1, _0224B1F4 ; =0x0000215C
	add sp, #0x30
	str r0, [r4, r1]
	mov r0, #0
	ldr r2, [r4, r1]
	mvn r0, r0
	mul r0, r2
	str r0, [r4, r1]
	ldr r0, _0224B1F8 ; =0x00000102
	str r0, [r7]
	add r0, r1, #0
	sub r0, #0x20
	ldr r2, [r4, r0]
	mov r0, #2
	orr r0, r2
	sub r1, #0x20
	str r0, [r4, r1]
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0224B1C6:
	mov r0, #0xff
	str r0, [r7]
	mov r0, #1
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224B1D0: .word 0x00003044
_0224B1D4: .word 0x0000213C
_0224B1D8: .word 0x00002D74
_0224B1DC: .word 0xFF7FFFFF
_0224B1E0: .word 0x00002DAC
_0224B1E4: .word 0x000030BC
_0224B1E8: .word 0x00002D4C
_0224B1EC: .word 0x000021AC
_0224B1F0: .word 0x00002184
_0224B1F4: .word 0x0000215C
_0224B1F8: .word 0x00000102
	thumb_func_end ov12_0224AED0

	thumb_func_start ov12_0224B1FC
ov12_0224B1FC: ; 0x0224B1FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	ldr r3, [r5, #0x64]
	mov r2, #0x1c
	mul r2, r3
	add r6, r5, r2
	mov r2, #0xb5
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	str r0, [sp, #4]
	lsl r2, r2, #0x1f
	mov r4, #1
	lsr r2, r2, #0x1f
	bne _0224B2B6
	ldr r6, [r5, #0x6c]
	cmp r6, #0xff
	beq _0224B2B6
	mov r2, #0xc1
	lsl r2, r2, #6
	ldr r7, [r5, r2]
	ldr r2, _0224B384 ; =0x0000011E
	cmp r7, r2
	bne _0224B23A
	mov r2, #0x2e
	str r2, [sp]
	mov r2, #3
	bl ov12_02252324
	add r4, r4, r0
	b _0224B2B6
_0224B23A:
	lsl r0, r7, #4
	add r1, r5, r0
	ldr r0, _0224B388 ; =0x000003E6
	ldrh r1, [r1, r0]
	cmp r1, #0x40
	bgt _0224B264
	bge _0224B280
	cmp r1, #0x10
	bgt _0224B25E
	bge _0224B2B6
	cmp r1, #8
	bgt _0224B2A4
	cmp r1, #4
	blt _0224B2A4
	beq _0224B292
	cmp r1, #8
	beq _0224B280
	b _0224B2A4
_0224B25E:
	cmp r1, #0x20
	beq _0224B2B6
	b _0224B2A4
_0224B264:
	add r0, r2, #0
	sub r0, #0x1e
	cmp r1, r0
	bgt _0224B278
	sub r2, #0x1e
	cmp r1, r2
	bge _0224B2B6
	cmp r1, #0x80
	beq _0224B292
	b _0224B2A4
_0224B278:
	add r2, #0xe2
	cmp r1, r2
	beq _0224B2B6
	b _0224B2A4
_0224B280:
	mov r0, #0x2e
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #9
	bl ov12_02252324
	add r4, r4, r0
	b _0224B2B6
_0224B292:
	mov r0, #0x2e
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #3
	bl ov12_02252324
	add r4, r4, r0
	b _0224B2B6
_0224B2A4:
	cmp r3, r6
	beq _0224B2B6
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_022527CC
	cmp r0, #0x2e
	bne _0224B2B6
	add r4, r4, #1
_0224B2B6:
	mov r0, #0xb5
	lsl r0, r0, #6
	add r2, r5, r0
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	mov r1, #0xc1
	lsl r1, r1, #6
	ldr r1, [r5, r1]
	add r0, r2, r0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ov12_02251C60
	add r6, r0, #0
	ldr r1, [r5, #0x64]
	mov r0, #0x75
	lsl r0, r0, #2
	add r0, r5, r0
	lsl r7, r1, #6
	ldr r3, [r0, r7]
	lsl r2, r3, #0x1e
	lsr r2, r2, #0x1f
	bne _0224B32E
	lsl r2, r3, #0x1f
	lsr r2, r2, #0x1f
	bne _0224B32E
	mov r1, #2
	orr r1, r3
	str r1, [r0, r7]
	ldr r0, _0224B38C ; =0x00002D6C
	ldr r1, [r5, #0x64]
	add r2, r5, r0
	mov r0, #0xc0
	mul r0, r1
	add r1, r2, r0
	ldrb r0, [r1, r6]
	cmp r0, #0
	beq _0224B320
	cmp r6, #4
	bge _0224B320
	cmp r0, r4
	ble _0224B310
	sub r0, r0, r4
	b _0224B312
_0224B310:
	mov r0, #0
_0224B312:
	strb r0, [r1, r6]
	ldr r0, [sp, #4]
	ldr r2, [r5, #0x64]
	add r1, r5, #0
	bl ov12_02250C40
	b _0224B37C
_0224B320:
	ldr r1, _0224B390 ; =0x0000216C
	mov r0, #2
	ldr r2, [r5, r1]
	lsl r0, r0, #8
	orr r0, r2
	str r0, [r5, r1]
	b _0224B37C
_0224B32E:
	mov r2, #0xc0
	add r0, r1, #0
	mul r0, r2
	add r0, r5, r0
	ldr r3, _0224B38C ; =0x00002D6C
	add r4, r0, r6
	ldrb r4, [r4, r3]
	cmp r4, #0
	bne _0224B37C
	ldr r4, _0224B394 ; =0x0000213C
	mov r7, #2
	ldr r4, [r5, r4]
	lsl r7, r7, #8
	tst r4, r7
	bne _0224B37C
	add r3, #0x44
	ldr r0, [r0, r3]
	lsl r3, r7, #3
	tst r3, r0
	bne _0224B37C
	lsl r2, r2, #4
	tst r0, r2
	bne _0224B37C
	add r0, r1, #0
	bl MaskOfFlagNo
	add r1, r7, #0
	sub r1, #0x80
	ldr r2, [r5, r1]
	lsl r0, r0, #8
	tst r0, r2
	bne _0224B37C
	cmp r6, #4
	bge _0224B37C
	ldr r0, _0224B390 ; =0x0000216C
	add r1, #0x80
	ldr r2, [r5, r0]
	orr r1, r2
	str r1, [r5, r0]
_0224B37C:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224B384: .word 0x0000011E
_0224B388: .word 0x000003E6
_0224B38C: .word 0x00002D6C
_0224B390: .word 0x0000216C
_0224B394: .word 0x0000213C
	thumb_func_end ov12_0224B1FC

	thumb_func_start ov12_0224B398
ov12_0224B398: ; 0x0224B398
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	mov r4, #0
	ldr r0, [r5, #0x6c]
	add r6, r4, #0
	cmp r0, #0xff
	bne _0224B3B6
	ldr r1, _0224B484 ; =0x00003044
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov12_022525AC
	cmp r0, #0
	beq _0224B3E8
_0224B3B6:
	ldr r0, [r5, #0x6c]
	cmp r0, #0xff
	bne _0224B3FC
	ldr r1, _0224B484 ; =0x00003044
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov12_022525AC
	cmp r0, #1
	bne _0224B3FC
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0224B488 ; =0x00002DB0
	ldr r0, [r1, r0]
	mov r1, #1
	lsl r1, r1, #0xc
	tst r0, r1
	bne _0224B3E8
	ldr r0, _0224B48C ; =0x0000213C
	ldr r2, [r5, r0]
	lsr r0, r1, #3
	tst r0, r2
	beq _0224B3FC
_0224B3E8:
	ldr r2, _0224B490 ; =0x00000119
	add r0, r5, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	mov r0, #0x27
	str r0, [r5, #0xc]
	mov r0, #0x16
	str r0, [r5, #8]
	mov r4, #1
_0224B3FC:
	mov r0, #0xd
	str r0, [sp]
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _0224B442
	mov r0, #0x4c
	str r0, [sp]
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _0224B442
	ldr r0, _0224B484 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0224B494 ; =0x000003DE
	ldrh r0, [r1, r0]
	cmp r0, #0x97
	bne _0224B442
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #0x30
	tst r0, r1
	beq _0224B442
	mov r6, #1
_0224B442:
	ldr r0, [r5, #0x6c]
	cmp r0, #0xff
	bne _0224B480
	ldr r1, _0224B484 ; =0x00003044
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov12_022525AC
	cmp r0, #1
	bne _0224B480
	cmp r4, #0
	bne _0224B480
	cmp r6, #0
	bne _0224B480
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl ov12_02255830
	cmp r0, #0x63
	beq _0224B480
	ldr r0, [r5, #0x64]
	mov r1, #0xc0
	mul r1, r0
	add r2, r5, r1
	ldr r1, _0224B488 ; =0x00002DB0
	ldr r2, [r2, r1]
	mov r1, #1
	lsl r1, r1, #0xc
	tst r1, r2
	bne _0224B480
	str r0, [r5, #0x6c]
_0224B480:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224B484: .word 0x00003044
_0224B488: .word 0x00002DB0
_0224B48C: .word 0x0000213C
_0224B490: .word 0x00000119
_0224B494: .word 0x000003DE
	thumb_func_end ov12_0224B398

	thumb_func_start ov12_0224B498
ov12_0224B498: ; 0x0224B498
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	ldr r1, _0224B518 ; =0x00003044
	ldr r2, [r4, r1]
	lsl r1, r2, #4
	add r5, r4, r1
	ldr r1, _0224B51C ; =0x000003E6
	ldrh r3, [r5, r1]
	cmp r3, #0x10
	beq _0224B4CC
	cmp r3, #0x20
	beq _0224B4CC
	sub r1, r1, #5
	ldrb r1, [r5, r1]
	cmp r1, #0
	beq _0224B4CC
	ldr r1, _0224B520 ; =0x0000213C
	ldr r3, [r4, r1]
	mov r1, #2
	lsl r1, r1, #0xe
	tst r1, r3
	bne _0224B4CC
	mov r1, #0x20
	tst r1, r3
	beq _0224B4D0
_0224B4CC:
	cmp r2, #0x56
	bne _0224B510
_0224B4D0:
	ldr r1, [r4, #0x64]
	ldr r3, _0224B524 ; =0x00002144
	str r1, [sp]
	ldr r1, [r4, #0x6c]
	str r1, [sp, #4]
	ldr r1, [r4, r3]
	str r1, [sp, #8]
	add r1, r3, #0
	add r1, #0x28
	add r1, r4, r1
	str r1, [sp, #0xc]
	add r3, #0x1c
	ldr r3, [r4, r3]
	add r1, r4, #0
	bl ov12_02251D28
	ldr r1, _0224B524 ; =0x00002144
	str r0, [r4, r1]
	add r1, #0x28
	ldr r1, [r4, r1]
	mov r0, #8
	tst r0, r1
	beq _0224B510
	mov r0, #0xd1
	lsl r0, r0, #2
	add r3, r4, r0
	ldr r0, [r4, #0x64]
	lsl r2, r0, #2
	ldr r1, [r3, r2]
	mov r0, #2
	orr r0, r1
	str r0, [r3, r2]
_0224B510:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0224B518: .word 0x00003044
_0224B51C: .word 0x000003E6
_0224B520: .word 0x0000213C
_0224B524: .word 0x00002144
	thumb_func_end ov12_0224B498

	thumb_func_start ov12_0224B528
ov12_0224B528: ; 0x0224B528
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r0, [sp, #0x18]
	add r4, r1, #0
	ldr r0, _0224B854 ; =0x00003044
	add r5, r4, #0
	ldr r0, [r4, r0]
	mov r7, #0
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _0224B858 ; =0x000003DE
	add r5, #0x50
	ldrh r0, [r1, r0]
	str r0, [sp, #0x1c]
	mov r0, #0xd1
	lsl r0, r0, #2
	add r6, r4, r0
	mov r0, #7
	str r0, [sp, #0x20]
	mov r0, #8
	str r0, [sp, #0x24]
	mov r0, #1
	str r0, [sp, #0x28]
_0224B556:
	ldr r0, [r4, #0x50]
	cmp r0, #0x10
	bls _0224B55E
	b _0224BBC2
_0224B55E:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224B56A: ; jump table
	.short _0224B58C - _0224B56A - 2 ; case 0
	.short _0224B5C0 - _0224B56A - 2 ; case 1
	.short _0224B6BA - _0224B56A - 2 ; case 2
	.short _0224B720 - _0224B56A - 2 ; case 3
	.short _0224B748 - _0224B56A - 2 ; case 4
	.short _0224B784 - _0224B56A - 2 ; case 5
	.short _0224B7CA - _0224B56A - 2 ; case 6
	.short _0224B806 - _0224B56A - 2 ; case 7
	.short _0224B84E - _0224B56A - 2 ; case 8
	.short _0224B8B4 - _0224B56A - 2 ; case 9
	.short _0224B8F0 - _0224B56A - 2 ; case 10
	.short _0224B92C - _0224B56A - 2 ; case 11
	.short _0224BA0E - _0224B56A - 2 ; case 12
	.short _0224BA6C - _0224B56A - 2 ; case 13
	.short _0224BAD4 - _0224B56A - 2 ; case 14
	.short _0224BB84 - _0224B56A - 2 ; case 15
	.short _0224BBBC - _0224B56A - 2 ; case 16
_0224B58C:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r2, r4, r0
	ldr r0, _0224B85C ; =0x00002DB0
	ldr r1, [r2, r0]
	ldr r0, _0224B860 ; =0xFDFFFFFF
	and r1, r0
	ldr r0, _0224B85C ; =0x00002DB0
	str r1, [r2, r0]
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r2, r4, r0
	mov r0, #0xb7
	lsl r0, r0, #6
	ldr r1, [r2, r0]
	ldr r0, _0224B864 ; =0xFFFFBFFF
	and r1, r0
	mov r0, #0xb7
	lsl r0, r0, #6
	str r1, [r2, r0]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224BBC2
_0224B5C0:
	ldr r2, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r2
	add r1, r4, r0
	ldr r0, _0224B868 ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #7
	tst r0, r1
	beq _0224B6B2
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #0xf
	lsl r0, r0, #8
	tst r0, r1
	beq _0224B60A
	add r0, r4, #0
	add r1, r2, #0
	bl ov12_022527CC
	cmp r0, #0x2b
	beq _0224B60A
	mov r0, #0x46
	ldr r1, [r4, #0x64]
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x13
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r7, #2
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	b _0224B6B2
_0224B60A:
	ldr r0, _0224B854 ; =0x00003044
	ldr r0, [r4, r0]
	cmp r0, #0xd6
	beq _0224B620
	mov r0, #0xc1
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0xd6
	bne _0224B620
	mov r0, #1
	b _0224B622
_0224B620:
	mov r0, #0
_0224B622:
	cmp r0, #0
	bne _0224B6B2
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x30
	bne _0224B636
	mov r3, #2
	b _0224B638
_0224B636:
	mov r3, #1
_0224B638:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r2, r4, r0
	ldr r0, _0224B868 ; =0x00002DAC
	ldr r1, [r2, r0]
	mov r0, #7
	and r0, r1
	cmp r0, r3
	ldr r0, _0224B868 ; =0x00002DAC
	bhs _0224B656
	ldr r1, [r2, r0]
	ldr r0, [sp, #0x20]
	bic r1, r0
	b _0224B65A
_0224B656:
	ldr r0, [r2, r0]
	sub r1, r0, r3
_0224B65A:
	ldr r0, _0224B868 ; =0x00002DAC
	str r1, [r2, r0]
	ldr r2, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r2
	add r1, r4, r0
	ldr r0, _0224B868 ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #7
	tst r0, r1
	beq _0224B698
	ldr r0, _0224B854 ; =0x00003044
	ldr r0, [r4, r0]
	cmp r0, #0xad
	beq _0224B6B2
	mov r0, #0xc1
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0xd6
	beq _0224B6B2
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x14
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x27
	str r0, [r4, #0xc]
	mov r7, #2
	b _0224B6B2
_0224B698:
	mov r0, #0x46
	lsl r0, r0, #2
	str r2, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x13
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r7, #2
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_0224B6B2:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224BBC2
_0224B6BA:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0224B868 ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #0x20
	tst r0, r1
	beq _0224B718
	ldr r0, [sp, #0x18]
	bl ov12_0223BD98
	mov r1, #5
	bl _s32_div_f
	cmp r1, #0
	beq _0224B6FC
	ldr r0, [sp, #0x1c]
	cmp r0, #0x7d
	beq _0224B718
	cmp r0, #0xfd
	beq _0224B718
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1c
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x27
	str r0, [r4, #0xc]
	mov r7, #1
	b _0224B718
_0224B6FC:
	mov r0, #0x46
	ldr r1, [r4, #0x64]
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1d
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r7, #2
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_0224B718:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224BBC2
_0224B720:
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl ov12_02252C40
	cmp r0, #1
	bne _0224B740
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xbf
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x27
	str r0, [r4, #0xc]
	mov r7, #1
_0224B740:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224BBC2
_0224B748:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r2, r4, r0
	ldr r0, _0224B85C ; =0x00002DB0
	ldr r1, [r2, r0]
	mov r0, #1
	lsl r0, r0, #0x16
	tst r0, r1
	beq _0224B77C
	ldr r0, _0224B85C ; =0x00002DB0
	ldr r1, [r2, r0]
	ldr r0, _0224B86C ; =0xFFBFFFFF
	and r1, r0
	ldr r0, _0224B85C ; =0x00002DB0
	str r1, [r2, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x41
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x27
	str r0, [r4, #0xc]
	mov r7, #1
_0224B77C:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224BBC2
_0224B784:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r2, r4, r0
	ldr r0, _0224B85C ; =0x00002DB0
	ldr r1, [r2, r0]
	mov r0, #8
	tst r0, r1
	beq _0224B7C2
	ldr r0, _0224B85C ; =0x00002DB0
	ldr r1, [sp, #0x24]
	ldr r0, [r2, r0]
	bic r0, r1
	ldr r1, _0224B85C ; =0x00002DB0
	str r0, [r2, r1]
	ldr r0, [r4, #0x64]
	mov r1, #0x40
	lsl r0, r0, #2
	ldr r2, [r6, r0]
	orr r1, r2
	str r1, [r6, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xf
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x27
	str r0, [r4, #0xc]
	mov r7, #1
_0224B7C2:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224BBC2
_0224B7CA:
	mov r0, #0xc1
	lsl r0, r0, #6
	ldr r3, [r4, r0]
	ldr r2, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r2
	add r1, r4, r0
	ldr r0, _0224B870 ; =0x00002DE8
	ldrh r0, [r1, r0]
	cmp r3, r0
	bne _0224B7FE
	lsl r0, r2, #2
	ldr r2, [r6, r0]
	mov r1, #0x10
	orr r1, r2
	str r1, [r6, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x47
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x27
	str r0, [r4, #0xc]
	mov r7, #1
_0224B7FE:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224BBC2
_0224B806:
	ldr r2, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r2
	add r1, r4, r0
	ldr r0, _0224B874 ; =0x00002DC8
	ldr r0, [r1, r0]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x1d
	beq _0224B846
	ldr r0, _0224B854 ; =0x00003044
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _0224B878 ; =0x000003E1
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0224B846
	lsl r0, r2, #2
	ldr r2, [r6, r0]
	mov r1, #0x20
	orr r1, r2
	str r1, [r6, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x85
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x27
	str r0, [r4, #0xc]
	mov r7, #1
_0224B846:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224BBC2
_0224B84E:
	ldr r3, _0224B854 ; =0x00003044
	b _0224B87C
	nop
_0224B854: .word 0x00003044
_0224B858: .word 0x000003DE
_0224B85C: .word 0x00002DB0
_0224B860: .word 0xFDFFFFFF
_0224B864: .word 0xFFFFBFFF
_0224B868: .word 0x00002DAC
_0224B86C: .word 0xFFBFFFFF
_0224B870: .word 0x00002DE8
_0224B874: .word 0x00002DC8
_0224B878: .word 0x000003E1
_0224B87C:
	ldr r0, [sp, #0x18]
	ldr r2, [r4, #0x64]
	ldr r3, [r4, r3]
	add r1, r4, #0
	bl ov12_02252C74
	cmp r0, #0
	beq _0224B8AC
	ldr r0, [r4, #0x64]
	mov r1, #4
	lsl r0, r0, #2
	ldr r2, [r6, r0]
	orr r1, r2
	str r1, [r6, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x90
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x27
	str r0, [r4, #0xc]
	mov r7, #1
_0224B8AC:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224BBC2
_0224B8B4:
	ldr r3, _0224BBDC ; =0x00003044
	ldr r0, [sp, #0x18]
	ldr r2, [r4, #0x64]
	ldr r3, [r4, r3]
	add r1, r4, #0
	bl ov12_02252DC4
	cmp r0, #0
	beq _0224B8E8
	ldr r0, [r4, #0x64]
	mov r1, #1
	lsl r0, r0, #2
	ldr r2, [r6, r0]
	lsl r1, r1, #8
	orr r1, r2
	str r1, [r6, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x9d
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x27
	str r0, [r4, #0xc]
	mov r7, #1
_0224B8E8:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224BBC2
_0224B8F0:
	ldr r3, _0224BBDC ; =0x00003044
	ldr r0, [sp, #0x18]
	ldr r2, [r4, #0x64]
	ldr r3, [r4, r3]
	add r1, r4, #0
	bl ov12_02252DF8
	cmp r0, #0
	beq _0224B924
	ldr r0, [r4, #0x64]
	mov r1, #2
	lsl r0, r0, #2
	ldr r2, [r6, r0]
	lsl r1, r1, #8
	orr r1, r2
	str r1, [r6, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xae
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x27
	str r0, [r4, #0xc]
	mov r7, #1
_0224B924:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224BBC2
_0224B92C:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r2, r4, r0
	ldr r0, _0224BBE0 ; =0x00002DB0
	ldr r1, [r2, r0]
	mov r0, #7
	tst r0, r1
	bne _0224B946
	b _0224BBC2
_0224B946:
	ldr r0, _0224BBE0 ; =0x00002DB0
	ldr r0, [r2, r0]
	sub r1, r0, #1
	ldr r0, _0224BBE0 ; =0x00002DB0
	str r1, [r2, r0]
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0224BBE0 ; =0x00002DB0
	ldr r1, [r1, r0]
	mov r0, #7
	tst r0, r1
	beq _0224B9F8
	ldr r0, [sp, #0x18]
	bl ov12_0223BD98
	mov r1, #1
	tst r0, r1
	beq _0224B982
	add r0, r4, #0
	mov r2, #0x26
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r7, #2
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	b _0224BBC2
_0224B982:
	ldr r0, [r4, #0x64]
	mov r1, #0x80
	lsl r0, r0, #2
	ldr r2, [r6, r0]
	mov r3, #0
	orr r1, r2
	str r1, [r6, r0]
	ldr r1, [r4, #0x64]
	mov r0, #0x46
	str r1, [r4, #0x6c]
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r4, #0x64]
	mov r1, #0
	str r1, [sp]
	mov r1, #0x28
	str r1, [sp, #4]
	mov r1, #0
	lsl r0, r0, #0x18
	str r1, [sp, #8]
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	mov r2, #0xa5
	bl ov12_02256FF8
	ldr r1, _0224BBE4 ; =0x0000215C
	ldr r2, _0224BBE4 ; =0x0000215C
	str r0, [r4, r1]
	ldr r0, [sp, #0x18]
	ldr r2, [r4, r2]
	add r1, r4, #0
	bl ov12_02257C30
	ldr r1, _0224BBE4 ; =0x0000215C
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r1, [r4, r0]
	mov r0, #0
	add r2, r1, #0
	mvn r0, r0
	mul r2, r0
	ldr r0, _0224BBE4 ; =0x0000215C
	mov r1, #1
	str r2, [r4, r0]
	add r0, r4, #0
	mov r2, #0x27
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x22
	str r0, [r4, #0xc]
	mov r7, #1
	b _0224BBC2
_0224B9F8:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x28
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r7, #2
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	b _0224BBC2
_0224BA0E:
	ldr r2, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r2
	add r1, r4, r0
	ldr r0, _0224BBE8 ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #0x40
	tst r0, r1
	beq _0224BA64
	add r0, r4, #0
	add r1, r2, #0
	bl ov12_022527CC
	cmp r0, #0x62
	beq _0224BA64
	ldr r0, [sp, #0x18]
	bl ov12_0223BD98
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x1e
	sub r2, r2, r1
	mov r0, #0x1e
	ror r2, r0
	add r0, r1, r2
	bne _0224BA64
	ldr r0, [r4, #0x64]
	ldr r2, [sp, #0x28]
	lsl r1, r0, #2
	ldr r0, [r6, r1]
	bic r0, r2
	mov r2, #1
	orr r0, r2
	str r0, [r6, r1]
	add r1, r2, #0
	add r0, r4, #0
	mov r2, #0x20
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x27
	str r0, [r4, #0xc]
	mov r7, #1
_0224BA64:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224BBC2
_0224BA6C:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0224BBE0 ; =0x00002DB0
	ldr r1, [r1, r0]
	mov r0, #0xf
	lsl r0, r0, #0x10
	and r0, r1
	beq _0224BACC
	lsr r0, r0, #0x10
	bl LowestFlagNo
	mov r1, #0x46
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [sp, #0x18]
	bl ov12_0223BD98
	mov r1, #1
	tst r0, r1
	beq _0224BAAC
	add r0, r4, #0
	mov r2, #0x6b
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r7, #2
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	b _0224BACC
_0224BAAC:
	ldr r0, [r4, #0x64]
	mov r1, #8
	lsl r0, r0, #2
	ldr r2, [r6, r0]
	orr r1, r2
	str r1, [r6, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x6c
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x27
	str r0, [r4, #0xc]
	mov r7, #1
_0224BACC:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224BBC2
_0224BAD4:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r2, r4, r0
	ldr r0, _0224BBE0 ; =0x00002DB0
	ldr r1, [r2, r0]
	mov r0, #3
	lsl r0, r0, #8
	tst r0, r1
	beq _0224BBC2
	ldr r0, _0224BBE0 ; =0x00002DB0
	ldr r1, [r2, r0]
	mov r0, #1
	lsl r0, r0, #8
	sub r1, r1, r0
	ldr r0, _0224BBE0 ; =0x00002DB0
	str r1, [r2, r0]
	ldr r0, [r4, #0x64]
	mov r1, #0xc0
	mul r1, r0
	add r2, r4, r1
	ldr r1, _0224BBE0 ; =0x00002DB0
	ldr r2, [r2, r1]
	mov r1, #3
	lsl r1, r1, #8
	tst r1, r2
	bne _0224BB6E
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _0224BBEC ; =0x000030E4
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0224BB6E
	lsl r1, r0, #1
	ldr r0, _0224BBF0 ; =0x00002144
	str r1, [r4, r0]
	ldr r3, [r4, #0x64]
	lsl r0, r3, #2
	add r1, r4, r0
	ldr r0, _0224BBF4 ; =0x000030F4
	ldr r2, [r1, r0]
	mov r0, #0xc0
	mul r0, r2
	add r1, r4, r0
	ldr r0, _0224BBF8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0224BB3E
	str r2, [r4, #0x6c]
	b _0224BB6E
_0224BB3E:
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	add r2, r3, #0
	bl ov12_02253DA0
	mov r1, #0xc0
	mul r1, r0
	str r0, [r4, #0x6c]
	ldr r0, _0224BBF8 ; =0x00002D8C
	add r1, r4, r1
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0224BB6E
	ldr r2, _0224BBFC ; =0x0000011A
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	mov r0, #0x27
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r7, #2
	b _0224BBC2
_0224BB6E:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x24
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r7, #2
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	b _0224BBC2
_0224BB84:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0224BBE8 ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #0x20
	tst r0, r1
	beq _0224BBB4
	ldr r0, [sp, #0x1c]
	cmp r0, #0x7d
	beq _0224BBA0
	cmp r0, #0xfd
	bne _0224BBB4
_0224BBA0:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1e
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r7, #2
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_0224BBB4:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224BBC2
_0224BBBC:
	mov r0, #0
	str r0, [r4, #0x50]
	mov r7, #3
_0224BBC2:
	cmp r7, #0
	bne _0224BBC8
	b _0224B556
_0224BBC8:
	ldr r0, [sp, #0x18]
	ldr r2, [r4, #0x64]
	add r1, r4, #0
	bl ov12_02250C40
	cmp r7, #1
	bne _0224BC1C
	ldr r1, _0224BC00 ; =0x0000213C
	b _0224BC04
	nop
_0224BBDC: .word 0x00003044
_0224BBE0: .word 0x00002DB0
_0224BBE4: .word 0x0000215C
_0224BBE8: .word 0x00002DAC
_0224BBEC: .word 0x000030E4
_0224BBF0: .word 0x00002144
_0224BBF4: .word 0x000030F4
_0224BBF8: .word 0x00002D8C
_0224BBFC: .word 0x0000011A
_0224BC00: .word 0x0000213C
_0224BC04:
	mov r0, #2
	ldr r2, [r4, r1]
	orr r0, r2
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x30
	ldr r2, [r4, r0]
	mov r0, #2
	lsl r0, r0, #0x1e
	orr r0, r2
	add r1, #0x30
	str r0, [r4, r1]
_0224BC1C:
	cmp r7, #3
	beq _0224BC26
	add sp, #0x2c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0224BC26:
	mov r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov12_0224B528

	thumb_func_start ov12_0224BC2C
ov12_0224BC2C: ; 0x0224BC2C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r5, #0
	ldr r7, _0224BC9C ; =0x0000216C
	mov r4, #0
	add r6, #0x54
_0224BC38:
	ldr r0, [r5, #0x54]
	cmp r0, #0
	beq _0224BC44
	cmp r0, #1
	beq _0224BC84
	b _0224BC8A
_0224BC44:
	ldr r1, [r5, #0x64]
	ldr r2, [r5, #0x6c]
	add r0, r5, #0
	bl ov12_02252EC8
	add r2, r0, #0
	beq _0224BC5C
	ldr r0, _0224BC9C ; =0x0000216C
	ldr r1, [r5, r0]
	ldr r0, _0224BCA0 ; =0x001FD849
	tst r0, r1
	beq _0224BC60
_0224BC5C:
	cmp r2, #0xb5
	bne _0224BC7C
_0224BC60:
	add r0, r5, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r5, #8]
	mov r4, #1
	str r0, [r5, #0xc]
	mov r0, #0x16
	str r0, [r5, #8]
	mov r0, #2
	ldr r1, [r5, r7]
	lsl r0, r0, #0x1e
	orr r0, r1
	str r0, [r5, r7]
_0224BC7C:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0224BC8A
_0224BC84:
	mov r0, #0
	str r0, [r5, #0x54]
	mov r4, #2
_0224BC8A:
	cmp r4, #0
	beq _0224BC38
	cmp r4, #2
	beq _0224BC96
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224BC96:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224BC9C: .word 0x0000216C
_0224BCA0: .word 0x001FD849
	thumb_func_end ov12_0224BC2C

	thumb_func_start ov12_0224BCA4
ov12_0224BCA4: ; 0x0224BCA4
	push {r4, lr}
	add r4, r1, #0
	ldr r2, _0224BCC0 ; =0x00000116
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
	nop
_0224BCC0: .word 0x00000116
	thumb_func_end ov12_0224BCA4

	thumb_func_start ov12_0224BCC4
ov12_0224BCC4: ; 0x0224BCC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp, #4]
	add r5, r1, #0
	add r6, r2, #0
	str r3, [sp, #8]
	bl ov12_0223A7E0
	mov r1, #1
	lsl r1, r1, #0xa
	tst r0, r1
	beq _0224BCE2
	add sp, #0x20
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224BCE2:
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_022527CC
	ldr r0, [sp, #0x38]
	ldr r2, _0224BFF0 ; =0x00002D5E
	lsl r0, r0, #4
	str r0, [sp, #0x10]
	add r1, r5, r0
	mov r0, #0x3e
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	add r1, r6, #0
	str r0, [sp, #0x18]
	mov r0, #0xc0
	mul r1, r0
	str r1, [sp, #0xc]
	add r1, r5, r1
	ldrsb r1, [r1, r2]
	sub r1, r1, #6
	lsl r1, r1, #0x18
	asr r7, r1, #0x18
	ldr r1, [sp, #8]
	mul r0, r1
	str r0, [sp, #0x14]
	add r1, r5, r0
	add r0, r2, #1
	ldrsb r1, [r1, r0]
	mov r0, #6
	sub r0, r0, r1
	lsl r0, r0, #0x18
	asr r4, r0, #0x18
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_022527CC
	cmp r0, #0x56
	bne _0224BD32
	lsl r0, r7, #0x19
	asr r7, r0, #0x18
_0224BD32:
	ldr r2, [sp, #8]
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #0x56
	bl ov12_02252834
	cmp r0, #1
	bne _0224BD46
	lsl r0, r4, #0x19
	asr r4, r0, #0x18
_0224BD46:
	ldr r2, [sp, #8]
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #0x6d
	bl ov12_02252834
	cmp r0, #1
	bne _0224BD58
	mov r7, #0
_0224BD58:
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_022527CC
	cmp r0, #0x6d
	bne _0224BD66
	mov r4, #0
_0224BD66:
	ldr r0, _0224BFF4 ; =0x00002DB0
	ldr r1, [sp, #0x14]
	add r2, r5, r0
	str r2, [sp, #0x1c]
	ldr r1, [r2, r1]
	mov r2, #2
	lsl r2, r2, #0x1c
	tst r1, r2
	bne _0224BD86
	ldr r1, [sp, #0x14]
	add r0, #0x10
	add r1, r5, r1
	ldr r1, [r1, r0]
	lsr r0, r2, #7
	tst r0, r1
	beq _0224BD8C
_0224BD86:
	cmp r4, #0
	bge _0224BD8C
	mov r4, #0
_0224BD8C:
	add r0, r4, #6
	add r0, r0, r7
	lsl r0, r0, #0x18
	asr r7, r0, #0x18
	bpl _0224BD98
	mov r7, #0
_0224BD98:
	cmp r7, #0xc
	ble _0224BD9E
	mov r7, #0xc
_0224BD9E:
	ldr r0, _0224BFF8 ; =0x000003E3
	add r1, r5, r0
	ldr r0, [sp, #0x10]
	ldrb r4, [r1, r0]
	cmp r4, #0
	bne _0224BDB0
	add sp, #0x20
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224BDB0:
	ldr r0, _0224BFFC ; =0x0000213C
	mov r1, #0x20
	ldr r0, [r5, r0]
	add r2, r0, #0
	tst r2, r1
	beq _0224BDC2
	add sp, #0x20
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224BDC2:
	lsl r1, r1, #5
	tst r0, r1
	beq _0224BDCE
	add sp, #0x20
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224BDCE:
	mov r0, #0xd
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _0224BE10
	mov r0, #0x4c
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _0224BE10
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #0x30
	tst r0, r1
	beq _0224BE10
	ldr r0, [sp, #0x10]
	add r1, r5, r0
	ldr r0, _0224C000 ; =0x000003DE
	ldrh r0, [r1, r0]
	cmp r0, #0x98
	bne _0224BE10
	mov r4, #0x32
_0224BE10:
	ldr r0, _0224C004 ; =ov12_0226CA74
	lsl r1, r7, #1
	ldrb r0, [r0, r1]
	ldr r2, _0224C008 ; =ov12_0226CA75
	ldrb r1, [r2, r1]
	mul r0, r4
	bl _u32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_022527CC
	cmp r0, #0xe
	bne _0224BE3E
	mov r0, #0x82
	mul r0, r4
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0224BE3E:
	mov r0, #0xd
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _0224BED6
	mov r0, #0x4c
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _0224BED6
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #0xc
	tst r0, r1
	beq _0224BE90
	ldr r2, [sp, #8]
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #8
	bl ov12_02252834
	cmp r0, #1
	bne _0224BE90
	mov r0, #0x50
	mul r0, r4
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0224BE90:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #0xc0
	tst r0, r1
	beq _0224BEBA
	ldr r2, [sp, #8]
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #0x51
	bl ov12_02252834
	cmp r0, #1
	bne _0224BEBA
	mov r0, #0x50
	mul r0, r4
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0224BEBA:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #2
	lsl r0, r0, #0xe
	tst r0, r1
	beq _0224BED6
	mov r0, #6
	mul r0, r4
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0224BED6:
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_022527CC
	cmp r0, #0x37
	bne _0224BEF6
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0224BEF6
	mov r0, #0x50
	mul r0, r4
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0224BEF6:
	ldr r2, [sp, #8]
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #0x4d
	bl ov12_02252834
	cmp r0, #1
	bne _0224BF20
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	ldr r1, [r1, r0]
	mov r0, #7
	tst r0, r1
	beq _0224BF20
	mov r0, #0x32
	mul r0, r4
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0224BF20:
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl ov12_02255830
	add r7, r0, #0
	ldr r1, [sp, #8]
	add r0, r5, #0
	mov r2, #0
	bl ov12_02255844
	cmp r7, #0x30
	bne _0224BF46
	mov r1, #0x64
	sub r0, r1, r0
	mul r0, r4
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0224BF46:
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_02255830
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	bl ov12_02255844
	add r6, r0, #0
	cmp r7, #0x5d
	bne _0224BF6E
	add r0, #0x64
	mul r0, r4
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0224BF6E:
	cmp r7, #0x68
	bne _0224BF8E
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl ov12_0225561C
	cmp r0, #1
	bne _0224BF8E
	add r6, #0x64
	add r0, r4, #0
	mul r0, r6
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0224BF8E:
	ldr r0, _0224C00C ; =0x00002DCC
	ldr r1, [sp, #0xc]
	add r0, r5, r0
	ldr r2, [r0, r1]
	lsl r1, r2, #4
	lsr r1, r1, #0x1f
	beq _0224BFB2
	ldr r1, _0224C010 ; =0xF7FFFFFF
	and r2, r1
	ldr r1, [sp, #0xc]
	str r2, [r0, r1]
	mov r0, #0x78
	mul r0, r4
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0224BFB2:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #7
	lsl r0, r0, #0xc
	tst r0, r1
	beq _0224BFCE
	mov r0, #0xa
	mul r0, r4
	mov r1, #6
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0224BFCE:
	ldr r0, [sp, #4]
	bl ov12_0223BD98
	mov r1, #0x64
	bl _s32_div_f
	add r0, r1, #1
	cmp r0, r4
	ble _0224BFEA
	ldr r1, _0224C014 ; =0x0000216C
	mov r0, #1
	ldr r2, [r5, r1]
	orr r0, r2
	str r0, [r5, r1]
_0224BFEA:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224BFF0: .word 0x00002D5E
_0224BFF4: .word 0x00002DB0
_0224BFF8: .word 0x000003E3
_0224BFFC: .word 0x0000213C
_0224C000: .word 0x000003DE
_0224C004: .word ov12_0226CA74
_0224C008: .word ov12_0226CA75
_0224C00C: .word 0x00002DCC
_0224C010: .word 0xF7FFFFFF
_0224C014: .word 0x0000216C
	thumb_func_end ov12_0224BCC4

	thumb_func_start ov12_0224C018
ov12_0224C018: ; 0x0224C018
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp, #4]
	ldr r0, _0224C1F0 ; =0x0000213C
	add r5, r1, #0
	ldr r1, [r5, r0]
	mov r0, #0x20
	add r7, r2, #0
	add r4, r3, #0
	ldr r6, [sp, #0x20]
	tst r0, r1
	beq _0224C036
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224C036:
	lsl r0, r4, #6
	add r1, r5, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	beq _0224C09A
	lsl r0, r6, #4
	add r1, r5, r0
	ldr r0, _0224C1F4 ; =0x000003E9
	ldrb r1, [r1, r0]
	mov r0, #2
	tst r0, r1
	beq _0224C09A
	cmp r6, #0xae
	bne _0224C066
	lsl r1, r6, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl ov12_022526D0
	cmp r0, #1
	bne _0224C09A
_0224C066:
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_022525AC
	cmp r0, #0
	beq _0224C07E
	ldr r0, _0224C1F0 ; =0x0000213C
	ldr r1, [r5, r0]
	mov r0, #2
	lsl r0, r0, #8
	tst r0, r1
	beq _0224C09A
_0224C07E:
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r7, #0
	bl ov12_02250CA0
	ldr r1, _0224C1F8 ; =0x0000216C
	mov r0, #2
	ldr r2, [r5, r1]
	lsl r0, r0, #0xe
	orr r0, r2
	str r0, [r5, r1]
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224C09A:
	ldr r0, _0224C1F0 ; =0x0000213C
	ldr r1, [r5, r0]
	mov r0, #1
	lsl r0, r0, #0xa
	tst r0, r1
	bne _0224C0EC
	mov r0, #0xc0
	mul r0, r4
	add r3, r5, r0
	mov r0, #0xb7
	lsl r0, r0, #6
	ldr r2, [r3, r0]
	mov r1, #0x18
	tst r1, r2
	beq _0224C0C4
	add r0, #0xc
	ldr r0, [r3, r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1e
	cmp r7, r0
	beq _0224C0DC
_0224C0C4:
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_022527CC
	cmp r0, #0x63
	beq _0224C0DC
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_022527CC
	cmp r0, #0x63
	bne _0224C0EC
_0224C0DC:
	ldr r1, _0224C1F8 ; =0x0000216C
	mov r0, #1
	ldr r2, [r5, r1]
	add sp, #8
	bic r2, r0
	str r2, [r5, r1]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224C0EC:
	mov r0, #0xd
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _0224C15A
	mov r0, #0x4c
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _0224C15A
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #3
	tst r0, r1
	beq _0224C136
	lsl r0, r6, #4
	add r1, r5, r0
	ldr r0, _0224C1FC ; =0x000003DE
	ldrh r0, [r1, r0]
	cmp r0, #0x98
	bne _0224C136
	ldr r1, _0224C1F8 ; =0x0000216C
	mov r0, #1
	ldr r2, [r5, r1]
	bic r2, r0
	str r2, [r5, r1]
_0224C136:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xc0
	tst r0, r1
	beq _0224C15A
	lsl r0, r6, #4
	add r2, r5, r0
	ldr r0, _0224C1FC ; =0x000003DE
	add r1, #0x44
	ldrh r0, [r2, r0]
	cmp r0, r1
	bne _0224C15A
	ldr r1, _0224C1F8 ; =0x0000216C
	mov r0, #1
	ldr r2, [r5, r1]
	bic r2, r0
	str r2, [r5, r1]
_0224C15A:
	ldr r1, _0224C1F8 ; =0x0000216C
	mov r2, #1
	ldr r0, [r5, r1]
	lsl r2, r2, #0xa
	tst r0, r2
	bne _0224C1EA
	ldr r0, _0224C200 ; =0x00003044
	sub r2, #0x1a
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r0, r5, r0
	ldrh r0, [r0, r2]
	cmp r0, #0x80
	beq _0224C1EA
	sub r1, #0x30
	ldr r0, [r5, r1]
	mov r1, #4
	tst r1, r0
	bne _0224C192
	mov r1, #0xc0
	mul r1, r4
	add r2, r5, r1
	mov r1, #0xb7
	lsl r1, r1, #6
	ldr r2, [r2, r1]
	mov r1, #0x40
	tst r1, r2
	bne _0224C1DE
_0224C192:
	mov r2, #2
	lsl r2, r2, #0x12
	add r1, r0, #0
	tst r1, r2
	bne _0224C1AE
	mov r1, #0xc0
	mul r1, r4
	add r3, r5, r1
	mov r1, #0xb7
	lsl r1, r1, #6
	ldr r3, [r3, r1]
	lsl r1, r2, #0xa
	tst r1, r3
	bne _0224C1DE
_0224C1AE:
	mov r1, #8
	tst r1, r0
	bne _0224C1C6
	mov r1, #0xc0
	mul r1, r4
	add r2, r5, r1
	mov r1, #0xb7
	lsl r1, r1, #6
	ldr r2, [r2, r1]
	mov r1, #0x80
	tst r1, r2
	bne _0224C1DE
_0224C1C6:
	mov r1, #0x10
	tst r0, r1
	bne _0224C1EA
	mov r0, #0xc0
	mul r0, r4
	add r2, r5, r0
	mov r0, #0xb7
	lsl r0, r0, #6
	ldr r2, [r2, r0]
	lsl r0, r1, #0xe
	tst r0, r2
	beq _0224C1EA
_0224C1DE:
	ldr r1, _0224C1F8 ; =0x0000216C
	mov r0, #1
	ldr r2, [r5, r1]
	lsl r0, r0, #0x10
	orr r0, r2
	str r0, [r5, r1]
_0224C1EA:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224C1F0: .word 0x0000213C
_0224C1F4: .word 0x000003E9
_0224C1F8: .word 0x0000216C
_0224C1FC: .word 0x000003DE
_0224C200: .word 0x00003044
	thumb_func_end ov12_0224C018

	thumb_func_start ov12_0224C204
ov12_0224C204: ; 0x0224C204
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	bl ov12_0223A7F0
	add r2, r0, #0
	ldr r0, [r4, #0x6c]
	cmp r0, #0xff
	bne _0224C218
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224C218:
	ldr r6, _0224C354 ; =0x0000216C
	ldr r1, _0224C358 ; =0x801FDA49
	ldr r3, [r4, r6]
	add r7, r3, #0
	and r7, r1
	bne _0224C2AA
	mov r1, #0x75
	lsl r1, r1, #2
	lsl r0, r0, #6
	add r5, r4, r1
	ldr r3, [r5, r0]
	mov ip, r0
	lsl r0, r3, #0x1b
	lsr r0, r0, #0x1f
	beq _0224C2AA
	ldr r0, _0224C35C ; =0x00003044
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _0224C360 ; =0x000003E9
	ldrb r0, [r1, r0]
	mov r1, #4
	tst r0, r1
	beq _0224C2AA
	mov r0, #0x10
	bic r3, r0
	mov r0, ip
	str r3, [r5, r0]
	ldr r2, [r4, #0x64]
	mov r0, #0
	lsl r2, r2, #1
	add r3, r4, r2
	ldr r2, _0224C35C ; =0x00003044
	add r2, #0x18
	strh r0, [r3, r2]
	ldr r2, [r4, #0x64]
	ldr r0, _0224C35C ; =0x00003044
	lsl r2, r2, #1
	sub r0, r0, #4
	add r3, r4, r2
	ldr r2, _0224C35C ; =0x00003044
	ldr r0, [r4, r0]
	add r2, #0x38
	strh r0, [r3, r2]
	ldr r0, _0224C35C ; =0x00003044
	sub r0, r0, #4
	ldr r2, [r4, r0]
	ldr r0, _0224C35C ; =0x00003044
	add r0, r0, #4
	str r2, [r4, r0]
	add r0, r6, #0
	sub r0, #0x30
	ldr r2, [r4, r0]
	lsl r0, r1, #0x12
	orr r0, r2
	sub r6, #0x30
	str r0, [r4, r6]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x8b
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x64]
	add r0, r4, #0
	bl ov12_02258180
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224C2AA:
	mov r1, #0
	cmp r2, #0
	ble _0224C350
	mov r0, #0x75
	lsl r0, r0, #2
	add r0, r4, r0
_0224C2B6:
	ldr r3, _0224C364 ; =0x000021EC
	add r5, r4, r1
	ldrb r5, [r5, r3]
	cmp r7, #0
	bne _0224C34A
	lsl r3, r5, #6
	str r3, [sp]
	ldr r3, [r0, r3]
	lsl r3, r3, #0x1a
	lsr r3, r3, #0x1f
	beq _0224C34A
	ldr r3, _0224C35C ; =0x00003044
	ldr r3, [r4, r3]
	lsl r3, r3, #4
	add r6, r4, r3
	ldr r3, _0224C360 ; =0x000003E9
	ldrb r6, [r6, r3]
	mov r3, #8
	tst r3, r6
	beq _0224C34A
	mov r1, #0x46
	lsl r1, r1, #2
	str r5, [r4, r1]
	ldr r1, [sp]
	mov r7, #1
	ldr r2, [r0, r1]
	mov r1, #0x20
	bic r2, r1
	ldr r1, [sp]
	lsl r7, r7, #0x14
	str r2, [r0, r1]
	ldr r2, _0224C368 ; =0x0000213C
	ldr r0, [r4, r2]
	tst r0, r7
	bne _0224C32A
	ldr r1, [r4, #0x64]
	mov r0, #0
	lsl r1, r1, #1
	add r3, r4, r1
	ldr r1, _0224C36C ; =0x0000305C
	strh r0, [r3, r1]
	add r0, r1, #0
	sub r0, #0x1c
	ldr r6, [r4, r0]
	ldr r0, [r4, #0x64]
	lsl r0, r0, #1
	add r3, r4, r0
	add r0, r1, #0
	add r0, #0x20
	strh r6, [r3, r0]
	add r0, r1, #0
	sub r0, #0x1c
	ldr r0, [r4, r0]
	sub r1, #0x14
	str r0, [r4, r1]
	ldr r0, [r4, r2]
	orr r0, r7
	str r0, [r4, r2]
_0224C32A:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x92
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add r1, r5, #0
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	ldr r2, [r4, #0x64]
	add r0, r4, #0
	bl ov12_02258180
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224C34A:
	add r1, r1, #1
	cmp r1, r2
	blt _0224C2B6
_0224C350:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224C354: .word 0x0000216C
_0224C358: .word 0x801FDA49
_0224C35C: .word 0x00003044
_0224C360: .word 0x000003E9
_0224C364: .word 0x000021EC
_0224C368: .word 0x0000213C
_0224C36C: .word 0x0000305C
	thumb_func_end ov12_0224C204

	thumb_func_start ov12_0224C370
ov12_0224C370: ; 0x0224C370
	push {r4, lr}
	add r4, r1, #0
	bl RunBattleScript
	cmp r0, #1
	bne _0224C388
	add r0, r4, #0
	mov r1, #0
	add r0, #0xb4
	str r1, [r0]
	ldr r0, [r4, #0xc]
	str r0, [r4, #8]
_0224C388:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0224C370

	thumb_func_start ov12_0224C38C
ov12_0224C38C: ; 0x0224C38C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r2, [r4, #0x48]
	add r5, r0, #0
	cmp r2, #6
	bhi _0224C482
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0224C3A4: ; jump table
	.short _0224C3B2 - _0224C3A4 - 2 ; case 0
	.short _0224C3BE - _0224C3A4 - 2 ; case 1
	.short _0224C3D6 - _0224C3A4 - 2 ; case 2
	.short _0224C422 - _0224C3A4 - 2 ; case 3
	.short _0224C43E - _0224C3A4 - 2 ; case 4
	.short _0224C450 - _0224C3A4 - 2 ; case 5
	.short _0224C46C - _0224C3A4 - 2 ; case 6
_0224C3B2:
	bl ov12_0224BCA4
	ldr r0, [r4, #0x48]
	add r0, r0, #1
	str r0, [r4, #0x48]
	pop {r3, r4, r5, pc}
_0224C3BE:
	ldr r2, _0224C4C8 ; =0x00002184
	ldr r3, [r4, r2]
	mov r2, #4
	tst r2, r3
	bne _0224C3D0
	bl ov12_0224B528
	cmp r0, #1
	beq _0224C4C4
_0224C3D0:
	ldr r0, [r4, #0x48]
	add r0, r0, #1
	str r0, [r4, #0x48]
_0224C3D6:
	ldr r0, _0224C4C8 ; =0x00002184
	ldr r1, [r4, r0]
	mov r0, #1
	tst r0, r1
	bne _0224C41C
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0
	bl ov12_0224AED0
	cmp r0, #0
	beq _0224C41C
	cmp r0, #1
	beq _0224C3FC
	cmp r0, #2
	beq _0224C402
	cmp r0, #3
	beq _0224C408
	b _0224C40C
_0224C3FC:
	mov r0, #0x27
	str r0, [r4, #0xc]
	b _0224C40C
_0224C402:
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	b _0224C40C
_0224C408:
	mov r0, #0x22
	str r0, [r4, #0xc]
_0224C40C:
	mov r0, #0x16
	str r0, [r4, #8]
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	pop {r3, r4, r5, pc}
_0224C41C:
	ldr r0, [r4, #0x48]
	add r0, r0, #1
	str r0, [r4, #0x48]
_0224C422:
	ldr r0, _0224C4C8 ; =0x00002184
	ldr r1, [r4, r0]
	mov r0, #8
	tst r0, r1
	bne _0224C438
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224B1FC
	cmp r0, #1
	beq _0224C4C4
_0224C438:
	ldr r0, [r4, #0x48]
	add r0, r0, #1
	str r0, [r4, #0x48]
_0224C43E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224B398
	cmp r0, #1
	beq _0224C4C4
	ldr r0, [r4, #0x48]
	add r0, r0, #1
	str r0, [r4, #0x48]
_0224C450:
	ldr r0, _0224C4C8 ; =0x00002184
	ldr r1, [r4, r0]
	mov r0, #0x80
	tst r0, r1
	bne _0224C466
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224C204
	cmp r0, #1
	beq _0224C4C4
_0224C466:
	ldr r0, [r4, #0x48]
	add r0, r0, #1
	str r0, [r4, #0x48]
_0224C46C:
	ldr r3, _0224C4CC ; =0x00003044
	ldr r2, [r4, #0x64]
	ldr r3, [r4, r3]
	add r0, r5, #0
	lsl r3, r3, #0x10
	add r1, r4, #0
	lsr r3, r3, #0x10
	bl ov12_02250A18
	mov r0, #0
	str r0, [r4, #0x48]
_0224C482:
	ldr r1, _0224C4D0 ; =0x0000216C
	ldr r0, _0224C4D4 ; =0x801FDA49
	ldr r2, [r4, r1]
	tst r0, r2
	beq _0224C492
	mov r0, #0x1a
	str r0, [r4, #8]
	b _0224C4BC
_0224C492:
	add r0, r1, #0
	sub r0, #0x2c
	ldr r2, [r4, r0]
	mov r0, #0x40
	orr r0, r2
	sub r1, #0x2c
	str r0, [r4, r1]
	ldr r2, _0224C4CC ; =0x00003044
	add r0, r4, #0
	ldr r2, [r4, r2]
	mov r1, #0
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x18
	str r0, [r4, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02252E30
_0224C4BC:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_022565E0
_0224C4C4:
	pop {r3, r4, r5, pc}
	nop
_0224C4C8: .word 0x00002184
_0224C4CC: .word 0x00003044
_0224C4D0: .word 0x0000216C
_0224C4D4: .word 0x801FDA49
	thumb_func_end ov12_0224C38C

	thumb_func_start ov12_0224C4D8
ov12_0224C4D8: ; 0x0224C4D8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r2, [r4, #0x4c]
	add r5, r0, #0
	cmp r2, #6
	bhi _0224C5B8
	add r3, r2, r2
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_0224C4F0: ; jump table
	.short _0224C4FE - _0224C4F0 - 2 ; case 0
	.short _0224C50A - _0224C4F0 - 2 ; case 1
	.short _0224C51C - _0224C4F0 - 2 ; case 2
	.short _0224C546 - _0224C4F0 - 2 ; case 3
	.short _0224C570 - _0224C4F0 - 2 ; case 4
	.short _0224C592 - _0224C4F0 - 2 ; case 5
	.short _0224C5B4 - _0224C4F0 - 2 ; case 6
_0224C4FE:
	add r2, r2, #1
	str r2, [r4, #0x4c]
	bl ov12_0224B398
	cmp r0, #1
	beq _0224C5BC
_0224C50A:
	ldr r0, [r4, #0x4c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x4c]
	add r0, r5, #0
	bl ov12_02250BBC
	cmp r0, #1
	beq _0224C5BC
_0224C51C:
	ldr r0, _0224C5C0 ; =0x00002184
	ldr r1, [r4, r0]
	mov r0, #0x20
	tst r0, r1
	bne _0224C540
	ldr r3, [r4, #0x6c]
	cmp r3, #0xff
	beq _0224C540
	ldr r0, _0224C5C4 ; =0x00003044
	add r1, r4, #0
	ldr r0, [r4, r0]
	str r0, [sp]
	ldr r2, [r4, #0x64]
	add r0, r5, #0
	bl ov12_0224BCC4
	cmp r0, #1
	beq _0224C5BC
_0224C540:
	ldr r0, [r4, #0x4c]
	add r0, r0, #1
	str r0, [r4, #0x4c]
_0224C546:
	ldr r0, _0224C5C0 ; =0x00002184
	ldr r1, [r4, r0]
	mov r0, #0x40
	tst r0, r1
	bne _0224C56A
	ldr r3, [r4, #0x6c]
	cmp r3, #0xff
	beq _0224C56A
	ldr r0, _0224C5C4 ; =0x00003044
	add r1, r4, #0
	ldr r0, [r4, r0]
	str r0, [sp]
	ldr r2, [r4, #0x64]
	add r0, r5, #0
	bl ov12_0224C018
	cmp r0, #1
	beq _0224C5BC
_0224C56A:
	ldr r0, [r4, #0x4c]
	add r0, r0, #1
	str r0, [r4, #0x4c]
_0224C570:
	ldr r0, _0224C5C0 ; =0x00002184
	ldr r1, [r4, r0]
	mov r0, #2
	tst r0, r1
	bne _0224C58C
	ldr r0, [r4, #0x6c]
	cmp r0, #0xff
	beq _0224C58C
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224B498
	cmp r0, #1
	beq _0224C5BC
_0224C58C:
	ldr r0, [r4, #0x4c]
	add r0, r0, #1
	str r0, [r4, #0x4c]
_0224C592:
	ldr r0, _0224C5C0 ; =0x00002184
	ldr r1, [r4, r0]
	mov r0, #0x10
	tst r0, r1
	bne _0224C5AE
	ldr r0, [r4, #0x6c]
	cmp r0, #0xff
	beq _0224C5AE
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224BC2C
	cmp r0, #1
	beq _0224C5BC
_0224C5AE:
	ldr r0, [r4, #0x4c]
	add r0, r0, #1
	str r0, [r4, #0x4c]
_0224C5B4:
	mov r0, #0
	str r0, [r4, #0x4c]
_0224C5B8:
	mov r0, #0x19
	str r0, [r4, #8]
_0224C5BC:
	pop {r3, r4, r5, pc}
	nop
_0224C5C0: .word 0x00002184
_0224C5C4: .word 0x00003044
	thumb_func_end ov12_0224C4D8

	thumb_func_start ov12_0224C5C8
ov12_0224C5C8: ; 0x0224C5C8
	push {r3, r4, lr}
	sub sp, #4
	add r2, sp, #0
	add r4, r1, #0
	bl ov12_022503EC
	cmp r0, #1
	bne _0224C5EE
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x1a
	add sp, #4
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_0224C5EE:
	mov r0, #0x1a
	str r0, [r4, #8]
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0224C5C8

	thumb_func_start ov12_0224C5F8
ov12_0224C5F8: ; 0x0224C5F8
	push {r4, lr}
	ldr r0, _0224C670 ; =0x0000216C
	add r4, r1, #0
	ldr r1, [r4, r0]
	mov r2, #2
	lsl r2, r2, #0x1e
	add r3, r1, #0
	tst r3, r2
	beq _0224C610
	mov r0, #0x23
	str r0, [r4, #8]
	pop {r4, pc}
_0224C610:
	lsr r2, r2, #0x16
	tst r2, r1
	beq _0224C62A
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x2a
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x27
	str r0, [r4, #0xc]
	pop {r4, pc}
_0224C62A:
	add r2, r0, #0
	add r2, #0x14
	ldr r2, [r4, r2]
	cmp r2, #0
	beq _0224C650
	mov r3, #1
	add r2, r1, #0
	tst r2, r3
	beq _0224C650
	mov r2, #1
	bic r1, r2
	str r1, [r4, r0]
	ldr r2, [r4, r0]
	lsl r1, r3, #0xe
	orr r1, r2
	str r1, [r4, r0]
	mov r0, #0x1d
	str r0, [r4, #8]
	pop {r4, pc}
_0224C650:
	ldr r0, _0224C674 ; =0x001FD849
	tst r0, r1
	beq _0224C66A
	add r0, r4, #0
	mov r1, #1
	mov r2, #7
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x22
	str r0, [r4, #0xc]
	pop {r4, pc}
_0224C66A:
	mov r0, #0x1b
	str r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
_0224C670: .word 0x0000216C
_0224C674: .word 0x001FD849
	thumb_func_end ov12_0224C5F8

	thumb_func_start ov12_0224C678
ov12_0224C678: ; 0x0224C678
	push {r4, lr}
	add r4, r1, #0
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x1c
	str r0, [r4, #0xc]
	pop {r4, pc}
	thumb_func_end ov12_0224C678

	thumb_func_start ov12_0224C690
ov12_0224C690: ; 0x0224C690
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r2, _0224C9BC ; =0x0000216C
	add r4, r1, #0
	ldr r1, [r4, r2]
	add r7, r0, #0
	mov r0, #0x20
	tst r0, r1
	beq _0224C6B8
	ldr r0, [r4, #0x6c]
	mov r1, #0xc0
	add r3, r0, #0
	mul r3, r1
	ldr r0, _0224C9C0 ; =0x00002D90
	add r3, r4, r3
	ldr r0, [r3, r0]
	sub r1, #0xc1
	mul r1, r0
	sub r2, #0x28
	str r1, [r4, r2]
_0224C6B8:
	ldr r0, _0224C9C4 ; =0x00002144
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0224C6C2
	b _0224CA90
_0224C6C2:
	ldr r1, [r4, #0x6c]
	add r0, r4, #0
	bl ov12_02255830
	str r0, [sp, #4]
	ldr r1, [r4, #0x6c]
	add r0, r4, #0
	mov r2, #0
	bl ov12_02255844
	str r0, [sp]
	ldr r0, _0224C9C4 ; =0x00002144
	ldr r0, [r4, r0]
	cmp r0, #0
	blt _0224C6E4
	bl GF_AssertFail
_0224C6E4:
	ldr r1, [r4, #0x64]
	add r0, r7, #0
	bl ov12_0223AB1C
	add r5, r0, #0
	ldr r1, [r4, #0x6c]
	add r0, r7, #0
	bl ov12_0223AB1C
	cmp r5, r0
	bne _0224C706
	ldr r1, [r4, #0x64]
	add r0, r7, #0
	mov r2, #0
	mov r3, #0x62
	bl ov12_02263F0C
_0224C706:
	ldr r0, [r4, #0x6c]
	ldr r2, [r4, #0x64]
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _0224C9C8 ; =0x000030F4
	str r2, [r1, r0]
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	add r6, r1, #0
	mul r6, r0
	mov r2, #1
	ldr r1, _0224C9CC ; =0x00002DB0
	add r5, r4, r6
	ldr r3, [r5, r1]
	lsl r2, r2, #0x18
	tst r2, r3
	beq _0224C7E0
	ldr r2, _0224C9C4 ; =0x00002144
	ldr r2, [r4, r2]
	cmp r2, #0
	bge _0224C7E0
	add r3, r1, #0
	add r3, #0x30
	ldr r3, [r5, r3]
	add r5, r2, r3
	cmp r5, #0
	bgt _0224C782
	mov r2, #0xbb
	lsl r2, r2, #2
	add r6, r4, r2
	ldr r2, [r4, #0x64]
	mov r5, #0x1c
	mul r5, r2
	ldr r2, [r6, r5]
	sub r2, r2, r3
	str r2, [r6, r5]
	ldr r5, [r4, #0x6c]
	add r3, r4, r1
	add r2, r5, #0
	mul r2, r0
	ldr r6, [r3, r2]
	ldr r5, _0224C9D0 ; =0xFEFFFFFF
	and r5, r6
	str r5, [r3, r2]
	ldr r2, [r4, #0x6c]
	add r3, r2, #0
	add r2, r1, #0
	mul r3, r0
	add r3, r4, r3
	add r2, #0x30
	ldr r2, [r3, r2]
	add r1, #0x30
	neg r3, r2
	ldr r2, _0224C9C4 ; =0x00002144
	add r2, r2, #4
	str r3, [r4, r2]
	ldr r2, [r4, #0x6c]
	mov r3, #0
	mul r0, r2
	add r0, r4, r0
	str r3, [r0, r1]
	b _0224C7AE
_0224C782:
	mov r3, #0xbb
	lsl r3, r3, #2
	add r6, r4, r3
	ldr r3, [r4, #0x64]
	mov r5, #0x1c
	mul r5, r3
	ldr r3, [r6, r5]
	add r1, #0x30
	add r2, r3, r2
	str r2, [r6, r5]
	ldr r2, [r4, #0x6c]
	add r1, r4, r1
	mul r0, r2
	ldr r2, _0224C9C4 ; =0x00002144
	ldr r3, [r1, r0]
	ldr r2, [r4, r2]
	add r2, r3, r2
	str r2, [r1, r0]
	ldr r0, _0224C9C4 ; =0x00002144
	ldr r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
_0224C7AE:
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r2, [r4, #0x6c]
	add r1, r4, r0
	add r0, r2, #0
	mov r3, #0x1c
	mul r0, r3
	ldr r5, [r1, r0]
	mov r2, #8
	orr r2, r5
	str r2, [r1, r0]
	ldr r0, [r4, #0x6c]
	add r3, #0xfc
	str r0, [r4, r3]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x5a
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x1d
	add sp, #8
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_0224C7E0:
	ldr r0, _0224C9D4 ; =0x00003044
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _0224C9D8 ; =0x000003DE
	ldrh r0, [r1, r0]
	cmp r0, #0x65
	bne _0224C806
	ldr r0, _0224C9DC ; =0x00002D8C
	add r1, r4, r6
	ldr r2, [r1, r0]
	ldr r0, _0224C9C4 ; =0x00002144
	ldr r1, [r4, r0]
	add r1, r1, r2
	cmp r1, #0
	bgt _0224C806
	sub r1, r2, #1
	neg r1, r1
	str r1, [r4, r0]
_0224C806:
	ldr r0, [r4, #0x6c]
	lsl r0, r0, #6
	add r1, r4, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1f
	bne _0224C874
	ldr r0, [sp, #4]
	cmp r0, #0x41
	bne _0224C846
	add r0, r7, #0
	bl ov12_0223BD98
	mov r1, #0x64
	bl _s32_div_f
	ldr r0, [sp]
	cmp r1, r0
	bge _0224C846
	ldr r2, [r4, #0x6c]
	mov r0, #0xb5
	lsl r0, r0, #2
	mov r1, #0x1c
	add r3, r2, #0
	mul r3, r1
	add r0, r4, r0
	ldr r2, [r0, r3]
	mov r1, #0x20
	orr r1, r2
	str r1, [r0, r3]
_0224C846:
	ldr r0, [sp, #4]
	cmp r0, #0x67
	bne _0224C874
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r3, r4, r0
	ldr r0, _0224C9DC ; =0x00002D8C
	ldr r2, [r3, r0]
	add r0, r0, #4
	ldr r0, [r3, r0]
	cmp r2, r0
	bne _0224C874
	mov r0, #0xb5
	lsl r0, r0, #2
	add r3, r1, #0
	mov r2, #0x1c
	add r0, r4, r0
	mul r3, r2
	ldr r2, [r0, r3]
	mov r1, #0x20
	orr r1, r2
	str r1, [r0, r3]
_0224C874:
	ldr r0, [r4, #0x6c]
	lsl r1, r0, #6
	add r2, r4, r1
	mov r1, #0x75
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	lsl r1, r1, #0x16
	lsr r1, r1, #0x1f
	bne _0224C898
	mov r1, #0x1c
	mul r1, r0
	add r2, r4, r1
	mov r1, #0xb5
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1f
	beq _0224C8E2
_0224C898:
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _0224C9DC ; =0x00002D8C
	add r1, r4, r1
	ldr r2, _0224C9C4 ; =0x00002144
	ldr r1, [r1, r0]
	ldr r0, [r4, r2]
	add r0, r0, r1
	cmp r0, #0
	bgt _0224C8E2
	sub r0, r1, #1
	neg r0, r0
	str r0, [r4, r2]
	ldr r0, [r4, #0x6c]
	mov r1, #0x75
	lsl r0, r0, #6
	add r0, r4, r0
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1f
	beq _0224C8D4
	add r0, r2, #0
	add r0, #0x28
	ldr r1, [r4, r0]
	mov r0, #0x80
	orr r0, r1
	add r2, #0x28
	str r0, [r4, r2]
	b _0224C8E2
_0224C8D4:
	add r0, r2, #0
	add r0, #0x28
	ldr r0, [r4, r0]
	sub r1, #0xd4
	orr r0, r1
	add r2, #0x28
	str r0, [r4, r2]
_0224C8E2:
	ldr r1, [r4, #0x6c]
	ldr r0, _0224C9E0 ; =0x000030E4
	lsl r3, r1, #2
	ldr r1, _0224C9C4 ; =0x00002144
	add r0, r4, r0
	ldr r2, [r0, r3]
	ldr r1, [r4, r1]
	add r1, r2, r1
	str r1, [r0, r3]
	ldr r0, _0224C9E4 ; =0x00002DBC
	ldr r1, [r4, #0x6c]
	add r3, r4, r0
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	ldrb r0, [r3, r2]
	cmp r0, #0xff
	bhs _0224C90A
	add r0, r0, #1
	strb r0, [r3, r2]
_0224C90A:
	ldr r0, _0224C9D4 ; =0x00003044
	mov r1, #0x3e
	ldr r0, [r4, r0]
	lsl r1, r1, #4
	lsl r0, r0, #4
	add r0, r4, r0
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _0224C978
	ldr r1, [r4, #0x6c]
	ldr r0, _0224C9C4 ; =0x00002144
	lsl r1, r1, #6
	add r2, r4, r1
	ldr r1, [r4, #0x64]
	ldr r0, [r4, r0]
	lsl r1, r1, #2
	add r2, r2, r1
	mov r1, #0x76
	lsl r1, r1, #2
	str r0, [r2, r1]
	ldr r0, [r4, #0x6c]
	ldr r2, [r4, #0x64]
	lsl r0, r0, #6
	add r0, r4, r0
	add r1, #0x10
	str r2, [r0, r1]
	ldr r0, [r4, #0x64]
	bl MaskOfFlagNo
	mov r1, #0x7b
	ldr r3, [r4, #0x6c]
	lsl r1, r1, #2
	add r2, r4, r1
	lsl r5, r3, #6
	ldr r3, [r2, r5]
	orr r0, r3
	str r0, [r2, r5]
	ldr r2, [r4, #0x6c]
	ldr r0, _0224C9C4 ; =0x00002144
	add r5, r2, #0
	add r2, r1, #0
	mov r3, #0x1c
	mul r5, r3
	ldr r0, [r4, r0]
	add r5, r4, r5
	add r2, #0xec
	str r0, [r5, r2]
	ldr r0, [r4, #0x6c]
	ldr r5, [r4, #0x64]
	add r2, r0, #0
	mul r2, r3
	add r0, r4, r2
	add r1, #0xf0
	str r5, [r0, r1]
	b _0224CA06
_0224C978:
	cmp r0, #1
	bne _0224CA06
	ldr r2, [r4, #0x6c]
	ldr r0, _0224C9C4 ; =0x00002144
	lsl r2, r2, #6
	add r3, r4, r2
	ldr r2, [r4, #0x64]
	ldr r0, [r4, r0]
	lsl r2, r2, #2
	add r2, r3, r2
	lsr r1, r1, #1
	str r0, [r2, r1]
	ldr r0, [r4, #0x6c]
	ldr r2, [r4, #0x64]
	lsl r0, r0, #6
	add r1, r4, r0
	mov r0, #2
	lsl r0, r0, #8
	str r2, [r1, r0]
	ldr r0, [r4, #0x64]
	bl MaskOfFlagNo
	mov r1, #0x81
	ldr r3, [r4, #0x6c]
	lsl r1, r1, #2
	add r2, r4, r1
	lsl r5, r3, #6
	ldr r3, [r2, r5]
	orr r0, r3
	str r0, [r2, r5]
	ldr r2, [r4, #0x6c]
	ldr r0, _0224C9C4 ; =0x00002144
	b _0224C9E8
	nop
_0224C9BC: .word 0x0000216C
_0224C9C0: .word 0x00002D90
_0224C9C4: .word 0x00002144
_0224C9C8: .word 0x000030F4
_0224C9CC: .word 0x00002DB0
_0224C9D0: .word 0xFEFFFFFF
_0224C9D4: .word 0x00003044
_0224C9D8: .word 0x000003DE
_0224C9DC: .word 0x00002D8C
_0224C9E0: .word 0x000030E4
_0224C9E4: .word 0x00002DBC
_0224C9E8:
	add r5, r2, #0
	add r2, r1, #0
	mov r3, #0x1c
	mul r5, r3
	ldr r0, [r4, r0]
	add r5, r4, r5
	add r2, #0xdc
	str r0, [r5, r2]
	ldr r0, [r4, #0x6c]
	ldr r5, [r4, #0x64]
	add r2, r0, #0
	mul r2, r3
	add r0, r4, r2
	add r1, #0xe0
	str r5, [r0, r1]
_0224CA06:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0224CA98 ; =0x00002D8C
	ldr r2, [r1, r0]
	ldr r0, _0224CA9C ; =0x00002144
	ldr r1, [r4, r0]
	add r0, r1, r2
	cmp r0, #0
	bgt _0224CA32
	mov r0, #0xbb
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r3, [r4, #0x64]
	mov r0, #0x1c
	mul r0, r3
	ldr r3, [r1, r0]
	neg r2, r2
	add r2, r3, r2
	str r2, [r1, r0]
	b _0224CA46
_0224CA32:
	ldr r3, [r4, #0x64]
	mov r0, #0xbb
	lsl r0, r0, #2
	mov r2, #0x1c
	add r5, r3, #0
	add r0, r4, r0
	mul r5, r2
	ldr r2, [r0, r5]
	add r1, r2, r1
	str r1, [r0, r5]
_0224CA46:
	ldr r3, _0224CA9C ; =0x00002144
	ldr r0, [r4, #0x6c]
	mov r2, #0x82
	lsl r0, r0, #6
	ldr r1, [r4, r3]
	add r0, r4, r0
	lsl r2, r2, #2
	str r1, [r0, r2]
	ldr r1, [r4, #0x6c]
	ldr r0, [r4, #0x64]
	lsl r1, r1, #6
	add r5, r4, r1
	add r1, r2, #4
	str r0, [r5, r1]
	ldr r0, [r4, #0x6c]
	sub r2, #0xf0
	str r0, [r4, r2]
	ldr r0, [r4, r3]
	add r3, #0x18
	str r0, [r4, r3]
	add r0, r4, #0
	mov r1, #1
	mov r2, #2
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x1d
	str r0, [r4, #0xc]
	ldr r1, _0224CAA0 ; =0x0000213C
	mov r0, #2
	ldr r2, [r4, r1]
	lsl r0, r0, #0xc
	orr r0, r2
	add sp, #8
	str r0, [r4, r1]
	pop {r3, r4, r5, r6, r7, pc}
_0224CA90:
	mov r0, #0x1d
	str r0, [r4, #8]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224CA98: .word 0x00002D8C
_0224CA9C: .word 0x00002144
_0224CAA0: .word 0x0000213C
	thumb_func_end ov12_0224C690

	thumb_func_start ov12_0224CAA4
ov12_0224CAA4: ; 0x0224CAA4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	ldr r2, [r4, #0x38]
	add r5, r0, #0
	cmp r2, #0
	beq _0224CAB8
	cmp r2, #1
	beq _0224CB96
	b _0224CC6C
_0224CAB8:
	ldr r2, [r4, #0x3c]
	cmp r2, #6
	bls _0224CAC0
	b _0224CC6C
_0224CAC0:
	add r3, r2, r2
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_0224CACC: ; jump table
	.short _0224CADA - _0224CACC - 2 ; case 0
	.short _0224CAE6 - _0224CACC - 2 ; case 1
	.short _0224CAF8 - _0224CACC - 2 ; case 2
	.short _0224CB2C - _0224CACC - 2 ; case 3
	.short _0224CB48 - _0224CACC - 2 ; case 4
	.short _0224CB56 - _0224CACC - 2 ; case 5
	.short _0224CB80 - _0224CACC - 2 ; case 6
_0224CADA:
	add r2, r2, #1
	str r2, [r4, #0x3c]
	bl ov12_0224DF7C
	cmp r0, #1
	beq _0224CB54
_0224CAE6:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	bl ov12_0224DF98
	cmp r0, #1
	beq _0224CB54
_0224CAF8:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	add r2, sp, #0xc
	bl ov12_02250490
	cmp r0, #1
	bne _0224CB2C
	ldr r0, _0224CC78 ; =0x0000216C
	ldr r1, [r4, r0]
	ldr r0, _0224CC7C ; =0x001FD849
	tst r0, r1
	bne _0224CB2C
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224CB2C:
	ldr r0, [r4, #0x3c]
	ldr r2, _0224CC80 ; =0x00000125
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224CB48:
	add r2, r2, #1
	str r2, [r4, #0x3c]
	bl ov12_0224DFEC
	cmp r0, #1
	bne _0224CB56
_0224CB54:
	b _0224CC74
_0224CB56:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	add r2, sp, #8
	bl ov12_02253E04
	cmp r0, #1
	bne _0224CB80
	ldr r2, [sp, #8]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224CB80:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	bl ov12_0224E078
	cmp r0, #1
	bne _0224CC6C
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0224CB96:
	ldr r2, [r4, #0x3c]
	cmp r2, #6
	bhi _0224CC6C
	add r3, r2, r2
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_0224CBA8: ; jump table
	.short _0224CBB6 - _0224CBA8 - 2 ; case 0
	.short _0224CBC2 - _0224CBA8 - 2 ; case 1
	.short _0224CBF6 - _0224CBA8 - 2 ; case 2
	.short _0224CC12 - _0224CBA8 - 2 ; case 3
	.short _0224CC1E - _0224CBA8 - 2 ; case 4
	.short _0224CC48 - _0224CBA8 - 2 ; case 5
	.short _0224CC5A - _0224CBA8 - 2 ; case 6
_0224CBB6:
	add r2, r2, #1
	str r2, [r4, #0x3c]
	bl ov12_0224DF7C
	cmp r0, #1
	beq _0224CC74
_0224CBC2:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	add r2, sp, #4
	bl ov12_02250490
	cmp r0, #1
	bne _0224CBF6
	ldr r0, _0224CC78 ; =0x0000216C
	ldr r1, [r4, r0]
	ldr r0, _0224CC7C ; =0x001FD849
	tst r0, r1
	bne _0224CBF6
	ldr r2, [sp, #4]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224CBF6:
	ldr r0, [r4, #0x3c]
	ldr r2, _0224CC80 ; =0x00000125
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224CC12:
	add r2, r2, #1
	str r2, [r4, #0x3c]
	bl ov12_0224DFEC
	cmp r0, #1
	beq _0224CC74
_0224CC1E:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	add r2, sp, #0
	bl ov12_02253E04
	cmp r0, #1
	bne _0224CC48
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224CC48:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	bl ov12_0224DF98
	cmp r0, #1
	beq _0224CC74
_0224CC5A:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	bl ov12_0224E078
	cmp r0, #1
	beq _0224CC74
_0224CC6C:
	mov r0, #0
	str r0, [r4, #0x3c]
	mov r0, #0x1f
	str r0, [r4, #8]
_0224CC74:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224CC78: .word 0x0000216C
_0224CC7C: .word 0x001FD849
_0224CC80: .word 0x00000125
	thumb_func_end ov12_0224CAA4

	thumb_func_start ov12_0224CC84
ov12_0224CC84: ; 0x0224CC84
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0224CC84

	thumb_func_start ov12_0224CC88
ov12_0224CC88: ; 0x0224CC88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	ldr r1, [r4, #0x40]
	add r6, r0, #0
	cmp r1, #7
	bls _0224CC98
	b _0224CED2
_0224CC98:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224CCA4: ; jump table
	.short _0224CCB4 - _0224CCA4 - 2 ; case 0
	.short _0224CD2E - _0224CCA4 - 2 ; case 1
	.short _0224CD42 - _0224CCA4 - 2 ; case 2
	.short _0224CD68 - _0224CCA4 - 2 ; case 3
	.short _0224CD7C - _0224CCA4 - 2 ; case 4
	.short _0224CD96 - _0224CCA4 - 2 ; case 5
	.short _0224CDC0 - _0224CCA4 - 2 ; case 6
	.short _0224CE54 - _0224CCA4 - 2 ; case 7
_0224CCB4:
	mov r1, #0
	ldr r7, [r4, #0x44]
	str r1, [sp, #4]
	bl ov12_0223A7F0
	cmp r7, r0
	bge _0224CD24
	add r5, r4, #0
	add r5, #0x44
_0224CCC6:
	mov r0, #0xc0
	mul r0, r7
	mov r1, #0xb7
	add r0, r4, r0
	lsl r1, r1, #6
	ldr r2, [r0, r1]
	ldr r1, _0224CEE0 ; =0x200400C0
	tst r1, r2
	bne _0224CD0C
	ldr r1, _0224CEE4 ; =0x00002DC4
	ldr r2, [r0, r1]
	ldr r1, _0224CEE0 ; =0x200400C0
	tst r1, r2
	beq _0224CD0C
	ldr r1, _0224CEE4 ; =0x00002DC4
	ldr r2, [r0, r1]
	ldr r1, _0224CEE8 ; =0xDFFBFF3F
	and r2, r1
	ldr r1, _0224CEE4 ; =0x00002DC4
	str r2, [r0, r1]
	ldr r2, _0224CEEC ; =0x0000011F
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	mov r0, #0x46
	ldr r1, [r4, #0x44]
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #4]
_0224CD0C:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0224CD94
	ldr r7, [r4, #0x44]
	add r0, r6, #0
	bl ov12_0223A7F0
	cmp r7, r0
	blt _0224CCC6
_0224CD24:
	ldr r0, [r4, #0x40]
	add r0, r0, #1
	str r0, [r4, #0x40]
	mov r0, #0
	str r0, [r4, #0x44]
_0224CD2E:
	ldr r0, [r4, #0x40]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x40]
	ldr r2, [r4, #8]
	add r0, r6, #0
	bl ov12_02254580
	cmp r0, #1
	beq _0224CD94
_0224CD42:
	add r0, r6, #0
	add r1, r4, #0
	bl ov12_02253194
	add r2, r0, #0
	beq _0224CD62
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0224CD62:
	ldr r0, [r4, #0x40]
	add r0, r0, #1
	str r0, [r4, #0x40]
_0224CD68:
	ldr r0, [r4, #0x40]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x40]
	ldr r2, [r4, #0x64]
	add r0, r6, #0
	bl ov12_0225471C
	cmp r0, #1
	beq _0224CD94
_0224CD7C:
	ldr r0, [r4, #0x40]
	add r0, r0, #1
	str r0, [r4, #0x40]
	ldr r2, [r4, #0x6c]
	cmp r2, #0xff
	beq _0224CD96
	add r0, r6, #0
	add r1, r4, #0
	bl ov12_0225471C
	cmp r0, #1
	bne _0224CD96
_0224CD94:
	b _0224CEDC
_0224CD96:
	ldr r0, [r4, #0x40]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x40]
	add r0, r6, #0
	add r2, sp, #0xc
	bl ov12_02255634
	cmp r0, #1
	bne _0224CDC0
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0224CDC0:
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x60
	bne _0224CDD0
	mov r2, #0
	b _0224CDE4
_0224CDD0:
	ldr r0, _0224CEF0 ; =0x00002160
	ldr r2, [r4, r0]
	cmp r2, #0
	bne _0224CDE4
	ldr r0, _0224CEF4 ; =0x00003044
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _0224CEF8 ; =0x000003E2
	ldrb r2, [r1, r0]
_0224CDE4:
	ldr r0, [r4, #0x40]
	add r0, r0, #1
	str r0, [r4, #0x40]
	ldr r3, [r4, #0x6c]
	cmp r3, #0xff
	beq _0224CE54
	mov r0, #0xc0
	add r5, r3, #0
	mul r5, r0
	ldr r0, _0224CEFC ; =0x00002DAC
	add r1, r4, r5
	ldr r1, [r1, r0]
	mov r0, #0x20
	tst r1, r0
	beq _0224CE54
	ldr r1, _0224CF00 ; =0x0000216C
	lsl r0, r0, #9
	ldr r1, [r4, r1]
	tst r0, r1
	bne _0224CE54
	ldr r0, [r4, #0x64]
	cmp r3, r0
	beq _0224CE54
	mov r0, #0x1c
	mul r0, r3
	add r7, r4, r0
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r1, [r7, r0]
	cmp r1, #0
	bne _0224CE2A
	add r0, #8
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _0224CE54
_0224CE2A:
	ldr r0, _0224CF04 ; =0x00002D8C
	add r1, r4, r5
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0224CE54
	cmp r2, #0xa
	bne _0224CE54
	mov r0, #0x46
	lsl r0, r0, #2
	str r3, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1d
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0224CE54:
	mov r0, #0
	str r0, [sp]
	ldr r7, [r4, #0x44]
	add r0, r6, #0
	bl ov12_0223A7F0
	cmp r7, r0
	bge _0224CEC2
	add r5, r4, #0
	add r5, #0x44
_0224CE68:
	ldr r0, _0224CF08 ; =0x000021EC
	add r1, r4, r7
	ldrb r7, [r1, r0]
	add r0, r7, #0
	bl MaskOfFlagNo
	ldr r1, _0224CF0C ; =0x00003108
	ldrb r1, [r4, r1]
	tst r0, r1
	ldr r0, [r5]
	beq _0224CE84
	add r0, r0, #1
	str r0, [r5]
	b _0224CEB6
_0224CE84:
	add r0, r0, #1
	str r0, [r5]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	add r3, sp, #8
	bl ov12_02254E7C
	cmp r0, #1
	bne _0224CEB6
	mov r0, #0x46
	lsl r0, r0, #2
	str r7, [r4, r0]
	ldr r2, [sp, #8]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp]
	b _0224CEC2
_0224CEB6:
	ldr r7, [r4, #0x44]
	add r0, r6, #0
	bl ov12_0223A7F0
	cmp r7, r0
	blt _0224CE68
_0224CEC2:
	ldr r0, [sp]
	cmp r0, #0
	bne _0224CED2
	ldr r0, [r4, #0x40]
	add r0, r0, #1
	str r0, [r4, #0x40]
	mov r0, #0
	str r0, [r4, #0x44]
_0224CED2:
	mov r0, #0
	str r0, [r4, #0x40]
	str r0, [r4, #0x44]
	mov r0, #0x20
	str r0, [r4, #8]
_0224CEDC:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224CEE0: .word 0x200400C0
_0224CEE4: .word 0x00002DC4
_0224CEE8: .word 0xDFFBFF3F
_0224CEEC: .word 0x0000011F
_0224CEF0: .word 0x00002160
_0224CEF4: .word 0x00003044
_0224CEF8: .word 0x000003E2
_0224CEFC: .word 0x00002DAC
_0224CF00: .word 0x0000216C
_0224CF04: .word 0x00002D8C
_0224CF08: .word 0x000021EC
_0224CF0C: .word 0x00003108
	thumb_func_end ov12_0224CC88

	thumb_func_start ov12_0224CF10
ov12_0224CF10: ; 0x0224CF10
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0224CF10

	thumb_func_start ov12_0224CF14
ov12_0224CF14: ; 0x0224CF14
	push {r3, r4, r5, r6, r7, lr}
	ldr r6, _0224D000 ; =0x0000217D
	add r4, r1, #0
	ldrb r2, [r4, r6]
	str r0, [sp]
	cmp r2, #0
	beq _0224CFFA
	ldr r3, [r4, #0x74]
	mov ip, r3
	cmp r3, #0xff
	bne _0224CFAC
	ldr r3, [r4, #0x64]
	mov r7, #0xc0
	add r5, r3, #0
	mul r5, r7
	ldr r3, _0224D004 ; =0x00002DAC
	add r5, r4, r5
	ldr r5, [r5, r3]
	mov r3, #7
	tst r3, r5
	bne _0224CFAC
	add r3, r6, #0
	sub r3, #0x11
	ldr r5, [r4, r3]
	mov r3, #1
	lsl r3, r3, #0xe
	tst r3, r5
	bne _0224CFAC
	sub r2, r6, #1
	ldrb r2, [r4, r2]
	sub r3, r2, #1
	sub r2, r6, #1
	strb r3, [r4, r2]
	ldrb r2, [r4, r2]
	cmp r2, #0
	beq _0224CF92
	mov r3, #1
	add r2, r6, #3
	str r3, [r4, r2]
	bl ov12_02252D14
	add r1, r6, #0
	sub r1, #0x41
	ldr r2, [r4, r1]
	ldr r0, _0224D008 ; =0xFFFFBFFF
	and r0, r2
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x4c
	ldr r0, [r4, r0]
	add r1, #0x48
	str r0, [r4, r1]
	ldr r2, _0224D00C ; =0x00003044
	add r0, r4, #0
	ldr r2, [r4, r2]
	mov r1, #0
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x18
	str r0, [r4, #0xc]
	b _0224CFF2
_0224CF92:
	ldrb r0, [r4, r6]
	add r7, #0x70
	mov r1, #1
	str r0, [r4, r7]
	add r0, r4, #0
	mov r2, #0x11
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x22
	str r0, [r4, #0xc]
	b _0224CFF2
_0224CFAC:
	mov r0, ip
	cmp r0, #0xff
	bne _0224CFC6
	ldr r0, [r4, #0x64]
	mov r1, #0xc0
	add r3, r0, #0
	mul r3, r1
	ldr r0, _0224D004 ; =0x00002DAC
	add r3, r4, r3
	ldr r3, [r3, r0]
	mov r0, #7
	tst r0, r3
	beq _0224CFD6
_0224CFC6:
	ldr r0, _0224D010 ; =0x0000217C
	ldrb r0, [r4, r0]
	sub r0, r2, r0
	add r1, r0, #1
	mov r0, #0x13
	lsl r0, r0, #4
	str r1, [r4, r0]
	b _0224CFE0
_0224CFD6:
	ldr r0, _0224D010 ; =0x0000217C
	add r1, #0x70
	ldrb r0, [r4, r0]
	sub r0, r2, r0
	str r0, [r4, r1]
_0224CFE0:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x11
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x22
	str r0, [r4, #0xc]
_0224CFF2:
	ldr r0, [sp]
	bl ov12_022642F0
	pop {r3, r4, r5, r6, r7, pc}
_0224CFFA:
	mov r0, #0x22
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224D000: .word 0x0000217D
_0224D004: .word 0x00002DAC
_0224D008: .word 0xFFFFBFFF
_0224D00C: .word 0x00003044
_0224D010: .word 0x0000217C
	thumb_func_end ov12_0224CF14

	thumb_func_start ov12_0224D014
ov12_0224D014: ; 0x0224D014
	push {r3, lr}
	ldr r0, _0224D038 ; =0x0000213C
	ldr r2, [r1, r0]
	mov r0, #0xf
	lsl r0, r0, #0x18
	tst r0, r2
	beq _0224D030
	add r0, r1, #0
	mov r1, #0x22
	add r2, r1, #0
	mov r3, #0
	bl ov12_0224DC74
	pop {r3, pc}
_0224D030:
	mov r0, #0x23
	str r0, [r1, #8]
	pop {r3, pc}
	nop
_0224D038: .word 0x0000213C
	thumb_func_end ov12_0224D014

	thumb_func_start ov12_0224D03C
ov12_0224D03C: ; 0x0224D03C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #0x85
	lsl r1, r1, #6
	add r5, r0, #0
	ldr r2, [r4, r1]
	mov r0, #8
	tst r0, r2
	beq _0224D060
	mov r0, #8
	bic r2, r0
	str r2, [r4, r1]
	ldr r0, [r4, #0x64]
	str r0, [r4, #0x6c]
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	str r0, [r4, #0x64]
_0224D060:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224DD74
	ldr r0, _0224D1C0 ; =0x00003044
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _0224D1C4 ; =0x000003E6
	ldrh r0, [r1, r0]
	cmp r0, #4
	bne _0224D12C
	ldr r0, _0224D1C8 ; =0x0000213C
	ldr r1, [r4, r0]
	mov r0, #2
	tst r0, r1
	bne _0224D12C
	add r0, r5, #0
	bl ov12_0223A7F0
	ldr r1, _0224D1CC ; =0x0000217E
	ldrb r2, [r4, r1]
	cmp r2, r0
	bge _0224D12C
	mov r2, #0xd
	add r0, r1, #6
	str r2, [r4, r0]
	add r0, r5, #0
	bl ov12_0223A7F0
	ldr r1, [r4, #0x64]
	add r0, r5, #0
	bl ov12_0223A7E8
	bl ov12_02261258
	mov r1, #1
	add r7, r0, #0
	and r7, r1
_0224D0AE:
	ldr r1, _0224D1CC ; =0x0000217E
	ldr r0, _0224D1CC ; =0x0000217E
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	add r2, r1, #1
	ldr r1, _0224D1CC ; =0x0000217E
	strb r2, [r4, r1]
	add r1, r4, r0
	ldr r0, _0224D1D0 ; =0x000021EC
	ldrb r6, [r1, r0]
	add r0, r6, #0
	bl MaskOfFlagNo
	ldr r1, _0224D1D4 ; =0x00003108
	ldrb r1, [r4, r1]
	tst r0, r1
	bne _0224D116
	mov r0, #0xc0
	mul r0, r6
	add r1, r4, r0
	ldr r0, _0224D1D8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0224D116
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_0223A7E8
	str r0, [sp]
	cmp r7, #0
	beq _0224D0F6
	bl ov12_02261258
	mov r1, #1
	tst r0, r1
	beq _0224D106
_0224D0F6:
	cmp r7, #0
	bne _0224D116
	ldr r0, [sp]
	bl ov12_02261258
	mov r1, #1
	tst r0, r1
	beq _0224D116
_0224D106:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02252D14
	str r6, [r4, #0x6c]
	mov r0, #0x17
	str r0, [r4, #8]
	b _0224D124
_0224D116:
	add r0, r5, #0
	bl ov12_0223A7F0
	ldr r1, _0224D1CC ; =0x0000217E
	ldrb r1, [r4, r1]
	cmp r1, r0
	blt _0224D0AE
_0224D124:
	add r0, r5, #0
	bl ov12_022642F0
	pop {r3, r4, r5, r6, r7, pc}
_0224D12C:
	ldr r0, _0224D1C0 ; =0x00003044
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _0224D1C4 ; =0x000003E6
	ldrh r0, [r1, r0]
	cmp r0, #8
	bne _0224D1BA
	ldr r0, _0224D1C8 ; =0x0000213C
	ldr r1, [r4, r0]
	mov r0, #2
	tst r0, r1
	bne _0224D1BA
	add r0, r5, #0
	bl ov12_0223A7F0
	ldr r1, _0224D1CC ; =0x0000217E
	ldrb r2, [r4, r1]
	cmp r2, r0
	bge _0224D1BA
	mov r2, #0xd
	add r0, r1, #6
	str r2, [r4, r0]
	add r0, r5, #0
	bl ov12_0223A7F0
	ldr r7, _0224D1CC ; =0x0000217E
_0224D162:
	ldr r0, _0224D1CC ; =0x0000217E
	ldrb r1, [r4, r0]
	ldrb r0, [r4, r7]
	add r1, r4, r1
	add r0, r0, #1
	strb r0, [r4, r7]
	ldr r0, _0224D1D0 ; =0x000021EC
	ldrb r6, [r1, r0]
	add r0, r6, #0
	bl MaskOfFlagNo
	ldr r1, _0224D1D4 ; =0x00003108
	ldrb r1, [r4, r1]
	tst r0, r1
	bne _0224D1A4
	mov r0, #0xc0
	mul r0, r6
	add r1, r4, r0
	ldr r0, _0224D1D8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0224D1A4
	ldr r0, [r4, #0x64]
	cmp r6, r0
	beq _0224D1A4
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02252D14
	str r6, [r4, #0x6c]
	mov r0, #0x17
	str r0, [r4, #8]
	b _0224D1B2
_0224D1A4:
	add r0, r5, #0
	bl ov12_0223A7F0
	ldr r1, _0224D1CC ; =0x0000217E
	ldrb r1, [r4, r1]
	cmp r1, r0
	blt _0224D162
_0224D1B2:
	add r0, r5, #0
	bl ov12_022642F0
	pop {r3, r4, r5, r6, r7, pc}
_0224D1BA:
	mov r0, #0x24
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224D1C0: .word 0x00003044
_0224D1C4: .word 0x000003E6
_0224D1C8: .word 0x0000213C
_0224D1CC: .word 0x0000217E
_0224D1D0: .word 0x000021EC
_0224D1D4: .word 0x00003108
_0224D1D8: .word 0x00002D8C
	thumb_func_end ov12_0224D03C

	thumb_func_start ov12_0224D1DC
ov12_0224D1DC: ; 0x0224D1DC
	push {r4, lr}
	ldr r0, _0224D218 ; =0x0000213C
	add r4, r1, #0
	ldr r1, [r4, r0]
	mov r0, #0xf
	lsl r0, r0, #0x1c
	and r0, r1
	beq _0224D212
	lsr r0, r0, #0x1c
	bl LowestFlagNo
	str r0, [r4, #0x74]
	ldr r1, _0224D218 ; =0x0000213C
	ldr r0, _0224D21C ; =0x0FFFFFFF
	ldr r2, [r4, r1]
	and r0, r2
	str r0, [r4, r1]
	ldr r2, _0224D220 ; =0x00000115
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x25
	str r0, [r4, #0xc]
	pop {r4, pc}
_0224D212:
	mov r0, #0x25
	str r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
_0224D218: .word 0x0000213C
_0224D21C: .word 0x0FFFFFFF
_0224D220: .word 0x00000115
	thumb_func_end ov12_0224D1DC

	thumb_func_start ov12_0224D224
ov12_0224D224: ; 0x0224D224
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0224E1BC
	cmp r0, #1
	beq _0224D234
	mov r0, #0x27
	str r0, [r4, #8]
_0224D234:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0224D224

	thumb_func_start ov12_0224D238
ov12_0224D238: ; 0x0224D238
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0224D238

	thumb_func_start ov12_0224D23C
ov12_0224D23C: ; 0x0224D23C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4, #0x64]
	add r5, r0, #0
	add r0, r4, #0
	bl ov12_02255830
	ldr r1, _0224D350 ; =0x0000213C
	lsl r0, r0, #0x18
	ldr r3, [r4, r1]
	mov r2, #0x20
	lsr r0, r0, #0x18
	tst r2, r3
	bne _0224D262
	add r1, r1, #4
	ldr r2, [r4, r1]
	mov r1, #4
	tst r1, r2
	beq _0224D2B6
_0224D262:
	cmp r0, #0x37
	beq _0224D26E
	cmp r0, #0x73
	beq _0224D26E
	cmp r0, #0x7d
	bne _0224D2A8
_0224D26E:
	mov r0, #0xc1
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0xa5
	beq _0224D2B6
	ldr r1, _0224D354 ; =0x00000171
	cmp r0, r1
	bne _0224D28A
	mov r1, #0x85
	lsl r1, r1, #6
	ldr r2, [r4, r1]
	mov r1, #0x10
	tst r1, r2
	bne _0224D2B6
_0224D28A:
	cmp r0, #0xe2
	bne _0224D29A
	mov r1, #0x85
	lsl r1, r1, #6
	ldr r2, [r4, r1]
	mov r1, #0x40
	tst r1, r2
	bne _0224D2B6
_0224D29A:
	ldr r2, [r4, #0x64]
	mov r1, #0xc0
	mul r1, r2
	add r2, r4, r1
	ldr r1, _0224D358 ; =0x00002DF8
	strh r0, [r2, r1]
	b _0224D2B6
_0224D2A8:
	ldr r2, [r4, #0x64]
	mov r1, #0xc0
	mul r1, r2
	add r2, r4, r1
	ldr r1, _0224D358 ; =0x00002DF8
	mov r0, #0
	strh r0, [r2, r1]
_0224D2B6:
	ldr r0, _0224D350 ; =0x0000213C
	mov r1, #1
	ldr r2, [r4, r0]
	lsl r1, r1, #0x14
	tst r1, r2
	bne _0224D31E
	add r0, r0, #4
	ldr r1, [r4, r0]
	mov r0, #4
	tst r0, r1
	beq _0224D2E4
	ldr r2, [r4, #0x64]
	ldr r1, _0224D35C ; =0x00003044
	lsl r2, r2, #1
	add r3, r4, r2
	add r2, r1, #0
	ldr r0, [r4, r1]
	add r2, #0x18
	strh r0, [r3, r2]
	sub r0, r1, #4
	ldr r2, [r4, r0]
	add r0, r1, #4
	b _0224D2F2
_0224D2E4:
	ldr r0, [r4, #0x64]
	mov r2, #0
	lsl r0, r0, #1
	add r1, r4, r0
	ldr r0, _0224D360 ; =0x0000305C
	strh r2, [r1, r0]
	sub r0, #0x14
_0224D2F2:
	str r2, [r4, r0]
	mov r0, #0x85
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #0x40
	tst r0, r1
	beq _0224D312
	mov r0, #0xc1
	ldr r1, [r4, #0x64]
	lsl r0, r0, #6
	ldr r2, [r4, r0]
	lsl r1, r1, #1
	add r1, r4, r1
	add r0, #0x3c
	strh r2, [r1, r0]
	b _0224D31E
_0224D312:
	ldr r0, [r4, #0x64]
	mov r2, #0
	lsl r0, r0, #1
	add r1, r4, r0
	ldr r0, _0224D364 ; =0x0000307C
	strh r2, [r1, r0]
_0224D31E:
	mov r0, #0x85
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #4
	tst r0, r1
	beq _0224D33A
	mov r0, #0xc1
	ldr r1, [r4, #0x64]
	lsl r0, r0, #6
	ldr r2, [r4, r0]
	lsl r1, r1, #1
	add r1, r4, r1
	add r0, #0x6c
	strh r2, [r1, r0]
_0224D33A:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224DD74
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02256694
	mov r0, #0x28
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224D350: .word 0x0000213C
_0224D354: .word 0x00000171
_0224D358: .word 0x00002DF8
_0224D35C: .word 0x00003044
_0224D360: .word 0x0000305C
_0224D364: .word 0x0000307C
	thumb_func_end ov12_0224D23C

	thumb_func_start ov12_0224D368
ov12_0224D368: ; 0x0224D368
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov12_0223A7E0
	mov r1, #0x22
	lsl r1, r1, #4
	tst r0, r1
	bne _0224D3EA
	ldr r2, [r4, #0x64]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl ov12_022543A0
	cmp r0, #1
	beq _0224D440
	ldr r2, [r4, #0x6c]
	cmp r2, #0xff
	beq _0224D39E
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl ov12_022543A0
	cmp r0, #1
	beq _0224D440
_0224D39E:
	ldr r1, [r4, #8]
	add r0, r4, #0
	add r2, r1, #0
	bl ov12_0224DD18
	cmp r0, #1
	beq _0224D440
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224D7EC
	cmp r0, #1
	beq _0224D440
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02253194
	add r2, r0, #0
	beq _0224D3D6
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224D3D6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224E130
	cmp r0, #1
	beq _0224D440
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224DC0C
_0224D3EA:
	add r1, r4, #0
	add r1, #0xec
	ldr r1, [r1]
	mov r0, #0x28
	add r2, r4, r1
	ldr r1, _0224D444 ; =0x000021E8
	ldrb r2, [r2, r1]
	sub r1, #0x40
	lsl r2, r2, #4
	add r2, r4, r2
	str r0, [r2, r1]
	ldr r1, [r4, #0x64]
	mov r0, #0x1c
	mul r0, r1
	add r1, r4, r0
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	beq _0224D428
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02257EC0
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02252D3C
	mov r1, #0
	b _0224D430
_0224D428:
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	add r1, r0, #1
_0224D430:
	add r0, r4, #0
	add r0, #0xec
	str r1, [r0]
	add r0, r4, #0
	bl ov12_02250F44
	mov r0, #8
	str r0, [r4, #8]
_0224D440:
	pop {r3, r4, r5, pc}
	nop
_0224D444: .word 0x000021E8
	thumb_func_end ov12_0224D368

	thumb_func_start ov12_0224D448
ov12_0224D448: ; 0x0224D448
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4, #8]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #1
	bl ov12_0224DC74
	cmp r0, #1
	beq _0224D460
	mov r0, #0x28
	str r0, [r4, #8]
_0224D460:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0224D448

	thumb_func_start ov12_0224D464
ov12_0224D464: ; 0x0224D464
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov12_0223BD14
	mov r1, #0x80
	tst r0, r1
	beq _0224D47A
	mov r0, #0x2c
	str r0, [r4, #8]
	b _0224D4E2
_0224D47A:
	add r0, r5, #0
	bl ov12_0223BD14
	cmp r0, #2
	beq _0224D48E
	add r0, r5, #0
	bl ov12_0223BD14
	cmp r0, #3
	bne _0224D4A2
_0224D48E:
	add r0, r4, #0
	mov r1, #1
	mov r2, #5
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x2c
	str r0, [r4, #0xc]
	b _0224D4E2
_0224D4A2:
	add r0, r5, #0
	bl ov12_0223BD14
	cmp r0, #1
	bne _0224D4C0
	add r0, r4, #0
	mov r1, #1
	mov r2, #4
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x2c
	str r0, [r4, #0xc]
	b _0224D4E2
_0224D4C0:
	add r0, r5, #0
	bl ov12_0223BD14
	cmp r0, #4
	bne _0224D4D4
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x2c
	str r0, [r4, #0xc]
	b _0224D4E2
_0224D4D4:
	add r0, r5, #0
	bl ov12_0223BD14
	cmp r0, #5
	bne _0224D4E2
	mov r0, #0x2c
	str r0, [r4, #8]
_0224D4E2:
	ldr r0, _0224D4EC ; =0x0000311F
	mov r1, #1
	strb r1, [r4, r0]
	pop {r3, r4, r5, pc}
	nop
_0224D4EC: .word 0x0000311F
	thumb_func_end ov12_0224D464

	thumb_func_start ov12_0224D4F0
ov12_0224D4F0: ; 0x0224D4F0
	push {r4, lr}
	add r4, r1, #0
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0224D500
	mov r0, #0x2c
	str r0, [r4, #8]
_0224D500:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0224D4F0

	thumb_func_start ov12_0224D504
ov12_0224D504: ; 0x0224D504
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl ov12_0223A7E0
	mov r1, #4
	add r4, r0, #0
	and r4, r1
	bne _0224D52A
	add r0, r6, #0
	mov r1, #0
	bl ov12_0223A7F4
	add r6, r0, #0
	bl Party_GivePokerusAtRandom
	add r0, r6, #0
	bl Party_SpreadPokerus
_0224D52A:
	cmp r4, #0
	beq _0224D534
	mov r0, #0x16
	bl sub_020376EC
_0224D534:
	mov r0, #0x2d
	str r0, [r5, #8]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0224D504

	thumb_func_start ov12_0224D53C
ov12_0224D53C: ; 0x0224D53C
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0224D53C
    
	thumb_func_start ov12_0224D540
ov12_0224D540: ; 0x0224D540
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r1, [sp, #4]
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #0x30]
	bl ov12_0223A7F0
	str r0, [sp, #0x28]
	ldr r0, [sp]
	bl ov12_0223A7E0
	str r0, [sp, #0x24]
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	cmp r0, #0
	bgt _0224D56C
	b _0224D75E
_0224D56C:
	ldr r0, [sp, #4]
	mov r1, #2
	str r0, [sp, #0x1c]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x24]
	and r0, r1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x24]
	mov r1, #0x18
	and r0, r1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x24]
	mov r1, #0x10
	and r0, r1
	str r0, [sp, #0xc]
_0224D58A:
	mov r1, #0x4f
	ldr r0, [sp, #0x1c]
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	mov r0, #1
	bic r2, r0
	ldr r0, [sp, #0x1c]
	str r2, [r0, r1]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0224D5A6
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0224D5B8
_0224D5A6:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0224D69E
	ldr r0, [sp]
	ldr r1, [sp, #0x2c]
	bl ov12_0223AB1C
	cmp r0, #0
	bne _0224D69E
_0224D5B8:
	ldr r3, _0224D7DC ; =0x00002D8C
	ldr r0, [sp, #0x18]
	ldr r0, [r0, r3]
	cmp r0, #0
	bne _0224D5E0
	ldr r1, [sp, #0x2c]
	mov r2, #2
	add r4, r1, #0
	eor r4, r2
	mov r1, #0xc0
	add r5, r4, #0
	mul r5, r1
	ldr r1, [sp, #4]
	add r1, r1, r5
	ldr r1, [r1, r3]
	cmp r1, #0
	bne _0224D5E0
	ldr r1, [sp, #0x2c]
	tst r1, r2
	bne _0224D5E4
_0224D5E0:
	cmp r0, #0
	beq _0224D5E6
_0224D5E4:
	b _0224D744
_0224D5E6:
	ldr r0, [sp]
	ldr r1, [sp, #0x2c]
	mov r7, #0
	bl ov12_0223A7F4
	add r6, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #0x2c]
	bl ov12_0223A7E8
	add r0, r6, #0
	add r5, r7, #0
	bl GetPartyCount
	cmp r0, #0
	ble _0224D65E
	ldr r0, [sp, #0x2c]
	mov r1, #2
	eor r1, r0
	ldr r0, [sp, #4]
	add r0, r0, r1
	str r0, [sp, #8]
_0224D612:
	add r0, r6, #0
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0224D652
	add r0, r4, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _0224D7E0 ; =0x000001EE
	cmp r0, r1
	beq _0224D652
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0224D652
	ldr r2, [sp, #8]
	ldr r1, _0224D7E4 ; =0x0000219C
	ldrb r1, [r2, r1]
	cmp r5, r1
	beq _0224D652
	add r7, r7, r0
_0224D652:
	add r0, r6, #0
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blt _0224D612
_0224D65E:
	cmp r7, #0
	bne _0224D682
	ldr r0, [sp, #0x2c]
	bl MaskOfFlagNo
	ldr r2, _0224D7E8 ; =0x00003108
	ldr r1, [sp, #4]
	ldrb r1, [r1, r2]
	orr r1, r0
	ldr r0, [sp, #4]
	strb r1, [r0, r2]
	add r1, r0, #0
	ldr r0, [sp, #0x2c]
	mov r2, #6
	add r1, r1, r0
	ldr r0, _0224D7E4 ; =0x0000219C
	strb r2, [r1, r0]
	b _0224D744
_0224D682:
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #4]
	str r1, [r0, #0xc]
	mov r1, #0x16
	str r1, [r0, #8]
	mov r1, #0x4f
	ldr r0, [sp, #0x1c]
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	mov r0, #1
	orr r2, r0
	ldr r0, [sp, #0x1c]
	str r2, [r0, r1]
	b _0224D744
_0224D69E:
	ldr r1, _0224D7DC ; =0x00002D8C
	ldr r0, [sp, #0x18]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _0224D744
	ldr r0, [sp]
	ldr r1, [sp, #0x2c]
	mov r7, #0
	bl ov12_0223A7F4
	add r6, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #0x2c]
	bl ov12_0223A7E8
	add r0, r6, #0
	add r5, r7, #0
	bl GetPartyCount
	cmp r0, #0
	ble _0224D706
_0224D6C8:
	add r0, r6, #0
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0224D6FA
	add r0, r4, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _0224D7E0 ; =0x000001EE
	cmp r0, r1
	beq _0224D6FA
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r7, r7, r0
_0224D6FA:
	add r0, r6, #0
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blt _0224D6C8
_0224D706:
	cmp r7, #0
	bne _0224D72A
	ldr r0, [sp, #0x2c]
	bl MaskOfFlagNo
	ldr r2, _0224D7E8 ; =0x00003108
	ldr r1, [sp, #4]
	ldrb r1, [r1, r2]
	orr r1, r0
	ldr r0, [sp, #4]
	strb r1, [r0, r2]
	add r1, r0, #0
	ldr r0, [sp, #0x2c]
	mov r2, #6
	add r1, r1, r0
	ldr r0, _0224D7E4 ; =0x0000219C
	strb r2, [r1, r0]
	b _0224D744
_0224D72A:
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #4]
	str r1, [r0, #0xc]
	mov r1, #0x16
	str r1, [r0, #8]
	mov r1, #0x4f
	ldr r0, [sp, #0x1c]
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	mov r0, #1
	orr r2, r0
	ldr r0, [sp, #0x1c]
	str r2, [r0, r1]
_0224D744:
	ldr r0, [sp, #0x1c]
	add r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	add r0, #0xc0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x2c]
	add r1, r0, #1
	ldr r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	cmp r1, r0
	bge _0224D75E
	b _0224D58A
_0224D75E:
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	cmp r0, #0x16
	bne _0224D7D4
	ldr r0, [sp, #0x24]
	mov r1, #0x86
	tst r0, r1
	bne _0224D7C6
	ldr r0, [sp]
	bl ov12_0223B740
	cmp r0, #0
	bne _0224D7C6
	mov r1, #0x4f
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r2, #1
	tst r0, r2
	beq _0224D790
	ldr r0, [sp, #4]
	add r1, r1, #4
	ldr r0, [r0, r1]
	tst r0, r2
	bne _0224D7C6
_0224D790:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	mov r2, #0
	bl ov12_02252890
	cmp r0, #0
	beq _0224D7C6
	mov r1, #0x4f
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r2, #1
	tst r0, r2
	beq _0224D7B4
	mov r2, #0
	sub r1, r1, #4
	ldr r0, [sp, #4]
	b _0224D7B8
_0224D7B4:
	ldr r0, [sp, #4]
	sub r1, r1, #4
_0224D7B8:
	str r2, [r0, r1]
	ldr r0, [sp, #4]
	mov r1, #1
	mov r2, #0xe7
	bl ReadBattleScriptFromNarc
	b _0224D7D0
_0224D7C6:
	ldr r0, [sp, #4]
	mov r1, #1
	mov r2, #0xa
	bl ReadBattleScriptFromNarc
_0224D7D0:
	mov r0, #1
	str r0, [sp, #0x30]
_0224D7D4:
	ldr r0, [sp, #0x30]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0224D7DC: .word 0x00002D8C
_0224D7E0: .word 0x000001EE
_0224D7E4: .word 0x0000219C
_0224D7E8: .word 0x00003108
	thumb_func_end ov12_0224D540

	thumb_func_start ov12_0224D7EC
ov12_0224D7EC: ; 0x0224D7EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r0, [sp]
	str r1, [sp, #4]
	bl ov12_0223A7F0
	str r0, [sp, #0x24]
	ldr r0, [sp]
	bl ov12_0223A7E0
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x1c]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bgt _0224D810
	b _0224DA6A
_0224D810:
	ldr r0, [sp, #0x20]
	mov r1, #8
	and r0, r1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	mov r1, #0x10
	and r0, r1
	str r0, [sp, #8]
_0224D820:
	ldr r0, [sp, #0x20]
	sub r0, #0x4a
	cmp r0, #1
	bhi _0224D8BA
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	bl ov12_0223AB1C
	cmp r0, #0
	bne _0224D8BA
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	bl ov12_0223AB0C
	cmp r0, #2
	bne _0224D8DC
	ldr r1, _0224DB24 ; =0x00002D8C
	ldr r0, [sp, #4]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _0224D8DC
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	mov r7, #0
	bl ov12_0223A7F4
	add r6, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	bl ov12_0223A7E8
	add r0, r6, #0
	add r4, r7, #0
	bl GetPartyCount
	cmp r0, #0
	ble _0224D8A8
_0224D86A:
	add r0, r6, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0224D89C
	add r0, r5, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _0224DB28 ; =0x000001EE
	cmp r0, r1
	beq _0224D89C
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r7, r7, r0
_0224D89C:
	add r0, r6, #0
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _0224D86A
_0224D8A8:
	cmp r7, #0
	bne _0224D8DC
	ldr r0, [sp, #0x1c]
	mov r1, #2
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	b _0224DA56
_0224D8BA:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0224D8D2
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0224D9C4
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	bl ov12_0223AB1C
	cmp r0, #0
	beq _0224D9C4
_0224D8D2:
	ldr r1, _0224DB24 ; =0x00002D8C
	ldr r0, [sp, #4]
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _0224D8DE
_0224D8DC:
	b _0224DA56
_0224D8DE:
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	mov r4, #0
	bl ov12_0223A7F4
	add r7, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	bl ov12_0223AB6C
	add r1, r0, #0
	ldr r0, [sp]
	bl ov12_0223A7F4
	str r0, [sp, #0x18]
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	bl ov12_0223A7E8
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r5, r4, #0
	bl GetPartyCount
	cmp r0, #0
	ble _0224D950
_0224D912:
	add r0, r7, #0
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0224D944
	add r0, r6, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _0224DB28 ; =0x000001EE
	cmp r0, r1
	beq _0224D944
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
_0224D944:
	add r0, r7, #0
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blt _0224D912
_0224D950:
	ldr r0, [sp, #0x18]
	mov r5, #0
	bl GetPartyCount
	cmp r0, #0
	ble _0224D99A
	ldr r7, _0224DB28 ; =0x000001EE
_0224D95E:
	ldr r0, [sp, #0x18]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0224D98E
	add r0, r6, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	cmp r0, r7
	beq _0224D98E
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
_0224D98E:
	ldr r0, [sp, #0x18]
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blt _0224D95E
_0224D99A:
	cmp r4, #0
	bne _0224DA56
	ldr r0, [sp, #0x14]
	bl ov12_02261258
	mov r1, #1
	tst r0, r1
	beq _0224D9B6
	ldr r0, [sp, #0x1c]
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	b _0224DA56
_0224D9B6:
	ldr r0, [sp, #0x1c]
	mov r1, #2
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	b _0224DA56
_0224D9C4:
	ldr r1, _0224DB24 ; =0x00002D8C
	ldr r0, [sp, #4]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _0224DA56
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	mov r7, #0
	bl ov12_0223A7F4
	add r6, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	bl ov12_0223A7E8
	str r0, [sp, #0x10]
	add r0, r6, #0
	add r4, r7, #0
	bl GetPartyCount
	cmp r0, #0
	ble _0224DA2E
_0224D9F0:
	add r0, r6, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0224DA22
	add r0, r5, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _0224DB28 ; =0x000001EE
	cmp r0, r1
	beq _0224DA22
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r7, r7, r0
_0224DA22:
	add r0, r6, #0
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _0224D9F0
_0224DA2E:
	cmp r7, #0
	bne _0224DA56
	ldr r0, [sp, #0x10]
	bl ov12_02261258
	mov r1, #1
	tst r0, r1
	beq _0224DA4A
	ldr r0, [sp, #0x1c]
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	b _0224DA56
_0224DA4A:
	ldr r0, [sp, #0x1c]
	mov r1, #2
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
_0224DA56:
	ldr r0, [sp, #4]
	add r0, #0xc0
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	add r1, r0, #1
	ldr r0, [sp, #0x24]
	str r1, [sp, #0x28]
	cmp r1, r0
	bge _0224DA6A
	b _0224D820
_0224DA6A:
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	bne _0224DA80
	ldr r0, [sp, #0x20]
	mov r1, #1
	tst r0, r1
	beq _0224DA80
	ldr r0, [sp, #0x20]
	mov r1, #4
	tst r0, r1
	beq _0224DA96
_0224DA80:
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	bne _0224DB44
	ldr r0, [sp, #0x20]
	mov r1, #0x80
	tst r0, r1
	beq _0224DB44
	ldr r0, [sp, #0x20]
	mov r1, #4
	tst r0, r1
	bne _0224DB44
_0224DA96:
	ldr r0, [sp]
	mov r1, #1
	bl ov12_0223A9F4
	ldrb r0, [r0, #1]
	sub r0, #0x42
	cmp r0, #0x2e
	bhi _0224DB20
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224DAB2: ; jump table
	.short _0224DB10 - _0224DAB2 - 2 ; case 0
	.short _0224DB10 - _0224DAB2 - 2 ; case 1
	.short _0224DB20 - _0224DAB2 - 2 ; case 2
	.short _0224DB20 - _0224DAB2 - 2 ; case 3
	.short _0224DB10 - _0224DAB2 - 2 ; case 4
	.short _0224DB20 - _0224DAB2 - 2 ; case 5
	.short _0224DB10 - _0224DAB2 - 2 ; case 6
	.short _0224DB10 - _0224DAB2 - 2 ; case 7
	.short _0224DB10 - _0224DAB2 - 2 ; case 8
	.short _0224DB10 - _0224DAB2 - 2 ; case 9
	.short _0224DB10 - _0224DAB2 - 2 ; case 10
	.short _0224DB20 - _0224DAB2 - 2 ; case 11
	.short _0224DB20 - _0224DAB2 - 2 ; case 12
	.short _0224DB20 - _0224DAB2 - 2 ; case 13
	.short _0224DB20 - _0224DAB2 - 2 ; case 14
	.short _0224DB20 - _0224DAB2 - 2 ; case 15
	.short _0224DB20 - _0224DAB2 - 2 ; case 16
	.short _0224DB20 - _0224DAB2 - 2 ; case 17
	.short _0224DB20 - _0224DAB2 - 2 ; case 18
	.short _0224DB20 - _0224DAB2 - 2 ; case 19
	.short _0224DB10 - _0224DAB2 - 2 ; case 20
	.short _0224DB10 - _0224DAB2 - 2 ; case 21
	.short _0224DB10 - _0224DAB2 - 2 ; case 22
	.short _0224DB10 - _0224DAB2 - 2 ; case 23
	.short _0224DB20 - _0224DAB2 - 2 ; case 24
	.short _0224DB20 - _0224DAB2 - 2 ; case 25
	.short _0224DB20 - _0224DAB2 - 2 ; case 26
	.short _0224DB20 - _0224DAB2 - 2 ; case 27
	.short _0224DB20 - _0224DAB2 - 2 ; case 28
	.short _0224DB20 - _0224DAB2 - 2 ; case 29
	.short _0224DB20 - _0224DAB2 - 2 ; case 30
	.short _0224DB18 - _0224DAB2 - 2 ; case 31
	.short _0224DB10 - _0224DAB2 - 2 ; case 32
	.short _0224DB18 - _0224DAB2 - 2 ; case 33
	.short _0224DB18 - _0224DAB2 - 2 ; case 34
	.short _0224DB18 - _0224DAB2 - 2 ; case 35
	.short _0224DB18 - _0224DAB2 - 2 ; case 36
	.short _0224DB10 - _0224DAB2 - 2 ; case 37
	.short _0224DB10 - _0224DAB2 - 2 ; case 38
	.short _0224DB10 - _0224DAB2 - 2 ; case 39
	.short _0224DB10 - _0224DAB2 - 2 ; case 40
	.short _0224DB10 - _0224DAB2 - 2 ; case 41
	.short _0224DB10 - _0224DAB2 - 2 ; case 42
	.short _0224DB20 - _0224DAB2 - 2 ; case 43
	.short _0224DB10 - _0224DAB2 - 2 ; case 44
	.short _0224DB20 - _0224DAB2 - 2 ; case 45
	.short _0224DB10 - _0224DAB2 - 2 ; case 46
_0224DB10:
	ldr r0, _0224DB2C ; =SEQ_GS_WIN3
	bl PlayBGM
	b _0224DB3C
_0224DB18:
	ldr r0, _0224DB30 ; =SEQ_GS_WINBRAIN
	bl PlayBGM
	b _0224DB3C
_0224DB20:
	ldr r0, _0224DB34 ; =SEQ_GS_WIN1
	b _0224DB38
	.balign 4, 0
_0224DB24: .word 0x00002D8C
_0224DB28: .word 0x000001EE
_0224DB2C: .word SEQ_GS_WIN3
_0224DB30: .word SEQ_GS_WINBRAIN
_0224DB34: .word SEQ_GS_WIN1
_0224DB38:
	bl PlayBGM
_0224DB3C:
	ldr r0, [sp]
	mov r1, #2
	bl ov12_0223BD3C
_0224DB44:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0224DB52
	ldr r0, [sp]
	ldr r1, [sp, #0x1c]
	bl ov12_0223BD20
_0224DB52:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0224DB5E
	add sp, #0x2c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0224DB5E:
	mov r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov12_0224D7EC

	thumb_func_start ov12_0224DB64
ov12_0224DB64: ; 0x0224DB64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	add r5, r1, #0
	ldr r0, _0224DBFC ; =0x00002D4C
	add r6, r2, #0
	mov r1, #0xc0
	add r0, r5, r0
	mul r1, r6
	add r0, r0, r1
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #8]
	lsl r0, r0, #1
	ldrh r1, [r1, r0]
	str r3, [sp, #4]
	ldr r4, [sp, #0x28]
	ldr r7, [sp, #0x30]
	str r0, [sp, #0xc]
	cmp r1, #0xae
	bne _0224DB9E
	add r0, r5, #0
	bl ov12_022526D0
	cmp r0, #0
	bne _0224DB9E
	mov r0, #0x10
	str r0, [r4]
	b _0224DBAE
_0224DB9E:
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	ldrh r0, [r1, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0224DC00 ; =0x000003E6
	ldrh r0, [r1, r0]
	str r0, [r4]
_0224DBAE:
	ldr r0, [sp, #4]
	mov r1, #2
	tst r0, r1
	beq _0224DBE4
	ldr r0, [r4]
	add r1, #0xfe
	cmp r0, r1
	bne _0224DBDE
	ldr r0, [sp]
	add r1, r6, #0
	bl ov12_0223AB6C
	bl MaskOfFlagNo
	ldr r1, _0224DC04 ; =0x00003108
	ldrb r1, [r5, r1]
	tst r0, r1
	bne _0224DBD8
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224DBD8:
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224DBDE:
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224DBE4:
	ldr r1, [r4]
	ldr r0, _0224DC08 ; =0x00000251
	tst r0, r1
	beq _0224DBF0
	str r6, [r7]
	b _0224DBF6
_0224DBF0:
	mov r0, #1
	eor r0, r6
	str r0, [r7]
_0224DBF6:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224DBFC: .word 0x00002D4C
_0224DC00: .word 0x000003E6
_0224DC04: .word 0x00003108
_0224DC08: .word 0x00000251
	thumb_func_end ov12_0224DB64

	thumb_func_start ov12_0224DC0C
ov12_0224DC0C: ; 0x0224DC0C
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	bl ov12_0223A7F0
	add r4, r0, #0
	mov r3, #0
	cmp r4, #0
	ble _0224DC46
	ldr r5, [sp]
	add r7, r3, #0
	add r6, r5, #0
_0224DC22:
	ldr r0, _0224DC68 ; =0x00002DB0
	add r3, r3, #1
	ldr r2, [r6, r0]
	ldr r0, _0224DC6C ; =0x0000218C
	ldr r1, [r5, r0]
	mov r0, #0
	mvn r0, r0
	eor r0, r1
	add r1, r2, #0
	and r1, r0
	ldr r0, _0224DC68 ; =0x00002DB0
	str r1, [r6, r0]
	ldr r0, _0224DC6C ; =0x0000218C
	add r6, #0xc0
	str r7, [r5, r0]
	add r5, r5, #4
	cmp r3, r4
	blt _0224DC22
_0224DC46:
	ldr r1, [sp]
	mov r0, #0
	ldr r1, [r1, #0x64]
	lsl r2, r1, #1
	ldr r1, [sp]
	add r1, r1, r2
	ldr r2, _0224DC70 ; =0x00003064
	strh r0, [r1, r2]
	ldr r1, [sp]
	add r2, #0x60
	ldr r1, [r1, #0x64]
	lsl r3, r1, #1
	ldr r1, [sp]
	add r1, r1, r3
	strh r0, [r1, r2]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224DC68: .word 0x00002DB0
_0224DC6C: .word 0x0000218C
_0224DC70: .word 0x00003064
	thumb_func_end ov12_0224DC0C

	thumb_func_start ov12_0224DC74
ov12_0224DC74: ; 0x0224DC74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0224DD0C ; =0x000021EC
	str r1, [sp]
	ldrb r0, [r5, r0]
	add r6, r2, #0
	str r3, [sp, #4]
	mov r4, #0
	bl MaskOfFlagNo
	ldr r1, _0224DD10 ; =0x0000213C
	lsl r0, r0, #0x18
	ldr r2, [r5, r1]
	mov r1, #0xf
	lsl r1, r1, #0x18
	tst r1, r2
	beq _0224DD02
	add r1, r2, #0
	tst r1, r0
	bne _0224DCB6
	ldr r7, _0224DD0C ; =0x000021EC
	add r6, r7, #0
	sub r6, #0xb0
_0224DCA4:
	add r4, r4, #1
	add r0, r5, r4
	ldrb r0, [r0, r7]
	bl MaskOfFlagNo
	ldr r1, [r5, r6]
	lsl r0, r0, #0x18
	tst r1, r0
	beq _0224DCA4
_0224DCB6:
	ldr r2, _0224DD10 ; =0x0000213C
	mov r1, #0
	mvn r1, r1
	eor r1, r0
	ldr r3, [r5, r2]
	asr r0, r0, #0x18
	and r1, r3
	str r1, [r5, r2]
	bl LowestFlagNo
	str r0, [r5, #0x74]
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _0224DCDE
	add r0, r5, #0
	mov r1, #1
	mov r2, #6
	bl ReadBattleScriptFromNarc
	b _0224DCE8
_0224DCDE:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x53
	bl ReadBattleScriptFromNarc
_0224DCE8:
	mov r0, #0x16
	str r0, [r5, #8]
	ldr r0, [sp]
	mov r2, #0x28
	str r0, [r5, #0xc]
	ldr r0, [r5, #0x74]
	add sp, #8
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0224DD14 ; =0x000021A8
	str r2, [r1, r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224DD02:
	str r6, [r5, #8]
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224DD0C: .word 0x000021EC
_0224DD10: .word 0x0000213C
_0224DD14: .word 0x000021A8
	thumb_func_end ov12_0224DC74

	thumb_func_start ov12_0224DD18
ov12_0224DD18: ; 0x0224DD18
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x85
	lsl r0, r0, #6
	add r4, r1, #0
	ldr r1, [r5, r0]
	mov r0, #0xf
	lsl r0, r0, #0x1c
	tst r0, r1
	beq _0224DD6C
	mov r0, #1
	lsl r0, r0, #0x1c
	add r2, r1, #0
	tst r2, r0
	bne _0224DD3E
_0224DD36:
	lsl r0, r0, #1
	add r2, r1, #0
	tst r2, r0
	beq _0224DD36
_0224DD3E:
	mov r2, #0x85
	lsl r2, r2, #6
	mov r1, #0
	mvn r1, r1
	eor r1, r0
	ldr r3, [r5, r2]
	asr r0, r0, #0x1c
	and r1, r3
	str r1, [r5, r2]
	bl LowestFlagNo
	mov r2, #0x45
	str r0, [r5, #0x74]
	add r0, r5, #0
	mov r1, #1
	lsl r2, r2, #2
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r5, #8]
	str r4, [r5, #0xc]
	mov r0, #1
	pop {r3, r4, r5, pc}
_0224DD6C:
	str r2, [r5, #8]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0224DD18

	thumb_func_start ov12_0224DD74
ov12_0224DD74: ; 0x0224DD74
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x60
	bne _0224DD88
	mov r4, #0
	b _0224DD9C
_0224DD88:
	ldr r0, _0224DF54 ; =0x00002160
	ldr r4, [r5, r0]
	cmp r4, #0
	bne _0224DD9C
	ldr r0, _0224DF58 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0224DF5C ; =0x000003E2
	ldrb r4, [r1, r0]
_0224DD9C:
	mov r0, #0xc1
	lsl r0, r0, #6
	ldr r2, [r5, r0]
	mov r6, #0x10
	lsl r1, r2, #4
	add r3, r5, r1
	ldr r1, _0224DF60 ; =0x000003E9
	ldrb r1, [r3, r1]
	tst r1, r6
	beq _0224DDE6
	ldr r3, _0224DF64 ; =0x0000213C
	lsl r6, r6, #0x10
	ldr r1, [r5, r3]
	tst r1, r6
	bne _0224DDE6
	ldr r1, [r5, #0x6c]
	cmp r1, #0xff
	beq _0224DDE6
	add r3, r3, #4
	ldr r6, [r5, r3]
	mov r3, #4
	tst r3, r6
	beq _0224DDE6
	lsl r1, r1, #1
	add r3, r5, r1
	add r1, r0, #0
	add r1, #0x44
	strh r2, [r3, r1]
	ldr r2, [r5, #0x6c]
	ldr r1, [r5, r0]
	lsl r2, r2, #3
	add r3, r5, r2
	ldr r2, [r5, #0x64]
	add r0, #0x4c
	lsl r2, r2, #1
	add r2, r3, r2
	strh r1, [r2, r0]
_0224DDE6:
	ldr r1, [r5, #0x6c]
	cmp r1, #0xff
	beq _0224DE30
	add r0, r5, #0
	bl ov12_02255830
	ldr r1, _0224DF64 ; =0x0000213C
	lsl r0, r0, #0x18
	ldr r3, [r5, r1]
	mov r2, #0x20
	lsr r0, r0, #0x18
	tst r2, r3
	bne _0224DE0A
	add r1, r1, #4
	ldr r2, [r5, r1]
	mov r1, #4
	tst r1, r2
	beq _0224DE24
_0224DE0A:
	cmp r0, #0x37
	beq _0224DE24
	cmp r0, #0x73
	beq _0224DE24
	cmp r0, #0x7d
	beq _0224DE24
	ldr r1, [r5, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0224DF68 ; =0x00002DF8
	mov r2, #0
	strh r2, [r1, r0]
_0224DE24:
	ldr r0, _0224DF64 ; =0x0000213C
	mov r1, #1
	ldr r2, [r5, r0]
	lsl r1, r1, #0x14
	tst r1, r2
	beq _0224DE32
_0224DE30:
	b _0224DF52
_0224DE32:
	add r0, r0, #4
	ldr r1, [r5, r0]
	mov r0, #4
	tst r0, r1
	beq _0224DE70
	ldr r1, [r5, #0x6c]
	ldr r0, _0224DF58 ; =0x00003044
	lsl r1, r1, #1
	add r2, r5, r1
	add r1, r0, #0
	ldr r3, [r5, r0]
	add r1, #0x20
	strh r3, [r2, r1]
	ldr r1, [r5, #0x6c]
	ldr r3, [r5, #0x64]
	lsl r1, r1, #1
	add r2, r5, r1
	add r1, r0, #0
	add r1, #0x28
	strh r3, [r2, r1]
	ldr r1, [r5, #0x6c]
	lsl r1, r1, #1
	add r2, r5, r1
	add r1, r0, #0
	add r1, #0x30
	strh r4, [r2, r1]
	sub r1, r0, #4
	ldr r1, [r5, r1]
	add r0, r0, #4
	str r1, [r5, r0]
	b _0224DE9A
_0224DE70:
	ldr r0, [r5, #0x6c]
	ldr r3, _0224DF6C ; =0x00003064
	lsl r0, r0, #1
	mov r1, #0
	add r0, r5, r0
	strh r1, [r0, r3]
	ldr r2, [r5, #0x6c]
	mov r0, #0xff
	lsl r2, r2, #1
	add r6, r5, r2
	add r2, r3, #0
	add r2, #8
	strh r0, [r6, r2]
	ldr r0, [r5, #0x6c]
	lsl r0, r0, #1
	add r2, r5, r0
	add r0, r3, #0
	add r0, #0x10
	strh r1, [r2, r0]
	sub r3, #0x1c
	str r1, [r5, r3]
_0224DE9A:
	mov r0, #0x85
	lsl r0, r0, #6
	ldr r2, [r5, r0]
	mov r1, #0x40
	tst r1, r2
	beq _0224DF2E
	add r0, #0x2c
	ldr r0, [r5, r0]
	ldr r2, _0224DF70 ; =0x801FDA49
	tst r0, r2
	bne _0224DF2E
	ldr r0, _0224DF58 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r1, r0, #4
	add r3, r5, r1
	ldr r1, _0224DF74 ; =0x000003E6
	ldrh r3, [r3, r1]
	cmp r3, #0x40
	bgt _0224DED0
	bge _0224DEE4
	cmp r3, #0x10
	bgt _0224DECA
	beq _0224DEE4
	b _0224DF0A
_0224DECA:
	cmp r3, #0x20
	beq _0224DEE4
	b _0224DF0A
_0224DED0:
	lsr r1, r2, #0x17
	cmp r3, r1
	bgt _0224DEDE
	bge _0224DEE4
	cmp r3, #0x80
	beq _0224DEE4
	b _0224DF0A
_0224DEDE:
	lsr r1, r2, #0x16
	cmp r3, r1
	bne _0224DF0A
_0224DEE4:
	ldr r1, [r5, #0x6c]
	ldr r2, _0224DF78 ; =0x000030C4
	lsl r1, r1, #1
	mov r0, #0
	add r1, r5, r1
	strh r0, [r1, r2]
	ldr r1, [r5, #0x6c]
	mov r4, #0xff
	lsl r1, r1, #1
	add r3, r5, r1
	add r1, r2, #0
	add r1, #8
	strh r4, [r3, r1]
	ldr r1, [r5, #0x6c]
	add r2, #0x10
	lsl r1, r1, #1
	add r1, r5, r1
	strh r0, [r1, r2]
	pop {r4, r5, r6, pc}
_0224DF0A:
	ldr r1, [r5, #0x6c]
	lsl r1, r1, #1
	add r2, r5, r1
	ldr r1, _0224DF78 ; =0x000030C4
	strh r0, [r2, r1]
	ldr r0, [r5, #0x6c]
	ldr r3, [r5, #0x64]
	lsl r0, r0, #1
	add r2, r5, r0
	add r0, r1, #0
	add r0, #8
	strh r3, [r2, r0]
	ldr r0, [r5, #0x6c]
	add r1, #0x10
	lsl r0, r0, #1
	add r0, r5, r0
	strh r4, [r0, r1]
	pop {r4, r5, r6, pc}
_0224DF2E:
	ldr r1, [r5, #0x6c]
	ldr r2, _0224DF78 ; =0x000030C4
	lsl r1, r1, #1
	mov r0, #0
	add r1, r5, r1
	strh r0, [r1, r2]
	ldr r1, [r5, #0x6c]
	mov r4, #0xff
	lsl r1, r1, #1
	add r3, r5, r1
	add r1, r2, #0
	add r1, #8
	strh r4, [r3, r1]
	ldr r1, [r5, #0x6c]
	add r2, #0x10
	lsl r1, r1, #1
	add r1, r5, r1
	strh r0, [r1, r2]
_0224DF52:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0224DF54: .word 0x00002160
_0224DF58: .word 0x00003044
_0224DF5C: .word 0x000003E2
_0224DF60: .word 0x000003E9
_0224DF64: .word 0x0000213C
_0224DF68: .word 0x00002DF8
_0224DF6C: .word 0x00003064
_0224DF70: .word 0x801FDA49
_0224DF74: .word 0x000003E6
_0224DF78: .word 0x000030C4
	thumb_func_end ov12_0224DD74

	thumb_func_start ov12_0224DF7C
ov12_0224DF7C: ; 0x0224DF7C
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x10
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0224DF7C

	thumb_func_start ov12_0224DF98
ov12_0224DF98: ; 0x0224DF98
	push {r3, r4, r5, lr}
	ldr r2, _0224DFE8 ; =0x0000216C
	add r5, r1, #0
	ldr r0, [r5, r2]
	mov r4, #0
	cmp r0, #0
	beq _0224DFCC
	add r1, r2, #0
	add r1, #0x11
	ldrb r1, [r5, r1]
	cmp r1, #0
	beq _0224DFCA
	ldr r1, [r5, #0x74]
	cmp r1, #0xff
	bne _0224DFC6
	add r2, #0x10
	ldrb r1, [r5, r2]
	cmp r1, #1
	beq _0224DFC6
	mov r1, #1
	lsl r1, r1, #0xe
	tst r0, r1
	beq _0224DFCC
_0224DFC6:
	mov r4, #1
	b _0224DFCC
_0224DFCA:
	mov r4, #1
_0224DFCC:
	cmp r4, #1
	bne _0224DFE2
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x15
	bl ReadBattleScriptFromNarc
	ldr r0, [r5, #8]
	str r0, [r5, #0xc]
	mov r0, #0x16
	str r0, [r5, #8]
_0224DFE2:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0224DFE8: .word 0x0000216C
	thumb_func_end ov12_0224DF98

	thumb_func_start ov12_0224DFEC
ov12_0224DFEC: ; 0x0224DFEC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldr r2, [r4, #0x6c]
	mov r3, #0
	cmp r2, #0xff
	bne _0224DFFC
	add r0, r3, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224DFFC:
	mov r0, #0xc0
	add r5, r2, #0
	mul r5, r0
	mov r1, #2
	ldr r0, _0224E06C ; =0x00002DB0
	add r7, r4, r5
	ldr r6, [r7, r0]
	lsl r1, r1, #0x16
	tst r1, r6
	beq _0224E066
	ldr r1, _0224E070 ; =0x0000216C
	mov r6, #2
	lsl r6, r6, #0x16
	ldr r1, [r4, r1]
	lsr r6, r6, #9
	tst r1, r6
	bne _0224E066
	ldr r1, [r4, #0x64]
	cmp r2, r1
	beq _0224E066
	sub r0, #0x24
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _0224E066
	mov r0, #0x1c
	mul r0, r2
	add r2, r4, r0
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _0224E044
	add r0, #8
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0224E066
_0224E044:
	ldr r0, _0224E074 ; =0x00002D59
	add r1, r4, r0
	ldrsb r0, [r1, r5]
	cmp r0, #0xc
	bge _0224E066
	add r0, r0, #1
	strb r0, [r1, r5]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xf5
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r3, #1
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_0224E066:
	add r0, r3, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224E06C: .word 0x00002DB0
_0224E070: .word 0x0000216C
_0224E074: .word 0x00002D59
	thumb_func_end ov12_0224DFEC

	thumb_func_start ov12_0224E078
ov12_0224E078: ; 0x0224E078
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r1, [r5, #0x64]
	str r0, [sp]
	add r0, r5, #0
	mov r4, #0
	bl ov12_02255830
	add r7, r0, #0
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	add r2, r4, #0
	bl ov12_02255844
	add r6, r0, #0
	ldr r0, [r5, #0x6c]
	cmp r0, #0xff
	beq _0224E116
	cmp r7, #0x38
	bne _0224E116
	ldr r1, _0224E11C ; =0x0000216C
	ldr r2, [r5, r1]
	ldr r1, _0224E120 ; =0x801FDA49
	tst r1, r2
	bne _0224E116
	mov r1, #0x1c
	mul r1, r0
	mov r0, #0xb6
	add r2, r5, r1
	lsl r0, r0, #2
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _0224E0C2
	add r0, #8
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0224E116
_0224E0C2:
	ldr r0, [sp]
	bl ov12_0223BD98
	mov r1, #0x64
	bl _s32_div_f
	cmp r1, r6
	bge _0224E116
	ldr r0, _0224E124 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0224E128 ; =0x000003E9
	ldrb r1, [r1, r0]
	mov r0, #0x20
	tst r0, r1
	beq _0224E116
	ldr r0, [r5, #0x6c]
	mov r1, #0xc0
	mul r1, r0
	add r2, r5, r1
	ldr r1, _0224E12C ; =0x00002D8C
	ldr r1, [r2, r1]
	cmp r1, #0
	beq _0224E116
	add r1, r5, #0
	add r1, #0x94
	str r0, [r1]
	add r0, r5, #0
	mov r1, #2
	add r0, #0x88
	str r1, [r0]
	add r0, r5, #0
	mov r1, #1
	mov r2, #0xe
	bl ReadBattleScriptFromNarc
	ldr r0, [r5, #8]
	mov r4, #1
	str r0, [r5, #0xc]
	mov r0, #0x16
	str r0, [r5, #8]
_0224E116:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224E11C: .word 0x0000216C
_0224E120: .word 0x801FDA49
_0224E124: .word 0x00003044
_0224E128: .word 0x000003E9
_0224E12C: .word 0x00002D8C
	thumb_func_end ov12_0224E078

	thumb_func_start ov12_0224E130
ov12_0224E130: ; 0x0224E130
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r7, [r5, #0x5c]
	str r0, [sp]
	mov r6, #0
	bl ov12_0223A7F0
	cmp r7, r0
	bge _0224E1A0
	add r4, r5, #0
	add r4, #0x5c
_0224E146:
	mov r0, #0xc0
	mul r0, r7
	mov r1, #0xb7
	add r0, r5, r0
	lsl r1, r1, #6
	ldr r2, [r0, r1]
	ldr r1, _0224E1AC ; =0x200400C0
	tst r1, r2
	bne _0224E18A
	ldr r1, _0224E1B0 ; =0x00002DC4
	ldr r2, [r0, r1]
	ldr r1, _0224E1AC ; =0x200400C0
	tst r1, r2
	beq _0224E18A
	ldr r1, _0224E1B0 ; =0x00002DC4
	ldr r2, [r0, r1]
	ldr r1, _0224E1B4 ; =0xDFFBFF3F
	and r2, r1
	ldr r1, _0224E1B0 ; =0x00002DC4
	str r2, [r0, r1]
	ldr r2, _0224E1B8 ; =0x0000011F
	add r0, r5, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	mov r0, #0x46
	ldr r1, [r5, #0x5c]
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [r5, #8]
	mov r6, #1
	str r0, [r5, #0xc]
	mov r0, #0x16
	str r0, [r5, #8]
_0224E18A:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	cmp r6, #1
	beq _0224E1A0
	ldr r0, [sp]
	ldr r7, [r5, #0x5c]
	bl ov12_0223A7F0
	cmp r7, r0
	blt _0224E146
_0224E1A0:
	cmp r6, #0
	bne _0224E1A8
	mov r0, #0
	str r0, [r5, #0x5c]
_0224E1A8:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224E1AC: .word 0x200400C0
_0224E1B0: .word 0x00002DC4
_0224E1B4: .word 0xDFFBFF3F
_0224E1B8: .word 0x0000011F
	thumb_func_end ov12_0224E130

	thumb_func_start ov12_0224E1BC
ov12_0224E1BC: ; 0x0224E1BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	mov r6, #0
	bl ov12_0223A7F0
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl ov12_02255830
	str r0, [sp, #4]
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	add r2, r6, #0
	bl ov12_02255844
	ldr r1, [r4, #8]
	str r0, [sp]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #1
	bl ov12_0224DC74
	cmp r0, #1
	bne _0224E1F4
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224E1F4:
	add r5, r4, #0
	add r5, #0x30
_0224E1F8:
	ldr r0, [r4, #0x30]
	cmp r0, #3
	bls _0224E200
	b _0224E350
_0224E200:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224E20C: ; jump table
	.short _0224E214 - _0224E20C - 2 ; case 0
	.short _0224E244 - _0224E20C - 2 ; case 1
	.short _0224E2C4 - _0224E20C - 2 ; case 2
	.short _0224E348 - _0224E20C - 2 ; case 3
_0224E214:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _0224E368 ; =0x00002DB0
	add r0, r4, r0
	ldr r2, [r0, r1]
	mov r1, #2
	lsl r1, r1, #0x16
	tst r1, r2
	beq _0224E23C
	ldr r1, _0224E36C ; =0x00003044
	ldr r1, [r4, r1]
	cmp r1, #0x63
	beq _0224E23C
	ldr r1, _0224E368 ; =0x00002DB0
	ldr r2, [r0, r1]
	ldr r1, _0224E370 ; =0xFF7FFFFF
	and r2, r1
	ldr r1, _0224E368 ; =0x00002DB0
	str r2, [r0, r1]
_0224E23C:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224E350
_0224E244:
	ldr r3, [r4, #0x6c]
	cmp r3, #0xff
	beq _0224E2BC
	ldr r0, [sp, #4]
	cmp r0, #0x58
	bne _0224E2BC
	mov r0, #0x85
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #0x10
	tst r0, r1
	bne _0224E2BC
	ldr r0, _0224E374 ; =0x0000213C
	ldr r1, [r4, r0]
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r1
	beq _0224E2BC
	ldr r2, [r4, #0x64]
	mov r0, #0x1c
	mul r0, r2
	add r1, r4, r0
	mov r0, #0xbb
	lsl r0, r0, #2
	ldr r7, [r1, r0]
	cmp r7, #0
	beq _0224E2BC
	cmp r2, r3
	beq _0224E2BC
	mov r0, #0xc0
	mul r0, r2
	add r2, r4, r0
	ldr r0, _0224E378 ; =0x00002D8C
	ldr r1, [r2, r0]
	add r0, r0, #4
	ldr r0, [r2, r0]
	cmp r1, r0
	bhs _0224E2BC
	cmp r1, #0
	beq _0224E2BC
	ldr r1, [sp]
	neg r0, r7
	bl ov12_02253178
	ldr r1, _0224E37C ; =0x0000215C
	mov r2, #0xd5
	str r0, [r4, r1]
	mov r0, #0x46
	ldr r1, [r4, #0x64]
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r6, #1
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_0224E2BC:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224E350
_0224E2C4:
	ldr r0, [sp, #4]
	cmp r0, #0x62
	bne _0224E340
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x62
	beq _0224E340
	mov r0, #0x85
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #0x10
	tst r0, r1
	bne _0224E340
	ldr r0, _0224E374 ; =0x0000213C
	ldr r1, [r4, r0]
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r1
	beq _0224E340
	ldr r0, _0224E36C ; =0x00003044
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r4, r0
	mov r0, #0x3e
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #2
	beq _0224E340
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _0224E378 ; =0x00002D8C
	add r0, r4, r0
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _0224E340
	ldr r1, _0224E380 ; =0x00002D90
	ldr r1, [r0, r1]
	mov r0, #0
	mvn r0, r0
	mul r0, r1
	mov r1, #0xa
	bl ov12_02253178
	ldr r1, _0224E37C ; =0x0000215C
	mov r2, #0xd6
	str r0, [r4, r1]
	mov r0, #0x46
	ldr r1, [r4, #0x64]
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r6, #1
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_0224E340:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224E350
_0224E348:
	mov r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	mov r6, #2
_0224E350:
	cmp r6, #0
	bne _0224E356
	b _0224E1F8
_0224E356:
	cmp r6, #1
	bne _0224E360
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224E360:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224E368: .word 0x00002DB0
_0224E36C: .word 0x00003044
_0224E370: .word 0xFF7FFFFF
_0224E374: .word 0x0000213C
_0224E378: .word 0x00002D8C
_0224E37C: .word 0x0000215C
_0224E380: .word 0x00002D90
	thumb_func_end ov12_0224E1BC

	thumb_func_start ov12_0224E384
ov12_0224E384: ; 0x0224E384
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r1, [sp, #4]
	str r0, [sp]
	bl ov12_0223A7E0
	mov r2, #0xd5
	add r4, r0, #0
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	add r1, r1, r2
	ldr r2, _0224E404 ; =0x00001DE0
	mov r0, #0
	bl MIi_CpuClear32
	mov r0, #1
	tst r0, r4
	beq _0224E3F8
	mov r0, #0xb9
	lsl r0, r0, #2
	tst r0, r4
	bne _0224E3F8
	mov r6, #0
_0224E3B2:
	mov r0, #1
	tst r0, r6
	beq _0224E3F2
	asr r2, r6, #1
	ldr r0, [sp, #4]
	lsl r1, r2, #3
	mov r4, #0
	add r7, r0, r1
	add r5, r0, r2
_0224E3C4:
	ldr r0, [sp]
	add r1, r6, #0
	add r2, r4, #0
	bl ov12_0223BFDC
	cmp r0, #0
	beq _0224E3EC
	ldr r1, _0224E408 ; =0x000003CD
	ldrb r1, [r5, r1]
	lsl r1, r1, #1
	add r2, r7, r1
	mov r1, #0xe7
	lsl r1, r1, #2
	strh r0, [r2, r1]
	add r0, r1, #0
	add r0, #0x31
	ldrb r0, [r5, r0]
	add r1, r0, #1
	ldr r0, _0224E408 ; =0x000003CD
	strb r1, [r5, r0]
_0224E3EC:
	add r4, r4, #1
	cmp r4, #4
	blt _0224E3C4
_0224E3F2:
	add r6, r6, #1
	cmp r6, #4
	blt _0224E3B2
_0224E3F8:
	ldr r2, _0224E40C ; =ov10_02220AAC
	ldr r1, _0224E410 ; =0x00002134
	ldr r0, [sp, #4]
	str r2, [r0, r1]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224E404: .word 0x00001DE0
_0224E408: .word 0x000003CD
_0224E40C: .word ov10_02220AAC
_0224E410: .word 0x00002134
	thumb_func_end ov12_0224E384

	thumb_func_start ov12_0224E414
ov12_0224E414: ; 0x0224E414
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	str r1, [sp]
	bl ov12_0223A7F0
	mov r4, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _0224E4E8
	ldr r5, [sp]
_0224E42A:
	ldr r0, _0224E4EC ; =0x000021A8
	ldr r2, [r5, r0]
	cmp r2, #0x28
	beq _0224E4DE
	ldr r0, [sp]
	add r7, r0, r4
	ldr r0, _0224E4F0 ; =0x0000314C
	ldrb r1, [r7, r0]
	mov r0, #1
	tst r0, r1
	beq _0224E44E
	sub r2, #0xc
	lsl r2, r2, #0x18
	add r0, r6, #0
	add r1, r4, #0
	lsr r2, r2, #0x18
	bl ov12_0223BDDC
_0224E44E:
	ldr r0, _0224E4EC ; =0x000021A8
	ldr r0, [r5, r0]
	sub r0, #0xd
	cmp r0, #3
	bhi _0224E4DE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224E464: ; jump table
	.short _0224E46C - _0224E464 - 2 ; case 0
	.short _0224E4A4 - _0224E464 - 2 ; case 1
	.short _0224E4C0 - _0224E464 - 2 ; case 2
	.short _0224E4D4 - _0224E464 - 2 ; case 3
_0224E46C:
	ldr r0, _0224E4F0 ; =0x0000314C
	ldrb r1, [r7, r0]
	mov r0, #2
	tst r0, r1
	beq _0224E486
	ldr r2, _0224E4F4 ; =0x000021B0
	add r0, r6, #0
	ldr r2, [r5, r2]
	add r1, r4, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl ov12_0223BDDC
_0224E486:
	ldr r0, _0224E4F0 ; =0x0000314C
	ldrb r1, [r7, r0]
	mov r0, #4
	tst r0, r1
	beq _0224E4DE
	ldr r2, _0224E4F8 ; =0x000021AC
	add r0, r6, #0
	ldr r2, [r5, r2]
	add r1, r4, #0
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl ov12_0223BDDC
	b _0224E4DE
_0224E4A4:
	ldr r2, _0224E4F4 ; =0x000021B0
	add r0, r6, #0
	ldr r2, [r5, r2]
	add r1, r4, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl ov12_0223BDDC
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0
	bl ov12_0223BDDC
	b _0224E4DE
_0224E4C0:
	ldr r2, _0224E4F4 ; =0x000021B0
	add r0, r6, #0
	ldr r2, [r5, r2]
	add r1, r4, #0
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl ov12_0223BDDC
	b _0224E4DE
_0224E4D4:
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #1
	bl ov12_0223BDDC
_0224E4DE:
	ldr r0, [sp, #4]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	blt _0224E42A
_0224E4E8:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224E4EC: .word 0x000021A8
_0224E4F0: .word 0x0000314C
_0224E4F4: .word 0x000021B0
_0224E4F8: .word 0x000021AC
	thumb_func_end ov12_0224E414

	thumb_func_start ov12_0224E4FC
ov12_0224E4FC: ; 0x0224E4FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r7, r1, #0
	str r2, [sp, #4]
	add r1, r2, #0
	add r2, r3, #0
	str r0, [sp]
	bl ov12_0223A880
	ldr r1, [sp, #4]
	mov r2, #0xc0
	add r5, r1, #0
	mov r1, #0xb5
	lsl r1, r1, #6
	add r1, r7, r1
	mul r5, r2
	str r1, [sp, #0x18]
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	ldr r1, [sp, #0x18]
	mov r2, #0
	strh r0, [r1, r5]
	add r0, r4, #0
	mov r1, #0xa5
	bl GetMonData
	ldr r1, _0224E8B4 ; =0x00002D42
	add r2, r7, r5
	strh r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa6
	mov r2, #0
	bl GetMonData
	ldr r1, _0224E8B8 ; =0x00002D44
	add r2, r7, r5
	strh r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa7
	mov r2, #0
	bl GetMonData
	ldr r1, _0224E8BC ; =0x00002D46
	add r2, r7, r5
	strh r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa8
	mov r2, #0
	bl GetMonData
	ldr r1, _0224E8C0 ; =0x00002D48
	add r2, r7, r5
	strh r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa9
	mov r2, #0
	bl GetMonData
	add r1, r7, r5
	ldr r2, _0224E8C4 ; =0x00002D4A
	str r1, [sp, #0xc]
	strh r0, [r1, r2]
	add r0, r1, #0
	mov r6, #0
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
_0224E586:
	add r1, r6, #0
	add r0, r4, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	ldr r2, [sp, #0x14]
	ldr r1, _0224E8C8 ; =0x00002D4C
	strh r0, [r2, r1]
	add r1, r6, #0
	add r0, r4, #0
	add r1, #0x3a
	mov r2, #0
	bl GetMonData
	ldr r2, [sp, #0x10]
	ldr r1, _0224E8CC ; =0x00002D6C
	strb r0, [r2, r1]
	add r1, r6, #0
	add r0, r4, #0
	add r1, #0x3e
	mov r2, #0
	bl GetMonData
	ldr r2, [sp, #0x10]
	ldr r1, _0224E8D0 ; =0x00002D70
	add r6, r6, #1
	strb r0, [r2, r1]
	ldr r0, [sp, #0x14]
	add r0, r0, #2
	str r0, [sp, #0x14]
	add r0, r2, #0
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r6, #4
	blt _0224E586
	add r0, r1, #0
	sub r0, #0x1c
	add r6, r7, r0
	add r0, r4, #0
	mov r1, #0x46
	mov r2, #0
	bl GetMonData
	ldr r1, [r6, r5]
	mov r2, #0x1f
	bic r1, r2
	mov r2, #0x1f
	and r0, r2
	orr r0, r1
	str r0, [r6, r5]
	add r0, r4, #0
	mov r1, #0x47
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x1b
	ldr r2, [r6, r5]
	ldr r1, _0224E8D4 ; =0xFFFFFC1F
	lsr r0, r0, #0x16
	and r1, r2
	orr r0, r1
	str r0, [r6, r5]
	add r0, r4, #0
	mov r1, #0x48
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x1b
	ldr r2, [r6, r5]
	ldr r1, _0224E8D8 ; =0xFFFF83FF
	lsr r0, r0, #0x11
	and r1, r2
	orr r0, r1
	str r0, [r6, r5]
	add r0, r4, #0
	mov r1, #0x49
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x1b
	ldr r2, [r6, r5]
	ldr r1, _0224E8DC ; =0xFFF07FFF
	lsr r0, r0, #0xc
	and r1, r2
	orr r0, r1
	str r0, [r6, r5]
	add r0, r4, #0
	mov r1, #0x4a
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x1b
	ldr r2, [r6, r5]
	ldr r1, _0224E8E0 ; =0xFE0FFFFF
	lsr r0, r0, #7
	and r1, r2
	orr r0, r1
	str r0, [r6, r5]
	add r0, r4, #0
	mov r1, #0x4b
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x1b
	ldr r2, [r6, r5]
	ldr r1, _0224E8E4 ; =0xC1FFFFFF
	lsr r0, r0, #2
	and r1, r2
	orr r0, r1
	str r0, [r6, r5]
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	ldr r2, [r6, r5]
	ldr r1, _0224E8E8 ; =0xBFFFFFFF
	lsl r0, r0, #0x1f
	and r1, r2
	lsr r0, r0, #1
	orr r0, r1
	str r0, [r6, r5]
	add r0, r4, #0
	mov r1, #0x4d
	mov r2, #0
	bl GetMonData
	ldr r2, [r6, r5]
	ldr r1, _0224E8EC ; =0x7FFFFFFF
	lsl r0, r0, #0x1f
	and r1, r2
	orr r0, r1
	str r0, [r6, r5]
	ldr r0, _0224E8F0 ; =0x0000213C
	ldr r1, [r7, r0]
	mov r0, #1
	lsl r0, r0, #8
	tst r0, r1
	bne _0224E6B2
	ldr r0, _0224E8F4 ; =0x00002D58
	mov r2, #0
	mov r1, #6
_0224E6A4:
	ldr r3, [sp, #0xc]
	add r2, r2, #1
	strb r1, [r3, r0]
	add r3, r3, #1
	str r3, [sp, #0xc]
	cmp r2, #8
	blt _0224E6A4
_0224E6B2:
	ldr r0, _0224E8F8 ; =0x00002D68
	mov r1, #1
	add r0, r7, r0
	ldr r2, [r0, r5]
	bic r2, r1
	str r2, [r0, r5]
	ldr r2, [r0, r5]
	mov r1, #2
	bic r2, r1
	str r2, [r0, r5]
	ldr r2, [r0, r5]
	mov r1, #4
	bic r2, r1
	str r2, [r0, r5]
	ldr r2, [r0, r5]
	mov r1, #8
	bic r2, r1
	str r2, [r0, r5]
	ldr r2, [r0, r5]
	mov r1, #0x10
	bic r2, r1
	str r2, [r0, r5]
	ldr r2, [r0, r5]
	mov r1, #0x20
	bic r2, r1
	str r2, [r0, r5]
	ldr r2, [r0, r5]
	mov r1, #0x40
	bic r2, r1
	str r2, [r0, r5]
	ldr r2, [r0, r5]
	mov r1, #0x80
	bic r2, r1
	str r2, [r0, r5]
	ldr r2, [r0, r5]
	ldr r1, _0224E8FC ; =0xFFFFFEFF
	and r1, r2
	str r1, [r0, r5]
	ldr r2, [r0, r5]
	ldr r1, _0224E900 ; =0xFFFFFDFF
	and r1, r2
	str r1, [r0, r5]
	ldr r2, [r0, r5]
	ldr r1, _0224E904 ; =0xFFFFFBFF
	and r1, r2
	str r1, [r0, r5]
	add r0, r4, #0
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	ldr r1, _0224E908 ; =0x00002D64
	add r2, r7, r5
	strb r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	ldr r1, _0224E90C ; =0x00002D65
	add r2, r7, r5
	strb r0, [r2, r1]
	add r1, #0x59
	add r0, r7, r1
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl GetMonGender
	ldr r1, [sp, #0x1c]
	mov r2, #0xf
	ldrb r1, [r1, r5]
	bic r1, r2
	mov r2, #0xf
	and r0, r2
	orr r1, r0
	ldr r0, [sp, #0x1c]
	strb r1, [r0, r5]
	ldr r0, _0224E910 ; =0x00002D66
	add r0, r7, r0
	str r0, [sp, #0x20]
	add r0, r4, #0
	bl MonIsShiny
	ldr r1, [sp, #0x20]
	lsl r0, r0, #0x1f
	ldrb r1, [r1, r5]
	mov r2, #0x20
	lsr r0, r0, #0x1a
	bic r1, r2
	orr r1, r0
	ldr r0, [sp, #0x20]
	strb r1, [r0, r5]
	ldr r0, [sp]
	bl ov12_0223A7E0
	mov r1, #0x22
	lsl r1, r1, #4
	tst r0, r1
	beq _0224E792
	ldr r2, _0224E914 ; =0x00002D67
	mov r0, #0
	add r3, r7, r5
	add r1, r2, #0
	strb r0, [r3, r2]
	add r2, #0x51
	add r1, #0x45
	add r2, r7, r2
	str r0, [r3, r1]
	add r1, r2, r5
	str r1, [sp, #8]
	strh r0, [r2, r5]
	b _0224E7C6
_0224E792:
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	ldr r1, _0224E914 ; =0x00002D67
	add r2, r7, r5
	strb r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	ldr r1, _0224E918 ; =0x00002DAC
	add r2, r7, r5
	str r0, [r2, r1]
	add r1, #0xc
	add r6, r7, r1
	add r0, r6, r5
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r6, r5]
_0224E7C6:
	ldr r0, [sp]
	bl ov12_0223A7E0
	mov r1, #0x22
	lsl r1, r1, #4
	tst r0, r1
	beq _0224E7EE
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ov12_0223AB1C
	cmp r0, #0
	bne _0224E7EE
	ldr r0, [sp, #0x20]
	ldrb r1, [r0, r5]
	mov r0, #0x1f
	bic r1, r0
	ldr r0, [sp, #0x20]
	strb r1, [r0, r5]
	b _0224E80E
_0224E7EE:
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x20]
	mov r2, #0x1f
	ldrb r1, [r1, r5]
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #0x1f
	and r0, r2
	orr r1, r0
	ldr r0, [sp, #0x20]
	strb r1, [r0, r5]
_0224E80E:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	add r6, r0, #0
	mul r6, r1
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	ldr r1, _0224E91C ; =0x00002D74
	add r2, r7, r6
	strb r0, [r2, r1]
	add r0, r4, #0
	mov r1, #9
	mov r2, #0
	bl GetMonData
	ldr r1, _0224E920 ; =0x00002D75
	add r2, r7, r6
	strb r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	ldr r1, _0224E924 ; =0x00002D8C
	add r2, r7, r6
	str r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	ldr r1, _0224E928 ; =0x00002D90
	add r2, r7, r6
	str r0, [r2, r1]
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	bl GetMonData
	ldr r1, _0224E92C ; =0x00002DA4
	add r2, r7, r6
	str r0, [r2, r1]
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl GetMonData
	ldr r1, _0224E930 ; =0x00002DA8
	add r2, r7, r6
	str r0, [r2, r1]
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	ldr r1, _0224E934 ; =0x00002DB4
	add r2, r7, r6
	str r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0x9d
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1c
	ldrb r1, [r1, r5]
	mov r2, #0xf0
	lsr r0, r0, #0x18
	bic r1, r2
	orr r1, r0
	ldr r0, [sp, #0x1c]
	strb r1, [r0, r5]
	ldr r0, [sp]
	add r1, r4, #0
	bl ov12_0223AA88
	ldr r1, _0224E938 ; =0x00002DBF
	b _0224E93C
	nop
_0224E8B4: .word 0x00002D42
_0224E8B8: .word 0x00002D44
_0224E8BC: .word 0x00002D46
_0224E8C0: .word 0x00002D48
_0224E8C4: .word 0x00002D4A
_0224E8C8: .word 0x00002D4C
_0224E8CC: .word 0x00002D6C
_0224E8D0: .word 0x00002D70
_0224E8D4: .word 0xFFFFFC1F
_0224E8D8: .word 0xFFFF83FF
_0224E8DC: .word 0xFFF07FFF
_0224E8E0: .word 0xFE0FFFFF
_0224E8E4: .word 0xC1FFFFFF
_0224E8E8: .word 0xBFFFFFFF
_0224E8EC: .word 0x7FFFFFFF
_0224E8F0: .word 0x0000213C
_0224E8F4: .word 0x00002D58
_0224E8F8: .word 0x00002D68
_0224E8FC: .word 0xFFFFFEFF
_0224E900: .word 0xFFFFFDFF
_0224E904: .word 0xFFFFFBFF
_0224E908: .word 0x00002D64
_0224E90C: .word 0x00002D65
_0224E910: .word 0x00002D66
_0224E914: .word 0x00002D67
_0224E918: .word 0x00002DAC
_0224E91C: .word 0x00002D74
_0224E920: .word 0x00002D75
_0224E924: .word 0x00002D8C
_0224E928: .word 0x00002D90
_0224E92C: .word 0x00002DA4
_0224E930: .word 0x00002DA8
_0224E934: .word 0x00002DB4
_0224E938: .word 0x00002DBF
_0224E93C:
	add r2, r7, r6
	strb r0, [r2, r1]
	ldr r0, [sp, #0x20]
	ldrb r0, [r0, r5]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1b
	bl SetDexBanksByGiratinaForme
	mov r0, #5
	bl ZknData_Create
	mov r1, #0
	mov r2, #5
	str r0, [sp, #0x24]
	bl ZknData_LoadAll
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x24]
	ldrh r1, [r1, r5]
	bl ZknData_GetWeight
	ldr r1, _0224E9F8 ; =0x00002D60
	add r2, r7, r6
	str r0, [r2, r1]
	ldr r0, [sp, #0x24]
	bl ZknData_UnloadAll
	ldr r0, [sp, #0x24]
	bl ZknData_Delete
	ldr r2, _0224E9FC ; =0x00002D76
	add r0, r4, #0
	add r2, r7, r2
	mov r1, #0x75
	add r2, r2, r6
	bl GetMonData
	ldr r2, _0224EA00 ; =0x00002D94
	add r0, r4, #0
	add r2, r7, r2
	mov r1, #0x90
	add r2, r2, r6
	bl GetMonData
	ldr r0, _0224EA04 ; =0x00002DBC
	mov r2, #0
	add r1, r7, r6
	strb r2, [r1, r0]
	add r0, r0, #1
	strb r2, [r1, r0]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ov12_0223AB1C
	add r4, r0, #0
	ldr r0, [sp, #4]
	add r1, r7, r0
	ldr r0, _0224EA08 ; =0x0000219C
	ldrb r0, [r1, r0]
	bl MaskOfFlagNo
	lsl r1, r4, #3
	add r2, r7, r1
	mov r1, #0x71
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	lsl r1, r1, #3
	lsr r1, r1, #0x1a
	tst r0, r1
	beq _0224E9DE
	ldr r0, [sp, #8]
	mov r1, #0
	strh r1, [r0]
	ldr r0, _0224EA0C ; =0x00002DCC
	add sp, #0x28
	add r2, r7, r0
	ldr r1, [r2, r5]
	ldr r0, _0224EA10 ; =0xFFBFFFFF
	and r0, r1
	str r0, [r2, r5]
	pop {r3, r4, r5, r6, r7, pc}
_0224E9DE:
	ldr r0, [sp, #8]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0224E9F4
	ldr r0, _0224EA0C ; =0x00002DCC
	add r2, r7, r0
	mov r0, #1
	ldr r1, [r2, r5]
	lsl r0, r0, #0x16
	orr r0, r1
	str r0, [r2, r5]
_0224E9F4:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224E9F8: .word 0x00002D60
_0224E9FC: .word 0x00002D76
_0224EA00: .word 0x00002D94
_0224EA04: .word 0x00002DBC
_0224EA08: .word 0x0000219C
_0224EA0C: .word 0x00002DCC
_0224EA10: .word 0xFFBFFFFF
	thumb_func_end ov12_0224E4FC

	thumb_func_start ov12_0224EA14
ov12_0224EA14: ; 0x0224EA14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r2, #0
	str r1, [sp]
	add r1, r5, #0
	add r2, r3, #0
	bl ov12_0223A880
	mov r1, #0xc0
	mul r1, r5
	str r1, [sp, #4]
	mov r1, #0xa5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add r2, r2, r1
	ldr r1, _0224EB68 ; =0x00002D42
	strh r0, [r2, r1]
	add r0, r6, #0
	mov r1, #0xa6
	mov r2, #0
	bl GetMonData
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add r2, r2, r1
	ldr r1, _0224EB6C ; =0x00002D44
	strh r0, [r2, r1]
	add r0, r6, #0
	mov r1, #0xa7
	mov r2, #0
	bl GetMonData
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add r2, r2, r1
	ldr r1, _0224EB70 ; =0x00002D46
	strh r0, [r2, r1]
	add r0, r6, #0
	mov r1, #0xa8
	mov r2, #0
	bl GetMonData
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add r2, r2, r1
	ldr r1, _0224EB74 ; =0x00002D48
	strh r0, [r2, r1]
	add r0, r6, #0
	mov r1, #0xa9
	mov r2, #0
	bl GetMonData
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add r2, r2, r1
	ldr r1, _0224EB78 ; =0x00002D4A
	strh r0, [r2, r1]
	add r0, r6, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add r2, r2, r1
	ldr r1, _0224EB7C ; =0x00002D74
	strb r0, [r2, r1]
	add r0, r6, #0
	mov r1, #9
	mov r2, #0
	bl GetMonData
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add r2, r2, r1
	ldr r1, _0224EB80 ; =0x00002D75
	strb r0, [r2, r1]
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add r2, r2, r1
	ldr r1, _0224EB84 ; =0x00002D8C
	str r0, [r2, r1]
	add r0, r6, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add r2, r2, r1
	ldr r1, _0224EB88 ; =0x00002D90
	str r0, [r2, r1]
	add r0, r1, #0
	add r0, #0x20
	ldr r2, [r2, r0]
	mov r0, #2
	lsl r0, r0, #0x14
	tst r0, r2
	bne _0224EB64
	mov r0, #0xc0
	mul r0, r5
	ldr r2, [sp]
	str r0, [sp, #8]
	add r7, r2, r0
	add r1, #0x3c
	add r0, r2, #0
	add r0, r0, r1
	mov r4, #0
	add r5, r7, #0
	str r0, [sp, #0xc]
_0224EB02:
	add r0, r4, #0
	bl MaskOfFlagNo
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #8]
	ldr r1, [r2, r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1c
	tst r0, r1
	bne _0224EB46
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	ldr r1, _0224EB8C ; =0x00002D4C
	mov r2, #0
	strh r0, [r7, r1]
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x3a
	bl GetMonData
	ldr r1, _0224EB90 ; =0x00002D6C
	mov r2, #0
	strb r0, [r5, r1]
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x3e
	bl GetMonData
	ldr r1, _0224EB94 ; =0x00002D70
	strb r0, [r5, r1]
_0224EB46:
	add r4, r4, #1
	add r7, r7, #2
	add r5, r5, #1
	cmp r4, #4
	blt _0224EB02
	add r0, r6, #0
	mov r1, #8
	mov r2, #0
	bl GetMonData
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add r2, r2, r1
	ldr r1, _0224EB98 ; =0x00002DA4
	str r0, [r2, r1]
_0224EB64:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224EB68: .word 0x00002D42
_0224EB6C: .word 0x00002D44
_0224EB70: .word 0x00002D46
_0224EB74: .word 0x00002D48
_0224EB78: .word 0x00002D4A
_0224EB7C: .word 0x00002D74
_0224EB80: .word 0x00002D75
_0224EB84: .word 0x00002D8C
_0224EB88: .word 0x00002D90
_0224EB8C: .word 0x00002D4C
_0224EB90: .word 0x00002D6C
_0224EB94: .word 0x00002D70
_0224EB98: .word 0x00002DA4
	thumb_func_end ov12_0224EA14

	thumb_func_start ReadBattleScriptFromNarc
ReadBattleScriptFromNarc: ; 0x0224EB9C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r2, #0
	add r5, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl GetNarcMemberSizeByIdPair
	mov r1, #0x19
	lsl r1, r1, #6
	cmp r0, r1
	blo _0224EBB8
	bl GF_AssertFail
_0224EBB8:
	add r0, r5, #0
	add r0, #0xac
	str r4, [r0]
	add r0, r5, #0
	add r0, #0xb0
	str r6, [r0]
	add r0, r5, #0
	mov r1, #0
	add r0, #0xb4
	str r1, [r0]
	mov r0, #0x27
	lsl r0, r0, #8
	add r0, r5, r0
	add r1, r4, #0
	add r2, r6, #0
	bl ReadWholeNarcMemberByIdPair
	pop {r4, r5, r6, pc}
	thumb_func_end ReadBattleScriptFromNarc

	thumb_func_start ov12_0224EBDC
ov12_0224EBDC: ; 0x0224EBDC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r2, #0
	add r5, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl GetNarcMemberSizeByIdPair
	mov r1, #0x19
	lsl r1, r1, #6
	cmp r0, r1
	blo _0224EBF8
	bl GF_AssertFail
_0224EBF8:
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	cmp r0, #4
	blt _0224EC06
	bl GF_AssertFail
_0224EC06:
	add r1, r5, #0
	add r1, #0xb8
	ldr r1, [r1]
	add r0, r5, #0
	add r0, #0xac
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r0, [r0]
	add r1, #0xbc
	str r0, [r1]
	add r1, r5, #0
	add r1, #0xb8
	ldr r1, [r1]
	add r0, r5, #0
	add r0, #0xb0
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r0, [r0]
	add r1, #0xcc
	str r0, [r1]
	add r1, r5, #0
	add r1, #0xb8
	ldr r1, [r1]
	add r0, r5, #0
	add r0, #0xb4
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r0, [r0]
	add r1, #0xdc
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	add r2, r6, #0
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0xb8
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xac
	str r4, [r0]
	add r0, r5, #0
	add r0, #0xb0
	str r6, [r0]
	add r0, r5, #0
	mov r1, #0
	add r0, #0xb4
	str r1, [r0]
	mov r0, #0x27
	lsl r0, r0, #8
	add r0, r5, r0
	add r1, r4, #0
	bl ReadWholeNarcMemberByIdPair
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0224EBDC

	thumb_func_start ov12_0224EC74
ov12_0224EC74: ; 0x0224EC74
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xb8
	ldr r1, [r1]
	cmp r1, #0
	beq _0224ECBE
	add r1, r4, #0
	add r1, #0xb8
	ldr r1, [r1]
	sub r2, r1, #1
	add r1, r4, #0
	add r1, #0xb8
	str r2, [r1]
	add r1, r4, #0
	add r1, #0xb8
	ldr r1, [r1]
	lsl r2, r1, #2
	add r1, r4, r2
	add r2, r4, r2
	add r1, #0xbc
	add r2, #0xcc
	ldr r1, [r1]
	ldr r2, [r2]
	bl ReadBattleScriptFromNarc
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	lsl r0, r0, #2
	add r0, r4, r0
	add r0, #0xdc
	ldr r0, [r0]
	add r4, #0xb4
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
_0224ECBE:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0224EC74

	thumb_func_start ov12_0224ECC4
ov12_0224ECC4: ; 0x0224ECC4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	lsl r0, r1, #6
	lsl r6, r2, #4
	add r1, r4, r0
	add r5, r1, r6
	mov r1, #0x22
	add r7, r3, #0
	mov r3, #0
	lsl r1, r1, #8
_0224ECD8:
	ldrb r2, [r5, r1]
	cmp r2, #0
	bne _0224ECEC
	add r0, r4, r0
	add r0, r0, r6
	add r1, r0, r3
	mov r0, #0x22
	lsl r0, r0, #8
	strb r7, [r1, r0]
	b _0224ECF4
_0224ECEC:
	add r3, r3, #1
	add r5, r5, #1
	cmp r3, #0x10
	blt _0224ECD8
_0224ECF4:
	cmp r3, #0x10
	blt _0224ECFC
	bl GF_AssertFail
_0224ECFC:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0224ECC4

	thumb_func_start ov12_0224ED00
ov12_0224ED00: ; 0x0224ED00
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	str r2, [sp]
	add r4, r3, #0
	bne _0224ED10
	bl GF_AssertFail
_0224ED10:
	ldr r0, [sp]
	lsl r6, r5, #6
	lsl r5, r0, #4
	add r0, r7, r6
	add r3, r0, r5
	mov r0, #0x22
	mov r2, #0
	lsl r0, r0, #8
_0224ED20:
	ldrb r1, [r3, r0]
	cmp r4, r1
	bne _0224ED36
	add r1, r7, r6
	add r1, r1, r5
	add r3, r1, r2
	mov r1, #0x22
	mov r0, #0
	lsl r1, r1, #8
	strb r0, [r3, r1]
	b _0224ED3E
_0224ED36:
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, #0x10
	blt _0224ED20
_0224ED3E:
	cmp r2, #0x10
	blt _0224ED46
	bl GF_AssertFail
_0224ED46:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_0224ED00

	thumb_func_start ov12_0224ED48
ov12_0224ED48: ; 0x0224ED48
	push {r3, r4, r5, r6, r7, lr}
	mov r2, #0
	mov r4, #0x22
	mov lr, r0
	mov ip, r2
	add r7, r0, #0
	add r6, r2, #0
	lsl r4, r4, #8
_0224ED58:
	mov r0, #0
	add r3, r7, #0
_0224ED5C:
	add r1, r6, #0
_0224ED5E:
	add r5, r3, r1
	ldrb r5, [r5, r4]
	add r1, r1, #1
	add r2, r2, r5
	cmp r1, #0x10
	blt _0224ED5E
	add r0, r0, #1
	add r3, #0x10
	cmp r0, #4
	blt _0224ED5C
	mov r0, ip
	add r0, r0, #1
	add r7, #0x40
	mov ip, r0
	cmp r0, #4
	blt _0224ED58
	cmp r2, #0
	bne _0224ED8A
	ldr r1, _0224ED98 ; =0x00003148
	mov r3, #0
	mov r0, lr
	str r3, [r0, r1]
_0224ED8A:
	cmp r2, #0
	bne _0224ED92
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224ED92:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224ED98: .word 0x00003148
	thumb_func_end ov12_0224ED48

	thumb_func_start ov12_0224ED9C
ov12_0224ED9C: ; 0x0224ED9C
	push {r3, lr}
	ldr r1, _0224EDB8 ; =0x00003148
	ldr r2, [r0, r1]
	add r2, r2, #1
	str r2, [r0, r1]
	ldr r1, [r0, r1]
	ldr r0, _0224EDBC ; =0x00000708
	cmp r1, r0
	ble _0224EDB4
	mov r0, #1
	bl sub_02039AD8
_0224EDB4:
	pop {r3, pc}
	nop
_0224EDB8: .word 0x00003148
_0224EDBC: .word 0x00000708
	thumb_func_end ov12_0224ED9C

	thumb_func_start ov12_0224EDC0
ov12_0224EDC0: ; 0x0224EDC0
	push {r3, r4}
	lsl r1, r1, #8
	add r4, r0, r1
	mov r3, #0
	mov r0, #0x23
	mov r1, #1
	add r2, r3, #0
	lsl r0, r0, #8
	lsl r1, r1, #8
_0224EDD2:
	add r3, r3, #1
	strb r2, [r4, r0]
	add r4, r4, #1
	cmp r3, r1
	blt _0224EDD2
	pop {r3, r4}
	bx lr
	thumb_func_end ov12_0224EDC0

	thumb_func_start ov12_0224EDE0
ov12_0224EDE0: ; 0x0224EDE0
	push {r4, r5, r6, lr}
	mov r4, #0xb5
	lsl r4, r4, #6
	add r5, r0, r4
	mov r6, #0xc0
	add r4, r1, #0
	mul r4, r6
	add r4, r5, r4
	cmp r2, #0x64
	bls _0224EDF6
	b _0224F15E
_0224EDF6:
	add r5, r2, r2
	add r5, pc
	ldrh r5, [r5, #6]
	lsl r5, r5, #0x10
	asr r5, r5, #0x10
	add pc, r5
_0224EE02: ; jump table
	.short _0224EECC - _0224EE02 - 2 ; case 0
	.short _0224EED0 - _0224EE02 - 2 ; case 1
	.short _0224EED4 - _0224EE02 - 2 ; case 2
	.short _0224EED8 - _0224EE02 - 2 ; case 3
	.short _0224EEDC - _0224EE02 - 2 ; case 4
	.short _0224EEE0 - _0224EE02 - 2 ; case 5
	.short _0224EEE4 - _0224EE02 - 2 ; case 6
	.short _0224EEE4 - _0224EE02 - 2 ; case 7
	.short _0224EEE4 - _0224EE02 - 2 ; case 8
	.short _0224EEE4 - _0224EE02 - 2 ; case 9
	.short _0224EEEE - _0224EE02 - 2 ; case 10
	.short _0224EEF6 - _0224EE02 - 2 ; case 11
	.short _0224EEFE - _0224EE02 - 2 ; case 12
	.short _0224EF06 - _0224EE02 - 2 ; case 13
	.short _0224EF0E - _0224EE02 - 2 ; case 14
	.short _0224EF16 - _0224EE02 - 2 ; case 15
	.short _0224EF1E - _0224EE02 - 2 ; case 16
	.short _0224EF26 - _0224EE02 - 2 ; case 17
	.short _0224EF2C - _0224EE02 - 2 ; case 18
	.short _0224EF2C - _0224EE02 - 2 ; case 19
	.short _0224EF2C - _0224EE02 - 2 ; case 20
	.short _0224EF2C - _0224EE02 - 2 ; case 21
	.short _0224EF2C - _0224EE02 - 2 ; case 22
	.short _0224EF2C - _0224EE02 - 2 ; case 23
	.short _0224EF2C - _0224EE02 - 2 ; case 24
	.short _0224EF2C - _0224EE02 - 2 ; case 25
	.short _0224EF36 - _0224EE02 - 2 ; case 26
	.short _0224EF3C - _0224EE02 - 2 ; case 27
	.short _0224EF3C - _0224EE02 - 2 ; case 28
	.short _0224EF42 - _0224EE02 - 2 ; case 29
	.short _0224EF4C - _0224EE02 - 2 ; case 30
	.short _0224EF56 - _0224EE02 - 2 ; case 31
	.short _0224EF56 - _0224EE02 - 2 ; case 32
	.short _0224EF56 - _0224EE02 - 2 ; case 33
	.short _0224EF56 - _0224EE02 - 2 ; case 34
	.short _0224EF60 - _0224EE02 - 2 ; case 35
	.short _0224EF60 - _0224EE02 - 2 ; case 36
	.short _0224EF60 - _0224EE02 - 2 ; case 37
	.short _0224EF60 - _0224EE02 - 2 ; case 38
	.short _0224EF6A - _0224EE02 - 2 ; case 39
	.short _0224EF6A - _0224EE02 - 2 ; case 40
	.short _0224EF6A - _0224EE02 - 2 ; case 41
	.short _0224EF6A - _0224EE02 - 2 ; case 42
	.short _0224EF7E - _0224EE02 - 2 ; case 43
	.short _0224EF84 - _0224EE02 - 2 ; case 44
	.short _0224EF8A - _0224EE02 - 2 ; case 45
	.short _0224EF9C - _0224EE02 - 2 ; case 46
	.short _0224EFA8 - _0224EE02 - 2 ; case 47
	.short _0224EFAC - _0224EE02 - 2 ; case 48
	.short _0224EFB0 - _0224EE02 - 2 ; case 49
	.short _0224EFC6 - _0224EE02 - 2 ; case 50
	.short _0224EFCA - _0224EE02 - 2 ; case 51
	.short _0224EFCE - _0224EE02 - 2 ; case 52
	.short _0224EFD2 - _0224EE02 - 2 ; case 53
	.short _0224EFD6 - _0224EE02 - 2 ; case 54
	.short _0224EFDA - _0224EE02 - 2 ; case 55
	.short _0224EFE0 - _0224EE02 - 2 ; case 56
	.short _0224EFE6 - _0224EE02 - 2 ; case 57
	.short _0224EFEC - _0224EE02 - 2 ; case 58
	.short _0224EFF6 - _0224EE02 - 2 ; case 59
	.short _0224EFFC - _0224EE02 - 2 ; case 60
	.short _0224F002 - _0224EE02 - 2 ; case 61
	.short _0224F00C - _0224EE02 - 2 ; case 62
	.short _0224F016 - _0224EE02 - 2 ; case 63
	.short _0224F020 - _0224EE02 - 2 ; case 64
	.short _0224F02A - _0224EE02 - 2 ; case 65
	.short _0224F034 - _0224EE02 - 2 ; case 66
	.short _0224F03E - _0224EE02 - 2 ; case 67
	.short _0224F048 - _0224EE02 - 2 ; case 68
	.short _0224F052 - _0224EE02 - 2 ; case 69
	.short _0224F05C - _0224EE02 - 2 ; case 70
	.short _0224F066 - _0224EE02 - 2 ; case 71
	.short _0224F070 - _0224EE02 - 2 ; case 72
	.short _0224F07A - _0224EE02 - 2 ; case 73
	.short _0224F082 - _0224EE02 - 2 ; case 74
	.short _0224F08C - _0224EE02 - 2 ; case 75
	.short _0224F096 - _0224EE02 - 2 ; case 76
	.short _0224F0A0 - _0224EE02 - 2 ; case 77
	.short _0224F0AA - _0224EE02 - 2 ; case 78
	.short _0224F0B4 - _0224EE02 - 2 ; case 79
	.short _0224F0BE - _0224EE02 - 2 ; case 80
	.short _0224F0C8 - _0224EE02 - 2 ; case 81
	.short _0224F0D2 - _0224EE02 - 2 ; case 82
	.short _0224F0DC - _0224EE02 - 2 ; case 83
	.short _0224F0E6 - _0224EE02 - 2 ; case 84
	.short _0224F0F0 - _0224EE02 - 2 ; case 85
	.short _0224F0FA - _0224EE02 - 2 ; case 86
	.short _0224F104 - _0224EE02 - 2 ; case 87
	.short _0224F10A - _0224EE02 - 2 ; case 88
	.short _0224F110 - _0224EE02 - 2 ; case 89
	.short _0224F116 - _0224EE02 - 2 ; case 90
	.short _0224F11C - _0224EE02 - 2 ; case 91
	.short _0224F122 - _0224EE02 - 2 ; case 92
	.short _0224F128 - _0224EE02 - 2 ; case 93
	.short _0224F12E - _0224EE02 - 2 ; case 94
	.short _0224F134 - _0224EE02 - 2 ; case 95
	.short _0224F13A - _0224EE02 - 2 ; case 96
	.short _0224F142 - _0224EE02 - 2 ; case 97
	.short _0224F14A - _0224EE02 - 2 ; case 98
	.short _0224F15E - _0224EE02 - 2 ; case 99
	.short _0224F154 - _0224EE02 - 2 ; case 100
_0224EECC:
	ldrh r0, [r4]
	pop {r4, r5, r6, pc}
_0224EED0:
	ldrh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0224EED4:
	ldrh r0, [r4, #4]
	pop {r4, r5, r6, pc}
_0224EED8:
	ldrh r0, [r4, #6]
	pop {r4, r5, r6, pc}
_0224EEDC:
	ldrh r0, [r4, #8]
	pop {r4, r5, r6, pc}
_0224EEE0:
	ldrh r0, [r4, #0xa]
	pop {r4, r5, r6, pc}
_0224EEE4:
	sub r0, r2, #6
	lsl r0, r0, #1
	add r0, r4, r0
	ldrh r0, [r0, #0xc]
	pop {r4, r5, r6, pc}
_0224EEEE:
	ldr r0, [r4, #0x14]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1b
	pop {r4, r5, r6, pc}
_0224EEF6:
	ldr r0, [r4, #0x14]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1b
	pop {r4, r5, r6, pc}
_0224EEFE:
	ldr r0, [r4, #0x14]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1b
	pop {r4, r5, r6, pc}
_0224EF06:
	ldr r0, [r4, #0x14]
	lsl r0, r0, #0xc
	lsr r0, r0, #0x1b
	pop {r4, r5, r6, pc}
_0224EF0E:
	ldr r0, [r4, #0x14]
	lsl r0, r0, #7
	lsr r0, r0, #0x1b
	pop {r4, r5, r6, pc}
_0224EF16:
	ldr r0, [r4, #0x14]
	lsl r0, r0, #2
	lsr r0, r0, #0x1b
	pop {r4, r5, r6, pc}
_0224EF1E:
	ldr r0, [r4, #0x14]
	lsl r0, r0, #1
	lsr r0, r0, #0x1f
	pop {r4, r5, r6, pc}
_0224EF26:
	ldr r0, [r4, #0x14]
	lsr r0, r0, #0x1f
	pop {r4, r5, r6, pc}
_0224EF2C:
	sub r2, #0x12
	add r1, r4, r2
	mov r0, #0x18
	ldrsb r0, [r1, r0]
	pop {r4, r5, r6, pc}
_0224EF36:
	add r4, #0x27
	ldrb r0, [r4]
	pop {r4, r5, r6, pc}
_0224EF3C:
	bl ov12_022584AC
	pop {r4, r5, r6, pc}
_0224EF42:
	add r4, #0x7e
	ldrb r0, [r4]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	pop {r4, r5, r6, pc}
_0224EF4C:
	add r4, #0x26
	ldrb r0, [r4]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	pop {r4, r5, r6, pc}
_0224EF56:
	sub r2, #0x1f
	add r0, r4, r2
	add r0, #0x2c
	ldrb r0, [r0]
	pop {r4, r5, r6, pc}
_0224EF60:
	sub r2, #0x23
	add r0, r4, r2
	add r0, #0x30
	ldrb r0, [r0]
	pop {r4, r5, r6, pc}
_0224EF6A:
	sub r2, #0x27
	lsl r0, r2, #1
	add r1, r4, r2
	add r0, r4, r0
	add r1, #0x30
	ldrh r0, [r0, #0xc]
	ldrb r1, [r1]
	bl WazaGetMaxPp
	pop {r4, r5, r6, pc}
_0224EF7E:
	add r4, #0x34
	ldrb r0, [r4]
	pop {r4, r5, r6, pc}
_0224EF84:
	add r4, #0x35
	ldrb r0, [r4]
	pop {r4, r5, r6, pc}
_0224EF8A:
	mov r1, #0
_0224EF8C:
	ldrh r0, [r4, #0x36]
	add r1, r1, #1
	add r4, r4, #2
	strh r0, [r3]
	add r3, r3, #2
	cmp r1, #0xb
	blt _0224EF8C
	b _0224F162
_0224EF9C:
	add r4, #0x36
	add r0, r3, #0
	add r1, r4, #0
	bl CopyU16ArrayToString
	b _0224F162
_0224EFA8:
	ldr r0, [r4, #0x4c]
	pop {r4, r5, r6, pc}
_0224EFAC:
	ldr r0, [r4, #0x50]
	pop {r4, r5, r6, pc}
_0224EFB0:
	mov r1, #0
_0224EFB2:
	add r0, r4, #0
	add r0, #0x54
	ldrh r0, [r0]
	add r1, r1, #1
	add r4, r4, #2
	strh r0, [r3]
	add r3, r3, #2
	cmp r1, #0xb
	blt _0224EFB2
	b _0224F162
_0224EFC6:
	ldr r0, [r4, #0x64]
	pop {r4, r5, r6, pc}
_0224EFCA:
	ldr r0, [r4, #0x68]
	pop {r4, r5, r6, pc}
_0224EFCE:
	ldr r0, [r4, #0x6c]
	pop {r4, r5, r6, pc}
_0224EFD2:
	ldr r0, [r4, #0x70]
	pop {r4, r5, r6, pc}
_0224EFD6:
	ldr r0, [r4, #0x74]
	pop {r4, r5, r6, pc}
_0224EFDA:
	add r4, #0x78
	ldrh r0, [r4]
	pop {r4, r5, r6, pc}
_0224EFE0:
	add r4, #0x7c
	ldrb r0, [r4]
	pop {r4, r5, r6, pc}
_0224EFE6:
	add r4, #0x7d
	ldrb r0, [r4]
	pop {r4, r5, r6, pc}
_0224EFEC:
	add r4, #0x7e
	ldrb r0, [r4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	pop {r4, r5, r6, pc}
_0224EFF6:
	add r4, #0x80
	ldr r0, [r4]
	pop {r4, r5, r6, pc}
_0224EFFC:
	add r4, #0x84
	ldr r0, [r4]
	pop {r4, r5, r6, pc}
_0224F002:
	add r4, #0x88
	ldr r0, [r4]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	pop {r4, r5, r6, pc}
_0224F00C:
	add r4, #0x88
	ldr r0, [r4]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1d
	pop {r4, r5, r6, pc}
_0224F016:
	add r4, #0x88
	ldr r0, [r4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	pop {r4, r5, r6, pc}
_0224F020:
	add r4, #0x88
	ldr r0, [r4]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x1d
	pop {r4, r5, r6, pc}
_0224F02A:
	add r4, #0x88
	ldr r0, [r4]
	lsl r0, r0, #0x13
	lsr r0, r0, #0x1e
	pop {r4, r5, r6, pc}
_0224F034:
	add r4, #0x88
	ldr r0, [r4]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1e
	pop {r4, r5, r6, pc}
_0224F03E:
	add r4, #0x88
	ldr r0, [r4]
	lsl r0, r0, #0xe
	lsr r0, r0, #0x1d
	pop {r4, r5, r6, pc}
_0224F048:
	add r4, #0x88
	ldr r0, [r4]
	lsl r0, r0, #0xb
	lsr r0, r0, #0x1d
	pop {r4, r5, r6, pc}
_0224F052:
	add r4, #0x88
	ldr r0, [r4]
	lsl r0, r0, #8
	lsr r0, r0, #0x1d
	pop {r4, r5, r6, pc}
_0224F05C:
	add r4, #0x88
	ldr r0, [r4]
	lsl r0, r0, #5
	lsr r0, r0, #0x1d
	pop {r4, r5, r6, pc}
_0224F066:
	add r4, #0x88
	ldr r0, [r4]
	lsl r0, r0, #2
	lsr r0, r0, #0x1d
	pop {r4, r5, r6, pc}
_0224F070:
	add r4, #0x88
	ldr r0, [r4]
	lsl r0, r0, #1
	lsr r0, r0, #0x1f
	pop {r4, r5, r6, pc}
_0224F07A:
	add r4, #0x88
	ldr r0, [r4]
	lsr r0, r0, #0x1f
	pop {r4, r5, r6, pc}
_0224F082:
	add r4, #0x8c
	ldr r0, [r4]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1e
	pop {r4, r5, r6, pc}
_0224F08C:
	add r4, #0x8c
	ldr r0, [r4]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1c
	pop {r4, r5, r6, pc}
_0224F096:
	add r4, #0x8c
	ldr r0, [r4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	pop {r4, r5, r6, pc}
_0224F0A0:
	add r4, #0x8c
	ldr r0, [r4]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1e
	pop {r4, r5, r6, pc}
_0224F0AA:
	add r4, #0x8c
	ldr r0, [r4]
	lsl r0, r0, #0x13
	lsr r0, r0, #0x1d
	pop {r4, r5, r6, pc}
_0224F0B4:
	add r4, #0x8c
	ldr r0, [r4]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1d
	pop {r4, r5, r6, pc}
_0224F0BE:
	add r4, #0x8c
	ldr r0, [r4]
	lsl r0, r0, #0xd
	lsr r0, r0, #0x1d
	pop {r4, r5, r6, pc}
_0224F0C8:
	add r4, #0x8c
	ldr r0, [r4]
	lsl r0, r0, #0xa
	lsr r0, r0, #0x1d
	pop {r4, r5, r6, pc}
_0224F0D2:
	add r4, #0x8c
	ldr r0, [r4]
	lsl r0, r0, #9
	lsr r0, r0, #0x1f
	pop {r4, r5, r6, pc}
_0224F0DC:
	add r4, #0x8c
	ldr r0, [r4]
	lsl r0, r0, #5
	lsr r0, r0, #0x1c
	pop {r4, r5, r6, pc}
_0224F0E6:
	add r4, #0x8c
	ldr r0, [r4]
	lsl r0, r0, #4
	lsr r0, r0, #0x1f
	pop {r4, r5, r6, pc}
_0224F0F0:
	add r4, #0x8c
	ldr r0, [r4]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	pop {r4, r5, r6, pc}
_0224F0FA:
	add r4, #0x8c
	ldr r0, [r4]
	lsl r0, r0, #2
	lsr r0, r0, #0x1f
	pop {r4, r5, r6, pc}
_0224F104:
	add r4, #0x90
	ldr r0, [r4]
	pop {r4, r5, r6, pc}
_0224F10A:
	add r4, #0x94
	ldr r0, [r4]
	pop {r4, r5, r6, pc}
_0224F110:
	add r4, #0x98
	ldr r0, [r4]
	pop {r4, r5, r6, pc}
_0224F116:
	add r4, #0xa0
	ldr r0, [r4]
	pop {r4, r5, r6, pc}
_0224F11C:
	add r4, #0xa4
	ldr r0, [r4]
	pop {r4, r5, r6, pc}
_0224F122:
	add r4, #0xa8
	ldrh r0, [r4]
	pop {r4, r5, r6, pc}
_0224F128:
	add r4, #0xac
	ldrh r0, [r4]
	pop {r4, r5, r6, pc}
_0224F12E:
	add r4, #0xaa
	ldrh r0, [r4]
	pop {r4, r5, r6, pc}
_0224F134:
	add r4, #0xbc
	ldr r0, [r4]
	pop {r4, r5, r6, pc}
_0224F13A:
	ldr r0, [r4, #0x28]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	pop {r4, r5, r6, pc}
_0224F142:
	ldr r0, [r4, #0x28]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	pop {r4, r5, r6, pc}
_0224F14A:
	add r4, #0x26
	ldrb r0, [r4]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1b
	pop {r4, r5, r6, pc}
_0224F154:
	add r6, #0x78
	ldr r2, [r0, r6]
	bl ov12_0224EDE0
	pop {r4, r5, r6, pc}
_0224F15E:
	bl GF_AssertFail
_0224F162:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0224EDE0

	thumb_func_start ov12_0224F168
ov12_0224F168: ; 0x0224F168
	push {r4, r5, r6, lr}
	add r5, r2, #0
	mov r2, #0xb5
	lsl r2, r2, #6
	add r4, r0, r2
	mov r6, #0xc0
	add r2, r1, #0
	mul r2, r6
	add r2, r4, r2
	cmp r5, #0x64
	bls _0224F180
	b _0224F77E
_0224F180:
	add r4, r5, r5
	add r4, pc
	ldrh r4, [r4, #6]
	lsl r4, r4, #0x10
	asr r4, r4, #0x10
	add pc, r4
_0224F18C: ; jump table
	.short _0224F256 - _0224F18C - 2 ; case 0
	.short _0224F25C - _0224F18C - 2 ; case 1
	.short _0224F262 - _0224F18C - 2 ; case 2
	.short _0224F268 - _0224F18C - 2 ; case 3
	.short _0224F26E - _0224F18C - 2 ; case 4
	.short _0224F274 - _0224F18C - 2 ; case 5
	.short _0224F27A - _0224F18C - 2 ; case 6
	.short _0224F27A - _0224F18C - 2 ; case 7
	.short _0224F27A - _0224F18C - 2 ; case 8
	.short _0224F27A - _0224F18C - 2 ; case 9
	.short _0224F286 - _0224F18C - 2 ; case 10
	.short _0224F298 - _0224F18C - 2 ; case 11
	.short _0224F2AA - _0224F18C - 2 ; case 12
	.short _0224F2BC - _0224F18C - 2 ; case 13
	.short _0224F2CE - _0224F18C - 2 ; case 14
	.short _0224F2E0 - _0224F18C - 2 ; case 15
	.short _0224F2F2 - _0224F18C - 2 ; case 16
	.short _0224F304 - _0224F18C - 2 ; case 17
	.short _0224F314 - _0224F18C - 2 ; case 18
	.short _0224F314 - _0224F18C - 2 ; case 19
	.short _0224F314 - _0224F18C - 2 ; case 20
	.short _0224F314 - _0224F18C - 2 ; case 21
	.short _0224F314 - _0224F18C - 2 ; case 22
	.short _0224F314 - _0224F18C - 2 ; case 23
	.short _0224F314 - _0224F18C - 2 ; case 24
	.short _0224F314 - _0224F18C - 2 ; case 25
	.short _0224F320 - _0224F18C - 2 ; case 26
	.short _0224F328 - _0224F18C - 2 ; case 27
	.short _0224F330 - _0224F18C - 2 ; case 28
	.short _0224F338 - _0224F18C - 2 ; case 29
	.short _0224F350 - _0224F18C - 2 ; case 30
	.short _0224F368 - _0224F18C - 2 ; case 31
	.short _0224F368 - _0224F18C - 2 ; case 32
	.short _0224F368 - _0224F18C - 2 ; case 33
	.short _0224F368 - _0224F18C - 2 ; case 34
	.short _0224F374 - _0224F18C - 2 ; case 35
	.short _0224F374 - _0224F18C - 2 ; case 36
	.short _0224F374 - _0224F18C - 2 ; case 37
	.short _0224F374 - _0224F18C - 2 ; case 38
	.short _0224F380 - _0224F18C - 2 ; case 39
	.short _0224F380 - _0224F18C - 2 ; case 40
	.short _0224F380 - _0224F18C - 2 ; case 41
	.short _0224F380 - _0224F18C - 2 ; case 42
	.short _0224F386 - _0224F18C - 2 ; case 43
	.short _0224F38E - _0224F18C - 2 ; case 44
	.short _0224F396 - _0224F18C - 2 ; case 45
	.short _0224F77E - _0224F18C - 2 ; case 46
	.short _0224F3A8 - _0224F18C - 2 ; case 47
	.short _0224F3B0 - _0224F18C - 2 ; case 48
	.short _0224F3B6 - _0224F18C - 2 ; case 49
	.short _0224F3CC - _0224F18C - 2 ; case 50
	.short _0224F3D2 - _0224F18C - 2 ; case 51
	.short _0224F3D8 - _0224F18C - 2 ; case 52
	.short _0224F3DE - _0224F18C - 2 ; case 53
	.short _0224F3E4 - _0224F18C - 2 ; case 54
	.short _0224F3EA - _0224F18C - 2 ; case 55
	.short _0224F3F2 - _0224F18C - 2 ; case 56
	.short _0224F3FA - _0224F18C - 2 ; case 57
	.short _0224F402 - _0224F18C - 2 ; case 58
	.short _0224F41A - _0224F18C - 2 ; case 59
	.short _0224F422 - _0224F18C - 2 ; case 60
	.short _0224F42A - _0224F18C - 2 ; case 61
	.short _0224F442 - _0224F18C - 2 ; case 62
	.short _0224F45A - _0224F18C - 2 ; case 63
	.short _0224F472 - _0224F18C - 2 ; case 64
	.short _0224F48A - _0224F18C - 2 ; case 65
	.short _0224F4A2 - _0224F18C - 2 ; case 66
	.short _0224F4BA - _0224F18C - 2 ; case 67
	.short _0224F4D2 - _0224F18C - 2 ; case 68
	.short _0224F4EA - _0224F18C - 2 ; case 69
	.short _0224F502 - _0224F18C - 2 ; case 70
	.short _0224F51A - _0224F18C - 2 ; case 71
	.short _0224F532 - _0224F18C - 2 ; case 72
	.short _0224F54A - _0224F18C - 2 ; case 73
	.short _0224F560 - _0224F18C - 2 ; case 74
	.short _0224F578 - _0224F18C - 2 ; case 75
	.short _0224F590 - _0224F18C - 2 ; case 76
	.short _0224F5A8 - _0224F18C - 2 ; case 77
	.short _0224F5C0 - _0224F18C - 2 ; case 78
	.short _0224F5D8 - _0224F18C - 2 ; case 79
	.short _0224F5F0 - _0224F18C - 2 ; case 80
	.short _0224F608 - _0224F18C - 2 ; case 81
	.short _0224F620 - _0224F18C - 2 ; case 82
	.short _0224F690 - _0224F18C - 2 ; case 83
	.short _0224F6A8 - _0224F18C - 2 ; case 84
	.short _0224F6C0 - _0224F18C - 2 ; case 85
	.short _0224F6D8 - _0224F18C - 2 ; case 86
	.short _0224F6F0 - _0224F18C - 2 ; case 87
	.short _0224F6F8 - _0224F18C - 2 ; case 88
	.short _0224F700 - _0224F18C - 2 ; case 89
	.short _0224F708 - _0224F18C - 2 ; case 90
	.short _0224F710 - _0224F18C - 2 ; case 91
	.short _0224F718 - _0224F18C - 2 ; case 92
	.short _0224F720 - _0224F18C - 2 ; case 93
	.short _0224F728 - _0224F18C - 2 ; case 94
	.short _0224F730 - _0224F18C - 2 ; case 95
	.short _0224F738 - _0224F18C - 2 ; case 96
	.short _0224F74A - _0224F18C - 2 ; case 97
	.short _0224F75C - _0224F18C - 2 ; case 98
	.short _0224F77E - _0224F18C - 2 ; case 99
	.short _0224F774 - _0224F18C - 2 ; case 100
_0224F256:
	ldrh r0, [r3]
	strh r0, [r2]
	pop {r4, r5, r6, pc}
_0224F25C:
	ldrh r0, [r3]
	strh r0, [r2, #2]
	pop {r4, r5, r6, pc}
_0224F262:
	ldrh r0, [r3]
	strh r0, [r2, #4]
	pop {r4, r5, r6, pc}
_0224F268:
	ldrh r0, [r3]
	strh r0, [r2, #6]
	pop {r4, r5, r6, pc}
_0224F26E:
	ldrh r0, [r3]
	strh r0, [r2, #8]
	pop {r4, r5, r6, pc}
_0224F274:
	ldrh r0, [r3]
	strh r0, [r2, #0xa]
	pop {r4, r5, r6, pc}
_0224F27A:
	sub r0, r5, #6
	lsl r0, r0, #1
	ldrh r1, [r3]
	add r0, r2, r0
	strh r1, [r0, #0xc]
	pop {r4, r5, r6, pc}
_0224F286:
	ldr r4, [r2, #0x14]
	mov r0, #0x1f
	bic r4, r0
	ldrb r1, [r3]
	mov r0, #0x1f
	and r0, r1
	orr r0, r4
	str r0, [r2, #0x14]
	pop {r4, r5, r6, pc}
_0224F298:
	ldr r1, [r2, #0x14]
	ldr r0, _0224F62C ; =0xFFFFFC1F
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x16
	orr r0, r1
	str r0, [r2, #0x14]
	pop {r4, r5, r6, pc}
_0224F2AA:
	ldr r1, [r2, #0x14]
	ldr r0, _0224F630 ; =0xFFFF83FF
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x11
	orr r0, r1
	str r0, [r2, #0x14]
	pop {r4, r5, r6, pc}
_0224F2BC:
	ldr r1, [r2, #0x14]
	ldr r0, _0224F634 ; =0xFFF07FFF
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0xc
	orr r0, r1
	str r0, [r2, #0x14]
	pop {r4, r5, r6, pc}
_0224F2CE:
	ldr r1, [r2, #0x14]
	ldr r0, _0224F638 ; =0xFE0FFFFF
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1b
	lsr r0, r0, #7
	orr r0, r1
	str r0, [r2, #0x14]
	pop {r4, r5, r6, pc}
_0224F2E0:
	ldr r1, [r2, #0x14]
	ldr r0, _0224F63C ; =0xC1FFFFFF
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1b
	lsr r0, r0, #2
	orr r0, r1
	str r0, [r2, #0x14]
	pop {r4, r5, r6, pc}
_0224F2F2:
	ldr r1, [r2, #0x14]
	ldr r0, _0224F640 ; =0xBFFFFFFF
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #1
	orr r0, r1
	str r0, [r2, #0x14]
	pop {r4, r5, r6, pc}
_0224F304:
	ldr r1, [r2, #0x14]
	ldr r0, _0224F644 ; =0x7FFFFFFF
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1f
	orr r0, r1
	str r0, [r2, #0x14]
	pop {r4, r5, r6, pc}
_0224F314:
	mov r0, #0
	ldrsb r1, [r3, r0]
	sub r5, #0x12
	add r0, r2, r5
	strb r1, [r0, #0x18]
	pop {r4, r5, r6, pc}
_0224F320:
	ldrb r0, [r3]
	add r2, #0x27
	strb r0, [r2]
	pop {r4, r5, r6, pc}
_0224F328:
	ldrb r0, [r3]
	add r2, #0x24
	strb r0, [r2]
	pop {r4, r5, r6, pc}
_0224F330:
	ldrb r0, [r3]
	add r2, #0x25
	strb r0, [r2]
	pop {r4, r5, r6, pc}
_0224F338:
	add r0, r2, #0
	add r0, #0x7e
	ldrb r4, [r0]
	ldrb r1, [r3]
	mov r0, #0xf
	bic r4, r0
	mov r0, #0xf
	and r0, r1
	orr r0, r4
	add r2, #0x7e
	strb r0, [r2]
	pop {r4, r5, r6, pc}
_0224F350:
	add r0, r2, #0
	add r0, #0x26
	ldrb r1, [r0]
	mov r0, #0x20
	add r2, #0x26
	bic r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1a
	orr r0, r1
	strb r0, [r2]
	pop {r4, r5, r6, pc}
_0224F368:
	sub r5, #0x1f
	add r0, r2, r5
	ldrb r1, [r3]
	add r0, #0x2c
	strb r1, [r0]
	pop {r4, r5, r6, pc}
_0224F374:
	sub r5, #0x23
	add r0, r2, r5
	ldrb r1, [r3]
	add r0, #0x30
	strb r1, [r0]
	pop {r4, r5, r6, pc}
_0224F380:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_0224F386:
	ldrb r0, [r3]
	add r2, #0x34
	strb r0, [r2]
	pop {r4, r5, r6, pc}
_0224F38E:
	ldrb r0, [r3]
	add r2, #0x35
	strb r0, [r2]
	pop {r4, r5, r6, pc}
_0224F396:
	mov r1, #0
_0224F398:
	ldrh r0, [r3]
	add r1, r1, #1
	add r3, r3, #2
	strh r0, [r2, #0x36]
	add r2, r2, #2
	cmp r1, #0xb
	blt _0224F398
	pop {r4, r5, r6, pc}
_0224F3A8:
	mov r0, #0
	ldrsh r0, [r3, r0]
	str r0, [r2, #0x4c]
	pop {r4, r5, r6, pc}
_0224F3B0:
	ldrh r0, [r3]
	str r0, [r2, #0x50]
	pop {r4, r5, r6, pc}
_0224F3B6:
	mov r4, #0
_0224F3B8:
	ldrh r1, [r3]
	add r0, r2, #0
	add r0, #0x54
	add r4, r4, #1
	strh r1, [r0]
	add r3, r3, #2
	add r2, r2, #2
	cmp r4, #0xb
	blt _0224F3B8
	pop {r4, r5, r6, pc}
_0224F3CC:
	ldr r0, [r3]
	str r0, [r2, #0x64]
	pop {r4, r5, r6, pc}
_0224F3D2:
	ldr r0, [r3]
	str r0, [r2, #0x68]
	pop {r4, r5, r6, pc}
_0224F3D8:
	ldr r0, [r3]
	str r0, [r2, #0x6c]
	pop {r4, r5, r6, pc}
_0224F3DE:
	ldr r0, [r3]
	str r0, [r2, #0x70]
	pop {r4, r5, r6, pc}
_0224F3E4:
	ldr r0, [r3]
	str r0, [r2, #0x74]
	pop {r4, r5, r6, pc}
_0224F3EA:
	ldrh r0, [r3]
	add r2, #0x78
	strh r0, [r2]
	pop {r4, r5, r6, pc}
_0224F3F2:
	ldrb r0, [r3]
	add r2, #0x7c
	strb r0, [r2]
	pop {r4, r5, r6, pc}
_0224F3FA:
	ldrb r0, [r3]
	add r2, #0x7d
	strb r0, [r2]
	pop {r4, r5, r6, pc}
_0224F402:
	add r0, r2, #0
	add r0, #0x7e
	ldrb r1, [r0]
	mov r0, #0xf0
	add r2, #0x7e
	bic r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x18
	orr r0, r1
	strb r0, [r2]
	pop {r4, r5, r6, pc}
_0224F41A:
	ldr r0, [r3]
	add r2, #0x80
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F422:
	ldr r0, [r3]
	add r2, #0x84
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F42A:
	add r0, r2, #0
	add r0, #0x88
	ldr r4, [r0]
	mov r0, #7
	bic r4, r0
	ldrb r1, [r3]
	mov r0, #7
	add r2, #0x88
	and r0, r1
	orr r0, r4
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F442:
	add r0, r2, #0
	add r0, #0x88
	ldr r1, [r0]
	mov r0, #0x38
	bic r1, r0
	ldrb r0, [r3]
	add r2, #0x88
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1a
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F45A:
	add r0, r2, #0
	add r0, #0x88
	ldr r1, [r0]
	mov r0, #0xc0
	bic r1, r0
	ldrb r0, [r3]
	add r2, #0x88
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x18
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F472:
	add r0, r2, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224F648 ; =0xFFFFF8FF
	add r2, #0x88
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x15
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F48A:
	add r0, r2, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224F64C ; =0xFFFFE7FF
	add r2, #0x88
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x13
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F4A2:
	add r0, r2, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224F650 ; =0xFFFF9FFF
	add r2, #0x88
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x11
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F4BA:
	add r0, r2, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224F654 ; =0xFFFC7FFF
	add r2, #0x88
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0xe
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F4D2:
	add r0, r2, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224F658 ; =0xFFE3FFFF
	add r2, #0x88
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0xb
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F4EA:
	add r0, r2, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224F65C ; =0xFF1FFFFF
	add r2, #0x88
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1d
	lsr r0, r0, #8
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F502:
	add r0, r2, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224F660 ; =0xF8FFFFFF
	add r2, #0x88
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1d
	lsr r0, r0, #5
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F51A:
	add r0, r2, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224F664 ; =0xC7FFFFFF
	add r2, #0x88
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1d
	lsr r0, r0, #2
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F532:
	add r0, r2, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224F640 ; =0xBFFFFFFF
	add r2, #0x88
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #1
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F54A:
	add r0, r2, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224F644 ; =0x7FFFFFFF
	add r2, #0x88
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1f
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F560:
	add r0, r2, #0
	add r0, #0x8c
	ldr r4, [r0]
	mov r0, #3
	bic r4, r0
	ldrb r1, [r3]
	mov r0, #3
	add r2, #0x8c
	and r0, r1
	orr r0, r4
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F578:
	add r0, r2, #0
	add r0, #0x8c
	ldr r1, [r0]
	mov r0, #0x3c
	bic r1, r0
	ldrb r0, [r3]
	add r2, #0x8c
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1a
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F590:
	add r0, r2, #0
	add r0, #0x8c
	ldr r1, [r0]
	mov r0, #0xc0
	bic r1, r0
	ldrb r0, [r3]
	add r2, #0x8c
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x18
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F5A8:
	add r0, r2, #0
	add r0, #0x8c
	ldr r1, [r0]
	ldr r0, _0224F668 ; =0xFFFFFCFF
	add r2, #0x8c
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x16
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F5C0:
	add r0, r2, #0
	add r0, #0x8c
	ldr r1, [r0]
	ldr r0, _0224F66C ; =0xFFFFE3FF
	add r2, #0x8c
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x13
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F5D8:
	add r0, r2, #0
	add r0, #0x8c
	ldr r1, [r0]
	ldr r0, _0224F670 ; =0xFFFF1FFF
	add r2, #0x8c
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x10
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F5F0:
	add r0, r2, #0
	add r0, #0x8c
	ldr r1, [r0]
	ldr r0, _0224F674 ; =0xFFF8FFFF
	add r2, #0x8c
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0xd
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F608:
	add r0, r2, #0
	add r0, #0x8c
	ldr r1, [r0]
	ldr r0, _0224F678 ; =0xFFC7FFFF
	add r2, #0x8c
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0xa
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F620:
	add r0, r2, #0
	add r0, #0x8c
	ldr r1, [r0]
	ldr r0, _0224F67C ; =0xFFBFFFFF
	b _0224F680
	nop
_0224F62C: .word 0xFFFFFC1F
_0224F630: .word 0xFFFF83FF
_0224F634: .word 0xFFF07FFF
_0224F638: .word 0xFE0FFFFF
_0224F63C: .word 0xC1FFFFFF
_0224F640: .word 0xBFFFFFFF
_0224F644: .word 0x7FFFFFFF
_0224F648: .word 0xFFFFF8FF
_0224F64C: .word 0xFFFFE7FF
_0224F650: .word 0xFFFF9FFF
_0224F654: .word 0xFFFC7FFF
_0224F658: .word 0xFFE3FFFF
_0224F65C: .word 0xFF1FFFFF
_0224F660: .word 0xF8FFFFFF
_0224F664: .word 0xC7FFFFFF
_0224F668: .word 0xFFFFFCFF
_0224F66C: .word 0xFFFFE3FF
_0224F670: .word 0xFFFF1FFF
_0224F674: .word 0xFFF8FFFF
_0224F678: .word 0xFFC7FFFF
_0224F67C: .word 0xFFBFFFFF
_0224F680:
	add r2, #0x8c
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #9
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F690:
	add r0, r2, #0
	add r0, #0x8c
	ldr r1, [r0]
	ldr r0, _0224F784 ; =0xF87FFFFF
	add r2, #0x8c
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1c
	lsr r0, r0, #5
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F6A8:
	add r0, r2, #0
	add r0, #0x8c
	ldr r1, [r0]
	ldr r0, _0224F788 ; =0xF7FFFFFF
	add r2, #0x8c
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #4
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F6C0:
	add r0, r2, #0
	add r0, #0x8c
	ldr r1, [r0]
	ldr r0, _0224F78C ; =0xEFFFFFFF
	add r2, #0x8c
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #3
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F6D8:
	add r0, r2, #0
	add r0, #0x8c
	ldr r1, [r0]
	ldr r0, _0224F790 ; =0xDFFFFFFF
	add r2, #0x8c
	and r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #2
	orr r0, r1
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F6F0:
	ldr r0, [r3]
	add r2, #0x90
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F6F8:
	ldr r0, [r3]
	add r2, #0x94
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F700:
	ldr r0, [r3]
	add r2, #0x98
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F708:
	ldr r0, [r3]
	add r2, #0xa0
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F710:
	ldr r0, [r3]
	add r2, #0xa4
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F718:
	ldrh r0, [r3]
	add r2, #0xa8
	strh r0, [r2]
	pop {r4, r5, r6, pc}
_0224F720:
	ldrh r0, [r3]
	add r2, #0xac
	strh r0, [r2]
	pop {r4, r5, r6, pc}
_0224F728:
	ldrh r0, [r3]
	add r2, #0xaa
	strh r0, [r2]
	pop {r4, r5, r6, pc}
_0224F730:
	ldr r0, [r3]
	add r2, #0xbc
	str r0, [r2]
	pop {r4, r5, r6, pc}
_0224F738:
	ldr r1, [r2, #0x28]
	mov r0, #0x40
	bic r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x19
	orr r0, r1
	str r0, [r2, #0x28]
	pop {r4, r5, r6, pc}
_0224F74A:
	ldr r1, [r2, #0x28]
	mov r0, #0x80
	bic r1, r0
	ldrb r0, [r3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x18
	orr r0, r1
	str r0, [r2, #0x28]
	pop {r4, r5, r6, pc}
_0224F75C:
	add r0, r2, #0
	add r0, #0x26
	ldrb r4, [r0]
	ldrb r1, [r3]
	mov r0, #0x1f
	bic r4, r0
	mov r0, #0x1f
	and r0, r1
	orr r0, r4
	add r2, #0x26
	strb r0, [r2]
	pop {r4, r5, r6, pc}
_0224F774:
	add r6, #0x78
	ldr r2, [r0, r6]
	bl ov12_0224F168
	pop {r4, r5, r6, pc}
_0224F77E:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0224F784: .word 0xF87FFFFF
_0224F788: .word 0xF7FFFFFF
_0224F78C: .word 0xEFFFFFFF
_0224F790: .word 0xDFFFFFFF
	thumb_func_end ov12_0224F168

	thumb_func_start ov12_0224F794
ov12_0224F794: ; 0x0224F794
	push {r4, lr}
	mov r4, #0xb5
	lsl r4, r4, #6
	add r4, r0, r4
	mov r0, #0xc0
	mul r0, r1
	add r1, r2, #0
	add r0, r4, r0
	add r2, r3, #0
	bl ov12_0224F7AC
	pop {r4, pc}
	thumb_func_end ov12_0224F794

	thumb_func_start ov12_0224F7AC
ov12_0224F7AC: ; 0x0224F7AC
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r5, r2, #0
	cmp r1, #0x62
	bls _0224F7B8
	b _0224FC02
_0224F7B8:
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224F7C4: ; jump table
	.short _0224FC02 - _0224F7C4 - 2 ; case 0
	.short _0224F88A - _0224F7C4 - 2 ; case 1
	.short _0224F892 - _0224F7C4 - 2 ; case 2
	.short _0224F89A - _0224F7C4 - 2 ; case 3
	.short _0224F8A2 - _0224F7C4 - 2 ; case 4
	.short _0224F8AA - _0224F7C4 - 2 ; case 5
	.short _0224FC02 - _0224F7C4 - 2 ; case 6
	.short _0224FC02 - _0224F7C4 - 2 ; case 7
	.short _0224FC02 - _0224F7C4 - 2 ; case 8
	.short _0224FC02 - _0224F7C4 - 2 ; case 9
	.short _0224F8B2 - _0224F7C4 - 2 ; case 10
	.short _0224F8CA - _0224F7C4 - 2 ; case 11
	.short _0224F8E0 - _0224F7C4 - 2 ; case 12
	.short _0224F8F6 - _0224F7C4 - 2 ; case 13
	.short _0224F90C - _0224F7C4 - 2 ; case 14
	.short _0224F922 - _0224F7C4 - 2 ; case 15
	.short _0224FC02 - _0224F7C4 - 2 ; case 16
	.short _0224FC02 - _0224F7C4 - 2 ; case 17
	.short _0224F938 - _0224F7C4 - 2 ; case 18
	.short _0224F938 - _0224F7C4 - 2 ; case 19
	.short _0224F938 - _0224F7C4 - 2 ; case 20
	.short _0224F938 - _0224F7C4 - 2 ; case 21
	.short _0224F938 - _0224F7C4 - 2 ; case 22
	.short _0224F938 - _0224F7C4 - 2 ; case 23
	.short _0224F938 - _0224F7C4 - 2 ; case 24
	.short _0224F938 - _0224F7C4 - 2 ; case 25
	.short _0224FC02 - _0224F7C4 - 2 ; case 26
	.short _0224FC02 - _0224F7C4 - 2 ; case 27
	.short _0224FC02 - _0224F7C4 - 2 ; case 28
	.short _0224FC02 - _0224F7C4 - 2 ; case 29
	.short _0224FC02 - _0224F7C4 - 2 ; case 30
	.short _0224F956 - _0224F7C4 - 2 ; case 31
	.short _0224F956 - _0224F7C4 - 2 ; case 32
	.short _0224F956 - _0224F7C4 - 2 ; case 33
	.short _0224F956 - _0224F7C4 - 2 ; case 34
	.short _0224F97C - _0224F7C4 - 2 ; case 35
	.short _0224F97C - _0224F7C4 - 2 ; case 36
	.short _0224F97C - _0224F7C4 - 2 ; case 37
	.short _0224F97C - _0224F7C4 - 2 ; case 38
	.short _0224FC02 - _0224F7C4 - 2 ; case 39
	.short _0224FC02 - _0224F7C4 - 2 ; case 40
	.short _0224FC02 - _0224F7C4 - 2 ; case 41
	.short _0224FC02 - _0224F7C4 - 2 ; case 42
	.short _0224F988 - _0224F7C4 - 2 ; case 43
	.short _0224F996 - _0224F7C4 - 2 ; case 44
	.short _0224FC02 - _0224F7C4 - 2 ; case 45
	.short _0224FC02 - _0224F7C4 - 2 ; case 46
	.short _0224F9B2 - _0224F7C4 - 2 ; case 47
	.short _0224F9C4 - _0224F7C4 - 2 ; case 48
	.short _0224FC02 - _0224F7C4 - 2 ; case 49
	.short _0224F9CC - _0224F7C4 - 2 ; case 50
	.short _0224F9D4 - _0224F7C4 - 2 ; case 51
	.short _0224FC02 - _0224F7C4 - 2 ; case 52
	.short _0224FC02 - _0224F7C4 - 2 ; case 53
	.short _0224FC02 - _0224F7C4 - 2 ; case 54
	.short _0224FC02 - _0224F7C4 - 2 ; case 55
	.short _0224FC02 - _0224F7C4 - 2 ; case 56
	.short _0224FC02 - _0224F7C4 - 2 ; case 57
	.short _0224FC02 - _0224F7C4 - 2 ; case 58
	.short _0224FC02 - _0224F7C4 - 2 ; case 59
	.short _0224FC02 - _0224F7C4 - 2 ; case 60
	.short _0224F9DC - _0224F7C4 - 2 ; case 61
	.short _0224F9FA - _0224F7C4 - 2 ; case 62
	.short _0224FA18 - _0224F7C4 - 2 ; case 63
	.short _0224FA36 - _0224F7C4 - 2 ; case 64
	.short _0224FA52 - _0224F7C4 - 2 ; case 65
	.short _0224FA6E - _0224F7C4 - 2 ; case 66
	.short _0224FA8A - _0224F7C4 - 2 ; case 67
	.short _0224FAA6 - _0224F7C4 - 2 ; case 68
	.short _0224FAC2 - _0224F7C4 - 2 ; case 69
	.short _0224FADE - _0224F7C4 - 2 ; case 70
	.short _0224FAFA - _0224F7C4 - 2 ; case 71
	.short _0224FC02 - _0224F7C4 - 2 ; case 72
	.short _0224FC02 - _0224F7C4 - 2 ; case 73
	.short _0224FC02 - _0224F7C4 - 2 ; case 74
	.short _0224FC02 - _0224F7C4 - 2 ; case 75
	.short _0224FC02 - _0224F7C4 - 2 ; case 76
	.short _0224FC02 - _0224F7C4 - 2 ; case 77
	.short _0224FB16 - _0224F7C4 - 2 ; case 78
	.short _0224FB32 - _0224F7C4 - 2 ; case 79
	.short _0224FB4E - _0224F7C4 - 2 ; case 80
	.short _0224FC02 - _0224F7C4 - 2 ; case 81
	.short _0224FC02 - _0224F7C4 - 2 ; case 82
	.short _0224FC02 - _0224F7C4 - 2 ; case 83
	.short _0224FC02 - _0224F7C4 - 2 ; case 84
	.short _0224FC02 - _0224F7C4 - 2 ; case 85
	.short _0224FC02 - _0224F7C4 - 2 ; case 86
	.short _0224FB6A - _0224F7C4 - 2 ; case 87
	.short _0224FB78 - _0224F7C4 - 2 ; case 88
	.short _0224FB86 - _0224F7C4 - 2 ; case 89
	.short _0224FB94 - _0224F7C4 - 2 ; case 90
	.short _0224FC02 - _0224F7C4 - 2 ; case 91
	.short _0224FC02 - _0224F7C4 - 2 ; case 92
	.short _0224FC02 - _0224F7C4 - 2 ; case 93
	.short _0224FC02 - _0224F7C4 - 2 ; case 94
	.short _0224FBA2 - _0224F7C4 - 2 ; case 95
	.short _0224FBB0 - _0224F7C4 - 2 ; case 96
	.short _0224FBC8 - _0224F7C4 - 2 ; case 97
	.short _0224FBE0 - _0224F7C4 - 2 ; case 98
_0224F88A:
	ldrh r0, [r4, #2]
	add r0, r0, r5
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0224F892:
	ldrh r0, [r4, #4]
	add r0, r0, r5
	strh r0, [r4, #4]
	pop {r4, r5, r6, pc}
_0224F89A:
	ldrh r0, [r4, #6]
	add r0, r0, r5
	strh r0, [r4, #6]
	pop {r4, r5, r6, pc}
_0224F8A2:
	ldrh r0, [r4, #8]
	add r0, r0, r5
	strh r0, [r4, #8]
	pop {r4, r5, r6, pc}
_0224F8AA:
	ldrh r0, [r4, #0xa]
	add r0, r0, r5
	strh r0, [r4, #0xa]
	pop {r4, r5, r6, pc}
_0224F8B2:
	ldr r2, [r4, #0x14]
	mov r1, #0x1f
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1b
	lsr r1, r1, #0x1b
	add r2, r1, r5
	mov r1, #0x1f
	and r1, r2
	orr r0, r1
	str r0, [r4, #0x14]
	pop {r4, r5, r6, pc}
_0224F8CA:
	ldr r1, [r4, #0x14]
	ldr r0, _0224FC08 ; =0xFFFFFC1F
	and r0, r1
	lsl r1, r1, #0x16
	lsr r1, r1, #0x1b
	add r1, r1, r5
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x16
	orr r0, r1
	str r0, [r4, #0x14]
	pop {r4, r5, r6, pc}
_0224F8E0:
	ldr r1, [r4, #0x14]
	ldr r0, _0224FC0C ; =0xFFFF83FF
	and r0, r1
	lsl r1, r1, #0x11
	lsr r1, r1, #0x1b
	add r1, r1, r5
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x11
	orr r0, r1
	str r0, [r4, #0x14]
	pop {r4, r5, r6, pc}
_0224F8F6:
	ldr r1, [r4, #0x14]
	ldr r0, _0224FC10 ; =0xFFF07FFF
	and r0, r1
	lsl r1, r1, #0xc
	lsr r1, r1, #0x1b
	add r1, r1, r5
	lsl r1, r1, #0x1b
	lsr r1, r1, #0xc
	orr r0, r1
	str r0, [r4, #0x14]
	pop {r4, r5, r6, pc}
_0224F90C:
	ldr r1, [r4, #0x14]
	ldr r0, _0224FC14 ; =0xFE0FFFFF
	and r0, r1
	lsl r1, r1, #7
	lsr r1, r1, #0x1b
	add r1, r1, r5
	lsl r1, r1, #0x1b
	lsr r1, r1, #7
	orr r0, r1
	str r0, [r4, #0x14]
	pop {r4, r5, r6, pc}
_0224F922:
	ldr r1, [r4, #0x14]
	ldr r0, _0224FC18 ; =0xC1FFFFFF
	and r0, r1
	lsl r1, r1, #2
	lsr r1, r1, #0x1b
	add r1, r1, r5
	lsl r1, r1, #0x1b
	lsr r1, r1, #2
	orr r0, r1
	str r0, [r4, #0x14]
	pop {r4, r5, r6, pc}
_0224F938:
	add r4, #0x18
	sub r1, #0x12
	ldrsb r0, [r4, r1]
	add r0, r5, r0
	bpl _0224F948
	mov r0, #0
	strb r0, [r4, r1]
	pop {r4, r5, r6, pc}
_0224F948:
	cmp r0, #0xc
	ble _0224F952
	mov r0, #0xc
	strb r0, [r4, r1]
	pop {r4, r5, r6, pc}
_0224F952:
	strb r0, [r4, r1]
	pop {r4, r5, r6, pc}
_0224F956:
	add r6, r1, #0
	sub r6, #0x1f
	lsl r0, r6, #1
	add r1, r4, r6
	add r0, r4, r0
	add r1, #0x30
	ldrh r0, [r0, #0xc]
	ldrb r1, [r1]
	bl WazaGetMaxPp
	add r4, #0x2c
	ldrb r1, [r4, r6]
	add r1, r5, r1
	cmp r1, r0
	ble _0224F978
	strb r0, [r4, r6]
	pop {r4, r5, r6, pc}
_0224F978:
	strb r1, [r4, r6]
	pop {r4, r5, r6, pc}
_0224F97C:
	add r4, #0x30
	sub r1, #0x23
	ldrb r0, [r4, r1]
	add r0, r0, r5
	strb r0, [r4, r1]
	pop {r4, r5, r6, pc}
_0224F988:
	add r0, r4, #0
	add r0, #0x34
	ldrb r0, [r0]
	add r4, #0x34
	add r0, r0, r5
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0224F996:
	add r0, r4, #0
	add r0, #0x35
	ldrb r0, [r0]
	add r0, r0, r5
	cmp r0, #0xff
	ble _0224F9A6
	mov r0, #0xff
	b _0224F9AC
_0224F9A6:
	cmp r0, #0
	bge _0224F9AC
	mov r0, #0
_0224F9AC:
	add r4, #0x35
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0224F9B2:
	ldr r0, [r4, #0x4c]
	ldr r1, [r4, #0x50]
	add r0, r0, r5
	cmp r0, r1
	bls _0224F9C0
	str r1, [r4, #0x4c]
	pop {r4, r5, r6, pc}
_0224F9C0:
	str r0, [r4, #0x4c]
	pop {r4, r5, r6, pc}
_0224F9C4:
	ldr r0, [r4, #0x50]
	add r0, r0, r5
	str r0, [r4, #0x50]
	pop {r4, r5, r6, pc}
_0224F9CC:
	ldr r0, [r4, #0x64]
	add r0, r0, r5
	str r0, [r4, #0x64]
	pop {r4, r5, r6, pc}
_0224F9D4:
	ldr r0, [r4, #0x68]
	add r0, r0, r5
	str r0, [r4, #0x68]
	pop {r4, r5, r6, pc}
_0224F9DC:
	add r0, r4, #0
	add r0, #0x88
	ldr r2, [r0]
	mov r1, #7
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1d
	lsr r1, r1, #0x1d
	add r2, r1, r5
	mov r1, #7
	and r1, r2
	orr r0, r1
	add r4, #0x88
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224F9FA:
	add r0, r4, #0
	add r0, #0x88
	ldr r2, [r0]
	mov r1, #0x38
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1a
	lsr r1, r1, #0x1d
	add r1, r1, r5
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1a
	orr r0, r1
	add r4, #0x88
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FA18:
	add r0, r4, #0
	add r0, #0x88
	ldr r2, [r0]
	mov r1, #0xc0
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x1e
	add r1, r1, r5
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x18
	orr r0, r1
	add r4, #0x88
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FA36:
	add r0, r4, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224FC1C ; =0xFFFFF8FF
	add r4, #0x88
	and r0, r1
	lsl r1, r1, #0x15
	lsr r1, r1, #0x1d
	add r1, r1, r5
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x15
	orr r0, r1
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FA52:
	add r0, r4, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224FC20 ; =0xFFFFE7FF
	add r4, #0x88
	and r0, r1
	lsl r1, r1, #0x13
	lsr r1, r1, #0x1e
	add r1, r1, r5
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x13
	orr r0, r1
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FA6E:
	add r0, r4, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224FC24 ; =0xFFFF9FFF
	add r4, #0x88
	and r0, r1
	lsl r1, r1, #0x11
	lsr r1, r1, #0x1e
	add r1, r1, r5
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x11
	orr r0, r1
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FA8A:
	add r0, r4, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224FC28 ; =0xFFFC7FFF
	add r4, #0x88
	and r0, r1
	lsl r1, r1, #0xe
	lsr r1, r1, #0x1d
	add r1, r1, r5
	lsl r1, r1, #0x1d
	lsr r1, r1, #0xe
	orr r0, r1
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FAA6:
	add r0, r4, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224FC2C ; =0xFFE3FFFF
	add r4, #0x88
	and r0, r1
	lsl r1, r1, #0xb
	lsr r1, r1, #0x1d
	add r1, r1, r5
	lsl r1, r1, #0x1d
	lsr r1, r1, #0xb
	orr r0, r1
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FAC2:
	add r0, r4, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224FC30 ; =0xFF1FFFFF
	add r4, #0x88
	and r0, r1
	lsl r1, r1, #8
	lsr r1, r1, #0x1d
	add r1, r1, r5
	lsl r1, r1, #0x1d
	lsr r1, r1, #8
	orr r0, r1
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FADE:
	add r0, r4, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224FC34 ; =0xF8FFFFFF
	add r4, #0x88
	and r0, r1
	lsl r1, r1, #5
	lsr r1, r1, #0x1d
	add r1, r1, r5
	lsl r1, r1, #0x1d
	lsr r1, r1, #5
	orr r0, r1
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FAFA:
	add r0, r4, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, _0224FC38 ; =0xC7FFFFFF
	add r4, #0x88
	and r0, r1
	lsl r1, r1, #2
	lsr r1, r1, #0x1d
	add r1, r1, r5
	lsl r1, r1, #0x1d
	lsr r1, r1, #2
	orr r0, r1
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FB16:
	add r0, r4, #0
	add r0, #0x8c
	ldr r1, [r0]
	ldr r0, _0224FC3C ; =0xFFFFE3FF
	add r4, #0x8c
	and r0, r1
	lsl r1, r1, #0x13
	lsr r1, r1, #0x1d
	add r1, r1, r5
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x13
	orr r0, r1
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FB32:
	add r0, r4, #0
	add r0, #0x8c
	ldr r1, [r0]
	ldr r0, _0224FC40 ; =0xFFFF1FFF
	add r4, #0x8c
	and r0, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x1d
	add r1, r1, r5
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x10
	orr r0, r1
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FB4E:
	add r0, r4, #0
	add r0, #0x8c
	ldr r1, [r0]
	ldr r0, _0224FC44 ; =0xFFF8FFFF
	add r4, #0x8c
	and r0, r1
	lsl r1, r1, #0xd
	lsr r1, r1, #0x1d
	add r1, r1, r5
	lsl r1, r1, #0x1d
	lsr r1, r1, #0xd
	orr r0, r1
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FB6A:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	add r4, #0x90
	add r0, r0, r5
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FB78:
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r4, #0x94
	add r0, r0, r5
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FB86:
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	add r4, #0x98
	add r0, r0, r5
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FB94:
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	add r4, #0xa0
	add r0, r0, r5
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FBA2:
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	add r4, #0xbc
	add r0, r0, r5
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0224FBB0:
	ldr r2, [r4, #0x28]
	mov r1, #0x40
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x19
	lsr r1, r1, #0x1f
	add r1, r1, r5
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x19
	orr r0, r1
	str r0, [r4, #0x28]
	pop {r4, r5, r6, pc}
_0224FBC8:
	ldr r2, [r4, #0x28]
	mov r1, #0x80
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x1f
	add r1, r1, r5
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x18
	orr r0, r1
	str r0, [r4, #0x28]
	pop {r4, r5, r6, pc}
_0224FBE0:
	add r0, r4, #0
	add r0, #0x26
	ldrb r2, [r0]
	mov r1, #0x1f
	add r4, #0x26
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1b
	lsr r1, r1, #0x1b
	add r1, r1, r5
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0x1f
	and r1, r2
	orr r0, r1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0224FC02:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0224FC08: .word 0xFFFFFC1F
_0224FC0C: .word 0xFFFF83FF
_0224FC10: .word 0xFFF07FFF
_0224FC14: .word 0xFE0FFFFF
_0224FC18: .word 0xC1FFFFFF
_0224FC1C: .word 0xFFFFF8FF
_0224FC20: .word 0xFFFFE7FF
_0224FC24: .word 0xFFFF9FFF
_0224FC28: .word 0xFFFC7FFF
_0224FC2C: .word 0xFFE3FFFF
_0224FC30: .word 0xFF1FFFFF
_0224FC34: .word 0xF8FFFFFF
_0224FC38: .word 0xC7FFFFFF
_0224FC3C: .word 0xFFFFE3FF
_0224FC40: .word 0xFFFF1FFF
_0224FC44: .word 0xFFF8FFFF
	thumb_func_end ov12_0224F7AC

	thumb_func_start ov12_0224FC48
ov12_0224FC48: ; 0x0224FC48
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	str r0, [sp, #4]
	ldr r0, [sp, #0x80]
	str r3, [sp, #0xc]
	str r0, [sp, #0x80]
	mov r0, #0
	str r0, [sp, #0x64]
	str r0, [sp, #0x60]
	ldr r0, [sp, #0x64]
	str r2, [sp, #8]
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0x64]
	ldr r3, _0224FF44 ; =0x00002D8C
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x64]
	add r5, r1, #0
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x64]
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x64]
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x64]
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x64]
	str r0, [sp, #0x34]
	mov r0, #0xc0
	mul r2, r0
	str r2, [sp, #0x18]
	add r2, r5, r3
	ldr r1, [sp, #0x18]
	str r2, [sp, #0x68]
	ldr r1, [r2, r1]
	cmp r1, #0
	bne _0224FCA0
	ldr r2, [sp, #0xc]
	mul r0, r2
	add r0, r5, r0
	ldr r0, [r0, r3]
	cmp r0, #0
	beq _0224FCA0
	add sp, #0x6c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0224FCA0:
	cmp r1, #0
	beq _0224FCBA
	ldr r0, [sp, #0xc]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _0224FF44 ; =0x00002D8C
	add r1, r5, r1
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0224FCBA
	add sp, #0x6c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0224FCBA:
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl ov12_022527CC
	str r0, [sp, #0x2c]
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl ov12_022527CC
	str r0, [sp, #0x28]
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl ov12_02255830
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x58]
	ldr r1, [sp, #8]
	add r0, r5, #0
	mov r2, #0
	bl ov12_02255844
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x54]
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl ov12_02255830
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x50]
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0
	bl ov12_02255844
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0x18]
	ldr r2, _0224FF48 ; =0x00002D5B
	add r0, r5, r0
	ldrsb r4, [r0, r2]
	ldr r0, [sp, #0xc]
	mov r1, #0xc0
	mul r1, r0
	add r0, r5, r1
	str r1, [sp, #0x14]
	ldrsb r7, [r0, r2]
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x56
	bne _0224FD3C
	sub r0, r4, #6
	lsl r0, r0, #1
	add r4, r0, #6
	cmp r4, #0xc
	ble _0224FD36
	mov r4, #0xc
_0224FD36:
	cmp r4, #0
	bge _0224FD3C
	mov r4, #0
_0224FD3C:
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x56
	bne _0224FD5A
	sub r0, r7, #6
	lsl r0, r0, #1
	add r7, r0, #6
	cmp r7, #0xc
	ble _0224FD54
	mov r7, #0xc
_0224FD54:
	cmp r7, #0
	bge _0224FD5A
	mov r7, #0
_0224FD5A:
	ldr r0, [sp, #0x18]
	lsl r1, r4, #1
	add r2, r5, r0
	ldr r0, _0224FF4C ; =0x00002D46
	ldrh r2, [r2, r0]
	ldr r0, _0224FF50 ; =ov12_0226CB88
	ldrb r0, [r0, r1]
	mul r0, r2
	ldr r2, _0224FF54 ; =ov12_0226CB89
	ldrb r1, [r2, r1]
	bl _s32_div_f
	add r6, r0, #0
	ldr r0, [sp, #0x14]
	lsl r1, r7, #1
	add r2, r5, r0
	ldr r0, _0224FF4C ; =0x00002D46
	ldrh r2, [r2, r0]
	ldr r0, _0224FF50 ; =ov12_0226CB88
	ldrb r0, [r0, r1]
	mul r0, r2
	ldr r2, _0224FF54 ; =ov12_0226CB89
	ldrb r1, [r2, r1]
	bl _s32_div_f
	add r4, r0, #0
	mov r0, #0xd
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _0224FE02
	mov r0, #0x4c
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _0224FE02
	ldr r0, [sp, #0x2c]
	cmp r0, #0x21
	bne _0224FDC8
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #3
	tst r0, r1
	bne _0224FDDA
_0224FDC8:
	ldr r0, [sp, #0x2c]
	cmp r0, #0x22
	bne _0224FDDC
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #0x30
	tst r0, r1
	beq _0224FDDC
_0224FDDA:
	lsl r6, r6, #1
_0224FDDC:
	ldr r0, [sp, #0x28]
	cmp r0, #0x21
	bne _0224FDEE
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #3
	tst r0, r1
	bne _0224FE00
_0224FDEE:
	ldr r0, [sp, #0x28]
	cmp r0, #0x22
	bne _0224FE02
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #0x30
	tst r0, r1
	beq _0224FE02
_0224FE00:
	lsl r4, r4, #1
_0224FE02:
	mov r0, #0
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	ldr r7, _0224FF58 ; =ov12_0226CB50
	add r0, r5, r0
	str r0, [sp, #0x1c]
_0224FE0E:
	ldr r2, [sp, #0x1c]
	ldr r1, _0224FF5C ; =0x00002DB8
	add r0, r5, #0
	ldrh r1, [r2, r1]
	mov r2, #1
	bl ov12_02257E74
	ldrb r1, [r7]
	cmp r1, r0
	bne _0224FE26
	lsr r6, r6, #1
	b _0224FE32
_0224FE26:
	ldr r0, [sp, #0x24]
	add r7, r7, #1
	add r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, #8
	blo _0224FE0E
_0224FE32:
	ldr r0, [sp, #0x58]
	cmp r0, #0x73
	bne _0224FE44
	mov r0, #0xf
	mul r0, r6
	mov r1, #0xa
	bl _u32_div_f
	add r6, r0, #0
_0224FE44:
	ldr r0, [sp, #0x58]
	cmp r0, #0x66
	bne _0224FE5A
	ldr r0, [sp, #0x18]
	add r1, r5, r0
	mov r0, #0xb5
	lsl r0, r0, #6
	ldrh r0, [r1, r0]
	cmp r0, #0x84
	bne _0224FE5A
	lsl r6, r6, #1
_0224FE5A:
	ldr r0, [sp, #0x2c]
	cmp r0, #0x5f
	bne _0224FE7C
	ldr r0, [sp, #0x18]
	add r1, r5, r0
	ldr r0, _0224FF60 ; =0x00002DAC
	ldr r0, [r1, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	beq _0224FE7C
	mov r0, #0xf
	mul r0, r6
	mov r1, #0xa
	bl _u32_div_f
	add r6, r0, #0
	b _0224FE8C
_0224FE7C:
	ldr r0, [sp, #0x18]
	add r1, r5, r0
	ldr r0, _0224FF60 ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #0x40
	tst r0, r1
	beq _0224FE8C
	lsr r6, r6, #2
_0224FE8C:
	ldr r0, [sp, #0x2c]
	cmp r0, #0x70
	bne _0224FEA8
	ldr r1, [sp, #0x18]
	mov r0, #0x15
	add r2, r5, r1
	ldr r1, _0224FF64 ; =0x00002DD8
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [r2, r1]
	sub r0, r0, r1
	cmp r0, #5
	bge _0224FEA8
	lsr r6, r6, #1
_0224FEA8:
	ldr r0, [sp, #0x2c]
	cmp r0, #0x54
	bne _0224FEC6
	ldr r0, [sp, #0x18]
	add r2, r5, r0
	ldr r0, _0224FF68 ; =0x00002DCC
	ldr r1, [r2, r0]
	lsl r1, r1, #9
	lsr r1, r1, #0x1f
	beq _0224FEC6
	sub r0, #0x14
	ldrh r0, [r2, r0]
	cmp r0, #0
	bne _0224FEC6
	lsl r6, r6, #1
_0224FEC6:
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl ov12_0223AB1C
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r0, #3
	lsl r0, r0, #8
	tst r0, r1
	beq _0224FEE2
	lsl r6, r6, #1
_0224FEE2:
	ldr r0, [sp, #0x58]
	cmp r0, #0x34
	bne _0224FF20
	ldr r1, [sp, #0x54]
	mov r0, #0x64
	bl _s32_div_f
	add r1, r0, #0
	ldr r0, [sp, #8]
	lsl r0, r0, #1
	add r2, r5, r0
	ldr r0, _0224FF6C ; =0x0000310C
	ldrh r0, [r2, r0]
	bl _s32_div_f
	cmp r1, #0
	bne _0224FF20
	mov r0, #1
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x80]
	cmp r0, #0
	bne _0224FF20
	ldr r0, _0224FF68 ; =0x00002DCC
	ldr r1, [sp, #0x18]
	add r0, r5, r0
	ldr r2, [r0, r1]
	mov r1, #2
	lsl r1, r1, #0x1c
	orr r2, r1
	ldr r1, [sp, #0x18]
	str r2, [r0, r1]
_0224FF20:
	ldr r0, [sp, #0x58]
	cmp r0, #0x2d
	bne _0224FFA4
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _0224FF3A
	ldr r0, [sp, #0x54]
	lsl r0, r0, #0x17
	lsr r0, r0, #0x18
	str r0, [sp, #0x54]
_0224FF3A:
	ldr r0, [sp, #8]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _0224FF70 ; =0x00002D90
	b _0224FF74
	.balign 4, 0
_0224FF44: .word 0x00002D8C
_0224FF48: .word 0x00002D5B
_0224FF4C: .word 0x00002D46
_0224FF50: .word ov12_0226CB88
_0224FF54: .word ov12_0226CB89
_0224FF58: .word ov12_0226CB50
_0224FF5C: .word 0x00002DB8
_0224FF60: .word 0x00002DAC
_0224FF64: .word 0x00002DD8
_0224FF68: .word 0x00002DCC
_0224FF6C: .word 0x0000310C
_0224FF70: .word 0x00002D90
_0224FF74:
	add r1, r5, r1
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x54]
	bl _u32_div_f
	ldr r2, [sp, #0x68]
	ldr r1, [sp, #0x18]
	ldr r1, [r2, r1]
	cmp r1, r0
	bhi _0224FFA4
	mov r0, #1
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x80]
	cmp r0, #0
	bne _0224FFA4
	ldr r0, _0225026C ; =0x00002DCC
	ldr r1, [sp, #0x18]
	add r0, r5, r0
	ldr r2, [r0, r1]
	mov r1, #1
	lsl r1, r1, #0x1c
	orr r2, r1
	ldr r1, [sp, #0x18]
	str r2, [r0, r1]
_0224FFA4:
	ldr r0, [sp, #0x58]
	cmp r0, #0x6b
	bne _0224FFAE
	mov r0, #1
	str r0, [sp, #0x38]
_0224FFAE:
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r7, _02250270 ; =ov12_0226CB50
	add r0, r5, r0
	str r0, [sp, #0x20]
_0224FFBA:
	ldr r2, [sp, #0x20]
	ldr r1, _02250274 ; =0x00002DB8
	add r0, r5, #0
	ldrh r1, [r2, r1]
	mov r2, #1
	bl ov12_02257E74
	ldrb r1, [r7]
	cmp r1, r0
	bne _0224FFD2
	lsr r4, r4, #1
	b _0224FFDE
_0224FFD2:
	ldr r0, [sp, #0x10]
	add r7, r7, #1
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #8
	blo _0224FFBA
_0224FFDE:
	ldr r0, [sp, #0x50]
	cmp r0, #0x73
	bne _0224FFF0
	mov r0, #0xf
	mul r0, r4
	mov r1, #0xa
	bl _u32_div_f
	add r4, r0, #0
_0224FFF0:
	ldr r0, [sp, #0x50]
	cmp r0, #0x66
	bne _02250006
	ldr r0, [sp, #0x14]
	add r1, r5, r0
	mov r0, #0xb5
	lsl r0, r0, #6
	ldrh r0, [r1, r0]
	cmp r0, #0x84
	bne _02250006
	lsl r4, r4, #1
_02250006:
	ldr r0, [sp, #0x28]
	cmp r0, #0x5f
	bne _02250028
	ldr r0, [sp, #0x14]
	add r1, r5, r0
	ldr r0, _02250278 ; =0x00002DAC
	ldr r0, [r1, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	beq _02250028
	mov r0, #0xf
	mul r0, r4
	mov r1, #0xa
	bl _u32_div_f
	add r4, r0, #0
	b _02250038
_02250028:
	ldr r0, [sp, #0x14]
	add r1, r5, r0
	ldr r0, _02250278 ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #0x40
	tst r0, r1
	beq _02250038
	lsr r4, r4, #2
_02250038:
	ldr r0, [sp, #0x28]
	cmp r0, #0x70
	bne _02250054
	ldr r1, [sp, #0x14]
	mov r0, #0x15
	add r2, r5, r1
	ldr r1, _0225027C ; =0x00002DD8
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [r2, r1]
	sub r0, r0, r1
	cmp r0, #5
	bge _02250054
	lsr r4, r4, #1
_02250054:
	ldr r0, [sp, #0x28]
	cmp r0, #0x54
	bne _02250072
	ldr r0, [sp, #0x14]
	add r2, r5, r0
	ldr r0, _0225026C ; =0x00002DCC
	ldr r1, [r2, r0]
	lsl r1, r1, #9
	lsr r1, r1, #0x1f
	beq _02250072
	sub r0, #0x14
	ldrh r0, [r2, r0]
	cmp r0, #0
	bne _02250072
	lsl r4, r4, #1
_02250072:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0xc]
	bl ov12_0223AB1C
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r0, #3
	lsl r0, r0, #8
	tst r0, r1
	beq _0225008E
	lsl r4, r4, #1
_0225008E:
	ldr r0, [sp, #0x50]
	cmp r0, #0x34
	bne _022500CC
	ldr r1, [sp, #0x4c]
	mov r0, #0x64
	bl _s32_div_f
	add r1, r0, #0
	ldr r0, [sp, #0xc]
	lsl r0, r0, #1
	add r2, r5, r0
	ldr r0, _02250280 ; =0x0000310C
	ldrh r0, [r2, r0]
	bl _s32_div_f
	cmp r1, #0
	bne _022500CC
	mov r0, #1
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x80]
	cmp r0, #0
	bne _022500CC
	ldr r0, _0225026C ; =0x00002DCC
	ldr r1, [sp, #0x14]
	add r0, r5, r0
	ldr r2, [r0, r1]
	mov r1, #2
	lsl r1, r1, #0x1c
	orr r2, r1
	ldr r1, [sp, #0x14]
	str r2, [r0, r1]
_022500CC:
	ldr r0, [sp, #0x50]
	cmp r0, #0x2d
	bne _02250120
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _022500E6
	ldr r0, [sp, #0x4c]
	lsl r0, r0, #0x17
	lsr r0, r0, #0x18
	str r0, [sp, #0x4c]
_022500E6:
	ldr r0, [sp, #0xc]
	mov r1, #0xc0
	add r7, r0, #0
	mul r7, r1
	ldr r0, _02250284 ; =0x00002D90
	add r1, r5, r7
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x4c]
	bl _u32_div_f
	ldr r1, _02250288 ; =0x00002D8C
	add r2, r5, r7
	ldr r2, [r2, r1]
	cmp r2, r0
	bhi _02250120
	mov r0, #1
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x80]
	cmp r0, #0
	bne _02250120
	add r1, #0x40
	add r0, r5, r1
	ldr r1, [sp, #0x14]
	ldr r2, [r0, r1]
	mov r1, #1
	lsl r1, r1, #0x1c
	orr r2, r1
	ldr r1, [sp, #0x14]
	str r2, [r0, r1]
_02250120:
	ldr r0, [sp, #0x50]
	cmp r0, #0x6b
	bne _0225012A
	mov r0, #1
	str r0, [sp, #0x34]
_0225012A:
	ldr r0, [sp, #8]
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _0225028C ; =0x000021F0
	str r6, [r1, r0]
	ldr r1, [sp, #0xc]
	lsl r1, r1, #2
	add r1, r5, r1
	str r4, [r1, r0]
	ldr r1, [sp, #0x80]
	cmp r1, #0
	bne _022501E2
	ldr r1, [sp, #0xc]
	ldr r3, _02250290 ; =0x000030BC
	lsl r1, r1, #4
	add r2, r5, r1
	add r1, r0, #0
	sub r1, #0x3c
	ldr r1, [r2, r1]
	sub r0, #0x3c
	str r1, [sp, #0x30]
	ldr r1, [sp, #8]
	lsl r1, r1, #1
	add r1, r5, r1
	ldrh r2, [r1, r3]
	ldr r1, [sp, #0xc]
	lsl r1, r1, #1
	add r1, r5, r1
	ldrh r7, [r1, r3]
	ldr r1, [sp, #8]
	lsl r1, r1, #4
	add r1, r5, r1
	ldr r0, [r1, r0]
	cmp r0, #1
	bne _0225019A
	ldr r0, [sp, #8]
	lsl r0, r0, #6
	add r1, r5, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _02250188
	mov r0, #0xa5
	str r0, [sp, #0x60]
	b _0225019A
_02250188:
	ldr r1, [sp, #8]
	add r0, r5, #0
	add r2, r2, #6
	mov r3, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x60]
_0225019A:
	ldr r0, [sp, #0x30]
	cmp r0, #1
	bne _022501CA
	ldr r0, [sp, #0xc]
	lsl r0, r0, #6
	add r1, r5, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _022501B8
	mov r0, #0xa5
	str r0, [sp, #0x5c]
	b _022501CA
_022501B8:
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	add r2, r7, #6
	mov r3, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x5c]
_022501CA:
	ldr r0, [sp, #0x60]
	mov r1, #0xfa
	lsl r0, r0, #4
	add r0, r5, r0
	lsl r1, r1, #2
	ldrsb r0, [r0, r1]
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x5c]
	lsl r0, r0, #4
	add r0, r5, r0
	ldrsb r0, [r0, r1]
	str r0, [sp, #0x44]
_022501E2:
	ldr r1, [sp, #0x48]
	ldr r0, [sp, #0x44]
	cmp r1, r0
	beq _022501EC
	b _02250352
_022501EC:
	ldr r0, [sp, #0x40]
	cmp r0, #0
	beq _02250218
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _02250218
	cmp r6, r4
	bhs _02250202
	mov r0, #1
	str r0, [sp, #0x64]
	b _0225035A
_02250202:
	cmp r6, r4
	bne _02250256
	ldr r0, [sp, #4]
	bl ov12_0223BD98
	mov r1, #1
	tst r0, r1
	beq _02250256
	mov r0, #2
	str r0, [sp, #0x64]
	b _0225035A
_02250218:
	ldr r0, [sp, #0x40]
	cmp r0, #0
	bne _0225022A
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _0225022A
	mov r0, #1
	str r0, [sp, #0x64]
	b _0225035A
_0225022A:
	ldr r0, [sp, #0x40]
	cmp r0, #0
	beq _0225023C
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _0225023C
	mov r0, #0
	str r0, [sp, #0x64]
	b _0225035A
_0225023C:
	ldr r0, [sp, #0x38]
	cmp r0, #0
	beq _02250294
	ldr r0, [sp, #0x34]
	cmp r0, #0
	beq _02250294
	cmp r6, r4
	bls _02250252
	mov r0, #1
	str r0, [sp, #0x64]
	b _0225035A
_02250252:
	cmp r6, r4
	beq _02250258
_02250256:
	b _0225035A
_02250258:
	ldr r0, [sp, #4]
	bl ov12_0223BD98
	mov r1, #1
	tst r0, r1
	beq _0225035A
	mov r0, #2
	str r0, [sp, #0x64]
	b _0225035A
	nop
_0225026C: .word 0x00002DCC
_02250270: .word ov12_0226CB50
_02250274: .word 0x00002DB8
_02250278: .word 0x00002DAC
_0225027C: .word 0x00002DD8
_02250280: .word 0x0000310C
_02250284: .word 0x00002D90
_02250288: .word 0x00002D8C
_0225028C: .word 0x000021F0
_02250290: .word 0x000030BC
_02250294:
	ldr r0, [sp, #0x38]
	cmp r0, #0
	beq _022502A6
	ldr r0, [sp, #0x34]
	cmp r0, #0
	bne _022502A6
	mov r0, #1
	str r0, [sp, #0x64]
	b _0225035A
_022502A6:
	ldr r0, [sp, #0x38]
	cmp r0, #0
	bne _022502B8
	ldr r0, [sp, #0x34]
	cmp r0, #0
	beq _022502B8
	mov r0, #0
	str r0, [sp, #0x64]
	b _0225035A
_022502B8:
	ldr r0, [sp, #0x2c]
	cmp r0, #0x64
	bne _022502E4
	ldr r0, [sp, #0x28]
	cmp r0, #0x64
	bne _022502E4
	cmp r6, r4
	bls _022502CE
	mov r0, #1
	str r0, [sp, #0x64]
	b _0225035A
_022502CE:
	cmp r6, r4
	bne _0225035A
	ldr r0, [sp, #4]
	bl ov12_0223BD98
	mov r1, #1
	tst r0, r1
	beq _0225035A
	mov r0, #2
	str r0, [sp, #0x64]
	b _0225035A
_022502E4:
	ldr r0, [sp, #0x2c]
	cmp r0, #0x64
	bne _022502F6
	ldr r0, [sp, #0x28]
	cmp r0, #0x64
	beq _022502F6
	mov r0, #1
	str r0, [sp, #0x64]
	b _0225035A
_022502F6:
	ldr r0, [sp, #0x2c]
	cmp r0, #0x64
	beq _02250308
	ldr r0, [sp, #0x28]
	cmp r0, #0x64
	bne _02250308
	mov r0, #0
	str r0, [sp, #0x64]
	b _0225035A
_02250308:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #7
	lsl r0, r0, #0x10
	tst r0, r1
	beq _02250334
	cmp r6, r4
	bls _0225031E
	mov r0, #1
	str r0, [sp, #0x64]
_0225031E:
	cmp r6, r4
	bne _0225035A
	ldr r0, [sp, #4]
	bl ov12_0223BD98
	mov r1, #1
	tst r0, r1
	beq _0225035A
	mov r0, #2
	str r0, [sp, #0x64]
	b _0225035A
_02250334:
	cmp r6, r4
	bhs _0225033C
	mov r0, #1
	str r0, [sp, #0x64]
_0225033C:
	cmp r6, r4
	bne _0225035A
	ldr r0, [sp, #4]
	bl ov12_0223BD98
	mov r1, #1
	tst r0, r1
	beq _0225035A
	mov r0, #2
	str r0, [sp, #0x64]
	b _0225035A
_02250352:
	cmp r1, r0
	bge _0225035A
	mov r0, #1
	str r0, [sp, #0x64]
_0225035A:
	ldr r0, [sp, #0x64]
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov12_0224FC48

	thumb_func_start ov12_02250360
ov12_02250360: ; 0x02250360
	asr r1, r1, #1
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1d
	add r0, r0, r1
	mov r2, #0
	add r0, #0xa4
	str r2, [r0]
	bx lr
	thumb_func_end ov12_02250360

	thumb_func_start ov12_02250370
ov12_02250370: ; 0x02250370
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r2, [sp]
	add r5, r1, #0
	mov r4, #0
	bl ov12_0223A7E0
	add r7, r0, #0
	ldr r0, [sp]
	mov r1, #0xc0
	mul r1, r0
	add r0, r5, r1
	str r0, [sp, #4]
	ldr r0, [sp]
	asr r0, r0, #1
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1d
	add r6, r5, r0
	add r6, #0xa4
_02250396:
	add r0, r4, #0
	bl MaskOfFlagNo
	ldr r1, _022503E0 ; =0x00003108
	ldrb r1, [r5, r1]
	tst r0, r1
	bne _022503CC
	ldr r0, [sp]
	bl MaskOfFlagNo
	ldr r1, _022503E0 ; =0x00003108
	ldrb r1, [r5, r1]
	tst r0, r1
	bne _022503CC
	ldr r1, [sp, #4]
	ldr r0, _022503E4 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022503CC
	ldr r0, _022503E8 ; =0x0000219C
	add r1, r5, r4
	ldrb r0, [r1, r0]
	bl MaskOfFlagNo
	ldr r1, [r6]
	orr r0, r1
	str r0, [r6]
_022503CC:
	add r4, r4, #2
	cmp r7, #0x4a
	beq _022503DA
	cmp r7, #0x4b
	beq _022503DA
	cmp r4, #2
	ble _02250396
_022503DA:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022503E0: .word 0x00003108
_022503E4: .word 0x00002D8C
_022503E8: .word 0x0000219C
	thumb_func_end ov12_02250370

	thumb_func_start ov12_022503EC
ov12_022503EC: ; 0x022503EC
	push {r4, r5, r6, lr}
	ldr r0, _02250478 ; =0x00002170
	add r5, r1, #0
	add r4, r2, #0
	ldr r2, [r5, r0]
	mov r0, #2
	lsl r0, r0, #0x1c
	mov r6, #0
	tst r0, r2
	beq _0225041E
	add r0, r5, #0
	mov r1, #1
	bl ov12_02258348
	str r0, [r4]
	ldr r0, _02250478 ; =0x00002170
	add r1, r6, #0
	str r1, [r5, r0]
	sub r0, r0, #4
	ldr r1, [r5, r0]
	ldr r0, _0225047C ; =0x801FDA49
	tst r0, r1
	bne _02250472
	mov r6, #1
	b _02250472
_0225041E:
	cmp r2, #0
	beq _02250472
	add r0, r5, #0
	mov r1, #1
	bl ov12_02258348
	str r0, [r4]
	add r0, r5, #0
	add r0, #0x94
	ldr r1, [r0]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02250480 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225046C
	ldr r1, _02250484 ; =0x0000216C
	ldr r2, _0225047C ; =0x801FDA49
	ldr r0, [r5, r1]
	tst r2, r0
	beq _0225046A
	add r1, r1, #4
	mov r2, #2
	ldr r1, [r5, r1]
	lsl r2, r2, #0x16
	tst r2, r1
	beq _0225045C
	ldr r2, _02250488 ; =0x00040008
	tst r2, r0
	bne _0225046A
_0225045C:
	mov r2, #1
	lsl r2, r2, #0x1c
	tst r1, r2
	beq _0225046C
	ldr r1, _0225048C ; =0x00010001
	tst r0, r1
	beq _0225046C
_0225046A:
	mov r6, #1
_0225046C:
	ldr r0, _02250478 ; =0x00002170
	mov r1, #0
	str r1, [r5, r0]
_02250472:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_02250478: .word 0x00002170
_0225047C: .word 0x801FDA49
_02250480: .word 0x00002D8C
_02250484: .word 0x0000216C
_02250488: .word 0x00040008
_0225048C: .word 0x00010001
	thumb_func_end ov12_022503EC

	thumb_func_start ov12_02250490
ov12_02250490: ; 0x02250490
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r5, r1, #0
	ldr r0, _022506B0 ; =0x00002174
	add r4, r2, #0
	ldr r2, [r5, r0]
	mov r1, #2
	lsl r1, r1, #0x1c
	add r3, r2, #0
	mov r6, #0
	tst r3, r1
	beq _022504C6
	add r0, r5, #0
	mov r1, #2
	bl ov12_02258348
	str r0, [r4]
	ldr r0, _022506B0 ; =0x00002174
	add r1, r6, #0
	str r1, [r5, r0]
	sub r0, #8
	ldr r1, [r5, r0]
	ldr r0, _022506B4 ; =0x801FDA49
	tst r0, r1
	bne _02250566
	mov r6, #1
	b _022506AA
_022504C6:
	lsr r3, r1, #5
	tst r3, r2
	beq _022504FA
	add r0, r5, #0
	mov r1, #2
	bl ov12_02258348
	str r0, [r4]
	ldr r0, _022506B0 ; =0x00002174
	add r1, r6, #0
	str r1, [r5, r0]
	add r1, r5, #0
	add r1, #0x94
	ldr r1, [r1]
	add r0, r5, #0
	bl ov12_02256838
	cmp r0, #0
	bne _02250566
	ldr r0, _022506B8 ; =0x0000216C
	ldr r1, [r5, r0]
	ldr r0, _022506B4 ; =0x801FDA49
	tst r0, r1
	bne _02250566
	mov r6, #1
	b _022506AA
_022504FA:
	lsr r3, r1, #4
	tst r3, r2
	beq _0225053C
	add r0, r5, #0
	mov r1, #2
	bl ov12_02258348
	str r0, [r4]
	ldr r0, _022506B0 ; =0x00002174
	add r1, r6, #0
	str r1, [r5, r0]
	add r0, r5, #0
	add r0, #0x94
	ldr r1, [r0]
	mov r0, #0xc0
	mul r0, r1
	add r2, r5, r0
	ldr r0, _022506BC ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _02250566
	add r0, r5, #0
	bl ov12_02256838
	cmp r0, #0
	bne _02250566
	ldr r0, _022506B8 ; =0x0000216C
	ldr r1, [r5, r0]
	ldr r0, _022506B4 ; =0x801FDA49
	tst r0, r1
	bne _02250566
	mov r6, #1
	b _022506AA
_0225053C:
	lsr r3, r1, #1
	tst r3, r2
	beq _0225056C
	add r0, r5, #0
	mov r1, #2
	bl ov12_02258348
	str r0, [r4]
	ldr r0, _022506B0 ; =0x00002174
	add r1, r6, #0
	str r1, [r5, r0]
	add r0, r5, #0
	add r0, #0x94
	ldr r1, [r0]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _022506BC ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _02250568
_02250566:
	b _022506AA
_02250568:
	mov r6, #1
	b _022506AA
_0225056C:
	lsr r1, r1, #3
	tst r1, r2
	beq _022505F8
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x20
	ldr r0, _022506C0 ; =0x00003044
	bne _02250590
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _022506C4 ; =0x000003E5
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x11
	lsr r6, r0, #0x10
	b _0225059A
_02250590:
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _022506C4 ; =0x000003E5
	ldrb r6, [r1, r0]
_0225059A:
	cmp r6, #0
	bne _022505A2
	bl GF_AssertFail
_022505A2:
	ldr r0, [sp]
	bl ov12_0223BD98
	mov r1, #0x64
	bl _s32_div_f
	cmp r1, r6
	bge _022505BE
	ldr r1, _022506C8 ; =0x0000213C
	mov r0, #1
	ldr r2, [r5, r1]
	lsl r0, r0, #0x16
	orr r0, r2
	str r0, [r5, r1]
_022505BE:
	ldr r2, _022506B0 ; =0x00002174
	add r0, r5, #0
	ldr r2, [r5, r2]
	mov r1, #2
	bl ov12_02258348
	str r0, [r4]
	ldr r1, _022506B0 ; =0x00002174
	mov r0, #0
	str r0, [r5, r1]
	add r0, r5, #0
	add r0, #0x94
	ldr r2, [r0]
	mov r0, #0xc0
	mul r0, r2
	add r2, r5, r0
	ldr r0, _022506BC ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	bne _022505F4
	add r0, r1, #0
	sub r0, #0x38
	ldr r2, [r5, r0]
	ldr r0, _022506CC ; =0xFFBFFFFF
	sub r1, #0x38
	and r0, r2
	str r0, [r5, r1]
_022505F4:
	mov r6, #1
	b _022506AA
_022505F8:
	cmp r2, #0
	beq _0225067C
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x20
	ldr r0, _022506C0 ; =0x00003044
	bne _0225061A
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _022506C4 ; =0x000003E5
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x11
	lsr r7, r0, #0x10
	b _02250624
_0225061A:
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _022506C4 ; =0x000003E5
	ldrb r7, [r1, r0]
_02250624:
	cmp r7, #0
	bne _0225062C
	bl GF_AssertFail
_0225062C:
	ldr r0, [sp]
	bl ov12_0223BD98
	mov r1, #0x64
	bl _s32_div_f
	cmp r1, r7
	bge _022506AA
	ldr r2, _022506B0 ; =0x00002174
	add r0, r5, #0
	ldr r2, [r5, r2]
	mov r1, #2
	bl ov12_02258348
	str r0, [r4]
	ldr r0, _022506B0 ; =0x00002174
	mov r1, #0
	str r1, [r5, r0]
	add r0, r5, #0
	add r0, #0x94
	ldr r1, [r0]
	mov r0, #0xc0
	mul r0, r1
	add r2, r5, r0
	ldr r0, _022506BC ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _022506AA
	add r0, r5, #0
	bl ov12_02256838
	cmp r0, #0
	bne _022506AA
	ldr r0, _022506B8 ; =0x0000216C
	ldr r1, [r5, r0]
	ldr r0, _022506B4 ; =0x801FDA49
	tst r0, r1
	bne _022506AA
	mov r6, #1
	b _022506AA
_0225067C:
	add r0, r0, #4
	ldr r2, [r5, r0]
	cmp r2, #0
	beq _022506AA
	add r0, r5, #0
	mov r1, #3
	bl ov12_02258348
	str r0, [r4]
	ldr r0, _022506D0 ; =0x00002178
	add r1, r6, #0
	str r1, [r5, r0]
	add r0, r5, #0
	add r0, #0x94
	ldr r1, [r0]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _022506BC ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022506AA
	mov r6, #1
_022506AA:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022506B0: .word 0x00002174
_022506B4: .word 0x801FDA49
_022506B8: .word 0x0000216C
_022506BC: .word 0x00002D8C
_022506C0: .word 0x00003044
_022506C4: .word 0x000003E5
_022506C8: .word 0x0000213C
_022506CC: .word 0xFFBFFFFF
_022506D0: .word 0x00002178
	thumb_func_end ov12_02250490

	thumb_func_start ov12_022506D4
ov12_022506D4: ; 0x022506D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	mov r0, #0xff
	add r4, r1, #0
	add r5, r2, #0
	str r0, [sp, #0xc]
	cmp r3, #0
	beq _022506F0
	lsl r0, r3, #4
	add r1, r4, r0
	ldr r0, _0225099C ; =0x000003E6
	ldrh r0, [r1, r0]
	b _022506F2
_022506F0:
	ldr r0, [sp, #0x34]
_022506F2:
	cmp r0, #4
	bne _02250782
	add r0, r6, #0
	bl ov12_0223A7F0
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	bl ov12_0223A7E8
	bl ov12_02261258
	ldr r1, _022509A0 ; =0x0000217E
	mov r2, #0
	strb r2, [r4, r1]
	ldrb r1, [r4, r1]
	ldr r2, [sp, #8]
	cmp r1, r2
	bge _02250770
	mov r2, #1
	add r5, r0, #0
	and r5, r2
_0225071E:
	ldr r0, _022509A4 ; =0x000021EC
	add r1, r4, r1
	ldrb r7, [r1, r0]
	mov r0, #0xc0
	mul r0, r7
	add r1, r4, r0
	ldr r0, _022509A8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225075E
	add r0, r6, #0
	add r1, r7, #0
	bl ov12_0223A7E8
	str r0, [sp]
	cmp r5, #0
	beq _0225074A
	bl ov12_02261258
	mov r1, #1
	tst r0, r1
	beq _0225075A
_0225074A:
	cmp r5, #0
	bne _0225075E
	ldr r0, [sp]
	bl ov12_02261258
	mov r1, #1
	tst r0, r1
	beq _0225075E
_0225075A:
	str r7, [sp, #0xc]
	b _02250770
_0225075E:
	ldr r0, _022509A0 ; =0x0000217E
	ldrb r0, [r4, r0]
	add r1, r0, #1
	ldr r0, _022509A0 ; =0x0000217E
	strb r1, [r4, r0]
	ldrb r1, [r4, r0]
	ldr r0, [sp, #8]
	cmp r1, r0
	blt _0225071E
_02250770:
	ldr r1, _022509A0 ; =0x0000217E
	ldr r0, [sp, #8]
	ldrb r2, [r4, r1]
	cmp r2, r0
	bne _0225077C
	b _02250A0C
_0225077C:
	add r0, r2, #1
	strb r0, [r4, r1]
	b _02250A0C
_02250782:
	cmp r0, #8
	bne _022507D2
	add r0, r6, #0
	bl ov12_0223A7F0
	add r2, r0, #0
	ldr r0, _022509A0 ; =0x0000217E
	mov r1, #0
	strb r1, [r4, r0]
	ldrb r3, [r4, r0]
	cmp r3, r2
	bge _022507C4
	ldr r7, _022509A8 ; =0x00002D8C
_0225079C:
	ldr r1, _022509A4 ; =0x000021EC
	add r6, r4, r3
	ldrb r1, [r6, r1]
	mov r6, #0xc0
	mul r6, r1
	add r6, r4, r6
	ldr r6, [r6, r7]
	cmp r6, #0
	beq _022507B6
	cmp r1, r5
	beq _022507B6
	str r1, [sp, #0xc]
	b _022507C4
_022507B6:
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	ldr r1, _022509A0 ; =0x0000217E
	ldrb r3, [r4, r1]
	cmp r3, r2
	blt _0225079C
_022507C4:
	cmp r3, r2
	beq _022508B0
	ldr r0, _022509A0 ; =0x0000217E
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _02250A0C
_022507D2:
	mov r1, #2
	lsl r1, r1, #8
	cmp r0, r1
	bne _02250820
	ldr r1, [sp, #0x30]
	cmp r1, #1
	bne _02250820
	add r0, r6, #0
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	beq _0225081C
	add r0, r6, #0
	bl ov12_0223BD98
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	bne _0225081C
	add r0, r6, #0
	add r1, r5, #0
	bl ov12_0223AB6C
	mov r1, #0xc0
	mul r1, r0
	str r0, [sp, #0xc]
	ldr r0, _022509A8 ; =0x00002D8C
	add r1, r4, r1
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _022508B0
	str r5, [sp, #0xc]
	b _02250A0C
_0225081C:
	str r5, [sp, #0xc]
	b _02250A0C
_02250820:
	mov r1, #1
	lsl r1, r1, #0xa
	cmp r0, r1
	bne _0225083C
	ldr r1, [sp, #0x30]
	cmp r1, #1
	bne _0225083C
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	bl ov12_02253DA0
	str r0, [sp, #0xc]
	b _02250A0C
_0225083C:
	cmp r0, #0x80
	bne _0225084E
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	bl ov12_02253DA0
	str r0, [sp, #0xc]
	b _02250A0C
_0225084E:
	cmp r0, #0x10
	beq _0225085E
	cmp r0, #0x20
	beq _0225085E
	cmp r0, #1
	beq _0225085E
	cmp r0, #0x40
	bne _02250862
_0225085E:
	str r5, [sp, #0xc]
	b _02250A0C
_02250862:
	mov r1, #1
	lsl r1, r1, #8
	cmp r0, r1
	bne _02250886
	add r0, r6, #0
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	beq _02250882
	add r0, r6, #0
	add r1, r5, #0
	bl ov12_0223AB6C
	str r0, [sp, #0xc]
	b _02250A0C
_02250882:
	str r5, [sp, #0xc]
	b _02250A0C
_02250886:
	lsl r1, r1, #1
	cmp r0, r1
	bne _022508BA
	add r0, r6, #0
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	beq _022508B6
	lsl r0, r5, #4
	add r1, r4, r0
	ldr r0, _022509AC ; =0x000021AC
	ldr r0, [r1, r0]
	mov r1, #0xc0
	mul r1, r0
	str r0, [sp, #0xc]
	ldr r0, _022509A8 ; =0x00002D8C
	add r1, r4, r1
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022508B2
_022508B0:
	b _02250A0C
_022508B2:
	str r5, [sp, #0xc]
	b _02250A0C
_022508B6:
	str r5, [sp, #0xc]
	b _02250A0C
_022508BA:
	cmp r0, #2
	beq _022508C4
	ldr r0, [sp, #0x30]
	cmp r0, #1
	bne _02250986
_022508C4:
	add r0, r6, #0
	bl ov12_0223A7E0
	str r0, [sp, #0x10]
	add r0, r6, #0
	add r1, r5, #0
	bl ov12_0223AB1C
	add r7, r0, #0
	mov r1, #1
	eor r7, r1
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #0
	bl ov12_0223ABB8
	str r0, [sp, #0x14]
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #2
	bl ov12_0223ABB8
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	mov r1, #2
	tst r0, r1
	beq _0225096E
	mov r0, #0x71
	lsl r0, r0, #2
	add r1, r4, r0
	lsl r0, r7, #3
	ldr r0, [r1, r0]
	lsl r1, r0, #0xb
	lsr r1, r1, #0x1f
	beq _02250920
	lsl r0, r0, #9
	lsr r0, r0, #0x1e
	mov r1, #0xc0
	mul r1, r0
	add r2, r4, r1
	ldr r1, _022509A8 ; =0x00002D8C
	ldr r1, [r2, r1]
	cmp r1, #0
	beq _02250920
	str r0, [sp, #0xc]
	b _02250A0C
_02250920:
	ldr r0, [sp, #0x14]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	add r0, r4, r2
	ldr r2, _022509A8 ; =0x00002D8C
	ldr r0, [r0, r2]
	cmp r0, #0
	beq _02250950
	ldr r3, [sp, #0x18]
	mul r1, r3
	add r1, r4, r1
	ldr r1, [r1, r2]
	cmp r1, #0
	beq _02250950
	add r0, r6, #0
	bl ov12_0223BD98
	lsl r0, r0, #0x1f
	lsr r1, r0, #0x1d
	add r0, sp, #0x14
	ldr r0, [r0, r1]
	str r0, [sp, #0xc]
	b _02250A0C
_02250950:
	cmp r0, #0
	beq _0225095A
	ldr r0, [sp, #0x14]
	str r0, [sp, #0xc]
	b _02250A0C
_0225095A:
	ldr r2, [sp, #0x18]
	mov r0, #0xc0
	mul r0, r2
	add r1, r4, r0
	ldr r0, _022509A8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02250A0C
	str r2, [sp, #0xc]
	b _02250A0C
_0225096E:
	mov r0, #1
	add r2, r5, #0
	eor r2, r0
	mov r0, #0xc0
	mul r0, r2
	add r1, r4, r0
	ldr r0, _022509A8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02250A0C
	str r2, [sp, #0xc]
	b _02250A0C
_02250986:
	add r0, r6, #0
	add r1, r5, #0
	bl ov12_0223AB1C
	mov r1, #1
	eor r0, r1
	str r0, [sp, #4]
	lsl r0, r5, #4
	add r1, r4, r0
	ldr r0, _022509AC ; =0x000021AC
	b _022509B0
	.balign 4, 0
_0225099C: .word 0x000003E6
_022509A0: .word 0x0000217E
_022509A4: .word 0x000021EC
_022509A8: .word 0x00002D8C
_022509AC: .word 0x000021AC
_022509B0:
	ldr r7, [r1, r0]
	add r0, r6, #0
	bl ov12_0223A7F0
	mov r0, #0x71
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, [sp, #4]
	lsl r0, r0, #3
	ldr r0, [r1, r0]
	lsl r1, r0, #0xb
	lsr r1, r1, #0x1f
	beq _022509E0
	lsl r0, r0, #9
	lsr r0, r0, #0x1e
	mov r1, #0xc0
	mul r1, r0
	add r2, r4, r1
	ldr r1, _02250A14 ; =0x00002D8C
	ldr r1, [r2, r1]
	cmp r1, #0
	beq _022509E0
	str r0, [sp, #0xc]
	b _02250A0C
_022509E0:
	mov r0, #0xc0
	mul r0, r7
	add r1, r4, r0
	ldr r0, _02250A14 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022509F2
	str r7, [sp, #0xc]
	b _02250A0C
_022509F2:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	bl ov12_02253DA0
	mov r1, #0xc0
	mul r1, r0
	add r2, r4, r1
	ldr r1, _02250A14 ; =0x00002D8C
	ldr r1, [r2, r1]
	cmp r1, #0
	beq _02250A0C
	str r0, [sp, #0xc]
_02250A0C:
	ldr r0, [sp, #0xc]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02250A14: .word 0x00002D8C
	thumb_func_end ov12_022506D4

	thumb_func_start ov12_02250A18
ov12_02250A18: ; 0x02250A18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x6c]
	add r7, r2, #0
	add r6, r3, #0
	cmp r0, #0xff
	beq _02250A72
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_022527CC
	cmp r0, #0x60
	beq _02250A72
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_022527CC
	cmp r0, #0x68
	beq _02250A72
	ldr r0, [sp, #4]
	add r1, r7, #0
	bl ov12_0223AB1C
	add r2, r0, #0
	mov r1, #1
	mov r0, #0x71
	eor r2, r1
	lsl r0, r0, #2
	add r1, r5, r0
	lsl r0, r2, #3
	ldr r0, [r1, r0]
	lsl r1, r0, #0xb
	lsr r1, r1, #0x1f
	beq _02250A74
	lsl r0, r0, #9
	lsr r1, r0, #0x1e
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02250BA8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02250A74
_02250A72:
	b _02250BA4
_02250A74:
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r7, #0
	add r3, r6, #0
	bl ov12_02258688
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _02250A90
	lsl r0, r6, #4
	add r1, r5, r0
	ldr r0, _02250BAC ; =0x000003E2
	ldrb r0, [r1, r0]
	str r0, [sp, #0xc]
_02250A90:
	ldr r0, [sp, #4]
	bl ov12_0223A7F0
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r0, #0xd
	bne _02250B20
	lsl r0, r6, #4
	add r1, r5, r0
	ldr r0, _02250BB0 ; =0x000003E6
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _02250AAE
	cmp r0, #2
	bne _02250B20
_02250AAE:
	ldr r0, _02250BB4 ; =0x0000213C
	ldr r1, [r5, r0]
	mov r0, #0x20
	tst r0, r1
	bne _02250B20
	mov r0, #0x1f
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #9
	add r3, r7, #0
	bl ov12_02252324
	cmp r0, #0
	beq _02250B20
	ldr r0, [sp, #8]
	mov r6, #0
	cmp r0, #0
	ble _02250B00
_02250AD4:
	ldr r0, _02250BB8 ; =0x000021EC
	add r1, r5, r6
	ldrb r4, [r1, r0]
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_022527CC
	cmp r0, #0x1f
	bne _02250AF8
	mov r0, #0xc0
	mul r0, r4
	add r1, r5, r0
	ldr r0, _02250BA8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02250AF8
	cmp r7, r4
	bne _02250B00
_02250AF8:
	ldr r0, [sp, #8]
	add r6, r6, #1
	cmp r6, r0
	blt _02250AD4
_02250B00:
	ldr r0, [r5, #0x6c]
	cmp r4, r0
	beq _02250BA4
	mov r0, #0xb5
	lsl r0, r0, #2
	add r3, r5, r0
	mov r0, #0x1c
	add r2, r4, #0
	mul r2, r0
	ldr r1, [r3, r2]
	mov r0, #2
	orr r0, r1
	str r0, [r3, r2]
	add sp, #0x10
	str r4, [r5, #0x6c]
	pop {r3, r4, r5, r6, r7, pc}
_02250B20:
	ldr r0, [sp, #0xc]
	cmp r0, #0xb
	bne _02250BA4
	lsl r0, r6, #4
	add r1, r5, r0
	ldr r0, _02250BB0 ; =0x000003E6
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _02250B36
	cmp r0, #2
	bne _02250BA4
_02250B36:
	ldr r0, _02250BB4 ; =0x0000213C
	ldr r1, [r5, r0]
	mov r0, #0x20
	tst r0, r1
	bne _02250BA4
	mov r0, #0x72
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #9
	add r3, r7, #0
	bl ov12_02252324
	cmp r0, #0
	beq _02250BA4
	ldr r0, [sp, #8]
	mov r6, #0
	cmp r0, #0
	ble _02250B88
_02250B5C:
	ldr r0, _02250BB8 ; =0x000021EC
	add r1, r5, r6
	ldrb r4, [r1, r0]
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_022527CC
	cmp r0, #0x72
	bne _02250B80
	mov r0, #0xc0
	mul r0, r4
	add r1, r5, r0
	ldr r0, _02250BA8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02250B80
	cmp r7, r4
	bne _02250B88
_02250B80:
	ldr r0, [sp, #8]
	add r6, r6, #1
	cmp r6, r0
	blt _02250B5C
_02250B88:
	ldr r0, [r5, #0x6c]
	cmp r4, r0
	beq _02250BA4
	mov r0, #0xb5
	lsl r0, r0, #2
	add r3, r5, r0
	mov r0, #0x1c
	add r2, r4, #0
	mul r2, r0
	ldr r1, [r3, r2]
	mov r0, #4
	orr r0, r1
	str r0, [r3, r2]
	str r4, [r5, #0x6c]
_02250BA4:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02250BA8: .word 0x00002D8C
_02250BAC: .word 0x000003E2
_02250BB0: .word 0x000003E6
_02250BB4: .word 0x0000213C
_02250BB8: .word 0x000021EC
	thumb_func_end ov12_02250A18

	thumb_func_start ov12_02250BBC
ov12_02250BBC: ; 0x02250BBC
	push {r3, r4, r5, lr}
	ldr r0, _02250C38 ; =0x0000216C
	add r4, r1, #0
	ldr r1, [r4, r0]
	ldr r0, _02250C3C ; =0x801FDA49
	mov r2, #0
	tst r0, r1
	bne _02250BFA
	mov r0, #0xb5
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r3, [r4, #0x6c]
	mov r0, #0x1c
	mul r0, r3
	ldr r3, [r1, r0]
	lsl r5, r3, #0x1e
	lsr r5, r5, #0x1f
	beq _02250BFA
	mov r2, #2
	bic r3, r2
	str r3, [r1, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xb4
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r2, #1
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_02250BFA:
	ldr r0, _02250C38 ; =0x0000216C
	ldr r1, [r4, r0]
	ldr r0, _02250C3C ; =0x801FDA49
	tst r0, r1
	bne _02250C32
	mov r0, #0xb5
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r3, [r4, #0x6c]
	mov r0, #0x1c
	mul r0, r3
	ldr r3, [r1, r0]
	lsl r5, r3, #0x1d
	lsr r5, r5, #0x1f
	beq _02250C32
	mov r2, #4
	bic r3, r2
	str r3, [r1, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xb4
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r2, #1
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_02250C32:
	add r0, r2, #0
	pop {r3, r4, r5, pc}
	nop
_02250C38: .word 0x0000216C
_02250C3C: .word 0x801FDA49
	thumb_func_end ov12_02250BBC

	thumb_func_start ov12_02250C40
ov12_02250C40: ; 0x02250C40
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r4, r2, #0
	mov r0, #0xc0
	add r5, r1, #0
	mul r0, r4
	add r1, r5, r0
	ldr r0, _02250C6C ; =0x00002DB8
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _02250C60
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov12_022585A8
_02250C60:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov12_02263B4C
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02250C6C: .word 0x00002DB8
	thumb_func_end ov12_02250C40

	thumb_func_start ov12_02250C70
ov12_02250C70: ; 0x02250C70
	push {r4, r5}
	ldr r0, _02250C98 ; =0x00002DB0
	add r4, r2, #0
	add r5, r1, r0
	mov r0, #0xc0
	mul r4, r0
	mov r0, #1
	ldr r3, [r5, r4]
	lsl r0, r0, #0xc
	orr r0, r3
	str r0, [r5, r4]
	ldr r0, _02250C9C ; =0x00003044
	lsl r2, r2, #2
	ldr r3, [r1, r0]
	add r1, r1, r2
	add r0, #8
	str r3, [r1, r0]
	pop {r4, r5}
	bx lr
	nop
_02250C98: .word 0x00002DB0
_02250C9C: .word 0x00003044
	thumb_func_end ov12_02250C70

	thumb_func_start ov12_02250CA0
ov12_02250CA0: ; 0x02250CA0
	push {r4, r5}
	ldr r4, _02250CE4 ; =0x00002DB0
	add r3, r2, #0
	mov r0, #0xc0
	mul r3, r0
	add r0, r1, r4
	ldr r5, [r0, r3]
	ldr r2, _02250CE8 ; =0xFFFFEFFF
	and r2, r5
	str r2, [r0, r3]
	ldr r5, [r0, r3]
	ldr r2, _02250CEC ; =0xFFFFFCFF
	and r2, r5
	str r2, [r0, r3]
	add r0, r4, #0
	add r0, #0x10
	add r5, r1, r0
	ldr r2, [r5, r3]
	ldr r0, _02250CF0 ; =0xDFFBFF3F
	add r4, #0x18
	and r0, r2
	str r0, [r5, r3]
	add r2, r1, r4
	ldr r1, [r2, r3]
	ldr r0, _02250CF4 ; =0xFFFC7FFF
	and r0, r1
	str r0, [r2, r3]
	ldr r1, [r2, r3]
	ldr r0, _02250CF8 ; =0xFFE3FFFF
	and r0, r1
	str r0, [r2, r3]
	pop {r4, r5}
	bx lr
	nop
_02250CE4: .word 0x00002DB0
_02250CE8: .word 0xFFFFEFFF
_02250CEC: .word 0xFFFFFCFF
_02250CF0: .word 0xDFFBFF3F
_02250CF4: .word 0xFFFC7FFF
_02250CF8: .word 0xFFE3FFFF
	thumb_func_end ov12_02250CA0

	thumb_func_start ov12_02250CFC
ov12_02250CFC: ; 0x02250CFC
	mov r2, #0xc0
	mul r2, r1
	add r1, r0, r2
	ldr r0, _02250D48 ; =0x00002DAC
	ldr r0, [r1, r0]
	mov r1, #7
	tst r1, r0
	beq _02250D10
	mov r0, #1
	bx lr
_02250D10:
	mov r1, #8
	tst r1, r0
	beq _02250D1A
	mov r0, #2
	bx lr
_02250D1A:
	mov r1, #0x10
	tst r1, r0
	beq _02250D24
	mov r0, #3
	bx lr
_02250D24:
	mov r1, #0x20
	tst r1, r0
	beq _02250D2E
	mov r0, #4
	bx lr
_02250D2E:
	mov r1, #0x40
	tst r1, r0
	beq _02250D38
	mov r0, #5
	bx lr
_02250D38:
	mov r1, #0x80
	tst r0, r1
	beq _02250D42
	mov r0, #2
	bx lr
_02250D42:
	mov r0, #0
	bx lr
	nop
_02250D48: .word 0x00002DAC
	thumb_func_end ov12_02250CFC

	thumb_func_start ov12_02250D4C
ov12_02250D4C: ; 0x02250D4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r7, r1, #0
	bl ov12_0223A7E0
	mov r1, #0x84
	tst r1, r0
	beq _02250D64
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02250D64:
	mov r1, #1
	add r2, r0, #0
	tst r2, r1
	bne _02250D72
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02250D72:
	mov r2, #2
	tst r0, r2
	beq _02250D7E
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02250D7E:
	ldr r0, [sp]
	bl ov12_0223A9AC
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #4]
_02250D8A:
	ldr r0, [sp, #4]
	cmp r0, #4
	bls _02250D92
	b _02250F28
_02250D92:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02250D9E: ; jump table
	.short _02250DA8 - _02250D9E - 2 ; case 0
	.short _02250DEC - _02250D9E - 2 ; case 1
	.short _02250E34 - _02250D9E - 2 ; case 2
	.short _02250EA8 - _02250D9E - 2 ; case 3
	.short _02250F28 - _02250D9E - 2 ; case 4
_02250DA8:
	ldr r0, _02250F38 ; =0x00002E7C
	ldrb r0, [r7, r0]
	cmp r0, #1
	bne _02250DE4
	mov r0, #0x85
	lsl r0, r0, #6
	ldr r1, [r7, r0]
	mov r0, #0x20
	tst r0, r1
	bne _02250DE4
	ldr r0, [sp, #8]
	mov r1, #0xd
	mov r2, #5
	bl TrainerMessageWithIdPairExists
	cmp r0, #0
	beq _02250DE4
	mov r1, #0x85
	lsl r1, r1, #6
	ldr r2, [r7, r1]
	mov r0, #0x20
	orr r0, r2
	str r0, [r7, r1]
	mov r0, #0x13
	mov r1, #0xd
	lsl r0, r0, #4
	str r1, [r7, r0]
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02250DE4:
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	b _02250F28
_02250DEC:
	ldr r1, _02250F3C ; =0x00002E7D
	mov r0, #2
	ldrb r2, [r7, r1]
	tst r0, r2
	bne _02250E2C
	add r0, r1, #0
	sub r0, #0x31
	sub r1, #0x2d
	ldr r2, [r7, r0]
	ldr r0, [r7, r1]
	lsr r0, r0, #1
	cmp r2, r0
	bhi _02250E2C
	ldr r0, [sp, #8]
	mov r1, #0xe
	mov r2, #5
	bl TrainerMessageWithIdPairExists
	cmp r0, #0
	beq _02250E2C
	ldr r1, _02250F3C ; =0x00002E7D
	mov r0, #2
	ldrb r2, [r7, r1]
	add sp, #0xc
	orr r0, r2
	strb r0, [r7, r1]
	mov r0, #0x13
	mov r1, #0xe
	lsl r0, r0, #4
	str r1, [r7, r0]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02250E2C:
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	b _02250F28
_02250E34:
	ldr r0, _02250F3C ; =0x00002E7D
	ldrb r1, [r7, r0]
	mov r0, #3
	tst r0, r1
	bne _02250EA0
	ldr r0, [sp]
	mov r1, #1
	bl ov12_0223A7F4
	mov r6, #0
	add r5, r0, #0
	add r4, r6, #0
	bl GetPartyCount
	cmp r0, #0
	ble _02250E76
_02250E54:
	add r0, r5, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02250E6A
	add r6, r6, #1
_02250E6A:
	add r0, r5, #0
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _02250E54
_02250E76:
	cmp r6, #1
	bne _02250EA0
	ldr r0, [sp, #8]
	mov r1, #0xf
	mov r2, #5
	bl TrainerMessageWithIdPairExists
	cmp r0, #0
	beq _02250EA0
	ldr r1, _02250F3C ; =0x00002E7D
	mov r0, #3
	ldrb r2, [r7, r1]
	add sp, #0xc
	orr r0, r2
	strb r0, [r7, r1]
	mov r0, #0x13
	mov r1, #0xf
	lsl r0, r0, #4
	str r1, [r7, r0]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02250EA0:
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	b _02250F28
_02250EA8:
	ldr r0, _02250F3C ; =0x00002E7D
	ldrb r1, [r7, r0]
	mov r0, #4
	tst r0, r1
	bne _02250F22
	ldr r0, [sp]
	mov r1, #1
	bl ov12_0223A7F4
	mov r6, #0
	add r5, r0, #0
	add r4, r6, #0
	bl GetPartyCount
	cmp r0, #0
	ble _02250EEA
_02250EC8:
	add r0, r5, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02250EDE
	add r6, r6, #1
_02250EDE:
	add r0, r5, #0
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _02250EC8
_02250EEA:
	cmp r6, #1
	bne _02250F22
	ldr r0, _02250F40 ; =0x00002E4C
	ldr r1, [r7, r0]
	add r0, r0, #4
	ldr r0, [r7, r0]
	lsr r0, r0, #1
	cmp r1, r0
	bhi _02250F22
	ldr r0, [sp, #8]
	mov r1, #0x10
	mov r2, #5
	bl TrainerMessageWithIdPairExists
	cmp r0, #0
	beq _02250F22
	ldr r1, _02250F3C ; =0x00002E7D
	mov r0, #4
	ldrb r2, [r7, r1]
	add sp, #0xc
	orr r0, r2
	strb r0, [r7, r1]
	mov r0, #0x13
	mov r1, #0x10
	lsl r0, r0, #4
	str r1, [r7, r0]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02250F22:
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_02250F28:
	ldr r0, [sp, #4]
	cmp r0, #4
	beq _02250F30
	b _02250D8A
_02250F30:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02250F38: .word 0x00002E7C
_02250F3C: .word 0x00002E7D
_02250F40: .word 0x00002E4C
	thumb_func_end ov12_02250D4C

	thumb_func_start ov12_02250F44
ov12_02250F44: ; 0x02250F44
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _02251024 ; =0x00002144
	add r5, r0, #0
	mov r4, #0
	add r0, r1, #0
	str r4, [r5, r1]
	mov r2, #1
	add r0, #0xc
	str r2, [r5, r0]
	add r0, r1, #0
	add r0, #8
	str r4, [r5, r0]
	add r0, r1, #0
	add r0, #0x10
	str r4, [r5, r0]
	add r0, r1, #0
	mov r2, #0xa
	add r0, #0x14
	str r2, [r5, r0]
	add r0, r1, #0
	add r0, #0x1c
	str r4, [r5, r0]
	add r0, r1, #0
	add r0, #0x20
	str r4, [r5, r0]
	add r0, r1, #0
	add r0, #0x28
	str r4, [r5, r0]
	mov r0, #0xff
	add r2, r1, #0
	str r0, [r5, #0x74]
	add r2, #0x2c
	str r4, [r5, r2]
	add r2, r1, #0
	add r2, #0x30
	str r4, [r5, r2]
	add r2, r1, #0
	add r2, #0x34
	str r4, [r5, r2]
	add r2, r5, #0
	add r2, #0x88
	str r4, [r2]
	add r2, r5, #0
	add r2, #0x8c
	str r4, [r2]
	add r2, r5, #0
	add r2, #0x94
	str r0, [r2]
	add r0, r1, #0
	add r0, #0x38
	strb r4, [r5, r0]
	add r0, r1, #0
	add r0, #0x39
	strb r4, [r5, r0]
	add r0, r1, #0
	add r0, #0x3a
	strb r4, [r5, r0]
	add r0, r1, #0
	add r0, #0x3c
	str r4, [r5, r0]
	add r0, r1, #0
	str r4, [r5, #0x38]
	add r0, #0x40
	str r4, [r5, r0]
	add r0, r1, #0
	add r0, #0x44
	str r4, [r5, r0]
	str r4, [r5, #0x10]
	str r4, [r5, #0x18]
	str r4, [r5, #0x20]
	str r4, [r5, #0x28]
	str r4, [r5, #0x30]
	str r4, [r5, #0x3c]
	str r4, [r5, #0x40]
	str r4, [r5, #0x48]
	str r4, [r5, #0x4c]
	str r4, [r5, #0x50]
	add r0, r1, #0
	str r4, [r5, #0x54]
	sub r0, #8
	ldr r2, [r5, r0]
	ldr r0, _02251028 ; =0xFF800000
	mov r7, #6
	and r2, r0
	add r0, r1, #0
	sub r0, #8
	str r2, [r5, r0]
	sub r0, r1, #4
	ldr r2, [r5, r0]
	ldr r0, _0225102C ; =0xFFFFFEA1
	and r2, r0
	sub r0, r1, #4
	str r2, [r5, r0]
	ldr r0, _02251030 ; =0x00003120
	strb r4, [r5, r0]
	mov r0, #0xb5
	lsl r0, r0, #2
	add r6, r5, r0
_02251008:
	mov r0, #0
	add r1, r6, #0
	mov r2, #0x1c
	bl MIi_CpuClearFast
	add r1, r5, r4
	ldr r0, _02251034 ; =0x000021A4
	add r4, r4, #1
	add r6, #0x1c
	strb r7, [r1, r0]
	cmp r4, #4
	blt _02251008
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02251024: .word 0x00002144
_02251028: .word 0xFF800000
_0225102C: .word 0xFFFFFEA1
_02251030: .word 0x00003120
_02251034: .word 0x000021A4
	thumb_func_end ov12_02250F44

	thumb_func_start ov12_02251038
ov12_02251038: ; 0x02251038
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r0, #0
	mov r4, #0
	add r5, r6, #0
_02251042:
	ldr r0, _022510A4 ; =0x0000306C
	mov r1, #0xff
	strh r1, [r5, r0]
	ldr r0, _022510A8 ; =0x000021A0
	add r2, r6, r4
	mov r1, #6
	strb r1, [r2, r0]
	add r0, r7, #0
	bl ov12_0223BD98
	ldr r1, _022510AC ; =0x0000310C
	add r4, r4, #1
	strh r0, [r5, r1]
	add r5, r5, #2
	cmp r4, #4
	blt _02251042
	ldr r0, _022510B0 ; =0x00002168
	mov r1, #1
	str r1, [r6, r0]
	mov r0, #0x5d
	lsl r0, r0, #2
	str r1, [r6, r0]
	add r0, r7, #0
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	bne _02251096
	add r0, r1, #0
	bl MaskOfFlagNo
	ldr r1, _022510B4 ; =0x00003108
	ldrb r2, [r6, r1]
	orr r0, r2
	strb r0, [r6, r1]
	mov r0, #3
	bl MaskOfFlagNo
	ldr r1, _022510B4 ; =0x00003108
	ldrb r2, [r6, r1]
	orr r0, r2
	strb r0, [r6, r1]
_02251096:
	ldr r0, _022510B8 ; =0x0000311C
	mov r1, #6
	strb r1, [r6, r0]
	add r0, r0, #1
	strb r1, [r6, r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022510A4: .word 0x0000306C
_022510A8: .word 0x000021A0
_022510AC: .word 0x0000310C
_022510B0: .word 0x00002168
_022510B4: .word 0x00003108
_022510B8: .word 0x0000311C
	thumb_func_end ov12_02251038

	thumb_func_start ov12_022510BC
ov12_022510BC: ; 0x022510BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	str r1, [sp, #4]
	str r0, [sp]
	ldr r1, _02251400 ; =0x00002DC8
	ldr r0, [sp, #4]
	add r4, r2, #0
	add r1, r0, r1
	mov r0, #0xc0
	mul r0, r4
	add r5, r1, r0
	str r5, [sp, #0x14]
	add r3, sp, #0x20
	mov r2, #7
_022510D8:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _022510D8
	ldr r0, [sp]
	bl ov12_0223A7F0
	add r6, r0, #0
	ldr r0, [sp]
	bl ov12_0223A7E0
	ldr r1, [sp, #4]
	lsl r2, r4, #4
	add r1, r1, r2
	ldr r2, _02251404 ; =0x000021A8
	mov r0, #0x28
	str r0, [r1, r2]
	ldr r1, [sp, #4]
	sub r2, #0x6c
	ldr r1, [r1, r2]
	add r0, #0xd8
	tst r0, r1
	bne _02251196
	mov r5, #0
	cmp r6, #0
	ble _02251172
	ldr r1, [sp, #4]
	ldr r2, _02251408 ; =0x00002DCC
	add r0, r1, #0
	add r2, r0, r2
	mov r0, #0x18
	mov ip, r0
	mov r7, #3
_0225111A:
	ldr r0, _0225140C ; =0x00002DB0
	ldr r3, [r1, r0]
	mov r0, #1
	lsl r0, r0, #0x1a
	tst r0, r3
	beq _0225113C
	ldr r0, [r2]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1e
	cmp r4, r0
	bne _0225113C
	ldr r0, _0225140C ; =0x00002DB0
	ldr r3, [r1, r0]
	ldr r0, _02251410 ; =0xFBFFFFFF
	and r3, r0
	ldr r0, _0225140C ; =0x00002DB0
	str r3, [r1, r0]
_0225113C:
	mov r0, #0xb7
	lsl r0, r0, #6
	ldr r3, [r1, r0]
	mov r0, #0x18
	tst r0, r3
	beq _02251168
	ldr r0, [r2]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1e
	cmp r4, r0
	bne _02251168
	mov r0, #0xb7
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	mov r3, ip
	bic r0, r3
	mov r3, #0xb7
	lsl r3, r3, #6
	str r0, [r1, r3]
	ldr r0, [r2]
	bic r0, r7
	str r0, [r2]
_02251168:
	add r5, r5, #1
	add r1, #0xc0
	add r2, #0xc0
	cmp r5, r6
	blt _0225111A
_02251172:
	mov r0, #0xc0
	mul r0, r4
	str r0, [sp, #0xc]
	ldr r2, [sp, #4]
	ldr r1, [sp, #0xc]
	mov r0, #0
	add r1, r2, r1
	ldr r2, _0225140C ; =0x00002DB0
	str r0, [r1, r2]
	ldr r1, [sp, #4]
	add r2, #0x10
	add r2, r1, r2
	ldr r1, [sp, #0xc]
	add r1, r2, r1
	str r1, [sp, #0x10]
	ldr r1, [sp, #0xc]
	str r0, [r2, r1]
	b _0225120E
_02251196:
	mov r0, #0xc0
	mul r0, r4
	str r0, [sp, #0xc]
	ldr r1, _0225140C ; =0x00002DB0
	ldr r0, [sp, #4]
	ldr r2, [sp, #0xc]
	add r0, r0, r1
	ldr r3, [r0, r2]
	ldr r2, _02251414 ; =0x15100007
	and r3, r2
	ldr r2, [sp, #0xc]
	str r3, [r0, r2]
	add r2, r1, #0
	ldr r0, [sp, #4]
	add r2, #0x10
	add r0, r0, r2
	ldr r2, [sp, #0xc]
	add r2, r0, r2
	str r2, [sp, #0x10]
	ldr r2, [sp, #0xc]
	ldr r3, [r0, r2]
	ldr r2, _02251418 ; =0x0FA3843F
	and r3, r2
	ldr r2, [sp, #0xc]
	str r3, [r0, r2]
	mov r2, #0
	cmp r6, #0
	ble _0225120E
	ldr r0, [sp, #4]
	add r1, #0x1c
	add r3, r0, #0
	add r1, r3, r1
	mov r7, #0x18
_022511D8:
	mov r3, #0xb7
	lsl r3, r3, #6
	ldr r5, [r0, r3]
	mov r3, #0x18
	tst r3, r5
	beq _02251204
	ldr r3, [r1]
	lsl r3, r3, #0x1e
	lsr r3, r3, #0x1e
	cmp r4, r3
	bne _02251204
	mov r3, #0xb7
	lsl r3, r3, #6
	ldr r5, [r0, r3]
	bic r5, r7
	str r5, [r0, r3]
	ldr r5, [r0, r3]
	mov r3, #0x10
	orr r5, r3
	mov r3, #0xb7
	lsl r3, r3, #6
	str r5, [r0, r3]
_02251204:
	add r2, r2, #1
	add r0, #0xc0
	add r1, #0xc0
	cmp r2, r6
	blt _022511D8
_0225120E:
	mov r0, #0
	str r0, [sp, #8]
	cmp r6, #0
	ble _02251276
	ldr r5, [sp, #4]
	ldr r1, _02251408 ; =0x00002DCC
	add r0, r5, #0
	add r7, r0, r1
_0225121E:
	add r0, r4, #0
	bl MaskOfFlagNo
	ldr r1, _0225140C ; =0x00002DB0
	lsl r0, r0, #0x10
	ldr r1, [r5, r1]
	tst r0, r1
	beq _02251246
	add r0, r4, #0
	bl MaskOfFlagNo
	ldr r1, _0225140C ; =0x00002DB0
	lsl r2, r0, #0x10
	mov r0, #0
	mvn r0, r0
	ldr r1, [r5, r1]
	eor r0, r2
	and r1, r0
	ldr r0, _0225140C ; =0x00002DB0
	str r1, [r5, r0]
_02251246:
	ldr r0, _0225140C ; =0x00002DB0
	ldr r1, [r5, r0]
	mov r0, #0xe
	lsl r0, r0, #0xc
	tst r0, r1
	beq _02251268
	ldr r0, [r7]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	cmp r4, r0
	bne _02251268
	ldr r0, _0225140C ; =0x00002DB0
	ldr r1, [r5, r0]
	ldr r0, _0225141C ; =0xFFFF1FFF
	and r1, r0
	ldr r0, _0225140C ; =0x00002DB0
	str r1, [r5, r0]
_02251268:
	ldr r0, [sp, #8]
	add r5, #0xc0
	add r0, r0, #1
	add r7, #0xc0
	str r0, [sp, #8]
	cmp r0, r6
	blt _0225121E
_02251276:
	mov r2, #0
	add r1, r2, #0
_0225127A:
	ldr r0, [sp, #0x14]
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #0x38
	blo _0225127A
	ldr r1, _02251420 ; =0x0000213C
	ldr r0, [sp, #4]
	ldr r1, [r0, r1]
	mov r0, #1
	lsl r0, r0, #8
	tst r0, r1
	beq _0225132E
	ldr r1, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x38]
	add r0, r1, r0
	ldr r1, _02251424 ; =0x00002DE0
	str r2, [r0, r1]
	ldr r0, [sp, #4]
	sub r1, #0x14
	add r0, r0, r1
	ldr r1, [sp, #0xc]
	mov r2, #3
	ldr r1, [r0, r1]
	bic r1, r2
	ldr r2, [sp, #0x24]
	lsl r2, r2, #0x1e
	lsr r3, r2, #0x1e
	mov r2, #3
	and r2, r3
	orr r2, r1
	ldr r1, [sp, #0xc]
	str r2, [r0, r1]
	ldr r3, [sp, #0x20]
	ldr r1, [sp, #0x14]
	lsl r3, r3, #0x11
	lsr r3, r3, #0x1e
	lsl r3, r3, #0x1e
	ldr r1, [r1]
	ldr r2, _02251428 ; =0xFFFF9FFF
	lsr r3, r3, #0x11
	and r1, r2
	orr r3, r1
	ldr r1, [sp, #0x14]
	str r3, [r1]
	ldr r1, [sp, #0xc]
	ldr r3, [r0, r1]
	asr r1, r2, #5
	ldr r2, [sp, #0x24]
	and r1, r3
	lsl r2, r2, #0x16
	lsr r2, r2, #0x1e
	lsl r2, r2, #0x1e
	lsr r2, r2, #0x16
	orr r2, r1
	ldr r1, [sp, #0xc]
	str r2, [r0, r1]
	ldr r2, [r0, r1]
	ldr r1, _0225141C ; =0xFFFF1FFF
	and r1, r2
	ldr r2, [sp, #0x24]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x1d
	lsl r2, r2, #0x1d
	lsr r2, r2, #0x10
	orr r2, r1
	ldr r1, [sp, #0xc]
	str r2, [r0, r1]
	ldr r3, [sp, #0x24]
	ldr r1, [r0, r1]
	lsl r3, r3, #0xa
	ldr r2, _0225142C ; =0xFFC7FFFF
	lsr r3, r3, #0x1d
	lsl r3, r3, #0x1d
	and r1, r2
	lsr r3, r3, #0xa
	orr r3, r1
	ldr r1, [sp, #0xc]
	str r3, [r0, r1]
	ldr r3, [r0, r1]
	asr r1, r2, #3
	ldr r2, [sp, #0x24]
	and r1, r3
	lsl r2, r2, #0xd
	lsr r2, r2, #0x1d
	lsl r2, r2, #0x1d
	lsr r2, r2, #0xd
	orr r2, r1
	ldr r1, [sp, #0xc]
	str r2, [r0, r1]
_0225132E:
	mov r0, #0xc0
	add r3, r0, #0
	ldr r2, [sp, #4]
	add r3, #0x90
	ldr r2, [r2, r3]
	add r1, r4, #0
	ldr r3, [sp, #4]
	mul r1, r0
	add r5, r0, #0
	add r1, r3, r1
	ldr r3, _02251430 ; =0x00002DD4
	add r2, r2, #1
	str r2, [r1, r3]
	ldr r2, [sp, #4]
	add r5, #0x90
	ldr r2, [r2, r5]
	add r0, #0x90
	add r5, r2, #1
	add r2, r3, #4
	str r5, [r1, r2]
	ldr r1, [sp, #0x14]
	lsl r7, r4, #1
	ldr r2, [r1]
	ldr r1, _02251434 ; =0xBFFFFFFF
	mov r3, #0
	and r1, r2
	ldr r2, [sp, #4]
	mov r5, #0xff
	ldr r0, [r2, r0]
	add r0, r0, #1
	lsl r0, r0, #0x1f
	lsr r0, r0, #1
	orr r1, r0
	ldr r0, [sp, #0x14]
	str r1, [r0]
	add r0, r2, #0
	add r2, r0, r7
	ldr r0, _02251438 ; =0x0000305C
	add r1, r0, #0
	strh r3, [r2, r0]
	add r1, #8
	strh r3, [r2, r1]
	add r1, r0, #0
	add r1, #0x10
	strh r5, [r2, r1]
	add r1, r0, #0
	add r1, #0x18
	strh r3, [r2, r1]
	add r1, r0, #0
	add r1, #0x20
	strh r3, [r2, r1]
	add r1, r0, #0
	add r1, #0x28
	strh r3, [r2, r1]
	ldr r1, [sp, #4]
	lsl r5, r4, #3
	add r1, r1, r5
	add r5, r0, #0
	add r5, #0x30
	strh r3, [r1, r5]
	add r5, r0, #0
	add r5, #0x32
	strh r3, [r1, r5]
	add r5, r0, #0
	add r5, #0x34
	strh r3, [r1, r5]
	add r5, r0, #0
	add r5, #0x36
	strh r3, [r1, r5]
	add r1, r0, #0
	add r1, #0x50
	strh r3, [r2, r1]
	add r1, r0, #0
	add r1, #0x68
	strh r3, [r2, r1]
	add r1, r0, #0
	add r1, #0x70
	strh r3, [r2, r1]
	add r1, r0, #0
	add r1, #0x78
	strh r3, [r2, r1]
	add r0, #0x80
	strh r3, [r2, r0]
	add r0, r4, #0
	bl MaskOfFlagNo
	mov r1, #6
	lsl r3, r0, #8
	mov r0, #0
	mvn r0, r0
	ldr r2, [sp, #4]
	lsl r1, r1, #6
	ldr r2, [r2, r1]
	eor r0, r3
	and r2, r0
	ldr r0, [sp, #4]
	str r2, [r0, r1]
	ldr r0, [sp, #0x10]
	ldr r1, [r0]
	mov r0, #2
	lsl r0, r0, #0x16
	tst r0, r1
	beq _02251456
	ldr r0, _0225143C ; =0x00002D42
	b _02251440
	.balign 4, 0
_02251400: .word 0x00002DC8
_02251404: .word 0x000021A8
_02251408: .word 0x00002DCC
_0225140C: .word 0x00002DB0
_02251410: .word 0xFBFFFFFF
_02251414: .word 0x15100007
_02251418: .word 0x0FA3843F
_0225141C: .word 0xFFFF1FFF
_02251420: .word 0x0000213C
_02251424: .word 0x00002DE0
_02251428: .word 0xFFFF9FFF
_0225142C: .word 0xFFC7FFFF
_02251430: .word 0x00002DD4
_02251434: .word 0xBFFFFFFF
_02251438: .word 0x0000305C
_0225143C: .word 0x00002D42
_02251440:
	ldr r1, [sp, #4]
	add r5, r1, r0
	ldr r1, [sp, #0xc]
	ldrh r3, [r5, r1]
	add r1, r0, #2
	ldr r0, [sp, #4]
	add r2, r0, r1
	ldr r0, [sp, #0xc]
	ldrh r1, [r2, r0]
	strh r1, [r5, r0]
	strh r3, [r2, r0]
_02251456:
	mov r5, #0
	cmp r6, #0
	ble _0225149A
	ldr r0, [sp, #4]
	str r0, [sp, #0x18]
	add r7, r0, r7
_02251462:
	cmp r5, r4
	beq _02251486
	ldr r0, [sp]
	add r1, r5, #0
	bl ov12_0223AB1C
	str r0, [sp, #0x1c]
	ldr r0, [sp]
	add r1, r4, #0
	bl ov12_0223AB1C
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	beq _02251486
	ldr r1, [sp, #0x18]
	ldr r0, _022514BC ; =0x00003084
	mov r2, #0
	strh r2, [r1, r0]
_02251486:
	ldr r0, _022514C0 ; =0x0000308C
	mov r1, #0
	strh r1, [r7, r0]
	ldr r0, [sp, #0x18]
	add r5, r5, #1
	add r0, r0, #2
	str r0, [sp, #0x18]
	add r7, #8
	cmp r5, r6
	blt _02251462
_0225149A:
	lsl r1, r4, #0x18
	ldr r0, [sp, #4]
	lsr r1, r1, #0x18
	bl ov12_02258584
	lsl r1, r4, #0x18
	ldr r0, [sp, #4]
	lsr r1, r1, #0x18
	bl ov12_0225859C
	lsl r1, r4, #0x18
	ldr r0, [sp, #4]
	lsr r1, r1, #0x18
	bl ov12_022585A8
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022514BC: .word 0x00003084
_022514C0: .word 0x0000308C
	thumb_func_end ov12_022510BC

	thumb_func_start ov12_022514C4
ov12_022514C4: ; 0x022514C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp, #4]
	str r0, [sp]
	add r5, r2, #0
	bl ov12_0223A7F0
	str r0, [sp, #0xc]
	mov r0, #0xc0
	mul r0, r5
	ldr r1, [sp, #4]
	str r0, [sp, #8]
	add r3, r1, r0
	ldr r0, _022516E8 ; =0x00002D58
	mov r2, #0
	mov r1, #6
_022514E4:
	add r2, r2, #1
	strb r1, [r3, r0]
	add r3, r3, #1
	cmp r2, #8
	blt _022514E4
	mov r0, #0xc0
	add r1, r5, #0
	mul r1, r0
	ldr r0, [sp, #4]
	mov r7, #0
	add r2, r0, r1
	ldr r1, _022516EC ; =0x00002DB0
	add r0, r1, #0
	str r7, [r2, r1]
	add r0, #0x10
	str r7, [r2, r0]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _0225158A
	ldr r4, [sp, #4]
	add r1, #0x1c
	add r0, r4, #0
	add r6, r0, r1
_02251512:
	ldr r0, _022516EC ; =0x00002DB0
	ldr r1, [r4, r0]
	mov r0, #1
	lsl r0, r0, #0x1a
	tst r0, r1
	beq _02251534
	ldr r0, [r6]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1e
	cmp r5, r0
	bne _02251534
	ldr r0, _022516EC ; =0x00002DB0
	ldr r1, [r4, r0]
	ldr r0, _022516F0 ; =0xFBFFFFFF
	and r1, r0
	ldr r0, _022516EC ; =0x00002DB0
	str r1, [r4, r0]
_02251534:
	add r0, r5, #0
	bl MaskOfFlagNo
	ldr r1, _022516EC ; =0x00002DB0
	lsl r0, r0, #0x10
	ldr r1, [r4, r1]
	tst r0, r1
	beq _0225155C
	add r0, r5, #0
	bl MaskOfFlagNo
	ldr r1, _022516EC ; =0x00002DB0
	lsl r2, r0, #0x10
	mov r0, #0
	mvn r0, r0
	ldr r1, [r4, r1]
	eor r0, r2
	and r1, r0
	ldr r0, _022516EC ; =0x00002DB0
	str r1, [r4, r0]
_0225155C:
	ldr r0, _022516EC ; =0x00002DB0
	ldr r1, [r4, r0]
	mov r0, #0xe
	lsl r0, r0, #0xc
	tst r0, r1
	beq _0225157E
	ldr r0, [r6]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	cmp r5, r0
	bne _0225157E
	ldr r0, _022516EC ; =0x00002DB0
	ldr r1, [r4, r0]
	ldr r0, _022516F4 ; =0xFFFF1FFF
	and r1, r0
	ldr r0, _022516EC ; =0x00002DB0
	str r1, [r4, r0]
_0225157E:
	ldr r0, [sp, #0xc]
	add r7, r7, #1
	add r4, #0xc0
	add r6, #0xc0
	cmp r7, r0
	blt _02251512
_0225158A:
	ldr r1, _022516F8 ; =0x00002DC8
	ldr r0, [sp, #4]
	add r1, r0, r1
	ldr r0, [sp, #8]
	add r6, r1, r0
	mov r1, #0
	add r0, r1, #0
_02251598:
	strb r0, [r6, r1]
	add r1, r1, #1
	cmp r1, #0x38
	blo _02251598
	mov r2, #0x75
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	add r2, r1, r2
	lsl r1, r5, #6
	add r1, r2, r1
	mov r4, #0
_022515AE:
	strb r4, [r1, r0]
	add r0, r0, #1
	cmp r0, #0x40
	blo _022515AE
	mov r2, #0xc0
	add r3, r2, #0
	ldr r0, [sp, #4]
	add r3, #0x90
	ldr r0, [r0, r3]
	add r1, r5, #0
	ldr r3, [sp, #4]
	mul r1, r2
	add r3, r3, r1
	add r1, r2, #0
	ldr r7, _022516FC ; =0x00002DD4
	add r0, r0, #1
	str r0, [r3, r7]
	ldr r0, [sp, #4]
	add r1, #0x90
	ldr r0, [r0, r1]
	add r1, r7, #4
	add r0, r0, #1
	str r0, [r3, r1]
	ldr r1, [r6]
	ldr r0, _02251700 ; =0xBFFFFFFF
	add r2, #0x90
	and r0, r1
	ldr r1, [sp, #4]
	mov r3, #0xff
	ldr r1, [r1, r2]
	add r1, r1, #1
	lsl r1, r1, #0x1f
	lsr r1, r1, #1
	orr r0, r1
	str r0, [r6]
	ldr r0, [sp, #4]
	lsl r6, r5, #1
	add r2, r0, r6
	ldr r0, _02251704 ; =0x0000305C
	add r1, r0, #0
	strh r4, [r2, r0]
	add r1, #8
	strh r4, [r2, r1]
	add r1, r0, #0
	add r1, #0x10
	strh r3, [r2, r1]
	add r1, r0, #0
	add r1, #0x18
	strh r4, [r2, r1]
	add r1, r0, #0
	add r1, #0x20
	strh r4, [r2, r1]
	add r1, r0, #0
	add r1, #0x28
	strh r4, [r2, r1]
	ldr r1, [sp, #4]
	lsl r3, r5, #3
	add r1, r1, r3
	add r3, r0, #0
	add r3, #0x30
	strh r4, [r1, r3]
	add r3, r0, #0
	add r3, #0x32
	strh r4, [r1, r3]
	add r3, r0, #0
	add r3, #0x34
	strh r4, [r1, r3]
	add r3, r0, #0
	add r3, #0x36
	strh r4, [r1, r3]
	add r1, r0, #0
	add r1, #0x50
	strh r4, [r2, r1]
	add r1, r0, #0
	add r1, #0x68
	strh r4, [r2, r1]
	add r1, r0, #0
	add r1, #0x70
	strh r4, [r2, r1]
	add r1, r0, #0
	add r1, #0x78
	strh r4, [r2, r1]
	add r0, #0x80
	strh r4, [r2, r0]
	add r0, r5, #0
	bl MaskOfFlagNo
	mov r1, #6
	lsl r3, r0, #8
	mov r0, #0
	mvn r0, r0
	ldr r2, [sp, #4]
	lsl r1, r1, #6
	ldr r2, [r2, r1]
	eor r0, r3
	and r2, r0
	ldr r0, [sp, #4]
	mov r4, #0
	str r2, [r0, r1]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _022516B4
	ldr r7, [sp, #4]
	add r0, r7, #0
	add r6, r0, r6
_02251680:
	cmp r4, r5
	beq _022516A2
	ldr r0, [sp]
	add r1, r4, #0
	bl ov12_0223AB1C
	str r0, [sp, #0x10]
	ldr r0, [sp]
	add r1, r5, #0
	bl ov12_0223AB1C
	ldr r1, [sp, #0x10]
	cmp r1, r0
	beq _022516A2
	ldr r0, _02251708 ; =0x00003084
	mov r1, #0
	strh r1, [r7, r0]
_022516A2:
	ldr r0, _0225170C ; =0x0000308C
	mov r1, #0
	strh r1, [r6, r0]
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	add r7, r7, #2
	add r6, #8
	cmp r4, r0
	blt _02251680
_022516B4:
	mov r1, #0x4f
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	add r3, r0, r1
	lsl r2, r5, #2
	ldr r1, [r3, r2]
	mov r0, #1
	bic r1, r0
	str r1, [r3, r2]
	lsl r1, r5, #0x18
	ldr r0, [sp, #4]
	lsr r1, r1, #0x18
	bl ov12_02258584
	lsl r1, r5, #0x18
	ldr r0, [sp, #4]
	lsr r1, r1, #0x18
	bl ov12_0225859C
	lsl r1, r5, #0x18
	ldr r0, [sp, #4]
	lsr r1, r1, #0x18
	bl ov12_022585A8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022516E8: .word 0x00002D58
_022516EC: .word 0x00002DB0
_022516F0: .word 0xFBFFFFFF
_022516F4: .word 0xFFFF1FFF
_022516F8: .word 0x00002DC8
_022516FC: .word 0x00002DD4
_02251700: .word 0xBFFFFFFF
_02251704: .word 0x0000305C
_02251708: .word 0x00003084
_0225170C: .word 0x0000308C
	thumb_func_end ov12_022514C4

	thumb_func_start ov12_02251710
ov12_02251710: ; 0x02251710
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x75
	add r5, r1, #0
	lsl r0, r0, #2
	add r7, r5, r0
	mov r0, #0xd1
	lsl r0, r0, #2
	add r6, r5, r0
	mov r0, #8
	add r4, r5, #0
	str r0, [sp, #8]
_0225172E:
	mov r0, #0
	add r1, r7, #0
	mov r2, #0x40
	bl MIi_CpuClearFast
	mov r0, #0
	add r1, r6, #0
	mov r2, #4
	bl MIi_CpuClearFast
	ldr r0, _022517D8 ; =0x00002DB0
	ldr r1, [r4, r0]
	ldr r0, [sp, #8]
	bic r1, r0
	ldr r0, _022517D8 ; =0x00002DB0
	str r1, [r4, r0]
	add r0, #0x20
	ldr r0, [r4, r0]
	add r1, r0, #1
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r1, r0
	bge _0225176A
	ldr r0, _022517D8 ; =0x00002DB0
	ldr r1, [r4, r0]
	ldr r0, _022517DC ; =0xFFBFFFFF
	and r1, r0
	ldr r0, _022517D8 ; =0x00002DB0
	str r1, [r4, r0]
_0225176A:
	ldr r0, _022517E0 ; =0x00002DAC
	ldr r1, [r4, r0]
	mov r0, #7
	tst r0, r1
	beq _0225178A
	ldr r0, _022517D8 ; =0x00002DB0
	ldr r1, [r4, r0]
	mov r0, #1
	lsl r0, r0, #0xc
	tst r0, r1
	beq _0225178A
	ldr r0, [sp]
	ldr r2, [sp, #4]
	add r1, r5, #0
	bl ov12_02250CA0
_0225178A:
	ldr r0, _022517E0 ; =0x00002DAC
	ldr r1, [r4, r0]
	mov r0, #7
	tst r0, r1
	beq _022517AC
	ldr r0, _022517D8 ; =0x00002DB0
	ldr r1, [r4, r0]
	mov r0, #3
	lsl r0, r0, #0xa
	tst r0, r1
	beq _022517AC
	ldr r0, _022517D8 ; =0x00002DB0
	ldr r1, [r4, r0]
	ldr r0, _022517E4 ; =0xFFFFF3FF
	and r1, r0
	ldr r0, _022517D8 ; =0x00002DB0
	str r1, [r4, r0]
_022517AC:
	ldr r0, [sp, #4]
	add r7, #0x40
	add r0, r0, #1
	add r6, r6, #4
	add r4, #0xc0
	str r0, [sp, #4]
	cmp r0, #4
	blt _0225172E
	mov r2, #0x71
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	ldr r1, _022517E8 ; =0xFFEFFFFF
	and r0, r1
	str r0, [r5, r2]
	add r0, r2, #0
	add r0, #8
	ldr r0, [r5, r0]
	add r2, #8
	and r0, r1
	str r0, [r5, r2]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022517D8: .word 0x00002DB0
_022517DC: .word 0xFFBFFFFF
_022517E0: .word 0x00002DAC
_022517E4: .word 0xFFFFF3FF
_022517E8: .word 0xFFEFFFFF
	thumb_func_end ov12_02251710

	thumb_func_start ov12_022517EC
ov12_022517EC: ; 0x022517EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	str r0, [sp]
	ldr r0, [sp, #0x70]
	add r7, r1, #0
	str r0, [sp, #0x70]
	str r2, [sp, #4]
	add r0, r7, #0
	add r1, r2, #0
	add r5, r3, #0
	bl ov12_02255830
	str r0, [sp, #0x34]
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	add r4, r7, r1
	str r1, [sp, #0x38]
	ldr r0, [sp, #0x70]
	mov r1, #1
	and r0, r1
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x70]
	mov r1, #2
	and r0, r1
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x70]
	mov r1, #4
	and r0, r1
	str r0, [sp, #0x24]
	ldr r0, [sp, #4]
	mov r1, #8
	lsl r0, r0, #1
	add r0, r7, r0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x70]
	mov r2, #0x10
	and r0, r1
	ldr r1, _02251A04 ; =0x00002DC8
	str r0, [sp, #0x1c]
	add r0, r7, r1
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x70]
	sub r1, #0x88
	and r0, r2
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x70]
	mov r2, #0x20
	and r0, r2
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x70]
	mov r2, #0x40
	and r0, r2
	str r0, [sp, #0x10]
	ldr r2, [sp, #0x70]
	mov r0, #0x80
	and r2, r0
	str r2, [sp, #0xc]
	lsl r2, r0, #2
	ldr r0, [sp, #0x70]
	mov r6, #0
	and r0, r2
	str r0, [sp, #8]
	add r0, r7, r1
	str r0, [sp, #0x40]
	ldr r0, _02251A08 ; =0x00002DE8
	str r4, [sp, #0x30]
	add r0, r4, r0
	str r0, [sp, #0x44]
	ldr r0, _02251A0C ; =0x00002DB0
	add r0, r4, r0
	str r0, [sp, #0x48]
	ldr r0, _02251A10 ; =0x00002DEC
	add r0, r4, r0
	str r0, [sp, #0x4c]
	ldr r0, _02251A14 ; =0x00002DF8
	add r0, r4, r0
	str r0, [sp, #0x50]
	ldr r0, _02251A14 ; =0x00002DF8
	add r0, r4, r0
	str r0, [sp, #0x58]
	ldr r0, _02251A14 ; =0x00002DF8
	add r0, r4, r0
	str r0, [sp, #0x54]
_02251894:
	ldr r0, _02251A18 ; =0x00002D4C
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _022518AA
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	beq _022518AA
	add r0, r6, #0
	bl MaskOfFlagNo
	orr r5, r0
_022518AA:
	ldr r1, [sp, #0x30]
	ldr r0, _02251A1C ; =0x00002D6C
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _022518C2
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _022518C2
	add r0, r6, #0
	bl MaskOfFlagNo
	orr r5, r0
_022518C2:
	ldr r0, [sp, #0x44]
	ldrh r1, [r0]
	ldr r0, _02251A18 ; =0x00002D4C
	ldrh r0, [r4, r0]
	cmp r1, r0
	bne _022518DC
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _022518DC
	add r0, r6, #0
	bl MaskOfFlagNo
	orr r5, r0
_022518DC:
	ldr r1, [sp, #0x20]
	ldr r0, _02251A20 ; =0x0000307C
	ldrh r1, [r1, r0]
	ldr r0, _02251A18 ; =0x00002D4C
	ldrh r0, [r4, r0]
	cmp r1, r0
	bne _02251904
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _02251904
	ldr r0, [sp, #0x48]
	ldr r1, [r0]
	mov r0, #2
	lsl r0, r0, #0x1e
	tst r0, r1
	beq _02251904
	add r0, r6, #0
	bl MaskOfFlagNo
	orr r5, r0
_02251904:
	ldr r1, [sp, #0x3c]
	ldr r0, [sp, #0x38]
	ldr r0, [r1, r0]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x1d
	beq _0225192E
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _0225192E
	ldr r0, _02251A18 ; =0x00002D4C
	ldrh r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r7, r0
	ldr r0, _02251A24 ; =0x000003E1
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0225192E
	add r0, r6, #0
	bl MaskOfFlagNo
	orr r5, r0
_0225192E:
	ldr r3, _02251A18 ; =0x00002D4C
	ldr r0, [sp]
	ldrh r3, [r4, r3]
	ldr r2, [sp, #4]
	add r1, r7, #0
	bl ov12_02252C74
	cmp r0, #0
	beq _0225194E
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0225194E
	add r0, r6, #0
	bl MaskOfFlagNo
	orr r5, r0
_0225194E:
	ldr r3, _02251A18 ; =0x00002D4C
	ldr r0, [sp]
	ldrh r3, [r4, r3]
	ldr r2, [sp, #4]
	add r1, r7, #0
	bl ov12_02252DC4
	cmp r0, #0
	beq _0225196E
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0225196E
	add r0, r6, #0
	bl MaskOfFlagNo
	orr r5, r0
_0225196E:
	ldr r3, _02251A18 ; =0x00002D4C
	ldr r0, [sp]
	ldrh r3, [r4, r3]
	ldr r2, [sp, #4]
	add r1, r7, #0
	bl ov12_02252DF8
	cmp r0, #0
	beq _0225198E
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0225198E
	add r0, r6, #0
	bl MaskOfFlagNo
	orr r5, r0
_0225198E:
	ldr r0, [sp, #0x4c]
	ldrh r1, [r0]
	cmp r1, #0
	beq _022519A6
	ldr r0, _02251A18 ; =0x00002D4C
	ldrh r0, [r4, r0]
	cmp r1, r0
	beq _022519A6
	add r0, r6, #0
	bl MaskOfFlagNo
	orr r5, r0
_022519A6:
	ldr r0, [sp, #0x34]
	cmp r0, #0x37
	beq _022519B4
	cmp r0, #0x73
	beq _022519B4
	cmp r0, #0x7d
	bne _022519EC
_022519B4:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _022519EC
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0x38]
	add r0, r1, r0
	ldr r1, [sp, #0x50]
	ldrh r1, [r1]
	bl ov12_02251C60
	cmp r0, #4
	bne _022519D4
	ldr r0, [sp, #0x54]
	mov r1, #0
	strh r1, [r0]
	b _022519EC
_022519D4:
	ldr r0, [sp, #0x58]
	ldrh r1, [r0]
	cmp r1, #0
	beq _022519EC
	ldr r0, _02251A18 ; =0x00002D4C
	ldrh r0, [r4, r0]
	cmp r1, r0
	beq _022519EC
	add r0, r6, #0
	bl MaskOfFlagNo
	orr r5, r0
_022519EC:
	ldr r0, [sp, #0x30]
	add r6, r6, #1
	add r0, r0, #1
	add r4, r4, #2
	str r0, [sp, #0x30]
	cmp r6, #4
	bge _022519FC
	b _02251894
_022519FC:
	add r0, r5, #0
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_02251A04: .word 0x00002DC8
_02251A08: .word 0x00002DE8
_02251A0C: .word 0x00002DB0
_02251A10: .word 0x00002DEC
_02251A14: .word 0x00002DF8
_02251A18: .word 0x00002D4C
_02251A1C: .word 0x00002D6C
_02251A20: .word 0x0000307C
_02251A24: .word 0x000003E1
	thumb_func_end ov12_022517EC

	thumb_func_start ov12_02251A28
ov12_02251A28: ; 0x02251A28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r7, r3, #0
	mov r3, #1
	str r3, [sp, #8]
	mov r3, #4
	str r3, [sp]
	mov r3, #0
	str r0, [sp, #4]
	add r5, r1, #0
	add r6, r2, #0
	ldr r4, [sp, #0x40]
	bl ov12_022517EC
	str r0, [sp, #0xc]
	add r0, r7, #0
	bl MaskOfFlagNo
	ldr r1, [sp, #0xc]
	tst r0, r1
	beq _02251A7A
	mov r0, #0xa
	strb r0, [r4, #1]
	ldr r0, _02251C3C ; =0x00000261
	add r1, r6, #0
	strh r0, [r4, #2]
	add r0, r5, #0
	bl ov12_022522E0
	str r0, [r4, #4]
	mov r0, #0xc0
	mul r0, r6
	add r1, r5, r0
	lsl r0, r7, #1
	add r1, r1, r0
	ldr r0, _02251C40 ; =0x00002D4C
	ldrh r0, [r1, r0]
	str r0, [r4, #8]
	mov r0, #0
	str r0, [sp, #8]
	b _02251C36
_02251A7A:
	mov r0, #8
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #0
	bl ov12_022517EC
	str r0, [sp, #0x10]
	add r0, r7, #0
	bl MaskOfFlagNo
	ldr r1, [sp, #0x10]
	tst r0, r1
	beq _02251AB2
	mov r0, #2
	strb r0, [r4, #1]
	mov r0, #0x99
	lsl r0, r0, #2
	strh r0, [r4, #2]
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_022522E0
	str r0, [r4, #4]
	mov r0, #0
	str r0, [sp, #8]
	b _02251C36
_02251AB2:
	mov r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #0
	bl ov12_022517EC
	str r0, [sp, #0x14]
	add r0, r7, #0
	bl MaskOfFlagNo
	ldr r1, [sp, #0x14]
	tst r0, r1
	beq _02251AF8
	mov r0, #0xa
	strb r0, [r4, #1]
	ldr r0, _02251C44 ; =0x00000265
	add r1, r6, #0
	strh r0, [r4, #2]
	add r0, r5, #0
	bl ov12_022522E0
	str r0, [r4, #4]
	mov r0, #0xc0
	mul r0, r6
	add r1, r5, r0
	lsl r0, r7, #1
	add r1, r1, r0
	ldr r0, _02251C40 ; =0x00002D4C
	ldrh r0, [r1, r0]
	str r0, [r4, #8]
	mov r0, #0
	str r0, [sp, #8]
	b _02251C36
_02251AF8:
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #0
	bl ov12_022517EC
	str r0, [sp, #0x18]
	add r0, r7, #0
	bl MaskOfFlagNo
	ldr r1, [sp, #0x18]
	tst r0, r1
	beq _02251B40
	mov r0, #0xa
	strb r0, [r4, #1]
	mov r0, #0x9a
	lsl r0, r0, #2
	strh r0, [r4, #2]
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_022522E0
	str r0, [r4, #4]
	mov r0, #0xc0
	mul r0, r6
	add r1, r5, r0
	lsl r0, r7, #1
	add r1, r1, r0
	ldr r0, _02251C40 ; =0x00002D4C
	ldrh r0, [r1, r0]
	str r0, [r4, #8]
	mov r0, #0
	str r0, [sp, #8]
	b _02251C36
_02251B40:
	mov r0, #0x40
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #0
	bl ov12_022517EC
	str r0, [sp, #0x1c]
	add r0, r7, #0
	bl MaskOfFlagNo
	ldr r1, [sp, #0x1c]
	tst r0, r1
	beq _02251B86
	mov r0, #0xa
	strb r0, [r4, #1]
	ldr r0, _02251C48 ; =0x000003E9
	add r1, r6, #0
	strh r0, [r4, #2]
	add r0, r5, #0
	bl ov12_022522E0
	str r0, [r4, #4]
	mov r0, #0xc0
	mul r0, r6
	add r1, r5, r0
	lsl r0, r7, #1
	add r1, r1, r0
	ldr r0, _02251C40 ; =0x00002D4C
	ldrh r0, [r1, r0]
	str r0, [r4, #8]
	mov r0, #0
	str r0, [sp, #8]
	b _02251C36
_02251B86:
	mov r0, #0x80
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #0
	bl ov12_022517EC
	str r0, [sp, #0x20]
	add r0, r7, #0
	bl MaskOfFlagNo
	ldr r1, [sp, #0x20]
	tst r0, r1
	beq _02251BD0
	mov r0, #0x22
	strb r0, [r4, #1]
	ldr r0, _02251C4C ; =0x00000421
	add r1, r6, #0
	strh r0, [r4, #2]
	add r0, r5, #0
	bl ov12_022522E0
	str r0, [r4, #4]
	ldr r0, _02251C50 ; =0x00000179
	str r0, [r4, #8]
	mov r0, #0xc0
	mul r0, r6
	add r1, r5, r0
	lsl r0, r7, #1
	add r1, r1, r0
	ldr r0, _02251C40 ; =0x00002D4C
	ldrh r0, [r1, r0]
	str r0, [r4, #0xc]
	mov r0, #0
	str r0, [sp, #8]
	b _02251C36
_02251BD0:
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #0
	bl ov12_022517EC
	str r0, [sp, #0x24]
	add r0, r7, #0
	bl MaskOfFlagNo
	ldr r1, [sp, #0x24]
	tst r0, r1
	beq _02251C10
	mov r0, #0x18
	strb r0, [r4, #1]
	ldr r0, _02251C54 ; =0x0000038F
	strh r0, [r4, #2]
	mov r0, #0xc0
	mul r0, r6
	add r2, r5, r0
	ldr r0, _02251C58 ; =0x00002DB8
	ldrh r1, [r2, r0]
	add r0, #0x40
	str r1, [r4, #4]
	ldrh r0, [r2, r0]
	str r0, [r4, #8]
	mov r0, #0
	str r0, [sp, #8]
	b _02251C36
_02251C10:
	mov r0, #2
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #0
	bl ov12_022517EC
	add r5, r0, #0
	add r0, r7, #0
	bl MaskOfFlagNo
	tst r0, r5
	beq _02251C36
	mov r0, #0
	str r0, [sp, #8]
	strb r0, [r4, #1]
	ldr r0, _02251C5C ; =0x00000337
	strh r0, [r4, #2]
_02251C36:
	ldr r0, [sp, #8]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02251C3C: .word 0x00000261
_02251C40: .word 0x00002D4C
_02251C44: .word 0x00000265
_02251C48: .word 0x000003E9
_02251C4C: .word 0x00000421
_02251C50: .word 0x00000179
_02251C54: .word 0x0000038F
_02251C58: .word 0x00002DB8
_02251C5C: .word 0x00000337
	thumb_func_end ov12_02251A28

	thumb_func_start ov12_02251C60
ov12_02251C60: ; 0x02251C60
	mov r3, #0
_02251C62:
	ldrh r2, [r0, #0xc]
	cmp r1, r2
	beq _02251C70
	add r3, r3, #1
	add r0, r0, #2
	cmp r3, #4
	blt _02251C62
_02251C70:
	add r0, r3, #0
	bx lr
	thumb_func_end ov12_02251C60

	thumb_func_start ov12_02251C74
ov12_02251C74: ; 0x02251C74
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r1, r6, #0
	add r5, r0, #0
	add r4, r3, #0
	bl ov12_02255830
	mov r1, #1
	cmp r0, #0x6a
	beq _02251C9A
	mov r0, #0xc0
	mul r0, r6
	add r2, r5, r0
	mov r0, #0xb7
	lsl r0, r0, #6
	ldr r2, [r2, r0]
	lsl r0, r1, #0xa
	tst r0, r2
	beq _02251CB0
_02251C9A:
	lsl r0, r4, #1
	add r2, r4, r0
	ldr r0, _02251D20 ; =ov12_0226CC7D
	ldrb r0, [r0, r2]
	cmp r0, #2
	bne _02251CB0
	ldr r0, _02251D24 ; =ov12_0226CC7E
	ldrb r0, [r0, r2]
	cmp r0, #0
	bne _02251CB0
	mov r1, #0
_02251CB0:
	lsl r0, r6, #6
	add r2, r5, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	beq _02251CCE
	lsl r0, r4, #1
	add r2, r4, r0
	ldr r0, _02251D20 ; =ov12_0226CC7D
	ldrb r0, [r0, r2]
	cmp r0, #2
	bne _02251CCE
	mov r1, #0
_02251CCE:
	mov r0, #6
	lsl r0, r0, #6
	ldr r2, [r5, r0]
	mov r0, #7
	lsl r0, r0, #0xc
	tst r0, r2
	beq _02251CF2
	lsl r0, r4, #1
	add r2, r4, r0
	ldr r0, _02251D20 ; =ov12_0226CC7D
	ldrb r0, [r0, r2]
	cmp r0, #2
	bne _02251CF2
	ldr r0, _02251D24 ; =ov12_0226CC7E
	ldrb r0, [r0, r2]
	cmp r0, #0
	bne _02251CF2
	mov r1, #0
_02251CF2:
	mov r0, #0xc0
	mul r0, r6
	add r2, r5, r0
	mov r0, #0xb7
	lsl r0, r0, #6
	ldr r2, [r2, r0]
	mov r0, #1
	lsl r0, r0, #0x16
	tst r0, r2
	beq _02251D1C
	lsl r0, r4, #1
	add r2, r4, r0
	ldr r0, _02251D20 ; =ov12_0226CC7D
	ldrb r0, [r0, r2]
	cmp r0, #0x11
	bne _02251D1C
	ldr r0, _02251D24 ; =ov12_0226CC7E
	ldrb r0, [r0, r2]
	cmp r0, #0
	bne _02251D1C
	mov r1, #0
_02251D1C:
	add r0, r1, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02251D20: .word ov12_0226CC7D
_02251D24: .word ov12_0226CC7E
	thumb_func_end ov12_02251C74

	thumb_func_start ov12_02251D28
ov12_02251D28: ; 0x02251D28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r0, [sp, #0x50]
	add r5, r1, #0
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x54]
	str r2, [sp, #8]
	str r0, [sp, #0x54]
	add r0, r2, #0
	add r4, r3, #0
	ldr r7, [sp, #0x48]
	ldr r6, [sp, #0x4c]
	cmp r0, #0xa5
	bne _02251D4A
	ldr r0, [sp, #0x50]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
_02251D4A:
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_02255830
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x24]
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0
	bl ov12_02255844
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_02255830
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x20]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	bl ov12_02255844
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_022527CC
	cmp r0, #0x60
	bne _02251D92
	mov r0, #0
	str r0, [sp, #0x28]
	b _02251DAA
_02251D92:
	cmp r4, #0
	beq _02251D9E
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x28]
	b _02251DAA
_02251D9E:
	ldr r0, [sp, #8]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0225203C ; =0x000003E2
	ldrb r0, [r1, r0]
	str r0, [sp, #0x28]
_02251DAA:
	ldr r0, [sp, #8]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _02252040 ; =0x000003E1
	ldrb r0, [r1, r0]
	str r0, [sp, #0x14]
	ldr r0, _02252044 ; =0x0000213C
	ldr r1, [r5, r0]
	mov r0, #2
	lsl r0, r0, #0xa
	tst r0, r1
	bne _02251E08
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0x1b
	mov r3, #0
	bl ov12_0224EDE0
	ldr r1, [sp, #0x28]
	cmp r1, r0
	beq _02251DE6
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0x1c
	mov r3, #0
	bl ov12_0224EDE0
	ldr r1, [sp, #0x28]
	cmp r1, r0
	bne _02251E08
_02251DE6:
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_022527CC
	cmp r0, #0x5b
	bne _02251DFA
	ldr r0, [sp, #0x50]
	lsl r0, r0, #1
	str r0, [sp, #0x50]
	b _02251E08
_02251DFA:
	ldr r1, [sp, #0x50]
	mov r0, #0xf
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	str r0, [sp, #0x50]
_02251E08:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	mov r3, #0x1a
	bl ov12_02252834
	cmp r0, #1
	bne _02251E34
	ldr r0, [sp, #0x28]
	cmp r0, #4
	bne _02251E34
	ldr r0, [sp, #0x20]
	cmp r0, #0x6a
	beq _02251E34
	ldr r0, [sp, #0x54]
	ldr r1, [r0]
	mov r0, #2
	lsl r0, r0, #0xa
	orr r1, r0
	ldr r0, [sp, #0x54]
	str r1, [r0]
	b _02251F50
_02251E34:
	mov r0, #0xc0
	add r1, r6, #0
	mul r1, r0
	ldr r0, _02252048 ; =0x00002DCC
	add r3, r5, r1
	ldr r2, [r3, r0]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x1d
	beq _02251E6C
	sub r0, #0xc
	ldr r2, [r3, r0]
	mov r0, #1
	lsl r0, r0, #0xa
	tst r2, r0
	bne _02251E6C
	ldr r2, [sp, #0x28]
	cmp r2, #4
	bne _02251E6C
	ldr r2, [sp, #0x20]
	cmp r2, #0x6a
	beq _02251E6C
	ldr r1, [sp, #0x54]
	lsl r0, r0, #0xa
	ldr r1, [r1]
	orr r1, r0
	ldr r0, [sp, #0x54]
	str r1, [r0]
	b _02251F50
_02251E6C:
	add r0, r5, r1
	mov r4, #0
	str r0, [sp, #0x18]
_02251E72:
	lsl r0, r4, #1
	ldr r1, _0225204C ; =ov12_0226CC7C
	add r0, r4, r0
	add r1, r1, r0
	str r1, [sp, #0xc]
	ldr r1, _0225204C ; =ov12_0226CC7C
	ldrb r1, [r1, r0]
	cmp r1, #0xfe
	bne _02251EA2
	ldr r1, [sp, #0x18]
	ldr r0, _02252050 ; =0x00002DB0
	ldr r1, [r1, r0]
	mov r0, #2
	lsl r0, r0, #0x1c
	tst r0, r1
	bne _02251F50
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_022527CC
	cmp r0, #0x71
	beq _02251F50
	add r4, r4, #1
	b _02251F44
_02251EA2:
	ldr r0, [sp, #0x28]
	cmp r0, r1
	bne _02251F42
	ldr r0, [sp, #0xc]
	add r1, r6, #0
	ldrb r0, [r0, #1]
	mov r2, #0x1b
	mov r3, #0
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ov12_0224EDE0
	ldr r1, [sp, #0x10]
	cmp r1, r0
	bne _02251EE8
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	add r3, r4, #0
	bl ov12_02251C74
	cmp r0, #1
	bne _02251EE8
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0xc]
	str r0, [sp]
	ldr r0, [sp, #0x54]
	ldr r3, [sp, #0x50]
	str r0, [sp, #4]
	ldrb r2, [r2, #2]
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_022583B4
	str r0, [sp, #0x50]
_02251EE8:
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1c
	mov r3, #0
	bl ov12_0224EDE0
	ldr r1, [sp, #0x10]
	cmp r1, r0
	bne _02251F42
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1b
	mov r3, #0
	bl ov12_0224EDE0
	str r0, [sp, #0x2c]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1c
	mov r3, #0
	bl ov12_0224EDE0
	ldr r1, [sp, #0x2c]
	cmp r1, r0
	beq _02251F42
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	add r3, r4, #0
	bl ov12_02251C74
	cmp r0, #1
	bne _02251F42
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0xc]
	str r0, [sp]
	ldr r0, [sp, #0x54]
	ldr r3, [sp, #0x50]
	str r0, [sp, #4]
	ldrb r2, [r2, #2]
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_022583B4
	str r0, [sp, #0x50]
_02251F42:
	add r4, r4, #1
_02251F44:
	lsl r0, r4, #1
	add r1, r4, r0
	ldr r0, _0225204C ; =ov12_0226CC7C
	ldrb r0, [r0, r1]
	cmp r0, #0xff
	bne _02251E72
_02251F50:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	mov r3, #0x19
	bl ov12_02252834
	cmp r0, #1
	bne _02251F94
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl ov12_02258440
	cmp r0, #0
	beq _02251F94
	ldr r0, [sp, #0x54]
	ldr r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _02251F7E
	mov r0, #6
	and r0, r1
	cmp r0, #6
	bne _02251F94
_02251F7E:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _02251F94
	ldr r0, [sp, #0x54]
	ldr r1, [r0]
	mov r0, #1
	lsl r0, r0, #0x12
	orr r1, r0
	ldr r0, [sp, #0x54]
	str r1, [r0]
	b _02252036
_02251F94:
	ldr r0, _02252044 ; =0x0000213C
	ldr r2, [r5, r0]
	mov r0, #2
	lsl r0, r0, #0xa
	add r1, r2, #0
	tst r1, r0
	bne _02252022
	lsl r0, r0, #4
	tst r0, r2
	bne _02252022
	ldr r0, [sp, #0x54]
	ldr r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _02251FFE
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _02251FFE
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	mov r3, #0x6f
	bl ov12_02252834
	cmp r0, #1
	beq _02251FD8
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	mov r3, #0x74
	bl ov12_02252834
	cmp r0, #1
	bne _02251FE6
_02251FD8:
	ldr r0, [sp, #0x50]
	lsl r1, r0, #1
	add r0, r0, r1
	mov r1, #4
	bl ov12_02253178
	str r0, [sp, #0x50]
_02251FE6:
	ldr r0, [sp, #0x24]
	cmp r0, #0x60
	bne _02251FFE
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x50]
	add r0, #0x64
	str r0, [sp, #0x1c]
	mul r0, r1
	mov r1, #0x64
	bl _s32_div_f
	str r0, [sp, #0x50]
_02251FFE:
	ldr r0, [sp, #0x54]
	ldr r1, [r0]
	mov r0, #4
	tst r0, r1
	beq _02252036
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _02252036
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_022527CC
	cmp r0, #0x6e
	bne _02252036
	ldr r0, [sp, #0x50]
	lsl r0, r0, #1
	str r0, [sp, #0x50]
	b _02252036
_02252022:
	ldr r0, [sp, #0x54]
	ldr r1, [r0]
	mov r0, #2
	bic r1, r0
	ldr r0, [sp, #0x54]
	str r1, [r0]
	mov r0, #4
	bic r1, r0
	ldr r0, [sp, #0x54]
	str r1, [r0]
_02252036:
	ldr r0, [sp, #0x50]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225203C: .word 0x000003E2
_02252040: .word 0x000003E1
_02252044: .word 0x0000213C
_02252048: .word 0x00002DCC
_0225204C: .word ov12_0226CC7C
_02252050: .word 0x00002DB0
	thumb_func_end ov12_02251D28

	thumb_func_start ov12_02252054
ov12_02252054: ; 0x02252054
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	ldr r0, [sp, #0x2c]
	str r1, [sp]
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	str r3, [sp, #4]
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x34]
	ldr r6, [sp, #0x38]
	str r0, [sp, #0x34]
	add r0, r1, #0
	cmp r0, #0xa5
	beq _0225216A
	add r0, r3, #0
	cmp r0, #0x60
	bne _0225207E
	mov r0, #0
	str r0, [sp, #0xc]
	b _02252096
_0225207E:
	cmp r2, #0
	beq _0225208A
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	b _02252096
_0225208A:
	add r0, r1, #0
	lsl r0, r0, #4
	add r1, r7, r0
	ldr r0, _02252170 ; =0x000003E2
	ldrb r0, [r1, r0]
	str r0, [sp, #0xc]
_02252096:
	ldr r0, [sp, #4]
	cmp r0, #0x68
	beq _022520C6
	ldr r0, [sp, #0x28]
	cmp r0, #0x1a
	bne _022520C6
	ldr r0, [sp, #0xc]
	cmp r0, #4
	bne _022520C6
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r7, r0]
	mov r0, #7
	lsl r0, r0, #0xc
	tst r0, r1
	bne _022520C6
	ldr r0, [sp, #0x2c]
	cmp r0, #0x6a
	beq _022520C6
	ldr r1, [r6]
	mov r0, #8
	orr r0, r1
	str r0, [r6]
	b _0225213A
_022520C6:
	mov r4, #0
_022520C8:
	lsl r0, r4, #1
	add r1, r4, r0
	ldr r0, _02252174 ; =ov12_0226CC7C
	add r5, r0, r1
	ldrb r1, [r0, r1]
	cmp r1, #0xfe
	bne _022520E0
	ldr r0, [sp, #4]
	cmp r0, #0x71
	beq _0225213A
	add r4, r4, #1
	b _0225212E
_022520E0:
	ldr r0, [sp, #0xc]
	cmp r0, r1
	bne _0225212C
	ldrb r0, [r5, #1]
	ldr r1, [sp, #0x30]
	str r0, [sp, #8]
	cmp r1, r0
	bne _02252106
	ldr r1, [sp, #0x2c]
	add r0, r7, #0
	add r2, r4, #0
	bl ov12_02252178
	cmp r0, #1
	bne _02252106
	ldrb r0, [r5, #2]
	add r1, r6, #0
	bl ov12_022521C8
_02252106:
	ldr r1, [sp, #0x34]
	ldr r0, [sp, #8]
	cmp r1, r0
	bne _0225212C
	ldr r1, [sp, #0x30]
	ldr r0, [sp, #0x34]
	cmp r1, r0
	beq _0225212C
	ldr r1, [sp, #0x2c]
	add r0, r7, #0
	add r2, r4, #0
	bl ov12_02252178
	cmp r0, #1
	bne _0225212C
	ldrb r0, [r5, #2]
	add r1, r6, #0
	bl ov12_022521C8
_0225212C:
	add r4, r4, #1
_0225212E:
	lsl r0, r4, #1
	add r1, r4, r0
	ldr r0, _02252174 ; =ov12_0226CC7C
	ldrb r0, [r0, r1]
	cmp r0, #0xff
	bne _022520C8
_0225213A:
	ldr r0, [sp, #4]
	cmp r0, #0x68
	beq _0225216A
	ldr r0, [sp, #0x28]
	cmp r0, #0x19
	bne _0225216A
	ldr r1, [sp]
	add r0, r7, #0
	bl ov12_02258440
	cmp r0, #0
	beq _0225216A
	ldr r1, [r6]
	mov r0, #2
	tst r0, r1
	beq _02252162
	mov r0, #6
	and r0, r1
	cmp r0, #6
	bne _0225216A
_02252162:
	ldr r1, [r6]
	mov r0, #8
	orr r0, r1
	str r0, [r6]
_0225216A:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02252170: .word 0x000003E2
_02252174: .word ov12_0226CC7C
	thumb_func_end ov12_02252054

	thumb_func_start ov12_02252178
ov12_02252178: ; 0x02252178
	push {r3, r4}
	mov r3, #1
	cmp r1, #0x6a
	bne _02252196
	lsl r1, r2, #1
	add r4, r2, r1
	ldr r1, _022521C0 ; =ov12_0226CC7D
	ldrb r1, [r1, r4]
	cmp r1, #2
	bne _02252196
	ldr r1, _022521C4 ; =ov12_0226CC7E
	ldrb r1, [r1, r4]
	cmp r1, #0
	bne _02252196
	mov r3, #0
_02252196:
	mov r1, #6
	lsl r1, r1, #6
	ldr r1, [r0, r1]
	mov r0, #7
	lsl r0, r0, #0xc
	tst r0, r1
	beq _022521BA
	lsl r0, r2, #1
	add r1, r2, r0
	ldr r0, _022521C0 ; =ov12_0226CC7D
	ldrb r0, [r0, r1]
	cmp r0, #2
	bne _022521BA
	ldr r0, _022521C4 ; =ov12_0226CC7E
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _022521BA
	mov r3, #0
_022521BA:
	add r0, r3, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_022521C0: .word ov12_0226CC7D
_022521C4: .word ov12_0226CC7E
	thumb_func_end ov12_02252178

	thumb_func_start ov12_022521C8
ov12_022521C8: ; 0x022521C8
	cmp r0, #0
	beq _022521D6
	cmp r0, #5
	beq _022521E8
	cmp r0, #0x14
	beq _02252200
	bx lr
_022521D6:
	ldr r2, [r1]
	mov r0, #8
	orr r2, r0
	mov r0, #4
	bic r2, r0
	mov r0, #2
	bic r2, r0
	str r2, [r1]
	bx lr
_022521E8:
	ldr r2, [r1]
	mov r0, #2
	tst r0, r2
	beq _022521F8
	mov r0, #2
	bic r2, r0
	str r2, [r1]
	bx lr
_022521F8:
	mov r0, #4
	orr r0, r2
	str r0, [r1]
	bx lr
_02252200:
	ldr r2, [r1]
	mov r0, #4
	tst r0, r2
	beq _02252210
	mov r0, #4
	bic r2, r0
	str r2, [r1]
	bx lr
_02252210:
	mov r0, #2
	orr r0, r2
	str r0, [r1]
	bx lr
	thumb_func_end ov12_022521C8

	thumb_func_start ov12_02252218
ov12_02252218: ; 0x02252218
	mov r2, #0xd1
	lsl r2, r2, #2
	add r2, r0, r2
	lsl r0, r1, #2
	ldr r0, [r2, r0]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	bne _02252258
	lsl r1, r0, #0x1e
	lsr r1, r1, #0x1f
	bne _02252258
	lsl r1, r0, #0x1d
	lsr r1, r1, #0x1f
	bne _02252258
	lsl r1, r0, #0x1c
	lsr r1, r1, #0x1f
	bne _02252258
	lsl r1, r0, #0x1b
	lsr r1, r1, #0x1f
	bne _02252258
	lsl r1, r0, #0x1a
	lsr r1, r1, #0x1f
	bne _02252258
	lsl r1, r0, #0x19
	lsr r1, r1, #0x1f
	bne _02252258
	lsl r1, r0, #0x17
	lsr r1, r1, #0x1f
	bne _02252258
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _0225225C
_02252258:
	mov r0, #1
	bx lr
_0225225C:
	mov r0, #0
	bx lr
	thumb_func_end ov12_02252218

	thumb_func_start ov12_02252260
ov12_02252260: ; 0x02252260
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r5, r1, #0
	add r6, r2, #0
	str r3, [sp, #4]
	mov r4, #0
	bl ov12_0223A7F0
	add r7, r0, #0
	cmp r6, #0
	beq _0225227E
	cmp r6, #1
	beq _022522A2
	b _022522D6
_0225227E:
	add r0, r4, #0
	cmp r7, #0
	ble _022522D6
	ldr r2, _022522DC ; =0x00002D8C
_02252286:
	ldr r1, [sp, #4]
	cmp r0, r1
	beq _02252298
	ldr r1, [r5, r2]
	cmp r1, #0
	beq _02252298
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
_02252298:
	add r0, r0, #1
	add r5, #0xc0
	cmp r0, r7
	blt _02252286
	b _022522D6
_022522A2:
	add r6, r4, #0
	cmp r7, #0
	ble _022522D6
_022522A8:
	ldr r0, [sp]
	add r1, r6, #0
	bl ov12_0223AB1C
	str r0, [sp, #8]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ov12_0223AB1C
	ldr r1, [sp, #8]
	cmp r1, r0
	bne _022522CE
	ldr r0, _022522DC ; =0x00002D8C
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _022522CE
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_022522CE:
	add r6, r6, #1
	add r5, #0xc0
	cmp r6, r7
	blt _022522A8
_022522D6:
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022522DC: .word 0x00002D8C
	thumb_func_end ov12_02252260

	thumb_func_start ov12_022522E0
ov12_022522E0: ; 0x022522E0
	add r2, r0, r1
	ldr r0, _022522EC ; =0x0000219C
	ldrb r0, [r2, r0]
	lsl r0, r0, #8
	orr r0, r1
	bx lr
	.balign 4, 0
_022522EC: .word 0x0000219C
	thumb_func_end ov12_022522E0

	thumb_func_start ov12_022522F0
ov12_022522F0: ; 0x022522F0
	push {r4, r5}
	lsl r3, r1, #4
	add r5, r0, r3
	ldr r3, _0225231C ; =0x000021B4
	mov r2, #0
	ldr r4, [r5, r3]
	cmp r4, #1
	bne _02252316
	sub r3, r3, #4
	ldr r3, [r5, r3]
	cmp r3, #0
	beq _02252316
	mov r2, #0xc0
	mul r2, r1
	add r1, r0, r2
	lsl r0, r3, #1
	add r1, r1, r0
	ldr r0, _02252320 ; =0x00002D4A
	ldrh r2, [r1, r0]
_02252316:
	add r0, r2, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
_0225231C: .word 0x000021B4
_02252320: .word 0x00002D4A
	thumb_func_end ov12_022522F0

	thumb_func_start ov12_02252324
ov12_02252324: ; 0x02252324
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	str r2, [sp, #4]
	str r0, [sp]
	add r7, r1, #0
	str r3, [sp, #8]
	ldr r6, [sp, #0x70]
	mov r4, #0
	bl ov12_0223A7F0
	add r5, r0, #0
	ldr r0, [sp, #4]
	cmp r0, #9
	bhi _02252398
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225234C: ; jump table
	.short _02252360 - _0225234C - 2 ; case 0
	.short _0225239A - _0225234C - 2 ; case 1
	.short _022523E6 - _0225234C - 2 ; case 2
	.short _02252420 - _0225234C - 2 ; case 3
	.short _0225246C - _0225234C - 2 ; case 4
	.short _022524BE - _0225234C - 2 ; case 5
	.short _022524E0 - _0225234C - 2 ; case 6
	.short _02252508 - _0225234C - 2 ; case 7
	.short _02252534 - _0225234C - 2 ; case 8
	.short _02252568 - _0225234C - 2 ; case 9
_02252360:
	add r0, r4, #0
	str r0, [sp, #0x44]
	cmp r5, #0
	ble _02252398
_02252368:
	ldr r0, [sp]
	ldr r1, [sp, #0x44]
	bl ov12_0223AB1C
	str r0, [sp, #0x48]
	ldr r0, [sp]
	ldr r1, [sp, #8]
	bl ov12_0223AB1C
	ldr r1, [sp, #0x48]
	cmp r1, r0
	bne _0225238E
	ldr r1, [sp, #0x44]
	add r0, r7, #0
	bl ov12_022527CC
	cmp r6, r0
	bne _0225238E
	add r4, r4, #1
_0225238E:
	ldr r0, [sp, #0x44]
	add r0, r0, #1
	str r0, [sp, #0x44]
	cmp r0, r5
	blt _02252368
_02252398:
	b _022525A0
_0225239A:
	add r0, r4, #0
	str r0, [sp, #0xc]
	cmp r5, #0
	ble _022523E4
	str r7, [sp, #0x30]
_022523A4:
	ldr r0, [sp]
	ldr r1, [sp, #0xc]
	bl ov12_0223AB1C
	str r0, [sp, #0x4c]
	ldr r0, [sp]
	ldr r1, [sp, #8]
	bl ov12_0223AB1C
	ldr r1, [sp, #0x4c]
	cmp r1, r0
	bne _022523D4
	ldr r1, [sp, #0x30]
	ldr r0, _022525A8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022523D4
	ldr r1, [sp, #0xc]
	add r0, r7, #0
	bl ov12_022527CC
	cmp r6, r0
	bne _022523D4
	add r4, r4, #1
_022523D4:
	ldr r0, [sp, #0x30]
	add r0, #0xc0
	str r0, [sp, #0x30]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, r5
	blt _022523A4
_022523E4:
	b _022525A0
_022523E6:
	add r0, r4, #0
	str r0, [sp, #0x10]
	cmp r5, #0
	ble _0225241E
_022523EE:
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	bl ov12_0223AB1C
	str r0, [sp, #0x50]
	ldr r0, [sp]
	ldr r1, [sp, #8]
	bl ov12_0223AB1C
	ldr r1, [sp, #0x50]
	cmp r1, r0
	beq _02252414
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	bl ov12_022527CC
	cmp r6, r0
	bne _02252414
	add r4, r4, #1
_02252414:
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, r5
	blt _022523EE
_0225241E:
	b _022525A0
_02252420:
	add r0, r4, #0
	str r0, [sp, #0x14]
	cmp r5, #0
	ble _0225246A
	str r7, [sp, #0x34]
_0225242A:
	ldr r0, [sp]
	ldr r1, [sp, #0x14]
	bl ov12_0223AB1C
	str r0, [sp, #0x54]
	ldr r0, [sp]
	ldr r1, [sp, #8]
	bl ov12_0223AB1C
	ldr r1, [sp, #0x54]
	cmp r1, r0
	beq _0225245A
	ldr r1, [sp, #0x34]
	ldr r0, _022525A8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225245A
	ldr r1, [sp, #0x14]
	add r0, r7, #0
	bl ov12_022527CC
	cmp r6, r0
	bne _0225245A
	add r4, r4, #1
_0225245A:
	ldr r0, [sp, #0x34]
	add r0, #0xc0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, r5
	blt _0225242A
_0225246A:
	b _022525A0
_0225246C:
	add r0, r4, #0
	str r0, [sp, #0x18]
	cmp r5, #0
	ble _022524BC
	str r7, [sp, #0x38]
_02252476:
	ldr r0, [sp]
	ldr r1, [sp, #0x18]
	bl ov12_0223AB1C
	str r0, [sp, #0x58]
	ldr r0, [sp]
	ldr r1, [sp, #8]
	bl ov12_0223AB1C
	ldr r1, [sp, #0x58]
	cmp r1, r0
	beq _022524AC
	ldr r1, [sp, #0x38]
	ldr r0, _022525A8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022524AC
	ldr r1, [sp, #0x18]
	add r0, r7, #0
	bl ov12_022527CC
	cmp r6, r0
	bne _022524AC
	ldr r0, [sp, #0x18]
	bl MaskOfFlagNo
	orr r4, r0
_022524AC:
	ldr r0, [sp, #0x38]
	add r0, #0xc0
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, r5
	blt _02252476
_022524BC:
	b _022525A0
_022524BE:
	add r0, r4, #0
	str r0, [sp, #0x1c]
	cmp r5, #0
	ble _022525A0
_022524C6:
	ldr r1, [sp, #0x1c]
	add r0, r7, #0
	bl ov12_022527CC
	cmp r6, r0
	bne _022524D4
	add r4, r4, #1
_022524D4:
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, r5
	blt _022524C6
	b _022525A0
_022524E0:
	add r0, r4, #0
	str r0, [sp, #0x20]
	cmp r5, #0
	ble _022525A0
_022524E8:
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #8]
	cmp r1, r0
	beq _022524FC
	add r0, r7, #0
	bl ov12_022527CC
	cmp r6, r0
	bne _022524FC
	add r4, r4, #1
_022524FC:
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, r5
	blt _022524E8
	b _022525A0
_02252508:
	add r0, r4, #0
	str r0, [sp, #0x24]
	cmp r5, #0
	ble _022525A0
_02252510:
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #8]
	cmp r1, r0
	beq _02252528
	add r0, r7, #0
	bl ov12_022527CC
	cmp r6, r0
	bne _02252528
	ldr r0, [sp, #0x24]
	add r4, r0, #1
	b _022525A0
_02252528:
	ldr r0, [sp, #0x24]
	add r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, r5
	blt _02252510
	b _022525A0
_02252534:
	add r0, r4, #0
	str r0, [sp, #0x28]
	cmp r5, #0
	ble _022525A0
	str r7, [sp, #0x3c]
_0225253E:
	ldr r1, [sp, #0x28]
	add r0, r7, #0
	bl ov12_022527CC
	cmp r6, r0
	bne _02252556
	ldr r1, [sp, #0x3c]
	ldr r0, _022525A8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02252556
	add r4, r4, #1
_02252556:
	ldr r0, [sp, #0x3c]
	add r0, #0xc0
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, r5
	blt _0225253E
	b _022525A0
_02252568:
	add r0, r4, #0
	str r0, [sp, #0x2c]
	cmp r5, #0
	ble _022525A0
	str r7, [sp, #0x40]
_02252572:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #8]
	cmp r1, r0
	beq _02252590
	add r0, r7, #0
	bl ov12_022527CC
	cmp r6, r0
	bne _02252590
	ldr r1, [sp, #0x40]
	ldr r0, _022525A8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02252590
	add r4, r4, #1
_02252590:
	ldr r0, [sp, #0x40]
	add r0, #0xc0
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x2c]
	add r0, r0, #1
	str r0, [sp, #0x2c]
	cmp r0, r5
	blt _02252572
_022525A0:
	add r0, r4, #0
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_022525A8: .word 0x00002D8C
	thumb_func_end ov12_02252324

	thumb_func_start ov12_022525AC
ov12_022525AC: ; 0x022525AC
	lsl r1, r1, #4
	add r1, r0, r1
	ldr r0, _02252608 ; =0x000003DE
	ldrh r2, [r1, r0]
	cmp r2, #0x9b
	bgt _022525DE
	cmp r2, #0x97
	blt _022525C4
	beq _022525FE
	cmp r2, #0x9b
	beq _022525FE
	b _02252602
_022525C4:
	cmp r2, #0x27
	bgt _022525D0
	bge _022525FE
	cmp r2, #0x1a
	beq _022525FE
	b _02252602
_022525D0:
	cmp r2, #0x4b
	bgt _022525D8
	beq _022525FE
	b _02252602
_022525D8:
	cmp r2, #0x91
	beq _022525FE
	b _02252602
_022525DE:
	mov r1, #1
	lsl r1, r1, #8
	cmp r2, r1
	bgt _022525EE
	bge _022525FE
	cmp r2, #0xff
	beq _022525FE
	b _02252602
_022525EE:
	add r0, r1, #7
	cmp r2, r0
	bgt _022525F8
	beq _022525FE
	b _02252602
_022525F8:
	add r1, #0x10
	cmp r2, r1
	bne _02252602
_022525FE:
	mov r0, #1
	bx lr
_02252602:
	mov r0, #0
	bx lr
	nop
_02252608: .word 0x000003DE
	thumb_func_end ov12_022525AC

	thumb_func_start ov12_0225260C
ov12_0225260C: ; 0x0225260C
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	mov r2, #1
	cmp r1, #0x70
	blo _02252624
	bl ov12_0223BD98
	mov r1, #0x70
	bl _u32_div_f
	mov r2, #0
_02252624:
	lsl r0, r1, #1
	add r0, r1, r0
	ldr r1, _02252640 ; =ov12_0226CC7C
	ldrb r1, [r1, r0]
	strb r1, [r5]
	ldr r1, _02252644 ; =ov12_0226CC7D
	ldrb r1, [r1, r0]
	strb r1, [r4]
	ldr r1, _02252648 ; =ov12_0226CC7E
	ldrb r1, [r1, r0]
	ldr r0, [sp, #0x10]
	strb r1, [r0]
	add r0, r2, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02252640: .word ov12_0226CC7C
_02252644: .word ov12_0226CC7D
_02252648: .word ov12_0226CC7E
	thumb_func_end ov12_0225260C

	thumb_func_start ov12_0225264C
ov12_0225264C: ; 0x0225264C
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _02252694 ; =ov12_0226CC7C
	add r5, r1, #0
	str r0, [sp]
	add r6, r2, #0
	mov r1, #0x28
_02252658:
	ldrb r2, [r4]
	ldr r0, [sp]
	cmp r0, r2
	bne _02252686
	ldrb r7, [r4, #1]
	cmp r5, r7
	bne _02252672
	ldrb r0, [r4, #2]
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	add r1, r0, #0
_02252672:
	cmp r6, r7
	bne _02252686
	cmp r5, r6
	beq _02252686
	ldrb r0, [r4, #2]
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	add r1, r0, #0
_02252686:
	add r4, r4, #3
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _02252658
	add r0, r1, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02252694: .word ov12_0226CC7C
	thumb_func_end ov12_0225264C

	thumb_func_start ov12_02252698
ov12_02252698: ; 0x02252698
	cmp r0, #0
	beq _022526C0
	cmp r0, #0xd6
	beq _022526C0
	ldr r2, _022526C8 ; =0x0000017F
	cmp r0, r2
	beq _022526C0
	add r1, r2, #0
	sub r1, #0x6d
	cmp r0, r1
	beq _022526C0
	sub r1, r2, #1
	cmp r0, r1
	beq _022526C0
	ldr r1, _022526CC ; =0x0000FF8A
	add r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bhi _022526C4
_022526C0:
	mov r0, #1
	bx lr
_022526C4:
	mov r0, #0
	bx lr
	.balign 4, 0
_022526C8: .word 0x0000017F
_022526CC: .word 0x0000FF8A
	thumb_func_end ov12_02252698

	thumb_func_start ov12_022526D0
ov12_022526D0: ; 0x022526D0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #0xae
	bne _022526FC
	add r1, r4, #0
	mov r2, #0x1b
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #7
	beq _022526F8
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x1c
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #7
	bne _022526FC
_022526F8:
	mov r0, #1
	pop {r3, r4, r5, pc}
_022526FC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_022526D0

	thumb_func_start ov12_02252700
ov12_02252700: ; 0x02252700
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r2, #0
	add r5, r1, #0
	add r1, r6, #0
	mov r7, #0
	bl ov12_0223AB1C
	str r0, [sp]
	ldr r0, _02252754 ; =0x00002DB8
	add r4, r5, r0
	mov r0, #0xc0
	mul r0, r6
	str r0, [sp, #4]
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _0225274E
	ldr r0, _02252758 ; =0x0000219C
	add r1, r5, r6
	ldrb r0, [r1, r0]
	bl MaskOfFlagNo
	ldr r1, [sp]
	lsl r1, r1, #3
	add r2, r5, r1
	mov r1, #0x71
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	lsl r1, r1, #3
	lsr r1, r1, #0x1a
	tst r0, r1
	bne _0225274E
	ldr r0, [sp, #4]
	ldrh r0, [r4, r0]
	bl ItemIdIsMail
	cmp r0, #0
	bne _0225274E
	mov r7, #1
_0225274E:
	add r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02252754: .word 0x00002DB8
_02252758: .word 0x0000219C
	thumb_func_end ov12_02252700

	thumb_func_start ov12_0225275C
ov12_0225275C: ; 0x0225275C
	push {r3, lr}
	mov r2, #0xc0
	mul r2, r1
	add r1, r0, r2
	ldr r0, _02252778 ; =0x00002DB8
	ldrh r0, [r1, r0]
	bl ItemIdIsMail
	cmp r0, #0
	bne _02252774
	mov r0, #1
	pop {r3, pc}
_02252774:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02252778: .word 0x00002DB8
	thumb_func_end ov12_0225275C

	thumb_func_start ov12_0225277C
ov12_0225277C: ; 0x0225277C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r2, [r5, #0x6c]
	mov r1, #0xc0
	add r4, r2, #0
	ldr r2, _022527C8 ; =0x00002D74
	mul r4, r1
	add r3, r5, r2
	ldrb r4, [r3, r4]
	ldr r3, [r5, #0x64]
	mov r6, #0
	mul r1, r3
	add r1, r5, r1
	ldrb r1, [r1, r2]
	cmp r1, r4
	blo _022527A0
	mov r6, #1
	b _022527C4
_022527A0:
	bl ov12_0223BD98
	ldr r2, [r5, #0x64]
	mov r1, #0xc0
	mul r1, r2
	add r2, r5, r1
	ldr r1, _022527C8 ; =0x00002D74
	lsl r0, r0, #0x18
	ldrb r1, [r2, r1]
	lsr r0, r0, #0x18
	add r1, r1, r4
	mul r0, r1
	asr r0, r0, #8
	add r1, r0, #1
	lsr r0, r4, #2
	cmp r1, r0
	ble _022527C4
	mov r6, #1
_022527C4:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022527C8: .word 0x00002D74
	thumb_func_end ov12_0225277C

	thumb_func_start ov12_022527CC
ov12_022527CC: ; 0x022527CC
	push {r4, r5}
	mov r2, #0xc0
	mul r2, r1
	mov r3, #0xb7
	mov r4, #2
	add r5, r0, r2
	lsl r3, r3, #6
	ldr r1, [r5, r3]
	lsl r4, r4, #0x14
	tst r4, r1
	beq _022527F0
	sub r3, #0x59
	ldrb r3, [r5, r3]
	cmp r3, #0x79
	beq _022527F0
	mov r0, #0
	pop {r4, r5}
	bx lr
_022527F0:
	mov r3, #6
	lsl r3, r3, #6
	ldr r4, [r0, r3]
	mov r3, #7
	lsl r3, r3, #0xc
	tst r3, r4
	beq _0225280E
	ldr r3, _02252830 ; =0x00002D67
	add r4, r0, r2
	ldrb r3, [r4, r3]
	cmp r3, #0x1a
	bne _0225280E
	mov r0, #0
	pop {r4, r5}
	bx lr
_0225280E:
	mov r3, #1
	lsl r3, r3, #0xa
	tst r1, r3
	beq _02252826
	ldr r1, _02252830 ; =0x00002D67
	add r3, r0, r2
	ldrb r1, [r3, r1]
	cmp r1, #0x1a
	bne _02252826
	mov r0, #0
	pop {r4, r5}
	bx lr
_02252826:
	add r1, r0, r2
	ldr r0, _02252830 ; =0x00002D67
	ldrb r0, [r1, r0]
	pop {r4, r5}
	bx lr
	.balign 4, 0
_02252830: .word 0x00002D67
	thumb_func_end ov12_022527CC

	thumb_func_start ov12_02252834
ov12_02252834: ; 0x02252834
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	str r2, [sp]
	add r4, r3, #0
	mov r6, #0
	bl ov12_022527CC
	cmp r0, #0x68
	beq _02252858
	ldr r1, [sp]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r4, r0
	bne _02252886
	mov r6, #1
	b _02252886
_02252858:
	ldr r1, [sp]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r4, r0
	bne _02252886
	mov r0, #0xb5
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x1c
	mul r0, r7
	ldr r3, [r1, r0]
	lsl r2, r3, #0x1c
	lsr r2, r2, #0x1f
	bne _02252886
	mov r2, #8
	orr r3, r2
	str r3, [r1, r0]
	ldr r1, _0225288C ; =0x0000213C
	lsl r0, r2, #0x14
	ldr r3, [r5, r1]
	orr r0, r3
	str r0, [r5, r1]
_02252886:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225288C: .word 0x0000213C
	thumb_func_end ov12_02252834

	thumb_func_start ov12_02252890
ov12_02252890: ; 0x02252890
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	mov r6, #0
	str r0, [sp]
	str r1, [sp, #4]
	add r4, r2, #0
	str r6, [sp, #0x18]
	bl ov12_0223A7E0
	add r5, r0, #0
	ldr r0, [sp]
	add r1, r4, #0
	bl ov12_0223A7F4
	str r0, [sp, #0x14]
	ldr r0, [sp]
	add r1, r4, #0
	bl ov12_0223A834
	add r7, r0, #0
	mov r0, #8
	tst r0, r5
	bne _022528D2
	mov r0, #0x10
	tst r0, r5
	beq _022528E6
	ldr r0, [sp]
	add r1, r4, #0
	bl ov12_0223AB0C
	mov r1, #1
	tst r0, r1
	beq _022528E6
_022528D2:
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #4]
	mov r5, #0
	add r1, r0, r4
	ldr r0, _0225297C ; =0x0000219C
	ldrb r0, [r1, r0]
	str r0, [sp, #0xc]
	str r0, [sp, #8]
	b _02252922
_022528E6:
	mov r0, #2
	tst r0, r5
	beq _02252910
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #4]
	mov r5, #0
	add r1, r0, r4
	ldr r0, _0225297C ; =0x0000219C
	ldrb r0, [r1, r0]
	add r1, r4, #0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	bl ov12_0223AB6C
	ldr r1, [sp, #4]
	add r1, r1, r0
	ldr r0, _0225297C ; =0x0000219C
	ldrb r0, [r1, r0]
	str r0, [sp, #8]
	b _02252922
_02252910:
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #4]
	mov r5, #0
	add r1, r0, r4
	ldr r0, _0225297C ; =0x0000219C
	ldrb r0, [r1, r0]
	str r0, [sp, #0xc]
	str r0, [sp, #8]
_02252922:
	cmp r5, r7
	bge _0225296C
_02252926:
	ldr r0, [sp, #0x14]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02252966
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02252966
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02252966
	ldr r0, [sp, #0xc]
	cmp r0, r5
	beq _02252966
	ldr r0, [sp, #8]
	cmp r0, r5
	beq _02252966
	add r6, r6, #1
_02252966:
	add r5, r5, #1
	cmp r5, r7
	blt _02252926
_0225296C:
	ldr r0, [sp, #0x10]
	cmp r6, r0
	blt _02252976
	mov r0, #1
	str r0, [sp, #0x18]
_02252976:
	ldr r0, [sp, #0x18]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225297C: .word 0x0000219C
	thumb_func_end ov12_02252890

	thumb_func_start ov12_02252980
ov12_02252980: ; 0x02252980
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	add r6, r2, #0
	add r7, r0, #0
	add r4, r3, #0
	bl ov12_0223A7E0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_02255830
	str r0, [sp, #8]
	cmp r0, #0x3f
	beq _022529B6
	mov r1, #0xa9
	ldr r0, [sp, #0xc]
	lsl r1, r1, #2
	tst r0, r1
	bne _022529B6
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_022527CC
	cmp r0, #0x32
	bne _022529BC
_022529B6:
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_022529BC:
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0223AB1C
	add r0, r7, #0
	bl ov12_0223A7F0
	mov r0, #0x17
	str r0, [sp]
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #9
	add r3, r6, #0
	bl ov12_02252324
	str r0, [sp, #0x10]
	cmp r0, #0
	beq _02252A12
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_022527CC
	cmp r0, #0x17
	beq _02252A12
	cmp r4, #0
	bne _022529F6
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_022529F6:
	mov r0, #0xb
	strb r0, [r4, #1]
	mov r0, #0x27
	strh r0, [r4, #2]
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	bl ov12_022522E0
	str r0, [r4, #4]
	mov r0, #0x17
	str r0, [r4, #8]
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02252A12:
	mov r0, #0x47
	str r0, [sp]
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #3
	add r3, r6, #0
	bl ov12_02252324
	str r0, [sp, #4]
	cmp r0, #0
	beq _02252AC4
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #7
	lsl r0, r0, #0xc
	tst r0, r1
	bne _02252A9E
	ldr r0, [sp, #8]
	cmp r0, #0x6a
	beq _02252A9E
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_022527CC
	cmp r0, #0x1a
	beq _02252AC4
	mov r0, #0xc0
	mul r0, r6
	add r1, r5, r0
	ldr r0, _02252B58 ; =0x00002DCC
	ldr r0, [r1, r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1d
	bne _02252AC4
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1b
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #2
	beq _02252AC4
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1c
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #2
	beq _02252AC4
	cmp r4, #0
	bne _02252A82
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02252A82:
	mov r0, #0xb
	strb r0, [r4, #1]
	mov r0, #0x27
	strh r0, [r4, #2]
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl ov12_022522E0
	str r0, [r4, #4]
	mov r0, #0x47
	str r0, [r4, #8]
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02252A9E:
	cmp r4, #0
	bne _02252AA8
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02252AA8:
	mov r0, #0xb
	strb r0, [r4, #1]
	mov r0, #0x27
	strh r0, [r4, #2]
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl ov12_022522E0
	str r0, [r4, #4]
	mov r0, #0x47
	str r0, [r4, #8]
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02252AC4:
	mov r0, #0x2a
	str r0, [sp]
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #3
	add r3, r6, #0
	bl ov12_02252324
	add r7, r0, #0
	beq _02252B1E
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1b
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #8
	beq _02252AF8
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1c
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #8
	bne _02252B1E
_02252AF8:
	cmp r4, #0
	bne _02252B02
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02252B02:
	mov r0, #0xb
	strb r0, [r4, #1]
	mov r0, #0x27
	strh r0, [r4, #2]
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_022522E0
	str r0, [r4, #4]
	mov r0, #0x2a
	str r0, [r4, #8]
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02252B1E:
	mov r0, #0xc0
	mul r0, r6
	add r3, r5, r0
	ldr r0, _02252B5C ; =0x00002DB0
	ldr r1, _02252B60 ; =0x0400E000
	ldr r2, [r3, r0]
	tst r2, r1
	bne _02252B38
	add r0, #0x10
	ldr r2, [r3, r0]
	lsr r0, r1, #0x10
	tst r0, r2
	beq _02252B50
_02252B38:
	cmp r4, #0
	bne _02252B42
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02252B42:
	mov r0, #0
	strb r0, [r4, #1]
	ldr r0, _02252B64 ; =0x0000031A
	add sp, #0x14
	strh r0, [r4, #2]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02252B50:
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02252B58: .word 0x00002DCC
_02252B5C: .word 0x00002DB0
_02252B60: .word 0x0400E000
_02252B64: .word 0x0000031A
	thumb_func_end ov12_02252980

	thumb_func_start ov12_02252B68
ov12_02252B68: ; 0x02252B68
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r2, #0
	str r0, [sp]
	bl ov12_0223A7E0
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02255830
	mov r6, #0
	cmp r0, #0x3f
	bne _02252B9C
	mov r0, #0x75
	lsl r0, r0, #2
	add r3, r5, r0
	lsl r2, r4, #6
	ldr r1, [r3, r2]
	ldr r0, _02252C34 ; =0xFFFFFE7F
	mov r6, #1
	and r1, r0
	mov r0, #0x80
	orr r0, r1
	str r0, [r3, r2]
	b _02252C30
_02252B9C:
	mov r0, #0xa9
	lsl r0, r0, #2
	tst r0, r7
	beq _02252BA8
	mov r6, #1
	b _02252C30
_02252BA8:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_022527CC
	cmp r0, #0x32
	bne _02252BCC
	mov r1, #0x75
	lsl r1, r1, #2
	add r5, r5, r1
	lsl r3, r4, #6
	ldr r2, [r5, r3]
	ldr r0, _02252C34 ; =0xFFFFFE7F
	sub r1, #0xd4
	and r0, r2
	orr r0, r1
	str r0, [r5, r3]
	mov r6, #1
	b _02252C30
_02252BCC:
	mov r0, #1
	add r1, r4, #0
	eor r1, r0
	mov r2, #0xc0
	add r3, r1, #0
	mul r3, r2
	add r1, r5, r3
	ldr r3, _02252C38 ; =0x00002D46
	mul r2, r4
	add r2, r5, r2
	ldrh r1, [r1, r3]
	ldrh r2, [r2, r3]
	cmp r2, r1
	bhs _02252C16
	lsl r0, r2, #7
	bl _s32_div_f
	ldr r1, _02252C3C ; =0x0000311E
	ldrb r2, [r5, r1]
	mov r1, #0x1e
	mul r1, r2
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [sp]
	bl ov12_0223BD98
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x18
	sub r2, r2, r1
	mov r0, #0x18
	ror r2, r0
	add r0, r1, r2
	cmp r7, r0
	ble _02252C18
	mov r6, #1
	b _02252C18
_02252C16:
	add r6, r0, #0
_02252C18:
	cmp r6, #0
	bne _02252C28
	ldr r0, [sp]
	add r1, r4, #0
	mov r2, #0
	mov r3, #0x63
	bl ov12_02263F0C
_02252C28:
	ldr r0, _02252C3C ; =0x0000311E
	ldrb r1, [r5, r0]
	add r1, r1, #1
	strb r1, [r5, r0]
_02252C30:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02252C34: .word 0xFFFFFE7F
_02252C38: .word 0x00002D46
_02252C3C: .word 0x0000311E
	thumb_func_end ov12_02252B68

	thumb_func_start ov12_02252C40
ov12_02252C40: ; 0x02252C40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov12_022527CC
	cmp r0, #0x36
	bne _02252C6A
	mov r2, #0xc0
	mul r2, r4
	add r3, r5, r2
	ldr r2, _02252C70 ; =0x00002DC8
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r2, [r3, r2]
	ldr r1, [r5, r0]
	mov r0, #1
	lsl r2, r2, #1
	and r1, r0
	lsr r2, r2, #0x1f
	cmp r1, r2
	bne _02252C6C
_02252C6A:
	mov r0, #0
_02252C6C:
	pop {r3, r4, r5, pc}
	nop
_02252C70: .word 0x00002DC8
	thumb_func_end ov12_02252C40

	thumb_func_start ov12_02252C74
ov12_02252C74: ; 0x02252C74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r1, #0
	mov r1, #0
	str r0, [sp]
	add r4, r2, #0
	add r5, r3, #0
	str r1, [sp, #4]
	bl ov12_0223A7F0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	add r1, r4, #0
	bl ov12_0223AB1C
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	mov r7, #0
	cmp r0, #0
	ble _02252CDE
	ldr r4, _02252CE4 ; =0x00002D4C
_02252C9E:
	ldr r0, [sp]
	add r1, r7, #0
	bl ov12_0223AB1C
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _02252CD4
	mov r0, #0xb7
	lsl r0, r0, #6
	ldr r1, [r6, r0]
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r1
	beq _02252CD4
	mov r1, #0
	add r2, r6, #0
_02252CBE:
	ldrh r0, [r2, r4]
	cmp r5, r0
	beq _02252CCC
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, #4
	blt _02252CBE
_02252CCC:
	cmp r1, #4
	beq _02252CD4
	mov r0, #1
	str r0, [sp, #4]
_02252CD4:
	ldr r0, [sp, #0xc]
	add r7, r7, #1
	add r6, #0xc0
	cmp r7, r0
	blt _02252C9E
_02252CDE:
	ldr r0, [sp, #4]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02252CE4: .word 0x00002D4C
	thumb_func_end ov12_02252C74

	thumb_func_start ov12_02252CE8
ov12_02252CE8: ; 0x02252CE8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	mov r6, #0
	bl ov12_0223A7F0
	add r3, r6, #0
	cmp r0, #0
	ble _02252D10
	mov r1, #0xb7
	lsl r1, r1, #6
_02252CFE:
	ldr r2, [r5, r1]
	tst r2, r4
	beq _02252D08
	mov r6, #1
	b _02252D10
_02252D08:
	add r3, r3, #1
	add r5, #0xc0
	cmp r3, r0
	blt _02252CFE
_02252D10:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_02252CE8

	thumb_func_start ov12_02252D14
ov12_02252D14: ; 0x02252D14
	ldr r2, _02252D34 ; =0x0000216C
	mov r0, #0
	str r0, [r1, r2]
	add r0, r2, #0
	mov r3, #1
	sub r0, #0x1c
	str r3, [r1, r0]
	add r0, r2, #0
	sub r0, #0x30
	ldr r3, [r1, r0]
	ldr r0, _02252D38 ; =0xFFEFFFFF
	sub r2, #0x30
	and r0, r3
	str r0, [r1, r2]
	bx lr
	nop
_02252D34: .word 0x0000216C
_02252D38: .word 0xFFEFFFFF
	thumb_func_end ov12_02252D14

	thumb_func_start ov12_02252D3C
ov12_02252D3C: ; 0x02252D3C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #4]
	str r1, [sp, #8]
	bl ov12_0223A7F0
	mov r2, #0
	str r0, [sp, #0x14]
	cmp r0, #0
	ble _02252D60
	ldr r1, _02252DC0 ; =0x000021EC
_02252D52:
	ldr r0, [sp, #8]
	add r0, r0, r2
	strb r2, [r0, r1]
	ldr r0, [sp, #0x14]
	add r2, r2, #1
	cmp r2, r0
	blt _02252D52
_02252D60:
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	sub r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #0
	ble _02252DBC
_02252D6E:
	ldr r0, [sp, #0x10]
	add r4, r0, #1
	ldr r0, [sp, #0x14]
	cmp r4, r0
	bge _02252DB0
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x10]
	add r6, r1, r0
_02252D7E:
	ldr r0, _02252DC0 ; =0x000021EC
	ldr r1, [sp, #8]
	ldrb r0, [r6, r0]
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r2, [sp, #0xc]
	add r7, r0, r4
	ldr r0, _02252DC0 ; =0x000021EC
	ldrb r5, [r7, r0]
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #4]
	add r3, r5, #0
	bl ov12_0224FC48
	cmp r0, #0
	beq _02252DA8
	ldr r0, _02252DC0 ; =0x000021EC
	ldr r1, [sp, #0xc]
	strb r5, [r6, r0]
	strb r1, [r7, r0]
_02252DA8:
	ldr r0, [sp, #0x14]
	add r4, r4, #1
	cmp r4, r0
	blt _02252D7E
_02252DB0:
	ldr r0, [sp, #0x10]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _02252D6E
_02252DBC:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02252DC0: .word 0x000021EC
	thumb_func_end ov12_02252D3C

	thumb_func_start ov12_02252DC4
ov12_02252DC4: ; 0x02252DC4
	push {r3, r4}
	mov r2, #6
	lsl r2, r2, #6
	ldr r2, [r1, r2]
	mov r1, #7
	lsl r1, r1, #0xc
	mov r0, #0
	tst r1, r2
	beq _02252DEE
	ldr r4, _02252DF4 ; =ov12_0226CB7C
	add r2, r0, #0
_02252DDA:
	ldrh r1, [r4]
	cmp r3, r1
	bne _02252DE6
	mov r0, #1
	pop {r3, r4}
	bx lr
_02252DE6:
	add r2, r2, #1
	add r4, r4, #2
	cmp r2, #6
	blo _02252DDA
_02252DEE:
	pop {r3, r4}
	bx lr
	nop
_02252DF4: .word ov12_0226CB7C
	thumb_func_end ov12_02252DC4

	thumb_func_start ov12_02252DF8
ov12_02252DF8: ; 0x02252DF8
	push {r3, r4}
	mov r4, #0xc0
	mul r4, r2
	add r2, r1, r4
	ldr r1, _02252E28 ; =0x00002DCC
	mov r0, #0
	ldr r1, [r2, r1]
	lsl r1, r1, #0xd
	lsr r1, r1, #0x1d
	beq _02252E24
	ldr r4, _02252E2C ; =ov12_0226CBA2
	add r2, r0, #0
_02252E10:
	ldrh r1, [r4]
	cmp r3, r1
	bne _02252E1C
	mov r0, #1
	pop {r3, r4}
	bx lr
_02252E1C:
	add r2, r2, #1
	add r4, r4, #2
	cmp r2, #0xe
	blo _02252E10
_02252E24:
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02252E28: .word 0x00002DCC
_02252E2C: .word ov12_0226CBA2
	thumb_func_end ov12_02252DF8

	thumb_func_start ov12_02252E30
ov12_02252E30: ; 0x02252E30
	push {r4, r5, r6, r7}
	mov r0, #0xc1
	lsl r0, r0, #6
	ldr r3, [r1, r0]
	ldr r0, _02252E98 ; =0x00000183
	cmp r3, r0
	beq _02252E94
	ldr r4, [r1, #0x64]
	mov r0, #0xc0
	add r2, r4, #0
	mul r2, r0
	ldr r4, _02252E9C ; =0x00002DCC
	add r0, r1, r2
	ldr r4, [r0, r4]
	lsl r4, r4, #0x13
	lsr r7, r4, #0x1d
	cmp r7, #4
	beq _02252E94
	mov r6, #0
	cmp r7, #0
	bls _02252E6A
	ldr r4, _02252EA0 ; =0x00002DF0
_02252E5C:
	ldrh r5, [r0, r4]
	cmp r3, r5
	beq _02252E94
	add r6, r6, #1
	add r0, r0, #2
	cmp r6, r7
	blo _02252E5C
_02252E6A:
	add r2, r1, r2
	lsl r0, r6, #1
	add r2, r2, r0
	ldr r0, _02252EA0 ; =0x00002DF0
	strh r3, [r2, r0]
	sub r0, #0x24
	add r2, r1, r0
	ldr r3, [r1, #0x64]
	mov r0, #0xc0
	add r1, r3, #0
	mul r1, r0
	ldr r3, [r2, r1]
	ldr r0, _02252EA4 ; =0xFFFFE3FF
	and r0, r3
	lsl r3, r3, #0x13
	lsr r3, r3, #0x1d
	add r3, r3, #1
	lsl r3, r3, #0x1d
	lsr r3, r3, #0x13
	orr r0, r3
	str r0, [r2, r1]
_02252E94:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_02252E98: .word 0x00000183
_02252E9C: .word 0x00002DCC
_02252EA0: .word 0x00002DF0
_02252EA4: .word 0xFFFFE3FF
	thumb_func_end ov12_02252E30

	thumb_func_start ov12_02252EA8
ov12_02252EA8: ; 0x02252EA8
	mov r3, #0xc0
	mul r3, r2
	add r3, r1, r3
	ldr r1, _02252EC4 ; =0x00002D4C
	mov r0, #0
_02252EB2:
	ldrh r2, [r3, r1]
	cmp r2, #0
	beq _02252EC0
	add r0, r0, #1
	add r3, r3, #2
	cmp r0, #4
	blt _02252EB2
_02252EC0:
	bx lr
	nop
_02252EC4: .word 0x00002D4C
	thumb_func_end ov12_02252EA8

	thumb_func_start ov12_02252EC8
ov12_02252EC8: ; 0x02252EC8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	mov r2, #0
	add r5, r0, #0
	add r7, r1, #0
	str r2, [sp]
	bl ov12_022527CC
	cmp r0, #0x60
	bne _02252EE0
	mov r6, #0
	b _02252EF4
_02252EE0:
	ldr r0, _02253044 ; =0x00002160
	ldr r6, [r5, r0]
	cmp r6, #0
	bne _02252EF4
	ldr r0, _02253048 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0225304C ; =0x000003E2
	ldrb r6, [r1, r0]
_02252EF4:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	mov r3, #0xa
	bl ov12_02252834
	cmp r0, #1
	bne _02252F24
	cmp r6, #0xd
	bne _02252F24
	cmp r7, r4
	beq _02252F24
	mov r0, #0xc0
	mul r0, r4
	add r1, r5, r0
	ldr r0, _02253050 ; =0x00002D90
	ldr r0, [r1, r0]
	mov r1, #4
	bl ov12_02253178
	ldr r1, _02253054 ; =0x0000215C
	str r0, [r5, r1]
	mov r0, #0xb2
	str r0, [sp]
_02252F24:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	mov r3, #0xb
	bl ov12_02252834
	cmp r0, #1
	bne _02252F6A
	cmp r6, #0xb
	bne _02252F6A
	ldr r0, _02253058 ; =0x0000213C
	ldr r1, [r5, r0]
	mov r0, #0x20
	tst r0, r1
	bne _02252F6A
	ldr r0, _02253048 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0225305C ; =0x000003E1
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02252F6A
	mov r0, #0xc0
	mul r0, r4
	add r1, r5, r0
	ldr r0, _02253050 ; =0x00002D90
	ldr r0, [r1, r0]
	mov r1, #4
	bl ov12_02253178
	ldr r1, _02253054 ; =0x0000215C
	str r0, [r5, r1]
	mov r0, #0xb2
	str r0, [sp]
_02252F6A:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	mov r3, #0x12
	bl ov12_02252834
	cmp r0, #1
	bne _02252FB0
	cmp r6, #0xa
	bne _02252FB0
	mov r0, #0xc0
	mul r0, r4
	add r1, r5, r0
	ldr r0, _02253060 ; =0x00002DAC
	ldr r0, [r1, r0]
	mov r1, #0x20
	tst r0, r1
	bne _02252FB0
	ldr r0, _02253058 ; =0x0000213C
	ldr r0, [r5, r0]
	tst r0, r1
	bne _02252FB0
	ldr r0, _02253048 ; =0x00003044
	ldr r3, [r5, r0]
	lsl r0, r3, #4
	add r2, r5, r0
	ldr r0, _0225305C ; =0x000003E1
	ldrb r0, [r2, r0]
	cmp r0, #0
	bne _02252FAC
	add r1, #0xe5
	cmp r3, r1
	bne _02252FB0
_02252FAC:
	mov r0, #0xb3
	str r0, [sp]
_02252FB0:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	mov r3, #0x2b
	bl ov12_02252834
	cmp r0, #1
	bne _02252FDC
	ldr r0, _02253048 ; =0x00003044
	ldr r2, _02253064 ; =ov12_0226EC20
	ldr r3, [r5, r0]
	mov r1, #0
_02252FC8:
	ldrh r0, [r2]
	cmp r3, r0
	bne _02252FD4
	mov r0, #0xb5
	str r0, [sp]
	b _02252FDC
_02252FD4:
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, #0xc
	blo _02252FC8
_02252FDC:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	mov r3, #0x4e
	bl ov12_02252834
	cmp r0, #1
	bne _02252FF8
	cmp r6, #0xd
	bne _02252FF8
	cmp r7, r4
	beq _02252FF8
	mov r0, #0xb6
	str r0, [sp]
_02252FF8:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	mov r3, #0x57
	bl ov12_02252834
	cmp r0, #1
	bne _0225303E
	cmp r6, #0xb
	bne _0225303E
	ldr r0, _02253058 ; =0x0000213C
	ldr r1, [r5, r0]
	mov r0, #0x20
	tst r0, r1
	bne _0225303E
	ldr r0, _02253048 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0225305C ; =0x000003E1
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _0225303E
	mov r0, #0xc0
	mul r0, r4
	add r1, r5, r0
	ldr r0, _02253050 ; =0x00002D90
	ldr r0, [r1, r0]
	mov r1, #4
	bl ov12_02253178
	ldr r1, _02253054 ; =0x0000215C
	str r0, [r5, r1]
	mov r0, #0xb2
	str r0, [sp]
_0225303E:
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02253044: .word 0x00002160
_02253048: .word 0x00003044
_0225304C: .word 0x000003E2
_02253050: .word 0x00002D90
_02253054: .word 0x0000215C
_02253058: .word 0x0000213C
_0225305C: .word 0x000003E1
_02253060: .word 0x00002DAC
_02253064: .word ov12_0226EC20
	thumb_func_end ov12_02252EC8

	thumb_func_start ov12_02253068
ov12_02253068: ; 0x02253068
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r4, r2, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r6, #0
	bl ov12_022527CC
	cmp r0, #3
	beq _02253086
	cmp r0, #0x3d
	beq _022530CC
	b _0225314E
_02253086:
	mov r2, #0xc0
	add r0, r4, #0
	mul r0, r2
	ldr r3, _0225316C ; =0x00002D8C
	add r0, r5, r0
	ldr r1, [r0, r3]
	cmp r1, #0
	beq _0225314E
	add r1, r3, #0
	sub r1, #0x31
	ldrsb r1, [r0, r1]
	cmp r1, #0xc
	bge _0225314E
	add r2, #0x90
	ldr r1, [r5, r2]
	add r3, #0x48
	ldr r0, [r0, r3]
	add r1, r1, #1
	cmp r1, r0
	beq _0225314E
	add r0, r5, #0
	mov r1, #0x11
	add r0, #0x8c
	str r1, [r0]
	add r0, r5, #0
	mov r1, #3
	add r0, #0x88
	str r1, [r0]
	add r0, r5, #0
	add r0, #0x94
	str r4, [r0]
	mov r0, #0xc
	str r0, [sp, #4]
	mov r6, #1
	b _0225314E
_022530CC:
	ldr r1, _02253170 ; =0x00002DAC
	mov r0, #0xc0
	add r7, r4, #0
	mul r7, r0
	add r0, r5, r1
	str r0, [sp, #8]
	ldr r0, [r0, r7]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	beq _0225314E
	add r0, r5, r7
	sub r1, #0x20
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _0225314E
	ldr r0, [sp]
	bl ov12_0223BD98
	mov r1, #0xa
	bl _s32_div_f
	cmp r1, #3
	bge _0225314E
	ldr r0, [sp, #8]
	mov r1, #7
	ldr r0, [r0, r7]
	tst r1, r0
	beq _0225310E
	mov r0, #0x13
	add r1, r6, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	b _02253142
_0225310E:
	ldr r1, _02253174 ; =0x00000F88
	tst r1, r0
	beq _0225311E
	mov r0, #0x13
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r5, r0]
	b _02253142
_0225311E:
	mov r1, #0x10
	tst r1, r0
	beq _0225312E
	mov r0, #0x13
	mov r1, #2
	lsl r0, r0, #4
	str r1, [r5, r0]
	b _02253142
_0225312E:
	mov r1, #0x40
	tst r0, r1
	beq _0225313C
	mov r0, #3
	add r1, #0xf0
	str r0, [r5, r1]
	b _02253142
_0225313C:
	mov r0, #4
	add r1, #0xf0
	str r0, [r5, r1]
_02253142:
	mov r0, #0x46
	lsl r0, r0, #2
	str r4, [r5, r0]
	mov r0, #0xbe
	str r0, [sp, #4]
	mov r6, #1
_0225314E:
	cmp r6, #1
	bne _02253164
	ldr r2, [sp, #4]
	add r0, r5, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r5, #8]
	str r0, [r5, #0xc]
	mov r0, #0x16
	str r0, [r5, #8]
_02253164:
	add r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225316C: .word 0x00002D8C
_02253170: .word 0x00002DAC
_02253174: .word 0x00000F88
	thumb_func_end ov12_02253068

	thumb_func_start ov12_02253178
ov12_02253178: ; 0x02253178
	push {r4, lr}
	cmp r0, #0
	beq _02253192
	bge _02253186
	mov r4, #0
	mvn r4, r4
	b _02253188
_02253186:
	mov r4, #1
_02253188:
	bl _s32_div_f
	cmp r0, #0
	bne _02253192
	add r0, r4, #0
_02253192:
	pop {r4, pc}
	thumb_func_end ov12_02253178

	thumb_func_start ov12_02253194
ov12_02253194: ; 0x02253194
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xd0
	add r6, r0, #0
	add r5, r1, #0
	bl ov12_0223A7F0
	str r0, [sp, #0x80]
	mov r0, #0
	str r0, [sp, #0x84]
	str r0, [sp, #0xcc]
	thumb_func_end ov12_02253194

	thumb_func_start ov12_022531A8
ov12_022531A8: ; 0x022531A8
	ldr r0, [r5, #0x58]
	cmp r0, #0xf
	bls _022531B2
	bl _02253D80
_022531B2:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022531BE: ; jump table
	.short _022531DE - _022531BE - 2 ; case 0
	.short _02253274 - _022531BE - 2 ; case 1
	.short _02253338 - _022531BE - 2 ; case 2
	.short _02253448 - _022531BE - 2 ; case 3
	.short _022534BE - _022531BE - 2 ; case 4
	.short _02253624 - _022531BE - 2 ; case 5
	.short _02253764 - _022531BE - 2 ; case 6
	.short _02253974 - _022531BE - 2 ; case 7
	.short _02253ACC - _022531BE - 2 ; case 8
	.short _02253BA4 - _022531BE - 2 ; case 9
	.short _02253C18 - _022531BE - 2 ; case 10
	.short _02253CA6 - _022531BE - 2 ; case 11
	.short _02253CC2 - _022531BE - 2 ; case 12
	.short _02253CFC - _022531BE - 2 ; case 13
	.short _02253D38 - _022531BE - 2 ; case 14
	.short _02253D78 - _022531BE - 2 ; case 15
_022531DE:
	ldr r0, _022534D0 ; =0x00003121
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _0225326A
	add r0, r6, #0
	bl ov12_0223BAF8
	ldr r1, _022534D4 ; =0x000003E9
	cmp r0, r1
	bgt _0225321A
	bge _0225324C
	cmp r0, #0xa
	bhi _0225325E
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02253204: ; jump table
	.short _0225325E - _02253204 - 2 ; case 0
	.short _02253222 - _02253204 - 2 ; case 1
	.short _02253222 - _02253204 - 2 ; case 2
	.short _02253222 - _02253204 - 2 ; case 3
	.short _0225322C - _02253204 - 2 ; case 4
	.short _0225322C - _02253204 - 2 ; case 5
	.short _0225322C - _02253204 - 2 ; case 6
	.short _02253238 - _02253204 - 2 ; case 7
	.short _0225325E - _02253204 - 2 ; case 8
	.short _02253242 - _02253204 - 2 ; case 9
	.short _02253242 - _02253204 - 2 ; case 10
_0225321A:
	ldr r1, _022534D8 ; =0x000003EA
	cmp r0, r1
	beq _02253256
	b _0225325E
_02253222:
	ldr r0, _022534DC ; =0x0000010F
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _0225325E
_0225322C:
	mov r0, #0x11
	lsl r0, r0, #4
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _0225325E
_02253238:
	ldr r0, _022534E0 ; =0x00000111
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _0225325E
_02253242:
	ldr r0, _022534E4 ; =0x00000112
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _0225325E
_0225324C:
	ldr r0, _022534E8 ; =0x00000126
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _0225325E
_02253256:
	ldr r0, _022534EC ; =0x00000127
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
_0225325E:
	ldr r0, [sp, #0x84]
	cmp r0, #1
	bne _0225326A
	ldr r0, _022534D0 ; =0x00003121
	mov r1, #1
	strb r1, [r5, r0]
_0225326A:
	ldr r0, [r5, #0x58]
	add r0, r0, #1
	str r0, [r5, #0x58]
	bl _02253D80
_02253274:
	ldr r0, [sp, #0x80]
	mov r7, #0
	cmp r0, #0
	ble _02253324
	ldr r0, _022534F0 ; =0x00002D68
	add r0, r5, r0
	str r0, [sp, #0x90]
_02253282:
	ldr r0, _022534F4 ; =0x000021EC
	add r1, r5, r7
	ldrb r4, [r1, r0]
	add r0, r6, #0
	mov r2, #0
	add r1, r4, #0
	bl ov12_0223ABB8
	str r0, [sp, #0x88]
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #2
	bl ov12_0223ABB8
	add r3, r0, #0
	ldr r2, [sp, #0x88]
	add r0, r6, #0
	add r1, r5, #0
	bl ov12_022585B8
	mov r1, #0x12
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #0xc0
	mul r0, r4
	ldr r1, [sp, #0x90]
	str r0, [sp, #0x8c]
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	bne _0225331C
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	cmp r1, #0xff
	beq _0225331C
	ldr r0, [sp, #0x8c]
	ldr r2, _022534F8 ; =0x00002D8C
	add r0, r5, r0
	ldr r2, [r0, r2]
	cmp r2, #0
	beq _0225331C
	ldr r2, _022534FC ; =0x00002DB8
	ldrh r0, [r0, r2]
	cmp r0, #0x70
	beq _0225331C
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	add r0, r2, #0
	sub r0, #0x2c
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225331C
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_022527CC
	cmp r0, #0x24
	bne _0225331C
	ldr r1, [sp, #0x90]
	ldr r0, [sp, #0x8c]
	ldr r1, [r1, r0]
	mov r0, #4
	add r2, r1, #0
	orr r2, r0
	ldr r1, [sp, #0x90]
	ldr r0, [sp, #0x8c]
	str r2, [r1, r0]
	mov r0, #0x46
	lsl r0, r0, #2
	str r4, [r5, r0]
	mov r0, #0xbb
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _02253324
_0225331C:
	ldr r0, [sp, #0x80]
	add r7, r7, #1
	cmp r7, r0
	blt _02253282
_02253324:
	ldr r0, [sp, #0x80]
	cmp r7, r0
	beq _0225332E
	bl _02253D80
_0225332E:
	ldr r0, [r5, #0x58]
	add r0, r0, #1
	str r0, [r5, #0x58]
	bl _02253D80
_02253338:
	mov r0, #0
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x80]
	cmp r0, #0
	ble _02253436
	ldr r0, _022534F0 ; =0x00002D68
	add r7, r5, r0
	mov r0, #1
	str r0, [sp, #0xbc]
	str r0, [sp, #0xb8]
	str r0, [sp, #0xb4]
	str r0, [sp, #0xb0]
_02253350:
	ldr r0, [sp, #0x2c]
	add r1, r5, r0
	ldr r0, _022534F4 ; =0x000021EC
	ldrb r1, [r1, r0]
	mov r0, #0xc0
	add r4, r1, #0
	mul r4, r0
	ldr r0, [r7, r4]
	str r1, [sp, #0x10]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _0225341A
	ldr r0, _022534F8 ; =0x00002D8C
	add r1, r5, r4
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225341A
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x2d
	bgt _02253386
	bge _022533B6
	cmp r0, #2
	beq _02253394
	b _0225341A
_02253386:
	cmp r0, #0x46
	bgt _0225338E
	beq _022533D8
	b _0225341A
_0225338E:
	cmp r0, #0x75
	beq _022533FA
	b _0225341A
_02253394:
	ldr r0, [r7, r4]
	ldr r1, [sp, #0xb0]
	bic r0, r1
	mov r1, #1
	orr r0, r1
	str r0, [r7, r4]
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #2
	tst r0, r1
	bne _0225341A
	mov r0, #0xb7
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _0225341A
_022533B6:
	ldr r0, [r7, r4]
	ldr r1, [sp, #0xb4]
	bic r0, r1
	mov r1, #1
	orr r0, r1
	str r0, [r7, r4]
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #8
	tst r0, r1
	bne _0225341A
	mov r0, #0xb8
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _0225341A
_022533D8:
	ldr r0, [r7, r4]
	ldr r1, [sp, #0xb8]
	bic r0, r1
	mov r1, #1
	orr r0, r1
	str r0, [r7, r4]
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #0x20
	tst r0, r1
	bne _0225341A
	mov r0, #0xb9
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _0225341A
_022533FA:
	ldr r0, [r7, r4]
	ldr r1, [sp, #0xbc]
	bic r0, r1
	mov r1, #1
	orr r0, r1
	str r0, [r7, r4]
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #0x80
	tst r0, r1
	bne _0225341A
	mov r0, #0xfc
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
_0225341A:
	ldr r0, [sp, #0x84]
	cmp r0, #1
	bne _0225342A
	mov r1, #0x46
	ldr r0, [sp, #0x10]
	lsl r1, r1, #2
	str r0, [r5, r1]
	b _02253436
_0225342A:
	ldr r0, [sp, #0x2c]
	add r1, r0, #1
	ldr r0, [sp, #0x80]
	str r1, [sp, #0x2c]
	cmp r1, r0
	blt _02253350
_02253436:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x80]
	cmp r1, r0
	bne _022534B0
	ldr r0, [r5, #0x58]
	add r0, r0, #1
	str r0, [r5, #0x58]
	bl _02253D80
_02253448:
	ldr r0, [sp, #0x80]
	mov r4, #0
	cmp r0, #0
	ble _022534AA
	ldr r0, _022534F0 ; =0x00002D68
	add r0, r5, r0
	str r0, [sp, #0x94]
_02253456:
	ldr r0, _022534F4 ; =0x000021EC
	add r1, r5, r4
	ldrb r1, [r1, r0]
	mov r0, #0xc0
	add r7, r1, #0
	mul r7, r0
	ldr r0, [sp, #0x94]
	str r1, [sp, #0x14]
	ldr r0, [r0, r7]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	bne _022534A2
	ldr r0, _022534F8 ; =0x00002D8C
	add r1, r5, r7
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022534A2
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x16
	bne _022534A2
	ldr r0, [sp, #0x94]
	ldr r1, [r0, r7]
	mov r0, #2
	orr r1, r0
	ldr r0, [sp, #0x94]
	str r1, [r0, r7]
	mov r1, #0x46
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xba
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _022534AA
_022534A2:
	ldr r0, [sp, #0x80]
	add r4, r4, #1
	cmp r4, r0
	blt _02253456
_022534AA:
	ldr r0, [sp, #0x80]
	cmp r4, r0
	beq _022534B4
_022534B0:
	bl _02253D80
_022534B4:
	ldr r0, [r5, #0x58]
	add r0, r0, #1
	str r0, [r5, #0x58]
	bl _02253D80
_022534BE:
	mov r0, #0
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x80]
	cmp r0, #0
	bgt _022534CA
	b _02253612
_022534CA:
	ldr r0, _022534F0 ; =0x00002D68
	b _02253500
	nop
_022534D0: .word 0x00003121
_022534D4: .word 0x000003E9
_022534D8: .word 0x000003EA
_022534DC: .word 0x0000010F
_022534E0: .word 0x00000111
_022534E4: .word 0x00000112
_022534E8: .word 0x00000126
_022534EC: .word 0x00000127
_022534F0: .word 0x00002D68
_022534F4: .word 0x000021EC
_022534F8: .word 0x00002D8C
_022534FC: .word 0x00002DB8
_02253500:
	add r0, r5, r0
	str r0, [sp, #0x9c]
_02253504:
	ldr r0, [sp, #0x30]
	add r1, r5, r0
	ldr r0, _02253804 ; =0x000021EC
	ldrb r1, [r1, r0]
	mov r0, #0xc0
	mul r0, r1
	str r1, [sp, #0x18]
	ldr r1, [sp, #0x9c]
	str r0, [sp, #0x98]
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bne _02253604
	ldr r0, [sp, #0x98]
	add r1, r5, r0
	ldr r0, _02253808 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02253604
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x58
	bne _02253604
	mov r0, #0
	str r0, [sp, #0x78]
	str r0, [sp, #0x74]
	str r0, [sp, #0x7c]
	ldr r0, [sp, #0x80]
	cmp r0, #0
	ble _022535BE
	add r4, r5, #0
_02253546:
	ldr r1, [sp, #0x18]
	add r0, r6, #0
	bl ov12_0223AB1C
	add r7, r0, #0
	ldr r1, [sp, #0x7c]
	add r0, r6, #0
	bl ov12_0223AB1C
	cmp r7, r0
	beq _022535B0
	ldr r0, _0225380C ; =0x00002DB0
	ldr r1, [r4, r0]
	mov r0, #1
	lsl r0, r0, #0x18
	tst r0, r1
	bne _022535B0
	ldr r0, _02253808 ; =0x00002D8C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022535B0
	ldr r0, _02253810 ; =0x00002D5A
	ldrsb r0, [r4, r0]
	lsl r2, r0, #1
	ldr r0, _02253814 ; =ov12_0226CB88
	add r1, r0, r2
	ldr r0, _02253818 ; =0x00002D44
	ldrb r1, [r1, #1]
	ldrh r3, [r4, r0]
	ldr r0, _02253814 ; =ov12_0226CB88
	ldrb r0, [r0, r2]
	mul r0, r3
	bl _s32_div_f
	ldr r1, [sp, #0x78]
	add r0, r1, r0
	str r0, [sp, #0x78]
	ldr r0, _0225381C ; =0x00002D5D
	ldrsb r0, [r4, r0]
	lsl r2, r0, #1
	ldr r0, _02253814 ; =ov12_0226CB88
	add r1, r0, r2
	ldr r0, _02253820 ; =0x00002D4A
	ldrb r1, [r1, #1]
	ldrh r3, [r4, r0]
	ldr r0, _02253814 ; =ov12_0226CB88
	ldrb r0, [r0, r2]
	mul r0, r3
	bl _s32_div_f
	ldr r1, [sp, #0x74]
	add r0, r1, r0
	str r0, [sp, #0x74]
_022535B0:
	ldr r0, [sp, #0x7c]
	add r4, #0xc0
	add r1, r0, #1
	ldr r0, [sp, #0x80]
	str r1, [sp, #0x7c]
	cmp r1, r0
	blt _02253546
_022535BE:
	ldr r1, [sp, #0x9c]
	ldr r0, [sp, #0x98]
	ldr r1, [r1, r0]
	mov r0, #8
	add r2, r1, #0
	orr r2, r0
	ldr r1, [sp, #0x9c]
	ldr r0, [sp, #0x98]
	str r2, [r1, r0]
	ldr r1, [sp, #0x78]
	ldr r0, [sp, #0x74]
	add r0, r1, r0
	beq _02253604
	ldr r0, [sp, #0x74]
	cmp r1, r0
	blt _022535E2
	mov r1, #0x12
	b _022535E4
_022535E2:
	mov r1, #0xf
_022535E4:
	add r0, r5, #0
	add r0, #0x8c
	str r1, [r0]
	add r0, r5, #0
	mov r1, #3
	add r0, #0x88
	str r1, [r0]
	add r1, r5, #0
	ldr r0, [sp, #0x18]
	add r1, #0x94
	str r0, [r1]
	mov r0, #0xc
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _02253612
_02253604:
	ldr r0, [sp, #0x30]
	add r1, r0, #1
	ldr r0, [sp, #0x80]
	str r1, [sp, #0x30]
	cmp r1, r0
	bge _02253612
	b _02253504
_02253612:
	ldr r1, [sp, #0x30]
	ldr r0, [sp, #0x80]
	cmp r1, r0
	beq _0225361C
	b _02253D80
_0225361C:
	ldr r0, [r5, #0x58]
	add r0, r0, #1
	str r0, [r5, #0x58]
	b _02253D80
_02253624:
	mov r0, #0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x80]
	cmp r0, #0
	bgt _02253630
	b _02253752
_02253630:
	ldr r0, _02253824 ; =0x00002D68
	add r7, r5, r0
_02253634:
	ldr r0, [sp, #0x34]
	add r1, r5, r0
	ldr r0, _02253804 ; =0x000021EC
	ldrb r1, [r1, r0]
	mov r0, #0xc0
	add r4, r1, #0
	mul r4, r0
	ldr r0, [r7, r4]
	str r1, [sp, #0x1c]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	bne _02253744
	ldr r0, _02253808 ; =0x00002D8C
	add r1, r5, r4
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02253744
	ldr r1, [sp, #0x1c]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x6b
	bne _02253744
	ldr r1, [r7, r4]
	mov r0, #0x10
	orr r0, r1
	str r0, [r7, r4]
	mov r0, #0
	str r0, [sp, #0x70]
	ldr r0, [sp, #0x80]
	cmp r0, #0
	ble _02253730
	add r0, r5, r4
	str r5, [sp, #0x50]
	str r0, [sp, #0x4c]
_0225367A:
	ldr r1, [sp, #0x1c]
	add r0, r6, #0
	bl ov12_0223AB1C
	add r4, r0, #0
	ldr r1, [sp, #0x70]
	add r0, r6, #0
	bl ov12_0223AB1C
	cmp r4, r0
	beq _0225371E
	ldr r1, [sp, #0x50]
	ldr r0, _02253808 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225371E
	mov r0, #0
	str r0, [sp, #0x6c]
	add r7, r1, #0
_022536A0:
	ldr r0, _02253828 ; =0x00002D4C
	ldrh r4, [r7, r0]
	cmp r4, #0
	beq _0225370C
	mov r0, #0
	str r0, [sp, #0xc8]
	ldr r0, [sp, #0x70]
	add r1, r5, #0
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	add r2, r4, #0
	str r0, [sp, #4]
	ldr r0, _0225382C ; =0x00002144
	mov r3, #0
	ldr r0, [r5, r0]
	str r0, [sp, #8]
	add r0, sp, #0xc8
	str r0, [sp, #0xc]
	add r0, r6, #0
	bl ov12_02251D28
	ldr r1, _0225382C ; =0x00002144
	str r0, [r5, r1]
	ldr r1, [sp, #0xc8]
	mov r0, #8
	tst r0, r1
	bne _0225370C
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0225865C
	cmp r0, #0
	bne _0225370C
	ldr r1, [sp, #0xc8]
	mov r0, #2
	tst r0, r1
	bne _02253706
	lsl r0, r4, #4
	add r1, r5, r0
	ldr r0, _02253830 ; =0x000003DE
	ldrh r0, [r1, r0]
	cmp r0, #0x26
	bne _0225370C
	ldr r1, [sp, #0x4c]
	ldr r0, _02253834 ; =0x00002D74
	ldr r2, [sp, #0x50]
	ldrb r0, [r1, r0]
	ldr r1, _02253834 ; =0x00002D74
	ldrb r1, [r2, r1]
	cmp r0, r1
	bhi _0225370C
_02253706:
	mov r0, #1
	str r0, [sp, #0x84]
	b _02253718
_0225370C:
	ldr r0, [sp, #0x6c]
	add r7, r7, #2
	add r0, r0, #1
	str r0, [sp, #0x6c]
	cmp r0, #4
	blt _022536A0
_02253718:
	ldr r0, [sp, #0x84]
	cmp r0, #1
	beq _02253730
_0225371E:
	ldr r0, [sp, #0x50]
	add r0, #0xc0
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x70]
	add r1, r0, #1
	ldr r0, [sp, #0x80]
	str r1, [sp, #0x70]
	cmp r1, r0
	blt _0225367A
_02253730:
	ldr r0, [sp, #0x84]
	cmp r0, #1
	bne _02253752
	mov r1, #0x46
	ldr r0, [sp, #0x1c]
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xc2
	str r0, [sp, #0xcc]
	b _02253752
_02253744:
	ldr r0, [sp, #0x34]
	add r1, r0, #1
	ldr r0, [sp, #0x80]
	str r1, [sp, #0x34]
	cmp r1, r0
	bge _02253752
	b _02253634
_02253752:
	ldr r1, [sp, #0x34]
	ldr r0, [sp, #0x80]
	cmp r1, r0
	beq _0225375C
	b _02253D80
_0225375C:
	ldr r0, [r5, #0x58]
	add r0, r0, #1
	str r0, [r5, #0x58]
	b _02253D80
_02253764:
	mov r0, #0
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x80]
	cmp r0, #0
	bgt _02253770
	b _02253962
_02253770:
	ldr r0, _02253824 ; =0x00002D68
	add r7, r5, r0
_02253774:
	ldr r0, [sp, #0x38]
	add r1, r5, r0
	ldr r0, _02253804 ; =0x000021EC
	ldrb r1, [r1, r0]
	mov r0, #0xc0
	add r4, r1, #0
	mul r4, r0
	ldr r0, [r7, r4]
	str r1, [sp, #0x20]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	bne _022537A2
	ldr r0, _02253808 ; =0x00002D8C
	add r1, r5, r4
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022537A2
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x6c
	beq _022537A4
_022537A2:
	b _02253954
_022537A4:
	ldr r1, [r7, r4]
	mov r0, #0x20
	orr r0, r1
	str r0, [r7, r4]
	mov r4, #0
	ldr r0, [sp, #0x80]
	str r4, [sp, #0x5c]
	str r4, [sp, #0x68]
	cmp r0, #0
	bgt _022537BA
	b _022538EE
_022537BA:
	str r5, [sp, #0x58]
_022537BC:
	ldr r1, [sp, #0x20]
	add r0, r6, #0
	bl ov12_0223AB1C
	add r7, r0, #0
	ldr r1, [sp, #0x68]
	add r0, r6, #0
	bl ov12_0223AB1C
	cmp r7, r0
	bne _022537D4
	b _022538DA
_022537D4:
	ldr r1, [sp, #0x58]
	ldr r0, _02253808 ; =0x00002D8C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _022538DA
	ldr r0, [sp, #0x5c]
	add r0, r0, r1
	str r0, [sp, #0x5c]
	mov r0, #0
	str r0, [sp, #0x64]
	ldr r0, [sp, #0x58]
	str r0, [sp, #0x54]
_022537EC:
	ldr r1, [sp, #0x54]
	ldr r0, _02253828 ; =0x00002D4C
	ldrh r7, [r1, r0]
	ldr r1, _02253838 ; =0x000003E1
	lsl r0, r7, #4
	add r0, r5, r0
	ldrb r1, [r0, r1]
	str r1, [sp, #0x60]
	cmp r1, #1
	bne _022538AC
	ldr r1, _02253830 ; =0x000003DE
	b _0225383C
	.balign 4, 0
_02253804: .word 0x000021EC
_02253808: .word 0x00002D8C
_0225380C: .word 0x00002DB0
_02253810: .word 0x00002D5A
_02253814: .word ov12_0226CB88
_02253818: .word 0x00002D44
_0225381C: .word 0x00002D5D
_02253820: .word 0x00002D4A
_02253824: .word 0x00002D68
_02253828: .word 0x00002D4C
_0225382C: .word 0x00002144
_02253830: .word 0x000003DE
_02253834: .word 0x00002D74
_02253838: .word 0x000003E1
_0225383C:
	ldrh r0, [r0, r1]
	cmp r0, #0x59
	bgt _0225384A
	bge _02253874
	cmp r0, #0x26
	beq _02253858
	b _02253890
_0225384A:
	cmp r0, #0x90
	bgt _02253852
	beq _02253874
	b _02253890
_02253852:
	cmp r0, #0xe3
	beq _02253874
	b _02253890
_02253858:
	cmp r4, #0x96
	blo _0225386A
	bne _022538CA
	add r0, r6, #0
	bl ov12_0223BD98
	mov r1, #1
	tst r0, r1
	beq _022538CA
_0225386A:
	mov r4, #0x96
	add r0, r4, #0
	add r0, #0x8e
	str r7, [r5, r0]
	b _022538CA
_02253874:
	cmp r4, #0x78
	blo _02253886
	bne _022538CA
	add r0, r6, #0
	bl ov12_0223BD98
	mov r1, #1
	tst r0, r1
	beq _022538CA
_02253886:
	mov r4, #0x78
	add r0, r4, #0
	add r0, #0xac
	str r7, [r5, r0]
	b _022538CA
_02253890:
	cmp r4, #0x50
	blo _022538A2
	bne _022538CA
	add r0, r6, #0
	bl ov12_0223BD98
	mov r1, #1
	tst r0, r1
	beq _022538CA
_022538A2:
	mov r4, #0x50
	add r0, r4, #0
	add r0, #0xd4
	str r7, [r5, r0]
	b _022538CA
_022538AC:
	add r0, r1, #0
	cmp r4, r0
	blo _022538C2
	cmp r4, r0
	bne _022538CA
	add r0, r6, #0
	bl ov12_0223BD98
	mov r1, #1
	tst r0, r1
	beq _022538CA
_022538C2:
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r4, [sp, #0x60]
	str r7, [r5, r0]
_022538CA:
	ldr r0, [sp, #0x54]
	add r0, r0, #2
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x64]
	add r0, r0, #1
	str r0, [sp, #0x64]
	cmp r0, #4
	blt _022537EC
_022538DA:
	ldr r0, [sp, #0x58]
	add r0, #0xc0
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x68]
	add r1, r0, #1
	ldr r0, [sp, #0x80]
	str r1, [sp, #0x68]
	cmp r1, r0
	bge _022538EE
	b _022537BC
_022538EE:
	cmp r4, #0
	beq _02253904
	mov r1, #0x46
	ldr r0, [sp, #0x20]
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xc3
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _02253962
_02253904:
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	beq _02253962
	ldr r2, [sp, #0x20]
	add r0, r6, #0
	add r1, r5, #0
	bl ov12_02253DA0
	add r7, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl ov12_02252EA8
	add r4, r0, #0
	add r0, r6, #0
	bl ov12_0223BD98
	add r1, r4, #0
	bl _s32_div_f
	mov r0, #0xc0
	add r2, r7, #0
	mul r2, r0
	lsl r3, r1, #1
	add r1, r5, r2
	add r2, r3, r1
	ldr r1, _02253C2C ; =0x00002D4C
	ldrh r2, [r2, r1]
	add r1, r0, #0
	add r1, #0x64
	str r2, [r5, r1]
	ldr r1, [sp, #0x20]
	add r0, #0x58
	str r1, [r5, r0]
	mov r0, #0xc3
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _02253962
_02253954:
	ldr r0, [sp, #0x38]
	add r1, r0, #1
	ldr r0, [sp, #0x80]
	str r1, [sp, #0x38]
	cmp r1, r0
	bge _02253962
	b _02253774
_02253962:
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x80]
	cmp r1, r0
	beq _0225396C
	b _02253D80
_0225396C:
	ldr r0, [r5, #0x58]
	add r0, r0, #1
	str r0, [r5, #0x58]
	b _02253D80
_02253974:
	mov r0, #0
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x80]
	cmp r0, #0
	bgt _02253980
	b _02253ABA
_02253980:
	ldr r0, _02253C30 ; =0x00002D68
	add r0, r5, r0
	str r0, [sp, #0xa0]
_02253986:
	ldr r0, [sp, #0x3c]
	add r1, r5, r0
	ldr r0, _02253C34 ; =0x000021EC
	ldrb r4, [r1, r0]
	mov r0, #0xc0
	add r7, r4, #0
	mul r7, r0
	ldr r0, [sp, #0xa0]
	ldr r0, [r0, r7]
	lsl r0, r0, #0x17
	lsr r0, r0, #0x1f
	bne _02253A9A
	ldr r0, _02253C38 ; =0x00002D8C
	add r1, r5, r7
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02253A9A
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_022527CC
	cmp r0, #0x77
	bne _02253A9A
	ldr r0, [sp, #0xa0]
	ldr r1, [r0, r7]
	mov r0, #1
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, [sp, #0xa0]
	str r1, [r0, r7]
	add r0, r6, #0
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	beq _02253A74
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0
	bl ov12_0223ABB8
	str r0, [sp, #0xc0]
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #2
	bl ov12_0223ABB8
	ldr r2, [sp, #0xc0]
	mov r1, #0xc0
	mul r1, r2
	ldr r2, _02253C38 ; =0x00002D8C
	add r1, r5, r1
	ldr r3, [r1, r2]
	str r0, [sp, #0xc4]
	cmp r3, #0
	beq _02253A38
	add r2, #0x2c
	ldrh r2, [r1, r2]
	cmp r2, #0
	beq _02253A38
	mov r2, #0xc0
	mul r2, r0
	add r0, r5, r2
	ldr r2, _02253C38 ; =0x00002D8C
	ldr r2, [r0, r2]
	cmp r2, #0
	beq _02253A38
	ldr r2, _02253C3C ; =0x00002DB8
	ldrh r0, [r0, r2]
	cmp r0, #0
	beq _02253A38
	add r0, r6, #0
	bl ov12_0223BD98
	lsl r0, r0, #0x1f
	lsr r1, r0, #0x1d
	add r0, sp, #0xc0
	ldr r1, [r0, r1]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02253C3C ; =0x00002DB8
	ldrh r1, [r1, r0]
	mov r0, #0x4a
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #1
	str r0, [sp, #0x84]
	b _02253A9A
_02253A38:
	cmp r3, #0
	beq _02253A50
	ldr r0, _02253C3C ; =0x00002DB8
	ldrh r1, [r1, r0]
	cmp r1, #0
	beq _02253A50
	mov r0, #0x4a
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #1
	str r0, [sp, #0x84]
	b _02253A9A
_02253A50:
	ldr r1, [sp, #0xc4]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _02253C38 ; =0x00002D8C
	add r0, r5, r0
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _02253A9A
	ldr r1, _02253C3C ; =0x00002DB8
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _02253A9A
	mov r0, #0x4a
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #1
	str r0, [sp, #0x84]
	b _02253A9A
_02253A74:
	mov r0, #1
	add r1, r4, #0
	eor r1, r0
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _02253C38 ; =0x00002D8C
	add r0, r5, r0
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _02253A9A
	ldr r1, _02253C3C ; =0x00002DB8
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _02253A9A
	mov r0, #0x4a
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #1
	str r0, [sp, #0x84]
_02253A9A:
	ldr r0, [sp, #0x84]
	cmp r0, #1
	bne _02253AAC
	mov r0, #0x46
	lsl r0, r0, #2
	str r4, [r5, r0]
	mov r0, #0xfd
	str r0, [sp, #0xcc]
	b _02253ABA
_02253AAC:
	ldr r0, [sp, #0x3c]
	add r1, r0, #1
	ldr r0, [sp, #0x80]
	str r1, [sp, #0x3c]
	cmp r1, r0
	bge _02253ABA
	b _02253986
_02253ABA:
	ldr r1, [sp, #0x3c]
	ldr r0, [sp, #0x80]
	cmp r1, r0
	beq _02253AC4
	b _02253D80
_02253AC4:
	ldr r0, [r5, #0x58]
	add r0, r0, #1
	str r0, [r5, #0x58]
	b _02253D80
_02253ACC:
	mov r0, #0
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x80]
	cmp r0, #0
	ble _02253B94
	ldr r0, _02253C30 ; =0x00002D68
	add r0, r5, r0
	str r0, [sp, #0xa4]
_02253ADC:
	ldr r0, [sp, #0x40]
	add r1, r5, r0
	ldr r0, _02253C34 ; =0x000021EC
	ldrb r7, [r1, r0]
	mov r0, #0xc0
	add r4, r7, #0
	mul r4, r0
	ldr r0, [sp, #0xa4]
	ldr r0, [r0, r4]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	bne _02253B38
	ldr r0, _02253C38 ; =0x00002D8C
	add r1, r5, r4
	ldr r0, [r1, r0]
	str r1, [sp, #0x48]
	cmp r0, #0
	beq _02253B38
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_022527CC
	cmp r0, #0x70
	bne _02253B38
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r2, [r5, r0]
	ldr r1, [sp, #0x48]
	ldr r0, _02253C40 ; =0x00002DD8
	ldr r0, [r1, r0]
	cmp r2, r0
	bgt _02253B38
	ldr r0, [sp, #0xa4]
	mov r2, #0x40
	ldr r0, [r0, r4]
	add r1, r0, #0
	orr r1, r2
	ldr r0, [sp, #0xa4]
	add r2, #0xd8
	str r1, [r0, r4]
	str r7, [r5, r2]
	mov r0, #0xc4
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _02253B94
_02253B38:
	ldr r0, [sp, #0xa4]
	ldr r0, [r0, r4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _02253B88
	ldr r0, _02253C38 ; =0x00002D8C
	add r1, r5, r4
	ldr r0, [r1, r0]
	str r1, [sp, #0x44]
	cmp r0, #0
	beq _02253B88
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_022527CC
	cmp r0, #0x70
	bne _02253B88
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r2, [r5, r0]
	ldr r1, [sp, #0x44]
	ldr r0, _02253C40 ; =0x00002DD8
	ldr r0, [r1, r0]
	sub r0, r2, r0
	cmp r0, #5
	bne _02253B88
	ldr r0, [sp, #0xa4]
	mov r2, #0x80
	ldr r0, [r0, r4]
	add r1, r0, #0
	orr r1, r2
	ldr r0, [sp, #0xa4]
	add r2, #0x98
	str r1, [r0, r4]
	str r7, [r5, r2]
	mov r0, #0xc5
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _02253B94
_02253B88:
	ldr r0, [sp, #0x40]
	add r1, r0, #1
	ldr r0, [sp, #0x80]
	str r1, [sp, #0x40]
	cmp r1, r0
	blt _02253ADC
_02253B94:
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0x80]
	cmp r1, r0
	bne _02253C0E
	ldr r0, [r5, #0x58]
	add r0, r0, #1
	str r0, [r5, #0x58]
	b _02253D80
_02253BA4:
	ldr r0, [sp, #0x80]
	mov r4, #0
	cmp r0, #0
	ble _02253C08
	ldr r0, _02253C30 ; =0x00002D68
	add r0, r5, r0
	str r0, [sp, #0xa8]
_02253BB2:
	ldr r0, _02253C34 ; =0x000021EC
	add r1, r5, r4
	ldrb r1, [r1, r0]
	mov r0, #0xc0
	add r7, r1, #0
	mul r7, r0
	ldr r0, [sp, #0xa8]
	str r1, [sp, #0x24]
	ldr r0, [r0, r7]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1f
	bne _02253C00
	ldr r0, _02253C38 ; =0x00002D8C
	add r1, r5, r7
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02253C00
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x68
	bne _02253C00
	ldr r0, [sp, #0xa8]
	mov r2, #2
	ldr r0, [r0, r7]
	lsl r2, r2, #8
	add r1, r0, #0
	orr r1, r2
	ldr r0, [sp, #0xa8]
	sub r2, #0xe8
	str r1, [r0, r7]
	ldr r0, [sp, #0x24]
	str r0, [r5, r2]
	mov r0, #0xb1
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _02253C08
_02253C00:
	ldr r0, [sp, #0x80]
	add r4, r4, #1
	cmp r4, r0
	blt _02253BB2
_02253C08:
	ldr r0, [sp, #0x80]
	cmp r4, r0
	beq _02253C10
_02253C0E:
	b _02253D80
_02253C10:
	ldr r0, [r5, #0x58]
	add r0, r0, #1
	str r0, [r5, #0x58]
	b _02253D80
_02253C18:
	ldr r0, [sp, #0x80]
	mov r4, #0
	cmp r0, #0
	ble _02253C98
	ldr r0, _02253C30 ; =0x00002D68
	add r0, r5, r0
	str r0, [sp, #0xac]
_02253C26:
	ldr r0, _02253C34 ; =0x000021EC
	b _02253C44
	nop
_02253C2C: .word 0x00002D4C
_02253C30: .word 0x00002D68
_02253C34: .word 0x000021EC
_02253C38: .word 0x00002D8C
_02253C3C: .word 0x00002DB8
_02253C40: .word 0x00002DD8
_02253C44:
	add r1, r5, r4
	ldrb r1, [r1, r0]
	mov r0, #0xc0
	add r7, r1, #0
	mul r7, r0
	ldr r0, [sp, #0xac]
	str r1, [sp, #0x28]
	ldr r0, [r0, r7]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x1f
	bne _02253C90
	ldr r0, _02253D90 ; =0x00002D8C
	add r1, r5, r7
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02253C90
	ldr r1, [sp, #0x28]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x2e
	bne _02253C90
	ldr r0, [sp, #0xac]
	ldr r1, [r0, r7]
	mov r0, #1
	lsl r0, r0, #0xa
	orr r1, r0
	ldr r0, [sp, #0xac]
	str r1, [r0, r7]
	mov r1, #0x46
	ldr r0, [sp, #0x28]
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #5
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _02253C98
_02253C90:
	ldr r0, [sp, #0x80]
	add r4, r4, #1
	cmp r4, r0
	blt _02253C26
_02253C98:
	ldr r0, [sp, #0x80]
	cmp r4, r0
	bne _02253D80
	ldr r0, [r5, #0x58]
	add r0, r0, #1
	str r0, [r5, #0x58]
	b _02253D80
_02253CA6:
	add r0, r6, #0
	add r1, r5, #0
	add r2, sp, #0xcc
	bl ov12_02256914
	cmp r0, #1
	bne _02253CBA
	mov r0, #1
	str r0, [sp, #0x84]
	b _02253D80
_02253CBA:
	ldr r0, [r5, #0x58]
	add r0, r0, #1
	str r0, [r5, #0x58]
	b _02253D80
_02253CC2:
	ldr r0, [sp, #0x80]
	mov r4, #0
	cmp r0, #0
	ble _02253CF4
	mov r7, #2
_02253CCC:
	ldr r1, _02253D94 ; =0x000021EC
	add r2, r5, r4
	ldrb r2, [r2, r1]
	mov r1, #0xc0
	add r0, r5, #0
	mul r1, r2
	add r2, r5, r1
	ldr r1, _02253D98 ; =0x00002DB8
	ldrh r1, [r2, r1]
	mov r2, #1
	bl ov12_02257E74
	cmp r0, #0x3a
	bne _02253CEC
	ldr r0, _02253D9C ; =0x00002168
	str r7, [r5, r0]
_02253CEC:
	ldr r0, [sp, #0x80]
	add r4, r4, #1
	cmp r4, r0
	blt _02253CCC
_02253CF4:
	ldr r0, [r5, #0x58]
	add r0, r0, #1
	str r0, [r5, #0x58]
	b _02253D80
_02253CFC:
	ldr r0, [sp, #0x80]
	mov r4, #0
	cmp r0, #0
	ble _02253D2A
	ldr r7, _02253D94 ; =0x000021EC
_02253D06:
	add r2, r5, r4
	ldrb r2, [r2, r7]
	add r0, r6, #0
	add r1, r5, #0
	mov r3, #1
	bl ov12_022543A0
	cmp r0, #1
	bne _02253D22
	mov r0, #0xdd
	str r0, [sp, #0xcc]
	mov r0, #1
	str r0, [sp, #0x84]
	b _02253D2A
_02253D22:
	ldr r0, [sp, #0x80]
	add r4, r4, #1
	cmp r4, r0
	blt _02253D06
_02253D2A:
	ldr r0, [sp, #0x80]
	cmp r4, r0
	bne _02253D80
	ldr r0, [r5, #0x58]
	add r0, r0, #1
	str r0, [r5, #0x58]
	b _02253D80
_02253D38:
	ldr r0, [sp, #0x80]
	mov r4, #0
	cmp r0, #0
	ble _02253D6A
_02253D40:
	ldr r0, _02253D94 ; =0x000021EC
	add r1, r5, r4
	ldrb r7, [r1, r0]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	add r3, sp, #0xcc
	bl ov12_02254E7C
	cmp r0, #1
	bne _02253D62
	mov r0, #0x46
	lsl r0, r0, #2
	str r7, [r5, r0]
	mov r0, #1
	str r0, [sp, #0x84]
	b _02253D6A
_02253D62:
	ldr r0, [sp, #0x80]
	add r4, r4, #1
	cmp r4, r0
	blt _02253D40
_02253D6A:
	ldr r0, [sp, #0x80]
	cmp r4, r0
	bne _02253D80
	ldr r0, [r5, #0x58]
	add r0, r0, #1
	str r0, [r5, #0x58]
	b _02253D80
_02253D78:
	mov r0, #0
	str r0, [r5, #0x58]
	mov r0, #2
	str r0, [sp, #0x84]
_02253D80:
	ldr r0, [sp, #0x84]
	cmp r0, #0
	bne _02253D8A
	bl ov12_022531A8
_02253D8A:
	ldr r0, [sp, #0xcc]
	add sp, #0xd0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02253D90: .word 0x00002D8C
_02253D94: .word 0x000021EC
_02253D98: .word 0x00002DB8
_02253D9C: .word 0x00002168
	thumb_func_end ov12_022531A8

	thumb_func_start ov12_02253DA0
ov12_02253DA0: ; 0x02253DA0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	beq _02253DF8
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov12_0223ABB8
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #2
	bl ov12_0223ABB8
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov12_0223BD98
	mov r3, #1
	add r2, r0, #0
	and r2, r3
	lsl r0, r2, #2
	add r1, sp, #0
	ldr r0, [r1, r0]
	mov r4, #0xc0
	mul r4, r0
	add r5, r6, r4
	ldr r4, _02253E00 ; =0x00002D8C
	ldr r4, [r5, r4]
	cmp r4, #0
	bne _02253DFC
	add r0, r2, #0
	eor r0, r3
	lsl r0, r0, #2
	add sp, #8
	ldr r0, [r1, r0]
	pop {r4, r5, r6, pc}
_02253DF8:
	mov r0, #1
	eor r0, r4
_02253DFC:
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02253E00: .word 0x00002D8C
	thumb_func_end ov12_02253DA0

	thumb_func_start ov12_02253E04
ov12_02253E04: ; 0x02253E04
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r1, [r5, #0x6c]
	add r7, r0, #0
	add r4, r2, #0
	mov r6, #0
	cmp r1, #0xff
	bne _02253E18
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02253E18:
	add r0, r5, #0
	bl ov12_02256838
	cmp r0, #1
	bne _02253E26
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02253E26:
	ldr r1, [r5, #0x6c]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x26
	bgt _02253E56
	blt _02253E36
	b _022540FE
_02253E36:
	cmp r0, #0x10
	bgt _02253E42
	bge _02253F04
	cmp r0, #9
	beq _02253E6E
	b _02254382
_02253E42:
	cmp r0, #0x1b
	bgt _02253E54
	cmp r0, #0x18
	blt _02253E54
	bne _02253E4E
	b _02253FAE
_02253E4E:
	cmp r0, #0x1b
	bne _02253E54
	b _02254042
_02253E54:
	b _02254382
_02253E56:
	cmp r0, #0x38
	bgt _02253E66
	blt _02253E5E
	b _02254258
_02253E5E:
	cmp r0, #0x31
	bne _02253E64
	b _022541C2
_02253E64:
	b _02254382
_02253E66:
	cmp r0, #0x6a
	bne _02253E6C
	b _02254302
_02253E6C:
	b _02254382
_02253E6E:
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r3, _02254120 ; =0x00002D8C
	add r0, r5, r0
	ldr r1, [r0, r3]
	cmp r1, #0
	beq _02253F50
	add r1, r3, #0
	add r1, #0x20
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _02253F50
	ldr r1, _02254124 ; =0x0000216C
	ldr r0, _02254128 ; =0x801FDA49
	ldr r2, [r5, r1]
	tst r0, r2
	bne _02253F50
	add r0, r1, #0
	sub r0, #0x30
	ldr r2, [r5, r0]
	mov r0, #0x20
	tst r0, r2
	bne _02253F50
	sub r1, #0x2c
	ldr r1, [r5, r1]
	mov r0, #0x10
	tst r0, r1
	bne _02253F50
	ldr r1, [r5, #0x6c]
	mov r0, #0x1c
	mul r0, r1
	add r0, r5, r0
	lsr r1, r3, #4
	ldr r1, [r0, r1]
	cmp r1, #0
	bne _02253EC2
	mov r1, #0x2e
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02253F50
_02253EC2:
	ldr r0, _0225412C ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _02254130 ; =0x000003E9
	ldrb r1, [r1, r0]
	mov r0, #1
	tst r0, r1
	beq _02253F50
	add r0, r7, #0
	bl ov12_0223BD98
	mov r1, #0xa
	bl _s32_div_f
	cmp r1, #3
	bge _02253F50
	add r0, r5, #0
	mov r1, #3
	add r0, #0x88
	str r1, [r0]
	add r0, r5, #0
	ldr r1, [r5, #0x64]
	add r0, #0x94
	str r1, [r0]
	mov r0, #0x46
	ldr r1, [r5, #0x6c]
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0x1f
	str r0, [r4]
	mov r6, #1
	b _02254382
_02253F04:
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x60
	bne _02253F14
	add r7, r6, #0
	b _02253F2E
_02253F14:
	ldr r0, _02254134 ; =0x00002160
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02253F22
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	b _02253F2E
_02253F22:
	ldr r0, _0225412C ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _02254138 ; =0x000003E2
	ldrb r7, [r1, r0]
_02253F2E:
	ldr r1, [r5, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r2, r5, r0
	ldr r0, _02254120 ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _02253F50
	ldr r0, _02254124 ; =0x0000216C
	ldr r2, [r5, r0]
	ldr r0, _02254128 ; =0x801FDA49
	tst r0, r2
	bne _02253F50
	ldr r0, _0225412C ; =0x00003044
	ldr r3, [r5, r0]
	cmp r3, #0xa5
	bne _02253F52
_02253F50:
	b _02254382
_02253F52:
	mov r0, #0x1c
	ldr r2, _02254120 ; =0x00002D8C
	mul r0, r1
	add r0, r5, r0
	lsr r2, r2, #4
	ldr r2, [r0, r2]
	cmp r2, #0
	bne _02253F6C
	mov r2, #0x2e
	lsl r2, r2, #4
	ldr r0, [r0, r2]
	cmp r0, #0
	beq _0225405C
_02253F6C:
	mov r0, #0x85
	lsl r0, r0, #6
	ldr r2, [r5, r0]
	mov r0, #0x10
	tst r0, r2
	bne _0225405C
	lsl r0, r3, #4
	add r2, r5, r0
	ldr r0, _0225413C ; =0x000003E1
	ldrb r0, [r2, r0]
	cmp r0, #0
	beq _0225405C
	add r0, r5, #0
	mov r2, #0x1b
	mov r3, #0
	bl ov12_0224EDE0
	cmp r7, r0
	beq _0225405C
	ldr r1, [r5, #0x6c]
	add r0, r5, #0
	mov r2, #0x1c
	mov r3, #0
	bl ov12_0224EDE0
	cmp r7, r0
	beq _0225405C
	mov r0, #0xbc
	str r0, [r4]
	add r0, #0x74
	str r7, [r5, r0]
	mov r6, #1
	b _02254382
_02253FAE:
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r2, r5, r0
	ldr r0, _02254120 ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0225405C
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x62
	beq _0225405C
	ldr r1, _02254124 ; =0x0000216C
	ldr r0, _02254128 ; =0x801FDA49
	ldr r2, [r5, r1]
	tst r0, r2
	bne _0225405C
	add r0, r1, #0
	sub r0, #0x30
	ldr r2, [r5, r0]
	mov r0, #0x20
	tst r0, r2
	bne _0225405C
	sub r1, #0x2c
	ldr r1, [r5, r1]
	mov r0, #0x10
	tst r0, r1
	bne _0225405C
	ldr r1, [r5, #0x6c]
	mov r0, #0x1c
	mul r0, r1
	add r2, r5, r0
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _02254002
	add r0, #8
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0225405C
_02254002:
	ldr r0, _0225412C ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _02254130 ; =0x000003E9
	ldrb r1, [r1, r0]
	mov r0, #1
	tst r0, r1
	beq _0225405C
	ldr r0, [r5, #0x64]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	ldr r0, _02254140 ; =0x00002D90
	add r2, r5, r2
	ldr r2, [r2, r0]
	sub r1, #0xc1
	add r0, r2, #0
	mul r0, r1
	mov r1, #8
	bl ov12_02253178
	ldr r1, _02254144 ; =0x0000215C
	mov r6, #1
	str r0, [r5, r1]
	mov r0, #0x46
	ldr r1, [r5, #0x64]
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0xbd
	str r0, [r4]
	b _02254382
_02254042:
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r3, _02254120 ; =0x00002D8C
	add r0, r5, r0
	ldr r1, [r0, r3]
	cmp r1, #0
	beq _0225405C
	add r1, r3, #0
	add r1, #0x20
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _0225405E
_0225405C:
	b _02254382
_0225405E:
	ldr r1, _02254124 ; =0x0000216C
	ldr r0, _02254128 ; =0x801FDA49
	ldr r2, [r5, r1]
	tst r0, r2
	bne _02254164
	add r0, r1, #0
	sub r0, #0x30
	ldr r2, [r5, r0]
	mov r0, #0x20
	tst r0, r2
	bne _02254164
	sub r1, #0x2c
	ldr r1, [r5, r1]
	mov r0, #0x10
	tst r0, r1
	bne _02254164
	ldr r1, [r5, #0x6c]
	mov r0, #0x1c
	mul r0, r1
	add r0, r5, r0
	lsr r1, r3, #4
	ldr r1, [r0, r1]
	cmp r1, #0
	bne _02254098
	mov r1, #0x2e
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02254164
_02254098:
	ldr r0, _0225412C ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _02254130 ; =0x000003E9
	ldrb r1, [r1, r0]
	mov r0, #1
	tst r0, r1
	beq _02254164
	add r0, r7, #0
	bl ov12_0223BD98
	mov r1, #0xa
	bl _s32_div_f
	cmp r1, #3
	bge _02254164
	add r0, r7, #0
	bl ov12_0223BD98
	mov r1, #3
	bl _s32_div_f
	cmp r1, #0
	beq _022540D2
	cmp r1, #1
	beq _022540D8
	cmp r1, #2
	beq _022540DE
_022540D2:
	mov r0, #0x16
	str r0, [r4]
	b _022540E2
_022540D8:
	mov r0, #0x1f
	str r0, [r4]
	b _022540E2
_022540DE:
	mov r0, #0x12
	str r0, [r4]
_022540E2:
	add r0, r5, #0
	mov r1, #3
	add r0, #0x88
	str r1, [r0]
	add r0, r5, #0
	ldr r1, [r5, #0x64]
	add r0, #0x94
	str r1, [r0]
	mov r0, #0x46
	ldr r1, [r5, #0x6c]
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r6, #1
	b _02254382
_022540FE:
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r3, _02254120 ; =0x00002D8C
	add r0, r5, r0
	ldr r1, [r0, r3]
	cmp r1, #0
	beq _02254164
	add r1, r3, #0
	add r1, #0x20
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _02254164
	ldr r1, _02254124 ; =0x0000216C
	ldr r0, _02254128 ; =0x801FDA49
	b _02254148
	nop
_02254120: .word 0x00002D8C
_02254124: .word 0x0000216C
_02254128: .word 0x801FDA49
_0225412C: .word 0x00003044
_02254130: .word 0x000003E9
_02254134: .word 0x00002160
_02254138: .word 0x000003E2
_0225413C: .word 0x000003E1
_02254140: .word 0x00002D90
_02254144: .word 0x0000215C
_02254148:
	ldr r2, [r5, r1]
	tst r0, r2
	bne _02254164
	add r0, r1, #0
	sub r0, #0x30
	ldr r2, [r5, r0]
	mov r0, #0x20
	tst r0, r2
	bne _02254164
	sub r1, #0x2c
	ldr r1, [r5, r1]
	mov r0, #0x10
	tst r0, r1
	beq _02254166
_02254164:
	b _02254382
_02254166:
	ldr r1, [r5, #0x6c]
	mov r0, #0x1c
	mul r0, r1
	add r0, r5, r0
	lsr r1, r3, #4
	ldr r1, [r0, r1]
	cmp r1, #0
	bne _02254180
	mov r1, #0x2e
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02254276
_02254180:
	ldr r0, _02254388 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0225438C ; =0x000003E9
	ldrb r1, [r1, r0]
	mov r0, #1
	tst r0, r1
	beq _02254276
	add r0, r7, #0
	bl ov12_0223BD98
	mov r1, #0xa
	bl _s32_div_f
	cmp r1, #3
	bge _02254276
	add r0, r5, #0
	mov r1, #3
	add r0, #0x88
	str r1, [r0]
	add r0, r5, #0
	ldr r1, [r5, #0x64]
	add r0, #0x94
	str r1, [r0]
	mov r0, #0x46
	ldr r1, [r5, #0x6c]
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0x16
	str r0, [r4]
	mov r6, #1
	b _02254382
_022541C2:
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r3, _02254390 ; =0x00002D8C
	add r0, r5, r0
	ldr r1, [r0, r3]
	cmp r1, #0
	beq _02254276
	add r1, r3, #0
	add r1, #0x20
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _02254276
	ldr r1, _02254394 ; =0x0000216C
	ldr r0, _02254398 ; =0x801FDA49
	ldr r2, [r5, r1]
	tst r0, r2
	bne _02254276
	add r0, r1, #0
	sub r0, #0x30
	ldr r2, [r5, r0]
	mov r0, #0x20
	tst r0, r2
	bne _02254276
	sub r1, #0x2c
	ldr r1, [r5, r1]
	mov r0, #0x10
	tst r0, r1
	bne _02254276
	ldr r1, [r5, #0x6c]
	mov r0, #0x1c
	mul r0, r1
	add r0, r5, r0
	lsr r1, r3, #4
	ldr r1, [r0, r1]
	cmp r1, #0
	bne _02254216
	mov r1, #0x2e
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02254276
_02254216:
	ldr r0, _02254388 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0225438C ; =0x000003E9
	ldrb r1, [r1, r0]
	mov r0, #1
	tst r0, r1
	beq _02254276
	add r0, r7, #0
	bl ov12_0223BD98
	mov r1, #0xa
	bl _s32_div_f
	cmp r1, #3
	bge _02254276
	add r0, r5, #0
	mov r1, #3
	add r0, #0x88
	str r1, [r0]
	add r0, r5, #0
	ldr r1, [r5, #0x64]
	add r0, #0x94
	str r1, [r0]
	mov r0, #0x46
	ldr r1, [r5, #0x6c]
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0x19
	str r0, [r4]
	mov r6, #1
	b _02254382
_02254258:
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r3, _02254390 ; =0x00002D8C
	add r0, r5, r0
	ldr r1, [r0, r3]
	cmp r1, #0
	beq _02254276
	add r1, r3, #0
	add r1, #0x24
	ldr r1, [r0, r1]
	mov r0, #0xf
	lsl r0, r0, #0x10
	tst r0, r1
	beq _02254278
_02254276:
	b _02254382
_02254278:
	ldr r1, _02254394 ; =0x0000216C
	ldr r0, _02254398 ; =0x801FDA49
	ldr r2, [r5, r1]
	tst r0, r2
	bne _02254382
	add r0, r1, #0
	sub r0, #0x30
	ldr r2, [r5, r0]
	mov r0, #0x20
	tst r0, r2
	bne _02254382
	sub r1, #0x2c
	ldr r1, [r5, r1]
	mov r0, #0x10
	tst r0, r1
	bne _02254382
	ldr r1, [r5, #0x6c]
	mov r0, #0x1c
	mul r0, r1
	add r0, r5, r0
	lsr r2, r3, #4
	ldr r2, [r0, r2]
	cmp r2, #0
	bne _022542B2
	mov r2, #0x2e
	lsl r2, r2, #4
	ldr r0, [r0, r2]
	cmp r0, #0
	beq _02254382
_022542B2:
	ldr r0, _02254388 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r2, r5, r0
	ldr r0, _0225438C ; =0x000003E9
	ldrb r2, [r2, r0]
	mov r0, #1
	tst r0, r2
	beq _02254382
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02254390 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02254382
	add r0, r7, #0
	bl ov12_0223BD98
	mov r1, #0xa
	bl _s32_div_f
	cmp r1, #3
	bge _02254382
	add r0, r5, #0
	mov r1, #3
	add r0, #0x88
	str r1, [r0]
	add r0, r5, #0
	ldr r1, [r5, #0x64]
	add r0, #0x94
	str r1, [r0]
	mov r0, #0x46
	ldr r1, [r5, #0x6c]
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0x6a
	str r0, [r4]
	mov r6, #1
	b _02254382
_02254302:
	ldr r1, [r5, #0x6c]
	ldr r0, [r5, #0x74]
	cmp r1, r0
	bne _02254382
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x62
	beq _02254382
	mov r0, #6
	str r0, [sp]
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #8
	add r3, r6, #0
	bl ov12_02252324
	cmp r0, #0
	bne _02254382
	mov r2, #0x85
	lsl r2, r2, #6
	ldr r1, [r5, r2]
	mov r0, #0x10
	tst r0, r1
	bne _02254382
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02254390 ; =0x00002D8C
	ldr r3, [r1, r0]
	cmp r3, #0
	beq _02254382
	add r2, #0x2c
	ldr r3, [r5, r2]
	ldr r2, _02254398 ; =0x801FDA49
	tst r2, r3
	bne _02254382
	ldr r2, _02254388 ; =0x00003044
	ldr r2, [r5, r2]
	lsl r2, r2, #4
	add r3, r5, r2
	ldr r2, _0225438C ; =0x000003E9
	ldrb r3, [r3, r2]
	mov r2, #1
	tst r3, r2
	beq _02254382
	add r0, r0, #4
	ldr r1, [r1, r0]
	sub r0, r2, #2
	mul r0, r1
	mov r1, #4
	bl ov12_02253178
	ldr r1, _0225439C ; =0x0000215C
	mov r6, #1
	str r0, [r5, r1]
	mov r0, #0x46
	ldr r1, [r5, #0x64]
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0xc1
	str r0, [r4]
_02254382:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02254388: .word 0x00003044
_0225438C: .word 0x000003E9
_02254390: .word 0x00002D8C
_02254394: .word 0x0000216C
_02254398: .word 0x801FDA49
_0225439C: .word 0x0000215C
	thumb_func_end ov12_02253E04

	thumb_func_start ov12_022543A0
ov12_022543A0: ; 0x022543A0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r2, #0
	add r0, r4, #0
	add r1, r5, #0
	add r7, r3, #0
	mov r6, #0
	bl ov12_022527CC
	cmp r0, #0x28
	bgt _022543E6
	bge _02254480
	cmp r0, #7
	bgt _022543C0
	beq _0225442E
	b _022544D8
_022543C0:
	add r1, r0, #0
	sub r1, #0xc
	cmp r1, #8
	bhi _022543F0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022543D4: ; jump table
	.short _0225449C - _022543D4 - 2 ; case 0
	.short _022544D8 - _022543D4 - 2 ; case 1
	.short _022544D8 - _022543D4 - 2 ; case 2
	.short _02254448 - _022543D4 - 2 ; case 3
	.short _022544D8 - _022543D4 - 2 ; case 4
	.short _022543F8 - _022543D4 - 2 ; case 5
	.short _022544D8 - _022543D4 - 2 ; case 6
	.short _022544D8 - _022543D4 - 2 ; case 7
	.short _02254412 - _022543D4 - 2 ; case 8
_022543E6:
	cmp r0, #0x48
	bgt _022543F2
	bge _02254448
	cmp r0, #0x29
	beq _02254464
_022543F0:
	b _022544D8
_022543F2:
	cmp r0, #0x54
	beq _022544BA
	b _022544D8
_022543F8:
	mov r0, #0xc0
	add r1, r5, #0
	mul r1, r0
	add r2, r4, r1
	ldr r1, _0225450C ; =0x00002DAC
	ldr r2, [r2, r1]
	ldr r1, _02254510 ; =0x00000F88
	tst r1, r2
	beq _022544D8
	mov r6, #1
	add r0, #0x70
	str r6, [r4, r0]
	b _022544D8
_02254412:
	mov r0, #0xc0
	add r1, r5, #0
	mul r1, r0
	add r2, r4, r1
	ldr r1, _02254514 ; =0x00002DB0
	ldr r2, [r2, r1]
	mov r1, #7
	tst r1, r2
	beq _022544D8
	mov r1, #5
	add r0, #0x70
	str r1, [r4, r0]
	mov r6, #1
	b _022544D8
_0225442E:
	mov r0, #0xc0
	mul r0, r5
	add r1, r4, r0
	ldr r0, _0225450C ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #0x40
	tst r1, r0
	beq _022544D8
	mov r1, #3
	add r0, #0xf0
	str r1, [r4, r0]
	mov r6, #1
	b _022544D8
_02254448:
	mov r0, #0xc0
	add r1, r5, #0
	mul r1, r0
	add r2, r4, r1
	ldr r1, _0225450C ; =0x00002DAC
	ldr r2, [r2, r1]
	mov r1, #7
	tst r1, r2
	beq _022544D8
	mov r1, #0
	add r0, #0x70
	str r1, [r4, r0]
	mov r6, #1
	b _022544D8
_02254464:
	mov r0, #0xc0
	add r1, r5, #0
	mul r1, r0
	add r2, r4, r1
	ldr r1, _0225450C ; =0x00002DAC
	ldr r2, [r2, r1]
	mov r1, #0x10
	tst r1, r2
	beq _022544D8
	mov r1, #2
	add r0, #0x70
	str r1, [r4, r0]
	mov r6, #1
	b _022544D8
_02254480:
	mov r0, #0xc0
	add r1, r5, #0
	mul r1, r0
	add r2, r4, r1
	ldr r1, _0225450C ; =0x00002DAC
	ldr r2, [r2, r1]
	mov r1, #0x20
	tst r1, r2
	beq _022544D8
	mov r1, #4
	add r0, #0x70
	str r1, [r4, r0]
	mov r6, #1
	b _022544D8
_0225449C:
	mov r0, #0xc0
	add r1, r5, #0
	mul r1, r0
	add r2, r4, r1
	ldr r1, _02254514 ; =0x00002DB0
	ldr r2, [r2, r1]
	mov r1, #0xf
	lsl r1, r1, #0x10
	tst r1, r2
	beq _022544D8
	mov r1, #6
	add r0, #0x70
	str r1, [r4, r0]
	mov r6, #1
	b _022544D8
_022544BA:
	mov r0, #0xc0
	add r3, r5, #0
	mul r3, r0
	ldr r0, _02254518 ; =0x00002DB8
	add r1, r4, r3
	ldrh r1, [r1, r0]
	cmp r1, #0
	beq _022544D8
	add r0, #0x14
	add r2, r4, r0
	mov r0, #1
	ldr r1, [r2, r3]
	lsl r0, r0, #0x16
	orr r0, r1
	str r0, [r2, r3]
_022544D8:
	cmp r6, #1
	bne _02254506
	mov r0, #0x46
	lsl r0, r0, #2
	str r5, [r4, r0]
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_022527CC
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r4, r1]
	cmp r7, #0
	bne _02254506
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xdd
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_02254506:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225450C: .word 0x00002DAC
_02254510: .word 0x00000F88
_02254514: .word 0x00002DB0
_02254518: .word 0x00002DB8
	thumb_func_end ov12_022543A0

	thumb_func_start ov12_0225451C
ov12_0225451C: ; 0x0225451C
	mov r0, #0
	cmp r1, #0x28
	bgt _0225453C
	bge _02254572
	cmp r1, #7
	bgt _0225452C
	beq _02254554
	bx lr
_0225452C:
	cmp r1, #0x11
	bgt _0225457A
	cmp r1, #0xf
	blt _0225457A
	beq _0225455E
	cmp r1, #0x11
	beq _0225454A
	bx lr
_0225453C:
	cmp r1, #0x29
	bgt _02254544
	beq _02254568
	bx lr
_02254544:
	cmp r1, #0x48
	beq _0225455E
	bx lr
_0225454A:
	ldr r1, _0225457C ; =0x00000F88
	tst r1, r2
	beq _0225457A
	mov r0, #1
	bx lr
_02254554:
	mov r1, #0x40
	tst r1, r2
	beq _0225457A
	mov r0, #1
	bx lr
_0225455E:
	mov r1, #7
	tst r1, r2
	beq _0225457A
	mov r0, #1
	bx lr
_02254568:
	mov r1, #0x10
	tst r1, r2
	beq _0225457A
	mov r0, #1
	bx lr
_02254572:
	mov r1, #0x20
	tst r1, r2
	beq _0225457A
	mov r0, #1
_0225457A:
	bx lr
	.balign 4, 0
_0225457C: .word 0x00000F88
	thumb_func_end ov12_0225451C

	thumb_func_start ov12_02254580
ov12_02254580: ; 0x02254580
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r4, r1, #0
	str r5, [sp]
	ldr r1, [r4, #0x6c]
	add r7, r0, #0
	add r6, r2, #0
	cmp r1, #0xff
	beq _022545C2
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x1c
	bne _022545C2
	add r1, r4, #0
	add r1, #0x94
	ldr r0, [r4, #0x6c]
	ldr r1, [r1]
	cmp r0, r1
	bne _022545C2
	ldr r1, _02254710 ; =0x0000213C
	ldr r2, [r4, r1]
	mov r1, #0x80
	tst r2, r1
	beq _022545C2
	add r1, #0x98
	str r0, [r4, r1]
	add r0, r4, #0
	ldr r1, [r4, #0x64]
	add r0, #0x94
	str r1, [r0]
	mov r5, #1
	b _022545F2
_022545C2:
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x1c
	bne _022545F2
	add r1, r4, #0
	add r1, #0x94
	ldr r0, [r4, #0x64]
	ldr r1, [r1]
	cmp r0, r1
	bne _022545F2
	ldr r1, _02254710 ; =0x0000213C
	ldr r2, [r4, r1]
	mov r1, #0x80
	tst r2, r1
	beq _022545F2
	add r1, #0x98
	str r0, [r4, r1]
	add r0, r4, #0
	ldr r1, [r4, #0x6c]
	add r0, #0x94
	str r1, [r0]
	mov r5, #1
_022545F2:
	cmp r5, #1
	bne _0225464A
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _02254714 ; =0x00002DAC
	ldr r0, [r1, r0]
	ldr r1, _02254718 ; =0x00000F88
	tst r1, r0
	beq _02254612
	mov r0, #0x16
	str r0, [sp]
	b _02254628
_02254612:
	mov r1, #0x10
	tst r1, r0
	beq _0225461E
	mov r0, #0x19
	str r0, [sp]
	b _02254628
_0225461E:
	mov r1, #0x40
	tst r0, r1
	beq _02254628
	mov r0, #0x1f
	str r0, [sp]
_02254628:
	ldr r0, [sp]
	cmp r0, #0
	beq _0225464A
	add r0, r4, #0
	mov r1, #3
	add r0, #0x88
	str r1, [r0]
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	str r6, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225464A:
	add r0, r7, #0
	add r1, r4, #0
	add r2, sp, #0
	bl ov12_02256914
	add r5, r0, #0
	cmp r5, #1
	bne _0225466E
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	str r6, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225466E:
	ldr r1, [r4, #0x6c]
	cmp r1, #0xff
	beq _022546AE
	add r0, r4, #0
	bl ov12_02255830
	cmp r0, #0x6c
	bne _022546AE
	add r1, r4, #0
	add r1, #0x94
	ldr r0, [r4, #0x6c]
	ldr r1, [r1]
	cmp r0, r1
	bne _022546AE
	mov r1, #0x1c
	add r2, r0, #0
	mul r2, r1
	add r3, r4, r2
	mov r2, #0xba
	lsl r2, r2, #2
	ldr r3, [r3, r2]
	mov r2, #4
	tst r2, r3
	beq _022546AE
	add r1, #0xfc
	str r0, [r4, r1]
	add r0, r4, #0
	ldr r1, [r4, #0x64]
	add r0, #0x94
	str r1, [r0]
	mov r5, #1
	b _022546E8
_022546AE:
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl ov12_02255830
	cmp r0, #0x6c
	bne _022546E8
	add r1, r4, #0
	add r1, #0x94
	ldr r0, [r4, #0x64]
	ldr r1, [r1]
	cmp r0, r1
	bne _022546E8
	mov r1, #0x1c
	add r2, r0, #0
	mul r2, r1
	add r3, r4, r2
	mov r2, #0xba
	lsl r2, r2, #2
	ldr r3, [r3, r2]
	mov r2, #4
	tst r2, r3
	beq _022546E8
	add r1, #0xfc
	str r0, [r4, r1]
	add r0, r4, #0
	ldr r1, [r4, #0x6c]
	add r0, #0x94
	str r1, [r0]
	mov r5, #1
_022546E8:
	cmp r5, #1
	bne _0225470C
	mov r0, #0x6a
	str r0, [sp]
	add r0, r4, #0
	mov r1, #5
	add r0, #0x88
	str r1, [r0]
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	str r6, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225470C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02254710: .word 0x0000213C
_02254714: .word 0x00002DAC
_02254718: .word 0x00000F88
	thumb_func_end ov12_02254580

	thumb_func_start ov12_0225471C
ov12_0225471C: ; 0x0225471C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	add r4, r1, #0
	mov r0, #0
	str r0, [sp, #0xc]
	str r2, [sp, #4]
	add r0, r4, #0
	add r1, r2, #0
	bl ov12_02255830
	str r0, [sp, #0x10]
	ldr r1, [sp, #4]
	add r0, r4, #0
	mov r2, #0
	bl ov12_02255844
	add r6, r0, #0
	ldr r0, [sp, #4]
	mov r3, #0xc0
	add r5, r0, #0
	ldr r0, _02254A40 ; =0x00002D8C
	mul r5, r3
	add r1, r4, r0
	ldr r2, [r1, r5]
	str r1, [sp, #0x14]
	cmp r2, #0
	bne _02254756
	b _02254D4C
_02254756:
	ldr r1, [sp, #0x10]
	cmp r1, #0x36
	bls _0225475E
	b _02254D1E
_0225475E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225476A: ; jump table
	.short _02254D1E - _0225476A - 2 ; case 0
	.short _022547D8 - _0225476A - 2 ; case 1
	.short _02254D1E - _0225476A - 2 ; case 2
	.short _02254D1E - _0225476A - 2 ; case 3
	.short _02254D1E - _0225476A - 2 ; case 4
	.short _02254812 - _0225476A - 2 ; case 5
	.short _02254826 - _0225476A - 2 ; case 6
	.short _0225483A - _0225476A - 2 ; case 7
	.short _0225484E - _0225476A - 2 ; case 8
	.short _02254862 - _0225476A - 2 ; case 9
	.short _02254878 - _0225476A - 2 ; case 10
	.short _022548DA - _0225476A - 2 ; case 11
	.short _022548EE - _0225476A - 2 ; case 12
	.short _022547F0 - _0225476A - 2 ; case 13
	.short _0225494C - _0225476A - 2 ; case 14
	.short _02254988 - _0225476A - 2 ; case 15
	.short _022549C6 - _0225476A - 2 ; case 16
	.short _02254A02 - _0225476A - 2 ; case 17
	.short _02254A5C - _0225476A - 2 ; case 18
	.short _02254D1E - _0225476A - 2 ; case 19
	.short _02254D1E - _0225476A - 2 ; case 20
	.short _02254D1E - _0225476A - 2 ; case 21
	.short _02254D1E - _0225476A - 2 ; case 22
	.short _02254D1E - _0225476A - 2 ; case 23
	.short _02254D1E - _0225476A - 2 ; case 24
	.short _02254D1E - _0225476A - 2 ; case 25
	.short _02254D1E - _0225476A - 2 ; case 26
	.short _02254D1E - _0225476A - 2 ; case 27
	.short _02254D1E - _0225476A - 2 ; case 28
	.short _02254D1E - _0225476A - 2 ; case 29
	.short _02254D1E - _0225476A - 2 ; case 30
	.short _02254D1E - _0225476A - 2 ; case 31
	.short _02254D1E - _0225476A - 2 ; case 32
	.short _02254D1E - _0225476A - 2 ; case 33
	.short _02254D1E - _0225476A - 2 ; case 34
	.short _02254D1E - _0225476A - 2 ; case 35
	.short _02254A98 - _0225476A - 2 ; case 36
	.short _02254ADE - _0225476A - 2 ; case 37
	.short _02254B24 - _0225476A - 2 ; case 38
	.short _02254B6A - _0225476A - 2 ; case 39
	.short _02254BB0 - _0225476A - 2 ; case 40
	.short _02254BF8 - _0225476A - 2 ; case 41
	.short _02254C3A - _0225476A - 2 ; case 42
	.short _02254D1E - _0225476A - 2 ; case 43
	.short _02254CEC - _0225476A - 2 ; case 44
	.short _02254D1E - _0225476A - 2 ; case 45
	.short _02254D1E - _0225476A - 2 ; case 46
	.short _02254D1E - _0225476A - 2 ; case 47
	.short _02254D1E - _0225476A - 2 ; case 48
	.short _02254CA8 - _0225476A - 2 ; case 49
	.short _02254D1E - _0225476A - 2 ; case 50
	.short _02254D1E - _0225476A - 2 ; case 51
	.short _02254D1E - _0225476A - 2 ; case 52
	.short _02254D1E - _0225476A - 2 ; case 53
	.short _02254CD0 - _0225476A - 2 ; case 54
_022547D8:
	add r1, r4, r5
	add r0, r0, #4
	ldr r0, [r1, r0]
	lsr r0, r0, #1
	cmp r2, r0
	bhi _0225486E
	ldr r0, _02254A44 ; =0x0000215C
	mov r7, #0xc6
	str r6, [r4, r0]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02254D1E
_022547F0:
	add r1, r4, r5
	add r0, r0, #4
	ldr r1, [r1, r0]
	lsr r0, r1, #1
	cmp r2, r0
	bhi _0225486E
	add r0, r6, #0
	mul r0, r1
	mov r1, #0x64
	bl ov12_02253178
	ldr r1, _02254A44 ; =0x0000215C
	mov r7, #0xc6
	str r0, [r4, r1]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02254D1E
_02254812:
	add r1, r4, r5
	add r0, #0x20
	ldr r1, [r1, r0]
	mov r0, #0x40
	tst r0, r1
	beq _0225486E
	mov r0, #1
	mov r7, #0xc7
	str r0, [sp, #0xc]
	b _02254D1E
_02254826:
	add r1, r4, r5
	add r0, #0x20
	ldr r1, [r1, r0]
	mov r0, #7
	tst r0, r1
	beq _0225486E
	mov r0, #1
	mov r7, #0xc8
	str r0, [sp, #0xc]
	b _02254D1E
_0225483A:
	add r1, r4, r5
	add r0, #0x20
	ldr r1, [r1, r0]
	ldr r0, _02254A48 ; =0x00000F88
	tst r0, r1
	beq _0225486E
	mov r0, #1
	mov r7, #0xc9
	str r0, [sp, #0xc]
	b _02254D1E
_0225484E:
	add r1, r4, r5
	add r0, #0x20
	ldr r1, [r1, r0]
	mov r0, #0x10
	tst r0, r1
	beq _0225486E
	mov r0, #1
	mov r7, #0xca
	str r0, [sp, #0xc]
	b _02254D1E
_02254862:
	add r1, r4, r5
	add r0, #0x20
	ldr r1, [r1, r0]
	mov r0, #0x20
	tst r0, r1
	bne _02254870
_0225486E:
	b _02254D1E
_02254870:
	mov r0, #1
	mov r7, #0xcb
	str r0, [sp, #0xc]
	b _02254D1E
_02254878:
	mov r0, #0
	str r0, [sp, #8]
	add r0, r4, r5
	ldr r3, _02254A4C ; =0x00002D4C
	add r1, r0, #0
_02254882:
	ldrh r2, [r0, r3]
	cmp r2, #0
	beq _02254890
	ldr r2, _02254A50 ; =0x00002D6C
	ldrb r2, [r1, r2]
	cmp r2, #0
	beq _0225489E
_02254890:
	ldr r2, [sp, #8]
	add r0, r0, #2
	add r2, r2, #1
	add r1, r1, #1
	str r2, [sp, #8]
	cmp r2, #4
	blt _02254882
_0225489E:
	ldr r0, [sp, #8]
	cmp r0, #4
	beq _02254994
	mov r0, #0xb5
	lsl r0, r0, #6
	ldr r1, [sp, #8]
	add r0, r4, r0
	add r0, r0, r5
	add r1, #0x1f
	add r2, r6, #0
	bl ov12_0224F7AC
	ldr r0, [sp]
	ldr r2, [sp, #4]
	add r1, r4, #0
	bl ov12_02250C40
	ldr r0, [sp, #8]
	add r1, r4, r5
	lsl r0, r0, #1
	add r1, r1, r0
	ldr r0, _02254A4C ; =0x00002D4C
	mov r7, #0xcc
	ldrh r1, [r1, r0]
	mov r0, #0x49
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02254D1E
_022548DA:
	add r1, r4, r5
	add r0, #0x24
	ldr r1, [r1, r0]
	mov r0, #7
	tst r0, r1
	beq _02254994
	mov r0, #1
	mov r7, #0xcd
	str r0, [sp, #0xc]
	b _02254D1E
_022548EE:
	add r2, r0, #0
	add r1, r4, r5
	add r2, #0x20
	ldr r2, [r1, r2]
	lsl r3, r2, #0x18
	lsr r3, r3, #0x18
	bne _02254906
	add r0, #0x24
	ldr r1, [r1, r0]
	mov r0, #7
	tst r0, r1
	beq _02254994
_02254906:
	mov r0, #0x40
	tst r0, r2
	beq _0225490E
	mov r7, #0xc7
_0225490E:
	mov r0, #7
	tst r0, r2
	beq _02254916
	mov r7, #0xc8
_02254916:
	ldr r0, _02254A48 ; =0x00000F88
	tst r0, r2
	beq _0225491E
	mov r7, #0xc9
_0225491E:
	mov r0, #0x10
	tst r0, r2
	beq _02254926
	mov r7, #0xca
_02254926:
	mov r0, #0x20
	tst r0, r2
	beq _0225492E
	mov r7, #0xcb
_0225492E:
	ldr r0, _02254A54 ; =0x00002DB0
	add r1, r4, r5
	ldr r1, [r1, r0]
	mov r0, #7
	and r0, r1
	beq _0225493C
	mov r7, #0xcd
_0225493C:
	cmp r3, #0
	beq _02254946
	cmp r0, #0
	beq _02254946
	mov r7, #0xce
_02254946:
	mov r0, #1
	str r0, [sp, #0xc]
	b _02254D1E
_0225494C:
	add r1, r4, r5
	add r0, r0, #4
	ldr r0, [r1, r0]
	lsr r1, r0, #1
	cmp r2, r1
	bhi _02254994
	add r1, r6, #0
	bl ov12_02253178
	ldr r1, _02254A44 ; =0x0000215C
	add r2, r4, r5
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _02254A58 ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02254980
	mov r7, #0xcf
	b _02254982
_02254980:
	mov r7, #0xc6
_02254982:
	mov r0, #1
	str r0, [sp, #0xc]
	b _02254D1E
_02254988:
	add r1, r4, r5
	add r0, r0, #4
	ldr r0, [r1, r0]
	lsr r1, r0, #1
	cmp r2, r1
	bls _02254996
_02254994:
	b _02254D1E
_02254996:
	add r1, r6, #0
	bl ov12_02253178
	ldr r1, _02254A44 ; =0x0000215C
	add r2, r4, r5
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _02254A58 ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _022549BE
	mov r7, #0xcf
	b _022549C0
_022549BE:
	mov r7, #0xc6
_022549C0:
	mov r0, #1
	str r0, [sp, #0xc]
	b _02254D1E
_022549C6:
	add r1, r4, r5
	add r0, r0, #4
	ldr r0, [r1, r0]
	lsr r1, r0, #1
	cmp r2, r1
	bhi _02254ACE
	add r1, r6, #0
	bl ov12_02253178
	ldr r1, _02254A44 ; =0x0000215C
	add r2, r4, r5
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #2
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _02254A58 ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _022549FA
	mov r7, #0xcf
	b _022549FC
_022549FA:
	mov r7, #0xc6
_022549FC:
	mov r0, #1
	str r0, [sp, #0xc]
	b _02254D1E
_02254A02:
	add r1, r4, r5
	add r0, r0, #4
	ldr r0, [r1, r0]
	lsr r1, r0, #1
	cmp r2, r1
	bhi _02254ACE
	add r1, r6, #0
	bl ov12_02253178
	ldr r1, _02254A44 ; =0x0000215C
	add r2, r4, r5
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #3
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _02254A58 ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02254A36
	mov r7, #0xcf
	b _02254A38
_02254A36:
	mov r7, #0xc6
_02254A38:
	mov r0, #1
	str r0, [sp, #0xc]
	b _02254D1E
	nop
_02254A40: .word 0x00002D8C
_02254A44: .word 0x0000215C
_02254A48: .word 0x00000F88
_02254A4C: .word 0x00002D4C
_02254A50: .word 0x00002D6C
_02254A54: .word 0x00002DB0
_02254A58: .word 0x00002DA8
_02254A5C:
	add r1, r4, r5
	add r0, r0, #4
	ldr r0, [r1, r0]
	lsr r1, r0, #1
	cmp r2, r1
	bhi _02254ACE
	add r1, r6, #0
	bl ov12_02253178
	ldr r1, _02254D54 ; =0x0000215C
	add r2, r4, r5
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #4
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _02254D58 ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02254A90
	mov r7, #0xcf
	b _02254A92
_02254A90:
	mov r7, #0xc6
_02254A92:
	mov r0, #1
	str r0, [sp, #0xc]
	b _02254D1E
_02254A98:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _02254AAA
	lsr r0, r6, #0x1f
	add r0, r6, r0
	asr r6, r0, #1
_02254AAA:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _02254D5C ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _02254ACE
	ldr r0, _02254D60 ; =0x00002D59
	add r1, r4, r5
	ldrsb r0, [r1, r0]
	cmp r0, #0xc
	blt _02254AD0
_02254ACE:
	b _02254D1E
_02254AD0:
	mov r1, #0x13
	mov r0, #1
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	str r0, [r4, r1]
	mov r7, #0xd0
	b _02254D1E
_02254ADE:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _02254AF0
	lsr r0, r6, #0x1f
	add r0, r6, r0
	asr r6, r0, #1
_02254AF0:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _02254D5C ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _02254BE6
	ldr r0, _02254D64 ; =0x00002D5A
	add r1, r4, r5
	ldrsb r0, [r1, r0]
	cmp r0, #0xc
	bge _02254BE6
	mov r0, #0x13
	mov r1, #2
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #1
	mov r7, #0xd0
	str r0, [sp, #0xc]
	b _02254D1E
_02254B24:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _02254B36
	lsr r0, r6, #0x1f
	add r0, r6, r0
	asr r6, r0, #1
_02254B36:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _02254D5C ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _02254BE6
	ldr r0, _02254D68 ; =0x00002D5B
	add r1, r4, r5
	ldrsb r0, [r1, r0]
	cmp r0, #0xc
	bge _02254BE6
	mov r0, #0x13
	mov r1, #3
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #1
	mov r7, #0xd0
	str r0, [sp, #0xc]
	b _02254D1E
_02254B6A:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _02254B7C
	lsr r0, r6, #0x1f
	add r0, r6, r0
	asr r6, r0, #1
_02254B7C:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _02254D5C ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _02254BE6
	ldr r0, _02254D6C ; =0x00002D5C
	add r1, r4, r5
	ldrsb r0, [r1, r0]
	cmp r0, #0xc
	bge _02254BE6
	mov r0, #0x13
	mov r1, #4
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #1
	mov r7, #0xd0
	str r0, [sp, #0xc]
	b _02254D1E
_02254BB0:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _02254BC2
	lsr r0, r6, #0x1f
	add r0, r6, r0
	asr r6, r0, #1
_02254BC2:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _02254D5C ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _02254BE6
	ldr r0, _02254D70 ; =0x00002D5D
	add r1, r4, r5
	ldrsb r0, [r1, r0]
	cmp r0, #0xc
	blt _02254BE8
_02254BE6:
	b _02254D1E
_02254BE8:
	mov r0, #0x13
	mov r1, #5
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #1
	mov r7, #0xd0
	str r0, [sp, #0xc]
	b _02254D1E
_02254BF8:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _02254C0A
	lsr r0, r6, #0x1f
	add r0, r6, r0
	asr r6, r0, #1
_02254C0A:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _02254D5C ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _02254D1E
	ldr r0, _02254D74 ; =0x00002DB0
	add r1, r4, r5
	ldr r1, [r1, r0]
	mov r0, #1
	lsl r0, r0, #0x14
	tst r0, r1
	bne _02254D1E
	mov r0, #1
	mov r7, #0xd1
	str r0, [sp, #0xc]
	b _02254D1E
_02254C3A:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _02254C4C
	lsr r0, r6, #0x1f
	add r0, r6, r0
	asr r6, r0, #1
_02254C4C:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _02254D5C ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _02254D1E
	ldr r0, _02254D60 ; =0x00002D59
	mov r2, #0
	add r3, r4, r5
_02254C6C:
	ldrsb r1, [r3, r0]
	cmp r1, #0xc
	blt _02254C7A
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, #5
	blt _02254C6C
_02254C7A:
	cmp r2, #5
	beq _02254D1E
	ldr r6, _02254D60 ; =0x00002D59
	add r5, r4, r5
	mov r7, #5
_02254C84:
	ldr r0, [sp]
	bl ov12_0223BD98
	add r1, r7, #0
	bl _s32_div_f
	add r0, r5, r1
	ldrsb r0, [r0, r6]
	cmp r0, #0xc
	beq _02254C84
	mov r0, #0x13
	add r1, r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #1
	mov r7, #0xd2
	str r0, [sp, #0xc]
	b _02254D1E
_02254CA8:
	ldr r6, _02254D78 ; =0x00002D58
	add r1, r4, r5
	mov r0, #0
	mov r5, #6
	add r3, r6, #0
_02254CB2:
	ldrsb r2, [r1, r3]
	cmp r2, #6
	bge _02254CBE
	mov r2, #1
	strb r5, [r1, r6]
	str r2, [sp, #0xc]
_02254CBE:
	add r0, r0, #1
	add r1, r1, #1
	cmp r0, #8
	blt _02254CB2
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _02254D1E
	mov r7, #0xd3
	b _02254D1E
_02254CD0:
	add r1, r4, r5
	add r0, #0x24
	ldr r1, [r1, r0]
	mov r0, #0xf
	lsl r0, r0, #0x10
	tst r0, r1
	beq _02254D1E
	mov r0, #6
	add r3, #0x70
	str r0, [r4, r3]
	mov r0, #1
	mov r7, #0xd4
	str r0, [sp, #0xc]
	b _02254D1E
_02254CEC:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _02254CFE
	lsr r0, r6, #0x1f
	add r0, r6, r0
	asr r6, r0, #1
_02254CFE:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _02254D5C ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _02254D1E
	mov r0, #1
	ldr r7, _02254D7C ; =0x00000109
	str r0, [sp, #0xc]
_02254D1E:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _02254D4C
	mov r1, #0x46
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022555EC
	mov r1, #0x4a
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_02254D4C:
	ldr r0, [sp, #0xc]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02254D54: .word 0x0000215C
_02254D58: .word 0x00002DA8
_02254D5C: .word 0x00002D90
_02254D60: .word 0x00002D59
_02254D64: .word 0x00002D5A
_02254D68: .word 0x00002D5B
_02254D6C: .word 0x00002D5C
_02254D70: .word 0x00002D5D
_02254D74: .word 0x00002DB0
_02254D78: .word 0x00002D58
_02254D7C: .word 0x00000109
	thumb_func_end ov12_0225471C

	thumb_func_start ov12_02254D80
ov12_02254D80: ; 0x02254D80
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r2, #0
	mov r7, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_02255830
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov12_02255844
	mov r0, #0xc0
	add r4, r6, #0
	mul r4, r0
	ldr r0, _02254E70 ; =0x00002D8C
	add r1, r5, r0
	str r1, [sp, #8]
	ldr r1, [r1, r4]
	cmp r1, #0
	beq _02254E6A
	ldr r2, [sp, #4]
	cmp r2, #0x45
	beq _02254DBE
	add r0, r2, #0
	cmp r0, #0x6d
	beq _02254DDA
	b _02254E40
_02254DBE:
	add r2, r5, r4
	add r0, r0, #4
	ldr r0, [r2, r0]
	cmp r1, r0
	bhs _02254E40
	mov r1, #0x10
	bl ov12_02253178
	ldr r1, _02254E74 ; =0x0000215C
	mov r7, #1
	str r0, [r5, r1]
	mov r0, #0xd5
	str r0, [sp]
	b _02254E40
_02254DDA:
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1b
	add r3, r7, #0
	bl ov12_0224EDE0
	cmp r0, #3
	beq _02254DFA
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1c
	add r3, r7, #0
	bl ov12_0224EDE0
	cmp r0, #3
	bne _02254E1A
_02254DFA:
	ldr r0, _02254E78 ; =0x00002D90
	add r1, r5, r4
	ldr r0, [r1, r0]
	ldr r1, [sp, #8]
	ldr r1, [r1, r4]
	cmp r1, r0
	bhs _02254E40
	mov r1, #0x10
	bl ov12_02253178
	ldr r1, _02254E74 ; =0x0000215C
	mov r7, #1
	str r0, [r5, r1]
	mov r0, #0xd5
	str r0, [sp]
	b _02254E40
_02254E1A:
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_022527CC
	cmp r0, #0x62
	beq _02254E40
	ldr r0, _02254E78 ; =0x00002D90
	add r1, r5, r4
	ldr r1, [r1, r0]
	sub r0, r7, #1
	mul r0, r1
	mov r1, #8
	bl ov12_02253178
	ldr r1, _02254E74 ; =0x0000215C
	mov r7, #1
	str r0, [r5, r1]
	mov r0, #0xd7
	str r0, [sp]
_02254E40:
	cmp r7, #1
	bne _02254E6A
	mov r0, #0x46
	lsl r0, r0, #2
	str r6, [r5, r0]
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_022555EC
	mov r1, #0x4a
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r2, [sp]
	add r0, r5, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r5, #8]
	str r0, [r5, #0xc]
	mov r0, #0x16
	str r0, [r5, #8]
_02254E6A:
	add r0, r7, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02254E70: .word 0x00002D8C
_02254E74: .word 0x0000215C
_02254E78: .word 0x00002D90
	thumb_func_end ov12_02254D80

	thumb_func_start ov12_02254E7C
ov12_02254E7C: ; 0x02254E7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	add r4, r1, #0
	mov r0, #0
	str r0, [sp, #0xc]
	str r2, [sp, #4]
	add r0, r4, #0
	add r1, r2, #0
	add r6, r3, #0
	bl ov12_02255830
	str r0, [sp, #0x10]
	ldr r1, [sp, #4]
	add r0, r4, #0
	mov r2, #0
	bl ov12_02255844
	add r7, r0, #0
	ldr r0, [sp, #4]
	mov r3, #0xc0
	add r5, r0, #0
	ldr r0, _022551A0 ; =0x00002D8C
	mul r5, r3
	add r1, r4, r0
	ldr r2, [r1, r5]
	str r1, [sp, #0x14]
	cmp r2, #0
	bne _02254EB8
	b _02255516
_02254EB8:
	ldr r1, [sp, #0x10]
	cmp r1, #0x36
	bhi _02254F44
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02254ECA: ; jump table
	.short _02255502 - _02254ECA - 2 ; case 0
	.short _02254F38 - _02254ECA - 2 ; case 1
	.short _02255502 - _02254ECA - 2 ; case 2
	.short _02255502 - _02254ECA - 2 ; case 3
	.short _02255502 - _02254ECA - 2 ; case 4
	.short _02254F78 - _02254ECA - 2 ; case 5
	.short _02254F8E - _02254ECA - 2 ; case 6
	.short _02254FA4 - _02254ECA - 2 ; case 7
	.short _02254FBA - _02254ECA - 2 ; case 8
	.short _02254FD0 - _02254ECA - 2 ; case 9
	.short _02254FE6 - _02254ECA - 2 ; case 10
	.short _0225504A - _02254ECA - 2 ; case 11
	.short _02255062 - _02254ECA - 2 ; case 12
	.short _02254F54 - _02254ECA - 2 ; case 13
	.short _0225515E - _02254ECA - 2 ; case 14
	.short _022551C8 - _02254ECA - 2 ; case 15
	.short _02255206 - _02254ECA - 2 ; case 16
	.short _02255244 - _02254ECA - 2 ; case 17
	.short _02255282 - _02254ECA - 2 ; case 18
	.short _02255502 - _02254ECA - 2 ; case 19
	.short _02255502 - _02254ECA - 2 ; case 20
	.short _02255502 - _02254ECA - 2 ; case 21
	.short _02255502 - _02254ECA - 2 ; case 22
	.short _02255502 - _02254ECA - 2 ; case 23
	.short _02255502 - _02254ECA - 2 ; case 24
	.short _02255502 - _02254ECA - 2 ; case 25
	.short _02255502 - _02254ECA - 2 ; case 26
	.short _02255502 - _02254ECA - 2 ; case 27
	.short _02255502 - _02254ECA - 2 ; case 28
	.short _02255502 - _02254ECA - 2 ; case 29
	.short _02255502 - _02254ECA - 2 ; case 30
	.short _02255502 - _02254ECA - 2 ; case 31
	.short _02255502 - _02254ECA - 2 ; case 32
	.short _02255502 - _02254ECA - 2 ; case 33
	.short _02255502 - _02254ECA - 2 ; case 34
	.short _02255502 - _02254ECA - 2 ; case 35
	.short _022552C2 - _02254ECA - 2 ; case 36
	.short _02255308 - _02254ECA - 2 ; case 37
	.short _02255350 - _02254ECA - 2 ; case 38
	.short _02255398 - _02254ECA - 2 ; case 39
	.short _022553E2 - _02254ECA - 2 ; case 40
	.short _0225542A - _02254ECA - 2 ; case 41
	.short _0225546E - _02254ECA - 2 ; case 42
	.short _02255502 - _02254ECA - 2 ; case 43
	.short _02255128 - _02254ECA - 2 ; case 44
	.short _02255502 - _02254ECA - 2 ; case 45
	.short _02255502 - _02254ECA - 2 ; case 46
	.short _02255502 - _02254ECA - 2 ; case 47
	.short _02255502 - _02254ECA - 2 ; case 48
	.short _022550E0 - _02254ECA - 2 ; case 49
	.short _02255502 - _02254ECA - 2 ; case 50
	.short _02255502 - _02254ECA - 2 ; case 51
	.short _02255502 - _02254ECA - 2 ; case 52
	.short _02255502 - _02254ECA - 2 ; case 53
	.short _0225510A - _02254ECA - 2 ; case 54
_02254F38:
	add r1, r4, r5
	add r0, r0, #4
	ldr r0, [r1, r0]
	lsr r0, r0, #1
	cmp r2, r0
	bls _02254F46
_02254F44:
	b _02255502
_02254F46:
	ldr r0, _022551A4 ; =0x0000215C
	str r7, [r4, r0]
	mov r0, #0xc6
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_02254F54:
	add r1, r4, r5
	add r0, r0, #4
	ldr r1, [r1, r0]
	lsr r0, r1, #1
	cmp r2, r0
	bhi _02255056
	add r0, r7, #0
	mul r0, r1
	mov r1, #0x64
	bl ov12_02253178
	ldr r1, _022551A4 ; =0x0000215C
	str r0, [r4, r1]
	mov r0, #0xc6
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_02254F78:
	add r1, r4, r5
	add r0, #0x20
	ldr r1, [r1, r0]
	mov r0, #0x40
	tst r0, r1
	beq _02255056
	mov r0, #0xc7
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_02254F8E:
	add r1, r4, r5
	add r0, #0x20
	ldr r1, [r1, r0]
	mov r0, #7
	tst r0, r1
	beq _02255056
	mov r0, #0xc8
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_02254FA4:
	add r1, r4, r5
	add r0, #0x20
	ldr r1, [r1, r0]
	ldr r0, _022551A8 ; =0x00000F88
	tst r0, r1
	beq _02255056
	mov r0, #0xc9
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_02254FBA:
	add r1, r4, r5
	add r0, #0x20
	ldr r1, [r1, r0]
	mov r0, #0x10
	tst r0, r1
	beq _02255056
	mov r0, #0xca
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_02254FD0:
	add r1, r4, r5
	add r0, #0x20
	ldr r1, [r1, r0]
	mov r0, #0x20
	tst r0, r1
	beq _02255056
	mov r0, #0xcb
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_02254FE6:
	mov r0, #0
	str r0, [sp, #8]
	add r0, r4, r5
	ldr r3, _022551AC ; =0x00002D4C
	add r1, r0, #0
_02254FF0:
	ldrh r2, [r0, r3]
	cmp r2, #0
	beq _02254FFE
	ldr r2, _022551B0 ; =0x00002D6C
	ldrb r2, [r1, r2]
	cmp r2, #0
	beq _0225500C
_02254FFE:
	ldr r2, [sp, #8]
	add r0, r0, #2
	add r2, r2, #1
	add r1, r1, #1
	str r2, [sp, #8]
	cmp r2, #4
	blt _02254FF0
_0225500C:
	ldr r0, [sp, #8]
	cmp r0, #4
	beq _02255056
	mov r0, #0xb5
	lsl r0, r0, #6
	ldr r1, [sp, #8]
	add r0, r4, r0
	add r0, r0, r5
	add r1, #0x1f
	add r2, r7, #0
	bl ov12_0224F7AC
	ldr r0, [sp]
	ldr r2, [sp, #4]
	add r1, r4, #0
	bl ov12_02250C40
	ldr r0, [sp, #8]
	add r1, r4, r5
	lsl r0, r0, #1
	add r1, r1, r0
	ldr r0, _022551AC ; =0x00002D4C
	ldrh r1, [r1, r0]
	mov r0, #0x49
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0xcc
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_0225504A:
	add r1, r4, r5
	add r0, #0x24
	ldr r1, [r1, r0]
	mov r0, #7
	tst r0, r1
	bne _02255058
_02255056:
	b _02255502
_02255058:
	mov r0, #0xcd
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_02255062:
	add r1, r0, #0
	add r1, #0x20
	add r1, r4, r1
	ldr r2, [r1, r5]
	lsl r3, r2, #0x18
	lsr r3, r3, #0x18
	bne _0225507C
	add r3, r4, r5
	add r0, #0x24
	ldr r3, [r3, r0]
	mov r0, #7
	tst r0, r3
	beq _0225516A
_0225507C:
	mov r0, #0x40
	tst r0, r2
	beq _02255086
	mov r0, #0xc7
	str r0, [r6]
_02255086:
	ldr r2, [r1, r5]
	mov r0, #7
	tst r0, r2
	beq _02255092
	mov r0, #0xc8
	str r0, [r6]
_02255092:
	ldr r2, [r1, r5]
	ldr r0, _022551A8 ; =0x00000F88
	tst r0, r2
	beq _0225509E
	mov r0, #0xc9
	str r0, [r6]
_0225509E:
	ldr r2, [r1, r5]
	mov r0, #0x10
	tst r0, r2
	beq _022550AA
	mov r0, #0xca
	str r0, [r6]
_022550AA:
	ldr r2, [r1, r5]
	mov r0, #0x20
	tst r0, r2
	beq _022550B6
	mov r0, #0xcb
	str r0, [r6]
_022550B6:
	ldr r0, _022551B4 ; =0x00002DB0
	mov r2, #7
	add r0, r4, r0
	ldr r3, [r0, r5]
	tst r2, r3
	beq _022550C6
	mov r2, #0xcd
	str r2, [r6]
_022550C6:
	ldr r1, [r1, r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	beq _022550DA
	ldr r1, [r0, r5]
	mov r0, #7
	tst r0, r1
	beq _022550DA
	mov r0, #0xce
	str r0, [r6]
_022550DA:
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_022550E0:
	ldr r7, _022551B8 ; =0x00002D58
	add r1, r4, r5
	mov r0, #0
	mov r5, #6
	add r3, r7, #0
_022550EA:
	ldrsb r2, [r1, r3]
	cmp r2, #6
	bge _022550F6
	mov r2, #1
	strb r5, [r1, r7]
	str r2, [sp, #0xc]
_022550F6:
	add r0, r0, #1
	add r1, r1, #1
	cmp r0, #8
	blt _022550EA
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _0225516A
	mov r0, #0xd3
	str r0, [r6]
	b _02255502
_0225510A:
	add r1, r4, r5
	add r0, #0x24
	ldr r1, [r1, r0]
	mov r0, #0xf
	lsl r0, r0, #0x10
	tst r0, r1
	beq _0225516A
	mov r0, #6
	add r3, #0x70
	str r0, [r4, r3]
	mov r0, #0xd4
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_02255128:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _0225513A
	lsr r0, r7, #0x1f
	add r0, r7, r0
	asr r7, r0, #1
_0225513A:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _022551BC ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r7, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _0225516A
	ldr r0, _022551C0 ; =0x00000109
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_0225515E:
	add r1, r4, r5
	add r0, r0, #4
	ldr r0, [r1, r0]
	lsr r1, r0, #1
	cmp r2, r1
	bls _0225516C
_0225516A:
	b _02255502
_0225516C:
	add r1, r7, #0
	bl ov12_02253178
	ldr r1, _022551A4 ; =0x0000215C
	add r2, r4, r5
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _022551C4 ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02255194
	mov r0, #0xcf
	b _02255196
_02255194:
	mov r0, #0xc6
_02255196:
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
	nop
_022551A0: .word 0x00002D8C
_022551A4: .word 0x0000215C
_022551A8: .word 0x00000F88
_022551AC: .word 0x00002D4C
_022551B0: .word 0x00002D6C
_022551B4: .word 0x00002DB0
_022551B8: .word 0x00002D58
_022551BC: .word 0x00002D90
_022551C0: .word 0x00000109
_022551C4: .word 0x00002DA8
_022551C8:
	add r1, r4, r5
	add r0, r0, #4
	ldr r0, [r1, r0]
	lsr r1, r0, #1
	cmp r2, r1
	bhi _0225528E
	add r1, r7, #0
	bl ov12_02253178
	ldr r1, _022554B8 ; =0x0000215C
	add r2, r4, r5
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _022554BC ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _022551FC
	mov r0, #0xcf
	b _022551FE
_022551FC:
	mov r0, #0xc6
_022551FE:
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_02255206:
	add r1, r4, r5
	add r0, r0, #4
	ldr r0, [r1, r0]
	lsr r1, r0, #1
	cmp r2, r1
	bhi _0225528E
	add r1, r7, #0
	bl ov12_02253178
	ldr r1, _022554B8 ; =0x0000215C
	add r2, r4, r5
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #2
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _022554BC ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0225523A
	mov r0, #0xcf
	b _0225523C
_0225523A:
	mov r0, #0xc6
_0225523C:
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_02255244:
	add r1, r4, r5
	add r0, r0, #4
	ldr r0, [r1, r0]
	lsr r1, r0, #1
	cmp r2, r1
	bhi _0225528E
	add r1, r7, #0
	bl ov12_02253178
	ldr r1, _022554B8 ; =0x0000215C
	add r2, r4, r5
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #3
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _022554BC ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02255278
	mov r0, #0xcf
	b _0225527A
_02255278:
	mov r0, #0xc6
_0225527A:
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_02255282:
	add r1, r4, r5
	add r0, r0, #4
	ldr r0, [r1, r0]
	lsr r1, r0, #1
	cmp r2, r1
	bls _02255290
_0225528E:
	b _02255502
_02255290:
	add r1, r7, #0
	bl ov12_02253178
	ldr r1, _022554B8 ; =0x0000215C
	add r2, r4, r5
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #4
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _022554BC ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _022552B8
	mov r0, #0xcf
	b _022552BA
_022552B8:
	mov r0, #0xc6
_022552BA:
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_022552C2:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _022552D4
	lsr r0, r7, #0x1f
	add r0, r7, r0
	asr r7, r0, #1
_022552D4:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _022554C0 ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r7, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _022553CE
	ldr r0, _022554C4 ; =0x00002D59
	add r1, r4, r5
	ldrsb r0, [r1, r0]
	cmp r0, #0xc
	bge _022553CE
	mov r1, #0x13
	mov r0, #1
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	str r0, [r4, r1]
	mov r0, #0xd0
	str r0, [r6]
	b _02255502
_02255308:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _0225531A
	lsr r0, r7, #0x1f
	add r0, r7, r0
	asr r7, r0, #1
_0225531A:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _022554C0 ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r7, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _022553CE
	ldr r0, _022554C8 ; =0x00002D5A
	add r1, r4, r5
	ldrsb r0, [r1, r0]
	cmp r0, #0xc
	bge _022553CE
	mov r0, #0x13
	mov r1, #2
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0xd0
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_02255350:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _02255362
	lsr r0, r7, #0x1f
	add r0, r7, r0
	asr r7, r0, #1
_02255362:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _022554C0 ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r7, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _022553CE
	ldr r0, _022554CC ; =0x00002D5B
	add r1, r4, r5
	ldrsb r0, [r1, r0]
	cmp r0, #0xc
	bge _022553CE
	mov r0, #0x13
	mov r1, #3
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0xd0
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_02255398:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _022553AA
	lsr r0, r7, #0x1f
	add r0, r7, r0
	asr r7, r0, #1
_022553AA:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _022554C0 ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r7, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _022553CE
	ldr r0, _022554D0 ; =0x00002D5C
	add r1, r4, r5
	ldrsb r0, [r1, r0]
	cmp r0, #0xc
	blt _022553D0
_022553CE:
	b _02255502
_022553D0:
	mov r0, #0x13
	mov r1, #4
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0xd0
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_022553E2:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _022553F4
	lsr r0, r7, #0x1f
	add r0, r7, r0
	asr r7, r0, #1
_022553F4:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _022554C0 ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r7, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _02255502
	ldr r0, _022554D4 ; =0x00002D5D
	add r1, r4, r5
	ldrsb r0, [r1, r0]
	cmp r0, #0xc
	bge _02255502
	mov r0, #0x13
	mov r1, #5
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0xd0
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_0225542A:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _0225543C
	lsr r0, r7, #0x1f
	add r0, r7, r0
	asr r7, r0, #1
_0225543C:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _022554C0 ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r7, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _02255502
	ldr r0, _022554D8 ; =0x00002DB0
	add r1, r4, r5
	ldr r1, [r1, r0]
	mov r0, #1
	lsl r0, r0, #0x14
	tst r0, r1
	bne _02255502
	mov r0, #0xd1
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
	b _02255502
_0225546E:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x52
	bne _02255480
	lsr r0, r7, #0x1f
	add r0, r7, r0
	asr r7, r0, #1
_02255480:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _022554C0 ; =0x00002D90
	add r1, r4, r1
	ldr r0, [r1, r0]
	add r1, r7, #0
	bl _u32_div_f
	ldr r1, [sp, #0x14]
	ldr r1, [r1, r5]
	cmp r1, r0
	bhi _02255502
	ldr r0, _022554C4 ; =0x00002D59
	mov r2, #0
	add r3, r4, r5
_022554A0:
	ldrsb r1, [r3, r0]
	cmp r1, #0xc
	blt _022554AE
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, #5
	blt _022554A0
_022554AE:
	cmp r2, #5
	beq _02255502
	ldr r7, _022554C4 ; =0x00002D59
	b _022554DC
	nop
_022554B8: .word 0x0000215C
_022554BC: .word 0x00002DA8
_022554C0: .word 0x00002D90
_022554C4: .word 0x00002D59
_022554C8: .word 0x00002D5A
_022554CC: .word 0x00002D5B
_022554D0: .word 0x00002D5C
_022554D4: .word 0x00002D5D
_022554D8: .word 0x00002DB0
_022554DC:
	add r5, r4, r5
_022554DE:
	ldr r0, [sp]
	bl ov12_0223BD98
	mov r1, #5
	bl _s32_div_f
	add r0, r5, r1
	ldrsb r0, [r0, r7]
	cmp r0, #0xc
	beq _022554DE
	mov r0, #0x13
	add r1, r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0xd2
	str r0, [r6]
	mov r0, #1
	str r0, [sp, #0xc]
_02255502:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _02255516
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022555EC
	mov r1, #0x4a
	lsl r1, r1, #2
	str r0, [r4, r1]
_02255516:
	ldr r0, [sp, #0xc]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_02254E7C

	thumb_func_start ov12_0225551C
ov12_0225551C: ; 0x0225551C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r4, r2, #0
	mov r6, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02255830
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov12_02255844
	str r0, [sp, #8]
	mov r0, #0xc0
	mul r0, r4
	str r0, [sp]
	add r1, r5, r0
	ldr r0, _022555E0 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022555D8
	cmp r7, #0x64
	beq _0225555A
	cmp r7, #0x65
	beq _02255570
	cmp r7, #0x74
	beq _02255586
	b _022555AE
_0225555A:
	add r0, r5, #0
	add r0, #0x94
	str r4, [r0]
	add r0, r5, #0
	mov r1, #5
	add r0, #0x88
	str r1, [r0]
	mov r0, #0x2f
	str r0, [sp, #4]
	mov r6, #1
	b _022555AE
_02255570:
	add r0, r5, #0
	add r0, #0x94
	str r4, [r0]
	add r0, r5, #0
	mov r1, #5
	add r0, #0x88
	str r1, [r0]
	mov r0, #0x19
	str r0, [sp, #4]
	mov r6, #1
	b _022555AE
_02255586:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_022527CC
	cmp r0, #0x62
	beq _022555AE
	ldr r0, [sp]
	add r1, r5, r0
	ldr r0, _022555E4 ; =0x00002D90
	ldr r1, [r1, r0]
	sub r0, r6, #1
	mul r0, r1
	ldr r1, [sp, #8]
	bl ov12_02253178
	ldr r1, _022555E8 ; =0x0000215C
	mov r6, #1
	str r0, [r5, r1]
	mov r0, #0xd7
	str r0, [sp, #4]
_022555AE:
	cmp r6, #1
	bne _022555D8
	mov r0, #0x46
	lsl r0, r0, #2
	str r4, [r5, r0]
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_022555EC
	mov r1, #0x4a
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r2, [sp, #4]
	add r0, r5, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r5, #8]
	str r0, [r5, #0xc]
	mov r0, #0x16
	str r0, [r5, #8]
_022555D8:
	add r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022555E0: .word 0x00002D8C
_022555E4: .word 0x00002D90
_022555E8: .word 0x0000215C
	thumb_func_end ov12_0225551C

	thumb_func_start ov12_022555EC
ov12_022555EC: ; 0x022555EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov12_022527CC
	cmp r0, #0x67
	bne _022555FE
	mov r0, #0
	pop {r3, r4, r5, pc}
_022555FE:
	mov r0, #0xc0
	mul r0, r4
	add r2, r5, r0
	ldr r0, _02255618 ; =0x00002DCC
	ldr r1, [r2, r0]
	lsl r1, r1, #0xa
	lsr r1, r1, #0x1d
	beq _02255612
	mov r0, #0
	pop {r3, r4, r5, pc}
_02255612:
	sub r0, #0x14
	ldrh r0, [r2, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02255618: .word 0x00002DCC
	thumb_func_end ov12_022555EC

	thumb_func_start ov12_0225561C
ov12_0225561C: ; 0x0225561C
	lsl r1, r1, #4
	add r1, r0, r1
	ldr r0, _02255630 ; =0x000021A8
	ldr r0, [r1, r0]
	cmp r0, #0x28
	bne _0225562C
	mov r0, #1
	bx lr
_0225562C:
	mov r0, #0
	bx lr
	.balign 4, 0
_02255630: .word 0x000021A8
	thumb_func_end ov12_0225561C

	thumb_func_start ov12_02255634
ov12_02255634: ; 0x02255634
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r1, [r5, #0x6c]
	str r0, [sp]
	add r6, r2, #0
	mov r7, #0
	cmp r1, #0xff
	bne _0225564C
	add sp, #0xc
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_0225564C:
	add r0, r5, #0
	bl ov12_02256838
	cmp r0, #1
	bne _0225565C
	add sp, #0xc
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_0225565C:
	ldr r1, [r5, #0x6c]
	add r0, r5, #0
	bl ov12_02255830
	add r4, r0, #0
	ldr r1, [r5, #0x6c]
	add r0, r5, #0
	add r2, r7, #0
	bl ov12_02255844
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r1, [r5, #0x64]
	bl ov12_0223AB1C
	str r0, [sp, #8]
	cmp r4, #0x2f
	bgt _02255692
	cmp r4, #0x2b
	blt _02255690
	bne _02255688
	b _022557C4
_02255688:
	cmp r4, #0x2e
	beq _02255714
	cmp r4, #0x2f
	beq _02255772
_02255690:
	b _0225580A
_02255692:
	cmp r4, #0x74
	bne _022556FC
	ldr r0, [r5, #0x64]
	mov r1, #0xc0
	mul r1, r0
	add r3, r5, r1
	ldr r1, _02255810 ; =0x00002D8C
	ldr r2, [r3, r1]
	cmp r2, #0
	beq _022556FC
	add r1, #0x2c
	ldrh r1, [r3, r1]
	cmp r1, #0
	bne _022556FC
	add r1, r5, r0
	ldr r0, _02255814 ; =0x0000219C
	ldrb r0, [r1, r0]
	bl MaskOfFlagNo
	ldr r1, [sp, #8]
	lsl r1, r1, #3
	add r2, r5, r1
	mov r1, #0x71
	lsl r1, r1, #2
	ldr r2, [r2, r1]
	lsl r2, r2, #3
	lsr r2, r2, #0x1a
	tst r0, r2
	bne _022556FC
	ldr r0, _02255818 ; =0x00003044
	sub r1, #0xaa
	ldr r0, [r5, r0]
	cmp r0, r1
	beq _022556FC
	ldr r2, [r5, #0x6c]
	mov r1, #0x1c
	mul r1, r2
	add r3, r5, r1
	mov r1, #0xb6
	lsl r1, r1, #2
	ldr r2, [r3, r1]
	cmp r2, #0
	bne _022556F0
	add r1, #8
	ldr r1, [r3, r1]
	cmp r1, #0
	beq _022556FC
_022556F0:
	mov r1, #0x85
	lsl r1, r1, #6
	ldr r2, [r5, r1]
	mov r1, #0x10
	tst r1, r2
	beq _022556FE
_022556FC:
	b _0225580A
_022556FE:
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0225581C ; =0x000003E9
	ldrb r1, [r1, r0]
	mov r0, #1
	tst r1, r0
	beq _0225580A
	mov r1, #0xd8
	str r1, [r6]
	add r7, r0, #0
	b _0225580A
_02255714:
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r2, r5, r0
	ldr r0, _02255810 ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0225580A
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x62
	beq _0225580A
	mov r0, #0x85
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #0x10
	tst r0, r1
	bne _0225580A
	ldr r1, [r5, #0x6c]
	mov r0, #0x1c
	mul r0, r1
	add r1, r5, r0
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225580A
	ldr r0, [r5, #0x64]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	ldr r0, _02255820 ; =0x00002D90
	add r2, r5, r2
	ldr r2, [r2, r0]
	sub r1, #0xc1
	add r0, r2, #0
	mul r0, r1
	ldr r1, [sp, #4]
	bl ov12_02253178
	ldr r1, _02255824 ; =0x0000215C
	mov r7, #1
	str r0, [r5, r1]
	lsr r0, r1, #5
	str r0, [r6]
	b _0225580A
_02255772:
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r2, r5, r0
	ldr r0, _02255810 ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0225580A
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x62
	beq _0225580A
	ldr r1, [r5, #0x6c]
	mov r0, #0x1c
	mul r0, r1
	add r1, r5, r0
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225580A
	ldr r0, [r5, #0x64]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	ldr r0, _02255820 ; =0x00002D90
	add r2, r5, r2
	ldr r2, [r2, r0]
	sub r1, #0xc1
	add r0, r2, #0
	mul r0, r1
	ldr r1, [sp, #4]
	bl ov12_02253178
	ldr r1, _02255824 ; =0x0000215C
	mov r7, #1
	str r0, [r5, r1]
	lsr r0, r1, #5
	str r0, [r6]
	b _0225580A
_022557C4:
	ldr r1, [r5, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	ldr r2, _02255810 ; =0x00002D8C
	add r0, r5, r0
	ldr r1, [r0, r2]
	cmp r1, #0
	beq _0225580A
	ldr r1, _02255828 ; =0x0000216C
	ldr r3, [r5, r1]
	mov r1, #2
	tst r1, r3
	beq _0225580A
	add r1, r2, #4
	ldr r0, [r0, r1]
	ldr r1, [sp, #4]
	bl ov12_02253178
	ldr r1, _02255824 ; =0x0000215C
	mov r7, #1
	str r0, [r5, r1]
	mov r1, #0xc6
	str r1, [r6]
	ldr r0, [r5, #0x6c]
	add r1, #0x52
	str r0, [r5, r1]
	ldr r0, [r5, #0x6c]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	ldr r0, _0225582C ; =0x00002DB8
	add r2, r5, r2
	ldrh r0, [r2, r0]
	add r1, #0x68
	str r0, [r5, r1]
_0225580A:
	add r0, r7, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02255810: .word 0x00002D8C
_02255814: .word 0x0000219C
_02255818: .word 0x00003044
_0225581C: .word 0x000003E9
_02255820: .word 0x00002D90
_02255824: .word 0x0000215C
_02255828: .word 0x0000216C
_0225582C: .word 0x00002DB8
	thumb_func_end ov12_02255634

	thumb_func_start ov12_02255830
ov12_02255830: ; 0x02255830
	push {r4, lr}
	add r4, r0, #0
	bl ov12_022555EC
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl ov12_02257E74
	pop {r4, pc}
	thumb_func_end ov12_02255830

	thumb_func_start ov12_02255844
ov12_02255844: ; 0x02255844
	push {r4, lr}
	add r4, r0, #0
	cmp r2, #0
	beq _02255856
	cmp r2, #1
	beq _02255872
	cmp r2, #2
	beq _0225585E
	b _0225587C
_02255856:
	bl ov12_022555EC
	add r1, r0, #0
	b _0225587C
_0225585E:
	mov r0, #0xc0
	mul r0, r1
	add r2, r4, r0
	ldr r0, _02255888 ; =0x00002DCC
	ldr r0, [r2, r0]
	lsl r0, r0, #0xa
	lsr r0, r0, #0x1d
	beq _02255872
	mov r0, #0
	pop {r4, pc}
_02255872:
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0225588C ; =0x00002DB8
	ldrh r1, [r1, r0]
_0225587C:
	add r0, r4, #0
	mov r2, #2
	bl ov12_02257E74
	pop {r4, pc}
	nop
_02255888: .word 0x00002DCC
_0225588C: .word 0x00002DB8
	thumb_func_end ov12_02255844

	thumb_func_start ov12_02255890
ov12_02255890: ; 0x02255890
	push {r4, lr}
	add r4, r0, #0
	bl ov12_022555EC
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0xb
	bl ov12_02257E74
	pop {r4, pc}
	thumb_func_end ov12_02255890

	thumb_func_start ov12_022558A4
ov12_022558A4: ; 0x022558A4
	push {r4, lr}
	add r4, r0, #0
	bl ov12_022555EC
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0xc
	bl ov12_02257E74
	pop {r4, pc}
	thumb_func_end ov12_022558A4

	thumb_func_start ov12_022558B8
ov12_022558B8: ; 0x022558B8
	mov r2, #0xc0
	mul r2, r1
	ldr r1, _022558C8 ; =0x00002DB8
	add r2, r0, r2
	ldrh r1, [r2, r1]
	ldr r3, _022558CC ; =ov12_02257E74
	mov r2, #8
	bx r3
	.balign 4, 0
_022558C8: .word 0x00002DB8
_022558CC: .word ov12_02257E74
	thumb_func_end ov12_022558B8

	thumb_func_start ov12_022558D0
ov12_022558D0: ; 0x022558D0
	push {r3, lr}
	mov r2, #0xc0
	mul r2, r1
	ldr r1, _022558F4 ; =0x00002DCC
	add r3, r0, r2
	ldr r2, [r3, r1]
	lsl r2, r2, #0xa
	lsr r2, r2, #0x1d
	beq _022558E6
	mov r0, #0
	pop {r3, pc}
_022558E6:
	sub r1, #0x14
	ldrh r1, [r3, r1]
	mov r2, #9
	bl ov12_02257E74
	pop {r3, pc}
	nop
_022558F4: .word 0x00002DCC
	thumb_func_end ov12_022558D0

	thumb_func_start ov12_022558F8
ov12_022558F8: ; 0x022558F8
	push {r3, lr}
	mov r2, #0xc0
	mul r2, r1
	ldr r1, _0225591C ; =0x00002DCC
	add r3, r0, r2
	ldr r2, [r3, r1]
	lsl r2, r2, #0xa
	lsr r2, r2, #0x1d
	beq _0225590E
	mov r0, #0
	pop {r3, pc}
_0225590E:
	sub r1, #0x14
	ldrh r1, [r3, r1]
	mov r2, #0xa
	bl ov12_02257E74
	pop {r3, pc}
	nop
_0225591C: .word 0x00002DCC
	thumb_func_end ov12_022558F8

	thumb_func_start ov12_02255920
ov12_02255920: ; 0x02255920
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r2, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	mov r6, #0
	bl ov12_02255830
	cmp r0, #0x7b
	bne _0225593E
	add sp, #8
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225593E:
	mov r0, #0xc0
	add r7, r4, #0
	mul r7, r0
	ldr r0, _02255A20 ; =0x00002DB0
	add r2, r5, r7
	ldr r1, [r2, r0]
	ldr r3, _02255A24 ; =0x0400E000
	tst r1, r3
	bne _0225595A
	add r0, #0x10
	ldr r1, [r2, r0]
	lsr r0, r3, #0x10
	tst r0, r1
	beq _0225595C
_0225595A:
	mov r6, #1
_0225595C:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_022527CC
	cmp r0, #0x17
	beq _0225597C
	mov r0, #0x17
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #3
	add r3, r4, #0
	bl ov12_02252324
	cmp r0, #0
	bne _022559B0
_0225597C:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x1b
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #8
	beq _0225599C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x1c
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #8
	bne _022559B2
_0225599C:
	mov r0, #0x2a
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #3
	add r3, r4, #0
	bl ov12_02252324
	cmp r0, #0
	beq _022559B2
_022559B0:
	mov r6, #1
_022559B2:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_022527CC
	cmp r0, #0x1a
	beq _022559EA
	ldr r0, _02255A28 ; =0x00002DCC
	add r1, r5, r7
	ldr r0, [r1, r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1d
	bne _022559EA
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x1b
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #2
	beq _022559EA
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x1c
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #2
	bne _02255A04
_022559EA:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02255830
	cmp r0, #0x6a
	beq _02255A04
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #7
	lsl r0, r0, #0xc
	tst r0, r1
	beq _02255A1A
_02255A04:
	mov r0, #0x47
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #3
	add r3, r4, #0
	bl ov12_02252324
	cmp r0, #0
	beq _02255A1A
	mov r6, #1
_02255A1A:
	add r0, r6, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02255A20: .word 0x00002DB0
_02255A24: .word 0x0400E000
_02255A28: .word 0x00002DCC
	thumb_func_end ov12_02255920

	thumb_func_start ov12_02255A2C
ov12_02255A2C: ; 0x02255A2C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r1, #0
	str r0, [sp]
	mov r6, #0
	str r2, [sp, #4]
	add r0, r4, #0
	add r1, r2, #0
	add r5, r6, #0
	bl ov12_022558B8
	add r7, r0, #0
	ldr r1, [sp, #4]
	add r0, r4, #0
	mov r2, #1
	bl ov12_02255844
	str r0, [sp, #0x10]
	ldr r1, [r4, #0x6c]
	add r0, r4, #0
	bl ov12_02256838
	cmp r0, #1
	bne _02255A62
	add sp, #0x14
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_02255A62:
	cmp r7, #0x17
	bls _02255A68
	b _02255EE2
_02255A68:
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02255A74: ; jump table
	.short _02255EE2 - _02255A74 - 2 ; case 0
	.short _02255AEE - _02255A74 - 2 ; case 1
	.short _02255B06 - _02255A74 - 2 ; case 2
	.short _02255B1E - _02255A74 - 2 ; case 3
	.short _02255B36 - _02255A74 - 2 ; case 4
	.short _02255B4E - _02255A74 - 2 ; case 5
	.short _02255B66 - _02255A74 - 2 ; case 6
	.short _02255AA4 - _02255A74 - 2 ; case 7
	.short _02255BDC - _02255A74 - 2 ; case 8
	.short _02255BF4 - _02255A74 - 2 ; case 9
	.short _02255AC4 - _02255A74 - 2 ; case 10
	.short _02255C56 - _02255A74 - 2 ; case 11
	.short _02255C9C - _02255A74 - 2 ; case 12
	.short _02255CE2 - _02255A74 - 2 ; case 13
	.short _02255D28 - _02255A74 - 2 ; case 14
	.short _02255D6E - _02255A74 - 2 ; case 15
	.short _02255DDE - _02255A74 - 2 ; case 16
	.short _02255DFC - _02255A74 - 2 ; case 17
	.short _02255E1A - _02255A74 - 2 ; case 18
	.short _02255E38 - _02255A74 - 2 ; case 19
	.short _02255E56 - _02255A74 - 2 ; case 20
	.short _02255EC2 - _02255A74 - 2 ; case 21
	.short _02255E74 - _02255A74 - 2 ; case 22
	.short _02255EDC - _02255A74 - 2 ; case 23
_02255AA4:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r2, r4, r0
	ldr r0, _02255DA0 ; =0x00002D8C
	ldr r1, [r2, r0]
	add r0, r0, #4
	ldr r0, [r2, r0]
	cmp r1, r0
	beq _02255AC0
	ldr r1, _02255DA4 ; =0x0000215C
	ldr r0, [sp, #0x10]
	mov r5, #0xc6
	str r0, [r4, r1]
_02255AC0:
	mov r6, #1
	b _02255EF8
_02255AC4:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _02255DA8 ; =0x00002D90
	ldr r2, [r1, r0]
	sub r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, r2
	beq _02255AEA
	ldr r1, [sp, #0x10]
	add r0, r1, #0
	mul r0, r2
	mov r1, #0x64
	bl ov12_02253178
	ldr r1, _02255DA4 ; =0x0000215C
	mov r5, #0xc6
	str r0, [r4, r1]
_02255AEA:
	mov r6, #1
	b _02255EF8
_02255AEE:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _02255DAC ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #0x40
	tst r0, r1
	beq _02255B02
	mov r5, #0xc7
_02255B02:
	mov r6, #1
	b _02255EF8
_02255B06:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _02255DAC ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #7
	tst r0, r1
	beq _02255B1A
	mov r5, #0xc8
_02255B1A:
	mov r6, #1
	b _02255EF8
_02255B1E:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _02255DAC ; =0x00002DAC
	ldr r1, [r1, r0]
	ldr r0, _02255DB0 ; =0x00000F88
	tst r0, r1
	beq _02255B32
	mov r5, #0xc9
_02255B32:
	mov r6, #1
	b _02255EF8
_02255B36:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _02255DAC ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #0x10
	tst r0, r1
	beq _02255B4A
	mov r5, #0xca
_02255B4A:
	mov r6, #1
	b _02255EF8
_02255B4E:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _02255DAC ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #0x20
	tst r0, r1
	beq _02255B62
	mov r5, #0xcb
_02255B62:
	mov r6, #1
	b _02255EF8
_02255B66:
	str r5, [sp, #0xc]
_02255B68:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	add r7, r1, #0
	mul r7, r0
	add r1, r4, r7
	ldr r0, _02255DB4 ; =0x00002D4C
	add r2, r6, r1
	ldrh r0, [r2, r0]
	cmp r0, #0
	beq _02255B9A
	add r2, r5, r1
	ldr r1, _02255DB8 ; =0x00002D70
	ldrb r1, [r2, r1]
	bl WazaGetMaxPp
	add r1, r4, r7
	add r2, r5, r1
	ldr r1, _02255DBC ; =0x00002D6C
	ldrb r1, [r2, r1]
	sub r1, r0, r1
	ldr r0, [sp, #0xc]
	cmp r1, r0
	ble _02255B9A
	str r1, [sp, #0xc]
	str r5, [sp, #8]
_02255B9A:
	add r5, r5, #1
	add r6, r6, #2
	cmp r5, #4
	blt _02255B68
	mov r0, #0xb5
	lsl r0, r0, #6
	ldr r1, [sp, #8]
	add r0, r4, r0
	ldr r2, [sp, #0x10]
	add r0, r0, r7
	add r1, #0x1f
	bl ov12_0224F7AC
	ldr r0, [sp]
	ldr r2, [r4, #0x64]
	add r1, r4, #0
	bl ov12_02250C40
	ldr r0, [r4, #0x64]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	ldr r0, [sp, #8]
	add r2, r4, r2
	lsl r0, r0, #1
	add r2, r2, r0
	ldr r0, _02255DB4 ; =0x00002D4C
	add r1, #0x64
	ldrh r0, [r2, r0]
	mov r5, #0xcc
	mov r6, #1
	str r0, [r4, r1]
	b _02255EF8
_02255BDC:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _02255DC0 ; =0x00002DB0
	ldr r1, [r1, r0]
	mov r0, #7
	tst r0, r1
	beq _02255BF0
	mov r5, #0xcd
_02255BF0:
	mov r6, #1
	b _02255EF8
_02255BF4:
	ldr r2, [r4, #0x64]
	mov r0, #0xc0
	add r1, r2, #0
	mul r1, r0
	ldr r6, _02255DAC ; =0x00002DAC
	add r0, r4, r1
	ldr r2, [r0, r6]
	lsl r3, r2, #0x18
	lsr r3, r3, #0x18
	bne _02255C12
	add r6, r6, #4
	ldr r6, [r0, r6]
	mov r0, #7
	tst r0, r6
	beq _02255C52
_02255C12:
	mov r0, #0x40
	tst r0, r2
	beq _02255C1A
	mov r5, #0xc7
_02255C1A:
	mov r0, #7
	tst r0, r2
	beq _02255C22
	mov r5, #0xc8
_02255C22:
	ldr r0, _02255DB0 ; =0x00000F88
	tst r0, r2
	beq _02255C2A
	mov r5, #0xc9
_02255C2A:
	mov r0, #0x10
	tst r0, r2
	beq _02255C32
	mov r5, #0xca
_02255C32:
	mov r0, #0x20
	tst r0, r2
	beq _02255C3A
	mov r5, #0xcb
_02255C3A:
	ldr r0, _02255DC0 ; =0x00002DB0
	add r1, r4, r1
	ldr r1, [r1, r0]
	mov r0, #7
	and r0, r1
	beq _02255C48
	mov r5, #0xcd
_02255C48:
	cmp r3, #0
	beq _02255C52
	cmp r0, #0
	beq _02255C52
	mov r5, #0xce
_02255C52:
	mov r6, #1
	b _02255EF8
_02255C56:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _02255DA8 ; =0x00002D90
	add r2, r4, r0
	ldr r0, [r2, r1]
	sub r1, r1, #4
	ldr r1, [r2, r1]
	cmp r1, r0
	beq _02255C98
	ldr r1, [sp, #0x10]
	bl ov12_02253178
	ldr r1, _02255DA4 ; =0x0000215C
	str r0, [r4, r1]
	mov r0, #0x13
	add r1, r6, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r2, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r2
	add r2, r4, r0
	ldr r0, _02255DC4 ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	sub r1, r6, #1
	cmp r0, r1
	bne _02255C96
	mov r5, #0xcf
	b _02255C98
_02255C96:
	mov r5, #0xc6
_02255C98:
	mov r6, #1
	b _02255EF8
_02255C9C:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _02255DA8 ; =0x00002D90
	add r2, r4, r0
	ldr r0, [r2, r1]
	sub r1, r1, #4
	ldr r1, [r2, r1]
	cmp r1, r0
	beq _02255CDE
	ldr r1, [sp, #0x10]
	bl ov12_02253178
	ldr r1, _02255DA4 ; =0x0000215C
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r2, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r2
	add r2, r4, r0
	ldr r0, _02255DC4 ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	sub r1, r6, #1
	cmp r0, r1
	bne _02255CDC
	mov r5, #0xcf
	b _02255CDE
_02255CDC:
	mov r5, #0xc6
_02255CDE:
	mov r6, #1
	b _02255EF8
_02255CE2:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _02255DA8 ; =0x00002D90
	add r2, r4, r0
	ldr r0, [r2, r1]
	sub r1, r1, #4
	ldr r1, [r2, r1]
	cmp r1, r0
	beq _02255D24
	ldr r1, [sp, #0x10]
	bl ov12_02253178
	ldr r1, _02255DA4 ; =0x0000215C
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #2
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r2, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r2
	add r2, r4, r0
	ldr r0, _02255DC4 ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	sub r1, r6, #1
	cmp r0, r1
	bne _02255D22
	mov r5, #0xcf
	b _02255D24
_02255D22:
	mov r5, #0xc6
_02255D24:
	mov r6, #1
	b _02255EF8
_02255D28:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _02255DA8 ; =0x00002D90
	add r2, r4, r0
	ldr r0, [r2, r1]
	sub r1, r1, #4
	ldr r1, [r2, r1]
	cmp r1, r0
	beq _02255D6A
	ldr r1, [sp, #0x10]
	bl ov12_02253178
	ldr r1, _02255DA4 ; =0x0000215C
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #3
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r2, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r2
	add r2, r4, r0
	ldr r0, _02255DC4 ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	sub r1, r6, #1
	cmp r0, r1
	bne _02255D68
	mov r5, #0xcf
	b _02255D6A
_02255D68:
	mov r5, #0xc6
_02255D6A:
	mov r6, #1
	b _02255EF8
_02255D6E:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _02255DA8 ; =0x00002D90
	add r2, r4, r0
	ldr r0, [r2, r1]
	sub r1, r1, #4
	ldr r1, [r2, r1]
	cmp r1, r0
	beq _02255DDA
	ldr r1, [sp, #0x10]
	bl ov12_02253178
	ldr r1, _02255DA4 ; =0x0000215C
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #4
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r2, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r2
	add r2, r4, r0
	ldr r0, _02255DC4 ; =0x00002DA8
	b _02255DC8
	.balign 4, 0
_02255DA0: .word 0x00002D8C
_02255DA4: .word 0x0000215C
_02255DA8: .word 0x00002D90
_02255DAC: .word 0x00002DAC
_02255DB0: .word 0x00000F88
_02255DB4: .word 0x00002D4C
_02255DB8: .word 0x00002D70
_02255DBC: .word 0x00002D6C
_02255DC0: .word 0x00002DB0
_02255DC4: .word 0x00002DA8
_02255DC8:
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	sub r1, r6, #1
	cmp r0, r1
	bne _02255DD8
	mov r5, #0xcf
	b _02255DDA
_02255DD8:
	mov r5, #0xc6
_02255DDA:
	mov r6, #1
	b _02255EF8
_02255DDE:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	ldr r1, _02255F5C ; =0x00002D59
	add r2, r4, r2
	ldrsb r1, [r2, r1]
	cmp r1, #0xc
	bge _02255DF8
	mov r1, #1
	add r0, #0x70
	str r1, [r4, r0]
	mov r5, #0xd0
_02255DF8:
	mov r6, #1
	b _02255EF8
_02255DFC:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	ldr r1, _02255F60 ; =0x00002D5A
	add r2, r4, r2
	ldrsb r1, [r2, r1]
	cmp r1, #0xc
	bge _02255E16
	mov r1, #2
	add r0, #0x70
	str r1, [r4, r0]
	mov r5, #0xd0
_02255E16:
	mov r6, #1
	b _02255EF8
_02255E1A:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	ldr r1, _02255F64 ; =0x00002D5B
	add r2, r4, r2
	ldrsb r1, [r2, r1]
	cmp r1, #0xc
	bge _02255E34
	mov r1, #3
	add r0, #0x70
	str r1, [r4, r0]
	mov r5, #0xd0
_02255E34:
	mov r6, #1
	b _02255EF8
_02255E38:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	ldr r1, _02255F68 ; =0x00002D5C
	add r2, r4, r2
	ldrsb r1, [r2, r1]
	cmp r1, #0xc
	bge _02255E52
	mov r1, #4
	add r0, #0x70
	str r1, [r4, r0]
	mov r5, #0xd0
_02255E52:
	mov r6, #1
	b _02255EF8
_02255E56:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	ldr r1, _02255F6C ; =0x00002D5D
	add r2, r4, r2
	ldrsb r1, [r2, r1]
	cmp r1, #0xc
	bge _02255E70
	mov r1, #5
	add r0, #0x70
	str r1, [r4, r0]
	mov r5, #0xd0
_02255E70:
	mov r6, #1
	b _02255EF8
_02255E74:
	ldr r2, [r4, #0x64]
	mov r1, #0xc0
	mul r1, r2
	add r3, r4, r1
	ldr r1, _02255F5C ; =0x00002D59
	add r0, r6, #0
_02255E80:
	ldrsb r2, [r3, r1]
	cmp r2, #0xc
	blt _02255E8E
	add r0, r0, #1
	add r3, r3, #1
	cmp r0, #5
	blt _02255E80
_02255E8E:
	cmp r0, #5
	beq _02255EBE
	ldr r5, _02255F5C ; =0x00002D59
	mov r7, #5
	mov r6, #0xc0
_02255E98:
	ldr r0, [sp]
	bl ov12_0223BD98
	add r1, r7, #0
	bl _s32_div_f
	ldr r0, [r4, #0x64]
	add r2, r0, #0
	mul r2, r6
	add r0, r4, r2
	add r0, r1, r0
	ldrsb r0, [r0, r5]
	cmp r0, #0xc
	beq _02255E98
	mov r0, #0x13
	add r1, r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r5, #0xd2
_02255EBE:
	mov r6, #1
	b _02255EF8
_02255EC2:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _02255F70 ; =0x00002DB0
	ldr r1, [r1, r0]
	mov r0, #1
	lsl r0, r0, #0x14
	tst r0, r1
	bne _02255ED8
	mov r5, #0xd1
_02255ED8:
	mov r6, #1
	b _02255EF8
_02255EDC:
	ldr r5, _02255F74 ; =0x00000109
	mov r6, #1
	b _02255EF8
_02255EE2:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _02255F78 ; =0x00002DB8
	add r1, r4, r1
	ldrh r0, [r1, r0]
	bl ItemIdIsBerry
	cmp r0, #1
	bne _02255EF8
	mov r6, #1
_02255EF8:
	cmp r6, #1
	bne _02255F56
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl ov12_022527CC
	cmp r0, #0x67
	beq _02255F20
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	mov r1, #0xb7
	add r2, r4, r2
	lsl r1, r1, #6
	ldr r2, [r2, r1]
	mov r1, #1
	lsl r1, r1, #0x1a
	tst r1, r2
	beq _02255F2A
_02255F20:
	mov r0, #0x4e
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _02255F2E
_02255F2A:
	add r0, #0x78
	str r5, [r4, r0]
_02255F2E:
	ldr r0, [sp, #4]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	ldr r0, _02255F78 ; =0x00002DB8
	add r2, r4, r2
	ldrh r0, [r2, r0]
	add r1, #0x68
	str r0, [r4, r1]
	ldr r2, [r4, #0x64]
	mov r0, #0xba
	lsl r0, r0, #2
	mov r1, #0x1c
	add r3, r2, #0
	mul r3, r1
	add r0, r4, r0
	ldr r2, [r0, r3]
	mov r1, #2
	orr r1, r2
	str r1, [r0, r3]
_02255F56:
	add r0, r6, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02255F5C: .word 0x00002D59
_02255F60: .word 0x00002D5A
_02255F64: .word 0x00002D5B
_02255F68: .word 0x00002D5C
_02255F6C: .word 0x00002D5D
_02255F70: .word 0x00002DB0
_02255F74: .word 0x00000109
_02255F78: .word 0x00002DB8
	thumb_func_end ov12_02255A2C

	thumb_func_start ov12_02255F7C
ov12_02255F7C: ; 0x02255F7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r1, #0
	str r0, [sp]
	str r2, [sp, #4]
	add r0, r4, #0
	add r1, r2, #0
	bl ov12_022558D0
	add r6, r0, #0
	ldr r1, [sp, #4]
	add r0, r4, #0
	mov r2, #2
	bl ov12_02255844
	str r0, [sp, #0x10]
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022558F8
	ldr r1, _022562D0 ; =0x00002154
	add r2, r4, #0
	str r0, [r4, r1]
	ldr r0, _022562D4 ; =0x00003118
	mov r5, #0
	str r5, [r4, r0]
	add r2, #0x88
	str r5, [r2]
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _02255FC0
	add sp, #0x14
	add r0, r5, #0
	pop {r4, r5, r6, r7, pc}
_02255FC0:
	cmp r6, #0x1e
	bls _02255FC6
	b _0225654A
_02255FC6:
	add r1, r6, r6
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02255FD2: ; jump table
	.short _0225654A - _02255FD2 - 2 ; case 0
	.short _0225603E - _02255FD2 - 2 ; case 1
	.short _02256056 - _02255FD2 - 2 ; case 2
	.short _0225606E - _02255FD2 - 2 ; case 3
	.short _02256086 - _02255FD2 - 2 ; case 4
	.short _0225609E - _02255FD2 - 2 ; case 5
	.short _022560B6 - _02255FD2 - 2 ; case 6
	.short _02256010 - _02255FD2 - 2 ; case 7
	.short _02256138 - _02255FD2 - 2 ; case 8
	.short _02256150 - _02255FD2 - 2 ; case 9
	.short _0225601C - _02255FD2 - 2 ; case 10
	.short _02256216 - _02255FD2 - 2 ; case 11
	.short _02256258 - _02255FD2 - 2 ; case 12
	.short _0225629A - _02255FD2 - 2 ; case 13
	.short _0225630A - _02255FD2 - 2 ; case 14
	.short _0225634C - _02255FD2 - 2 ; case 15
	.short _02256448 - _02255FD2 - 2 ; case 16
	.short _02256466 - _02255FD2 - 2 ; case 17
	.short _02256484 - _02255FD2 - 2 ; case 18
	.short _022564A2 - _02255FD2 - 2 ; case 19
	.short _022564C0 - _02255FD2 - 2 ; case 20
	.short _0225652C - _02255FD2 - 2 ; case 21
	.short _022564DE - _02255FD2 - 2 ; case 22
	.short _02256546 - _02255FD2 - 2 ; case 23
	.short _0225638E - _02255FD2 - 2 ; case 24
	.short _022563B6 - _02255FD2 - 2 ; case 25
	.short _022563DA - _02255FD2 - 2 ; case 26
	.short _022563F0 - _02255FD2 - 2 ; case 27
	.short _02256406 - _02255FD2 - 2 ; case 28
	.short _0225641C - _02255FD2 - 2 ; case 29
	.short _02256432 - _02255FD2 - 2 ; case 30
_02256010:
	ldr r1, [sp, #0x10]
	sub r2, r0, #4
	str r1, [r4, r2]
	mov r1, #0xc6
	str r1, [r4, r0]
	b _0225654A
_0225601C:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _022562D8 ; =0x00002D90
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x10]
	mul r0, r1
	mov r1, #0x64
	bl ov12_02253178
	ldr r1, _022562DC ; =0x00003114
	mov r2, #0xc6
	str r0, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	b _0225654A
_0225603E:
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	mul r1, r2
	add r2, r4, r1
	ldr r1, _022562E0 ; =0x00002DAC
	ldr r2, [r2, r1]
	mov r1, #0x40
	tst r1, r2
	beq _022560F8
	mov r1, #0xc7
	str r1, [r4, r0]
	b _0225654A
_02256056:
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	mul r1, r2
	add r2, r4, r1
	ldr r1, _022562E0 ; =0x00002DAC
	ldr r2, [r2, r1]
	mov r1, #7
	tst r1, r2
	beq _022560F8
	mov r1, #0xc8
	str r1, [r4, r0]
	b _0225654A
_0225606E:
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	mul r1, r2
	add r2, r4, r1
	ldr r1, _022562E0 ; =0x00002DAC
	ldr r2, [r2, r1]
	ldr r1, _022562E4 ; =0x00000F88
	tst r1, r2
	beq _022560F8
	mov r1, #0xc9
	str r1, [r4, r0]
	b _0225654A
_02256086:
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	mul r1, r2
	add r2, r4, r1
	ldr r1, _022562E0 ; =0x00002DAC
	ldr r2, [r2, r1]
	mov r1, #0x10
	tst r1, r2
	beq _022560F8
	mov r1, #0xca
	str r1, [r4, r0]
	b _0225654A
_0225609E:
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	mul r1, r2
	add r2, r4, r1
	ldr r1, _022562E0 ; =0x00002DAC
	ldr r2, [r2, r1]
	mov r1, #0x20
	tst r1, r2
	beq _022560F8
	mov r1, #0xcb
	str r1, [r4, r0]
	b _0225654A
_022560B6:
	add r6, r5, #0
	add r7, r5, #0
_022560BA:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	str r0, [sp, #8]
	ldr r0, _022562E8 ; =0x00002D4C
	add r2, r7, r1
	ldrh r0, [r2, r0]
	cmp r0, #0
	beq _022560EC
	add r2, r6, r1
	ldr r1, _022562EC ; =0x00002D70
	ldrb r1, [r2, r1]
	bl WazaGetMaxPp
	ldr r1, [sp, #8]
	add r1, r4, r1
	add r2, r6, r1
	ldr r1, _022562F0 ; =0x00002D6C
	ldrb r1, [r2, r1]
	sub r0, r0, r1
	cmp r0, r5
	ble _022560EC
	add r5, r0, #0
	str r6, [sp, #0xc]
_022560EC:
	add r6, r6, #1
	add r7, r7, #2
	cmp r6, #4
	blt _022560BA
	cmp r5, #0
	bne _022560FA
_022560F8:
	b _0225654A
_022560FA:
	mov r0, #0xb5
	lsl r0, r0, #6
	add r1, r4, r0
	ldr r0, [sp, #8]
	ldr r2, [sp, #0x10]
	add r0, r1, r0
	ldr r1, [sp, #0xc]
	add r1, #0x1f
	bl ov12_0224F7AC
	ldr r0, [sp]
	ldr r2, [r4, #0x6c]
	add r1, r4, #0
	bl ov12_02250C40
	ldr r0, [r4, #0x6c]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	ldr r0, [sp, #0xc]
	add r2, r4, r2
	lsl r0, r0, #1
	add r2, r2, r0
	ldr r0, _022562E8 ; =0x00002D4C
	add r1, #0x64
	ldrh r0, [r2, r0]
	str r0, [r4, r1]
	ldr r0, _022562D4 ; =0x00003118
	mov r1, #0xcc
	str r1, [r4, r0]
	b _0225654A
_02256138:
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	mul r1, r2
	add r2, r4, r1
	ldr r1, _022562F4 ; =0x00002DB0
	ldr r2, [r2, r1]
	mov r1, #7
	tst r1, r2
	beq _0225620C
	mov r1, #0xcd
	str r1, [r4, r0]
	b _0225654A
_02256150:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _022562E0 ; =0x00002DAC
	add r3, r4, r0
	ldr r0, [r3, r1]
	lsl r2, r0, #0x18
	lsr r2, r2, #0x18
	bne _0225616C
	add r1, r1, #4
	ldr r2, [r3, r1]
	mov r1, #7
	tst r1, r2
	beq _0225620C
_0225616C:
	mov r1, #0x40
	tst r0, r1
	beq _02256178
	ldr r0, _022562D4 ; =0x00003118
	mov r1, #0xc7
	str r1, [r4, r0]
_02256178:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _022562E0 ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #7
	tst r0, r1
	beq _02256190
	ldr r0, _022562D4 ; =0x00003118
	mov r1, #0xc8
	str r1, [r4, r0]
_02256190:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _022562E0 ; =0x00002DAC
	ldr r1, [r1, r0]
	ldr r0, _022562E4 ; =0x00000F88
	tst r0, r1
	beq _022561A8
	ldr r0, _022562D4 ; =0x00003118
	mov r1, #0xc9
	str r1, [r4, r0]
_022561A8:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _022562E0 ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #0x10
	tst r0, r1
	beq _022561C0
	ldr r0, _022562D4 ; =0x00003118
	mov r1, #0xca
	str r1, [r4, r0]
_022561C0:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _022562E0 ; =0x00002DAC
	ldr r1, [r1, r0]
	mov r0, #0x20
	tst r0, r1
	beq _022561D8
	ldr r0, _022562D4 ; =0x00003118
	mov r1, #0xcb
	str r1, [r4, r0]
_022561D8:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _022562F4 ; =0x00002DB0
	ldr r1, [r1, r0]
	mov r0, #7
	tst r0, r1
	beq _022561F0
	ldr r0, _022562D4 ; =0x00003118
	mov r1, #0xcd
	str r1, [r4, r0]
_022561F0:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r2, r4, r0
	ldr r0, _022562E0 ; =0x00002DAC
	ldr r1, [r2, r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	beq _0225620C
	add r0, r0, #4
	ldr r1, [r2, r0]
	mov r0, #7
	tst r0, r1
	bne _0225620E
_0225620C:
	b _0225654A
_0225620E:
	ldr r0, _022562D4 ; =0x00003118
	mov r1, #0xce
	str r1, [r4, r0]
	b _0225654A
_02256216:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _022562D8 ; =0x00002D90
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x10]
	bl ov12_02253178
	ldr r1, _022562DC ; =0x00003114
	str r0, [r4, r1]
	mov r0, #0x13
	add r1, r5, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r2, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r2
	add r2, r4, r0
	ldr r0, _022562F8 ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	sub r1, r5, #1
	cmp r0, r1
	ldr r0, _022562D4 ; =0x00003118
	bne _02256252
	mov r1, #0xcf
	str r1, [r4, r0]
	b _0225654A
_02256252:
	mov r1, #0xc6
	str r1, [r4, r0]
	b _0225654A
_02256258:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _022562D8 ; =0x00002D90
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x10]
	bl ov12_02253178
	ldr r1, _022562DC ; =0x00003114
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r2, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r2
	add r2, r4, r0
	ldr r0, _022562F8 ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	sub r1, r5, #1
	cmp r0, r1
	ldr r0, _022562D4 ; =0x00003118
	bne _02256294
	mov r1, #0xcf
	str r1, [r4, r0]
	b _0225654A
_02256294:
	mov r1, #0xc6
	str r1, [r4, r0]
	b _0225654A
_0225629A:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _022562D8 ; =0x00002D90
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x10]
	bl ov12_02253178
	ldr r1, _022562DC ; =0x00003114
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #2
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r2, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r2
	add r2, r4, r0
	ldr r0, _022562F8 ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	sub r1, r5, #1
	cmp r0, r1
	ldr r0, _022562D4 ; =0x00003118
	b _022562FC
	.balign 4, 0
_022562D0: .word 0x00002154
_022562D4: .word 0x00003118
_022562D8: .word 0x00002D90
_022562DC: .word 0x00003114
_022562E0: .word 0x00002DAC
_022562E4: .word 0x00000F88
_022562E8: .word 0x00002D4C
_022562EC: .word 0x00002D70
_022562F0: .word 0x00002D6C
_022562F4: .word 0x00002DB0
_022562F8: .word 0x00002DA8
_022562FC:
	bne _02256304
	mov r1, #0xcf
	str r1, [r4, r0]
	b _0225654A
_02256304:
	mov r1, #0xc6
	str r1, [r4, r0]
	b _0225654A
_0225630A:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _022565B0 ; =0x00002D90
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x10]
	bl ov12_02253178
	ldr r1, _022565B4 ; =0x00003114
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #3
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r2, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r2
	add r2, r4, r0
	ldr r0, _022565B8 ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	sub r1, r5, #1
	cmp r0, r1
	ldr r0, _022565BC ; =0x00003118
	bne _02256346
	mov r1, #0xcf
	str r1, [r4, r0]
	b _0225654A
_02256346:
	mov r1, #0xc6
	str r1, [r4, r0]
	b _0225654A
_0225634C:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _022565B0 ; =0x00002D90
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x10]
	bl ov12_02253178
	ldr r1, _022565B4 ; =0x00003114
	str r0, [r4, r1]
	mov r0, #0x13
	mov r1, #4
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r2, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r2
	add r2, r4, r0
	ldr r0, _022565B8 ; =0x00002DA8
	ldr r0, [r2, r0]
	bl GetFlavorPreferenceFromPID
	sub r1, r5, #1
	cmp r0, r1
	ldr r0, _022565BC ; =0x00003118
	bne _02256388
	mov r1, #0xcf
	str r1, [r4, r0]
	b _0225654A
_02256388:
	mov r1, #0xc6
	str r1, [r4, r0]
	b _0225654A
_0225638E:
	ldr r2, _022565C0 ; =0x00002D58
	mov r6, #6
	mov r3, #0xd3
	mov r7, #0xc0
_02256396:
	ldr r0, [r4, #0x6c]
	add r1, r0, #0
	mul r1, r7
	add r0, r4, r1
	add r0, r0, r5
	ldrsb r1, [r0, r2]
	cmp r1, #6
	bge _022563AE
	ldr r1, _022565C0 ; =0x00002D58
	strb r6, [r0, r1]
	ldr r0, _022565BC ; =0x00003118
	str r3, [r4, r0]
_022563AE:
	add r5, r5, #1
	cmp r5, #8
	blt _02256396
	b _0225654A
_022563B6:
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	add r3, r2, #0
	mul r3, r1
	ldr r2, _022565C4 ; =0x00002DB0
	add r3, r4, r3
	ldr r3, [r3, r2]
	mov r2, #0xf
	lsl r2, r2, #0x10
	tst r2, r3
	bne _022563CE
	b _0225654A
_022563CE:
	mov r2, #6
	add r1, #0x70
	str r2, [r4, r1]
	mov r1, #0xd4
	str r1, [r4, r0]
	b _0225654A
_022563DA:
	add r2, r4, #0
	ldr r1, [sp, #4]
	add r2, #0x94
	str r1, [r2]
	add r1, r4, #0
	mov r2, #2
	add r1, #0x88
	str r2, [r1]
	mov r1, #0xe
	str r1, [r4, r0]
	b _0225654A
_022563F0:
	add r2, r4, #0
	ldr r1, [sp, #4]
	add r2, #0x94
	str r1, [r2]
	add r1, r4, #0
	mov r2, #2
	add r1, #0x88
	str r2, [r1]
	mov r1, #0x1f
	str r1, [r4, r0]
	b _0225654A
_02256406:
	add r2, r4, #0
	ldr r1, [sp, #4]
	add r2, #0x94
	str r1, [r2]
	add r1, r4, #0
	mov r2, #2
	add r1, #0x88
	str r2, [r1]
	mov r1, #0x16
	str r1, [r4, r0]
	b _0225654A
_0225641C:
	add r2, r4, #0
	ldr r1, [sp, #4]
	add r2, #0x94
	str r1, [r2]
	add r1, r4, #0
	mov r2, #2
	add r1, #0x88
	str r2, [r1]
	mov r1, #0x2f
	str r1, [r4, r0]
	b _0225654A
_02256432:
	add r2, r4, #0
	ldr r1, [sp, #4]
	add r2, #0x94
	str r1, [r2]
	add r1, r4, #0
	mov r2, #2
	add r1, #0x88
	str r2, [r1]
	mov r1, #0x19
	str r1, [r4, r0]
	b _0225654A
_02256448:
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	add r3, r2, #0
	mul r3, r1
	ldr r2, _022565C8 ; =0x00002D59
	add r3, r4, r3
	ldrsb r2, [r3, r2]
	cmp r2, #0xc
	bge _0225654A
	mov r2, #1
	add r1, #0x70
	str r2, [r4, r1]
	mov r1, #0xd0
	str r1, [r4, r0]
	b _0225654A
_02256466:
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	add r3, r2, #0
	mul r3, r1
	ldr r2, _022565CC ; =0x00002D5A
	add r3, r4, r3
	ldrsb r2, [r3, r2]
	cmp r2, #0xc
	bge _0225654A
	mov r2, #2
	add r1, #0x70
	str r2, [r4, r1]
	mov r1, #0xd0
	str r1, [r4, r0]
	b _0225654A
_02256484:
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	add r3, r2, #0
	mul r3, r1
	ldr r2, _022565D0 ; =0x00002D5B
	add r3, r4, r3
	ldrsb r2, [r3, r2]
	cmp r2, #0xc
	bge _0225654A
	mov r2, #3
	add r1, #0x70
	str r2, [r4, r1]
	mov r1, #0xd0
	str r1, [r4, r0]
	b _0225654A
_022564A2:
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	add r3, r2, #0
	mul r3, r1
	ldr r2, _022565D4 ; =0x00002D5C
	add r3, r4, r3
	ldrsb r2, [r3, r2]
	cmp r2, #0xc
	bge _0225654A
	mov r2, #4
	add r1, #0x70
	str r2, [r4, r1]
	mov r1, #0xd0
	str r1, [r4, r0]
	b _0225654A
_022564C0:
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	add r3, r2, #0
	mul r3, r1
	ldr r2, _022565D8 ; =0x00002D5D
	add r3, r4, r3
	ldrsb r2, [r3, r2]
	cmp r2, #0xc
	bge _0225654A
	mov r2, #5
	add r1, #0x70
	str r2, [r4, r1]
	mov r1, #0xd0
	str r1, [r4, r0]
	b _0225654A
_022564DE:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r2, r4, r0
	ldr r0, _022565C8 ; =0x00002D59
_022564E8:
	ldrsb r1, [r2, r0]
	cmp r1, #0xc
	blt _022564F6
	add r5, r5, #1
	add r2, r2, #1
	cmp r5, #5
	blt _022564E8
_022564F6:
	cmp r5, #5
	beq _0225654A
	ldr r5, _022565C8 ; =0x00002D59
	mov r7, #5
	mov r6, #0xc0
_02256500:
	ldr r0, [sp]
	bl ov12_0223BD98
	add r1, r7, #0
	bl _s32_div_f
	ldr r0, [r4, #0x6c]
	add r2, r0, #0
	mul r2, r6
	add r0, r4, r2
	add r0, r1, r0
	ldrsb r0, [r0, r5]
	cmp r0, #0xc
	beq _02256500
	mov r0, #0x13
	add r1, r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _022565BC ; =0x00003118
	mov r1, #0xd2
	str r1, [r4, r0]
	b _0225654A
_0225652C:
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	mul r1, r2
	add r2, r4, r1
	ldr r1, _022565C4 ; =0x00002DB0
	ldr r2, [r2, r1]
	mov r1, #1
	lsl r1, r1, #0x14
	tst r1, r2
	bne _0225654A
	mov r1, #0xd1
	str r1, [r4, r0]
	b _0225654A
_02256546:
	ldr r1, _022565DC ; =0x00000109
	str r1, [r4, r0]
_0225654A:
	ldr r0, [r4, #0x6c]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	add r0, r4, r2
	mov r2, #0xb7
	lsl r2, r2, #6
	ldr r3, [r0, r2]
	mov r0, #1
	lsl r0, r0, #0x1a
	tst r0, r3
	beq _0225656A
	ldr r0, _022565BC ; =0x00003118
	mov r1, #0
	str r1, [r4, r0]
	b _022565AA
_0225656A:
	ldr r0, [sp, #4]
	sub r2, #8
	add r3, r0, #0
	mul r3, r1
	add r0, r4, r3
	ldrh r0, [r0, r2]
	add r1, #0x68
	str r0, [r4, r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	cmp r0, #0
	bne _022565A2
	ldr r0, _022565BC ; =0x00003118
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022565A2
	mov r0, #0xba
	ldr r1, [r4, #0x64]
	lsl r0, r0, #2
	add r3, r4, r0
	mov r0, #0x1c
	add r2, r1, #0
	mul r2, r0
	ldr r1, [r3, r2]
	mov r0, #2
	orr r0, r1
	str r0, [r3, r2]
_022565A2:
	mov r0, #0x46
	ldr r1, [r4, #0x6c]
	lsl r0, r0, #2
	str r1, [r4, r0]
_022565AA:
	mov r0, #1
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022565B0: .word 0x00002D90
_022565B4: .word 0x00003114
_022565B8: .word 0x00002DA8
_022565BC: .word 0x00003118
_022565C0: .word 0x00002D58
_022565C4: .word 0x00002DB0
_022565C8: .word 0x00002D59
_022565CC: .word 0x00002D5A
_022565D0: .word 0x00002D5B
_022565D4: .word 0x00002D5C
_022565D8: .word 0x00002D5D
_022565DC: .word 0x00000109
	thumb_func_end ov12_02255F7C

	thumb_func_start ov12_022565E0
ov12_022565E0: ; 0x022565E0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl ov12_02255830
	cmp r0, #0x69
	bne _0225666E
	ldr r5, [r4, #0x64]
	mov r6, #0xc0
	add r3, r5, #0
	mul r3, r6
	ldr r0, _02256684 ; =0x00002DB0
	add r2, r4, r3
	ldr r1, [r2, r0]
	lsl r6, r6, #4
	tst r6, r1
	bne _02256682
	mov r6, #0x70
	tst r6, r1
	bne _02256682
	ldr r6, _02256688 ; =0x0000213C
	ldr r7, [r4, r6]
	mov r6, #2
	lsl r6, r6, #8
	tst r7, r6
	bne _02256682
	lsl r6, r6, #3
	tst r1, r6
	bne _02256682
	mov r6, #0xc1
	lsl r6, r6, #6
	lsl r5, r5, #1
	add r7, r4, r5
	add r5, r6, #0
	add r5, #0x9c
	ldrh r5, [r7, r5]
	ldr r1, [r4, r6]
	cmp r1, r5
	bne _02256654
	add r1, r0, #0
	add r1, #0x1c
	ldr r1, [r2, r1]
	lsl r1, r1, #5
	lsr r5, r1, #0x1c
	cmp r5, #0xa
	bhs _02256682
	add r0, #0x1c
	add r0, r4, r0
	ldr r2, [r0, r3]
	ldr r1, _0225668C ; =0xF87FFFFF
	and r2, r1
	add r1, r5, #1
	lsl r1, r1, #0x1c
	lsr r1, r1, #5
	orr r1, r2
	str r1, [r0, r3]
	pop {r3, r4, r5, r6, r7, pc}
_02256654:
	add r0, #0x1c
	add r2, r4, r0
	ldr r1, [r2, r3]
	ldr r0, _0225668C ; =0xF87FFFFF
	and r0, r1
	str r0, [r2, r3]
	ldr r0, [r4, #0x64]
	ldr r1, [r4, r6]
	lsl r0, r0, #1
	add r0, r4, r0
	add r6, #0x9c
	strh r1, [r0, r6]
	pop {r3, r4, r5, r6, r7, pc}
_0225666E:
	ldr r0, _02256690 ; =0x00002DCC
	ldr r1, [r4, #0x64]
	add r3, r4, r0
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	ldr r1, [r3, r2]
	ldr r0, _0225668C ; =0xF87FFFFF
	and r0, r1
	str r0, [r3, r2]
_02256682:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02256684: .word 0x00002DB0
_02256688: .word 0x0000213C
_0225668C: .word 0xF87FFFFF
_02256690: .word 0x00002DCC
	thumb_func_end ov12_022565E0

	thumb_func_start ov12_02256694
ov12_02256694: ; 0x02256694
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl ov12_02255830
	cmp r0, #0x69
	bne _02256720
	ldr r5, _02256738 ; =0x0000216C
	ldr r0, _0225673C ; =0x801FDA49
	ldr r1, [r4, r5]
	tst r0, r1
	beq _02256734
	ldr r2, [r4, #0x64]
	mov r0, #0xc1
	lsl r0, r0, #6
	lsl r1, r2, #1
	ldr r3, [r4, r0]
	add r1, r4, r1
	add r0, #0x9c
	ldrh r0, [r1, r0]
	cmp r3, r0
	bne _02256734
	mov r0, #0xc0
	add r1, r2, #0
	mul r1, r0
	ldr r3, _02256740 ; =0x00002DCC
	add r6, r4, r1
	ldr r0, [r6, r3]
	lsl r0, r0, #5
	lsr r0, r0, #0x1c
	beq _02256734
	mov r7, #0x1c
	mul r7, r2
	mov r2, #0xb5
	add r7, r4, r7
	lsl r2, r2, #2
	ldr r7, [r7, r2]
	lsl r7, r7, #0x17
	lsr r7, r7, #0x1d
	bne _02256734
	add r7, r3, #0
	sub r7, #0x1c
	ldr r6, [r6, r7]
	mov r7, #0xc0
	lsl r7, r7, #4
	tst r7, r6
	bne _02256734
	mov r7, #0x70
	tst r7, r6
	bne _02256734
	sub r5, #0x30
	ldr r5, [r4, r5]
	sub r2, #0xd4
	tst r2, r5
	bne _02256734
	mov r2, #1
	lsl r2, r2, #0xc
	tst r2, r6
	bne _02256734
	add r2, r4, r3
	sub r0, r0, #1
	lsl r0, r0, #0x1c
	ldr r4, [r2, r1]
	ldr r3, _02256744 ; =0xF87FFFFF
	lsr r0, r0, #5
	and r3, r4
	orr r0, r3
	str r0, [r2, r1]
	pop {r3, r4, r5, r6, r7, pc}
_02256720:
	ldr r0, _02256740 ; =0x00002DCC
	ldr r1, [r4, #0x64]
	add r3, r4, r0
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	ldr r1, [r3, r2]
	ldr r0, _02256744 ; =0xF87FFFFF
	and r0, r1
	str r0, [r3, r2]
_02256734:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02256738: .word 0x0000216C
_0225673C: .word 0x801FDA49
_02256740: .word 0x00002DCC
_02256744: .word 0xF87FFFFF
	thumb_func_end ov12_02256694

	thumb_func_start ov12_02256748
ov12_02256748: ; 0x02256748
	push {r4, r5, r6, lr}
	add r5, r0, #0
	cmp r3, #1
	bne _0225675A
	sub r0, r2, #2
	cmp r0, #1
	bhi _0225675A
	mov r0, #1
	b _0225675C
_0225675A:
	mov r0, #0
_0225675C:
	cmp r0, #1
	mov r0, #0xc0
	add r4, r1, #0
	mul r4, r0
	ldr r2, _02256798 ; =0x00002D8C
	add r1, r5, r4
	ldr r0, [r1, r2]
	add r2, r2, #4
	ldr r1, [r1, r2]
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	mov r2, #0x30
	mov r6, #0
	bl sub_020880B0
	ldr r1, _0225679C ; =0x00002DAC
	add r2, r5, r4
	ldr r1, [r2, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bne _02256792
	cmp r0, #4
	beq _02256794
	cmp r0, #3
	beq _02256794
_02256792:
	mov r6, #0xb
_02256794:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02256798: .word 0x00002D8C
_0225679C: .word 0x00002DAC
	thumb_func_end ov12_02256748

	thumb_func_start ov12_022567A0
ov12_022567A0: ; 0x022567A0
	push {r3, r4}
	mov r3, #0xc0
	add r4, r1, #0
	mul r4, r3
	add r1, r0, r4
	ldr r0, _022567D0 ; =0x00002DB0
	mov r2, #1
	ldr r0, [r1, r0]
	lsl r1, r2, #0x16
	tst r1, r0
	bne _022567C8
	lsl r1, r3, #4
	tst r1, r0
	bne _022567C8
	mov r1, #0x70
	tst r1, r0
	bne _022567C8
	lsl r1, r2, #0xc
	tst r0, r1
	beq _022567CA
_022567C8:
	mov r2, #0
_022567CA:
	add r0, r2, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_022567D0: .word 0x00002DB0
	thumb_func_end ov12_022567A0

	thumb_func_start ov12_022567D4
ov12_022567D4: ; 0x022567D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0
	add r6, r2, #0
	bl ov12_0223AA40
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ov12_0223AB60
	str r0, [sp, #8]
	add r0, r5, #0
	bl ov12_0223AB40
	add r7, r0, #0
	add r0, r5, #0
	bl ov12_0223A7E0
	mov r1, #2
	lsl r1, r1, #8
	tst r0, r1
	beq _02256814
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_0223AA88
	bl BallToItemId
	add r2, r0, #0
	b _02256818
_02256814:
	sub r1, #0xd8
	ldr r2, [r4, r1]
_02256818:
	str r7, [sp]
	mov r0, #5
	str r0, [sp, #4]
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #8]
	add r0, r6, #0
	bl sub_020720FC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_022567D4

	thumb_func_start ov12_0225682C
ov12_0225682C: ; 0x0225682C
	lsl r1, r1, #8
	add r1, r0, r1
	mov r0, #0x23
	lsl r0, r0, #8
	ldrb r0, [r1, r0]
	bx lr
	thumb_func_end ov12_0225682C

	thumb_func_start ov12_02256838
ov12_02256838: ; 0x02256838
	mov r3, #0x1c
	mul r3, r1
	add r1, r0, r3
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r0, #8
	mov r2, #0
	tst r0, r1
	beq _0225684E
	mov r2, #1
_0225684E:
	add r0, r2, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov12_02256838

	thumb_func_start ov12_02256854
ov12_02256854: ; 0x02256854
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0
	bl ov12_0223AA40
	add r4, r0, #0
	bl PlayerProfile_GetTrainerID
	add r6, r0, #0
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	add r7, r0, #0
	add r0, r4, #0
	bl PlayerProfile_GetNamePtr
	ldr r2, [r5, #0x64]
	mov r1, #0xc0
	add r4, r2, #0
	mul r4, r1
	ldr r1, _022568AC ; =0x00002DB4
	add r3, r5, r4
	ldr r2, [r3, r1]
	cmp r6, r2
	bne _022568A8
	add r2, r1, #0
	add r2, #0xa
	ldrb r2, [r3, r2]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1c
	cmp r7, r2
	bne _022568A8
	sub r1, #0x20
	add r1, r5, r1
	add r1, r1, r4
	mov r2, #7
	bl StringNotEqualN
	cmp r0, #0
	bne _022568A8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022568A8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022568AC: .word 0x00002DB4
	thumb_func_end ov12_02256854

	thumb_func_start ov12_022568B0
ov12_022568B0: ; 0x022568B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	mov r1, #0
	bl ov12_0223AA40
	add r4, r0, #0
	bl PlayerProfile_GetTrainerID
	add r6, r0, #0
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	add r7, r0, #0
	add r0, r4, #0
	bl PlayerProfile_GetNamePtr
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x90
	add r2, sp, #0
	bl GetMonData
	add r0, r5, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	cmp r6, r0
	bne _0225690E
	add r0, r5, #0
	mov r1, #0x9d
	mov r2, #0
	bl GetMonData
	cmp r7, r0
	bne _0225690E
	add r0, r4, #0
	add r1, sp, #0
	mov r2, #7
	bl StringNotEqualN
	cmp r0, #0
	bne _0225690E
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225690E:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_022568B0

	thumb_func_start ov12_02256914
ov12_02256914: ; 0x02256914
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r4, #0
	add r7, r0, #0
	add r5, r1, #0
	str r2, [sp, #4]
	str r4, [sp, #8]
	bl ov12_0223A7F0
	cmp r0, #0
	bgt _0225692C
	b _02256EE4
_0225692C:
	ldr r0, _02256C2C ; =0x00002D66
	add r6, r5, r0
_02256930:
	ldr r0, _02256C30 ; =0x000021EC
	add r1, r5, r4
	ldrb r1, [r1, r0]
	mov r0, #0x46
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r3, [r5, r0]
	mov r0, #0xc0
	mul r0, r3
	add r2, r5, r0
	mov r0, #0xb5
	lsl r0, r0, #6
	ldrh r1, [r2, r0]
	ldr r0, _02256C34 ; =0x0000015F
	cmp r1, r0
	bne _02256964
	ldr r0, _02256C38 ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _02256964
	add r0, r5, #0
	add r1, r3, #0
	bl ov12_022527CC
	cmp r0, #0x3b
	beq _02256966
_02256964:
	b _02256B52
_02256966:
	mov r0, #0xd
	str r0, [sp]
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _0225698E
	mov r0, #0x4c
	str r0, [sp]
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	beq _02256990
_0225698E:
	b _02256B00
_02256990:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xf3
	tst r1, r0
	bne _022569EE
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	mov r1, #0xc0
	mul r1, r2
	ldr r2, _02256C3C ; =0x00002D64
	add r1, r5, r1
	ldrb r2, [r1, r2]
	cmp r2, #0
	beq _022569EE
	ldr r2, _02256C40 ; =0x00002D65
	ldrb r2, [r1, r2]
	cmp r2, #0
	beq _022569EE
	ldr r3, _02256C3C ; =0x00002D64
	mov r2, #0
	mov r0, #0x46
	strb r2, [r1, r3]
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	mov r1, #0xc0
	add r6, r4, #0
	mul r6, r1
	add r6, r5, r6
	add r4, r3, #1
	strb r2, [r6, r4]
	ldr r0, [r5, r0]
	add r2, r3, #2
	add r4, r0, #0
	mul r4, r1
	add r2, r5, r2
	ldrb r3, [r2, r4]
	mov r0, #0x1f
	add r1, #0x46
	bic r3, r0
	ldr r0, [sp, #4]
	strb r3, [r2, r4]
	str r1, [r0]
	mov r0, #1
	str r0, [sp, #8]
	b _02256EE4
_022569EE:
	mov r1, #0x30
	tst r1, r0
	beq _02256A48
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	mov r1, #0xc0
	mul r1, r2
	ldr r2, _02256C3C ; =0x00002D64
	add r1, r5, r1
	ldrb r2, [r1, r2]
	cmp r2, #0xa
	beq _02256A48
	ldr r2, _02256C40 ; =0x00002D65
	ldrb r2, [r1, r2]
	cmp r2, #0xa
	beq _02256A48
	ldr r3, _02256C3C ; =0x00002D64
	mov r2, #0xa
	mov r0, #0x46
	strb r2, [r1, r3]
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	mov r1, #0xc0
	add r6, r4, #0
	mul r6, r1
	add r6, r5, r6
	add r4, r3, #1
	strb r2, [r6, r4]
	add r2, r3, #2
	ldr r3, [r5, r0]
	add r2, r5, r2
	add r0, r3, #0
	mul r0, r1
	ldrb r4, [r2, r0]
	mov r3, #0x1f
	add r1, #0x46
	bic r4, r3
	mov r3, #1
	str r3, [sp, #8]
	orr r3, r4
	strb r3, [r2, r0]
	ldr r0, [sp, #4]
	str r1, [r0]
	b _02256EE4
_02256A48:
	mov r1, #3
	tst r1, r0
	beq _02256AA4
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	mov r1, #0xc0
	mul r1, r2
	ldr r2, _02256C3C ; =0x00002D64
	add r1, r5, r1
	ldrb r2, [r1, r2]
	cmp r2, #0xb
	beq _02256AA4
	ldr r2, _02256C40 ; =0x00002D65
	ldrb r2, [r1, r2]
	cmp r2, #0xb
	beq _02256AA4
	ldr r3, _02256C3C ; =0x00002D64
	mov r2, #0xb
	mov r0, #0x46
	strb r2, [r1, r3]
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	mov r1, #0xc0
	add r6, r4, #0
	mul r6, r1
	add r6, r5, r6
	add r4, r3, #1
	strb r2, [r6, r4]
	add r2, r3, #2
	ldr r3, [r5, r0]
	add r2, r5, r2
	add r0, r3, #0
	mul r0, r1
	ldrb r4, [r2, r0]
	mov r3, #0x1f
	add r1, #0x46
	bic r4, r3
	mov r3, #2
	orr r3, r4
	strb r3, [r2, r0]
	ldr r0, [sp, #4]
	str r1, [r0]
	mov r0, #1
	str r0, [sp, #8]
	b _02256EE4
_02256AA4:
	mov r1, #0xc0
	tst r0, r1
	beq _02256B52
	add r0, r1, #0
	add r0, #0x58
	ldr r1, [r5, r0]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _02256C3C ; =0x00002D64
	add r0, r5, r0
	ldrb r1, [r0, r1]
	cmp r1, #0xf
	beq _02256B52
	ldr r1, _02256C40 ; =0x00002D65
	ldrb r1, [r0, r1]
	cmp r1, #0xf
	beq _02256B52
	ldr r3, _02256C3C ; =0x00002D64
	mov r2, #0xf
	strb r2, [r0, r3]
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	mov r1, #0xc0
	add r6, r4, #0
	mul r6, r1
	add r6, r5, r6
	add r4, r3, #1
	strb r2, [r6, r4]
	add r2, r3, #2
	ldr r3, [r5, r0]
	add r2, r5, r2
	add r0, r3, #0
	mul r0, r1
	ldrb r4, [r2, r0]
	mov r3, #0x1f
	add r1, #0x46
	bic r4, r3
	mov r3, #3
	orr r3, r4
	strb r3, [r2, r0]
	ldr r0, [sp, #4]
	str r1, [r0]
	mov r0, #1
	str r0, [sp, #8]
	b _02256EE4
_02256B00:
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _02256C3C ; =0x00002D64
	add r0, r5, r0
	ldrb r1, [r0, r1]
	cmp r1, #0
	beq _02256B52
	ldr r1, _02256C40 ; =0x00002D65
	ldrb r1, [r0, r1]
	cmp r1, #0
	beq _02256B52
	ldr r3, _02256C3C ; =0x00002D64
	mov r2, #0
	strb r2, [r0, r3]
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	mov r1, #0xc0
	add r6, r4, #0
	mul r6, r1
	add r6, r5, r6
	add r4, r3, #1
	strb r2, [r6, r4]
	ldr r0, [r5, r0]
	add r2, r3, #2
	add r4, r0, #0
	mul r4, r1
	add r2, r5, r2
	ldrb r3, [r2, r4]
	mov r0, #0x1f
	add r1, #0x46
	bic r3, r0
	ldr r0, [sp, #4]
	strb r3, [r2, r4]
	str r1, [r0]
	mov r0, #1
	str r0, [sp, #8]
	b _02256EE4
_02256B52:
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #0xc0
	mul r0, r1
	mov r1, #0xb5
	add r0, r5, r0
	lsl r1, r1, #6
	ldrh r2, [r0, r1]
	ldr r1, _02256C44 ; =0x000001A5
	cmp r2, r1
	bne _02256B72
	ldr r1, _02256C38 ; =0x00002D8C
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _02256B74
_02256B72:
	b _02256C9E
_02256B74:
	mov r0, #0xd
	str r0, [sp]
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _02256C78
	mov r0, #0x4c
	str r0, [sp]
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _02256C78
	mov r0, #6
	lsl r0, r0, #6
	ldr r2, [r5, r0]
	mov r0, #0xf3
	tst r0, r2
	bne _02256BD0
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0xc0
	add r3, r0, #0
	mul r3, r1
	ldrb r0, [r6, r3]
	lsl r1, r0, #0x1b
	lsr r1, r1, #0x1b
	cmp r1, #1
	bne _02256BD0
	mov r1, #0x1f
	bic r0, r1
	strb r0, [r6, r3]
	ldr r1, _02256C48 ; =0x00000106
	ldr r0, [sp, #4]
	str r1, [r0]
	mov r0, #1
	str r0, [sp, #8]
	b _02256EE4
_02256BD0:
	mov r0, #0x30
	tst r0, r2
	beq _02256BFE
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0xc0
	add r3, r0, #0
	mul r3, r1
	ldrb r0, [r6, r3]
	lsl r1, r0, #0x1b
	lsr r1, r1, #0x1b
	bne _02256BFE
	mov r1, #0x1f
	bic r0, r1
	mov r1, #1
	orr r0, r1
	str r1, [sp, #8]
	strb r0, [r6, r3]
	ldr r1, _02256C48 ; =0x00000106
	ldr r0, [sp, #4]
	str r1, [r0]
	b _02256EE4
_02256BFE:
	mov r0, #3
	tst r0, r2
	beq _02256C4C
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0xc0
	add r3, r0, #0
	mul r3, r1
	ldrb r0, [r6, r3]
	lsl r1, r0, #0x1b
	lsr r1, r1, #0x1b
	cmp r1, #1
	bne _02256C4C
	mov r1, #0x1f
	bic r0, r1
	strb r0, [r6, r3]
	ldr r1, _02256C48 ; =0x00000106
	ldr r0, [sp, #4]
	str r1, [r0]
	mov r0, #1
	str r0, [sp, #8]
	b _02256EE4
	.balign 4, 0
_02256C2C: .word 0x00002D66
_02256C30: .word 0x000021EC
_02256C34: .word 0x0000015F
_02256C38: .word 0x00002D8C
_02256C3C: .word 0x00002D64
_02256C40: .word 0x00002D65
_02256C44: .word 0x000001A5
_02256C48: .word 0x00000106
_02256C4C:
	mov r0, #0xc0
	tst r0, r2
	beq _02256C9E
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #0xc0
	mul r0, r1
	ldrb r2, [r6, r0]
	lsl r1, r2, #0x1b
	lsr r1, r1, #0x1b
	cmp r1, #1
	bne _02256C9E
	mov r1, #0x1f
	bic r2, r1
	strb r2, [r6, r0]
	ldr r1, _02256EEC ; =0x00000106
	ldr r0, [sp, #4]
	str r1, [r0]
	mov r0, #1
	str r0, [sp, #8]
	b _02256EE4
_02256C78:
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #0xc0
	mul r0, r1
	ldrb r2, [r6, r0]
	lsl r1, r2, #0x1b
	lsr r1, r1, #0x1b
	cmp r1, #1
	bne _02256C9E
	mov r1, #0x1f
	bic r2, r1
	strb r2, [r6, r0]
	ldr r1, _02256EEC ; =0x00000106
	ldr r0, [sp, #4]
	str r1, [r0]
	mov r0, #1
	str r0, [sp, #8]
	b _02256EE4
_02256C9E:
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r3, [r5, r0]
	mov r0, #0xc0
	mul r0, r3
	add r2, r5, r0
	mov r0, #0xb5
	lsl r0, r0, #6
	ldrh r1, [r2, r0]
	ldr r0, _02256EF0 ; =0x000001ED
	cmp r1, r0
	bne _02256D1C
	ldr r0, _02256EF4 ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _02256D1C
	add r0, r5, #0
	add r1, r3, #0
	bl ov12_022527CC
	cmp r0, #0x79
	bne _02256D1C
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02256EF8 ; =0x00002DB8
	mov r2, #5
	ldrh r0, [r1, r0]
	mov r1, #1
	bl GetItemAttr
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GetArceusTypeByHeldItemEffect
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r2, #0xc0
	add r3, r1, #0
	mul r3, r2
	ldrb r1, [r6, r3]
	lsl r2, r1, #0x1b
	lsr r2, r2, #0x1b
	cmp r0, r2
	beq _02256D1C
	mov r2, #0x1f
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r0, r0, #0x18
	mov r2, #0x1f
	and r0, r2
	orr r0, r1
	strb r0, [r6, r3]
	ldr r0, [sp, #4]
	add r2, #0xe7
	str r2, [r0]
	mov r0, #1
	str r0, [sp, #8]
	b _02256EE4
_02256D1C:
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #0xc0
	add r3, r1, #0
	mul r3, r0
	mov r0, #0xb5
	add r2, r5, r3
	lsl r0, r0, #6
	ldrh r1, [r2, r0]
	ldr r0, _02256EFC ; =0x000001E7
	cmp r1, r0
	bne _02256D78
	ldr r0, _02256EF4 ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _02256D78
	ldr r0, _02256F00 ; =0x00002D66
	ldrb r0, [r2, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1b
	cmp r0, #1
	bne _02256D78
	ldr r0, _02256F04 ; =0x00002DB0
	ldr r1, [r2, r0]
	mov r0, #2
	lsl r0, r0, #0x14
	tst r0, r1
	bne _02256D7A
	add r0, r7, #0
	bl ov12_0223B514
	mov r1, #0x80
	tst r0, r1
	bne _02256D78
	add r0, r1, #0
	add r0, #0x98
	ldr r1, [r5, r0]
	mov r0, #0xc0
	add r3, r1, #0
	mul r3, r0
	ldr r0, _02256EF8 ; =0x00002DB8
	add r1, r5, r3
	ldrh r0, [r1, r0]
	cmp r0, #0x70
	bne _02256D7A
_02256D78:
	b _02256ED6
_02256D7A:
	ldr r0, _02256F04 ; =0x00002DB0
	add r1, r5, r3
	ldr r1, [r1, r0]
	mov r0, #2
	lsl r0, r0, #0x14
	tst r0, r1
	bne _02256D8A
	b _02256EC8
_02256D8A:
	mov r0, #5
	bl AllocMonZeroed
	add r4, r0, #0
	add r0, r7, #0
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	beq _02256DAE
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _02256F08 ; =0x000021AC
	ldr r1, [r1, r0]
	b _02256DB8
_02256DAE:
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #1
	eor r1, r0
_02256DB8:
	ldr r2, _02256F0C ; =0x0000219C
	add r3, r5, r1
	ldrb r2, [r3, r2]
	add r0, r7, #0
	bl ov12_0223A880
	add r1, r4, #0
	bl CopyPokemonToPokemon
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #MON_DATA_HELD_ITEM
	add r2, sp, #0xc
	bl SetMonData
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #MON_DATA_FORME
	add r2, sp, #0xc
	bl SetMonData
	add r0, r4, #0
	bl Mon_UpdateGiratinaForme
	add r0, r4, #0
	mov r1, #0xa5
	mov r2, #0
	bl GetMonData
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	mov r1, #0xc0
	mul r1, r2
	add r2, r5, r1
	ldr r1, _02256F10 ; =0x00002D42
	strh r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa6
	mov r2, #0
	bl GetMonData
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	mov r1, #0xc0
	mul r1, r2
	add r2, r5, r1
	ldr r1, _02256F14 ; =0x00002D44
	strh r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa7
	mov r2, #0
	bl GetMonData
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	mov r1, #0xc0
	mul r1, r2
	add r2, r5, r1
	ldr r1, _02256F18 ; =0x00002D46
	strh r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa8
	mov r2, #0
	bl GetMonData
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	mov r1, #0xc0
	mul r1, r2
	add r2, r5, r1
	ldr r1, _02256F1C ; =0x00002D48
	strh r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa9
	mov r2, #0
	bl GetMonData
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	mov r1, #0xc0
	mul r1, r2
	add r2, r5, r1
	ldr r1, _02256F20 ; =0x00002D4A
	strh r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	mov r6, #0x46
	lsl r6, r6, #2
	ldr r2, [r5, r6]
	mov r1, #0xc0
	mul r1, r2
	add r2, r5, r1
	ldr r1, _02256F24 ; =0x00002D67
	strb r0, [r2, r1]
	sub r0, r1, #1
	add r3, r5, r0
	ldr r0, [r5, r6]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	ldrb r1, [r3, r2]
	mov r0, #0x1f
	bic r1, r0
	strb r1, [r3, r2]
	mov r1, #0x85
	lsl r1, r1, #6
	mov r0, #1
	ldr r2, [r5, r1]
	lsl r0, r0, #0x1a
	orr r0, r2
	str r0, [r5, r1]
	ldr r2, [r5, r6]
	add r0, r7, #0
	add r1, r5, #0
	bl ov12_02263B4C
	add r0, r4, #0
	bl FreeToHeap
	add r1, r6, #0
	ldr r0, [sp, #4]
	sub r1, #0x12
	str r1, [r0]
	mov r0, #1
	str r0, [sp, #8]
	b _02256EE4
_02256EC8:
	mov r1, #0x4a
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	str r1, [r0]
	mov r0, #1
	str r0, [sp, #8]
	b _02256EE4
_02256ED6:
	add r0, r7, #0
	add r4, r4, #1
	bl ov12_0223A7F0
	cmp r4, r0
	bge _02256EE4
	b _02256930
_02256EE4:
	ldr r0, [sp, #8]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02256EEC: .word 0x00000106
_02256EF0: .word 0x000001ED
_02256EF4: .word 0x00002D8C
_02256EF8: .word 0x00002DB8
_02256EFC: .word 0x000001E7
_02256F00: .word 0x00002D66
_02256F04: .word 0x00002DB0
_02256F08: .word 0x000021AC
_02256F0C: .word 0x0000219C
_02256F10: .word 0x00002D42
_02256F14: .word 0x00002D44
_02256F18: .word 0x00002D46
_02256F1C: .word 0x00002D48
_02256F20: .word 0x00002D4A
_02256F24: .word 0x00002D67
	thumb_func_end ov12_02256914

	thumb_func_start ov12_02256F28
ov12_02256F28: ; 0x02256F28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp, #4]
	str r1, [sp]
	mov r7, #0
	bl ov12_0223A7F0
	cmp r0, #0
	ble _02256F6A
	ldr r5, [sp]
	ldr r4, _02256F70 ; =0x0000312C
_02256F3E:
	mov r1, #0
_02256F40:
	add r0, r5, r1
	strb r1, [r0, r4]
	add r1, r1, #1
	cmp r1, #6
	blt _02256F40
	ldr r1, [sp]
	ldr r0, [sp, #4]
	add r3, r1, #0
	add r6, r3, r7
	ldr r3, _02256F74 ; =0x0000219C
	add r2, r7, #0
	ldrb r3, [r6, r3]
	bl ov12_02256F78
	ldr r0, [sp, #4]
	add r5, r5, #6
	add r7, r7, #1
	bl ov12_0223A7F0
	cmp r7, r0
	blt _02256F3E
_02256F6A:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02256F70: .word 0x0000312C
_02256F74: .word 0x0000219C
	thumb_func_end ov12_02256F28

	thumb_func_start ov12_02256F78
ov12_02256F78: ; 0x02256F78
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl ov12_0223A7E0
	mov r1, #2
	tst r1, r0
	beq _02256F92
	mov r1, #0x18
	tst r1, r0
	beq _02256FA6
_02256F92:
	mov r1, #0x10
	tst r0, r1
	beq _02256FCA
	add r0, r7, #0
	add r1, r5, #0
	bl ov12_0223AB0C
	mov r1, #1
	tst r0, r1
	bne _02256FCA
_02256FA6:
	add r0, r7, #0
	add r1, r5, #0
	bl ov12_0223AB0C
	cmp r0, #4
	beq _02256FBE
	add r0, r7, #0
	add r1, r5, #0
	bl ov12_0223AB0C
	cmp r0, #5
	bne _02256FC2
_02256FBE:
	mov r1, #1
	b _02256FC4
_02256FC2:
	mov r1, #0
_02256FC4:
	mov r0, #1
	and r5, r0
	b _02256FCC
_02256FCA:
	mov r1, #0
_02256FCC:
	mov r2, #6
	mul r2, r5
	ldr r3, _02256FF4 ; =0x0000312C
	mov r0, #0
	add r7, r6, r2
_02256FD6:
	ldrb r5, [r7, r3]
	cmp r4, r5
	beq _02256FE4
	add r0, r0, #1
	add r7, r7, #1
	cmp r0, #6
	blt _02256FD6
_02256FE4:
	ldr r3, _02256FF4 ; =0x0000312C
	add r3, r6, r3
	add r4, r3, r2
	ldrb r3, [r4, r1]
	ldrb r2, [r4, r0]
	strb r2, [r4, r1]
	strb r3, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02256FF4: .word 0x0000312C
	thumb_func_end ov12_02256F78

	thumb_func_start ov12_02256FF8
ov12_02256FF8: ; 0x02256FF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x8c
	str r0, [sp, #4]
	ldr r0, [sp, #0xa0]
	add r5, r1, #0
	str r0, [sp, #0xa0]
	ldr r0, [sp, #0xb4]
	str r2, [sp, #8]
	str r0, [sp, #0xb4]
	mov r0, #0
	str r0, [sp, #0x84]
	ldr r0, [sp, #0xb4]
	str r3, [sp, #0xc]
	cmp r0, #1
	beq _0225701C
	bhi _0225701C
	bl GF_AssertFail
_0225701C:
	add r0, sp, #0x90
	ldrb r0, [r0, #0x1c]
	mov r2, #1
	mov r3, #0
	str r0, [sp, #0x24]
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x7c]
	add r0, sp, #0xb0
	ldrb r0, [r0]
	mov r2, #2
	mov r3, #0
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x78]
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	mov r2, #4
	mov r3, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x74]
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	mov r2, #5
	mov r3, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	mov r2, #0x13
	mov r3, #0
	bl ov12_0224EDE0
	sub r0, r0, #6
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [sp, #0x70]
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	mov r2, #0x14
	mov r3, #0
	bl ov12_0224EDE0
	sub r0, r0, #6
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [sp, #0x6c]
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	mov r2, #0x16
	mov r3, #0
	bl ov12_0224EDE0
	sub r0, r0, #6
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [sp, #0x68]
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	mov r2, #0x17
	mov r3, #0
	bl ov12_0224EDE0
	sub r0, r0, #6
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [sp, #0x64]
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	mov r2, #0x2b
	mov r3, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r2, #0
	str r0, [sp, #0x60]
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	add r3, r2, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #0
	str r0, [sp, #0x58]
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	add r3, r2, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x54]
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	mov r2, #0x2f
	mov r3, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x50]
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	mov r2, #0x2f
	mov r3, #0
	bl ov12_0224EDE0
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	mov r2, #0x30
	mov r3, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x4c]
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	mov r2, #0x30
	mov r3, #0
	bl ov12_0224EDE0
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	mov r2, #0x34
	mov r3, #0
	bl ov12_0224EDE0
	str r0, [sp, #0x48]
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	mov r2, #0x34
	mov r3, #0
	bl ov12_0224EDE0
	str r0, [sp, #0x44]
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	bl ov12_022527CC
	add r7, r0, #0
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl ov12_022527CC
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	mov r2, #0x1d
	mov r3, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x40]
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	mov r2, #0x1d
	mov r3, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x3c]
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	mov r2, #0x1b
	mov r3, #0
	bl ov12_0224EDE0
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	mov r2, #0x1b
	mov r3, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x38]
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	mov r2, #0x1c
	mov r3, #0
	bl ov12_0224EDE0
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	mov r2, #0x1c
	mov r3, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x34]
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	bl ov12_022555EC
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov12_02257E74
	str r0, [sp, #0x30]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #2
	bl ov12_02257E74
	str r0, [sp, #0x2c]
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl ov12_022555EC
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov12_02257E74
	str r0, [sp, #0x28]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #2
	bl ov12_02257E74
	ldr r0, [sp, #4]
	bl ov12_0223A7E0
	str r0, [sp, #0x5c]
	add r0, sp, #0x90
	ldrh r4, [r0, #0x14]
	cmp r4, #0
	bne _0225721C
	ldr r0, [sp, #8]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0225749C ; =0x000003E1
	ldrb r4, [r1, r0]
_0225721C:
	cmp r7, #0x60
	bne _02257224
	mov r6, #0
	b _02257240
_02257224:
	add r0, sp, #0x90
	ldrb r1, [r0, #0x18]
	cmp r1, #0
	bne _02257238
	ldr r0, [sp, #8]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _022574A0 ; =0x000003E2
	ldrb r6, [r1, r0]
	b _02257240
_02257238:
	mov r0, #0x3f
	and r0, r1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
_02257240:
	ldr r0, _022574A4 ; =0x00002158
	ldr r0, [r5, r0]
	cmp r0, #0xa
	bge _0225724C
	bl GF_AssertFail
_0225724C:
	ldr r0, _022574A4 ; =0x00002158
	mov r1, #0xa
	ldr r0, [r5, r0]
	mul r0, r4
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, sp, #0x90
	ldrb r0, [r0, #0x1c]
	mov r1, #0xc0
	mul r1, r0
	add r2, r5, r1
	mov r1, #0xb7
	lsl r1, r1, #6
	ldr r2, [r2, r1]
	mov r1, #2
	lsl r1, r1, #8
	tst r1, r2
	beq _0225727C
	cmp r6, #0xd
	bne _0225727C
	lsl r1, r4, #0x11
	lsr r4, r1, #0x10
_0225727C:
	lsl r0, r0, #6
	add r1, r5, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	beq _0225729A
	mov r0, #0xf
	mul r0, r4
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0225729A:
	cmp r7, #0x65
	bne _022572B6
	ldr r0, [sp, #8]
	cmp r0, #0xa5
	beq _022572B6
	cmp r4, #0x3c
	bhi _022572B6
	mov r0, #0xf
	mul r0, r4
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_022572B6:
	ldr r0, [sp, #8]
	lsl r0, r0, #4
	str r0, [sp, #0x18]
	add r1, r5, r0
	mov r0, #0x3e
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r7, #0x25
	str r0, [sp, #0x80]
	beq _022572CE
	cmp r7, #0x4a
	bne _022572D6
_022572CE:
	ldr r0, [sp, #0x7c]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x10
	str r0, [sp, #0x7c]
_022572D6:
	cmp r7, #0x70
	bne _02257304
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #3
	mov r3, #0
	bl ov12_022581D4
	str r0, [sp, #0x88]
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	mov r2, #0x59
	mov r3, #0
	bl ov12_0224EDE0
	ldr r1, [sp, #0x88]
	sub r0, r1, r0
	cmp r0, #5
	bge _02257304
	ldr r0, [sp, #0x7c]
	lsl r0, r0, #0xf
	lsr r0, r0, #0x10
	str r0, [sp, #0x7c]
_02257304:
	ldr r3, _022574A8 ; =ov12_0226CC3A
	mov r2, #0
_02257308:
	ldrb r1, [r3]
	ldr r0, [sp, #0x30]
	cmp r0, r1
	bne _02257328
	ldrb r0, [r3, #1]
	cmp r6, r0
	bne _02257328
	ldr r0, [sp, #0x2c]
	mov r1, #0x64
	add r0, #0x64
	mul r0, r4
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	b _02257330
_02257328:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #0x21
	blo _02257308
_02257330:
	ldr r0, [sp, #0x30]
	cmp r0, #0x37
	bne _02257348
	ldr r1, [sp, #0x7c]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x7c]
_02257348:
	ldr r0, [sp, #0x30]
	cmp r0, #0x7d
	bne _02257360
	ldr r1, [sp, #0x74]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x74]
_02257360:
	ldr r0, [sp, #0x30]
	cmp r0, #0x3c
	bne _0225738E
	ldr r0, [sp, #0x5c]
	mov r1, #0x80
	tst r0, r1
	bne _0225738E
	ldr r1, _022574AC ; =0x0000FE84
	ldr r0, [sp, #0x58]
	add r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bhi _0225738E
	ldr r1, [sp, #0x74]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x74]
_0225738E:
	ldr r0, [sp, #0x28]
	cmp r0, #0x3c
	bne _022573BC
	ldr r0, [sp, #0x5c]
	mov r1, #0x80
	tst r0, r1
	bne _022573BC
	ldr r1, _022574AC ; =0x0000FE84
	ldr r0, [sp, #0x54]
	add r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bhi _022573BC
	ldr r1, [sp, #0x10]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
_022573BC:
	ldr r0, [sp, #0x30]
	cmp r0, #0x3d
	bne _022573D2
	ldr r1, _022574B0 ; =0x0000016E
	ldr r0, [sp, #0x58]
	cmp r0, r1
	bne _022573D2
	ldr r0, [sp, #0x74]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x10
	str r0, [sp, #0x74]
_022573D2:
	ldr r0, [sp, #0x28]
	cmp r0, #0x3e
	bne _022573E8
	ldr r1, _022574B0 ; =0x0000016E
	ldr r0, [sp, #0x54]
	cmp r0, r1
	bne _022573E8
	ldr r0, [sp, #0x10]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
_022573E8:
	ldr r0, [sp, #0x30]
	cmp r0, #0x47
	bne _022573F8
	ldr r0, [sp, #0x58]
	cmp r0, #0x19
	bne _022573F8
	lsl r0, r4, #0x11
	lsr r4, r0, #0x10
_022573F8:
	ldr r0, [sp, #0x28]
	cmp r0, #0x5a
	bne _0225740C
	ldr r0, [sp, #0x54]
	cmp r0, #0x84
	bne _0225740C
	ldr r0, [sp, #0x78]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x10
	str r0, [sp, #0x78]
_0225740C:
	ldr r0, [sp, #0x30]
	cmp r0, #0x5b
	bne _02257428
	ldr r1, _022574B4 ; =0x0000FF98
	ldr r0, [sp, #0x58]
	add r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bhi _02257428
	ldr r0, [sp, #0x7c]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x10
	str r0, [sp, #0x7c]
_02257428:
	ldr r0, [sp, #0x30]
	cmp r0, #3
	bne _0225744E
	cmp r6, #0x10
	beq _02257436
	cmp r6, #8
	bne _0225744E
_02257436:
	ldr r1, _022574B8 ; =0x000001E3
	ldr r0, [sp, #0x58]
	cmp r0, r1
	bne _0225744E
	ldr r0, [sp, #0x2c]
	mov r1, #0x64
	add r0, #0x64
	mul r0, r4
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0225744E:
	ldr r0, [sp, #0x30]
	cmp r0, #4
	bne _02257476
	cmp r6, #0x10
	beq _0225745C
	cmp r6, #0xb
	bne _02257476
_0225745C:
	mov r1, #0x79
	ldr r0, [sp, #0x58]
	lsl r1, r1, #2
	cmp r0, r1
	bne _02257476
	ldr r0, [sp, #0x2c]
	mov r1, #0x64
	add r0, #0x64
	mul r0, r4
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02257476:
	ldr r0, [sp, #0x30]
	cmp r0, #2
	bne _022574D6
	cmp r6, #0x10
	beq _02257484
	cmp r6, #7
	bne _022574D6
_02257484:
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	mov r2, #0x35
	mov r3, #0
	bl ov12_0224EDE0
	mov r1, #2
	lsl r1, r1, #0x14
	tst r0, r1
	bne _022574D6
	ldr r1, _022574BC ; =0x000001E7
	b _022574C0
	.balign 4, 0
_0225749C: .word 0x000003E1
_022574A0: .word 0x000003E2
_022574A4: .word 0x00002158
_022574A8: .word ov12_0226CC3A
_022574AC: .word 0x0000FE84
_022574B0: .word 0x0000016E
_022574B4: .word 0x0000FF98
_022574B8: .word 0x000001E3
_022574BC: .word 0x000001E7
_022574C0:
	ldr r0, [sp, #0x58]
	cmp r0, r1
	bne _022574D6
	ldr r0, [sp, #0x2c]
	mov r1, #0x64
	add r0, #0x64
	mul r0, r4
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_022574D6:
	ldr r0, [sp, #0x30]
	cmp r0, #0x5e
	bne _022574F2
	ldr r0, [sp, #0x80]
	cmp r0, #0
	bne _022574F2
	ldr r0, [sp, #0x2c]
	mov r1, #0x64
	add r0, #0x64
	mul r0, r4
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_022574F2:
	ldr r0, [sp, #0x30]
	cmp r0, #0x5f
	bne _02257510
	ldr r0, [sp, #0x80]
	cmp r0, #1
	bne _02257510
	ldr r0, [sp, #0x2c]
	mov r1, #0x64
	add r0, #0x64
	str r0, [sp, #0x2c]
	mul r0, r4
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02257510:
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x20]
	add r0, r5, #0
	mov r3, #0x2f
	bl ov12_02252834
	cmp r0, #1
	bne _0225752C
	cmp r6, #0xa
	beq _02257528
	cmp r6, #0xf
	bne _0225752C
_02257528:
	lsl r0, r4, #0xf
	lsr r4, r0, #0x10
_0225752C:
	cmp r7, #0x37
	bne _02257542
	ldr r1, [sp, #0x7c]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x7c]
_02257542:
	cmp r7, #0x3e
	bne _0225755E
	ldr r0, [sp, #0x48]
	cmp r0, #0
	beq _0225755E
	ldr r1, [sp, #0x7c]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x7c]
_0225755E:
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x20]
	add r0, r5, #0
	mov r3, #0x3f
	bl ov12_02252834
	cmp r0, #1
	bne _02257586
	ldr r0, [sp, #0x44]
	cmp r0, #0
	beq _02257586
	ldr r1, [sp, #0x78]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x78]
_02257586:
	cmp r7, #0x39
	bne _022575B0
	mov r0, #0x3a
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x24]
	add r1, r5, #0
	mov r2, #1
	bl ov12_02252324
	cmp r0, #0
	beq _022575B0
	ldr r1, [sp, #0x74]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x74]
_022575B0:
	cmp r7, #0x3a
	bne _022575DA
	mov r0, #0x39
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x24]
	add r1, r5, #0
	mov r2, #1
	bl ov12_02252324
	cmp r0, #0
	beq _022575DA
	ldr r1, [sp, #0x74]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x74]
_022575DA:
	cmp r6, #0xd
	bne _022575F2
	mov r2, #1
	ldr r0, [sp, #4]
	add r1, r5, #0
	lsl r2, r2, #0x10
	bl ov12_02252CE8
	cmp r0, #0
	beq _022575F2
	lsl r0, r4, #0xf
	lsr r4, r0, #0x10
_022575F2:
	cmp r6, #0xa
	bne _0225760A
	mov r2, #2
	ldr r0, [sp, #4]
	add r1, r5, #0
	lsl r2, r2, #0x10
	bl ov12_02252CE8
	cmp r0, #0
	beq _0225760A
	lsl r0, r4, #0xf
	lsr r4, r0, #0x10
_0225760A:
	cmp r6, #0xc
	bne _0225762E
	cmp r7, #0x41
	bne _0225762E
	ldr r0, [sp, #0x4c]
	mov r1, #3
	bl _s32_div_f
	ldr r1, [sp, #0x50]
	cmp r1, r0
	bgt _0225762E
	mov r0, #0x96
	mul r0, r4
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0225762E:
	cmp r6, #0xa
	bne _02257652
	cmp r7, #0x42
	bne _02257652
	ldr r0, [sp, #0x4c]
	mov r1, #3
	bl _s32_div_f
	ldr r1, [sp, #0x50]
	cmp r1, r0
	bgt _02257652
	mov r0, #0x96
	mul r0, r4
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02257652:
	cmp r6, #0xb
	bne _02257676
	cmp r7, #0x43
	bne _02257676
	ldr r0, [sp, #0x4c]
	mov r1, #3
	bl _s32_div_f
	ldr r1, [sp, #0x50]
	cmp r1, r0
	bgt _02257676
	mov r0, #0x96
	mul r0, r4
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02257676:
	cmp r6, #6
	bne _0225769A
	cmp r7, #0x44
	bne _0225769A
	ldr r0, [sp, #0x4c]
	mov r1, #3
	bl _s32_div_f
	ldr r1, [sp, #0x50]
	cmp r1, r0
	bgt _0225769A
	mov r0, #0x96
	mul r0, r4
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0225769A:
	cmp r6, #0xa
	bne _022576B2
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x20]
	add r0, r5, #0
	mov r3, #0x55
	bl ov12_02252834
	cmp r0, #1
	bne _022576B2
	lsl r0, r4, #0xf
	lsr r4, r0, #0x10
_022576B2:
	cmp r6, #0xa
	bne _022576D4
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x20]
	add r0, r5, #0
	mov r3, #0x57
	bl ov12_02252834
	cmp r0, #1
	bne _022576D4
	mov r0, #0x7d
	mul r0, r4
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_022576D4:
	cmp r7, #0x56
	bne _02257714
	ldr r0, [sp, #0x70]
	mov r1, #5
	lsl r0, r0, #0x19
	asr r0, r0, #0x18
	str r0, [sp, #0x70]
	ldr r0, [sp, #0x70]
	mvn r1, r1
	cmp r0, r1
	bge _022576EC
	str r1, [sp, #0x70]
_022576EC:
	ldr r0, [sp, #0x70]
	cmp r0, #6
	ble _022576F6
	mov r0, #6
	str r0, [sp, #0x70]
_022576F6:
	ldr r0, [sp, #0x68]
	mov r1, #5
	lsl r0, r0, #0x19
	asr r0, r0, #0x18
	str r0, [sp, #0x68]
	ldr r0, [sp, #0x68]
	mvn r1, r1
	cmp r0, r1
	bge _0225770A
	str r1, [sp, #0x68]
_0225770A:
	ldr r0, [sp, #0x68]
	cmp r0, #6
	ble _02257714
	mov r0, #6
	str r0, [sp, #0x68]
_02257714:
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x20]
	add r0, r5, #0
	mov r3, #0x56
	bl ov12_02252834
	cmp r0, #1
	bne _02257760
	ldr r0, [sp, #0x6c]
	mov r1, #5
	lsl r0, r0, #0x19
	asr r0, r0, #0x18
	str r0, [sp, #0x6c]
	ldr r0, [sp, #0x6c]
	mvn r1, r1
	cmp r0, r1
	bge _02257738
	str r1, [sp, #0x6c]
_02257738:
	ldr r0, [sp, #0x6c]
	cmp r0, #6
	ble _02257742
	mov r0, #6
	str r0, [sp, #0x6c]
_02257742:
	ldr r0, [sp, #0x64]
	mov r1, #5
	lsl r0, r0, #0x19
	asr r0, r0, #0x18
	str r0, [sp, #0x64]
	ldr r0, [sp, #0x64]
	mvn r1, r1
	cmp r0, r1
	bge _02257756
	str r1, [sp, #0x64]
_02257756:
	ldr r0, [sp, #0x64]
	cmp r0, #6
	ble _02257760
	mov r0, #6
	str r0, [sp, #0x64]
_02257760:
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x20]
	add r0, r5, #0
	mov r3, #0x6d
	bl ov12_02252834
	cmp r0, #1
	bne _02257776
	mov r0, #0
	str r0, [sp, #0x70]
	str r0, [sp, #0x68]
_02257776:
	cmp r7, #0x6d
	bne _02257780
	mov r0, #0
	str r0, [sp, #0x6c]
	str r0, [sp, #0x64]
_02257780:
	ldr r0, [sp, #0x70]
	add r0, r0, #6
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [sp, #0x70]
	ldr r0, [sp, #0x6c]
	add r0, r0, #6
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [sp, #0x6c]
	ldr r0, [sp, #0x68]
	add r0, r0, #6
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [sp, #0x68]
	ldr r0, [sp, #0x64]
	add r0, r0, #6
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [sp, #0x64]
	cmp r7, #0x4f
	bne _022577CE
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0x3c]
	cmp r1, r0
	bne _022577CE
	add r0, r1, #0
	cmp r0, #2
	beq _022577CE
	ldr r0, [sp, #0x3c]
	cmp r0, #2
	beq _022577CE
	mov r0, #0x7d
	mul r0, r4
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_022577CE:
	cmp r7, #0x4f
	bne _022577F4
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0x3c]
	cmp r1, r0
	beq _022577F4
	add r0, r1, #0
	cmp r0, #2
	beq _022577F4
	ldr r0, [sp, #0x3c]
	cmp r0, #2
	beq _022577F4
	mov r0, #0x4b
	mul r0, r4
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_022577F4:
	ldr r2, _02257AE4 ; =ov12_0226CBBE
	mov r3, #0
_022577F8:
	ldrh r1, [r2]
	ldr r0, [sp, #8]
	cmp r0, r1
	bne _02257814
	cmp r7, #0x59
	bne _02257814
	mov r0, #0xc
	mul r0, r4
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	b _0225781C
_02257814:
	add r3, r3, #1
	add r2, r2, #2
	cmp r3, #0xf
	blo _022577F8
_0225781C:
	mov r0, #0xd
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _022578EE
	mov r0, #0x4c
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _022578EE
	ldr r0, [sp, #0xa0]
	mov r1, #0x30
	and r0, r1
	str r0, [sp, #0x1c]
	beq _02257864
	cmp r7, #0x5e
	bne _02257864
	ldr r1, [sp, #0x74]
	mov r0, #0xf
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x74]
_02257864:
	ldr r0, [sp, #0xa0]
	mov r1, #0xc
	tst r0, r1
	beq _0225788A
	ldr r0, [sp, #0x38]
	cmp r0, #5
	beq _02257878
	ldr r0, [sp, #0x34]
	cmp r0, #5
	bne _0225788A
_02257878:
	ldr r1, [sp, #0x10]
	mov r0, #0xf
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
_0225788A:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _022578B6
	mov r0, #0x7a
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x24]
	add r1, r5, #0
	mov r2, #1
	bl ov12_02252324
	cmp r0, #0
	beq _022578B6
	ldr r1, [sp, #0x7c]
	mov r0, #0xf
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x7c]
_022578B6:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _022578EE
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x68
	beq _022578EE
	mov r0, #0x7a
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x20]
	add r1, r5, #0
	mov r2, #1
	bl ov12_02252324
	cmp r0, #0
	beq _022578EE
	ldr r1, [sp, #0x10]
	mov r0, #0xf
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
_022578EE:
	ldr r0, [sp, #0x18]
	add r1, r5, r0
	ldr r0, _02257AE8 ; =0x000003DE
	ldrh r0, [r1, r0]
	str r0, [sp, #0x14]
	cmp r0, #7
	bne _02257904
	ldr r0, [sp, #0x78]
	lsl r0, r0, #0xf
	lsr r0, r0, #0x10
	str r0, [sp, #0x78]
_02257904:
	ldr r0, [sp, #0x80]
	cmp r0, #0
	bne _02257A06
	ldr r0, [sp, #0xb4]
	cmp r0, #1
	bls _02257932
	ldr r0, [sp, #0x70]
	cmp r0, #6
	ble _0225792C
	lsl r1, r0, #1
	ldr r0, _02257AEC ; =ov12_0226CB88
	ldr r2, [sp, #0x7c]
	ldrb r0, [r0, r1]
	mul r0, r2
	ldr r2, _02257AF0 ; =ov12_0226CB89
	ldrb r1, [r2, r1]
	bl _s32_div_f
	str r0, [sp, #0x84]
	b _02257948
_0225792C:
	ldr r0, [sp, #0x7c]
	str r0, [sp, #0x84]
	b _02257948
_02257932:
	ldr r0, [sp, #0x70]
	ldr r2, [sp, #0x7c]
	lsl r1, r0, #1
	ldr r0, _02257AEC ; =ov12_0226CB88
	ldrb r0, [r0, r1]
	mul r0, r2
	ldr r2, _02257AF0 ; =ov12_0226CB89
	ldrb r1, [r2, r1]
	bl _s32_div_f
	str r0, [sp, #0x84]
_02257948:
	ldr r0, [sp, #0x84]
	add r1, r0, #0
	ldr r0, [sp, #0x60]
	mul r1, r4
	str r1, [sp, #0x84]
	lsl r0, r0, #1
	mov r1, #5
	bl _s32_div_f
	add r1, r0, #2
	ldr r0, [sp, #0x84]
	mul r1, r0
	ldr r0, [sp, #0xb4]
	str r1, [sp, #0x84]
	cmp r0, #1
	bls _02257984
	ldr r0, [sp, #0x6c]
	cmp r0, #6
	bge _0225799A
	lsl r1, r0, #1
	ldr r0, _02257AEC ; =ov12_0226CB88
	ldr r2, [sp, #0x78]
	ldrb r0, [r0, r1]
	mul r0, r2
	ldr r2, _02257AF0 ; =ov12_0226CB89
	ldrb r1, [r2, r1]
	bl _s32_div_f
	str r0, [sp, #0x78]
	b _0225799A
_02257984:
	ldr r0, [sp, #0x6c]
	ldr r2, [sp, #0x78]
	lsl r1, r0, #1
	ldr r0, _02257AEC ; =ov12_0226CB88
	ldrb r0, [r0, r1]
	mul r0, r2
	ldr r2, _02257AF0 ; =ov12_0226CB89
	ldrb r1, [r2, r1]
	bl _s32_div_f
	str r0, [sp, #0x78]
_0225799A:
	ldr r0, [sp, #0x84]
	ldr r1, [sp, #0x78]
	bl _s32_div_f
	mov r1, #0x32
	bl _s32_div_f
	str r0, [sp, #0x84]
	ldr r0, [sp, #0x48]
	mov r1, #0x10
	tst r0, r1
	beq _022579C0
	cmp r7, #0x3e
	beq _022579C0
	ldr r0, [sp, #0x84]
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r0, r1, #1
	str r0, [sp, #0x84]
_022579C0:
	ldr r0, [sp, #0xc]
	mov r2, #1
	tst r0, r2
	beq _022579D4
	ldr r0, [sp, #0xb4]
	cmp r0, #1
	bne _022579D4
	ldr r0, [sp, #0x14]
	cmp r0, #0xba
	bne _022579D6
_022579D4:
	b _02257AFE
_022579D6:
	ldr r0, [sp, #0x5c]
	mov r1, #2
	tst r0, r1
	beq _022579FA
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x20]
	add r1, r5, #0
	bl ov12_02252260
	cmp r0, #2
	bne _022579FA
	ldr r0, [sp, #0x84]
	mov r1, #3
	lsl r0, r0, #1
	bl _s32_div_f
	str r0, [sp, #0x84]
	b _02257AFE
_022579FA:
	ldr r0, [sp, #0x84]
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r0, r1, #1
	str r0, [sp, #0x84]
	b _02257AFE
_02257A06:
	cmp r0, #1
	bne _02257AFE
	ldr r0, [sp, #0xb4]
	cmp r0, #1
	bls _02257A32
	ldr r0, [sp, #0x68]
	cmp r0, #6
	ble _02257A2C
	lsl r1, r0, #1
	ldr r0, _02257AEC ; =ov12_0226CB88
	ldr r2, [sp, #0x74]
	ldrb r0, [r0, r1]
	mul r0, r2
	ldr r2, _02257AF0 ; =ov12_0226CB89
	ldrb r1, [r2, r1]
	bl _s32_div_f
	str r0, [sp, #0x84]
	b _02257A48
_02257A2C:
	ldr r0, [sp, #0x74]
	str r0, [sp, #0x84]
	b _02257A48
_02257A32:
	ldr r0, [sp, #0x68]
	ldr r2, [sp, #0x74]
	lsl r1, r0, #1
	ldr r0, _02257AEC ; =ov12_0226CB88
	ldrb r0, [r0, r1]
	mul r0, r2
	ldr r2, _02257AF0 ; =ov12_0226CB89
	ldrb r1, [r2, r1]
	bl _s32_div_f
	str r0, [sp, #0x84]
_02257A48:
	ldr r0, [sp, #0x84]
	add r1, r0, #0
	ldr r0, [sp, #0x60]
	mul r1, r4
	str r1, [sp, #0x84]
	lsl r0, r0, #1
	mov r1, #5
	bl _s32_div_f
	add r1, r0, #2
	ldr r0, [sp, #0x84]
	mul r1, r0
	ldr r0, [sp, #0xb4]
	str r1, [sp, #0x84]
	cmp r0, #1
	bls _02257A84
	ldr r0, [sp, #0x64]
	cmp r0, #6
	bge _02257A9A
	lsl r1, r0, #1
	ldr r0, _02257AEC ; =ov12_0226CB88
	ldr r2, [sp, #0x10]
	ldrb r0, [r0, r1]
	mul r0, r2
	ldr r2, _02257AF0 ; =ov12_0226CB89
	ldrb r1, [r2, r1]
	bl _s32_div_f
	str r0, [sp, #0x10]
	b _02257A9A
_02257A84:
	ldr r0, [sp, #0x64]
	ldr r2, [sp, #0x10]
	lsl r1, r0, #1
	ldr r0, _02257AEC ; =ov12_0226CB88
	ldrb r0, [r0, r1]
	mul r0, r2
	ldr r2, _02257AF0 ; =ov12_0226CB89
	ldrb r1, [r2, r1]
	bl _s32_div_f
	str r0, [sp, #0x10]
_02257A9A:
	ldr r0, [sp, #0x84]
	ldr r1, [sp, #0x10]
	bl _s32_div_f
	mov r1, #0x32
	bl _s32_div_f
	str r0, [sp, #0x84]
	ldr r0, [sp, #0xc]
	mov r1, #2
	tst r0, r1
	beq _02257AFE
	ldr r0, [sp, #0xb4]
	cmp r0, #1
	bne _02257AFE
	ldr r0, [sp, #0x14]
	cmp r0, #0xba
	beq _02257AFE
	ldr r0, [sp, #0x5c]
	tst r0, r1
	beq _02257AF4
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x20]
	add r1, r5, #0
	mov r2, #1
	bl ov12_02252260
	cmp r0, #2
	bne _02257AF4
	ldr r0, [sp, #0x84]
	mov r1, #3
	lsl r0, r0, #1
	bl _s32_div_f
	str r0, [sp, #0x84]
	b _02257AFE
	nop
_02257AE4: .word ov12_0226CBBE
_02257AE8: .word 0x000003DE
_02257AEC: .word ov12_0226CB88
_02257AF0: .word ov12_0226CB89
_02257AF4:
	ldr r0, [sp, #0x84]
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r0, r1, #1
	str r0, [sp, #0x84]
_02257AFE:
	ldr r0, [sp, #0x5c]
	mov r1, #2
	add r4, r0, #0
	and r4, r1
	beq _02257B34
	ldr r0, [sp, #0x18]
	add r1, r5, r0
	ldr r0, _02257C28 ; =0x000003E6
	ldrh r0, [r1, r0]
	cmp r0, #4
	bne _02257B34
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x20]
	add r1, r5, #0
	mov r2, #1
	bl ov12_02252260
	cmp r0, #2
	bne _02257B34
	ldr r0, [sp, #0x84]
	lsl r1, r0, #1
	add r1, r0, r1
	asr r0, r1, #1
	lsr r0, r0, #0x1e
	add r0, r1, r0
	asr r0, r0, #2
	str r0, [sp, #0x84]
_02257B34:
	cmp r4, #0
	beq _02257B64
	ldr r0, [sp, #0x18]
	add r1, r5, r0
	ldr r0, _02257C28 ; =0x000003E6
	ldrh r0, [r1, r0]
	cmp r0, #8
	bne _02257B64
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x20]
	add r1, r5, #0
	mov r2, #0
	bl ov12_02252260
	cmp r0, #2
	blo _02257B64
	ldr r0, [sp, #0x84]
	lsl r1, r0, #1
	add r1, r0, r1
	asr r0, r1, #1
	lsr r0, r0, #0x1e
	add r0, r1, r0
	asr r0, r0, #2
	str r0, [sp, #0x84]
_02257B64:
	mov r0, #0xd
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _02257BFC
	mov r0, #0x4c
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _02257BFC
	ldr r0, [sp, #0xa0]
	mov r1, #3
	tst r0, r1
	beq _02257BB8
	cmp r6, #0xa
	beq _02257B9E
	cmp r6, #0xb
	beq _02257BAA
	b _02257BB8
_02257B9E:
	ldr r0, [sp, #0x84]
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r0, r1, #1
	str r0, [sp, #0x84]
	b _02257BB8
_02257BAA:
	ldr r1, [sp, #0x84]
	mov r0, #0xf
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	str r0, [sp, #0x84]
_02257BB8:
	ldr r1, _02257C2C ; =0x000080CF
	ldr r0, [sp, #0xa0]
	tst r0, r1
	beq _02257BD0
	ldr r0, [sp, #8]
	cmp r0, #0x4c
	bne _02257BD0
	ldr r0, [sp, #0x84]
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r0, r1, #1
	str r0, [sp, #0x84]
_02257BD0:
	ldr r0, [sp, #0xa0]
	mov r1, #0x30
	tst r0, r1
	beq _02257BFC
	cmp r6, #0xa
	beq _02257BE2
	cmp r6, #0xb
	beq _02257BF2
	b _02257BFC
_02257BE2:
	ldr r1, [sp, #0x84]
	mov r0, #0xf
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	str r0, [sp, #0x84]
	b _02257BFC
_02257BF2:
	ldr r0, [sp, #0x84]
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r0, r1, #1
	str r0, [sp, #0x84]
_02257BFC:
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	mov r2, #0x49
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #0
	beq _02257C1E
	cmp r6, #0xa
	bne _02257C1E
	ldr r1, [sp, #0x84]
	mov r0, #0xf
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	str r0, [sp, #0x84]
_02257C1E:
	ldr r0, [sp, #0x84]
	add r0, r0, #2
	add sp, #0x8c
	pop {r4, r5, r6, r7, pc}
	nop
_02257C28: .word 0x000003E6
_02257C2C: .word 0x000080CF
	thumb_func_end ov12_02256FF8

	thumb_func_start ov12_02257C30
ov12_02257C30: ; 0x02257C30
	push {r4, lr}
	add r4, r2, #0
	beq _02257C56
	bl ov12_0223BD98
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1c
	sub r1, r1, r2
	mov r0, #0x1c
	ror r1, r0
	add r0, r2, r1
	mov r1, #0x64
	sub r0, r1, r0
	mul r0, r4
	bl _s32_div_f
	add r4, r0, #0
	bne _02257C56
	mov r4, #1
_02257C56:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_02257C30

	thumb_func_start ov12_02257C5C
ov12_02257C5C: ; 0x02257C5C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	mov r0, #1
	add r4, r1, #0
	add r7, r2, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, r7, #0
	str r3, [sp, #4]
	bl ov12_022555EC
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl ov12_02257E74
	mov r3, #0xb5
	lsl r3, r3, #6
	add r2, r3, #0
	mov r5, #0xc0
	add r1, r7, #0
	mul r1, r5
	add r6, r4, r1
	add r2, #0x70
	ldr r2, [r6, r2]
	ldrh r1, [r6, r3]
	mov ip, r2
	ldr r2, [sp, #4]
	mul r5, r2
	add r2, r3, #0
	add r5, r4, r5
	add r2, #0x80
	ldr r2, [r5, r2]
	add r3, #0x27
	str r2, [sp, #0xc]
	ldrb r2, [r6, r3]
	cmp r2, #0x69
	bne _02257CAE
	mov r2, #1
	b _02257CB0
_02257CAE:
	mov r2, #0
_02257CB0:
	cmp r0, #0x43
	bne _02257CB8
	mov r3, #1
	b _02257CBA
_02257CB8:
	mov r3, #0
_02257CBA:
	mov r6, #1
	lsl r6, r6, #0x14
	mov r5, ip
	tst r5, r6
	beq _02257CC8
	mov r5, #1
	b _02257CCA
_02257CC8:
	mov r5, #0
_02257CCA:
	cmp r0, #0x59
	bne _02257CD6
	cmp r1, #0x71
	bne _02257CD6
	mov r6, #1
	b _02257CD8
_02257CD6:
	mov r6, #0
_02257CD8:
	cmp r0, #0x5c
	bne _02257CE4
	cmp r1, #0x53
	bne _02257CE4
	mov r1, #1
	b _02257CE6
_02257CE4:
	mov r1, #0
_02257CE6:
	lsl r5, r5, #1
	ldr r0, [sp, #0x28]
	add r3, r3, r5
	add r0, r0, r3
	add r2, r2, r0
	lsl r0, r6, #1
	add r2, r2, r0
	lsl r0, r1, #1
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #4
	bls _02257D02
	mov r5, #4
_02257D02:
	ldr r0, [sp]
	bl ov12_0223BD98
	ldr r1, _02257D68 ; =ov12_0226CB48
	ldrb r1, [r1, r5]
	bl _s32_div_f
	cmp r1, #0
	bne _02257D4C
	ldr r2, [sp, #4]
	add r0, r4, #0
	add r1, r7, #0
	mov r3, #4
	bl ov12_02252834
	cmp r0, #0
	bne _02257D4C
	ldr r2, [sp, #4]
	add r0, r4, #0
	add r1, r7, #0
	mov r3, #0x4b
	bl ov12_02252834
	cmp r0, #0
	bne _02257D4C
	mov r0, #7
	ldr r1, [sp, #0x2c]
	lsl r0, r0, #0xc
	tst r0, r1
	bne _02257D4C
	mov r1, #2
	ldr r0, [sp, #0xc]
	lsl r1, r1, #0xe
	tst r0, r1
	bne _02257D4C
	mov r0, #2
	str r0, [sp, #8]
_02257D4C:
	ldr r0, [sp, #8]
	cmp r0, #2
	bne _02257D62
	add r0, r4, #0
	add r1, r7, #0
	bl ov12_022527CC
	cmp r0, #0x61
	bne _02257D62
	mov r0, #3
	str r0, [sp, #8]
_02257D62:
	ldr r0, [sp, #8]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02257D68: .word ov12_0226CB48
	thumb_func_end ov12_02257C5C

	thumb_func_start ov12_02257D6C
ov12_02257D6C: ; 0x02257D6C
	push {r3, r4}
	ldr r4, _02257D9C ; =ov12_0226CC04
	ldr r1, _02257DA0 ; =0x0000FFFE
	mov r3, #0
_02257D74:
	ldrh r2, [r4]
	cmp r0, r2
	beq _02257D84
	add r4, r4, #2
	ldrh r2, [r4]
	add r3, r3, #1
	cmp r2, r1
	bne _02257D74
_02257D84:
	ldr r0, _02257D9C ; =ov12_0226CC04
	lsl r1, r3, #1
	ldrh r1, [r0, r1]
	ldr r0, _02257DA0 ; =0x0000FFFE
	cmp r1, r0
	bne _02257D96
	mov r0, #1
	pop {r3, r4}
	bx lr
_02257D96:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02257D9C: .word ov12_0226CC04
_02257DA0: .word 0x0000FFFE
	thumb_func_end ov12_02257D6C

	thumb_func_start ov12_02257DA4
ov12_02257DA4: ; 0x02257DA4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	str r2, [sp]
	add r5, r3, #0
	mov r4, #0
	bl ov12_02252DC4
	cmp r0, #1
	beq _02257DC8
	ldr r2, [sp]
	add r0, r6, #0
	add r1, r7, #0
	add r3, r5, #0
	bl ov12_02252DF8
	cmp r0, #1
	bne _02257DCC
_02257DC8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02257DCC:
	ldr r2, _02257DF4 ; =ov12_0226CC04
	ldr r0, _02257DF8 ; =0x0000FFFF
_02257DD0:
	ldrh r1, [r2]
	cmp r5, r1
	beq _02257DE0
	add r2, r2, #2
	ldrh r1, [r2]
	add r4, r4, #1
	cmp r1, r0
	bne _02257DD0
_02257DE0:
	ldr r0, _02257DF4 ; =ov12_0226CC04
	lsl r1, r4, #1
	ldrh r1, [r0, r1]
	ldr r0, _02257DF8 ; =0x0000FFFF
	cmp r1, r0
	bne _02257DF0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02257DF0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02257DF4: .word ov12_0226CC04
_02257DF8: .word 0x0000FFFF
	thumb_func_end ov12_02257DA4

	thumb_func_start ov12_02257DFC
ov12_02257DFC: ; 0x02257DFC
	push {r4, r5}
	lsl r1, r1, #4
	add r4, r0, r1
	ldr r1, _02257E30 ; =0x000003DE
	ldr r3, _02257E34 ; =ov12_0226CB58
	ldrh r1, [r4, r1]
	ldr r4, _02257E30 ; =0x000003DE
	mov r2, #0
_02257E0C:
	ldrh r5, [r3]
	lsl r5, r5, #4
	add r5, r0, r5
	ldrh r5, [r5, r4]
	cmp r1, r5
	beq _02257E20
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #6
	blo _02257E0C
_02257E20:
	cmp r2, #6
	bne _02257E2A
	mov r0, #1
	pop {r4, r5}
	bx lr
_02257E2A:
	mov r0, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
_02257E30: .word 0x000003DE
_02257E34: .word ov12_0226CB58
	thumb_func_end ov12_02257DFC

	thumb_func_start ov12_02257E38
ov12_02257E38: ; 0x02257E38
	push {r4, r5}
	lsl r1, r1, #4
	add r4, r0, r1
	ldr r1, _02257E6C ; =0x000003DE
	ldr r3, _02257E70 ; =ov12_0226CB70
	ldrh r1, [r4, r1]
	ldr r4, _02257E6C ; =0x000003DE
	mov r2, #0
_02257E48:
	ldrh r5, [r3]
	lsl r5, r5, #4
	add r5, r0, r5
	ldrh r5, [r5, r4]
	cmp r1, r5
	beq _02257E5C
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #6
	blo _02257E48
_02257E5C:
	cmp r2, #6
	bne _02257E66
	mov r0, #1
	pop {r4, r5}
	bx lr
_02257E66:
	mov r0, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
_02257E6C: .word 0x000003DE
_02257E70: .word ov12_0226CB70
	thumb_func_end ov12_02257E38

	thumb_func_start ov12_02257E74
ov12_02257E74: ; 0x02257E74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0
	add r4, r2, #0
	bl GetItemIndexMapping
	add r1, r0, #0
	ldr r0, _02257E94 ; =0x00002120
	ldr r0, [r5, r0]
	bl GetItemDataPtrFromArray
	add r1, r4, #0
	bl GetItemAttr_PreloadedItemData
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02257E94: .word 0x00002120
	thumb_func_end ov12_02257E74

	thumb_func_start ov12_02257E98
ov12_02257E98: ; 0x02257E98
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r2, #0
	bl ov12_0223A7F0
	add r6, r0, #0
	mov r4, #0
	cmp r6, #0
	ble _02257EBC
_02257EAA:
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_0223AB1C
	cmp r5, r0
	beq _02257EBC
	add r4, r4, #1
	cmp r4, r6
	blt _02257EAA
_02257EBC:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_02257E98

	thumb_func_start ov12_02257EC0
ov12_02257EC0: ; 0x02257EC0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #4]
	add r5, r1, #0
	bl ov12_0223A7F0
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	sub r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #0
	ble _02257F46
_02257EDC:
	ldr r0, [sp, #0x14]
	add r7, r0, #1
	ldr r0, [sp, #0x10]
	cmp r7, r0
	bge _02257F3A
	ldr r0, [sp, #0x14]
	add r0, r5, r0
	str r0, [sp, #0xc]
_02257EEC:
	ldr r1, [sp, #0xc]
	ldr r0, _02257F4C ; =0x000021E8
	ldrb r6, [r1, r0]
	add r1, r5, r7
	ldrb r4, [r1, r0]
	lsl r0, r6, #4
	str r1, [sp, #8]
	add r1, r5, r0
	ldr r0, _02257F50 ; =0x000021B4
	ldr r0, [r1, r0]
	lsl r1, r4, #4
	add r2, r5, r1
	ldr r1, _02257F50 ; =0x000021B4
	ldr r1, [r2, r1]
	cmp r0, r1
	bne _02257F32
	cmp r0, #1
	beq _02257F14
	mov r0, #1
	b _02257F16
_02257F14:
	mov r0, #0
_02257F16:
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	add r3, r4, #0
	bl ov12_0224FC48
	cmp r0, #0
	beq _02257F32
	ldr r1, [sp, #0xc]
	ldr r0, _02257F4C ; =0x000021E8
	strb r4, [r1, r0]
	ldr r1, [sp, #8]
	strb r6, [r1, r0]
_02257F32:
	ldr r0, [sp, #0x10]
	add r7, r7, #1
	cmp r7, r0
	blt _02257EEC
_02257F3A:
	ldr r0, [sp, #0x14]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [sp, #0x14]
	cmp r1, r0
	blt _02257EDC
_02257F46:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02257F4C: .word 0x000021E8
_02257F50: .word 0x000021B4
	thumb_func_end ov12_02257EC0

	thumb_func_start ov12_02257F54
ov12_02257F54: ; 0x02257F54
	push {r4, r5}
	mov r4, #0xc0
	mul r4, r1
	add r5, r0, r4
	ldr r0, _02257F94 ; =0x00002DB0
	mov r1, #1
	ldr r4, [r5, r0]
	lsl r1, r1, #0x18
	mov r3, #0
	tst r1, r4
	bne _02257F74
	add r0, #0x10
	ldr r1, [r5, r0]
	ldr r0, _02257F98 ; =0x200400C0
	tst r0, r1
	beq _02257F8C
_02257F74:
	ldr r4, _02257F9C ; =ov12_0226CBDC
	mov r1, #0
_02257F78:
	ldr r0, [r4]
	cmp r2, r0
	bne _02257F82
	mov r3, #1
	b _02257F8E
_02257F82:
	add r1, r1, #1
	add r4, r4, #4
	cmp r1, #0xa
	blo _02257F78
	b _02257F8E
_02257F8C:
	mov r3, #1
_02257F8E:
	add r0, r3, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
_02257F94: .word 0x00002DB0
_02257F98: .word 0x200400C0
_02257F9C: .word ov12_0226CBDC
	thumb_func_end ov12_02257F54

	thumb_func_start ov12_02257FA0
ov12_02257FA0: ; 0x02257FA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	ldr r1, [r5, #0x64]
	str r0, [sp]
	add r0, r5, #0
	add r4, r2, #0
	mov r6, #0
	bl ov12_02255830
	str r0, [sp, #0xc]
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	add r2, r6, #0
	bl ov12_02255844
	str r0, [sp, #0x10]
	ldr r1, [r5, #0x6c]
	add r0, r5, #0
	bl ov12_02255830
	add r7, r0, #0
	ldr r1, [r5, #0x6c]
	add r0, r5, #0
	add r2, r6, #0
	bl ov12_02255844
	str r0, [sp, #8]
	ldr r0, [sp]
	ldr r1, [r5, #0x64]
	bl ov12_0223AB1C
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	cmp r0, #0x58
	bne _0225803C
	ldr r0, _02258164 ; =0x0000213C
	ldr r1, [r5, r0]
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r1
	beq _0225803C
	ldr r0, [r5, #0x64]
	mov r1, #0x1c
	mul r1, r0
	add r2, r5, r1
	mov r1, #0xbb
	lsl r1, r1, #2
	ldr r2, [r2, r1]
	cmp r2, #0
	beq _0225803C
	ldr r1, [r5, #0x6c]
	cmp r0, r1
	beq _0225803C
	mov r1, #0xc0
	mul r1, r0
	ldr r3, _02258168 ; =0x00002D8C
	add r1, r5, r1
	ldr r0, [r1, r3]
	add r3, r3, #4
	ldr r1, [r1, r3]
	cmp r0, r1
	bhs _0225803C
	cmp r0, #0
	beq _0225803C
	ldr r1, [sp, #0x10]
	neg r0, r2
	bl ov12_02253178
	ldr r1, _0225816C ; =0x0000215C
	mov r6, #1
	str r0, [r5, r1]
	mov r0, #0x46
	ldr r1, [r5, #0x64]
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0xd5
	str r0, [r4]
_0225803C:
	ldr r0, [sp, #0xc]
	cmp r0, #0x62
	bne _0225809E
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x62
	beq _0225809E
	ldr r0, _02258164 ; =0x0000213C
	ldr r1, [r5, r0]
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r1
	beq _0225809E
	ldr r0, _02258170 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	mov r0, #0x3e
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #2
	beq _0225809E
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	ldr r3, _02258168 ; =0x00002D8C
	add r2, r5, r2
	ldr r1, [r2, r3]
	cmp r1, #0
	beq _0225809E
	add r1, r3, #4
	ldr r1, [r2, r1]
	sub r0, #0xc1
	mul r0, r1
	mov r1, #0xa
	bl ov12_02253178
	ldr r1, _0225816C ; =0x0000215C
	mov r6, #1
	str r0, [r5, r1]
	mov r0, #0x46
	ldr r1, [r5, #0x64]
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0xd6
	str r0, [r4]
_0225809E:
	cmp r7, #0x2e
	bne _022580F2
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r2, r5, r0
	ldr r0, _02258168 ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _022580F2
	add r0, r5, #0
	bl ov12_022527CC
	cmp r0, #0x62
	beq _022580F2
	ldr r1, [r5, #0x6c]
	mov r0, #0x1c
	mul r0, r1
	add r1, r5, r0
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022580F2
	ldr r0, [r5, #0x64]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	ldr r0, _02258174 ; =0x00002D90
	add r2, r5, r2
	ldr r2, [r2, r0]
	sub r1, #0xc1
	add r0, r2, #0
	mul r0, r1
	ldr r1, [sp, #8]
	bl ov12_02253178
	ldr r1, _0225816C ; =0x0000215C
	mov r6, #1
	str r0, [r5, r1]
	lsr r0, r1, #5
	str r0, [r4]
_022580F2:
	cmp r7, #0x74
	bne _0225815E
	ldr r0, [r5, #0x64]
	mov r1, #0xc0
	mul r1, r0
	add r3, r5, r1
	ldr r1, _02258168 ; =0x00002D8C
	ldr r2, [r3, r1]
	cmp r2, #0
	beq _0225815E
	add r1, #0x2c
	ldrh r1, [r3, r1]
	cmp r1, #0
	bne _0225815E
	add r1, r5, r0
	ldr r0, _02258178 ; =0x0000219C
	ldrb r0, [r1, r0]
	bl MaskOfFlagNo
	ldr r1, [sp, #4]
	lsl r1, r1, #3
	add r2, r5, r1
	mov r1, #0x71
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	lsl r1, r1, #3
	lsr r1, r1, #0x1a
	tst r0, r1
	bne _0225815E
	ldr r1, [r5, #0x6c]
	mov r0, #0x1c
	mul r0, r1
	add r2, r5, r0
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _02258146
	add r0, #8
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0225815E
_02258146:
	ldr r0, _02258170 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0225817C ; =0x000003E9
	ldrb r1, [r1, r0]
	mov r0, #1
	tst r1, r0
	beq _0225815E
	mov r1, #0xd8
	str r1, [r4]
	add r6, r0, #0
_0225815E:
	add r0, r6, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02258164: .word 0x0000213C
_02258168: .word 0x00002D8C
_0225816C: .word 0x0000215C
_02258170: .word 0x00003044
_02258174: .word 0x00002D90
_02258178: .word 0x0000219C
_0225817C: .word 0x000003E9
	thumb_func_end ov12_02257FA0

	thumb_func_start ov12_02258180
ov12_02258180: ; 0x02258180
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r2, #0xff
	beq _022581B0
	add r1, r2, #0
	bl ov12_022527CC
	cmp r0, #0x2e
	bne _022581B0
	ldr r0, _022581B4 ; =0x00002D6C
	add r1, r5, r0
	mov r0, #0xc0
	mul r0, r4
	add r0, r1, r0
	lsl r1, r4, #1
	add r2, r5, r1
	ldr r1, _022581B8 ; =0x000030BC
	ldrh r2, [r2, r1]
	ldrb r1, [r0, r2]
	cmp r1, #0
	beq _022581B0
	sub r1, r1, #1
	strb r1, [r0, r2]
_022581B0:
	pop {r3, r4, r5, pc}
	nop
_022581B4: .word 0x00002D6C
_022581B8: .word 0x000030BC
	thumb_func_end ov12_02258180

	thumb_func_start ov12_022581BC
ov12_022581BC: ; 0x022581BC
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0223BFEC
	cmp r0, #0
	beq _022581D0
	mov r0, #0x2b
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_022581D0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov12_022581BC

	thumb_func_start ov12_022581D4
ov12_022581D4: ; 0x022581D4
	push {r4, lr}
	add r4, r1, #0
	cmp r2, #0xe
	bhi _02258294
	add r1, r2, r2
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022581E8: ; jump table
	.short _02258206 - _022581E8 - 2 ; case 0
	.short _02258218 - _022581E8 - 2 ; case 1
	.short _0225822E - _022581E8 - 2 ; case 2
	.short _02258236 - _022581E8 - 2 ; case 3
	.short _0225823E - _022581E8 - 2 ; case 4
	.short _02258244 - _022581E8 - 2 ; case 5
	.short _0225824A - _022581E8 - 2 ; case 6
	.short _02258256 - _022581E8 - 2 ; case 7
	.short _02258262 - _022581E8 - 2 ; case 8
	.short _0225826C - _022581E8 - 2 ; case 9
	.short _02258274 - _022581E8 - 2 ; case 10
	.short _0225827A - _022581E8 - 2 ; case 11
	.short _02258282 - _022581E8 - 2 ; case 12
	.short _0225828C - _022581E8 - 2 ; case 13
	.short _02258290 - _022581E8 - 2 ; case 14
_02258206:
	add r1, r3, #0
	bl ov12_0223AB1C
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	pop {r4, pc}
_02258218:
	add r1, r3, #0
	bl ov12_0223AB1C
	lsl r0, r0, #3
	add r1, r4, r0
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1d
	pop {r4, pc}
_0225822E:
	ldr r0, _0225829C ; =0x0000219C
	add r1, r4, r3
	ldrb r0, [r1, r0]
	pop {r4, pc}
_02258236:
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	pop {r4, pc}
_0225823E:
	ldr r0, _022582A0 ; =0x00003109
	ldrb r0, [r4, r0]
	pop {r4, pc}
_02258244:
	ldr r0, _022582A4 ; =0x0000311D
	ldrb r0, [r4, r0]
	pop {r4, pc}
_0225824A:
	lsl r0, r3, #2
	add r1, r4, r0
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	pop {r4, pc}
_02258256:
	lsl r0, r3, #2
	add r1, r4, r0
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	pop {r4, pc}
_02258262:
	lsl r0, r3, #4
	add r1, r4, r0
	ldr r0, _022582A8 ; =0x000021A8
	ldr r0, [r1, r0]
	pop {r4, pc}
_0225826C:
	mov r0, #0x3d
	lsl r0, r0, #4
	ldrb r0, [r4, r0]
	pop {r4, pc}
_02258274:
	ldr r0, _022582AC ; =0x00003108
	ldrb r0, [r4, r0]
	pop {r4, pc}
_0225827A:
	ldr r0, _022582B0 ; =0x000003DA
	add r1, r4, r3
	ldrb r0, [r1, r0]
	pop {r4, pc}
_02258282:
	lsl r0, r3, #4
	add r1, r4, r0
	ldr r0, _022582B4 ; =0x000021B0
	ldr r0, [r1, r0]
	pop {r4, pc}
_0225828C:
	ldr r0, [r4, #8]
	pop {r4, pc}
_02258290:
	ldr r0, [r4, #0xc]
	pop {r4, pc}
_02258294:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0225829C: .word 0x0000219C
_022582A0: .word 0x00003109
_022582A4: .word 0x0000311D
_022582A8: .word 0x000021A8
_022582AC: .word 0x00003108
_022582B0: .word 0x000003DA
_022582B4: .word 0x000021B0
	thumb_func_end ov12_022581D4

	thumb_func_start ov12_022582B8
ov12_022582B8: ; 0x022582B8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r4, [sp, #0x10]
	cmp r2, #0xb
	bhi _02258336
	add r1, r2, r2
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022582CE: ; jump table
	.short _022582E6 - _022582CE - 2 ; case 0
	.short _022582F8 - _022582CE - 2 ; case 1
	.short _02258316 - _022582CE - 2 ; case 2
	.short _0225831E - _022582CE - 2 ; case 3
	.short _02258336 - _022582CE - 2 ; case 4
	.short _02258336 - _022582CE - 2 ; case 5
	.short _02258336 - _022582CE - 2 ; case 6
	.short _02258336 - _022582CE - 2 ; case 7
	.short _02258336 - _022582CE - 2 ; case 8
	.short _02258326 - _022582CE - 2 ; case 9
	.short _02258336 - _022582CE - 2 ; case 10
	.short _0225832E - _022582CE - 2 ; case 11
_022582E6:
	add r1, r3, #0
	bl ov12_0223AB1C
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x6f
	lsl r0, r0, #2
	str r4, [r1, r0]
	pop {r3, r4, r5, pc}
_022582F8:
	add r1, r3, #0
	bl ov12_0223AB1C
	mov r1, #0x71
	lsl r1, r1, #2
	add r1, r5, r1
	lsl r0, r0, #3
	ldr r3, [r1, r0]
	ldr r2, _0225833C ; =0xFFFF8FFF
	and r3, r2
	lsl r2, r4, #0x1d
	lsr r2, r2, #0x11
	orr r2, r3
	str r2, [r1, r0]
	pop {r3, r4, r5, pc}
_02258316:
	ldr r0, _02258340 ; =0x0000219C
	add r1, r5, r3
	strb r4, [r1, r0]
	pop {r3, r4, r5, pc}
_0225831E:
	mov r0, #0x15
	lsl r0, r0, #4
	str r4, [r5, r0]
	pop {r3, r4, r5, pc}
_02258326:
	mov r0, #0x3d
	lsl r0, r0, #4
	strb r4, [r5, r0]
	pop {r3, r4, r5, pc}
_0225832E:
	ldr r0, _02258344 ; =0x000003DA
	add r1, r5, r3
	strb r4, [r1, r0]
	pop {r3, r4, r5, pc}
_02258336:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225833C: .word 0xFFFF8FFF
_02258340: .word 0x0000219C
_02258344: .word 0x000003DA
	thumb_func_end ov12_022582B8

	thumb_func_start ov12_02258348
ov12_02258348: ; 0x02258348
	push {r4, lr}
	add r3, r0, #0
	add r3, #0x88
	str r1, [r3]
	add r3, r0, #0
	ldr r1, _022583AC ; =0x007FFFFF
	add r4, r2, #0
	and r4, r1
	add r3, #0x8c
	str r4, [r3]
	lsl r1, r1, #0x17
	add r3, r2, #0
	and r3, r1
	add r1, r0, #0
	add r1, #0x90
	str r3, [r1]
	mov r3, #1
	lsl r3, r3, #0x1e
	add r1, r2, #0
	tst r1, r3
	beq _0225837A
	ldr r1, [r0, #0x64]
	add r0, #0x94
	str r1, [r0]
	b _0225839A
_0225837A:
	lsl r1, r3, #1
	tst r1, r2
	beq _02258388
	ldr r1, [r0, #0x6c]
	add r0, #0x94
	str r1, [r0]
	b _0225839A
_02258388:
	lsr r1, r3, #1
	tst r1, r2
	bne _02258394
	lsr r1, r3, #2
	tst r1, r2
	beq _0225839A
_02258394:
	mov r1, #0
	add r0, #0x94
	str r1, [r0]
_0225839A:
	cmp r4, #0x91
	blo _022583A2
	bl GF_AssertFail
_022583A2:
	ldr r0, _022583B0 ; =ov12_0226CDCC
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r4, pc}
	nop
_022583AC: .word 0x007FFFFF
_022583B0: .word ov12_0226CDCC
	thumb_func_end ov12_02258348

	thumb_func_start ov12_022583B4
ov12_022583B4: ; 0x022583B4
	push {r3, r4, r5, lr}
	ldr r1, _0225843C ; =0x0000213C
	add r5, r2, #0
	ldr r2, [r0, r1]
	mov r0, #2
	lsl r0, r0, #0xa
	add r1, r2, #0
	ldr r4, [sp, #0x14]
	tst r1, r0
	bne _022583DE
	lsl r0, r0, #4
	tst r0, r2
	bne _022583DE
	cmp r3, #0
	beq _022583DE
	add r0, r3, #0
	mul r0, r5
	mov r1, #0xa
	bl ov12_02253178
	add r3, r0, #0
_022583DE:
	cmp r5, #0
	beq _022583EC
	cmp r5, #5
	beq _022583FE
	cmp r5, #0x14
	beq _0225841C
	b _02258438
_022583EC:
	ldr r1, [r4]
	mov r0, #8
	orr r1, r0
	mov r0, #4
	bic r1, r0
	mov r0, #2
	bic r1, r0
	str r1, [r4]
	b _02258438
_022583FE:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _02258438
	ldr r1, [r4]
	mov r0, #2
	tst r0, r1
	beq _02258414
	mov r0, #2
	bic r1, r0
	str r1, [r4]
	b _02258438
_02258414:
	mov r0, #4
	orr r0, r1
	str r0, [r4]
	b _02258438
_0225841C:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _02258438
	ldr r1, [r4]
	mov r0, #4
	tst r0, r1
	beq _02258432
	mov r0, #4
	bic r1, r0
	str r1, [r4]
	b _02258438
_02258432:
	mov r0, #2
	orr r0, r1
	str r0, [r4]
_02258438:
	add r0, r3, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225843C: .word 0x0000213C
	thumb_func_end ov12_022583B4

	thumb_func_start ov12_02258440
ov12_02258440: ; 0x02258440
	lsl r1, r1, #4
	add r2, r0, r1
	ldr r1, _022584A4 ; =0x000003DE
	ldrh r3, [r2, r1]
	cmp r3, #0x9b
	bgt _02258472
	cmp r3, #0x97
	blt _02258458
	beq _02258492
	cmp r3, #0x9b
	beq _02258492
	b _0225849E
_02258458:
	cmp r3, #0x27
	bgt _02258464
	bge _02258492
	cmp r3, #0x1a
	beq _02258492
	b _0225849E
_02258464:
	cmp r3, #0x4b
	bgt _0225846C
	beq _02258492
	b _0225849E
_0225846C:
	cmp r3, #0x91
	beq _02258492
	b _0225849E
_02258472:
	mov r2, #1
	lsl r2, r2, #8
	cmp r3, r2
	bgt _02258482
	bge _02258492
	cmp r3, #0xff
	beq _02258492
	b _0225849E
_02258482:
	add r1, r2, #7
	cmp r3, r1
	bgt _0225848C
	beq _02258492
	b _0225849E
_0225848C:
	add r2, #0x11
	cmp r3, r2
	bne _0225849E
_02258492:
	ldr r1, _022584A8 ; =0x0000213C
	ldr r1, [r0, r1]
	mov r0, #2
	lsl r0, r0, #8
	and r0, r1
	bx lr
_0225849E:
	mov r0, #1
	bx lr
	nop
_022584A4: .word 0x000003DE
_022584A8: .word 0x0000213C
	thumb_func_end ov12_02258440

	thumb_func_start ov12_022584AC
ov12_022584AC: ; 0x022584AC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	cmp r2, #0x1b
	bne _022584C2
	mov r0, #0xc0
	mul r0, r6
	add r1, r5, r0
	ldr r0, _02258578 ; =0x00002D64
	ldrb r4, [r1, r0]
	b _022584D6
_022584C2:
	cmp r2, #0x1c
	bne _022584D2
	mov r0, #0xc0
	mul r0, r6
	add r1, r5, r0
	ldr r0, _0225857C ; =0x00002D65
	ldrb r4, [r1, r0]
	b _022584D6
_022584D2:
	bl GF_AssertFail
_022584D6:
	mov r0, #0xc0
	mul r0, r6
	mov r2, #0xb5
	add r1, r5, r0
	lsl r2, r2, #6
	ldrh r3, [r1, r2]
	ldr r0, _02258580 ; =0x000001ED
	cmp r3, r0
	bne _02258572
	add r0, r2, #0
	add r0, #0x27
	ldrb r0, [r1, r0]
	cmp r0, #0x79
	bne _02258572
	add r2, #0x78
	ldrh r1, [r1, r2]
	add r0, r5, #0
	mov r2, #1
	bl ov12_02257E74
	sub r0, #0x7e
	cmp r0, #0xf
	bhi _02258570
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02258510: ; jump table
	.short _02258530 - _02258510 - 2 ; case 0
	.short _02258534 - _02258510 - 2 ; case 1
	.short _02258538 - _02258510 - 2 ; case 2
	.short _0225853C - _02258510 - 2 ; case 3
	.short _02258540 - _02258510 - 2 ; case 4
	.short _02258544 - _02258510 - 2 ; case 5
	.short _02258548 - _02258510 - 2 ; case 6
	.short _0225854C - _02258510 - 2 ; case 7
	.short _02258550 - _02258510 - 2 ; case 8
	.short _02258554 - _02258510 - 2 ; case 9
	.short _02258558 - _02258510 - 2 ; case 10
	.short _0225855C - _02258510 - 2 ; case 11
	.short _02258560 - _02258510 - 2 ; case 12
	.short _02258564 - _02258510 - 2 ; case 13
	.short _02258568 - _02258510 - 2 ; case 14
	.short _0225856C - _02258510 - 2 ; case 15
_02258530:
	mov r4, #0xa
	b _02258572
_02258534:
	mov r4, #0xb
	b _02258572
_02258538:
	mov r4, #0xd
	b _02258572
_0225853C:
	mov r4, #0xc
	b _02258572
_02258540:
	mov r4, #0xf
	b _02258572
_02258544:
	mov r4, #1
	b _02258572
_02258548:
	mov r4, #3
	b _02258572
_0225854C:
	mov r4, #4
	b _02258572
_02258550:
	mov r4, #2
	b _02258572
_02258554:
	mov r4, #0xe
	b _02258572
_02258558:
	mov r4, #6
	b _02258572
_0225855C:
	mov r4, #5
	b _02258572
_02258560:
	mov r4, #7
	b _02258572
_02258564:
	mov r4, #0x10
	b _02258572
_02258568:
	mov r4, #0x11
	b _02258572
_0225856C:
	mov r4, #8
	b _02258572
_02258570:
	mov r4, #0
_02258572:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_02258578: .word 0x00002D64
_0225857C: .word 0x00002D65
_02258580: .word 0x000001ED
	thumb_func_end ov12_022584AC

	thumb_func_start ov12_02258584
ov12_02258584: ; 0x02258584
	lsl r1, r1, #3
	add r3, r0, r1
	mov r2, #0
	mov r0, #0x37
	add r1, r2, #0
	lsl r0, r0, #4
_02258590:
	add r2, r2, #1
	strh r1, [r3, r0]
	add r3, r3, #2
	cmp r2, #4
	blt _02258590
	bx lr
	thumb_func_end ov12_02258584

	thumb_func_start ov12_0225859C
ov12_0225859C: ; 0x0225859C
	add r1, r0, r1
	mov r0, #0x39
	mov r2, #0
	lsl r0, r0, #4
	strb r2, [r1, r0]
	bx lr
	thumb_func_end ov12_0225859C

	thumb_func_start ov12_022585A8
ov12_022585A8: ; 0x022585A8
	lsl r1, r1, #1
	add r1, r0, r1
	mov r0, #0xe5
	mov r2, #0
	lsl r0, r0, #2
	strh r2, [r1, r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov12_022585A8

	thumb_func_start ov12_022585B8
ov12_022585B8: ; 0x022585B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	mov r2, #0xff
	mov ip, r2
	mov r2, #0xc0
	add r7, r5, #0
	mul r7, r2
	ldr r2, _02258654 ; =0x00002D67
	add r6, r1, r7
	add r4, r3, #0
	ldrb r3, [r6, r2]
	cmp r3, #0x3b
	beq _02258614
	cmp r3, #0x24
	beq _02258614
	cmp r3, #0x79
	beq _02258614
	add r2, #0x25
	ldr r2, [r6, r2]
	cmp r2, #0
	beq _02258614
	mov r2, #0xc0
	mul r2, r4
	add r6, r1, r2
	ldr r2, _02258654 ; =0x00002D67
	add r2, #0x25
	ldr r2, [r6, r2]
	cmp r2, #0
	beq _02258614
	ldr r2, _02258654 ; =0x00002D67
	ldrb r2, [r6, r2]
	cmp r2, #0x3b
	beq _02258614
	cmp r2, #0x24
	beq _02258614
	cmp r2, #0x79
	beq _02258614
	bl ov12_0223BD98
	mov r1, #1
	tst r0, r1
	beq _02258610
	mov ip, r4
	b _0225864E
_02258610:
	mov ip, r5
	b _0225864E
_02258614:
	cmp r3, #0x3b
	beq _0225862E
	cmp r3, #0x24
	beq _0225862E
	ldr r0, _02258658 ; =0x00002D8C
	add r2, r1, r7
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0225862E
	cmp r3, #0x79
	beq _0225862E
	mov ip, r5
	b _0225864E
_0225862E:
	mov r0, #0xc0
	mul r0, r4
	add r2, r1, r0
	ldr r0, _02258654 ; =0x00002D67
	ldrb r1, [r2, r0]
	cmp r1, #0x3b
	beq _0225864E
	cmp r1, #0x24
	beq _0225864E
	add r0, #0x25
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0225864E
	cmp r1, #0x79
	beq _0225864E
	mov ip, r4
_0225864E:
	mov r0, ip
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02258654: .word 0x00002D67
_02258658: .word 0x00002D8C
	thumb_func_end ov12_022585B8

	thumb_func_start ov12_0225865C
ov12_0225865C: ; 0x0225865C
	lsl r1, r1, #4
	add r1, r0, r1
	ldr r0, _02258680 ; =0x000003DE
	ldr r3, _02258684 ; =ov12_0226CB64
	ldrh r1, [r1, r0]
	mov r2, #0
_02258668:
	ldrh r0, [r3]
	cmp r0, r1
	bne _02258672
	mov r0, #1
	bx lr
_02258672:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #6
	blo _02258668
	mov r0, #0
	bx lr
	nop
_02258680: .word 0x000003DE
_02258684: .word ov12_0226CB64
	thumb_func_end ov12_0225865C

	thumb_func_start ov12_02258688
ov12_02258688: ; 0x02258688
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	ldr r2, _022587F4 ; =0x00000137
	add r7, r0, #0
	add r4, r1, #0
	cmp r3, r2
	bgt _022586A0
	blt _0225869A
	b _0225879C
_0225869A:
	cmp r3, #0xed
	beq _02258742
	b _022587EE
_022586A0:
	add r0, r2, #0
	add r0, #0x34
	cmp r3, r0
	bgt _022586B0
	add r2, #0x34
	cmp r3, r2
	beq _022586B8
	b _022587EE
_022586B0:
	add r2, #0x8a
	cmp r3, r2
	beq _022586C4
	b _022587EE
_022586B8:
	add r0, r4, #0
	add r1, r6, #0
	bl ov12_022558A4
	add r5, r0, #0
	b _022587F0
_022586C4:
	add r0, r4, #0
	add r1, r6, #0
	bl ov12_02255830
	sub r0, #0x7e
	cmp r0, #0xf
	bhi _0225873E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022586DE: ; jump table
	.short _0225871E - _022586DE - 2 ; case 0
	.short _02258722 - _022586DE - 2 ; case 1
	.short _0225872A - _022586DE - 2 ; case 2
	.short _02258726 - _022586DE - 2 ; case 3
	.short _02258732 - _022586DE - 2 ; case 4
	.short _022586FE - _022586DE - 2 ; case 5
	.short _02258706 - _022586DE - 2 ; case 6
	.short _0225870A - _022586DE - 2 ; case 7
	.short _02258702 - _022586DE - 2 ; case 8
	.short _0225872E - _022586DE - 2 ; case 9
	.short _02258712 - _022586DE - 2 ; case 10
	.short _0225870E - _022586DE - 2 ; case 11
	.short _02258716 - _022586DE - 2 ; case 12
	.short _02258736 - _022586DE - 2 ; case 13
	.short _0225873A - _022586DE - 2 ; case 14
	.short _0225871A - _022586DE - 2 ; case 15
_022586FE:
	mov r5, #1
	b _022587F0
_02258702:
	mov r5, #2
	b _022587F0
_02258706:
	mov r5, #3
	b _022587F0
_0225870A:
	mov r5, #4
	b _022587F0
_0225870E:
	mov r5, #5
	b _022587F0
_02258712:
	mov r5, #6
	b _022587F0
_02258716:
	mov r5, #7
	b _022587F0
_0225871A:
	mov r5, #8
	b _022587F0
_0225871E:
	mov r5, #0xa
	b _022587F0
_02258722:
	mov r5, #0xb
	b _022587F0
_02258726:
	mov r5, #0xc
	b _022587F0
_0225872A:
	mov r5, #0xd
	b _022587F0
_0225872E:
	mov r5, #0xe
	b _022587F0
_02258732:
	mov r5, #0xf
	b _022587F0
_02258736:
	mov r5, #0x10
	b _022587F0
_0225873A:
	mov r5, #0x11
	b _022587F0
_0225873E:
	mov r5, #0
	b _022587F0
_02258742:
	ldr r0, _022587F8 ; =0x00002D54
	add r1, r4, r0
	mov r0, #0xc0
	mul r0, r6
	ldr r4, [r1, r0]
	lsl r0, r4, #2
	lsr r0, r0, #0x1b
	lsl r0, r0, #0x1f
	lsr r5, r0, #0x1a
	lsl r0, r4, #7
	lsr r0, r0, #0x1b
	lsl r0, r0, #0x1f
	lsr r3, r0, #0x1b
	lsl r0, r4, #0xc
	lsr r0, r0, #0x1b
	lsl r0, r0, #0x1f
	lsr r2, r0, #0x1c
	lsl r0, r4, #0x11
	lsr r0, r0, #0x1b
	lsl r0, r0, #0x1f
	lsr r1, r0, #0x1d
	lsl r0, r4, #0x1b
	lsl r4, r4, #0x16
	lsr r4, r4, #0x1b
	lsr r6, r0, #0x1b
	mov r0, #1
	lsl r4, r4, #0x1f
	and r0, r6
	lsr r4, r4, #0x1e
	orr r0, r4
	orr r0, r1
	orr r0, r2
	orr r0, r3
	add r1, r5, #0
	orr r1, r0
	mov r0, #0xf
	mul r0, r1
	mov r1, #0x3f
	bl _s32_div_f
	add r5, r0, #1
	cmp r5, #9
	blt _022587F0
	add r5, r5, #1
	b _022587F0
_0225879C:
	mov r2, #0xd
	str r2, [sp]
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _022587F0
	mov r0, #0x4c
	str r0, [sp]
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _022587F0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	ldr r1, _022587FC ; =0x000080FF
	tst r1, r0
	beq _022587F0
	mov r1, #3
	tst r1, r0
	beq _022587D4
	mov r5, #0xb
_022587D4:
	mov r1, #0xc
	tst r1, r0
	beq _022587DC
	mov r5, #5
_022587DC:
	mov r1, #0x30
	tst r1, r0
	beq _022587E4
	mov r5, #0xa
_022587E4:
	mov r1, #0xc0
	tst r0, r1
	beq _022587F0
	mov r5, #0xf
	b _022587F0
_022587EE:
	mov r5, #0
_022587F0:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022587F4: .word 0x00000137
_022587F8: .word 0x00002D54
_022587FC: .word 0x000080FF
	thumb_func_end ov12_02258688

	thumb_func_start ov12_02258800
ov12_02258800: ; 0x02258800
	push {r4, r5, r6, r7, lr}
	sub sp, #0x94
	str r1, [sp, #0x18]
	add r7, r0, #0
	bl ov12_0223A7E4
	add r5, r0, #0
	ldr r0, [sp, #0x18]
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r7, #0
	bl ov12_0223A7E0
	mov r1, #0x10
	tst r0, r1
	bne _0225882C
	add r0, r7, #0
	bl ov12_0223A7E0
	mov r1, #8
	tst r0, r1
	beq _02258830
_0225882C:
	str r4, [sp, #0x44]
	b _0225883E
_02258830:
	ldr r1, [sp, #0x18]
	add r0, r7, #0
	bl ov12_0223AB6C
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x44]
_0225883E:
	ldr r2, [sp, #0x18]
	add r0, r7, #0
	add r1, r5, #0
	bl ov12_02253DA0
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r1, [sp, #0x18]
	add r0, r7, #0
	bl ov12_0223A834
	str r0, [sp, #0x40]
	mov r0, #0
	str r0, [sp, #0x50]
	add r0, r5, r4
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x44]
	add r0, r5, r0
	str r0, [sp, #0x30]
_02258864:
	mov r0, #0
	str r0, [sp, #0x48]
	mov r0, #6
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x40]
	ldr r4, [sp, #0x48]
	cmp r0, #0
	ble _02258968
_02258874:
	ldr r1, [sp, #0x18]
	add r0, r7, #0
	add r2, r4, #0
	bl ov12_0223A880
	mov r1, #0xae
	mov r2, #0
	str r0, [sp, #0x68]
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	beq _02258950
	ldr r0, _02258B8C ; =0x000001EE
	cmp r1, r0
	beq _02258950
	ldr r0, [sp, #0x68]
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02258950
	add r0, r4, #0
	bl MaskOfFlagNo
	ldr r1, [sp, #0x50]
	tst r0, r1
	bne _02258950
	ldr r1, [sp, #0x34]
	ldr r0, _02258B90 ; =0x0000219C
	ldrb r0, [r1, r0]
	cmp r4, r0
	beq _02258950
	ldr r1, [sp, #0x30]
	ldr r0, _02258B90 ; =0x0000219C
	ldrb r0, [r1, r0]
	cmp r4, r0
	beq _02258950
	ldr r1, [sp, #0x34]
	ldr r0, _02258B94 ; =0x000021A4
	ldrb r0, [r1, r0]
	cmp r4, r0
	beq _02258950
	ldr r1, [sp, #0x30]
	ldr r0, _02258B94 ; =0x000021A4
	ldrb r0, [r1, r0]
	cmp r4, r0
	beq _02258950
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1b
	mov r3, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x60]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1c
	mov r3, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0x68]
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x68]
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #0x60]
	ldr r2, [sp, #0x5c]
	bl ov12_0225264C
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x60]
	ldr r2, [sp, #0x5c]
	bl ov12_0225264C
	ldr r1, [sp, #0x4c]
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x4c]
	ldr r1, [sp, #0x48]
	cmp r1, r0
	bhs _02258960
	ldr r0, [sp, #0x4c]
	str r0, [sp, #0x48]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x38]
	b _02258960
_02258950:
	add r0, r4, #0
	bl MaskOfFlagNo
	ldr r1, [sp, #0x50]
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x50]
_02258960:
	ldr r0, [sp, #0x40]
	add r4, r4, #1
	cmp r4, r0
	blt _02258874
_02258968:
	ldr r0, [sp, #0x38]
	cmp r0, #6
	beq _02258A30
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x38]
	add r0, r7, #0
	bl ov12_0223A880
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #0x20]
_0225897E:
	ldr r1, [sp, #0x20]
	add r0, r4, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x3c]
	ldr r3, [sp, #0x3c]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov12_02258BB4
	str r0, [sp, #0x6c]
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _02258A08
	mov r0, #0
	str r0, [sp, #0x90]
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x70]
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_022527CC
	str r0, [sp, #0x74]
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_02255830
	str r0, [sp, #0x78]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1b
	mov r3, #0
	bl ov12_0224EDE0
	str r0, [sp, #0x7c]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1c
	mov r3, #0
	bl ov12_0224EDE0
	ldr r1, [sp, #0x74]
	ldr r2, [sp, #0x6c]
	str r1, [sp]
	ldr r1, [sp, #0x78]
	ldr r3, [sp, #0x70]
	str r1, [sp, #4]
	ldr r1, [sp, #0x7c]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	add r0, sp, #0x90
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x3c]
	add r0, r5, #0
	bl ov12_02252054
	ldr r1, [sp, #0x90]
	mov r0, #2
	tst r0, r1
	bne _02258A12
_02258A08:
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #4
	blt _0225897E
_02258A12:
	ldr r0, [sp, #0x20]
	cmp r0, #4
	bne _02258A2A
	ldr r0, [sp, #0x38]
	bl MaskOfFlagNo
	ldr r1, [sp, #0x50]
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x50]
	b _02258A34
_02258A2A:
	ldr r0, [sp, #0x38]
	add sp, #0x94
	pop {r4, r5, r6, r7, pc}
_02258A30:
	mov r0, #0x3f
	str r0, [sp, #0x50]
_02258A34:
	ldr r0, [sp, #0x50]
	cmp r0, #0x3f
	beq _02258A3C
	b _02258864
_02258A3C:
	mov r0, #0
	str r0, [sp, #0x28]
	mov r0, #6
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x40]
	cmp r0, #0
	bgt _02258A50
	b _02258B84
_02258A50:
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x24]
	add r0, r7, #0
	bl ov12_0223A880
	mov r1, #0xae
	mov r2, #0
	str r0, [sp, #0x1c]
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	beq _02258A70
	ldr r0, _02258B8C ; =0x000001EE
	cmp r1, r0
	bne _02258A72
_02258A70:
	b _02258B76
_02258A72:
	ldr r0, [sp, #0x1c]
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02258B76
	ldr r0, _02258B90 ; =0x0000219C
	ldr r1, [sp, #0x34]
	ldrb r2, [r1, r0]
	ldr r1, [sp, #0x24]
	cmp r1, r2
	beq _02258B76
	ldr r1, [sp, #0x30]
	ldrb r2, [r1, r0]
	ldr r1, [sp, #0x24]
	cmp r1, r2
	beq _02258B76
	add r2, r0, #0
	ldr r1, [sp, #0x34]
	add r2, #8
	ldrb r2, [r1, r2]
	ldr r1, [sp, #0x24]
	cmp r1, r2
	beq _02258B76
	ldr r1, [sp, #0x30]
	add r0, #8
	ldrb r1, [r1, r0]
	ldr r0, [sp, #0x24]
	cmp r0, r1
	beq _02258B76
	mov r0, #0
	str r0, [sp, #0x64]
	ldr r0, [sp, #0x18]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x84]
	ldr r0, [sp, #0x24]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x88]
_02258AC4:
	ldr r1, [sp, #0x64]
	ldr r0, [sp, #0x1c]
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x8c]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x8c]
	add r0, r7, #0
	add r1, r5, #0
	bl ov12_02258BB4
	str r0, [sp, #0x80]
	ldr r0, [sp, #0x8c]
	cmp r0, #0
	beq _02258B5E
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _02258B98 ; =0x000003E1
	ldrb r0, [r1, r0]
	cmp r0, #1
	beq _02258B5E
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0223AB1C
	add r3, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r3, r3, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x84]
	add r4, r5, r3
	str r0, [sp, #0xc]
	mov r3, #0x6f
	str r6, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	lsl r3, r3, #2
	ldr r2, [sp, #0x8c]
	ldr r3, [r4, r3]
	add r0, r7, #0
	add r1, r5, #0
	bl ov12_02256FF8
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0
	str r0, [sp, #0x90]
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x80]
	str r0, [sp]
	str r6, [sp, #4]
	str r1, [sp, #8]
	add r0, sp, #0x90
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x8c]
	add r0, r7, #0
	add r1, r5, #0
	bl ov12_02251D28
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x4c]
	ldr r1, [sp, #0x90]
	ldr r0, _02258B9C ; =0x00140808
	tst r0, r1
	beq _02258B5E
	mov r0, #0
	str r0, [sp, #0x4c]
_02258B5E:
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x4c]
	cmp r1, r0
	bhs _02258B6C
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x88]
	str r0, [sp, #0x2c]
_02258B6C:
	ldr r0, [sp, #0x64]
	add r0, r0, #1
	str r0, [sp, #0x64]
	cmp r0, #4
	blt _02258AC4
_02258B76:
	ldr r0, [sp, #0x24]
	add r1, r0, #1
	ldr r0, [sp, #0x40]
	str r1, [sp, #0x24]
	cmp r1, r0
	bge _02258B84
	b _02258A50
_02258B84:
	ldr r0, [sp, #0x2c]
	add sp, #0x94
	pop {r4, r5, r6, r7, pc}
	nop
_02258B8C: .word 0x000001EE
_02258B90: .word 0x0000219C
_02258B94: .word 0x000021A4
_02258B98: .word 0x000003E1
_02258B9C: .word 0x00140808
	thumb_func_end ov12_02258800

	thumb_func_start ov12_02258BA0
ov12_02258BA0: ; 0x02258BA0
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0223A7E4
	add r1, r0, r4
	ldr r0, _02258BB0 ; =0x000021A4
	ldrb r0, [r1, r0]
	pop {r4, pc}
	.balign 4, 0
_02258BB0: .word 0x000021A4
	thumb_func_end ov12_02258BA0

	thumb_func_start ov12_02258BB4
ov12_02258BB4: ; 0x02258BB4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r2, #0
	ldr r2, _02258D6C ; =0x00000137
	add r7, r0, #0
	add r6, r1, #0
	cmp r3, r2
	bgt _02258BCE
	blt _02258BC8
	b _02258D12
_02258BC8:
	cmp r3, #0xed
	beq _02258C90
	b _02258D64
_02258BCE:
	add r0, r2, #0
	add r0, #0x34
	cmp r3, r0
	bgt _02258BDE
	add r2, #0x34
	cmp r3, r2
	beq _02258BE6
	b _02258D64
_02258BDE:
	add r2, #0x8a
	cmp r3, r2
	beq _02258C02
	b _02258D64
_02258BE6:
	add r0, r4, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	mov r2, #0xc
	bl ov12_02257E74
	add r5, r0, #0
	b _02258D66
_02258C02:
	add r0, r4, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	mov r2, #1
	bl ov12_02257E74
	sub r0, #0x7e
	cmp r0, #0xf
	bhi _02258C8C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02258C2C: ; jump table
	.short _02258C6C - _02258C2C - 2 ; case 0
	.short _02258C70 - _02258C2C - 2 ; case 1
	.short _02258C78 - _02258C2C - 2 ; case 2
	.short _02258C74 - _02258C2C - 2 ; case 3
	.short _02258C80 - _02258C2C - 2 ; case 4
	.short _02258C4C - _02258C2C - 2 ; case 5
	.short _02258C54 - _02258C2C - 2 ; case 6
	.short _02258C58 - _02258C2C - 2 ; case 7
	.short _02258C50 - _02258C2C - 2 ; case 8
	.short _02258C7C - _02258C2C - 2 ; case 9
	.short _02258C60 - _02258C2C - 2 ; case 10
	.short _02258C5C - _02258C2C - 2 ; case 11
	.short _02258C64 - _02258C2C - 2 ; case 12
	.short _02258C84 - _02258C2C - 2 ; case 13
	.short _02258C88 - _02258C2C - 2 ; case 14
	.short _02258C68 - _02258C2C - 2 ; case 15
_02258C4C:
	mov r5, #1
	b _02258D66
_02258C50:
	mov r5, #2
	b _02258D66
_02258C54:
	mov r5, #3
	b _02258D66
_02258C58:
	mov r5, #4
	b _02258D66
_02258C5C:
	mov r5, #5
	b _02258D66
_02258C60:
	mov r5, #6
	b _02258D66
_02258C64:
	mov r5, #7
	b _02258D66
_02258C68:
	mov r5, #8
	b _02258D66
_02258C6C:
	mov r5, #0xa
	b _02258D66
_02258C70:
	mov r5, #0xb
	b _02258D66
_02258C74:
	mov r5, #0xc
	b _02258D66
_02258C78:
	mov r5, #0xd
	b _02258D66
_02258C7C:
	mov r5, #0xe
	b _02258D66
_02258C80:
	mov r5, #0xf
	b _02258D66
_02258C84:
	mov r5, #0x10
	b _02258D66
_02258C88:
	mov r5, #0x11
	b _02258D66
_02258C8C:
	mov r5, #0
	b _02258D66
_02258C90:
	add r0, r4, #0
	mov r1, #0x4b
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x4a
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x49
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x48
	mov r2, #0
	bl GetMonData
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0x46
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x47
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	lsl r2, r6, #0x1f
	lsl r0, r5, #0x1f
	lsr r5, r2, #0x1b
	lsl r2, r7, #0x1f
	lsr r4, r2, #0x1c
	ldr r2, [sp, #4]
	lsl r1, r1, #0x1f
	lsl r2, r2, #0x1f
	lsr r3, r2, #0x1d
	ldr r2, [sp, #8]
	mov r6, #1
	and r2, r6
	lsr r1, r1, #0x1e
	orr r1, r2
	orr r1, r3
	orr r1, r4
	lsr r0, r0, #0x1a
	orr r1, r5
	orr r1, r0
	mov r0, #0xf
	mul r0, r1
	mov r1, #0x3f
	bl _s32_div_f
	add r5, r0, #1
	cmp r5, #9
	blt _02258D66
	add r5, r5, #1
	b _02258D66
_02258D12:
	mov r2, #0xd
	str r2, [sp]
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _02258D66
	mov r0, #0x4c
	str r0, [sp]
	add r0, r7, #0
	add r1, r6, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _02258D66
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	ldr r1, _02258D70 ; =0x000080FF
	tst r1, r0
	beq _02258D66
	mov r1, #3
	tst r1, r0
	beq _02258D4A
	mov r5, #0xb
_02258D4A:
	mov r1, #0xc
	tst r1, r0
	beq _02258D52
	mov r5, #5
_02258D52:
	mov r1, #0x30
	tst r1, r0
	beq _02258D5A
	mov r5, #0xa
_02258D5A:
	mov r1, #0xc0
	tst r0, r1
	beq _02258D66
	mov r5, #0xf
	b _02258D66
_02258D64:
	mov r5, #0
_02258D66:
	add r0, r5, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02258D6C: .word 0x00000137
_02258D70: .word 0x000080FF
	thumb_func_end ov12_02258BB4

	thumb_func_start ov12_02258D74
ov12_02258D74: ; 0x02258D74
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r1, #0x6b
	mov r0, #5
	lsl r1, r1, #2
	bl AllocFromHeap
	add r4, r0, #0
	mov r2, #0x6b
	mov r0, #0
	add r1, r4, #0
	lsl r2, r2, #2
	bl MIi_CpuClearFast
	mov r0, #0x65
	ldrb r1, [r5]
	lsl r0, r0, #2
	strb r1, [r4, r0]
	ldrb r1, [r5, #1]
	add r0, r0, #1
	strb r1, [r4, r0]
	mov r0, #0xb4
	mov r1, #5
	bl NARC_ctor
	mov r1, #0x69
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02258D74

	thumb_func_start ov12_02258DB0
ov12_02258DB0: ; 0x02258DB0
	push {r4, r5, r6, lr}
	sub sp, #0x28
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov12_0223A7E0
	mov r1, #0x22
	lsl r1, r1, #4
	tst r0, r1
	bne _02258E48
	sub r1, #0x8b
	ldrb r1, [r4, r1]
	mov r0, #1
	tst r0, r1
	beq _02258DDC
	add r0, r5, #0
	bl ov12_0223A7E0
	mov r1, #1
	tst r0, r1
	beq _02258E48
_02258DDC:
	ldr r0, _02258E4C ; =0x00000195
	ldr r1, _02258E50 ; =ov12_0226D120
	ldrb r2, [r4, r0]
	sub r0, r0, #1
	ldrb r1, [r1, r2]
	str r1, [sp]
	mov r1, #5
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	ldrb r0, [r4, r0]
	str r0, [sp, #0xc]
	add r0, r5, #0
	str r6, [sp, #0x10]
	bl ov12_0223A8E4
	str r0, [sp, #0x1c]
	add r0, r5, #0
	bl ov12_0223A938
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x18]
	mov r0, #1
	str r0, [sp, #0x14]
	add r0, sp, #0
	bl ov07_02233DB8
	add r1, r4, #0
	add r1, #0x88
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0x64
	bl ov07_022344C4
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #2
	bl ov07_022344D0
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl ov07_0223449C
	add r4, #0x88
	ldr r0, [r4]
	mov r1, #0
	bl ov07_022344C0
_02258E48:
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02258E4C: .word 0x00000195
_02258E50: .word ov12_0226D120
	thumb_func_end ov12_02258DB0

	thumb_func_start ov12_02258E54
ov12_02258E54: ; 0x02258E54
	push {r3, lr}
	add r2, r1, #0
	add r2, #0x94
	ldrb r2, [r2]
	cmp r2, #0
	beq _02258E76
	mov r2, #0x6a
	mov r3, #0
	lsl r2, r2, #2
	strb r3, [r1, r2]
	add r2, r1, #0
	add r2, #0x94
	ldrb r2, [r2]
	lsl r3, r2, #2
	ldr r2, _02258E78 ; =ov12_0226D010
	ldr r2, [r2, r3]
	blx r2
_02258E76:
	pop {r3, pc}
	.balign 4, 0
_02258E78: .word ov12_0226D010
	thumb_func_end ov12_02258E54

	thumb_func_start ov12_02258E7C
ov12_02258E7C: ; 0x02258E7C
	push {r4, lr}
	add r4, r1, #0
	cmp r2, #2
	beq _02258E8C
	add r0, r4, #0
	add r0, #0x28
	bl ov12_02264C68
_02258E8C:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _02258E96
	bl sub_0200D9DC
_02258E96:
	add r0, r4, #0
	bl ov12_02262014
	mov r0, #0x69
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl NARC_dtor
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_02258E7C

	thumb_func_start ov12_02258EB0
ov12_02258EB0: ; 0x02258EB0
	bx lr
	.balign 4, 0
	thumb_func_end ov12_02258EB0

	thumb_func_start ov12_02258EB4
ov12_02258EB4: ; 0x02258EB4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r1, #0x98
	ldr r1, [r1]
	add r5, r0, #0
	bl ov12_0223BDD0
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02259944
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #1
	bl ov12_0226430C
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02258EB4

	thumb_func_start ov12_02258EE0
ov12_02258EE0: ; 0x02258EE0
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_02259968
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258EE0

	thumb_func_start ov12_02258EF4
ov12_02258EF4: ; 0x02258EF4
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_02259BA8
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258EF4

	thumb_func_start ov12_02258F08
ov12_02258F08: ; 0x02258F08
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_02259D48
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258F08

	thumb_func_start ov12_02258F1C
ov12_02258F1C: ; 0x02258F1C
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_02259F30
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258F1C

	thumb_func_start ov12_02258F30
ov12_02258F30: ; 0x02258F30
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A018
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258F30

	thumb_func_start ov12_02258F44
ov12_02258F44: ; 0x02258F44
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x20]
	bl sub_02008780
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #7
	bl ov12_0226430C
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_02258F44

	thumb_func_start ov12_02258F68
ov12_02258F68: ; 0x02258F68
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A07C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258F68

	thumb_func_start ov12_02258F7C
ov12_02258F7C: ; 0x02258F7C
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A2A0
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258F7C

	thumb_func_start ov12_02258F90
ov12_02258F90: ; 0x02258F90
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225A334
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258F90

	thumb_func_start ov12_02258FA0
ov12_02258FA0: ; 0x02258FA0
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A37C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258FA0

	thumb_func_start ov12_02258FB4
ov12_02258FB4: ; 0x02258FB4
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A414
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258FB4

	thumb_func_start ov12_02258FC8
ov12_02258FC8: ; 0x02258FC8
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225A4DC
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258FC8

	thumb_func_start ov12_02258FD8
ov12_02258FD8: ; 0x02258FD8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r4, #0
	add r6, #0x94
	add r1, r6, #0
	add r1, #0x29
	ldrb r1, [r1]
	add r5, r0, #0
	bl ov12_0223BB6C
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov12_0225A524
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_02258FD8

	thumb_func_start ov12_02259000
ov12_02259000: ; 0x02259000
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A604
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259000

	thumb_func_start ov12_02259014
ov12_02259014: ; 0x02259014
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A674
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259014

	thumb_func_start ov12_02259028
ov12_02259028: ; 0x02259028
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A700
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259028

	thumb_func_start ov12_0225903C
ov12_0225903C: ; 0x0225903C
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A7AC
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_0225903C

	thumb_func_start ov12_02259050
ov12_02259050: ; 0x02259050
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A818
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259050

	thumb_func_start ov12_02259064
ov12_02259064: ; 0x02259064
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A85C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259064

	thumb_func_start ov12_02259078
ov12_02259078: ; 0x02259078
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A8C4
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259078

	thumb_func_start ov12_0225908C
ov12_0225908C: ; 0x0225908C
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A914
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_0225908C

	thumb_func_start ov12_022590A0
ov12_022590A0: ; 0x022590A0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x20]
	mov r1, #6
	bl sub_02008A78
	cmp r0, #1
	bne _022590C2
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x17
	bl ov12_0226430C
	b _022590CA
_022590C2:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0225A9B0
_022590CA:
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_022590A0

	thumb_func_start ov12_022590D4
ov12_022590D4: ; 0x022590D4
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A9E0
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022590D4

	thumb_func_start ov12_022590E8
ov12_022590E8: ; 0x022590E8
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AA6C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022590E8

	thumb_func_start ov12_022590FC
ov12_022590FC: ; 0x022590FC
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AAE0
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022590FC

	thumb_func_start ov12_02259110
ov12_02259110: ; 0x02259110
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225ABB8
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259110

	thumb_func_start ov12_02259124
ov12_02259124: ; 0x02259124
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225ABE8
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259124

	thumb_func_start ov12_02259134
ov12_02259134: ; 0x02259134
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AC1C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259134

	thumb_func_start ov12_02259148
ov12_02259148: ; 0x02259148
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225ACB0
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259148

	thumb_func_start ov12_0225915C
ov12_0225915C: ; 0x0225915C
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225ACE8
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_0225915C

	thumb_func_start ov12_02259170
ov12_02259170: ; 0x02259170
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AD44
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259170

	thumb_func_start ov12_02259184
ov12_02259184: ; 0x02259184
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AD9C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259184

	thumb_func_start ov12_02259198
ov12_02259198: ; 0x02259198
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225ADF4
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259198

	thumb_func_start ov12_022591A8
ov12_022591A8: ; 0x022591A8
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AE48
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022591A8

	thumb_func_start ov12_022591BC
ov12_022591BC: ; 0x022591BC
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225AEA0
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022591BC

	thumb_func_start ov12_022591CC
ov12_022591CC: ; 0x022591CC
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AED8
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022591CC

	thumb_func_start ov12_022591E0
ov12_022591E0: ; 0x022591E0
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AF74
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022591E0

	thumb_func_start ov12_022591F4
ov12_022591F4: ; 0x022591F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r1, #0
	mov r2, #0x65
	add r6, #0x94
	lsl r2, r2, #2
	str r1, [sp, #4]
	ldrb r1, [r1, r2]
	ldrb r2, [r6, #1]
	str r0, [sp]
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x1c
	bl ov12_0223A880
	add r7, r0, #0
	mov r0, #2
	ldr r1, [r6, #0x1c]
	lsl r0, r0, #0x14
	tst r0, r1
	bne _0225925C
	add r0, r6, #0
	add r5, r6, #0
	str r0, [sp, #8]
	add r0, #0x16
	mov r4, #0
	add r5, #0xe
	str r0, [sp, #8]
_0225922A:
	add r0, r4, #0
	bl MaskOfFlagNo
	ldrb r1, [r6, #1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	tst r0, r1
	bne _02259254
	add r1, r4, #0
	add r0, r7, #0
	add r1, #0x36
	add r2, r5, #0
	bl SetMonData
	ldr r2, [sp, #8]
	add r1, r4, #0
	add r0, r7, #0
	add r1, #0x3a
	add r2, r2, r4
	bl SetMonData
_02259254:
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #4
	blt _0225922A
_0225925C:
	ldrb r0, [r6, #1]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	bl MaskOfFlagNo
	ldr r1, [r6, #8]
	tst r0, r1
	bne _02259278
	add r2, r6, #0
	add r0, r7, #0
	mov r1, #6
	add r2, #0xc
	bl SetMonData
_02259278:
	add r0, r7, #0
	mov r1, #0xa3
	add r2, r6, #2
	bl SetMonData
	add r0, r7, #0
	mov r1, #0xa0
	add r2, r6, #4
	bl SetMonData
	ldrh r0, [r6, #0x2a]
	cmp r0, #0
	beq _0225929E
	add r2, r6, #0
	add r0, r7, #0
	mov r1, #0x70
	add r2, #0x20
	bl SetMonData
_0225929E:
	ldrh r0, [r6, #0x28]
	cmp r0, #0
	beq _022592B6
	add r2, r6, #0
	add r0, r7, #0
	mov r1, #0xa
	add r2, #0x24
	bl SetMonData
	add r0, r7, #0
	bl CalcMonLevelAndStats
_022592B6:
	mov r2, #0x65
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	ldrb r1, [r1, r2]
	ldrb r2, [r6]
	ldr r0, [sp]
	bl ov12_0226430C
	ldr r0, [sp, #4]
	bl ov12_02259928
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov12_022591F4

	thumb_func_start ov12_022592D0
ov12_022592D0: ; 0x022592D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov12_0223A7E0
	add r6, r0, #0
	add r0, r5, #0
	bl ov12_0223A900
	ldr r2, _02259320 ; =0x00000196
	ldrb r1, [r4, r2]
	cmp r1, #0
	bne _02259304
	mov r1, #8
	and r1, r6
	bne _022592FC
	cmp r1, #0
	bne _02259304
	sub r1, r2, #1
	ldrb r1, [r4, r1]
	cmp r1, #4
	beq _02259304
_022592FC:
	ldr r1, _02259324 ; =0xFFFFF300
	mov r2, #0
	bl ov12_02266D98
_02259304:
	mov r1, #0x65
	add r2, r4, #0
	lsl r1, r1, #2
	add r2, #0x94
	ldrb r1, [r4, r1]
	ldrb r2, [r2]
	add r0, r5, #0
	bl ov12_0226430C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, r5, r6, pc}
	nop
_02259320: .word 0x00000196
_02259324: .word 0xFFFFF300
	thumb_func_end ov12_022592D0

	thumb_func_start ov12_02259328
ov12_02259328: ; 0x02259328
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x28
	bl ov12_02264EB4
	add r0, r4, #0
	bl ov12_02262014
	mov r1, #0x65
	add r2, r4, #0
	lsl r1, r1, #2
	add r2, #0x94
	ldrb r1, [r4, r1]
	ldrb r2, [r2]
	add r0, r5, #0
	bl ov12_0226430C
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_02259328

	thumb_func_start ov12_02259358
ov12_02259358: ; 0x02259358
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r1, #0
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #0x65
	lsl r1, r1, #2
	add r4, r7, #0
	ldrb r1, [r7, r1]
	str r0, [sp]
	add r4, #0x94
	bl ov12_0223A834
	mov r5, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _022593BA
_0225937A:
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r7, r1]
	ldr r0, [sp]
	add r2, r5, #0
	bl ov12_0223A880
	ldrb r1, [r4, #1]
	add r6, r0, #0
	cmp r1, #0x68
	bne _02259394
	mov r0, #0
	b _0225939C
_02259394:
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
_0225939C:
	ldrh r1, [r4, #2]
	cmp r1, #0xd7
	bne _022593A8
	bne _022593B2
	cmp r0, #0x2b
	beq _022593B2
_022593A8:
	add r0, r6, #0
	mov r1, #0xa0
	add r2, sp, #8
	bl SetMonData
_022593B2:
	ldr r0, [sp, #4]
	add r5, r5, #1
	cmp r5, r0
	blt _0225937A
_022593BA:
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r7, r1]
	ldrb r2, [r4]
	ldr r0, [sp]
	bl ov12_0226430C
	add r0, r7, #0
	bl ov12_02259928
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_02259358

	thumb_func_start ov12_022593D4
ov12_022593D4: ; 0x022593D4
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B028
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022593D4

	thumb_func_start ov12_022593E8
ov12_022593E8: ; 0x022593E8
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B060
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022593E8

	thumb_func_start ov12_022593FC
ov12_022593FC: ; 0x022593FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp, #0x10]
	add r5, r1, #0
	ldr r0, _022594F0 ; =0x00000195
	add r4, r5, #0
	ldrb r1, [r5, r0]
	mov r0, #1
	add r4, #0x94
	tst r0, r1
	beq _02259416
	mov r6, #2
	b _02259418
_02259416:
	mov r6, #0
_02259418:
	ldrb r0, [r4, #5]
	lsl r3, r6, #0x18
	lsr r3, r3, #0x18
	str r0, [sp]
	ldrb r0, [r4, #1]
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	str r0, [sp, #8]
	ldrh r1, [r4, #2]
	ldrb r2, [r4, #4]
	add r0, sp, #0x14
	bl GetMonSpriteCharAndPlttNarcIdsEx
	ldr r0, [r5, #0x20]
	bl sub_02009414
	add r7, r0, #0
	add r2, sp, #0x14
	add r3, r7, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5, #0x20]
	bl sub_02009324
	ldr r0, [sp, #0x10]
	bl ov12_0223A99C
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	bl ov12_0223BB94
	add r3, r0, #0
	ldr r0, [r4, #8]
	mov r2, #5
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldrh r0, [r7, #6]
	str r0, [sp, #0xc]
	ldrh r0, [r7]
	ldrh r1, [r7, #2]
	bl sub_02014540
	ldr r0, [sp, #0x10]
	bl ov12_0223A99C
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	ldrh r2, [r7]
	bl ov12_0223BBA8
	ldr r0, [sp, #0x10]
	bl ov12_0223A99C
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	ldrh r2, [r7, #4]
	bl ov12_0223BBC0
	ldr r0, [r4, #8]
	lsl r2, r6, #0x18
	str r0, [sp]
	ldrh r0, [r4, #2]
	ldrb r1, [r4, #4]
	ldrb r3, [r4, #1]
	lsr r2, r2, #0x18
	bl sub_020708D8
	add r6, r0, #0
	ldr r0, [sp, #0x10]
	bl ov12_0223A99C
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	add r2, r6, #0
	bl ov12_0223BBD8
	ldr r0, _022594F0 ; =0x00000195
	mov r1, #1
	ldrb r0, [r5, r0]
	bl ov07_02234B5C
	add r2, r0, #0
	ldr r0, [r5, #0x20]
	mov r1, #1
	add r2, r6, r2
	bl sub_020087A4
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r4]
	ldr r0, [sp, #0x10]
	bl ov12_0226430C
	add r0, r5, #0
	bl ov12_02259928
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_022594F0: .word 0x00000195
	thumb_func_end ov12_022593FC

	thumb_func_start ov12_022594F4
ov12_022594F4: ; 0x022594F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov12_0223B874
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x2e
	bl ov12_0226430C
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_022594F4

	thumb_func_start ov12_02259514
ov12_02259514: ; 0x02259514
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _022595B4 ; =0x00000196
	add r4, r1, #0
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0225959A
	mov r0, #7
	mov r1, #5
	bl NARC_ctor
	add r6, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_ctor
	add r7, r0, #0
	add r0, r5, #0
	bl ov12_0223A900
	str r0, [sp, #8]
	mov r3, #0
	str r3, [sp]
	ldr r2, [sp, #8]
	add r0, r6, #0
	add r1, r7, #0
	str r3, [sp, #4]
	bl ov12_02266508
	ldr r0, [sp, #8]
	mov r1, #0
	bl ov12_022698AC
	add r0, r6, #0
	bl NARC_dtor
	add r0, r7, #0
	bl NARC_dtor
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	bl ov12_0223AB6C
	add r1, r0, #0
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r1, r0
	beq _02259586
	add r0, r5, #0
	bl ov12_0223BC38
	bl ov12_02265D74
_02259586:
	add r0, r4, #0
	add r0, #0x28
	bl ov12_02264EB4
	ldr r0, [sp, #8]
	bl ov12_02266B34
	add r0, r4, #0
	bl ov12_02262014
_0225959A:
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x2f
	bl ov12_0226430C
	add r0, r4, #0
	bl ov12_02259928
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022595B4: .word 0x00000196
	thumb_func_end ov12_02259514

	thumb_func_start ov12_022595B8
ov12_022595B8: ; 0x022595B8
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B0A0
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022595B8

	thumb_func_start ov12_022595CC
ov12_022595CC: ; 0x022595CC
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B0E8
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022595CC

	thumb_func_start ov12_022595E0
ov12_022595E0: ; 0x022595E0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r6, r4, #0
	add r5, r0, #0
	add r6, #0x94
	bl ov12_0223AB1C
	cmp r0, #0
	beq _02259604
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov12_0225B120
	b _02259612
_02259604:
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x32
	bl ov12_0226430C
_02259612:
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_022595E0

	thumb_func_start ov12_0225961C
ov12_0225961C: ; 0x0225961C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r6, r4, #0
	add r5, r0, #0
	add r6, #0x94
	bl ov12_0223AB1C
	cmp r0, #0
	beq _02259640
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov12_0225B16C
	b _0225964E
_02259640:
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x33
	bl ov12_0226430C
_0225964E:
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0225961C

	thumb_func_start ov12_02259658
ov12_02259658: ; 0x02259658
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov12_0223A8E4
	add r6, r0, #0
	add r0, r5, #0
	bl ov12_0223A8EC
	add r7, r0, #0
	add r0, r5, #0
	bl ov12_0223A938
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl ov12_0226ADE0
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x34
	bl ov12_0226430C
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_02259658

	thumb_func_start ov12_02259694
ov12_02259694: ; 0x02259694
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov12_0223A8EC
	bl ov12_0226AE78
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x35
	bl ov12_0226430C
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02259694

	thumb_func_start ov12_022596B8
ov12_022596B8: ; 0x022596B8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r5, #0
	add r4, #0x94
	ldrb r1, [r4, #1]
	add r6, r0, #0
	cmp r1, #0
	ldr r1, _022596FC ; =0x00000196
	bne _022596D8
	ldrb r1, [r5, r1]
	cmp r1, #0
	bne _022596E4
	ldrh r1, [r4, #2]
	bl ov12_0223BB28
	b _022596E4
_022596D8:
	ldrb r1, [r5, r1]
	cmp r1, #0
	beq _022596E4
	ldrh r1, [r4, #2]
	bl ov12_0223BB28
_022596E4:
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r4]
	add r0, r6, #0
	bl ov12_0226430C
	add r0, r5, #0
	bl ov12_02259928
	pop {r4, r5, r6, pc}
	nop
_022596FC: .word 0x00000196
	thumb_func_end ov12_022596B8

	thumb_func_start ov12_02259700
ov12_02259700: ; 0x02259700
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	ldrh r1, [r2, #2]
	add r5, r0, #0
	add r2, r2, #4
	bl ov12_0223BF14
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0225B1A8
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_02259700

	thumb_func_start ov12_02259724
ov12_02259724: ; 0x02259724
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B200
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259724

	thumb_func_start ov12_02259738
ov12_02259738: ; 0x02259738
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225B234
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259738

	thumb_func_start ov12_02259748
ov12_02259748: ; 0x02259748
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225B26C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259748

	thumb_func_start ov12_02259758
ov12_02259758: ; 0x02259758
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225B2A4
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259758

	thumb_func_start ov12_02259768
ov12_02259768: ; 0x02259768
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r4, r6, #0
	add r4, #0x94
	ldrh r1, [r4, #2]
	add r5, r0, #0
	add r2, r4, #4
	bl ov12_0223BF14
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov12_0225B2F8
	add r0, r6, #0
	bl ov12_02259928
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_02259768

	thumb_func_start ov12_0225978C
ov12_0225978C: ; 0x0225978C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	ldrh r1, [r2, #2]
	add r5, r0, #0
	add r2, r2, #4
	bl ov12_0223BF14
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0225B34C
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0225978C

	thumb_func_start ov12_022597B0
ov12_022597B0: ; 0x022597B0
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B3A0
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022597B0

	thumb_func_start ov12_022597C4
ov12_022597C4: ; 0x022597C4
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B3D4
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022597C4

	thumb_func_start ov12_022597D8
ov12_022597D8: ; 0x022597D8
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B434
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022597D8

	thumb_func_start ov12_022597EC
ov12_022597EC: ; 0x022597EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp, #4]
	str r1, [sp, #0x10]
	add r1, #0x94
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x10]
	mov r7, #0
	ldrh r1, [r1, #2]
	str r0, [sp]
	add r2, #8
	str r7, [sp, #8]
	bl ov12_0223BF14
	ldr r0, [sp]
	bl ov12_0223A7E0
	mov r1, #0x80
	tst r0, r1
	beq _02259824
	ldr r1, [sp, #0x10]
	ldr r0, [sp]
	ldr r1, [r1, #4]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov12_0223BD20
	b _022598DC
_02259824:
	add r0, r7, #0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	bl ov12_0223A7F0
	cmp r0, #0
	ble _022598B2
_02259832:
	ldr r0, [sp]
	ldr r1, [sp, #0xc]
	bl ov12_0223A7F4
	add r6, r0, #0
	mov r5, #0
	bl GetPartyCount
	cmp r0, #0
	ble _022598A0
_02259846:
	add r0, r6, #0
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02259894
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02259894
	ldr r0, [sp]
	ldr r1, [sp, #0xc]
	bl ov12_0223AB1C
	cmp r0, #0
	beq _02259888
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #8]
	add r0, r1, r0
	str r0, [sp, #8]
	b _02259894
_02259888:
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r7, r7, r0
_02259894:
	add r0, r6, #0
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blt _02259846
_022598A0:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp]
	bl ov12_0223A7F0
	ldr r1, [sp, #0xc]
	cmp r1, r0
	blt _02259832
_022598B2:
	cmp r7, #0
	bne _022598C6
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _022598C6
	ldr r0, [sp]
	mov r1, #3
	bl ov12_0223BD20
	b _022598DC
_022598C6:
	cmp r7, #0
	bne _022598D4
	ldr r0, [sp]
	mov r1, #2
	bl ov12_0223BD20
	b _022598DC
_022598D4:
	ldr r0, [sp]
	mov r1, #1
	bl ov12_0223BD20
_022598DC:
	mov r2, #0x65
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	ldrb r1, [r1, r2]
	ldr r2, [sp, #0x10]
	ldr r0, [sp]
	ldrb r2, [r2]
	bl ov12_0226430C
	ldr r0, [sp, #4]
	bl ov12_02259928
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov12_022597EC

	thumb_func_start ov12_022598F8
ov12_022598F8: ; 0x022598F8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	mov r1, #0
	add r5, r0, #0
	bl ov12_0223A7D8
	add r6, r0, #0
	mov r1, #0xff
	bl FillWindowPixelBuffer
	add r0, r6, #0
	bl CopyWindowPixelsToVram_TextMode
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x42
	bl ov12_0226430C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_022598F8

	thumb_func_start ov12_02259928
ov12_02259928: ; 0x02259928
	mov r1, #0
	add r0, #0x94
	strb r1, [r0]
	bx lr
	thumb_func_end ov12_02259928

	thumb_func_start ov12_02259930
ov12_02259930: ; 0x02259930
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B454
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259930

	thumb_func_start ov12_02259944
ov12_02259944: ; 0x02259944
	push {r4, lr}
	add r4, r0, #0
	mov r0, #5
	mov r1, #0x18
	bl AllocFromHeap
	add r1, r0, #0
	str r4, [r1]
	mov r2, #0
	strb r2, [r1, #0x14]
	strb r2, [r1, #0x15]
	ldr r0, _02259964 ; =ov12_02260668
	strb r2, [r1, #0x16]
	bl CreateSysTask
	pop {r4, pc}
	.balign 4, 0
_02259964: .word ov12_02260668
	thumb_func_end ov12_02259944

	thumb_func_start ov12_02259968
ov12_02259968: ; 0x02259968
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	str r0, [sp, #0x24]
	add r6, r1, #0
	add r5, r2, #0
	bl ov12_0223A8D4
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	bl ov12_0223A7E0
	mov r0, #5
	mov r1, #0x30
	bl AllocFromHeap
	add r4, r0, #0
	mov r2, #0
	ldr r0, _02259B8C ; =0x00000195
	strb r2, [r4, #0x12]
	ldrb r0, [r6, r0]
	mov r1, #1
	tst r0, r1
	beq _022599BE
	mov r0, #2
	strb r0, [r4, #0x13]
	ldr r0, [sp, #0x24]
	bl ov12_0223A8F4
	str r0, [r4, #0xc]
	ldr r1, _02259B8C ; =0x00000195
	ldr r0, [r0]
	ldrb r2, [r6, r1]
	mov r1, #1
	and r2, r1
	add r3, r2, #0
	mov r1, #6
	mul r3, r1
	ldr r1, _02259B90 ; =ov07_022377F4
	mov r2, #0x58
	ldrsh r1, [r1, r3]
	bl sub_0200DDB8
	b _022599E4
_022599BE:
	ldr r0, [sp, #0x24]
	add r1, r2, #0
	strb r2, [r4, #0x13]
	bl ov12_0223A8F4
	str r0, [r4, #0xc]
	ldr r1, _02259B8C ; =0x00000195
	ldr r0, [r0]
	ldrb r2, [r6, r1]
	mov r1, #1
	and r2, r1
	add r3, r2, #0
	mov r1, #6
	mul r3, r1
	ldr r1, _02259B90 ; =ov07_022377F4
	mov r2, #0x88
	ldrsh r1, [r1, r3]
	bl sub_0200DDB8
_022599E4:
	ldrb r0, [r5, #1]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	beq _022599F0
	mov r0, #1
	b _022599F2
_022599F0:
	mov r0, #0
_022599F2:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldrb r0, [r5, #1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	str r0, [sp, #8]
	ldrb r2, [r5, #1]
	ldrh r1, [r5, #2]
	ldrb r3, [r4, #0x13]
	lsl r2, r2, #0x1e
	add r0, sp, #0x5c
	lsr r2, r2, #0x1e
	bl GetMonSpriteCharAndPlttNarcIdsEx
	ldr r0, [r5, #4]
	str r0, [sp]
	ldrb r3, [r5, #1]
	ldrh r0, [r5, #2]
	ldrb r2, [r4, #0x13]
	lsl r1, r3, #0x1e
	lsl r3, r3, #0x18
	lsr r1, r1, #0x1e
	lsr r3, r3, #0x1b
	bl sub_020708D8
	str r0, [sp, #0x2c]
	mov r0, #0x69
	lsl r0, r0, #2
	add r1, sp, #0x30
	ldrh r2, [r5, #2]
	ldr r0, [r6, r0]
	add r1, #2
	bl sub_020729D8
	mov r0, #0x69
	lsl r0, r0, #2
	add r1, sp, #0x30
	ldrh r2, [r5, #2]
	ldr r0, [r6, r0]
	add r1, #1
	bl sub_020729FC
	mov r0, #0x69
	lsl r0, r0, #2
	ldrh r2, [r5, #2]
	ldr r0, [r6, r0]
	add r1, sp, #0x30
	bl sub_02072A20
	mov r3, #0x69
	lsl r3, r3, #2
	ldr r0, [r6, r3]
	sub r3, #0xf
	add r1, sp, #0x30
	ldrh r2, [r5, #2]
	ldrb r3, [r6, r3]
	add r1, #3
	bl sub_02072914
	ldr r1, _02259B8C ; =0x00000195
	mov r0, #6
	ldrb r2, [r6, r1]
	ldr r3, _02259B90 ; =ov07_022377F4
	add r7, r2, #0
	mul r7, r0
	ldr r0, _02259B94 ; =ov07_022377F4 + 2
	mov r2, #2
	ldrsh r0, [r0, r7]
	ldrsh r3, [r3, r7]
	str r0, [sp]
	ldr r0, _02259B98 ; =ov07_022377F4 + 4
	ldrsh r0, [r0, r7]
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #8]
	add r0, sp, #0x30
	ldrsb r2, [r0, r2]
	str r2, [sp, #0xc]
	mov r2, #1
	ldrsb r2, [r0, r2]
	str r2, [sp, #0x10]
	ldrb r0, [r0]
	add r2, sp, #0x5c
	str r0, [sp, #0x14]
	sub r0, r1, #1
	ldrb r0, [r6, r0]
	ldr r1, [sp, #0x28]
	str r0, [sp, #0x18]
	add r0, sp, #0x30
	add r0, #3
	str r0, [sp, #0x1c]
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x24]
	bl ov12_022612A4
	str r0, [r6, #0x20]
	ldr r0, [r6, #0x20]
	str r0, [r4, #8]
	ldrb r0, [r4, #0x13]
	cmp r0, #2
	bne _02259AD2
	mov r3, #0
	str r3, [sp]
	mov r1, #8
	ldr r0, [r4, #8]
	add r2, r1, #0
	bl sub_020090B4
_02259AD2:
	ldrb r0, [r4, #0x13]
	cmp r0, #2
	bne _02259B12
	ldr r0, [sp, #0x24]
	bl ov12_0223B514
	mov r1, #0x40
	tst r0, r1
	beq _02259B12
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02008A78
	add r7, r0, #0
	ldr r0, [r4, #8]
	mov r1, #0x2e
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #8]
	mov r1, #0
	mov r2, #0xc0
	bl sub_020087A4
	add r2, r7, #0
	ldr r0, [r4, #8]
	mov r1, #1
	sub r2, #0x88
	bl sub_020087A4
	strh r7, [r4, #0x14]
	b _02259B1E
_02259B12:
	ldr r0, _02259B8C ; =0x00000195
	ldrb r0, [r6, r0]
	lsl r1, r0, #2
	ldr r0, _02259B9C ; =ov07_022377DC
	ldrsh r0, [r0, r1]
	strh r0, [r4, #0x14]
_02259B1E:
	ldr r0, [sp, #0x24]
	str r0, [r4]
	str r6, [r4, #4]
	ldrb r0, [r5]
	strb r0, [r4, #0x10]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r6, r0]
	add r0, r0, #1
	strb r1, [r4, #0x11]
	ldrh r1, [r5, #2]
	strh r1, [r4, #0x16]
	ldrb r1, [r5, #1]
	lsl r1, r1, #0x18
	lsr r2, r1, #0x1b
	add r1, r4, #0
	add r1, #0x2c
	strb r2, [r1]
	ldr r1, [r5, #8]
	str r1, [r4, #0x18]
	ldrb r0, [r6, r0]
	str r0, [r4, #0x1c]
	ldr r0, [r5, #4]
	bl GetNatureFromPersonality
	str r0, [r4, #0x24]
	ldrb r0, [r5, #1]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	str r0, [r4, #0x28]
	ldrb r0, [r4, #0x13]
	cmp r0, #2
	bne _02259B78
	ldr r0, [sp, #0x24]
	bl ov12_0223B514
	mov r1, #0x40
	tst r0, r1
	beq _02259B78
	ldr r0, _02259BA0 ; =ov12_0225B7B8
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	b _02259B82
_02259B78:
	ldr r0, _02259BA4 ; =ov12_0225B494
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
_02259B82:
	mov r0, #1
	bl sub_02005B58
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02259B8C: .word 0x00000195
_02259B90: .word ov07_022377F4
_02259B94: .word ov07_022377F4 + 2
_02259B98: .word ov07_022377F4 + 4
_02259B9C: .word ov07_022377DC
_02259BA0: .word ov12_0225B7B8
_02259BA4: .word ov12_0225B494
	thumb_func_end ov12_02259968

	thumb_func_start ov12_02259BA8
ov12_02259BA8: ; 0x02259BA8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	add r6, r1, #0
	add r5, r2, #0
	bl ov12_0223A7E0
	mov r0, #5
	mov r1, #0x9c
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, _02259D3C ; =0x00000195
	ldrb r1, [r6, r0]
	mov r0, #1
	tst r0, r1
	beq _02259BCE
	mov r1, #2
	b _02259BD0
_02259BCE:
	mov r1, #0
_02259BD0:
	add r0, r4, #0
	add r0, #0x84
	strb r1, [r0]
	ldrb r0, [r5, #1]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	beq _02259BE2
	mov r0, #1
	b _02259BE4
_02259BE2:
	mov r0, #0
_02259BE4:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldrb r0, [r5, #1]
	add r3, r4, #0
	add r3, #0x84
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	str r0, [sp, #8]
	ldrb r2, [r5, #1]
	add r0, r4, #0
	ldrh r1, [r5, #2]
	lsl r2, r2, #0x1e
	ldrb r3, [r3]
	add r0, #0x14
	lsr r2, r2, #0x1e
	bl GetMonSpriteCharAndPlttNarcIdsEx
	ldr r0, [r5, #4]
	add r2, r4, #0
	str r0, [sp]
	ldrb r3, [r5, #1]
	add r2, #0x84
	ldrh r0, [r5, #2]
	lsl r1, r3, #0x1e
	lsl r3, r3, #0x18
	ldrb r2, [r2]
	lsr r1, r1, #0x1e
	lsr r3, r3, #0x1b
	bl sub_020708D8
	add r1, r4, #0
	add r1, #0x85
	strb r0, [r1]
	mov r0, #0x69
	lsl r0, r0, #2
	add r1, r4, #0
	ldrh r2, [r5, #2]
	ldr r0, [r6, r0]
	add r1, #0x90
	bl sub_020729D8
	mov r0, #0x69
	lsl r0, r0, #2
	add r1, r4, #0
	ldrh r2, [r5, #2]
	ldr r0, [r6, r0]
	add r1, #0x91
	bl sub_020729FC
	mov r0, #0x69
	lsl r0, r0, #2
	add r1, r4, #0
	ldrh r2, [r5, #2]
	ldr r0, [r6, r0]
	add r1, #0x93
	bl sub_02072A20
	add r0, r6, #0
	bl ov12_02261284
	str r7, [r4]
	add r0, r4, #0
	str r6, [r4, #4]
	mov r1, #0
	add r0, #0x83
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x96
	strb r1, [r0]
	add r0, r4, #0
	ldrb r1, [r5]
	add r0, #0x80
	strb r1, [r0]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r2, [r6, r0]
	add r1, r4, #0
	add r1, #0x81
	strb r2, [r1]
	add r1, r4, #0
	ldrh r2, [r5, #2]
	add r1, #0x86
	add r0, r0, #1
	strh r2, [r1]
	ldrb r1, [r5, #1]
	lsl r1, r1, #0x18
	lsr r2, r1, #0x1b
	add r1, r4, #0
	add r1, #0x97
	strb r2, [r1]
	ldrb r1, [r6, r0]
	add r0, r4, #0
	add r0, #0x82
	strb r1, [r0]
	add r0, r4, #0
	ldr r1, [r5, #8]
	add r0, #0x88
	str r1, [r0]
	add r0, r4, #0
	ldr r1, [r5, #0xc]
	add r0, #0x8c
	strb r1, [r0]
	ldr r0, [r5, #4]
	bl GetNatureFromPersonality
	add r1, r4, #0
	add r1, #0x8d
	strb r0, [r1]
	add r0, r4, #0
	ldr r1, [r5, #0x10]
	add r0, #0x8e
	strh r1, [r0]
	ldrb r0, [r5, #1]
	lsl r0, r0, #0x1d
	lsr r1, r0, #0x1f
	add r0, r4, #0
	add r0, #0x92
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x94
	strh r1, [r0]
	mov r0, #1
	bl sub_02005B58
	add r0, r7, #0
	bl ov12_0223A7E0
	mov r1, #0x65
	lsl r1, r1, #2
	add r5, r0, #0
	ldrb r1, [r6, r1]
	add r0, r7, #0
	bl ov12_0223C140
	cmp r0, #0xff
	beq _02259D2C
	mov r0, #2
	tst r0, r5
	beq _02259D1E
	mov r0, #8
	tst r0, r5
	bne _02259D1E
	ldr r0, _02259D3C ; =0x00000195
	ldrb r0, [r6, r0]
	cmp r0, #3
	bls _02259D1E
	ldr r0, _02259D40 ; =ov12_0225B960
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02259D1E:
	ldr r0, _02259D44 ; =ov12_0225BE38
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02259D2C:
	ldr r0, _02259D40 ; =ov12_0225B960
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02259D3C: .word 0x00000195
_02259D40: .word ov12_0225B960
_02259D44: .word ov12_0225BE38
	thumb_func_end ov12_02259BA8

	thumb_func_start ov12_02259D48
ov12_02259D48: ; 0x02259D48
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	add r4, r2, #0
	bl ov12_0223A7E0
	mov r0, #5
	mov r1, #0x9c
	bl AllocFromHeap
	add r5, r0, #0
	add r1, r5, #0
	mov r0, #0
	add r1, #0x83
	strb r0, [r1]
	ldr r2, _02259F24 ; =0x00000195
	ldr r1, [sp, #0x10]
	ldrb r2, [r1, r2]
	mov r1, #1
	tst r1, r2
	beq _02259D7E
	add r0, r5, #0
	mov r1, #2
	add r0, #0x84
	strb r1, [r0]
	b _02259D84
_02259D7E:
	add r1, r5, #0
	add r1, #0x84
	strb r0, [r1]
_02259D84:
	ldrb r0, [r4, #1]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	beq _02259D90
	mov r0, #1
	b _02259D92
_02259D90:
	mov r0, #0
_02259D92:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldrb r0, [r4, #1]
	add r3, r5, #0
	add r3, #0x84
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	str r0, [sp, #8]
	ldrb r2, [r4, #1]
	add r0, r5, #0
	ldrh r1, [r4, #2]
	lsl r2, r2, #0x1e
	ldrb r3, [r3]
	add r0, #0x14
	lsr r2, r2, #0x1e
	bl GetMonSpriteCharAndPlttNarcIdsEx
	ldr r0, [r4, #4]
	add r2, r5, #0
	str r0, [sp]
	ldrb r3, [r4, #1]
	add r2, #0x84
	ldrh r0, [r4, #2]
	lsl r1, r3, #0x1e
	lsl r3, r3, #0x18
	ldrb r2, [r2]
	lsr r1, r1, #0x1e
	lsr r3, r3, #0x1b
	bl sub_020708D8
	add r1, r5, #0
	add r1, #0x85
	strb r0, [r1]
	mov r1, #0x69
	ldr r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	add r1, r5, #0
	ldrh r2, [r4, #2]
	add r1, #0x90
	bl sub_020729D8
	mov r1, #0x69
	ldr r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	add r1, r5, #0
	ldrh r2, [r4, #2]
	add r1, #0x91
	bl sub_020729FC
	mov r1, #0x69
	ldr r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	add r1, r5, #0
	ldrh r2, [r4, #2]
	add r1, #0x93
	bl sub_02072A20
	ldr r0, [sp, #0x10]
	bl ov12_02261284
	ldr r0, [sp, #0xc]
	str r0, [r5]
	ldr r0, [sp, #0x10]
	str r0, [r5, #4]
	add r0, r5, #0
	ldrb r1, [r4]
	add r0, #0x80
	strb r1, [r0]
	mov r1, #0x65
	ldr r0, [sp, #0x10]
	lsl r1, r1, #2
	ldrb r2, [r0, r1]
	add r0, r5, #0
	add r0, #0x81
	strb r2, [r0]
	add r0, r5, #0
	ldrh r2, [r4, #2]
	add r0, #0x86
	add r1, r1, #1
	strh r2, [r0]
	ldrb r0, [r4, #1]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x1b
	add r0, r5, #0
	add r0, #0x97
	strb r2, [r0]
	ldr r0, [sp, #0x10]
	ldrb r1, [r0, r1]
	add r0, r5, #0
	add r0, #0x82
	strb r1, [r0]
	add r0, r5, #0
	ldr r1, [r4, #8]
	add r0, #0x88
	str r1, [r0]
	add r0, r5, #0
	ldr r1, [r4, #0xc]
	add r0, #0x8c
	strb r1, [r0]
	ldr r0, [r4, #4]
	bl GetNatureFromPersonality
	add r1, r5, #0
	add r1, #0x8d
	strb r0, [r1]
	add r0, r5, #0
	ldr r1, [r4, #0x10]
	add r0, #0x8e
	strh r1, [r0]
	ldrb r0, [r4, #1]
	lsl r0, r0, #0x1d
	lsr r1, r0, #0x1f
	add r0, r5, #0
	add r0, #0x92
	strb r1, [r0]
	add r0, r5, #0
	ldr r1, [r4, #0x14]
	add r0, #0x94
	strh r1, [r0]
	add r1, r5, #0
	mov r0, #0
	add r1, #0x96
	strb r0, [r1]
	add r1, r5, #0
	ldr r2, [r4, #0x4c]
	add r1, #0x98
	str r2, [r1]
	mov ip, r4
	add r7, r5, #0
	add r6, r4, #0
	add r1, r5, #0
_02259EA4:
	mov r2, ip
	add r2, #0x50
	ldrh r3, [r2]
	add r2, r7, #0
	add r2, #0x40
	strh r3, [r2]
	add r2, r4, r0
	add r2, #0x58
	ldrb r3, [r2]
	add r2, r5, r0
	add r2, #0x48
	strb r3, [r2]
	add r2, r4, r0
	add r2, #0x5c
	ldrb r3, [r2]
	add r2, r5, r0
	add r2, #0x4c
	strb r3, [r2]
	add r2, r4, r0
	add r2, #0x60
	ldrb r3, [r2]
	add r2, r5, r0
	add r2, #0x50
	strb r3, [r2]
	ldr r2, [r6, #0x64]
	add r0, r0, #1
	str r2, [r1, #0x54]
	mov r2, ip
	add r2, r2, #2
	mov ip, r2
	add r7, r7, #2
	add r6, r6, #4
	add r1, r1, #4
	cmp r0, #4
	blt _02259EA4
	mov r2, #0x65
	ldr r1, [sp, #0x10]
	lsl r2, r2, #2
	ldrb r1, [r1, r2]
	ldr r0, [sp, #0xc]
	bl ov12_0223C140
	cmp r0, #0xff
	beq _02259F06
	add r1, r5, #0
	add r1, #0x8c
	ldrb r1, [r1]
	cmp r0, r1
	beq _02259F14
_02259F06:
	ldr r0, _02259F28 ; =ov12_0225C18C
	add r1, r5, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02259F14:
	ldr r0, _02259F2C ; =ov12_0225C6C8
	add r1, r5, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02259F24: .word 0x00000195
_02259F28: .word ov12_0225C18C
_02259F2C: .word ov12_0225C6C8
	thumb_func_end ov12_02259D48

	thumb_func_start ov12_02259F30
ov12_02259F30: ; 0x02259F30
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, #5
	mov r1, #0x78
	str r2, [sp, #8]
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [sp]
	add r7, r4, #0
	str r0, [r4]
	ldr r0, [sp, #4]
	str r0, [r4, #4]
	ldr r0, [r0, #0x20]
	str r0, [r4, #8]
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x68
	strb r1, [r0]
	mov r1, #0x65
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	ldrb r2, [r0, r1]
	add r0, r4, #0
	add r0, #0x69
	strb r2, [r0]
	ldr r0, [sp, #4]
	add r1, r1, #1
	ldrb r1, [r0, r1]
	add r0, r4, #0
	add r0, #0x6a
	strb r1, [r0]
	add r1, r4, #0
	mov r0, #0
	add r1, #0x6b
	strb r0, [r1]
	ldr r1, [sp, #8]
	ldrb r2, [r1, #1]
	add r1, r4, #0
	add r1, #0x6c
	strb r2, [r1]
	ldr r1, [sp, #8]
	ldrh r2, [r1, #2]
	add r1, r4, #0
	add r1, #0x6e
	strh r2, [r1]
	ldr r1, [sp, #8]
	add r2, r4, #0
	ldr r1, [r1, #4]
	str r1, [r4, #0x70]
	ldr r1, [sp, #8]
	ldr r1, [r1, #0x2c]
	str r1, [r4, #0x74]
	ldr r1, [sp, #8]
	mov ip, r1
_02259FA4:
	mov r3, ip
	ldrh r3, [r3, #8]
	strh r3, [r7, #0x28]
	ldr r3, [sp, #8]
	add r7, r7, #2
	add r6, r3, r0
	add r3, r4, r0
	ldrb r5, [r6, #0x10]
	add r3, #0x30
	strb r5, [r3]
	add r3, r4, r0
	ldrb r5, [r6, #0x14]
	add r3, #0x34
	strb r5, [r3]
	add r3, r4, r0
	ldrb r5, [r6, #0x18]
	add r3, #0x38
	add r0, r0, #1
	strb r5, [r3]
	ldr r3, [r1, #0x1c]
	add r1, r1, #4
	str r3, [r2, #0x3c]
	mov r3, ip
	add r3, r3, #2
	add r2, r2, #4
	mov ip, r3
	cmp r0, #4
	blt _02259FA4
	mov r2, #0x65
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	ldrb r1, [r1, r2]
	ldr r0, [sp]
	bl ov12_0223C140
	cmp r0, #0xff
	beq _02259FF4
	ldr r1, [r4, #0x74]
	cmp r0, r1
	beq _0225A002
_02259FF4:
	ldr r0, _0225A010 ; =ov12_0225C9BC
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0225A002:
	ldr r0, _0225A014 ; =ov12_0225CC58
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225A010: .word ov12_0225C9BC
_0225A014: .word ov12_0225CC58
	thumb_func_end ov12_02259F30

	thumb_func_start ov12_0225A018
ov12_0225A018: ; 0x0225A018
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	mov r0, #5
	mov r1, #0x10
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	str r7, [r4]
	ldr r0, [r5, #0x20]
	str r0, [r4, #4]
	ldrb r0, [r6]
	strb r0, [r4, #8]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	add r0, r0, #1
	strb r1, [r4, #9]
	ldrb r0, [r5, r0]
	mov r1, #0
	add r3, r1, #0
	strb r0, [r4, #0xa]
	strb r1, [r4, #0xb]
	ldrb r0, [r6, #1]
	strb r0, [r4, #0xc]
	ldrh r0, [r6, #2]
	lsl r2, r0, #1
	ldr r0, _0225A074 ; =ov12_0226D15A
	ldrh r0, [r0, r2]
	mov r2, #0x10
	str r0, [sp]
	ldr r0, [r4, #4]
	bl sub_020090B4
	ldr r0, [r4, #4]
	mov r1, #0x2d
	mov r2, #1
	bl sub_020087A4
	ldr r0, _0225A078 ; =ov12_0225CDB8
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225A074: .word ov12_0226D15A
_0225A078: .word ov12_0225CDB8
	thumb_func_end ov12_0225A018

	thumb_func_start ov12_0225A07C
ov12_0225A07C: ; 0x0225A07C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #5
	mov r1, #0x24
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r2, #0
	ldr r0, _0225A288 ; =0x00000195
	strb r2, [r4, #0x12]
	ldrb r0, [r5, r0]
	mov r1, #1
	tst r0, r1
	beq _0225A0C4
	mov r0, #2
	strb r0, [r4, #0x13]
	add r0, r6, #0
	bl ov12_0223A8F4
	str r0, [r4, #8]
	ldr r1, _0225A288 ; =0x00000195
	ldr r0, [r0]
	ldrb r2, [r5, r1]
	mov r1, #1
	and r1, r2
	mov r2, #6
	mul r2, r1
	ldr r1, _0225A28C ; =ov07_022377F4
	ldrsh r1, [r1, r2]
	mov r2, #0x58
	bl sub_0200DDB8
	b _0225A0E8
_0225A0C4:
	add r0, r6, #0
	add r1, r2, #0
	strb r2, [r4, #0x13]
	bl ov12_0223A8F4
	str r0, [r4, #8]
	ldr r1, _0225A288 ; =0x00000195
	ldr r0, [r0]
	ldrb r2, [r5, r1]
	mov r1, #1
	and r1, r2
	mov r2, #6
	mul r2, r1
	ldr r1, _0225A28C ; =ov07_022377F4
	ldrsh r1, [r1, r2]
	mov r2, #0x88
	bl sub_0200DDB8
_0225A0E8:
	add r0, r6, #0
	bl ov12_0223A7E0
	mov r1, #8
	tst r0, r1
	bne _0225A10A
	add r0, r6, #0
	bl ov12_0223A7E0
	mov r1, #0x10
	tst r0, r1
	beq _0225A112
	ldr r0, _0225A288 ; =0x00000195
	ldrb r1, [r5, r0]
	mov r0, #1
	tst r0, r1
	beq _0225A112
_0225A10A:
	ldr r0, _0225A288 ; =0x00000195
	ldrb r0, [r5, r0]
	str r0, [sp, #0x10]
	b _0225A11C
_0225A112:
	ldr r0, _0225A288 ; =0x00000195
	ldrb r1, [r5, r0]
	mov r0, #1
	and r0, r1
	str r0, [sp, #0x10]
_0225A11C:
	mov r1, #0x65
	ldrh r2, [r7, #2]
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	lsl r2, r2, #0x18
	add r0, r6, #0
	lsr r2, r2, #0x18
	bl ov12_02261EF0
	strh r0, [r7, #2]
	add r0, r6, #0
	bl ov12_0223A7E0
	mov r1, #0x65
	lsl r1, r1, #2
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x1c]
	ldrb r1, [r5, r1]
	add r0, r6, #0
	bl ov12_0223C140
	cmp r0, #0xff
	beq _0225A166
	ldr r0, [sp, #0x20]
	mov r1, #2
	tst r0, r1
	beq _0225A162
	ldr r0, [sp, #0x20]
	mov r1, #8
	tst r0, r1
	bne _0225A162
	mov r0, #0
	str r0, [sp, #0x1c]
	b _0225A166
_0225A162:
	mov r0, #1
	str r0, [sp, #0x1c]
_0225A166:
	ldr r1, [sp, #0x10]
	mov r0, #6
	mul r0, r1
	ldr r1, _0225A28C ; =ov07_022377F4
	ldr r3, _0225A288 ; =0x00000195
	ldrsh r1, [r1, r0]
	str r1, [sp, #0x14]
	ldr r1, _0225A290 ; =ov07_022377F4 + 2
	ldrsh r0, [r1, r0]
	ldr r1, [sp, #0x10]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	str r0, [sp, #8]
	ldrh r2, [r7, #2]
	ldrb r3, [r5, r3]
	add r0, r6, #0
	bl ov12_02261B2C
	str r0, [r5, #0x18]
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	bne _0225A23A
	add r0, r6, #0
	bl ov12_0223A7E0
	cmp r0, #0
	beq _0225A1E8
	add r0, r6, #0
	bl ov12_0223A7E0
	cmp r0, #0x20
	beq _0225A1E8
	add r0, r6, #0
	bl ov12_0223A7E0
	mov r1, #1
	lsl r1, r1, #8
	cmp r0, r1
	beq _0225A1E8
	add r0, r6, #0
	bl ov12_0223A7E0
	mov r1, #2
	lsl r1, r1, #8
	cmp r0, r1
	beq _0225A1E8
	add r0, r6, #0
	bl ov12_0223A7E0
	mov r1, #1
	lsl r1, r1, #0xa
	cmp r0, r1
	beq _0225A1E8
	add r0, r6, #0
	bl ov12_0223A7E0
	mov r1, #1
	lsl r1, r1, #0xc
	cmp r0, r1
	bne _0225A23A
_0225A1E8:
	add r0, r6, #0
	bl ov12_0223A8D4
	str r0, [sp, #0x24]
	ldrh r0, [r7, #2]
	ldrb r1, [r4, #0x13]
	add r2, sp, #0x28
	bl sub_02070D84
	ldr r1, [sp, #0x28]
	add r0, sp, #0x28
	strh r1, [r0, #0x18]
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x10]
	strh r1, [r0, #0x1a]
	ldr r1, [sp, #0x30]
	add r3, sp, #0x40
	strh r1, [r0, #0x1c]
	mov r1, #0
	strh r1, [r0, #0x1e]
	mov r0, #6
	mul r0, r2
	ldr r2, _0225A294 ; =ov07_022377F4 + 4
	strb r1, [r3, #8]
	ldrsh r0, [r2, r0]
	str r1, [sp, #0x4c]
	str r0, [sp]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	add r1, r3, #0
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl sub_020085EC
	str r0, [r4, #4]
	b _0225A23E
_0225A23A:
	mov r0, #0
	str r0, [r4, #4]
_0225A23E:
	ldr r0, [sp, #0x10]
	lsl r1, r0, #2
	ldr r0, _0225A298 ; =ov07_022377DC
	ldrsh r0, [r0, r1]
	strh r0, [r4, #0x14]
	str r6, [r4]
	ldrb r0, [r7]
	strb r0, [r4, #0x10]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	add r0, r0, #1
	strb r1, [r4, #0x11]
	ldrb r0, [r5, r0]
	str r0, [r4, #0x18]
	mov r0, #0
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0225A26A
	cmp r0, #2
	bne _0225A27A
_0225A26A:
	add r0, r6, #0
	bl ov12_0223A7D4
	mov r1, #3
	mov r2, #2
	mov r3, #0x84
	bl BgSetPosTextAndCommit
_0225A27A:
	ldr r0, _0225A29C ; =ov12_0225CE28
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225A288: .word 0x00000195
_0225A28C: .word ov07_022377F4
_0225A290: .word ov07_022377F4 + 2
_0225A294: .word ov07_022377F4 + 4
_0225A298: .word ov07_022377DC
_0225A29C: .word ov12_0225CE28
	thumb_func_end ov12_0225A07C

	thumb_func_start ov12_0225A2A0
ov12_0225A2A0: ; 0x0225A2A0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #5
	mov r1, #0x1c
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4, #0xa]
	str r6, [r4]
	ldrb r1, [r7]
	strb r1, [r4, #8]
	ldrb r1, [r7, #1]
	str r1, [r4, #0x10]
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r2, [r5, r1]
	strb r2, [r4, #9]
	str r5, [r4, #4]
	add r2, r1, #1
	ldrb r3, [r5, r2]
	mov r2, #1
	tst r2, r3
	beq _0225A2DA
	mov r1, #2
	strb r1, [r4, #0xb]
	b _0225A2FC
_0225A2DA:
	ldrb r1, [r5, r1]
	add r0, r6, #0
	bl ov12_0223A9F4
	add r2, r0, #0
	mov r0, #0
	strb r0, [r4, #0xb]
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r2, #1]
	add r0, r6, #0
	bl ov12_02261EF0
	mov r1, #0
	bl TrainerClassToBackpicID
_0225A2FC:
	str r0, [r4, #0xc]
	add r0, r6, #0
	bl ov12_0223A7E0
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	add r0, r6, #0
	bl ov12_0223C140
	cmp r0, #0xff
	beq _0225A320
	ldr r0, _0225A32C ; =ov12_0225D644
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
_0225A320:
	ldr r0, _0225A330 ; =ov12_0225D138
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225A32C: .word ov12_0225D644
_0225A330: .word ov12_0225D138
	thumb_func_end ov12_0225A2A0

	thumb_func_start ov12_0225A334
ov12_0225A334: ; 0x0225A334
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #5
	mov r1, #0x10
	bl AllocFromHeap
	add r1, r0, #0
	mov r0, #0
	strb r0, [r1, #0xa]
	add r2, r4, #0
	str r5, [r1]
	add r2, #0x94
	ldrb r2, [r2]
	strb r2, [r1, #8]
	mov r2, #0x65
	lsl r2, r2, #2
	ldrb r3, [r4, r2]
	add r2, r2, #1
	strb r3, [r1, #9]
	str r4, [r1, #4]
	ldrb r3, [r4, r2]
	mov r2, #1
	tst r2, r3
	beq _0225A36A
	mov r0, #2
	b _0225A36A
_0225A36A:
	strb r0, [r1, #0xb]
	ldr r0, _0225A378 ; =ov12_0225D890
	mov r2, #0
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	nop
_0225A378: .word ov12_0225D890
	thumb_func_end ov12_0225A334

	thumb_func_start ov12_0225A37C
ov12_0225A37C: ; 0x0225A37C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov12_0223A8D4
	mov r0, #5
	mov r1, #0x10
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	ldr r1, _0225A400 ; =0x00000195
	strb r0, [r4, #0xa]
	ldrb r2, [r5, r1]
	mov r1, #1
	tst r1, r2
	beq _0225A3A6
	mov r0, #2
	b _0225A3A6
_0225A3A6:
	strb r0, [r4, #0xb]
	ldr r0, _0225A400 ; =0x00000195
	mov r2, #0
	ldrb r3, [r5, r0]
	mov r0, #1
	add r1, r3, #0
	and r1, r0
	mov r0, #6
	str r2, [sp]
	ldr r2, _0225A404 ; =ov07_022377F4 + 36
	mul r0, r1
	ldrsh r2, [r2, r0]
	str r2, [sp, #4]
	ldr r2, _0225A408 ; =ov07_022377F4 + 38
	ldrsh r0, [r2, r0]
	str r0, [sp, #8]
	ldrh r2, [r6, #2]
	add r0, r7, #0
	bl ov12_02261B2C
	str r0, [r5, #0x18]
	str r0, [r4, #4]
	ldr r3, _0225A400 ; =0x00000195
	ldr r2, [r6, #4]
	ldrb r0, [r5, r3]
	lsl r2, r2, #1
	lsl r0, r0, #0x1f
	lsr r1, r0, #0x1d
	ldr r0, _0225A40C ; =ov07_022377DC
	add r0, r0, r1
	ldrsh r0, [r2, r0]
	add r1, r4, #0
	mov r2, #0
	strh r0, [r4, #0xc]
	str r7, [r4]
	ldrb r0, [r6]
	strb r0, [r4, #8]
	sub r0, r3, #1
	ldrb r0, [r5, r0]
	strb r0, [r4, #9]
	ldr r0, _0225A410 ; =ov12_0225D990
	bl CreateSysTask
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225A400: .word 0x00000195
_0225A404: .word ov07_022377F4 + 36
_0225A408: .word ov07_022377F4 + 38
_0225A40C: .word ov07_022377DC
_0225A410: .word ov12_0225D990
	thumb_func_end ov12_0225A37C

	thumb_func_start ov12_0225A414
ov12_0225A414: ; 0x0225A414
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r4, r6, #0
	add r4, #0x28
	add r7, r0, #0
	add r5, r2, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #1
	bl MIi_CpuClearFast
	mov r0, #0x65
	str r7, [r4, #0xc]
	lsl r0, r0, #2
	ldrb r1, [r6, r0]
	add r0, r4, #0
	add r0, #0x24
	strb r1, [r0]
	add r0, r7, #0
	bl ov12_0223A7E0
	add r1, r0, #0
	ldr r0, _0225A4D4 ; =0x00000195
	ldrb r0, [r6, r0]
	bl ov12_02265B64
	add r1, r4, #0
	add r1, #0x25
	strb r0, [r1]
	add r0, r4, #0
	ldrb r1, [r5]
	add r0, #0x4c
	strb r1, [r0]
	mov r0, #2
	ldrsh r0, [r5, r0]
	str r0, [r4, #0x28]
	ldrh r0, [r5, #4]
	str r0, [r4, #0x2c]
	add r0, r4, #0
	ldrb r1, [r5, #1]
	add r0, #0x48
	strb r1, [r0]
	ldrb r0, [r5, #7]
	lsl r0, r0, #0x19
	lsr r1, r0, #0x1e
	add r0, r4, #0
	add r0, #0x49
	strb r1, [r0]
	mov r1, #0
	str r1, [r4, #0x30]
	ldr r0, [r5, #8]
	str r0, [r4, #0x38]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0x3c]
	add r0, r4, #0
	ldrb r2, [r5, #6]
	add r0, #0x26
	strb r2, [r0]
	ldrb r0, [r5, #7]
	lsl r0, r0, #0x1b
	lsr r2, r0, #0x1b
	add r0, r4, #0
	add r0, #0x4a
	strb r2, [r0]
	ldrb r0, [r5, #7]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x1f
	add r0, r4, #0
	add r0, #0x4b
	strb r2, [r0]
	add r0, r4, #0
	ldrb r2, [r5, #0x14]
	add r0, #0x4d
	strb r2, [r0]
	add r0, r4, #0
	ldr r2, [r5, #0x10]
	add r0, #0x27
	strb r2, [r0]
	add r0, r4, #0
	bl ov12_02264F28
	mov r2, #0
	ldr r1, [r4, #0x28]
	add r0, r4, #0
	mvn r2, r2
	bl ov12_0226498C
	mov r2, #0xfa
	ldr r0, _0225A4D8 ; =ov12_0225DA18
	add r1, r4, #0
	lsl r2, r2, #2
	bl CreateSysTask
	str r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225A4D4: .word 0x00000195
_0225A4D8: .word ov12_0225DA18
	thumb_func_end ov12_0225A414

	thumb_func_start ov12_0225A4DC
ov12_0225A4DC: ; 0x0225A4DC
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r5, #0
	add r4, #0x28
	add r6, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #1
	bl MIi_CpuClearFast
	mov r0, #0x65
	str r6, [r4, #0xc]
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	add r0, r4, #0
	add r0, #0x24
	strb r1, [r0]
	add r5, #0x94
	add r0, r4, #0
	ldrb r1, [r5]
	add r0, #0x4c
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #1
	bl ov12_02264FB0
	mov r2, #0xfa
	ldr r0, _0225A520 ; =ov12_0225DA8C
	add r1, r4, #0
	lsl r2, r2, #2
	bl CreateSysTask
	str r0, [r4, #0x10]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225A520: .word ov12_0225DA8C
	thumb_func_end ov12_0225A4DC

	thumb_func_start ov12_0225A524
ov12_0225A524: ; 0x0225A524
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	mov r0, #5
	mov r1, #0x3c
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x3c
	bl MIi_CpuClearFast
	mov r2, #0
	strb r2, [r4, #0xa]
	strb r2, [r4, #0xb]
	str r5, [r4]
	ldrb r0, [r7]
	mov r1, #0x65
	lsl r1, r1, #2
	strb r0, [r4, #8]
	ldr r0, [sp]
	add r5, r7, #0
	ldrb r0, [r0, r1]
	add r1, r1, #1
	add r6, r4, #0
	strb r0, [r4, #9]
	ldr r0, [sp]
	ldrb r1, [r0, r1]
	add r0, r4, #0
	add r0, #0x34
	strb r1, [r0]
	ldr r0, [sp]
	add r0, #0x28
	str r0, [r4, #4]
	add r0, r4, #0
	ldrb r1, [r7, #1]
	add r0, #0x23
	strb r1, [r0]
	mov r0, #0x24
	ldrsh r0, [r7, r0]
	strh r0, [r4, #0x36]
	ldrh r0, [r7, #0x26]
	strh r0, [r4, #0x38]
	add r0, r7, #0
	add r0, #0x28
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x3a
	strb r1, [r0]
	add r0, r7, #0
	add r0, #0x29
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x3b
	strb r1, [r0]
_0225A596:
	mov r3, #0
_0225A598:
	add r0, r5, r3
	ldrb r1, [r0, #8]
	add r0, r6, r3
	add r3, r3, #1
	strb r1, [r0, #0x10]
	cmp r3, #6
	blt _0225A598
	add r2, r2, #1
	add r5, r5, #6
	add r6, r6, #6
	cmp r2, #2
	blt _0225A596
	mov r0, #0
	add r3, r0, #0
_0225A5B4:
	add r2, r7, r0
	ldrb r1, [r2, #8]
	cmp r1, #2
	bne _0225A5C2
	add r1, r4, r0
	strb r3, [r1, #0x1c]
	b _0225A5C8
_0225A5C2:
	ldrb r2, [r2, #2]
	add r1, r4, r0
	strb r2, [r1, #0x1c]
_0225A5C8:
	add r0, r0, #1
	cmp r0, #6
	blt _0225A5B4
	mov r3, #0
	add r5, r7, #0
	add r6, r4, #0
_0225A5D4:
	ldrh r0, [r5, #0x14]
	add r2, r7, r3
	add r5, r5, #2
	strh r0, [r6, #0x24]
	ldrb r1, [r2, #0x1c]
	add r0, r4, r3
	add r0, #0x2c
	strb r1, [r0]
	add r0, r4, r3
	add r2, #0x20
	ldrb r1, [r2]
	add r0, #0x30
	add r3, r3, #1
	add r6, r6, #2
	strb r1, [r0]
	cmp r3, #4
	blt _0225A5D4
	ldr r0, [sp]
	add r1, r4, #0
	ldr r0, [r0]
	mov r2, #0
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_0225A524

	thumb_func_start ov12_0225A604
ov12_0225A604: ; 0x0225A604
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	mov r0, #5
	mov r1, #0x24
	add r7, r2, #0
	bl AllocFromHeap
	add r3, r0, #0
	mov r1, #0x65
	mov r4, #0
	add r0, #0x20
	strb r4, [r0]
	ldr r0, [sp]
	str r5, [r3]
	add r0, #0x94
	ldrb r0, [r0]
	lsl r1, r1, #2
	add r5, r7, #0
	strb r0, [r3, #0x1c]
	ldr r0, [sp]
	add r6, r3, #0
	ldrb r0, [r0, r1]
	add r1, r1, #1
	strb r0, [r3, #0x1d]
	ldr r0, [sp]
	ldrb r0, [r0, r1]
	strb r0, [r3, #0x1e]
	ldr r0, [sp]
	add r0, #0x28
	str r0, [r3, #4]
	ldrb r0, [r7, #1]
	strb r0, [r3, #0x1f]
_0225A646:
	ldrh r0, [r5, #4]
	add r2, r7, r4
	add r1, r3, r4
	strh r0, [r6, #0xc]
	ldrb r0, [r2, #0xc]
	add r4, r4, #1
	add r5, r5, #2
	strb r0, [r1, #0x14]
	ldrb r0, [r2, #0x10]
	add r6, r6, #2
	cmp r4, #4
	strb r0, [r1, #0x18]
	blt _0225A646
	ldrh r0, [r7, #2]
	add r1, r3, #0
	mov r2, #0
	strh r0, [r3, #0x22]
	ldr r0, [sp]
	ldr r0, [r0, #4]
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0225A604

	thumb_func_start ov12_0225A674
ov12_0225A674: ; 0x0225A674
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r7, r1, #0
	mov r0, #5
	mov r1, #0x34
	add r5, r2, #0
	bl AllocFromHeap
	add r6, r0, #0
	mov r0, #0
	strb r0, [r6, #0xf]
	ldr r0, [sp]
	str r0, [r6]
	add r0, r7, #0
	add r0, #0x94
	ldrb r0, [r0]
	strb r0, [r6, #0xc]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r7, r0]
	add r0, r0, #1
	strb r1, [r6, #0xd]
	ldrb r0, [r7, r0]
	strb r0, [r6, #0xe]
	ldrh r0, [r5, #2]
	strh r0, [r6, #0x30]
	add r0, r7, #0
	add r0, #0x28
	str r0, [r6, #4]
	add r0, r6, #0
	ldrb r1, [r5, #1]
	add r0, #0x32
	strb r1, [r0]
	ldr r0, [sp]
	add r1, sp, #4
	bl ov12_0223C1C4
	ldr r0, [sp]
	bl ov12_0223A7F0
	add r4, r0, #0
	ldr r0, [sp]
	bl ov12_0223A7E0
	mov r0, #0
	cmp r4, #0
	ble _0225A6F0
	add r1, r6, #0
_0225A6D6:
	ldrh r2, [r5, #4]
	add r0, r0, #1
	strh r2, [r1, #0x10]
	ldrh r2, [r5, #6]
	strh r2, [r1, #0x12]
	ldrh r2, [r5, #8]
	strh r2, [r1, #0x14]
	ldrh r2, [r5, #0xa]
	add r5, #8
	strh r2, [r1, #0x16]
	add r1, #8
	cmp r0, r4
	blt _0225A6D6
_0225A6F0:
	ldr r0, [r7, #8]
	add r1, r6, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0225A674

	thumb_func_start ov12_0225A700
ov12_0225A700: ; 0x0225A700
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	str r1, [sp]
	mov r0, #5
	mov r1, #0x34
	str r2, [sp, #4]
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #5
	mov r1, #0x34
	bl AllocFromHeap
	str r0, [r4, #8]
	mov r0, #5
	mov r1, #0x38
	bl AllocFromHeap
	ldr r1, [r4, #8]
	str r0, [r1, #4]
	mov r0, #5
	bl SavArray_Party_alloc
	ldr r1, [r4, #8]
	mov r6, #0
	ldr r1, [r1, #4]
	ldr r3, [sp, #4]
	str r0, [r1]
	strb r6, [r4, #0xe]
	str r5, [r4]
	ldr r0, [sp, #4]
	mov r1, #0x65
	ldrb r0, [r0]
	lsl r1, r1, #2
	add r5, r4, #0
	strb r0, [r4, #0xc]
	ldr r0, [sp]
	ldrb r0, [r0, r1]
	add r1, r1, #1
	strb r0, [r4, #0xd]
	ldr r0, [sp]
	ldrb r0, [r0, r1]
	strb r0, [r4, #0xf]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #1]
	strb r0, [r4, #0x14]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #2]
	strb r0, [r4, #0x15]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #3]
	strb r0, [r4, #0x16]
_0225A76A:
	ldr r0, [sp, #4]
	ldr r1, [r4, #8]
	add r7, r0, r6
	ldrb r0, [r7, #4]
	add r1, r1, r6
	mov r2, #0
	strb r0, [r1, #0xc]
_0225A778:
	add r0, r3, r2
	ldrb r1, [r0, #8]
	add r0, r5, r2
	add r2, r2, #1
	strb r1, [r0, #0x18]
	cmp r2, #6
	blt _0225A778
	add r7, #0x20
	ldrb r1, [r7]
	add r0, r4, r6
	add r0, #0x30
	add r6, r6, #1
	strb r1, [r0]
	add r3, r3, #6
	add r5, r5, #6
	cmp r6, #4
	blt _0225A76A
	ldr r0, [sp]
	add r1, r4, #0
	ldr r0, [r0, #0xc]
	mov r2, #0
	bl CreateSysTask
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0225A700

	thumb_func_start ov12_0225A7AC
ov12_0225A7AC: ; 0x0225A7AC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	str r1, [sp]
	mov r0, #5
	mov r1, #0x34
	add r7, r2, #0
	bl AllocFromHeap
	add r2, r0, #0
	mov r3, #0
	strb r3, [r2, #0xa]
	str r4, [r2]
	ldrb r0, [r7]
	add r5, r7, #0
	add r6, r2, #0
	strb r0, [r2, #8]
	ldrb r0, [r7, #1]
	strb r0, [r2, #9]
	ldrb r0, [r7, #2]
	strb r0, [r2, #0xb]
	ldr r0, [r7, #0x20]
	str r0, [r2, #0x10]
	ldrb r0, [r7, #3]
	strb r0, [r2, #0x16]
	add r0, r7, #0
	strh r3, [r2, #0x14]
	add r0, #0x24
	ldrb r0, [r0]
	strb r0, [r2, #0x18]
_0225A7E6:
	add r0, r7, r3
	ldrb r1, [r0, #4]
	add r0, r2, r3
	mov r4, #0
	strb r1, [r0, #0xc]
_0225A7F0:
	add r0, r5, r4
	ldrb r1, [r0, #8]
	add r0, r6, r4
	add r4, r4, #1
	strb r1, [r0, #0x1c]
	cmp r4, #6
	blt _0225A7F0
	add r3, r3, #1
	add r5, r5, #6
	add r6, r6, #6
	cmp r3, #4
	blt _0225A7E6
	ldr r0, [sp]
	add r1, r2, #0
	ldr r0, [r0, #0x10]
	mov r2, #0
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0225A7AC

	thumb_func_start ov12_0225A818
ov12_0225A818: ; 0x0225A818
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #5
	mov r1, #0x1c
	add r4, r2, #0
	bl AllocFromHeap
	add r1, r0, #0
	mov r2, #0
	strb r2, [r1, #0xe]
	str r6, [r1]
	ldrb r0, [r4]
	strb r0, [r1, #0xc]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	strb r0, [r1, #0xd]
	add r0, r5, #0
	add r0, #0x28
	str r0, [r1, #4]
	ldrh r0, [r4, #2]
	str r0, [r1, #0x10]
	ldrb r0, [r4, #1]
	strb r0, [r1, #0xf]
	ldr r0, [r4, #4]
	strh r0, [r1, #0x18]
	ldr r0, [r4, #8]
	str r0, [r1, #0x14]
	ldr r0, [r5, #0x14]
	bl CreateSysTask
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0225A818

	thumb_func_start ov12_0225A85C
ov12_0225A85C: ; 0x0225A85C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	bl ov12_0223A934
	str r0, [sp]
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	str r6, [r4]
	ldrb r0, [r5]
	mov r1, #0x65
	lsl r1, r1, #2
	strb r0, [r4, #4]
	ldrb r0, [r7, r1]
	strb r0, [r4, #5]
	ldrh r2, [r5, #2]
	lsl r0, r2, #1
	add r2, r2, r0
	add r0, sp, #4
	strh r2, [r0, #2]
	mov r2, #2
	strb r2, [r0, #1]
	ldrb r0, [r5, #1]
	ldrb r1, [r7, r1]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [sp, #8]
	add r0, r6, #0
	bl ov12_0223B718
	add r3, r0, #0
	ldr r1, [sp]
	add r0, r6, #0
	add r2, sp, #4
	bl ov12_0223C494
	strb r0, [r4, #6]
	ldr r0, _0225A8C0 ; =ov12_022605D0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225A8C0: .word ov12_022605D0
	thumb_func_end ov12_0225A85C

	thumb_func_start ov12_0225A8C4
ov12_0225A8C4: ; 0x0225A8C4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	bl ov12_0223A930
	str r0, [sp]
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	add r0, r6, #0
	str r5, [r4]
	add r0, #0x94
	ldrb r0, [r0]
	strb r0, [r4, #4]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r6, r0]
	strb r0, [r4, #5]
	add r0, r5, #0
	bl ov12_0223B718
	add r3, r0, #0
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r7, #0
	bl ov12_0223C494
	strb r0, [r4, #6]
	ldr r0, _0225A910 ; =ov12_022605D0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225A910: .word ov12_022605D0
	thumb_func_end ov12_0225A8C4

	thumb_func_start ov12_0225A914
ov12_0225A914: ; 0x0225A914
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	mov r0, #5
	mov r1, #0x70
	add r4, r2, #0
	bl AllocFromHeap
	add r6, r0, #0
	mov r1, #0
	add r0, #0x6a
	strb r1, [r0]
	str r7, [r6]
	add r0, r5, #0
	str r5, [r6, #4]
	add r0, #0x94
	ldrb r1, [r0]
	add r0, r6, #0
	add r0, #0x68
	strb r1, [r0]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	add r0, r6, #0
	add r0, #0x69
	strb r1, [r0]
	add r0, r7, #0
	bl ov12_0223A8DC
	add r3, r6, #0
	str r0, [r6, #0xc]
	add r7, r4, #0
	add r3, #0x10
	mov r2, #0xb
_0225A958:
	ldmia r7!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0225A958
	ldr r0, [r5, #0x20]
	str r0, [r6, #8]
	ldr r0, [r4, #0x4c]
	cmp r0, #1
	bne _0225A978
	ldr r0, [r4, #0x50]
	cmp r0, #0x19
	bne _0225A978
	mov r0, #0x1a
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r5, r0]
_0225A978:
	ldr r0, [r4, #0x4c]
	cmp r0, #1
	bne _0225A98C
	ldr r0, [r4, #0x50]
	cmp r0, #0x1a
	bne _0225A98C
	mov r0, #0x1a
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
_0225A98C:
	ldrh r0, [r4, #2]
	add r1, r6, #0
	add r1, #0x6c
	str r0, [sp]
	add r0, r6, #0
	ldr r2, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	add r0, #0x6b
	bl ov12_02261D30
	ldr r0, _0225A9AC ; =ov12_0225FD14
	add r1, r6, #0
	mov r2, #0
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225A9AC: .word ov12_0225FD14
	thumb_func_end ov12_0225A914

	thumb_func_start ov12_0225A9B0
ov12_0225A9B0: ; 0x0225A9B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #5
	mov r1, #0xc
	bl AllocFromHeap
	add r1, r0, #0
	mov r2, #0
	strb r2, [r1, #9]
	str r5, [r1]
	ldr r0, [r4, #0x20]
	str r0, [r1, #4]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	strb r0, [r1, #8]
	ldr r0, _0225A9DC ; =ov12_0225FF80
	strb r2, [r1, #0xa]
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225A9DC: .word ov12_0225FF80
	thumb_func_end ov12_0225A9B0

	thumb_func_start ov12_0225A9E0
ov12_0225A9E0: ; 0x0225A9E0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r0, #0
	ldr r0, [r6, #0x2c]
	add r5, r2, #0
	cmp r0, #0
	bne _0225A9F2
	bl GF_AssertFail
_0225A9F2:
	add r4, r6, #0
	add r4, #0x28
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl MI_CpuFill8
	str r7, [r4, #0xc]
	add r0, r4, #0
	ldrb r1, [r5]
	add r0, #0x4c
	strb r1, [r0]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r6, r0]
	add r0, r4, #0
	add r0, #0x24
	strb r1, [r0]
	add r0, r7, #0
	bl ov12_0223A7E0
	add r1, r0, #0
	ldr r0, _0225AA60 ; =0x00000195
	ldrb r0, [r6, r0]
	bl ov12_02265B64
	add r1, r4, #0
	add r1, #0x25
	strb r0, [r1]
	mov r0, #2
	ldrsh r0, [r5, r0]
	str r0, [r4, #0x28]
	ldrh r0, [r5, #4]
	str r0, [r4, #0x2c]
	ldr r0, [r5, #8]
	str r0, [r4, #0x30]
	add r0, r4, #0
	ldrb r1, [r5, #1]
	add r0, #0x48
	strb r1, [r0]
	ldr r1, [r5, #8]
	ldr r0, _0225AA64 ; =0x00007FFF
	cmp r1, r0
	bne _0225AA50
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x30]
_0225AA50:
	mov r2, #0xfa
	ldr r0, _0225AA68 ; =ov12_0225FFDC
	add r1, r4, #0
	lsl r2, r2, #2
	bl CreateSysTask
	str r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225AA60: .word 0x00000195
_0225AA64: .word 0x00007FFF
_0225AA68: .word ov12_0225FFDC
	thumb_func_end ov12_0225A9E0

	thumb_func_start ov12_0225AA6C
ov12_0225AA6C: ; 0x0225AA6C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r0, #0
	ldr r0, [r6, #0x2c]
	add r5, r2, #0
	cmp r0, #0
	bne _0225AA7E
	bl GF_AssertFail
_0225AA7E:
	add r4, r6, #0
	add r4, #0x28
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl MI_CpuFill8
	str r7, [r4, #0xc]
	add r0, r4, #0
	ldrb r1, [r5]
	add r0, #0x4c
	strb r1, [r0]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r2, [r6, r0]
	add r1, r4, #0
	add r1, #0x24
	strb r2, [r1]
	ldr r1, [r5, #4]
	add r0, r0, #1
	str r1, [r4, #0x38]
	ldr r1, [r5, #0xc]
	str r1, [r4, #0x3c]
	ldr r2, [r5, #8]
	ldr r1, [r4, #0x38]
	sub r1, r2, r1
	str r1, [r4, #0x40]
	ldrb r0, [r6, r0]
	cmp r0, #0
	bne _0225AACA
	mov r2, #0xfa
	ldr r0, _0225AADC ; =ov12_02260030
	add r1, r4, #0
	lsl r2, r2, #2
	bl CreateSysTask
	str r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_0225AACA:
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x24
	add r4, #0x4c
	ldrb r1, [r1]
	ldrb r2, [r4]
	bl ov12_0226430C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225AADC: .word ov12_02260030
	thumb_func_end ov12_0225AA6C

	thumb_func_start ov12_0225AAE0
ov12_0225AAE0: ; 0x0225AAE0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #5
	mov r1, #0x74
	str r2, [sp]
	bl AllocFromHeap
	add r1, r0, #0
	ldr r0, _0225ABB0 ; =0x00000195
	ldrb r2, [r4, r0]
	mov r0, #1
	tst r0, r2
	beq _0225AB00
	mov r2, #2
	b _0225AB02
_0225AB00:
	mov r2, #0
_0225AB02:
	add r0, r1, #0
	add r0, #0x67
	strb r2, [r0]
	add r2, r1, #0
	mov r0, #0
	add r2, #0x66
	strb r0, [r2]
	str r5, [r1]
	ldr r2, [sp]
	str r4, [r1, #4]
	ldrb r3, [r2]
	add r2, r1, #0
	add r2, #0x64
	strb r3, [r2]
	mov r2, #0x65
	lsl r2, r2, #2
	ldrb r3, [r4, r2]
	add r2, r1, #0
	add r2, #0x65
	strb r3, [r2]
	ldr r2, [r4, #0x20]
	add r7, r1, #0
	str r2, [r1, #8]
	ldr r2, [sp]
	ldrh r3, [r2, #2]
	add r2, r1, #0
	add r2, #0x68
	strh r3, [r2]
	ldr r2, [sp]
	ldrb r3, [r2, #1]
	add r2, r1, #0
	add r2, #0x6a
	strb r3, [r2]
	ldr r2, [sp]
	ldrb r3, [r2, #8]
	add r2, r1, #0
	add r2, #0x6b
	strb r3, [r2]
	ldr r2, [sp]
	ldr r2, [r2, #4]
	str r2, [r1, #0x6c]
	ldr r2, [sp]
	ldrb r3, [r2, #9]
	add r2, r1, #0
	add r2, #0x70
	strh r3, [r2]
	ldr r2, [sp]
	ldrb r3, [r2, #0xa]
	add r2, r1, #0
	add r2, #0x72
	strh r3, [r2]
	ldr r2, [sp]
	add r3, r1, #0
	mov ip, r2
_0225AB6E:
	mov r4, ip
	ldrh r4, [r4, #0xc]
	strh r4, [r7, #0x24]
	ldr r4, [sp]
	add r7, r7, #2
	add r6, r4, r0
	add r4, r1, r0
	ldrb r5, [r6, #0x14]
	add r4, #0x2c
	strb r5, [r4]
	add r4, r1, r0
	ldrb r5, [r6, #0x18]
	add r4, #0x30
	strb r5, [r4]
	add r4, r1, r0
	ldrb r5, [r6, #0x1c]
	add r4, #0x34
	add r0, r0, #1
	strb r5, [r4]
	ldr r4, [r2, #0x20]
	add r2, r2, #4
	str r4, [r3, #0x38]
	mov r4, ip
	add r4, r4, #2
	add r3, r3, #4
	mov ip, r4
	cmp r0, #4
	blt _0225AB6E
	ldr r0, _0225ABB4 ; =ov12_022600F0
	mov r2, #0
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225ABB0: .word 0x00000195
_0225ABB4: .word ov12_022600F0
	thumb_func_end ov12_0225AAE0

	thumb_func_start ov12_0225ABB8
ov12_0225ABB8: ; 0x0225ABB8
	push {r3, r4, r5, lr}
	add r5, r2, #0
	ldr r2, _0225ABE4 ; =0x00000195
	mov r4, #1
	ldrb r2, [r1, r2]
	tst r2, r4
	beq _0225ABCA
	mov r4, #0x75
	b _0225ABCC
_0225ABCA:
	sub r4, #0x76
_0225ABCC:
	mov r2, #0x65
	lsl r2, r2, #2
	ldrb r1, [r1, r2]
	ldrb r2, [r5]
	bl ov12_0226430C
	ldrh r0, [r5, #2]
	add r1, r4, #0
	bl sub_0200602C
	pop {r3, r4, r5, pc}
	nop
_0225ABE4: .word 0x00000195
	thumb_func_end ov12_0225ABB8

	thumb_func_start ov12_0225ABE8
ov12_0225ABE8: ; 0x0225ABE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r1, r0, #0
	mov r2, #0
	strb r2, [r1, #6]
	add r0, r4, #0
	str r5, [r1]
	add r0, #0x94
	ldrb r0, [r0]
	strb r0, [r1, #4]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	strb r0, [r1, #5]
	ldr r0, _0225AC18 ; =ov12_0226037C
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	nop
_0225AC18: .word ov12_0226037C
	thumb_func_end ov12_0225ABE8

	thumb_func_start ov12_0225AC1C
ov12_0225AC1C: ; 0x0225AC1C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #5
	mov r1, #0x68
	str r2, [sp]
	bl AllocFromHeap
	add r1, r0, #0
	str r5, [r1]
	ldr r0, [sp]
	str r4, [r1, #4]
	ldrb r2, [r0]
	add r0, r1, #0
	add r0, #0x60
	strb r2, [r0]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r2, [r4, r0]
	add r0, r1, #0
	add r0, #0x61
	strb r2, [r0]
	add r2, r1, #0
	mov r0, #0
	add r2, #0x62
	strb r0, [r2]
	ldr r2, [sp]
	add r7, r1, #0
	ldrb r3, [r2, #1]
	add r2, r1, #0
	add r2, #0x63
	strb r3, [r2]
	ldr r2, [sp]
	add r3, r1, #0
	ldrb r2, [r2, #2]
	str r2, [r1, #0x64]
	ldr r2, [sp]
	mov ip, r2
_0225AC68:
	mov r4, ip
	ldrh r4, [r4, #4]
	strh r4, [r7, #0x20]
	ldr r4, [sp]
	add r7, r7, #2
	add r6, r4, r0
	add r4, r1, r0
	ldrb r5, [r6, #0xc]
	add r4, #0x28
	strb r5, [r4]
	add r4, r1, r0
	ldrb r5, [r6, #0x10]
	add r4, #0x2c
	strb r5, [r4]
	add r4, r1, r0
	ldrb r5, [r6, #0x14]
	add r4, #0x30
	add r0, r0, #1
	strb r5, [r4]
	ldr r4, [r2, #0x18]
	add r2, r2, #4
	str r4, [r3, #0x34]
	mov r4, ip
	add r4, r4, #2
	add r3, r3, #4
	mov ip, r4
	cmp r0, #4
	blt _0225AC68
	ldr r0, _0225ACAC ; =ov12_02260418
	mov r2, #0
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225ACAC: .word ov12_02260418
	thumb_func_end ov12_0225AC1C

	thumb_func_start ov12_0225ACB0
ov12_0225ACB0: ; 0x0225ACB0
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5, #0x2c]
	add r4, r2, #0
	cmp r0, #0
	bne _0225ACC2
	bl GF_AssertFail
_0225ACC2:
	ldrb r1, [r4, #1]
	add r0, r5, #0
	add r0, #0x72
	strb r1, [r0]
	add r0, r5, #0
	mov r2, #1
	ldr r1, [r5, #0x50]
	add r0, #0x28
	lsl r2, r2, #8
	bl ov12_0226498C
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r4]
	add r0, r6, #0
	bl ov12_0226430C
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0225ACB0

	thumb_func_start ov12_0225ACE8
ov12_0225ACE8: ; 0x0225ACE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	add r6, r0, #0
	add r7, r2, #0
	bl ov12_0223A9AC
	str r0, [sp, #4]
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	str r6, [r4]
	ldrb r0, [r7]
	strb r0, [r4, #4]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	strb r0, [r4, #5]
	add r0, r6, #0
	bl ov12_0223B718
	str r0, [sp]
	mov r2, #0x65
	lsl r2, r2, #2
	ldrb r2, [r5, r2]
	ldrb r3, [r7, #1]
	ldr r1, [sp, #4]
	add r0, r6, #0
	bl ov12_0223C34C
	strb r0, [r4, #6]
	ldr r0, _0225AD40 ; =ov12_022605D0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225AD40: .word ov12_022605D0
	thumb_func_end ov12_0225ACE8

	thumb_func_start ov12_0225AD44
ov12_0225AD44: ; 0x0225AD44
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	add r3, sp, #4
	add r6, r1, #0
	add r7, r2, #0
	bl ov12_02261390
	add r0, r5, #0
	bl ov12_0223A930
	str r0, [sp]
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	ldrb r0, [r7]
	strb r0, [r4, #4]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r6, r0]
	strb r0, [r4, #5]
	add r0, r5, #0
	bl ov12_0223B718
	add r3, r0, #0
	ldr r1, [sp]
	add r0, r5, #0
	add r2, sp, #4
	bl ov12_0223C494
	strb r0, [r4, #6]
	ldr r0, _0225AD98 ; =ov12_022605D0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225AD98: .word ov12_022605D0
	thumb_func_end ov12_0225AD44

	thumb_func_start ov12_0225AD9C
ov12_0225AD9C: ; 0x0225AD9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	add r3, sp, #4
	add r6, r1, #0
	add r7, r2, #0
	bl ov12_02261464
	add r0, r5, #0
	bl ov12_0223A930
	str r0, [sp]
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	ldrb r0, [r7]
	strb r0, [r4, #4]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r6, r0]
	strb r0, [r4, #5]
	add r0, r5, #0
	bl ov12_0223B718
	add r3, r0, #0
	ldr r1, [sp]
	add r0, r5, #0
	add r2, sp, #4
	bl ov12_0223C494
	strb r0, [r4, #6]
	ldr r0, _0225ADF0 ; =ov12_022605D0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225ADF0: .word ov12_022605D0
	thumb_func_end ov12_0225AD9C

	thumb_func_start ov12_0225ADF4
ov12_0225ADF4: ; 0x0225ADF4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	add r2, sp, #0
	add r6, r1, #0
	bl ov12_02261544
	add r0, r5, #0
	bl ov12_0223A930
	add r7, r0, #0
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	mov r0, #0x22
	strb r0, [r4, #4]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r6, r0]
	strb r0, [r4, #5]
	add r0, r5, #0
	bl ov12_0223B718
	add r3, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, sp, #0
	bl ov12_0223C494
	strb r0, [r4, #6]
	ldr r0, _0225AE44 ; =ov12_022605D0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225AE44: .word ov12_022605D0
	thumb_func_end ov12_0225ADF4

	thumb_func_start ov12_0225AE48
ov12_0225AE48: ; 0x0225AE48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	add r3, sp, #4
	add r6, r1, #0
	add r7, r2, #0
	bl ov12_022615F0
	add r0, r5, #0
	bl ov12_0223A930
	str r0, [sp]
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	ldrb r0, [r7]
	strb r0, [r4, #4]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r6, r0]
	strb r0, [r4, #5]
	add r0, r5, #0
	bl ov12_0223B718
	add r3, r0, #0
	ldr r1, [sp]
	add r0, r5, #0
	add r2, sp, #4
	bl ov12_0223C494
	strb r0, [r4, #6]
	ldr r0, _0225AE9C ; =ov12_022605D0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225AE9C: .word ov12_022605D0
	thumb_func_end ov12_0225AE48

	thumb_func_start ov12_0225AEA0
ov12_0225AEA0: ; 0x0225AEA0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #5
	mov r1, #0xc
	bl AllocFromHeap
	add r1, r0, #0
	add r0, r4, #0
	str r5, [r1]
	add r0, #0x94
	ldrb r0, [r0]
	mov r2, #0
	strb r0, [r1, #8]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	add r4, #0x28
	strb r0, [r1, #9]
	strb r2, [r1, #0xa]
	ldr r0, _0225AED4 ; =ov12_02260584
	str r4, [r1, #4]
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	nop
_0225AED4: .word ov12_02260584
	thumb_func_end ov12_0225AEA0

	thumb_func_start ov12_0225AED8
ov12_0225AED8: ; 0x0225AED8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r1, _0225AF6C ; =0x00000196
	add r4, r2, #0
	ldrb r2, [r5, r1]
	add r6, r0, #0
	cmp r2, #0
	bne _0225AF2A
	bl ov12_0223A930
	str r0, [sp]
	mov r0, #5
	mov r1, #0xc
	bl AllocFromHeap
	add r7, r0, #0
	str r6, [r7]
	ldrb r0, [r4]
	strb r0, [r7, #4]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	strb r0, [r7, #5]
	mov r0, #0
	strb r0, [r7, #7]
	add r0, r6, #0
	bl ov12_0223B718
	add r3, r0, #0
	ldr r1, [sp]
	add r0, r6, #0
	add r2, r4, #4
	bl ov12_0223C494
	strb r0, [r7, #6]
	ldr r0, _0225AF70 ; =ov12_02260614
	add r1, r7, #0
	mov r2, #0
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
_0225AF2A:
	cmp r2, #1
	bne _0225AF46
	sub r1, r1, #2
	ldrb r1, [r5, r1]
	bl ov12_02263A00
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r4]
	add r0, r6, #0
	bl ov12_0226430C
	pop {r3, r4, r5, r6, r7, pc}
_0225AF46:
	bl ov12_0223A7E0
	mov r1, #4
	tst r0, r1
	bne _0225AF5C
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	add r0, r6, #0
	bl ov12_02263A00
_0225AF5C:
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r4]
	add r0, r6, #0
	bl ov12_0226430C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225AF6C: .word 0x00000196
_0225AF70: .word ov12_02260614
	thumb_func_end ov12_0225AED8

	thumb_func_start ov12_0225AF74
ov12_0225AF74: ; 0x0225AF74
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r4, r6, #0
	add r4, #0x28
	add r7, r0, #0
	add r5, r2, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #1
	bl MIi_CpuClearFast
	mov r0, #0x65
	str r7, [r4, #0xc]
	lsl r0, r0, #2
	ldrb r1, [r6, r0]
	add r0, r4, #0
	add r0, #0x24
	strb r1, [r0]
	add r0, r7, #0
	bl ov12_0223A7E0
	add r1, r0, #0
	ldr r0, _0225B024 ; =0x00000195
	ldrb r0, [r6, r0]
	bl ov12_02265B64
	add r1, r4, #0
	add r1, #0x25
	strb r0, [r1]
	add r0, r4, #0
	ldrb r1, [r5]
	add r0, #0x4c
	mov r2, #0
	strb r1, [r0]
	mov r0, #2
	ldrsh r0, [r5, r0]
	str r0, [r4, #0x28]
	ldrh r0, [r5, #4]
	str r0, [r4, #0x2c]
	add r0, r4, #0
	ldrb r1, [r5, #1]
	add r0, #0x48
	strb r1, [r0]
	ldrb r0, [r5, #7]
	lsl r0, r0, #0x19
	lsr r1, r0, #0x1e
	add r0, r4, #0
	add r0, #0x49
	strb r1, [r0]
	str r2, [r4, #0x30]
	ldr r0, [r5, #8]
	sub r2, #0x21
	str r0, [r4, #0x38]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0x3c]
	add r0, r4, #0
	ldrb r1, [r5, #6]
	add r0, #0x26
	strb r1, [r0]
	ldrb r0, [r5, #7]
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x1b
	add r0, r4, #0
	add r0, #0x4a
	strb r1, [r0]
	ldrb r0, [r5, #7]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x1f
	add r0, r4, #0
	add r0, #0x4b
	strb r1, [r0]
	add r0, r4, #0
	ldr r1, [r5, #0x10]
	add r0, #0x27
	strb r1, [r0]
	ldr r1, [r4, #0x28]
	add r0, r4, #0
	bl ov12_0226498C
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x24
	add r4, #0x4c
	ldrb r1, [r1]
	ldrb r2, [r4]
	bl ov12_0226430C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225B024: .word 0x00000195
	thumb_func_end ov12_0225AF74

	thumb_func_start ov12_0225B028
ov12_0225B028: ; 0x0225B028
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #5
	mov r1, #0x10
	add r4, r2, #0
	bl AllocFromHeap
	add r1, r0, #0
	mov r2, #0
	strb r2, [r1, #0xa]
	str r5, [r1]
	ldrb r0, [r4]
	strb r0, [r1, #8]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r6, r0]
	strb r0, [r1, #9]
	ldrh r0, [r4, #2]
	strh r0, [r1, #0xc]
	ldrb r0, [r4, #1]
	strb r0, [r1, #0xe]
	ldr r0, _0225B05C ; =ov12_022609F8
	bl CreateSysTask
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225B05C: .word ov12_022609F8
	thumb_func_end ov12_0225B028

	thumb_func_start ov12_0225B060
ov12_0225B060: ; 0x0225B060
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #5
	mov r1, #0x10
	add r4, r2, #0
	bl AllocFromHeap
	add r1, r0, #0
	mov r2, #0
	strb r2, [r1, #0xa]
	str r6, [r1]
	ldr r0, [r5, #0x20]
	str r0, [r1, #4]
	ldrb r0, [r4]
	strb r0, [r1, #8]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	strb r0, [r1, #9]
	ldrb r0, [r4, #1]
	strb r0, [r1, #0xb]
	strb r2, [r1, #0xc]
	ldrb r0, [r4, #2]
	strb r0, [r1, #0xd]
	ldr r0, _0225B09C ; =ov12_02260B30
	bl CreateSysTask
	pop {r4, r5, r6, pc}
	nop
_0225B09C: .word ov12_02260B30
	thumb_func_end ov12_0225B060

	thumb_func_start ov12_0225B0A0
ov12_0225B0A0: ; 0x0225B0A0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #5
	mov r1, #0x10
	add r4, r2, #0
	bl AllocFromHeap
	add r1, r0, #0
	mov r0, #0
	strb r0, [r1, #7]
	str r6, [r1]
	ldrb r2, [r4]
	strb r2, [r1, #4]
	mov r2, #0x65
	lsl r2, r2, #2
	ldrb r3, [r5, r2]
	add r2, r2, #1
	strb r3, [r1, #5]
	ldrb r2, [r5, r2]
	strb r2, [r1, #6]
_0225B0CA:
	add r2, r4, r0
	ldrb r3, [r2, #2]
	add r2, r1, r0
	add r0, r0, #1
	strb r3, [r2, #8]
	cmp r0, #6
	blt _0225B0CA
	ldr r0, _0225B0E4 ; =ov12_02260BA0
	mov r2, #0
	strb r2, [r1, #0xe]
	bl CreateSysTask
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225B0E4: .word ov12_02260BA0
	thumb_func_end ov12_0225B0A0

	thumb_func_start ov12_0225B0E8
ov12_0225B0E8: ; 0x0225B0E8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #5
	mov r1, #0x10
	add r6, r2, #0
	bl AllocFromHeap
	add r1, r0, #0
	mov r2, #0
	strb r2, [r1, #7]
	str r5, [r1]
	ldrb r0, [r6]
	strb r0, [r1, #4]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r3, [r4, r0]
	add r0, r0, #1
	strb r3, [r1, #5]
	ldrb r0, [r4, r0]
	strb r0, [r1, #6]
	ldr r0, _0225B11C ; =ov12_02260C58
	strb r2, [r1, #0xe]
	bl CreateSysTask
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225B11C: .word ov12_02260C58
	thumb_func_end ov12_0225B0E8

	thumb_func_start ov12_0225B120
ov12_0225B120: ; 0x0225B120
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #5
	mov r1, #0x10
	add r4, r2, #0
	bl AllocFromHeap
	add r1, r0, #0
	mov r0, #0
	strb r0, [r1, #7]
	str r6, [r1]
	ldrb r2, [r4]
	strb r2, [r1, #4]
	mov r2, #0x65
	lsl r2, r2, #2
	ldrb r3, [r5, r2]
	add r2, r2, #1
	strb r3, [r1, #5]
	ldrb r2, [r5, r2]
	strb r2, [r1, #6]
_0225B14A:
	add r2, r4, r0
	ldrb r3, [r2, #2]
	add r2, r1, r0
	add r0, r0, #1
	strb r3, [r2, #8]
	cmp r0, #6
	blt _0225B14A
	mov r0, #1
	strb r0, [r1, #0xe]
	ldr r0, _0225B168 ; =ov12_02260BA0
	mov r2, #0
	bl CreateSysTask
	pop {r4, r5, r6, pc}
	nop
_0225B168: .word ov12_02260BA0
	thumb_func_end ov12_0225B120

	thumb_func_start ov12_0225B16C
ov12_0225B16C: ; 0x0225B16C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #5
	mov r1, #0x10
	add r6, r2, #0
	bl AllocFromHeap
	add r1, r0, #0
	mov r2, #0
	strb r2, [r1, #7]
	str r5, [r1]
	ldrb r0, [r6]
	strb r0, [r1, #4]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r3, [r4, r0]
	add r0, r0, #1
	strb r3, [r1, #5]
	ldrb r0, [r4, r0]
	strb r0, [r1, #6]
	mov r0, #1
	strb r0, [r1, #0xe]
	ldr r0, _0225B1A4 ; =ov12_02260C58
	bl CreateSysTask
	pop {r4, r5, r6, pc}
	nop
_0225B1A4: .word ov12_02260C58
	thumb_func_end ov12_0225B16C

	thumb_func_start ov12_0225B1A8
ov12_0225B1A8: ; 0x0225B1A8
	push {r4, r5, lr}
	sub sp, #0x24
	add r4, r1, #0
	ldr r1, _0225B1F8 ; =0x00000196
	add r5, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	bne _0225B1E6
	bl ov12_0223A930
	add r1, r0, #0
	ldr r2, _0225B1FC ; =0x0000039B
	add r0, sp, #0
	strh r2, [r0, #2]
	mov r3, #0
	strb r3, [r0, #1]
	add r0, r5, #0
	add r2, sp, #0
	bl ov12_0223C494
	add r0, r5, #0
	mov r1, #0
	bl ov12_0223A7D8
	mov r1, #1
	bl sub_0200F0AC
	add r1, r0, #0
	add r0, r5, #0
	bl ov12_0223BB80
_0225B1E6:
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x37
	bl ov12_0226430C
	add sp, #0x24
	pop {r4, r5, pc}
	.balign 4, 0
_0225B1F8: .word 0x00000196
_0225B1FC: .word 0x0000039B
	thumb_func_end ov12_0225B1A8

	thumb_func_start ov12_0225B200
ov12_0225B200: ; 0x0225B200
	push {r4, r5, r6, lr}
	sub sp, #0x50
	mov r3, #0x65
	add r4, r1, #0
	lsl r3, r3, #2
	add r6, r2, #0
	ldrb r3, [r4, r3]
	add r1, r6, #0
	add r2, sp, #0
	add r5, r0, #0
	bl ov12_02261CA8
	add r0, sp, #0
	mov r1, #5
	bl ov07_0223494C
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	ldrb r2, [r6]
	add r0, r5, #0
	bl ov12_0226430C
	add sp, #0x50
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0225B200

	thumb_func_start ov12_0225B234
ov12_0225B234: ; 0x0225B234
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #5
	mov r1, #0x10
	bl AllocFromHeap
	add r1, r0, #0
	mov r2, #0
	strb r2, [r1, #0xe]
	str r5, [r1]
	add r0, r4, #0
	str r4, [r1, #4]
	add r0, #0x94
	ldrb r0, [r0]
	strb r0, [r1, #0xc]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	strb r0, [r1, #0xd]
	ldr r0, [r4, #0x20]
	str r0, [r1, #8]
	ldr r0, _0225B268 ; =ov12_02260CDC
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225B268: .word ov12_02260CDC
	thumb_func_end ov12_0225B234

	thumb_func_start ov12_0225B26C
ov12_0225B26C: ; 0x0225B26C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #5
	mov r1, #0x10
	bl AllocFromHeap
	add r1, r0, #0
	mov r2, #0
	strb r2, [r1, #0xe]
	str r5, [r1]
	add r0, r4, #0
	str r4, [r1, #4]
	add r0, #0x94
	ldrb r0, [r0]
	strb r0, [r1, #0xc]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	strb r0, [r1, #0xd]
	ldr r0, [r4, #0x20]
	str r0, [r1, #8]
	ldr r0, _0225B2A0 ; =ov12_02260D28
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225B2A0: .word ov12_02260D28
	thumb_func_end ov12_0225B26C

	thumb_func_start ov12_0225B2A4
ov12_0225B2A4: ; 0x0225B2A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	add r2, sp, #0
	add r6, r1, #0
	bl ov12_02261928
	add r0, r5, #0
	bl ov12_0223A930
	add r7, r0, #0
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	mov r0, #0x3b
	strb r0, [r4, #4]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r6, r0]
	strb r0, [r4, #5]
	add r0, r5, #0
	bl ov12_0223B718
	add r3, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, sp, #0
	bl ov12_0223C494
	strb r0, [r4, #6]
	ldr r0, _0225B2F4 ; =ov12_022605D0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225B2F4: .word ov12_022605D0
	thumb_func_end ov12_0225B2A4

	thumb_func_start ov12_0225B2F8
ov12_0225B2F8: ; 0x0225B2F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	add r3, sp, #0
	add r6, r1, #0
	bl ov12_022619E4
	add r0, r5, #0
	bl ov12_0223A930
	add r7, r0, #0
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	mov r0, #0x3c
	strb r0, [r4, #4]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r6, r0]
	strb r0, [r4, #5]
	add r0, r5, #0
	bl ov12_0223B718
	add r3, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, sp, #0
	bl ov12_0223C494
	strb r0, [r4, #6]
	ldr r0, _0225B348 ; =ov12_022605D0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225B348: .word ov12_022605D0
	thumb_func_end ov12_0225B2F8

	thumb_func_start ov12_0225B34C
ov12_0225B34C: ; 0x0225B34C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	add r2, sp, #0
	add r6, r1, #0
	bl ov12_02261AD4
	add r0, r5, #0
	bl ov12_0223A930
	add r7, r0, #0
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	mov r0, #0x3d
	strb r0, [r4, #4]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r6, r0]
	strb r0, [r4, #5]
	add r0, r5, #0
	bl ov12_0223B718
	add r3, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, sp, #0
	bl ov12_0223C494
	strb r0, [r4, #6]
	ldr r0, _0225B39C ; =ov12_022605D0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225B39C: .word ov12_022605D0
	thumb_func_end ov12_0225B34C

	thumb_func_start ov12_0225B3A0
ov12_0225B3A0: ; 0x0225B3A0
	push {r4, r5, r6, lr}
	sub sp, #0x50
	mov r3, #0x65
	add r4, r1, #0
	lsl r3, r3, #2
	add r6, r2, #0
	ldrb r3, [r4, r3]
	add r1, r6, #0
	add r2, sp, #0
	add r5, r0, #0
	bl ov12_02261CA8
	add r0, sp, #0
	mov r1, #5
	bl ov07_02234A20
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	ldrb r2, [r6]
	add r0, r5, #0
	bl ov12_0226430C
	add sp, #0x50
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0225B3A0

	thumb_func_start ov12_0225B3D4
ov12_0225B3D4: ; 0x0225B3D4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	ldr r0, _0225B424 ; =0x00000195
	mov r1, #1
	ldrb r0, [r5, r0]
	add r4, r2, #0
	tst r0, r1
	beq _0225B3EA
	mov r1, #0x75
	b _0225B3EC
_0225B3EA:
	sub r1, #0x76
_0225B3EC:
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0225B3FC
	cmp r0, #1
	beq _0225B40C
	cmp r0, #2
	beq _0225B404
	b _0225B412
_0225B3FC:
	ldr r0, _0225B428 ; =0x000006FE
	bl sub_0200602C
	b _0225B412
_0225B404:
	ldr r0, _0225B42C ; =0x000006FC
	bl sub_0200602C
	b _0225B412
_0225B40C:
	ldr r0, _0225B430 ; =0x000006FD
	bl sub_0200602C
_0225B412:
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r4]
	add r0, r6, #0
	bl ov12_0226430C
	pop {r4, r5, r6, pc}
	nop
_0225B424: .word 0x00000195
_0225B428: .word 0x000006FE
_0225B42C: .word 0x000006FC
_0225B430: .word 0x000006FD
	thumb_func_end ov12_0225B3D4

	thumb_func_start ov12_0225B434
ov12_0225B434: ; 0x0225B434
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r6, r0, #0
	ldrh r0, [r4, #2]
	add r5, r1, #0
	bl PlayBGM
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r4]
	add r0, r6, #0
	bl ov12_0226430C
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0225B434

	thumb_func_start ov12_0225B454
ov12_0225B454: ; 0x0225B454
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	mov r0, #5
	mov r1, #0xc
	add r5, r2, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	mov r2, #0
	strb r2, [r4, #6]
	str r6, [r4]
	ldrb r0, [r5]
	add r1, r4, #0
	strb r0, [r4, #4]
	ldrb r0, [r5, #1]
	strb r0, [r4, #7]
	mov r0, #0x65
	strb r2, [r4, #8]
	lsl r0, r0, #2
	ldrb r0, [r7, r0]
	strb r0, [r4, #5]
	ldr r0, _0225B490 ; =ov12_02260D84
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225B490: .word ov12_02260D84
	thumb_func_end ov12_0225B454

	thumb_func_start ov12_0225B494
ov12_0225B494: ; 0x0225B494
	push {r4, r5, r6, lr}
	sub sp, #0x70
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	ldrb r1, [r4, #0x12]
	add r5, r0, #0
	cmp r1, #4
	bls _0225B4AC
	b _0225B798
_0225B4AC:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225B4B8: ; jump table
	.short _0225B4C2 - _0225B4B8 - 2 ; case 0
	.short _0225B4CC - _0225B4B8 - 2 ; case 1
	.short _0225B4DA - _0225B4B8 - 2 ; case 2
	.short _0225B728 - _0225B4B8 - 2 ; case 3
	.short _0225B77C - _0225B4B8 - 2 ; case 4
_0225B4C2:
	mov r0, #0x1c
	str r0, [r4, #0x20]
	ldrb r0, [r4, #0x12]
	add r0, r0, #1
	strb r0, [r4, #0x12]
_0225B4CC:
	ldr r0, [r4, #0x20]
	sub r0, r0, #1
	str r0, [r4, #0x20]
	bne _0225B5A0
	ldrb r0, [r4, #0x12]
	add r0, r0, #1
	strb r0, [r4, #0x12]
_0225B4DA:
	ldrb r0, [r4, #0x13]
	add r1, sp, #0x14
	cmp r0, #2
	ldr r0, [r4, #0xc]
	beq _0225B4E6
	b _0225B61A
_0225B4E6:
	ldr r0, [r0]
	add r1, #2
	add r2, sp, #0x14
	bl sub_0200DE44
	ldr r0, [r4, #0x1c]
	cmp r0, #1
	beq _0225B4FA
	cmp r0, #3
	bne _0225B51C
_0225B4FA:
	add r1, sp, #0x14
	mov r0, #2
	ldrsh r0, [r1, r0]
	cmp r0, #0xc0
	ldr r0, [r4, #0xc]
	bge _0225B512
	ldr r0, [r0]
	mov r1, #8
	mov r2, #0
	bl sub_0200DED0
	b _0225B51C
_0225B512:
	ldr r0, [r0]
	mov r1, #0xc0
	mov r2, #0x58
	bl sub_0200DDB8
_0225B51C:
	ldr r0, [r4, #0xc]
	add r1, sp, #0x14
	ldr r0, [r0]
	add r1, #2
	add r2, sp, #0x14
	bl sub_0200DE44
	ldr r0, [r4, #0x1c]
	cmp r0, #1
	bne _0225B540
	add r3, sp, #0x14
	mov r2, #2
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_020087A4
	b _0225B590
_0225B540:
	cmp r0, #3
	bne _0225B56A
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02008A78
	add r3, sp, #0x14
	mov r2, #2
	ldrsh r1, [r3, r2]
	sub r0, r0, r1
	strh r0, [r3, #2]
	ldrsh r0, [r3, r2]
	mov r1, #0
	sub r0, #0x18
	strh r0, [r3, #2]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #8]
	neg r2, r2
	bl sub_02008C2C
	b _0225B590
_0225B56A:
	cmp r0, #5
	bne _0225B590
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02008A78
	add r3, sp, #0x14
	mov r2, #2
	ldrsh r1, [r3, r2]
	sub r0, r1, r0
	strh r0, [r3, #2]
	ldrsh r0, [r3, r2]
	mov r1, #0
	sub r0, #0x10
	strh r0, [r3, #2]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #8]
	bl sub_02008C2C
_0225B590:
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02008A78
	mov r1, #0x14
	ldrsh r1, [r4, r1]
	cmp r0, r1
	bge _0225B5A2
_0225B5A0:
	b _0225B7B4
_0225B5A2:
	ldr r0, [r4, #8]
	mov r1, #0x2c
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #8]
	mov r1, #0x2d
	mov r2, #0
	bl sub_020087A4
	mov r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_020087A4
	mov r0, #0x69
	ldr r1, [r4, #4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	str r0, [sp]
	ldrh r0, [r4, #0x16]
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	str r0, [sp, #8]
	ldrb r0, [r4, #0x13]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x18]
	str r0, [sp, #0x10]
	ldrb r1, [r4, #0x11]
	ldr r0, [r4]
	ldr r2, [r4, #0x1c]
	ldr r3, [r4, #8]
	bl ov12_02261F38
	ldr r0, [r4, #0x1c]
	cmp r0, #1
	beq _0225B5F6
	cmp r0, #3
	bne _0225B602
_0225B5F6:
	ldr r0, [r4, #0xc]
	mov r1, #0xc0
	ldr r0, [r0]
	mov r2, #0x58
	bl sub_0200DDB8
_0225B602:
	mov r2, #0
	str r2, [sp]
	ldr r0, [r4, #8]
	mov r1, #8
	add r3, r2, #0
	bl sub_020090B4
	ldrb r0, [r4, #0x12]
	add sp, #0x70
	add r0, r0, #1
	strb r0, [r4, #0x12]
	pop {r4, r5, r6, pc}
_0225B61A:
	ldr r0, [r0]
	add r1, #2
	add r2, sp, #0x14
	bl sub_0200DE44
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0225B62E
	cmp r0, #2
	bne _0225B650
_0225B62E:
	add r0, sp, #0x14
	mov r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x40
	ldr r0, [r4, #0xc]
	ble _0225B646
	ldr r0, [r0]
	sub r1, #0xa
	mov r2, #0
	bl sub_0200DED0
	b _0225B650
_0225B646:
	ldr r0, [r0]
	mov r1, #0x40
	mov r2, #0x88
	bl sub_0200DDB8
_0225B650:
	ldr r0, [r4, #0xc]
	add r1, sp, #0x14
	ldr r0, [r0]
	add r1, #2
	add r2, sp, #0x14
	bl sub_0200DE44
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _0225B674
	add r3, sp, #0x14
	mov r2, #2
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_020087A4
	b _0225B6C4
_0225B674:
	cmp r0, #2
	bne _0225B69C
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02008A78
	add r3, sp, #0x14
	mov r2, #2
	ldrsh r1, [r3, r2]
	sub r0, r1, r0
	strh r0, [r3, #2]
	ldrsh r0, [r3, r2]
	mov r1, #0
	sub r0, #0x18
	strh r0, [r3, #2]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #8]
	bl sub_02008C2C
	b _0225B6C4
_0225B69C:
	cmp r0, #4
	bne _0225B6C4
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02008A78
	add r3, sp, #0x14
	mov r2, #2
	ldrsh r1, [r3, r2]
	sub r0, r0, r1
	strh r0, [r3, #2]
	ldrsh r0, [r3, r2]
	mov r1, #0
	sub r0, #0x10
	strh r0, [r3, #2]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #8]
	neg r2, r2
	bl sub_02008C2C
_0225B6C4:
	mov r0, #0x14
	ldrsh r5, [r4, r0]
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02008A78
	cmp r0, r5
	bgt _0225B7B4
	ldr r0, [r4, #8]
	mov r1, #0
	add r2, r5, #0
	bl sub_020087A4
	mov r0, #0x69
	ldr r1, [r4, #4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	str r0, [sp]
	ldrh r0, [r4, #0x16]
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	str r0, [sp, #8]
	ldrb r0, [r4, #0x13]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x18]
	str r0, [sp, #0x10]
	ldrb r1, [r4, #0x11]
	ldr r0, [r4]
	ldr r2, [r4, #0x1c]
	ldr r3, [r4, #8]
	bl ov12_02261F38
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0225B712
	cmp r0, #2
	bne _0225B71E
_0225B712:
	ldr r0, [r4, #0xc]
	mov r1, #0x40
	ldr r0, [r0]
	mov r2, #0x88
	bl sub_0200DDB8
_0225B71E:
	ldrb r0, [r4, #0x12]
	add sp, #0x70
	add r0, r0, #1
	strb r0, [r4, #0x12]
	pop {r4, r5, r6, pc}
_0225B728:
	ldr r0, [r4]
	bl ov12_0223B750
	ldrb r1, [r4, #0x11]
	bl sub_02017068
	cmp r0, #1
	bne _0225B7B4
	ldr r0, [r4, #8]
	bl sub_020085DC
	cmp r0, #0
	bne _0225B7B4
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _0225B774
	ldrb r1, [r4, #0x11]
	mov r0, #0xb
	add r2, sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x18
	bl ov12_02261B80
	mov r0, #4
	add sp, #0x70
	strb r0, [r4, #0x12]
	pop {r4, r5, r6, pc}
_0225B774:
	mov r0, #0xff
	add sp, #0x70
	strb r0, [r4, #0x12]
	pop {r4, r5, r6, pc}
_0225B77C:
	bl ov07_0221C394
	add r0, r5, #0
	bl ov07_0221C3B0
	cmp r0, #0
	bne _0225B7B4
	add r0, r5, #0
	bl ov07_0221C3C0
	mov r0, #0xff
	add sp, #0x70
	strb r0, [r4, #0x12]
	pop {r4, r5, r6, pc}
_0225B798:
	mov r0, #0
	bl sub_02005B58
	ldrb r1, [r4, #0x11]
	ldrb r2, [r4, #0x10]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0225B7B4:
	add sp, #0x70
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0225B494

	thumb_func_start ov12_0225B7B8
ov12_0225B7B8: ; 0x0225B7B8
	push {r4, r5, r6, lr}
	sub sp, #0x70
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	ldrb r1, [r4, #0x12]
	add r5, r0, #0
	cmp r1, #4
	bls _0225B7D0
	b _0225B940
_0225B7D0:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225B7DC: ; jump table
	.short _0225B7E6 - _0225B7DC - 2 ; case 0
	.short _0225B7F0 - _0225B7DC - 2 ; case 1
	.short _0225B800 - _0225B7DC - 2 ; case 2
	.short _0225B8D0 - _0225B7DC - 2 ; case 3
	.short _0225B924 - _0225B7DC - 2 ; case 4
_0225B7E6:
	mov r0, #0x1c
	str r0, [r4, #0x20]
	ldrb r0, [r4, #0x12]
	add r0, r0, #1
	strb r0, [r4, #0x12]
_0225B7F0:
	ldr r0, [r4, #0x20]
	sub r0, r0, #1
	str r0, [r4, #0x20]
	beq _0225B7FA
	b _0225B95C
_0225B7FA:
	ldrb r0, [r4, #0x12]
	add r0, r0, #1
	strb r0, [r4, #0x12]
_0225B800:
	ldr r0, [r4, #0xc]
	add r1, sp, #0x14
	ldr r0, [r0]
	add r1, #2
	add r2, sp, #0x14
	bl sub_0200DE44
	ldr r0, [r4, #0x1c]
	cmp r0, #1
	beq _0225B818
	cmp r0, #3
	bne _0225B83A
_0225B818:
	add r1, sp, #0x14
	mov r0, #2
	ldrsh r0, [r1, r0]
	cmp r0, #0xc0
	ldr r0, [r4, #0xc]
	bge _0225B830
	ldr r0, [r0]
	mov r1, #8
	mov r2, #0
	bl sub_0200DED0
	b _0225B83A
_0225B830:
	ldr r0, [r0]
	mov r1, #0xc0
	mov r2, #0x58
	bl sub_0200DDB8
_0225B83A:
	ldr r0, [r4, #0xc]
	add r1, sp, #0x14
	ldr r0, [r0]
	add r1, #2
	add r2, sp, #0x14
	bl sub_0200DE44
	ldr r0, [r4, #8]
	mov r1, #1
	mov r2, #4
	bl sub_02008C2C
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02008A78
	mov r1, #0x14
	ldrsh r1, [r4, r1]
	cmp r0, r1
	blt _0225B95C
	ldr r0, [r4, #8]
	mov r1, #0x2c
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #8]
	mov r1, #0x2d
	mov r2, #0
	bl sub_020087A4
	mov r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_020087A4
	mov r0, #0x69
	ldr r1, [r4, #4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	str r0, [sp]
	ldrh r0, [r4, #0x16]
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x2c
	ldrb r0, [r0]
	str r0, [sp, #8]
	ldrb r0, [r4, #0x13]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x18]
	str r0, [sp, #0x10]
	ldrb r1, [r4, #0x11]
	ldr r0, [r4]
	ldr r2, [r4, #0x1c]
	ldr r3, [r4, #8]
	bl ov12_02261F38
	ldr r0, [r4, #0xc]
	mov r1, #0xc0
	ldr r0, [r0]
	mov r2, #0x58
	bl sub_0200DDB8
	mov r2, #0
	str r2, [sp]
	ldr r0, [r4, #8]
	mov r1, #8
	add r3, r2, #0
	bl sub_020090B4
	ldrb r0, [r4, #0x12]
	add sp, #0x70
	add r0, r0, #1
	strb r0, [r4, #0x12]
	pop {r4, r5, r6, pc}
_0225B8D0:
	ldr r0, [r4]
	bl ov12_0223B750
	ldrb r1, [r4, #0x11]
	bl sub_02017068
	cmp r0, #1
	bne _0225B95C
	ldr r0, [r4, #8]
	bl sub_020085DC
	cmp r0, #0
	bne _0225B95C
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _0225B91C
	ldrb r1, [r4, #0x11]
	mov r0, #0xb
	add r2, sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x18
	bl ov12_02261B80
	mov r0, #4
	add sp, #0x70
	strb r0, [r4, #0x12]
	pop {r4, r5, r6, pc}
_0225B91C:
	mov r0, #0xff
	add sp, #0x70
	strb r0, [r4, #0x12]
	pop {r4, r5, r6, pc}
_0225B924:
	bl ov07_0221C394
	add r0, r5, #0
	bl ov07_0221C3B0
	cmp r0, #0
	bne _0225B95C
	add r0, r5, #0
	bl ov07_0221C3C0
	mov r0, #0xff
	add sp, #0x70
	strb r0, [r4, #0x12]
	pop {r4, r5, r6, pc}
_0225B940:
	mov r0, #0
	bl sub_02005B58
	ldrb r1, [r4, #0x11]
	ldrb r2, [r4, #0x10]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0225B95C:
	add sp, #0x70
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0225B7B8

	thumb_func_start ov12_0225B960
ov12_0225B960: ; 0x0225B960
	push {r3, r4, r5, lr}
	sub sp, #0xb0
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	cmp r0, #7
	bls _0225B974
	b _0225BDFC
_0225B974:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225B980: ; jump table
	.short _0225B990 - _0225B980 - 2 ; case 0
	.short _0225BA16 - _0225B980 - 2 ; case 1
	.short _0225BA5A - _0225B980 - 2 ; case 2
	.short _0225BBC0 - _0225B980 - 2 ; case 3
	.short _0225BBDC - _0225B980 - 2 ; case 4
	.short _0225BD3C - _0225B980 - 2 ; case 5
	.short _0225BD50 - _0225B980 - 2 ; case 6
	.short _0225BDD6 - _0225B980 - 2 ; case 7
_0225B990:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x96
	strb r1, [r0]
	str r1, [r4, #0x10]
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #8
	tst r0, r1
	ldr r0, [r4]
	beq _0225B9C8
	bl ov12_0223B514
	mov r1, #0x20
	tst r0, r1
	bne _0225BA06
	add r0, r4, #0
	add r0, #0x82
	ldrb r0, [r0]
	cmp r0, #2
	bne _0225BA06
	ldr r0, [r4]
	mov r1, #5
	bl ov07_0221FDFC
	str r0, [r4, #0x10]
	b _0225BA06
_0225B9C8:
	bl ov12_0223B514
	mov r1, #0x20
	tst r0, r1
	bne _0225BA06
	ldr r0, [r4]
	bl ov12_0223B688
	cmp r0, #1
	bne _0225B9F2
	add r0, r4, #0
	add r0, #0x82
	ldrb r0, [r0]
	cmp r0, #2
	bne _0225B9F2
	ldr r0, [r4]
	mov r1, #5
	bl ov07_0221FDFC
	str r0, [r4, #0x10]
	b _0225BA06
_0225B9F2:
	add r0, r4, #0
	add r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225BA06
	ldr r0, [r4]
	mov r1, #5
	bl ov07_0221FDFC
	str r0, [r4, #0x10]
_0225BA06:
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0xb0
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225BA16:
	add r1, sp, #0x4c
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r4, #0
	add r0, #0x82
	ldrb r0, [r0]
	add r1, r4, #0
	add r2, r4, #0
	str r0, [sp, #0x4c]
	add r1, #0x81
	add r2, #0x8c
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_0223A880
	str r0, [sp, #0x54]
	mov r0, #5
	add r1, sp, #0x4c
	bl ov07_02232694
	str r0, [r4, #8]
	bl ov07_022329B0
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0xb0
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225BA5A:
	ldr r0, [r4, #4]
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_02233F20
	cmp r0, #0
	bne _0225BAA2
	ldr r0, [r4, #8]
	bl ov07_02232A04
	cmp r0, #1
	bne _0225BAA2
	ldr r0, [r4, #4]
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_02233EA0
	cmp r0, #1
	bne _0225BAA2
	add r0, r4, #0
	add r0, #0x82
	ldrb r0, [r0]
	cmp r0, #4
	bne _0225BAAC
	add r0, r4, #0
	add r0, #0x96
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x96
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x96
	ldrb r0, [r0]
	cmp r0, #0xc
	bhs _0225BAA4
_0225BAA2:
	b _0225BE20
_0225BAA4:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x96
	strb r1, [r0]
_0225BAAC:
	ldr r0, [r4]
	bl ov12_0223A8D4
	add r2, r4, #0
	add r3, r4, #0
	add r5, r0, #0
	mov r0, #0x69
	add r2, #0x86
	add r3, #0x82
	ldr r1, [r4, #4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldrh r2, [r2]
	ldrb r3, [r3]
	add r1, sp, #0x24
	bl sub_02072914
	add r0, r4, #0
	add r0, #0x82
	ldrb r3, [r0]
	mov r0, #6
	add r2, r4, #0
	add r1, r3, #0
	mul r1, r0
	ldr r0, _0225BE24 ; =ov07_022377F4 + 2
	add r2, #0x14
	ldrsh r0, [r0, r1]
	str r0, [sp]
	ldr r0, _0225BE28 ; =ov07_022377F4 + 4
	ldrsh r0, [r0, r1]
	add r1, r5, #0
	lsl r5, r3, #2
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x85
	ldrb r0, [r0]
	ldr r3, _0225BE2C ; =ov07_022377DC
	str r0, [sp, #8]
	mov r0, #0x90
	ldrsb r0, [r4, r0]
	ldrsh r3, [r3, r5]
	str r0, [sp, #0xc]
	mov r0, #0x91
	ldrsb r0, [r4, r0]
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0x93
	ldrb r0, [r0]
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r0, #0x81
	ldrb r0, [r0]
	str r0, [sp, #0x18]
	add r0, sp, #0x24
	str r0, [sp, #0x1c]
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, [r4]
	bl ov12_022612A4
	ldr r1, [r4, #4]
	mov r2, #0
	str r0, [r1, #0x20]
	ldr r0, [r4, #4]
	mov r1, #0xc
	ldr r0, [r0, #0x20]
	bl sub_020087A4
	ldr r0, [r4, #4]
	mov r1, #0xd
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #4]
	mov r1, #0x2c
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #4]
	mov r1, #6
	ldr r0, [r0, #0x20]
	mov r2, #1
	bl sub_020087A4
	add r0, r4, #0
	add r0, #0x8e
	ldrh r0, [r0]
	mov r3, #0
	lsl r1, r0, #1
	ldr r0, _0225BE30 ; =ov12_0226D15A
	ldrh r0, [r0, r1]
	mov r1, #0x10
	add r2, r1, #0
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x20]
	bl sub_020090B4
	ldr r0, [r4, #4]
	mov r1, #6
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #8]
	bl ov07_02232A44
	add r0, r4, #0
	add r0, #0x84
	ldrb r0, [r0]
	cmp r0, #2
	ldr r0, _0225BE34 ; =0x00000706
	bne _0225BB9A
	mov r1, #0x75
	bl sub_0200602C
	b _0225BBA2
_0225BB9A:
	mov r1, #0x74
	mvn r1, r1
	bl sub_0200602C
_0225BBA2:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _0225BBB0
	bl ov07_0221FE08
	mov r0, #0
	str r0, [r4, #0x10]
_0225BBB0:
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0xb0
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225BBC0:
	ldr r0, [r4, #4]
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_02233E88
	cmp r0, #1
	beq _0225BBDC
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x83
	strb r1, [r0]
_0225BBDC:
	ldr r0, [r4, #4]
	mov r1, #0xc
	ldr r0, [r0, #0x20]
	bl sub_02008A78
	mov r1, #1
	lsl r1, r1, #8
	cmp r0, r1
	bne _0225BC72
	ldr r0, [r4, #8]
	bl ov07_02232A54
	cmp r0, #0
	bne _0225BC72
	add r0, r4, #0
	add r0, #0x84
	ldrb r0, [r0]
	cmp r0, #2
	bne _0225BC0E
	ldr r0, [r4, #4]
	mov r1, #0x2d
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
_0225BC0E:
	mov r0, #0x69
	ldr r3, [r4, #4]
	lsl r0, r0, #2
	ldr r0, [r3, r0]
	add r1, r4, #0
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x86
	ldrh r0, [r0]
	add r2, r4, #0
	add r1, #0x81
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x97
	ldrb r0, [r0]
	add r2, #0x82
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x84
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	str r0, [sp, #0x10]
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	ldr r3, [r3, #0x20]
	bl ov12_02261F38
	add r0, r4, #0
	add r0, #0x8e
	ldrh r0, [r0]
	mov r2, #0
	add r3, r2, #0
	lsl r1, r0, #1
	ldr r0, _0225BE30 ; =ov12_0226D15A
	ldrh r0, [r0, r1]
	mov r1, #0x10
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x20]
	bl sub_020090B4
	mov r0, #5
	add r4, #0x83
	add sp, #0xb0
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225BC72:
	ldr r0, [r4, #4]
	mov r1, #0xc
	ldr r0, [r0, #0x20]
	bl sub_02008A78
	mov r2, #1
	lsl r2, r2, #8
	cmp r0, r2
	ldr r0, [r4, #4]
	blt _0225BD16
	ldr r0, [r0, #0x20]
	mov r1, #0xc
	bl sub_020087A4
	ldr r0, [r4, #4]
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r0, #0x20]
	add r2, #0xf3
	bl sub_020087A4
	add r0, r4, #0
	add r0, #0x84
	ldrb r0, [r0]
	cmp r0, #2
	bne _0225BCB2
	ldr r0, [r4, #4]
	mov r1, #0x2d
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
_0225BCB2:
	mov r0, #0x69
	ldr r3, [r4, #4]
	lsl r0, r0, #2
	ldr r0, [r3, r0]
	add r1, r4, #0
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x86
	ldrh r0, [r0]
	add r2, r4, #0
	add r1, #0x81
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x97
	ldrb r0, [r0]
	add r2, #0x82
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x84
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	str r0, [sp, #0x10]
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	ldr r3, [r3, #0x20]
	bl ov12_02261F38
	add r0, r4, #0
	add r0, #0x8e
	ldrh r0, [r0]
	mov r2, #0
	mov r3, #1
	lsl r1, r0, #1
	ldr r0, _0225BE30 ; =ov12_0226D15A
	ldrh r0, [r0, r1]
	mov r1, #0x10
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x20]
	bl sub_020090B4
	mov r0, #5
	add r4, #0x83
	add sp, #0xb0
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225BD16:
	ldr r0, [r0, #0x20]
	mov r1, #0xc
	mov r2, #0x20
	bl sub_02008C2C
	ldr r0, [r4, #4]
	mov r1, #0xd
	ldr r0, [r0, #0x20]
	mov r2, #0x20
	bl sub_02008C2C
	ldr r0, [r4, #4]
	mov r1, #0x90
	ldrsb r1, [r4, r1]
	ldr r0, [r0, #0x20]
	bl sub_0200914C
	add sp, #0xb0
	pop {r3, r4, r5, pc}
_0225BD3C:
	ldr r0, [r4, #8]
	bl ov07_02232A54
	cmp r0, #0
	bne _0225BE20
	mov r0, #6
	add r4, #0x83
	add sp, #0xb0
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225BD50:
	ldr r0, [r4]
	bl ov12_0223B750
	add r1, r4, #0
	add r1, #0x81
	ldrb r1, [r1]
	bl sub_02017068
	cmp r0, #1
	bne _0225BE20
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x20]
	bl sub_020085DC
	cmp r0, #0
	bne _0225BE20
	ldr r0, [r4, #4]
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_02233ECC
	ldr r0, [r4, #4]
	mov r1, #0
	add r0, #0x88
	str r1, [r0]
	ldr r0, [r4, #8]
	bl ov07_02232AB8
	add r0, r4, #0
	add r0, #0x92
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225BDCC
	mov r0, #5
	bl ov07_0221BEDC
	str r0, [r4, #0x24]
	add r0, r4, #0
	add r0, #0x81
	ldrb r1, [r0]
	mov r0, #0xb
	add r2, sp, #0x58
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x24]
	add r3, sp, #0x58
	bl ov12_02261B80
	mov r0, #7
	add r4, #0x83
	add sp, #0xb0
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225BDCC:
	mov r0, #0xff
	add r4, #0x83
	add sp, #0xb0
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225BDD6:
	ldr r0, [r4, #0x24]
	bl ov07_0221C394
	ldr r0, [r4, #0x24]
	bl ov07_0221C3B0
	cmp r0, #0
	bne _0225BE20
	ldr r0, [r4, #0x24]
	bl ov07_0221C3C0
	ldr r0, [r4, #0x24]
	bl ov07_0221BFE0
	mov r0, #0xff
	add r4, #0x83
	add sp, #0xb0
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225BDFC:
	mov r0, #0
	bl sub_02005B58
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0x81
	add r2, #0x80
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_0225BE20:
	add sp, #0xb0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225BE24: .word ov07_022377F4 + 2
_0225BE28: .word ov07_022377F4 + 4
_0225BE2C: .word ov07_022377DC
_0225BE30: .word ov12_0226D15A
_0225BE34: .word 0x00000706
	thumb_func_end ov12_0225B960

	thumb_func_start ov12_0225BE38
ov12_0225BE38: ; 0x0225BE38
	push {r4, r5, lr}
	sub sp, #0xfc
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	cmp r0, #6
	bls _0225BE4C
	b _0225C156
_0225BE4C:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225BE58: ; jump table
	.short _0225BE66 - _0225BE58 - 2 ; case 0
	.short _0225BEEC - _0225BE58 - 2 ; case 1
	.short _0225BFE4 - _0225BE58 - 2 ; case 2
	.short _0225C024 - _0225BE58 - 2 ; case 3
	.short _0225C052 - _0225BE58 - 2 ; case 4
	.short _0225C0B0 - _0225BE58 - 2 ; case 5
	.short _0225C130 - _0225BE58 - 2 ; case 6
_0225BE66:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x96
	strb r1, [r0]
	str r1, [r4, #0x10]
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #8
	tst r0, r1
	ldr r0, [r4]
	beq _0225BE9E
	bl ov12_0223B514
	mov r1, #0x20
	tst r0, r1
	bne _0225BEDC
	add r0, r4, #0
	add r0, #0x82
	ldrb r0, [r0]
	cmp r0, #2
	bne _0225BEDC
	ldr r0, [r4]
	mov r1, #5
	bl ov07_0221FDFC
	str r0, [r4, #0x10]
	b _0225BEDC
_0225BE9E:
	bl ov12_0223B514
	mov r1, #0x20
	tst r0, r1
	bne _0225BEDC
	ldr r0, [r4]
	bl ov12_0223B688
	cmp r0, #1
	bne _0225BEC8
	add r0, r4, #0
	add r0, #0x82
	ldrb r0, [r0]
	cmp r0, #2
	bne _0225BEC8
	ldr r0, [r4]
	mov r1, #5
	bl ov07_0221FDFC
	str r0, [r4, #0x10]
	b _0225BEDC
_0225BEC8:
	add r0, r4, #0
	add r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225BEDC
	ldr r0, [r4]
	mov r1, #5
	bl ov07_0221FDFC
	str r0, [r4, #0x10]
_0225BEDC:
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0xfc
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, pc}
_0225BEEC:
	add r0, r4, #0
	add r0, #0x82
	ldrb r0, [r0]
	cmp r0, #4
	bne _0225BF18
	add r0, r4, #0
	add r0, #0x96
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x96
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x96
	ldrb r0, [r0]
	cmp r0, #0xc
	bhs _0225BF10
	b _0225C17A
_0225BF10:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x96
	strb r1, [r0]
_0225BF18:
	ldr r0, [r4]
	bl ov12_0223A8D4
	add r2, r4, #0
	add r3, r4, #0
	add r5, r0, #0
	mov r0, #0x69
	add r2, #0x86
	add r3, #0x82
	ldr r1, [r4, #4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldrh r2, [r2]
	ldrb r3, [r3]
	add r1, sp, #0x24
	bl sub_02072914
	add r0, r4, #0
	add r0, #0x82
	ldrb r1, [r0]
	mov r0, #6
	add r2, r4, #0
	add r3, r1, #0
	mul r3, r0
	ldr r0, _0225C180 ; =ov07_022377F4 + 38
	add r1, r5, #0
	ldrsh r0, [r0, r3]
	ldr r5, _0225C184 ; =ov07_022377F4 + 36
	add r2, #0x14
	str r0, [sp]
	ldr r0, _0225C188 ; =ov07_022377F4 + 4
	ldrsh r0, [r0, r3]
	ldrsh r3, [r5, r3]
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x85
	ldrb r0, [r0]
	str r0, [sp, #8]
	mov r0, #0x90
	ldrsb r0, [r4, r0]
	str r0, [sp, #0xc]
	mov r0, #0x91
	ldrsb r0, [r4, r0]
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0x93
	ldrb r0, [r0]
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r0, #0x81
	ldrb r0, [r0]
	str r0, [sp, #0x18]
	add r0, sp, #0x24
	str r0, [sp, #0x1c]
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, [r4]
	bl ov12_022612A4
	ldr r1, [r4, #4]
	str r0, [r1, #0x20]
	ldr r0, [r4, #4]
	mov r1, #0xc
	add r2, r1, #0
	ldr r0, [r0, #0x20]
	add r2, #0xf4
	bl sub_020087A4
	ldr r0, [r4, #4]
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r0, #0x20]
	add r2, #0xf3
	bl sub_020087A4
	ldr r0, [r4, #4]
	mov r1, #0x2c
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #4]
	mov r1, #6
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _0225BFD4
	bl ov07_0221FE08
	mov r0, #0
	str r0, [r4, #0x10]
_0225BFD4:
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0xfc
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, pc}
_0225BFE4:
	mov r0, #5
	bl ov07_0221BEDC
	str r0, [r4, #0x24]
	add r0, r4, #0
	add r0, #0x81
	ldrb r1, [r0]
	mov r0, #0x29
	add r2, sp, #0xa4
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x24]
	add r3, sp, #0xa4
	bl ov12_02261B80
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0xfc
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, pc}
_0225C024:
	ldr r0, [r4, #0x24]
	bl ov07_0221C394
	ldr r0, [r4, #0x24]
	bl ov07_0221C3B0
	cmp r0, #0
	beq _0225C036
	b _0225C17A
_0225C036:
	ldr r0, [r4, #0x24]
	bl ov07_0221C3C0
	ldr r0, [r4, #0x24]
	bl ov07_0221BFE0
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0xfc
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, pc}
_0225C052:
	add r0, r4, #0
	add r0, #0x84
	ldrb r0, [r0]
	cmp r0, #2
	bne _0225C068
	ldr r0, [r4, #4]
	mov r1, #0x2d
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
_0225C068:
	mov r0, #0x69
	ldr r3, [r4, #4]
	lsl r0, r0, #2
	ldr r0, [r3, r0]
	add r1, r4, #0
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x86
	ldrh r0, [r0]
	add r2, r4, #0
	add r1, #0x81
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x97
	ldrb r0, [r0]
	add r2, #0x82
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x84
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	str r0, [sp, #0x10]
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	ldr r3, [r3, #0x20]
	bl ov12_02261F38
	mov r0, #5
	add r4, #0x83
	add sp, #0xfc
	strb r0, [r4]
	pop {r4, r5, pc}
_0225C0B0:
	ldr r0, [r4]
	bl ov12_0223B750
	add r1, r4, #0
	add r1, #0x81
	ldrb r1, [r1]
	bl sub_02017068
	cmp r0, #1
	bne _0225C17A
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x20]
	bl sub_020085DC
	cmp r0, #0
	bne _0225C17A
	ldr r0, [r4, #4]
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_02233ECC
	ldr r0, [r4, #4]
	mov r1, #0
	add r0, #0x88
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x92
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225C126
	mov r0, #5
	bl ov07_0221BEDC
	str r0, [r4, #0x24]
	add r0, r4, #0
	add r0, #0x81
	ldrb r1, [r0]
	mov r0, #0xb
	add r2, sp, #0x4c
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x24]
	add r3, sp, #0x4c
	bl ov12_02261B80
	mov r0, #6
	add r4, #0x83
	add sp, #0xfc
	strb r0, [r4]
	pop {r4, r5, pc}
_0225C126:
	mov r0, #0xff
	add r4, #0x83
	add sp, #0xfc
	strb r0, [r4]
	pop {r4, r5, pc}
_0225C130:
	ldr r0, [r4, #0x24]
	bl ov07_0221C394
	ldr r0, [r4, #0x24]
	bl ov07_0221C3B0
	cmp r0, #0
	bne _0225C17A
	ldr r0, [r4, #0x24]
	bl ov07_0221C3C0
	ldr r0, [r4, #0x24]
	bl ov07_0221BFE0
	mov r0, #0xff
	add r4, #0x83
	add sp, #0xfc
	strb r0, [r4]
	pop {r4, r5, pc}
_0225C156:
	mov r0, #0
	bl sub_02005B58
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0x81
	add r2, #0x80
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_0225C17A:
	add sp, #0xfc
	pop {r4, r5, pc}
	nop
_0225C180: .word ov07_022377F4 + 38
_0225C184: .word ov07_022377F4 + 36
_0225C188: .word ov07_022377F4 + 4
	thumb_func_end ov12_0225BE38

	thumb_func_start ov12_0225C18C
ov12_0225C18C: ; 0x0225C18C
	push {r4, r5, r6, lr}
	sub sp, #0x1d8
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	add r1, r4, #0
	add r1, #0x83
	ldrb r1, [r1]
	add r5, r0, #0
	cmp r1, #0xb
	bls _0225C1A8
	b _0225C6A6
_0225C1A8:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225C1B4: ; jump table
	.short _0225C1CC - _0225C1B4 - 2 ; case 0
	.short _0225C2E6 - _0225C1B4 - 2 ; case 1
	.short _0225C332 - _0225C1B4 - 2 ; case 2
	.short _0225C3C0 - _0225C1B4 - 2 ; case 3
	.short _0225C3D8 - _0225C1B4 - 2 ; case 4
	.short _0225C552 - _0225C1B4 - 2 ; case 5
	.short _0225C566 - _0225C1B4 - 2 ; case 6
	.short _0225C5DA - _0225C1B4 - 2 ; case 7
	.short _0225C5FE - _0225C1B4 - 2 ; case 8
	.short _0225C5DA - _0225C1B4 - 2 ; case 9
	.short _0225C64A - _0225C1B4 - 2 ; case 10
	.short _0225C5DA - _0225C1B4 - 2 ; case 11
_0225C1CC:
	add r0, r4, #0
	add r0, #0x82
	ldrb r1, [r0]
	ldr r0, _0225C4FC ; =ov12_0226D120
	ldrb r0, [r0, r1]
	str r0, [sp, #0x58]
	mov r0, #5
	str r0, [sp, #0x5c]
	add r0, r4, #0
	add r0, #0x81
	ldrb r0, [r0]
	str r0, [sp, #0x64]
	add r0, r4, #0
	add r0, #0x8e
	ldrh r0, [r0]
	str r0, [sp, #0x68]
	ldr r0, [r4]
	bl ov12_0223A8E4
	str r0, [sp, #0x74]
	ldr r0, [r4]
	bl ov12_0223A938
	str r0, [sp, #0x78]
	mov r2, #1
	mov r1, #0
	add r0, r4, #0
	str r2, [sp, #0x6c]
	str r1, [sp, #0x70]
	add r0, #0x94
	ldrh r0, [r0]
	cmp r0, #1
	bne _0225C212
	str r2, [sp, #0x60]
	b _0225C214
_0225C212:
	str r1, [sp, #0x60]
_0225C214:
	add r0, sp, #0x58
	bl ov07_02233DB8
	str r0, [r4, #0xc]
	ldr r0, [r4]
	bl ov12_0223A8D4
	add r2, r4, #0
	add r3, r4, #0
	add r5, r0, #0
	mov r0, #0x69
	add r2, #0x86
	add r3, #0x82
	ldr r1, [r4, #4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldrh r2, [r2]
	ldrb r3, [r3]
	add r1, sp, #0x30
	bl sub_02072914
	add r0, r4, #0
	add r0, #0x82
	ldrb r3, [r0]
	mov r0, #6
	add r2, r4, #0
	add r1, r3, #0
	mul r1, r0
	ldr r0, _0225C500 ; =ov07_022377F4 + 2
	add r2, #0x14
	ldrsh r0, [r0, r1]
	str r0, [sp]
	ldr r0, _0225C504 ; =ov07_022377F4 + 4
	ldrsh r0, [r0, r1]
	add r1, r5, #0
	lsl r5, r3, #2
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x85
	ldrb r0, [r0]
	ldr r3, _0225C508 ; =ov07_022377DC
	str r0, [sp, #8]
	mov r0, #0x90
	ldrsb r0, [r4, r0]
	ldrsh r3, [r3, r5]
	str r0, [sp, #0xc]
	mov r0, #0x91
	ldrsb r0, [r4, r0]
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0x93
	ldrb r0, [r0]
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r0, #0x81
	ldrb r0, [r0]
	str r0, [sp, #0x18]
	add r0, sp, #0x30
	str r0, [sp, #0x1c]
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, [r4]
	bl ov12_022612A4
	ldr r1, [r4, #4]
	mov r2, #0
	str r0, [r1, #0x20]
	ldr r0, [r4, #4]
	mov r1, #0xc
	ldr r0, [r0, #0x20]
	bl sub_020087A4
	ldr r0, [r4, #4]
	mov r1, #0xd
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #4]
	mov r1, #0x2c
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #4]
	mov r1, #6
	ldr r0, [r0, #0x20]
	mov r2, #1
	bl sub_020087A4
	mov r0, #0
	str r0, [r4, #0x10]
	ldr r0, [r4]
	mov r1, #5
	bl ov07_0221FDFC
	str r0, [r4, #0x10]
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0x1d8
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225C2E6:
	add r1, sp, #0x24
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r4, #0
	add r0, #0x82
	ldrb r0, [r0]
	add r1, r4, #0
	add r2, r4, #0
	str r0, [sp, #0x24]
	add r1, #0x81
	add r2, #0x8c
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_0223A880
	str r0, [sp, #0x2c]
	add r0, r4, #0
	add r0, #0x8e
	ldrh r0, [r0]
	add r1, sp, #0x24
	str r0, [sp, #0x28]
	mov r0, #5
	bl ov07_02232694
	str r0, [r4, #8]
	bl ov07_022329B0
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0x1d8
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225C332:
	ldr r0, [r4, #0xc]
	bl ov07_02233F20
	cmp r0, #0
	beq _0225C346
	add r0, r4, #0
	add r0, #0x94
	ldrh r0, [r0]
	cmp r0, #0
	beq _0225C35A
_0225C346:
	ldr r0, [r4, #8]
	bl ov07_02232A04
	cmp r0, #1
	bne _0225C35A
	ldr r0, [r4, #0xc]
	bl ov07_02233EA0
	cmp r0, #1
	beq _0225C35C
_0225C35A:
	b _0225C6C4
_0225C35C:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _0225C366
	bl ov07_0221FE08
_0225C366:
	add r0, r4, #0
	add r0, #0x8e
	ldrh r0, [r0]
	mov r3, #0
	lsl r1, r0, #1
	ldr r0, _0225C50C ; =ov12_0226D15A
	ldrh r0, [r0, r1]
	mov r1, #0x10
	add r2, r1, #0
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x20]
	bl sub_020090B4
	ldr r0, [r4, #4]
	mov r1, #6
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #8]
	bl ov07_02232A44
	add r0, r4, #0
	add r0, #0x84
	ldrb r0, [r0]
	cmp r0, #2
	ldr r0, _0225C510 ; =0x00000706
	bne _0225C3A8
	mov r1, #0x75
	bl sub_0200602C
	b _0225C3B0
_0225C3A8:
	mov r1, #0x74
	mvn r1, r1
	bl sub_0200602C
_0225C3B0:
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0x1d8
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225C3C0:
	ldr r0, [r4, #0xc]
	bl ov07_02233E88
	cmp r0, #1
	beq _0225C3D8
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x83
	strb r1, [r0]
_0225C3D8:
	ldr r0, [r4, #4]
	mov r1, #0xc
	ldr r0, [r0, #0x20]
	bl sub_02008A78
	mov r1, #1
	lsl r1, r1, #8
	cmp r0, r1
	bne _0225C46E
	ldr r0, [r4, #8]
	bl ov07_02232A54
	cmp r0, #0
	bne _0225C46E
	add r0, r4, #0
	add r0, #0x84
	ldrb r0, [r0]
	cmp r0, #2
	bne _0225C40A
	ldr r0, [r4, #4]
	mov r1, #0x2d
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
_0225C40A:
	mov r0, #0x69
	ldr r3, [r4, #4]
	lsl r0, r0, #2
	ldr r0, [r3, r0]
	add r1, r4, #0
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x86
	ldrh r0, [r0]
	add r2, r4, #0
	add r1, #0x81
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x97
	ldrb r0, [r0]
	add r2, #0x82
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x84
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	str r0, [sp, #0x10]
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	ldr r3, [r3, #0x20]
	bl ov12_02261F38
	add r0, r4, #0
	add r0, #0x8e
	ldrh r0, [r0]
	mov r2, #0
	add r3, r2, #0
	lsl r1, r0, #1
	ldr r0, _0225C50C ; =ov12_0226D15A
	ldrh r0, [r0, r1]
	mov r1, #0x10
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x20]
	bl sub_020090B4
	mov r0, #5
	add r4, #0x83
	add sp, #0x1d8
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225C46E:
	ldr r0, [r4, #4]
	mov r1, #0xc
	ldr r0, [r0, #0x20]
	bl sub_02008A78
	mov r2, #1
	lsl r2, r2, #8
	cmp r0, r2
	ldr r0, [r4, #4]
	blt _0225C52C
	ldr r0, [r0, #0x20]
	mov r1, #0xc
	bl sub_020087A4
	ldr r0, [r4, #4]
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r0, #0x20]
	add r2, #0xf3
	bl sub_020087A4
	add r0, r4, #0
	add r0, #0x84
	ldrb r0, [r0]
	cmp r0, #2
	bne _0225C4AE
	ldr r0, [r4, #4]
	mov r1, #0x2d
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
_0225C4AE:
	mov r0, #0x69
	ldr r3, [r4, #4]
	lsl r0, r0, #2
	ldr r0, [r3, r0]
	add r1, r4, #0
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x86
	ldrh r0, [r0]
	add r2, r4, #0
	add r1, #0x81
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x97
	ldrb r0, [r0]
	add r2, #0x82
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x84
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	str r0, [sp, #0x10]
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	ldr r3, [r3, #0x20]
	bl ov12_02261F38
	add r0, r4, #0
	add r0, #0x8e
	ldrh r0, [r0]
	mov r2, #0
	mov r3, #1
	lsl r1, r0, #1
	ldr r0, _0225C50C ; =ov12_0226D15A
	b _0225C514
	.balign 4, 0
_0225C4FC: .word ov12_0226D120
_0225C500: .word ov07_022377F4 + 2
_0225C504: .word ov07_022377F4 + 4
_0225C508: .word ov07_022377DC
_0225C50C: .word ov12_0226D15A
_0225C510: .word 0x00000706
_0225C514:
	ldrh r0, [r0, r1]
	mov r1, #0x10
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x20]
	bl sub_020090B4
	mov r0, #5
	add r4, #0x83
	add sp, #0x1d8
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225C52C:
	ldr r0, [r0, #0x20]
	mov r1, #0xc
	mov r2, #0x20
	bl sub_02008C2C
	ldr r0, [r4, #4]
	mov r1, #0xd
	ldr r0, [r0, #0x20]
	mov r2, #0x20
	bl sub_02008C2C
	ldr r0, [r4, #4]
	mov r1, #0x90
	ldrsb r1, [r4, r1]
	ldr r0, [r0, #0x20]
	bl sub_0200914C
	add sp, #0x1d8
	pop {r4, r5, r6, pc}
_0225C552:
	ldr r0, [r4, #8]
	bl ov07_02232A54
	cmp r0, #0
	bne _0225C586
	mov r0, #6
	add r4, #0x83
	add sp, #0x1d8
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225C566:
	ldr r0, [r4]
	bl ov12_0223B750
	add r1, r4, #0
	add r1, #0x81
	ldrb r1, [r1]
	bl sub_02017068
	cmp r0, #1
	bne _0225C586
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x20]
	bl sub_020085DC
	cmp r0, #0
	beq _0225C588
_0225C586:
	b _0225C6C4
_0225C588:
	ldr r0, [r4, #0xc]
	bl ov07_02233ECC
	ldr r0, [r4, #8]
	bl ov07_02232AB8
	add r0, r4, #0
	add r0, #0x92
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225C5D0
	add r0, r4, #0
	add r0, #0x81
	ldrb r1, [r0]
	mov r0, #0xb
	add r2, sp, #0x180
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x180
	bl ov12_02261B80
	mov r0, #7
	add r4, #0x83
	add sp, #0x1d8
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225C5D0:
	mov r0, #8
	add r4, #0x83
	add sp, #0x1d8
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225C5DA:
	bl ov07_0221C394
	add r0, r5, #0
	bl ov07_0221C3B0
	cmp r0, #0
	bne _0225C6C4
	add r0, r5, #0
	bl ov07_0221C3C0
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0x1d8
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225C5FE:
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	cmp r0, #0
	beq _0225C640
	add r0, r4, #0
	add r0, #0x81
	ldrb r1, [r0]
	mov r0, #0xf
	add r2, sp, #0x128
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x128
	bl ov12_02261B80
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0x1d8
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225C640:
	mov r0, #0xff
	add r4, #0x83
	add sp, #0x1d8
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225C64A:
	add r3, r4, #0
	add r3, #0x81
	ldrb r3, [r3]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x28
	add r2, sp, #0xd8
	bl ov12_02261CA8
	add r0, sp, #0xd8
	mov r1, #5
	bl ov07_02234A20
	add r0, r4, #0
	add r0, #0x81
	ldrb r1, [r0]
	mov r0, #0x10
	add r2, sp, #0x80
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x80
	bl ov12_02261B80
	mov r0, #0x1a
	ldr r1, [r4, #4]
	mov r2, #1
	lsl r0, r0, #4
	str r2, [r1, r0]
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0x1d8
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225C6A6:
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0x81
	add r2, #0x80
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0225C6C4:
	add sp, #0x1d8
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0225C18C

	thumb_func_start ov12_0225C6C8
ov12_0225C6C8: ; 0x0225C6C8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1fc
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	add r1, r4, #0
	add r1, #0x83
	ldrb r1, [r1]
	add r5, r0, #0
	cmp r1, #9
	bls _0225C6E4
	b _0225C98C
_0225C6E4:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225C6F0: ; jump table
	.short _0225C704 - _0225C6F0 - 2 ; case 0
	.short _0225C7C2 - _0225C6F0 - 2 ; case 1
	.short _0225C8C0 - _0225C6F0 - 2 ; case 2
	.short _0225C7FA - _0225C6F0 - 2 ; case 3
	.short _0225C858 - _0225C6F0 - 2 ; case 4
	.short _0225C8C0 - _0225C6F0 - 2 ; case 5
	.short _0225C8E4 - _0225C6F0 - 2 ; case 6
	.short _0225C8C0 - _0225C6F0 - 2 ; case 7
	.short _0225C930 - _0225C6F0 - 2 ; case 8
	.short _0225C8C0 - _0225C6F0 - 2 ; case 9
_0225C704:
	ldr r0, [r4]
	bl ov12_0223A8D4
	add r2, r4, #0
	add r3, r4, #0
	add r5, r0, #0
	mov r0, #0x69
	add r2, #0x86
	add r3, #0x82
	ldr r1, [r4, #4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldrh r2, [r2]
	ldrb r3, [r3]
	add r1, sp, #0x24
	bl sub_02072914
	add r0, r4, #0
	add r0, #0x82
	ldrb r1, [r0]
	mov r0, #6
	add r2, r4, #0
	add r3, r1, #0
	mul r3, r0
	ldr r0, _0225C9B0 ; =ov07_022377F4 + 38
	add r1, r5, #0
	ldrsh r0, [r0, r3]
	ldr r5, _0225C9B4 ; =ov07_022377F4 + 36
	add r2, #0x14
	str r0, [sp]
	ldr r0, _0225C9B8 ; =ov07_022377F4 + 4
	ldrsh r0, [r0, r3]
	ldrsh r3, [r5, r3]
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x85
	ldrb r0, [r0]
	str r0, [sp, #8]
	mov r0, #0x90
	ldrsb r0, [r4, r0]
	str r0, [sp, #0xc]
	mov r0, #0x91
	ldrsb r0, [r4, r0]
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0x93
	ldrb r0, [r0]
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r0, #0x81
	ldrb r0, [r0]
	str r0, [sp, #0x18]
	add r0, sp, #0x24
	str r0, [sp, #0x1c]
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, [r4]
	bl ov12_022612A4
	ldr r1, [r4, #4]
	str r0, [r1, #0x20]
	ldr r0, [r4, #4]
	mov r1, #0xc
	add r2, r1, #0
	ldr r0, [r0, #0x20]
	add r2, #0xf4
	bl sub_020087A4
	ldr r0, [r4, #4]
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r0, #0x20]
	add r2, #0xf3
	bl sub_020087A4
	ldr r0, [r4, #4]
	mov r1, #0x2c
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #4]
	mov r1, #6
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0x1fc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225C7C2:
	add r0, r4, #0
	add r0, #0x81
	ldrb r1, [r0]
	mov r0, #0x29
	add r2, sp, #0x1a4
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x1a4
	bl ov12_02261B80
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0x1fc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225C7FA:
	add r0, r4, #0
	add r0, #0x84
	ldrb r0, [r0]
	cmp r0, #2
	bne _0225C810
	ldr r0, [r4, #4]
	mov r1, #0x2d
	ldr r0, [r0, #0x20]
	mov r2, #0
	bl sub_020087A4
_0225C810:
	mov r0, #0x69
	ldr r3, [r4, #4]
	lsl r0, r0, #2
	ldr r0, [r3, r0]
	add r1, r4, #0
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x86
	ldrh r0, [r0]
	add r2, r4, #0
	add r1, #0x81
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x97
	ldrb r0, [r0]
	add r2, #0x82
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x84
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	str r0, [sp, #0x10]
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	ldr r3, [r3, #0x20]
	bl ov12_02261F38
	mov r0, #4
	add r4, #0x83
	add sp, #0x1fc
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225C858:
	ldr r0, [r4]
	bl ov12_0223B750
	add r1, r4, #0
	add r1, #0x81
	ldrb r1, [r1]
	bl sub_02017068
	cmp r0, #1
	bne _0225C878
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x20]
	bl sub_020085DC
	cmp r0, #0
	beq _0225C87A
_0225C878:
	b _0225C9AA
_0225C87A:
	add r0, r4, #0
	add r0, #0x92
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225C8B6
	add r0, r4, #0
	add r0, #0x81
	ldrb r1, [r0]
	mov r0, #0xb
	add r2, sp, #0x14c
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x14c
	bl ov12_02261B80
	mov r0, #5
	add r4, #0x83
	add sp, #0x1fc
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225C8B6:
	mov r0, #6
	add r4, #0x83
	add sp, #0x1fc
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225C8C0:
	bl ov07_0221C394
	add r0, r5, #0
	bl ov07_0221C3B0
	cmp r0, #0
	bne _0225C9AA
	add r0, r5, #0
	bl ov07_0221C3C0
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0x1fc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225C8E4:
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	cmp r0, #0
	beq _0225C926
	add r0, r4, #0
	add r0, #0x81
	ldrb r1, [r0]
	mov r0, #0xf
	add r2, sp, #0xf4
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0xf4
	bl ov12_02261B80
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0x1fc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225C926:
	mov r0, #0xff
	add r4, #0x83
	add sp, #0x1fc
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225C930:
	add r3, r4, #0
	add r3, #0x81
	ldrb r3, [r3]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x28
	add r2, sp, #0xa4
	bl ov12_02261CA8
	add r0, sp, #0xa4
	mov r1, #5
	bl ov07_02234A20
	add r0, r4, #0
	add r0, #0x81
	ldrb r1, [r0]
	mov r0, #0x10
	add r2, sp, #0x4c
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x4c
	bl ov12_02261B80
	mov r0, #0x1a
	ldr r1, [r4, #4]
	mov r2, #1
	lsl r0, r0, #4
	str r2, [r1, r0]
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	add r4, #0x83
	add sp, #0x1fc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225C98C:
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0x81
	add r2, #0x80
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0225C9AA:
	add sp, #0x1fc
	pop {r3, r4, r5, r6, pc}
	nop
_0225C9B0: .word ov07_022377F4 + 38
_0225C9B4: .word ov07_022377F4 + 36
_0225C9B8: .word ov07_022377F4 + 4
	thumb_func_end ov12_0225C6C8

	thumb_func_start ov12_0225C9BC
ov12_0225C9BC: ; 0x0225C9BC
	push {r4, r5, r6, lr}
	sub sp, #0x178
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	add r1, r4, #0
	add r1, #0x6b
	ldrb r1, [r1]
	add r5, r0, #0
	cmp r1, #8
	bhi _0225CAA6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225C9E2: ; jump table
	.short _0225C9F4 - _0225C9E2 - 2 ; case 0
	.short _0225CA98 - _0225C9E2 - 2 ; case 1
	.short _0225CA3C - _0225C9E2 - 2 ; case 2
	.short _0225CA98 - _0225C9E2 - 2 ; case 3
	.short _0225CABE - _0225C9E2 - 2 ; case 4
	.short _0225CBB0 - _0225C9E2 - 2 ; case 5
	.short _0225CBCA - _0225C9E2 - 2 ; case 6
	.short _0225CC0A - _0225C9E2 - 2 ; case 7
	.short _0225CC24 - _0225C9E2 - 2 ; case 8
_0225C9F4:
	ldr r0, [r4, #0x70]
	cmp r0, #0
	beq _0225CA32
	add r0, r4, #0
	add r0, #0x69
	ldrb r1, [r0]
	mov r0, #0xf
	add r2, sp, #0x120
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x120
	bl ov12_02261B80
	add r0, r4, #0
	add r0, #0x6b
	ldrb r0, [r0]
	add r4, #0x6b
	add sp, #0x178
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225CA32:
	mov r0, #4
	add r4, #0x6b
	add sp, #0x178
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225CA3C:
	add r3, r4, #0
	add r3, #0x69
	ldrb r3, [r3]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x10
	add r2, sp, #0xd0
	bl ov12_02261CA8
	add r0, sp, #0xd0
	mov r1, #5
	bl ov07_0223494C
	add r0, r4, #0
	add r0, #0x69
	ldrb r1, [r0]
	mov r0, #0x10
	add r2, sp, #0x78
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x78
	bl ov12_02261B80
	mov r0, #0x1a
	ldr r1, [r4, #4]
	mov r2, #0
	lsl r0, r0, #4
	str r2, [r1, r0]
	add r0, r4, #0
	add r0, #0x6b
	ldrb r0, [r0]
	add r4, #0x6b
	add sp, #0x178
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225CA98:
	bl ov07_0221C394
	add r0, r5, #0
	bl ov07_0221C3B0
	cmp r0, #0
	beq _0225CAA8
_0225CAA6:
	b _0225CC42
_0225CAA8:
	add r0, r5, #0
	bl ov07_0221C3C0
	add r0, r4, #0
	add r0, #0x6b
	ldrb r0, [r0]
	add r4, #0x6b
	add sp, #0x178
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225CABE:
	add r0, r4, #0
	add r0, #0x6a
	ldrb r5, [r0]
	mov r0, #1
	tst r0, r5
	beq _0225CB06
	ldr r0, _0225CC48 ; =ov12_0226D120
	ldrb r0, [r0, r5]
	str r0, [sp, #0x50]
	mov r0, #5
	str r0, [sp, #0x54]
	str r0, [sp, #0x58]
	add r0, r4, #0
	add r0, #0x69
	ldrb r0, [r0]
	str r0, [sp, #0x5c]
	add r0, r4, #0
	add r0, #0x6e
	ldrh r0, [r0]
	str r0, [sp, #0x60]
	ldr r0, [r4]
	bl ov12_0223A8E4
	str r0, [sp, #0x6c]
	ldr r0, [r4]
	bl ov12_0223A938
	str r0, [sp, #0x70]
	mov r0, #1
	str r0, [sp, #0x64]
	mov r0, #0
	str r0, [sp, #0x68]
	add r0, sp, #0x50
	bl ov07_02233DB8
	b _0225CB52
_0225CB06:
	ldr r3, _0225CC4C ; =ov12_0226D128
	add r2, sp, #0x10
	add r6, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	lsl r0, r5, #2
	ldr r0, [r6, r0]
	str r0, [sp, #0x28]
	mov r0, #5
	str r0, [sp, #0x2c]
	str r0, [sp, #0x30]
	add r0, r4, #0
	add r0, #0x69
	ldrb r0, [r0]
	str r0, [sp, #0x34]
	add r0, r4, #0
	add r0, #0x6e
	ldrh r0, [r0]
	str r0, [sp, #0x38]
	ldr r0, [r4]
	bl ov12_0223A8E4
	str r0, [sp, #0x44]
	ldr r0, [r4]
	bl ov12_0223A938
	str r0, [sp, #0x48]
	mov r0, #1
	str r0, [sp, #0x3c]
	mov r0, #0
	str r0, [sp, #0x40]
	add r0, sp, #0x28
	bl ov07_02233DB8
_0225CB52:
	str r0, [r4, #0xc]
	add r0, r4, #0
	mov r1, #5
	add r0, #0x6b
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x6e
	ldrh r0, [r0]
	mov r2, #0x10
	lsl r1, r0, #1
	ldr r0, _0225CC50 ; =ov12_0226D15A
	ldrh r0, [r0, r1]
	mov r1, #0
	add r3, r1, #0
	str r0, [sp]
	ldr r0, [r4, #8]
	bl sub_020090B4
	add r4, #0x6a
	ldrb r0, [r4]
	cmp r0, #5
	bhi _0225CC42
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225CB8A: ; jump table
	.short _0225CB96 - _0225CB8A - 2 ; case 0
	.short _0225CBA4 - _0225CB8A - 2 ; case 1
	.short _0225CB96 - _0225CB8A - 2 ; case 2
	.short _0225CBA4 - _0225CB8A - 2 ; case 3
	.short _0225CB96 - _0225CB8A - 2 ; case 4
	.short _0225CBA4 - _0225CB8A - 2 ; case 5
_0225CB96:
	mov r1, #0x74
	ldr r0, _0225CC54 ; =0x00000706
	mvn r1, r1
	bl sub_0200602C
	add sp, #0x178
	pop {r4, r5, r6, pc}
_0225CBA4:
	ldr r0, _0225CC54 ; =0x00000706
	mov r1, #0x75
	bl sub_0200602C
	add sp, #0x178
	pop {r4, r5, r6, pc}
_0225CBB0:
	ldr r0, [r4, #8]
	bl sub_02009138
	cmp r0, #0
	bne _0225CC42
	add r0, r4, #0
	add r0, #0x6b
	ldrb r0, [r0]
	add r4, #0x6b
	add sp, #0x178
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225CBCA:
	mov r1, #0xc
	add r2, r1, #0
	ldr r0, [r4, #8]
	sub r2, #0x2c
	bl sub_02008C2C
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, #8]
	sub r2, #0x2d
	bl sub_02008C2C
	add r1, r4, #0
	add r1, #0x6c
	ldrb r1, [r1]
	ldr r0, [r4, #8]
	bl sub_0200914C
	ldr r0, [r4, #8]
	mov r1, #0xc
	bl sub_02008A78
	cmp r0, #0
	bgt _0225CC42
	ldr r0, [r4, #8]
	bl sub_02008780
	mov r0, #7
	add r4, #0x6b
	add sp, #0x178
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225CC0A:
	ldr r0, [r4, #0xc]
	bl ov07_02233E88
	cmp r0, #0
	bne _0225CC42
	ldr r0, [r4, #0xc]
	bl ov07_02233ECC
	mov r0, #8
	add r4, #0x6b
	add sp, #0x178
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225CC24:
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0x69
	add r2, #0x68
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0225CC42:
	add sp, #0x178
	pop {r4, r5, r6, pc}
	nop
_0225CC48: .word ov12_0226D120
_0225CC4C: .word ov12_0226D128
_0225CC50: .word ov12_0226D15A
_0225CC54: .word 0x00000706
	thumb_func_end ov12_0225C9BC

	thumb_func_start ov12_0225CC58
ov12_0225CC58: ; 0x0225CC58
	push {r4, r5, r6, lr}
	sub sp, #0x168
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	add r1, r4, #0
	add r1, #0x6b
	ldrb r1, [r1]
	add r5, r0, #0
	cmp r1, #7
	bls _0225CC74
	b _0225CDB4
_0225CC74:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225CC80: ; jump table
	.short _0225CC90 - _0225CC80 - 2 ; case 0
	.short _0225CD34 - _0225CC80 - 2 ; case 1
	.short _0225CCD8 - _0225CC80 - 2 ; case 2
	.short _0225CD34 - _0225CC80 - 2 ; case 3
	.short _0225CD58 - _0225CC80 - 2 ; case 4
	.short _0225CD34 - _0225CC80 - 2 ; case 5
	.short _0225CD90 - _0225CC80 - 2 ; case 6
	.short _0225CD96 - _0225CC80 - 2 ; case 7
_0225CC90:
	ldr r0, [r4, #0x70]
	cmp r0, #0
	beq _0225CCCE
	add r0, r4, #0
	add r0, #0x69
	ldrb r1, [r0]
	mov r0, #0xf
	add r2, sp, #0x110
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x110
	bl ov12_02261B80
	add r0, r4, #0
	add r0, #0x6b
	ldrb r0, [r0]
	add r4, #0x6b
	add sp, #0x168
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225CCCE:
	mov r0, #4
	add r4, #0x6b
	add sp, #0x168
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225CCD8:
	add r3, r4, #0
	add r3, #0x69
	ldrb r3, [r3]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x10
	add r2, sp, #0xc0
	bl ov12_02261CA8
	add r0, sp, #0xc0
	mov r1, #5
	bl ov07_0223494C
	add r0, r4, #0
	add r0, #0x69
	ldrb r1, [r0]
	mov r0, #0x10
	add r2, sp, #0x68
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x68
	bl ov12_02261B80
	mov r0, #0x1a
	ldr r1, [r4, #4]
	mov r2, #0
	lsl r0, r0, #4
	str r2, [r1, r0]
	add r0, r4, #0
	add r0, #0x6b
	ldrb r0, [r0]
	add r4, #0x6b
	add sp, #0x168
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225CD34:
	bl ov07_0221C394
	add r0, r5, #0
	bl ov07_0221C3B0
	cmp r0, #0
	bne _0225CDB4
	add r0, r5, #0
	bl ov07_0221C3C0
	add r0, r4, #0
	add r0, #0x6b
	ldrb r0, [r0]
	add r4, #0x6b
	add sp, #0x168
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225CD58:
	add r0, r4, #0
	add r0, #0x69
	ldrb r1, [r0]
	mov r0, #0x2a
	add r2, sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x10
	bl ov12_02261B80
	add r0, r4, #0
	add r0, #0x6b
	ldrb r0, [r0]
	add r4, #0x6b
	add sp, #0x168
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0225CD90:
	ldr r0, [r4, #8]
	bl sub_02008780
_0225CD96:
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0x69
	add r2, #0x68
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0225CDB4:
	add sp, #0x168
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0225CC58

	thumb_func_start ov12_0225CDB8
ov12_0225CDB8: ; 0x0225CDB8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _0225CDCA
	cmp r0, #1
	beq _0225CE10
	pop {r3, r4, r5, pc}
_0225CDCA:
	mov r1, #0xc
	add r2, r1, #0
	ldr r0, [r4, #4]
	sub r2, #0x2c
	bl sub_02008C2C
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, #4]
	sub r2, #0x2d
	bl sub_02008C2C
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	beq _0225CDF6
	sub r0, r0, #1
	strb r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r4, #4]
	sub r2, r1, #2
	bl sub_02008C2C
_0225CDF6:
	ldr r0, [r4, #4]
	mov r1, #0xc
	bl sub_02008A78
	cmp r0, #0
	bgt _0225CE26
	ldr r0, [r4, #4]
	bl sub_02008780
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
	pop {r3, r4, r5, pc}
_0225CE10:
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_0225CE26:
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0225CDB8

	thumb_func_start ov12_0225CE28
ov12_0225CE28: ; 0x0225CE28
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A7E0
	add r5, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0x21
	bge _0225CE64
	ldrb r0, [r4, #0x12]
	cmp r0, #2
	blo _0225CE64
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0225CE4E
	cmp r0, #2
	bne _0225CE64
_0225CE4E:
	ldr r0, [r4]
	bl ov12_0223A7D4
	mov r1, #3
	mov r2, #1
	mov r3, #4
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0x20]
	add r0, r0, #1
	str r0, [r4, #0x20]
_0225CE64:
	ldrb r0, [r4, #0x12]
	cmp r0, #4
	bls _0225CE6C
	b _0225D132
_0225CE6C:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225CE78: ; jump table
	.short _0225CE82 - _0225CE78 - 2 ; case 0
	.short _0225CEA4 - _0225CE78 - 2 ; case 1
	.short _0225CEB0 - _0225CE78 - 2 ; case 2
	.short _0225D102 - _0225CE78 - 2 ; case 3
	.short _0225D11C - _0225CE78 - 2 ; case 4
_0225CE82:
	ldr r0, [r4, #0xc]
	bl sub_0200DC40
	cmp r0, #2
	bls _0225CE9C
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl sub_0200DCC0
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl sub_0200DC4C
_0225CE9C:
	mov r0, #0x1c
	str r0, [r4, #0x1c]
	mov r0, #1
	strb r0, [r4, #0x12]
_0225CEA4:
	ldr r0, [r4, #0x1c]
	sub r0, r0, #1
	str r0, [r4, #0x1c]
	bne _0225CF9A
	mov r0, #2
	strb r0, [r4, #0x12]
_0225CEB0:
	ldr r0, [r4, #8]
	add r1, sp, #4
	ldr r0, [r0]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	add r1, sp, #0
	ldr r0, [r4, #0xc]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	ldrb r0, [r4, #0x13]
	cmp r0, #2
	ldr r0, [r4, #0x18]
	beq _0225CED4
	b _0225CFEE
_0225CED4:
	cmp r0, #1
	beq _0225CEDC
	cmp r0, #3
	bne _0225CEFE
_0225CEDC:
	add r1, sp, #0
	mov r0, #6
	ldrsh r0, [r1, r0]
	cmp r0, #0xc0
	ldr r0, [r4, #8]
	bge _0225CEF4
	ldr r0, [r0]
	mov r1, #8
	mov r2, #0
	bl sub_0200DED0
	b _0225CEFE
_0225CEF4:
	ldr r0, [r0]
	mov r1, #0xc0
	mov r2, #0x58
	bl sub_0200DDB8
_0225CEFE:
	ldr r0, [r4, #8]
	add r1, sp, #4
	ldr r0, [r0]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	ldr r0, [r4, #0x18]
	cmp r0, #1
	beq _0225CF22
	cmp r0, #3
	bne _0225CF34
	cmp r5, #3
	beq _0225CF22
	cmp r5, #0x83
	beq _0225CF22
	cmp r5, #7
	bne _0225CF34
_0225CF22:
	add r3, sp, #0
	mov r1, #6
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #0xc]
	bl sub_0200DDB8
	b _0225CF80
_0225CF34:
	cmp r0, #3
	bne _0225CF5E
	add r2, sp, #0
	mov r0, #2
	mov r1, #6
	ldrsh r3, [r2, r0]
	ldrsh r0, [r2, r1]
	sub r0, r3, r0
	strh r0, [r2, #6]
	ldrsh r0, [r2, r1]
	sub r0, #0x18
	strh r0, [r2, #6]
	ldrsh r1, [r2, r1]
	ldr r0, [r4, #0xc]
	mov r2, #0
	neg r1, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	bl sub_0200DED0
	b _0225CF80
_0225CF5E:
	cmp r0, #5
	bne _0225CF80
	add r2, sp, #0
	mov r1, #6
	mov r0, #2
	ldrsh r3, [r2, r1]
	ldrsh r0, [r2, r0]
	sub r0, r3, r0
	strh r0, [r2, #6]
	ldrsh r0, [r2, r1]
	sub r0, #0x10
	strh r0, [r2, #6]
	ldrsh r1, [r2, r1]
	ldr r0, [r4, #0xc]
	mov r2, #0
	bl sub_0200DED0
_0225CF80:
	add r1, sp, #0
	ldr r0, [r4, #0xc]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	mov r0, #0x14
	ldrsh r1, [r4, r0]
	add r3, sp, #0
	mov r0, #2
	ldrsh r0, [r3, r0]
	cmp r0, r1
	bge _0225CF9C
_0225CF9A:
	b _0225D132
_0225CF9C:
	mov r2, #0
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #0xc]
	bl sub_0200DDB8
	ldr r0, [r4, #0x18]
	cmp r0, #1
	beq _0225CFB0
	cmp r0, #3
	bne _0225CFBC
_0225CFB0:
	ldr r0, [r4, #8]
	mov r1, #0xc0
	ldr r0, [r0]
	mov r2, #0x58
	bl sub_0200DDB8
_0225CFBC:
	ldr r0, [r4, #0xc]
	bl sub_0200DC40
	cmp r0, #1
	bls _0225CFE6
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl sub_0200DCC0
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_0200DC4C
	ldrh r1, [r4, #0x16]
	mov r0, #1
	add sp, #8
	bic r1, r0
	strh r1, [r4, #0x16]
	mov r0, #3
	strb r0, [r4, #0x12]
	pop {r4, r5, r6, pc}
_0225CFE6:
	mov r0, #4
	add sp, #8
	strb r0, [r4, #0x12]
	pop {r4, r5, r6, pc}
_0225CFEE:
	cmp r0, #0
	beq _0225CFF6
	cmp r0, #2
	bne _0225D018
_0225CFF6:
	add r0, sp, #0
	mov r1, #6
	ldrsh r0, [r0, r1]
	cmp r0, #0x40
	ldr r0, [r4, #8]
	ble _0225D00E
	ldr r0, [r0]
	sub r1, #0xe
	mov r2, #0
	bl sub_0200DED0
	b _0225D018
_0225D00E:
	ldr r0, [r0]
	mov r1, #0x40
	mov r2, #0x88
	bl sub_0200DDB8
_0225D018:
	ldr r0, [r4, #8]
	add r1, sp, #4
	ldr r0, [r0]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0225D040
	cmp r0, #2
	bne _0225D052
	cmp r5, #3
	beq _0225D040
	cmp r5, #0x83
	beq _0225D040
	cmp r5, #0x13
	beq _0225D040
	cmp r5, #7
	bne _0225D052
_0225D040:
	add r3, sp, #0
	mov r1, #6
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #0xc]
	bl sub_0200DDB8
	b _0225D09E
_0225D052:
	cmp r0, #2
	bne _0225D076
	add r2, sp, #0
	mov r1, #6
	mov r0, #2
	ldrsh r3, [r2, r1]
	ldrsh r0, [r2, r0]
	sub r0, r3, r0
	strh r0, [r2, #6]
	ldrsh r0, [r2, r1]
	sub r0, #0x18
	strh r0, [r2, #6]
	ldrsh r1, [r2, r1]
	ldr r0, [r4, #0xc]
	mov r2, #0
	bl sub_0200DED0
	b _0225D09E
_0225D076:
	cmp r0, #4
	bne _0225D09E
	add r2, sp, #0
	mov r0, #2
	mov r1, #6
	ldrsh r3, [r2, r0]
	ldrsh r0, [r2, r1]
	sub r0, r3, r0
	strh r0, [r2, #6]
	ldrsh r0, [r2, r1]
	sub r0, #0x10
	strh r0, [r2, #6]
	ldrsh r1, [r2, r1]
	ldr r0, [r4, #0xc]
	mov r2, #0
	neg r1, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	bl sub_0200DED0
_0225D09E:
	add r1, sp, #0
	ldr r0, [r4, #0xc]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0225D0BC
	add r3, sp, #0
	mov r2, #2
	ldrsh r2, [r3, r2]
	mov r1, #0
	bl sub_020087A4
_0225D0BC:
	add r1, sp, #0
	mov r0, #2
	ldrsh r1, [r1, r0]
	mov r0, #0x14
	ldrsh r0, [r4, r0]
	cmp r1, r0
	bgt _0225D132
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0225D0D4
	bl sub_02008780
_0225D0D4:
	mov r1, #0x14
	add r3, sp, #0
	mov r2, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #0xc]
	bl sub_0200DDB8
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0225D0EE
	cmp r0, #2
	bne _0225D0FA
_0225D0EE:
	ldr r0, [r4, #8]
	mov r1, #0x40
	ldr r0, [r0]
	mov r2, #0x88
	bl sub_0200DDB8
_0225D0FA:
	mov r0, #4
	add sp, #8
	strb r0, [r4, #0x12]
	pop {r4, r5, r6, pc}
_0225D102:
	ldr r0, [r4, #0xc]
	bl sub_0200DCA0
	cmp r0, #1
	bne _0225D118
	ldr r1, [r4, #0xc]
	add r0, r4, #0
	bl ov12_02261DC8
	cmp r0, #0
	beq _0225D132
_0225D118:
	mov r0, #4
	strb r0, [r4, #0x12]
_0225D11C:
	ldrb r1, [r4, #0x11]
	ldrb r2, [r4, #0x10]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0225D132:
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0225CE28

	thumb_func_start ov12_0225D138
ov12_0225D138: ; 0x0225D138
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223A7E0
	add r6, r0, #0
	ldrb r0, [r4, #0xa]
	cmp r0, #6
	bls _0225D150
	b _0225D62E
_0225D150:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225D15C: ; jump table
	.short _0225D16A - _0225D15C - 2 ; case 0
	.short _0225D244 - _0225D15C - 2 ; case 1
	.short _0225D368 - _0225D15C - 2 ; case 2
	.short _0225D522 - _0225D15C - 2 ; case 3
	.short _0225D5D2 - _0225D15C - 2 ; case 4
	.short _0225D5F0 - _0225D15C - 2 ; case 5
	.short _0225D618 - _0225D15C - 2 ; case 6
_0225D16A:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0225D178
	mov r0, #1
	add sp, #0x30
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225D178:
	cmp r0, #4
	bhi _0225D192
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225D188: ; jump table
	.short _0225D192 - _0225D188 - 2 ; case 0
	.short _0225D192 - _0225D188 - 2 ; case 1
	.short _0225D1A0 - _0225D188 - 2 ; case 2
	.short _0225D1AE - _0225D188 - 2 ; case 3
	.short _0225D1BC - _0225D188 - 2 ; case 4
_0225D192:
	mov r0, #0xf
	str r0, [sp, #8]
	mov r0, #3
	str r0, [r4, #0x18]
	mov r0, #5
	str r0, [sp, #0x18]
	b _0225D1CA
_0225D1A0:
	mov r0, #0xc
	str r0, [sp, #8]
	mov r0, #0
	str r0, [r4, #0x18]
	ldr r0, _0225D4F0 ; =0x00000401
	str r0, [sp, #0x18]
	b _0225D1CA
_0225D1AE:
	mov r0, #0xd
	str r0, [sp, #8]
	mov r0, #0
	str r0, [r4, #0x18]
	ldr r0, _0225D4F4 ; =0x00000402
	str r0, [sp, #0x18]
	b _0225D1CA
_0225D1BC:
	mov r0, #0xf
	str r0, [sp, #8]
	mov r0, #3
	str r0, [r4, #0x18]
	mov r0, #1
	lsl r0, r0, #0xa
	str r0, [sp, #0x18]
_0225D1CA:
	mov r0, #5
	str r0, [sp, #0xc]
	mov r0, #4
	str r0, [sp, #0x10]
	ldrb r0, [r4, #9]
	str r0, [sp, #0x14]
	ldr r0, [r4]
	bl ov12_0223A8E4
	str r0, [sp, #0x24]
	ldr r0, [r4]
	bl ov12_0223A938
	str r0, [sp, #0x28]
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, [r4]
	str r0, [sp, #0x2c]
	add r0, sp, #8
	bl ov07_02233DB8
	ldr r1, [r4, #4]
	add r1, #0x88
	str r0, [r1]
	ldr r0, [r4, #4]
	mov r1, #0x64
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_022344C4
	ldr r0, [r4, #4]
	mov r1, #2
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_022344D0
	ldr r0, [r4, #4]
	mov r1, #0
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_022344C0
	ldr r0, [r4, #4]
	mov r1, #0
	ldr r0, [r0, #0x18]
	bl sub_0200DCC0
	ldr r0, [r4, #4]
	mov r1, #1
	ldr r0, [r0, #0x18]
	bl sub_0200DC4C
	ldr r0, [r4, #4]
	mov r1, #1
	ldr r0, [r0, #0x18]
	bl sub_0200DC78
	mov r0, #3
	add sp, #0x30
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225D244:
	ldrb r0, [r4, #0xb]
	cmp r0, #2
	ldr r0, [r4, #4]
	bne _0225D344
	ldr r0, [r0, #0x18]
	mov r1, #5
	mov r2, #0
	bl sub_0200DED0
	ldr r0, [r4, #4]
	add r1, sp, #4
	ldr r0, [r0, #0x18]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	add r1, sp, #4
	mov r0, #2
	ldrsh r0, [r1, r0]
	cmp r0, #0xa0
	blt _0225D2D6
	ldr r0, [r4, #4]
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_02233F20
	cmp r0, #0
	beq _0225D2D6
	ldr r0, [r4, #4]
	mov r1, #1
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_0223449C
	ldr r0, [r4, #4]
	mov r1, #0
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_02233EFC
	mov r0, #2
	tst r0, r6
	beq _0225D2E4
	mov r0, #8
	tst r0, r6
	bne _0225D2E4
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl ov12_0223AB6C
	add r1, r0, #0
	ldr r0, [r4]
	bl ov12_0223A7E8
	add r4, r0, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #1
	bl ov07_0223449C
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl ov07_02233EFC
	add r4, #0x88
	ldr r0, [r4]
	mov r1, #0xc
	bl ov07_022344DC
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
_0225D2D6:
	add r1, sp, #4
	mov r0, #2
	ldrsh r1, [r1, r0]
	mov r0, #0x4a
	lsl r0, r0, #2
	cmp r1, r0
	bge _0225D2E6
_0225D2E4:
	b _0225D62E
_0225D2E6:
	ldr r0, [r4]
	bl ov12_0223A8EC
	add r5, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x18]
	bl sub_0200D9DC
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0, #0x18]
	ldr r2, [r4, #4]
	ldr r1, _0225D4F8 ; =0x00000195
	add r0, r5, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D4FC ; =0x00004E2F
	add r1, r2, r1
	bl sub_0200D958
	ldr r2, [r4, #4]
	ldr r1, _0225D4F8 ; =0x00000195
	add r0, r5, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D500 ; =0x00004E2A
	add r1, r2, r1
	bl sub_0200D968
	ldr r2, [r4, #4]
	ldr r1, _0225D4F8 ; =0x00000195
	add r0, r5, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D504 ; =0x00004E27
	add r1, r2, r1
	bl sub_0200D978
	ldr r2, [r4, #4]
	ldr r1, _0225D4F8 ; =0x00000195
	add r0, r5, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D504 ; =0x00004E27
	add r1, r2, r1
	bl sub_0200D988
	mov r0, #6
	add sp, #0x30
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225D344:
	ldr r0, [r0, #0x18]
	mov r1, #0
	bl sub_0200DCC0
	ldr r0, [r4, #4]
	mov r1, #1
	ldr r0, [r0, #0x18]
	bl sub_0200DC4C
	ldr r0, [r4, #4]
	mov r1, #1
	ldr r0, [r0, #0x18]
	bl sub_0200DC78
	mov r0, #2
	add sp, #0x30
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225D368:
	ldr r0, [r4, #4]
	mov r1, #4
	ldr r0, [r0, #0x18]
	mvn r1, r1
	mov r2, #0
	bl sub_0200DED0
	ldr r0, [r4, #4]
	add r1, sp, #4
	ldr r0, [r0, #0x18]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	ldr r1, [r4, #4]
	add r0, r1, #0
	add r0, #0x88
	ldr r0, [r0]
	cmp r0, #0
	beq _0225D48E
	ldr r0, [r1, #0x18]
	bl sub_0200DCD4
	ldr r1, [r4, #0xc]
	str r0, [sp]
	lsl r5, r0, #2
	mov r0, #0x18
	add r2, r1, #0
	mul r2, r0
	ldr r0, _0225D508 ; =ov12_0226D1E8
	add r0, r0, r2
	ldrsh r1, [r5, r0]
	ldr r0, _0225D50C ; =0x00007FFF
	cmp r1, r0
	beq _0225D48E
	ldr r0, [r4, #4]
	mov r1, #1
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_0223449C
	ldr r1, [r4, #0xc]
	mov r0, #0x18
	add r3, r1, #0
	mul r3, r0
	ldr r2, _0225D508 ; =ov12_0226D1E8
	add r7, sp, #4
	mov r1, #2
	add r2, r2, r3
	ldrsh r1, [r7, r1]
	ldrsh r2, [r5, r2]
	ldr r0, [r4, #4]
	add r1, r1, r2
	mov r2, #0
	ldrsh r7, [r7, r2]
	ldr r2, _0225D510 ; =ov12_0226D1EA
	add r0, #0x88
	add r2, r2, r3
	ldrsh r2, [r5, r2]
	lsl r1, r1, #0x10
	ldr r0, [r0]
	add r2, r7, r2
	lsl r2, r2, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov07_022344A8
	ldr r0, [sp]
	cmp r0, #3
	bne _0225D48E
	ldr r0, [r4, #4]
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_02233F20
	cmp r0, #0
	beq _0225D48E
	ldr r0, [r4, #4]
	mov r1, #0
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_02233EFC
	ldr r0, [r4, #4]
	mov r1, #1
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_022344C0
	mov r0, #2
	tst r0, r6
	beq _0225D48E
	mov r0, #8
	tst r0, r6
	bne _0225D48E
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl ov12_0223AB6C
	add r1, r0, #0
	ldr r0, [r4]
	bl ov12_0223A7E8
	ldr r1, [r4, #0xc]
	add r6, r0, #0
	add r3, r1, #0
	mov r0, #0x18
	mul r3, r0
	ldr r2, _0225D508 ; =ov12_0226D1E8
	add r0, r6, #0
	add r2, r2, r3
	add r0, #0x88
	add r7, sp, #4
	mov r1, #2
	ldrsh r1, [r7, r1]
	ldrsh r2, [r5, r2]
	ldr r0, [r0]
	add r1, r1, r2
	mov r2, #0
	ldrsh r7, [r7, r2]
	ldr r2, _0225D510 ; =ov12_0226D1EA
	lsl r1, r1, #0x10
	add r2, r2, r3
	ldrsh r2, [r5, r2]
	asr r1, r1, #0x10
	add r2, r7, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov07_022344A8
	add r0, r6, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #1
	bl ov07_0223449C
	add r0, r6, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl ov07_02233EFC
	add r6, #0x88
	ldr r0, [r6]
	mov r1, #1
	bl ov07_022344C0
_0225D48E:
	add r1, sp, #4
	mov r0, #2
	ldrsh r1, [r1, r0]
	sub r0, #0x2a
	cmp r1, r0
	ble _0225D49C
	b _0225D62E
_0225D49C:
	ldr r0, [r4]
	bl ov12_0223A8EC
	add r5, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x18]
	bl sub_0200D9DC
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0, #0x18]
	ldr r2, [r4, #4]
	ldr r1, _0225D4F8 ; =0x00000195
	add r0, r5, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D4FC ; =0x00004E2F
	add r1, r2, r1
	bl sub_0200D958
	ldr r2, [r4, #4]
	ldr r1, _0225D4F8 ; =0x00000195
	add r0, r5, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D500 ; =0x00004E2A
	add r1, r2, r1
	bl sub_0200D968
	ldr r2, [r4, #4]
	ldr r1, _0225D4F8 ; =0x00000195
	add r0, r5, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D504 ; =0x00004E27
	add r1, r2, r1
	bl sub_0200D978
	ldr r2, [r4, #4]
	ldr r1, _0225D4F8 ; =0x00000195
	add r0, r5, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D504 ; =0x00004E27
	b _0225D514
	nop
_0225D4F0: .word 0x00000401
_0225D4F4: .word 0x00000402
_0225D4F8: .word 0x00000195
_0225D4FC: .word 0x00004E2F
_0225D500: .word 0x00004E2A
_0225D504: .word 0x00004E27
_0225D508: .word ov12_0226D1E8
_0225D50C: .word 0x00007FFF
_0225D510: .word ov12_0226D1EA
_0225D514:
	add r1, r2, r1
	bl sub_0200D988
	mov r0, #6
	add sp, #0x30
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225D522:
	ldr r0, [r4, #4]
	add r1, sp, #4
	ldr r0, [r0, #0x18]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x18]
	bl sub_0200DCD4
	add r7, r0, #0
	cmp r7, #4
	bne _0225D54A
	mov r0, #8
	str r0, [r4, #0x14]
	mov r0, #4
	add sp, #0x30
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225D54A:
	ldr r0, [r4, #4]
	add r0, #0x88
	ldr r0, [r0]
	cmp r0, #0
	beq _0225D62E
	ldr r2, [r4, #0xc]
	mov r1, #0x18
	add r5, r2, #0
	mul r5, r1
	ldr r1, _0225D634 ; =ov12_0226D1E8
	lsl r6, r7, #2
	add r1, r1, r5
	ldrsh r1, [r6, r1]
	ldr r2, _0225D638 ; =0x00007FFF
	cmp r1, r2
	beq _0225D62E
	add r3, sp, #4
	mov r2, #2
	ldrsh r2, [r3, r2]
	add r1, r2, r1
	mov r2, #0
	ldrsh r3, [r3, r2]
	ldr r2, _0225D63C ; =ov12_0226D1EA
	lsl r1, r1, #0x10
	add r2, r2, r5
	ldrsh r2, [r6, r2]
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov07_022344A8
	cmp r7, #3
	bne _0225D62E
	ldr r0, [r4, #4]
	ldr r5, [r4, #0x18]
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_02233F20
	cmp r5, r0
	beq _0225D62E
	ldr r0, [r4, #4]
	add r1, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_02233EFC
	ldr r0, [r4, #4]
	mov r1, #1
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_022344D0
	ldr r0, [r4, #4]
	mov r1, #1
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_022344C0
	ldr r0, [r4, #0x18]
	cmp r0, #3
	beq _0225D62E
	ldr r0, _0225D640 ; =0x0000070A
	bl PlaySE
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
_0225D5D2:
	ldr r0, [r4, #0x14]
	sub r0, r0, #1
	str r0, [r4, #0x14]
	bne _0225D62E
	ldr r0, [r4, #0x18]
	cmp r0, #3
	bne _0225D5E8
	mov r0, #6
	add sp, #0x30
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225D5E8:
	mov r0, #5
	add sp, #0x30
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225D5F0:
	ldr r0, [r4, #4]
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_02233E88
	cmp r0, #1
	beq _0225D62E
	ldr r0, [r4, #4]
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_02233ECC
	ldr r0, [r4, #4]
	mov r1, #0
	add r0, #0x88
	str r1, [r0]
	mov r0, #6
	add sp, #0x30
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225D618:
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_0225D62E:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D634: .word ov12_0226D1E8
_0225D638: .word 0x00007FFF
_0225D63C: .word ov12_0226D1EA
_0225D640: .word 0x0000070A
	thumb_func_end ov12_0225D138

	thumb_func_start ov12_0225D644
ov12_0225D644: ; 0x0225D644
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	bl ov12_0223A7E0
	add r4, r0, #0
	ldrb r0, [r5, #0xa]
	cmp r0, #0
	beq _0225D664
	cmp r0, #1
	beq _0225D71C
	cmp r0, #2
	bne _0225D662
	b _0225D85A
_0225D662:
	pop {r3, r4, r5, r6, r7, pc}
_0225D664:
	ldrb r0, [r5, #0xb]
	cmp r0, #2
	ldr r0, [r5, #4]
	bne _0225D6F0
	ldr r0, [r0, #0x18]
	mov r1, #5
	mov r2, #0
	bl sub_0200DED0
	ldr r0, [r5, #4]
	add r1, sp, #0
	ldr r0, [r0, #0x18]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r1, sp, #0
	mov r0, #2
	ldrsh r1, [r1, r0]
	mov r0, #0x4a
	lsl r0, r0, #2
	cmp r1, r0
	bge _0225D694
	b _0225D870
_0225D694:
	ldr r0, [r5]
	bl ov12_0223A8EC
	add r4, r0, #0
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x18]
	bl sub_0200D9DC
	ldr r0, [r5, #4]
	mov r1, #0
	str r1, [r0, #0x18]
	ldr r2, [r5, #4]
	ldr r1, _0225D874 ; =0x00000195
	add r0, r4, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D878 ; =0x00004E2F
	add r1, r2, r1
	bl sub_0200D958
	ldr r2, [r5, #4]
	ldr r1, _0225D874 ; =0x00000195
	add r0, r4, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D87C ; =0x00004E2A
	add r1, r2, r1
	bl sub_0200D968
	ldr r2, [r5, #4]
	ldr r1, _0225D874 ; =0x00000195
	add r0, r4, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D880 ; =0x00004E27
	add r1, r2, r1
	bl sub_0200D978
	ldr r2, [r5, #4]
	ldr r1, _0225D874 ; =0x00000195
	add r0, r4, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D880 ; =0x00004E27
	add r1, r2, r1
	bl sub_0200D988
	mov r0, #2
	strb r0, [r5, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225D6F0:
	ldr r0, [r0, #0x18]
	mov r1, #1
	bl sub_0200DD54
	ldr r0, [r5, #4]
	mov r1, #0
	ldr r0, [r0, #0x18]
	bl sub_0200DCC0
	ldr r0, [r5, #4]
	mov r1, #1
	ldr r0, [r0, #0x18]
	bl sub_0200DC4C
	ldr r0, [r5, #4]
	mov r1, #1
	ldr r0, [r0, #0x18]
	bl sub_0200DC78
	mov r0, #1
	strb r0, [r5, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225D71C:
	ldr r0, [r5, #4]
	mov r1, #4
	ldr r0, [r0, #0x18]
	mvn r1, r1
	mov r2, #0
	bl sub_0200DED0
	ldr r0, [r5, #4]
	add r1, sp, #0
	ldr r0, [r0, #0x18]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	ldr r0, [r5, #4]
	add r1, r0, #0
	add r1, #0x88
	ldr r1, [r1]
	cmp r1, #0
	beq _0225D7F2
	mov r1, #2
	tst r1, r4
	beq _0225D7F2
	mov r1, #8
	tst r1, r4
	bne _0225D7F2
	ldr r0, [r0, #0x18]
	bl sub_0200DCD4
	add r7, r0, #0
	ldr r1, [r5, #0xc]
	mov r0, #0x18
	add r2, r1, #0
	mul r2, r0
	ldr r0, _0225D884 ; =ov12_0226D1E8
	lsl r6, r7, #2
	add r0, r0, r2
	ldrsh r1, [r6, r0]
	ldr r0, _0225D888 ; =0x00007FFF
	cmp r1, r0
	beq _0225D7F2
	ldrb r1, [r5, #9]
	ldr r0, [r5]
	bl ov12_0223AB6C
	add r1, r0, #0
	ldr r0, [r5]
	bl ov12_0223A7E8
	add r4, r0, #0
	cmp r7, #3
	bne _0225D7F2
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_02233F20
	cmp r0, #0
	beq _0225D7F2
	ldr r1, [r5, #0xc]
	mov r0, #0x18
	add r3, r1, #0
	mul r3, r0
	ldr r2, _0225D884 ; =ov12_0226D1E8
	add r7, sp, #0
	mov r1, #2
	add r2, r2, r3
	ldrsh r1, [r7, r1]
	ldrsh r2, [r6, r2]
	add r0, r4, #0
	add r0, #0x88
	add r1, r1, r2
	mov r2, #0
	ldrsh r7, [r7, r2]
	ldr r2, _0225D88C ; =ov12_0226D1EA
	lsl r1, r1, #0x10
	add r2, r2, r3
	ldrsh r2, [r6, r2]
	ldr r0, [r0]
	asr r1, r1, #0x10
	add r2, r7, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov07_022344A8
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #1
	bl ov07_0223449C
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl ov07_02233EFC
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #1
	bl ov07_022344C0
	add r4, #0x88
	ldr r0, [r4]
	mov r1, #1
	bl ov07_022344D0
_0225D7F2:
	add r1, sp, #0
	mov r0, #2
	ldrsh r1, [r1, r0]
	sub r0, #0x2a
	cmp r1, r0
	bgt _0225D870
	ldr r0, [r5]
	bl ov12_0223A8EC
	add r4, r0, #0
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x18]
	bl sub_0200D9DC
	ldr r0, [r5, #4]
	mov r1, #0
	str r1, [r0, #0x18]
	ldr r2, [r5, #4]
	ldr r1, _0225D874 ; =0x00000195
	add r0, r4, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D878 ; =0x00004E2F
	add r1, r2, r1
	bl sub_0200D958
	ldr r2, [r5, #4]
	ldr r1, _0225D874 ; =0x00000195
	add r0, r4, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D87C ; =0x00004E2A
	add r1, r2, r1
	bl sub_0200D968
	ldr r2, [r5, #4]
	ldr r1, _0225D874 ; =0x00000195
	add r0, r4, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D880 ; =0x00004E27
	add r1, r2, r1
	bl sub_0200D978
	ldr r2, [r5, #4]
	ldr r1, _0225D874 ; =0x00000195
	add r0, r4, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D880 ; =0x00004E27
	add r1, r2, r1
	bl sub_0200D988
	mov r0, #2
	strb r0, [r5, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225D85A:
	ldrb r1, [r5, #9]
	ldrb r2, [r5, #8]
	ldr r0, [r5]
	bl ov12_0226430C
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0225D870:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D874: .word 0x00000195
_0225D878: .word 0x00004E2F
_0225D87C: .word 0x00004E2A
_0225D880: .word 0x00004E27
_0225D884: .word ov12_0226D1E8
_0225D888: .word 0x00007FFF
_0225D88C: .word ov12_0226D1EA
	thumb_func_end ov12_0225D644

	thumb_func_start ov12_0225D890
ov12_0225D890: ; 0x0225D890
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r1, #0
	add r6, r0, #0
	ldrb r0, [r5, #0xa]
	cmp r0, #0
	beq _0225D8A6
	cmp r0, #1
	beq _0225D90E
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0225D8A6:
	ldrb r0, [r5, #0xb]
	cmp r0, #2
	ldr r0, [r5, #4]
	bne _0225D8DE
	ldr r0, [r0, #0x18]
	mov r1, #5
	mov r2, #0
	bl sub_0200DED0
	ldr r0, [r5, #4]
	add r1, sp, #0
	ldr r0, [r0, #0x18]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r1, sp, #0
	mov r0, #2
	ldrsh r1, [r1, r0]
	mov r0, #0x4a
	lsl r0, r0, #2
	cmp r1, r0
	blt _0225D97A
	ldrb r0, [r5, #0xa]
	add sp, #4
	add r0, r0, #1
	strb r0, [r5, #0xa]
	pop {r3, r4, r5, r6, pc}
_0225D8DE:
	mov r1, #4
	ldr r0, [r0, #0x18]
	mvn r1, r1
	mov r2, #0
	bl sub_0200DED0
	ldr r0, [r5, #4]
	add r1, sp, #0
	ldr r0, [r0, #0x18]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r1, sp, #0
	mov r0, #2
	ldrsh r1, [r1, r0]
	sub r0, #0x2a
	cmp r1, r0
	bgt _0225D97A
	ldrb r0, [r5, #0xa]
	add sp, #4
	add r0, r0, #1
	strb r0, [r5, #0xa]
	pop {r3, r4, r5, r6, pc}
_0225D90E:
	ldr r0, [r5]
	bl ov12_0223A8EC
	add r4, r0, #0
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x18]
	bl sub_0200D9DC
	ldr r0, [r5, #4]
	mov r1, #0
	str r1, [r0, #0x18]
	ldr r2, [r5, #4]
	ldr r1, _0225D980 ; =0x00000195
	add r0, r4, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D984 ; =0x00004E2F
	add r1, r2, r1
	bl sub_0200D958
	ldr r2, [r5, #4]
	ldr r1, _0225D980 ; =0x00000195
	add r0, r4, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D988 ; =0x00004E2A
	add r1, r2, r1
	bl sub_0200D968
	ldr r2, [r5, #4]
	ldr r1, _0225D980 ; =0x00000195
	add r0, r4, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D98C ; =0x00004E27
	add r1, r2, r1
	bl sub_0200D978
	ldr r2, [r5, #4]
	ldr r1, _0225D980 ; =0x00000195
	add r0, r4, #0
	ldrb r2, [r2, r1]
	ldr r1, _0225D98C ; =0x00004E27
	add r1, r2, r1
	bl sub_0200D988
	ldrb r1, [r5, #9]
	ldrb r2, [r5, #8]
	ldr r0, [r5]
	bl ov12_0226430C
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0225D97A:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0225D980: .word 0x00000195
_0225D984: .word 0x00004E2F
_0225D988: .word 0x00004E2A
_0225D98C: .word 0x00004E27
	thumb_func_end ov12_0225D890

	thumb_func_start ov12_0225D990
ov12_0225D990: ; 0x0225D990
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	beq _0225D9A2
	cmp r0, #1
	beq _0225D9FE
	pop {r3, r4, r5, pc}
_0225D9A2:
	add r1, sp, #0
	ldr r0, [r4, #4]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	ldrb r0, [r4, #0xb]
	add r2, sp, #0
	cmp r0, #0
	bne _0225D9D2
	mov r1, #2
	ldrsh r0, [r2, r1]
	add r0, r0, #5
	strh r0, [r2, #2]
	mov r0, #0xc
	ldrsh r3, [r4, r0]
	ldrsh r0, [r2, r1]
	cmp r0, r3
	blt _0225D9EC
	strh r3, [r2, #2]
	ldrb r0, [r4, #0xa]
	add r0, r0, #1
	strb r0, [r4, #0xa]
	b _0225D9EC
_0225D9D2:
	mov r1, #2
	ldrsh r0, [r2, r1]
	sub r0, r0, #5
	strh r0, [r2, #2]
	mov r0, #0xc
	ldrsh r3, [r4, r0]
	ldrsh r0, [r2, r1]
	cmp r0, r3
	bgt _0225D9EC
	strh r3, [r2, #2]
	ldrb r0, [r4, #0xa]
	add r0, r0, #1
	strb r0, [r4, #0xa]
_0225D9EC:
	add r3, sp, #0
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #4]
	bl sub_0200DDB8
	pop {r3, r4, r5, pc}
_0225D9FE:
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0225D990

	thumb_func_start ov12_0225DA18
ov12_0225DA18: ; 0x0225DA18
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4]
	add r5, r0, #0
	cmp r1, #0
	beq _0225DA2A
	cmp r1, #1
	beq _0225DA5A
	b _0225DA6E
_0225DA2A:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225DA42
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	add r4, #0x4d
	sub r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225DA42:
	add r0, r4, #0
	mov r1, #0
	bl ov12_02264FB0
	add r0, r4, #0
	mov r1, #1
	bl ov12_02264F28
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225DA5A:
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0225DA8A
	add r0, r1, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225DA6E:
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0x24
	add r2, #0x4c
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4, #0xc]
	bl ov12_0226430C
	mov r0, #0
	str r0, [r4, #0x10]
	add r0, r5, #0
	bl DestroySysTask
_0225DA8A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0225DA18

	thumb_func_start ov12_0225DA8C
ov12_0225DA8C: ; 0x0225DA8C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4]
	add r5, r0, #0
	cmp r1, #0
	bne _0225DAAC
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0225DAD0
	add r0, r1, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225DAAC:
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0x24
	add r2, #0x4c
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4, #0xc]
	bl ov12_0226430C
	mov r0, #0
	str r0, [r4, #0x10]
	add r0, r5, #0
	bl DestroySysTask
	add r0, r4, #0
	mov r1, #0
	bl ov12_02264F28
_0225DAD0:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0225DA8C

	thumb_func_start ov12_0225DAD4
ov12_0225DAD4: ; 0x0225DAD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	add r4, r1, #0
	add r7, r0, #0
	ldr r0, [r4]
	bl ov12_0223A7D4
	ldr r0, [r4]
	bl ov12_0223A900
	add r6, r0, #0
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl ov12_0223A7E8
	str r0, [sp, #0xc]
	ldr r0, [r4]
	bl ov12_0223A7E0
	add r5, r0, #0
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl ov12_0223AB6C
	add r1, r0, #0
	ldrb r0, [r4, #9]
	cmp r1, r0
	beq _0225DB16
	ldr r0, [r4]
	bl ov12_0223BC38
	str r0, [sp, #8]
	b _0225DB1A
_0225DB16:
	mov r0, #0
	str r0, [sp, #8]
_0225DB1A:
	ldrb r0, [r4, #0xa]
	cmp r0, #8
	bls _0225DB22
	b _0225E0FA
_0225DB22:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225DB2E: ; jump table
	.short _0225DB40 - _0225DB2E - 2 ; case 0
	.short _0225DB7C - _0225DB2E - 2 ; case 1
	.short _0225DC6A - _0225DB2E - 2 ; case 2
	.short _0225DC80 - _0225DB2E - 2 ; case 3
	.short _0225DC92 - _0225DB2E - 2 ; case 4
	.short _0225DED4 - _0225DB2E - 2 ; case 5
	.short _0225DF40 - _0225DB2E - 2 ; case 6
	.short _0225E06E - _0225DB2E - 2 ; case 7
	.short _0225E0D0 - _0225DB2E - 2 ; case 8
_0225DB40:
	mov r0, #0
	add r1, r4, #0
	add r2, sp, #0x40
_0225DB46:
	ldrh r3, [r1, #0x24]
	add r1, r1, #2
	strh r3, [r2]
	add r3, r4, r0
	add r3, #0x2c
	ldrb r3, [r3]
	strh r3, [r2, #8]
	add r3, r4, r0
	add r3, #0x30
	ldrb r3, [r3]
	add r0, r0, #1
	strh r3, [r2, #0x10]
	add r2, r2, #2
	cmp r0, #4
	blt _0225DB46
	ldr r0, [r4]
	bl ov12_0223A900
	add r1, r4, #0
	add r1, #0x34
	ldrb r1, [r1]
	add r2, sp, #0x40
	bl ov12_0226885C
	ldrb r0, [r4, #0xa]
	add r0, r0, #1
	strb r0, [r4, #0xa]
_0225DB7C:
	ldr r0, [r4]
	bl ov12_0223A930
	add r6, r0, #0
	mov r0, #1
	lsl r0, r0, #0xa
	add r1, r5, #0
	tst r1, r0
	beq _0225DC00
	ldr r0, [r4]
	bl ov12_0223BB04
	cmp r0, #0
	beq _0225DBA0
	cmp r0, #1
	beq _0225DBCC
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
_0225DBA0:
	mov r0, #2
	add r1, sp, #0x10
	strb r0, [r1, #0xd]
	add r0, r4, #0
	add r0, #0x23
	ldrb r0, [r0]
	ldrb r2, [r4, #9]
	mov r3, #0
	lsl r0, r0, #8
	orr r0, r2
	str r0, [sp, #0x20]
	ldr r0, _0225DED8 ; =0x00000399
	add r2, sp, #0x1c
	strh r0, [r1, #0xe]
	ldr r0, [r4]
	add r1, r6, #0
	bl ov12_0223C494
	mov r0, #3
	add sp, #0x58
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225DBCC:
	mov r1, #0
	add r0, sp, #0x10
	strb r1, [r0, #0xd]
	ldr r0, [r4]
	bl ov12_0223AAC8
	ldr r1, _0225DEDC ; =0x000004CA
	add r1, r0, r1
	add r0, sp, #0x10
	strh r1, [r0, #0xe]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	add r2, sp, #0x1c
	bl ov12_0223C494
	add r1, r4, #0
	add r1, #0x35
	strb r0, [r1]
	mov r0, #2
	add sp, #0x58
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225DC00:
	mov r1, #0x20
	add r2, r5, #0
	tst r2, r1
	beq _0225DC20
	mov r1, #8
	add r0, sp, #0x10
	strb r1, [r0, #0xd]
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl ov12_0223A9AC
	str r0, [sp, #0x20]
	ldr r1, _0225DEE0 ; =0x0000039A
	add r0, sp, #0x10
	strh r1, [r0, #0xe]
	b _0225DC56
_0225DC20:
	lsl r1, r1, #4
	tst r1, r5
	beq _0225DC3E
	mov r1, #8
	add r0, sp, #0x10
	strb r1, [r0, #0xd]
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl ov12_0223A9AC
	str r0, [sp, #0x20]
	ldr r1, _0225DEE4 ; =0x000004C6
	add r0, sp, #0x10
	strh r1, [r0, #0xe]
	b _0225DC56
_0225DC3E:
	add r2, r4, #0
	mov r1, #2
	add r3, sp, #0x10
	strb r1, [r3, #0xd]
	add r2, #0x23
	ldrb r2, [r2]
	ldrb r1, [r4, #9]
	sub r0, #0x67
	lsl r2, r2, #8
	orr r1, r2
	str r1, [sp, #0x20]
	strh r0, [r3, #0xe]
_0225DC56:
	ldr r0, [r4]
	add r1, r6, #0
	add r2, sp, #0x1c
	mov r3, #0
	bl ov12_0223C494
	mov r0, #3
	add sp, #0x58
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225DC6A:
	add r0, r4, #0
	add r0, #0x35
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0225DC9C
	mov r0, #3
	add sp, #0x58
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225DC80:
	ldr r0, [r4, #4]
	bl ov12_02264E84
	ldr r0, [sp, #0xc]
	ldr r1, [r4]
	bl ov12_02261FD4
	mov r0, #4
	strb r0, [r4, #0xa]
_0225DC92:
	add r0, r6, #0
	bl ov12_02266C64
	cmp r0, #0
	bne _0225DC9E
_0225DC9C:
	b _0225E0FA
_0225DC9E:
	mov r0, #7
	mov r1, #5
	bl NARC_ctor
	add r7, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_ctor
	add r5, r0, #0
	ldrb r1, [r4, #9]
	add r0, sp, #0x10
	add r2, r4, #0
	strb r1, [r0, #1]
	add r1, r4, #0
	add r1, #0x34
	ldrb r1, [r1]
	add r2, #0x3b
	strb r1, [r0]
	add r1, r4, #0
	add r1, #0x23
	ldrb r1, [r1]
	strb r1, [r0, #2]
	mov r1, #0x36
	ldrsh r1, [r4, r1]
	strh r1, [r0, #4]
	ldrh r1, [r4, #0x38]
	strh r1, [r0, #6]
	add r1, r4, #0
	add r1, #0x3a
	ldrb r1, [r1]
	strb r1, [r0, #3]
	ldrb r1, [r4, #9]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_0223B580
	add r1, sp, #0x10
	strb r0, [r1, #8]
	ldr r1, _0225DEE8 ; =0x00000197
	ldr r0, [sp, #0xc]
	ldrb r0, [r0, r1]
	cmp r0, #0
	beq _0225DDD2
	add r0, r6, #0
	mov r1, #1
	bl ov12_022698AC
	ldr r0, [r4]
	bl ov12_0223B514
	mov r1, #1
	tst r0, r1
	beq _0225DD20
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #6
	bl ov12_02266508
	b _0225DDC8
_0225DD20:
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #2
	lsl r1, r1, #8
	tst r0, r1
	beq _0225DD44
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #0xa
	bl ov12_02266508
	b _0225DDC8
_0225DD44:
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #0x20
	tst r0, r1
	beq _0225DD66
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #8
	bl ov12_02266508
	b _0225DDC8
_0225DD66:
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #1
	lsl r1, r1, #0xc
	tst r0, r1
	beq _0225DD8A
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #0x14
	bl ov12_02266508
	b _0225DDC8
_0225DD8A:
	add r0, sp, #0x10
	ldrb r0, [r0]
	cmp r0, #4
	bne _0225DDB4
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #8
	tst r0, r1
	bne _0225DDB4
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #4
	bl ov12_02266508
	b _0225DDC8
_0225DDB4:
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #3
	bl ov12_02266508
_0225DDC8:
	ldr r0, [r4]
	mov r1, #1
	bl ov12_0223BB64
	b _0225DE98
_0225DDD2:
	ldr r0, [r4]
	bl ov12_0223B514
	mov r1, #1
	tst r0, r1
	beq _0225DDF4
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #5
	bl ov12_02266508
	b _0225DE90
_0225DDF4:
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #2
	lsl r1, r1, #8
	tst r0, r1
	beq _0225DE18
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #9
	bl ov12_02266508
	b _0225DE90
_0225DE18:
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #0x20
	tst r0, r1
	beq _0225DE3A
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #7
	bl ov12_02266508
	b _0225DE90
_0225DE3A:
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #1
	lsl r1, r1, #0xc
	tst r0, r1
	beq _0225DE5E
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #0x13
	bl ov12_02266508
	b _0225DE90
_0225DE5E:
	add r0, sp, #0x10
	ldrb r0, [r0]
	cmp r0, #4
	beq _0225DE7C
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #1
	bl ov12_02266508
	b _0225DE90
_0225DE7C:
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #2
	bl ov12_02266508
_0225DE90:
	ldr r1, _0225DEE8 ; =0x00000197
	ldr r0, [sp, #0xc]
	mov r2, #1
	strb r2, [r0, r1]
_0225DE98:
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x1c
	bl ov12_02266A50
	add r1, r4, #0
	add r2, r4, #0
	add r0, r6, #0
	add r1, #0x10
	add r2, #0x16
	bl ov12_02266A6C
	add r0, r6, #0
	bl ov12_02266AC0
	add r0, r7, #0
	bl NARC_dtor
	add r0, r5, #0
	bl NARC_dtor
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0225DECC
	bl ov12_02265D70
_0225DECC:
	mov r0, #5
	add sp, #0x58
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225DED4:
	ldr r0, _0225DEEC ; =gSystem
	b _0225DEF0
	.balign 4, 0
_0225DED8: .word 0x00000399
_0225DEDC: .word 0x000004CA
_0225DEE0: .word 0x0000039A
_0225DEE4: .word 0x000004C6
_0225DEE8: .word 0x00000197
_0225DEEC: .word gSystem
_0225DEF0:
	ldr r1, [r0, #0x48]
	mov r0, #8
	tst r0, r1
	beq _0225DF1E
	ldr r0, [r4]
	mov r5, #0
	bl ov12_0223A7F0
	cmp r0, #0
	ble _0225DF1E
_0225DF04:
	ldr r0, [r4]
	add r1, r5, #0
	bl ov12_0223A7E8
	add r0, #0x28
	bl ov12_02264C84
	ldr r0, [r4]
	add r5, r5, #1
	bl ov12_0223A7F0
	cmp r5, r0
	blt _0225DF04
_0225DF1E:
	add r0, r6, #0
	bl ov12_02266B78
	mov r1, #0
	mvn r1, r1
	str r0, [r4, #0xc]
	cmp r0, r1
	beq _0225DF50
	mov r0, #0xa
	strb r0, [r4, #0xb]
	ldr r0, _0225E100 ; =0x000005DD
	bl PlaySE
	mov r0, #6
	add sp, #0x58
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225DF40:
	add r0, r6, #0
	bl ov12_02266C64
	cmp r0, #1
	beq _0225DF52
	ldr r0, [r4, #0xc]
	cmp r0, #1
	beq _0225DF52
_0225DF50:
	b _0225E0FA
_0225DF52:
	ldr r0, [r4, #0xc]
	cmp r0, #4
	bls _0225DF5A
	b _0225E062
_0225DF5A:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225DF66: ; jump table
	.short _0225E062 - _0225DF66 - 2 ; case 0
	.short _0225DF70 - _0225DF66 - 2 ; case 1
	.short _0225DF84 - _0225DF66 - 2 ; case 2
	.short _0225DFD0 - _0225DF66 - 2 ; case 3
	.short _0225E01C - _0225DF66 - 2 ; case 4
_0225DF70:
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #0x22
	lsl r1, r1, #4
	tst r0, r1
	beq _0225E066
	mov r0, #7
	strb r0, [r4, #0xa]
	b _0225E066
_0225DF84:
	mov r0, #7
	mov r1, #5
	bl NARC_ctor
	add r5, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_ctor
	add r7, r0, #0
	mov r3, #0
	str r3, [sp]
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	str r3, [sp, #4]
	bl ov12_02266508
	add r0, r6, #0
	mov r1, #0
	bl ov12_022698AC
	ldr r0, [sp, #8]
	bl ov12_02265D74
	ldr r0, [r4, #4]
	bl ov12_02264EB4
	ldr r0, [sp, #0xc]
	bl ov12_02262014
	add r0, r5, #0
	bl NARC_dtor
	add r0, r7, #0
	bl NARC_dtor
	b _0225E066
_0225DFD0:
	mov r0, #7
	mov r1, #5
	bl NARC_ctor
	add r5, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_ctor
	add r7, r0, #0
	mov r3, #0
	str r3, [sp]
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	str r3, [sp, #4]
	bl ov12_02266508
	add r0, r6, #0
	mov r1, #0
	bl ov12_022698AC
	ldr r0, [sp, #8]
	bl ov12_02265D74
	ldr r0, [r4, #4]
	bl ov12_02264EB4
	ldr r0, [sp, #0xc]
	bl ov12_02262014
	add r0, r5, #0
	bl NARC_dtor
	add r0, r7, #0
	bl NARC_dtor
	b _0225E066
_0225E01C:
	mov r0, #7
	mov r1, #5
	bl NARC_ctor
	add r7, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_ctor
	add r5, r0, #0
	add r0, r6, #0
	bl ov12_0226AC64
	cmp r0, #1
	bne _0225E044
	ldr r0, [sp, #8]
	bl ov12_02265D74
	mov r0, #0xff
	str r0, [r4, #0xc]
_0225E044:
	mov r3, #0
	str r3, [sp]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r6, #0
	str r3, [sp, #4]
	bl ov12_02266508
	add r0, r7, #0
	bl NARC_dtor
	add r0, r5, #0
	bl NARC_dtor
	b _0225E066
_0225E062:
	bl GF_AssertFail
_0225E066:
	mov r0, #8
	add sp, #0x58
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0225E06E:
	add r0, r6, #0
	bl ov12_02266C64
	cmp r0, #1
	bne _0225E0FA
	mov r0, #7
	mov r1, #5
	bl NARC_ctor
	add r5, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_ctor
	add r7, r0, #0
	mov r3, #0
	str r3, [sp]
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	str r3, [sp, #4]
	bl ov12_02266508
	add r0, r6, #0
	mov r1, #0
	bl ov12_022698AC
	ldr r0, [sp, #8]
	bl ov12_02265D74
	ldr r0, [r4, #4]
	bl ov12_02264EB4
	ldr r0, [sp, #0xc]
	bl ov12_02262014
	add r0, r6, #0
	bl ov12_02266B34
	mov r0, #8
	strb r0, [r4, #0xa]
	add r0, r5, #0
	bl NARC_dtor
	add r0, r7, #0
	bl NARC_dtor
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
_0225E0D0:
	add r0, r6, #0
	bl ov12_022698B0
	cmp r0, #1
	bne _0225E0FA
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	ldr r2, [r4, #0xc]
	bl ov12_02262F24
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r7, #0
	bl DestroySysTask
_0225E0FA:
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E100: .word 0x000005DD
	thumb_func_end ov12_0225DAD4

	thumb_func_start ov12_0225E104
ov12_0225E104: ; 0x0225E104
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #9]
	add r5, r0, #0
	ldr r0, [r4]
	bl ov10_022205BC
	add r2, r0, #0
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl ov12_02262F24
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0225E104

	thumb_func_start ov12_0225E134
ov12_0225E134: ; 0x0225E134
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #9]
	add r5, r0, #0
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0225E134

	thumb_func_start ov12_0225E154
ov12_0225E154: ; 0x0225E154
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223B694
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223A7E4
	mov r2, #0
	ldrb r1, [r4, #9]
	add r3, r2, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #0x1a
	bl GetMonBaseStat
	ldr r2, _0225E1CC ; =ov12_0226D140
	lsl r1, r5, #1
	ldrb r2, [r2, r1]
	mul r2, r0
	add r0, r2, #0
	ldr r2, _0225E1D0 ; =ov12_0226D141
	ldrb r1, [r2, r1]
	bl _s32_div_f
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BD98
	mov r1, #0xff
	bl _s32_div_f
	cmp r1, r5
	ldr r0, [r4]
	bgt _0225E1AC
	ldrb r1, [r4, #9]
	mov r2, #4
	bl ov12_02262F24
	b _0225E1B4
_0225E1AC:
	ldrb r1, [r4, #9]
	mov r2, #5
	bl ov12_02262F24
_0225E1B4:
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225E1CC: .word ov12_0226D140
_0225E1D0: .word ov12_0226D141
	thumb_func_end ov12_0225E154

	thumb_func_start ov12_0225E1D4
ov12_0225E1D4: ; 0x0225E1D4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #9]
	add r5, r0, #0
	ldr r0, [r4]
	mov r2, #4
	bl ov12_02262F24
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0225E1D4

	thumb_func_start ov12_0225E1FC
ov12_0225E1FC: ; 0x0225E1FC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #9]
	add r5, r0, #0
	ldr r0, [r4]
	add r2, sp, #0
	bl ov12_0223BE0C
	cmp r0, #1
	bne _0225E216
	ldr r0, [r4]
	bl ov12_02261ED4
_0225E216:
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225E226
	cmp r0, #4
	bhi _0225E226
	cmp r0, #2
	bne _0225E22C
_0225E226:
	ldr r0, [r4]
	bl ov12_02261EB8
_0225E22C:
	add r2, sp, #0
	ldrb r1, [r4, #9]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_02262F24
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0225E1FC

	thumb_func_start ov12_0225E250
ov12_0225E250: ; 0x0225E250
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A7D4
	ldr r0, [r4]
	bl ov12_0223A900
	add r7, r0, #0
	ldrb r1, [r4, #0x1d]
	ldr r0, [r4]
	bl ov12_0223A7E8
	str r0, [sp, #0x10]
	ldrb r1, [r4, #0x1d]
	ldr r0, [r4]
	bl ov12_0223AB6C
	add r1, r0, #0
	ldrb r0, [r4, #0x1d]
	cmp r1, r0
	beq _0225E28A
	ldr r0, [r4]
	bl ov12_0223BC38
	add r5, r0, #0
	b _0225E28C
_0225E28A:
	mov r5, #0
_0225E28C:
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	cmp r0, #3
	bls _0225E298
	b _0225E3D0
_0225E298:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225E2A4: ; jump table
	.short _0225E2AC - _0225E2A4 - 2 ; case 0
	.short _0225E350 - _0225E2A4 - 2 ; case 1
	.short _0225E376 - _0225E2A4 - 2 ; case 2
	.short _0225E3C2 - _0225E2A4 - 2 ; case 3
_0225E2AC:
	add r0, r7, #0
	bl ov12_02266C64
	cmp r0, #0
	bne _0225E2B8
	b _0225E3F8
_0225E2B8:
	ldr r0, [r4]
	bl ov12_0223A930
	add r1, r0, #0
	mov r2, #2
	add r0, sp, #0x14
	strb r2, [r0, #0x15]
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r4, #0x1d]
	lsl r2, r2, #8
	orr r2, r3
	str r2, [sp, #0x2c]
	ldr r2, _0225E3FC ; =0x00000399
	mov r3, #0
	strh r2, [r0, #0x16]
	ldr r0, [r4]
	add r2, sp, #0x28
	bl ov12_0223C494
	add r0, r7, #0
	bl ov12_02266AC0
	mov r0, #7
	mov r1, #5
	bl NARC_ctor
	str r0, [sp, #0xc]
	mov r0, #8
	mov r1, #5
	bl NARC_ctor
	add r5, sp, #0x14
	str r0, [sp, #8]
	mov r2, #0
	add r3, r4, #0
	add r6, r5, #0
_0225E300:
	ldrh r0, [r3, #0xc]
	add r1, r4, r2
	add r2, r2, #1
	strh r0, [r5]
	ldrb r0, [r1, #0x14]
	add r3, r3, #2
	add r5, r5, #2
	strb r0, [r6, #8]
	ldrb r0, [r1, #0x18]
	strb r0, [r6, #0xc]
	add r6, r6, #1
	cmp r2, #4
	blt _0225E300
	ldrb r1, [r4, #0x1e]
	add r0, sp, #0x14
	add r2, r7, #0
	strb r1, [r0, #0x10]
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x14
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	mov r3, #0xb
	bl ov12_02266508
	ldr r0, [sp, #0xc]
	bl NARC_dtor
	ldr r0, [sp, #8]
	bl NARC_dtor
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	add r4, #0x20
	add sp, #0x4c
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225E350:
	add r0, r7, #0
	bl ov12_02266B78
	mov r1, #0
	mvn r1, r1
	str r0, [r4, #8]
	cmp r0, r1
	beq _0225E3F8
	ldr r0, _0225E400 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	add r4, #0x20
	add sp, #0x4c
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225E376:
	ldr r0, [r4, #8]
	cmp r0, #0xff
	beq _0225E3A8
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	bne _0225E3A2
	add r0, r7, #0
	mov r1, #0
	bl ov12_022698AC
	add r0, r5, #0
	bl ov12_02265D74
	ldr r0, [r4, #4]
	bl ov12_02264EB4
	ldr r0, [sp, #0x10]
	bl ov12_02262014
_0225E3A2:
	add r0, r7, #0
	bl ov12_02266B34
_0225E3A8:
	ldrb r1, [r4, #0x1d]
	ldr r0, [r4]
	ldr r2, [r4, #8]
	bl ov12_02262FE0
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	add r4, #0x20
	add sp, #0x4c
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225E3C2:
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x20
	strb r1, [r0]
_0225E3D0:
	add r0, r7, #0
	bl ov12_022698B0
	cmp r0, #1
	bne _0225E3F8
	ldr r0, [r4]
	mov r1, #1
	bl ov12_0223BB10
	ldrb r1, [r4, #0x1d]
	ldrb r2, [r4, #0x1c]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0225E3F8:
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E3FC: .word 0x00000399
_0225E400: .word 0x000005DD
	thumb_func_end ov12_0225E250

	thumb_func_start ov12_0225E404
ov12_0225E404: ; 0x0225E404
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r6, r1, #0
	str r0, [sp, #8]
	ldr r0, [r6]
	bl ov12_0223A7E0
	add r4, r0, #0
	ldr r0, [r6]
	bl ov12_0223A7E4
	str r0, [sp, #0xc]
	ldr r0, _0225E4C8 ; =0x00000101
	tst r0, r4
	bne _0225E43A
	ldr r0, [r6]
	bl ov12_0223B514
	mov r1, #1
	tst r0, r1
	bne _0225E43A
	ldrb r1, [r6, #0x1d]
	ldr r0, [r6]
	bl ov12_0223AB1C
	cmp r0, #0
	bne _0225E44A
_0225E43A:
	ldrb r1, [r6, #0x1d]
	ldr r0, [r6]
	bl ov10_0221BEF4
	cmp r0, #0xff
	beq _0225E4C2
	add r4, r0, #1
	b _0225E4A2
_0225E44A:
	mov r7, #0
	add r4, r7, #0
	add r5, sp, #0x10
_0225E450:
	add r0, r4, #0
	bl MaskOfFlagNo
	ldrh r1, [r6, #0x22]
	tst r0, r1
	bne _0225E462
	add r0, r4, #1
	stmia r5!, {r0}
	add r7, r7, #1
_0225E462:
	add r4, r4, #1
	cmp r4, #4
	blt _0225E450
	ldr r0, [r6]
	bl ov12_0223BD98
	add r1, r7, #0
	bl _s32_div_f
	lsl r1, r1, #2
	add r0, sp, #0x10
	ldr r4, [r0, r1]
	mov r0, #1
	sub r3, r4, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	lsl r3, r3, #1
	add r3, r6, r3
	ldrb r2, [r6, #0x1d]
	ldrh r3, [r3, #0xc]
	ldr r0, [r6]
	ldr r1, [sp, #0xc]
	bl ov12_022506D4
	str r0, [sp]
	ldrb r3, [r6, #0x1d]
	ldr r0, [r6]
	ldr r1, [sp, #0xc]
	mov r2, #0xb
	bl ov12_022582B8
_0225E4A2:
	ldrb r1, [r6, #0x1d]
	ldr r0, [r6]
	add r2, r4, #0
	bl ov12_02262FE0
	ldrb r1, [r6, #0x1d]
	ldrb r2, [r6, #0x1c]
	ldr r0, [r6]
	bl ov12_0226430C
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, [sp, #8]
	bl DestroySysTask
_0225E4C2:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E4C8: .word 0x00000101
	thumb_func_end ov12_0225E404

	thumb_func_start ov12_0225E4CC
ov12_0225E4CC: ; 0x0225E4CC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #0x1d]
	add r5, r0, #0
	ldrb r2, [r4, #0x1c]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0225E4CC

	thumb_func_start ov12_0225E4EC
ov12_0225E4EC: ; 0x0225E4EC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r1, #0
	ldrb r1, [r5, #0x1d]
	add r6, r0, #0
	ldr r0, [r5]
	add r2, sp, #0
	bl ov12_0223BE0C
	cmp r0, #1
	bne _0225E508
	ldr r0, [r5]
	bl ov12_02261ED4
_0225E508:
	add r0, sp, #0
	ldrb r4, [r0]
	cmp r4, #0
	beq _0225E514
	cmp r4, #4
	bls _0225E51C
_0225E514:
	ldr r0, [r5]
	bl ov12_02261EB8
	b _0225E53E
_0225E51C:
	ldr r0, [r5]
	bl ov12_0223A7E4
	ldrb r1, [r5, #0x1d]
	add r2, r4, #5
	mov r3, #0
	bl ov12_0224EDE0
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	beq _0225E538
	ldr r0, _0225E564 ; =0x000001D3
	cmp r1, r0
	bls _0225E53E
_0225E538:
	ldr r0, [r5]
	bl ov12_02261EB8
_0225E53E:
	add r2, sp, #0
	ldrb r1, [r5, #0x1d]
	ldrb r2, [r2]
	ldr r0, [r5]
	bl ov12_02262FE0
	ldrb r1, [r5, #0x1d]
	ldrb r2, [r5, #0x1c]
	ldr r0, [r5]
	bl ov12_0226430C
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0225E564: .word 0x000001D3
	thumb_func_end ov12_0225E4EC

	thumb_func_start ov12_0225E568
ov12_0225E568: ; 0x0225E568
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r4, r1, #0
	str r0, [sp, #8]
	ldr r0, [r4]
	bl ov12_0223A7D4
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl ov12_0223A7E8
	add r7, r0, #0
	ldr r0, [r4]
	bl ov12_0223A900
	add r5, r0, #0
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl ov12_0223AB6C
	add r1, r0, #0
	ldrb r0, [r4, #0xd]
	cmp r1, r0
	beq _0225E5A2
	ldr r0, [r4]
	bl ov12_0223BC38
	add r6, r0, #0
	b _0225E5A4
_0225E5A2:
	mov r6, #0
_0225E5A4:
	ldrb r0, [r4, #0xf]
	cmp r0, #3
	bhi _0225E69A
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225E5B6: ; jump table
	.short _0225E5BE - _0225E5B6 - 2 ; case 0
	.short _0225E642 - _0225E5B6 - 2 ; case 1
	.short _0225E662 - _0225E5B6 - 2 ; case 2
	.short _0225E696 - _0225E5B6 - 2 ; case 3
_0225E5BE:
	add r0, r5, #0
	bl ov12_02266C64
	cmp r0, #0
	bne _0225E5CA
	b _0225E6F4
_0225E5CA:
	mov r0, #7
	mov r1, #5
	bl NARC_ctor
	add r7, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_ctor
	add r2, sp, #0x10
	add r6, r0, #0
	mov r0, #0
	add r1, r4, #0
	add r2, #2
_0225E5E6:
	ldrh r3, [r1, #0x10]
	add r0, r0, #1
	strh r3, [r2]
	ldrh r3, [r1, #0x12]
	strh r3, [r2, #2]
	ldrh r3, [r1, #0x14]
	strh r3, [r2, #4]
	ldrh r3, [r1, #0x16]
	add r1, #8
	strh r3, [r2, #6]
	add r2, #8
	cmp r0, #4
	blt _0225E5E6
	ldrb r1, [r4, #0xe]
	add r0, sp, #0x30
	add r0, #2
	strb r1, [r0]
	ldrh r0, [r4, #0x30]
	ldrb r1, [r4, #0xe]
	bl ov12_02266C84
	add r1, sp, #0x30
	add r1, #2
	strb r0, [r1, #1]
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	add r0, #2
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	mov r3, #0xc
	bl ov12_02266508
	add r0, r7, #0
	bl NARC_dtor
	add r0, r6, #0
	bl NARC_dtor
	ldrb r0, [r4, #0xf]
	add sp, #0x34
	add r0, r0, #1
	strb r0, [r4, #0xf]
	pop {r4, r5, r6, r7, pc}
_0225E642:
	add r0, r5, #0
	bl ov12_02266B78
	mov r1, #0
	mvn r1, r1
	str r0, [r4, #8]
	cmp r0, r1
	beq _0225E6F4
	ldr r0, _0225E6F8 ; =0x000005DD
	bl PlaySE
	ldrb r0, [r4, #0xf]
	add sp, #0x34
	add r0, r0, #1
	strb r0, [r4, #0xf]
	pop {r4, r5, r6, r7, pc}
_0225E662:
	ldr r0, [r4, #8]
	cmp r0, #0xff
	beq _0225E68C
	ldr r0, [r4, #4]
	bl ov12_02264EB4
	add r0, r7, #0
	bl ov12_02262014
	add r0, r6, #0
	bl ov12_02265D74
	add r0, r4, #0
	add r0, #0x32
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225E68C
	add r0, r5, #0
	mov r1, #0
	bl ov12_022698AC
_0225E68C:
	ldrb r0, [r4, #0xf]
	add sp, #0x34
	add r0, r0, #1
	strb r0, [r4, #0xf]
	pop {r4, r5, r6, r7, pc}
_0225E696:
	add r0, r0, #1
	strb r0, [r4, #0xf]
_0225E69A:
	add r0, r5, #0
	bl ov12_022698B0
	cmp r0, #1
	bne _0225E6F4
	ldr r0, [r4]
	ldr r5, [r4, #8]
	bl ov12_0223A7E0
	add r6, r0, #0
	cmp r5, #0xff
	beq _0225E6D4
	ldr r0, [r4]
	add r1, sp, #0xc
	bl ov12_0223C1A0
	mov r0, #2
	tst r0, r6
	ldr r0, [r4, #8]
	beq _0225E6CC
	add r1, r0, #1
	add r0, sp, #0xc
	ldrb r0, [r0, r1]
	add r5, r0, #1
	b _0225E6D4
_0225E6CC:
	sub r1, r0, #1
	add r0, sp, #0xc
	ldrb r0, [r0, r1]
	add r5, r0, #1
_0225E6D4:
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	add r2, r5, #0
	bl ov12_0226311C
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [sp, #8]
	bl DestroySysTask
_0225E6F4:
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E6F8: .word 0x000005DD
	thumb_func_end ov12_0225E568

	thumb_func_start ov12_0225E6FC
ov12_0225E6FC: ; 0x0225E6FC
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	bl ov12_0223A7E4
	add r1, r0, #0
	ldrb r3, [r5, #0xd]
	ldr r0, [r5]
	mov r2, #0xb
	bl ov12_022581D4
	add r4, r0, #1
	cmp r4, #5
	blt _0225E71E
	bl GF_AssertFail
_0225E71E:
	ldrb r1, [r5, #0xd]
	ldr r0, [r5]
	add r2, r4, #0
	bl ov12_0226311C
	ldrb r1, [r5, #0xd]
	ldrb r2, [r5, #0xc]
	ldr r0, [r5]
	bl ov12_0226430C
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0225E6FC

	thumb_func_start ov12_0225E740
ov12_0225E740: ; 0x0225E740
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #0xd]
	add r5, r0, #0
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0225E740

	thumb_func_start ov12_0225E760
ov12_0225E760: ; 0x0225E760
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldrb r1, [r4, #0xd]
	add r7, r0, #0
	ldr r0, [r4]
	add r2, sp, #0
	bl ov12_0223BE0C
	cmp r0, #1
	bne _0225E77A
	ldr r0, [r4]
	bl ov12_02261ED4
_0225E77A:
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225E786
	cmp r0, #4
	bls _0225E78E
_0225E786:
	ldr r0, [r4]
	bl ov12_02261EB8
	b _0225E80C
_0225E78E:
	sub r5, r0, #1
	ldrh r0, [r4, #0x30]
	cmp r0, #0x40
	bgt _0225E7C4
	bge _0225E80C
	cmp r0, #0x10
	bgt _0225E7C0
	bge _0225E80C
	cmp r0, #8
	bhi _0225E80C
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225E7AE: ; jump table
	.short _0225E7E2 - _0225E7AE - 2 ; case 0
	.short _0225E80C - _0225E7AE - 2 ; case 1
	.short _0225E80C - _0225E7AE - 2 ; case 2
	.short _0225E80C - _0225E7AE - 2 ; case 3
	.short _0225E80C - _0225E7AE - 2 ; case 4
	.short _0225E80C - _0225E7AE - 2 ; case 5
	.short _0225E80C - _0225E7AE - 2 ; case 6
	.short _0225E80C - _0225E7AE - 2 ; case 7
	.short _0225E80C - _0225E7AE - 2 ; case 8
_0225E7C0:
	cmp r0, #0x20
	b _0225E80C
_0225E7C4:
	mov r2, #1
	lsl r2, r2, #8
	cmp r0, r2
	bgt _0225E7D2
	bge _0225E80C
	cmp r0, #0x80
	b _0225E80C
_0225E7D2:
	lsl r1, r2, #1
	cmp r0, r1
	bgt _0225E7DC
	beq _0225E7F0
	b _0225E80C
_0225E7DC:
	lsl r1, r2, #2
	cmp r0, r1
	b _0225E80C
_0225E7E2:
	ldrb r0, [r4, #0xd]
	cmp r0, r5
	bne _0225E80C
	ldr r0, [r4]
	bl ov12_02261EB8
	b _0225E80C
_0225E7F0:
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl ov12_0223AB1C
	add r6, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	bl ov12_0223AB1C
	cmp r6, r0
	beq _0225E80C
	ldr r0, [r4]
	bl ov12_02261EB8
_0225E80C:
	add r2, sp, #0
	ldrb r1, [r4, #0xd]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_0226311C
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r7, #0
	bl DestroySysTask
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_0225E760

	thumb_func_start ov12_0225E830
ov12_0225E830: ; 0x0225E830
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0x14
	add r4, r1, #0
	add r7, r0, #0
	ldr r0, [r4]
	bl ov12_0223A938
	ldrb r1, [r4, #0xe]
	add r5, r0, #0
	cmp r1, #0x1e
	bls _0225E84C
	bl _0225F376
_0225E84C:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225E858: ; jump table
	.short _0225E896 - _0225E858 - 2 ; case 0
	.short _0225E8EC - _0225E858 - 2 ; case 1
	.short _0225E978 - _0225E858 - 2 ; case 2
	.short _0225E98C - _0225E858 - 2 ; case 3
	.short _0225E9EA - _0225E858 - 2 ; case 4
	.short _0225EB32 - _0225E858 - 2 ; case 5
	.short _0225EB6E - _0225E858 - 2 ; case 6
	.short _0225EBBE - _0225E858 - 2 ; case 7
	.short _0225ED62 - _0225E858 - 2 ; case 8
	.short _0225EDE0 - _0225E858 - 2 ; case 9
	.short _0225EE1C - _0225E858 - 2 ; case 10
	.short _0225EE3E - _0225E858 - 2 ; case 11
	.short _0225F326 - _0225E858 - 2 ; case 12
	.short _0225EEC4 - _0225E858 - 2 ; case 13
	.short _0225F326 - _0225E858 - 2 ; case 14
	.short _0225EF78 - _0225E858 - 2 ; case 15
	.short _0225F354 - _0225E858 - 2 ; case 16
	.short _0225EE7E - _0225E858 - 2 ; case 17
	.short _0225F326 - _0225E858 - 2 ; case 18
	.short _0225F02A - _0225E858 - 2 ; case 19
	.short _0225F326 - _0225E858 - 2 ; case 20
	.short _0225F070 - _0225E858 - 2 ; case 21
	.short _0225F10A - _0225E858 - 2 ; case 22
	.short _0225F140 - _0225E858 - 2 ; case 23
	.short _0225F354 - _0225E858 - 2 ; case 24
	.short _0225EE7E - _0225E858 - 2 ; case 25
	.short _0225F326 - _0225E858 - 2 ; case 26
	.short _0225F02A - _0225E858 - 2 ; case 27
	.short _0225F326 - _0225E858 - 2 ; case 28
	.short _0225F1B2 - _0225E858 - 2 ; case 29
	.short _0225F354 - _0225E858 - 2 ; case 30
_0225E896:
	ldr r0, [r4]
	bl ov12_0223A900
	bl ov12_0226A8E4
	strb r0, [r4, #0x10]
	ldr r0, [r4]
	bl ov12_0223AB34
	mov r1, #1
	bl sub_0201649C
	mov r1, #0
	mov r2, #3
	str r1, [sp]
	mov r0, #7
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r1, #5
	add r3, r1, #0
	add r0, r5, #0
	lsl r2, r2, #0xa
	sub r3, #0xd
	bl sub_02003370
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0xa
	add r3, r1, #0
	ldr r2, _0225EC14 ; =0x0000FFFF
	add r0, r5, #0
	sub r3, #0x12
	bl sub_02003370
	ldrb r0, [r4, #0xe]
	add sp, #0x1fc
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225E8EC:
	bl sub_02003B44
	cmp r0, #0
	bne _0225E9B4
	ldr r0, [r4]
	bl ov12_02237B0C
	mov r0, #5
	mov r1, #0x34
	bl AllocFromHeap
	str r0, [r4, #4]
	mov r1, #0
	mov r2, #0x34
	bl memset
	ldr r1, [r4]
	ldr r0, [r4, #4]
	str r1, [r0]
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl ov12_0223AA40
	ldr r1, [r4, #4]
	str r0, [r1, #4]
	ldr r0, [r4, #4]
	mov r1, #5
	str r1, [r0, #0xc]
	ldr r0, [r4, #4]
	mov r1, #0
	add r0, #0x26
	strb r1, [r0]
	ldr r0, [r4]
	bl ov12_0223AA80
	ldr r1, [r4, #4]
	str r0, [r1, #8]
	ldrb r1, [r4, #0xd]
	ldr r0, [r4, #4]
	str r1, [r0, #0x10]
	ldr r0, [r4, #4]
	ldrb r1, [r4, #0x10]
	add r0, #0x25
	strb r1, [r0]
	ldr r0, [r4, #4]
	ldrb r1, [r4, #0x14]
	add r0, #0x22
	strb r1, [r0]
	ldr r0, [r4, #4]
	ldrb r1, [r4, #0x15]
	add r0, #0x23
	strb r1, [r0]
	ldr r0, [r4, #4]
	ldrb r1, [r4, #0x16]
	add r0, #0x24
	strb r1, [r0]
	ldrb r0, [r4, #0xd]
	add r0, r4, r0
	add r0, #0x30
	ldrb r1, [r0]
	ldr r0, [r4, #4]
	str r1, [r0, #0x18]
	ldr r0, [r4, #4]
	bl ov08_022225D4
	add sp, #0x1fc
	mov r0, #3
	add sp, #0x14
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225E978:
	ldr r0, [r4, #4]
	ldrb r1, [r4, #0x10]
	add r0, #0x25
	strb r1, [r0]
	ldr r0, [r4, #4]
	bl ov08_022225D4
	ldrb r0, [r4, #0xe]
	add r0, r0, #1
	strb r0, [r4, #0xe]
_0225E98C:
	ldr r1, [r4, #4]
	add r0, r1, #0
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225E9B4
	mov r0, #0
	add r1, #0x26
	strb r0, [r1]
	ldr r0, [r4, #4]
	add r0, #0x25
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	ldr r1, [r4, #4]
	ldrh r0, [r1, #0x1c]
	cmp r0, #0
	beq _0225E9E0
	ldrb r0, [r1, #0x1e]
	cmp r0, #3
	bls _0225E9B8
_0225E9B4:
	bl _0225F376
_0225E9B8:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225E9C4: ; jump table
	.short _0225E9CC - _0225E9C4 - 2 ; case 0
	.short _0225E9CC - _0225E9C4 - 2 ; case 1
	.short _0225E9D6 - _0225E9C4 - 2 ; case 2
	.short _0225E9D6 - _0225E9C4 - 2 ; case 3
_0225E9CC:
	add sp, #0x1fc
	mov r0, #4
	add sp, #0x14
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225E9D6:
	add sp, #0x1fc
	mov r0, #6
	add sp, #0x14
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225E9E0:
	add sp, #0x1fc
	mov r0, #6
	add sp, #0x14
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225E9EA:
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl ov12_0223A7F4
	str r0, [sp, #0x14]
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	beq _0225EA16
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #8
	tst r0, r1
	bne _0225EA16
	ldrb r1, [r4, #0xd]
	mov r0, #1
	add r7, r1, #0
	and r7, r0
	b _0225EA18
_0225EA16:
	ldrb r7, [r4, #0xd]
_0225EA18:
	ldr r0, [r4, #8]
	mov r1, #6
	ldr r0, [r0, #4]
	ldr r0, [r0]
	bl InitPartyWithMaxSize
	ldr r0, [sp, #0x14]
	mov r6, #0
	bl GetPartyCount
	cmp r0, #0
	ble _0225EA66
	mov r0, #6
	mul r0, r7
	add r5, r4, r0
_0225EA36:
	ldrb r2, [r5, #0x18]
	ldr r0, [r4]
	add r1, r7, #0
	bl ov12_0223A880
	add r1, r0, #0
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	ldr r0, [r0]
	bl AddMonToParty
	ldr r1, [r4, #8]
	ldrb r0, [r5, #0x18]
	ldr r1, [r1, #4]
	add r5, r5, #1
	add r1, r1, r6
	add r1, #0x2c
	strb r0, [r1]
	ldr r0, [sp, #0x14]
	add r6, r6, #1
	bl GetPartyCount
	cmp r6, r0
	blt _0225EA36
_0225EA66:
	ldr r0, [r4, #8]
	ldr r1, [r4]
	ldr r0, [r0, #4]
	str r1, [r0, #8]
	ldr r0, [r4, #8]
	mov r1, #5
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	ldr r1, [r4, #8]
	mov r0, #0
	ldr r1, [r1, #4]
	strb r0, [r1, #0x11]
	ldr r1, [r4, #8]
	ldr r1, [r1, #4]
	add r1, #0x36
	strb r0, [r1]
	ldr r1, [r4, #8]
	ldr r1, [r1, #4]
	strh r0, [r1, #0x24]
	ldr r0, [r4, #8]
	mov r1, #2
	ldr r0, [r0, #4]
	add r0, #0x35
	strb r1, [r0]
	ldr r0, [r4, #4]
	ldrh r1, [r0, #0x1c]
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	strh r1, [r0, #0x22]
	ldr r0, [r4, #4]
	ldrb r1, [r0, #0x1e]
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	add r0, #0x33
	strb r1, [r0]
	ldr r0, [r4, #4]
	ldr r1, [r0, #0x10]
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	str r1, [r0, #0x28]
	ldr r0, [r4, #8]
	ldrb r1, [r4, #0x10]
	ldr r0, [r0, #4]
	add r0, #0x32
	strb r1, [r0]
	ldrb r0, [r4, #0xd]
	ldr r2, [r4, #8]
	add r0, r2, r0
	ldrb r1, [r0, #0xc]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x14]
	ldrb r1, [r4, #0xd]
	ldr r5, [r4, #8]
	ldr r0, [r4]
	bl ov12_0223AB6C
	add r0, r5, r0
	ldrb r1, [r0, #0xc]
	ldr r0, [r5, #4]
	strb r1, [r0, #0x15]
	ldrb r0, [r4, #0xf]
	cmp r0, #4
	bne _0225EAFC
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl ov12_0223AB6C
	add r0, r4, r0
	add r0, #0x30
	ldrb r1, [r0]
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	str r1, [r0, #0x18]
	ldrb r0, [r4, #0xd]
	b _0225EB12
_0225EAFC:
	ldrb r0, [r4, #0xd]
	add r0, r4, r0
	add r0, #0x30
	ldrb r1, [r0]
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	str r1, [r0, #0x18]
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl ov12_0223AB6C
_0225EB12:
	add r0, r4, r0
	add r0, #0x30
	ldrb r1, [r0]
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	str r1, [r0, #0x1c]
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	bl ov10_0221BE20
	ldrb r0, [r4, #0xe]
	add sp, #0x1fc
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225EB32:
	ldr r0, [r4, #8]
	ldr r1, [r0, #4]
	add r0, r1, #0
	add r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225EBC6
	add r1, #0x32
	ldrb r0, [r1]
	mov r1, #0
	strb r0, [r4, #0x10]
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	add r0, #0x36
	strb r1, [r0]
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x11]
	cmp r0, #6
	bne _0225EB64
	add sp, #0x1fc
	mov r0, #2
	add sp, #0x14
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225EB64:
	add sp, #0x1fc
	mov r0, #6
	add sp, #0x14
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225EB6E:
	ldr r0, [r4]
	bl ov12_02237BB8
	ldr r0, [r4]
	bl ov12_0223A900
	ldrb r1, [r4, #0x10]
	bl ov12_0226A8EC
	mov r0, #7
	str r0, [sp]
	mov r0, #0
	mov r1, #5
	str r0, [sp, #4]
	mov r2, #3
	add r3, r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	lsl r2, r2, #0xa
	sub r3, #0xd
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	mov r1, #0xa
	str r0, [sp, #4]
	add r3, r1, #0
	str r0, [sp, #8]
	ldr r2, _0225EC14 ; =0x0000FFFF
	add r0, r5, #0
	sub r3, #0x12
	bl sub_02003370
	ldrb r0, [r4, #0xe]
	add sp, #0x1fc
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225EBBE:
	bl sub_02003B44
	cmp r0, #0
	beq _0225EBC8
_0225EBC6:
	b _0225F376
_0225EBC8:
	ldr r0, [r4]
	bl ov12_0223AB34
	mov r1, #0
	bl sub_0201649C
	ldr r0, [r4, #4]
	ldrh r0, [r0, #0x1c]
	cmp r0, #0
	bne _0225EBDE
	b _0225ED4A
_0225EBDE:
	mov r0, #9
	strb r0, [r4, #0xe]
	ldr r0, [r4, #4]
	ldrb r1, [r0, #0x1e]
	cmp r1, #3
	bls _0225EBEC
	b _0225ED4E
_0225EBEC:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225EBF8: ; jump table
	.short _0225EC90 - _0225EBF8 - 2 ; case 0
	.short _0225EC00 - _0225EBF8 - 2 ; case 1
	.short _0225ED44 - _0225EBF8 - 2 ; case 2
	.short _0225ECEE - _0225EBF8 - 2 ; case 3
_0225EC00:
	ldrh r1, [r0, #0x1c]
	ldr r0, _0225EC18 ; =0x0000FFE4
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bhi _0225EC1C
	mov r0, #8
	strb r0, [r4, #0xe]
	b _0225ED4E
	.balign 4, 0
_0225EC14: .word 0x0000FFFF
_0225EC18: .word 0x0000FFE4
_0225EC1C:
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bhs _0225EC3A
	ldr r0, [r4]
	bl ov12_0223A7E0
	cmp r0, #3
	beq _0225EC44
	ldr r0, [r4]
	bl ov12_0223A7E0
	cmp r0, #0x13
	beq _0225EC44
_0225EC3A:
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x11]
	cmp r0, #1
	bhs _0225EC8A
_0225EC44:
	ldr r0, [r4, #4]
	ldrh r0, [r0, #0x1c]
	cmp r0, #0x17
	ldr r0, [r4]
	bne _0225EC6C
	bl ov12_0223B6D4
	cmp r0, #1
	bne _0225EC5C
	mov r0, #0x11
	strh r0, [r4, #0x12]
	b _0225ED4E
_0225EC5C:
	mov r1, #0x74
	ldr r0, _0225EF7C ; =0x000005EC
	mvn r1, r1
	bl sub_0200602C
	mov r0, #0x15
	strh r0, [r4, #0x12]
	b _0225ED4E
_0225EC6C:
	bl ov12_0223B6D4
	cmp r0, #1
	bne _0225EC7A
	mov r0, #0x19
	strh r0, [r4, #0x12]
	b _0225ED4E
_0225EC7A:
	mov r1, #0x74
	ldr r0, _0225EF7C ; =0x000005EC
	mvn r1, r1
	bl sub_0200602C
	mov r0, #0x1d
	strh r0, [r4, #0x12]
	b _0225ED4E
_0225EC8A:
	mov r0, #8
	strb r0, [r4, #0xe]
	b _0225ED4E
_0225EC90:
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bhs _0225ECAE
	ldr r0, [r4]
	bl ov12_0223A7E0
	cmp r0, #3
	beq _0225ECB8
	ldr r0, [r4]
	bl ov12_0223A7E0
	cmp r0, #0x13
	beq _0225ECB8
_0225ECAE:
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x11]
	cmp r0, #1
	bhs _0225ECE8
_0225ECB8:
	ldr r0, [r4, #4]
	mov r1, #0x26
	ldrh r0, [r0, #0x1c]
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0225ECE8
	ldr r0, [r4]
	bl ov12_0223B6D4
	cmp r0, #1
	bne _0225ECD8
	mov r0, #0x11
	strh r0, [r4, #0x12]
	b _0225ED4E
_0225ECD8:
	mov r1, #0x74
	ldr r0, _0225EF7C ; =0x000005EC
	mvn r1, r1
	bl sub_0200602C
	mov r0, #0x15
	strh r0, [r4, #0x12]
	b _0225ED4E
_0225ECE8:
	mov r0, #8
	strb r0, [r4, #0xe]
	b _0225ED4E
_0225ECEE:
	ldrh r1, [r0, #0x1c]
	ldr r0, _0225EF80 ; =0x0000FFC1
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bhi _0225ED02
	mov r0, #8
	strb r0, [r4, #0xe]
	b _0225ED4E
_0225ED02:
	cmp r1, #0x37
	ldr r0, [r4]
	bne _0225ED26
	bl ov12_0223B6D4
	cmp r0, #1
	bne _0225ED16
	mov r0, #0xd
	strh r0, [r4, #0x12]
	b _0225ED4E
_0225ED16:
	mov r1, #0x74
	ldr r0, _0225EF7C ; =0x000005EC
	mvn r1, r1
	bl sub_0200602C
	mov r0, #0xf
	strh r0, [r4, #0x12]
	b _0225ED4E
_0225ED26:
	bl ov12_0223B6D4
	cmp r0, #1
	bne _0225ED34
	mov r0, #0xb
	strh r0, [r4, #0x12]
	b _0225ED4E
_0225ED34:
	mov r1, #0x74
	ldr r0, _0225EF7C ; =0x000005EC
	mvn r1, r1
	bl sub_0200602C
	mov r0, #0xf
	strh r0, [r4, #0x12]
	b _0225ED4E
_0225ED44:
	mov r0, #8
	strb r0, [r4, #0xe]
	b _0225ED4E
_0225ED4A:
	mov r0, #8
	strb r0, [r4, #0xe]
_0225ED4E:
	ldrb r0, [r4, #0xe]
	cmp r0, #8
	beq _0225EE32
	ldr r0, [r4]
	mov r1, #0
	bl ov12_02237ED0
	add sp, #0x1fc
	add sp, #0x14
	pop {r3, r4, r5, r6, r7, pc}
_0225ED62:
	ldr r2, [r4, #4]
	ldrh r0, [r2, #0x1c]
	cmp r0, #0
	bne _0225ED72
	mov r1, #0xff
	add r0, sp, #0x1c
	strh r1, [r0]
	b _0225ED8E
_0225ED72:
	add r1, sp, #0x1c
	strh r0, [r1]
	ldrb r0, [r2, #0x1e]
	strb r0, [r1, #2]
	cmp r0, #1
	bhi _0225ED8E
	ldr r0, [r4, #8]
	ldr r2, [r0, #4]
	ldrb r0, [r2, #0x11]
	add r0, r2, r0
	add r0, #0x2c
	ldrb r0, [r0]
	add r0, r0, #1
	strb r0, [r1, #3]
_0225ED8E:
	add r3, sp, #0x1c
	ldrb r1, [r4, #0xd]
	mov r2, sp
	ldrh r5, [r3]
	ldr r0, [r4]
	sub r2, r2, #4
	strh r5, [r2]
	ldrh r3, [r3, #2]
	strh r3, [r2, #2]
	ldr r2, [r2]
	bl ov12_022632C0
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl ov12_0226430C
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	bl FreeToHeap
	ldr r0, [r4, #8]
	bl FreeToHeap
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add r0, r7, #0
	bl DestroySysTask
	add sp, #0x1fc
	add sp, #0x14
	pop {r3, r4, r5, r6, r7, pc}
_0225EDE0:
	ldr r1, _0225EF84 ; =0x000004B6
	add r0, sp, #0x8c
	strh r1, [r0, #2]
	mov r1, #5
	strb r1, [r0, #1]
	ldr r0, [r4, #4]
	ldrh r0, [r0, #0x1c]
	str r0, [sp, #0x90]
	ldr r0, [r4]
	bl ov12_0223A930
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	add r2, sp, #0x8c
	bl ov12_0223C494
	strb r0, [r4, #0x11]
	mov r0, #0x1e
	strb r0, [r4, #0x17]
	ldrb r0, [r4, #0xe]
	add sp, #0x1fc
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225EE1C:
	ldrb r0, [r4, #0x11]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0225EE32
	ldrb r0, [r4, #0x17]
	sub r0, r0, #1
	strb r0, [r4, #0x17]
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	beq _0225EE34
_0225EE32:
	b _0225F376
_0225EE34:
	ldrh r0, [r4, #0x12]
	add sp, #0x1fc
	add sp, #0x14
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225EE3E:
	ldrb r1, [r4, #0xd]
	mov r0, #9
	add r2, sp, #0x1b8
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl ov12_0223A7E8
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	add r3, sp, #0x1b8
	bl ov12_02261B80
	ldrb r0, [r4, #0xe]
	add sp, #0x1fc
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225EE7E:
	ldr r0, [r4, #8]
	mov r1, #0
	ldr r0, [r0, #4]
	add r2, sp, #0x160
	ldrb r0, [r0, #0x11]
	mov r3, #1
	lsl r5, r0, #1
	mov r0, #9
	str r0, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4]
	bl ov12_022643C8
	ldr r0, [r4]
	add r1, r5, #0
	bl ov12_0223A7E8
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	add r3, sp, #0x160
	bl ov12_02261B80
	ldrb r0, [r4, #0xe]
	add sp, #0x1fc
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225EEC4:
	ldr r0, [r4, #4]
	add r2, sp, #0x108
	ldrh r0, [r0, #0x1c]
	cmp r0, #0x37
	bne _0225EF02
	ldrb r0, [r4, #0xd]
	mov r1, #0
	add r3, r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x36
	str r0, [sp, #0xc]
	ldr r0, [r4]
	bl ov12_022643C8
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl ov12_0223A7E8
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	add r3, sp, #0x108
	bl ov12_02261B80
	b _0225EF6C
_0225EF02:
	cmp r0, #0x38
	bne _0225EF3A
	ldrb r0, [r4, #0xd]
	mov r1, #0
	add r3, r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x74
	str r0, [sp, #0xc]
	ldr r0, [r4]
	bl ov12_022643C8
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl ov12_0223A7E8
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	add r3, sp, #0x108
	bl ov12_02261B80
	b _0225EF6C
_0225EF3A:
	ldrb r1, [r4, #0xd]
	mov r0, #0xc
	mov r3, #1
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	bl ov12_022643C8
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl ov12_0223A7E8
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	add r3, sp, #0x108
	bl ov12_02261B80
_0225EF6C:
	ldrb r0, [r4, #0xe]
	add sp, #0x1fc
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225EF78:
	ldr r2, _0225EF88 ; =0x000004B3
	b _0225EF8C
	.balign 4, 0
_0225EF7C: .word 0x000005EC
_0225EF80: .word 0x0000FFC1
_0225EF84: .word 0x000004B6
_0225EF88: .word 0x000004B3
_0225EF8C:
	add r0, sp, #0x68
	strh r2, [r0, #2]
	mov r1, #0xc
	strb r1, [r0, #1]
	ldrb r1, [r4, #0xd]
	ldr r3, [r4, #8]
	add r3, r3, r1
	ldrb r3, [r3, #0xc]
	lsl r3, r3, #8
	orr r1, r3
	str r1, [sp, #0x6c]
	ldr r1, [r4, #4]
	ldrh r1, [r1, #0x1c]
	sub r1, #0x37
	cmp r1, #7
	bhi _0225EFFE
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225EFB8: ; jump table
	.short _0225EFEC - _0225EFB8 - 2 ; case 0
	.short _0225EFF6 - _0225EFB8 - 2 ; case 1
	.short _0225EFC8 - _0225EFB8 - 2 ; case 2
	.short _0225EFCE - _0225EFB8 - 2 ; case 3
	.short _0225EFD4 - _0225EFB8 - 2 ; case 4
	.short _0225EFDA - _0225EFB8 - 2 ; case 5
	.short _0225EFE0 - _0225EFB8 - 2 ; case 6
	.short _0225EFE6 - _0225EFB8 - 2 ; case 7
_0225EFC8:
	mov r0, #1
	str r0, [sp, #0x70]
	b _0225EFFE
_0225EFCE:
	mov r0, #2
	str r0, [sp, #0x70]
	b _0225EFFE
_0225EFD4:
	mov r0, #3
	str r0, [sp, #0x70]
	b _0225EFFE
_0225EFDA:
	mov r0, #6
	str r0, [sp, #0x70]
	b _0225EFFE
_0225EFE0:
	mov r0, #4
	str r0, [sp, #0x70]
	b _0225EFFE
_0225EFE6:
	mov r0, #5
	str r0, [sp, #0x70]
	b _0225EFFE
_0225EFEC:
	add r1, r2, #1
	strh r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #1]
	b _0225EFFE
_0225EFF6:
	add r1, r2, #2
	strh r1, [r0, #2]
	mov r1, #2
	strb r1, [r0, #1]
_0225EFFE:
	ldr r0, [r4]
	bl ov12_0223A930
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	add r2, sp, #0x68
	bl ov12_0223C494
	strb r0, [r4, #0x11]
	mov r0, #0x1e
	strb r0, [r4, #0x17]
	ldrb r0, [r4, #0xe]
	add sp, #0x1fc
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225F02A:
	ldr r0, [r4, #8]
	mov r1, #0
	ldr r0, [r0, #4]
	add r2, sp, #0xb0
	ldrb r0, [r0, #0x11]
	mov r3, #1
	lsl r5, r0, #1
	mov r0, #0xe
	str r0, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4]
	bl ov12_022643C8
	ldr r0, [r4]
	add r1, r5, #0
	bl ov12_0223A7E8
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	add r3, sp, #0xb0
	bl ov12_02261B80
	ldrb r0, [r4, #0xe]
	add sp, #0x1fc
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225F070:
	ldr r0, [r4, #8]
	ldr r1, [r0, #4]
	ldrb r0, [r1, #0x11]
	lsl r6, r0, #1
	add r0, r1, r0
	add r0, #0x2c
	ldrb r7, [r0]
	ldr r0, [r4]
	add r1, r6, #0
	bl ov12_0223BC38
	mov r1, #0
	mov r2, #1
	add r5, r0, #0
	bl MI_CpuFill8
	ldr r0, [r4]
	add r1, r6, #0
	bl ov12_0223AB0C
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl ov12_0223A7E0
	add r1, r0, #0
	ldr r0, [sp, #0x18]
	bl ov12_02265B64
	add r1, r5, #0
	add r1, #0x25
	strb r0, [r1]
	ldr r0, [r4]
	add r1, r6, #0
	add r2, r7, #0
	bl ov12_0223A880
	mov r1, #0xa3
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	ldr r1, [r4, #8]
	mov r2, #0
	ldr r1, [r1, #4]
	ldrh r1, [r1, #0x20]
	sub r0, r0, r1
	str r0, [r5, #0x28]
	add r0, r6, #0
	mov r1, #0xa4
	bl GetMonData
	str r0, [r5, #0x2c]
	ldr r0, [r4, #8]
	mov r1, #0xa0
	ldr r0, [r0, #4]
	mov r2, #0
	ldrh r0, [r0, #0x20]
	str r0, [r5, #0x30]
	add r0, r6, #0
	bl GetMonData
	cmp r0, #0
	bne _0225F0F6
	add r0, r5, #0
	mov r1, #0
	add r0, #0x4a
	strb r1, [r0]
_0225F0F6:
	ldr r1, [r5, #0x30]
	add r0, r5, #0
	bl ov12_02264DCC
	ldrb r0, [r4, #0xe]
	add sp, #0x1fc
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225F10A:
	ldr r1, [r4, #8]
	ldr r0, [r4]
	ldr r1, [r1, #4]
	ldrb r1, [r1, #0x11]
	lsl r1, r1, #1
	bl ov12_0223BC38
	add r5, r0, #0
	bl ov12_02264E00
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0225F128
	b _0225F376
_0225F128:
	mov r2, #1
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #8
	bl ov12_0226498C
	ldrb r0, [r4, #0xe]
	add sp, #0x1fc
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225F140:
	ldr r0, [r4]
	bl ov12_0223A930
	add r5, r0, #0
	ldr r0, [r4, #8]
	ldr r1, [r0, #4]
	ldrb r0, [r1, #0x11]
	ldrh r1, [r1, #0x20]
	lsl r0, r0, #1
	cmp r1, #0
	add r1, sp, #0x1c
	beq _0225F178
	ldr r2, _0225F37C ; =0x000004BE
	strh r2, [r1, #0x2a]
	mov r2, #0x11
	add r1, sp, #0x44
	strb r2, [r1, #1]
	ldr r1, [r4, #8]
	add r1, r1, r0
	ldrb r1, [r1, #0xc]
	lsl r1, r1, #8
	orr r0, r1
	str r0, [sp, #0x48]
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0x20]
	str r0, [sp, #0x4c]
	b _0225F18E
_0225F178:
	ldr r2, _0225F380 ; =0x000004E2
	strh r2, [r1, #0x2a]
	mov r2, #2
	add r1, sp, #0x44
	strb r2, [r1, #1]
	ldr r1, [r4, #8]
	add r1, r1, r0
	ldrb r1, [r1, #0xc]
	lsl r1, r1, #8
	orr r0, r1
	str r0, [sp, #0x48]
_0225F18E:
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	add r2, sp, #0x44
	bl ov12_0223C494
	strb r0, [r4, #0x11]
	mov r0, #0x1e
	strb r0, [r4, #0x17]
	ldrb r0, [r4, #0xe]
	add sp, #0x1fc
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225F1B2:
	ldr r0, [r4, #8]
	mov r5, #0
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x11]
	lsl r7, r0, #1
	ldr r0, [r4]
	add r1, r7, #0
	bl ov12_0223BC38
	str r0, [sp, #0x10]
	ldr r0, [r4, #8]
	add r1, r7, #0
	ldr r3, [r0, #4]
	ldr r0, [r4]
	ldrb r2, [r3, #0x11]
	add r2, r3, r2
	add r2, #0x2c
	ldrb r2, [r2]
	bl ov12_0223A880
	mov r1, #0xa0
	add r2, r5, #0
	bl GetMonData
	cmp r0, #0
	bne _0225F1EE
	ldr r0, [sp, #0x10]
	add r1, r5, #0
	add r0, #0x4a
	strb r1, [r0]
_0225F1EE:
	ldr r0, [sp, #0x10]
	mov r2, #1
	add r1, r0, #0
	ldr r1, [r1, #0x28]
	lsl r2, r2, #8
	bl ov12_0226498C
	mov r1, #2
	add r0, sp, #0x1c
	strb r1, [r0, #5]
	ldr r0, [r4, #8]
	mov r1, #0xf
	add r0, r0, r7
	ldrb r0, [r0, #0xc]
	mov r2, #5
	lsl r0, r0, #8
	orr r0, r7
	str r0, [sp, #0x24]
	ldr r0, [r4, #4]
	ldrh r0, [r0, #0x1c]
	bl GetItemAttr
	cmp r0, #0
	beq _0225F222
	mov r6, #0
	add r5, r5, #1
_0225F222:
	ldr r0, [r4, #4]
	mov r1, #0x10
	ldrh r0, [r0, #0x1c]
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0225F236
	mov r6, #1
	add r5, r5, #1
_0225F236:
	ldr r0, [r4, #4]
	mov r1, #0x11
	ldrh r0, [r0, #0x1c]
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0225F24A
	mov r6, #2
	add r5, r5, #1
_0225F24A:
	ldr r0, [r4, #4]
	mov r1, #0x12
	ldrh r0, [r0, #0x1c]
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0225F25E
	mov r6, #3
	add r5, r5, #1
_0225F25E:
	ldr r0, [r4, #4]
	mov r1, #0x13
	ldrh r0, [r0, #0x1c]
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0225F272
	mov r6, #4
	add r5, r5, #1
_0225F272:
	ldr r0, [r4, #4]
	mov r1, #0x14
	ldrh r0, [r0, #0x1c]
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0225F286
	mov r6, #5
	add r5, r5, #1
_0225F286:
	ldr r0, [r4, #4]
	mov r1, #0x15
	ldrh r0, [r0, #0x1c]
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0225F29A
	mov r6, #6
	add r5, r5, #1
_0225F29A:
	cmp r5, #1
	beq _0225F2A6
	ldr r1, _0225F384 ; =0x000004CD
	add r0, sp, #0x1c
	strh r1, [r0, #6]
	b _0225F2FA
_0225F2A6:
	cmp r6, #6
	bhi _0225F2FA
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225F2B6: ; jump table
	.short _0225F2C4 - _0225F2B6 - 2 ; case 0
	.short _0225F2CC - _0225F2B6 - 2 ; case 1
	.short _0225F2D4 - _0225F2B6 - 2 ; case 2
	.short _0225F2DC - _0225F2B6 - 2 ; case 3
	.short _0225F2E4 - _0225F2B6 - 2 ; case 4
	.short _0225F2EC - _0225F2B6 - 2 ; case 5
	.short _0225F2F4 - _0225F2B6 - 2 ; case 6
_0225F2C4:
	ldr r1, _0225F388 ; =0x000004BA
	add r0, sp, #0x1c
	strh r1, [r0, #6]
	b _0225F2FA
_0225F2CC:
	ldr r1, _0225F38C ; =0x000004B7
	add r0, sp, #0x1c
	strh r1, [r0, #6]
	b _0225F2FA
_0225F2D4:
	ldr r1, _0225F390 ; =0x000004B9
	add r0, sp, #0x1c
	strh r1, [r0, #6]
	b _0225F2FA
_0225F2DC:
	ldr r1, _0225F394 ; =0x000004BB
	add r0, sp, #0x1c
	strh r1, [r0, #6]
	b _0225F2FA
_0225F2E4:
	ldr r1, _0225F398 ; =0x000004B8
	add r0, sp, #0x1c
	strh r1, [r0, #6]
	b _0225F2FA
_0225F2EC:
	ldr r1, _0225F39C ; =0x000004BC
	add r0, sp, #0x1c
	strh r1, [r0, #6]
	b _0225F2FA
_0225F2F4:
	ldr r1, _0225F3A0 ; =0x000004BD
	add r0, sp, #0x1c
	strh r1, [r0, #6]
_0225F2FA:
	ldr r0, [r4]
	bl ov12_0223A930
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	add r2, sp, #0x20
	bl ov12_0223C494
	strb r0, [r4, #0x11]
	mov r0, #0x1e
	strb r0, [r4, #0x17]
	ldrb r0, [r4, #0xe]
	add sp, #0x1fc
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225F326:
	ldr r0, [r4]
	bl ov12_0223A8DC
	bl ov07_0221C394
	ldr r0, [r4]
	bl ov12_0223A8DC
	bl ov07_0221C3B0
	cmp r0, #0
	bne _0225F376
	ldr r0, [r4]
	bl ov12_0223A8DC
	bl ov07_0221C3C0
	ldrb r0, [r4, #0xe]
	add sp, #0x1fc
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225F354:
	ldrb r0, [r4, #0x11]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0225F376
	ldrb r0, [r4, #0x17]
	sub r0, r0, #1
	strb r0, [r4, #0x17]
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	bne _0225F376
	ldr r0, [r4]
	mov r1, #1
	bl ov12_02237ED0
	mov r0, #8
	strb r0, [r4, #0xe]
_0225F376:
	add sp, #0x1fc
	add sp, #0x14
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225F37C: .word 0x000004BE
_0225F380: .word 0x000004E2
_0225F384: .word 0x000004CD
_0225F388: .word 0x000004BA
_0225F38C: .word 0x000004B7
_0225F390: .word 0x000004B9
_0225F394: .word 0x000004BB
_0225F398: .word 0x000004B8
_0225F39C: .word 0x000004BC
_0225F3A0: .word 0x000004BD
	thumb_func_end ov12_0225E830

	thumb_func_start ov12_0225F3A4
ov12_0225F3A4: ; 0x0225F3A4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #1
	add r3, sp, #0
	strh r0, [r3]
	add r4, r1, #0
	mov r2, sp
	ldrb r1, [r4, #0xd]
	ldrh r6, [r3]
	ldr r0, [r4]
	sub r2, r2, #4
	strh r6, [r2]
	ldrh r3, [r3, #2]
	strh r3, [r2, #2]
	ldr r2, [r2]
	bl ov12_022632C0
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl ov12_0226430C
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	bl FreeToHeap
	ldr r0, [r4, #8]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0225F3A4

	thumb_func_start ov12_0225F3FC
ov12_0225F3FC: ; 0x0225F3FC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #0xd]
	add r5, r0, #0
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl ov12_0226430C
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	bl FreeToHeap
	ldr r0, [r4, #8]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0225F3FC

	thumb_func_start ov12_0225F434
ov12_0225F434: ; 0x0225F434
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	ldrb r1, [r4, #0xd]
	add r5, r0, #0
	ldr r0, [r4]
	add r2, sp, #0
	bl ov12_0223BE0C
	cmp r0, #1
	bne _0225F450
	ldr r0, [r4]
	bl ov12_02261ED4
_0225F450:
	add r0, sp, #0
	ldrb r1, [r0]
	add r2, sp, #0
	strh r1, [r0, #2]
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl ov12_0223BE0C
	cmp r0, #1
	bne _0225F46A
	ldr r0, [r4]
	bl ov12_02261ED4
_0225F46A:
	add r0, sp, #0
	ldrb r1, [r0]
	ldrh r2, [r0, #2]
	lsl r1, r1, #8
	orr r1, r2
	strh r1, [r0, #2]
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	add r2, sp, #0
	bl ov12_0223BE0C
	cmp r0, #1
	bne _0225F48A
	ldr r0, [r4]
	bl ov12_02261ED4
_0225F48A:
	add r3, sp, #0
	ldrb r1, [r3]
	mov r0, #0xf
	mov r2, sp
	and r0, r1
	strb r0, [r3, #4]
	mov r0, #0
	strb r0, [r3, #5]
	ldrb r1, [r4, #0xd]
	ldrh r6, [r3, #2]
	ldr r0, [r4]
	sub r2, r2, #4
	strh r6, [r2]
	ldrh r3, [r3, #4]
	strh r3, [r2, #2]
	ldr r2, [r2]
	bl ov12_022632C0
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl ov12_0226430C
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	bl FreeToHeap
	ldr r0, [r4, #8]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0225F434

	thumb_func_start ov12_0225F4E0
ov12_0225F4E0: ; 0x0225F4E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A938
	ldrb r1, [r4, #0xa]
	add r5, r0, #0
	cmp r1, #3
	bhi _0225F57C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225F502: ; jump table
	.short _0225F50A - _0225F502 - 2 ; case 0
	.short _0225F574 - _0225F502 - 2 ; case 1
	.short _0225F7EA - _0225F502 - 2 ; case 2
	.short _0225F846 - _0225F502 - 2 ; case 3
_0225F50A:
	ldr r0, [r4]
	mov r1, #0
	bl ov12_0223A7D8
	add r6, r0, #0
	mov r1, #0xff
	bl FillWindowPixelBuffer
	add r0, r6, #0
	bl CopyWindowPixelsToVram_TextMode
	ldr r0, [r4]
	bl ov12_0223A900
	bl ov12_0226A8E4
	strb r0, [r4, #0x17]
	ldr r0, [r4]
	bl ov12_0223AB34
	mov r1, #1
	bl sub_0201649C
	mov r1, #0
	mov r2, #3
	str r1, [sp]
	mov r0, #7
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r1, #5
	add r3, r1, #0
	add r0, r5, #0
	lsl r2, r2, #0xa
	sub r3, #0xd
	bl sub_02003370
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0xa
	add r3, r1, #0
	ldr r2, _0225F870 ; =0x0000FFFF
	add r0, r5, #0
	sub r3, #0x12
	bl sub_02003370
	ldrb r0, [r4, #0xa]
	add sp, #0x24
	add r0, r0, #1
	strb r0, [r4, #0xa]
	pop {r4, r5, r6, r7, pc}
_0225F574:
	bl sub_02003B44
	cmp r0, #0
	beq _0225F57E
_0225F57C:
	b _0225F8A6
_0225F57E:
	ldr r0, [r4]
	bl ov12_02237B0C
	mov r0, #5
	mov r1, #0x38
	bl AllocFromHeap
	str r0, [r4, #4]
	mov r0, #5
	bl SavArray_Party_alloc
	ldr r1, [r4, #4]
	str r0, [r1]
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #0xc
	and r0, r1
	cmp r0, #0xc
	beq _0225F5B2
	ldr r0, [r4]
	bl ov12_0223A7E0
	cmp r0, #0xcb
	beq _0225F5B2
	b _0225F6C6
_0225F5B2:
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl ov12_0223AB0C
	cmp r0, #2
	bne _0225F5CE
	ldrb r0, [r4, #9]
	str r0, [sp, #0x18]
	ldr r0, [r4]
	ldr r1, [sp, #0x18]
	bl ov12_0223AB6C
	str r0, [sp, #0x14]
	b _0225F5DC
_0225F5CE:
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl ov12_0223AB6C
	str r0, [sp, #0x18]
	ldrb r0, [r4, #9]
	str r0, [sp, #0x14]
_0225F5DC:
	mov r0, #5
	bl AllocMonZeroed
	add r6, r0, #0
	mov r5, #0
_0225F5E6:
	ldr r0, [r4, #4]
	add r1, r6, #0
	ldr r0, [r0]
	bl AddMonToParty
	add r5, r5, #1
	cmp r5, #6
	blt _0225F5E6
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, [r4]
	ldr r1, [sp, #0x18]
	mov r7, #0
	bl ov12_0223A834
	cmp r0, #0
	ble _0225F64E
	ldr r0, [sp, #0x18]
	mov r1, #6
	mul r1, r0
	add r5, r4, r1
	add r6, r7, #0
_0225F614:
	ldrb r2, [r5, #0x1c]
	ldr r0, [r4]
	ldr r1, [sp, #0x18]
	bl ov12_0223A880
	str r0, [sp, #0x1c]
	ldr r0, [r4, #4]
	add r1, r6, #0
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, [sp, #0x1c]
	bl CopyPokemonToPokemon
	ldr r0, [r4, #4]
	ldrb r1, [r5, #0x1c]
	add r0, r0, r6
	add r0, #0x2c
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, [sp, #0x18]
	add r5, r5, #1
	add r6, r6, #2
	add r7, r7, #1
	bl ov12_0223A834
	cmp r7, r0
	blt _0225F614
_0225F64E:
	ldr r0, [r4]
	ldr r1, [sp, #0x14]
	mov r6, #0
	bl ov12_0223A834
	cmp r0, #0
	ble _0225F6AA
	ldr r0, [sp, #0x14]
	mov r1, #6
	mul r1, r0
	mov r0, #1
	add r5, r4, r1
	str r0, [sp, #0xc]
	add r7, r6, #0
_0225F66A:
	ldrb r2, [r5, #0x1c]
	ldr r0, [r4]
	ldr r1, [sp, #0x14]
	bl ov12_0223A880
	str r0, [sp, #0x20]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0xc]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, [sp, #0x20]
	bl CopyPokemonToPokemon
	ldr r0, [r4, #4]
	ldrb r1, [r5, #0x1c]
	add r0, r0, r7
	add r0, #0x2d
	strb r1, [r0]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	add r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [r4]
	add r5, r5, #1
	add r7, r7, #2
	add r6, r6, #1
	bl ov12_0223A834
	cmp r6, r0
	blt _0225F66A
_0225F6AA:
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl ov12_0223AB0C
	cmp r0, #4
	bne _0225F6BE
	ldr r0, [r4, #4]
	mov r1, #1
	strb r1, [r0, #0x11]
	b _0225F746
_0225F6BE:
	ldr r0, [r4, #4]
	mov r1, #0
	strb r1, [r0, #0x11]
	b _0225F746
_0225F6C6:
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	beq _0225F6E8
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #8
	tst r0, r1
	bne _0225F6E8
	ldrb r1, [r4, #9]
	mov r0, #1
	add r7, r1, #0
	and r7, r0
	b _0225F6EC
_0225F6E8:
	ldrb r1, [r4, #9]
	add r7, r1, #0
_0225F6EC:
	ldr r0, [r4]
	bl ov12_0223AB0C
	cmp r0, #4
	bne _0225F6FA
	mov r1, #1
	b _0225F6FC
_0225F6FA:
	mov r1, #0
_0225F6FC:
	ldr r0, [r4, #4]
	strb r1, [r0, #0x11]
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl ov12_0223A7F4
	str r0, [sp, #0x10]
	mov r6, #0
	bl GetPartyCount
	cmp r0, #0
	ble _0225F746
	mov r0, #6
	mul r0, r7
	add r5, r4, r0
_0225F71A:
	ldrb r2, [r5, #0x1c]
	ldr r0, [r4]
	add r1, r7, #0
	bl ov12_0223A880
	add r1, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0]
	bl AddMonToParty
	ldr r0, [r4, #4]
	ldrb r1, [r5, #0x1c]
	add r0, r0, r6
	add r0, #0x2c
	strb r1, [r0]
	ldr r0, [sp, #0x10]
	add r5, r5, #1
	add r6, r6, #1
	bl GetPartyCount
	cmp r6, r0
	blt _0225F71A
_0225F746:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	str r1, [r0, #8]
	ldr r0, [r4, #4]
	mov r1, #5
	str r1, [r0, #0xc]
	ldr r0, [r4, #4]
	mov r1, #0
	add r0, #0x36
	strb r1, [r0]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #4]
	strh r1, [r0, #0x24]
	ldrb r1, [r4, #0x16]
	ldr r0, [r4, #4]
	strb r1, [r0, #0x12]
	ldr r0, [r4, #4]
	ldrb r1, [r4, #0xb]
	add r0, #0x35
	strb r1, [r0]
	ldrh r1, [r4, #0x14]
	ldr r0, [r4, #4]
	strh r1, [r0, #0x22]
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	str r1, [r0, #0x28]
	ldr r0, [r4, #4]
	ldrb r1, [r4, #0x17]
	add r0, #0x32
	strb r1, [r0]
	ldrb r0, [r4, #9]
	bl MaskOfFlagNo
	ldrb r1, [r4, #0x18]
	tst r0, r1
	bne _0225F796
	ldrb r0, [r4, #9]
	add r0, r4, r0
	ldrb r1, [r0, #0xc]
	b _0225F798
_0225F796:
	mov r1, #6
_0225F798:
	ldr r0, [r4, #4]
	strb r1, [r0, #0x14]
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #8
	tst r0, r1
	beq _0225F7B0
	ldr r0, [r4, #4]
	mov r1, #6
	strb r1, [r0, #0x15]
	b _0225F7DA
_0225F7B0:
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl ov12_0223AB6C
	bl MaskOfFlagNo
	ldrb r1, [r4, #0x18]
	tst r0, r1
	bne _0225F7D4
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl ov12_0223AB6C
	add r0, r4, r0
	ldrb r1, [r0, #0xc]
	ldr r0, [r4, #4]
	strb r1, [r0, #0x15]
	b _0225F7DA
_0225F7D4:
	ldr r0, [r4, #4]
	mov r1, #6
	strb r1, [r0, #0x15]
_0225F7DA:
	ldr r0, [r4, #4]
	bl ov10_0221BE20
	ldrb r0, [r4, #0xa]
	add sp, #0x24
	add r0, r0, #1
	strb r0, [r4, #0xa]
	pop {r4, r5, r6, r7, pc}
_0225F7EA:
	ldr r0, [r4, #4]
	add r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225F8A6
	ldr r0, [r4]
	bl ov12_02237BB8
	ldr r0, [r4]
	bl ov12_0223A900
	ldr r1, [r4, #4]
	add r1, #0x32
	ldrb r1, [r1]
	bl ov12_0226A8EC
	mov r0, #7
	str r0, [sp]
	mov r0, #0
	mov r1, #5
	str r0, [sp, #4]
	mov r2, #3
	add r3, r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	lsl r2, r2, #0xa
	sub r3, #0xd
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	mov r1, #0xa
	str r0, [sp, #4]
	add r3, r1, #0
	str r0, [sp, #8]
	ldr r2, _0225F870 ; =0x0000FFFF
	add r0, r5, #0
	sub r3, #0x12
	bl sub_02003370
	ldrb r0, [r4, #0xa]
	add sp, #0x24
	add r0, r0, #1
	strb r0, [r4, #0xa]
	pop {r4, r5, r6, r7, pc}
_0225F846:
	bl sub_02003B44
	cmp r0, #0
	bne _0225F8A6
	ldr r0, [r4]
	bl ov12_0223AB34
	mov r1, #0
	bl sub_0201649C
	ldr r3, [r4, #4]
	ldr r0, [r4]
	ldrb r2, [r3, #0x11]
	cmp r2, #6
	bne _0225F874
	ldrb r1, [r4, #9]
	mov r2, #0xff
	bl ov12_02263360
	b _0225F882
	nop
_0225F870: .word 0x0000FFFF
_0225F874:
	add r2, r3, r2
	add r2, #0x2c
	ldrb r2, [r2]
	ldrb r1, [r4, #9]
	add r2, r2, #1
	bl ov12_02263360
_0225F882:
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl ov12_0226430C
	ldr r0, [r4, #4]
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0225F8A6:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0225F4E0

	thumb_func_start ov12_0225F8AC
ov12_0225F8AC: ; 0x0225F8AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	str r0, [sp]
	ldr r0, [r5]
	bl ov12_0223A7E0
	mov r1, #0x10
	ldrb r6, [r5, #9]
	tst r1, r0
	bne _0225F8C8
	mov r1, #8
	tst r0, r1
	beq _0225F8CC
_0225F8C8:
	str r6, [sp, #4]
	b _0225F8D6
_0225F8CC:
	ldr r0, [r5]
	add r1, r6, #0
	bl ov12_0223AB6C
	str r0, [sp, #4]
_0225F8D6:
	ldr r0, [r5]
	add r1, r6, #0
	bl ov12_02258BA0
	add r4, r0, #0
	cmp r4, #6
	bne _0225F93A
	ldr r0, [r5]
	add r1, r6, #0
	bl ov12_02258800
	add r4, r0, #0
	cmp r4, #6
	bne _0225F93A
	ldrb r1, [r5, #9]
	ldr r0, [r5]
	bl ov12_0223A7F4
	str r0, [sp, #8]
	mov r4, #0
	bl GetPartyCount
	cmp r0, #0
	ble _0225F93A
	ldr r0, [sp, #4]
	add r7, r5, r6
	add r6, r5, r0
_0225F90C:
	ldrb r1, [r5, #9]
	ldr r0, [r5]
	add r2, r4, #0
	bl ov12_0223A880
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0225F92E
	ldrb r0, [r7, #0xc]
	cmp r4, r0
	beq _0225F92E
	ldrb r0, [r6, #0xc]
	cmp r4, r0
	bne _0225F93A
_0225F92E:
	ldr r0, [sp, #8]
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _0225F90C
_0225F93A:
	ldrb r1, [r5, #9]
	ldr r0, [r5]
	add r2, r4, #1
	bl ov12_02263360
	ldrb r1, [r5, #9]
	ldrb r2, [r5, #8]
	ldr r0, [r5]
	bl ov12_0226430C
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [sp]
	bl DestroySysTask
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0225F8AC

	thumb_func_start ov12_0225F960
ov12_0225F960: ; 0x0225F960
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #9]
	add r5, r0, #0
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0225F960

	thumb_func_start ov12_0225F980
ov12_0225F980: ; 0x0225F980
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r1, #0
	ldrb r1, [r4, #9]
	add r6, r0, #0
	ldr r0, [r4]
	add r2, sp, #0
	bl ov12_0223BE0C
	cmp r0, #1
	bne _0225F99C
	ldr r0, [r4]
	bl ov12_02261ED4
_0225F99C:
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225F9A8
	cmp r0, #6
	bls _0225F9B0
_0225F9A8:
	ldr r0, [r4]
	bl ov12_02261EB8
	b _0225FA18
_0225F9B0:
	ldrb r1, [r4, #9]
	sub r5, r0, #1
	ldr r0, [r4]
	bl ov12_0223A7F4
	ldrb r1, [r4, #9]
	add r1, r4, r1
	ldrb r1, [r1, #0xc]
	cmp r5, r1
	beq _0225F9CA
	ldrb r1, [r4, #0x16]
	cmp r5, r1
	bne _0225F9D2
_0225F9CA:
	ldr r0, [r4]
	bl ov12_02261EB8
	b _0225FA18
_0225F9D2:
	add r1, sp, #0
	ldrb r5, [r1]
	bl GetPartyCount
	cmp r5, r0
	ldr r0, [r4]
	ble _0225F9E6
	bl ov12_02261EB8
	b _0225FA18
_0225F9E6:
	ldrb r1, [r4, #9]
	sub r2, r5, #1
	bl ov12_0223A880
	mov r1, #0xa3
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0225FA02
	ldr r0, [r4]
	bl ov12_02261EB8
_0225FA02:
	add r0, r5, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _0225FA40 ; =0x000001EE
	cmp r0, r1
	bne _0225FA18
	ldr r0, [r4]
	bl ov12_02261EB8
_0225FA18:
	add r2, sp, #0
	ldrb r1, [r4, #9]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_02263360
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0225FA40: .word 0x000001EE
	thumb_func_end ov12_0225F980

	thumb_func_start ov12_0225FA44
ov12_0225FA44: ; 0x0225FA44
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A7D4
	ldr r0, [r4]
	bl ov12_0223A900
	add r5, r0, #0
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl ov12_0223A7E8
	str r0, [sp, #0xc]
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl ov12_0223AB6C
	add r1, r0, #0
	ldrb r0, [r4, #0xd]
	cmp r1, r0
	beq _0225FA7E
	ldr r0, [r4]
	bl ov12_0223BC38
	add r7, r0, #0
	b _0225FA80
_0225FA7E:
	mov r7, #0
_0225FA80:
	ldrb r0, [r4, #0xe]
	cmp r0, #4
	bhi _0225FB00
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225FA92: ; jump table
	.short _0225FA9C - _0225FA92 - 2 ; case 0
	.short _0225FAEC - _0225FA92 - 2 ; case 1
	.short _0225FBC6 - _0225FA92 - 2 ; case 2
	.short _0225FBE4 - _0225FA92 - 2 ; case 3
	.short _0225FC4C - _0225FA92 - 2 ; case 4
_0225FA9C:
	add r0, r5, #0
	bl ov12_02266C64
	cmp r0, #0
	beq _0225FB00
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _0225FAE4
	ldr r0, [r4]
	bl ov12_0223A930
	add r5, r0, #0
	ldrb r0, [r4, #0xf]
	cmp r0, #5
	add r0, sp, #0x10
	bne _0225FAC6
	mov r1, #0x82
	strb r1, [r0, #5]
	ldr r0, [r4, #0x14]
	str r0, [sp, #0x18]
	b _0225FACA
_0225FAC6:
	mov r1, #0
	strb r1, [r0, #5]
_0225FACA:
	ldr r1, [r4, #0x10]
	add r0, sp, #0x10
	strh r1, [r0, #6]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	add r2, sp, #0x14
	bl ov12_0223C494
	strh r0, [r4, #0x1a]
_0225FAE4:
	mov r0, #1
	add sp, #0x38
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225FAEC:
	ldrh r0, [r4, #0x1a]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0225FB02
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _0225FB02
_0225FB00:
	b _0225FC76
_0225FB02:
	mov r0, #7
	mov r1, #5
	bl NARC_ctor
	add r7, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_ctor
	add r6, r0, #0
	add r0, r5, #0
	bl ov12_02266B34
	ldrh r1, [r4, #0x18]
	add r0, sp, #0x10
	strh r1, [r0]
	ldrb r0, [r4, #0xf]
	cmp r0, #5
	bhi _0225FBAE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225FB34: ; jump table
	.short _0225FB40 - _0225FB34 - 2 ; case 0
	.short _0225FB56 - _0225FB34 - 2 ; case 1
	.short _0225FB6C - _0225FB34 - 2 ; case 2
	.short _0225FB82 - _0225FB34 - 2 ; case 3
	.short _0225FB98 - _0225FB34 - 2 ; case 4
	.short _0225FB40 - _0225FB34 - 2 ; case 5
_0225FB40:
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	mov r3, #0xd
	bl ov12_02266508
	b _0225FBB2
_0225FB56:
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	mov r3, #0xe
	bl ov12_02266508
	b _0225FBB2
_0225FB6C:
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	mov r3, #0xf
	bl ov12_02266508
	b _0225FBB2
_0225FB82:
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	mov r3, #0x10
	bl ov12_02266508
	b _0225FBB2
_0225FB98:
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	mov r3, #0x11
	bl ov12_02266508
	b _0225FBB2
_0225FBAE:
	bl GF_AssertFail
_0225FBB2:
	mov r0, #2
	strb r0, [r4, #0xe]
	add r0, r7, #0
	bl NARC_dtor
	add r0, r6, #0
	bl NARC_dtor
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
_0225FBC6:
	add r0, r5, #0
	bl ov12_02266B78
	mov r1, #0
	mvn r1, r1
	str r0, [r4, #8]
	cmp r0, r1
	beq _0225FC76
	ldr r0, _0225FC7C ; =0x000005DD
	bl PlaySE
	mov r0, #3
	add sp, #0x38
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0225FBE4:
	add r0, r5, #0
	bl ov12_02266C64
	cmp r0, #1
	bne _0225FC76
	mov r0, #7
	mov r1, #5
	bl NARC_ctor
	str r0, [sp, #8]
	mov r0, #8
	mov r1, #5
	bl NARC_ctor
	add r6, r0, #0
	ldr r0, [r4, #4]
	bl ov12_02264EB4
	ldr r0, [sp, #0xc]
	bl ov12_02262014
	add r0, r7, #0
	bl ov12_02265D74
	add r0, r5, #0
	bl ov12_02266B34
	mov r3, #0
	str r3, [sp]
	ldr r0, [sp, #8]
	str r3, [sp, #4]
	add r1, r6, #0
	add r2, r5, #0
	bl ov12_02266508
	ldr r0, [r4, #8]
	cmp r0, #1
	bne _0225FC38
	add r0, r5, #0
	mov r1, #0
	bl ov12_022698AC
_0225FC38:
	mov r0, #4
	strb r0, [r4, #0xe]
	ldr r0, [sp, #8]
	bl NARC_dtor
	add r0, r6, #0
	bl NARC_dtor
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
_0225FC4C:
	add r0, r5, #0
	bl ov12_022698B0
	cmp r0, #1
	bne _0225FC76
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	ldr r2, [r4, #8]
	bl ov12_02262F24
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0225FC76:
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225FC7C: .word 0x000005DD
	thumb_func_end ov12_0225FA44

	thumb_func_start ov12_0225FC80
ov12_0225FC80: ; 0x0225FC80
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #0xd]
	add r5, r0, #0
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0225FC80

	thumb_func_start ov12_0225FCA0
ov12_0225FCA0: ; 0x0225FCA0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #0xd]
	add r5, r0, #0
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0225FCA0

	thumb_func_start ov12_0225FCC0
ov12_0225FCC0: ; 0x0225FCC0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #0xd]
	add r5, r0, #0
	ldr r0, [r4]
	add r2, sp, #0
	bl ov12_0223BE0C
	cmp r0, #1
	bne _0225FCDA
	ldr r0, [r4]
	bl ov12_02261ED4
_0225FCDA:
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225FCEA
	cmp r0, #0xff
	beq _0225FCF0
	cmp r0, #1
	beq _0225FCF0
_0225FCEA:
	ldr r0, [r4]
	bl ov12_02261EB8
_0225FCF0:
	add r2, sp, #0
	ldrb r1, [r4, #0xd]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_02262F24
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0225FCC0

	thumb_func_start ov12_0225FD14
ov12_0225FD14: ; 0x0225FD14
	push {r3, r4, r5, lr}
	sub sp, #0x1fc
	sub sp, #0x14
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x6a
	ldrb r0, [r0]
	cmp r0, #0xa
	bls _0225FD2A
	b _0225FF78
_0225FD2A:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225FD36: ; jump table
	.short _0225FD4C - _0225FD36 - 2 ; case 0
	.short _0225FF56 - _0225FD36 - 2 ; case 1
	.short _0225FDA6 - _0225FD36 - 2 ; case 2
	.short _0225FF56 - _0225FD36 - 2 ; case 3
	.short _0225FE02 - _0225FD36 - 2 ; case 4
	.short _0225FF56 - _0225FD36 - 2 ; case 5
	.short _0225FE50 - _0225FD36 - 2 ; case 6
	.short _0225FF56 - _0225FD36 - 2 ; case 7
	.short _0225FED8 - _0225FD36 - 2 ; case 8
	.short _0225FF56 - _0225FD36 - 2 ; case 9
	.short _0225FF34 - _0225FD36 - 2 ; case 10
_0225FD4C:
	ldrh r0, [r4, #0x1e]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0225FD9A
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	bne _0225FD9A
	ldr r0, [r4, #8]
	mov r1, #6
	bl sub_02008A78
	cmp r0, #0
	bne _0225FD9A
	add r0, r4, #0
	add r0, #0x69
	ldrb r1, [r0]
	mov r0, #0xf
	add r2, sp, #0x1b8
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0xc]
	add r3, sp, #0x1b8
	bl ov12_02261B80
	add sp, #0x1fc
	mov r0, #1
	add r4, #0x6a
	add sp, #0x14
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225FD9A:
	add sp, #0x1fc
	mov r0, #4
	add r4, #0x6a
	add sp, #0x14
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225FDA6:
	add r3, r4, #0
	add r3, #0x69
	ldrb r3, [r3]
	ldr r0, [r4]
	add r1, #0x10
	add r2, sp, #0x168
	bl ov12_02261CA8
	add r0, sp, #0x168
	mov r1, #5
	bl ov07_0223494C
	add r0, r4, #0
	add r0, #0x69
	ldrb r1, [r0]
	mov r0, #0x10
	add r2, sp, #0x110
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0xc]
	add r3, sp, #0x110
	bl ov12_02261B80
	mov r0, #0x1a
	add sp, #0x1fc
	ldr r1, [r4, #4]
	mov r2, #0
	lsl r0, r0, #4
	str r2, [r1, r0]
	add r0, r4, #0
	add r0, #0x6a
	ldrb r0, [r0]
	add r4, #0x6a
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225FE02:
	ldr r0, [r4]
	mov r1, #2
	bl ov12_0223BD3C
	add r0, r4, #0
	add r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225FE1A
	ldr r0, [r4]
	bl ov12_0223BCC8
_0225FE1A:
	add r0, r4, #0
	add r0, #0x6c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225FE30
	ldr r0, [r4]
	bl ov12_0223A8D4
	mov r1, #1
	bl sub_020094D8
_0225FE30:
	add r3, r4, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0xc]
	add r3, #0x10
	bl ov12_02261B80
	add r0, r4, #0
	add r0, #0x6a
	ldrb r0, [r0]
	add sp, #0x1fc
	add r4, #0x6a
	add r0, r0, #1
	add sp, #0x14
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225FE50:
	ldr r0, [r4]
	mov r1, #0
	bl ov12_0223BD3C
	add r0, r4, #0
	add r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225FE68
	ldr r0, [r4]
	bl ov12_0223BC98
_0225FE68:
	add r0, r4, #0
	add r0, #0x6c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225FE7E
	ldr r0, [r4]
	bl ov12_0223A8D4
	mov r1, #1
	bl sub_020094E4
_0225FE7E:
	ldrh r0, [r4, #0x1e]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0225FECC
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	bne _0225FECC
	ldr r0, [r4, #8]
	mov r1, #6
	bl sub_02008A78
	cmp r0, #0
	bne _0225FECC
	add r0, r4, #0
	add r0, #0x69
	ldrb r1, [r0]
	mov r0, #0xf
	add r2, sp, #0xb8
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0xc]
	add r3, sp, #0xb8
	bl ov12_02261B80
	add sp, #0x1fc
	mov r0, #7
	add r4, #0x6a
	add sp, #0x14
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225FECC:
	add sp, #0x1fc
	mov r0, #0xa
	add r4, #0x6a
	add sp, #0x14
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225FED8:
	add r3, r4, #0
	add r3, #0x69
	ldrb r3, [r3]
	ldr r0, [r4]
	add r1, #0x10
	add r2, sp, #0x68
	bl ov12_02261CA8
	add r0, sp, #0x68
	mov r1, #5
	bl ov07_02234A20
	add r0, r4, #0
	add r0, #0x69
	ldrb r1, [r0]
	mov r0, #0x10
	add r2, sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0xc]
	add r3, sp, #0x10
	bl ov12_02261B80
	mov r0, #0x1a
	add sp, #0x1fc
	ldr r1, [r4, #4]
	mov r2, #1
	lsl r0, r0, #4
	str r2, [r1, r0]
	add r0, r4, #0
	add r0, #0x6a
	ldrb r0, [r0]
	add r4, #0x6a
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225FF34:
	add r2, r4, #0
	add r1, #0x69
	add r2, #0x68
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	add sp, #0x1fc
	add sp, #0x14
	pop {r3, r4, r5, pc}
_0225FF56:
	ldr r0, [r4, #0xc]
	bl ov07_0221C394
	ldr r0, [r4, #0xc]
	bl ov07_0221C3B0
	cmp r0, #0
	bne _0225FF78
	ldr r0, [r4, #0xc]
	bl ov07_0221C3C0
	add r0, r4, #0
	add r0, #0x6a
	ldrb r0, [r0]
	add r4, #0x6a
	add r0, r0, #1
	strb r0, [r4]
_0225FF78:
	add sp, #0x1fc
	add sp, #0x14
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0225FD14

	thumb_func_start ov12_0225FF80
ov12_0225FF80: ; 0x0225FF80
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #9]
	cmp r0, #6
	bhs _0225FFBA
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _0225FFB4
	mov r0, #2
	strb r0, [r4, #0xa]
	ldrb r0, [r4, #9]
	mov r1, #6
	add r0, r0, #1
	strb r0, [r4, #9]
	ldr r0, [r4, #4]
	bl sub_02008A78
	add r3, r0, #0
	mov r2, #1
	ldr r0, [r4, #4]
	mov r1, #6
	eor r2, r3
	bl sub_020087A4
	pop {r3, r4, r5, pc}
_0225FFB4:
	sub r0, r0, #1
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, pc}
_0225FFBA:
	ldr r0, [r4, #4]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	ldrb r1, [r4, #8]
	ldr r0, [r4]
	mov r2, #0x17
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0225FF80

	thumb_func_start ov12_0225FFDC
ov12_0225FFDC: ; 0x0225FFDC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0225FFEE
	cmp r0, #1
	beq _0225FFFC
	b _02260012
_0225FFEE:
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	bl ov12_02264DCC
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_0225FFFC:
	add r0, r4, #0
	bl ov12_02264E00
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0226002C
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02260012:
	add r2, r4, #0
	add r1, #0x24
	add r2, #0x4c
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4, #0xc]
	bl ov12_0226430C
	mov r0, #0
	str r0, [r4, #0x10]
	add r0, r5, #0
	bl DestroySysTask
_0226002C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0225FFDC

	thumb_func_start ov12_02260030
ov12_02260030: ; 0x02260030
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02260046
	cmp r0, #1
	beq _02260062
	cmp r0, #2
	beq _022600A8
	b _022600CE
_02260046:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4e
	strb r1, [r0]
	ldr r0, _022600EC ; =0x0000070B
	bl PlaySE
	ldr r1, [r4, #0x40]
	add r0, r4, #0
	bl ov12_02264E34
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02260062:
	add r0, r4, #0
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #8
	bhs _0226007A
	add r0, r4, #0
	add r0, #0x4e
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4e
	strb r1, [r0]
_0226007A:
	add r0, r4, #0
	bl ov12_02264E68
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _022600E8
	add r0, r4, #0
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #8
	blo _022600A0
	ldr r0, _022600EC ; =0x0000070B
	mov r1, #0
	bl StopSE
	mov r0, #0x64
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_022600A0:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_022600A8:
	add r0, r4, #0
	add r0, #0x4e
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4e
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #8
	blo _022600E8
	ldr r0, _022600EC ; =0x0000070B
	mov r1, #0
	bl StopSE
	mov r0, #0x64
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_022600CE:
	add r2, r4, #0
	add r1, #0x24
	add r2, #0x4c
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4, #0xc]
	bl ov12_0226430C
	mov r0, #0
	str r0, [r4, #0x10]
	add r0, r5, #0
	bl DestroySysTask
_022600E8:
	pop {r3, r4, r5, pc}
	nop
_022600EC: .word 0x0000070B
	thumb_func_end ov12_02260030

	thumb_func_start ov12_022600F0
ov12_022600F0: ; 0x022600F0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x114
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	add r1, r4, #0
	add r1, #0x66
	ldrb r1, [r1]
	add r5, r0, #0
	cmp r1, #0xa
	bls _0226010C
	b _02260374
_0226010C:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02260118: ; jump table
	.short _0226012E - _02260118 - 2 ; case 0
	.short _022601D6 - _02260118 - 2 ; case 1
	.short _0226017A - _02260118 - 2 ; case 2
	.short _022601D6 - _02260118 - 2 ; case 3
	.short _022601FA - _02260118 - 2 ; case 4
	.short _0226024C - _02260118 - 2 ; case 5
	.short _02260266 - _02260118 - 2 ; case 6
	.short _022602A2 - _02260118 - 2 ; case 7
	.short _022602CE - _02260118 - 2 ; case 8
	.short _0226030E - _02260118 - 2 ; case 9
	.short _02260356 - _02260118 - 2 ; case 10
_0226012E:
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	cmp r0, #0
	beq _02260170
	add r0, r4, #0
	add r0, #0x65
	ldrb r1, [r0]
	mov r0, #0xf
	add r2, sp, #0xbc
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0xbc
	bl ov12_02261B80
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r4, #0x66
	add sp, #0x114
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02260170:
	mov r0, #4
	add r4, #0x66
	add sp, #0x114
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0226017A:
	add r3, r4, #0
	add r3, #0x65
	ldrb r3, [r3]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0xc
	add r2, sp, #0x6c
	bl ov12_02261CA8
	add r0, sp, #0x6c
	mov r1, #5
	bl ov07_0223494C
	add r0, r4, #0
	add r0, #0x65
	ldrb r1, [r0]
	mov r0, #0x10
	add r2, sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x14
	bl ov12_02261B80
	mov r0, #0x1a
	ldr r1, [r4, #4]
	mov r2, #0
	lsl r0, r0, #4
	str r2, [r1, r0]
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r4, #0x66
	add sp, #0x114
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_022601D6:
	bl ov07_0221C394
	add r0, r5, #0
	bl ov07_0221C3B0
	cmp r0, #0
	bne _02260254
	add r0, r5, #0
	bl ov07_0221C3C0
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r4, #0x66
	add sp, #0x114
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_022601FA:
	add r0, r4, #0
	add r0, #0x67
	ldrb r0, [r0]
	cmp r0, #2
	bne _02260208
	mov r5, #0x75
	b _0226020C
_02260208:
	mov r5, #0x74
	mvn r5, r5
_0226020C:
	add r1, r4, #0
	add r1, #0x65
	ldrb r1, [r1]
	ldr r0, [r4]
	bl ov12_0223B758
	str r5, [sp]
	mov r1, #0x7f
	str r1, [sp, #4]
	add r1, r4, #0
	add r1, #0x72
	ldrh r1, [r1]
	add r3, r4, #0
	mov r2, #0
	str r1, [sp, #8]
	mov r1, #5
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	add r2, r4, #0
	add r2, #0x68
	add r3, #0x6b
	ldrh r2, [r2]
	ldrb r3, [r3]
	bl sub_0207204C
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
_0226024C:
	bl IsCryFinished
	cmp r0, #0
	beq _02260256
_02260254:
	b _02260374
_02260256:
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r4, #0x66
	add sp, #0x114
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02260266:
	add r0, r4, #0
	add r0, #0x67
	ldrb r0, [r0]
	cmp r0, #2
	ldr r0, _02260378 ; =0x00000703
	bne _0226027A
	mov r1, #0x75
	bl sub_0200602C
	b _02260282
_0226027A:
	mov r1, #0x74
	mvn r1, r1
	bl sub_0200602C
_02260282:
	ldr r0, [r4, #8]
	mov r1, #0x29
	bl sub_02008A78
	cmp r0, #0
	ble _02260298
	mov r0, #7
	add r4, #0x66
	add sp, #0x114
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02260298:
	mov r0, #8
	add r4, #0x66
	add sp, #0x114
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_022602A2:
	ldr r0, [r4, #8]
	mov r1, #0x29
	bl sub_02008A78
	add r5, r0, #0
	sub r5, #8
	bpl _022602B2
	mov r5, #0
_022602B2:
	ldr r0, [r4, #8]
	mov r1, #0x29
	add r2, r5, #0
	bl sub_020087A4
	cmp r5, #0
	bne _02260374
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
_022602CE:
	ldr r0, [r4, #0x6c]
	add r1, r4, #0
	str r0, [sp]
	add r0, r4, #0
	add r2, r4, #0
	add r3, r4, #0
	add r0, #0x68
	add r1, #0x6a
	add r2, #0x67
	add r3, #0x6b
	ldrh r0, [r0]
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldrb r3, [r3]
	bl sub_020708D8
	mov r3, #0x50
	sub r0, r3, r0
	str r0, [sp]
	mov r1, #0
	ldr r0, [r4, #8]
	add r2, r1, #0
	bl sub_0200908C
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r4, #0x66
	add sp, #0x114
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0226030E:
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02008A78
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #1
	add r2, #8
	bl sub_020087A4
	ldr r0, [r4, #8]
	mov r1, #0x12
	bl sub_02008A78
	add r5, r0, #0
	sub r5, #8
	bpl _02260332
	mov r5, #0
_02260332:
	ldr r0, [r4, #8]
	mov r1, #0x12
	add r2, r5, #0
	bl sub_020087A4
	cmp r5, #0
	bne _02260374
	ldr r0, [r4, #8]
	bl sub_02008780
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r4, #0x66
	add sp, #0x114
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02260356:
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0x65
	add r2, #0x64
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_02260374:
	add sp, #0x114
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02260378: .word 0x00000703
	thumb_func_end ov12_022600F0

	thumb_func_start ov12_0226037C
ov12_0226037C: ; 0x0226037C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	bl ov12_0223A938
	add r4, r0, #0
	ldr r0, [r5]
	bl ov12_0223A8D4
	add r7, r0, #0
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _022603A6
	cmp r0, #1
	beq _022603E4
	cmp r0, #2
	beq _022603F8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_022603A6:
	ldr r0, [r5]
	bl ov12_0223AB34
	mov r1, #1
	bl sub_0201649C
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, _02260414 ; =0x0000FFFF
	add r0, r4, #0
	mov r1, #0xf
	mov r3, #1
	bl sub_02003370
	mov r1, #0
	add r0, r7, #0
	mov r2, #0x10
	add r3, r1, #0
	str r1, [sp]
	bl sub_020090E4
	mov r0, #0
	mov r1, #0x10
	bl GF_SndStartFadeOutBGM
	ldrb r0, [r5, #6]
	add r0, r0, #1
	strb r0, [r5, #6]
_022603E4:
	add r0, r4, #0
	bl sub_02003B44
	cmp r0, #0
	bne _0226040E
	ldrb r0, [r5, #6]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r5, #6]
	pop {r4, r5, r6, r7, pc}
_022603F8:
	ldrb r1, [r5, #5]
	ldrb r2, [r5, #4]
	ldr r0, [r5]
	bl ov12_0226430C
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0226040E:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02260414: .word 0x0000FFFF
	thumb_func_end ov12_0226037C

	thumb_func_start ov12_02260418
ov12_02260418: ; 0x02260418
	push {r4, r5, r6, lr}
	sub sp, #0x110
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	add r1, r4, #0
	add r1, #0x62
	ldrb r1, [r1]
	add r5, r0, #0
	cmp r1, #4
	bls _02260434
	b _02260560
_02260434:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02260440: ; jump table
	.short _0226044A - _02260440 - 2 ; case 0
	.short _0226048C - _02260440 - 2 ; case 1
	.short _0226053C - _02260440 - 2 ; case 2
	.short _022604E0 - _02260440 - 2 ; case 3
	.short _0226053C - _02260440 - 2 ; case 4
_0226044A:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _02260482
	add r2, r4, #0
	add r2, #0x63
	ldrb r2, [r2]
	mov r1, #6
	bl sub_020087A4
	add r0, r4, #0
	add r0, #0x63
	ldrb r0, [r0]
	cmp r0, #1
	bne _02260472
	mov r0, #0xff
	add r4, #0x62
	add sp, #0x110
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_02260472:
	add r0, r4, #0
	add r0, #0x62
	ldrb r0, [r0]
	add r4, #0x62
	add sp, #0x110
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_02260482:
	mov r0, #0xff
	add r4, #0x62
	add sp, #0x110
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0226048C:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	beq _022604D6
	mov r0, #0x1a
	ldr r1, [r4, #4]
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _022604D6
	add r0, r4, #0
	add r0, #0x61
	ldrb r1, [r0]
	mov r0, #0xf
	add r2, sp, #0xb8
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0xb8
	bl ov12_02261B80
	add r0, r4, #0
	add r0, #0x62
	ldrb r0, [r0]
	add r4, #0x62
	add sp, #0x110
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_022604D6:
	mov r0, #0xff
	add r4, #0x62
	add sp, #0x110
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_022604E0:
	add r3, r4, #0
	add r3, #0x61
	ldrb r3, [r3]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #8
	add r2, sp, #0x68
	bl ov12_02261CA8
	add r0, sp, #0x68
	mov r1, #5
	bl ov07_02234A20
	add r0, r4, #0
	add r0, #0x61
	ldrb r1, [r0]
	mov r0, #0x10
	add r2, sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl ov12_022643C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x10
	bl ov12_02261B80
	mov r0, #0x1a
	ldr r1, [r4, #4]
	mov r2, #1
	lsl r0, r0, #4
	str r2, [r1, r0]
	add r0, r4, #0
	add r0, #0x62
	ldrb r0, [r0]
	add r4, #0x62
	add sp, #0x110
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0226053C:
	bl ov07_0221C394
	add r0, r5, #0
	bl ov07_0221C3B0
	cmp r0, #0
	bne _0226057E
	add r0, r5, #0
	bl ov07_0221C3C0
	add r0, r4, #0
	add r0, #0x62
	ldrb r0, [r0]
	add r4, #0x62
	add sp, #0x110
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_02260560:
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0x61
	add r2, #0x60
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0226057E:
	add sp, #0x110
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_02260418

	thumb_func_start ov12_02260584
ov12_02260584: ; 0x02260584
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	beq _02260596
	cmp r0, #1
	beq _022605AC
	pop {r3, r4, r5, pc}
_02260596:
	ldr r0, [r4, #4]
	add r1, #0xb
	bl ov12_02265C54
	ldr r0, _022605CC ; =0x0000070C
	bl PlaySE
	ldrb r0, [r4, #0xa]
	add r0, r0, #1
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, pc}
_022605AC:
	ldrb r0, [r4, #0xb]
	cmp r0, #1
	bne _022605C8
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_022605C8:
	pop {r3, r4, r5, pc}
	nop
_022605CC: .word 0x0000070C
	thumb_func_end ov12_02260584

	thumb_func_start ov12_022605D0
ov12_022605D0: ; 0x022605D0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BB78
	cmp r0, #0
	beq _022605F2
	ldr r0, [r4]
	bl ov12_0223BB78
	bl sub_0200F450
	ldr r0, [r4]
	mov r1, #0
	bl ov12_0223BB80
_022605F2:
	ldrb r0, [r4, #6]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02260612
	ldrb r1, [r4, #5]
	ldrb r2, [r4, #4]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_02260612:
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_022605D0

	thumb_func_start ov12_02260614
ov12_02260614: ; 0x02260614
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _02260626
	cmp r0, #1
	beq _0226063C
	pop {r3, r4, r5, pc}
_02260626:
	ldrb r0, [r4, #6]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02260666
	ldrb r0, [r4, #7]
	add r0, r0, #1
	strb r0, [r4, #7]
	mov r0, #0
	strb r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0226063C:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	ldrb r0, [r4, #8]
	cmp r0, #0x28
	bne _02260666
	ldrb r1, [r4, #5]
	ldr r0, [r4]
	bl ov12_02263A00
	ldrb r1, [r4, #5]
	ldrb r2, [r4, #4]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_02260666:
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02260614

	thumb_func_start ov12_02260668
ov12_02260668: ; 0x02260668
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A7D4
	ldr r0, [r4]
	bl ov12_0223A938
	add r7, r0, #0
	ldr r0, [r4]
	bl ov12_0223AB40
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223AB54
	lsl r1, r0, #2
	ldr r0, _022609DC ; =ov12_0226D18C
	ldr r0, [r0, r1]
	str r0, [sp, #0xc]
	ldrb r0, [r4, #0x15]
	add r0, r0, #1
	strb r0, [r4, #0x15]
	ldrb r0, [r4, #0x14]
	cmp r0, #5
	bls _022606A2
	b _022609D8
_022606A2:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022606AE: ; jump table
	.short _022606BA - _022606AE - 2 ; case 0
	.short _022606FA - _022606AE - 2 ; case 1
	.short _022608B0 - _022606AE - 2 ; case 2
	.short _022608CC - _022606AE - 2 ; case 3
	.short _022608E8 - _022606AE - 2 ; case 4
	.short _022608FA - _022606AE - 2 ; case 5
_022606BA:
	mov r0, #5
	mov r1, #0
	bl ov07_0223458C
	str r0, [r4, #4]
	ldr r0, _022609E0 ; =ov12_0226D350
	add r1, sp, #0x10
	ldrb r5, [r0, r5]
	mov r0, #1
	str r0, [sp, #0x14]
	str r5, [sp, #0x10]
	ldr r0, [r4, #4]
	bl ov07_022345C8
	str r0, [r4, #8]
	add r0, r5, #1
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r0, [r4, #4]
	add r1, sp, #0x10
	bl ov07_022345C8
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	bl ov07_02234694
	ldr r0, _022609E4 ; =0x0000084F
	bl PlaySE
	mov r0, #1
	strb r0, [r4, #0x14]
_022606FA:
	ldrb r0, [r4, #0x15]
	cmp r0, #0xa
	bne _02260734
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r2, _022609E8 ; =0x0000F3FF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r7, #0
	mov r1, #1
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r2, _022609EC ; =0x00003FFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r7, #0
	mov r1, #4
	bl sub_02003370
_02260734:
	ldrb r0, [r4, #0x15]
	cmp r0, #0xa
	blo _0226077E
	ldrb r0, [r4, #0x16]
	cmp r0, #0x10
	bhs _0226077E
	add r0, r0, #1
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #0x16]
	cmp r0, #0x10
	bls _0226074E
	mov r0, #0x10
	strb r0, [r4, #0x16]
_0226074E:
	add r0, r7, #0
	mov r1, #1
	bl PaletteData_GetFadedBuf
	add r6, r0, #0
	mov r0, #1
	mov r5, #0
	lsl r0, r0, #8
_0226075E:
	ldrb r2, [r4, #0x16]
	mov r1, #0x1f
	mul r1, r2
	lsl r1, r1, #0xc
	lsr r3, r1, #0x10
	lsl r1, r3, #5
	lsl r2, r3, #0xa
	orr r1, r3
	orr r2, r1
	lsl r1, r5, #1
	strh r2, [r6, r1]
	add r1, r5, #1
	lsl r1, r1, #0x10
	lsr r5, r1, #0x10
	cmp r5, r0
	blo _0226075E
_0226077E:
	ldrb r0, [r4, #0x15]
	cmp r0, #0x14
	bne _0226078A
	ldr r0, [r4, #0xc]
	bl ov07_02234694
_0226078A:
	ldrb r0, [r4, #0x15]
	cmp r0, #0x17
	bne _02260798
	mov r0, #0x85
	lsl r0, r0, #4
	bl PlaySE
_02260798:
	ldrb r0, [r4, #0x15]
	cmp r0, #0x1c
	bne _0226088A
	add r0, r7, #0
	mov r1, #0
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAE0
	add r1, r5, #0
	mov r2, #0xe0
	bl MIi_CpuCopy16
	ldr r0, [r4]
	bl ov12_0223A7E0
	cmp r0, #0x4a
	bne _022607DA
	add r0, r7, #0
	mov r1, #2
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0xa0
	bl MIi_CpuCopy16
	b _0226083C
_022607DA:
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	beq _022607FE
	add r0, r7, #0
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0xe0
	bl MIi_CpuCopy16
	b _0226083C
_022607FE:
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #1
	tst r0, r1
	beq _02260824
	add r0, r7, #0
	mov r1, #2
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0xa0
	bl MIi_CpuCopy16
	b _0226083C
_02260824:
	add r0, r7, #0
	mov r1, #2
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0x80
	bl MIi_CpuCopy16
_0226083C:
	mov r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0xc]
	mov r3, #0
	lsl r0, r0, #0x10
	str r3, [sp, #4]
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r2, _022609E8 ; =0x0000F3FF
	add r0, r7, #0
	mov r1, #1
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0xc]
	mov r3, #0
	lsl r0, r0, #0x10
	str r3, [sp, #4]
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r2, _022609EC ; =0x00003FFF
	add r0, r7, #0
	mov r1, #4
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0xc]
	mov r3, #0
	lsl r0, r0, #0x10
	str r3, [sp, #4]
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r2, _022609F0 ; =0x0000FFFF
	add r0, r7, #0
	mov r1, #0xa
	bl sub_02003370
_0226088A:
	ldrb r0, [r4, #0x15]
	cmp r0, #0x32
	blo _022608BA
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r2, #3
	str r3, [sp, #8]
	add r0, r7, #0
	mov r1, #1
	lsl r2, r2, #0xa
	bl sub_02003370
	ldrb r0, [r4, #0x14]
	add sp, #0x18
	add r0, r0, #1
	strb r0, [r4, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
_022608B0:
	ldr r0, [r4, #0xc]
	bl ov07_022346BC
	cmp r0, #0
	beq _022608BC
_022608BA:
	b _022609D8
_022608BC:
	ldr r0, [r4, #4]
	bl ov07_02234604
	ldrb r0, [r4, #0x14]
	add sp, #0x18
	add r0, r0, #1
	strb r0, [r4, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
_022608CC:
	ldr r0, [r4]
	bl ov12_0223AB34
	mov r1, #0
	bl sub_0201649C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_022608E8:
	ldr r0, [r4, #4]
	bl ov07_02234628
	ldr r0, [r4, #4]
	bl ov07_02234604
	ldrb r0, [r4, #0x14]
	add r0, r0, #1
	strb r0, [r4, #0x14]
_022608FA:
	add r0, r7, #0
	mov r1, #0
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAE0
	add r1, r5, #0
	mov r2, #0xe0
	bl MIi_CpuCopy16
	ldr r0, [r4]
	bl ov12_0223A7E0
	cmp r0, #0x4a
	bne _02260936
	add r0, r7, #0
	mov r1, #2
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0xa0
	bl MIi_CpuCopy16
	b _02260998
_02260936:
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	beq _0226095A
	add r0, r7, #0
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0xe0
	bl MIi_CpuCopy16
	b _02260998
_0226095A:
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #1
	tst r0, r1
	beq _02260980
	add r0, r7, #0
	mov r1, #2
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0xa0
	bl MIi_CpuCopy16
	b _02260998
_02260980:
	add r0, r7, #0
	mov r1, #2
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0x80
	bl MIi_CpuCopy16
_02260998:
	mov r3, #0
	str r3, [sp]
	ldr r0, _022609F4 ; =0x00007FFF
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r2, _022609F0 ; =0x0000FFFF
	add r0, r7, #0
	mov r1, #1
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	ldr r2, _022609F0 ; =0x0000FFFF
	str r3, [sp, #4]
	str r2, [sp, #8]
	add r0, r7, #0
	mov r1, #4
	lsr r2, r2, #2
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	ldr r0, _022609F4 ; =0x00007FFF
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r2, _022609F0 ; =0x0000FFFF
	add r0, r7, #0
	mov r1, #0xa
	bl sub_02003370
	mov r0, #3
	strb r0, [r4, #0x14]
_022609D8:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022609DC: .word ov12_0226D18C
_022609E0: .word ov12_0226D350
_022609E4: .word 0x0000084F
_022609E8: .word 0x0000F3FF
_022609EC: .word 0x00003FFF
_022609F0: .word 0x0000FFFF
_022609F4: .word 0x00007FFF
	thumb_func_end ov12_02260668

	thumb_func_start ov12_022609F8
ov12_022609F8: ; 0x022609F8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223A938
	ldrb r1, [r4, #0xa]
	add r6, r0, #0
	cmp r1, #3
	bls _02260A10
	b _02260B28
_02260A10:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02260A1C: ; jump table
	.short _02260A24 - _02260A1C - 2 ; case 0
	.short _02260A44 - _02260A1C - 2 ; case 1
	.short _02260AB4 - _02260A1C - 2 ; case 2
	.short _02260AE6 - _02260A1C - 2 ; case 3
_02260A24:
	mov r2, #0
	str r2, [sp]
	mov r1, #0x10
	str r1, [sp, #4]
	mov r1, #0xa
	str r2, [sp, #8]
	add r3, r1, #0
	ldr r2, _02260B2C ; =0x0000FFFF
	sub r3, #0x12
	bl sub_02003370
	ldrb r0, [r4, #0xa]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, pc}
_02260A44:
	bl sub_02003B44
	cmp r0, #0
	bne _02260B28
	ldr r0, [r4]
	bl ov12_02237B0C
	mov r0, #5
	mov r1, #0x38
	bl AllocFromHeap
	str r0, [r4, #4]
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl ov12_0223A7F4
	ldr r1, [r4, #4]
	mov r2, #3
	str r0, [r1]
	ldr r1, [r4]
	ldr r0, [r4, #4]
	str r1, [r0, #8]
	ldr r0, [r4, #4]
	mov r1, #5
	str r1, [r0, #0xc]
	ldrb r1, [r4, #0xe]
	ldr r0, [r4, #4]
	strb r1, [r0, #0x11]
	ldrh r1, [r4, #0xc]
	ldr r0, [r4, #4]
	strh r1, [r0, #0x24]
	ldr r1, [r4, #4]
	mov r0, #0
	add r1, #0x36
	strb r0, [r1]
	ldr r1, [r4, #4]
	strb r0, [r1, #0x12]
	ldr r1, [r4, #4]
	add r1, #0x35
	strb r2, [r1]
	ldr r1, [r4, #4]
	strh r0, [r1, #0x22]
	ldrb r2, [r4, #9]
	ldr r1, [r4, #4]
	str r2, [r1, #0x28]
	ldr r1, [r4, #4]
	add r1, #0x32
	strb r0, [r1]
	ldr r0, [r4, #4]
	bl ov10_0221BE20
	ldrb r0, [r4, #0xa]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, pc}
_02260AB4:
	ldr r0, [r4, #4]
	add r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _02260B28
	ldr r0, [r4]
	bl ov12_02237BB8
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	mov r1, #0xa
	str r0, [sp, #4]
	add r3, r1, #0
	str r0, [sp, #8]
	ldr r2, _02260B2C ; =0x0000FFFF
	add r0, r6, #0
	sub r3, #0x12
	bl sub_02003370
	ldrb r0, [r4, #0xa]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, pc}
_02260AE6:
	bl sub_02003B44
	cmp r0, #0
	bne _02260B28
	ldr r0, [r4, #4]
	add r0, #0x34
	ldrb r2, [r0]
	ldr r0, [r4]
	cmp r2, #4
	bne _02260B04
	ldrb r1, [r4, #9]
	mov r2, #0xff
	bl ov12_02263360
	b _02260B0C
_02260B04:
	ldrb r1, [r4, #9]
	add r2, r2, #1
	bl ov12_02263360
_02260B0C:
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl ov12_0226430C
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_02260B28:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02260B2C: .word 0x0000FFFF
	thumb_func_end ov12_022609F8

	thumb_func_start ov12_02260B30
ov12_02260B30: ; 0x02260B30
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	ldrb r0, [r5, #0xa]
	cmp r0, #0
	beq _02260B42
	cmp r0, #1
	beq _02260B86
	pop {r3, r4, r5, pc}
_02260B42:
	ldrb r1, [r5, #0xc]
	ldrb r0, [r5, #0xd]
	cmp r1, r0
	bne _02260B80
	mov r0, #0
	strb r0, [r5, #0xc]
	ldr r0, [r5, #4]
	mov r1, #0x28
	bl sub_02008A78
	add r4, r0, #0
	ldrb r0, [r5, #0xb]
	cmp r4, r0
	ble _02260B62
	sub r4, r4, #1
	b _02260B68
_02260B62:
	cmp r4, r0
	bge _02260B68
	add r4, r4, #1
_02260B68:
	ldr r0, [r5, #4]
	mov r1, #0x28
	add r2, r4, #0
	bl sub_020087A4
	ldrb r0, [r5, #0xb]
	cmp r4, r0
	bne _02260B9C
	ldrb r0, [r5, #0xa]
	add r0, r0, #1
	strb r0, [r5, #0xa]
	pop {r3, r4, r5, pc}
_02260B80:
	add r0, r1, #1
	strb r0, [r5, #0xc]
	pop {r3, r4, r5, pc}
_02260B86:
	ldrb r1, [r5, #9]
	ldrb r2, [r5, #8]
	ldr r0, [r5]
	bl ov12_0226430C
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	bl DestroySysTask
_02260B9C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_02260B30

	thumb_func_start ov12_02260BA0
ov12_02260BA0: ; 0x02260BA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldrb r1, [r5, #5]
	add r4, r0, #0
	ldr r0, [r5]
	bl ov12_0223AB1C
	cmp r0, #0
	bne _02260BB8
	mov r6, #0
	b _02260BBA
_02260BB8:
	mov r6, #1
_02260BBA:
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _02260BC6
	cmp r0, #1
	beq _02260C22
	b _02260C3C
_02260BC6:
	ldrb r0, [r5, #0xe]
	cmp r0, #0
	bne _02260BD4
	mov r0, #0
	str r0, [sp, #8]
	mov r7, #1
	b _02260BEE
_02260BD4:
	mov r0, #1
	str r0, [sp, #8]
	ldrb r0, [r5, #6]
	cmp r0, #3
	beq _02260BE4
	cmp r0, #5
	beq _02260BE8
	b _02260BEC
_02260BE4:
	mov r7, #0
	b _02260BEE
_02260BE8:
	mov r7, #2
	b _02260BEE
_02260BEC:
	ldr r7, [sp, #8]
_02260BEE:
	ldr r0, [r5]
	bl ov12_0223A8E4
	add r4, r0, #0
	ldr r0, [r5]
	bl ov12_0223A8EC
	str r4, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	ldr r2, [sp, #8]
	add r0, #8
	add r1, r6, #0
	add r3, r7, #0
	bl ov12_0226AEE0
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r6, #0
	bl ov12_0223A914
	ldrb r0, [r5, #7]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r5, #7]
	pop {r4, r5, r6, r7, pc}
_02260C22:
	ldr r0, [r5]
	add r1, r6, #0
	bl ov12_0223A908
	bl ov12_0226AF48
	cmp r0, #1
	bne _02260C52
	ldrb r0, [r5, #7]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r5, #7]
	pop {r4, r5, r6, r7, pc}
_02260C3C:
	ldrb r1, [r5, #5]
	ldrb r2, [r5, #4]
	ldr r0, [r5]
	bl ov12_0226430C
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	bl DestroySysTask
_02260C52:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_02260BA0

	thumb_func_start ov12_02260C58
ov12_02260C58: ; 0x02260C58
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldrb r1, [r5, #5]
	add r7, r0, #0
	ldr r0, [r5]
	bl ov12_0223AB1C
	cmp r0, #0
	bne _02260C6E
	mov r4, #0
	b _02260C70
_02260C6E:
	mov r4, #1
_02260C70:
	ldr r0, [r5]
	add r1, r4, #0
	bl ov12_0223A908
	ldrb r1, [r5, #7]
	add r6, r0, #0
	cmp r1, #0
	beq _02260C86
	cmp r1, #1
	beq _02260CA2
	b _02260CC2
_02260C86:
	ldrb r0, [r5, #0xe]
	cmp r0, #0
	bne _02260C90
	mov r1, #0
	b _02260C92
_02260C90:
	mov r1, #1
_02260C92:
	add r0, r6, #0
	add r2, r1, #0
	bl ov12_0226AF6C
	ldrb r0, [r5, #7]
	add r0, r0, #1
	strb r0, [r5, #7]
	pop {r3, r4, r5, r6, r7, pc}
_02260CA2:
	bl ov12_0226AFA4
	cmp r0, #1
	bne _02260CD8
	add r0, r6, #0
	bl ov12_0226AFC8
	ldr r0, [r5]
	add r1, r4, #0
	mov r2, #0
	bl ov12_0223A914
	ldrb r0, [r5, #7]
	add r0, r0, #1
	strb r0, [r5, #7]
	pop {r3, r4, r5, r6, r7, pc}
_02260CC2:
	ldrb r1, [r5, #5]
	ldrb r2, [r5, #4]
	ldr r0, [r5]
	bl ov12_0226430C
	add r0, r5, #0
	bl FreeToHeap
	add r0, r7, #0
	bl DestroySysTask
_02260CD8:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_02260C58

	thumb_func_start ov12_02260CDC
ov12_02260CDC: ; 0x02260CDC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0xe]
	cmp r0, #0
	bne _02260D0E
	ldr r0, [r4, #4]
	add r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _02260CF6
	bl GF_AssertFail
_02260CF6:
	ldrb r2, [r4, #0xd]
	ldr r0, [r4]
	mov r1, #5
	bl ov07_0221FB90
	ldr r1, [r4, #4]
	add r1, #0x8c
	str r0, [r1]
	ldrb r0, [r4, #0xe]
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, pc}
_02260D0E:
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_02260CDC

	thumb_func_start ov12_02260D28
ov12_02260D28: ; 0x02260D28
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	add r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	bne _02260D3C
	bl GF_AssertFail
_02260D3C:
	ldr r0, [r4, #4]
	add r0, #0x8c
	ldr r0, [r0]
	bl ov07_0221FE70
	cmp r0, #3
	bne _02260D56
	ldrb r0, [r4, #0xe]
	cmp r0, #5
	bhs _02260D56
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, pc}
_02260D56:
	ldr r0, [r4, #4]
	ldrb r1, [r4, #0xd]
	add r0, #0x8c
	ldr r0, [r0]
	bl ov07_0221FE3C
	ldr r0, [r4, #4]
	mov r1, #0
	add r0, #0x8c
	str r1, [r0]
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl ov12_0226430C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_02260D28

	thumb_func_start ov12_02260D84
ov12_02260D84: ; 0x02260D84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	bl ov12_0223A938
	add r4, r0, #0
	ldr r0, [r5]
	bl ov12_0223A8D4
	add r7, r0, #0
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _02260DAE
	cmp r0, #1
	beq _02260DE0
	cmp r0, #2
	beq _02260E84
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02260DAE:
	ldrb r0, [r5, #7]
	cmp r0, #0
	bne _02260DD2
	ldr r0, [r5]
	bl ov12_0223AB34
	mov r1, #1
	bl sub_0201649C
	ldr r0, _02260EA0 ; =0x0000FFFF
	mov r1, #0
	str r0, [sp]
	add r0, r7, #0
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020090E4
	b _02260DDA
_02260DD2:
	mov r0, #0
	mov r1, #0x10
	bl GF_SndStartFadeOutBGM
_02260DDA:
	ldrb r0, [r5, #6]
	add r0, r0, #1
	strb r0, [r5, #6]
_02260DE0:
	ldrb r0, [r5, #7]
	cmp r0, #0
	ldrb r0, [r5, #8]
	bne _02260E24
	str r0, [sp]
	ldr r0, _02260EA0 ; =0x0000FFFF
	mov r1, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0xa0
	bl sub_02003E5C
	ldrb r0, [r5, #8]
	mov r1, #0
	mov r2, #0xc0
	str r0, [sp]
	ldr r0, _02260EA0 ; =0x0000FFFF
	mov r3, #0x40
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_02003E5C
	ldrb r0, [r5, #8]
	mov r1, #2
	mov r2, #0
	str r0, [sp]
	ldr r0, _02260EA0 ; =0x0000FFFF
	mov r3, #0xe0
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_02003E5C
	b _02260E62
_02260E24:
	str r0, [sp]
	ldr r0, _02260EA0 ; =0x0000FFFF
	mov r1, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0xa0
	mov r3, #0x20
	bl sub_02003E5C
	ldrb r0, [r5, #8]
	mov r1, #1
	add r3, r1, #0
	str r0, [sp]
	ldr r0, _02260EA0 ; =0x0000FFFF
	mov r2, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r3, #0xff
	bl sub_02003E5C
	ldrb r0, [r5, #8]
	mov r1, #3
	add r3, r1, #0
	str r0, [sp]
	ldr r0, _02260EA0 ; =0x0000FFFF
	mov r2, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r3, #0xfd
	bl sub_02003E5C
_02260E62:
	ldrb r1, [r5, #8]
	add r0, r1, #1
	strb r0, [r5, #8]
	cmp r1, #0x10
	bne _02260E9A
	ldrb r0, [r5, #7]
	cmp r0, #0
	bne _02260E7A
	mov r0, #0
	add r1, r0, #0
	bl ToggleBgLayer
_02260E7A:
	ldrb r0, [r5, #6]
	add sp, #8
	add r0, r0, #1
	strb r0, [r5, #6]
	pop {r3, r4, r5, r6, r7, pc}
_02260E84:
	ldrb r1, [r5, #5]
	ldrb r2, [r5, #4]
	ldr r0, [r5]
	bl ov12_0226430C
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_02260E9A:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260EA0: .word 0x0000FFFF
	thumb_func_end ov12_02260D84

	thumb_func_start ov12_02260EA4
ov12_02260EA4: ; 0x02260EA4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl ov12_0223A7E0
	add r4, r0, #0
	add r0, r6, #0
	bl ov12_0223B514
	mov r1, #0x40
	tst r1, r4
	beq _02260F2C
	mov r2, #0x65
	lsl r2, r2, #2
	ldrb r1, [r5, r2]
	cmp r1, #0
	beq _02260EE6
	ldr r0, _022611E8 ; =ov12_0225E104
	mov r1, #1
	str r0, [r5]
	ldr r0, _022611EC ; =ov12_0225E404
	str r0, [r5, #4]
	ldr r0, _022611F0 ; =ov12_0225E6FC
	str r0, [r5, #8]
	ldr r0, _022611F4 ; =ov12_0225F3A4
	str r0, [r5, #0xc]
	ldr r0, _022611F8 ; =ov12_0225F8AC
	str r0, [r5, #0x10]
	ldr r0, _022611FC ; =ov12_0225FC80
	str r0, [r5, #0x14]
	add r0, r2, #2
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02260EE6:
	mov r1, #0x10
	tst r0, r1
	beq _02260F0C
	ldr r0, _02261200 ; =ov12_0225E1FC
	mov r1, #0
	str r0, [r5]
	ldr r0, _02261204 ; =ov12_0225E4EC
	str r0, [r5, #4]
	ldr r0, _02261208 ; =ov12_0225E760
	str r0, [r5, #8]
	ldr r0, _0226120C ; =ov12_0225F434
	str r0, [r5, #0xc]
	ldr r0, _02261210 ; =ov12_0225F980
	str r0, [r5, #0x10]
	ldr r0, _02261214 ; =ov12_0225FCC0
	str r0, [r5, #0x14]
	add r0, r2, #2
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02260F0C:
	ldr r0, _02261218 ; =ov12_0225DAD4
	mov r1, #0
	str r0, [r5]
	ldr r0, _0226121C ; =ov12_0225E250
	str r0, [r5, #4]
	ldr r0, _02261220 ; =ov12_0225E568
	str r0, [r5, #8]
	ldr r0, _02261224 ; =ov12_0225E830
	str r0, [r5, #0xc]
	ldr r0, _02261228 ; =ov12_0225F4E0
	str r0, [r5, #0x10]
	ldr r0, _0226122C ; =ov12_0225FA44
	str r0, [r5, #0x14]
	add r0, r2, #2
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02260F2C:
	mov r1, #0x88
	and r1, r4
	cmp r1, #0x88
	bne _02261006
	ldr r2, _02261230 ; =0x00000195
	mov r1, #1
	ldrb r3, [r5, r2]
	tst r1, r3
	beq _02260F88
	add r0, r6, #0
	bl ov12_0223B688
	cmp r0, #0
	beq _02260F68
	ldr r0, _022611E8 ; =ov12_0225E104
	mov r1, #1
	str r0, [r5]
	ldr r0, _022611EC ; =ov12_0225E404
	str r0, [r5, #4]
	ldr r0, _022611F0 ; =ov12_0225E6FC
	str r0, [r5, #8]
	ldr r0, _022611F4 ; =ov12_0225F3A4
	str r0, [r5, #0xc]
	ldr r0, _022611F8 ; =ov12_0225F8AC
	str r0, [r5, #0x10]
	ldr r0, _022611FC ; =ov12_0225FC80
	str r0, [r5, #0x14]
	ldr r0, _02261234 ; =0x00000196
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02260F68:
	ldr r0, _02261238 ; =ov12_0225E134
	mov r1, #2
	str r0, [r5]
	ldr r0, _0226123C ; =ov12_0225E4CC
	str r0, [r5, #4]
	ldr r0, _02261240 ; =ov12_0225E740
	str r0, [r5, #8]
	ldr r0, _02261244 ; =ov12_0225F3FC
	str r0, [r5, #0xc]
	ldr r0, _02261248 ; =ov12_0225F960
	str r0, [r5, #0x10]
	ldr r0, _0226124C ; =ov12_0225FCA0
	str r0, [r5, #0x14]
	ldr r0, _02261234 ; =0x00000196
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02260F88:
	mov r1, #0x10
	tst r0, r1
	beq _02260FAE
	ldr r0, _02261200 ; =ov12_0225E1FC
	mov r1, #0
	str r0, [r5]
	ldr r0, _02261204 ; =ov12_0225E4EC
	str r0, [r5, #4]
	ldr r0, _02261208 ; =ov12_0225E760
	str r0, [r5, #8]
	ldr r0, _0226120C ; =ov12_0225F434
	str r0, [r5, #0xc]
	ldr r0, _02261210 ; =ov12_0225F980
	str r0, [r5, #0x10]
	ldr r0, _02261214 ; =ov12_0225FCC0
	str r0, [r5, #0x14]
	add r0, r2, #1
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02260FAE:
	add r0, r6, #0
	bl ov12_0223BFC0
	add r1, r0, #0
	add r0, r6, #0
	lsl r1, r1, #1
	bl ov12_0223AB0C
	ldr r1, _02261230 ; =0x00000195
	ldrb r2, [r5, r1]
	cmp r2, r0
	beq _02260FE6
	ldr r0, _02261238 ; =ov12_0225E134
	mov r2, #2
	str r0, [r5]
	ldr r0, _0226123C ; =ov12_0225E4CC
	str r0, [r5, #4]
	ldr r0, _02261240 ; =ov12_0225E740
	str r0, [r5, #8]
	ldr r0, _02261244 ; =ov12_0225F3FC
	str r0, [r5, #0xc]
	ldr r0, _02261248 ; =ov12_0225F960
	str r0, [r5, #0x10]
	ldr r0, _0226124C ; =ov12_0225FCA0
	str r0, [r5, #0x14]
	add r0, r1, #1
	strb r2, [r5, r0]
	pop {r4, r5, r6, pc}
_02260FE6:
	ldr r0, _02261218 ; =ov12_0225DAD4
	mov r2, #0
	str r0, [r5]
	ldr r0, _0226121C ; =ov12_0225E250
	str r0, [r5, #4]
	ldr r0, _02261220 ; =ov12_0225E568
	str r0, [r5, #8]
	ldr r0, _02261224 ; =ov12_0225E830
	str r0, [r5, #0xc]
	ldr r0, _02261228 ; =ov12_0225F4E0
	str r0, [r5, #0x10]
	ldr r0, _0226122C ; =ov12_0225FA44
	str r0, [r5, #0x14]
	add r0, r1, #1
	strb r2, [r5, r0]
	pop {r4, r5, r6, pc}
_02261006:
	mov r1, #8
	tst r1, r4
	beq _02261088
	mov r1, #0x10
	tst r0, r1
	beq _02261032
	ldr r0, _02261200 ; =ov12_0225E1FC
	mov r1, #0
	str r0, [r5]
	ldr r0, _02261204 ; =ov12_0225E4EC
	str r0, [r5, #4]
	ldr r0, _02261208 ; =ov12_0225E760
	str r0, [r5, #8]
	ldr r0, _0226120C ; =ov12_0225F434
	str r0, [r5, #0xc]
	ldr r0, _02261210 ; =ov12_0225F980
	str r0, [r5, #0x10]
	ldr r0, _02261214 ; =ov12_0225FCC0
	str r0, [r5, #0x14]
	ldr r0, _02261234 ; =0x00000196
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02261032:
	add r0, r6, #0
	bl ov12_0223BFC0
	add r1, r0, #0
	add r0, r6, #0
	bl ov12_0223AB0C
	ldr r1, _02261230 ; =0x00000195
	ldrb r2, [r5, r1]
	cmp r2, r0
	beq _02261068
	ldr r0, _02261238 ; =ov12_0225E134
	mov r2, #2
	str r0, [r5]
	ldr r0, _0226123C ; =ov12_0225E4CC
	str r0, [r5, #4]
	ldr r0, _02261240 ; =ov12_0225E740
	str r0, [r5, #8]
	ldr r0, _02261244 ; =ov12_0225F3FC
	str r0, [r5, #0xc]
	ldr r0, _02261248 ; =ov12_0225F960
	str r0, [r5, #0x10]
	ldr r0, _0226124C ; =ov12_0225FCA0
	str r0, [r5, #0x14]
	add r0, r1, #1
	strb r2, [r5, r0]
	pop {r4, r5, r6, pc}
_02261068:
	ldr r0, _02261218 ; =ov12_0225DAD4
	mov r2, #0
	str r0, [r5]
	ldr r0, _0226121C ; =ov12_0225E250
	str r0, [r5, #4]
	ldr r0, _02261220 ; =ov12_0225E568
	str r0, [r5, #8]
	ldr r0, _02261224 ; =ov12_0225E830
	str r0, [r5, #0xc]
	ldr r0, _02261228 ; =ov12_0225F4E0
	str r0, [r5, #0x10]
	ldr r0, _0226122C ; =ov12_0225FA44
	str r0, [r5, #0x14]
	add r0, r1, #1
	strb r2, [r5, r0]
	pop {r4, r5, r6, pc}
_02261088:
	mov r1, #4
	add r2, r4, #0
	tst r2, r1
	beq _02261100
	mov r1, #0x10
	tst r0, r1
	beq _022610B6
	ldr r0, _02261200 ; =ov12_0225E1FC
	mov r1, #0
	str r0, [r5]
	ldr r0, _02261204 ; =ov12_0225E4EC
	str r0, [r5, #4]
	ldr r0, _02261208 ; =ov12_0225E760
	str r0, [r5, #8]
	ldr r0, _0226120C ; =ov12_0225F434
	str r0, [r5, #0xc]
	ldr r0, _02261210 ; =ov12_0225F980
	str r0, [r5, #0x10]
	ldr r0, _02261214 ; =ov12_0225FCC0
	str r0, [r5, #0x14]
	ldr r0, _02261234 ; =0x00000196
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_022610B6:
	ldr r0, _02261230 ; =0x00000195
	mov r1, #1
	ldrb r2, [r5, r0]
	tst r1, r2
	beq _022610E0
	ldr r1, _02261238 ; =ov12_0225E134
	add r0, r0, #1
	str r1, [r5]
	ldr r1, _0226123C ; =ov12_0225E4CC
	str r1, [r5, #4]
	ldr r1, _02261240 ; =ov12_0225E740
	str r1, [r5, #8]
	ldr r1, _02261244 ; =ov12_0225F3FC
	str r1, [r5, #0xc]
	ldr r1, _02261248 ; =ov12_0225F960
	str r1, [r5, #0x10]
	ldr r1, _0226124C ; =ov12_0225FCA0
	str r1, [r5, #0x14]
	mov r1, #2
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_022610E0:
	ldr r1, _02261218 ; =ov12_0225DAD4
	add r0, r0, #1
	str r1, [r5]
	ldr r1, _0226121C ; =ov12_0225E250
	str r1, [r5, #4]
	ldr r1, _02261220 ; =ov12_0225E568
	str r1, [r5, #8]
	ldr r1, _02261224 ; =ov12_0225E830
	str r1, [r5, #0xc]
	ldr r1, _02261228 ; =ov12_0225F4E0
	str r1, [r5, #0x10]
	ldr r1, _0226122C ; =ov12_0225FA44
	str r1, [r5, #0x14]
	mov r1, #0
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02261100:
	lsl r1, r1, #7
	tst r1, r4
	beq _0226113C
	ldr r0, _02261230 ; =0x00000195
	mov r1, #1
	ldrb r2, [r5, r0]
	tst r2, r1
	beq _02261126
	ldr r2, _02261250 ; =ov12_0225E1D4
	add r0, r0, #1
	str r2, [r5]
	mov r2, #0
	str r2, [r5, #4]
	str r2, [r5, #8]
	str r2, [r5, #0xc]
	str r2, [r5, #0x10]
	str r2, [r5, #0x14]
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02261126:
	ldr r1, _02261218 ; =ov12_0225DAD4
	add r0, r0, #1
	str r1, [r5]
	mov r1, #0
	str r1, [r5, #4]
	str r1, [r5, #8]
	str r1, [r5, #0xc]
	str r1, [r5, #0x10]
	str r1, [r5, #0x14]
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_0226113C:
	mov r1, #0x20
	tst r1, r4
	beq _0226117A
	ldr r0, _02261230 ; =0x00000195
	mov r1, #1
	ldrb r2, [r5, r0]
	tst r2, r1
	beq _02261162
	ldr r2, _02261254 ; =ov12_0225E154
	add r0, r0, #1
	str r2, [r5]
	mov r2, #0
	str r2, [r5, #4]
	str r2, [r5, #8]
	str r2, [r5, #0xc]
	str r2, [r5, #0x10]
	str r2, [r5, #0x14]
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02261162:
	ldr r1, _02261218 ; =ov12_0225DAD4
	mov r2, #0
	str r1, [r5]
	str r2, [r5, #4]
	str r2, [r5, #8]
	str r2, [r5, #0xc]
	ldr r1, _0226122C ; =ov12_0225FA44
	str r2, [r5, #0x10]
	str r1, [r5, #0x14]
	add r0, r0, #1
	strb r2, [r5, r0]
	pop {r4, r5, r6, pc}
_0226117A:
	ldr r2, _02261230 ; =0x00000195
	mov r1, #1
	ldrb r3, [r5, r2]
	tst r3, r1
	beq _022611A2
	ldr r0, _022611E8 ; =ov12_0225E104
	str r0, [r5]
	ldr r0, _022611EC ; =ov12_0225E404
	str r0, [r5, #4]
	ldr r0, _022611F0 ; =ov12_0225E6FC
	str r0, [r5, #8]
	ldr r0, _022611F4 ; =ov12_0225F3A4
	str r0, [r5, #0xc]
	ldr r0, _022611F8 ; =ov12_0225F8AC
	str r0, [r5, #0x10]
	ldr r0, _022611FC ; =ov12_0225FC80
	str r0, [r5, #0x14]
	add r0, r2, #1
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_022611A2:
	mov r1, #0x10
	tst r0, r1
	beq _022611C8
	ldr r0, _02261200 ; =ov12_0225E1FC
	mov r1, #0
	str r0, [r5]
	ldr r0, _02261204 ; =ov12_0225E4EC
	str r0, [r5, #4]
	ldr r0, _02261208 ; =ov12_0225E760
	str r0, [r5, #8]
	ldr r0, _0226120C ; =ov12_0225F434
	str r0, [r5, #0xc]
	ldr r0, _02261210 ; =ov12_0225F980
	str r0, [r5, #0x10]
	ldr r0, _02261214 ; =ov12_0225FCC0
	str r0, [r5, #0x14]
	add r0, r2, #1
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_022611C8:
	ldr r0, _02261218 ; =ov12_0225DAD4
	mov r1, #0
	str r0, [r5]
	ldr r0, _0226121C ; =ov12_0225E250
	str r0, [r5, #4]
	ldr r0, _02261220 ; =ov12_0225E568
	str r0, [r5, #8]
	ldr r0, _02261224 ; =ov12_0225E830
	str r0, [r5, #0xc]
	ldr r0, _02261228 ; =ov12_0225F4E0
	str r0, [r5, #0x10]
	ldr r0, _0226122C ; =ov12_0225FA44
	str r0, [r5, #0x14]
	add r0, r2, #1
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022611E8: .word ov12_0225E104
_022611EC: .word ov12_0225E404
_022611F0: .word ov12_0225E6FC
_022611F4: .word ov12_0225F3A4
_022611F8: .word ov12_0225F8AC
_022611FC: .word ov12_0225FC80
_02261200: .word ov12_0225E1FC
_02261204: .word ov12_0225E4EC
_02261208: .word ov12_0225E760
_0226120C: .word ov12_0225F434
_02261210: .word ov12_0225F980
_02261214: .word ov12_0225FCC0
_02261218: .word ov12_0225DAD4
_0226121C: .word ov12_0225E250
_02261220: .word ov12_0225E568
_02261224: .word ov12_0225E830
_02261228: .word ov12_0225F4E0
_0226122C: .word ov12_0225FA44
_02261230: .word 0x00000195
_02261234: .word 0x00000196
_02261238: .word ov12_0225E134
_0226123C: .word ov12_0225E4CC
_02261240: .word ov12_0225E740
_02261244: .word ov12_0225F3FC
_02261248: .word ov12_0225F960
_0226124C: .word ov12_0225FCA0
_02261250: .word ov12_0225E1D4
_02261254: .word ov12_0225E154
	thumb_func_end ov12_02260EA4

	thumb_func_start ov12_02261258
ov12_02261258: ; 0x02261258
	ldr r1, _02261260 ; =0x00000195
	ldrb r0, [r0, r1]
	bx lr
	nop
_02261260: .word 0x00000195
	thumb_func_end ov12_02261258

	thumb_func_start ov12_02261264
ov12_02261264: ; 0x02261264
	ldr r1, _0226126C ; =0x00000196
	ldrb r0, [r0, r1]
	bx lr
	nop
_0226126C: .word 0x00000196
	thumb_func_end ov12_02261264

	thumb_func_start ov12_02261270
ov12_02261270: ; 0x02261270
	ldr r1, [r0, #0x20]
	cmp r1, #0
	bne _02261278
	ldr r1, [r0, #0x1c]
_02261278:
	add r0, r1, #0
	bx lr
	thumb_func_end ov12_02261270

	thumb_func_start ov12_0226127C
ov12_0226127C: ; 0x0226127C
	add r0, #0x28
	bx lr
	thumb_func_end ov12_0226127C

	thumb_func_start ov12_02261280
ov12_02261280: ; 0x02261280
	add r0, #0x80
	bx lr
	thumb_func_end ov12_02261280

	thumb_func_start ov12_02261284
ov12_02261284: ; 0x02261284
	ldr r3, _02261290 ; =MI_CpuFill8
	add r0, #0x80
	mov r1, #0
	mov r2, #8
	bx r3
	nop
_02261290: .word MI_CpuFill8
	thumb_func_end ov12_02261284

	thumb_func_start ov12_02261294
ov12_02261294: ; 0x02261294
	push {r3, lr}
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _022612A0
	bl sub_0200DCE8
_022612A0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_02261294

	thumb_func_start ov12_022612A4
ov12_022612A4: ; 0x022612A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r4, [sp, #0x50]
	add r7, r0, #0
	str r1, [sp, #0x14]
	add r5, r2, #0
	str r3, [sp, #0x18]
	bl ov12_0223A99C
	add r1, r4, #0
	bl ov12_0223BB94
	str r0, [sp, #0x20]
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_0223AB0C
	add r6, r0, #0
	mov r0, #1
	and r0, r6
	str r0, [sp, #0x1c]
	beq _022612D4
	mov r1, #2
	b _022612D6
_022612D4:
	mov r1, #0
_022612D6:
	ldr r0, [r5, #0xc]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldrh r0, [r5, #6]
	mov r2, #5
	str r0, [sp, #0xc]
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	bl sub_02014540
	add r0, r7, #0
	bl ov12_0223A99C
	ldrh r2, [r5]
	add r1, r4, #0
	bl ov12_0223BBA8
	add r0, r7, #0
	bl ov12_0223A99C
	ldrh r2, [r5, #4]
	add r1, r4, #0
	bl ov12_0223BBC0
	add r0, r7, #0
	bl ov12_0223A99C
	ldr r2, [sp, #0x40]
	add r1, r4, #0
	bl ov12_0223BBD8
	ldr r0, [sp, #0x3c]
	ldr r3, [sp, #0x40]
	str r0, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0x54]
	ldr r4, [sp, #0x38]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x58]
	ldr r2, [sp, #0x18]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	add r1, r5, #0
	add r3, r4, r3
	bl sub_02008634
	add r4, r0, #0
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0226138A
	cmp r6, #1
	ble _02261348
	asr r6, r6, #1
_02261348:
	add r0, r4, #0
	mov r1, #0x2a
	add r2, r6, #0
	bl sub_020087A4
	ldr r2, [sp, #0x4c]
	add r0, r4, #0
	mov r1, #0x2e
	bl sub_020087A4
	ldr r2, [sp, #0x38]
	add r0, r4, #0
	mov r1, #0x14
	add r2, #0x24
	bl sub_020087A4
	ldr r2, [sp, #0x48]
	add r0, r4, #0
	mov r1, #0x15
	bl sub_020087A4
	ldr r3, [sp, #0x40]
	mov r2, #0x24
	add r0, r4, #0
	mov r1, #0x16
	sub r2, r2, r3
	bl sub_020087A4
	ldr r2, [sp, #0x44]
	add r0, r4, #0
	mov r1, #0x29
	bl sub_020087A4
_0226138A:
	add r0, r4, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov12_022612A4

	thumb_func_start ov12_02261390
ov12_02261390: ; 0x02261390
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r1, _0226144C ; =0x00000195
	add r6, r2, #0
	ldrb r2, [r5, r1]
	mov r1, #1
	add r7, r0, #0
	add r4, r3, #0
	tst r1, r2
	beq _022613EA
	bl ov12_0223A7E0
	mov r1, #4
	tst r0, r1
	beq _022613CA
	ldr r0, _02261450 ; =0x000003DE
	strh r0, [r4, #2]
	mov r0, #0x1b
	strb r0, [r4, #1]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	str r1, [r4, #4]
	ldrb r1, [r5, r0]
	ldrb r0, [r6, #1]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022613CA:
	ldr r0, _02261454 ; =0x000003DD
	strh r0, [r4, #2]
	mov r0, #0x32
	strb r0, [r4, #1]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	str r1, [r4, #4]
	ldrb r1, [r5, r0]
	str r1, [r4, #8]
	ldrb r1, [r5, r0]
	ldrb r0, [r6, #1]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_022613EA:
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	bne _02261434
	add r0, r7, #0
	bl ov12_0223A7E0
	mov r1, #4
	tst r0, r1
	bne _02261434
	ldrh r0, [r6, #2]
	cmp r0, #0
	bne _0226140E
	mov r0, #0xf6
	lsl r0, r0, #2
	strh r0, [r4, #2]
	b _02261438
_0226140E:
	cmp r0, #0x19
	bhs _02261418
	ldr r0, _02261458 ; =0x000003D9
	strh r0, [r4, #2]
	b _02261438
_02261418:
	cmp r0, #0x32
	bhs _02261424
	mov r0, #0xf7
	lsl r0, r0, #2
	strh r0, [r4, #2]
	b _02261438
_02261424:
	cmp r0, #0x4b
	bhs _0226142E
	ldr r0, _0226145C ; =0x000003DA
	strh r0, [r4, #2]
	b _02261438
_0226142E:
	ldr r0, _02261460 ; =0x000003DB
	strh r0, [r4, #2]
	b _02261438
_02261434:
	ldr r0, _02261458 ; =0x000003D9
	strh r0, [r4, #2]
_02261438:
	mov r0, #2
	strb r0, [r4, #1]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	ldrb r0, [r6, #1]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0226144C: .word 0x00000195
_02261450: .word 0x000003DE
_02261454: .word 0x000003DD
_02261458: .word 0x000003D9
_0226145C: .word 0x000003DA
_02261460: .word 0x000003DB
	thumb_func_end ov12_02261390

	thumb_func_start ov12_02261464
ov12_02261464: ; 0x02261464
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r1, _02261524 ; =0x00000195
	add r6, r2, #0
	ldrb r2, [r5, r1]
	mov r1, #1
	add r7, r0, #0
	add r4, r3, #0
	tst r1, r2
	beq _022614C0
	bl ov12_0223A7E0
	mov r1, #4
	tst r0, r1
	bne _022614A4
	mov r0, #0xf3
	lsl r0, r0, #2
	strh r0, [r4, #2]
	mov r0, #0x32
	strb r0, [r4, #1]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	str r1, [r4, #4]
	ldrb r1, [r5, r0]
	str r1, [r4, #8]
	ldrb r1, [r5, r0]
	ldrb r0, [r6, #1]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_022614A4:
	ldr r0, _02261528 ; =0x000003CE
	strh r0, [r4, #2]
	mov r0, #0x1b
	strb r0, [r4, #1]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	str r1, [r4, #4]
	ldrb r1, [r5, r0]
	ldrb r0, [r6, #1]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022614C0:
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	bne _0226150C
	add r0, r7, #0
	bl ov12_0223A7E0
	mov r1, #4
	tst r0, r1
	bne _0226150C
	ldrh r1, [r6, #2]
	cmp r1, #0x64
	bhs _022614E2
	ldr r0, _0226152C ; =0x000003D6
	strh r0, [r4, #2]
	b _02261510
_022614E2:
	ldr r0, _02261530 ; =0x00000145
	cmp r1, r0
	bhs _022614EE
	ldr r0, _02261534 ; =0x000003D7
	strh r0, [r4, #2]
	b _02261510
_022614EE:
	add r0, #0xe1
	cmp r1, r0
	bhs _022614FA
	ldr r0, _02261538 ; =0x000003D5
	strh r0, [r4, #2]
	b _02261510
_022614FA:
	ldr r0, _0226153C ; =0x00000307
	cmp r1, r0
	bhs _02261506
	add r0, #0xcd
	strh r0, [r4, #2]
	b _02261510
_02261506:
	add r0, #0xcc
	strh r0, [r4, #2]
	b _02261510
_0226150C:
	ldr r0, _02261540 ; =0x000003D3
	strh r0, [r4, #2]
_02261510:
	mov r0, #2
	strb r0, [r4, #1]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	ldrb r0, [r6, #1]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02261524: .word 0x00000195
_02261528: .word 0x000003CE
_0226152C: .word 0x000003D6
_02261530: .word 0x00000145
_02261534: .word 0x000003D7
_02261538: .word 0x000003D5
_0226153C: .word 0x00000307
_02261540: .word 0x000003D3
	thumb_func_end ov12_02261464

	thumb_func_start ov12_02261544
ov12_02261544: ; 0x02261544
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r2, #0
	bl ov12_0223A7E0
	add r4, r0, #0
	mov r0, #2
	tst r0, r4
	beq _0226156A
	add r0, r7, #0
	mov r1, #3
	bl ov12_0223AAD8
	add r6, r0, #0
	add r0, r7, #0
	mov r1, #5
	bl ov12_0223AAD8
	b _02261574
_0226156A:
	add r0, r7, #0
	mov r1, #1
	bl ov12_0223AAD8
	add r6, r0, #0
_02261574:
	mov r1, #4
	tst r1, r4
	beq _022615B4
	mov r1, #0x80
	tst r1, r4
	beq _02261594
	mov r1, #0x3e
	lsl r1, r1, #4
	strh r1, [r5, #2]
	mov r1, #0x3b
	strb r1, [r5, #1]
	str r6, [r5, #4]
	str r6, [r5, #8]
	str r0, [r5, #0xc]
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_02261594:
	mov r1, #8
	add r2, r4, #0
	tst r2, r1
	beq _022615AA
	ldr r1, _022615E4 ; =0x000003CB
	strh r1, [r5, #2]
	mov r1, #0x1a
	strb r1, [r5, #1]
	str r6, [r5, #4]
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022615AA:
	ldr r0, _022615E8 ; =0x000003CA
	strh r0, [r5, #2]
	strb r1, [r5, #1]
	str r6, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_022615B4:
	mov r1, #0x10
	tst r1, r4
	bne _022615C0
	mov r1, #8
	tst r1, r4
	beq _022615D4
_022615C0:
	mov r1, #0x3e
	lsl r1, r1, #4
	strh r1, [r5, #2]
	mov r1, #0x3b
	strb r1, [r5, #1]
	str r6, [r5, #4]
	str r6, [r5, #8]
	str r0, [r5, #0xc]
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_022615D4:
	ldr r0, _022615EC ; =0x000003C9
	strh r0, [r5, #2]
	mov r0, #0x1e
	strb r0, [r5, #1]
	str r6, [r5, #4]
	str r6, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022615E4: .word 0x000003CB
_022615E8: .word 0x000003CA
_022615EC: .word 0x000003C9
	thumb_func_end ov12_02261544

	thumb_func_start ov12_022615F0
ov12_022615F0: ; 0x022615F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #4]
	str r0, [sp]
	add r6, r2, #0
	add r4, r3, #0
	bl ov12_0223A7E0
	str r0, [sp, #0x14]
	ldr r2, _02261904 ; =0x00000195
	ldr r0, [sp, #4]
	ldrb r1, [r0, r2]
	mov r0, #1
	tst r0, r1
	bne _02261610
	b _02261758
_02261610:
	ldr r0, [sp, #0x14]
	mov r1, #2
	and r0, r1
	str r0, [sp, #0x10]
	beq _0226162C
	ldr r0, [sp, #4]
	sub r1, r2, #1
	ldrb r5, [r0, r1]
	ldr r0, [sp]
	add r1, r5, #0
	bl ov12_0223AB6C
	add r7, r0, #0
	b _02261634
_0226162C:
	ldr r0, [sp, #4]
	sub r1, r2, #1
	ldrb r5, [r0, r1]
	add r7, r5, #0
_02261634:
	ldr r0, [sp, #0x14]
	mov r1, #4
	tst r0, r1
	beq _022616DA
	ldr r0, [sp, #0x14]
	mov r1, #0x80
	tst r0, r1
	beq _0226166C
	ldr r0, _02261908 ; =0x000003DF
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #0x3c
	strb r0, [r4, #1]
	str r5, [r4, #4]
	str r5, [r4, #8]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #0xc]
	str r7, [r4, #0x10]
	str r7, [r4, #0x14]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #0x18]
	pop {r3, r4, r5, r6, r7, pc}
_0226166C:
	ldr r0, [sp, #0x14]
	mov r1, #8
	tst r0, r1
	beq _0226169A
	mov r0, #0x3d
	lsl r0, r0, #4
	strh r0, [r4, #2]
	mov r0, #0x38
	strb r0, [r4, #1]
	str r5, [r4, #4]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	add sp, #0x18
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #8]
	str r7, [r4, #0xc]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_0226169A:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _022616C2
	ldr r0, _0226190C ; =0x000003CF
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #0x31
	strb r0, [r4, #1]
	str r5, [r4, #4]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #8]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_022616C2:
	ldr r0, _02261910 ; =0x000003CE
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #0x1b
	strb r0, [r4, #1]
	str r5, [r4, #4]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022616DA:
	ldr r0, [sp, #0x14]
	mov r1, #0x10
	tst r0, r1
	bne _022616EA
	ldr r0, [sp, #0x14]
	mov r1, #8
	tst r0, r1
	beq _02261712
_022616EA:
	ldr r0, _02261908 ; =0x000003DF
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #0x3c
	strb r0, [r4, #1]
	str r5, [r4, #4]
	str r5, [r4, #8]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #0xc]
	str r7, [r4, #0x10]
	str r7, [r4, #0x14]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #0x18]
	pop {r3, r4, r5, r6, r7, pc}
_02261712:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0226173C
	ldr r0, _02261914 ; =0x000003CD
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #0x39
	strb r0, [r4, #1]
	str r5, [r4, #4]
	str r5, [r4, #8]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #0xc]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_0226173C:
	mov r0, #0xf3
	lsl r0, r0, #2
	strh r0, [r4, #2]
	mov r0, #0x32
	strb r0, [r4, #1]
	str r5, [r4, #4]
	str r5, [r4, #8]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	add sp, #0x18
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02261758:
	ldr r0, [sp, #0x14]
	mov r1, #4
	and r0, r1
	str r0, [sp, #0xc]
	beq _022617EC
	ldr r0, [sp]
	bl ov12_0223BFC0
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, [sp, #0x14]
	mov r1, #8
	and r0, r1
	str r0, [sp, #8]
	beq _022617C2
	ldr r0, [sp]
	add r1, r2, #0
	bl ov12_0223BFCC
	cmp r0, #3
	bhi _02261832
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0226178E: ; jump table
	.short _02261796 - _0226178E - 2 ; case 0
	.short _022617AC - _0226178E - 2 ; case 1
	.short _022617AC - _0226178E - 2 ; case 2
	.short _02261796 - _0226178E - 2 ; case 3
_02261796:
	ldr r0, [sp]
	mov r1, #4
	bl ov12_0223AAD8
	add r5, r0, #0
	ldr r0, [sp]
	mov r1, #2
	bl ov12_0223AAD8
	add r7, r0, #0
	b _02261832
_022617AC:
	ldr r0, [sp]
	mov r1, #2
	bl ov12_0223AAD8
	add r5, r0, #0
	ldr r0, [sp]
	mov r1, #4
	bl ov12_0223AAD8
	add r7, r0, #0
	b _02261832
_022617C2:
	ldr r0, [sp, #0x14]
	mov r1, #2
	tst r0, r1
	beq _022617DE
	ldr r0, [sp]
	bl ov12_0223AAD8
	add r5, r0, #0
	ldr r0, [sp]
	mov r1, #4
	bl ov12_0223AAD8
	add r7, r0, #0
	b _02261832
_022617DE:
	ldr r0, [sp]
	mov r1, #0
	bl ov12_0223AAD8
	add r5, r0, #0
	add r7, r5, #0
	b _02261832
_022617EC:
	ldr r0, [sp, #0x14]
	mov r1, #8
	and r0, r1
	str r0, [sp, #8]
	beq _0226180E
	ldr r1, [sp, #4]
	sub r2, r2, #1
	ldrb r1, [r1, r2]
	ldr r0, [sp]
	bl ov12_0223AB6C
	add r5, r0, #0
	mov r1, #0x65
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	ldrb r7, [r0, r1]
	b _02261832
_0226180E:
	ldr r0, [sp, #0x14]
	mov r1, #2
	tst r0, r1
	beq _0226182A
	ldr r0, [sp]
	bl ov12_0223AAD8
	add r5, r0, #0
	ldr r0, [sp]
	mov r1, #4
	bl ov12_0223AAD8
	add r7, r0, #0
	b _02261832
_0226182A:
	ldr r0, [sp, #4]
	sub r1, r2, #1
	ldrb r5, [r0, r1]
	add r7, r5, #0
_02261832:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0226189C
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02261860
	ldr r0, _02261918 ; =0x000003D1
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #0x31
	strb r0, [r4, #1]
	str r5, [r4, #4]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #8]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02261860:
	ldr r0, [sp, #0x14]
	mov r1, #2
	tst r0, r1
	beq _02261888
	ldr r0, _0226191C ; =0x000003D2
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #9
	strb r0, [r4, #1]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #4]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02261888:
	ldr r0, _02261920 ; =0x000003D3
	add sp, #0x18
	strh r0, [r4, #2]
	strb r1, [r4, #1]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0226189C:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _022618C6
	ldr r0, _02261924 ; =0x000003E1
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #0x39
	strb r0, [r4, #1]
	str r5, [r4, #4]
	str r5, [r4, #8]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #0xc]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_022618C6:
	ldr r0, [sp, #0x14]
	mov r1, #2
	tst r0, r1
	beq _022618EE
	ldr r0, _0226191C ; =0x000003D2
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #9
	strb r0, [r4, #1]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #4]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022618EE:
	ldr r0, _02261920 ; =0x000003D3
	strh r0, [r4, #2]
	strb r1, [r4, #1]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #4]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02261904: .word 0x00000195
_02261908: .word 0x000003DF
_0226190C: .word 0x000003CF
_02261910: .word 0x000003CE
_02261914: .word 0x000003CD
_02261918: .word 0x000003D1
_0226191C: .word 0x000003D2
_02261920: .word 0x000003D3
_02261924: .word 0x000003E1
	thumb_func_end ov12_022615F0

	thumb_func_start ov12_02261928
ov12_02261928: ; 0x02261928
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r5, r2, #0
	bl ov12_0223A7E0
	add r6, r0, #0
	ldr r0, [sp]
	bl ov12_0223BD14
	add r7, r0, #0
	mov r0, #2
	tst r0, r6
	beq _02261956
	ldr r0, [sp]
	mov r1, #3
	bl ov12_0223AAD8
	add r4, r0, #0
	ldr r0, [sp]
	mov r1, #5
	bl ov12_0223AAD8
	b _02261960
_02261956:
	ldr r0, [sp]
	mov r1, #1
	bl ov12_0223AAD8
	add r4, r0, #0
_02261960:
	cmp r7, #1
	beq _0226196E
	cmp r7, #2
	beq _0226198E
	cmp r7, #3
	beq _022619B0
	pop {r3, r4, r5, r6, r7, pc}
_0226196E:
	mov r1, #8
	add r2, r6, #0
	tst r2, r1
	beq _02261984
	ldr r1, _022619D0 ; =0x00000312
	strh r1, [r5, #2]
	mov r1, #0x1a
	strb r1, [r5, #1]
	str r4, [r5, #4]
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02261984:
	ldr r0, _022619D4 ; =0x00000311
	strh r0, [r5, #2]
	strb r1, [r5, #1]
	str r4, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0226198E:
	mov r1, #8
	add r2, r6, #0
	tst r2, r1
	beq _022619A6
	mov r1, #0xc5
	lsl r1, r1, #2
	strh r1, [r5, #2]
	mov r1, #0x1a
	strb r1, [r5, #1]
	str r4, [r5, #4]
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022619A6:
	ldr r0, _022619D8 ; =0x00000313
	strh r0, [r5, #2]
	strb r1, [r5, #1]
	str r4, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_022619B0:
	mov r1, #8
	add r2, r6, #0
	tst r2, r1
	beq _022619C6
	ldr r1, _022619DC ; =0x00000316
	strh r1, [r5, #2]
	mov r1, #0x1a
	strb r1, [r5, #1]
	str r4, [r5, #4]
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022619C6:
	ldr r0, _022619E0 ; =0x00000315
	strh r0, [r5, #2]
	strb r1, [r5, #1]
	str r4, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022619D0: .word 0x00000312
_022619D4: .word 0x00000311
_022619D8: .word 0x00000313
_022619DC: .word 0x00000316
_022619E0: .word 0x00000315
	thumb_func_end ov12_02261928

	thumb_func_start ov12_022619E4
ov12_022619E4: ; 0x022619E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r6, #0
	add r5, r0, #0
	str r2, [sp]
	add r7, r3, #0
	str r6, [sp, #4]
	add r4, r6, #0
	bl ov12_0223A7F0
	cmp r0, #0
	ble _02261A2C
_022619FC:
	add r0, r4, #0
	bl MaskOfFlagNo
	ldr r1, [sp]
	ldrb r1, [r1, #1]
	tst r0, r1
	beq _02261A20
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0223AB1C
	cmp r0, #0
	beq _02261A1E
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	b _02261A20
_02261A1E:
	add r6, r6, #1
_02261A20:
	add r0, r5, #0
	add r4, r4, #1
	bl ov12_0223A7F0
	cmp r4, r0
	blt _022619FC
_02261A2C:
	cmp r6, #0
	beq _02261A4A
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02261A4A
	ldr r0, _02261ACC ; =0x0000030D
	mov r1, #0xc3
	strh r0, [r7, #2]
	mov r0, #0
	strb r0, [r7, #1]
	add r0, r5, #0
	bl ov12_0223BD20
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02261A4A:
	cmp r6, #0
	beq _02261A62
	ldr r0, _02261ACC ; =0x0000030D
	mov r1, #0xc2
	strh r0, [r7, #2]
	mov r0, #0
	strb r0, [r7, #1]
	add r0, r5, #0
	bl ov12_0223BD20
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02261A62:
	add r0, r5, #0
	bl ov12_0223A7E0
	mov r1, #8
	tst r0, r1
	beq _02261A8E
	mov r0, #0xc6
	lsl r0, r0, #2
	strh r0, [r7, #2]
	mov r0, #0x1a
	strb r0, [r7, #1]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223AAD8
	str r0, [r7, #4]
	add r0, r5, #0
	mov r1, #5
	bl ov12_0223AAD8
	str r0, [r7, #8]
	b _02261ABE
_02261A8E:
	add r0, r5, #0
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	ldr r0, _02261AD0 ; =0x00000317
	beq _02261AAE
	strh r0, [r7, #2]
	mov r0, #8
	strb r0, [r7, #1]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223AAD8
	str r0, [r7, #4]
	b _02261ABE
_02261AAE:
	strh r0, [r7, #2]
	mov r0, #8
	strb r0, [r7, #1]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223AAD8
	str r0, [r7, #4]
_02261ABE:
	add r0, r5, #0
	mov r1, #0xc1
	bl ov12_0223BD20
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02261ACC: .word 0x0000030D
_02261AD0: .word 0x00000317
	thumb_func_end ov12_022619E4

	thumb_func_start ov12_02261AD4
ov12_02261AD4: ; 0x02261AD4
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #0xef
	add r4, r2, #0
	lsl r1, r1, #2
	strh r1, [r4, #2]
	mov r1, #8
	add r5, r0, #0
	strb r1, [r4, #1]
	bl ov12_0223A7E0
	mov r1, #4
	tst r0, r1
	beq _02261B1A
	add r0, r5, #0
	bl ov12_0223BFC0
	add r1, r0, #0
	add r0, r5, #0
	bl ov12_0223BFCC
	cmp r0, #0
	beq _02261B0E
	add r0, r5, #0
	mov r1, #4
	bl ov12_0223AAD8
	str r0, [r4, #4]
	b _02261B22
_02261B0E:
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223AAD8
	str r0, [r4, #4]
	b _02261B22
_02261B1A:
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r6, r0]
	str r0, [r4, #4]
_02261B22:
	add r0, r5, #0
	mov r1, #0xc2
	bl ov12_0223BD20
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_02261AD4

	thumb_func_start ov12_02261B2C
ov12_02261B2C: ; 0x02261B2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov12_0223A8E4
	str r0, [sp, #0x1c]
	add r0, r5, #0
	bl ov12_0223A8EC
	str r0, [sp, #0x18]
	add r0, r5, #0
	bl ov12_0223A938
	add r2, r0, #0
	mov r0, #1
	tst r0, r4
	beq _02261B58
	mov r1, #2
	b _02261B5A
_02261B58:
	mov r1, #0
_02261B5A:
	add r3, sp, #0x28
	mov r0, #0x18
	ldrsh r0, [r3, r0]
	mov r4, #0x14
	str r0, [sp]
	str r6, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x18]
	str r0, [sp, #0xc]
	str r7, [sp, #0x10]
	mov r0, #5
	str r0, [sp, #0x14]
	ldrsh r3, [r3, r4]
	ldr r0, [sp, #0x1c]
	bl sub_02070C24
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_02261B2C

	thumb_func_start ov12_02261B80
ov12_02261B80: ; 0x02261B80
	push {r4, r5, r6, r7, lr}
	sub sp, #0xac
	str r0, [sp]
	ldr r0, [r3, #0x4c]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	cmp r0, #0
	bne _02261B9E
	mov r0, #0xa
	str r0, [sp, #0x84]
	add r0, r3, #0
	ldrh r0, [r0, #2]
	str r0, [sp, #0x18]
	b _02261BA8
_02261B9E:
	mov r0, #0x3d
	str r0, [sp, #0x84]
	add r0, r3, #0
	ldr r0, [r0, #0x50]
	str r0, [sp, #0x18]
_02261BA8:
	ldr r0, [sp]
	bl ov12_0223A7D4
	str r0, [sp, #0x20]
	ldr r0, [sp]
	bl ov12_0223A938
	str r0, [sp, #0x24]
	ldr r0, [sp]
	bl ov12_0223A8E4
	add r5, sp, #0x1c
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	mov r4, #0
	str r0, [sp, #0x14]
	str r5, [sp, #0x10]
	add r6, r5, #0
	add r7, r0, #0
_02261BCE:
	ldr r0, [sp]
	add r1, r4, #0
	bl ov12_0223BB88
	str r0, [r5, #0xc]
	ldr r0, [sp, #0x14]
	ldrh r1, [r0, #0x18]
	ldr r0, [sp, #0x10]
	strh r1, [r0, #0x34]
	ldr r0, [sp, #0xc]
	add r0, r0, r4
	add r0, #0x20
	ldrb r1, [r0]
	add r0, r6, #0
	add r0, #0x3c
	strb r1, [r0]
	ldr r0, [sp, #0xc]
	add r0, r0, r4
	add r0, #0x24
	ldrb r1, [r0]
	add r0, r6, #0
	add r0, #0x40
	strb r1, [r0]
	ldr r0, [sp, #0xc]
	add r0, r0, r4
	add r0, #0x28
	ldrb r1, [r0]
	add r0, r6, #0
	add r0, #0x44
	strb r1, [r0]
	ldr r0, [r7, #0x2c]
	add r4, r4, #1
	str r0, [r5, #0x48]
	ldr r0, [r7, #0x3c]
	add r6, r6, #1
	str r0, [r5, #0x58]
	ldr r0, [sp, #0x14]
	add r5, r5, #4
	add r0, r0, #2
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r7, r7, #4
	add r0, r0, #2
	str r0, [sp, #0x10]
	cmp r4, #4
	blt _02261BCE
	ldr r0, [sp]
	add r1, sp, #0x38
	bl ov12_0223C1C4
	ldr r0, [sp]
	add r1, sp, #0x3c
	bl ov12_0223C1F4
	ldr r0, [sp]
	bl ov12_0223A7E0
	mov r2, #0x65
	str r0, [sp, #0x4c]
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	ldrb r1, [r1, r2]
	ldr r0, [sp]
	bl ov12_0223B758
	str r0, [sp, #0xa0]
	ldr r0, [sp]
	bl ov12_0223BAD0
	str r0, [sp, #0xa4]
	ldr r0, [sp]
	bl ov12_0223BAD8
	str r0, [sp, #0xa8]
	mov r0, #7
	str r0, [sp, #0x88]
	ldr r0, [sp]
	bl ov12_0223AB54
	add r0, r0, #3
	str r0, [sp, #0x8c]
	ldr r0, [sp]
	bl ov12_0223B52C
	add r4, r0, #0
	ldr r0, [sp]
	bl ov12_0223AB54
	lsl r1, r0, #1
	add r0, r0, r1
	add r0, #0xb0
	add r0, r4, r0
	str r0, [sp, #0x90]
	mov r0, #2
	str r0, [sp, #0x94]
	mov r0, #0
	ldr r2, [sp, #0x18]
	str r0, [sp, #0x98]
	mov r0, #8
	str r0, [sp, #0x9c]
	lsl r2, r2, #0x10
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	lsr r2, r2, #0x10
	add r3, sp, #0x1c
	bl ov07_0221C01C
	add sp, #0xac
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov12_02261B80

	thumb_func_start ov12_02261CA8
ov12_02261CA8: ; 0x02261CA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r2, #0
	add r7, r1, #0
	str r3, [r6]
	str r0, [sp]
	str r3, [r6, #4]
	mov r4, #0
	add r5, r6, #0
	str r7, [sp, #0xc]
	str r6, [sp, #8]
	str r7, [sp, #4]
_02261CC0:
	ldr r0, [sp]
	add r1, r4, #0
	bl ov12_0223BB88
	str r0, [r5, #8]
	ldr r0, [sp, #0xc]
	ldrh r1, [r0, #0x18]
	ldr r0, [sp, #8]
	strh r1, [r0, #0x28]
	add r0, r7, r4
	add r0, #0x20
	ldrb r1, [r0]
	add r0, r6, r4
	add r0, #0x30
	strb r1, [r0]
	add r0, r7, r4
	add r0, #0x24
	ldrb r1, [r0]
	add r0, r6, r4
	add r0, #0x34
	strb r1, [r0]
	add r0, r7, r4
	add r0, #0x28
	ldrb r1, [r0]
	add r0, r6, r4
	add r0, #0x38
	strb r1, [r0]
	ldr r0, [sp, #4]
	add r4, r4, #1
	ldr r0, [r0, #0x2c]
	str r0, [r5, #0x3c]
	ldr r0, [sp, #0xc]
	add r5, r5, #4
	add r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r0, r0, #2
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r0, r0, #4
	str r0, [sp, #4]
	cmp r4, #4
	blt _02261CC0
	add r1, r6, #0
	ldr r0, [sp]
	add r1, #0x4c
	bl ov12_0223C1C4
	add r6, #0x18
	ldr r0, [sp]
	add r1, r6, #0
	bl ov12_0223C1F4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_02261CA8

	thumb_func_start ov12_02261D30
ov12_02261D30: ; 0x02261D30
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r2, #0
	bne _02261D6E
	add r0, sp, #0
	ldrh r6, [r0, #0x10]
	mov r1, #9
	add r0, r6, #0
	bl GetWazaAttr
	mov r1, #0x40
	tst r0, r1
	bne _02261D50
	mov r0, #1
	b _02261D52
_02261D50:
	mov r0, #0
_02261D52:
	strb r0, [r4]
	add r0, r6, #0
	mov r1, #9
	bl GetWazaAttr
	mov r1, #0x80
	tst r0, r1
	beq _02261D68
	mov r0, #1
	strb r0, [r5]
	pop {r4, r5, r6, pc}
_02261D68:
	mov r0, #0
	strb r0, [r5]
	pop {r4, r5, r6, pc}
_02261D6E:
	sub r3, #0x12
	cmp r3, #0x15
	bhi _02261DBE
	add r0, r3, r3
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02261D80: ; jump table
	.short _02261DAC - _02261D80 - 2 ; case 0
	.short _02261DAC - _02261D80 - 2 ; case 1
	.short _02261DAC - _02261D80 - 2 ; case 2
	.short _02261DAC - _02261D80 - 2 ; case 3
	.short _02261DAC - _02261D80 - 2 ; case 4
	.short _02261DBE - _02261D80 - 2 ; case 5
	.short _02261DBE - _02261D80 - 2 ; case 6
	.short _02261DBE - _02261D80 - 2 ; case 7
	.short _02261DBE - _02261D80 - 2 ; case 8
	.short _02261DBE - _02261D80 - 2 ; case 9
	.short _02261DBE - _02261D80 - 2 ; case 10
	.short _02261DBE - _02261D80 - 2 ; case 11
	.short _02261DBE - _02261D80 - 2 ; case 12
	.short _02261DAC - _02261D80 - 2 ; case 13
	.short _02261DAC - _02261D80 - 2 ; case 14
	.short _02261DBE - _02261D80 - 2 ; case 15
	.short _02261DAC - _02261D80 - 2 ; case 16
	.short _02261DAC - _02261D80 - 2 ; case 17
	.short _02261DB6 - _02261D80 - 2 ; case 18
	.short _02261DAC - _02261D80 - 2 ; case 19
	.short _02261DB6 - _02261D80 - 2 ; case 20
	.short _02261DAC - _02261D80 - 2 ; case 21
_02261DAC:
	mov r0, #1
	strb r0, [r4]
	mov r0, #0
	strb r0, [r5]
	pop {r4, r5, r6, pc}
_02261DB6:
	mov r0, #1
	strb r0, [r4]
	strb r0, [r5]
	pop {r4, r5, r6, pc}
_02261DBE:
	mov r0, #0
	strb r0, [r4]
	strb r0, [r5]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_02261D30

	thumb_func_start ov12_02261DC8
ov12_02261DC8: ; 0x02261DC8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r4, #0
	bl sub_0200E11C
	cmp r0, #1
	beq _02261DE0
	ldr r1, _02261E38 ; =0x00000FFF
	cmp r0, r1
	beq _02261E0A
	b _02261E0E
_02261DE0:
	ldrh r1, [r5, #0x16]
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	bne _02261E34
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strh r0, [r5, #0x16]
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r1, r0, #0
	add r2, r4, #0
	str r2, [r1]
	ldr r0, _02261E3C ; =ov12_02261E40
	str r2, [r1, #4]
	bl CreateSysTask
	b _02261E34
_02261E0A:
	mov r4, #1
	b _02261E34
_02261E0E:
	sub r1, #0xff
	add r2, r0, #0
	and r2, r1
	mov r1, #1
	lsl r1, r1, #8
	cmp r2, r1
	bne _02261E34
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	beq _02261E34
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	bl sub_0200DCC0
	ldr r0, [r5, #0xc]
	sub r1, r6, #1
	bl sub_0200DC4C
	mov r4, #1
_02261E34:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02261E38: .word 0x00000FFF
_02261E3C: .word ov12_02261E40
	thumb_func_end ov12_02261DC8

	thumb_func_start ov12_02261E40
ov12_02261E40: ; 0x02261E40
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02261E56
	cmp r0, #1
	beq _02261E7E
	cmp r0, #2
	beq _02261EA0
	pop {r3, r4, r5, pc}
_02261E56:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #0
	bne _02261E66
	mov r0, #2
	str r0, [r4]
	pop {r3, r4, r5, pc}
_02261E66:
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	mov r1, #0x10
	mov r2, #0
	mov r3, #0x3d
	bl sub_0200B484
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_02261E7E:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #1
	bne _02261EB6
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	mov r1, #0
	mov r2, #0x10
	mov r3, #0x3d
	bl sub_0200B484
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_02261EA0:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #1
	bne _02261EB6
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_02261EB6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02261E40

	thumb_func_start ov12_02261EB8
ov12_02261EB8: ; 0x02261EB8
	push {r4, lr}
	add r4, r0, #0
	mov r1, #1
	bl ov12_0223BFFC
	add r0, r4, #0
	bl ov12_0223A7E4
	add r1, r0, #0
	add r0, r4, #0
	bl ov12_022581BC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_02261EB8

	thumb_func_start ov12_02261ED4
ov12_02261ED4: ; 0x02261ED4
	push {r4, lr}
	add r4, r0, #0
	mov r1, #2
	bl ov12_0223BFFC
	add r0, r4, #0
	bl ov12_0223A7E4
	add r1, r0, #0
	add r0, r4, #0
	bl ov12_022581BC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_02261ED4

	thumb_func_start ov12_02261EF0
ov12_02261EF0: ; 0x02261EF0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl ov12_0223A7E0
	mov r1, #4
	tst r0, r1
	beq _02261F0A
	cmp r4, #0
	beq _02261F0E
	cmp r4, #1
	beq _02261F0E
_02261F0A:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_02261F0E:
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_0223AA40
	bl PlayerProfile_GetVersion
	cmp r0, #0
	beq _02261F24
	cmp r0, #0xc
	beq _02261F2C
	b _02261F32
_02261F24:
	add r4, #0x7d
	lsl r0, r4, #0x18
	lsr r4, r0, #0x18
	b _02261F32
_02261F2C:
	add r4, #0x7f
	lsl r0, r4, #0x18
	lsr r4, r0, #0x18
_02261F32:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_02261EF0

	thumb_func_start ov12_02261F38
ov12_02261F38: ; 0x02261F38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	add r4, r2, #0
	mov r2, #0
	add r1, sp, #0x14
	add r7, r0, #0
	add r6, r3, #0
	strb r2, [r1]
	bl ov12_0223B6D4
	cmp r0, #1
	bne _02261F8C
	add r0, r6, #0
	mov r1, #1
	bl sub_02008550
	add r0, r7, #0
	bl ov12_0223B750
	add r1, r0, #0
	ldr r0, [sp, #0x3c]
	ldr r3, [sp, #0x34]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	lsl r3, r3, #0x10
	ldr r0, [sp, #0x30]
	add r2, r6, #0
	lsr r3, r3, #0x10
	str r5, [sp, #8]
	bl sub_0207294C
	ldr r2, [sp, #0x34]
	lsl r3, r4, #0x10
	lsl r2, r2, #0x10
	ldr r0, [sp, #0x30]
	add r1, sp, #0x14
	lsr r2, r2, #0x10
	lsr r3, r3, #0x10
	bl sub_020729A4
_02261F8C:
	ldr r0, [sp, #0x3c]
	cmp r0, #2
	bne _02261F96
	mov r4, #0x75
	b _02261F9A
_02261F96:
	mov r4, #0x74
	mvn r4, r4
_02261F9A:
	add r0, sp, #0x14
	ldrb r1, [r0]
	cmp r1, #0
	bne _02261FA6
	mov r1, #8
	strb r1, [r0]
_02261FA6:
	add r0, r7, #0
	add r1, r5, #0
	bl ov12_0223B758
	ldr r2, [sp, #0x34]
	str r4, [sp]
	mov r1, #0x7f
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #5
	str r1, [sp, #0xc]
	add r1, sp, #0x14
	ldrb r1, [r1]
	lsl r2, r2, #0x10
	ldr r3, [sp, #0x38]
	str r1, [sp, #0x10]
	ldr r1, [sp, #0x40]
	lsr r2, r2, #0x10
	bl sub_0207204C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_02261F38

	thumb_func_start ov12_02261FD4
ov12_02261FD4: ; 0x02261FD4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02262008
	add r0, r1, #0
	bl ov12_0223A7E0
	mov r1, #0x22
	lsl r1, r1, #4
	tst r0, r1
	bne _02262008
	mov r1, #0xb4
	add r0, r1, #0
	add r0, #0xe8
	strh r1, [r4, r0]
	ldr r0, _0226200C ; =ov12_0226203C
	ldr r2, _02262010 ; =0x000003F2
	add r1, r4, #0
	bl CreateSysTask
	mov r1, #0x66
	lsl r1, r1, #2
	str r0, [r4, r1]
_02262008:
	pop {r4, pc}
	nop
_0226200C: .word ov12_0226203C
_02262010: .word 0x000003F2
	thumb_func_end ov12_02261FD4

	thumb_func_start ov12_02262014
ov12_02262014: ; 0x02262014
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0226203A
	bl DestroySysTask
	mov r0, #0x66
	mov r2, #0
	lsl r0, r0, #2
	str r2, [r4, r0]
	add r0, r0, #4
	strh r2, [r4, r0]
	ldr r0, [r4, #0x20]
	mov r1, #4
	bl sub_020087A4
_0226203A:
	pop {r4, pc}
	thumb_func_end ov12_02262014

	thumb_func_start ov12_0226203C
ov12_0226203C: ; 0x0226203C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x67
	lsl r1, r1, #2
	ldrh r0, [r4, r1]
	add r0, #0x14
	strh r0, [r4, r1]
	add r0, r1, #0
	ldrh r2, [r4, r1]
	sub r0, #0x34
	cmp r2, r0
	blo _0226205C
	add r0, r1, #0
	sub r0, #0x34
	sub r0, r2, r0
	strh r0, [r4, r1]
_0226205C:
	mov r0, #0x67
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	bl GF_SinDegNoWrap
	mov r2, #6
	asr r1, r0, #0x1f
	lsl r2, r2, #0xa
	mov r3, #0
	bl _ll_mul
	add r2, r1, #0
	mov r1, #4
	add r5, r0, #0
	ldr r0, [r4, #0x20]
	mov r4, #0
	lsl r3, r1, #9
	add r3, r5, r3
	adc r2, r4
	lsl r2, r2, #0x14
	lsr r3, r3, #0xc
	orr r3, r2
	asr r2, r3, #0xb
	lsr r2, r2, #0x14
	add r2, r3, r2
	asr r2, r2, #0xc
	bl sub_020087A4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0226203C

	thumb_func_start ov12_02262098
ov12_02262098: ; 0x02262098
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	add r6, r3, #0
	str r1, [sp]
	str r2, [sp, #4]
	cmp r1, #1
	bne _022620BE
	bl ov12_0223A948
	add r4, r0, #0
	add r0, r7, #0
	bl ov12_0223A984
	add r5, r0, #0
	add r0, r7, #0
	bl ov12_0223A990
	b _022620D2
_022620BE:
	bl ov12_0223A940
	add r4, r0, #0
	add r0, r7, #0
	bl ov12_0223A960
	add r5, r0, #0
	add r0, r7, #0
	bl ov12_0223A96C
_022620D2:
	add r7, r0, #0
	add r0, sp, #0x10
	ldrh r2, [r5]
	ldrb r3, [r0, #0x10]
	add r0, r2, #5
	add r1, r0, r3
	mov r0, #1
	lsl r0, r0, #0xc
	cmp r1, r0
	bls _022620EC
	strh r2, [r7]
	mov r0, #0
	strh r0, [r5]
_022620EC:
	ldr r1, [sp]
	add r0, sp, #8
	strb r1, [r0]
	ldr r1, [sp, #4]
	strb r1, [r0, #1]
	add r1, sp, #0x10
	ldrb r1, [r1, #0x10]
	strh r1, [r0, #2]
	add r1, sp, #8
	mov r0, #0
_02262100:
	ldrb r7, [r1, r0]
	ldrh r2, [r5]
	add r0, r0, #1
	strb r7, [r4, r2]
	ldrh r2, [r5]
	add r2, r2, #1
	strh r2, [r5]
	cmp r0, #4
	blo _02262100
	mov r0, #0
	cmp r3, #0
	ble _0226212A
_02262118:
	ldrb r2, [r6, r0]
	ldrh r1, [r5]
	add r0, r0, #1
	strb r2, [r4, r1]
	ldrh r1, [r5]
	add r1, r1, #1
	strh r1, [r5]
	cmp r0, r3
	blt _02262118
_0226212A:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_02262098

	thumb_func_start ov12_02262130
ov12_02262130: ; 0x02262130
	push {r3, r4, r5, r6, r7, lr}
	add r3, r1, #0
	ldrb r6, [r3, #3]
	ldrb r1, [r3]
	ldrb r7, [r3, #2]
	lsl r6, r6, #8
	add r5, r0, #0
	mov r2, #0
	orr r6, r7
	ldrb r4, [r3, #1]
	cmp r1, #0
	bne _02262176
	ldr r0, [r5, #0x30]
	lsl r1, r4, #8
	add r4, r0, r1
	mov r0, #0x23
	lsl r0, r0, #8
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _022621C0
	cmp r6, #0
	ble _02262172
	mov r4, #0x23
	lsl r4, r4, #8
_02262160:
	add r0, r3, r2
	ldr r7, [r5, #0x30]
	ldrb r0, [r0, #4]
	add r7, r1, r7
	add r7, r2, r7
	add r2, r2, #1
	strb r0, [r7, r4]
	cmp r2, r6
	blt _02262160
_02262172:
	mov r2, #1
	b _022621C0
_02262176:
	cmp r1, #1
	bne _022621A2
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r1, [r0, #0x34]
	add r1, #0x94
	ldrb r1, [r1]
	cmp r1, #0
	bne _022621C0
	cmp r6, #0
	ble _0226219E
_0226218C:
	add r1, r3, r2
	ldrb r4, [r1, #4]
	ldr r1, [r0, #0x34]
	add r1, r1, r2
	add r1, #0x94
	add r2, r2, #1
	strb r4, [r1]
	cmp r2, r6
	blt _0226218C
_0226219E:
	mov r2, #1
	b _022621C0
_022621A2:
	cmp r1, #2
	bne _022621C0
	ldrb r7, [r3, #4]
	ldrb r6, [r3, #5]
	bl ov12_0223B688
	cmp r0, #0
	beq _022621BE
	ldr r0, [r5, #0x30]
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl ov12_0224ED00
_022621BE:
	mov r2, #1
_022621C0:
	add r0, r2, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_02262130

	thumb_func_start ov12_022621C4
ov12_022621C4: ; 0x022621C4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	cmp r1, #1
	bne _022621EA
	bl ov12_0223A948
	add r6, r0, #0
	add r0, r5, #0
	bl ov12_0223A978
	add r4, r0, #0
	add r0, r5, #0
	bl ov12_0223A984
	add r7, r0, #0
	add r0, r5, #0
	bl ov12_0223A990
	b _02262206
_022621EA:
	bl ov12_0223A940
	add r6, r0, #0
	add r0, r5, #0
	bl ov12_0223A954
	add r4, r0, #0
	add r0, r5, #0
	bl ov12_0223A960
	add r7, r0, #0
	add r0, r5, #0
	bl ov12_0223A96C
_02262206:
	ldrh r1, [r4]
	ldrh r2, [r7]
	cmp r1, r2
	beq _0226223C
	ldrh r2, [r0]
	cmp r1, r2
	bne _0226221A
	mov r1, #0
	strh r1, [r4]
	strh r1, [r0]
_0226221A:
	ldrh r1, [r4]
	add r0, r5, #0
	add r1, r6, r1
	bl ov12_02262130
	cmp r0, #1
	bne _0226223C
	ldrh r0, [r4]
	add r1, r0, #2
	ldrb r2, [r6, r1]
	add r1, r0, #3
	ldrb r1, [r6, r1]
	lsl r1, r1, #8
	orr r1, r2
	add r1, r1, #4
	add r0, r0, r1
	strh r0, [r4]
_0226223C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_022621C4

	thumb_func_start ov12_02262240
ov12_02262240: ; 0x02262240
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	str r1, [sp, #4]
	ldr r1, [r5, #0x2c]
	mov r0, #4
	add r7, r2, #0
	add r6, r3, #0
	tst r0, r1
	beq _0226229A
	ldr r0, _022622C4 ; =0x0000240C
	ldr r1, [r5, r0]
	mov r0, #0x10
	tst r0, r1
	bne _0226229A
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _02262284
	mov r4, #0
	bl sub_02037454
	cmp r0, #0
	ble _02262284
_0226226E:
	ldrb r3, [r6]
	ldr r0, [r5, #0x30]
	add r1, r4, #0
	add r2, r7, #0
	bl ov12_0224ECC4
	add r4, r4, #1
	bl sub_02037454
	cmp r4, r0
	blt _0226226E
_02262284:
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	ldr r1, [sp, #4]
	add r2, r7, #0
	str r0, [sp]
	add r0, r5, #0
	add r3, r6, #0
	bl sub_02074F9C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0226229A:
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _022622AC
	ldrb r3, [r6]
	ldr r0, [r5, #0x30]
	mov r1, #0
	add r2, r7, #0
	bl ov12_0224ECC4
_022622AC:
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	ldr r1, [sp, #4]
	add r2, r7, #0
	str r0, [sp]
	add r0, r5, #0
	add r3, r6, #0
	bl ov12_02262098
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022622C4: .word 0x0000240C
	thumb_func_end ov12_02262240

	thumb_func_start ov12_022622C8
ov12_022622C8: ; 0x022622C8
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	mov r1, #1
	add r5, r0, #0
	str r1, [sp, #4]
	bl ov12_0223BDC4
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #4
	bl ov12_02262240
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_022622C8

	thumb_func_start ov12_022622F0
ov12_022622F0: ; 0x022622F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r7, r1, #0
	mov r3, #2
	add r2, sp, #4
	strb r3, [r2]
	mov r2, #0xc0
	add r4, r7, #0
	mul r4, r2
	add r2, sp, #4
	ldrb r5, [r2, #1]
	mov r2, #3
	add r6, r0, #0
	bic r5, r2
	ldr r2, [r6, #0x30]
	add r3, r2, r4
	ldr r2, _022623E8 ; =0x00002DBE
	mov ip, r2
	ldrb r2, [r3, r2]
	lsl r2, r2, #0x1c
	lsr r3, r2, #0x1c
	mov r2, #3
	and r2, r3
	add r3, r5, #0
	orr r3, r2
	add r2, sp, #4
	strb r3, [r2, #1]
	ldrb r5, [r2, #1]
	mov r2, #4
	bic r5, r2
	ldr r2, [r6, #0x30]
	add r3, r2, r4
	mov r2, ip
	sub r2, #0x58
	ldrb r2, [r3, r2]
	add r3, r5, #0
	lsl r2, r2, #0x1a
	lsr r2, r2, #0x1f
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1d
	orr r3, r2
	add r2, sp, #4
	strb r3, [r2, #1]
	ldr r2, [r6, #0x30]
	add r3, r2, r4
	mov r2, ip
	sub r2, #0x7e
	ldrh r3, [r3, r2]
	add r2, sp, #4
	strh r3, [r2, #2]
	ldr r2, [r6, #0x30]
	add r3, r2, r4
	mov r2, ip
	sub r2, #0x16
	ldr r2, [r3, r2]
	str r2, [sp, #8]
	bl ov12_0223AB0C
	add r2, r0, #0
	ldr r0, [r6, #0x30]
	add r1, r7, #0
	mov r3, #1
	bl ov12_02256748
	add r2, sp, #4
	str r0, [sp, #0xc]
	ldrb r0, [r2, #1]
	mov r1, #0xf8
	add r5, sp, #4
	bic r0, r1
	ldr r1, [r6, #0x30]
	add r3, r1, r4
	ldr r1, _022623EC ; =0x00002D66
	mov r4, #0
	ldrb r1, [r3, r1]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1b
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r2, #1]
_02262392:
	ldr r0, [r6, #0x30]
	add r1, r7, #0
	add r2, r4, #6
	mov r3, #0
	bl ov12_0224EDE0
	strh r0, [r5, #0xc]
	add r2, r4, #0
	ldr r0, [r6, #0x30]
	add r1, r7, #0
	add r2, #0x1f
	mov r3, #0
	bl ov12_0224EDE0
	strh r0, [r5, #0x14]
	add r2, r4, #0
	ldr r0, [r6, #0x30]
	add r1, r7, #0
	add r2, #0x27
	mov r3, #0
	bl ov12_0224EDE0
	strh r0, [r5, #0x1c]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #4
	blt _02262392
	ldr r0, [r6, #0x30]
	add r1, r7, #0
	mov r2, #0x2d
	add r3, sp, #0x28
	bl ov12_0224EDE0
	mov r0, #0x3c
	str r0, [sp]
	add r0, r6, #0
	mov r1, #1
	add r2, r7, #0
	add r3, sp, #4
	bl ov12_02262240
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022623E8: .word 0x00002DBE
_022623EC: .word 0x00002D66
	thumb_func_end ov12_022622F0

	thumb_func_start ov12_022623F0
ov12_022623F0: ; 0x022623F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x78
	add r7, r1, #0
	add r3, sp, #4
	mov r2, #3
	strb r2, [r3]
	mov r2, #0xc0
	add r4, r7, #0
	mul r4, r2
	add r2, r3, #0
	ldrb r5, [r2, #1]
	mov r2, #3
	add r6, r0, #0
	bic r5, r2
	ldr r2, [r6, #0x30]
	add r3, r2, r4
	ldr r2, _02262518 ; =0x00002DBE
	mov ip, r2
	ldrb r2, [r3, r2]
	lsl r2, r2, #0x1c
	lsr r3, r2, #0x1c
	mov r2, #3
	and r2, r3
	add r3, r5, #0
	orr r3, r2
	add r2, sp, #4
	strb r3, [r2, #1]
	ldrb r5, [r2, #1]
	mov r2, #4
	bic r5, r2
	ldr r2, [r6, #0x30]
	add r3, r2, r4
	mov r2, ip
	sub r2, #0x58
	ldrb r2, [r3, r2]
	add r3, r5, #0
	lsl r2, r2, #0x1a
	lsr r2, r2, #0x1f
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1d
	orr r3, r2
	add r2, sp, #4
	strb r3, [r2, #1]
	ldr r2, [r6, #0x30]
	add r3, r2, r4
	mov r2, ip
	sub r2, #0x7e
	ldrh r3, [r3, r2]
	add r2, sp, #4
	strh r3, [r2, #2]
	ldr r2, [r6, #0x30]
	add r3, r2, r4
	mov r2, ip
	sub r2, #0x16
	ldr r2, [r3, r2]
	str r2, [sp, #8]
	bl ov12_0223AB0C
	add r2, r0, #0
	ldr r0, [r6, #0x30]
	add r1, r7, #0
	mov r3, #1
	bl ov12_02256748
	str r0, [sp, #0xc]
	ldr r0, [r6, #0x30]
	add r2, sp, #4
	add r1, r0, r7
	ldr r0, _0226251C ; =0x0000219C
	ldrb r0, [r1, r0]
	mov r1, #0xf8
	str r0, [sp, #0x10]
	ldrb r0, [r2, #1]
	bic r0, r1
	ldr r1, [r6, #0x30]
	add r3, r1, r4
	ldr r1, _02262520 ; =0x00002D66
	ldrb r3, [r3, r1]
	add r1, #0x59
	lsl r3, r3, #0x1b
	lsr r3, r3, #0x1b
	lsl r3, r3, #0x1b
	lsr r3, r3, #0x18
	orr r0, r3
	strb r0, [r2, #1]
	ldr r0, [r6, #0x30]
	add r0, r0, r4
	ldrb r0, [r0, r1]
	add r1, r7, #0
	str r0, [sp, #0x14]
	add r0, r6, #0
	bl ov12_0223AB6C
	ldr r1, [r6, #0x30]
	ldr r2, [sp, #0x10]
	add r1, r1, r0
	ldr r0, _0226251C ; =0x0000219C
	ldrb r0, [r1, r0]
	add r1, r7, #0
	str r0, [sp, #0x4c]
	add r0, r6, #0
	bl ov12_0223B854
	mov r4, #0
	add r5, sp, #4
_022624C2:
	ldr r0, [r6, #0x30]
	add r1, r7, #0
	add r2, r4, #6
	mov r3, #0
	bl ov12_0224EDE0
	strh r0, [r5, #0x18]
	add r2, r4, #0
	ldr r0, [r6, #0x30]
	add r1, r7, #0
	add r2, #0x1f
	mov r3, #0
	bl ov12_0224EDE0
	strh r0, [r5, #0x20]
	add r2, r4, #0
	ldr r0, [r6, #0x30]
	add r1, r7, #0
	add r2, #0x27
	mov r3, #0
	bl ov12_0224EDE0
	strh r0, [r5, #0x28]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #4
	blt _022624C2
	ldr r0, [r6, #0x30]
	add r1, r7, #0
	mov r2, #0x2d
	add r3, sp, #0x34
	bl ov12_0224EDE0
	mov r0, #0x74
	str r0, [sp]
	add r0, r6, #0
	mov r1, #1
	add r2, r7, #0
	add r3, sp, #4
	bl ov12_02262240
	add sp, #0x78
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02262518: .word 0x00002DBE
_0226251C: .word 0x0000219C
_02262520: .word 0x00002D66
	thumb_func_end ov12_022623F0

	thumb_func_start ov12_02262524
ov12_02262524: ; 0x02262524
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	add r7, r1, #0
	add r4, r0, #0
	mov r1, #4
	add r6, sp, #0x10
	strb r1, [r6]
	mov r0, #0xc0
	add r5, r7, #0
	mul r5, r0
	ldr r0, [r4, #0x30]
	str r2, [sp, #4]
	add r2, r0, r5
	ldr r0, _02262718 ; =0x00002DB0
	str r3, [sp, #8]
	ldr r3, [r2, r0]
	lsl r1, r1, #0x13
	tst r1, r3
	ldrb r1, [r6, #1]
	beq _0226256E
	mov r3, #3
	bic r1, r3
	add r3, r0, #0
	add r3, #0x4a
	ldrh r2, [r2, r3]
	add r0, #0x34
	lsl r2, r2, #0x18
	lsr r3, r2, #0x18
	mov r2, #3
	and r2, r3
	orr r1, r2
	strb r1, [r6, #1]
	ldr r1, [r4, #0x30]
	add r1, r1, r5
	ldr r0, [r1, r0]
	str r0, [sp, #0x14]
	b _0226258E
_0226256E:
	mov r3, #3
	bic r1, r3
	add r3, r0, #0
	add r3, #0xe
	ldrb r2, [r2, r3]
	sub r0, #8
	lsl r2, r2, #0x1c
	lsr r3, r2, #0x1c
	mov r2, #3
	and r2, r3
	orr r1, r2
	strb r1, [r6, #1]
	ldr r1, [r4, #0x30]
	add r1, r1, r5
	ldr r0, [r1, r0]
	str r0, [sp, #0x14]
_0226258E:
	mov r0, #0xc0
	add r6, r7, #0
	add r3, sp, #0x10
	mul r6, r0
	ldrb r0, [r3, #1]
	mov r1, #4
	bic r0, r1
	ldr r1, [r4, #0x30]
	add r2, r1, r6
	ldr r1, _0226271C ; =0x00002D66
	ldrb r2, [r2, r1]
	sub r1, #0x26
	lsl r2, r2, #0x1a
	lsr r2, r2, #0x1f
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1d
	orr r0, r2
	strb r0, [r3, #1]
	ldr r0, [r4, #0x30]
	add r0, r0, r6
	ldrh r0, [r0, r1]
	add r1, r7, #0
	strh r0, [r3, #2]
	add r0, r4, #0
	bl ov12_0223AB0C
	add r2, r0, #0
	ldr r0, [r4, #0x30]
	add r1, r7, #0
	mov r3, #0
	bl ov12_02256748
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x30]
	mov r2, #0xf8
	add r1, r0, r7
	ldr r0, _02262720 ; =0x0000219C
	ldrb r0, [r1, r0]
	str r0, [sp, #0x1c]
	add r0, sp, #0x10
	ldrb r1, [r0, #1]
	bic r1, r2
	ldr r2, [r4, #0x30]
	add r3, r2, r6
	ldr r2, _0226271C ; =0x00002D66
	ldrb r3, [r3, r2]
	lsl r3, r3, #0x1b
	lsr r3, r3, #0x1b
	lsl r3, r3, #0x1b
	lsr r3, r3, #0x18
	orr r1, r3
	strb r1, [r0, #1]
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02262600
	str r0, [sp, #0x20]
	b _0226260A
_02262600:
	ldr r0, [r4, #0x30]
	add r2, #0x59
	add r0, r0, r5
	ldrb r0, [r0, r2]
	str r0, [sp, #0x20]
_0226260A:
	ldr r0, [sp, #8]
	str r0, [sp, #0x24]
	ldr r0, [r4, #0x30]
	add r1, r0, r5
	ldr r0, _02262718 ; =0x00002DB0
	ldr r1, [r1, r0]
	mov r0, #1
	lsl r0, r0, #0x18
	tst r0, r1
	beq _02262622
	mov r0, #1
	b _02262624
_02262622:
	mov r0, #0
_02262624:
	ldr r2, [sp, #0x1c]
	str r0, [sp, #0x5c]
	add r0, r4, #0
	add r1, r7, #0
	bl ov12_0223B854
	mov r6, #0
	add r5, sp, #0x10
_02262634:
	ldr r0, [r4, #0x30]
	add r1, r7, #0
	add r2, r6, #6
	mov r3, #0
	bl ov12_0224EDE0
	strh r0, [r5, #0x18]
	add r2, r6, #0
	ldr r0, [r4, #0x30]
	add r1, r7, #0
	add r2, #0x1f
	mov r3, #0
	bl ov12_0224EDE0
	strh r0, [r5, #0x20]
	add r2, r6, #0
	ldr r0, [r4, #0x30]
	add r1, r7, #0
	add r2, #0x27
	mov r3, #0
	bl ov12_0224EDE0
	strh r0, [r5, #0x28]
	add r6, r6, #1
	add r5, r5, #2
	cmp r6, #4
	blt _02262634
	ldr r0, [r4, #0x30]
	add r1, r7, #0
	mov r2, #0x2d
	add r3, sp, #0x40
	bl ov12_0224EDE0
	add r3, sp, #0x10
	mov r2, #0
	mov ip, r2
	str r3, [sp, #0xc]
	add r5, r3, #0
_02262680:
	ldr r0, [r4, #0x30]
	add r1, r0, r2
	mov r0, #0xb5
	lsl r0, r0, #6
	ldrh r1, [r1, r0]
	ldr r0, [sp, #0xc]
	add r0, #0x50
	strh r1, [r0]
	ldr r0, [r4, #0x30]
	add r1, r0, r2
	ldr r0, _0226271C ; =0x00002D66
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x1a
	lsr r1, r0, #0x1f
	add r0, r3, #0
	add r0, #0x5c
	strb r1, [r0]
	ldr r0, [r4, #0x30]
	add r1, r0, r2
	ldr r0, _0226271C ; =0x00002D66
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x1b
	add r0, r3, #0
	add r0, #0x60
	strb r1, [r0]
	ldr r0, [r4, #0x30]
	add r6, r0, r2
	ldr r0, _02262718 ; =0x00002DB0
	ldr r1, [r6, r0]
	mov r0, #2
	lsl r0, r0, #0x14
	tst r0, r1
	beq _022626D6
	ldr r0, _02262724 ; =0x00002DFA
	ldrh r1, [r6, r0]
	add r0, r3, #0
	add r0, #0x58
	strb r1, [r0]
	ldr r0, [r4, #0x30]
	add r1, r0, r2
	ldr r0, _02262728 ; =0x00002DE4
	b _022626EA
_022626D6:
	ldr r0, _0226272C ; =0x00002DBE
	ldrb r0, [r6, r0]
	lsl r0, r0, #0x1c
	lsr r1, r0, #0x1c
	add r0, r3, #0
	add r0, #0x58
	strb r1, [r0]
	ldr r0, [r4, #0x30]
	add r1, r0, r2
	ldr r0, _02262730 ; =0x00002DA8
_022626EA:
	ldr r0, [r1, r0]
	add r2, #0xc0
	str r0, [r5, #0x64]
	ldr r0, [sp, #0xc]
	add r3, r3, #1
	add r0, r0, #2
	str r0, [sp, #0xc]
	mov r0, ip
	add r0, r0, #1
	add r5, r5, #4
	mov ip, r0
	cmp r0, #4
	blt _02262680
	mov r0, #0x74
	str r0, [sp]
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	add r3, sp, #0x10
	bl ov12_02262240
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02262718: .word 0x00002DB0
_0226271C: .word 0x00002D66
_02262720: .word 0x0000219C
_02262724: .word 0x00002DFA
_02262728: .word 0x00002DE4
_0226272C: .word 0x00002DBE
_02262730: .word 0x00002DA8
	thumb_func_end ov12_02262524

	thumb_func_start ov12_02262734
ov12_02262734: ; 0x02262734
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r4, r1, #0
	lsl r1, r2, #2
	str r0, [sp, #4]
	add r0, r0, r1
	ldr r1, [r0, #0x34]
	ldr r0, _02262880 ; =0x00000195
	str r2, [sp, #8]
	ldrb r1, [r1, r0]
	mov r0, #1
	tst r0, r1
	beq _02262752
	mov r2, #2
	b _02262754
_02262752:
	mov r2, #0
_02262754:
	ldr r1, [sp, #8]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, [sp, #4]
	mov r6, #5
	ldr r1, [r1, #0x30]
	add r5, sp, #0xc
	add r3, r1, r0
	ldr r1, _02262884 ; =0x00002D66
	ldrb r3, [r3, r1]
	strb r6, [r5]
	ldr r5, [sp, #4]
	lsl r3, r3, #0x1b
	ldr r5, [r5, #0x30]
	lsr r3, r3, #0x1b
	add r5, r5, r0
	add r0, r1, #0
	add r0, #0x4a
	ldr r6, [r5, r0]
	mov r0, #2
	lsl r0, r0, #0x14
	tst r0, r6
	beq _022627A6
	add r0, r1, #0
	add r0, #0x7e
	ldr r0, [r5, r0]
	lsl r2, r2, #0x18
	str r0, [sp]
	add r0, r1, #0
	add r1, #0x94
	ldrh r1, [r5, r1]
	sub r0, #0x26
	lsl r3, r3, #0x18
	lsl r1, r1, #0x18
	ldrh r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_020708D8
	b _022627C8
_022627A6:
	add r0, r1, #0
	add r0, #0x42
	ldr r0, [r5, r0]
	lsl r2, r2, #0x18
	str r0, [sp]
	add r0, r1, #0
	add r1, #0x58
	ldrb r1, [r5, r1]
	sub r0, #0x26
	lsl r3, r3, #0x18
	lsl r1, r1, #0x1c
	ldrh r0, [r5, r0]
	lsr r1, r1, #0x1c
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_020708D8
_022627C8:
	add r1, sp, #0xc
	strb r0, [r1, #1]
	ldr r1, [sp, #8]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, [sp, #4]
	ldr r2, _02262888 ; =0x00002DBF
	ldr r1, [r1, #0x30]
	add r1, r1, r0
	ldrb r3, [r1, r2]
	add r1, sp, #0xc
	sub r2, #0xf
	strh r3, [r1, #2]
	ldr r1, [sp, #4]
	ldr r1, [r1, #0x30]
	add r0, r1, r0
	ldr r1, [r0, r2]
	mov r0, #1
	lsl r0, r0, #0x18
	tst r0, r1
	beq _022627F6
	mov r0, #1
	b _022627F8
_022627F6:
	mov r0, #0
_022627F8:
	str r0, [sp, #0x10]
	ldr r0, [sp, #4]
	add r7, sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r0, [sp, #8]
	add r3, r7, #0
	add r1, r1, r0
	ldr r0, _0226288C ; =0x0000219C
	add r5, r7, #0
	ldrb r0, [r1, r0]
	str r0, [sp, #0x38]
	mov r0, #0
	mov ip, r0
	ldr r0, _02262884 ; =0x00002D66
	add r2, r4, r0
	add r0, #0x58
	add r6, r4, r0
_0226281A:
	mov r0, #0xb5
	lsl r0, r0, #6
	ldrh r0, [r4, r0]
	strh r0, [r7, #8]
	ldrb r0, [r2]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	strb r0, [r3, #0x14]
	ldrb r0, [r2]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1b
	strb r0, [r3, #0x18]
	ldr r0, _02262890 ; =0x00002DB0
	ldr r1, [r4, r0]
	mov r0, #2
	lsl r0, r0, #0x14
	tst r0, r1
	beq _02262848
	ldr r0, _02262894 ; =0x00002DFA
	ldrh r0, [r4, r0]
	strb r0, [r3, #0x10]
	ldr r0, _02262898 ; =0x00002DE4
	b _02262852
_02262848:
	ldrb r0, [r6]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	strb r0, [r3, #0x10]
	ldr r0, _0226289C ; =0x00002DA8
_02262852:
	ldr r0, [r4, r0]
	add r4, #0xc0
	str r0, [r5, #0x1c]
	mov r0, ip
	add r0, r0, #1
	add r7, r7, #2
	add r2, #0xc0
	add r3, r3, #1
	add r5, r5, #4
	add r6, #0xc0
	mov ip, r0
	cmp r0, #4
	blt _0226281A
	mov r0, #0x30
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r2, [sp, #8]
	mov r1, #1
	add r3, sp, #0xc
	bl ov12_02262240
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02262880: .word 0x00000195
_02262884: .word 0x00002D66
_02262888: .word 0x00002DBF
_0226288C: .word 0x0000219C
_02262890: .word 0x00002DB0
_02262894: .word 0x00002DFA
_02262898: .word 0x00002DE4
_0226289C: .word 0x00002DA8
	thumb_func_end ov12_02262734

	thumb_func_start ov12_022628A0
ov12_022628A0: ; 0x022628A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r1, #0
	add r4, r0, #0
	lsl r0, r7, #2
	add r0, r4, r0
	ldr r1, [r0, #0x34]
	ldr r0, _02262950 ; =0x00000195
	str r2, [sp, #4]
	ldrb r1, [r1, r0]
	mov r0, #1
	tst r0, r1
	beq _022628BE
	mov r2, #2
	b _022628C0
_022628BE:
	mov r2, #0
_022628C0:
	mov r0, #0xc0
	add r6, r7, #0
	mul r6, r0
	ldr r0, [r4, #0x30]
	ldr r5, _02262954 ; =0x00002D66
	add r0, r0, r6
	ldrb r0, [r0, r5]
	mov r1, #6
	lsl r0, r0, #0x1b
	lsr r3, r0, #0x1b
	add r0, sp, #8
	strb r1, [r0]
	ldr r0, [r4, #0x30]
	add r1, r0, r6
	add r0, r5, #0
	add r0, #0x4a
	ldr r6, [r1, r0]
	mov r0, #2
	lsl r0, r0, #0x14
	tst r0, r6
	beq _0226290E
	add r0, r5, #0
	add r0, #0x7e
	ldr r0, [r1, r0]
	lsl r2, r2, #0x18
	str r0, [sp]
	add r0, r5, #0
	sub r0, #0x26
	add r5, #0x94
	ldrh r0, [r1, r0]
	ldrh r1, [r1, r5]
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsr r3, r3, #0x18
	bl sub_020708D8
	b _02262930
_0226290E:
	add r0, r5, #0
	add r0, #0x42
	ldr r0, [r1, r0]
	lsl r2, r2, #0x18
	str r0, [sp]
	add r0, r5, #0
	sub r0, #0x26
	add r5, #0x58
	ldrh r0, [r1, r0]
	ldrb r1, [r1, r5]
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	lsr r3, r3, #0x18
	bl sub_020708D8
_02262930:
	add r1, sp, #8
	strb r0, [r1, #1]
	ldr r0, [sp, #4]
	add r1, sp, #8
	strh r0, [r1, #2]
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	add r3, sp, #8
	bl ov12_02262240
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02262950: .word 0x00000195
_02262954: .word 0x00002D66
	thumb_func_end ov12_022628A0

	thumb_func_start ov12_02262958
ov12_02262958: ; 0x02262958
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #7
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl ov12_02262240
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_02262958

	thumb_func_start ov12_02262974
ov12_02262974: ; 0x02262974
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #8
	add r3, sp, #4
	strb r1, [r3]
	mov r1, #0x34
	mul r1, r2
	add r1, r0, r1
	add r1, #0xad
	ldrb r1, [r1]
	strh r1, [r3, #2]
	add r1, r0, r2
	add r1, #0xa8
	ldrb r1, [r1]
	strb r1, [r3, #1]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl ov12_02262240
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov12_02262974

	thumb_func_start ov12_022629A4
ov12_022629A4: ; 0x022629A4
	push {r4, r5, r6, lr}
	sub sp, #8
	mov r6, #9
	add r3, sp, #4
	strb r6, [r3]
	add r5, r0, #0
	strb r2, [r3, #1]
	add r4, r1, #0
	bl ov12_0223AB6C
	ldr r1, [r5, #0x30]
	add r2, r4, #0
	add r1, r1, r0
	ldr r0, _022629D8 ; =0x0000219C
	add r3, sp, #4
	ldrb r1, [r1, r0]
	add r0, sp, #4
	strh r1, [r0, #2]
	mov r0, #4
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	bl ov12_02262240
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022629D8: .word 0x0000219C
	thumb_func_end ov12_022629A4

	thumb_func_start ov12_022629DC
ov12_022629DC: ; 0x022629DC
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #0xa
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl ov12_02262240
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_022629DC

	thumb_func_start ov12_022629F8
ov12_022629F8: ; 0x022629F8
	push {r3, r4, lr}
	sub sp, #0xc
	add r3, r1, #0
	mov r1, #0xb
	add r4, sp, #4
	strb r1, [r4]
	mov r1, #0x34
	mul r1, r3
	add r1, r0, r1
	add r1, #0xad
	ldrb r1, [r1]
	strh r1, [r4, #2]
	add r1, r0, r3
	add r1, #0xa8
	ldrb r1, [r1]
	strb r1, [r4, #1]
	str r2, [sp, #8]
	mov r1, #8
	str r1, [sp]
	add r2, r3, #0
	mov r1, #1
	add r3, sp, #4
	bl ov12_02262240
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov12_022629F8

	thumb_func_start ov12_02262A2C
ov12_02262A2C: ; 0x02262A2C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r1, #0
	ldr r1, _02262B50 ; =0x0000219C
	add r4, r2, #0
	add r7, r5, r1
	ldrb r2, [r7, r4]
	add r1, r4, #0
	str r0, [sp, #4]
	str r3, [sp, #8]
	bl ov12_0223A880
	add r6, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x10]
	add r0, r6, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xc]
	mov r0, #0xc
	add r3, sp, #0x14
	strb r0, [r3]
	mov r0, #0xc0
	add r6, r4, #0
	mul r6, r0
	ldr r2, _02262B54 ; =0x00002D74
	add r0, r5, r6
	ldrb r1, [r0, r2]
	strb r1, [r3, #1]
	add r1, r2, #0
	add r1, #0x18
	ldr r1, [r0, r1]
	add r2, #0x1c
	strh r1, [r3, #2]
	ldr r0, [r0, r2]
	add r1, r4, #0
	strh r0, [r3, #4]
	ldrb r0, [r7, r4]
	strb r0, [r3, #6]
	add r0, r5, #0
	bl ov12_02250CFC
	add r1, sp, #0x14
	ldrb r2, [r1, #7]
	mov r3, #0x1f
	lsl r0, r0, #0x18
	bic r2, r3
	lsr r3, r0, #0x18
	mov r0, #0x1f
	and r0, r3
	orr r0, r2
	strb r0, [r1, #7]
	mov r0, #0xb5
	lsl r0, r0, #6
	add r7, r5, r0
	ldrh r0, [r7, r6]
	cmp r0, #0x1d
	beq _02262AAE
	cmp r0, #0x20
	bne _02262AC8
_02262AAE:
	ldr r0, _02262B58 ; =0x00002D54
	add r1, r5, r6
	ldr r0, [r1, r0]
	lsr r0, r0, #0x1f
	bne _02262AC8
	add r0, sp, #0x14
	ldrb r1, [r0, #7]
	mov r2, #0x60
	bic r1, r2
	mov r2, #0x40
	orr r1, r2
	strb r1, [r0, #7]
	b _02262AE2
_02262AC8:
	add r3, sp, #0x14
	ldrb r2, [r3, #7]
	mov r0, #0x60
	add r1, r5, r6
	bic r2, r0
	ldr r0, _02262B5C ; =0x00002DBE
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x19
	orr r0, r2
	strb r0, [r3, #7]
_02262AE2:
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	bl GetMonExpBySpeciesAndLevel
	mov r1, #0xc0
	mul r1, r4
	add r2, r5, r1
	ldr r1, _02262B60 ; =0x00002DA4
	ldr r1, [r2, r1]
	sub r0, r1, r0
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	add r1, r1, #1
	bl GetMonExpBySpeciesAndLevel
	add r5, r0, #0
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	bl GetMonExpBySpeciesAndLevel
	sub r0, r5, r0
	str r0, [sp, #0x20]
	ldrh r1, [r7, r6]
	ldr r0, [sp, #4]
	bl ov12_0223C330
	add r3, sp, #0x14
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r3, #7]
	mov r2, #0x80
	lsr r0, r0, #0x18
	bic r1, r2
	orr r0, r1
	strb r0, [r3, #7]
	ldr r0, [sp, #4]
	bl ov12_0223B6B4
	str r0, [sp, #0x24]
	ldr r0, [sp, #8]
	add r1, sp, #0x14
	strb r0, [r1, #0x14]
	mov r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #0x14
	bl ov12_02262240
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02262B50: .word 0x0000219C
_02262B54: .word 0x00002D74
_02262B58: .word 0x00002D54
_02262B5C: .word 0x00002DBE
_02262B60: .word 0x00002DA4
	thumb_func_end ov12_02262A2C

	thumb_func_start ov12_02262B64
ov12_02262B64: ; 0x02262B64
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #0xd
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl ov12_02262240
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_02262B64

	thumb_func_start ov12_02262B80
ov12_02262B80: ; 0x02262B80
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	mov r0, #0
	add r1, sp, #0x28
	mov r2, #0x2c
	add r6, r3, #0
	bl MIi_CpuClearFast
	ldr r0, [sp, #4]
	bl ov12_0223A7E4
	ldr r1, [sp, #0xc]
	bl ov12_0224EDC0
	mov r5, #0
	ldr r0, [sp, #4]
	add r4, r5, #0
	bl ov12_0223A7F0
	cmp r0, #0
	ble _02262BD0
_02262BB0:
	ldr r0, [sp, #8]
	add r1, r4, #0
	bl ov12_022567A0
	cmp r0, #0
	bne _02262BC4
	add r0, r4, #0
	bl MaskOfFlagNo
	orr r5, r0
_02262BC4:
	ldr r0, [sp, #4]
	add r4, r4, #1
	bl ov12_0223A7F0
	cmp r4, r0
	blt _02262BB0
_02262BD0:
	mov r1, #0xe
	add r0, sp, #0x28
	strb r1, [r0]
	strb r6, [r0, #1]
	ldr r1, _02262ED0 ; =0x00003108
	ldr r0, [sp, #8]
	ldrb r0, [r0, r1]
	add r1, r0, #0
	orr r1, r5
	add r0, sp, #0x48
	strb r1, [r0, #9]
	ldr r0, [sp, #4]
	bl ov12_0223A7E0
	mov r1, #2
	str r0, [sp, #0x20]
	tst r0, r1
	beq _02262C06
	ldr r0, [sp, #0x20]
	mov r1, #8
	tst r0, r1
	bne _02262C06
	ldr r0, [sp, #0xc]
	mov r1, #1
	add r4, r0, #0
	and r4, r1
	b _02262C08
_02262C06:
	ldr r4, [sp, #0xc]
_02262C08:
	ldr r0, [sp, #4]
	add r1, r4, #0
	bl ov12_0223A7F4
	str r0, [sp, #0x24]
	mov r7, #0
	bl GetPartyCount
	cmp r0, #0
	ble _02262C9E
	mov r0, #6
	add r1, r4, #0
	mul r1, r0
	ldr r0, [sp, #8]
	add r5, sp, #0x28
	add r6, r0, r1
	mov r1, #0xa9
	ldr r0, [sp, #0x20]
	lsl r1, r1, #2
	and r0, r1
	str r0, [sp, #0x1c]
_02262C32:
	ldr r1, _02262ED4 ; =0x0000312C
	ldr r0, [sp, #0x24]
	ldrb r1, [r6, r1]
	bl GetPartyMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02262C90
	ldr r1, _02262ED8 ; =0x000001EE
	cmp r0, r1
	beq _02262C90
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02262C78
	add r0, r4, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02262C72
	mov r0, #3
	strb r0, [r5, #8]
	b _02262C7C
_02262C72:
	mov r0, #1
	strb r0, [r5, #8]
	b _02262C7C
_02262C78:
	mov r0, #2
	strb r0, [r5, #8]
_02262C7C:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _02262C86
	mov r0, #0
	b _02262C8C
_02262C86:
	add r0, r4, #0
	bl GetPercentProgressTowardsNextLevel
_02262C8C:
	strb r0, [r5, #2]
	add r5, r5, #1
_02262C90:
	ldr r0, [sp, #0x24]
	add r6, r6, #1
	add r7, r7, #1
	bl GetPartyCount
	cmp r7, r0
	blt _02262C32
_02262C9E:
	ldr r0, [sp, #0x20]
	mov r1, #0xc
	and r0, r1
	cmp r0, #0xc
	beq _02262CBC
	ldr r0, [sp, #0x20]
	mov r1, #0x10
	tst r0, r1
	bne _02262CBC
	ldr r0, [sp, #0x20]
	cmp r0, #0x4b
	beq _02262CBC
	cmp r0, #0xcb
	beq _02262CBC
	b _02262DF4
_02262CBC:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0xc]
	bl ov12_0223AB1C
	cmp r0, #0
	beq _02262CD2
	ldr r0, [sp, #4]
	mov r1, #2
	bl ov12_0223AAD8
	b _02262CDA
_02262CD2:
	ldr r0, [sp, #4]
	mov r1, #3
	bl ov12_0223AAD8
_02262CDA:
	add r4, r0, #0
	ldr r0, [sp, #4]
	add r1, r4, #0
	bl ov12_0223A7F4
	str r0, [sp, #0x10]
	mov r7, #0
	bl GetPartyCount
	cmp r0, #0
	ble _02262D56
	mov r0, #6
	add r1, r4, #0
	mul r1, r0
	ldr r0, [sp, #8]
	add r5, sp, #0x28
	add r4, r0, r1
_02262CFC:
	ldr r1, _02262ED4 ; =0x0000312C
	ldr r0, [sp, #0x10]
	ldrb r1, [r4, r1]
	bl GetPartyMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02262D48
	ldr r1, _02262ED8 ; =0x000001EE
	cmp r0, r1
	beq _02262D48
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02262D42
	add r0, r6, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02262D3C
	mov r0, #3
	strb r0, [r5, #0xe]
	b _02262D46
_02262D3C:
	mov r0, #1
	strb r0, [r5, #0xe]
	b _02262D46
_02262D42:
	mov r0, #2
	strb r0, [r5, #0xe]
_02262D46:
	add r5, r5, #1
_02262D48:
	ldr r0, [sp, #0x10]
	add r4, r4, #1
	add r7, r7, #1
	bl GetPartyCount
	cmp r7, r0
	blt _02262CFC
_02262D56:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0xc]
	bl ov12_0223AB1C
	cmp r0, #0
	beq _02262D6C
	ldr r0, [sp, #4]
	mov r1, #4
	bl ov12_0223AAD8
	b _02262D74
_02262D6C:
	ldr r0, [sp, #4]
	mov r1, #5
	bl ov12_0223AAD8
_02262D74:
	add r4, r0, #0
	ldr r0, [sp, #4]
	add r1, r4, #0
	bl ov12_0223A7F4
	str r0, [sp, #0x14]
	mov r7, #0
	bl GetPartyCount
	cmp r0, #0
	ble _02262E7A
	mov r0, #6
	add r1, r4, #0
	mul r1, r0
	ldr r0, [sp, #8]
	add r5, sp, #0x28
	add r4, r0, r1
	add r5, #3
_02262D98:
	ldr r1, _02262ED4 ; =0x0000312C
	ldr r0, [sp, #0x14]
	ldrb r1, [r4, r1]
	bl GetPartyMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02262DE4
	ldr r1, _02262ED8 ; =0x000001EE
	cmp r0, r1
	beq _02262DE4
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02262DDE
	add r0, r6, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02262DD8
	mov r0, #3
	strb r0, [r5, #0xe]
	b _02262DE2
_02262DD8:
	mov r0, #1
	strb r0, [r5, #0xe]
	b _02262DE2
_02262DDE:
	mov r0, #2
	strb r0, [r5, #0xe]
_02262DE2:
	add r5, r5, #1
_02262DE4:
	ldr r0, [sp, #0x14]
	add r4, r4, #1
	add r7, r7, #1
	bl GetPartyCount
	cmp r7, r0
	blt _02262D98
	b _02262E7A
_02262DF4:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0xc]
	mov r2, #2
	bl ov12_0223ABB8
	add r4, r0, #0
	ldr r0, [sp, #4]
	add r1, r4, #0
	bl ov12_0223A7F4
	str r0, [sp, #0x18]
	mov r7, #0
	bl GetPartyCount
	cmp r0, #0
	ble _02262E7A
	mov r0, #6
	add r1, r4, #0
	mul r1, r0
	ldr r0, [sp, #8]
	add r5, sp, #0x28
	add r4, r0, r1
_02262E20:
	ldr r1, _02262ED4 ; =0x0000312C
	ldr r0, [sp, #0x18]
	ldrb r1, [r4, r1]
	bl GetPartyMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02262E6C
	ldr r1, _02262ED8 ; =0x000001EE
	cmp r0, r1
	beq _02262E6C
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02262E66
	add r0, r6, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02262E60
	mov r0, #3
	strb r0, [r5, #0xe]
	b _02262E6A
_02262E60:
	mov r0, #1
	strb r0, [r5, #0xe]
	b _02262E6A
_02262E66:
	mov r0, #2
	strb r0, [r5, #0xe]
_02262E6A:
	add r5, r5, #1
_02262E6C:
	ldr r0, [sp, #0x18]
	add r4, r4, #1
	add r7, r7, #1
	bl GetPartyCount
	cmp r7, r0
	blt _02262E20
_02262E7A:
	mov r5, #0
	add r6, sp, #0x28
	add r4, r6, #0
	add r7, r5, #0
_02262E82:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	add r2, r5, #6
	add r3, r7, #0
	bl ov12_0224EDE0
	strh r0, [r6, #0x14]
	add r2, r5, #0
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	add r2, #0x1f
	mov r3, #0
	bl ov12_0224EDE0
	strb r0, [r4, #0x1c]
	add r2, r5, #0
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	add r2, #0x27
	mov r3, #0
	bl ov12_0224EDE0
	add r1, r4, #0
	add r1, #0x20
	add r5, r5, #1
	strb r0, [r1]
	add r6, r6, #2
	add r4, r4, #1
	cmp r5, #4
	blt _02262E82
	ldr r0, [sp, #0xc]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, [sp, #8]
	add r3, sp, #0x28
	add r0, r0, r1
	ldr r1, _02262EDC ; =0x00002D8C
	b _02262EE0
	nop
_02262ED0: .word 0x00003108
_02262ED4: .word 0x0000312C
_02262ED8: .word 0x000001EE
_02262EDC: .word 0x00002D8C
_02262EE0:
	ldr r2, [r0, r1]
	strh r2, [r3, #0x24]
	add r2, r1, #4
	ldr r2, [r0, r2]
	strh r2, [r3, #0x26]
	mov r2, #0x24
	ldrsh r2, [r3, r2]
	cmp r2, #0
	beq _02262F08
	add r1, #0x20
	ldr r0, [r0, r1]
	cmp r0, #0
	add r0, sp, #0x48
	beq _02262F02
	mov r1, #3
	strb r1, [r0, #8]
	b _02262F0E
_02262F02:
	mov r1, #1
	strb r1, [r0, #8]
	b _02262F0E
_02262F08:
	mov r1, #2
	add r0, sp, #0x48
	strb r1, [r0, #8]
_02262F0E:
	mov r0, #0x2c
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r2, [sp, #0xc]
	mov r1, #1
	add r3, sp, #0x28
	bl ov12_02262240
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_02262B80

	thumb_func_start ov12_02262F24
ov12_02262F24: ; 0x02262F24
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r2, r1, #0
	mov r1, #4
	str r1, [sp]
	mov r1, #0
	add r3, sp, #0x10
	bl ov12_02262240
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov12_02262F24

	thumb_func_start ov12_02262F40
ov12_02262F40: ; 0x02262F40
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r2, [sp, #0xc]
	str r0, [sp, #4]
	str r1, [sp, #8]
	bl ov12_0223A7E4
	ldr r1, [sp, #0xc]
	bl ov12_0224EDC0
	mov r0, #0xf
	add r2, sp, #0x14
	strb r0, [r2]
	add r7, sp, #0x14
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	add r5, r7, #0
	add r1, r1, r0
	ldr r0, _02262FD0 ; =0x0000219C
	ldrb r0, [r1, r0]
	mov r1, #0xc0
	strb r0, [r2, #1]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	mul r1, r0
	ldr r0, [sp, #8]
	add r6, r0, r1
	add r4, r6, #0
_02262F7A:
	ldr r0, _02262FD4 ; =0x00002D4C
	ldr r1, _02262FD8 ; =0x00002D70
	ldrh r0, [r6, r0]
	strh r0, [r7, #4]
	ldr r0, _02262FDC ; =0x00002D6C
	ldrb r0, [r4, r0]
	strb r0, [r5, #0xc]
	ldr r0, _02262FD4 ; =0x00002D4C
	ldrb r1, [r4, r1]
	ldrh r0, [r6, r0]
	bl WazaGetMaxPp
	strb r0, [r5, #0x10]
	ldr r0, [sp, #0x10]
	add r6, r6, #2
	add r0, r0, #1
	add r7, r7, #2
	add r4, r4, #1
	add r5, r5, #1
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _02262F7A
	mov r0, #0
	mvn r0, r0
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	mov r3, #0
	bl ov12_022517EC
	add r1, sp, #0x14
	strh r0, [r1, #2]
	mov r0, #0x14
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r2, [sp, #0xc]
	mov r1, #1
	add r3, sp, #0x14
	bl ov12_02262240
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02262FD0: .word 0x0000219C
_02262FD4: .word 0x00002D4C
_02262FD8: .word 0x00002D70
_02262FDC: .word 0x00002D6C
	thumb_func_end ov12_02262F40

	thumb_func_start ov12_02262FE0
ov12_02262FE0: ; 0x02262FE0
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r2, r1, #0
	mov r1, #4
	str r1, [sp]
	mov r1, #0
	add r3, sp, #0x10
	bl ov12_02262240
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov12_02262FE0

	thumb_func_start ov12_02262FFC
ov12_02262FFC: ; 0x02262FFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r1, #0
	add r1, r3, #0
	add r4, r2, #0
	str r3, [sp, #0xc]
	bl ov12_0224EDC0
	ldr r0, [sp, #4]
	bl ov12_0223A7E0
	mov r2, #0x10
	add r1, sp, #0x1c
	strb r2, [r1]
	strh r4, [r1, #2]
	mov r1, #2
	add r2, r0, #0
	and r2, r1
	beq _02263036
	mov r1, #8
	tst r0, r1
	bne _02263036
	cmp r2, #0
	beq _0226303E
	ldr r0, [sp, #0xc]
	cmp r0, #2
	blt _0226303E
_02263036:
	mov r1, #1
	add r0, sp, #0x1c
	strb r1, [r0, #1]
	b _02263044
_0226303E:
	mov r1, #0
	add r0, sp, #0x1c
	strb r1, [r0, #1]
_02263044:
	ldr r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r1, _02263108 ; =0x00002D54
	add r0, r2, #0
	add r7, r0, r1
	add r1, #0x6a
	add r5, r0, r1
	mov r0, #3
	add r4, sp, #0x20
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
	mov r0, #4
	add r3, sp, #0x1c
	add r4, #1
	mov ip, r0
_02263064:
	ldr r0, _0226310C ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _022630D2
	strh r0, [r3, #8]
	ldr r0, _02263110 ; =0x00002D90
	ldr r0, [r2, r0]
	strh r0, [r3, #0xa]
	ldrb r1, [r4]
	mov r0, #4
	orr r0, r1
	strb r0, [r4]
	mov r0, #0xb5
	lsl r0, r0, #6
	ldrh r0, [r2, r0]
	cmp r0, #0x1d
	beq _0226308A
	cmp r0, #0x20
	bne _0226309E
_0226308A:
	ldr r0, [r7]
	lsr r0, r0, #0x1f
	bne _0226309E
	ldrb r0, [r4]
	ldr r1, [sp, #0x10]
	bic r0, r1
	mov r1, #2
	orr r0, r1
	strb r0, [r4]
	b _022630B2
_0226309E:
	ldrb r6, [r4]
	ldr r0, [sp, #0x14]
	bic r6, r0
	ldrb r0, [r5]
	lsl r0, r0, #0x1c
	lsr r1, r0, #0x1c
	mov r0, #3
	and r0, r1
	orr r0, r6
	strb r0, [r4]
_022630B2:
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x18]
	add r1, r1, r0
	ldr r0, _02263114 ; =0x0000219C
	ldrb r0, [r1, r0]
	strb r0, [r3, #4]
	ldr r0, _02263118 ; =0x00002DAC
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _022630CC
	mov r0, #3
	strb r0, [r3, #6]
	b _022630DE
_022630CC:
	mov r0, #1
	strb r0, [r3, #6]
	b _022630DE
_022630D2:
	ldrb r1, [r4]
	mov r0, ip
	bic r1, r0
	strb r1, [r4]
	mov r0, #2
	strb r0, [r3, #6]
_022630DE:
	ldr r0, [sp, #0x18]
	add r2, #0xc0
	add r0, r0, #1
	add r3, #8
	add r4, #8
	add r7, #0xc0
	add r5, #0xc0
	str r0, [sp, #0x18]
	cmp r0, #4
	blt _02263064
	mov r0, #0x24
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r2, [sp, #0xc]
	mov r1, #1
	add r3, sp, #0x1c
	bl ov12_02262240
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02263108: .word 0x00002D54
_0226310C: .word 0x00002D8C
_02263110: .word 0x00002D90
_02263114: .word 0x0000219C
_02263118: .word 0x00002DAC
	thumb_func_end ov12_02262FFC

	thumb_func_start ov12_0226311C
ov12_0226311C: ; 0x0226311C
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r2, r1, #0
	mov r1, #4
	str r1, [sp]
	mov r1, #0
	add r3, sp, #0x10
	bl ov12_02262240
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov12_0226311C

	thumb_func_start ov12_02263138
ov12_02263138: ; 0x02263138
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r1, #0
	add r1, r2, #0
	str r2, [sp, #0xc]
	bl ov12_0224EDC0
	add r6, sp, #0x10
	mov r1, #0x11
	add r0, sp, #0x10
	strb r1, [r0]
	mov r0, #0
	ldr r4, [sp, #8]
	mov ip, r0
	ldr r1, _022632AC ; =0x00002DCC
	add r0, r4, #0
	add r7, r0, r1
	ldr r0, _022632B0 ; =0x0000312C
	add r5, r6, #0
_02263162:
	ldr r2, [sp, #8]
	mov r1, ip
	add r2, r2, r1
	ldr r1, _022632B4 ; =0x0000219C
	mov r3, #0
	ldrb r1, [r2, r1]
	strb r1, [r6, #4]
_02263170:
	add r1, r4, r3
	ldrb r2, [r1, r0]
	add r1, r5, r3
	add r3, r3, #1
	strb r2, [r1, #8]
	cmp r3, #6
	blt _02263170
	ldr r1, [r7]
	add r4, r4, #6
	lsl r1, r1, #0xa
	lsr r2, r1, #0x1d
	add r1, r6, #0
	add r1, #0x20
	strb r2, [r1]
	mov r1, ip
	add r1, r1, #1
	add r6, r6, #1
	add r5, r5, #6
	add r7, #0xc0
	mov ip, r1
	cmp r1, #4
	blt _02263162
	ldr r0, [sp, #4]
	bl ov12_0223A7E0
	cmp r0, #0x4a
	bne _0226324E
	mov r0, #1
	bl MaskOfFlagNo
	ldr r2, _022632B8 ; =0x00003108
	ldr r1, [sp, #8]
	ldrb r1, [r1, r2]
	tst r0, r1
	bne _022631D4
	mov r0, #3
	bl MaskOfFlagNo
	ldr r2, _022632B8 ; =0x00003108
	ldr r1, [sp, #8]
	ldrb r1, [r1, r2]
	tst r0, r1
	bne _022631D4
	mov r1, #1
	add r0, sp, #0x10
	strb r1, [r0, #1]
	mov r1, #0
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	b _02263298
_022631D4:
	mov r0, #1
	bl MaskOfFlagNo
	ldr r2, _022632B8 ; =0x00003108
	ldr r1, [sp, #8]
	add r3, sp, #0x10
	ldrb r1, [r1, r2]
	tst r0, r1
	bne _0226321A
	mov r0, #0
	mov r2, #0xba
	ldr r1, [sp, #8]
	strb r0, [r3, #1]
	lsl r2, r2, #6
	ldr r4, [r1, r2]
	ldr r1, _022632BC ; =0x200400C0
	tst r1, r4
	beq _02263200
	mov r1, #1
	strb r1, [r3, #2]
	strb r0, [r3, #3]
	b _02263298
_02263200:
	ldr r1, [sp, #8]
	sub r2, #0x10
	ldr r2, [r1, r2]
	mov r1, #1
	lsl r1, r1, #0x18
	tst r1, r2
	strb r0, [r3, #2]
	beq _02263216
	mov r0, #1
	strb r0, [r3, #3]
	b _02263298
_02263216:
	strb r0, [r3, #3]
	b _02263298
_0226321A:
	mov r0, #0
	mov r2, #3
	ldr r1, [sp, #8]
	strb r0, [r3, #1]
	lsl r2, r2, #0xc
	ldr r4, [r1, r2]
	ldr r1, _022632BC ; =0x200400C0
	tst r1, r4
	beq _02263234
	mov r1, #1
	strb r1, [r3, #2]
	strb r0, [r3, #3]
	b _02263298
_02263234:
	ldr r1, [sp, #8]
	sub r2, #0x10
	ldr r2, [r1, r2]
	mov r1, #1
	lsl r1, r1, #0x18
	tst r1, r2
	strb r0, [r3, #2]
	beq _0226324A
	mov r0, #1
	strb r0, [r3, #3]
	b _02263298
_0226324A:
	strb r0, [r3, #3]
	b _02263298
_0226324E:
	ldr r0, [sp, #4]
	bl ov12_0223A7E0
	cmp r0, #0
	bne _0226328E
	mov r2, #0xba
	mov r0, #0
	add r3, sp, #0x10
	ldr r1, [sp, #8]
	strb r0, [r3, #1]
	lsl r2, r2, #6
	ldr r4, [r1, r2]
	ldr r1, _022632BC ; =0x200400C0
	tst r1, r4
	beq _02263274
	mov r1, #1
	strb r1, [r3, #2]
	strb r0, [r3, #3]
	b _02263298
_02263274:
	ldr r1, [sp, #8]
	sub r2, #0x10
	ldr r2, [r1, r2]
	mov r1, #1
	lsl r1, r1, #0x18
	tst r1, r2
	strb r0, [r3, #2]
	beq _0226328A
	mov r0, #1
	strb r0, [r3, #3]
	b _02263298
_0226328A:
	strb r0, [r3, #3]
	b _02263298
_0226328E:
	mov r1, #0
	add r0, sp, #0x10
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
_02263298:
	mov r0, #0x24
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r2, [sp, #0xc]
	mov r1, #1
	add r3, sp, #0x10
	bl ov12_02262240
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022632AC: .word 0x00002DCC
_022632B0: .word 0x0000312C
_022632B4: .word 0x0000219C
_022632B8: .word 0x00003108
_022632BC: .word 0x200400C0
	thumb_func_end ov12_02263138

	thumb_func_start ov12_022632C0
ov12_022632C0: ; 0x022632C0
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r2, r1, #0
	mov r1, #4
	str r1, [sp]
	mov r1, #0
	add r3, sp, #0x10
	bl ov12_02262240
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov12_022632C0

	thumb_func_start ov12_022632DC
ov12_022632DC: ; 0x022632DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r1, #0
	add r1, r2, #0
	str r2, [sp, #0xc]
	add r4, r3, #0
	bl ov12_0224EDC0
	mov r0, #0x12
	add r1, sp, #0x10
	strb r0, [r1]
	ldr r0, [sp, #0xc]
	add r7, sp, #0x10
	strb r0, [r1, #1]
	ldr r0, [sp, #0x50]
	strb r4, [r1, #2]
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x54]
	ldr r5, [sp, #8]
	strb r0, [r1, #3]
	ldr r1, _02263354 ; =0x00003108
	ldr r0, [sp, #8]
	mov r3, #0
	ldrb r1, [r0, r1]
	add r0, sp, #0x30
	add r6, r7, #0
	strb r1, [r0, #4]
	ldr r0, _02263358 ; =0x0000312C
_02263318:
	ldr r1, [sp, #8]
	mov r4, #0
	add r2, r1, r3
	ldr r1, _0226335C ; =0x0000219C
	ldrb r1, [r2, r1]
	strb r1, [r7, #4]
_02263324:
	add r1, r5, r4
	ldrb r2, [r1, r0]
	add r1, r6, r4
	add r4, r4, #1
	strb r2, [r1, #8]
	cmp r4, #6
	blt _02263324
	add r3, r3, #1
	add r7, r7, #1
	add r5, r5, #6
	add r6, r6, #6
	cmp r3, #4
	blt _02263318
	mov r0, #0x28
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r2, [sp, #0xc]
	mov r1, #1
	add r3, sp, #0x10
	bl ov12_02262240
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02263354: .word 0x00003108
_02263358: .word 0x0000312C
_0226335C: .word 0x0000219C
	thumb_func_end ov12_022632DC

	thumb_func_start ov12_02263360
ov12_02263360: ; 0x02263360
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r2, r1, #0
	mov r1, #4
	str r1, [sp]
	mov r1, #0
	add r3, sp, #0x10
	bl ov12_02262240
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov12_02263360

	thumb_func_start ov12_0226337C
ov12_0226337C: ; 0x0226337C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r2, #0
	add r6, r0, #0
	add r0, r1, #0
	add r1, r5, #0
	add r4, r3, #0
	bl ov12_0224EDC0
	mov r1, #0x13
	add r0, sp, #4
	strb r1, [r0]
	ldr r1, [sp, #0x20]
	strh r4, [r0, #2]
	strb r1, [r0, #1]
	ldr r0, [sp, #0x24]
	mov r1, #1
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	add r2, r5, #0
	str r0, [sp, #0xc]
	mov r0, #0xc
	str r0, [sp]
	add r0, r6, #0
	add r3, sp, #4
	bl ov12_02262240
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0226337C

	thumb_func_start ov12_022633B8
ov12_022633B8: ; 0x022633B8
	push {r4, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #0x14
	add r3, sp, #4
	strb r1, [r3]
	ldr r1, [r2, #0x64]
	add r4, r2, r1
	ldr r1, _022633E8 ; =0x0000219C
	ldrb r1, [r4, r1]
	strb r1, [r3, #1]
	ldr r1, _022633EC ; =0x00003044
	ldr r1, [r2, r1]
	strh r1, [r3, #2]
	mov r1, #4
	str r1, [sp]
	ldr r2, [r2, #0x64]
	mov r1, #1
	add r3, sp, #4
	bl ov12_02262240
	add sp, #8
	pop {r4, pc}
	nop
_022633E8: .word 0x0000219C
_022633EC: .word 0x00003044
	thumb_func_end ov12_022633B8

	thumb_func_start ov12_022633F0
ov12_022633F0: ; 0x022633F0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	add r3, r2, #0
	mov r1, #0x15
	strb r1, [r3]
	mov r1, #0x24
	str r1, [sp]
	ldr r2, [r4, #0x64]
	mov r1, #1
	bl ov12_02262240
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov12_022633F0

	thumb_func_start ov12_0226340C
ov12_0226340C: ; 0x0226340C
	push {r4, r5, r6, lr}
	sub sp, #0x68
	mov r3, #0
	add r4, r1, #0
	str r3, [sp]
	ldr r6, [r4, #0x64]
	add r5, r0, #0
	str r6, [sp, #4]
	ldr r6, [r4, #0x6c]
	str r6, [sp, #8]
	str r2, [sp, #0xc]
	add r2, sp, #0x10
	bl ov12_022643C8
	mov r0, #0x58
	str r0, [sp]
	ldr r2, [r4, #0x64]
	add r0, r5, #0
	mov r1, #1
	add r3, sp, #0x10
	bl ov12_02262240
	add sp, #0x68
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0226340C

	thumb_func_start ov12_0226343C
ov12_0226343C: ; 0x0226343C
	push {r4, r5, r6, lr}
	sub sp, #0x68
	add r4, r3, #0
	mov r3, #0
	str r3, [sp]
	ldr r6, [sp, #0x78]
	str r4, [sp, #4]
	str r6, [sp, #8]
	str r2, [sp, #0xc]
	add r2, sp, #0x10
	add r5, r0, #0
	bl ov12_022643C8
	mov r0, #0x58
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #0x10
	bl ov12_02262240
	add sp, #0x68
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0226343C

	thumb_func_start ov12_0226346C
ov12_0226346C: ; 0x0226346C
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #0x17
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl ov12_02262240
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_0226346C

	thumb_func_start ov12_02263488
ov12_02263488: ; 0x02263488
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r1, #0
	str r2, [sp, #8]
	add r1, r2, #0
	add r3, r5, r2
	ldr r2, _0226354C ; =0x0000219C
	str r0, [sp, #4]
	ldrb r2, [r3, r2]
	bl ov12_0223A880
	add r4, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #0x18
	add r3, sp, #0xc
	strb r0, [r3]
	ldr r0, [sp, #8]
	mov r1, #0xc0
	add r4, r0, #0
	mul r4, r1
	ldr r0, _02263550 ; =0x00002D74
	add r1, r5, r4
	ldrb r2, [r1, r0]
	strb r2, [r3, #1]
	add r2, r0, #0
	add r2, #0x18
	ldr r2, [r1, r2]
	strh r2, [r3, #2]
	add r2, r0, #0
	add r2, #0x1c
	ldr r2, [r1, r2]
	sub r0, #0x34
	strh r2, [r3, #4]
	ldr r2, _02263554 ; =0x0000215C
	ldr r2, [r5, r2]
	str r2, [sp, #0x14]
	ldrh r0, [r1, r0]
	cmp r0, #0x1d
	beq _022634EE
	cmp r0, #0x20
	bne _02263500
_022634EE:
	ldr r0, _02263558 ; =0x00002D54
	add r1, r5, r4
	ldr r0, [r1, r0]
	lsr r0, r0, #0x1f
	bne _02263500
	mov r1, #2
	add r0, sp, #0xc
	strb r1, [r0, #7]
	b _0226350E
_02263500:
	ldr r0, _0226355C ; =0x00002DBE
	add r1, r5, r4
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x1c
	lsr r1, r0, #0x1c
	add r0, sp, #0xc
	strb r1, [r0, #7]
_0226350E:
	add r0, r7, #0
	add r1, r6, #0
	bl GetMonExpBySpeciesAndLevel
	ldr r1, _02263560 ; =0x00002DA4
	add r2, r5, r4
	ldr r1, [r2, r1]
	sub r0, r1, r0
	str r0, [sp, #0x18]
	add r0, r7, #0
	add r1, r6, #1
	bl GetMonExpBySpeciesAndLevel
	add r4, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	bl GetMonExpBySpeciesAndLevel
	sub r0, r4, r0
	str r0, [sp, #0x1c]
	mov r0, #0x14
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r2, [sp, #8]
	mov r1, #1
	add r3, sp, #0xc
	bl ov12_02262240
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226354C: .word 0x0000219C
_02263550: .word 0x00002D74
_02263554: .word 0x0000215C
_02263558: .word 0x00002D54
_0226355C: .word 0x00002DBE
_02263560: .word 0x00002DA4
	thumb_func_end ov12_02263488

	thumb_func_start ov12_02263564
ov12_02263564: ; 0x02263564
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r2, #0
	add r5, r1, #0
	str r3, [sp, #8]
	ldr r2, _022635E0 ; =0x0000219C
	add r3, r5, r4
	ldrb r2, [r3, r2]
	add r1, r4, #0
	str r0, [sp, #4]
	bl ov12_0223A880
	add r6, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r6, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r1, #0x19
	add r0, sp, #0xc
	strb r1, [r0]
	ldr r0, [sp, #8]
	add r1, r6, #0
	str r0, [sp, #0x10]
	add r0, r7, #0
	bl GetMonExpBySpeciesAndLevel
	mov r1, #0xc0
	mul r1, r4
	add r2, r5, r1
	ldr r1, _022635E4 ; =0x00002DA4
	ldr r1, [r2, r1]
	sub r0, r1, r0
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r1, r6, #1
	bl GetMonExpBySpeciesAndLevel
	add r5, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	bl GetMonExpBySpeciesAndLevel
	sub r0, r5, r0
	str r0, [sp, #0x18]
	mov r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #0xc
	bl ov12_02262240
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_022635E0: .word 0x0000219C
_022635E4: .word 0x00002DA4
	thumb_func_end ov12_02263564

	thumb_func_start ov12_022635E8
ov12_022635E8: ; 0x022635E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp, #4]
	add r0, r1, #0
	mov ip, r2
	mov r5, #0xb5
	mov r2, #0x1a
	add r1, sp, #0xc
	strb r2, [r1]
	mov r3, #0xc0
	mov r2, ip
	mul r3, r2
	add r2, r0, r3
	lsl r5, r5, #6
	ldrh r4, [r2, r5]
	strh r4, [r1, #2]
	add r4, r5, #0
	add r4, #0x26
	ldrb r2, [r2, r4]
	add r5, #0x70
	lsl r2, r2, #0x1b
	lsr r2, r2, #0x1b
	strb r2, [r1, #8]
	add r2, r0, r5
	mov r1, #1
	ldr r4, [r2, r3]
	lsl r1, r1, #0x18
	tst r1, r4
	beq _02263626
	mov r4, #1
	b _02263628
_02263626:
	mov r4, #0
_02263628:
	add r1, sp, #0xc
	strb r4, [r1, #9]
	mov r1, #2
	ldr r4, [r2, r3]
	lsl r1, r1, #0x14
	tst r1, r4
	beq _0226363A
	mov r4, #1
	b _0226363C
_0226363A:
	mov r4, #0
_0226363C:
	add r1, sp, #0xc
	strb r4, [r1, #0xa]
	ldr r4, [r2, r3]
	mov r2, #2
	lsl r2, r2, #0x14
	tst r2, r4
	beq _0226365A
	ldr r2, _022636E4 ; =0x00002DFA
	add r4, r0, r3
	ldrh r3, [r4, r2]
	sub r2, #0x16
	strb r3, [r1, #1]
	ldr r1, [r4, r2]
	str r1, [sp, #0x10]
	b _0226366C
_0226365A:
	ldr r2, _022636E8 ; =0x00002DBE
	add r4, r0, r3
	ldrb r3, [r4, r2]
	sub r2, #0x16
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x1c
	strb r3, [r1, #1]
	ldr r1, [r4, r2]
	str r1, [sp, #0x10]
_0226366C:
	mov r1, #0
	str r1, [sp, #8]
	ldr r1, _022636EC ; =0x00002D66
	add r7, sp, #0xc
	add r3, r0, r1
	add r1, #0x58
	add r4, r7, #0
	add r5, r7, #0
	add r6, r0, r1
_0226367E:
	mov r1, #0xb5
	lsl r1, r1, #6
	ldrh r1, [r0, r1]
	strh r1, [r7, #0xc]
	ldrb r1, [r3]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1f
	strb r1, [r4, #0x18]
	ldrb r1, [r3]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1b
	strb r1, [r4, #0x1c]
	ldr r1, _022636F0 ; =0x00002DB0
	ldr r2, [r0, r1]
	mov r1, #2
	lsl r1, r1, #0x14
	tst r1, r2
	beq _022636AC
	ldr r1, _022636E4 ; =0x00002DFA
	ldrh r1, [r0, r1]
	strb r1, [r4, #0x14]
	ldr r1, _022636F4 ; =0x00002DE4
	b _022636B6
_022636AC:
	ldrb r1, [r6]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	strb r1, [r4, #0x14]
	ldr r1, _022636F8 ; =0x00002DA8
_022636B6:
	ldr r1, [r0, r1]
	add r0, #0xc0
	str r1, [r5, #0x20]
	ldr r1, [sp, #8]
	add r7, r7, #2
	add r1, r1, #1
	add r3, #0xc0
	add r4, r4, #1
	add r5, r5, #4
	add r6, #0xc0
	str r1, [sp, #8]
	cmp r1, #4
	blt _0226367E
	mov r0, #0x30
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r1, #1
	mov r2, ip
	add r3, sp, #0xc
	bl ov12_02262240
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022636E4: .word 0x00002DFA
_022636E8: .word 0x00002DBE
_022636EC: .word 0x00002D66
_022636F0: .word 0x00002DB0
_022636F4: .word 0x00002DE4
_022636F8: .word 0x00002DA8
	thumb_func_end ov12_022635E8

	thumb_func_start ov12_022636FC
ov12_022636FC: ; 0x022636FC
	push {r4, lr}
	sub sp, #8
	mov r4, #0x1b
	add r1, sp, #4
	strb r4, [r1]
	strh r2, [r1, #2]
	mov r1, #4
	str r1, [sp]
	add r2, r3, #0
	mov r1, #1
	add r3, sp, #4
	bl ov12_02262240
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_022636FC

	thumb_func_start ov12_0226371C
ov12_0226371C: ; 0x0226371C
	push {r3, lr}
	sub sp, #8
	mov r1, #0x1c
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	mov r2, #0
	add r3, sp, #4
	bl ov12_02262240
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_0226371C

	thumb_func_start ov12_02263738
ov12_02263738: ; 0x02263738
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	mov ip, r1
	mov r3, #0x1d
	add r1, sp, #8
	strb r3, [r1]
	strb r2, [r1, #1]
	ldr r3, [r0, #0x30]
	mov r2, #0xc0
	mov r1, ip
	mul r2, r1
	ldr r1, _022637F0 ; =0x00002DB0
	add r2, r3, r2
	ldr r2, [r2, r1]
	mov r1, #1
	lsl r1, r1, #0x18
	tst r1, r2
	beq _02263760
	mov r2, #1
	b _02263762
_02263760:
	mov r2, #0
_02263762:
	add r7, sp, #8
	add r1, sp, #8
	mov r3, #0
	strb r2, [r1, #2]
	str r3, [sp, #4]
	add r4, r7, #0
	add r5, r7, #0
_02263770:
	ldr r1, [r0, #0x30]
	add r2, r1, r3
	mov r1, #0xb5
	lsl r1, r1, #6
	ldrh r1, [r2, r1]
	strh r1, [r7, #4]
	ldr r1, [r0, #0x30]
	add r2, r1, r3
	ldr r1, _022637F4 ; =0x00002D66
	ldrb r1, [r2, r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1f
	strb r1, [r4, #0x10]
	ldr r1, [r0, #0x30]
	add r2, r1, r3
	ldr r1, _022637F4 ; =0x00002D66
	ldrb r1, [r2, r1]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1b
	strb r1, [r4, #0x14]
	ldr r1, [r0, #0x30]
	add r6, r1, r3
	ldr r1, _022637F0 ; =0x00002DB0
	ldr r2, [r6, r1]
	mov r1, #2
	lsl r1, r1, #0x14
	tst r1, r2
	beq _022637B6
	ldr r1, _022637F8 ; =0x00002DFA
	ldrh r1, [r6, r1]
	strb r1, [r4, #0xc]
	ldr r1, [r0, #0x30]
	add r2, r1, r3
	ldr r1, _022637FC ; =0x00002DE4
	b _022637C6
_022637B6:
	ldr r1, _02263800 ; =0x00002DBE
	ldrb r1, [r6, r1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	strb r1, [r4, #0xc]
	ldr r1, [r0, #0x30]
	add r2, r1, r3
	ldr r1, _02263804 ; =0x00002DA8
_022637C6:
	ldr r1, [r2, r1]
	add r3, #0xc0
	str r1, [r5, #0x18]
	ldr r1, [sp, #4]
	add r7, r7, #2
	add r1, r1, #1
	add r4, r4, #1
	add r5, r5, #4
	str r1, [sp, #4]
	cmp r1, #4
	blt _02263770
	mov r1, #0x28
	str r1, [sp]
	mov r1, #1
	mov r2, ip
	add r3, sp, #8
	bl ov12_02262240
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022637F0: .word 0x00002DB0
_022637F4: .word 0x00002D66
_022637F8: .word 0x00002DFA
_022637FC: .word 0x00002DE4
_02263800: .word 0x00002DBE
_02263804: .word 0x00002DA8
	thumb_func_end ov12_02263738

	thumb_func_start ov12_02263808
ov12_02263808: ; 0x02263808
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	mov r3, #0x1e
	add r1, sp, #4
	strb r3, [r1]
	strb r2, [r1, #1]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #4
	bl ov12_02262240
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov12_02263808

	thumb_func_start ov12_02263828
ov12_02263828: ; 0x02263828
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	mov r3, #0x1f
	add r1, sp, #4
	strb r3, [r1]
	strb r2, [r1, #1]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #4
	bl ov12_02262240
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov12_02263828

	thumb_func_start ov12_02263848
ov12_02263848: ; 0x02263848
	push {r3, r4, r5, lr}
	sub sp, #0x68
	add r4, r2, #0
	str r3, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	add r2, sp, #0x10
	mov r3, #1
	add r5, r0, #0
	bl ov12_022643C8
	mov r0, #0x58
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #0x10
	bl ov12_02262240
	add sp, #0x68
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_02263848

	thumb_func_start ov12_02263878
ov12_02263878: ; 0x02263878
	push {r3, r4, r5, lr}
	sub sp, #0x68
	add r4, r2, #0
	ldr r2, [sp, #0x78]
	add r5, r0, #0
	str r2, [sp]
	str r4, [sp, #4]
	str r3, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	add r2, sp, #0x10
	mov r3, #1
	bl ov12_022643C8
	mov r0, #0x58
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #0x10
	bl ov12_02262240
	add sp, #0x68
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02263878

	thumb_func_start ov12_022638A8
ov12_022638A8: ; 0x022638A8
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r2, #0
	mov r2, #0x20
	add r0, sp, #4
	strb r2, [r0]
	strb r3, [r0, #1]
	ldr r0, _022638E4 ; =0x00003122
	ldrsh r2, [r1, r0]
	ldr r0, _022638E8 ; =0x00002E4C
	ldr r0, [r1, r0]
	sub r1, r2, r0
	mov r0, #0x64
	mul r0, r1
	add r1, r2, #0
	bl _s32_div_f
	add r1, sp, #4
	strh r0, [r1, #2]
	mov r0, #4
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #4
	bl ov12_02262240
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022638E4: .word 0x00003122
_022638E8: .word 0x00002E4C
	thumb_func_end ov12_022638A8

	thumb_func_start ov12_022638EC
ov12_022638EC: ; 0x022638EC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	mov r1, #0x21
	add r0, sp, #4
	strb r1, [r0]
	ldr r2, _02263934 ; =0x00002E4C
	strb r3, [r0, #1]
	ldr r1, [r6, r2]
	cmp r1, #0
	bne _0226390E
	mov r1, #0xfa
	lsl r1, r1, #2
	strh r1, [r0, #2]
	b _02263920
_0226390E:
	mov r0, #0xfa
	lsl r0, r0, #2
	mul r0, r1
	add r1, r2, #4
	ldr r1, [r6, r1]
	bl _u32_div_f
	add r1, sp, #4
	strh r0, [r1, #2]
_02263920:
	mov r0, #4
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #4
	bl ov12_02262240
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02263934: .word 0x00002E4C
	thumb_func_end ov12_022638EC

	thumb_func_start ov12_02263938
ov12_02263938: ; 0x02263938
	push {r3, lr}
	sub sp, #8
	mov r1, #0x22
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl ov12_02262240
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov12_02263938

	thumb_func_start ov12_02263950
ov12_02263950: ; 0x02263950
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r1, #0
	str r2, [sp, #4]
	mov r2, #0x23
	add r1, sp, #8
	add r6, r0, #0
	strb r2, [r1]
	mov r4, #0
	bl ov12_0223A7F0
	cmp r0, #0
	ble _02263982
	add r5, sp, #8
_0226396C:
	ldr r0, _02263998 ; =0x0000219C
	add r1, r7, r4
	ldrb r0, [r1, r0]
	add r4, r4, #1
	strb r0, [r5, #4]
	add r0, r6, #0
	add r5, r5, #1
	bl ov12_0223A7F0
	cmp r4, r0
	blt _0226396C
_02263982:
	mov r0, #8
	str r0, [sp]
	ldr r2, [sp, #4]
	add r0, r6, #0
	mov r1, #1
	add r3, sp, #8
	bl ov12_02262240
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02263998: .word 0x0000219C
	thumb_func_end ov12_02263950

	thumb_func_start ov12_0226399C
ov12_0226399C: ; 0x0226399C
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #0x24
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl ov12_02262240
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_0226399C

	thumb_func_start ov12_022639B8
ov12_022639B8: ; 0x022639B8
	push {r0, r1, r2, r3}
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	add r4, r1, #0
	add r5, r0, #0
	bl ov12_0223A7E4
	add r1, r4, #0
	bl ov12_0224EDC0
	mov r1, #0x25
	add r0, sp, #4
	strb r1, [r0]
	add r6, sp, #0x48
	add r3, sp, #8
	mov r2, #4
_022639D8:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _022639D8
	ldr r0, [r6]
	mov r1, #1
	str r0, [r3]
	mov r0, #0x28
	str r0, [sp]
	add r0, r5, #0
	add r2, r4, #0
	add r3, sp, #4
	bl ov12_02262240
	add sp, #0x2c
	pop {r3, r4, r5, r6}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov12_022639B8

	thumb_func_start ov12_02263A00
ov12_02263A00: ; 0x02263A00
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #1
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #0
	add r3, sp, #4
	bl ov12_02262240
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_02263A00

	thumb_func_start ov12_02263A1C
ov12_02263A1C: ; 0x02263A1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r1, #0
	ldr r1, _02263B38 ; =0x0000219C
	add r4, r2, #0
	add r7, r5, r1
	ldrb r2, [r7, r4]
	add r1, r4, #0
	str r0, [sp, #4]
	bl ov12_0223A880
	add r6, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	mov r0, #0x26
	add r3, sp, #0x10
	strb r0, [r3]
	mov r0, #0xc0
	add r6, r4, #0
	mul r6, r0
	ldr r2, _02263B3C ; =0x00002D74
	add r0, r5, r6
	ldrb r1, [r0, r2]
	strb r1, [r3, #1]
	add r1, r2, #0
	add r1, #0x18
	ldr r1, [r0, r1]
	add r2, #0x1c
	strh r1, [r3, #2]
	ldr r0, [r0, r2]
	add r1, r4, #0
	strh r0, [r3, #4]
	ldrb r0, [r7, r4]
	strb r0, [r3, #6]
	add r0, r5, #0
	bl ov12_02250CFC
	add r1, sp, #0x10
	ldrb r2, [r1, #7]
	mov r3, #0x1f
	lsl r0, r0, #0x18
	bic r2, r3
	lsr r3, r0, #0x18
	mov r0, #0x1f
	and r0, r3
	orr r0, r2
	strb r0, [r1, #7]
	mov r0, #0xb5
	lsl r0, r0, #6
	add r7, r5, r0
	ldrh r0, [r7, r6]
	cmp r0, #0x1d
	beq _02263A9C
	cmp r0, #0x20
	bne _02263AB6
_02263A9C:
	ldr r0, _02263B40 ; =0x00002D54
	add r1, r5, r6
	ldr r0, [r1, r0]
	lsr r0, r0, #0x1f
	bne _02263AB6
	add r0, sp, #0x10
	ldrb r1, [r0, #7]
	mov r2, #0x60
	bic r1, r2
	mov r2, #0x40
	orr r1, r2
	strb r1, [r0, #7]
	b _02263AD0
_02263AB6:
	add r3, sp, #0x10
	ldrb r2, [r3, #7]
	mov r0, #0x60
	add r1, r5, r6
	bic r2, r0
	ldr r0, _02263B44 ; =0x00002DBE
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x19
	orr r0, r2
	strb r0, [r3, #7]
_02263AD0:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	bl GetMonExpBySpeciesAndLevel
	mov r1, #0xc0
	mul r1, r4
	add r2, r5, r1
	ldr r1, _02263B48 ; =0x00002DA4
	ldr r1, [r2, r1]
	sub r0, r1, r0
	ldr r1, [sp, #8]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0xc]
	add r1, r1, #1
	bl GetMonExpBySpeciesAndLevel
	add r5, r0, #0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	bl GetMonExpBySpeciesAndLevel
	sub r0, r5, r0
	str r0, [sp, #0x1c]
	ldrh r1, [r7, r6]
	ldr r0, [sp, #4]
	bl ov12_0223C330
	add r3, sp, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r3, #7]
	mov r2, #0x80
	lsr r0, r0, #0x18
	bic r1, r2
	orr r0, r1
	strb r0, [r3, #7]
	ldr r0, [sp, #4]
	bl ov12_0223B6B4
	str r0, [sp, #0x20]
	mov r0, #0x14
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #0x10
	bl ov12_02262240
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02263B38: .word 0x0000219C
_02263B3C: .word 0x00002D74
_02263B40: .word 0x00002D54
_02263B44: .word 0x00002DBE
_02263B48: .word 0x00002DA4
	thumb_func_end ov12_02263A1C

	thumb_func_start ov12_02263B4C
ov12_02263B4C: ; 0x02263B4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r6, r1, #0
	str r2, [sp, #8]
	mov r1, #0x27
	add r2, sp, #0x10
	strb r1, [r2]
	ldrb r1, [r2, #1]
	mov r3, #0xf
	str r0, [sp, #4]
	bic r1, r3
	ldr r3, [sp, #8]
	add r4, r6, r3
	ldr r3, _02263C88 ; =0x0000219C
	ldrb r4, [r4, r3]
	mov r3, #0xf
	and r3, r4
	orr r1, r3
	strb r1, [r2, #1]
	ldr r1, [sp, #8]
	mov r3, #0xc0

