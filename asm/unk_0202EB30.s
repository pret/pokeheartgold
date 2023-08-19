#include "constants/pokemon.h"
	.include "asm/macros.inc"
	.include "unk_0202EB30.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202EB30
sub_0202EB30: ; 0x0202EB30
	ldr r0, _0202EB34 ; =0x00000688
	bx lr
	.balign 4, 0
_0202EB34: .word 0x00000688
	thumb_func_end sub_0202EB30

	thumb_func_start sub_0202EB38
sub_0202EB38: ; 0x0202EB38
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r2, _0202EB70 ; =0x00000688
	mov r0, #0
	add r1, r5, #0
	bl MIi_CpuClearFast
	mov r4, #0
	mov r6, #MON_DATA_SPECIES_EXISTS
	add r7, r4, #0
_0202EB4C:
	add r0, r5, #0
	bl ZeroMonData
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl GetMonData
	cmp r0, #0
	beq _0202EB64
	bl GF_AssertFail
_0202EB64:
	add r4, r4, #1
	add r5, #0xec
	cmp r4, #6
	blt _0202EB4C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202EB70: .word 0x00000688
	thumb_func_end sub_0202EB38

	thumb_func_start sub_0202EB74
sub_0202EB74: ; 0x0202EB74
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r2, _0202EBAC ; =0x00000588
	mov r0, #0
	add r1, r5, #0
	bl MIi_CpuClearFast
	mov r4, #0
	mov r6, #MON_DATA_SPECIES_EXISTS
	add r7, r4, #0
_0202EB88:
	add r0, r5, #0
	bl ZeroMonData
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl GetMonData
	cmp r0, #0
	beq _0202EBA0
	bl GF_AssertFail
_0202EBA0:
	add r4, r4, #1
	add r5, #0xec
	cmp r4, #6
	blt _0202EB88
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202EBAC: .word 0x00000588
	thumb_func_end sub_0202EB74

	thumb_func_start sub_0202EBB0
sub_0202EBB0: ; 0x0202EBB0
	push {r4, r5, r6, r7}
	add r2, r0, #0
	ldr r3, _0202EC08 ; =0x00000588
	mov r0, #0
	add r5, r2, #0
_0202EBBA:
	ldr r4, [r5, r3]
	cmp r1, r4
	beq _0202EC04
	add r0, r0, #1
	add r5, r5, #4
	cmp r0, #0x14
	blt _0202EBBA
	ldr r1, _0202EC08 ; =0x00000588
	mov r0, #0
	add r4, r2, #0
_0202EBCE:
	ldr r3, [r4, r1]
	cmp r3, #0
	beq _0202EC04
	add r0, r0, #1
	add r4, r4, #4
	cmp r0, #0x14
	blt _0202EBCE
	mov r3, #0
	ldr r4, _0202EC0C ; =0x7FFFFFFF
	add r5, r3, #0
_0202EBE2:
	ldr r0, _0202EC10 ; =0x000005D8
	ldr r1, [r2, r0]
	add r0, r0, #4
	ldr r0, [r2, r0]
	sub r6, r1, r4
	mov ip, r0
	mov r6, ip
	sbc r6, r3
	bge _0202EBFA
	add r4, r1, #0
	add r3, r0, #0
	add r7, r5, #0
_0202EBFA:
	add r5, r5, #1
	add r2, #8
	cmp r5, #0x14
	blt _0202EBE2
	add r0, r7, #0
_0202EC04:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0202EC08: .word 0x00000588
_0202EC0C: .word 0x7FFFFFFF
_0202EC10: .word 0x000005D8
	thumb_func_end sub_0202EBB0

	thumb_func_start sub_0202EC14
sub_0202EC14: ; 0x0202EC14
	add r3, r0, #0
	add r0, r1, #0
	mov r1, #0xec
	mul r1, r2
	add r1, r3, r1
	ldr r3, _0202EC24 ; =CopyBoxPokemonToPokemon
	bx r3
	nop
_0202EC24: .word CopyBoxPokemonToPokemon
	thumb_func_end sub_0202EC14

	thumb_func_start sub_0202EC28
sub_0202EC28: ; 0x0202EC28
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0202EBB0
	add r6, r0, #0
	lsl r0, r6, #2
	add r1, r5, r0
	ldr r0, _0202EC64 ; =0x00000588
	str r4, [r1, r0]
	bl GF_RTC_DateTimeToSec
	lsl r2, r6, #3
	add r3, r5, r2
	ldr r2, _0202EC68 ; =0x000005D8
	str r0, [r3, r2]
	add r0, r2, #4
	str r1, [r3, r0]
	bl OS_GetOwnerRtcOffset
	ldr r2, _0202EC6C ; =0x00000678
	str r0, [r5, r2]
	add r0, r2, #4
	add r2, #8
	str r1, [r5, r0]
	add r0, r5, r2
	bl OS_GetMacAddress
	pop {r4, r5, r6, pc}
	nop
_0202EC64: .word 0x00000588
_0202EC68: .word 0x000005D8
_0202EC6C: .word 0x00000678
	thumb_func_end sub_0202EC28

	thumb_func_start GetMigratedPokemonByIndex
GetMigratedPokemonByIndex: ; 0x0202EC70
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r4, r2, #0
	cmp r5, #6
	blt _0202EC80
	bl GF_AssertFail
_0202EC80:
	mov r0, #0xec
	mul r0, r5
	add r3, r6, r0
	mov r2, #0x1d
_0202EC88:
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r2, r2, #1
	bne _0202EC88
	ldr r0, [r3]
	str r0, [r4]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end GetMigratedPokemonByIndex

	thumb_func_start sub_0202EC98
sub_0202EC98: ; 0x0202EC98
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
	mov r7, #MON_DATA_SPECIES_EXISTS
_0202ECA2:
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0202ECB2
	add r4, r4, #1
_0202ECB2:
	add r6, r6, #1
	add r5, #0xec
	cmp r6, #6
	blt _0202ECA2
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202EC98
