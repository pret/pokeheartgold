#include "constants/pokemon.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "overlay_12_battle_system.inc"
	.include "global.inc"

	.text

	thumb_func_start ov12_0223B718
ov12_0223B718: ; 0x0223B718
	push {r3, lr}
	ldr r2, [r0, #0x2c]
	mov r1, #4
	tst r1, r2
	beq _0223B730
	ldr r1, _0223B73C ; =0x0000240C
	ldr r2, [r0, r1]
	mov r1, #0x10
	tst r1, r2
	bne _0223B730
	mov r0, #1
	pop {r3, pc}
_0223B730:
	mov r1, #0x6d
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl Options_GetTextFrameDelay
	pop {r3, pc}
	.balign 4, 0
_0223B73C: .word 0x0000240C
	thumb_func_end ov12_0223B718

	thumb_func_start ov12_0223B740
ov12_0223B740: ; 0x0223B740
	mov r1, #0x6d
	lsl r1, r1, #2
	ldr r3, _0223B74C ; =Options_GetBattleStyle
	ldr r0, [r0, r1]
	bx r3
	nop
_0223B74C: .word Options_GetBattleStyle
	thumb_func_end ov12_0223B740

	thumb_func_start ov12_0223B750
ov12_0223B750: ; 0x0223B750
	mov r1, #0x72
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov12_0223B750

	thumb_func_start BattleSystem_GetChatotVoice
BattleSystem_GetChatotVoice: ; 0x0223B758
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x2c]
	mov r3, #8
	add r4, r1, #0
	tst r3, r2
	bne _0223B776
	mov r3, #0x10
	tst r2, r3
	beq _0223B77E
	bl ov12_0223AB0C
	mov r1, #1
	tst r0, r1
	beq _0223B77E
_0223B776:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x78]
	pop {r3, r4, r5, pc}
