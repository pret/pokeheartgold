#include "constants/pokemon.h"
#include "constants/sndseq.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/species.h"
#include "constants/trainer_class.h"
	.include "asm/macros.inc"
	.include "overlay_12_battle_command.inc"
	.include "global.inc"

	.text

	thumb_func_start Task_GetExp
Task_GetExp: ; 0x02245898
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xd8
	add r4, r1, #0
	str r0, [sp, #0x14]
	ldr r0, [r4]
	bl ov12_0223A930
	str r0, [sp, #0x40]
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetPartySize
	cmp r5, r0
	bge _0224591A
	ldr r0, [sp, #0x44]
	lsl r0, r0, #2
	str r0, [sp, #0x28]
_022458D2:
	ldr r0, [r4]
	mov r1, #0
	add r2, r5, #0
	bl BattleSystem_GetPartyMon
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
	bl BattleSystem_GetPartySize
	cmp r5, r0
	blt _022458D2
_0224591A:
	ldr r0, [r4]
	mov r1, #0
	bl BattleSystem_GetPartySize
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
	bl BattleSystem_SetCriticalHpMusicFlag
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
	bl BattleSystem_GetParty
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
	bl BattleSystem_GetTextFrameDelay
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
	bl Link_QueueNotEmpty
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
	bl BattleController_EmitSetStatus2Effect
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
	bl Link_QueueNotEmpty
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
	bl BattleSystem_GetLocation
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
	bl BattleSystem_ReloadMonData
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetBgConfig
	add r6, r0, #0
	ldr r0, [r4]
	mov r1, #1
	bl BattleSystem_GetWindow
	add r5, r0, #0
	ldr r0, [r4]
	bl BattleSystem_GetPaletteData
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
	bl BattleSystem_GetWindow
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
	bl BattleSystem_GetWindow
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
	bl BattleSystem_GetWindow
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
	bl BattleSystem_GetBgConfig
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
	bl BattleSystem_ReloadMonData
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleController_EmitDrawYesNoBox
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleController_EmitDrawYesNoBox
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_ReloadMonData
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
	thumb_func_end Task_GetExp

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
	bl AllocAndLoadMonPersonal_HandleAlternateForm
	add r7, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl Party_GetMonByIndex
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

	thumb_func_start Task_GetPokemon
Task_GetPokemon: ; 0x022465A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x158
	add r4, r1, #0
	str r0, [sp, #0x10]
	ldr r0, [r4]
	bl ov12_0223A930
	str r0, [sp, #0x20]
	ldr r0, [r4]
	bl BattleSystem_GetPaletteData
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
	bl BattleSystem_GetPaletteData
	str r0, [sp, #0x150]
	mov r0, #1
	str r0, [sp, #0x144]
	mov r0, #0
	str r0, [sp, #0x148]
	ldr r0, [r4]
	str r0, [sp, #0x154]
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetBattleType
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
	bl Link_QueueNotEmpty
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_SetCriticalHpMusicFlag
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
	bl BattleSystem_GetPartyMon
	add r6, r0, #0
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetPartyMon
	add r2, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl ov12_022567D4
	ldr r0, [r4]
	bl BattleSystem_GetMessageIcon
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
	bl BattleSystem_GetBattleType
	mov r1, #1
	lsl r1, r1, #0xc
	tst r0, r1
	ldr r0, [r4]
	beq _022469B0
	bl BattleSystem_GetMessageIcon
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
	bl BattleSystem_GetMessageIcon
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetMessageIcon
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
	bl BattleSystem_GetOpponentData
	mov r1, #0
	bl ov12_02261294
	ldr r0, [r4]
	bl BattleSystem_GetBgConfig
	str r0, [sp, #0xd0]
	ldr r0, [r4]
	bl BattleSystem_GetPaletteData
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
	bl BattleSystem_GetPartyMon
	str r0, [sp, #0xdc]
	ldr r0, [r4]
	bl BattleSystem_GetPokedex
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetPartyMon
	add r6, r0, #0
	ldr r0, [r4, #8]
	bl ov07_02233ECC
	ldr r0, [sp, #0x24]
	bl sub_0200878C
	ldr r0, [r4]
	mov r1, #0
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetMessageIcon
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
	bl BattleController_EmitDrawYesNoBox
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
	bl BattleSystem_GetMessageIcon
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
	bl BattleSystem_GetPartyMon
	mov r1, #5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	add r5, r0, #0
	ldr r0, [r4]
	bl BattleSystem_GetOptions
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
	bl BattleSystem_GetPartySize
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
	bl BattleSystem_GetPcStorage
	str r0, [r5, #0x48]
	add r0, r6, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	str r0, [r5, #0x10]
	ldr r0, _0224706C ; =_02102610
	add r1, r5, #0
	mov r2, #5
	bl OverlayManager_New
	str r0, [r4, #0x50]
	mov r0, #0x15
	str r0, [r4, #0x28]
	ldr r0, [r4]
	bl BattleSystem_HpBar_Delete
	ldr r0, [r4]
	mov r5, #0
	bl BattleSystem_GetMaxBattlers
	cmp r0, #0
	ble _02246E18
	add r7, r5, #0
_02246DF6:
	ldr r0, [r4]
	add r1, r5, #0
	bl BattleSystem_GetOpponentData
	add r6, r0, #0
	ldr r0, [r6, #0x18]
	cmp r0, #0
	beq _02246E0C
	bl sub_0200D9DC
	str r7, [r6, #0x18]
_02246E0C:
	ldr r0, [r4]
	add r5, r5, #1
	bl BattleSystem_GetMaxBattlers
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
	bl OverlayManager_Run
	cmp r0, #0
	beq _02246E82
	ldr r2, [r4, #4]
	ldr r5, [r4, #0x54]
	add r3, r2, r7
	ldr r2, _02247064 ; =0x0000219C
	ldr r0, [r4]
	ldrb r2, [r3, r2]
	add r1, r7, #0
	bl BattleSystem_GetPartyMon
	ldr r1, [r5, #0x14]
	cmp r1, #0
	bne _02246E5C
	ldr r2, [r5, #0x18]
	mov r1, #0x78
	bl SetMonData
	ldr r0, [r4]
	mov r1, #0x32
	bl BattleSystem_GameStatIncrement
_02246E5C:
	add r0, r5, #0
	bl sub_0208311C
	ldr r0, [r4, #0x50]
	bl OverlayManager_Delete
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
	bl BattleSystem_GetParty
	ldr r2, [r4, #4]
	str r0, [sp, #0x28]
	add r3, r2, r7
	ldr r2, _02247064 ; =0x0000219C
	ldr r0, [r4]
	ldrb r2, [r3, r2]
	add r1, r7, #0
	bl BattleSystem_GetPartyMon
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
	bl BattleController_EmitIncrementGameStat
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetMessageIcon
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
	bl Party_AddMon
	cmp r0, #1
	bne _02246F5E
	ldr r0, [r4, #0x28]
	cmp r0, #0x16
	bne _02246F56
	ldr r0, [r4]
	bl BattleSystem_GetMessageIcon
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
	bl BattleSystem_GetPcStorage
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
	bl Mon_UpdateGiratinaForm
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetMessageIcon
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleSystem_GetTextFrameDelay
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
	bl BattleController_EmitPokemonSendOut
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
	bl Link_QueueNotEmpty
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
	bl BattleSystem_GetTextFrameDelay
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
	thumb_func_end Task_GetPokemon

	thumb_func_start ov12_02247228
ov12_02247228: ; 0x02247228
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	add r4, r1, #0
	bl BattleSystem_GetBattleType
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
	ldr r2, _02247530 ; =ov12_0226C3CE + 1
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
	bl BattleSystem_GetTerrainId
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
	bl BattleSystem_GetTimezone
	cmp r0, #3
	beq _022473FC
	add r0, r7, #0
	bl BattleSystem_GetTimezone
	cmp r0, #4
	beq _022473FC
	add r0, r7, #0
	bl BattleSystem_GetTerrainId
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
_02247530: .word ov12_0226C3CE + 1
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
	bl BattleSystem_Random
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
	bl BattleSystem_GetPartyMon
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
	bl BattleSystem_GetMaxBattlers
	add r6, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _0224771C
	mov r7, #1
_02247706:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetMaxBattlers
	add r6, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _02247744
	ldr r7, _022478F0 ; =0x00000195
_0224772C:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetBattleType
	mov r1, #2
	tst r0, r1
	beq _02247754
	mov r6, #5
	b _02247756
_02247754:
	mov r6, #1
_02247756:
	add r0, r4, #0
	bl BattleSystem_GetMaxBattlers
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _0224777A
_02247764:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetMaxBattlers
	add r6, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _022477A0
	mov r7, #1
_0224778A:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetMaxBattlers
	add r6, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _022477C8
	ldr r7, _022478F0 ; =0x00000195
_022477B0:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetBattleType
	mov r1, #2
	tst r0, r1
	beq _022477D8
	mov r6, #4
	b _022477DA
_022477D8:
	mov r6, #0
_022477DA:
	add r0, r4, #0
	bl BattleSystem_GetMaxBattlers
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _022478E2
_022477E8:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSystem_GetOpponentData
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
	bl BattleSystem_GetMaxBattlers
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
	bl BattleSystem_GetFieldSide
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, r7, #0
	bl BattleSystem_GetFieldSide
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
	bl BattleSystem_GetMaxBattlers
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
	bl BattleSystem_GetFieldSide
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r1, r7, #0
	bl BattleSystem_GetFieldSide
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
	bl BattleSystem_GetMaxBattlers
	add r7, r0, #0
	ldr r1, [r6, #0x64]
	add r0, r4, #0
	bl BattleSystem_GetFieldSide
	add r6, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _022478E2
_0224789E:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSystem_GetFieldSide
	cmp r6, r0
	bne _022478E2
	add r5, r5, #1
	cmp r5, r7
	blt _0224789E
	b _022478E2
_022478B2:
	bl BattleSystem_GetMaxBattlers
	add r7, r0, #0
	ldr r1, [r6, #0x6c]
	add r0, r4, #0
	bl BattleSystem_GetFieldSide
	add r6, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _022478E2
_022478C8:
	add r0, r4, #0
	add r1, r5, #0
	bl BattleSystem_GetFieldSide
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
	bl GetMoveMessageNo
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
	bl GetMoveMessageNo
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
	bl GetMoveMessageNo
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
	bl GetMoveMessageNo
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
	bl GetMoveMessageNo
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl GetMoveMessageNo
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
	bl GetMoveMessageNo
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
	bl GetMoveMessageNo
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
	bl GetMoveMessageNo
	str r0, [r5, #8]
	ldr r1, [r4, #0x10]
	add r0, r6, #0
	bl GetMoveMessageNo
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02247CFE:
	ldr r2, [r4, #8]
	bl ov12_022480C0
	str r0, [r5, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	bl GetMoveMessageNo
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
	bl GetMoveMessageNo
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
	bl GetMoveMessageNo
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
	bl GetMoveMessageNo
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

	thumb_func_start GetMoveMessageNo
GetMoveMessageNo: ; 0x022480F0
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
	thumb_func_end GetMoveMessageNo

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
	bl BattlerSetAbility
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
	bl BattleSystem_GetMessageBuffer
	str r0, [sp, #0x20]
	add r0, r7, #0
	bl ov12_0223A9A4
	str r0, [sp, #0x24]
	add r0, r7, #0
	bl BattleSystem_GetBgConfig
	str r0, [sp, #0x1c]
	add r0, r7, #0
	bl ov12_0223A8E4
	add r6, r0, #0
	add r0, r7, #0
	bl ov12_0223A8EC
	add r4, r0, #0
	add r0, r7, #0
	bl BattleSystem_GetPaletteData
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
	bl String_Delete
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

	thumb_func_start UpdateFrienshipFainted
UpdateFrienshipFainted: ; 0x02248558
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r1, r2, #0
	add r5, r0, #0
	str r2, [sp]
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	bne _0224863C
	add r0, r5, #0
	bl BattleSystem_GetBattleType
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
	bl BattleSystem_GetPartyMon
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
	bl BattleSystem_GetLocation
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
	bl BattleSystem_GetLocation
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
	bl BattleSystem_GetLocation
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
	thumb_func_end UpdateFrienshipFainted

	thumb_func_start BattlerSetAbility
BattlerSetAbility: ; 0x02248648
	add r1, r0, r1
	mov r0, #0x39
	lsl r0, r0, #4
	strb r2, [r1, r0]
	bx lr
	.balign 4, 0
	thumb_func_end BattlerSetAbility

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
	.byte 20, 15, 10, 15

.public sTrumpCardPowerTable

sTrumpCardPowerTable: ; 0x0226C2F0
	.byte 200, 80, 60, 50, 40

.public sProtectSuccessChance
	.balign 4, 0
sProtectSuccessChance: ; 0x0226C2F8
	.short 0xFFFF
	.short 0x7FFF
	.short 0x3FFF
	.short 0x1FFF

.public sFlailDamageTable

; First byte: HP threshold as 64ths of max
; Second byte: Damage value
sFlailDamageTable: ; 0x0226C300
	.byte 1, 200
	.byte 5, 150
	.byte 12, 100
	.byte 21, 80
	.byte 42, 40
	.byte 64, 20

.public sPickupTable2

sPickupTable2: ; 0x0226C30C
	.short ITEM_HYPER_POTION, ITEM_NUGGET
	.short ITEM_KINGS_ROCK,ITEM_FULL_RESTORE, ITEM_ETHER, ITEM_IRON_BALL, ITEM_TM56, ITEM_ELIXIR, ITEM_TM86, ITEM_LEFTOVERS
	.short ITEM_TM26

	.balign 4, 0
ov12_0226C324: ; 0x0226C324
	.word NUM_BATTLE_STATS
	.word STAT_ATK
	.word STAT_DEF
	.word STAT_SPATK
	.word STAT_SPDEF
	.word STAT_SPEED

ov12_0226C33C: ; 0x0226C33C
	.word MON_DATA_MAXHP
	.word MON_DATA_ATK
	.word MON_DATA_DEF
	.word MON_DATA_SPATK
	.word MON_DATA_SPDEF
	.word MON_DATA_SPEED

ov12_0226C354: ; 0x0226C354
	.word MON_DATA_MAXHP
	.word MON_DATA_ATK
	.word MON_DATA_DEF
	.word MON_DATA_SPATK
	.word MON_DATA_SPDEF
	.word MON_DATA_SPEED

ov12_0226C36C: ; 0x0226C36C
	.word NUM_BATTLE_STATS
	.word STAT_ATK
	.word STAT_DEF
	.word STAT_SPATK
	.word STAT_SPDEF
	.word STAT_SPEED

ov12_0226C384: ; 0x0226C384
	.word MON_DATA_MAXHP
	.word MON_DATA_ATK
	.word MON_DATA_DEF
	.word MON_DATA_SPATK
	.word MON_DATA_SPDEF
	.word MON_DATA_SPEED

.public sLowKickDamageTable

sLowKickDamageTable:
	.short 100, 20
	.short 250, 40
	.short 500, 60
	.short 1000, 80
	.short 2000, 100
	.short 0xFFFF, 0xFFFF

.public sNaturePowerMoveTable

sNaturePowerMoveTable: ; 0x0226C3B4
	.short MOVE_EARTHQUAKE, MOVE_EARTHQUAKE, MOVE_SEED_BOMB, MOVE_SEED_BOMB, MOVE_ROCK_SLIDE, MOVE_ROCK_SLIDE
	.short MOVE_BLIZZARD, MOVE_HYDRO_PUMP, MOVE_ICE_BEAM, MOVE_TRI_ATTACK, MOVE_MUD_BOMB, MOVE_AIR_SLASH, MOVE_TRI_ATTACK

	; Stat change multipliers
ov12_0226C3CE: ; 0x0226C3CE
	.byte 10, 40
	.byte 10, 35
	.byte 10, 30
	.byte 10, 25
	.byte 10, 20
	.byte 10, 15
	.byte 10, 10
	.byte 15, 10
	.byte 20, 10
	.byte 25, 10
	.byte 30, 10
	.byte 35, 10
	.byte 40, 10

ov12_0226C3E8: ; 0x0226C3E8
	.short SPECIES_NIDORAN_F
	.short SPECIES_NIDORINA
	.short SPECIES_NIDOQUEEN
	.short SPECIES_NIDORAN_M
	.short SPECIES_NIDORINO
	.short SPECIES_NIDOKING
	.short SPECIES_CLEFFA
	.short SPECIES_CLEFAIRY
	.short SPECIES_CLEFABLE
	.short SPECIES_IGGLYBUFF
	.short SPECIES_JIGGLYPUFF
	.short SPECIES_WIGGLYTUFF
	.short SPECIES_SKITTY
	.short SPECIES_DELCATTY

.public sPickupTable1

sPickupTable1: ; 0x0226C404
	.short ITEM_POTION, ITEM_ANTIDOTE, ITEM_SUPER_POTION, ITEM_GREAT_BALL, ITEM_REPEL, ITEM_ESCAPE_ROPE
	.short ITEM_FULL_HEAL, ITEM_HYPER_POTION, ITEM_ULTRA_BALL, ITEM_REVIVE, ITEM_RARE_CANDY, ITEM_SUN_STONE, ITEM_MOON_STONE, ITEM_HEART_SCALE
	.short ITEM_FULL_RESTORE, ITEM_MAX_REVIVE, ITEM_PP_UP, ITEM_MAX_ELIXIR

ov12_0226C428: ; 0x0226C428
	.short 0x80, 0x00, 0x00
	.short 0
	.word 200, 0, 1
	.word 20021, 20016, 20013, 20013, -1, -1
	.word 1, 0

ov12_0226C45C: ; 0x0226C45C
	.short 0x98, 0x18, 0x00
	.short 0
	.word 100, 0, 1
	.word 20022, 20017, 20014, 20014, -1, -1
	.word 1, 0

.public sSecretPowerEffectTable

sSecretPowerEffectTable: ; 0x0226C490
	.word 0x8000001B
	.word 0x8000001B
	.word 0x80000001
	.word 0x80000001
	.word 0x80000008
	.word 0x80000008
	.word 0x80000004
	.word 0x80000016
	.word 0x80000004
	.word 0x80000005
	.word 0x80000018
	.word 0x8000001C
	.word 0x80000005

.public sPrizeMoneyTbl

sPrizeMoneyTbl: ; 0x0226C4C4
	.short TRAINERCLASS_PKMN_TRAINER_ETHAN, 0
	.short TRAINERCLASS_PKMN_TRAINER_LYRA, 0
	.short TRAINERCLASS_YOUNGSTER, 4
	.short TRAINERCLASS_LASS, 4
	.short TRAINERCLASS_CAMPER, 4
	.short TRAINERCLASS_PICNICKER, 4
	.short TRAINERCLASS_BUG_CATCHER, 4
	.short TRAINERCLASS_AROMA_LADY, 8
	.short TRAINERCLASS_TWINS, 4
	.short TRAINERCLASS_HIKER, 8
	.short TRAINERCLASS_BATTLE_GIRL, 4
	.short TRAINERCLASS_FISHERMAN, 8
	.short TRAINERCLASS_CYCLIST_M, 8
	.short TRAINERCLASS_CYCLIST_F, 8
	.short TRAINERCLASS_BLACK_BELT, 6
	.short TRAINERCLASS_ARTIST, 12
	.short TRAINERCLASS_PKMN_BREEDER_M, 12
	.short TRAINERCLASS_PKMN_BREEDER_F, 12
	.short TRAINERCLASS_COWGIRL, 4
	.short TRAINERCLASS_JOGGER, 8
	.short TRAINERCLASS_POKEFAN_M, 16
	.short TRAINERCLASS_POKEFAN, 16
	.short TRAINERCLASS_POKE_KID, 2
	.short TRAINERCLASS_RIVAL, 16
	.short TRAINERCLASS_ACE_TRAINER_M, 15
	.short TRAINERCLASS_ACE_TRAINER_F, 15
	.short TRAINERCLASS_WAITRESS, 8
	.short TRAINERCLASS_VETERAN, 20
	.short TRAINERCLASS_NINJA_BOY, 2
	.short TRAINERCLASS_DRAGON_TAMER, 8
	.short TRAINERCLASS_BIRD_KEEPER_GS, 8
	.short TRAINERCLASS_JUGGLER, 8
	.short TRAINERCLASS_RICH_BOY, 40
	.short TRAINERCLASS_LADY, 40
	.short TRAINERCLASS_GENTLEMAN, 50
	.short TRAINERCLASS_SOCIALITE, 50
	.short TRAINERCLASS_BEAUTY, 14
	.short TRAINERCLASS_COLLECTOR, 16
	.short TRAINERCLASS_POLICEMAN, 10
	.short TRAINERCLASS_PKMN_RANGER_M, 15
	.short TRAINERCLASS_PKMN_RANGER_F, 15
	.short TRAINERCLASS_SCIENTIST, 12
	.short TRAINERCLASS_SWIMMER_M, 4
	.short TRAINERCLASS_SWIMMER_F, 4
	.short TRAINERCLASS_TUBER_M, 1
	.short TRAINERCLASS_TUBER_F, 1
	.short TRAINERCLASS_SAILOR, 8
	.short TRAINERCLASS_KIMONO_GIRL, 30
	.short TRAINERCLASS_RUIN_MANIAC, 12
	.short TRAINERCLASS_PSYCHIC_M, 8
	.short TRAINERCLASS_PSYCHIC_F, 8
	.short TRAINERCLASS_PI, 30
	.short TRAINERCLASS_GUITARIST, 6
	.short TRAINERCLASS_ACE_TRAINER_M_GS, 15
	.short TRAINERCLASS_ACE_TRAINER_F_GS, 15
	.short TRAINERCLASS_TEAM_ROCKET, 10
	.short TRAINERCLASS_SKIER, 8
	.short TRAINERCLASS_ROUGHNECK, 6
	.short TRAINERCLASS_CLOWN, 6
	.short TRAINERCLASS_WORKER, 10
	.short TRAINERCLASS_SCHOOL_KID_M, 5
	.short TRAINERCLASS_SCHOOL_KID_F, 5
	.short TRAINERCLASS_TEAM_ROCKET_F, 10
	.short TRAINERCLASS_BURGLAR, 4
	.short TRAINERCLASS_FIREBREATHER, 8
	.short TRAINERCLASS_BIKER, 4
	.short TRAINERCLASS_LEADER_FALKNER, 30
	.short TRAINERCLASS_LEADER_BUGSY, 30
	.short TRAINERCLASS_POKE_MANIAC, 16
	.short TRAINERCLASS_LEADER_WHITNEY, 30
	.short TRAINERCLASS_LEADER_MORTY, 30
	.short TRAINERCLASS_RANCHER, 10
	.short TRAINERCLASS_LEADER_PRYCE, 30
	.short TRAINERCLASS_LEADER_JASMINE, 30
	.short TRAINERCLASS_LEADER_CHUCK, 30
	.short TRAINERCLASS_LEADER_CLAIR, 30
	.short TRAINERCLASS_TEACHER, 12
	.short TRAINERCLASS_SUPER_NERD, 12
	.short TRAINERCLASS_SAGE, 12
	.short TRAINERCLASS_MEDIUM, 12
	.short TRAINERCLASS_PARASOL_LADY, 8
	.short TRAINERCLASS_WAITER, 8
	.short TRAINERCLASS_CHAMPION, 50
	.short TRAINERCLASS_CAMERAMAN, 8
	.short TRAINERCLASS_REPORTER, 10
	.short TRAINERCLASS_IDOL, 18
	.short TRAINERCLASS_ELITE_FOUR_WILL, 30
	.short TRAINERCLASS_ELITE_FOUR_KAREN, 30
	.short TRAINERCLASS_ELITE_FOUR_KOGA, 30
	.short TRAINERCLASS_LEADER_BROCK, 30
	.short TRAINERCLASS_PKMN_TRAINER_CHERYL, 30
	.short TRAINERCLASS_PKMN_TRAINER_RILEY, 30
	.short TRAINERCLASS_PKMN_TRAINER_BUCK, 30
	.short TRAINERCLASS_PKMN_TRAINER_MIRA, 30
	.short TRAINERCLASS_PKMN_TRAINER_MARLEY, 30
	.short TRAINERCLASS_PKMN_TRAINER_FTR_LUCAS, 25
	.short TRAINERCLASS_PKMN_TRAINER_FTR_DAWN, 25
	.short TRAINERCLASS_TOWER_TYCOON, 0
	.short TRAINERCLASS_LEADER_MISTY, 30
	.short TRAINERCLASS_HALL_MATRON, 0
	.short TRAINERCLASS_FACTORY_HEAD, 0
	.short TRAINERCLASS_ARCADE_STAR, 0
	.short TRAINERCLASS_CASTLE_VALET, 0
	.short TRAINERCLASS_LEADER_LT_SURGE, 30
	.short TRAINERCLASS_LEADER_ERIKA, 30
	.short TRAINERCLASS_LEADER_JANINE, 30
	.short TRAINERCLASS_LEADER_SABRINA, 30
	.short TRAINERCLASS_LEADER_BLAINE, 30
	.short TRAINERCLASS_PKMN_TRAINER_RED, 50
	.short TRAINERCLASS_LEADER_BLUE, 40
	.short TRAINERCLASS_ELDER, 30
	.short TRAINERCLASS_ELITE_FOUR_BRUNO, 30
	.short TRAINERCLASS_SCIENTIST_GS, 8
	.short TRAINERCLASS_EXECUTIVE_ARIANA, 20
	.short TRAINERCLASS_BOARDER, 8
	.short TRAINERCLASS_EXECUTIVE_ARCHER, 20
	.short TRAINERCLASS_EXECUTIVE_PROTON, 10
	.short TRAINERCLASS_EXECUTIVE_PETREL, 10
	.short TRAINERCLASS_PASSERBY, 25
	.short TRAINERCLASS_MYSTERY_MAN, 30
	.short TRAINERCLASS_DOUBLE_TEAM, 30
	.short TRAINERCLASS_YOUNG_COUPLE, 16
	.short TRAINERCLASS_PKMN_TRAINER_LANCE, 0
	.short TRAINERCLASS_ROCKET_BOSS, 45
	.short TRAINERCLASS_PKMN_TRAINER_LUCAS_DP, 0
	.short TRAINERCLASS_PKMN_TRAINER_DAWN_DP, 0
	.short TRAINERCLASS_PKMN_TRAINER_LUCAS_PT, 0
	.short TRAINERCLASS_PKMN_TRAINER_DAWN_PT, 0
	.short TRAINERCLASS_BIRD_KEEPER, 8

.public sBattleScriptCommandTable;

sBattleScriptCommandTable: ; 0x0226C6C8
	.word BtlCmd_PlayEncounterAnimation
	.word BtlCmd_PokemonEncounter
	.word BtlCmd_PokemonSlideIn
	.word BtlCmd_PokemonSendOut
	.word BtlCmd_RecallPokemon ;5
	.word BtlCmd_DeletePokemon
	.word BtlCmd_TrainerEncounter
	.word BtlCmd_ThrowPokeball
	.word BtlCmd_TrainerSlideOut
	.word BtlCmd_TrainerSlideIn ;10
	.word BtlCmd_BackgroundSlideIn
	.word BtlCmd_HealthbarSlideIn
	.word BtlCmd_HealthbarSlideInDelay
	.word BtlCmd_HealthbarSlideOut
	.word BtlCmd_WaitForMessage ;15
	.word BtlCmd_DamageCalc
	.word BtlCmd_DamageCalcRaw
	.word BtlCmd_PrintAttackMessage
	.word BtlCmd_PrintMessage
	.word BtlCmd_PrintMessage2 ;20
	.word BtlCmd_PrintBufferedMessage
	.word BtlCmd_BufferMessage
	.word BtlCmd_BufferMessageSide
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
	.word BtlCmd_InitGetPokemon
	.word BtlCmd_GetPokemon
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
	.word BtlCmd_FirstSendOutMessage
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
	.word BtlCmd_PokemonEncounter44
	.word BtlCmd_PokemonEncounter45
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
	.word BtlCmd_GetItemHoldEffect
	.word BtlCmd_GetItemModifier
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
	.word BtlCmd_ChangeForm
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
	.word BtlCmd_211
	.word BtlCmd_CheckItemEffectOnUTurn
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

.public sPickupWeightTable

sPickupWeightTable: ; 0x0226CA4C
	.byte 30, 40, 50, 60, 70, 80, 90, 94, 98

.public sHoneyGatherChanceTable

	.balign 4, 0
sHoneyGatherChanceTable: ; 0x0226CA58
	.byte 5, 10, 15, 20, 25, 30, 35, 40, 45, 50

.public sCamouflageTypeTable

	.balign 4, 0
sCamouflageTypeTable: ; 0x0226CA64
	.byte TYPE_GROUND, TYPE_GROUND, TYPE_GRASS, TYPE_GRASS, TYPE_ROCK, TYPE_ROCK, TYPE_ICE, TYPE_WATER, TYPE_ICE, TYPE_NORMAL, TYPE_GROUND, TYPE_FLYING
	.byte TYPE_NORMAL
