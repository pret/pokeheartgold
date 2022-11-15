#include "constants/pokemon.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start BtlCmd_TryOHKO
BtlCmd_TryOHKO: ; 0x022404E0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r1, _022406B4 ; =0x0000213C
	mov r0, #1
	ldr r2, [r4, r1]
	lsl r0, r0, #0xa
	orr r0, r2
	str r0, [r4, r1]
	ldr r1, [r4, #0x64]
	ldr r2, [r4, #0x6c]
	add r0, r4, #0
	mov r3, #5
	bl CheckBattlerAbilityIfNotIgnored
	cmp r0, #1
	bne _02240518
	ldr r1, _022406B8 ; =0x0000216C
	mov r0, #2
	ldr r2, [r4, r1]
	lsl r0, r0, #0x12
	orr r0, r2
	str r0, [r4, r1]
	b _022406B0
_02240518:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	mov r0, #0xb7
	lsl r0, r0, #6
	ldr r1, [r1, r0]
	mov r0, #0x18
	tst r0, r1
	bne _022405A0
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl GetBattlerAbility
	cmp r0, #0x63
	beq _022405A0
	ldr r1, [r4, #0x6c]
	add r0, r4, #0
	bl GetBattlerAbility
	cmp r0, #0x63
	beq _022405A0
	ldr r0, _022406BC ; =0x00003044
	mov r2, #0xc0
	ldr r0, [r4, r0]
	ldr r5, [r4, #0x6c]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _022406C0 ; =0x000003E3
	ldrb r1, [r1, r0]
	ldr r0, [r4, #0x64]
	add r3, r0, #0
	mul r3, r2
	add r0, r4, r3
	ldr r3, _022406C4 ; =0x00002D74
	mul r2, r5
	add r2, r4, r2
	ldrb r0, [r0, r3]
	ldrb r2, [r2, r3]
	sub r0, r0, r2
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r6, #0
	bl BattleSys_Random
	mov r1, #0x64
	bl _s32_div_f
	cmp r1, r5
	bge _0224059C
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	ldr r1, _022406C4 ; =0x00002D74
	add r2, r4, r2
	ldrb r3, [r2, r1]
	ldr r2, [r4, #0x6c]
	mul r0, r2
	add r0, r4, r0
	ldrb r0, [r0, r1]
	cmp r3, r0
	blo _0224059C
	mov r3, #1
	b _0224065A
_0224059C:
	mov r3, #0
	b _0224065A
_022405A0:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r3, r4, r0
	ldr r0, _022406C8 ; =0x00002DCC
	ldr r1, [r4, #0x64]
	ldr r2, [r3, r0]
	lsl r2, r2, #0x1e
	lsr r2, r2, #0x1e
	cmp r1, r2
	bne _022405C0
	sub r0, #0xc
	ldr r2, [r3, r0]
	mov r0, #0x18
	tst r0, r2
	bne _022405D6
_022405C0:
	add r0, r4, #0
	bl GetBattlerAbility
	cmp r0, #0x63
	beq _022405D6
	ldr r1, [r4, #0x6c]
	add r0, r4, #0
	bl GetBattlerAbility
	cmp r0, #0x63
	bne _022405F4
_022405D6:
	ldr r0, [r4, #0x64]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	ldr r3, [r4, #0x6c]
	add r0, r4, r2
	ldr r2, _022406C4 ; =0x00002D74
	mul r1, r3
	add r1, r4, r1
	ldrb r0, [r0, r2]
	ldrb r1, [r1, r2]
	cmp r0, r1
	blo _022405F4
	mov r3, #1
	b _0224064E
_022405F4:
	ldr r0, _022406BC ; =0x00003044
	mov r2, #0xc0
	ldr r0, [r4, r0]
	ldr r5, [r4, #0x6c]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _022406C0 ; =0x000003E3
	ldrb r1, [r1, r0]
	ldr r0, [r4, #0x64]
	add r3, r0, #0
	mul r3, r2
	add r0, r4, r3
	ldr r3, _022406C4 ; =0x00002D74
	mul r2, r5
	add r2, r4, r2
	ldrb r0, [r0, r3]
	ldrb r2, [r2, r3]
	sub r0, r0, r2
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r6, #0
	bl BattleSys_Random
	mov r1, #0x64
	bl _s32_div_f
	cmp r1, r5
	bge _0224064C
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	ldr r1, _022406C4 ; =0x00002D74
	add r2, r4, r2
	ldrb r3, [r2, r1]
	ldr r2, [r4, #0x6c]
	mul r0, r2
	add r0, r4, r0
	ldrb r0, [r0, r1]
	cmp r3, r0
	blo _0224064C
	mov r3, #1
	b _0224064E
_0224064C:
	mov r3, #0
_0224064E:
	ldr r1, _022406B8 ; =0x0000216C
	mov r0, #1
	ldr r2, [r4, r1]
	lsl r0, r0, #0xa
	orr r0, r2
	str r0, [r4, r1]
_0224065A:
	cmp r3, #0
	beq _02240680
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _022406CC ; =0x00002D8C
	ldr r0, [r1, r0]
	ldr r1, _022406D0 ; =0x00002144
	neg r0, r0
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x28
	ldr r2, [r4, r0]
	mov r0, #0x20
	orr r0, r2
	add r1, #0x28
	str r0, [r4, r1]
	b _022406B0
_02240680:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	ldr r1, _022406C4 ; =0x00002D74
	add r2, r4, r2
	ldrb r3, [r2, r1]
	ldr r2, [r4, #0x6c]
	mul r0, r2
	add r0, r4, r0
	ldrb r0, [r0, r1]
	cmp r3, r0
	ldr r1, _022406B8 ; =0x0000216C
	blo _022406A6
	ldr r2, [r4, r1]
	mov r0, #1
	orr r0, r2
	str r0, [r4, r1]
	b _022406B0
_022406A6:
	mov r0, #1
	ldr r2, [r4, r1]
	lsl r0, r0, #0xc
	orr r0, r2
	str r0, [r4, r1]
_022406B0:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022406B4: .word 0x0000213C
_022406B8: .word 0x0000216C
_022406BC: .word 0x00003044
_022406C0: .word 0x000003E3
_022406C4: .word 0x00002D74
_022406C8: .word 0x00002DCC
_022406CC: .word 0x00002D8C
_022406D0: .word 0x00002144
	thumb_func_end BtlCmd_TryOHKO

	thumb_func_start BtlCmd_SetDamageDivide
BtlCmd_SetDamageDivide: ; 0x022406D4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl BattleScriptGetVarPointer
	add r4, r0, #0
	ldr r0, [r4]
	add r1, r7, #0
	bl ov12_02253178
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BtlCmd_SetDamageDivide

	thumb_func_start BtlCmd_SetDamageDivideVar
BtlCmd_SetDamageDivideVar: ; 0x0224070C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r4, r0, #0
	add r0, r5, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl BattleScriptGetVarPointer
	add r4, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl BattleScriptGetVarPointer
	add r1, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bge _0224074E
	mov r5, #0
	mvn r5, r5
	b _02240750
_0224074E:
	mov r5, #1
_02240750:
	ldr r0, [r4]
	ldr r1, [r1]
	bl _s32_div_f
	str r0, [r4]
	cmp r0, #0
	bne _02240760
	str r5, [r4]
_02240760:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BtlCmd_SetDamageDivideVar

	thumb_func_start BtlCmd_TryMimic
BtlCmd_TryMimic: ; 0x02240764
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r0, r6, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r6, #0
	bl BattleScriptReadWord
	str r0, [sp]
	ldr r0, [r6, #0x6c]
	lsl r0, r0, #1
	add r1, r6, r0
	ldr r0, _02240888 ; =0x0000307C
	ldrh r0, [r1, r0]
	bl ov12_02257D6C
	cmp r0, #0
	beq _022407BE
	ldr r0, [r6, #0x64]
	mov r2, #2
	mov r3, #0xc0
	add r1, r0, #0
	mul r1, r3
	add r0, r6, r1
	ldr r1, _0224088C ; =0x00002DB0
	mov ip, r0
	ldr r0, [r0, r1]
	lsl r2, r2, #0x14
	tst r0, r2
	bne _022407BE
	ldr r0, [r6, #0x6c]
	add r4, r0, #0
	mul r4, r3
	add r4, r6, r4
	ldr r4, [r4, r1]
	lsl r1, r2, #3
	tst r1, r4
	bne _022407BE
	lsl r0, r0, #1
	add r1, r6, r0
	ldr r0, _02240888 ; =0x0000307C
	ldrh r7, [r1, r0]
	cmp r7, #0
	bne _022407C8
_022407BE:
	ldr r1, [sp]
	add r0, r6, #0
	bl BattleScriptIncrementPointer
	b _02240884
_022407C8:
	mov r2, #0
	sub r3, #0xc1
	mov r4, ip
	add r5, r2, #0
_022407D0:
	ldr r0, _02240890 ; =0x00002D4C
	ldrh r0, [r4, r0]
	cmp r7, r0
	beq _022407F8
	mov r0, ip
	add r1, r0, r5
	ldr r0, _02240890 ; =0x00002D4C
	ldrh r0, [r1, r0]
	cmp r0, #0x66
	bne _022407EE
	mov r0, #0
	mvn r0, r0
	cmp r3, r0
	bne _022407EE
	add r3, r2, #0
_022407EE:
	add r2, r2, #1
	add r4, r4, #2
	add r5, r5, #2
	cmp r2, #4
	blt _022407D0
_022407F8:
	cmp r2, #4
	bne _0224087C
	mov r4, #0x49
	lsl r4, r4, #2
	str r7, [r6, r4]
	ldr r2, [r6, #0x64]
	mov r1, #0xc0
	add r5, r2, #0
	mul r5, r1
	add r5, r6, r5
	lsl r2, r3, #1
	add r5, r5, r2
	ldr r0, [r6, r4]
	ldr r2, _02240890 ; =0x00002D4C
	strh r0, [r5, r2]
	ldr r0, [r6, r4]
	lsl r0, r0, #4
	add r4, r6, r0
	mov r0, #0xf9
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r0, #5
	bhs _02240828
	b _0224082A
_02240828:
	mov r0, #5
_0224082A:
	ldr r4, [r6, #0x64]
	add r2, #0x20
	mul r1, r4
	add r1, r6, r1
	add r1, r1, r3
	strb r0, [r1, r2]
	add r0, r3, #0
	bl MaskOfFlagNo
	ldr r1, _02240894 ; =0x00002DCC
	mov r4, #0xc0
	add r3, r6, r1
	ldr r1, [r6, #0x64]
	mov r5, #0x3c
	add r2, r1, #0
	mul r2, r4
	ldr r7, [r3, r2]
	add r1, r7, #0
	bic r1, r5
	lsl r5, r7, #0x1a
	lsr r5, r5, #0x1c
	orr r0, r5
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1a
	orr r0, r1
	str r0, [r3, r2]
	add r0, r4, #0
	add r0, #0x64
	ldr r1, [r6, r0]
	add r0, r4, #0
	add r0, #0xc3
	cmp r1, r0
	bne _02240884
	ldr r0, [r6, #0x64]
	add r2, r0, #0
	mul r2, r4
	ldr r1, [r3, r2]
	ldr r0, _02240898 ; =0xFFFFE3FF
	and r0, r1
	str r0, [r3, r2]
	b _02240884
_0224087C:
	ldr r1, [sp]
	add r0, r6, #0
	bl BattleScriptIncrementPointer
_02240884:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02240888: .word 0x0000307C
_0224088C: .word 0x00002DB0
_02240890: .word 0x00002D4C
_02240894: .word 0x00002DCC
_02240898: .word 0xFFFFE3FF
	thumb_func_end BtlCmd_TryMimic

	thumb_func_start BtlCmd_Metronome
BtlCmd_Metronome: ; 0x0224089C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r0, #0
	add r0, r6, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r4, _022408F4 ; =0x00002D4C
_022408AC:
	add r0, r7, #0
	bl BattleSys_Random
	ldr r1, _022408F8 ; =0x000001D3
	bl _s32_div_f
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	ldr r3, [r6, #0x64]
	mov r0, #0xc0
	mul r0, r3
	mov r1, #0
	add r2, r6, r0
_022408C8:
	ldrh r0, [r2, r4]
	cmp r5, r0
	beq _022408D6
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, #4
	blt _022408C8
_022408D6:
	cmp r1, #4
	bne _022408AC
	add r2, r3, #0
	add r0, r7, #0
	add r1, r6, #0
	add r3, r5, #0
	bl ov12_02257DA4
	cmp r0, #0
	beq _022408AC
	mov r0, #0x49
	lsl r0, r0, #2
	str r5, [r6, r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022408F4: .word 0x00002D4C
_022408F8: .word 0x000001D3
	thumb_func_end BtlCmd_Metronome

	thumb_func_start BtlCmd_TryDisable
BtlCmd_TryDisable: ; 0x022408FC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	mov r0, #0xb5
	lsl r0, r0, #6
	add r2, r4, r0
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	lsl r1, r1, #1
	add r0, r2, r0
	add r2, r4, r1
	ldr r1, _022409B0 ; =0x0000307C
	ldrh r1, [r2, r1]
	bl ov12_02251C60
	add r3, r0, #0
	ldr r2, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r2
	ldr r7, _022409B4 ; =0x00002DE8
	add r1, r4, r0
	ldrh r0, [r1, r7]
	cmp r0, #0
	bne _022409A2
	cmp r3, #4
	beq _022409A2
	add r0, r7, #0
	add r1, r1, r3
	sub r0, #0x7c
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _022409A2
	lsl r0, r2, #1
	add r1, r4, r0
	ldr r0, _022409B0 ; =0x0000307C
	ldrh r1, [r1, r0]
	cmp r1, #0
	beq _022409A2
	mov r0, #0xc0
	add r0, #0x64
	str r1, [r4, r0]
	mov r0, #0xc0
	add r0, #0x64
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	mul r1, r2
	ldr r0, [r4, r0]
	add r1, r4, r1
	strh r0, [r1, r7]
	add r0, r5, #0
	bl BattleSys_Random
	add r1, r7, #0
	sub r1, #0x20
	add r3, r4, r1
	ldr r4, [r4, #0x6c]
	mov r1, #0xc0
	add r2, r4, #0
	mul r2, r1
	ldr r1, [r3, r2]
	mov r4, #7
	bic r1, r4
	lsr r5, r0, #0x1f
	lsl r4, r0, #0x1e
	sub r4, r4, r5
	mov r0, #0x1e
	ror r4, r0
	add r0, r5, r4
	add r4, r0, #3
	mov r0, #7
	and r0, r4
	orr r0, r1
	str r0, [r3, r2]
	b _022409AA
_022409A2:
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_022409AA:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022409B0: .word 0x0000307C
_022409B4: .word 0x00002DE8
	thumb_func_end BtlCmd_TryDisable

	thumb_func_start BtlCmd_Counter
BtlCmd_Counter: ; 0x022409B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r1, [r5, #0x64]
	lsl r0, r1, #6
	add r2, r5, r0
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r4, [r2, r0]
	ldr r0, [sp]
	bl ov12_0223AB1C
	str r0, [sp, #4]
	ldr r0, [sp]
	add r1, r4, #0
	bl ov12_0223AB1C
	ldr r6, [r5, #0x64]
	add r3, r0, #0
	lsl r0, r6, #6
	add r1, r5, r0
	lsl r0, r4, #2
	add r0, r1, r0
	mov r1, #0x76
	lsl r1, r1, #2
	ldr r7, [r0, r1]
	cmp r7, #0
	beq _02240A7E
	ldr r0, [sp, #4]
	cmp r0, r3
	beq _02240A7E
	mov r0, #0xc0
	mul r0, r4
	add r2, r5, r0
	ldr r0, _02240AA8 ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _02240A7E
	ldr r0, _02240AAC ; =0x00002144
	lsl r2, r7, #1
	sub r1, #0x14
	str r2, [r5, r0]
	add r1, r5, r1
	lsl r0, r3, #3
	ldr r0, [r1, r0]
	lsl r1, r0, #0xb
	lsr r1, r1, #0x1f
	beq _02240A38
	lsl r0, r0, #9
	lsr r0, r0, #0x1e
	mov r1, #0xc0
	mul r1, r0
	add r2, r5, r1
	ldr r1, _02240AA8 ; =0x00002D8C
	ldr r1, [r2, r1]
	cmp r1, #0
	beq _02240A38
	str r0, [r5, #0x6c]
	b _02240A3A
_02240A38:
	str r4, [r5, #0x6c]
_02240A3A:
	ldr r1, [r5, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02240AA8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _02240A72
	ldr r0, [sp]
	ldr r2, [r5, #0x64]
	add r1, r5, #0
	bl ov12_02253DA0
	mov r1, #0xc0
	mul r1, r0
	str r0, [r5, #0x6c]
	ldr r0, _02240AA8 ; =0x00002D8C
	add r1, r5, r1
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _02240A72
	mov r2, #0x27
	str r2, [r5, #0xc]
	add r0, r5, #0
	mov r1, #1
	add r2, #0xf2
	bl ov12_02245518
_02240A72:
	ldr r1, [r5, #0x64]
	ldr r2, [r5, #0x6c]
	add r0, r5, #0
	bl ov12_02258180
	b _02240AA0
_02240A7E:
	mov r0, #0xb5
	lsl r0, r0, #2
	mov r1, #0x1c
	add r3, r6, #0
	mul r3, r1
	add r0, r5, r0
	ldr r2, [r0, r3]
	mov r1, #1
	bic r2, r1
	mov r1, #1
	orr r1, r2
	str r1, [r0, r3]
	ldr r1, _02240AB0 ; =0x0000216C
	mov r0, #0x40
	ldr r2, [r5, r1]
	orr r0, r2
	str r0, [r5, r1]
_02240AA0:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02240AA8: .word 0x00002D8C
_02240AAC: .word 0x00002144
_02240AB0: .word 0x0000216C
	thumb_func_end BtlCmd_Counter

	thumb_func_start BtlCmd_MirrorCoat
BtlCmd_MirrorCoat: ; 0x02240AB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r1, [r5, #0x64]
	lsl r0, r1, #6
	add r2, r5, r0
	mov r0, #2
	lsl r0, r0, #8
	ldr r4, [r2, r0]
	ldr r0, [sp]
	bl ov12_0223AB1C
	str r0, [sp, #4]
	ldr r0, [sp]
	add r1, r4, #0
	bl ov12_0223AB1C
	ldr r6, [r5, #0x64]
	add r3, r0, #0
	lsl r0, r6, #6
	add r1, r5, r0
	lsl r0, r4, #2
	add r0, r1, r0
	mov r1, #0x1f
	lsl r1, r1, #4
	ldr r7, [r0, r1]
	cmp r7, #0
	beq _02240B7A
	ldr r0, [sp, #4]
	cmp r0, r3
	beq _02240B7A
	mov r0, #0xc0
	mul r0, r4
	add r2, r5, r0
	ldr r0, _02240BA4 ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _02240B7A
	ldr r0, _02240BA8 ; =0x00002144
	lsl r2, r7, #1
	sub r1, #0x2c
	str r2, [r5, r0]
	add r1, r5, r1
	lsl r0, r3, #3
	ldr r0, [r1, r0]
	lsl r1, r0, #0xb
	lsr r1, r1, #0x1f
	beq _02240B34
	lsl r0, r0, #9
	lsr r0, r0, #0x1e
	mov r1, #0xc0
	mul r1, r0
	add r2, r5, r1
	ldr r1, _02240BA4 ; =0x00002D8C
	ldr r1, [r2, r1]
	cmp r1, #0
	beq _02240B34
	str r0, [r5, #0x6c]
	b _02240B36
_02240B34:
	str r4, [r5, #0x6c]
_02240B36:
	ldr r1, [r5, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02240BA4 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _02240B6E
	ldr r0, [sp]
	ldr r2, [r5, #0x64]
	add r1, r5, #0
	bl ov12_02253DA0
	mov r1, #0xc0
	mul r1, r0
	str r0, [r5, #0x6c]
	ldr r0, _02240BA4 ; =0x00002D8C
	add r1, r5, r1
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _02240B6E
	mov r2, #0x27
	str r2, [r5, #0xc]
	add r0, r5, #0
	mov r1, #1
	add r2, #0xf2
	bl ov12_02245518
_02240B6E:
	ldr r1, [r5, #0x64]
	ldr r2, [r5, #0x6c]
	add r0, r5, #0
	bl ov12_02258180
	b _02240B9C
_02240B7A:
	mov r0, #0xb5
	lsl r0, r0, #2
	mov r1, #0x1c
	add r3, r6, #0
	mul r3, r1
	add r0, r5, r0
	ldr r2, [r0, r3]
	mov r1, #1
	bic r2, r1
	mov r1, #1
	orr r1, r2
	str r1, [r0, r3]
	ldr r1, _02240BAC ; =0x0000216C
	mov r0, #0x40
	ldr r2, [r5, r1]
	orr r0, r2
	str r0, [r5, r1]
_02240B9C:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02240BA4: .word 0x00002D8C
_02240BA8: .word 0x00002144
_02240BAC: .word 0x0000216C
	thumb_func_end BtlCmd_MirrorCoat

	thumb_func_start BtlCmd_TryEncore
BtlCmd_TryEncore: ; 0x02240BB0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	mov r0, #0xb5
	lsl r0, r0, #6
	add r2, r5, r0
	ldr r1, [r5, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	lsl r1, r1, #1
	add r0, r2, r0
	add r2, r5, r1
	ldr r1, _02240C88 ; =0x0000307C
	ldrh r1, [r2, r1]
	bl ov12_02251C60
	ldr r1, [r5, #0x6c]
	add r4, r0, #0
	lsl r1, r1, #1
	add r2, r5, r1
	ldr r1, _02240C88 ; =0x0000307C
	add r0, r5, #0
	ldrh r1, [r2, r1]
	bl ov12_02257DFC
	cmp r0, #0
	bne _02240BF8
	mov r4, #4
_02240BF8:
	ldr r0, [r5, #0x6c]
	mov r2, #0xc0
	add r1, r0, #0
	mul r1, r2
	ldr r3, _02240C8C ; =0x00002DEC
	add r6, r5, r1
	ldrh r1, [r6, r3]
	cmp r1, #0
	bne _02240C72
	cmp r4, #4
	beq _02240C72
	add r1, r3, #0
	add r6, r6, r4
	sub r1, #0x80
	ldrb r1, [r6, r1]
	cmp r1, #0
	beq _02240C72
	lsl r0, r0, #1
	add r1, r5, r0
	ldr r0, _02240C88 ; =0x0000307C
	ldrh r1, [r1, r0]
	cmp r1, #0
	beq _02240C72
	add r0, r2, #0
	add r0, #0x64
	str r1, [r5, r0]
	ldr r1, [r5, #0x6c]
	add r0, r2, #0
	add r0, #0x64
	add r6, r1, #0
	mul r6, r2
	ldr r0, [r5, r0]
	add r1, r5, r6
	strh r0, [r1, r3]
	ldr r0, [r5, #0x6c]
	add r1, r0, #0
	mul r1, r2
	add r1, r5, r1
	add r0, r3, #2
	strh r4, [r1, r0]
	ldr r0, [sp]
	bl BattleSys_Random
	ldr r1, _02240C90 ; =0x00002DC8
	ldr r2, [r5, #0x6c]
	add r4, r5, r1
	mov r1, #0xc0
	add r5, r2, #0
	mul r5, r1
	mov r1, #5
	bl _s32_div_f
	ldr r2, [r4, r5]
	mov r0, #0x38
	bic r2, r0
	add r0, r1, #3
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1a
	orr r0, r2
	str r0, [r4, r5]
	b _02240C84
_02240C72:
	ldr r1, _02240C94 ; =0x0000216C
	mov r0, #0x40
	ldr r2, [r5, r1]
	orr r0, r2
	str r0, [r5, r1]
	add r0, r5, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
_02240C84:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02240C88: .word 0x0000307C
_02240C8C: .word 0x00002DEC
_02240C90: .word 0x00002DC8
_02240C94: .word 0x0000216C
	thumb_func_end BtlCmd_TryEncore

	thumb_func_start BtlCmd_TryConversion2
BtlCmd_TryConversion2: ; 0x02240C98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	str r0, [sp, #8]
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl GetBattlerAbility
	cmp r0, #0x79
	bne _02240CCA
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02240CCA:
	ldr r0, [r5, #0x64]
	lsl r0, r0, #1
	add r2, r5, r0
	ldr r0, _02240E40 ; =0x000030C4
	ldrh r1, [r2, r0]
	cmp r1, #0
	beq _02240CE0
	add r0, #8
	ldrh r0, [r2, r0]
	cmp r0, #0xff
	bne _02240CE2
_02240CE0:
	b _02240E30
_02240CE2:
	add r0, r5, #0
	bl ov12_022525AC
	cmp r0, #0
	beq _02240D16
	ldr r0, [r5, #0x64]
	lsl r0, r0, #1
	add r1, r5, r0
	ldr r0, _02240E44 ; =0x000030CC
	ldrh r1, [r1, r0]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02240E48 ; =0x00002DB0
	ldr r1, [r1, r0]
	mov r0, #1
	lsl r0, r0, #0xc
	tst r0, r1
	beq _02240D16
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02240D16:
	ldr r0, [r5, #0x64]
	mov r6, #0
	lsl r0, r0, #1
	add r1, r5, r0
	ldr r0, _02240E4C ; =0x000030D4
	ldrh r7, [r1, r0]
_02240D22:
	add r0, sp, #0xc
	str r0, [sp]
	add r2, sp, #0xc
	add r3, sp, #0xc
	ldr r0, [sp, #4]
	ldr r1, _02240E50 ; =0x0000FFFF
	add r2, #2
	add r3, #1
	bl ov12_0225260C
	add r0, sp, #0xc
	ldrb r0, [r0, #2]
	cmp r0, r7
	bne _02240D94
	add r0, sp, #0xc
	ldrb r0, [r0]
	cmp r0, #5
	bhi _02240D94
	add r0, sp, #0xc
	ldrb r4, [r0, #1]
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	mov r2, #0x1b
	mov r3, #0
	bl GetBattlerVar
	cmp r4, r0
	beq _02240D94
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	mov r2, #0x1c
	mov r3, #0
	bl GetBattlerVar
	cmp r4, r0
	beq _02240D94
	ldr r0, [r5, #0x64]
	add r3, sp, #0xc
	mov r2, #0xc0
	add r1, r0, #0
	mul r1, r2
	add r0, r5, r1
	ldr r1, _02240E54 ; =0x00002D64
	add sp, #0x10
	strb r4, [r0, r1]
	ldr r4, [r5, #0x64]
	ldrb r0, [r3, #1]
	add r6, r4, #0
	mul r6, r2
	add r4, r5, r6
	add r1, r1, #1
	strb r0, [r4, r1]
	ldrb r0, [r3, #1]
	add r2, #0x70
	str r0, [r5, r2]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02240D94:
	mov r0, #0xfa
	add r6, r6, #1
	lsl r0, r0, #2
	cmp r6, r0
	blt _02240D22
	add r0, sp, #0xc
	mov r6, #0
	str r0, [sp]
	add r2, sp, #0xc
	add r3, sp, #0xc
	ldr r0, [sp, #4]
	add r1, r6, #0
	add r2, #2
	add r3, #1
	bl ov12_0225260C
	cmp r0, #1
	bne _02240E30
_02240DB8:
	add r0, sp, #0xc
	ldrb r0, [r0, #2]
	cmp r0, r7
	bne _02240E16
	add r0, sp, #0xc
	ldrb r0, [r0]
	cmp r0, #5
	bhi _02240E16
	add r0, sp, #0xc
	ldrb r4, [r0, #1]
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	mov r2, #0x1b
	mov r3, #0
	bl GetBattlerVar
	cmp r4, r0
	beq _02240E16
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	mov r2, #0x1c
	mov r3, #0
	bl GetBattlerVar
	cmp r4, r0
	beq _02240E16
	ldr r0, [r5, #0x64]
	add r3, sp, #0xc
	mov r2, #0xc0
	add r1, r0, #0
	mul r1, r2
	add r0, r5, r1
	ldr r1, _02240E54 ; =0x00002D64
	add sp, #0x10
	strb r4, [r0, r1]
	ldr r4, [r5, #0x64]
	ldrb r0, [r3, #1]
	add r6, r4, #0
	mul r6, r2
	add r4, r5, r6
	add r1, r1, #1
	strb r0, [r4, r1]
	ldrb r0, [r3, #1]
	add r2, #0x70
	str r0, [r5, r2]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02240E16:
	add r0, sp, #0xc
	add r6, r6, #1
	str r0, [sp]
	add r2, sp, #0xc
	add r3, sp, #0xc
	ldr r0, [sp, #4]
	add r1, r6, #0
	add r2, #2
	add r3, #1
	bl ov12_0225260C
	cmp r0, #1
	beq _02240DB8
_02240E30:
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02240E40: .word 0x000030C4
_02240E44: .word 0x000030CC
_02240E48: .word 0x00002DB0
_02240E4C: .word 0x000030D4
_02240E50: .word 0x0000FFFF
_02240E54: .word 0x00002D64
	thumb_func_end BtlCmd_TryConversion2

	thumb_func_start BtlCmd_TrySketch
BtlCmd_TrySketch: ; 0x02240E58
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	mov r0, #0
	add r6, r1, #0
	mvn r0, r0
	str r0, [sp, #8]
	add r0, r6, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r6, #0
	bl BattleScriptReadWord
	mov ip, r0
	ldr r1, [r6, #0x64]
	mov r0, #0xc0
	mul r0, r1
	str r0, [sp, #4]
	add r3, r6, r0
	ldr r0, _02240F68 ; =0x00002DB0
	ldr r1, [r3, r0]
	mov r0, #2
	lsl r0, r0, #0x14
	tst r0, r1
	bne _02240EAA
	ldr r0, [r6, #0x6c]
	lsl r0, r0, #1
	add r1, r6, r0
	ldr r0, _02240F6C ; =0x000030AC
	ldrh r7, [r1, r0]
	cmp r7, #0xa5
	beq _02240EAA
	cmp r7, #0xa6
	beq _02240EAA
	mov r0, #7
	lsl r0, r0, #6
	cmp r7, r0
	beq _02240EAA
	cmp r7, #0
	bne _02240EB4
_02240EAA:
	add r0, r6, #0
	mov r1, ip
	bl BattleScriptIncrementPointer
	b _02240F62
_02240EB4:
	mov r0, #0
	add r1, r3, #0
	add r2, r0, #0
_02240EBA:
	ldr r4, _02240F70 ; =0x00002D4C
	ldrh r4, [r1, r4]
	cmp r4, #0xa6
	beq _02240ECC
	ldr r4, _02240F70 ; =0x00002D4C
	add r5, r3, r2
	ldrh r4, [r5, r4]
	cmp r7, r4
	beq _02240EEC
_02240ECC:
	ldr r4, _02240F70 ; =0x00002D4C
	add r5, r3, r2
	ldrh r4, [r5, r4]
	cmp r4, #0xa6
	bne _02240EE2
	mov r5, #0
	ldr r4, [sp, #8]
	mvn r5, r5
	cmp r4, r5
	bne _02240EE2
	str r0, [sp, #8]
_02240EE2:
	add r0, r0, #1
	add r1, r1, #2
	add r2, r2, #2
	cmp r0, #4
	blt _02240EBA
_02240EEC:
	cmp r0, #4
	bne _02240F5A
	ldr r0, [sp, #4]
	add r1, r6, r0
	ldr r0, [sp, #8]
	lsl r0, r0, #1
	add r1, r1, r0
	ldr r0, _02240F70 ; =0x00002D4C
	strh r7, [r1, r0]
	ldr r1, [r6, #0x6c]
	ldr r3, [r6, #0x64]
	lsl r1, r1, #1
	add r2, r6, r1
	ldr r1, _02240F6C ; =0x000030AC
	add r0, #0x20
	ldrh r1, [r2, r1]
	lsl r1, r1, #4
	add r2, r6, r1
	mov r1, #0xf9
	lsl r1, r1, #2
	ldrb r1, [r2, r1]
	mov r2, #0xc0
	mul r2, r3
	add r3, r6, r2
	ldr r2, [sp, #8]
	add r2, r3, r2
	strb r1, [r2, r0]
	ldr r0, [sp]
	ldr r2, [r6, #0x64]
	add r1, r6, #0
	bl ov12_02263B4C
	ldr r0, [r6, #0x6c]
	lsl r0, r0, #1
	add r1, r6, r0
	ldr r0, _02240F6C ; =0x000030AC
	ldrh r1, [r1, r0]
	mov r0, #0x49
	lsl r0, r0, #2
	str r1, [r6, r0]
	ldr r1, [r6, r0]
	add r0, #0x5f
	cmp r1, r0
	bne _02240F62
	ldr r0, _02240F74 ; =0x00002DCC
	ldr r1, [r6, #0x64]
	add r3, r6, r0
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	ldr r1, [r3, r2]
	ldr r0, _02240F78 ; =0xFFFFE3FF
	and r0, r1
	str r0, [r3, r2]
	b _02240F62
_02240F5A:
	add r0, r6, #0
	mov r1, ip
	bl BattleScriptIncrementPointer
_02240F62:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02240F68: .word 0x00002DB0
_02240F6C: .word 0x000030AC
_02240F70: .word 0x00002D4C
_02240F74: .word 0x00002DCC
_02240F78: .word 0xFFFFE3FF
	thumb_func_end BtlCmd_TrySketch

	thumb_func_start BtlCmd_TrySleepTalk
BtlCmd_TrySleepTalk: ; 0x02240F7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	mov r7, #0
	str r0, [sp, #8]
	add r6, r7, #0
	add r4, r7, #0
_02240F9A:
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r0, r5, r0
	add r1, r4, r0
	ldr r0, _02241044 ; =0x00002D4C
	ldrh r0, [r1, r0]
	bl ov12_02252698
	cmp r0, #0
	bne _02240FDA
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r0, r5, r0
	add r1, r4, r0
	ldr r0, _02241044 ; =0x00002D4C
	ldrh r1, [r1, r0]
	mov r0, #0x42
	lsl r0, r0, #2
	cmp r1, r0
	beq _02240FDA
	cmp r1, #0xfd
	beq _02240FDA
	add r0, #0xb8
	cmp r1, r0
	beq _02240FDA
	add r0, r5, #0
	bl ov12_022525AC
	cmp r0, #0
	beq _02240FE2
_02240FDA:
	add r0, r6, #0
	bl MaskOfFlagNo
	orr r7, r0
_02240FE2:
	add r6, r6, #1
	add r4, r4, #2
	cmp r6, #4
	blt _02240F9A
	mov r0, #2
	mvn r0, r0
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r2, [r5, #0x64]
	add r1, r5, #0
	add r3, r7, #0
	bl ov12_022517EC
	add r4, r0, #0
	cmp r4, #0xf
	bne _0224100C
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
	b _0224103E
_0224100C:
	mov r7, #0x1e
_0224100E:
	ldr r0, [sp, #4]
	bl BattleSys_Random
	lsr r1, r0, #0x1f
	lsl r0, r0, #0x1e
	sub r0, r0, r1
	ror r0, r7
	add r6, r1, r0
	add r0, r6, #0
	bl MaskOfFlagNo
	tst r0, r4
	bne _0224100E
	ldr r0, [r5, #0x64]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	add r2, r5, r2
	lsl r0, r6, #1
	add r2, r2, r0
	ldr r0, _02241044 ; =0x00002D4C
	add r1, #0x64
	ldrh r0, [r2, r0]
	str r0, [r5, r1]
_0224103E:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02241044: .word 0x00002D4C
	thumb_func_end BtlCmd_TrySleepTalk

	thumb_func_start BtlCmd_FlailDamageCalc
BtlCmd_FlailDamageCalc: ; 0x02241048
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _0224108C ; =0x00002D8C
	add r2, r4, r0
	ldr r0, [r2, r1]
	add r1, r1, #4
	ldr r1, [r2, r1]
	mov r2, #0x40
	bl sub_02088068
	ldr r3, _02241090 ; =ov12_0226C300
	mov r2, #0
_0224106E:
	ldrb r1, [r3]
	cmp r0, r1
	ble _0224107C
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #6
	blo _0224106E
_0224107C:
	ldr r0, _02241094 ; =ov12_0226C301
	lsl r1, r2, #1
	ldrb r1, [r0, r1]
	ldr r0, _02241098 ; =0x00002154
	str r1, [r4, r0]
	mov r0, #0
	pop {r4, pc}
	nop
_0224108C: .word 0x00002D8C
_02241090: .word ov12_0226C300
_02241094: .word ov12_0226C301
_02241098: .word 0x00002154
	thumb_func_end BtlCmd_FlailDamageCalc

	thumb_func_start BtlCmd_TrySpite
BtlCmd_TrySpite: ; 0x0224109C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	ldr r2, [r5, #0x6c]
	add r4, r0, #0
	lsl r0, r2, #1
	add r1, r5, r0
	ldr r0, _02241138 ; =0x0000307C
	ldrh r1, [r1, r0]
	cmp r1, #0
	beq _0224112A
	mov r0, #0xb5
	lsl r0, r0, #6
	mov r3, #0xc0
	add r0, r5, r0
	mul r3, r2
	add r0, r0, r3
	bl ov12_02251C60
	add r2, r0, #0
	cmp r2, #4
	beq _022410E8
	ldr r0, [r5, #0x6c]
	mov r1, #0xc0
	mul r1, r0
	add r1, r5, r1
	add r3, r1, r2
	ldr r1, _0224113C ; =0x00002D6C
	ldrb r3, [r3, r1]
	cmp r3, #0
	bne _022410F2
_022410E8:
	add r0, r5, #0
	add r1, r4, #0
	bl BattleScriptIncrementPointer
	b _02241132
_022410F2:
	mov r1, #4
	cmp r3, #4
	bge _022410FA
	add r1, r3, #0
_022410FA:
	lsl r0, r0, #1
	add r3, r5, r0
	ldr r0, _02241138 ; =0x0000307C
	ldrh r3, [r3, r0]
	mov r0, #0x49
	lsl r0, r0, #2
	str r3, [r5, r0]
	add r0, #0xc
	str r1, [r5, r0]
	ldr r0, _0224113C ; =0x00002D6C
	ldr r4, [r5, #0x6c]
	mov r3, #0xc0
	add r0, r5, r0
	mul r3, r4
	add r3, r0, r3
	ldrb r0, [r3, r2]
	sub r0, r0, r1
	strb r0, [r3, r2]
	ldr r2, [r5, #0x6c]
	add r0, r6, #0
	add r1, r5, #0
	bl ov12_02250C40
	b _02241132
_0224112A:
	add r0, r5, #0
	add r1, r4, #0
	bl BattleScriptIncrementPointer
_02241132:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02241138: .word 0x0000307C
_0224113C: .word 0x00002D6C
	thumb_func_end BtlCmd_TrySpite

	thumb_func_start BtlCmd_HealBell
BtlCmd_HealBell: ; 0x02241140
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	bl ov12_0223A7E0
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	mov r1, #0x4d
	mov r0, #0
	lsl r1, r1, #2
	ldr r2, _02241280 ; =0x00003044
	str r0, [r5, r1]
	ldr r2, [r5, r2]
	cmp r2, #0xd7
	bne _0224120E
	sub r1, #0x10
	str r2, [r5, r1]
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl GetBattlerAbility
	cmp r0, #0x2b
	beq _02241196
	ldr r2, [r5, #0x64]
	mov r0, #0xc0
	add r3, r2, #0
	mul r3, r0
	ldr r2, _02241284 ; =0x00002DAC
	mov r1, #0
	add r3, r5, r3
	str r1, [r3, r2]
	add r1, r2, #4
	ldr r2, [r5, #0x64]
	add r1, r5, r1
	mul r0, r2
	ldr r3, [r1, r0]
	ldr r2, _02241288 ; =0xF7FFFFFF
	and r2, r3
	str r2, [r1, r0]
	b _022411A2
_02241196:
	mov r1, #0x4d
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	mov r0, #5
	orr r0, r2
	str r0, [r5, r1]
_022411A2:
	mov r0, #2
	tst r0, r4
	beq _02241200
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #0x10
	bl GetBattlerIDBySide
	add r4, r0, #0
	bl MaskOfFlagNo
	ldr r1, _0224128C ; =0x00003108
	ldrb r1, [r5, r1]
	tst r0, r1
	bne _0224126E
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0x2b
	bl CheckBattlerAbilityIfNotIgnored
	cmp r0, #0
	bne _022411EA
	mov r0, #0xc0
	mul r0, r4
	ldr r1, _02241284 ; =0x00002DAC
	mov r3, #0
	add r2, r5, r0
	str r3, [r2, r1]
	add r1, r1, #4
	add r3, r5, r1
	ldr r2, [r3, r0]
	ldr r1, _02241288 ; =0xF7FFFFFF
	and r1, r2
	str r1, [r3, r0]
	b _0224126E
_022411EA:
	mov r1, #0x46
	lsl r1, r1, #2
	add r0, r1, #0
	str r4, [r5, r1]
	add r0, #0x1c
	ldr r2, [r5, r0]
	mov r0, #0xa
	orr r0, r2
	add r1, #0x1c
	str r0, [r5, r1]
	b _0224126E
_02241200:
	mov r1, #0x4d
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	mov r0, #8
	orr r0, r2
	str r0, [r5, r1]
	b _0224126E
_0224120E:
	ldr r3, [r5, #0x64]
	mov r2, #0xc0
	mul r2, r3
	add r3, r5, r2
	ldr r2, _02241284 ; =0x00002DAC
	str r0, [r3, r2]
	add r0, r2, #4
	add r6, r5, r0
	ldr r0, [r5, #0x64]
	mov r2, #0xc0
	add r3, r0, #0
	mul r3, r2
	ldr r2, [r6, r3]
	ldr r0, _02241288 ; =0xF7FFFFFF
	and r0, r2
	str r0, [r6, r3]
	mov r0, #2
	tst r0, r4
	beq _02241266
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #0x10
	bl GetBattlerIDBySide
	add r4, r0, #0
	bl MaskOfFlagNo
	ldr r1, _0224128C ; =0x00003108
	ldrb r1, [r5, r1]
	tst r0, r1
	bne _0224126E
	mov r0, #0xc0
	mul r0, r4
	ldr r1, _02241284 ; =0x00002DAC
	mov r3, #0
	add r2, r5, r0
	str r3, [r2, r1]
	add r1, r1, #4
	add r3, r5, r1
	ldr r2, [r3, r0]
	ldr r1, _02241288 ; =0xF7FFFFFF
	and r1, r2
	str r1, [r3, r0]
	b _0224126E
_02241266:
	ldr r2, [r5, r1]
	mov r0, #8
	orr r0, r2
	str r0, [r5, r1]
_0224126E:
	ldr r3, _02241280 ; =0x00003044
	ldr r2, [r5, #0x64]
	ldr r3, [r5, r3]
	add r0, r7, #0
	add r1, r5, #0
	bl ov12_02263CE8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02241280: .word 0x00003044
_02241284: .word 0x00002DAC
_02241288: .word 0xF7FFFFFF
_0224128C: .word 0x00003108
	thumb_func_end BtlCmd_HealBell

	thumb_func_start BtlCmd_TryThief
BtlCmd_TryThief: ; 0x02241290
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r4, r0, #0
	add r0, r5, #0
	bl BattleScriptReadWord
	str r0, [sp]
	add r0, r6, #0
	bl ov12_0223A7E0
	str r0, [sp, #4]
	ldr r1, [r5, #0x64]
	add r0, r6, #0
	bl ov12_0223AB1C
	add r7, r0, #0
	ldr r1, [r5, #0x64]
	add r0, r6, #0
	bl ov12_0223AB1C
	cmp r0, #0
	beq _022412E0
	ldr r0, [sp, #4]
	mov r1, #0x84
	tst r0, r1
	bne _022412E0
	add r0, r5, #0
	add r1, r4, #0
	bl BattleScriptIncrementPointer
	b _022413A4
_022412E0:
	ldr r0, [r5, #0x64]
	add r1, r5, r0
	ldr r0, _022413AC ; =0x0000219C
	ldrb r0, [r1, r0]
	bl MaskOfFlagNo
	lsl r1, r7, #3
	add r2, r5, r1
	mov r1, #0x71
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	lsl r1, r1, #3
	lsr r1, r1, #0x1a
	tst r0, r1
	beq _02241308
	add r0, r5, #0
	add r1, r4, #0
	bl BattleScriptIncrementPointer
	b _022413A4
_02241308:
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl GetBattlerAbility
	cmp r0, #0x79
	beq _02241320
	ldr r1, [r5, #0x6c]
	add r0, r5, #0
	bl GetBattlerAbility
	cmp r0, #0x79
	bne _0224132A
_02241320:
	add r0, r5, #0
	add r1, r4, #0
	bl BattleScriptIncrementPointer
	b _022413A4
_0224132A:
	ldr r2, [r5, #0x6c]
	mov r0, #0xc0
	add r1, r2, #0
	mul r1, r0
	ldr r3, _022413B0 ; =0x00002DB8
	add r0, r5, r1
	ldrh r0, [r0, r3]
	cmp r0, #0x70
	bne _02241346
	add r0, r5, #0
	add r1, r4, #0
	bl BattleScriptIncrementPointer
	b _022413A4
_02241346:
	add r3, #0x14
	add r3, r5, r3
	ldr r1, [r3, r1]
	lsl r3, r1, #3
	lsr r3, r3, #0x1f
	bne _02241358
	lsl r1, r1, #2
	lsr r1, r1, #0x1f
	beq _02241362
_02241358:
	add r0, r5, #0
	add r1, r4, #0
	bl BattleScriptIncrementPointer
	b _022413A4
_02241362:
	cmp r0, #0
	beq _0224137E
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	mov r3, #0x3c
	bl CheckBattlerAbilityIfNotIgnored
	cmp r0, #1
	bne _0224137E
	ldr r1, [sp]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
	b _022413A4
_0224137E:
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _022413B0 ; =0x00002DB8
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _0224139C
	ldr r2, [r5, #0x6c]
	add r0, r6, #0
	add r1, r5, #0
	bl ov12_02252700
	cmp r0, #0
	bne _022413A4
_0224139C:
	add r0, r5, #0
	add r1, r4, #0
	bl BattleScriptIncrementPointer
_022413A4:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022413AC: .word 0x0000219C
_022413B0: .word 0x00002DB8
	thumb_func_end BtlCmd_TryThief

	thumb_func_start BtlCmd_TryProtect
BtlCmd_TryProtect: ; 0x022413B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	ldr r1, [r5, #0x64]
	str r0, [sp, #8]
	lsl r0, r1, #1
	add r2, r5, r0
	ldr r0, _022414D4 ; =0x0000305C
	ldrh r0, [r2, r0]
	cmp r0, #0xb6
	beq _022413F4
	cmp r0, #0xc5
	beq _022413F4
	cmp r0, #0xcb
	beq _022413F4
	ldr r0, _022414D8 ; =0x00002DC8
	add r3, r1, #0
	mov r2, #0xc0
	add r0, r5, r0
	mul r3, r2
	ldr r2, [r0, r3]
	ldr r1, _022414DC ; =0xFFFFE7FF
	and r1, r2
	str r1, [r0, r3]
_022413F4:
	ldr r0, _022414E0 ; =0x00003150
	ldr r0, [r5, r0]
	cmp r0, #1
	beq _02241402
	mov r0, #1
	str r0, [sp, #4]
	b _02241406
_02241402:
	mov r0, #0
	str r0, [sp, #4]
_02241406:
	ldr r6, [r5, #0x64]
	ldr r0, _022414D8 ; =0x00002DC8
	add r7, r6, #0
	add r4, r5, r0
	mov r0, #0xc0
	mul r7, r0
	ldr r0, [sp]
	bl BattleSys_Random
	ldr r1, [r4, r7]
	lsl r1, r1, #0x13
	lsr r1, r1, #0x1e
	lsl r2, r1, #1
	ldr r1, _022414E4 ; =ov12_0226C2F8
	ldrh r1, [r1, r2]
	cmp r1, r0
	blo _022414BE
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _022414BE
	ldr r0, _022414E8 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _022414EC ; =0x000003DE
	ldrh r0, [r1, r0]
	cmp r0, #0x6f
	bne _02241456
	mov r2, #0x75
	lsl r2, r2, #2
	add r0, r5, r2
	lsl r4, r6, #6
	ldr r3, [r0, r4]
	mov r1, #4
	orr r1, r3
	str r1, [r0, r4]
	add r0, r5, #0
	sub r2, #0xba
	add r0, #0xf6
	strh r2, [r0]
_02241456:
	ldr r0, _022414E8 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _022414EC ; =0x000003DE
	ldrh r0, [r1, r0]
	cmp r0, #0x74
	bne _02241482
	mov r2, #0x75
	ldr r1, [r5, #0x64]
	lsl r2, r2, #2
	lsl r4, r1, #6
	add r0, r5, r2
	add r1, r2, #0
	ldr r3, [r0, r4]
	add r1, #0x2c
	orr r1, r3
	str r1, [r0, r4]
	add r0, r5, #0
	sub r2, #0x1a
	add r0, #0xf6
	strh r2, [r0]
_02241482:
	add r0, r5, #0
	mov r1, #2
	add r0, #0xf5
	strb r1, [r0]
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl ov12_022522E0
	add r1, r5, #0
	add r1, #0xf8
	str r0, [r1]
	ldr r2, [r5, #0x64]
	mov r0, #0xc0
	add r1, r2, #0
	mul r1, r0
	ldr r0, _022414D8 ; =0x00002DC8
	add r0, r5, r0
	ldr r3, [r0, r1]
	lsl r2, r3, #0x13
	lsr r4, r2, #0x1e
	cmp r4, #3
	bhs _022414CE
	ldr r2, _022414DC ; =0xFFFFE7FF
	and r3, r2
	add r2, r4, #1
	lsl r2, r2, #0x1e
	lsr r2, r2, #0x13
	orr r2, r3
	str r2, [r0, r1]
	b _022414CE
_022414BE:
	ldr r1, [r4, r7]
	ldr r0, _022414DC ; =0xFFFFE7FF
	and r0, r1
	str r0, [r4, r7]
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
_022414CE:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022414D4: .word 0x0000305C
_022414D8: .word 0x00002DC8
_022414DC: .word 0xFFFFE7FF
_022414E0: .word 0x00003150
_022414E4: .word ov12_0226C2F8
_022414E8: .word 0x00003044
_022414EC: .word 0x000003DE
	thumb_func_end BtlCmd_TryProtect

	thumb_func_start BtlCmd_TrySubstitute
BtlCmd_TrySubstitute: ; 0x022414F0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r4, r0, #0
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0224155C ; =0x00002D90
	ldr r0, [r1, r0]
	mov r1, #4
	bl ov12_02253178
	ldr r1, [r5, #0x64]
	mov r2, #0xc0
	add r3, r1, #0
	mul r3, r2
	add r1, r5, r3
	ldr r3, _02241560 ; =0x00002D8C
	ldr r1, [r1, r3]
	cmp r1, r0
	bgt _02241532
	add r0, r5, #0
	add r1, r4, #0
	bl BattleScriptIncrementPointer
	b _02241556
_02241532:
	ldr r1, _02241564 ; =0x0000215C
	neg r4, r0
	str r4, [r5, r1]
	ldr r1, [r5, #0x64]
	add r4, r1, #0
	add r1, r3, #0
	mul r4, r2
	add r3, #0x24
	add r4, r5, r4
	add r1, #0x54
	str r0, [r4, r1]
	ldr r0, [r5, #0x64]
	add r3, r5, r3
	mul r2, r0
	ldr r1, [r3, r2]
	ldr r0, _02241568 ; =0xFFFF1FFF
	and r0, r1
	str r0, [r3, r2]
_02241556:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0224155C: .word 0x00002D90
_02241560: .word 0x00002D8C
_02241564: .word 0x0000215C
_02241568: .word 0xFFFF1FFF
	thumb_func_end BtlCmd_TrySubstitute

	thumb_func_start BtlCmd_TryWhirlwind
BtlCmd_TryWhirlwind: ; 0x0224156C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp]
	str r1, [sp, #4]
	add r0, r1, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r0, [sp, #4]
	bl BattleScriptReadWord
	str r0, [sp, #0x1c]
	ldr r0, [sp]
	bl ov12_0223A7E0
	add r4, r0, #0
	mov r0, #1
	tst r0, r4
	bne _02241594
	b _022416E6
_02241594:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	ldr r1, [r1, #0x6c]
	mov r7, #0
	bl ov12_0223A7F4
	ldr r1, [sp, #4]
	str r0, [sp, #0x18]
	ldr r0, [sp]
	ldr r1, [r1, #0x6c]
	bl ov12_0223A834
	add r6, r0, #0
	mov r0, #8
	tst r0, r4
	bne _022415C8
	mov r0, #0x10
	tst r0, r4
	beq _022415E0
	ldr r1, [sp, #4]
	ldr r0, [sp]
	ldr r1, [r1, #0x6c]
	bl ov12_0223AB1C
	cmp r0, #0
	beq _022415E0
_022415C8:
	mov r0, #0
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	ldr r1, [r0, #0x6c]
	add r1, r0, r1
	ldr r0, _02241700 ; =0x0000219C
	ldrb r0, [r1, r0]
	str r0, [sp, #0xc]
	str r0, [sp, #8]
	b _02241620
_022415E0:
	mov r0, #2
	str r0, [sp, #0x14]
	tst r0, r4
	beq _0224160A
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #4]
	ldr r1, [r0, #0x6c]
	add r2, r0, r1
	ldr r0, _02241700 ; =0x0000219C
	ldrb r0, [r2, r0]
	str r0, [sp, #0xc]
	ldr r0, [sp]
	bl ov12_0223AB6C
	ldr r1, [sp, #4]
	add r1, r1, r0
	ldr r0, _02241700 ; =0x0000219C
	ldrb r0, [r1, r0]
	str r0, [sp, #8]
	b _02241620
_0224160A:
	mov r0, #0
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	ldr r1, [r0, #0x6c]
	add r1, r0, r1
	ldr r0, _02241700 ; =0x0000219C
	ldrb r0, [r1, r0]
	str r0, [sp, #0xc]
	str r0, [sp, #8]
_02241620:
	ldr r5, [sp, #0x10]
	add r0, r5, #0
	cmp r0, r6
	bge _02241662
_02241628:
	ldr r0, [sp, #0x18]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0224165C
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0224165C
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0224165C
	add r7, r7, #1
_0224165C:
	add r5, r5, #1
	cmp r5, r6
	blt _02241628
_02241662:
	ldr r0, [sp, #0x14]
	cmp r7, r0
	bgt _02241672
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x1c]
	bl BattleScriptIncrementPointer
	b _022416FA
_02241672:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ov12_0225277C
	cmp r0, #0
	beq _022416DC
	mov r7, #5
_02241680:
	ldr r0, [sp]
	bl BattleSys_Random
	add r1, r6, #0
	bl _s32_div_f
	ldr r0, [sp, #0x10]
	add r5, r1, #0
	add r5, r5, r0
	ldr r0, [sp, #0xc]
	cmp r5, r0
	beq _02241680
	ldr r0, [sp, #8]
	cmp r5, r0
	beq _02241680
	ldr r0, [sp, #0x18]
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r1, r7, #0
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02241680
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	beq _02241680
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02241680
	ldr r0, [sp, #4]
	ldr r1, [r0, #0x6c]
	add r1, r0, r1
	ldr r0, _02241704 ; =0x000021A0
	strb r5, [r1, r0]
	b _022416FA
_022416DC:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x1c]
	bl BattleScriptIncrementPointer
	b _022416FA
_022416E6:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ov12_0225277C
	cmp r0, #0
	bne _022416FA
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x1c]
	bl BattleScriptIncrementPointer
_022416FA:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02241700: .word 0x0000219C
_02241704: .word 0x000021A0
	thumb_func_end BtlCmd_TryWhirlwind

	thumb_func_start BtlCmd_Transform
BtlCmd_Transform: ; 0x02241708
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r5, [r4, #0x64]
	ldr r1, _022418D8 ; =0x00002DB0
	add r0, r5, #0
	mov r2, #0xc0
	mov r5, #2
	add r3, r4, r1
	mul r0, r2
	ldr r6, [r3, r0]
	lsl r5, r5, #0x14
	orr r5, r6
	str r5, [r3, r0]
	ldr r3, [r4, #0x64]
	mov r0, #0
	add r5, r3, #0
	mul r5, r2
	add r3, r1, #0
	add r5, r4, r5
	add r3, #0x38
	strh r0, [r5, r3]
	add r3, r1, #0
	add r3, #0x18
	ldr r6, [r4, #0x64]
	add r5, r4, r3
	add r3, r6, #0
	mul r3, r2
	ldr r7, [r5, r3]
	mov r6, #7
	bic r7, r6
	str r7, [r5, r3]
	ldr r3, [r4, #0x6c]
	add r5, r3, #0
	mul r5, r2
	add r3, r1, #0
	add r5, r4, r5
	sub r3, #8
	ldr r3, [r5, r3]
	ldr r5, [r4, #0x64]
	add r6, r5, #0
	mul r6, r2
	add r5, r1, #0
	add r6, r4, r6
	add r5, #0x34
	str r3, [r6, r5]
	ldr r3, [r4, #0x6c]
	add r5, r3, #0
	mul r5, r2
	add r3, r1, #0
	add r5, r4, r5
	add r3, #0xe
	ldrb r3, [r5, r3]
	ldr r5, [r4, #0x64]
	add r6, r5, #0
	lsl r3, r3, #0x1c
	mul r6, r2
	add r5, r1, #0
	lsr r3, r3, #0x1c
	add r6, r4, r6
	add r5, #0x4a
	strh r3, [r6, r5]
	add r3, r1, #0
	add r3, #0x1c
	ldr r6, [r4, #0x64]
	add r5, r4, r3
	add r3, r6, #0
	mul r3, r2
	ldr r7, [r5, r3]
	mov r6, #0x3c
	bic r7, r6
	str r7, [r5, r3]
	ldr r6, [r4, #0x64]
	sub r1, #0x70
	add r3, r6, #0
	mul r3, r2
	ldr r7, [r5, r3]
	ldr r6, _022418DC ; =0xFFFFE3FF
	and r6, r7
	str r6, [r5, r3]
	add r5, r4, r1
	ldr r1, [r4, #0x64]
	add r3, r1, #0
	mul r3, r2
	ldr r1, [r4, #0x6c]
	add r3, r5, r3
	mul r2, r1
	add r2, r5, r2
_022417BE:
	ldrb r1, [r2, r0]
	strb r1, [r3, r0]
	add r0, r0, #1
	cmp r0, #0x28
	blo _022417BE
	ldr r3, [r4, #0x64]
	ldr r1, _022418E0 ; =0x00002D68
	add r6, r3, #0
	mov r2, #0xc0
	add r0, r4, r1
	mul r6, r2
	ldr r5, [r0, r6]
	mov r3, #1
	bic r5, r3
	str r5, [r0, r6]
	ldr r3, [r4, #0x64]
	add r6, r3, #0
	mul r6, r2
	ldr r5, [r0, r6]
	mov r3, #2
	bic r5, r3
	str r5, [r0, r6]
	ldr r3, [r4, #0x64]
	add r6, r3, #0
	mul r6, r2
	ldr r5, [r0, r6]
	mov r3, #4
	bic r5, r3
	str r5, [r0, r6]
	ldr r3, [r4, #0x64]
	add r6, r3, #0
	mul r6, r2
	ldr r5, [r0, r6]
	mov r3, #8
	bic r5, r3
	str r5, [r0, r6]
	ldr r3, [r4, #0x64]
	add r6, r3, #0
	mul r6, r2
	ldr r5, [r0, r6]
	mov r3, #0x10
	bic r5, r3
	str r5, [r0, r6]
	ldr r3, [r4, #0x64]
	add r6, r3, #0
	mul r6, r2
	ldr r5, [r0, r6]
	mov r3, #0x20
	bic r5, r3
	str r5, [r0, r6]
	ldr r5, [r4, #0x64]
	add r3, r5, #0
	mul r3, r2
	ldr r6, [r0, r3]
	ldr r5, _022418E4 ; =0xFFFFFEFF
	and r5, r6
	str r5, [r0, r3]
	ldr r5, [r4, #0x64]
	add r3, r5, #0
	mul r3, r2
	ldr r6, [r0, r3]
	ldr r5, _022418E8 ; =0xFFFFFDFF
	and r5, r6
	str r5, [r0, r3]
	ldr r5, [r4, #0x64]
	add r3, r5, #0
	mul r3, r2
	ldr r6, [r0, r3]
	ldr r5, _022418EC ; =0xFFFFFBFF
	and r5, r6
	str r5, [r0, r3]
	add r3, r1, #0
	add r3, #0x60
	add r6, r4, r3
	ldr r3, [r4, #0x64]
	add r1, #0x70
	add r5, r3, #0
	mul r5, r2
	ldr r7, [r6, r5]
	ldr r3, _022418F0 ; =0xBFFFFFFF
	and r3, r7
	add r7, r2, #0
	add r7, #0x90
	ldr r7, [r4, r7]
	lsl r7, r7, #0x1f
	lsr r7, r7, #1
	orr r3, r7
	str r3, [r6, r5]
	add r3, r2, #0
	add r3, #0x90
	ldr r3, [r4, r3]
	add r6, r3, #1
	ldr r3, [r4, #0x64]
	add r5, r3, #0
	mul r5, r2
	add r3, r4, r5
	str r6, [r3, r1]
	ldr r1, [r4, #0x64]
	add r5, r1, #0
	mul r5, r2
	ldr r3, [r0, r5]
	mov r1, #0x40
	bic r3, r1
	str r3, [r0, r5]
	ldr r1, [r4, #0x64]
	mov r6, #0
	add r3, r1, #0
	mul r3, r2
	ldr r2, [r0, r3]
	mov r1, #0x80
	bic r2, r1
	str r2, [r0, r3]
	mov r0, #0xf9
	add r5, r6, #0
	mov r1, #5
	lsl r0, r0, #2
_022418A6:
	ldr r3, [r4, #0x64]
	mov r2, #0xc0
	mul r2, r3
	add r3, r4, r2
	ldr r2, _022418F4 ; =0x00002D4C
	add r7, r3, r5
	ldrh r2, [r7, r2]
	lsl r2, r2, #4
	add r2, r4, r2
	ldrb r2, [r2, r0]
	cmp r2, #5
	bhs _022418C6
	add r7, r3, r6
	ldr r3, _022418F8 ; =0x00002D6C
	strb r2, [r7, r3]
	b _022418CC
_022418C6:
	ldr r2, _022418F8 ; =0x00002D6C
	add r3, r3, r6
	strb r1, [r3, r2]
_022418CC:
	add r6, r6, #1
	add r5, r5, #2
	cmp r6, #4
	blt _022418A6
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022418D8: .word 0x00002DB0
_022418DC: .word 0xFFFFE3FF
_022418E0: .word 0x00002D68
_022418E4: .word 0xFFFFFEFF
_022418E8: .word 0xFFFFFDFF
_022418EC: .word 0xFFFFFBFF
_022418F0: .word 0xBFFFFFFF
_022418F4: .word 0x00002D4C
_022418F8: .word 0x00002D6C
	thumb_func_end BtlCmd_Transform

	thumb_func_start BtlCmd_TrySpikes
BtlCmd_TrySpikes: ; 0x022418FC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	ldr r1, [r4, #0x64]
	add r0, r5, #0
	bl ov12_0223AB1C
	mov r2, #0x72
	mov r1, #1
	add r3, r0, #0
	eor r3, r1
	lsl r0, r3, #3
	add r5, r4, r0
	lsl r2, r2, #2
	ldr r5, [r5, r2]
	lsl r5, r5, #0x1e
	lsr r5, r5, #0x1e
	cmp r5, #3
	bne _02241952
	mov r0, #0xb5
	lsl r0, r0, #2
	add r2, r4, r0
	ldr r3, [r4, #0x64]
	mov r0, #0x1c
	mul r0, r3
	ldr r5, [r2, r0]
	mov r3, #1
	bic r5, r3
	orr r1, r5
	str r1, [r2, r0]
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
	b _0224197A
_02241952:
	add r1, r2, #0
	sub r1, #0xc
	lsl r6, r3, #2
	add r1, r4, r1
	ldr r5, [r1, r6]
	mov r3, #4
	orr r3, r5
	str r3, [r1, r6]
	add r2, r4, r2
	ldr r4, [r2, r0]
	mov r3, #3
	add r1, r4, #0
	bic r1, r3
	lsl r3, r4, #0x1e
	lsr r3, r3, #0x1e
	add r4, r3, #1
	mov r3, #3
	and r3, r4
	orr r1, r3
	str r1, [r2, r0]
_0224197A:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_TrySpikes

	thumb_func_start BtlCmd_CheckSpikes
BtlCmd_CheckSpikes: ; 0x02241980
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r4, r0, #0
	add r0, r5, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl GetBattlerIDBySide
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl ov12_0223AB1C
	lsl r0, r0, #3
	add r1, r5, r0
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1e
	lsr r1, r0, #0x1e
	beq _022419EE
	mov r0, #0xc0
	mul r0, r4
	ldr r4, _022419FC ; =0x00002D8C
	add r0, r5, r0
	ldr r2, [r0, r4]
	cmp r2, #0
	beq _022419EE
	mov r2, #5
	sub r1, r2, r1
	ldr r3, _02241A00 ; =0x0000215C
	lsl r1, r1, #1
	str r1, [r5, r3]
	add r1, r4, #4
	ldr r1, [r0, r1]
	sub r0, r2, #6
	mul r0, r1
	ldr r1, [r5, r3]
	bl ov12_02253178
	ldr r1, _02241A00 ; =0x0000215C
	str r0, [r5, r1]
	b _022419F6
_022419EE:
	add r0, r5, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
_022419F6:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022419FC: .word 0x00002D8C
_02241A00: .word 0x0000215C
	thumb_func_end BtlCmd_CheckSpikes

	thumb_func_start BtlCmd_TryPerishSong
BtlCmd_TryPerishSong: ; 0x02241A04
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	str r1, [sp]
	add r0, r1, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r0, [sp]
	bl BattleScriptReadWord
	str r0, [sp, #8]
	add r0, r4, #0
	bl BattleSys_GetMaxBattlers
	mov r2, #0x4d
	mov r7, #0
	str r0, [sp, #4]
	add r1, r0, #0
	ldr r0, [sp]
	lsl r2, r2, #2
	str r1, [r0, r2]
	ldr r0, [sp, #4]
	add r6, r7, #0
	cmp r0, #0
	ble _02241A94
	ldr r4, [sp]
	ldr r1, _02241AA8 ; =0x00002DC8
	add r0, r4, #0
	add r5, r0, r1
_02241A40:
	mov r0, #0xb7
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #0x20
	tst r0, r1
	bne _02241A66
	ldr r0, _02241AAC ; =0x00002D8C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02241A66
	ldr r0, [sp]
	add r2, r6, #0
	add r1, r0, #0
	ldr r1, [r1, #0x64]
	mov r3, #0x2b
	bl CheckBattlerAbilityIfNotIgnored
	cmp r0, #1
	bne _02241A6A
_02241A66:
	add r7, r7, #1
	b _02241A88
_02241A6A:
	mov r0, #0xb7
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #0x20
	orr r1, r0
	mov r0, #0xb7
	lsl r0, r0, #6
	str r1, [r4, r0]
	ldr r1, [r5]
	ldr r0, _02241AB0 ; =0xFFFF9FFF
	and r1, r0
	mov r0, #6
	lsl r0, r0, #0xc
	orr r0, r1
	str r0, [r5]
_02241A88:
	ldr r0, [sp, #4]
	add r6, r6, #1
	add r4, #0xc0
	add r5, #0xc0
	cmp r6, r0
	blt _02241A40
_02241A94:
	ldr r0, [sp, #4]
	cmp r7, r0
	bne _02241AA2
	ldr r0, [sp]
	ldr r1, [sp, #8]
	bl BattleScriptIncrementPointer
_02241AA2:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02241AA8: .word 0x00002DC8
_02241AAC: .word 0x00002D8C
_02241AB0: .word 0xFFFF9FFF
	thumb_func_end BtlCmd_TryPerishSong

	thumb_func_start BtlCmd_SetTurnOrderBySpeed
BtlCmd_SetTurnOrderBySpeed: ; 0x02241AB4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl BattleScriptGetVarPointer
	ldr r1, _02241AE4 ; =0x00003104
	ldr r1, [r4, r1]
	add r2, r4, r1
	ldr r1, _02241AE8 ; =0x000021EC
	ldrb r1, [r2, r1]
	str r1, [r0]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02241AE4: .word 0x00003104
_02241AE8: .word 0x000021EC
	thumb_func_end BtlCmd_SetTurnOrderBySpeed

	thumb_func_start BtlCmd_JumpIfValidBattlerVar
BtlCmd_JumpIfValidBattlerVar: ; 0x02241AEC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl BattleScriptGetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl BattleSys_GetMaxBattlers
	ldr r1, [r6]
	cmp r1, r0
	bhs _02241B2A
	add r0, r4, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
_02241B2A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_JumpIfValidBattlerVar

	thumb_func_start BtlCmd_WeatherDamageCalc
BtlCmd_WeatherDamageCalc: ; 0x02241B30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl GetBattlerIDBySide
	add r4, r0, #0
	mov r0, #0x4e
	mov r3, #0
	lsl r0, r0, #2
	str r3, [r5, r0]
	ldr r0, _02241DD8 ; =0x0000215C
	add r1, r4, #0
	str r3, [r5, r0]
	add r0, r5, #0
	mov r2, #0x1b
	bl GetBattlerVar
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x1c
	mov r3, #0
	bl GetBattlerVar
	add r7, r0, #0
	mov r0, #0xd
	str r0, [sp]
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _02241BA0
	mov r0, #0x4c
	str r0, [sp]
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	beq _02241BA2
_02241BA0:
	b _02241DD0
_02241BA2:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #0xc
	tst r0, r1
	beq _02241C0C
	ldr r0, [sp, #4]
	cmp r0, #5
	beq _02241C0C
	cmp r7, #5
	beq _02241C0C
	cmp r0, #8
	beq _02241C0C
	cmp r7, #8
	beq _02241C0C
	cmp r0, #4
	beq _02241C0C
	cmp r7, #4
	beq _02241C0C
	mov r0, #0xc0
	add r6, r4, #0
	mul r6, r0
	ldr r0, _02241DDC ; =0x00002D8C
	add r1, r5, r6
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02241C0C
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerAbility
	cmp r0, #8
	beq _02241C0C
	mov r3, #0xb7
	add r1, r5, r6
	lsl r3, r3, #6
	ldr r2, [r1, r3]
	ldr r0, _02241DE0 ; =0x00040080
	tst r0, r2
	bne _02241C0C
	mov r0, #0xc9
	add r2, r0, #0
	add r2, #0x5b
	str r0, [r5, r2]
	sub r3, #0x30
	ldr r1, [r1, r3]
	sub r0, #0xca
	mul r0, r1
	mov r1, #0x10
	bl ov12_02253178
	ldr r1, _02241DD8 ; =0x0000215C
	str r0, [r5, r1]
_02241C0C:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #0x30
	tst r0, r1
	beq _02241C74
	mov r0, #0xc0
	add r6, r4, #0
	mul r6, r0
	ldr r0, _02241DDC ; =0x00002D8C
	add r2, r5, r6
	ldr r1, [r2, r0]
	cmp r1, #0
	beq _02241C74
	add r0, #0x34
	ldr r1, [r2, r0]
	ldr r0, _02241DE0 ; =0x00040080
	tst r0, r1
	bne _02241C74
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerAbility
	cmp r0, #0x57
	beq _02241C4A
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerAbility
	cmp r0, #0x5e
	bne _02241C60
_02241C4A:
	ldr r0, _02241DE4 ; =0x00002D90
	add r1, r5, r6
	ldr r1, [r1, r0]
	mov r0, #0
	mvn r0, r0
	mul r0, r1
	mov r1, #8
	bl ov12_02253178
	ldr r1, _02241DD8 ; =0x0000215C
	str r0, [r5, r1]
_02241C60:
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerAbility
	cmp r0, #0x5e
	bne _02241C74
	mov r0, #0x4e
	mov r1, #2
	lsl r0, r0, #2
	str r1, [r5, r0]
_02241C74:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #0xc0
	tst r1, r0
	beq _02241CF6
	ldr r1, _02241DDC ; =0x00002D8C
	add r6, r4, #0
	mul r6, r0
	add r0, r5, r1
	str r0, [sp, #8]
	ldr r0, [r0, r6]
	cmp r0, #0
	beq _02241CF6
	add r0, r5, r6
	add r1, #0x34
	ldr r1, [r0, r1]
	ldr r0, _02241DE0 ; =0x00040080
	tst r0, r1
	bne _02241CF6
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerAbility
	cmp r0, #0x73
	bne _02241CC2
	ldr r0, _02241DE4 ; =0x00002D90
	add r1, r5, r6
	ldr r0, [r1, r0]
	ldr r1, [sp, #8]
	ldr r1, [r1, r6]
	cmp r1, r0
	bhs _02241CF6
	mov r1, #0x10
	bl ov12_02253178
	ldr r1, _02241DD8 ; =0x0000215C
	str r0, [r5, r1]
	b _02241CF6
_02241CC2:
	ldr r0, [sp, #4]
	cmp r0, #0xf
	beq _02241CF6
	cmp r7, #0xf
	beq _02241CF6
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerAbility
	cmp r0, #0x51
	beq _02241CF6
	ldr r1, _02241DE8 ; =0x00000102
	add r0, r1, #0
	add r0, #0x22
	str r1, [r5, r0]
	ldr r0, _02241DE4 ; =0x00002D90
	add r1, r5, r6
	ldr r1, [r1, r0]
	mov r0, #0
	mvn r0, r0
	mul r0, r1
	mov r1, #0x10
	bl ov12_02253178
	ldr r1, _02241DD8 ; =0x0000215C
	str r0, [r5, r1]
_02241CF6:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r0, #3
	tst r0, r1
	beq _02241DD0
	ldr r1, _02241DDC ; =0x00002D8C
	mov r0, #0xc0
	add r6, r4, #0
	mul r6, r0
	add r7, r5, r1
	ldr r0, [r7, r6]
	cmp r0, #0
	beq _02241D38
	add r1, r1, #4
	add r1, r5, r1
	str r1, [sp, #0xc]
	ldr r1, [r1, r6]
	cmp r0, r1
	bhs _02241D38
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerAbility
	cmp r0, #0x2c
	bne _02241D38
	ldr r0, [sp, #0xc]
	mov r1, #0x10
	ldr r0, [r0, r6]
	bl ov12_02253178
	ldr r1, _02241DD8 ; =0x0000215C
	str r0, [r5, r1]
_02241D38:
	ldr r0, [r7, r6]
	cmp r0, #0
	beq _02241D64
	ldr r1, _02241DE4 ; =0x00002D90
	add r1, r5, r1
	str r1, [sp, #0x10]
	ldr r1, [r1, r6]
	cmp r0, r1
	bhs _02241D64
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerAbility
	cmp r0, #0x57
	bne _02241D64
	ldr r0, [sp, #0x10]
	mov r1, #8
	ldr r0, [r0, r6]
	bl ov12_02253178
	ldr r1, _02241DD8 ; =0x0000215C
	str r0, [r5, r1]
_02241D64:
	ldr r0, [r7, r6]
	cmp r0, #0
	beq _02241DD0
	ldr r0, _02241DEC ; =0x00002DAC
	add r7, r5, r0
	ldr r0, [r7, r6]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	beq _02241DD0
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerAbility
	cmp r0, #0x5d
	bne _02241DD0
	ldr r0, [r7, r6]
	mov r1, #7
	tst r1, r0
	beq _02241D94
	mov r0, #0x13
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	b _02241DC8
_02241D94:
	ldr r1, _02241DF0 ; =0x00000F88
	tst r1, r0
	beq _02241DA4
	mov r0, #0x13
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r5, r0]
	b _02241DC8
_02241DA4:
	mov r1, #0x10
	tst r1, r0
	beq _02241DB4
	mov r0, #0x13
	mov r1, #2
	lsl r0, r0, #4
	str r1, [r5, r0]
	b _02241DC8
_02241DB4:
	mov r1, #0x40
	tst r0, r1
	beq _02241DC2
	mov r0, #3
	add r1, #0xf0
	str r0, [r5, r1]
	b _02241DC8
_02241DC2:
	mov r0, #4
	add r1, #0xf0
	str r0, [r5, r1]
_02241DC8:
	mov r0, #0x4e
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r5, r0]
_02241DD0:
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02241DD8: .word 0x0000215C
_02241DDC: .word 0x00002D8C
_02241DE0: .word 0x00040080
_02241DE4: .word 0x00002D90
_02241DE8: .word 0x00000102
_02241DEC: .word 0x00002DAC
_02241DF0: .word 0x00000F88
	thumb_func_end BtlCmd_WeatherDamageCalc

	thumb_func_start BtlCmd_RolloutDamageCalc
BtlCmd_RolloutDamageCalc: ; 0x02241DF4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r6, [r4, #0x64]
	mov r0, #0xb5
	lsl r0, r0, #2
	add r2, r4, r0
	mov r0, #0x1c
	add r1, r6, #0
	mul r1, r0
	ldr r3, [r2, r1]
	ldr r0, _02241EF4 ; =0xFFFFFE3F
	mov r7, #0xc0
	and r0, r3
	add r3, r6, #0
	mul r3, r7
	add r6, r4, r3
	ldr r3, _02241EF8 ; =0x00002DC8
	ldr r6, [r6, r3]
	sub r3, #0x18
	lsl r6, r6, #0xe
	lsr r6, r6, #0x1d
	lsl r6, r6, #0x1d
	lsr r6, r6, #0x17
	orr r0, r6
	str r0, [r2, r1]
	ldr r2, [r4, #0x64]
	add r0, r2, #0
	mul r0, r7
	add r0, r4, r0
	ldr r1, [r0, r3]
	mov r0, #1
	lsl r0, r0, #0xc
	tst r0, r1
	bne _02241E62
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02250C70
	ldr r0, _02241EF8 ; =0x00002DC8
	ldr r2, [r4, #0x64]
	add r1, r4, r0
	add r0, r7, #0
	mul r0, r2
	ldr r3, [r1, r0]
	ldr r2, _02241EFC ; =0xFFFC7FFF
	and r3, r2
	mov r2, #0xa
	lsl r2, r2, #0xe
	orr r2, r3
	str r2, [r1, r0]
_02241E62:
	ldr r1, [r4, #0x64]
	ldr r0, _02241EF8 ; =0x00002DC8
	mov r7, #0xc0
	add r3, r1, #0
	add r6, r4, r0
	mul r3, r7
	ldr r1, [r6, r3]
	ldr r2, _02241EFC ; =0xFFFC7FFF
	and r2, r1
	lsl r1, r1, #0xe
	lsr r1, r1, #0x1d
	sub r1, r1, #1
	lsl r1, r1, #0x1d
	lsr r1, r1, #0xe
	orr r1, r2
	str r1, [r6, r3]
	ldr r2, [r4, #0x64]
	add r1, r2, #0
	mul r1, r7
	add r1, r4, r1
	ldr r0, [r1, r0]
	lsl r0, r0, #0xe
	lsr r0, r0, #0x1d
	bne _02241E9A
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02250CA0
_02241E9A:
	ldr r0, _02241F00 ; =0x00003044
	mov r2, #1
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _02241F04 ; =0x000003E1
	ldrb r1, [r1, r0]
	ldr r0, _02241F08 ; =0x00002154
	str r1, [r4, r0]
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _02241EF8 ; =0x00002DC8
	ldr r0, [r1, r0]
	lsl r0, r0, #0xe
	lsr r1, r0, #0x1d
	mov r0, #5
	sub r3, r0, r1
	cmp r3, #1
	ble _02241ED2
	ldr r0, _02241F08 ; =0x00002154
_02241EC6:
	ldr r1, [r4, r0]
	add r2, r2, #1
	lsl r1, r1, #1
	str r1, [r4, r0]
	cmp r2, r3
	blt _02241EC6
_02241ED2:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _02241F0C ; =0x00002DB0
	ldr r1, [r1, r0]
	mov r0, #1
	lsl r0, r0, #0x1e
	tst r0, r1
	beq _02241EEE
	ldr r0, _02241F08 ; =0x00002154
	ldr r1, [r4, r0]
	lsl r1, r1, #1
	str r1, [r4, r0]
_02241EEE:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02241EF4: .word 0xFFFFFE3F
_02241EF8: .word 0x00002DC8
_02241EFC: .word 0xFFFC7FFF
_02241F00: .word 0x00003044
_02241F04: .word 0x000003E1
_02241F08: .word 0x00002154
_02241F0C: .word 0x00002DB0
	thumb_func_end BtlCmd_RolloutDamageCalc

	thumb_func_start BtlCmd_FuryCutterDamageCalc
BtlCmd_FuryCutterDamageCalc: ; 0x02241F10
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r2, [r4, #0x64]
	mov r0, #0xc0
	add r1, r2, #0
	mul r1, r0
	ldr r0, _02241F8C ; =0x00002DC8
	add r0, r4, r0
	ldr r3, [r0, r1]
	lsl r2, r3, #0xb
	lsr r5, r2, #0x1d
	cmp r5, #5
	bhs _02241F40
	ldr r2, _02241F90 ; =0xFFE3FFFF
	and r3, r2
	add r2, r5, #1
	lsl r2, r2, #0x1d
	lsr r2, r2, #0xb
	orr r2, r3
	str r2, [r0, r1]
_02241F40:
	ldr r0, _02241F94 ; =0x00003044
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _02241F98 ; =0x000003E1
	ldrb r1, [r1, r0]
	ldr r0, _02241F9C ; =0x00002154
	str r1, [r4, r0]
	ldr r2, [r4, #0x64]
	mov r1, #0xc0
	mul r1, r2
	add r2, r4, r1
	ldr r1, _02241F8C ; =0x00002DC8
	mov r0, #1
	ldr r1, [r2, r1]
	lsl r1, r1, #0xb
	lsr r1, r1, #0x1d
	cmp r1, #1
	bls _02241F86
	ldr r3, _02241F9C ; =0x00002154
	ldr r2, _02241F8C ; =0x00002DC8
	mov r1, #0xc0
_02241F6C:
	ldr r5, [r4, r3]
	add r0, r0, #1
	lsl r5, r5, #1
	str r5, [r4, r3]
	ldr r5, [r4, #0x64]
	add r6, r5, #0
	mul r6, r1
	add r5, r4, r6
	ldr r5, [r5, r2]
	lsl r5, r5, #0xb
	lsr r5, r5, #0x1d
	cmp r0, r5
	blo _02241F6C
_02241F86:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02241F8C: .word 0x00002DC8
_02241F90: .word 0xFFE3FFFF
_02241F94: .word 0x00003044
_02241F98: .word 0x000003E1
_02241F9C: .word 0x00002154
	thumb_func_end BtlCmd_FuryCutterDamageCalc

	thumb_func_start BtlCmd_TryAttract
BtlCmd_TryAttract: ; 0x02241FA0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r3, r0, #0
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r5, #0xc0
	add r1, r0, #0
	mul r1, r5
	ldr r6, _0224201C ; =0x00002DBE
	add r1, r4, r1
	ldrb r0, [r1, r6]
	lsl r0, r0, #0x1c
	lsr r2, r0, #0x1c
	add r0, r5, #0
	add r0, #0x58
	ldr r0, [r4, r0]
	mul r5, r0
	add r5, r4, r5
	ldrb r5, [r5, r6]
	lsl r5, r5, #0x1c
	lsr r5, r5, #0x1c
	cmp r5, r2
	beq _02241FF2
	sub r6, #0xe
	ldr r6, [r1, r6]
	mov r1, #0xf
	lsl r1, r1, #0x10
	tst r1, r6
	bne _02241FF2
	cmp r5, #2
	beq _02241FF2
	cmp r2, #2
	bne _02241FFC
_02241FF2:
	add r0, r4, #0
	add r1, r3, #0
	bl BattleScriptIncrementPointer
	b _02242016
_02241FFC:
	bl MaskOfFlagNo
	ldr r1, _02242020 ; =0x00002DB0
	mov r2, #0xc0
	add r1, r4, r1
	add r4, #0x94
	ldr r3, [r4]
	lsl r0, r0, #0x10
	add r4, r3, #0
	mul r4, r2
	ldr r2, [r1, r4]
	orr r0, r2
	str r0, [r1, r4]
_02242016:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_0224201C: .word 0x00002DBE
_02242020: .word 0x00002DB0
	thumb_func_end BtlCmd_TryAttract

	thumb_func_start BtlCmd_TrySafeguard
BtlCmd_TrySafeguard: ; 0x02242024
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	ldr r1, [r4, #0x64]
	add r0, r5, #0
	bl ov12_0223AB1C
	mov r5, #0x6f
	add r2, r0, #0
	lsl r5, r5, #2
	add r1, r4, r5
	lsl r0, r2, #2
	ldr r6, [r1, r0]
	mov r3, #8
	tst r3, r6
	beq _02242068
	add r0, r4, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
	ldr r1, _022420AC ; =0x0000216C
	mov r0, #0x40
	ldr r2, [r4, r1]
	orr r0, r2
	str r0, [r4, r1]
	b _022420A8
_02242068:
	mov r3, #8
	orr r3, r6
	str r3, [r1, r0]
	add r5, #8
	lsl r0, r2, #3
	add r1, r4, r5
	ldr r3, [r1, r0]
	ldr r2, _022420B0 ; =0xFFF1FFFF
	and r3, r2
	mov r2, #0xa
	lsl r2, r2, #0x10
	orr r2, r3
	str r2, [r1, r0]
	ldr r3, [r1, r0]
	ldr r2, _022420B4 ; =0xFFFE7FFF
	and r3, r2
	ldr r2, [r4, #0x64]
	lsl r2, r2, #0x1e
	lsr r2, r2, #0xf
	orr r2, r3
	str r2, [r1, r0]
	add r0, r4, #0
	mov r1, #1
	add r0, #0xf5
	strb r1, [r0]
	add r0, r4, #0
	ldr r1, [r4, #0x64]
	add r0, #0xf8
	str r1, [r0]
	mov r0, #0xc6
	add r4, #0xf6
	strh r0, [r4]
_022420A8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022420AC: .word 0x0000216C
_022420B0: .word 0xFFF1FFFF
_022420B4: .word 0xFFFE7FFF
	thumb_func_end BtlCmd_TrySafeguard

	thumb_func_start BtlCmd_Present
BtlCmd_Present: ; 0x022420B8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r5, #0
	bl BattleSys_Random
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0x66
	bge _022420E4
	ldr r0, _02242120 ; =0x00002154
	mov r1, #0x28
	str r1, [r4, r0]
	b _0224211A
_022420E4:
	cmp r0, #0xb2
	bge _022420F0
	ldr r0, _02242120 ; =0x00002154
	mov r1, #0x50
	str r1, [r4, r0]
	b _0224211A
_022420F0:
	cmp r0, #0xcc
	bge _022420FC
	ldr r0, _02242120 ; =0x00002154
	mov r1, #0x78
	str r1, [r4, r0]
	b _0224211A
_022420FC:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _02242124 ; =0x00002D90
	ldr r0, [r1, r0]
	mov r1, #4
	bl ov12_02253178
	ldr r1, _02242128 ; =0x0000215C
	str r0, [r4, r1]
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_0224211A:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02242120: .word 0x00002154
_02242124: .word 0x00002D90
_02242128: .word 0x0000215C
	thumb_func_end BtlCmd_Present

	thumb_func_start BtlCmd_MagnitudeDamageCalc
BtlCmd_MagnitudeDamageCalc: ; 0x0224212C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r0, _022421CC ; =0x00003120
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _022421BC
	add r0, r5, #0
	bl BattleSys_Random
	mov r1, #0x64
	bl _s32_div_f
	ldr r0, _022421CC ; =0x00003120
	strb r1, [r4, r0]
	ldrb r1, [r4, r0]
	cmp r1, #5
	bhs _02242164
	ldr r1, _022421D0 ; =0x00002154
	mov r2, #0xa
	str r2, [r4, r1]
	mov r1, #4
	strb r1, [r4, r0]
	b _022421BC
_02242164:
	cmp r1, #0xf
	bhs _02242174
	ldr r1, _022421D0 ; =0x00002154
	mov r2, #0x1e
	str r2, [r4, r1]
	mov r1, #5
	strb r1, [r4, r0]
	b _022421BC
_02242174:
	cmp r1, #0x23
	bhs _02242184
	ldr r1, _022421D0 ; =0x00002154
	mov r2, #0x32
	str r2, [r4, r1]
	mov r1, #6
	strb r1, [r4, r0]
	b _022421BC
_02242184:
	cmp r1, #0x41
	bhs _02242194
	ldr r1, _022421D0 ; =0x00002154
	mov r2, #0x46
	str r2, [r4, r1]
	mov r1, #7
	strb r1, [r4, r0]
	b _022421BC
_02242194:
	cmp r1, #0x55
	bhs _022421A4
	ldr r1, _022421D0 ; =0x00002154
	mov r2, #0x5a
	str r2, [r4, r1]
	mov r1, #8
	strb r1, [r4, r0]
	b _022421BC
_022421A4:
	cmp r1, #0x5f
	ldr r1, _022421D0 ; =0x00002154
	bhs _022421B4
	mov r2, #0x6e
	str r2, [r4, r1]
	mov r1, #9
	strb r1, [r4, r0]
	b _022421BC
_022421B4:
	mov r2, #0x96
	str r2, [r4, r1]
	mov r1, #0xa
	strb r1, [r4, r0]
_022421BC:
	ldr r0, _022421CC ; =0x00003120
	ldrb r1, [r4, r0]
	mov r0, #0x13
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_022421CC: .word 0x00003120
_022421D0: .word 0x00002154
	thumb_func_end BtlCmd_MagnitudeDamageCalc

	thumb_func_start BtlCmd_TrySwitchMon
BtlCmd_TrySwitchMon: ; 0x022421D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r4, r0, #0
	add r0, r5, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r5, #0
	bl BattleScriptReadWord
	str r0, [sp]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl GetBattlerIDBySide
	add r4, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov12_02252890
	cmp r0, #0
	bne _0224221E
	ldr r1, [sp]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
	b _02242232
_0224221E:
	cmp r7, #1
	bne _02242232
	mov r0, #0x4f
	lsl r0, r0, #2
	add r3, r5, r0
	lsl r2, r4, #2
	ldr r1, [r3, r2]
	mov r0, #1
	orr r0, r1
	str r0, [r3, r2]
_02242232:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_TrySwitchMon

	thumb_func_start BtlCmd_RapidSpin
BtlCmd_RapidSpin: ; 0x02242238
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldr r1, [r4, #0x64]
	bl ov12_0223AB1C
	ldr r1, [r4, #0x64]
	mov r6, #0xe
	ldr r5, _02242374 ; =0x00002DB0
	add r2, r1, #0
	mov r3, #0xc0
	mul r2, r3
	add r1, r4, r5
	ldr r7, [r1, r2]
	lsl r6, r6, #0xc
	tst r6, r7
	beq _02242294
	ldr r0, _02242378 ; =0xFFFF1FFF
	and r0, r7
	str r0, [r1, r2]
	ldr r0, [r4, #0x64]
	mov r2, #0x74
	add r1, r0, #0
	add r0, r5, #0
	mul r1, r3
	add r1, r4, r1
	add r0, #0x1c
	ldr r0, [r1, r0]
	add r5, #0x3a
	lsl r0, r0, #0x18
	lsr r1, r0, #0x1e
	add r0, r3, #0
	add r0, #0x58
	str r1, [r4, r0]
	ldr r0, [r4, #0x64]
	add r1, r0, #0
	mul r1, r3
	add r0, r4, r1
	ldrh r0, [r0, r5]
	add r3, #0x64
	mov r1, #1
	str r0, [r4, r3]
	add r0, r4, #0
	bl BattleScriptGotoSubscript
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02242294:
	add r5, #0x10
	add r5, r4, r5
	ldr r1, [r5, r2]
	mov r6, #4
	tst r6, r1
	beq _022422CA
	mov r0, #4
	bic r1, r0
	str r1, [r5, r2]
	ldr r0, [r4, #0x64]
	add r2, r0, #0
	mul r2, r3
	ldr r1, [r5, r2]
	mov r0, #3
	bic r1, r0
	str r1, [r5, r2]
	mov r1, #0x49
	add r0, r1, #0
	add r0, #0xdb
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x75
	bl BattleScriptGotoSubscript
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022422CA:
	mov r1, #0x72
	lsl r1, r1, #2
	add r6, r4, r1
	lsl r5, r0, #3
	ldr r2, [r6, r5]
	lsl r3, r2, #0x1e
	lsr r3, r3, #0x1e
	beq _02242306
	sub r1, #0xc
	lsl r3, r0, #2
	add r1, r4, r1
	ldr r2, [r1, r3]
	mov r0, #4
	bic r2, r0
	str r2, [r1, r3]
	ldr r1, [r6, r5]
	mov r0, #3
	bic r1, r0
	str r1, [r6, r5]
	mov r1, #0xbf
	add r0, r1, #0
	add r0, #0x65
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x75
	bl BattleScriptGotoSubscript
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02242306:
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x1e
	beq _0224233A
	add r2, r1, #0
	sub r2, #0xc
	lsl r7, r0, #2
	add r3, r4, r2
	ldr r2, [r3, r7]
	ldr r0, _0224237C ; =0xFFFFFBFF
	and r0, r2
	str r0, [r3, r7]
	ldr r2, [r6, r5]
	mov r0, #0xc
	bic r2, r0
	add r0, r1, #0
	str r2, [r6, r5]
	sub r0, #0x42
	sub r1, #0xa4
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x75
	bl BattleScriptGotoSubscript
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224233A:
	add r2, r1, #0
	sub r2, #0xc
	add r2, r4, r2
	lsl r0, r0, #2
	ldr r6, [r2, r0]
	mov r5, #0x80
	add r3, r6, #0
	tst r3, r5
	beq _02242366
	mov r3, #0x80
	bic r6, r3
	str r6, [r2, r0]
	sub r1, #0xa
	add r5, #0xa4
	str r1, [r4, r5]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x75
	bl BattleScriptGotoSubscript
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02242366:
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02242374: .word 0x00002DB0
_02242378: .word 0xFFFF1FFF
_0224237C: .word 0xFFFFFBFF
	thumb_func_end BtlCmd_RapidSpin

	thumb_func_start BtlCmd_ChangeWeatherBasedHPRecovery
BtlCmd_ChangeWeatherBasedHPRecovery: ; 0x02242380
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	ldr r0, _02242418 ; =0x000080FF
	tst r0, r1
	beq _022423C2
	mov r0, #0xd
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _022423C2
	mov r0, #0x4c
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	beq _022423D6
_022423C2:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0224241C ; =0x00002D90
	ldr r0, [r1, r0]
	lsr r1, r0, #1
	ldr r0, _02242420 ; =0x0000215C
	str r1, [r4, r0]
	b _02242412
_022423D6:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #0x30
	tst r0, r1
	ldr r1, [r4, #0x64]
	beq _022423FE
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0224241C ; =0x00002D90
	ldr r1, [r1, r0]
	mov r0, #0x14
	mul r0, r1
	mov r1, #0x1e
	bl ov12_02253178
	ldr r1, _02242420 ; =0x0000215C
	str r0, [r4, r1]
	b _02242412
_022423FE:
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0224241C ; =0x00002D90
	ldr r0, [r1, r0]
	mov r1, #4
	bl ov12_02253178
	ldr r1, _02242420 ; =0x0000215C
	str r0, [r4, r1]
_02242412:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02242418: .word 0x000080FF
_0224241C: .word 0x00002D90
_02242420: .word 0x0000215C
	thumb_func_end BtlCmd_ChangeWeatherBasedHPRecovery

	thumb_func_start BtlCmd_HiddenPowerDamageCalc
BtlCmd_HiddenPowerDamageCalc: ; 0x02242424
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r0, _02242504 ; =0x00002D54
	ldr r1, [r4, #0x64]
	add r3, r4, r0
	mov r0, #0xc0
	mul r0, r1
	ldr r1, [r3, r0]
	mov r5, #2
	lsl r0, r1, #2
	lsr r0, r0, #0x1b
	and r0, r5
	lsl r2, r0, #4
	lsl r0, r1, #7
	lsr r0, r0, #0x1b
	and r0, r5
	lsl r7, r0, #3
	lsl r0, r1, #0xc
	lsr r0, r0, #0x1b
	and r0, r5
	lsl r0, r0, #2
	mov ip, r0
	lsl r0, r1, #0x11
	lsr r0, r0, #0x1b
	and r0, r5
	lsl r6, r0, #1
	lsl r0, r1, #0x1b
	lsr r0, r0, #0x1b
	lsl r1, r1, #0x16
	and r0, r5
	lsr r1, r1, #0x1b
	lsr r0, r0, #1
	and r1, r5
	orr r0, r1
	add r1, r6, #0
	orr r1, r0
	mov r0, ip
	orr r0, r1
	orr r0, r7
	add r1, r2, #0
	orr r1, r0
	ldr r0, _02242508 ; =0x00002154
	str r1, [r4, r0]
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r5, [r3, r0]
	lsl r0, r5, #2
	lsr r0, r0, #0x1b
	lsl r0, r0, #0x1f
	lsr r6, r0, #0x1a
	lsl r0, r5, #7
	lsr r0, r0, #0x1b
	lsl r0, r0, #0x1f
	lsr r3, r0, #0x1b
	lsl r0, r5, #0xc
	lsr r0, r0, #0x1b
	lsl r0, r0, #0x1f
	lsr r2, r0, #0x1c
	lsl r0, r5, #0x11
	lsr r0, r0, #0x1b
	lsl r0, r0, #0x1f
	lsr r7, r0, #0x1d
	lsl r0, r5, #0x1b
	lsr r1, r0, #0x1b
	mov r0, #1
	and r0, r1
	lsl r1, r5, #0x16
	lsr r1, r1, #0x1b
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1e
	orr r0, r1
	orr r0, r7
	orr r0, r2
	orr r0, r3
	add r1, r6, #0
	orr r1, r0
	ldr r0, _02242508 ; =0x00002154
	add r0, #0xc
	str r1, [r4, r0]
	ldr r0, _02242508 ; =0x00002154
	ldr r1, [r4, r0]
	mov r0, #0x28
	mul r0, r1
	mov r1, #0x3f
	bl _s32_div_f
	ldr r1, _02242508 ; =0x00002154
	add r0, #0x1e
	str r0, [r4, r1]
	add r1, #0xc
	ldr r1, [r4, r1]
	mov r0, #0xf
	mul r0, r1
	mov r1, #0x3f
	bl _s32_div_f
	add r1, r0, #1
	ldr r0, _0224250C ; =0x00002160
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #9
	blt _022424FE
	add r1, r1, #1
	str r1, [r4, r0]
_022424FE:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02242504: .word 0x00002D54
_02242508: .word 0x00002154
_0224250C: .word 0x00002160
	thumb_func_end BtlCmd_HiddenPowerDamageCalc

	thumb_func_start BtlCmd_PsychUp
BtlCmd_PsychUp: ; 0x02242510
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r2, _02242568 ; =0x00002D58
	mov r1, #0
	mov r3, #0xc0
	add r5, r2, #0
_02242524:
	ldr r6, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r6
	ldr r6, [r4, #0x64]
	add r0, r4, r0
	add r0, r1, r0
	add r7, r6, #0
	mul r7, r3
	add r6, r4, r7
	add r6, r1, r6
	ldrsb r0, [r0, r2]
	add r1, r1, #1
	cmp r1, #8
	strb r0, [r6, r5]
	blt _02242524
	ldr r0, [r4, #0x64]
	ldr r6, [r4, #0x6c]
	mov r3, #0xc0
	add r1, r0, #0
	ldr r5, _0224256C ; =0x00002DB0
	mul r1, r3
	mul r3, r6
	add r2, r4, r5
	add r3, r4, r3
	ldr r4, [r3, r5]
	mov r3, #1
	lsl r3, r3, #0x14
	ldr r0, [r2, r1]
	and r3, r4
	orr r0, r3
	str r0, [r2, r1]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02242568: .word 0x00002D58
_0224256C: .word 0x00002DB0
	thumb_func_end BtlCmd_PsychUp

	thumb_func_start BtlCmd_TryFutureSight
BtlCmd_TryFutureSight: ; 0x02242570
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	ldr r1, [r4, #0x6c]
	add r2, r0, #0
	mov r0, #0x62
	add r3, r4, r1
	lsl r0, r0, #2
	ldrb r0, [r3, r0]
	cmp r0, #0
	bne _02242648
	add r0, r7, #0
	bl ov12_0223AB1C
	mov r1, #0x6f
	lsl r1, r1, #2
	lsl r3, r0, #2
	add r5, r4, r1
	ldr r2, [r5, r3]
	mov r0, #0x10
	orr r0, r2
	str r0, [r5, r3]
	ldr r0, [r4, #0x6c]
	add r2, r1, #0
	add r6, r4, r0
	sub r2, #0x34
	mov r0, #3
	strb r0, [r6, r2]
	ldr r0, _02242658 ; =0x00003044
	ldr r6, [r4, r0]
	ldr r0, [r4, #0x6c]
	lsl r0, r0, #1
	add r2, r4, r0
	add r0, r1, #0
	sub r0, #0x2c
	strh r6, [r2, r0]
	ldr r2, [r4, #0x6c]
	ldr r0, [r4, #0x64]
	lsl r2, r2, #2
	add r2, r4, r2
	sub r1, #0x24
	str r0, [r2, r1]
	mov r0, #3
	lsl r0, r0, #7
	ldr r0, [r4, r0]
	ldr r2, _02242658 ; =0x00003044
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #0x64]
	add r1, r4, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x6c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r2, [r4, r2]
	ldr r3, [r5, r3]
	add r0, r7, #0
	bl ov12_02256FF8
	mov r1, #0
	add r2, r0, #0
	mvn r1, r1
	mul r2, r1
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_02257C30
	ldr r1, [r4, #0x6c]
	lsl r1, r1, #2
	add r2, r4, r1
	mov r1, #0x6a
	lsl r1, r1, #2
	str r0, [r2, r1]
	ldr r0, [r4, #0x64]
	lsl r0, r0, #6
	add r2, r4, r0
	add r0, r1, #0
	add r0, #0x2c
	ldr r0, [r2, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	beq _02242650
	ldr r0, [r4, #0x6c]
	add r5, r4, r1
	lsl r4, r0, #2
	ldr r1, [r5, r4]
	mov r0, #0xf
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	str r0, [r5, r4]
	b _02242650
_02242648:
	add r0, r4, #0
	add r1, r2, #0
	bl BattleScriptIncrementPointer
_02242650:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02242658: .word 0x00003044
	thumb_func_end BtlCmd_TryFutureSight

	thumb_func_start BtlCmd_CheckHitRate
BtlCmd_CheckHitRate: ; 0x0224265C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	str r0, [sp, #4]
	add r0, r4, #0
	bl BattleScriptReadWord
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl GetBattlerIDBySide
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl GetBattlerIDBySide
	add r6, r0, #0
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_022480F0
	str r0, [sp]
	ldr r2, [sp, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r6, #0
	bl ov12_02248714
	ldr r0, _022426D4 ; =0x0000216C
	ldr r1, [r4, r0]
	ldr r0, _022426D8 ; =0x001FD849
	tst r0, r1
	beq _022426CC
	ldr r1, [sp, #8]
	add r0, r4, #0
	bl BattleScriptIncrementPointer
_022426CC:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022426D4: .word 0x0000216C
_022426D8: .word 0x001FD849
	thumb_func_end BtlCmd_CheckHitRate

	thumb_func_start BtlCmd_TryTeleport
BtlCmd_TryTeleport: ; 0x022426DC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	ldr r2, [r4, #0x64]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl ov12_02252980
	cmp r0, #0
	beq _0224270A
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_0224270A:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_TryTeleport

	thumb_func_start BtlCmd_BeatUpDamageCalc
BtlCmd_BeatUpDamageCalc: ; 0x02242710
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r1, [r5, #0x64]
	add r0, r7, #0
	bl ov12_0223A834
	ldr r1, _02242948 ; =0x0000217D
	str r0, [sp]
	ldrb r0, [r5, r1]
	cmp r0, #0
	bne _022427A4
	mov r0, #2
	strb r0, [r5, r1]
	add r0, r1, #0
	mov r2, #0xfd
	add r0, #0xb
	str r2, [r5, r0]
	mov r2, #0
	add r0, r1, #2
	strb r2, [r5, r0]
	add r6, r1, #2
_02242746:
	ldr r2, _0224294C ; =0x0000217F
	ldr r1, [r5, #0x64]
	ldrb r2, [r5, r2]
	add r0, r7, #0
	bl ov12_0223A880
	ldr r1, _0224294C ; =0x0000217F
	add r4, r0, #0
	ldrb r3, [r5, r1]
	ldr r1, [r5, #0x64]
	add r2, r5, r1
	ldr r1, _02242950 ; =0x0000219C
	ldrb r1, [r2, r1]
	cmp r3, r1
	beq _022427A4
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0224279C
	add r0, r4, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0224279C
	add r0, r4, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _02242954 ; =0x000001EE
	cmp r0, r1
	beq _0224279C
	add r0, r4, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _022427A4
_0224279C:
	ldrb r0, [r5, r6]
	add r0, r0, #1
	strb r0, [r5, r6]
	b _02242746
_022427A4:
	ldr r2, _0224294C ; =0x0000217F
	ldr r1, [r5, #0x64]
	ldrb r2, [r5, r2]
	add r0, r7, #0
	bl ov12_0223A880
	add r4, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	ldr r0, [sp, #4]
	add r1, r6, #0
	mov r2, #1
	bl GetMonBaseStat_HandleAlternateForme
	ldr r1, _02242958 ; =0x00002144
	ldr r2, _0224295C ; =0x00003044
	str r0, [r5, r1]
	ldr r2, [r5, r2]
	ldr r0, [r5, r1]
	lsl r2, r2, #4
	add r3, r5, r2
	ldr r2, _02242960 ; =0x000003E1
	ldrb r2, [r3, r2]
	mul r2, r0
	str r2, [r5, r1]
	lsl r0, r4, #1
	mov r1, #5
	bl _s32_div_f
	ldr r1, _02242958 ; =0x00002144
	add r0, r0, #2
	ldr r2, [r5, r1]
	mul r0, r2
	str r0, [r5, r1]
	ldr r1, [r5, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	mov r1, #0xb5
	add r2, r5, r0
	lsl r1, r1, #6
	ldrh r0, [r2, r1]
	add r1, #0x26
	ldrb r1, [r2, r1]
	mov r2, #2
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1b
	bl GetMonBaseStat_HandleAlternateForme
	add r1, r0, #0
	ldr r0, _02242958 ; =0x00002144
	ldr r0, [r5, r0]
	bl _u32_div_f
	ldr r1, _02242958 ; =0x00002144
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #0x32
	bl _s32_div_f
	ldr r1, _02242958 ; =0x00002144
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	add r0, r0, #2
	str r0, [r5, r1]
	add r0, r1, #0
	add r0, #0xc
	ldr r2, [r5, r1]
	ldr r0, [r5, r0]
	mul r0, r2
	str r0, [r5, r1]
	ldr r0, [r5, #0x64]
	lsl r0, r0, #6
	add r2, r5, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	beq _02242870
	ldr r1, [r5, r1]
	mov r0, #0xf
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	ldr r1, _02242958 ; =0x00002144
	str r0, [r5, r1]
_02242870:
	ldr r2, _02242958 ; =0x00002144
	add r0, r7, #0
	ldr r2, [r5, r2]
	add r1, r5, #0
	bl ov12_02257C30
	ldr r1, _02242958 ; =0x00002144
	str r0, [r5, r1]
	mov r0, #0
	ldr r2, [r5, r1]
	mvn r0, r0
	mul r0, r2
	str r0, [r5, r1]
	add r0, r5, #0
	add r3, r1, #0
	ldr r2, _02242964 ; =0x000001E1
	add r0, #0xf6
	strh r2, [r0]
	add r0, r5, #0
	mov r2, #2
	add r0, #0xf5
	strb r2, [r0]
	add r3, #0x3b
	ldrb r3, [r5, r3]
	ldr r0, [r5, #0x64]
	add r6, r1, #0
	lsl r3, r3, #8
	orr r3, r0
	add r0, r5, #0
	add r0, #0xf8
	str r3, [r0]
	add r0, r1, #0
	add r0, #0x3b
	ldrb r0, [r5, r0]
	add r6, #0x3b
	add r3, r0, #1
	add r0, r1, #0
	add r0, #0x3b
	strb r3, [r5, r0]
	add r0, r1, #0
	add r0, #0x38
	strb r2, [r5, r0]
	add r0, r1, #0
	add r0, #0x3b
	ldrb r2, [r5, r0]
	ldr r0, [sp]
	cmp r2, r0
	bge _0224293A
_022428D0:
	ldr r1, [r5, #0x64]
	add r0, r7, #0
	bl ov12_0223A880
	ldr r1, _0224294C ; =0x0000217F
	add r4, r0, #0
	ldrb r3, [r5, r1]
	ldr r1, [r5, #0x64]
	add r2, r5, r1
	ldr r1, _02242950 ; =0x0000219C
	ldrb r1, [r2, r1]
	cmp r3, r1
	beq _02242940
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02242922
	add r0, r4, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02242922
	add r0, r4, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _02242954 ; =0x000001EE
	cmp r0, r1
	beq _02242922
	add r0, r4, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02242940
_02242922:
	ldrb r0, [r5, r6]
	add r0, r0, #1
	strb r0, [r5, r6]
	ldr r0, _0224294C ; =0x0000217F
	ldrb r2, [r5, r0]
	ldr r0, [sp]
	cmp r2, r0
	blt _022428D0
	ldr r0, _02242968 ; =0x0000217C
	mov r1, #1
	strb r1, [r5, r0]
	b _02242940
_0224293A:
	mov r0, #1
	add r1, #0x38
	strb r0, [r5, r1]
_02242940:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02242948: .word 0x0000217D
_0224294C: .word 0x0000217F
_02242950: .word 0x0000219C
_02242954: .word 0x000001EE
_02242958: .word 0x00002144
_0224295C: .word 0x00003044
_02242960: .word 0x000003E1
_02242964: .word 0x000001E1
_02242968: .word 0x0000217C
	thumb_func_end BtlCmd_BeatUpDamageCalc

	thumb_func_start BtlCmd_FollowMe
BtlCmd_FollowMe: ; 0x0224296C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r1, [r4, #0x64]
	add r0, r5, #0
	bl ov12_0223AB1C
	mov r1, #0x71
	lsl r1, r1, #2
	mov r2, #1
	add r1, r4, r1
	lsl r0, r0, #3
	ldr r3, [r1, r0]
	lsl r2, r2, #0x14
	orr r2, r3
	str r2, [r1, r0]
	ldr r3, [r1, r0]
	ldr r2, _022429A8 ; =0xFF9FFFFF
	and r3, r2
	ldr r2, [r4, #0x64]
	lsl r2, r2, #0x1e
	lsr r2, r2, #9
	orr r2, r3
	str r2, [r1, r0]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022429A8: .word 0xFF9FFFFF
	thumb_func_end BtlCmd_FollowMe

	thumb_func_start BtlCmd_TryHelpingHand
BtlCmd_TryHelpingHand: ; 0x022429AC
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r4, #0
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	beq _02242A36
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0x10
	bl GetBattlerIDBySide
	add r4, r0, #0
	bl MaskOfFlagNo
	ldr r1, _02242A44 ; =0x00003108
	ldrb r1, [r5, r1]
	tst r0, r1
	bne _02242A2C
	lsl r0, r4, #4
	add r1, r5, r0
	ldr r0, _02242A48 ; =0x000021A8
	ldr r0, [r1, r0]
	cmp r0, #0x28
	beq _02242A2C
	mov r0, #0xc0
	mul r0, r4
	add r1, r5, r0
	ldr r0, _02242A4C ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02242A2C
	ldr r0, [r5, #0x64]
	mov r2, #0x75
	lsl r0, r0, #6
	add r0, r5, r0
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bne _02242A2C
	add r1, r5, r2
	lsl r0, r4, #6
	ldr r3, [r1, r0]
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x1f
	bne _02242A2C
	sub r2, #0xbc
	str r4, [r5, r2]
	ldr r3, [r1, r0]
	mov r2, #8
	orr r2, r3
	str r2, [r1, r0]
	b _02242A3E
_02242A2C:
	add r0, r5, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
	b _02242A3E
_02242A36:
	add r0, r5, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_02242A3E:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02242A44: .word 0x00003108
_02242A48: .word 0x000021A8
_02242A4C: .word 0x00002D8C
	thumb_func_end BtlCmd_TryHelpingHand

	thumb_func_start BtlCmd_TryTrick
BtlCmd_TryTrick: ; 0x02242A50
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov12_0223A7E0
	str r0, [sp, #8]
	ldr r1, [r4, #0x64]
	add r0, r5, #0
	bl ov12_0223AB1C
	str r0, [sp]
	ldr r1, [r4, #0x6c]
	add r0, r5, #0
	bl ov12_0223AB1C
	add r7, r0, #0
	ldr r1, [r4, #0x64]
	add r0, r5, #0
	bl ov12_0223AB1C
	cmp r0, #0
	beq _02242AAA
	ldr r0, [sp, #8]
	mov r1, #0x84
	tst r0, r1
	bne _02242AAA
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
	b _02242B48
_02242AAA:
	ldr r0, [r4, #0x64]
	add r1, r4, r0
	ldr r0, _02242B50 ; =0x0000219C
	ldrb r0, [r1, r0]
	bl MaskOfFlagNo
	ldr r1, [sp]
	lsl r1, r1, #3
	add r2, r4, r1
	mov r1, #0x71
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	lsl r1, r1, #3
	lsr r1, r1, #0x1a
	tst r0, r1
	bne _02242AE8
	ldr r0, [r4, #0x6c]
	add r1, r4, r0
	ldr r0, _02242B50 ; =0x0000219C
	ldrb r0, [r1, r0]
	bl MaskOfFlagNo
	lsl r1, r7, #3
	add r2, r4, r1
	mov r1, #0x71
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	lsl r1, r1, #3
	lsr r1, r1, #0x1a
	tst r0, r1
	beq _02242AF2
_02242AE8:
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
	b _02242B48
_02242AF2:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	add r3, r4, r2
	ldr r2, _02242B54 ; =0x00002DB8
	ldrh r3, [r3, r2]
	cmp r3, #0
	bne _02242B10
	ldr r3, [r4, #0x6c]
	mul r0, r3
	add r0, r4, r0
	ldrh r0, [r0, r2]
	cmp r0, #0
	beq _02242B26
_02242B10:
	add r0, r4, #0
	bl ov12_0225275C
	cmp r0, #0
	beq _02242B26
	ldr r1, [r4, #0x6c]
	add r0, r4, #0
	bl ov12_0225275C
	cmp r0, #0
	bne _02242B30
_02242B26:
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
	b _02242B48
_02242B30:
	ldr r1, [r4, #0x64]
	ldr r2, [r4, #0x6c]
	add r0, r4, #0
	mov r3, #0x3c
	bl CheckBattlerAbilityIfNotIgnored
	cmp r0, #1
	bne _02242B48
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl BattleScriptIncrementPointer
_02242B48:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02242B50: .word 0x0000219C
_02242B54: .word 0x00002DB8
	thumb_func_end BtlCmd_TryTrick

	thumb_func_start BtlCmd_TryWish
BtlCmd_TryWish: ; 0x02242B58
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	mov r2, #0x63
	lsl r2, r2, #2
	ldr r3, [r4, #0x64]
	add r5, r4, r2
	add r1, r0, #0
	ldrb r0, [r5, r3]
	cmp r0, #0
	beq _02242B82
	add r0, r4, #0
	bl BattleScriptIncrementPointer
	b _02242B92
_02242B82:
	mov r0, #2
	strb r0, [r5, r3]
	ldr r0, [r4, #0x64]
	add r2, #0x2c
	add r1, r4, r0
	ldr r0, _02242B98 ; =0x0000219C
	ldrb r0, [r1, r0]
	strb r0, [r1, r2]
_02242B92:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02242B98: .word 0x0000219C
	thumb_func_end BtlCmd_TryWish

	thumb_func_start BtlCmd_TryAssist
BtlCmd_TryAssist: ; 0x02242B9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	str r0, [sp]
	str r1, [sp, #4]
	add r0, r1, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r0, [sp, #4]
	bl BattleScriptReadWord
	ldr r1, [sp, #4]
	str r0, [sp, #0x14]
	ldr r0, [sp]
	ldr r1, [r1, #0x64]
	mov r7, #0
	bl ov12_0223A834
	str r0, [sp, #0xc]
	add r0, r7, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _02242C4A
	add r5, sp, #0x18
_02242BCE:
	ldr r0, [sp, #4]
	ldr r1, [r0, #0x64]
	add r2, r0, r1
	ldr r0, _02242C78 ; =0x0000219C
	ldrb r2, [r2, r0]
	ldr r0, [sp, #0x10]
	cmp r0, r2
	beq _02242C3E
	ldr r0, [sp]
	ldr r2, [sp, #0x10]
	bl ov12_0223A880
	mov r1, #0xae
	mov r2, #0
	str r0, [sp, #8]
	bl GetMonData
	cmp r0, #0
	beq _02242C3E
	ldr r0, [sp, #8]
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _02242C7C ; =0x000001EE
	cmp r0, r1
	beq _02242C3E
	mov r4, #0
_02242C06:
	add r1, r4, #0
	ldr r0, [sp, #8]
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r6, #0
	bl ov12_02252698
	cmp r0, #0
	bne _02242C38
	ldr r1, [sp, #4]
	ldr r0, [sp]
	add r2, r1, #0
	ldr r2, [r2, #0x64]
	add r3, r6, #0
	bl ov12_02257DA4
	cmp r0, #1
	bne _02242C38
	strh r6, [r5]
	add r5, r5, #2
	add r7, r7, #1
_02242C38:
	add r4, r4, #1
	cmp r4, #4
	blt _02242C06
_02242C3E:
	ldr r0, [sp, #0x10]
	add r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _02242BCE
_02242C4A:
	cmp r7, #0
	beq _02242C6A
	ldr r0, [sp]
	bl BattleSys_Random
	add r1, r7, #0
	bl _s32_div_f
	lsl r1, r1, #1
	add r0, sp, #0x18
	ldrh r2, [r0, r1]
	mov r1, #0x49
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	str r2, [r0, r1]
	b _02242C72
_02242C6A:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x14]
	bl BattleScriptIncrementPointer
_02242C72:
	mov r0, #0
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02242C78: .word 0x0000219C
_02242C7C: .word 0x000001EE
	thumb_func_end BtlCmd_TryAssist

	thumb_func_start BtlCmd_TrySetMagicCoat
BtlCmd_TrySetMagicCoat: ; 0x02242C80
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r6, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r5, #0
	mov r4, #0
	bl BattleSys_GetMaxBattlers
	cmp r0, #0
	ble _02242CAE
_02242CA2:
	add r0, r5, #0
	add r4, r4, #1
	bl BattleSys_GetMaxBattlers
	cmp r4, r0
	blt _02242CA2
_02242CAE:
	ldr r0, _02242CD8 ; =0x00003150
	ldr r0, [r6, r0]
	cmp r0, #1
	bne _02242CC0
	add r0, r6, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
	b _02242CD2
_02242CC0:
	mov r0, #0x75
	lsl r0, r0, #2
	add r3, r6, r0
	ldr r0, [r6, #0x64]
	lsl r2, r0, #6
	ldr r1, [r3, r2]
	mov r0, #0x10
	orr r0, r1
	str r0, [r3, r2]
_02242CD2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02242CD8: .word 0x00003150
	thumb_func_end BtlCmd_TrySetMagicCoat

	thumb_func_start BtlCmd_MagicCoat
BtlCmd_MagicCoat: ; 0x02242CDC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r1, [r5, #0x64]
	add r0, r6, #0
	bl ov12_0223AB1C
	add r1, r5, #0
	ldr r4, [r5, #0x64]
	add r1, #0x84
	str r4, [r1]
	ldr r1, [r5, #0x6c]
	lsl r0, r0, #3
	str r1, [r5, #0x64]
	mov r1, #0x71
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r0, [r1, r0]
	lsl r1, r0, #0xb
	lsr r1, r1, #0x1f
	beq _02242D26
	lsl r0, r0, #9
	lsr r0, r0, #0x1e
	mov r1, #0xc0
	mul r1, r0
	add r2, r5, r1
	ldr r1, _02242D84 ; =0x00002D8C
	ldr r1, [r2, r1]
	cmp r1, #0
	beq _02242D26
	str r0, [r5, #0x6c]
	b _02242D72
_02242D26:
	ldr r0, _02242D88 ; =0x00003044
	ldr r3, [r5, r0]
	lsl r0, r3, #4
	add r1, r5, r0
	ldr r0, _02242D8C ; =0x000003E6
	ldrh r0, [r1, r0]
	cmp r0, #4
	beq _02242D3A
	cmp r0, #8
	bne _02242D3E
_02242D3A:
	str r4, [r5, #0x6c]
	b _02242D72
_02242D3E:
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	lsl r3, r3, #0x10
	ldr r2, [r5, #0x64]
	add r0, r6, #0
	add r1, r5, #0
	lsr r3, r3, #0x10
	bl ov12_022506D4
	mov r1, #0xb5
	lsl r1, r1, #2
	add r2, r5, r1
	mov r1, #0x1c
	mul r1, r0
	ldr r1, [r2, r1]
	lsl r2, r1, #0x1e
	lsr r2, r2, #0x1f
	bne _02242D6C
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	beq _02242D70
_02242D6C:
	str r0, [r5, #0x6c]
	b _02242D72
_02242D70:
	str r4, [r5, #0x6c]
_02242D72:
	mov r1, #0x85
	lsl r1, r1, #6
	ldr r2, [r5, r1]
	mov r0, #8
	orr r0, r2
	str r0, [r5, r1]
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02242D84: .word 0x00002D8C
_02242D88: .word 0x00003044
_02242D8C: .word 0x000003E6
	thumb_func_end BtlCmd_MagicCoat

	thumb_func_start BtlCmd_RevengeDamageCalc
BtlCmd_RevengeDamageCalc: ; 0x02242D90
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x6c]
	lsl r4, r1, #6
	add r2, r5, r4
	lsl r1, r0, #2
	add r2, r2, r1
	mov r1, #0x76
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	cmp r1, #0
	beq _02242DC2
	bl MaskOfFlagNo
	mov r1, #0x7b
	add r2, r5, r4
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	tst r0, r1
	bne _02242DE8
_02242DC2:
	ldr r0, [r5, #0x6c]
	add r2, r5, r4
	lsl r1, r0, #2
	add r2, r2, r1
	mov r1, #0x1f
	lsl r1, r1, #4
	ldr r1, [r2, r1]
	cmp r1, #0
	beq _02242DF0
	bl MaskOfFlagNo
	ldr r1, [r5, #0x64]
	lsl r1, r1, #6
	add r2, r5, r1
	mov r1, #0x81
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	tst r0, r1
	beq _02242DF0
_02242DE8:
	ldr r0, _02242DFC ; =0x00002158
	mov r1, #0x14
	str r1, [r5, r0]
	b _02242DF6
_02242DF0:
	ldr r0, _02242DFC ; =0x00002158
	mov r1, #0xa
	str r1, [r5, r0]
_02242DF6:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02242DFC: .word 0x00002158
	thumb_func_end BtlCmd_RevengeDamageCalc

	thumb_func_start BtlCmd_TryBreakScreens
BtlCmd_TryBreakScreens: ; 0x02242E00
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	ldr r1, [r4, #0x6c]
	add r0, r5, #0
	bl ov12_0223AB1C
	lsl r1, r0, #2
	add r2, r4, r1
	mov r1, #0x6f
	lsl r1, r1, #2
	ldr r2, [r2, r1]
	mov r1, #1
	tst r1, r2
	bne _02242E34
	mov r1, #2
	tst r1, r2
	beq _02242E64
_02242E34:
	mov r5, #0x6f
	lsl r5, r5, #2
	add r2, r4, r5
	lsl r1, r0, #2
	ldr r6, [r2, r1]
	mov r3, #1
	bic r6, r3
	str r6, [r2, r1]
	ldr r6, [r2, r1]
	mov r3, #2
	bic r6, r3
	add r5, #8
	str r6, [r2, r1]
	lsl r2, r0, #3
	add r3, r4, r5
	ldr r1, [r3, r2]
	mov r0, #0x1c
	bic r1, r0
	str r1, [r3, r2]
	ldr r1, [r3, r2]
	ldr r0, _02242E70 ; =0xFFFFFC7F
	and r0, r1
	str r0, [r3, r2]
	b _02242E6C
_02242E64:
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_02242E6C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02242E70: .word 0xFFFFFC7F
	thumb_func_end BtlCmd_TryBreakScreens

	thumb_func_start BtlCmd_TryYawn
BtlCmd_TryYawn: ; 0x02242E74
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r1, r0, #0
	mov r0, #0xb7
	lsl r0, r0, #6
	add r3, r4, r0
	ldr r0, [r4, #0x6c]
	mov r5, #0xc0
	add r2, r0, #0
	mul r2, r5
	ldr r0, [r3, r2]
	lsl r5, r5, #5
	tst r5, r0
	beq _02242EA6
	add r0, r4, #0
	bl BattleScriptIncrementPointer
	b _02242EAE
_02242EA6:
	mov r1, #1
	lsl r1, r1, #0xc
	orr r0, r1
	str r0, [r3, r2]
_02242EAE:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_TryYawn

	thumb_func_start BtlCmd_TryKnockOff
BtlCmd_TryKnockOff: ; 0x02242EB4
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	ldr r1, [r5, #0x6c]
	add r0, r4, #0
	bl ov12_0223AB1C
	add r4, r0, #0
	ldr r2, [r5, #0x6c]
	mov r0, #0xc0
	mul r0, r2
	add r1, r5, r0
	ldr r0, _02242FC0 ; =0x00002DB8
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _02242F2E
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	mov r3, #0x3c
	bl CheckBattlerAbilityIfNotIgnored
	cmp r0, #1
	bne _02242F2E
	add r0, r5, #0
	ldr r1, _02242FC4 ; =0x000002CA
	add r0, #0xf6
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #0x25
	add r0, #0xf5
	strb r1, [r0]
	ldr r1, [r5, #0x6c]
	add r0, r5, #0
	bl ov12_022522E0
	add r1, r5, #0
	add r1, #0xf8
	str r0, [r1]
	ldr r0, [r5, #0x6c]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	ldr r0, _02242FC8 ; =0x00002D67
	add r2, r5, r2
	ldrb r2, [r2, r0]
	add r0, r5, #0
	add r0, #0xfc
	str r2, [r0]
	ldr r0, _02242FCC ; =0x00003044
	add r1, #0x40
	ldr r0, [r5, r0]
	str r0, [r5, r1]
	b _02242FBC
_02242F2E:
	ldr r1, [r5, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02242FC0 ; =0x00002DB8
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _02242FB4
	mov r1, #0x8a
	add r0, r5, #0
	lsl r1, r1, #2
	add r0, #0xf6
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #0x21
	add r0, #0xf5
	strb r1, [r0]
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl ov12_022522E0
	add r1, r5, #0
	add r1, #0xf8
	str r0, [r1]
	ldr r1, [r5, #0x6c]
	add r0, r5, #0
	bl ov12_022522E0
	add r1, r5, #0
	add r1, #0xfc
	str r0, [r1]
	ldr r0, [r5, #0x6c]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	add r0, r5, r2
	ldr r2, _02242FC0 ; =0x00002DB8
	ldrh r3, [r0, r2]
	add r0, r1, #0
	add r0, #0x40
	str r3, [r5, r0]
	ldr r3, [r5, #0x6c]
	mov r0, #0
	mul r1, r3
	add r1, r5, r1
	strh r0, [r1, r2]
	ldr r0, [r5, #0x6c]
	add r1, r5, r0
	ldr r0, _02242FD0 ; =0x0000219C
	ldrb r0, [r1, r0]
	bl MaskOfFlagNo
	mov r1, #0x71
	lsl r1, r1, #2
	add r3, r5, r1
	lsl r2, r4, #3
	ldr r4, [r3, r2]
	ldr r1, _02242FD4 ; =0xE07FFFFF
	and r1, r4
	lsl r4, r4, #3
	lsr r4, r4, #0x1a
	orr r0, r4
	lsl r0, r0, #0x1a
	lsr r0, r0, #3
	orr r0, r1
	str r0, [r3, r2]
	b _02242FBC
_02242FB4:
	add r0, r5, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_02242FBC:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02242FC0: .word 0x00002DB8
_02242FC4: .word 0x000002CA
_02242FC8: .word 0x00002D67
_02242FCC: .word 0x00003044
_02242FD0: .word 0x0000219C
_02242FD4: .word 0xE07FFFFF
	thumb_func_end BtlCmd_TryKnockOff

	thumb_func_start BtlCmd_EruptionDamageCalc
BtlCmd_EruptionDamageCalc: ; 0x02242FD8
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r0, _02243020 ; =0x00002154
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0224301C
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _02243024 ; =0x00003044
	ldr r1, [r4, r1]
	lsl r1, r1, #4
	add r2, r4, r1
	ldr r1, _02243028 ; =0x000003E1
	ldrb r3, [r2, r1]
	ldr r1, _0224302C ; =0x00002D8C
	add r2, r4, r0
	ldr r0, [r2, r1]
	add r1, r1, #4
	ldr r1, [r2, r1]
	mul r0, r3
	bl _u32_div_f
	ldr r1, _02243020 ; =0x00002154
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _0224301C
	mov r0, #1
	str r0, [r4, r1]
_0224301C:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02243020: .word 0x00002154
_02243024: .word 0x00003044
_02243028: .word 0x000003E1
_0224302C: .word 0x00002D8C
	thumb_func_end BtlCmd_EruptionDamageCalc

	thumb_func_start BtlCmd_TryImprison
BtlCmd_TryImprison: ; 0x02243030
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r1, #0
	str r0, [sp]
	add r0, r7, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r7, #0
	bl BattleScriptReadWord
	str r0, [sp, #0x14]
	ldr r0, [sp]
	ldr r1, [r7, #0x64]
	mov r2, #0
	bl ov12_0223ABB8
	add r4, r0, #0
	ldr r0, [sp]
	ldr r1, [r7, #0x64]
	mov r2, #2
	bl ov12_0223ABB8
	mov r6, #0xb7
	add r3, r0, #0
	lsl r6, r6, #6
	add r1, r4, #0
	mov r0, #0xc0
	mov r4, #1
	add r2, r7, r6
	mul r1, r0
	ldr r5, [r2, r1]
	lsl r4, r4, #0x1e
	orr r5, r4
	str r5, [r2, r1]
	add r1, r3, #0
	mul r1, r0
	ldr r3, [r2, r1]
	orr r3, r4
	str r3, [r2, r1]
	ldr r1, [r7, #0x64]
	mul r0, r1
	add r0, r7, r0
	ldr r2, [r0, r6]
	lsr r0, r4, #0x11
	tst r0, r2
	beq _02243098
	ldr r1, [sp, #0x14]
	add r0, r7, #0
	bl BattleScriptIncrementPointer
	b _0224313C
_02243098:
	ldr r0, [sp]
	bl ov12_0223AB1C
	str r0, [sp, #0x10]
	ldr r0, [sp]
	bl BattleSys_GetMaxBattlers
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r0, #0
	ble _02243112
	str r7, [sp, #4]
_022430B4:
	ldr r0, [sp]
	ldr r1, [sp, #0xc]
	bl ov12_0223AB1C
	ldr r1, [sp, #0x10]
	cmp r1, r0
	beq _02243100
	mov r2, #0
	ldr r0, _02243144 ; =0x00002D4C
	add r4, r2, #0
_022430C8:
	ldr r1, [r7, #0x64]
	mov r6, #0xc0
	mul r6, r1
	add r1, r7, r6
	add r6, r1, r4
	ldr r1, _02243144 ; =0x00002D4C
	ldr r5, [sp, #4]
	ldrh r6, [r6, r1]
	mov r3, #0
_022430DA:
	ldrh r1, [r5, r0]
	cmp r6, r1
	bne _022430E8
	cmp r6, #0
	beq _022430E8
	cmp r1, #0
	bne _022430F0
_022430E8:
	add r3, r3, #1
	add r5, r5, #2
	cmp r3, #4
	blt _022430DA
_022430F0:
	cmp r3, #4
	bne _022430FC
	add r2, r2, #1
	add r4, r4, #2
	cmp r2, #4
	blt _022430C8
_022430FC:
	cmp r3, #4
	bne _02243112
_02243100:
	ldr r0, [sp, #4]
	add r0, #0xc0
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r1, r0, #1
	ldr r0, [sp, #8]
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _022430B4
_02243112:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r1, r0
	bne _02243124
	ldr r1, [sp, #0x14]
	add r0, r7, #0
	bl BattleScriptIncrementPointer
	b _0224313C
_02243124:
	mov r0, #0xb7
	ldr r1, [r7, #0x64]
	lsl r0, r0, #6
	add r3, r7, r0
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	mov r0, #2
	ldr r1, [r3, r2]
	lsl r0, r0, #0xc
	orr r0, r1
	str r0, [r3, r2]
_0224313C:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02243144: .word 0x00002D4C
	thumb_func_end BtlCmd_TryImprison

	thumb_func_start BtlCmd_TryGrudge
BtlCmd_TryGrudge: ; 0x02243148
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	str r0, [sp]
	ldr r1, [r4, #0x6c]
	add r0, r7, #0
	bl ov12_0223AB1C
	ldr r5, [r4, #0x74]
	mov r0, #0xc0
	mul r0, r5
	add r1, r4, r0
	mov r0, #0xb7
	lsl r0, r0, #6
	ldr r1, [r1, r0]
	mov r0, #1
	lsl r0, r0, #0xe
	tst r0, r1
	beq _022431E0
	ldr r1, [r4, #0x64]
	add r0, r7, #0
	bl ov12_0223AB1C
	add r6, r0, #0
	add r0, r7, #0
	add r1, r5, #0
	bl ov12_0223AB1C
	cmp r6, r0
	beq _022431E0
	ldr r6, [r4, #0x64]
	mov r1, #0xc0
	add r0, r6, #0
	mul r0, r1
	ldr r2, _022431EC ; =0x00002D8C
	add r5, r4, r0
	ldr r0, [r5, r2]
	cmp r0, #0
	beq _022431E0
	mov r0, #0xc1
	lsl r0, r0, #6
	ldr r3, [r4, r0]
	cmp r3, #0xa5
	beq _022431E0
	lsl r3, r6, #1
	add r3, r4, r3
	add r0, #0x7c
	ldrh r0, [r3, r0]
	add r3, r2, #0
	mov r6, #0
	add r5, r5, r0
	sub r3, #0x20
	strb r6, [r5, r3]
	ldr r3, [r4, #0x64]
	lsl r0, r0, #1
	add r5, r3, #0
	mul r5, r1
	add r3, r4, r5
	add r0, r3, r0
	sub r2, #0x40
	ldrh r0, [r0, r2]
	add r1, #0x64
	str r0, [r4, r1]
	ldr r2, [r4, #0x64]
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_02250C40
	b _022431E8
_022431E0:
	ldr r1, [sp]
	add r0, r4, #0
	bl BattleScriptIncrementPointer
_022431E8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022431EC: .word 0x00002D8C
	thumb_func_end BtlCmd_TryGrudge

	thumb_func_start BtlCmd_TrySnatch
BtlCmd_TrySnatch: ; 0x022431F0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r6, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r5, #0
	mov r4, #0
	bl BattleSys_GetMaxBattlers
	cmp r0, #0
	ble _0224321E
_02243212:
	add r0, r5, #0
	add r4, r4, #1
	bl BattleSys_GetMaxBattlers
	cmp r4, r0
	blt _02243212
_0224321E:
	ldr r0, _02243248 ; =0x00003150
	ldr r0, [r6, r0]
	cmp r0, #1
	bne _02243230
	add r0, r6, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
	b _02243242
_02243230:
	mov r0, #0x75
	lsl r0, r0, #2
	add r3, r6, r0
	ldr r0, [r6, #0x64]
	lsl r2, r0, #6
	ldr r1, [r3, r2]
	mov r0, #0x20
	orr r0, r1
	str r0, [r3, r2]
_02243242:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02243248: .word 0x00003150
	thumb_func_end BtlCmd_TrySnatch

	thumb_func_start BtlCmd_LowKickDamageCalc
BtlCmd_LowKickDamageCalc: ; 0x0224324C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	mul r1, r2
	add r2, r4, r1
	ldr r1, _02243298 ; =0x00002D60
	ldr r5, _0224329C ; =ov12_0226C39C
	ldr r3, [r2, r1]
	ldr r1, _022432A0 ; =0x0000FFFF
	mov r0, #0
_0224326A:
	ldrh r2, [r5]
	cmp r2, r3
	bge _0224327A
	add r5, r5, #4
	ldrh r2, [r5]
	add r0, r0, #1
	cmp r2, r1
	bne _0224326A
_0224327A:
	lsl r2, r0, #2
	ldr r0, _0224329C ; =ov12_0226C39C
	ldrh r1, [r0, r2]
	ldr r0, _022432A0 ; =0x0000FFFF
	cmp r1, r0
	beq _0224328C
	ldr r0, _022432A4 ; =ov12_0226C39E
	ldrh r1, [r0, r2]
	b _0224328E
_0224328C:
	mov r1, #0x78
_0224328E:
	ldr r0, _022432A8 ; =0x00002154
	str r1, [r4, r0]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02243298: .word 0x00002D60
_0224329C: .word ov12_0226C39C
_022432A0: .word 0x0000FFFF
_022432A4: .word ov12_0226C39E
_022432A8: .word 0x00002154
	thumb_func_end BtlCmd_LowKickDamageCalc

	thumb_func_start BtlCmd_WeatherBallDamageCalc
BtlCmd_WeatherBallDamageCalc: ; 0x022432AC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	mov r0, #0xd
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _02243354
	mov r0, #0x4c
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _02243354
	mov r1, #6
	lsl r1, r1, #6
	ldr r2, [r4, r1]
	ldr r0, _02243358 ; =0x000080FF
	tst r0, r2
	ldr r0, _0224335C ; =0x00003044
	beq _02243346
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r2, r4, r0
	ldr r0, _02243360 ; =0x000003E1
	ldrb r0, [r2, r0]
	lsl r2, r0, #1
	ldr r0, _02243364 ; =0x00002154
	str r2, [r4, r0]
	ldr r2, [r4, r1]
	mov r1, #3
	tst r1, r2
	beq _0224330E
	mov r1, #0xb
	add r0, #0xc
	str r1, [r4, r0]
_0224330E:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #0xc
	tst r0, r1
	beq _02243320
	ldr r0, _02243368 ; =0x00002160
	mov r1, #5
	str r1, [r4, r0]
_02243320:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #0x30
	tst r0, r1
	beq _02243332
	ldr r0, _02243368 ; =0x00002160
	mov r1, #0xa
	str r1, [r4, r0]
_02243332:
	mov r0, #6
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #0xc0
	tst r0, r1
	beq _02243354
	ldr r0, _02243368 ; =0x00002160
	mov r1, #0xf
	str r1, [r4, r0]
	b _02243354
_02243346:
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _02243360 ; =0x000003E1
	ldrb r1, [r1, r0]
	ldr r0, _02243364 ; =0x00002154
	str r1, [r4, r0]
_02243354:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02243358: .word 0x000080FF
_0224335C: .word 0x00003044
_02243360: .word 0x000003E1
_02243364: .word 0x00002154
_02243368: .word 0x00002160
	thumb_func_end BtlCmd_WeatherBallDamageCalc

	thumb_func_start BtlCmd_TryPursuit
BtlCmd_TryPursuit: ; 0x0224336C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	str r0, [sp, #0x10]
	ldr r0, [sp]
	bl BattleSys_GetMaxBattlers
	mov r7, #0
	str r0, [sp, #0xc]
	cmp r0, #0
	bgt _02243394
	b _022434A6
_02243394:
	mov r0, #0xb5
	lsl r0, r0, #6
	add r0, r5, r0
	str r5, [sp, #8]
	add r4, r5, #0
	str r0, [sp, #4]
_022433A0:
	ldr r1, [sp, #8]
	ldr r0, _022434E8 ; =0x000021A8
	ldr r0, [r1, r0]
	cmp r0, #0x28
	beq _0224348E
	ldr r0, _022434EC ; =0x00002D8C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224348E
	ldr r0, _022434F0 ; =0x00002DAC
	ldr r1, [r4, r0]
	mov r0, #0x27
	tst r0, r1
	bne _0224348E
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_02252C40
	cmp r0, #0
	bne _0224348E
	ldr r0, [sp]
	add r1, r7, #0
	bl ov12_0223AB1C
	str r0, [sp, #0x14]
	ldr r0, [sp]
	ldr r1, [r5, #0x78]
	bl ov12_0223AB1C
	ldr r1, [sp, #0x14]
	cmp r1, r0
	beq _0224348E
	ldr r0, _022434F4 ; =0x00002DEC
	ldrh r6, [r4, r0]
	cmp r6, #0
	beq _022433F8
	add r0, r0, #2
	ldrh r0, [r4, r0]
	lsl r0, r0, #1
	add r1, r4, r0
	ldr r0, _022434F8 ; =0x00002D4C
	ldrh r0, [r1, r0]
	cmp r6, r0
	beq _02243402
_022433F8:
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_022522F0
	add r6, r0, #0
_02243402:
	cmp r6, #0
	beq _0224348E
	lsl r1, r6, #0x10
	ldr r0, [sp, #4]
	lsr r1, r1, #0x10
	bl ov12_02251C60
	str r0, [sp, #0x18]
	lsl r0, r6, #4
	add r1, r5, r0
	ldr r0, _022434FC ; =0x000003DE
	ldrh r0, [r1, r0]
	cmp r0, #0x80
	bne _0224348E
	ldr r0, [sp, #0x18]
	add r1, r4, r0
	ldr r0, _02243500 ; =0x00002D6C
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _0224348E
	ldr r0, _02243500 ; =0x00002D6C
	add r1, r5, r0
	mov r0, #0xc0
	mul r0, r7
	add r4, r1, r0
	ldr r0, [sp, #0x18]
	ldrb r0, [r4, r0]
	sub r1, r0, #1
	ldr r0, [sp, #0x18]
	strb r1, [r4, r0]
	ldr r1, [r5, #0x78]
	add r0, r5, #0
	bl GetBattlerAbility
	cmp r0, #0x2e
	bne _02243458
	ldr r0, [sp, #0x18]
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _02243458
	sub r1, r0, #1
	ldr r0, [sp, #0x18]
	strb r1, [r4, r0]
_02243458:
	ldr r0, [sp]
	add r1, r5, #0
	bl ov12_02252D14
	str r7, [r5, #0x64]
	ldr r0, [r5, #0x78]
	lsl r2, r7, #1
	str r0, [r5, #0x6c]
	ldr r1, _02243504 ; =0x00002158
	mov r0, #0x14
	str r0, [r5, r1]
	ldr r0, _02243508 ; =0x00003044
	add r2, r5, r2
	str r6, [r5, r0]
	add r0, #0x38
	strh r6, [r2, r0]
	lsl r0, r7, #4
	mov r2, #0x28
	add r0, r5, r0
	add r1, #0x50
	str r2, [r0, r1]
	ldr r0, [sp]
	add r1, r5, #0
	add r2, r7, #0
	bl ov12_02250C40
	b _022434A6
_0224348E:
	ldr r0, [sp, #8]
	add r7, r7, #1
	add r0, #0x10
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r4, #0xc0
	add r0, #0xc0
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	cmp r7, r0
	bge _022434A6
	b _022433A0
_022434A6:
	ldr r0, [sp, #0xc]
	cmp r7, r0
	bne _022434B6
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
	b _022434E2
_022434B6:
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl GetBattlerHeldItemEffect
	add r4, r0, #0
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	mov r2, #0
	bl ov12_02255844
	cmp r4, #0x37
	beq _022434D6
	cmp r4, #0x73
	beq _022434D6
	cmp r4, #0x7d
	bne _022434E2
_022434D6:
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0224350C ; =0x00002DF8
	strh r6, [r1, r0]
_022434E2:
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022434E8: .word 0x000021A8
_022434EC: .word 0x00002D8C
_022434F0: .word 0x00002DAC
_022434F4: .word 0x00002DEC
_022434F8: .word 0x00002D4C
_022434FC: .word 0x000003DE
_02243500: .word 0x00002D6C
_02243504: .word 0x00002158
_02243508: .word 0x00003044
_0224350C: .word 0x00002DF8
	thumb_func_end BtlCmd_TryPursuit

	thumb_func_start BtlCmd_TypeEffectivenessCheck
BtlCmd_TypeEffectivenessCheck: ; 0x02243510
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r0, [r4, #0x64]
	ldr r3, _02243550 ; =0x00002144
	str r0, [sp]
	ldr r0, [r4, #0x6c]
	ldr r2, _02243554 ; =0x00003044
	str r0, [sp, #4]
	ldr r0, [r4, r3]
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r3, #0
	add r0, #0x28
	add r0, r4, r0
	str r0, [sp, #0xc]
	add r3, #0x1c
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	add r0, r5, #0
	bl ov12_02251D28
	ldr r1, _02243550 ; =0x00002144
	str r0, [r4, r1]
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02243550: .word 0x00002144
_02243554: .word 0x00003044
	thumb_func_end BtlCmd_TypeEffectivenessCheck

	thumb_func_start BtlCmd_144
BtlCmd_144: ; 0x02243558
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #1
	mov r6, #0
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	str r0, [sp, #8]
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r5, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r2, [sp, #8]
	add r1, r4, #0
	bl GetBattlerIDBySide
	cmp r7, #6
	bhi _0224364A
	add r1, r7, r7
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022435A4: ; jump table
	.short _022435B2 - _022435A4 - 2 ; case 0
	.short _022435C8 - _022435A4 - 2 ; case 1
	.short _022435DE - _022435A4 - 2 ; case 2
	.short _022435F4 - _022435A4 - 2 ; case 3
	.short _0224360A - _022435A4 - 2 ; case 4
	.short _02243620 - _022435A4 - 2 ; case 5
	.short _02243636 - _022435A4 - 2 ; case 6
_022435B2:
	lsl r0, r0, #6
	add r1, r4, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r5, r0
	bne _0224364A
	mov r6, #1
	b _0224364A
_022435C8:
	lsl r0, r0, #6
	add r1, r4, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r5, r0
	bne _0224364A
	mov r6, #1
	b _0224364A
_022435DE:
	lsl r0, r0, #6
	add r1, r4, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	cmp r5, r0
	bne _0224364A
	mov r6, #1
	b _0224364A
_022435F4:
	lsl r0, r0, #6
	add r1, r4, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	cmp r5, r0
	bne _0224364A
	mov r6, #1
	b _0224364A
_0224360A:
	lsl r0, r0, #6
	add r1, r4, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	cmp r5, r0
	bne _0224364A
	mov r6, #1
	b _0224364A
_02243620:
	lsl r0, r0, #6
	add r1, r4, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	cmp r5, r0
	bne _0224364A
	mov r6, #1
	b _0224364A
_02243636:
	lsl r0, r0, #6
	add r1, r4, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	cmp r5, r0
	bne _0224364A
	mov r6, #1
_0224364A:
	cmp r6, #0
	beq _02243656
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl BattleScriptIncrementPointer
_02243656:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end BtlCmd_144

	thumb_func_start BtlCmd_145
BtlCmd_145: ; 0x0224365C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	str r0, [sp]
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r5, r0, #0
	ldr r2, [sp]
	add r0, r7, #0
	add r1, r4, #0
	bl GetBattlerIDBySide
	cmp r6, #6
	bhi _02243750
	add r1, r6, r6
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224369C: ; jump table
	.short _022436AA - _0224369C - 2 ; case 0
	.short _022436C2 - _0224369C - 2 ; case 1
	.short _022436DA - _0224369C - 2 ; case 2
	.short _022436F2 - _0224369C - 2 ; case 3
	.short _0224370A - _0224369C - 2 ; case 4
	.short _02243722 - _0224369C - 2 ; case 5
	.short _0224373A - _0224369C - 2 ; case 6
_022436AA:
	mov r1, #0x75
	lsl r1, r1, #2
	lsl r3, r0, #6
	add r1, r4, r1
	ldr r2, [r1, r3]
	mov r0, #1
	bic r2, r0
	mov r0, #1
	and r0, r5
	orr r0, r2
	str r0, [r1, r3]
	b _02243750
_022436C2:
	mov r1, #0x75
	lsl r1, r1, #2
	lsl r3, r0, #6
	add r1, r4, r1
	ldr r2, [r1, r3]
	mov r0, #2
	bic r2, r0
	lsl r0, r5, #0x1f
	lsr r0, r0, #0x1e
	orr r0, r2
	str r0, [r1, r3]
	b _02243750
_022436DA:
	mov r1, #0x75
	lsl r1, r1, #2
	lsl r3, r0, #6
	add r1, r4, r1
	ldr r2, [r1, r3]
	mov r0, #4
	bic r2, r0
	lsl r0, r5, #0x1f
	lsr r0, r0, #0x1d
	orr r0, r2
	str r0, [r1, r3]
	b _02243750
_022436F2:
	mov r1, #0x75
	lsl r1, r1, #2
	lsl r3, r0, #6
	add r1, r4, r1
	ldr r2, [r1, r3]
	mov r0, #8
	bic r2, r0
	lsl r0, r5, #0x1f
	lsr r0, r0, #0x1c
	orr r0, r2
	str r0, [r1, r3]
	b _02243750
_0224370A:
	mov r1, #0x75
	lsl r1, r1, #2
	lsl r3, r0, #6
	add r1, r4, r1
	ldr r2, [r1, r3]
	mov r0, #0x10
	bic r2, r0
	lsl r0, r5, #0x1f
	lsr r0, r0, #0x1b
	orr r0, r2
	str r0, [r1, r3]
	b _02243750
_02243722:
	mov r1, #0x75
	lsl r1, r1, #2
	lsl r3, r0, #6
	add r1, r4, r1
	ldr r2, [r1, r3]
	mov r0, #0x20
	bic r2, r0
	lsl r0, r5, #0x1f
	lsr r0, r0, #0x1a
	orr r0, r2
	str r0, [r1, r3]
	b _02243750
_0224373A:
	mov r1, #0x75
	lsl r1, r1, #2
	lsl r3, r0, #6
	add r1, r4, r1
	ldr r2, [r1, r3]
	mov r0, #0x40
	bic r2, r0
	lsl r0, r5, #0x1f
	lsr r0, r0, #0x19
	orr r0, r2
	str r0, [r1, r3]
_02243750:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BtlCmd_145

	thumb_func_start BtlCmd_GyroBallDamageCalc
BtlCmd_GyroBallDamageCalc: ; 0x02243754
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r0, [r4, #0x6c]
	ldr r1, _02243790 ; =0x000021F0
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r2, [r0, r1]
	mov r0, #0x19
	mul r0, r2
	ldr r2, [r4, #0x64]
	lsl r2, r2, #2
	add r2, r4, r2
	ldr r1, [r2, r1]
	bl _u32_div_f
	add r1, r0, #1
	ldr r0, _02243794 ; =0x00002154
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0x96
	ble _0224378A
	mov r1, #0x96
	str r1, [r4, r0]
_0224378A:
	mov r0, #0
	pop {r4, pc}
	nop
_02243790: .word 0x000021F0
_02243794: .word 0x00002154
	thumb_func_end BtlCmd_GyroBallDamageCalc

	thumb_func_start BtlCmd_MetalBurstDamageCalc
BtlCmd_MetalBurstDamageCalc: ; 0x02243798
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	str r0, [sp]
	ldr r1, [r5, #0x64]
	add r0, r6, #0
	bl ov12_0223AB1C
	ldr r1, [r5, #0x64]
	add r7, r0, #0
	lsl r1, r1, #6
	add r2, r5, r1
	mov r1, #0x83
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	add r0, r6, #0
	bl ov12_0223AB1C
	add r4, r0, #0
	ldr r0, [r5, #0x64]
	mov r2, #0x82
	lsl r0, r0, #6
	add r0, r5, r0
	lsl r2, r2, #2
	ldr r1, [r0, r2]
	cmp r1, #0
	beq _02243878
	cmp r7, r4
	beq _02243878
	add r2, r2, #4
	ldr r2, [r0, r2]
	mov r0, #0xc0
	mul r0, r2
	add r2, r5, r0
	ldr r0, _02243884 ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _02243878
	mov r0, #0xf
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	ldr r1, _02243888 ; =0x00002144
	str r0, [r5, r1]
	mov r0, #0x71
	lsl r0, r0, #2
	add r1, r5, r0
	lsl r0, r4, #3
	ldr r0, [r1, r0]
	lsl r1, r0, #0xb
	lsr r1, r1, #0x1f
	beq _02243826
	lsl r0, r0, #9
	lsr r0, r0, #0x1e
	mov r1, #0xc0
	mul r1, r0
	add r2, r5, r1
	ldr r1, _02243884 ; =0x00002D8C
	ldr r1, [r2, r1]
	cmp r1, #0
	beq _02243826
	str r0, [r5, #0x6c]
	b _02243834
_02243826:
	ldr r0, [r5, #0x64]
	lsl r0, r0, #6
	add r1, r5, r0
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	str r0, [r5, #0x6c]
_02243834:
	ldr r1, [r5, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02243884 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0224386C
	ldr r2, [r5, #0x64]
	add r0, r6, #0
	add r1, r5, #0
	bl ov12_02253DA0
	mov r1, #0xc0
	mul r1, r0
	str r0, [r5, #0x6c]
	ldr r0, _02243884 ; =0x00002D8C
	add r1, r5, r1
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0224386C
	mov r2, #0x27
	str r2, [r5, #0xc]
	add r0, r5, #0
	mov r1, #1
	add r2, #0xf2
	bl ov12_02245518
_0224386C:
	ldr r1, [r5, #0x64]
	ldr r2, [r5, #0x6c]
	add r0, r5, #0
	bl ov12_02258180
	b _02243880
_02243878:
	ldr r1, [sp]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
_02243880:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02243884: .word 0x00002D8C
_02243888: .word 0x00002144
	thumb_func_end BtlCmd_MetalBurstDamageCalc

	thumb_func_start BtlCmd_PaybackDamageCalc
BtlCmd_PaybackDamageCalc: ; 0x0224388C
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r0, [r4, #0x6c]
	ldr r1, _022438C8 ; =0x000021A8
	lsl r0, r0, #4
	add r0, r4, r0
	ldr r0, [r0, r1]
	cmp r0, #0x28
	ldr r0, _022438CC ; =0x00003044
	bne _022438B6
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r2, r4, r0
	ldr r0, _022438D0 ; =0x000003E1
	ldrb r0, [r2, r0]
	lsl r0, r0, #1
	b _022438C0
_022438B6:
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r2, r4, r0
	ldr r0, _022438D0 ; =0x000003E1
	ldrb r0, [r2, r0]
_022438C0:
	sub r1, #0x54
	str r0, [r4, r1]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_022438C8: .word 0x000021A8
_022438CC: .word 0x00003044
_022438D0: .word 0x000003E1
	thumb_func_end BtlCmd_PaybackDamageCalc

	thumb_func_start BtlCmd_TrumpCardDamageCalc
BtlCmd_TrumpCardDamageCalc: ; 0x022438D4
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r2, r4, r0
	lsl r0, r1, #1
	add r1, r4, r0
	ldr r0, _02243908 ; =0x000030BC
	ldrh r0, [r1, r0]
	add r1, r2, r0
	ldr r0, _0224390C ; =0x00002D6C
	ldrb r1, [r1, r0]
	cmp r1, #4
	bls _022438FC
	mov r1, #4
_022438FC:
	ldr r0, _02243910 ; =ov12_0226C2F0
	ldrb r1, [r0, r1]
	ldr r0, _02243914 ; =0x00002154
	str r1, [r4, r0]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02243908: .word 0x000030BC
_0224390C: .word 0x00002D6C
_02243910: .word ov12_0226C2F0
_02243914: .word 0x00002154
	thumb_func_end BtlCmd_TrumpCardDamageCalc

	thumb_func_start BtlCmd_WringOutDamageCalc
BtlCmd_WringOutDamageCalc: ; 0x02243918
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r3, r4, r0
	ldr r1, _02243948 ; =0x00002D8C
	mov r0, #0x78
	ldr r2, [r3, r1]
	add r1, r1, #4
	ldr r1, [r3, r1]
	mul r0, r2
	bl _u32_div_f
	add r1, r0, #1
	ldr r0, _0224394C ; =0x00002154
	str r1, [r4, r0]
	mov r0, #0
	pop {r4, pc}
	nop
_02243948: .word 0x00002D8C
_0224394C: .word 0x00002154
	thumb_func_end BtlCmd_WringOutDamageCalc

	thumb_func_start BtlCmd_TryMeFirst
BtlCmd_TryMeFirst: ; 0x02243950
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	ldr r1, [r5, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	ldr r3, _022439FC ; =0x00002DEC
	add r0, r5, r0
	ldrh r4, [r0, r3]
	cmp r4, #0
	beq _02243984
	add r2, r3, #2
	ldrh r2, [r0, r2]
	sub r3, #0xa0
	lsl r2, r2, #1
	add r0, r0, r2
	ldrh r0, [r0, r3]
	cmp r4, r0
	beq _0224398C
_02243984:
	add r0, r5, #0
	bl ov12_022522F0
	add r4, r0, #0
_0224398C:
	ldr r0, [r5, #0x6c]
	lsl r1, r0, #4
	add r2, r5, r1
	ldr r1, _02243A00 ; =0x000021A8
	ldr r1, [r2, r1]
	cmp r1, #0x28
	beq _022439F0
	lsl r0, r0, #6
	add r1, r5, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _022439F0
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02257E38
	cmp r0, #1
	bne _022439F0
	lsl r0, r4, #4
	add r1, r5, r0
	ldr r0, _02243A04 ; =0x000003E1
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _022439F0
	ldr r2, [r5, #0x64]
	ldr r3, _02243A08 ; =0x00002DCC
	add r0, r2, #0
	mov r6, #0xc0
	add r1, r5, r3
	mul r0, r6
	mov r2, #1
	ldr r7, [r1, r0]
	lsl r2, r2, #0x1e
	orr r2, r7
	str r2, [r1, r0]
	add r0, r6, #0
	add r0, #0xb4
	ldr r2, [r5, r0]
	ldr r0, [r5, #0x64]
	add r3, #0x10
	add r1, r0, #0
	mul r1, r6
	add r0, r5, r1
	str r2, [r0, r3]
	add r6, #0x64
	str r4, [r5, r6]
	b _022439F8
_022439F0:
	add r0, r5, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_022439F8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022439FC: .word 0x00002DEC
_02243A00: .word 0x000021A8
_02243A04: .word 0x000003E1
_02243A08: .word 0x00002DCC
	thumb_func_end BtlCmd_TryMeFirst

	thumb_func_start BtlCmd_TryCopycat
BtlCmd_TryCopycat: ; 0x02243A0C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	ldr r0, _02243A64 ; =0x00003048
	ldr r0, [r4, r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl ov12_02252698
	cmp r0, #0
	bne _02243A58
	ldr r0, _02243A64 ; =0x00003048
	ldr r3, [r4, r0]
	cmp r3, #0
	beq _02243A58
	lsl r3, r3, #0x10
	ldr r2, [r4, #0x64]
	add r0, r5, #0
	add r1, r4, #0
	lsr r3, r3, #0x10
	bl ov12_02257DA4
	cmp r0, #1
	bne _02243A58
	ldr r0, _02243A64 ; =0x00003048
	ldr r1, [r4, r0]
	mov r0, #0x49
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _02243A60
_02243A58:
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_02243A60:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02243A64: .word 0x00003048
	thumb_func_end BtlCmd_TryCopycat

	thumb_func_start BtlCmd_PunishmentDamageCalc
BtlCmd_PunishmentDamageCalc: ; 0x02243A68
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	ldr r5, _02243AB8 ; =0x00002D58
	mov r1, #0
	ldr r3, [r4, #0x6c]
	mov r2, #0xc0
	mul r2, r3
	add r3, r4, r2
	add r0, r1, #0
	add r2, r3, #0
	add r6, r5, #0
_02243A86:
	ldrsb r7, [r2, r6]
	cmp r7, #6
	ble _02243A94
	add r7, r3, r0
	ldrsb r7, [r7, r5]
	sub r7, r7, #6
	add r1, r1, r7
_02243A94:
	add r0, r0, #1
	add r2, r2, #1
	cmp r0, #8
	blt _02243A86
	mov r0, #0x14
	add r2, r1, #0
	mul r2, r0
	ldr r0, _02243ABC ; =0x00002154
	add r2, #0x3c
	str r2, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0xc8
	ble _02243AB2
	mov r1, #0xc8
	str r1, [r4, r0]
_02243AB2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02243AB8: .word 0x00002D58
_02243ABC: .word 0x00002154
	thumb_func_end BtlCmd_PunishmentDamageCalc

	thumb_func_start BtlCmd_TrySuckerPunch
BtlCmd_TrySuckerPunch: ; 0x02243AC0
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r4, r0, #0
	ldr r1, [r5, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	ldr r6, _02243B30 ; =0x00002DEC
	add r2, r5, r0
	ldrh r0, [r2, r6]
	cmp r0, #0
	beq _02243AF4
	add r3, r6, #2
	ldrh r3, [r2, r3]
	sub r6, #0xa0
	lsl r3, r3, #1
	add r2, r2, r3
	ldrh r2, [r2, r6]
	cmp r0, r2
	beq _02243AFA
_02243AF4:
	add r0, r5, #0
	bl ov12_022522F0
_02243AFA:
	ldr r1, [r5, #0x6c]
	lsl r2, r1, #4
	add r3, r5, r2
	ldr r2, _02243B34 ; =0x000021A8
	ldr r2, [r3, r2]
	cmp r2, #0x28
	beq _02243B24
	lsl r0, r0, #4
	add r2, r5, r0
	ldr r0, _02243B38 ; =0x000003E1
	ldrb r0, [r2, r0]
	cmp r0, #0
	bne _02243B2C
	lsl r0, r1, #6
	add r1, r5, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _02243B2C
_02243B24:
	add r0, r5, #0
	add r1, r4, #0
	bl BattleScriptIncrementPointer
_02243B2C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02243B30: .word 0x00002DEC
_02243B34: .word 0x000021A8
_02243B38: .word 0x000003E1
	thumb_func_end BtlCmd_TrySuckerPunch

	thumb_func_start BtlCmd_CheckSideCondition
BtlCmd_CheckSideCondition: ; 0x02243B3C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	str r0, [sp, #8]
	add r0, r4, #0
	bl BattleScriptReadWord
	str r0, [sp, #4]
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	str r0, [sp]
	ldr r2, [sp, #8]
	add r0, r7, #0
	add r1, r4, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	add r0, r7, #0
	bl ov12_0223AB1C
	ldr r1, [sp, #4]
	cmp r1, #0
	beq _02243B8E
	cmp r1, #1
	beq _02243B8E
	cmp r1, #2
	beq _02243C0C
	b _02243CE6
_02243B8E:
	cmp r6, #5
	bls _02243B94
	b _02243CE6
_02243B94:
	add r1, r6, r6
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02243BA0: ; jump table
	.short _02243BAC - _02243BA0 - 2 ; case 0
	.short _02243BBC - _02243BA0 - 2 ; case 1
	.short _02243BCC - _02243BA0 - 2 ; case 2
	.short _02243BDC - _02243BA0 - 2 ; case 3
	.short _02243BEC - _02243BA0 - 2 ; case 4
	.short _02243BFC - _02243BA0 - 2 ; case 5
_02243BAC:
	lsl r0, r0, #3
	add r1, r4, r0
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1b
	lsr r5, r0, #0x1d
	b _02243CE6
_02243BBC:
	lsl r0, r0, #3
	add r1, r4, r0
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x16
	lsr r5, r0, #0x1d
	b _02243CE6
_02243BCC:
	lsl r0, r0, #3
	add r1, r4, r0
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x11
	lsr r5, r0, #0x1d
	b _02243CE6
_02243BDC:
	lsl r0, r0, #3
	add r1, r4, r0
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0xc
	lsr r5, r0, #0x1d
	b _02243CE6
_02243BEC:
	lsl r0, r0, #3
	add r1, r4, r0
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1e
	lsr r5, r0, #0x1e
	b _02243CE6
_02243BFC:
	lsl r0, r0, #3
	add r1, r4, r0
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1c
	lsr r5, r0, #0x1e
	b _02243CE6
_02243C0C:
	cmp r6, #5
	bhi _02243CE6
	add r1, r6, r6
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02243C1C: ; jump table
	.short _02243C28 - _02243C1C - 2 ; case 0
	.short _02243C48 - _02243C1C - 2 ; case 1
	.short _02243C68 - _02243C1C - 2 ; case 2
	.short _02243C88 - _02243C1C - 2 ; case 3
	.short _02243CA8 - _02243C1C - 2 ; case 4
	.short _02243CC8 - _02243C1C - 2 ; case 5
_02243C28:
	mov r2, #0x71
	lsl r2, r2, #2
	add r6, r4, r2
	lsl r3, r0, #3
	ldr r7, [r6, r3]
	mov r1, #0x1c
	bic r7, r1
	sub r2, #8
	str r7, [r6, r3]
	add r3, r4, r2
	lsl r2, r0, #2
	ldr r1, [r3, r2]
	mov r0, #1
	bic r1, r0
	str r1, [r3, r2]
	b _02243CE6
_02243C48:
	mov r2, #0x71
	lsl r2, r2, #2
	add r6, r4, r2
	lsl r7, r0, #3
	ldr r3, [r6, r7]
	ldr r1, _02243D10 ; =0xFFFFFC7F
	sub r2, #8
	and r1, r3
	add r3, r4, r2
	lsl r2, r0, #2
	str r1, [r6, r7]
	ldr r1, [r3, r2]
	mov r0, #2
	bic r1, r0
	str r1, [r3, r2]
	b _02243CE6
_02243C68:
	mov r2, #0x71
	lsl r2, r2, #2
	add r6, r4, r2
	lsl r7, r0, #3
	ldr r3, [r6, r7]
	ldr r1, _02243D14 ; =0xFFFF8FFF
	sub r2, #8
	and r1, r3
	add r3, r4, r2
	lsl r2, r0, #2
	str r1, [r6, r7]
	ldr r1, [r3, r2]
	mov r0, #0x40
	bic r1, r0
	str r1, [r3, r2]
	b _02243CE6
_02243C88:
	mov r2, #0x71
	lsl r2, r2, #2
	add r6, r4, r2
	lsl r7, r0, #3
	ldr r3, [r6, r7]
	ldr r1, _02243D18 ; =0xFFF1FFFF
	sub r2, #8
	and r1, r3
	add r3, r4, r2
	lsl r2, r0, #2
	str r1, [r6, r7]
	ldr r1, [r3, r2]
	mov r0, #8
	bic r1, r0
	str r1, [r3, r2]
	b _02243CE6
_02243CA8:
	mov r2, #0x72
	lsl r2, r2, #2
	add r6, r4, r2
	lsl r3, r0, #3
	ldr r7, [r6, r3]
	mov r1, #3
	bic r7, r1
	sub r2, #0xc
	str r7, [r6, r3]
	add r3, r4, r2
	lsl r2, r0, #2
	ldr r1, [r3, r2]
	mov r0, #4
	bic r1, r0
	str r1, [r3, r2]
	b _02243CE6
_02243CC8:
	mov r2, #0x72
	lsl r2, r2, #2
	add r6, r4, r2
	lsl r3, r0, #3
	ldr r7, [r6, r3]
	mov r1, #0xc
	bic r7, r1
	sub r2, #0xc
	str r7, [r6, r3]
	lsl r3, r0, #2
	add r1, r4, r2
	ldr r2, [r1, r3]
	ldr r0, _02243D1C ; =0xFFFFFBFF
	and r0, r2
	str r0, [r1, r3]
_02243CE6:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _02243CF8
	cmp r5, #0
	bne _02243CF8
	ldr r1, [sp]
	add r0, r4, #0
	bl BattleScriptIncrementPointer
_02243CF8:
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _02243D0A
	cmp r5, #0
	beq _02243D0A
	ldr r1, [sp]
	add r0, r4, #0
	bl BattleScriptIncrementPointer
_02243D0A:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02243D10: .word 0xFFFFFC7F
_02243D14: .word 0xFFFF8FFF
_02243D18: .word 0xFFF1FFFF
_02243D1C: .word 0xFFFFFBFF
	thumb_func_end BtlCmd_CheckSideCondition

	thumb_func_start BtlCmd_TryFeint
BtlCmd_TryFeint: ; 0x02243D20
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r1, r0, #0
	ldr r0, [r4, #0x6c]
	lsl r0, r0, #6
	add r2, r4, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	bne _02243D4C
	add r0, r4, #0
	bl BattleScriptIncrementPointer
_02243D4C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end BtlCmd_TryFeint

	thumb_func_start BtlCmd_TryPyschoShift
BtlCmd_TryPyschoShift: ; 0x02243D50
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r1, r0, #0
	ldr r0, [r4, #0x6c]
	mov r2, #0xc0
	add r3, r0, #0
	mul r3, r2
	add r5, r4, r3
	ldr r3, _02243D98 ; =0x00002DAC
	ldr r0, [r5, r3]
	cmp r0, #0
	bne _02243D8E
	add r0, r3, #4
	ldr r5, [r5, r0]
	mov r0, #1
	lsl r0, r0, #0x18
	tst r0, r5
	bne _02243D8E
	ldr r0, [r4, #0x64]
	mul r2, r0
	add r0, r4, r2
	ldr r0, [r0, r3]
	cmp r0, #0
	bne _02243D94
_02243D8E:
	add r0, r4, #0
	bl BattleScriptIncrementPointer
_02243D94:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02243D98: .word 0x00002DAC
	thumb_func_end BtlCmd_TryPyschoShift

	thumb_func_start BtlCmd_TryLastResort
BtlCmd_TryLastResort: ; 0x02243D9C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	ldr r2, [r4, #0x64]
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02252EA8
	ldr r2, [r4, #0x64]
	mov r1, #0xc0
	mul r1, r2
	add r2, r4, r1
	ldr r1, _02243DE4 ; =0x00002DCC
	ldr r1, [r2, r1]
	lsl r1, r1, #0x13
	lsr r2, r1, #0x1d
	sub r1, r0, #1
	cmp r2, r1
	blo _02243DD6
	cmp r0, #2
	bge _02243DDE
_02243DD6:
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_02243DDE:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02243DE4: .word 0x00002DCC
	thumb_func_end BtlCmd_TryLastResort

	thumb_func_start BtlCmd_TryToxicSpikes
BtlCmd_TryToxicSpikes: ; 0x02243DE8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	ldr r1, [r4, #0x64]
	add r0, r5, #0
	bl ov12_0223AB1C
	mov r2, #0x72
	mov r1, #1
	add r3, r0, #0
	eor r3, r1
	lsl r0, r3, #3
	add r5, r4, r0
	lsl r2, r2, #2
	ldr r5, [r5, r2]
	lsl r5, r5, #0x1c
	lsr r5, r5, #0x1e
	cmp r5, #2
	bne _02243E3E
	mov r0, #0xb5
	lsl r0, r0, #2
	add r2, r4, r0
	ldr r3, [r4, #0x64]
	mov r0, #0x1c
	mul r0, r3
	ldr r5, [r2, r0]
	mov r3, #1
	bic r5, r3
	orr r1, r5
	str r1, [r2, r0]
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
	b _02243E66
_02243E3E:
	add r5, r2, #0
	sub r5, #0xc
	add r5, r4, r5
	lsl r3, r3, #2
	ldr r6, [r5, r3]
	lsl r1, r1, #0xa
	orr r1, r6
	str r1, [r5, r3]
	add r2, r4, r2
	ldr r4, [r2, r0]
	mov r3, #0xc
	add r1, r4, #0
	bic r1, r3
	lsl r3, r4, #0x1c
	lsr r3, r3, #0x1e
	add r3, r3, #1
	lsl r3, r3, #0x1e
	lsr r3, r3, #0x1c
	orr r1, r3
	str r1, [r2, r0]
_02243E66:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_TryToxicSpikes

	thumb_func_start BtlCmd_CheckToxicSpikes
BtlCmd_CheckToxicSpikes: ; 0x02243E6C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r5, #0
	bl BattleScriptReadWord
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GetBattlerIDBySide
	add r7, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl ov12_0223AB1C
	mov r1, #0x72
	lsl r1, r1, #2
	add r4, r5, r1
	lsl r6, r0, #3
	str r0, [sp]
	ldr r0, [r4, r6]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1e
	beq _02243F06
	sub r1, #0x94
	str r0, [r5, r1]
	add r0, r5, #0
	mov r1, #6
	add r0, #0x88
	str r1, [r0]
	add r0, r5, #0
	add r0, #0x94
	str r7, [r0]
	ldr r1, [r5, #0x78]
	add r0, r5, #0
	mov r2, #0x1b
	mov r3, #0
	bl GetBattlerVar
	cmp r0, #3
	beq _02243EE4
	ldr r1, [r5, #0x78]
	add r0, r5, #0
	mov r2, #0x1c
	mov r3, #0
	bl GetBattlerVar
	cmp r0, #3
	bne _02243F0E
_02243EE4:
	mov r0, #0x6f
	ldr r1, [sp]
	lsl r0, r0, #2
	add r2, r5, r0
	lsl r1, r1, #2
	ldr r7, [r2, r1]
	ldr r3, _02243F14 ; =0xFFFFFBFF
	sub r0, #0x88
	and r3, r7
	str r3, [r2, r1]
	ldr r2, [r4, r6]
	mov r1, #0xc
	bic r2, r1
	str r2, [r4, r6]
	mov r1, #0
	str r1, [r5, r0]
	b _02243F0E
_02243F06:
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
_02243F0E:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02243F14: .word 0xFFFFFBFF
	thumb_func_end BtlCmd_CheckToxicSpikes

	thumb_func_start BtlCmd_CheckMoldBreaker
BtlCmd_CheckMoldBreaker: ; 0x02243F18
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	str r0, [sp, #8]
	add r0, r5, #0
	bl BattleScriptReadWord
	add r4, r0, #0
	add r0, r5, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r5, #0
	bl BattleScriptReadWord
	str r0, [sp, #4]
	cmp r4, #0
	bne _02243FC8
	add r0, r6, #0
	bl BattleSys_GetMaxBattlers
	mov r6, #0
	str r0, [sp]
	cmp r0, #0
	ble _02244030
_02243F5A:
	ldr r0, _02244038 ; =0x000021EC
	add r1, r5, r6
	ldrb r4, [r1, r0]
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _02243F92
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl CheckBattlerAbilityIfNotIgnored
	cmp r0, #1
	bne _02243FBE
	mov r0, #0xc0
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0224403C ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02243FBE
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
	add r5, #0x80
	str r4, [r5]
	b _02244030
_02243F92:
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl CheckBattlerAbilityIfNotIgnored
	cmp r0, #0
	beq _02243FB0
	mov r0, #0xc0
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0224403C ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _02243FBE
_02243FB0:
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
	add r5, #0x80
	str r4, [r5]
	b _02244030
_02243FBE:
	ldr r0, [sp]
	add r6, r6, #1
	cmp r6, r0
	blt _02243F5A
	b _02244030
_02243FC8:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl GetBattlerIDBySide
	add r4, r0, #0
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _02244006
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl CheckBattlerAbilityIfNotIgnored
	cmp r0, #1
	bne _02244030
	mov r0, #0xc0
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0224403C ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02244030
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
	add r5, #0x80
	str r4, [r5]
	b _02244030
_02244006:
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl CheckBattlerAbilityIfNotIgnored
	cmp r0, #0
	beq _02244024
	mov r0, #0xc0
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0224403C ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _02244030
_02244024:
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
	add r5, #0x80
	str r4, [r5]
_02244030:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02244038: .word 0x000021EC
_0224403C: .word 0x00002D8C
	thumb_func_end BtlCmd_CheckMoldBreaker

	thumb_func_start BtlCmd_CheckTeammates
BtlCmd_CheckTeammates: ; 0x02244040
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl GetBattlerIDBySide
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl GetBattlerIDBySide
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_0223AB1C
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_0223AB1C
	cmp r6, r0
	bne _0224409C
	ldr r1, [sp]
	add r0, r4, #0
	bl BattleScriptIncrementPointer
_0224409C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BtlCmd_CheckTeammates

	thumb_func_start BtlCmd_Pickup
BtlCmd_Pickup: ; 0x022440A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	add r0, r1, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	mov r0, #0
	str r0, [sp, #8]
	ldr r1, [sp, #8]
	add r0, r7, #0
	bl ov12_0223A834
	cmp r0, #0
	bgt _022440C0
	b _0224420A
_022440C0:
	ldr r2, [sp, #8]
	add r0, r7, #0
	mov r1, #0
	bl ov12_0223A880
	mov r1, #0xae
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r4, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	cmp r0, #0x35
	bne _0224418E
	cmp r6, #0
	beq _0224418E
	ldr r0, _02244210 ; =0x000001EE
	cmp r6, r0
	beq _0224418E
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0224418E
	add r0, r7, #0
	bl BattleSys_Random
	mov r1, #0xa
	bl _s32_div_f
	cmp r1, #0
	bne _0224418E
	add r0, r7, #0
	bl BattleSys_Random
	mov r1, #0x64
	bl _s32_div_f
	add r5, r1, #0
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	sub r0, r0, #1
	mov r1, #0xa
	bl _u32_div_f
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	cmp r3, #0xa
	blo _02244146
	mov r3, #9
_02244146:
	mov r1, #0
	ldr r2, _02244214 ; =ov12_0226CA4C
	str r1, [sp, #0xc]
_0224414C:
	ldrb r0, [r2]
	cmp r0, r5
	ble _02244166
	ldr r2, [sp, #0xc]
	ldr r5, _02244218 ; =ov12_0226C404
	add r2, r3, r2
	lsl r2, r2, #1
	add r0, r4, #0
	mov r1, #6
	add r2, r5, r2
	bl SetMonData
	b _0224418E
_02244166:
	cmp r5, #0x62
	blt _02244184
	cmp r5, #0x63
	bgt _02244184
	mov r2, #0x63
	sub r2, r2, r5
	add r2, r3, r2
	lsl r3, r2, #1
	ldr r2, _0224421C ; =ov12_0226C30C
	add r0, r4, #0
	mov r1, #6
	add r2, r2, r3
	bl SetMonData
	b _0224418E
_02244184:
	add r1, r1, #1
	add r2, r2, #1
	str r1, [sp, #0xc]
	cmp r1, #9
	blt _0224414C
_0224418E:
	ldr r0, [sp]
	cmp r0, #0x76
	bne _022441F4
	cmp r6, #0
	beq _022441F4
	ldr r0, _02244210 ; =0x000001EE
	cmp r6, r0
	beq _022441F4
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _022441F4
	mov r2, #0
	add r0, r4, #0
	mov r1, #0xa1
	str r2, [sp, #0xc]
	mov r5, #0xa
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #0xa
	ble _022441C6
	ldr r0, [sp, #0xc]
_022441BC:
	add r5, #0xa
	add r0, r0, #1
	cmp r5, r1
	blt _022441BC
	str r0, [sp, #0xc]
_022441C6:
	ldr r0, [sp, #0xc]
	cmp r0, #0xa
	blt _022441D0
	bl GF_AssertFail
_022441D0:
	add r0, r7, #0
	bl BattleSys_Random
	mov r1, #0x64
	bl _s32_div_f
	ldr r2, [sp, #0xc]
	ldr r0, _02244220 ; =ov12_0226CA58
	ldrb r0, [r0, r2]
	cmp r1, r0
	bge _022441F4
	mov r0, #0x5e
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #6
	add r2, sp, #0xc
	bl SetMonData
_022441F4:
	ldr r0, [sp, #8]
	mov r1, #0
	add r0, r0, #1
	str r0, [sp, #8]
	add r0, r7, #0
	bl ov12_0223A834
	ldr r1, [sp, #8]
	cmp r1, r0
	bge _0224420A
	b _022440C0
_0224420A:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02244210: .word 0x000001EE
_02244214: .word ov12_0226CA4C
_02244218: .word ov12_0226C404
_0224421C: .word ov12_0226C30C
_02244220: .word ov12_0226CA58
	thumb_func_end BtlCmd_Pickup

	thumb_func_start BtlCmd_TrickRoom
BtlCmd_TrickRoom: ; 0x02244224
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	mov r0, #0xb5
	ldr r1, [r4, #0x64]
	lsl r0, r0, #2
	add r3, r4, r0
	mov r0, #0x1c
	add r2, r1, #0
	mul r2, r0
	ldr r1, [r3, r2]
	mov r0, #0x10
	orr r0, r1
	str r0, [r3, r2]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_TrickRoom

	thumb_func_start BtlCmd_CheckMoveFinished
BtlCmd_CheckMoveFinished: ; 0x0224424C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	add r0, r4, #0
	bl ov12_0225561C
	cmp r0, #1
	bne _02244288
	add r0, r4, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
_02244288:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BtlCmd_CheckMoveFinished

	thumb_func_start BtlCmd_CheckItemEffect
BtlCmd_CheckItemEffect: ; 0x0224428C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r5, #0
	bl BattleScriptReadWord
	str r0, [sp, #4]
	add r0, r5, #0
	bl BattleScriptReadWord
	add r4, r0, #0
	add r0, r5, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	ldr r0, [sp]
	ldr r2, [sp, #4]
	add r1, r5, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	cmp r6, #0
	bne _022442E0
	add r0, r5, #0
	bl GetBattlerHeldItemEffect
	cmp r4, r0
	bne _022442F2
	add r0, r5, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
	b _022442F2
_022442E0:
	add r0, r5, #0
	bl GetBattlerHeldItemEffect
	cmp r4, r0
	beq _022442F2
	add r0, r5, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
_022442F2:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BtlCmd_CheckItemEffect

	thumb_func_start BtlCmd_GetItemEffect
BtlCmd_GetItemEffect: ; 0x022442F8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl BattleScriptGetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	add r0, r4, #0
	bl ov12_022555EC
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl ov12_02257E74
	str r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_GetItemEffect

	thumb_func_start BtlCmd_GetItemPower
BtlCmd_GetItemPower: ; 0x02244344
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl BattleScriptGetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	add r0, r4, #0
	bl ov12_022555EC
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #2
	bl ov12_02257E74
	str r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_GetItemPower

	thumb_func_start BtlCmd_TryCamouflage
BtlCmd_TryCamouflage: ; 0x02244390
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl GetBattlerAbility
	cmp r0, #0x79
	bne _022443BE
	add r0, r5, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
	mov r0, #0
	pop {r4, r5, r6, pc}
_022443BE:
	add r0, r4, #0
	bl ov12_0223AB40
	cmp r0, #0xc
	ble _022443CA
	mov r0, #0xc
_022443CA:
	ldr r1, _02244420 ; =ov12_0226CA64
	mov r2, #0x1b
	ldrb r4, [r1, r0]
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	mov r3, #0
	bl GetBattlerVar
	cmp r4, r0
	beq _02244412
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	mov r2, #0x1c
	mov r3, #0
	bl GetBattlerVar
	cmp r4, r0
	beq _02244412
	ldr r1, [r5, #0x64]
	lsl r0, r4, #0x18
	add r3, r1, #0
	mov r2, #0xc0
	mul r3, r2
	ldr r1, _02244424 ; =0x00002D64
	lsr r0, r0, #0x18
	add r3, r5, r3
	strb r0, [r3, r1]
	ldr r3, [r5, #0x64]
	add r1, r1, #1
	add r6, r3, #0
	mul r6, r2
	add r3, r5, r6
	strb r0, [r3, r1]
	add r2, #0x70
	str r4, [r5, r2]
	b _0224441A
_02244412:
	add r0, r5, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_0224441A:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02244420: .word ov12_0226CA64
_02244424: .word 0x00002D64
	thumb_func_end BtlCmd_TryCamouflage

	thumb_func_start BtlCmd_NaturePower
BtlCmd_NaturePower: ; 0x02244428
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl ov12_0223AB40
	cmp r0, #0xc
	ble _02244442
	mov r0, #0xc
_02244442:
	lsl r1, r0, #1
	ldr r0, _02244454 ; =ov12_0226C3B4
	ldrh r1, [r0, r1]
	mov r0, #0x49
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02244454: .word ov12_0226C3B4
	thumb_func_end BtlCmd_NaturePower

	thumb_func_start BtlCmd_SecretPower
BtlCmd_SecretPower: ; 0x02244458
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl ov12_0223AB40
	cmp r0, #0xc
	ble _02244472
	mov r0, #0xc
_02244472:
	lsl r1, r0, #2
	ldr r0, _02244480 ; =ov12_0226C490
	ldr r1, [r0, r1]
	ldr r0, _02244484 ; =0x00002174
	str r1, [r4, r0]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02244480: .word ov12_0226C490
_02244484: .word 0x00002174
	thumb_func_end BtlCmd_SecretPower

	thumb_func_start BtlCmd_TryNaturalGift
BtlCmd_TryNaturalGift: ; 0x02244488
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r5, r0, #0
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl ov12_02255890
	cmp r0, #0
	beq _022444BA
	ldr r1, _022444C8 ; =0x00002154
	str r0, [r4, r1]
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl ov12_022558A4
	ldr r1, _022444CC ; =0x00002160
	str r0, [r4, r1]
	b _022444C2
_022444BA:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleScriptIncrementPointer
_022444C2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_022444C8: .word 0x00002154
_022444CC: .word 0x00002160
	thumb_func_end BtlCmd_TryNaturalGift

	thumb_func_start BtlCmd_TryPluck
BtlCmd_TryPluck: ; 0x022444D0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	ldr r2, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r2
	add r1, r4, r0
	ldr r0, _02244548 ; =0x00002DB8
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _02244516
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	mov r3, #0x3c
	bl CheckBattlerAbilityIfNotIgnored
	cmp r0, #1
	bne _02244516
	add r0, r4, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
	b _02244544
_02244516:
	ldr r2, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r2
	add r3, r4, r0
	ldr r0, _02244548 ; =0x00002DB8
	ldrh r1, [r3, r0]
	cmp r1, #0
	beq _02244530
	add r0, #0x14
	ldr r0, [r3, r0]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	bne _0224453C
_02244530:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02255A2C
	cmp r0, #1
	beq _02244544
_0224453C:
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_02244544:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02244548: .word 0x00002DB8
	thumb_func_end BtlCmd_TryPluck

	thumb_func_start BtlCmd_TryFling
BtlCmd_TryFling: ; 0x0224454C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	ldr r2, [r4, #0x64]
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02255F7C
	cmp r0, #1
	beq _02244578
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_02244578:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end BtlCmd_TryFling

	thumb_func_start BtlCmd_YesNoBox
BtlCmd_YesNoBox: ; 0x0224457C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	str r0, [sp]
	mov r2, #0
	str r2, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	str r2, [sp, #8]
	bl ov12_0226337C
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_YesNoBox

	thumb_func_start BtlCmd_YesNoBoxWait
BtlCmd_YesNoBoxWait: ; 0x022445AC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov12_0225682C
	add r4, r0, #0
	beq _022445F4
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r5, #0
	bl BattleScriptReadWord
	add r1, r0, #0
	cmp r4, #0xff
	bne _022445E2
	add r0, r5, #0
	bl BattleScriptIncrementPointer
	b _022445EA
_022445E2:
	add r0, r5, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
_022445EA:
	add r0, r6, #0
	mov r1, #0
	add r2, r4, #0
	bl ov12_0223BDDC
_022445F4:
	ldr r1, _02244608 ; =0x00003154
	mov r0, #1
	ldr r2, [r5, r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	str r0, [r5, r1]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02244608: .word 0x00003154
	thumb_func_end BtlCmd_YesNoBoxWait

	thumb_func_start BtlCmd_MonList
BtlCmd_MonList: ; 0x0224460C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	bl BattleSys_GetMaxBattlers
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	mov r2, #0
	str r2, [sp]
	mov r0, #6
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov12_022632DC
	mov r0, #0
	str r0, [r4, #0x78]
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_MonList

	thumb_func_start BtlCmd_MonListWait
BtlCmd_MonListWait: ; 0x0224463C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #0
	bl ov12_0225682C
	add r5, r0, #0
	beq _0224466E
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r1, r0, #0
	cmp r5, #0xff
	bne _02244668
	add r0, r4, #0
	bl BattleScriptIncrementPointer
	b _0224466E
_02244668:
	ldr r0, _02244680 ; =0x000021A0
	sub r1, r5, #1
	strb r1, [r4, r0]
_0224466E:
	ldr r1, _02244684 ; =0x00003154
	mov r0, #1
	ldr r2, [r4, r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	str r0, [r4, r1]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02244680: .word 0x000021A0
_02244684: .word 0x00003154
	thumb_func_end BtlCmd_MonListWait

	thumb_func_start BtlCmd_SetBattleResults
BtlCmd_SetBattleResults: ; 0x02244688
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl ov12_0223A7E0
	mov r1, #4
	tst r0, r1
	beq _022446A6
	add r0, r4, #0
	bl ov12_02264288
_022446A6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_SetBattleResults

	thumb_func_start BtlCmd_CheckStealthRock
BtlCmd_CheckStealthRock: ; 0x022446AC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r4, r0, #0
	add r0, r5, #0
	bl BattleScriptReadWord
	str r0, [sp]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl GetBattlerIDBySide
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl ov12_0223AB1C
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x1b
	mov r3, #0
	bl GetBattlerVar
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x1c
	mov r3, #0
	bl GetBattlerVar
	add r2, r0, #0
	lsl r0, r6, #2
	add r1, r5, r0
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r0, #0x80
	tst r0, r1
	beq _022447A0
	mov r0, #0xc0
	add r6, r4, #0
	mul r6, r0
	ldr r0, _022447AC ; =0x00002D8C
	add r1, r5, r6
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022447A0
	lsl r1, r7, #0x18
	lsl r2, r2, #0x18
	mov r0, #5
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov12_0225264C
	cmp r0, #0x14
	bgt _0224473E
	bge _02244766
	cmp r0, #0
	bgt _02244738
	beq _02244776
	b _02244782
_02244738:
	cmp r0, #0xa
	beq _0224476E
	b _02244782
_0224473E:
	cmp r0, #0x50
	bgt _0224474A
	bge _02244756
	cmp r0, #0x28
	beq _0224475E
	b _02244782
_0224474A:
	cmp r0, #0xa0
	bne _02244782
	ldr r0, _022447B0 ; =0x0000215C
	mov r1, #2
	str r1, [r5, r0]
	b _02244786
_02244756:
	ldr r0, _022447B0 ; =0x0000215C
	mov r1, #4
	str r1, [r5, r0]
	b _02244786
_0224475E:
	ldr r0, _022447B0 ; =0x0000215C
	mov r1, #8
	str r1, [r5, r0]
	b _02244786
_02244766:
	ldr r0, _022447B0 ; =0x0000215C
	mov r1, #0x10
	str r1, [r5, r0]
	b _02244786
_0224476E:
	ldr r0, _022447B0 ; =0x0000215C
	mov r1, #0x20
	str r1, [r5, r0]
	b _02244786
_02244776:
	ldr r1, [sp]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02244782:
	bl GF_AssertFail
_02244786:
	ldr r0, _022447B4 ; =0x00002D90
	add r1, r5, r6
	ldr r1, [r1, r0]
	mov r0, #0
	mvn r0, r0
	mul r0, r1
	ldr r1, _022447B0 ; =0x0000215C
	ldr r1, [r5, r1]
	bl ov12_02253178
	ldr r1, _022447B0 ; =0x0000215C
	str r0, [r5, r1]
	b _022447A8
_022447A0:
	ldr r1, [sp]
	add r0, r5, #0
	bl BattleScriptIncrementPointer
_022447A8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022447AC: .word 0x00002D8C
_022447B0: .word 0x0000215C
_022447B4: .word 0x00002D90
	thumb_func_end BtlCmd_CheckStealthRock

	thumb_func_start BtlCmd_CheckEffectActivation
BtlCmd_CheckEffectActivation: ; 0x022447B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl GetBattlerAbility
	cmp r0, #0x20
	ldr r0, _02244834 ; =0x00003044
	bne _022447EC
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _02244838 ; =0x000003E5
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x11
	lsr r4, r0, #0x10
	b _022447F6
_022447EC:
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _02244838 ; =0x000003E5
	ldrb r4, [r1, r0]
_022447F6:
	cmp r4, #0
	bne _022447FE
	bl GF_AssertFail
_022447FE:
	add r0, r6, #0
	bl BattleSys_Random
	mov r1, #0x64
	bl _s32_div_f
	cmp r1, r4
	bge _02244826
	add r0, r5, #0
	add r0, #0x94
	ldr r1, [r0]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0224483C ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02244826
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02244826:
	add r0, r5, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02244834: .word 0x00003044
_02244838: .word 0x000003E5
_0224483C: .word 0x00002D8C
	thumb_func_end BtlCmd_CheckEffectActivation

	thumb_func_start BtlCmd_CheckChatterActivation
BtlCmd_CheckChatterActivation: ; 0x02244840
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	ldr r0, [r5, #0x64]
	mov r4, #0xc0
	add r1, r0, #0
	mul r1, r4
	mov r0, #0xb5
	add r3, r5, r1
	lsl r0, r0, #6
	add r1, r4, #0
	ldrh r2, [r3, r0]
	add r1, #0xf9
	cmp r2, r1
	bne _022448DE
	ldr r1, [r5, #0x6c]
	add r2, r1, #0
	mul r2, r4
	add r1, r0, #0
	add r2, r5, r2
	add r1, #0x4c
	ldr r1, [r2, r1]
	cmp r1, #0
	beq _022448DE
	add r0, #0x70
	ldr r1, [r3, r0]
	mov r0, #2
	lsl r0, r0, #0x14
	tst r0, r1
	bne _022448DE
	add r0, r6, #0
	bl ov12_0223B514
	mov r1, #0x10
	tst r0, r1
	bne _022448A6
	ldr r1, [r5, #0x64]
	add r0, r6, #0
	bl ov12_0223B758
	bl sub_02006EFC
	b _022448AE
_022448A6:
	ldr r1, [r5, #0x64]
	add r0, r6, #0
	bl ov12_0223C0EC
_022448AE:
	cmp r0, #0
	beq _022448BA
	cmp r0, #1
	beq _022448BE
	cmp r0, #2
	beq _022448C2
_022448BA:
	mov r4, #0
	b _022448C4
_022448BE:
	mov r4, #0xa
	b _022448C4
_022448C2:
	mov r4, #0x1e
_022448C4:
	add r0, r6, #0
	bl BattleSys_Random
	mov r1, #0x64
	bl _s32_div_f
	cmp r1, r4
	ble _022448E6
	add r0, r5, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
	b _022448E6
_022448DE:
	add r0, r5, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
_022448E6:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_CheckChatterActivation

	thumb_func_start BtlCmd_GetMoveParam
BtlCmd_GetMoveParam: ; 0x022448EC
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r1, r0, #0
	ldr r0, _0224491C ; =0x000003DE
	add r2, r4, r0
	ldr r0, _02244920 ; =0x00003044
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r0, r2, r0
	bl GetMoveTblAttr
	mov r1, #0x4d
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	pop {r4, pc}
	nop
_0224491C: .word 0x000003DE
_02244920: .word 0x00003044
	thumb_func_end BtlCmd_GetMoveParam

	thumb_func_start BtlCmd_Mosaic
BtlCmd_Mosaic: ; 0x02244924
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	ldr r3, [sp]
	add r0, r5, #0
	add r2, r7, #0
	bl ov12_02263D48
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BtlCmd_Mosaic

	thumb_func_start BtlCmd_ChangeForme
BtlCmd_ChangeForme: ; 0x02244964
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	add r0, r5, #0
	bl ov12_02263D6C
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_ChangeForme

	thumb_func_start BtlCmd_SetBattleBackground
BtlCmd_SetBattleBackground: ; 0x02244990
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	mov r1, #0
	bl ov12_02263DFC
	mov r0, #0
	pop {r4, pc}
	thumb_func_end BtlCmd_SetBattleBackground

	thumb_func_start BtlCmd_RecoverStatus
BtlCmd_RecoverStatus: ; 0x022449A8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, _022449E4 ; =0x0000219C
	str r0, [sp]
	add r3, r4, r1
	ldrb r2, [r3, r2]
	add r0, r5, #0
	mov r3, #0
	bl ov12_0223AC20
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_022449E4: .word 0x0000219C
	thumb_func_end BtlCmd_RecoverStatus

	thumb_func_start BtlCmd_TryRun
BtlCmd_TryRun: ; 0x022449E8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl GetBattlerIDBySide
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02252B68
	cmp r0, #0
	beq _02244A26
	add r0, r4, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
_02244A26:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_TryRun

	thumb_func_start BtlCmd_InitStartBallGauge
BtlCmd_InitStartBallGauge: ; 0x02244A2C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	add r0, r5, #0
	bl ov12_02263E34
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_InitStartBallGauge

	thumb_func_start BtlCmd_DeleteStartBallGauge
BtlCmd_DeleteStartBallGauge: ; 0x02244A58
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	add r0, r5, #0
	bl ov12_02263E5C
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_DeleteStartBallGauge

	thumb_func_start BtlCmd_InitBallGauge
BtlCmd_InitBallGauge: ; 0x02244A84
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	add r0, r5, #0
	bl ov12_02263E84
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_InitBallGauge

	thumb_func_start BtlCmd_DeleteBallGauge
BtlCmd_DeleteBallGauge: ; 0x02244AB0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	add r0, r5, #0
	bl ov12_02263EAC
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_DeleteBallGauge

	thumb_func_start BtlCmd_LoadBallGfx
BtlCmd_LoadBallGfx: ; 0x02244ADC
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl ov12_02263ED4
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_LoadBallGfx

	thumb_func_start BtlCmd_DeleteBallGfx
BtlCmd_DeleteBallGfx: ; 0x02244AF4
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl ov12_02263EF0
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_DeleteBallGfx

	thumb_func_start BtlCmd_IncrementGameStat
BtlCmd_IncrementGameStat: ; 0x02244B0C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	ldr r3, [sp]
	add r0, r5, #0
	add r2, r7, #0
	bl ov12_02263F0C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BtlCmd_IncrementGameStat

	thumb_func_start BtlCmd_196
BtlCmd_196: ; 0x02244B4C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerIDBySide
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02263F8C
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end BtlCmd_196

	thumb_func_start BtlCmd_CheckAbilityEffectOnHit
BtlCmd_CheckAbilityEffectOnHit: ; 0x02244B78
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	mov r2, #0x4e
	lsl r2, r2, #2
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r4, r2
	bl ov12_02253E04
	cmp r0, #0
	bne _02244BA8
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_02244BA8:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end BtlCmd_CheckAbilityEffectOnHit

	thumb_func_start BtlCmd_198
BtlCmd_198: ; 0x02244BAC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	bl BattleSys_GetMaxBattlers
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	cmp r2, #3
	beq _02244BD2
	cmp r2, #4
	beq _02244BFA
	b _02244C22
_02244BD2:
	mov r5, #0
	cmp r6, #0
	ble _02244C32
	mov r7, #1
_02244BDA:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSys_GetOpponentDataByBattlerId
	ldr r1, _02244C38 ; =0x00000195
	ldrb r0, [r0, r1]
	tst r0, r7
	bne _02244BF2
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_02264038
_02244BF2:
	add r5, r5, #1
	cmp r5, r6
	blt _02244BDA
	b _02244C32
_02244BFA:
	mov r5, #0
	cmp r6, #0
	ble _02244C32
	mov r7, #1
_02244C02:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSys_GetOpponentDataByBattlerId
	ldr r1, _02244C38 ; =0x00000195
	ldrb r0, [r0, r1]
	tst r0, r7
	beq _02244C1A
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_02264038
_02244C1A:
	add r5, r5, #1
	cmp r5, r6
	blt _02244C02
	b _02244C32
_02244C22:
	add r0, r4, #0
	add r1, r5, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	add r0, r4, #0
	bl ov12_02264038
_02244C32:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02244C38: .word 0x00000195
	thumb_func_end BtlCmd_198

	thumb_func_start BtlCmd_199
BtlCmd_199: ; 0x02244C3C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	bl BattleSys_GetMaxBattlers
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	cmp r2, #3
	beq _02244C62
	cmp r2, #4
	beq _02244C8A
	b _02244CB2
_02244C62:
	mov r5, #0
	cmp r6, #0
	ble _02244CC2
	mov r7, #1
_02244C6A:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSys_GetOpponentDataByBattlerId
	ldr r1, _02244CC8 ; =0x00000195
	ldrb r0, [r0, r1]
	tst r0, r7
	bne _02244C82
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_02264054
_02244C82:
	add r5, r5, #1
	cmp r5, r6
	blt _02244C6A
	b _02244CC2
_02244C8A:
	mov r5, #0
	cmp r6, #0
	ble _02244CC2
	mov r7, #1
_02244C92:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSys_GetOpponentDataByBattlerId
	ldr r1, _02244CC8 ; =0x00000195
	ldrb r0, [r0, r1]
	tst r0, r7
	beq _02244CAA
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_02264054
_02244CAA:
	add r5, r5, #1
	cmp r5, r6
	blt _02244C92
	b _02244CC2
_02244CB2:
	add r0, r4, #0
	add r1, r5, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	add r0, r4, #0
	bl ov12_02264054
_02244CC2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02244CC8: .word 0x00000195
	thumb_func_end BtlCmd_199

	thumb_func_start BtlCmd_CheckWhiteout
BtlCmd_CheckWhiteout: ; 0x02244CCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	add r0, r1, #0
	mov r1, #1
	mov r5, #0
	bl BattleScriptIncrementPointer
	ldr r0, [sp, #4]
	bl BattleScriptReadWord
	add r4, r0, #0
	ldr r0, [sp, #4]
	bl BattleScriptReadWord
	str r0, [sp, #0x14]
	ldr r0, [sp]
	bl ov12_0223A7E0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r4, #0
	bl GetBattlerIDBySide
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	mov r1, #8
	tst r0, r1
	bne _02244D1E
	ldr r0, [sp, #0xc]
	mov r1, #0x10
	tst r0, r1
	beq _02244E06
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	bl ov12_0223AB1C
	cmp r0, #0
	beq _02244E06
_02244D1E:
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	bl ov12_0223A7F4
	add r7, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	bl ov12_0223AB6C
	add r1, r0, #0
	ldr r0, [sp]
	bl ov12_0223A7F4
	str r0, [sp, #8]
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	bl BattleSys_GetOpponentDataByBattlerId
	add r0, r7, #0
	mov r4, #0
	bl GetPartyCount
	cmp r0, #0
	ble _02244D8C
_02244D4E:
	add r0, r7, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02244D80
	add r0, r6, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _02244E74 ; =0x000001EE
	cmp r0, r1
	beq _02244D80
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r5, r5, r0
_02244D80:
	add r0, r7, #0
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _02244D4E
_02244D8C:
	ldr r0, [sp, #0xc]
	sub r0, #0x4a
	str r0, [sp, #0xc]
	cmp r0, #1
	bhi _02244DAE
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	bl ov12_0223AB1C
	cmp r0, #0
	bne _02244DAE
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	bl ov12_0223AB0C
	cmp r0, #2
	beq _02244DF8
_02244DAE:
	ldr r0, [sp, #8]
	mov r4, #0
	bl GetPartyCount
	cmp r0, #0
	ble _02244DF8
	ldr r7, _02244E74 ; =0x000001EE
_02244DBC:
	ldr r0, [sp, #8]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02244DEC
	add r0, r6, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	cmp r0, r7
	beq _02244DEC
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r5, r5, r0
_02244DEC:
	ldr r0, [sp, #8]
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _02244DBC
_02244DF8:
	cmp r5, #0
	bne _02244E6E
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x14]
	bl BattleScriptIncrementPointer
	b _02244E6E
_02244E06:
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	bl ov12_0223A7F4
	add r7, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	bl BattleSys_GetOpponentDataByBattlerId
	add r0, r7, #0
	mov r4, #0
	bl GetPartyCount
	cmp r0, #0
	ble _02244E62
_02244E24:
	add r0, r7, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02244E56
	add r0, r6, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _02244E74 ; =0x000001EE
	cmp r0, r1
	beq _02244E56
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r5, r5, r0
_02244E56:
	add r0, r7, #0
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _02244E24
_02244E62:
	cmp r5, #0
	bne _02244E6E
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x14]
	bl BattleScriptIncrementPointer
_02244E6E:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02244E74: .word 0x000001EE
	thumb_func_end BtlCmd_CheckWhiteout

	thumb_func_start BtlCmd_TryAcupressure
BtlCmd_TryAcupressure: ; 0x02244E78
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r6, r1, #0
	str r0, [sp]
	add r0, r6, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r6, #0
	bl BattleScriptReadWord
	mov ip, r0
	ldr r1, [r6, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r0, r6, r0
	add r5, r0, #1
	ldr r7, _02244EF0 ; =0x00002D58
	mov r4, #0
	mov r3, #1
	add r0, sp, #4
_02244EA2:
	ldrsb r1, [r5, r7]
	cmp r1, #0xc
	bge _02244EB0
	lsl r1, r4, #2
	sub r2, r3, #1
	add r4, r4, #1
	str r2, [r0, r1]
_02244EB0:
	add r3, r3, #1
	add r5, r5, #1
	cmp r3, #8
	blt _02244EA2
	cmp r4, #0
	beq _02244EE0
	ldr r0, [sp]
	bl BattleSys_Random
	add r1, r4, #0
	bl _s32_div_f
	lsl r1, r1, #2
	add r0, sp, #4
	ldr r0, [r0, r1]
	ldr r1, _02244EF4 ; =0x00002170
	add r0, #0x27
	str r0, [r6, r1]
	mov r0, #2
	ldr r2, [r6, r1]
	lsl r0, r0, #0x1e
	orr r0, r2
	str r0, [r6, r1]
	b _02244EE8
_02244EE0:
	add r0, r6, #0
	mov r1, ip
	bl BattleScriptIncrementPointer
_02244EE8:
	mov r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02244EF0: .word 0x00002D58
_02244EF4: .word 0x00002170
	thumb_func_end BtlCmd_TryAcupressure

	thumb_func_start BtlCmd_RemoveItem
BtlCmd_RemoveItem: ; 0x02244EF8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r7, #0
	add r1, r4, #0
	bl GetBattlerIDBySide
	add r2, r0, #0
	ldr r0, _02244F3C ; =0x00002DB8
	add r5, r2, #0
	add r6, r4, r0
	mov r0, #0xc0
	mul r5, r0
	lsl r0, r2, #1
	add r1, r4, r0
	ldrh r3, [r6, r5]
	ldr r0, _02244F40 ; =0x00003124
	strh r3, [r1, r0]
	mov r0, #0
	strh r0, [r6, r5]
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_02250C40
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02244F3C: .word 0x00002DB8
_02244F40: .word 0x00003124
	thumb_func_end BtlCmd_RemoveItem

	thumb_func_start BtlCmd_TryRecycle
BtlCmd_TryRecycle: ; 0x02244F44
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r1, r0, #0
	ldr r0, [r4, #0x64]
	ldr r2, _02244F84 ; =0x00003124
	lsl r0, r0, #1
	add r0, r4, r0
	ldrh r3, [r0, r2]
	cmp r3, #0
	beq _02244F78
	mov r0, #0x4a
	lsl r0, r0, #2
	str r3, [r4, r0]
	ldr r0, [r4, #0x64]
	mov r1, #0
	lsl r0, r0, #1
	add r0, r4, r0
	strh r1, [r0, r2]
	b _02244F7E
_02244F78:
	add r0, r4, #0
	bl BattleScriptIncrementPointer
_02244F7E:
	mov r0, #0
	pop {r4, pc}
	nop
_02244F84: .word 0x00003124
	thumb_func_end BtlCmd_TryRecycle

	thumb_func_start BtlCmd_CheckItemEffectOnHit
BtlCmd_CheckItemEffectOnHit: ; 0x02244F88
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	mov r2, #0x4e
	lsl r2, r2, #2
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r4, r2
	bl ov12_02255634
	cmp r0, #0
	bne _02244FB8
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_02244FB8:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end BtlCmd_CheckItemEffectOnHit

	thumb_func_start BtlCmd_BattleResultMessage
BtlCmd_BattleResultMessage: ; 0x02244FBC
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl ov12_02264070
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_BattleResultMessage

	thumb_func_start BtlCmd_RunAwayMessage
BtlCmd_RunAwayMessage: ; 0x02244FD4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0226408C
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_RunAwayMessage

	thumb_func_start BtlCmd_ForefitMessage
BtlCmd_ForefitMessage: ; 0x02244FF0
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl ov12_02264120
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_ForefitMessage

	thumb_func_start BtlCmd_CheckHoldOnWith1HP
BtlCmd_CheckHoldOnWith1HP: ; 0x02245008
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	mov r4, #0
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	ldr r0, [sp]
	add r1, r5, #0
	bl GetBattlerIDBySide
	add r7, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl GetBattlerHeldItemEffect
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	bl ov12_02255844
	str r0, [sp, #4]
	cmp r6, #0x41
	bne _0224505A
	ldr r0, [sp]
	bl BattleSys_Random
	mov r1, #0x64
	bl _s32_div_f
	ldr r0, [sp, #4]
	cmp r1, r0
	bge _0224505A
	mov r4, #1
_0224505A:
	cmp r6, #0x67
	bne _02245072
	mov r0, #0xc0
	mul r0, r7
	add r2, r5, r0
	ldr r0, _022450A8 ; =0x00002D8C
	ldr r1, [r2, r0]
	add r0, r0, #4
	ldr r0, [r2, r0]
	cmp r1, r0
	bne _02245072
	mov r4, #1
_02245072:
	cmp r4, #0
	beq _022450A0
	mov r1, #0xc0
	add r0, r7, #0
	mul r0, r1
	add r2, r5, r0
	ldr r0, _022450A8 ; =0x00002D8C
	ldr r3, [r2, r0]
	ldr r2, _022450AC ; =0x0000215C
	ldr r0, [r5, r2]
	add r0, r0, r3
	cmp r0, #0
	bgt _022450A0
	sub r0, r3, #1
	neg r0, r0
	str r0, [r5, r2]
	add r0, r2, #0
	add r0, #0x10
	ldr r0, [r5, r0]
	add r1, #0x40
	orr r0, r1
	add r2, #0x10
	str r0, [r5, r2]
_022450A0:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022450A8: .word 0x00002D8C
_022450AC: .word 0x0000215C
	thumb_func_end BtlCmd_CheckHoldOnWith1HP

	thumb_func_start BtlCmd_TryNaturalCure
BtlCmd_TryNaturalCure: ; 0x022450B0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r4, r0, #0
	add r0, r5, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	mov r0, #0xc0
	add r4, r1, #0
	mul r4, r0
	ldr r0, _02245140 ; =0x00002D8C
	add r2, r5, r4
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _02245132
	ldr r0, _02245144 ; =0x0000219C
	add r2, r5, r1
	ldrb r2, [r2, r0]
	cmp r2, #6
	beq _02245132
	add r0, r6, #0
	bl ov12_0223A880
	add r6, r0, #0
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	str r0, [sp]
	add r0, r6, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, _02245148 ; =0x00002D67
	add r1, r5, r4
	ldrb r0, [r1, r0]
	cmp r0, #0x1e
	beq _0224513A
	ldr r1, [sp]
	add r0, r5, #0
	bl ov12_0225451C
	cmp r0, #0
	bne _0224513A
	add r0, r5, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
	b _0224513A
_02245132:
	add r0, r5, #0
	add r1, r7, #0
	bl BattleScriptIncrementPointer
_0224513A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02245140: .word 0x00002D8C
_02245144: .word 0x0000219C
_02245148: .word 0x00002D67
	thumb_func_end BtlCmd_TryNaturalCure

	thumb_func_start BtlCmd_CheckSubstitute
BtlCmd_CheckSubstitute: ; 0x0224514C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl GetBattlerIDBySide
	mov r1, #0xc0
	mul r1, r0
	add r2, r4, r1
	ldr r1, _022451A4 ; =0x00002DB0
	ldr r2, [r2, r1]
	mov r1, #1
	lsl r1, r1, #0x18
	tst r1, r2
	bne _02245198
	mov r1, #0x1c
	mul r1, r0
	mov r0, #0xba
	add r1, r4, r1
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r0, #8
	tst r0, r1
	beq _022451A0
_02245198:
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_022451A0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022451A4: .word 0x00002DB0
	thumb_func_end BtlCmd_CheckSubstitute

	thumb_func_start BtlCmd_CheckCloudNine
BtlCmd_CheckCloudNine: ; 0x022451A8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	mov r0, #0xd
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	bne _022451E8
	mov r0, #0x4c
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	mov r3, #0
	bl ov12_02252324
	cmp r0, #0
	beq _022451F0
_022451E8:
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_022451F0:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_CheckCloudNine

	thumb_func_start BtlCmd_CheckUTurnItemEffect
BtlCmd_CheckUTurnItemEffect: ; 0x022451F8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerIDBySide
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02253DA0
	str r0, [r4, #0x6c]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_CheckUTurnItemEffect

	thumb_func_start BtlCmd_212
BtlCmd_212: ; 0x02245228
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	mov r2, #0x4e
	lsl r2, r2, #2
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r4, r2
	bl ov12_02257FA0
	cmp r0, #0
	bne _02245258
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_02245258:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end BtlCmd_212

	thumb_func_start BtlCmd_SwapToSubstituteSprite
BtlCmd_SwapToSubstituteSprite: ; 0x0224525C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerIDBySide
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0226417C
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end BtlCmd_SwapToSubstituteSprite

	thumb_func_start BtlCmd_PlayMoveSE
BtlCmd_PlayMoveSE: ; 0x02245288
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerIDBySide
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02264228
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end BtlCmd_PlayMoveSE

	thumb_func_start BtlCmd_PlaySong
BtlCmd_PlaySong: ; 0x022452B4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	add r0, r5, #0
	add r2, r7, #0
	bl ov12_02264268
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_PlaySong

	thumb_func_start BtlCmd_CheckSafariEncounterDone
BtlCmd_CheckSafariEncounterDone: ; 0x022452EC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov12_0223A834
	cmp r0, #6
	bne _02245320
	ldr r0, [r5, #0x64]
	bl PCStorage_FindFirstBoxWithEmptySlot
	cmp r0, #0x12
	bne _02245320
	add r0, r4, #0
	add r1, r6, #0
	bl BattleScriptIncrementPointer
_02245320:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end BtlCmd_CheckSafariEncounterDone

	thumb_func_start BtlCmd_WaitWithoutInterrupt
BtlCmd_WaitWithoutInterrupt: ; 0x02245324
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	ldr r2, [r4, #0x2c]
	mov r1, #4
	tst r1, r2
	beq _0224534E
	ldr r1, _02245388 ; =0x0000240C
	ldr r2, [r4, r1]
	mov r1, #0x10
	tst r1, r2
	bne _0224534E
	mov r4, #2
	b _02245350
_0224534E:
	mov r4, #1
_02245350:
	add r1, r5, #0
	add r1, #0xf0
	ldr r1, [r1]
	cmp r0, r1
	ble _0224536E
	mov r1, #1
	add r0, r5, #0
	mvn r1, r1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	add r0, #0xf0
	ldr r0, [r0]
	add r1, r0, r4
	b _02245370
_0224536E:
	mov r1, #0
_02245370:
	add r0, r5, #0
	add r0, #0xf0
	str r1, [r0]
	ldr r1, _0224538C ; =0x00003154
	mov r0, #1
	ldr r2, [r5, r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	str r0, [r5, r1]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02245388: .word 0x0000240C
_0224538C: .word 0x00003154
	thumb_func_end BtlCmd_WaitWithoutInterrupt

	thumb_func_start BtlCmd_CheckCurMoveIsType
BtlCmd_CheckCurMoveIsType: ; 0x02245390
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r4, r0, #0
	add r0, r5, #0
	bl BattleScriptReadWord
	add r1, r0, #0
	ldr r0, _022453C8 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r2, r5, r0
	ldr r0, _022453CC ; =0x000003E2
	ldrb r0, [r2, r0]
	cmp r4, r0
	bne _022453C2
	add r0, r5, #0
	bl BattleScriptIncrementPointer
_022453C2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_022453C8: .word 0x00003044
_022453CC: .word 0x000003E2
	thumb_func_end BtlCmd_CheckCurMoveIsType

	thumb_func_start BtlCmd_GetMonDataFromNarc
BtlCmd_GetMonDataFromNarc: ; 0x022453D0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r6, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r4, #0
	bl BattleScriptReadWord
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl BattleScriptGetVarPointer
	add r1, r0, #0
	ldr r1, [r1]
	ldr r2, [sp]
	add r0, r6, #0
	bl GetMonBaseStat_HandleAlternateForme
	mov r1, #0x4d
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_GetMonDataFromNarc

	thumb_func_start BtlCmd_RefreshMonData
BtlCmd_RefreshMonData: ; 0x02245418
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetBattlerIDBySide
	add r2, r0, #0
	add r1, r4, #0
	ldr r3, _0224544C ; =0x0000219C
	add r4, r4, r2
	ldrb r3, [r4, r3]
	add r0, r5, #0
	bl ov12_0224EA14
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0224544C: .word 0x0000219C
	thumb_func_end BtlCmd_RefreshMonData

	thumb_func_start BtlCmd_222
BtlCmd_222: ; 0x02245450
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r5, #0
	bl BattleScriptReadWord
	add r7, r0, #0
	add r0, r5, #0
	bl BattleScriptReadWord
	add r4, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl GetBattlerIDBySide
	add r1, r0, #0
	add r0, r6, #0
	bl ov12_0223A9AC
	add r1, r4, #0
	mov r2, #5
	bl TrainerMessageWithIdPairExists
	cmp r0, #0
	beq _02245494
	mov r0, #0x13
	lsl r0, r0, #4
	str r4, [r5, r0]
	b _0224549C
_02245494:
	mov r0, #0x13
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
_0224549C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BtlCmd_222

	thumb_func_start BtlCmd_223
BtlCmd_223: ; 0x022454A0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r4, #0
	bl BattleScriptReadWord
	add r3, r0, #0
	mov r2, #1
	and r2, r3
	lsl r2, r2, #0x18
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x18
	bl ov12_022645C8
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BtlCmd_223

	thumb_func_start BtlCmd_EndScript
BtlCmd_EndScript: ; 0x022454CC
	ldr r2, _022454E0 ; =0x00003154
	mov r0, #1
	ldr r3, [r1, r2]
	bic r3, r0
	mov r0, #1
	orr r0, r3
	str r0, [r1, r2]
	ldr r3, _022454E4 ; =ov12_0224EC74
	add r0, r1, #0
	bx r3
	.balign 4, 0
_022454E0: .word 0x00003154
_022454E4: .word ov12_0224EC74
	thumb_func_end BtlCmd_EndScript

	thumb_func_start BattleScriptReadWord
BattleScriptReadWord: ; 0x022454E8
	add r1, r0, #0
	add r1, #0xb4
	ldr r1, [r1]
	lsl r1, r1, #2
	add r2, r0, r1
	mov r1, #0x27
	lsl r1, r1, #8
	ldr r2, [r2, r1]
	add r1, r0, #0
	add r1, #0xb4
	ldr r1, [r1]
	add r0, #0xb4
	add r1, r1, #1
	str r1, [r0]
	add r0, r2, #0
	bx lr
	thumb_func_end BattleScriptReadWord

	thumb_func_start BattleScriptIncrementPointer
BattleScriptIncrementPointer: ; 0x02245508
	add r2, r0, #0
	add r2, #0xb4
	ldr r2, [r2]
	add r0, #0xb4
	add r1, r2, r1
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end BattleScriptIncrementPointer

	thumb_func_start ov12_02245518
ov12_02245518: ; 0x02245518
	ldr r3, _0224551C ; =ReadBattleScriptFromNarc
	bx r3
	.balign 4, 0
_0224551C: .word ReadBattleScriptFromNarc
	thumb_func_end ov12_02245518

	thumb_func_start BattleScriptGotoSubscript
BattleScriptGotoSubscript: ; 0x02245520
	ldr r3, _02245524 ; =ov12_0224EBDC
	bx r3
	.balign 4, 0
_02245524: .word ov12_0224EBDC
	thumb_func_end BattleScriptGotoSubscript

	thumb_func_start BattleScriptGetVarPointer
BattleScriptGetVarPointer: ; 0x02245528
	push {r4, lr}
	add r4, r1, #0
	cmp r2, #0x46
	bls _02245532
	b _0224582C
_02245532:
	add r1, r2, r2
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224553E: ; jump table
	.short _022455CC - _0224553E - 2 ; case 0
	.short _022455D0 - _0224553E - 2 ; case 1
	.short _022455D6 - _0224553E - 2 ; case 2
	.short _022455DC - _0224553E - 2 ; case 3
	.short _022455E2 - _0224553E - 2 ; case 4
	.short _022455E8 - _0224553E - 2 ; case 5
	.short _022455EE - _0224553E - 2 ; case 6
	.short _022455F4 - _0224553E - 2 ; case 7
	.short _022455FC - _0224553E - 2 ; case 8
	.short _02245602 - _0224553E - 2 ; case 9
	.short _0224560A - _0224553E - 2 ; case 10
	.short _02245610 - _0224553E - 2 ; case 11
	.short _02245622 - _0224553E - 2 ; case 12
	.short _02245634 - _0224553E - 2 ; case 13
	.short _0224564A - _0224553E - 2 ; case 14
	.short _02245650 - _0224553E - 2 ; case 15
	.short _02245656 - _0224553E - 2 ; case 16
	.short _0224565C - _0224553E - 2 ; case 17
	.short _02245662 - _0224553E - 2 ; case 18
	.short _02245668 - _0224553E - 2 ; case 19
	.short _0224566E - _0224553E - 2 ; case 20
	.short _02245676 - _0224553E - 2 ; case 21
	.short _02245682 - _0224553E - 2 ; case 22
	.short _0224568A - _0224553E - 2 ; case 23
	.short _02245692 - _0224553E - 2 ; case 24
	.short _02245698 - _0224553E - 2 ; case 25
	.short _022456A0 - _0224553E - 2 ; case 26
	.short _022456A8 - _0224553E - 2 ; case 27
	.short _022456B0 - _0224553E - 2 ; case 28
	.short _022456B8 - _0224553E - 2 ; case 29
	.short _022456BE - _0224553E - 2 ; case 30
	.short _022456C4 - _0224553E - 2 ; case 31
	.short _022456CA - _0224553E - 2 ; case 32
	.short _022456D0 - _0224553E - 2 ; case 33
	.short _022456D6 - _0224553E - 2 ; case 34
	.short _022456DC - _0224553E - 2 ; case 35
	.short _022456E4 - _0224553E - 2 ; case 36
	.short _022456EC - _0224553E - 2 ; case 37
	.short _022456F4 - _0224553E - 2 ; case 38
	.short _022456FC - _0224553E - 2 ; case 39
	.short _02245702 - _0224553E - 2 ; case 40
	.short _0224570A - _0224553E - 2 ; case 41
	.short _02245718 - _0224553E - 2 ; case 42
	.short _02245726 - _0224553E - 2 ; case 43
	.short _0224572E - _0224553E - 2 ; case 44
	.short _02245734 - _0224553E - 2 ; case 45
	.short _02245742 - _0224553E - 2 ; case 46
	.short _02245750 - _0224553E - 2 ; case 47
	.short _02245760 - _0224553E - 2 ; case 48
	.short _02245770 - _0224553E - 2 ; case 49
	.short _02245782 - _0224553E - 2 ; case 50
	.short _02245788 - _0224553E - 2 ; case 51
	.short _0224578E - _0224553E - 2 ; case 52
	.short _02245794 - _0224553E - 2 ; case 53
	.short _022457A0 - _0224553E - 2 ; case 54
	.short _022457A6 - _0224553E - 2 ; case 55
	.short _022457AC - _0224553E - 2 ; case 56
	.short _022457B2 - _0224553E - 2 ; case 57
	.short _022457B8 - _0224553E - 2 ; case 58
	.short _022457BE - _0224553E - 2 ; case 59
	.short _022457C4 - _0224553E - 2 ; case 60
	.short _022457CC - _0224553E - 2 ; case 61
	.short _022457D2 - _0224553E - 2 ; case 62
	.short _022457D6 - _0224553E - 2 ; case 63
	.short _022457DC - _0224553E - 2 ; case 64
	.short _022457E2 - _0224553E - 2 ; case 65
	.short _022457F2 - _0224553E - 2 ; case 66
	.short _02245802 - _0224553E - 2 ; case 67
	.short _02245810 - _0224553E - 2 ; case 68
	.short _02245820 - _0224553E - 2 ; case 69
	.short _02245826 - _0224553E - 2 ; case 70
_022455CC:
	add r0, #0x2c
	pop {r4, pc}
_022455D0:
	ldr r0, _02245830 ; =0x0000214C
	add r0, r4, r0
	pop {r4, pc}
_022455D6:
	ldr r0, _02245834 ; =0x00002170
	add r0, r4, r0
	pop {r4, pc}
_022455DC:
	ldr r0, _02245838 ; =0x00002174
	add r0, r4, r0
	pop {r4, pc}
_022455E2:
	ldr r0, _0224583C ; =0x00002178
	add r0, r4, r0
	pop {r4, pc}
_022455E8:
	add r4, #0x88
	add r0, r4, #0
	pop {r4, pc}
_022455EE:
	ldr r0, _02245840 ; =0x0000213C
	add r0, r4, r0
	pop {r4, pc}
_022455F4:
	mov r0, #6
	lsl r0, r0, #6
	add r0, r4, r0
	pop {r4, pc}
_022455FC:
	ldr r0, _02245844 ; =0x00002158
	add r0, r4, r0
	pop {r4, pc}
_02245602:
	mov r0, #0x4d
	lsl r0, r0, #2
	add r0, r4, r0
	pop {r4, pc}
_0224560A:
	ldr r0, _02245848 ; =0x0000216C
	add r0, r4, r0
	pop {r4, pc}
_02245610:
	ldr r1, [r4, #0x64]
	bl ov12_0223AB1C
	mov r1, #0x6f
	lsl r1, r1, #2
	add r1, r4, r1
	lsl r0, r0, #2
	add r0, r1, r0
	pop {r4, pc}
_02245622:
	ldr r1, [r4, #0x6c]
	bl ov12_0223AB1C
	mov r1, #0x6f
	lsl r1, r1, #2
	add r1, r4, r1
	lsl r0, r0, #2
	add r0, r1, r0
	pop {r4, pc}
_02245634:
	add r1, r4, #0
	add r1, #0x94
	ldr r1, [r1]
	bl ov12_0223AB1C
	mov r1, #0x6f
	lsl r1, r1, #2
	add r1, r4, r1
	lsl r0, r0, #2
	add r0, r1, r0
	pop {r4, pc}
_0224564A:
	ldr r0, _0224584C ; =0x00002144
	add r0, r4, r0
	pop {r4, pc}
_02245650:
	add r4, #0x64
	add r0, r4, #0
	pop {r4, pc}
_02245656:
	add r4, #0x6c
	add r0, r4, #0
	pop {r4, pc}
_0224565C:
	add r4, #0x94
	add r0, r4, #0
	pop {r4, pc}
_02245662:
	add r4, #0x74
	add r0, r4, #0
	pop {r4, pc}
_02245668:
	add r4, #0x78
	add r0, r4, #0
	pop {r4, pc}
_0224566E:
	mov r0, #0x46
	lsl r0, r0, #2
	add r0, r4, r0
	pop {r4, pc}
_02245676:
	ldr r0, _02245850 ; =0x000030E4
	add r1, r4, r0
	ldr r0, [r4, #0x64]
	lsl r0, r0, #2
	add r0, r1, r0
	pop {r4, pc}
_02245682:
	mov r0, #0x13
	lsl r0, r0, #4
	add r0, r4, r0
	pop {r4, pc}
_0224568A:
	mov r0, #0x53
	lsl r0, r0, #2
	add r0, r4, r0
	pop {r4, pc}
_02245692:
	ldr r0, _02245854 ; =0x00003044
	add r0, r4, r0
	pop {r4, pc}
_02245698:
	mov r0, #0x15
	lsl r0, r0, #4
	add r0, r4, r0
	pop {r4, pc}
_022456A0:
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r4, r0
	pop {r4, pc}
_022456A8:
	mov r0, #0x12
	lsl r0, r0, #4
	add r0, r4, r0
	pop {r4, pc}
_022456B0:
	mov r0, #0xc1
	lsl r0, r0, #6
	add r0, r4, r0
	pop {r4, pc}
_022456B8:
	add r4, #0x98
	add r0, r4, #0
	pop {r4, pc}
_022456BE:
	ldr r0, _02245858 ; =0x00002154
	add r0, r4, r0
	pop {r4, pc}
_022456C4:
	add r4, #0x38
	add r0, r4, #0
	pop {r4, pc}
_022456CA:
	ldr r0, _0224585C ; =0x0000215C
	add r0, r4, r0
	pop {r4, pc}
_022456D0:
	ldr r1, _02245860 ; =0x00002420
	add r0, r0, r1
	pop {r4, pc}
_022456D6:
	add r4, #0x8c
	add r0, r4, #0
	pop {r4, pc}
_022456DC:
	mov r0, #0x49
	lsl r0, r0, #2
	add r0, r4, r0
	pop {r4, pc}
_022456E4:
	mov r0, #0x4a
	lsl r0, r0, #2
	add r0, r4, r0
	pop {r4, pc}
_022456EC:
	mov r0, #0x4b
	lsl r0, r0, #2
	add r0, r4, r0
	pop {r4, pc}
_022456F4:
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r4, r0
	pop {r4, pc}
_022456FC:
	ldr r0, _02245864 ; =0x00003104
	add r0, r4, r0
	pop {r4, pc}
_02245702:
	mov r0, #0x86
	lsl r0, r0, #6
	add r0, r4, r0
	pop {r4, pc}
_0224570A:
	mov r0, #0x7b
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, [r4, #0x64]
	lsl r0, r0, #6
	add r0, r1, r0
	pop {r4, pc}
_02245718:
	mov r0, #0x81
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, [r4, #0x64]
	lsl r0, r0, #6
	add r0, r1, r0
	pop {r4, pc}
_02245726:
	mov r0, #0x4e
	lsl r0, r0, #2
	add r0, r4, r0
	pop {r4, pc}
_0224572E:
	ldr r0, _02245868 ; =0x00002150
	add r0, r4, r0
	pop {r4, pc}
_02245734:
	mov r0, #0x82
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, [r4, #0x64]
	lsl r0, r0, #6
	add r0, r1, r0
	pop {r4, pc}
_02245742:
	mov r0, #0x82
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, [r4, #0x6c]
	lsl r0, r0, #6
	add r0, r1, r0
	pop {r4, pc}
_02245750:
	mov r0, #0xba
	lsl r0, r0, #2
	add r2, r4, r0
	ldr r1, [r4, #0x64]
	mov r0, #0x1c
	mul r0, r1
	add r0, r2, r0
	pop {r4, pc}
_02245760:
	mov r0, #0xba
	lsl r0, r0, #2
	add r2, r4, r0
	ldr r1, [r4, #0x6c]
	mov r0, #0x1c
	mul r0, r1
	add r0, r2, r0
	pop {r4, pc}
_02245770:
	mov r0, #0xba
	lsl r0, r0, #2
	add r2, r4, r0
	add r4, #0x94
	ldr r1, [r4]
	mov r0, #0x1c
	mul r0, r1
	add r0, r2, r0
	pop {r4, pc}
_02245782:
	ldr r0, _0224586C ; =0x00003114
	add r0, r4, r0
	pop {r4, pc}
_02245788:
	ldr r0, _02245870 ; =0x00003118
	add r0, r4, r0
	pop {r4, pc}
_0224578E:
	ldr r1, _02245874 ; =0x0000240C
	add r0, r0, r1
	pop {r4, pc}
_02245794:
	ldr r0, _02245878 ; =0x0000304C
	add r1, r4, r0
	ldr r0, [r4, #0x64]
	lsl r0, r0, #2
	add r0, r1, r0
	pop {r4, pc}
_022457A0:
	ldr r0, _0224587C ; =0x00002148
	add r0, r4, r0
	pop {r4, pc}
_022457A6:
	ldr r1, _02245880 ; =0x00002414
	add r0, r0, r1
	pop {r4, pc}
_022457AC:
	add r4, #0x7c
	add r0, r4, #0
	pop {r4, pc}
_022457B2:
	ldr r0, _02245884 ; =0x00002160
	add r0, r4, r0
	pop {r4, pc}
_022457B8:
	ldr r0, _02245888 ; =0x00002164
	add r0, r4, r0
	pop {r4, pc}
_022457BE:
	ldr r1, _0224588C ; =0x0000241C
	add r0, r0, r1
	pop {r4, pc}
_022457C4:
	mov r0, #0x85
	lsl r0, r0, #6
	add r0, r4, r0
	pop {r4, pc}
_022457CC:
	add r4, #0xec
	add r0, r4, #0
	pop {r4, pc}
_022457D2:
	add r0, #0x44
	pop {r4, pc}
_022457D6:
	add r4, #0x68
	add r0, r4, #0
	pop {r4, pc}
_022457DC:
	add r4, #0x70
	add r0, r4, #0
	pop {r4, pc}
_022457E2:
	mov r0, #0xb6
	lsl r0, r0, #2
	add r2, r4, r0
	ldr r1, [r4, #0x6c]
	mov r0, #0x1c
	mul r0, r1
	add r0, r2, r0
	pop {r4, pc}
_022457F2:
	mov r0, #0x21
	lsl r0, r0, #4
	add r1, r4, r0
	sub r0, #0xf8
	ldr r0, [r4, r0]
	lsl r0, r0, #6
	add r0, r1, r0
	pop {r4, pc}
_02245802:
	mov r0, #0x21
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, [r4, #0x6c]
	lsl r0, r0, #6
	add r0, r1, r0
	pop {r4, pc}
_02245810:
	mov r0, #0xbb
	lsl r0, r0, #2
	add r2, r4, r0
	ldr r1, [r4, #0x64]
	mov r0, #0x1c
	mul r0, r1
	add r0, r2, r0
	pop {r4, pc}
_02245820:
	ldr r0, _02245890 ; =0x00003150
	add r0, r4, r0
	pop {r4, pc}
_02245826:
	ldr r1, _02245894 ; =0x0000247C
	add r0, r0, r1
	pop {r4, pc}
_0224582C:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02245830: .word 0x0000214C
_02245834: .word 0x00002170
_02245838: .word 0x00002174
_0224583C: .word 0x00002178
_02245840: .word 0x0000213C
_02245844: .word 0x00002158
_02245848: .word 0x0000216C
_0224584C: .word 0x00002144
_02245850: .word 0x000030E4
_02245854: .word 0x00003044
_02245858: .word 0x00002154
_0224585C: .word 0x0000215C
_02245860: .word 0x00002420
_02245864: .word 0x00003104
_02245868: .word 0x00002150
_0224586C: .word 0x00003114
_02245870: .word 0x00003118
_02245874: .word 0x0000240C
_02245878: .word 0x0000304C
_0224587C: .word 0x00002148
_02245880: .word 0x00002414
_02245884: .word 0x00002160
_02245888: .word 0x00002164
_0224588C: .word 0x0000241C
_02245890: .word 0x00003150
_02245894: .word 0x0000247C
	thumb_func_end BattleScriptGetVarPointer

	thumb_func_start ov12_02245898
ov12_02245898: ; 0x02245898
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xd8
	add r4, r1, #0
	str r0, [sp, #0x14]
	ldr r0, [r4]
	bl ov12_0223A930
	str r0, [sp, #0x40]
	ldr r0, [r4]
	bl ov12_0223A7E0
	str r0, [sp, #0x3c]
	ldr r0, [r4, #4]
	mov r7, #0
	ldr r0, [r0, #0x74]
	ldr r5, [r4, #0x48]
	asr r1, r0, #1
	mov r0, #1
	and r0, r1
	str r0, [sp, #0x44]
	ldr r0, [r4]
	add r1, r7, #0
	bl ov12_0223A834
	cmp r5, r0
	bge _0224591A
	ldr r0, [sp, #0x44]
	lsl r0, r0, #2
	str r0, [sp, #0x28]
_022458D2:
	ldr r0, [r4]
	mov r1, #0
	add r2, r5, #0
	bl ov12_0223A880
	mov r1, #6
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #1
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0x33
	beq _0224591A
	add r0, r5, #0
	bl MaskOfFlagNo
	add r2, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [sp, #0x28]
	add r0, r0, r1
	add r0, #0xa4
	ldr r0, [r0]
	tst r0, r2
	bne _0224591A
	ldr r0, [r4]
	mov r1, #0
	add r5, r5, #1
	bl ov12_0223A834
	cmp r5, r0
	blt _022458D2
_0224591A:
	ldr r0, [r4]
	mov r1, #0
	bl ov12_0223A834
	cmp r5, r0
	bne _0224592C
	mov r0, #0x26
	str r0, [r4, #0x28]
	b _02245948
_0224592C:
	ldr r0, [sp, #0x3c]
	mov r2, #2
	tst r0, r2
	beq _02245948
	ldr r0, [sp, #0x3c]
	mov r1, #0x40
	tst r0, r1
	bne _02245948
	ldr r1, [r4, #4]
	ldr r0, _02245C30 ; =0x0000219E
	ldrb r0, [r1, r0]
	cmp r0, r5
	bne _02245948
	add r7, r2, #0
_02245948:
	ldr r0, [r4, #0x28]
	cmp r0, #0x26
	bls _02245952
	bl _022463B6
_02245952:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224595E: ; jump table
	.short _022459AC - _0224595E - 2 ; case 0
	.short _02245B7E - _0224595E - 2 ; case 1
	.short _02245B96 - _0224595E - 2 ; case 2
	.short _02245BA8 - _0224595E - 2 ; case 3
	.short _02245BD4 - _0224595E - 2 ; case 4
	.short _02245BE8 - _0224595E - 2 ; case 5
	.short _02245C20 - _0224595E - 2 ; case 6
	.short _02245D28 - _0224595E - 2 ; case 7
	.short _02245D44 - _0224595E - 2 ; case 8
	.short _02245D62 - _0224595E - 2 ; case 9
	.short _02245E0A - _0224595E - 2 ; case 10
	.short _02245F4A - _0224595E - 2 ; case 11
	.short _02245EC8 - _0224595E - 2 ; case 12
	.short _02245F4A - _0224595E - 2 ; case 13
	.short _02245F6C - _0224595E - 2 ; case 14
	.short _02245FCE - _0224595E - 2 ; case 15
	.short _02246082 - _0224595E - 2 ; case 16
	.short _022460E2 - _0224595E - 2 ; case 17
	.short _022460B4 - _0224595E - 2 ; case 18
	.short _022460E2 - _0224595E - 2 ; case 19
	.short _022460FA - _0224595E - 2 ; case 20
	.short _0224611A - _0224595E - 2 ; case 21
	.short _02246162 - _0224595E - 2 ; case 22
	.short _02246186 - _0224595E - 2 ; case 23
	.short _02246272 - _0224595E - 2 ; case 24
	.short _022460E2 - _0224595E - 2 ; case 25
	.short _0224629A - _0224595E - 2 ; case 26
	.short _022460E2 - _0224595E - 2 ; case 27
	.short _022462D6 - _0224595E - 2 ; case 28
	.short _022460E2 - _0224595E - 2 ; case 29
	.short _022462FE - _0224595E - 2 ; case 30
	.short _022461BE - _0224595E - 2 ; case 31
	.short _022460E2 - _0224595E - 2 ; case 32
	.short _022461E8 - _0224595E - 2 ; case 33
	.short _0224620A - _0224595E - 2 ; case 34
	.short _0224625A - _0224595E - 2 ; case 35
	.short _02246364 - _0224595E - 2 ; case 36
	.short _0224637A - _0224595E - 2 ; case 37
	.short _022463A0 - _0224595E - 2 ; case 38
_022459AC:
	add r0, r6, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #1
	mov r2, #5
	bl GetItemAttr
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x3c]
	mov r1, #1
	and r0, r1
	str r0, [sp, #0x20]
	bne _02245A0A
	ldr r1, [r4, #4]
	ldr r0, _02245C34 ; =0x00002E4C
	ldr r2, _02245C38 ; =0x00002FCC
	ldr r0, [r1, r0]
	ldr r1, [r1, r2]
	add r0, r0, r1
	bne _02245A0A
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02245A0A
	ldr r1, [r4, #4]
	ldr r0, _02245C3C ; =0x00003144
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _02245A0A
	ldr r0, _02245C40 ; =SEQ_GS_WIN2
	bl PlayBGM
	ldr r1, [r4, #4]
	ldr r0, _02245C3C ; =0x00003144
	mov r2, #1
	str r2, [r1, r0]
	ldr r0, [r4]
	mov r1, #2
	bl ov12_0223BD3C
_02245A0A:
	mov r0, #0
	str r0, [sp, #0x38]
	mov r1, #1
	add r0, sp, #0xb4
	strh r1, [r0, #2]
	ldr r2, [sp, #0x38]
	add r0, r6, #0
	mov r1, #0xa3
	bl GetMonData
	cmp r0, #0
	beq _02245A30
	add r0, r6, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	cmp r0, #0x64
	bne _02245A32
_02245A30:
	b _02245B3E
_02245A32:
	ldr r0, [r4, #4]
	str r0, [sp, #0x24]
	add r0, r5, #0
	bl MaskOfFlagNo
	ldr r1, [sp, #0x44]
	lsl r2, r1, #2
	ldr r1, [sp, #0x24]
	add r1, r1, r2
	add r1, #0xa4
	ldr r1, [r1]
	tst r0, r1
	beq _02245A54
	ldr r0, [sp, #0x24]
	add r0, #0x9c
	ldr r0, [r0]
	str r0, [sp, #0x38]
_02245A54:
	ldr r0, [sp, #0x18]
	cmp r0, #0x33
	bne _02245A68
	ldr r0, [sp, #0x24]
	add r0, #0xa0
	str r0, [sp, #0x24]
	ldr r1, [r0]
	ldr r0, [sp, #0x38]
	add r0, r0, r1
	str r0, [sp, #0x38]
_02245A68:
	ldr r0, [sp, #0x18]
	cmp r0, #0x42
	bne _02245A7C
	ldr r1, [sp, #0x38]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x64
	bl _u32_div_f
	str r0, [sp, #0x38]
_02245A7C:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _02245A90
	ldr r1, [sp, #0x38]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x64
	bl _u32_div_f
	str r0, [sp, #0x38]
_02245A90:
	ldr r0, [r4]
	add r1, r6, #0
	bl ov12_022568B0
	cmp r0, #0
	bne _02245AD2
	add r0, r6, #0
	mov r1, #0xc
	mov r2, #0
	bl GetMonData
	ldr r1, _02245C44 ; =gGameLanguage
	ldrb r1, [r1]
	cmp r1, r0
	beq _02245ABE
	ldr r1, [sp, #0x38]
	mov r0, #0xaa
	mul r0, r1
	mov r1, #0x64
	bl _u32_div_f
	str r0, [sp, #0x38]
	b _02245ACC
_02245ABE:
	ldr r1, [sp, #0x38]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x64
	bl _u32_div_f
	str r0, [sp, #0x38]
_02245ACC:
	mov r1, #2
	add r0, sp, #0xb4
	strh r1, [r0, #2]
_02245AD2:
	add r0, r6, #0
	mov r1, #8
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x4c]
	add r0, r6, #0
	bl GetMonBaseExperienceAtCurrentLevel
	ldr r1, [sp, #0x4c]
	sub r0, r1, r0
	str r0, [r4, #0x3c]
	ldr r1, [sp, #0x4c]
	ldr r0, [sp, #0x38]
	add r2, r1, r0
	str r2, [sp, #0x4c]
	ldr r3, [r4, #4]
	ldr r0, _02245C48 ; =0x0000219C
	add r1, r3, r7
	ldrb r0, [r1, r0]
	cmp r5, r0
	bne _02245B08
	mov r0, #0xc0
	mul r0, r7
	add r1, r3, r0
	ldr r0, _02245C4C ; =0x00002DA4
	str r2, [r1, r0]
_02245B08:
	add r0, r6, #0
	mov r1, #8
	add r2, sp, #0x4c
	bl SetMonData
	ldr r0, [r4, #4]
	ldr r1, [r0, #0x74]
	str r0, [sp, #0x1c]
	add r6, r1, #0
	mov r0, #0xc0
	mul r6, r0
	ldr r0, [r4]
	add r1, r7, #0
	bl ov12_0223A7F4
	ldr r2, [sp, #0x1c]
	mov r3, #0xb5
	add r6, r2, r6
	lsl r3, r3, #6
	ldrh r2, [r6, r3]
	add r3, #0x26
	ldrb r3, [r6, r3]
	add r1, r5, #0
	lsl r3, r3, #0x1b
	lsr r3, r3, #0x1b
	bl ov12_022463E8
_02245B3E:
	ldr r0, [sp, #0x38]
	cmp r0, #0
	beq _02245B76
	mov r1, #0x11
	add r0, sp, #0xb4
	strb r1, [r0, #1]
	lsl r0, r5, #8
	orr r0, r7
	str r0, [sp, #0xb8]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0xbc]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x40]
	add r2, sp, #0xb4
	bl ov12_0223C494
	str r0, [r4, #0x30]
	mov r0, #7
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245B76:
	mov r0, #0x25
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245B7E:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02245C2A
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245B96:
	ldr r0, [r4, #0x34]
	sub r0, r0, #1
	str r0, [r4, #0x34]
	bne _02245C2A
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245BA8:
	ldr r1, [r4, #4]
	ldr r0, _02245C48 ; =0x0000219C
	add r2, r1, r7
	ldrb r0, [r2, r0]
	cmp r5, r0
	bne _02245BCC
	ldr r0, [r4]
	ldr r3, [r4, #0x3c]
	add r2, r7, #0
	bl ov12_02263564
	mov r0, #0
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245BCC:
	mov r0, #5
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245BD4:
	ldr r0, [r4, #4]
	bl ov12_0224ED48
	cmp r0, #0
	beq _02245C2A
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245BE8:
	add r0, r6, #0
	bl Pokemon_TryLevelUp
	cmp r0, #0
	beq _02245C18
	ldr r1, [r4, #4]
	ldr r0, _02245C48 ; =0x0000219C
	add r2, r1, r7
	ldrb r0, [r2, r0]
	cmp r5, r0
	bne _02245C10
	ldr r0, [r4]
	add r2, r7, #0
	mov r3, #8
	bl ov12_02263848
	ldr r0, [r4]
	add r1, r7, #0
	bl ov12_0226399C
_02245C10:
	mov r0, #6
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245C18:
	mov r0, #0x25
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245C20:
	ldr r0, [r4, #4]
	bl ov12_0224ED48
	cmp r0, #0
	bne _02245C2C
_02245C2A:
	b _022463B6
_02245C2C:
	ldr r2, _02245C50 ; =ov12_0226C354
	b _02245C54
	.balign 4, 0
_02245C30: .word 0x0000219E
_02245C34: .word 0x00002E4C
_02245C38: .word 0x00002FCC
_02245C3C: .word 0x00003144
_02245C40: .word SEQ_GS_WIN2
_02245C44: .word gGameLanguage
_02245C48: .word 0x0000219C
_02245C4C: .word 0x00002DA4
_02245C50: .word ov12_0226C354
_02245C54:
	add r3, sp, #0x9c
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r6, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x34]
	mov r0, #5
	mov r1, #0x18
	bl AllocFromHeap
	mov r1, #0x5f
	ldr r2, [r4, #4]
	lsl r1, r1, #2
	str r0, [r2, r1]
	ldr r0, [r4, #4]
	ldr r0, [r0, r1]
	mov r1, #0
	str r0, [sp, #0x30]
	str r1, [sp, #0x50]
_02245C88:
	lsl r2, r1, #2
	add r1, sp, #0x9c
	ldr r1, [r1, r2]
	add r0, r6, #0
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x50]
	lsl r2, r1, #2
	ldr r1, [sp, #0x30]
	str r0, [r1, r2]
	ldr r0, [sp, #0x50]
	add r1, r0, #1
	str r1, [sp, #0x50]
	cmp r1, #6
	blt _02245C88
	ldr r0, [r4]
	bl ov12_0223AB60
	add r2, r0, #0
	lsl r2, r2, #0x10
	add r0, r6, #0
	mov r1, #0
	lsr r2, r2, #0x10
	bl MonApplyFriendshipMod
	add r0, r6, #0
	mov r1, #0
	bl ApplyMonMoodModifier
	add r0, r6, #0
	bl CalcMonStats
	ldr r1, [r4, #4]
	ldr r0, _02246010 ; =0x0000219C
	add r2, r1, r7
	ldrb r3, [r2, r0]
	cmp r5, r3
	bne _02245CDE
	ldr r0, [r4]
	add r2, r7, #0
	bl ov12_0224EA14
_02245CDE:
	add r0, r5, #0
	bl MaskOfFlagNo
	ldr r1, [r4, #4]
	ldr r2, _02246014 ; =0x00003109
	ldrb r3, [r1, r2]
	orr r0, r3
	strb r0, [r1, r2]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r7, #0
	bl ov12_02263A1C
	mov r1, #3
	add r0, sp, #0xb4
	strh r1, [r0, #2]
	mov r1, #0x11
	strb r1, [r0, #1]
	lsl r0, r5, #8
	orr r0, r7
	str r0, [sp, #0xb8]
	ldr r0, [sp, #0x34]
	str r0, [sp, #0xbc]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x40]
	add r2, sp, #0xb4
	bl ov12_0223C494
	str r0, [r4, #0x30]
	mov r0, #7
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245D28:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _02245D38
	b _022463B6
_02245D38:
	mov r0, #8
	str r0, [r4, #0x28]
	mov r0, #0
	add sp, #0xd8
	str r0, [r4, #0x38]
	pop {r3, r4, r5, r6, r7, pc}
_02245D44:
	ldr r0, [r4, #4]
	add r1, r0, r7
	ldr r0, _02246010 ; =0x0000219C
	ldrb r0, [r1, r0]
	cmp r5, r0
	beq _02245D5A
	ldr r0, [r4]
	add r1, r4, #0
	add r2, r6, #0
	bl ov12_02248228
_02245D5A:
	mov r0, #9
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245D62:
	ldr r0, [r4]
	bl ov12_0223A7D4
	add r6, r0, #0
	ldr r0, [r4]
	mov r1, #1
	bl ov12_0223A7D8
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223A938
	add r7, r0, #0
	ldr r0, _02246018 ; =0x04000008
	mov r2, #3
	ldrh r1, [r0]
	bic r1, r2
	mov r2, #2
	orr r1, r2
	strh r1, [r0]
	mov r0, #1
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	ldr r0, [r4]
	mov r1, #1
	bl ov12_0223C224
	mov r0, #5
	str r0, [sp]
	add r0, r6, #0
	mov r1, #2
	mov r2, #1
	mov r3, #0
	bl sub_0200E398
	bl sub_0200E3D8
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x80
	str r0, [sp, #8]
	add r0, r7, #0
	mov r1, #0x26
	mov r3, #5
	bl PaletteData_LoadNarc
	mov r0, #7
	str r0, [sp]
	mov r0, #0xe
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0xa
	str r0, [sp, #0x10]
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #2
	mov r3, #0x11
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0xff
	bl FillWindowPixelBuffer
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	mov r3, #8
	bl DrawFrameAndWindow1
	mov r0, #0xa
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245E0A:
	ldr r3, _0224601C ; =ov12_0226C36C
	add r2, sp, #0x84
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r3, _02246020 ; =ov12_0226C384
	add r2, sp, #0x6c
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	mov r1, #1
	bl ov12_0223A7D8
	add r7, r0, #0
	mov r0, #0x5f
	ldr r1, [r4, #4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	str r0, [sp, #0x2c]
	mov r0, #0
	str r0, [sp, #0x50]
_02245E42:
	ldr r2, _02246024 ; =0x000003B3
	add r1, sp, #0xb4
	strh r2, [r1, #2]
	mov r2, #4
	strb r2, [r1, #1]
	lsl r2, r0, #2
	add r1, sp, #0x84
	ldr r1, [r1, r2]
	lsl r0, r0, #4
	str r1, [sp, #0xb8]
	mov r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	add r0, r1, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r2, [sp, #0x40]
	add r1, r7, #0
	add r3, sp, #0xb4
	bl ov12_0223C4E8
	mov r1, #0xed
	ldr r5, [sp, #0x50]
	lsl r1, r1, #2
	add r0, sp, #0xb4
	strh r1, [r0, #2]
	mov r1, #7
	strb r1, [r0, #1]
	lsl r2, r5, #2
	add r1, sp, #0x6c
	ldr r1, [r1, r2]
	add r0, r6, #0
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x2c]
	lsl r2, r5, #2
	ldr r1, [r1, r2]
	ldr r2, [sp, #0x40]
	sub r0, r0, r1
	str r0, [sp, #0xb8]
	mov r0, #2
	str r0, [sp, #0xd0]
	mov r0, #0x50
	str r0, [sp]
	lsl r0, r5, #4
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, r7, #0
	add r3, sp, #0xb4
	bl ov12_0223C4E8
	ldr r0, [sp, #0x50]
	add r0, r0, #1
	str r0, [sp, #0x50]
	cmp r0, #6
	blt _02245E42
	mov r0, #0xb
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245EC8:
	ldr r3, _02246028 ; =ov12_0226C33C
	add r2, sp, #0x54
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	mov r1, #1
	bl ov12_0223A7D8
	mov r1, #0x24
	str r1, [sp]
	mov r1, #0x60
	str r1, [sp, #4]
	mov r1, #0xf
	mov r2, #0x50
	mov r3, #0
	add r7, r0, #0
	bl FillWindowPixelRect
	mov r1, #0
	str r1, [sp, #0x50]
	add r5, sp, #0xb4
_02245EFA:
	ldr r0, _0224602C ; =0x000003B5
	lsl r2, r1, #2
	add r1, sp, #0x54
	strh r0, [r5, #2]
	mov r0, #7
	ldr r1, [r1, r2]
	strb r0, [r5, #1]
	add r0, r6, #0
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xb8]
	mov r0, #3
	str r0, [sp, #0xd0]
	mov r0, #0x48
	str r0, [sp]
	ldr r0, [sp, #0x50]
	ldr r2, [sp, #0x40]
	lsl r0, r0, #4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0x24
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, r7, #0
	add r3, r5, #0
	bl ov12_0223C4E8
	ldr r0, [sp, #0x50]
	add r1, r0, #1
	str r1, [sp, #0x50]
	cmp r1, #6
	blt _02245EFA
	mov r0, #0xd
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245F4A:
	ldr r0, _02246030 ; =gSystem
	ldr r1, [r0, #0x48]
	ldr r0, _02246034 ; =0x00000C03
	tst r0, r1
	bne _02245F5C
	bl System_GetTouchNew
	cmp r0, #0
	beq _02245FEA
_02245F5C:
	ldr r0, _02246038 ; =0x000005DC
	bl PlaySE
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245F6C:
	ldr r0, [r4]
	mov r1, #1
	bl ov12_0223A7D8
	add r6, r0, #0
	mov r1, #0
	bl sub_0200E5D4
	add r0, r6, #0
	bl RemoveWindow
	ldr r1, _02246018 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strh r2, [r1]
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	mov r1, #1
	bl SetBgPriority
	ldr r0, [r4]
	mov r1, #0
	bl ov12_0223C224
	ldr r0, [r4, #4]
	add r1, r0, r7
	ldr r0, _02246010 ; =0x0000219C
	ldrb r0, [r1, r0]
	cmp r5, r0
	beq _02245FBA
	ldr r0, [r4]
	add r1, r4, #0
	bl ov12_022484D4
_02245FBA:
	mov r0, #0x5f
	ldr r1, [r4, #4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl FreeToHeap
	mov r0, #0xf
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245FCE:
	ldr r0, [r4]
	bl ov12_0223A7D4
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x38
	add r2, sp, #0x48
	bl MonTryLearnMoveOnLevelUp
	cmp r0, #0
	beq _02245FF4
	ldr r1, _0224603C ; =0x0000FFFE
	cmp r0, r1
	bne _02245FEC
_02245FEA:
	b _022463B6
_02245FEC:
	add r1, r1, #1
	cmp r0, r1
	beq _02245FFC
	b _0224600A
_02245FF4:
	mov r0, #3
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02245FFC:
	add r0, sp, #0x48
	ldrh r0, [r0]
	add sp, #0xd8
	str r0, [r4, #0x40]
	mov r0, #0x10
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_0224600A:
	ldr r1, [r4, #4]
	ldr r0, _02246010 ; =0x0000219C
	b _02246040
	.balign 4, 0
_02246010: .word 0x0000219C
_02246014: .word 0x00003109
_02246018: .word 0x04000008
_0224601C: .word ov12_0226C36C
_02246020: .word ov12_0226C384
_02246024: .word 0x000003B3
_02246028: .word ov12_0226C33C
_0224602C: .word 0x000003B5
_02246030: .word gSystem
_02246034: .word 0x00000C03
_02246038: .word 0x000005DC
_0224603C: .word 0x0000FFFE
_02246040:
	add r2, r1, r7
	ldrb r3, [r2, r0]
	cmp r5, r3
	bne _02246050
	ldr r0, [r4]
	add r2, r7, #0
	bl ov12_0224EA14
_02246050:
	mov r1, #4
	add r0, sp, #0xb4
	strh r1, [r0, #2]
	mov r1, #0xa
	strb r1, [r0, #1]
	lsl r0, r5, #8
	orr r0, r7
	str r0, [sp, #0xb8]
	add r0, sp, #0x48
	ldrh r0, [r0]
	str r0, [sp, #0xbc]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x40]
	add r2, sp, #0xb4
	bl ov12_0223C494
	str r0, [r4, #0x30]
	mov r0, #0x24
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246082:
	ldr r1, _022463BC ; =0x0000049A
	add r0, sp, #0xb4
	strh r1, [r0, #2]
	mov r1, #0xa
	strb r1, [r0, #1]
	lsl r0, r5, #8
	orr r0, r7
	str r0, [sp, #0xb8]
	ldr r0, [r4, #0x40]
	str r0, [sp, #0xbc]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x40]
	add r2, sp, #0xb4
	bl ov12_0223C494
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_022460B4:
	ldr r1, _022463C0 ; =0x0000049B
	add r0, sp, #0xb4
	strh r1, [r0, #2]
	mov r1, #2
	strb r1, [r0, #1]
	lsl r0, r5, #8
	orr r0, r7
	str r0, [sp, #0xb8]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x40]
	add r2, sp, #0xb4
	bl ov12_0223C494
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_022460E2:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02246126
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_022460FA:
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r3, _022463C4 ; =0x0000049C
	add r2, r7, #0
	bl ov12_0226337C
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_0224611A:
	ldr r0, [r4, #4]
	add r1, r7, #0
	bl ov12_0225682C
	cmp r0, #0
	bne _02246128
_02246126:
	b _022463B6
_02246128:
	ldr r0, [r4, #4]
	add r1, r7, #0
	bl ov12_0225682C
	cmp r0, #0xff
	bne _0224613C
	mov r0, #0x1f
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_0224613C:
	ldr r1, _022463C8 ; =0x0000049F
	add r0, sp, #0xb4
	strh r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #1]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x40]
	add r2, sp, #0xb4
	bl ov12_0223C494
	str r0, [r4, #0x30]
	mov r0, #0x16
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246162:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02246268
	ldr r0, [r4]
	ldr r2, [r4, #0x40]
	add r1, r7, #0
	add r3, r5, #0
	bl ov12_02263D14
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246186:
	ldr r0, [r4, #4]
	add r1, r7, #0
	bl ov12_0225682C
	cmp r0, #0xff
	bne _0224619A
	mov r0, #0x1f
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_0224619A:
	ldr r0, [r4, #4]
	add r1, r7, #0
	bl ov12_0225682C
	cmp r0, #0
	beq _02246268
	ldr r1, [r4, #4]
	lsl r0, r7, #8
	add r1, r1, r0
	mov r0, #0x23
	lsl r0, r0, #8
	ldrb r0, [r1, r0]
	add sp, #0xd8
	sub r0, r0, #1
	str r0, [r4, #0x44]
	mov r0, #0x18
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_022461BE:
	mov r1, #0x4a
	lsl r1, r1, #4
	add r0, sp, #0xb4
	strh r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #1]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x40]
	add r2, sp, #0xb4
	bl ov12_0223C494
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_022461E8:
	mov r0, #2
	str r0, [sp]
	ldr r0, [r4, #0x40]
	ldr r3, _022463CC ; =0x000004A1
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r7, #0
	bl ov12_0226337C
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_0224620A:
	ldr r0, [r4, #4]
	add r1, r7, #0
	bl ov12_0225682C
	cmp r0, #0
	beq _02246268
	ldr r0, [r4, #4]
	add r1, r7, #0
	bl ov12_0225682C
	cmp r0, #0xff
	bne _0224622A
	mov r0, #0x10
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_0224622A:
	ldr r1, _022463D0 ; =0x000004A4
	add r0, sp, #0xb4
	strh r1, [r0, #2]
	mov r1, #0xa
	strb r1, [r0, #1]
	lsl r0, r5, #8
	orr r0, r7
	str r0, [sp, #0xb8]
	ldr r0, [r4, #0x40]
	str r0, [sp, #0xbc]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x40]
	add r2, sp, #0xb4
	bl ov12_0223C494
	str r0, [r4, #0x30]
	mov r0, #0x23
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_0224625A:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0224626A
_02246268:
	b _022463B6
_0224626A:
	mov r0, #0xf
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246272:
	ldr r1, _022463D4 ; =0x000004A5
	add r0, sp, #0xb4
	strh r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #1]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x40]
	add r2, sp, #0xb4
	bl ov12_0223C494
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_0224629A:
	ldr r1, _022463D8 ; =0x000004A6
	add r0, sp, #0xb4
	strh r1, [r0, #2]
	mov r1, #0xa
	strb r1, [r0, #1]
	lsl r0, r5, #8
	orr r0, r7
	str r0, [sp, #0xb8]
	ldr r1, [r4, #0x44]
	add r0, r6, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xbc]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x40]
	add r2, sp, #0xb4
	bl ov12_0223C494
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_022462D6:
	ldr r1, _022463DC ; =0x000004A7
	add r0, sp, #0xb4
	strh r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #1]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x40]
	add r2, sp, #0xb4
	bl ov12_0223C494
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x28]
	add sp, #0xd8
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_022462FE:
	ldr r1, _022463E0 ; =0x000004A8
	add r0, sp, #0xb4
	strh r1, [r0, #2]
	mov r1, #0xa
	strb r1, [r0, #1]
	lsl r0, r5, #8
	orr r0, r7
	str r0, [sp, #0xb8]
	ldr r0, [r4, #0x40]
	str r0, [sp, #0xbc]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x40]
	add r2, sp, #0xb4
	bl ov12_0223C494
	str r0, [r4, #0x30]
	mov r0, #0
	str r0, [sp, #0x50]
	ldr r1, [r4, #0x44]
	add r0, r6, #0
	add r1, #0x3e
	add r2, sp, #0x50
	bl SetMonData
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x18
	bl MonSetMoveInSlot
	ldr r1, [r4, #4]
	ldr r0, _022463E4 ; =0x0000219C
	add r2, r1, r7
	ldrb r3, [r2, r0]
	cmp r5, r3
	bne _0224635C
	ldr r0, [r4]
	add r2, r7, #0
	bl ov12_0224EA14
_0224635C:
	mov r0, #0x24
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246364:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _022463B6
	mov r0, #0xf
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_0224637A:
	add r0, r5, #0
	bl MaskOfFlagNo
	ldr r1, [sp, #0x44]
	ldr r2, [r4, #4]
	mov r3, #0
	mvn r3, r3
	add r2, #0xa4
	lsl r1, r1, #2
	ldr r6, [r2, r1]
	eor r0, r3
	and r0, r6
	str r0, [r2, r1]
	add r0, r5, #1
	str r0, [r4, #0x48]
	mov r0, #0
	add sp, #0xd8
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_022463A0:
	mov r0, #0x5e
	ldr r1, [r4, #4]
	mov r2, #0
	lsl r0, r0, #2
	str r2, [r1, r0]
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [sp, #0x14]
	bl DestroySysTask
_022463B6:
	add sp, #0xd8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022463BC: .word 0x0000049A
_022463C0: .word 0x0000049B
_022463C4: .word 0x0000049C
_022463C8: .word 0x0000049F
_022463CC: .word 0x000004A1
_022463D0: .word 0x000004A4
_022463D4: .word 0x000004A5
_022463D8: .word 0x000004A6
_022463DC: .word 0x000004A7
_022463E0: .word 0x000004A8
_022463E4: .word 0x0000219C
	thumb_func_end ov12_02245898

	thumb_func_start ov12_022463E8
ov12_022463E8: ; 0x022463E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp]
	str r1, [sp, #4]
	add r0, r2, #0
	add r1, r3, #0
	mov r2, #5
	mov r4, #0
	bl AllocAndLoadMonPersonal_HandleAlternateForme
	add r7, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl GetPartyMonByIndex
	mov r1, #6
	add r2, r4, #0
	str r0, [sp, #0x14]
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r6, #0
	mov r1, #1
	mov r2, #5
	bl GetItemAttr
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #2
	mov r2, #5
	bl GetItemAttr
	add r6, r0, #0
	add r0, r4, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	add r0, sp, #0x20
	str r0, [sp, #0xc]
_02246436:
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	add r1, #0xd
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	add r0, r1, #0
	ldrb r1, [r0]
	ldr r0, [sp, #0x18]
	add r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x18]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #6
	blt _02246436
	mov r0, #0
	str r0, [sp, #8]
	add r0, sp, #0x20
	str r0, [sp, #0x10]
_0224646C:
	ldr r1, [sp, #0x18]
	ldr r0, _022465A4 ; =0x000001FE
	cmp r1, r0
	blo _02246476
	b _0224659A
_02246476:
	ldr r0, [sp, #8]
	cmp r0, #5
	bhi _02246522
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02246488: ; jump table
	.short _02246494 - _02246488 - 2 ; case 0
	.short _022464AC - _02246488 - 2 ; case 1
	.short _022464C4 - _02246488 - 2 ; case 2
	.short _022464DC - _02246488 - 2 ; case 3
	.short _022464F4 - _02246488 - 2 ; case 4
	.short _0224650C - _02246488 - 2 ; case 5
_02246494:
	add r0, r7, #0
	mov r1, #0xa
	bl GetPersonalAttr
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	cmp r5, #0x7a
	bne _02246522
	add r0, r4, r6
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	b _02246522
_022464AC:
	add r0, r7, #0
	mov r1, #0xb
	bl GetPersonalAttr
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	cmp r5, #0x75
	bne _02246522
	add r0, r4, r6
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	b _02246522
_022464C4:
	add r0, r7, #0
	mov r1, #0xc
	bl GetPersonalAttr
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	cmp r5, #0x76
	bne _02246522
	add r0, r4, r6
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	b _02246522
_022464DC:
	add r0, r7, #0
	mov r1, #0xd
	bl GetPersonalAttr
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	cmp r5, #0x79
	bne _02246522
	add r0, r4, r6
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	b _02246522
_022464F4:
	add r0, r7, #0
	mov r1, #0xe
	bl GetPersonalAttr
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	cmp r5, #0x77
	bne _02246522
	add r0, r4, r6
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	b _02246522
_0224650C:
	add r0, r7, #0
	mov r1, #0xf
	bl GetPersonalAttr
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	cmp r5, #0x78
	bne _02246522
	add r0, r4, r6
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
_02246522:
	ldr r0, [sp, #4]
	bl MaskOfFlagNo
	add r1, r0, #0
	lsl r1, r1, #0x18
	ldr r0, [sp]
	lsr r1, r1, #0x18
	bl Party_MaskMonsWithPokerus
	cmp r0, #0
	beq _0224653C
	lsl r0, r4, #0x11
	asr r4, r0, #0x10
_0224653C:
	cmp r5, #0x32
	bne _02246544
	lsl r0, r4, #0x11
	asr r4, r0, #0x10
_02246544:
	ldr r0, [sp, #0x18]
	ldr r1, _022465A4 ; =0x000001FE
	add r0, r0, r4
	cmp r0, r1
	ble _02246556
	sub r0, r0, r1
	sub r0, r4, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
_02246556:
	ldr r0, [sp, #0x10]
	ldrb r0, [r0]
	add r0, r0, r4
	cmp r0, #0xff
	ble _02246568
	sub r0, #0xff
	sub r0, r4, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
_02246568:
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x10]
	ldrb r0, [r0]
	add r1, r0, r4
	ldr r0, [sp, #0x10]
	strb r1, [r0]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #8]
	add r0, r0, r4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r1, #0xd
	bl SetMonData
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #6
	bge _0224659A
	b _0224646C
_0224659A:
	add r0, r7, #0
	bl FreeMonPersonal
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022465A4: .word 0x000001FE
	thumb_func_end ov12_022463E8

	thumb_func_start ov12_022465A8
ov12_022465A8: ; 0x022465A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x158
	add r4, r1, #0
	str r0, [sp, #0x10]
	ldr r0, [r4]
	bl ov12_0223A930
	str r0, [sp, #0x20]
	ldr r0, [r4]
	bl ov12_0223A938
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8D4
	mov r7, #1
	str r0, [sp, #0x24]
	add r0, r7, #0
	ldr r6, [r4, #4]
	bl MaskOfFlagNo
	ldr r1, _02246900 ; =0x00003108
	ldrb r1, [r6, r1]
	tst r0, r1
	beq _022465DC
	mov r7, #3
_022465DC:
	ldr r0, [r4, #0x28]
	cmp r0, #0x21
	bls _022465E6
	bl _02247216
_022465E6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022465F2: ; jump table
	.short _02246636 - _022465F2 - 2 ; case 0
	.short _022466F8 - _022465F2 - 2 ; case 1
	.short _02246744 - _022465F2 - 2 ; case 2
	.short _02246772 - _022465F2 - 2 ; case 3
	.short _0224679C - _022465F2 - 2 ; case 4
	.short _022467B0 - _022465F2 - 2 ; case 5
	.short _022467E4 - _022465F2 - 2 ; case 6
	.short _02246806 - _022465F2 - 2 ; case 7
	.short _02246826 - _022465F2 - 2 ; case 8
	.short _0224686C - _022465F2 - 2 ; case 9
	.short _0224688A - _022465F2 - 2 ; case 10
	.short _02246A18 - _022465F2 - 2 ; case 11
	.short _02246A66 - _022465F2 - 2 ; case 12
	.short _02246AFA - _022465F2 - 2 ; case 13
	.short _02246B7A - _022465F2 - 2 ; case 14
	.short _02246BC4 - _022465F2 - 2 ; case 15
	.short _02246BF4 - _022465F2 - 2 ; case 16
	.short _02246C84 - _022465F2 - 2 ; case 17
	.short _02246CAA - _022465F2 - 2 ; case 18
	.short _02246CEA - _022465F2 - 2 ; case 19
	.short _02246D42 - _022465F2 - 2 ; case 20
	.short _02246E2A - _022465F2 - 2 ; case 21
	.short _02246E78 - _022465F2 - 2 ; case 22
	.short _02246E78 - _022465F2 - 2 ; case 23
	.short _02246E78 - _022465F2 - 2 ; case 24
	.short _0224702E - _022465F2 - 2 ; case 25
	.short _02247094 - _022465F2 - 2 ; case 26
	.short _022470D0 - _022465F2 - 2 ; case 27
	.short _02247116 - _022465F2 - 2 ; case 28
	.short _02247146 - _022465F2 - 2 ; case 29
	.short _0224715E - _022465F2 - 2 ; case 30
	.short _02247174 - _022465F2 - 2 ; case 31
	.short _022471AC - _022465F2 - 2 ; case 32
	.short _022471DC - _022465F2 - 2 ; case 33
_02246636:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _022466B0
	mov r0, #3
	str r0, [sp, #0x138]
	mov r0, #5
	str r0, [sp, #0x134]
	ldr r0, _02246904 ; =0x00004E20
	add r0, r7, r0
	str r0, [sp, #0x13c]
	ldr r0, [r4, #0x2c]
	str r0, [sp, #0x140]
	ldr r0, [r4]
	bl ov12_0223A8E4
	str r0, [sp, #0x14c]
	ldr r0, [r4]
	bl ov12_0223A938
	str r0, [sp, #0x150]
	mov r0, #1
	str r0, [sp, #0x144]
	mov r0, #0
	str r0, [sp, #0x148]
	ldr r0, [r4]
	str r0, [sp, #0x154]
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	beq _02246686
	cmp r7, #1
	bne _02246680
	mov r0, #0x10
	str r0, [sp, #0x130]
	b _0224668A
_02246680:
	mov r0, #0x11
	str r0, [sp, #0x130]
	b _0224668A
_02246686:
	mov r0, #0xf
	str r0, [sp, #0x130]
_0224668A:
	add r0, sp, #0x130
	bl ov07_02233DB8
	str r0, [r4, #8]
	mov r0, #1
	str r0, [r4, #0x28]
	ldr r0, _02246908 ; =0x0000070A
	bl PlaySE
	ldr r2, [r4]
	ldr r0, _0224690C ; =0x00002422
	ldrh r1, [r2, r0]
	add r1, r1, #1
	strh r1, [r2, r0]
	ldr r0, [r4, #8]
	mov r1, #0
	bl ov07_02232F58
	b _022466F0
_022466B0:
	ldr r0, [r4]
	mov r1, #0
	bl BattleSys_GetOpponentDataByBattlerId
	add r5, r0, #0
	add r0, #0x88
	ldr r0, [r0]
	bl ov07_02233F20
	cmp r0, #4
	beq _022466F0
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	add r5, #0x88
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r5]
	mov r0, #1
	str r0, [r4, #0x28]
	ldr r0, _02246908 ; =0x0000070A
	bl PlaySE
	ldr r2, [r4]
	ldr r0, _0224690C ; =0x00002422
	ldrh r1, [r2, r0]
	add r1, r1, #1
	strh r1, [r2, r0]
	ldr r0, [r4, #8]
	mov r1, #0
	bl ov07_02232F58
_022466F0:
	mov r0, #0
	add sp, #0x158
	str r0, [r4, #0x40]
	pop {r3, r4, r5, r6, r7, pc}
_022466F8:
	ldr r0, [r4, #8]
	mov r1, #0
	bl ov07_02232F60
	cmp r0, #0
	bne _02246788
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #1
	tst r0, r1
	beq _02246728
	ldr r0, _02246910 ; =0x000005E6
	mov r1, #0x75
	bl sub_0200602C
	ldr r0, [r4, #8]
	mov r1, #2
	bl ov07_02232F58
	mov r0, #0x1a
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246728:
	ldr r0, _02246914 ; =0x00000708
	mov r1, #0x75
	bl sub_0200602C
	ldr r0, [r4, #8]
	mov r1, #1
	bl ov07_02232F58
	mov r0, #2
	str r0, [r4, #0x28]
	mov r0, #0x17
	add sp, #0x158
	str r0, [r4, #0x34]
	pop {r3, r4, r5, r6, r7, pc}
_02246744:
	ldr r0, [r4, #0x34]
	sub r0, r0, #1
	str r0, [r4, #0x34]
	bne _02246788
	ldr r0, [r4]
	ldr r2, [r4, #0x2c]
	add r1, r7, #0
	bl ov12_022628A0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl ov12_02247228
	str r0, [r4, #0x38]
	cmp r0, #4
	bge _02246766
	b _02246768
_02246766:
	mov r0, #3
_02246768:
	str r0, [r4, #0x3c]
	mov r0, #3
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246772:
	ldr r0, [r4, #8]
	mov r1, #1
	bl ov07_02232F60
	cmp r0, #0
	bne _02246788
	ldr r0, [r4, #4]
	bl ov12_0224ED48
	cmp r0, #0
	bne _0224678C
_02246788:
	bl _02247216
_0224678C:
	ldr r0, [r4, #8]
	mov r1, #3
	bl ov07_02232F58
	mov r0, #4
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_0224679C:
	ldr r0, [r4, #8]
	mov r1, #3
	bl ov07_02232F60
	cmp r0, #0
	bne _0224689E
	mov r0, #5
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_022467B0:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _022467D0
	ldr r0, [r4, #0x38]
	cmp r0, #4
	bne _022467C8
	mov r0, #7
	str r0, [r4, #0x28]
	mov r0, #0xc
	add sp, #0x158
	str r0, [r4, #0x34]
	pop {r3, r4, r5, r6, r7, pc}
_022467C8:
	mov r0, #0x1d
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_022467D0:
	ldr r0, [r4, #8]
	mov r1, #4
	bl ov07_02232F58
	mov r0, #6
	str r0, [r4, #0x28]
	mov r0, #0xc
	add sp, #0x158
	str r0, [r4, #0x34]
	pop {r3, r4, r5, r6, r7, pc}
_022467E4:
	ldr r0, [r4, #8]
	mov r1, #4
	bl ov07_02232F60
	cmp r0, #0
	bne _0224689E
	ldr r0, [r4, #0x34]
	sub r0, r0, #1
	str r0, [r4, #0x34]
	bne _0224689E
	ldr r0, [r4, #0x3c]
	add sp, #0x158
	sub r0, r0, #1
	str r0, [r4, #0x3c]
	mov r0, #5
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246806:
	ldr r0, [r4, #0x34]
	sub r0, r0, #1
	str r0, [r4, #0x34]
	bne _0224689E
	ldr r0, [r4, #8]
	mov r1, #6
	bl ov07_02232F58
	ldr r0, _02246918 ; =0x00000709
	mov r1, #0x75
	bl sub_0200602C
	mov r0, #8
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246826:
	ldr r0, [r4, #8]
	mov r1, #6
	bl ov07_02232F60
	cmp r0, #0
	bne _0224689E
	ldr r1, _0224691C ; =0x00000363
	add r0, sp, #0x10c
	strh r1, [r0, #2]
	mov r1, #0x82
	strb r1, [r0, #1]
	str r7, [sp, #0x110]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x20]
	add r2, sp, #0x10c
	bl ov12_0223C494
	str r0, [r4, #0x30]
	mov r0, #0x1e
	str r0, [r4, #0x34]
	mov r0, #9
	str r0, [r4, #0x28]
	ldr r0, _02246920 ; =SEQ_GS_WIN2
	bl PlayBGM
	ldr r0, [r4]
	mov r1, #2
	bl ov12_0223BD3C
	add sp, #0x158
	pop {r3, r4, r5, r6, r7, pc}
_0224686C:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0224689E
	mov r0, #0xa
	str r0, [r4, #0x28]
	ldr r0, [r4, #8]
	mov r1, #7
	bl ov07_02232F58
	add sp, #0x158
	pop {r3, r4, r5, r6, r7, pc}
_0224688A:
	ldr r0, [r4, #8]
	mov r1, #7
	bl ov07_02232F60
	cmp r0, #0
	bne _0224689E
	ldr r0, [r4, #0x34]
	sub r0, r0, #1
	str r0, [r4, #0x34]
	beq _022468A2
_0224689E:
	bl _02247216
_022468A2:
	ldr r0, [r4]
	add r1, r7, #0
	bl ov12_0223BD8C
	ldr r2, [r4, #4]
	ldr r0, [r4]
	add r3, r2, r7
	ldr r2, _02246924 ; =0x0000219C
	add r1, r7, #0
	ldrb r2, [r3, r2]
	bl ov12_0223A880
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #6
	lsl r1, r1, #8
	tst r0, r1
	beq _02246950
	ldr r2, [r4, #4]
	ldr r0, [r4]
	add r3, r2, r7
	ldr r2, _02246924 ; =0x0000219C
	add r1, r7, #0
	ldrb r2, [r3, r2]
	bl ov12_0223A880
	add r2, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl ov12_022567D4
	ldr r0, [r4]
	bl ov12_0223AB34
	mov r1, #1
	bl sub_0201649C
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, _02246928 ; =0x0000FFFF
	b _0224692C
	nop
_02246900: .word 0x00003108
_02246904: .word 0x00004E20
_02246908: .word 0x0000070A
_0224690C: .word 0x00002422
_02246910: .word 0x000005E6
_02246914: .word 0x00000708
_02246918: .word 0x00000709
_0224691C: .word 0x00000363
_02246920: .word SEQ_GS_WIN2
_02246924: .word 0x0000219C
_02246928: .word 0x0000FFFF
_0224692C:
	add r0, r5, #0
	mov r1, #0xf
	mov r3, #1
	bl sub_02003370
	mov r1, #0
	ldr r0, [sp, #0x24]
	mov r2, #0x10
	add r3, r1, #0
	str r1, [sp]
	bl sub_020090E4
	mov r0, #0x21
	str r0, [r4, #0x28]
	mov r0, #1
	add sp, #0x158
	str r0, [r4, #0x40]
	pop {r3, r4, r5, r6, r7, pc}
_02246950:
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	ldr r0, [r4]
	bl ov12_0223C330
	cmp r0, #0
	beq _022469E6
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #1
	lsl r1, r1, #0xc
	tst r0, r1
	ldr r0, [r4]
	beq _022469B0
	bl ov12_0223AB34
	mov r1, #1
	bl sub_0201649C
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, _02246CB8 ; =0x0000FFFF
	add r0, r5, #0
	mov r1, #0xf
	mov r3, #1
	bl sub_02003370
	mov r1, #0
	ldr r0, [sp, #0x24]
	mov r2, #0x10
	add r3, r1, #0
	str r1, [sp]
	bl sub_020090E4
	mov r0, #0x16
	str r0, [r4, #0x28]
	mov r0, #1
	add sp, #0x158
	str r0, [r4, #0x40]
	pop {r3, r4, r5, r6, r7, pc}
_022469B0:
	bl ov12_0223AB34
	mov r1, #1
	bl sub_0201649C
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, _02246CB8 ; =0x0000FFFF
	add r0, r5, #0
	mov r1, #5
	mov r3, #1
	bl sub_02003370
	mov r1, #0
	ldr r0, [sp, #0x24]
	mov r2, #0x10
	add r3, r1, #0
	str r1, [sp]
	bl sub_020090E4
	mov r0, #0x10
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_022469E6:
	ldr r1, _02246CBC ; =0x00000367
	add r0, sp, #0xe8
	strh r1, [r0, #2]
	mov r1, #0x82
	strb r1, [r0, #1]
	str r7, [sp, #0xec]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x20]
	add r2, sp, #0xe8
	bl ov12_0223C494
	str r0, [r4, #0x30]
	mov r0, #0x1e
	str r0, [r4, #0x34]
	mov r0, #0xb
	str r0, [r4, #0x28]
	ldr r0, [r4]
	bl ov12_0223BB44
	add sp, #0x158
	pop {r3, r4, r5, r6, r7, pc}
_02246A18:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02246A70
	ldr r0, [r4, #0x34]
	sub r0, r0, #1
	str r0, [r4, #0x34]
	bne _02246A70
	mov r0, #0xc
	str r0, [r4, #0x28]
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, _02246CB8 ; =0x0000FFFF
	add r0, r5, #0
	mov r1, #5
	mov r3, #1
	bl sub_02003370
	mov r1, #0
	ldr r0, [sp, #0x24]
	str r1, [sp]
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020090E4
	ldr r0, [r4]
	bl ov12_0223AB34
	mov r1, #1
	bl sub_0201649C
	add sp, #0x158
	pop {r3, r4, r5, r6, r7, pc}
_02246A66:
	add r0, r5, #0
	bl sub_02003B44
	cmp r0, #0
	beq _02246A72
_02246A70:
	b _02247216
_02246A72:
	ldr r0, [r4, #8]
	bl ov07_02233ECC
	ldr r0, [sp, #0x24]
	bl sub_0200878C
	ldr r0, [r4]
	bl ov12_02237CC4
	ldr r0, [r4]
	mov r1, #0
	bl ov12_0223A8F4
	mov r1, #0
	bl ov12_02265FC4
	ldr r0, [r4]
	mov r1, #1
	bl ov12_0223A8F4
	mov r1, #0
	bl ov12_02265FC4
	ldr r0, [r4]
	mov r1, #0
	bl BattleSys_GetOpponentDataByBattlerId
	mov r1, #0
	bl ov12_02261294
	ldr r0, [r4]
	bl ov12_0223A7D4
	str r0, [sp, #0xd0]
	ldr r0, [r4]
	bl ov12_0223A938
	str r0, [sp, #0xd4]
	ldr r0, [sp, #0x24]
	add r1, r7, #0
	str r0, [sp, #0xd8]
	mov r0, #5
	str r0, [sp, #0xe4]
	ldr r2, [r4, #4]
	ldr r0, [r4]
	add r3, r2, r7
	ldr r2, _02246CC0 ; =0x0000219C
	ldrb r2, [r3, r2]
	bl ov12_0223A880
	str r0, [sp, #0xdc]
	ldr r0, [r4]
	bl ov12_0223A93C
	bl Pokedex_IsNatDexEnabled
	str r0, [sp, #0xe0]
	bl sub_02021BD0
	str r0, [r4, #0x54]
	add r0, sp, #0xd0
	bl ov18_021F8974
	str r0, [r4, #0x50]
	mov r0, #0xd
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246AFA:
	ldr r0, [r4, #0x50]
	bl ov18_021F89C8
	cmp r0, #1
	bne _02246BFE
	ldr r0, _02246CC4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02246B14
	mov r0, #0xe
	str r0, [r4, #0x28]
	b _02246B26
_02246B14:
	bl System_GetTouchNew
	cmp r0, #0
	beq _02246B26
	ldr r0, _02246CC8 ; =0x000005DC
	bl PlaySE
	mov r0, #0xe
	str r0, [r4, #0x28]
_02246B26:
	ldr r0, [r4, #0x28]
	cmp r0, #0xe
	bne _02246BFE
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #1
	lsl r1, r1, #0xc
	tst r0, r1
	ldr r2, _02246CB8 ; =0x0000FFFF
	beq _02246B62
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r5, #0
	mov r1, #0xf
	mov r3, #1
	bl sub_02003370
	mov r1, #0
	ldr r0, [sp, #0x24]
	mov r2, #0x10
	add r3, r1, #0
	str r1, [sp]
	bl sub_020090E4
	add sp, #0x158
	pop {r3, r4, r5, r6, r7, pc}
_02246B62:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r5, #0
	mov r1, #5
	mov r3, #1
	bl sub_02003370
	add sp, #0x158
	pop {r3, r4, r5, r6, r7, pc}
_02246B7A:
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #1
	lsl r1, r1, #0xc
	tst r0, r1
	beq _02246B90
	mov r0, #0x17
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246B90:
	ldr r0, [r4, #0x50]
	bl ov18_021F95F8
	add r5, r0, #0
	mov r1, #0
	mov r2, #4
	bl sub_02008C2C
	add r0, r5, #0
	mov r1, #0
	bl sub_02008A78
	cmp r0, #0x80
	blt _02246BFE
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x80
	bl sub_020087A4
	ldr r0, [r4, #0x50]
	bl ov18_021F95AC
	mov r0, #0xf
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246BC4:
	ldr r0, [r4, #0x50]
	bl ov18_021F89D0
	ldr r0, [r4, #0x54]
	bl sub_02021BEC
	ldr r0, [r4]
	bl ov12_02237D00
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r2, _02246CB8 ; =0x0000FFFF
	add r0, r5, #0
	mov r1, #5
	mov r3, #1
	bl sub_02003370
	mov r0, #0x11
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246BF4:
	add r0, r5, #0
	bl sub_02003B44
	cmp r0, #0
	beq _02246C00
_02246BFE:
	b _02247216
_02246C00:
	ldr r2, [r4, #4]
	ldr r0, [r4]
	add r3, r2, r7
	ldr r2, _02246CC0 ; =0x0000219C
	add r1, r7, #0
	ldrb r2, [r3, r2]
	bl ov12_0223A880
	add r6, r0, #0
	ldr r0, [r4, #8]
	bl ov07_02233ECC
	ldr r0, [sp, #0x24]
	bl sub_0200878C
	ldr r0, [r4]
	mov r1, #0
	bl BattleSys_GetOpponentDataByBattlerId
	mov r1, #0
	bl ov12_02261294
	ldr r0, [r4]
	bl ov12_02237CC4
	ldr r0, [r4]
	bl ov12_02237D00
	add r0, sp, #0xc0
	add r1, r6, #0
	mov r2, #2
	bl GetPokemonSpriteCharAndPlttNarcIds
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	add r1, sp, #0xc0
	mov r2, #0x80
	mov r3, #0x48
	bl sub_020085EC
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r2, _02246CB8 ; =0x0000FFFF
	add r0, r5, #0
	mov r1, #5
	mov r3, #1
	bl sub_02003370
	mov r2, #0
	ldr r0, [sp, #0x24]
	mov r1, #0x10
	add r3, r2, #0
	str r2, [sp]
	bl sub_020090E4
	mov r0, #0x11
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246C84:
	add r0, r5, #0
	bl sub_02003B44
	cmp r0, #0
	bne _02246D4C
	mov r0, #0x12
	str r0, [r4, #0x28]
	ldr r0, [r4]
	bl ov12_0223AB34
	mov r1, #0
	bl sub_0201649C
	add r0, r5, #0
	mov r1, #1
	bl sub_02003B50
	add sp, #0x158
	pop {r3, r4, r5, r6, r7, pc}
_02246CAA:
	ldr r1, [r4, #4]
	mov r0, #5
	str r0, [sp]
	mov r2, #0
	ldr r0, _02246CC0 ; =0x0000219C
	b _02246CCC
	nop
_02246CB8: .word 0x0000FFFF
_02246CBC: .word 0x00000367
_02246CC0: .word 0x0000219C
_02246CC4: .word gSystem
_02246CC8: .word 0x000005DC
_02246CCC:
	str r2, [sp, #4]
	add r3, r1, r7
	ldrb r0, [r3, r0]
	mov r3, #0xd9
	lsl r3, r3, #2
	orr r0, r7
	str r0, [sp, #8]
	ldr r0, [r4]
	bl ov12_0226337C
	ldr r0, [r4, #0x28]
	add sp, #0x158
	add r0, r0, #1
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246CEA:
	add r0, r6, #0
	mov r1, #0
	bl ov12_0225682C
	cmp r0, #0
	beq _02246D4C
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov12_0225682C
	cmp r0, #0xff
	bne _02246D0A
	mov r0, #0x16
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246D0A:
	ldr r0, [r4]
	bl ov12_0223AB34
	mov r1, #1
	bl sub_0201649C
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, _02247060 ; =0x0000FFFF
	add r0, r5, #0
	mov r1, #0xf
	mov r3, #1
	bl sub_02003370
	mov r1, #0
	ldr r0, [sp, #0x24]
	mov r2, #0x10
	add r3, r1, #0
	str r1, [sp]
	bl sub_020090E4
	mov r0, #0x14
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246D42:
	add r0, r5, #0
	bl sub_02003B44
	cmp r0, #0
	beq _02246D4E
_02246D4C:
	b _02247216
_02246D4E:
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	ldr r2, [r4, #4]
	ldr r0, [r4]
	add r3, r2, r7
	ldr r2, _02247064 ; =0x0000219C
	add r1, r7, #0
	ldrb r2, [r3, r2]
	bl ov12_0223A880
	mov r1, #5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223B6CC
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #5
	mov r1, #1
	add r2, r5, #0
	mov r3, #0xa
	bl sub_020830D8
	add r5, r0, #0
	str r5, [r4, #0x54]
	ldr r0, [r4]
	mov r1, #0
	bl ov12_0223A834
	cmp r0, #6
	bge _02246DA6
	mov r0, #0
	b _02246DB0
_02246DA6:
	ldr r0, [r4]
	bl ov12_0223BB1C
	ldr r1, _02247068 ; =0x00000496
	add r0, r0, r1
_02246DB0:
	str r0, [r5, #0x44]
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	str r0, [r5, #8]
	ldr r0, [r4]
	bl ov12_0223AB3C
	str r0, [r5, #0x48]
	add r0, r6, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	str r0, [r5, #0x10]
	ldr r0, _0224706C ; =_02102610
	add r1, r5, #0
	mov r2, #5
	bl OverlayManager_new
	str r0, [r4, #0x50]
	mov r0, #0x15
	str r0, [r4, #0x28]
	ldr r0, [r4]
	bl ov12_0223BCF0
	ldr r0, [r4]
	mov r5, #0
	bl BattleSys_GetMaxBattlers
	cmp r0, #0
	ble _02246E18
	add r7, r5, #0
_02246DF6:
	ldr r0, [r4]
	add r1, r5, #0
	bl BattleSys_GetOpponentDataByBattlerId
	add r6, r0, #0
	ldr r0, [r6, #0x18]
	cmp r0, #0
	beq _02246E0C
	bl sub_0200D9DC
	str r7, [r6, #0x18]
_02246E0C:
	ldr r0, [r4]
	add r5, r5, #1
	bl BattleSys_GetMaxBattlers
	cmp r5, r0
	blt _02246DF6
_02246E18:
	ldr r0, [r4]
	bl ov12_02237B6C
	ldr r0, [r4]
	mov r1, #1
	bl ov12_0223BBF0
	add sp, #0x158
	pop {r3, r4, r5, r6, r7, pc}
_02246E2A:
	ldr r0, [r4, #0x50]
	bl OverlayManager_run
	cmp r0, #0
	beq _02246E82
	ldr r2, [r4, #4]
	ldr r5, [r4, #0x54]
	add r3, r2, r7
	ldr r2, _02247064 ; =0x0000219C
	ldr r0, [r4]
	ldrb r2, [r3, r2]
	add r1, r7, #0
	bl ov12_0223A880
	ldr r1, [r5, #0x14]
	cmp r1, #0
	bne _02246E5C
	ldr r2, [r5, #0x18]
	mov r1, #0x78
	bl SetMonData
	ldr r0, [r4]
	mov r1, #0x32
	bl ov12_0223BB28
_02246E5C:
	add r0, r5, #0
	bl sub_0208311C
	ldr r0, [r4, #0x50]
	bl OverlayManager_delete
	ldr r0, [r4]
	mov r1, #2
	bl ov12_0223BBF0
	mov r0, #0x18
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246E78:
	add r0, r5, #0
	bl sub_02003B44
	cmp r0, #0
	beq _02246E84
_02246E82:
	b _02247216
_02246E84:
	ldr r0, [r4]
	mov r1, #0
	bl ov12_0223A7F4
	ldr r2, [r4, #4]
	str r0, [sp, #0x28]
	add r3, r2, r7
	ldr r2, _02247064 ; =0x0000219C
	ldr r0, [r4]
	ldrb r2, [r3, r2]
	add r1, r7, #0
	bl ov12_0223A880
	add r6, r0, #0
	ldr r0, [r4]
	add r1, r7, #0
	bl ov12_0223C2F0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r6, #0
	bl ov12_022567D4
	ldr r0, [r4]
	add r1, r6, #0
	bl ov12_0223B870
	mov r1, #0
	ldr r0, [r4]
	add r2, r1, #0
	mov r3, #0xa
	bl ov12_02263F0C
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #1
	lsl r1, r1, #0xc
	tst r0, r1
	beq _02246F14
	ldr r0, [r4, #0x28]
	cmp r0, #0x17
	bne _02246EEC
	ldr r0, [r4, #0x50]
	bl ov18_021F89D0
	ldr r0, [r4, #0x54]
	bl sub_02021BEC
	ldr r0, [r4]
	bl ov12_02237D00
_02246EEC:
	ldr r0, [r4]
	bl ov12_0223C134
	add r1, r0, #0
	add r0, r6, #0
	bl CopyPokemonToPokemon
	ldr r0, [r4, #0x28]
	cmp r0, #0x16
	bne _02246F0C
	ldr r0, [r4]
	bl ov12_0223AB34
	mov r1, #1
	bl sub_0201649C
_02246F0C:
	mov r0, #0x21
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246F14:
	ldr r0, [sp, #0x28]
	add r1, r6, #0
	bl AddMonToParty
	cmp r0, #1
	bne _02246F5E
	ldr r0, [r4, #0x28]
	cmp r0, #0x16
	bne _02246F56
	ldr r0, [r4]
	bl ov12_0223AB34
	mov r1, #1
	bl sub_0201649C
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, _02247060 ; =0x0000FFFF
	add r0, r5, #0
	mov r1, #0xf
	mov r3, #1
	bl sub_02003370
	mov r1, #0
	ldr r0, [sp, #0x24]
	mov r2, #0x10
	add r3, r1, #0
	str r1, [sp]
	bl sub_020090E4
_02246F56:
	mov r0, #0x21
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02246F5E:
	ldr r0, [r4]
	bl ov12_0223AB3C
	str r0, [sp, #0x1c]
	bl PCStorage_GetActiveBox
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	bl PCStorage_FindFirstBoxWithEmptySlot
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x14]
	bl PCStorage_SetActiveBox
	mov r5, #0
_02246F7E:
	add r1, r5, #0
	add r0, r6, #0
	add r1, #0x42
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	str r0, [sp, #0x2c]
	add r0, r6, #0
	add r1, #0x3a
	add r2, sp, #0x2c
	bl SetMonData
	add r5, r5, #1
	cmp r5, #4
	blt _02246F7E
	add r0, r6, #0
	bl Mon_UpdateGiratinaForme
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02246FB4
	ldr r0, [r4]
	add r1, r7, #0
	bl ov12_0223C2F0
_02246FB4:
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x14]
	bl PCStorage_PlaceMonInBoxFirstEmptySlot
	ldr r0, [r4, #0x28]
	cmp r0, #0x16
	bne _02247026
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	ldr r0, [r4]
	bne _02246FEC
	bl ov12_0223BB1C
	ldr r1, _02247068 ; =0x00000496
	add r1, r0, r1
	add r0, sp, #0x9c
	strh r1, [r0, #2]
	mov r1, #0x93
	strb r1, [r0, #1]
	ldr r0, [sp, #0x18]
	str r7, [sp, #0xa0]
	str r0, [sp, #0xa4]
	b _02247006
_02246FEC:
	bl ov12_0223BB1C
	ldr r1, _02247070 ; =0x00000498
	add r1, r0, r1
	add r0, sp, #0x9c
	strh r1, [r0, #2]
	mov r1, #0xaf
	strb r1, [r0, #1]
	ldr r0, [sp, #0x18]
	str r7, [sp, #0xa0]
	str r0, [sp, #0xa4]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0xa8]
_02247006:
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x20]
	add r2, sp, #0x9c
	bl ov12_0223C494
	str r0, [r4, #0x30]
	mov r0, #0x1e
	str r0, [r4, #0x34]
	mov r0, #0x19
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02247026:
	mov r0, #0x21
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_0224702E:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _022470E6
	ldr r0, [r4, #0x34]
	sub r0, r0, #1
	str r0, [r4, #0x34]
	bne _022470E6
	ldr r0, [r4]
	bl ov12_0223AB34
	mov r1, #1
	bl sub_0201649C
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, _02247060 ; =0x0000FFFF
	b _02247074
	nop
_02247060: .word 0x0000FFFF
_02247064: .word 0x0000219C
_02247068: .word 0x00000496
_0224706C: .word _02102610
_02247070: .word 0x00000498
_02247074:
	add r0, r5, #0
	mov r1, #0xf
	mov r3, #1
	bl sub_02003370
	mov r1, #0
	ldr r0, [sp, #0x24]
	mov r2, #0x10
	add r3, r1, #0
	str r1, [sp]
	bl sub_020090E4
	mov r0, #0x21
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02247094:
	ldr r0, [r4, #8]
	mov r1, #2
	bl ov07_02232F60
	cmp r0, #0
	bne _022470E6
	ldr r0, [r4, #8]
	bl ov07_02233ECC
	ldr r1, _0224721C ; =0x0000035B
	add r0, sp, #0x78
	strh r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #1]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x20]
	add r2, sp, #0x78
	bl ov12_0223C494
	str r0, [r4, #0x30]
	mov r0, #0x1e
	str r0, [r4, #0x34]
	mov r0, #0x1b
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_022470D0:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _022470E6
	ldr r0, [r4, #0x34]
	sub r0, r0, #1
	str r0, [r4, #0x34]
	beq _022470E8
_022470E6:
	b _02247216
_022470E8:
	mov r1, #0xd7
	lsl r1, r1, #2
	add r0, sp, #0x2c
	strh r1, [r0, #0x2a]
	mov r1, #0
	add r0, sp, #0x54
	strb r1, [r0, #1]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x20]
	add r2, sp, #0x54
	bl ov12_0223C494
	str r0, [r4, #0x30]
	mov r0, #0x1e
	str r0, [r4, #0x34]
	mov r0, #0x1c
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02247116:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02247216
	ldr r0, [r4, #0x34]
	sub r0, r0, #1
	str r0, [r4, #0x34]
	bne _02247216
	mov r0, #0x5e
	ldr r1, [r4, #4]
	mov r2, #0
	lsl r0, r0, #2
	str r2, [r1, r0]
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [sp, #0x10]
	bl DestroySysTask
	add sp, #0x158
	pop {r3, r4, r5, r6, r7, pc}
_02247146:
	ldr r0, [r4]
	ldr r2, [r4, #0x2c]
	add r1, r7, #0
	mov r3, #1
	bl ov12_02262524
	mov r0, #0x1e
	str r0, [r4, #0x28]
	mov r0, #2
	add sp, #0x158
	str r0, [r4, #0x34]
	pop {r3, r4, r5, r6, r7, pc}
_0224715E:
	ldr r0, [r4, #0x34]
	sub r0, r0, #1
	str r0, [r4, #0x34]
	bne _02247216
	ldr r0, [r4, #8]
	bl ov07_02233ECC
	mov r0, #0x1f
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_02247174:
	add r0, r6, #0
	bl ov12_0224ED48
	cmp r0, #0
	beq _02247216
	ldr r1, [r4, #0x38]
	ldr r0, _02247220 ; =0x0000035F
	add r1, r1, r0
	add r0, sp, #0x2c
	strh r1, [r0, #6]
	mov r1, #0
	strb r1, [r0, #5]
	ldr r0, [r4]
	bl ov12_0223B718
	add r3, r0, #0
	ldr r0, [r4]
	ldr r1, [sp, #0x20]
	add r2, sp, #0x30
	bl ov12_0223C494
	str r0, [r4, #0x30]
	mov r0, #0x1e
	str r0, [r4, #0x34]
	mov r0, #0x20
	add sp, #0x158
	str r0, [r4, #0x28]
	pop {r3, r4, r5, r6, r7, pc}
_022471AC:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02247216
	ldr r0, [r4, #0x34]
	sub r0, r0, #1
	str r0, [r4, #0x34]
	bne _02247216
	mov r0, #0x5e
	ldr r1, [r4, #4]
	mov r2, #0
	lsl r0, r0, #2
	str r2, [r1, r0]
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [sp, #0x10]
	bl DestroySysTask
	add sp, #0x158
	pop {r3, r4, r5, r6, r7, pc}
_022471DC:
	add r0, r5, #0
	bl sub_02003B44
	cmp r0, #0
	bne _02247216
	ldr r0, [r4, #0x40]
	cmp r0, #0
	beq _022471F8
	ldr r0, [r4, #8]
	bl ov07_02233ECC
	ldr r0, [sp, #0x24]
	bl sub_0200878C
_022471F8:
	ldr r1, [r4]
	ldr r0, _02247224 ; =0x00002420
	mov r2, #4
	strb r2, [r1, r0]
	mov r0, #0x5e
	ldr r1, [r4, #4]
	mov r2, #0
	lsl r0, r0, #2
	str r2, [r1, r0]
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [sp, #0x10]
	bl DestroySysTask
_02247216:
	add sp, #0x158
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224721C: .word 0x0000035B
_02247220: .word 0x0000035F
_02247224: .word 0x00002420
	thumb_func_end ov12_022465A8

	thumb_func_start ov12_02247228
ov12_02247228: ; 0x02247228
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	add r4, r1, #0
	bl ov12_0223A7E0
	mov r1, #6
	lsl r1, r1, #8
	tst r0, r1
	beq _02247242
	add sp, #0xc
	mov r0, #4
	pop {r4, r5, r6, r7, pc}
_02247242:
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, #0x6c]
	cmp r0, #5
	bne _02247278
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	mov r0, #0xb5
	lsl r0, r0, #6
	ldrh r0, [r1, r0]
	mov r1, #8
	bl GetMonBaseStat
	ldr r1, _02247528 ; =0x0000311C
	ldr r2, _0224752C ; =ov12_0226C3CE
	ldrb r1, [r4, r1]
	lsl r1, r1, #1
	ldrb r2, [r2, r1]
	mul r2, r0
	add r0, r2, #0
	ldr r2, _02247530 ; =ov12_0226C3CF
	ldrb r1, [r2, r1]
	bl _s32_div_f
	b _0224728A
_02247278:
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	mov r0, #0xb5
	lsl r0, r0, #6
	ldrh r0, [r1, r0]
	mov r1, #8
	bl GetMonBaseStat
_0224728A:
	add r5, r0, #0
	mov r0, #0xa
	str r0, [sp, #4]
	ldr r1, [r4, #0x6c]
	add r0, r4, #0
	mov r2, #0x1b
	mov r3, #0
	bl GetBattlerVar
	add r6, r0, #0
	ldr r1, [r4, #0x6c]
	add r0, r4, #0
	mov r2, #0x1c
	mov r3, #0
	bl GetBattlerVar
	add r3, r0, #0
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #5
	bgt _022472B8
	b _02247522
_022472B8:
	add r2, r0, #0
	add r2, #0xc6
	cmp r1, r2
	bgt _02247316
	add r2, r0, #0
	add r2, #0xc6
	cmp r1, r2
	blt _022472CA
	b _0224745E
_022472CA:
	add r2, r0, #0
	add r2, #0xc4
	cmp r1, r2
	bgt _0224730C
	add r2, r0, #0
	add r2, #0xc4
	cmp r1, r2
	blt _022472DC
	b _02247410
_022472DC:
	cmp r1, #0xf
	bhi _02247314
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_022472EC: ; jump table
	.short _0224750E - _022472EC - 2 ; case 0
	.short _0224750E - _022472EC - 2 ; case 1
	.short _0224750E - _022472EC - 2 ; case 2
	.short _0224750E - _022472EC - 2 ; case 3
	.short _0224750E - _022472EC - 2 ; case 4
	.short _0224750E - _022472EC - 2 ; case 5
	.short _02247364 - _022472EC - 2 ; case 6
	.short _0224737A - _022472EC - 2 ; case 7
	.short _0224738A - _022472EC - 2 ; case 8
	.short _022473AA - _022472EC - 2 ; case 9
	.short _022473C8 - _022472EC - 2 ; case 10
	.short _0224750E - _022472EC - 2 ; case 11
	.short _0224750E - _022472EC - 2 ; case 12
	.short _022473DC - _022472EC - 2 ; case 13
	.short _0224750E - _022472EC - 2 ; case 14
	.short _02247402 - _022472EC - 2 ; case 15
_0224730C:
	ldr r0, _02247534 ; =0x000001ED
	cmp r1, r0
	bne _02247314
	b _0224742C
_02247314:
	b _0224750E
_02247316:
	add r2, r0, #0
	add r2, #0xc8
	cmp r1, r2
	bgt _02247332
	add r2, r0, #0
	add r2, #0xc8
	cmp r1, r2
	blt _02247328
	b _022474AC
_02247328:
	add r0, #0xc7
	cmp r1, r0
	bne _02247330
	b _0224746E
_02247330:
	b _0224750E
_02247332:
	add r2, r0, #0
	add r2, #0xc9
	cmp r1, r2
	bgt _02247340
	add r0, #0xc9
	cmp r1, r0
	b _0224750E
_02247340:
	add r2, r0, #0
	add r2, #0xcb
	cmp r1, r2
	bgt _02247362
	add r2, r0, #0
	add r2, #0xca
	cmp r1, r2
	blt _02247362
	add r2, r0, #0
	add r2, #0xca
	cmp r1, r2
	bne _0224735A
	b _022474E2
_0224735A:
	add r0, #0xcb
	cmp r1, r0
	bne _02247362
	b _02247508
_02247362:
	b _0224750E
_02247364:
	cmp r6, #0xb
	beq _02247374
	cmp r3, #0xb
	beq _02247374
	cmp r6, #6
	beq _02247374
	cmp r3, #6
	bne _022473FA
_02247374:
	mov r0, #0x1e
	str r0, [sp, #4]
	b _02247512
_0224737A:
	add r0, r7, #0
	bl ov12_0223AB40
	cmp r0, #7
	bne _022473FA
	mov r0, #0x23
	str r0, [sp, #4]
	b _02247512
_0224738A:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _02247538 ; =0x00002D74
	ldrb r1, [r1, r0]
	cmp r1, #0x28
	bhs _022473FA
	mov r0, #0x28
	sub r0, r0, r1
	str r0, [sp, #4]
	cmp r0, #0xa
	bhs _022473FA
	mov r0, #0xa
	str r0, [sp, #4]
	b _02247512
_022473AA:
	ldr r2, [r4, #0x6c]
	mov r1, #0xc0
	mul r1, r2
	add r2, r4, r1
	mov r1, #0xb5
	lsl r1, r1, #6
	ldrh r1, [r2, r1]
	add r0, r7, #0
	bl ov12_0223C330
	cmp r0, #1
	bne _022473FA
	mov r0, #0x1e
	str r0, [sp, #4]
	b _02247512
_022473C8:
	add r0, #0x28
	ldr r0, [r4, r0]
	str r0, [sp, #4]
	add r0, #0xa
	str r0, [sp, #4]
	cmp r0, #0x28
	bls _022473FA
	mov r0, #0x28
	str r0, [sp, #4]
	b _02247512
_022473DC:
	add r0, r7, #0
	bl ov12_0223B520
	cmp r0, #3
	beq _022473FC
	add r0, r7, #0
	bl ov12_0223B520
	cmp r0, #4
	beq _022473FC
	add r0, r7, #0
	bl ov12_0223AB40
	cmp r0, #5
	beq _022473FC
_022473FA:
	b _02247512
_022473FC:
	mov r0, #0x23
	str r0, [sp, #4]
	b _02247512
_02247402:
	add r0, #0x28
	ldr r0, [r4, r0]
	cmp r0, #1
	bge _02247506
	mov r0, #0x28
	str r0, [sp, #4]
	b _02247512
_02247410:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	mov r0, #0xb5
	lsl r0, r0, #6
	ldrh r0, [r1, r0]
	mov r1, #3
	bl GetMonBaseStat
	cmp r0, #0x64
	blo _02247512
	lsl r5, r5, #2
	b _02247512
_0224742C:
	ldr r0, [r4, #0x64]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	ldr r3, [r4, #0x6c]
	add r0, r4, r2
	ldr r2, _02247538 ; =0x00002D74
	mul r1, r3
	add r1, r4, r1
	ldrb r0, [r0, r2]
	ldrb r2, [r1, r2]
	cmp r0, r2
	bls _02247512
	lsr r1, r0, #1
	cmp r1, r2
	bgt _02247450
	lsl r5, r5, #1
	b _02247512
_02247450:
	lsr r0, r0, #2
	cmp r0, r2
	bgt _0224745A
	lsl r5, r5, #2
	b _02247512
_0224745A:
	lsl r5, r5, #3
	b _02247512
_0224745E:
	add r0, r7, #0
	bl ov12_0223AAB8
	cmp r0, #0
	beq _02247512
	lsl r0, r5, #1
	add r5, r5, r0
	b _02247512
_0224746E:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	mov r0, #0xb5
	lsl r0, r0, #6
	ldrh r0, [r1, r0]
	bl ov12_02247668
	mov r2, #1
	lsl r2, r2, #0xc
	cmp r0, r2
	blt _0224748C
	add r5, #0x28
	b _02247512
_0224748C:
	mov r1, #3
	lsl r1, r1, #0xa
	cmp r0, r1
	blt _02247498
	add r5, #0x1e
	b _02247512
_02247498:
	lsr r1, r2, #1
	cmp r0, r1
	blt _022474A2
	add r5, #0x14
	b _02247512
_022474A2:
	lsr r0, r2, #2
	cmp r5, r0
	bge _02247512
	sub r5, #0x14
	b _02247512
_022474AC:
	ldr r2, [r4, #0x6c]
	mov r0, #0xc0
	add r1, r2, #0
	ldr r2, [r4, #0x64]
	mul r1, r0
	mul r0, r2
	add r3, r4, r0
	mov r0, #0xb5
	lsl r0, r0, #6
	add r6, r4, r1
	ldrh r2, [r3, r0]
	ldrh r1, [r6, r0]
	cmp r2, r1
	bne _02247512
	add r1, r0, #0
	add r1, #0x7e
	add r0, #0x7e
	ldrb r1, [r3, r1]
	ldrb r0, [r6, r0]
	lsl r1, r1, #0x1c
	lsl r0, r0, #0x1c
	lsr r1, r1, #0x1c
	lsr r0, r0, #0x1c
	cmp r1, r0
	beq _02247512
	lsl r5, r5, #3
	b _02247512
_022474E2:
	ldr r3, [r4, #0x6c]
	mov r2, #0xc0
	mul r2, r3
	add r3, r4, r2
	mov r2, #0xb5
	lsl r2, r2, #6
	ldrh r3, [r3, r2]
	ldr r1, _0224753C ; =ov12_0226C3E8
	mov r0, #0
_022474F4:
	ldrh r2, [r1]
	cmp r2, r3
	bne _022474FE
	lsl r5, r5, #2
	b _02247512
_022474FE:
	add r0, r0, #1
	add r1, r1, #2
	cmp r0, #0xe
	blo _022474F4
_02247506:
	b _02247512
_02247508:
	mov r0, #0xf
	str r0, [sp, #4]
	b _02247512
_0224750E:
	mov r0, #0xa
	str r0, [sp, #4]
_02247512:
	cmp r5, #0xff
	ble _0224751A
	mov r5, #0xff
	b _0224754A
_0224751A:
	cmp r5, #0
	bge _0224754A
	mov r5, #1
	b _0224754A
_02247522:
	ldr r0, _02247540 ; =ov12_0226C2EC
	b _02247544
	nop
_02247528: .word 0x0000311C
_0224752C: .word ov12_0226C3CE
_02247530: .word ov12_0226C3CF
_02247534: .word 0x000001ED
_02247538: .word 0x00002D74
_0224753C: .word ov12_0226C3E8
_02247540: .word ov12_0226C2EC
_02247544:
	sub r1, r1, #2
	ldrb r0, [r0, r1]
	str r0, [sp, #4]
_0224754A:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	add r6, r1, #0
	mul r6, r0
	ldr r0, _0224764C ; =0x00002D90
	add r1, r4, r6
	ldr r1, [r1, r0]
	lsl r0, r1, #1
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r1, #0xa
	mul r0, r5
	bl _u32_div_f
	ldr r1, _02247650 ; =0x00002D8C
	add r2, r4, r6
	ldr r1, [r2, r1]
	lsl r2, r1, #1
	ldr r1, [sp]
	sub r1, r1, r2
	mul r1, r0
	add r0, r1, #0
	ldr r1, [sp]
	bl _u32_div_f
	add r1, r0, #0
	ldr r0, _02247654 ; =0x00002DAC
	add r2, r4, r6
	ldr r2, [r2, r0]
	mov r0, #0x27
	tst r0, r2
	beq _0224758E
	lsl r1, r1, #1
_0224758E:
	mov r0, #0xd8
	tst r0, r2
	beq _022475A0
	mov r0, #0xf
	mul r0, r1
	mov r1, #0xa
	bl _u32_div_f
	add r1, r0, #0
_022475A0:
	cmp r1, #0xff
	blo _022475A8
	mov r5, #4
	b _02247618
_022475A8:
	ldr r0, _02247658 ; =0x040002B0
	mov r2, #0
	strh r2, [r0]
	mov r0, #0xff
	lsl r0, r0, #0x10
	bl _u32_div_f
	ldr r1, _0224765C ; =0x040002B8
	add r2, r1, #0
	str r0, [r1]
	sub r2, #8
	lsr r0, r1, #0xb
_022475C0:
	ldrh r1, [r2]
	tst r1, r0
	bne _022475C0
	ldr r0, _02247658 ; =0x040002B0
	lsr r1, r0, #0xb
_022475CA:
	ldrh r2, [r0]
	tst r2, r1
	bne _022475CA
	ldr r3, _02247660 ; =0x040002B4
	mov r1, #0
	ldr r2, [r3]
	strh r1, [r0]
	str r2, [r3, #4]
	sub r2, r3, #4
	lsr r0, r3, #0xb
_022475DE:
	ldrh r1, [r2]
	tst r1, r0
	bne _022475DE
	ldr r2, _02247658 ; =0x040002B0
	lsr r0, r2, #0xb
_022475E8:
	ldrh r1, [r2]
	tst r1, r0
	bne _022475E8
	ldr r1, _02247660 ; =0x040002B4
	ldr r0, _02247664 ; =0x000FFFF0
	ldr r1, [r1]
	bl _u32_div_f
	add r6, r0, #0
	mov r5, #0
_022475FC:
	add r0, r7, #0
	bl BattleSys_Random
	cmp r0, r6
	bhs _0224760C
	add r5, r5, #1
	cmp r5, #4
	blt _022475FC
_0224760C:
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02247618
	mov r5, #4
_02247618:
	cmp r5, #4
	bge _02247622
	add sp, #0xc
	add r0, r5, #0
	pop {r4, r5, r6, r7, pc}
_02247622:
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r0, #0xc9
	cmp r1, r0
	bne _02247646
	mov r1, #0xc8
	add r0, sp, #8
	strb r1, [r0]
	ldr r1, [r4, #0x6c]
	add r0, r7, #0
	mov r2, #0
	bl ov12_0223A880
	mov r1, #9
	add r2, sp, #8
	bl SetMonData
_02247646:
	add r0, r5, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0224764C: .word 0x00002D90
_02247650: .word 0x00002D8C
_02247654: .word 0x00002DAC
_02247658: .word 0x040002B0
_0224765C: .word 0x040002B8
_02247660: .word 0x040002B4
_02247664: .word 0x000FFFF0
	thumb_func_end ov12_02247228

	thumb_func_start ov12_02247668
ov12_02247668: ; 0x02247668
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #1
	mov r0, #0x4a
	mov r2, #0
	mov r3, #3
	str r1, [sp]
	bl GfGfxLoader_LoadFromNarc
	lsl r1, r4, #2
	ldr r4, [r0, r1]
	bl FreeToHeap
	add r0, r4, #0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov12_02247668

	thumb_func_start GetBattlerIDBySide
GetBattlerIDBySide: ; 0x0224768C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r6, r1, #0
	cmp r2, #0x16
	bgt _022476D6
	cmp r2, #0
	blt _022476DC
	add r1, r2, r2
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022476A8: ; jump table
	.short _022476DC - _022476A8 - 2 ; case 0
	.short _022476DC - _022476A8 - 2 ; case 1
	.short _022476E0 - _022476A8 - 2 ; case 2
	.short _0224777C - _022476A8 - 2 ; case 3
	.short _022476F8 - _022476A8 - 2 ; case 4
	.short _022476E4 - _022476A8 - 2 ; case 5
	.short _022476E8 - _022476A8 - 2 ; case 6
	.short _022476EC - _022476A8 - 2 ; case 7
	.short _022476F2 - _022476A8 - 2 ; case 8
	.short _022477A2 - _022476A8 - 2 ; case 9
	.short _0224771E - _022476A8 - 2 ; case 10
	.short _022477CA - _022476A8 - 2 ; case 11
	.short _02247746 - _022476A8 - 2 ; case 12
	.short _022476DC - _022476A8 - 2 ; case 13
	.short _02247800 - _022476A8 - 2 ; case 14
	.short _02247808 - _022476A8 - 2 ; case 15
	.short _02247810 - _022476A8 - 2 ; case 16
	.short _0224784C - _022476A8 - 2 ; case 17
	.short _022476DC - _022476A8 - 2 ; case 18
	.short _02247888 - _022476A8 - 2 ; case 19
	.short _022478B2 - _022476A8 - 2 ; case 20
	.short _022478DC - _022476A8 - 2 ; case 21
	.short _022476E8 - _022476A8 - 2 ; case 22
_022476D6:
	cmp r2, #0xff
	bne _022476DC
	b _022478DC
_022476DC:
	ldr r5, [r6, #0x64]
	b _022478E2
_022476E0:
	ldr r5, [r6, #0x6c]
	b _022478E2
_022476E4:
	ldr r5, [r6, #0x74]
	b _022478E2
_022476E8:
	ldr r5, [r6, #0x78]
	b _022478E2
_022476EC:
	add r6, #0x94
	ldr r5, [r6]
	b _022478E2
_022476F2:
	add r6, #0x80
	ldr r5, [r6]
	b _022478E2
_022476F8:
	bl BattleSys_GetMaxBattlers
	add r6, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _0224771C
	mov r7, #1
_02247706:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSys_GetOpponentDataByBattlerId
	ldr r1, _022478F0 ; =0x00000195
	ldrb r0, [r0, r1]
	tst r0, r7
	bne _0224771C
	add r5, r5, #1
	cmp r5, r6
	blt _02247706
_0224771C:
	b _022478E2
_0224771E:
	bl BattleSys_GetMaxBattlers
	add r6, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _02247744
	ldr r7, _022478F0 ; =0x00000195
_0224772C:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSys_GetOpponentDataByBattlerId
	ldrb r0, [r0, r7]
	cmp r0, #3
	beq _02247744
	cmp r0, #1
	beq _02247744
	add r5, r5, #1
	cmp r5, r6
	blt _0224772C
_02247744:
	b _022478E2
_02247746:
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	beq _02247754
	mov r6, #5
	b _02247756
_02247754:
	mov r6, #1
_02247756:
	add r0, r4, #0
	bl BattleSys_GetMaxBattlers
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _0224777A
_02247764:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSys_GetOpponentDataByBattlerId
	ldr r1, _022478F0 ; =0x00000195
	ldrb r0, [r0, r1]
	cmp r0, r6
	beq _0224777A
	add r5, r5, #1
	cmp r5, r7
	blt _02247764
_0224777A:
	b _022478E2
_0224777C:
	bl BattleSys_GetMaxBattlers
	add r6, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _022477A0
	mov r7, #1
_0224778A:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSys_GetOpponentDataByBattlerId
	ldr r1, _022478F0 ; =0x00000195
	ldrb r0, [r0, r1]
	tst r0, r7
	beq _022477A0
	add r5, r5, #1
	cmp r5, r6
	blt _0224778A
_022477A0:
	b _022478E2
_022477A2:
	bl BattleSys_GetMaxBattlers
	add r6, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _022477C8
	ldr r7, _022478F0 ; =0x00000195
_022477B0:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSys_GetOpponentDataByBattlerId
	ldrb r0, [r0, r7]
	cmp r0, #2
	beq _022477C8
	cmp r0, #0
	beq _022477C8
	add r5, r5, #1
	cmp r5, r6
	blt _022477B0
_022477C8:
	b _022478E2
_022477CA:
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	beq _022477D8
	mov r6, #4
	b _022477DA
_022477D8:
	mov r6, #0
_022477DA:
	add r0, r4, #0
	bl BattleSys_GetMaxBattlers
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _022478E2
_022477E8:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSys_GetOpponentDataByBattlerId
	ldr r1, _022478F0 ; =0x00000195
	ldrb r0, [r0, r1]
	cmp r0, r6
	beq _022478E2
	add r5, r5, #1
	cmp r5, r7
	blt _022477E8
	b _022478E2
_02247800:
	mov r0, #0x47
	lsl r0, r0, #2
	ldr r5, [r6, r0]
	b _022478E2
_02247808:
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r5, [r6, r0]
	b _022478E2
_02247810:
	bl BattleSys_GetMaxBattlers
	mov r5, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _02247842
_0224781C:
	ldr r7, [r6, #0x64]
	cmp r5, r7
	beq _0224783A
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_0223AB1C
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, r7, #0
	bl ov12_0223AB1C
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _02247842
_0224783A:
	ldr r0, [sp, #4]
	add r5, r5, #1
	cmp r5, r0
	blt _0224781C
_02247842:
	ldr r0, [sp, #4]
	cmp r5, r0
	bne _022478E2
	mov r5, #0
	b _022478E2
_0224784C:
	bl BattleSys_GetMaxBattlers
	mov r5, #0
	str r0, [sp]
	cmp r0, #0
	ble _0224787E
_02247858:
	ldr r7, [r6, #0x6c]
	cmp r5, r7
	beq _02247876
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_0223AB1C
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r1, r7, #0
	bl ov12_0223AB1C
	ldr r1, [sp, #0xc]
	cmp r1, r0
	beq _0224787E
_02247876:
	ldr r0, [sp]
	add r5, r5, #1
	cmp r5, r0
	blt _02247858
_0224787E:
	ldr r0, [sp]
	cmp r5, r0
	bne _022478E2
	mov r5, #0
	b _022478E2
_02247888:
	bl BattleSys_GetMaxBattlers
	add r7, r0, #0
	ldr r1, [r6, #0x64]
	add r0, r4, #0
	bl ov12_0223AB1C
	add r6, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _022478E2
_0224789E:
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_0223AB1C
	cmp r6, r0
	bne _022478E2
	add r5, r5, #1
	cmp r5, r7
	blt _0224789E
	b _022478E2
_022478B2:
	bl BattleSys_GetMaxBattlers
	add r7, r0, #0
	ldr r1, [r6, #0x6c]
	add r0, r4, #0
	bl ov12_0223AB1C
	add r6, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _022478E2
_022478C8:
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_0223AB1C
	cmp r6, r0
	bne _022478E2
	add r5, r5, #1
	cmp r5, r7
	blt _022478C8
	b _022478E2
_022478DC:
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r5, [r6, r0]
_022478E2:
	cmp r5, #0xff
	bne _022478EA
	bl GF_AssertFail
_022478EA:
	add r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022478F0: .word 0x00000195
	thumb_func_end GetBattlerIDBySide

	thumb_func_start InitBattleMsgData
InitBattleMsgData: ; 0x022478F4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r4, r1, #0
	mov r6, #0
	bl BattleScriptReadWord
	str r0, [r4]
	add r0, r7, #0
	bl BattleScriptReadWord
	str r0, [r4, #4]
	cmp r0, #0x3c
	bhi _022479A8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224791A: ; jump table
	.short _02247994 - _0224791A - 2 ; case 0
	.short _02247996 - _0224791A - 2 ; case 1
	.short _02247996 - _0224791A - 2 ; case 2
	.short _02247996 - _0224791A - 2 ; case 3
	.short _02247996 - _0224791A - 2 ; case 4
	.short _02247996 - _0224791A - 2 ; case 5
	.short _02247996 - _0224791A - 2 ; case 6
	.short _02247996 - _0224791A - 2 ; case 7
	.short _02247996 - _0224791A - 2 ; case 8
	.short _0224799A - _0224791A - 2 ; case 9
	.short _0224799A - _0224791A - 2 ; case 10
	.short _0224799A - _0224791A - 2 ; case 11
	.short _0224799A - _0224791A - 2 ; case 12
	.short _0224799A - _0224791A - 2 ; case 13
	.short _0224799A - _0224791A - 2 ; case 14
	.short _0224799A - _0224791A - 2 ; case 15
	.short _0224799A - _0224791A - 2 ; case 16
	.short _0224799A - _0224791A - 2 ; case 17
	.short _0224799A - _0224791A - 2 ; case 18
	.short _0224799A - _0224791A - 2 ; case 19
	.short _0224799A - _0224791A - 2 ; case 20
	.short _0224799A - _0224791A - 2 ; case 21
	.short _0224799A - _0224791A - 2 ; case 22
	.short _0224799A - _0224791A - 2 ; case 23
	.short _0224799A - _0224791A - 2 ; case 24
	.short _0224799A - _0224791A - 2 ; case 25
	.short _0224799A - _0224791A - 2 ; case 26
	.short _0224799A - _0224791A - 2 ; case 27
	.short _0224799A - _0224791A - 2 ; case 28
	.short _0224799A - _0224791A - 2 ; case 29
	.short _0224799A - _0224791A - 2 ; case 30
	.short _0224799E - _0224791A - 2 ; case 31
	.short _0224799E - _0224791A - 2 ; case 32
	.short _0224799E - _0224791A - 2 ; case 33
	.short _0224799E - _0224791A - 2 ; case 34
	.short _0224799E - _0224791A - 2 ; case 35
	.short _0224799E - _0224791A - 2 ; case 36
	.short _0224799E - _0224791A - 2 ; case 37
	.short _0224799E - _0224791A - 2 ; case 38
	.short _0224799E - _0224791A - 2 ; case 39
	.short _0224799E - _0224791A - 2 ; case 40
	.short _0224799E - _0224791A - 2 ; case 41
	.short _0224799E - _0224791A - 2 ; case 42
	.short _0224799E - _0224791A - 2 ; case 43
	.short _0224799E - _0224791A - 2 ; case 44
	.short _0224799E - _0224791A - 2 ; case 45
	.short _0224799E - _0224791A - 2 ; case 46
	.short _0224799E - _0224791A - 2 ; case 47
	.short _0224799E - _0224791A - 2 ; case 48
	.short _0224799E - _0224791A - 2 ; case 49
	.short _0224799E - _0224791A - 2 ; case 50
	.short _0224799E - _0224791A - 2 ; case 51
	.short _022479A2 - _0224791A - 2 ; case 52
	.short _022479A2 - _0224791A - 2 ; case 53
	.short _022479A2 - _0224791A - 2 ; case 54
	.short _022479A2 - _0224791A - 2 ; case 55
	.short _022479A2 - _0224791A - 2 ; case 56
	.short _022479A2 - _0224791A - 2 ; case 57
	.short _022479A2 - _0224791A - 2 ; case 58
	.short _022479A2 - _0224791A - 2 ; case 59
	.short _022479A6 - _0224791A - 2 ; case 60
_02247994:
	b _022479A8
_02247996:
	mov r6, #1
	b _022479A8
_0224799A:
	mov r6, #2
	b _022479A8
_0224799E:
	mov r6, #3
	b _022479A8
_022479A2:
	mov r6, #4
	b _022479A8
_022479A6:
	mov r6, #6
_022479A8:
	mov r5, #0
	cmp r6, #0
	ble _022479BE
_022479AE:
	add r0, r7, #0
	bl BattleScriptReadWord
	str r0, [r4, #8]
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r6
	blt _022479AE
_022479BE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end InitBattleMsgData

	thumb_func_start InitBattleMsg
InitBattleMsg: ; 0x022479C0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	ldr r2, [r4]
	add r5, r3, #0
	strh r2, [r5, #2]
	ldr r2, [r4, #4]
	add r7, r0, #0
	strb r2, [r5, #1]
	ldrb r2, [r5, #1]
	add r6, r1, #0
	cmp r2, #0x3c
	bls _022479DA
	b _022480BC
_022479DA:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_022479E6: ; jump table
	.short _022480BC - _022479E6 - 2 ; case 0
	.short _02247A60 - _022479E6 - 2 ; case 1
	.short _02247A6A - _022479E6 - 2 ; case 2
	.short _02247A74 - _022479E6 - 2 ; case 3
	.short _02247A80 - _022479E6 - 2 ; case 4
	.short _02247A8C - _022479E6 - 2 ; case 5
	.short _02247A98 - _022479E6 - 2 ; case 6
	.short _02247A98 - _022479E6 - 2 ; case 7
	.short _02247AA4 - _022479E6 - 2 ; case 8
	.short _02247AAE - _022479E6 - 2 ; case 9
	.short _02247AC4 - _022479E6 - 2 ; case 10
	.short _02247AD8 - _022479E6 - 2 ; case 11
	.short _02247AEE - _022479E6 - 2 ; case 12
	.short _02247B02 - _022479E6 - 2 ; case 13
	.short _02247B16 - _022479E6 - 2 ; case 14
	.short _02247B2C - _022479E6 - 2 ; case 15
	.short _02247B40 - _022479E6 - 2 ; case 16
	.short _02247B54 - _022479E6 - 2 ; case 17
	.short _02247B68 - _022479E6 - 2 ; case 18
	.short _02247B7E - _022479E6 - 2 ; case 19
	.short _02247B8C - _022479E6 - 2 ; case 20
	.short _02247BA4 - _022479E6 - 2 ; case 21
	.short _02247BBC - _022479E6 - 2 ; case 22
	.short _02247BD2 - _022479E6 - 2 ; case 23
	.short _02247BE8 - _022479E6 - 2 ; case 24
	.short _02247BFE - _022479E6 - 2 ; case 25
	.short _02247C14 - _022479E6 - 2 ; case 26
	.short _02247C2A - _022479E6 - 2 ; case 27
	.short _02247C40 - _022479E6 - 2 ; case 28
	.short _02247C54 - _022479E6 - 2 ; case 29
	.short _02247C68 - _022479E6 - 2 ; case 30
	.short _02247C7E - _022479E6 - 2 ; case 31
	.short _02247C9E - _022479E6 - 2 ; case 32
	.short _02247CC0 - _022479E6 - 2 ; case 33
	.short _02247CE0 - _022479E6 - 2 ; case 34
	.short _02247CFE - _022479E6 - 2 ; case 35
	.short _02247D1C - _022479E6 - 2 ; case 36
	.short _02247D3E - _022479E6 - 2 ; case 37
	.short _02247D5E - _022479E6 - 2 ; case 38
	.short _02247D7E - _022479E6 - 2 ; case 39
	.short _02247D9E - _022479E6 - 2 ; case 40
	.short _02247DBE - _022479E6 - 2 ; case 41
	.short _02247DDE - _022479E6 - 2 ; case 42
	.short _02247DFE - _022479E6 - 2 ; case 43
	.short _02247E1E - _022479E6 - 2 ; case 44
	.short _02247E3C - _022479E6 - 2 ; case 45
	.short _02247E5A - _022479E6 - 2 ; case 46
	.short _02247E78 - _022479E6 - 2 ; case 47
	.short _02247E8A - _022479E6 - 2 ; case 48
	.short _02247EAC - _022479E6 - 2 ; case 49
	.short _02247ECE - _022479E6 - 2 ; case 50
	.short _02247EF0 - _022479E6 - 2 ; case 51
	.short _02247F10 - _022479E6 - 2 ; case 52
	.short _02247F3C - _022479E6 - 2 ; case 53
	.short _02247F6A - _022479E6 - 2 ; case 54
	.short _02247F96 - _022479E6 - 2 ; case 55
	.short _02247FC0 - _022479E6 - 2 ; case 56
	.short _02247FEE - _022479E6 - 2 ; case 57
	.short _0224801C - _022479E6 - 2 ; case 58
	.short _0224804A - _022479E6 - 2 ; case 59
	.short _02248078 - _022479E6 - 2 ; case 60
_02247A60:
	ldr r2, [r4, #8]
	bl GetBattlerIDBySide
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_02247A6A:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_02247A74:
	ldr r1, [r4, #8]
	add r0, r6, #0
	bl ov12_022480F0
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_02247A80:
	ldr r1, [r4, #8]
	add r0, r6, #0
	bl ov12_022481D0
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_02247A8C:
	ldr r1, [r4, #8]
	add r0, r6, #0
	bl ov12_0224810C
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_02247A98:
	ldr r1, [r4, #8]
	add r0, r6, #0
	bl ov12_02248184
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_02247AA4:
	ldr r2, [r4, #8]
	bl ov12_02248220
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_02247AAE:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247AC4:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_022480F0
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247AD8:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0224819C
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247AEE:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_022481D0
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247B02:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_02248190
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247B16:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022481E8
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247B2C:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_0224810C
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247B40:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_02248200
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247B54:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_02248184
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247B68:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_02248220
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247B7E:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r0, [r4, #0xc]
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247B8C:
	ldr r1, [r4, #8]
	add r0, r6, #0
	bl ov12_022480F0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl GetBattlerIDBySide
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247BA4:
	ldr r1, [r4, #8]
	add r0, r6, #0
	bl ov12_022480F0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247BBC:
	ldr r1, [r4, #8]
	add r0, r6, #0
	bl ov12_022480F0
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_022480F0
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247BD2:
	ldr r2, [r4, #8]
	bl ov12_0224819C
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247BE8:
	ldr r1, [r4, #8]
	add r0, r6, #0
	bl ov12_0224810C
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_022480F0
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247BFE:
	ldr r1, [r4, #8]
	add r0, r6, #0
	bl ov12_02248184
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_02248184
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247C14:
	ldr r2, [r4, #8]
	bl ov12_02248220
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_02248220
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247C2A:
	ldr r2, [r4, #8]
	bl ov12_02248220
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247C40:
	ldr r2, [r4, #8]
	bl ov12_02248220
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_0224810C
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247C54:
	ldr r2, [r4, #8]
	bl ov12_02248220
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_02248184
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247C68:
	ldr r2, [r4, #8]
	bl ov12_02248218
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_02248220
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02247C7E:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl ov12_022480F0
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247C9E:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #8]
	ldr r2, [r4, #0x10]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0224819C
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247CC0:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl ov12_0224810C
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247CE0:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_022480F0
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl ov12_022480F0
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247CFE:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_022480F0
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl ov12_02248184
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247D1C:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0224819C
	str r0, [r5, #8]
	ldr r2, [r4, #0x10]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247D3E:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0224819C
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl ov12_022480F0
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247D5E:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0224819C
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl ov12_0224810C
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247D7E:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0224819C
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl ov12_022481D0
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247D9E:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0224819C
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl ov12_02248190
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247DBE:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0224819C
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl ov12_022481DC
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247DDE:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0224819C
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl ov12_02248184
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247DFE:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_0224810C
	str r0, [r5, #8]
	ldr r2, [r4, #0x10]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247E1E:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_0224810C
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl ov12_022480F0
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247E3C:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_0224810C
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl ov12_022481D0
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247E5A:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_0224810C
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl ov12_022481DC
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247E78:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r0, [r4, #0xc]
	str r0, [r5, #8]
	ldr r0, [r4, #0x10]
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247E8A:
	ldr r1, [r4, #8]
	add r0, r6, #0
	bl ov12_0224810C
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl ov12_0224820C
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247EAC:
	ldr r2, [r4, #8]
	bl ov12_02248220
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #8]
	ldr r2, [r4, #0x10]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247ECE:
	ldr r2, [r4, #8]
	bl ov12_02248218
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_02248220
	str r0, [r5, #8]
	ldr r2, [r4, #0x10]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247EF0:
	ldr r2, [r4, #8]
	bl ov12_02248218
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_02248220
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl ov12_0224810C
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247F10:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0224819C
	str r0, [r5, #8]
	ldr r2, [r4, #0x10]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #0xc]
	ldr r1, [r4, #0x14]
	add r0, r6, #0
	bl ov12_022480F0
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_02247F3C:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0224819C
	str r0, [r5, #8]
	ldr r2, [r4, #0x10]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #0xc]
	ldr r2, [r4, #0x14]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0224819C
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_02247F6A:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0224819C
	str r0, [r5, #8]
	ldr r2, [r4, #0x10]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #0xc]
	ldr r1, [r4, #0x14]
	add r0, r6, #0
	bl ov12_022481D0
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_02247F96:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl ov12_0224810C
	str r0, [r5, #8]
	ldr r2, [r4, #0x10]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #0xc]
	ldr r1, [r4, #0x14]
	add r0, r6, #0
	bl ov12_0224810C
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_02247FC0:
	ldr r2, [r4, #8]
	bl ov12_02248220
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #8]
	ldr r2, [r4, #0x10]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_02248220
	str r0, [r5, #0xc]
	ldr r2, [r4, #0x14]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_02247FEE:
	ldr r2, [r4, #8]
	bl ov12_02248218
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_02248220
	str r0, [r5, #8]
	ldr r2, [r4, #0x10]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #0xc]
	ldr r2, [r4, #0x14]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_0224801C:
	ldr r2, [r4, #8]
	bl ov12_02248218
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_02248220
	str r0, [r5, #8]
	ldr r2, [r4, #0x10]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #0xc]
	ldr r2, [r4, #0x14]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_02248220
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_0224804A:
	ldr r2, [r4, #8]
	bl ov12_02248218
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_02248220
	str r0, [r5, #8]
	ldr r2, [r4, #0x10]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_02248218
	str r0, [r5, #0xc]
	ldr r2, [r4, #0x14]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_02248220
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_02248078:
	ldr r2, [r4, #8]
	bl ov12_02248218
	str r0, [r5, #4]
	ldr r2, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_02248220
	str r0, [r5, #8]
	ldr r2, [r4, #0x10]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #0xc]
	ldr r2, [r4, #0x14]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_02248218
	str r0, [r5, #0x10]
	ldr r2, [r4, #0x18]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_02248220
	str r0, [r5, #0x14]
	ldr r2, [r4, #0x1c]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_022480C0
	str r0, [r5, #0x18]
_022480BC:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end InitBattleMsg

	thumb_func_start ov12_022480C0
ov12_022480C0: ; 0x022480C0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl GetBattlerIDBySide
	cmp r4, #0x16
	bne _022480DA
	ldr r1, _022480E8 ; =0x000021A0
	add r2, r5, r0
	ldrb r1, [r2, r1]
	lsl r1, r1, #8
	orr r0, r1
	pop {r3, r4, r5, pc}
_022480DA:
	ldr r1, _022480EC ; =0x0000219C
	add r2, r5, r0
	ldrb r1, [r2, r1]
	lsl r1, r1, #8
	orr r0, r1
	pop {r3, r4, r5, pc}
	nop
_022480E8: .word 0x000021A0
_022480EC: .word 0x0000219C
	thumb_func_end ov12_022480C0

	thumb_func_start ov12_022480F0
ov12_022480F0: ; 0x022480F0
	cmp r1, #1
	beq _022480FA
	cmp r1, #0xff
	beq _02248100
	bx lr
_022480FA:
	ldr r1, _02248108 ; =0x00003044
	ldr r0, [r0, r1]
	bx lr
_02248100:
	mov r1, #0x49
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_02248108: .word 0x00003044
	thumb_func_end ov12_022480F0

	thumb_func_start ov12_0224810C
ov12_0224810C: ; 0x0224810C
	push {r4, lr}
	cmp r1, #0x15
	bgt _02248124
	bge _0224815A
	cmp r1, #2
	bgt _0224817C
	cmp r1, #1
	blt _0224817C
	beq _0224812A
	cmp r1, #2
	beq _02248142
	b _0224817C
_02248124:
	cmp r1, #0xff
	beq _02248176
	b _0224817C
_0224812A:
	ldr r3, [r0, #0x64]
	mov r1, #0xc0
	mul r1, r3
	add r2, r0, r1
	ldr r1, _02248180 ; =0x00002DB8
	ldrh r4, [r2, r1]
	lsl r1, r3, #0x18
	lsr r1, r1, #0x18
	add r2, r4, #0
	bl ov12_02248654
	b _0224817C
_02248142:
	ldr r3, [r0, #0x6c]
	mov r1, #0xc0
	mul r1, r3
	add r2, r0, r1
	ldr r1, _02248180 ; =0x00002DB8
	ldrh r4, [r2, r1]
	lsl r1, r3, #0x18
	lsr r1, r1, #0x18
	add r2, r4, #0
	bl ov12_02248654
	b _0224817C
_0224815A:
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r3, [r0, r1]
	mov r1, #0xc0
	mul r1, r3
	add r2, r0, r1
	ldr r1, _02248180 ; =0x00002DB8
	ldrh r4, [r2, r1]
	lsl r1, r3, #0x18
	lsr r1, r1, #0x18
	add r2, r4, #0
	bl ov12_02248654
	b _0224817C
_02248176:
	mov r1, #0x4a
	lsl r1, r1, #2
	ldr r4, [r0, r1]
_0224817C:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02248180: .word 0x00002DB8
	thumb_func_end ov12_0224810C

	thumb_func_start ov12_02248184
ov12_02248184: ; 0x02248184
	cmp r1, #0xff
	bne _0224818E
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [r0, r1]
_0224818E:
	bx lr
	thumb_func_end ov12_02248184

	thumb_func_start ov12_02248190
ov12_02248190: ; 0x02248190
	cmp r1, #0xff
	bne _0224819A
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [r0, r1]
_0224819A:
	bx lr
	thumb_func_end ov12_02248190

	thumb_func_start ov12_0224819C
ov12_0224819C: ; 0x0224819C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	cmp r2, #0xff
	bne _022481AC
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	b _022481C8
_022481AC:
	bl GetBattlerIDBySide
	add r1, r0, #0
	mov r0, #0xc0
	mul r0, r1
	add r2, r5, r0
	ldr r0, _022481CC ; =0x00002D67
	lsl r1, r1, #0x18
	ldrb r4, [r2, r0]
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r2, r4, #0
	bl ov12_02248648
_022481C8:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022481CC: .word 0x00002D67
	thumb_func_end ov12_0224819C

	thumb_func_start ov12_022481D0
ov12_022481D0: ; 0x022481D0
	cmp r1, #0xff
	bne _022481DA
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [r0, r1]
_022481DA:
	bx lr
	thumb_func_end ov12_022481D0

	thumb_func_start ov12_022481DC
ov12_022481DC: ; 0x022481DC
	cmp r1, #0xff
	bne _022481E6
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [r0, r1]
_022481E6:
	bx lr
	thumb_func_end ov12_022481DC

	thumb_func_start ov12_022481E8
ov12_022481E8: ; 0x022481E8
	push {r4, lr}
	add r4, r1, #0
	bl GetBattlerIDBySide
	ldr r1, _022481FC ; =0x0000219C
	add r2, r4, r0
	ldrb r1, [r2, r1]
	lsl r1, r1, #8
	orr r0, r1
	pop {r4, pc}
	.balign 4, 0
_022481FC: .word 0x0000219C
	thumb_func_end ov12_022481E8

	thumb_func_start ov12_02248200
ov12_02248200: ; 0x02248200
	cmp r1, #0xff
	bne _0224820A
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [r0, r1]
_0224820A:
	bx lr
	thumb_func_end ov12_02248200

	thumb_func_start ov12_0224820C
ov12_0224820C: ; 0x0224820C
	cmp r1, #0xff
	bne _02248216
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [r0, r1]
_02248216:
	bx lr
	thumb_func_end ov12_0224820C

	thumb_func_start ov12_02248218
ov12_02248218: ; 0x02248218
	ldr r3, _0224821C ; =GetBattlerIDBySide
	bx r3
	.balign 4, 0
_0224821C: .word GetBattlerIDBySide
	thumb_func_end ov12_02248218

	thumb_func_start ov12_02248220
ov12_02248220: ; 0x02248220
	ldr r3, _02248224 ; =GetBattlerIDBySide
	bx r3
	.balign 4, 0
_02248224: .word GetBattlerIDBySide
	thumb_func_end ov12_02248220

	thumb_func_start ov12_02248228
ov12_02248228: ; 0x02248228
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x78
	add r7, r0, #0
	add r5, r1, #0
	str r2, [sp, #0x18]
	bl ov12_0223A930
	str r0, [sp, #0x28]
	add r0, r7, #0
	bl ov12_0223A9A8
	str r0, [sp, #0x20]
	add r0, r7, #0
	bl ov12_0223A9A4
	str r0, [sp, #0x24]
	add r0, r7, #0
	bl ov12_0223A7D4
	str r0, [sp, #0x1c]
	add r0, r7, #0
	bl ov12_0223A8E4
	add r6, r0, #0
	add r0, r7, #0
	bl ov12_0223A8EC
	add r4, r0, #0
	add r0, r7, #0
	bl ov12_0223A938
	add r7, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _022484A8 ; =0x00004E35
	mov r3, #8
	str r0, [sp, #8]
	add r2, r3, #0
	add r0, r6, #0
	add r1, r4, #0
	add r3, #0xf8
	bl sub_0200D4A4
	mov r0, #8
	str r0, [sp]
	mov r0, #0x52
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r1, #2
	str r1, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, _022484AC ; =0x00004E30
	add r2, r6, #0
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r3, r4, #0
	bl sub_0200D644
	mov r0, #1
	str r0, [sp]
	ldr r0, _022484B0 ; =0x00004E2D
	mov r3, #8
	str r0, [sp, #4]
	add r2, r3, #0
	add r0, r6, #0
	add r1, r4, #0
	add r3, #0xf9
	bl sub_0200D6D4
	mov r0, #1
	str r0, [sp]
	ldr r0, _022484B0 ; =0x00004E2D
	mov r3, #8
	str r0, [sp, #4]
	add r2, r3, #0
	add r0, r6, #0
	add r1, r4, #0
	add r3, #0xfa
	bl sub_0200D704
	ldr r2, _022484B4 ; =ov12_0226C428
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0200D734
	str r0, [r5, #0xc]
	bl sub_0200DC18
	ldr r0, [sp, #0x18]
	bl Pokemon_GetIconNaix
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _022484B8 ; =0x00004E36
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r6, #0
	mov r2, #0x14
	bl sub_0200E188
	bl sub_02074490
	mov r1, #0x14
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, _022484BC ; =0x00004E31
	mov r1, #2
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0200D644
	bl sub_0207449C
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _022484C0 ; =0x00004E2E
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #0x14
	bl sub_0200D6D4
	bl sub_020744A8
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _022484C0 ; =0x00004E2E
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #0x14
	bl sub_0200D704
	ldr r2, _022484C4 ; =ov12_0226C45C
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0200D734
	str r0, [r5, #0x10]
	ldr r0, [sp, #0x18]
	bl Pokemon_GetIconPalette
	add r1, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0]
	bl sub_02024AA8
	ldr r0, [r5, #0x10]
	bl sub_0200DC18
	mov r0, #1
	mov r1, #5
	bl sub_02013534
	str r0, [r5, #0x50]
	ldr r0, [sp, #0x18]
	mov r1, #0xb0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02248390
	mov r0, #2
	b _0224839A
_02248390:
	ldr r0, [sp, #0x18]
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
_0224839A:
	cmp r0, #0
	bne _022483AC
	mov r1, #0x3b
	ldr r0, [sp, #0x28]
	lsl r1, r1, #4
	bl NewString_ReadMsgData
	add r6, r0, #0
	b _022483C6
_022483AC:
	cmp r0, #1
	bne _022483BC
	ldr r0, [sp, #0x28]
	ldr r1, _022484C8 ; =0x000003B1
	bl NewString_ReadMsgData
	add r6, r0, #0
	b _022483C6
_022483BC:
	ldr r0, [sp, #0x28]
	ldr r1, _022484CC ; =0x000003B2
	bl NewString_ReadMsgData
	add r6, r0, #0
_022483C6:
	ldr r0, [sp, #0x18]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [sp, #0x24]
	mov r1, #0
	bl BufferBoxMonNickname
	ldr r0, [sp, #0x18]
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r0, [sp, #0x24]
	mov r3, #3
	str r1, [sp, #4]
	bl BufferIntegerAsString
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x20]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	add r0, sp, #0x68
	bl InitWindow
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	add r1, sp, #0x68
	mov r2, #0xc
	mov r3, #4
	bl AddTextWindowTopLeftCorner
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022484D0 ; =0x00010200
	ldr r2, [sp, #0x20]
	str r0, [sp, #8]
	add r0, sp, #0x68
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, sp, #0x68
	mov r1, #1
	mov r2, #5
	bl sub_02013688
	mov r1, #1
	add r2, r1, #0
	add r3, sp, #0x5c
	bl sub_02021AC8
	ldr r0, [r5, #0x50]
	str r0, [sp, #0x2c]
	add r0, sp, #0x68
	str r0, [sp, #0x30]
	add r0, r4, #0
	bl sub_0200E2B0
	str r0, [sp, #0x34]
	ldr r1, _022484AC ; =0x00004E30
	add r0, r4, #0
	bl sub_0200D934
	mov r1, #0
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x60]
	str r1, [sp, #0x3c]
	str r0, [sp, #0x40]
	mov r0, #0xb0
	str r0, [sp, #0x44]
	mov r0, #8
	str r0, [sp, #0x48]
	mov r0, #0x64
	str r0, [sp, #0x50]
	mov r0, #1
	str r0, [sp, #0x54]
	mov r0, #5
	str r0, [sp, #0x58]
	add r0, sp, #0x2c
	str r1, [sp, #0x4c]
	bl sub_020135D8
	add r2, r5, #0
	add r3, sp, #0x5c
	str r0, [r5, #0x14]
	ldmia r3!, {r0, r1}
	add r2, #0x18
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #1
	str r0, [r2]
	ldr r0, [r5, #0x14]
	bl sub_020138E0
	add r0, sp, #0x68
	bl RemoveWindow
	add sp, #0x78
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022484A8: .word 0x00004E35
_022484AC: .word 0x00004E30
_022484B0: .word 0x00004E2D
_022484B4: .word ov12_0226C428
_022484B8: .word 0x00004E36
_022484BC: .word 0x00004E31
_022484C0: .word 0x00004E2E
_022484C4: .word ov12_0226C45C
_022484C8: .word 0x000003B1
_022484CC: .word 0x000003B2
_022484D0: .word 0x00010200
	thumb_func_end ov12_02248228

	thumb_func_start ov12_022484D4
ov12_022484D4: ; 0x022484D4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl ov12_0223A8EC
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0200D9DC
	ldr r0, [r5, #0x10]
	bl sub_0200D9DC
	ldr r0, [r5, #0x14]
	bl sub_02013660
	add r0, r5, #0
	add r0, #0x18
	bl sub_02021B5C
	ldr r1, _02248540 ; =0x00004E35
	add r0, r4, #0
	bl sub_0200D958
	ldr r1, _02248544 ; =0x00004E30
	add r0, r4, #0
	bl sub_0200D968
	ldr r1, _02248548 ; =0x00004E2D
	add r0, r4, #0
	bl sub_0200D978
	ldr r1, _02248548 ; =0x00004E2D
	add r0, r4, #0
	bl sub_0200D988
	ldr r1, _0224854C ; =0x00004E36
	add r0, r4, #0
	bl sub_0200D958
	ldr r1, _02248550 ; =0x00004E31
	add r0, r4, #0
	bl sub_0200D968
	ldr r1, _02248554 ; =0x00004E2E
	add r0, r4, #0
	bl sub_0200D978
	ldr r1, _02248554 ; =0x00004E2E
	add r0, r4, #0
	bl sub_0200D988
	ldr r0, [r5, #0x50]
	bl sub_020135AC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02248540: .word 0x00004E35
_02248544: .word 0x00004E30
_02248548: .word 0x00004E2D
_0224854C: .word 0x00004E36
_02248550: .word 0x00004E31
_02248554: .word 0x00004E2E
	thumb_func_end ov12_022484D4

	thumb_func_start ov12_02248558
ov12_02248558: ; 0x02248558
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r1, r2, #0
	add r5, r0, #0
	str r2, [sp]
	bl ov12_0223AB1C
	cmp r0, #0
	bne _0224863C
	add r0, r5, #0
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	beq _022485A8
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223AAD8
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r5, #0
	mov r1, #5
	bl ov12_0223AAD8
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r2, #0xc0
	add r0, r1, #0
	mul r0, r2
	mul r2, r6
	ldr r3, _02248640 ; =0x00002D74
	add r0, r4, r0
	add r2, r4, r2
	ldrb r0, [r0, r3]
	ldrb r2, [r2, r3]
	cmp r0, r2
	bls _022485B4
	add r6, r1, #0
	b _022485B4
_022485A8:
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223AAD8
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
_022485B4:
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r4, r2
	ldr r2, _02248644 ; =0x0000219C
	ldrb r2, [r3, r2]
	bl ov12_0223A880
	add r7, r0, #0
	ldr r0, [sp]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	add r0, r4, r2
	ldr r2, _02248640 ; =0x00002D74
	mul r1, r6
	add r1, r4, r1
	ldrb r0, [r0, r2]
	ldrb r1, [r1, r2]
	cmp r1, r0
	bls _02248620
	sub r0, r1, r0
	cmp r0, #0x1e
	blt _02248602
	add r0, r5, #0
	bl ov12_0223AB60
	add r2, r0, #0
	lsl r2, r2, #0x10
	add r0, r7, #0
	mov r1, #8
	lsr r2, r2, #0x10
	bl MonApplyFriendshipMod
	add r0, r7, #0
	mov r1, #6
	bl ApplyMonMoodModifier
	pop {r3, r4, r5, r6, r7, pc}
_02248602:
	add r0, r5, #0
	bl ov12_0223AB60
	add r2, r0, #0
	lsl r2, r2, #0x10
	add r0, r7, #0
	mov r1, #6
	lsr r2, r2, #0x10
	bl MonApplyFriendshipMod
	add r0, r7, #0
	mov r1, #4
	bl ApplyMonMoodModifier
	pop {r3, r4, r5, r6, r7, pc}
_02248620:
	add r0, r5, #0
	bl ov12_0223AB60
	add r2, r0, #0
	lsl r2, r2, #0x10
	add r0, r7, #0
	mov r1, #6
	lsr r2, r2, #0x10
	bl MonApplyFriendshipMod
	add r0, r7, #0
	mov r1, #4
	bl ApplyMonMoodModifier
_0224863C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02248640: .word 0x00002D74
_02248644: .word 0x0000219C
	thumb_func_end ov12_02248558

	thumb_func_start ov12_02248648
ov12_02248648: ; 0x02248648
	add r1, r0, r1
	mov r0, #0x39
	lsl r0, r0, #4
	strb r2, [r1, r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov12_02248648

	thumb_func_start ov12_02248654
ov12_02248654: ; 0x02248654
	lsl r1, r1, #1
	add r1, r0, r1
	mov r0, #0xe5
	lsl r0, r0, #2
	strh r2, [r1, r0]
	bx lr
	thumb_func_end ov12_02248654
    
    .rodata

ov12_0226C2EC: ; 0x0226C2EC
	.byte 0x14, 0x0F, 0x0A, 0x0F

ov12_0226C2F0: ; 0x0226C2F0
	.byte 0xC8, 0x50, 0x3C, 0x32, 0x28, 0x00, 0x00, 0x00

ov12_0226C2F8: ; 0x0226C2F8
	.byte 0xFF, 0xFF, 0xFF, 0x7F, 0xFF, 0x3F, 0xFF, 0x1F
    
ov12_0226C300: ; 0x0226C300
	.byte 0x01

ov12_0226C301: ; 0x0226C301
	.byte 0xC8, 0x05, 0x96, 0x0C, 0x64, 0x15, 0x50, 0x2A, 0x28, 0x40, 0x14

ov12_0226C30C: ; 0x0226C30C
	.byte 0x19, 0x00, 0x5C, 0x00
	.byte 0xDD, 0x00, 0x17, 0x00, 0x26, 0x00, 0x16, 0x01, 0x7F, 0x01, 0x28, 0x00, 0x9D, 0x01, 0xEA, 0x00
	.byte 0x61, 0x01, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov12_0226C33C: ; 0x0226C33C
	.byte 0xA4, 0x00, 0x00, 0x00
	.byte 0xA5, 0x00, 0x00, 0x00, 0xA6, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x00, 0x00, 0xA9, 0x00, 0x00, 0x00
	.byte 0xA7, 0x00, 0x00, 0x00

ov12_0226C354: ; 0x0226C354
	.byte 0xA4, 0x00, 0x00, 0x00, 0xA5, 0x00, 0x00, 0x00, 0xA6, 0x00, 0x00, 0x00
	.byte 0xA8, 0x00, 0x00, 0x00, 0xA9, 0x00, 0x00, 0x00, 0xA7, 0x00, 0x00, 0x00

ov12_0226C36C: ; 0x0226C36C
	.byte 0x08, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00

ov12_0226C384: ; 0x0226C384
	.byte 0xA4, 0x00, 0x00, 0x00, 0xA5, 0x00, 0x00, 0x00, 0xA6, 0x00, 0x00, 0x00
	.byte 0xA8, 0x00, 0x00, 0x00, 0xA9, 0x00, 0x00, 0x00, 0xA7, 0x00, 0x00, 0x00

ov12_0226C39C: ; 0x0226C39C
	.byte 0x64, 0x00

ov12_0226C39E: ; 0x0226C39E
	.byte 0x14, 0x00
	.byte 0xFA, 0x00, 0x28, 0x00, 0xF4, 0x01, 0x3C, 0x00, 0xE8, 0x03, 0x50, 0x00, 0xD0, 0x07, 0x64, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF

ov12_0226C3B4: ; 0x0226C3B4
	.byte 0x59, 0x00, 0x59, 0x00, 0x92, 0x01, 0x92, 0x01, 0x9D, 0x00, 0x9D, 0x00
	.byte 0x3B, 0x00, 0x38, 0x00, 0x3A, 0x00, 0xA1, 0x00, 0xAA, 0x01, 0x93, 0x01, 0xA1, 0x00

ov12_0226C3CE: ; 0x0226C3CE
	.byte 0x0A

ov12_0226C3CF: ; 0x0226C3CF
	.byte 0x28
	.byte 0x0A, 0x23, 0x0A, 0x1E, 0x0A, 0x19, 0x0A, 0x14, 0x0A, 0x0F, 0x0A, 0x0A, 0x0F, 0x0A, 0x14, 0x0A
	.byte 0x19, 0x0A, 0x1E, 0x0A, 0x23, 0x0A, 0x28, 0x0A

ov12_0226C3E8: ; 0x0226C3E8
	.byte 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x20, 0x00
	.byte 0x21, 0x00, 0x22, 0x00, 0xAD, 0x00, 0x23, 0x00, 0x24, 0x00, 0xAE, 0x00, 0x27, 0x00, 0x28, 0x00
	.byte 0x2C, 0x01, 0x2D, 0x01

ov12_0226C404: ; 0x0226C404
	.byte 0x11, 0x00, 0x12, 0x00, 0x1A, 0x00, 0x03, 0x00, 0x4F, 0x00, 0x4E, 0x00
	.byte 0x1B, 0x00, 0x19, 0x00, 0x02, 0x00, 0x1C, 0x00, 0x32, 0x00, 0x50, 0x00, 0x51, 0x00, 0x5D, 0x00
	.byte 0x17, 0x00, 0x1D, 0x00, 0x33, 0x00, 0x29, 0x00

ov12_0226C428: ; 0x0226C428
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x35, 0x4E, 0x00, 0x00
	.byte 0x30, 0x4E, 0x00, 0x00, 0x2D, 0x4E, 0x00, 0x00, 0x2D, 0x4E, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov12_0226C45C: ; 0x0226C45C
	.byte 0x98, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x36, 0x4E, 0x00, 0x00, 0x31, 0x4E, 0x00, 0x00, 0x2E, 0x4E, 0x00, 0x00, 0x2E, 0x4E, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov12_0226C490: ; 0x0226C490
	.byte 0x1B, 0x00, 0x00, 0x80, 0x1B, 0x00, 0x00, 0x80, 0x01, 0x00, 0x00, 0x80, 0x01, 0x00, 0x00, 0x80
	.byte 0x08, 0x00, 0x00, 0x80, 0x08, 0x00, 0x00, 0x80, 0x04, 0x00, 0x00, 0x80, 0x16, 0x00, 0x00, 0x80
	.byte 0x04, 0x00, 0x00, 0x80, 0x05, 0x00, 0x00, 0x80, 0x18, 0x00, 0x00, 0x80, 0x1C, 0x00, 0x00, 0x80
	.byte 0x05, 0x00, 0x00, 0x80
    
.public sPrizeMoneyTbl
    
sPrizeMoneyTbl: ; 0x0226C4C4
	.byte 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x04, 0x00
	.byte 0x03, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x05, 0x00, 0x04, 0x00, 0x06, 0x00, 0x04, 0x00
	.byte 0x07, 0x00, 0x08, 0x00, 0x08, 0x00, 0x04, 0x00, 0x09, 0x00, 0x08, 0x00, 0x0A, 0x00, 0x04, 0x00
	.byte 0x0B, 0x00, 0x08, 0x00, 0x0C, 0x00, 0x08, 0x00, 0x0D, 0x00, 0x08, 0x00, 0x0E, 0x00, 0x06, 0x00
	.byte 0x0F, 0x00, 0x0C, 0x00, 0x10, 0x00, 0x0C, 0x00, 0x11, 0x00, 0x0C, 0x00, 0x12, 0x00, 0x04, 0x00
	.byte 0x13, 0x00, 0x08, 0x00, 0x14, 0x00, 0x10, 0x00, 0x15, 0x00, 0x10, 0x00, 0x16, 0x00, 0x02, 0x00
	.byte 0x17, 0x00, 0x10, 0x00, 0x18, 0x00, 0x0F, 0x00, 0x19, 0x00, 0x0F, 0x00, 0x1A, 0x00, 0x08, 0x00
	.byte 0x1B, 0x00, 0x14, 0x00, 0x1C, 0x00, 0x02, 0x00, 0x1D, 0x00, 0x08, 0x00, 0x45, 0x00, 0x08, 0x00
	.byte 0x1F, 0x00, 0x08, 0x00, 0x20, 0x00, 0x28, 0x00, 0x21, 0x00, 0x28, 0x00, 0x22, 0x00, 0x32, 0x00
	.byte 0x23, 0x00, 0x32, 0x00, 0x24, 0x00, 0x0E, 0x00, 0x25, 0x00, 0x10, 0x00, 0x26, 0x00, 0x0A, 0x00
	.byte 0x27, 0x00, 0x0F, 0x00, 0x28, 0x00, 0x0F, 0x00, 0x29, 0x00, 0x0C, 0x00, 0x2A, 0x00, 0x04, 0x00
	.byte 0x2B, 0x00, 0x04, 0x00, 0x2C, 0x00, 0x01, 0x00, 0x2D, 0x00, 0x01, 0x00, 0x2E, 0x00, 0x08, 0x00
	.byte 0x2F, 0x00, 0x1E, 0x00, 0x30, 0x00, 0x0C, 0x00, 0x31, 0x00, 0x08, 0x00, 0x32, 0x00, 0x08, 0x00
	.byte 0x33, 0x00, 0x1E, 0x00, 0x34, 0x00, 0x06, 0x00, 0x35, 0x00, 0x0F, 0x00, 0x36, 0x00, 0x0F, 0x00
	.byte 0x37, 0x00, 0x0A, 0x00, 0x38, 0x00, 0x08, 0x00, 0x39, 0x00, 0x06, 0x00, 0x3A, 0x00, 0x06, 0x00
	.byte 0x3B, 0x00, 0x0A, 0x00, 0x3C, 0x00, 0x05, 0x00, 0x3D, 0x00, 0x05, 0x00, 0x3E, 0x00, 0x0A, 0x00
	.byte 0x3F, 0x00, 0x04, 0x00, 0x40, 0x00, 0x08, 0x00, 0x41, 0x00, 0x04, 0x00, 0x42, 0x00, 0x1E, 0x00
	.byte 0x43, 0x00, 0x1E, 0x00, 0x44, 0x00, 0x10, 0x00, 0x46, 0x00, 0x1E, 0x00, 0x48, 0x00, 0x1E, 0x00
	.byte 0x47, 0x00, 0x0A, 0x00, 0x49, 0x00, 0x1E, 0x00, 0x4A, 0x00, 0x1E, 0x00, 0x4B, 0x00, 0x1E, 0x00
	.byte 0x4C, 0x00, 0x1E, 0x00, 0x4D, 0x00, 0x0C, 0x00, 0x4E, 0x00, 0x0C, 0x00, 0x4F, 0x00, 0x0C, 0x00
	.byte 0x52, 0x00, 0x0C, 0x00, 0x50, 0x00, 0x08, 0x00, 0x51, 0x00, 0x08, 0x00, 0x56, 0x00, 0x32, 0x00
	.byte 0x53, 0x00, 0x08, 0x00, 0x54, 0x00, 0x0A, 0x00, 0x55, 0x00, 0x12, 0x00, 0x57, 0x00, 0x1E, 0x00
	.byte 0x58, 0x00, 0x1E, 0x00, 0x59, 0x00, 0x1E, 0x00, 0x62, 0x00, 0x1E, 0x00, 0x5A, 0x00, 0x1E, 0x00
	.byte 0x5B, 0x00, 0x1E, 0x00, 0x5C, 0x00, 0x1E, 0x00, 0x5D, 0x00, 0x1E, 0x00, 0x5E, 0x00, 0x1E, 0x00
	.byte 0x5F, 0x00, 0x19, 0x00, 0x60, 0x00, 0x19, 0x00, 0x61, 0x00, 0x00, 0x00, 0x67, 0x00, 0x1E, 0x00
	.byte 0x63, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x65, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00
	.byte 0x68, 0x00, 0x1E, 0x00, 0x69, 0x00, 0x1E, 0x00, 0x6A, 0x00, 0x1E, 0x00, 0x6B, 0x00, 0x1E, 0x00
	.byte 0x6C, 0x00, 0x1E, 0x00, 0x6D, 0x00, 0x32, 0x00, 0x6E, 0x00, 0x28, 0x00, 0x6F, 0x00, 0x1E, 0x00
	.byte 0x70, 0x00, 0x1E, 0x00, 0x71, 0x00, 0x08, 0x00, 0x72, 0x00, 0x14, 0x00, 0x73, 0x00, 0x08, 0x00
	.byte 0x74, 0x00, 0x14, 0x00, 0x75, 0x00, 0x0A, 0x00, 0x76, 0x00, 0x0A, 0x00, 0x77, 0x00, 0x19, 0x00
	.byte 0x78, 0x00, 0x1E, 0x00, 0x79, 0x00, 0x1E, 0x00, 0x7A, 0x00, 0x10, 0x00, 0x7B, 0x00, 0x00, 0x00
	.byte 0x7C, 0x00, 0x2D, 0x00, 0x7D, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x08, 0x00

.public sBattleScriptCommandTable;
 
sBattleScriptCommandTable: ; 0x0226C6C8
	.word BtlCmd_0
	.word BtlCmd_1
	.word BtlCmd_PokemonSlideIn
	.word BtlCmd_3
	.word BtlCmd_4 ;5
	.word BtlCmd_5
	.word BtlCmd_6
	.word BtlCmd_ThrowPokeball
	.word BtlCmd_8
	.word BtlCmd_9 ;10
	.word BtlCmd_10
	.word BtlCmd_HealthbarSlideIn
	.word BtlCmd_12
	.word BtlCmd_13
	.word BtlCmd_WaitForMessage ;15
	.word BtlCmd_DamageCalc
	.word BtlCmd_16
	.word BtlCmd_PrintAttackMessage
	.word BtlCmd_PrintMessage
	.word BtlCmd_PrintMessage2 ;20
	.word BtlCmd_PrintBufferedMessage
	.word BtlCmd_BufferMessage
	.word BtlCmd_22
	.word BtlCmd_PlayMoveAnimation
	.word BtlCmd_PlayMoveAnimation2 ;25
	.word BtlCmd_MonFlicker
	.word BtlCmd_HealthbarDataUpdate
	.word BtlCmd_HealthbarUpdate
	.word BtlCmd_TryFaintMon
	.word BtlCmd_PlayFaintAnimation
	.word BtlCmd_Wait
	.word BtlCmd_PlaySE
	.word BtlCmd_If
	.word BtlCmd_IfMonStat
	.word BtlCmd_FadeOutBattle
	.word BtlCmd_JumpToSubSeq
	.word BtlCmd_JumpToCurMoveEffectScript
	.word BtlCmd_JumpToEffectScript
	.word BtlCmd_CritCalc
	.word BtlCmd_ShouldGetExp
	.word BtlCmd_InitGetExp
	.word BtlCmd_GetExp
	.word BtlCmd_GetExpLoop
	.word BtlCmd_ShowParty
	.word BtlCmd_WaitForMonSelection
	.word BtlCmd_SwitchInDataUpdate
	.word BtlCmd_JumpIfCantSwitch
	.word BtlCmd_47
	.word BtlCmd_48
	.word BtlCmd_SetMultiHit
	.word BtlCmd_ChangeVar
	.word BtlCmd_BufferStatChangeMsg
	.word BtlCmd_ChangeMonDataVar
	.word BtlCmd_53
	.word BtlCmd_ToggleVanish
	.word BtlCmd_CheckAbility
	.word BtlCmd_Random
	.word BtlCmd_ChangeVar2
	.word BtlCmd_ChangeMonDataByVar
	.word BtlCmd_Goto
	.word BtlCmd_GotoSubscript
	.word BtlCmd_GotoSubscriptVar
	.word BtlCmd_SetMoveToMirrorMove
	.word BtlCmd_ResetAllStatChanges
	.word BtlCmd_64
	.word BtlCmd_65
	.word BtlCmd_SetHealthbarStatus
	.word BtlCmd_PrintTrainerMessage
	.word BtlCmd_CalcPrizeMoney
	.word BtlCmd_SetStatus2Effect
	.word BtlCmd_CopyStatus2Effect
	.word BtlCmd_SetStatus2EffectVar
	.word BtlCmd_ReturnMessage
	.word BtlCmd_SendOutMessage
	.word BtlCmd_EncounterMessage
	.word BtlCmd_75
	.word BtlCmd_TrainerMessageVar
	.word BtlCmd_TryConversion
	.word BtlCmd_Compare
	.word BtlCmd_IfMonStatVar
	.word BtlCmd_PayDay
	.word BtlCmd_TryLightScreen
	.word BtlCmd_TryReflect
	.word BtlCmd_TryMist
	.word BtlCmd_TryOHKO
	.word BtlCmd_SetDamageDivide
	.word BtlCmd_SetDamageDivideVar
	.word BtlCmd_TryMimic
	.word BtlCmd_Metronome
	.word BtlCmd_TryDisable
	.word BtlCmd_Counter
	.word BtlCmd_MirrorCoat
	.word BtlCmd_TryEncore
	.word BtlCmd_TryConversion2
	.word BtlCmd_TrySketch
	.word BtlCmd_TrySleepTalk
	.word BtlCmd_FlailDamageCalc
	.word BtlCmd_TrySpite
	.word BtlCmd_HealBell
	.word BtlCmd_TryThief
	.word BtlCmd_TryProtect
	.word BtlCmd_TrySubstitute
	.word BtlCmd_TryWhirlwind
	.word BtlCmd_Transform
	.word BtlCmd_TrySpikes
	.word BtlCmd_CheckSpikes
	.word BtlCmd_TryPerishSong
	.word BtlCmd_SetTurnOrderBySpeed
	.word BtlCmd_JumpIfValidBattlerVar
	.word BtlCmd_WeatherDamageCalc
	.word BtlCmd_RolloutDamageCalc
	.word BtlCmd_FuryCutterDamageCalc
	.word BtlCmd_TryAttract
	.word BtlCmd_TrySafeguard
	.word BtlCmd_Present
	.word BtlCmd_MagnitudeDamageCalc
	.word BtlCmd_TrySwitchMon
	.word BtlCmd_RapidSpin
	.word BtlCmd_ChangeWeatherBasedHPRecovery
	.word BtlCmd_HiddenPowerDamageCalc
	.word BtlCmd_PsychUp
	.word BtlCmd_TryFutureSight
	.word BtlCmd_CheckHitRate
	.word BtlCmd_TryTeleport
	.word BtlCmd_BeatUpDamageCalc
	.word BtlCmd_FollowMe
	.word BtlCmd_TryHelpingHand
	.word BtlCmd_TryTrick
	.word BtlCmd_TryWish
	.word BtlCmd_TryAssist
	.word BtlCmd_TrySetMagicCoat
	.word BtlCmd_MagicCoat
	.word BtlCmd_RevengeDamageCalc
	.word BtlCmd_TryBreakScreens
	.word BtlCmd_TryYawn
	.word BtlCmd_TryKnockOff
	.word BtlCmd_EruptionDamageCalc
	.word BtlCmd_TryImprison
	.word BtlCmd_TryGrudge
	.word BtlCmd_TrySnatch
	.word BtlCmd_LowKickDamageCalc
	.word BtlCmd_WeatherBallDamageCalc
	.word BtlCmd_TryPursuit
	.word BtlCmd_TypeEffectivenessCheck
	.word BtlCmd_144
	.word BtlCmd_145
	.word BtlCmd_GyroBallDamageCalc
	.word BtlCmd_MetalBurstDamageCalc
	.word BtlCmd_PaybackDamageCalc
	.word BtlCmd_TrumpCardDamageCalc
	.word BtlCmd_WringOutDamageCalc
	.word BtlCmd_TryMeFirst
	.word BtlCmd_TryCopycat
	.word BtlCmd_PunishmentDamageCalc
	.word BtlCmd_TrySuckerPunch
	.word BtlCmd_CheckSideCondition
	.word BtlCmd_TryFeint
	.word BtlCmd_TryPyschoShift
	.word BtlCmd_TryLastResort
	.word BtlCmd_TryToxicSpikes
	.word BtlCmd_CheckToxicSpikes
	.word BtlCmd_CheckMoldBreaker
	.word BtlCmd_CheckTeammates
	.word BtlCmd_Pickup
	.word BtlCmd_TrickRoom
	.word BtlCmd_CheckMoveFinished
	.word BtlCmd_CheckItemEffect
	.word BtlCmd_GetItemEffect
	.word BtlCmd_GetItemPower
	.word BtlCmd_TryCamouflage
	.word BtlCmd_NaturePower
	.word BtlCmd_SecretPower
	.word BtlCmd_TryNaturalGift
	.word BtlCmd_TryPluck
	.word BtlCmd_TryFling
	.word BtlCmd_YesNoBox
	.word BtlCmd_YesNoBoxWait
	.word BtlCmd_MonList
	.word BtlCmd_MonListWait
	.word BtlCmd_SetBattleResults
	.word BtlCmd_CheckStealthRock
	.word BtlCmd_CheckEffectActivation
	.word BtlCmd_CheckChatterActivation
	.word BtlCmd_GetMoveParam
	.word BtlCmd_Mosaic
	.word BtlCmd_ChangeForme
	.word BtlCmd_SetBattleBackground
	.word BtlCmd_RecoverStatus
	.word BtlCmd_TryRun
	.word BtlCmd_InitStartBallGauge
	.word BtlCmd_DeleteStartBallGauge
	.word BtlCmd_InitBallGauge
	.word BtlCmd_DeleteBallGauge
	.word BtlCmd_LoadBallGfx
	.word BtlCmd_DeleteBallGfx
	.word BtlCmd_IncrementGameStat
	.word BtlCmd_196
	.word BtlCmd_CheckAbilityEffectOnHit
	.word BtlCmd_198
	.word BtlCmd_199
	.word BtlCmd_CheckWhiteout
	.word BtlCmd_TryAcupressure
	.word BtlCmd_RemoveItem
	.word BtlCmd_TryRecycle
	.word BtlCmd_CheckItemEffectOnHit
	.word BtlCmd_BattleResultMessage
	.word BtlCmd_RunAwayMessage
	.word BtlCmd_ForefitMessage
	.word BtlCmd_CheckHoldOnWith1HP
	.word BtlCmd_TryNaturalCure
	.word BtlCmd_CheckSubstitute
	.word BtlCmd_CheckCloudNine
	.word BtlCmd_CheckUTurnItemEffect
	.word BtlCmd_212
	.word BtlCmd_SwapToSubstituteSprite
	.word BtlCmd_PlayMoveSE
	.word BtlCmd_PlaySong
	.word BtlCmd_CheckSafariEncounterDone
	.word BtlCmd_WaitWithoutInterrupt
	.word BtlCmd_CheckCurMoveIsType
	.word BtlCmd_GetMonDataFromNarc
	.word BtlCmd_RefreshMonData
	.word BtlCmd_222
	.word BtlCmd_223
	.word BtlCmd_EndScript

ov12_0226CA4C: ; 0x0226CA4C
	.byte 0x1E, 0x28, 0x32, 0x3C
	.byte 0x46, 0x50, 0x5A, 0x5E, 0x62, 0x00, 0x00, 0x00
    
ov12_0226CA58: ; 0x0226CA58
	.byte 0x05, 0x0A, 0x0F, 0x14, 0x19, 0x1E, 0x23, 0x28
	.byte 0x2D, 0x32, 0x00, 0x00

ov12_0226CA64: ; 0x0226CA64
	.byte 0x04, 0x04, 0x0C, 0x0C, 0x05, 0x05, 0x0F, 0x0B, 0x0F, 0x00, 0x04, 0x02
	.byte 0x00, 0x00, 0x00, 0x00
