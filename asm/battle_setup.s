	.include "asm/macros.inc"
	.include "battle_setup.inc"
	.include "global.inc"

	.extern BattleSetup_SetParty
	.extern BattleSetup_SetProfile
	.extern BattleSetup_SetChatotVoiceClip
	.extern sub_0205230C

	.text

	thumb_func_start sub_02052580
sub_02052580: ; 0x02052580
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl PlayerProfile_GetTrainerGender
	add r1, r4, #0
	add r1, #0x29
	strb r0, [r1]
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x3c
	bl CopyU16StringArray
	add r3, r4, #0
	add r3, #0x28
	add r4, #0x90
	mov r2, #6
_020525AE:
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r2, r2, #1
	bne _020525AE
	ldr r0, [r3]
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02052580
