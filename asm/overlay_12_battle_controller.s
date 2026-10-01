	.include "macros.inc"
	.include "overlay_12_battle_controller.inc"
	.include "global.inc"

	.text
	.public BattleController_SendLocalMessage
	.public BattleController_RecvMessage
	.public SendMessage

	

	thumb_func_start ov12_022632C0
ov12_022632C0: ; 0x022632C0
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r2, r1, #0
	mov r1, #4
	str r1, [sp]
	mov r1, #0
	add r3, sp, #0x10
	bl SendMessage
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov12_022632C0

	thumb_func_start BattleController_EmitShowMonList
BattleController_EmitShowMonList: ; 0x022632DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r1, #0
	add r1, r2, #0
	str r2, [sp, #0xc]
	add r4, r3, #0
	bl BattleBuffer_Clear
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
	bl SendMessage
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02263354: .word 0x00003108
_02263358: .word 0x0000312C
_0226335C: .word 0x0000219C
	thumb_func_end BattleController_EmitShowMonList

	thumb_func_start ov12_02263360
ov12_02263360: ; 0x02263360
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r2, r1, #0
	mov r1, #4
	str r1, [sp]
	mov r1, #0
	add r3, sp, #0x10
	bl SendMessage
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov12_02263360

	thumb_func_start BattleController_EmitDrawYesNoBox
BattleController_EmitDrawYesNoBox: ; 0x0226337C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r2, #0
	add r6, r0, #0
	add r0, r1, #0
	add r1, r5, #0
	add r4, r3, #0
	bl BattleBuffer_Clear
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
	bl SendMessage
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end BattleController_EmitDrawYesNoBox

	thumb_func_start BattleController_EmitPrintAttackMessage
BattleController_EmitPrintAttackMessage: ; 0x022633B8
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
	bl SendMessage
	add sp, #8
	pop {r4, pc}
	nop
_022633E8: .word 0x0000219C
_022633EC: .word 0x00003044
	thumb_func_end BattleController_EmitPrintAttackMessage

	thumb_func_start BattleController_EmitPrintMessage
BattleController_EmitPrintMessage: ; 0x022633F0
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
	bl SendMessage
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end BattleController_EmitPrintMessage

	thumb_func_start BattleController_SetMoveAnimation
BattleController_SetMoveAnimation: ; 0x0226340C
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
	bl SendMessage
	add sp, #0x68
	pop {r4, r5, r6, pc}
	thumb_func_end BattleController_SetMoveAnimation

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
	bl SendMessage
	add sp, #0x68
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0226343C

	thumb_func_start BattleController_EmitMonFlicker
BattleController_EmitMonFlicker: ; 0x0226346C
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #0x17
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end BattleController_EmitMonFlicker

	thumb_func_start BattleController_EmitHealthbarUpdate
BattleController_EmitHealthbarUpdate: ; 0x02263488
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r1, #0
	str r2, [sp, #8]
	add r1, r2, #0
	add r3, r5, r2
	ldr r2, _0226354C ; =0x0000219C
	str r0, [sp, #4]
	ldrb r2, [r3, r2]
	bl BattleSystem_GetPartyMon
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
	bl SendMessage
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226354C: .word 0x0000219C
_02263550: .word 0x00002D74
_02263554: .word 0x0000215C
_02263558: .word 0x00002D54
_0226355C: .word 0x00002DBE
_02263560: .word 0x00002DA4
	thumb_func_end BattleController_EmitHealthbarUpdate

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
	bl BattleSystem_GetPartyMon
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
	bl SendMessage
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_022635E0: .word 0x0000219C
_022635E4: .word 0x00002DA4
	thumb_func_end ov12_02263564

	thumb_func_start BattleController_EmitPlayFaintAnimation
BattleController_EmitPlayFaintAnimation: ; 0x022635E8
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
	bl SendMessage
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022636E4: .word 0x00002DFA
_022636E8: .word 0x00002DBE
_022636EC: .word 0x00002D66
_022636F0: .word 0x00002DB0
_022636F4: .word 0x00002DE4
_022636F8: .word 0x00002DA8
	thumb_func_end BattleController_EmitPlayFaintAnimation

	thumb_func_start BattleController_EmitPlaySE
BattleController_EmitPlaySE: ; 0x022636FC
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
	bl SendMessage
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BattleController_EmitPlaySE

	thumb_func_start BattleController_EmitFadeOutBattle
BattleController_EmitFadeOutBattle: ; 0x0226371C
	push {r3, lr}
	sub sp, #8
	mov r1, #0x1c
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	mov r2, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end BattleController_EmitFadeOutBattle

	thumb_func_start BattleController_EmitToggleVanish
BattleController_EmitToggleVanish: ; 0x02263738
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
	bl SendMessage
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022637F0: .word 0x00002DB0
_022637F4: .word 0x00002D66
_022637F8: .word 0x00002DFA
_022637FC: .word 0x00002DE4
_02263800: .word 0x00002DBE
_02263804: .word 0x00002DA8
	thumb_func_end BattleController_EmitToggleVanish

	thumb_func_start BattleController_EmitHealthbarStatus
BattleController_EmitHealthbarStatus: ; 0x02263808
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
	bl SendMessage
	add sp, #8
	pop {r4, pc}
	thumb_func_end BattleController_EmitHealthbarStatus

	thumb_func_start BattleController_EmitPrintTrainerMessage
BattleController_EmitPrintTrainerMessage: ; 0x02263828
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
	bl SendMessage
	add sp, #8
	pop {r4, pc}
	thumb_func_end BattleController_EmitPrintTrainerMessage

	thumb_func_start BattleController_EmitSetStatus2Effect
BattleController_EmitSetStatus2Effect: ; 0x02263848
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
	bl SendMessage
	add sp, #0x68
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BattleController_EmitSetStatus2Effect

	thumb_func_start BattleController_EmitCopyStatus2Effect
BattleController_EmitCopyStatus2Effect: ; 0x02263878
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
	bl SendMessage
	add sp, #0x68
	pop {r3, r4, r5, pc}
	thumb_func_end BattleController_EmitCopyStatus2Effect

	thumb_func_start BattleController_EmitPrintReturnMessage
BattleController_EmitPrintReturnMessage: ; 0x022638A8
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
	bl SendMessage
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022638E4: .word 0x00003122
_022638E8: .word 0x00002E4C
	thumb_func_end BattleController_EmitPrintReturnMessage

	thumb_func_start BattleController_EmitPrintSendOutMessage
BattleController_EmitPrintSendOutMessage: ; 0x022638EC
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
	bl SendMessage
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02263934: .word 0x00002E4C
	thumb_func_end BattleController_EmitPrintSendOutMessage

	thumb_func_start BattleController_EmitPrintEncounterMessage
BattleController_EmitPrintEncounterMessage: ; 0x02263938
	push {r3, lr}
	sub sp, #8
	mov r1, #0x22
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, pc}
	thumb_func_end BattleController_EmitPrintEncounterMessage

	thumb_func_start BattleController_EmitPrintFirstSendOutMessage
BattleController_EmitPrintFirstSendOutMessage: ; 0x02263950
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r1, #0
	str r2, [sp, #4]
	mov r2, #0x23
	add r1, sp, #8
	add r6, r0, #0
	strb r2, [r1]
	mov r4, #0
	bl BattleSystem_GetMaxBattlers
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
	bl BattleSystem_GetMaxBattlers
	cmp r4, r0
	blt _0226396C
_02263982:
	mov r0, #8
	str r0, [sp]
	ldr r2, [sp, #4]
	add r0, r6, #0
	mov r1, #1
	add r3, sp, #8
	bl SendMessage
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02263998: .word 0x0000219C
	thumb_func_end BattleController_EmitPrintFirstSendOutMessage

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
	bl SendMessage
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
	bl BattleSystem_GetBattleContext
	add r1, r4, #0
	bl BattleBuffer_Clear
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
	bl SendMessage
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
	bl SendMessage
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
	bl BattleSystem_GetPartyMon
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
	bl Battler_GetStatusCondition
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
	bl BattleSystem_CheckMonCaught
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
	bl BattleSystem_GetSafariBallCount
	str r0, [sp, #0x20]
	mov r0, #0x14
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #0x10
	bl SendMessage
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02263B38: .word 0x0000219C
_02263B3C: .word 0x00002D74
_02263B40: .word 0x00002D54
_02263B44: .word 0x00002DBE
_02263B48: .word 0x00002DA4
	thumb_func_end ov12_02263A1C

	thumb_func_start BattleController_EmitBattleMonToPartyMonCopy
BattleController_EmitBattleMonToPartyMonCopy: ; 0x02263B4C
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
	mul r3, r1
	ldrb r4, [r2, #1]
	mov r1, #0xf0
	str r3, [sp, #0xc]
	bic r4, r1
	add r1, r3, #0
	add r3, r6, r1
	ldr r1, _02263C8C ; =0x00002DCC
	ldr r5, [r3, r1]
	lsl r5, r5, #0x1a
	lsr r5, r5, #0x1c
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	lsl r5, r5, #0x1c
	lsr r5, r5, #0x18
	orr r4, r5
	strb r4, [r2, #1]
	add r4, r1, #0
	sub r4, #0x40
	ldr r4, [r3, r4]
	sub r1, #0x14
	strh r4, [r2, #2]
	ldrh r1, [r3, r1]
	strh r1, [r2, #0xc]
	ldr r1, [sp, #8]
	bl BattleSystem_GetFieldSide
	lsl r0, r0, #3
	add r1, r6, r0
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r7, _02263C90 ; =0x00002D6C
	lsl r0, r0, #3
	lsr r0, r0, #0x1a
	str r0, [sp, #0x18]
	ldr r0, [sp, #0xc]
	add r2, r6, r0
	ldr r0, _02263C94 ; =0x00002D66
	ldrb r1, [r2, r0]
	add r0, r0, #1
	lsl r1, r1, #0x1b
	lsr r3, r1, #0x1b
	add r1, sp, #0x10
	strh r3, [r1, #0x20]
	ldrb r0, [r2, r0]
	ldr r1, [sp, #8]
	mov r2, #0xc0
	mul r2, r1
	add r1, r6, r2
	mov ip, r2
	add r2, sp, #0x10
	str r0, [sp, #0x34]
	mov r0, #0
	add r3, r1, #0
	add r4, r2, #0
_02263BE6:
	ldr r5, _02263C98 ; =0x00002D4C
	add r0, r0, #1
	ldrh r5, [r1, r5]
	add r1, r1, #2
	strh r5, [r2, #0xe]
	ldrb r5, [r3, r7]
	add r2, r2, #2
	add r3, r3, #1
	strb r5, [r4, #0x16]
	add r4, r4, #1
	cmp r0, #4
	blt _02263BE6
	add r1, sp, #0x10
	mov r0, #2
	ldrsh r0, [r1, r0]
	cmp r0, #0
	beq _02263C1E
	mov r0, ip
	add r3, r6, r0
	ldr r0, _02263C9C ; =0x00002DAC
	ldr r1, _02263CA0 ; =0xFFFFF0FF
	ldr r2, [r3, r0]
	add r0, r0, #4
	and r1, r2
	str r1, [sp, #0x14]
	ldr r0, [r3, r0]
	str r0, [sp, #0x2c]
	b _02263C2C
_02263C1E:
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	add r1, r6, r0
	ldr r0, _02263CA4 ; =0x00002DB0
	ldr r0, [r1, r0]
	str r0, [sp, #0x2c]
_02263C2C:
	mov r1, #0x85
	lsl r1, r1, #6
	mov r0, #1
	ldr r2, [r6, r1]
	lsl r0, r0, #0x1a
	tst r0, r2
	add r0, sp, #0x10
	beq _02263C4A
	mov r2, #1
	strh r2, [r0, #0x2a]
	ldr r2, [r6, r1]
	ldr r0, _02263CA8 ; =0xFBFFFFFF
	and r0, r2
	str r0, [r6, r1]
	b _02263C4E
_02263C4A:
	mov r1, #0
	strh r1, [r0, #0x2a]
_02263C4E:
	mov r1, #0x85
	lsl r1, r1, #6
	mov r0, #2
	ldr r2, [r6, r1]
	lsl r0, r0, #0x1a
	tst r0, r2
	add r0, sp, #0x10
	beq _02263C6E
	mov r2, #1
	strh r2, [r0, #0x28]
	strh r2, [r0, #0x2a]
	ldr r2, [r6, r1]
	ldr r0, _02263CAC ; =0xF7FFFFFF
	and r0, r2
	str r0, [r6, r1]
	b _02263C72
_02263C6E:
	mov r1, #0
	strh r1, [r0, #0x28]
_02263C72:
	mov r0, #0x2c
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r2, [sp, #8]
	mov r1, #1
	add r3, sp, #0x10
	bl SendMessage
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_02263C88: .word 0x0000219C
_02263C8C: .word 0x00002DCC
_02263C90: .word 0x00002D6C
_02263C94: .word 0x00002D66
_02263C98: .word 0x00002D4C
_02263C9C: .word 0x00002DAC
_02263CA0: .word 0xFFFFF0FF
_02263CA4: .word 0x00002DB0
_02263CA8: .word 0xFBFFFFFF
_02263CAC: .word 0xF7FFFFFF
	thumb_func_end BattleController_EmitBattleMonToPartyMonCopy

	thumb_func_start BattleController_EmitBackgroundSlideIn
BattleController_EmitBackgroundSlideIn: ; 0x02263CB0
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #0x28
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end BattleController_EmitBackgroundSlideIn

	thumb_func_start ov12_02263CCC
ov12_02263CCC: ; 0x02263CCC
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #0x29
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_02263CCC

	thumb_func_start BattleControl_EmitPartyStatusHeal
BattleControl_EmitPartyStatusHeal: ; 0x02263CE8
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r5, #0x2a
	add r4, sp, #4
	strb r5, [r4]
	strh r3, [r4, #2]
	mov r3, #0xc0
	mul r3, r2
	add r3, r1, r3
	ldr r1, _02263D10 ; =0x00002D67
	ldrb r1, [r3, r1]
	add r3, sp, #4
	strb r1, [r4, #1]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	bl SendMessage
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02263D10: .word 0x00002D67
	thumb_func_end BattleControl_EmitPartyStatusHeal

	thumb_func_start ov12_02263D14
ov12_02263D14: ; 0x02263D14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r7, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	bl BattleSystem_GetBattleContext
	add r1, r5, #0
	bl BattleBuffer_Clear
	mov r1, #0x2b
	add r0, sp, #4
	strb r1, [r0]
	strh r4, [r0, #2]
	strb r6, [r0, #1]
	mov r0, #4
	str r0, [sp]
	add r0, r7, #0
	mov r1, #1
	add r2, r5, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_02263D14

	thumb_func_start BattleController_EmitPlayMosaicAnimation
BattleController_EmitPlayMosaicAnimation: ; 0x02263D48
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	mov r5, #0x2c
	add r1, sp, #4
	strb r5, [r1]
	strb r2, [r1, #1]
	strb r3, [r1, #2]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BattleController_EmitPlayMosaicAnimation

	thumb_func_start BattleController_EmitChangeForm
BattleController_EmitChangeForm: ; 0x02263D6C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r1, #0
	mov r1, #0x2d
	add r3, sp, #4
	strb r1, [r3]
	mov r1, #0xc0
	add r6, r7, #0
	mul r6, r1
	ldr r1, [r0, #0x30]
	add r2, r1, r6
	mov r1, #0xb5
	lsl r1, r1, #6
	ldrh r2, [r2, r1]
	strh r2, [r3, #2]
	ldr r2, [r0, #0x30]
	add r4, r2, r6
	add r2, r1, #0
	add r2, #0x26
	ldrb r2, [r4, r2]
	lsl r2, r2, #0x1a
	lsr r2, r2, #0x1f
	strb r2, [r3, #5]
	ldr r2, [r0, #0x30]
	add r5, r2, r6
	add r2, r1, #0
	add r2, #0x70
	ldr r4, [r5, r2]
	mov r2, #2
	lsl r2, r2, #0x14
	tst r2, r4
	beq _02263DC0
	add r2, r1, #0
	add r2, #0xba
	ldrh r2, [r5, r2]
	add r1, #0xa4
	strb r2, [r3, #4]
	ldr r2, [r0, #0x30]
	add r2, r2, r6
	ldr r1, [r2, r1]
	str r1, [sp, #0xc]
	b _02263DD6
_02263DC0:
	add r2, r1, #0
	add r2, #0x7e
	ldrb r2, [r5, r2]
	add r1, #0x68
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x1c
	strb r2, [r3, #4]
	ldr r2, [r0, #0x30]
	add r2, r2, r6
	ldr r1, [r2, r1]
	str r1, [sp, #0xc]
_02263DD6:
	ldr r1, [r0, #0x30]
	add r3, sp, #4
	add r2, r1, r6
	ldr r1, _02263DF8 ; =0x00002D66
	ldrb r1, [r2, r1]
	lsl r1, r1, #0x1b
	lsr r2, r1, #0x1b
	add r1, sp, #4
	strb r2, [r1, #1]
	mov r1, #0xc
	str r1, [sp]
	mov r1, #1
	add r2, r7, #0
	bl SendMessage
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02263DF8: .word 0x00002D66
	thumb_func_end BattleController_EmitChangeForm

	thumb_func_start BattleController_EmitSetBattleBackground
BattleController_EmitSetBattleBackground: ; 0x02263DFC
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #0x2e
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end BattleController_EmitSetBattleBackground

	thumb_func_start ov12_02263E18
ov12_02263E18: ; 0x02263E18
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #0x2f
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_02263E18

	thumb_func_start BattleController_EmitInitStartBallGauge
BattleController_EmitInitStartBallGauge: ; 0x02263E34
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	str r4, [sp]
	ldr r1, [r5, #0x30]
	add r2, sp, #4
	mov r3, #0x30
	bl ov12_022645F8
	mov r0, #8
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end BattleController_EmitInitStartBallGauge

	thumb_func_start BattleController_EmitDeleteStartBallGauge
BattleController_EmitDeleteStartBallGauge: ; 0x02263E5C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	str r4, [sp]
	ldr r1, [r5, #0x30]
	add r2, sp, #4
	mov r3, #0x31
	bl ov12_022645F8
	mov r0, #8
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end BattleController_EmitDeleteStartBallGauge

	thumb_func_start BattleController_EmitInitBallGauge
BattleController_EmitInitBallGauge: ; 0x02263E84
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	str r4, [sp]
	ldr r1, [r5, #0x30]
	add r2, sp, #4
	mov r3, #0x32
	bl ov12_022645F8
	mov r0, #8
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end BattleController_EmitInitBallGauge

	thumb_func_start BattleController_EmitDeleteBallGauge
BattleController_EmitDeleteBallGauge: ; 0x02263EAC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	str r4, [sp]
	ldr r1, [r5, #0x30]
	add r2, sp, #4
	mov r3, #0x33
	bl ov12_022645F8
	mov r0, #8
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end BattleController_EmitDeleteBallGauge

	thumb_func_start BattleController_EmitLoadBallGfx
BattleController_EmitLoadBallGfx: ; 0x02263ED4
	push {r3, lr}
	sub sp, #8
	mov r1, #0x34
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	mov r2, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end BattleController_EmitLoadBallGfx

	thumb_func_start BattleController_EmitDeleteBallGfx
BattleController_EmitDeleteBallGfx: ; 0x02263EF0
	push {r3, lr}
	sub sp, #8
	mov r1, #0x35
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	mov r2, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end BattleController_EmitDeleteBallGfx

	thumb_func_start BattleController_EmitIncrementGameStat
BattleController_EmitIncrementGameStat: ; 0x02263F0C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	mov r5, #0x36
	add r1, sp, #4
	strb r5, [r1]
	strb r2, [r1, #1]
	strh r3, [r1, #2]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BattleController_EmitIncrementGameStat

	thumb_func_start BattleController_EmitShowWaitMessage
BattleController_EmitShowWaitMessage: ; 0x02263F30
	push {r4, r5, lr}
	sub sp, #0x24
	add r5, r0, #0
	add r4, r1, #0
	bl BattleSystem_GetBattleType
	mov r2, #0x37
	add r1, sp, #4
	strb r2, [r1]
	mov r2, #0
	strh r2, [r1, #2]
	mov r1, #4
	tst r0, r1
	beq _02263F84
	bl sub_0202FC48
	cmp r0, #1
	bne _02263F84
	ldr r0, _02263F88 ; =0x0000240C
	ldr r1, [r5, r0]
	mov r0, #0x10
	tst r0, r1
	bne _02263F84
	add r0, r5, #0
	add r1, sp, #8
	bl ov12_0223BE68
	add r1, sp, #4
	strh r0, [r1, #2]
	ldrh r0, [r1, #2]
	cmp r0, #0x1c
	blo _02263F74
	bl GF_AssertFail
_02263F74:
	mov r0, #0x20
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #4
	bl SendMessage
_02263F84:
	add sp, #0x24
	pop {r4, r5, pc}
	.balign 4, 0
_02263F88: .word 0x0000240C
	thumb_func_end BattleController_EmitShowWaitMessage

	thumb_func_start ov12_02263F8C
ov12_02263F8C: ; 0x02263F8C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	str r0, [sp, #4]
	add r3, r1, #0
	mov r1, #0x38
	add r0, sp, #0xc
	strb r1, [r0]
	mov r0, #0
	add r7, sp, #0xc
	str r2, [sp, #8]
	ldr r4, _02264024 ; =0x00002D66
	mov ip, r0
	add r0, r3, r4
	add r4, #0x58
	add r1, r7, #0
	add r2, r7, #0
	add r6, r3, r4
_02263FAE:
	mov r4, #0xb5
	lsl r4, r4, #6
	ldrh r4, [r3, r4]
	strh r4, [r7, #0x18]
	ldrb r4, [r0]
	lsl r4, r4, #0x1a
	lsr r5, r4, #0x1f
	add r4, r1, #0
	add r4, #0x24
	strb r5, [r4]
	ldrb r4, [r0]
	lsl r4, r4, #0x1b
	lsr r5, r4, #0x1b
	add r4, r1, #0
	add r4, #0x28
	strb r5, [r4]
	ldr r4, _02264028 ; =0x00002DB0
	ldr r5, [r3, r4]
	mov r4, #2
	lsl r4, r4, #0x14
	tst r4, r5
	beq _02263FE8
	ldr r4, _0226402C ; =0x00002DFA
	ldrh r5, [r3, r4]
	add r4, r1, #0
	add r4, #0x20
	strb r5, [r4]
	ldr r4, _02264030 ; =0x00002DE4
	b _02263FF6
_02263FE8:
	ldrb r4, [r6]
	lsl r4, r4, #0x1c
	lsr r5, r4, #0x1c
	add r4, r1, #0
	add r4, #0x20
	strb r5, [r4]
	ldr r4, _02264034 ; =0x00002DA8
_02263FF6:
	ldr r4, [r3, r4]
	add r3, #0xc0
	str r4, [r2, #0x2c]
	mov r4, ip
	add r4, r4, #1
	add r7, r7, #2
	add r0, #0xc0
	add r1, r1, #1
	add r2, r2, #4
	add r6, #0xc0
	mov ip, r4
	cmp r4, #4
	blt _02263FAE
	mov r0, #0x58
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r2, [sp, #8]
	mov r1, #1
	add r3, sp, #0xc
	bl SendMessage
	add sp, #0x64
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02264024: .word 0x00002D66
_02264028: .word 0x00002DB0
_0226402C: .word 0x00002DFA
_02264030: .word 0x00002DE4
_02264034: .word 0x00002DA8
	thumb_func_end ov12_02263F8C

	thumb_func_start ov12_02264038
ov12_02264038: ; 0x02264038
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #0x39
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_02264038

	thumb_func_start ov12_02264054
ov12_02264054: ; 0x02264054
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #0x3a
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_02264054

	thumb_func_start BattleController_EmitPrintResultMessage
BattleController_EmitPrintResultMessage: ; 0x02264070
	push {r3, lr}
	sub sp, #8
	mov r1, #0x3b
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	mov r2, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end BattleController_EmitPrintResultMessage

	thumb_func_start BattleController_EmitRunAwayMessage
BattleController_EmitRunAwayMessage: ; 0x0226408C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r0, #0
	add r5, r1, #0
	bl BattleSystem_GetBattleType
	str r0, [sp, #4]
	mov r1, #0x3c
	add r0, sp, #8
	strb r1, [r0]
	mov r4, #0
	strb r4, [r0, #1]
	strh r4, [r0, #2]
	add r0, r6, #0
	bl BattleSystem_GetMaxBattlers
	cmp r0, #0
	ble _022640D4
	add r7, sp, #8
_022640B2:
	ldr r0, _02264118 ; =0x000021A8
	ldr r0, [r5, r0]
	cmp r0, #0x10
	bne _022640C6
	add r0, r4, #0
	bl MaskOfFlagNo
	ldrb r1, [r7, #1]
	orr r0, r1
	strb r0, [r7, #1]
_022640C6:
	add r0, r6, #0
	add r5, #0x10
	add r4, r4, #1
	bl BattleSystem_GetMaxBattlers
	cmp r4, r0
	blt _022640B2
_022640D4:
	ldr r0, [sp, #4]
	mov r1, #4
	tst r0, r1
	beq _02264104
	bl sub_0202FC48
	cmp r0, #1
	bne _02264104
	ldr r0, _0226411C ; =0x0000240C
	ldr r1, [r6, r0]
	mov r0, #0x10
	tst r0, r1
	bne _02264104
	add r0, r6, #0
	add r1, sp, #0xc
	bl ov12_0223BE68
	add r1, sp, #8
	strh r0, [r1, #2]
	ldrh r0, [r1, #2]
	cmp r0, #0x1c
	blo _02264104
	bl GF_AssertFail
_02264104:
	mov r0, #0x20
	str r0, [sp]
	add r0, r6, #0
	mov r1, #1
	mov r2, #0
	add r3, sp, #8
	bl SendMessage
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02264118: .word 0x000021A8
_0226411C: .word 0x0000240C
	thumb_func_end BattleController_EmitRunAwayMessage

	thumb_func_start BattleController_EmitForefitMessage
BattleController_EmitForefitMessage: ; 0x02264120
	push {r3, r4, lr}
	sub sp, #0x24
	add r4, r0, #0
	bl BattleSystem_GetBattleType
	mov r2, #0x3d
	add r1, sp, #4
	strb r2, [r1]
	mov r2, #0
	strh r2, [r1, #2]
	mov r1, #4
	tst r0, r1
	beq _02264162
	bl sub_0202FC48
	cmp r0, #1
	bne _02264162
	ldr r0, _02264178 ; =0x0000240C
	ldr r1, [r4, r0]
	mov r0, #0x10
	tst r0, r1
	bne _02264162
	add r0, r4, #0
	add r1, sp, #8
	bl ov12_0223BE68
	add r1, sp, #4
	strh r0, [r1, #2]
	ldrh r0, [r1, #2]
	cmp r0, #0x1c
	blo _02264162
	bl GF_AssertFail
_02264162:
	mov r0, #0x20
	str r0, [sp]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #0x24
	pop {r3, r4, pc}
	nop
_02264178: .word 0x0000240C
	thumb_func_end BattleController_EmitForefitMessage

	thumb_func_start BattleController_EmitSwapToSubstituteSprite
BattleController_EmitSwapToSubstituteSprite: ; 0x0226417C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	str r0, [sp, #4]
	add r3, r1, #0
	mov r1, #0x3e
	add r0, sp, #0xc
	strb r1, [r0]
	mov r0, #0
	add r7, sp, #0xc
	str r2, [sp, #8]
	ldr r4, _02264214 ; =0x00002D66
	mov ip, r0
	add r0, r3, r4
	add r4, #0x58
	add r1, r7, #0
	add r2, r7, #0
	add r6, r3, r4
_0226419E:
	mov r4, #0xb5
	lsl r4, r4, #6
	ldrh r4, [r3, r4]
	strh r4, [r7, #0x18]
	ldrb r4, [r0]
	lsl r4, r4, #0x1a
	lsr r5, r4, #0x1f
	add r4, r1, #0
	add r4, #0x24
	strb r5, [r4]
	ldrb r4, [r0]
	lsl r4, r4, #0x1b
	lsr r5, r4, #0x1b
	add r4, r1, #0
	add r4, #0x28
	strb r5, [r4]
	ldr r4, _02264218 ; =0x00002DB0
	ldr r5, [r3, r4]
	mov r4, #2
	lsl r4, r4, #0x14
	tst r4, r5
	beq _022641D8
	ldr r4, _0226421C ; =0x00002DFA
	ldrh r5, [r3, r4]
	add r4, r1, #0
	add r4, #0x20
	strb r5, [r4]
	ldr r4, _02264220 ; =0x00002DE4
	b _022641E6
_022641D8:
	ldrb r4, [r6]
	lsl r4, r4, #0x1c
	lsr r5, r4, #0x1c
	add r4, r1, #0
	add r4, #0x20
	strb r5, [r4]
	ldr r4, _02264224 ; =0x00002DA8
_022641E6:
	ldr r4, [r3, r4]
	add r3, #0xc0
	str r4, [r2, #0x2c]
	mov r4, ip
	add r4, r4, #1
	add r7, r7, #2
	add r0, #0xc0
	add r1, r1, #1
	add r2, r2, #4
	add r6, #0xc0
	mov ip, r4
	cmp r4, #4
	blt _0226419E
	mov r0, #0x58
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r2, [sp, #8]
	mov r1, #1
	add r3, sp, #0xc
	bl SendMessage
	add sp, #0x64
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02264214: .word 0x00002D66
_02264218: .word 0x00002DB0
_0226421C: .word 0x00002DFA
_02264220: .word 0x00002DE4
_02264224: .word 0x00002DA8
	thumb_func_end BattleController_EmitSwapToSubstituteSprite

	thumb_func_start BattleController_EmitPlayMoveSE
BattleController_EmitPlayMoveSE: ; 0x02264228
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r3, #0x3f
	add r4, sp, #4
	strb r3, [r4]
	ldr r3, _02264264 ; =0x0000216C
	ldr r5, [r1, r3]
	mov r1, #2
	add r3, r5, #0
	tst r3, r1
	beq _02264242
	strb r1, [r4, #1]
	b _02264252
_02264242:
	mov r1, #4
	tst r1, r5
	beq _0226424E
	mov r1, #1
	strb r1, [r4, #1]
	b _02264252
_0226424E:
	mov r1, #0
	strb r1, [r4, #1]
_02264252:
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02264264: .word 0x0000216C
	thumb_func_end BattleController_EmitPlayMoveSE

	thumb_func_start BattleController_EmitPlaySong
BattleController_EmitPlaySong: ; 0x02264268
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	mov r3, #0x40
	add r1, sp, #4
	strb r3, [r1]
	strh r2, [r1, #2]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	add r2, r4, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r4, pc}
	thumb_func_end BattleController_EmitPlaySong

	thumb_func_start BattleController_EmitSetBattleResults
BattleController_EmitSetBattleResults: ; 0x02264288
	push {r3, r4, r5, lr}
	sub sp, #0x28
	add r5, r0, #0
	bl BattleSystem_GetBattleType
	add r4, r0, #0
	mov r1, #0x41
	add r0, sp, #4
	strb r1, [r0]
	add r0, r5, #0
	bl BattleSystem_GetBattleOutcomeFlags
	str r0, [sp, #8]
	mov r1, #0
	add r0, sp, #4
	strh r1, [r0, #2]
	mov r0, #4
	tst r0, r4
	beq _022642D6
	bl sub_0202FC48
	cmp r0, #1
	bne _022642D6
	ldr r0, _022642EC ; =0x0000240C
	ldr r1, [r5, r0]
	mov r0, #0x10
	tst r0, r1
	bne _022642D6
	add r0, r5, #0
	add r1, sp, #0xc
	bl ov12_0223BE68
	add r1, sp, #4
	strh r0, [r1, #2]
	ldrh r0, [r1, #2]
	cmp r0, #0x1c
	bls _022642D6
	bl GF_AssertFail
_022642D6:
	mov r0, #0x24
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #0x28
	pop {r3, r4, r5, pc}
	nop
_022642EC: .word 0x0000240C
	thumb_func_end BattleController_EmitSetBattleResults

	thumb_func_start BattleController_EmitBlankMessage
BattleController_EmitBlankMessage: ; 0x022642F0
	push {r3, lr}
	sub sp, #8
	mov r1, #0x42
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp]
	mov r1, #1
	mov r2, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end BattleController_EmitBlankMessage

	thumb_func_start ov12_0226430C
ov12_0226430C: ; 0x0226430C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, sp, #4
	add r4, r1, #0
	strb r2, [r0]
	bl sub_0203769C
	add r1, sp, #4
	strb r0, [r1, #1]
	mov r0, #4
	str r0, [sp]
	add r0, r5, #0
	mov r1, #2
	add r2, r4, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0226430C

	thumb_func_start ov12_02264334
ov12_02264334: ; 0x02264334
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #1
	ldrb r3, [r5, #3]
	str r1, [sp]
	ldrb r2, [r5]
	ldrb r1, [r5, #2]
	lsl r3, r3, #8
	add r4, r0, #0
	orr r1, r3
	ldrb r6, [r5, #1]
	cmp r2, #0
	bne _0226436E
	mov r2, #0
	cmp r1, #0
	ble _022643C2
	mov r7, #0x23
	lsl r3, r6, #8
	lsl r7, r7, #8
_0226435A:
	add r0, r5, r2
	ldr r6, [r4, #0x30]
	ldrb r0, [r0, #4]
	add r6, r3, r6
	add r6, r2, r6
	add r2, r2, #1
	strb r0, [r6, r7]
	cmp r2, r1
	blt _0226435A
	b _022643C2
_0226436E:
	cmp r2, #1
	bne _022643A6
	lsl r0, r6, #2
	add r0, r4, r0
	mov r3, #0x6a
	ldr r4, [r0, #0x34]
	lsl r3, r3, #2
	ldrb r2, [r4, r3]
	cmp r2, #0
	bne _022643A0
	ldr r2, [sp]
	strb r2, [r4, r3]
	mov r2, #0
	cmp r1, #0
	ble _022643C2
_0226438C:
	add r3, r5, r2
	ldrb r4, [r3, #4]
	ldr r3, [r0, #0x34]
	add r3, r3, r2
	add r3, #0x94
	add r2, r2, #1
	strb r4, [r3]
	cmp r2, r1
	blt _0226438C
	b _022643C2
_022643A0:
	mov r0, #0
	str r0, [sp]
	b _022643C2
_022643A6:
	cmp r2, #2
	bne _022643C2
	ldrb r7, [r5, #4]
	ldrb r5, [r5, #5]
	bl BattleSystem_IsInitialized
	cmp r0, #0
	beq _022643C2
	ldr r0, [r4, #0x30]
	add r1, r5, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov12_0224ED00
_022643C2:
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_02264334

	thumb_func_start ov12_022643C8
ov12_022643C8: ; 0x022643C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp, #8]
	ldr r1, [sp, #0x24]
	add r4, r2, #0
	str r1, [sp, #0x24]
	ldr r1, [sp, #0x28]
	str r0, [sp, #4]
	str r1, [sp, #0x28]
	mov r1, #0x16
	strb r1, [r4]
	add r1, sp, #0x10
	ldrh r1, [r1, #0x1c]
	strh r1, [r4, #2]
	ldr r1, [sp, #0x24]
	strh r1, [r4, #0x14]
	ldr r1, [sp, #0x28]
	strh r1, [r4, #0x16]
	ldr r1, [sp, #0x20]
	str r3, [r4, #0x4c]
	str r1, [r4, #0x50]
	bl BattleSystem_GetTerrainId
	str r0, [r4, #0x54]
	ldrh r1, [r4, #0xe]
	mov r0, #4
	bic r1, r0
	strh r1, [r4, #0xe]
	ldrh r1, [r4, #0xe]
	mov r0, #8
	bic r1, r0
	ldr r0, [sp, #8]
	strh r1, [r4, #0xe]
	cmp r0, #0
	bne _02264410
	b _0226459A
_02264410:
	ldr r1, _022645A0 ; =0x00002144
	ldr r0, [r0, r1]
	add r1, #0x10
	str r0, [r4, #4]
	ldr r0, [sp, #8]
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02264422
	b _02264430
_02264422:
	add r0, sp, #0x10
	ldrh r0, [r0, #0x1c]
	lsl r1, r0, #4
	ldr r0, [sp, #8]
	add r1, r0, r1
	ldr r0, _022645A4 ; =0x000003E1
	ldrb r0, [r1, r0]
_02264430:
	strh r0, [r4, #8]
	ldr r0, [sp, #0x24]
	mov r1, #0xc0
	mul r1, r0
	ldr r0, [sp, #8]
	mov r2, #8
	add r1, r0, r1
	ldr r0, _022645A8 ; =0x00002D75
	mov r3, #0
	ldrb r0, [r1, r0]
	ldr r1, [sp, #8]
	strh r0, [r4, #0xc]
	mov r0, #0xd
	str r0, [sp]
	ldr r0, [sp, #4]
	bl CheckAbilityActive
	cmp r0, #0
	bne _02264476
	mov r0, #0x4c
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	mov r2, #8
	mov r3, #0
	bl CheckAbilityActive
	cmp r0, #0
	bne _02264476
	mov r1, #6
	ldr r0, [sp, #8]
	lsl r1, r1, #6
	ldr r0, [r0, r1]
	str r0, [r4, #0x10]
	b _0226447A
_02264476:
	mov r0, #0
	str r0, [r4, #0x10]
_0226447A:
	ldr r1, _022645AC ; =0x00002164
	ldr r0, [sp, #8]
	ldr r0, [r0, r1]
	ldr r1, _022645B0 ; =0x00002DB0
	strh r0, [r4, #0xa]
	ldr r0, [sp, #8]
	add r2, r0, r1
	ldr r0, [sp, #0x24]
	mov r1, #0xc0
	mul r1, r0
	mov r0, #1
	ldr r3, [r2, r1]
	lsl r0, r0, #0x18
	tst r0, r3
	beq _0226449C
	mov r5, #1
	b _0226449E
_0226449C:
	mov r5, #0
_0226449E:
	ldrh r0, [r4, #0xe]
	mov r3, #1
	bic r0, r3
	lsl r3, r5, #0x10
	lsr r5, r3, #0x10
	mov r3, #1
	and r5, r3
	orr r0, r5
	strh r0, [r4, #0xe]
	ldr r1, [r2, r1]
	lsl r0, r3, #0x15
	tst r0, r1
	bne _022644BA
	mov r3, #0
_022644BA:
	ldrh r0, [r4, #0xe]
	mov r1, #2
	ldr r5, _022645B4 ; =0x00002D66
	bic r0, r1
	lsl r1, r3, #0x10
	lsr r1, r1, #0x10
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1e
	orr r0, r1
	ldr r1, [sp, #8]
	strh r0, [r4, #0xe]
	add r2, r1, #0
	add r6, r2, r5
	add r5, #0x58
	add r3, r1, #0
	mov r0, #0
	mov ip, r4
	add r2, r4, #0
	add r7, r3, r5
_022644E0:
	mov r3, #0xb5
	lsl r3, r3, #6
	ldrh r5, [r1, r3]
	mov r3, ip
	strh r5, [r3, #0x18]
	ldrb r3, [r6]
	lsl r3, r3, #0x1a
	lsr r5, r3, #0x1f
	add r3, r4, r0
	add r3, #0x24
	strb r5, [r3]
	ldrb r3, [r6]
	lsl r3, r3, #0x1b
	lsr r5, r3, #0x1b
	add r3, r4, r0
	add r3, #0x28
	strb r5, [r3]
	mov r3, #0xb7
	lsl r3, r3, #6
	ldr r3, [r1, r3]
	str r3, [r2, #0x3c]
	ldr r3, _022645B0 ; =0x00002DB0
	ldr r5, [r1, r3]
	mov r3, #2
	lsl r3, r3, #0x14
	tst r3, r5
	beq _02264524
	ldr r3, _022645B8 ; =0x00002DFA
	ldrh r5, [r1, r3]
	add r3, r4, r0
	add r3, #0x20
	strb r5, [r3]
	ldr r3, _022645BC ; =0x00002DE4
	b _02264532
_02264524:
	ldrb r3, [r7]
	lsl r3, r3, #0x1c
	lsr r5, r3, #0x1c
	add r3, r4, r0
	add r3, #0x20
	strb r5, [r3]
	ldr r3, _022645C0 ; =0x00002DA8
_02264532:
	ldr r3, [r1, r3]
	add r0, r0, #1
	str r3, [r2, #0x2c]
	mov r3, ip
	add r3, r3, #2
	add r1, #0xc0
	mov ip, r3
	add r6, #0xc0
	add r2, r2, #4
	add r7, #0xc0
	cmp r0, #4
	blt _022644E0
	ldr r0, [sp, #0x24]
	cmp r0, #0xff
	beq _02264572
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x24]
	bl ov12_0223C140
	cmp r0, #0xff
	beq _02264572
	ldr r2, [sp, #8]
	ldr r1, [sp, #0x24]
	add r2, r2, r1
	ldr r1, _022645C4 ; =0x0000219C
	ldrb r1, [r2, r1]
	cmp r0, r1
	bne _02264572
	ldrh r1, [r4, #0xe]
	mov r0, #4
	orr r0, r1
	strh r0, [r4, #0xe]
_02264572:
	ldr r0, [sp, #0x28]
	cmp r0, #0xff
	beq _0226459A
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x28]
	bl ov12_0223C140
	cmp r0, #0xff
	beq _0226459A
	ldr r2, [sp, #8]
	ldr r1, [sp, #0x28]
	add r2, r2, r1
	ldr r1, _022645C4 ; =0x0000219C
	ldrb r1, [r2, r1]
	cmp r0, r1
	bne _0226459A
	ldrh r1, [r4, #0xe]
	mov r0, #8
	orr r0, r1
	strh r0, [r4, #0xe]
_0226459A:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022645A0: .word 0x00002144
_022645A4: .word 0x000003E1
_022645A8: .word 0x00002D75
_022645AC: .word 0x00002164
_022645B0: .word 0x00002DB0
_022645B4: .word 0x00002D66
_022645B8: .word 0x00002DFA
_022645BC: .word 0x00002DE4
_022645C0: .word 0x00002DA8
_022645C4: .word 0x0000219C
	thumb_func_end ov12_022643C8

	thumb_func_start ov12_022645C8
ov12_022645C8: ; 0x022645C8
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r2, #0
	add r0, sp, #4
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	mov r1, #0x43
	add r0, sp, #4
	strb r1, [r0]
	strb r4, [r0, #1]
	mov r0, #4
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	add r3, sp, #4
	bl SendMessage
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_022645C8

	thumb_func_start ov12_022645F8
ov12_022645F8: ; 0x022645F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x38]
	add r5, r2, #0
	str r1, [sp, #4]
	str r0, [sp, #0x38]
	mov r0, #0
	add r1, r5, #0
	mov r2, #8
	add r6, r3, #0
	bl MIi_CpuClearFast
	ldr r0, [sp]
	bl BattleSystem_GetBattleType
	add r4, r0, #0
	mov r0, #0xc
	and r0, r4
	strb r6, [r5]
	cmp r0, #0xc
	beq _0226464C
	mov r0, #0x10
	tst r0, r4
	beq _02264636
	ldr r0, [sp]
	ldr r1, [sp, #0x38]
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	bne _0226464C
_02264636:
	cmp r4, #0x4b
	bne _02264646
	ldr r0, [sp]
	ldr r1, [sp, #0x38]
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	bne _0226464C
_02264646:
	cmp r4, #0xcb
	beq _0226464C
	b _02264782
_0226464C:
	ldr r0, [sp]
	ldr r1, [sp, #0x38]
	bl ov12_0223AB0C
	cmp r0, #2
	beq _02264664
	ldr r0, [sp]
	ldr r1, [sp, #0x38]
	bl ov12_0223AB0C
	cmp r0, #3
	bne _02264672
_02264664:
	ldr r6, [sp, #0x38]
	ldr r0, [sp]
	add r1, r6, #0
	bl BattleSystem_GetBattlerIdPartner
	str r0, [sp, #0x38]
	b _0226467C
_02264672:
	ldr r0, [sp]
	ldr r1, [sp, #0x38]
	bl BattleSystem_GetBattlerIdPartner
	add r6, r0, #0
_0226467C:
	ldr r0, [sp]
	add r1, r6, #0
	bl BattleSystem_GetParty
	mov r4, #0
	str r0, [sp, #0x10]
	add r7, r4, #0
	bl Party_GetCount
	cmp r0, #0
	ble _022646FC
	mov r0, #6
	add r1, r6, #0
	mul r1, r0
	ldr r0, [sp, #4]
	add r6, r0, r1
_0226469C:
	ldr r1, _0226481C ; =0x0000312C
	ldr r0, [sp, #0x10]
	ldrb r1, [r6, r1]
	bl Party_GetMonByIndex
	mov r1, #0xae
	mov r2, #0
	str r0, [sp, #0x14]
	bl GetMonData
	cmp r0, #0
	beq _022646EE
	ldr r1, _02264820 ; =0x000001EE
	cmp r0, r1
	beq _022646EE
	ldr r0, [sp, #0x14]
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _022646E6
	ldr r0, [sp, #0x14]
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _022646DE
	add r1, r5, r4
	mov r0, #3
	strb r0, [r1, #2]
	b _022646EC
_022646DE:
	add r1, r5, r4
	mov r0, #1
	strb r0, [r1, #2]
	b _022646EC
_022646E6:
	add r1, r5, r4
	mov r0, #2
	strb r0, [r1, #2]
_022646EC:
	add r4, r4, #1
_022646EE:
	ldr r0, [sp, #0x10]
	add r6, r6, #1
	add r7, r7, #1
	bl Party_GetCount
	cmp r7, r0
	blt _0226469C
_022646FC:
	ldr r0, [sp]
	ldr r1, [sp, #0x38]
	bl BattleSystem_GetParty
	str r0, [sp, #8]
	mov r4, #3
	mov r7, #0
	bl Party_GetCount
	cmp r0, #0
	bgt _02264714
	b _02264816
_02264714:
	ldr r0, [sp, #0x38]
	mov r1, #6
	mul r1, r0
	ldr r0, [sp, #4]
	add r6, r0, r1
_0226471E:
	ldr r1, _0226481C ; =0x0000312C
	ldr r0, [sp, #8]
	ldrb r1, [r6, r1]
	bl Party_GetMonByIndex
	mov r1, #0xae
	mov r2, #0
	str r0, [sp, #0x18]
	bl GetMonData
	cmp r0, #0
	beq _02264770
	ldr r1, _02264820 ; =0x000001EE
	cmp r0, r1
	beq _02264770
	ldr r0, [sp, #0x18]
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02264768
	ldr r0, [sp, #0x18]
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02264760
	add r1, r5, r4
	mov r0, #3
	strb r0, [r1, #2]
	b _0226476E
_02264760:
	add r1, r5, r4
	mov r0, #1
	strb r0, [r1, #2]
	b _0226476E
_02264768:
	add r1, r5, r4
	mov r0, #2
	strb r0, [r1, #2]
_0226476E:
	add r4, r4, #1
_02264770:
	ldr r0, [sp, #8]
	add r6, r6, #1
	add r7, r7, #1
	bl Party_GetCount
	cmp r7, r0
	blt _0226471E
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_02264782:
	mov r0, #2
	tst r0, r4
	beq _02264796
	mov r0, #8
	tst r0, r4
	bne _02264796
	ldr r0, [sp, #0x38]
	mov r1, #1
	and r0, r1
	str r0, [sp, #0x38]
_02264796:
	ldr r0, [sp]
	ldr r1, [sp, #0x38]
	bl BattleSystem_GetParty
	mov r4, #0
	str r0, [sp, #0xc]
	add r7, r4, #0
	bl Party_GetCount
	cmp r0, #0
	ble _02264816
	ldr r0, [sp, #0x38]
	mov r1, #6
	mul r1, r0
	ldr r0, [sp, #4]
	add r6, r0, r1
_022647B6:
	ldr r1, _0226481C ; =0x0000312C
	ldr r0, [sp, #0xc]
	ldrb r1, [r6, r1]
	bl Party_GetMonByIndex
	mov r1, #0xae
	mov r2, #0
	str r0, [sp, #0x1c]
	bl GetMonData
	cmp r0, #0
	beq _02264808
	ldr r1, _02264820 ; =0x000001EE
	cmp r0, r1
	beq _02264808
	ldr r0, [sp, #0x1c]
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02264800
	ldr r0, [sp, #0x1c]
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _022647F8
	add r1, r5, r4
	mov r0, #3
	strb r0, [r1, #2]
	b _02264806
_022647F8:
	add r1, r5, r4
	mov r0, #1
	strb r0, [r1, #2]
	b _02264806
_02264800:
	add r1, r5, r4
	mov r0, #2
	strb r0, [r1, #2]
_02264806:
	add r4, r4, #1
_02264808:
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	add r7, r7, #1
	bl Party_GetCount
	cmp r7, r0
	blt _022647B6
_02264816:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226481C: .word 0x0000312C
_02264820: .word 0x000001EE
	thumb_func_end ov12_022645F8
