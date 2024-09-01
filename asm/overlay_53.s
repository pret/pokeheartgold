#include "constants/sndseq.h"
#include "constants/species.h"
#include "msgdata/msg/msg_0219.h"
	.include "asm/macros.inc"
	.include "overlay_53.inc"
	.include "global.inc"

	.text

	.extern ov53_021E5EDC
	.extern ov53_021E60CC
	.extern ov53_021E60E8
	.extern ov53_021E611C
	.extern ov53_021E64C4
	.extern ov53_021E64B4
	.extern ov53_021E65B4
	.extern ov53_021E66A8
	.extern ov53_021E66E8
	.extern ov53_021E67C4
	.extern ov53_021E6824
	.extern ov53_021E6908
	.extern ov53_021E6928
	.extern ov53_021E6988
	.extern ov53_021E6B9C
	.extern ov53_021E6BEC
	.extern ov53_021E6CB0
	.extern ov53_021E6CE0
	.extern ov53_021E6DF0
	.extern ov53_021E6E00
	.extern ov53_021E6E7C

	thumb_func_start ov53_021E6F00
ov53_021E6F00: ; 0x021E6F00
	push {r4, r5, r6, lr}
	add r4, r0, #0
	mov r0, #0x5d
	lsl r0, r0, #2
	ldrh r3, [r4, r0]
	cmp r3, #0
	beq _021E6F18
	cmp r3, #1
	beq _021E6F2C
	cmp r3, #2
	beq _021E6F7E
	b _021E6F86
_021E6F18:
	mov r1, #1
	strh r1, [r4, r0]
	mov r1, #6
	add r3, r2, #0
	mul r3, r1
	ldr r1, _021E6F8C ; =ov53_021E853C
	add r0, r0, #2
	ldrsh r1, [r1, r3]
	strh r1, [r4, r0]
	b _021E6F86
_021E6F2C:
	mov r3, #6
	mul r3, r2
	ldr r2, _021E6F90 ; =ov53_021E853C + 4
	add r5, r0, #2
	ldrsh r2, [r2, r3]
	ldrsh r5, [r4, r5]
	add r6, r5, r2
	add r5, r0, #2
	strh r6, [r4, r5]
	cmp r2, #0
	ble _021E6F58
	ldr r2, _021E6F94 ; =ov53_021E853C + 2
	ldrsh r3, [r2, r3]
	add r2, r5, #0
	ldrsh r2, [r4, r2]
	cmp r2, r3
	blt _021E6F6C
	add r2, r5, #0
	strh r3, [r4, r2]
	mov r2, #2
	strh r2, [r4, r0]
	b _021E6F6C
_021E6F58:
	ldr r2, _021E6F94 ; =ov53_021E853C + 2
	ldrsh r3, [r2, r3]
	add r2, r5, #0
	ldrsh r2, [r4, r2]
	cmp r2, r3
	bgt _021E6F6C
	add r2, r5, #0
	strh r3, [r4, r2]
	mov r2, #2
	strh r2, [r4, r0]
_021E6F6C:
	ldr r3, _021E6F98 ; =0x00000176
	lsl r1, r1, #0x18
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x18]
	lsr r1, r1, #0x18
	mov r2, #0
	bl BgSetPosTextAndCommit
	b _021E6F86
_021E6F7E:
	mov r1, #0
	strh r1, [r4, r0]
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E6F86:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_021E6F8C: .word ov53_021E853C
_021E6F90: .word ov53_021E853C + 4
_021E6F94: .word ov53_021E853C + 2
_021E6F98: .word 0x00000176
	thumb_func_end ov53_021E6F00

	thumb_func_start ov53_021E6F9C
ov53_021E6F9C: ; 0x021E6F9C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	mov r5, #0
	cmp r1, #0x7e
	bls _021E6FAE
	bl _021E7CF8
