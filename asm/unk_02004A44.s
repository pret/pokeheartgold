	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D05E8:
	.space 0x10

_021D05F8:
	.space 0x28

_021D0620:
	.space 0x7D0

	.text

	thumb_func_start sub_02004A44
sub_02004A44: ; 0x02004A44
	push {r4, lr}
	add r4, r0, #0
	mov r0, #5
	bl sub_02004400
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02004A44

	thumb_func_start sub_02004A54
sub_02004A54: ; 0x02004A54
	push {r3, lr}
	mov r0, #5
	bl sub_02004400
	ldrb r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02004A54

	thumb_func_start sub_02004A60
sub_02004A60: ; 0x02004A60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xa
	bl sub_02004400
	add r4, r0, #0
	ldr r0, _02004A8C ; =0x000004C1
	cmp r5, r0
	bls _02004A82
	add r0, r5, #0
	bl sub_02004AB8
	add r0, r5, #0
	bl sub_02005C98
	strh r0, [r4]
	b _02004A84
_02004A82:
	strh r5, [r4]
_02004A84:
	mov r0, #0
	bl sub_02004A9C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02004A8C: .word 0x000004C1
	thumb_func_end sub_02004A60

	thumb_func_start sub_02004A90
sub_02004A90: ; 0x02004A90
	push {r3, lr}
	mov r0, #0xa
	bl sub_02004400
	ldrh r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02004A90

	thumb_func_start sub_02004A9C
sub_02004A9C: ; 0x02004A9C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb
	bl sub_02004400
	strh r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02004A9C

	thumb_func_start sub_02004AAC
sub_02004AAC: ; 0x02004AAC
	push {r3, lr}
	mov r0, #0xb
	bl sub_02004400
	ldrh r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02004AAC

	thumb_func_start sub_02004AB8
sub_02004AB8: ; 0x02004AB8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x3a
	bl sub_02004400
	strh r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02004AB8

	thumb_func_start sub_02004AC8
sub_02004AC8: ; 0x02004AC8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x20
	bl sub_02004400
	strh r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02004AC8

	thumb_func_start sub_02004AD8
sub_02004AD8: ; 0x02004AD8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x15
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0x16
	bl sub_02004400
	cmp r5, #0x33
	bhs _02004AF6
	strb r5, [r4]
	mov r1, #0
	strb r1, [r0]
	pop {r3, r4, r5, pc}
