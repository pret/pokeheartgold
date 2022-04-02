	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D41C4:
	.space 0x4

	.rodata

_020FC7A0:
	.byte 0x04, 0x00, 0x07, 0x00, 0x0B, 0x00, 0x07, 0x00
_020FC7A8:
	.byte 0x04, 0x00, 0x06, 0x00, 0x0B, 0x00, 0x06, 0x00
	.byte 0x04, 0x00, 0x08, 0x00, 0x0B, 0x00, 0x08, 0x00
_020FC7B8:
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

	.data

_0210FAB4:
	.byte 0x04, 0x00, 0x07, 0x00, 0x0B, 0x00, 0x07, 0x00
_0210FABC:
	.byte 0x04, 0x00, 0x06, 0x00, 0x0B, 0x00, 0x06, 0x00
_0210FAC4:
	.byte 0x04, 0x00, 0x08, 0x00, 0x0B, 0x00, 0x08, 0x00

	.text

	thumb_func_start sub_02056D7C
sub_02056D7C: ; 0x02056D7C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldr r1, _02056E2C ; =_021D41C4
	ldr r2, [r1]
	cmp r2, #0
	beq _02056D8C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02056D8C:
	bne _02056D98
	str r0, [r1]
	mov r1, #0
	mov r2, #0xf4
	bl MI_CpuFill8