_021E6FAE:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E6FBA: ; jump table
	.short _021E70B8 - _021E6FBA - 2 ; case 0
	.short _021E7138 - _021E6FBA - 2 ; case 1
	.short _021E7154 - _021E6FBA - 2 ; case 2
	.short _021E7188 - _021E6FBA - 2 ; case 3
	.short _021E719C - _021E6FBA - 2 ; case 4
	.short _021E71CE - _021E6FBA - 2 ; case 5
	.short _021E71EE - _021E6FBA - 2 ; case 6
	.short _021E70E4 - _021E6FBA - 2 ; case 7
	.short _021E7226 - _021E6FBA - 2 ; case 8
	.short _021E7274 - _021E6FBA - 2 ; case 9
	.short _021E7CF8 - _021E6FBA - 2 ; case 10
	.short _021E7284 - _021E6FBA - 2 ; case 11
	.short _021E7298 - _021E6FBA - 2 ; case 12
	.short _021E72AC - _021E6FBA - 2 ; case 13
	.short _021E72C0 - _021E6FBA - 2 ; case 14
	.short _021E72D4 - _021E6FBA - 2 ; case 15
	.short _021E72F0 - _021E6FBA - 2 ; case 16
	.short _021E7304 - _021E6FBA - 2 ; case 17
	.short _021E7320 - _021E6FBA - 2 ; case 18
	.short _021E733C - _021E6FBA - 2 ; case 19
	.short _021E735C - _021E6FBA - 2 ; case 20
	.short _021E7378 - _021E6FBA - 2 ; case 21
	.short _021E739C - _021E6FBA - 2 ; case 22
	.short _021E73B0 - _021E6FBA - 2 ; case 23
	.short _021E73E2 - _021E6FBA - 2 ; case 24
	.short _021E7CF8 - _021E6FBA - 2 ; case 25
	.short _021E7CF8 - _021E6FBA - 2 ; case 26
	.short _021E7414 - _021E6FBA - 2 ; case 27
	.short _021E7440 - _021E6FBA - 2 ; case 28
	.short _021E7456 - _021E6FBA - 2 ; case 29
	.short _021E7CF8 - _021E6FBA - 2 ; case 30
	.short _021E7CF8 - _021E6FBA - 2 ; case 31
	.short _021E7CF8 - _021E6FBA - 2 ; case 32
	.short _021E7CF8 - _021E6FBA - 2 ; case 33
	.short _021E7484 - _021E6FBA - 2 ; case 34
	.short _021E74CE - _021E6FBA - 2 ; case 35
	.short _021E74DE - _021E6FBA - 2 ; case 36
	.short _021E74F2 - _021E6FBA - 2 ; case 37
	.short _021E7504 - _021E6FBA - 2 ; case 38
	.short _021E7516 - _021E6FBA - 2 ; case 39
	.short _021E7528 - _021E6FBA - 2 ; case 40
	.short _021E753A - _021E6FBA - 2 ; case 41
	.short _021E754C - _021E6FBA - 2 ; case 42
	.short _021E756A - _021E6FBA - 2 ; case 43
	.short _021E7590 - _021E6FBA - 2 ; case 44
	.short _021E75E8 - _021E6FBA - 2 ; case 45
	.short _021E760C - _021E6FBA - 2 ; case 46
	.short _021E762A - _021E6FBA - 2 ; case 47
	.short _021E7672 - _021E6FBA - 2 ; case 48
	.short _021E7682 - _021E6FBA - 2 ; case 49
	.short _021E7694 - _021E6FBA - 2 ; case 50
	.short _021E76A8 - _021E6FBA - 2 ; case 51
	.short _021E76DE - _021E6FBA - 2 ; case 52
	.short _021E771C - _021E6FBA - 2 ; case 53
	.short _021E775E - _021E6FBA - 2 ; case 54
	.short _021E77A2 - _021E6FBA - 2 ; case 55
	.short _021E77B4 - _021E6FBA - 2 ; case 56
	.short _021E77C6 - _021E6FBA - 2 ; case 57
	.short _021E77D8 - _021E6FBA - 2 ; case 58
	.short _021E77E8 - _021E6FBA - 2 ; case 59
	.short _021E77FA - _021E6FBA - 2 ; case 60
	.short _021E7818 - _021E6FBA - 2 ; case 61
	.short _021E7842 - _021E6FBA - 2 ; case 62
	.short _021E7850 - _021E6FBA - 2 ; case 63
	.short _021E7892 - _021E6FBA - 2 ; case 64
	.short _021E78AA - _021E6FBA - 2 ; case 65
	.short _021E78C2 - _021E6FBA - 2 ; case 66
	.short _021E7920 - _021E6FBA - 2 ; case 67
	.short _021E794C - _021E6FBA - 2 ; case 68
	.short _021E797C - _021E6FBA - 2 ; case 69
	.short _021E79AC - _021E6FBA - 2 ; case 70
	.short _021E79DE - _021E6FBA - 2 ; case 71
	.short _021E7A3C - _021E6FBA - 2 ; case 72
	.short _021E7CF8 - _021E6FBA - 2 ; case 73
	.short _021E7CF8 - _021E6FBA - 2 ; case 74
	.short _021E7CF8 - _021E6FBA - 2 ; case 75
	.short _021E7CF8 - _021E6FBA - 2 ; case 76
	.short _021E7CF8 - _021E6FBA - 2 ; case 77
	.short _021E7CF8 - _021E6FBA - 2 ; case 78
	.short _021E7CF8 - _021E6FBA - 2 ; case 79
	.short _021E7CF8 - _021E6FBA - 2 ; case 80
	.short _021E7CF8 - _021E6FBA - 2 ; case 81
	.short _021E7CF8 - _021E6FBA - 2 ; case 82
	.short _021E7CF8 - _021E6FBA - 2 ; case 83
	.short _021E7CF8 - _021E6FBA - 2 ; case 84
	.short _021E7CF8 - _021E6FBA - 2 ; case 85
	.short _021E7CF8 - _021E6FBA - 2 ; case 86
	.short _021E7CF8 - _021E6FBA - 2 ; case 87
	.short _021E7CF8 - _021E6FBA - 2 ; case 88
	.short _021E7CF8 - _021E6FBA - 2 ; case 89
	.short _021E7CF8 - _021E6FBA - 2 ; case 90
	.short _021E7CF8 - _021E6FBA - 2 ; case 91
	.short _021E7CF8 - _021E6FBA - 2 ; case 92
	.short _021E7A52 - _021E6FBA - 2 ; case 93
	.short _021E7A64 - _021E6FBA - 2 ; case 94
	.short _021E7A76 - _021E6FBA - 2 ; case 95
	.short _021E7AA4 - _021E6FBA - 2 ; case 96
	.short _021E7B30 - _021E6FBA - 2 ; case 97
	.short _021E7B50 - _021E6FBA - 2 ; case 98
	.short _021E7B6E - _021E6FBA - 2 ; case 99
	.short _021E7BA0 - _021E6FBA - 2 ; case 100
	.short _021E7BBE - _021E6FBA - 2 ; case 101
	.short _021E7C20 - _021E6FBA - 2 ; case 102
	.short _021E7C2E - _021E6FBA - 2 ; case 103
	.short _021E7CF8 - _021E6FBA - 2 ; case 104
	.short _021E7CF8 - _021E6FBA - 2 ; case 105
	.short _021E7CF8 - _021E6FBA - 2 ; case 106
	.short _021E7CF8 - _021E6FBA - 2 ; case 107
	.short _021E7CF8 - _021E6FBA - 2 ; case 108
	.short _021E7CF8 - _021E6FBA - 2 ; case 109
	.short _021E7C40 - _021E6FBA - 2 ; case 110
	.short _021E7C5E - _021E6FBA - 2 ; case 111
	.short _021E7CF8 - _021E6FBA - 2 ; case 112
	.short _021E7CF8 - _021E6FBA - 2 ; case 113
	.short _021E7CF8 - _021E6FBA - 2 ; case 114
	.short _021E7CF8 - _021E6FBA - 2 ; case 115
	.short _021E7CF8 - _021E6FBA - 2 ; case 116
	.short _021E7CF8 - _021E6FBA - 2 ; case 117
	.short _021E7CF8 - _021E6FBA - 2 ; case 118
	.short _021E7CF8 - _021E6FBA - 2 ; case 119
	.short _021E7C6C - _021E6FBA - 2 ; case 120
	.short _021E7CB4 - _021E6FBA - 2 ; case 121
	.short _021E7CF8 - _021E6FBA - 2 ; case 122
	.short _021E7CC0 - _021E6FBA - 2 ; case 123
	.short _021E7CC6 - _021E6FBA - 2 ; case 124
	.short _021E7CD8 - _021E6FBA - 2 ; case 125
	.short _021E7CEE - _021E6FBA - 2 ; case 126