_02004AF6:
	strb r5, [r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02004AD8

	thumb_func_start sub_02004AFC
sub_02004AFC: ; 0x02004AFC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x15
	bl sub_02004400
	mov r0, #0x16
	bl sub_02004400
	strb r4, [r0]
	pop {r4, pc}
	thumb_func_end sub_02004AFC

	thumb_func_start sub_02004B10
sub_02004B10: ; 0x02004B10
	push {r4, lr}
	mov r0, #0x16
	bl sub_02004400
	add r4, r0, #0
	bl sub_02005318
	mov r0, #0
	strb r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02004B10

	thumb_func_start sub_02004B24
sub_02004B24: ; 0x02004B24
	push {r4, lr}
	cmp r0, #0x4b
	bls _02004B2C
	b _02004E42
_02004B2C:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02004B38: ; jump table
	.short _02004E42 - _02004B38 - 2 ; case 0
	.short _02004BD0 - _02004B38 - 2 ; case 1
	.short _02004C76 - _02004B38 - 2 ; case 2
	.short _02004C94 - _02004B38 - 2 ; case 3
	.short _02004C9E - _02004B38 - 2 ; case 4
	.short _02004CA8 - _02004B38 - 2 ; case 5
	.short _02004CBC - _02004B38 - 2 ; case 6
	.short _02004D32 - _02004B38 - 2 ; case 7
	.short _02004CC6 - _02004B38 - 2 ; case 8
	.short _02004BD0 - _02004B38 - 2 ; case 9
	.short _02004BD0 - _02004B38 - 2 ; case 10
	.short _02004CB2 - _02004B38 - 2 ; case 11
	.short _02004CD0 - _02004B38 - 2 ; case 12
	.short _02004C76 - _02004B38 - 2 ; case 13
	.short _02004C6C - _02004B38 - 2 ; case 14
	.short _02004CEA - _02004B38 - 2 ; case 15
	.short _02004CDA - _02004B38 - 2 ; case 16
	.short _02004BD0 - _02004B38 - 2 ; case 17
	.short _02004E42 - _02004B38 - 2 ; case 18
	.short _02004BDA - _02004B38 - 2 ; case 19
	.short _02004BD0 - _02004B38 - 2 ; case 20
	.short _02004C80 - _02004B38 - 2 ; case 21
	.short _02004C9E - _02004B38 - 2 ; case 22
	.short _02004BD0 - _02004B38 - 2 ; case 23
	.short _02004CF4 - _02004B38 - 2 ; case 24
	.short _02004D04 - _02004B38 - 2 ; case 25
	.short _02004E42 - _02004B38 - 2 ; case 26
	.short _02004E42 - _02004B38 - 2 ; case 27
	.short _02004E42 - _02004B38 - 2 ; case 28
	.short _02004E42 - _02004B38 - 2 ; case 29
	.short _02004E42 - _02004B38 - 2 ; case 30
	.short _02004E42 - _02004B38 - 2 ; case 31
	.short _02004E42 - _02004B38 - 2 ; case 32
	.short _02004E42 - _02004B38 - 2 ; case 33
	.short _02004E42 - _02004B38 - 2 ; case 34
	.short _02004E42 - _02004B38 - 2 ; case 35
	.short _02004E42 - _02004B38 - 2 ; case 36
	.short _02004E42 - _02004B38 - 2 ; case 37
	.short _02004E42 - _02004B38 - 2 ; case 38
	.short _02004E42 - _02004B38 - 2 ; case 39
	.short _02004E42 - _02004B38 - 2 ; case 40
	.short _02004E42 - _02004B38 - 2 ; case 41
	.short _02004E42 - _02004B38 - 2 ; case 42
	.short _02004E42 - _02004B38 - 2 ; case 43
	.short _02004E42 - _02004B38 - 2 ; case 44
	.short _02004E42 - _02004B38 - 2 ; case 45
	.short _02004E42 - _02004B38 - 2 ; case 46
	.short _02004E42 - _02004B38 - 2 ; case 47
	.short _02004E42 - _02004B38 - 2 ; case 48
	.short _02004E42 - _02004B38 - 2 ; case 49
	.short _02004E42 - _02004B38 - 2 ; case 50
	.short _02004D14 - _02004B38 - 2 ; case 51
	.short _02004D28 - _02004B38 - 2 ; case 52
	.short _02004D32 - _02004B38 - 2 ; case 53
	.short _02004D3C - _02004B38 - 2 ; case 54
	.short _02004D46 - _02004B38 - 2 ; case 55
	.short _02004D56 - _02004B38 - 2 ; case 56
	.short _02004D60 - _02004B38 - 2 ; case 57
	.short _02004D6A - _02004B38 - 2 ; case 58
	.short _02004D74 - _02004B38 - 2 ; case 59
	.short _02004D7E - _02004B38 - 2 ; case 60
	.short _02004D88 - _02004B38 - 2 ; case 61
	.short _02004D92 - _02004B38 - 2 ; case 62
	.short _02004D9C - _02004B38 - 2 ; case 63
	.short _02004D1E - _02004B38 - 2 ; case 64
	.short _02004D46 - _02004B38 - 2 ; case 65
	.short _02004DA6 - _02004B38 - 2 ; case 66
	.short _02004D28 - _02004B38 - 2 ; case 67
	.short _02004DC6 - _02004B38 - 2 ; case 68
	.short _02004DB6 - _02004B38 - 2 ; case 69
	.short _02004DDA - _02004B38 - 2 ; case 70
	.short _02004DEA - _02004B38 - 2 ; case 71
	.short _02004DFA - _02004B38 - 2 ; case 72
	.short _02004E0E - _02004B38 - 2 ; case 73
	.short _02004E22 - _02004B38 - 2 ; case 74
	.short _02004E32 - _02004B38 - 2 ; case 75
_02004BD0:
	mov r0, #1
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004BDA:
	mov r0, #1
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	ldr r0, _02004E4C ; =0x0000058F
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E50 ; =0x00000591
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E54 ; =0x00000593
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E58 ; =0x0000058E
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E5C ; =0x00000594
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E60 ; =0x00000596
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E64 ; =0x0000064F
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E68 ; =0x00000582
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E6C ; =0x00000722
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E70 ; =0x00000583
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E74 ; =0x00000584
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E78 ; =0x00000585
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E7C ; =0x00000587
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E80 ; =0x0000063D
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E84 ; =0x00000642
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E88 ; =0x0000058A
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E8C ; =0x00000581
	mov r1, #1
	bl sub_02004784
	b _02004E48
_02004C6C:
	mov r0, #0xe
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004C76:
	mov r0, #2
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004C80:
	mov r0, #3
	lsl r0, r0, #8
	bl sub_020047C8
	mov r0, #3
	lsl r0, r0, #8
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004C94:
	mov r0, #0xd
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004C9E:
	mov r0, #1
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CA8:
	mov r0, #2
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CB2:
	mov r0, #1
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CBC:
	mov r0, #0xb
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CC6:
	mov r0, #1
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CD0:
	mov r0, #0xe
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CDA:
	mov r0, #1
	bl GF_Snd_LoadGroup
	mov r0, #8
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CEA:
	mov r0, #1
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CF4:
	ldr r0, _02004E90 ; =0x00000302
	bl sub_020047C8
	ldr r0, _02004E90 ; =0x00000302
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004D04:
	ldr r0, _02004E94 ; =0x00000303
	bl sub_020047C8
	ldr r0, _02004E94 ; =0x00000303
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004D14:
	mov r0, #3
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D1E:
	mov r0, #6
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D28:
	mov r0, #5
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D32:
	mov r0, #9
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D3C:
	mov r0, #0xa
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D46:
	ldr r0, _02004E98 ; =0x000002F5
	bl sub_020047C8
	ldr r0, _02004E98 ; =0x000002F5
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004D56:
	mov r0, #0xc
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D60:
	mov r0, #7
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D6A:
	mov r0, #8
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D74:
	mov r0, #0xf
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D7E:
	mov r0, #3
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D88:
	mov r0, #5
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D92:
	mov r0, #0xf
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D9C:
	mov r0, #4
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004DA6:
	ldr r0, _02004E9C ; =0x000002FF
	bl sub_020047C8
	ldr r0, _02004E9C ; =0x000002FF
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004DB6:
	ldr r0, _02004EA0 ; =0x00000301
	bl sub_020047C8
	ldr r0, _02004EA0 ; =0x00000301
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004DC6:
	mov r0, #0xbf
	lsl r0, r0, #2
	bl sub_020047C8
	mov r0, #0xbf
	lsl r0, r0, #2
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004DDA:
	ldr r0, _02004EA4 ; =0x00000305
	bl sub_020047C8
	ldr r0, _02004EA4 ; =0x00000305
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004DEA:
	ldr r0, _02004EA8 ; =0x00000306
	bl sub_020047C8
	ldr r0, _02004EA8 ; =0x00000306
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004DFA:
	mov r0, #0xc1
	lsl r0, r0, #2
	bl sub_020047C8
	mov r0, #0xc1
	lsl r0, r0, #2
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004E0E:
	mov r0, #0xc2
	lsl r0, r0, #2
	bl sub_020047C8
	mov r0, #0xc2
	lsl r0, r0, #2
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004E22:
	ldr r0, _02004EAC ; =0x00000307
	bl sub_020047C8
	ldr r0, _02004EAC ; =0x00000307
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004E32:
	ldr r0, _02004EB0 ; =0x00000309
	bl sub_020047C8
	ldr r0, _02004EB0 ; =0x00000309
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004E42:
	bl GF_AssertFail
	mov r4, #0
_02004E48:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02004E4C: .word 0x0000058F
_02004E50: .word 0x00000591
_02004E54: .word 0x00000593
_02004E58: .word 0x0000058E
_02004E5C: .word 0x00000594
_02004E60: .word 0x00000596
_02004E64: .word 0x0000064F
_02004E68: .word 0x00000582
_02004E6C: .word 0x00000722
_02004E70: .word 0x00000583
_02004E74: .word 0x00000584
_02004E78: .word 0x00000585
_02004E7C: .word 0x00000587
_02004E80: .word 0x0000063D
_02004E84: .word 0x00000642
_02004E88: .word 0x0000058A
_02004E8C: .word 0x00000581
_02004E90: .word 0x00000302
_02004E94: .word 0x00000303
_02004E98: .word 0x000002F5
_02004E9C: .word 0x000002FF
_02004EA0: .word 0x00000301
_02004EA4: .word 0x00000305
_02004EA8: .word 0x00000306
_02004EAC: .word 0x00000307
_02004EB0: .word 0x00000309
	thumb_func_end sub_02004B24

	thumb_func_start sub_02004EB4
sub_02004EB4: ; 0x02004EB4
	ldr r3, _02004EC0 ; =sub_02004EC4
	add r1, r0, #0
	mov r0, #4
	mov r2, #1
	bx r3
	nop
_02004EC0: .word sub_02004EC4
	thumb_func_end sub_02004EB4

	thumb_func_start sub_02004EC4
sub_02004EC4: ; 0x02004EC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x15
	add r5, r1, #0
	add r6, r2, #0
	bl sub_02004400
	str r0, [sp]
	mov r0, #0x16
	bl sub_02004400
	str r0, [sp, #4]
	mov r0, #0xe
	bl sub_02004400
	add r7, r0, #0
	cmp r4, #0x33
	bhs _02004EF8
	ldr r0, [sp]
	ldrb r0, [r0]
	cmp r0, r4
	bne _02004F06
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02004EF8:
	ldr r0, [sp, #4]
	ldrb r0, [r0]
	cmp r0, r4
	bne _02004F06
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02004F06:
	add r0, r4, #0
	bl sub_02004AD8
	cmp r4, #0x4a
	bls _02004F12
	b _02005054
_02004F12:
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02004F1E: ; jump table
	.short _02005054 - _02004F1E - 2 ; case 0
	.short _02005006 - _02004F1E - 2 ; case 1
	.short _0200502A - _02004F1E - 2 ; case 2
	.short _0200503C - _02004F1E - 2 ; case 3
	.short _02004FB4 - _02004F1E - 2 ; case 4
	.short _02004FC8 - _02004F1E - 2 ; case 5
	.short _02004FDC - _02004F1E - 2 ; case 6
	.short _02004FE6 - _02004F1E - 2 ; case 7
	.short _0200503C - _02004F1E - 2 ; case 8
	.short _0200503C - _02004F1E - 2 ; case 9
	.short _0200503C - _02004F1E - 2 ; case 10
	.short _02004FD2 - _02004F1E - 2 ; case 11
	.short _0200503C - _02004F1E - 2 ; case 12
	.short _0200503C - _02004F1E - 2 ; case 13
	.short _02005018 - _02004F1E - 2 ; case 14
	.short _0200503C - _02004F1E - 2 ; case 15
	.short _0200503C - _02004F1E - 2 ; case 16
	.short _0200503C - _02004F1E - 2 ; case 17
	.short _0200503C - _02004F1E - 2 ; case 18
	.short _0200503C - _02004F1E - 2 ; case 19
	.short _0200503C - _02004F1E - 2 ; case 20
	.short _0200503C - _02004F1E - 2 ; case 21
	.short _02005048 - _02004F1E - 2 ; case 22
	.short _0200503C - _02004F1E - 2 ; case 23
	.short _0200503C - _02004F1E - 2 ; case 24
	.short _0200503C - _02004F1E - 2 ; case 25
	.short _02005054 - _02004F1E - 2 ; case 26
	.short _02005054 - _02004F1E - 2 ; case 27
	.short _02005054 - _02004F1E - 2 ; case 28
	.short _02005054 - _02004F1E - 2 ; case 29
	.short _02005054 - _02004F1E - 2 ; case 30
	.short _02005054 - _02004F1E - 2 ; case 31
	.short _02005054 - _02004F1E - 2 ; case 32
	.short _02005054 - _02004F1E - 2 ; case 33
	.short _02005054 - _02004F1E - 2 ; case 34
	.short _02005054 - _02004F1E - 2 ; case 35
	.short _02005054 - _02004F1E - 2 ; case 36
	.short _02005054 - _02004F1E - 2 ; case 37
	.short _02005054 - _02004F1E - 2 ; case 38
	.short _02005054 - _02004F1E - 2 ; case 39
	.short _02005054 - _02004F1E - 2 ; case 40
	.short _02005054 - _02004F1E - 2 ; case 41
	.short _02005054 - _02004F1E - 2 ; case 42
	.short _02005054 - _02004F1E - 2 ; case 43
	.short _02005054 - _02004F1E - 2 ; case 44
	.short _02005054 - _02004F1E - 2 ; case 45
	.short _02005054 - _02004F1E - 2 ; case 46
	.short _02005054 - _02004F1E - 2 ; case 47
	.short _02005054 - _02004F1E - 2 ; case 48
	.short _02005054 - _02004F1E - 2 ; case 49
	.short _02005054 - _02004F1E - 2 ; case 50
	.short _02004FF0 - _02004F1E - 2 ; case 51
	.short _02004FF0 - _02004F1E - 2 ; case 52
	.short _02004FF0 - _02004F1E - 2 ; case 53
	.short _02004FF0 - _02004F1E - 2 ; case 54
	.short _02004FF0 - _02004F1E - 2 ; case 55
	.short _02004FF0 - _02004F1E - 2 ; case 56
	.short _02004FF0 - _02004F1E - 2 ; case 57
	.short _02004FF0 - _02004F1E - 2 ; case 58
	.short _02004FF0 - _02004F1E - 2 ; case 59
	.short _02004FF0 - _02004F1E - 2 ; case 60
	.short _02004FF0 - _02004F1E - 2 ; case 61
	.short _02004FF0 - _02004F1E - 2 ; case 62
	.short _02004FF0 - _02004F1E - 2 ; case 63
	.short _02004FF0 - _02004F1E - 2 ; case 64
	.short _02004FF0 - _02004F1E - 2 ; case 65
	.short _02004FF0 - _02004F1E - 2 ; case 66
	.short _02004FF0 - _02004F1E - 2 ; case 67
	.short _02004FF8 - _02004F1E - 2 ; case 68
	.short _02004FF0 - _02004F1E - 2 ; case 69
	.short _02004FF0 - _02004F1E - 2 ; case 70
	.short _02004FF0 - _02004F1E - 2 ; case 71
	.short _02004FF0 - _02004F1E - 2 ; case 72
	.short _0200503C - _02004F1E - 2 ; case 73
	.short _02004FF0 - _02004F1E - 2 ; case 74
_02004FB4:
	mov r0, #0
	bl sub_02005AF8
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0200508C
	mov r0, #0
	strh r0, [r7]
	b _0200505A
_02004FC8:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02005228
	b _0200505A
_02004FD2:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02005260
	b _0200505A
_02004FDC:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02005280
	b _0200505A
_02004FE6:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020052A4
	b _0200505A
_02004FF0:
	add r0, r4, #0
	bl sub_020052C8
	b _0200505A
_02004FF8:
	add r0, r4, #0
	bl sub_020052C8
	add r0, r5, #0
	bl sub_02005D48
	b _0200505A
_02005006:
	mov r0, #1
	bl sub_02005AF8
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_020052E4
	b _0200505A
_02005018:
	mov r0, #2
	bl sub_02005AF8
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_020052E4
	b _0200505A
_0200502A:
	mov r0, #0
	bl sub_02005AF8
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_020052E4
	b _0200505A
_0200503C:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_020052E4
	b _0200505A
_02005048:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_020052E4
	b _0200505A
_02005054:
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0200505A:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02004EC4

	thumb_func_start sub_02005060
sub_02005060: ; 0x02005060
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl sub_02004400
	ldr r0, [r0]
	bl sub_02004714
	mov r0, #0x19
	bl sub_02004400
	bl GF_Snd_SaveState
	add r0, r4, #0
	bl sub_02004B24
	mov r0, #0x1a
	bl sub_02004400
	bl GF_Snd_SaveState
	pop {r4, pc}
	thumb_func_end sub_02005060

	thumb_func_start sub_0200508C
sub_0200508C: ; 0x0200508C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xc
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x18
	bl sub_02004400
	mov r0, #0x20
	bl sub_02004400
	mov r0, #0
	bl GetSoundPlayer
	bl sub_020054F0
	add r7, r0, #0
	lsl r0, r7, #0x10
	lsr r4, r0, #0x10
	ldr r0, _02005144 ; =0x000004C1
	cmp r7, r0
	ble _020050C2
	add r0, r4, #0
	bl sub_02005C98
	add r4, r0, #0
_020050C2:
	ldrb r0, [r6]
	cmp r0, #0
	bne _020050D6
	cmp r4, r5
	bne _020050D6
	bl sub_02004AAC
	ldr r1, _02005148 ; =0x000003F5
	cmp r0, r1
	bne _02005142
_020050D6:
	mov r0, #1
	bl sub_020059E0
	ldr r0, _0200514C ; =_021D05E8
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _020050EA
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _020050F4
_020050EA:
	bl sub_02005FD8
	ldr r0, _0200514C ; =_021D05E8
	mov r1, #1
	str r1, [r0, #4]
_020050F4:
	cmp r4, r5
	beq _02005104
	mov r0, #1
	mov r1, #0
	bl sub_020053A8
	bl sub_02005FA0
_02005104:
	ldrb r0, [r6]
	cmp r0, #1
	bne _0200513C
	mov r0, #2
	bl sub_02005328
	bl sub_02004714
	mov r0, #4
	bl sub_02004B24
	mov r0, #0x1a
	bl sub_02004400
	bl GF_Snd_SaveState
	cmp r4, r5
	beq _02005130
	mov r0, #1
	mov r1, #0
	bl sub_020053A8
_02005130:
	lsl r1, r7, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl sub_02005150
	pop {r3, r4, r5, r6, r7, pc}
_0200513C:
	add r0, r5, #0
	bl sub_02005D48
_02005142:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02005144: .word 0x000004C1
_02005148: .word 0x000003F5
_0200514C: .word _021D05E8
	thumb_func_end sub_0200508C

	thumb_func_start sub_02005150
sub_02005150: ; 0x02005150
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x20
	bl sub_02004400
	add r4, r0, #0
	ldrh r0, [r4]
	bl sub_02005504
	mov r1, #0xaf
	lsl r1, r1, #2
	cmp r0, r1
	bne _02005178
	add r0, r5, #0
	mov r1, #4
	bl sub_02004784
	bl GF_AssertFail
	b _02005180
_02005178:
	ldrh r0, [r4]
	mov r1, #6
	bl sub_02004784
_02005180:
	mov r0, #0x1b
	bl sub_02004400
	bl GF_Snd_SaveState
	mov r0, #1
	mov r1, #0
	bl sub_020053A8
	mov r0, #0x7f
	mov r1, #0x28
	mov r2, #0
	bl sub_02005F10
	mov r0, #0
	bl sub_020059E0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005150

	thumb_func_start sub_020051A4
sub_020051A4: ; 0x020051A4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x13
	add r5, r1, #0
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x20
	bl sub_02004400
	add r4, r0, #0
	ldrb r0, [r6]
	cmp r0, #1
	beq _020051C4
	cmp r5, #0
	bne _02005224
_020051C4:
	mov r0, #1
	bl sub_02005328
	bl sub_02004714
	mov r0, #0
	bl sub_02004AFC
	ldrh r0, [r4]
	mov r1, #2
	bl sub_02004784
	mov r0, #0x19
	bl sub_02004400
	bl GF_Snd_SaveState
	mov r0, #4
	bl sub_02004B24
	mov r0, #0x1a
	bl sub_02004400
	bl GF_Snd_SaveState
	ldrh r0, [r4]
	bl sub_02005504
	mov r1, #0xaf
	lsl r1, r1, #2
	cmp r0, r1
	bne _02005212
	add r0, r7, #0
	mov r1, #4
	bl sub_02004784
	bl GF_AssertFail
	b _0200521A
_02005212:
	ldrh r0, [r4]
	mov r1, #4
	bl sub_02004784
_0200521A:
	mov r0, #0x1b
	bl sub_02004400
	bl GF_Snd_SaveState
_02005224:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020051A4

	thumb_func_start sub_02005228
sub_02005228: ; 0x02005228
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl sub_02004400
	bl sub_02005B20
	mov r0, #2
	bl sub_02005328
	bl sub_02004714
	mov r0, #5
	bl sub_02004B24
	mov r0, #0x1a
	bl sub_02004400
	bl GF_Snd_SaveState
	mov r0, #1
	bl sub_020059E0
	add r0, r4, #0
	bl sub_02005D48
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005228

	thumb_func_start sub_02005260
sub_02005260: ; 0x02005260
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl sub_02004400
	bl sub_02005FA0
	bl sub_020053F0
	mov r0, #4
	bl sub_02005060
	add r0, r4, #0
	bl sub_02005D48
	pop {r4, pc}
	thumb_func_end sub_02005260

	thumb_func_start sub_02005280
sub_02005280: ; 0x02005280
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl sub_02004400
	bl sub_02005FA0
	mov r0, #6
	bl sub_02005060
	mov r0, #1
	bl sub_020059E0
	add r0, r4, #0
	bl sub_02005D48
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005280

	thumb_func_start sub_020052A4
sub_020052A4: ; 0x020052A4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl sub_02004400
	bl sub_02005FA0
	mov r0, #7
	bl sub_02005060
	mov r0, #1
	bl sub_020059E0
	add r0, r4, #0
	bl sub_02005D48
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020052A4

	thumb_func_start sub_020052C8
sub_020052C8: ; 0x020052C8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02005318
	add r0, r4, #0
	bl sub_02004B24
	mov r0, #0x1c
	bl sub_02004400
	bl GF_Snd_SaveState
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020052C8

	thumb_func_start sub_020052E4
sub_020052E4: ; 0x020052E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x18
	add r4, r1, #0
	bl sub_02004400
	bl sub_02005FA0
	add r0, r5, #0
	bl sub_02005060
	add r0, r4, #0
	bl sub_02005D48
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020052E4

	thumb_func_start sub_02005304
sub_02005304: ; 0x02005304
	push {r4, lr}
	add r4, r0, #0
	bl GetSoundDataPointer
	bl sub_02005B20
	add r0, r4, #0
	bl sub_02005D48
	pop {r4, pc}
	thumb_func_end sub_02005304

	thumb_func_start sub_02005318
sub_02005318: ; 0x02005318
	push {r3, lr}
	mov r0, #4
	bl sub_02005328
	bl sub_02004714
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005318

	thumb_func_start sub_02005328
sub_02005328: ; 0x02005328
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl GetSoundDataPointer
	cmp r4, #7
	blt _02005342
	bl GF_AssertFail
	mov r0, #0x1b
	bl sub_02004400
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
_02005342:
	cmp r4, #6
	bhi _020053A4
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02005352: ; jump table
	.short _02005360 - _02005352 - 2 ; case 0
	.short _0200536A - _02005352 - 2 ; case 1
	.short _02005374 - _02005352 - 2 ; case 2
	.short _0200537E - _02005352 - 2 ; case 3
	.short _02005388 - _02005352 - 2 ; case 4
	.short _02005392 - _02005352 - 2 ; case 5
	.short _0200539C - _02005352 - 2 ; case 6
_02005360:
	mov r0, #0x17
	bl sub_02004400
	add r5, r0, #0
	b _020053A4
_0200536A:
	mov r0, #0x18
	bl sub_02004400
	add r5, r0, #0
	b _020053A4
_02005374:
	mov r0, #0x19
	bl sub_02004400
	add r5, r0, #0
	b _020053A4
_0200537E:
	mov r0, #0x1a
	bl sub_02004400
	add r5, r0, #0
	b _020053A4
_02005388:
	mov r0, #0x1b
	bl sub_02004400
	add r5, r0, #0
	b _020053A4
_02005392:
	mov r0, #0x1c
	bl sub_02004400
	add r5, r0, #0
	b _020053A4
_0200539C:
	mov r0, #0x1d
	bl sub_02004400
	add r5, r0, #0
_020053A4:
	ldr r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005328

	thumb_func_start sub_020053A8
sub_020053A8: ; 0x020053A8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	cmp r0, #1
	bne _020053BC
	mov r0, #0xc
	bl sub_02004400
	add r6, r0, #0
	mov r4, #0
	b _020053CA
_020053BC:
	cmp r0, #7
	bne _020053EE
	mov r0, #0xd
	bl sub_02004400
	add r6, r0, #0
	mov r4, #7
_020053CA:
	cmp r5, #0
	bne _020053E0
	add r0, r4, #0
	bl GetSoundPlayer
	bl sub_020054F0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02004A60
_020053E0:
	add r0, r4, #0
	bl GetSoundPlayer
	add r1, r5, #0
	bl sub_020C815C
	strb r5, [r6]
_020053EE:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020053A8

	thumb_func_start sub_020053F0
sub_020053F0: ; 0x020053F0
	push {r4, lr}
	mov r0, #0xc
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0xd
	bl sub_02004400
	mov r1, #0
	strb r1, [r4]
	strb r1, [r0]
	pop {r4, pc}
	thumb_func_end sub_020053F0

	thumb_func_start sub_02005408
sub_02005408: ; 0x02005408
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r6, r0, #0
	bl GetSoundPlayer
	add r1, r5, #0
	add r2, r4, #0
	bl sub_020C8230
	cmp r6, #0
	bne _02005428
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_02004958
_02005428:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005408

	thumb_func_start sub_0200542C
sub_0200542C: ; 0x0200542C
	push {r4, lr}
	add r4, r1, #0
	bpl _02005434
	mov r4, #0
_02005434:
	cmp r4, #0x7f
	ble _0200543A
	mov r4, #0x7f
_0200543A:
	bl GetSoundPlayer
	add r1, r4, #0
	bl sub_020C821C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0200542C

	thumb_func_start sub_02005448
sub_02005448: ; 0x02005448
	push {r4, lr}
	add r4, r0, #0
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_020054D4
	bl sub_0200480C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02005464
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005448

	thumb_func_start sub_02005464
sub_02005464: ; 0x02005464
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl NNS_SndArcGetSeqParam
	cmp r5, #1
	beq _02005474
	cmp r5, #8
	bne _02005478
_02005474:
	mov r4, #0x7f
	b _0200547E
_02005478:
	cmp r0, #0
	beq _02005496
	ldrb r4, [r0, #2]
_0200547E:
	bl sub_020378CC
	cmp r0, #1
	bne _02005496
	add r0, r4, #0
	mov r1, #5
	bl _s32_div_f
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0200542C
_02005496:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005464

	thumb_func_start sub_02005498
sub_02005498: ; 0x02005498
	push {r3, lr}
	bl NNS_SndArcGetSeqParam
	cmp r0, #0
	bne _020054A6
	mov r0, #0
	pop {r3, pc}
_020054A6:
	ldrb r0, [r0, #2]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005498

	thumb_func_start sub_020054AC
sub_020054AC: ; 0x020054AC
	push {r4, lr}
	add r4, r1, #0
	bl sub_020054D4
	bl sub_0200480C
	add r1, r4, #0
	bl sub_0200542C
	pop {r4, pc}
	thumb_func_end sub_020054AC

	thumb_func_start GF_SndPlayerCountPlayingSeqByPlayerNo
GF_SndPlayerCountPlayingSeqByPlayerNo: ; 0x020054C0
	push {r4, lr}
	add r4, r0, #0
	bpl _020054CA
	bl GF_AssertFail
_020054CA:
	add r0, r4, #0
	bl sub_020C81F0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end GF_SndPlayerCountPlayingSeqByPlayerNo

	thumb_func_start sub_020054D4
sub_020054D4: ; 0x020054D4
	push {r3, lr}
	cmp r0, #0
	bne _020054DE
	mov r0, #0xff
	pop {r3, pc}
_020054DE:
	bl NNS_SndArcGetSeqParam
	cmp r0, #0
	bne _020054EA
	mov r0, #0xff
	pop {r3, pc}
_020054EA:
	ldrb r0, [r0, #5]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020054D4

	thumb_func_start sub_020054F0
sub_020054F0: ; 0x020054F0
	ldr r3, _020054F4 ; =NNS_SndPlayerGetSeqNo
	bx r3
	.balign 4, 0
_020054F4: .word NNS_SndPlayerGetSeqNo
	thumb_func_end sub_020054F0

	thumb_func_start sub_020054F8
sub_020054F8: ; 0x020054F8
	push {r3, lr}
	bl sub_02005504
	bl NNS_SndArcGetBankInfo
	pop {r3, pc}
	thumb_func_end sub_020054F8

	thumb_func_start sub_02005504
sub_02005504: ; 0x02005504
	push {r3, lr}
	bl NNS_SndArcGetSeqParam
	cmp r0, #0
	bne _02005512
	mov r0, #0
	pop {r3, pc}
_02005512:
	ldrh r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005504

	thumb_func_start sub_02005518
sub_02005518: ; 0x02005518
	ldr r3, _0200551C ; =sub_02004924
	bx r3
	.balign 4, 0
_0200551C: .word sub_02004924
	thumb_func_end sub_02005518

	thumb_func_start sub_02005520
sub_02005520: ; 0x02005520
	push {r4, lr}
	add r4, r0, #0
	bl sub_020DA9CC
	add r3, r0, #0
	ldr r0, _02005548 ; =_021D05E8
	mov r1, #1
	strb r1, [r0]
	ldr r2, _0200554C ; =_021D05F8
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	add r0, r3, #0
	pop {r4, pc}
	nop
_02005548: .word _021D05E8
_0200554C: .word _021D05F8
	thumb_func_end sub_02005520

	thumb_func_start sub_02005550
sub_02005550: ; 0x02005550
	push {r3, lr}
	bl GetSoundDataPointer
	ldr r0, _02005564 ; =_021D05E8
	mov r1, #0
	strb r1, [r0]
	bl sub_020DAA60
	pop {r3, pc}
	nop
_02005564: .word _021D05E8
	thumb_func_end sub_02005550

	thumb_func_start sub_02005568
sub_02005568: ; 0x02005568
	push {r3, lr}
	ldr r0, _02005580 ; =_021D05E8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200557E
	bl sub_020DAA60
	cmp r0, #0
	beq _0200557E
	bl GF_AssertFail
_0200557E:
	pop {r3, pc}
	.balign 4, 0
_02005580: .word _021D05E8
	thumb_func_end sub_02005568

	thumb_func_start sub_02005584
sub_02005584: ; 0x02005584
	push {r3, lr}
	ldr r0, _020055A4 ; =_021D05E8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200559C
	ldr r0, _020055A8 ; =_021D05F8
	bl sub_020DA9CC
	cmp r0, #0
	beq _0200559C
	bl GF_AssertFail
_0200559C:
	bl sub_02004940
	pop {r3, pc}
	nop
_020055A4: .word _021D05E8
_020055A8: .word _021D05F8
	thumb_func_end sub_02005584

	thumb_func_start sub_020055AC
sub_020055AC: ; 0x020055AC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl GetSoundDataPointer
	mov r0, #0x10
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x11
	bl sub_02004400
	add r4, r0, #0
	cmp r5, #0xe
	beq _020055D0
	cmp r5, #0xf
	beq _020055D0
	bl GF_AssertFail
_020055D0:
	cmp r5, #0xe
	bne _020055DE
	ldrb r0, [r6]
	cmp r0, #0
	bne _020055DE
	bl GF_AssertFail
_020055DE:
	cmp r5, #0xf
	bne _020055EC
	ldrb r0, [r4]
	cmp r0, #0
	bne _020055EC
	bl GF_AssertFail
_020055EC:
	cmp r5, #0xe
	bne _020055F8
	mov r0, #0
	bl sub_02004400
	pop {r4, r5, r6, pc}
_020055F8:
	mov r0, #1
	bl sub_02004400
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020055AC

	thumb_func_start sub_02005600
sub_02005600: ; 0x02005600
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl GetSoundDataPointer
	mov r0, #0x10
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x11
	bl sub_02004400
	add r4, r0, #0
	cmp r5, #0xe
	beq _02005624
	cmp r5, #0xf
	beq _02005624
	bl GF_AssertFail
_02005624:
	cmp r5, #0xe
	bne _02005652
	ldrb r0, [r6]
	cmp r0, #0
	bne _0200564C
	mov r0, #0
	bl sub_02004400
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020C7C90
	str r0, [r4]
	cmp r0, #0
	bne _02005646
	mov r0, #0
	pop {r4, r5, r6, pc}
_02005646:
	mov r0, #1
	strb r0, [r6]
	b _0200567A
_0200564C:
	bl GF_AssertFail
	b _0200567A
_02005652:
	ldrb r0, [r4]
	cmp r0, #0
	bne _02005676
	mov r0, #1
	bl sub_02004400
	add r6, r0, #0
	add r0, r5, #0
	bl sub_020C7C90
	str r0, [r6]
	cmp r0, #0
	bne _02005670
	mov r0, #0
	pop {r4, r5, r6, pc}
_02005670:
	mov r0, #1
	strb r0, [r4]
	b _0200567A
_02005676:
	bl GF_AssertFail
_0200567A:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005600

	thumb_func_start sub_02005680
sub_02005680: ; 0x02005680
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl GetSoundDataPointer
	mov r0, #0x10
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x11
	bl sub_02004400
	add r4, r0, #0
	cmp r5, #0xe
	beq _020056A6
	cmp r5, #0xf
	beq _020056A6
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_020056A6:
	cmp r5, #0xe
	bne _020056C8
	ldrb r0, [r6]
	cmp r0, #1
	bne _020056C2
	add r0, r5, #0
	bl sub_020055AC
	ldr r0, [r0]
	bl sub_020C7CD4
	mov r0, #0
	strb r0, [r6]
	pop {r4, r5, r6, pc}
_020056C2:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_020056C8:
	ldrb r0, [r4]
	cmp r0, #1
	bne _020056E0
	add r0, r5, #0
	bl sub_020055AC
	ldr r0, [r0]
	bl sub_020C7CD4
	mov r0, #0
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_020056E0:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005680

	thumb_func_start sub_020056E8
sub_020056E8: ; 0x020056E8
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r3, r0, #0
	ldr r0, [r3, #0x10]
	add r4, r1, #0
	str r0, [sp]
	ldr r0, [r3, #0x14]
	str r0, [sp, #4]
	ldr r0, [r3, #0x18]
	str r0, [sp, #8]
	ldr r0, [r3, #0x1c]
	str r0, [sp, #0xc]
	ldr r0, [r3, #0x20]
	str r0, [sp, #0x10]
	ldr r0, [r3, #0x24]
	str r0, [sp, #0x14]
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r2, [r3, #8]
	ldr r0, [r0]
	ldr r3, [r3, #0xc]
	bl sub_020C7CEC
	add r5, r0, #0
	bne _02005720
	add r0, r4, #0
	bl sub_02005680
_02005720:
	add r0, r5, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020056E8

	thumb_func_start sub_02005728
sub_02005728: ; 0x02005728
	push {r3, lr}
	bl sub_020055AC
	ldr r0, [r0]
	bl sub_020C7E0C
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005728

	thumb_func_start sub_02005738
sub_02005738: ; 0x02005738
	push {r3, lr}
	bl sub_020055AC
	ldr r0, [r0]
	bl sub_020C7F18
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005738

	thumb_func_start sub_02005748
sub_02005748: ; 0x02005748
	push {r4, lr}
	add r4, r1, #0
	cmp r4, #0x7f
	bls _02005752
	mov r4, #0x7f
_02005752:
	bl sub_020055AC
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_020C7EF4
	pop {r4, pc}
	thumb_func_end sub_02005748

	thumb_func_start sub_02005760
sub_02005760: ; 0x02005760
	push {r4, lr}
	add r4, r1, #0
	bl sub_020055AC
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_020C7E70
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005760

	thumb_func_start sub_02005774
sub_02005774: ; 0x02005774
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl sub_020378CC
	cmp r0, #1
	bne _0200579C
	add r0, r4, #0
	bl sub_020055AC
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #5
	bl _s32_div_f
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_020C7E48
	pop {r3, r4, r5, pc}
_0200579C:
	add r0, r4, #0
	bl sub_020055AC
	ldr r0, [r0]
	add r1, r5, #0
	bl sub_020C7E48
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005774

	thumb_func_start sub_020057AC
sub_020057AC: ; 0x020057AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r6, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	add r5, r3, #0
	bl GetSoundDataPointer
	mov r0, #0x22
	bl sub_02004400
	add r4, r0, #0
	cmp r5, #0xe
	beq _020057D0
	cmp r5, #0xf
	beq _020057D0
	bl GF_AssertFail
_020057D0:
	add r0, r6, #0
	bl sub_020C9788
	add r7, r0, #0
	bne _020057E4
	bl GF_AssertFail
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020057E4:
	ldr r0, [r7]
	lsl r0, r0, #8
	lsr r0, r0, #8
	bl sub_020C98B4
	add r6, r0, #0
	bne _020057FC
	bl GF_AssertFail
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020057FC:
	cmp r5, #0xe
	bne _0200584A
	ldr r0, [sp, #0x48]
	add r1, r6, #0
	bl AllocFromHeap
	str r0, [r4]
	cmp r0, #0
	bne _02005818
	bl GF_AssertFail
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02005818:
	mov r1, #0
	add r2, r6, #0
	bl memset
	ldr r0, [r7]
	ldr r1, [r4]
	lsl r0, r0, #8
	lsr r0, r0, #8
	add r2, r6, #0
	mov r3, #0
	bl sub_020C98DC
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02005842
	bl GF_AssertFail
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02005842:
	ldr r0, [r4]
	add r1, r6, #0
	bl sub_02005898
_0200584A:
	add r0, r5, #0
	bl sub_020055AC
	mov r1, #0
	str r1, [sp, #0xc]
	str r0, [sp, #8]
	ldr r0, [r4]
	str r0, [sp, #0x10]
	ldr r0, _02005894 ; =0x00003443
	str r1, [sp, #0x14]
	str r0, [sp, #0x20]
	ldr r0, [sp]
	str r1, [sp, #0x18]
	str r0, [sp, #0x24]
	mov r0, #6
	lsl r0, r0, #0xc
	str r0, [sp, #0x28]
	ldr r0, [sp, #4]
	add r1, r5, #0
	str r0, [sp, #0x2c]
	add r0, sp, #8
	str r6, [sp, #0x1c]
	bl sub_020056E8
	add r4, r0, #0
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_02005774
	mov r0, #0xf
	bl sub_02004400
	mov r1, #1
	strb r1, [r0]
	add r0, r4, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02005894: .word 0x00003443
	thumb_func_end sub_020057AC

	thumb_func_start sub_02005898
sub_02005898: ; 0x02005898
	push {r3, r4, r5, r6}
	mov r5, #0
	lsr r6, r1, #1
	beq _020058B2
	sub r2, r1, #1
_020058A2:
	sub r3, r2, r5
	ldrb r4, [r0, r5]
	ldrb r1, [r0, r3]
	strb r1, [r0, r5]
	add r5, r5, #1
	strb r4, [r0, r3]
	cmp r5, r6
	blo _020058A2
_020058B2:
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02005898

	thumb_func_start sub_020058B8
sub_020058B8: ; 0x020058B8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl GetSoundDataPointer
	mov r0, #0xf
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0x22
	bl sub_02004400
	add r6, r0, #0
	cmp r5, #0xe
	beq _020058DC
	cmp r5, #0xf
	beq _020058DC
	bl GF_AssertFail
_020058DC:
	add r0, r5, #0
	bl sub_02005728
	ldrb r0, [r4]
	cmp r0, #1
	bne _020058F2
	mov r0, #0
	strb r0, [r4]
	ldr r0, [r6]
	bl FreeToHeap
_020058F2:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020058B8

	thumb_func_start sub_020058F4
sub_020058F4: ; 0x020058F4
	push {r4, lr}
	bl sub_020C906C
	add r4, r0, #0
	cmp r4, #1
	bne _02005904
	bl sub_02005908
_02005904:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_020058F4

	thumb_func_start sub_02005908
sub_02005908: ; 0x02005908
	ldr r3, _0200590C ; =sub_020C907C
	bx r3
	.balign 4, 0
_0200590C: .word sub_020C907C
	thumb_func_end sub_02005908

	thumb_func_start sub_02005910
sub_02005910: ; 0x02005910
	ldr r3, _02005914 ; =sub_020C9014
	bx r3
	.balign 4, 0
_02005914: .word sub_020C9014
	thumb_func_end sub_02005910

	thumb_func_start sub_02005918
sub_02005918: ; 0x02005918
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl GetSoundPlayer
	add r1, r5, #0
	add r2, r4, #0
	bl sub_020C827C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005918

	thumb_func_start sub_0200592C
sub_0200592C: ; 0x0200592C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_020054D4
	bl sub_0200480C
	add r1, r5, #0
	add r2, r4, #0
	bl sub_02005918
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0200592C

	thumb_func_start sub_02005944
sub_02005944: ; 0x02005944
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_0200480C
	add r1, r5, #0
	add r2, r4, #0
	bl sub_02005918
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005944

	thumb_func_start sub_02005958
sub_02005958: ; 0x02005958
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl GetSoundPlayer
	add r1, r5, #0
	add r2, r4, #0
	bl sub_020C829C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005958

	thumb_func_start sub_0200596C
sub_0200596C: ; 0x0200596C
	push {r4, lr}
	add r4, r1, #0
	bl GetSoundPlayer
	add r1, r4, #0
	bl sub_020C82DC
	pop {r4, pc}
	thumb_func_end sub_0200596C

	thumb_func_start GF_SndSetMonoFlag
GF_SndSetMonoFlag: ; 0x0200597C
	push {r4, lr}
	add r4, r0, #0
	bl NNS_SndSetMonoFlag
	ldr r0, _0200598C ; =_021D05E8
	str r4, [r0, #8]
	pop {r4, pc}
	nop
_0200598C: .word _021D05E8
	thumb_func_end GF_SndSetMonoFlag

	thumb_func_start sub_02005990
sub_02005990: ; 0x02005990
	push {r4, lr}
	add r4, r0, #0
	mov r0, #7
	bl sub_02004400
	str r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005990

	thumb_func_start sub_020059A0
sub_020059A0: ; 0x020059A0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #8
	bl sub_02004400
	str r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020059A0

	thumb_func_start sub_020059B0
sub_020059B0: ; 0x020059B0
	push {r3, lr}
	mov r0, #8
	bl sub_02004400
	ldrh r1, [r0]
	cmp r1, #0
	bne _020059C6
	mov r1, #0
	strh r1, [r0]
	add r0, r1, #0
	pop {r3, pc}
_020059C6:
	sub r1, r1, #1
	strh r1, [r0]
	ldrh r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020059B0

	thumb_func_start sub_020059D0
sub_020059D0: ; 0x020059D0
	ldr r3, _020059D4 ; =sub_020C7988
	bx r3
	.balign 4, 0
_020059D4: .word sub_020C7988
	thumb_func_end sub_020059D0

	thumb_func_start sub_020059D8
sub_020059D8: ; 0x020059D8
	ldr r0, _020059DC ; =_021D0620
	bx lr
	.balign 4, 0
_020059DC: .word _021D0620
	thumb_func_end sub_020059D8

	thumb_func_start sub_020059E0
sub_020059E0: ; 0x020059E0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x13
	bl sub_02004400
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020059E0

	thumb_func_start sub_020059F0
sub_020059F0: ; 0x020059F0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	str r3, [sp]
	ldr r0, [sp, #0x18]
	add r1, r6, #0
	str r0, [sp, #4]
	mov r0, #4
	add r2, r5, #0
	add r3, r4, #0
	bl sub_02005A10
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020059F0

	thumb_func_start sub_02005A10
sub_02005A10: ; 0x02005A10
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x16
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	bl sub_02004400
	add r4, r0, #0
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	ldr r3, [sp, #8]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, [sp, #0x24]
	add r2, r7, #0
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_02005AB0
	mov r0, #0
	strb r0, [r4]
	mov r0, #5
	bl sub_020043B0
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02005A10

	thumb_func_start sub_02005A4C
sub_02005A4C: ; 0x02005A4C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r0, #0
	str r3, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	add r5, r1, #0
	add r4, r2, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	add r1, r6, #0
	str r0, [sp, #8]
	mov r0, #4
	add r2, r5, #0
	add r3, r4, #0
	bl sub_02005A74
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005A4C

	thumb_func_start sub_02005A74
sub_02005A74: ; 0x02005A74
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #9
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	bl sub_02004400
	add r4, r0, #0
	add r0, sp, #0x10
	ldrb r0, [r0, #0x14]
	ldr r3, [sp, #8]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, [sp, #0x28]
	add r2, r7, #0
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_02005AB0
	ldr r0, [sp, #0x20]
	str r0, [r4]
	mov r0, #6
	bl sub_020043B0
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02005A74

	thumb_func_start sub_02005AB0
sub_02005AB0: ; 0x02005AB0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	mov r0, #2
	add r5, r1, #0
	add r7, r3, #0
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0
	add r1, r6, #0
	bl sub_02005F50
	mov r0, #0
	bl sub_02004A60
	add r0, r5, #0
	bl sub_02004A9C
	add r0, r7, #0
	bl sub_020059A0
	add r0, r5, #0
	bl sub_020054F8
	str r0, [r4]
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	bl sub_020059E0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02005AB0

	thumb_func_start sub_02005AEC
sub_02005AEC: ; 0x02005AEC
	ldr r3, _02005AF4 ; =sub_020C7FAC
	add r1, r0, #0
	mov r0, #7
	bx r3
	.balign 4, 0
_02005AF4: .word sub_020C7FAC
	thumb_func_end sub_02005AEC

	thumb_func_start sub_02005AF8
sub_02005AF8: ; 0x02005AF8
	push {r3, lr}
	cmp r0, #0
	bne _02005B0C
	ldr r0, _02005B18 ; =0x0000A7FE
	bl sub_02005AEC
	mov r0, #0
	bl sub_02005910
	b _02005B12
_02005B0C:
	ldr r0, _02005B1C ; =0x00003FFF
	bl sub_02005AEC
_02005B12:
	bl sub_020058F4
	pop {r3, pc}
	.balign 4, 0
_02005B18: .word 0x0000A7FE
_02005B1C: .word 0x00003FFF
	thumb_func_end sub_02005AF8

	thumb_func_start sub_02005B20
sub_02005B20: ; 0x02005B20
	push {r3, lr}
	bl sub_02005F88
	cmp r0, #0
	bne _02005B4A
	mov r0, #0
	bl GetSoundPlayer
	bl sub_020054F0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02005B4A
	bl sub_02005FD8
	mov r0, #1
	add r1, r0, #0
	bl sub_020053A8
	pop {r3, pc}
_02005B4A:
	bl sub_02005FA0
	pop {r3, pc}
	thumb_func_end sub_02005B20

	thumb_func_start sub_02005B50
sub_02005B50: ; 0x02005B50
	ldr r3, _02005B54 ; =sub_020C7F74
	bx r3
	.balign 4, 0
_02005B54: .word sub_020C7F74
	thumb_func_end sub_02005B50

	thumb_func_start sub_02005B58
sub_02005B58: ; 0x02005B58
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x35
	bl sub_02004400
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005B58

	thumb_func_start sub_02005B68
sub_02005B68: ; 0x02005B68
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x36
	bl sub_02004400
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005B68

	thumb_func_start sub_02005B78
sub_02005B78: ; 0x02005B78
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bne _02005B86
	bl GF_AssertFail
_02005B86:
	cmp r4, #0xf
	bls _02005B8E
	bl GF_AssertFail
_02005B8E:
	add r0, r5, #0
	bl sub_020054D4
	bl sub_0200480C
	bl GetSoundPlayer
	add r1, r4, #0
	add r2, r6, #0
	bl sub_020C8374
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005B78

	thumb_func_start sub_02005BA8
sub_02005BA8: ; 0x02005BA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x37
	bl sub_02004400
	add r4, r0, #0
	ldrb r1, [r4]
	add r0, r5, #0
	lsl r2, r1, #2
	ldr r1, _02005BE0 ; =0x020F5711
	ldrb r1, [r1, r2]
	bl sub_020054AC
	ldrb r2, [r4]
	ldr r1, _02005BE4 ; =0x0000FFFF
	mov r0, #4
	lsl r3, r2, #2
	ldr r2, _02005BE8 ; =0x020F5710
	ldrb r2, [r2, r3]
	bl sub_02005918
	ldrb r0, [r4, #1]
	cmp r0, #8
	blo _02005BDC
	mov r0, #0
	strb r0, [r4, #1]
_02005BDC:
	pop {r3, r4, r5, pc}
	nop
_02005BE0: .word 0x020F5711
_02005BE4: .word 0x0000FFFF
_02005BE8: .word 0x020F5710
	thumb_func_end sub_02005BA8

	thumb_func_start sub_02005BEC
sub_02005BEC: ; 0x02005BEC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x38
	bl sub_02004400
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005BEC

	thumb_func_start sub_02005BFC
sub_02005BFC: ; 0x02005BFC
	push {r3, lr}
	mov r0, #0x38
	bl sub_02004400
	ldrb r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02005BFC

	thumb_func_start sub_02005C08
sub_02005C08: ; 0x02005C08
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x39
	bl sub_02004400
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005C08

	thumb_func_start sub_02005C18
sub_02005C18: ; 0x02005C18
	push {r3, lr}
	mov r0, #0x39
	bl sub_02004400
	ldrb r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02005C18

	thumb_func_start sub_02005C24
sub_02005C24: ; 0x02005C24
	push {r3, r4, r5, lr}
	bl sub_02005C18
	cmp r0, #0
	bne _02005C36
	mov r0, #1
	bl sub_02005C08
	b _02005C3C
_02005C36:
	mov r0, #0
	bl sub_02005C08
_02005C3C:
	bl sub_02004AAC
	cmp r0, #0
	bne _02005C6A
	bl sub_02004A90
	add r4, r0, #0
	bl sub_0200496C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02005C6C
	cmp r4, r0
	beq _02005C60
	add r0, r4, #0
	bl sub_02005D48
_02005C60:
	mov r0, #0
	add r1, r5, #0
	add r2, r0, #0
	bl sub_02005408
_02005C6A:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005C24

	thumb_func_start sub_02005C6C
sub_02005C6C: ; 0x02005C6C
	push {r3, r4}
	ldr r2, _02005C90 ; =0x020F5730
	mov r4, #0
_02005C72:
	lsl r3, r4, #2
	ldrh r1, [r2, r3]
	cmp r0, r1
	bne _02005C82
	ldr r0, _02005C94 ; =0x020F5732
	ldrh r0, [r0, r3]
	pop {r3, r4}
	bx lr
_02005C82:
	add r1, r4, #1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r4, #0x88
	blo _02005C72
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02005C90: .word 0x020F5730
_02005C94: .word 0x020F5732
	thumb_func_end sub_02005C6C

	thumb_func_start sub_02005C98
sub_02005C98: ; 0x02005C98
	push {r3, r4}
	ldr r2, _02005CBC ; =0x020F5730
	mov r4, #0
_02005C9E:
	lsl r3, r4, #2
	add r1, r2, r3
	ldrh r1, [r1, #2]
	cmp r0, r1
	bne _02005CAE
	ldrh r0, [r2, r3]
	pop {r3, r4}
	bx lr
_02005CAE:
	add r1, r4, #1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r4, #0x88
	blo _02005C9E
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02005CBC: .word 0x020F5730
	thumb_func_end sub_02005C98

	thumb_func_start sub_02005CC0
sub_02005CC0: ; 0x02005CC0
	push {r3, lr}
	mov r0, #0
	bl GetSoundPlayer
	ldr r2, _02005CF0 ; =0x0000A7FE
	mov r1, #0xf
	bl sub_020C82BC
	mov r0, #7
	bl GetSoundPlayer
	ldr r2, _02005CF0 ; =0x0000A7FE
	mov r1, #0xf
	bl sub_020C82BC
	mov r0, #2
	bl GetSoundPlayer
	ldr r2, _02005CF0 ; =0x0000A7FE
	mov r1, #0xf
	bl sub_020C82BC
	pop {r3, pc}
	nop
_02005CF0: .word 0x0000A7FE
	thumb_func_end sub_02005CC0

	thumb_func_start sub_02005CF4
sub_02005CF4: ; 0x02005CF4
	ldr r1, _02005CFC ; =_021D05E8
	str r0, [r1, #0xc]
	bx lr
	nop
_02005CFC: .word _021D05E8
	thumb_func_end sub_02005CF4

	thumb_func_start sub_02005D00
sub_02005D00: ; 0x02005D00
	ldr r0, _02005D0C ; =_021D05E8
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #4]
	bx lr
	nop
_02005D0C: .word _021D05E8
	thumb_func_end sub_02005D00

	thumb_func_start sub_02005D10
sub_02005D10: ; 0x02005D10
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	bl sub_020054D4
	bl sub_0200480C
	str r5, [sp]
	mov r1, #1
	str r1, [sp, #4]
	sub r1, r1, #2
	add r2, r1, #0
	add r3, r1, #0
	add r4, r0, #0
	bl sub_02006C14
	add r6, r0, #0
	bne _02005D3A
	add r0, r5, #0
	bl sub_02004920
_02005D3A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02005DA0
	add r0, r6, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02005D10

	thumb_func_start sub_02005D48
sub_02005D48: ; 0x02005D48
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl sub_020054D4
	add r5, r0, #0
	bl sub_0200480C
	add r6, r0, #0
	cmp r5, #7
	bne _02005D6A
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_02005DC4
	add r5, r0, #0
	b _02005D84
_02005D6A:
	cmp r5, #1
	bne _02005D7C
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_02005DF4
	add r5, r0, #0
	b _02005D84
_02005D7C:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
_02005D84:
	mov r0, #0
	bl sub_020059E0
	cmp r5, #0
	bne _02005D94
	add r0, r4, #0
	bl sub_02004920
_02005D94:
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02005DA0
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02005D48

	thumb_func_start sub_02005DA0
sub_02005DA0: ; 0x02005DA0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02004A60
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02005464
	mov r0, #1
	bl sub_020043B0
	cmp r4, #0
	bne _02005DC2
	mov r0, #0x80
	bl sub_02004958
_02005DC2:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005DA0

	thumb_func_start sub_02005DC4
sub_02005DC4: ; 0x02005DC4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #3
	add r4, r2, #0
	bl sub_02005328
	bl sub_02004714
	add r0, r5, #0
	bl sub_02004764
	str r5, [sp]
	mov r1, #1
	str r1, [sp, #4]
	sub r1, r1, #2
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02006C14
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02005DC4

	thumb_func_start sub_02005DF4
sub_02005DF4: ; 0x02005DF4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x13
	add r6, r2, #0
	bl sub_02004400
	mov r0, #0x20
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0
	bl GetSoundPlayer
	bl sub_020054F0
	bl sub_02005504
	add r1, r0, #0
	add r0, r5, #0
	bl sub_020051A4
	mov r0, #0
	bl sub_02004A08
	ldrh r0, [r4]
	bl sub_02005504
	add r2, r0, #0
	str r5, [sp]
	mov r1, #1
	str r1, [sp, #4]
	sub r1, r1, #2
	add r0, r6, #0
	add r3, r1, #0
	bl sub_02006C14
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005DF4

	thumb_func_start sub_02005E44
sub_02005E44: ; 0x02005E44
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x15
	bl sub_02004400
	ldrb r0, [r0]
	cmp r0, #4
	beq _02005E60
	bl GF_AssertFail
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_02005E60:
	add r0, r4, #0
	bl sub_020054D4
	cmp r0, #7
	beq _02005E74
	bl GF_AssertFail
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_02005E74:
	add r0, r4, #0
	mov r1, #1
	bl sub_02004784
	str r4, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #7
	add r1, r0, #0
	sub r1, #8
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02006C14
	add r5, r0, #0
	bne _02005E9A
	add r0, r4, #0
	bl sub_02004920
_02005E9A:
	mov r0, #0
	bl sub_02004A08
	add r0, r4, #0
	bl sub_02004A60
	mov r0, #1
	bl sub_020043B0
	add r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02005E44

	thumb_func_start sub_02005EB4
sub_02005EB4: ; 0x02005EB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020C80C4
	add r0, r5, #0
	bl sub_02005C6C
	cmp r5, r0
	beq _02005ECE
	add r1, r4, #0
	bl sub_020C80C4
_02005ECE:
	add r0, r5, #0
	bl sub_020054D4
	cmp r0, #0xff
	beq _02005EE4
	bl sub_0200480C
	bl GetSoundPlayer
	bl NNS_SndHandleReleaseSeq
_02005EE4:
	bl sub_02005EEC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02005EB4

	thumb_func_start sub_02005EEC
sub_02005EEC: ; 0x02005EEC
	push {r3, lr}
	mov r0, #0
	bl sub_02004A08
	mov r0, #0
	bl sub_02004A60
	mov r0, #0
	bl sub_02004A9C
	mov r0, #0
	bl sub_02004AB8
	mov r0, #0
	bl sub_020043B0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005EEC

	thumb_func_start sub_02005F10
sub_02005F10: ; 0x02005F10
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	bl sub_02004A90
	bl sub_020054D4
	cmp r0, #0xff
	beq _02005F4C
	bl sub_0200480C
	add r7, r0, #0
	cmp r4, #0
	bne _02005F36
	mov r1, #0
	add r2, r1, #0
	bl sub_02005408
_02005F36:
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	bl sub_02005408
	add r0, r5, #0
	bl sub_02005990
	mov r0, #3
	bl sub_020043B0
_02005F4C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02005F10

	thumb_func_start sub_02005F50
sub_02005F50: ; 0x02005F50
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02004A90
	bl sub_020054D4
	add r6, r0, #0
	cmp r6, #0xff
	beq _02005F86
	bl sub_02005F88
	cmp r0, #0
	bne _02005F80
	add r0, r6, #0
	bl sub_0200480C
	add r1, r5, #0
	add r2, r4, #0
	bl sub_02005408
	add r0, r4, #0
	bl sub_02005990
_02005F80:
	mov r0, #4
	bl sub_020043B0
_02005F86:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02005F50

	thumb_func_start sub_02005F88
sub_02005F88: ; 0x02005F88
	push {r3, lr}
	mov r0, #7
	bl sub_02004400
	ldrh r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02005F88

	thumb_func_start sub_02005F94
sub_02005F94: ; 0x02005F94
	push {r3, lr}
	bl sub_020054D4
	bl GF_SndPlayerCountPlayingSeqByPlayerNo
	pop {r3, pc}
	thumb_func_end sub_02005F94

	thumb_func_start sub_02005FA0
sub_02005FA0: ; 0x02005FA0
	push {r3, r4, r5, lr}
	mov r0, #0x10
	bl sub_02004400
	add r5, r0, #0
	mov r0, #0x11
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0
	bl sub_020C811C
	ldrb r0, [r5]
	cmp r0, #1
	bne _02005FC4
	mov r0, #0xe
	bl sub_02005728
_02005FC4:
	ldrb r0, [r4]
	cmp r0, #1
	bne _02005FD0
	mov r0, #0xf
	bl sub_02005728
_02005FD0:
	mov r0, #0
	bl sub_020043B0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005FA0

	thumb_func_start sub_02005FD8
sub_02005FD8: ; 0x02005FD8
	push {r3, r4, r5, r6, r7, lr}
	mov r0, #0x10
	bl sub_02004400
	add r7, r0, #0
	mov r0, #0x11
	bl sub_02004400
	add r6, r0, #0
	mov r0, #7
	bl GetSoundPlayer
	mov r1, #0
	bl sub_020C8058
	bl sub_02005EEC
	mov r5, #0
	add r4, r5, #0
_02005FFE:
	add r0, r5, #3
	add r1, r4, #0
	bl sub_0200615C
	add r5, r5, #1
	cmp r5, #4
	blt _02005FFE
	mov r0, #0
	bl sub_02006300
	ldrb r0, [r7]
	cmp r0, #1
	bne _0200601E
	mov r0, #0xe
	bl sub_02005728
_0200601E:
	ldrb r0, [r6]
	cmp r0, #1
	bne _0200602A
	mov r0, #0xf
	bl sub_02005728
_0200602A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02005FD8

	thumb_func_start sub_0200602C
sub_0200602C: ; 0x0200602C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl PlaySE
	add r6, r0, #0
	ldr r1, _02006048 ; =0x0000FFFF
	add r0, r5, #0
	add r2, r4, #0
	bl sub_020061B4
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_02006048: .word 0x0000FFFF
	thumb_func_end sub_0200602C

	thumb_func_start PlaySE
PlaySE: ; 0x0200604C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl sub_020054D4
	bl sub_0200480C
	mov r1, #0
	mvn r1, r1
	add r2, r1, #0
	add r3, r1, #0
	str r4, [sp]
	bl sub_020060BC
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end PlaySE

	thumb_func_start sub_0200606C
sub_0200606C: ; 0x0200606C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0200480C
	mov r2, #0
	mvn r2, r2
	add r1, r4, #0
	add r3, r2, #0
	str r5, [sp]
	bl sub_020060BC
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0200606C

	thumb_func_start sub_02006088
sub_02006088: ; 0x02006088
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0x20
	bl sub_02004400
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020054D4
	bl sub_0200480C
	add r6, r0, #0
	ldrh r0, [r4]
	bl sub_02005504
	mov r1, #0
	mvn r1, r1
	add r2, r0, #0
	add r0, r6, #0
	add r3, r1, #0
	str r5, [sp]
	bl sub_020060BC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02006088

	thumb_func_start sub_020060BC
sub_020060BC: ; 0x020060BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	ldr r5, [sp, #0x20]
	bl sub_02005BFC
	cmp r0, #1
	bne _020060E0
	ldr r0, _02006114 ; =0x000005DC
	sub r0, r5, r0
	cmp r0, #1
	bhi _020060E0
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_020060E0:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_02006C14
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02005464
	cmp r4, #0
	bne _0200610C
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl sub_02004920
_0200610C:
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02006114: .word 0x000005DC
	thumb_func_end sub_020060BC

	thumb_func_start sub_02006118
sub_02006118: ; 0x02006118
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl PlaySE
	add r6, r0, #0
	beq _0200612E
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020054AC
_0200612E:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02006118

	thumb_func_start sub_02006134
sub_02006134: ; 0x02006134
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl PlaySE
	add r6, r0, #0
	beq _0200614C
	ldr r1, _02006150 ; =0x0000FFFF
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0200592C
_0200614C:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02006150: .word 0x0000FFFF
	thumb_func_end sub_02006134

	thumb_func_start sub_02006154
sub_02006154: ; 0x02006154
	ldr r3, _02006158 ; =sub_020C80C4
	bx r3
	.balign 4, 0
_02006158: .word sub_020C80C4
	thumb_func_end sub_02006154

	thumb_func_start sub_0200615C
sub_0200615C: ; 0x0200615C
	push {r4, lr}
	add r4, r1, #0
	bl GetSoundPlayer
	add r1, r4, #0
	bl sub_020C8058
	pop {r4, pc}
	thumb_func_end sub_0200615C

	thumb_func_start sub_0200616C
sub_0200616C: ; 0x0200616C
	push {r3, r4, r5, lr}
	mov r5, #0
	add r4, r5, #0
_02006172:
	add r0, r5, #3
	add r1, r4, #0
	bl sub_0200615C
	add r5, r5, #1
	cmp r5, #4
	blt _02006172
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0200616C

	thumb_func_start sub_02006184
sub_02006184: ; 0x02006184
	push {r3, lr}
	bl sub_020054D4
	bl GF_SndPlayerCountPlayingSeqByPlayerNo
	pop {r3, pc}
	thumb_func_end sub_02006184

	thumb_func_start sub_02006190
sub_02006190: ; 0x02006190
	ldr r3, _02006194 ; =GF_SndPlayerCountPlayingSeqByPlayerNo
	bx r3
	.balign 4, 0
_02006194: .word GF_SndPlayerCountPlayingSeqByPlayerNo
	thumb_func_end sub_02006190

	thumb_func_start sub_02006198
sub_02006198: ; 0x02006198
	push {r4, lr}
	mov r4, #0
_0200619C:
	add r0, r4, #3
	bl GF_SndPlayerCountPlayingSeqByPlayerNo
	cmp r0, #1
	bne _020061AA
	mov r0, #1
	pop {r4, pc}
_020061AA:
	add r4, r4, #1
	cmp r4, #4
	blt _0200619C
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02006198

	thumb_func_start sub_020061B4
sub_020061B4: ; 0x020061B4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_020054D4
	bl sub_0200480C
	bl GetSoundPlayer
	add r1, r5, #0
	add r2, r4, #0
	bl sub_020C829C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020061B4

	thumb_func_start sub_020061D0
sub_020061D0: ; 0x020061D0
	push {r4, lr}
	add r4, r1, #0
	bl sub_0200480C
	bl GetSoundPlayer
	ldr r1, _020061E8 ; =0x0000FFFF
	add r2, r4, #0
	bl sub_020C829C
	pop {r4, pc}
	nop
_020061E8: .word 0x0000FFFF
	thumb_func_end sub_020061D0

	thumb_func_start sub_020061EC
sub_020061EC: ; 0x020061EC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #3
	bl sub_0200480C
	ldr r7, _02006214 ; =0x0000FFFF
	add r4, r0, #0
	mov r5, #0
_020061FC:
	add r0, r4, r5
	bl GetSoundPlayer
	add r1, r7, #0
	add r2, r6, #0
	bl sub_020C829C
	add r5, r5, #1
	cmp r5, #4
	blt _020061FC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02006214: .word 0x0000FFFF
	thumb_func_end sub_020061EC

	thumb_func_start sub_02006218
sub_02006218: ; 0x02006218
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x12
	str r1, [sp, #8]
	bl sub_02004400
	add r7, r0, #0
	mov r0, #0x24
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x35
	bl sub_02004400
	add r4, r0, #0
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl sub_02006A0C
	cmp r0, #1
	bne _02006246
	ldr r5, _020062D8 ; =0x000001EE
_02006246:
	ldr r0, _020062D8 ; =0x000001EE
	cmp r5, r0
	beq _02006258
	add r0, r0, #1
	cmp r5, r0
	bhi _02006256
	cmp r5, #0
	bne _02006258
_02006256:
	mov r5, #1
_02006258:
	ldr r0, _020062DC ; =0x000001B9
	cmp r5, r0
	bne _0200627A
	mov r1, #0
	ldr r0, [r6]
	mov r2, #0x7f
	add r3, r1, #0
	bl sub_02006D04
	cmp r0, #1
	bne _0200627A
	mov r0, #0
	bl sub_02006E3C
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0200627A:
	ldrb r0, [r7]
	cmp r0, #0
	bne _020062AC
	ldrb r0, [r4]
	cmp r0, #0
	bne _0200628C
	mov r0, #0
	bl sub_02006300
_0200628C:
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #1
	sub r1, r0, #2
	add r2, r5, #0
	add r3, r1, #0
	bl sub_02006C14
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_02005464
	b _020062CC
_020062AC:
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #8
	add r1, r0, #0
	sub r1, #9
	add r2, r5, #0
	add r3, r1, #0
	bl sub_02006C14
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #8
	bl sub_02005464
_020062CC:
	mov r0, #0
	bl sub_02006E3C
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020062D8: .word 0x000001EE
_020062DC: .word 0x000001B9
	thumb_func_end sub_02006218

	thumb_func_start sub_020062E0
sub_020062E0: ; 0x020062E0
	push {lr}
	sub sp, #0xc
	add r3, r0, #0
	mov r0, #0xb
	str r0, [sp]
	str r1, [sp, #4]
	add r1, r3, #0
	mov r0, #0
	str r2, [sp, #8]
	add r2, r0, #0
	mov r3, #0x7f
	bl sub_02006920
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_020062E0

	thumb_func_start sub_02006300
sub_02006300: ; 0x02006300
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x10
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x11
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0xf
	bl sub_02004400
	mov r0, #1
	bl GetSoundPlayer
	add r1, r5, #0
	bl sub_020C8058
	mov r0, #8
	bl GetSoundPlayer
	add r1, r5, #0
	bl sub_020C8058
	ldrb r0, [r6]
	cmp r0, #1
	bne _02006344
	mov r0, #0xe
	bl sub_020058B8
	mov r0, #0xe
	bl sub_02005680
_02006344:
	ldrb r0, [r4]
	cmp r0, #1
	bne _02006356
	mov r0, #0xf
	bl sub_020058B8
	mov r0, #0xf
	bl sub_02005680
_02006356:
	bl sub_02006DB8
	bl sub_02006A30
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02006300

	thumb_func_start sub_02006360
sub_02006360: ; 0x02006360
	push {r3, r4, r5, lr}
	mov r0, #0x10
	bl sub_02004400
	add r5, r0, #0
	mov r0, #0x11
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0xf
	bl sub_02004400
	mov r0, #0x2e
	bl sub_02004400
	ldrb r0, [r5]
	cmp r0, #1
	bne _0200638C
	mov r0, #0xe
	bl sub_02005738
	pop {r3, r4, r5, pc}
_0200638C:
	ldrb r0, [r4]
	cmp r0, #1
	bne _0200639A
	mov r0, #0xf
	bl sub_02005738
	pop {r3, r4, r5, pc}
_0200639A:
	mov r0, #0
	bl GF_SndPlayerCountPlayingSeqByPlayerNo
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02006360

	thumb_func_start sub_020063A4
sub_020063A4: ; 0x020063A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	add r4, r1, #0
	str r0, [sp, #0x38]
	mov r0, #0x10
	add r6, r2, #0
	add r7, r3, #0
	ldr r5, [sp, #0x3c]
	bl sub_02004400
	str r0, [sp, #0x14]
	mov r0, #0x11
	bl sub_02004400
	str r0, [sp, #0x10]
	mov r0, #0x12
	bl sub_02004400
	str r0, [sp, #0xc]
	mov r0, #0x1e
	bl sub_02004400
	str r0, [sp, #8]
	mov r0, #0x24
	bl sub_02004400
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006A0C
	cmp r0, #1
	bne _020063EA
	ldr r4, _02006740 ; =0x000001EE
_020063EA:
	ldr r0, _02006740 ; =0x000001EE
	cmp r4, r0
	beq _020063FC
	add r0, r0, #1
	cmp r4, r0
	bhi _020063FA
	cmp r4, #0
	bne _020063FC
_020063FA:
	mov r4, #1
_020063FC:
	lsr r0, r6, #0x1f
	add r0, r6, r0
	asr r0, r0, #1
	str r0, [sp, #0x1c]
	add r0, #0x40
	str r0, [sp, #0x1c]
	add r0, r7, #0
	str r0, [sp, #0x18]
	sub r0, #0x1e
	str r0, [sp, #0x18]
	cmp r0, #0
	bgt _02006418
	mov r0, #1
	str r0, [sp, #0x18]
_02006418:
	ldr r0, [sp, #0xc]
	mov r1, #0
	strb r1, [r0]
	ldr r0, [sp, #0x14]
	ldrb r0, [r0]
	cmp r0, #1
	bne _02006432
	mov r0, #0xe
	bl sub_020058B8
	mov r0, #0xe
	bl sub_02005680
_02006432:
	ldr r0, [sp, #0x10]
	ldrb r0, [r0]
	cmp r0, #1
	bne _02006446
	mov r0, #0xf
	bl sub_020058B8
	mov r0, #0xf
	bl sub_02005680
_02006446:
	ldr r0, _02006744 ; =0x000001B9
	cmp r4, r0
	bne _020064DA
	ldr r1, [sp, #4]
	cmp r1, #0xc
	bhi _020064D4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0200645E: ; jump table
	.short _02006478 - _0200645E - 2 ; case 0
	.short _02006478 - _0200645E - 2 ; case 1
	.short _02006478 - _0200645E - 2 ; case 2
	.short _020064D4 - _0200645E - 2 ; case 3
	.short _020064D4 - _0200645E - 2 ; case 4
	.short _02006478 - _0200645E - 2 ; case 5
	.short _020064D4 - _0200645E - 2 ; case 6
	.short _020064D4 - _0200645E - 2 ; case 7
	.short _020064D4 - _0200645E - 2 ; case 8
	.short _020064D4 - _0200645E - 2 ; case 9
	.short _020064D4 - _0200645E - 2 ; case 10
	.short _02006478 - _0200645E - 2 ; case 11
	.short _02006478 - _0200645E - 2 ; case 12
_02006478:
	add r1, r5, #0
	bl sub_02006218
	ldr r0, [sp, #8]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200649C
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	b _020064CE
_0200649C:
	ldr r0, [sp, #0x14]
	ldrb r0, [r0]
	cmp r0, #1
	bne _020064BA
	ldr r1, [sp, #0x1c]
	mov r0, #0xe
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02005748
	mov r0, #0xe
	add r1, r7, #0
	bl sub_02005774
	b _020064CE
_020064BA:
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
_020064CE:
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020064D4:
	mov r0, #1
	bl sub_02006E3C
_020064DA:
	ldr r0, [sp, #4]
	cmp r0, #0xe
	bls _020064E2
	b _02006814
_020064E2:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020064EE: ; jump table
	.short _0200650C - _020064EE - 2 ; case 0
	.short _0200652A - _020064EE - 2 ; case 1
	.short _02006550 - _020064EE - 2 ; case 2
	.short _02006596 - _020064EE - 2 ; case 3
	.short _020065E4 - _020064EE - 2 ; case 4
	.short _02006636 - _020064EE - 2 ; case 5
	.short _02006660 - _020064EE - 2 ; case 6
	.short _020066A8 - _020064EE - 2 ; case 7
	.short _020066DA - _020064EE - 2 ; case 8
	.short _0200670A - _020064EE - 2 ; case 9
	.short _0200674C - _020064EE - 2 ; case 10
	.short _0200677E - _020064EE - 2 ; case 11
	.short _020067A8 - _020064EE - 2 ; case 12
	.short _020067DA - _020064EE - 2 ; case 13
	.short _0200680C - _020064EE - 2 ; case 14
_0200650C:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	b _02006814
_0200652A:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0x14
	bl sub_02006838
	b _02006814
_02006550:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	mov r2, #0x40
	bl sub_02005918
	add r0, r4, #0
	mov r1, #0x14
	add r2, r5, #0
	bl sub_02006AC0
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #8
	add r2, r6, #0
	bl sub_02005958
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	mov r1, #8
	bl sub_02006820
	b _02006814
_02006596:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0x1e
	bl sub_02006838
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	mov r2, #0xc0
	bl sub_02005918
	add r0, r4, #0
	mov r1, #0x10
	add r2, r5, #0
	bl sub_02006AC0
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #8
	add r2, r6, #0
	bl sub_02005958
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	mov r1, #8
	bl sub_02006820
	b _02006814
_020065E4:
	mov r0, #0xe
	bl sub_02005600
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x1c]
	str r0, [sp]
	add r0, r4, #0
	add r1, r7, #0
	mov r3, #0xe
	bl sub_020057AC
	ldr r1, [sp, #0x1c]
	mov r0, #0xe
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02005748
	ldr r1, [sp, #0x38]
	mov r0, #0xf
	bl sub_02006838
	mov r1, #0x86
	mov r0, #0xe
	lsl r1, r1, #8
	bl sub_02005760
	ldr r0, [sp, #0x38]
	mov r1, #0x3f
	str r0, [sp]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r0, r4, #0
	mvn r1, r1
	bl sub_02006AF4
	mov r1, #0x86
	mov r0, #0xf
	lsl r1, r1, #8
	bl sub_02005760
	b _02006814
_02006636:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	mov r0, #1
	add r2, r0, #0
	ldr r1, _02006748 ; =0x0000FFFF
	sub r2, #0xe1
	bl sub_02005918
	b _02006814
_02006660:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	mov r2, #0x2c
	bl sub_02005918
	mov r1, #0x3f
	add r0, r4, #0
	mvn r1, r1
	add r2, r5, #0
	bl sub_02006AC0
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #8
	add r2, r6, #0
	bl sub_02005958
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	mov r1, #8
	bl sub_02006820
	b _02006814
_020066A8:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0xb
	bl sub_02006838
	mov r0, #1
	add r2, r0, #0
	ldr r1, _02006748 ; =0x0000FFFF
	sub r2, #0x81
	bl sub_02005918
	b _02006814
_020066DA:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0x3c
	bl sub_02006838
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	mov r2, #0x3c
	bl sub_02005918
	b _02006814
_0200670A:
	mov r0, #0xe
	bl sub_02005600
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x1c]
	str r0, [sp]
	add r0, r4, #0
	add r1, r7, #0
	mov r3, #0xe
	bl sub_020057AC
	ldr r1, [sp, #0x1c]
	mov r0, #0xe
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02005748
	ldr r1, [sp, #0x38]
	mov r0, #0xd
	bl sub_02006838
	mov r1, #0x1a
	mov r0, #0xe
	lsl r1, r1, #0xa
	bl sub_02005760
	b _02006814
	.balign 4, 0
_02006740: .word 0x000001EE
_02006744: .word 0x000001B9
_02006748: .word 0x0000FFFF
_0200674C:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _0200681C ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0x64
	bl sub_02006838
	mov r0, #1
	add r2, r0, #0
	ldr r1, _0200681C ; =0x0000FFFF
	sub r2, #0x2d
	bl sub_02005918
	b _02006814
_0200677E:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _0200681C ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	mov r0, #1
	add r2, r0, #0
	ldr r1, _0200681C ; =0x0000FFFF
	sub r2, #0x61
	bl sub_02005918
	b _02006814
_020067A8:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _0200681C ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0x14
	bl sub_02006838
	mov r0, #1
	add r2, r0, #0
	ldr r1, _0200681C ; =0x0000FFFF
	sub r2, #0x61
	bl sub_02005918
	b _02006814
_020067DA:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x7f
	bl sub_02006820
	add r0, r4, #0
	mov r1, #0x14
	add r2, r5, #0
	bl sub_02006AC0
	ldr r1, _0200681C ; =0x0000FFFF
	mov r0, #8
	add r2, r6, #0
	bl sub_02005958
	mov r0, #8
	add r1, r7, #0
	mov r2, #0
	bl sub_02005408
	b _02006814
_0200680C:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
_02006814:
	mov r0, #1
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0200681C: .word 0x0000FFFF
	thumb_func_end sub_020063A4

	thumb_func_start sub_02006820
sub_02006820: ; 0x02006820
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r1, r2, #0
	bl sub_0200542C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02005464
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02006820

	thumb_func_start sub_02006838
sub_02006838: ; 0x02006838
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x23
	bl sub_02004400
	add r6, r0, #0
	bl sub_020068F8
	add r0, r4, #0
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	bne _0200685C
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_0200685C:
	mov r2, #0
	strb r2, [r4]
	strb r2, [r4, #1]
	strb r2, [r4, #2]
	strb r2, [r4, #3]
	strb r2, [r4, #4]
	strb r2, [r4, #5]
	strb r2, [r4, #6]
	strb r2, [r4, #7]
	ldr r0, _02006880 ; =sub_02006884
	add r1, r4, #0
	str r5, [r4]
	bl sub_0200E320
	str r0, [r4, #4]
	str r0, [r6]
	pop {r4, r5, r6, pc}
	nop
_02006880: .word sub_02006884
	thumb_func_end sub_02006838

	thumb_func_start sub_02006884
sub_02006884: ; 0x02006884
	push {r4, r5, r6, lr}
	mov r0, #0x10
	add r5, r1, #0
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x11
	bl sub_02004400
	ldr r2, [r5]
	add r4, r0, #0
	cmp r2, #0xa
	bne _020068B0
	mov r0, #1
	mov r1, #0
	bl sub_02005408
	ldr r2, [r5]
	mov r0, #8
	mov r1, #0
	bl sub_02005408
_020068B0:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	bl sub_02006360
	cmp r0, #0
	bne _020068C2
	mov r0, #0
	str r0, [r5]
_020068C2:
	ldr r0, [r5]
	cmp r0, #0
	bgt _020068F6
	mov r0, #0
	bl sub_02006300
	ldrb r0, [r6]
	cmp r0, #1
	bne _020068E0
	mov r0, #0xe
	bl sub_020058B8
	mov r0, #0xe
	bl sub_02005680
_020068E0:
	ldrb r0, [r4]
	cmp r0, #1
	bne _020068F2
	mov r0, #0xf
	bl sub_020058B8
	mov r0, #0xf
	bl sub_02005680
_020068F2:
	bl sub_020068F8
_020068F6:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02006884

	thumb_func_start sub_020068F8
sub_020068F8: ; 0x020068F8
	push {r3, r4, r5, lr}
	mov r0, #0x23
	bl sub_02004400
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0200691A
	bl sub_0201F988
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_0200E390
	add r0, r5, #0
	bl FreeToHeap
_0200691A:
	mov r0, #0
	str r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020068F8

	thumb_func_start sub_02006920
sub_02006920: ; 0x02006920
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r0, #0
	mov r0, #6
	add r5, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0x35
	bl sub_02004400
	str r0, [sp, #0xc]
	ldrb r0, [r4]
	cmp r0, #0
	bne _02006974
	mov r0, #0x29
	bl sub_02004400
	str r0, [sp, #0x24]
	mov r0, #0x2d
	bl sub_02004400
	str r0, [sp, #0x20]
	mov r0, #0x2a
	bl sub_02004400
	str r0, [sp, #0x1c]
	mov r0, #0x2b
	bl sub_02004400
	str r0, [sp, #0x18]
	mov r0, #0x2c
	bl sub_02004400
	str r0, [sp, #0x14]
	mov r0, #0x2e
	bl sub_02004400
	str r0, [sp, #0x10]
	b _020069A4
_02006974:
	mov r0, #0x2f
	bl sub_02004400
	str r0, [sp, #0x24]
	mov r0, #0x33
	bl sub_02004400
	str r0, [sp, #0x20]
	mov r0, #0x30
	bl sub_02004400
	str r0, [sp, #0x1c]
	mov r0, #0x31
	bl sub_02004400
	str r0, [sp, #0x18]
	mov r0, #0x32
	bl sub_02004400
	str r0, [sp, #0x14]
	mov r0, #0x34
	bl sub_02004400
	str r0, [sp, #0x10]
_020069A4:
	ldr r0, [sp, #0xc]
	ldrb r0, [r0]
	cmp r0, #1
	bne _020069B4
	ldrb r1, [r4]
	mov r0, #1
	eor r0, r1
	strb r0, [r4]
_020069B4:
	add r1, sp, #0x30
	ldrb r1, [r1, #0x18]
	add r0, r5, #0
	bl sub_02006A0C
	cmp r0, #1
	bne _020069C4
	ldr r5, _02006A08 ; =0x000001EE
_020069C4:
	cmp r5, #0
	beq _02006A04
	add r1, sp, #0x30
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	bne _020069E8
	ldr r0, [sp, #0x40]
	ldr r3, [sp, #8]
	str r0, [sp]
	ldrb r0, [r1, #0x18]
	add r1, r5, #0
	add r2, r7, #0
	str r0, [sp, #4]
	add r0, r6, #0
	bl sub_020063A4
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
_020069E8:
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #8]
	str r6, [r1]
	ldr r1, [sp, #0x20]
	strh r5, [r1]
	ldr r1, [sp, #0x1c]
	str r7, [r1]
	ldr r1, [sp, #0x18]
	str r2, [r1]
	ldr r2, [sp, #0x40]
	ldr r1, [sp, #0x14]
	str r2, [r1]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
_02006A04:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02006A08: .word 0x000001EE
	thumb_func_end sub_02006920

	thumb_func_start sub_02006A0C
sub_02006A0C: ; 0x02006A0C
	mov r2, #0x7b
	lsl r2, r2, #2
	cmp r0, r2
	bne _02006A1C
	cmp r1, #1
	bne _02006A1C
	mov r0, #1
	bx lr
_02006A1C:
	ldr r1, _02006A2C ; =0x000001EE
	cmp r0, r1
	bne _02006A26
	mov r0, #1
	bx lr
_02006A26:
	mov r0, #0
	bx lr
	nop
_02006A2C: .word 0x000001EE
	thumb_func_end sub_02006A0C

	thumb_func_start sub_02006A30
sub_02006A30: ; 0x02006A30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	mov r0, #0x29
	bl sub_02004400
	add r5, r0, #0
	mov r0, #0x2d
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0x2a
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x2b
	bl sub_02004400
	add r7, r0, #0
	mov r0, #0x2c
	bl sub_02004400
	str r0, [sp]
	mov r0, #0x2e
	bl sub_02004400
	str r0, [sp, #4]
	mov r0, #0x2f
	bl sub_02004400
	str r0, [sp, #8]
	mov r0, #0x33
	bl sub_02004400
	str r0, [sp, #0xc]
	mov r0, #0x30
	bl sub_02004400
	str r0, [sp, #0x10]
	mov r0, #0x31
	bl sub_02004400
	str r0, [sp, #0x14]
	mov r0, #0x32
	bl sub_02004400
	str r0, [sp, #0x18]
	mov r0, #0x34
	bl sub_02004400
	mov r1, #0
	str r1, [r5]
	strh r1, [r4]
	str r1, [r6]
	ldr r2, [sp]
	str r1, [r7]
	str r1, [r2]
	ldr r2, [sp, #4]
	strb r1, [r2]
	ldr r2, [sp, #8]
	str r1, [r2]
	ldr r2, [sp, #0xc]
	strh r1, [r2]
	ldr r2, [sp, #0x10]
	str r1, [r2]
	ldr r2, [sp, #0x14]
	str r1, [r2]
	ldr r2, [sp, #0x18]
	str r1, [r2]
	strb r1, [r0]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02006A30

	thumb_func_start sub_02006AC0
sub_02006AC0: ; 0x02006AC0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x12
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02004400
	mov r1, #1
	strb r1, [r0]
	add r0, r1, #0
	bl sub_02006E3C
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02006218
	add r5, r0, #0
	ldr r1, _02006AF0 ; =0x0000FFFF
	mov r0, #8
	add r2, r4, #0
	bl sub_02005918
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02006AF0: .word 0x0000FFFF
	thumb_func_end sub_02006AC0

	thumb_func_start sub_02006AF4
sub_02006AF4: ; 0x02006AF4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0x12
	add r4, r2, #0
	add r6, r3, #0
	bl sub_02004400
	mov r1, #1
	strb r1, [r0]
	mov r0, #0xf
	bl sub_02005600
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	str r0, [sp]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #0xf
	bl sub_020057AC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02006AF4

	thumb_func_start sub_02006B24
sub_02006B24: ; 0x02006B24
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_020054F8
	add r0, r4, #0
	bl sub_02006C04
	bl sub_02004A90
	bl sub_020054D4
	cmp r0, #0xff
	beq _02006B48
	mov r1, #1
	bl sub_020053A8
	b _02006B4E
_02006B48:
	mov r0, #1
	bl sub_02004A2C
_02006B4E:
	mov r0, #0x1d
	bl sub_02004400
	bl GF_Snd_SaveState
	add r0, r4, #0
	mov r1, #3
	bl sub_02004784
	str r4, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	sub r1, r0, #3
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02006C14
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #2
	bl sub_02005464
	add r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02006B24

	thumb_func_start sub_02006B84
sub_02006B84: ; 0x02006B84
	push {r4, lr}
	mov r0, #0xe
	bl sub_02004400
	add r4, r0, #0
	mov r0, #2
	bl GF_SndPlayerCountPlayingSeqByPlayerNo
	cmp r0, #0
	beq _02006B9C
	mov r0, #1
	pop {r4, pc}
_02006B9C:
	ldrh r0, [r4]
	cmp r0, #0
	beq _02006BAA
	sub r0, r0, #1
	strh r0, [r4]
	mov r0, #1
	pop {r4, pc}
_02006BAA:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02006B84

	thumb_func_start sub_02006BB0
sub_02006BB0: ; 0x02006BB0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #2
	bl GetSoundPlayer
	add r1, r4, #0
	bl sub_020C8058
	mov r0, #6
	bl sub_02005328
	bl sub_02004714
	pop {r4, pc}
	thumb_func_end sub_02006BB0

	thumb_func_start sub_02006BCC
sub_02006BCC: ; 0x02006BCC
	push {r3, lr}
	mov r0, #0xe
	bl sub_02004400
	bl sub_02006B84
	cmp r0, #1
	bne _02006BE0
	mov r0, #1
	pop {r3, pc}
_02006BE0:
	mov r0, #0
	bl sub_02006BB0
	bl sub_02004A90
	bl sub_020054D4
	cmp r0, #0xff
	beq _02006BF8
	mov r1, #0
	bl sub_020053A8
_02006BF8:
	mov r0, #0
	bl sub_02004A2C
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02006BCC

	thumb_func_start sub_02006C04
sub_02006C04: ; 0x02006C04
	push {r3, lr}
	mov r0, #0xe
	bl sub_02004400
	mov r1, #0xf
	strh r1, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02006C04

	thumb_func_start sub_02006C14
sub_02006C14: ; 0x02006C14
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #4]
	add r0, sp, #0x10
	ldrh r6, [r0, #0x10]
	ldrb r0, [r0, #0x14]
	add r5, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	cmp r0, #1
	bne _02006C6A
	bl sub_02005C18
	cmp r0, #1
	bne _02006C6A
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	bl sub_02005C6C
	add r1, sp, #0x10
	ldrh r1, [r1, #0x10]
	add r4, r0, #0
	cmp r1, r4
	beq _02006C6A
	add r6, r4, #0
	ldr r7, _02006C88 ; =0x000002BD
	bl sub_02004AB8
	add r0, r4, #0
	bl sub_020054D4
	mov r1, #0
	mvn r1, r1
	cmp r5, r1
	beq _02006C5E
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
_02006C5E:
	cmp r0, #7
	bne _02006C6A
	add r0, r4, #0
	mov r1, #1
	bl sub_02004784
_02006C6A:
	ldr r0, [sp, #4]
	bl GetSoundPlayer
	ldr r3, [sp, #8]
	add r1, r5, #0
	add r2, r7, #0
	str r6, [sp]
	bl sub_020CA8E4
	add r4, r0, #0
	bl sub_02005CC0
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02006C88: .word 0x000002BD
	thumb_func_end sub_02006C14
