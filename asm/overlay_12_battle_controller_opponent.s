#include "constants/pokemon.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "overlay_12_battle_controller_opponent.inc"
	.include "global.inc"

	.text

	thumb_func_start ov12_02258800
ov12_02258800: ; 0x02258800
	push {r4, r5, r6, r7, lr}
	sub sp, #0x94
	str r1, [sp, #0x18]
	add r7, r0, #0
	bl BattleSystem_GetBattleContext
	add r5, r0, #0
	ldr r0, [sp, #0x18]
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r7, #0
	bl BattleSystem_GetBattleType
	mov r1, #0x10
	tst r0, r1
	bne _0225882C
	add r0, r7, #0
	bl BattleSystem_GetBattleType
	mov r1, #8
	tst r0, r1
	beq _02258830
_0225882C:
	str r4, [sp, #0x44]
	b _0225883E
_02258830:
	ldr r1, [sp, #0x18]
	add r0, r7, #0
	bl BattleSystem_GetBattlerIdPartner
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
	bl BattleSystem_GetPartySize
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
	bl BattleSystem_GetPartyMon
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
	bl GetBattlerVar
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x60]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1c
	mov r3, #0
	bl GetBattlerVar
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
	bl CalculateTypeEffectiveness
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x60]
	ldr r2, [sp, #0x5c]
	bl CalculateTypeEffectiveness
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
	bl BattleSystem_GetPartyMon
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
	bl GetBattlerAbility
	str r0, [sp, #0x74]
	add r0, r5, #0
	add r1, r6, #0
	bl GetBattlerHeldItemEffect
	str r0, [sp, #0x78]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1b
	mov r3, #0
	bl GetBattlerVar
	str r0, [sp, #0x7c]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x1c
	mov r3, #0
	bl GetBattlerVar
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
	bl BattleSystem_GetPartyMon
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
	bl BattleSystem_GetFieldSide
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
	bl CalcMoveDamage
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
	bl BattleSystem_GetBattleContext
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
	bl GetItemVar
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
	bl GetItemVar
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
	bl CheckAbilityActive
	cmp r0, #0
	bne _02258D66
	mov r0, #0x4c
	str r0, [sp]
	add r0, r7, #0
	add r1, r6, #0
	mov r2, #8
	mov r3, #0
	bl CheckAbilityActive
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
	bl NARC_New
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetPaletteData
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
	bl BattleHpBar_FreeResources
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
	bl NARC_Delete
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
	bl BattleSystem_SetRandTemp
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
	bl BattleSystem_GetPartyMon
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetPartySize
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
	bl BattleSystem_GetPartyMon
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
	bl BattleSystem_SetBackground
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
	bl NARC_New
	add r6, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_New
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
	bl NARC_Delete
	add r0, r7, #0
	bl NARC_Delete
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	bl BattleSystem_GetBattlerIdPartner
	add r1, r0, #0
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r1, r0
	beq _02259586
	add r0, r5, #0
	bl BattleSystem_GetHpBar
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
	bl BattleSystem_GetFieldSide
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
	bl BattleSystem_GetFieldSide
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
	bl BattleSystem_GetPaletteData
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
	bl BattleSystem_GameStatIncrement
	b _022596E4
_022596D8:
	ldrb r1, [r5, r1]
	cmp r1, #0
	beq _022596E4
	ldrh r1, [r4, #2]
	bl BattleSystem_GameStatIncrement
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
	bl BattleSystem_GetBattleType
	mov r1, #0x80
	tst r0, r1
	beq _02259824
	ldr r1, [sp, #0x10]
	ldr r0, [sp]
	ldr r1, [r1, #4]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BattleSystem_SetBattleOutcomeFlags
	b _022598DC
_02259824:
	add r0, r7, #0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	bl BattleSystem_GetMaxBattlers
	cmp r0, #0
	ble _022598B2
_02259832:
	ldr r0, [sp]
	ldr r1, [sp, #0xc]
	bl BattleSystem_GetParty
	add r6, r0, #0
	mov r5, #0
	bl Party_GetCount
	cmp r0, #0
	ble _022598A0
_02259846:
	add r0, r6, #0
	add r1, r5, #0
	bl Party_GetMonByIndex
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
	bl BattleSystem_GetFieldSide
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
	bl Party_GetCount
	cmp r5, r0
	blt _02259846
_022598A0:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp]
	bl BattleSystem_GetMaxBattlers
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
	bl BattleSystem_SetBattleOutcomeFlags
	b _022598DC
_022598C6:
	cmp r7, #0
	bne _022598D4
	ldr r0, [sp]
	mov r1, #2
	bl BattleSystem_SetBattleOutcomeFlags
	b _022598DC
_022598D4:
	ldr r0, [sp]
	mov r1, #1
	bl BattleSystem_SetBattleOutcomeFlags
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
	bl BattleSystem_GetWindow
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleSpecial
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
	bl BattleSystem_GetBattleSpecial
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
	mov r1, #8
	tst r0, r1
	bne _0225A10A
	add r0, r6, #0
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
	cmp r0, #0
	beq _0225A1E8
	add r0, r6, #0
	bl BattleSystem_GetBattleType
	cmp r0, #0x20
	beq _0225A1E8
	add r0, r6, #0
	bl BattleSystem_GetBattleType
	mov r1, #1
	lsl r1, r1, #8
	cmp r0, r1
	beq _0225A1E8
	add r0, r6, #0
	bl BattleSystem_GetBattleType
	mov r1, #2
	lsl r1, r1, #8
	cmp r0, r1
	beq _0225A1E8
	add r0, r6, #0
	bl BattleSystem_GetBattleType
	mov r1, #1
	lsl r1, r1, #0xa
	cmp r0, r1
	beq _0225A1E8
	add r0, r6, #0
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBgConfig
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
	bl BattleSystem_GetTrainer
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleHpBar_SetEnabled
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
	bl BattleSystem_GetMaxBattlers
	add r4, r0, #0
	ldr r0, [sp]
	bl BattleSystem_GetBattleType
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
	bl SaveArray_Party_Alloc
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetTrainerIndex
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetWindow
	mov r1, #1
	bl WaitingIcon_New
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetBattleType
	mov r1, #8
	tst r0, r1
	ldr r0, [r4]
	beq _0225B9C8
	bl BattleSystem_GetBattleSpecial
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
	bl BattleSystem_GetBattleSpecial
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
	bl BattleSystem_GetPartyMon
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
	bl BattleSystem_GetBattleType
	mov r1, #8
	tst r0, r1
	ldr r0, [r4]
	beq _0225BE9E
	bl BattleSystem_GetBattleSpecial
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
	bl BattleSystem_GetBattleSpecial
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
	bl BattleSystem_GetPaletteData
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
	bl BattleSystem_GetPartyMon
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
	bl BattleSystem_GetPaletteData
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
	bl BattleSystem_GetPaletteData
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBgConfig
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetPaletteData
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
	bl BattleSystem_GetBattlerIdPartner
	add r1, r0, #0
	ldr r0, [r4]
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetBattlerIdPartner
	add r1, r0, #0
	ldr r0, [r4]
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattlerIdPartner
	add r1, r0, #0
	ldr r0, [r5]
	bl BattleSystem_GetOpponentData
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
	bl BattleHpBar_SetEnabled
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
	bl BattleHpBar_SetEnabled
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
	bl BattleSystem_GetBgConfig
	ldr r0, [r4]
	bl ov12_0223A900
	add r6, r0, #0
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl BattleSystem_GetOpponentData
	str r0, [sp, #0xc]
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
	add r5, r0, #0
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl BattleSystem_GetBattlerIdPartner
	add r1, r0, #0
	ldrb r0, [r4, #9]
	cmp r1, r0
	beq _0225DB16
	ldr r0, [r4]
	bl BattleSystem_GetHpBar
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
	bl BattleSystem_GetTrainerGender
	ldr r1, _0225DEDC ; =0x000004CA
	add r1, r0, r1
	add r0, sp, #0x10
	strh r1, [r0, #0xe]
	ldr r0, [r4]
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTrainerIndex
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
	bl BattleSystem_GetTrainerIndex
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
	bl NARC_New
	add r7, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_New
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
	bl BattleSystem_GetBattleSpecial
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleSpecial
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl NARC_Delete
	add r0, r5, #0
	bl NARC_Delete
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
	bl BattleSystem_GetMaxBattlers
	cmp r0, #0
	ble _0225DF1E
_0225DF04:
	ldr r0, [r4]
	add r1, r5, #0
	bl BattleSystem_GetOpponentData
	add r0, #0x28
	bl ov12_02264C84
	ldr r0, [r4]
	add r5, r5, #1
	bl BattleSystem_GetMaxBattlers
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
	bl BattleSystem_GetBattleType
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
	bl NARC_New
	add r5, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_New
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
	bl NARC_Delete
	add r0, r7, #0
	bl NARC_Delete
	b _0225E066
_0225DFD0:
	mov r0, #7
	mov r1, #5
	bl NARC_New
	add r5, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_New
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
	bl NARC_Delete
	add r0, r7, #0
	bl NARC_Delete
	b _0225E066
_0225E01C:
	mov r0, #7
	mov r1, #5
	bl NARC_New
	add r7, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_New
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
	bl NARC_Delete
	add r0, r5, #0
	bl NARC_Delete
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
	bl NARC_New
	add r5, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_New
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
	bl NARC_Delete
	add r0, r7, #0
	bl NARC_Delete
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
	bl BattleSystem_GetBattleContext
	mov r2, #0
	ldrb r1, [r4, #9]
	add r3, r2, #0
	bl GetBattlerVar
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
	bl BattleSystem_Random
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
	bl BattleSystem_GetBgConfig
	ldr r0, [r4]
	bl ov12_0223A900
	add r7, r0, #0
	ldrb r1, [r4, #0x1d]
	ldr r0, [r4]
	bl BattleSystem_GetOpponentData
	str r0, [sp, #0x10]
	ldrb r1, [r4, #0x1d]
	ldr r0, [r4]
	bl BattleSystem_GetBattlerIdPartner
	add r1, r0, #0
	ldrb r0, [r4, #0x1d]
	cmp r1, r0
	beq _0225E28A
	ldr r0, [r4]
	bl BattleSystem_GetHpBar
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
	bl NARC_New
	str r0, [sp, #0xc]
	mov r0, #8
	mov r1, #5
	bl NARC_New
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
	bl NARC_Delete
	ldr r0, [sp, #8]
	bl NARC_Delete
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
	add r4, r0, #0
	ldr r0, [r6]
	bl BattleSystem_GetBattleContext
	str r0, [sp, #0xc]
	ldr r0, _0225E4C8 ; =0x00000101
	tst r0, r4
	bne _0225E43A
	ldr r0, [r6]
	bl BattleSystem_GetBattleSpecial
	mov r1, #1
	tst r0, r1
	bne _0225E43A
	ldrb r1, [r6, #0x1d]
	ldr r0, [r6]
	bl BattleSystem_GetFieldSide
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
	bl BattleSystem_Random
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
	bl BattleSystem_GetBattleContext
	ldrb r1, [r5, #0x1d]
	add r2, r4, #5
	mov r3, #0
	bl GetBattlerVar
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
	bl BattleSystem_GetBgConfig
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl BattleSystem_GetOpponentData
	add r7, r0, #0
	ldr r0, [r4]
	bl ov12_0223A900
	add r5, r0, #0
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl BattleSystem_GetBattlerIdPartner
	add r1, r0, #0
	ldrb r0, [r4, #0xd]
	cmp r1, r0
	beq _0225E5A2
	ldr r0, [r4]
	bl BattleSystem_GetHpBar
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
	bl NARC_New
	add r7, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_New
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
	bl NARC_Delete
	add r0, r6, #0
	bl NARC_Delete
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleContext
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
	bl BattleSystem_GetFieldSide
	add r6, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	bl BattleSystem_GetFieldSide
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
	bl BattleSystem_GetPaletteData
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
	bl BattleSystem_GetMessageIcon
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
	bl BattleSystem_GetPlayerProfile
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
	bl BattleSystem_GetBag
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
	bl BattleSystem_GetParty
	str r0, [sp, #0x14]
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
	mov r1, #2
	tst r0, r1
	beq _0225EA16
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
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
	bl Party_InitWithMaxSize
	ldr r0, [sp, #0x14]
	mov r6, #0
	bl Party_GetCount
	cmp r0, #0
	ble _0225EA66
	mov r0, #6
	mul r0, r7
	add r5, r4, r0
_0225EA36:
	ldrb r2, [r5, #0x18]
	ldr r0, [r4]
	add r1, r7, #0
	bl BattleSystem_GetPartyMon
	add r1, r0, #0
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	ldr r0, [r0]
	bl Party_AddMon
	ldr r1, [r4, #8]
	ldrb r0, [r5, #0x18]
	ldr r1, [r1, #4]
	add r5, r5, #1
	add r1, r1, r6
	add r1, #0x2c
	strb r0, [r1]
	ldr r0, [sp, #0x14]
	add r6, r6, #1
	bl Party_GetCount
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
	bl BattleSystem_GetBattlerIdPartner
	add r0, r5, r0
	ldrb r1, [r0, #0xc]
	ldr r0, [r5, #4]
	strb r1, [r0, #0x15]
	ldrb r0, [r4, #0xf]
	cmp r0, #4
	bne _0225EAFC
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl BattleSystem_GetBattlerIdPartner
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
	bl BattleSystem_GetBattlerIdPartner
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
	bl BattleSystem_GetMessageIcon
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
	bl BattleSystem_GetBattleType
	cmp r0, #3
	beq _0225EC44
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_AreBattleAnimationsOn
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
	bl BattleSystem_AreBattleAnimationsOn
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
	bl BattleSystem_GetBattleType
	cmp r0, #3
	beq _0225ECB8
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_AreBattleAnimationsOn
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
	bl BattleSystem_AreBattleAnimationsOn
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
	bl BattleSystem_AreBattleAnimationsOn
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetHpBar
	mov r1, #0
	mov r2, #1
	add r5, r0, #0
	bl MI_CpuFill8
	ldr r0, [r4]
	add r1, r6, #0
	bl ov12_0223AB0C
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
	add r1, r0, #0
	ldr r0, [sp, #0x18]
	bl ov12_02265B64
	add r1, r5, #0
	add r1, #0x25
	strb r0, [r1]
	ldr r0, [r4]
	add r1, r6, #0
	add r2, r7, #0
	bl BattleSystem_GetPartyMon
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
	bl BattleSystem_GetHpBar
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetHpBar
	str r0, [sp, #0x10]
	ldr r0, [r4, #8]
	add r1, r7, #0
	ldr r3, [r0, #4]
	ldr r0, [r4]
	ldrb r2, [r3, #0x11]
	add r2, r3, r2
	add r2, #0x2c
	ldrb r2, [r2]
	bl BattleSystem_GetPartyMon
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetPaletteData
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
	bl BattleSystem_GetWindow
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
	bl BattleSystem_GetMessageIcon
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
	bl SaveArray_Party_Alloc
	ldr r1, [r4, #4]
	str r0, [r1]
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
	mov r1, #0xc
	and r0, r1
	cmp r0, #0xc
	beq _0225F5B2
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattlerIdPartner
	str r0, [sp, #0x14]
	b _0225F5DC
_0225F5CE:
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl BattleSystem_GetBattlerIdPartner
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
	bl Party_AddMon
	add r5, r5, #1
	cmp r5, #6
	blt _0225F5E6
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, [r4]
	ldr r1, [sp, #0x18]
	mov r7, #0
	bl BattleSystem_GetPartySize
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
	bl BattleSystem_GetPartyMon
	str r0, [sp, #0x1c]
	ldr r0, [r4, #4]
	add r1, r6, #0
	ldr r0, [r0]
	bl Party_GetMonByIndex
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
	bl BattleSystem_GetPartySize
	cmp r7, r0
	blt _0225F614
_0225F64E:
	ldr r0, [r4]
	ldr r1, [sp, #0x14]
	mov r6, #0
	bl BattleSystem_GetPartySize
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
	bl BattleSystem_GetPartyMon
	str r0, [sp, #0x20]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0xc]
	ldr r0, [r0]
	bl Party_GetMonByIndex
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
	bl BattleSystem_GetPartySize
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
	bl BattleSystem_GetBattleType
	mov r1, #2
	tst r0, r1
	beq _0225F6E8
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetParty
	str r0, [sp, #0x10]
	mov r6, #0
	bl Party_GetCount
	cmp r0, #0
	ble _0225F746
	mov r0, #6
	mul r0, r7
	add r5, r4, r0
_0225F71A:
	ldrb r2, [r5, #0x1c]
	ldr r0, [r4]
	add r1, r7, #0
	bl BattleSystem_GetPartyMon
	add r1, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0]
	bl Party_AddMon
	ldr r0, [r4, #4]
	ldrb r1, [r5, #0x1c]
	add r0, r0, r6
	add r0, #0x2c
	strb r1, [r0]
	ldr r0, [sp, #0x10]
	add r5, r5, #1
	add r6, r6, #1
	bl Party_GetCount
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattlerIdPartner
	bl MaskOfFlagNo
	ldrb r1, [r4, #0x18]
	tst r0, r1
	bne _0225F7D4
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl BattleSystem_GetBattlerIdPartner
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
	bl BattleSystem_GetMessageIcon
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattlerIdPartner
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
	bl BattleSystem_GetParty
	str r0, [sp, #8]
	mov r4, #0
	bl Party_GetCount
	cmp r0, #0
	ble _0225F93A
	ldr r0, [sp, #4]
	add r7, r5, r6
	add r6, r5, r0
_0225F90C:
	ldrb r1, [r5, #9]
	ldr r0, [r5]
	add r2, r4, #0
	bl BattleSystem_GetPartyMon
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
	bl Party_GetCount
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
	bl BattleSystem_GetParty
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
	bl Party_GetCount
	cmp r5, r0
	ldr r0, [r4]
	ble _0225F9E6
	bl ov12_02261EB8
	b _0225FA18
_0225F9E6:
	ldrb r1, [r4, #9]
	sub r2, r5, #1
	bl BattleSystem_GetPartyMon
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
	bl BattleSystem_GetBgConfig
	ldr r0, [r4]
	bl ov12_0223A900
	add r5, r0, #0
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl BattleSystem_GetOpponentData
	str r0, [sp, #0xc]
	ldrb r1, [r4, #0xd]
	ldr r0, [r4]
	bl BattleSystem_GetBattlerIdPartner
	add r1, r0, #0
	ldrb r0, [r4, #0xd]
	cmp r1, r0
	beq _0225FA7E
	ldr r0, [r4]
	bl BattleSystem_GetHpBar
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
	bl BattleSystem_GetTextFrameDelay
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
	bl NARC_New
	add r7, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_New
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
	bl NARC_Delete
	add r0, r6, #0
	bl NARC_Delete
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
	bl NARC_New
	str r0, [sp, #8]
	mov r0, #8
	mov r1, #5
	bl NARC_New
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
	bl NARC_Delete
	add r0, r6, #0
	bl NARC_Delete
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
	bl BattleSystem_SetCriticalHpMusicFlag
	add r0, r4, #0
	add r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225FE1A
	ldr r0, [r4]
	bl BattleSystem_SetHpBarDisabled
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
	bl BattleSystem_SetCriticalHpMusicFlag
	add r0, r4, #0
	add r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225FE68
	ldr r0, [r4]
	bl BattleSystem_SetHpBarEnabled
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
	bl BattleSystem_GetChatotVoice
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
	bl BattleSystem_GetPaletteData
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
	bl BattleSystem_GetMessageIcon
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
	bl BattleSystem_GetBgConfig
	ldr r0, [r4]
	bl BattleSystem_GetPaletteData
	add r7, r0, #0
	ldr r0, [r4]
	bl BattleSystem_GetTerrainId
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetMessageIcon
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetPaletteData
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
	bl BattleSystem_GetParty
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
	bl BattleSystem_GetFieldSide
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
	bl BattleSystem_GetFieldSide
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
	bl BattleSystem_GetPaletteData
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
	bl BattleSystem_GetMessageIcon
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
	bl BattleSystem_GetBattleType
	add r4, r0, #0
	add r0, r6, #0
	bl BattleSystem_GetBattleSpecial
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

	thumb_func_start OpponentData_GetHpBar
OpponentData_GetHpBar: ; 0x0226127C
	add r0, #0x28
	bx lr
	thumb_func_end OpponentData_GetHpBar

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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
	mov r1, #2
	tst r0, r1
	bne _02261434
	add r0, r7, #0
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
	mov r1, #2
	tst r0, r1
	bne _0226150C
	add r0, r7, #0
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattlerIdPartner
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
	bl BattleSystem_GetBattlerIdPartner
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
	bl BattleSystem_GetBattleType
	add r6, r0, #0
	ldr r0, [sp]
	bl BattleSystem_GetBattleOutcomeFlags
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
	bl BattleSystem_GetMaxBattlers
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
	bl BattleSystem_GetFieldSide
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
	bl BattleSystem_GetMaxBattlers
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
	bl BattleSystem_SetBattleOutcomeFlags
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
	bl BattleSystem_SetBattleOutcomeFlags
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02261A62:
	add r0, r5, #0
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_SetBattleOutcomeFlags
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_SetBattleOutcomeFlags
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
	bl BattleSystem_GetPaletteData
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
	bl BattleSystem_GetBgConfig
	str r0, [sp, #0x20]
	ldr r0, [sp]
	bl BattleSystem_GetPaletteData
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
	bl BattleSystem_GetBattleType
	mov r2, #0x65
	str r0, [sp, #0x4c]
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	ldrb r1, [r1, r2]
	ldr r0, [sp]
	bl BattleSystem_GetChatotVoice
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
	bl GetMoveAttr
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
	bl GetMoveAttr
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
	bl IsBrightnessTransitionActive
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
	bl StartBrightnessTransition
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_02261E7E:
	mov r0, #1
	bl IsBrightnessTransitionActive
	cmp r0, #1
	bne _02261EB6
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	mov r1, #0
	mov r2, #0x10
	mov r3, #0x3d
	bl StartBrightnessTransition
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_02261EA0:
	mov r0, #1
	bl IsBrightnessTransitionActive
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
	bl BattleSystem_GetBattleContext
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
	bl BattleSystem_GetBattleContext
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetPlayerProfile
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
	bl BattleSystem_AreBattleAnimationsOn
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
	bl BattleSystem_GetChatotVoice
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

    .rodata

ov12_0226D010: ; 0x0226D010
	.word ov12_02258EB0
	.word ov12_02258EB4
	.word ov12_02258EE0
	.word ov12_02258EF4
	.word ov12_02258F08
	.word ov12_02258F1C
	.word ov12_02258F30
	.word ov12_02258F44
	.word ov12_02258F68
	.word ov12_02258F7C
	.word ov12_02258F90
	.word ov12_02258FA0
	.word ov12_02258FB4
	.word ov12_02258FC8
	.word ov12_02258FD8
	.word ov12_02259000
	.word ov12_02259014
	.word ov12_02259028
	.word ov12_0225903C
	.word ov12_02259050
	.word ov12_02259064
	.word ov12_02259078
	.word ov12_0225908C
	.word ov12_022590A0
	.word ov12_022590D4
	.word ov12_022590E8
	.word ov12_022590FC
	.word ov12_02259110
	.word ov12_02259124
	.word ov12_02259134
	.word ov12_02259148
	.word ov12_0225915C
	.word ov12_02259170
	.word ov12_02259184
	.word ov12_02259198
	.word ov12_022591A8
	.word ov12_022591BC
	.word ov12_022591CC
	.word ov12_022591E0
	.word ov12_022591F4
	.word ov12_022592D0
	.word ov12_02259328
	.word ov12_02259358
	.word ov12_022593D4
	.word ov12_022593E8
	.word ov12_022593FC
	.word ov12_022594F4
	.word ov12_02259514
	.word ov12_022595B8
	.word ov12_022595CC
	.word ov12_022595E0
	.word ov12_0225961C
	.word ov12_02259658
	.word ov12_02259694
	.word ov12_022596B8
	.word ov12_02259700
	.word ov12_02259724
	.word ov12_02259738
	.word ov12_02259748
	.word ov12_02259758
	.word ov12_02259768
	.word ov12_0225978C
	.word ov12_022597B0
	.word ov12_022597C4
	.word ov12_022597D8
	.word ov12_022597EC
	.word ov12_022598F8
	.word ov12_02259930

ov12_0226D120: ; 0x0226D120
	.byte 0x06, 0x01, 0x08, 0x03, 0x07, 0x05, 0x00, 0x00

ov12_0226D128: ; 0x0226D128
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00

ov12_0226D140: ; 0x0226D140
	.byte 0x0A

ov12_0226D141: ; 0x0226D141
	.byte 0x28, 0x0A, 0x23, 0x0A, 0x1E, 0x0A, 0x19, 0x0A, 0x14, 0x0A, 0x0F, 0x0A, 0x0A, 0x0F, 0x0A
	.byte 0x14, 0x0A, 0x19, 0x0A, 0x1E, 0x0A, 0x23, 0x0A, 0x28, 0x0A

ov12_0226D15A: ; 0x0226D15A
	.byte 0x00, 0x00, 0x97, 0x72, 0xFF, 0x3F
	.byte 0xF0, 0x7A, 0xDF, 0x7A, 0xD7, 0x53, 0xF5, 0x67, 0x2C, 0x7B, 0x7E, 0x2B, 0x1F, 0x43, 0xDD, 0x7B
	.byte 0x3F, 0x2A, 0x3F, 0x29, 0xCE, 0x45, 0x1F, 0x73, 0x51, 0x7F, 0x1E, 0x15, 0xDF, 0x7A, 0xDF, 0x7A
	.byte 0xDF, 0x7A, 0xDF, 0x7A, 0xDF, 0x7A, 0xDF, 0x7A, 0xDF, 0x7A, 0xDF, 0x7A

ov12_0226D18C: ; 0x0226D18C
	.byte 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00

ov12_0226D1E8: ; 0x0226D1E8
	.byte 0x00, 0x00

ov12_0226D1EA: ; 0x0226D1EA
	.byte 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00
	.byte 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00, 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF
	.byte 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00
	.byte 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00, 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF
	.byte 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x80, 0x00, 0xDF, 0xFF, 0xFA, 0xFF
	.byte 0xE4, 0xFF, 0xEE, 0xFF, 0x32, 0x00, 0xDC, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x80, 0x00, 0xDF, 0xFF, 0xFE, 0xFF, 0xE4, 0xFF, 0xEE, 0xFF, 0x32, 0x00, 0xE4, 0xFF
	.byte 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00
	.byte 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00, 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF
	.byte 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00
	.byte 0xE9, 0xFF, 0xFF, 0xFF, 0x32, 0x00, 0xFE, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00, 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF
	.byte 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00
	.byte 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00, 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF
	.byte 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00
	.byte 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00, 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF
	.byte 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00
	.byte 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F

ov12_0226D350: ; 0x0226D350
	.byte 0x09, 0x17, 0x05, 0x13, 0x0D, 0x11, 0x0F, 0x07, 0x15, 0x0B, 0x19, 0x0B, 0x0B, 0x0B, 0x0B, 0x0B
	.byte 0x0B, 0x15, 0x0B, 0x0B, 0x0B, 0x0B, 0x0B, 0x0B