_021E70B8:
	mov r0, #6
	add r1, r5, #0
	bl ToggleBgLayer
	mov r1, #SEQ_GS_POKEMON_THEME>>4
	mov r0, #2
	lsl r1, r1, #4
	mov r2, #1
	bl sub_02004EC4
	mov r0, #SEQ_GS_POKEMON_THEME>>4
	lsl r0, r0, #4
	add r1, r5, #0
	bl StopBGM
	ldr r0, _021E7408 ; =SEQ_GS_STARTING
	bl PlayBGM
	mov r0, #7
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E70E4:
	add r1, r5, #0
	bl ov53_021E6824
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E66A8
	add r0, r4, #0
	add r1, r5, #0
	bl ov53_021E67C4
	mov r0, #3
	mov r1, #1
	bl ToggleBgLayer
	add r0, r5, #0
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #4
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #7
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7138:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E71F6
	add r0, r4, #0
	mov r1, #0x28
	bl ov53_021E60CC
	cmp r0, #1
	bne _021E71F6
	mov r0, #2
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7154:
	mov r1, #7
	mov r2, #2
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E71F6
	mov r0, #6
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #3
	str r0, [r4, #0xc]
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x2c
	mov r2, #0x2d
	mov r3, #0x2e
	bl ov53_021E64C4
	ldr r0, _021E740C ; =0x00000162
	add r1, r5, #0
	strb r1, [r4, r0]
	add r0, r0, #1
	strb r1, [r4, r0]
	bl _021E7CF8
_021E7188:
	add r1, r5, #0
	bl ov53_021E6988
	sub r1, r5, #1
	cmp r0, r1
	beq _021E71F6
	mov r0, #4
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E719C:
	mov r1, #7
	mov r2, #2
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E71F6
	add r0, r4, #0
	bl ov53_021E65B4
	mov r0, #4
	add r1, r5, #0
	bl ToggleBgLayer
	mov r0, #6
	add r1, r5, #0
	bl ToggleBgLayer
	mov r0, #5
	add r1, r5, #0
	bl ToggleBgLayer
	mov r0, #5
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E71CE:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r5, #0
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #6
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E71EE:
	bl IsPaletteFadeFinished
	cmp r0, #1
	beq _021E71FA
_021E71F6:
	bl _021E7CF8
_021E71FA:
	ldr r0, _021E7410 ; =0x00000163
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E720E
	cmp r0, #1
	beq _021E7216
	cmp r0, #2
	beq _021E721E
	bl _021E7CF8
_021E720E:
	mov r0, #8
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7216:
	mov r0, #0x22
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E721E:
	mov r0, #0x2c
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7226:
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E66A8
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E67C4
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E7E08
	mov r0, #4
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #7
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #9
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7274:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7348
	mov r0, #0xb
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7284:
	mov r1, #9
	add r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	mov r0, #0xc
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7298:
	mov r1, #0xa
	add r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	mov r0, #0xd
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E72AC:
	mov r1, #0xb
	add r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	mov r0, #0xe
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E72C0:
	mov r1, #0xc
	add r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	mov r0, #0xf
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E72D4:
	mov r1, #0x17
	mov r2, #2
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	add r0, r5, #0
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #0x10
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E72F0:
	mov r1, #msg_0219_00025
	add r2, r5, #0
	bl ov53_021E611C
	cmp r0, #1
	bne _021E7348
	mov r0, #0x11
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7304:
	mov r1, #0xd
	add r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	add r0, r4, #0
	mov r1, #2
	bl ov53_021E66A8
	mov r0, #0x12
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7320:
	mov r1, #0xe
	mov r2, #3
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E66A8
	mov r0, #0x13
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E733C:
	mov r1, #0xf
	add r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	beq _021E734C
_021E7348:
	bl _021E7CF8
_021E734C:
	add r0, r4, #0
	mov r1, #3
	bl ov53_021E66A8
	mov r0, #0x14
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E735C:
	mov r1, #0x10
	mov r2, #3
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7462
	add r0, r4, #0
	mov r1, #4
	bl ov53_021E66A8
	mov r0, #0x15
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7378:
	mov r1, #0x11
	mov r2, #3
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7462
	mov r0, #0x16
	str r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #1
	bl ToggleBgLayer
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E66A8
	bl _021E7CF8
_021E739C:
	mov r1, #msg_0219_00026
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E7462
	mov r0, #0x17
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E73B0:
	add r1, r5, #0
	bl ov53_021E7E08
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #7
	bl ov53_021E816C
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #219
	mov r2, #msg_0219_00061
	mov r3, #msg_0219_00062
	bl ov53_021E81F4
	mov r0, #0x18
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E73E2:
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov53_021E8248
	cmp r0, #1
	beq _021E73F8
	cmp r0, #2
	beq _021E7400
	bl _021E7CF8
_021E73F8:
	mov r0, #0x1b
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7400:
	mov r0, #0x1d
	str r0, [r4, #0xc]
	bl _021E7CF8
	.balign 4, 0
_021E7408: .word SEQ_GS_STARTING
_021E740C: .word 0x00000162
_021E7410: .word 0x00000163
_021E7414:
	mov r1, #6
	mov r2, #1
	bl ov53_021E5EDC
	cmp r0, #1
	bne _021E7462
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0x1c
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7440:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7462
	add r0, r4, #0
	bl ov53_021E7D58
	mov r0, #7
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7456:
	mov r1, #6
	mov r2, #1
	bl ov53_021E5EDC
	cmp r0, #1
	beq _021E7466
_021E7462:
	bl _021E7CF8
_021E7466:
	add r0, r4, #0
	mov r1, #3
	bl ov53_021E7E08
	mov r0, #6
	add r1, r5, #0
	bl ToggleBgLayer
	add r0, r4, #0
	bl ov53_021E7D58
	mov r0, #8
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7484:
	mov r1, #5
	bl ov53_021E66A8
	add r0, r4, #0
	mov r1, #2
	bl ov53_021E67C4
	add r0, r4, #0
	bl ov53_021E7D58
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E7E08
	mov r0, #4
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #7
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0x23
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E74CE:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7572
	mov r0, #0x24
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E74DE:
	mov r1, #0x1c
	mov r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	mov r0, #0x25
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E74F2:
	mov r1, #0x1d
	mov r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	mov r0, #0x26
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7504:
	mov r1, #0x1e
	mov r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	mov r0, #0x27
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7516:
	mov r1, #0x1f
	mov r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	mov r0, #0x28
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7528:
	mov r1, #0x20
	mov r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	mov r0, #0x29
	str r0, [r4, #0xc]
	b _021E7CF8
_021E753A:
	mov r1, #0x21
	mov r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	mov r0, #0x2a
	str r0, [r4, #0xc]
	b _021E7CF8
_021E754C:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r5, #0
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #0x2b
	str r0, [r4, #0xc]
	b _021E7CF8
_021E756A:
	bl IsPaletteFadeFinished
	cmp r0, #1
	beq _021E7574
_021E7572:
	b _021E7CF8
_021E7574:
	add r0, r4, #0
	bl ov53_021E7D58
	add r0, r4, #0
	add r1, r5, #0
	bl ov53_021E7E08
	add r0, r5, #0
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #7
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7590:
	bl ov53_021E7D58
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E7E08
	add r0, r4, #0
	add r1, r5, #0
	bl ov53_021E66A8
	ldr r0, [r4, #0x18]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #3
	add r1, r5, #0
	bl ToggleBgLayer
	mov r0, #4
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #7
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #0x2d
	str r0, [r4, #0xc]
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	b _021E7CF8
_021E75E8:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E76A0
	add r0, r4, #0
	mov r1, #0x28
	bl ov53_021E60CC
	cmp r0, #1
	bne _021E76A0
	mov r0, #0x2e
	str r0, [r4, #0xc]
	bl ov53_021E6E7C
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r4, r1]
	b _021E7CF8
_021E760C:
	mov r1, #0x17
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E76A0
	add r0, r5, #0
	mov r1, #6
	bl GF_SndStartFadeOutBGM
	mov r0, #0x2f
	str r0, [r4, #0xc]
	b _021E7CF8
_021E762A:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _021E76A0
	ldr r0, _021E7938 ; =SEQ_GS_STARTING
	add r1, r5, #0
	bl StopBGM
	ldr r0, _021E793C ; =SEQ_GS_STARTING2
	bl PlayBGM
	add r0, r4, #0
	mov r1, #1
	add r2, r5, #0
	bl ov53_021E66E8
	mov r0, #3
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #1
	add r1, r0, #0
	bl ToggleBgLayer
	add r1, r5, #0
	mov r0, #1
	add r2, r1, #0
	str r0, [sp]
	mov r0, #0x10
	sub r2, #0x10
	mov r3, #0x1a
	bl StartBrightnessTransition
	mov r0, #0x30
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7672:
	mov r0, #1
	bl IsBrightnessTransitionActive
	cmp r0, #0
	beq _021E76A0
	mov r0, #0x31
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7682:
	mov r1, #msg_0219_00006
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E76A0
	mov r0, #0x32
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7694:
	mov r1, #1
	add r2, r5, #0
	bl ov53_021E6F00
	cmp r0, #1
	beq _021E76A2
_021E76A0:
	b _021E7CF8
_021E76A2:
	mov r0, #0x33
	str r0, [r4, #0xc]
	b _021E7CF8
_021E76A8:
	mov r1, #msg_0219_00034
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E77AC
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #5
	bl Sprite_SetPalIndex
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x34
	str r0, [r4, #0xc]
	b _021E7CF8
_021E76DE:
	mov r1, #0x1e
	bl ov53_021E60CC
	cmp r0, #1
	bne _021E77AC
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	add r1, r5, #0
	mov r2, #0x10
	mov r3, #0x1b
	bl StartBrightnessTransition
	mov r0, #2
	str r0, [sp]
	mov r0, #4
	add r1, r5, #0
	mov r2, #0x10
	mov r3, #0x1d
	bl StartBrightnessTransition
	ldr r0, _021E7940 ; =SEQ_SE_DP_BOWA2
	bl PlaySE
	mov r0, #5
	add r1, r5, #0
	lsl r0, r0, #6
	str r1, [r4, r0]
	mov r0, #0x35
	str r0, [r4, #0xc]
	b _021E7CF8
_021E771C:
	mov r0, #1
	bl IsBrightnessTransitionActive
	cmp r0, #1
	bne _021E77AC
	mov r0, #2
	bl IsBrightnessTransitionActive
	cmp r0, #1
	bne _021E77AC
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #4
	bl Sprite_SetPalIndex
	mov r2, #5
	mov r1, #0x10
	lsl r2, r2, #6
	str r1, [r4, r2]
	ldr r0, _021E7944 ; =0x04000050
	ldr r2, [r4, r2]
	bl G2x_SetBlendBrightness_
	mov r0, #0x36
	str r0, [r4, #0xc]
	b _021E7CF8
_021E775E:
	add r0, #0xec
	ldr r0, [r0]
	bl Sprite_IsCellAnimationRunning
	cmp r0, #0
	bne _021E77AC
	mov r2, #5
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	mov r1, #0x10
	sub r0, r0, #1
	str r0, [r4, r2]
	ldr r0, _021E7944 ; =0x04000050
	ldr r2, [r4, r2]
	bl G2x_SetBlendBrightness_
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E77AC
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	mov r0, #SPECIES_MARILL
	add r1, r5, #0
	bl PlayCry
	mov r0, #0x37
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77A2:
	mov r1, #0x28
	bl ov53_021E60CC
	cmp r0, #1
	beq _021E77AE
_021E77AC:
	b _021E7CF8
_021E77AE:
	mov r0, #0x38
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77B4:
	mov r1, #msg_0219_00035
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x39
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77C6:
	mov r1, #0x65
	mov r2, #1
	bl ov53_021E5EDC
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x3a
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77D8:
	mov r1, #0x1e
	bl ov53_021E60CC
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x3b
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77E8:
	mov r1, #1
	add r2, r1, #0
	bl ov53_021E6F00
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x3c
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77FA:
	mov r1, #msg_0219_00036
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x3d
	str r0, [r4, #0xc]
	ldr r0, _021E7948 ; =0x00000163
	add r1, r5, #0
	strb r1, [r4, r0]
	mov r1, #2
	sub r0, r0, #2
	strb r1, [r4, r0]
	b _021E7CF8
_021E7818:
	mov r1, #msg_0219_00037
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x3e
	str r0, [r4, #0xc]
	mov r0, #6
	str r0, [sp]
	add r1, r5, #0
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #4
	add r3, r1, #0
	bl BeginNormalPaletteFade
	b _021E7CF8
_021E7842:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x3f
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7850:
	add r1, r5, #0
	bl ov53_021E7E08
	mov r0, #4
	add r1, r5, #0
	bl ToggleBgLayer
	add r0, r4, #0
	mov r1, #4
	bl ov53_021E67C4
	add r0, r4, #0
	mov r1, #2
	bl ov53_021E80B8
	ldr r0, [r4, #0x18]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #4
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #0x40
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7892:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, #0x19
	strb r1, [r4, r0]
	mov r0, #0x41
	str r0, [r4, #0xc]
	b _021E7CF8
_021E78AA:
	bl ov53_021E6CE0
	cmp r0, #0
	bne _021E78B4
_021E78B2:
	b _021E7CF8
_021E78B4:
	mov r0, #0x42
	str r0, [r4, #0xc]
	ldr r0, _021E7948 ; =0x00000163
	ldrb r1, [r4, r0]
	sub r0, #0x2f
	strh r1, [r4, r0]
	b _021E7CF8
_021E78C2:
	str r5, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x17
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	ldr r3, _021E7948 ; =0x00000163
	mov r2, #1
	ldrb r3, [r4, r3]
	ldr r0, [r4, #0x18]
	mov r1, #7
	eor r3, r2
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [r4, #0x18]
	mov r1, #6
	bl BgCommitTilemapBufferToVram
	ldr r0, [r4, #0x18]
	mov r1, #7
	bl BgCommitTilemapBufferToVram
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	mov r1, #0x4d
	lsl r1, r1, #2
	ldrh r1, [r4, r1]
	add r0, r4, #0
	bl ov53_021E80B8
	mov r0, #0x4d
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #0
	bne _021E7914
	mov r1, #msg_0219_00038
	b _021E7916
_021E7914:
	mov r1, #msg_0219_00039
_021E7916:
	add r0, #0x3c
	str r1, [r4, r0]
	mov r0, #0x43
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7920:
	mov r1, #0x17
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E79B8
	mov r0, #0x44
	str r0, [r4, #0xc]
	b _021E7CF8
	nop
_021E7938: .word SEQ_GS_STARTING
_021E793C: .word SEQ_GS_STARTING2
_021E7940: .word SEQ_SE_DP_BOWA2
_021E7944: .word 0x04000050
_021E7948: .word 0x00000163
_021E794C:
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #1
	bl ov53_021E6908
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E6824
	mov r0, #2
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x30
	add r3, r5, #0
	bl ov53_021E64C4
	mov r0, #0x45
	str r0, [r4, #0xc]
	ldr r0, _021E7C80 ; =0x00000163
	add r1, r5, #0
	strb r1, [r4, r0]
	b _021E7CF8
_021E797C:
	mov r0, #4
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #1
	bl ToggleBgLayer
	mov r1, #0x4d
	lsl r1, r1, #2
	ldrh r1, [r4, r1]
	add r0, r4, #0
	add r1, r1, #1
	bl ov53_021E6988
	sub r1, r5, #1
	cmp r0, r1
	beq _021E79B8
	add r0, r4, #0
	bl ov53_021E65B4
	mov r0, #0x46
	str r0, [r4, #0xc]
	b _021E7CF8
_021E79AC:
	ldr r0, _021E7C80 ; =0x00000163
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E79BA
	cmp r0, #1
	beq _021E79C0
_021E79B8:
	b _021E7CF8
_021E79BA:
	mov r0, #0x5d
	str r0, [r4, #0xc]
	b _021E7CF8
_021E79C0:
	mov r0, #0x47
	str r0, [r4, #0xc]
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, r5, #0
	str r0, [sp, #8]
	mov r0, #4
	add r2, r5, #0
	add r3, r5, #0
	bl BeginNormalPaletteFade
	b _021E7CF8
_021E79DE:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7A6E
	mov r0, #5
	add r1, r5, #0
	bl ToggleBgLayer
	mov r0, #6
	add r1, r5, #0
	bl ToggleBgLayer
	add r0, r4, #0
	mov r1, #3
	bl ov53_021E80B8
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E67C4
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add r2, r5, #0
	ldr r0, [r4, #0x18]
	mov r1, #4
	add r3, r2, #0
	bl ScheduleSetBgPosText
	add r0, r4, #0
	bl ov53_021E6CB0
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #4
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #0x48
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7A3C:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7A6E
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E7E08
	mov r0, #0x3d
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7A52:
	mov r1, #msg_0219_00040
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E7A6E
	mov r0, #0x5e
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7A64:
	mov r1, #0x28
	bl ov53_021E60CC
	cmp r0, #0
	bne _021E7A70
_021E7A6E:
	b _021E7CF8
_021E7A70:
	mov r0, #0x5f
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7A76:
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x18]
	bl String_SetEmpty
	mov r1, #0x4d
	lsl r1, r1, #2
	add r0, r1, #0
	ldrh r2, [r4, r1]
	sub r0, #0x14
	ldr r0, [r4, r0]
	sub r1, #0x14
	str r2, [r0, #4]
	ldr r0, _021E7C84 ; =sOverlayTemplate_NamingScreen
	ldr r1, [r4, r1]
	ldr r2, [r4]
	bl OverlayManager_New
	str r0, [r4, #0x14]
	mov r0, #0x60
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7AA4:
	add r0, r5, #0
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #1
	add r1, r0, #0
	bl ToggleBgLayer
	mov r0, #3
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #4
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #7
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #1
	bl ToggleBgLayer
	add r2, r5, #0
	ldr r0, [r4, #0x18]
	mov r1, #1
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r4, #0
	bl ov53_021E7D04
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0x61
	str r0, [r4, #0xc]
	add r0, r4, #0
	mov r1, #1
	add r2, r5, #0
	bl ov53_021E66E8
	mov r1, #0x4d
	lsl r1, r1, #2
	ldrh r1, [r4, r1]
	add r0, r4, #0
	bl ov53_021E80B8
	mov r0, #0x4d
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #0
	bne _021E7B28
	mov r1, #msg_0219_00041
	add r0, #0x3c
	str r1, [r4, r0]
	b _021E7CF8
_021E7B28:
	mov r1, #msg_0219_00042
	add r0, #0x3c
	str r1, [r4, r0]
	b _021E7CF8
_021E7B30:
	mov r1, #0x17
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E7B7A
	mov r0, #0x62
	str r0, [r4, #0xc]
	add r0, #0xfe
	add r0, r4, r0
	mov r1, #1
	bl ov53_021E6908
	b _021E7CF8
_021E7B50:
	mov r1, #0x4d
	lsl r1, r1, #2
	ldrh r1, [r4, r1]
	add r1, r1, #1
	bl ov53_021E6988
	sub r1, r5, #1
	cmp r0, r1
	beq _021E7B7A
	add r0, r4, #0
	bl ov53_021E65B4
	mov r0, #0x63
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7B6E:
	ldr r0, _021E7C80 ; =0x00000163
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E7B7C
	cmp r0, #1
	beq _021E7B82
_021E7B7A:
	b _021E7CF8
_021E7B7C:
	mov r0, #0x64
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7B82:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, r5, #0
	str r0, [sp, #8]
	mov r0, #4
	add r2, r5, #0
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #0x47
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7BA0:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, r5, #0
	str r0, [sp, #8]
	mov r0, #4
	add r2, r5, #0
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #0x65
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7BBE:
	bl IsPaletteFadeFinished
	cmp r0, #1
	beq _021E7BC8
	b _021E7CF8
_021E7BC8:
	mov r0, #6
	add r1, r5, #0
	bl ToggleBgLayer
	mov r0, #5
	add r1, r5, #0
	bl ToggleBgLayer
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E67C4
	add r0, r4, #0
	mov r1, #3
	bl ov53_021E80B8
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add r2, r5, #0
	ldr r0, [r4, #0x18]
	mov r1, #4
	add r3, r2, #0
	bl ScheduleSetBgPosText
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E7E08
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #4
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #0x66
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7C20:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7CF8
	mov r0, #0x67
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7C2E:
	mov r1, #msg_0219_00043
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E7CF8
	mov r0, #0x6e
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7C40:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r5, #0
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #0x6f
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7C5E:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7CF8
	mov r0, #0x78
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7C6C:
	mov r1, #0x4d
	lsl r1, r1, #2
	ldrh r1, [r4, r1]
	cmp r1, #0
	bne _021E7C88
	mov r1, #2
	add r2, r5, #0
	bl ov53_021E66E8
	b _021E7C90
	.balign 4, 0
_021E7C80: .word 0x00000163
_021E7C84: .word sOverlayTemplate_NamingScreen
_021E7C88:
	mov r1, #6
	add r2, r5, #0
	bl ov53_021E66E8
_021E7C90:
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0x79
	str r0, [r4, #0xc]
	mov r0, #0
	add r1, r0, #0
	bl ToggleBgLayer
	b _021E7CF8
_021E7CB4:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7CC0
	mov r0, #0x7b
	str r0, [r4, #0xc]
_021E7CC0:
	mov r0, #0x7c
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7CC6:
	add r1, r5, #0
	bl ov53_021E7E08
	add r0, r4, #0
	bl ov53_021E6DF0
	mov r0, #0x7d
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7CD8:
	mov r1, #0x1e
	bl ov53_021E60CC
	cmp r0, #1
	bne _021E7CF8
	ldr r0, _021E7D00 ; =SEQ_SE_GS_HERO_SHUKUSHOU
	bl PlaySE
	mov r0, #0x7e
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7CEE:
	bl ov53_021E6E00
	cmp r0, #1
	bne _021E7CF8
	mov r5, #1
_021E7CF8:
	add r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E7D00: .word SEQ_SE_GS_HERO_SHUKUSHOU
	thumb_func_end ov53_021E6F9C

	thumb_func_start ov53_021E7D04
ov53_021E7D04: ; 0x021E7D04
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r1, #1
	bl ov53_021E6824
	add r0, r4, #0
	mov r1, #4
	bl ov53_021E67C4
	mov r0, #2
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x30
	mov r3, #0
	bl ov53_021E64C4
	mov r1, #0
	mov r3, #0x4d
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x17
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r3, r3, #2
	ldrh r3, [r4, r3]
	mov r2, #1
	ldr r0, [r4, #0x18]
	eor r3, r2
	lsl r3, r3, #0x1c
	mov r1, #7
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [r4, #0x18]
	mov r1, #7
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov53_021E7D04

	thumb_func_start ov53_021E7D58
ov53_021E7D58: ; 0x021E7D58
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov53_021E7D58

	thumb_func_start ov53_021E7D70
ov53_021E7D70: ; 0x021E7D70
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r0, #0xa
	bl String_New
	add r6, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	add r4, r5, #0
	ldr r0, [r5, r0]
	mov r1, #0x3c
	add r2, r6, #0
	add r4, #0x6c
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x18]
	ldr r2, _021E7DD4 ; =ov53_021E8518
	add r1, r4, #0
	bl AddWindow
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E7DD8 ; =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #4
	add r2, r6, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl CopyWindowToVram
	add r0, r4, #0
	bl RemoveWindow
	add r0, r6, #0
	bl String_Delete
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E7DD4: .word ov53_021E8518
_021E7DD8: .word 0x000F0100
	thumb_func_end ov53_021E7D70

	thumb_func_start ov53_021E7DDC
ov53_021E7DDC: ; 0x021E7DDC
	push {r4, lr}
	add r4, r0, #0
	add r4, #0x6c
	ldr r0, [r0, #0x18]
	ldr r2, _021E7E04 ; =ov53_021E8518
	add r1, r4, #0
	bl AddWindow
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl CopyWindowToVram
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	nop
_021E7E04: .word ov53_021E8518
	thumb_func_end ov53_021E7DDC

	thumb_func_start ov53_021E7E08
ov53_021E7E08: ; 0x021E7E08
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r4, #0
	bne _021E7E16
	bl GF_AssertFail
_021E7E16:
	cmp r5, #3
	bhi _021E7E8E
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E7E26: ; jump table
	.short _021E7E2E - _021E7E26 - 2 ; case 0
	.short _021E7E52 - _021E7E26 - 2 ; case 1
	.short _021E7E76 - _021E7E26 - 2 ; case 2
	.short _021E7E82 - _021E7E26 - 2 ; case 3
_021E7E2E:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl Get2dSpriteVisibleFlag
	cmp r0, #1
	beq _021E7E40
	bl GF_AssertFail
_021E7E40:
	add r0, r4, #0
	bl ov53_021E7DDC
	add r4, #0xe4
	ldr r0, [r4]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, pc}
_021E7E52:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl Get2dSpriteVisibleFlag
	cmp r0, #0
	beq _021E7E64
	bl GF_AssertFail
_021E7E64:
	add r0, r4, #0
	bl ov53_021E7D70
	add r4, #0xe4
	ldr r0, [r4]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, pc}
_021E7E76:
	add r4, #0xe4
	ldr r0, [r4]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_021E7E82:
	add r4, #0xe4
	ldr r0, [r4]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_021E7E8E:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	thumb_func_end ov53_021E7E08

	thumb_func_start ov53_021E7E94
ov53_021E7E94: ; 0x021E7E94
	push {r3, lr}
	add r0, #0xe4
	ldr r0, [r0]
	bl Get2dSpriteCurrentAnimSeqNo
	cmp r0, #1
	bne _021E7EA6
	mov r0, #1
	pop {r3, pc}
_021E7EA6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov53_021E7E94

	thumb_func_start ov53_021E7EAC
ov53_021E7EAC: ; 0x021E7EAC
	push {r4, lr}
	add r4, r0, #0
	bne _021E7EB6
	bl GF_AssertFail
_021E7EB6:
	add r4, #0xe4
	ldr r0, [r4]
	bl Get2dSpriteVisibleFlag
	cmp r0, #1
	bne _021E7EC6
	mov r0, #1
	pop {r4, pc}
_021E7EC6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov53_021E7EAC

	thumb_func_start ov53_021E7ECC
ov53_021E7ECC: ; 0x021E7ECC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov53_021E7EAC
	cmp r0, #0
	beq _021E7F18
	ldr r0, _021E7F1C ; =ov53_021E8510
	bl TouchscreenHitbox_FindRectAtTouchHeld
	add r5, r0, #0
	bne _021E7EFA
	bl System_GetTouchNew
	cmp r0, #0
	beq _021E7EFA
	ldr r0, _021E7F20 ; =gSystem
	mov r1, #1
	str r1, [r0, #0x5c]
	add r0, r4, #0
	mov r1, #2
	bl ov53_021E7E08
	pop {r3, r4, r5, pc}
_021E7EFA:
	cmp r5, #0
	bne _021E7F10
	add r0, r4, #0
	bl ov53_021E7E94
	cmp r0, #0
	beq _021E7F10
	ldr r0, _021E7F20 ; =gSystem
	mov r1, #1
	str r1, [r0, #0x5c]
	pop {r3, r4, r5, pc}
_021E7F10:
	add r0, r4, #0
	mov r1, #3
	bl ov53_021E7E08
_021E7F18:
	pop {r3, r4, r5, pc}
	nop
_021E7F1C: .word ov53_021E8510
_021E7F20: .word gSystem
	thumb_func_end ov53_021E7ECC

	thumb_func_start ov53_021E7F24
ov53_021E7F24: ; 0x021E7F24
	push {r3, r4, r5, r6, lr}
	sub sp, #0x44
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	mov r0, #0x20
	mov r1, #0x50
	bl GF_CreateVramTransferManager
	mov r0, #0x50
	bl SpriteRenderer_Create
	add r1, r4, #0
	add r1, #0xd0
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl SpriteRenderer_CreateGfxHandler
	add r1, r4, #0
	add r1, #0xd4
	add r2, sp, #0x24
	ldr r5, _021E7FE0 ; =ov53_021E8764
	str r0, [r1]
	ldmia r5!, {r0, r1}
	add r3, r2, #0
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	ldr r6, _021E7FE4 ; =ov53_021E8750
	stmia r2!, {r0, r1}
	add r5, sp, #0x10
	ldmia r6!, {r0, r1}
	add r2, r5, #0
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r1, r3, #0
	str r0, [r5]
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	mov r3, #0x20
	bl sub_0200CF70
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xd0
	add r1, #0xd4
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0xa
	bl sub_0200CFF4
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl SpriteRenderer_GetG2dRendererPtr
	mov r2, #3
	mov r1, #0
	lsl r2, r2, #0x12
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r3, _021E7FE8 ; =ov53_021E8740
	add r2, sp, #0
	mov r1, #7
_021E7FC0:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _021E7FC0
	add r0, r4, #0
	add r0, #0xd0
	add r4, #0xd4
	ldr r0, [r0]
	ldr r1, [r4]
	add r2, sp, #0
	bl sub_0200D294
	add sp, #0x44
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E7FE0: .word ov53_021E8764
_021E7FE4: .word ov53_021E8750
_021E7FE8: .word ov53_021E8740
	thumb_func_end ov53_021E7F24

	thumb_func_start ov53_021E7FEC
ov53_021E7FEC: ; 0x021E7FEC
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r0, #0xd0
	add r1, #0xd4
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteRenderer_RemoveGfxHandler
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl SpriteRenderer_Delete
	bl GF_DestroyVramTransferManager
	mov r0, #0
	add r4, #0xd4
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov53_021E7FEC

	thumb_func_start ov53_021E8014
ov53_021E8014: ; 0x021E8014
	push {r3, r4, r5, r6, r7, lr}
	ldr r6, _021E80B4 ; =ov53_021E8784
	add r5, r0, #0
	mov r4, #0
	mov r7, #0x28
_021E801E:
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xd0
	add r1, #0xd4
	add r2, r4, #0
	mul r2, r7
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r6, r2
	bl SpriteRenderer_CreateSprite
	lsl r1, r4, #2
	add r1, r5, r1
	add r1, #0xd8
	str r0, [r1]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #6
	blo _021E801E
	add r0, r5, #0
	add r0, #0xd8
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0xe0
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #1
	bl Sprite_SetPriority
	add r0, r5, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r5, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #1
	bl sub_0202487C
	add r5, #0xec
	ldr r0, [r5]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E80B4: .word ov53_021E8784
	thumb_func_end ov53_021E8014

	thumb_func_start ov53_021E80B8
ov53_021E80B8: ; 0x021E80B8
	push {r3, r4, r5, lr}
	mov r2, #0
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #0
	bne _021E80C8
	mov r2, #1
	b _021E80DC
_021E80C8:
	cmp r1, #1
	bne _021E80D0
	mov r4, #1
	b _021E80DC
_021E80D0:
	cmp r1, #2
	bne _021E80DA
	mov r2, #1
	add r4, r2, #0
	b _021E80DC
_021E80DA:
	cmp r1, #3
_021E80DC:
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	add r1, r2, #0
	bl Set2dSpriteVisibleFlag
	add r5, #0xe0
	ldr r0, [r5]
	add r1, r4, #0
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, pc}
	thumb_func_end ov53_021E80B8

	thumb_func_start ov53_021E80F4
ov53_021E80F4: ; 0x021E80F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	cmp r5, #0
	bne _021E8108
	bl GF_AssertFail
_021E8108:
	ldr r0, [sp, #0x24]
	mov r1, #0x3c
	str r0, [sp, #4]
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [sp, #0x24]
	str r0, [r4]
	str r5, [r4, #0xc]
	str r6, [r4, #0x10]
	ldr r0, [sp]
	strb r7, [r4, #0x19]
	strb r0, [r4, #0x1a]
	ldr r0, [sp, #0x20]
	strb r0, [r4, #0x18]
	ldr r0, [sp, #4]
	bl MessageFormat_New
	str r0, [r4, #0x14]
	add r0, r6, #0
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #0
	bl ov53_021E82BC
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov53_021E80F4

	thumb_func_start ov53_021E814C
ov53_021E814C: ; 0x021E814C
	push {r4, lr}
	add r4, r0, #0
	bne _021E8156
	bl GF_AssertFail
_021E8156:
	add r0, r4, #0
	bl ov53_021E8310
	ldr r0, [r4, #0x14]
	bl MessageFormat_Delete
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov53_021E814C

	thumb_func_start ov53_021E816C
ov53_021E816C: ; 0x021E816C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r4, [r5]
	ldrb r6, [r5, #0x19]
	add r7, r1, #0
	mov r0, #0xef
	add r1, r4, #0
	bl NARC_New
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0
	mov r2, #4
	lsl r3, r7, #5
	str r0, [sp, #0x10]
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r2, [r5, #0xc]
	mov r1, #1
	add r3, r6, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r2, [r5, #0xc]
	mov r1, #0xa
	add r3, r6, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r5, #0xc]
	add r1, r6, #0
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	ldr r0, [r5, #0xc]
	add r1, r6, #0
	bl BgCommitTilemapBufferToVram
	add r0, r6, #0
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [sp, #0x10]
	bl NARC_Delete
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov53_021E816C

	thumb_func_start ov53_021E81F4
ov53_021E81F4: ; 0x021E81F4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	add r6, r3, #0
	add r1, #0x1c
	add r3, r4, #0
	bl ov53_021E8330
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x2c
	add r2, r6, #0
	add r3, r4, #0
	bl ov53_021E8330
	ldrb r1, [r5, #0x1b]
	mov r0, #0xf
	bic r1, r0
	strb r1, [r5, #0x1b]
	ldrb r1, [r5, #0x1b]
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strb r0, [r5, #0x1b]
	add r0, r5, #0
	bl ov53_021E8390
	ldrb r0, [r5, #0x19]
	mov r1, #1
	bl ToggleBgLayer
	ldrb r0, [r5, #0x1a]
	mov r1, #1
	bl ToggleBgLayer
	ldr r0, [r5, #0x10]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r4, r5, r6, pc}
	thumb_func_end ov53_021E81F4

	thumb_func_start ov53_021E8248
ov53_021E8248: ; 0x021E8248
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #0x1b]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	beq _021E825A
	cmp r1, #1
	beq _021E827E
	b _021E82B2
_021E825A:
	bl ov53_021E83D4
	cmp r0, #0
	beq _021E82B6
	ldrb r2, [r4, #0x1b]
	mov r1, #0xf
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1c
	lsr r1, r1, #0x1c
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0xf
	and r1, r2
	orr r0, r1
	strb r0, [r4, #0x1b]
	b _021E82B6
_021E827E:
	bl ov53_021E84D4
	cmp r0, #0
	beq _021E82B6
	ldrb r0, [r4, #0x1b]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	bne _021E8292
	bl GF_AssertFail
_021E8292:
	ldrb r0, [r4, #0x19]
	mov r1, #0
	bl ToggleBgLayer
	ldrb r0, [r4, #0x1a]
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldrb r0, [r4, #0x1b]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	pop {r4, pc}
_021E82B2:
	bl GF_AssertFail
_021E82B6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov53_021E8248

	thumb_func_start ov53_021E82BC
ov53_021E82BC: ; 0x021E82BC
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	bne _021E82C8
	bl GF_AssertFail
_021E82C8:
	mov r0, #8
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldrb r0, [r4, #0x18]
	add r1, r4, #0
	add r1, #0x1c
	str r0, [sp, #0xc]
	mov r0, #0x50
	str r0, [sp, #0x10]
	ldrb r2, [r4, #0x1a]
	ldr r0, [r4, #0xc]
	mov r3, #4
	bl AddWindowParameterized
	mov r0, #0xe
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldrb r0, [r4, #0x18]
	add r1, r4, #0
	add r1, #0x2c
	str r0, [sp, #0xc]
	mov r0, #0x80
	str r0, [sp, #0x10]
	ldrb r2, [r4, #0x1a]
	ldr r0, [r4, #0xc]
	mov r3, #4
	bl AddWindowParameterized
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov53_021E82BC

	thumb_func_start ov53_021E8310
ov53_021E8310: ; 0x021E8310
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bne _021E831A
	bl GF_AssertFail
_021E831A:
	mov r4, #0
	add r5, #0x1c
_021E831E:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #2
	blt _021E831E
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov53_021E8310

	thumb_func_start ov53_021E8330
ov53_021E8330: ; 0x021E8330
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r2, #0
	add r2, r3, #0
	add r4, r1, #0
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	ldr r0, [r5, #0x14]
	ldr r3, [r5]
	add r1, r7, #0
	add r2, r6, #0
	bl ReadMsgData_ExpandPlaceholders
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E838C ; =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #4
	add r2, r5, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl CopyWindowToVram
	add r0, r7, #0
	bl DestroyMsgData
	add r0, r5, #0
	bl String_Delete
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E838C: .word 0x000F0100
	thumb_func_end ov53_021E8330

	thumb_func_start ov53_021E8390
ov53_021E8390: ; 0x021E8390
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _021E839E
	bl GF_AssertFail
_021E839E:
	ldrb r0, [r5, #0x1b]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #1
	beq _021E83AE
	cmp r0, #2
	beq _021E83B2
	b _021E83B6
_021E83AE:
	mov r4, #0
	b _021E83BA
_021E83B2:
	mov r4, #1
	b _021E83BA
_021E83B6:
	bl GF_AssertFail
_021E83BA:
	ldr r1, _021E83CC ; =ov53_021E8874
	lsl r3, r4, #2
	ldr r2, _021E83D0 ; =ov53_021E8874 + 2
	ldrsh r1, [r1, r3]
	ldrsh r2, [r2, r3]
	ldr r0, [r5, #0x10]
	bl Sprite_SetPositionXY
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E83CC: .word ov53_021E8874
_021E83D0: .word ov53_021E8874 + 2
	thumb_func_end ov53_021E8390

	thumb_func_start ov53_021E83D4
ov53_021E83D4: ; 0x021E83D4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021E84C8 ; =ov53_021E887C
	mov r4, #0
	bl TouchscreenHitbox_FindRectAtTouchNew
	add r6, r0, #0
	sub r0, r4, #1
	cmp r6, r0
	beq _021E841E
	ldr r0, _021E84CC ; =SEQ_SE_DP_SELECT
	bl PlaySE
	cmp r6, #0
	beq _021E83F8
	cmp r6, #1
	beq _021E8408
	b _021E8418
_021E83F8:
	ldrb r1, [r5, #0x1b]
	mov r0, #0xf0
	mov r4, #1
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strb r0, [r5, #0x1b]
	b _021E84AA
_021E8408:
	ldrb r1, [r5, #0x1b]
	mov r0, #0xf0
	mov r4, #1
	bic r1, r0
	mov r0, #0x20
	orr r0, r1
	strb r0, [r5, #0x1b]
	b _021E84AA
_021E8418:
	bl GF_AssertFail
	b _021E84AA
_021E841E:
	ldr r0, _021E84D0 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _021E844A
	ldrb r1, [r5, #0x1b]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #1
	beq _021E84AA
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strb r0, [r5, #0x1b]
	add r0, r5, #0
	bl ov53_021E8390
	ldr r0, _021E84CC ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _021E84AA
_021E844A:
	mov r1, #0x80
	tst r1, r0
	beq _021E8472
	ldrb r1, [r5, #0x1b]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #2
	beq _021E84AA
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x20
	orr r0, r1
	strb r0, [r5, #0x1b]
	add r0, r5, #0
	bl ov53_021E8390
	ldr r0, _021E84CC ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _021E84AA
_021E8472:
	mov r2, #1
	add r1, r0, #0
	tst r1, r2
	beq _021E8496
	ldrb r0, [r5, #0x1b]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	bne _021E8492
	bl GF_AssertFail
	ldrb r1, [r5, #0x1b]
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x20
	orr r0, r1
	strb r0, [r5, #0x1b]
_021E8492:
	mov r4, #1
	b _021E84AA
_021E8496:
	mov r1, #2
	tst r0, r1
	beq _021E84AA
	ldrb r1, [r5, #0x1b]
	mov r0, #0xf0
	add r4, r2, #0
	bic r1, r0
	mov r0, #0x20
	orr r0, r1
	strb r0, [r5, #0x1b]
_021E84AA:
	cmp r4, #0
	beq _021E84C2
	add r0, r5, #0
	bl ov53_021E8390
	ldr r0, [r5, #0x10]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	ldr r0, _021E84CC ; =SEQ_SE_DP_SELECT
	bl PlaySE
_021E84C2:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_021E84C8: .word ov53_021E887C
_021E84CC: .word SEQ_SE_DP_SELECT
_021E84D0: .word gSystem
	thumb_func_end ov53_021E83D4

	thumb_func_start ov53_021E84D4
ov53_021E84D4: ; 0x021E84D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl Get2dSpriteCurrentAnimSeqNo
	cmp r0, #3
	beq _021E84E6
	bl GF_AssertFail
_021E84E6:
	ldr r0, [r4, #0x10]
	bl Sprite_IsCellAnimationRunning
	cmp r0, #0
	bne _021E84F4
	mov r0, #1
	pop {r4, pc}
_021E84F4:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov53_021E84D4

	.rodata

	.global ov53_021E84F8
ov53_021E84F8:
	.word 4, 4
	.size ov53_021E84F8,.-ov53_021E84F8

	.global ov53_021E8500
ov53_021E8500: ; 0x021E8500
	.byte 0x00, 0x02, 0x13, 0x1B, 0x04, 0x06
	.short 0x036D
	.size ov53_021E8500,.-ov53_021E8500

	.global ov53_021E8508
ov53_021E8508: ; 0x021E8508
	.word 0x0000000C
	.word 0x0000000E
	.size ov53_021E8508,.-ov53_021E8508

	.global ov53_021E8510
ov53_021E8510: ; 0x021E8510
	.byte 0x90, 0xBF, 0xA8, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00
	.size ov53_021E8510,.-ov53_021E8510

	.global ov53_021E8518
ov53_021E8518: ; 0x021E8518
	.byte 0x04, 0x18, 0x14, 0x07, 0x02, 0x0E
	.short 0x0A3
	.size ov53_021E8518,.-ov53_021E8518

	.global ov53_021E8520
ov53_021E8520:
	.byte 0x00, 0x04, 0x00, 0x18, 0x18, 0x05
	.short 0x012D

	.byte 0x00, 0x04, 0x00, 0x18, 0x18, 0x05
	.short 0x012D
	.size ov53_021E8520,.-ov53_021E8520

	.global ov53_021E8530
ov53_021E8530: ; 0x021E8530
	.byte 0x19, 0xAD, 0x12, 0x6F
	.byte 0x19, 0xAD, 0x90, 0xEF
	.byte 0xFF, 0x00, 0x00, 0x00
	.size ov53_021E8530,.-ov53_021E8530

	.global ov53_021E853C
ov53_021E853C: ; 0x021E853C
	.short 0x0000, 0xFFCC, 0xFFFE
	.short 0xFFCC, 0x0000, 0x0002
	.size ov53_021E853C,.-ov53_021E853C

	.global ov53_021E8548
ov53_021E8548: ; 0x021E8548
	.word 1
	.word 0
	.word 0
	.word 0
	.size ov53_021E8548,.-ov53_021E8548

	.global ov53_021E8558
ov53_021E8558: ; 0x021E8558
	.word 0x2C
	.word 0x2B
	.word 0x2B
	.word 0x2D
	.word 0x33
	.size ov53_021E8558,.-ov53_021E8558

	.global ov53_021E856C
ov53_021E856C: ; 0x021E856C
	.word 0x00000003
	.word 0x00000004
	.word 0x00000005
	.word 0x00000006
	.word 0x00000007
	.word 0x00000008
	.size ov53_021E856C,.-ov53_021E856C

	.global ov53_021E8584
ov53_021E8584: ; 0x021E8584
	.word 0x2F, 0x25
	.word 0x30, 0x25
	.word 0x2E, 0x25
	.size ov53_021E8584,.-ov53_021E8584

	.global ov53_021E859C
ov53_021E859C: ; 0x021E859C
	.word 0x0C
	.word 0x16
	.word 0x17
	.word 0x18
	.word 0x19
	.word 0xFF
	.size ov53_021E859C,.-ov53_021E859C

	.global ov53_021E85B4
ov53_021E85B4: ; 0x021E85B4
	.word 0x11
	.word 0x1A
	.word 0x1B
	.word 0x1C
	.word 0x1D
	.word 0xFF
	.size ov53_021E85B4,.-ov53_021E85B4

	.global ov53_021E85CC
ov53_021E85CC: ; 0x021E85CC
	.word 0, 0, 0x800, 0
	.byte 1, 0, 0, 0, 0, 1, 0, 0
	.word 0
	.size ov53_021E85CC,.-ov53_021E85CC

	.global ov53_021E85E8
ov53_021E85E8: ; 0x021E85E8
	.word 0, 0, 0x800, 0
	.byte 1, 0, 0, 0, 0, 0, 0, 0
	.word 0
	.size ov53_021E85E8,.-ov53_021E85E8

	.global ov53_021E8604
ov53_021E8604: ; 0x021E8604
	.word 0, 0x1C7, 0x018F
	.word 0, 0x1AF, 0x0000
	.word 0, 0x1AF, 0x0000
	.size ov53_021E8604,.-ov53_021E8604

	.global ov53_021E8628
ov53_021E8628: ; 0x021E8628
	.word 0x00000001, 0x00000000
	.word 0x00000004, 0x00000000, 0x00000002, 0x00000000
	.word 0x00000100, 0x00000000, 0x00000000, 0x00000000
	.size ov53_021E8628,.-ov53_021E8628

	.global ov53_021E8650
ov53_021E8650: ; 0x021E8650
	.byte 0x14, 0x32, 0x32, 0xD5
	.byte 0x4C, 0x6A, 0x32, 0xD5
	.byte 0x84, 0xA2, 0x32, 0xD5
	.byte 0xFF, 0x00, 0x00, 0x00

	.byte 0x1A, 0x53, 0x8A, 0xFD
	.byte 0x6C, 0xA4, 0x8A, 0xFD
	.byte 0xFF, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.byte 0x1A, 0x53, 0x0A, 0x7D
	.byte 0x6C, 0xA4, 0x0A, 0x7D
	.byte 0xFF, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.size ov53_021E8650,.-ov53_021E8650

	.global ov53_021E8680
ov53_021E8680: ; 0x021E8680
	.byte 0x04, 0x02, 0x06, 0x0D, 0x03, 0x0E
	.short 0x0001
	.byte 0x04, 0x02, 0x10, 0x0D, 0x03, 0x0E
	.short 0x0036
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.short 0x0000

	.byte 0x04, 0x07, 0x03, 0x12, 0x03, 0x0E
	.short 0x0001
	.byte 0x04, 0x07, 0x0A, 0x12, 0x03, 0x0E
	.short 0x37
	.byte 0x04, 0x07, 0x11, 0x12, 0x03, 0x0E
	.short 0x006D
	.size ov53_021E8680,.-ov53_021E8680

	.global ov53_021E86B0
ov53_021E86B0: ; 0x021E86B0
	.word 0x00000031, 0x00000003, 0x00000000, 0x00000000
	.word 0x00000032, 0x00000002, 0x00000000, 0x00000000
	.word 0x00000032, 0x00000002, 0x00000000, 0x00000000
	.word 0x00000034, 0x00000002, 0x00000000, 0x00000000
	.size ov53_021E86B0,.-ov53_021E86B0

	.global ov53_021E86F0
ov53_021E86F0: ; 0x021E86F0
	.word 0x00000000, 0x00000000
	.word 0x0000000A, 0x0000000B
	.word 0x0000000C, 0x00000010
	.word 0x0000000D, 0x00000010
	.word 0x0000000E, 0x00000010
	.word 0x0000000F, 0x00000010
	.word 0x00000011, 0x00000015
	.word 0x00000012, 0x00000015
	.word 0x00000013, 0x00000015
	.word 0x00000014, 0x00000015
	.size ov53_021E86F0,.-ov53_021E86F0

	; file boundary

	.global ov53_021E8740
ov53_021E8740: ; 0x021E8740
	.short 0x001A  // NARC_resdat_resdat_00000026
	.short 0x001B  // NARC_resdat_resdat_00000027
	.short 0x0019  // NARC_resdat_resdat_00000025
	.short 0x0018  // NARC_resdat_resdat_00000024
	.short 0xFFFF
	.short 0xFFFF
	.short 0x004E  // NARC_resdat_resdat_00000078
	.balign 4, 0
	.size ov53_021E8740,.-ov53_021E8740

	.global ov53_021E8750
ov53_021E8750: ; 0x021E8750
	.word 0x0000000A
	.word 0x00000400
	.word 0x00000400
	.word 0x00000010
	.word 0x00000010
	.size ov53_021E8750,.-ov53_021E8750

	.global ov53_021E8764
ov53_021E8764: ; 0x021E8764
	.word 0x00000000
	.word 0x00000080
	.word 0x00000000
	.word 0x00000020
	.word 0x00000000
	.word 0x00000080
	.word 0x00000000
	.word 0x00000020
	.size ov53_021E8764,.-ov53_021E8764

	.global ov53_021E8784
ov53_021E8784: ; 0x021E8784
	.word 0x00000000
	.short 0x0080, 0x0032, 0x0000, 0x0000
	.word 0x00000002, 0x00000001, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.word 0x00000001
	.short 0x0040, 0x0068, 0x0000, 0x0000
	.word 0x00000000, 0x00000000, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.word 0x00000002
	.short 0x00C0, 0x0068, 0x0000, 0x0000
	.word 0x00000001, 0x00000001, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.word 0x00000003
	.short 0x0100, 0x00C0, 0x0000, 0x0000
	.word 0x00000000, 0x00000003, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.word 0x00000004
	.short 0x0000, 0x0000, 0x0000, 0x0001
	.word 0x00000000, 0x00000004, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000

	.word 0x00000005
	.short 0x00A0, 0x0050, 0x0000, 0x0000
	.word 0x00000000, 0x00000004, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000
	.size ov53_021E8784,.-ov53_021E8784

	; file boundary

	.global ov53_021E8874
ov53_021E8874: ; 0x021E8874
	.short 0x0080, 0x0048
	.short 0x0080, 0x0078
	.size ov53_021E8874,.-ov53_021E8874

	.global ov53_021E887C
ov53_021E887C: ; 0x021E887C
	.byte 0x32, 0x5C, 0x03, 0xFB
	.byte 0x63, 0x8C, 0x03, 0xFB
	.byte 0xFF, 0x00, 0x00, 0x00
	.size ov53_021E887C,.-ov53_021E887C
	; 0x021E8888