_02056D98:
	ldr r0, _02056E2C ; =_021D41C4
	ldr r2, _02056E30 ; =0x0000FFFF
	ldr r1, [r0]
	mov r7, #2
	str r4, [r1, #0x30]
	mov r4, #0
	add r5, r4, #0
	sub r3, r4, #1
	add r1, r4, #0
_02056DAA:
	ldr r6, [r0]
	add r6, r6, r5
	add r6, #0x78
	strb r3, [r6]
	ldr r6, [r0]
	add r6, r6, r5
	add r6, #0x74
	strh r2, [r6]
	ldr r6, [r0]
	add r6, r6, r5
	add r6, #0x76
	strh r2, [r6]
	ldr r6, [r0]
	add r6, r6, r5
	add r6, #0x79
	strb r7, [r6]
	ldr r6, [r0]
	add r6, r6, r5
	add r6, #0x38
	strb r3, [r6]
	ldr r6, [r0]
	add r6, r6, r5
	strh r2, [r6, #0x34]
	ldr r6, [r0]
	add r6, r6, r5
	strh r2, [r6, #0x36]
	ldr r6, [r0]
	add r6, r6, r5
	add r6, #0x39
	strb r7, [r6]
	ldr r6, [r0]
	add r5, #8
	add r6, r6, r4
	add r6, #0xb4
	strb r1, [r6]
	ldr r6, [r0]
	add r6, r6, r4
	add r6, #0xbc
	add r4, r4, #1
	strb r1, [r6]
	cmp r4, #8
	blt _02056DAA
	ldr r2, _02056E2C ; =_021D41C4
	ldr r0, [r2]
	add r0, #0xed
	strb r1, [r0]
	ldr r0, [r2]
	add r0, #0xef
	strb r1, [r0]
	ldr r1, [r2]
	ldr r0, _02056E34 ; =sub_020572DC
	ldr r1, [r1, #0x30]
	mov r2, #0xc8
	bl CreateSysTask
	ldr r1, _02056E2C ; =_021D41C4
	ldr r1, [r1]
	str r0, [r1, #0x2c]
	bl sub_020374E4
	bl sub_02056EF4
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02056E2C: .word _021D41C4
_02056E30: .word 0x0000FFFF
_02056E34: .word sub_020572DC
	thumb_func_end sub_02056D7C

	thumb_func_start sub_02056E38
sub_02056E38: ; 0x02056E38
	push {r3, r4, r5, lr}
	ldr r0, _02056E5C ; =_021D41C4
	ldr r0, [r0]
	cmp r0, #0
	beq _02056E58
	mov r5, #0
	mov r4, #1
_02056E46:
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	add r1, r4, #0
	add r2, r4, #0
	bl sub_0205724C
	add r5, r5, #1
	cmp r5, #8
	blt _02056E46
_02056E58:
	pop {r3, r4, r5, pc}
	nop
_02056E5C: .word _021D41C4
	thumb_func_end sub_02056E38

	thumb_func_start sub_02056E60
sub_02056E60: ; 0x02056E60
	push {r3, lr}
	ldr r0, _02056E9C ; =_021D41C4
	ldr r2, [r0]
	cmp r2, #0
	beq _02056E9A
	mov r1, #1
	add r2, #0xec
	strb r1, [r2]
	ldr r0, [r0]
	mov r1, #0
	add r0, #0xee
	strb r1, [r0]
	bl sub_02056EF4
	mov r0, #1
	bl sub_0205701C
	ldr r0, _02056E9C ; =_021D41C4
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #0x40]
	bl GetPlayerXCoord
	ldr r0, _02056E9C ; =_021D41C4
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #0x40]
	bl GetPlayerYCoord
_02056E9A:
	pop {r3, pc}
	.balign 4, 0
_02056E9C: .word _021D41C4
	thumb_func_end sub_02056E60

	thumb_func_start sub_02056EA0
sub_02056EA0: ; 0x02056EA0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _02056EDC ; =_021D41C4
	ldr r0, [r0]
	cmp r0, #0
	beq _02056EDA
	mov r4, #0
	add r6, r4, #0
_02056EB0:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	add r2, r5, #0
	bl sub_0205724C
	add r4, r4, #1
	cmp r4, #8
	blt _02056EB0
	ldr r0, _02056EDC ; =_021D41C4
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bl DestroySysTask
	ldr r0, _02056EDC ; =_021D41C4
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _02056EDC ; =_021D41C4
	mov r1, #0
	str r1, [r0]
_02056EDA:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02056EDC: .word _021D41C4
	thumb_func_end sub_02056EA0

	thumb_func_start sub_02056EE0
sub_02056EE0: ; 0x02056EE0
	ldr r0, _02056EF0 ; =_021D41C4
	ldr r0, [r0]
	cmp r0, #0
	beq _02056EEC
	mov r0, #1
	bx lr
_02056EEC:
	mov r0, #0
	bx lr
	.balign 4, 0
_02056EF0: .word _021D41C4
	thumb_func_end sub_02056EE0

	thumb_func_start sub_02056EF4
sub_02056EF4: ; 0x02056EF4
	push {r4, lr}
	bl sub_0203769C
	ldr r1, _02056FCC ; =_021D41C4
	lsl r0, r0, #2
	ldr r2, [r1]
	ldr r1, [r2, #0x30]
	add r0, r2, r0
	ldr r1, [r1, #0x40]
	str r1, [r0, #4]
	bl sub_0203769C
	ldr r1, _02056FCC ; =_021D41C4
	mov r2, #1
	ldr r1, [r1]
	add r0, r1, r0
	add r0, #0x24
	strb r2, [r0]
	bl sub_0203769C
	add r4, r0, #0
	ldr r0, _02056FCC ; =_021D41C4
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #0x40]
	bl GetPlayerXCoord
	ldr r1, _02056FCC ; =_021D41C4
	ldr r2, [r1]
	lsl r1, r4, #3
	add r1, r2, r1
	add r1, #0x74
	strh r0, [r1]
	bl sub_0203769C
	add r4, r0, #0
	ldr r0, _02056FCC ; =_021D41C4
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #0x40]
	bl GetPlayerYCoord
	ldr r1, _02056FCC ; =_021D41C4
	ldr r2, [r1]
	lsl r1, r4, #3
	add r1, r2, r1
	add r1, #0x76
	strh r0, [r1]
	bl sub_0203769C
	add r4, r0, #0
	ldr r0, _02056FCC ; =_021D41C4
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetFacingDirection
	ldr r1, _02056FCC ; =_021D41C4
	ldr r2, [r1]
	lsl r1, r4, #3
	add r1, r2, r1
	add r1, #0x78
	strb r0, [r1]
	bl sub_0203769C
	add r4, r0, #0
	ldr r0, _02056FCC ; =_021D41C4
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #0x40]
	bl GetPlayerXCoord
	ldr r1, _02056FCC ; =_021D41C4
	ldr r2, [r1]
	lsl r1, r4, #3
	add r1, r2, r1
	strh r0, [r1, #0x34]
	bl sub_0203769C
	add r4, r0, #0
	ldr r0, _02056FCC ; =_021D41C4
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #0x40]
	bl GetPlayerYCoord
	ldr r1, _02056FCC ; =_021D41C4
	ldr r2, [r1]
	lsl r1, r4, #3
	add r1, r2, r1
	strh r0, [r1, #0x36]
	bl sub_0203769C
	add r4, r0, #0
	ldr r0, _02056FCC ; =_021D41C4
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetFacingDirection
	ldr r1, _02056FCC ; =_021D41C4
	ldr r2, [r1]
	lsl r1, r4, #3
	add r1, r2, r1
	add r1, #0x38
	strb r0, [r1]
	pop {r4, pc}
	nop
_02056FCC: .word _021D41C4
	thumb_func_end sub_02056EF4

	thumb_func_start sub_02056FD0
sub_02056FD0: ; 0x02056FD0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _02057018 ; =_021D41C4
	add r4, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, sp, #0
	strb r4, [r1]
	asr r2, r4, #8
	strb r2, [r1, #1]
	asr r2, r6, #8
	strb r6, [r1, #2]
	strb r2, [r1, #3]
	strb r0, [r1, #4]
	cmp r5, #0
	beq _02057002
	ldrb r2, [r1, #4]
	mov r0, #0x80
	orr r0, r2
	strb r0, [r1, #4]
_02057002:
	mov r0, #0x16
	add r1, sp, #0
	bl sub_020376E0
	ldr r0, _02057018 ; =_021D41C4
	mov r1, #1
	ldr r0, [r0]
	add r0, #0xec
	strb r1, [r0]
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02057018: .word _021D41C4
	thumb_func_end sub_02056FD0

	thumb_func_start sub_0205701C
sub_0205701C: ; 0x0205701C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02057048 ; =_021D41C4
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #0x40]
	bl GetPlayerXCoord
	add r4, r0, #0
	ldr r0, _02057048 ; =_021D41C4
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #0x40]
	bl GetPlayerYCoord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02056FD0
	pop {r3, r4, r5, pc}
	nop
_02057048: .word _021D41C4
	thumb_func_end sub_0205701C

	thumb_func_start sub_0205704C
sub_0205704C: ; 0x0205704C
	push {r3, r4, r5, lr}
	sub sp, #8
	ldrh r2, [r1]
	mov r4, #0xf
	lsl r4, r4, #0xc
	ldrh r3, [r1, #2]
	cmp r2, r4
	blo _0205705E
	sub r2, r4, #1
_0205705E:
	mov r4, #0xf
	lsl r4, r4, #0xc
	cmp r3, r4
	blo _02057068
	sub r3, r4, #1
_02057068:
	mov r4, #0xf
	and r0, r4
	add r4, sp, #0
	strb r0, [r4]
	strb r2, [r4, #1]
	asr r2, r2, #8
	add r5, r2, #0
	mov r0, #1
	and r5, r0
	asr r2, r3, #7
	mov r0, #2
	and r0, r2
	add r0, r5, r0
	strb r0, [r4, #2]
	strb r3, [r4, #3]
	ldrb r0, [r1, #7]
	cmp r0, #0
	beq _02057094
	ldrb r2, [r4, #2]
	mov r0, #0x80
	orr r0, r2
	strb r0, [r4, #2]
_02057094:
	mov r2, #4
	ldrsb r2, [r1, r2]
	add r5, sp, #0
	ldrb r0, [r5]
	lsr r4, r2, #0x1f
	lsl r3, r2, #0x1e
	sub r3, r3, r4
	mov r2, #0x1e
	ror r3, r2
	add r2, r4, r3
	lsl r2, r2, #4
	add r0, r0, r2
	strb r0, [r5]
	ldrb r0, [r1, #5]
	ldrb r2, [r5]
	add r1, sp, #0
	lsl r0, r0, #6
	add r0, r2, r0
	strb r0, [r5]
	mov r0, #0x17
	mov r2, #0
	bl sub_02037108
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205704C

	thumb_func_start sub_020570C8
sub_020570C8: ; 0x020570C8
	push {r3, r4, r5, lr}
	ldr r0, _02057128 ; =_021D41C4
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #0x40]
	bl sub_0205C6CC
	add r4, r0, #0
	ldr r0, _02057128 ; =_021D41C4
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #0x40]
	bl sub_0205C6D4
	add r5, r0, #0
	cmp r4, #0
	bne _02057112
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	beq _02057112
	ldr r0, _02057128 ; =_021D41C4
	ldr r0, [r0]
	add r0, #0xeb
	ldrb r0, [r0]
	cmp r0, #0
	bne _02057112
	mov r0, #1
	bl sub_0205701C
	ldr r0, _02057128 ; =_021D41C4
	mov r1, #1
	ldr r0, [r0]
	add r0, #0xeb
	strb r1, [r0]
_02057112:
	cmp r4, #1
	bne _02057124
	cmp r5, #1
	bne _02057124
	ldr r0, _02057128 ; =_021D41C4
	mov r1, #0
	ldr r0, [r0]
	add r0, #0xeb
	strb r1, [r0]
_02057124:
	pop {r3, r4, r5, pc}
	nop
_02057128: .word _021D41C4
	thumb_func_end sub_020570C8

	thumb_func_start sub_0205712C
sub_0205712C: ; 0x0205712C
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r7, _0205717C ; =_021D41C4
	add r5, r4, #0
	add r6, r4, #0
_02057136:
	ldr r0, [r7]
	add r1, r0, r4
	add r1, #0x24
	ldrb r1, [r1]
	cmp r1, #0
	beq _02057168
	add r2, r0, r4
	add r2, #0xcc
	ldrb r2, [r2]
	add r1, r0, #0
	add r1, #0x34
	cmp r2, #0
	bne _0205715A
	add r2, r0, #0
	add r2, #0xec
	ldrb r2, [r2]
	cmp r2, #0
	beq _02057168
_0205715A:
	add r0, r0, r4
	add r0, #0xcc
	strb r6, [r0]
	add r0, r4, #0
	add r1, r1, r5
	bl sub_0205704C
_02057168:
	add r4, r4, #1
	add r5, #8
	cmp r4, #8
	blt _02057136
	ldr r0, _0205717C ; =_021D41C4
	mov r1, #0
	ldr r0, [r0]
	add r0, #0xec
	strb r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205717C: .word _021D41C4
	thumb_func_end sub_0205712C

	thumb_func_start sub_02057180
sub_02057180: ; 0x02057180
	mov r0, #0xf4
	bx lr
	thumb_func_end sub_02057180

	thumb_func_start sub_02057184
sub_02057184: ; 0x02057184
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r1, _02057248 ; =_021D41C4
	add r5, r0, #0
	ldr r2, [r1]
	lsl r4, r5, #2
	add r1, r2, r4
	ldr r1, [r1, #4]
	cmp r1, #0
	bne _02057242
	add r2, #0xee
	ldrb r1, [r2]
	cmp r1, #0
	bne _02057242
	bl sub_02034818
	str r0, [sp, #0x14]
	cmp r0, #0
	beq _02057242
	bl sub_0203769C
	cmp r5, r0
	beq _020571CC
	ldr r0, _02057248 ; =_021D41C4
	mov r1, #1
	ldr r0, [r0]
	lsl r1, r1, #8
	ldr r0, [r0, #0x30]
	add r1, r5, r1
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	cmp r0, #0
	beq _020571CC
	bl MapObject_Remove
_020571CC:
	ldr r0, [sp, #0x14]
	mov r7, #2
	bl PlayerProfile_GetVersion
	cmp r0, #0
	bne _020571DC
	mov r7, #1
	b _020571E2
_020571DC:
	cmp r0, #0xc
	bne _020571E2
	mov r7, #0
_020571E2:
	lsl r0, r5, #3
	str r0, [sp, #0x10]
	ldr r0, _02057248 ; =_021D41C4
	ldr r6, [r0]
	ldr r0, [sp, #0x14]
	bl PlayerProfile_GetTrainerGender
	mov r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r1, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r0, [r6, #0x30]
	add r3, r6, r1
	add r1, r3, #0
	add r2, r3, #0
	add r1, #0x74
	add r2, #0x76
	mov r6, #0x78
	ldrh r1, [r1]
	ldrh r2, [r2]
	ldrsb r3, [r3, r6]
	ldr r0, [r0, #0x3c]
	bl sub_0205C390
	add r6, r0, #0
	bne _0205721E
	bl GF_AssertFail
_0205721E:
	ldr r0, _02057248 ; =_021D41C4
	ldr r0, [r0]
	add r0, r0, r4
	str r6, [r0, #4]
	add r0, r6, #0
	bl PlayerAvatar_GetMapObject
	mov r1, #1
	lsl r1, r1, #8
	add r1, r5, r1
	bl MapObject_SetID
	ldr r0, _02057248 ; =_021D41C4
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, r5
	add r0, #0x24
	strb r1, [r0]
_02057242:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02057248: .word _021D41C4
	thumb_func_end sub_02057184

	thumb_func_start sub_0205724C
sub_0205724C: ; 0x0205724C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _020572A8 ; =_021D41C4
	add r6, r1, #0
	ldr r1, [r0]
	cmp r1, #0
	beq _020572A4
	lsl r4, r5, #2
	add r0, r1, r4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02057284
	ldr r1, [r1, #0x30]
	ldr r1, [r1, #0x40]
	cmp r1, r0
	beq _0205727A
	cmp r2, #0
	beq _02057276
	bl sub_0205C4CC
	b _0205727A
_02057276:
	bl sub_0205C4C4
_0205727A:
	ldr r0, _020572A8 ; =_021D41C4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, r4
	str r1, [r0, #4]
_02057284:
	ldr r0, _020572A8 ; =_021D41C4
	ldr r1, [r0]
	add r1, #0x24
	ldrb r0, [r1, r5]
	cmp r0, #0
	beq _02057298
	cmp r6, #0
	bne _02057298
	mov r0, #0
	strb r0, [r1, r5]
_02057298:
	ldr r0, _020572A8 ; =_021D41C4
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, r5
	add r0, #0xcc
	strb r1, [r0]
_020572A4:
	pop {r4, r5, r6, pc}
	nop
_020572A8: .word _021D41C4
	thumb_func_end sub_0205724C

	thumb_func_start sub_020572AC
sub_020572AC: ; 0x020572AC
	push {r4, lr}
	ldr r1, _020572D8 ; =gSystem
	mov r4, #2
	ldr r1, [r1, #0x44]
	tst r1, r4
	beq _020572BC
	mov r4, #1
	b _020572CE
_020572BC:
	cmp r0, #0
	beq _020572CE
	bl FieldSys_GetPlayerAvatar
	bl sub_0205CB38
	cmp r0, #0
	beq _020572CE
	mov r4, #1
_020572CE:
	add r0, r4, #0
	bl sub_02037498
	pop {r4, pc}
	nop
_020572D8: .word gSystem
	thumb_func_end sub_020572AC

	thumb_func_start sub_020572DC
sub_020572DC: ; 0x020572DC
	push {r4, lr}
	add r4, r1, #0
	bl sub_02037474
	cmp r0, #0
	beq _02057310
	add r0, r4, #0
	bl sub_020572AC
	bl sub_0203769C
	cmp r0, #0
	bne _02057304
	add r0, r4, #0
	bl sub_0205712C
	add r0, r4, #0
	bl sub_020570C8
	b _0205730A
_02057304:
	add r0, r4, #0
	bl sub_020570C8
_0205730A:
	add r0, r4, #0
	bl sub_02057314
_02057310:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020572DC

	thumb_func_start sub_02057314
sub_02057314: ; 0x02057314
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	ldr r4, _02057354 ; =_021D41C4
	add r7, r5, #0
	add r6, sp, #0
_0205731E:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _02057332
	add r0, r5, #0
	bl sub_02057818
	b _0205734C
_02057332:
	ldr r3, [r4]
	add r0, r3, r5
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0205734C
	strb r5, [r6]
	ldr r3, [r3, #0x30]
	add r0, r7, #0
	mov r1, #1
	add r2, sp, #0
	bl sub_0205776C
_0205734C:
	add r5, r5, #1
	cmp r5, #8
	blt _0205731E
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02057354: .word _021D41C4
	thumb_func_end sub_02057314

	thumb_func_start sub_02057358
sub_02057358: ; 0x02057358
	push {r3, lr}
	ldr r1, _02057380 ; =_021D41C4
	ldr r2, [r1]
	cmp r2, #0
	beq _0205737C
	add r1, r2, #0
	add r1, #0xed
	ldrb r1, [r1]
	cmp r1, r0
	beq _02057370
	add r2, #0xed
	strb r0, [r2]
_02057370:
	ldr r1, _02057380 ; =_021D41C4
	mov r0, #0x3e
	ldr r1, [r1]
	add r1, #0xed
	bl sub_020376E0
_0205737C:
	pop {r3, pc}
	nop
_02057380: .word _021D41C4
	thumb_func_end sub_02057358

	thumb_func_start sub_02057384
sub_02057384: ; 0x02057384
	push {r3, lr}
	ldr r2, _020573A8 ; =_021D41C4
	ldr r3, [r2]
	cmp r3, #0
	beq _020573A6
	add r1, r3, #0
	add r1, #0xed
	ldrb r1, [r1]
	cmp r1, r0
	beq _020573A6
	add r3, #0xed
	strb r0, [r3]
	ldr r1, [r2]
	mov r0, #0x3e
	add r1, #0xed
	bl sub_020376E0
_020573A6:
	pop {r3, pc}
	.balign 4, 0
_020573A8: .word _021D41C4
	thumb_func_end sub_02057384

	thumb_func_start sub_020573AC
sub_020573AC: ; 0x020573AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _020573EC ; =_021D41C4
	add r4, r2, #0
	ldr r0, [r0]
	cmp r0, #0
	beq _020573E8
	cmp r1, #1
	beq _020573C2
	bl GF_AssertFail
_020573C2:
	cmp r5, #8
	blt _020573CA
	bl GF_AssertFail
_020573CA:
	ldrb r0, [r4]
	mov r1, #1
	cmp r0, #1
	beq _020573D8
	cmp r0, #0
	beq _020573D8
	mov r1, #0
_020573D8:
	cmp r1, #0
	bne _020573E0
	bl GF_AssertFail
_020573E0:
	ldrb r1, [r4]
	add r0, r5, #0
	bl sub_02057C5C
_020573E8:
	pop {r3, r4, r5, pc}
	nop
_020573EC: .word _021D41C4
	thumb_func_end sub_020573AC

	thumb_func_start sub_020573F0
sub_020573F0: ; 0x020573F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02057450 ; =_021D41C4
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	beq _0205744E
	add r0, r4, #0
	bl sub_02057384
	ldr r0, _02057450 ; =_021D41C4
	ldr r0, [r0]
	add r0, #0xf1
	strb r4, [r0]
	ldr r4, [r5, #0x40]
	cmp r4, #0
	beq _02057420
	bl sub_0203769C
	ldr r1, _02057450 ; =_021D41C4
	lsl r0, r0, #2
	ldr r1, [r1]
	add r0, r1, r0
	str r4, [r0, #4]
_02057420:
	bl sub_02037474
	cmp r0, #0
	beq _0205743A
	bl sub_0203769C
	cmp r0, #0
	bne _0205743A
	ldr r1, _02057450 ; =_021D41C4
	mov r0, #0
	ldr r1, [r1]
	bl sub_02057550
_0205743A:
	bl sub_02037474
	cmp r0, #0
	beq _0205744E
	bl sub_0203769C
	cmp r0, #0
	bne _0205744E
	bl sub_02057D74
_0205744E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02057450: .word _021D41C4
	thumb_func_end sub_020573F0

	thumb_func_start sub_02057454
sub_02057454: ; 0x02057454
	mov r0, #0x20
	tst r0, r1
	beq _0205745E
	mov r0, #2
	bx lr
_0205745E:
	mov r0, #0x10
	tst r0, r1
	beq _02057468
	mov r0, #3
	bx lr
_02057468:
	mov r0, #0x40
	tst r0, r1
	beq _02057472
	mov r0, #0
	bx lr
_02057472:
	mov r0, #0x80
	tst r1, r0
	beq _0205747C
	mov r0, #1
	bx lr
_0205747C:
	sub r0, #0x81
	bx lr
	thumb_func_end sub_02057454

	thumb_func_start sub_02057480
sub_02057480: ; 0x02057480
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _020574C0 ; =_021D41C4
	add r6, r1, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	bl Field_GetNumObjectEvents
	add r4, r0, #0
	ldr r0, _020574C0 ; =_021D41C4
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	bl Field_GetObjectEvents
	mov r2, #0
	cmp r4, #0
	ble _020574BA
_020574A2:
	ldrh r1, [r0, #0x18]
	cmp r5, r1
	bne _020574B2
	ldrh r1, [r0, #0x1a]
	cmp r6, r1
	bne _020574B2
	mov r0, #1
	pop {r4, r5, r6, pc}
_020574B2:
	add r2, r2, #1
	add r0, #0x20
	cmp r2, r4
	blt _020574A2
_020574BA:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_020574C0: .word _021D41C4
	thumb_func_end sub_02057480

	thumb_func_start sub_020574C4
sub_020574C4: ; 0x020574C4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0205751C ; =0x0000FFFF
	add r6, r1, #0
	add r7, r2, #0
	cmp r5, r0
	beq _0205750A
	cmp r6, r0
	beq _0205750A
	mov r4, #0
_020574D8:
	cmp r4, r7
	beq _020574F4
	add r0, r4, #0
	bl sub_02057B4C
	cmp r5, r0
	bne _020574F4
	add r0, r4, #0
	bl sub_02057B9C
	cmp r6, r0
	bne _020574F4
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020574F4:
	add r4, r4, #1
	cmp r4, #8
	blt _020574D8
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02057480
	cmp r0, #0
	beq _0205750A
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205750A:
	ldr r0, _02057520 ; =_021D41C4
	add r1, r5, #0
	ldr r0, [r0]
	add r2, r6, #0
	ldr r0, [r0, #0x30]
	bl sub_020548C0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0205751C: .word 0x0000FFFF
_02057520: .word _021D41C4
	thumb_func_end sub_020574C4

	thumb_func_start sub_02057524
sub_02057524: ; 0x02057524
	push {r3, r4, lr}
	sub sp, #0x14
	ldr r3, _0205754C ; =_020FC7B8
	add r4, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	cmp r4, #5
	str r0, [r2]
	blt _02057542
	bl GF_AssertFail
_02057542:
	lsl r1, r4, #2
	add r0, sp, #0
	ldr r0, [r0, r1]
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_0205754C: .word _020FC7B8
	thumb_func_end sub_02057524

	thumb_func_start sub_02057550
sub_02057550: ; 0x02057550
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r5, #0
	ldr r6, _020576B8 ; =_021D41C4
	str r5, [sp]
_0205755A:
	ldr r0, [r6]
	add r1, r0, r5
	add r1, #0x24
	ldrb r1, [r1]
	cmp r1, #0
	beq _02057570
	add r1, r0, r5
	add r1, #0xb4
	ldrb r1, [r1]
	cmp r1, #0
	bne _02057572
_02057570:
	b _020576A4
_02057572:
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x34
	add r4, r2, r1
	add r1, r0, r5
	add r1, #0xd4
	ldrb r1, [r1]
	cmp r1, #0
	beq _02057592
	add r1, r0, r5
	add r1, #0xd4
	ldrb r1, [r1]
	add r0, r0, r5
	add r0, #0xd4
	sub r1, r1, #1
	strb r1, [r0]
_02057592:
	ldr r0, [r6]
	add r0, r0, r5
	add r0, #0xbc
	ldrb r0, [r0]
	cmp r0, #0
	beq _020575A2
	mov r7, #0
	b _020575AA
_020575A2:
	add r0, r5, #0
	bl sub_020374C0
	add r7, r0, #0
_020575AA:
	add r0, r5, #0
	bl sub_020374AC
	strb r0, [r4, #5]
	ldr r0, [r6]
	add r1, r0, r5
	add r1, #0xd4
	ldrb r1, [r1]
	cmp r1, #0
	bne _020576A4
	ldrb r1, [r4, #7]
	cmp r1, #1
	bne _020575CC
	add r1, r0, r5
	add r1, #0xcc
	mov r0, #1
	strb r0, [r1]
_020575CC:
	mov r0, #0
	strb r0, [r4, #7]
	ldr r1, [r6]
	add r0, r1, r5
	add r0, #0xc4
	ldrb r0, [r0]
	cmp r0, #2
	bne _020575E6
	add r1, r1, r5
	add r1, #0xc4
	mov r0, #1
	strb r0, [r1]
	b _020576A4
_020575E6:
	add r0, r7, #0
	add r1, r7, #0
	bl sub_02057454
	add r7, r0, #0
	add r0, r5, #0
	bl sub_02057BEC
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_02057C24
	str r0, [sp, #8]
	ldr r1, [sp, #4]
	ldr r0, _020576BC ; =0x0000FFFF
	cmp r1, r0
	beq _020576A4
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _020576A4
	mov r0, #0
	mvn r0, r0
	cmp r7, r0
	beq _020576A4
	mov r0, #4
	ldrsb r0, [r4, r0]
	cmp r0, r7
	beq _02057650
	strb r7, [r4, #4]
	ldr r0, [r6]
	add r1, r0, r5
	add r1, #0xd4
	mov r0, #4
	strb r0, [r1]
	ldr r0, [r6]
	add r1, r0, r5
	add r1, #0xcc
	mov r0, #1
	strb r0, [r1]
	ldr r0, [r6]
	add r1, r0, r5
	add r1, #0xc4
	ldrb r1, [r1]
	cmp r1, #2
	bls _020576A4
	add r1, r0, r5
	add r1, #0xc4
	ldrb r1, [r1]
	add r0, r0, r5
	add r0, #0xc4
	sub r1, r1, #1
	strb r1, [r0]
	b _020576A4
_02057650:
	ldr r0, [r6]
	add r0, r0, r5
	add r0, #0xc4
	ldrb r0, [r0]
	cmp r0, #0
	bne _020576A4
	ldr r0, [sp, #4]
	add r2, r5, #0
	bl sub_020574C4
	cmp r0, #0
	beq _02057682
	mov r0, #1
	strb r0, [r4, #7]
	ldr r0, [r6]
	add r1, r0, r5
	add r1, #0xcc
	mov r0, #1
	strb r0, [r1]
	ldr r0, [r6]
	add r1, r0, r5
	add r1, #0xd4
	mov r0, #4
	strb r0, [r1]
	b _020576A4
_02057682:
	ldr r0, [r6]
	add r1, r0, r5
	add r1, #0xcc
	mov r0, #1
	strb r0, [r1]
	ldr r0, [sp, #4]
	strh r0, [r4]
	ldr r0, [sp, #8]
	strh r0, [r4, #2]
	strb r7, [r4, #4]
	ldrb r0, [r4, #5]
	bl sub_02057524
	ldr r1, [r6]
	add r1, r1, r5
	add r1, #0xd4
	strb r0, [r1]
_020576A4:
	ldr r0, [sp]
	add r5, r5, #1
	add r0, #8
	str r0, [sp]
	cmp r5, #8
	bge _020576B2
	b _0205755A
_020576B2:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_020576B8: .word _021D41C4
_020576BC: .word 0x0000FFFF
	thumb_func_end sub_02057550

	thumb_func_start sub_020576C0
sub_020576C0: ; 0x020576C0
	push {r4, r5, r6, lr}
	ldr r3, _02057768 ; =_021D41C4
	add r1, r0, #0
	ldr r4, [r3]
	add r0, r2, #0
	cmp r4, #0
	beq _02057764
	add r5, r4, #0
	ldrb r6, [r0, #4]
	add r5, #0x34
	lsl r2, r1, #3
	add r2, r5, r2
	mov r5, #0x80
	tst r5, r6
	beq _020576E6
	mov r0, #1
	add r4, #0xec
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_020576E6:
	mov r4, #4
	ldrsb r5, [r2, r4]
	sub r4, r4, #5
	cmp r5, r4
	bne _02057702
	mov r5, #0
	mov r4, #1
_020576F4:
	ldr r6, [r3]
	add r6, r6, r5
	add r6, #0xcc
	add r5, r5, #1
	strb r4, [r6]
	cmp r5, #8
	blt _020576F4
_02057702:
	mov r3, #0
	strh r3, [r2]
	strh r3, [r2, #2]
	ldrh r4, [r2]
	ldrb r3, [r0]
	add r3, r4, r3
	strh r3, [r2]
	ldrb r4, [r0, #1]
	ldrh r3, [r2]
	lsl r5, r4, #8
	mov r4, #0xff
	lsl r4, r4, #8
	and r5, r4
	add r3, r3, r5
	strh r3, [r2]
	ldrh r5, [r2, #2]
	ldrb r3, [r0, #2]
	add r3, r5, r3
	strh r3, [r2, #2]
	ldrb r5, [r0, #3]
	ldrh r3, [r2, #2]
	lsl r5, r5, #8
	and r4, r5
	add r3, r3, r4
	strh r3, [r2, #2]
	ldrb r3, [r0, #4]
	mov r0, #0xf
	ldr r4, _02057768 ; =_021D41C4
	and r0, r3
	strb r0, [r2, #4]
	ldr r3, [r4]
	mov r0, #1
	add r3, r3, r1
	add r3, #0x24
	strb r0, [r3]
	ldr r3, [r4]
	add r1, r3, r1
	add r1, #0xcc
	strb r0, [r1]
	ldr r0, [r4]
	ldrh r1, [r2]
	ldrh r2, [r2, #2]
	ldr r0, [r0, #0x30]
	bl sub_020548C0
	cmp r0, #0
	beq _02057764
	bl GF_AssertFail
_02057764:
	pop {r4, r5, r6, pc}
	nop
_02057768: .word _021D41C4
	thumb_func_end sub_020576C0

	thumb_func_start sub_0205776C
sub_0205776C: ; 0x0205776C
	push {r4, lr}
	ldr r0, _02057794 ; =_021D41C4
	ldrb r4, [r2]
	ldr r0, [r0]
	cmp r0, #0
	beq _02057790
	bl sub_0203769C
	cmp r4, r0
	beq _02057790
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl sub_0205724C
	add r0, r4, #0
	bl sub_020346E8
_02057790:
	pop {r4, pc}
	nop
_02057794: .word _021D41C4
	thumb_func_end sub_0205776C

	thumb_func_start sub_02057798
sub_02057798: ; 0x02057798
	mov r0, #5
	bx lr
	thumb_func_end sub_02057798

	thumb_func_start sub_0205779C
sub_0205779C: ; 0x0205779C
	push {r3, r4, r5, lr}
	ldrb r1, [r2]
	mov r0, #0xf
	add r3, r1, #0
	and r3, r0
	ldr r0, _02057814 ; =_021D41C4
	ldr r1, [r0]
	cmp r1, #0
	beq _02057810
	ldrb r4, [r2, #2]
	add r1, #0x74
	lsl r0, r3, #3
	add r1, r1, r0
	mov r0, #0x80
	tst r0, r4
	beq _020577C0
	mov r0, #1
	b _020577C2
_020577C0:
	mov r0, #0
_020577C2:
	strb r0, [r1, #7]
	mov r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	ldrh r4, [r1]
	ldrb r0, [r2, #1]
	add r0, r4, r0
	strh r0, [r1]
	ldrb r4, [r2, #2]
	ldrh r0, [r1]
	lsl r5, r4, #8
	mov r4, #1
	lsl r4, r4, #8
	and r5, r4
	add r0, r0, r5
	strh r0, [r1]
	ldrh r5, [r1, #2]
	ldrb r0, [r2, #3]
	add r0, r5, r0
	strh r0, [r1, #2]
	ldrb r5, [r2, #2]
	ldrh r0, [r1, #2]
	lsl r5, r5, #7
	and r4, r5
	add r0, r0, r4
	strh r0, [r1, #2]
	ldrb r0, [r2]
	asr r4, r0, #4
	mov r0, #3
	and r4, r0
	strb r4, [r1, #4]
	ldrb r2, [r2]
	asr r2, r2, #6
	and r0, r2
	strb r0, [r1, #5]
	lsl r0, r3, #0x18
	lsr r0, r0, #0x18
	bl sub_02057184
_02057810:
	pop {r3, r4, r5, pc}
	nop
_02057814: .word _021D41C4
	thumb_func_end sub_0205779C

	thumb_func_start sub_02057818
sub_02057818: ; 0x02057818
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, _02057A00 ; =_021D41C4
	lsl r1, r5, #3
	ldr r0, [r0]
	add r2, r0, #0
	add r2, #0x74
	add r6, r2, r1
	add r2, r0, #0
	add r2, #0xdc
	ldrb r1, [r2, r5]
	cmp r1, #0
	beq _0205783C
	sub r0, r1, #1
	add sp, #0x1c
	strb r0, [r2, r5]
	pop {r4, r5, r6, r7, pc}
_0205783C:
	ldrh r2, [r6]
	ldr r1, _02057A04 ; =0x0000FFFF
	cmp r2, r1
	beq _02057866
	ldrh r2, [r6, #2]
	cmp r2, r1
	beq _02057866
	add r0, #0xee
	ldrb r0, [r0]
	cmp r0, #0
	bne _02057866
	bl sub_0203769C
	cmp r5, r0
	bne _02057868
	ldr r0, _02057A00 ; =_021D41C4
	ldr r0, [r0]
	add r0, #0xf1
	ldrb r0, [r0]
	cmp r0, #0
	bne _02057868
_02057866:
	b _020579FC
_02057868:
	ldr r0, _02057A00 ; =_021D41C4
	ldr r1, [r0]
	lsl r0, r5, #2
	add r0, r1, r0
	ldr r0, [r0, #4]
	str r0, [sp, #0x18]
	cmp r0, #0
	bne _0205787A
	b _020579FC
_0205787A:
	bl GetPlayerXCoord
	ldrh r1, [r6]
	sub r0, r0, r1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	bl GetPlayerYCoord
	ldrh r1, [r6, #2]
	sub r7, r0, r1
	ldr r0, [sp, #0x18]
	bl PlayerAvatar_GetFacingDirection
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _020578A4
	cmp r7, #0
	bne _020578A4
	mov r4, #0
	b _020578CE
_020578A4:
	ldr r0, [sp, #0x10]
	bl abs
	add r4, r0, #0
	add r0, r7, #0
	bl abs
	cmp r4, r0
	ble _020578C4
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ble _020578C0
	mov r4, #0x20
	b _020578CE
_020578C0:
	mov r4, #0x10
	b _020578CE
_020578C4:
	cmp r7, #0
	ble _020578CC
	mov r4, #0x40
	b _020578CE
_020578CC:
	mov r4, #0x80
_020578CE:
	add r0, r7, #0
	bl abs
	ldr r0, [sp, #0x10]
	bl abs
	ldrb r0, [r6, #5]
	mov r7, #0xff
	str r0, [sp, #0x14]
	cmp r0, #3
	bhi _02057916
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020578F0: ; jump table
	.short _020578F8 - _020578F0 - 2 ; case 0
	.short _020578FE - _020578F0 - 2 ; case 1
	.short _0205790C - _020578F0 - 2 ; case 2
	.short _02057912 - _020578F0 - 2 ; case 3
_020578F8:
	mov r0, #5
	str r0, [sp, #8]
	b _02057916
_020578FE:
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #2
	orr r0, r4
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	b _02057916
_0205790C:
	mov r0, #2
	str r0, [sp, #8]
	b _02057916
_02057912:
	mov r0, #1
	str r0, [sp, #8]
_02057916:
	ldr r0, _02057A00 ; =_021D41C4
	ldr r0, [r0]
	add r0, #0xf0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0205793C
	bl sub_0203769C
	cmp r5, r0
	bne _0205793C
	ldr r0, _02057A00 ; =_021D41C4
	ldr r1, [r0]
	add r0, r1, #0
	add r0, #0xf0
	ldrb r0, [r0]
	add r1, #0xf0
	sub r0, r0, #1
	strb r0, [r1]
	b _020579A8
_0205793C:
	mov r0, #2
	add r1, r4, #0
	bic r1, r0
	bne _0205797A
	ldrb r0, [r6, #7]
	cmp r0, #0
	beq _0205797A
	mov r0, #3
	str r0, [sp, #0x14]
	mov r0, #4
	ldrsb r0, [r6, r0]
	cmp r0, #3
	bhi _0205796E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02057962: ; jump table
	.short _0205796A - _02057962 - 2 ; case 0
	.short _0205796E - _02057962 - 2 ; case 1
	.short _02057972 - _02057962 - 2 ; case 2
	.short _02057976 - _02057962 - 2 ; case 3
_0205796A:
	mov r7, #0x1c
	b _020579A8
_0205796E:
	mov r7, #0x1d
	b _020579A8
_02057972:
	mov r7, #0x1e
	b _020579A8
_02057976:
	mov r7, #0x1f
	b _020579A8
_0205797A:
	cmp r1, #0
	bne _02057992
	mov r0, #4
	ldrsb r0, [r6, r0]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	beq _02057992
	mov r1, #0x24
	bl sub_0206234C
	add r7, r0, #0
	b _020579A8
_02057992:
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #8]
	add r1, r4, #0
	add r2, r4, #0
	bl sub_0205DF0C
	add r7, r0, #0
_020579A8:
	ldr r0, [sp, #0x18]
	bl sub_0205DFC8
	cmp r0, #0
	bne _020579BC
	ldr r0, [sp, #0x18]
	bl sub_0205DE38
	cmp r0, #0
	beq _020579FC
_020579BC:
	cmp r7, #0xff
	beq _020579FC
	ldr r0, [sp, #0x18]
	add r1, r7, #0
	bl sub_0205DFD4
	mov r0, #2
	bic r4, r0
	beq _020579FC
	ldr r0, _02057A00 ; =_021D41C4
	ldr r0, [r0]
	add r0, r0, r5
	add r0, #0xdc
	ldrb r0, [r0]
	cmp r0, #0
	bne _020579EC
	ldr r0, [sp, #0x14]
	bl sub_02057524
	ldr r1, _02057A00 ; =_021D41C4
	ldr r1, [r1]
	add r1, r1, r5
	add r1, #0xdc
	strb r0, [r1]
_020579EC:
	ldr r0, _02057A00 ; =_021D41C4
	ldr r1, [r0]
	add r1, #0xdc
	ldrb r0, [r1, r5]
	cmp r0, #0
	beq _020579FC
	sub r0, r0, #1
	strb r0, [r1, r5]
_020579FC:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02057A00: .word _021D41C4
_02057A04: .word 0x0000FFFF
	thumb_func_end sub_02057818

	thumb_func_start sub_02057A08
sub_02057A08: ; 0x02057A08
	mov r0, #4
	bx lr
	thumb_func_end sub_02057A08

	thumb_func_start sub_02057A0C
sub_02057A0C: ; 0x02057A0C
	push {r3, lr}
	ldr r0, _02057A30 ; =_021D41C4
	ldr r0, [r0]
	cmp r0, #0
	bne _02057A1A
	mov r0, #0
	pop {r3, pc}
_02057A1A:
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	beq _02057A2A
	mov r0, #1
	pop {r3, pc}
_02057A2A:
	mov r0, #0
	pop {r3, pc}
	nop
_02057A30: .word _021D41C4
	thumb_func_end sub_02057A0C

	thumb_func_start sub_02057A34
sub_02057A34: ; 0x02057A34
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02057A80 ; =_021D41C4
	ldr r0, [r0]
	cmp r0, #0
	bne _02057A44
	ldr r0, _02057A84 ; =0x0000FFFF
	pop {r4, pc}
_02057A44:
	bl sub_0203769C
	cmp r4, r0
	bne _02057A5A
	ldr r0, _02057A80 ; =_021D41C4
	ldr r1, [r0]
	lsl r0, r4, #3
	add r0, r1, r0
	add r0, #0x74
	ldrh r0, [r0]
	pop {r4, pc}
_02057A5A:
	bl sub_02057A0C
	cmp r0, #0
	beq _02057A70
	ldr r0, _02057A80 ; =_021D41C4
	ldr r1, [r0]
	add r0, r1, r4
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _02057A74
_02057A70:
	ldr r0, _02057A84 ; =0x0000FFFF
	pop {r4, pc}
_02057A74:
	lsl r0, r4, #3
	add r0, r1, r0
	add r0, #0x74
	ldrh r0, [r0]
	pop {r4, pc}
	nop
_02057A80: .word _021D41C4
_02057A84: .word 0x0000FFFF
	thumb_func_end sub_02057A34

	thumb_func_start sub_02057A88
sub_02057A88: ; 0x02057A88
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02057AD4 ; =_021D41C4
	ldr r0, [r0]
	cmp r0, #0
	bne _02057A98
	ldr r0, _02057AD8 ; =0x0000FFFF
	pop {r4, pc}
_02057A98:
	bl sub_0203769C
	cmp r4, r0
	bne _02057AAE
	ldr r0, _02057AD4 ; =_021D41C4
	ldr r1, [r0]
	lsl r0, r4, #3
	add r0, r1, r0
	add r0, #0x76
	ldrh r0, [r0]
	pop {r4, pc}
_02057AAE:
	bl sub_02057A0C
	cmp r0, #0
	beq _02057AC4
	ldr r0, _02057AD4 ; =_021D41C4
	ldr r1, [r0]
	add r0, r1, r4
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _02057AC8
_02057AC4:
	ldr r0, _02057AD8 ; =0x0000FFFF
	pop {r4, pc}
_02057AC8:
	lsl r0, r4, #3
	add r0, r1, r0
	add r0, #0x76
	ldrh r0, [r0]
	pop {r4, pc}
	nop
_02057AD4: .word _021D41C4
_02057AD8: .word 0x0000FFFF
	thumb_func_end sub_02057A88

	thumb_func_start sub_02057ADC
sub_02057ADC: ; 0x02057ADC
	push {r4, lr}
	add r4, r0, #0
	bl sub_02057A34
	ldr r1, _02057B0C ; =0x0000FFFF
	cmp r0, r1
	bne _02057AEE
	add r0, r1, #0
	pop {r4, pc}
_02057AEE:
	ldr r0, _02057B10 ; =_021D41C4
	lsl r4, r4, #3
	ldr r0, [r0]
	add r1, r0, r4
	mov r0, #0x78
	ldrsb r0, [r1, r0]
	bl GetDeltaXByFacingDirection
	ldr r1, _02057B10 ; =_021D41C4
	ldr r1, [r1]
	add r1, r1, r4
	add r1, #0x74
	ldrh r1, [r1]
	add r0, r1, r0
	pop {r4, pc}
	.balign 4, 0
_02057B0C: .word 0x0000FFFF
_02057B10: .word _021D41C4
	thumb_func_end sub_02057ADC

	thumb_func_start sub_02057B14
sub_02057B14: ; 0x02057B14
	push {r4, lr}
	add r4, r0, #0
	bl sub_02057A88
	ldr r1, _02057B44 ; =0x0000FFFF
	cmp r0, r1
	bne _02057B26
	add r0, r1, #0
	pop {r4, pc}
_02057B26:
	ldr r0, _02057B48 ; =_021D41C4
	lsl r4, r4, #3
	ldr r0, [r0]
	add r1, r0, r4
	mov r0, #0x78
	ldrsb r0, [r1, r0]
	bl GetDeltaYByFacingDirection
	ldr r1, _02057B48 ; =_021D41C4
	ldr r1, [r1]
	add r1, r1, r4
	add r1, #0x76
	ldrh r1, [r1]
	add r0, r1, r0
	pop {r4, pc}
	.balign 4, 0
_02057B44: .word 0x0000FFFF
_02057B48: .word _021D41C4
	thumb_func_end sub_02057B14

	thumb_func_start sub_02057B4C
sub_02057B4C: ; 0x02057B4C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02057B94 ; =_021D41C4
	ldr r0, [r0]
	cmp r0, #0
	bne _02057B5C
	ldr r0, _02057B98 ; =0x0000FFFF
	pop {r4, pc}
_02057B5C:
	bl sub_0203769C
	cmp r4, r0
	bne _02057B70
	ldr r0, _02057B94 ; =_021D41C4
	ldr r1, [r0]
	lsl r0, r4, #3
	add r0, r1, r0
	ldrh r0, [r0, #0x34]
	pop {r4, pc}
_02057B70:
	bl sub_02057A0C
	cmp r0, #0
	beq _02057B86
	ldr r0, _02057B94 ; =_021D41C4
	ldr r1, [r0]
	add r0, r1, r4
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _02057B8A
_02057B86:
	ldr r0, _02057B98 ; =0x0000FFFF
	pop {r4, pc}
_02057B8A:
	lsl r0, r4, #3
	add r0, r1, r0
	ldrh r0, [r0, #0x34]
	pop {r4, pc}
	nop
_02057B94: .word _021D41C4
_02057B98: .word 0x0000FFFF
	thumb_func_end sub_02057B4C

	thumb_func_start sub_02057B9C
sub_02057B9C: ; 0x02057B9C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02057BE4 ; =_021D41C4
	ldr r0, [r0]
	cmp r0, #0
	bne _02057BAC
	ldr r0, _02057BE8 ; =0x0000FFFF
	pop {r4, pc}
_02057BAC:
	bl sub_0203769C
	cmp r4, r0
	bne _02057BC0
	ldr r0, _02057BE4 ; =_021D41C4
	ldr r1, [r0]
	lsl r0, r4, #3
	add r0, r1, r0
	ldrh r0, [r0, #0x36]
	pop {r4, pc}
_02057BC0:
	bl sub_02057A0C
	cmp r0, #0
	beq _02057BD6
	ldr r0, _02057BE4 ; =_021D41C4
	ldr r1, [r0]
	add r0, r1, r4
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _02057BDA
_02057BD6:
	ldr r0, _02057BE8 ; =0x0000FFFF
	pop {r4, pc}
_02057BDA:
	lsl r0, r4, #3
	add r0, r1, r0
	ldrh r0, [r0, #0x36]
	pop {r4, pc}
	nop
_02057BE4: .word _021D41C4
_02057BE8: .word 0x0000FFFF
	thumb_func_end sub_02057B9C

	thumb_func_start sub_02057BEC
sub_02057BEC: ; 0x02057BEC
	push {r4, lr}
	add r4, r0, #0
	bl sub_02057B4C
	ldr r1, _02057C1C ; =0x0000FFFF
	cmp r0, r1
	bne _02057BFE
	add r0, r1, #0
	pop {r4, pc}
_02057BFE:
	ldr r0, _02057C20 ; =_021D41C4
	lsl r4, r4, #3
	ldr r0, [r0]
	add r1, r0, r4
	mov r0, #0x38
	ldrsb r0, [r1, r0]
	bl GetDeltaXByFacingDirection
	ldr r1, _02057C20 ; =_021D41C4
	ldr r1, [r1]
	add r1, r1, r4
	ldrh r1, [r1, #0x34]
	add r0, r1, r0
	pop {r4, pc}
	nop
_02057C1C: .word 0x0000FFFF
_02057C20: .word _021D41C4
	thumb_func_end sub_02057BEC

	thumb_func_start sub_02057C24
sub_02057C24: ; 0x02057C24
	push {r4, lr}
	add r4, r0, #0
	bl sub_02057B9C
	ldr r1, _02057C54 ; =0x0000FFFF
	cmp r0, r1
	bne _02057C36
	add r0, r1, #0
	pop {r4, pc}
_02057C36:
	ldr r0, _02057C58 ; =_021D41C4
	lsl r4, r4, #3
	ldr r0, [r0]
	add r1, r0, r4
	mov r0, #0x38
	ldrsb r0, [r1, r0]
	bl GetDeltaYByFacingDirection
	ldr r1, _02057C58 ; =_021D41C4
	ldr r1, [r1]
	add r1, r1, r4
	ldrh r1, [r1, #0x36]
	add r0, r1, r0
	pop {r4, pc}
	nop
_02057C54: .word 0x0000FFFF
_02057C58: .word _021D41C4
	thumb_func_end sub_02057C24

	thumb_func_start sub_02057C5C
sub_02057C5C: ; 0x02057C5C
	push {r3, r4}
	ldr r3, _02057C90 ; =_021D41C4
	ldr r4, [r3]
	add r4, #0xb4
	ldrb r2, [r4, r0]
	cmp r1, r2
	beq _02057C8C
	strb r1, [r4, r0]
	ldr r2, [r3]
	lsl r1, r0, #3
	add r2, r2, r1
	mov r4, #0
	add r2, #0x3b
	strb r4, [r2]
	ldr r2, [r3]
	mov r4, #1
	add r0, r2, r0
	add r0, #0xcc
	strb r4, [r0]
	ldr r0, [r3]
	mov r2, #2
	add r0, r0, r1
	add r0, #0x39
	strb r2, [r0]
_02057C8C:
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02057C90: .word _021D41C4
	thumb_func_end sub_02057C5C

	thumb_func_start sub_02057C94
sub_02057C94: ; 0x02057C94
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r1, _02057D48 ; =_020FC7A0
	add r0, sp, #8
	ldrh r2, [r1]
	ldr r3, _02057D4C ; =_020FC7A8
	strh r2, [r0]
	ldrh r2, [r1, #2]
	strh r2, [r0, #2]
	ldrh r2, [r1, #4]
	ldrh r1, [r1, #6]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	add r2, sp, #0x20
	mov r1, #8
_02057CB2:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _02057CB2
	bl sub_0203993C
	bl sub_0203774C
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp]
	cmp r6, #2
	bne _02057CD6
	add r5, sp, #8
	b _02057CD8
_02057CD6:
	add r5, sp, #0x20
_02057CD8:
	mov r7, #0
	cmp r6, #0
	ble _02057D24
_02057CDE:
	mov r4, #0
	cmp r6, #0
	ble _02057D1C
_02057CE4:
	add r0, r4, #0
	bl sub_02057A34
	ldrh r1, [r5]
	cmp r1, r0
	bne _02057D16
	add r0, r4, #0
	bl sub_02057A88
	ldrh r1, [r5, #2]
	cmp r1, r0
	bne _02057D16
	ldr r0, [sp, #4]
	lsl r1, r4, #2
	add r0, r0, #1
	str r0, [sp, #4]
	add r0, sp, #0x10
	str r7, [r0, r1]
	bl sub_0203769C
	cmp r4, r0
	bne _02057D1C
	mov r0, #1
	str r0, [sp]
	b _02057D1C
_02057D16:
	add r4, r4, #1
	cmp r4, r6
	blt _02057CE4
_02057D1C:
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, r6
	blt _02057CDE
_02057D24:
	ldr r0, [sp, #4]
	cmp r0, r6
	bne _02057D42
	mov r5, #0
	cmp r6, #0
	ble _02057D42
	add r4, sp, #0x10
_02057D32:
	ldr r0, [r4]
	add r1, r5, #0
	bl sub_02037894
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r6
	blt _02057D32
_02057D42:
	ldr r0, [sp]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02057D48: .word _020FC7A0
_02057D4C: .word _020FC7A8
	thumb_func_end sub_02057C94

	thumb_func_start sub_02057D50
sub_02057D50: ; 0x02057D50
	ldrb r2, [r2]
	cmp r2, #3
	bne _02057D64
	ldr r1, _02057D70 ; =_021D41C4
	mov r2, #0
	ldr r1, [r1]
	add r0, r1, r0
	add r0, #0xbc
	strb r2, [r0]
	bx lr
_02057D64:
	ldr r1, _02057D70 ; =_021D41C4
	ldr r1, [r1]
	add r0, r1, r0
	add r0, #0xe6
	strb r2, [r0]
	bx lr
	.balign 4, 0
_02057D70: .word _021D41C4
	thumb_func_end sub_02057D50

	thumb_func_start sub_02057D74
sub_02057D74: ; 0x02057D74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	bl sub_0203993C
	bl sub_0203774C
	add r7, r0, #0
	cmp r7, #2
	bne _02057D8C
	ldr r0, _02057DFC ; =_0210FAB4
	str r0, [sp]
	b _02057D90
_02057D8C:
	ldr r0, _02057E00 ; =_0210FABC
	str r0, [sp]
_02057D90:
	mov r1, #0
	add r0, sp, #4
	strb r1, [r0]
	cmp r7, #0
	ble _02057DF8
_02057D9A:
	ldr r0, _02057E04 ; =_021D41C4
	add r6, sp, #4
	ldr r1, [r0]
	ldrb r0, [r6]
	add r0, r1, r0
	add r0, #0xe6
	ldrb r0, [r0]
	cmp r0, #0
	beq _02057DEA
	mov r4, #0
	cmp r7, #0
	ble _02057DEA
	ldr r5, [sp]
_02057DB4:
	ldrb r0, [r6]
	bl sub_02057B4C
	ldrh r1, [r5]
	cmp r1, r0
	bne _02057DE2
	ldrb r0, [r6]
	bl sub_02057B9C
	ldrh r1, [r5, #2]
	cmp r1, r0
	bne _02057DE2
	ldr r0, _02057E04 ; =_021D41C4
	ldr r1, [r0]
	ldrb r0, [r6]
	add r1, r1, r0
	add r1, #0xbc
	mov r0, #1
	strb r0, [r1]
	mov r0, #0x5f
	add r1, sp, #4
	bl sub_02037184
_02057DE2:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r7
	blt _02057DB4
_02057DEA:
	add r0, sp, #4
	ldrb r1, [r0]
	add r1, r1, #1
	strb r1, [r0]
	ldrb r0, [r0]
	cmp r0, r7
	blt _02057D9A
_02057DF8:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02057DFC: .word _0210FAB4
_02057E00: .word _0210FABC
_02057E04: .word _021D41C4
	thumb_func_end sub_02057D74

	thumb_func_start sub_02057E08
sub_02057E08: ; 0x02057E08
	push {r4, lr}
	bl sub_0203769C
	add r4, r0, #0
	bl sub_02057A34
	cmp r0, #8
	ble _02057E28
	mov r0, #2
	bl sub_02057F28
	mov r0, #2
	mov r1, #0x24
	bl sub_0206234C
	b _02057E36
_02057E28:
	mov r0, #3
	bl sub_02057F28
	mov r0, #3
	mov r1, #0x24
	bl sub_0206234C
_02057E36:
	add r1, r0, #0
	ldr r0, _02057E4C ; =_021D41C4
	ldr r2, [r0]
	lsl r0, r4, #2
	add r0, r2, r0
	ldr r0, [r0, #4]
	bl sub_0205DFD4
	bl sub_02058024
	pop {r4, pc}
	.balign 4, 0
_02057E4C: .word _021D41C4
	thumb_func_end sub_02057E08

	thumb_func_start sub_02057E50
sub_02057E50: ; 0x02057E50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	bl sub_0203993C
	bl sub_0203774C
	str r0, [sp]
	ldr r1, [sp]
	mov r0, #0
	cmp r1, #0
	ble _02057E8E
	ldr r1, _02057EE8 ; =_021D41C4
	ldr r2, [r1]
_02057E6A:
	add r1, r2, #0
	add r1, #0x24
	ldrb r1, [r1]
	cmp r1, #0
	beq _02057E7E
	add r1, r2, #0
	add r1, #0xcc
	ldrb r1, [r1]
	cmp r1, #1
	bne _02057E84
_02057E7E:
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02057E84:
	ldr r1, [sp]
	add r0, r0, #1
	add r2, r2, #1
	cmp r0, r1
	blt _02057E6A
_02057E8E:
	ldr r0, [sp]
	mov r5, #0
	cmp r0, #0
	ble _02057EE2
	add r4, r5, #0
_02057E98:
	ldr r0, _02057EE8 ; =_021D41C4
	ldr r7, [r0]
	mov r0, #4
	add r7, #0x34
	add r6, r7, r4
	ldrsb r0, [r6, r0]
	bl sub_02057EEC
	str r0, [sp, #4]
	bl GetDeltaXByFacingDirection
	ldrh r1, [r7, r4]
	add r0, r1, r0
	strh r0, [r7, r4]
	ldr r0, [sp, #4]
	bl GetDeltaYByFacingDirection
	ldrh r1, [r6, #2]
	add r0, r1, r0
	strh r0, [r6, #2]
	mov r0, #2
	strb r0, [r6, #5]
	ldr r0, _02057EE8 ; =_021D41C4
	ldr r0, [r0]
	add r1, r0, r5
	add r1, #0xcc
	mov r0, #1
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #1
	bl sub_02057C5C
	ldr r0, [sp]
	add r5, r5, #1
	add r4, #8
	cmp r5, r0
	blt _02057E98
_02057EE2:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02057EE8: .word _021D41C4
	thumb_func_end sub_02057E50

	thumb_func_start sub_02057EEC
sub_02057EEC: ; 0x02057EEC
	push {r3, lr}
	cmp r0, #0
	bne _02057EF6
	mov r0, #1
	pop {r3, pc}
_02057EF6:
	cmp r0, #1
	bne _02057EFE
	mov r0, #0
	pop {r3, pc}
_02057EFE:
	cmp r0, #2
	bne _02057F06
	mov r0, #3
	pop {r3, pc}
_02057F06:
	cmp r0, #3
	bne _02057F0E
	mov r0, #2
	pop {r3, pc}
_02057F0E:
	bl GF_AssertFail
	mov r0, #2
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02057EEC

	thumb_func_start sub_02057F18
sub_02057F18: ; 0x02057F18
	ldr r1, _02057F24 ; =_021D41C4
	ldr r1, [r1]
	add r0, r1, r0
	add r0, #0xdc
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
_02057F24: .word _021D41C4
	thumb_func_end sub_02057F18

	thumb_func_start sub_02057F28
sub_02057F28: ; 0x02057F28
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02057F54 ; =_021D41C4
	add r1, r4, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_SetFacingDirection
	bl sub_0203769C
	ldr r1, _02057F54 ; =_021D41C4
	lsl r0, r0, #3
	ldr r1, [r1]
	add r0, r1, r0
	add r0, #0x78
	strb r4, [r0]
	mov r0, #0
	bl sub_0205701C
	pop {r4, pc}
	nop
_02057F54: .word _021D41C4
	thumb_func_end sub_02057F28

	thumb_func_start sub_02057F58
sub_02057F58: ; 0x02057F58
	push {r3, lr}
	bl sub_0203E2F4
	ldr r0, _02057F6C ; =_021D41C4
	mov r1, #0
	ldr r0, [r0]
	add r0, #0xed
	strb r1, [r0]
	pop {r3, pc}
	nop
_02057F6C: .word _021D41C4
	thumb_func_end sub_02057F58

	thumb_func_start sub_02057F70
sub_02057F70: ; 0x02057F70
	push {r3, lr}
	bl sub_0203E30C
	mov r0, #1
	bl sub_02057358
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02057F70

	thumb_func_start sub_02057F80
sub_02057F80: ; 0x02057F80
	push {r3, lr}
	ldr r0, _02057FA0 ; =_021D41C4
	ldr r0, [r0]
	add r0, #0xef
	ldrb r0, [r0]
	cmp r0, #0
	bne _02057F9C
	bl sub_02057F70
	ldr r0, _02057FA0 ; =_021D41C4
	mov r1, #1
	ldr r0, [r0]
	add r0, #0xef
	strb r1, [r0]
_02057F9C:
	pop {r3, pc}
	nop
_02057FA0: .word _021D41C4
	thumb_func_end sub_02057F80

	thumb_func_start sub_02057FA4
sub_02057FA4: ; 0x02057FA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r0, _02058020 ; =_021D41C4
	ldr r0, [r0]
	cmp r0, #0
	beq _0205801A
	mov r6, #0
	add r4, r6, #0
	add r5, r6, #0
_02057FB6:
	ldr r0, _02058020 ; =_021D41C4
	ldr r0, [r0]
	add r0, r0, r4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02058010
	bl sub_0203769C
	cmp r6, r0
	beq _02058010
	ldr r0, _02058020 ; =_021D41C4
	ldr r0, [r0]
	add r0, r0, r4
	ldr r0, [r0, #4]
	bl PlayerAvatar_GetMapObject
	ldr r1, _02058020 ; =_021D41C4
	str r0, [sp, #0xc]
	ldr r1, [r1]
	add r1, r1, r5
	add r2, r1, #0
	add r2, #0x74
	ldrh r2, [r2]
	str r2, [sp, #8]
	add r2, r1, #0
	add r2, #0x76
	ldrh r7, [r2]
	mov r2, #0x78
	ldrsb r1, [r1, r2]
	str r1, [sp, #4]
	ldr r1, [sp, #8]
	bl MapObject_SetCurrentX
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	bl MapObject_SetCurrentY
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #0xc]
	mov r2, #0
	add r3, r7, #0
	bl sub_0205FC2C
_02058010:
	add r6, r6, #1
	add r4, r4, #4
	add r5, #8
	cmp r6, #8
	blt _02057FB6
_0205801A:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02058020: .word _021D41C4
	thumb_func_end sub_02057FA4

	thumb_func_start sub_02058024
sub_02058024: ; 0x02058024
	ldr r0, _02058030 ; =_021D41C4
	mov r1, #8
	ldr r0, [r0]
	add r0, #0xf0
	strb r1, [r0]
	bx lr
	.balign 4, 0
_02058030: .word _021D41C4
	thumb_func_end sub_02058024