_0223B77E:
	ldr r1, [r5, #0x2c]
	mov r0, #2
	tst r0, r1
	beq _0223B790
	lsl r0, r4, #0x1f
	lsr r0, r0, #0x1d
	add r0, r5, r0
	ldr r0, [r0, #0x78]
	pop {r3, r4, r5, pc}
_0223B790:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x78]
	pop {r3, r4, r5, pc}
	thumb_func_end BattleSystem_GetChatotVoice

	thumb_func_start ov12_0223B798
ov12_0223B798: ; 0x0223B798
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r1, #0xa9
	ldr r2, [r5, #0x2c]
	lsl r1, r1, #2
	tst r1, r2
	bne _0223B84E
	mov r4, #0
	add r1, r4, #0
	bl BattleSystem_GetPartySize
	cmp r0, #0
	ble _0223B84E
	add r7, r4, #0
_0223B7B4:
	add r0, r5, #0
	mov r1, #0
	add r2, r4, #0
	bl BattleSystem_GetPartyMon
	mov r1, #0xae
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0x67
	lsl r0, r0, #2
	cmp r1, r0
	bne _0223B840
	add r0, r4, #0
	bl MaskOfFlagNo
	ldr r1, _0223B850 ; =0x00002418
	ldrb r1, [r5, r1]
	tst r0, r1
	beq _0223B840
	add r0, r5, #0
	bl BattleSystem_GetTerrainId
	cmp r0, #0x17
	bhi _0223B828
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223B7F8: ; jump table
	.short _0223B82C - _0223B7F8 - 2 ; case 0
	.short _0223B82C - _0223B7F8 - 2 ; case 1
	.short _0223B828 - _0223B7F8 - 2 ; case 2
	.short _0223B828 - _0223B7F8 - 2 ; case 3
	.short _0223B82C - _0223B7F8 - 2 ; case 4
	.short _0223B82C - _0223B7F8 - 2 ; case 5
	.short _0223B828 - _0223B7F8 - 2 ; case 6
	.short _0223B828 - _0223B7F8 - 2 ; case 7
	.short _0223B828 - _0223B7F8 - 2 ; case 8
	.short _0223B832 - _0223B7F8 - 2 ; case 9
	.short _0223B828 - _0223B7F8 - 2 ; case 10
	.short _0223B832 - _0223B7F8 - 2 ; case 11
	.short _0223B832 - _0223B7F8 - 2 ; case 12
	.short _0223B832 - _0223B7F8 - 2 ; case 13
	.short _0223B832 - _0223B7F8 - 2 ; case 14
	.short _0223B832 - _0223B7F8 - 2 ; case 15
	.short _0223B832 - _0223B7F8 - 2 ; case 16
	.short _0223B82C - _0223B7F8 - 2 ; case 17
	.short _0223B832 - _0223B7F8 - 2 ; case 18
	.short _0223B832 - _0223B7F8 - 2 ; case 19
	.short _0223B832 - _0223B7F8 - 2 ; case 20
	.short _0223B832 - _0223B7F8 - 2 ; case 21
	.short _0223B832 - _0223B7F8 - 2 ; case 22
	.short _0223B82C - _0223B7F8 - 2 ; case 23
_0223B828:
	str r7, [sp]
	b _0223B836
_0223B82C:
	mov r0, #1
	str r0, [sp]
	b _0223B836
_0223B832:
	mov r0, #2
	str r0, [sp]
_0223B836:
	add r0, r6, #0
	mov r1, #0x70
	add r2, sp, #0
	bl SetMonData
_0223B840:
	add r0, r5, #0
	mov r1, #0
	add r4, r4, #1
	bl BattleSystem_GetPartySize
	cmp r4, r0
	blt _0223B7B4
_0223B84E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223B850: .word 0x00002418
	thumb_func_end ov12_0223B798

	thumb_func_start ov12_0223B854
ov12_0223B854: ; 0x0223B854
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r4, r1, #0
	bl MaskOfFlagNo
	ldr r1, _0223B86C ; =0x00002418
	add r2, r5, r1
	ldrb r1, [r2, r4]
	orr r0, r1
	strb r0, [r2, r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223B86C: .word 0x00002418
	thumb_func_end ov12_0223B854

	thumb_func_start ov12_0223B870
ov12_0223B870: ; 0x0223B870
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0223B870

	thumb_func_start ov12_0223B874
ov12_0223B874: ; 0x0223B874
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	mov r1, #1
	add r4, r0, #0
	mov r0, #5
	lsl r1, r1, #0x10
	bl AllocFromHeap
	mov r1, #0x22
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #5
	sub r1, #0x20
	bl AllocFromHeap
	mov r1, #0x89
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, r1, #4
	mov r2, #1
	ldr r0, _0223BACC ; =0x06010000
	ldr r1, [r4, r1]
	lsl r2, r2, #0x10
	bl MIi_CpuCopy32
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r5, [r4, r0]
	ldr r0, [r4, #0x28]
	mov r1, #0
	bl PaletteData_GetUnfadedBuf
	mov r2, #2
	add r1, r5, #0
	lsl r2, r2, #8
	bl MIi_CpuCopy32
	mov r0, #0x19
	lsl r0, r0, #0x16
	str r0, [sp, #0x24]
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl sub_02024B1C
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x24]
	add r0, r0, r1
	str r0, [sp, #0x24]
	mov r0, #0x14
	str r0, [sp, #0x28]
	lsl r0, r0, #0xb
	str r0, [sp, #0xc]
_0223B8E0:
	mov r0, #0x10
	mov ip, r0
	lsl r0, r0, #6
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	mov r7, #1
	sub r0, #0x14
	lsl r1, r0, #8
	ldr r0, [sp, #0x24]
	add r0, r0, r1
	str r0, [sp, #0x10]
_0223B8F6:
	mov r0, ip
	sub r0, #0x10
	ldr r1, [sp, #0x10]
	lsl r3, r0, #5
	add r3, r1, r3
	ldr r5, [sp, #0xc]
	ldr r1, [sp, #0x14]
	mov r2, #0
	add r6, r5, r1
_0223B908:
	cmp r0, #8
	bge _0223B930
	add r1, r2, #0
	tst r1, r7
	beq _0223B922
	lsr r1, r2, #0x1f
	add r1, r2, r1
	asr r1, r1, #1
	ldrb r5, [r3, r1]
	mov r1, #0xf0
	and r1, r5
	asr r1, r1, #4
	b _0223B95E
_0223B922:
	lsr r1, r2, #0x1f
	add r1, r2, r1
	asr r1, r1, #1
	ldrb r5, [r3, r1]
	mov r1, #0xf
	and r1, r5
	b _0223B95E
_0223B930:
	mov r1, #1
	tst r1, r2
	beq _0223B94C
	lsr r1, r2, #0x1f
	add r1, r2, r1
	asr r1, r1, #1
	add r5, r3, r1
	mov r1, #7
	lsl r1, r1, #8
	ldrb r5, [r5, r1]
	mov r1, #0xf0
	and r1, r5
	asr r1, r1, #4
	b _0223B95E
_0223B94C:
	lsr r1, r2, #0x1f
	add r1, r2, r1
	asr r1, r1, #1
	add r5, r3, r1
	mov r1, #7
	lsl r1, r1, #8
	ldrb r5, [r5, r1]
	mov r1, #0xf
	and r1, r5
_0223B95E:
	cmp r1, #0
	beq _0223B96E
	mov r5, #0x22
	lsl r5, r5, #4
	ldr r5, [r4, r5]
	add r1, #0x70
	add r5, r6, r5
	strb r1, [r2, r5]
_0223B96E:
	add r2, r2, #1
	cmp r2, #0x40
	blt _0223B908
	ldr r0, [sp, #0x14]
	add r0, #0x40
	str r0, [sp, #0x14]
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	cmp r0, #0x20
	blt _0223B8F6
	mov r1, #2
	ldr r0, [sp, #0xc]
	lsl r1, r1, #0xa
	add r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #0x1c
	blt _0223B8E0
	mov r0, #0x19
	lsl r0, r0, #0x16
	str r0, [sp, #8]
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl sub_02024B1C
	ldr r1, [r0, #4]
	ldr r0, [sp, #8]
	mov r7, #0x26
	add r0, r0, r1
	str r0, [sp, #8]
	mov r3, #0
	mov r0, #0xf
	mov r1, #0xf0
	lsl r7, r7, #0xa
	mov r2, #1
_0223B9BE:
	add r5, r3, #0
	tst r5, r2
	beq _0223B9D4
	lsr r5, r3, #0x1f
	add r5, r3, r5
	asr r6, r5, #1
	ldr r5, [sp, #8]
	ldrb r5, [r5, r6]
	and r5, r1
	asr r5, r5, #4
	b _0223B9E0
_0223B9D4:
	lsr r5, r3, #0x1f
	add r5, r3, r5
	asr r6, r5, #1
	ldr r5, [sp, #8]
	ldrb r5, [r5, r6]
	and r5, r0
_0223B9E0:
	cmp r5, #0
	beq _0223B9F0
	mov r6, #0x22
	lsl r6, r6, #4
	ldr r6, [r4, r6]
	add r5, #0x70
	add r6, r6, r3
	strb r5, [r6, r7]
_0223B9F0:
	mov r5, #2
	add r3, r3, #1
	lsl r5, r5, #0xa
	cmp r3, r5
	blt _0223B9BE
	mov r0, #0x1c
	str r0, [sp, #4]
	lsl r0, r0, #0xb
	str r0, [sp, #0x18]
_0223BA02:
	ldr r0, [sp, #4]
	mov r2, #0
	sub r0, #0x1c
	lsl r1, r0, #8
	ldr r0, [sp, #8]
	str r2, [sp, #0x20]
	add r0, r0, r1
	str r0, [sp, #0x1c]
	mov r7, #1
_0223BA14:
	asr r0, r2, #2
	lsr r0, r0, #0x1d
	add r0, r2, r0
	asr r0, r0, #3
	lsl r1, r0, #0xa
	ldr r0, [sp, #0x1c]
	lsr r5, r2, #0x1f
	add r6, r0, r1
	lsl r1, r2, #0x1d
	sub r1, r1, r5
	mov r0, #0x1d
	ror r1, r0
	add r0, r5, r1
	lsl r0, r0, #5
	ldr r5, [sp, #0x18]
	ldr r1, [sp, #0x20]
	mov r3, #0
	add r0, r6, r0
	add r1, r5, r1
_0223BA3A:
	add r5, r3, #0
	tst r5, r7
	beq _0223BA56
	lsr r5, r3, #0x1f
	add r5, r3, r5
	asr r5, r5, #1
	add r6, r0, r5
	mov r5, #1
	lsl r5, r5, #0xa
	ldrb r6, [r6, r5]
	mov r5, #0xf0
	and r5, r6
	asr r5, r5, #4
	b _0223BA68
_0223BA56:
	lsr r5, r3, #0x1f
	add r5, r3, r5
	asr r5, r5, #1
	add r6, r0, r5
	mov r5, #1
	lsl r5, r5, #0xa
	ldrb r6, [r6, r5]
	mov r5, #0xf
	and r5, r6
_0223BA68:
	cmp r5, #0
	beq _0223BA78
	mov r6, #0x22
	lsl r6, r6, #4
	ldr r6, [r4, r6]
	add r5, #0x70
	add r6, r1, r6
	strb r5, [r3, r6]
_0223BA78:
	add r3, r3, #1
	cmp r3, #0x40
	blt _0223BA3A
	ldr r0, [sp, #0x20]
	add r2, r2, #1
	add r0, #0x40
	str r0, [sp, #0x20]
	cmp r2, #0x18
	blt _0223BA14
	mov r3, #2
	ldr r0, [sp, #0x18]
	lsl r3, r3, #0xa
	add r0, r0, r3
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #0x20
	blt _0223BA02
	mov r0, #0
	mov r2, #0x22
	str r0, [sp]
	lsl r2, r2, #4
	ldr r0, [r4, #4]
	ldr r2, [r4, r2]
	mov r1, #3
	lsl r3, r3, #5
	bl BG_LoadCharTilesData
	mov r0, #0x5f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov12_02266008
	mov r0, #0x63
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov12_02266008
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_0223BACC: .word 0x06010000
	thumb_func_end ov12_0223B874

	thumb_func_start ov12_0223BAD0
ov12_0223BAD0: ; 0x0223BAD0
	mov r1, #0x22
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov12_0223BAD0

	thumb_func_start ov12_0223BAD8
ov12_0223BAD8: ; 0x0223BAD8
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov12_0223BAD8

	thumb_func_start ov12_0223BAE0
ov12_0223BAE0: ; 0x0223BAE0
	ldr r1, _0223BAE8 ; =0x00002228
	add r0, r0, r1
	bx lr
	nop
_0223BAE8: .word 0x00002228
	thumb_func_end ov12_0223BAE0

	thumb_func_start ov12_0223BAEC
ov12_0223BAEC: ; 0x0223BAEC
	ldr r1, _0223BAF4 ; =0x00002308
	add r0, r0, r1
	bx lr
	nop
_0223BAF4: .word 0x00002308
	thumb_func_end ov12_0223BAEC

	thumb_func_start BattleSystem_GetWeather
BattleSystem_GetWeather: ; 0x0223BAF8
	ldr r1, _0223BB00 ; =0x0000242C
	ldr r0, [r0, r1]
	bx lr
	nop
_0223BB00: .word 0x0000242C
	thumb_func_end BattleSystem_GetWeather

	thumb_func_start ov12_0223BB04
ov12_0223BB04: ; 0x0223BB04
	ldr r1, _0223BB0C ; =0x00002421
	ldrb r0, [r0, r1]
	bx lr
	nop
_0223BB0C: .word 0x00002421
	thumb_func_end ov12_0223BB04

	thumb_func_start ov12_0223BB10
ov12_0223BB10: ; 0x0223BB10
	ldr r2, _0223BB18 ; =0x00002421
	strb r1, [r0, r2]
	bx lr
	nop
_0223BB18: .word 0x00002421
	thumb_func_end ov12_0223BB10

	thumb_func_start ov12_0223BB1C
ov12_0223BB1C: ; 0x0223BB1C
	ldr r1, _0223BB24 ; =0x00002430
	ldr r0, [r0, r1]
	bx lr
	nop
_0223BB24: .word 0x00002430
	thumb_func_end ov12_0223BB1C

	thumb_func_start ov12_0223BB28
ov12_0223BB28: ; 0x0223BB28
	push {r3, lr}
	ldr r2, _0223BB40 ; =0x0000240C
	ldr r3, [r0, r2]
	mov r2, #0x10
	tst r2, r3
	bne _0223BB3E
	mov r2, #0x87
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	bl GameStats_Inc
_0223BB3E:
	pop {r3, pc}
	.balign 4, 0
_0223BB40: .word 0x0000240C
	thumb_func_end ov12_0223BB28

	thumb_func_start ov12_0223BB44
ov12_0223BB44: ; 0x0223BB44
	push {r3, lr}
	ldr r1, _0223BB60 ; =0x0000240C
	ldr r2, [r0, r1]
	mov r1, #0x10
	tst r1, r2
	bne _0223BB5C
	mov r1, #0x87
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0x15
	bl GameStats_AddSpecial
_0223BB5C:
	pop {r3, pc}
	nop
_0223BB60: .word 0x0000240C
	thumb_func_end ov12_0223BB44

	thumb_func_start ov12_0223BB64
ov12_0223BB64: ; 0x0223BB64
	mov r2, #0x91
	lsl r2, r2, #6
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov12_0223BB64

	thumb_func_start ov12_0223BB6C
ov12_0223BB6C: ; 0x0223BB6C
	ldr r2, _0223BB74 ; =0x00002444
	strb r1, [r0, r2]
	bx lr
	nop
_0223BB74: .word 0x00002444
	thumb_func_end ov12_0223BB6C

	thumb_func_start ov12_0223BB78
ov12_0223BB78: ; 0x0223BB78
	mov r1, #0x6f
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov12_0223BB78

	thumb_func_start ov12_0223BB80
ov12_0223BB80: ; 0x0223BB80
	mov r2, #0x6f
	lsl r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov12_0223BB80

	thumb_func_start ov12_0223BB88
ov12_0223BB88: ; 0x0223BB88
	mov r2, #0x1d
	lsl r2, r2, #4
	add r2, r0, r2
	lsl r0, r1, #4
	add r0, r2, r0
	bx lr
	thumb_func_end ov12_0223BB88

	thumb_func_start ov12_0223BB94
ov12_0223BB94: ; 0x0223BB94
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #4
	blt _0223BBA2
	bl GF_AssertFail
_0223BBA2:
	lsl r0, r5, #4
	ldr r0, [r4, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223BB94

	thumb_func_start ov12_0223BBA8
ov12_0223BBA8: ; 0x0223BBA8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #4
	blt _0223BBB8
	bl GF_AssertFail
_0223BBB8:
	lsl r0, r4, #4
	add r0, r5, r0
	str r6, [r0, #4]
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0223BBA8

	thumb_func_start ov12_0223BBC0
ov12_0223BBC0: ; 0x0223BBC0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #4
	blt _0223BBD0
	bl GF_AssertFail
_0223BBD0:
	lsl r0, r4, #4
	add r0, r5, r0
	str r6, [r0, #8]
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0223BBC0

	thumb_func_start ov12_0223BBD8
ov12_0223BBD8: ; 0x0223BBD8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #4
	blt _0223BBE8
	bl GF_AssertFail
_0223BBE8:
	lsl r0, r4, #4
	add r0, r5, r0
	str r6, [r0, #0xc]
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0223BBD8

	thumb_func_start ov12_0223BBF0
ov12_0223BBF0: ; 0x0223BBF0
	ldr r2, _0223BBF8 ; =0x000023FD
	strb r1, [r0, r2]
	bx lr
	nop
_0223BBF8: .word 0x000023FD
	thumb_func_end ov12_0223BBF0

	thumb_func_start ov12_0223BBFC
ov12_0223BBFC: ; 0x0223BBFC
	ldr r2, _0223BC04 ; =0x000023F4
	str r1, [r0, r2]
	bx lr
	nop
_0223BC04: .word 0x000023F4
	thumb_func_end ov12_0223BBFC

	thumb_func_start ov12_0223BC08
ov12_0223BC08: ; 0x0223BC08
	ldr r2, _0223BC10 ; =0x000023F8
	str r1, [r0, r2]
	bx lr
	nop
_0223BC10: .word 0x000023F8
	thumb_func_end ov12_0223BC08

	thumb_func_start ov12_0223BC14
ov12_0223BC14: ; 0x0223BC14
	ldr r2, _0223BC1C ; =0x000023F4
	ldr r0, [r0, r2]
	strb r1, [r0]
	bx lr
	.balign 4, 0
_0223BC1C: .word 0x000023F4
	thumb_func_end ov12_0223BC14

	thumb_func_start ov12_0223BC20
ov12_0223BC20: ; 0x0223BC20
	ldr r2, _0223BC28 ; =0x000023F8
	ldr r0, [r0, r2]
	strb r1, [r0]
	bx lr
	.balign 4, 0
_0223BC28: .word 0x000023F8
	thumb_func_end ov12_0223BC20

	thumb_func_start ov12_0223BC2C
ov12_0223BC2C: ; 0x0223BC2C
	ldr r2, _0223BC34 ; =0x000023FE
	strb r1, [r0, r2]
	bx lr
	nop
_0223BC34: .word 0x000023FE
	thumb_func_end ov12_0223BC2C

	thumb_func_start ov12_0223BC38
ov12_0223BC38: ; 0x0223BC38
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r3, _0223BC44 ; =ov12_0226127C
	ldr r0, [r0, #0x34]
	bx r3
	nop
_0223BC44: .word ov12_0226127C
	thumb_func_end ov12_0223BC38

	thumb_func_start ov12_0223BC48
ov12_0223BC48: ; 0x0223BC48
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x44]
	mov r7, #0
	cmp r0, #0
	ble _0223BC94
	add r5, r6, #0
_0223BC56:
	ldr r0, [r5, #0x34]
	bl ov12_0226127C
	add r4, r0, #0
	str r6, [r4, #0xc]
	ldr r0, [r5, #0x34]
	bl ov12_02261258
	str r0, [sp]
	add r0, r6, #0
	bl BattleSystem_GetBattleType
	add r1, r0, #0
	ldr r0, [sp]
	bl ov12_02265B64
	add r1, r4, #0
	add r1, #0x25
	strb r0, [r1]
	add r0, r4, #0
	bl ov12_02264BCC
	add r0, r4, #0
	mov r1, #0
	bl ov12_02264F28
	ldr r0, [r6, #0x44]
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, r0
	blt _0223BC56
_0223BC94:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0223BC48

	thumb_func_start ov12_0223BC98
ov12_0223BC98: ; 0x0223BC98
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x44]
	mov r4, #0
	cmp r0, #0
	ble _0223BCC4
	add r5, r6, #0
	mov r7, #1
_0223BCA8:
	ldr r0, [r5, #0x34]
	bl ov12_0226127C
	ldr r1, [r0, #0x28]
	cmp r1, #0
	beq _0223BCBA
	add r1, r7, #0
	bl ov12_02264F28
_0223BCBA:
	ldr r0, [r6, #0x44]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0223BCA8
_0223BCC4:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0223BC98

	thumb_func_start ov12_0223BCC8
ov12_0223BCC8: ; 0x0223BCC8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x44]
	mov r4, #0
	cmp r0, #0
	ble _0223BCEE
	add r5, r6, #0
	add r7, r4, #0
_0223BCD8:
	ldr r0, [r5, #0x34]
	bl ov12_0226127C
	add r1, r7, #0
	bl ov12_02264F28
	ldr r0, [r6, #0x44]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0223BCD8
_0223BCEE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_0223BCC8

	thumb_func_start ov12_0223BCF0
ov12_0223BCF0: ; 0x0223BCF0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x44]
	mov r4, #0
	cmp r0, #0
	ble _0223BD12
	add r5, r6, #0
_0223BCFE:
	ldr r0, [r5, #0x34]
	bl ov12_0226127C
	bl ov12_02264C68
	ldr r0, [r6, #0x44]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0223BCFE
_0223BD12:
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0223BCF0

	thumb_func_start BattleSystem_GetWinLoseFlags
BattleSystem_GetWinLoseFlags: ; 0x0223BD14
	ldr r1, _0223BD1C ; =0x00002420
	ldrb r0, [r0, r1]
	bx lr
	nop
_0223BD1C: .word 0x00002420
	thumb_func_end BattleSystem_GetWinLoseFlags

	thumb_func_start ov12_0223BD20
ov12_0223BD20: ; 0x0223BD20
	ldr r2, _0223BD28 ; =0x00002420
	strb r1, [r0, r2]
	bx lr
	nop
_0223BD28: .word 0x00002420
	thumb_func_end ov12_0223BD20

	thumb_func_start ov12_0223BD2C
ov12_0223BD2C: ; 0x0223BD2C
	ldr r1, _0223BD38 ; =0x000023FF
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1e
	bx lr
	nop
_0223BD38: .word 0x000023FF
	thumb_func_end ov12_0223BD2C

	thumb_func_start ov12_0223BD3C
ov12_0223BD3C: ; 0x0223BD3C
	push {r3, r4}
	ldr r3, _0223BD54 ; =0x000023FF
	lsl r1, r1, #0x1e
	ldrb r4, [r0, r3]
	mov r2, #0x18
	lsr r1, r1, #0x1b
	bic r4, r2
	orr r1, r4
	strb r1, [r0, r3]
	pop {r3, r4}
	bx lr
	nop
_0223BD54: .word 0x000023FF
	thumb_func_end ov12_0223BD3C

	thumb_func_start ov12_0223BD58
ov12_0223BD58: ; 0x0223BD58
	ldr r1, _0223BD64 ; =0x000023FF
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1d
	bx lr
	nop
_0223BD64: .word 0x000023FF
	thumb_func_end ov12_0223BD58

	thumb_func_start ov12_0223BD68
ov12_0223BD68: ; 0x0223BD68
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xf
	blo _0223BD76
	bl GF_AssertFail
_0223BD76:
	ldr r1, _0223BD88 ; =0x000023FF
	mov r0, #0xe0
	ldrb r2, [r5, r1]
	bic r2, r0
	lsl r0, r4, #0x1d
	lsr r0, r0, #0x18
	orr r0, r2
	strb r0, [r5, r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223BD88: .word 0x000023FF
	thumb_func_end ov12_0223BD68

	thumb_func_start ov12_0223BD8C
ov12_0223BD8C: ; 0x0223BD8C
	ldr r2, _0223BD94 ; =0x0000243C
	str r1, [r0, r2]
	bx lr
	nop
_0223BD94: .word 0x0000243C
	thumb_func_end ov12_0223BD8C

	thumb_func_start BattleSystem_Random
BattleSystem_Random: ; 0x0223BD98
	push {r3, r4}
	ldr r2, _0223BDB8 ; =0x00002448
	ldr r1, _0223BDBC ; =0x41C64E6D
	ldr r3, [r0, r2]
	add r4, r3, #0
	mul r4, r1
	ldr r1, _0223BDC0 ; =0x00006073
	add r1, r4, r1
	str r1, [r0, r2]
	ldr r0, [r0, r2]
	lsr r0, r0, #0x10
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4}
	bx lr
	nop
_0223BDB8: .word 0x00002448
_0223BDBC: .word 0x41C64E6D
_0223BDC0: .word 0x00006073
	thumb_func_end BattleSystem_Random

	thumb_func_start ov12_0223BDC4
ov12_0223BDC4: ; 0x0223BDC4
	ldr r1, _0223BDCC ; =0x0000244C
	ldr r0, [r0, r1]
	bx lr
	nop
_0223BDCC: .word 0x0000244C
	thumb_func_end ov12_0223BDC4

	thumb_func_start ov12_0223BDD0
ov12_0223BDD0: ; 0x0223BDD0
	ldr r2, _0223BDD8 ; =0x0000244C
	str r1, [r0, r2]
	bx lr
	nop
_0223BDD8: .word 0x0000244C
	thumb_func_end ov12_0223BDD0

	thumb_func_start ov12_0223BDDC
ov12_0223BDDC: ; 0x0223BDDC
	push {r4, r5, r6, lr}
	add r6, r1, #0
	ldr r1, _0223BE08 ; =0x0000240C
	mov r3, #0x10
	ldr r4, [r0, r1]
	tst r4, r3
	bne _0223BE04
	add r1, #0x54
	add r4, r0, r1
	lsl r5, r6, #1
	ldrh r1, [r4, r5]
	lsl r0, r3, #6
	cmp r1, r0
	bhs _0223BE04
	add r0, r6, #0
	bl sub_02030260
	ldrh r0, [r4, r5]
	add r0, r0, #1
	strh r0, [r4, r5]
_0223BE04:
	pop {r4, r5, r6, pc}
	nop
_0223BE08: .word 0x0000240C
	thumb_func_end ov12_0223BDDC

	thumb_func_start ov12_0223BE0C
ov12_0223BE0C: ; 0x0223BE0C
	push {r3, r4, r5, r6, r7, lr}
	str r2, [sp]
	add r3, r1, #0
	ldr r1, [sp]
	mov r2, #0xff
	strb r2, [r1]
	ldr r1, _0223BE60 ; =0x0000240C
	mov r6, #0x10
	ldr r2, [r0, r1]
	and r2, r6
	beq _0223BE44
	add r1, #0x54
	lsl r5, r3, #1
	add r4, r0, r1
	ldrh r1, [r4, r5]
	lsl r6, r6, #6
	cmp r1, r6
	bhs _0223BE44
	add r0, r3, #0
	bl sub_0203027C
	ldr r1, [sp]
	mov r7, #0
	strb r0, [r1]
	ldrh r0, [r4, r5]
	add r0, r0, #1
	strh r0, [r4, r5]
	b _0223BE5A
_0223BE44:
	cmp r2, #0
	beq _0223BE5A
	lsl r1, r3, #1
	add r1, r0, r1
	ldr r0, _0223BE64 ; =0x00002460
	ldrh r1, [r1, r0]
	mov r0, #1
	lsl r0, r0, #0xa
	cmp r1, r0
	blo _0223BE5A
	mov r7, #1
_0223BE5A:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223BE60: .word 0x0000240C
_0223BE64: .word 0x00002460
	thumb_func_end ov12_0223BE0C

	thumb_func_start ov12_0223BE68
ov12_0223BE68: ; 0x0223BE68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	mov r6, #0
	ldr r0, [r0, #0x44]
	add r7, r6, #0
	str r1, [sp, #4]
	cmp r0, #0
	ble _0223BEFC
_0223BE7A:
	ldr r0, [sp]
	lsl r1, r7, #1
	add r5, r0, r1
	ldr r0, _0223BF0C ; =0x00002460
	add r1, r0, #0
	sub r1, #0x10
	ldrh r2, [r5, r0]
	ldrh r1, [r5, r1]
	cmp r2, r1
	beq _0223BEEE
	add r1, r6, #1
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	ldr r1, [sp, #4]
	add r3, r0, #0
	strb r7, [r1, r6]
	add r1, r2, #1
	lsl r1, r1, #0x18
	sub r3, #0x10
	lsr r6, r1, #0x18
	ldrh r1, [r5, r0]
	ldrh r3, [r5, r3]
	mov r4, #0
	sub r3, r1, r3
	ldr r1, [sp, #4]
	strb r3, [r1, r2]
	ldrh r1, [r5, r0]
	sub r0, #0x10
	ldrh r0, [r5, r0]
	sub r0, r1, r0
	cmp r0, #0
	ble _0223BEE6
_0223BEBA:
	ldr r1, _0223BF10 ; =0x00002450
	add r0, r7, #0
	ldrh r1, [r5, r1]
	add r1, r4, r1
	bl sub_0203027C
	add r2, r6, #1
	lsl r2, r2, #0x18
	add r1, r6, #0
	lsr r6, r2, #0x18
	ldr r2, [sp, #4]
	strb r0, [r2, r1]
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r0, _0223BF0C ; =0x00002460
	ldrh r1, [r5, r0]
	sub r0, #0x10
	ldrh r0, [r5, r0]
	sub r0, r1, r0
	cmp r4, r0
	blt _0223BEBA
_0223BEE6:
	ldr r0, _0223BF0C ; =0x00002460
	ldrh r1, [r5, r0]
	sub r0, #0x10
	strh r1, [r5, r0]
_0223BEEE:
	add r0, r7, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [sp]
	ldr r0, [r0, #0x44]
	cmp r7, r0
	blt _0223BE7A
_0223BEFC:
	cmp r6, #0x1c
	bls _0223BF04
	bl GF_AssertFail
_0223BF04:
	add r0, r6, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223BF0C: .word 0x00002460
_0223BF10: .word 0x00002450
	thumb_func_end ov12_0223BE68

	thumb_func_start ov12_0223BF14
ov12_0223BF14: ; 0x0223BF14
	push {r0, r1, r2, r3}
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	mov r1, #0
	add r0, sp, #8
	strb r1, [r0]
	ldr r0, [sp]
	add r6, r2, #0
	ldr r1, [r0, #0x2c]
	mov r0, #4
	tst r0, r1
	beq _0223BF9E
	ldr r1, _0223BFA8 ; =0x000023FC
	ldr r0, [sp]
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _0223BF9E
	add r0, sp, #0x20
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0223BF9E
_0223BF40:
	add r0, r6, #0
	add r1, sp, #8
	add r2, sp, #0x24
	bl ov12_0223BFB0
	add r5, r0, #0
	add r0, r6, #0
	add r1, sp, #8
	add r2, sp, #0x24
	bl ov12_0223BFB0
	add r7, r0, #0
	mov r4, #0
	cmp r7, #0
	ble _0223BF86
	ldr r0, [sp]
	lsl r1, r5, #1
	add r0, r0, r1
	str r0, [sp, #4]
_0223BF66:
	add r0, r6, #0
	add r1, sp, #8
	add r2, sp, #0x24
	bl ov12_0223BFB0
	add r2, r0, #0
	ldr r3, [sp, #4]
	ldr r1, _0223BFAC ; =0x00002458
	add r0, r5, #0
	ldrh r1, [r3, r1]
	add r1, r4, r1
	bl sub_02030260
	add r4, r4, #1
	cmp r4, r7
	blt _0223BF66
_0223BF86:
	ldr r0, [sp]
	lsl r1, r5, #1
	add r2, r0, r1
	ldr r0, _0223BFAC ; =0x00002458
	ldrh r0, [r2, r0]
	add r1, r0, r7
	ldr r0, _0223BFAC ; =0x00002458
	strh r1, [r2, r0]
	add r0, sp, #0x20
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _0223BF40
_0223BF9E:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_0223BFA8: .word 0x000023FC
_0223BFAC: .word 0x00002458
	thumb_func_end ov12_0223BF14

	thumb_func_start ov12_0223BFB0
ov12_0223BFB0: ; 0x0223BFB0
	ldrh r3, [r2]
	sub r3, r3, #1
	strh r3, [r2]
	ldrb r3, [r1]
	add r2, r3, #1
	strb r2, [r1]
	ldrb r0, [r0, r3]
	bx lr
	thumb_func_end ov12_0223BFB0

	thumb_func_start ov12_0223BFC0
ov12_0223BFC0: ; 0x0223BFC0
	ldr r1, _0223BFC8 ; =0x00002446
	ldrh r0, [r0, r1]
	bx lr
	nop
_0223BFC8: .word 0x00002446
	thumb_func_end ov12_0223BFC0

	thumb_func_start ov12_0223BFCC
ov12_0223BFCC: ; 0x0223BFCC
	lsl r1, r1, #2
	add r1, r0, r1
	ldr r0, _0223BFD8 ; =0x00002468
	ldr r0, [r1, r0]
	bx lr
	nop
_0223BFD8: .word 0x00002468
	thumb_func_end ov12_0223BFCC

	thumb_func_start ov12_0223BFDC
ov12_0223BFDC: ; 0x0223BFDC
	mov r3, #0x34
	mul r3, r1
	add r1, r0, r3
	lsl r0, r2, #1
	add r0, r1, r0
	add r0, #0xb0
	ldrh r0, [r0]
	bx lr
	thumb_func_end ov12_0223BFDC

	thumb_func_start ov12_0223BFEC
ov12_0223BFEC: ; 0x0223BFEC
	ldr r1, _0223BFF8 ; =0x00002478
	ldr r0, [r0, r1]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bx lr
	nop
_0223BFF8: .word 0x00002478
	thumb_func_end ov12_0223BFEC

	thumb_func_start ov12_0223BFFC
ov12_0223BFFC: ; 0x0223BFFC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r1, _0223C078 ; =0x0000240C
	add r5, r0, #0
	ldr r3, [r5, r1]
	mov r2, #0x10
	tst r2, r3
	beq _0223C072
	add r1, #0x6c
	ldr r1, [r5, r1]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	bne _0223C072
	ldr r1, [r5, #0x30]
	mov r2, #0xd
	mov r3, #0
	bl ov12_022581D4
	cmp r0, #0x2c
	beq _0223C072
	ldr r1, [r5, #0x30]
	add r0, r5, #0
	mov r2, #0xe
	mov r3, #0
	bl ov12_022581D4
	cmp r0, #0x2c
	beq _0223C072
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl ov12_0226AA8C
	mov r1, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
	bl sub_02005FA0
	mov r0, #0
	bl sub_020059D0
	ldr r1, _0223C07C ; =0x00002478
	mov r0, #1
	ldr r2, [r5, r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	str r0, [r5, r1]
_0223C072:
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223C078: .word 0x0000240C
_0223C07C: .word 0x00002478
	thumb_func_end ov12_0223BFFC

	thumb_func_start ov12_0223C080
ov12_0223C080: ; 0x0223C080
	push {r4, lr}
	ldr r1, _0223C0C0 ; =0x0000240C
	add r4, r0, #0
	ldr r3, [r4, r1]
	mov r2, #0x10
	tst r2, r3
	beq _0223C0B6
	add r1, #0x6c
	ldr r1, [r4, r1]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	bne _0223C0B6
	ldr r1, [r4, #0x30]
	mov r2, #0xd
	mov r3, #0
	bl ov12_022581D4
	cmp r0, #0x2c
	beq _0223C0B6
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	mov r2, #0xe
	mov r3, #0
	bl ov12_022581D4
	cmp r0, #0x2c
	bne _0223C0BA
_0223C0B6:
	mov r0, #0
	pop {r4, pc}
_0223C0BA:
	mov r0, #1
	pop {r4, pc}
	nop
_0223C0C0: .word 0x0000240C
	thumb_func_end ov12_0223C080

	thumb_func_start ov12_0223C0C4
ov12_0223C0C4: ; 0x0223C0C4
	push {r4, lr}
	ldr r1, _0223C0E8 ; =0x0000240C
	add r4, r0, #0
	ldr r3, [r4, r1]
	mov r2, #0x10
	tst r2, r3
	beq _0223C0E4
	add r1, #0x74
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _0223C0E4
	bl ov12_0226BEC4
	mov r1, #0x92
	lsl r1, r1, #6
	str r0, [r4, r1]
_0223C0E4:
	pop {r4, pc}
	nop
_0223C0E8: .word 0x0000240C
	thumb_func_end ov12_0223C0C4

	thumb_func_start BattleSystem_GetChatotVoiceParam
BattleSystem_GetChatotVoiceParam: ; 0x0223C0EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x2c]
	mov r3, #8
	add r4, r1, #0
	tst r3, r2
	bne _0223C10A
	mov r3, #0x10
	tst r2, r3
	beq _0223C112
	bl ov12_0223AB0C
	mov r1, #1
	tst r0, r1
	beq _0223C112
_0223C10A:
	ldr r0, _0223C130 ; =0x00002484
	add r1, r5, r4
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
_0223C112:
	ldr r1, [r5, #0x2c]
	mov r0, #2
	tst r0, r1
	beq _0223C126
	mov r0, #1
	and r0, r4
	add r1, r5, r0
	ldr r0, _0223C130 ; =0x00002484
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
_0223C126:
	ldr r0, _0223C130 ; =0x00002484
	add r1, r5, r4
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
	nop
_0223C130: .word 0x00002484
	thumb_func_end BattleSystem_GetChatotVoiceParam

	thumb_func_start ov12_0223C134
ov12_0223C134: ; 0x0223C134
	ldr r1, _0223C13C ; =0x00002488
	ldr r0, [r0, r1]
	bx lr
	nop
_0223C13C: .word 0x00002488
	thumb_func_end ov12_0223C134

	thumb_func_start ov12_0223C140
ov12_0223C140: ; 0x0223C140
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	blo _0223C14E
	mov r0, #0xff
	pop {r3, r4, r5, pc}
_0223C14E:
	mov r3, #0xa9
	ldr r2, [r5, #0x2c]
	lsl r3, r3, #2
	tst r3, r2
	beq _0223C15C
	mov r0, #0xff
	pop {r3, r4, r5, pc}
_0223C15C:
	mov r3, #2
	tst r2, r3
	beq _0223C170
	bl ov12_0223AB0C
	mov r1, #1
	tst r0, r1
	beq _0223C170
	mov r0, #0xff
	pop {r3, r4, r5, pc}
_0223C170:
	ldr r1, [r5, #0x2c]
	mov r0, #8
	tst r0, r1
	beq _0223C180
	ldr r0, _0223C19C ; =0x0000248C
	add r1, r5, r4
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
_0223C180:
	mov r0, #2
	tst r0, r1
	beq _0223C192
	mov r0, #1
	and r0, r4
	add r1, r5, r0
	ldr r0, _0223C19C ; =0x0000248C
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
_0223C192:
	ldr r0, _0223C19C ; =0x0000248C
	add r1, r5, r4
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
	nop
_0223C19C: .word 0x0000248C
	thumb_func_end ov12_0223C140

	thumb_func_start ov12_0223C1A0
ov12_0223C1A0: ; 0x0223C1A0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x44]
	add r7, r1, #0
	mov r4, #0
	cmp r0, #0
	ble _0223C1C2
	add r5, r6, #0
_0223C1B0:
	ldr r0, [r5, #0x34]
	bl ov12_02261258
	strb r4, [r7, r0]
	ldr r0, [r6, #0x44]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0223C1B0
_0223C1C2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_0223C1A0

	thumb_func_start ov12_0223C1C4
ov12_0223C1C4: ; 0x0223C1C4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	mov r1, #0
	mov r0, #0xff
_0223C1CE:
	strb r0, [r6, r1]
	add r1, r1, #1
	cmp r1, #4
	blt _0223C1CE
	ldr r0, [r7, #0x44]
	mov r5, #0
	cmp r0, #0
	ble _0223C1F2
	add r4, r7, #0
_0223C1E0:
	ldr r0, [r4, #0x34]
	bl ov12_02261258
	strb r0, [r6, r5]
	ldr r0, [r7, #0x44]
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r0
	blt _0223C1E0
_0223C1F2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_0223C1C4

	thumb_func_start ov12_0223C1F4
ov12_0223C1F4: ; 0x0223C1F4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0
	add r6, r1, #0
	add r5, r0, #0
_0223C1FE:
	add r0, r0, #1
	stmia r1!, {r5}
	cmp r0, #4
	blt _0223C1FE
	ldr r0, [r7, #0x44]
	cmp r0, #0
	ble _0223C220
	add r4, r7, #0
_0223C20E:
	ldr r0, [r4, #0x34]
	bl ov12_02261270
	stmia r6!, {r0}
	ldr r0, [r7, #0x44]
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r0
	blt _0223C20E
_0223C220:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0223C1F4

	thumb_func_start ov12_0223C224
ov12_0223C224: ; 0x0223C224
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x44]
	add r7, r1, #0
	mov r4, #0
	cmp r0, #0
	ble _0223C24A
	add r5, r6, #0
_0223C234:
	ldr r0, [r5, #0x34]
	bl ov12_0226127C
	add r1, r7, #0
	bl ov12_02264EE0
	ldr r0, [r6, #0x44]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0223C234
_0223C24A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_0223C224

	thumb_func_start ov12_0223C24C
ov12_0223C24C: ; 0x0223C24C
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	bl PlayerProfile_CountBadges
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #8
	bls _0223C262
	mov r4, #8
_0223C262:
	add r0, r5, #0
	bl Party_GetMaxLevel
	ldr r1, _0223C284 ; =ov12_0226C2E0
	lsl r0, r0, #2
	ldrb r1, [r1, r4]
	add r4, r1, #0
	mul r4, r0
	add r0, r6, #0
	bl PlayerProfile_GetMoney
	cmp r4, r0
	bls _0223C27E
	add r4, r0, #0
_0223C27E:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_0223C284: .word ov12_0226C2E0
	thumb_func_end ov12_0223C24C

	thumb_func_start PokedexSetBattlerSeen
PokedexSetBattlerSeen: ; 0x0223C288
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	lsl r0, r6, #2
	add r0, r5, r0
	ldr r0, [r0, #0x34]
	bl ov12_02261258
	add r4, r0, #0
	ldr r1, [r5, #0x30]
	add r0, r5, #0
	mov r2, #2
	add r3, r6, #0
	bl ov12_022581D4
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl BattleSystem_GetPartyMon
	add r6, r0, #0
	ldr r0, [r5, #0x2c]
	mov r1, #0x84
	tst r1, r0
	bne _0223C2CE
	mov r1, #1
	tst r1, r4
	bne _0223C2C6
	sub r0, #0x4a
	cmp r0, #1
	bhi _0223C2CE
_0223C2C6:
	ldr r0, [r5, #0x60]
	add r1, r6, #0
	bl Pokedex_SetMonSeenFlag
_0223C2CE:
	mov r0, #1
	tst r0, r4
	bne _0223C2EE
	add r0, r6, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	mov r1, #0x67
	lsl r1, r1, #2
	cmp r0, r1
	bne _0223C2EE
	ldr r0, [r5, #0x60]
	add r1, r6, #0
	bl Pokedex_SetMonCaughtFlag
_0223C2EE:
	pop {r4, r5, r6, pc}
	thumb_func_end PokedexSetBattlerSeen

	thumb_func_start ov12_0223C2F0
ov12_0223C2F0: ; 0x0223C2F0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x34]
	bl ov12_02261258
	ldr r2, [r5, #0x2c]
	mov r1, #0x84
	tst r1, r2
	bne _0223C32C
	mov r1, #1
	tst r0, r1
	beq _0223C32C
	ldr r1, [r5, #0x30]
	add r0, r5, #0
	mov r2, #2
	add r3, r4, #0
	bl ov12_022581D4
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl BattleSystem_GetPartyMon
	add r1, r0, #0
	ldr r0, [r5, #0x60]
	bl Pokedex_SetMonCaughtFlag
_0223C32C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0223C2F0

	thumb_func_start ov12_0223C330
ov12_0223C330: ; 0x0223C330
	ldr r3, _0223C33C ; =Pokedex_CheckMonCaughtFlag
	lsl r1, r1, #0x10
	ldr r0, [r0, #0x60]
	lsr r1, r1, #0x10
	bx r3
	nop
_0223C33C: .word Pokedex_CheckMonCaughtFlag
	thumb_func_end ov12_0223C330

	thumb_func_start ov12_0223C340
ov12_0223C340: ; 0x0223C340
	ldr r0, _0223C348 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	bx lr
	.balign 4, 0
_0223C348: .word 0x04000050
	thumb_func_end ov12_0223C340

	thumb_func_start ov12_0223C34C
ov12_0223C34C: ; 0x0223C34C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	add r6, r0, #0
	mov r1, #0
	str r2, [sp, #0xc]
	add r5, r3, #0
	bl BattleSystem_GetWindow
	add r7, r0, #0
	ldr r0, [r6, #0x2c]
	mov r2, #0x80
	add r1, r0, #0
	tst r1, r2
	beq _0223C454
	ldr r1, _0223C488 ; =0x00002710
	cmp r4, r1
	beq _0223C376
	lsl r1, r2, #6
	tst r0, r1
	beq _0223C3D2
_0223C376:
	cmp r5, #0x64
	bne _0223C38E
	ldr r0, [sp, #0xc]
	add r2, r6, #0
	mov r1, #0x34
	add r2, #0xd0
	mul r1, r0
	add r0, r2, r1
	mov r1, #5
	bl MailMsg_GetExpandedString
	b _0223C3A0
_0223C38E:
	ldr r0, [sp, #0xc]
	add r2, r6, #0
	mov r1, #0x34
	add r2, #0xd8
	mul r1, r0
	add r0, r2, r1
	mov r1, #5
	bl MailMsg_GetExpandedString
_0223C3A0:
	add r4, r0, #0
	add r0, r7, #0
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r6, #0x18]
	add r1, r4, #0
	bl String_Copy
	mov r3, #0
	ldr r0, [sp, #0x30]
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0223C48C ; =ov12_0223CF14
	mov r1, #1
	str r0, [sp, #8]
	ldr r2, [r6, #0x18]
	add r0, r7, #0
	bl AddTextPrinterParameterized
	add r5, r0, #0
	add r0, r4, #0
	bl String_Delete
	b _0223C480
_0223C3D2:
	cmp r5, #0x64
	bne _0223C3E0
	lsl r0, r4, #1
	add r0, r4, r0
	add r0, r0, #1
	str r0, [sp, #0x10]
	b _0223C3E8
_0223C3E0:
	lsl r0, r4, #1
	add r0, r4, r0
	add r0, r0, #2
	str r0, [sp, #0x10]
_0223C3E8:
	mov r4, #0
	add r5, r6, #0
_0223C3EC:
	ldr r0, [r5, #0x48]
	bl PlayerProfile_GetVersion
	cmp r0, #0
	beq _0223C3FE
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0223C3EC
_0223C3FE:
	cmp r4, #4
	bne _0223C408
	mov r2, #0xb5
	lsl r2, r2, #2
	b _0223C40A
_0223C408:
	ldr r2, _0223C490 ; =0x000002D3
_0223C40A:
	mov r0, #0
	mov r1, #0x1b
	mov r3, #5
	bl NewMsgDataFromNarc
	ldr r1, [sp, #0x10]
	str r0, [sp, #0x14]
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r7, #0
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r6, #0x18]
	add r1, r4, #0
	bl String_Copy
	mov r3, #0
	ldr r0, [sp, #0x30]
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0223C48C ; =ov12_0223CF14
	mov r1, #1
	str r0, [sp, #8]
	ldr r2, [r6, #0x18]
	add r0, r7, #0
	bl AddTextPrinterParameterized
	add r5, r0, #0
	add r0, r4, #0
	bl String_Delete
	ldr r0, [sp, #0x14]
	bl DestroyMsgData
	b _0223C480
_0223C454:
	ldr r2, [r6, #0x18]
	add r0, r4, #0
	add r1, r5, #0
	mov r3, #5
	bl GetTrainerMessageByIdPair
	add r0, r7, #0
	mov r1, #0xff
	bl FillWindowPixelBuffer
	mov r3, #0
	ldr r0, [sp, #0x30]
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0223C48C ; =ov12_0223CF14
	mov r1, #1
	str r0, [sp, #8]
	ldr r2, [r6, #0x18]
	add r0, r7, #0
	bl AddTextPrinterParameterized
	add r5, r0, #0
_0223C480:
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223C488: .word 0x00002710
_0223C48C: .word ov12_0223CF14
_0223C490: .word 0x000002D3
	thumb_func_end ov12_0223C34C

	thumb_func_start ov12_0223C494
ov12_0223C494: ; 0x0223C494
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #0xc]
	add r5, r0, #0
	add r4, r2, #0
	mov r1, #0
	add r6, r3, #0
	bl BattleSystem_GetWindow
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0223C558
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0223C754
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	add r2, r4, #0
	bl ov12_0223CEF4
	add r0, r7, #0
	mov r1, #0xff
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	ldr r0, _0223C4E4 ; =ov12_0223CF14
	str r6, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [r5, #0x18]
	add r0, r7, #0
	mov r1, #1
	bl AddTextPrinterParameterized
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223C4E4: .word ov12_0223CF14
	thumb_func_end ov12_0223C494

	thumb_func_start ov12_0223C4E8
ov12_0223C4E8: ; 0x0223C4E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r3, #0
	add r4, r1, #0
	add r5, r0, #0
	add r1, r7, #0
	add r6, r2, #0
	bl ov12_0223C558
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_0223C754
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov12_0223CEF4
	ldr r1, [sp, #0x28]
	mov r0, #1
	tst r0, r1
	beq _0223C51C
	add r0, r4, #0
	mov r1, #0xff
	bl FillWindowPixelBuffer
_0223C51C:
	ldr r1, [sp, #0x28]
	mov r0, #2
	tst r0, r1
	beq _0223C534
	mov r0, #0
	ldr r1, [r5, #0x18]
	add r2, r0, #0
	bl FontID_String_GetWidth
	ldr r1, [sp, #0x2c]
	sub r3, r1, r0
	b _0223C536
_0223C534:
	mov r3, #0
_0223C536:
	ldr r0, [sp, #0x24]
	mov r1, #0
	str r0, [sp]
	ldr r0, [sp, #0x30]
	str r0, [sp, #4]
	ldr r0, _0223C554 ; =ov12_0223CF14
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r4, [sp, #0x20]
	ldr r2, [r5, #0x18]
	add r3, r4, r3
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223C554: .word ov12_0223CF14
	thumb_func_end ov12_0223C4E8

	thumb_func_start ov12_0223C558
ov12_0223C558: ; 0x0223C558
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r0, #0
	bl BattleSystem_GetBattleType
	add r5, r0, #0
	ldrb r0, [r4, #1]
	mov r1, #0x80
	tst r1, r0
	bne _0223C57E
	mov r1, #0x40
	tst r1, r0
	beq _0223C588
	ldr r1, [r4, #0x20]
	add r0, r6, #0
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	bne _0223C580
_0223C57E:
	b _0223C752
_0223C580:
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C588:
	mov r1, #0x3f
	and r0, r1
	cmp r0, #0x3c
	bls _0223C592
	b _0223C74E
_0223C592:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223C59E: ; jump table
	.short _0223C752 - _0223C59E - 2 ; case 0
	.short _0223C618 - _0223C59E - 2 ; case 1
	.short _0223C630 - _0223C59E - 2 ; case 2
	.short _0223C752 - _0223C59E - 2 ; case 3
	.short _0223C752 - _0223C59E - 2 ; case 4
	.short _0223C752 - _0223C59E - 2 ; case 5
	.short _0223C752 - _0223C59E - 2 ; case 6
	.short _0223C752 - _0223C59E - 2 ; case 7
	.short _0223C752 - _0223C59E - 2 ; case 8
	.short _0223C692 - _0223C59E - 2 ; case 9
	.short _0223C630 - _0223C59E - 2 ; case 10
	.short _0223C630 - _0223C59E - 2 ; case 11
	.short _0223C630 - _0223C59E - 2 ; case 12
	.short _0223C630 - _0223C59E - 2 ; case 13
	.short _0223C630 - _0223C59E - 2 ; case 14
	.short _0223C630 - _0223C59E - 2 ; case 15
	.short _0223C630 - _0223C59E - 2 ; case 16
	.short _0223C630 - _0223C59E - 2 ; case 17
	.short _0223C630 - _0223C59E - 2 ; case 18
	.short _0223C630 - _0223C59E - 2 ; case 19
	.short _0223C656 - _0223C59E - 2 ; case 20
	.short _0223C66E - _0223C59E - 2 ; case 21
	.short _0223C752 - _0223C59E - 2 ; case 22
	.short _0223C66E - _0223C59E - 2 ; case 23
	.short _0223C752 - _0223C59E - 2 ; case 24
	.short _0223C752 - _0223C59E - 2 ; case 25
	.short _0223C752 - _0223C59E - 2 ; case 26
	.short _0223C752 - _0223C59E - 2 ; case 27
	.short _0223C752 - _0223C59E - 2 ; case 28
	.short _0223C752 - _0223C59E - 2 ; case 29
	.short _0223C752 - _0223C59E - 2 ; case 30
	.short _0223C692 - _0223C59E - 2 ; case 31
	.short _0223C692 - _0223C59E - 2 ; case 32
	.short _0223C692 - _0223C59E - 2 ; case 33
	.short _0223C630 - _0223C59E - 2 ; case 34
	.short _0223C630 - _0223C59E - 2 ; case 35
	.short _0223C6F0 - _0223C59E - 2 ; case 36
	.short _0223C630 - _0223C59E - 2 ; case 37
	.short _0223C630 - _0223C59E - 2 ; case 38
	.short _0223C630 - _0223C59E - 2 ; case 39
	.short _0223C630 - _0223C59E - 2 ; case 40
	.short _0223C630 - _0223C59E - 2 ; case 41
	.short _0223C630 - _0223C59E - 2 ; case 42
	.short _0223C6F0 - _0223C59E - 2 ; case 43
	.short _0223C630 - _0223C59E - 2 ; case 44
	.short _0223C630 - _0223C59E - 2 ; case 45
	.short _0223C630 - _0223C59E - 2 ; case 46
	.short _0223C630 - _0223C59E - 2 ; case 47
	.short _0223C66E - _0223C59E - 2 ; case 48
	.short _0223C752 - _0223C59E - 2 ; case 49
	.short _0223C752 - _0223C59E - 2 ; case 50
	.short _0223C752 - _0223C59E - 2 ; case 51
	.short _0223C6F0 - _0223C59E - 2 ; case 52
	.short _0223C6F0 - _0223C59E - 2 ; case 53
	.short _0223C6F0 - _0223C59E - 2 ; case 54
	.short _0223C6F0 - _0223C59E - 2 ; case 55
	.short _0223C752 - _0223C59E - 2 ; case 56
	.short _0223C752 - _0223C59E - 2 ; case 57
	.short _0223C752 - _0223C59E - 2 ; case 58
	.short _0223C752 - _0223C59E - 2 ; case 59
	.short _0223C752 - _0223C59E - 2 ; case 60
_0223C618:
	ldr r1, [r4, #4]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	beq _0223C64C
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C630:
	ldr r1, [r4, #4]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	beq _0223C64C
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	mov r0, #1
	tst r0, r5
	bne _0223C64E
_0223C64C:
	b _0223C752
_0223C64E:
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C656:
	ldr r1, [r4, #8]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C66E:
	ldr r1, [r4, #8]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	mov r0, #1
	tst r0, r5
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C692:
	ldr r1, [r4, #4]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	beq _0223C6CC
	ldrh r0, [r4, #2]
	add r0, r0, #3
	strh r0, [r4, #2]
	mov r0, #1
	tst r0, r5
	beq _0223C6B4
	ldrh r0, [r4, #2]
	add r0, r0, #2
	strh r0, [r4, #2]
_0223C6B4:
	ldr r1, [r4, #8]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C6CC:
	ldr r1, [r4, #8]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	mov r0, #1
	tst r0, r5
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C6F0:
	ldr r1, [r4, #4]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	beq _0223C72A
	ldrh r0, [r4, #2]
	add r0, r0, #3
	strh r0, [r4, #2]
	mov r0, #1
	tst r0, r5
	beq _0223C712
	ldrh r0, [r4, #2]
	add r0, r0, #2
	strh r0, [r4, #2]
_0223C712:
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C72A:
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	mov r0, #1
	tst r0, r5
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C74E:
	bl GF_AssertFail
_0223C752:
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0223C558

	thumb_func_start ov12_0223C754
ov12_0223C754: ; 0x0223C754
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r2, [r4, #1]
	mov r1, #0x3f
	add r5, r0, #0
	and r1, r2
	cmp r1, #0x3c
	bls _0223C766
	b _0223CDCA
_0223C766:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223C772: ; jump table
	.short _0223CDCE - _0223C772 - 2 ; case 0
	.short _0223CDCE - _0223C772 - 2 ; case 1
	.short _0223C7EC - _0223C772 - 2 ; case 2
	.short _0223C7F6 - _0223C772 - 2 ; case 3
	.short _0223C800 - _0223C772 - 2 ; case 4
	.short _0223C80A - _0223C772 - 2 ; case 5
	.short _0223C814 - _0223C772 - 2 ; case 6
	.short _0223C81E - _0223C772 - 2 ; case 7
	.short _0223C82A - _0223C772 - 2 ; case 8
	.short _0223C834 - _0223C772 - 2 ; case 9
	.short _0223C848 - _0223C772 - 2 ; case 10
	.short _0223C85C - _0223C772 - 2 ; case 11
	.short _0223C870 - _0223C772 - 2 ; case 12
	.short _0223C884 - _0223C772 - 2 ; case 13
	.short _0223C898 - _0223C772 - 2 ; case 14
	.short _0223C8AC - _0223C772 - 2 ; case 15
	.short _0223C8C0 - _0223C772 - 2 ; case 16
	.short _0223C8D4 - _0223C772 - 2 ; case 17
	.short _0223C8E8 - _0223C772 - 2 ; case 18
	.short _0223C8FC - _0223C772 - 2 ; case 19
	.short _0223C7F6 - _0223C772 - 2 ; case 20
	.short _0223C910 - _0223C772 - 2 ; case 21
	.short _0223C924 - _0223C772 - 2 ; case 22
	.short _0223C938 - _0223C772 - 2 ; case 23
	.short _0223C94C - _0223C772 - 2 ; case 24
	.short _0223C960 - _0223C772 - 2 ; case 25
	.short _0223C974 - _0223C772 - 2 ; case 26
	.short _0223C988 - _0223C772 - 2 ; case 27
	.short _0223C99C - _0223C772 - 2 ; case 28
	.short _0223C9B0 - _0223C772 - 2 ; case 29
	.short _0223C9C4 - _0223C772 - 2 ; case 30
	.short _0223C9D8 - _0223C772 - 2 ; case 31
	.short _0223C9F6 - _0223C772 - 2 ; case 32
	.short _0223CA14 - _0223C772 - 2 ; case 33
	.short _0223CA32 - _0223C772 - 2 ; case 34
	.short _0223CA50 - _0223C772 - 2 ; case 35
	.short _0223CA6E - _0223C772 - 2 ; case 36
	.short _0223CA8C - _0223C772 - 2 ; case 37
	.short _0223CAAA - _0223C772 - 2 ; case 38
	.short _0223CAC8 - _0223C772 - 2 ; case 39
	.short _0223CAE6 - _0223C772 - 2 ; case 40
	.short _0223CB04 - _0223C772 - 2 ; case 41
	.short _0223CB22 - _0223C772 - 2 ; case 42
	.short _0223CB40 - _0223C772 - 2 ; case 43
	.short _0223CB5E - _0223C772 - 2 ; case 44
	.short _0223CB7C - _0223C772 - 2 ; case 45
	.short _0223CB9A - _0223C772 - 2 ; case 46
	.short _0223CBB8 - _0223C772 - 2 ; case 47
	.short _0223CBD6 - _0223C772 - 2 ; case 48
	.short _0223CBF4 - _0223C772 - 2 ; case 49
	.short _0223CC12 - _0223C772 - 2 ; case 50
	.short _0223CC30 - _0223C772 - 2 ; case 51
	.short _0223CC4E - _0223C772 - 2 ; case 52
	.short _0223CC76 - _0223C772 - 2 ; case 53
	.short _0223CC9E - _0223C772 - 2 ; case 54
	.short _0223CCC6 - _0223C772 - 2 ; case 55
	.short _0223CCEE - _0223C772 - 2 ; case 56
	.short _0223CD16 - _0223C772 - 2 ; case 57
	.short _0223CD3E - _0223C772 - 2 ; case 58
	.short _0223CD66 - _0223C772 - 2 ; case 59
	.short _0223CD8E - _0223C772 - 2 ; case 60
_0223C7EC:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223C7F6:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223C800:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CE68
	pop {r3, r4, r5, pc}
_0223C80A:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CE00
	pop {r3, r4, r5, pc}
_0223C814:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CE0C
	pop {r3, r4, r5, pc}
_0223C81E:
	ldr r2, [r4, #4]
	ldr r3, [r4, #0x1c]
	mov r1, #0
	bl ov12_0223CE24
	pop {r3, r4, r5, pc}
_0223C82A:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CECC
	pop {r3, r4, r5, pc}
_0223C834:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223C848:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223C85C:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	pop {r3, r4, r5, pc}
_0223C870:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE68
	pop {r3, r4, r5, pc}
_0223C884:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE50
	pop {r3, r4, r5, pc}
_0223C898:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE80
	pop {r3, r4, r5, pc}
_0223C8AC:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE00
	pop {r3, r4, r5, pc}
_0223C8C0:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CEA4
	pop {r3, r4, r5, pc}
_0223C8D4:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE0C
	pop {r3, r4, r5, pc}
_0223C8E8:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	pop {r3, r4, r5, pc}
_0223C8FC:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CEE4
	pop {r3, r4, r5, pc}
_0223C910:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDF4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223C924:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDF4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223C938:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CE5C
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223C94C:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CE00
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223C960:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CE0C
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE0C
	pop {r3, r4, r5, pc}
_0223C974:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CECC
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	pop {r3, r4, r5, pc}
_0223C988:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CECC
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223C99C:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CECC
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE00
	pop {r3, r4, r5, pc}
_0223C9B0:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CECC
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE0C
	pop {r3, r4, r5, pc}
_0223C9C4:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	pop {r3, r4, r5, pc}
_0223C9D8:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223C9F6:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE5C
	pop {r3, r4, r5, pc}
_0223CA14:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE00
	pop {r3, r4, r5, pc}
_0223CA32:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDF4
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223CA50:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDF4
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE0C
	pop {r3, r4, r5, pc}
_0223CA6E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223CA8C:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223CAAA:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE00
	pop {r3, r4, r5, pc}
_0223CAC8:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE68
	pop {r3, r4, r5, pc}
_0223CAE6:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE50
	pop {r3, r4, r5, pc}
_0223CB04:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE74
	pop {r3, r4, r5, pc}
_0223CB22:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE0C
	pop {r3, r4, r5, pc}
_0223CB40:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE00
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223CB5E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE00
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223CB7C:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE00
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE68
	pop {r3, r4, r5, pc}
_0223CB9A:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE00
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE74
	pop {r3, r4, r5, pc}
_0223CBB8:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CEE4
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CEE4
	pop {r3, r4, r5, pc}
_0223CBD6:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CE00
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CEA8
	pop {r3, r4, r5, pc}
_0223CBF4:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CECC
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223CC12:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223CC30:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE00
	pop {r3, r4, r5, pc}
_0223CC4E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223CC76:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CE5C
	pop {r3, r4, r5, pc}
_0223CC9E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CE68
	pop {r3, r4, r5, pc}
_0223CCC6:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE00
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CE00
	pop {r3, r4, r5, pc}
_0223CCEE:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CECC
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CECC
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223CD16:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223CD3E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CECC
	pop {r3, r4, r5, pc}
_0223CD66:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CEB4
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CECC
	pop {r3, r4, r5, pc}
_0223CD8E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CEB4
	ldr r2, [r4, #0x14]
	add r0, r5, #0
	mov r1, #4
	bl ov12_0223CECC
	ldr r2, [r4, #0x18]
	add r0, r5, #0
	mov r1, #5
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223CDCA:
	bl GF_AssertFail
_0223CDCE:
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223C754

	thumb_func_start ov12_0223CDD0
ov12_0223CDD0: ; 0x0223CDD0
	push {r3, r4, r5, lr}
	mov r3, #0xff
	lsl r3, r3, #8
	add r4, r1, #0
	lsl r1, r2, #0x18
	and r2, r3
	add r5, r0, #0
	lsr r1, r1, #0x18
	asr r2, r2, #8
	bl BattleSystem_GetPartyMon
	add r2, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl BufferBoxMonNickname
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0223CDD0

	thumb_func_start ov12_0223CDF4
ov12_0223CDF4: ; 0x0223CDF4
	ldr r3, _0223CDFC ; =BufferMoveName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CDFC: .word BufferMoveName
	thumb_func_end ov12_0223CDF4

	thumb_func_start ov12_0223CE00
ov12_0223CE00: ; 0x0223CE00
	ldr r3, _0223CE08 ; =BufferItemName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CE08: .word BufferItemName
	thumb_func_end ov12_0223CE00

	thumb_func_start ov12_0223CE0C
ov12_0223CE0C: ; 0x0223CE0C
	push {r3, lr}
	sub sp, #8
	mov r3, #0
	str r3, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldr r0, [r0, #0x14]
	mov r3, #5
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov12_0223CE0C

	thumb_func_start ov12_0223CE24
ov12_0223CE24: ; 0x0223CE24
	push {r4, lr}
	sub sp, #8
	cmp r3, #0
	beq _0223CE3C
	mov r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	ldr r0, [r0, #0x14]
	bl BufferIntegerAsString
	add sp, #8
	pop {r4, pc}
_0223CE3C:
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, [r0, #0x14]
	mov r3, #5
	bl BufferIntegerAsString
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0223CE24

	thumb_func_start ov12_0223CE50
ov12_0223CE50: ; 0x0223CE50
	ldr r3, _0223CE58 ; =BufferTypeName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CE58: .word BufferTypeName
	thumb_func_end ov12_0223CE50

	thumb_func_start ov12_0223CE5C
ov12_0223CE5C: ; 0x0223CE5C
	ldr r3, _0223CE64 ; =BufferAbilityName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CE64: .word BufferAbilityName
	thumb_func_end ov12_0223CE5C

	thumb_func_start ov12_0223CE68
ov12_0223CE68: ; 0x0223CE68
	ldr r3, _0223CE70 ; =BufferStatName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CE70: .word BufferStatName
	thumb_func_end ov12_0223CE68

	thumb_func_start ov12_0223CE74
ov12_0223CE74: ; 0x0223CE74
	ldr r3, _0223CE7C ; =BufferStatusName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CE7C: .word BufferStatusName
	thumb_func_end ov12_0223CE74

	thumb_func_start ov12_0223CE80
ov12_0223CE80: ; 0x0223CE80
	push {r3, r4, r5, lr}
	mov r3, #0xff
	lsl r3, r3, #8
	add r4, r1, #0
	lsl r1, r2, #0x18
	and r2, r3
	add r5, r0, #0
	lsr r1, r1, #0x18
	asr r2, r2, #8
	bl BattleSystem_GetPartyMon
	add r2, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl BufferBoxMonSpeciesName
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0223CE80

	thumb_func_start ov12_0223CEA4
ov12_0223CEA4: ; 0x0223CEA4
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0223CEA4

	thumb_func_start ov12_0223CEA8
ov12_0223CEA8: ; 0x0223CEA8
	ldr r3, _0223CEB0 ; =BufferFlavorDislikeText
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CEB0: .word BufferFlavorDislikeText
	thumb_func_end ov12_0223CEA8

	thumb_func_start ov12_0223CEB4
ov12_0223CEB4: ; 0x0223CEB4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r1, r2, #0
	bl BattleSystem_GetTrainer
	add r2, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl BufferTrainerClassNameFromDataStruct
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223CEB4

	thumb_func_start ov12_0223CECC
ov12_0223CECC: ; 0x0223CECC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r1, r2, #0
	bl BattleSystem_GetTrainer
	add r2, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl BufferTrainerNameFromDataStruct
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223CECC

	thumb_func_start ov12_0223CEE4
ov12_0223CEE4: ; 0x0223CEE4
	push {r4, lr}
	add r4, r0, #0
	add r3, r2, #0
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x64]
	bl BufferPCBoxName
	pop {r4, pc}
	thumb_func_end ov12_0223CEE4

	thumb_func_start ov12_0223CEF4
ov12_0223CEF4: ; 0x0223CEF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	ldrh r1, [r2, #2]
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_Delete
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223CEF4

	thumb_func_start ov12_0223CF14
ov12_0223CF14: ; 0x0223CF14
	push {r4, lr}
	mov r4, #0
	cmp r1, #5
	bhi _0223CF5C
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223CF28: ; jump table
	.short _0223CF5C - _0223CF28 - 2 ; case 0
	.short _0223CF34 - _0223CF28 - 2 ; case 1
	.short _0223CF3C - _0223CF28 - 2 ; case 2
	.short _0223CF44 - _0223CF28 - 2 ; case 3
	.short _0223CF4C - _0223CF28 - 2 ; case 4
	.short _0223CF54 - _0223CF28 - 2 ; case 5
_0223CF34:
	bl GF_IsAnySEPlaying
	add r4, r0, #0
	b _0223CF5C
_0223CF3C:
	bl IsFanfarePlaying
	add r4, r0, #0
	b _0223CF5C
_0223CF44:
	ldr r0, _0223CF60 ; =0x000004A3
	bl PlayFanfare
	b _0223CF5C
_0223CF4C:
	ldr r0, _0223CF64 ; =0x000005E6
	bl PlaySE
	b _0223CF5C
_0223CF54:
	mov r0, #0x4a
	lsl r0, r0, #4
	bl PlayFanfare
_0223CF5C:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_0223CF60: .word 0x000004A3
_0223CF64: .word 0x000005E6
	thumb_func_end ov12_0223CF14

.rodata

ov12_0226C2E0: ; 0x0226C2E0
	.byte 0x02, 0x04, 0x06, 0x09, 0x0C, 0x10, 0x14, 0x19, 0x1E, 0x00, 0x00, 0x00
