	.include "asm/macros.inc"
	.include "global.inc"

	.text

	; Entry point
	thumb_func_start NitroMain
NitroMain: ; 0x02000CA4
	push {r3, r4, r5, r6, r7, lr}
	bl sub_0201A200
	bl sub_0201A348
	bl sub_0201A458
	mov r0, #0
	bl sub_0201A4B0
	ldr r0, _02000E48 ; =0x02111860
	mov r1, #0
	bl sub_020DB3B4
	bl sub_02026E30
	bl sub_02014634
	bl sub_02000E6C
	bl sub_02002CA8
	mov r0, #0
	mov r1, #3
	bl sub_02002CEC
	mov r0, #1
	mov r1, #3
	bl sub_02002CEC
	mov r0, #3
	add r1, r0, #0
	bl sub_02002CEC
	mov r1, #0
	ldr r0, _02000E4C ; =0x02111860
	mvn r1, r1
	str r1, [r0, #0x18]
	bl sub_020271B0
	ldr r1, _02000E4C ; =0x02111860
	str r0, [r1, #0x20]
	bl sub_02005D00
	ldr r0, _02000E4C ; =0x02111860
	ldr r0, [r0, #0x20]
	bl sub_0202CE64
	add r4, r0, #0
	ldr r0, _02000E4C ; =0x02111860
	ldr r0, [r0, #0x20]
	bl sub_02028EA8
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02004174
	bl sub_02025404
	mov r0, #3
	bl sub_02039FFC
	cmp r0, #3
	bne _02000D2C
	mov r0, #3
	mov r1, #0
	bl sub_0203AC94
_02000D2C:
	ldr r0, _02000E4C ; =0x02111860
	ldr r0, [r0, #0x20]
	bl sub_020274D0
	cmp r0, #0
	bne _02000D40
	mov r0, #0
	bl sub_0209263C
	b _02000D82
_02000D40:
	ldr r0, _02000E50 ; =0x027FFC20
	ldr r0, [r0]
	cmp r0, #0
	beq _02000D4E
	cmp r0, #1
	beq _02000D5E
	b _02000D7E
_02000D4E:
	ldr r0, _02000E4C ; =0x02111860
	mov r1, #0
	str r1, [r0, #0x1c]
	ldr r0, _02000E54 ; =0x0000003C
	ldr r1, _02000E58 ; =0x021EB030
	bl sub_02000EF4
	b _02000D82
_02000D5E:
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	ldr r0, _02000E4C ; =0x02111860
	mov r1, #1
	str r1, [r0, #0x1c]
	ldr r0, _02000E5C ; =0x00000024
	ldr r1, _02000E60 ; =0x021E5C04
	bl sub_02000EF4
	b _02000D82
_02000D7E:
	bl GF_AssertFail
_02000D82:
	ldr r0, _02000E64 ; =0x021D110C
	mov r1, #1
	str r1, [r0, #0x70]
	mov r1, #0
	str r1, [r0, #0x30]
	bl sub_020010C8
	bl sub_0200B528
	bl sub_02018380
	ldr r0, _02000E4C ; =0x02111860
	mov r1, #0
	str r1, [r0, #4]
	bl sub_020D33C0
	mov r7, #0xc3
	ldr r6, _02000E68 ; =0x021D116C
	ldr r4, _02000E64 ; =0x021D110C
	mov r5, #0
	lsl r7, r7, #2
_02000DAC:
	bl sub_02000F60
	bl sub_0200110C
	bl sub_0201A4DC
	mov r0, #0xc3
	ldr r1, [r4, #0x38]
	lsl r0, r0, #2
	and r0, r1
	cmp r0, r7
	bne _02000DD0
	ldrb r0, [r6, #0xc]
	cmp r0, #0
	bne _02000DD0
	mov r0, #0
	bl sub_02000FA4
_02000DD0:
	bl sub_02036144
	cmp r0, #0
	beq _02000E08
	bl sub_02000F60
	bl sub_020D34B0
	bl sub_02000E84
	bl sub_020D34B0
	ldr r0, [r4, #0x18]
	bl sub_0201F880
	ldr r0, [r4, #0x24]
	bl sub_0201F880
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bne _02000E08
	mov r0, #1
	add r1, r0, #0
	bl sub_020D0E6C
	ldr r0, [r4, #0x2c]
	add r0, r0, #1
	str r0, [r4, #0x2c]
_02000E08:
	bl sub_0201466C
	bl sub_020183B0
	bl sub_02026E60
	ldr r0, [r4, #0x24]
	bl sub_0201F880
	mov r0, #1
	add r1, r0, #0
	bl sub_020D0E6C
	ldr r0, [r4, #0x2c]
	add r0, r0, #1
	str r0, [r4, #0x2c]
	str r5, [r4, #0x30]
	bl sub_0200B594
	bl sub_0200FB2C
	ldr r1, [r4]
	cmp r1, #0
	beq _02000E3C
	ldr r0, [r4, #4]
	blx r1
_02000E3C:
	bl sub_02004208
	ldr r0, [r4, #0x20]
	bl sub_0201F880
	b _02000DAC
	.align 2, 0
_02000E48: .word 0x02111860
_02000E4C: .word 0x02111860
_02000E50: .word 0x027FFC20
_02000E54: .word 0x0000003C
_02000E58: .word 0x021EB030
_02000E5C: .word 0x00000024
_02000E60: .word 0x021E5C04
_02000E64: .word 0x021D110C
_02000E68: .word 0x021D116C
	thumb_func_end NitroMain

	thumb_func_start sub_02000E6C
sub_02000E6C: ; 0x02000E6C
	mov r2, #0
	ldr r0, _02000E80 ; =0x02111860
	mvn r2, r2
	str r2, [r0, #8]
	mov r1, #0
	str r1, [r0, #0xc]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	nop
_02000E80: .word 0x02111860
	thumb_func_end sub_02000E6C

	thumb_func_start sub_02000E84
sub_02000E84: ; 0x02000E84
	push {r3, lr}
	ldr r0, _02000EEC ; =0x02111860
	ldr r1, [r0, #0xc]
	cmp r1, #0
	bne _02000EC2
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _02000EE8
	mov r1, #0
	ldr r0, [r0, #0x10]
	mvn r1, r1
	cmp r0, r1
	beq _02000EA4
	mov r1, #0
	bl sub_02006FF8
_02000EA4:
	ldr r0, _02000EEC ; =0x02111860
	mov r2, #0
	ldr r1, [r0, #0x10]
	str r1, [r0, #8]
	ldr r0, [r0, #0x14]
	ldr r1, _02000EF0 ; =0x02111878
	bl sub_0200724C
	ldr r1, _02000EEC ; =0x02111860
	str r0, [r1, #0xc]
	mov r0, #0
	mvn r0, r0
	str r0, [r1, #0x10]
	mov r0, #0
	str r0, [r1, #0x14]
_02000EC2:
	ldr r0, _02000EEC ; =0x02111860
	ldr r0, [r0, #0xc]
	bl sub_020072A8
	cmp r0, #0
	beq _02000EE8
	ldr r0, _02000EEC ; =0x02111860
	ldr r0, [r0, #0xc]
	bl sub_02007278
	ldr r0, _02000EEC ; =0x02111860
	mov r1, #0
	str r1, [r0, #0xc]
	ldr r0, [r0, #8]
	sub r1, r1, #1
	cmp r0, r1
	beq _02000EE8
	bl sub_02006F7C
_02000EE8:
	pop {r3, pc}
	nop
_02000EEC: .word 0x02111860
_02000EF0: .word 0x02111878
	thumb_func_end sub_02000E84

	thumb_func_start sub_02000EF4
sub_02000EF4: ; 0x02000EF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02000F10 ; =0x02111860
	add r4, r1, #0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _02000F06
	bl GF_AssertFail
_02000F06:
	ldr r0, _02000F10 ; =0x02111860
	str r5, [r0, #0x10]
	str r4, [r0, #0x14]
	pop {r3, r4, r5, pc}
	nop
_02000F10: .word 0x02111860
	thumb_func_end sub_02000EF4

	thumb_func_start sub_02000F14
sub_02000F14: ; 0x02000F14
	push {r3, lr}
	bl sub_02036144
	mov r0, #1
	add r1, r0, #0
	bl sub_020D0E6C
	ldr r0, _02000F3C ; =0x021D110C
	ldr r1, [r0, #0x2c]
	add r1, r1, #1
	str r1, [r0, #0x2c]
	mov r1, #0
	str r1, [r0, #0x30]
	ldr r1, [r0]
	cmp r1, #0
	beq _02000F38
	ldr r0, [r0, #4]
	blx r1
_02000F38:
	pop {r3, pc}
	nop
_02000F3C: .word 0x021D110C
	thumb_func_end sub_02000F14

	thumb_func_start sub_02000F40
sub_02000F40: ; 0x02000F40
	push {r4, lr}
	add r4, r0, #0
	bl sub_02039AA4
	cmp r0, #0
	beq _02000F5A
	bl sub_020DD1A4
	cmp r0, #1
	bne _02000F5A
	add r0, r4, #0
	bl sub_020D3B84
_02000F5A:
	bl sub_02000F14
	pop {r4, pc}
	thumb_func_end sub_02000F40

	thumb_func_start sub_02000F60
sub_02000F60: ; 0x02000F60
	push {r3, lr}
	bl sub_020399B8
	add r1, r0, #0
	cmp r1, #5
	bhi _02000FA2
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02000F78: ; jump table
	.short _02000FA2 - _02000F78 - 2 ; case 0
	.short _02000F8C - _02000F78 - 2 ; case 1
	.short _02000F94 - _02000F78 - 2 ; case 2
	.short _02000F9C - _02000F78 - 2 ; case 3
	.short _02000FA2 - _02000F78 - 2 ; case 4
	.short _02000F84 - _02000F78 - 2 ; case 5
_02000F84:
	mov r0, #0
	bl sub_02000FD8
	pop {r3, pc}
_02000F8C:
	mov r0, #1
	bl sub_02000FD8
	pop {r3, pc}
_02000F94:
	mov r0, #0
	bl sub_02000FD8
	pop {r3, pc}
_02000F9C:
	mov r0, #1
	bl sub_02000FD8
_02000FA2:
	pop {r3, pc}
	thumb_func_end sub_02000F60

	thumb_func_start sub_02000FA4
sub_02000FA4: ; 0x02000FA4
	push {r4, lr}
	ldr r1, _02000FD4 ; =0x00007FFF
	add r4, r0, #0
	mov r0, #0
	bl sub_0200FBF4
	ldr r1, _02000FD4 ; =0x00007FFF
	mov r0, #1
	bl sub_0200FBF4
	bl sub_02038D90
	cmp r0, #0
	beq _02000FC8
	bl sub_020272B0
	bl sub_020275A4
_02000FC8:
	bl sub_0200110C
	add r0, r4, #0
	bl sub_02000F40
	b _02000FC8
	.align 2, 0
_02000FD4: .word 0x00007FFF
	thumb_func_end sub_02000FA4

	thumb_func_start sub_02000FD8
sub_02000FD8: ; 0x02000FD8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r6, r1, #0
	mov r4, #0
	bl sub_0203993C
	str r0, [sp, #4]
	bl sub_02039998
	add r7, r0, #0
	add r1, r4, #0
	ldr r0, _02001090 ; =0x021D116C
	cmp r6, #3
	strb r1, [r0, #8]
	bne _02000FFC
	mov r5, #3
	b _02001020
_02000FFC:
	ldr r0, [sp]
	cmp r0, #0
	bne _02001012
	bl sub_02039998
	cmp r0, #1
	bne _0200100E
	mov r5, #6
	b _02001020
_0200100E:
	mov r5, #2
	b _02001020
_02001012:
	bl sub_02039998
	cmp r0, #1
	bne _0200101E
	mov r5, #5
	b _02001020
_0200101E:
	add r5, r4, #0
_02001020:
	mov r0, #0
	add r1, r5, #0
	add r2, r0, #0
	bl sub_0203AA44
	bl sub_02038D90
	bl sub_02000F14
	bl sub_02004208
_02001036:
	bl sub_0200110C
	bl sub_0201A4DC
	cmp r6, #1
	bne _02001068
	cmp r5, #0
	bne _02001068
	ldr r0, [sp, #4]
	bl sub_02001098
	cmp r0, #0
	beq _02001068
	cmp r7, #0
	bne _02001068
	ldr r0, _02001094 ; =0x021D110C
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _02001068
	cmp r4, #0xa
	blt _02001068
	mov r0, #0
	str r0, [sp]
	b _02001086
_02001068:
	ldr r0, _02001094 ; =0x021D110C
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02001076
	cmp r4, #0xa
	bge _02001086
_02001076:
	bl sub_02004208
	bl sub_02000F14
	cmp r4, #0xa
	bge _02001036
	add r4, r4, #1
	b _02001036
_02001086:
	ldr r0, [sp]
	bl sub_02000FA4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02001090: .word 0x021D116C
_02001094: .word 0x021D110C
	thumb_func_end sub_02000FD8

	thumb_func_start sub_02001098
sub_02001098: ; 0x02001098
	cmp r0, #0xd
	bgt _020010B2
	cmp r0, #7
	blt _020010AC
	beq _020010BE
	cmp r0, #9
	beq _020010BE
	cmp r0, #0xd
	beq _020010BE
	b _020010C2
_020010AC:
	cmp r0, #0
	beq _020010BE
	b _020010C2
_020010B2:
	cmp r0, #0x12
	bgt _020010BA
	beq _020010BE
	b _020010C2
_020010BA:
	cmp r0, #0x1a
	bne _020010C2
_020010BE:
	mov r0, #1
	bx lr
_020010C2:
	mov r0, #0
	bx lr
	.align 2, 0
	thumb_func_end sub_02001098

	thumb_func_start sub_020010C8
sub_020010C8: ; 0x020010C8
	push {r4, r5, lr}
	sub sp, #0x1c
	add r0, sp, #0xc
	add r1, sp, #0
	bl sub_02014708
	ldr r0, _02001108 ; =0x021D110C
	ldr r3, [sp, #0x10]
	ldr r4, [r0, #0x2c]
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	ldr r5, [sp, #0x14]
	add r0, r1, r0
	lsl r2, r0, #0x18
	ldr r0, [sp]
	lsl r3, r3, #8
	lsl r1, r0, #0x10
	mul r3, r5
	ldr r0, [sp, #0xc]
	lsl r3, r3, #0x10
	add r0, r0, r3
	add r0, r1, r0
	add r5, r2, r0
	add r0, r4, r5
	bl sub_0201FD74
	add r0, r4, r5
	bl sub_0201FD38
	add sp, #0x1c
	pop {r4, r5, pc}
	nop
_02001108: .word 0x021D110C
	thumb_func_end sub_020010C8

	thumb_func_start sub_0200110C
sub_0200110C: ; 0x0200110C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _020011D0 ; =0x027FFFA8
	ldrh r1, [r0]
	mov r0, #2
	lsl r0, r0, #0xe
	and r0, r1
	asr r0, r0, #0xf
	beq _020011AE
	ldr r0, _020011D4 ; =0x021D116C
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	bne _02001190
	bl sub_0202135C
	bl sub_02005568
	bl sub_020E10E8
	cmp r0, #1
	bne _0200113C
	ldr r0, _020011D8 ; =0x02111860
	mov r1, #1
	str r1, [r0, #4]
_0200113C:
	ldr r6, _020011D8 ; =0x02111860
	mov r0, #0xc
	ldr r1, [r6, #4]
	ldr r4, _020011D0 ; =0x027FFFA8
	mov r2, #0x10
	add r5, r0, #0
	ldr r7, _020011D4 ; =0x021D116C
	orr r5, r2
_0200114C:
	ldrb r2, [r7, #0xa]
	mov r0, #0xc
	cmp r2, #0
	beq _0200115A
	cmp r1, #0
	bne _0200115A
	add r0, r5, #0
_0200115A:
	mov r1, #0
	add r2, r1, #0
	bl sub_020DB43C
	bl sub_020DDB24
	cmp r0, #0
	beq _02001170
	bl sub_020DB330
	b _02001184
_02001170:
	ldrh r1, [r4]
	mov r0, #2
	lsl r0, r0, #0xe
	and r0, r1
	asr r0, r0, #0xf
	beq _02001184
	mov r0, #1
	str r0, [r6, #4]
	add r1, r0, #0
	b _0200114C
_02001184:
	bl sub_02021328
	bl sub_02005584
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02001190:
	bl sub_0202135C
	add r0, sp, #4
	add r1, sp, #0
	bl sub_020DB3B4
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _020011CA
	mov r0, #2
	mov r1, #0
	bl sub_020DB25C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_020011AE:
	add r0, sp, #4
	add r1, sp, #0
	bl sub_020DB3B4
	bl sub_02021328
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _020011CA
	ldr r1, _020011D8 ; =0x02111860
	mov r0, #2
	ldr r1, [r1]
	bl sub_020DB25C
_020011CA:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020011D0: .word 0x027FFFA8
_020011D4: .word 0x021D116C
_020011D8: .word 0x02111860
	thumb_func_end sub_0200110C
