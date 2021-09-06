	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202C948
sub_0202C948: ; 0x0202C948
	mov r1, #0
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202C948

	thumb_func_start sub_0202C950
sub_0202C950: ; 0x0202C950
	ldrh r0, [r0]
	bx lr
	thumb_func_end sub_0202C950

	thumb_func_start sub_0202C954
sub_0202C954: ; 0x0202C954
	ldrh r3, [r0]
	ldr r2, _0202C970 ; =0x0000C350
	cmp r3, r2
	blo _0202C960
	mov r0, #0
	bx lr
_0202C960:
	add r1, r3, r1
	strh r1, [r0]
	ldrh r1, [r0]
	cmp r1, r2
	bls _0202C96C
	strh r2, [r0]
_0202C96C:
	mov r0, #1
	bx lr
	.balign 4, 0
_0202C970: .word 0x0000C350
	thumb_func_end sub_0202C954

	thumb_func_start sub_0202C974
sub_0202C974: ; 0x0202C974
	ldrh r0, [r0]
	add r1, r1, r0
	ldr r0, _0202C988 ; =0x0000C350
	cmp r1, r0
	bhi _0202C982
	mov r0, #1
	bx lr
_0202C982:
	mov r0, #0
	bx lr
	nop
_0202C988: .word 0x0000C350
	thumb_func_end sub_0202C974

	thumb_func_start sub_0202C98C
sub_0202C98C: ; 0x0202C98C
	ldrh r2, [r0]
	cmp r2, r1
	bhs _0202C996
	mov r0, #0
	bx lr
_0202C996:
	sub r1, r2, r1
	strh r1, [r0]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202C98C

	thumb_func_start sub_0202C9A0
sub_0202C9A0: ; 0x0202C9A0
	mov r0, #0x62
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202C9A0

	thumb_func_start sub_0202C9A8
sub_0202C9A8: ; 0x0202C9A8
	push {r4, r5, r6, lr}
	mov r2, #0x62
	add r4, r0, #0
	mov r1, #0
	lsl r2, r2, #4
	bl memset
	add r0, r4, #0
	bl sub_0202CA10
	add r5, r0, #0
	mov r4, #0
	mov r6, #0x8c
_0202C9C2:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	add r2, r5, #0
	bl sub_0202CA1C
	add r4, r4, #1
	cmp r4, #8
	blt _0202C9C2
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202C9A8

	thumb_func_start sub_0202C9D8
sub_0202C9D8: ; 0x0202C9D8
	ldr r3, _0202C9E0 ; =SavArray_get
	mov r1, #0xf
	bx r3
	nop
_0202C9E0: .word SavArray_get
	thumb_func_end sub_0202C9D8

	thumb_func_start sub_0202C9E4
sub_0202C9E4: ; 0x0202C9E4
	add r0, #0x20
	bx lr
	thumb_func_end sub_0202C9E4

	thumb_func_start sub_0202C9E8
sub_0202C9E8: ; 0x0202C9E8
	push {r3, r4}
	mov r3, #0
	mov r1, #6
	add r4, r3, #0
	add r0, #0x20
	lsl r1, r1, #6
_0202C9F4:
	ldr r2, [r0]
	add r4, r4, #1
	add r3, r3, r2
	add r0, r0, #4
	cmp r4, r1
	blt _0202C9F4
	cmp r3, #0
	beq _0202CA0A
	mov r0, #1
	pop {r3, r4}
	bx lr
_0202CA0A:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end sub_0202C9E8

	thumb_func_start sub_0202CA10
sub_0202CA10: ; 0x0202CA10
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CA10

	thumb_func_start sub_0202CA14
sub_0202CA14: ; 0x0202CA14
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CA14

	thumb_func_start sub_0202CA1C
sub_0202CA1C: ; 0x0202CA1C
	lsl r0, r0, #2
	str r1, [r2, r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CA1C

	thumb_func_start sub_0202CA24
sub_0202CA24: ; 0x0202CA24
	ldr r0, _0202CA28 ; =0x00000FF8
	bx lr
	.balign 4, 0
_0202CA28: .word 0x00000FF8
	thumb_func_end sub_0202CA24

	thumb_func_start sub_0202CA2C
sub_0202CA2C: ; 0x0202CA2C
	push {r3, lr}
	ldr r2, _0202CA40 ; =0x00000FF8
	add r1, r0, #0
	mov r0, #0
	bl sub_020D47EC
	mov r0, #0x1a
	bl sub_0202893C
	pop {r3, pc}
	.balign 4, 0
_0202CA40: .word 0x00000FF8
	thumb_func_end sub_0202CA2C

	thumb_func_start sub_0202CA44
sub_0202CA44: ; 0x0202CA44
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1a
	bl sub_02028900
	add r0, r4, #0
	mov r1, #0x1a
	bl SavArray_get
	pop {r4, pc}
	thumb_func_end sub_0202CA44

	thumb_func_start sub_0202CA58
sub_0202CA58: ; 0x0202CA58
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #1
	add r5, r1, #0
	lsl r0, r0, #8
	add r4, r2, #0
	cmp r5, r0
	blt _0202CA6C
	bl GF_AssertFail
_0202CA6C:
	cmp r4, #0x40
	blt _0202CA74
	bl GF_AssertFail
_0202CA74:
	strb r5, [r6, #5]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #3
	strb r4, [r6, #6]
	bl sub_0202CAE4
	mov r0, #0x1a
	bl sub_0202893C
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202CA58

	thumb_func_start sub_0202CA8C
sub_0202CA8C: ; 0x0202CA8C
	ldrb r0, [r0, #5]
	bx lr
	thumb_func_end sub_0202CA8C

	thumb_func_start sub_0202CA90
sub_0202CA90: ; 0x0202CA90
	ldrb r0, [r0, #6]
	bx lr
	thumb_func_end sub_0202CA90

	thumb_func_start sub_0202CA94
sub_0202CA94: ; 0x0202CA94
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #1
	add r5, r1, #0
	lsl r0, r0, #8
	add r4, r2, #0
	cmp r5, r0
	blt _0202CAA8
	bl GF_AssertFail
_0202CAA8:
	cmp r4, #0x40
	blt _0202CAB0
	bl GF_AssertFail
_0202CAB0:
	cmp r5, #0
	bne _0202CAB8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CAB8:
	asr r0, r4, #1
	lsr r0, r0, #0x1e
	add r0, r4, r0
	asr r1, r0, #2
	sub r0, r5, #1
	lsl r0, r0, #4
	add r0, r1, r0
	add r0, r6, r0
	ldrb r3, [r0, #7]
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #1
	add r1, r3, #0
	asr r1, r0
	mov r0, #3
	and r0, r1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202CA94

	thumb_func_start sub_0202CAE4
sub_0202CAE4: ; 0x0202CAE4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	str r3, [sp]
	cmp r3, #4
	blt _0202CAF6
	bl GF_AssertFail
_0202CAF6:
	mov r0, #1
	lsl r0, r0, #8
	cmp r5, r0
	blt _0202CB02
	bl GF_AssertFail
_0202CB02:
	cmp r4, #0x40
	blt _0202CB0A
	bl GF_AssertFail
_0202CB0A:
	cmp r5, #0
	beq _0202CB58
	asr r0, r4, #1
	lsr r0, r0, #0x1e
	add r0, r4, r0
	asr r2, r0, #2
	sub r0, r5, #1
	lsl r0, r0, #4
	add r0, r2, r0
	lsr r2, r4, #0x1f
	lsl r4, r4, #0x1e
	sub r4, r4, r2
	mov r3, #0x1e
	ror r4, r3
	add r2, r2, r4
	lsl r6, r2, #1
	mov r2, #3
	add r3, r2, #0
	add r1, r7, #7
	ldrb r4, [r1, r0]
	lsl r3, r6
	mov r2, #0xff
	eor r2, r3
	and r2, r4
	ldr r3, [sp]
	strb r2, [r1, r0]
	ldrb r2, [r1, r0]
	lsl r3, r6
	orr r2, r3
	strb r2, [r1, r0]
	cmp r5, #0x67
	beq _0202CB52
	add r0, r7, #0
	mov r1, #1
	bl sub_0202CB60
_0202CB52:
	mov r0, #0x1a
	bl sub_0202893C
_0202CB58:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202CAE4

	thumb_func_start sub_0202CB5C
sub_0202CB5C: ; 0x0202CB5C
	ldrb r0, [r0, #4]
	bx lr
	thumb_func_end sub_0202CB5C

	thumb_func_start sub_0202CB60
sub_0202CB60: ; 0x0202CB60
	ldr r3, _0202CB68 ; =sub_0202893C
	strb r1, [r0, #4]
	mov r0, #0x1a
	bx r3
	.balign 4, 0
_0202CB68: .word sub_0202893C
	thumb_func_end sub_0202CB60

	thumb_func_start sub_0202CB6C
sub_0202CB6C: ; 0x0202CB6C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	mov r0, #3
	mov r7, #0
	mov r4, #2
	mov r6, #0xff
	add r3, r0, #0
_0202CB7A:
	ldr r1, [sp]
	add r1, r1, r7
	ldrb r2, [r1, #7]
	mov ip, r1
	mov r1, #0
_0202CB84:
	add r5, r2, #0
	asr r5, r1
	and r5, r3
	cmp r5, #1
	bne _0202CBA4
	add r5, r0, #0
	lsl r5, r1
	eor r5, r6
	and r2, r5
	lsl r2, r2, #0x18
	lsr r5, r2, #0x18
	add r2, r4, #0
	lsl r2, r1
	orr r2, r5
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
_0202CBA4:
	add r1, r1, #2
	cmp r1, #8
	blt _0202CB84
	mov r1, ip
	strb r2, [r1, #7]
	mov r1, #0xff
	add r7, r7, #1
	lsl r1, r1, #4
	cmp r7, r1
	blt _0202CB7A
	mov r0, #0x1a
	bl sub_0202893C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202CB6C

	thumb_func_start sub_0202CBC0
sub_0202CBC0: ; 0x0202CBC0
	mov r0, #0x17
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CBC0

	thumb_func_start sub_0202CBC8
sub_0202CBC8: ; 0x0202CBC8
	push {r4, lr}
	add r4, r0, #0
	bl sub_0202CBC0
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl MIi_CpuFill8
	pop {r4, pc}
	thumb_func_end sub_0202CBC8

	thumb_func_start sub_0202CBDC
sub_0202CBDC: ; 0x0202CBDC
	ldr r3, _0202CBE4 ; =MIi_CpuCopy8
	mov r2, #0x18
	bx r3
	nop
_0202CBE4: .word MIi_CpuCopy8
	thumb_func_end sub_0202CBDC

	thumb_func_start sub_0202CBE8
sub_0202CBE8: ; 0x0202CBE8
	ldr r3, _0202CBF0 ; =SavArray_get
	mov r1, #0x11
	bx r3
	nop
_0202CBF0: .word SavArray_get
	thumb_func_end sub_0202CBE8

	thumb_func_start sub_0202CBF4
sub_0202CBF4: ; 0x0202CBF4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xc
	blt _0202CC02
	bl GF_AssertFail
_0202CC02:
	mov r0, #0x18
	mul r0, r4
	add r0, r5, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202CBF4

	thumb_func_start sub_0202CC0C
sub_0202CC0C: ; 0x0202CC0C
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	cmp r6, #0xc
	blt _0202CC1C
	bl GF_AssertFail
_0202CC1C:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0202CBF4
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0202CBDC
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202CC0C

	thumb_func_start sub_0202CC30
sub_0202CC30: ; 0x0202CC30
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #8
	blt _0202CC3E
	bl GF_AssertFail
_0202CC3E:
	lsl r0, r4, #1
	add r0, r4, r0
	add r0, r5, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202CC30

	thumb_func_start sub_0202CC48
sub_0202CC48: ; 0x0202CC48
	ldrb r0, [r0]
	bx lr
	thumb_func_end sub_0202CC48

	thumb_func_start sub_0202CC4C
sub_0202CC4C: ; 0x0202CC4C
	ldrb r0, [r0, #1]
	bx lr
	thumb_func_end sub_0202CC4C

	thumb_func_start sub_0202CC50
sub_0202CC50: ; 0x0202CC50
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end sub_0202CC50

	thumb_func_start sub_0202CC54
sub_0202CC54: ; 0x0202CC54
	mov r1, #0x12
	lsl r1, r1, #4
	add r0, r0, r1
	bx lr
	thumb_func_end sub_0202CC54

	thumb_func_start sub_0202CC5C
sub_0202CC5C: ; 0x0202CC5C
	ldrb r0, [r0, r1]
	bx lr
	thumb_func_end sub_0202CC5C

	thumb_func_start sub_0202CC60
sub_0202CC60: ; 0x0202CC60
	mov r3, #0
	add r2, r1, #1
_0202CC64:
	ldrb r1, [r0]
	cmp r2, r1
	bne _0202CC6E
	mov r0, #1
	bx lr
_0202CC6E:
	add r3, r3, #1
	add r0, r0, #3
	cmp r3, #8
	blt _0202CC64
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CC60

	thumb_func_start sub_0202CC7C
sub_0202CC7C: ; 0x0202CC7C
	push {r4, r5, r6, r7}
	mov r6, #0
	add r4, r6, #0
	add r2, r1, #1
	add r3, r6, #0
_0202CC86:
	add r5, r3, #0
	add r7, r0, #0
_0202CC8A:
	ldrb r1, [r7]
	cmp r2, r1
	bne _0202CC92
	add r6, r6, #1
_0202CC92:
	add r5, r5, #1
	add r7, r7, #3
	cmp r5, #8
	blt _0202CC8A
	add r4, r4, #1
	add r0, #0x18
	cmp r4, #0xc
	blt _0202CC86
	add r0, r6, #0
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end sub_0202CC7C

	thumb_func_start sub_0202CCA8
sub_0202CCA8: ; 0x0202CCA8
	strb r2, [r0, r1]
	bx lr
	thumb_func_end sub_0202CCA8

	thumb_func_start sub_0202CCAC
sub_0202CCAC: ; 0x0202CCAC
	push {r4, r5, r6, lr}
	add r5, r1, #0
	sub r1, r5, #1
	add r6, r0, #0
	add r4, r2, #0
	bl sub_0202CC7C
	mov r1, #0x12
	lsl r1, r1, #4
	add r2, r6, r1
	sub r1, r5, #1
	ldrb r3, [r2, r1]
	add r0, r0, r3
	cmp r4, #0
	bge _0202CCD6
	add r0, r4, r3
	bmi _0202CCD2
	strb r0, [r2, r1]
	b _0202CCE6
_0202CCD2:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CCD6:
	add r0, r0, r4
	cmp r0, #0x63
	bgt _0202CCE2
	add r0, r3, r4
	strb r0, [r2, r1]
	b _0202CCE6
_0202CCE2:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CCE6:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202CCAC

	thumb_func_start sub_0202CCEC
sub_0202CCEC: ; 0x0202CCEC
	push {r4, r5, r6, lr}
	add r5, r1, #0
	sub r1, r5, #1
	add r6, r0, #0
	add r4, r2, #0
	bl sub_0202CC7C
	cmp r4, #0
	bge _0202CD14
	mov r0, #0x12
	lsl r0, r0, #4
	add r2, r6, r0
	sub r1, r5, #1
	ldrb r0, [r2, r1]
	add r0, r4, r0
	bmi _0202CD10
	strb r0, [r2, r1]
	b _0202CD38
_0202CD10:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CD14:
	add r0, r0, r4
	cmp r0, #0x63
	bgt _0202CD34
	mov r0, #0x12
	lsl r0, r0, #4
	add r2, r6, r0
	sub r1, r5, #1
	ldrb r0, [r2, r1]
	add r0, r0, r4
	strb r0, [r2, r1]
	ldrb r0, [r2, r1]
	cmp r0, #0x63
	blo _0202CD38
	mov r0, #0x63
	strb r0, [r2, r1]
	b _0202CD38
_0202CD34:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CD38:
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202CCEC

	thumb_func_start sub_0202CD3C
sub_0202CD3C: ; 0x0202CD3C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	sub r1, r5, #1
	add r6, r0, #0
	add r4, r2, #0
	bl sub_0202CC7C
	sub r1, r5, #1
	add r2, r6, r1
	mov r1, #0x12
	lsl r1, r1, #4
	ldrb r1, [r2, r1]
	add r0, r0, r1
	cmp r4, #0
	bge _0202CD66
	add r0, r4, r1
	bmi _0202CD62
	mov r0, #1
	pop {r4, r5, r6, pc}
_0202CD62:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CD66:
	add r0, r0, r4
	cmp r0, #0x63
	bgt _0202CD70
	mov r0, #1
	pop {r4, r5, r6, pc}
_0202CD70:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202CD3C

	thumb_func_start sub_0202CD74
sub_0202CD74: ; 0x0202CD74
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r5, #0
	mov r4, #1
_0202CD7C:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202CD94
	cmp r0, #0
	beq _0202CD8A
	add r5, r5, #1
_0202CD8A:
	add r4, r4, #1
	cmp r4, #0x51
	blt _0202CD7C
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202CD74

	thumb_func_start sub_0202CD94
sub_0202CD94: ; 0x0202CD94
	push {r3, r4, r5, lr}
	add r5, r1, #0
	sub r1, r5, #1
	add r4, r0, #0
	bl sub_0202CC7C
	sub r1, r5, #1
	add r2, r4, r1
	mov r1, #0x12
	lsl r1, r1, #4
	ldrb r1, [r2, r1]
	add r0, r0, r1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202CD94

	thumb_func_start sub_0202CDB0
sub_0202CDB0: ; 0x0202CDB0
	mov r1, #0
	strh r1, [r0]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CDB0

	thumb_func_start sub_0202CDBC
sub_0202CDBC: ; 0x0202CDBC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r6, [r5]
	ldr r0, _0202CE20 ; =0x000003E7
	cmp r6, r0
	bne _0202CDD4
	ldrb r0, [r5, #2]
	cmp r0, #0x3b
	bne _0202CDD4
	ldrb r0, [r5, #3]
	cmp r0, #0x3b
	beq _0202CE1C
_0202CDD4:
	ldrb r0, [r5, #3]
	ldrb r4, [r5, #2]
	add r7, r0, r1
	cmp r7, #0x3b
	bls _0202CE16
	add r0, r7, #0
	mov r1, #0x3c
	bl _u32_div_f
	add r4, r4, r0
	add r0, r7, #0
	mov r1, #0x3c
	bl _u32_div_f
	add r7, r1, #0
	cmp r4, #0x3b
	bls _0202CE16
	add r0, r4, #0
	mov r1, #0x3c
	bl _u32_div_f
	add r6, r6, r0
	add r0, r4, #0
	mov r1, #0x3c
	bl _u32_div_f
	ldr r0, _0202CE20 ; =0x000003E7
	add r4, r1, #0
	cmp r6, r0
	blo _0202CE16
	mov r4, #0x3b
	add r6, r0, #0
	add r7, r4, #0
_0202CE16:
	strh r6, [r5]
	strb r4, [r5, #2]
	strb r7, [r5, #3]
_0202CE1C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202CE20: .word 0x000003E7
	thumb_func_end sub_0202CDBC

	thumb_func_start sub_0202CE24
sub_0202CE24: ; 0x0202CE24
	ldrh r0, [r0]
	bx lr
	thumb_func_end sub_0202CE24

	thumb_func_start sub_0202CE28
sub_0202CE28: ; 0x0202CE28
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end sub_0202CE28

	thumb_func_start sub_0202CE2C
sub_0202CE2C: ; 0x0202CE2C
	ldrb r0, [r0, #3]
	bx lr
	thumb_func_end sub_0202CE2C

	thumb_func_start sub_0202CE30
sub_0202CE30: ; 0x0202CE30
	mov r0, #0xfb
	lsl r0, r0, #2
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CE30

	thumb_func_start sub_0202CE38
sub_0202CE38: ; 0x0202CE38
	push {r4, lr}
	add r4, r0, #0
	mov r2, #0xfb
	mov r0, #0
	add r1, r4, #0
	lsl r2, r2, #2
	bl sub_020D47EC
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202CE38

	thumb_func_start sub_0202CE50
sub_0202CE50: ; 0x0202CE50
	push {r4, lr}
	mov r1, #0xfb
	lsl r1, r1, #2
	bl AllocFromHeap
	add r4, r0, #0
	bl sub_0202CE38
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_0202CE50

	thumb_func_start Sav2_Chatot_get
Sav2_Chatot_get: ; 0x0202CE64
	ldr r3, _0202CE6C ; =SavArray_get
	mov r1, #0x12
	bx r3
	nop
_0202CE6C: .word SavArray_get
	thumb_func_end Sav2_Chatot_get

	thumb_func_start sub_0202CE70
sub_0202CE70: ; 0x0202CE70
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_0202CE70

	thumb_func_start sub_0202CE74
sub_0202CE74: ; 0x0202CE74
	mov r1, #0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CE74

	thumb_func_start sub_0202CE7C
sub_0202CE7C: ; 0x0202CE7C
	add r0, r0, #4
	bx lr
	thumb_func_end sub_0202CE7C

	thumb_func_start sub_0202CE80
sub_0202CE80: ; 0x0202CE80
	push {r4, r5, r6, r7}
	mov r5, #0
	mov r2, #0xfa
	add r4, r5, #0
	mov r6, #0xf
	lsl r2, r2, #2
_0202CE8C:
	ldrsb r7, [r1, r4]
	add r3, r0, r5
	and r7, r6
	lsl r7, r7, #0x18
	lsr r7, r7, #0x18
	sub r7, #8
	lsl r7, r7, #0x18
	asr r7, r7, #0x14
	strb r7, [r0, r5]
	ldrsb r7, [r1, r4]
	add r4, r4, #1
	add r5, r5, #2
	lsl r7, r7, #0x14
	lsr r7, r7, #0x18
	sub r7, #8
	lsl r7, r7, #0x18
	asr r7, r7, #0x14
	strb r7, [r3, #1]
	cmp r4, r2
	blt _0202CE8C
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end sub_0202CE80

	thumb_func_start sub_0202CEB8
sub_0202CEB8: ; 0x0202CEB8
	push {r4, r5, r6, r7}
	add r3, r0, #0
	add r2, r1, #0
	mov r0, #1
	mov r1, #0
	str r0, [r3]
	add r0, r1, #0
_0202CEC6:
	ldrsb r4, [r2, r0]
	add r6, r3, r1
	add r7, r2, r0
	asr r5, r4, #3
	lsr r5, r5, #0x1c
	add r5, r4, r5
	lsl r4, r5, #0x14
	asr r4, r4, #0x18
	add r4, #8
	strb r4, [r6, #4]
	mov r4, #4
	ldrsb r5, [r6, r4]
	mov r4, #1
	ldrsb r4, [r7, r4]
	add r0, r0, #2
	add r1, r1, #1
	asr r7, r4, #3
	lsr r7, r7, #0x1c
	add r7, r4, r7
	lsl r4, r7, #0x14
	asr r4, r4, #0x18
	add r4, #8
	lsl r4, r4, #0x18
	lsr r4, r4, #0x14
	orr r4, r5
	strb r4, [r6, #4]
	mov r4, #0x7d
	lsl r4, r4, #4
	cmp r0, r4
	blt _0202CEC6
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CEB8

	thumb_func_start sub_0202CF08
sub_0202CF08: ; 0x0202CF08
	add r2, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0xfb
	ldr r3, _0202CF18 ; =sub_020D48B4
	lsl r2, r2, #2
	bx r3
	nop
_0202CF18: .word sub_020D48B4
	thumb_func_end sub_0202CF08

	thumb_func_start sub_0202CF1C
sub_0202CF1C: ; 0x0202CF1C
	mov r0, #7
	lsl r0, r0, #6
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CF1C

	thumb_func_start sub_0202CF24
sub_0202CF24: ; 0x0202CF24
	push {r4, lr}
	add r4, r0, #0
	mov r2, #7
	mov r0, #0
	add r1, r4, #0
	lsl r2, r2, #6
	bl sub_020D47EC
	ldr r1, _0202CF4C ; =0x027FFC3C
	ldr r0, [r1]
	ldr r1, [r1]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0202CF50 ; =0x000001BE
	strh r1, [r4, r0]
	add r0, r4, #0
	mov r1, #2
	bl sub_0202CF60
	pop {r4, pc}
	.balign 4, 0
_0202CF4C: .word 0x027FFC3C
_0202CF50: .word 0x000001BE
	thumb_func_end sub_0202CF24

	thumb_func_start sub_0202CF54
sub_0202CF54: ; 0x0202CF54
	ldr r3, _0202CF5C ; =SavArray_get
	mov r1, #0x10
	bx r3
	nop
_0202CF5C: .word SavArray_get
	thumb_func_end sub_0202CF54

	thumb_func_start sub_0202CF60
sub_0202CF60: ; 0x0202CF60
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #1
	ble _0202CF8E
	mov r1, #0x6d
	add r0, #8
	lsl r1, r1, #2
	bl sub_0201FF28
	mov r3, #0x6f
	lsl r3, r3, #2
	strh r0, [r4, r3]
	add r1, r3, #0
	ldrh r2, [r4, r3]
	add r3, r3, #2
	ldrh r3, [r4, r3]
	add r0, r4, #0
	add r0, #8
	lsl r3, r3, #0x10
	sub r1, #8
	add r2, r2, r3
	bl sub_0201FF44
_0202CF8E:
	pop {r4, pc}
	thumb_func_end sub_0202CF60

	thumb_func_start sub_0202CF90
sub_0202CF90: ; 0x0202CF90
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #1
	ble _0202CFB2
	mov r1, #0x6d
	lsl r1, r1, #2
	add r2, r1, #0
	add r2, #8
	ldrh r3, [r4, r2]
	add r2, r1, #0
	add r2, #0xa
	ldrh r2, [r4, r2]
	add r0, #8
	lsl r2, r2, #0x10
	add r2, r3, r2
	bl sub_0201FF70
_0202CFB2:
	pop {r4, pc}
	thumb_func_end sub_0202CF90

	thumb_func_start sub_0202CFB4
sub_0202CFB4: ; 0x0202CFB4
	push {r3, lr}
	cmp r1, #0x48
	bge _0202CFC0
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	pop {r3, pc}
_0202CFC0:
	cmp r1, #0x95
	bge _0202CFD2
	sub r1, #0x48
	lsl r1, r1, #1
	add r1, r0, r1
	mov r0, #0x12
	lsl r0, r0, #4
	ldrh r0, [r1, r0]
	pop {r3, pc}
_0202CFD2:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202CFB4

	thumb_func_start sub_0202CFDC
sub_0202CFDC: ; 0x0202CFDC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x48
	bge _0202CFEC
	lsl r0, r4, #2
	str r2, [r5, r0]
	b _0202D004
_0202CFEC:
	cmp r4, #0x95
	bge _0202D000
	add r0, r4, #0
	sub r0, #0x48
	lsl r0, r0, #1
	add r1, r5, r0
	mov r0, #0x12
	lsl r0, r0, #4
	strh r2, [r1, r0]
	b _0202D004
_0202D000:
	bl GF_AssertFail
_0202D004:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CFB4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202CFDC

	thumb_func_start sub_0202D010
sub_0202D010: ; 0x0202D010
	push {r3, lr}
	cmp r0, #0x48
	bge _0202D026
	ldr r1, _0202D044 ; =0x0210F864
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _0202D022
	ldr r0, _0202D048 ; =0x3B9AC9FF
	pop {r3, pc}
_0202D022:
	ldr r0, _0202D04C ; =0x000F423F
	pop {r3, pc}
_0202D026:
	cmp r0, #0x95
	bge _0202D03A
	ldr r1, _0202D044 ; =0x0210F864
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _0202D036
	ldr r0, _0202D050 ; =0x0000FFFF
	pop {r3, pc}
_0202D036:
	ldr r0, _0202D054 ; =0x0000270F
	pop {r3, pc}
_0202D03A:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	nop
_0202D044: .word 0x0210F864
_0202D048: .word 0x3B9AC9FF
_0202D04C: .word 0x000F423F
_0202D050: .word 0x0000FFFF
_0202D054: .word 0x0000270F
	thumb_func_end sub_0202D010

	thumb_func_start sub_0202D058
sub_0202D058: ; 0x0202D058
	lsl r1, r0, #1
	ldr r0, _0202D060 ; =0x020F67DC
	ldrh r0, [r0, r1]
	bx lr
	.balign 4, 0
_0202D060: .word 0x020F67DC
	thumb_func_end sub_0202D058

	thumb_func_start sub_0202D064
sub_0202D064: ; 0x0202D064
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	bl sub_0202D010
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CF90
	cmp r6, r7
	bhs _0202D08C
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0202CFDC
	b _0202D096
_0202D08C:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_0202CFDC
_0202D096:
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CF60
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202D064

	thumb_func_start sub_0202D0A4
sub_0202D0A4: ; 0x0202D0A4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	add r7, r2, #0
	bl sub_0202D010
	add r4, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202CF90
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202CFB4
	str r0, [sp]
	cmp r7, r4
	bls _0202D0CC
	add r7, r4, #0
_0202D0CC:
	ldr r0, [sp]
	cmp r0, r7
	bhs _0202D0E0
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl sub_0202CFDC
	str r0, [sp]
	b _0202D0F0
_0202D0E0:
	cmp r0, r4
	bls _0202D0F0
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0202CFDC
	str r0, [sp]
_0202D0F0:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202CF60
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202D0A4

	thumb_func_start sub_0202D0FC
sub_0202D0FC: ; 0x0202D0FC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0202D010
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CF90
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CFB4
	add r2, r0, #1
	cmp r2, r6
	bhs _0202D12A
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CFDC
	b _0202D134
_0202D12A:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0202CFDC
_0202D134:
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CF60
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202D0FC

	thumb_func_start sub_0202D144
sub_0202D144: ; 0x0202D144
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r7, r2, #0
	bl sub_0202D010
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CF90
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CFB4
	add r2, r0, r7
	cmp r2, r6
	bhs _0202D174
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CFDC
	b _0202D17E
_0202D174:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0202CFDC
_0202D17E:
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CF60
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202D144

	thumb_func_start sub_0202D18C
sub_0202D18C: ; 0x0202D18C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r5, r0, #0
	add r0, r7, #0
	bl sub_0202D010
	add r4, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0202CF90
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0202CFB4
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0202CF60
	cmp r6, r4
	bhi _0202D1BA
	add r4, r6, #0
_0202D1BA:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202D18C

	thumb_func_start sub_0202D1C0
sub_0202D1C0: ; 0x0202D1C0
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	cmp r6, #0x28
	blt _0202D1CE
	bl GF_AssertFail
_0202D1CE:
	add r0, r5, #0
	mov r1, #2
	bl sub_0202D18C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0202D058
	ldr r2, _0202D204 ; =0x05F5E0FF
	add r0, r4, r0
	cmp r0, r2
	bls _0202D1F0
	add r0, r5, #0
	mov r1, #2
	bl sub_0202D064
	pop {r4, r5, r6, pc}
_0202D1F0:
	add r0, r6, #0
	bl sub_0202D058
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #2
	bl sub_0202D144
	pop {r4, r5, r6, pc}
	nop
_0202D204: .word 0x05F5E0FF
	thumb_func_end sub_0202D1C0

	thumb_func_start sub_0202D208
sub_0202D208: ; 0x0202D208
	ldr r3, _0202D210 ; =sub_0202D18C
	mov r1, #2
	bx r3
	nop
_0202D210: .word sub_0202D18C
	thumb_func_end sub_0202D208

	thumb_func_start sub_0202D214
sub_0202D214: ; 0x0202D214
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	bl sub_02029FF8
	cmp r0, #0
	bne _0202D22C
	add r0, r4, #0
	mov r1, #0x15
	bl sub_0202D1C0
_0202D22C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202D214

	thumb_func_start sub_0202D230
sub_0202D230: ; 0x0202D230
	mov r0, #0xe4
	bx lr
	thumb_func_end sub_0202D230

	thumb_func_start sub_0202D234
sub_0202D234: ; 0x0202D234
	ldr r3, _0202D23C ; =MIi_CpuFill8
	mov r1, #0
	mov r2, #0x3c
	bx r3
	.balign 4, 0
_0202D23C: .word MIi_CpuFill8
	thumb_func_end sub_0202D234

	thumb_func_start sub_0202D240
sub_0202D240: ; 0x0202D240
	push {r4, lr}
	mov r2, #0x5a
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MIi_CpuFill8
	mov r0, #1
	strb r0, [r4, #3]
	pop {r4, pc}
	thumb_func_end sub_0202D240

	thumb_func_start sub_0202D254
sub_0202D254: ; 0x0202D254
	push {r4, r5, r6, lr}
	ldr r4, _0202D270 ; =0x020F682C
	add r5, r0, #0
	mov r6, #0
_0202D25C:
	add r0, r5, #0
	add r1, r4, #0
	bl MailMsg_init_fromTemplate
	add r6, r6, #1
	add r4, #8
	add r5, #8
	cmp r6, #4
	blt _0202D25C
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202D270: .word 0x020F682C
	thumb_func_end sub_0202D254

	thumb_func_start sub_0202D274
sub_0202D274: ; 0x0202D274
	ldr r3, _0202D27C ; =MIi_CpuFill8
	mov r1, #0
	ldr r2, _0202D280 ; =0x00000B3C
	bx r3
	.balign 4, 0
_0202D27C: .word MIi_CpuFill8
_0202D280: .word 0x00000B3C
	thumb_func_end sub_0202D274

	thumb_func_start sub_0202D284
sub_0202D284: ; 0x0202D284
	push {r3, lr}
	cmp r1, #0xa
	bhi _0202D302
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0202D296: ; jump table
	.short _0202D2AC - _0202D296 - 2 ; case 0
	.short _0202D2B4 - _0202D296 - 2 ; case 1
	.short _0202D2B8 - _0202D296 - 2 ; case 2
	.short _0202D2BC - _0202D296 - 2 ; case 3
	.short _0202D2C0 - _0202D296 - 2 ; case 4
	.short _0202D2C4 - _0202D296 - 2 ; case 5
	.short _0202D2D2 - _0202D296 - 2 ; case 6
	.short _0202D2E0 - _0202D296 - 2 ; case 7
	.short _0202D2E8 - _0202D296 - 2 ; case 8
	.short _0202D2F6 - _0202D296 - 2 ; case 9
	.short _0202D2FE - _0202D296 - 2 ; case 10
_0202D2AC:
	ldrb r0, [r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1d
	pop {r3, pc}
_0202D2B4:
	ldrb r0, [r0, #2]
	pop {r3, pc}
_0202D2B8:
	ldrb r0, [r0, #3]
	pop {r3, pc}
_0202D2BC:
	ldrh r0, [r0, #4]
	pop {r3, pc}
_0202D2C0:
	ldrh r0, [r0, #6]
	pop {r3, pc}
_0202D2C4:
	add r1, r2, #0
	add r0, #8
	mov r2, #4
	bl MIi_CpuCopy8
	mov r0, #0
	pop {r3, pc}
_0202D2D2:
	add r1, r2, #0
	add r0, #0x2c
	mov r2, #0x10
	bl MIi_CpuCopy8
	mov r0, #0
	pop {r3, pc}
_0202D2E0:
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	pop {r3, pc}
_0202D2E8:
	add r1, r2, #0
	add r0, #0xc
	mov r2, #0x1c
	bl MIi_CpuCopy8
	mov r0, #0
	pop {r3, pc}
_0202D2F6:
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1d
	pop {r3, pc}
_0202D2FE:
	ldr r0, [r0, #0x28]
	pop {r3, pc}
_0202D302:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202D284

	thumb_func_start sub_0202D308
sub_0202D308: ; 0x0202D308
	push {r4, lr}
	add r3, r0, #0
	cmp r1, #0xa
	bhi _0202D3AE
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0202D31C: ; jump table
	.short _0202D332 - _0202D31C - 2 ; case 0
	.short _0202D344 - _0202D31C - 2 ; case 1
	.short _0202D34A - _0202D31C - 2 ; case 2
	.short _0202D350 - _0202D31C - 2 ; case 3
	.short _0202D356 - _0202D31C - 2 ; case 4
	.short _0202D35C - _0202D31C - 2 ; case 5
	.short _0202D36A - _0202D31C - 2 ; case 6
	.short _0202D378 - _0202D31C - 2 ; case 7
	.short _0202D38A - _0202D31C - 2 ; case 8
	.short _0202D39E - _0202D31C - 2 ; case 9
	.short _0202D398 - _0202D31C - 2 ; case 10
_0202D332:
	ldrb r1, [r3]
	mov r0, #0x1c
	bic r1, r0
	ldrb r0, [r2]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1b
	orr r0, r1
	strb r0, [r3]
	pop {r4, pc}
_0202D344:
	ldrb r0, [r2]
	strb r0, [r3, #2]
	pop {r4, pc}
_0202D34A:
	ldrb r0, [r2]
	strb r0, [r3, #3]
	pop {r4, pc}
_0202D350:
	ldrh r0, [r2]
	strh r0, [r3, #4]
	pop {r4, pc}
_0202D356:
	ldrh r0, [r2]
	strh r0, [r3, #6]
	pop {r4, pc}
_0202D35C:
	add r3, #8
	add r0, r2, #0
	add r1, r3, #0
	mov r2, #4
	bl MIi_CpuCopy8
	pop {r4, pc}
_0202D36A:
	add r3, #0x2c
	add r0, r2, #0
	add r1, r3, #0
	mov r2, #0x10
	bl MIi_CpuCopy8
	pop {r4, pc}
_0202D378:
	ldrb r4, [r3]
	ldrb r1, [r2]
	mov r0, #1
	bic r4, r0
	mov r0, #1
	and r0, r1
	orr r0, r4
	strb r0, [r3]
	pop {r4, pc}
_0202D38A:
	add r3, #0xc
	add r0, r2, #0
	add r1, r3, #0
	mov r2, #0x1c
	bl MIi_CpuCopy8
	pop {r4, pc}
_0202D398:
	ldr r0, [r2]
	str r0, [r3, #0x28]
	pop {r4, pc}
_0202D39E:
	ldrb r1, [r3]
	mov r0, #0xe0
	bic r1, r0
	ldrb r0, [r2]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x18
	orr r0, r1
	strb r0, [r3]
_0202D3AE:
	pop {r4, pc}
	thumb_func_end sub_0202D308

	thumb_func_start sub_0202D3B0
sub_0202D3B0: ; 0x0202D3B0
	push {r3, r4}
	ldrb r4, [r0, #3]
	add r1, r4, r1
	cmp r1, #0xff
	bge _0202D3BC
	strb r1, [r0, #3]
_0202D3BC:
	ldrh r1, [r0, #4]
	add r2, r1, r2
	ldr r1, _0202D3D8 ; =0x0000FFFF
	cmp r2, r1
	bge _0202D3C8
	strh r2, [r0, #4]
_0202D3C8:
	ldrh r1, [r0, #6]
	add r2, r1, r3
	ldr r1, _0202D3D8 ; =0x0000FFFF
	cmp r2, r1
	bge _0202D3D4
	strh r2, [r0, #6]
_0202D3D4:
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0202D3D8: .word 0x0000FFFF
	thumb_func_end sub_0202D3B0

	thumb_func_start sub_0202D3DC
sub_0202D3DC: ; 0x0202D3DC
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end sub_0202D3DC

	thumb_func_start sub_0202D3E4
sub_0202D3E4: ; 0x0202D3E4
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	ldrb r3, [r0]
	mov r2, #2
	lsr r1, r1, #0x1e
	bic r3, r2
	orr r1, r3
	strb r1, [r0]
	bx lr
	thumb_func_end sub_0202D3E4

	thumb_func_start sub_0202D3F8
sub_0202D3F8: ; 0x0202D3F8
	cmp r2, #6
	bhi _0202D446
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0202D408: ; jump table
	.short _0202D446 - _0202D408 - 2 ; case 0
	.short _0202D416 - _0202D408 - 2 ; case 1
	.short _0202D446 - _0202D408 - 2 ; case 2
	.short _0202D446 - _0202D408 - 2 ; case 3
	.short _0202D446 - _0202D408 - 2 ; case 4
	.short _0202D424 - _0202D408 - 2 ; case 5
	.short _0202D436 - _0202D408 - 2 ; case 6
_0202D416:
	ldr r2, _0202D44C ; =0x0000270F
	cmp r1, r2
	bls _0202D420
	strh r2, [r0]
	b _0202D446
_0202D420:
	strh r1, [r0]
	b _0202D446
_0202D424:
	ldrh r2, [r0]
	add r2, r2, r1
	ldr r1, _0202D44C ; =0x0000270F
	cmp r2, r1
	ble _0202D432
	strh r1, [r0]
	b _0202D446
_0202D432:
	strh r2, [r0]
	b _0202D446
_0202D436:
	ldrh r2, [r0]
	cmp r2, r1
	bhs _0202D442
	mov r1, #0
	strh r1, [r0]
	b _0202D446
_0202D442:
	sub r1, r2, r1
	strh r1, [r0]
_0202D446:
	ldrh r0, [r0]
	bx lr
	nop
_0202D44C: .word 0x0000270F
	thumb_func_end sub_0202D3F8

	thumb_func_start sub_0202D450
sub_0202D450: ; 0x0202D450
	cmp r1, #2
	beq _0202D45A
	cmp r1, #3
	beq _0202D468
	b _0202D484
_0202D45A:
	mov r1, #0
	strb r1, [r0, #2]
	ldrh r2, [r0, #8]
	mov r1, #0x10
	bic r2, r1
	strh r2, [r0, #8]
	b _0202D484
_0202D468:
	ldrh r1, [r0, #8]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1f
	beq _0202D478
	ldrb r1, [r0, #2]
	add r1, r1, #1
	strb r1, [r0, #2]
	b _0202D484
_0202D478:
	mov r1, #1
	strb r1, [r0, #2]
	ldrh r2, [r0, #8]
	mov r1, #0x10
	orr r1, r2
	strh r1, [r0, #8]
_0202D484:
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end sub_0202D450

	thumb_func_start sub_0202D488
sub_0202D488: ; 0x0202D488
	cmp r1, #2
	beq _0202D496
	cmp r1, #3
	beq _0202D49C
	cmp r1, #4
	beq _0202D4A8
	b _0202D4B2
_0202D496:
	mov r1, #1
	strb r1, [r0, #3]
	b _0202D4B2
_0202D49C:
	ldrb r1, [r0, #3]
	cmp r1, #0xa
	bhs _0202D4B2
	add r1, r1, #1
	strb r1, [r0, #3]
	b _0202D4B2
_0202D4A8:
	ldrb r1, [r0, #3]
	cmp r1, #1
	bls _0202D4B2
	sub r1, r1, #1
	strb r1, [r0, #3]
_0202D4B2:
	ldrb r0, [r0, #3]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202D488

	thumb_func_start sub_0202D4B8
sub_0202D4B8: ; 0x0202D4B8
	push {r3, lr}
	add r3, r0, #0
	cmp r1, #0
	bne _0202D4CE
	add r3, #0xc0
	add r0, r2, #0
	add r1, r3, #0
	mov r2, #0xa8
	bl MIi_CpuCopy8
	pop {r3, pc}
_0202D4CE:
	add r3, #0x18
	add r0, r2, #0
	add r1, r3, #0
	mov r2, #0xa8
	bl MIi_CpuCopy8
	pop {r3, pc}
	thumb_func_end sub_0202D4B8

	thumb_func_start sub_0202D4DC
sub_0202D4DC: ; 0x0202D4DC
	push {r3, lr}
	cmp r1, #0
	bne _0202D4EE
	add r1, r2, #0
	add r0, #0xc0
	mov r2, #0xa8
	bl MIi_CpuCopy8
	pop {r3, pc}
_0202D4EE:
	add r1, r2, #0
	add r0, #0x18
	mov r2, #0xa8
	bl MIi_CpuCopy8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202D4DC

	thumb_func_start sub_0202D4FC
sub_0202D4FC: ; 0x0202D4FC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldrb r0, [r1, #2]
	mov r2, #0xfa
	lsl r2, r2, #2
	sub r0, r0, #1
	add r3, r0, #0
	mul r3, r2
	lsl r0, r3, #0x10
	lsr r4, r0, #0x10
	ldrh r3, [r1, #4]
	mov r0, #0xa
	ldrb r5, [r1, #3]
	mul r0, r3
	mov r3, #0x14
	mul r3, r5
	lsl r0, r0, #0x10
	lsl r3, r3, #0x10
	lsr r0, r0, #0x10
	lsr r3, r3, #0x10
	add r3, r0, r3
	add r0, r2, #0
	sub r0, #0x32
	cmp r3, r0
	ble _0202D532
	mov r5, #0
	b _0202D53A
_0202D532:
	sub r2, #0x32
	sub r0, r2, r3
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
_0202D53A:
	ldrh r1, [r1, #6]
	ldr r0, _0202D560 ; =0x000003CA
	cmp r1, r0
	bls _0202D546
	mov r1, #0
	b _0202D554
_0202D546:
	add r0, #0x1e
	sub r0, r0, r1
	mov r1, #0x1e
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
_0202D554:
	add r0, r4, r5
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	strh r0, [r6, #0x16]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202D560: .word 0x000003CA
	thumb_func_end sub_0202D4FC

	thumb_func_start sub_0202D564
sub_0202D564: ; 0x0202D564
	ldrh r0, [r0, #0x16]
	bx lr
	thumb_func_end sub_0202D564

	thumb_func_start sub_0202D568
sub_0202D568: ; 0x0202D568
	push {r3, lr}
	ldrh r0, [r0, #0x16]
	mov r1, #0xfa
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202D568

	thumb_func_start sub_0202D57C
sub_0202D57C: ; 0x0202D57C
	push {r4, r5}
	cmp r1, #5
	bne _0202D588
	mov r0, #0
	pop {r4, r5}
	bx lr
_0202D588:
	cmp r1, #6
	bne _0202D58E
	mov r1, #5
_0202D58E:
	cmp r2, #2
	beq _0202D598
	cmp r2, #3
	beq _0202D5A2
	b _0202D5B4
_0202D598:
	lsl r2, r1, #1
	mov r3, #0
	add r2, r0, r2
	strh r3, [r2, #0xa]
	b _0202D5B4
_0202D5A2:
	add r5, r0, #0
	add r5, #0xa
	lsl r4, r1, #1
	ldrh r3, [r5, r4]
	ldr r2, _0202D5C0 ; =0x0000FFFE
	cmp r3, r2
	bhs _0202D5B4
	add r2, r3, #1
	strh r2, [r5, r4]
_0202D5B4:
	lsl r1, r1, #1
	add r0, r0, r1
	ldrh r0, [r0, #0xa]
	pop {r4, r5}
	bx lr
	nop
_0202D5C0: .word 0x0000FFFE
	thumb_func_end sub_0202D57C

	thumb_func_start sub_0202D5C4
sub_0202D5C4: ; 0x0202D5C4
	cmp r1, #5
	bne _0202D5CC
	mov r0, #0
	bx lr
_0202D5CC:
	cmp r1, #6
	bne _0202D5D2
	mov r1, #5
_0202D5D2:
	add r0, #0xa
	lsl r1, r1, #1
	strh r2, [r0, r1]
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end sub_0202D5C4

	thumb_func_start sub_0202D5DC
sub_0202D5DC: ; 0x0202D5DC
	push {r4, lr}
	mov r3, #1
	cmp r1, #0x10
	blo _0202D5EC
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_0202D5EC:
	mov r4, #0
	cmp r1, #0
	bls _0202D600
_0202D5F2:
	add r4, r4, #1
	lsl r4, r4, #0x10
	lsl r3, r3, #0x11
	lsr r4, r4, #0x10
	lsr r3, r3, #0x10
	cmp r4, r1
	blo _0202D5F2
_0202D600:
	cmp r2, #0
	beq _0202D624
	cmp r2, #1
	beq _0202D61C
	cmp r2, #2
	bne _0202D630
	ldr r1, _0202D634 ; =0x0000FFFF
	eor r1, r3
	lsl r1, r1, #0x10
	lsr r2, r1, #0x10
	ldrh r1, [r0, #8]
	and r1, r2
	strh r1, [r0, #8]
	b _0202D630
_0202D61C:
	ldrh r1, [r0, #8]
	orr r1, r3
	strh r1, [r0, #8]
	b _0202D630
_0202D624:
	ldrh r0, [r0, #8]
	add r2, r0, #0
	asr r2, r1
	mov r0, #1
	and r0, r2
	pop {r4, pc}
_0202D630:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0202D634: .word 0x0000FFFF
	thumb_func_end sub_0202D5DC

	thumb_func_start sub_0202D638
sub_0202D638: ; 0x0202D638
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_0202D638

	thumb_func_start sub_0202D63C
sub_0202D63C: ; 0x0202D63C
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_0202D63C

	thumb_func_start sub_0202D640
sub_0202D640: ; 0x0202D640
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_0203107C
	ldr r1, _0202D65C ; =0x00000ABC
	add r1, r0, r1
	lsl r0, r5, #3
	add r0, r1, r0
	add r1, r4, #0
	bl MailMsg_copy
	pop {r3, r4, r5, pc}
	nop
_0202D65C: .word 0x00000ABC
	thumb_func_end sub_0202D640

	thumb_func_start sub_0202D660
sub_0202D660: ; 0x0202D660
	push {r4, lr}
	add r4, r1, #0
	bl sub_0203107C
	ldr r1, _0202D674 ; =0x00000ABC
	add r1, r0, r1
	lsl r0, r4, #3
	add r0, r1, r0
	pop {r4, pc}
	nop
_0202D674: .word 0x00000ABC
	thumb_func_end sub_0202D660

	thumb_func_start sub_0202D678
sub_0202D678: ; 0x0202D678
	push {r3, r4, r5, r6}
	add r4, r3, #0
	mov r3, #1
	cmp r2, #0
	beq _0202D6D8
	cmp r2, #0xc8
	bhi _0202D6D8
	cmp r1, #0
	beq _0202D6D8
	cmp r1, #0xa
	bhi _0202D6D8
	sub r5, r2, #1
	sub r2, r1, #1
	mov r1, #0xc8
	mul r1, r2
	add r1, r5, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	lsr r6, r1, #0x1f
	lsl r5, r1, #0x1d
	sub r5, r5, r6
	mov r2, #0x1d
	ror r5, r2
	add r2, r6, r5
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	lsl r3, r2
	lsl r2, r3, #0x18
	lsl r1, r1, #0x15
	lsr r5, r2, #0x18
	add r3, r0, #4
	lsr r2, r1, #0x18
	ldrb r1, [r3, r2]
	orr r1, r5
	strb r1, [r3, r2]
	ldr r3, [r4]
	ldr r1, [r4, #8]
	lsl r5, r3, #0x18
	ldr r3, [r4, #4]
	lsl r1, r1, #0x18
	lsl r3, r3, #0x18
	lsr r3, r3, #8
	ldr r2, [r4, #0xc]
	lsr r1, r1, #0x10
	orr r3, r5
	orr r1, r3
	orr r1, r2
	str r1, [r0]
_0202D6D8:
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end sub_0202D678

	thumb_func_start sub_0202D6DC
sub_0202D6DC: ; 0x0202D6DC
	push {r4, lr}
	add r4, r0, #0
	add r0, r4, #4
	mov r1, #0
	mov r2, #0xfa
	bl MIi_CpuFill8
	add r0, r4, #0
	mov r1, #0
	mov r2, #4
	bl MIi_CpuFill8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202D6DC

	thumb_func_start sub_0202D6F8
sub_0202D6F8: ; 0x0202D6F8
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	bls _0202D704
	mov r0, #1
	bx lr
_0202D704:
	ldr r3, [r0, #4]
	ldr r2, [r1, #4]
	cmp r3, r2
	bls _0202D710
	mov r0, #1
	bx lr
_0202D710:
	ldr r2, [r0, #8]
	ldr r0, [r1, #8]
	cmp r2, r0
	bls _0202D71C
	mov r0, #1
	bx lr
_0202D71C:
	mov r0, #0
	bx lr
	thumb_func_end sub_0202D6F8

	thumb_func_start sub_0202D720
sub_0202D720: ; 0x0202D720
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	mov r7, #1
	cmp r6, #0xc8
	bhi _0202D734
	cmp r4, #0xa
	bls _0202D73A
_0202D734:
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202D73A:
	ldr r0, [r5]
	lsr r1, r0, #0x18
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	lsr r1, r0, #0x10
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #4]
	lsr r1, r0, #8
	lsl r1, r1, #0x18
	lsl r0, r0, #0x18
	lsr r1, r1, #0x18
	lsr r0, r0, #0x18
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r3, #0
	add r1, sp, #0
	bl sub_0202D6F8
	cmp r0, #0
	beq _0202D772
	add r0, r5, #0
	bl sub_0202D6DC
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202D772:
	sub r1, r4, #1
	mov r0, #0xc8
	mul r0, r1
	sub r2, r6, #1
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsr r3, r0, #0x1f
	lsl r2, r0, #0x1d
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	add r0, r5, r0
	sub r2, r2, r3
	mov r1, #0x1d
	ror r2, r1
	add r1, r3, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r2, r7, #0
	lsl r2, r1
	lsl r1, r2, #0x18
	ldrb r0, [r0, #4]
	lsr r1, r1, #0x18
	tst r0, r1
	beq _0202D7AA
	add sp, #0x10
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202D7AA:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202D720

	thumb_func_start sub_0202D7B0
sub_0202D7B0: ; 0x0202D7B0
	add r0, #0xfe
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202D7B0

	thumb_func_start sub_0202D7B8
sub_0202D7B8: ; 0x0202D7B8
	add r0, #0xff
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202D7B8

	thumb_func_start sub_0202D7C0
sub_0202D7C0: ; 0x0202D7C0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x41
	add r4, r2, #0
	lsl r1, r1, #2
	ldr r2, _0202D7E8 ; =0x0000063C
	add r1, r5, r1
	add r6, r3, #0
	bl MIi_CpuCopy8
	ldr r0, _0202D7EC ; =0x00000101
	strb r4, [r5, r0]
	sub r0, r0, #1
	strb r6, [r5, r0]
	mov r0, #1
	add r5, #0xfe
	strb r0, [r5]
	pop {r4, r5, r6, pc}
	nop
_0202D7E8: .word 0x0000063C
_0202D7EC: .word 0x00000101
	thumb_func_end sub_0202D7C0

	thumb_func_start sub_0202D7F0
sub_0202D7F0: ; 0x0202D7F0
	ldr r2, _0202D800 ; =0x00000101
	ldrb r3, [r0, r2]
	sub r2, r2, #1
	strb r3, [r1]
	ldrb r0, [r0, r2]
	strb r0, [r1, #1]
	bx lr
	nop
_0202D800: .word 0x00000101
	thumb_func_end sub_0202D7F0

	thumb_func_start sub_0202D804
sub_0202D804: ; 0x0202D804
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #0x41
	lsl r1, r1, #2
	add r5, r0, r1
	mov r0, #0xe4
	add r4, r2, #0
	mul r4, r0
	ldr r0, _0202D8A0 ; =0x00002710
	add r7, r6, #0
	str r0, [r6]
	add r0, r5, r4
	add r0, #0xc9
	ldrb r0, [r0]
	add r7, #0x30
	strh r0, [r6, #4]
	add r0, r5, r4
	add r0, #0xc8
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0202D85A
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x1c
	mov r3, #0xb
	bl NewMsgDataFromNarc
	add r1, r5, r4
	add r1, #0xc8
	ldrb r1, [r1]
	add r2, r6, #0
	str r0, [sp]
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x1f
	add r1, #0x21
	add r2, #8
	bl ReadMsgDataIntoU16Array
	ldr r0, [sp]
	bl DestroyMsgData
	b _0202D868
_0202D85A:
	add r0, r5, r4
	add r1, r6, #0
	add r0, #0xa8
	add r1, #8
	mov r2, #0x10
	bl MIi_CpuCopy8
_0202D868:
	add r0, r5, r4
	add r1, r6, #0
	add r0, #0xca
	add r1, #0x18
	mov r2, #8
	bl MIi_CpuCopy8
	add r0, r5, r4
	add r1, r6, #0
	add r0, #0xd2
	add r1, #0x20
	mov r2, #8
	bl MIi_CpuCopy8
	add r0, r5, r4
	add r6, #0x28
	add r0, #0xda
	add r1, r6, #0
	mov r2, #8
	bl MIi_CpuCopy8
	add r0, r5, r4
	add r1, r7, #0
	mov r2, #0xa8
	bl MIi_CpuCopy8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202D8A0: .word 0x00002710
	thumb_func_end sub_0202D804

	thumb_func_start sub_0202D8A4
sub_0202D8A4: ; 0x0202D8A4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x1d
	add r4, r2, #0
	lsl r1, r1, #6
	mov r2, #0xff
	add r1, r5, r1
	lsl r2, r2, #2
	add r6, r3, #0
	bl MIi_CpuCopy8
	ldr r0, _0202D8CC ; =0x00000103
	strb r4, [r5, r0]
	sub r0, r0, #1
	strb r6, [r5, r0]
	mov r0, #1
	add r5, #0xff
	strb r0, [r5]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202D8CC: .word 0x00000103
	thumb_func_end sub_0202D8A4

	thumb_func_start sub_0202D8D0
sub_0202D8D0: ; 0x0202D8D0
	ldr r2, _0202D8E0 ; =0x00000103
	ldrb r3, [r0, r2]
	sub r2, r2, #1
	strb r3, [r1]
	ldrb r0, [r0, r2]
	strb r0, [r1, #1]
	bx lr
	nop
_0202D8E0: .word 0x00000103
	thumb_func_end sub_0202D8D0

	thumb_func_start sub_0202D8E4
sub_0202D8E4: ; 0x0202D8E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0xff
	lsl r1, r1, #2
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0x1d
	lsl r0, r0, #6
	mov r2, #0xff
	add r0, r5, r0
	add r1, r4, #0
	lsl r2, r2, #2
	bl MIi_CpuCopy8
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202D8E4

	thumb_func_start sub_0202D908
sub_0202D908: ; 0x0202D908
	push {r3, lr}
	bl sub_0203107C
	mov r1, #0x8e
	lsl r1, r1, #4
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202D908

	thumb_func_start sub_0202D918
sub_0202D918: ; 0x0202D918
	push {r3, lr}
	bl sub_0203107C
	ldr r1, _0202D924 ; =0x00000954
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
_0202D924: .word 0x00000954
	thumb_func_end sub_0202D918

	thumb_func_start sub_0202D928
sub_0202D928: ; 0x0202D928
	push {r3, lr}
	bl sub_0203107C
	ldr r1, _0202D934 ; =0x00000ADC
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
_0202D934: .word 0x00000ADC
	thumb_func_end sub_0202D928

	thumb_func_start sub_0202D938
sub_0202D938: ; 0x0202D938
	mov r0, #0xe
	bx lr
	thumb_func_end sub_0202D938

	thumb_func_start sub_0202D93C
sub_0202D93C: ; 0x0202D93C
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	strb r1, [r0, #0xc]
	strb r1, [r0, #0xd]
	bx lr
	thumb_func_end sub_0202D93C

	thumb_func_start sub_0202D95C
sub_0202D95C: ; 0x0202D95C
	ldr r3, _0202D964 ; =SavArray_get
	mov r1, #0x14
	bx r3
	nop
_0202D964: .word SavArray_get
	thumb_func_end sub_0202D95C

	thumb_func_start sub_0202D968
sub_0202D968: ; 0x0202D968
	mov r0, #0x68
	bx lr
	thumb_func_end sub_0202D968

	thumb_func_start sub_0202D96C
sub_0202D96C: ; 0x0202D96C
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x68
	bl memset
	bl MTRandom
	str r0, [r4]
	bl MTRandom
	str r0, [r4, #4]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x64
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x65
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
	add r4, #0x67
	strb r1, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202D96C

	thumb_func_start sub_0202D9A0
sub_0202D9A0: ; 0x0202D9A0
	str r1, [r0]
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202D9A0

	thumb_func_start sub_0202D9A8
sub_0202D9A8: ; 0x0202D9A8
	push {r3, lr}
	cmp r1, #1
	beq _0202D9B4
	cmp r1, #2
	beq _0202D9B8
	b _0202D9BC
_0202D9B4:
	ldr r0, [r0]
	pop {r3, pc}
_0202D9B8:
	ldr r0, [r0, #4]
	pop {r3, pc}
_0202D9BC:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0202D9A8

	thumb_func_start sub_0202D9C4
sub_0202D9C4: ; 0x0202D9C4
	ldr r3, _0202D9CC ; =SavArray_get
	mov r1, #0x15
	bx r3
	nop
_0202D9CC: .word SavArray_get
	thumb_func_end sub_0202D9C4

	thumb_func_start sub_0202D9D0
sub_0202D9D0: ; 0x0202D9D0
	push {r3, lr}
	bl sub_0202D9C4
	mov r1, #1
	add r0, #0x64
	strb r1, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202D9D0

	thumb_func_start sub_0202D9E0
sub_0202D9E0: ; 0x0202D9E0
	add r0, #0x64
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202D9E0

	thumb_func_start sub_0202D9E8
sub_0202D9E8: ; 0x0202D9E8
	ldr r2, [r0, #8]
	cmp r2, r1
	beq _0202D9F2
	str r2, [r0, #0xc]
	str r1, [r0, #8]
_0202D9F2:
	bx lr
	thumb_func_end sub_0202D9E8

	thumb_func_start sub_0202D9F4
sub_0202D9F4: ; 0x0202D9F4
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0202D9F4

	thumb_func_start sub_0202D9F8
sub_0202D9F8: ; 0x0202D9F8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	blo _0202DA06
	bl GF_AssertFail
_0202DA06:
	add r0, r5, r4
	add r0, #0x60
	ldrb r0, [r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202D9F8

	thumb_func_start sub_0202DA10
sub_0202DA10: ; 0x0202DA10
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #4
	blo _0202DA20
	bl GF_AssertFail
_0202DA20:
	add r0, r5, r4
	add r0, #0x60
	strb r6, [r0]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202DA10

	thumb_func_start sub_0202DA28
sub_0202DA28: ; 0x0202DA28
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	blo _0202DA36
	bl GF_AssertFail
_0202DA36:
	mov r0, #0x14
	mul r0, r4
	add r0, r5, r0
	add r0, #0x22
	ldrb r0, [r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202DA28

	thumb_func_start sub_0202DA44
sub_0202DA44: ; 0x0202DA44
	ldr r2, [r0]
	mov r1, #0x14
	mov r0, #0
_0202DA4A:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0202DA4A
	bx lr
	thumb_func_end sub_0202DA44

	thumb_func_start sub_0202DA54
sub_0202DA54: ; 0x0202DA54
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	blo _0202DA62
	bl GF_AssertFail
_0202DA62:
	mov r0, #0x14
	add r5, #0x10
	mul r0, r4
	add r0, r5, r0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DA54

	thumb_func_start sub_0202DA6C
sub_0202DA6C: ; 0x0202DA6C
	push {r3, lr}
	cmp r1, #8
	bhi _0202DAB0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0202DA7E: ; jump table
	.short _0202DAB0 - _0202DA7E - 2 ; case 0
	.short _0202DA90 - _0202DA7E - 2 ; case 1
	.short _0202DA94 - _0202DA7E - 2 ; case 2
	.short _0202DA98 - _0202DA7E - 2 ; case 3
	.short _0202DA9C - _0202DA7E - 2 ; case 4
	.short _0202DAA0 - _0202DA7E - 2 ; case 5
	.short _0202DAA4 - _0202DA7E - 2 ; case 6
	.short _0202DAA8 - _0202DA7E - 2 ; case 7
	.short _0202DAAC - _0202DA7E - 2 ; case 8
_0202DA90:
	ldr r0, [r0]
	pop {r3, pc}
_0202DA94:
	ldr r0, [r0, #4]
	pop {r3, pc}
_0202DA98:
	ldr r0, [r0, #8]
	pop {r3, pc}
_0202DA9C:
	ldrh r0, [r0, #0xc]
	pop {r3, pc}
_0202DAA0:
	ldrh r0, [r0, #0xe]
	pop {r3, pc}
_0202DAA4:
	ldrb r0, [r0, #0x10]
	pop {r3, pc}
_0202DAA8:
	ldrb r0, [r0, #0x11]
	pop {r3, pc}
_0202DAAC:
	ldrb r0, [r0, #0x12]
	pop {r3, pc}
_0202DAB0:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0202DA6C

	thumb_func_start sub_0202DAB8
sub_0202DAB8: ; 0x0202DAB8
	push {r3, lr}
	cmp r1, #8
	bhi _0202DAFC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0202DACA: ; jump table
	.short _0202DAFC - _0202DACA - 2 ; case 0
	.short _0202DADC - _0202DACA - 2 ; case 1
	.short _0202DAE0 - _0202DACA - 2 ; case 2
	.short _0202DAE4 - _0202DACA - 2 ; case 3
	.short _0202DAE8 - _0202DACA - 2 ; case 4
	.short _0202DAEC - _0202DACA - 2 ; case 5
	.short _0202DAF0 - _0202DACA - 2 ; case 6
	.short _0202DAF4 - _0202DACA - 2 ; case 7
	.short _0202DAF8 - _0202DACA - 2 ; case 8
_0202DADC:
	str r2, [r0]
	pop {r3, pc}
_0202DAE0:
	str r2, [r0, #4]
	pop {r3, pc}
_0202DAE4:
	str r2, [r0, #8]
	pop {r3, pc}
_0202DAE8:
	strh r2, [r0, #0xc]
	pop {r3, pc}
_0202DAEC:
	strh r2, [r0, #0xe]
	pop {r3, pc}
_0202DAF0:
	strb r2, [r0, #0x10]
	pop {r3, pc}
_0202DAF4:
	strb r2, [r0, #0x11]
	pop {r3, pc}
_0202DAF8:
	strb r2, [r0, #0x12]
	pop {r3, pc}
_0202DAFC:
	bl GF_AssertFail
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202DAB8

	thumb_func_start sub_0202DB04
sub_0202DB04: ; 0x0202DB04
	add r0, #0x65
	bx lr
	thumb_func_end sub_0202DB04

	thumb_func_start sub_0202DB08
sub_0202DB08: ; 0x0202DB08
	add r0, #0x65
	ldrb r0, [r0]
	cmp r0, #0
	bne _0202DB14
	mov r0, #1
	bx lr
_0202DB14:
	mov r0, #0
	bx lr
	thumb_func_end sub_0202DB08

	thumb_func_start sub_0202DB18
sub_0202DB18: ; 0x0202DB18
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #2
	bls _0202DB26
	bl GF_AssertFail
_0202DB26:
	add r5, #0x67
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DB18

	thumb_func_start sub_0202DB2C
sub_0202DB2C: ; 0x0202DB2C
	add r0, #0x67
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DB2C

	thumb_func_start sub_0202DB34
sub_0202DB34: ; 0x0202DB34
	ldr r3, _0202DB3C ; =SavArray_get
	mov r1, #0x16
	bx r3
	nop
_0202DB3C: .word SavArray_get
	thumb_func_end sub_0202DB34

	thumb_func_start sub_0202DB40
sub_0202DB40: ; 0x0202DB40
	mov r0, #0xf8
	bx lr
	thumb_func_end sub_0202DB40

	thumb_func_start sub_0202DB44
sub_0202DB44: ; 0x0202DB44
	ldr r3, _0202DB50 ; =MIi_CpuClearFast
	add r1, r0, #0
	mov r0, #0
	mov r2, #0xf8
	bx r3
	nop
_0202DB50: .word MIi_CpuClearFast
	thumb_func_end sub_0202DB44

	thumb_func_start sub_0202DB54
sub_0202DB54: ; 0x0202DB54
	add r0, #0xec
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DB54

	thumb_func_start sub_0202DB5C
sub_0202DB5C: ; 0x0202DB5C
	add r0, #0xec
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DB5C

	thumb_func_start sub_0202DB64
sub_0202DB64: ; 0x0202DB64
	ldr r3, _0202DB6C ; =sub_020D48B4
	mov r2, #0xec
	bx r3
	nop
_0202DB6C: .word sub_020D48B4
	thumb_func_end sub_0202DB64

	thumb_func_start sub_0202DB70
sub_0202DB70: ; 0x0202DB70
	ldr r3, _0202DB7C ; =sub_020D48B4
	add r2, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0xec
	bx r3
	.balign 4, 0
_0202DB7C: .word sub_020D48B4
	thumb_func_end sub_0202DB70

	thumb_func_start sub_0202DB80
sub_0202DB80: ; 0x0202DB80
	add r0, #0xf0
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DB80

	thumb_func_start sub_0202DB88
sub_0202DB88: ; 0x0202DB88
	add r0, #0xf0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DB88

	thumb_func_start sub_0202DB90
sub_0202DB90: ; 0x0202DB90
	add r0, #0xf4
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DB90

	thumb_func_start sub_0202DB98
sub_0202DB98: ; 0x0202DB98
	add r0, #0xf4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DB98

	thumb_func_start sub_0202DBA0
sub_0202DBA0: ; 0x0202DBA0
	add r0, #0xee
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DBA0

	thumb_func_start sub_0202DBA8
sub_0202DBA8: ; 0x0202DBA8
	mov r0, #0x5a
	lsl r0, r0, #6
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202DBA8

	thumb_func_start sub_0202DBB0
sub_0202DBB0: ; 0x0202DBB0
	ldr r3, _0202DBB8 ; =sub_0202893C
	mov r0, #0x1b
	bx r3
	nop
_0202DBB8: .word sub_0202893C
	thumb_func_end sub_0202DBB0

	thumb_func_start sub_0202DBBC
sub_0202DBBC: ; 0x0202DBBC
	cmp r0, #0
	beq _0202DBC8
	cmp r0, #0x10
	bhs _0202DBC8
	mov r0, #1
	bx lr
_0202DBC8:
	mov r0, #0
	bx lr
	thumb_func_end sub_0202DBBC

	thumb_func_start sub_0202DBCC
sub_0202DBCC: ; 0x0202DBCC
	push {r3, r4, r5, lr}
	cmp r1, #0
	blt _0202DBF0
	cmp r1, #8
	bge _0202DBF0
	mov r2, #1
	lsl r2, r2, #8
	add r4, r0, r2
	lsl r0, r1, #6
	add r0, r1, r0
	lsl r5, r0, #2
	ldrh r0, [r4, r5]
	bl sub_0202DBBC
	cmp r0, #0
	beq _0202DBF0
	add r0, r4, r5
	pop {r3, r4, r5, pc}
_0202DBF0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DBCC

	thumb_func_start sub_0202DBF4
sub_0202DBF4: ; 0x0202DBF4
	push {r3, r4, r5, lr}
	cmp r1, #0
	blt _0202DC1A
	cmp r1, #3
	bge _0202DC1A
	mov r2, #0x92
	lsl r2, r2, #4
	add r4, r0, r2
	mov r0, #0xd6
	lsl r0, r0, #2
	add r5, r1, #0
	mul r5, r0
	ldrh r0, [r4, r5]
	bl sub_0202DBBC
	cmp r0, #0
	beq _0202DC24
	add r0, r4, r5
	pop {r3, r4, r5, pc}
_0202DC1A:
	cmp r1, #4
	bne _0202DC24
	ldr r1, _0202DC28 ; =0x00001328
	add r0, r0, r1
	pop {r3, r4, r5, pc}
_0202DC24:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202DC28: .word 0x00001328
	thumb_func_end sub_0202DBF4

	thumb_func_start sub_0202DC2C
sub_0202DC2C: ; 0x0202DC2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #4]
	mov r1, #0
	str r0, [sp]
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	bl sub_0202DE14
	cmp r0, #0
	bne _0202DC48
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202DC48:
	mov r7, #0x41
	lsl r7, r7, #2
	ldr r5, [sp]
	mov r4, #0
	sub r6, r7, #4
_0202DC52:
	ldrh r0, [r5, r6]
	bl sub_0202DBBC
	cmp r0, #0
	bne _0202DC94
	lsl r0, r4, #6
	mov r2, #1
	add r0, r4, r0
	lsl r4, r0, #2
	ldr r1, [sp]
	lsl r2, r2, #8
	add r1, r1, r2
	ldr r0, [sp, #4]
	add r1, r1, r4
	add r2, r2, #4
	bl MIi_CpuCopy8
	ldr r1, _0202DCA8 ; =0x00000102
	ldr r0, [sp]
	mov r2, #3
	add r1, r0, r1
	ldrh r0, [r1, r4]
	bic r0, r2
	ldr r2, [sp, #8]
	lsl r2, r2, #0x10
	lsr r3, r2, #0x10
	mov r2, #3
	and r2, r3
	orr r0, r2
	strh r0, [r1, r4]
	mov r0, #1
	str r0, [sp, #0xc]
	b _0202DC9C
_0202DC94:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, #8
	blt _0202DC52
_0202DC9C:
	mov r0, #0x1b
	bl sub_0202893C
	ldr r0, [sp, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0202DCA8: .word 0x00000102
	thumb_func_end sub_0202DC2C

	thumb_func_start sub_0202DCAC
sub_0202DCAC: ; 0x0202DCAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp, #4]
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #8]
	bl sub_0202DE3C
	cmp r0, #0
	bne _0202DCC6
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0202DCC6:
	ldr r1, _0202DD44 ; =0x00000152
	ldr r0, [sp, #4]
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0202DCE4
	ldr r0, [sp]
	bl sub_0202DE14
	cmp r0, #0
	bne _0202DCE4
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0202DCE4:
	mov r7, #0xd6
	mov r6, #0x92
	ldr r5, [sp]
	mov r4, #0
	lsl r7, r7, #2
	lsl r6, r6, #4
_0202DCF0:
	ldrh r0, [r5, r6]
	bl sub_0202DBBC
	cmp r0, #0
	bne _0202DD30
	mov r2, #0x92
	ldr r1, [sp]
	lsl r2, r2, #4
	add r3, r1, r2
	mov r2, #0xd6
	lsl r2, r2, #2
	add r1, r4, #0
	mul r1, r2
	ldr r0, [sp, #4]
	add r1, r3, r1
	bl MIi_CpuCopy8
	ldr r1, _0202DD44 ; =0x00000152
	ldr r0, [sp, #4]
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0202DD2A
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r4, #0
	bl sub_0202DC2C
_0202DD2A:
	mov r0, #1
	str r0, [sp, #8]
	b _0202DD38
_0202DD30:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, #3
	blt _0202DCF0
_0202DD38:
	mov r0, #0x1b
	bl sub_0202893C
	ldr r0, [sp, #8]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0202DD44: .word 0x00000152
	thumb_func_end sub_0202DCAC

	thumb_func_start sub_0202DD48
sub_0202DD48: ; 0x0202DD48
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0202DD78 ; =0x00001328
	add r4, r1, #0
	ldrh r0, [r5, r0]
	bl sub_0202DBBC
	cmp r0, #1
	bne _0202DD5E
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202DD5E:
	ldr r1, _0202DD78 ; =0x00001328
	mov r2, #0xd6
	add r0, r4, #0
	add r1, r5, r1
	lsl r2, r2, #2
	bl MIi_CpuCopy8
	mov r0, #0x1b
	bl sub_0202893C
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0202DD78: .word 0x00001328
	thumb_func_end sub_0202DD48

	thumb_func_start sub_0202DD7C
sub_0202DD7C: ; 0x0202DD7C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #8
	blt _0202DD8A
	bl GF_AssertFail
_0202DD8A:
	lsl r0, r5, #6
	add r0, r5, r0
	lsl r0, r0, #2
	mov r1, #1
	mov r3, #0
	add r2, r4, r0
	lsl r1, r1, #8
	strh r3, [r2, r1]
	add r1, r1, #2
	add r3, r4, r1
	ldrh r2, [r3, r0]
	mov r1, #3
	bic r2, r1
	strh r2, [r3, r0]
	mov r0, #0x1b
	bl sub_0202893C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DD7C

	thumb_func_start sub_0202DDB0
sub_0202DDB0: ; 0x0202DDB0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #3
	blt _0202DDBE
	bl GF_AssertFail
_0202DDBE:
	mov r0, #0xd6
	lsl r0, r0, #2
	mul r0, r4
	add r2, r5, r0
	mov r0, #0x92
	mov r1, #0
	lsl r0, r0, #4
	strh r1, [r2, r0]
	mov r1, #0xa7
	lsl r1, r1, #4
	ldrh r1, [r2, r1]
	add r0, r5, #0
	bl sub_0202DFDC
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202DF38
	mov r0, #0x1b
	bl sub_0202893C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DDB0

	thumb_func_start sub_0202DDEC
sub_0202DDEC: ; 0x0202DDEC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #3
	blt _0202DDFA
	bl GF_AssertFail
_0202DDFA:
	mov r0, #0xd6
	lsl r0, r0, #2
	mul r0, r4
	add r1, r5, r0
	mov r0, #0x92
	mov r2, #0
	lsl r0, r0, #4
	strh r2, [r1, r0]
	mov r0, #0x1b
	bl sub_0202893C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DDEC

	thumb_func_start sub_0202DE14
sub_0202DE14: ; 0x0202DE14
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0x41
	lsl r7, r7, #2
	add r5, r0, #0
	mov r4, #0
	sub r6, r7, #4
_0202DE20:
	ldrh r0, [r5, r6]
	bl sub_0202DBBC
	cmp r0, #0
	bne _0202DE2E
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202DE2E:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, #8
	blt _0202DE20
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202DE14

	thumb_func_start sub_0202DE3C
sub_0202DE3C: ; 0x0202DE3C
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0xd6
	mov r6, #0x92
	add r5, r0, #0
	mov r4, #0
	lsl r7, r7, #2
	lsl r6, r6, #4
_0202DE4A:
	ldrh r0, [r5, r6]
	bl sub_0202DBBC
	cmp r0, #0
	bne _0202DE58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202DE58:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, #3
	blt _0202DE4A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202DE3C

	thumb_func_start sub_0202DE64
sub_0202DE64: ; 0x0202DE64
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #8
	blt _0202DE72
	bl GF_AssertFail
_0202DE72:
	lsl r0, r4, #6
	add r0, r4, r0
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #1
	lsl r0, r0, #8
	ldrh r0, [r1, r0]
	bl sub_0202DBBC
	cmp r0, #0
	beq _0202DE8C
	mov r0, #1
	pop {r3, r4, r5, pc}
_0202DE8C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DE64

	thumb_func_start sub_0202DE90
sub_0202DE90: ; 0x0202DE90
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #3
	blt _0202DE9E
	bl GF_AssertFail
_0202DE9E:
	mov r0, #0xd6
	lsl r0, r0, #2
	mul r0, r4
	add r1, r5, r0
	mov r0, #0x92
	lsl r0, r0, #4
	ldrh r0, [r1, r0]
	bl sub_0202DBBC
	cmp r0, #0
	beq _0202DEB8
	mov r0, #1
	pop {r3, r4, r5, pc}
_0202DEB8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DE90

	thumb_func_start sub_0202DEBC
sub_0202DEBC: ; 0x0202DEBC
	push {r3, lr}
	ldr r1, _0202DED4 ; =0x00001328
	ldrh r0, [r0, r1]
	bl sub_0202DBBC
	cmp r0, #0
	beq _0202DECE
	mov r0, #1
	pop {r3, pc}
_0202DECE:
	mov r0, #0
	pop {r3, pc}
	nop
_0202DED4: .word 0x00001328
	thumb_func_end sub_0202DEBC

	thumb_func_start sub_0202DED8
sub_0202DED8: ; 0x0202DED8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0202DEDE:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202DE90
	cmp r0, #1
	bne _0202DEEE
	mov r0, #1
	pop {r3, r4, r5, pc}
_0202DEEE:
	add r4, r4, #1
	cmp r4, #3
	blt _0202DEDE
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DED8

	thumb_func_start sub_0202DEF8
sub_0202DEF8: ; 0x0202DEF8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0202DF34 ; =0x00000102
	add r7, r1, #0
	mov r6, #0
	add r4, r5, r0
_0202DF04:
	mov r0, #1
	lsl r0, r0, #8
	ldrh r0, [r5, r0]
	bl sub_0202DBBC
	cmp r0, #0
	beq _0202DF20
	ldrh r0, [r4]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1e
	cmp r7, r0
	bne _0202DF20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202DF20:
	mov r0, #0x41
	lsl r0, r0, #2
	add r6, r6, #1
	add r5, r5, r0
	add r4, r4, r0
	cmp r6, #8
	blt _0202DF04
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202DF34: .word 0x00000102
	thumb_func_end sub_0202DEF8

	thumb_func_start sub_0202DF38
sub_0202DF38: ; 0x0202DF38
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	ldr r1, _0202DF78 ; =0x00000102
	str r0, [sp]
	mov r6, #0
	add r4, r0, #0
	add r5, r0, r1
_0202DF46:
	mov r0, #1
	lsl r0, r0, #8
	ldrh r0, [r4, r0]
	bl sub_0202DBBC
	cmp r0, #0
	beq _0202DF68
	ldrh r0, [r5]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1e
	cmp r7, r0
	bne _0202DF68
	ldr r0, [sp]
	add r1, r6, #0
	bl sub_0202DD7C
	pop {r3, r4, r5, r6, r7, pc}
_0202DF68:
	mov r0, #0x41
	lsl r0, r0, #2
	add r6, r6, #1
	add r4, r4, r0
	add r5, r5, r0
	cmp r6, #8
	blt _0202DF46
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0202DF78: .word 0x00000102
	thumb_func_end sub_0202DF38

	thumb_func_start sub_0202DF7C
sub_0202DF7C: ; 0x0202DF7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #2
	add r4, r1, #0
	lsl r0, r0, #0xa
	cmp r4, r0
	blt _0202DF8E
	bl GF_AssertFail
_0202DF8E:
	mov r0, #1
	mov r1, #7
	add r2, r4, #0
	and r2, r1
	add r1, r0, #0
	lsl r1, r2
	asr r2, r4, #2
	lsr r2, r2, #0x1d
	add r2, r4, r2
	asr r2, r2, #3
	ldrb r2, [r5, r2]
	tst r1, r2
	bne _0202DFAA
	mov r0, #0
_0202DFAA:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DF7C

	thumb_func_start sub_0202DFAC
sub_0202DFAC: ; 0x0202DFAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #2
	add r4, r1, #0
	lsl r0, r0, #0xa
	cmp r4, r0
	blt _0202DFBE
	bl GF_AssertFail
_0202DFBE:
	asr r0, r4, #2
	lsr r0, r0, #0x1d
	add r0, r4, r0
	asr r1, r0, #3
	mov r2, #7
	ldrb r0, [r5, r1]
	mov r3, #1
	and r2, r4
	lsl r3, r2
	orr r0, r3
	strb r0, [r5, r1]
	mov r0, #0x1b
	bl sub_0202893C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DFAC

	thumb_func_start sub_0202DFDC
sub_0202DFDC: ; 0x0202DFDC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #1
	mov r0, #7
	and r0, r4
	add r2, r1, #0
	lsl r2, r0
	mvn r0, r2
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	lsl r0, r1, #0xb
	cmp r4, r0
	blt _0202DFFC
	bl GF_AssertFail
_0202DFFC:
	asr r0, r4, #2
	lsr r0, r0, #0x1d
	add r0, r4, r0
	asr r1, r0, #3
	ldrb r0, [r5, r1]
	and r0, r6
	strb r0, [r5, r1]
	mov r0, #0x1b
	bl sub_0202893C
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202DFDC

	thumb_func_start sub_0202E014
sub_0202E014: ; 0x0202E014
	ldr r3, _0202E01C ; =sub_0202DF7C
	ldr r1, _0202E020 ; =0x000007FF
	bx r3
	nop
_0202E01C: .word sub_0202DF7C
_0202E020: .word 0x000007FF
	thumb_func_end sub_0202E014

	thumb_func_start sub_0202E024
sub_0202E024: ; 0x0202E024
	ldr r3, _0202E02C ; =sub_0202DFAC
	ldr r1, _0202E030 ; =0x000007FF
	bx r3
	nop
_0202E02C: .word sub_0202DFAC
_0202E030: .word 0x000007FF
	thumb_func_end sub_0202E024

	thumb_func_start sub_0202E034
sub_0202E034: ; 0x0202E034
	push {r3, lr}
	ldr r1, _0202E050 ; =0x021D2AF4
	ldr r1, [r1]
	cmp r1, #0
	bne _0202E046
	bl sub_020270E4
	ldr r1, _0202E050 ; =0x021D2AF4
	str r0, [r1]
_0202E046:
	mov r0, #0x1b
	bl sub_0202893C
	pop {r3, pc}
	nop
_0202E050: .word 0x021D2AF4
	thumb_func_end sub_0202E034

	thumb_func_start sub_0202E054
sub_0202E054: ; 0x0202E054
	ldr r0, _0202E064 ; =0x021D2AF4
	ldr r1, [r0]
	cmp r1, #0
	beq _0202E060
	mov r1, #0
	str r1, [r0]
_0202E060:
	bx lr
	nop
_0202E064: .word 0x021D2AF4
	thumb_func_end sub_0202E054

	thumb_func_start sub_0202E068
sub_0202E068: ; 0x0202E068
	push {r3, r4, r5, lr}
	ldr r4, _0202E08C ; =0x021D2AF4
	mov r5, #0
_0202E06E:
	ldr r0, [r4]
	add r1, r5, #0
	bl sub_0202DE64
	cmp r0, #1
	bne _0202E07E
	add r0, r5, #0
	pop {r3, r4, r5, pc}
_0202E07E:
	add r5, r5, #1
	cmp r5, #8
	blt _0202E06E
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	nop
_0202E08C: .word 0x021D2AF4
	thumb_func_end sub_0202E068

	thumb_func_start sub_0202E090
sub_0202E090: ; 0x0202E090
	push {r3, lr}
	add r1, r0, #0
	ldr r0, _0202E0A8 ; =0x021D2AF4
	ldr r0, [r0]
	bl sub_0202DBCC
	cmp r0, #0
	beq _0202E0A4
	ldrh r0, [r0]
	pop {r3, pc}
_0202E0A4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0202E0A8: .word 0x021D2AF4
	thumb_func_end sub_0202E090

	thumb_func_start sub_0202E0AC
sub_0202E0AC: ; 0x0202E0AC
	push {r3, lr}
	add r1, r0, #0
	ldr r0, _0202E0C4 ; =0x021D2AF4
	ldr r0, [r0]
	bl sub_0202DBCC
	cmp r0, #0
	beq _0202E0C0
	add r0, r0, #4
	pop {r3, pc}
_0202E0C0:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0202E0C4: .word 0x021D2AF4
	thumb_func_end sub_0202E0AC

	thumb_func_start sub_0202E0C8
sub_0202E0C8: ; 0x0202E0C8
	add r1, r0, #0
	ldr r0, _0202E0D4 ; =0x021D2AF4
	ldr r3, _0202E0D8 ; =sub_0202DD7C
	ldr r0, [r0]
	bx r3
	nop
_0202E0D4: .word 0x021D2AF4
_0202E0D8: .word sub_0202DD7C
	thumb_func_end sub_0202E0C8

	thumb_func_start sub_0202E0DC
sub_0202E0DC: ; 0x0202E0DC
	ldr r0, _0202E0E0 ; =0x00002AB0
	bx lr
	.balign 4, 0
_0202E0E0: .word 0x00002AB0
	thumb_func_end sub_0202E0DC

	thumb_func_start sub_0202E0E4
sub_0202E0E4: ; 0x0202E0E4
	ldr r3, _0202E0F0 ; =sub_020D47EC
	add r1, r0, #0
	mov r0, #0
	ldr r2, _0202E0F4 ; =0x00002AB0
	bx r3
	nop
_0202E0F0: .word sub_020D47EC
_0202E0F4: .word 0x00002AB0
	thumb_func_end sub_0202E0E4

	thumb_func_start sub_0202E0F8
sub_0202E0F8: ; 0x0202E0F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	cmp r0, #0
	bne _0202E10A
	bl GF_AssertFail
_0202E10A:
	ldr r1, _0202E288 ; =0x00002AA8
	ldr r0, [sp]
	ldr r0, [r0, r1]
	cmp r0, #0x1e
	blo _0202E118
	bl GF_AssertFail
_0202E118:
	ldr r1, _0202E28C ; =0x00002AAC
	ldr r0, [sp]
	ldr r2, [r0, r1]
	ldr r0, _0202E290 ; =0x0000270F
	cmp r2, r0
	blo _0202E126
	b _0202E284
_0202E126:
	ldr r0, [sp]
	sub r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0x5b
	lsl r0, r0, #2
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp]
	add r0, r0, r2
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	bl GetPartyCount
	str r0, [sp, #0x10]
	mov r0, #0xb
	mov r1, #0
	bl String_ctor
	mov r2, #0x5a
	add r6, r0, #0
	ldr r1, [sp, #0x14]
	mov r0, #0
	lsl r2, r2, #2
	bl sub_020D4790
	ldr r0, [sp, #0x10]
	mov r7, #0
	cmp r0, #0
	ble _0202E236
	ldr r5, [sp, #0x14]
_0202E162:
	ldr r0, [sp, #4]
	add r1, r7, #0
	bl GetPartyMonByIndex
	add r4, r0, #0
	bl sub_0206DD40
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0202E226
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r5]
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	strb r0, [r5, #2]
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	mov r1, #0
	strb r0, [r5, #3]
	add r0, r4, #0
	add r2, r1, #0
	bl GetMonData
	str r0, [r5, #4]
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	str r0, [r5, #8]
	add r0, r4, #0
	mov r1, #0x36
	mov r2, #0
	bl GetMonData
	strh r0, [r5, #0x32]
	add r0, r4, #0
	mov r1, #0x37
	mov r2, #0
	bl GetMonData
	strh r0, [r5, #0x34]
	add r0, r4, #0
	mov r1, #0x38
	mov r2, #0
	bl GetMonData
	strh r0, [r5, #0x36]
	add r0, r4, #0
	mov r1, #0x39
	mov r2, #0
	bl GetMonData
	strh r0, [r5, #0x38]
	cmp r6, #0
	beq _0202E21E
	add r0, r4, #0
	mov r1, #0x77
	add r2, r6, #0
	bl GetMonData
	add r1, r5, #0
	add r0, r6, #0
	add r1, #0xc
	mov r2, #0xb
	bl CopyStringToU16Array
	add r0, r4, #0
	mov r1, #0x91
	add r2, r6, #0
	bl GetMonData
	add r1, r5, #0
	add r0, r6, #0
	add r1, #0x22
	mov r2, #8
	bl CopyStringToU16Array
	b _0202E224
_0202E21E:
	ldr r0, _0202E294 ; =0x0000FFFF
	strh r0, [r5, #0xc]
	strh r0, [r5, #0x22]
_0202E224:
	add r5, #0x3c
_0202E226:
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	bl sub_0206DD8C
	ldr r0, [sp, #0x10]
	add r7, r7, #1
	cmp r7, r0
	blt _0202E162
_0202E236:
	ldr r0, [sp, #8]
	mov r1, #0x5a
	ldr r2, [r0]
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	strh r2, [r0, r1]
	ldr r0, [sp, #8]
	add r2, r1, #2
	ldr r3, [r0, #4]
	ldr r0, [sp, #0x14]
	add r1, r1, #3
	strb r3, [r0, r2]
	ldr r0, [sp, #8]
	ldr r2, [r0, #8]
	ldr r0, [sp, #0x14]
	strb r2, [r0, r1]
	ldr r1, _0202E288 ; =0x00002AA8
	ldr r0, [sp]
	ldr r0, [r0, r1]
	add r2, r0, #1
	ldr r0, [sp]
	str r2, [r0, r1]
	ldr r0, [r0, r1]
	cmp r0, #0x1e
	blo _0202E26E
	ldr r0, [sp]
	mov r2, #0
	str r2, [r0, r1]
_0202E26E:
	ldr r1, _0202E28C ; =0x00002AAC
	ldr r0, [sp]
	ldr r0, [r0, r1]
	add r2, r0, #1
	ldr r0, [sp]
	cmp r6, #0
	str r2, [r0, r1]
	beq _0202E284
	add r0, r6, #0
	bl String_dtor
_0202E284:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0202E288: .word 0x00002AA8
_0202E28C: .word 0x00002AAC
_0202E290: .word 0x0000270F
_0202E294: .word 0x0000FFFF
	thumb_func_end sub_0202E0F8

	thumb_func_start sub_0202E298
sub_0202E298: ; 0x0202E298
	push {r4, lr}
	add r4, r0, #0
	bne _0202E2A2
	bl GF_AssertFail
_0202E2A2:
	ldr r0, _0202E2BC ; =0x00002AA8
	ldr r0, [r4, r0]
	cmp r0, #0x1e
	blo _0202E2AE
	bl GF_AssertFail
_0202E2AE:
	ldr r0, _0202E2C0 ; =0x00002AAC
	ldr r0, [r4, r0]
	cmp r0, #0x1e
	blo _0202E2B8
	mov r0, #0x1e
_0202E2B8:
	pop {r4, pc}
	nop
_0202E2BC: .word 0x00002AA8
_0202E2C0: .word 0x00002AAC
	thumb_func_end sub_0202E298

	thumb_func_start sub_0202E2C4
sub_0202E2C4: ; 0x0202E2C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0202E2D2
	bl GF_AssertFail
_0202E2D2:
	ldr r0, _0202E2F0 ; =0x00002AA8
	ldr r0, [r5, r0]
	cmp r0, #0x1e
	blo _0202E2DE
	bl GF_AssertFail
_0202E2DE:
	cmp r4, #0x1e
	blt _0202E2E6
	bl GF_AssertFail
_0202E2E6:
	ldr r0, _0202E2F4 ; =0x00002AAC
	ldr r0, [r5, r0]
	sub r0, r0, r4
	pop {r3, r4, r5, pc}
	nop
_0202E2F0: .word 0x00002AA8
_0202E2F4: .word 0x00002AAC
	thumb_func_end sub_0202E2C4

	thumb_func_start sub_0202E2F8
sub_0202E2F8: ; 0x0202E2F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0202E306
	bl GF_AssertFail
_0202E306:
	ldr r0, _0202E340 ; =0x00002AA8
	ldr r0, [r5, r0]
	cmp r0, #0x1e
	blo _0202E312
	bl GF_AssertFail
_0202E312:
	cmp r4, #0x1e
	blt _0202E31A
	bl GF_AssertFail
_0202E31A:
	ldr r0, _0202E340 ; =0x00002AA8
	ldr r0, [r5, r0]
	sub r0, r0, #1
	sub r2, r0, r4
	bpl _0202E326
	add r2, #0x1e
_0202E326:
	mov r1, #0x5b
	lsl r1, r1, #2
	mul r1, r2
	mov r0, #0
	add r2, r5, r1
_0202E330:
	ldrh r1, [r2]
	cmp r1, #0
	beq _0202E33E
	add r0, r0, #1
	add r2, #0x3c
	cmp r0, #6
	blo _0202E330
_0202E33E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202E340: .word 0x00002AA8
	thumb_func_end sub_0202E2F8

	thumb_func_start sub_0202E344
sub_0202E344: ; 0x0202E344
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	cmp r5, #0
	bne _0202E356
	bl GF_AssertFail
_0202E356:
	ldr r0, _0202E3C0 ; =0x00002AA8
	ldr r0, [r5, r0]
	cmp r0, #0x1e
	blo _0202E362
	bl GF_AssertFail
_0202E362:
	cmp r6, #0x1e
	blt _0202E36A
	bl GF_AssertFail
_0202E36A:
	ldr r0, _0202E3C0 ; =0x00002AA8
	ldr r0, [r5, r0]
	sub r0, r0, #1
	sub r1, r0, r6
	bpl _0202E376
	add r1, #0x1e
_0202E376:
	mov r0, #0x5b
	lsl r0, r0, #2
	mul r0, r1
	add r1, r5, r0
	mov r0, #0x3c
	mul r0, r7
	add r5, r1, r0
	ldrh r0, [r1, r0]
	add r1, r5, #0
	add r1, #0xc
	strh r0, [r4, #0x10]
	ldrb r0, [r5, #2]
	strb r0, [r4, #0x12]
	ldr r0, [r5, #4]
	str r0, [r4, #8]
	ldr r0, [r5, #8]
	str r0, [r4, #0xc]
	ldrb r0, [r5, #3]
	strb r0, [r4, #0x13]
	ldr r0, [r4]
	bl CopyU16ArrayToString
	add r1, r5, #0
	ldr r0, [r4, #4]
	add r1, #0x22
	bl CopyU16ArrayToString
	mov r1, #0
_0202E3AE:
	ldrh r0, [r5, #0x32]
	add r1, r1, #1
	add r5, r5, #2
	strh r0, [r4, #0x14]
	add r4, r4, #2
	cmp r1, #4
	blt _0202E3AE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202E3C0: .word 0x00002AA8
	thumb_func_end sub_0202E344

	thumb_func_start sub_0202E3C4
sub_0202E3C4: ; 0x0202E3C4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	cmp r5, #0
	bne _0202E3D4
	bl GF_AssertFail
_0202E3D4:
	ldr r0, _0202E418 ; =0x00002AA8
	ldr r0, [r5, r0]
	cmp r0, #0x1e
	blo _0202E3E0
	bl GF_AssertFail
_0202E3E0:
	cmp r6, #0x1e
	blt _0202E3E8
	bl GF_AssertFail
_0202E3E8:
	ldr r0, _0202E418 ; =0x00002AA8
	ldr r0, [r5, r0]
	sub r0, r0, #1
	sub r2, r0, r6
	bpl _0202E3F4
	add r2, #0x1e
_0202E3F4:
	mov r0, #0x5b
	lsl r0, r0, #2
	add r1, r2, #0
	mul r1, r0
	add r2, r5, r1
	sub r1, r0, #4
	ldrh r1, [r2, r1]
	str r1, [r4]
	sub r1, r0, #2
	ldrb r1, [r2, r1]
	sub r0, r0, #1
	str r1, [r4, #4]
	ldrb r0, [r2, r0]
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0xc]
	pop {r4, r5, r6, pc}
	nop
_0202E418: .word 0x00002AA8
	thumb_func_end sub_0202E3C4

	thumb_func_start sub_0202E41C
sub_0202E41C: ; 0x0202E41C
	ldr r0, _0202E420 ; =0x00000BC8
	bx lr
	.balign 4, 0
_0202E420: .word 0x00000BC8
	thumb_func_end sub_0202E41C

	thumb_func_start sub_0202E424
sub_0202E424: ; 0x0202E424
	push {r3, lr}
	ldr r2, _0202E438 ; =0x00000BC8
	add r1, r0, #0
	mov r0, #0
	bl MIi_CpuClearFast
	mov r0, #0x17
	bl sub_0202893C
	pop {r3, pc}
	.balign 4, 0
_0202E438: .word 0x00000BC8
	thumb_func_end sub_0202E424

	thumb_func_start sub_0202E43C
sub_0202E43C: ; 0x0202E43C
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	mov r0, #0
	add r1, #0xc
	mov r2, #0xc0
	bl MIi_CpuClearFast
	add r1, r4, #0
	mov r0, #0
	add r1, #0xcc
	mov r2, #0xc0
	bl MIi_CpuClearFast
	mov r1, #0x63
	lsl r1, r1, #2
	mov r0, #0
	add r1, r4, r1
	mov r2, #0xc0
	bl MIi_CpuClearFast
	add r0, r4, #0
	bl sub_0202E474
	mov r0, #0x17
	bl sub_0202893C
	pop {r4, pc}
	thumb_func_end sub_0202E43C

	thumb_func_start sub_0202E474
sub_0202E474: ; 0x0202E474
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl sub_0202E48C
	add r0, r4, #0
	bl sub_0202E498
	mov r0, #0x17
	bl sub_0202893C
	pop {r4, pc}
	thumb_func_end sub_0202E474

	thumb_func_start sub_0202E48C
sub_0202E48C: ; 0x0202E48C
	ldr r3, _0202E494 ; =sub_0202893C
	strb r1, [r0, #8]
	mov r0, #0x17
	bx r3
	.balign 4, 0
_0202E494: .word sub_0202893C
	thumb_func_end sub_0202E48C

	thumb_func_start sub_0202E498
sub_0202E498: ; 0x0202E498
	mov r2, #0
	add r1, r2, #0
_0202E49C:
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #4
	blt _0202E49C
	ldr r3, _0202E4AC ; =sub_0202893C
	mov r0, #0x17
	bx r3
	nop
_0202E4AC: .word sub_0202893C
	thumb_func_end sub_0202E498

	thumb_func_start sub_0202E4B0
sub_0202E4B0: ; 0x0202E4B0
	lsl r1, r0, #1
	ldr r0, _0202E4B8 ; =0x020F684C
	ldrb r0, [r0, r1]
	bx lr
	.balign 4, 0
_0202E4B8: .word 0x020F684C
	thumb_func_end sub_0202E4B0

	thumb_func_start sub_0202E4BC
sub_0202E4BC: ; 0x0202E4BC
	lsl r1, r0, #1
	ldr r0, _0202E4C4 ; =0x020F684D
	ldrb r0, [r0, r1]
	bx lr
	.balign 4, 0
_0202E4C4: .word 0x020F684D
	thumb_func_end sub_0202E4BC

	thumb_func_start sub_0202E4C8
sub_0202E4C8: ; 0x0202E4C8
	push {r3, lr}
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	add r0, #8
	mov r1, #8
	bl StringFillEOS
	mov r0, #0x18
	bl sub_0202893C
	pop {r3, pc}
	thumb_func_end sub_0202E4C8

	thumb_func_start sub_0202E4E0
sub_0202E4E0: ; 0x0202E4E0
	push {r3, lr}
	add r0, #8
	bl StringLength
	cmp r0, #0
	beq _0202E4F0
	mov r0, #1
	pop {r3, pc}
_0202E4F0:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0202E4E0

	thumb_func_start sub_0202E4F4
sub_0202E4F4: ; 0x0202E4F4
	mov r0, #0xea
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202E4F4

	thumb_func_start sub_0202E4FC
sub_0202E4FC: ; 0x0202E4FC
	push {r3, r4, r5, r6, r7, lr}
	mov r2, #0xea
	mov r1, #0
	lsl r2, r2, #4
	add r6, r0, #0
	bl MIi_CpuFill8
	mov r7, #0
_0202E50C:
	mov r4, #0
	add r5, r6, #0
_0202E510:
	add r0, r5, #0
	bl sub_0202E4C8
	add r4, r4, #1
	add r5, #0x18
	cmp r4, #6
	blt _0202E510
	add r7, r7, #1
	add r6, #0x90
	cmp r7, #0x1a
	blt _0202E50C
	mov r0, #0x18
	bl sub_0202893C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202E4FC

	thumb_func_start sub_0202E530
sub_0202E530: ; 0x0202E530
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl sub_02028900
	add r0, r4, #0
	mov r1, #0x18
	bl SavArray_get
	pop {r4, pc}
	thumb_func_end sub_0202E530

	thumb_func_start sub_0202E544
sub_0202E544: ; 0x0202E544
	push {r4, r5, r6, lr}
	cmp r2, #6
	blo _0202E552
	blo _0202E58A
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_0202E552:
	mov r3, #0x90
	mul r3, r1
	add r3, r0, r3
	cmp r2, #5
	bge _0202E57C
	mov r0, #0x18
	mul r0, r2
	add r6, r3, r0
_0202E562:
	add r5, r6, #0
	add r5, #0x18
	add r4, r6, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	add r2, r2, #1
	add r6, #0x18
	stmia r4!, {r0, r1}
	cmp r2, #5
	blt _0202E562
_0202E57C:
	add r3, #0x78
	add r0, r3, #0
	bl sub_0202E4C8
	mov r0, #0x18
	bl sub_0202893C
_0202E58A:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202E544

	thumb_func_start sub_0202E58C
sub_0202E58C: ; 0x0202E58C
	mov r0, #0x4e
	lsl r0, r0, #2
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202E58C

	thumb_func_start sub_0202E594
sub_0202E594: ; 0x0202E594
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r6, r1, #0
	bl sub_0202CF54
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203107C
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0x34
	bl AllocFromHeapAtEnd
	ldr r7, _0202E668 ; =0x020F6854
	str r0, [sp]
	mov r6, #0
	add r5, r0, #0
_0202E5BA:
	cmp r6, #5
	beq _0202E5C8
	cmp r6, #0xa
	beq _0202E5EC
	cmp r6, #0xb
	beq _0202E606
	b _0202E630
_0202E5C8:
	add r0, r4, #0
	mov r1, #0x10
	bl sub_0202D18C
	str r0, [sp, #8]
	cmp r0, #0
	beq _0202E5E6
	add r0, r4, #0
	mov r1, #0x1e
	bl sub_0202D18C
	ldr r1, [sp, #8]
	bl _u32_div_f
	str r0, [sp, #8]
_0202E5E6:
	ldr r0, [sp, #8]
	str r0, [r5]
	b _0202E650
_0202E5EC:
	add r0, r4, #0
	mov r1, #0x5d
	bl sub_0202D18C
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x5e
	bl sub_0202D18C
	ldr r1, [sp, #0xc]
	add r0, r1, r0
	str r0, [r5]
	b _0202E650
_0202E606:
	add r0, r4, #0
	mov r1, #0x5b
	bl sub_0202D18C
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0x5c
	bl sub_0202D18C
	ldr r1, [sp, #0x10]
	add r1, r1, r0
	beq _0202E62C
	ldr r0, [sp]
	ldr r2, [r0, #0x28]
	mov r0, #0x64
	mul r0, r2
	bl _u32_div_f
	add r1, r0, #0
_0202E62C:
	str r1, [r5]
	b _0202E650
_0202E630:
	cmp r6, #0
	blt _0202E646
	cmp r6, #4
	bgt _0202E646
	ldr r0, [sp, #4]
	ldr r1, [r7]
	mov r2, #0xff
	bl sub_020310BC
	str r0, [r5]
	b _0202E650
_0202E646:
	ldr r1, [r7]
	add r0, r4, #0
	bl sub_0202D18C
	str r0, [r5]
_0202E650:
	add r6, r6, #1
	add r5, r5, #4
	add r7, r7, #4
	cmp r6, #0xd
	blt _0202E5BA
	mov r0, #0x18
	bl sub_0202893C
	ldr r0, [sp]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0202E668: .word 0x020F6854
	thumb_func_end sub_0202E594

	thumb_func_start sub_0202E66C
sub_0202E66C: ; 0x0202E66C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0x4e
	add r6, r0, #0
	add r0, r4, #0
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
	mov r2, #0x4e
	mov r1, #0
	lsl r2, r2, #2
	str r0, [sp, #4]
	bl MIi_CpuFill8
	add r0, r5, #0
	bl sub_0202C854
	mov r1, #1
	bl sub_0202C7B4
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r4, #0
	bl sub_02028F68
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202E594
	ldr r4, [sp, #4]
	str r0, [sp]
	mov r6, #0
	add r5, r0, #0
_0202E6B8:
	ldr r0, [sp, #8]
	add r1, r4, #0
	str r0, [r4]
	add r0, r7, #0
	add r1, #8
	mov r2, #8
	bl CopyStringToU16Array
	ldr r0, [r5]
	add r6, r6, #1
	str r0, [r4, #4]
	add r4, #0x18
	add r5, r5, #4
	cmp r6, #0xd
	blt _0202E6B8
	ldr r0, [sp]
	bl FreeToHeap
	add r0, r7, #0
	bl String_dtor
	mov r0, #0x18
	bl sub_0202893C
	ldr r0, [sp, #4]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202E66C

	thumb_func_start sub_0202E6F0
sub_0202E6F0: ; 0x0202E6F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0202E6F6:
	add r0, r5, #0
	bl sub_0202E4C8
	add r4, r4, #1
	add r5, #0x18
	cmp r4, #6
	blt _0202E6F6
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202E6F0

	thumb_func_start sub_0202E708
sub_0202E708: ; 0x0202E708
	push {r3, lr}
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	beq _0202E716
	mov r0, #0
	pop {r3, pc}
_0202E716:
	add r0, #8
	add r1, #8
	bl StringNotEqual
	cmp r0, #0
	bne _0202E726
	mov r0, #1
	pop {r3, pc}
_0202E726:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202E708

	thumb_func_start sub_0202E72C
sub_0202E72C: ; 0x0202E72C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #4]
	add r7, r1, #0
	mov r4, #0
	cmp r0, #0
	ble _0202E756
	add r5, r6, #0
_0202E73C:
	ldr r0, [r5, #0xc]
	add r1, r7, #0
	bl sub_0202E708
	cmp r0, #0
	beq _0202E74C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202E74C:
	ldr r0, [r6, #4]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0202E73C
_0202E756:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202E72C

	thumb_func_start sub_0202E75C
sub_0202E75C: ; 0x0202E75C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r5, r0, #0
	str r2, [sp]
	add r0, r6, #0
	mov r1, #0
	mov r2, #0xe0
	add r4, r3, #0
	bl MIi_CpuFill8
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _0202E7EC
	mov r2, #0x90
	add r0, r4, #0
	mul r0, r2
	add r1, r6, #0
	add r0, r5, r0
	add r1, #0x50
	str r0, [sp, #8]
	bl MIi_CpuCopy8
	add r1, sp, #0x10
	ldrb r3, [r1, #0x18]
	mov r0, #0
	cmp r3, #0
	ble _0202E7B6
	mov r2, #0x18
	ldr r1, [sp, #0x24]
	mul r2, r4
_0202E79C:
	ldr r5, [r6, #4]
	add r0, r0, #1
	add r4, r5, #0
	add r4, r4, #1
	str r4, [r6, #4]
	ldr r4, [r1]
	lsl r5, r5, #2
	add r4, r4, r2
	add r5, r6, r5
	str r4, [r5, #0xc]
	add r1, r1, #4
	cmp r0, r3
	blt _0202E79C
_0202E7B6:
	add r4, r6, #0
	add r4, #0x50
	mov r7, #0
	add r5, r4, #0
_0202E7BE:
	add r0, r4, #0
	bl sub_0202E4E0
	cmp r0, #0
	beq _0202E7E0
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202E72C
	cmp r0, #0
	bne _0202E7E0
	ldr r1, [r6]
	add r0, r1, #1
	str r0, [r6]
	lsl r0, r1, #2
	add r0, r6, r0
	str r4, [r0, #0x38]
_0202E7E0:
	add r7, r7, #1
	add r4, #0x18
	add r5, #0x18
	cmp r7, #6
	blt _0202E7BE
	b _0202E880
_0202E7EC:
	add r0, r4, #0
	add r0, #0xd
	mov r2, #0x90
	add r1, r0, #0
	mul r1, r2
	add r0, r5, r1
	add r1, r6, #0
	add r1, #0x50
	str r0, [sp, #8]
	bl MIi_CpuCopy8
	add r0, sp, #0x10
	ldrb r2, [r0, #0x18]
	mov r3, #0
	cmp r2, #0
	ble _0202E83A
	mov r1, #0x18
	ldr r0, [sp, #0x24]
	mul r1, r4
_0202E812:
	ldr r4, [r0]
	ldr r5, [r1, r4]
	cmp r5, #0
	beq _0202E832
	ldr r4, [sp]
	cmp r4, r5
	bne _0202E832
	ldr r5, [r6, #4]
	add r4, r5, #0
	add r4, r4, #1
	str r4, [r6, #4]
	ldr r4, [r0]
	lsl r5, r5, #2
	add r4, r4, r1
	add r5, r6, r5
	str r4, [r5, #0xc]
_0202E832:
	add r3, r3, #1
	add r0, r0, #4
	cmp r3, r2
	blt _0202E812
_0202E83A:
	add r4, r6, #0
	mov r0, #0
	add r4, #0x50
	str r0, [sp, #4]
	add r5, r6, #0
	add r7, r4, #0
_0202E846:
	add r0, r4, #0
	bl sub_0202E4E0
	cmp r0, #0
	beq _0202E870
	ldr r1, [r5, #0x50]
	ldr r0, [sp]
	cmp r0, r1
	bne _0202E870
	add r0, r6, #0
	add r1, r7, #0
	bl sub_0202E72C
	cmp r0, #0
	bne _0202E870
	ldr r1, [r6]
	add r0, r1, #1
	str r0, [r6]
	lsl r0, r1, #2
	add r0, r6, r0
	str r4, [r0, #0x38]
_0202E870:
	ldr r0, [sp, #4]
	add r4, #0x18
	add r0, r0, #1
	add r5, #0x18
	add r7, #0x18
	str r0, [sp, #4]
	cmp r0, #6
	blt _0202E846
_0202E880:
	ldr r1, [r6, #4]
	ldr r0, [r6]
	mov r2, #0
	add r0, r1, r0
	str r0, [r6, #8]
	ldr r0, [r6]
	cmp r0, #0
	ble _0202E8A8
	add r1, r6, #0
_0202E892:
	ldr r3, [r6, #4]
	ldr r0, [r1, #0x38]
	add r3, r2, r3
	lsl r3, r3, #2
	add r3, r6, r3
	str r0, [r3, #0xc]
	ldr r0, [r6]
	add r2, r2, #1
	add r1, r1, #4
	cmp r2, r0
	blt _0202E892
_0202E8A8:
	mov r0, #0
	mov ip, r0
	ldr r0, [r6, #8]
	sub r5, r0, #1
	cmp r5, #0
	ble _0202E8EC
	add r3, r6, #0
_0202E8B6:
	mov r0, ip
	cmp r5, r0
	ble _0202E8DA
	lsl r0, r5, #2
	add r4, r6, r0
_0202E8C0:
	ldr r2, [r4, #0xc]
	ldr r7, [r3, #0xc]
	ldr r0, [r2, #4]
	ldr r1, [r7, #4]
	cmp r1, r0
	bhs _0202E8D0
	str r2, [r3, #0xc]
	str r7, [r4, #0xc]
_0202E8D0:
	sub r5, r5, #1
	mov r0, ip
	sub r4, r4, #4
	cmp r5, r0
	bgt _0202E8C0
_0202E8DA:
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	ldr r0, [r6, #8]
	add r3, r3, #4
	sub r5, r0, #1
	mov r0, ip
	cmp r0, r5
	blt _0202E8B6
_0202E8EC:
	ldr r0, [sp, #8]
	bl sub_0202E6F0
	mov r3, #0
	add r2, r6, #0
	b _0202E912
_0202E8F8:
	ldr r5, [r2, #0xc]
	ldr r4, [sp, #8]
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [sp, #8]
	add r2, r2, #4
	add r0, #0x18
	str r0, [sp, #8]
	add r3, r3, #1
_0202E912:
	cmp r3, #6
	bge _0202E91C
	ldr r0, [r6, #8]
	cmp r3, r0
	blt _0202E8F8
_0202E91C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0202E75C

	thumb_func_start sub_0202E920
sub_0202E920: ; 0x0202E920
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r5, r1, #0
	ldr r0, [sp, #0x2c]
	mov r1, #0xe0
	str r2, [sp, #0x10]
	add r4, r3, #0
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	add r0, sp, #0x18
	ldrb r0, [r0, #0x10]
	add r1, r6, #0
	add r2, r5, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r7, #0
	bl sub_0202E75C
	cmp r5, #0
	beq _0202E972
	mov r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	add r0, sp, #0x18
	ldrb r0, [r0, #0x10]
	add r1, r6, #0
	add r2, r5, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r7, #0
	bl sub_0202E75C
_0202E972:
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0202E920

	thumb_func_start sub_0202E97C
sub_0202E97C: ; 0x0202E97C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r6, r1, #0
	ldr r1, [sp, #0x38]
	add r4, r0, #0
	add r5, r2, #0
	add r7, r3, #0
	str r1, [sp, #0x38]
	bl sub_0202E530
	str r0, [sp, #8]
	add r0, r4, #0
	bl sub_0202C854
	mov r1, #1
	bl sub_0202C7B4
	mov r4, #0
	add r3, r4, #0
	str r0, [sp, #0xc]
	cmp r5, #0
	bls _0202E9CC
_0202E9A8:
	cmp r3, r6
	beq _0202E9C2
	lsl r0, r3, #2
	ldr r2, [r7, r0]
	cmp r2, #0
	beq _0202E9C2
	add r1, r4, #1
	add r0, r4, #0
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	lsl r1, r0, #2
	add r0, sp, #0x10
	str r2, [r0, r1]
_0202E9C2:
	add r0, r3, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	cmp r3, r5
	blo _0202E9A8
_0202E9CC:
	cmp r4, #0
	beq _0202E9F6
	mov r5, #0
	add r6, sp, #0x10
_0202E9D4:
	ldr r0, [sp, #0x38]
	str r4, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	add r2, r5, #0
	add r3, r6, #0
	bl sub_0202E920
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0xd
	blo _0202E9D4
	mov r0, #0x18
	bl sub_0202893C
_0202E9F6:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202E97C

	thumb_func_start sub_0202E9FC
sub_0202E9FC: ; 0x0202E9FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r2, [sp]
	add r4, r0, #0
	add r5, r1, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #4]
	ldr r0, [sp]
	mov r1, #0x4c
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x4c
	add r7, r0, #0
	bl MIi_CpuFill8
	add r0, r4, #0
	bl sub_0202C854
	mov r1, #1
	bl sub_0202C7B4
	str r0, [sp, #0xc]
	ldr r1, [sp]
	add r0, r4, #0
	bl sub_0202E594
	str r0, [sp, #8]
	add r0, r5, #0
	bl sub_0202E4B0
	str r0, [r7]
	add r0, r5, #0
	bl sub_0202E4BC
	ldr r1, [r7]
	mov r6, #0
	cmp r1, #0
	ble _0202EA72
	lsl r1, r0, #2
	ldr r0, [sp, #8]
	add r4, r7, #0
	add r5, r0, r1
_0202EA54:
	ldr r0, [sp, #0xc]
	ldr r1, [sp]
	str r0, [r4, #4]
	ldr r0, [r5]
	str r0, [r4, #8]
	ldr r0, [sp, #4]
	bl sub_02028F68
	str r0, [r4, #0xc]
	ldr r0, [r7]
	add r6, r6, #1
	add r4, #0xc
	add r5, r5, #4
	cmp r6, r0
	blt _0202EA54
_0202EA72:
	ldr r0, [sp, #8]
	bl FreeToHeap
	add r0, r7, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202E9FC

	thumb_func_start sub_0202EA80
sub_0202EA80: ; 0x0202EA80
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	str r1, [sp]
	add r0, r7, #0
	mov r1, #0x4c
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x4c
	add r4, r0, #0
	bl MIi_CpuFill8
	ldr r0, [sp]
	mov r1, #0x90
	mul r1, r0
	mov r6, #0
	add r5, r5, r1
_0202EAA4:
	add r0, r5, #0
	bl sub_0202E4E0
	cmp r0, #0
	beq _0202EAF0
	ldr r2, [r4]
	mov r1, #0xc
	mul r1, r2
	ldr r0, [r5]
	add r1, r4, r1
	str r0, [r1, #4]
	ldr r2, [r4]
	mov r1, #0xc
	mul r1, r2
	ldr r0, [r5, #4]
	add r1, r4, r1
	str r0, [r1, #8]
	mov r0, #8
	add r1, r7, #0
	bl String_ctor
	ldr r2, [r4]
	mov r1, #0xc
	mul r1, r2
	add r1, r4, r1
	str r0, [r1, #0xc]
	ldr r1, [r4]
	mov r0, #0xc
	mul r0, r1
	add r0, r4, r0
	add r1, r5, #0
	ldr r0, [r0, #0xc]
	add r1, #8
	bl CopyU16ArrayToString
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0202EAF0:
	add r6, r6, #1
	add r5, #0x18
	cmp r6, #6
	blt _0202EAA4
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202EA80

	thumb_func_start sub_0202EAFC
sub_0202EAFC: ; 0x0202EAFC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_0202EB04:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _0202EB0E
	bl String_dtor
_0202EB0E:
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #6
	blt _0202EB04
	add r0, r6, #0
	mov r1, #0
	mov r2, #0x4c
	bl MIi_CpuFill8
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #0x18
	bl sub_0202893C
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202EAFC

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
	mov r6, #0xac
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
	mov r6, #0xac
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
	ldr r3, _0202EC24 ; =sub_02071780
	bx r3
	nop
_0202EC24: .word sub_02071780
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

	thumb_func_start sub_0202EC70
sub_0202EC70: ; 0x0202EC70
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
	thumb_func_end sub_0202EC70

	thumb_func_start sub_0202EC98
sub_0202EC98: ; 0x0202EC98
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
	mov r7, #0xac
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

	thumb_func_start sub_0202ECC0
sub_0202ECC0: ; 0x0202ECC0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0202ED12
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r5, #0
	bl sub_0202A634
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0202CF54
	add r1, r7, #0
	add r2, r4, #0
	bl sub_0202D214
	add r0, r7, #0
	add r1, r6, #0
	bl sub_0202A434
	ldr r0, _0202ED14 ; =0x00000181
	cmp r4, r0
	bne _0202ED12
	add r0, r5, #0
	bl sub_020325EC
	mov r1, #0x15
	bl sub_02032744
_0202ED12:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0202ED14: .word 0x00000181
	thumb_func_end sub_0202ECC0

	thumb_func_start sub_0202ED18
sub_0202ED18: ; 0x0202ED18
	mov r0, #8
	bx lr
	thumb_func_end sub_0202ED18

	thumb_func_start sub_0202ED1C
sub_0202ED1C: ; 0x0202ED1C
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202ED1C

	thumb_func_start sub_0202ED34
sub_0202ED34: ; 0x0202ED34
	ldr r3, _0202ED3C ; =SavArray_get
	mov r1, #0x21
	bx r3
	nop
_0202ED3C: .word SavArray_get
	thumb_func_end sub_0202ED34

	thumb_func_start sub_0202ED40
sub_0202ED40: ; 0x0202ED40
	str r0, [r1]
	bx lr
	thumb_func_end sub_0202ED40

	thumb_func_start sub_0202ED44
sub_0202ED44: ; 0x0202ED44
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_0202ED44

	thumb_func_start sub_0202ED48
sub_0202ED48: ; 0x0202ED48
	ldr r3, [r1, #4]
	mov r2, #3
	bic r3, r2
	mov r2, #3
	and r0, r2
	orr r0, r3
	str r0, [r1, #4]
	bx lr
	thumb_func_end sub_0202ED48

	thumb_func_start sub_0202ED58
sub_0202ED58: ; 0x0202ED58
	ldr r3, [r0, #4]
	mov r2, #4
	lsl r1, r1, #0x1f
	bic r3, r2
	lsr r1, r1, #0x1d
	orr r1, r3
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_0202ED58

	thumb_func_start sub_0202ED68
sub_0202ED68: ; 0x0202ED68
	ldr r0, [r0, #4]
	lsl r0, r0, #0x1d
	asr r0, r0, #0x1f
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end sub_0202ED68

	thumb_func_start sub_0202ED74
sub_0202ED74: ; 0x0202ED74
	ldr r0, _0202ED78 ; =0x00000658
	bx lr
	.balign 4, 0
_0202ED78: .word 0x00000658
	thumb_func_end sub_0202ED74

	thumb_func_start sub_0202ED7C
sub_0202ED7C: ; 0x0202ED7C
	ldr r3, _0202ED84 ; =SavArray_get
	mov r1, #0x22
	bx r3
	nop
_0202ED84: .word SavArray_get
	thumb_func_end sub_0202ED7C

	thumb_func_start sub_0202ED88
sub_0202ED88: ; 0x0202ED88
	push {r3, lr}
	mov r1, #0x22
	bl SavArray_get
	bl sub_0202EFB8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202ED88

	thumb_func_start sub_0202ED98
sub_0202ED98: ; 0x0202ED98
	push {r4, lr}
	ldr r2, _0202EDD8 ; =0x00000658
	mov r1, #0
	add r4, r0, #0
	bl MIi_CpuFill8
	mov r0, #3
	strb r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, _0202EDDC ; =0xFE03FFFF
	and r0, r1
	str r0, [r4, #4]
	mov r0, #0
	strb r0, [r4, #1]
	mov r0, #0x80
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	strb r0, [r4, #2]
	ldr r1, [r4, #4]
	ldr r0, _0202EDE0 ; =0xF9FFFFFF
	and r1, r0
	ldr r0, _0202EDE4 ; =0xE7FFFFFF
	and r0, r1
	str r0, [r4, #4]
	add r0, r4, #0
	bl sub_0202EF9C
	ldr r0, _0202EDE8 ; =0x000004B8
	add r0, r4, r0
	bl sub_0202EFE8
	pop {r4, pc}
	.balign 4, 0
_0202EDD8: .word 0x00000658
_0202EDDC: .word 0xFE03FFFF
_0202EDE0: .word 0xF9FFFFFF
_0202EDE4: .word 0xE7FFFFFF
_0202EDE8: .word 0x000004B8
	thumb_func_end sub_0202ED98

	thumb_func_start sub_0202EDEC
sub_0202EDEC: ; 0x0202EDEC
	ldr r3, _0202EDF0 ; =sub_0202ED98
	bx r3
	.balign 4, 0
_0202EDF0: .word sub_0202ED98
	thumb_func_end sub_0202EDEC

	thumb_func_start sub_0202EDF4
sub_0202EDF4: ; 0x0202EDF4
	add r0, #8
	bx lr
	thumb_func_end sub_0202EDF4

	thumb_func_start sub_0202EDF8
sub_0202EDF8: ; 0x0202EDF8
	ldrb r0, [r0]
	bx lr
	thumb_func_end sub_0202EDF8

	thumb_func_start sub_0202EDFC
sub_0202EDFC: ; 0x0202EDFC
	strb r1, [r0]
	bx lr
	thumb_func_end sub_0202EDFC

	thumb_func_start sub_0202EE00
sub_0202EE00: ; 0x0202EE00
	cmp r1, #0
	beq _0202EE0E
	cmp r1, #1
	beq _0202EE18
	cmp r1, #2
	beq _0202EE30
	bx lr
_0202EE0E:
	ldr r2, [r0, #4]
	ldr r1, _0202EE48 ; =0xF9FFFFFF
	and r1, r2
	str r1, [r0, #4]
	bx lr
_0202EE18:
	ldr r2, [r0, #4]
	ldr r1, _0202EE48 ; =0xF9FFFFFF
	and r1, r2
	lsl r2, r2, #5
	lsr r3, r2, #0x1e
	mov r2, #1
	orr r2, r3
	lsl r2, r2, #0x1e
	lsr r2, r2, #5
	orr r1, r2
	str r1, [r0, #4]
	bx lr
_0202EE30:
	ldr r2, [r0, #4]
	ldr r1, _0202EE48 ; =0xF9FFFFFF
	and r1, r2
	lsl r2, r2, #5
	lsr r3, r2, #0x1e
	mov r2, #2
	orr r2, r3
	lsl r2, r2, #0x1e
	lsr r2, r2, #5
	orr r1, r2
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
_0202EE48: .word 0xF9FFFFFF
	thumb_func_end sub_0202EE00

	thumb_func_start sub_0202EE4C
sub_0202EE4C: ; 0x0202EE4C
	ldr r0, [r0, #4]
	lsl r0, r0, #5
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end sub_0202EE4C

	thumb_func_start sub_0202EE58
sub_0202EE58: ; 0x0202EE58
	cmp r1, #3
	bhs _0202EE6A
	ldr r3, [r0, #4]
	ldr r2, _0202EE6C ; =0xE7FFFFFF
	lsl r1, r1, #0x1e
	and r2, r3
	lsr r1, r1, #3
	orr r1, r2
	str r1, [r0, #4]
_0202EE6A:
	bx lr
	.balign 4, 0
_0202EE6C: .word 0xE7FFFFFF
	thumb_func_end sub_0202EE58

	thumb_func_start sub_0202EE70
sub_0202EE70: ; 0x0202EE70
	ldr r0, [r0, #4]
	lsl r0, r0, #3
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end sub_0202EE70

	thumb_func_start sub_0202EE7C
sub_0202EE7C: ; 0x0202EE7C
	ldr r0, [r0, #4]
	lsl r0, r0, #7
	lsr r0, r0, #0x19
	bx lr
	thumb_func_end sub_0202EE7C

	thumb_func_start sub_0202EE84
sub_0202EE84: ; 0x0202EE84
	ldr r3, [r0, #4]
	ldr r2, _0202EE94 ; =0xFE03FFFF
	lsl r1, r1, #0x19
	and r2, r3
	lsr r1, r1, #7
	orr r1, r2
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
_0202EE94: .word 0xFE03FFFF
	thumb_func_end sub_0202EE84

	thumb_func_start sub_0202EE98
sub_0202EE98: ; 0x0202EE98
	ldr r0, [r0, #4]
	lsl r0, r0, #0x17
	lsr r0, r0, #0x17
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end sub_0202EE98

	thumb_func_start sub_0202EEA4
sub_0202EEA4: ; 0x0202EEA4
	ldrb r0, [r0, #1]
	bx lr
	thumb_func_end sub_0202EEA4

	thumb_func_start sub_0202EEA8
sub_0202EEA8: ; 0x0202EEA8
	strb r1, [r0, #1]
	bx lr
	thumb_func_end sub_0202EEA8

	thumb_func_start sub_0202EEAC
sub_0202EEAC: ; 0x0202EEAC
	strb r1, [r0, #2]
	strb r2, [r0, #3]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202EEAC

	thumb_func_start sub_0202EEB4
sub_0202EEB4: ; 0x0202EEB4
	ldrb r3, [r0, #2]
	strh r3, [r1]
	ldrb r0, [r0, #3]
	strh r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202EEB4

	thumb_func_start sub_0202EEC0
sub_0202EEC0: ; 0x0202EEC0
	ldr r2, _0202EEE0 ; =0x0000060C
	mov r3, #0
_0202EEC4:
	add r1, r0, r3
	ldrb r1, [r1, r2]
	cmp r1, #0xff
	bne _0202EED0
	add r0, r3, #0
	bx lr
_0202EED0:
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #0x4b
	blo _0202EEC4
	mov r0, #0x4b
	bx lr
	nop
_0202EEE0: .word 0x0000060C
	thumb_func_end sub_0202EEC0

	thumb_func_start sub_0202EEE4
sub_0202EEE4: ; 0x0202EEE4
	push {r3, r4}
	ldr r3, _0202EF14 ; =0x0000060C
	mov r4, #0
_0202EEEA:
	add r2, r0, r4
	ldrb r2, [r2, r3]
	cmp r1, r2
	bne _0202EEF8
	add r0, r4, #0
	pop {r3, r4}
	bx lr
_0202EEF8:
	cmp r2, #0xff
	bne _0202EF02
	mov r0, #0xff
	pop {r3, r4}
	bx lr
_0202EF02:
	add r2, r4, #1
	lsl r2, r2, #0x18
	lsr r4, r2, #0x18
	cmp r4, #0x4b
	blo _0202EEEA
	mov r0, #0xff
	pop {r3, r4}
	bx lr
	nop
_0202EF14: .word 0x0000060C
	thumb_func_end sub_0202EEE4

	thumb_func_start sub_0202EF18
sub_0202EF18: ; 0x0202EF18
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x4b
	blo _0202EF28
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_0202EF28:
	bl sub_0202EEE4
	cmp r0, #0xff
	bne _0202EF3C
	add r0, r5, #0
	bl sub_0202EEC0
	add r1, r5, r0
	ldr r0, _0202EF40 ; =0x0000060C
	strb r4, [r1, r0]
_0202EF3C:
	pop {r3, r4, r5, pc}
	nop
_0202EF40: .word 0x0000060C
	thumb_func_end sub_0202EF18

	thumb_func_start sub_0202EF44
sub_0202EF44: ; 0x0202EF44
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl sub_0202EEC0
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl AllocFromHeap
	add r6, r0, #0
	ldr r0, _0202EF6C ; =0x0000060C
	add r1, r6, #0
	add r0, r5, r0
	add r2, r4, #0
	bl MIi_CpuCopy8
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_0202EF6C: .word 0x0000060C
	thumb_func_end sub_0202EF44

	thumb_func_start sub_0202EF70
sub_0202EF70: ; 0x0202EF70
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0202EF98 ; =0x0000060C
	add r6, r1, #0
	add r4, r2, #0
	add r0, r5, r0
	mov r1, #0xff
	mov r2, #0x4b
	bl MIi_CpuFill8
	cmp r4, #0x4b
	blo _0202EF8A
	mov r4, #0x4b
_0202EF8A:
	ldr r1, _0202EF98 ; =0x0000060C
	add r0, r6, #0
	add r1, r5, r1
	add r2, r4, #0
	bl MIi_CpuCopy8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202EF98: .word 0x0000060C
	thumb_func_end sub_0202EF70

	thumb_func_start sub_0202EF9C
sub_0202EF9C: ; 0x0202EF9C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0202EFB4 ; =0x0000060C
	mov r1, #0xff
	add r0, r4, r0
	mov r2, #0x4b
	bl MIi_CpuFill8
	ldr r0, _0202EFB4 ; =0x0000060C
	mov r1, #0
	strb r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_0202EFB4: .word 0x0000060C
	thumb_func_end sub_0202EF9C

	thumb_func_start sub_0202EFB8
sub_0202EFB8: ; 0x0202EFB8
	ldr r1, _0202EFC0 ; =0x000004B8
	add r0, r0, r1
	bx lr
	nop
_0202EFC0: .word 0x000004B8
	thumb_func_end sub_0202EFB8

	thumb_func_start sub_0202EFC4
sub_0202EFC4: ; 0x0202EFC4
	ldrh r2, [r0]
	mov r1, #1
	bic r2, r1
	strh r2, [r0]
	ldrh r2, [r0]
	mov r1, #2
	bic r2, r1
	strh r2, [r0]
	ldrh r2, [r0]
	mov r1, #0xfc
	bic r2, r1
	mov r1, #4
	orr r1, r2
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202EFC4

	thumb_func_start sub_0202EFE8
sub_0202EFE8: ; 0x0202EFE8
	push {r4, r5, r6, lr}
	mov r2, #0x55
	mov r1, #0
	lsl r2, r2, #2
	add r6, r0, #0
	bl MIi_CpuFill8
	mov r4, #0
	add r5, r6, #0
_0202EFFA:
	add r0, r5, #0
	bl sub_0202EFC4
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x4b
	blt _0202EFFA
	ldr r1, _0202F018 ; =0x00000146
	mov r0, #0x7f
	ldrb r2, [r6, r1]
	bic r2, r0
	mov r0, #7
	orr r0, r2
	strb r0, [r6, r1]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202F018: .word 0x00000146
	thumb_func_end sub_0202EFE8

	thumb_func_start sub_0202F01C
sub_0202F01C: ; 0x0202F01C
	push {r4, r5, r6, lr}
	cmp r1, #0xd
	blo _0202F028
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_0202F028:
	ldr r2, _0202F04C ; =0x0000014E
	lsr r6, r1, #0x1f
	lsl r5, r1, #0x1d
	add r4, r0, r2
	lsl r0, r1, #0x15
	lsr r3, r0, #0x18
	sub r5, r5, r6
	mov r1, #0x1d
	ror r5, r1
	add r1, r6, r5
	lsl r1, r1, #0x18
	ldrb r2, [r4, r3]
	mov r0, #1
	lsr r1, r1, #0x18
	lsl r0, r1
	orr r0, r2
	strb r0, [r4, r3]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202F04C: .word 0x0000014E
	thumb_func_end sub_0202F01C

	thumb_func_start sub_0202F050
sub_0202F050: ; 0x0202F050
	push {r3, r4, r5, lr}
	cmp r1, #0xd
	blo _0202F05C
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_0202F05C:
	lsr r4, r1, #0x1f
	lsl r3, r1, #0x1d
	sub r3, r3, r4
	mov r2, #0x1d
	ror r3, r2
	mov r5, #1
	add r2, r4, r3
	add r3, r5, #0
	lsl r3, r2
	lsl r2, r3, #0x18
	ldr r3, _0202F088 ; =0x0000014E
	lsr r2, r2, #0x18
	add r4, r0, r3
	lsl r0, r1, #0x15
	lsr r3, r0, #0x18
	ldrb r0, [r4, r3]
	add r1, r2, #0
	tst r1, r0
	beq _0202F086
	eor r0, r2
	strb r0, [r4, r3]
_0202F086:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202F088: .word 0x0000014E
	thumb_func_end sub_0202F050

	thumb_func_start sub_0202F08C
sub_0202F08C: ; 0x0202F08C
	push {r3, lr}
	cmp r1, #0xd
	blo _0202F09A
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_0202F09A:
	lsl r2, r1, #0x15
	lsr r2, r2, #0x18
	add r2, r0, r2
	ldr r0, _0202F0C0 ; =0x0000014E
	ldrb r3, [r2, r0]
	lsr r2, r1, #0x1f
	lsl r1, r1, #0x1d
	sub r1, r1, r2
	mov r0, #0x1d
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r3, #0
	asr r1, r0
	mov r0, #1
	and r0, r1
	pop {r3, pc}
	nop
_0202F0C0: .word 0x0000014E
	thumb_func_end sub_0202F08C

	thumb_func_start sub_0202F0C4
sub_0202F0C4: ; 0x0202F0C4
	push {r4, lr}
	cmp r1, #0x4b
	blo _0202F0D0
	bl GF_AssertFail
	pop {r4, pc}
_0202F0D0:
	lsl r3, r1, #2
	ldrh r1, [r0, r3]
	mov r4, #1
	lsl r2, r2, #0x10
	bic r1, r4
	lsr r4, r2, #0x10
	mov r2, #1
	and r2, r4
	orr r1, r2
	strh r1, [r0, r3]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202F0C4

	thumb_func_start sub_0202F0E8
sub_0202F0E8: ; 0x0202F0E8
	push {r3, lr}
	cmp r1, #0x4b
	blo _0202F0F6
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_0202F0F6:
	lsl r1, r1, #2
	ldrh r0, [r0, r1]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	pop {r3, pc}
	thumb_func_end sub_0202F0E8

	thumb_func_start sub_0202F100
sub_0202F100: ; 0x0202F100
	push {r3, lr}
	cmp r1, #0x4b
	blo _0202F10C
	bl GF_AssertFail
	pop {r3, pc}
_0202F10C:
	lsl r1, r1, #2
	add r3, r0, r1
	strh r2, [r3, #2]
	cmp r2, #0
	ldrh r1, [r3]
	bne _0202F120
	mov r0, #2
	bic r1, r0
	strh r1, [r3]
	pop {r3, pc}
_0202F120:
	mov r0, #2
	orr r0, r1
	strh r0, [r3]
	pop {r3, pc}
	thumb_func_end sub_0202F100

	thumb_func_start sub_0202F128
sub_0202F128: ; 0x0202F128
	push {r3, lr}
	cmp r1, #0x4b
	blo _0202F136
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_0202F136:
	lsl r2, r1, #2
	ldrh r1, [r0, r2]
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x1f
	beq _0202F146
	add r0, r0, r2
	ldrh r0, [r0, #2]
	pop {r3, pc}
_0202F146:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202F128

	thumb_func_start sub_0202F14C
sub_0202F14C: ; 0x0202F14C
	cmp r1, #1
	beq _0202F15A
	cmp r1, #2
	beq _0202F162
	cmp r1, #3
	beq _0202F178
	b _0202F18C
_0202F15A:
	mov r1, #5
	lsl r1, r1, #6
	str r2, [r0, r1]
	b _0202F18C
_0202F162:
	mov r1, #5
	lsl r1, r1, #6
	ldr r3, [r0, r1]
	add r2, r3, r2
	str r2, [r0, r1]
	ldr r3, [r0, r1]
	ldr r2, _0202F194 ; =0x000F423F
	cmp r3, r2
	bls _0202F18C
	str r2, [r0, r1]
	b _0202F18C
_0202F178:
	mov r1, #5
	lsl r1, r1, #6
	ldr r3, [r0, r1]
	cmp r3, r2
	bhs _0202F188
	mov r2, #0
	str r2, [r0, r1]
	b _0202F18C
_0202F188:
	sub r2, r3, r2
	str r2, [r0, r1]
_0202F18C:
	mov r1, #5
	lsl r1, r1, #6
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_0202F194: .word 0x000F423F
	thumb_func_end sub_0202F14C

	thumb_func_start sub_0202F198
sub_0202F198: ; 0x0202F198
	push {r3, r4}
	cmp r1, #9
	bhs _0202F1AE
	mov r2, #0x51
	lsl r2, r2, #2
	ldrh r4, [r0, r2]
	mov r3, #1
	lsl r3, r1
	add r1, r4, #0
	orr r1, r3
	strh r1, [r0, r2]
_0202F1AE:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202F198

	thumb_func_start sub_0202F1B4
sub_0202F1B4: ; 0x0202F1B4
	mov r2, #0x51
	lsl r2, r2, #2
	ldrh r0, [r0, r2]
	add r2, r0, #0
	asr r2, r1
	mov r0, #1
	and r0, r2
	bx lr
	thumb_func_end sub_0202F1B4

	thumb_func_start sub_0202F1C4
sub_0202F1C4: ; 0x0202F1C4
	push {r3, r4, r5, r6}
	ldr r3, _0202F1F0 ; =0x0000012E
	mov r5, #0
	add r6, r0, #0
_0202F1CC:
	ldrh r4, [r6, r3]
	cmp r4, #0
	bne _0202F1E4
	lsl r3, r5, #2
	add r3, r0, r3
	mov r0, #0x4b
	lsl r0, r0, #2
	strh r1, [r3, r0]
	add r0, r0, #2
	strh r2, [r3, r0]
	pop {r3, r4, r5, r6}
	bx lr
_0202F1E4:
	add r5, r5, #1
	add r6, r6, #4
	cmp r5, #5
	blt _0202F1CC
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_0202F1F0: .word 0x0000012E
	thumb_func_end sub_0202F1C4

	thumb_func_start sub_0202F1F4
sub_0202F1F4: ; 0x0202F1F4
	push {r4, r5, r6, r7}
	mov r3, #0x13
	lsl r3, r3, #4
	mov r1, #0
	add r2, r0, #0
	sub r4, r3, #4
	add r5, r3, #2
	sub r6, r3, #2
_0202F204:
	ldrh r7, [r2, r3]
	add r1, r1, #1
	strh r7, [r2, r4]
	ldrh r7, [r2, r5]
	strh r7, [r2, r6]
	add r2, r2, #4
	cmp r1, #4
	blt _0202F204
	mov r1, #0x4f
	mov r2, #0
	lsl r1, r1, #2
	strh r2, [r0, r1]
	add r1, r1, #2
	strh r2, [r0, r1]
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end sub_0202F1F4

	thumb_func_start sub_0202F224
sub_0202F224: ; 0x0202F224
	cmp r1, #5
	blo _0202F22E
	mov r0, #0
	strh r0, [r2]
	bx lr
_0202F22E:
	lsl r1, r1, #2
	add r3, r0, r1
	mov r0, #0x4b
	lsl r0, r0, #2
	ldrh r1, [r3, r0]
	add r0, r0, #2
	strh r1, [r2]
	ldrh r0, [r3, r0]
	bx lr
	thumb_func_end sub_0202F224

	thumb_func_start sub_0202F240
sub_0202F240: ; 0x0202F240
	ldr r1, _0202F250 ; =0x0000013E
	ldrh r0, [r0, r1]
	cmp r0, #0
	beq _0202F24C
	mov r0, #1
	bx lr
_0202F24C:
	mov r0, #0
	bx lr
	.balign 4, 0
_0202F250: .word 0x0000013E
	thumb_func_end sub_0202F240

	thumb_func_start sub_0202F254
sub_0202F254: ; 0x0202F254
	push {r3, r4}
	ldr r4, _0202F270 ; =0x00000146
	lsl r1, r1, #0x18
	ldrb r2, [r0, r4]
	lsr r1, r1, #0x18
	mov r3, #0x80
	lsl r1, r1, #0x1f
	bic r2, r3
	lsr r1, r1, #0x18
	orr r1, r2
	strb r1, [r0, r4]
	pop {r3, r4}
	bx lr
	nop
_0202F270: .word 0x00000146
	thumb_func_end sub_0202F254

	thumb_func_start sub_0202F274
sub_0202F274: ; 0x0202F274
	ldr r1, _0202F280 ; =0x00000146
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bx lr
	nop
_0202F280: .word 0x00000146
	thumb_func_end sub_0202F274

	thumb_func_start sub_0202F284
sub_0202F284: ; 0x0202F284
	ldr r1, _0202F290 ; =0x00000146
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	bx lr
	nop
_0202F290: .word 0x00000146
	thumb_func_end sub_0202F284

	thumb_func_start sub_0202F294
sub_0202F294: ; 0x0202F294
	push {r3, r4, r5, lr}
	ldr r2, _0202F2FC ; =0x00000146
	add r5, r0, #0
	ldrb r3, [r5, r2]
	add r4, r1, #0
	mov r1, #0x80
	bic r3, r1
	strb r3, [r5, r2]
	mov r1, #0x10
	mov r2, #0
	bl sub_0202F100
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl sub_0202F0C4
	cmp r4, #0
	ble _0202F2DA
	ldr r2, _0202F2FC ; =0x00000146
	ldrb r0, [r5, r2]
	lsl r1, r0, #0x19
	lsr r3, r1, #0x19
	cmp r3, r4
	blt _0202F2DA
	mov r1, #0x7f
	bic r0, r1
	sub r1, r3, r4
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	mov r1, #0x7f
	and r1, r3
	orr r0, r1
	strb r0, [r5, r2]
	pop {r3, r4, r5, pc}
_0202F2DA:
	bl LCRandom
	mov r1, #6
	bl _s32_div_f
	ldr r3, _0202F2FC ; =0x00000146
	add r1, r1, #1
	ldrb r0, [r5, r3]
	mov r2, #0x7f
	lsl r1, r1, #0x18
	bic r0, r2
	lsr r2, r1, #0x18
	mov r1, #0x7f
	and r1, r2
	orr r0, r1
	strb r0, [r5, r3]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202F2FC: .word 0x00000146
	thumb_func_end sub_0202F294

	thumb_func_start sub_0202F300
sub_0202F300: ; 0x0202F300
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x52
	lsl r0, r0, #2
	add r6, r1, #0
	add r4, r2, #0
	add r0, r5, r0
	mov r1, #0
	mov r2, #6
	bl MIi_CpuFill8
	cmp r6, #0
	bne _0202F322
	ldr r0, _0202F33C ; =0x00000147
	mov r1, #0
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_0202F322:
	cmp r4, #6
	blo _0202F328
	mov r4, #6
_0202F328:
	mov r1, #0x52
	lsl r1, r1, #2
	add r0, r6, #0
	add r1, r5, r1
	add r2, r4, #0
	bl MIi_CpuCopy8
	ldr r0, _0202F33C ; =0x00000147
	strb r4, [r5, r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202F33C: .word 0x00000147
	thumb_func_end sub_0202F300

	thumb_func_start sub_0202F340
sub_0202F340: ; 0x0202F340
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, _0202F36C ; =0x00000147
	add r0, r2, #0
	ldrb r1, [r5, r1]
	bl AllocFromHeap
	mov r2, #0x52
	add r6, r0, #0
	lsl r2, r2, #2
	add r0, r5, r2
	sub r2, r2, #1
	ldrb r2, [r5, r2]
	add r1, r6, #0
	bl MIi_CpuCopy8
	ldr r0, _0202F36C ; =0x00000147
	ldrb r0, [r5, r0]
	strb r0, [r4]
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202F36C: .word 0x00000147
	thumb_func_end sub_0202F340

	thumb_func_start sub_0202F370
sub_0202F370: ; 0x0202F370
	ldrh r1, [r0]
	cmp r1, #0
	beq _0202F37E
	mov r0, #0x87
	lsl r0, r0, #2
	cmp r1, r0
	blo _0202F382
_0202F37E:
	mov r0, #0
	bx lr
_0202F382:
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202F370

	thumb_func_start sub_0202F388
sub_0202F388: ; 0x0202F388
	push {r3, r4}
	mov r1, #0
	strh r1, [r0]
	ldrh r3, [r0, #2]
	mov r2, #0xf
	bic r3, r2
	mov r2, #0xf
	orr r2, r3
	strh r2, [r0, #2]
	ldrh r3, [r0, #2]
	mov r2, #0xf0
	bic r3, r2
	mov r2, #0xf0
	orr r3, r2
	strh r3, [r0, #2]
	ldrh r4, [r0, #2]
	ldr r3, _0202F3D0 ; =0xFFFFF0FF
	and r4, r3
	lsl r3, r2, #4
	orr r3, r4
	strh r3, [r0, #2]
	ldrh r4, [r0, #2]
	ldr r3, _0202F3D4 ; =0xFFFF0FFF
	lsl r2, r2, #8
	and r3, r4
	orr r2, r3
	strh r2, [r0, #2]
	ldr r2, _0202F3D8 ; =0x0000FFFF
_0202F3C0:
	add r1, r1, #1
	strh r2, [r0, #4]
	add r0, r0, #2
	cmp r1, #4
	blt _0202F3C0
	pop {r3, r4}
	bx lr
	nop
_0202F3D0: .word 0xFFFFF0FF
_0202F3D4: .word 0xFFFF0FFF
_0202F3D8: .word 0x0000FFFF
	thumb_func_end sub_0202F388

	thumb_func_start sub_0202F3DC
sub_0202F3DC: ; 0x0202F3DC
	push {r4, r5}
	mov r4, #0
	ldr r1, _0202F3FC ; =0x0000FFFF
	str r4, [r0]
	add r5, r0, #0
	mov r3, #0xf
_0202F3E8:
	add r2, r0, r4
	strb r3, [r2, #4]
	strh r1, [r5, #8]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #4
	blt _0202F3E8
	pop {r4, r5}
	bx lr
	nop
_0202F3FC: .word 0x0000FFFF
	thumb_func_end sub_0202F3DC

	thumb_func_start sub_0202F400
sub_0202F400: ; 0x0202F400
	push {r3, r4}
	ldr r1, _0202F430 ; =0x0000FFFF
	mov r3, #0
	add r4, r0, #0
_0202F408:
	add r2, r0, r3
	ldrb r2, [r2, #4]
	cmp r2, #0xf
	bne _0202F416
	ldrh r2, [r4, #8]
	cmp r2, r1
	beq _0202F41C
_0202F416:
	mov r0, #1
	pop {r3, r4}
	bx lr
_0202F41C:
	add r3, r3, #1
	add r4, r4, #2
	cmp r3, #4
	blt _0202F408
	mov r1, #0
	str r1, [r0]
	add r0, r1, #0
	pop {r3, r4}
	bx lr
	nop
_0202F430: .word 0x0000FFFF
	thumb_func_end sub_0202F400

	thumb_func_start sub_0202F434
sub_0202F434: ; 0x0202F434
	push {r3, r4}
	ldr r2, [r0]
	strh r2, [r1]
	ldrh r3, [r1, #2]
	ldrb r4, [r0, #4]
	mov r2, #0xf
	bic r3, r2
	mov r2, #0xf
	and r4, r2
	lsl r4, r4, #0x10
	lsr r4, r4, #0x10
	and r4, r2
	orr r3, r4
	strh r3, [r1, #2]
	ldrh r3, [r1, #2]
	mov r4, #0xf0
	bic r3, r4
	ldrb r4, [r0, #5]
	and r4, r2
	lsl r4, r4, #0x10
	lsr r4, r4, #0x10
	lsl r4, r4, #0x1c
	lsr r4, r4, #0x18
	orr r3, r4
	strh r3, [r1, #2]
	ldrh r4, [r1, #2]
	ldr r3, _0202F4A8 ; =0xFFFFF0FF
	and r3, r4
	ldrb r4, [r0, #6]
	and r4, r2
	lsl r4, r4, #0x10
	lsr r4, r4, #0x10
	lsl r4, r4, #0x1c
	lsr r4, r4, #0x14
	orr r3, r4
	strh r3, [r1, #2]
	ldrh r4, [r1, #2]
	ldr r3, _0202F4AC ; =0xFFFF0FFF
	and r3, r4
	ldrb r4, [r0, #7]
	and r2, r4
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x10
	orr r2, r3
	strh r2, [r1, #2]
	mov r3, #0
_0202F494:
	ldrh r2, [r0, #8]
	add r3, r3, #1
	add r0, r0, #2
	strh r2, [r1, #4]
	add r1, r1, #2
	cmp r3, #4
	blt _0202F494
	pop {r3, r4}
	bx lr
	nop
_0202F4A8: .word 0xFFFFF0FF
_0202F4AC: .word 0xFFFF0FFF
	thumb_func_end sub_0202F434

	thumb_func_start sub_0202F4B0
sub_0202F4B0: ; 0x0202F4B0
	ldrh r2, [r0]
	mov r3, #0
	str r2, [r1]
	ldrh r2, [r0, #2]
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x1c
	strb r2, [r1, #4]
	ldrh r2, [r0, #2]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1c
	strb r2, [r1, #5]
	ldrh r2, [r0, #2]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x1c
	strb r2, [r1, #6]
	ldrh r2, [r0, #2]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x1c
	strb r2, [r1, #7]
_0202F4D6:
	ldrh r2, [r0, #4]
	add r3, r3, #1
	add r0, r0, #2
	strh r2, [r1, #8]
	add r1, r1, #2
	cmp r3, #4
	blt _0202F4D6
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202F4B0

	thumb_func_start sub_0202F4E8
sub_0202F4E8: ; 0x0202F4E8
	push {r3, lr}
	cmp r1, #0x64
	blo _0202F4F2
	mov r0, #0
	pop {r3, pc}
_0202F4F2:
	mov r2, #0xc
	mul r2, r1
	add r0, r0, r2
	bl sub_0202F370
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202F4E8

	thumb_func_start sub_0202F500
sub_0202F500: ; 0x0202F500
	push {r3, lr}
	cmp r1, #0x64
	bhs _0202F510
	mov r2, #0xc
	mul r2, r1
	add r0, r0, r2
	bl sub_0202F388
_0202F510:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202F500

	thumb_func_start sub_0202F514
sub_0202F514: ; 0x0202F514
	push {r3, r4, r5, lr}
	add r4, r0, #0
	cmp r2, #0x64
	blo _0202F526
	add r0, r1, #0
	bl sub_0202F3DC
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202F526:
	mov r0, #0xc
	add r5, r2, #0
	mul r5, r0
	add r0, r4, r5
	bl sub_0202F4B0
	add r0, r4, r5
	bl sub_0202F370
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202F514

	thumb_func_start sub_0202F53C
sub_0202F53C: ; 0x0202F53C
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	cmp r4, #0x64
	blo _0202F54C
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202F54C:
	cmp r3, #0
	bne _0202F562
	mov r0, #0xc
	mul r0, r4
	add r0, r5, r0
	bl sub_0202F370
	cmp r0, #1
	bne _0202F562
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202F562:
	mov r1, #0xc
	mul r1, r4
	add r0, r6, #0
	add r1, r5, r1
	bl sub_0202F434
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202F53C

	thumb_func_start sub_0202F574
sub_0202F574: ; 0x0202F574
	ldr r0, _0202F578 ; =0x000005FC
	bx lr
	.balign 4, 0
_0202F578: .word 0x000005FC
	thumb_func_end sub_0202F574

	thumb_func_start sub_0202F57C
sub_0202F57C: ; 0x0202F57C
	ldr r3, _0202F584 ; =SavArray_get
	mov r1, #0x23
	bx r3
	nop
_0202F584: .word SavArray_get
	thumb_func_end sub_0202F57C

	thumb_func_start sub_0202F588
sub_0202F588: ; 0x0202F588
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r6, #0xba
	str r0, [sp]
	add r5, r0, #0
	add r7, r4, #0
	lsl r6, r6, #2
_0202F596:
	mov r2, #0xba
	add r0, r5, #0
	add r1, r7, #0
	lsl r2, r2, #2
	bl MIi_CpuFill8
	add r4, r4, #1
	add r5, r5, r6
	cmp r4, #2
	blt _0202F596
	mov r1, #0x5d
	ldr r0, [sp]
	lsl r1, r1, #4
	add r0, r0, r1
	bl sub_0202FA08
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202F588

	thumb_func_start sub_0202F5B8
sub_0202F5B8: ; 0x0202F5B8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, r1, #0
	mov r1, #0xa
	mov r6, #0
	bl _u32_div_f
	mov r0, #6
	ldr r2, _0202F5F4 ; =0x020F6888
	mul r0, r1
	add r4, r2, r0
	add r5, r7, #0
_0202F5D0:
	ldrb r1, [r4]
	add r0, r5, #0
	bl sub_0202F9E8
	add r6, r6, #1
	add r4, r4, #1
	add r5, #0x7a
	cmp r6, #6
	blt _0202F5D0
	mov r0, #0xb7
	lsl r0, r0, #2
	add r0, r7, r0
	mov r1, #0
	mov r2, #0xc
	bl MIi_CpuFill8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202F5F4: .word 0x020F6888
	thumb_func_end sub_0202F5B8

	thumb_func_start sub_0202F5F8
sub_0202F5F8: ; 0x0202F5F8
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #2
	blt _0202F606
	bl GF_AssertFail
	mov r1, #0
_0202F606:
	ldr r3, _0202F61C ; =0x000005F9
	lsl r1, r1, #0x18
	ldrb r0, [r4, r3]
	lsr r1, r1, #0x18
	mov r2, #0xc0
	lsl r1, r1, #0x1e
	bic r0, r2
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r4, r3]
	pop {r4, pc}
	.balign 4, 0
_0202F61C: .word 0x000005F9
	thumb_func_end sub_0202F5F8

	thumb_func_start sub_0202F620
sub_0202F620: ; 0x0202F620
	ldr r1, _0202F62C ; =0x000005F9
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	bx lr
	nop
_0202F62C: .word 0x000005F9
	thumb_func_end sub_0202F620

	thumb_func_start sub_0202F630
sub_0202F630: ; 0x0202F630
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #3
	bne _0202F640
	ldr r0, _0202F654 ; =0x000005F9
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x1e
_0202F640:
	cmp r1, #2
	blt _0202F64A
	bl GF_AssertFail
	mov r1, #0
_0202F64A:
	mov r0, #0xba
	lsl r0, r0, #2
	mul r0, r1
	add r0, r4, r0
	pop {r4, pc}
	.balign 4, 0
_0202F654: .word 0x000005F9
	thumb_func_end sub_0202F630

	thumb_func_start sub_0202F658
sub_0202F658: ; 0x0202F658
	push {r4, lr}
	add r4, r2, #0
	cmp r1, #2
	blt _0202F66C
	bl GF_AssertFail
	add r0, r4, #0
	bl sub_0202F9CC
	pop {r4, pc}
_0202F66C:
	mov r2, #0xba
	add r3, r1, #0
	lsl r2, r2, #2
	mul r3, r2
	add r0, r0, r3
	add r1, r4, #0
	bl MIi_CpuCopy8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202F658

	thumb_func_start sub_0202F680
sub_0202F680: ; 0x0202F680
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #2
	blt _0202F68E
	bl GF_AssertFail
	pop {r4, pc}
_0202F68E:
	add r0, r2, #0
	mov r2, #0xba
	lsl r2, r2, #2
	add r3, r1, #0
	mul r3, r2
	add r1, r4, r3
	bl MIi_CpuCopy8
	pop {r4, pc}
	thumb_func_end sub_0202F680

	thumb_func_start sub_0202F6A0
sub_0202F6A0: ; 0x0202F6A0
	ldr r2, _0202F6A8 ; =0x000005F8
	strb r1, [r0, r2]
	bx lr
	nop
_0202F6A8: .word 0x000005F8
	thumb_func_end sub_0202F6A0

	thumb_func_start sub_0202F6AC
sub_0202F6AC: ; 0x0202F6AC
	ldr r1, _0202F6B4 ; =0x000005F8
	ldrb r0, [r0, r1]
	bx lr
	nop
_0202F6B4: .word 0x000005F8
	thumb_func_end sub_0202F6AC

	thumb_func_start sub_0202F6B8
sub_0202F6B8: ; 0x0202F6B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r1, #0
	str r0, [sp]
	cmp r7, #0
	ble _0202F71C
	mov r4, #0
	add r0, sp, #8
	add r1, r4, #0
	mov r2, #6
	bl MIi_CpuFill8
	add r0, r4, #0
	ldr r5, [sp]
	str r0, [sp, #4]
_0202F6D6:
	ldrb r6, [r5]
	lsl r2, r4, #0x18
	add r1, sp, #8
	add r0, r6, #0
	lsr r2, r2, #0x18
	bl sub_0202FA3C
	cmp r0, #0
	bne _0202F710
	ldr r0, [sp]
	mov r1, #0xb7
	add r0, r0, r6
	lsl r1, r1, #2
	ldrb r1, [r0, r1]
	add r1, r7, r1
	cmp r1, #0xff
	bge _0202F702
	mov r1, #0xb7
	lsl r1, r1, #2
	ldrb r1, [r0, r1]
	add r2, r1, r7
	b _0202F704
_0202F702:
	mov r2, #0xff
_0202F704:
	mov r1, #0xb7
	lsl r1, r1, #2
	strb r2, [r0, r1]
	add r0, sp, #8
	strb r6, [r0, r4]
	add r4, r4, #1
_0202F710:
	ldr r0, [sp, #4]
	add r5, #0x7a
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #6
	blt _0202F6D6
_0202F71C:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202F6B8

	thumb_func_start sub_0202F720
sub_0202F720: ; 0x0202F720
	ldr r1, _0202F72C ; =0x000005F9
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	bx lr
	nop
_0202F72C: .word 0x000005F9
	thumb_func_end sub_0202F720

	thumb_func_start sub_0202F730
sub_0202F730: ; 0x0202F730
	push {r4, lr}
	ldr r2, _0202F750 ; =0x000005F9
	add r4, r0, #0
	ldrb r2, [r4, r2]
	lsl r2, r2, #0x1a
	lsr r2, r2, #0x1a
	add r1, r2, r1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_0202F754
	ldr r0, _0202F750 ; =0x000005F9
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	pop {r4, pc}
	.balign 4, 0
_0202F750: .word 0x000005F9
	thumb_func_end sub_0202F730

	thumb_func_start sub_0202F754
sub_0202F754: ; 0x0202F754
	push {r3, r4}
	cmp r1, #4
	bls _0202F76C
	ldr r2, _0202F780 ; =0x000005F9
	mov r1, #0x3f
	ldrb r3, [r0, r2]
	bic r3, r1
	mov r1, #4
	orr r1, r3
	strb r1, [r0, r2]
	pop {r3, r4}
	bx lr
_0202F76C:
	ldr r3, _0202F780 ; =0x000005F9
	mov r2, #0x3f
	ldrb r4, [r0, r3]
	bic r4, r2
	mov r2, #0x3f
	and r1, r2
	orr r1, r4
	strb r1, [r0, r3]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0202F780: .word 0x000005F9
	thumb_func_end sub_0202F754

	thumb_func_start sub_0202F784
sub_0202F784: ; 0x0202F784
	ldrh r2, [r1]
	ldrb r3, [r1, #2]
	mov r1, #0x3c
	mul r1, r2
	add r2, r3, r1
	ldr r1, _0202F794 ; =0x000005FA
	strh r2, [r0, r1]
	bx lr
	.balign 4, 0
_0202F794: .word 0x000005FA
	thumb_func_end sub_0202F784

	thumb_func_start sub_0202F798
sub_0202F798: ; 0x0202F798
	push {r4, r5}
	ldrb r5, [r1, #2]
	ldrh r1, [r1]
	mov r4, #0x3c
	add r3, r1, #0
	mul r3, r4
	add r1, r5, r3
	ldr r3, _0202F7D0 ; =0x000005FA
	lsl r1, r1, #0x10
	ldrh r0, [r0, r3]
	lsr r1, r1, #0x10
	sub r3, r1, r0
	add r0, r2, #0
	mul r0, r4
	cmp r3, r0
	blt _0202F7BE
	mov r0, #1
	pop {r4, r5}
	bx lr
_0202F7BE:
	ldr r0, _0202F7D4 ; =0x0000EA5F
	cmp r1, r0
	blo _0202F7CA
	mov r0, #2
	pop {r4, r5}
	bx lr
_0202F7CA:
	mov r0, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
_0202F7D0: .word 0x000005FA
_0202F7D4: .word 0x0000EA5F
	thumb_func_end sub_0202F798

	thumb_func_start sub_0202F7D8
sub_0202F7D8: ; 0x0202F7D8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x5d
	lsl r0, r0, #4
	add r5, r1, #0
	add r4, r6, r0
	add r0, r5, #0
	add r7, r2, #0
	bl PlayerProfile_GetTrainerID
	str r0, [r4, #0x14]
	add r0, r5, #0
	bl PlayerProfile_GetTrainerGender
	strb r0, [r4, #0x11]
	add r0, r5, #0
	bl sub_02029088
	strb r0, [r4, #0x12]
	add r0, r5, #0
	bl sub_0202907C
	strb r0, [r4, #0x13]
	mov r0, #0x10
	add r1, r7, #0
	bl String_ctor
	add r7, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl sub_02028F58
	add r1, r4, #0
	add r0, r7, #0
	add r1, #0x18
	mov r2, #0x10
	bl CopyStringToU16Array
	add r0, r7, #0
	bl String_dtor
	mov r0, #1
	strb r0, [r4, #0x10]
	bl GF_RTC_DateTimeToSec
	mov r2, #0x5d
	lsl r2, r2, #4
	str r0, [r6, r2]
	str r1, [r4, #4]
	bl OS_GetOwnerRtcOffset
	str r0, [r4, #8]
	str r1, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202F7D8

	thumb_func_start sub_0202F844
sub_0202F844: ; 0x0202F844
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x5d
	lsl r1, r1, #4
	add r5, r0, r1
	ldr r1, [r5, #0x14]
	add r0, r4, #0
	bl sub_02028F80
	ldrb r1, [r5, #0x11]
	add r0, r4, #0
	bl sub_02028F90
	ldrb r1, [r5, #0x12]
	add r0, r4, #0
	bl sub_0202908C
	ldrb r1, [r5, #0x13]
	add r0, r4, #0
	bl sub_02029080
	add r5, #0x18
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02028F24
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202F844

	thumb_func_start sub_0202F87C
sub_0202F87C: ; 0x0202F87C
	ldr r1, _0202F884 ; =0x000005E1
	ldrb r0, [r0, r1]
	bx lr
	nop
_0202F884: .word 0x000005E1
	thumb_func_end sub_0202F87C

	thumb_func_start sub_0202F888
sub_0202F888: ; 0x0202F888
	mov r1, #0x5e
	lsl r1, r1, #4
	ldrb r0, [r0, r1]
	bx lr
	thumb_func_end sub_0202F888

	thumb_func_start sub_0202F890
sub_0202F890: ; 0x0202F890
	push {r4, lr}
	mov r1, #0x5d
	lsl r1, r1, #4
	add r4, r0, r1
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	beq _0202F8CE
	bl GF_RTC_DateTimeToSec
	ldr r3, [r4]
	ldr r2, [r4, #4]
	sub r3, r0, r3
	sbc r1, r2
	mov r2, #0
	ldr r0, _0202F8D0 ; =0x00015180
	sub r0, r0, r3
	sbc r2, r1
	bge _0202F8BA
	mov r0, #0
	strb r0, [r4, #0x10]
	pop {r4, pc}
_0202F8BA:
	bl OS_GetOwnerRtcOffset
	ldr r3, [r4, #8]
	ldr r2, [r4, #0xc]
	eor r0, r3
	eor r1, r2
	orr r0, r1
	beq _0202F8CE
	mov r0, #0
	strb r0, [r4, #0x10]
_0202F8CE:
	pop {r4, pc}
	.balign 4, 0
_0202F8D0: .word 0x00015180
	thumb_func_end sub_0202F890

	thumb_func_start sub_0202F8D4
sub_0202F8D4: ; 0x0202F8D4
	push {r4, r5, r6}
	sub sp, #0x7c
	mov r4, #0x7a
	add r3, r1, #0
	mul r3, r4
	add r1, r0, r3
	add r6, r1, #0
	add r5, sp, #0
_0202F8E4:
	ldrb r3, [r6]
	add r6, r6, #1
	strb r3, [r5]
	add r5, r5, #1
	sub r4, r4, #1
	bne _0202F8E4
	mov r3, #0x7a
	add r4, r2, #0
	mul r4, r3
	add r4, r0, r4
	add r2, r4, #0
_0202F8FA:
	ldrb r0, [r2]
	add r2, r2, #1
	strb r0, [r1]
	add r1, r1, #1
	sub r3, r3, #1
	bne _0202F8FA
	add r2, sp, #0
	mov r1, #0x7a
_0202F90A:
	ldrb r0, [r2]
	add r2, r2, #1
	strb r0, [r4]
	add r4, r4, #1
	sub r1, r1, #1
	bne _0202F90A
	add sp, #0x7c
	pop {r4, r5, r6}
	bx lr
	thumb_func_end sub_0202F8D4

	thumb_func_start sub_0202F91C
sub_0202F91C: ; 0x0202F91C
	mov r3, #0x7a
	mul r3, r1
	add r0, r0, r3
	lsl r1, r2, #0x18
	ldr r3, _0202F92C ; =sub_0202F9E8
	lsr r1, r1, #0x18
	bx r3
	nop
_0202F92C: .word sub_0202F9E8
	thumb_func_end sub_0202F91C

	thumb_func_start sub_0202F930
sub_0202F930: ; 0x0202F930
	push {r3, lr}
	cmp r1, #6
	blt _0202F93C
	bl GF_AssertFail
	pop {r3, pc}
_0202F93C:
	mov r3, #0x7a
	mul r3, r1
	add r3, r0, r3
	ldrb r1, [r3, #1]
	cmp r1, #0x1e
	blo _0202F94E
	bl GF_AssertFail
	pop {r3, pc}
_0202F94E:
	add r0, r1, #1
	strb r0, [r3, #1]
	lsl r0, r1, #2
	add r1, r3, r0
	ldrb r0, [r2]
	strb r0, [r1, #2]
	ldrb r0, [r2, #1]
	strb r0, [r1, #3]
	ldrb r0, [r2, #2]
	strb r0, [r1, #4]
	ldrb r0, [r2, #3]
	strb r0, [r1, #5]
	pop {r3, pc}
	thumb_func_end sub_0202F930

	thumb_func_start sub_0202F968
sub_0202F968: ; 0x0202F968
	push {r4, lr}
	cmp r1, #6
	blt _0202F974
	bl GF_AssertFail
	pop {r4, pc}
_0202F974:
	mov r3, #0x7a
	mul r3, r1
	add r0, r0, r3
	ldrb r1, [r0, #1]
	cmp r2, r1
	blo _0202F986
	bl GF_AssertFail
	pop {r4, pc}
_0202F986:
	sub r1, r1, #1
	strb r1, [r0, #1]
	ldrb r4, [r0, #1]
	cmp r2, r4
	bne _0202F99C
	add r1, r0, #2
	lsl r0, r2, #2
	add r0, r1, r0
	bl sub_0202F9FC
	pop {r4, pc}
_0202F99C:
	cmp r2, r4
	bge _0202F9BE
	lsl r1, r2, #2
	add r3, r0, r1
_0202F9A4:
	ldrb r1, [r3, #6]
	add r2, r2, #1
	strb r1, [r3, #2]
	ldrb r1, [r3, #7]
	strb r1, [r3, #3]
	ldrb r1, [r3, #8]
	strb r1, [r3, #4]
	ldrb r1, [r3, #9]
	strb r1, [r3, #5]
	ldrb r4, [r0, #1]
	add r3, r3, #4
	cmp r2, r4
	blt _0202F9A4
_0202F9BE:
	add r1, r0, #2
	lsl r0, r4, #2
	add r0, r1, r0
	bl sub_0202F9FC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202F968

	thumb_func_start sub_0202F9CC
sub_0202F9CC: ; 0x0202F9CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0202F9D2:
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0202F9E8
	add r4, r4, #1
	add r5, #0x7a
	cmp r4, #6
	blt _0202F9D2
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202F9CC

	thumb_func_start sub_0202F9E8
sub_0202F9E8: ; 0x0202F9E8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0
	mov r2, #0x7a
	add r5, r0, #0
	bl MIi_CpuFill8
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202F9E8

	thumb_func_start sub_0202F9FC
sub_0202F9FC: ; 0x0202F9FC
	ldr r3, _0202FA04 ; =MIi_CpuFill8
	mov r1, #0
	mov r2, #4
	bx r3
	.balign 4, 0
_0202FA04: .word MIi_CpuFill8
	thumb_func_end sub_0202F9FC

	thumb_func_start sub_0202FA08
sub_0202FA08: ; 0x0202FA08
	push {r4, lr}
	mov r1, #0
	mov r2, #0x28
	add r4, r0, #0
	bl MIi_CpuFill8
	mov r0, #0
	str r0, [r4, #0x14]
	strb r0, [r4, #0x11]
	ldr r0, _0202FA34 ; =gGameLanguage
	mov r1, #8
	ldrb r0, [r0]
	strb r0, [r4, #0x12]
	ldr r0, _0202FA38 ; =gGameVersion
	ldrb r0, [r0]
	strb r0, [r4, #0x13]
	add r4, #0x18
	add r0, r4, #0
	bl StringFillEOS
	pop {r4, pc}
	nop
_0202FA34: .word gGameLanguage
_0202FA38: .word gGameVersion
	thumb_func_end sub_0202FA08

	thumb_func_start sub_0202FA3C
sub_0202FA3C: ; 0x0202FA3C
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	ble _0202FA56
_0202FA44:
	ldrb r3, [r1, r4]
	cmp r0, r3
	bne _0202FA50
	mov r0, #1
	pop {r3, r4}
	bx lr
_0202FA50:
	add r4, r4, #1
	cmp r4, r2
	blt _0202FA44
_0202FA56:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end sub_0202FA3C

	thumb_func_start sub_0202FA5C
sub_0202FA5C: ; 0x0202FA5C
	ldr r0, _0202FA60 ; =0x00001294
	bx lr
	.balign 4, 0
_0202FA60: .word 0x00001294
	thumb_func_end sub_0202FA5C

	thumb_func_start sub_0202FA64
sub_0202FA64: ; 0x0202FA64
	ldr r3, _0202FA6C ; =SavArray_get
	mov r1, #0x24
	bx r3
	nop
_0202FA6C: .word SavArray_get
	thumb_func_end sub_0202FA64

	thumb_func_start sub_0202FA70
sub_0202FA70: ; 0x0202FA70
	push {r3, r4, r5, lr}
	mov r4, #0
	str r4, [r0]
	add r5, r0, #4
_0202FA78:
	add r0, r5, #0
	bl sub_0202FB98
	add r4, r4, #1
	add r5, #0x84
	cmp r4, #0x24
	blt _0202FA78
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202FA70

	thumb_func_start sub_0202FA88
sub_0202FA88: ; 0x0202FA88
	push {r4, r5, r6, lr}
	mov r5, #0
	add r4, r0, #4
	mov r6, #0x84
_0202FA90:
	add r0, r5, #0
	mul r0, r6
	add r0, r4, r0
	bl sub_0202FBBC
	cmp r0, #0
	bne _0202FAA2
	add r0, r5, #0
	pop {r4, r5, r6, pc}
_0202FAA2:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0x24
	blo _0202FA90
	mov r0, #0xff
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202FA88

	thumb_func_start sub_0202FAB0
sub_0202FAB0: ; 0x0202FAB0
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	add r5, r4, #0
	add r6, r0, #4
	mov r7, #0x84
_0202FABA:
	add r0, r4, #0
	mul r0, r7
	add r0, r6, r0
	bl sub_0202FBBC
	cmp r0, #0
	beq _0202FACE
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_0202FACE:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0x24
	blo _0202FABA
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202FAB0

	thumb_func_start sub_0202FADC
sub_0202FADC: ; 0x0202FADC
	push {r3, lr}
	cmp r1, #0x24
	bhs _0202FAEE
	add r2, r0, #4
	mov r0, #0x84
	mul r0, r1
	add r0, r2, r0
	bl sub_0202FB98
_0202FAEE:
	pop {r3, pc}
	thumb_func_end sub_0202FADC

	thumb_func_start sub_0202FAF0
sub_0202FAF0: ; 0x0202FAF0
	push {r4, lr}
	add r3, r0, #0
	cmp r2, #0x24
	blo _0202FAFC
	mov r0, #0
	pop {r4, pc}
_0202FAFC:
	add r0, r1, #0
	add r4, r3, #4
	mov r3, #0x84
	add r1, r2, #0
	mul r1, r3
	add r1, r4, r1
	add r2, r3, #0
	bl MIi_CpuCopy8
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202FAF0

	thumb_func_start sub_0202FB14
sub_0202FB14: ; 0x0202FB14
	push {r4, lr}
	cmp r2, #0x24
	blo _0202FB24
	add r0, r1, #0
	bl sub_0202FB98
	mov r0, #0
	pop {r4, pc}
_0202FB24:
	add r4, r0, #4
	mov r3, #0x84
	add r0, r2, #0
	mul r0, r3
	add r0, r4, r0
	add r2, r3, #0
	bl MIi_CpuCopy8
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_0202FB14

	thumb_func_start sub_0202FB38
sub_0202FB38: ; 0x0202FB38
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r6, r1, #0
	bl sub_0202FAB0
	add r5, r0, #0
	mov r1, #0x84
	mul r5, r1
	add r0, r6, #0
	add r1, r5, #0
	bl AllocFromHeap
	mov r1, #0
	add r2, r5, #0
	str r0, [sp]
	bl MIi_CpuFill8
	mov r7, #0
	add r5, r7, #0
	add r4, r4, #4
_0202FB60:
	mov r0, #0x84
	add r6, r5, #0
	mul r6, r0
	add r0, r4, r6
	bl sub_0202FBBC
	cmp r0, #0
	beq _0202FB88
	add r1, r7, #0
	mov r2, #0x84
	add r0, r7, #1
	mul r2, r1
	ldr r1, [sp]
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r1, r1, r2
	add r0, r4, r6
	mov r2, #0x84
	bl MIi_CpuCopy8
_0202FB88:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0x24
	blo _0202FB60
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202FB38

	thumb_func_start sub_0202FB98
sub_0202FB98: ; 0x0202FB98
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x84
	bl MIi_CpuFill8
	add r0, r4, #0
	add r0, #8
	mov r1, #8
	bl StringFillEOS
	add r4, #0x18
	add r0, r4, #0
	mov r1, #0xc
	bl StringFillEOS
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202FB98

	thumb_func_start sub_0202FBBC
sub_0202FBBC: ; 0x0202FBBC
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _0202FBC6
	mov r0, #1
	bx lr
_0202FBC6:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202FBBC

	thumb_func_start sub_0202FBCC
sub_0202FBCC: ; 0x0202FBCC
	ldr r0, _0202FBD0 ; =0x00001D50
	bx lr
	.balign 4, 0
_0202FBD0: .word 0x00001D50
	thumb_func_end sub_0202FBCC

	thumb_func_start sub_0202FBD4
sub_0202FBD4: ; 0x0202FBD4
	push {r4, lr}
	add r4, r0, #0
	ldr r2, _0202FBEC ; =0x00001D50
	mov r0, #0
	add r1, r4, #0
	bl sub_020D47EC
	mov r0, #0
	mvn r0, r0
	str r0, [r4]
	pop {r4, pc}
	nop
_0202FBEC: .word 0x00001D50
	thumb_func_end sub_0202FBD4

	thumb_func_start sub_0202FBF0
sub_0202FBF0: ; 0x0202FBF0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0202FC20 ; =0x021D2AF8
	add r4, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	cmp r0, #0
	beq _0202FC0A
	bl FreeToHeap
	ldr r0, _0202FC20 ; =0x021D2AF8
	mov r1, #0
	str r1, [r0]
_0202FC0A:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0
	bl sub_0202711C
	ldr r1, _0202FC20 ; =0x021D2AF8
	str r0, [r1]
	bl sub_0202FBD4
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202FC20: .word 0x021D2AF8
	thumb_func_end sub_0202FBF0

	thumb_func_start sub_0202FC24
sub_0202FC24: ; 0x0202FC24
	push {r3, lr}
	ldr r0, _0202FC44 ; =0x021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _0202FC32
	bl GF_AssertFail
_0202FC32:
	ldr r0, _0202FC44 ; =0x021D2AF8
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _0202FC44 ; =0x021D2AF8
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	nop
_0202FC44: .word 0x021D2AF8
	thumb_func_end sub_0202FC24

	thumb_func_start sub_0202FC48
sub_0202FC48: ; 0x0202FC48
	ldr r0, _0202FC58 ; =0x021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	beq _0202FC54
	mov r0, #1
	bx lr
_0202FC54:
	mov r0, #0
	bx lr
	.balign 4, 0
_0202FC58: .word 0x021D2AF8
	thumb_func_end sub_0202FC48

	thumb_func_start sub_0202FC5C
sub_0202FC5C: ; 0x0202FC5C
	push {r3, lr}
	ldr r0, _0202FC70 ; =0x021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _0202FC6A
	bl GF_AssertFail
_0202FC6A:
	ldr r0, _0202FC70 ; =0x021D2AF8
	ldr r0, [r0]
	pop {r3, pc}
	.balign 4, 0
_0202FC70: .word 0x021D2AF8
	thumb_func_end sub_0202FC5C

	thumb_func_start sub_0202FC74
sub_0202FC74: ; 0x0202FC74
	push {r3, lr}
	ldr r0, _0202FC8C ; =0x021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _0202FC82
	bl GF_AssertFail
_0202FC82:
	ldr r0, _0202FC8C ; =0x021D2AF8
	ldr r0, [r0]
	add r0, r0, #4
	pop {r3, pc}
	nop
_0202FC8C: .word 0x021D2AF8
	thumb_func_end sub_0202FC74

	thumb_func_start sub_0202FC90
sub_0202FC90: ; 0x0202FC90
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0202FD1C ; =0x021D2AF8
	add r7, r1, #0
	ldr r0, [r0]
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #0
	beq _0202FCAC
	bl FreeToHeap
	ldr r0, _0202FD1C ; =0x021D2AF8
	mov r1, #0
	str r1, [r0]
_0202FCAC:
	ldr r3, [sp, #0x18]
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	bl sub_0202711C
	ldr r1, _0202FD1C ; =0x021D2AF8
	str r0, [r1]
	ldr r1, [r4]
	cmp r1, #1
	beq _0202FCCA
	mov r0, #3
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202FCCA:
	ldr r1, _0202FD20 ; =0x00001C64
	add r0, #0xe8
	ldrh r2, [r0, r1]
	ldr r3, _0202FD24 ; =0x0000FFFF
	eor r3, r2
	lsl r3, r3, #0x10
	add r2, r2, r3
	bl sub_02030258
	ldr r1, _0202FD1C ; =0x021D2AF8
	add r0, r5, #0
	ldr r1, [r1]
	bl sub_02030154
	cmp r0, #1
	bne _0202FCF2
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202FCF2:
	ldr r1, _0202FD1C ; =0x021D2AF8
	add r0, r5, #0
	ldr r1, [r1]
	bl sub_0203018C
	cmp r0, #0
	bne _0202FD08
	mov r0, #2
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202FD08:
	cmp r6, #0
	beq _0202FD14
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020304F0
_0202FD14:
	mov r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202FD1C: .word 0x021D2AF8
_0202FD20: .word 0x00001C64
_0202FD24: .word 0x0000FFFF
	thumb_func_end sub_0202FC90

	thumb_func_start sub_0202FD28
sub_0202FD28: ; 0x0202FD28
	push {r4, r5, r6, lr}
	add r5, r2, #0
	add r6, r0, #0
	bl sub_0202711C
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #1
	beq _0202FD46
	mov r1, #3
	str r1, [r5]
	bl FreeToHeap
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202FD46:
	ldr r1, _0202FD9C ; =0x00001C64
	add r0, #0xe8
	ldrh r2, [r0, r1]
	ldr r3, _0202FDA0 ; =0x0000FFFF
	eor r3, r2
	lsl r3, r3, #0x10
	add r2, r2, r3
	bl sub_02030258
	add r0, r6, #0
	add r1, r4, #0
	bl sub_02030154
	cmp r0, #1
	bne _0202FD72
	mov r0, #0
	str r0, [r5]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202FD72:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0203018C
	cmp r0, #0
	bne _0202FD8C
	mov r0, #2
	str r0, [r5]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202FD8C:
	mov r0, #1
	str r0, [r5]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0202FD9C: .word 0x00001C64
_0202FDA0: .word 0x0000FFFF
	thumb_func_end sub_0202FD28

	thumb_func_start sub_0202FDA4
sub_0202FDA4: ; 0x0202FDA4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r3, #0
	add r6, r1, #0
	ldrh r1, [r4]
	add r5, r0, #0
	add r7, r2, #0
	cmp r1, #0
	beq _0202FDBA
	cmp r1, #1
	beq _0202FDF2
	b _0202FE10
_0202FDBA:
	mov r0, #8
	bl sub_0201A728
	mov r0, #0xb
	bl sub_0201A748
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02027134
	add r6, r0, #0
	cmp r6, #2
	bne _0202FDE8
	add r0, r5, #0
	mov r1, #2
	bl sub_02027550
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202FDE8:
	mov r0, #8
	bl sub_0201A738
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202FDF2:
	bl sub_02027564
	add r5, r0, #0
	sub r0, r5, #2
	cmp r0, #1
	bhi _0202FE0C
	mov r0, #0
	strh r0, [r4]
	bl sub_0201A774
	mov r0, #8
	bl sub_0201A738
_0202FE0C:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202FE10:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202FDA4

	thumb_func_start sub_0202FE14
sub_0202FE14: ; 0x0202FE14
	push {r3, r4, r5, r6, r7, lr}
	ldr r6, [sp, #0x18]
	mov ip, r1
	add r1, r2, #0
	ldrh r2, [r6]
	add r7, r0, #0
	cmp r2, #0
	beq _0202FE2A
	cmp r2, #1
	beq _0202FE90
	b _0202FE9E
_0202FE2A:
	ldr r2, _0202FEA4 ; =0x021D2AF8
	ldr r4, [r2]
	cmp r4, #0
	bne _0202FE36
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0202FE36:
	add r5, r4, #0
	add r4, #0xe8
	add r5, #0x84
	str r1, [sp]
	add r1, r5, #0
	add r2, r4, #0
	mov r3, ip
	bl sub_0202FF08
	add r0, r5, #0
	ldr r1, _0202FEA8 ; =0x0000E281
	add r0, #0x48
	strh r1, [r0]
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #0x58
	bl sub_020275C4
	add r5, #0x60
	strh r0, [r5]
	ldr r0, _0202FEA8 ; =0x0000E281
	ldr r2, _0202FEAC ; =0x00001C62
	add r1, r4, #0
	strh r0, [r4, r2]
	add r0, r7, #0
	add r2, r2, #2
	bl sub_020275C4
	ldr r1, _0202FEB0 ; =0x00001C64
	ldr r3, _0202FEB4 ; =0x0000FFFF
	strh r0, [r4, r1]
	ldrh r2, [r4, r1]
	add r0, r4, #0
	eor r3, r2
	lsl r3, r3, #0x10
	add r2, r2, r3
	bl sub_02030250
	ldr r0, [sp, #0x1c]
	mov r1, #0
	strh r1, [r0]
	ldrh r0, [r6]
	add r0, r0, #1
	strh r0, [r6]
	b _0202FE9E
_0202FE90:
	ldr r1, _0202FEA4 ; =0x021D2AF8
	add r2, r3, #0
	ldr r1, [r1]
	ldr r3, [sp, #0x1c]
	bl sub_0202FDA4
	pop {r3, r4, r5, r6, r7, pc}
_0202FE9E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202FEA4: .word 0x021D2AF8
_0202FEA8: .word 0x0000E281
_0202FEAC: .word 0x00001C62
_0202FEB0: .word 0x00001C64
_0202FEB4: .word 0x0000FFFF
	thumb_func_end sub_0202FE14

	thumb_func_start sub_0202FEB8
sub_0202FEB8: ; 0x0202FEB8
	cmp r0, #0x1a
	bgt _0202FEE6
	bge _0202FEF2
	add r3, r0, #0
	sub r3, #0xe
	cmp r3, #9
	bhi _0202FEFC
	add r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_0202FED2: ; jump table
	.short _0202FEF2 - _0202FED2 - 2 ; case 0
	.short _0202FEFC - _0202FED2 - 2 ; case 1
	.short _0202FEFC - _0202FED2 - 2 ; case 2
	.short _0202FEF2 - _0202FED2 - 2 ; case 3
	.short _0202FEFC - _0202FED2 - 2 ; case 4
	.short _0202FEFC - _0202FED2 - 2 ; case 5
	.short _0202FEF2 - _0202FED2 - 2 ; case 6
	.short _0202FEFC - _0202FED2 - 2 ; case 7
	.short _0202FEFC - _0202FED2 - 2 ; case 8
	.short _0202FEF2 - _0202FED2 - 2 ; case 9
_0202FEE6:
	cmp r0, #0x1d
	bgt _0202FEEE
	beq _0202FEF2
	b _0202FEFC
_0202FEEE:
	cmp r0, #0x20
	bne _0202FEFC
_0202FEF2:
	mov r0, #4
	str r0, [r1]
	mov r0, #3
	str r0, [r2]
	bx lr
_0202FEFC:
	mov r0, #2
	str r0, [r1]
	mov r0, #6
	str r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202FEB8

	thumb_func_start sub_0202FF08
sub_0202FF08: ; 0x0202FF08
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r3, [sp, #8]
	add r7, r1, #0
	str r2, [sp, #4]
	ldr r3, _02030148 ; =0x020F68C8
	str r0, [sp]
	add r2, sp, #0x1c
	mov r1, #8
_0202FF1A:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0202FF1A
	ldr r1, _0203014C ; =0x020F68C4
	add r0, sp, #0x18
	ldrb r2, [r1]
	strb r2, [r0]
	ldrb r2, [r1, #1]
	strb r2, [r0, #1]
	ldrb r2, [r1, #2]
	ldrb r1, [r1, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	add r0, r7, #0
	mov r1, #0
	mov r2, #0x64
	bl MIi_CpuFill8
	ldr r0, [sp, #8]
	add r1, sp, #0x28
	add r2, sp, #0x24
	bl sub_0202FEB8
	ldr r0, [sp, #4]
	mov r2, #0
	ldr r3, [r0]
	mov r0, #4
	tst r0, r3
	beq _0202FF74
	mov r1, #0x80
	add r0, r3, #0
	tst r0, r1
	beq _0202FF6C
	ldr r0, [sp, #4]
	add r1, #0xc4
	ldrh r0, [r0, r1]
	lsl r4, r0, #1
	b _0202FF76
_0202FF6C:
	ldr r0, [sp, #4]
	add r1, #0xc4
	ldrh r4, [r0, r1]
	b _0202FF76
_0202FF74:
	add r4, r2, #0
_0202FF76:
	ldr r5, [sp, #0x28]
	mov r0, #0
	mov ip, r0
	cmp r5, #0
	ble _0203004E
	add r0, sp, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	lsl r1, r4, #2
	add r0, r0, r1
	str r0, [sp, #0x10]
	mov r0, #1
	and r0, r4
	add r3, r7, #0
	str r0, [sp, #0xc]
_0202FF94:
	ldr r0, [sp, #4]
	mov r1, #8
	ldr r0, [r0]
	add r6, r0, #0
	and r6, r1
	beq _0202FFD6
	mov r4, #0x80
	add r1, r0, #0
	tst r1, r4
	bne _0202FFD6
	mov r6, #0
	cmp r5, #0
	ble _0202FFF6
	ldr r1, [sp, #0x10]
	add r4, #0xb4
	ldr r1, [r1, r4]
	ldr r0, [sp, #4]
	lsl r1, r1, #0x1f
	lsr r4, r1, #0x1d
	add r1, sp, #0x1c
	add r4, r1, r4
	mov r1, ip
	ldrb r1, [r1, r4]
_0202FFC2:
	mov r4, #0x4d
	lsl r4, r4, #2
	ldr r4, [r0, r4]
	cmp r4, r1
	beq _0202FFF6
	add r6, r6, #1
	add r0, r0, #4
	cmp r6, r5
	blt _0202FFC2
	b _0202FFF6
_0202FFD6:
	cmp r6, #0
	beq _0202FFE6
	mov r1, #0x80
	tst r0, r1
	beq _0202FFE6
	ldr r0, [sp, #0x14]
	ldrb r6, [r0]
	b _0202FFF6
_0202FFE6:
	ldr r0, [sp, #0xc]
	mov r6, ip
	cmp r0, #0
	beq _0202FFF6
	mov r0, ip
	mov r1, #1
	add r6, r0, #0
	eor r6, r1
_0202FFF6:
	ldr r0, [sp, #0x24]
	mov r5, #0
	cmp r0, #0
	ble _0203003C
	ldr r1, _02030150 ; =0x00001154
	ldr r0, [sp, #4]
	add r1, r0, r1
	mov r0, #0xa9
	lsl r0, r0, #2
	mul r0, r6
	add r4, r1, r0
_0203000C:
	ldr r0, [r4, #0x2c]
	lsl r0, r0, #1
	lsr r0, r0, #0x1f
	bne _0203002E
	ldrh r0, [r4, #4]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	bne _0203002E
	ldrh r0, [r4, #6]
	strh r0, [r3]
	add r0, r4, #0
	add r0, #0x30
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x1b
	add r0, r7, r2
	strb r1, [r0, #0x18]
_0203002E:
	ldr r0, [sp, #0x24]
	add r5, r5, #1
	add r3, r3, #2
	add r2, r2, #1
	add r4, #0x70
	cmp r5, r0
	blt _0203000C
_0203003C:
	ldr r0, [sp, #0x14]
	ldr r5, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x14]
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	cmp r0, r5
	blt _0202FF94
_0203004E:
	ldr r0, [sp, #8]
	cmp r0, #0xd
	bhi _02030124
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02030060: ; jump table
	.short _02030124 - _02030060 - 2 ; case 0
	.short _0203007C - _02030060 - 2 ; case 1
	.short _02030098 - _02030060 - 2 ; case 2
	.short _020300B4 - _02030060 - 2 ; case 3
	.short _020300D0 - _02030060 - 2 ; case 4
	.short _020300EC - _02030060 - 2 ; case 5
	.short _02030108 - _02030060 - 2 ; case 6
	.short _02030124 - _02030060 - 2 ; case 7
	.short _0203007C - _02030060 - 2 ; case 8
	.short _02030098 - _02030060 - 2 ; case 9
	.short _020300B4 - _02030060 - 2 ; case 10
	.short _020300D0 - _02030060 - 2 ; case 11
	.short _020300EC - _02030060 - 2 ; case 12
	.short _02030108 - _02030060 - 2 ; case 13
_0203007C:
	ldr r0, [sp]
	mov r1, #0
	bl sub_020291E8
	add r3, r7, #0
	add r3, #0x28
	mov r2, #0x10
_0203008A:
	ldrh r1, [r0]
	add r0, r0, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _0203008A
	b _0203013A
_02030098:
	ldr r0, [sp]
	mov r1, #1
	bl sub_020291E8
	add r3, r7, #0
	add r3, #0x28
	mov r2, #0x10
_020300A6:
	ldrh r1, [r0]
	add r0, r0, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _020300A6
	b _0203013A
_020300B4:
	ldr r0, [sp]
	mov r1, #2
	bl sub_020291E8
	add r3, r7, #0
	add r3, #0x28
	mov r2, #0x10
_020300C2:
	ldrh r1, [r0]
	add r0, r0, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _020300C2
	b _0203013A
_020300D0:
	ldr r0, [sp]
	mov r1, #3
	bl sub_020291E8
	add r3, r7, #0
	add r3, #0x28
	mov r2, #0x10
_020300DE:
	ldrh r1, [r0]
	add r0, r0, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _020300DE
	b _0203013A
_020300EC:
	ldr r0, [sp]
	mov r1, #4
	bl sub_020291E8
	add r3, r7, #0
	add r3, #0x28
	mov r2, #0x10
_020300FA:
	ldrh r1, [r0]
	add r0, r0, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _020300FA
	b _0203013A
_02030108:
	ldr r0, [sp]
	mov r1, #5
	bl sub_020291E8
	add r3, r7, #0
	add r3, #0x28
	mov r2, #0x10
_02030116:
	ldrh r1, [r0]
	add r0, r0, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _02030116
	b _0203013A
_02030124:
	bl sub_0202925C
	add r3, r7, #0
	add r3, #0x28
	mov r2, #0x10
_0203012E:
	ldrh r1, [r0]
	add r0, r0, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _0203012E
_0203013A:
	ldr r0, [sp, #0x40]
	strh r0, [r7, #0x24]
	ldr r0, [sp, #8]
	add r7, #0x26
	strb r0, [r7]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02030148: .word 0x020F68C8
_0203014C: .word 0x020F68C4
_02030150: .word 0x00001154
	thumb_func_end sub_0202FF08

	thumb_func_start sub_02030154
sub_02030154: ; 0x02030154
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r1, #0
	add r4, #0xe8
	add r5, #0x84
	bl sub_020274E8
	cmp r0, #0
	bne _0203016A
	mov r0, #1
	pop {r3, r4, r5, pc}
_0203016A:
	ldr r0, _02030184 ; =0x00001C62
	ldrh r1, [r4, r0]
	ldr r0, _02030188 ; =0x0000E281
	cmp r1, r0
	bne _0203017C
	add r5, #0x48
	ldrh r1, [r5]
	cmp r1, r0
	beq _02030180
_0203017C:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02030180:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02030184: .word 0x00001C62
_02030188: .word 0x0000E281
	thumb_func_end sub_02030154

	thumb_func_start sub_0203018C
sub_0203018C: ; 0x0203018C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r1, #0
	ldr r1, _0203023C ; =0x00001C62
	add r4, #0xe8
	ldrh r1, [r4, r1]
	ldr r2, _02030240 ; =0x0000E281
	add r6, r0, #0
	add r5, #0x84
	cmp r1, r2
	bne _020301AC
	add r1, r5, #0
	add r1, #0x48
	ldrh r1, [r1]
	cmp r1, r2
	beq _020301B0
_020301AC:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020301B0:
	add r1, r5, #0
	mov r2, #0x58
	bl sub_020275C4
	add r5, #0x60
	ldrh r1, [r5]
	cmp r0, r1
	beq _020301C4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020301C4:
	ldr r2, _02030244 ; =0x00001C64
	add r0, r6, #0
	add r1, r4, #0
	bl sub_020275C4
	ldr r1, _02030244 ; =0x00001C64
	ldrh r1, [r4, r1]
	cmp r0, r1
	beq _020301DA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020301DA:
	mov r0, #0
	mov ip, r0
	ldr r0, _02030248 ; =0x00001154
	add r0, r4, r0
	str r0, [sp]
	ldr r0, _0203024C ; =0x000001D3
	add r7, r0, #0
	add r6, r0, #0
	add r7, #0x45
	add r6, #0x1c
_020301EE:
	ldr r4, [sp]
	mov r2, #0
_020301F2:
	ldrh r1, [r4, #6]
	cmp r1, r6
	bls _020301FC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020301FC:
	ldrh r1, [r4, #8]
	cmp r1, r7
	bls _02030206
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02030206:
	mov r3, #0
	add r5, r4, #0
_0203020A:
	ldrh r1, [r5, #0x1c]
	cmp r1, r0
	bls _02030214
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02030214:
	add r3, r3, #1
	add r5, r5, #2
	cmp r3, #4
	blt _0203020A
	add r2, r2, #1
	add r4, #0x70
	cmp r2, #6
	blt _020301F2
	mov r1, #0xa9
	ldr r2, [sp]
	lsl r1, r1, #2
	add r1, r2, r1
	str r1, [sp]
	mov r1, ip
	add r1, r1, #1
	mov ip, r1
	cmp r1, #4
	blt _020301EE
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203023C: .word 0x00001C62
_02030240: .word 0x0000E281
_02030244: .word 0x00001C64
_02030248: .word 0x00001154
_0203024C: .word 0x000001D3
	thumb_func_end sub_0203018C

	thumb_func_start sub_02030250
sub_02030250: ; 0x02030250
	ldr r3, _02030254 ; =sub_0201FF44
	bx r3
	.balign 4, 0
_02030254: .word sub_0201FF44
	thumb_func_end sub_02030250

	thumb_func_start sub_02030258
sub_02030258: ; 0x02030258
	ldr r3, _0203025C ; =sub_0201FF70
	bx r3
	.balign 4, 0
_0203025C: .word sub_0201FF70
	thumb_func_end sub_02030258

	thumb_func_start sub_02030260
sub_02030260: ; 0x02030260
	ldr r3, _02030278 ; =0x021D2AF8
	ldr r3, [r3]
	cmp r3, #0
	beq _02030274
	lsl r0, r0, #0xa
	add r0, r3, r0
	add r1, r0, r1
	mov r0, #0x8e
	lsl r0, r0, #2
	strb r2, [r1, r0]
_02030274:
	bx lr
	nop
_02030278: .word 0x021D2AF8
	thumb_func_end sub_02030260

	thumb_func_start sub_0203027C
sub_0203027C: ; 0x0203027C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _020302A0 ; =0x021D2AF8
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _0203028E
	bl GF_AssertFail
_0203028E:
	ldr r0, _020302A0 ; =0x021D2AF8
	ldr r1, [r0]
	lsl r0, r5, #0xa
	add r0, r1, r0
	add r1, r0, r4
	mov r0, #0x8e
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020302A0: .word 0x021D2AF8
	thumb_func_end sub_0203027C

	thumb_func_start sub_020302A4
sub_020302A4: ; 0x020302A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, _0203048C ; =0x021D2AF8
	ldr r1, [r0]
	cmp r1, #0
	bne _020302B4
	b _02030488
_020302B4:
	ldr r0, [sp]
	add r7, r1, #0
	ldr r0, [r0]
	add r1, #0xe8
	str r0, [r1]
	ldr r0, [sp]
	add r7, #0xe8
	ldr r0, [r0, #0x14]
	ldr r1, [sp]
	str r0, [r7, #4]
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r2, [r1, r0]
	add r1, r7, #0
	add r1, #0xe8
	str r2, [r1]
	ldr r1, [sp]
	add r2, r0, #4
	ldr r2, [r1, r2]
	add r1, r7, #0
	add r1, #0xec
	str r2, [r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #8
	ldr r2, [r1, r2]
	add r1, r7, #0
	add r1, #0xf0
	str r2, [r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0xc
	ldr r2, [r1, r2]
	add r1, r7, #0
	add r1, #0xf4
	str r2, [r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x10
	ldr r2, [r1, r2]
	add r1, r7, #0
	add r1, #0xf8
	str r2, [r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x14
	ldr r2, [r1, r2]
	add r1, r7, #0
	add r1, #0xfc
	str r2, [r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x18
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x4c
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x1c
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x48
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x24
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x44
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x28
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x40
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x2c
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x3c
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x40
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x28
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x44
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x24
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x48
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x20
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x50
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x1c
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x64
	ldrh r2, [r1, r2]
	add r1, r0, #0
	sub r1, #8
	strh r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x67
	ldrb r2, [r1, r2]
	sub r1, r0, #6
	ldr r4, [sp]
	strh r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x68
	ldr r1, [r1, r2]
	sub r0, r0, #4
	str r1, [r7, r0]
	add r0, r4, #0
	mov r3, #0
	add r5, r7, #0
	str r0, [sp, #8]
	str r7, [sp, #4]
_020303C8:
	ldr r0, [r4, #0x18]
	ldr r2, [sp, #8]
	ldr r6, [sp, #4]
	str r0, [r5, #8]
	mov r0, #6
	add r2, #0x28
	add r6, #0x18
	mov ip, r0
_020303D8:
	ldmia r2!, {r0, r1}
	stmia r6!, {r0, r1}
	mov r0, ip
	sub r0, r0, #1
	mov ip, r0
	bne _020303D8
	ldr r0, [r2]
	mov r1, #0x5f
	lsl r1, r1, #2
	str r0, [r6]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _020303FA
	mov r0, #5
	sub r1, #0x68
	lsl r0, r0, #6
	b _020303FC
_020303FA:
	sub r1, #0x68
_020303FC:
	str r0, [r5, r1]
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r2, [r4, r0]
	add r1, r0, #0
	sub r1, #0x6c
	str r2, [r5, r1]
	ldr r1, [sp]
	add r4, r4, #4
	add r2, r1, r3
	add r1, r0, #0
	add r1, #0x1c
	ldrb r2, [r2, r1]
	add r1, r7, r3
	sub r0, #0x54
	strb r2, [r1, r0]
	ldr r0, [sp, #8]
	add r3, r3, #1
	add r0, #0x34
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r5, r5, #4
	add r0, #0x34
	str r0, [sp, #4]
	cmp r3, #4
	blt _020303C8
	ldr r0, _02030490 ; =0x00001150
	ldr r4, [sp]
	add r0, r7, r0
	str r0, [sp, #0xc]
	ldr r0, _02030494 ; =0x00001BE0
	mov r5, #0
	add r6, r7, r0
_0203043E:
	ldr r0, [r4, #4]
	ldr r1, [sp, #0xc]
	bl sub_020306DC
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	add r1, r6, #0
	bl sub_02028EE4
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02006EFC
	mov r1, #0x53
	add r2, r7, r5
	lsl r1, r1, #2
	strb r0, [r2, r1]
	mov r0, #0xa9
	ldr r1, [sp, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	add r5, r5, #1
	str r0, [sp, #0xc]
	add r4, r4, #4
	add r6, #0x20
	cmp r5, #4
	blt _0203043E
	mov r1, #0x13
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r1, _02030498 ; =0x00001C60
	add r1, r7, r1
	bl sub_0202AC9C
_02030488:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203048C: .word 0x021D2AF8
_02030490: .word 0x00001150
_02030494: .word 0x00001BE0
_02030498: .word 0x00001C60
	thumb_func_end sub_020302A4

	thumb_func_start sub_0203049C
sub_0203049C: ; 0x0203049C
	ldr r2, _020304B0 ; =0x021D2AF8
	ldr r2, [r2]
	cmp r2, #0
	beq _020304AE
	lsl r0, r0, #2
	add r2, r2, r0
	mov r0, #0x7f
	lsl r0, r0, #2
	str r1, [r2, r0]
_020304AE:
	bx lr
	.balign 4, 0
_020304B0: .word 0x021D2AF8
	thumb_func_end sub_0203049C

	thumb_func_start sub_020304B4
sub_020304B4: ; 0x020304B4
	push {r3, r4}
	ldr r0, _020304EC ; =0x021D2AF8
	ldr r4, [r0]
	cmp r4, #0
	bne _020304C4
	mov r0, #1
	pop {r3, r4}
	bx lr
_020304C4:
	mov r0, #0x45
	lsl r0, r0, #2
	add r1, r0, #0
	mov r3, #0
	add r4, #0xe8
	add r1, #0x2c
_020304D0:
	ldr r2, [r4, r0]
	cmp r2, r1
	bls _020304DC
	mov r0, #0
	pop {r3, r4}
	bx lr
_020304DC:
	add r3, r3, #1
	add r4, r4, #4
	cmp r3, #4
	blt _020304D0
	mov r0, #1
	pop {r3, r4}
	bx lr
	nop
_020304EC: .word 0x021D2AF8
	thumb_func_end sub_020304B4

	thumb_func_start sub_020304F0
sub_020304F0: ; 0x020304F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	ldr r0, _020306C8 ; =0x021D2AF8
	str r1, [sp]
	ldr r1, [r0]
	add r0, r1, #0
	str r0, [sp, #0x14]
	add r0, #0xe8
	add r1, #0xe8
	str r0, [sp, #0x14]
	ldr r0, [r1]
	str r0, [r6]
	ldr r0, [sp, #0x14]
	add r0, #0xe8
	ldr r1, [r0]
	mov r0, #0x53
	lsl r0, r0, #2
	str r1, [r6, r0]
	ldr r1, [sp, #0x14]
	add r1, #0xec
	ldr r2, [r1]
	add r1, r0, #4
	str r2, [r6, r1]
	ldr r1, [sp, #0x14]
	add r1, #0xf0
	ldr r2, [r1]
	add r1, r0, #0
	add r1, #8
	str r2, [r6, r1]
	ldr r1, [sp, #0x14]
	add r1, #0xf4
	ldr r2, [r1]
	add r1, r0, #0
	add r1, #0xc
	str r2, [r6, r1]
	ldr r1, [sp, #0x14]
	add r1, #0xf8
	ldr r2, [r1]
	add r1, r0, #0
	add r1, #0x10
	str r2, [r6, r1]
	ldr r1, [sp, #0x14]
	add r1, #0xfc
	ldr r2, [r1]
	add r1, r0, #0
	add r1, #0x14
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x4c
	ldr r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x18
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x48
	ldr r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x1c
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x44
	ldr r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x24
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x40
	ldr r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x28
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x28
	ldr r2, [r1, r2]
	mov r1, #0x10
	orr r2, r1
	add r1, r0, #0
	add r1, #0x40
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x24
	ldr r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x44
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x20
	ldr r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x48
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x1c
	ldr r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x50
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #8
	ldrh r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x64
	strh r2, [r6, r1]
	mov r1, #0
	str r1, [r6, #0x14]
	add r0, #0x2c
	str r1, [r6, r0]
	ldr r0, [sp]
	bl sub_0202A634
	mov r1, #0x11
	lsl r1, r1, #4
	ldr r1, [r6, r1]
	bl sub_020293FC
	ldr r5, [sp, #0x14]
	ldr r1, _020306CC ; =0x00001150
	add r0, r5, #0
	str r0, [sp, #0x10]
	add r0, r0, r1
	str r0, [sp, #8]
	ldr r1, _020306D0 ; =0x00001BE0
	add r0, r5, #0
	add r0, r0, r1
	mov r7, #0
	add r4, r6, #0
	str r6, [sp, #0xc]
	str r0, [sp, #4]
_02030604:
	ldr r0, [r5, #8]
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #0xc]
	str r0, [r4, #0x18]
	mov r0, #6
	add r3, #0x18
	add r2, #0x28
	mov ip, r0
_02030614:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, ip
	sub r0, r0, #1
	mov ip, r0
	bne _02030614
	ldr r0, [r3]
	mov r1, #0x45
	lsl r1, r1, #2
	str r0, [r2]
	add r0, r1, #0
	ldr r2, [r5, r1]
	add r0, #0x68
	str r2, [r4, r0]
	add r0, r1, #0
	add r0, #0x20
	ldr r0, [r5, r0]
	add r1, #0x8c
	str r0, [r4, r1]
	ldr r0, [sp, #8]
	ldr r1, [r4, #4]
	bl sub_02030724
	add r1, r4, #0
	add r1, #0xf8
	ldr r0, [sp, #4]
	ldr r1, [r1]
	bl sub_02028EE4
	ldr r0, [sp, #0x14]
	add r5, r5, #4
	add r1, r0, r7
	mov r0, #0x53
	lsl r0, r0, #2
	ldrb r2, [r1, r0]
	add r1, r6, r7
	add r0, #0x70
	strb r2, [r1, r0]
	ldr r0, [sp, #0x10]
	mov r1, #0xa9
	add r0, #0x34
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	lsl r1, r1, #2
	add r0, #0x34
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r7, r7, #1
	add r0, r0, r1
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r4, r4, #4
	add r0, #0x20
	str r0, [sp, #4]
	cmp r7, #4
	blt _02030604
	ldr r0, [sp]
	bl Sav2_PlayerData_GetOptionsAddr
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r1, [r6, r1]
	bl sub_0202AC9C
	mov r5, #0x13
	lsl r5, r5, #4
	ldr r1, [r6, r5]
	ldr r4, _020306D4 ; =0x00001C60
	ldr r2, [sp, #0x14]
	ldrh r0, [r1]
	ldrh r2, [r2, r4]
	ldr r3, _020306D8 ; =0xFFFF83FF
	lsl r2, r2, #0x11
	lsr r2, r2, #0x1b
	lsl r2, r2, #0x1b
	and r0, r3
	lsr r2, r2, #0x11
	orr r0, r2
	strh r0, [r1]
	ldr r2, [r6, r5]
	ldrh r0, [r2]
	lsl r1, r0, #0x11
	lsr r1, r1, #0x1b
	cmp r1, #0x14
	blo _020306C2
	and r0, r3
	strh r0, [r2]
_020306C2:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020306C8: .word 0x021D2AF8
_020306CC: .word 0x00001150
_020306D0: .word 0x00001BE0
_020306D4: .word 0x00001C60
_020306D8: .word 0xFFFF83FF
	thumb_func_end sub_020304F0

	thumb_func_start sub_020306DC
sub_020306DC: ; 0x020306DC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r2, #0xa9
	add r7, r0, #0
	add r0, r6, #0
	mov r1, #0
	lsl r2, r2, #2
	bl MIi_CpuFill8
	add r0, r7, #0
	bl sub_0207463C
	strh r0, [r6]
	add r0, r7, #0
	bl GetPartyCount
	strh r0, [r6, #2]
	ldrh r0, [r6, #2]
	mov r4, #0
	cmp r0, #0
	ble _02030720
	add r5, r6, #4
_02030708:
	add r0, r7, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r1, r5, #0
	bl sub_02072A98
	ldrh r0, [r6, #2]
	add r4, r4, #1
	add r5, #0x70
	cmp r4, r0
	blt _02030708
_02030720:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020306DC

	thumb_func_start sub_02030724
sub_02030724: ; 0x02030724
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	str r1, [sp]
	mov r1, #0
	add r0, sp, #4
	strb r1, [r0]
	mov r0, #0xb
	bl AllocMonZeroed
	add r4, r0, #0
	ldrh r1, [r7]
	ldr r0, [sp]
	bl sub_020744DC
	ldrh r0, [r7, #2]
	mov r6, #0
	cmp r0, #0
	ble _02030770
	add r5, r7, #4
_0203074C:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02072D64
	add r0, r4, #0
	mov r1, #0xa2
	add r2, sp, #4
	bl sub_0206EC40
	ldr r0, [sp]
	add r1, r4, #0
	bl sub_02074524
	ldrh r0, [r7, #2]
	add r6, r6, #1
	add r5, #0x70
	cmp r6, r0
	blt _0203074C
_02030770:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02030724

	thumb_func_start sub_0203077C
sub_0203077C: ; 0x0203077C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020307A8 ; =0x021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _0203078C
	bl GF_AssertFail
_0203078C:
	add r0, r4, #0
	mov r1, #0x64
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, _020307A8 ; =0x021D2AF8
	add r1, r4, #0
	ldr r0, [r0]
	mov r2, #0x64
	add r0, #0x84
	bl MIi_CpuCopy32
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_020307A8: .word 0x021D2AF8
	thumb_func_end sub_0203077C

	thumb_func_start sub_020307AC
sub_020307AC: ; 0x020307AC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020307D8 ; =0x021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _020307BC
	bl GF_AssertFail
_020307BC:
	add r0, r4, #0
	mov r1, #0x80
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, _020307D8 ; =0x021D2AF8
	add r1, r4, #0
	ldr r0, [r0]
	mov r2, #0x80
	add r0, r0, #4
	bl MIi_CpuCopy32
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_020307D8: .word 0x021D2AF8
	thumb_func_end sub_020307AC

	thumb_func_start sub_020307DC
sub_020307DC: ; 0x020307DC
	push {r3, lr}
	ldr r0, _020307F4 ; =0x021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _020307EA
	bl GF_AssertFail
_020307EA:
	ldr r0, _020307F4 ; =0x021D2AF8
	ldr r0, [r0]
	add r0, r0, #4
	pop {r3, pc}
	nop
_020307F4: .word 0x021D2AF8
	thumb_func_end sub_020307DC

	thumb_func_start sub_020307F8
sub_020307F8: ; 0x020307F8
	push {r3, lr}
	ldr r0, _02030810 ; =0x021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _02030806
	bl GF_AssertFail
_02030806:
	ldr r0, _02030810 ; =0x021D2AF8
	ldr r0, [r0]
	add r0, #0x84
	pop {r3, pc}
	nop
_02030810: .word 0x021D2AF8
	thumb_func_end sub_020307F8

	thumb_func_start sub_02030814
sub_02030814: ; 0x02030814
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0203087C ; =0x021D2AF8
	add r6, r1, #0
	ldr r0, [r0]
	add r7, r2, #0
	add r4, r3, #0
	cmp r0, #0
	bne _0203082A
	bl GF_AssertFail
_0203082A:
	ldr r1, _0203087C ; =0x021D2AF8
	add r0, r6, #0
	ldr r1, [r1]
	mov r2, #0x64
	add r1, #0x84
	bl MIi_CpuCopy8
	ldr r1, _0203087C ; =0x021D2AF8
	ldr r2, _02030880 ; =0x00001C68
	ldr r1, [r1]
	add r0, r7, #0
	add r1, #0xe8
	bl MIi_CpuCopy8
	ldr r1, _0203087C ; =0x021D2AF8
	add r0, r5, #0
	ldr r1, [r1]
	mov r2, #0x80
	add r1, r1, #4
	bl MIi_CpuCopy8
	ldr r0, _0203087C ; =0x021D2AF8
	ldr r1, _02030884 ; =0x00001D4C
	ldr r0, [r0]
	ldr r2, _02030888 ; =0x0000FFFF
	ldrh r3, [r0, r1]
	add r0, #0xe8
	sub r1, #0xe8
	eor r2, r3
	lsl r2, r2, #0x10
	add r2, r3, r2
	bl sub_02030258
	cmp r4, #0
	beq _02030878
	ldr r1, [sp, #0x18]
	add r0, r4, #0
	bl sub_020304F0
_02030878:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203087C: .word 0x021D2AF8
_02030880: .word 0x00001C68
_02030884: .word 0x00001D4C
_02030888: .word 0x0000FFFF
	thumb_func_end sub_02030814

	thumb_func_start sub_0203088C
sub_0203088C: ; 0x0203088C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r2, #0
	cmp r1, #5
	bhi _0203090C
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020308A2: ; jump table
	.short _020308AE - _020308A2 - 2 ; case 0
	.short _020308CA - _020308A2 - 2 ; case 1
	.short _020308DA - _020308A2 - 2 ; case 2
	.short _020308EC - _020308A2 - 2 ; case 3
	.short _020308FE - _020308A2 - 2 ; case 4
	.short _02030904 - _020308A2 - 2 ; case 5
_020308AE:
	cmp r5, #0xc
	blt _020308B6
	bl GF_AssertFail
_020308B6:
	lsl r0, r5, #1
	ldrh r0, [r4, r0]
	ldr r1, _02030918 ; =0x000001ED
	cmp r0, r1
	bls _020308C6
	mov r0, #0
	add r1, r0, #0
	pop {r3, r4, r5, pc}
_020308C6:
	mov r1, #0
	pop {r3, r4, r5, pc}
_020308CA:
	cmp r5, #0xc
	blt _020308D2
	bl GF_AssertFail
_020308D2:
	add r0, r4, r5
	ldrb r0, [r0, #0x18]
	mov r1, #0
	pop {r3, r4, r5, pc}
_020308DA:
	ldrh r1, [r4, #0x24]
	ldr r0, _0203091C ; =0x0000270F
	cmp r1, r0
	bls _020308E6
	mov r1, #0
	pop {r3, r4, r5, pc}
_020308E6:
	add r0, r1, #0
	mov r1, #0
	pop {r3, r4, r5, pc}
_020308EC:
	add r4, #0x26
	ldrb r0, [r4]
	cmp r0, #0x21
	blo _020308FA
	mov r0, #0
	add r1, r0, #0
	pop {r3, r4, r5, pc}
_020308FA:
	mov r1, #0
	pop {r3, r4, r5, pc}
_020308FE:
	ldr r0, [r4, #0x58]
	ldr r1, [r4, #0x5c]
	pop {r3, r4, r5, pc}
_02030904:
	add r4, #0x27
	ldrb r0, [r4]
	mov r1, #0
	pop {r3, r4, r5, pc}
_0203090C:
	bl GF_AssertFail
	mov r0, #0
	add r1, r0, #0
	pop {r3, r4, r5, pc}
	nop
_02030918: .word 0x000001ED
_0203091C: .word 0x0000270F
	thumb_func_end sub_0203088C

	thumb_func_start sub_02030920
sub_02030920: ; 0x02030920
	push {r4, lr}
	mov r1, #0x64
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x64
	add r4, r0, #0
	bl MIi_CpuFill8
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02030920

	thumb_func_start sub_02030938
sub_02030938: ; 0x02030938
	ldr r3, _0203093C ; =FreeToHeap
	bx r3
	.balign 4, 0
_0203093C: .word FreeToHeap
	thumb_func_end sub_02030938

	thumb_func_start sub_02030940
sub_02030940: ; 0x02030940
	ldr r3, _02030948 ; =MIi_CpuFill8
	mov r1, #0
	mov r2, #0x58
	bx r3
	.balign 4, 0
_02030948: .word MIi_CpuFill8
	thumb_func_end sub_02030940

	thumb_func_start sub_0203094C
sub_0203094C: ; 0x0203094C
	push {r3, lr}
	bl sub_0203107C
	mov r1, #0x8e
	lsl r1, r1, #4
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203094C

	thumb_func_start sub_0203095C
sub_0203095C: ; 0x0203095C
	ldrb r0, [r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end sub_0203095C

	thumb_func_start sub_02030964
sub_02030964: ; 0x02030964
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	ldrb r3, [r0]
	mov r2, #0x10
	lsr r1, r1, #0x1b
	bic r3, r2
	orr r1, r3
	strb r1, [r0]
	bx lr
	thumb_func_end sub_02030964

	thumb_func_start sub_02030978
sub_02030978: ; 0x02030978
	push {r3, r4}
	cmp r1, #9
	bhi _02030A1E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0203098A: ; jump table
	.short _0203099E - _0203098A - 2 ; case 0
	.short _020309B2 - _0203098A - 2 ; case 1
	.short _020309C6 - _0203098A - 2 ; case 2
	.short _020309CE - _0203098A - 2 ; case 3
	.short _020309DA - _0203098A - 2 ; case 4
	.short _020309E6 - _0203098A - 2 ; case 5
	.short _020309F2 - _0203098A - 2 ; case 6
	.short _020309FE - _0203098A - 2 ; case 7
	.short _02030A0A - _0203098A - 2 ; case 8
	.short _02030A16 - _0203098A - 2 ; case 9
_0203099E:
	ldrb r4, [r0]
	ldrb r2, [r3]
	mov r1, #1
	bic r4, r1
	mov r1, #1
	and r1, r2
	orr r1, r4
	strb r1, [r0]
	pop {r3, r4}
	bx lr
_020309B2:
	ldrb r2, [r0]
	mov r1, #0xe
	bic r2, r1
	ldrb r1, [r3]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1c
	orr r1, r2
	strb r1, [r0]
	pop {r3, r4}
	bx lr
_020309C6:
	ldrb r1, [r3]
	strb r1, [r0, #1]
	pop {r3, r4}
	bx lr
_020309CE:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #4]
	pop {r3, r4}
	bx lr
_020309DA:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #0x20]
	pop {r3, r4}
	bx lr
_020309E6:
	ldrb r1, [r3]
	add r0, r0, r2
	add r0, #0x28
	strb r1, [r0]
	pop {r3, r4}
	bx lr
_020309F2:
	lsl r1, r2, #2
	ldr r3, [r3]
	add r0, r0, r1
	str r3, [r0, #0x2c]
	pop {r3, r4}
	bx lr
_020309FE:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #0x3c]
	pop {r3, r4}
	bx lr
_02030A0A:
	ldrb r1, [r3]
	add r0, r0, r2
	add r0, #0x44
	strb r1, [r0]
	pop {r3, r4}
	bx lr
_02030A16:
	lsl r1, r2, #2
	ldr r3, [r3]
	add r0, r0, r1
	str r3, [r0, #0x48]
_02030A1E:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02030978

	thumb_func_start sub_02030A24
sub_02030A24: ; 0x02030A24
	cmp r1, #9
	bhi _02030A94
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02030A34: ; jump table
	.short _02030A50 - _02030A34 - 2 ; case 0
	.short _02030A48 - _02030A34 - 2 ; case 1
	.short _02030A58 - _02030A34 - 2 ; case 2
	.short _02030A5C - _02030A34 - 2 ; case 3
	.short _02030A64 - _02030A34 - 2 ; case 4
	.short _02030A6C - _02030A34 - 2 ; case 5
	.short _02030A74 - _02030A34 - 2 ; case 6
	.short _02030A7C - _02030A34 - 2 ; case 7
	.short _02030A84 - _02030A34 - 2 ; case 8
	.short _02030A8C - _02030A34 - 2 ; case 9
_02030A48:
	ldrb r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1d
	bx lr
_02030A50:
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bx lr
_02030A58:
	ldrb r0, [r0, #1]
	bx lr
_02030A5C:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #4]
	bx lr
_02030A64:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x20]
	bx lr
_02030A6C:
	add r0, r0, r2
	add r0, #0x28
	ldrb r0, [r0]
	bx lr
_02030A74:
	lsl r1, r2, #2
	add r0, r0, r1
	ldr r0, [r0, #0x2c]
	bx lr
_02030A7C:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x3c]
	bx lr
_02030A84:
	add r0, r0, r2
	add r0, #0x44
	ldrb r0, [r0]
	bx lr
_02030A8C:
	lsl r1, r2, #2
	add r0, r0, r1
	ldr r0, [r0, #0x48]
	bx lr
_02030A94:
	mov r0, #0
	bx lr
	thumb_func_end sub_02030A24

	thumb_func_start sub_02030A98
sub_02030A98: ; 0x02030A98
	ldr r3, _02030AA0 ; =MIi_CpuFill8
	mov r1, #0
	mov r2, #4
	bx r3
	.balign 4, 0
_02030AA0: .word MIi_CpuFill8
	thumb_func_end sub_02030A98

	thumb_func_start sub_02030AA4
sub_02030AA4: ; 0x02030AA4
	push {r3, r4}
	cmp r1, #0xa
	bne _02030ACE
	ldrb r1, [r3]
	cmp r1, #1
	blo _02030ABE
	mov r1, #1
	ldrb r3, [r0]
	lsl r1, r2
	orr r1, r3
	strb r1, [r0]
	pop {r3, r4}
	bx lr
_02030ABE:
	mov r1, #1
	add r3, r1, #0
	ldrb r4, [r0]
	lsl r3, r2
	mov r1, #0xff
	eor r1, r3
	and r1, r4
	strb r1, [r0]
_02030ACE:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02030AA4

	thumb_func_start sub_02030AD4
sub_02030AD4: ; 0x02030AD4
	cmp r1, #0xa
	bne _02030AE4
	ldrb r0, [r0]
	add r1, r0, #0
	asr r1, r2
	mov r0, #1
	and r0, r1
	bx lr
_02030AE4:
	mov r0, #0
	bx lr
	thumb_func_end sub_02030AD4

	thumb_func_start sub_02030AE8
sub_02030AE8: ; 0x02030AE8
	push {r3, lr}
	bl sub_0203107C
	ldr r1, _02030AF4 ; =0x00001618
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
_02030AF4: .word 0x00001618
	thumb_func_end sub_02030AE8

	thumb_func_start sub_02030AF8
sub_02030AF8: ; 0x02030AF8
	ldr r3, _02030B00 ; =MIi_CpuFill8
	mov r1, #0
	mov r2, #0x54
	bx r3
	.balign 4, 0
_02030B00: .word MIi_CpuFill8
	thumb_func_end sub_02030AF8

	thumb_func_start sub_02030B04
sub_02030B04: ; 0x02030B04
	push {r3, lr}
	bl sub_0203107C
	mov r1, #0x8e
	lsl r1, r1, #4
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02030B04

	thumb_func_start sub_02030B14
sub_02030B14: ; 0x02030B14
	ldrb r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end sub_02030B14

	thumb_func_start sub_02030B1C
sub_02030B1C: ; 0x02030B1C
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	ldrb r3, [r0]
	mov r2, #8
	lsr r1, r1, #0x1c
	bic r3, r2
	orr r1, r3
	strb r1, [r0]
	bx lr
	thumb_func_end sub_02030B1C

	thumb_func_start sub_02030B30
sub_02030B30: ; 0x02030B30
	push {r4, lr}
	ldr r3, [sp, #8]
	cmp r1, #4
	bhi _02030B82
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02030B44: ; jump table
	.short _02030B4E - _02030B44 - 2 ; case 0
	.short _02030B60 - _02030B44 - 2 ; case 1
	.short _02030B66 - _02030B44 - 2 ; case 2
	.short _02030B70 - _02030B44 - 2 ; case 3
	.short _02030B78 - _02030B44 - 2 ; case 4
_02030B4E:
	ldrb r4, [r0]
	ldrb r2, [r3]
	mov r1, #7
	bic r4, r1
	mov r1, #7
	and r1, r2
	orr r1, r4
	strb r1, [r0]
	pop {r4, pc}
_02030B60:
	ldrb r1, [r3]
	strb r1, [r0, #1]
	pop {r4, pc}
_02030B66:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #4]
	pop {r4, pc}
_02030B70:
	ldrb r1, [r3]
	add r0, r0, r2
	strb r1, [r0, #2]
	pop {r4, pc}
_02030B78:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #0x2c]
	pop {r4, pc}
_02030B82:
	bl GF_AssertFail
	pop {r4, pc}
	thumb_func_end sub_02030B30

	thumb_func_start sub_02030B88
sub_02030B88: ; 0x02030B88
	push {r3, lr}
	cmp r1, #4
	bhi _02030BC6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02030B9A: ; jump table
	.short _02030BA4 - _02030B9A - 2 ; case 0
	.short _02030BAC - _02030B9A - 2 ; case 1
	.short _02030BB0 - _02030B9A - 2 ; case 2
	.short _02030BB8 - _02030B9A - 2 ; case 3
	.short _02030BBE - _02030B9A - 2 ; case 4
_02030BA4:
	ldrb r0, [r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	pop {r3, pc}
_02030BAC:
	ldrb r0, [r0, #1]
	pop {r3, pc}
_02030BB0:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #4]
	pop {r3, pc}
_02030BB8:
	add r0, r0, r2
	ldrb r0, [r0, #2]
	pop {r3, pc}
_02030BBE:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x2c]
	pop {r3, pc}
_02030BC6:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02030B88

	thumb_func_start sub_02030BD0
sub_02030BD0: ; 0x02030BD0
	lsl r2, r0, #0x17
	lsr r2, r2, #0x18
	ldrb r3, [r1, r2]
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	add r1, r3, #0
	asr r1, r0
	mov r0, #0xf
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end sub_02030BD0

	thumb_func_start sub_02030BF4
sub_02030BF4: ; 0x02030BF4
	push {r3, r4, r5, r6}
	lsr r5, r0, #0x1f
	lsl r4, r0, #0x1f
	lsl r3, r0, #0x17
	sub r4, r4, r5
	mov r0, #0x1f
	ror r4, r0
	add r0, r5, r4
	lsl r0, r0, #0x18
	lsr r3, r3, #0x18
	lsr r0, r0, #0x18
	bne _02030C14
	add r4, r1, r3
	ldrb r6, [r1, r3]
	mov r5, #0xf0
	b _02030C1A
_02030C14:
	ldrb r6, [r1, r3]
	add r4, r1, r3
	mov r5, #0xf
_02030C1A:
	and r5, r6
	strb r5, [r1, r3]
	lsl r0, r0, #2
	add r1, r2, #0
	lsl r1, r0
	lsl r0, r1, #0x18
	ldrb r3, [r4]
	lsr r0, r0, #0x18
	orr r0, r3
	strb r0, [r4]
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02030BF4

	thumb_func_start sub_02030C34
sub_02030C34: ; 0x02030C34
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
_02030C3C:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r5, #0
	add r2, r6, #0
	bl sub_02030BF4
	add r4, r4, #1
	cmp r4, #0x12
	blt _02030C3C
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02030C34

	thumb_func_start sub_02030C50
sub_02030C50: ; 0x02030C50
	ldr r3, _02030C58 ; =MIi_CpuFill8
	mov r1, #0
	mov r2, #4
	bx r3
	.balign 4, 0
_02030C58: .word MIi_CpuFill8
	thumb_func_end sub_02030C50

	thumb_func_start sub_02030C5C
sub_02030C5C: ; 0x02030C5C
	push {r3, lr}
	bl sub_0203107C
	ldr r1, _02030C68 ; =0x0000161C
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
_02030C68: .word 0x0000161C
	thumb_func_end sub_02030C5C

	thumb_func_start sub_02030C6C
sub_02030C6C: ; 0x02030C6C
	push {r4, lr}
	ldr r3, [sp, #8]
	cmp r1, #5
	bne _02030C98
	ldrb r1, [r3]
	cmp r1, #1
	blo _02030C86
	mov r1, #1
	ldrb r3, [r0]
	lsl r1, r2
	orr r1, r3
	strb r1, [r0]
	pop {r4, pc}
_02030C86:
	mov r1, #1
	add r3, r1, #0
	ldrb r4, [r0]
	lsl r3, r2
	mov r1, #0xff
	eor r1, r3
	and r1, r4
	strb r1, [r0]
	pop {r4, pc}
_02030C98:
	bl GF_AssertFail
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02030C6C

	thumb_func_start sub_02030CA0
sub_02030CA0: ; 0x02030CA0
	push {r3, lr}
	cmp r1, #5
	bne _02030CB2
	ldrb r0, [r0]
	add r1, r0, #0
	asr r1, r2
	mov r0, #1
	and r0, r1
	pop {r3, pc}
_02030CB2:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02030CA0

	thumb_func_start sub_02030CBC
sub_02030CBC: ; 0x02030CBC
	ldr r3, _02030CC4 ; =MIi_CpuFill8
	mov r1, #0
	mov r2, #0x74
	bx r3
	.balign 4, 0
_02030CC4: .word MIi_CpuFill8
	thumb_func_end sub_02030CBC

	thumb_func_start sub_02030CC8
sub_02030CC8: ; 0x02030CC8
	push {r3, lr}
	bl sub_0203107C
	mov r1, #0x8e
	lsl r1, r1, #4
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02030CC8

	thumb_func_start sub_02030CD8
sub_02030CD8: ; 0x02030CD8
	ldrb r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end sub_02030CD8

	thumb_func_start sub_02030CE0
sub_02030CE0: ; 0x02030CE0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	ldrb r3, [r0]
	mov r2, #8
	lsr r1, r1, #0x1c
	bic r3, r2
	orr r1, r3
	strb r1, [r0]
	bx lr
	thumb_func_end sub_02030CE0

	thumb_func_start sub_02030CF4
sub_02030CF4: ; 0x02030CF4
	push {r4, lr}
	ldr r4, [sp, #8]
	cmp r1, #8
	bhi _02030D7E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02030D08: ; jump table
	.short _02030D1A - _02030D08 - 2 ; case 0
	.short _02030D2C - _02030D08 - 2 ; case 1
	.short _02030D32 - _02030D08 - 2 ; case 2
	.short _02030D3C - _02030D08 - 2 ; case 3
	.short _02030D4A - _02030D08 - 2 ; case 4
	.short _02030D54 - _02030D08 - 2 ; case 5
	.short _02030D60 - _02030D08 - 2 ; case 6
	.short _02030D6A - _02030D08 - 2 ; case 7
	.short _02030D72 - _02030D08 - 2 ; case 8
_02030D1A:
	ldrb r3, [r0]
	ldrb r2, [r4]
	mov r1, #7
	bic r3, r1
	mov r1, #7
	and r1, r2
	orr r1, r3
	strb r1, [r0]
	pop {r4, pc}
_02030D2C:
	ldrb r1, [r4]
	strb r1, [r0, #1]
	pop {r4, pc}
_02030D32:
	ldrh r3, [r4]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #0x22]
	pop {r4, pc}
_02030D3C:
	lsl r1, r2, #2
	add r0, r0, r1
	add r0, r0, r3
	ldrb r4, [r4]
	add r0, #0x2a
	strb r4, [r0]
	pop {r4, pc}
_02030D4A:
	lsl r1, r2, #2
	ldr r3, [r4]
	add r0, r0, r1
	str r3, [r0, #0x3c]
	pop {r4, pc}
_02030D54:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r3, [r4]
	add r0, #0x4c
	strh r3, [r0]
	pop {r4, pc}
_02030D60:
	ldrh r3, [r4]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #6]
	pop {r4, pc}
_02030D6A:
	ldrb r1, [r4]
	add r0, r0, r2
	strb r1, [r0, #3]
	pop {r4, pc}
_02030D72:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r3, [r4]
	add r0, #0x54
	strh r3, [r0]
	pop {r4, pc}
_02030D7E:
	bl GF_AssertFail
	pop {r4, pc}
	thumb_func_end sub_02030CF4

	thumb_func_start sub_02030D84
sub_02030D84: ; 0x02030D84
	push {r3, lr}
	cmp r1, #8
	bhi _02030DF2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02030D96: ; jump table
	.short _02030DA8 - _02030D96 - 2 ; case 0
	.short _02030DB0 - _02030D96 - 2 ; case 1
	.short _02030DB4 - _02030D96 - 2 ; case 2
	.short _02030DBC - _02030D96 - 2 ; case 3
	.short _02030DC8 - _02030D96 - 2 ; case 4
	.short _02030DD0 - _02030D96 - 2 ; case 5
	.short _02030DDA - _02030D96 - 2 ; case 6
	.short _02030DE2 - _02030D96 - 2 ; case 7
	.short _02030DE8 - _02030D96 - 2 ; case 8
_02030DA8:
	ldrb r0, [r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	pop {r3, pc}
_02030DB0:
	ldrb r0, [r0, #1]
	pop {r3, pc}
_02030DB4:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x22]
	pop {r3, pc}
_02030DBC:
	lsl r1, r2, #2
	add r0, r0, r1
	add r0, r0, r3
	add r0, #0x2a
	ldrb r0, [r0]
	pop {r3, pc}
_02030DC8:
	lsl r1, r2, #2
	add r0, r0, r1
	ldr r0, [r0, #0x3c]
	pop {r3, pc}
_02030DD0:
	lsl r1, r2, #1
	add r0, r0, r1
	add r0, #0x4c
	ldrh r0, [r0]
	pop {r3, pc}
_02030DDA:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #6]
	pop {r3, pc}
_02030DE2:
	add r0, r0, r2
	ldrb r0, [r0, #3]
	pop {r3, pc}
_02030DE8:
	lsl r1, r2, #1
	add r0, r0, r1
	add r0, #0x54
	ldrh r0, [r0]
	pop {r3, pc}
_02030DF2:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02030D84

	thumb_func_start sub_02030DFC
sub_02030DFC: ; 0x02030DFC
	ldr r3, _02030E04 ; =MIi_CpuFill8
	mov r1, #0
	mov r2, #4
	bx r3
	.balign 4, 0
_02030E04: .word MIi_CpuFill8
	thumb_func_end sub_02030DFC

	thumb_func_start sub_02030E08
sub_02030E08: ; 0x02030E08
	push {r3, lr}
	bl sub_0203107C
	ldr r1, _02030E14 ; =0x00001620
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
_02030E14: .word 0x00001620
	thumb_func_end sub_02030E08

	thumb_func_start sub_02030E18
sub_02030E18: ; 0x02030E18
	push {r4, lr}
	ldr r3, [sp, #8]
	cmp r1, #9
	beq _02030E26
	cmp r1, #0xa
	beq _02030E4A
	b _02030E50
_02030E26:
	ldrb r1, [r3]
	cmp r1, #1
	blo _02030E38
	mov r1, #1
	ldrb r3, [r0]
	lsl r1, r2
	orr r1, r3
	strb r1, [r0]
	pop {r4, pc}
_02030E38:
	mov r1, #1
	add r3, r1, #0
	ldrb r4, [r0]
	lsl r3, r2
	mov r1, #0xff
	eor r1, r3
	and r1, r4
	strb r1, [r0]
	pop {r4, pc}
_02030E4A:
	mov r1, #1
	strb r1, [r0, #1]
	pop {r4, pc}
_02030E50:
	bl GF_AssertFail
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02030E18

	thumb_func_start sub_02030E58
sub_02030E58: ; 0x02030E58
	push {r3, lr}
	cmp r1, #9
	beq _02030E64
	cmp r1, #0xa
	beq _02030E70
	b _02030E74
_02030E64:
	ldrb r0, [r0]
	add r1, r0, #0
	asr r1, r2
	mov r0, #1
	and r0, r1
	pop {r3, pc}
_02030E70:
	ldrb r0, [r0, #1]
	pop {r3, pc}
_02030E74:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02030E58

	thumb_func_start sub_02030E7C
sub_02030E7C: ; 0x02030E7C
	ldr r3, _02030E84 ; =MIi_CpuFill8
	mov r1, #0
	mov r2, #0x48
	bx r3
	.balign 4, 0
_02030E84: .word MIi_CpuFill8
	thumb_func_end sub_02030E7C

	thumb_func_start sub_02030E88
sub_02030E88: ; 0x02030E88
	push {r3, lr}
	bl sub_0203107C
	mov r1, #0x8e
	lsl r1, r1, #4
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02030E88

	thumb_func_start sub_02030E98
sub_02030E98: ; 0x02030E98
	ldrb r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end sub_02030E98

	thumb_func_start sub_02030EA0
sub_02030EA0: ; 0x02030EA0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	ldrb r3, [r0]
	mov r2, #8
	lsr r1, r1, #0x1c
	bic r3, r2
	orr r1, r3
	strb r1, [r0]
	bx lr
	thumb_func_end sub_02030EA0

	thumb_func_start sub_02030EB4
sub_02030EB4: ; 0x02030EB4
	push {r4, lr}
	ldr r3, [sp, #8]
	cmp r1, #7
	bhi _02030F2E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02030EC8: ; jump table
	.short _02030ED8 - _02030EC8 - 2 ; case 0
	.short _02030EEA - _02030EC8 - 2 ; case 1
	.short _02030EFC - _02030EC8 - 2 ; case 2
	.short _02030F02 - _02030EC8 - 2 ; case 3
	.short _02030F08 - _02030EC8 - 2 ; case 4
	.short _02030F12 - _02030EC8 - 2 ; case 5
	.short _02030F1C - _02030EC8 - 2 ; case 6
	.short _02030F24 - _02030EC8 - 2 ; case 7
_02030ED8:
	ldrb r4, [r0]
	ldrb r2, [r3]
	mov r1, #7
	bic r4, r1
	mov r1, #7
	and r1, r2
	orr r1, r4
	strb r1, [r0]
	pop {r4, pc}
_02030EEA:
	ldrb r2, [r0]
	mov r1, #0x10
	bic r2, r1
	ldrb r1, [r3]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1b
	orr r1, r2
	strb r1, [r0]
	pop {r4, pc}
_02030EFC:
	ldrb r1, [r3]
	strb r1, [r0, #1]
	pop {r4, pc}
_02030F02:
	ldrb r1, [r3]
	strb r1, [r0, #2]
	pop {r4, pc}
_02030F08:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #6]
	pop {r4, pc}
_02030F12:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #0xe]
	pop {r4, pc}
_02030F1C:
	ldrb r1, [r3]
	add r0, r0, r2
	strb r1, [r0, #3]
	pop {r4, pc}
_02030F24:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #0x2a]
	pop {r4, pc}
_02030F2E:
	bl GF_AssertFail
	pop {r4, pc}
	thumb_func_end sub_02030EB4

	thumb_func_start sub_02030F34
sub_02030F34: ; 0x02030F34
	push {r3, lr}
	cmp r1, #7
	bhi _02030F8C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02030F46: ; jump table
	.short _02030F56 - _02030F46 - 2 ; case 0
	.short _02030F5E - _02030F46 - 2 ; case 1
	.short _02030F66 - _02030F46 - 2 ; case 2
	.short _02030F6A - _02030F46 - 2 ; case 3
	.short _02030F6E - _02030F46 - 2 ; case 4
	.short _02030F76 - _02030F46 - 2 ; case 5
	.short _02030F7E - _02030F46 - 2 ; case 6
	.short _02030F84 - _02030F46 - 2 ; case 7
_02030F56:
	ldrb r0, [r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	pop {r3, pc}
_02030F5E:
	ldrb r0, [r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	pop {r3, pc}
_02030F66:
	ldrb r0, [r0, #1]
	pop {r3, pc}
_02030F6A:
	ldrb r0, [r0, #2]
	pop {r3, pc}
_02030F6E:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #6]
	pop {r3, pc}
_02030F76:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #0xe]
	pop {r3, pc}
_02030F7E:
	add r0, r0, r2
	ldrb r0, [r0, #3]
	pop {r3, pc}
_02030F84:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x2a]
	pop {r3, pc}
_02030F8C:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02030F34

	thumb_func_start sub_02030F94
sub_02030F94: ; 0x02030F94
	ldr r3, _02030F9C ; =MIi_CpuFill8
	mov r1, #0
	mov r2, #4
	bx r3
	.balign 4, 0
_02030F9C: .word MIi_CpuFill8
	thumb_func_end sub_02030F94

	thumb_func_start sub_02030FA0
sub_02030FA0: ; 0x02030FA0
	push {r3, lr}
	bl sub_0203107C
	ldr r1, _02030FAC ; =0x00001624
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
_02030FAC: .word 0x00001624
	thumb_func_end sub_02030FA0

	thumb_func_start sub_02030FB0
sub_02030FB0: ; 0x02030FB0
	push {r4, lr}
	ldr r3, [sp, #8]
	cmp r1, #8
	bne _02030FDC
	ldrb r1, [r3]
	cmp r1, #1
	blo _02030FCA
	mov r1, #1
	ldrb r3, [r0]
	lsl r1, r2
	orr r1, r3
	strb r1, [r0]
	pop {r4, pc}
_02030FCA:
	mov r1, #1
	add r3, r1, #0
	ldrb r4, [r0]
	lsl r3, r2
	mov r1, #0xff
	eor r1, r3
	and r1, r4
	strb r1, [r0]
	pop {r4, pc}
_02030FDC:
	bl GF_AssertFail
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02030FB0

	thumb_func_start sub_02030FE4
sub_02030FE4: ; 0x02030FE4
	push {r3, lr}
	cmp r1, #8
	bne _02030FF6
	ldrb r0, [r0]
	add r1, r0, #0
	asr r1, r2
	mov r0, #1
	and r0, r1
	pop {r3, pc}
_02030FF6:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02030FE4

	thumb_func_start sub_02031000
sub_02031000: ; 0x02031000
	ldr r0, _02031004 ; =0x00001628
	bx lr
	.balign 4, 0
_02031004: .word 0x00001628
	thumb_func_end sub_02031000

	thumb_func_start sub_02031008
sub_02031008: ; 0x02031008
	push {r4, lr}
	ldr r2, _02031058 ; =0x00001628
	mov r1, #0
	add r4, r0, #0
	bl MIi_CpuFill8
	ldr r0, _0203105C ; =0x00000954
	add r0, r4, r0
	bl sub_0202D240
	ldr r0, _02031060 ; =0x00000ABC
	add r0, r4, r0
	bl sub_0202D254
	ldr r0, _02031064 ; =0x00000ADC
	add r0, r4, r0
	bl sub_0202D274
	ldr r0, _02031068 ; =0x00001618
	add r0, r4, r0
	bl sub_02030A98
	ldr r0, _0203106C ; =0x0000161C
	add r0, r4, r0
	bl sub_02030C50
	ldr r0, _02031070 ; =0x00001620
	add r0, r4, r0
	bl sub_02030DFC
	ldr r0, _02031074 ; =0x00001624
	add r0, r4, r0
	bl sub_02030F94
	ldr r1, _02031078 ; =0x021D2AFC
	ldr r2, _02031058 ; =0x00001628
	add r0, r4, #0
	bl MIi_CpuCopy8
	pop {r4, pc}
	.balign 4, 0
_02031058: .word 0x00001628
_0203105C: .word 0x00000954
_02031060: .word 0x00000ABC
_02031064: .word 0x00000ADC
_02031068: .word 0x00001618
_0203106C: .word 0x0000161C
_02031070: .word 0x00001620
_02031074: .word 0x00001624
_02031078: .word 0x021D2AFC
	thumb_func_end sub_02031008

	thumb_func_start sub_0203107C
sub_0203107C: ; 0x0203107C
	ldr r0, _02031080 ; =0x021D2AFC
	bx lr
	.balign 4, 0
_02031080: .word 0x021D2AFC
	thumb_func_end sub_0203107C

	thumb_func_start sub_02031084
sub_02031084: ; 0x02031084
	push {r3, lr}
	mov r1, #0x13
	bl SavArray_get
	add r1, r0, #0
	ldr r0, _02031098 ; =0x021D2AFC
	ldr r2, _0203109C ; =0x00001628
	bl MIi_CpuCopy8
	pop {r3, pc}
	.balign 4, 0
_02031098: .word 0x021D2AFC
_0203109C: .word 0x00001628
	thumb_func_end sub_02031084

	thumb_func_start sub_020310A0
sub_020310A0: ; 0x020310A0
	push {r3, lr}
	mov r1, #0x13
	bl SavArray_get
	ldr r1, _020310B4 ; =0x021D2AFC
	ldr r2, _020310B8 ; =0x00001628
	bl MIi_CpuCopy8
	pop {r3, pc}
	nop
_020310B4: .word 0x021D2AFC
_020310B8: .word 0x00001628
	thumb_func_end sub_020310A0

	thumb_func_start sub_020310BC
sub_020310BC: ; 0x020310BC
	push {r3, lr}
	cmp r1, #0x70
	bge _020310E6
	cmp r1, #0x64
	blt _020310E0
	cmp r2, #0x10
	blt _020310CE
	add r1, r1, #1
	sub r2, #0x10
_020310CE:
	lsl r1, r1, #1
	ldrh r0, [r0, r1]
	add r1, r0, #0
	asr r1, r2
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
_020310E0:
	lsl r1, r1, #1
	ldrh r0, [r0, r1]
	pop {r3, pc}
_020310E6:
	mov r3, #0
	mvn r3, r3
	cmp r2, r3
	bne _020310F6
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_020310F6:
	lsl r2, r2, #6
	sub r1, #0x70
	add r2, r0, r2
	lsl r0, r1, #1
	add r0, r2, r0
	add r0, #0xe0
	ldrh r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020310BC

	thumb_func_start sub_02031108
sub_02031108: ; 0x02031108
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _02031180 ; =0x0000270F
	add r7, r3, #0
	add r5, r1, #0
	add r4, r2, #0
	cmp r7, r0
	bls _0203111A
	add r7, r0, #0
_0203111A:
	cmp r5, #0x70
	bge _02031166
	cmp r5, #0x64
	blt _02031158
	cmp r4, #0xff
	bne _0203112A
	bl GF_AssertFail
_0203112A:
	cmp r4, #0x10
	blt _02031132
	add r5, r5, #1
	sub r4, #0x10
_02031132:
	cmp r7, #0
	bne _0203114A
	mov r2, #1
	add r3, r2, #0
	lsl r1, r5, #1
	ldrh r0, [r6, r1]
	lsl r3, r4
	ldr r2, _02031184 ; =0x0000FFFF
	eor r2, r3
	and r0, r2
	strh r0, [r6, r1]
	b _0203117C
_0203114A:
	lsl r2, r5, #1
	mov r0, #1
	ldrh r1, [r6, r2]
	lsl r0, r4
	orr r0, r1
	strh r0, [r6, r2]
	b _0203117C
_02031158:
	cmp r4, #0xff
	beq _02031160
	bl GF_AssertFail
_02031160:
	lsl r0, r5, #1
	strh r7, [r6, r0]
	b _0203117C
_02031166:
	cmp r4, #0xff
	bne _0203116E
	bl GF_AssertFail
_0203116E:
	lsl r0, r4, #6
	sub r5, #0x70
	add r1, r6, r0
	lsl r0, r5, #1
	add r0, r1, r0
	add r0, #0xe0
	strh r7, [r0]
_0203117C:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02031180: .word 0x0000270F
_02031184: .word 0x0000FFFF
	thumb_func_end sub_02031108

	thumb_func_start sub_02031188
sub_02031188: ; 0x02031188
	push {r4, lr}
	mov r2, #2
	add r4, r0, #0
	add r0, #0xe0
	mov r1, #0
	lsl r2, r2, #0xa
	bl MIi_CpuFill8
	mov r1, #0x64
	add r4, #0xc8
	mov r0, #0
_0203119E:
	add r1, r1, #1
	strh r0, [r4]
	add r4, r4, #2
	cmp r1, #0x6f
	ble _0203119E
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02031188

	thumb_func_start sub_020311AC
sub_020311AC: ; 0x020311AC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	cmp r5, #0xff
	bne _020311BA
	bl GF_AssertFail
_020311BA:
	cmp r5, #0x1f
	bge _02031200
	add r0, r6, #0
	str r0, [sp]
	add r0, #0xe0
	lsl r1, r5, #6
	str r0, [sp]
	add r7, r0, r1
_020311CA:
	add r0, r5, #1
	lsl r1, r0, #6
	ldr r0, [sp]
	mov r2, #0x40
	add r0, r0, r1
	add r1, r7, #0
	bl MIi_CpuCopy8
	mov r4, #0x64
_020311DC:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #1
	bl sub_020310BC
	add r3, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	bl sub_02031108
	add r4, r4, #2
	cmp r4, #0x6f
	blt _020311DC
	add r5, r5, #1
	add r7, #0x40
	cmp r5, #0x1f
	blt _020311CA
_02031200:
	mov r0, #0x1f
	add r6, #0xe0
	lsl r0, r0, #6
	add r0, r6, r0
	mov r1, #0
	mov r2, #0x40
	bl MIi_CpuFill8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020311AC

	thumb_func_start sub_02031214
sub_02031214: ; 0x02031214
	ldr r3, _02031224 ; =MIi_CpuFill8
	add r0, #0xe0
	lsl r1, r1, #6
	add r0, r0, r1
	mov r1, #0
	mov r2, #0x40
	bx r3
	nop
_02031224: .word MIi_CpuFill8
	thumb_func_end sub_02031214

	thumb_func_start sub_02031228
sub_02031228: ; 0x02031228
	push {r3, r4, r5, r6, r7, lr}
	add r4, r3, #0
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	bl sub_020310BC
	add r0, r0, r4
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02031108
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02031228

	thumb_func_start sub_02031248
sub_02031248: ; 0x02031248
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	bl sub_020310BC
	sub r3, r0, r4
	bpl _0203125C
	mov r3, #0
_0203125C:
	lsl r3, r3, #0x10
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	lsr r3, r3, #0x10
	bl sub_02031108
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02031248

	thumb_func_start sub_0203126C
sub_0203126C: ; 0x0203126C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	bl sub_020310BC
	cmp r0, r4
	bhs _0203128C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	add r3, r4, #0
	bl sub_02031108
	pop {r3, r4, r5, r6, r7, pc}
_0203128C:
	ldr r3, _020312A0 ; =0x0000270F
	cmp r0, r3
	bls _0203129C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02031108
_0203129C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020312A0: .word 0x0000270F
	thumb_func_end sub_0203126C

	thumb_func_start sub_020312A4
sub_020312A4: ; 0x020312A4
	mov r0, #0xba
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_020312A4

	thumb_func_start sub_020312AC
sub_020312AC: ; 0x020312AC
	push {r4, lr}
	mov r2, #0xba
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl MIi_CpuFill8
	mov r0, #0
	mvn r0, r0
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020312AC

	thumb_func_start sub_020312C4
sub_020312C4: ; 0x020312C4
	ldr r3, _020312C8 ; =sub_02027144
	bx r3
	.balign 4, 0
_020312C8: .word sub_02027144
	thumb_func_end sub_020312C4

	thumb_func_start sub_020312CC
sub_020312CC: ; 0x020312CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02027158
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020273F0
	orr r0, r4
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020312CC

	thumb_func_start sub_020312E0
sub_020312E0: ; 0x020312E0
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_020274E8
	cmp r0, #0
	bne _020312F4
	mov r0, #0
	pop {r4, r5, r6, pc}
_020312F4:
	cmp r4, #0
	beq _02031302
	cmp r4, #1
	beq _0203130A
	cmp r4, #2
	beq _02031314
	b _02031320
_02031302:
	lsl r0, r6, #1
	add r0, r5, r0
	ldrh r0, [r0, #4]
	pop {r4, r5, r6, pc}
_0203130A:
	lsl r0, r6, #1
	add r1, r5, r0
	ldr r0, _02031328 ; =0x000003E2
	ldrh r0, [r1, r0]
	pop {r4, r5, r6, pc}
_02031314:
	lsl r0, r6, #1
	add r1, r5, r0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldrh r0, [r1, r0]
	pop {r4, r5, r6, pc}
_02031320:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02031328: .word 0x000003E2
	thumb_func_end sub_020312E0

	thumb_func_start sub_0203132C
sub_0203132C: ; 0x0203132C
	push {r4, lr}
	ldr r4, _02031370 ; =0x0000270F
	cmp r3, r4
	bls _02031336
	add r3, r4, #0
_02031336:
	cmp r1, #0
	beq _02031344
	cmp r1, #1
	beq _0203134C
	cmp r1, #2
	beq _02031356
	b _02031362
_02031344:
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #4]
	b _0203136A
_0203134C:
	lsl r1, r2, #1
	add r1, r0, r1
	ldr r0, _02031374 ; =0x000003E2
	strh r3, [r1, r0]
	b _0203136A
_02031356:
	lsl r1, r2, #1
	add r1, r0, r1
	mov r0, #0x1f
	lsl r0, r0, #6
	strh r3, [r1, r0]
	b _0203136A
_02031362:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_0203136A:
	add r0, r3, #0
	pop {r4, pc}
	nop
_02031370: .word 0x0000270F
_02031374: .word 0x000003E2
	thumb_func_end sub_0203132C

	thumb_func_start sub_02031378
sub_02031378: ; 0x02031378
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_020274E8
	cmp r0, #0
	bne _0203138E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0203138E:
	add r0, r7, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_020312E0
	add r1, sp, #8
	ldrh r3, [r1, #0x10]
	cmp r0, r3
	bhs _020313AE
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0203132C
	pop {r3, r4, r5, r6, r7, pc}
_020313AE:
	ldr r3, _020313C0 ; =0x0000270F
	cmp r0, r3
	bls _020313BE
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0203132C
_020313BE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020313C0: .word 0x0000270F
	thumb_func_end sub_02031378

	thumb_func_start sub_020313C4
sub_020313C4: ; 0x020313C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #0
	add r6, r1, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r4, [sp, #0x38]
	ldr r7, [sp, #0x3c]
	str r0, [sp, #0xc]
	cmp r6, #0x22
	blt _020313E0
	cmp r6, #0x3c
	ble _020313E4
_020313E0:
	bl GF_AssertFail
_020313E4:
	ldr r1, [sp, #4]
	mov r0, #0
	sub r1, #0x24
	cmp r1, #0x18
	bhi _020313FC
	mov r3, #1
	add r2, r3, #0
	lsl r2, r1
	ldr r1, _020314A0 ; =0x01001001
	tst r1, r2
	beq _020313FC
	add r0, r3, #0
_020313FC:
	cmp r0, #0
	bne _02031404
	bl GF_AssertFail
_02031404:
	mov r0, #1
	str r0, [r4]
	mov r0, #2
	str r0, [r7]
	ldr r0, [sp, #8]
	cmp r0, #0xff
	beq _02031418
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02031418:
	add r0, r5, #0
	bl sub_020274E8
	cmp r0, #0
	bne _02031428
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02031428:
	add r0, r5, #0
	bl sub_0203107C
	ldr r2, [sp, #8]
	str r0, [sp, #0x18]
	add r1, r6, #0
	bl sub_020310BC
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl sub_020310BC
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x34]
	add r0, r5, #0
	add r2, r4, #0
	bl sub_020312C4
	add r6, r0, #0
	ldr r0, [r4]
	cmp r0, #1
	beq _0203145C
	mov r4, #0
	b _0203146A
_0203145C:
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020312E0
	add r4, r0, #0
_0203146A:
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x30]
	str r0, [sp]
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02031378
	ldr r0, [sp, #0x14]
	cmp r0, r4
	beq _0203148E
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020312CC
	str r0, [r7]
	mov r0, #1
	str r0, [sp, #0xc]
_0203148E:
	cmp r6, #0
	beq _02031498
	add r0, r6, #0
	bl FreeToHeap
_02031498:
	ldr r0, [sp, #0xc]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_020314A0: .word 0x01001001
	thumb_func_end sub_020313C4

	thumb_func_start sub_020314A4
sub_020314A4: ; 0x020314A4
	push {r4, lr}
	mov r1, #0x80
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x80
	add r4, r0, #0
	bl MIi_CpuFill8
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020314A4

	thumb_func_start sub_020314BC
sub_020314BC: ; 0x020314BC
	ldr r3, _020314C0 ; =FreeToHeap
	bx r3
	.balign 4, 0
_020314C0: .word FreeToHeap
	thumb_func_end sub_020314BC

	thumb_func_start sub_020314C4
sub_020314C4: ; 0x020314C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0202CA44
	str r0, [sp]
	add r0, r6, #0
	bl Sav2_SysInfo_get
	add r0, r6, #0
	bl sub_0202A960
	add r7, r0, #0
	add r0, sp, #0x10
	bl OS_GetOwnerInfo
	add r0, r7, #0
	add r1, sp, #0xc
	add r2, sp, #8
	add r3, sp, #4
	bl sub_0202AA20
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x80
	bl MIi_CpuFill8
	add r0, r4, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r5, #0
	bl CopyU16StringArray
	add r0, r4, #0
	bl PlayerProfile_GetTrainerID
	str r0, [r5, #0x10]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	strb r0, [r5, #0x14]
	ldr r0, [sp, #0xc]
	mov r1, #0xfe
	strh r0, [r5, #0x1c]
	ldrb r0, [r5, #0x1b]
	bic r0, r1
	ldr r1, [sp, #8]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x19
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r5, #0x1b]
	ldrb r0, [r5, #0x1b]
	mov r1, #1
	bic r0, r1
	ldr r1, [sp, #4]
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #1
	and r1, r2
	orr r0, r1
	strb r0, [r5, #0x1b]
	ldr r0, [sp]
	bl sub_0202CA8C
	strb r0, [r5, #0x17]
	ldr r0, [sp]
	bl sub_0202CA90
	strb r0, [r5, #0x18]
	ldr r0, _020315B4 ; =0x0000FFFF
	mov r1, #0
	add r2, r5, #0
_02031566:
	add r1, r1, #1
	strh r0, [r2, #0x20]
	add r2, r2, #2
	cmp r1, #0x28
	blt _02031566
	add r1, r5, #0
	add r0, r7, #0
	add r1, #0x20
	bl sub_0202ABD0
	add r0, sp, #4
	ldrb r0, [r0, #0xe]
	strb r0, [r5, #0x15]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0202903C
	add r1, r0, #0
	add r0, r7, #0
	mov r2, #0
	bl sub_0205B46C
	strb r0, [r5, #0x16]
	mov r0, #GAME_VERSION
	strb r0, [r5, #0x19]
	mov r0, #2
	strb r0, [r5, #0x1a]
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #0x7c
	bl sub_020275C4
	add r5, #0x7c
	strh r0, [r5]
	add sp, #0x64
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020315B4: .word 0x0000FFFF
	thumb_func_end sub_020314C4

	thumb_func_start sub_020315B8
sub_020315B8: ; 0x020315B8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xf
	bl String_ctor
	add r1, r5, #0
	mov r2, #0xf
	add r4, r0, #0
	bl CopyU16ArrayToStringN
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020315B8

	thumb_func_start sub_020315D0
sub_020315D0: ; 0x020315D0
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _020315DC
	cmp r0, #1
	beq _020315DC
	mov r0, #0
_020315DC:
	bx lr
	.balign 4, 0
	thumb_func_end sub_020315D0

	thumb_func_start sub_020315E0
sub_020315E0: ; 0x020315E0
	ldrh r0, [r0, #0x1c]
	ldr r1, _020315EC ; =0x000001EF
	cmp r0, r1
	blo _020315EA
	mov r0, #0
_020315EA:
	bx lr
	.balign 4, 0
_020315EC: .word 0x000001EF
	thumb_func_end sub_020315E0

	thumb_func_start sub_020315F0
sub_020315F0: ; 0x020315F0
	push {r3, lr}
	add r2, r0, #0
	ldrh r0, [r2, #0x1c]
	ldr r1, _0203160C ; =0x000001EF
	cmp r0, r1
	blo _02031600
	mov r0, #0
	pop {r3, pc}
_02031600:
	ldrb r1, [r2, #0x1b]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x19
	bl sub_02070438
	pop {r3, pc}
	.balign 4, 0
_0203160C: .word 0x000001EF
	thumb_func_end sub_020315F0

	thumb_func_start sub_02031610
sub_02031610: ; 0x02031610
	ldrb r0, [r0, #0x1b]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bls _0203161C
	mov r0, #1
_0203161C:
	bx lr
	.balign 4, 0
	thumb_func_end sub_02031610

	thumb_func_start sub_02031620
sub_02031620: ; 0x02031620
	ldrb r0, [r0, #0x17]
	cmp r0, #0xea
	blo _02031628
	mov r0, #0
_02031628:
	bx lr
	.balign 4, 0
	thumb_func_end sub_02031620

	thumb_func_start sub_0203162C
sub_0203162C: ; 0x0203162C
	push {r4, lr}
	ldrb r1, [r0, #0x17]
	cmp r1, #0xea
	blo _02031638
	mov r0, #0
	pop {r4, pc}
_02031638:
	ldrb r4, [r0, #0x18]
	add r0, r1, #0
	bl sub_02091688
	cmp r0, r4
	bhs _02031646
	mov r4, #0
_02031646:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203162C

	thumb_func_start sub_0203164C
sub_0203164C: ; 0x0203164C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldrb r0, [r5, #0x1e]
	add r4, r1, #0
	mov r6, #0
	cmp r0, #0
	bne _020316CE
	ldrh r0, [r5, #0x20]
	strh r0, [r4]
	ldrh r0, [r5, #0x22]
	strh r0, [r4, #2]
	ldrh r0, [r5, #0x24]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x26]
	strh r0, [r4, #6]
	ldrh r0, [r4]
	cmp r0, #5
	blo _02031676
	add r6, r6, #1
	b _020316AA
_02031676:
	ldrh r0, [r4, #2]
	cmp r0, #0x13
	bls _02031680
	add r6, r6, #1
	b _020316AA
_02031680:
	ldrh r0, [r4, #4]
	ldr r1, _020316E8 ; =0x0000FFFF
	cmp r0, r1
	beq _02031694
	add r1, sp, #4
	add r2, sp, #0
	bl GetCategoryAndMsgNoByECWordIdx
	cmp r0, #0
	beq _020316A8
_02031694:
	ldrh r0, [r4, #6]
	ldr r1, _020316E8 ; =0x0000FFFF
	cmp r0, r1
	beq _020316AA
	add r1, sp, #4
	add r2, sp, #0
	bl GetCategoryAndMsgNoByECWordIdx
	cmp r0, #0
	bne _020316AA
_020316A8:
	add r6, r6, #1
_020316AA:
	cmp r6, #0
	ble _020316C8
	add r0, r4, #0
	mov r1, #4
	bl MailMsg_init_withBank
	mov r0, #0
	strh r0, [r4, #2]
	ldr r0, _020316EC ; =0x0000011F
	mov r1, #0x63
	bl GetECWordIndexByPair
	strh r0, [r4, #4]
	ldr r0, _020316E8 ; =0x0000FFFF
	strh r0, [r4, #6]
_020316C8:
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_020316CE:
	mov r0, #0x28
	add r1, r2, #0
	bl String_ctor
	add r5, #0x20
	add r1, r5, #0
	mov r2, #0x28
	add r4, r0, #0
	bl CopyU16ArrayToStringN
	add r0, r4, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020316E8: .word 0x0000FFFF
_020316EC: .word 0x0000011F
	thumb_func_end sub_0203164C

	thumb_func_start sub_020316F0
sub_020316F0: ; 0x020316F0
	ldrb r0, [r0, #0x15]
	cmp r0, #1
	blo _020316FA
	cmp r0, #0xc
	bls _020316FC
_020316FA:
	mov r0, #1
_020316FC:
	bx lr
	.balign 4, 0
	thumb_func_end sub_020316F0

	thumb_func_start sub_02031700
sub_02031700: ; 0x02031700
	ldrb r0, [r0, #0x16]
	cmp r0, #0xf
	bls _02031708
	mov r0, #0
_02031708:
	bx lr
	.balign 4, 0
	thumb_func_end sub_02031700

	thumb_func_start sub_0203170C
sub_0203170C: ; 0x0203170C
	mov r0, #0x40
	bx lr
	thumb_func_end sub_0203170C

	thumb_func_start sub_02031710
sub_02031710: ; 0x02031710
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x40
	bl MIi_CpuFill8
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x33
	bl memset
	mov r0, #1
	str r0, [r4, #0x34]
	mov r0, #0x1f
	bl sub_0202893C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02031710

	thumb_func_start sub_02031734
sub_02031734: ; 0x02031734
	push {r3, lr}
	mov r1, #0x1f
	bl SavArray_get
	bl sub_02031710
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02031734

	thumb_func_start sub_02031744
sub_02031744: ; 0x02031744
	push {r3, lr}
	mov r1, #0x1f
	bl SavArray_get
	mov r1, #0
	ldrsb r0, [r0, r1]
	cmp r0, #0
	beq _02031756
	mov r1, #1
_02031756:
	add r0, r1, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02031744

	thumb_func_start sub_0203175C
sub_0203175C: ; 0x0203175C
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x1f
	bl SavArray_get
	add r1, r4, #0
	bl strcpy
	mov r0, #0x1f
	bl sub_0202893C
	pop {r4, pc}
	thumb_func_end sub_0203175C

	thumb_func_start sub_02031774
sub_02031774: ; 0x02031774
	ldr r3, _0203177C ; =SavArray_get
	mov r1, #0x1f
	bx r3
	nop
_0203177C: .word SavArray_get
	thumb_func_end sub_02031774

	thumb_func_start sub_02031780
sub_02031780: ; 0x02031780
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r1, #0x1f
	add r4, r2, #0
	bl SavArray_get
	cmp r5, #3
	bhi _020317B2
	add r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0203179C: ; jump table
	.short _020317A4 - _0203179C - 2 ; case 0
	.short _020317A8 - _0203179C - 2 ; case 1
	.short _020317AC - _0203179C - 2 ; case 2
	.short _020317B0 - _0203179C - 2 ; case 3
_020317A4:
	str r4, [r0, #0x34]
	b _020317B2
_020317A8:
	strh r4, [r0, #0x38]
	b _020317B2
_020317AC:
	strh r4, [r0, #0x3a]
	b _020317B2
_020317B0:
	str r4, [r0, #0x3c]
_020317B2:
	mov r0, #0x1f
	bl sub_0202893C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02031780

	thumb_func_start sub_020317BC
sub_020317BC: ; 0x020317BC
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x1f
	bl SavArray_get
	cmp r4, #3
	bhi _020317EE
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020317D6: ; jump table
	.short _020317DE - _020317D6 - 2 ; case 0
	.short _020317E2 - _020317D6 - 2 ; case 1
	.short _020317E6 - _020317D6 - 2 ; case 2
	.short _020317EA - _020317D6 - 2 ; case 3
_020317DE:
	ldr r0, [r0, #0x34]
	pop {r4, pc}
_020317E2:
	ldrh r0, [r0, #0x38]
	pop {r4, pc}
_020317E6:
	ldrh r0, [r0, #0x3a]
	pop {r4, pc}
_020317EA:
	ldr r0, [r0, #0x3c]
	pop {r4, pc}
_020317EE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020317BC

	thumb_func_start sub_020317F4
sub_020317F4: ; 0x020317F4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0202CA44
	add r6, r0, #0
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r7, r0, #0
	add r0, r5, #0
	bl sub_02031774
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x64
	bl MIi_CpuFill8
	mov r0, #GAME_VERSION
	strb r0, [r4]
	mov r0, #2
	strb r0, [r4, #1]
	add r0, r6, #0
	bl sub_0202CA8C
	strb r0, [r4, #2]
	add r0, r6, #0
	bl sub_0202CA90
	strb r0, [r4, #3]
	add r0, r7, #0
	bl PlayerProfile_GetTrainerID
	str r0, [r4, #4]
	add r0, r7, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r4, #0
	add r0, #8
	bl CopyU16StringArray
	mov r0, #0
	str r0, [r4, #0x18]
	add r0, r4, #0
	ldr r1, [sp]
	add r0, #0x24
	bl strcpy
	add r0, r5, #0
	mov r1, #0
	bl sub_020317BC
	str r0, [r4, #0x5c]
	mov r0, #0x1f
	bl sub_0202893C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020317F4

	thumb_func_start sub_0203186C
sub_0203186C: ; 0x0203186C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl sub_020317F4
	bl LCRandom
	mov r1, #0xfa
	lsl r1, r1, #2
	bl _s32_div_f
	add r0, r5, #0
	add r4, r1, #0
	add r0, #0x60
	strh r4, [r0]
	ldr r0, _02031898 ; =0x0000FFFF
	add r5, #0x62
	strh r0, [r5]
	mov r0, #0x1f
	bl sub_0202893C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02031898: .word 0x0000FFFF
	thumb_func_end sub_0203186C

	thumb_func_start sub_0203189C
sub_0203189C: ; 0x0203189C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	mov r1, #0x1f
	bl SavArray_get
	add r4, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020317F4
	add r0, r5, #0
	ldrh r1, [r4, #0x38]
	add r0, #0x60
	add r5, #0x62
	strh r1, [r0]
	ldrh r0, [r4, #0x3a]
	strh r0, [r5]
	mov r0, #0x1f
	bl sub_0202893C
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203189C

	thumb_func_start sub_020318C8
sub_020318C8: ; 0x020318C8
	mov r0, #8
	bx lr
	thumb_func_end sub_020318C8

	thumb_func_start sub_020318CC
sub_020318CC: ; 0x020318CC
	push {r4, lr}
	add r4, r0, #0
	bl sub_020318C8
	add r2, r0, #0
	mov r0, #0
	add r1, r4, #0
	bl sub_020D47EC
	mov r0, #0
	mvn r0, r0
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020318CC

	thumb_func_start sub_020318E8
sub_020318E8: ; 0x020318E8
	ldr r3, _020318F0 ; =SavArray_get
	mov r1, #0x20
	bx r3
	nop
_020318F0: .word SavArray_get
	thumb_func_end sub_020318E8

	thumb_func_start sub_020318F4
sub_020318F4: ; 0x020318F4
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_020318F4

	thumb_func_start sub_020318F8
sub_020318F8: ; 0x020318F8
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_020318F8

	thumb_func_start sub_020318FC
sub_020318FC: ; 0x020318FC
	str r1, [r0]
	bx lr
	thumb_func_end sub_020318FC

	thumb_func_start sub_02031900
sub_02031900: ; 0x02031900
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_02031900

	thumb_func_start sub_02031904
sub_02031904: ; 0x02031904
	mov r0, #0x2e
	lsl r0, r0, #6
	bx lr
	.balign 4, 0
	thumb_func_end sub_02031904

	thumb_func_start sub_0203190C
sub_0203190C: ; 0x0203190C
	push {r3, r4, r5, r6, r7, lr}
	mov r2, #0x2e
	mov r1, #0
	lsl r2, r2, #6
	str r0, [sp]
	bl MIi_CpuFill8
	mov r0, #0
	mov r7, #0xb3
	ldr r1, _02031960 ; =0x0000FFFF
	ldr r6, _02031964 ; =0x00000484
	mov ip, r0
	lsl r7, r7, #2
_02031926:
	mov r0, ip
	mov r2, #0x2c
	mul r2, r0
	ldr r0, [sp]
	mov r3, #0
	add r4, r0, r2
	mov r0, ip
	mov r2, #0xa4
	mul r2, r0
	ldr r0, [sp]
	add r5, r0, r2
_0203193C:
	lsl r2, r3, #3
	add r0, r4, r2
	strh r1, [r0, r7]
	add r0, r5, r2
	strh r1, [r0, r6]
	add r0, r3, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	cmp r3, #5
	blo _0203193C
	mov r0, ip
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov ip, r0
	cmp r0, #0xa
	blo _02031926
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02031960: .word 0x0000FFFF
_02031964: .word 0x00000484
	thumb_func_end sub_0203190C

	thumb_func_start sub_02031968
sub_02031968: ; 0x02031968
	ldr r3, _02031970 ; =SavArray_get
	mov r1, #0x25
	bx r3
	nop
_02031970: .word SavArray_get
	thumb_func_end sub_02031968

	thumb_func_start sub_02031974
sub_02031974: ; 0x02031974
	bx lr
	.balign 4, 0
	thumb_func_end sub_02031974

	thumb_func_start sub_02031978
sub_02031978: ; 0x02031978
	add r0, #0xdc
	bx lr
	thumb_func_end sub_02031978

	thumb_func_start sub_0203197C
sub_0203197C: ; 0x0203197C
	mov r1, #0xb3
	lsl r1, r1, #2
	add r0, r0, r1
	bx lr
	thumb_func_end sub_0203197C

	thumb_func_start sub_02031984
sub_02031984: ; 0x02031984
	ldr r1, _0203198C ; =0x00000484
	add r0, r0, r1
	bx lr
	nop
_0203198C: .word 0x00000484
	thumb_func_end sub_02031984

	thumb_func_start sub_02031990
sub_02031990: ; 0x02031990
	ldr r1, _02031998 ; =0x00000AEC
	add r0, r0, r1
	bx lr
	nop
_02031998: .word 0x00000AEC
	thumb_func_end sub_02031990

	thumb_func_start sub_0203199C
sub_0203199C: ; 0x0203199C
	mov r1, #0xb
	lsl r1, r1, #8
	add r0, r0, r1
	bx lr
	thumb_func_end sub_0203199C

	thumb_func_start sub_020319A4
sub_020319A4: ; 0x020319A4
	bx lr
	.balign 4, 0
	thumb_func_end sub_020319A4

	thumb_func_start sub_020319A8
sub_020319A8: ; 0x020319A8
	push {r3, lr}
	cmp r1, #0
	blt _020319B2
	cmp r1, #4
	ble _020319BA
_020319B2:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_020319BA:
	sub r2, r2, #1
	bpl _020319C6
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_020319C6:
	add r0, r0, r2
	add r0, #0xdc
	ldrb r0, [r0]
	add r2, r0, #0
	asr r2, r1
	mov r0, #1
	add r1, r2, #0
	tst r1, r0
	bne _020319DA
	mov r0, #0
_020319DA:
	pop {r3, pc}
	thumb_func_end sub_020319A8

	thumb_func_start sub_020319DC
sub_020319DC: ; 0x020319DC
	mov r1, #0xb3
	lsl r1, r1, #2
	add r0, r0, r1
	bx lr
	thumb_func_end sub_020319DC

	thumb_func_start sub_020319E4
sub_020319E4: ; 0x020319E4
	ldr r1, _020319EC ; =0x00000484
	add r0, r0, r1
	bx lr
	nop
_020319EC: .word 0x00000484
	thumb_func_end sub_020319E4

	thumb_func_start sub_020319F0
sub_020319F0: ; 0x020319F0
	mov r1, #0xb
	lsl r1, r1, #8
	add r0, r0, r1
	bx lr
	thumb_func_end sub_020319F0

	thumb_func_start sub_020319F8
sub_020319F8: ; 0x020319F8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	sub r1, r2, #1
	bpl _02031A06
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_02031A06:
	add r2, r0, r1
	mov r0, #1
	mov r3, #0
	add r2, #0xdc
	add r6, r0, #0
_02031A10:
	add r1, r4, #0
	asr r1, r3
	and r1, r6
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	beq _02031A2A
	add r5, r0, #0
	lsl r5, r3
	lsl r5, r5, #0x18
	ldrb r1, [r2]
	lsr r5, r5, #0x18
	orr r1, r5
	strb r1, [r2]
_02031A2A:
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #5
	blo _02031A10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020319F8

	thumb_func_start sub_02031A38
sub_02031A38: ; 0x02031A38
	ldr r2, _02031A4C ; =0x00000B74
	ldr r3, [r0, r2]
	add r1, r3, r1
	str r1, [r0, r2]
	ldr r3, [r0, r2]
	ldr r1, _02031A50 ; =0x0001869F
	cmp r3, r1
	ble _02031A4A
	str r1, [r0, r2]
_02031A4A:
	bx lr
	.balign 4, 0
_02031A4C: .word 0x00000B74
_02031A50: .word 0x0001869F
	thumb_func_end sub_02031A38

	thumb_func_start sub_02031A54
sub_02031A54: ; 0x02031A54
	ldr r2, _02031A68 ; =0x00000B74
	ldr r3, [r0, r2]
	sub r1, r3, r1
	str r1, [r0, r2]
	ldr r1, [r0, r2]
	cmp r1, #0
	bge _02031A66
	mov r1, #0
	str r1, [r0, r2]
_02031A66:
	bx lr
	.balign 4, 0
_02031A68: .word 0x00000B74
	thumb_func_end sub_02031A54

	thumb_func_start sub_02031A6C
sub_02031A6C: ; 0x02031A6C
	ldr r1, _02031A74 ; =0x00000B74
	ldr r0, [r0, r1]
	bx lr
	nop
_02031A74: .word 0x00000B74
	thumb_func_end sub_02031A6C

	thumb_func_start sub_02031A78
sub_02031A78: ; 0x02031A78
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x1b
	blt _02031A86
	bl GF_AssertFail
_02031A86:
	ldr r0, _02031A94 ; =0x00000B78
	ldr r0, [r5, r0]
	add r1, r0, #0
	lsr r1, r4
	mov r0, #1
	and r0, r1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02031A94: .word 0x00000B78
	thumb_func_end sub_02031A78

	thumb_func_start sub_02031A98
sub_02031A98: ; 0x02031A98
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x1b
	blt _02031AA6
	bl GF_AssertFail
_02031AA6:
	ldr r0, _02031AB4 ; =0x00000B78
	mov r1, #1
	ldr r2, [r5, r0]
	lsl r1, r4
	orr r1, r2
	str r1, [r5, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02031AB4: .word 0x00000B78
	thumb_func_end sub_02031A98

	thumb_func_start sub_02031AB8
sub_02031AB8: ; 0x02031AB8
	ldr r2, _02031AC8 ; =0x00000B7C
	ldrh r0, [r0, r2]
	add r2, r0, #0
	asr r2, r1
	mov r0, #1
	and r0, r2
	bx lr
	nop
_02031AC8: .word 0x00000B7C
	thumb_func_end sub_02031AB8

	thumb_func_start sub_02031ACC
sub_02031ACC: ; 0x02031ACC
	push {r3, r4}
	ldr r2, _02031AE0 ; =0x00000B7C
	mov r3, #1
	ldrh r4, [r0, r2]
	lsl r3, r1
	add r1, r4, #0
	orr r1, r3
	strh r1, [r0, r2]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02031AE0: .word 0x00000B7C
	thumb_func_end sub_02031ACC

	thumb_func_start sub_02031AE4
sub_02031AE4: ; 0x02031AE4
	ldr r1, _02031AEC ; =0x00000B7C
	mov r2, #0
	strh r2, [r0, r1]
	bx lr
	.balign 4, 0
_02031AEC: .word 0x00000B7C
	thumb_func_end sub_02031AE4

	thumb_func_start sub_02031AF0
sub_02031AF0: ; 0x02031AF0
	mov r0, #0x28
	bx lr
	thumb_func_end sub_02031AF0

	thumb_func_start sub_02031AF4
sub_02031AF4: ; 0x02031AF4
	ldr r3, _02031AFC ; =MIi_CpuFill8
	mov r1, #0
	mov r2, #0x28
	bx r3
	.balign 4, 0
_02031AFC: .word MIi_CpuFill8
	thumb_func_end sub_02031AF4

	thumb_func_start sub_02031B00
sub_02031B00: ; 0x02031B00
	ldr r3, _02031B08 ; =SavArray_get
	mov r1, #0x1d
	bx r3
	nop
_02031B08: .word SavArray_get
	thumb_func_end sub_02031B00

	thumb_func_start sub_02031B0C
sub_02031B0C: ; 0x02031B0C
	mov r0, #0x80
	bx lr
	thumb_func_end sub_02031B0C

	thumb_func_start sub_02031B10
sub_02031B10: ; 0x02031B10
	mov r0, #0x20
	bx lr
	thumb_func_end sub_02031B10

	thumb_func_start sub_02031B14
sub_02031B14: ; 0x02031B14
	ldr r3, _02031B1C ; =SavArray_get
	mov r1, #0x26
	bx r3
	nop
_02031B1C: .word SavArray_get
	thumb_func_end sub_02031B14

	thumb_func_start sub_02031B20
sub_02031B20: ; 0x02031B20
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x80
	bl MIi_CpuFill8
	add r0, r4, #0
	add r0, #0xc
	bl sub_02031B5C
	add r0, r4, #0
	bl sub_02031B3C
	pop {r4, pc}
	thumb_func_end sub_02031B20

	thumb_func_start sub_02031B3C
sub_02031B3C: ; 0x02031B3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x20
_02031B44:
	add r0, r5, #0
	bl sub_020325CC
	add r4, r4, #1
	add r5, #0x20
	cmp r4, #3
	blt _02031B44
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02031B3C

	thumb_func_start sub_02031B54
sub_02031B54: ; 0x02031B54
	ldr r3, _02031B58 ; =sub_02031B20
	bx r3
	.balign 4, 0
_02031B58: .word sub_02031B20
	thumb_func_end sub_02031B54

	thumb_func_start sub_02031B5C
sub_02031B5C: ; 0x02031B5C
	ldr r3, _02031B64 ; =MIi_CpuFill8
	mov r1, #0
	mov r2, #8
	bx r3
	.balign 4, 0
_02031B64: .word MIi_CpuFill8
	thumb_func_end sub_02031B5C

	thumb_func_start sub_02031B68
sub_02031B68: ; 0x02031B68
	push {r3, lr}
	cmp r1, #7
	blt _02031B76
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_02031B76:
	ldrb r3, [r0, r1]
	add r2, r2, r3
	cmp r2, #0x63
	ble _02031B82
	mov r2, #0x63
	b _02031B82
_02031B82:
	strb r2, [r0, r1]
	ldrb r0, [r0, r1]
	pop {r3, pc}
	thumb_func_end sub_02031B68

	thumb_func_start sub_02031B88
sub_02031B88: ; 0x02031B88
	push {r3, lr}
	cmp r1, #7
	blt _02031B96
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_02031B96:
	ldrb r3, [r0, r1]
	cmp r3, r2
	blo _02031BA0
	sub r2, r3, r2
	strb r2, [r0, r1]
_02031BA0:
	ldrb r0, [r0, r1]
	pop {r3, pc}
	thumb_func_end sub_02031B88

	thumb_func_start sub_02031BA4
sub_02031BA4: ; 0x02031BA4
	push {r3, lr}
	cmp r1, #7
	blt _02031BB2
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_02031BB2:
	ldrb r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02031BA4

	thumb_func_start sub_02031BB8
sub_02031BB8: ; 0x02031BB8
	push {r3, lr}
	ldrb r3, [r0, r1]
	cmp r3, r2
	bhs _02031BC6
	bl GF_AssertFail
	pop {r3, pc}
_02031BC6:
	strb r1, [r0, #8]
	strb r2, [r0, #7]
	bl sub_02031B88
	pop {r3, pc}
	thumb_func_end sub_02031BB8

	thumb_func_start sub_02031BD0
sub_02031BD0: ; 0x02031BD0
	ldrb r0, [r0, #7]
	bx lr
	thumb_func_end sub_02031BD0

	thumb_func_start sub_02031BD4
sub_02031BD4: ; 0x02031BD4
	ldrb r0, [r0, #8]
	cmp r0, #7
	blo _02031BDE
	mov r0, #4
	bx lr
_02031BDE:
	lsl r1, r0, #1
	ldr r0, _02031BE8 ; =0x020F68D0
	ldrh r0, [r0, r1]
	bx lr
	nop
_02031BE8: .word 0x020F68D0
	thumb_func_end sub_02031BD4

	thumb_func_start sub_02031BEC
sub_02031BEC: ; 0x02031BEC
	ldr r3, [r0, #0x1c]
	ldr r2, _02031BFC ; =0x3FFFFFFF
	lsl r1, r1, #0x1e
	and r2, r3
	orr r1, r2
	str r1, [r0, #0x1c]
	bx lr
	nop
_02031BFC: .word 0x3FFFFFFF
	thumb_func_end sub_02031BEC

	thumb_func_start sub_02031C00
sub_02031C00: ; 0x02031C00
	ldr r0, [r0, #0x1c]
	lsr r0, r0, #0x1e
	bx lr
	.balign 4, 0
	thumb_func_end sub_02031C00

	thumb_func_start sub_02031C08
sub_02031C08: ; 0x02031C08
	push {r3, r4}
	ldrh r4, [r0, #0xa]
	mov r3, #0
	add r2, r3, #0
	mov r1, #7
_02031C12:
	add r0, r4, #0
	tst r0, r1
	beq _02031C1E
	add r0, r3, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
_02031C1E:
	lsl r0, r4, #0xd
	add r2, r2, #1
	lsr r4, r0, #0x10
	cmp r2, #5
	blt _02031C12
	add r0, r3, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02031C08

	thumb_func_start sub_02031C30
sub_02031C30: ; 0x02031C30
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldrh r6, [r5, #0xa]
	cmp r4, #7
	blt _02031C44
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
_02031C44:
	mov r3, #0
	mov r1, #7
_02031C48:
	add r0, r6, #0
	tst r0, r1
	beq _02031C54
	lsl r0, r6, #0xd
	lsr r6, r0, #0x10
	b _02031C96
_02031C54:
	add r6, r4, #1
	mov r0, #7
	and r0, r6
	lsl r6, r3, #1
	add r3, r3, r6
	lsl r0, r3
	lsl r0, r0, #0x10
	ldrh r1, [r5, #0xa]
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r5, #0xa]
	mov r0, #2
	ldrh r1, [r5, #0xa]
	lsl r0, r0, #0xe
	orr r0, r1
	strh r0, [r5, #0xa]
	str r2, [r5, #0x14]
	ldrb r0, [r5, #9]
	cmp r0, #0
	bne _02031C7E
	str r2, [r5, #0x18]
_02031C7E:
	mov r0, #3
	ldr r1, [r5, #0x1c]
	lsl r0, r0, #0x1e
	and r0, r1
	str r0, [r5, #0x1c]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl sub_02031B88
	mov r0, #1
	pop {r4, r5, r6, pc}
_02031C96:
	add r3, r3, #1
	cmp r3, #5
	blt _02031C48
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02031C30

	thumb_func_start sub_02031CA0
sub_02031CA0: ; 0x02031CA0
	push {r4, lr}
	add r4, r0, #0
	bl sub_02031C08
	cmp r0, #0
	bne _02031CB0
	mov r0, #0
	pop {r4, pc}
_02031CB0:
	ldr r0, [r4, #0x1c]
	lsl r0, r0, #2
	lsr r0, r0, #2
	cmp r0, #0x32
	bhs _02031CBE
	mov r0, #1
	pop {r4, pc}
_02031CBE:
	cmp r0, #0x50
	bhs _02031CC6
	mov r0, #2
	pop {r4, pc}
_02031CC6:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02031CA0

	thumb_func_start sub_02031CCC
sub_02031CCC: ; 0x02031CCC
	mov r2, #0xa
	mul r2, r1
	ldrb r1, [r0, #9]
	cmp r1, #0
	beq _02031CE6
	ldrb r1, [r0, #0xe]
	add r1, r1, r2
	cmp r1, #0xff
	ble _02031CE4
	mov r1, #0xff
	strb r1, [r0, #0xe]
	bx lr
_02031CE4:
	strb r1, [r0, #0xe]
_02031CE6:
	bx lr
	thumb_func_end sub_02031CCC

	thumb_func_start sub_02031CE8
sub_02031CE8: ; 0x02031CE8
	ldrb r0, [r0, #9]
	bx lr
	thumb_func_end sub_02031CE8

	thumb_func_start sub_02031CEC
sub_02031CEC: ; 0x02031CEC
	push {r3, r4, r5, lr}
	add r5, r2, #0
	cmp r1, #9
	blt _02031CF6
	mov r1, #0
_02031CF6:
	cmp r1, #4
	bgt _02031D12
	ldr r0, _02031D68 ; =0x020F6902
	lsl r2, r1, #3
	add r1, r0, r2
	ldrh r0, [r0, r2]
	strh r0, [r5]
	ldrh r0, [r1, #2]
	strh r0, [r5, #2]
	ldrh r0, [r1, #4]
	strh r0, [r5, #4]
	ldrh r0, [r1, #6]
	strh r0, [r5, #6]
	b _02031D64
_02031D12:
	cmp r1, #7
	bgt _02031D44
	sub r1, r1, #5
	add r0, #0x38
	lsl r1, r1, #5
	add r4, r0, r1
	add r0, r4, #0
	bl sub_02031D80
	cmp r0, #0
	bne _02031D32
	add r0, r5, #0
	bl sub_02031B5C
	mov r0, #0
	pop {r3, r4, r5, pc}
_02031D32:
	ldrh r0, [r4]
	strh r0, [r5]
	ldrh r0, [r4, #2]
	strh r0, [r5, #2]
	ldrh r0, [r4, #4]
	strh r0, [r5, #4]
	ldrh r0, [r4, #6]
	strh r0, [r5, #6]
	b _02031D64
_02031D44:
	ldrb r1, [r0, #9]
	cmp r1, #0
	bne _02031D54
	add r0, r5, #0
	bl sub_02031B5C
	mov r0, #0
	pop {r3, r4, r5, pc}
_02031D54:
	ldrh r1, [r0, #0xc]
	strh r1, [r5]
	ldrh r1, [r0, #0xe]
	strh r1, [r5, #2]
	ldrh r1, [r0, #0x10]
	strh r1, [r5, #4]
	ldrh r0, [r0, #0x12]
	strh r0, [r5, #6]
_02031D64:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02031D68: .word 0x020F6902
	thumb_func_end sub_02031CEC

	thumb_func_start sub_02031D6C
sub_02031D6C: ; 0x02031D6C
	push {r3, lr}
	bl sub_02031D80
	cmp r0, #0
	beq _02031D7A
	mov r0, #1
	pop {r3, pc}
_02031D7A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02031D6C

	thumb_func_start sub_02031D80
sub_02031D80: ; 0x02031D80
	mov r3, #0
	add r2, r3, #0
_02031D84:
	add r1, r0, r2
	ldrb r1, [r1, #3]
	add r2, r2, #1
	add r1, r3, r1
	lsl r1, r1, #0x10
	lsr r3, r1, #0x10
	cmp r2, #5
	blt _02031D84
	cmp r3, #0x64
	bls _02031D9A
	mov r3, #0x64
_02031D9A:
	lsl r0, r3, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end sub_02031D80

	thumb_func_start sub_02031DA0
sub_02031DA0: ; 0x02031DA0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r1, #0
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #0
	mov r2, #0xe
	bl MIi_CpuFill8
	add r0, sp, #4
	add r0, #2
	mov r1, #0
	mov r2, #0xa
	bl MIi_CpuFill8
	mov r0, #0
	add r1, sp, #4
	str r0, [sp]
	add r1, #2
_02031DC6:
	add r2, r4, r0
	ldrb r2, [r2, #3]
	strb r0, [r1]
	strb r2, [r1, #1]
	cmp r2, #0
	beq _02031DDC
	ldr r2, [sp]
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	str r2, [sp]
_02031DDC:
	add r0, r0, #1
	add r1, r1, #2
	cmp r0, #5
	blt _02031DC6
	ldr r0, [sp]
	cmp r0, #0
	beq _02031E3C
	add r0, sp, #4
	add r0, #2
	mov r7, #0
	mov ip, r0
_02031DF2:
	add r5, r7, #1
	cmp r5, #5
	bge _02031E34
	lsl r2, r5, #1
	mov r1, ip
	add r1, r1, r2
	add r2, sp, #4
_02031E00:
	ldrb r4, [r1, #1]
	ldrb r3, [r0, #1]
	cmp r3, r4
	bhi _02031E2C
	cmp r3, r4
	bne _02031E14
	ldrb r4, [r0]
	ldrb r3, [r1]
	cmp r4, r3
	blo _02031E2C
_02031E14:
	ldrb r3, [r0]
	strb r3, [r2]
	ldrb r3, [r0, #1]
	strb r3, [r2, #1]
	ldrb r3, [r1]
	strb r3, [r0]
	ldrb r3, [r1, #1]
	strb r3, [r0, #1]
	ldrb r3, [r2]
	strb r3, [r1]
	ldrb r3, [r2, #1]
	strb r3, [r1, #1]
_02031E2C:
	add r5, r5, #1
	add r1, r1, #2
	cmp r5, #5
	blt _02031E00
_02031E34:
	add r7, r7, #1
	add r0, r0, #2
	cmp r7, #5
	blt _02031DF2
_02031E3C:
	add r0, sp, #4
	ldrb r5, [r0, #0xb]
	add r3, sp, #4
	add r0, r6, #0
	mov r4, #0
	add r3, #2
	add r0, #0xb
_02031E4A:
	ldrb r2, [r3]
	add r1, r6, r4
	strb r2, [r1, #6]
	ldrb r1, [r3, #1]
	cmp r5, r1
	bne _02031E5C
	ldrb r1, [r0]
	add r1, r1, #1
	strb r1, [r0]
_02031E5C:
	add r4, r4, #1
	add r3, r3, #2
	cmp r4, #5
	blt _02031E4A
	ldr r0, [sp]
	strb r0, [r6, #0xc]
	ldr r0, [sp]
	cmp r0, #5
	bls _02031E70
	b _02031FDC
_02031E70:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02031E7C: ; jump table
	.short _02031E88 - _02031E7C - 2 ; case 0
	.short _02031E98 - _02031E7C - 2 ; case 1
	.short _02031EB2 - _02031E7C - 2 ; case 2
	.short _02031ED6 - _02031E7C - 2 ; case 3
	.short _02031EFA - _02031E7C - 2 ; case 4
	.short _02031EFA - _02031E7C - 2 ; case 5
_02031E88:
	ldrh r1, [r6]
	mov r0, #0xf
	add sp, #0x10
	bic r1, r0
	mov r0, #6
	orr r0, r1
	strh r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02031E98:
	add r1, sp, #4
	add r0, r6, #0
	add r1, #2
	mov r2, #0
	bl sub_02032588
	ldrh r1, [r6, #2]
	mov r0, #0xf
	bic r1, r0
	mov r0, #6
	orr r0, r1
	strh r0, [r6, #2]
	b _02031FDC
_02031EB2:
	add r1, sp, #4
	add r0, r6, #0
	add r1, #2
	mov r2, #0
	bl sub_02032588
	add r0, r6, #2
	add r1, sp, #8
	mov r2, #1
	bl sub_02032588
	ldrh r1, [r6, #4]
	mov r0, #0xf
	bic r1, r0
	mov r0, #6
	orr r0, r1
	strh r0, [r6, #4]
	b _02031FDC
_02031ED6:
	add r1, sp, #4
	add r0, r6, #0
	add r1, #2
	mov r2, #0
	bl sub_02032588
	add r0, r6, #2
	add r1, sp, #8
	mov r2, #1
	bl sub_02032588
	add r1, sp, #8
	add r0, r6, #4
	add r1, #2
	mov r2, #2
	bl sub_02032588
	b _02031FDC
_02031EFA:
	add r0, sp, #4
	ldrb r2, [r0, #3]
	ldrb r1, [r0, #9]
	sub r1, r2, r1
	cmp r1, #0xc
	bgt _02031F88
	ldrh r3, [r6]
	mov r2, #0xf
	mov r1, #5
	bic r3, r2
	orr r1, r3
	strh r1, [r6]
	ldrb r3, [r0, #3]
	ldrh r1, [r6]
	ldr r4, _02031FE4 ; =0xFFFF00FF
	lsl r3, r3, #0x18
	and r1, r4
	lsr r3, r3, #0x10
	orr r1, r3
	strh r1, [r6]
	ldrh r1, [r6, #2]
	mov r3, #6
	bic r1, r2
	orr r1, r3
	strh r1, [r6, #2]
	ldrb r5, [r0, #5]
	ldrh r1, [r6, #2]
	lsl r5, r5, #0x18
	and r1, r4
	lsr r5, r5, #0x10
	orr r1, r5
	strh r1, [r6, #2]
	ldrh r1, [r6, #4]
	bic r1, r2
	orr r1, r3
	strh r1, [r6, #4]
	ldrh r1, [r6, #4]
	add r2, r1, #0
	ldrb r1, [r0, #7]
	and r2, r4
	lsl r1, r1, #0x18
	lsr r1, r1, #0x10
	orr r1, r2
	strh r1, [r6, #4]
	mov r1, #1
	strb r1, [r6, #0xc]
	ldrb r0, [r0, #3]
	cmp r0, #0x14
	bls _02031F6A
	ldrh r1, [r6]
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x30
	orr r0, r1
	strh r0, [r6]
	b _02031FDC
_02031F6A:
	cmp r0, #7
	ldrh r1, [r6]
	bls _02031F7C
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x20
	orr r0, r1
	strh r0, [r6]
	b _02031FDC
_02031F7C:
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strh r0, [r6]
	b _02031FDC
_02031F88:
	add r1, sp, #4
	add r0, r6, #0
	add r1, #2
	mov r2, #0
	bl sub_02032588
	add r0, r6, #2
	add r1, sp, #8
	mov r2, #1
	bl sub_02032588
	ldr r0, [sp]
	cmp r0, #4
	bne _02031FB2
	add r1, sp, #0xc
	add r0, r6, #4
	add r1, #2
	mov r2, #2
	bl sub_02032588
	b _02031FDC
_02031FB2:
	ldrh r1, [r6, #4]
	mov r0, #0xf
	bic r1, r0
	mov r0, #5
	orr r0, r1
	strh r0, [r6, #4]
	ldrh r1, [r6, #4]
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strh r0, [r6, #4]
	ldrh r1, [r6, #4]
	ldr r0, _02031FE4 ; =0xFFFF00FF
	and r1, r0
	add r0, sp, #4
	ldrb r0, [r0, #7]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r6, #4]
_02031FDC:
	ldr r0, [sp]
	strb r0, [r6, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02031FE4: .word 0xFFFF00FF
	thumb_func_end sub_02031DA0

	thumb_func_start sub_02031FE8
sub_02031FE8: ; 0x02031FE8
	push {r3, lr}
	sub sp, #0x10
	add r1, sp, #0
	bl sub_02031DA0
	add r0, sp, #0
	ldrh r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #5
	blo _02032000
	mov r0, #5
_02032000:
	add sp, #0x10
	pop {r3, pc}
	thumb_func_end sub_02031FE8

	thumb_func_start sub_02032004
sub_02032004: ; 0x02032004
	push {r3, lr}
	sub sp, #0x10
	add r1, sp, #0
	bl sub_02031DA0
	add r0, sp, #0
	ldrb r1, [r0, #0xc]
	cmp r1, #0
	bne _0203201C
	add sp, #0x10
	mov r0, #0
	pop {r3, pc}
_0203201C:
	ldrb r0, [r0, #6]
	add r0, r0, #1
	add sp, #0x10
	pop {r3, pc}
	thumb_func_end sub_02032004

	thumb_func_start sub_02032024
sub_02032024: ; 0x02032024
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _02032032
	mov r0, #0
	pop {r4, pc}
_02032032:
	sub r0, r0, #1
	strb r0, [r4, #9]
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _02032054
	add r0, r4, #0
	add r0, #0xc
	bl sub_02031B5C
	mov r0, #0
	str r0, [r4, #0x18]
	str r0, [r4, #0x14]
	mov r0, #3
	ldr r1, [r4, #0x1c]
	lsl r0, r0, #0x1e
	and r0, r1
	str r0, [r4, #0x1c]
_02032054:
	ldrb r0, [r4, #9]
	pop {r4, pc}
	thumb_func_end sub_02032024

	thumb_func_start sub_02032058
sub_02032058: ; 0x02032058
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0xa]
	add r4, r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	bne _0203206C
	ldrb r0, [r5, #9]
	cmp r0, #0
	beq _020320D8
_0203206C:
	ldr r0, [r5, #0x18]
	sub r6, r4, r0
	cmp r6, #0x64
	blo _02032094
	add r0, r6, #0
	mov r1, #0x64
	bl _u32_div_f
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02032340
	add r0, r6, #0
	mov r1, #0x64
	bl _u32_div_f
	sub r0, r4, r1
	str r0, [r5, #0x18]
_02032094:
	ldrh r0, [r5, #0xa]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	beq _020320D8
	ldr r1, [r5, #0x1c]
	mov r0, #3
	lsl r0, r0, #0x1e
	add r2, r1, #0
	and r2, r0
	ldr r0, [r5, #0x14]
	sub r1, r4, r0
	ldr r0, _020320DC ; =0x3FFFFFFF
	and r0, r1
	orr r0, r2
	str r0, [r5, #0x1c]
	lsl r0, r0, #2
	lsr r0, r0, #2
	cmp r0, #0x64
	blo _020320D8
	ldrb r0, [r5, #9]
	cmp r0, #0
	beq _020320CA
	add r0, r5, #0
	mov r1, #3
	bl sub_02031BEC
	b _020320D2
_020320CA:
	add r0, r5, #0
	mov r1, #2
	bl sub_02031BEC
_020320D2:
	add r0, r5, #0
	bl sub_02032354
_020320D8:
	pop {r4, r5, r6, pc}
	nop
_020320DC: .word 0x3FFFFFFF
	thumb_func_end sub_02032058

	thumb_func_start sub_020320E0
sub_020320E0: ; 0x020320E0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r0, r3, #0
	mov r1, #0x20
	add r6, r2, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl MIi_CpuFill8
	add r0, r5, #0
	bl PlayerProfile_GetTrainerID
	str r0, [r4]
	add r0, r5, #0
	bl PlayerProfile_GetTrainerGender
	strb r0, [r4, #4]
	add r0, r5, #0
	bl sub_02029088
	strb r0, [r4, #5]
	add r0, r5, #0
	bl sub_0202907C
	strb r0, [r4, #6]
	add r0, r4, #0
	add r0, #8
	mov r1, #8
	bl StringFillEOS
	add r0, r5, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r4, #0
	add r0, #8
	mov r2, #7
	bl CopyU16StringArrayN
	add r2, r4, #0
	add r0, r7, #0
	mov r1, #8
	add r2, #0x18
	bl sub_02031CEC
	ldr r0, _02032154 ; =0x0000FFFF
	cmp r6, r0
	bls _0203214C
	strh r0, [r4, #0x18]
	b _0203214E
_0203214C:
	strh r6, [r4, #0x18]
_0203214E:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02032154: .word 0x0000FFFF
	thumb_func_end sub_020320E0

	thumb_func_start sub_02032158
sub_02032158: ; 0x02032158
	push {r3, lr}
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	beq _02032166
	mov r0, #0
	pop {r3, pc}
_02032166:
	ldrb r3, [r0, #4]
	ldrb r2, [r1, #4]
	cmp r3, r2
	beq _02032172
	mov r0, #0
	pop {r3, pc}
_02032172:
	ldrb r3, [r0, #6]
	ldrb r2, [r1, #6]
	cmp r3, r2
	beq _0203217E
	mov r0, #0
	pop {r3, pc}
_0203217E:
	ldrb r3, [r0, #5]
	ldrb r2, [r1, #5]
	cmp r3, r2
	beq _0203218A
	mov r0, #0
	pop {r3, pc}
_0203218A:
	add r0, #8
	add r1, #8
	bl StringNotEqual
	cmp r0, #0
	bne _0203219A
	mov r0, #1
	pop {r3, pc}
_0203219A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02032158

	thumb_func_start sub_020321A0
sub_020321A0: ; 0x020321A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r4, #0
	add r5, r0, #0
	str r0, [sp]
	add r7, r1, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0x10]
	add r5, #0x38
_020321B4:
	add r0, r5, #0
	bl sub_02031D6C
	cmp r0, #0
	beq _020321CC
	ldr r0, [sp, #0x10]
	add r4, r4, #1
	add r0, r0, #1
	add r5, #0x20
	str r0, [sp, #0x10]
	cmp r4, #3
	blt _020321B4
_020321CC:
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _020322A6
_020321D6:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r1, r0
	beq _02032298
	add r0, r7, #0
	add r0, #0x18
	bl sub_02031D6C
	cmp r0, #0
	beq _02032298
	mov r4, #0
	str r4, [sp, #0x14]
	ldr r5, [sp]
	ldr r6, [sp, #0x14]
	add r5, #0x20
_020321F4:
	add r0, r7, #0
	add r1, r5, #0
	bl sub_02032158
	cmp r0, #0
	beq _0203220A
	lsl r0, r6, #0x18
	lsr r4, r0, #0x18
	mov r0, #1
	str r0, [sp, #0x14]
	b _02032212
_0203220A:
	add r6, r6, #1
	add r5, #0x20
	cmp r6, #3
	blt _020321F4
_02032212:
	ldr r0, [sp, #0x10]
	cmp r0, #3
	blt _02032222
	mov r0, #2
	mov ip, r0
	mov r0, #1
	str r0, [sp, #0x14]
	b _02032242
_02032222:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _02032234
	ldr r0, [sp, #0x10]
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov ip, r0
	b _02032242
_02032234:
	ldr r0, [sp, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov ip, r0
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
_02032242:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0203227C
	mov r0, ip
	cmp r4, r0
	bhs _0203227C
	ldr r0, [sp, #0x10]
	sub r6, r0, #1
	cmp r4, r6
	bge _0203227C
	ldr r0, [sp]
	lsl r1, r4, #5
	add r5, r0, r1
_0203225C:
	add r3, r5, #0
	add r2, r5, #0
	add r3, #0x40
	add r2, #0x20
	add r5, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	add r4, r4, #1
	stmia r2!, {r0, r1}
	cmp r4, r6
	blt _0203225C
_0203227C:
	mov r0, ip
	lsl r1, r0, #5
	ldr r0, [sp]
	add r3, r7, #0
	add r2, r0, r1
	add r2, #0x20
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
_02032298:
	ldr r0, [sp, #0xc]
	add r7, #0x20
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _020321D6
_020322A6:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020321A0

	thumb_func_start sub_020322AC
sub_020322AC: ; 0x020322AC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r4, r0, #0
	add r5, r1, #0
	mov r0, #9
	add r1, r7, #0
	bl String_ctor
	add r6, r0, #0
	cmp r5, #5
	bge _020322E2
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x15
	add r3, r7, #0
	bl NewMsgDataFromNarc
	add r5, #0xe
	add r4, r0, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ReadMsgDataIntoString
	add r0, r4, #0
	bl DestroyMsgData
	b _02032304
_020322E2:
	cmp r5, #8
	bge _02032304
	sub r0, r5, #5
	lsl r0, r0, #0x18
	lsr r5, r0, #0x13
	add r0, r4, #0
	add r0, #0x38
	add r0, r0, r5
	bl sub_02031D6C
	cmp r0, #0
	beq _02032304
	add r4, #0x28
	add r0, r6, #0
	add r1, r4, r5
	bl CopyU16ArrayToString
_02032304:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020322AC

	thumb_func_start sub_02032308
sub_02032308: ; 0x02032308
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r2, #0
	add r2, sp, #0
	bl sub_02031CEC
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x15
	add r3, r4, #0
	bl NewMsgDataFromNarc
	add r5, r0, #0
	add r0, sp, #0
	bl sub_02032004
	add r1, r0, #0
	add r0, r5, #0
	add r1, #0x13
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, #0
	bl DestroyMsgData
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02032308

	thumb_func_start sub_02032340
sub_02032340: ; 0x02032340
	ldrb r2, [r0, #0xe]
	add r1, r2, r1
	cmp r1, #0xff
	ble _0203234E
	mov r1, #0xff
	strb r1, [r0, #0xe]
	bx lr
_0203234E:
	strb r1, [r0, #0xe]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02032340

	thumb_func_start sub_02032354
sub_02032354: ; 0x02032354
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp]
	ldrh r0, [r0, #0xa]
	add r1, sp, #0x34
	add r1, #1
	str r0, [sp, #0x14]
	ldr r0, [sp]
	add r0, #0xc
	bl sub_020324F4
	mov r0, #0
	str r0, [sp, #0x28]
_0203236E:
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	mov r1, #7
	and r0, r1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	bne _02032380
	b _020324CA
_02032380:
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x1c]
	sub r0, r1, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	add r1, sp, #0x30
_02032398:
	strb r0, [r1]
	add r0, r0, #1
	add r1, r1, #1
	cmp r0, #5
	blt _02032398
	mov r0, #0
	add r2, sp, #0x30
	add r7, sp, #0x34
	str r0, [sp, #4]
	add r7, #1
	mov ip, r2
_020323AE:
	ldr r0, [sp, #4]
	add r1, r0, #1
	cmp r1, #5
	bge _020323DE
	mov r0, ip
	add r3, r0, r1
_020323BA:
	mov r0, #0
	mov r5, #0
	ldrsb r4, [r3, r0]
	ldrsb r5, [r2, r5]
	ldrsb r0, [r7, r4]
	ldrsb r6, [r7, r5]
	cmp r6, r0
	bgt _020323D6
	cmp r6, r0
	bne _020323D2
	cmp r5, r4
	blt _020323D6
_020323D2:
	strb r4, [r2]
	strb r5, [r3]
_020323D6:
	add r1, r1, #1
	add r3, r3, #1
	cmp r1, #5
	blt _020323BA
_020323DE:
	ldr r0, [sp, #4]
	add r2, r2, #1
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #2
	blt _020323AE
	ldr r0, [sp, #0x20]
	ldr r2, _020324F0 ; =0x020F68DE
	lsl r1, r0, #2
	add r0, r0, r1
	add r1, r2, r0
	add r2, sp, #0x34
	mov r4, #0
	add r3, sp, #0x30
	ldrsb r0, [r3, r4]
	add r2, #1
	str r0, [sp, #8]
	add r0, r2, r0
	str r0, [sp, #0xc]
	mov r0, #1
	ldrsb r7, [r3, r0]
	add r0, r2, r7
	str r0, [sp, #0x2c]
_0203240C:
	mov r0, #0
	ldrsb r5, [r1, r0]
	ldrsb r3, [r2, r0]
	add r0, r3, r5
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	cmp r5, #0
	ble _0203243E
	ldr r6, [sp, #0xc]
	mov r5, #0
	ldrsb r5, [r6, r5]
	cmp r5, #0
	beq _0203243E
	ldr r5, [sp, #8]
	cmp r5, r4
	beq _0203243E
	ldr r5, [sp, #0x2c]
	mov r6, #0
	ldrsb r5, [r5, r6]
	cmp r5, #0
	beq _0203243E
	cmp r7, r4
	beq _0203243E
	mov r5, #1
	str r5, [sp, #0x10]
_0203243E:
	cmp r0, #0x3f
	blt _02032446
	mov r0, #0x3f
	b _0203244C
_02032446:
	cmp r0, #0
	bge _0203244C
	mov r0, #0
_0203244C:
	ldr r5, [sp, #0x20]
	cmp r5, #6
	beq _02032456
	cmp r0, r3
	bgt _02032468
_02032456:
	ldr r3, [sp, #0x1c]
	cmp r0, r3
	ble _02032468
	lsl r3, r0, #0x18
	lsr r3, r3, #0x18
	str r3, [sp, #0x1c]
	lsl r3, r4, #0x18
	lsr r3, r3, #0x18
	str r3, [sp, #0x18]
_02032468:
	strb r0, [r2]
	ldr r3, [sp, #0x24]
	add r4, r4, #1
	add r0, r3, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x24]
	add r1, r1, #1
	add r2, r2, #1
	cmp r4, #5
	blt _0203240C
	ldr r0, [sp, #0x14]
	lsl r0, r0, #0xd
	lsr r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0203249E
	ldr r0, [sp]
	ldrb r1, [r0, #0xe]
	cmp r1, #0xa
	bhs _0203249A
	mov r1, #0
	strb r1, [r0, #0xe]
	b _0203249E
_0203249A:
	sub r1, #0xa
	strb r1, [r0, #0xe]
_0203249E:
	ldr r0, [sp, #0x20]
	cmp r0, #5
	beq _020324BE
	ldr r0, [sp, #0x24]
	cmp r0, #0x64
	bls _020324BE
	add r2, sp, #0x34
	ldr r0, [sp, #0x18]
	add r2, #1
	ldrsb r1, [r2, r0]
	ldr r0, [sp, #0x24]
	sub r0, #0x64
	str r0, [sp, #0x24]
	sub r1, r1, r0
	ldr r0, [sp, #0x18]
	strb r1, [r2, r0]
_020324BE:
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #5
	bge _020324CA
	b _0203236E
_020324CA:
	mov r4, #0
	add r3, sp, #0x34
	add r3, #1
	add r1, r4, #0
_020324D2:
	ldrsb r2, [r3, r1]
	ldr r0, [sp]
	add r3, r3, #1
	add r0, r0, r4
	add r4, r4, #1
	strb r2, [r0, #0xf]
	cmp r4, #5
	blt _020324D2
	ldr r0, [sp]
	mov r1, #3
	strb r1, [r0, #9]
	mov r1, #0
	strh r1, [r0, #0xa]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020324F0: .word 0x020F68DE
	thumb_func_end sub_02032354

	thumb_func_start sub_020324F4
sub_020324F4: ; 0x020324F4
	mov r3, #0
_020324F6:
	add r2, r0, r3
	ldrb r2, [r2, #3]
	strb r2, [r1, r3]
	add r3, r3, #1
	cmp r3, #5
	blt _020324F6
	bx lr
	thumb_func_end sub_020324F4

	thumb_func_start sub_02032504
sub_02032504: ; 0x02032504
	cmp r1, #0
	bne _0203250C
	mov r0, #0
	bx lr
_0203250C:
	cmp r0, #0
	beq _0203251A
	cmp r0, #1
	beq _0203254A
	cmp r0, #2
	beq _0203256A
	b _02032582
_0203251A:
	cmp r1, #0x3e
	bls _02032522
	mov r0, #6
	bx lr
_02032522:
	cmp r1, #0x32
	bls _0203252A
	mov r0, #5
	bx lr
_0203252A:
	cmp r1, #0x28
	bls _02032532
	mov r0, #4
	bx lr
_02032532:
	cmp r1, #0x1e
	bls _0203253A
	mov r0, #3
	bx lr
_0203253A:
	cmp r1, #0x14
	bls _02032542
	mov r0, #2
	bx lr
_02032542:
	cmp r1, #0
	beq _02032582
	mov r0, #1
	bx lr
_0203254A:
	cmp r1, #0x28
	bls _02032552
	mov r0, #4
	bx lr
_02032552:
	cmp r1, #0x1e
	bls _0203255A
	mov r0, #3
	bx lr
_0203255A:
	cmp r1, #0x14
	bls _02032562
	mov r0, #2
	bx lr
_02032562:
	cmp r1, #0
	beq _02032582
	mov r0, #1
	bx lr
_0203256A:
	cmp r1, #0x14
	bls _02032572
	mov r0, #3
	bx lr
_02032572:
	cmp r1, #0xa
	bls _0203257A
	mov r0, #2
	bx lr
_0203257A:
	cmp r1, #0
	beq _02032582
	mov r0, #1
	bx lr
_02032582:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02032504

	thumb_func_start sub_02032588
sub_02032588: ; 0x02032588
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrh r0, [r4]
	ldrb r5, [r1]
	mov r3, #0xf
	bic r0, r3
	mov r3, #0xf
	and r3, r5
	orr r0, r3
	strh r0, [r4]
	ldrh r3, [r4]
	ldr r0, _020325C8 ; =0xFFFF00FF
	and r3, r0
	ldrb r0, [r1, #1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x10
	orr r0, r3
	strh r0, [r4]
	lsl r0, r2, #0x18
	ldrb r1, [r1, #1]
	lsr r0, r0, #0x18
	bl sub_02032504
	lsl r0, r0, #0x1c
	ldrh r2, [r4]
	mov r1, #0xf0
	lsr r0, r0, #0x18
	bic r2, r1
	orr r0, r2
	strh r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_020325C8: .word 0xFFFF00FF
	thumb_func_end sub_02032588

	thumb_func_start sub_020325CC
sub_020325CC: ; 0x020325CC
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x20
	bl MIi_CpuFill8
	add r0, r4, #0
	add r0, #0x18
	bl sub_02031B5C
	add r4, #8
	add r0, r4, #0
	mov r1, #8
	bl StringFillEOS
	pop {r4, pc}
	thumb_func_end sub_020325CC

	thumb_func_start sub_020325EC
sub_020325EC: ; 0x020325EC
	ldr r3, _020325F4 ; =SavArray_get
	mov r1, #0x27
	bx r3
	nop
_020325F4: .word SavArray_get
	thumb_func_end sub_020325EC

	thumb_func_start sub_020325F8
sub_020325F8: ; 0x020325F8
	mov r0, #0x4d
	lsl r0, r0, #2
	bx lr
	.balign 4, 0
	thumb_func_end sub_020325F8

	thumb_func_start sub_02032600
sub_02032600: ; 0x02032600
	push {r4, lr}
	add r4, r0, #0
	mov r2, #0x4d
	mov r0, #0
	add r1, r4, #0
	lsl r2, r2, #2
	bl MIi_CpuClearFast
	add r0, r4, #0
	mov r1, #0
	bl sub_02032744
	add r0, r4, #0
	mov r1, #1
	bl sub_02032744
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02032600

	thumb_func_start sub_02032624
sub_02032624: ; 0x02032624
	push {r3, r4, r5, lr}
	mov r1, #0x13
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	bl sub_02032600
	mov r0, #0x13
	lsl r0, r0, #4
	str r4, [r5, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02032624

	thumb_func_start sub_0203263C
sub_0203263C: ; 0x0203263C
	mov r1, #0x49
	lsl r1, r1, #2
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end sub_0203263C

	thumb_func_start sub_02032644
sub_02032644: ; 0x02032644
	mov r1, #0x49
	lsl r1, r1, #2
	ldrh r2, [r0, r1]
	add r2, r2, #1
	strh r2, [r0, r1]
	bx lr
	thumb_func_end sub_02032644

	thumb_func_start sub_02032650
sub_02032650: ; 0x02032650
	mov r3, #0x4a
	lsl r3, r3, #2
	str r1, [r0, r3]
	add r1, r3, #4
	ldr r1, [r0, r1]
	add r2, r1, r2
	add r1, r3, #4
	str r2, [r0, r1]
	ldr r1, [r0, r1]
	ldr r2, _02032670 ; =0x0098967F
	cmp r1, r2
	blo _0203266C
	add r1, r3, #4
	str r2, [r0, r1]
_0203266C:
	bx lr
	nop
_02032670: .word 0x0098967F
	thumb_func_end sub_02032650

	thumb_func_start sub_02032674
sub_02032674: ; 0x02032674
	push {r3, r4}
	mov r3, #0x4a
	lsl r3, r3, #2
	ldr r4, [r0, r3]
	str r4, [r1]
	add r1, r3, #4
	ldr r0, [r0, r1]
	str r0, [r2]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02032674

	thumb_func_start sub_02032688
sub_02032688: ; 0x02032688
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	cmp r5, #0
	bne _02032698
	bl GF_AssertFail
_02032698:
	ldrh r0, [r5]
	strh r0, [r4]
	ldrh r0, [r5, #2]
	strh r0, [r6]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02032688

	thumb_func_start sub_020326A4
sub_020326A4: ; 0x020326A4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	cmp r5, #0
	bne _020326B4
	bl GF_AssertFail
_020326B4:
	strh r4, [r5]
	strh r6, [r5, #2]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020326A4

	thumb_func_start sub_020326BC
sub_020326BC: ; 0x020326BC
	ldr r3, _020326C8 ; =sub_020D48B4
	add r2, r0, #0
	add r0, r1, #0
	add r1, r2, #4
	mov r2, #0x88
	bx r3
	.balign 4, 0
_020326C8: .word sub_020D48B4
	thumb_func_end sub_020326BC

	thumb_func_start sub_020326CC
sub_020326CC: ; 0x020326CC
	ldr r3, _020326D8 ; =MIi_CpuClearFast
	add r1, r0, #0
	mov r0, #0
	add r1, r1, #4
	mov r2, #0x88
	bx r3
	.balign 4, 0
_020326D8: .word MIi_CpuClearFast
	thumb_func_end sub_020326CC

	thumb_func_start sub_020326DC
sub_020326DC: ; 0x020326DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020326FC
	cmp r0, #0
	beq _020326F8
	add r0, r5, #4
	add r1, r4, #0
	mov r2, #0x88
	bl sub_020D48B4
	mov r0, #1
	pop {r3, r4, r5, pc}
_020326F8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020326DC

	thumb_func_start sub_020326FC
sub_020326FC: ; 0x020326FC
	mov r2, #0
_020326FE:
	add r1, r0, r2
	ldrb r1, [r1, #4]
	cmp r1, #0
	bne _0203270C
	add r2, r2, #1
	cmp r2, #0x88
	blt _020326FE
_0203270C:
	cmp r2, #0x88
	bne _02032714
	mov r0, #0
	bx lr
_02032714:
	mov r0, #1
	bx lr
	thumb_func_end sub_020326FC

	thumb_func_start sub_02032718
sub_02032718: ; 0x02032718
	add r0, #0xf8
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02032718

	thumb_func_start sub_02032720
sub_02032720: ; 0x02032720
	add r0, #0xf8
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02032720

	thumb_func_start sub_02032728
sub_02032728: ; 0x02032728
	add r0, #0xfc
	bx lr
	thumb_func_end sub_02032728

	thumb_func_start sub_0203272C
sub_0203272C: ; 0x0203272C
	cmp r1, #0x20
	blt _02032734
	mov r0, #0
	bx lr
_02032734:
	mov r2, #0x13
	lsl r2, r2, #4
	ldr r0, [r0, r2]
	add r2, r0, #0
	lsr r2, r1
	mov r0, #1
	and r0, r2
	bx lr
	thumb_func_end sub_0203272C

	thumb_func_start sub_02032744
sub_02032744: ; 0x02032744
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x20
	blt _02032752
	bl GF_AssertFail
_02032752:
	mov r0, #0x13
	lsl r0, r0, #4
	mov r1, #1
	ldr r2, [r5, r0]
	lsl r1, r4
	orr r1, r2
	str r1, [r5, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02032744

	thumb_func_start sub_02032764
sub_02032764: ; 0x02032764
	add r0, #0xfa
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02032764

	thumb_func_start sub_0203276C
sub_0203276C: ; 0x0203276C
	mov r1, #1
	add r0, #0xfa
	strh r1, [r0]
	bx lr
	thumb_func_end sub_0203276C

	thumb_func_start sub_02032774
sub_02032774: ; 0x02032774
	mov r0, #0xf
	lsl r0, r0, #8
	bx lr
	.balign 4, 0
	thumb_func_end sub_02032774

	thumb_func_start sub_0203277C
sub_0203277C: ; 0x0203277C
	ldr r3, _02032784 ; =SavArray_get
	mov r1, #0x28
	bx r3
	nop
_02032784: .word SavArray_get
	thumb_func_end sub_0203277C

	thumb_func_start sub_02032788
sub_02032788: ; 0x02032788
	push {r4, r5, r6, lr}
	mov r2, #0xf
	mov r1, #0
	lsl r2, r2, #8
	add r5, r0, #0
	bl MIi_CpuFill8
	mov r6, #6
	mov r4, #0
	lsl r6, r6, #6
_0203279C:
	add r0, r5, #0
	bl sub_020327DC
	add r4, r4, #1
	add r5, r5, r6
	cmp r4, #0xa
	blt _0203279C
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02032788

	thumb_func_start sub_020327AC
sub_020327AC: ; 0x020327AC
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x38
	bl MIi_CpuFill8
	add r4, #0x24
	add r0, r4, #0
	mov r1, #0xa
	bl StringFillEOS
	pop {r4, pc}
	thumb_func_end sub_020327AC

	thumb_func_start sub_020327C4
sub_020327C4: ; 0x020327C4
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x30
	bl MIi_CpuFill8
	add r4, #8
	add r0, r4, #0
	mov r1, #8
	bl StringFillEOS
	pop {r4, pc}
	thumb_func_end sub_020327C4

	thumb_func_start sub_020327DC
sub_020327DC: ; 0x020327DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020327C4
	mov r4, #0
	add r5, #0x30
_020327E8:
	add r0, r5, #0
	bl sub_020327AC
	add r4, r4, #1
	add r5, #0x38
	cmp r4, #6
	blt _020327E8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020327DC

	thumb_func_start sub_020327F8
sub_020327F8: ; 0x020327F8
	ldrh r0, [r0, #0x30]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	beq _02032804
	mov r0, #1
	bx lr
_02032804:
	mov r0, #0
	bx lr
	thumb_func_end sub_020327F8

	thumb_func_start sub_02032808
sub_02032808: ; 0x02032808
	push {r3, lr}
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	bne _0203282A
	ldrb r3, [r0, #6]
	ldrb r2, [r1, #6]
	cmp r3, r2
	bne _0203282A
	ldrb r3, [r0, #5]
	ldrb r2, [r1, #5]
	cmp r3, r2
	bne _0203282A
	ldrb r3, [r0, #7]
	ldrb r2, [r1, #7]
	cmp r3, r2
	beq _0203282E
_0203282A:
	mov r0, #0
	pop {r3, pc}
_0203282E:
	add r0, #8
	add r1, #8
	bl StringNotEqual
	cmp r0, #0
	bne _0203283E
	mov r0, #1
	pop {r3, pc}
_0203283E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02032808

	thumb_func_start sub_02032844
sub_02032844: ; 0x02032844
	ldr r1, _02032850 ; =0x021D4124
	ldr r2, [r1, #4]
	ldr r1, _02032854 ; =0x00001310
	str r0, [r2, r1]
	bx lr
	nop
_02032850: .word 0x021D4124
_02032854: .word 0x00001310
	thumb_func_end sub_02032844

	thumb_func_start sub_02032858
sub_02032858: ; 0x02032858
	ldr r1, _0203286C ; =0x021D4124
	ldr r3, [r1, #4]
	ldr r1, _02032870 ; =0x00001310
	ldr r2, [r3, r1]
	sub r2, #9
	cmp r2, #1
	bls _0203286A
	add r1, #0x20
	str r0, [r3, r1]
_0203286A:
	bx lr
	.balign 4, 0
_0203286C: .word 0x021D4124
_02032870: .word 0x00001310
	thumb_func_end sub_02032858

	thumb_func_start sub_02032874
sub_02032874: ; 0x02032874
	push {r3, lr}
	mov r0, #3
	bl sub_02032844
	ldr r1, _0203289C ; =0x021D4124
	ldr r0, _020328A0 ; =sub_020328A4
	ldr r1, [r1, #4]
	bl sub_020DF4F8
	cmp r0, #2
	beq _02032898
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	mov r0, #0
	pop {r3, pc}
_02032898:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0203289C: .word 0x021D4124
_020328A0: .word sub_020328A4
	thumb_func_end sub_02032874

	thumb_func_start sub_020328A4
sub_020328A4: ; 0x020328A4
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _020328B8
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r3, pc}
_020328B8:
	bl sub_020328C8
	cmp r0, #0
	bne _020328C6
	mov r0, #9
	bl sub_02032844
_020328C6:
	pop {r3, pc}
	thumb_func_end sub_020328A4

	thumb_func_start sub_020328C8
sub_020328C8: ; 0x020328C8
	push {r4, lr}
	ldr r0, _02032924 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032928 ; =0x00001310
	ldr r0, [r1, r0]
	sub r0, r0, #4
	cmp r0, #2
	bhi _020328DC
	mov r0, #1
	pop {r4, pc}
_020328DC:
	bl sub_020DEB24
	add r4, r0, #0
	mov r0, #0x66
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #4
	bl sub_020D285C
	mov r0, #0x66
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, r0
	mov r1, #4
	bl DC_FlushRange
	ldr r0, _0203292C ; =sub_02032934
	bl sub_020DF680
	cmp r0, #2
	beq _02032910
	bl sub_02032858
	mov r0, #0
	pop {r4, pc}
_02032910:
	ldr r2, _02032924 ; =0x021D4124
	ldr r1, _02032930 ; =0x0000132C
	ldr r0, [r2, #4]
	mov r3, #0
	strh r3, [r0, r1]
	ldr r2, [r2, #4]
	mov r0, #1
	add r1, r1, #2
	strh r0, [r2, r1]
	pop {r4, pc}
	.balign 4, 0
_02032924: .word 0x021D4124
_02032928: .word 0x00001310
_0203292C: .word sub_02032934
_02032930: .word 0x0000132C
	thumb_func_end sub_020328C8

	thumb_func_start sub_02032934
sub_02032934: ; 0x02032934
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0x10]
	mov r1, #1
	lsl r1, r0
	lsl r0, r1, #0x10
	lsr r4, r0, #0x10
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _02032954
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r4, r5, r6, pc}
_02032954:
	ldrh r0, [r5, #8]
	cmp r0, #7
	bgt _0203296C
	bge _02032986
	cmp r0, #2
	bgt _02032A24
	cmp r0, #0
	blt _02032A24
	beq _02032A16
	cmp r0, #2
	beq _02032978
	pop {r4, r5, r6, pc}
_0203296C:
	cmp r0, #9
	bgt _02032974
	beq _020329F8
	pop {r4, r5, r6, pc}
_02032974:
	cmp r0, #0x1a
	pop {r4, r5, r6, pc}
_02032978:
	ldr r0, _02032A28 ; =0x021D4124
	ldr r2, [r0, #4]
	ldr r0, _02032A2C ; =0x00001345
	ldrb r1, [r2, r0]
	add r1, r1, #1
	strb r1, [r2, r0]
	pop {r4, r5, r6, pc}
_02032986:
	ldr r0, _02032A28 ; =0x021D4124
	ldr r2, [r0, #4]
	ldr r0, _02032A30 ; =0x00001343
	ldrb r1, [r2, r0]
	cmp r1, #1
	beq _020329C4
	sub r0, r0, #1
	ldrb r0, [r2, r0]
	cmp r0, #1
	beq _020329C4
	bl sub_02033264
	ldr r1, _02032A28 ; =0x021D4124
	ldr r2, [r1, #4]
	ldr r1, _02032A34 ; =0x00001334
	ldrb r1, [r2, r1]
	cmp r0, r1
	bge _020329C4
	bl sub_0203993C
	ldrb r1, [r5, #0x14]
	cmp r1, r0
	bne _020329C4
	add r1, r5, #0
	ldr r0, _02032A38 ; =0x0210F8FC
	add r1, #0x15
	mov r2, #3
	bl memcmp
	cmp r0, #0
	beq _020329DC
_020329C4:
	ldrh r1, [r5, #0x10]
	mov r0, #0
	bl sub_020DFA18
	cmp r0, #2
	beq _02032A24
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r4, r5, r6, pc}
_020329DC:
	ldr r1, _02032A28 ; =0x021D4124
	ldr r0, _02032A3C ; =0x0000132E
	ldr r3, [r1, #4]
	ldrh r2, [r3, r0]
	orr r2, r4
	strh r2, [r3, r0]
	ldr r1, [r1, #4]
	sub r0, r0, #6
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _02032A24
	ldrh r0, [r5, #0x10]
	blx r1
	pop {r4, r5, r6, pc}
_020329F8:
	ldr r2, _02032A28 ; =0x021D4124
	ldr r1, _02032A3C ; =0x0000132E
	ldr r0, [r2, #4]
	mvn r3, r4
	ldrh r6, [r0, r1]
	and r3, r6
	strh r3, [r0, r1]
	ldr r0, [r2, #4]
	sub r1, #0xa
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _02032A24
	ldrh r0, [r5, #0x10]
	blx r1
	pop {r4, r5, r6, pc}
_02032A16:
	bl sub_02032A40
	cmp r0, #0
	bne _02032A24
	mov r0, #9
	bl sub_02032844
_02032A24:
	pop {r4, r5, r6, pc}
	nop
_02032A28: .word 0x021D4124
_02032A2C: .word 0x00001345
_02032A30: .word 0x00001343
_02032A34: .word 0x00001334
_02032A38: .word 0x0210F8FC
_02032A3C: .word 0x0000132E
	thumb_func_end sub_02032934

	thumb_func_start sub_02032A40
sub_02032A40: ; 0x02032A40
	push {r4, lr}
	sub sp, #8
	ldr r0, _02032A9C ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032AA0 ; =0x00001310
	ldr r0, [r1, r0]
	sub r0, r0, #4
	cmp r0, #2
	bhi _02032A58
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_02032A58:
	mov r0, #4
	bl sub_02032844
	ldr r0, _02032A9C ; =0x021D4124
	ldr r2, _02032AA4 ; =0x00001304
	ldr r4, [r0, #4]
	ldr r3, _02032AA8 ; =0x00001020
	ldr r0, [r4, r2]
	add r2, r2, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [r4, r2]
	add r1, r4, r3
	lsl r2, r2, #0x10
	sub r3, #0xe0
	ldr r0, _02032AAC ; =sub_02032AB0
	lsr r2, r2, #0x10
	add r3, r4, r3
	bl sub_020DFD14
	cmp r0, #2
	beq _02032A94
	bl sub_02032858
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_02032A94:
	mov r0, #1
	add sp, #8
	pop {r4, pc}
	nop
_02032A9C: .word 0x021D4124
_02032AA0: .word 0x00001310
_02032AA4: .word 0x00001304
_02032AA8: .word 0x00001020
_02032AAC: .word sub_02032AB0
	thumb_func_end sub_02032A40

	thumb_func_start sub_02032AB0
sub_02032AB0: ; 0x02032AB0
	push {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _02032AC6
	add r0, r1, #0
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r3, pc}
_02032AC6:
	ldrh r0, [r0, #4]
	sub r0, #0xa
	cmp r0, #3
	bhi _02032B00
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02032ADA: ; jump table
	.short _02032AE2 - _02032ADA - 2 ; case 0
	.short _02032B00 - _02032ADA - 2 ; case 1
	.short _02032B00 - _02032ADA - 2 ; case 2
	.short _02032B00 - _02032ADA - 2 ; case 3
_02032AE2:
	ldr r0, _02032B04 ; =0x021D4124
	ldr r2, [r0, #4]
	ldr r0, _02032B08 ; =0x00001314
	ldr r1, [r2, r0]
	cmp r1, #2
	bne _02032AFA
	sub r0, r0, #4
	ldr r0, [r2, r0]
	cmp r0, #4
	beq _02032AFA
	cmp r0, #6
	beq _02032B00
_02032AFA:
	mov r0, #4
	bl sub_02032844
_02032B00:
	pop {r3, pc}
	nop
_02032B04: .word 0x021D4124
_02032B08: .word 0x00001314
	thumb_func_end sub_02032AB0

	thumb_func_start sub_02032B0C
sub_02032B0C: ; 0x02032B0C
	push {r3, lr}
	mov r0, #3
	bl sub_02032844
	ldr r0, _02032B2C ; =sub_02032B30
	bl sub_020DFEAC
	cmp r0, #2
	beq _02032B26
	bl sub_02032858
	mov r0, #0
	pop {r3, pc}
_02032B26:
	mov r0, #1
	pop {r3, pc}
	nop
_02032B2C: .word sub_02032B30
	thumb_func_end sub_02032B0C

	thumb_func_start sub_02032B30
sub_02032B30: ; 0x02032B30
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _02032B42
	bl sub_02032858
	bl sub_02033830
	pop {r3, pc}
_02032B42:
	bl sub_02032B50
	cmp r0, #0
	bne _02032B4E
	bl sub_02033830
_02032B4E:
	pop {r3, pc}
	thumb_func_end sub_02032B30

	thumb_func_start sub_02032B50
sub_02032B50: ; 0x02032B50
	push {r3, lr}
	ldr r0, _02032B68 ; =sub_02032B6C
	bl sub_020DF690
	cmp r0, #2
	beq _02032B64
	bl sub_02032858
	mov r0, #0
	pop {r3, pc}
_02032B64:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02032B68: .word sub_02032B6C
	thumb_func_end sub_02032B50

	thumb_func_start sub_02032B6C
sub_02032B6C: ; 0x02032B6C
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _02032B7A
	bl sub_02032858
	pop {r3, pc}
_02032B7A:
	mov r0, #1
	bl sub_02032844
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02032B6C

	thumb_func_start sub_02032B84
sub_02032B84: ; 0x02032B84
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	ldr r2, _02032C10 ; =0x021D4124
	add r5, r0, #0
	add r4, r1, #0
	mov r3, #2
	ldr r0, [r2, #4]
	ldr r1, _02032C14 ; =0x00001308
	lsl r3, r3, #8
	str r3, [r0, r1]
	ldr r2, [r2, #4]
	mov r0, #0x40
	sub r1, r1, #4
	str r0, [r2, r1]
	mov r0, #2
	bl sub_02032844
	ldr r2, _02032C10 ; =0x021D4124
	ldr r1, _02032C18 ; =0x00001256
	ldr r3, [r2, #4]
	mov r0, #1
	strh r0, [r3, r1]
	add r0, r1, #0
	ldrh r6, [r4, #4]
	ldr r3, [r2, #4]
	add r0, #0x96
	strh r6, [r3, r0]
	add r0, r1, #0
	ldrh r6, [r4, #2]
	ldr r3, [r2, #4]
	add r0, #0x94
	strh r6, [r3, r0]
	add r0, r1, #0
	ldrh r4, [r4]
	ldr r3, [r2, #4]
	add r0, #0x92
	strh r4, [r3, r0]
	add r0, r1, #0
	ldr r3, [r2, #4]
	add r0, #0xbe
	str r5, [r3, r0]
	add r3, r1, #0
	ldr r4, [r2, #4]
	mov r0, #0
	add r3, #0xaa
	str r0, [r4, r3]
	add r3, r1, #0
	ldr r4, [r2, #4]
	add r3, #0xb6
	strh r7, [r4, r3]
	add r3, r1, #0
	ldr r4, [r2, #4]
	add r3, #0x8e
	strh r0, [r4, r3]
	ldr r2, [r2, #4]
	add r1, #0xb8
	mov r0, #1
	strh r0, [r2, r1]
	bl sub_02032C84
	cmp r0, #0
	bne _02032C0A
	mov r0, #9
	bl sub_02032844
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02032C0A:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02032C10: .word 0x021D4124
_02032C14: .word 0x00001308
_02032C18: .word 0x00001256
	thumb_func_end sub_02032B84

	thumb_func_start sub_02032C1C
sub_02032C1C: ; 0x02032C1C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #2
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02032844
	ldr r1, _02032C80 ; =0x021D4124
	mov r0, #0x13
	ldr r2, [r1, #4]
	lsl r0, r0, #8
	str r5, [r2, r0]
	add r2, r0, #0
	ldr r3, [r1, #4]
	add r2, #0xc
	strh r6, [r3, r2]
	add r3, r0, #0
	ldr r5, [r1, #4]
	mov r2, #0
	sub r3, #0x1c
	strh r2, [r5, r3]
	add r3, r0, #0
	ldr r5, [r1, #4]
	add r3, #0xe
	strh r2, [r5, r3]
	add r2, r0, #0
	ldrh r5, [r4, #4]
	ldr r3, [r1, #4]
	sub r2, #0x14
	strh r5, [r3, r2]
	add r2, r0, #0
	ldrh r5, [r4, #2]
	ldr r3, [r1, #4]
	sub r2, #0x16
	strh r5, [r3, r2]
	ldrh r2, [r4]
	ldr r1, [r1, #4]
	sub r0, #0x18
	strh r2, [r1, r0]
	bl sub_02032C84
	cmp r0, #0
	bne _02032C7C
	mov r0, #9
	bl sub_02032844
	mov r0, #0
	pop {r4, r5, r6, pc}
_02032C7C:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02032C80: .word 0x021D4124
	thumb_func_end sub_02032C1C

	thumb_func_start sub_02032C84
sub_02032C84: ; 0x02032C84
	push {r3, r4, r5, r6, r7, lr}
	bl sub_020DEF24
	add r5, r0, #0
	mov r0, #2
	lsl r0, r0, #0xe
	cmp r5, r0
	bne _02032CA4
	mov r0, #3
	bl sub_02032858
	mov r0, #1
	bl sub_02039AD8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02032CA4:
	cmp r5, #0
	bne _02032CB8
	mov r0, #0x16
	bl sub_02032858
	mov r0, #1
	bl sub_02039AD8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02032CB8:
	ldr r1, _02032D38 ; =0x021D4124
	ldr r0, _02032D3C ; =0x0000130C
	ldr r3, [r1, #4]
	ldrh r2, [r3, r0]
	cmp r2, #0
	bne _02032CF8
	add r7, r0, #0
	mov r3, #1
	add r2, r3, #0
	sub r7, #0x28
	sub r0, #0x28
_02032CCE:
	ldr r4, [r1, #4]
	ldr r6, _02032D40 ; =0x000012E4
	ldrh r6, [r4, r6]
	add r6, r6, #1
	strh r6, [r4, r7]
	ldr r4, [r1, #4]
	ldrh r6, [r4, r0]
	cmp r6, #0x10
	bls _02032CE4
	ldr r6, _02032D40 ; =0x000012E4
	strh r3, [r4, r6]
_02032CE4:
	ldr r6, [r1, #4]
	ldr r4, _02032D40 ; =0x000012E4
	ldrh r4, [r6, r4]
	add r6, r2, #0
	sub r4, r4, #1
	lsl r6, r4
	add r4, r5, #0
	tst r4, r6
	bne _02032CFC
	b _02032CCE
_02032CF8:
	sub r0, #0x28
	strh r2, [r3, r0]
_02032CFC:
	bl sub_020DF064
	mov r1, #3
	bl _s32_div_f
	ldr r2, _02032D38 ; =0x021D4124
	ldr r1, _02032D44 ; =0x000012E6
	ldr r3, [r2, #4]
	strh r0, [r3, r1]
	add r0, r1, #0
	ldr r3, [r2, #4]
	sub r0, #0xc6
	add r4, r3, r0
	sub r0, r1, #6
	str r4, [r3, r0]
	ldr r2, [r2, #4]
	sub r1, r1, #6
	ldr r0, _02032D48 ; =sub_02032D4C
	add r1, r2, r1
	bl sub_020DF6D0
	cmp r0, #2
	beq _02032D32
	bl sub_02032858
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02032D32:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02032D38: .word 0x021D4124
_02032D3C: .word 0x0000130C
_02032D40: .word 0x000012E4
_02032D44: .word 0x000012E6
_02032D48: .word sub_02032D4C
	thumb_func_end sub_02032C84

	thumb_func_start sub_02032D4C
sub_02032D4C: ; 0x02032D4C
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _02032D62
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032D62:
	ldr r0, _02032E14 ; =0x021D4124
	ldr r2, [r0, #4]
	ldr r0, _02032E18 ; =0x00001310
	ldr r1, [r2, r0]
	cmp r1, #2
	beq _02032D84
	mov r1, #0
	sub r0, r0, #2
	strh r1, [r2, r0]
	bl sub_02032E48
	cmp r0, #0
	bne _02032E10
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032D84:
	ldrh r1, [r4, #8]
	cmp r1, #3
	beq _02032E10
	cmp r1, #4
	beq _02032E02
	cmp r1, #5
	bne _02032E02
	sub r0, #0xf0
	add r0, r2, r0
	mov r1, #0xc0
	bl sub_020D285C
	ldr r0, _02032E14 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032E1C ; =0x00001320
	ldr r2, [r1, r0]
	cmp r2, #0
	beq _02032DB8
	ldrh r0, [r4, #0x36]
	cmp r0, #8
	blo _02032DB8
	add r1, r4, #0
	add r1, #0x48
	ldrb r1, [r1, #4]
	ldr r0, [r4, #0x3c]
	blx r2
_02032DB8:
	ldrh r0, [r4, #0x36]
	cmp r0, #8
	blo _02032E02
	ldr r0, _02032E14 ; =0x021D4124
	ldr r2, [r4, #0x3c]
	ldr r0, [r0, #4]
	ldr r1, [r0, #8]
	cmp r2, r1
	bne _02032E02
	add r4, #0x43
	ldrb r2, [r4]
	mov r1, #3
	and r1, r2
	cmp r1, #1
	bne _02032E02
	mov r1, #0x13
	lsl r1, r1, #8
	ldr r2, [r0, r1]
	cmp r2, #0
	beq _02032DE6
	sub r1, #0xe0
	add r0, r0, r1
	blx r2
_02032DE6:
	ldr r0, _02032E14 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032E20 ; =0x0000130E
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _02032E02
	bl sub_02032E48
	cmp r0, #0
	bne _02032E10
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032E02:
	bl sub_02032C84
	cmp r0, #0
	bne _02032E10
	mov r0, #9
	bl sub_02032844
_02032E10:
	pop {r4, pc}
	nop
_02032E14: .word 0x021D4124
_02032E18: .word 0x00001310
_02032E1C: .word 0x00001320
_02032E20: .word 0x0000130E
	thumb_func_end sub_02032D4C

	thumb_func_start sub_02032E24
sub_02032E24: ; 0x02032E24
	push {r3, lr}
	ldr r0, _02032E40 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032E44 ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #2
	beq _02032E36
	mov r0, #0
	pop {r3, pc}
_02032E36:
	mov r0, #3
	bl sub_02032844
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02032E40: .word 0x021D4124
_02032E44: .word 0x00001310
	thumb_func_end sub_02032E24

	thumb_func_start sub_02032E48
sub_02032E48: ; 0x02032E48
	push {r3, lr}
	ldr r0, _02032E60 ; =sub_02032E64
	bl sub_020DF90C
	cmp r0, #2
	beq _02032E5C
	bl sub_02032858
	mov r0, #0
	pop {r3, pc}
_02032E5C:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02032E60: .word sub_02032E64
	thumb_func_end sub_02032E48

	thumb_func_start sub_02032E64
sub_02032E64: ; 0x02032E64
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _02032E72
	bl sub_02032858
	pop {r3, pc}
_02032E72:
	mov r0, #1
	bl sub_02032844
	ldr r0, _02032E94 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032E98 ; =0x0000130E
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _02032E92
	bl sub_02032E9C
	cmp r0, #0
	bne _02032E92
	mov r0, #9
	bl sub_02032844
_02032E92:
	pop {r3, pc}
	.balign 4, 0
_02032E94: .word 0x021D4124
_02032E98: .word 0x0000130E
	thumb_func_end sub_02032E64

	thumb_func_start sub_02032E9C
sub_02032E9C: ; 0x02032E9C
	push {lr}
	sub sp, #0x24
	ldr r0, _02032EF8 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032EFC ; =0x00001310
	ldr r0, [r1, r0]
	sub r0, r0, #4
	cmp r0, #2
	bhi _02032EB4
	add sp, #0x24
	mov r0, #1
	pop {pc}
_02032EB4:
	mov r0, #3
	bl sub_02032844
	add r1, sp, #4
	ldr r0, _02032F00 ; =0x0210F8FC
	add r1, #1
	mov r2, #3
	bl MIi_CpuCopy8
	bl sub_0203993C
	add r1, sp, #4
	strb r0, [r1]
	mov r0, #0
	str r0, [sp]
	ldr r1, _02032EF8 ; =0x021D4124
	ldr r0, _02032F04 ; =sub_02032F0C
	ldr r2, [r1, #4]
	ldr r1, _02032F08 ; =0x00001220
	mov r3, #1
	add r1, r2, r1
	add r2, sp, #4
	bl sub_020DF94C
	cmp r0, #2
	beq _02032EF2
	bl sub_02032858
	add sp, #0x24
	mov r0, #0
	pop {pc}
_02032EF2:
	mov r0, #1
	add sp, #0x24
	pop {pc}
	.balign 4, 0
_02032EF8: .word 0x021D4124
_02032EFC: .word 0x00001310
_02032F00: .word 0x0210F8FC
_02032F04: .word sub_02032F0C
_02032F08: .word 0x00001220
	thumb_func_end sub_02032E9C

	thumb_func_start sub_02032F0C
sub_02032F0C: ; 0x02032F0C
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _02032F58
	bl sub_02032858
	ldrh r0, [r4, #2]
	cmp r0, #0xc
	bne _02032F28
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032F28:
	cmp r0, #0xb
	bne _02032F34
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032F34:
	cmp r0, #1
	bne _02032F50
	bl sub_02039918
	cmp r0, #0
	beq _02032F48
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032F48:
	mov r0, #8
	bl sub_02032844
	pop {r4, pc}
_02032F50:
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032F58:
	ldrh r0, [r4, #8]
	cmp r0, #8
	beq _02032FBE
	cmp r0, #7
	bne _02032F9E
	ldr r0, _02032FC0 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032FC4 ; =0x00001335
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02032F7C
	mov r0, #0x14
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032F7C:
	mov r0, #4
	bl sub_02032844
	bl sub_02032FCC
	cmp r0, #0
	bne _02032F92
	mov r0, #3
	bl sub_02032844
	pop {r4, pc}
_02032F92:
	ldr r0, _02032FC0 ; =0x021D4124
	ldrh r2, [r4, #0xa]
	ldr r1, [r0, #4]
	ldr r0, _02032FC8 ; =0x0000132C
	strh r2, [r1, r0]
	pop {r4, pc}
_02032F9E:
	cmp r0, #6
	beq _02032FBE
	cmp r0, #9
	bne _02032FB4
	mov r0, #0x14
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032FB4:
	cmp r0, #0x1a
	beq _02032FBE
	mov r0, #9
	bl sub_02032844
_02032FBE:
	pop {r4, pc}
	.balign 4, 0
_02032FC0: .word 0x021D4124
_02032FC4: .word 0x00001335
_02032FC8: .word 0x0000132C
	thumb_func_end sub_02032F0C

	thumb_func_start sub_02032FCC
sub_02032FCC: ; 0x02032FCC
	push {r4, lr}
	sub sp, #8
	ldr r0, _0203300C ; =0x021D4124
	ldr r2, _02033010 ; =0x00001304
	ldr r4, [r0, #4]
	ldr r3, _02033014 ; =0x00001020
	ldr r0, [r4, r2]
	add r1, r4, r3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r2, r2, #4
	ldr r2, [r4, r2]
	sub r3, #0xe0
	lsl r2, r2, #0x10
	ldr r0, _02033018 ; =sub_0203301C
	lsr r2, r2, #0x10
	add r3, r4, r3
	bl sub_020DFD14
	cmp r0, #2
	beq _02033006
	bl sub_02032858
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_02033006:
	mov r0, #1
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_0203300C: .word 0x021D4124
_02033010: .word 0x00001304
_02033014: .word 0x00001020
_02033018: .word sub_0203301C
	thumb_func_end sub_02032FCC

	thumb_func_start sub_0203301C
sub_0203301C: ; 0x0203301C
	push {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _0203303E
	cmp r1, #0xf
	beq _02033074
	cmp r1, #9
	beq _02033074
	cmp r1, #0xd
	beq _02033074
	add r0, r1, #0
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r3, pc}
_0203303E:
	ldrh r0, [r0, #4]
	sub r0, #0xa
	cmp r0, #3
	bhi _02033074
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02033052: ; jump table
	.short _0203305A - _02033052 - 2 ; case 0
	.short _02033074 - _02033052 - 2 ; case 1
	.short _02033074 - _02033052 - 2 ; case 2
	.short _02033074 - _02033052 - 2 ; case 3
_0203305A:
	ldr r0, _02033078 ; =0x021D4124
	ldr r2, [r0, #4]
	ldr r0, _0203307C ; =0x00001314
	ldr r1, [r2, r0]
	cmp r1, #3
	bne _0203306E
	sub r0, r0, #4
	ldr r0, [r2, r0]
	cmp r0, #6
	beq _02033074
_0203306E:
	mov r0, #4
	bl sub_02032844
_02033074:
	pop {r3, pc}
	nop
_02033078: .word 0x021D4124
_0203307C: .word 0x00001314
	thumb_func_end sub_0203301C

	thumb_func_start sub_02033080
sub_02033080: ; 0x02033080
	push {r3, lr}
	mov r0, #3
	bl sub_02032844
	ldr r0, _020330A0 ; =sub_020330A4
	bl sub_020DFEAC
	cmp r0, #2
	beq _0203309A
	bl sub_02032858
	mov r0, #0
	pop {r3, pc}
_0203309A:
	mov r0, #1
	pop {r3, pc}
	nop
_020330A0: .word sub_020330A4
	thumb_func_end sub_02033080

	thumb_func_start sub_020330A4
sub_020330A4: ; 0x020330A4
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _020330B6
	bl sub_02032858
	bl sub_02033858
	pop {r3, pc}
_020330B6:
	bl sub_020330C8
	cmp r0, #0
	bne _020330C4
	mov r0, #9
	bl sub_02032844
_020330C4:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020330A4

	thumb_func_start sub_020330C8
sub_020330C8: ; 0x020330C8
	push {r3, lr}
	mov r0, #3
	bl sub_02032844
	ldr r0, _020330EC ; =sub_020330F0
	mov r1, #0
	bl sub_020DFA18
	cmp r0, #2
	beq _020330E8
	bl sub_02032858
	bl sub_02033830
	mov r0, #0
	pop {r3, pc}
_020330E8:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_020330EC: .word sub_020330F0
	thumb_func_end sub_020330C8

	thumb_func_start sub_020330F0
sub_020330F0: ; 0x020330F0
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _020330FE
	bl sub_02032858
	pop {r3, pc}
_020330FE:
	mov r0, #1
	bl sub_02032844
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020330F0

	thumb_func_start sub_02033108
sub_02033108: ; 0x02033108
	push {r3, lr}
	mov r0, #3
	bl sub_02032844
	ldr r0, _02033128 ; =sub_0203312C
	bl sub_020DF480
	cmp r0, #2
	beq _02033122
	bl sub_02032858
	mov r0, #0
	pop {r3, pc}
_02033122:
	mov r0, #1
	pop {r3, pc}
	nop
_02033128: .word sub_0203312C
	thumb_func_end sub_02033108

	thumb_func_start sub_0203312C
sub_0203312C: ; 0x0203312C
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _02033144
	mov r0, #9
	bl sub_02032844
	ldrh r0, [r4, #2]
	bl sub_02032858
	pop {r4, pc}
_02033144:
	mov r0, #1
	bl sub_02032844
	pop {r4, pc}
	thumb_func_end sub_0203312C

	thumb_func_start sub_0203314C
sub_0203314C: ; 0x0203314C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _02033194 ; =0x021D4124
	add r6, r1, #0
	add r4, r2, #0
	ldr r1, [r0, #4]
	mov r0, #0x3d
	lsl r0, r0, #6
	ldr r2, _02033198 ; =0x00001304
	add r0, r1, r0
	ldr r1, [r1, r2]
	add r7, r3, #0
	bl DC_FlushRange
	ldr r0, _0203319C ; =0x0000FFFF
	add r1, r7, #0
	str r0, [sp]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, _020331A0 ; =sub_020331A4
	add r2, r5, #0
	add r3, r6, #0
	bl sub_020DFD7C
	cmp r0, #2
	bne _0203318E
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0203318E:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02033194: .word 0x021D4124
_02033198: .word 0x00001304
_0203319C: .word 0x0000FFFF
_020331A0: .word sub_020331A4
	thumb_func_end sub_0203314C

	thumb_func_start sub_020331A4
sub_020331A4: ; 0x020331A4
	push {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _020331B8
	cmp r1, #0xf
	beq _020331B8
	add r0, r1, #0
	bl sub_02032858
	pop {r3, pc}
_020331B8:
	ldr r2, [r0, #0x20]
	cmp r2, #0
	beq _020331CA
	cmp r1, #0
	bne _020331C6
	mov r0, #1
	b _020331C8
_020331C6:
	mov r0, #0
_020331C8:
	blx r2
_020331CA:
	pop {r3, pc}
	thumb_func_end sub_020331A4

	thumb_func_start sub_020331CC
sub_020331CC: ; 0x020331CC
	push {r3, lr}
	add r2, r0, #0
	ldrh r0, [r2, #2]
	cmp r0, #0
	beq _020331DC
	bl sub_02032858
	pop {r3, pc}
_020331DC:
	ldr r0, _0203320C ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033210 ; =0x00001318
	ldr r3, [r1, r0]
	cmp r3, #0
	beq _02033208
	ldrh r0, [r2, #4]
	cmp r0, #0x19
	beq _02033208
	cmp r0, #0x15
	bne _020331FC
	ldrh r0, [r2, #0x12]
	ldr r1, [r2, #0xc]
	ldrh r2, [r2, #0x10]
	blx r3
	pop {r3, pc}
_020331FC:
	cmp r0, #9
	bne _02033208
	ldrh r0, [r2, #0x12]
	mov r1, #0
	add r2, r1, #0
	blx r3
_02033208:
	pop {r3, pc}
	nop
_0203320C: .word 0x021D4124
_02033210: .word 0x00001318
	thumb_func_end sub_020331CC

	thumb_func_start sub_02033214
sub_02033214: ; 0x02033214
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _02033224
	mov r0, #0xa
	bl sub_02032844
	pop {r3, pc}
_02033224:
	mov r0, #0
	add r1, r0, #0
	bl sub_0209E248
	mov r0, #0
	bl sub_02032844
	pop {r3, pc}
	thumb_func_end sub_02033214

	thumb_func_start sub_02033234
sub_02033234: ; 0x02033234
	ldr r1, _0203323C ; =0x021D4124
	ldr r1, [r1, #4]
	str r0, [r1, #8]
	bx lr
	.balign 4, 0
_0203323C: .word 0x021D4124
	thumb_func_end sub_02033234

	thumb_func_start sub_02033240
sub_02033240: ; 0x02033240
	ldr r2, _0203324C ; =0x021D4124
	ldr r3, [r2, #4]
	str r0, [r3]
	ldr r0, [r2, #4]
	strh r1, [r0, #4]
	bx lr
	.balign 4, 0
_0203324C: .word 0x021D4124
	thumb_func_end sub_02033240

	thumb_func_start sub_02033250
sub_02033250: ; 0x02033250
	ldr r0, _0203325C ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033260 ; =0x0000132E
	ldrh r0, [r1, r0]
	bx lr
	nop
_0203325C: .word 0x021D4124
_02033260: .word 0x0000132E
	thumb_func_end sub_02033250

	thumb_func_start sub_02033264
sub_02033264: ; 0x02033264
	push {r3, r4}
	ldr r0, _02033290 ; =0x021D4124
	mov r2, #0
	ldr r1, [r0, #4]
	ldr r0, _02033294 ; =0x0000132E
	add r3, r2, #0
	ldrh r4, [r1, r0]
	mov r1, #1
_02033274:
	add r0, r4, #0
	tst r0, r1
	beq _0203327C
	add r2, r2, #1
_0203327C:
	lsl r0, r4, #0xf
	add r3, r3, #1
	lsr r4, r0, #0x10
	cmp r3, #0x10
	blt _02033274
	lsl r0, r2, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4}
	bx lr
	nop
_02033290: .word 0x021D4124
_02033294: .word 0x0000132E
	thumb_func_end sub_02033264

	thumb_func_start sub_02033298
sub_02033298: ; 0x02033298
	ldr r0, _020332A4 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _020332A8 ; =0x00001310
	ldr r0, [r1, r0]
	bx lr
	nop
_020332A4: .word 0x021D4124
_020332A8: .word 0x00001310
	thumb_func_end sub_02033298

	thumb_func_start sub_020332AC
sub_020332AC: ; 0x020332AC
	ldr r0, _020332B8 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _020332BC ; =0x00001330
	ldr r0, [r1, r0]
	bx lr
	nop
_020332B8: .word 0x021D4124
_020332BC: .word 0x00001330
	thumb_func_end sub_020332AC

	thumb_func_start sub_020332C0
sub_020332C0: ; 0x020332C0
	push {r3, r4, r5, lr}
	sub sp, #8
	add r0, sp, #0
	bl OS_GetMacAddress
	ldr r0, _02033348 ; =0x027FFC3C
	ldr r3, [r0]
	add r0, sp, #0
	ldrh r2, [r0, #4]
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	add r0, r0, r3
	add r0, r1, r0
	add r1, r2, r0
	ldr r3, _0203334C ; =0x021D4124
	ldr r2, _02033350 ; =0x00001338
	ldr r0, [r3, #4]
	str r1, [r0, r2]
	ldr r0, [r3, #4]
	ldr r1, _02033354 ; =0x00010DCD
	ldr r4, [r0, r2]
	add r5, r4, #0
	mul r5, r1
	ldr r1, _02033358 ; =0x00003039
	mov r4, #0
	add r1, r5, r1
	str r1, [r0, r2]
	ldr r1, [r3, #4]
	add r0, r2, #4
	strh r4, [r1, r0]
	ldr r1, [r3, #4]
	mov r4, #0x65
	add r0, r2, #6
	strh r4, [r1, r0]
	mov r0, #3
	bl sub_02032844
	mov r0, #1
	bl sub_0203335C
	cmp r0, #0x18
	bne _0203332C
	mov r0, #0x18
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	mov r0, #1
	bl sub_02039AD8
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203332C:
	cmp r0, #2
	beq _02033340
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_02033340:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02033348: .word 0x027FFC3C
_0203334C: .word 0x021D4124
_02033350: .word 0x00001338
_02033354: .word 0x00010DCD
_02033358: .word 0x00003039
	thumb_func_end sub_020332C0

	thumb_func_start sub_0203335C
sub_0203335C: ; 0x0203335C
	push {r4, lr}
	add r4, r0, #0
	bl sub_020DEF24
	mov r1, #2
	lsl r1, r1, #0xe
	cmp r0, r1
	bne _02033382
	mov r0, #3
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	mov r0, #1
	bl sub_02039AD8
	mov r0, #3
	pop {r4, pc}
_02033382:
	cmp r0, #0
	bne _0203339C
	mov r0, #0x16
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	mov r0, #1
	bl sub_02039AD8
	mov r0, #0x18
	pop {r4, pc}
_0203339C:
	mov r2, #1
	sub r1, r4, #1
	lsl r2, r1
	add r1, r2, #0
	tst r1, r0
	bne _020333C4
	mov r2, #1
_020333AA:
	add r1, r4, #1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r4, #0x10
	bls _020333B8
	mov r0, #0x18
	pop {r4, pc}
_020333B8:
	sub r1, r4, #1
	add r3, r2, #0
	lsl r3, r1
	add r1, r3, #0
	tst r1, r0
	beq _020333AA
_020333C4:
	ldr r0, _020333D4 ; =sub_020333D8
	add r1, r4, #0
	bl sub_02033454
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, pc}
	nop
_020333D4: .word sub_020333D8
	thumb_func_end sub_0203335C

	thumb_func_start sub_020333D8
sub_020333D8: ; 0x020333D8
	push {r3, r4, r5, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _020333F4
	add r0, r1, #0
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	mov r0, #1
	bl sub_02039AD8
	pop {r3, r4, r5, pc}
_020333F4:
	ldr r2, _0203344C ; =0x021D4124
	ldrh r1, [r0, #8]
	ldrh r5, [r0, #0xa]
	ldr r0, [r2, #4]
	ldr r3, _02033450 ; =0x0000133E
	ldrh r4, [r0, r3]
	cmp r4, r5
	bls _02033414
	strh r5, [r0, r3]
	mov r4, #1
	sub r0, r1, #1
	lsl r4, r0
	ldr r2, [r2, #4]
	add r0, r3, #2
	strh r4, [r2, r0]
	b _02033428
_02033414:
	cmp r4, r5
	bne _02033428
	add r2, r3, #2
	ldrh r5, [r0, r2]
	mov r4, #1
	sub r2, r1, #1
	lsl r4, r2
	orr r4, r5
	add r2, r3, #2
	strh r4, [r0, r2]
_02033428:
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203335C
	cmp r0, #0x18
	bne _0203343E
	mov r0, #7
	bl sub_02032844
	pop {r3, r4, r5, pc}
_0203343E:
	cmp r0, #2
	beq _02033448
	mov r0, #9
	bl sub_02032844
_02033448:
	pop {r3, r4, r5, pc}
	nop
_0203344C: .word 0x021D4124
_02033450: .word 0x0000133E
	thumb_func_end sub_020333D8

	thumb_func_start sub_02033454
sub_02033454: ; 0x02033454
	push {r3, lr}
	add r3, r1, #0
	mov r1, #0x1e
	str r1, [sp]
	mov r1, #3
	mov r2, #0x11
	bl sub_020E0EF4
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02033454

	thumb_func_start sub_02033468
sub_02033468: ; 0x02033468
	push {r3, lr}
	mov r0, #1
	bl sub_02032844
	ldr r0, _0203348C ; =0x021D4124
	ldr r1, [r0, #4]
	mov r0, #0x4d
	lsl r0, r0, #6
	ldrh r0, [r1, r0]
	bl sub_02033494
	ldr r2, _0203348C ; =0x021D4124
	ldr r1, _02033490 ; =0x0000133C
	ldr r3, [r2, #4]
	strh r0, [r3, r1]
	ldr r0, [r2, #4]
	ldrh r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0203348C: .word 0x021D4124
_02033490: .word 0x0000133C
	thumb_func_end sub_02033468

	thumb_func_start sub_02033494
sub_02033494: ; 0x02033494
	push {r4, r5, r6, r7}
	add r4, r0, #0
	mov r0, #0
	add r3, r0, #0
	add r2, r0, #0
	mov r1, #1
_020334A0:
	add r5, r1, #0
	lsl r5, r2
	tst r5, r4
	beq _020334B4
	add r0, r2, #1
	add r3, r3, #1
	lsl r0, r0, #0x10
	lsl r3, r3, #0x10
	asr r0, r0, #0x10
	lsr r3, r3, #0x10
_020334B4:
	add r2, r2, #1
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	cmp r2, #0x10
	blt _020334A0
	cmp r3, #1
	bls _02033512
	ldr r5, _02033518 ; =0x021D4124
	ldr r2, _0203351C ; =0x00001338
	ldr r0, [r5, #4]
	ldr r1, _02033520 ; =0x00010DCD
	ldr r6, [r0, r2]
	add r7, r6, #0
	mul r7, r1
	ldr r1, _02033524 ; =0x00003039
	add r1, r7, r1
	str r1, [r0, r2]
	ldr r0, [r5, #4]
	mov r1, #1
	ldr r0, [r0, r2]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mul r0, r3
	lsl r0, r0, #8
	lsr r2, r0, #0x10
	mov r3, #0
_020334E8:
	add r0, r4, #0
	tst r0, r1
	beq _02033502
	cmp r2, #0
	bne _020334FC
	add r0, r3, #1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	pop {r4, r5, r6, r7}
	bx lr
_020334FC:
	sub r0, r2, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
_02033502:
	lsl r0, r4, #0xf
	lsr r4, r0, #0x10
	add r0, r3, #1
	lsl r0, r0, #0x10
	asr r3, r0, #0x10
	cmp r3, #0x10
	blt _020334E8
	mov r0, #0
_02033512:
	pop {r4, r5, r6, r7}
	bx lr
	nop
_02033518: .word 0x021D4124
_0203351C: .word 0x00001338
_02033520: .word 0x00010DCD
_02033524: .word 0x00003039
	thumb_func_end sub_02033494

	thumb_func_start sub_02033528
sub_02033528: ; 0x02033528
	push {r4, r5, r6, lr}
	lsl r2, r0, #0x1b
	lsr r3, r2, #0x1b
	beq _02033536
	mov r2, #0x20
	sub r2, r2, r3
	add r0, r0, r2
_02033536:
	ldr r3, _020335AC ; =0x021D4124
	ldr r2, _020335B0 ; =0x00001308
	str r0, [r3, #4]
	mov r4, #0
	str r4, [r0, r2]
	ldr r5, [r3, #4]
	sub r0, r2, #4
	str r4, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	add r0, #0x10
	str r4, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	add r0, #0x24
	strh r4, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	mov r6, #1
	add r0, #0x26
	strh r6, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	add r0, #0x28
	str r4, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	add r0, #8
	str r4, [r5, r0]
	ldr r0, [r3, #4]
	mov r6, #8
	str r4, [r0]
	ldr r0, [r3, #4]
	strh r4, [r0, #4]
	add r0, r2, #0
	ldr r5, [r3, #4]
	add r0, #0x14
	str r4, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	add r0, #0x2c
	strb r6, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	add r0, #0x2d
	strb r4, [r5, r0]
	ldr r0, [r3, #4]
	add r2, #0x3a
	strb r4, [r0, r2]
	add r0, r1, #0
	bl sub_020335D4
	cmp r0, #0
	bne _020335A6
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_020335A6:
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_020335AC: .word 0x021D4124
_020335B0: .word 0x00001308
	thumb_func_end sub_02033528

	thumb_func_start sub_020335B4
sub_020335B4: ; 0x020335B4
	mov r0, #0x4e
	lsl r0, r0, #6
	bx lr
	.balign 4, 0
	thumb_func_end sub_020335B4

	thumb_func_start sub_020335BC
sub_020335BC: ; 0x020335BC
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #8
	bne _020335D0
	mov r0, #9
	bl sub_02032844
	mov r0, #0x19
	bl sub_02032858
_020335D0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020335BC

	thumb_func_start sub_020335D4
sub_020335D4: ; 0x020335D4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #3
	bl sub_02032844
	cmp r4, #1
	bne _020335F2
	ldr r0, _02033618 ; =0x021D4124
	ldr r1, _0203361C ; =sub_02033620
	ldr r0, [r0, #4]
	mov r2, #2
	add r0, #0x40
	bl sub_020DF3F8
	b _02033602
_020335F2:
	ldr r0, _02033618 ; =0x021D4124
	ldr r1, _0203361C ; =sub_02033620
	ldr r0, [r0, #4]
	mov r2, #2
	add r0, #0x40
	mov r3, #0
	bl sub_020DF408
_02033602:
	cmp r0, #2
	beq _02033614
	bl sub_02032858
	mov r0, #0xa
	bl sub_02032844
	mov r0, #0
	pop {r4, pc}
_02033614:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02033618: .word 0x021D4124
_0203361C: .word sub_02033620
	thumb_func_end sub_020335D4

	thumb_func_start sub_02033620
sub_02033620: ; 0x02033620
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0203363A
	bl sub_02032858
	mov r0, #0xa
	bl sub_02032844
	mov r0, #5
	bl sub_02039AD8
	pop {r3, pc}
_0203363A:
	ldr r0, _02033660 ; =sub_020335BC
	bl sub_020DEBA8
	cmp r0, #0
	beq _02033656
	bl sub_02032858
	mov r0, #0xa
	bl sub_02032844
	mov r0, #5
	bl sub_02039AD8
	pop {r3, pc}
_02033656:
	mov r0, #1
	bl sub_02032844
	pop {r3, pc}
	nop
_02033660: .word sub_020335BC
	thumb_func_end sub_02033620

	thumb_func_start sub_02033664
sub_02033664: ; 0x02033664
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033664

	thumb_func_start sub_02033668
sub_02033668: ; 0x02033668
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	bl sub_0203993C
	bl sub_020340C4
	cmp r0, #0
	beq _0203368C
	ldr r0, _0203372C ; =sub_02033664
	mov r2, #0x64
	ldr r1, _02033730 ; =0x0000FFFF
	mov r3, #5
	str r2, [sp]
	bl sub_020E0E94
_0203368C:
	ldr r1, _02033734 ; =0x021D4124
	mov r0, #7
	ldr r2, [r1, #4]
	ldr r1, _02033738 ; =0x00001308
	lsl r0, r0, #6
	str r0, [r2, r1]
	ldr r0, _02033734 ; =0x021D4124
	mov r3, #0xe0
	ldr r2, [r0, #4]
	sub r0, r1, #4
	str r3, [r2, r0]
	ldr r0, _02033734 ; =0x021D4124
	add r1, #0xc
	ldr r0, [r0, #4]
	str r5, [r0, r1]
	mov r0, #3
	bl sub_02032844
	ldr r1, _02033734 ; =0x021D4124
	cmp r5, #0
	ldr r0, [r1, #4]
	strh r6, [r0, #0xc]
	ldr r0, [r1, #4]
	strh r7, [r0, #0x32]
	add r0, sp, #8
	ldrh r2, [r0, #0x10]
	ldr r0, [r1, #4]
	strh r2, [r0, #0x18]
	beq _020336CC
	cmp r5, #4
	beq _020336E6
	b _020336F2
_020336CC:
	ldr r0, [r1, #4]
	mov r2, #0xc0
	strh r2, [r0, #0x34]
	cmp r4, #5
	blo _020336DE
	ldr r0, [r1, #4]
	mov r2, #0xc
	strh r2, [r0, #0x36]
	b _020336F2
_020336DE:
	ldr r0, [r1, #4]
	mov r2, #0x26
	strh r2, [r0, #0x36]
	b _020336F2
_020336E6:
	ldr r0, [r1, #4]
	mov r2, #0x64
	strh r2, [r0, #0x34]
	ldr r0, [r1, #4]
	mov r2, #0xc
	strh r2, [r0, #0x36]
_020336F2:
	ldr r1, _02033734 ; =0x021D4124
	ldr r0, [r1, #4]
	strh r4, [r0, #0x10]
	ldr r2, [r1, #4]
	mov r0, #0
	strh r0, [r2, #0x16]
	ldr r2, [r1, #4]
	cmp r5, #2
	strh r0, [r2, #0x12]
	ldr r2, [sp, #0x1c]
	ldr r1, [r1, #4]
	strh r2, [r1, #0xe]
	bne _0203370E
	mov r0, #1
_0203370E:
	ldr r1, _02033734 ; =0x021D4124
	cmp r5, #0
	ldr r1, [r1, #4]
	strh r0, [r1, #0x14]
	beq _02033720
	cmp r5, #2
	beq _02033720
	cmp r5, #4
	bne _02033726
_02033720:
	bl sub_02032874
	pop {r3, r4, r5, r6, r7, pc}
_02033726:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203372C: .word sub_02033664
_02033730: .word 0x0000FFFF
_02033734: .word 0x021D4124
_02033738: .word 0x00001308
	thumb_func_end sub_02033668

	thumb_func_start sub_0203373C
sub_0203373C: ; 0x0203373C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203993C
	bl sub_020340C4
	cmp r0, #0
	beq _0203375E
	ldr r0, _020337BC ; =sub_02033664
	mov r2, #0x64
	ldr r1, _020337C0 ; =0x0000FFFF
	mov r3, #5
	str r2, [sp]
	bl sub_020E0E94
_0203375E:
	ldr r2, _020337C4 ; =0x021D4124
	mov r3, #2
	ldr r0, [r2, #4]
	ldr r1, _020337C8 ; =0x00001308
	lsl r3, r3, #8
	str r3, [r0, r1]
	sub r0, r1, #4
	ldr r3, [r2, #4]
	mov r6, #0x40
	str r6, [r3, r0]
	ldr r0, [r2, #4]
	add r1, #0xc
	str r5, [r0, r1]
	mov r0, #3
	bl sub_02032844
	cmp r5, #1
	beq _0203378A
	cmp r5, #3
	beq _0203378A
	cmp r5, #5
	bne _020337B4
_0203378A:
	ldr r1, _020337C4 ; =0x021D4124
	add r0, r4, #0
	ldr r2, [r1, #4]
	ldr r1, _020337CC ; =0x00001220
	add r1, r2, r1
	mov r2, #0xc0
	bl MIi_CpuCopy8
	ldr r0, _020337C4 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _020337CC ; =0x00001220
	add r0, r1, r0
	mov r1, #0xc0
	bl DC_FlushRange
	bl sub_020D28B8
	bl sub_02032E9C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_020337B4:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_020337BC: .word sub_02033664
_020337C0: .word 0x0000FFFF
_020337C4: .word 0x021D4124
_020337C8: .word 0x00001308
_020337CC: .word 0x00001220
	thumb_func_end sub_0203373C

	thumb_func_start sub_020337D0
sub_020337D0: ; 0x020337D0
	push {r3, lr}
	ldr r2, _020337F4 ; =0x021D4124
	ldr r3, [r2, #4]
	ldr r2, _020337F8 ; =0x00001318
	str r0, [r3, r2]
	lsl r0, r1, #0x10
	ldr r1, _020337FC ; =sub_020331CC
	lsr r0, r0, #0x10
	mov r2, #0
	bl sub_020DEBEC
	cmp r0, #0
	beq _020337F2
	mov r0, #9
	bl sub_02032844
_020337F0:
	b _020337F0
_020337F2:
	pop {r3, pc}
	.balign 4, 0
_020337F4: .word 0x021D4124
_020337F8: .word 0x00001318
_020337FC: .word sub_020331CC
	thumb_func_end sub_020337D0

	thumb_func_start sub_02033800
sub_02033800: ; 0x02033800
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_020338F4
	cmp r0, #0
	bne _02033820
	bl sub_02033250
	mov r1, #0xfe
	tst r0, r1
	bne _02033820
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02033820:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0203314C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02033800

	thumb_func_start sub_02033830
sub_02033830: ; 0x02033830
	push {r3, lr}
	ldr r0, _02033850 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033854 ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #2
	bne _02033840
_0203383E:
	b _0203383E
_02033840:
	bl sub_02033108
	cmp r0, #0
	bne _0203384E
	mov r0, #0xa
	bl sub_02032844
_0203384E:
	pop {r3, pc}
	.balign 4, 0
_02033850: .word 0x021D4124
_02033854: .word 0x00001310
	thumb_func_end sub_02033830

	thumb_func_start sub_02033858
sub_02033858: ; 0x02033858
	push {r3, lr}
	ldr r0, _020338C4 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _020338C8 ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #1
	beq _020338C2
	cmp r0, #6
	beq _0203387E
	cmp r0, #5
	beq _0203387E
	cmp r0, #4
	beq _0203387E
	mov r0, #3
	bl sub_02032844
	bl sub_02033830
	pop {r3, pc}
_0203387E:
	mov r0, #3
	bl sub_02032844
	ldr r0, _020338C4 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _020338CC ; =0x00001314
	ldr r0, [r1, r0]
	cmp r0, #5
	bhi _020338C2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203389C: ; jump table
	.short _020338B6 - _0203389C - 2 ; case 0
	.short _020338A8 - _0203389C - 2 ; case 1
	.short _020338C2 - _0203389C - 2 ; case 2
	.short _020338C2 - _0203389C - 2 ; case 3
	.short _020338B6 - _0203389C - 2 ; case 4
	.short _020338A8 - _0203389C - 2 ; case 5
_020338A8:
	bl sub_02033080
	cmp r0, #0
	bne _020338C2
	bl sub_02033830
	pop {r3, pc}
_020338B6:
	bl sub_02032B0C
	cmp r0, #0
	bne _020338C2
	bl sub_02033830
_020338C2:
	pop {r3, pc}
	.balign 4, 0
_020338C4: .word 0x021D4124
_020338C8: .word 0x00001310
_020338CC: .word 0x00001314
	thumb_func_end sub_02033858

	thumb_func_start sub_020338D0
sub_020338D0: ; 0x020338D0
	push {r3, lr}
	mov r0, #3
	bl sub_02032844
	ldr r0, _020338F0 ; =sub_02033214
	bl sub_020DF4B8
	cmp r0, #2
	beq _020338EC
	mov r0, #9
	bl sub_02032844
	mov r0, #0
	pop {r3, pc}
_020338EC:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_020338F0: .word sub_02033214
	thumb_func_end sub_020338D0

	thumb_func_start sub_020338F4
sub_020338F4: ; 0x020338F4
	ldr r0, _02033900 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033904 ; =0x0000132C
	ldrh r0, [r1, r0]
	bx lr
	nop
_02033900: .word 0x021D4124
_02033904: .word 0x0000132C
	thumb_func_end sub_020338F4

	thumb_func_start sub_02033908
sub_02033908: ; 0x02033908
	ldr r1, _02033918 ; =0x021D4124
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _02033914
	ldr r1, _0203391C ; =0x00001334
	strb r0, [r2, r1]
_02033914:
	bx lr
	nop
_02033918: .word 0x021D4124
_0203391C: .word 0x00001334
	thumb_func_end sub_02033908

	thumb_func_start sub_02033920
sub_02033920: ; 0x02033920
	ldr r0, _02033934 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033938 ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #1
	bne _02033930
	mov r0, #1
	bx lr
_02033930:
	mov r0, #0
	bx lr
	.balign 4, 0
_02033934: .word 0x021D4124
_02033938: .word 0x00001310
	thumb_func_end sub_02033920

	thumb_func_start sub_0203393C
sub_0203393C: ; 0x0203393C
	ldr r0, _02033950 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033954 ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #3
	bne _0203394C
	mov r0, #1
	bx lr
_0203394C:
	mov r0, #0
	bx lr
	.balign 4, 0
_02033950: .word 0x021D4124
_02033954: .word 0x00001310
	thumb_func_end sub_0203393C

	thumb_func_start sub_02033958
sub_02033958: ; 0x02033958
	ldr r0, _0203396C ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033970 ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #9
	bne _02033968
	mov r0, #1
	bx lr
_02033968:
	mov r0, #0
	bx lr
	.balign 4, 0
_0203396C: .word 0x021D4124
_02033970: .word 0x00001310
	thumb_func_end sub_02033958

	thumb_func_start sub_02033974
sub_02033974: ; 0x02033974
	ldr r0, _02033988 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _0203398C ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #0xa
	bne _02033984
	mov r0, #1
	bx lr
_02033984:
	mov r0, #0
	bx lr
	.balign 4, 0
_02033988: .word 0x021D4124
_0203398C: .word 0x00001310
	thumb_func_end sub_02033974

	thumb_func_start sub_02033990
sub_02033990: ; 0x02033990
	ldr r0, _020339AC ; =0x021D4124
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _020339A8
	ldr r0, _020339B0 ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #2
	bne _020339A4
	mov r0, #1
	bx lr
_020339A4:
	mov r0, #0
	bx lr
_020339A8:
	mov r0, #0
	bx lr
	.balign 4, 0
_020339AC: .word 0x021D4124
_020339B0: .word 0x00001310
	thumb_func_end sub_02033990

	thumb_func_start sub_020339B4
sub_020339B4: ; 0x020339B4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	ldr r0, _020339E8 ; =0x021D4124
	add r5, r1, #0
	ldr r1, [r0, #4]
	ldr r0, _020339EC ; =0x00001310
	add r4, r2, #0
	ldr r0, [r1, r0]
	cmp r0, #4
	bne _020339E2
	lsl r0, r3, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #1
	lsl r2, r5, #0x10
	str r0, [sp, #4]
	mov r0, #0
	add r1, r6, #0
	lsr r2, r2, #0x10
	add r3, r4, #0
	bl sub_020E0D8C
_020339E2:
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_020339E8: .word 0x021D4124
_020339EC: .word 0x00001310
	thumb_func_end sub_020339B4

	thumb_func_start sub_020339F0
sub_020339F0: ; 0x020339F0
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _02033A00
	ldr r0, _02033A04 ; =0x021D4124
	mov r2, #1
	ldr r1, [r0, #4]
	ldr r0, _02033A08 ; =0x00001344
	strb r2, [r1, r0]
_02033A00:
	bx lr
	nop
_02033A04: .word 0x021D4124
_02033A08: .word 0x00001344
	thumb_func_end sub_020339F0

	thumb_func_start sub_02033A0C
sub_02033A0C: ; 0x02033A0C
	push {r4, lr}
	ldr r2, _02033A38 ; =0x021D4124
	add r1, r0, #0
	ldr r3, [r2, #4]
	ldr r0, _02033A3C ; =0x00001344
	mov r4, #0
	strb r4, [r3, r0]
	ldr r2, [r2, #4]
	sub r0, #0x34
	ldr r0, [r2, r0]
	cmp r0, #4
	bne _02033A32
	ldr r0, _02033A40 ; =sub_020339F0
	bl sub_020E0F6C
	cmp r0, #2
	bne _02033A32
	mov r0, #1
	pop {r4, pc}
_02033A32:
	mov r0, #0
	pop {r4, pc}
	nop
_02033A38: .word 0x021D4124
_02033A3C: .word 0x00001344
_02033A40: .word sub_020339F0
	thumb_func_end sub_02033A0C

	thumb_func_start sub_02033A44
sub_02033A44: ; 0x02033A44
	ldr r0, _02033A60 ; =0x021D4124
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _02033A5C
	ldr r0, _02033A64 ; =0x00001345
	ldrb r0, [r1, r0]
	cmp r0, #6
	blo _02033A58
	mov r0, #1
	bx lr
_02033A58:
	mov r0, #0
	bx lr
_02033A5C:
	mov r0, #0
	bx lr
	.balign 4, 0
_02033A60: .word 0x021D4124
_02033A64: .word 0x00001345
	thumb_func_end sub_02033A44

	thumb_func_start sub_02033A68
sub_02033A68: ; 0x02033A68
	ldr r0, _02033A74 ; =0x021D4124
	mov r2, #0
	ldr r1, [r0, #4]
	ldr r0, _02033A78 ; =0x00001345
	strb r2, [r1, r0]
	bx lr
	.balign 4, 0
_02033A74: .word 0x021D4124
_02033A78: .word 0x00001345
	thumb_func_end sub_02033A68

	thumb_func_start sub_02033A7C
sub_02033A7C: ; 0x02033A7C
	ldr r1, _02033A88 ; =0x021D4124
	ldr r2, [r1, #4]
	ldr r1, _02033A8C ; =0x00001320
	str r0, [r2, r1]
	bx lr
	nop
_02033A88: .word 0x021D4124
_02033A8C: .word 0x00001320
	thumb_func_end sub_02033A7C

	thumb_func_start sub_02033A90
sub_02033A90: ; 0x02033A90
	ldr r1, _02033A9C ; =0x021D4124
	ldr r2, [r1, #4]
	ldr r1, _02033AA0 ; =0x00001328
	str r0, [r2, r1]
	bx lr
	nop
_02033A9C: .word 0x021D4124
_02033AA0: .word 0x00001328
	thumb_func_end sub_02033A90

	thumb_func_start sub_02033AA4
sub_02033AA4: ; 0x02033AA4
	ldr r1, _02033AB0 ; =0x021D4124
	ldr r2, [r1, #4]
	ldr r1, _02033AB4 ; =0x00001342
	strb r0, [r2, r1]
	bx lr
	nop
_02033AB0: .word 0x021D4124
_02033AB4: .word 0x00001342
	thumb_func_end sub_02033AA4

	thumb_func_start sub_02033AB8
sub_02033AB8: ; 0x02033AB8
	ldr r0, _02033AC4 ; =0x021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033AC8 ; =0x00001342
	ldrb r0, [r1, r0]
	bx lr
	nop
_02033AC4: .word 0x021D4124
_02033AC8: .word 0x00001342
	thumb_func_end sub_02033AB8

	thumb_func_start sub_02033ACC
sub_02033ACC: ; 0x02033ACC
	ldr r1, _02033AD8 ; =0x021D4124
	ldr r2, [r1, #4]
	ldr r1, _02033ADC ; =0x00001343
	strb r0, [r2, r1]
	bx lr
	nop
_02033AD8: .word 0x021D4124
_02033ADC: .word 0x00001343
	thumb_func_end sub_02033ACC

	thumb_func_start sub_02033AE0
sub_02033AE0: ; 0x02033AE0
	str r1, [r0]
	strh r2, [r0, #0xa]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033AE0

	thumb_func_start sub_02033AF0
sub_02033AF0: ; 0x02033AF0
	push {r3, r4, r5, r6, r7, lr}
	str r2, [sp]
	add r5, r0, #0
	add r7, r1, #0
	bl sub_02033BF4
	ldr r1, [sp]
	cmp r0, r1
	bgt _02033B08
	bl sub_02037974
	pop {r3, r4, r5, r6, r7, pc}
_02033B08:
	mov r0, #8
	ldrsh r4, [r5, r0]
	ldrsh r1, [r5, r0]
	ldr r0, [sp]
	mov r6, #0
	add r0, r1, r0
	cmp r4, r0
	bge _02033B3E
_02033B18:
	cmp r7, #0
	bne _02033B20
	bl GF_AssertFail
_02033B20:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02033C14
	ldrb r2, [r7, r6]
	ldr r1, [r5]
	add r4, r4, #1
	strb r2, [r1, r0]
	mov r0, #8
	ldrsh r1, [r5, r0]
	ldr r0, [sp]
	add r6, r6, #1
	add r0, r1, r0
	cmp r4, r0
	blt _02033B18
_02033B3E:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02033C14
	strh r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02033AF0

	thumb_func_start sub_02033B4C
sub_02033B4C: ; 0x02033B4C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02033B78
	mov r1, #4
	add r4, r0, #0
	ldrsh r1, [r5, r1]
	add r0, r5, #0
	add r1, r1, r4
	bl sub_02033C14
	strh r0, [r5, #4]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02033B4C

	thumb_func_start sub_02033B68
sub_02033B68: ; 0x02033B68
	push {r3, lr}
	add r1, sp, #0
	mov r2, #1
	bl sub_02033B4C
	add r0, sp, #0
	ldrb r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02033B68

	thumb_func_start sub_02033B78
sub_02033B78: ; 0x02033B78
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #4
	ldrsh r4, [r5, r0]
	add r7, r2, #0
	str r1, [sp]
	add r0, r4, r7
	mov r6, #0
	cmp r4, r0
	bge _02033BBE
_02033B8C:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02033C14
	mov r1, #6
	ldrsh r1, [r5, r1]
	cmp r1, r0
	bne _02033BA0
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02033BA0:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02033C14
	ldr r1, [r5]
	add r4, r4, #1
	ldrb r1, [r1, r0]
	ldr r0, [sp]
	strb r1, [r0, r6]
	mov r0, #4
	ldrsh r0, [r5, r0]
	add r6, r6, #1
	add r0, r0, r7
	cmp r4, r0
	blt _02033B8C
_02033BBE:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02033B78

	thumb_func_start sub_02033BC4
sub_02033BC4: ; 0x02033BC4
	mov r1, #4
	mov r3, #6
	ldrsh r1, [r0, r1]
	ldrsh r2, [r0, r3]
	cmp r1, r2
	ble _02033BDC
	mov r2, #0xa
	ldrsh r2, [r0, r2]
	ldrsh r0, [r0, r3]
	add r0, r2, r0
	sub r0, r0, r1
	bx lr
_02033BDC:
	ldrsh r0, [r0, r3]
	sub r0, r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033BC4

	thumb_func_start sub_02033BE4
sub_02033BE4: ; 0x02033BE4
	push {r4, lr}
	add r4, r0, #0
	bl sub_02033BC4
	mov r1, #0xa
	ldrsh r1, [r4, r1]
	sub r0, r1, r0
	pop {r4, pc}
	thumb_func_end sub_02033BE4

	thumb_func_start sub_02033BF4
sub_02033BF4: ; 0x02033BF4
	mov r1, #4
	mov r2, #8
	ldrsh r3, [r0, r1]
	ldrsh r1, [r0, r2]
	cmp r3, r1
	ble _02033C06
	ldrsh r0, [r0, r2]
	sub r0, r3, r0
	bx lr
_02033C06:
	mov r1, #0xa
	ldrsh r1, [r0, r1]
	ldrsh r0, [r0, r2]
	sub r0, r0, r3
	sub r0, r1, r0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033BF4

	thumb_func_start sub_02033C14
sub_02033C14: ; 0x02033C14
	push {r3, lr}
	add r2, r0, #0
	add r0, r1, #0
	mov r1, #0xa
	ldrsh r1, [r2, r1]
	bl _s32_div_f
	add r0, r1, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02033C14

	thumb_func_start sub_02033C28
sub_02033C28: ; 0x02033C28
	mov r1, #8
	ldrsh r1, [r0, r1]
	strh r1, [r0, #6]
	bx lr
	thumb_func_end sub_02033C28

	thumb_func_start sub_02033C30
sub_02033C30: ; 0x02033C30
	ldr r3, [r0, #0x1c]
	mov r2, #0
	ldr r1, [r0, #0x18]
	cmp r3, #0
	ble _02033C4C
_02033C3A:
	ldrb r0, [r1, #0xe]
	cmp r0, #0
	bne _02033C44
	add r0, r1, #0
	bx lr
_02033C44:
	add r2, r2, #1
	add r1, #0x10
	cmp r2, r3
	blt _02033C3A
_02033C4C:
	mov r0, #0
	bx lr
	thumb_func_end sub_02033C30

	thumb_func_start sub_02033C50
sub_02033C50: ; 0x02033C50
	ldr r3, [r0, #0x1c]
	mov r2, #0
	ldr r1, [r0, #0x18]
	cmp r3, #0
	ble _02033C6C
_02033C5A:
	ldrb r0, [r1, #0xe]
	cmp r0, #0
	beq _02033C64
	mov r0, #0
	bx lr
_02033C64:
	add r2, r2, #1
	add r1, #0x10
	cmp r2, r3
	blt _02033C5A
_02033C6C:
	mov r0, #1
	bx lr
	thumb_func_end sub_02033C50

	thumb_func_start sub_02033C70
sub_02033C70: ; 0x02033C70
	ldr r1, [r0]
	cmp r1, #0
	beq _02033C8E
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _02033C84
	str r1, [r0]
	mov r0, #0
	str r0, [r1, #4]
	b _02033C8A
_02033C84:
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
_02033C8A:
	mov r0, #1
	bx lr
_02033C8E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033C70

	thumb_func_start sub_02033C94
sub_02033C94: ; 0x02033C94
	ldr r2, [r0]
	strb r1, [r2]
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	ldr r1, [r0, #4]
	sub r1, r1, #1
	str r1, [r0, #4]
	bne _02033CAA
	mov r0, #1
	bx lr
_02033CAA:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033C94

	thumb_func_start sub_02033CB0
sub_02033CB0: ; 0x02033CB0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0xe]
	add r4, r1, #0
	bl sub_020341DC
	add r6, r0, #0
	ldr r0, _02033D24 ; =0x0000FFFF
	cmp r6, r0
	ldr r0, [r4, #4]
	bne _02033CD6
	cmp r0, #3
	bge _02033CE6
	ldrb r1, [r5, #0xf]
	mov r0, #1
	bic r1, r0
	strb r1, [r5, #0xf]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02033CD6:
	cmp r0, #1
	bge _02033CE6
	ldrb r1, [r5, #0xf]
	mov r0, #1
	bic r1, r0
	strb r1, [r5, #0xf]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02033CE6:
	ldrb r1, [r5, #0xe]
	add r0, r4, #0
	bl sub_02033C94
	ldr r0, _02033D24 ; =0x0000FFFF
	cmp r6, r0
	bne _02033D10
	ldrh r1, [r5, #0xc]
	add r0, r4, #0
	asr r1, r1, #8
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02033C94
	ldrh r1, [r5, #0xc]
	add r0, r4, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02033C94
	b _02033D12
_02033D10:
	strh r6, [r5, #0xc]
_02033D12:
	ldrb r1, [r5, #0xf]
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r5, #0xf]
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02033D24: .word 0x0000FFFF
	thumb_func_end sub_02033CB0

	thumb_func_start sub_02033D28
sub_02033D28: ; 0x02033D28
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0xe]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_020341DC
	ldr r1, _02033DEC ; =0x0000FFFF
	cmp r0, r1
	bne _02033D42
	mov r2, #3
	b _02033D44
_02033D42:
	mov r2, #1
_02033D44:
	ldrh r0, [r5, #0xc]
	ldr r1, [r4, #4]
	add r0, r0, r2
	cmp r1, r0
	bge _02033D56
	cmp r7, #0
	bne _02033D56
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02033D56:
	ldrb r0, [r5, #0xf]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	beq _02033D70
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02033CB0
	cmp r0, #0
	beq _02033D70
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02033D70:
	ldrh r3, [r5, #0xc]
	ldr r2, [r4, #4]
	cmp r2, r3
	ldrb r0, [r5, #0xf]
	bge _02033DBA
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _02033D8A
	ldr r1, [r4]
	add r0, r6, #0
	bl sub_02033B4C
	b _02033DA0
_02033D8A:
	mov r3, #0
	cmp r2, #0
	ble _02033DA0
_02033D90:
	ldr r0, [r5]
	ldrb r1, [r0, r3]
	ldr r0, [r4]
	strb r1, [r0, r3]
	ldr r0, [r4, #4]
	add r3, r3, #1
	cmp r3, r0
	blt _02033D90
_02033DA0:
	ldr r1, [r5]
	ldr r0, [r4, #4]
	add r0, r1, r0
	str r0, [r5]
	ldrh r1, [r5, #0xc]
	ldr r0, [r4, #4]
	sub r0, r1, r0
	strh r0, [r5, #0xc]
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02033DBA:
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _02033DCC
	ldr r1, [r4]
	add r0, r6, #0
	add r2, r3, #0
	bl sub_02033B4C
	b _02033DD6
_02033DCC:
	ldr r0, [r5]
	ldr r1, [r4]
	add r2, r3, #0
	bl MIi_CpuCopy8
_02033DD6:
	ldrh r0, [r5, #0xc]
	ldr r1, [r4]
	add r0, r1, r0
	str r0, [r4]
	ldrh r0, [r5, #0xc]
	ldr r1, [r4, #4]
	sub r0, r1, r0
	str r0, [r4, #4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02033DEC: .word 0x0000FFFF
	thumb_func_end sub_02033D28

	thumb_func_start sub_02033DF0
sub_02033DF0: ; 0x02033DF0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	add r7, r3, #0
	bl sub_02033C30
	add r4, r0, #0
	bne _02033E0A
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02033E0A:
	ldr r0, _02033E7C ; =0x0000FFFE
	cmp r7, r0
	blt _02033E14
	bl GF_AssertFail
_02033E14:
	ldr r0, [sp]
	bl sub_020341DC
	add r6, r0, #0
	ldr r0, _02033E80 ; =0x0000FFFF
	cmp r6, r0
	bne _02033E24
	add r6, r7, #0
_02033E24:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _02033E56
	ldr r0, [r5, #0x14]
	bl sub_02033BE4
	add r1, r6, #3
	cmp r1, r0
	blt _02033E3C
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02033E3C:
	ldr r0, [r5, #0x14]
	ldr r1, [sp, #4]
	ldr r3, _02033E84 ; =0x00000109
	add r2, r6, #0
	bl sub_02033AF0
	ldr r0, [r5, #0x14]
	bl sub_02033C28
	ldrb r1, [r4, #0xf]
	mov r0, #2
	orr r0, r1
	strb r0, [r4, #0xf]
_02033E56:
	ldr r0, [sp]
	strh r6, [r4, #0xc]
	strb r0, [r4, #0xe]
	ldr r0, [sp, #4]
	str r0, [r4]
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _02033E6C
	str r4, [r5, #4]
	str r4, [r5]
	b _02033E74
_02033E6C:
	str r4, [r0, #8]
	ldr r0, [r5, #4]
	str r0, [r4, #4]
	str r4, [r5, #4]
_02033E74:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02033E7C: .word 0x0000FFFE
_02033E80: .word 0x0000FFFF
_02033E84: .word 0x00000109
	thumb_func_end sub_02033DF0

	thumb_func_start sub_02033E88
sub_02033E88: ; 0x02033E88
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _02033E92
	add r0, r1, #0
	bx lr
_02033E92:
	ldr r1, [r0]
	cmp r1, #0
	beq _02033E9C
	add r0, r1, #0
	bx lr
_02033E9C:
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _02033EA4
	mov r0, #0
_02033EA4:
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033E88

	thumb_func_start sub_02033EA8
sub_02033EA8: ; 0x02033EA8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq _02033EB8
	mov r0, #0
	str r0, [r4, #0x10]
	pop {r4, pc}
_02033EB8:
	bl sub_02033C70
	cmp r0, #0
	bne _02033EC8
	add r4, #8
	add r0, r4, #0
	bl sub_02033C70
_02033EC8:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02033EA8

	thumb_func_start sub_02033ECC
sub_02033ECC: ; 0x02033ECC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	mov r7, #1
	str r2, [sp]
	cmp r0, #0
	ble _02033F22
_02033EDC:
	add r0, r5, #0
	bl sub_02033E88
	add r6, r0, #0
	beq _02033F22
	add r0, r5, #0
	bl sub_02033EA8
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	add r3, r7, #0
	bl sub_02033D28
	cmp r0, #0
	bne _02033F00
	str r6, [r5, #0x10]
	b _02033F22
_02033F00:
	mov r0, #0
	ldr r1, [r4, #4]
	mvn r0, r0
	cmp r1, r0
	bne _02033F10
	str r6, [r5, #0x10]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02033F10:
	add r0, r6, #0
	mov r1, #0
	mov r2, #0x10
	bl MIi_CpuFill8
	ldr r0, [r4, #4]
	ldr r7, [sp]
	cmp r0, #0
	bgt _02033EDC
_02033F22:
	ldr r0, [r4, #4]
	mov r2, #0
	cmp r0, #0
	ble _02033F3E
	mov r1, #0xee
_02033F2C:
	ldr r0, [r4]
	add r2, r2, #1
	strb r1, [r0]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	ldr r0, [r4, #4]
	cmp r2, r0
	blt _02033F2C
_02033F3E:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02033ECC

	thumb_func_start sub_02033F44
sub_02033F44: ; 0x02033F44
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r6, r2, #0
	mov r1, #0
	mov r2, #0x20
	add r5, r0, #0
	bl MIi_CpuFill8
	lsl r7, r4, #4
	mov r0, #0xf
	add r1, r7, #0
	bl AllocFromHeap
	mov r1, #0
	add r2, r7, #0
	str r0, [r5, #0x18]
	bl MIi_CpuFill8
	str r4, [r5, #0x1c]
	str r6, [r5, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02033F44

	thumb_func_start sub_02033F70
sub_02033F70: ; 0x02033F70
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #0x1c]
	ldr r0, [r4, #0x18]
	mov r1, #0
	lsl r2, r2, #4
	bl MIi_CpuFill8
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	str r0, [r4, #0x10]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02033F70

	thumb_func_start sub_02033F90
sub_02033F90: ; 0x02033F90
	ldr r3, _02033F98 ; =FreeToHeap
	ldr r0, [r0, #0x18]
	bx r3
	nop
_02033F98: .word FreeToHeap
	thumb_func_end sub_02033F90

	thumb_func_start sub_02033F9C
sub_02033F9C: ; 0x02033F9C
	push {r3, r4}
	ldr r4, [r0, #0x1c]
	mov r2, #0
	ldr r3, [r0, #0x18]
	cmp r4, #0
	ble _02033FBC
_02033FA8:
	ldrb r0, [r3, #0xe]
	cmp r0, r1
	bne _02033FB4
	mov r0, #1
	pop {r3, r4}
	bx lr
_02033FB4:
	add r2, r2, #1
	add r3, #0x10
	cmp r2, r4
	blt _02033FA8
_02033FBC:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033F9C

	thumb_func_start sub_02033FC4
sub_02033FC4: ; 0x02033FC4
	push {r3, r4, lr}
	sub sp, #0x2c
	ldr r3, _02033FEC ; =0x020F692C
	add r4, r0, #0
	add r2, sp, #0
	mov r1, #0x29
_02033FD0:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02033FD0
	cmp r4, #0x29
	blo _02033FE4
	bl GF_AssertFail
_02033FE4:
	add r0, sp, #0
	ldrb r0, [r0, r4]
	add sp, #0x2c
	pop {r3, r4, pc}
	.balign 4, 0
_02033FEC: .word 0x020F692C
	thumb_func_end sub_02033FC4

	thumb_func_start sub_02033FF0
sub_02033FF0: ; 0x02033FF0
	push {r3, r4, lr}
	sub sp, #0x2c
	ldr r3, _02034018 ; =0x020F6955
	add r4, r0, #0
	add r2, sp, #0
	mov r1, #0x29
_02033FFC:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02033FFC
	cmp r4, #0x29
	blo _02034010
	bl GF_AssertFail
_02034010:
	add r0, sp, #0
	ldrb r0, [r0, r4]
	add sp, #0x2c
	pop {r3, r4, pc}
	.balign 4, 0
_02034018: .word 0x020F6955
	thumb_func_end sub_02033FF0

	thumb_func_start sub_0203401C
sub_0203401C: ; 0x0203401C
	cmp r0, #0x12
	bgt _02034036
	bge _0203403A
	cmp r0, #0xd
	bgt _0203403E
	cmp r0, #7
	blt _0203403E
	beq _0203403A
	cmp r0, #9
	beq _0203403A
	cmp r0, #0xd
	beq _0203403A
	b _0203403E
_02034036:
	cmp r0, #0x1a
	bne _0203403E
_0203403A:
	mov r0, #1
	bx lr
_0203403E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203401C

	thumb_func_start sub_02034044
sub_02034044: ; 0x02034044
	sub r0, #0x13
	cmp r0, #0x11
	bhi _0203407E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02034056: ; jump table
	.short _0203407A - _02034056 - 2 ; case 0
	.short _0203407A - _02034056 - 2 ; case 1
	.short _0203407A - _02034056 - 2 ; case 2
	.short _0203407A - _02034056 - 2 ; case 3
	.short _0203407A - _02034056 - 2 ; case 4
	.short _0203407A - _02034056 - 2 ; case 5
	.short _0203407A - _02034056 - 2 ; case 6
	.short _0203407E - _02034056 - 2 ; case 7
	.short _0203407E - _02034056 - 2 ; case 8
	.short _0203407E - _02034056 - 2 ; case 9
	.short _0203407A - _02034056 - 2 ; case 10
	.short _0203407E - _02034056 - 2 ; case 11
	.short _0203407E - _02034056 - 2 ; case 12
	.short _0203407E - _02034056 - 2 ; case 13
	.short _0203407A - _02034056 - 2 ; case 14
	.short _0203407A - _02034056 - 2 ; case 15
	.short _0203407A - _02034056 - 2 ; case 16
	.short _0203407A - _02034056 - 2 ; case 17
_0203407A:
	mov r0, #1
	bx lr
_0203407E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02034044

	thumb_func_start sub_02034084
sub_02034084: ; 0x02034084
	cmp r0, #0x1d
	beq _02034090
	cmp r0, #0x21
	beq _02034090
	cmp r0, #0x23
	bne _02034094
_02034090:
	mov r0, #1
	bx lr
_02034094:
	mov r0, #0
	bx lr
	thumb_func_end sub_02034084

	thumb_func_start sub_02034098
sub_02034098: ; 0x02034098
	cmp r0, #0x17
	bgt _020340B8
	add r1, r0, #0
	sub r1, #0x13
	bmi _020340C0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020340AE: ; jump table
	.short _020340BC - _020340AE - 2 ; case 0
	.short _020340BC - _020340AE - 2 ; case 1
	.short _020340BC - _020340AE - 2 ; case 2
	.short _020340BC - _020340AE - 2 ; case 3
	.short _020340BC - _020340AE - 2 ; case 4
_020340B8:
	cmp r0, #0x22
	bne _020340C0
_020340BC:
	mov r0, #1
	bx lr
_020340C0:
	mov r0, #0
	bx lr
	thumb_func_end sub_02034098

	thumb_func_start sub_020340C4
sub_020340C4: ; 0x020340C4
	cmp r0, #0x26
	bgt _020340F6
	bge _02034102
	cmp r0, #8
	bgt _020340F0
	cmp r0, #0
	blt _02034106
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020340DE: ; jump table
	.short _02034106 - _020340DE - 2 ; case 0
	.short _02034102 - _020340DE - 2 ; case 1
	.short _02034102 - _020340DE - 2 ; case 2
	.short _02034102 - _020340DE - 2 ; case 3
	.short _02034102 - _020340DE - 2 ; case 4
	.short _02034102 - _020340DE - 2 ; case 5
	.short _02034106 - _020340DE - 2 ; case 6
	.short _02034106 - _020340DE - 2 ; case 7
	.short _02034102 - _020340DE - 2 ; case 8
_020340F0:
	cmp r0, #0x25
	beq _02034102
	b _02034106
_020340F6:
	cmp r0, #0x27
	bgt _020340FE
	beq _02034102
	b _02034106
_020340FE:
	cmp r0, #0x28
	bne _02034106
_02034102:
	mov r0, #1
	bx lr
_02034106:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_020340C4

	thumb_func_start sub_0203410C
sub_0203410C: ; 0x0203410C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _02034150 ; =0x021D412C
	add r4, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	cmp r0, #0
	bne _02034128
	mov r0, #0xf
	mov r1, #0x18
	bl AllocFromHeap
	ldr r1, _02034150 ; =0x021D412C
	str r0, [r1]
_02034128:
	ldr r0, _02034150 ; =0x021D412C
	mov r3, #0
	ldr r1, [r0]
	add r2, r3, #0
	str r5, [r1]
	ldr r1, [r0]
	str r4, [r1, #4]
	ldr r1, [r0]
	str r6, [r1, #8]
_0203413A:
	ldr r1, [r0]
	add r1, r1, r3
	add r3, r3, #1
	strb r2, [r1, #0xc]
	cmp r3, #8
	blt _0203413A
	ldr r0, _02034150 ; =0x021D412C
	ldr r0, [r0]
	strb r2, [r0, #0x14]
	pop {r4, r5, r6, pc}
	nop
_02034150: .word 0x021D412C
	thumb_func_end sub_0203410C

	thumb_func_start sub_02034154
sub_02034154: ; 0x02034154
	push {r3, lr}
	ldr r0, _0203416C ; =0x021D412C
	ldr r0, [r0]
	cmp r0, #0
	beq _02034168
	bl FreeToHeap
	ldr r0, _0203416C ; =0x021D412C
	mov r1, #0
	str r1, [r0]
_02034168:
	pop {r3, pc}
	nop
_0203416C: .word 0x021D412C
	thumb_func_end sub_02034154

	thumb_func_start sub_02034170
sub_02034170: ; 0x02034170
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r4, #0x16
	bge _02034188
	mov r0, #0xc
	mul r1, r0
	ldr r0, _020341D4 ; =0x020F6980
	ldr r4, [r0, r1]
	b _020341B0
_02034188:
	ldr r0, _020341D8 ; =0x021D412C
	ldr r0, [r0]
	cmp r0, #0
	bne _02034194
	bl GF_AssertFail
_02034194:
	ldr r0, _020341D8 ; =0x021D412C
	ldr r1, [r0]
	ldr r0, [r1, #4]
	add r0, #0x16
	cmp r4, r0
	ble _020341A6
	bl sub_02037974
	pop {r3, r4, r5, r6, r7, pc}
_020341A6:
	ldr r1, [r1]
	sub r4, #0x16
	mov r0, #0xc
	mul r0, r4
	ldr r4, [r1, r0]
_020341B0:
	cmp r4, #0
	beq _020341D2
	ldr r0, _020341D8 ; =0x021D412C
	ldr r3, [r0]
	cmp r3, #0
	beq _020341C8
	ldr r3, [r3, #8]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	blx r4
	pop {r3, r4, r5, r6, r7, pc}
_020341C8:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	mov r3, #0
	blx r4
_020341D2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020341D4: .word 0x020F6980
_020341D8: .word 0x021D412C
	thumb_func_end sub_02034170

	thumb_func_start sub_020341DC
sub_020341DC: ; 0x020341DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	cmp r5, #0x16
	bge _020341F2
	mov r0, #0xc
	add r1, r5, #0
	mul r1, r0
	ldr r0, _0203423C ; =0x020F6984
	ldr r0, [r0, r1]
	b _0203422E
_020341F2:
	ldr r0, _02034240 ; =0x021D412C
	ldr r0, [r0]
	cmp r0, #0
	bne _020341FE
	bl GF_AssertFail
_020341FE:
	ldr r0, _02034240 ; =0x021D412C
	ldr r1, [r0]
	cmp r1, #0
	bne _0203420E
	bl sub_02037974
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203420E:
	ldr r0, [r1, #4]
	add r0, #0x16
	cmp r5, r0
	ble _02034222
	bl GF_AssertFail
	bl sub_02037974
	mov r0, #0
	pop {r3, r4, r5, pc}
_02034222:
	ldr r1, [r1]
	sub r5, #0x16
	mov r0, #0xc
	mul r0, r5
	add r0, r1, r0
	ldr r0, [r0, #4]
_0203422E:
	cmp r0, #0
	beq _02034236
	blx r0
	add r4, r0, #0
_02034236:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0203423C: .word 0x020F6984
_02034240: .word 0x021D412C
	thumb_func_end sub_020341DC

	thumb_func_start sub_02034244
sub_02034244: ; 0x02034244
	cmp r0, #0x16
	bge _0203425C
	mov r1, #0xc
	mul r1, r0
	ldr r0, _02034278 ; =0x020F6988
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02034258
	mov r0, #1
	bx lr
_02034258:
	mov r0, #0
	bx lr
_0203425C:
	ldr r1, _0203427C ; =0x021D412C
	sub r0, #0x16
	ldr r1, [r1]
	ldr r2, [r1]
	mov r1, #0xc
	mul r1, r0
	add r0, r2, r1
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02034274
	mov r0, #1
	bx lr
_02034274:
	mov r0, #0
	bx lr
	.balign 4, 0
_02034278: .word 0x020F6988
_0203427C: .word 0x021D412C
	thumb_func_end sub_02034244

	thumb_func_start sub_02034280
sub_02034280: ; 0x02034280
	push {r3, r4, r5, lr}
	add r3, r0, #0
	cmp r3, #0x16
	bge _02034298
	mov r4, #0xc
	mul r4, r3
	ldr r3, _020342B0 ; =0x020F6988
	add r0, r1, #0
	ldr r3, [r3, r4]
	mov r1, #0
	blx r3
	pop {r3, r4, r5, pc}
_02034298:
	ldr r0, _020342B4 ; =0x021D412C
	sub r3, #0x16
	ldr r4, [r0]
	add r0, r1, #0
	ldr r1, [r4, #8]
	ldr r5, [r4]
	mov r4, #0xc
	mul r4, r3
	add r3, r5, r4
	ldr r3, [r3, #8]
	blx r3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020342B0: .word 0x020F6988
_020342B4: .word 0x021D412C
	thumb_func_end sub_02034280

	thumb_func_start sub_020342B8
sub_020342B8: ; 0x020342B8
	ldr r0, _020342BC ; =0x0000FFFF
	bx lr
	.balign 4, 0
_020342BC: .word 0x0000FFFF
	thumb_func_end sub_020342B8

	thumb_func_start sub_020342C0
sub_020342C0: ; 0x020342C0
	mov r0, #0
	bx lr
	thumb_func_end sub_020342C0

	thumb_func_start sub_020342C4
sub_020342C4: ; 0x020342C4
	mov r0, #1
	bx lr
	thumb_func_end sub_020342C4

	thumb_func_start sub_020342C8
sub_020342C8: ; 0x020342C8
	mov r0, #2
	bx lr
	thumb_func_end sub_020342C8

	thumb_func_start sub_020342CC
sub_020342CC: ; 0x020342CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0203769C
	cmp r0, #0
	bne _0203430A
	ldr r4, _0203430C ; =0x021D412C
	mov r1, #1
	ldr r0, [r4]
	add r0, r0, r5
	strb r1, [r0, #0xc]
	mov r5, #0
_020342E4:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _020342FA
	ldr r0, [r4]
	add r0, r0, r5
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	beq _0203430A
_020342FA:
	add r5, r5, #1
	cmp r5, #8
	blt _020342E4
	mov r1, #0
	mov r0, #0xe
	add r2, r1, #0
	bl sub_02037108
_0203430A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203430C: .word 0x021D412C
	thumb_func_end sub_020342CC

	thumb_func_start sub_02034310
sub_02034310: ; 0x02034310
	ldr r0, _02034330 ; =0x021D412C
	mov r3, #0
	ldr r1, [r0]
	str r3, [r1]
	ldr r1, [r0]
	str r3, [r1, #4]
	ldr r1, [r0]
	str r3, [r1, #8]
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0x14]
	ldr r3, _02034334 ; =sub_020376E0
	mov r0, #0xf
	add r1, r2, #0
	bx r3
	nop
_02034330: .word 0x021D412C
_02034334: .word sub_020376E0
	thumb_func_end sub_02034310

	thumb_func_start sub_02034338
sub_02034338: ; 0x02034338
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203769C
	cmp r0, #0
	bne _0203434E
	ldr r0, _02034350 ; =0x021D412C
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, r4
	strb r1, [r0, #0xc]
_0203434E:
	pop {r4, pc}
	.balign 4, 0
_02034350: .word 0x021D412C
	thumb_func_end sub_02034338

	thumb_func_start sub_02034354
sub_02034354: ; 0x02034354
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #8]
	ldr r0, _020343E0 ; =0x021D4130
	ldr r0, [r0]
	cmp r0, #0
	bne _020343DA
	mov r1, #0xea
	mov r0, #0xf
	lsl r1, r1, #2
	bl AllocFromHeap
	ldr r1, _020343E0 ; =0x021D4130
	mov r2, #0xea
	str r0, [r1]
	mov r1, #0
	lsl r2, r2, #2
	bl MIi_CpuFill8
	mov r6, #0
	ldr r7, _020343E0 ; =0x021D4130
	add r4, r6, #0
	add r5, r6, #0
_0203438A:
	ldr r1, [r7]
	add r0, r1, #0
	add r0, #0x2c
	add r2, r0, r4
	mov r0, #0xd3
	add r1, r1, r5
	lsl r0, r0, #2
	str r2, [r1, r0]
	add r0, r6, #0
	bl sub_020346E8
	add r6, r6, #1
	add r4, #0x68
	add r5, r5, #4
	cmp r6, #8
	blt _0203438A
	ldr r2, _020343E0 ; =0x021D4130
	mov r1, #0xe9
	ldr r3, [r2]
	mov r0, #0
	lsl r1, r1, #2
	strb r0, [r3, r1]
	ldr r4, [r2]
	add r3, r1, #1
	strb r0, [r4, r3]
	add r3, r1, #2
	ldr r4, [r2]
	sub r1, #0x58
	strb r0, [r4, r3]
	ldr r3, [r2]
	ldr r0, [sp]
	str r0, [r3, #8]
	ldr r3, [r2]
	ldr r0, [sp, #4]
	str r0, [r3, #4]
	ldr r2, [r2]
	ldr r0, [sp, #8]
	ldr r1, [r2, r1]
	bl sub_02028EE4
_020343DA:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_020343E0: .word 0x021D4130
	thumb_func_end sub_02034354

	thumb_func_start sub_020343E4
sub_020343E4: ; 0x020343E4
	push {r3, r4, r5, lr}
	ldr r1, _0203441C ; =0x021D4130
	ldr r0, [r1]
	cmp r0, #0
	beq _02034418
	mov r4, #0
	mov r0, #0xd3
	add r5, r4, #0
	add r3, r4, #0
	lsl r0, r0, #2
_020343F8:
	ldr r2, [r1]
	add r4, r4, #1
	add r2, r2, r5
	add r5, r5, #4
	str r3, [r2, r0]
	cmp r4, #8
	blt _020343F8
	ldr r0, _0203441C ; =0x021D4130
	ldr r0, [r0]
	cmp r0, #0
	beq _02034412
	bl FreeToHeap
_02034412:
	ldr r0, _0203441C ; =0x021D4130
	mov r1, #0
	str r1, [r0]
_02034418:
	pop {r3, r4, r5, pc}
	nop
_0203441C: .word 0x021D4130
	thumb_func_end sub_020343E4

	thumb_func_start sub_02034420
sub_02034420: ; 0x02034420
	ldr r0, _02034430 ; =0x021D4130
	ldr r0, [r0]
	cmp r0, #0
	beq _0203442C
	mov r0, #1
	bx lr
_0203442C:
	mov r0, #0
	bx lr
	.balign 4, 0
_02034430: .word 0x021D4130
	thumb_func_end sub_02034420

	thumb_func_start sub_02034434
sub_02034434: ; 0x02034434
	push {r3, r4, r5, r6, r7, lr}
	bl sub_0203769C
	add r4, r0, #0
	ldr r0, _0203451C ; =0x021D4130
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_0202C854
	str r0, [sp]
	ldr r0, _0203451C ; =0x021D4130
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_0202C6F4
	add r7, r0, #0
	ldr r0, _0203451C ; =0x021D4130
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_0202CA44
	add r6, r0, #0
	ldr r0, _0203451C ; =0x021D4130
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	bne _02034470
	ldr r0, [r1, #8]
	bl Sav2_PlayerData_GetProfileAddr
_02034470:
	ldr r1, _0203451C ; =0x021D4130
	ldr r2, [r1]
	lsl r1, r4, #2
	add r2, r2, r1
	mov r1, #0xd3
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	bl sub_02028EE4
	mov r0, #0x68
	add r5, r4, #0
	mul r5, r0
	ldr r0, _0203451C ; =0x021D4130
	ldr r0, [r0]
	add r0, #0x68
	add r0, r0, r5
	bl OS_GetMacAddress
	ldr r0, [sp]
	mov r1, #1
	mov r2, #0
	bl sub_0202C7E0
	ldr r1, _0203451C ; =0x021D4130
	mov r2, #0x10
	ldr r1, [r1]
	add r1, #0x58
	add r1, r1, r5
	bl MIi_CpuCopy8
	add r0, r6, #0
	bl sub_0202CA8C
	ldr r1, _0203451C ; =0x021D4130
	ldr r1, [r1]
	add r1, r1, r5
	add r1, #0x6f
	strb r0, [r1]
	add r0, r6, #0
	bl sub_0202CA90
	ldr r2, _0203451C ; =0x021D4130
	ldr r1, [r2]
	add r1, r1, r5
	add r1, #0x70
	strb r0, [r1]
	ldr r0, [r2]
	mov r1, #0
	add r0, r0, r5
	add r0, #0x71
	strb r1, [r0]
	add r0, r7, #0
	bl sub_0202C08C
	ldr r1, _0203451C ; =0x021D4130
	ldr r1, [r1]
	add r1, #0x4c
	add r1, r1, r5
	bl sub_020A037C
	ldr r0, _0203451C ; =0x021D4130
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x20
	add r0, #0xc
	add r0, r0, r5
	bl MIi_CpuFill8
	ldr r0, _0203451C ; =0x021D4130
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _0203450A
	add r1, #0xc
	add r1, r1, r5
	bl sub_020290BC
_0203450A:
	ldr r1, _0203451C ; =0x021D4130
	mov r0, #3
	ldr r1, [r1]
	mov r2, #0x68
	add r1, #0xc
	add r1, r1, r5
	bl sub_02037030
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203451C: .word 0x021D4130
	thumb_func_end sub_02034434

	thumb_func_start sub_02034520
sub_02034520: ; 0x02034520
	mov r0, #0x68
	bx lr
	thumb_func_end sub_02034520

	thumb_func_start sub_02034524
sub_02034524: ; 0x02034524
	ldr r0, _02034538 ; =0x021D4130
	ldr r2, [r0]
	cmp r2, #0
	beq _02034534
	mov r0, #0xe9
	mov r1, #1
	lsl r0, r0, #2
	strb r1, [r2, r0]
_02034534:
	bx lr
	nop
_02034538: .word 0x021D4130
	thumb_func_end sub_02034524

	thumb_func_start sub_0203453C
sub_0203453C: ; 0x0203453C
	push {r3, r4, r5, lr}
	ldr r1, _020345C8 ; =0x021D4130
	add r4, r2, #0
	ldr r1, [r1]
	cmp r1, #0
	beq _020345C4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _020345C4
	ldr r1, _020345C8 ; =0x021D4130
	mov r2, #0x68
	ldr r5, [r1]
	add r1, r4, #0
	add r1, #0x62
	ldrb r1, [r1]
	add r5, #0xc
	add r0, r4, #0
	add r3, r1, #0
	mul r3, r2
	add r1, r5, r3
	bl MIi_CpuCopy8
	add r4, #0x62
	ldr r1, _020345C8 ; =0x021D4130
	ldrb r3, [r4]
	ldr r2, [r1]
	ldr r0, _020345CC ; =0x000003A6
	strb r3, [r2, r0]
	ldr r2, [r1]
	ldrb r1, [r2, r0]
	sub r0, #0x5a
	lsl r1, r1, #2
	add r1, r2, r1
	ldr r0, [r1, r0]
	bl sub_02028F0C
	cmp r0, #1
	beq _020345C4
	ldr r2, _020345C8 ; =0x021D4130
	mov r0, #0xe7
	lsl r0, r0, #2
	ldr r3, [r2]
	add r1, r0, #0
	add r1, #0xa
	add r4, r3, r0
	ldrb r3, [r3, r1]
	ldrb r1, [r4, r3]
	cmp r1, #2
	bhs _020345C4
	mov r1, #1
	strb r1, [r4, r3]
	ldr r1, [r2]
	add r0, #0xa
	ldrb r4, [r1, r0]
	bl sub_0203769C
	cmp r4, r0
	bne _020345C4
	ldr r0, _020345C8 ; =0x021D4130
	mov r2, #3
	ldr r0, [r0]
	add r1, r0, r4
	mov r0, #0xe7
	lsl r0, r0, #2
	strb r2, [r1, r0]
_020345C4:
	pop {r3, r4, r5, pc}
	nop
_020345C8: .word 0x021D4130
_020345CC: .word 0x000003A6
	thumb_func_end sub_0203453C

	thumb_func_start sub_020345D0
sub_020345D0: ; 0x020345D0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02034630 ; =0x021D4130
	ldr r1, [r0]
	cmp r1, #0
	beq _0203462C
	mov r3, #0x68
	add r4, r5, #0
	add r0, r2, #0
	mul r4, r3
	add r1, #0xc
	add r1, r1, r4
	add r2, r3, #0
	bl MIi_CpuCopy8
	ldr r0, _02034630 ; =0x021D4130
	add r1, r5, #0
	ldr r0, [r0]
	add r0, #0x68
	add r0, r0, r4
	bl sub_020357C4
	ldr r0, _02034630 ; =0x021D4130
	mov r2, #1
	ldr r0, [r0]
	add r1, r0, r5
	mov r0, #0xe7
	lsl r0, r0, #2
	strb r2, [r1, r0]
	bl sub_0203769C
	cmp r5, r0
	bne _02034622
	ldr r0, _02034630 ; =0x021D4130
	mov r2, #3
	ldr r0, [r0]
	add r1, r0, r5
	mov r0, #0xe7
	lsl r0, r0, #2
	strb r2, [r1, r0]
	pop {r3, r4, r5, pc}
_02034622:
	ldr r0, _02034630 ; =0x021D4130
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _02034634 ; =0x000003A5
	strb r2, [r1, r0]
_0203462C:
	pop {r3, r4, r5, pc}
	nop
_02034630: .word 0x021D4130
_02034634: .word 0x000003A5
	thumb_func_end sub_020345D0

	thumb_func_start sub_02034638
sub_02034638: ; 0x02034638
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _020346CC ; =0x021D4130
	ldr r1, [r0]
	ldr r0, _020346D0 ; =0x000003A5
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0203464A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0203464A:
	bl sub_0203769C
	cmp r0, #0
	beq _02034656
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02034656:
	mov r0, #5
	bl sub_02037824
	cmp r0, #0
	bne _020346C8
	mov r4, #0
	add r5, r4, #0
	add r7, r4, #0
_02034666:
	ldr r0, _020346CC ; =0x021D4130
	ldr r2, [r0]
	mov r0, #0xe7
	add r1, r2, r4
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _020346A6
	add r0, r2, r5
	add r0, #0x6e
	strb r4, [r0]
	ldr r0, _020346CC ; =0x021D4130
	ldr r6, [r0]
	bl sub_02028ECC
	add r2, r0, #0
	mov r0, #0xd3
	add r1, r6, r7
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r6, #0x2c
	add r1, r6, r5
	bl MIi_CpuCopy8
	ldr r1, _020346CC ; =0x021D4130
	mov r0, #4
	ldr r1, [r1]
	mov r2, #0x68
	add r1, #0xc
	add r1, r1, r5
	bl sub_0203753C
_020346A6:
	add r4, r4, #1
	add r5, #0x68
	add r7, r7, #4
	cmp r4, #8
	blt _02034666
	mov r1, #0
	mov r0, #5
	add r2, r1, #0
	bl sub_0203753C
	ldr r0, _020346CC ; =0x021D4130
	mov r2, #0
	ldr r1, [r0]
	ldr r0, _020346D0 ; =0x000003A5
	strb r2, [r1, r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020346C8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020346CC: .word 0x021D4130
_020346D0: .word 0x000003A5
	thumb_func_end sub_02034638

	thumb_func_start sub_020346D4
sub_020346D4: ; 0x020346D4
	ldr r0, _020346E0 ; =0x021D4130
	ldr r1, [r0]
	ldr r0, _020346E4 ; =0x000003A5
	ldrb r0, [r1, r0]
	bx lr
	nop
_020346E0: .word 0x021D4130
_020346E4: .word 0x000003A5
	thumb_func_end sub_020346D4

	thumb_func_start sub_020346E8
sub_020346E8: ; 0x020346E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02034710 ; =0x021D4130
	ldr r1, [r0]
	lsl r0, r4, #2
	add r1, r1, r0
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_02028EF0
	ldr r0, _02034710 ; =0x021D4130
	mov r2, #0
	ldr r0, [r0]
	add r1, r0, r4
	mov r0, #0xe7
	lsl r0, r0, #2
	strb r2, [r1, r0]
	pop {r4, pc}
	nop
_02034710: .word 0x021D4130
	thumb_func_end sub_020346E8

	thumb_func_start sub_02034714
sub_02034714: ; 0x02034714
	ldr r1, _0203472C ; =0x021D4130
	ldr r1, [r1]
	add r1, r1, r0
	mov r0, #0xe7
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _02034728
	mov r0, #1
	bx lr
_02034728:
	mov r0, #0
	bx lr
	.balign 4, 0
_0203472C: .word 0x021D4130
	thumb_func_end sub_02034714

	thumb_func_start sub_02034730
sub_02034730: ; 0x02034730
	ldr r1, _0203474C ; =0x021D4130
	mov r2, #1
	ldr r1, [r1]
	add r1, r1, r0
	mov r0, #0xe7
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	cmp r0, #2
	beq _02034748
	cmp r0, #1
	beq _02034748
	mov r2, #0
_02034748:
	add r0, r2, #0
	bx lr
	.balign 4, 0
_0203474C: .word 0x021D4130
	thumb_func_end sub_02034730

	thumb_func_start sub_02034750
sub_02034750: ; 0x02034750
	ldr r1, _02034768 ; =0x021D4130
	ldr r1, [r1]
	add r1, r1, r0
	mov r0, #0xe7
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _02034764
	mov r0, #1
	bx lr
_02034764:
	mov r0, #0
	bx lr
	.balign 4, 0
_02034768: .word 0x021D4130
	thumb_func_end sub_02034750

	thumb_func_start sub_0203476C
sub_0203476C: ; 0x0203476C
	ldr r1, _0203477C ; =0x021D4130
	mov r2, #2
	ldr r1, [r1]
	add r1, r1, r0
	mov r0, #0xe7
	lsl r0, r0, #2
	strb r2, [r1, r0]
	bx lr
	.balign 4, 0
_0203477C: .word 0x021D4130
	thumb_func_end sub_0203476C

	thumb_func_start sub_02034780
sub_02034780: ; 0x02034780
	ldr r1, _0203479C ; =0x021D4130
	mov r0, #0
	ldr r3, [r1]
	mov r1, #0xe7
	lsl r1, r1, #2
_0203478A:
	ldrb r2, [r3, r1]
	cmp r2, #1
	beq _0203479A
	add r0, r0, #1
	add r3, r3, #1
	cmp r0, #8
	blt _0203478A
	mov r0, #0xff
_0203479A:
	bx lr
	.balign 4, 0
_0203479C: .word 0x021D4130
	thumb_func_end sub_02034780

	thumb_func_start sub_020347A0
sub_020347A0: ; 0x020347A0
	push {r3, r4}
	ldr r1, _020347C8 ; =0x021D4130
	mov r0, #0
	ldr r4, [r1]
	mov r1, #0xe7
	add r3, r0, #0
	lsl r1, r1, #2
_020347AE:
	ldrb r2, [r4, r1]
	cmp r2, #2
	beq _020347B8
	cmp r2, #3
	bne _020347BA
_020347B8:
	add r0, r0, #1
_020347BA:
	add r3, r3, #1
	add r4, r4, #1
	cmp r3, #8
	blt _020347AE
	pop {r3, r4}
	bx lr
	nop
_020347C8: .word 0x021D4130
	thumb_func_end sub_020347A0

	thumb_func_start sub_020347CC
sub_020347CC: ; 0x020347CC
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02034814 ; =0x021D4130
	mov r5, #0
	ldr r0, [r0]
	cmp r0, #0
	beq _02034810
	bl sub_02037454
	cmp r0, #0
	bne _020347E4
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_020347E4:
	mov r7, #0xe7
	ldr r6, _02034814 ; =0x021D4130
	add r4, r5, #0
	lsl r7, r7, #2
_020347EC:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	bne _0203480A
	ldr r0, [r6]
	add r0, r0, r4
	ldrb r0, [r0, r7]
	cmp r0, #0
	beq _0203480A
	add r0, r4, #0
	bl sub_020346E8
	mov r5, #1
_0203480A:
	add r4, r4, #1
	cmp r4, #8
	blt _020347EC
_02034810:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02034814: .word 0x021D4130
	thumb_func_end sub_020347CC

	thumb_func_start sub_02034818
sub_02034818: ; 0x02034818
	ldr r1, _02034848 ; =0x021D4130
	ldr r3, [r1]
	cmp r3, #0
	bne _02034824
	mov r0, #0
	bx lr
_02034824:
	mov r1, #0xe7
	add r2, r3, r0
	lsl r1, r1, #2
	ldrb r1, [r2, r1]
	cmp r1, #1
	beq _02034838
	cmp r1, #2
	beq _02034838
	cmp r1, #3
	bne _02034844
_02034838:
	lsl r0, r0, #2
	add r1, r3, r0
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bx lr
_02034844:
	mov r0, #0
	bx lr
	.balign 4, 0
_02034848: .word 0x021D4130
	thumb_func_end sub_02034818

	thumb_func_start sub_0203484C
sub_0203484C: ; 0x0203484C
	ldr r1, _0203486C ; =0x021D4130
	ldr r3, [r1]
	mov r1, #0xe7
	add r2, r3, r0
	lsl r1, r1, #2
	ldrb r1, [r2, r1]
	cmp r1, #0
	beq _02034866
	mov r1, #0x68
	add r3, #0x4c
	mul r1, r0
	add r0, r3, r1
	bx lr
_02034866:
	mov r0, #0
	bx lr
	nop
_0203486C: .word 0x021D4130
	thumb_func_end sub_0203484C

	thumb_func_start sub_02034870
sub_02034870: ; 0x02034870
	add r1, r0, #0
	ldr r0, _0203487C ; =0x021D4130
	ldr r3, _02034880 ; =sub_0203A378
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bx r3
	.balign 4, 0
_0203487C: .word 0x021D4130
_02034880: .word sub_0203A378
	thumb_func_end sub_02034870

	thumb_func_start sub_02034884
sub_02034884: ; 0x02034884
	ldr r1, _020348A4 ; =0x021D4130
	ldr r3, [r1]
	mov r1, #0xe7
	add r2, r3, r0
	lsl r1, r1, #2
	ldrb r1, [r2, r1]
	cmp r1, #0
	beq _0203489E
	mov r1, #0x68
	add r3, #0x58
	mul r1, r0
	add r0, r3, r1
	bx lr
_0203489E:
	mov r0, #0
	bx lr
	nop
_020348A4: .word 0x021D4130
	thumb_func_end sub_02034884

	thumb_func_start sub_020348A8
sub_020348A8: ; 0x020348A8
	ldr r1, _020348C8 ; =0x021D4130
	ldr r3, [r1]
	mov r1, #0xe7
	add r2, r3, r0
	lsl r1, r1, #2
	ldrb r1, [r2, r1]
	cmp r1, #0
	beq _020348C4
	mov r1, #0x68
	mul r1, r0
	add r0, r3, r1
	add r0, #0x6f
	ldrb r0, [r0]
	bx lr
_020348C4:
	mov r0, #0
	bx lr
	.balign 4, 0
_020348C8: .word 0x021D4130
	thumb_func_end sub_020348A8

	thumb_func_start sub_020348CC
sub_020348CC: ; 0x020348CC
	ldr r1, _020348EC ; =0x021D4130
	ldr r3, [r1]
	mov r1, #0xe7
	add r2, r3, r0
	lsl r1, r1, #2
	ldrb r1, [r2, r1]
	cmp r1, #0
	beq _020348E8
	mov r1, #0x68
	mul r1, r0
	add r0, r3, r1
	add r0, #0x70
	ldrb r0, [r0]
	bx lr
_020348E8:
	mov r0, #0
	bx lr
	.balign 4, 0
_020348EC: .word 0x021D4130
	thumb_func_end sub_020348CC

	thumb_func_start sub_020348F0
sub_020348F0: ; 0x020348F0
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r4, #0
	add r6, r4, #0
_020348F8:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _0203494C
	ldr r0, _02034958 ; =0x021D4130
	ldr r0, [r0]
	add r1, r0, r4
	mov r0, #0xe7
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _0203494C
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _0203494C
	ldr r0, _02034958 ; =0x021D4130
	ldr r1, _0203495C ; =0x0000039D
	ldr r0, [r0]
	add r2, r0, r4
	ldrb r1, [r2, r1]
	cmp r1, #0
	beq _0203494C
	add r1, r6, #0
	add r2, r0, r5
_02034934:
	add r3, r2, #0
	add r3, #0x74
	ldrb r0, [r2, #0xc]
	ldrb r3, [r3]
	cmp r0, r3
	beq _02034944
	mov r0, #0
	pop {r4, r5, r6, pc}
_02034944:
	add r1, r1, #1
	add r2, r2, #1
	cmp r1, #0x20
	blt _02034934
_0203494C:
	add r4, r4, #1
	add r5, #0x68
	cmp r4, #7
	blt _020348F8
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02034958: .word 0x021D4130
_0203495C: .word 0x0000039D
	thumb_func_end sub_020348F0

	thumb_func_start sub_02034960
sub_02034960: ; 0x02034960
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _02034A18 ; =0x021D4130
	add r6, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	beq _02034A14
	cmp r7, #2
	beq _02034980
	bl sub_0203769C
	bl sub_020378AC
	mov r1, #1
	and r0, r1
	str r0, [sp]
_02034980:
	mov r4, #0
	bl sub_02037454
	cmp r0, #0
	ble _02034A14
	add r5, r4, #0
_0203498C:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _02034A08
	ldr r0, _02034A18 ; =0x021D4130
	mov r1, #0xe7
	ldr r0, [r0]
	lsl r1, r1, #2
	add r2, r0, r4
	ldrb r1, [r2, r1]
	cmp r1, #0
	beq _02034A08
	cmp r7, #0
	bne _020349D2
	add r0, r4, #0
	bl sub_020378AC
	mov r1, #1
	and r1, r0
	ldr r0, [sp]
	cmp r0, r1
	beq _02034A08
	ldr r0, _02034A18 ; =0x021D4130
	mov r1, #0xdb
	ldr r0, [r0]
	lsl r1, r1, #2
	add r0, r0, r5
	ldrh r1, [r0, r1]
	add r2, r1, r6
	mov r1, #0xdb
	lsl r1, r1, #2
	strh r2, [r0, r1]
	b _02034A08
_020349D2:
	cmp r7, #1
	bne _020349F8
	add r0, r4, #0
	bl sub_020378AC
	mov r1, #1
	and r1, r0
	ldr r0, [sp]
	cmp r0, r1
	beq _02034A08
	ldr r0, _02034A18 ; =0x021D4130
	ldr r1, _02034A1C ; =0x0000036E
	ldr r0, [r0]
	add r0, r0, r5
	ldrh r1, [r0, r1]
	add r2, r1, r6
	ldr r1, _02034A1C ; =0x0000036E
	strh r2, [r0, r1]
	b _02034A08
_020349F8:
	mov r1, #0x37
	add r0, r0, r5
	lsl r1, r1, #4
	ldrh r1, [r0, r1]
	add r2, r1, r6
	mov r1, #0x37
	lsl r1, r1, #4
	strh r2, [r0, r1]
_02034A08:
	add r5, r5, #6
	add r4, r4, #1
	bl sub_02037454
	cmp r4, r0
	blt _0203498C
_02034A14:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02034A18: .word 0x021D4130
_02034A1C: .word 0x0000036E
	thumb_func_end sub_02034960

	thumb_func_start sub_02034A20
sub_02034A20: ; 0x02034A20
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	bl sub_0202C6F4
	str r0, [sp, #4]
	mov r4, #0
	bl sub_02037454
	cmp r0, #0
	ble _02034A88
	add r5, r4, #0
_02034A38:
	add r0, r4, #0
	bl sub_0203484C
	add r1, r0, #0
	beq _02034A7C
	add r0, r7, #0
	add r2, sp, #8
	bl sub_0203A084
	cmp r0, #0
	beq _02034A52
	cmp r0, #1
	bne _02034A7C
_02034A52:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _02034A5C
	bl GF_AssertFail
_02034A5C:
	ldr r0, _02034AB8 ; =0x021D4130
	mov r2, #0xdb
	ldr r0, [r0]
	ldr r3, _02034ABC ; =0x0000036E
	add r6, r0, r5
	mov r0, #0x37
	lsl r0, r0, #4
	ldrh r0, [r6, r0]
	lsl r2, r2, #2
	str r0, [sp]
	ldrh r2, [r6, r2]
	ldrh r3, [r6, r3]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl sub_0202C4F0
_02034A7C:
	add r5, r5, #6
	add r4, r4, #1
	bl sub_02037454
	cmp r4, r0
	blt _02034A38
_02034A88:
	mov r3, #0xdb
	mov r2, #0
	lsl r3, r3, #2
	ldr r6, _02034AB8 ; =0x021D4130
	add r1, r2, #0
	add r0, r2, #0
	add r4, r3, #2
	add r5, r3, #4
_02034A98:
	ldr r7, [r6]
	add r2, r2, #1
	add r7, r7, r1
	strh r0, [r7, r3]
	ldr r7, [r6]
	add r7, r7, r1
	strh r0, [r7, r4]
	ldr r7, [r6]
	add r7, r7, r1
	add r1, r1, #6
	strh r0, [r7, r5]
	cmp r2, #8
	blt _02034A98
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02034AB8: .word 0x021D4130
_02034ABC: .word 0x0000036E
	thumb_func_end sub_02034A20

	thumb_func_start sub_02034AC0
sub_02034AC0: ; 0x02034AC0
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #1
	bne _02034AD2
	mov r0, #0
	mov r1, #1
	bl sub_02034960
	b _02034AE2
_02034AD2:
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _02034AE2
	mov r0, #1
	add r1, r0, #0
	bl sub_02034960
_02034AE2:
	add r0, r4, #0
	bl sub_02034A20
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02034AC0

	thumb_func_start sub_02034AEC
sub_02034AEC: ; 0x02034AEC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #2
	bl sub_02034960
	add r0, r4, #0
	bl sub_02034A20
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02034AEC

	thumb_func_start sub_02034B00
sub_02034B00: ; 0x02034B00
	ldr r1, _02034B08 ; =0x021D4130
	ldr r1, [r1]
	str r0, [r1]
	bx lr
	.balign 4, 0
_02034B08: .word 0x021D4130
	thumb_func_end sub_02034B00

	thumb_func_start sub_02034B0C
sub_02034B0C: ; 0x02034B0C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, _02034BCC ; =0x021D4134
	add r7, r1, #0
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _02034BCA
	ldr r1, _02034BD0 ; =0x00000D98
	mov r0, #0xf
	bl AllocFromHeap
	ldr r1, _02034BCC ; =0x021D4134
	ldr r2, _02034BD0 ; =0x00000D98
	str r0, [r1, #8]
	mov r1, #0
	bl MIi_CpuFill8
	bl sub_020335B4
	add r1, r0, #0
	mov r0, #0xf
	bl AllocFromHeap
	ldr r1, _02034BCC ; =0x021D4134
	ldr r2, [r1, #8]
	ldr r1, _02034BD4 ; =0x00000D64
	str r0, [r2, r1]
	bl sub_020335B4
	add r2, r0, #0
	ldr r0, _02034BCC ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _02034BD4 ; =0x00000D64
	ldr r0, [r1, r0]
	mov r1, #0
	bl MIi_CpuFill8
	bl sub_020290B4
	add r1, r0, #0
	mov r0, #0xf
	bl AllocFromHeap
	ldr r1, _02034BCC ; =0x021D4134
	ldr r2, [r1, #8]
	ldr r1, _02034BD8 ; =0x00000D7C
	str r0, [r2, r1]
	bl sub_020290B4
	add r2, r0, #0
	ldr r0, _02034BCC ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _02034BD8 ; =0x00000D7C
	ldr r0, [r1, r0]
	mov r1, #0
	bl MIi_CpuFill8
	mov r0, #0xf
	mov r1, #0x90
	bl AllocFromHeap
	ldr r2, _02034BCC ; =0x021D4134
	ldr r1, _02034BDC ; =0x00000D84
	ldr r3, [r2, #8]
	str r0, [r3, r1]
	ldr r6, [r2, #8]
	mov r0, #0x1f
	ldr r5, [r6, r1]
	add r3, r5, #0
	and r3, r0
	mov r0, #0x20
	sub r0, r0, r3
	add r3, r0, r5
	add r0, r1, #4
	str r3, [r6, r0]
	ldr r5, _02034BE0 ; =0x00000333
	ldr r3, [r2, #8]
	sub r0, r1, #4
	str r5, [r3, r0]
	add r0, r1, #0
	ldr r3, [r2, #8]
	sub r0, #0xc
	str r4, [r3, r0]
	ldr r0, [r2, #8]
	sub r1, #0x1c
	add r0, r0, r1
	bl MailMsg_init
	add r0, r7, #0
	bl sub_02034DF0
	bl sub_020DF250
	ldr r1, _02034BCC ; =0x021D4134
	strh r0, [r1]
_02034BCA:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02034BCC: .word 0x021D4134
_02034BD0: .word 0x00000D98
_02034BD4: .word 0x00000D64
_02034BD8: .word 0x00000D7C
_02034BDC: .word 0x00000D84
_02034BE0: .word 0x00000333
	thumb_func_end sub_02034B0C

	thumb_func_start sub_02034BE4
sub_02034BE4: ; 0x02034BE4
	ldr r0, _02034BF4 ; =0x021D4134
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02034BF0
	mov r0, #1
	bx lr
_02034BF0:
	mov r0, #0
	bx lr
	.balign 4, 0
_02034BF4: .word 0x021D4134
	thumb_func_end sub_02034BE4

	thumb_func_start sub_02034BF8
sub_02034BF8: ; 0x02034BF8
	push {r4, r5}
	mov r5, #0
	cmp r2, #0
	ble _02034C18
_02034C00:
	ldrb r4, [r0]
	ldrb r3, [r1]
	cmp r4, r3
	beq _02034C0E
	mov r0, #0
	pop {r4, r5}
	bx lr
_02034C0E:
	add r5, r5, #1
	add r0, r0, #1
	add r1, r1, #1
	cmp r5, r2
	blt _02034C00
_02034C18:
	mov r0, #1
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02034BF8

	thumb_func_start sub_02034C20
sub_02034C20: ; 0x02034C20
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_0203993C
	add r5, r0, #0
	bl sub_02039954
	add r4, r6, #0
	add r7, r0, #0
	add r4, #0x50
	cmp r5, #0xe
	beq _02034C62
	ldrb r0, [r4, #4]
	bl sub_0203401C
	cmp r0, #0
	beq _02034C4C
	add r0, r5, #0
	bl sub_0203401C
	cmp r0, #0
	bne _02034C62
_02034C4C:
	add r0, r4, #0
	add r0, #0x54
	ldrb r0, [r0]
	cmp r0, #0
	beq _02034C5C
	ldrb r0, [r4, #4]
	cmp r0, #0xa
	beq _02034C88
_02034C5C:
	ldrb r0, [r4, #4]
	cmp r0, r5
	bne _02034C88
_02034C62:
	cmp r5, #0xe
	beq _02034C6C
	ldrb r0, [r4, #5]
	cmp r0, r7
	bne _02034C88
_02034C6C:
	ldr r1, _02034C8C ; =0x021D4134
	add r0, r6, #0
	ldr r1, [r1, #8]
	mov r2, #0xc0
	add r1, #0x54
	bl MIi_CpuCopy8
	ldr r0, _02034C8C ; =0x021D4134
	ldr r1, _02034C90 ; =0x00000D95
	ldr r3, [r0, #8]
	mov r0, #0x40
	ldrb r2, [r3, r1]
	orr r0, r2
	strb r0, [r3, r1]
_02034C88:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02034C8C: .word 0x021D4134
_02034C90: .word 0x00000D95
	thumb_func_end sub_02034C20

	thumb_func_start sub_02034C94
sub_02034C94: ; 0x02034C94
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02034D50 ; =0x021D4134
	ldr r1, _02034D54 ; =0x00000D95
	ldr r3, [r0, #8]
	ldrb r2, [r3, r1]
	add r7, r3, #0
	add r7, #0x54
	lsl r0, r2, #0x19
	lsr r0, r0, #0x1f
	beq _02034D4E
	mov r0, #0x40
	mov r6, #0
	bic r2, r0
	strb r2, [r3, r1]
	add r4, r6, #0
	add r5, r6, #0
_02034CB4:
	ldr r0, _02034D50 ; =0x021D4134
	ldr r1, _02034D58 ; =0x00000D44
	ldr r0, [r0, #8]
	add r2, r0, r4
	ldrh r1, [r2, r1]
	cmp r1, #0
	beq _02034CFC
	mov r1, #0x46
	lsl r1, r1, #2
	add r0, r0, r1
	add r0, r0, r5
	add r1, r7, #4
	mov r2, #6
	bl sub_02034BF8
	cmp r0, #0
	beq _02034CFC
	ldr r2, _02034D50 ; =0x021D4134
	mov r1, #0x4b
	ldr r3, [r2, #8]
	lsl r0, r6, #1
	add r3, r3, r0
	ldr r0, _02034D58 ; =0x00000D44
	lsl r1, r1, #2
	strh r1, [r3, r0]
	ldr r2, [r2, #8]
	sub r1, #0x18
	add r3, r2, r1
	mov r2, #0xc0
	add r1, r6, #0
	mul r1, r2
	add r0, r7, #0
	add r1, r3, r1
	bl MIi_CpuCopy8
	pop {r3, r4, r5, r6, r7, pc}
_02034CFC:
	add r6, r6, #1
	add r4, r4, #2
	add r5, #0xc0
	cmp r6, #0x10
	blt _02034CB4
	ldr r0, _02034D50 ; =0x021D4134
	ldr r1, _02034D58 ; =0x00000D44
	ldr r0, [r0, #8]
	mov r3, #0
	add r4, r0, #0
_02034D10:
	ldrh r2, [r4, r1]
	cmp r2, #0
	beq _02034D1E
	add r3, r3, #1
	add r4, r4, #2
	cmp r3, #0x10
	blt _02034D10
_02034D1E:
	cmp r3, #0x10
	bge _02034D4E
	lsl r2, r3, #1
	mov r1, #0x4b
	add r2, r0, r2
	ldr r0, _02034D58 ; =0x00000D44
	lsl r1, r1, #2
	strh r1, [r2, r0]
	ldr r2, _02034D50 ; =0x021D4134
	sub r1, #0x18
	ldr r2, [r2, #8]
	add r0, r7, #0
	add r4, r2, r1
	mov r2, #0xc0
	add r1, r3, #0
	mul r1, r2
	add r1, r4, r1
	bl MIi_CpuCopy8
	ldr r0, _02034D50 ; =0x021D4134
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02034D5C ; =0x00000D74
	strb r2, [r1, r0]
_02034D4E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02034D50: .word 0x021D4134
_02034D54: .word 0x00000D95
_02034D58: .word 0x00000D44
_02034D5C: .word 0x00000D74
	thumb_func_end sub_02034C94

	thumb_func_start sub_02034D60
sub_02034D60: ; 0x02034D60
	push {r3, lr}
	cmp r1, #0
	beq _02034D6A
	bl sub_020D3F48
_02034D6A:
	ldr r0, _02034D74 ; =0x021D4134
	mov r1, #2
	str r1, [r0, #4]
	pop {r3, pc}
	nop
_02034D74: .word 0x021D4134
	thumb_func_end sub_02034D60

	thumb_func_start sub_02034D78
sub_02034D78: ; 0x02034D78
	ldr r0, _02034D84 ; =0x021D4134
	mov r1, #0
	str r1, [r0, #4]
	ldr r3, _02034D88 ; =sub_0201A4CC
	mov r0, #4
	bx r3
	.balign 4, 0
_02034D84: .word 0x021D4134
_02034D88: .word sub_0201A4CC
	thumb_func_end sub_02034D78

	thumb_func_start sub_02034D8C
sub_02034D8C: ; 0x02034D8C
	push {r3, lr}
	mov r0, #4
	bl sub_0201A4BC
	ldr r0, _02034DB0 ; =0x021D4134
	mov r1, #1
	str r1, [r0, #4]
	ldr r1, _02034DB4 ; =sub_02034D60
	mov r0, #8
	mov r2, #0
	bl sub_0209E00C
	cmp r0, #1
	beq _02034DAC
	bl sub_020D3F48
_02034DAC:
	pop {r3, pc}
	nop
_02034DB0: .word 0x021D4134
_02034DB4: .word sub_02034D60
	thumb_func_end sub_02034D8C

	thumb_func_start sub_02034DB8
sub_02034DB8: ; 0x02034DB8
	ldr r0, _02034DC8 ; =0x021D4134
	ldr r0, [r0, #4]
	cmp r0, #2
	bne _02034DC4
	mov r0, #1
	bx lr
_02034DC4:
	mov r0, #0
	bx lr
	.balign 4, 0
_02034DC8: .word 0x021D4134
	thumb_func_end sub_02034DB8

	thumb_func_start sub_02034DCC
sub_02034DCC: ; 0x02034DCC
	ldr r0, _02034DDC ; =0x021D4134
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02034DD8
	mov r0, #1
	bx lr
_02034DD8:
	mov r0, #0
	bx lr
	.balign 4, 0
_02034DDC: .word 0x021D4134
	thumb_func_end sub_02034DCC

	thumb_func_start sub_02034DE0
sub_02034DE0: ; 0x02034DE0
	ldr r3, _02034DE8 ; =sub_0209E248
	ldr r0, _02034DEC ; =sub_02034D78
	mov r1, #0
	bx r3
	.balign 4, 0
_02034DE8: .word sub_0209E248
_02034DEC: .word sub_02034D78
	thumb_func_end sub_02034DE0

	thumb_func_start sub_02034DF0
sub_02034DF0: ; 0x02034DF0
	push {r4, lr}
	ldr r2, _02034E28 ; =0x021D4134
	add r1, r0, #0
	mov r0, #0xd7
	ldr r3, [r2, #8]
	mov r4, #0
	lsl r0, r0, #4
	str r4, [r3, r0]
	ldr r2, [r2, #8]
	sub r0, #0xc
	ldr r3, [r2, r0]
	mov r0, #0x1f
	add r2, r3, #0
	and r2, r0
	mov r0, #0x20
	sub r0, r0, r2
	add r0, r3, r0
	bl sub_02033528
	ldr r0, _02034E28 ; =0x021D4134
	ldr r1, [r0, #8]
	mov r0, #0x36
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	bl sub_02033234
	pop {r4, pc}
	nop
_02034E28: .word 0x021D4134
	thumb_func_end sub_02034DF0

	thumb_func_start sub_02034E2C
sub_02034E2C: ; 0x02034E2C
	push {r3, r4, r5, lr}
	mov r4, #0
	ldr r2, _02034E5C ; =0x021D4134
	ldr r0, _02034E60 ; =0x00000D44
	add r5, r4, #0
	add r1, r4, #0
_02034E38:
	ldr r3, [r2, #8]
	add r4, r4, #1
	add r3, r3, r5
	add r5, r5, #2
	strh r1, [r3, r0]
	cmp r4, #0x10
	blt _02034E38
	ldr r0, _02034E5C ; =0x021D4134
	ldr r2, [r0, #8]
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r2, r0
	mov r2, #3
	lsl r2, r2, #0xa
	bl MIi_CpuFill8
	pop {r3, r4, r5, pc}
	nop
_02034E5C: .word 0x021D4134
_02034E60: .word 0x00000D44
	thumb_func_end sub_02034E2C

	thumb_func_start sub_02034E64
sub_02034E64: ; 0x02034E64
	push {r3, r4}
	ldr r1, _02034E84 ; =0x021D4134
	lsl r0, r0, #0x18
	ldr r2, [r1, #8]
	ldr r4, _02034E88 ; =0x00000D95
	lsr r0, r0, #0x18
	ldrb r1, [r2, r4]
	mov r3, #8
	lsl r0, r0, #0x1f
	bic r1, r3
	lsr r0, r0, #0x1c
	orr r0, r1
	strb r0, [r2, r4]
	pop {r3, r4}
	bx lr
	nop
_02034E84: .word 0x021D4134
_02034E88: .word 0x00000D95
	thumb_func_end sub_02034E64

	thumb_func_start sub_02034E8C
sub_02034E8C: ; 0x02034E8C
	push {r4, r5}
	ldr r1, _02034EE8 ; =0x021D4134
	ldr r0, _02034EEC ; =0x00000D74
	ldr r3, [r1, #8]
	mov r2, #0
	strb r2, [r3, r0]
	add r3, r0, #0
	ldr r5, [r1, #8]
	add r3, #0x21
	ldrb r4, [r5, r3]
	mov r3, #1
	bic r4, r3
	add r3, r0, #0
	add r3, #0x21
	strb r4, [r5, r3]
	add r3, r0, #0
	ldr r5, [r1, #8]
	add r3, #0x21
	ldrb r4, [r5, r3]
	mov r3, #4
	bic r4, r3
	add r3, r0, #0
	add r3, #0x21
	strb r4, [r5, r3]
	add r3, r0, #0
	ldr r4, [r1, #8]
	add r3, #0x1e
	strb r2, [r4, r3]
	add r3, r0, #0
	ldr r5, [r1, #8]
	add r3, #0x21
	ldrb r4, [r5, r3]
	mov r3, #0x10
	bic r4, r3
	add r3, r0, #0
	add r3, #0x21
	strb r4, [r5, r3]
	add r3, r0, #0
	ldr r4, [r1, #8]
	add r3, #0x20
	strb r2, [r4, r3]
	ldr r1, [r1, #8]
	add r0, #0x1f
	strb r2, [r1, r0]
	pop {r4, r5}
	bx lr
	.balign 4, 0
_02034EE8: .word 0x021D4134
_02034EEC: .word 0x00000D74
	thumb_func_end sub_02034E8C

	thumb_func_start sub_02034EF0
sub_02034EF0: ; 0x02034EF0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_02034E8C
	add r0, r5, #0
	bl sub_02034E64
	bl sub_02033A68
	ldr r0, _02034F54 ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _02034F58 ; =0x00000D93
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02034F22
	ldr r0, _02034F5C ; =sub_02036904
	mov r1, #0xe
	bl sub_020337D0
	ldr r0, _02034F54 ; =0x021D4134
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02034F58 ; =0x00000D93
	strb r2, [r1, r0]
_02034F22:
	ldr r0, _02034F54 ; =0x021D4134
	ldr r3, _02034F60 ; =0x00000D95
	ldr r1, [r0, #8]
	mov r2, #0x20
	ldrb r0, [r1, r3]
	bic r0, r2
	lsl r2, r4, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1a
	orr r0, r2
	strb r0, [r1, r3]
	bl sub_02033298
	cmp r0, #1
	bne _02034F4E
	bl sub_020332C0
	cmp r0, #0
	beq _02034F4E
	mov r0, #1
	pop {r3, r4, r5, pc}
_02034F4E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02034F54: .word 0x021D4134
_02034F58: .word 0x00000D93
_02034F5C: .word sub_02036904
_02034F60: .word 0x00000D95
	thumb_func_end sub_02034EF0

	thumb_func_start sub_02034F64
sub_02034F64: ; 0x02034F64
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	bl sub_02034E8C
	cmp r4, #0
	beq _02034F76
	bl sub_02034E2C
_02034F76:
	ldr r0, _02034FD4 ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _02034FD8 ; =0x00000D93
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02034F94
	ldr r0, _02034FDC ; =sub_020367A8
	mov r1, #0xe
	bl sub_020337D0
	ldr r0, _02034FD4 ; =0x021D4134
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02034FD8 ; =0x00000D93
	strb r2, [r1, r0]
_02034F94:
	bl sub_02033298
	cmp r0, #1
	bne _02034FCC
	ldr r2, _02034FE0 ; =0x020F6A88
	add r0, sp, #0
	ldrb r3, [r2]
	add r1, sp, #0
	strb r3, [r0]
	ldrb r3, [r2, #1]
	strb r3, [r0, #1]
	ldrb r3, [r2, #2]
	strb r3, [r0, #2]
	ldrb r3, [r2, #3]
	strb r3, [r0, #3]
	ldrb r3, [r2, #4]
	ldrb r2, [r2, #5]
	strb r3, [r0, #4]
	strb r2, [r0, #5]
	ldr r0, _02034FE4 ; =sub_02034C20
	mov r2, #0
	bl sub_02032C1C
	cmp r0, #0
	beq _02034FCC
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_02034FCC:
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	nop
_02034FD4: .word 0x021D4134
_02034FD8: .word 0x00000D93
_02034FDC: .word sub_020367A8
_02034FE0: .word 0x020F6A88
_02034FE4: .word sub_02034C20
	thumb_func_end sub_02034F64

	thumb_func_start sub_02034FE8
sub_02034FE8: ; 0x02034FE8
	push {r3, lr}
	ldr r0, _02035074 ; =0x021D4134
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _02034FF6
	mov r0, #1
	pop {r3, pc}
_02034FF6:
	ldr r0, _02035078 ; =0x00000D94
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02035008
	cmp r0, #1
	beq _02035038
	cmp r0, #2
	beq _02035050
	b _0203506E
_02035008:
	bl sub_02033990
	cmp r0, #0
	beq _02035020
	bl sub_02032E24
	ldr r0, _02035074 ; =0x021D4134
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02035078 ; =0x00000D94
	strb r2, [r1, r0]
	b _0203506E
_02035020:
	bl sub_0203393C
	cmp r0, #0
	bne _0203506E
	bl sub_02033858
	ldr r0, _02035074 ; =0x021D4134
	mov r2, #2
	ldr r1, [r0, #8]
	ldr r0, _02035078 ; =0x00000D94
	strb r2, [r1, r0]
	b _0203506E
_02035038:
	bl sub_0203393C
	cmp r0, #0
	bne _0203506E
	bl sub_02033858
	ldr r0, _02035074 ; =0x021D4134
	mov r2, #2
	ldr r1, [r0, #8]
	ldr r0, _02035078 ; =0x00000D94
	strb r2, [r1, r0]
	b _0203506E
_02035050:
	bl sub_02033920
	cmp r0, #0
	beq _0203505C
	mov r0, #1
	pop {r3, pc}
_0203505C:
	bl sub_02033958
	cmp r0, #0
	beq _0203506E
	ldr r0, _02035074 ; =0x021D4134
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02035078 ; =0x00000D94
	strb r2, [r1, r0]
_0203506E:
	mov r0, #0
	pop {r3, pc}
	nop
_02035074: .word 0x021D4134
_02035078: .word 0x00000D94
	thumb_func_end sub_02034FE8

	thumb_func_start sub_0203507C
sub_0203507C: ; 0x0203507C
	push {r3, lr}
	ldr r0, _020350A0 ; =0x021D4134
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _0203509A
	ldr r0, _020350A4 ; =0x00000D92
	ldrb r1, [r2, r0]
	cmp r1, #0
	bne _0203509A
	mov r1, #1
	strb r1, [r2, r0]
	bl sub_02033858
	mov r0, #1
	pop {r3, pc}
_0203509A:
	mov r0, #0
	pop {r3, pc}
	nop
_020350A0: .word 0x021D4134
_020350A4: .word 0x00000D92
	thumb_func_end sub_0203507C

	thumb_func_start sub_020350A8
sub_020350A8: ; 0x020350A8
	push {r3, lr}
	ldr r1, _020350CC ; =0x021D4134
	ldr r2, [r1, #8]
	cmp r2, #0
	beq _020350C8
	cmp r0, #0
	ldr r0, _020350D0 ; =0x00000D92
	beq _020350BE
	mov r1, #2
	strb r1, [r2, r0]
	pop {r3, pc}
_020350BE:
	mov r1, #0
	strb r1, [r2, r0]
	mov r0, #1
	bl sub_02034DF0
_020350C8:
	pop {r3, pc}
	nop
_020350CC: .word 0x021D4134
_020350D0: .word 0x00000D92
	thumb_func_end sub_020350A8

	thumb_func_start sub_020350D4
sub_020350D4: ; 0x020350D4
	push {r3, lr}
	ldr r0, _0203510C ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035110 ; =0x00000D7C
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, _0203510C ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035114 ; =0x00000D64
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, _0203510C ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035118 ; =0x00000D84
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, _0203510C ; =0x021D4134
	ldr r0, [r0, #8]
	bl FreeToHeap
	ldr r0, _0203510C ; =0x021D4134
	mov r1, #0
	str r1, [r0, #8]
	pop {r3, pc}
	nop
_0203510C: .word 0x021D4134
_02035110: .word 0x00000D7C
_02035114: .word 0x00000D64
_02035118: .word 0x00000D84
	thumb_func_end sub_020350D4

	thumb_func_start sub_0203511C
sub_0203511C: ; 0x0203511C
	push {r4, lr}
	bl sub_02037474
	cmp r0, #0
	bne _0203512A
	mov r0, #0
	pop {r4, pc}
_0203512A:
	ldr r1, _02035148 ; =0x021D4134
	mov r0, #0
	ldr r4, [r1, #8]
	ldr r1, _0203514C ; =0x00000D44
	add r3, r0, #0
_02035134:
	ldrh r2, [r4, r1]
	cmp r2, #0
	beq _0203513C
	add r0, r0, #1
_0203513C:
	add r3, r3, #1
	add r4, r4, #2
	cmp r3, #0x10
	blt _02035134
	pop {r4, pc}
	nop
_02035148: .word 0x021D4134
_0203514C: .word 0x00000D44
	thumb_func_end sub_0203511C

	thumb_func_start sub_02035150
sub_02035150: ; 0x02035150
	push {r3, r4, r5, lr}
	ldr r1, _0203517C ; =0x021D4134
	mov r4, #0
	ldr r5, [r1, #8]
	ldr r1, _02035180 ; =0x00000D44
	add r3, r4, #0
_0203515C:
	ldrh r2, [r5, r1]
	cmp r2, #0
	beq _0203516C
	cmp r4, r0
	bne _0203516A
	add r0, r3, #0
	pop {r3, r4, r5, pc}
_0203516A:
	add r4, r4, #1
_0203516C:
	add r3, r3, #1
	add r5, r5, #2
	cmp r3, #0x10
	blt _0203515C
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203517C: .word 0x021D4134
_02035180: .word 0x00000D44
	thumb_func_end sub_02035150

	thumb_func_start sub_02035184
sub_02035184: ; 0x02035184
	ldr r0, _02035190 ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035194 ; =0x00000D74
	ldrb r0, [r1, r0]
	bx lr
	nop
_02035190: .word 0x021D4134
_02035194: .word 0x00000D74
	thumb_func_end sub_02035184

	thumb_func_start sub_02035198
sub_02035198: ; 0x02035198
	ldr r0, _020351A4 ; =0x021D4134
	mov r2, #0
	ldr r1, [r0, #8]
	ldr r0, _020351A8 ; =0x00000D74
	strb r2, [r1, r0]
	bx lr
	.balign 4, 0
_020351A4: .word 0x021D4134
_020351A8: .word 0x00000D74
	thumb_func_end sub_02035198

	thumb_func_start sub_020351AC
sub_020351AC: ; 0x020351AC
	ldr r1, _020351D4 ; =0x021D4134
	ldr r3, [r1, #8]
	lsl r1, r0, #1
	add r2, r3, r1
	ldr r1, _020351D8 ; =0x00000D44
	ldrh r1, [r2, r1]
	cmp r1, #0
	beq _020351D0
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	add r0, r3, r2
	add r1, #0xaa
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _020351D2
	mov r0, #1
	bx lr
_020351D0:
	mov r0, #0
_020351D2:
	bx lr
	.balign 4, 0
_020351D4: .word 0x021D4134
_020351D8: .word 0x00000D44
	thumb_func_end sub_020351AC

	thumb_func_start sub_020351DC
sub_020351DC: ; 0x020351DC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	ldr r1, _02035210 ; =0x021D4134
	mov r5, #0
	ldr r6, [r1, #8]
	ldr r1, _02035214 ; =0x00000D44
	add r3, r5, #0
_020351EA:
	ldrh r2, [r6, r1]
	cmp r2, #0
	beq _02035204
	cmp r0, r5
	bne _02035202
	add r0, r3, #0
	bl sub_02035798
	add r1, r4, #0
	bl sub_02028EE4
	pop {r4, r5, r6, pc}
_02035202:
	add r5, r5, #1
_02035204:
	add r3, r3, #1
	add r6, r6, #2
	cmp r3, #0x10
	blt _020351EA
	pop {r4, r5, r6, pc}
	nop
_02035210: .word 0x021D4134
_02035214: .word 0x00000D44
	thumb_func_end sub_020351DC

	thumb_func_start sub_02035218
sub_02035218: ; 0x02035218
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02033298
	cmp r0, #2
	bne _0203522C
	bl sub_02032E24
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203522C:
	bl sub_02033298
	cmp r0, #1
	bne _02035282
	bl sub_0203993C
	ldr r2, _02035288 ; =0x021D4134
	mov r1, #0xc0
	add r4, r5, #0
	mul r4, r1
	ldr r3, [r2, #8]
	add r1, #0x8a
	add r2, r3, r4
	ldrh r2, [r2, r1]
	mov r1, #0xd9
	lsl r1, r1, #4
	strb r2, [r3, r1]
	bl sub_0203401C
	cmp r0, #0
	beq _0203526C
	ldr r1, _02035288 ; =0x021D4134
	mov r0, #1
	ldr r2, [r1, #8]
	mov r1, #0x46
	lsl r1, r1, #2
	add r1, r2, r1
	add r1, r1, r4
	mov r2, #0
	bl sub_02032B84
	b _0203527E
_0203526C:
	ldr r1, _02035288 ; =0x021D4134
	mov r0, #1
	ldr r2, [r1, #8]
	mov r1, #0x45
	lsl r1, r1, #2
	add r1, r2, r1
	add r1, r1, r4
	bl sub_0203373C
_0203527E:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02035282:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02035288: .word 0x021D4134
	thumb_func_end sub_02035218

	thumb_func_start sub_0203528C
sub_0203528C: ; 0x0203528C
	push {r3, r4, r5, r6, r7, lr}
	bl sub_02034C94
	mov r4, #0
	ldr r1, _020352CC ; =0x021D4134
	ldr r0, _020352D0 ; =0x00000D44
	add r5, r4, #0
	mov r2, #1
_0203529C:
	ldr r3, [r1, #8]
	add r3, r3, r5
	ldrh r6, [r3, r0]
	cmp r6, #0
	beq _020352C0
	beq _020352C0
	ldr r6, _020352D0 ; =0x00000D44
	ldrh r6, [r3, r6]
	sub r7, r6, #1
	ldr r6, _020352D0 ; =0x00000D44
	strh r7, [r3, r6]
	ldr r3, [r1, #8]
	add r7, r3, r5
	ldrh r6, [r7, r6]
	cmp r6, #0
	bne _020352C0
	ldr r6, _020352D4 ; =0x00000D74
	strb r2, [r3, r6]
_020352C0:
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #0x10
	blt _0203529C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020352CC: .word 0x021D4134
_020352D0: .word 0x00000D44
_020352D4: .word 0x00000D74
	thumb_func_end sub_0203528C

	thumb_func_start sub_020352D8
sub_020352D8: ; 0x020352D8
	push {r3, r4, r5, lr}
	bl sub_0203993C
	add r5, r0, #0
	bl sub_02035784
	add r4, r0, #0
	cmp r5, #0xf
	beq _02035360
	ldr r0, _020353A8 ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _020353AC ; =0x00000D88
	ldr r5, [r1, r0]
	bl sub_020290B4
	cmp r0, #0x20
	ble _020352FE
	bl GF_AssertFail
_020352FE:
	bl sub_02028ECC
	cmp r0, #0x20
	beq _0203530A
	bl GF_AssertFail
_0203530A:
	bl sub_02028ECC
	add r1, r5, #0
	add r2, r0, #0
	add r0, r4, #0
	add r1, #0x10
	bl MIi_CpuCopy8
	bl sub_020290B4
	add r2, r0, #0
	ldr r0, _020353A8 ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _020353B0 ; =0x00000D7C
	ldr r0, [r1, r0]
	add r1, r5, #0
	add r1, #0x30
	bl MIi_CpuCopy8
	add r0, r4, #0
	bl PlayerProfile_GetTrainerID
	str r0, [r5]
	bl sub_0203993C
	strb r0, [r5, #4]
	bl sub_02039954
	strb r0, [r5, #5]
	ldr r0, _020353A8 ; =0x021D4134
	mov r2, #8
	ldr r1, [r0, #8]
	ldr r0, _020353B4 ; =0x00000D68
	add r0, r1, r0
	add r1, r5, #0
	add r1, #8
	bl MIi_CpuCopy8
	bl sub_02033AB8
	add r5, #0x54
	strb r0, [r5]
	b _02035388
_02035360:
	ldr r1, _020353A8 ; =0x021D4134
	ldr r2, [r1, #8]
	ldr r1, _020353AC ; =0x00000D88
	ldr r4, [r2, r1]
	bl PlayerProfile_GetTrainerID
	str r0, [r4]
	bl sub_0203993C
	strb r0, [r4, #4]
	bl sub_02039954
	strb r0, [r4, #5]
	ldr r0, _020353A8 ; =0x021D4134
	add r4, #8
	ldr r0, [r0, #8]
	add r1, r4, #0
	mov r2, #0x54
	bl MIi_CpuCopy8
_02035388:
	ldr r0, _020353A8 ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _020353AC ; =0x00000D88
	ldr r0, [r1, r0]
	mov r1, #0x5c
	bl DC_FlushRange
	ldr r0, _020353A8 ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _020353AC ; =0x00000D88
	ldr r0, [r1, r0]
	mov r1, #0x5c
	bl sub_02033240
	pop {r3, r4, r5, pc}
	nop
_020353A8: .word 0x021D4134
_020353AC: .word 0x00000D88
_020353B0: .word 0x00000D7C
_020353B4: .word 0x00000D68
	thumb_func_end sub_020352D8

	thumb_func_start sub_020353B8
sub_020353B8: ; 0x020353B8
	push {r4, lr}
	ldr r0, _02035404 ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035408 ; =0x00000D88
	ldr r4, [r1, r0]
	bl sub_02035610
	ldrb r1, [r4, #6]
	cmp r1, r0
	beq _02035402
	bl sub_02035610
	strb r0, [r4, #6]
	ldr r0, _02035404 ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035408 ; =0x00000D88
	ldr r0, [r1, r0]
	mov r1, #0x5c
	bl DC_FlushRange
	ldr r0, _02035404 ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035408 ; =0x00000D88
	ldr r0, [r1, r0]
	mov r1, #0x5c
	bl sub_02033240
	ldr r3, _02035404 ; =0x021D4134
	ldr r2, _02035408 ; =0x00000D88
	ldr r4, [r3, #8]
	ldrh r3, [r3]
	ldr r0, [r4, r2]
	sub r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x5c
	bl sub_020339B4
_02035402:
	pop {r4, pc}
	.balign 4, 0
_02035404: .word 0x021D4134
_02035408: .word 0x00000D88
	thumb_func_end sub_020353B8

	thumb_func_start sub_0203540C
sub_0203540C: ; 0x0203540C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_02033298
	add r5, r0, #0
	bl sub_020347CC
	add r6, r0, #0
	bl sub_020353B8
	bl sub_020338F4
	cmp r0, #0
	bne _0203544A
	bl sub_0203567C
	cmp r0, #0
	bne _0203544A
	ldr r0, _020355AC ; =0x021D4134
	ldr r3, _020355B0 ; =0x00000D95
	ldr r1, [r0, #8]
	ldrb r0, [r1, r3]
	lsl r2, r0, #0x1d
	lsr r2, r2, #0x1f
	beq _0203544A
	mov r2, #1
	bic r0, r2
	mov r2, #1
	orr r0, r2
	strb r0, [r1, r3]
_0203544A:
	ldr r0, _020355AC ; =0x021D4134
	ldr r3, _020355B4 ; =0x00000D8E
	ldr r2, [r0, #8]
	ldr r0, _020355B8 ; =0x0000FFFF
	ldrh r1, [r2, r3]
	cmp r1, r0
	bne _0203545A
	strh r4, [r2, r3]
_0203545A:
	ldr r0, _020355AC ; =0x021D4134
	ldr r3, _020355B0 ; =0x00000D95
	ldr r1, [r0, #8]
	ldrb r0, [r1, r3]
	lsl r2, r0, #0x1e
	lsr r2, r2, #0x1f
	beq _02035490
	sub r2, r3, #7
	ldrh r2, [r1, r2]
	cmp r2, r4
	bls _0203547A
	mov r2, #1
	bic r0, r2
	mov r2, #1
	orr r0, r2
	strb r0, [r1, r3]
_0203547A:
	cmp r6, #0
	beq _02035490
	ldr r0, _020355AC ; =0x021D4134
	ldr r2, _020355B0 ; =0x00000D95
	ldr r0, [r0, #8]
	mov r1, #1
	ldrb r3, [r0, r2]
	bic r3, r1
	mov r1, #1
	orr r1, r3
	strb r1, [r0, r2]
_02035490:
	bl sub_020332AC
	cmp r0, #0x19
	bne _0203549E
	mov r0, #0
	bl sub_020399DC
_0203549E:
	cmp r5, #9
	bls _020354A4
	b _020355A6
_020354A4:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020354B0: ; jump table
	.short _020354C4 - _020354B0 - 2 ; case 0
	.short _020354E4 - _020354B0 - 2 ; case 1
	.short _020355A6 - _020354B0 - 2 ; case 2
	.short _020355A6 - _020354B0 - 2 ; case 3
	.short _020355A6 - _020354B0 - 2 ; case 4
	.short _020355A6 - _020354B0 - 2 ; case 5
	.short _020355A6 - _020354B0 - 2 ; case 6
	.short _02035528 - _020354B0 - 2 ; case 7
	.short _0203550E - _020354B0 - 2 ; case 8
	.short _0203550E - _020354B0 - 2 ; case 9
_020354C4:
	ldr r0, _020355AC ; =0x021D4134
	ldr r2, [r0, #8]
	ldr r0, _020355BC ; =0x00000D92
	ldrb r1, [r2, r0]
	cmp r1, #1
	bne _020354D8
	bl sub_020350D4
	add sp, #8
	pop {r4, r5, r6, pc}
_020354D8:
	cmp r1, #2
	bne _020355A6
	mov r1, #3
	strb r1, [r2, r0]
	add sp, #8
	pop {r4, r5, r6, pc}
_020354E4:
	ldr r0, _020355AC ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _020355BC ; =0x00000D92
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _020354F8
	bl sub_020338D0
	cmp r0, #0
	bne _020355A6
_020354F8:
	ldr r0, _020355AC ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _020355BC ; =0x00000D92
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _020355A6
	bl sub_020338D0
	add sp, #8
	cmp r0, #0
	pop {r4, r5, r6, pc}
_0203550E:
	ldr r0, _020355AC ; =0x021D4134
	ldr r3, [r0, #8]
	cmp r3, #0
	beq _020355A6
	ldr r1, _020355B0 ; =0x00000D95
	mov r0, #1
	ldrb r2, [r3, r1]
	add sp, #8
	bic r2, r0
	mov r0, #1
	orr r0, r2
	strb r0, [r3, r1]
	pop {r4, r5, r6, pc}
_02035528:
	bl sub_02033468
	ldr r3, _020355AC ; =0x021D4134
	ldr r2, _020355C0 ; =0x00000D91
	ldr r4, [r3, #8]
	ldrb r1, [r4, r2]
	cmp r1, #0
	bne _02035544
	sub r1, r2, #5
	strh r0, [r4, r1]
	ldr r0, [r3, #8]
	mov r1, #5
	strb r1, [r0, r2]
	b _02035548
_02035544:
	sub r0, r1, #1
	strb r0, [r4, r2]
_02035548:
	ldr r0, _020355AC ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _020355C4 ; =0x00000D8C
	ldrh r5, [r1, r0]
	add r0, #9
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	beq _02035562
	bl sub_020DF250
	ldr r1, _020355AC ; =0x021D4134
	strh r0, [r1]
_02035562:
	bl sub_020352D8
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r4, r0, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02035724
	str r0, [sp]
	ldr r1, _020355AC ; =0x021D4134
	ldr r0, _020355B0 ; =0x00000D95
	ldr r2, [r1, #8]
	add r3, r4, #0
	ldrb r0, [r2, r0]
	add r2, r5, #0
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	str r0, [sp, #4]
	ldrh r1, [r1]
	mov r0, #0
	bl sub_02033668
	ldr r0, _020355AC ; =0x021D4134
	ldr r1, [r0, #8]
	mov r0, #0xd9
	lsl r0, r0, #4
	strb r5, [r1, r0]
_020355A6:
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_020355AC: .word 0x021D4134
_020355B0: .word 0x00000D95
_020355B4: .word 0x00000D8E
_020355B8: .word 0x0000FFFF
_020355BC: .word 0x00000D92
_020355C0: .word 0x00000D91
_020355C4: .word 0x00000D8C
	thumb_func_end sub_0203540C

	thumb_func_start sub_020355C8
sub_020355C8: ; 0x020355C8
	push {r3, lr}
	ldr r1, _020355D8 ; =0x021D4134
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _020355D6
	bl sub_0203540C
_020355D6:
	pop {r3, pc}
	.balign 4, 0
_020355D8: .word 0x021D4134
	thumb_func_end sub_020355C8

	thumb_func_start sub_020355DC
sub_020355DC: ; 0x020355DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0203560C ; =0x021D4134
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _020355EC
	mov r0, #0
	pop {r4, pc}
_020355EC:
	bl sub_02033298
	cmp r0, #4
	beq _020355F8
	mov r0, #0
	pop {r4, pc}
_020355F8:
	bl sub_02033250
	mov r2, #1
	add r1, r2, #0
	lsl r1, r4
	tst r0, r1
	bne _02035608
	mov r2, #0
_02035608:
	add r0, r2, #0
	pop {r4, pc}
	.balign 4, 0
_0203560C: .word 0x021D4134
	thumb_func_end sub_020355DC

	thumb_func_start sub_02035610
sub_02035610: ; 0x02035610
	push {r3, r4, r5, lr}
	mov r4, #0
	add r5, r4, #0
_02035616:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl sub_020355DC
	cmp r0, #0
	beq _02035624
	add r4, r4, #1
_02035624:
	add r5, r5, #1
	cmp r5, #8
	blt _02035616
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02035610

	thumb_func_start sub_02035630
sub_02035630: ; 0x02035630
	ldr r0, _02035648 ; =0x021D4134
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _02035644
	ldr r0, _0203564C ; =0x00000D92
	ldrb r0, [r1, r0]
	cmp r0, #3
	bne _02035644
	mov r0, #1
	bx lr
_02035644:
	mov r0, #0
	bx lr
	.balign 4, 0
_02035648: .word 0x021D4134
_0203564C: .word 0x00000D92
	thumb_func_end sub_02035630

	thumb_func_start sub_02035650
sub_02035650: ; 0x02035650
	ldr r0, _02035660 ; =0x021D4134
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0203565C
	mov r0, #1
	bx lr
_0203565C:
	mov r0, #0
	bx lr
	.balign 4, 0
_02035660: .word 0x021D4134
	thumb_func_end sub_02035650

	thumb_func_start sub_02035664
sub_02035664: ; 0x02035664
	push {r3, lr}
	ldr r0, _02035678 ; =0x021D4134
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02035674
	bl sub_02033920
	pop {r3, pc}
_02035674:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02035678: .word 0x021D4134
	thumb_func_end sub_02035664

	thumb_func_start sub_0203567C
sub_0203567C: ; 0x0203567C
	push {r3, lr}
	ldr r0, _02035694 ; =0x021D4134
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02035690
	bl sub_02033250
	ldr r1, _02035698 ; =0x0000FFFE
	and r0, r1
	pop {r3, pc}
_02035690:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02035694: .word 0x021D4134
_02035698: .word 0x0000FFFE
	thumb_func_end sub_0203567C

	thumb_func_start sub_0203569C
sub_0203569C: ; 0x0203569C
	ldr r0, _020356B8 ; =0x021D4134
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _020356B2
	ldr r0, _020356BC ; =0x00000D95
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _020356B2
	mov r0, #1
	bx lr
_020356B2:
	mov r0, #0
	bx lr
	nop
_020356B8: .word 0x021D4134
_020356BC: .word 0x00000D95
	thumb_func_end sub_0203569C

	thumb_func_start sub_020356C0
sub_020356C0: ; 0x020356C0
	push {r3, r4}
	ldr r1, _020356E4 ; =0x021D4134
	ldr r2, [r1, #8]
	cmp r2, #0
	beq _020356DE
	ldr r4, _020356E8 ; =0x00000D95
	lsl r0, r0, #0x18
	ldrb r1, [r2, r4]
	lsr r0, r0, #0x18
	mov r3, #4
	lsl r0, r0, #0x1f
	bic r1, r3
	lsr r0, r0, #0x1d
	orr r0, r1
	strb r0, [r2, r4]
_020356DE:
	pop {r3, r4}
	bx lr
	nop
_020356E4: .word 0x021D4134
_020356E8: .word 0x00000D95
	thumb_func_end sub_020356C0

	thumb_func_start sub_020356EC
sub_020356EC: ; 0x020356EC
	push {r4, r5}
	ldr r5, _02035718 ; =0x021D4134
	ldr r2, [r5, #8]
	cmp r2, #0
	beq _02035712
	ldr r4, _0203571C ; =0x00000D95
	lsl r0, r0, #0x18
	ldrb r1, [r2, r4]
	lsr r0, r0, #0x18
	mov r3, #2
	lsl r0, r0, #0x1f
	bic r1, r3
	lsr r0, r0, #0x1e
	orr r0, r1
	strb r0, [r2, r4]
	ldr r2, _02035720 ; =0x0000FFFF
	ldr r1, [r5, #8]
	sub r0, r4, #7
	strh r2, [r1, r0]
_02035712:
	pop {r4, r5}
	bx lr
	nop
_02035718: .word 0x021D4134
_0203571C: .word 0x00000D95
_02035720: .word 0x0000FFFF
	thumb_func_end sub_020356EC

	thumb_func_start sub_02035724
sub_02035724: ; 0x02035724
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020DEFD4
	add r4, r0, #0
	cmp r5, #0x29
	blo _02035736
	bl GF_AssertFail
_02035736:
	cmp r5, #0xa
	bne _02035740
	lsl r0, r4, #0xe
	lsr r0, r0, #0x10
	pop {r3, r4, r5, pc}
_02035740:
	cmp r5, #9
	beq _02035748
	cmp r5, #0xd
	bne _0203574E
_02035748:
	lsl r0, r4, #0xe
	lsr r0, r0, #0x10
	pop {r3, r4, r5, pc}
_0203574E:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02035724

	thumb_func_start sub_02035754
sub_02035754: ; 0x02035754
	ldr r1, _0203577C ; =0x021D4134
	ldr r3, [r1, #8]
	cmp r3, #0
	beq _02035776
	lsl r1, r0, #1
	add r2, r3, r1
	ldr r1, _02035780 ; =0x00000D44
	ldrh r1, [r2, r1]
	cmp r1, #0
	beq _02035776
	mov r1, #0x45
	lsl r1, r1, #2
	add r2, r3, r1
	mov r1, #0xc0
	mul r1, r0
	add r0, r2, r1
	bx lr
_02035776:
	mov r0, #0
	bx lr
	nop
_0203577C: .word 0x021D4134
_02035780: .word 0x00000D44
	thumb_func_end sub_02035754

	thumb_func_start sub_02035784
sub_02035784: ; 0x02035784
	ldr r0, _02035790 ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035794 ; =0x00000D78
	ldr r0, [r1, r0]
	bx lr
	nop
_02035790: .word 0x021D4134
_02035794: .word 0x00000D78
	thumb_func_end sub_02035784

	thumb_func_start sub_02035798
sub_02035798: ; 0x02035798
	ldr r1, _020357BC ; =0x021D4134
	ldr r3, [r1, #8]
	lsl r1, r0, #1
	add r2, r3, r1
	ldr r1, _020357C0 ; =0x00000D44
	ldrh r1, [r2, r1]
	cmp r1, #0
	bne _020357AC
	mov r0, #0
	bx lr
_020357AC:
	mov r1, #0x59
	lsl r1, r1, #2
	add r2, r3, r1
	mov r1, #0xc0
	mul r1, r0
	add r0, r2, r1
	add r0, #0x10
	bx lr
	.balign 4, 0
_020357BC: .word 0x021D4134
_020357C0: .word 0x00000D44
	thumb_func_end sub_02035798

	thumb_func_start sub_020357C4
sub_020357C4: ; 0x020357C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _020357F4 ; =0x021D4134
	add r4, r1, #0
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _020357F0
	cmp r4, #8
	blt _020357DA
	bl GF_AssertFail
_020357DA:
	ldr r1, _020357F4 ; =0x021D4134
	add r0, r5, #0
	ldr r2, [r1, #8]
	ldr r1, _020357F8 ; =0x00000D14
	add r3, r2, r1
	mov r2, #6
	add r1, r4, #0
	mul r1, r2
	add r1, r3, r1
	bl MIi_CpuCopy8
_020357F0:
	pop {r3, r4, r5, pc}
	nop
_020357F4: .word 0x021D4134
_020357F8: .word 0x00000D14
	thumb_func_end sub_020357C4

	thumb_func_start sub_020357FC
sub_020357FC: ; 0x020357FC
	ldr r0, _02035814 ; =0x021D4134
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0203580E
	ldr r0, _02035818 ; =0x00000D95
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	bx lr
_0203580E:
	mov r0, #0
	bx lr
	nop
_02035814: .word 0x021D4134
_02035818: .word 0x00000D95
	thumb_func_end sub_020357FC

	thumb_func_start sub_0203581C
sub_0203581C: ; 0x0203581C
	ldr r0, _02035830 ; =0x021D4134
	ldr r3, [r0, #8]
	cmp r3, #0
	beq _0203582E
	ldr r1, _02035834 ; =0x00000D95
	mov r0, #0x10
	ldrb r2, [r3, r1]
	orr r0, r2
	strb r0, [r3, r1]
_0203582E:
	bx lr
	.balign 4, 0
_02035830: .word 0x021D4134
_02035834: .word 0x00000D95
	thumb_func_end sub_0203581C

	thumb_func_start sub_02035838
sub_02035838: ; 0x02035838
	ldr r1, _02035848 ; =0x021D4134
	ldr r3, _0203584C ; =MIi_CpuCopy8
	ldr r2, [r1, #8]
	ldr r1, _02035850 ; =0x00000D68
	add r1, r2, r1
	mov r2, #8
	bx r3
	nop
_02035848: .word 0x021D4134
_0203584C: .word MIi_CpuCopy8
_02035850: .word 0x00000D68
	thumb_func_end sub_02035838

	thumb_func_start sub_02035854
sub_02035854: ; 0x02035854
	push {r4, lr}
	add r4, r0, #0
	bl sub_020290B4
	ldr r1, _02035870 ; =0x021D4134
	add r2, r0, #0
	ldr r3, [r1, #8]
	ldr r1, _02035874 ; =0x00000D7C
	add r0, r4, #0
	ldr r1, [r3, r1]
	bl MIi_CpuCopy8
	pop {r4, pc}
	nop
_02035870: .word 0x021D4134
_02035874: .word 0x00000D7C
	thumb_func_end sub_02035854

	thumb_func_start sub_02035878
sub_02035878: ; 0x02035878
	ldr r0, _02035884 ; =0x021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035888 ; =0x00000D7C
	ldr r0, [r1, r0]
	bx lr
	nop
_02035884: .word 0x021D4134
_02035888: .word 0x00000D7C
	thumb_func_end sub_02035878

	thumb_func_start sub_0203588C
sub_0203588C: ; 0x0203588C
	push {r4, lr}
	bl sub_020352D8
	ldr r3, _020358A8 ; =0x021D4134
	ldr r2, _020358AC ; =0x00000D88
	ldr r4, [r3, #8]
	ldrh r3, [r3]
	ldr r0, [r4, r2]
	sub r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x5c
	bl sub_020339B4
	pop {r4, pc}
	.balign 4, 0
_020358A8: .word 0x021D4134
_020358AC: .word 0x00000D88
	thumb_func_end sub_0203588C

	thumb_func_start sub_020358B0
sub_020358B0: ; 0x020358B0
	ldr r3, _020358B4 ; =sub_02033A44
	bx r3
	.balign 4, 0
_020358B4: .word sub_02033A44
	thumb_func_end sub_020358B0

	thumb_func_start sub_020358B8
sub_020358B8: ; 0x020358B8
	push {r3, lr}
	ldr r1, _020358CC ; =0x021D4134
	mov r2, #0x54
	ldr r1, [r1, #8]
	bl MIi_CpuCopy8
	bl sub_0203588C
	pop {r3, pc}
	nop
_020358CC: .word 0x021D4134
	thumb_func_end sub_020358B8

	thumb_func_start sub_020358D0
sub_020358D0: ; 0x020358D0
	ldr r1, _020358F8 ; =0x021D4134
	ldr r3, [r1, #8]
	cmp r3, #0
	beq _020358F4
	lsl r1, r0, #1
	add r2, r3, r1
	ldr r1, _020358FC ; =0x00000D44
	ldrh r1, [r2, r1]
	cmp r1, #0
	beq _020358F4
	mov r1, #0x59
	lsl r1, r1, #2
	add r2, r3, r1
	mov r1, #0xc0
	mul r1, r0
	add r0, r2, r1
	add r0, #8
	bx lr
_020358F4:
	mov r0, #0
	bx lr
	.balign 4, 0
_020358F8: .word 0x021D4134
_020358FC: .word 0x00000D44
	thumb_func_end sub_020358D0

	thumb_func_start sub_02035900
sub_02035900: ; 0x02035900
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r4, #0
	ldr r1, _02035AB8 ; =0x021D4140
	cmp r0, #0
	strb r4, [r1, #1]
	bne _02035910
	b _02035A58
_02035910:
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r6, r0, #1
	ldr r0, _02035AB8 ; =0x021D4140
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0203592A
	mov r0, #1
	pop {r4, r5, r6, pc}
_0203592A:
	mov r0, #0xf
	bl sub_020379A0
	mov r1, #0x6e
	mov r0, #0xf
	lsl r1, r1, #4
	bl AllocFromHeap
	ldr r2, _02035AB8 ; =0x021D4140
	mov r1, #0x1f
	add r3, r0, #0
	and r3, r1
	mov r1, #0x20
	sub r1, r1, r3
	str r0, [r2, #4]
	add r0, r1, r0
	str r0, [r2, #8]
	mov r2, #0x1b
	add r1, r4, #0
	lsl r2, r2, #6
	bl MIi_CpuFill8
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _02035972
	ldr r0, _02035AB8 ; =0x021D4140
	lsl r2, r5, #1
	ldr r1, [r0, #8]
	mov r0, #0x69
	add r2, #0x40
	lsl r0, r0, #4
	str r2, [r1, r0]
	b _0203597E
_02035972:
	ldr r0, _02035AB8 ; =0x021D4140
	add r5, #0x40
	ldr r1, [r0, #8]
	mov r0, #0x69
	lsl r0, r0, #4
	str r5, [r1, r0]
_0203597E:
	ldr r2, _02035AB8 ; =0x021D4140
	mov r1, #0x69
	ldr r0, [r2, #8]
	lsl r1, r1, #4
	ldr r3, [r0, r1]
	add r5, r3, #0
	mul r5, r6
	sub r3, r1, #4
	str r5, [r0, r3]
	add r0, r1, #0
	ldr r3, [r2, #8]
	mov r5, #0
	add r0, #0x1d
	strb r5, [r3, r0]
	add r0, r1, #0
	ldr r3, [r2, #8]
	mov r5, #0x2a
	add r0, #0x1e
	strb r5, [r3, r0]
	ldr r2, [r2, #8]
	mov r0, #0xf
	ldr r1, [r2, r1]
	lsl r1, r1, #1
	bl AllocFromHeap
	ldr r2, _02035AB8 ; =0x021D4140
	mov r1, #0x49
	ldr r3, [r2, #8]
	lsl r1, r1, #4
	str r0, [r3, r1]
	mov r1, #0x69
	ldr r2, [r2, #8]
	lsl r1, r1, #4
	ldr r1, [r2, r1]
	mov r0, #0xf
	bl AllocFromHeap
	ldr r2, _02035AB8 ; =0x021D4140
	ldr r1, _02035ABC ; =0x00000494
	ldr r3, [r2, #8]
	str r0, [r3, r1]
	ldr r2, [r2, #8]
	ldr r1, _02035AC0 ; =0x0000068C
	mov r0, #0xf
	ldr r1, [r2, r1]
	bl AllocFromHeap
	ldr r2, _02035AB8 ; =0x021D4140
	ldr r1, _02035AC4 ; =0x0000048C
	ldr r3, [r2, #8]
	str r0, [r3, r1]
	ldr r2, [r2, #8]
	ldr r1, _02035AC0 ; =0x0000068C
	mov r0, #0xf
	ldr r1, [r2, r1]
	bl AllocFromHeap
	ldr r1, _02035AB8 ; =0x021D4140
	ldr r2, [r1, #8]
	ldr r1, _02035AC8 ; =0x00000488
	str r0, [r2, r1]
	bl sub_0203993C
	cmp r0, #0xa
	bne _02035A2C
	ldr r0, _02035AB8 ; =0x021D4140
	mov r2, #0x16
	ldr r3, [r0, #8]
	lsl r2, r2, #6
	add r0, r3, r2
	sub r2, #0xe8
	mov r1, #0x64
	add r2, r3, r2
	bl sub_02033F44
	ldr r0, _02035AB8 ; =0x021D4140
	mov r2, #0x5a
	mov r1, #0x32
	ldr r3, [r0, #8]
	lsl r2, r2, #4
	add r0, r3, r2
	sub r2, #0x90
	lsl r1, r1, #4
	add r2, r3, r2
	bl sub_02033F44
	b _02035A64
_02035A2C:
	ldr r0, _02035AB8 ; =0x021D4140
	mov r2, #0x16
	ldr r3, [r0, #8]
	lsl r2, r2, #6
	add r0, r3, r2
	sub r2, #0xe8
	mov r1, #0x14
	add r2, r3, r2
	bl sub_02033F44
	ldr r0, _02035AB8 ; =0x021D4140
	mov r2, #0x5a
	add r1, r5, #0
	ldr r3, [r0, #8]
	lsl r2, r2, #4
	add r0, r3, r2
	sub r2, #0x90
	add r1, #0xee
	add r2, r3, r2
	bl sub_02033F44
	b _02035A64
_02035A58:
	ldr r0, [r1, #8]
	mov r4, #1
	cmp r0, #0
	bne _02035A64
	bl GF_AssertFail
_02035A64:
	ldr r2, _02035AB8 ; =0x021D4140
	ldr r1, _02035ACC ; =0x00000694
	ldr r3, [r2, #8]
	mov r0, #0
	strh r0, [r3, r1]
	mov r5, #0xff
	add r1, #0x12
_02035A72:
	ldr r3, [r2, #8]
	add r3, r3, r0
	add r0, r0, #1
	strb r5, [r3, r1]
	cmp r0, #4
	blt _02035A72
	cmp r4, #0
	bne _02035A86
	bl sub_02035DA4
_02035A86:
	ldr r0, _02035AB8 ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _02035AD0 ; =0x0000062C
	add r0, r1, r0
	bl sub_0203778C
	cmp r4, #0
	bne _02035AA8
	mov r1, #0
	ldr r0, _02035AD4 ; =sub_020360EC
	add r2, r1, #0
	bl sub_0200E33C
	ldr r1, _02035AB8 ; =0x021D4140
	ldr r2, [r1, #8]
	ldr r1, _02035AD8 ; =0x0000057C
	str r0, [r2, r1]
_02035AA8:
	ldr r0, _02035AB8 ; =0x021D4140
	mov r2, #0
	ldr r1, [r0, #8]
	ldr r0, _02035ADC ; =0x000006B6
	strb r2, [r1, r0]
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_02035AB8: .word 0x021D4140
_02035ABC: .word 0x00000494
_02035AC0: .word 0x0000068C
_02035AC4: .word 0x0000048C
_02035AC8: .word 0x00000488
_02035ACC: .word 0x00000694
_02035AD0: .word 0x0000062C
_02035AD4: .word sub_020360EC
_02035AD8: .word 0x0000057C
_02035ADC: .word 0x000006B6
	thumb_func_end sub_02035900

	thumb_func_start sub_02035AE0
sub_02035AE0: ; 0x02035AE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	mov r2, #0x66
	ldr r3, _02035D5C ; =0x021D4140
	add r7, r0, #1
	ldr r0, [r3, #8]
	mov r1, #0
	lsl r2, r2, #4
	strb r1, [r0, r2]
	add r0, r2, #1
	ldr r4, [r3, #8]
	add r2, #0x2c
	strb r1, [r4, r0]
	ldr r3, [r3, #8]
	ldr r0, _02035D60 ; =0x0000048C
	ldr r2, [r3, r2]
	ldr r0, [r3, r0]
	bl MIi_CpuFill8
	ldr r0, _02035D5C ; =0x021D4140
	mov r2, #0x60
	ldr r1, [r0, #8]
	ldr r0, _02035D64 ; =0x0000051C
	add r0, r1, r0
	mov r1, #0
	bl MIi_CpuFill8
	ldr r0, _02035D5C ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _02035D68 ; =0x0000068C
	ldr r0, [r1, r0]
	add r1, r7, #0
	bl _s32_div_f
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	cmp r7, #0
	ble _02035B62
	add r6, r0, #0
	add r5, r0, #0
_02035B3E:
	ldr r0, _02035D5C ; =0x021D4140
	ldr r2, _02035D60 ; =0x0000048C
	ldr r1, [r0, #8]
	ldr r0, _02035D64 ; =0x0000051C
	add r0, r1, r0
	ldr r1, [r1, r2]
	add r0, r0, r5
	add r1, r1, r6
	add r2, r4, #0
	bl sub_02033AE0
	ldr r0, [sp, #4]
	add r6, r6, r4
	add r0, r0, #1
	add r5, #0xc
	str r0, [sp, #4]
	cmp r0, r7
	blt _02035B3E
_02035B62:
	ldr r0, _02035D5C ; =0x021D4140
	ldr r2, _02035D68 ; =0x0000068C
	ldr r3, [r0, #8]
	ldr r0, _02035D6C ; =0x00000488
	ldr r2, [r3, r2]
	ldr r0, [r3, r0]
	mov r1, #0
	bl MIi_CpuFill8
	ldr r0, _02035D5C ; =0x021D4140
	mov r2, #0x60
	ldr r1, [r0, #8]
	mov r0, #0x4b
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl MIi_CpuFill8
	mov r0, #0
	str r0, [sp]
	cmp r7, #0
	ble _02035BB8
	add r6, r0, #0
	add r5, r0, #0
_02035B92:
	ldr r0, _02035D5C ; =0x021D4140
	ldr r2, _02035D6C ; =0x00000488
	ldr r1, [r0, #8]
	mov r0, #0x4b
	lsl r0, r0, #4
	add r0, r1, r0
	ldr r1, [r1, r2]
	add r0, r0, r5
	add r1, r1, r6
	add r2, r4, #0
	bl sub_02033AE0
	ldr r0, [sp]
	add r6, r6, r4
	add r0, r0, #1
	add r5, #0xc
	str r0, [sp]
	cmp r0, r7
	blt _02035B92
_02035BB8:
	ldr r0, _02035D5C ; =0x021D4140
	mov r2, #6
	ldr r1, [r0, #8]
	mov r0, #0xc2
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #0
	lsl r2, r2, #6
	bl MIi_CpuFill8
	ldr r0, _02035D5C ; =0x021D4140
	mov r1, #0xc2
	ldr r2, [r0, #8]
	mov r0, #0x51
	lsl r0, r0, #4
	lsl r1, r1, #2
	add r0, r2, r0
	add r1, r2, r1
	mov r2, #6
	lsl r2, r2, #6
	bl sub_02033AE0
	ldr r0, _02035D5C ; =0x021D4140
	mov r1, #0xee
	ldr r0, [r0, #8]
	add r2, r1, #0
	add r0, #0x80
	add r2, #0x92
	bl MIi_CpuFill8
	ldr r0, _02035D5C ; =0x021D4140
	ldr r1, [r0, #8]
	mov r0, #5
	lsl r0, r0, #6
	add r0, r1, r0
	mov r1, #0xee
	add r2, r1, #0
	add r2, #0x92
	bl MIi_CpuFill8
	ldr r0, _02035D5C ; =0x021D4140
	mov r2, #2
	ldr r0, [r0, #8]
	lsl r2, r2, #8
	add r0, r0, r2
	mov r1, #0
	sub r2, #0xf8
	bl MIi_CpuFill8
	ldr r0, _02035D5C ; =0x021D4140
	mov r2, #2
	ldr r1, [r0, #8]
	ldr r0, _02035D70 ; =0x00000498
	lsl r2, r2, #8
	add r0, r1, r0
	add r1, r1, r2
	sub r2, #0xf8
	bl sub_02033AE0
	ldr r0, _02035D5C ; =0x021D4140
	mov r1, #0xee
	ldr r0, [r0, #8]
	mov r2, #0x26
	bl MIi_CpuFill8
	ldr r0, _02035D5C ; =0x021D4140
	mov r1, #0xee
	ldr r0, [r0, #8]
	mov r2, #0x26
	add r0, #0x40
	bl MIi_CpuFill8
	ldr r0, _02035D5C ; =0x021D4140
	mov r2, #0xff
	ldr r1, [r0, #8]
	strb r2, [r1]
	ldr r1, [r0, #8]
	add r1, #0x40
	strb r2, [r1]
	ldr r3, [r0, #8]
	mov r2, #0x69
	mov r0, #0x49
	lsl r2, r2, #4
	lsl r0, r0, #4
	ldr r2, [r3, r2]
	ldr r0, [r3, r0]
	mov r1, #0
	lsl r2, r2, #1
	bl MIi_CpuFill8
	ldr r0, _02035D5C ; =0x021D4140
	mov r2, #0x69
	ldr r3, [r0, #8]
	ldr r1, _02035D74 ; =0x000004A4
	lsl r2, r2, #4
	add r0, r3, r1
	sub r1, #0x14
	ldr r2, [r3, r2]
	ldr r1, [r3, r1]
	lsl r2, r2, #1
	bl sub_02033AE0
	ldr r0, _02035D5C ; =0x021D4140
	mov r2, #0
	ldr r3, [r0, #8]
	ldr r1, _02035D78 ; =0x000006B4
	mov ip, r2
	strb r2, [r3, r1]
	ldr r3, [r0, #8]
	add r1, r1, #1
	strb r2, [r3, r1]
	add r1, r2, #0
	add r7, r2, #0
	add r6, r2, #0
_02035C9C:
	ldr r3, [r0, #8]
	add r4, r3, r2
	ldr r3, _02035D7C ; =0x00000696
	strb r6, [r4, r3]
	ldr r3, [r0, #8]
	ldr r4, _02035D80 ; =0x0000069E
	add r5, r3, r2
	mov r3, #1
	strb r3, [r5, r4]
	ldr r4, [r0, #8]
	mov r3, ip
	add r4, r4, r3
	ldr r3, _02035D84 ; =0x00000644
	add r2, r2, #1
	strh r6, [r4, r3]
	ldr r3, [r0, #8]
	mov r4, #0xee
	add r5, r3, r1
	ldr r3, _02035D88 ; =0x000005CA
	strb r4, [r5, r3]
	ldr r3, [r0, #8]
	ldr r4, _02035D8C ; =0x0000FFFF
	add r5, r3, r1
	ldr r3, _02035D90 ; =0x000005C8
	strh r4, [r5, r3]
	ldr r3, [r0, #8]
	add r4, r3, r1
	ldr r3, _02035D94 ; =0x000005C4
	str r6, [r4, r3]
	ldr r3, [r0, #8]
	add r4, r3, r1
	mov r3, #0x17
	lsl r3, r3, #6
	str r6, [r4, r3]
	ldr r3, [r0, #8]
	add r1, #0xc
	add r4, r3, r7
	ldr r3, _02035D98 ; =0x0000066C
	add r7, r7, #4
	str r6, [r4, r3]
	mov r3, ip
	add r3, r3, #2
	mov ip, r3
	cmp r2, #8
	blt _02035C9C
	ldr r1, _02035D5C ; =0x021D4140
	ldr r0, _02035D9C ; =0x00000668
	ldr r2, [r1, #8]
	add r3, r0, #0
	str r6, [r2, r0]
	ldr r4, [r1, #8]
	sub r3, #0x3e
	mov r2, #0xee
	strb r2, [r4, r3]
	add r3, r0, #0
	ldr r4, [r1, #8]
	ldr r2, _02035D8C ; =0x0000FFFF
	sub r3, #0x40
	strh r2, [r4, r3]
	add r2, r0, #0
	ldr r3, [r1, #8]
	sub r2, #0x44
	str r6, [r3, r2]
	add r2, r0, #0
	ldr r3, [r1, #8]
	sub r2, #0x48
	str r6, [r3, r2]
	add r3, r0, #0
	ldr r4, [r1, #8]
	add r3, #0x4a
	mov r2, #1
	strb r2, [r4, r3]
	add r3, r0, #0
	ldr r4, [r1, #8]
	add r3, #0x4b
	strb r2, [r4, r3]
	strb r6, [r1]
	ldr r1, [r1, #8]
	sub r0, #0xe8
	add r0, r1, r0
	bl sub_02033F70
	ldr r0, _02035D5C ; =0x021D4140
	ldr r1, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r1, r0
	bl sub_02033F70
	ldr r0, _02035D5C ; =0x021D4140
	mov r2, #0
	ldr r1, [r0, #8]
	ldr r0, _02035DA0 ; =0x000006B7
	strb r2, [r1, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02035D5C: .word 0x021D4140
_02035D60: .word 0x0000048C
_02035D64: .word 0x0000051C
_02035D68: .word 0x0000068C
_02035D6C: .word 0x00000488
_02035D70: .word 0x00000498
_02035D74: .word 0x000004A4
_02035D78: .word 0x000006B4
_02035D7C: .word 0x00000696
_02035D80: .word 0x0000069E
_02035D84: .word 0x00000644
_02035D88: .word 0x000005CA
_02035D8C: .word 0x0000FFFF
_02035D90: .word 0x000005C8
_02035D94: .word 0x000005C4
_02035D98: .word 0x0000066C
_02035D9C: .word 0x00000668
_02035DA0: .word 0x000006B7
	thumb_func_end sub_02035AE0

	thumb_func_start sub_02035DA4
sub_02035DA4: ; 0x02035DA4
	push {r4, lr}
	ldr r2, _02035DCC ; =0x021D4140
	ldr r1, _02035DD0 ; =0x000006AF
	ldr r0, [r2, #8]
	mov r4, #0
	strb r4, [r0, r1]
	ldr r3, [r2, #8]
	add r0, r1, #1
	strb r4, [r3, r0]
	ldr r0, [r2, #8]
	mov r3, #1
	sub r1, #0x4b
	str r3, [r0, r1]
	bl sub_02035AE0
	ldr r0, _02035DD4 ; =0x0210F900
	mov r1, #4
	strb r1, [r0]
	strb r1, [r0, #1]
	pop {r4, pc}
	.balign 4, 0
_02035DCC: .word 0x021D4140
_02035DD0: .word 0x000006AF
_02035DD4: .word 0x0210F900
	thumb_func_end sub_02035DA4

	thumb_func_start sub_02035DD8
sub_02035DD8: ; 0x02035DD8
	ldr r3, _02035DDC ; =sub_02035AE0
	bx r3
	.balign 4, 0
_02035DDC: .word sub_02035AE0
	thumb_func_end sub_02035DD8

	thumb_func_start sub_02035DE0
sub_02035DE0: ; 0x02035DE0
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _02035E84 ; =0x021D4140
	add r5, r0, #0
	ldr r0, [r4, #8]
	ldr r3, _02035E88 ; =0x00000696
	mov r1, #0
	add r0, r0, r5
	strb r1, [r0, r3]
	ldr r2, [r4, #8]
	mov r0, #1
	add r6, r2, r5
	add r2, r3, #0
	add r2, #8
	strb r0, [r6, r2]
	ldr r2, [r4, #8]
	lsl r0, r5, #2
	add r0, r2, r0
	sub r3, #0x2a
	str r1, [r0, r3]
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r1, r0, #0
	add r0, r4, #0
	ldr r6, [r0, #8]
	ldr r0, _02035E8C ; =0x0000068C
	add r1, r1, #1
	ldr r0, [r6, r0]
	bl _s32_div_f
	add r7, r5, #0
	mov r1, #0x4b
	str r0, [sp]
	mul r7, r0
	mov r0, #0xc
	add r4, r5, #0
	lsl r1, r1, #4
	mul r4, r0
	add r0, r6, r1
	sub r1, #0x28
	ldr r1, [r6, r1]
	ldr r2, [sp]
	add r0, r0, r4
	add r1, r1, r7
	bl sub_02033AE0
	ldr r0, _02035E84 ; =0x021D4140
	ldr r1, _02035E90 ; =0x0000051C
	ldr r2, [r0, #8]
	add r0, r2, r1
	sub r1, #0x90
	ldr r1, [r2, r1]
	ldr r2, [sp]
	add r0, r0, r4
	add r1, r1, r7
	bl sub_02033AE0
	ldr r3, _02035E84 ; =0x021D4140
	ldr r2, _02035E94 ; =0x000005CA
	ldr r0, [r3, #8]
	mov r1, #0xee
	add r0, r0, r4
	strb r1, [r0, r2]
	ldr r0, [r3, #8]
	ldr r5, _02035E98 ; =0x0000FFFF
	add r1, r0, r4
	sub r0, r2, #2
	strh r5, [r1, r0]
	ldr r1, [r3, #8]
	mov r0, #0
	add r5, r1, r4
	sub r1, r2, #6
	str r0, [r5, r1]
	ldr r1, [r3, #8]
	sub r2, #0xa
	add r1, r1, r4
	str r0, [r1, r2]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02035E84: .word 0x021D4140
_02035E88: .word 0x00000696
_02035E8C: .word 0x0000068C
_02035E90: .word 0x0000051C
_02035E94: .word 0x000005CA
_02035E98: .word 0x0000FFFF
	thumb_func_end sub_02035DE0

	thumb_func_start sub_02035E9C
sub_02035E9C: ; 0x02035E9C
	push {r4, r5, r6, lr}
	ldr r4, _02035EC8 ; =0x021D4140
	ldr r6, _02035ECC ; =0x0000069E
	mov r5, #1
_02035EA4:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	bne _02035EC0
	ldr r0, [r4, #8]
	add r0, r0, r5
	ldrb r0, [r0, r6]
	cmp r0, #0
	bne _02035EC0
	add r0, r5, #0
	bl sub_02035DE0
_02035EC0:
	add r5, r5, #1
	cmp r5, #8
	blt _02035EA4
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02035EC8: .word 0x021D4140
_02035ECC: .word 0x0000069E
	thumb_func_end sub_02035E9C

	thumb_func_start sub_02035ED0
sub_02035ED0: ; 0x02035ED0
	ldr r3, _02035ED4 ; =sub_02035DE0
	bx r3
	.balign 4, 0
_02035ED4: .word sub_02035DE0
	thumb_func_end sub_02035ED0

	thumb_func_start sub_02035ED8
sub_02035ED8: ; 0x02035ED8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	mov r4, #1
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	bne _02035F02
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02034EF0
	add r4, r0, #0
	ldr r0, _02035F10 ; =sub_02035ED0
	bl sub_02033A90
_02035F02:
	add r0, r5, #0
	add r1, r7, #0
	bl sub_02035900
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02035F10: .word sub_02035ED0
	thumb_func_end sub_02035ED8

	thumb_func_start sub_02035F14
sub_02035F14: ; 0x02035F14
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	mov r4, #1
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	bne _02035F34
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02034F64
	add r4, r0, #0
_02035F34:
	add r0, r5, #0
	add r1, r7, #0
	bl sub_02035900
	ldr r0, _02035F48 ; =0x0210F900
	mov r1, #4
	strb r1, [r0, #1]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02035F48: .word 0x0210F900
	thumb_func_end sub_02035F14

	thumb_func_start sub_02035F4C
sub_02035F4C: ; 0x02035F4C
	push {r4, lr}
	mov r4, #0
	bl sub_0203769C
	cmp r0, #0
	bne _02035F62
	ldr r0, _02035F9C ; =0x0210F900
	ldrb r0, [r0]
	cmp r0, #4
	beq _02035F6A
	pop {r4, pc}
_02035F62:
	ldr r0, _02035F9C ; =0x0210F900
	ldrb r0, [r0, #1]
	cmp r0, #4
	bne _02035F98
_02035F6A:
	ldr r0, _02035FA0 ; =0x021D4140
	ldr r2, [r0, #8]
	ldr r0, _02035FA4 ; =0x000006AD
	ldrb r1, [r2, r0]
	cmp r1, #2
	bne _02035F7C
	mov r1, #0
	strb r1, [r2, r0]
	mov r4, #1
_02035F7C:
	ldr r0, _02035FA0 ; =0x021D4140
	ldr r2, [r0, #8]
	ldr r0, _02035FA4 ; =0x000006AD
	ldrb r1, [r2, r0]
	cmp r1, #3
	bne _02035F8C
	mov r4, #1
	strb r4, [r2, r0]
_02035F8C:
	cmp r4, #0
	beq _02035F94
	bl sub_02035DD8
_02035F94:
	bl sub_02037594
_02035F98:
	pop {r4, pc}
	nop
_02035F9C: .word 0x0210F900
_02035FA0: .word 0x021D4140
_02035FA4: .word 0x000006AD
	thumb_func_end sub_02035F4C

	thumb_func_start sub_02035FA8
sub_02035FA8: ; 0x02035FA8
	ldr r1, _02035FD0 ; =0x021D4140
	ldr r3, [r1, #8]
	ldr r1, _02035FD4 ; =0x000006AD
	ldrb r2, [r3, r1]
	cmp r2, #0
	bne _02035FBE
	cmp r0, #1
	bne _02035FBE
	mov r0, #3
	strb r0, [r3, r1]
	bx lr
_02035FBE:
	cmp r2, #1
	bne _02035FCC
	cmp r0, #0
	bne _02035FCC
	ldr r0, _02035FD4 ; =0x000006AD
	mov r1, #2
	strb r1, [r3, r0]
_02035FCC:
	bx lr
	nop
_02035FD0: .word 0x021D4140
_02035FD4: .word 0x000006AD
	thumb_func_end sub_02035FA8

	thumb_func_start sub_02035FD8
sub_02035FD8: ; 0x02035FD8
	ldr r3, _02035FE0 ; =sub_02035FA8
	mov r0, #1
	bx r3
	nop
_02035FE0: .word sub_02035FA8
	thumb_func_end sub_02035FD8

	thumb_func_start sub_02035FE4
sub_02035FE4: ; 0x02035FE4
	ldr r3, _02035FEC ; =sub_02035FA8
	mov r0, #0
	bx r3
	nop
_02035FEC: .word sub_02035FA8
	thumb_func_end sub_02035FE4

	thumb_func_start sub_02035FF0
sub_02035FF0: ; 0x02035FF0
	ldr r0, _02036008 ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _0203600C ; =0x000006AD
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _02036000
	mov r0, #1
	bx lr
_02036000:
	cmp r0, #3
	bne _02036006
	mov r0, #0
_02036006:
	bx lr
	.balign 4, 0
_02036008: .word 0x021D4140
_0203600C: .word 0x000006AD
	thumb_func_end sub_02035FF0

	thumb_func_start sub_02036010
sub_02036010: ; 0x02036010
	push {r3, lr}
	bl sub_02035FF0
	cmp r0, #1
	bne _0203601E
	mov r0, #1
	pop {r3, pc}
_0203601E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02036010

	thumb_func_start sub_02036024
sub_02036024: ; 0x02036024
	push {r4, lr}
	ldr r0, _020360D0 ; =0x021D4140
	mov r4, #0
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0203604E
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _02036044
	bl ov00_021E6CB8
	mov r4, #1
	b _0203604E
_02036044:
	bl sub_0203507C
	cmp r0, #0
	beq _0203604E
	mov r4, #1
_0203604E:
	cmp r4, #0
	beq _020360CE
	bl sub_020379F8
	bl sub_020343E4
	ldr r0, _020360D0 ; =0x021D4140
	mov r1, #0
	strb r1, [r0, #1]
	ldr r1, [r0, #8]
	ldr r0, _020360D4 ; =0x0000057C
	ldr r0, [r1, r0]
	bl sub_0200E390
	ldr r1, _020360D0 ; =0x021D4140
	ldr r0, _020360D4 ; =0x0000057C
	ldr r2, [r1, #8]
	mov r3, #0
	str r3, [r2, r0]
	ldr r1, [r1, #8]
	sub r0, #0xec
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, _020360D0 ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _020360D8 ; =0x00000494
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, _020360D0 ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _020360DC ; =0x0000048C
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, _020360D0 ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _020360E0 ; =0x00000488
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, _020360D0 ; =0x021D4140
	ldr r1, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r1, r0
	bl sub_02033F90
	ldr r0, _020360D0 ; =0x021D4140
	ldr r1, [r0, #8]
	mov r0, #0x16
	lsl r0, r0, #6
	add r0, r1, r0
	bl sub_02033F90
	ldr r0, _020360D0 ; =0x021D4140
	ldr r0, [r0, #4]
	bl FreeToHeap
	ldr r0, _020360D0 ; =0x021D4140
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
_020360CE:
	pop {r4, pc}
	.balign 4, 0
_020360D0: .word 0x021D4140
_020360D4: .word 0x0000057C
_020360D8: .word 0x00000494
_020360DC: .word 0x0000048C
_020360E0: .word 0x00000488
	thumb_func_end sub_02036024

	thumb_func_start sub_020360E4
sub_020360E4: ; 0x020360E4
	ldr r3, _020360E8 ; =sub_02035218
	bx r3
	.balign 4, 0
_020360E8: .word sub_02035218
	thumb_func_end sub_020360E4

	thumb_func_start sub_020360EC
sub_020360EC: ; 0x020360EC
	push {r3, lr}
	ldr r0, _02036118 ; =0x021D4140
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _02036116
	bl sub_02036AD8
	bl sub_0203769C
	cmp r0, #0
	bne _02036110
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	beq _02036110
	bl sub_02036508
_02036110:
	ldr r0, _02036118 ; =0x021D4140
	mov r1, #0
	strb r1, [r0, #1]
_02036116:
	pop {r3, pc}
	.balign 4, 0
_02036118: .word 0x021D4140
	thumb_func_end sub_020360EC

	thumb_func_start sub_0203611C
sub_0203611C: ; 0x0203611C
	push {r3, lr}
	bl sub_020357FC
	cmp r0, #0
	beq _02036140
	bl sub_0203769C
	cmp r0, #0
	bne _0203613C
	bl sub_0203567C
	cmp r0, #0
	bne _02036140
	bl sub_02036024
	pop {r3, pc}
_0203613C:
	bl sub_02036024
_02036140:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203611C

	thumb_func_start sub_02036144
sub_02036144: ; 0x02036144
	push {r4, lr}
	bl sub_0203817C
	ldr r3, _02036214 ; =0x021D4140
	ldr r0, [r3, #8]
	cmp r0, #0
	beq _020361FE
	ldr r2, _02036218 ; =0x000006B9
	ldrb r1, [r0, r2]
	cmp r1, #0
	bne _020361E0
	add r1, r2, #3
	ldrb r1, [r0, r1]
	add r4, r1, #1
	add r1, r2, #3
	strb r4, [r0, r1]
	mov r0, #0
	strb r0, [r3, #1]
	bl sub_02035F4C
	ldr r0, _02036214 ; =0x021D4140
	ldr r1, _0203621C ; =gMain
	ldr r0, [r0, #8]
	ldr r2, _02036220 ; =0x0000065C
	ldr r3, [r1, #0x44]
	ldr r1, _02036224 ; =0x00007FFF
	ldrh r4, [r0, r2]
	and r1, r3
	orr r1, r4
	strh r1, [r0, r2]
	bl sub_02036BE4
	bl sub_02036298
	ldr r0, _02036214 ; =0x021D4140
	ldr r1, _02036220 ; =0x0000065C
	ldr r3, [r0, #8]
	mov r0, #2
	ldrh r2, [r3, r1]
	lsl r0, r0, #0xe
	and r0, r2
	strh r0, [r3, r1]
	bl sub_02035FF0
	cmp r0, #0
	bne _020361A4
	bl sub_020372E4
_020361A4:
	bl sub_0203769C
	cmp r0, #0
	bne _020361C6
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	beq _020361C6
	bl sub_0203993C
	bl sub_02034084
	cmp r0, #0
	bne _020361C6
	bl sub_0203667C
_020361C6:
	bl sub_0203769C
	cmp r0, #0
	beq _020361D6
	bl sub_02035FF0
	cmp r0, #1
	bne _020361DA
_020361D6:
	bl sub_02037334
_020361DA:
	ldr r0, _02036214 ; =0x021D4140
	mov r1, #1
	strb r1, [r0, #1]
_020361E0:
	ldr r0, _02036214 ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _02036228 ; =0x00000694
	ldrh r0, [r1, r0]
	bl sub_020355C8
	bl sub_0203769C
	cmp r0, #0
	bne _020361F8
	bl sub_02035E9C
_020361F8:
	bl sub_0203611C
	b _02036204
_020361FE:
	mov r0, #0
	bl sub_020355C8
_02036204:
	mov r0, #0
	bl sub_02039A00
	bl sub_02037ADC
	mov r0, #1
	pop {r4, pc}
	nop
_02036214: .word 0x021D4140
_02036218: .word 0x000006B9
_0203621C: .word gMain
_02036220: .word 0x0000065C
_02036224: .word 0x00007FFF
_02036228: .word 0x00000694
	thumb_func_end sub_02036144

	thumb_func_start sub_0203622C
sub_0203622C: ; 0x0203622C
	push {r4, lr}
	ldr r0, _02036248 ; =0x021D4140
	mov r1, #0
	ldrb r4, [r0, #1]
	strb r1, [r0, #1]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02036240
	bl sub_02035DA4
_02036240:
	ldr r0, _02036248 ; =0x021D4140
	strb r4, [r0, #1]
	pop {r4, pc}
	nop
_02036248: .word 0x021D4140
	thumb_func_end sub_0203622C

	thumb_func_start sub_0203624C
sub_0203624C: ; 0x0203624C
	push {r4, lr}
	ldr r0, _0203626C ; =0x021D4140
	mov r1, #0
	ldrb r4, [r0, #1]
	strb r1, [r0, #1]
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _02036266
	ldr r0, _02036270 ; =0x000006AD
	mov r1, #1
	strb r1, [r2, r0]
	bl sub_02035DA4
_02036266:
	ldr r0, _0203626C ; =0x021D4140
	strb r4, [r0, #1]
	pop {r4, pc}
	.balign 4, 0
_0203626C: .word 0x021D4140
_02036270: .word 0x000006AD
	thumb_func_end sub_0203624C

	thumb_func_start sub_02036274
sub_02036274: ; 0x02036274
	push {r4, lr}
	ldr r0, _02036294 ; =0x021D4140
	mov r1, #0
	ldrb r4, [r0, #1]
	strb r1, [r0, #1]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0203628C
	bl sub_02035DA4
	bl sub_02034E2C
_0203628C:
	ldr r0, _02036294 ; =0x021D4140
	strb r4, [r0, #1]
	pop {r4, pc}
	nop
_02036294: .word 0x021D4140
	thumb_func_end sub_02036274

	thumb_func_start sub_02036298
sub_02036298: ; 0x02036298
	push {r3, r4, r5, r6, r7, lr}
	bl sub_0203993C
	bl sub_02034084
	cmp r0, #0
	beq _0203634C
	ldr r0, _02036420 ; =0x021D4140
	ldr r1, _02036424 ; =0x000006B6
	ldr r0, [r0, #8]
	ldrb r2, [r0, r1]
	cmp r2, #0
	beq _02036308
	sub r1, #0x52
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _020362DA
	bl sub_02036630
	cmp r0, #0
	beq _020362F8
	ldr r0, _02036428 ; =0x0210F900
	ldrb r0, [r0, #1]
	cmp r0, #4
	bne _020362F0
	ldr r0, _02036420 ; =0x021D4140
	ldr r0, [r0, #8]
	bl sub_02036E60
	ldr r0, _02036428 ; =0x0210F900
	mov r1, #2
	strb r1, [r0, #1]
	b _020362F0
_020362DA:
	ldr r1, _02036428 ; =0x0210F900
	ldrb r1, [r1, #1]
	cmp r1, #4
	bne _020362F0
	bl sub_02036E60
	cmp r0, #0
	beq _020362F8
	ldr r0, _02036428 ; =0x0210F900
	mov r1, #2
	strb r1, [r0, #1]
_020362F0:
	bl sub_02036FA8
	cmp r0, #0
	beq _020362FA
_020362F8:
	b _0203641C
_020362FA:
	ldr r0, _02036420 ; =0x021D4140
	mov r1, #0x26
	ldr r0, [r0, #8]
	bl ov00_021E60E8
	cmp r0, #0
	bne _0203630A
_02036308:
	b _0203641C
_0203630A:
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r6, r0, #1
	mov r4, #0
	cmp r6, #0
	ble _02036344
	ldr r7, _02036420 ; =0x021D4140
	add r5, r4, #0
_02036322:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _0203633C
	ldr r0, [r7, #8]
	ldr r1, _0203642C ; =0x0000066C
	add r0, r0, r5
	ldr r1, [r0, r1]
	add r2, r1, #1
	ldr r1, _0203642C ; =0x0000066C
	str r2, [r0, r1]
_0203633C:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _02036322
_02036344:
	ldr r0, _02036428 ; =0x0210F900
	mov r1, #4
	strb r1, [r0, #1]
	pop {r3, r4, r5, r6, r7, pc}
_0203634C:
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _020363CA
	ldr r0, _02036420 ; =0x021D4140
	ldr r2, _02036424 ; =0x000006B6
	ldr r0, [r0, #8]
	ldrb r1, [r0, r2]
	cmp r1, #0
	beq _0203641C
	add r1, r2, #0
	sub r1, #0x52
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _0203638A
	sub r2, #0x4e
	ldr r1, [r0, r2]
	cmp r1, #3
	bgt _0203641C
	ldr r1, _02036428 ; =0x0210F900
	ldrb r1, [r1, #1]
	cmp r1, #4
	bne _020363A0
	bl sub_02036E60
	ldr r0, _02036428 ; =0x0210F900
	mov r1, #2
	strb r1, [r0, #1]
	b _020363A0
_0203638A:
	ldr r1, _02036428 ; =0x0210F900
	ldrb r1, [r1, #1]
	cmp r1, #4
	bne _020363A0
	bl sub_02036E60
	cmp r0, #0
	beq _0203641C
	ldr r0, _02036428 ; =0x0210F900
	mov r1, #2
	strb r1, [r0, #1]
_020363A0:
	bl sub_02036FA8
	cmp r0, #0
	bne _0203641C
	ldr r0, _02036420 ; =0x021D4140
	mov r1, #0x26
	ldr r0, [r0, #8]
	bl ov00_021E5F84
	cmp r0, #0
	beq _0203641C
	ldr r0, _02036428 ; =0x0210F900
	mov r1, #4
	strb r1, [r0, #1]
	ldr r0, _02036420 ; =0x021D4140
	ldr r2, [r0, #8]
	ldr r0, _02036430 ; =0x00000668
	ldr r1, [r2, r0]
	add r1, r1, #1
	str r1, [r2, r0]
	pop {r3, r4, r5, r6, r7, pc}
_020363CA:
	bl sub_02033298
	cmp r0, #4
	bne _0203641C
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	beq _0203641C
	ldr r0, _02036428 ; =0x0210F900
	ldrb r0, [r0, #1]
	cmp r0, #4
	bne _02036418
	ldr r0, _02036420 ; =0x021D4140
	ldr r2, [r0, #8]
	ldr r0, _02036430 ; =0x00000668
	ldr r1, [r2, r0]
	cmp r1, #3
	bgt _02036418
	add r0, #0x47
	ldrb r0, [r2, r0]
	lsl r0, r0, #6
	add r0, r2, r0
	bl sub_02036E60
	ldr r0, _02036420 ; =0x021D4140
	ldr r2, [r0, #8]
	ldr r0, _02036434 ; =0x000006AF
	ldrb r1, [r2, r0]
	mov r0, #1
	sub r0, r0, r1
	lsl r0, r0, #6
	add r0, r2, r0
	bl sub_02036E60
	ldr r0, _02036428 ; =0x0210F900
	mov r1, #0
	strb r1, [r0, #1]
_02036418:
	bl sub_02036AD8
_0203641C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02036420: .word 0x021D4140
_02036424: .word 0x000006B6
_02036428: .word 0x0210F900
_0203642C: .word 0x0000066C
_02036430: .word 0x00000668
_02036434: .word 0x000006AF
	thumb_func_end sub_02036298

	thumb_func_start sub_02036438
sub_02036438: ; 0x02036438
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	mov r7, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203772C
	str r0, [sp, #0xc]
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r0, r0, #1
	str r0, [sp, #8]
	add r0, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	cmp r0, #0
	ble _020364F0
	ldr r0, [sp]
	ldr r6, [sp, #4]
	mov r1, #0xc0
	add r5, r0, #0
	add r4, r6, #0
	mul r5, r1
_02036474:
	ldr r0, _02036504 ; =0x021D4140
	ldr r1, [r0, #8]
	mov r0, #0x4b
	lsl r0, r0, #4
	add r0, r1, r0
	add r0, r0, r6
	bl sub_02033C28
	ldr r0, [sp, #4]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _020364A2
	ldr r0, _02036504 ; =0x021D4140
	ldr r0, [r0, #8]
	add r0, r5, r0
	add r1, r4, r0
	add r1, #0x80
	mov r0, #0xe
	strb r0, [r1]
	b _020364B4
_020364A2:
	ldr r0, _02036504 ; =0x021D4140
	add r7, r7, #1
	ldr r0, [r0, #8]
	add r0, r5, r0
	add r1, r4, r0
	add r1, #0x80
	mov r0, #0xff
	strb r0, [r1]
	b _020364DE
_020364B4:
	ldr r0, _02036504 ; =0x021D4140
	ldr r2, [sp, #0xc]
	ldr r1, [r0, #8]
	mov r0, #0x4b
	lsl r0, r0, #4
	add r0, r1, r0
	add r1, #0x80
	add r1, r1, r5
	add r0, r0, r6
	add r1, r1, r4
	bl sub_02033B4C
	ldr r0, _02036504 ; =0x021D4140
	ldr r0, [r0, #8]
	add r0, r5, r0
	add r0, r4, r0
	add r0, #0x80
	ldrb r0, [r0]
	cmp r0, #0xe
	bne _020364DE
	add r7, r7, #1
_020364DE:
	ldr r0, [sp, #0xc]
	add r6, #0xc
	add r4, r4, r0
	ldr r0, [sp, #4]
	add r1, r0, #1
	ldr r0, [sp, #8]
	str r1, [sp, #4]
	cmp r1, r0
	blt _02036474
_020364F0:
	ldr r0, [sp, #8]
	cmp r7, r0
	bne _020364FC
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020364FC:
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02036504: .word 0x021D4140
	thumb_func_end sub_02036438

	thumb_func_start sub_02036508
sub_02036508: ; 0x02036508
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02036620 ; =0x021D4140
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _02036514
	b _0203661C
_02036514:
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	bne _0203661C
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203772C
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r6, r0, #1
	ldr r0, _02036624 ; =0x0210F900
	ldrb r1, [r0]
	cmp r1, #2
	beq _02036548
	ldrb r0, [r0]
	cmp r0, #0
	bne _0203661C
_02036548:
	ldr r0, _02036624 ; =0x0210F900
	ldrb r1, [r0]
	add r1, r1, #1
	strb r1, [r0]
	bl sub_02035FF0
	cmp r0, #1
	bne _02036572
	ldr r0, _02036620 ; =0x021D4140
	ldrb r1, [r0]
	cmp r1, #0
	bne _02036572
	ldr r1, [r0, #8]
	mov r0, #0x6b
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	bl sub_02036438
	ldr r0, _02036620 ; =0x021D4140
	mov r1, #1
	strb r1, [r0]
_02036572:
	bl sub_02033298
	cmp r0, #4
	bne _020365A4
	ldr r0, _02036620 ; =0x021D4140
	ldr r1, [r0, #8]
	mov r0, #0x6b
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	add r3, r1, #0
	mov r1, #0xc0
	add r2, r0, #0
	add r3, #0x80
	mul r2, r1
	add r0, r3, r2
	ldr r3, _02036628 ; =sub_02036ABC
	mov r2, #0xe
	bl sub_02033800
	cmp r0, #0
	bne _020365A4
	ldr r0, _02036624 ; =0x0210F900
	ldrb r1, [r0]
	sub r1, r1, #1
	strb r1, [r0]
_020365A4:
	ldr r0, _02036624 ; =0x0210F900
	ldrb r1, [r0]
	cmp r1, #1
	beq _020365B2
	ldrb r0, [r0]
	cmp r0, #3
	bne _0203660C
_020365B2:
	ldr r7, _02036620 ; =0x021D4140
	mov r4, #0
	strb r4, [r7]
	cmp r6, #0
	ble _020365E0
	add r5, r4, #0
_020365BE:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _020365D8
	ldr r0, [r7, #8]
	ldr r1, _0203662C ; =0x0000066C
	add r0, r0, r5
	ldr r1, [r0, r1]
	add r2, r1, #1
	ldr r1, _0203662C ; =0x0000066C
	str r2, [r0, r1]
_020365D8:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _020365BE
_020365E0:
	ldr r0, _02036620 ; =0x021D4140
	mov r1, #0x6b
	ldr r2, [r0, #8]
	lsl r1, r1, #4
	ldrb r1, [r2, r1]
	add r4, r2, #0
	mov r2, #0xc0
	add r3, r1, #0
	add r4, #0x80
	mul r3, r2
	mov r0, #0
	add r1, r4, r3
	bl sub_020367B0
	ldr r0, _02036620 ; =0x021D4140
	mov r1, #0x6b
	ldr r3, [r0, #8]
	lsl r1, r1, #4
	ldrb r2, [r3, r1]
	mov r0, #1
	sub r0, r0, r2
	strb r0, [r3, r1]
_0203660C:
	bl sub_02033298
	cmp r0, #4
	beq _0203661C
	ldr r0, _02036624 ; =0x0210F900
	ldrb r1, [r0]
	add r1, r1, #1
	strb r1, [r0]
_0203661C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02036620: .word 0x021D4140
_02036624: .word 0x0210F900
_02036628: .word sub_02036ABC
_0203662C: .word 0x0000066C
	thumb_func_end sub_02036508

	thumb_func_start sub_02036630
sub_02036630: ; 0x02036630
	push {r3, r4, r5, r6, r7, lr}
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r6, r0, #1
	mov r4, #1
	cmp r6, #1
	ble _0203666E
	ldr r7, _02036674 ; =0x021D4140
	mov r5, #4
_0203664A:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _02036666
	ldr r0, [r7, #8]
	add r1, r0, r5
	ldr r0, _02036678 ; =0x0000066C
	ldr r0, [r1, r0]
	cmp r0, #3
	ble _02036666
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02036666:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _0203664A
_0203666E:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02036674: .word 0x021D4140
_02036678: .word 0x0000066C
	thumb_func_end sub_02036630

	thumb_func_start sub_0203667C
sub_0203667C: ; 0x0203667C
	push {r3, r4, r5, r6, r7, lr}
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r6, r0, #1
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _02036738
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	beq _02036796
	ldr r0, _02036798 ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _0203679C ; =0x00000664
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _020366D4
	bl sub_02036630
	cmp r0, #0
	beq _02036796
	ldr r0, _020367A0 ; =0x0210F900
	ldrb r0, [r0]
	cmp r0, #4
	bne _020366F4
	bl sub_02035FF0
	cmp r0, #1
	bne _020366CC
	mov r0, #0
	bl sub_02036438
_020366CC:
	ldr r0, _020367A0 ; =0x0210F900
	mov r1, #2
	strb r1, [r0]
	b _020366F4
_020366D4:
	ldr r0, _020367A0 ; =0x0210F900
	ldrb r0, [r0]
	cmp r0, #4
	bne _020366EE
	bl sub_02035FF0
	cmp r0, #1
	bne _020366EE
	mov r0, #0
	bl sub_02036438
	cmp r0, #0
	beq _02036796
_020366EE:
	ldr r0, _020367A0 ; =0x0210F900
	mov r1, #2
	strb r1, [r0]
_020366F4:
	ldr r0, _02036798 ; =0x021D4140
	mov r1, #0xc0
	ldr r0, [r0, #8]
	add r0, #0x80
	bl ov00_021E602C
	cmp r0, #0
	beq _02036796
	ldr r0, _020367A0 ; =0x0210F900
	mov r1, #4
	mov r4, #0
	strb r1, [r0]
	cmp r6, #0
	ble _02036796
	ldr r7, _02036798 ; =0x021D4140
	add r5, r4, #0
_02036714:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _0203672E
	ldr r0, [r7, #8]
	ldr r1, _020367A4 ; =0x0000066C
	add r0, r0, r5
	ldr r1, [r0, r1]
	add r2, r1, #1
	ldr r1, _020367A4 ; =0x0000066C
	str r2, [r0, r1]
_0203672E:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _02036714
	pop {r3, r4, r5, r6, r7, pc}
_02036738:
	bl sub_02033298
	cmp r0, #4
	bne _02036796
	ldr r0, _020367A0 ; =0x0210F900
	ldrb r0, [r0]
	cmp r0, #4
	bne _02036796
	bl sub_02036630
	cmp r0, #0
	beq _02036796
	bl sub_02035FF0
	cmp r0, #0
	bne _0203678C
	ldr r0, _02036798 ; =0x021D4140
	ldr r1, [r0, #8]
	mov r0, #0x6b
	add r2, r1, #0
	lsl r0, r0, #4
	ldrb r1, [r1, r0]
	mov r0, #0xc0
	add r2, #0x80
	mul r0, r1
	add r0, r2, r0
	bl sub_02036F30
	ldr r0, _02036798 ; =0x021D4140
	ldr r1, [r0, #8]
	mov r0, #0x6b
	add r2, r1, #0
	lsl r0, r0, #4
	ldrb r1, [r1, r0]
	mov r0, #1
	add r2, #0x80
	sub r1, r0, r1
	mov r0, #0xc0
	mul r0, r1
	add r0, r2, r0
	bl sub_02036F30
_0203678C:
	ldr r0, _020367A0 ; =0x0210F900
	mov r1, #0
	strb r1, [r0]
	bl sub_02036508
_02036796:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02036798: .word 0x021D4140
_0203679C: .word 0x00000664
_020367A0: .word 0x0210F900
_020367A4: .word 0x0000066C
	thumb_func_end sub_0203667C

	thumb_func_start sub_020367A8
sub_020367A8: ; 0x020367A8
	ldr r3, _020367AC ; =sub_020367B0
	bx r3
	.balign 4, 0
_020367AC: .word sub_020367B0
	thumb_func_end sub_020367A8

	thumb_func_start sub_020367B0
sub_020367B0: ; 0x020367B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _020368E4 ; =0x021D4140
	add r5, r1, #0
	ldr r2, [r0, #8]
	ldr r0, _020368E8 ; =0x00000668
	ldr r1, [r2, r0]
	sub r1, r1, #1
	str r1, [r2, r0]
	cmp r5, #0
	beq _020367D4
	ldrb r0, [r5]
	cmp r0, #0xb
	bne _020367DA
	bl sub_02035FF0
	cmp r0, #1
	bne _020367D6
_020367D4:
	b _020368E0
_020367D6:
	add r5, r5, #1
	b _020367E2
_020367DA:
	bl sub_02035FF0
	cmp r0, #0
	beq _020368E0
_020367E2:
	ldr r0, _020368E4 ; =0x021D4140
	ldr r1, _020368EC ; =0x000006B2
	ldr r0, [r0, #8]
	ldrb r1, [r0, r1]
	cmp r1, #0
	beq _020367F6
	ldrb r2, [r5]
	mov r1, #1
	tst r1, r2
	bne _020368E0
_020367F6:
	ldr r1, _020368EC ; =0x000006B2
	mov r2, #0
	strb r2, [r0, r1]
	bl sub_02035FF0
	cmp r0, #1
	bne _020368B4
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203772C
	add r6, r0, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r0, r0, #1
	mov r4, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _020368E0
	sub r0, r6, #1
	add r7, r4, #0
	str r0, [sp]
_0203682E:
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _02036846
	ldr r0, _020368E4 ; =0x021D4140
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _020368F0 ; =0x00000694
	lsl r2, r4
	ldrh r0, [r1, r0]
	mvn r2, r2
	and r2, r0
	b _02036854
_02036846:
	ldr r0, _020368E4 ; =0x021D4140
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _020368F0 ; =0x00000694
	lsl r2, r4
	ldrh r0, [r1, r0]
	orr r2, r0
_02036854:
	ldr r0, _020368F0 ; =0x00000694
	strh r2, [r1, r0]
	ldrb r2, [r5]
	cmp r2, #0xff
	bne _02036862
	add r5, r5, r6
	b _020368A6
_02036862:
	cmp r2, #0xe
	bne _0203686A
	add r5, r5, r6
	b _020368A6
_0203686A:
	ldr r0, _020368E4 ; =0x021D4140
	ldr r3, [r0, #8]
	ldr r0, _020368F4 ; =0x0000069E
	add r1, r3, r4
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02036882
	mov r0, #1
	tst r0, r2
	beq _02036882
	add r5, r5, r6
	b _020368A6
_02036882:
	ldr r0, _020368F8 ; =0x0000051C
	add r5, r5, #1
	add r0, r3, r0
	ldr r3, _020368FC ; =0x0000054C
	ldr r2, [sp]
	add r0, r0, r7
	add r1, r5, #0
	add r3, r4, r3
	bl sub_02033AF0
	ldr r0, [sp]
	mov r1, #0
	add r5, r5, r0
	ldr r0, _020368E4 ; =0x021D4140
	ldr r0, [r0, #8]
	add r2, r0, r4
	ldr r0, _020368F4 ; =0x0000069E
	strb r1, [r2, r0]
_020368A6:
	ldr r0, [sp, #4]
	add r4, r4, #1
	add r7, #0xc
	cmp r4, r0
	blt _0203682E
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_020368B4:
	ldr r1, _020368E4 ; =0x021D4140
	ldrb r3, [r5, #1]
	ldr r2, [r1, #8]
	ldr r0, _020368F0 ; =0x00000694
	strh r3, [r2, r0]
	ldr r3, [r1, #8]
	ldrh r2, [r3, r0]
	lsl r2, r2, #8
	strh r2, [r3, r0]
	ldr r4, [r1, #8]
	ldrb r2, [r5, #2]
	ldrh r3, [r4, r0]
	add r2, r3, r2
	strh r2, [r4, r0]
	ldr r0, [r1, #8]
	ldr r3, _02036900 ; =0x000004A4
	ldrb r2, [r5, #3]
	add r0, r0, r3
	add r1, r5, #4
	add r3, #0xbc
	bl sub_02033AF0
_020368E0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020368E4: .word 0x021D4140
_020368E8: .word 0x00000668
_020368EC: .word 0x000006B2
_020368F0: .word 0x00000694
_020368F4: .word 0x0000069E
_020368F8: .word 0x0000051C
_020368FC: .word 0x0000054C
_02036900: .word 0x000004A4
	thumb_func_end sub_020367B0

	thumb_func_start sub_02036904
sub_02036904: ; 0x02036904
	ldr r3, _02036908 ; =sub_0203690C
	bx r3
	.balign 4, 0
_02036908: .word sub_0203690C
	thumb_func_end sub_02036904

	thumb_func_start sub_0203690C
sub_0203690C: ; 0x0203690C
	push {r4, r5, r6, lr}
	ldr r3, _020369BC ; =0x021D4140
	add r5, r0, #0
	ldr r0, [r3, #8]
	ldr r2, _020369C0 ; =0x0000066C
	add r4, r1, #0
	add r1, r0, r2
	lsl r0, r5, #2
	ldr r6, [r1, r0]
	sub r6, r6, #1
	str r6, [r1, r0]
	cmp r4, #0
	beq _020369BA
	ldr r0, [r3, #8]
	add r2, #0x32
	add r0, r0, r2
	ldrb r1, [r0, r5]
	cmp r1, #0
	beq _0203693A
	ldrb r2, [r4]
	mov r1, #1
	tst r1, r2
	bne _020369BA
_0203693A:
	mov r1, #0
	strb r1, [r0, r5]
	bl sub_02035FF0
	cmp r0, #1
	bne _02036992
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203772C
	add r6, r0, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	ldrb r1, [r4]
	mov r0, #2
	tst r0, r1
	bne _02036982
	ldr r0, _020369BC ; =0x021D4140
	mov r3, #0x4b
	ldr r0, [r0, #8]
	lsl r3, r3, #4
	add r1, r0, r3
	mov r0, #0xc
	mul r0, r5
	add r0, r1, r0
	add r1, r4, #0
	add r2, r6, #0
	add r3, #0xf5
	bl sub_02033AF0
_02036982:
	ldr r0, _020369BC ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _020369C4 ; =0x00000696
	add r1, r1, r0
	ldrb r0, [r1, r5]
	add r0, r0, #1
	strb r0, [r1, r5]
	pop {r4, r5, r6, pc}
_02036992:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02036D14
	ldrb r1, [r4]
	mov r0, #2
	tst r0, r1
	bne _020369BA
	ldr r0, _020369BC ; =0x021D4140
	ldr r3, _020369C8 ; =0x0000051C
	ldr r0, [r0, #8]
	mov r2, #0xb
	add r1, r0, r3
	mov r0, #0xc
	mul r0, r5
	add r0, r1, r0
	add r1, r4, #1
	add r3, #0x92
	bl sub_02033AF0
_020369BA:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020369BC: .word 0x021D4140
_020369C0: .word 0x0000066C
_020369C4: .word 0x00000696
_020369C8: .word 0x0000051C
	thumb_func_end sub_0203690C

	thumb_func_start sub_020369CC
sub_020369CC: ; 0x020369CC
	push {r4, r5, r6, lr}
	ldr r3, _02036A8C ; =0x021D4140
	add r5, r0, #0
	ldr r0, [r3, #8]
	ldr r2, _02036A90 ; =0x0000066C
	add r4, r1, #0
	add r1, r0, r2
	lsl r0, r5, #2
	ldr r6, [r1, r0]
	sub r6, r6, #1
	str r6, [r1, r0]
	cmp r4, #0
	beq _02036A88
	ldr r0, [r3, #8]
	add r2, #0x32
	add r0, r0, r2
	ldrb r1, [r0, r5]
	cmp r1, #0
	beq _020369FA
	ldrb r2, [r4]
	mov r1, #1
	tst r1, r2
	bne _02036A88
_020369FA:
	mov r1, #0
	strb r1, [r0, r5]
	bl sub_02035FF0
	cmp r0, #1
	bne _02036A88
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203772C
	add r6, r0, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	ldrb r0, [r4]
	ldr r2, _02036A94 ; =0x00000694
	cmp r0, #0xff
	bne _02036A38
	ldr r0, _02036A8C ; =0x021D4140
	mov r3, #1
	ldr r1, [r0, #8]
	lsl r3, r5
	ldrh r0, [r1, r2]
	mvn r3, r3
	and r0, r3
	b _02036A44
_02036A38:
	ldr r0, _02036A8C ; =0x021D4140
	mov r3, #1
	ldr r1, [r0, #8]
	lsl r3, r5
	ldrh r0, [r1, r2]
	orr r0, r3
_02036A44:
	strh r0, [r1, r2]
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _02036A88
	cmp r0, #2
	beq _02036A88
	cmp r0, #0xe
	beq _02036A88
	ldr r1, _02036A8C ; =0x021D4140
	ldr r2, _02036A98 ; =0x0000069E
	ldr r1, [r1, #8]
	add r3, r1, r5
	ldrb r2, [r3, r2]
	cmp r2, #0
	beq _02036A68
	mov r2, #1
	tst r0, r2
	bne _02036A88
_02036A68:
	ldr r3, _02036A9C ; =0x0000051C
	mov r0, #0xc
	add r1, r1, r3
	mul r0, r5
	add r0, r1, r0
	add r1, r4, #1
	sub r2, r6, #1
	add r3, #0xcb
	bl sub_02033AF0
	ldr r0, _02036A8C ; =0x021D4140
	mov r2, #0
	ldr r0, [r0, #8]
	add r1, r0, r5
	ldr r0, _02036A98 ; =0x0000069E
	strb r2, [r1, r0]
_02036A88:
	pop {r4, r5, r6, pc}
	nop
_02036A8C: .word 0x021D4140
_02036A90: .word 0x0000066C
_02036A94: .word 0x00000694
_02036A98: .word 0x0000069E
_02036A9C: .word 0x0000051C
	thumb_func_end sub_020369CC

	thumb_func_start sub_02036AA0
sub_02036AA0: ; 0x02036AA0
	push {r3, lr}
	cmp r0, #0
	beq _02036AB0
	ldr r0, _02036AB8 ; =0x0210F900
	ldrb r1, [r0, #1]
	add r1, r1, #1
	strb r1, [r0, #1]
	pop {r3, pc}
_02036AB0:
	bl GF_AssertFail
	pop {r3, pc}
	nop
_02036AB8: .word 0x0210F900
	thumb_func_end sub_02036AA0

	thumb_func_start sub_02036ABC
sub_02036ABC: ; 0x02036ABC
	push {r3, lr}
	cmp r0, #0
	beq _02036ACC
	ldr r0, _02036AD4 ; =0x0210F900
	ldrb r1, [r0]
	add r1, r1, #1
	strb r1, [r0]
	pop {r3, pc}
_02036ACC:
	bl GF_AssertFail
	pop {r3, pc}
	nop
_02036AD4: .word 0x0210F900
	thumb_func_end sub_02036ABC

	thumb_func_start sub_02036AD8
sub_02036AD8: ; 0x02036AD8
	push {r4, lr}
	ldr r0, _02036BD0 ; =0x021D4140
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02036BCE
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	bne _02036BCE
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203772C
	add r4, r0, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	bl sub_02033298
	cmp r0, #4
	bne _02036BCE
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	bne _02036B22
	bl sub_0203769C
	pop {r4, pc}
_02036B22:
	ldr r0, _02036BD4 ; =0x0210F900
	ldrb r1, [r0, #1]
	cmp r1, #2
	beq _02036B30
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _02036BCE
_02036B30:
	bl sub_0203769C
	cmp r0, #0
	beq _02036B84
	ldr r0, _02036BD4 ; =0x0210F900
	ldr r3, _02036BD8 ; =sub_02036AA0
	ldrb r1, [r0, #1]
	mov r2, #0xe
	add r1, r1, #1
	strb r1, [r0, #1]
	ldr r0, _02036BD0 ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _02036BDC ; =0x000006AF
	ldrb r0, [r1, r0]
	lsl r0, r0, #6
	add r0, r1, r0
	lsl r1, r4, #0x10
	lsr r1, r1, #0x10
	bl sub_02033800
	cmp r0, #0
	bne _02036B66
	ldr r0, _02036BD4 ; =0x0210F900
	ldrb r1, [r0, #1]
	sub r1, r1, #1
	strb r1, [r0, #1]
	pop {r4, pc}
_02036B66:
	ldr r2, _02036BD0 ; =0x021D4140
	ldr r1, _02036BDC ; =0x000006AF
	ldr r4, [r2, #8]
	mov r0, #1
	ldrb r3, [r4, r1]
	sub r0, r0, r3
	strb r0, [r4, r1]
	add r0, r1, #0
	ldr r2, [r2, #8]
	sub r0, #0x47
	ldr r0, [r2, r0]
	sub r1, #0x47
	add r0, r0, #1
	str r0, [r2, r1]
	pop {r4, pc}
_02036B84:
	bl sub_02033250
	ldr r1, _02036BE0 ; =0x0000FFFE
	tst r0, r1
	beq _02036BCE
	ldr r0, _02036BD4 ; =0x0210F900
	ldrb r1, [r0, #1]
	add r1, r1, #1
	strb r1, [r0, #1]
	mov r0, #1
	bl sub_02036AA0
	ldr r0, _02036BD0 ; =0x021D4140
	ldr r1, _02036BDC ; =0x000006AF
	ldr r2, [r0, #8]
	mov r0, #0
	ldrb r1, [r2, r1]
	lsl r1, r1, #6
	add r1, r2, r1
	lsl r2, r4, #0x10
	lsr r2, r2, #0x10
	bl sub_0203690C
	ldr r2, _02036BD0 ; =0x021D4140
	ldr r1, _02036BDC ; =0x000006AF
	ldr r4, [r2, #8]
	mov r0, #1
	ldrb r3, [r4, r1]
	sub r0, r0, r3
	strb r0, [r4, r1]
	add r0, r1, #0
	ldr r2, [r2, #8]
	sub r0, #0x47
	ldr r0, [r2, r0]
	sub r1, #0x47
	add r0, r0, #1
	str r0, [r2, r1]
_02036BCE:
	pop {r4, pc}
	.balign 4, 0
_02036BD0: .word 0x021D4140
_02036BD4: .word 0x0210F900
_02036BD8: .word sub_02036AA0
_02036BDC: .word 0x000006AF
_02036BE0: .word 0x0000FFFE
	thumb_func_end sub_02036AD8

	thumb_func_start sub_02036BE4
sub_02036BE4: ; 0x02036BE4
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02036D08 ; =0x021D4140
	mov r2, #0x66
	ldr r5, [r7, #8]
	lsl r2, r2, #4
	ldrb r0, [r5, r2]
	mov r6, #0
	add r4, r6, #0
	cmp r0, #0
	beq _02036C02
	sub r1, r2, #4
	ldrh r1, [r5, r1]
	mov r3, #0xf0
	tst r3, r1
	bne _02036C04
_02036C02:
	b _02036D06
_02036C04:
	cmp r0, #2
	bne _02036C42
	mov r0, #0x20
	tst r0, r1
	beq _02036C16
	mov r0, #0x10
	orr r0, r6
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02036C16:
	mov r0, #0x10
	tst r0, r1
	beq _02036C24
	mov r0, #0x20
	orr r0, r4
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02036C24:
	mov r0, #0x40
	tst r0, r1
	beq _02036C32
	mov r0, #0x80
	orr r0, r4
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02036C32:
	mov r0, #0x80
	tst r0, r1
	beq _02036CF0
	mov r0, #0x40
	orr r0, r4
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	b _02036CF0
_02036C42:
	add r0, r2, #2
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _02036C64
	add r4, r0, #0
	add r0, r2, #1
	ldrsb r0, [r5, r0]
	sub r1, r0, #1
	add r0, r2, #1
	strb r1, [r5, r0]
	ldr r1, [r7, #8]
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _02036CF0
	add r0, r2, #2
	strh r6, [r1, r0]
	b _02036CF0
_02036C64:
	add r0, r2, #0
	sub r0, #0x34
	add r6, r5, r0
	sub r2, #0x34
	ldr r0, [r6, #8]
	ldr r1, [r6, #0xc]
	ldr r2, [r5, r2]
	ldr r3, [r6, #4]
	bl _ll_mul
	add r3, r0, #0
	add r2, r1, #0
	ldr r0, [r6, #0x10]
	ldr r1, [r6, #0x14]
	add r0, r0, r3
	adc r1, r2
	ldr r2, _02036D0C ; =0x0000062C
	str r0, [r5, r2]
	mov r2, #0
	str r1, [r6, #4]
	lsr r0, r1, #0x1e
	lsl r1, r2, #2
	orr r1, r0
	cmp r1, #3
	bhi _02036CB8
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02036CA2: ; jump table
	.short _02036CAA - _02036CA2 - 2 ; case 0
	.short _02036CAE - _02036CA2 - 2 ; case 1
	.short _02036CB2 - _02036CA2 - 2 ; case 2
	.short _02036CB6 - _02036CA2 - 2 ; case 3
_02036CAA:
	mov r4, #0x20
	b _02036CB8
_02036CAE:
	mov r4, #0x10
	b _02036CB8
_02036CB2:
	mov r4, #0x40
	b _02036CB8
_02036CB6:
	mov r4, #0x80
_02036CB8:
	ldr r0, _02036D08 ; =0x021D4140
	ldr r5, [r0, #8]
	ldr r0, _02036D0C ; =0x0000062C
	add r6, r5, r0
	ldr r0, [r6, #8]
	ldr r1, [r6, #0xc]
	ldr r2, [r6]
	ldr r3, [r6, #4]
	bl _ll_mul
	ldr r3, [r6, #0x10]
	ldr r2, [r6, #0x14]
	add r0, r3, r0
	adc r2, r1
	ldr r1, _02036D0C ; =0x0000062C
	mov r3, #0
	str r0, [r5, r1]
	str r2, [r6, #4]
	lsr r0, r2, #0x1c
	lsl r2, r3, #4
	orr r2, r0
	add r0, r1, #0
	add r0, #0x35
	strb r2, [r5, r0]
	ldr r0, _02036D08 ; =0x021D4140
	add r1, #0x36
	ldr r0, [r0, #8]
	strh r4, [r0, r1]
_02036CF0:
	ldr r2, _02036D08 ; =0x021D4140
	ldr r1, _02036D10 ; =0x0000065C
	ldr r5, [r2, #8]
	mov r0, #0xf0
	ldrh r3, [r5, r1]
	bic r3, r0
	strh r3, [r5, r1]
	ldr r2, [r2, #8]
	ldrh r0, [r2, r1]
	add r0, r0, r4
	strh r0, [r2, r1]
_02036D06:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02036D08: .word 0x021D4140
_02036D0C: .word 0x0000062C
_02036D10: .word 0x0000065C
	thumb_func_end sub_02036BE4

	thumb_func_start sub_02036D14
sub_02036D14: ; 0x02036D14
	push {r4, r5, r6, r7}
	ldr r4, _02036D94 ; =0x021D4140
	lsl r6, r1, #1
	ldr r2, [r4, #8]
	mov r5, #0
	add r3, r2, r6
	ldr r2, _02036D98 ; =0x00000644
	strh r5, [r3, r2]
	ldrb r5, [r0]
	mov r3, #0x10
	add r7, r5, #0
	and r7, r3
	cmp r7, #0x10
	bne _02036D8C
	mov r7, #0xc
	and r5, r7
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	bne _02036D48
	ldr r3, [r4, #8]
	add r4, r3, r2
	ldrh r3, [r4, r6]
	mov r2, #0x40
	orr r2, r3
	strh r2, [r4, r6]
	b _02036D7A
_02036D48:
	cmp r5, #4
	bne _02036D5A
	ldr r3, [r4, #8]
	add r4, r3, r2
	ldrh r3, [r4, r6]
	mov r2, #0x80
	orr r2, r3
	strh r2, [r4, r6]
	b _02036D7A
_02036D5A:
	cmp r5, #8
	bne _02036D6C
	ldr r3, [r4, #8]
	add r4, r3, r2
	ldrh r3, [r4, r6]
	mov r2, #0x20
	orr r2, r3
	strh r2, [r4, r6]
	b _02036D7A
_02036D6C:
	cmp r5, #0xc
	bne _02036D7A
	ldr r4, [r4, #8]
	add r4, r4, r2
	ldrh r2, [r4, r6]
	orr r2, r3
	strh r2, [r4, r6]
_02036D7A:
	ldrb r0, [r0]
	asr r2, r0, #5
	mov r0, #7
	and r2, r0
	ldr r0, _02036D94 ; =0x021D4140
	ldr r0, [r0, #8]
	add r1, r0, r1
	ldr r0, _02036D9C ; =0x00000654
	strb r2, [r1, r0]
_02036D8C:
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
	nop
_02036D94: .word 0x021D4140
_02036D98: .word 0x00000644
_02036D9C: .word 0x00000654
	thumb_func_end sub_02036D14

	thumb_func_start sub_02036DA0
sub_02036DA0: ; 0x02036DA0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02036E4C ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _02036E50 ; =0x0000065E
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02036DB4
	mov r0, #0
	pop {r4, pc}
_02036DB4:
	bl sub_0203751C
	cmp r0, #0
	bne _02036DC0
	mov r0, #0
	pop {r4, pc}
_02036DC0:
	ldr r0, _02036E4C ; =0x021D4140
	ldr r2, [r0, #8]
	ldr r0, _02036E54 ; =0x000006B1
	ldrb r1, [r2, r0]
	cmp r1, #0
	beq _02036DD0
	sub r1, r1, #1
	strb r1, [r2, r0]
_02036DD0:
	ldr r1, _02036E4C ; =0x021D4140
	ldr r0, _02036E58 ; =0x0000065C
	ldr r2, [r1, #8]
	mov r3, #0x40
	ldrh r2, [r2, r0]
	tst r3, r2
	beq _02036DF0
	ldrb r3, [r4]
	mov r2, #0x10
	add r0, #0x55
	orr r2, r3
	strb r2, [r4]
	ldr r1, [r1, #8]
	mov r2, #8
	strb r2, [r1, r0]
	b _02036E36
_02036DF0:
	mov r3, #0x80
	tst r3, r2
	beq _02036E08
	ldrb r3, [r4]
	mov r2, #0x14
	add r0, #0x55
	orr r2, r3
	strb r2, [r4]
	ldr r1, [r1, #8]
	mov r2, #8
	strb r2, [r1, r0]
	b _02036E36
_02036E08:
	mov r3, #0x20
	tst r3, r2
	beq _02036E20
	ldrb r3, [r4]
	mov r2, #0x18
	add r0, #0x55
	orr r2, r3
	strb r2, [r4]
	ldr r1, [r1, #8]
	mov r2, #8
	strb r2, [r1, r0]
	b _02036E36
_02036E20:
	mov r3, #0x10
	tst r2, r3
	beq _02036E36
	ldrb r3, [r4]
	mov r2, #0x1c
	add r0, #0x55
	orr r2, r3
	strb r2, [r4]
	ldr r1, [r1, #8]
	mov r2, #8
	strb r2, [r1, r0]
_02036E36:
	ldr r0, _02036E4C ; =0x021D4140
	ldrb r2, [r4]
	ldr r1, [r0, #8]
	ldr r0, _02036E5C ; =0x0000065F
	ldrb r0, [r1, r0]
	lsl r0, r0, #5
	orr r0, r2
	strb r0, [r4]
	mov r0, #0
	pop {r4, pc}
	nop
_02036E4C: .word 0x021D4140
_02036E50: .word 0x0000065E
_02036E54: .word 0x000006B1
_02036E58: .word 0x0000065C
_02036E5C: .word 0x0000065F
	thumb_func_end sub_02036DA0

	thumb_func_start sub_02036E60
sub_02036E60: ; 0x02036E60
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203772C
	add r5, r0, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	ldr r0, _02036F24 ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _02036F28 ; =0x000006B4
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02036E90
	mov r0, #0
	b _02036E92
_02036E90:
	mov r0, #1
_02036E92:
	strb r0, [r4]
	bl sub_02035FF0
	cmp r0, #0
	bne _02036EA2
	add r0, r4, #0
	bl sub_02036DA0
_02036EA2:
	ldr r1, _02036F24 ; =0x021D4140
	ldr r0, _02036F28 ; =0x000006B4
	ldr r2, [r1, #8]
	mov r3, #0
	strb r3, [r2, r0]
	mov r0, #0x16
	ldr r1, [r1, #8]
	lsl r0, r0, #6
	add r0, r1, r0
	bl sub_02033C50
	cmp r0, #0
	beq _02036ED0
	ldrb r1, [r4]
	mov r0, #2
	orr r0, r1
	strb r0, [r4]
	ldrb r0, [r4]
	cmp r0, #2
	bne _02036F1C
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_02036ED0:
	sub r0, r5, #1
	str r0, [sp, #4]
	add r0, r4, #1
	str r0, [sp]
	ldr r0, _02036F24 ; =0x021D4140
	mov r2, #1
	ldr r1, [r0, #8]
	mov r0, #0x16
	lsl r0, r0, #6
	add r0, r1, r0
	add r1, sp, #0
	bl sub_02033ECC
	cmp r0, #0
	bne _02036EF8
	ldr r0, _02036F24 ; =0x021D4140
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02036F28 ; =0x000006B4
	strb r2, [r1, r0]
_02036EF8:
	bl sub_02035FF0
	cmp r0, #1
	bne _02036F1C
	ldr r2, _02036F24 ; =0x021D4140
	ldr r1, _02036F2C ; =0x000006AA
	ldr r3, [r2, #8]
	ldrb r0, [r3, r1]
	add r0, r0, #1
	strb r0, [r3, r1]
	ldr r2, [r2, #8]
	ldrb r0, [r4]
	ldrb r1, [r2, r1]
	lsl r2, r1, #4
	mov r1, #0xf0
	and r1, r2
	orr r0, r1
	strb r0, [r4]
_02036F1C:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02036F24: .word 0x021D4140
_02036F28: .word 0x000006B4
_02036F2C: .word 0x000006AA
	thumb_func_end sub_02036E60

	thumb_func_start sub_02036F30
sub_02036F30: ; 0x02036F30
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0xb
	strb r0, [r4]
	ldr r0, _02036FA0 ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _02036FA4 ; =0x000006B5
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02036F4A
	mov r0, #0
	b _02036F4C
_02036F4A:
	mov r0, #1
_02036F4C:
	strb r0, [r4, #1]
	bl sub_02033250
	asr r1, r0, #8
	strb r1, [r4, #2]
	strb r0, [r4, #3]
	mov r0, #0xbb
	str r0, [sp, #4]
	add r0, r4, #5
	str r0, [sp]
	ldr r0, _02036FA0 ; =0x021D4140
	mov r2, #0
	ldr r1, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r1, r0
	add r1, sp, #0
	bl sub_02033ECC
	cmp r0, #0
	beq _02036F8C
	ldr r0, _02036FA0 ; =0x021D4140
	mov r2, #0
	ldr r1, [r0, #8]
	ldr r0, _02036FA4 ; =0x000006B5
	strb r2, [r1, r0]
	ldr r1, [sp, #4]
	mov r0, #0xbb
	sub r0, r0, r1
	add sp, #8
	strb r0, [r4, #4]
	pop {r4, pc}
_02036F8C:
	ldr r0, _02036FA0 ; =0x021D4140
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02036FA4 ; =0x000006B5
	strb r2, [r1, r0]
	mov r0, #0xbb
	strb r0, [r4, #4]
	add sp, #8
	pop {r4, pc}
	nop
_02036FA0: .word 0x021D4140
_02036FA4: .word 0x000006B5
	thumb_func_end sub_02036F30

	thumb_func_start sub_02036FA8
sub_02036FA8: ; 0x02036FA8
	push {r3, lr}
	ldr r0, _02036FD0 ; =0x021D4140
	ldr r2, [r0, #8]
	ldr r0, _02036FD4 ; =0x000006BB
	ldrb r1, [r2, r0]
	cmp r1, #0
	bne _02036FBA
	mov r0, #0
	pop {r3, pc}
_02036FBA:
	add r0, r0, #1
	ldrb r0, [r2, r0]
	bl _s32_div_f
	cmp r1, #0
	bne _02036FCA
	mov r0, #1
	pop {r3, pc}
_02036FCA:
	mov r0, #0
	pop {r3, pc}
	nop
_02036FD0: .word 0x021D4140
_02036FD4: .word 0x000006BB
	thumb_func_end sub_02036FA8

	thumb_func_start sub_02036FD8
sub_02036FD8: ; 0x02036FD8
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	bne _02036FF4
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_02036FF4:
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _0203702C ; =0x021D4140
	add r2, r4, #0
	ldr r1, [r0, #8]
	mov r0, #0x16
	lsl r0, r0, #6
	add r0, r1, r0
	add r1, r5, #0
	add r3, r6, #0
	bl sub_02033DF0
	cmp r0, #0
	beq _0203701A
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0203701A:
	bl sub_0203993C
	cmp r0, #0xa
	bne _02037026
	bl sub_02037974
_02037026:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203702C: .word 0x021D4140
	thumb_func_end sub_02036FD8

	thumb_func_start sub_02037030
sub_02037030: ; 0x02037030
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	bne _0203704C
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0203704C:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02037084 ; =0x021D4140
	add r2, r4, #0
	ldr r1, [r0, #8]
	mov r0, #0x16
	lsl r0, r0, #6
	add r0, r1, r0
	add r1, r5, #0
	add r3, r6, #0
	bl sub_02033DF0
	cmp r0, #0
	beq _02037070
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02037070:
	bl sub_0203993C
	cmp r0, #0xa
	bne _0203707C
	bl sub_02037974
_0203707C:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02037084: .word 0x021D4140
	thumb_func_end sub_02037030

	thumb_func_start sub_02037088
sub_02037088: ; 0x02037088
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0203769C
	cmp r0, #0
	beq _020370A4
	bl GF_AssertFail
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_020370A4:
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	bne _020370B4
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_020370B4:
	bl sub_02035FF0
	cmp r0, #1
	bne _020370CA
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02036FD8
	add sp, #8
	pop {r4, r5, r6, pc}
_020370CA:
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _02037104 ; =0x021D4140
	add r2, r4, #0
	ldr r1, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r1, r0
	add r1, r5, #0
	add r3, r6, #0
	bl sub_02033DF0
	cmp r0, #0
	beq _020370F0
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_020370F0:
	bl sub_0203993C
	cmp r0, #0xa
	bne _020370FC
	bl sub_02037974
_020370FC:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02037104: .word 0x021D4140
	thumb_func_end sub_02037088

	thumb_func_start sub_02037108
sub_02037108: ; 0x02037108
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0203769C
	cmp r0, #0
	beq _02037124
	bl sub_02037974
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_02037124:
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	bne _02037134
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_02037134:
	bl sub_02035FF0
	cmp r0, #1
	bne _0203714A
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02037030
	add sp, #8
	pop {r4, r5, r6, pc}
_0203714A:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02037180 ; =0x021D4140
	add r2, r4, #0
	ldr r1, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r1, r0
	add r1, r5, #0
	add r3, r6, #0
	bl sub_02033DF0
	cmp r0, #0
	beq _0203716E
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0203716E:
	bl sub_0203993C
	cmp r0, #0xa
	bne _0203717A
	bl sub_02037974
_0203717A:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02037180: .word 0x021D4140
	thumb_func_end sub_02037108

	thumb_func_start sub_02037184
sub_02037184: ; 0x02037184
	ldr r3, _0203718C ; =sub_02037108
	mov r2, #0
	bx r3
	nop
_0203718C: .word sub_02037108
	thumb_func_end sub_02037184

	thumb_func_start sub_02037190
sub_02037190: ; 0x02037190
	ldr r0, _0203719C ; =0x021D4140
	ldr r3, _020371A0 ; =sub_02033BE4
	ldr r1, [r0, #8]
	ldr r0, _020371A4 ; =0x00000498
	add r0, r1, r0
	bx r3
	.balign 4, 0
_0203719C: .word 0x021D4140
_020371A0: .word sub_02033BE4
_020371A4: .word 0x00000498
	thumb_func_end sub_02037190

	thumb_func_start sub_020371A8
sub_020371A8: ; 0x020371A8
	push {r4, lr}
	ldr r4, [sp, #8]
	bl sub_02034170
	mov r0, #0xee
	strb r0, [r4, #0xa]
	ldr r0, _020371C0 ; =0x0000FFFF
	strh r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_020371C0: .word 0x0000FFFF
	thumb_func_end sub_020371A8

	thumb_func_start sub_020371C4
sub_020371C4: ; 0x020371C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	add r4, r3, #0
	bl sub_02033BC4
	cmp r0, #0
	beq _020372D4
_020371D8:
	ldrb r7, [r4, #0xa]
	cmp r7, #0xee
	bne _020371EA
	add r0, r5, #0
	bl sub_02033B68
	add r7, r0, #0
	cmp r7, #0xee
	beq _020372CA
_020371EA:
	mov r0, #4
	ldrsh r0, [r5, r0]
	strb r7, [r4, #0xa]
	ldrh r6, [r4, #8]
	str r0, [sp, #0x10]
	ldr r0, _020372D8 ; =0x0000FFFF
	cmp r6, r0
	bne _0203723E
	add r0, r7, #0
	bl sub_020341DC
	add r6, r0, #0
	ldr r0, _020372DC ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _020372E0 ; =0x000006B8
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _020372D4
	ldr r0, _020372D8 ; =0x0000FFFF
	cmp r6, r0
	bne _0203723C
	add r0, r5, #0
	bl sub_02033BC4
	cmp r0, #1
	bge _02037226
	ldr r0, [sp, #0x10]
	add sp, #0x14
	strh r0, [r5, #4]
	pop {r4, r5, r6, r7, pc}
_02037226:
	add r0, r5, #0
	bl sub_02033B68
	lsl r6, r0, #8
	add r0, r5, #0
	bl sub_02033B68
	add r6, r6, r0
	mov r0, #4
	ldrsh r0, [r5, r0]
	str r0, [sp, #0x10]
_0203723C:
	strh r6, [r4, #8]
_0203723E:
	add r0, r7, #0
	bl sub_02034244
	cmp r0, #0
	beq _0203729A
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0203725A
	ldrh r2, [r4, #8]
	ldr r1, [sp, #4]
	add r0, r7, #0
	bl sub_02034280
	str r0, [r4, #4]
_0203725A:
	ldr r2, [r4]
	ldr r1, [sp, #8]
	add r0, r5, #0
	sub r2, r6, r2
	bl sub_02033B4C
	ldr r2, [r4, #4]
	str r0, [sp, #0xc]
	cmp r2, #0
	beq _0203727A
	ldr r1, [r4]
	ldr r0, [sp, #8]
	add r1, r2, r1
	ldr r2, [sp, #0xc]
	bl MIi_CpuCopy8
_0203727A:
	ldr r1, [r4]
	ldr r0, [sp, #0xc]
	add r0, r1, r0
	str r0, [r4]
	cmp r0, r6
	blt _020372CA
	str r4, [sp]
	ldr r0, [sp, #4]
	ldr r3, [r4, #4]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_020371A8
	cmp r7, #0x11
	beq _020372D4
	b _020372CA
_0203729A:
	add r0, r5, #0
	bl sub_02033BC4
	cmp r0, r6
	blt _020372C2
	ldr r1, [sp, #8]
	add r0, r5, #0
	add r2, r6, #0
	bl sub_02033B4C
	ldr r0, [sp, #4]
	ldr r3, [sp, #8]
	add r1, r7, #0
	add r2, r6, #0
	str r4, [sp]
	bl sub_020371A8
	cmp r7, #0x11
	beq _020372D4
	b _020372CA
_020372C2:
	ldr r0, [sp, #0x10]
	add sp, #0x14
	strh r0, [r5, #4]
	pop {r4, r5, r6, r7, pc}
_020372CA:
	add r0, r5, #0
	bl sub_02033BC4
	cmp r0, #0
	bne _020371D8
_020372D4:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020372D8: .word 0x0000FFFF
_020372DC: .word 0x021D4140
_020372E0: .word 0x000006B8
	thumb_func_end sub_020371C4

	thumb_func_start sub_020372E4
sub_020372E4: ; 0x020372E4
	push {r4, lr}
	ldr r0, _02037328 ; =0x021D4140
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _02037326
	ldr r0, _0203732C ; =0x000006BA
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02037326
	ldr r0, _02037330 ; =0x000004A4
	add r0, r1, r0
	bl sub_02033C28
	ldr r0, _02037328 ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _02037330 ; =0x000004A4
	add r0, r1, r0
	bl sub_02033BC4
	cmp r0, #0
	ble _02037326
	ldr r0, _02037328 ; =0x021D4140
	mov r3, #0x62
	ldr r4, [r0, #8]
	ldr r2, _02037330 ; =0x000004A4
	lsl r3, r3, #4
	add r0, r4, r2
	sub r2, #0x10
	ldr r2, [r4, r2]
	mov r1, #0
	add r3, r4, r3
	bl sub_020371C4
_02037326:
	pop {r4, pc}
	.balign 4, 0
_02037328: .word 0x021D4140
_0203732C: .word 0x000006BA
_02037330: .word 0x000004A4
	thumb_func_end sub_020372E4

	thumb_func_start sub_02037334
sub_02037334: ; 0x02037334
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _020373A4 ; =0x021D4140
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _020373A0
	ldr r0, _020373A8 ; =0x000006BA
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _020373A0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r0, r0, #1
	mov r4, #0
	str r0, [sp]
	cmp r0, #0
	ble _020373A0
	ldr r7, _020373A4 ; =0x021D4140
	add r5, r4, #0
_02037360:
	ldr r1, [r7, #8]
	ldr r0, _020373AC ; =0x0000051C
	add r0, r1, r0
	add r0, r0, r5
	bl sub_02033C28
	ldr r1, [r7, #8]
	ldr r0, _020373AC ; =0x0000051C
	add r0, r1, r0
	add r0, r0, r5
	bl sub_02033BC4
	cmp r0, #0
	ble _02037396
	mov r3, #0x17
	ldr r6, [r7, #8]
	ldr r0, _020373AC ; =0x0000051C
	ldr r2, _020373B0 ; =0x00000494
	lsl r3, r3, #6
	add r0, r6, r0
	add r3, r6, r3
	ldr r2, [r6, r2]
	add r0, r0, r5
	add r1, r4, #0
	add r3, r3, r5
	bl sub_020371C4
_02037396:
	ldr r0, [sp]
	add r4, r4, #1
	add r5, #0xc
	cmp r4, r0
	blt _02037360
_020373A0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020373A4: .word 0x021D4140
_020373A8: .word 0x000006BA
_020373AC: .word 0x0000051C
_020373B0: .word 0x00000494
	thumb_func_end sub_02037334

	thumb_func_start sub_020373B4
sub_020373B4: ; 0x020373B4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02037448 ; =0x021D4140
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _020373C4
	mov r0, #0
	pop {r4, pc}
_020373C4:
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _020373F2
	ldr r0, _02037448 ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _0203744C ; =0x000006B6
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _020373EE
	bl ov00_021EE4FC
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	mov r0, #1
	add r1, r0, #0
	lsl r1, r4
	tst r1, r2
	bne _02037444
_020373EE:
	mov r0, #0
	pop {r4, pc}
_020373F2:
	bl sub_02037474
	cmp r0, #0
	bne _020373FE
	mov r0, #0
	pop {r4, pc}
_020373FE:
	bl sub_02033298
	cmp r0, #4
	beq _0203740A
	mov r0, #0
	pop {r4, pc}
_0203740A:
	bl sub_0203769C
	cmp r4, r0
	bne _02037416
	mov r0, #1
	pop {r4, pc}
_02037416:
	bl sub_0203769C
	cmp r0, #0
	bne _02037430
	bl sub_02033250
	mov r1, #1
	add r2, r1, #0
	lsl r2, r4
	tst r0, r2
	beq _02037442
	add r0, r1, #0
	pop {r4, pc}
_02037430:
	ldr r0, _02037448 ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _02037450 ; =0x00000694
	ldrh r2, [r1, r0]
	mov r0, #1
	add r1, r0, #0
	lsl r1, r4
	tst r1, r2
	bne _02037444
_02037442:
	mov r0, #0
_02037444:
	pop {r4, pc}
	nop
_02037448: .word 0x021D4140
_0203744C: .word 0x000006B6
_02037450: .word 0x00000694
	thumb_func_end sub_020373B4

	thumb_func_start sub_02037454
sub_02037454: ; 0x02037454
	push {r3, r4, r5, lr}
	mov r4, #0
	add r5, r4, #0
_0203745A:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _02037468
	add r4, r4, #1
_02037468:
	add r5, r5, #1
	cmp r5, #8
	blt _0203745A
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02037454

	thumb_func_start sub_02037474
sub_02037474: ; 0x02037474
	push {r3, lr}
	ldr r0, _02037494 ; =0x021D4140
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0203748E
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _0203748E
	mov r0, #1
	pop {r3, pc}
_0203748E:
	bl sub_02035650
	pop {r3, pc}
	.balign 4, 0
_02037494: .word 0x021D4140
	thumb_func_end sub_02037474

	thumb_func_start sub_02037498
sub_02037498: ; 0x02037498
	ldr r1, _020374A4 ; =0x021D4140
	ldr r2, [r1, #8]
	ldr r1, _020374A8 ; =0x0000065F
	strb r0, [r2, r1]
	bx lr
	nop
_020374A4: .word 0x021D4140
_020374A8: .word 0x0000065F
	thumb_func_end sub_02037498

	thumb_func_start sub_020374AC
sub_020374AC: ; 0x020374AC
	ldr r1, _020374B8 ; =0x021D4140
	ldr r1, [r1, #8]
	add r1, r1, r0
	ldr r0, _020374BC ; =0x00000654
	ldrb r0, [r1, r0]
	bx lr
	.balign 4, 0
_020374B8: .word 0x021D4140
_020374BC: .word 0x00000654
	thumb_func_end sub_020374AC

	thumb_func_start sub_020374C0
sub_020374C0: ; 0x020374C0
	ldr r1, _020374DC ; =0x021D4140
	ldr r2, [r1, #8]
	cmp r2, #0
	bne _020374CC
	mov r0, #0
	bx lr
_020374CC:
	ldr r1, _020374E0 ; =0x00000644
	add r3, r2, r1
	lsl r2, r0, #1
	ldrh r0, [r3, r2]
	mov r1, #0
	strh r1, [r3, r2]
	bx lr
	nop
_020374DC: .word 0x021D4140
_020374E0: .word 0x00000644
	thumb_func_end sub_020374C0

	thumb_func_start sub_020374E4
sub_020374E4: ; 0x020374E4
	ldr r0, _020374FC ; =0x021D4140
	ldr r3, [r0, #8]
	cmp r3, #0
	beq _020374F8
	ldr r1, _02037500 ; =0x0000065C
	mov r0, #2
	ldrh r2, [r3, r1]
	lsl r0, r0, #0xe
	orr r0, r2
	strh r0, [r3, r1]
_020374F8:
	bx lr
	nop
_020374FC: .word 0x021D4140
_02037500: .word 0x0000065C
	thumb_func_end sub_020374E4

	thumb_func_start sub_02037504
sub_02037504: ; 0x02037504
	ldr r0, _02037514 ; =0x021D4140
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _02037512
	ldr r0, _02037518 ; =0x0000065C
	mov r1, #0
	strh r1, [r2, r0]
_02037512:
	bx lr
	.balign 4, 0
_02037514: .word 0x021D4140
_02037518: .word 0x0000065C
	thumb_func_end sub_02037504

	thumb_func_start sub_0203751C
sub_0203751C: ; 0x0203751C
	ldr r0, _02037534 ; =0x021D4140
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _02037530
	ldr r0, _02037538 ; =0x0000065C
	ldrh r1, [r1, r0]
	mov r0, #2
	lsl r0, r0, #0xe
	and r0, r1
	bx lr
_02037530:
	mov r0, #1
	bx lr
	.balign 4, 0
_02037534: .word 0x021D4140
_02037538: .word 0x0000065C
	thumb_func_end sub_0203751C

	thumb_func_start sub_0203753C
sub_0203753C: ; 0x0203753C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02035FF0
	cmp r0, #1
	bne _0203756E
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _02037590 ; =0x021D4140
	add r2, r4, #0
	ldr r1, [r0, #8]
	mov r0, #0x16
	lsl r0, r0, #6
	add r0, r1, r0
	add r1, r5, #0
	add r3, r6, #0
	bl sub_02033DF0
	add sp, #8
	pop {r4, r5, r6, pc}
_0203756E:
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _02037590 ; =0x021D4140
	add r2, r4, #0
	ldr r1, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r1, r0
	add r1, r5, #0
	add r3, r6, #0
	bl sub_02033DF0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02037590: .word 0x021D4140
	thumb_func_end sub_0203753C

	thumb_func_start sub_02037594
sub_02037594: ; 0x02037594
	push {r3, lr}
	ldr r0, _0203760C ; =0x021D4140
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _02037608
	ldr r1, _02037610 ; =0x000006AB
	ldrb r0, [r2, r1]
	cmp r0, #1
	beq _020375AC
	cmp r0, #3
	beq _020375E4
	pop {r3, pc}
_020375AC:
	bl sub_02035FF0
	cmp r0, #1
	bne _020375C4
	ldr r1, _0203760C ; =0x021D4140
	mov r0, #0xb
	ldr r2, [r1, #8]
	ldr r1, _02037614 ; =0x000006AC
	add r1, r2, r1
	bl sub_020376E0
	b _020375D4
_020375C4:
	ldr r1, _0203760C ; =0x021D4140
	mov r0, #0xb
	ldr r2, [r1, #8]
	ldr r1, _02037614 ; =0x000006AC
	add r1, r2, r1
	mov r2, #1
	bl sub_02037108
_020375D4:
	cmp r0, #0
	beq _02037608
	ldr r0, _0203760C ; =0x021D4140
	mov r2, #2
	ldr r1, [r0, #8]
	ldr r0, _02037610 ; =0x000006AB
	strb r2, [r1, r0]
	pop {r3, pc}
_020375E4:
	add r1, r1, #1
	mov r0, #0xc
	add r1, r2, r1
	bl sub_020376E0
	cmp r0, #0
	beq _02037608
	ldr r0, _0203760C ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _02037614 ; =0x000006AC
	ldrb r0, [r1, r0]
	bl sub_02035FA8
	ldr r0, _0203760C ; =0x021D4140
	mov r2, #0
	ldr r1, [r0, #8]
	ldr r0, _02037610 ; =0x000006AB
	strb r2, [r1, r0]
_02037608:
	pop {r3, pc}
	nop
_0203760C: .word 0x021D4140
_02037610: .word 0x000006AB
_02037614: .word 0x000006AC
	thumb_func_end sub_02037594

	thumb_func_start sub_02037618
sub_02037618: ; 0x02037618
	push {r4, lr}
	add r4, r2, #0
	bl sub_0203769C
	cmp r0, #0
	bne _02037636
	ldr r1, _02037638 ; =0x021D4140
	ldr r0, _0203763C ; =0x000006AB
	ldr r2, [r1, #8]
	mov r3, #1
	strb r3, [r2, r0]
	ldrb r2, [r4]
	ldr r1, [r1, #8]
	add r0, r0, #1
	strb r2, [r1, r0]
_02037636:
	pop {r4, pc}
	.balign 4, 0
_02037638: .word 0x021D4140
_0203763C: .word 0x000006AB
	thumb_func_end sub_02037618

	thumb_func_start sub_02037640
sub_02037640: ; 0x02037640
	push {r4, lr}
	add r4, r2, #0
	bl sub_0203769C
	cmp r0, #0
	beq _0203765E
	ldr r1, _02037660 ; =0x021D4140
	ldrb r3, [r4]
	ldr r2, [r1, #8]
	ldr r0, _02037664 ; =0x000006AC
	strb r3, [r2, r0]
	ldr r1, [r1, #8]
	mov r2, #3
	sub r0, r0, #1
	strb r2, [r1, r0]
_0203765E:
	pop {r4, pc}
	.balign 4, 0
_02037660: .word 0x021D4140
_02037664: .word 0x000006AC
	thumb_func_end sub_02037640

	thumb_func_start sub_02037668
sub_02037668: ; 0x02037668
	push {r4, lr}
	add r4, r2, #0
	bl sub_0203769C
	cmp r0, #0
	bne _02037690
	ldr r0, _02037694 ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _02037698 ; =0x000006AB
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _02037690
	ldrb r0, [r4]
	bl sub_02035FA8
	ldr r0, _02037694 ; =0x021D4140
	mov r2, #0
	ldr r1, [r0, #8]
	ldr r0, _02037698 ; =0x000006AB
	strb r2, [r1, r0]
_02037690:
	pop {r4, pc}
	nop
_02037694: .word 0x021D4140
_02037698: .word 0x000006AB
	thumb_func_end sub_02037668

	thumb_func_start sub_0203769C
sub_0203769C: ; 0x0203769C
	push {r3, lr}
	ldr r0, _020376D0 ; =0x021D4140
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _020376CA
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _020376C4
	bl ov00_021E6964
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _020376CA
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
_020376C4:
	bl sub_020338F4
	pop {r3, pc}
_020376CA:
	mov r0, #0
	pop {r3, pc}
	nop
_020376D0: .word 0x021D4140
	thumb_func_end sub_0203769C

	thumb_func_start sub_020376D4
sub_020376D4: ; 0x020376D4
	ldr r3, _020376DC ; =sub_02036FD8
	mov r2, #0
	bx r3
	nop
_020376DC: .word sub_02036FD8
	thumb_func_end sub_020376D4

	thumb_func_start sub_020376E0
sub_020376E0: ; 0x020376E0
	ldr r3, _020376E8 ; =sub_02037030
	mov r2, #0
	bx r3
	nop
_020376E8: .word sub_02037030
	thumb_func_end sub_020376E0

	thumb_func_start sub_020376EC
sub_020376EC: ; 0x020376EC
	ldr r3, _020376F4 ; =sub_02037030
	mov r1, #0
	add r2, r1, #0
	bx r3
	.balign 4, 0
_020376F4: .word sub_02037030
	thumb_func_end sub_020376EC

	thumb_func_start sub_020376F8
sub_020376F8: ; 0x020376F8
	ldr r3, _020376FC ; =sub_0203567C
	bx r3
	.balign 4, 0
_020376FC: .word sub_0203567C
	thumb_func_end sub_020376F8

	thumb_func_start sub_02037700
sub_02037700: ; 0x02037700
	push {r3, lr}
	ldr r0, _02037724 ; =0x021D4140
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0203771E
	ldr r0, _02037728 ; =0x000006B8
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _0203771E
	mov r0, #1
	add r1, r0, #0
	bl sub_020398D4
	mov r0, #1
	pop {r3, pc}
_0203771E:
	bl sub_0203569C
	pop {r3, pc}
	.balign 4, 0
_02037724: .word 0x021D4140
_02037728: .word 0x000006B8
	thumb_func_end sub_02037700

	thumb_func_start sub_0203772C
sub_0203772C: ; 0x0203772C
	push {r3, lr}
	bl sub_02033FC4
	cmp r0, #5
	blo _0203773A
	mov r0, #0xc
	pop {r3, pc}
_0203773A:
	bl sub_02035FF0
	cmp r0, #0
	bne _02037746
	mov r0, #0xc
	pop {r3, pc}
_02037746:
	mov r0, #0x26
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203772C

	thumb_func_start sub_0203774C
sub_0203774C: ; 0x0203774C
	push {r3, lr}
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r0, r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203774C

	thumb_func_start sub_0203775C
sub_0203775C: ; 0x0203775C
	push {r3, lr}
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FF0
	add r0, r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203775C

	thumb_func_start sub_0203776C
sub_0203776C: ; 0x0203776C
	push {r3, lr}
	bl sub_020357FC
	cmp r0, #0
	bne _02037786
	bl sub_0203769C
	cmp r0, #0
	bne _02037786
	mov r0, #2
	add r1, sp, #0
	bl sub_02037184
_02037786:
	bl sub_0203581C
	pop {r3, pc}
	thumb_func_end sub_0203776C

	thumb_func_start sub_0203778C
sub_0203778C: ; 0x0203778C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r0, #0
	add r0, sp, #0x10
	add r1, sp, #4
	bl GF_RTC_CopyDateTime
	ldr r0, _02037810 ; =gMain
	ldr r6, [sp, #0x10]
	mov r5, #0
	lsr r7, r6, #0x1c
	lsl r5, r5, #4
	ldr r1, [sp, #0xc]
	ldr r0, [r0, #0x2c]
	lsl r6, r6, #4
	add r3, r1, r0
	ldr r0, [sp, #0x18]
	orr r5, r7
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #4]
	add r6, r0, r6
	ldr r0, _02037814 ; =0x00000000
	ldr r2, [sp, #8]
	adc r0, r5
	lsr r5, r6, #0x1b
	lsl r0, r0, #5
	orr r0, r5
	ldr r5, [sp]
	lsl r6, r6, #5
	add r6, r5, r6
	ldr r5, _02037814 ; =0x00000000
	adc r5, r0
	lsr r0, r6, #0x1b
	lsl r5, r5, #5
	orr r5, r0
	lsl r0, r6, #5
	add r6, r1, r0
	ldr r1, _02037814 ; =0x00000000
	adc r1, r5
	lsr r0, r6, #0x1a
	lsl r1, r1, #6
	orr r1, r0
	lsl r0, r6, #6
	add r5, r2, r0
	ldr r2, _02037814 ; =0x00000000
	adc r2, r1
	lsr r0, r5, #0x1a
	lsl r1, r2, #6
	orr r1, r0
	lsl r0, r5, #6
	add r2, r3, r0
	ldr r0, _02037814 ; =0x00000000
	str r2, [r4]
	adc r0, r1
	str r0, [r4, #4]
	ldr r1, _02037818 ; =0x6C078965
	ldr r0, _0203781C ; =0x5D588B65
	str r1, [r4, #8]
	str r0, [r4, #0xc]
	ldr r0, _02037820 ; =0x00269EC3
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0x14]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02037810: .word gMain
_02037814: .word 0x00000000
_02037818: .word 0x6C078965
_0203781C: .word 0x5D588B65
_02037820: .word 0x00269EC3
	thumb_func_end sub_0203778C

	thumb_func_start sub_02037824
sub_02037824: ; 0x02037824
	add r1, r0, #0
	ldr r0, _02037834 ; =0x021D4140
	ldr r3, _02037838 ; =sub_02033F9C
	ldr r2, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r2, r0
	bx r3
	.balign 4, 0
_02037834: .word 0x021D4140
_02037838: .word sub_02033F9C
	thumb_func_end sub_02037824

	thumb_func_start sub_0203783C
sub_0203783C: ; 0x0203783C
	ldr r0, _0203784C ; =0x021D4140
	ldr r3, _02037850 ; =sub_02033C50
	ldr r1, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r1, r0
	bx r3
	nop
_0203784C: .word 0x021D4140
_02037850: .word sub_02033C50
	thumb_func_end sub_0203783C

	thumb_func_start sub_02037854
sub_02037854: ; 0x02037854
	ldr r0, _02037864 ; =0x021D4140
	ldr r3, _02037868 ; =sub_02033C50
	ldr r1, [r0, #8]
	mov r0, #0x16
	lsl r0, r0, #6
	add r0, r1, r0
	bx r3
	nop
_02037864: .word 0x021D4140
_02037868: .word sub_02033C50
	thumb_func_end sub_02037854

	thumb_func_start sub_0203786C
sub_0203786C: ; 0x0203786C
	ldr r1, _02037878 ; =0x021D4140
	ldr r2, [r1, #8]
	ldr r1, _0203787C ; =0x000006B6
	strb r0, [r2, r1]
	bx lr
	nop
_02037878: .word 0x021D4140
_0203787C: .word 0x000006B6
	thumb_func_end sub_0203786C

	thumb_func_start sub_02037880
sub_02037880: ; 0x02037880
	ldr r0, _0203788C ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _02037890 ; =0x000006B6
	ldrb r0, [r1, r0]
	bx lr
	nop
_0203788C: .word 0x021D4140
_02037890: .word 0x000006B6
	thumb_func_end sub_02037880

	thumb_func_start sub_02037894
sub_02037894: ; 0x02037894
	ldr r2, _020378A4 ; =0x021D4140
	ldr r2, [r2, #8]
	cmp r2, #0
	beq _020378A2
	add r2, r2, r1
	ldr r1, _020378A8 ; =0x000006A6
	strb r0, [r2, r1]
_020378A2:
	bx lr
	.balign 4, 0
_020378A4: .word 0x021D4140
_020378A8: .word 0x000006A6
	thumb_func_end sub_02037894

	thumb_func_start sub_020378AC
sub_020378AC: ; 0x020378AC
	ldr r1, _020378C4 ; =0x021D4140
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _020378C0
	add r2, r1, r0
	ldr r1, _020378C8 ; =0x000006A6
	ldrb r1, [r2, r1]
	cmp r1, #0xff
	beq _020378C0
	add r0, r1, #0
_020378C0:
	bx lr
	nop
_020378C4: .word 0x021D4140
_020378C8: .word 0x000006A6
	thumb_func_end sub_020378AC

	thumb_func_start sub_020378CC
sub_020378CC: ; 0x020378CC
	push {r3, lr}
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _020378E0
	bl ov00_021E7080
	pop {r3, pc}
_020378E0:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_020378CC

	thumb_func_start sub_020378E4
sub_020378E4: ; 0x020378E4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _02037922
	ldr r2, _02037924 ; =0x021D4140
	ldr r1, _02037928 ; =0x00000664
	ldr r3, [r2, #8]
	ldr r0, [r3, r1]
	cmp r0, r4
	beq _02037922
	str r4, [r3, r1]
	cmp r4, #0
	beq _02037922
	ldr r3, [r2, #8]
	mov r0, #0
	add r1, r1, #4
	str r0, [r3, r1]
	ldr r1, _0203792C ; =0x0000066C
	add r5, r0, #0
	add r4, r0, #0
_02037914:
	ldr r3, [r2, #8]
	add r0, r0, #1
	add r3, r3, r5
	add r5, r5, #4
	str r4, [r3, r1]
	cmp r0, #8
	blt _02037914
_02037922:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02037924: .word 0x021D4140
_02037928: .word 0x00000664
_0203792C: .word 0x0000066C
	thumb_func_end sub_020378E4

	thumb_func_start sub_02037930
sub_02037930: ; 0x02037930
	push {r4, lr}
	add r4, r0, #0
	bl sub_020378E4
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _02037956
	cmp r4, #0
	beq _02037950
	mov r0, #0
	bl ov00_021E70CC
	pop {r4, pc}
_02037950:
	mov r0, #1
	bl ov00_021E70CC
_02037956:
	pop {r4, pc}
	thumb_func_end sub_02037930

	thumb_func_start sub_02037958
sub_02037958: ; 0x02037958
	ldr r0, _0203796C ; =0x021D4140
	ldr r1, [r0, #8]
	ldr r0, _02037970 ; =0x000006B1
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02037968
	mov r0, #1
	bx lr
_02037968:
	mov r0, #0
	bx lr
	.balign 4, 0
_0203796C: .word 0x021D4140
_02037970: .word 0x000006B1
	thumb_func_end sub_02037958

	thumb_func_start sub_02037974
sub_02037974: ; 0x02037974
	ldr r0, _02037980 ; =0x021D4140
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02037984 ; =0x000006B8
	strb r2, [r1, r0]
	bx lr
	.balign 4, 0
_02037980: .word 0x021D4140
_02037984: .word 0x000006B8
	thumb_func_end sub_02037974

	thumb_func_start sub_02037988
sub_02037988: ; 0x02037988
	ldr r0, _02037998 ; =0x021D4140
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _02037996
	ldr r0, _0203799C ; =0x000006B9
	mov r1, #1
	strb r1, [r2, r0]
_02037996:
	bx lr
	.balign 4, 0
_02037998: .word 0x021D4140
_0203799C: .word 0x000006B9
	thumb_func_end sub_02037988

	thumb_func_start sub_020379A0
sub_020379A0: ; 0x020379A0
	push {r4, lr}
	ldr r1, _020379F0 ; =0x021D414C
	ldr r1, [r1]
	cmp r1, #0
	bne _020379C0
	mov r1, #0x99
	lsl r1, r1, #2
	bl AllocFromHeap
	ldr r1, _020379F0 ; =0x021D414C
	mov r2, #0x99
	str r0, [r1]
	mov r1, #0
	lsl r2, r2, #2
	bl MIi_CpuFill8
_020379C0:
	ldr r1, _020379F0 ; =0x021D414C
	mov r3, #0
	mov r0, #0xff
_020379C6:
	ldr r2, [r1]
	add r2, r2, r3
	add r3, r3, #1
	strb r0, [r2, #0x10]
	cmp r3, #8
	blt _020379C6
	ldr r3, _020379F0 ; =0x021D414C
	ldr r1, _020379F4 ; =0x00000261
	ldr r2, [r3]
	strb r0, [r2, r1]
	ldr r4, [r3]
	add r2, r1, #1
	strb r0, [r4, r2]
	ldr r2, [r3]
	mov r4, #0
	add r0, r1, #2
	strb r4, [r2, r0]
	ldr r2, [r3]
	sub r0, r1, #1
	strb r4, [r2, r0]
	pop {r4, pc}
	.balign 4, 0
_020379F0: .word 0x021D414C
_020379F4: .word 0x00000261
	thumb_func_end sub_020379A0

	thumb_func_start sub_020379F8
sub_020379F8: ; 0x020379F8
	push {r3, lr}
	ldr r0, _02037A0C ; =0x021D414C
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _02037A0C ; =0x021D414C
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	nop
_02037A0C: .word 0x021D414C
	thumb_func_end sub_020379F8

	thumb_func_start sub_02037A10
sub_02037A10: ; 0x02037A10
	ldr r0, _02037A20 ; =0x021D414C
	ldr r0, [r0]
	cmp r0, #0
	beq _02037A1C
	mov r0, #1
	bx lr
_02037A1C:
	mov r0, #0
	bx lr
	.balign 4, 0
_02037A20: .word 0x021D414C
	thumb_func_end sub_02037A10

	thumb_func_start sub_02037A24
sub_02037A24: ; 0x02037A24
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	ldrb r1, [r2]
	add r5, r0, #0
	add r0, sp, #0
	strb r1, [r0]
	bl sub_0203769C
	cmp r0, #0
	bne _02037A8E
	add r0, sp, #0
	strb r5, [r0, #1]
	ldrb r1, [r0]
	strb r1, [r0, #2]
	add r1, sp, #0
	mov r0, #0x12
	add r1, #1
	bl sub_02037184
	ldr r6, _02037A94 ; =0x021D414C
	add r4, sp, #0
	ldr r0, [r6]
	ldrb r1, [r4]
	add r0, r0, r5
	mov r5, #0
	strb r1, [r0, #0x10]
_02037A58:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _02037A70
	ldr r0, [r6]
	ldrb r1, [r4]
	add r0, r0, r5
	ldrb r0, [r0, #0x10]
	cmp r1, r0
	bne _02037A8E
_02037A70:
	add r5, r5, #1
	cmp r5, #8
	blt _02037A58
	mov r0, #0x11
	add r1, sp, #0
	bl sub_02037184
	cmp r0, #0
	bne _02037A8E
	ldr r0, _02037A94 ; =0x021D414C
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0x26
	lsl r0, r0, #4
	strb r2, [r1, r0]
_02037A8E:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02037A94: .word 0x021D414C
	thumb_func_end sub_02037A24

	thumb_func_start sub_02037A98
sub_02037A98: ; 0x02037A98
	ldr r0, _02037AA8 ; =0x021D414C
	ldrb r3, [r2, #1]
	ldr r1, [r0]
	ldrb r0, [r2]
	add r0, r1, r0
	strb r3, [r0, #0x10]
	bx lr
	nop
_02037AA8: .word 0x021D414C
	thumb_func_end sub_02037A98

	thumb_func_start sub_02037AAC
sub_02037AAC: ; 0x02037AAC
	ldr r0, _02037AB8 ; =0x021D414C
	ldrb r2, [r2]
	ldr r1, [r0]
	ldr r0, _02037ABC ; =0x00000261
	strb r2, [r1, r0]
	bx lr
	.balign 4, 0
_02037AB8: .word 0x021D414C
_02037ABC: .word 0x00000261
	thumb_func_end sub_02037AAC

	thumb_func_start sub_02037AC0
sub_02037AC0: ; 0x02037AC0
	ldr r2, _02037AD4 ; =0x021D414C
	ldr r1, _02037AD8 ; =0x00000262
	ldr r3, [r2]
	strb r0, [r3, r1]
	ldr r2, [r2]
	mov r3, #1
	add r0, r1, #1
	strb r3, [r2, r0]
	bx lr
	nop
_02037AD4: .word 0x021D414C
_02037AD8: .word 0x00000262
	thumb_func_end sub_02037AC0

	thumb_func_start sub_02037ADC
sub_02037ADC: ; 0x02037ADC
	push {r3, lr}
	ldr r0, _02037B30 ; =0x021D414C
	ldr r2, [r0]
	cmp r2, #0
	beq _02037B2C
	ldr r1, _02037B34 ; =0x00000263
	ldrb r0, [r2, r1]
	cmp r0, #0
	beq _02037B06
	sub r1, r1, #1
	mov r0, #0x10
	add r1, r2, r1
	bl sub_020376E0
	cmp r0, #0
	beq _02037B06
	ldr r0, _02037B30 ; =0x021D414C
	mov r2, #0
	ldr r1, [r0]
	ldr r0, _02037B34 ; =0x00000263
	strb r2, [r1, r0]
_02037B06:
	ldr r0, _02037B30 ; =0x021D414C
	ldr r1, [r0]
	mov r0, #0x26
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02037B2C
	mov r0, #0x11
	add r1, #0x10
	bl sub_02037184
	cmp r0, #0
	beq _02037B2C
	ldr r0, _02037B30 ; =0x021D414C
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x26
	lsl r0, r0, #4
	strb r2, [r1, r0]
_02037B2C:
	pop {r3, pc}
	nop
_02037B30: .word 0x021D414C
_02037B34: .word 0x00000263
	thumb_func_end sub_02037ADC

	thumb_func_start sub_02037B38
sub_02037B38: ; 0x02037B38
	ldr r1, _02037B54 ; =0x021D414C
	ldr r2, [r1]
	cmp r2, #0
	bne _02037B44
	mov r0, #1
	bx lr
_02037B44:
	ldr r1, _02037B58 ; =0x00000261
	ldrb r1, [r2, r1]
	cmp r1, r0
	bne _02037B50
	mov r0, #1
	bx lr
_02037B50:
	mov r0, #0
	bx lr
	.balign 4, 0
_02037B54: .word 0x021D414C
_02037B58: .word 0x00000261
	thumb_func_end sub_02037B38

	thumb_func_start sub_02037B5C
sub_02037B5C: ; 0x02037B5C
	ldr r1, _02037B68 ; =0x021D414C
	ldr r1, [r1]
	add r0, r1, r0
	ldrb r0, [r0, #0x10]
	bx lr
	nop
_02037B68: .word 0x021D414C
	thumb_func_end sub_02037B5C

	thumb_func_start sub_02037B6C
sub_02037B6C: ; 0x02037B6C
	push {r3, r4}
	lsl r4, r0, #1
	ldr r0, _02037B84 ; =0x021D414C
	ldrb r3, [r2]
	ldr r1, [r0]
	strb r3, [r1, r4]
	ldr r0, [r0]
	ldrb r1, [r2, #1]
	add r0, r0, r4
	strb r1, [r0, #1]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02037B84: .word 0x021D414C
	thumb_func_end sub_02037B6C

	thumb_func_start sub_02037B88
sub_02037B88: ; 0x02037B88
	mov r0, #2
	bx lr
	thumb_func_end sub_02037B88

	thumb_func_start sub_02037B8C
sub_02037B8C: ; 0x02037B8C
	push {r3, lr}
	add r2, sp, #0
	strb r0, [r2]
	strb r1, [r2, #1]
	mov r0, #0x13
	add r1, sp, #0
	bl sub_020376E0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02037B8C

	thumb_func_start sub_02037BA0
sub_02037BA0: ; 0x02037BA0
	ldr r2, _02037BC4 ; =0x021D414C
	ldr r3, [r2]
	cmp r3, #0
	bne _02037BAE
	mov r0, #0
	mvn r0, r0
	bx lr
_02037BAE:
	lsl r2, r0, #1
	ldrb r0, [r3, r2]
	cmp r1, r0
	bne _02037BBC
	add r0, r3, r2
	ldrb r0, [r0, #1]
	bx lr
_02037BBC:
	mov r0, #0
	mvn r0, r0
	bx lr
	nop
_02037BC4: .word 0x021D414C
	thumb_func_end sub_02037BA0

	thumb_func_start sub_02037BC8
sub_02037BC8: ; 0x02037BC8
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r6, _02037BE8 ; =0x021D414C
	add r5, r4, #0
	add r7, r4, #0
_02037BD2:
	ldr r0, [r6]
	add r1, r7, #0
	add r0, r0, r5
	mov r2, #2
	bl MIi_CpuFill8
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #8
	blt _02037BD2
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02037BE8: .word 0x021D414C
	thumb_func_end sub_02037BC8

	thumb_func_start sub_02037BEC
sub_02037BEC: ; 0x02037BEC
	push {r3, r4}
	mov r4, #0
	mov r0, #0x96
	ldr r1, _02037C08 ; =0x021D414C
	add r3, r4, #0
	lsl r0, r0, #2
_02037BF8:
	ldr r2, [r1]
	add r2, r2, r4
	add r4, r4, #1
	strb r3, [r2, r0]
	cmp r4, #8
	blt _02037BF8
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02037C08: .word 0x021D414C
	thumb_func_end sub_02037BEC

	thumb_func_start sub_02037C0C
sub_02037C0C: ; 0x02037C0C
	push {r4, lr}
	ldr r2, _02037C40 ; =0x021D414C
	ldr r3, [r2]
	cmp r3, #0
	beq _02037C3A
	add r4, r0, #0
	mov r2, #0x48
	mul r4, r2
	add r3, #0x18
	add r0, r1, #0
	add r1, r3, r4
	mov r2, #0x46
	bl MIi_CpuCopy8
	ldr r1, _02037C40 ; =0x021D414C
	mov r0, #0x14
	ldr r1, [r1]
	add r1, #0x18
	add r1, r1, r4
	bl sub_020376E0
	mov r0, #1
	pop {r4, pc}
_02037C3A:
	mov r0, #0
	pop {r4, pc}
	nop
_02037C40: .word 0x021D414C
	thumb_func_end sub_02037C0C

	thumb_func_start sub_02037C44
sub_02037C44: ; 0x02037C44
	ldr r1, _02037C64 ; =0x021D414C
	ldr r3, [r1]
	mov r1, #0x96
	add r2, r3, r0
	lsl r1, r1, #2
	ldrb r1, [r2, r1]
	cmp r1, #0
	beq _02037C5E
	mov r1, #0x48
	add r3, #0x18
	mul r1, r0
	add r0, r3, r1
	bx lr
_02037C5E:
	mov r0, #0
	bx lr
	nop
_02037C64: .word 0x021D414C
	thumb_func_end sub_02037C44

	thumb_func_start sub_02037C68
sub_02037C68: ; 0x02037C68
	push {r3, r4, r5, lr}
	ldr r3, _02037C90 ; =0x021D414C
	add r1, r0, #0
	ldr r0, [r3]
	mov r5, #1
	add r4, r0, r1
	mov r0, #0x96
	lsl r0, r0, #2
	strb r5, [r4, r0]
	ldr r3, [r3]
	add r0, r2, #0
	mov r2, #0x48
	add r3, #0x18
	mul r2, r1
	add r1, r3, r2
	mov r2, #0x46
	bl MIi_CpuCopy8
	pop {r3, r4, r5, pc}
	nop
_02037C90: .word 0x021D414C
	thumb_func_end sub_02037C68

	thumb_func_start sub_02037C94
sub_02037C94: ; 0x02037C94
	mov r0, #0x46
	bx lr
	thumb_func_end sub_02037C94

	thumb_func_start sub_02037C98
sub_02037C98: ; 0x02037C98
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02037D28 ; =0x021D4150
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _02037D24
	cmp r5, #0
	bne _02037CAE
	bl GF_AssertFail
_02037CAE:
	bl sub_02034D8C
	mov r0, #0xf
	mov r1, #0x68
	bl AllocFromHeap
	ldr r1, _02037D28 ; =0x021D4150
	mov r2, #0x68
	str r0, [r1]
	mov r1, #0
	bl MIi_CpuFill8
	ldr r0, _02037D28 ; =0x021D4150
	mov r2, #0x32
	ldr r1, [r0]
	str r2, [r1, #0x44]
	ldr r1, [r0]
	mov r2, #1
	add r1, #0x52
	strb r2, [r1]
	ldr r0, [r0]
	str r5, [r0, #0x28]
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	ldr r1, _02037D28 ; =0x021D4150
	ldr r2, [r1]
	str r0, [r2, #0x2c]
	ldr r0, [r1]
	mov r2, #2
	add r0, #0x4a
	strb r2, [r0]
	ldr r0, [r1]
	mov r2, #0
	add r0, #0x4c
	strb r2, [r0]
	ldr r0, [r1]
	add r0, #0x57
	strb r2, [r0]
	ldr r0, [r1]
	add r0, #0x4e
	strb r4, [r0]
	ldr r0, [r1]
	add r0, #0xc
	bl sub_0203778C
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	bl sub_0203410C
	cmp r4, #9
	beq _02037D24
	cmp r4, #0x11
	beq _02037D24
	cmp r4, #0xf
	beq _02037D24
	bl sub_0203A880
_02037D24:
	pop {r3, r4, r5, pc}
	nop
_02037D28: .word 0x021D4150
	thumb_func_end sub_02037C98

	thumb_func_start sub_02037D2C
sub_02037D2C: ; 0x02037D2C
	push {r3, lr}
	ldr r0, _02037D74 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _02037D72
	bl sub_02034154
	ldr r0, _02037D74 ; =0x021D4150
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	beq _02037D48
	bl FreeToHeap
_02037D48:
	bl sub_02039998
	cmp r0, #0
	beq _02037D56
	mov r0, #0x30
	bl sub_0201A9C4
_02037D56:
	bl sub_0203A914
	bl sub_02034DE0
	ldr r0, _02037D74 ; =0x021D4150
	ldr r0, [r0]
	bl FreeToHeap
	mov r0, #0xf
	bl sub_0201A9C4
	ldr r0, _02037D74 ; =0x021D4150
	mov r1, #0
	str r1, [r0]
_02037D72:
	pop {r3, pc}
	.balign 4, 0
_02037D74: .word 0x021D4150
	thumb_func_end sub_02037D2C

	thumb_func_start sub_02037D78
sub_02037D78: ; 0x02037D78
	ldr r0, _02037D88 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _02037D84
	mov r0, #1
	bx lr
_02037D84:
	mov r0, #0
	bx lr
	.balign 4, 0
_02037D88: .word 0x021D4150
	thumb_func_end sub_02037D78

	thumb_func_start sub_02037D8C
sub_02037D8C: ; 0x02037D8C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl sub_02037474
	cmp r0, #0
	bne _02037DC4
	ldr r2, _02037DC8 ; =0x00007080
	mov r0, #3
	mov r1, #0xf
	bl sub_0201A91C
	add r0, r6, #0
	add r1, r7, #0
	bl sub_02037C98
	ldr r0, _02037DCC ; =0x021D4150
	ldr r1, [r0]
	add r1, #0x4f
	strb r5, [r1]
	ldr r0, [r0]
	mov r1, #0
	str r4, [r0, #0x30]
	ldr r0, _02037DD0 ; =sub_02038218
	bl sub_020381C0
_02037DC4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02037DC8: .word 0x00007080
_02037DCC: .word 0x021D4150
_02037DD0: .word sub_02038218
	thumb_func_end sub_02037D8C

	thumb_func_start sub_02037DD4
sub_02037DD4: ; 0x02037DD4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl sub_02037474
	cmp r0, #0
	bne _02037E0C
	ldr r2, _02037E10 ; =0x00007080
	mov r0, #3
	mov r1, #0xf
	bl sub_0201A91C
	add r0, r6, #0
	add r1, r7, #0
	bl sub_02037C98
	ldr r0, _02037E14 ; =0x021D4150
	ldr r1, [r0]
	add r1, #0x4f
	strb r5, [r1]
	ldr r0, [r0]
	mov r1, #0
	str r4, [r0, #0x30]
	ldr r0, _02037E18 ; =sub_02038294
	bl sub_020381C0
_02037E0C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02037E10: .word 0x00007080
_02037E14: .word 0x021D4150
_02037E18: .word sub_02038294
	thumb_func_end sub_02037DD4

	thumb_func_start sub_02037E1C
sub_02037E1C: ; 0x02037E1C
	ldr r1, _02037E2C ; =0x021D4150
	ldr r3, _02037E30 ; =sub_020381C0
	ldr r1, [r1]
	add r1, #0x4d
	strb r0, [r1]
	ldr r0, _02037E34 ; =sub_020382E4
	mov r1, #0
	bx r3
	.balign 4, 0
_02037E2C: .word 0x021D4150
_02037E30: .word sub_020381C0
_02037E34: .word sub_020382E4
	thumb_func_end sub_02037E1C

	thumb_func_start sub_02037E38
sub_02037E38: ; 0x02037E38
	push {r3, lr}
	bl sub_02036274
	ldr r0, _02037E48 ; =sub_020383B0
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02037E48: .word sub_020383B0
	thumb_func_end sub_02037E38

	thumb_func_start sub_02037E4C
sub_02037E4C: ; 0x02037E4C
	push {r3, lr}
	ldr r0, _02037E94 ; =0x021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x40]
	cmp r0, #0
	ble _02037E5E
	sub r0, r0, #1
	str r0, [r1, #0x40]
	b _02037E64
_02037E5E:
	bne _02037E64
	bl sub_020399EC
_02037E64:
	ldr r0, _02037E94 ; =0x021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _02037E72
	sub r0, r0, #1
	str r0, [r1, #0x44]
_02037E72:
	bl sub_02034FE8
	cmp r0, #0
	beq _02037E90
	ldr r0, _02037E94 ; =0x021D4150
	ldr r0, [r0]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	bne _02037E90
	bl sub_02036024
	ldr r0, _02037E98 ; =sub_02038408
	mov r1, #0
	bl sub_020381C0
_02037E90:
	pop {r3, pc}
	nop
_02037E94: .word 0x021D4150
_02037E98: .word sub_02038408
	thumb_func_end sub_02037E4C

	thumb_func_start sub_02037E9C
sub_02037E9C: ; 0x02037E9C
	push {r3, lr}
	ldr r0, _02037EB4 ; =0x021D4150
	ldr r1, [r0]
	cmp r1, #0
	beq _02037EB2
	ldr r0, _02037EB8 ; =0x00000708
	str r0, [r1, #0x40]
	ldr r0, _02037EBC ; =sub_02037E4C
	mov r1, #5
	bl sub_020381C0
_02037EB2:
	pop {r3, pc}
	.balign 4, 0
_02037EB4: .word 0x021D4150
_02037EB8: .word 0x00000708
_02037EBC: .word sub_02037E4C
	thumb_func_end sub_02037E9C

	thumb_func_start sub_02037EC0
sub_02037EC0: ; 0x02037EC0
	ldr r3, _02037EC4 ; =sub_02033A0C
	bx r3
	.balign 4, 0
_02037EC4: .word sub_02033A0C
	thumb_func_end sub_02037EC0

	thumb_func_start sub_02037EC8
sub_02037EC8: ; 0x02037EC8
	push {r4}
	sub sp, #0xc
	ldr r4, _02037F10 ; =0x020F6A90
	add r3, sp, #0
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	ldr r0, _02037F14 ; =0x021D4150
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	cmp r0, #0
	bne _02037EEC
	add sp, #0xc
	mov r0, #0
	pop {r4}
	bx lr
_02037EEC:
	ldr r0, [sp]
	cmp r0, #0
	beq _02037F08
_02037EF2:
	ldr r0, [r2]
	cmp r1, r0
	bne _02037F00
	add sp, #0xc
	mov r0, #1
	pop {r4}
	bx lr
_02037F00:
	add r2, r2, #4
	ldr r0, [r2]
	cmp r0, #0
	bne _02037EF2
_02037F08:
	mov r0, #0
	add sp, #0xc
	pop {r4}
	bx lr
	.balign 4, 0
_02037F10: .word 0x020F6A90
_02037F14: .word 0x021D4150
	thumb_func_end sub_02037EC8

	thumb_func_start sub_02037F18
sub_02037F18: ; 0x02037F18
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02037F58 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _02037F56
	ldr r2, _02037F5C ; =0x00007080
	mov r0, #3
	mov r1, #0xf
	bl sub_0201A91C
	cmp r0, #0
	bne _02037F36
	bl sub_020399EC
_02037F36:
	add r0, r4, #0
	mov r1, #9
	bl sub_02037C98
	ldr r0, _02037F58 ; =0x021D4150
	mov r2, #9
	ldr r1, [r0]
	add r1, #0x4e
	strb r2, [r1]
	ldr r0, [r0]
	mov r1, #0
	add r0, #0x4f
	strb r1, [r0]
	ldr r0, _02037F60 ; =sub_020384B4
	bl sub_020381C0
_02037F56:
	pop {r4, pc}
	.balign 4, 0
_02037F58: .word 0x021D4150
_02037F5C: .word 0x00007080
_02037F60: .word sub_020384B4
	thumb_func_end sub_02037F18

	thumb_func_start sub_02037F64
sub_02037F64: ; 0x02037F64
	push {r3, lr}
	ldr r1, _02037F8C ; =0x021D4150
	ldr r2, [r1]
	add r2, #0x4d
	strb r0, [r2]
	ldr r0, [r1]
	mov r2, #3
	add r0, #0x48
	strh r2, [r0]
	mov r0, #1
	bl sub_02033AA4
	bl sub_0203A880
	ldr r0, _02037F90 ; =sub_02038668
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	nop
_02037F8C: .word 0x021D4150
_02037F90: .word sub_02038668
	thumb_func_end sub_02037F64

	thumb_func_start sub_02037F94
sub_02037F94: ; 0x02037F94
	ldr r0, _02037FC0 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _02037FA2
	mov r0, #0
	mvn r0, r0
	bx lr
_02037FA2:
	ldr r1, [r0, #0x24]
	ldr r0, _02037FC4 ; =sub_020387E8
	cmp r1, r0
	bne _02037FAE
	mov r0, #1
	bx lr
_02037FAE:
	ldr r0, _02037FC8 ; =sub_02038800
	cmp r1, r0
	bne _02037FB8
	mov r0, #1
	b _02037FBA
_02037FB8:
	mov r0, #0
_02037FBA:
	neg r0, r0
	bx lr
	nop
_02037FC0: .word 0x021D4150
_02037FC4: .word sub_020387E8
_02037FC8: .word sub_02038800
	thumb_func_end sub_02037F94

	thumb_func_start sub_02037FCC
sub_02037FCC: ; 0x02037FCC
	ldr r0, _02037FE8 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _02037FD8
	mov r0, #0
	bx lr
_02037FD8:
	ldr r1, [r0, #0x24]
	ldr r0, _02037FEC ; =sub_02038854
	cmp r1, r0
	bne _02037FE4
	mov r0, #1
	bx lr
_02037FE4:
	mov r0, #0
	bx lr
	.balign 4, 0
_02037FE8: .word 0x021D4150
_02037FEC: .word sub_02038854
	thumb_func_end sub_02037FCC

	thumb_func_start sub_02037FF0
sub_02037FF0: ; 0x02037FF0
	push {r3, lr}
	mov r0, #0
	bl sub_02033AA4
	ldr r0, _02038064 ; =0x021D4150
	ldr r1, [r0]
	add r0, r1, #0
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #1
	bne _02038018
	add r0, r1, #0
	add r0, #0x54
	ldrb r0, [r0]
	cmp r0, #1
	bne _02038018
	add r1, #0x4e
	ldrb r0, [r1]
	cmp r0, #9
	bne _02038020
_02038018:
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
_02038020:
	bl sub_0203A914
	ldr r0, _02038064 ; =0x021D4150
	mov r2, #9
	ldr r1, [r0]
	add r1, #0x4e
	strb r2, [r1]
	ldr r1, [r0]
	mov r2, #0
	add r1, #0x57
	strb r2, [r1]
	ldr r0, [r0]
	add r0, #0x4a
	ldrb r0, [r0]
	bl sub_02033908
	bl sub_0203769C
	cmp r0, #0
	bne _02038058
	mov r0, #1
	bl sub_02033ACC
	ldr r0, _02038068 ; =sub_02038418
	mov r1, #0xf
	bl sub_020381C0
	pop {r3, pc}
_02038058:
	ldr r0, _0203806C ; =sub_02038460
	mov r1, #5
	bl sub_020381C0
	pop {r3, pc}
	nop
_02038064: .word 0x021D4150
_02038068: .word sub_02038418
_0203806C: .word sub_02038460
	thumb_func_end sub_02037FF0

	thumb_func_start sub_02038070
sub_02038070: ; 0x02038070
	ldr r0, _0203808C ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _0203807C
	mov r0, #1
	bx lr
_0203807C:
	ldr r1, [r0, #0x24]
	ldr r0, _02038090 ; =sub_02038538
	cmp r1, r0
	beq _02038088
	mov r0, #1
	bx lr
_02038088:
	mov r0, #0
	bx lr
	.balign 4, 0
_0203808C: .word 0x021D4150
_02038090: .word sub_02038538
	thumb_func_end sub_02038070

	thumb_func_start sub_02038094
sub_02038094: ; 0x02038094
	push {r3, lr}
	ldr r0, _020380A8 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _020380A6
	ldr r0, _020380AC ; =sub_0203847C
	mov r1, #5
	bl sub_020381C0
_020380A6:
	pop {r3, pc}
	.balign 4, 0
_020380A8: .word 0x021D4150
_020380AC: .word sub_0203847C
	thumb_func_end sub_02038094

	thumb_func_start sub_020380B0
sub_020380B0: ; 0x020380B0
	push {r3, lr}
	ldr r0, _020380C8 ; =0x021D4150
	ldr r1, [r0]
	cmp r1, #0
	beq _020380C4
	mov r0, #1
	add r1, #0x57
	strb r0, [r1]
	bl sub_02033AA4
_020380C4:
	pop {r3, pc}
	nop
_020380C8: .word 0x021D4150
	thumb_func_end sub_020380B0

	thumb_func_start sub_020380CC
sub_020380CC: ; 0x020380CC
	push {r3, lr}
	ldr r0, _020380EC ; =0x021D4150
	ldr r1, [r0]
	cmp r1, #0
	beq _020380E8
	mov r0, #1
	add r1, #0x57
	strb r0, [r1]
	bl sub_02033AA4
	ldr r0, _020380F0 ; =sub_020388A8
	mov r1, #0
	bl sub_020381C0
_020380E8:
	pop {r3, pc}
	nop
_020380EC: .word 0x021D4150
_020380F0: .word sub_020388A8
	thumb_func_end sub_020380CC

	thumb_func_start sub_020380F4
sub_020380F4: ; 0x020380F4
	ldr r0, _02038100 ; =0x021D4150
	mov r1, #0x12
	ldr r0, [r0]
	add r0, #0x4e
	strb r1, [r0]
	bx lr
	.balign 4, 0
_02038100: .word 0x021D4150
	thumb_func_end sub_020380F4

	thumb_func_start sub_02038104
sub_02038104: ; 0x02038104
	ldr r0, _02038110 ; =0x021D4150
	mov r1, #9
	ldr r0, [r0]
	add r0, #0x4e
	strb r1, [r0]
	bx lr
	.balign 4, 0
_02038110: .word 0x021D4150
	thumb_func_end sub_02038104

	thumb_func_start sub_02038114
sub_02038114: ; 0x02038114
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02037474
	cmp r0, #0
	bne _0203813C
	ldr r2, _02038140 ; =0x00007080
	mov r0, #3
	mov r1, #0xf
	bl sub_0201A91C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02037C98
	ldr r0, _02038144 ; =sub_02038E00
	mov r1, #0
	bl sub_020381C0
_0203813C:
	pop {r3, r4, r5, pc}
	nop
_02038140: .word 0x00007080
_02038144: .word sub_02038E00
	thumb_func_end sub_02038114

	thumb_func_start sub_02038148
sub_02038148: ; 0x02038148
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02037474
	cmp r0, #0
	bne _02038170
	ldr r2, _02038174 ; =0x00007080
	mov r0, #3
	mov r1, #0xf
	bl sub_0201A91C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02037C98
	ldr r0, _02038178 ; =sub_02038E48
	mov r1, #0
	bl sub_020381C0
_02038170:
	pop {r3, r4, r5, pc}
	nop
_02038174: .word 0x00007080
_02038178: .word sub_02038E48
	thumb_func_end sub_02038148

	thumb_func_start sub_0203817C
sub_0203817C: ; 0x0203817C
	push {r3, lr}
	ldr r0, _020381BC ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _0203818E
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _0203818E
	blx r0
_0203818E:
	bl sub_02039998
	cmp r0, #0
	beq _020381A4
	bl ov00_021EC9D4
	mov r1, #3
	sub r0, r1, r0
	bl sub_0203A930
	pop {r3, pc}
_020381A4:
	bl sub_02035650
	cmp r0, #0
	beq _020381B8
	bl sub_020DEF44
	mov r1, #3
	sub r0, r1, r0
	bl sub_0203A930
_020381B8:
	pop {r3, pc}
	nop
_020381BC: .word 0x021D4150
	thumb_func_end sub_0203817C

	thumb_func_start sub_020381C0
sub_020381C0: ; 0x020381C0
	ldr r2, _020381CC ; =0x021D4150
	ldr r3, [r2]
	str r0, [r3, #0x24]
	ldr r0, [r2]
	str r1, [r0, #0x44]
	bx lr
	.balign 4, 0
_020381CC: .word 0x021D4150
	thumb_func_end sub_020381C0

	thumb_func_start sub_020381D0
sub_020381D0: ; 0x020381D0
	push {r3, lr}
	bl sub_02039998
	cmp r0, #0
	bne _020381EC
	bl sub_02035664
	cmp r0, #0
	beq _020381F4
	bl sub_020374E4
	mov r0, #1
	bl sub_020350A8
_020381EC:
	ldr r0, _020381F8 ; =sub_02038404
	mov r1, #0
	bl sub_020381C0
_020381F4:
	pop {r3, pc}
	nop
_020381F8: .word sub_02038404
	thumb_func_end sub_020381D0

	thumb_func_start sub_020381FC
sub_020381FC: ; 0x020381FC
	push {r3, lr}
	bl sub_02034FE8
	cmp r0, #0
	beq _02038212
	bl sub_0203622C
	ldr r0, _02038214 ; =sub_020381D0
	mov r1, #0
	bl sub_020381C0
_02038212:
	pop {r3, pc}
	.balign 4, 0
_02038214: .word sub_020381D0
	thumb_func_end sub_020381FC

	thumb_func_start sub_02038218
sub_02038218: ; 0x02038218
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _02038256
	ldr r0, _02038258 ; =0x021D4150
	mov r1, #1
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bl sub_02034B0C
	ldr r0, _02038258 ; =0x021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x28]
	ldr r1, [r1, #0x30]
	bl sub_02034354
	mov r0, #1
	add r1, r0, #0
	lsl r2, r0, #9
	add r3, r0, #0
	bl sub_02035ED8
	cmp r0, #0
	beq _02038256
	bl sub_02035FD8
	ldr r0, _0203825C ; =sub_02038260
	mov r1, #0
	bl sub_020381C0
_02038256:
	pop {r3, pc}
	.balign 4, 0
_02038258: .word 0x021D4150
_0203825C: .word sub_02038260
	thumb_func_end sub_02038218

	thumb_func_start sub_02038260
sub_02038260: ; 0x02038260
	push {r3, lr}
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	beq _02038276
	ldr r0, _02038278 ; =sub_0203827C
	mov r1, #0
	bl sub_020381C0
_02038276:
	pop {r3, pc}
	.balign 4, 0
_02038278: .word sub_0203827C
	thumb_func_end sub_02038260

	thumb_func_start sub_0203827C
sub_0203827C: ; 0x0203827C
	push {r3, lr}
	bl sub_02037474
	cmp r0, #0
	bne _0203828E
	ldr r0, _02038290 ; =sub_02038408
	mov r1, #0
	bl sub_020381C0
_0203828E:
	pop {r3, pc}
	.balign 4, 0
_02038290: .word sub_02038408
	thumb_func_end sub_0203827C

	thumb_func_start sub_02038294
sub_02038294: ; 0x02038294
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _020382D0
	ldr r0, _020382D4 ; =0x021D4150
	mov r1, #1
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bl sub_02034B0C
	ldr r0, _020382D4 ; =0x021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x28]
	ldr r1, [r1, #0x30]
	bl sub_02034354
	mov r0, #1
	add r1, r0, #0
	lsl r2, r0, #9
	bl sub_02035F14
	cmp r0, #0
	beq _020382D0
	bl sub_02035FD8
	ldr r0, _020382D8 ; =sub_020382DC
	mov r1, #0
	bl sub_020381C0
_020382D0:
	pop {r3, pc}
	nop
_020382D4: .word 0x021D4150
_020382D8: .word sub_020382DC
	thumb_func_end sub_02038294

	thumb_func_start sub_020382DC
sub_020382DC: ; 0x020382DC
	ldr r3, _020382E0 ; =sub_0203528C
	bx r3
	.balign 4, 0
_020382E0: .word sub_0203528C
	thumb_func_end sub_020382DC

	thumb_func_start sub_020382E4
sub_020382E4: ; 0x020382E4
	push {r3, lr}
	bl sub_0203528C
	ldr r0, _02038304 ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x4d
	ldrb r0, [r0]
	bl sub_020360E4
	cmp r0, #0
	beq _02038302
	ldr r0, _02038308 ; =sub_0203830C
	mov r1, #0xa
	bl sub_020381C0
_02038302:
	pop {r3, pc}
	.balign 4, 0
_02038304: .word 0x021D4150
_02038308: .word sub_0203830C
	thumb_func_end sub_020382E4

	thumb_func_start sub_0203830C
sub_0203830C: ; 0x0203830C
	push {r3, lr}
	bl sub_02037700
	cmp r0, #0
	beq _0203831E
	ldr r0, _0203833C ; =sub_02038344
	mov r1, #0
	bl sub_020381C0
_0203831E:
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	beq _0203833A
	bl sub_0203769C
	cmp r0, #0
	beq _0203833A
	ldr r0, _02038340 ; =sub_02038398
	mov r1, #0
	bl sub_020381C0
_0203833A:
	pop {r3, pc}
	.balign 4, 0
_0203833C: .word sub_02038344
_02038340: .word sub_02038398
	thumb_func_end sub_0203830C

	thumb_func_start sub_02038344
sub_02038344: ; 0x02038344
	push {r3, lr}
	bl sub_02034FE8
	ldr r0, _02038354 ; =sub_02038358
	mov r1, #2
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02038354: .word sub_02038358
	thumb_func_end sub_02038344

	thumb_func_start sub_02038358
sub_02038358: ; 0x02038358
	push {r3, lr}
	ldr r0, _02038390 ; =0x021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _0203836A
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_0203836A:
	bl sub_02035664
	cmp r0, #0
	beq _0203838C
	mov r1, #1
	mov r0, #0
	lsl r2, r1, #9
	bl sub_02035F14
	cmp r0, #0
	beq _0203838C
	bl sub_02035FD8
	ldr r0, _02038394 ; =sub_020382E4
	mov r1, #0xa
	bl sub_020381C0
_0203838C:
	pop {r3, pc}
	nop
_02038390: .word 0x021D4150
_02038394: .word sub_020382E4
	thumb_func_end sub_02038358

	thumb_func_start sub_02038398
sub_02038398: ; 0x02038398
	push {r3, lr}
	bl sub_02037474
	cmp r0, #0
	bne _020383AA
	ldr r0, _020383AC ; =sub_02038408
	mov r1, #0
	bl sub_020381C0
_020383AA:
	pop {r3, pc}
	.balign 4, 0
_020383AC: .word sub_02038408
	thumb_func_end sub_02038398

	thumb_func_start sub_020383B0
sub_020383B0: ; 0x020383B0
	push {r3, lr}
	bl sub_02034FE8
	ldr r0, _020383C0 ; =sub_020383C4
	mov r1, #2
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_020383C0: .word sub_020383C4
	thumb_func_end sub_020383B0

	thumb_func_start sub_020383C4
sub_020383C4: ; 0x020383C4
	push {r3, lr}
	ldr r0, _020383FC ; =0x021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _020383D6
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_020383D6:
	bl sub_02035664
	cmp r0, #0
	beq _020383F8
	mov r1, #1
	mov r0, #0
	lsl r2, r1, #9
	bl sub_02035F14
	cmp r0, #0
	beq _020383F8
	bl sub_02035FD8
	ldr r0, _02038400 ; =sub_020382DC
	mov r1, #0xa
	bl sub_020381C0
_020383F8:
	pop {r3, pc}
	nop
_020383FC: .word 0x021D4150
_02038400: .word sub_020382DC
	thumb_func_end sub_020383C4

	thumb_func_start sub_02038404
sub_02038404: ; 0x02038404
	bx lr
	.balign 4, 0
	thumb_func_end sub_02038404

	thumb_func_start sub_02038408
sub_02038408: ; 0x02038408
	push {r3, lr}
	bl sub_02037474
	cmp r0, #0
	bne _02038416
	bl sub_02037D2C
_02038416:
	pop {r3, pc}
	thumb_func_end sub_02038408

	thumb_func_start sub_02038418
sub_02038418: ; 0x02038418
	push {r3, lr}
	bl sub_02037454
	cmp r0, #1
	bgt _02038434
	mov r0, #0
	bl sub_02033ACC
	bl sub_0203624C
	ldr r0, _02038458 ; =sub_02038538
	mov r1, #0
	bl sub_020381C0
_02038434:
	ldr r0, _0203845C ; =0x021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _02038444
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_02038444:
	mov r0, #0
	bl sub_02033ACC
	bl sub_0203624C
	ldr r0, _02038458 ; =sub_02038538
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02038458: .word sub_02038538
_0203845C: .word 0x021D4150
	thumb_func_end sub_02038418

	thumb_func_start sub_02038460
sub_02038460: ; 0x02038460
	push {r3, lr}
	bl sub_02034FE8
	cmp r0, #0
	beq _02038476
	bl sub_0203622C
	ldr r0, _02038478 ; =sub_02038538
	mov r1, #0
	bl sub_020381C0
_02038476:
	pop {r3, pc}
	.balign 4, 0
_02038478: .word sub_02038538
	thumb_func_end sub_02038460

	thumb_func_start sub_0203847C
sub_0203847C: ; 0x0203847C
	push {r3, lr}
	ldr r0, _020384AC ; =0x021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _0203848C
	sub r0, r0, #1
	str r0, [r1, #0x44]
_0203848C:
	bl sub_02034FE8
	cmp r0, #0
	beq _020384AA
	ldr r0, _020384AC ; =0x021D4150
	ldr r0, [r0]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	bne _020384AA
	bl sub_02036024
	ldr r0, _020384B0 ; =sub_02038408
	mov r1, #0
	bl sub_020381C0
_020384AA:
	pop {r3, pc}
	.balign 4, 0
_020384AC: .word 0x021D4150
_020384B0: .word sub_02038408
	thumb_func_end sub_0203847C

	thumb_func_start sub_020384B4
sub_020384B4: ; 0x020384B4
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _020384FC
	ldr r0, _02038500 ; =0x021D4150
	mov r1, #1
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bl sub_02034B0C
	ldr r0, _02038500 ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x4a
	ldrb r0, [r0]
	bl sub_02033908
	ldr r0, _02038500 ; =0x021D4150
	mov r1, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bl sub_02034354
	mov r0, #1
	add r1, r0, #0
	lsl r2, r0, #9
	bl sub_02035F14
	cmp r0, #0
	beq _020384FC
	bl sub_02035FD8
	ldr r0, _02038504 ; =sub_02038508
	mov r1, #0x40
	bl sub_020381C0
_020384FC:
	pop {r3, pc}
	nop
_02038500: .word 0x021D4150
_02038504: .word sub_02038508
	thumb_func_end sub_020384B4

	thumb_func_start sub_02038508
sub_02038508: ; 0x02038508
	push {r3, lr}
	bl sub_0203528C
	ldr r0, _02038530 ; =0x021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _0203851E
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_0203851E:
	bl sub_02034FE8
	cmp r0, #0
	beq _0203852E
	ldr r0, _02038534 ; =sub_02038550
	mov r1, #0
	bl sub_020381C0
_0203852E:
	pop {r3, pc}
	.balign 4, 0
_02038530: .word 0x021D4150
_02038534: .word sub_02038550
	thumb_func_end sub_02038508

	thumb_func_start sub_02038538
sub_02038538: ; 0x02038538
	push {r3, lr}
	bl sub_02034FE8
	cmp r0, #0
	beq _0203854A
	ldr r0, _0203854C ; =sub_02038550
	mov r1, #0
	bl sub_020381C0
_0203854A:
	pop {r3, pc}
	.balign 4, 0
_0203854C: .word sub_02038550
	thumb_func_end sub_02038538

	thumb_func_start sub_02038550
sub_02038550: ; 0x02038550
	push {r3, r4, r5, lr}
	bl sub_02035664
	cmp r0, #0
	beq _020385A8
	ldr r1, _020385AC ; =0x021D4150
	mov r2, #2
	ldr r1, [r1]
	mov r0, #0
	add r1, #0x52
	ldrb r1, [r1]
	lsl r2, r2, #8
	mov r3, #1
	bl sub_02035ED8
	cmp r0, #0
	beq _020385A8
	ldr r0, _020385AC ; =0x021D4150
	ldr r4, [r0]
	add r5, r4, #0
	add r5, #0xc
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	ldr r2, [r4, #0xc]
	ldr r3, [r5, #4]
	bl _ll_mul
	ldr r2, [r5, #0x10]
	ldr r3, [r5, #0x14]
	add r0, r2, r0
	adc r3, r1
	str r0, [r4, #0xc]
	str r3, [r5, #4]
	bl sub_02035FD8
	ldr r0, _020385AC ; =0x021D4150
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x52
	strb r1, [r0]
	ldr r0, _020385B0 ; =sub_020385B8
	ldr r1, _020385B4 ; =0x00002710
	bl sub_020381C0
_020385A8:
	pop {r3, r4, r5, pc}
	nop
_020385AC: .word 0x021D4150
_020385B0: .word sub_020385B8
_020385B4: .word 0x00002710
	thumb_func_end sub_02038550

	thumb_func_start sub_020385B8
sub_020385B8: ; 0x020385B8
	push {r3, lr}
	bl sub_020358B0
	cmp r0, #0
	bne _020385F2
	bl sub_020376F8
	cmp r0, #0
	beq _020385E2
	ldr r0, _02038604 ; =0x021D4150
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x52
	strb r1, [r0]
	bl sub_0203A880
	ldr r0, _02038608 ; =sub_02038854
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_020385E2:
	ldr r0, _02038604 ; =0x021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _020385F2
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_020385F2:
	bl sub_02034FE8
	cmp r0, #0
	beq _02038602
	ldr r0, _0203860C ; =sub_02038610
	mov r1, #0
	bl sub_020381C0
_02038602:
	pop {r3, pc}
	.balign 4, 0
_02038604: .word 0x021D4150
_02038608: .word sub_02038854
_0203860C: .word sub_02038610
	thumb_func_end sub_020385B8

	thumb_func_start sub_02038610
sub_02038610: ; 0x02038610
	push {r3, r4, r5, lr}
	bl sub_02035664
	cmp r0, #0
	beq _0203865C
	mov r0, #0
	mov r2, #2
	add r1, r0, #0
	lsl r2, r2, #8
	bl sub_02035F14
	cmp r0, #0
	beq _0203865C
	bl sub_02035FD8
	ldr r0, _02038660 ; =0x021D4150
	ldr r4, [r0]
	add r5, r4, #0
	add r5, #0xc
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	ldr r2, [r4, #0xc]
	ldr r3, [r5, #4]
	bl _ll_mul
	ldr r2, [r5, #0x10]
	ldr r3, [r5, #0x14]
	add r0, r2, r0
	adc r3, r1
	str r0, [r4, #0xc]
	mov r1, #0
	ldr r0, _02038664 ; =sub_02038508
	lsr r2, r3, #0x1b
	lsl r1, r1, #5
	orr r1, r2
	str r3, [r5, #4]
	bl sub_020381C0
_0203865C:
	pop {r3, r4, r5, pc}
	nop
_02038660: .word 0x021D4150
_02038664: .word sub_02038508
	thumb_func_end sub_02038610

	thumb_func_start sub_02038668
sub_02038668: ; 0x02038668
	push {r3, lr}
	bl sub_02034FE8
	cmp r0, #0
	beq _0203867A
	ldr r0, _0203867C ; =sub_02038680
	mov r1, #0
	bl sub_020381C0
_0203867A:
	pop {r3, pc}
	.balign 4, 0
_0203867C: .word sub_02038680
	thumb_func_end sub_02038668

	thumb_func_start sub_02038680
sub_02038680: ; 0x02038680
	push {r3, lr}
	bl sub_02035664
	cmp r0, #0
	beq _020386A6
	mov r0, #0
	mov r2, #2
	add r1, r0, #0
	lsl r2, r2, #8
	bl sub_02035F14
	cmp r0, #0
	beq _020386A6
	bl sub_02035FD8
	ldr r0, _020386A8 ; =sub_020386AC
	mov r1, #0x64
	bl sub_020381C0
_020386A6:
	pop {r3, pc}
	.balign 4, 0
_020386A8: .word sub_020386AC
	thumb_func_end sub_02038680

	thumb_func_start sub_020386AC
sub_020386AC: ; 0x020386AC
	push {r3, lr}
	ldr r0, _02038704 ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x4d
	ldrb r0, [r0]
	bl sub_020351AC
	cmp r0, #0
	beq _020386D8
	ldr r0, _02038704 ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x4d
	ldrb r0, [r0]
	bl sub_020360E4
	cmp r0, #0
	beq _020386D8
	ldr r0, _02038708 ; =sub_02038710
	mov r1, #0x64
	bl sub_020381C0
	pop {r3, pc}
_020386D8:
	bl sub_02037700
	cmp r0, #0
	beq _020386EA
	ldr r0, _0203870C ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_020386EA:
	ldr r0, _02038704 ; =0x021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _020386FA
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_020386FA:
	ldr r0, _0203870C ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02038704: .word 0x021D4150
_02038708: .word sub_02038710
_0203870C: .word sub_02038804
	thumb_func_end sub_020386AC

	thumb_func_start sub_02038710
sub_02038710: ; 0x02038710
	push {r3, lr}
	bl sub_02037700
	cmp r0, #0
	beq _02038724
	ldr r0, _02038760 ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038724:
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	beq _02038744
	ldr r0, _02038764 ; =0x021D4150
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x4c
	strb r1, [r0]
	ldr r0, _02038768 ; =sub_0203876C
	mov r1, #0x78
	bl sub_020381C0
	pop {r3, pc}
_02038744:
	ldr r0, _02038764 ; =0x021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _02038754
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_02038754:
	ldr r0, _02038760 ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	nop
_02038760: .word sub_02038804
_02038764: .word 0x021D4150
_02038768: .word sub_0203876C
	thumb_func_end sub_02038710

	thumb_func_start sub_0203876C
sub_0203876C: ; 0x0203876C
	push {r3, lr}
	bl sub_02037700
	cmp r0, #0
	beq _02038780
	ldr r0, _020387D4 ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038780:
	ldr r0, _020387D8 ; =0x021D4150
	ldr r1, [r0]
	add r0, r1, #0
	add r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #2
	bne _02038798
	ldr r0, _020387DC ; =sub_02038800
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038798:
	cmp r0, #1
	bne _020387AA
	bl sub_02034434
	ldr r0, _020387E0 ; =sub_020387E8
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_020387AA:
	ldr r0, [r1, #0x44]
	cmp r0, #0x6e
	ble _020387B8
	ldr r1, _020387E4 ; =0x0210F90C
	mov r0, #6
	bl sub_020376E0
_020387B8:
	ldr r0, _020387D8 ; =0x021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _020387C8
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_020387C8:
	ldr r0, _020387D4 ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	nop
_020387D4: .word sub_02038804
_020387D8: .word 0x021D4150
_020387DC: .word sub_02038800
_020387E0: .word sub_020387E8
_020387E4: .word 0x0210F90C
	thumb_func_end sub_0203876C

	thumb_func_start sub_020387E8
sub_020387E8: ; 0x020387E8
	push {r3, lr}
	bl sub_02037700
	cmp r0, #0
	beq _020387FA
	ldr r0, _020387FC ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
_020387FA:
	pop {r3, pc}
	.balign 4, 0
_020387FC: .word sub_02038804
	thumb_func_end sub_020387E8

	thumb_func_start sub_02038800
sub_02038800: ; 0x02038800
	bx lr
	.balign 4, 0
	thumb_func_end sub_02038800

	thumb_func_start sub_02038804
sub_02038804: ; 0x02038804
	push {r3, lr}
	ldr r0, _02038848 ; =0x021D4150
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x4c
	strb r1, [r0]
	bl sub_02034FE8
	cmp r0, #0
	beq _02038844
	ldr r0, _02038848 ; =0x021D4150
	ldr r1, [r0]
	add r0, r1, #0
	add r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq _0203883C
	add r0, r1, #0
	add r0, #0x48
	ldrh r0, [r0]
	add r1, #0x48
	sub r0, r0, #1
	strh r0, [r1]
	ldr r0, _0203884C ; =sub_02038680
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_0203883C:
	ldr r0, _02038850 ; =sub_02038800
	mov r1, #0
	bl sub_020381C0
_02038844:
	pop {r3, pc}
	nop
_02038848: .word 0x021D4150
_0203884C: .word sub_02038680
_02038850: .word sub_02038800
	thumb_func_end sub_02038804

	thumb_func_start sub_02038854
sub_02038854: ; 0x02038854
	push {r3, lr}
	bl sub_020376F8
	cmp r0, #0
	bne _02038878
	bl sub_02039918
	cmp r0, #0
	bne _02038884
	bl sub_02034FE8
	cmp r0, #0
	beq _02038884
	ldr r0, _020388A0 ; =sub_02038610
	mov r1, #0
	bl sub_020381C0
	b _02038884
_02038878:
	bl sub_0203769C
	cmp r0, #0
	bne _02038884
	bl sub_02034638
_02038884:
	bl sub_02037700
	cmp r0, #0
	beq _0203889C
	bl sub_02039918
	cmp r0, #0
	bne _0203889C
	ldr r0, _020388A4 ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
_0203889C:
	pop {r3, pc}
	nop
_020388A0: .word sub_02038610
_020388A4: .word sub_02038804
	thumb_func_end sub_02038854

	thumb_func_start sub_020388A8
sub_020388A8: ; 0x020388A8
	push {r3, lr}
	bl sub_02035664
	cmp r0, #0
	beq _020388D6
	ldr r1, _020388D8 ; =0x021D4150
	mov r0, #0
	ldr r1, [r1]
	mov r2, #2
	add r1, #0x52
	ldrb r1, [r1]
	lsl r2, r2, #8
	add r3, r0, #0
	bl sub_02035ED8
	cmp r0, #0
	beq _020388D6
	bl sub_02035FD8
	ldr r0, _020388DC ; =sub_02038404
	mov r1, #0
	bl sub_020381C0
_020388D6:
	pop {r3, pc}
	.balign 4, 0
_020388D8: .word 0x021D4150
_020388DC: .word sub_02038404
	thumb_func_end sub_020388A8

	thumb_func_start sub_020388E0
sub_020388E0: ; 0x020388E0
	push {r3, lr}
	ldr r0, _02038914 ; =0x021D4150
	mov r1, #0xd
	ldr r0, [r0]
	add r0, #0x4e
	strb r1, [r0]
	bl sub_0203769C
	cmp r0, #0
	add r0, sp, #0
	bne _02038906
	mov r1, #0
	strb r1, [r0, #1]
	add r1, sp, #0
	mov r0, #0xa
	add r1, #1
	bl sub_020376E0
	pop {r3, pc}
_02038906:
	mov r1, #0
	strb r1, [r0]
	mov r0, #0xa
	add r1, sp, #0
	bl sub_020376E0
	pop {r3, pc}
	.balign 4, 0
_02038914: .word 0x021D4150
	thumb_func_end sub_020388E0

	thumb_func_start sub_02038918
sub_02038918: ; 0x02038918
	ldr r1, _02038930 ; =0x021D4150
	ldr r3, _02038934 ; =sub_020381C0
	ldr r2, [r1]
	add r2, #0x4d
	strb r0, [r2]
	ldr r0, [r1]
	mov r2, #3
	add r0, #0x48
	strh r2, [r0]
	ldr r0, _02038938 ; =sub_020389BC
	mov r1, #0
	bx r3
	.balign 4, 0
_02038930: .word 0x021D4150
_02038934: .word sub_020381C0
_02038938: .word sub_020389BC
	thumb_func_end sub_02038918

	thumb_func_start sub_0203893C
sub_0203893C: ; 0x0203893C
	ldr r0, _02038948 ; =0x021D4150
	mov r1, #7
	ldr r0, [r0]
	add r0, #0x4e
	strb r1, [r0]
	bx lr
	.balign 4, 0
_02038948: .word 0x021D4150
	thumb_func_end sub_0203893C

	thumb_func_start sub_0203894C
sub_0203894C: ; 0x0203894C
	push {r3, lr}
	ldr r1, _02038974 ; =0x021D4150
	ldr r2, [r1]
	add r2, #0x4d
	strb r0, [r2]
	ldr r0, [r1]
	mov r2, #7
	add r0, #0x4e
	strb r2, [r0]
	ldr r0, [r1]
	mov r2, #3
	add r0, #0x48
	strh r2, [r0]
	bl sub_0203A880
	ldr r0, _02038978 ; =sub_02038668
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02038974: .word 0x021D4150
_02038978: .word sub_02038668
	thumb_func_end sub_0203894C

	thumb_func_start sub_0203897C
sub_0203897C: ; 0x0203897C
	ldr r0, _02038988 ; =0x021D4150
	mov r1, #0x1a
	ldr r0, [r0]
	add r0, #0x4e
	strb r1, [r0]
	bx lr
	.balign 4, 0
_02038988: .word 0x021D4150
	thumb_func_end sub_0203897C

	thumb_func_start sub_0203898C
sub_0203898C: ; 0x0203898C
	push {r3, lr}
	ldr r1, _020389B4 ; =0x021D4150
	ldr r2, [r1]
	add r2, #0x4d
	strb r0, [r2]
	ldr r0, [r1]
	mov r2, #0x1a
	add r0, #0x4e
	strb r2, [r0]
	ldr r0, [r1]
	mov r2, #3
	add r0, #0x48
	strh r2, [r0]
	bl sub_0203A880
	ldr r0, _020389B8 ; =sub_02038668
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_020389B4: .word 0x021D4150
_020389B8: .word sub_02038668
	thumb_func_end sub_0203898C

	thumb_func_start sub_020389BC
sub_020389BC: ; 0x020389BC
	push {r3, lr}
	bl sub_02034FE8
	cmp r0, #0
	beq _020389CE
	ldr r0, _020389D0 ; =sub_020389D4
	mov r1, #0
	bl sub_020381C0
_020389CE:
	pop {r3, pc}
	.balign 4, 0
_020389D0: .word sub_020389D4
	thumb_func_end sub_020389BC

	thumb_func_start sub_020389D4
sub_020389D4: ; 0x020389D4
	push {r3, lr}
	bl sub_02035664
	cmp r0, #0
	beq _02038A04
	ldr r0, _02038A08 ; =0x021D4150
	mov r2, #2
	ldr r0, [r0]
	mov r1, #0xd
	add r0, #0x4e
	strb r1, [r0]
	mov r0, #0
	add r1, r0, #0
	lsl r2, r2, #8
	bl sub_02035F14
	cmp r0, #0
	beq _02038A04
	bl sub_02035FE4
	ldr r0, _02038A0C ; =sub_02038A10
	mov r1, #0x64
	bl sub_020381C0
_02038A04:
	pop {r3, pc}
	nop
_02038A08: .word 0x021D4150
_02038A0C: .word sub_02038A10
	thumb_func_end sub_020389D4

	thumb_func_start sub_02038A10
sub_02038A10: ; 0x02038A10
	push {r3, lr}
	ldr r0, _02038A84 ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x4d
	ldrb r0, [r0]
	bl sub_020351AC
	cmp r0, #0
	beq _02038A3C
	ldr r0, _02038A84 ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x4d
	ldrb r0, [r0]
	bl sub_020360E4
	cmp r0, #0
	beq _02038A3C
	ldr r0, _02038A88 ; =sub_02038A94
	mov r1, #0x64
	bl sub_020381C0
	pop {r3, pc}
_02038A3C:
	bl sub_02037700
	cmp r0, #0
	bne _02038A4E
	ldr r0, _02038A84 ; =0x021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	bne _02038A7C
_02038A4E:
	ldr r1, _02038A84 ; =0x021D4150
	ldr r2, [r1]
	add r0, r2, #0
	add r0, #0x48
	ldrh r0, [r0]
	add r2, #0x48
	sub r0, r0, #1
	strh r0, [r2]
	ldr r0, [r1]
	add r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _02038A72
	ldr r0, _02038A8C ; =sub_02038800
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038A72:
	ldr r0, _02038A90 ; =sub_020389BC
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038A7C:
	beq _02038A82
	sub r0, r0, #1
	str r0, [r1, #0x44]
_02038A82:
	pop {r3, pc}
	.balign 4, 0
_02038A84: .word 0x021D4150
_02038A88: .word sub_02038A94
_02038A8C: .word sub_02038800
_02038A90: .word sub_020389BC
	thumb_func_end sub_02038A10

	thumb_func_start sub_02038A94
sub_02038A94: ; 0x02038A94
	push {r3, lr}
	ldr r0, _02038B2C ; =0x021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0x5a
	ble _02038AA6
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_02038AA6:
	bl sub_02037700
	cmp r0, #0
	beq _02038ADC
	ldr r1, _02038B2C ; =0x021D4150
	ldr r2, [r1]
	add r0, r2, #0
	add r0, #0x48
	ldrh r0, [r0]
	add r2, #0x48
	sub r0, r0, #1
	strh r0, [r2]
	ldr r0, [r1]
	add r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _02038AD2
	ldr r0, _02038B30 ; =sub_02038800
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038AD2:
	ldr r0, _02038B34 ; =sub_020389BC
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038ADC:
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	beq _02038AF2
	ldr r0, _02038B38 ; =sub_020387E8
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038AF2:
	ldr r1, _02038B2C ; =0x021D4150
	ldr r2, [r1]
	ldr r0, [r2, #0x44]
	cmp r0, #0
	beq _02038B02
	sub r0, r0, #1
	str r0, [r2, #0x44]
	pop {r3, pc}
_02038B02:
	add r0, r2, #0
	add r0, #0x48
	ldrh r0, [r0]
	add r2, #0x48
	sub r0, r0, #1
	strh r0, [r2]
	ldr r0, [r1]
	add r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _02038B22
	ldr r0, _02038B30 ; =sub_02038800
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038B22:
	ldr r0, _02038B34 ; =sub_020389BC
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02038B2C: .word 0x021D4150
_02038B30: .word sub_02038800
_02038B34: .word sub_020389BC
_02038B38: .word sub_020387E8
	thumb_func_end sub_02038A94

	thumb_func_start sub_02038B3C
sub_02038B3C: ; 0x02038B3C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl sub_0203769C
	cmp r0, #0
	bne _02038B8A
	ldr r6, _02038B8C ; =0x0210F90C
	mov r3, #1
	mov r2, #0
_02038B50:
	ldrb r1, [r6]
	ldrb r0, [r4, r2]
	cmp r1, r0
	beq _02038B5C
	mov r3, #0
	b _02038B64
_02038B5C:
	add r2, r2, #1
	add r6, r6, #1
	cmp r2, #6
	blo _02038B50
_02038B64:
	cmp r3, #0
	beq _02038B80
	ldr r0, _02038B90 ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x57
	ldrb r0, [r0]
	cmp r0, #0
	bne _02038B80
	ldr r1, _02038B94 ; =0x0210F904
	mov r0, #7
	strb r5, [r1]
	bl sub_02037184
	pop {r4, r5, r6, pc}
_02038B80:
	ldr r1, _02038B98 ; =0x0210F914
	mov r0, #7
	strb r5, [r1]
	bl sub_02037184
_02038B8A:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02038B8C: .word 0x0210F90C
_02038B90: .word 0x021D4150
_02038B94: .word 0x0210F904
_02038B98: .word 0x0210F914
	thumb_func_end sub_02038B3C

	thumb_func_start sub_02038B9C
sub_02038B9C: ; 0x02038B9C
	push {r3, r4, r5, lr}
	mov r4, #1
	ldr r5, _02038C0C ; =0x0210F905
	add r3, r4, #0
_02038BA4:
	ldrb r1, [r5]
	ldrb r0, [r2, r3]
	cmp r1, r0
	beq _02038BB0
	mov r4, #0
	b _02038BB8
_02038BB0:
	add r3, r3, #1
	add r5, r5, #1
	cmp r3, #6
	blo _02038BA4
_02038BB8:
	cmp r4, #0
	beq _02038BD2
	ldrb r4, [r2]
	bl sub_0203769C
	cmp r4, r0
	bne _02038C08
	ldr r0, _02038C10 ; =0x021D4150
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x4c
	strb r1, [r0]
	pop {r3, r4, r5, pc}
_02038BD2:
	mov r4, #1
	ldr r3, _02038C14 ; =0x0210F915
	add r5, r4, #0
_02038BD8:
	ldrb r1, [r3]
	ldrb r0, [r2, r5]
	cmp r1, r0
	beq _02038BE4
	mov r4, #0
	b _02038BEC
_02038BE4:
	add r5, r5, #1
	add r3, r3, #1
	cmp r5, #6
	blo _02038BD8
_02038BEC:
	cmp r4, #0
	beq _02038C08
	ldrb r4, [r2]
	bl sub_0203769C
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r4, r0
	bne _02038C08
	ldr r0, _02038C10 ; =0x021D4150
	mov r1, #2
	ldr r0, [r0]
	add r0, #0x4c
	strb r1, [r0]
_02038C08:
	pop {r3, r4, r5, pc}
	nop
_02038C0C: .word 0x0210F905
_02038C10: .word 0x021D4150
_02038C14: .word 0x0210F915
	thumb_func_end sub_02038B9C

	thumb_func_start sub_02038C18
sub_02038C18: ; 0x02038C18
	mov r0, #6
	bx lr
	thumb_func_end sub_02038C18

	thumb_func_start sub_02038C1C
sub_02038C1C: ; 0x02038C1C
	push {r3, lr}
	ldr r1, _02038C30 ; =0x021D4150
	ldr r1, [r1]
	cmp r1, #0
	beq _02038C2E
	add r1, #0x4a
	strb r0, [r1]
	bl sub_02033908
_02038C2E:
	pop {r3, pc}
	.balign 4, 0
_02038C30: .word 0x021D4150
	thumb_func_end sub_02038C1C

	thumb_func_start sub_02038C34
sub_02038C34: ; 0x02038C34
	ldr r3, _02038C38 ; =sub_0203528C
	bx r3
	.balign 4, 0
_02038C38: .word sub_0203528C
	thumb_func_end sub_02038C34

	thumb_func_start sub_02038C3C
sub_02038C3C: ; 0x02038C3C
	ldr r2, _02038CB4 ; =0x00400131
	cmp r0, r2
	bhi _02038C4C
	bhs _02038C8A
	ldr r2, _02038CB8 ; =0x00000333
	cmp r0, r2
	beq _02038C5E
	bx lr
_02038C4C:
	ldr r1, _02038CBC ; =0x00400286
	cmp r0, r1
	bhi _02038C56
	beq _02038C9E
	bx lr
_02038C56:
	add r1, #0x92
	cmp r0, r1
	beq _02038C76
	bx lr
_02038C5E:
	cmp r1, #0xf
	bne _02038CB0
	ldr r0, _02038CC0 ; =0x021D4150
	ldr r2, [r0]
	add r0, r2, #0
	add r0, #0x58
	ldrb r1, [r0]
	mov r0, #1
	add r2, #0x58
	orr r0, r1
	strb r0, [r2]
	bx lr
_02038C76:
	ldr r0, _02038CC0 ; =0x021D4150
	ldr r2, [r0]
	add r0, r2, #0
	add r0, #0x58
	ldrb r1, [r0]
	mov r0, #1
	add r2, #0x58
	orr r0, r1
	strb r0, [r2]
	bx lr
_02038C8A:
	ldr r0, _02038CC0 ; =0x021D4150
	ldr r2, [r0]
	add r0, r2, #0
	add r0, #0x58
	ldrb r1, [r0]
	mov r0, #2
	add r2, #0x58
	orr r0, r1
	strb r0, [r2]
	bx lr
_02038C9E:
	ldr r0, _02038CC0 ; =0x021D4150
	ldr r2, [r0]
	add r0, r2, #0
	add r0, #0x58
	ldrb r1, [r0]
	mov r0, #4
	add r2, #0x58
	orr r0, r1
	strb r0, [r2]
_02038CB0:
	bx lr
	nop
_02038CB4: .word 0x00400131
_02038CB8: .word 0x00000333
_02038CBC: .word 0x00400286
_02038CC0: .word 0x021D4150
	thumb_func_end sub_02038C3C

	thumb_func_start sub_02038CC4
sub_02038CC4: ; 0x02038CC4
	push {r3, lr}
	mov r0, #1
	add r1, r0, #0
	mov r2, #0x20
	bl sub_02035F14
	cmp r0, #0
	beq _02038CE0
	bl sub_02035FD8
	ldr r0, _02038CE4 ; =sub_02038C34
	mov r1, #0
	bl sub_020381C0
_02038CE0:
	pop {r3, pc}
	nop
_02038CE4: .word sub_02038C34
	thumb_func_end sub_02038CC4

	thumb_func_start sub_02038CE8
sub_02038CE8: ; 0x02038CE8
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _02038D18
	ldr r0, _02038D1C ; =0x021D4150
	mov r1, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bl sub_02034B0C
	ldr r0, _02038D1C ; =0x021D4150
	mov r1, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bl sub_02034354
	ldr r0, _02038D20 ; =sub_02038C3C
	bl sub_02033A7C
	ldr r0, _02038D24 ; =sub_02038CC4
	mov r1, #0
	bl sub_020381C0
_02038D18:
	pop {r3, pc}
	nop
_02038D1C: .word 0x021D4150
_02038D20: .word sub_02038C3C
_02038D24: .word sub_02038CC4
	thumb_func_end sub_02038CE8

	thumb_func_start sub_02038D28
sub_02038D28: ; 0x02038D28
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037474
	cmp r0, #0
	bne _02038D58
	mov r2, #7
	mov r0, #3
	mov r1, #0xf
	lsl r2, r2, #0xc
	bl sub_0201A91C
	add r0, r4, #0
	mov r1, #0x11
	bl sub_02037C98
	ldr r0, _02038D5C ; =0x021D4150
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x4f
	strb r1, [r0]
	ldr r0, _02038D60 ; =sub_02038CE8
	bl sub_020381C0
_02038D58:
	pop {r4, pc}
	nop
_02038D5C: .word 0x021D4150
_02038D60: .word sub_02038CE8
	thumb_func_end sub_02038D28

	thumb_func_start sub_02038D64
sub_02038D64: ; 0x02038D64
	push {r3, lr}
	ldr r0, _02038D78 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _02038D76
	ldr r0, _02038D7C ; =sub_0203847C
	mov r1, #5
	bl sub_020381C0
_02038D76:
	pop {r3, pc}
	.balign 4, 0
_02038D78: .word 0x021D4150
_02038D7C: .word sub_0203847C
	thumb_func_end sub_02038D64

	thumb_func_start sub_02038D80
sub_02038D80: ; 0x02038D80
	ldr r0, _02038D8C ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x58
	ldrb r0, [r0]
	bx lr
	nop
_02038D8C: .word 0x021D4150
	thumb_func_end sub_02038D80

	thumb_func_start sub_02038D90
sub_02038D90: ; 0x02038D90
	push {r3, lr}
	bl sub_02037988
	ldr r0, _02038DF0 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _02038DA2
	mov r0, #1
	pop {r3, pc}
_02038DA2:
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _02038DB2
	cmp r0, #0x19
	beq _02038DB2
	cmp r0, #0x24
	bne _02038DBA
_02038DB2:
	bl ov00_021E6CB8
	mov r0, #1
	pop {r3, pc}
_02038DBA:
	bl sub_02039998
	cmp r0, #0
	beq _02038DE2
	ldr r0, _02038DF0 ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _02038DD8
	ldr r0, _02038DF4 ; =sub_02039D78
	mov r1, #0
	bl sub_020381C0
	b _02038DEA
_02038DD8:
	ldr r0, _02038DF8 ; =sub_020392F4
	mov r1, #0
	bl sub_020381C0
	b _02038DEA
_02038DE2:
	ldr r0, _02038DFC ; =sub_020381FC
	mov r1, #0
	bl sub_020381C0
_02038DEA:
	mov r0, #0
	pop {r3, pc}
	nop
_02038DF0: .word 0x021D4150
_02038DF4: .word sub_02039D78
_02038DF8: .word sub_020392F4
_02038DFC: .word sub_020381FC
	thumb_func_end sub_02038D90

	thumb_func_start sub_02038E00
sub_02038E00: ; 0x02038E00
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _02038E3E
	ldr r0, _02038E40 ; =0x021D4150
	mov r1, #1
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bl sub_02034B0C
	ldr r0, _02038E40 ; =0x021D4150
	mov r1, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bl sub_02034354
	mov r0, #1
	add r1, r0, #0
	lsl r2, r0, #9
	add r3, r0, #0
	bl sub_02035ED8
	cmp r0, #0
	beq _02038E3E
	bl sub_02035FD8
	ldr r0, _02038E44 ; =sub_02038260
	mov r1, #0
	bl sub_020381C0
_02038E3E:
	pop {r3, pc}
	.balign 4, 0
_02038E40: .word 0x021D4150
_02038E44: .word sub_02038260
	thumb_func_end sub_02038E00

	thumb_func_start sub_02038E48
sub_02038E48: ; 0x02038E48
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _02038E84
	ldr r0, _02038E88 ; =0x021D4150
	mov r1, #1
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bl sub_02034B0C
	ldr r0, _02038E88 ; =0x021D4150
	mov r1, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bl sub_02034354
	mov r0, #1
	add r1, r0, #0
	lsl r2, r0, #9
	bl sub_02035F14
	cmp r0, #0
	beq _02038E84
	bl sub_02035FD8
	ldr r0, _02038E8C ; =sub_020382DC
	mov r1, #0
	bl sub_020381C0
_02038E84:
	pop {r3, pc}
	nop
_02038E88: .word 0x021D4150
_02038E8C: .word sub_020382DC
	thumb_func_end sub_02038E48

	thumb_func_start sub_02038E90
sub_02038E90: ; 0x02038E90
	bx lr
	.balign 4, 0
	thumb_func_end sub_02038E90

	thumb_func_start sub_02038E94
sub_02038E94: ; 0x02038E94
	push {r3, lr}
	mov r0, #0
	bl ov00_021E5E54
	cmp r0, #0
	bge _02038EA8
	ldr r0, _02038EAC ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_02038EA8:
	pop {r3, pc}
	nop
_02038EAC: .word sub_02038E90
	thumb_func_end sub_02038E94

	thumb_func_start sub_02038EB0
sub_02038EB0: ; 0x02038EB0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02038EB0

	thumb_func_start sub_02038EB4
sub_02038EB4: ; 0x02038EB4
	bx lr
	.balign 4, 0
	thumb_func_end sub_02038EB4

	thumb_func_start sub_02038EB8
sub_02038EB8: ; 0x02038EB8
	push {r3, lr}
	mov r0, #1
	bl sub_0203786C
	mov r0, #0
	bl ov00_021E5E54
	cmp r0, #0xa
	blt _02038ED8
	cmp r0, #0x14
	bge _02038ED8
	ldr r0, _02038F60 ; =sub_02038EB4
	mov r1, #0
	bl sub_020381C0
	b _02038F3A
_02038ED8:
	cmp r0, #0
	bge _02038EE6
	ldr r0, _02038F64 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	b _02038F3A
_02038EE6:
	cmp r0, #0x17
	bne _02038EF4
	ldr r0, _02038F68 ; =sub_02038E94
	mov r1, #0
	bl sub_020381C0
	b _02038F3A
_02038EF4:
	cmp r0, #0x18
	bne _02038F18
	ldr r0, _02038F6C ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	beq _02038F0E
	ldr r0, _02038F64 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	b _02038F3A
_02038F0E:
	ldr r0, _02038F70 ; =sub_02038EB0
	mov r1, #0
	bl sub_020381C0
	b _02038F3A
_02038F18:
	cmp r0, #0x15
	bne _02038F3A
	ldr r0, _02038F6C ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	beq _02038F32
	ldr r0, _02038F64 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	b _02038F3A
_02038F32:
	ldr r0, _02038F70 ; =sub_02038EB0
	mov r1, #0
	bl sub_020381C0
_02038F3A:
	ldr r0, _02038F6C ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	beq _02038F5E
	bl sub_02037454
	ldr r1, _02038F6C ; =0x021D4150
	ldr r1, [r1]
	add r1, #0x4b
	ldrb r1, [r1]
	cmp r1, r0
	beq _02038F5E
	ldr r0, _02038F64 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_02038F5E:
	pop {r3, pc}
	.balign 4, 0
_02038F60: .word sub_02038EB4
_02038F64: .word sub_02038E90
_02038F68: .word sub_02038E94
_02038F6C: .word 0x021D4150
_02038F70: .word sub_02038EB0
	thumb_func_end sub_02038EB8

	thumb_func_start sub_02038F74
sub_02038F74: ; 0x02038F74
	push {r3, r4}
	ldr r3, _02038F98 ; =0x021D4150
	ldr r4, [r3]
	cmp r4, #0
	beq _02038F94
	add r3, r0, #0
	sub r3, #0x19
	cmp r3, #1
	bls _02038F88
	neg r0, r0
_02038F88:
	str r0, [r4, #0x34]
	ldr r0, _02038F98 ; =0x021D4150
	ldr r3, [r0]
	str r1, [r3, #0x38]
	ldr r0, [r0]
	str r2, [r0, #0x3c]
_02038F94:
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02038F98: .word 0x021D4150
	thumb_func_end sub_02038F74

	thumb_func_start sub_02038F9C
sub_02038F9C: ; 0x02038F9C
	push {r3, lr}
	mov r0, #0
	bl ov00_021E5E54
	cmp r0, #0xa
	blt _02038FB6
	cmp r0, #0x14
	bge _02038FB6
	ldr r0, _02038FFC ; =sub_02038EB4
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038FB6:
	cmp r0, #0
	bge _02038FC4
	ldr r0, _02039000 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038FC4:
	cmp r0, #0x14
	bne _02038FD2
	ldr r0, _02039004 ; =sub_02038EB8
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038FD2:
	cmp r0, #0x15
	bne _02038FE0
	ldr r0, _02039008 ; =sub_02038EB0
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038FE0:
	cmp r0, #0x16
	bne _02038FEE
	ldr r0, _02038FFC ; =sub_02038EB4
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038FEE:
	cmp r0, #0x18
	bne _02038FFA
	ldr r0, _02039008 ; =sub_02038EB0
	mov r1, #0
	bl sub_020381C0
_02038FFA:
	pop {r3, pc}
	.balign 4, 0
_02038FFC: .word sub_02038EB4
_02039000: .word sub_02038E90
_02039004: .word sub_02038EB8
_02039008: .word sub_02038EB0
	thumb_func_end sub_02038F9C

	thumb_func_start sub_0203900C
sub_0203900C: ; 0x0203900C
	push {r3, lr}
	mov r0, #1
	bl ov00_021E5E54
	cmp r0, #0
	bge _02039022
	ldr r0, _02039074 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039022:
	ldr r0, _02039078 ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x4e
	ldrb r0, [r0]
	bl sub_02033FC4
	add r2, r0, #0
	ldr r0, _02039078 ; =0x021D4150
	ldr r1, [r0]
	mov r0, #0x51
	ldrsb r0, [r1, r0]
	add r1, r2, #1
	mov r2, #0
	bl ov00_021E6D7C
	add r0, r0, #3
	cmp r0, #3
	bhi _02039070
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02039052: ; jump table
	.short _02039068 - _02039052 - 2 ; case 0
	.short _02039070 - _02039052 - 2 ; case 1
	.short _02039070 - _02039052 - 2 ; case 2
	.short _0203905A - _02039052 - 2 ; case 3
_0203905A:
	bl sub_0203622C
	ldr r0, _0203907C ; =sub_02038F9C
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039068:
	ldr r0, _02039074 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_02039070:
	pop {r3, pc}
	nop
_02039074: .word sub_02038E90
_02039078: .word 0x021D4150
_0203907C: .word sub_02038F9C
	thumb_func_end sub_0203900C

	thumb_func_start sub_02039080
sub_02039080: ; 0x02039080
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020390B0 ; =0x021D4150
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	ldr r0, _020390B4 ; =sub_02038F9C
	cmp r1, r0
	beq _02039094
	mov r0, #0
	pop {r4, pc}
_02039094:
	ldr r0, _020390B8 ; =sub_02036904
	ldr r1, _020390BC ; =sub_020367A8
	bl ov00_021E5C84
	ldr r0, _020390B0 ; =0x021D4150
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x51
	strb r4, [r0]
	ldr r0, _020390C0 ; =sub_0203900C
	bl sub_020381C0
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_020390B0: .word 0x021D4150
_020390B4: .word sub_02038F9C
_020390B8: .word sub_02036904
_020390BC: .word sub_020367A8
_020390C0: .word sub_0203900C
	thumb_func_end sub_02039080

	thumb_func_start sub_020390C4
sub_020390C4: ; 0x020390C4
	ldr r0, _02039120 ; =0x021D4150
	ldr r1, _02039124 ; =sub_02038F9C
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	cmp r0, r1
	bne _020390D4
	mov r0, #0
	bx lr
_020390D4:
	ldr r1, _02039128 ; =sub_02038EB8
	cmp r0, r1
	bne _020390DE
	mov r0, #1
	bx lr
_020390DE:
	ldr r1, _0203912C ; =sub_02038E94
	cmp r0, r1
	bne _020390E8
	mov r0, #3
	bx lr
_020390E8:
	ldr r1, _02039130 ; =sub_02038EB0
	cmp r0, r1
	bne _020390F2
	mov r0, #4
	bx lr
_020390F2:
	ldr r1, _02039134 ; =sub_02038EB4
	cmp r0, r1
	bne _020390FC
	mov r0, #5
	bx lr
_020390FC:
	ldr r1, _02039138 ; =sub_02039DE4
	cmp r0, r1
	bne _02039106
	mov r0, #0
	bx lr
_02039106:
	ldr r1, _0203913C ; =sub_02039DC4
	cmp r0, r1
	bne _02039110
	mov r0, #1
	bx lr
_02039110:
	ldr r1, _02039140 ; =sub_02039E7C
	cmp r0, r1
	bne _0203911A
	mov r0, #3
	bx lr
_0203911A:
	mov r0, #2
	bx lr
	nop
_02039120: .word 0x021D4150
_02039124: .word sub_02038F9C
_02039128: .word sub_02038EB8
_0203912C: .word sub_02038E94
_02039130: .word sub_02038EB0
_02039134: .word sub_02038EB4
_02039138: .word sub_02039DE4
_0203913C: .word sub_02039DC4
_02039140: .word sub_02039E7C
	thumb_func_end sub_020390C4

	thumb_func_start sub_02039144
sub_02039144: ; 0x02039144
	push {r3, lr}
	ldr r0, _020391BC ; =sub_02036904
	ldr r1, _020391C0 ; =sub_020367A8
	bl ov00_021E5C84
	mov r0, #0
	mvn r0, r0
	mov r1, #4
	mov r2, #1
	bl ov00_021E6D7C
	add r0, r0, #4
	cmp r0, #4
	bhi _0203919A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203916C: ; jump table
	.short _02039198 - _0203916C - 2 ; case 0
	.short _0203918E - _0203916C - 2 ; case 1
	.short _0203919A - _0203916C - 2 ; case 2
	.short _0203919A - _0203916C - 2 ; case 3
	.short _02039176 - _0203916C - 2 ; case 4
_02039176:
	ldr r0, _020391C4 ; =0x021D4150
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x5c
	strb r1, [r0]
	bl sub_0203622C
	ldr r0, _020391C8 ; =sub_02038F9C
	mov r1, #0
	bl sub_020381C0
	b _0203919A
_0203918E:
	ldr r0, _020391CC ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	b _0203919A
_02039198:
	pop {r3, pc}
_0203919A:
	bl ov00_021E6690
	cmp r0, #0
	bge _020391AC
	ldr r0, _020391CC ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_020391AC:
	cmp r0, #0x1a
	bne _020391B8
	ldr r0, _020391CC ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_020391B8:
	pop {r3, pc}
	nop
_020391BC: .word sub_02036904
_020391C0: .word sub_020367A8
_020391C4: .word 0x021D4150
_020391C8: .word sub_02038F9C
_020391CC: .word sub_02038E90
	thumb_func_end sub_02039144

	thumb_func_start sub_020391D0
sub_020391D0: ; 0x020391D0
	push {r3, lr}
	mov r0, #0
	bl sub_0203786C
	ldr r0, _02039214 ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x50
	ldrb r0, [r0]
	bl ov00_021E6BE4
	cmp r0, #0
	beq _020391FE
	bl ov00_021E6C68
	cmp r0, #0
	beq _020391FE
	bl sub_020343E4
	ldr r0, _02039218 ; =sub_02039144
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_020391FE:
	mov r0, #0
	bl ov00_021E5E54
	cmp r0, #0
	bge _02039210
	ldr r0, _0203921C ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_02039210:
	pop {r3, pc}
	nop
_02039214: .word 0x021D4150
_02039218: .word sub_02039144
_0203921C: .word sub_02038E90
	thumb_func_end sub_020391D0

	thumb_func_start sub_02039220
sub_02039220: ; 0x02039220
	push {r3, lr}
	bl sub_0203769C
	cmp r0, #0
	bne _0203923C
	ldr r0, _0203925C ; =0x021D4150
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x50
	strb r1, [r0]
	ldr r0, _02039260 ; =sub_020391D0
	bl sub_020381C0
	b _0203924E
_0203923C:
	ldr r0, _0203925C ; =0x021D4150
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x50
	strb r1, [r0]
	ldr r0, _02039260 ; =sub_020391D0
	mov r1, #0
	bl sub_020381C0
_0203924E:
	ldr r0, _0203925C ; =0x021D4150
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x5c
	strb r1, [r0]
	pop {r3, pc}
	nop
_0203925C: .word 0x021D4150
_02039260: .word sub_020391D0
	thumb_func_end sub_02039220

	thumb_func_start sub_02039264
sub_02039264: ; 0x02039264
	ldr r0, _02039270 ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x5c
	ldrb r0, [r0]
	bx lr
	nop
_02039270: .word 0x021D4150
	thumb_func_end sub_02039264

	thumb_func_start sub_02039274
sub_02039274: ; 0x02039274
	ldr r0, _02039294 ; =0x021D4150
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	ldr r0, _02039298 ; =sub_02039144
	cmp r1, r0
	bne _02039284
	mov r0, #1
	bx lr
_02039284:
	ldr r0, _0203929C ; =sub_02039C60
	cmp r1, r0
	bne _0203928E
	mov r0, #1
	bx lr
_0203928E:
	mov r0, #0
	bx lr
	nop
_02039294: .word 0x021D4150
_02039298: .word sub_02039144
_0203929C: .word sub_02039C60
	thumb_func_end sub_02039274

	thumb_func_start sub_020392A0
sub_020392A0: ; 0x020392A0
	ldr r0, _020392C8 ; =0x021D4150
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	ldr r0, _020392CC ; =sub_02038F9C
	cmp r1, r0
	bne _020392B0
	mov r0, #1
	bx lr
_020392B0:
	ldr r0, _020392D0 ; =sub_02039144
	cmp r1, r0
	bne _020392BA
	mov r0, #1
	bx lr
_020392BA:
	ldr r0, _020392D4 ; =sub_02039C60
	cmp r1, r0
	bne _020392C4
	mov r0, #1
	bx lr
_020392C4:
	mov r0, #0
	bx lr
	.balign 4, 0
_020392C8: .word 0x021D4150
_020392CC: .word sub_02038F9C
_020392D0: .word sub_02039144
_020392D4: .word sub_02039C60
	thumb_func_end sub_020392A0

	thumb_func_start sub_020392D8
sub_020392D8: ; 0x020392D8
	push {r3, lr}
	ldr r0, _020392F0 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _020392E6
	bl GF_AssertFail
_020392E6:
	ldr r0, _020392F0 ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x34
	pop {r3, pc}
	nop
_020392F0: .word 0x021D4150
	thumb_func_end sub_020392D8

	thumb_func_start sub_020392F4
sub_020392F4: ; 0x020392F4
	push {r3, lr}
	mov r0, #0
	bl sub_0203786C
	mov r0, #0
	bl ov00_021E6BE4
	cmp r0, #0
	beq _02039312
	bl ov00_021E6C68
	ldr r0, _02039328 ; =sub_0203847C
	mov r1, #0
	bl sub_020381C0
_02039312:
	mov r0, #0
	bl ov00_021E5E54
	cmp r0, #0
	bge _02039324
	ldr r0, _0203932C ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_02039324:
	pop {r3, pc}
	nop
_02039328: .word sub_0203847C
_0203932C: .word sub_02038E90
	thumb_func_end sub_020392F4

	thumb_func_start sub_02039330
sub_02039330: ; 0x02039330
	push {r3, lr}
	ldr r0, _02039350 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _0203934C
	mov r0, #1
	bl sub_0201A738
	bl sub_020343E4
	ldr r0, _02039354 ; =sub_0203847C
	mov r1, #5
	bl sub_020381C0
_0203934C:
	pop {r3, pc}
	nop
_02039350: .word 0x021D4150
_02039354: .word sub_0203847C
	thumb_func_end sub_02039330

	thumb_func_start sub_02039358
sub_02039358: ; 0x02039358
	push {r3, lr}
	ldr r0, _02039370 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _0203936E
	mov r1, #0
	add r0, #0x50
	strb r1, [r0]
	ldr r0, _02039374 ; =sub_020391D0
	bl sub_020381C0
_0203936E:
	pop {r3, pc}
	.balign 4, 0
_02039370: .word 0x021D4150
_02039374: .word sub_020391D0
	thumb_func_end sub_02039358

	thumb_func_start sub_02039378
sub_02039378: ; 0x02039378
	push {r3, lr}
	ldr r0, _020393AC ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _020393AA
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	bl sub_0203769C
	cmp r0, #0
	bne _02039398
	mov r1, #0
	ldr r0, _020393AC ; =0x021D4150
	b _0203939C
_02039398:
	ldr r0, _020393AC ; =0x021D4150
	mov r1, #1
_0203939C:
	ldr r0, [r0]
	add r0, #0x50
	strb r1, [r0]
	ldr r0, _020393B0 ; =sub_020391D0
	mov r1, #0
	bl sub_020381C0
_020393AA:
	pop {r3, pc}
	.balign 4, 0
_020393AC: .word 0x021D4150
_020393B0: .word sub_020391D0
	thumb_func_end sub_02039378

	thumb_func_start sub_020393B4
sub_020393B4: ; 0x020393B4
	push {r3, lr}
	bl sub_0203769C
	add r1, sp, #0
	strb r0, [r1]
	mov r0, #0x15
	add r1, sp, #0
	bl sub_020376E0
	pop {r3, pc}
	thumb_func_end sub_020393B4

	thumb_func_start sub_020393C8
sub_020393C8: ; 0x020393C8
	ldr r0, _02039408 ; =0x021D4150
	ldr r2, [r0]
	cmp r2, #0
	beq _02039402
	ldr r1, [r2, #0x24]
	ldr r0, _0203940C ; =sub_02038E90
	cmp r1, r0
	bne _020393DC
	mov r0, #1
	bx lr
_020393DC:
	ldr r0, _02039410 ; =sub_02038E94
	cmp r1, r0
	bne _020393F0
	add r0, r2, #0
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	beq _020393F0
	mov r0, #1
	bx lr
_020393F0:
	ldr r0, _02039414 ; =sub_02039E7C
	cmp r1, r0
	bne _02039402
	add r2, #0x53
	ldrb r0, [r2]
	cmp r0, #0
	beq _02039402
	mov r0, #1
	bx lr
_02039402:
	mov r0, #0
	bx lr
	nop
_02039408: .word 0x021D4150
_0203940C: .word sub_02038E90
_02039410: .word sub_02038E94
_02039414: .word sub_02039E7C
	thumb_func_end sub_020393C8

	thumb_func_start sub_02039418
sub_02039418: ; 0x02039418
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02039468 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _02039466
	mov r1, #0xf
	add r2, r1, #0
	mov r0, #3
	add r2, #0xf1
	bl sub_0201A91C
	mov r0, #0xf
	mov r1, #0x68
	bl AllocFromHeap
	ldr r1, _02039468 ; =0x021D4150
	mov r2, #0x68
	str r0, [r1]
	mov r1, #0
	bl MIi_CpuFill8
	ldr r0, _02039468 ; =0x021D4150
	mov r2, #0x18
	ldr r1, [r0]
	add r1, #0x4e
	strb r2, [r1]
	ldr r2, [r0]
	mov r1, #1
	add r2, #0x55
	strb r1, [r2]
	ldr r0, [r0]
	str r4, [r0, #0x28]
	mov r0, #0
	bl sub_020398D4
	mov r0, #1
	bl sub_0201A728
_02039466:
	pop {r4, pc}
	.balign 4, 0
_02039468: .word 0x021D4150
	thumb_func_end sub_02039418

	thumb_func_start sub_0203946C
sub_0203946C: ; 0x0203946C
	push {r3, lr}
	ldr r0, _0203949C ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _02039498
	mov r0, #1
	bl sub_0201A738
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
	ldr r0, _0203949C ; =0x021D4150
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _0203949C ; =0x021D4150
	mov r1, #0
	str r1, [r0]
	mov r0, #0xf
	bl sub_0201A9C4
_02039498:
	pop {r3, pc}
	nop
_0203949C: .word 0x021D4150
	thumb_func_end sub_0203946C

	thumb_func_start sub_020394A0
sub_020394A0: ; 0x020394A0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020394F0 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _020394EE
	mov r1, #0xf
	add r2, r1, #0
	mov r0, #3
	add r2, #0xf1
	bl sub_0201A91C
	mov r0, #0xf
	mov r1, #0x68
	bl AllocFromHeap
	ldr r1, _020394F0 ; =0x021D4150
	mov r2, #0x68
	str r0, [r1]
	mov r1, #0
	bl MIi_CpuFill8
	ldr r0, _020394F0 ; =0x021D4150
	mov r2, #0x19
	ldr r1, [r0]
	add r1, #0x4e
	strb r2, [r1]
	ldr r2, [r0]
	mov r1, #1
	add r2, #0x55
	strb r1, [r2]
	ldr r0, [r0]
	str r4, [r0, #0x28]
	mov r0, #0
	bl sub_020398D4
	mov r0, #1
	bl sub_0201A728
_020394EE:
	pop {r4, pc}
	.balign 4, 0
_020394F0: .word 0x021D4150
	thumb_func_end sub_020394A0

	thumb_func_start sub_020394F4
sub_020394F4: ; 0x020394F4
	push {r3, lr}
	ldr r0, _02039524 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _02039520
	mov r0, #1
	bl sub_0201A738
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
	ldr r0, _02039524 ; =0x021D4150
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _02039524 ; =0x021D4150
	mov r1, #0
	str r1, [r0]
	mov r0, #0xf
	bl sub_0201A9C4
_02039520:
	pop {r3, pc}
	nop
_02039524: .word 0x021D4150
	thumb_func_end sub_020394F4

	thumb_func_start sub_02039528
sub_02039528: ; 0x02039528
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02039578 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _02039576
	mov r1, #0xf
	add r2, r1, #0
	mov r0, #3
	add r2, #0xf1
	bl sub_0201A91C
	mov r0, #0xf
	mov r1, #0x68
	bl AllocFromHeap
	ldr r1, _02039578 ; =0x021D4150
	mov r2, #0x68
	str r0, [r1]
	mov r1, #0
	bl MIi_CpuFill8
	ldr r0, _02039578 ; =0x021D4150
	mov r2, #0x24
	ldr r1, [r0]
	add r1, #0x4e
	strb r2, [r1]
	ldr r2, [r0]
	mov r1, #1
	add r2, #0x55
	strb r1, [r2]
	ldr r0, [r0]
	str r4, [r0, #0x28]
	mov r0, #0
	bl sub_020398D4
	mov r0, #1
	bl sub_0201A728
_02039576:
	pop {r4, pc}
	.balign 4, 0
_02039578: .word 0x021D4150
	thumb_func_end sub_02039528

	thumb_func_start sub_0203957C
sub_0203957C: ; 0x0203957C
	push {r3, lr}
	ldr r0, _020395AC ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _020395A8
	mov r0, #1
	bl sub_0201A738
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
	ldr r0, _020395AC ; =0x021D4150
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _020395AC ; =0x021D4150
	mov r1, #0
	str r1, [r0]
	mov r0, #0xf
	bl sub_0201A9C4
_020395A8:
	pop {r3, pc}
	nop
_020395AC: .word 0x021D4150
	thumb_func_end sub_0203957C

	thumb_func_start sub_020395B0
sub_020395B0: ; 0x020395B0
	push {r3, lr}
	sub sp, #8
	ldr r0, _02039608 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _020395C2
	add sp, #8
	mov r0, #0
	pop {r3, pc}
_020395C2:
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _020395CE
	cmp r0, #0x24
	bne _020395E4
_020395CE:
	add r0, sp, #4
	add r1, sp, #0
	bl ov00_021EC11C
	cmp r0, #0
	beq _02039600
	bl ov00_021EC210
	add sp, #8
	mov r0, #1
	pop {r3, pc}
_020395E4:
	cmp r0, #0x19
	bne _02039600
	add r0, sp, #4
	add r1, sp, #0
	bl ov00_021EC11C
	cmp r0, #0
	beq _02039600
	ldr r0, [sp]
	cmp r0, #7
	bne _02039600
	add sp, #8
	mov r0, #1
	pop {r3, pc}
_02039600:
	mov r0, #0
	add sp, #8
	pop {r3, pc}
	nop
_02039608: .word 0x021D4150
	thumb_func_end sub_020395B0

	thumb_func_start sub_0203960C
sub_0203960C: ; 0x0203960C
	push {r3, lr}
	bl ov00_021E5B6C
	ldr r1, _02039680 ; =0x021D4150
	ldr r3, [r1]
	ldr r2, [r3, #0x44]
	sub r2, r2, #1
	str r2, [r3, #0x44]
	cmp r0, #0x1b
	bne _02039660
	ldr r1, [r1]
	add r0, r1, #0
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _02039656
	ldr r0, [r1, #0x60]
	bl ov45_0222E804
	cmp r0, #1
	bne _0203964C
	ldr r1, _02039680 ; =0x021D4150
	mov r2, #1
	ldr r0, [r1]
	add r0, #0x64
	strb r2, [r0]
	ldr r1, [r1]
	ldr r0, _02039684 ; =sub_02039C14
	ldr r1, [r1, #0x44]
	bl sub_020381C0
	pop {r3, pc}
_0203964C:
	ldr r0, _02039688 ; =sub_02039DC0
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039656:
	ldr r0, _0203968C ; =sub_02039144
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039660:
	cmp r0, #0
	beq _0203966C
	ldr r0, _02039690 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_0203966C:
	ldr r0, _02039680 ; =0x021D4150
	ldr r0, [r0]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	bgt _0203967E
	ldr r0, _02039690 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_0203967E:
	pop {r3, pc}
	.balign 4, 0
_02039680: .word 0x021D4150
_02039684: .word sub_02039C14
_02039688: .word sub_02039DC0
_0203968C: .word sub_02039144
_02039690: .word sub_02038E90
	thumb_func_end sub_0203960C

	thumb_func_start sub_02039694
sub_02039694: ; 0x02039694
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _020396EE
	mov r2, #0xd5
	mov r0, #3
	mov r1, #0x30
	lsl r2, r2, #0xa
	bl sub_0201A91C
	mov r0, #1
	add r1, r0, #0
	lsl r2, r0, #9
	add r3, r0, #0
	bl sub_02035ED8
	cmp r0, #0
	beq _020396EE
	ldr r0, _020396F0 ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x4e
	ldrb r0, [r0]
	bl sub_02033FC4
	add r3, r0, #0
	ldr r0, _020396F0 ; =0x021D4150
	mov r2, #0xb1
	ldr r0, [r0]
	mov r1, #0x30
	ldr r0, [r0, #0x28]
	lsl r2, r2, #0xa
	add r3, r3, #1
	bl ov00_021E5900
	ldr r0, _020396F4 ; =sub_020399DC
	bl ov00_021E6CA4
	bl sub_02035FD8
	mov r1, #0xe1
	ldr r0, _020396F8 ; =sub_0203960C
	lsl r1, r1, #4
	bl sub_020381C0
_020396EE:
	pop {r3, pc}
	.balign 4, 0
_020396F0: .word 0x021D4150
_020396F4: .word sub_020399DC
_020396F8: .word sub_0203960C
	thumb_func_end sub_02039694

	thumb_func_start sub_020396FC
sub_020396FC: ; 0x020396FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl Sav2_PlayerData_GetProfileAddr
	bl sub_02037474
	cmp r0, #0
	beq _02039712
	mov r0, #0
	pop {r3, r4, r5, pc}
_02039712:
	mov r0, #1
	bl sub_0201A728
	ldr r2, _02039760 ; =0x00007080
	mov r0, #3
	mov r1, #0xf
	bl sub_0201A91C
	add r0, r5, #0
	mov r1, #0x17
	bl sub_02037C98
	mov r0, #0xf
	add r1, r4, #0
	bl AllocFromHeap
	ldr r1, _02039764 ; =0x021D4150
	ldr r2, [r1]
	str r0, [r2]
	ldr r0, [r1]
	mov r1, #0
	ldr r0, [r0]
	add r2, r4, #0
	bl MIi_CpuFill8
	ldr r0, _02039764 ; =0x021D4150
	mov r1, #0
	ldr r2, [r0]
	add r2, #0x4f
	strb r1, [r2]
	ldr r0, [r0]
	str r5, [r0, #0x28]
	ldr r0, _02039768 ; =sub_02039694
	bl sub_020381C0
	ldr r0, _02039764 ; =0x021D4150
	ldr r0, [r0]
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02039760: .word 0x00007080
_02039764: .word 0x021D4150
_02039768: .word sub_02039694
	thumb_func_end sub_020396FC

	thumb_func_start sub_0203976C
sub_0203976C: ; 0x0203976C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl Sav2_PlayerData_GetProfileAddr
	bl sub_02037474
	cmp r0, #0
	bne _020397B8
	mov r0, #1
	bl sub_0201A728
	ldr r2, _020397BC ; =0x00007080
	mov r0, #3
	mov r1, #0xf
	bl sub_0201A91C
	add r0, r5, #0
	mov r1, #0x21
	bl sub_02037C98
	ldr r0, _020397C0 ; =0x021D4150
	mov r1, #0
	ldr r2, [r0]
	str r1, [r2]
	ldr r2, [r0]
	str r4, [r2, #0x60]
	ldr r2, [r0]
	add r2, #0x64
	strb r1, [r2]
	ldr r2, [r0]
	add r2, #0x4f
	strb r1, [r2]
	ldr r0, [r0]
	str r5, [r0, #0x28]
	ldr r0, _020397C4 ; =sub_02039BA0
	bl sub_020381C0
_020397B8:
	pop {r3, r4, r5, pc}
	nop
_020397BC: .word 0x00007080
_020397C0: .word 0x021D4150
_020397C4: .word sub_02039BA0
	thumb_func_end sub_0203976C

	thumb_func_start sub_020397C8
sub_020397C8: ; 0x020397C8
	push {r3, lr}
	ldr r0, _020397DC ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _020397DA
	ldr r0, _020397E0 ; =sub_02039D78
	mov r1, #0
	bl sub_020381C0
_020397DA:
	pop {r3, pc}
	.balign 4, 0
_020397DC: .word 0x021D4150
_020397E0: .word sub_02039D78
	thumb_func_end sub_020397C8

	thumb_func_start sub_020397E4
sub_020397E4: ; 0x020397E4
	ldr r0, _020397F8 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _020397F0
	mov r0, #0
	bx lr
_020397F0:
	add r0, #0x64
	ldrb r0, [r0]
	bx lr
	nop
_020397F8: .word 0x021D4150
	thumb_func_end sub_020397E4

	thumb_func_start sub_020397FC
sub_020397FC: ; 0x020397FC
	ldr r0, _02039814 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _02039810
	ldr r1, [r0, #0x24]
	ldr r0, _02039818 ; =sub_02039DC0
	cmp r1, r0
	bne _02039810
	mov r0, #1
	bx lr
_02039810:
	mov r0, #0
	bx lr
	.balign 4, 0
_02039814: .word 0x021D4150
_02039818: .word sub_02039DC0
	thumb_func_end sub_020397FC

	thumb_func_start sub_0203981C
sub_0203981C: ; 0x0203981C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02039864 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _0203982C
	bl GF_AssertFail
_0203982C:
	bl sub_020392A0
	cmp r0, #1
	beq _02039838
	bl GF_AssertFail
_02039838:
	add r0, r4, #0
	bl ov45_0222F274
	cmp r0, #0
	bne _02039854
	add r0, r4, #0
	mov r1, #4
	bl ov45_0222F028
	ldr r0, _02039868 ; =sub_02039DE4
	mov r1, #0
	bl sub_020381C0
	pop {r4, pc}
_02039854:
	add r0, r4, #0
	bl ov45_0222F350
	ldr r0, _02039868 ; =sub_02039DE4
	mov r1, #0
	bl sub_020381C0
	pop {r4, pc}
	.balign 4, 0
_02039864: .word 0x021D4150
_02039868: .word sub_02039DE4
	thumb_func_end sub_0203981C

	thumb_func_start sub_0203986C
sub_0203986C: ; 0x0203986C
	push {r3, lr}
	bl ov45_0222F464
	cmp r0, #1
	bne _0203987A
	bl ov45_0222F154
_0203987A:
	bl ov45_0222F70C
	ldr r0, _02039888 ; =sub_02039E30
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02039888: .word sub_02039E30
	thumb_func_end sub_0203986C

	thumb_func_start sub_0203988C
sub_0203988C: ; 0x0203988C
	ldr r0, _020398B8 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _020398B4
	ldr r1, [r0, #0x24]
	ldr r0, _020398BC ; =sub_02039DC4
	cmp r1, r0
	bne _020398A0
	mov r0, #2
	bx lr
_020398A0:
	ldr r0, _020398C0 ; =sub_02039DE4
	cmp r1, r0
	bne _020398AA
	mov r0, #1
	bx lr
_020398AA:
	ldr r0, _020398C4 ; =sub_02039E30
	cmp r1, r0
	bne _020398B4
	mov r0, #3
	bx lr
_020398B4:
	mov r0, #0
	bx lr
	.balign 4, 0
_020398B8: .word 0x021D4150
_020398BC: .word sub_02039DC4
_020398C0: .word sub_02039DE4
_020398C4: .word sub_02039E30
	thumb_func_end sub_0203988C

	thumb_func_start sub_020398C8
sub_020398C8: ; 0x020398C8
	ldr r0, _020398D0 ; =0x021D4150
	ldr r0, [r0]
	ldr r0, [r0]
	bx lr
	.balign 4, 0
_020398D0: .word 0x021D4150
	thumb_func_end sub_020398C8

	thumb_func_start sub_020398D4
sub_020398D4: ; 0x020398D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02039914 ; =0x021D4150
	ldr r2, [r0]
	cmp r2, #0
	beq _02039904
	add r2, #0x53
	strb r4, [r2]
	ldr r2, [r0]
	add r2, #0x54
	strb r1, [r2]
	cmp r4, #0
	beq _020398FC
	bl sub_02037454
	ldr r1, _02039914 ; =0x021D4150
	ldr r1, [r1]
	add r1, #0x4b
	strb r0, [r1]
	b _02039904
_020398FC:
	ldr r0, [r0]
	mov r1, #0
	add r0, #0x4b
	strb r1, [r0]
_02039904:
	add r0, r4, #0
	bl sub_020356C0
	add r0, r4, #0
	bl sub_020356EC
	pop {r4, pc}
	nop
_02039914: .word 0x021D4150
	thumb_func_end sub_020398D4

	thumb_func_start sub_02039918
sub_02039918: ; 0x02039918
	ldr r0, _02039938 ; =0x021D4150
	ldr r1, [r0]
	cmp r1, #0
	beq _02039934
	add r0, r1, #0
	add r0, #0x5d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0203992E
	mov r0, #1
	bx lr
_0203992E:
	add r1, #0x54
	ldrb r0, [r1]
	bx lr
_02039934:
	mov r0, #0
	bx lr
	.balign 4, 0
_02039938: .word 0x021D4150
	thumb_func_end sub_02039918

	thumb_func_start sub_0203993C
sub_0203993C: ; 0x0203993C
	ldr r0, _02039950 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _0203994A
	add r0, #0x4e
	ldrb r0, [r0]
	bx lr
_0203994A:
	mov r0, #1
	bx lr
	nop
_02039950: .word 0x021D4150
	thumb_func_end sub_0203993C

	thumb_func_start sub_02039954
sub_02039954: ; 0x02039954
	ldr r0, _02039968 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _02039962
	add r0, #0x4f
	ldrb r0, [r0]
	bx lr
_02039962:
	mov r0, #0
	bx lr
	nop
_02039968: .word 0x021D4150
	thumb_func_end sub_02039954

	thumb_func_start sub_0203996C
sub_0203996C: ; 0x0203996C
	ldr r1, _02039978 ; =0x021D4150
	ldr r3, _0203997C ; =MIi_CpuCopy8
	ldr r1, [r1]
	mov r2, #6
	add r1, r1, #4
	bx r3
	.balign 4, 0
_02039978: .word 0x021D4150
_0203997C: .word MIi_CpuCopy8
	thumb_func_end sub_0203996C

	thumb_func_start sub_02039980
sub_02039980: ; 0x02039980
	add r1, r0, #0
	ldr r0, _02039990 ; =0x021D4150
	ldr r3, _02039994 ; =MIi_CpuCopy8
	ldr r0, [r0]
	mov r2, #6
	add r0, r0, #4
	bx r3
	nop
_02039990: .word 0x021D4150
_02039994: .word MIi_CpuCopy8
	thumb_func_end sub_02039980

	thumb_func_start sub_02039998
sub_02039998: ; 0x02039998
	push {r3, lr}
	bl sub_0203993C
	bl sub_02034044
	pop {r3, pc}
	thumb_func_end sub_02039998

	thumb_func_start sub_020399A4
sub_020399A4: ; 0x020399A4
	ldr r1, _020399B4 ; =0x021D4150
	ldr r1, [r1]
	cmp r1, #0
	beq _020399B0
	add r1, #0x56
	strb r0, [r1]
_020399B0:
	bx lr
	nop
_020399B4: .word 0x021D4150
	thumb_func_end sub_020399A4

	thumb_func_start sub_020399B8
sub_020399B8: ; 0x020399B8
	push {r3, lr}
	bl sub_0201A79C
	cmp r0, #0
	beq _020399C6
	mov r0, #0
	pop {r3, pc}
_020399C6:
	ldr r0, _020399D8 ; =0x021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _020399D4
	add r0, #0x56
	ldrb r0, [r0]
	pop {r3, pc}
_020399D4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_020399D8: .word 0x021D4150
	thumb_func_end sub_020399B8

	thumb_func_start sub_020399DC
sub_020399DC: ; 0x020399DC
	push {r3, lr}
	add r2, r0, #0
	mov r0, #0
	mov r1, #1
	bl sub_0203AA44
_020399E8:
	b _020399E8
	.balign 4, 0
	thumb_func_end sub_020399DC

	thumb_func_start sub_020399EC
sub_020399EC: ; 0x020399EC
	push {r3, lr}
	mov r0, #0
	mov r1, #4
	add r2, r0, #0
	bl sub_0203AA44
_020399F8:
	b _020399F8
	.balign 4, 0
	thumb_func_end sub_020399EC

	thumb_func_start sub_020399FC
sub_020399FC: ; 0x020399FC
	bx lr
	.balign 4, 0
	thumb_func_end sub_020399FC

	thumb_func_start sub_02039A00
sub_02039A00: ; 0x02039A00
	push {r3, lr}
	bl sub_02039918
	cmp r0, #0
	beq _02039A98
	bl sub_02037700
	cmp r0, #0
	bne _02039A36
	bl sub_020393C8
	cmp r0, #0
	bne _02039A36
	bl sub_020395B0
	cmp r0, #0
	bne _02039A36
	ldr r0, _02039A9C ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x5d
	ldrb r0, [r0]
	cmp r0, #0
	bne _02039A36
	bl sub_020397FC
	cmp r0, #0
	beq _02039A98
_02039A36:
	bl sub_0201A79C
	cmp r0, #0
	bne _02039A98
	bl sub_020399B8
	cmp r0, #0
	bne _02039A98
	bl sub_02005FA0
	ldr r0, _02039A9C ; =0x021D4150
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bl sub_020275A4
	ldr r1, _02039AA0 ; =gMain + 0x60
	mov r0, #1
	strb r0, [r1, #8]
	ldr r1, _02039A9C ; =0x021D4150
	ldr r2, [r1]
	add r1, r2, #0
	add r1, #0x5d
	ldrb r1, [r1]
	cmp r1, #3
	bne _02039A70
	mov r0, #3
	bl sub_020399A4
	pop {r3, pc}
_02039A70:
	cmp r1, #5
	bne _02039A7C
	mov r0, #5
	bl sub_020399A4
	pop {r3, pc}
_02039A7C:
	add r2, #0x4e
	ldrb r1, [r2]
	cmp r1, #0x19
	beq _02039A8C
	cmp r1, #0xf
	beq _02039A8C
	cmp r1, #0x24
	bne _02039A94
_02039A8C:
	mov r0, #2
	bl sub_020399A4
	pop {r3, pc}
_02039A94:
	bl sub_020399A4
_02039A98:
	pop {r3, pc}
	nop
_02039A9C: .word 0x021D4150
_02039AA0: .word gMain + 0x60
	thumb_func_end sub_02039A00

	thumb_func_start sub_02039AA4
sub_02039AA4: ; 0x02039AA4
	push {r3, lr}
	bl sub_02035630
	cmp r0, #0
	bne _02039AB6
	bl sub_02037D78
	cmp r0, #0
	bne _02039ABA
_02039AB6:
	mov r0, #1
	pop {r3, pc}
_02039ABA:
	bl sub_02034BE4
	cmp r0, #0
	bne _02039AC6
	mov r0, #1
	pop {r3, pc}
_02039AC6:
	bl sub_02033974
	cmp r0, #0
	beq _02039AD2
	mov r0, #1
	pop {r3, pc}
_02039AD2:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02039AA4

	thumb_func_start sub_02039AD8
sub_02039AD8: ; 0x02039AD8
	push {r3, lr}
	ldr r1, _02039AF4 ; =0x021D4150
	ldr r1, [r1]
	cmp r1, #0
	beq _02039AEE
	add r1, #0x5d
	strb r0, [r1]
	bl sub_02037988
	mov r0, #1
	pop {r3, pc}
_02039AEE:
	mov r0, #0
	pop {r3, pc}
	nop
_02039AF4: .word 0x021D4150
	thumb_func_end sub_02039AD8

	thumb_func_start sub_02039AF8
sub_02039AF8: ; 0x02039AF8
	ldr r0, _02039B0C ; =0x021D4150
	mov r1, #0x1d
	ldr r0, [r0]
	ldr r3, _02039B10 ; =ov00_021E5C84
	add r0, #0x4e
	strb r1, [r0]
	ldr r0, _02039B14 ; =sub_020369CC
	add r1, r0, #0
	bx r3
	nop
_02039B0C: .word 0x021D4150
_02039B10: .word ov00_021E5C84
_02039B14: .word sub_020369CC
	thumb_func_end sub_02039AF8

	thumb_func_start sub_02039B18
sub_02039B18: ; 0x02039B18
	ldr r0, _02039B2C ; =0x021D4150
	mov r1, #0x23
	ldr r0, [r0]
	ldr r3, _02039B30 ; =ov00_021E5C84
	add r0, #0x4e
	strb r1, [r0]
	ldr r0, _02039B34 ; =sub_020369CC
	add r1, r0, #0
	bx r3
	nop
_02039B2C: .word 0x021D4150
_02039B30: .word ov00_021E5C84
_02039B34: .word sub_020369CC
	thumb_func_end sub_02039B18

	thumb_func_start sub_02039B38
sub_02039B38: ; 0x02039B38
	ldr r0, _02039B4C ; =0x021D4150
	mov r1, #0x21
	ldr r0, [r0]
	ldr r3, _02039B50 ; =ov00_021E5C84
	add r0, #0x4e
	strb r1, [r0]
	ldr r0, _02039B54 ; =sub_020369CC
	add r1, r0, #0
	bx r3
	nop
_02039B4C: .word 0x021D4150
_02039B50: .word ov00_021E5C84
_02039B54: .word sub_020369CC
	thumb_func_end sub_02039B38

	thumb_func_start sub_02039B58
sub_02039B58: ; 0x02039B58
	ldr r0, _02039B6C ; =0x021D4150
	ldr r3, _02039B70 ; =ov00_021E5C84
	ldr r0, [r0]
	mov r1, #0x17
	add r0, #0x4e
	strb r1, [r0]
	ldr r0, _02039B74 ; =sub_02036904
	ldr r1, _02039B78 ; =sub_020367A8
	bx r3
	nop
_02039B6C: .word 0x021D4150
_02039B70: .word ov00_021E5C84
_02039B74: .word sub_02036904
_02039B78: .word sub_020367A8
	thumb_func_end sub_02039B58

	thumb_func_start sub_02039B7C
sub_02039B7C: ; 0x02039B7C
	ldr r0, _02039B90 ; =0x021D4150
	ldr r3, _02039B94 ; =ov00_021E5C84
	ldr r0, [r0]
	mov r1, #0x13
	add r0, #0x4e
	strb r1, [r0]
	ldr r0, _02039B98 ; =sub_02036904
	ldr r1, _02039B9C ; =sub_020367A8
	bx r3
	nop
_02039B90: .word 0x021D4150
_02039B94: .word ov00_021E5C84
_02039B98: .word sub_02036904
_02039B9C: .word sub_020367A8
	thumb_func_end sub_02039B7C

	thumb_func_start sub_02039BA0
sub_02039BA0: ; 0x02039BA0
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _02039C04
	mov r1, #0x30
	mov r0, #3
	lsl r2, r1, #0xd
	bl sub_0201A91C
	mov r0, #1
	add r1, r0, #0
	lsl r2, r0, #9
	add r3, r0, #0
	bl sub_02035ED8
	cmp r0, #0
	beq _02039C04
	ldr r0, _02039C08 ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x4e
	ldrb r0, [r0]
	bl sub_02033FC4
	add r3, r0, #0
	ldr r0, _02039C08 ; =0x021D4150
	mov r2, #0x16
	ldr r0, [r0]
	mov r1, #0x30
	ldr r0, [r0, #0x28]
	lsl r2, r2, #0xe
	add r3, r3, #1
	bl ov00_021E5900
	ldr r0, _02039C0C ; =sub_020399DC
	bl ov00_021E6CA4
	bl sub_02035FD8
	mov r0, #0
	bl ov00_021E70B8
	mov r0, #0
	bl sub_020378E4
	mov r1, #0xe1
	ldr r0, _02039C10 ; =sub_0203960C
	lsl r1, r1, #4
	bl sub_020381C0
_02039C04:
	pop {r3, pc}
	nop
_02039C08: .word 0x021D4150
_02039C0C: .word sub_020399DC
_02039C10: .word sub_0203960C
	thumb_func_end sub_02039BA0

	thumb_func_start sub_02039C14
sub_02039C14: ; 0x02039C14
	push {r3, lr}
	ldr r0, _02039C54 ; =0x021D4150
	ldr r2, [r0]
	ldr r1, [r2, #0x44]
	sub r1, r1, #1
	str r1, [r2, #0x44]
	ldr r0, [r0]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	bgt _02039C32
	ldr r0, _02039C58 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039C32:
	mov r0, #1
	bl sub_0203786C
	bl sub_02039D3C
	cmp r0, #0
	beq _02039C50
	bl ov45_0222E8F4
	cmp r0, #0
	beq _02039C50
	ldr r0, _02039C5C ; =sub_02039C60
	mov r1, #0
	bl sub_020381C0
_02039C50:
	pop {r3, pc}
	nop
_02039C54: .word 0x021D4150
_02039C58: .word sub_02038E90
_02039C5C: .word sub_02039C60
	thumb_func_end sub_02039C14

	thumb_func_start sub_02039C60
sub_02039C60: ; 0x02039C60
	push {r3, lr}
	bl sub_02039D3C
	cmp r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02039C60

	thumb_func_start sub_02039C6C
sub_02039C6C: ; 0x02039C6C
	push {r4, lr}
	mov r4, #1
	cmp r0, #0xa
	blt _02039C84
	cmp r0, #0x14
	bge _02039C84
	ldr r0, _02039CF4 ; =sub_02038EB4
	mov r1, #0
	bl sub_020381C0
	mov r4, #0
	b _02039CC8
_02039C84:
	cmp r0, #0
	bge _02039C94
	ldr r0, _02039CF8 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	mov r4, #0
	b _02039CC8
_02039C94:
	cmp r0, #0x17
	bne _02039CA4
	ldr r0, _02039CFC ; =sub_02039E7C
	mov r1, #0
	bl sub_020381C0
	mov r4, #0
	b _02039CC8
_02039CA4:
	cmp r0, #0x18
	bne _02039CC8
	ldr r0, _02039D00 ; =0x021D4150
	mov r4, #0
	ldr r0, [r0]
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	beq _02039CC0
	ldr r0, _02039CF8 ; =sub_02038E90
	add r1, r4, #0
	bl sub_020381C0
	b _02039CC8
_02039CC0:
	ldr r0, _02039D04 ; =sub_02038EB0
	add r1, r4, #0
	bl sub_020381C0
_02039CC8:
	ldr r0, _02039D00 ; =0x021D4150
	ldr r0, [r0]
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	beq _02039CEE
	bl sub_02037454
	ldr r1, _02039D00 ; =0x021D4150
	ldr r1, [r1]
	add r1, #0x4b
	ldrb r1, [r1]
	cmp r1, r0
	beq _02039CEE
	ldr r0, _02039CF8 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	mov r4, #0
_02039CEE:
	add r0, r4, #0
	pop {r4, pc}
	nop
_02039CF4: .word sub_02038EB4
_02039CF8: .word sub_02038E90
_02039CFC: .word sub_02039E7C
_02039D00: .word 0x021D4150
_02039D04: .word sub_02038EB0
	thumb_func_end sub_02039C6C

	thumb_func_start sub_02039D08
sub_02039D08: ; 0x02039D08
	push {r4, lr}
	mov r4, #1
	bl ov45_0222E6C8
	cmp r0, #4
	bhi _02039D34
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02039D20: ; jump table
	.short _02039D34 - _02039D20 - 2 ; case 0
	.short _02039D34 - _02039D20 - 2 ; case 1
	.short _02039D34 - _02039D20 - 2 ; case 2
	.short _02039D34 - _02039D20 - 2 ; case 3
	.short _02039D2A - _02039D20 - 2 ; case 4
_02039D2A:
	ldr r0, _02039D38 ; =sub_02039DC0
	mov r1, #0
	bl sub_020381C0
	mov r4, #0
_02039D34:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02039D38: .word sub_02039DC0
	thumb_func_end sub_02039D08

	thumb_func_start sub_02039D3C
sub_02039D3C: ; 0x02039D3C
	push {r3, lr}
	mov r0, #0
	bl ov00_021E5E54
	bl sub_02039C6C
	cmp r0, #0
	beq _02039D50
	bl sub_02039D08
_02039D50:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02039D3C

	thumb_func_start sub_02039D54
sub_02039D54: ; 0x02039D54
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	bl ov00_021E5E54
	cmp r0, #0x14
	blt _02039D66
	str r0, [r4]
	b _02039D72
_02039D66:
	mov r1, #0
	str r1, [r4]
	bl sub_02039C6C
	cmp r0, #0
	beq _02039D76
_02039D72:
	bl sub_02039D08
_02039D76:
	pop {r4, pc}
	thumb_func_end sub_02039D54

	thumb_func_start sub_02039D78
sub_02039D78: ; 0x02039D78
	push {r3, lr}
	bl ov45_0222E91C
	ldr r0, _02039D88 ; =sub_02039D8C
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02039D88: .word sub_02039D8C
	thumb_func_end sub_02039D78

	thumb_func_start sub_02039D8C
sub_02039D8C: ; 0x02039D8C
	push {r3, lr}
	mov r0, #0
	bl ov00_021E5E54
	bl sub_02039D08
	bl ov45_0222E944
	cmp r0, #0
	beq _02039DB8
	mov r0, #1
	bl sub_0201A738
	bl sub_020343E4
	ldr r0, _02039DBC ; =sub_0203847C
	mov r1, #5
	bl sub_020381C0
	mov r0, #0
	bl sub_0203786C
_02039DB8:
	pop {r3, pc}
	nop
_02039DBC: .word sub_0203847C
	thumb_func_end sub_02039D8C

	thumb_func_start sub_02039DC0
sub_02039DC0: ; 0x02039DC0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02039DC0

	thumb_func_start sub_02039DC4
sub_02039DC4: ; 0x02039DC4
	push {r3, lr}
	bl sub_02039D3C
	bl ov45_0222F254
	cmp r0, #1
	bne _02039DDE
	bl ov45_0222F70C
	ldr r0, _02039DE0 ; =sub_02039E30
	mov r1, #0
	bl sub_020381C0
_02039DDE:
	pop {r3, pc}
	.balign 4, 0
_02039DE0: .word sub_02039E30
	thumb_func_end sub_02039DC4

	thumb_func_start sub_02039DE4
sub_02039DE4: ; 0x02039DE4
	push {r3, lr}
	bl ov45_0222F254
	cmp r0, #1
	bne _02039DFC
	bl ov45_0222F70C
	ldr r0, _02039E24 ; =sub_02039E30
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039DFC:
	add r0, sp, #0
	bl sub_02039D54
	ldr r0, [sp]
	cmp r0, #0
	beq _02039E22
	cmp r0, #0x14
	bne _02039E16
	ldr r0, _02039E28 ; =sub_02039DC4
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039E16:
	bl ov45_0222F70C
	ldr r0, _02039E2C ; =sub_02039C60
	mov r1, #0
	bl sub_020381C0
_02039E22:
	pop {r3, pc}
	.balign 4, 0
_02039E24: .word sub_02039E30
_02039E28: .word sub_02039DC4
_02039E2C: .word sub_02039C60
	thumb_func_end sub_02039DE4

	thumb_func_start sub_02039E30
sub_02039E30: ; 0x02039E30
	push {r3, lr}
	mov r0, #1
	bl ov00_021E5E54
	cmp r0, #0
	bge _02039E46
	ldr r0, _02039E74 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039E46:
	bl sub_02039D08
	cmp r0, #0
	beq _02039E72
	mov r0, #0
	bl ov00_021E6BE4
	cmp r0, #0
	beq _02039E72
	bl ov00_021E6C68
	cmp r0, #0
	beq _02039E72
	bl sub_0203622C
	mov r0, #0
	bl sub_020378E4
	ldr r0, _02039E78 ; =sub_02039C60
	mov r1, #0
	bl sub_020381C0
_02039E72:
	pop {r3, pc}
	.balign 4, 0
_02039E74: .word sub_02038E90
_02039E78: .word sub_02039C60
	thumb_func_end sub_02039E30

	thumb_func_start sub_02039E7C
sub_02039E7C: ; 0x02039E7C
	push {r3, lr}
	mov r0, #0
	bl ov00_021E5E54
	cmp r0, #0
	bge _02039E90
	ldr r0, _02039E98 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_02039E90:
	bl sub_02039D08
	pop {r3, pc}
	nop
_02039E98: .word sub_02038E90
	thumb_func_end sub_02039E7C

	thumb_func_start sub_02039E9C
sub_02039E9C: ; 0x02039E9C
	ldr r0, _02039EA8 ; =0x021D4150
	mov r1, #0x22
	ldr r0, [r0]
	add r0, #0x4e
	strb r1, [r0]
	bx lr
	.balign 4, 0
_02039EA8: .word 0x021D4150
	thumb_func_end sub_02039E9C

	thumb_func_start sub_02039EAC
sub_02039EAC: ; 0x02039EAC
	mov r1, #0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02039EAC

	thumb_func_start sub_02039EB4
sub_02039EB4: ; 0x02039EB4
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r6, r1, #0
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #6
	bhi _02039F64
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02039ECE: ; jump table
	.short _02039EDC - _02039ECE - 2 ; case 0
	.short _02039EE8 - _02039ECE - 2 ; case 1
	.short _02039F00 - _02039ECE - 2 ; case 2
	.short _02039F28 - _02039ECE - 2 ; case 3
	.short _02039F38 - _02039ECE - 2 ; case 4
	.short _02039F5A - _02039ECE - 2 ; case 5
	.short _02039F60 - _02039ECE - 2 ; case 6
_02039EDC:
	mov r0, #0x6f
	bl sub_02037AC0
	mov r0, #1
	str r0, [r4]
	b _02039F64
_02039EE8:
	mov r0, #0x6f
	bl sub_02037B38
	cmp r0, #0
	beq _02039F64
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02027550
	mov r0, #2
	str r0, [r4]
	b _02039F64
_02039F00:
	bl sub_02027564
	add r5, r0, #0
	cmp r5, #2
	bne _02039F0E
	bl GF_AssertFail
_02039F0E:
	cmp r5, #1
	bne _02039F1E
	mov r0, #3
	str r0, [r4]
	mov r0, #0x70
	bl sub_02037AC0
	b _02039F64
_02039F1E:
	cmp r5, #3
	bne _02039F64
	mov r0, #7
	str r0, [r4]
	b _02039F64
_02039F28:
	mov r0, #0x70
	bl sub_02037B38
	cmp r0, #0
	beq _02039F64
	mov r0, #4
	str r0, [r4]
	b _02039F64
_02039F38:
	bl sub_02027564
	add r5, r0, #0
	cmp r5, #1
	bne _02039F46
	bl GF_AssertFail
_02039F46:
	cmp r5, #2
	bne _02039F50
	mov r0, #5
	str r0, [r4]
	b _02039F64
_02039F50:
	cmp r5, #3
	bne _02039F64
	mov r0, #7
	str r0, [r4]
	b _02039F64
_02039F5A:
	mov r0, #6
	str r0, [r4]
	b _02039F64
_02039F60:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02039F64:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02039EB4

	thumb_func_start sub_02039F68
sub_02039F68: ; 0x02039F68
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl sub_02037454
	add r7, r0, #0
	mov r0, #0
	bl sub_02034818
	cmp r0, #0
	beq _02039FB6
	mov r5, #0
	cmp r7, #0
	ble _02039FB6
_02039F82:
	bl sub_0203769C
	cmp r5, r0
	beq _02039FB0
	add r0, r5, #0
	bl sub_020348A8
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020348CC
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02034818
	bl sub_02029088
	add r3, r0, #0
	ldr r0, [sp]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02039FB8
_02039FB0:
	add r5, r5, #1
	cmp r5, r7
	blt _02039F82
_02039FB6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02039F68

	thumb_func_start sub_02039FB8
sub_02039FB8: ; 0x02039FB8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0202CA94
	cmp r0, #0
	bne _02039FD4
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #1
	bl sub_0202CAE4
_02039FD4:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02039FB8

	thumb_func_start sub_02039FD8
sub_02039FD8: ; 0x02039FD8
	push {r3, r4, r5, lr}
	mov r1, #0x72
	lsl r1, r1, #4
	bl AllocFromHeap
	add r4, r0, #0
	add r0, #0x1f
	mov r1, #0x1f
	bic r0, r1
	bl sub_0209FAE4
	add r5, r0, #0
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02039FD8

	thumb_func_start sub_02039FFC
sub_02039FFC: ; 0x02039FFC
	push {r4, lr}
	add r4, r0, #0
	bl LoadDwcOverlay
	bl LoadOVY38
	add r0, r4, #0
	bl sub_02039FD8
	add r4, r0, #0
	bl UnloadDwcOverlay
	bl UnloadOVY38
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_02039FFC

	thumb_func_start sub_0203A01C
sub_0203A01C: ; 0x0203A01C
	push {r4, lr}
	bl sub_0202C08C
	add r4, r0, #0
	bl sub_020A00BC
	cmp r0, #0
	bne _0203A03A
	ldr r1, _0203A03C ; =0x4144414A
	add r0, r4, #0
	bl sub_020A00B0
	add r0, r4, #0
	bl sub_020A0214
_0203A03A:
	pop {r4, pc}
	.balign 4, 0
_0203A03C: .word 0x4144414A
	thumb_func_end sub_0203A01C

	thumb_func_start sub_0203A040
sub_0203A040: ; 0x0203A040
	push {r3, r4, lr}
	sub sp, #0xc
	bl sub_0202C08C
	add r4, r0, #0
	add r1, sp, #0
	bl sub_020A037C
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020A028C
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end sub_0203A040

	thumb_func_start sub_0203A05C
sub_0203A05C: ; 0x0203A05C
	push {r4, lr}
	bl sub_0202C6F4
	bl sub_0202C08C
	add r4, r0, #0
	bl sub_020A0100
	cmp r0, #0
	beq _0203A07E
	add r0, r4, #0
	bl sub_020A0130
	cmp r0, #0
	beq _0203A07E
	mov r0, #1
	pop {r4, pc}
_0203A07E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203A05C

	thumb_func_start sub_0203A084
sub_0203A084: ; 0x0203A084
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r5, r1, #0
	str r2, [sp]
	bl sub_0202C6F4
	bl sub_0202C08C
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0202C6F4
	mov r1, #0
	bl sub_0202C23C
	add r4, r0, #0
	mov r1, #0
	ldr r0, [sp]
	mvn r1, r1
	str r1, [r0]
	add r0, r5, #0
	bl sub_020A008C
	cmp r0, #0
	bne _0203A0BE
	add sp, #8
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0203A0BE:
	mov r7, #0
_0203A0C0:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020A041C
	cmp r0, #0
	beq _0203A0D6
	ldr r0, [sp]
	add sp, #8
	str r7, [r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0203A0D6:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020A028C
	cmp r0, #0
	ble _0203A104
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020A028C
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r4, #0
	bl sub_020A028C
	ldr r1, [sp, #4]
	cmp r1, r0
	bne _0203A104
	ldr r0, [sp]
	add sp, #8
	str r7, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0203A104:
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #0
	bge _0203A11A
	add r0, r4, #0
	bl sub_020A008C
	cmp r0, #0
	bne _0203A11A
	ldr r0, [sp]
	str r7, [r0]
_0203A11A:
	add r7, r7, #1
	add r4, #0xc
	cmp r7, #0x20
	blt _0203A0C0
	mov r0, #2
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0203A084

	thumb_func_start sub_0203A128
sub_0203A128: ; 0x0203A128
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	add r6, r3, #0
	bl sub_0202C6F4
	bl sub_0202C08C
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0202C6F4
	mov r1, #0
	bl sub_0202C23C
	add r5, r0, #0
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, r7, #0
	bl sub_0209FD0C
	cmp r0, #0
	bne _0203A160
	add sp, #0x18
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0203A160:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, sp, #0xc
	bl sub_020A0340
	add r0, r7, #0
	add r1, sp, #0xc
	bl sub_020A028C
	cmp r0, #0
	bgt _0203A17C
	add sp, #0x18
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0203A17C:
	mov r0, #0
	mvn r0, r0
	str r0, [r6]
	mov r4, #0
_0203A184:
	add r0, r7, #0
	add r1, sp, #0xc
	bl sub_020A028C
	str r0, [sp, #8]
	add r0, r7, #0
	add r1, r5, #0
	bl sub_020A028C
	ldr r1, [sp, #8]
	cmp r1, r0
	bne _0203A1A4
	add sp, #0x18
	str r4, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0203A1A4:
	ldr r0, [r6]
	cmp r0, #0
	bge _0203A1B6
	add r0, r5, #0
	bl sub_020A008C
	cmp r0, #0
	bne _0203A1B6
	str r4, [r6]
_0203A1B6:
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #0x20
	blt _0203A184
	mov r0, #2
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0203A128

	thumb_func_start sub_0203A1C4
sub_0203A1C4: ; 0x0203A1C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	mov r1, #0
	add r5, r0, #0
	str r2, [sp, #4]
	str r1, [sp, #0xc]
	bl sub_0202C6F4
	mov r1, #0
	bl sub_0202C23C
	str r0, [sp, #8]
	mov r4, #0
	bl sub_02037454
	cmp r0, #0
	ble _0203A278
_0203A1E8:
	bl sub_0203769C
	cmp r4, r0
	beq _0203A26C
	add r0, r4, #0
	bl sub_0203484C
	add r7, r0, #0
	beq _0203A26C
	add r0, r5, #0
	add r1, r7, #0
	add r2, sp, #0x10
	bl sub_0203A084
	str r0, [r6]
	cmp r0, #3
	bne _0203A20E
	bl GF_AssertFail
_0203A20E:
	ldr r0, [r6]
	cmp r0, #0
	bne _0203A22C
	mov r0, #2
	str r0, [sp]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203A280
	add r0, r5, #0
	bl sub_02034A20
	b _0203A26C
_0203A22C:
	cmp r0, #1
	bne _0203A264
	bl sub_02039998
	cmp r0, #0
	bne _0203A26C
	mov r0, #1
	str r0, [sp]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203A280
	ldr r2, [sp, #0x10]
	mov r1, #0xc
	add r3, r2, #0
	mul r3, r1
	ldr r1, [sp, #8]
	add r0, r7, #0
	add r1, r1, r3
	mov r2, #0xc
	bl MIi_CpuCopy8
	add r0, r5, #0
	bl sub_02034A20
	b _0203A26C
_0203A264:
	cmp r0, #2
	bne _0203A26C
	mov r0, #1
	str r0, [sp, #0xc]
_0203A26C:
	add r6, r6, #4
	add r4, r4, #1
	bl sub_02037454
	cmp r4, r0
	blt _0203A1E8
_0203A278:
	ldr r0, [sp, #0xc]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203A1C4

	thumb_func_start sub_0203A280
sub_0203A280: ; 0x0203A280
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r2, #0
	str r0, [sp]
	add r7, r1, #0
	str r3, [sp, #4]
	bl sub_0202C6F4
	add r1, r5, #0
	add r4, r0, #0
	bl sub_0202C23C
	str r0, [sp, #8]
	add r0, r7, #0
	bl sub_02034818
	add r6, r0, #0
	ldr r0, [sp, #0x28]
	cmp r0, #2
	beq _0203A2B6
	add r0, r7, #0
	bl sub_0203484C
	ldr r1, [sp, #8]
	mov r2, #0xc
	bl MIi_CpuCopy8
_0203A2B6:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	bne _0203A2FC
	ldr r1, [sp, #4]
	add r0, r6, #0
	bl sub_02028F68
	str r0, [sp, #0xc]
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0202C270
	ldr r0, [sp, #0xc]
	bl String_dtor
	add r0, r6, #0
	bl PlayerProfile_GetTrainerGender
	add r3, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #8
	bl sub_0202C190
	add r0, r6, #0
	bl PlayerProfile_GetTrainerID
	add r3, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl sub_0202C190
	b _0203A334
_0203A2FC:
	sub r0, r0, #1
	cmp r0, #1
	bhi _0203A334
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #8
	bl sub_0202C090
	cmp r0, #2
	bne _0203A334
	add r0, r6, #0
	bl PlayerProfile_GetTrainerGender
	add r3, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #8
	bl sub_0202C190
	add r0, r6, #0
	bl PlayerProfile_GetTrainerID
	add r3, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl sub_0202C190
_0203A334:
	ldr r1, [sp, #4]
	mov r0, #0x78
	bl String_ctor
	str r0, [sp, #0x10]
	add r0, r7, #0
	bl sub_02034884
	add r1, r0, #0
	ldr r0, [sp, #0x10]
	bl CopyU16ArrayToString
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0202C2B4
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r6, #0
	bl sub_0202903C
	add r3, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #7
	bl sub_0202C190
	ldr r0, [sp]
	bl sub_02034A20
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0203A280

	thumb_func_start sub_0203A378
sub_0203A378: ; 0x0203A378
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl sub_0203484C
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0202C6F4
	add r5, r0, #0
	mov r4, #0
_0203A38E:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202C23C
	add r1, r0, #0
	add r0, r6, #0
	bl sub_020A041C
	cmp r0, #0
	beq _0203A3A6
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_0203A3A6:
	add r4, r4, #1
	cmp r4, #0x20
	blt _0203A38E
	mov r0, #0x20
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203A378

	thumb_func_start sub_0203A3B0
sub_0203A3B0: ; 0x0203A3B0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r2, #0
	add r6, r3, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x1c]
	add r3, r4, #0
	bl sub_0203A4D4
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x10]
	add r2, r4, #0
	bl sub_0203A59C
	add r0, r4, #0
	mov r1, #0x24
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	ldr r0, _0203A428 ; =sub_0203A42C
	add r1, r4, #0
	mov r2, #5
	bl sub_0200E374
	str r0, [r4, #0x18]
	ldr r2, [sp, #0x1c]
	strh r5, [r4, #0xc]
	asr r1, r2, #4
	lsr r1, r1, #0x1b
	add r1, r2, r1
	asr r2, r1, #5
	add r1, r4, #0
	strh r6, [r4, #0xe]
	mov r0, #0
	str r0, [r4]
	add r1, #0x20
	strb r2, [r1]
	add r1, r4, #0
	ldr r2, [sp, #0x18]
	add r1, #0x21
	strb r2, [r1]
	add r1, r4, #0
	add r1, #0x22
	strb r0, [r1]
	mov r1, #3
	str r1, [r4, #4]
	ldr r1, [sp, #0x14]
	str r1, [r4, #0x14]
	ldr r1, [sp, #0x10]
	str r0, [r4, #8]
	strb r1, [r4, #0x10]
	strb r0, [r4, #0x12]
	strb r0, [r4, #0x11]
	mov r0, #7
	lsl r0, r0, #0x18
	str r0, [r4, #0x1c]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_0203A428: .word sub_0203A42C
	thumb_func_end sub_0203A3B0

	thumb_func_start sub_0203A42C
sub_0203A42C: ; 0x0203A42C
	ldr r3, _0203A434 ; =sub_0203A700
	add r0, r1, #0
	bx r3
	nop
_0203A434: .word sub_0203A700
	thumb_func_end sub_0203A42C

	thumb_func_start sub_0203A438
sub_0203A438: ; 0x0203A438
	cmp r1, #4
	bge _0203A442
	str r1, [r0, #4]
	mov r1, #0
	str r1, [r0, #8]
_0203A442:
	bx lr
	thumb_func_end sub_0203A438

	thumb_func_start sub_0203A444
sub_0203A444: ; 0x0203A444
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	bl sub_0200E390
	mov r0, #7
	ldr r2, _0203A470 ; =0x40000200
	lsl r0, r0, #0x18
	str r2, [r0]
	mov r1, #0
	strh r1, [r0, #4]
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _0203A466
	ldr r0, _0203A474 ; =0x07000400
	str r2, [r0]
	strh r1, [r0, #4]
_0203A466:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	nop
_0203A470: .word 0x40000200
_0203A474: .word 0x07000400
	thumb_func_end sub_0203A444

	thumb_func_start sub_0203A478
sub_0203A478: ; 0x0203A478
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	mov r2, #7
	ldrb r1, [r5, #0x10]
	mov r0, #2
	lsl r2, r2, #6
	add r3, r6, #0
	bl sub_0203A4D4
	ldrb r1, [r5, #0x10]
	mov r0, #2
	add r2, r6, #0
	bl sub_0203A59C
	cmp r4, #0
	beq _0203A4A0
	mov r0, #1
	b _0203A4A2
_0203A4A0:
	mov r0, #2
_0203A4A2:
	strb r0, [r5, #0x11]
	mov r0, #1
	strb r0, [r5, #0x12]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203A478

	thumb_func_start sub_0203A4AC
sub_0203A4AC: ; 0x0203A4AC
	push {r3, lr}
	mov r1, #0x96
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
	str r0, [sp]
	ldr r0, _0203A4D0 ; =0x0210F930
	add r1, sp, #0
	bl sub_0201A3F8
	mov r1, #0x96
	ldr r0, [sp]
	lsl r1, r1, #2
	bl DC_FlushRange
	ldr r0, [sp]
	pop {r3, pc}
	nop
_0203A4D0: .word 0x0210F930
	thumb_func_end sub_0203A4AC

	thumb_func_start sub_0203A4D4
sub_0203A4D4: ; 0x0203A4D4
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #0x96
	add r5, r0, #0
	add r0, r3, #0
	lsl r1, r1, #2
	add r4, r2, #0
	bl AllocFromHeapAtEnd
	str r0, [sp, #4]
	cmp r0, #0
	beq _0203A52A
	ldr r0, _0203A530 ; =0x0210F930
	add r1, sp, #4
	bl sub_0201A3F8
	mov r1, #0x96
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	bl DC_FlushRange
	ldr r0, [sp, #4]
	add r1, sp, #0
	bl NNS_G2dGetUnpackedPaletteData
	cmp r5, #1
	bne _0203A518
	ldr r0, [sp]
	add r1, r4, #0
	ldr r0, [r0, #0xc]
	mov r2, #0x20
	bl GX_LoadOBJPltt
	b _0203A524
_0203A518:
	ldr r0, [sp]
	add r1, r4, #0
	ldr r0, [r0, #0xc]
	mov r2, #0x20
	bl GXS_LoadOBJPltt
_0203A524:
	ldr r0, [sp, #4]
	bl FreeToHeap
_0203A52A:
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0203A530: .word 0x0210F930
	thumb_func_end sub_0203A4D4

	thumb_func_start sub_0203A534
sub_0203A534: ; 0x0203A534
	push {r0, r1, r2, r3}
	push {r3, lr}
	cmp r0, #0
	ldr r0, _0203A58C ; =0x00300010
	beq _0203A550
	cmp r1, r0
	bne _0203A546
	bl GF_AssertFail
_0203A546:
	ldr r0, _0203A590 ; =0x0210F940
	add r1, sp, #0x14
	bl sub_0201A3F8
	b _0203A578
_0203A550:
	cmp r1, r0
	add r1, sp, #0x14
	beq _0203A568
	ldr r0, _0203A594 ; =0x0210F954
	bl sub_0201A3F8
	mov r1, #0x96
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	bl DC_FlushRange
	b _0203A578
_0203A568:
	ldr r0, _0203A598 ; =0x0210F964
	bl sub_0201A3F8
	mov r1, #0x13
	ldr r0, [sp, #0x14]
	lsl r1, r1, #6
	bl DC_FlushRange
_0203A578:
	ldr r0, [sp, #0x14]
	add r1, sp, #0
	bl NNS_G2dGetUnpackedBGCharacterData
	ldr r0, [sp]
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	nop
_0203A58C: .word 0x00300010
_0203A590: .word 0x0210F940
_0203A594: .word 0x0210F954
_0203A598: .word 0x0210F964
	thumb_func_end sub_0203A534

	thumb_func_start sub_0203A59C
sub_0203A59C: ; 0x0203A59C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	add r5, r2, #0
	str r1, [sp]
	cmp r7, #1
	bne _0203A5BC
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r1, [r0]
	ldr r0, _0203A6E8 ; =0x00300010
	add r4, r1, #0
	and r4, r0
	bl sub_020CEBEC
	b _0203A5CA
_0203A5BC:
	ldr r0, _0203A6EC ; =0x04001000
	ldr r1, [r0]
	ldr r0, _0203A6E8 ; =0x00300010
	add r4, r1, #0
	and r4, r0
	bl sub_020CEC1C
_0203A5CA:
	add r6, r0, #0
	ldr r0, _0203A6E8 ; =0x00300010
	cmp r4, r0
	bne _0203A5E0
	mov r1, #0x13
	add r0, r5, #0
	lsl r1, r1, #6
	bl AllocFromHeapAtEnd
	str r0, [sp, #4]
	b _0203A5EC
_0203A5E0:
	mov r1, #0x96
	add r0, r5, #0
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
	str r0, [sp, #4]
_0203A5EC:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _0203A6E2
	ldr r0, [sp]
	ldr r3, [sp, #4]
	add r1, r4, #0
	add r2, r5, #0
	bl sub_0203A534
	add r5, r0, #0
	ldr r0, _0203A6F0 ; =0x00100010
	cmp r4, r0
	bgt _0203A60E
	bge _0203A634
	cmp r4, #0x10
	beq _0203A620
	b _0203A66E
_0203A60E:
	ldr r0, _0203A6F4 ; =0x00200010
	cmp r4, r0
	bgt _0203A618
	beq _0203A64E
	b _0203A66E
_0203A618:
	ldr r0, _0203A6E8 ; =0x00300010
	cmp r4, r0
	beq _0203A668
	b _0203A66E
_0203A620:
	cmp r6, #0x40
	beq _0203A628
	cmp r6, #0x20
	bne _0203A62E
_0203A628:
	mov r6, #0x3e
	lsl r6, r6, #8
	b _0203A672
_0203A62E:
	mov r6, #0x7e
	lsl r6, r6, #8
	b _0203A672
_0203A634:
	cmp r6, #0x40
	beq _0203A642
	cmp r6, #0x20
	beq _0203A642
	lsr r0, r0, #0xc
	cmp r6, r0
	bne _0203A648
_0203A642:
	mov r6, #0x3e
	lsl r6, r6, #8
	b _0203A672
_0203A648:
	mov r6, #0xfe
	lsl r6, r6, #8
	b _0203A672
_0203A64E:
	cmp r6, #0x30
	beq _0203A656
	cmp r6, #0x50
	bne _0203A65A
_0203A656:
	ldr r6, _0203A6F8 ; =0x00013E00
	b _0203A672
_0203A65A:
	cmp r6, #0x10
	bne _0203A664
	mov r6, #0xfe
	lsl r6, r6, #8
	b _0203A672
_0203A664:
	ldr r6, _0203A6FC ; =0x0001FE00
	b _0203A672
_0203A668:
	mov r6, #0xff
	lsl r6, r6, #0xa
	b _0203A672
_0203A66E:
	mov r6, #0xfe
	lsl r6, r6, #8
_0203A672:
	cmp r7, #1
	ldr r0, _0203A6E8 ; =0x00300010
	bne _0203A6AA
	cmp r4, r0
	ldr r0, [r5, #0x14]
	beq _0203A694
	mov r1, #2
	lsl r1, r1, #8
	bl DC_FlushRange
	mov r2, #2
	ldr r0, [r5, #0x14]
	add r1, r6, #0
	lsl r2, r2, #8
	bl sub_020CFE74
	b _0203A6DC
_0203A694:
	mov r1, #1
	lsl r1, r1, #0xa
	bl DC_FlushRange
	mov r2, #1
	ldr r0, [r5, #0x14]
	add r1, r6, #0
	lsl r2, r2, #0xa
	bl sub_020CFE74
	b _0203A6DC
_0203A6AA:
	cmp r4, r0
	ldr r0, [r5, #0x14]
	beq _0203A6C6
	mov r1, #2
	lsl r1, r1, #8
	bl DC_FlushRange
	mov r2, #2
	ldr r0, [r5, #0x14]
	add r1, r6, #0
	lsl r2, r2, #8
	bl sub_020CFECC
	b _0203A6DC
_0203A6C6:
	mov r1, #1
	lsl r1, r1, #0xa
	bl DC_FlushRange
	mov r1, #0xf
	mov r2, #1
	ldr r0, [r5, #0x14]
	lsl r1, r1, #0xa
	lsl r2, r2, #0xa
	bl sub_020CFECC
_0203A6DC:
	ldr r0, [sp, #4]
	bl FreeToHeap
_0203A6E2:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203A6E8: .word 0x00300010
_0203A6EC: .word 0x04001000
_0203A6F0: .word 0x00100010
_0203A6F4: .word 0x00200010
_0203A6F8: .word 0x00013E00
_0203A6FC: .word 0x0001FE00
	thumb_func_end sub_0203A59C

	thumb_func_start sub_0203A700
sub_0203A700: ; 0x0203A700
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x11]
	cmp r0, #1
	beq _0203A710
	cmp r0, #2
	beq _0203A726
	b _0203A73C
_0203A710:
	ldr r0, _0203A850 ; =0x04000304
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0203A722
	mov r7, #1
	b _0203A742
_0203A722:
	mov r7, #2
	b _0203A742
_0203A726:
	ldr r0, _0203A850 ; =0x04000304
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0203A738
	mov r7, #2
	b _0203A742
_0203A738:
	mov r7, #1
	b _0203A742
_0203A73C:
	add r0, r5, #0
	add r0, #0x21
	ldrb r7, [r0]
_0203A742:
	ldr r4, [r5, #4]
	cmp r7, #1
	bne _0203A75A
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r1, [r0]
	ldr r0, _0203A854 ; =0x00300010
	add r6, r1, #0
	and r6, r0
	bl sub_020CEBEC
	b _0203A768
_0203A75A:
	ldr r0, _0203A858 ; =0x04001000
	ldr r1, [r0]
	ldr r0, _0203A854 ; =0x00300010
	add r6, r1, #0
	and r6, r0
	bl sub_020CEC1C
_0203A768:
	ldr r1, _0203A85C ; =0x00100010
	cmp r6, r1
	bgt _0203A776
	bge _0203A7A4
	cmp r6, #0x10
	beq _0203A788
	b _0203A7F4
_0203A776:
	ldr r1, _0203A860 ; =0x00200010
	cmp r6, r1
	bgt _0203A780
	beq _0203A7BC
	b _0203A7F4
_0203A780:
	ldr r1, _0203A854 ; =0x00300010
	cmp r6, r1
	beq _0203A7E0
	b _0203A7F4
_0203A788:
	cmp r0, #0x40
	beq _0203A790
	cmp r0, #0x20
	bne _0203A79A
_0203A790:
	mov r0, #0x1f
	lsl r1, r4, #2
	lsl r0, r0, #4
	add r3, r1, r0
	b _0203A7FC
_0203A79A:
	mov r0, #0x3f
	lsl r1, r4, #2
	lsl r0, r0, #4
	add r3, r1, r0
	b _0203A7FC
_0203A7A4:
	cmp r0, #0x40
	beq _0203A7B2
	cmp r0, #0x20
	beq _0203A7B2
	lsr r1, r1, #0xc
	cmp r0, r1
	bne _0203A7F4
_0203A7B2:
	mov r0, #0x7e
	lsl r1, r4, #1
	lsl r0, r0, #2
	add r3, r1, r0
	b _0203A7FC
_0203A7BC:
	cmp r0, #0x30
	beq _0203A7C4
	cmp r0, #0x50
	bne _0203A7CC
_0203A7C4:
	mov r0, #0x9f
	lsl r0, r0, #2
	add r3, r4, r0
	b _0203A7FC
_0203A7CC:
	cmp r0, #0x10
	bne _0203A7D8
	mov r0, #0x7f
	lsl r0, r0, #2
	add r3, r4, r0
	b _0203A7FC
_0203A7D8:
	mov r0, #0xff
	lsl r0, r0, #2
	add r3, r4, r0
	b _0203A7FC
_0203A7E0:
	cmp r0, #3
	bne _0203A7EC
	mov r0, #0xff
	lsl r0, r0, #2
	add r3, r4, r0
	b _0203A7FC
_0203A7EC:
	mov r0, #0x7f
	lsl r0, r0, #2
	add r3, r4, r0
	b _0203A7FC
_0203A7F4:
	mov r0, #0xfe
	lsl r1, r4, #1
	lsl r0, r0, #2
	add r3, r1, r0
_0203A7FC:
	cmp r7, #1
	bne _0203A806
	mov r4, #7
	lsl r4, r4, #0x18
	b _0203A808
_0203A806:
	ldr r4, _0203A864 ; =0x07000400
_0203A808:
	add r0, r5, #0
	add r0, #0x20
	ldrb r2, [r0]
	add r0, r5, #0
	add r0, #0x22
	ldrb r1, [r0]
	ldrh r6, [r5, #0xe]
	ldrh r0, [r5, #0xc]
	lsl r1, r1, #0xa
	lsl r6, r6, #0x18
	lsr r6, r6, #0x18
	orr r6, r1
	mov r1, #1
	lsl r0, r0, #0x17
	lsl r1, r1, #0x1e
	lsr r0, r0, #7
	orr r1, r6
	orr r0, r1
	str r0, [r4]
	lsl r0, r2, #0xc
	orr r0, r3
	strh r0, [r4, #4]
	ldr r0, [r5, #0x1c]
	cmp r4, r0
	beq _0203A84E
	add r1, r5, #0
	add r1, #0x22
	ldrb r1, [r1]
	lsl r2, r1, #0xa
	ldr r1, _0203A868 ; =0x40000200
	orr r1, r2
	str r1, [r0]
	mov r1, #0
	strh r1, [r0, #4]
	str r4, [r5, #0x1c]
_0203A84E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203A850: .word 0x04000304
_0203A854: .word 0x00300010
_0203A858: .word 0x04001000
_0203A85C: .word 0x00100010
_0203A860: .word 0x00200010
_0203A864: .word 0x07000400
_0203A868: .word 0x40000200
	thumb_func_end sub_0203A700

	thumb_func_start sub_0203A86C
sub_0203A86C: ; 0x0203A86C
	push {r3, lr}
	ldr r0, _0203A87C ; =0x021D4154
	ldr r0, [r0]
	cmp r0, #0
	beq _0203A87A
	bl sub_0203A700
_0203A87A:
	pop {r3, pc}
	.balign 4, 0
_0203A87C: .word 0x021D4154
	thumb_func_end sub_0203A86C

	thumb_func_start sub_0203A880
sub_0203A880: ; 0x0203A880
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #0
	bl sub_02039998
	cmp r0, #0
	beq _0203A890
	mov r4, #1
_0203A890:
	mov r0, #7
	lsl r0, r0, #6
	str r0, [sp]
	mov r0, #0xf0
	mov r1, #0
	add r2, r4, #0
	mov r3, #1
	bl sub_0203A8CC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203A880

	thumb_func_start sub_0203A8A8
sub_0203A8A8: ; 0x0203A8A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	bl sub_02039998
	cmp r0, #0
	beq _0203A8B8
	mov r4, #1
_0203A8B8:
	mov r0, #0x1e
	lsl r0, r0, #4
	str r0, [sp]
	mov r0, #0xf0
	mov r1, #0
	add r2, r4, #0
	add r3, r5, #0
	bl sub_0203A8CC
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203A8A8

	thumb_func_start sub_0203A8CC
sub_0203A8CC: ; 0x0203A8CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl sub_02034DCC
	cmp r0, #0
	beq _0203A908
	ldr r0, _0203A90C ; =0x021D4154
	ldr r0, [r0]
	cmp r0, #0
	beq _0203A8EC
	bl sub_0203A914
_0203A8EC:
	ldr r0, _0203A910 ; =0x0210F91C
	str r5, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #0
	mov r1, #0x59
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0203A3B0
	ldr r1, _0203A90C ; =0x021D4154
	str r0, [r1]
_0203A908:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203A90C: .word 0x021D4154
_0203A910: .word 0x0210F91C
	thumb_func_end sub_0203A8CC

	thumb_func_start sub_0203A914
sub_0203A914: ; 0x0203A914
	push {r3, lr}
	ldr r0, _0203A92C ; =0x021D4154
	ldr r0, [r0]
	cmp r0, #0
	beq _0203A928
	bl sub_0203A444
	ldr r0, _0203A92C ; =0x021D4154
	mov r1, #0
	str r1, [r0]
_0203A928:
	pop {r3, pc}
	nop
_0203A92C: .word 0x021D4154
	thumb_func_end sub_0203A914

	thumb_func_start sub_0203A930
sub_0203A930: ; 0x0203A930
	push {r3, lr}
	add r1, r0, #0
	ldr r0, _0203A944 ; =0x021D4154
	ldr r0, [r0]
	cmp r0, #0
	beq _0203A940
	bl sub_0203A438
_0203A940:
	pop {r3, pc}
	nop
_0203A944: .word 0x021D4154
	thumb_func_end sub_0203A930

	thumb_func_start sub_0203A948
sub_0203A948: ; 0x0203A948
	push {r3, lr}
	add r3, r0, #0
	ldr r0, _0203A960 ; =0x021D4154
	add r2, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	beq _0203A95C
	add r1, r3, #0
	bl sub_0203A478
_0203A95C:
	pop {r3, pc}
	nop
_0203A960: .word 0x021D4154
	thumb_func_end sub_0203A948

	thumb_func_start sub_0203A964
sub_0203A964: ; 0x0203A964
	push {r3, lr}
	bl sub_02037474
	cmp r0, #0
	beq _0203A984
	bl sub_02037454
	cmp r0, #1
	bgt _0203A97E
	bl sub_02039998
	cmp r0, #0
	beq _0203A990
_0203A97E:
	bl sub_0203A880
	pop {r3, pc}
_0203A984:
	bl sub_02039998
	cmp r0, #0
	beq _0203A990
	bl sub_0203A880
_0203A990:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203A964

	thumb_func_start sub_0203A994
sub_0203A994: ; 0x0203A994
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037474
	cmp r0, #0
	beq _0203A9B8
	bl sub_02037454
	cmp r0, #1
	bgt _0203A9B0
	bl sub_02039998
	cmp r0, #0
	beq _0203A9C6
_0203A9B0:
	add r0, r4, #0
	bl sub_0203A8A8
	pop {r4, pc}
_0203A9B8:
	bl sub_02039998
	cmp r0, #0
	beq _0203A9C6
	add r0, r4, #0
	bl sub_0203A8A8
_0203A9C6:
	pop {r4, pc}
	thumb_func_end sub_0203A994

	thumb_func_start sub_0203A9C8
sub_0203A9C8: ; 0x0203A9C8
	ldr r0, _0203A9D8 ; =0x021D4154
	ldr r1, [r0]
	cmp r1, #0
	beq _0203A9D6
	mov r0, #1
	add r1, #0x22
	strb r0, [r1]
_0203A9D6:
	bx lr
	.balign 4, 0
_0203A9D8: .word 0x021D4154
	thumb_func_end sub_0203A9C8

	thumb_func_start sub_0203A9DC
sub_0203A9DC: ; 0x0203A9DC
	ldr r3, _0203A9F0 ; =OSi_IntrTable
	ldr r1, _0203A9F4 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	ldr r3, _0203A9F8 ; =sub_020D422C
	mov r0, #3
	bx r3
	nop
_0203A9F0: .word OSi_IntrTable
_0203A9F4: .word 0x00003FF8
_0203A9F8: .word sub_020D422C
	thumb_func_end sub_0203A9DC

	thumb_func_start sub_0203A9FC
sub_0203A9FC: ; 0x0203A9FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020393C8
	cmp r0, #0
	beq _0203AA10
	bl sub_02037D78
	cmp r0, #0
	bne _0203AA14
_0203AA10:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203AA14:
	bl sub_020392D8
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl ov00_021E6A70
	ldr r1, [r4]
	cmp r0, #0xb
	str r1, [r5]
	beq _0203AA36
	cmp r0, #0xe
	bge _0203AA36
	ldr r0, [r4]
	sub r0, #0x19
	cmp r0, #1
	bhi _0203AA40
_0203AA36:
	ldr r0, [r4, #4]
	cmp r0, #2
	beq _0203AA40
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203AA40:
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203A9FC

	thumb_func_start sub_0203AA44
sub_0203AA44: ; 0x0203AA44
	push {r0, r1, r2, r3}
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r0, #0
	cmp r1, #6
	bhi _0203AA6A
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203AA5C: ; jump table
	.short _0203AA6A - _0203AA5C - 2 ; case 0
	.short _0203AA6E - _0203AA5C - 2 ; case 1
	.short _0203AA72 - _0203AA5C - 2 ; case 2
	.short _0203AA76 - _0203AA5C - 2 ; case 3
	.short _0203AA7A - _0203AA5C - 2 ; case 4
	.short _0203AA7E - _0203AA5C - 2 ; case 5
	.short _0203AA90 - _0203AA5C - 2 ; case 6
_0203AA6A:
	mov r5, #1
	b _0203AAA0
_0203AA6E:
	mov r5, #2
	b _0203AAA0
_0203AA72:
	mov r5, #3
	b _0203AAA0
_0203AA76:
	mov r5, #4
	b _0203AAA0
_0203AA7A:
	mov r5, #5
	b _0203AAA0
_0203AA7E:
	add r0, sp, #0x40
	bl sub_0203A9FC
	cmp r0, #0
	bne _0203AA8C
	mov r5, #6
	b _0203AAA0
_0203AA8C:
	mov r5, #8
	b _0203AAA0
_0203AA90:
	add r0, sp, #0x40
	bl sub_0203A9FC
	cmp r0, #0
	bne _0203AA9E
	mov r5, #7
	b _0203AAA0
_0203AA9E:
	mov r5, #9
_0203AAA0:
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #1
	bl sub_020D1204
	ldr r1, _0203AC54 ; =sub_0203A9DC
	mov r0, #1
	bl sub_020D1004
	mov r0, #1
	bl sub_020D11D4
	mov r0, #0
	add r1, r0, #0
	bl sub_0201A0FC
	mov r0, #0
	add r1, r0, #0
	bl sub_0201A120
	bl sub_02022C54
	bl sub_02022CBC
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0203AC58 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _0203AC5C ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #8
	bl sub_0201A71C
	ldr r0, _0203AC60 ; =gMain + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl sub_02022D3C
	ldr r3, _0203AC64 ; =0x04000050
	mov r1, #0
	strh r1, [r3]
	ldr r0, _0203AC68 ; =0x04001050
	sub r3, #0x50
	strh r1, [r0]
	ldr r2, [r3]
	ldr r1, _0203AC6C ; =0xFFFF1FFF
	sub r0, #0x50
	and r2, r1
	str r2, [r3]
	ldr r2, [r0]
	and r1, r2
	str r1, [r0]
	ldr r0, _0203AC70 ; =0x020F6B04
	bl GX_SetBanks
	add r0, r4, #0
	bl sub_0201AC88
	add r6, r0, #0
	ldr r0, _0203AC74 ; =0x020F6AD8
	bl sub_0201ACB0
	mov r1, #0
	ldr r2, _0203AC78 ; =0x020F6AE8
	add r0, r6, #0
	add r3, r1, #0
	bl sub_0201B1E4
	add r0, r6, #0
	mov r1, #0
	bl sub_0201CAE0
	mov r1, #0
	str r1, [sp]
	ldr r2, _0203AC7C ; =0x000001F7
	add r0, r6, #0
	mov r3, #2
	str r4, [sp, #4]
	bl sub_0200E3DC
	mov r0, #0
	mov r1, #0x20
	add r2, r4, #0
	bl sub_02003030
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	add r3, r4, #0
	bl sub_0201C1C4
	ldr r1, _0203AC80 ; =0x00006C21
	mov r0, #0
	bl sub_0201C2D8
	ldr r1, _0203AC80 ; =0x00006C21
	mov r0, #4
	bl sub_0201C2D8
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x29
	add r3, r4, #0
	bl NewMsgDataFromNarc
	str r0, [sp, #0xc]
	mov r0, #6
	lsl r0, r0, #6
	add r1, r4, #0
	bl String_ctor
	add r7, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	add r1, r4, #0
	bl String_ctor
	str r0, [sp, #0x10]
	bl sub_02020080
	add r0, r4, #0
	bl ScrStrBufs_new
	add r4, r0, #0
	ldr r2, _0203AC84 ; =0x020F6AD0
	add r0, r6, #0
	add r1, sp, #0x14
	bl AddWindow
	mov r0, #0xd0
	str r0, [sp]
	mov r0, #0x90
	mov r2, #0
	str r0, [sp, #4]
	add r0, sp, #0x14
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r2, _0203AC7C ; =0x000001F7
	add r0, sp, #0x14
	mov r1, #0
	mov r3, #2
	bl sub_0200E580
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x40]
	add r0, r4, #0
	mov r1, #0
	mov r3, #5
	bl BufferIntegerAsString
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r1, r5, #0
	bl ReadMsgDataIntoString
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	add r1, r7, #0
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	add r0, sp, #0x14
	add r2, r7, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r7, #0
	bl String_dtor
	bl sub_02022D24
	mov r0, #0
	bl sub_0200FBE8
	mov r0, #1
	bl sub_0200FBE8
	mov r0, #0
	mov r1, #0x3f
	mov r2, #3
	bl sub_0200B4F0
	add r0, sp, #0x14
	bl RemoveWindow
	ldr r0, [sp, #0xc]
	bl DestroyMsgData
	add r0, r4, #0
	bl ScrStrBufs_delete
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x24
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_0203AC54: .word sub_0203A9DC
_0203AC58: .word 0xFFFFE0FF
_0203AC5C: .word 0x04001000
_0203AC60: .word gMain + 0x60
_0203AC64: .word 0x04000050
_0203AC68: .word 0x04001050
_0203AC6C: .word 0xFFFF1FFF
_0203AC70: .word 0x020F6B04
_0203AC74: .word 0x020F6AD8
_0203AC78: .word 0x020F6AE8
_0203AC7C: .word 0x000001F7
_0203AC80: .word 0x00006C21
_0203AC84: .word 0x020F6AD0
	thumb_func_end sub_0203AA44

	thumb_func_start sub_0203AC88
sub_0203AC88: ; 0x0203AC88
	ldr r0, _0203AC8C ; =0x020F6B2C
	bx lr
	.balign 4, 0
_0203AC8C: .word 0x020F6B2C
	thumb_func_end sub_0203AC88

	thumb_func_start sub_0203AC90
sub_0203AC90: ; 0x0203AC90
	mov r0, #3
	bx lr
	thumb_func_end sub_0203AC90

	thumb_func_start ShowWFCUserInfoWarning
ShowWFCUserInfoWarning: ; 0x0203AC94
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	add r1, r0, #0
	bl sub_0201A0FC
	mov r0, #0
	add r1, r0, #0
	bl sub_0201A120
	bl sub_02022C54
	bl sub_02022CBC
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0203AE70 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _0203AE74 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #8
	bl sub_0201A71C
	ldr r0, _0203AE78 ; =gMain + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl sub_02022D3C
	ldr r3, _0203AE7C ; =0x04000050
	mov r0, #0
	strh r0, [r3]
	ldr r2, _0203AE80 ; =0x04001050
	sub r3, #0x50
	strh r0, [r2]
	ldr r1, [r3]
	ldr r0, _0203AE84 ; =0xFFFF1FFF
	sub r2, #0x50
	and r1, r0
	str r1, [r3]
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r0, _0203AE88 ; =0x020F6B84
	bl GX_SetBanks
	add r0, r4, #0
	bl sub_0201AC88
	str r0, [sp, #0x10]
	ldr r0, _0203AE8C ; =0x020F6B58
	bl sub_0201ACB0
	mov r1, #0
	ldr r0, [sp, #0x10]
	ldr r2, _0203AE90 ; =0x020F6B68
	add r3, r1, #0
	bl sub_0201B1E4
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl sub_0201CAE0
	mov r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x10]
	ldr r2, _0203AE94 ; =0x000001F7
	mov r3, #2
	str r4, [sp, #4]
	bl sub_0200E3DC
	mov r0, #0
	mov r1, #0x20
	add r2, r4, #0
	bl sub_02003030
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	add r3, r4, #0
	bl sub_0201C1C4
	ldr r1, _0203AE98 ; =0x00006C21
	mov r0, #0
	bl sub_0201C2D8
	ldr r1, _0203AE98 ; =0x00006C21
	mov r0, #4
	bl sub_0201C2D8
	mov r2, #0x32
	mov r0, #1
	mov r1, #0x1b
	lsl r2, r2, #4
	add r3, r4, #0
	bl NewMsgDataFromNarc
	str r0, [sp, #0xc]
	mov r0, #6
	lsl r0, r0, #6
	add r1, r4, #0
	bl String_ctor
	add r4, r0, #0
	bl sub_02020080
	ldr r0, [sp, #0x10]
	ldr r2, _0203AE9C ; =0x020F6B50
	add r1, sp, #0x14
	bl AddWindow
	mov r0, #0xd0
	str r0, [sp]
	mov r0, #0x90
	mov r2, #0
	str r0, [sp, #4]
	add r0, sp, #0x14
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r2, _0203AE94 ; =0x000001F7
	add r0, sp, #0x14
	mov r1, #0
	mov r3, #2
	bl sub_0200E580
	ldr r0, [sp, #0xc]
	mov r1, #0x10
	add r2, r4, #0
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	add r0, sp, #0x14
	add r2, r4, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl String_dtor
	bl sub_02022D24
	mov r0, #0
	bl sub_0200FBE8
	mov r0, #1
	bl sub_0200FBE8
	mov r0, #0
	mov r1, #0x3f
	mov r2, #3
	bl sub_0200B4F0
	ldr r4, _0203AEA0 ; =0x04000130
	ldr r6, _0203AEA4 ; =0x027FFFA8
	mov r7, #1
_0203ADEE:
	ldrh r1, [r4]
	ldrh r0, [r6]
	orr r1, r0
	ldr r0, _0203AEA8 ; =0x00002FFF
	eor r1, r0
	and r0, r1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	bl HandleDSLidAction
	add r0, r5, #0
	tst r0, r7
	bne _0203AE12
	mov r0, #1
	add r1, r0, #0
	bl OS_WaitIrq
	b _0203ADEE
_0203AE12:
	add r0, sp, #0x14
	bl RemoveWindow
	ldr r0, [sp, #0xc]
	bl DestroyMsgData
	mov r0, #0
	add r1, r0, #0
	bl sub_0201BC28
	mov r0, #1
	mov r1, #0
	bl sub_0201BC28
	mov r0, #2
	mov r1, #0
	bl sub_0201BC28
	mov r0, #3
	mov r1, #0
	bl sub_0201BC28
	mov r0, #4
	mov r1, #0
	bl sub_0201BC28
	mov r0, #5
	mov r1, #0
	bl sub_0201BC28
	mov r0, #6
	mov r1, #0
	bl sub_0201BC28
	mov r0, #7
	mov r1, #0
	bl sub_0201BC28
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl sub_0201BB4C
	ldr r0, [sp, #0x10]
	bl FreeToHeap
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0203AE70: .word 0xFFFFE0FF
_0203AE74: .word 0x04001000
_0203AE78: .word gMain + 0x60
_0203AE7C: .word 0x04000050
_0203AE80: .word 0x04001050
_0203AE84: .word 0xFFFF1FFF
_0203AE88: .word 0x020F6B84
_0203AE8C: .word 0x020F6B58
_0203AE90: .word 0x020F6B68
_0203AE94: .word 0x000001F7
_0203AE98: .word 0x00006C21
_0203AE9C: .word 0x020F6B50
_0203AEA0: .word 0x04000130
_0203AEA4: .word 0x027FFFA8
_0203AEA8: .word 0x00002FFF
	thumb_func_end ShowWFCUserInfoWarning

	thumb_func_start sub_0203AEAC
sub_0203AEAC: ; 0x0203AEAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	str r2, [sp]
	mov r2, #0
	strb r2, [r4, #1]
	mov r7, #0x19
	mov r6, #0x96
	ldr r0, _0203AF94 ; =0x0000031F
	mov ip, r1
	strb r2, [r4]
	add r3, r4, #0
	add r5, r2, #0
	lsl r7, r7, #6
	lsl r6, r6, #4
_0203AECA:
	add r1, r4, r2
	strh r5, [r3, #2]
	strb r5, [r1, r7]
	strh r5, [r3, r6]
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, r0
	blt _0203AECA
	ldr r0, _0203AF98 ; =0x00000F9E
	mov r2, #0
_0203AEDE:
	add r1, r4, r5
	add r5, r5, #1
	strb r2, [r1, r0]
	cmp r5, #0x10
	blt _0203AEDE
	mov r0, #0x29
	mov r1, ip
	mov r2, #0xb
	bl AllocAtEndAndReadWholeNarcMemberByIdPair
	add r6, r0, #0
	ldrb r0, [r6]
	add r5, r6, #5
	strb r0, [r4, #1]
	ldrb r0, [r6, #1]
	strb r0, [r4]
	ldrb r0, [r6, #2]
	str r0, [sp, #8]
	ldrb r0, [r6, #3]
	str r0, [sp, #4]
	ldrb r7, [r6, #4]
	cmp r7, #0x10
	bls _0203AF10
	bl GF_AssertFail
_0203AF10:
	ldr r1, _0203AF98 ; =0x00000F9E
	add r0, r5, #0
	add r1, r4, r1
	add r2, r7, #0
	bl MIi_CpuCopy8
	ldr r0, [sp, #8]
	add r5, r5, r7
	cmp r0, #0
	beq _0203AF40
	ldrb r3, [r4, #1]
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #2
	mul r2, r3
	lsl r2, r2, #1
	bl MIi_CpuCopy8
	ldrb r1, [r4, #1]
	ldrb r0, [r4]
	mul r0, r1
	lsl r0, r0, #1
	add r5, r5, r0
	b _0203AF54
_0203AF40:
	ldrb r3, [r4, #1]
	ldrb r2, [r4]
	ldr r0, [sp]
	add r1, r4, #2
	lsl r0, r0, #0x10
	mul r2, r3
	lsr r0, r0, #0x10
	lsl r2, r2, #1
	bl sub_020D4790
_0203AF54:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _0203AF74
	ldrb r3, [r4, #1]
	ldrb r2, [r4]
	mov r1, #0x19
	lsl r1, r1, #6
	add r0, r5, #0
	add r1, r4, r1
	mul r2, r3
	bl MIi_CpuCopy8
	ldrb r1, [r4, #1]
	ldrb r0, [r4]
	mul r0, r1
	add r5, r5, r0
_0203AF74:
	ldrb r3, [r4, #1]
	ldrb r2, [r4]
	mov r1, #0x96
	lsl r1, r1, #4
	mul r2, r3
	add r0, r5, #0
	add r1, r4, r1
	lsl r2, r2, #1
	bl MIi_CpuCopy8
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0203AF94: .word 0x0000031F
_0203AF98: .word 0x00000F9E
	thumb_func_end sub_0203AEAC

	thumb_func_start sub_0203AF9C
sub_0203AF9C: ; 0x0203AF9C
	push {r3, lr}
	ldr r1, _0203AFB0 ; =0x00000FB2
	mov r0, #0xb
	bl AllocFromHeap
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	pop {r3, pc}
	.balign 4, 0
_0203AFB0: .word 0x00000FB2
	thumb_func_end sub_0203AF9C

	thumb_func_start sub_0203AFB4
sub_0203AFB4: ; 0x0203AFB4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203B2AC
	add r6, r0, #0
	add r0, r4, #4
	add r1, r6, #0
	add r2, r5, #0
	bl sub_0203AEAC
	strb r6, [r4, #2]
	ldrb r0, [r4, #4]
	strb r0, [r4, #1]
	ldrb r0, [r4, #5]
	strb r0, [r4]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203AFB4

	thumb_func_start sub_0203AFD8
sub_0203AFD8: ; 0x0203AFD8
	ldr r3, _0203AFDC ; =FreeToHeap
	bx r3
	.balign 4, 0
_0203AFDC: .word FreeToHeap
	thumb_func_end sub_0203AFD8

	thumb_func_start sub_0203AFE0
sub_0203AFE0: ; 0x0203AFE0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	mul r0, r1
	cmp r5, r0
	blt _0203AFF4
	bl GF_AssertFail
_0203AFF4:
	lsl r0, r5, #1
	add r1, r4, r0
	ldr r0, _0203B000 ; =0x00000964
	ldrh r0, [r1, r0]
	pop {r3, r4, r5, pc}
	nop
_0203B000: .word 0x00000964
	thumb_func_end sub_0203AFE0

	thumb_func_start sub_0203B004
sub_0203B004: ; 0x0203B004
	push {r4, lr}
	add r4, r0, #0
	bne _0203B00E
	bl GF_AssertFail
_0203B00E:
	ldrb r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203B004

	thumb_func_start sub_0203B014
sub_0203B014: ; 0x0203B014
	push {r4, lr}
	add r4, r0, #0
	bne _0203B01E
	bl GF_AssertFail
_0203B01E:
	ldrb r0, [r4, #1]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203B014

	thumb_func_start sub_0203B024
sub_0203B024: ; 0x0203B024
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldrb r0, [r7, #1]
	add r5, r1, #0
	add r4, r2, #0
	ldrb r6, [r7]
	str r0, [sp]
	cmp r5, #0
	blt _0203B03A
	cmp r5, r6
	blt _0203B03E
_0203B03A:
	bl GF_AssertFail
_0203B03E:
	cmp r4, #0
	blt _0203B048
	ldr r0, [sp]
	cmp r4, r0
	blt _0203B04C
_0203B048:
	bl GF_AssertFail
_0203B04C:
	add r0, r4, #0
	mul r0, r6
	add r0, r5, r0
	lsl r0, r0, #1
	add r0, r7, r0
	ldrh r0, [r0, #6]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203B024

	thumb_func_start sub_0203B05C
sub_0203B05C: ; 0x0203B05C
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end sub_0203B05C

	thumb_func_start sub_0203B060
sub_0203B060: ; 0x0203B060
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [sp, #0x10]
	add r4, r2, #0
	add r6, r3, #0
	cmp r4, r0
	blt _0203B072
	bl GF_AssertFail
_0203B072:
	ldr r0, [sp, #0x10]
	mul r0, r6
	add r4, r4, r0
	ldr r0, _0203B08C ; =0x0000031F
	cmp r4, r0
	blt _0203B082
	bl GF_AssertFail
_0203B082:
	ldr r0, _0203B090 ; =0x00000644
	add r1, r5, r4
	ldrb r0, [r1, r0]
	pop {r4, r5, r6, pc}
	nop
_0203B08C: .word 0x0000031F
_0203B090: .word 0x00000644
	thumb_func_end sub_0203B060

	thumb_func_start sub_0203B094
sub_0203B094: ; 0x0203B094
	push {r3, r4, r5, lr}
	ldr r1, _0203B0C4 ; =0x0000063E
	add r4, r0, #0
	bl AllocFromHeap
	add r5, r0, #0
	mov r0, #0x29
	mov r1, #0
	add r2, r4, #0
	bl AllocAtEndAndReadWholeNarcMemberByIdPair
	add r4, r0, #0
	ldrb r1, [r4, #4]
	add r0, r4, #5
	ldr r2, _0203B0C4 ; =0x0000063E
	add r0, r0, r1
	add r1, r5, #0
	bl MIi_CpuCopy8
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203B0C4: .word 0x0000063E
	thumb_func_end sub_0203B094

	thumb_func_start sub_0203B0C8
sub_0203B0C8: ; 0x0203B0C8
	push {r4, lr}
	add r4, r0, #0
	bne _0203B0D2
	bl GF_AssertFail
_0203B0D2:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203B0C8

	thumb_func_start sub_0203B0DC
sub_0203B0DC: ; 0x0203B0DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bne _0203B0E8
	bl GF_AssertFail
_0203B0E8:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203AFE0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203B0DC

	thumb_func_start sub_0203B0F4
sub_0203B0F4: ; 0x0203B0F4
	ldr r1, _0203B110 ; =0x00000964
	ldrb r2, [r0]
	add r3, r0, r1
	ldrb r0, [r0, #2]
	cmp r0, #0
	bne _0203B10C
	lsl r0, r2, #2
	add r0, r2, r0
	add r0, #0x10
	mov r1, #0x56
	lsl r0, r0, #1
	strh r1, [r3, r0]
_0203B10C:
	bx lr
	nop
_0203B110: .word 0x00000964
	thumb_func_end sub_0203B0F4

	thumb_func_start sub_0203B114
sub_0203B114: ; 0x0203B114
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r1, #0
	bl sub_020503D0
	add r4, r0, #0
	add r0, sp, #0
	bl GF_RTC_CopyDate
	add r0, r4, #0
	mov r1, #0xca
	bl sub_020503DC
	cmp r0, #0
	bne _0203B140
	add r0, r4, #0
	mov r1, #1
	bl sub_02066C4C
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203B140:
	cmp r5, #0x58
	beq _0203B148
	cmp r5, #0x2d
	bne _0203B14E
_0203B148:
	ldr r0, [sp, #0xc]
	cmp r0, #3
	beq _0203B15C
_0203B14E:
	add r0, r4, #0
	mov r1, #1
	bl sub_02066C4C
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203B15C:
	add r0, r4, #0
	mov r1, #1
	bl sub_02066C1C
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203B114

	thumb_func_start sub_0203B16C
sub_0203B16C: ; 0x0203B16C
	ldr r2, _0203B1F8 ; =0x00000964
	add r3, r0, r2
	ldrb r2, [r0]
	ldrb r0, [r0, #2]
	cmp r0, #0
	bne _0203B1F6
	cmp r1, #0
	beq _0203B1BA
	add r0, r2, #0
	add r0, #0xf
	mov r1, #0x5f
	lsl r0, r0, #1
	strh r1, [r3, r0]
	add r0, r2, #0
	add r0, #0x10
	mov r1, #0x60
	lsl r0, r0, #1
	strh r1, [r3, r0]
	add r0, r2, #0
	add r0, #0x11
	mov r1, #0x61
	lsl r0, r0, #1
	strh r1, [r3, r0]
	lsl r0, r2, #1
	add r1, r0, #0
	add r1, #0xf
	mov r2, #0x62
	lsl r1, r1, #1
	strh r2, [r3, r1]
	add r1, r0, #0
	add r1, #0x10
	add r0, #0x11
	mov r2, #0x63
	lsl r1, r1, #1
	strh r2, [r3, r1]
	mov r1, #0x64
	lsl r0, r0, #1
	strh r1, [r3, r0]
	bx lr
_0203B1BA:
	add r0, r2, #0
	add r0, #0xf
	mov r1, #0x59
	lsl r0, r0, #1
	strh r1, [r3, r0]
	add r0, r2, #0
	add r0, #0x10
	mov r1, #0x5a
	lsl r0, r0, #1
	strh r1, [r3, r0]
	add r0, r2, #0
	add r0, #0x11
	mov r1, #0x5b
	lsl r0, r0, #1
	strh r1, [r3, r0]
	lsl r0, r2, #1
	add r1, r0, #0
	add r1, #0xf
	mov r2, #0x5c
	lsl r1, r1, #1
	strh r2, [r3, r1]
	add r1, r0, #0
	add r1, #0x10
	add r0, #0x11
	mov r2, #0x5d
	lsl r1, r1, #1
	strh r2, [r3, r1]
	mov r1, #0x5e
	lsl r0, r0, #1
	strh r1, [r3, r0]
_0203B1F6:
	bx lr
	.balign 4, 0
_0203B1F8: .word 0x00000964
	thumb_func_end sub_0203B16C

	thumb_func_start sub_0203B1FC
sub_0203B1FC: ; 0x0203B1FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r2, _0203B264 ; =0x00000964
	add r2, r0, r2
	str r2, [sp, #8]
	ldrb r2, [r0]
	ldrb r0, [r0, #2]
	str r2, [sp, #4]
	cmp r0, #0xd4
	bne _0203B260
	add r0, r1, #0
	bl sub_0202F57C
	mov r1, #3
	bl sub_0202F630
	mov r7, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	add r6, r7, #0
	lsl r0, r0, #1
	mov ip, r0
	mov r0, #0xa3
	add r2, r7, #0
	lsl r0, r0, #2
_0203B22E:
	mov r3, #0x7a
	add r4, r6, #0
	mul r4, r3
	ldr r3, [sp]
	lsl r5, r2, #1
	add r3, r3, r4
	ldr r4, [sp, #8]
	mov r1, #0
	add r5, r4, r5
	mov r4, ip
	add r4, r5, r4
_0203B244:
	ldrb r5, [r3]
	add r1, r1, #1
	add r3, #0x7a
	add r5, r5, r0
	strh r5, [r4, #2]
	add r4, r4, #2
	cmp r1, #3
	blt _0203B244
	ldr r1, [sp, #4]
	add r7, r7, #1
	add r6, r6, #3
	add r2, r2, r1
	cmp r7, #2
	blt _0203B22E
_0203B260:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0203B264: .word 0x00000964
	thumb_func_end sub_0203B1FC

	thumb_func_start sub_0203B268
sub_0203B268: ; 0x0203B268
	push {r3, lr}
	mov r1, #0x87
	lsl r1, r1, #2
	cmp r0, r1
	blo _0203B278
	bl GF_AssertFail
	mov r0, #1
_0203B278:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203B268

	thumb_func_start sub_0203B27C
sub_0203B27C: ; 0x0203B27C
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B28C ; =0x020F6BE1
	ldrb r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0203B28C: .word 0x020F6BE1
	thumb_func_end sub_0203B27C

	thumb_func_start sub_0203B290
sub_0203B290: ; 0x0203B290
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B2A8 ; =0x020F6BE0
	add r0, r0, r1
	ldrh r0, [r0, #2]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	pop {r3, pc}
	nop
_0203B2A8: .word 0x020F6BE0
	thumb_func_end sub_0203B290

	thumb_func_start sub_0203B2AC
sub_0203B2AC: ; 0x0203B2AC
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B2BC ; =0x020F6BE4
	ldrh r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0203B2BC: .word 0x020F6BE4
	thumb_func_end sub_0203B2AC

	thumb_func_start sub_0203B2C0
sub_0203B2C0: ; 0x0203B2C0
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B2D0 ; =0x020F6BEA
	ldrh r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0203B2D0: .word 0x020F6BEA
	thumb_func_end sub_0203B2C0

	thumb_func_start sub_0203B2D4
sub_0203B2D4: ; 0x0203B2D4
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B2E4 ; =0x020F6BE6
	ldrh r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0203B2E4: .word 0x020F6BE6
	thumb_func_end sub_0203B2D4

	thumb_func_start sub_0203B2E8
sub_0203B2E8: ; 0x0203B2E8
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B2F8 ; =0x020F6BE8
	ldrh r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0203B2F8: .word 0x020F6BE8
	thumb_func_end sub_0203B2E8

	thumb_func_start sub_0203B2FC
sub_0203B2FC: ; 0x0203B2FC
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B30C ; =0x020F6BEC
	ldrh r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0203B30C: .word 0x020F6BEC
	thumb_func_end sub_0203B2FC

	thumb_func_start sub_0203B310
sub_0203B310: ; 0x0203B310
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B320 ; =0x020F6BEE
	ldrh r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0203B320: .word 0x020F6BEE
	thumb_func_end sub_0203B310

	thumb_func_start sub_0203B324
sub_0203B324: ; 0x0203B324
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B340 ; =0x020F6BE0
	ldrb r0, [r0, r1]
	cmp r0, #0xff
	beq _0203B33A
	mov r0, #1
	pop {r3, pc}
_0203B33A:
	mov r0, #0
	pop {r3, pc}
	nop
_0203B340: .word 0x020F6BE0
	thumb_func_end sub_0203B324

	thumb_func_start sub_0203B344
sub_0203B344: ; 0x0203B344
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B354 ; =0x020F6BE0
	ldrb r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0203B354: .word 0x020F6BE0
	thumb_func_end sub_0203B344

	thumb_func_start sub_0203B358
sub_0203B358: ; 0x0203B358
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B368 ; =0x020F6BF0
	ldrh r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0203B368: .word 0x020F6BF0
	thumb_func_end sub_0203B358

	thumb_func_start sub_0203B36C
sub_0203B36C: ; 0x0203B36C
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B384 ; =0x020F6BE0
	add r0, r0, r1
	ldrh r0, [r0, #0x12]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	nop
_0203B384: .word 0x020F6BE0
	thumb_func_end sub_0203B36C

	thumb_func_start sub_0203B388
sub_0203B388: ; 0x0203B388
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B3A4 ; =0x020F6BE0
	add r0, r0, r1
	ldrh r0, [r0, #0x12]
	lsl r0, r0, #0x14
	lsr r0, r0, #0x1c
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	nop
_0203B3A4: .word 0x020F6BE0
	thumb_func_end sub_0203B388

	thumb_func_start sub_0203B3A8
sub_0203B3A8: ; 0x0203B3A8
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B3C4 ; =0x020F6BE0
	add r0, r0, r1
	ldrh r0, [r0, #0x12]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1c
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	nop
_0203B3C4: .word 0x020F6BE0
	thumb_func_end sub_0203B3A8

	thumb_func_start sub_0203B3C8
sub_0203B3C8: ; 0x0203B3C8
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B3E0 ; =0x020F6BE0
	add r0, r0, r1
	ldr r0, [r0, #0x14]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	pop {r3, pc}
	nop
_0203B3E0: .word 0x020F6BE0
	thumb_func_end sub_0203B3C8

	thumb_func_start sub_0203B3E4
sub_0203B3E4: ; 0x0203B3E4
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B3FC ; =0x020F6BE0
	add r0, r0, r1
	ldr r0, [r0, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x19
	pop {r3, pc}
	nop
_0203B3FC: .word 0x020F6BE0
	thumb_func_end sub_0203B3E4

	thumb_func_start sub_0203B400
sub_0203B400: ; 0x0203B400
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B418 ; =0x020F6BE0
	add r0, r0, r1
	ldr r0, [r0, #0x14]
	lsl r0, r0, #0xe
	lsr r0, r0, #0x1a
	pop {r3, pc}
	nop
_0203B418: .word 0x020F6BE0
	thumb_func_end sub_0203B400

	thumb_func_start sub_0203B41C
sub_0203B41C: ; 0x0203B41C
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B434 ; =0x020F6BE0
	add r0, r0, r1
	ldr r0, [r0, #0x14]
	lsl r0, r0, #7
	lsr r0, r0, #0x1b
	pop {r3, pc}
	nop
_0203B434: .word 0x020F6BE0
	thumb_func_end sub_0203B41C

	thumb_func_start sub_0203B438
sub_0203B438: ; 0x0203B438
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B450 ; =0x020F6BE0
	add r0, r0, r1
	ldr r0, [r0, #0x14]
	lsl r0, r0, #4
	lsr r0, r0, #0x1f
	pop {r3, pc}
	nop
_0203B450: .word 0x020F6BE0
	thumb_func_end sub_0203B438

	thumb_func_start sub_0203B454
sub_0203B454: ; 0x0203B454
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B46C ; =0x020F6BE0
	add r0, r0, r1
	ldr r0, [r0, #0x14]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	pop {r3, pc}
	nop
_0203B46C: .word 0x020F6BE0
	thumb_func_end sub_0203B454

	thumb_func_start sub_0203B470
sub_0203B470: ; 0x0203B470
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B488 ; =0x020F6BE0
	add r0, r0, r1
	ldr r0, [r0, #0x14]
	lsl r0, r0, #6
	lsr r0, r0, #0x1f
	pop {r3, pc}
	nop
_0203B488: .word 0x020F6BE0
	thumb_func_end sub_0203B470

	thumb_func_start sub_0203B48C
sub_0203B48C: ; 0x0203B48C
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B4A4 ; =0x020F6BE0
	add r0, r0, r1
	ldr r0, [r0, #0x14]
	lsl r0, r0, #2
	lsr r0, r0, #0x1f
	pop {r3, pc}
	nop
_0203B4A4: .word 0x020F6BE0
	thumb_func_end sub_0203B48C

	thumb_func_start sub_0203B4A8
sub_0203B4A8: ; 0x0203B4A8
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B4C0 ; =0x020F6BE0
	add r0, r0, r1
	ldr r0, [r0, #0x14]
	lsl r0, r0, #1
	lsr r0, r0, #0x1f
	pop {r3, pc}
	nop
_0203B4C0: .word 0x020F6BE0
	thumb_func_end sub_0203B4A8

	thumb_func_start sub_0203B4C4
sub_0203B4C4: ; 0x0203B4C4
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B4D8 ; =0x020F6BE0
	add r0, r0, r1
	ldr r0, [r0, #0x14]
	lsr r0, r0, #0x1f
	pop {r3, pc}
	.balign 4, 0
_0203B4D8: .word 0x020F6BE0
	thumb_func_end sub_0203B4C4

	thumb_func_start sub_0203B4DC
sub_0203B4DC: ; 0x0203B4DC
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B4F4 ; =0x020F6BE0
	add r0, r0, r1
	ldr r0, [r0, #0x14]
	lsl r0, r0, #0x14
	lsr r0, r0, #0x1c
	pop {r3, pc}
	nop
_0203B4F4: .word 0x020F6BE0
	thumb_func_end sub_0203B4DC

	thumb_func_start sub_0203B4F8
sub_0203B4F8: ; 0x0203B4F8
	push {r3, lr}
	bl sub_0203B268
	mov r1, #0x18
	mul r1, r0
	ldr r0, _0203B514 ; =0x020F6BE0
	add r0, r0, r1
	ldr r0, [r0, #0x14]
	lsl r0, r0, #0xc
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	nop
_0203B514: .word 0x020F6BE0
	thumb_func_end sub_0203B4F8

	thumb_func_start sub_0203B518
sub_0203B518: ; 0x0203B518
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_0203B268
	mov r1, #0x18
	ldr r2, _0203B53C ; =0x020F6BE0
	mul r1, r0
	add r1, r2, r1
	ldrh r0, [r1, #2]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1a
	strh r0, [r5]
	ldrh r0, [r1, #2]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1a
	strh r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203B53C: .word 0x020F6BE0
	thumb_func_end sub_0203B518

	thumb_func_start sub_0203B540
sub_0203B540: ; 0x0203B540
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203B454
	cmp r0, #0
	bne _0203B550
	mov r0, #0
	pop {r4, pc}
_0203B550:
	add r0, r4, #0
	bl sub_0203B4DC
	cmp r0, #1
	beq _0203B55E
	mov r0, #1
	pop {r4, pc}
_0203B55E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203B540

	thumb_func_start sub_0203B564
sub_0203B564: ; 0x0203B564
	push {r3, lr}
	bl sub_0203B2AC
	cmp r0, #0
	bne _0203B572
	mov r0, #1
	pop {r3, pc}
_0203B572:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203B564

	thumb_func_start sub_0203B578
sub_0203B578: ; 0x0203B578
	push {r3, lr}
	bl sub_0203B4DC
	cmp r0, #3
	bne _0203B586
	mov r0, #1
	pop {r3, pc}
_0203B586:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203B578

	thumb_func_start sub_0203B58C
sub_0203B58C: ; 0x0203B58C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203B4DC
	cmp r0, #4
	beq _0203B5A2
	add r0, r4, #0
	bl sub_0203B4DC
	cmp r0, #5
	bne _0203B5A6
_0203B5A2:
	mov r0, #1
	pop {r4, pc}
_0203B5A6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203B58C

	thumb_func_start sub_0203B5AC
sub_0203B5AC: ; 0x0203B5AC
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203B4DC
	cmp r0, #1
	beq _0203B5C2
	add r0, r4, #0
	bl sub_0203B4DC
	cmp r0, #2
	bne _0203B5C6
_0203B5C2:
	mov r0, #1
	pop {r4, pc}
_0203B5C6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203B5AC

	thumb_func_start sub_0203B5CC
sub_0203B5CC: ; 0x0203B5CC
	cmp r0, #2
	bne _0203B5D4
	mov r0, #1
	bx lr
_0203B5D4:
	mov r0, #0
	bx lr
	thumb_func_end sub_0203B5CC

	thumb_func_start sub_0203B5D8
sub_0203B5D8: ; 0x0203B5D8
	mov r0, #0
	bx lr
	thumb_func_end sub_0203B5D8

	thumb_func_start sub_0203B5DC
sub_0203B5DC: ; 0x0203B5DC
	ldr r3, _0203B5F8 ; =0x020F6BAC
	mov r2, #0
_0203B5E0:
	ldrh r1, [r3]
	cmp r0, r1
	bne _0203B5EA
	mov r0, #1
	bx lr
_0203B5EA:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #0x19
	blt _0203B5E0
	mov r0, #0
	bx lr
	nop
_0203B5F8: .word 0x020F6BAC
	thumb_func_end sub_0203B5DC

	thumb_func_start sub_0203B5FC
sub_0203B5FC: ; 0x0203B5FC
	mov r1, #0x4b
	lsl r1, r1, #2
	cmp r0, r1
	bne _0203B608
	mov r0, #1
	bx lr
_0203B608:
	mov r0, #0
	bx lr
	thumb_func_end sub_0203B5FC

	thumb_func_start sub_0203B60C
sub_0203B60C: ; 0x0203B60C
	mov r0, #0
	bx lr
	thumb_func_end sub_0203B60C

	thumb_func_start sub_0203B610
sub_0203B610: ; 0x0203B610
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	add r4, r1, #0
	cmp r0, #0
	beq _0203B620
	bl GF_AssertFail
_0203B620:
	ldr r1, _0203B62C ; =0x000009E4
	add r0, r4, #0
	bl AllocFromHeap
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203B62C: .word 0x000009E4
	thumb_func_end sub_0203B610

	thumb_func_start sub_0203B630
sub_0203B630: ; 0x0203B630
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0203B63E
	bl GF_AssertFail
_0203B63E:
	ldr r0, [r4, #0x14]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203B630

	thumb_func_start sub_0203B648
sub_0203B648: ; 0x0203B648
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	add r4, r1, #0
	cmp r0, #0
	bne _0203B658
	bl GF_AssertFail
_0203B658:
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl sub_0203B680
	ldr r0, [r5, #0x14]
	bl sub_0203B828
	mov r0, #0x92
	ldr r1, [r5, #0x14]
	lsl r0, r0, #4
	add r0, r1, r0
	add r1, r4, #0
	bl sub_0203B88C
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl sub_0203B8C4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203B648

	thumb_func_start sub_0203B680
sub_0203B680: ; 0x0203B680
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl sub_0203B358
	add r4, r0, #0
	mov r0, #0x20
	add r1, r4, #0
	bl GetNarcMemberSizeByIdPair
	mov r1, #2
	lsl r1, r1, #0xa
	cmp r0, r1
	blo _0203B6A0
	bl GF_AssertFail
_0203B6A0:
	add r5, #0x20
	add r0, r5, #0
	mov r1, #0x20
	add r2, r4, #0
	bl ReadWholeNarcMemberByIdPair
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203B680

	thumb_func_start sub_0203B6B0
sub_0203B6B0: ; 0x0203B6B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	ldr r4, [r0, #4]
	cmp r0, #0
	bne _0203B6C0
	bl GF_AssertFail
_0203B6C0:
	cmp r4, #0
	beq _0203B6D4
	ldr r1, [r5, #0x20]
	ldr r3, [r5, #0x14]
	ldr r0, [r5, #0x3c]
	ldr r1, [r1]
	ldr r3, [r3, #0x14]
	add r2, r4, #0
	bl sub_0205E9AC
_0203B6D4:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203B6B0

	thumb_func_start sub_0203B6D8
sub_0203B6D8: ; 0x0203B6D8
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x10]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B6D8

	thumb_func_start sub_0203B6E0
sub_0203B6E0: ; 0x0203B6E0
	ldr r0, [r0, #0x14]
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B6E0

	thumb_func_start sub_0203B6E8
sub_0203B6E8: ; 0x0203B6E8
	ldr r2, [r0, #0x14]
	ldr r0, [r2, #8]
	cmp r1, r0
	blo _0203B6F4
	mov r0, #0
	bx lr
_0203B6F4:
	mov r0, #0xc
	ldr r2, [r2, #0x18]
	mul r0, r1
	add r0, r2, r0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B6E8

	thumb_func_start sub_0203B700
sub_0203B700: ; 0x0203B700
	push {r4, r5, r6, r7}
	ldr r5, [r0, #0x14]
	mov r3, #0
	ldr r0, [r5, #8]
	cmp r0, #0
	bls _0203B732
	ldr r6, [r5, #0x18]
	add r4, r3, #0
	add r0, r6, #0
_0203B712:
	ldrh r7, [r0]
	cmp r1, r7
	bne _0203B726
	add r7, r6, r4
	ldrh r7, [r7, #2]
	cmp r2, r7
	bne _0203B726
	add r0, r3, #0
	pop {r4, r5, r6, r7}
	bx lr
_0203B726:
	ldr r7, [r5, #8]
	add r3, r3, #1
	add r0, #0xc
	add r4, #0xc
	cmp r3, r7
	blo _0203B712
_0203B732:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B700

	thumb_func_start sub_0203B73C
sub_0203B73C: ; 0x0203B73C
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0xc]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B73C

	thumb_func_start sub_0203B744
sub_0203B744: ; 0x0203B744
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x1c]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B744

	thumb_func_start sub_0203B74C
sub_0203B74C: ; 0x0203B74C
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B74C

	thumb_func_start sub_0203B754
sub_0203B754: ; 0x0203B754
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B754

	thumb_func_start sub_0203B75C
sub_0203B75C: ; 0x0203B75C
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, [r0, #0x14]
	add r4, r1, #0
	ldr r5, [r0, #4]
	add r7, r2, #0
	add r1, r3, #0
	mov r2, #0
	ldr r3, [r0, #0x14]
	cmp r5, #0
	bls _0203B78C
	add r6, r3, #0
_0203B772:
	ldrh r0, [r6]
	cmp r4, r0
	bne _0203B784
	lsl r0, r2, #5
	add r0, r3, r0
	strh r7, [r0, #0x18]
	strh r1, [r0, #0x1a]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0203B784:
	add r2, r2, #1
	add r6, #0x20
	cmp r2, r5
	blo _0203B772
_0203B78C:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0203B75C

	thumb_func_start sub_0203B794
sub_0203B794: ; 0x0203B794
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x14]
	mov r3, #0
	ldr r5, [r0, #4]
	ldr r4, [r0, #0x14]
	cmp r5, #0
	bls _0203B7BC
	add r6, r4, #0
_0203B7A4:
	ldrh r0, [r6]
	cmp r1, r0
	bne _0203B7B4
	lsl r0, r3, #5
	add r0, r4, r0
	strh r2, [r0, #0xc]
	mov r0, #1
	pop {r4, r5, r6, pc}
_0203B7B4:
	add r3, r3, #1
	add r6, #0x20
	cmp r3, r5
	blo _0203B7A4
_0203B7BC:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203B794

	thumb_func_start sub_0203B7C4
sub_0203B7C4: ; 0x0203B7C4
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x14]
	mov r3, #0
	ldr r5, [r0, #4]
	ldr r4, [r0, #0x14]
	cmp r5, #0
	bls _0203B7EC
	add r6, r4, #0
_0203B7D4:
	ldrh r0, [r6]
	cmp r1, r0
	bne _0203B7E4
	lsl r0, r3, #5
	add r0, r4, r0
	strh r2, [r0, #4]
	mov r0, #1
	pop {r4, r5, r6, pc}
_0203B7E4:
	add r3, r3, #1
	add r6, #0x20
	cmp r3, r5
	blo _0203B7D4
_0203B7EC:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203B7C4

	thumb_func_start sub_0203B7F4
sub_0203B7F4: ; 0x0203B7F4
	push {r3, r4}
	ldr r0, [r0, #0x14]
	ldr r4, [r0, #0x18]
	mov r0, #0xc
	mul r0, r1
	strh r2, [r4, r0]
	add r0, r4, r0
	strh r3, [r0, #2]
	mov r0, #1
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B7F4

	thumb_func_start sub_0203B80C
sub_0203B80C: ; 0x0203B80C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_0203B6D8
	mov r1, #0x14
	mul r1, r5
	add r0, r0, r1
	str r4, [r0, #4]
	str r6, [r0, #8]
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203B80C

	thumb_func_start sub_0203B828
sub_0203B828: ; 0x0203B828
	add r1, r0, #0
	ldr r2, [r0, #0x20]
	add r1, #0x20
	add r1, r1, #4
	str r2, [r0]
	cmp r2, #0
	beq _0203B83A
	str r1, [r0, #0x10]
	b _0203B83E
_0203B83A:
	mov r2, #0
	str r2, [r0, #0x10]
_0203B83E:
	ldr r3, [r0]
	mov r2, #0x14
	mul r2, r3
	add r3, r1, r2
	ldr r2, [r1, r2]
	add r1, r3, #4
	str r2, [r0, #4]
	cmp r2, #0
	beq _0203B854
	str r1, [r0, #0x14]
	b _0203B858
_0203B854:
	mov r2, #0
	str r2, [r0, #0x14]
_0203B858:
	ldr r2, [r0, #4]
	lsl r2, r2, #5
	add r3, r1, r2
	ldr r2, [r1, r2]
	add r1, r3, #4
	str r2, [r0, #8]
	cmp r2, #0
	beq _0203B86C
	str r1, [r0, #0x18]
	b _0203B870
_0203B86C:
	mov r2, #0
	str r2, [r0, #0x18]
_0203B870:
	ldr r3, [r0, #8]
	mov r2, #0xc
	mul r2, r3
	add r3, r1, r2
	ldr r1, [r1, r2]
	str r1, [r0, #0xc]
	cmp r1, #0
	beq _0203B886
	add r1, r3, #4
	str r1, [r0, #0x1c]
	bx lr
_0203B886:
	mov r1, #0
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end sub_0203B828

	thumb_func_start sub_0203B88C
sub_0203B88C: ; 0x0203B88C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0
	mov r2, #0xc4
	add r5, r0, #0
	bl memset
	add r0, r4, #0
	bl sub_0203B324
	cmp r0, #0
	beq _0203B8B4
	add r0, r4, #0
	bl sub_0203B344
	add r2, r0, #0
	add r0, r5, #0
#ifdef HEARTGOLD
	mov r1, #0x25
#else
	mov r1, #0x88
#endif
	bl ReadWholeNarcMemberByIdPair
_0203B8B4:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203B88C

	thumb_func_start sub_0203B8B8
sub_0203B8B8: ; 0x0203B8B8
	ldr r1, [r0, #0x14]
	mov r0, #0x92
	lsl r0, r0, #4
	add r0, r1, r0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B8B8

	thumb_func_start sub_0203B8C4
sub_0203B8C4: ; 0x0203B8C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl sub_0203B2E8
	mov r1, #0x82
	lsl r1, r1, #4
	mov r2, #1
	add r4, r0, #0
	mov r0, #0
	add r1, r5, r1
	lsl r2, r2, #8
	bl MIi_CpuClearFast
	mov r0, #0xc
	add r1, r4, #0
	bl GetNarcMemberSizeByIdPair
	mov r1, #1
	lsl r1, r1, #8
	cmp r0, r1
	blo _0203B8F4
	bl GF_AssertFail
_0203B8F4:
	mov r0, #0x82
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0xc
	add r2, r4, #0
	bl ReadWholeNarcMemberByIdPair
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203B8C4

	thumb_func_start sub_0203B904
sub_0203B904: ; 0x0203B904
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0203B912
	bl GF_AssertFail
_0203B912:
	mov r0, #0x82
	ldr r1, [r4, #0x14]
	lsl r0, r0, #4
	add r0, r1, r0
	pop {r4, pc}
	thumb_func_end sub_0203B904

	thumb_func_start sub_0203B91C
sub_0203B91C: ; 0x0203B91C
	mov r0, #0x80
	bx lr
	thumb_func_end sub_0203B91C

	thumb_func_start sub_0203B920
sub_0203B920: ; 0x0203B920
	mov r0, #5
	lsl r0, r0, #0xa
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B920

	thumb_func_start sub_0203B928
sub_0203B928: ; 0x0203B928
	ldr r3, _0203B934 ; =sub_020D47EC
	mov r2, #5
	add r1, r0, #0
	mov r0, #0
	lsl r2, r2, #0xa
	bx r3
	.balign 4, 0
_0203B934: .word sub_020D47EC
	thumb_func_end sub_0203B928

	thumb_func_start sub_0203B938
sub_0203B938: ; 0x0203B938
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x80
	bl memset
	add r0, r4, #0
	add r0, #0x6c
	bl sub_0205C7BC
	bl sub_0203BA70
	add r4, #0x68
	strh r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203B938

	thumb_func_start sub_0203B958
sub_0203B958: ; 0x0203B958
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B958

	thumb_func_start sub_0203B95C
sub_0203B95C: ; 0x0203B95C
	add r0, #0x14
	bx lr
	thumb_func_end sub_0203B95C

	thumb_func_start sub_0203B960
sub_0203B960: ; 0x0203B960
	add r0, #0x28
	bx lr
	thumb_func_end sub_0203B960

	thumb_func_start sub_0203B964
sub_0203B964: ; 0x0203B964
	add r0, #0x50
	bx lr
	thumb_func_end sub_0203B964

	thumb_func_start sub_0203B968
sub_0203B968: ; 0x0203B968
	add r0, #0x3c
	bx lr
	thumb_func_end sub_0203B968

	thumb_func_start sub_0203B96C
sub_0203B96C: ; 0x0203B96C
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x3c
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_0203B96C

	thumb_func_start sub_0203B980
sub_0203B980: ; 0x0203B980
	add r0, #0x64
	bx lr
	thumb_func_end sub_0203B980

	thumb_func_start sub_0203B984
sub_0203B984: ; 0x0203B984
	add r0, #0x66
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B984

	thumb_func_start sub_0203B98C
sub_0203B98C: ; 0x0203B98C
	add r0, #0x66
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B98C

	thumb_func_start sub_0203B994
sub_0203B994: ; 0x0203B994
	add r0, #0x68
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B994

	thumb_func_start sub_0203B99C
sub_0203B99C: ; 0x0203B99C
	add r0, #0x68
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B99C

	thumb_func_start sub_0203B9A4
sub_0203B9A4: ; 0x0203B9A4
	add r0, #0x6a
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B9A4

	thumb_func_start sub_0203B9AC
sub_0203B9AC: ; 0x0203B9AC
	add r0, #0x6a
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B9AC

	thumb_func_start sub_0203B9B4
sub_0203B9B4: ; 0x0203B9B4
	add r0, #0x6c
	bx lr
	thumb_func_end sub_0203B9B4

	thumb_func_start sub_0203B9B8
sub_0203B9B8: ; 0x0203B9B8
	add r0, #0x78
	bx lr
	thumb_func_end sub_0203B9B8

	thumb_func_start sub_0203B9BC
sub_0203B9BC: ; 0x0203B9BC
	add r0, #0x76
	bx lr
	thumb_func_end sub_0203B9BC

	thumb_func_start sub_0203B9C0
sub_0203B9C0: ; 0x0203B9C0
	add r0, #0x74
	bx lr
	thumb_func_end sub_0203B9C0

	thumb_func_start sub_0203B9C4
sub_0203B9C4: ; 0x0203B9C4
	ldr r3, _0203B9CC ; =SavArray_get
	mov r1, #5
	bx r3
	nop
_0203B9CC: .word SavArray_get
	thumb_func_end sub_0203B9C4

	thumb_func_start sub_0203B9D0
sub_0203B9D0: ; 0x0203B9D0
	ldr r3, _0203B9D8 ; =SavArray_get
	mov r1, #0xa
	bx r3
	nop
_0203B9D8: .word SavArray_get
	thumb_func_end sub_0203B9D0

	thumb_func_start sub_0203B9DC
sub_0203B9DC: ; 0x0203B9DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0203B9D0
	add r2, r0, #0
	ldr r1, [r4, #0x3c]
	add r0, r4, #0
	mov r3, #0x40
	bl sub_0205E5EC
	pop {r4, pc}
	thumb_func_end sub_0203B9DC

	thumb_func_start sub_0203B9F4
sub_0203B9F4: ; 0x0203B9F4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0203B9D0
	ldr r2, _0203BA54 ; =0x000003CF
	mov r1, #0x40
	add r7, r0, #0
	bl sub_0205FD00
	add r4, r0, #0
	beq _0203BA48
	ldrb r0, [r4, #8]
	cmp r0, #0xfd
	bne _0203BA48
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl sub_02054388
	str r0, [sp]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	ldr r0, [sp]
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	mov r1, #0x7b
	lsl r1, r1, #2
	cmp r6, r1
	beq _0203BA40
	bl GF_AssertFail
	b _0203BA48
_0203BA40:
	cmp r0, #0
	bne _0203BA48
	ldr r0, _0203BA58 ; =0x000003CE
	strh r0, [r4, #0x12]
_0203BA48:
	ldr r0, [r5, #0x3c]
	add r1, r7, #0
	mov r2, #0x40
	bl sub_0205E648
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203BA54: .word 0x000003CF
_0203BA58: .word 0x000003CE
	thumb_func_end sub_0203B9F4

	thumb_func_start sub_0203BA5C
sub_0203BA5C: ; 0x0203BA5C
	push {r3, lr}
	cmp r0, #0
	ble _0203BA66
	cmp r0, #0x1e
	bls _0203BA6C
_0203BA66:
	bl GF_AssertFail
	mov r0, #1
_0203BA6C:
	sub r0, r0, #1
	pop {r3, pc}
	thumb_func_end sub_0203BA5C

	thumb_func_start sub_0203BA70
sub_0203BA70: ; 0x0203BA70
	mov r0, #1
	bx lr
	thumb_func_end sub_0203BA70

	thumb_func_start sub_0203BA74
sub_0203BA74: ; 0x0203BA74
	push {r4, lr}
	add r4, r1, #0
	bl sub_0203BA5C
	add r1, r0, #0
	mov r2, #0x12
	mul r1, r2
	ldr r0, _0203BAA0 ; =0x020F9E86
	sub r2, #0x13
	ldrh r0, [r0, r1]
	str r0, [r4]
	ldr r0, _0203BAA4 ; =0x020F9E88
	str r2, [r4, #4]
	ldrh r0, [r0, r1]
	str r0, [r4, #8]
	ldr r0, _0203BAA8 ; =0x020F9E8A
	ldrh r0, [r0, r1]
	str r0, [r4, #0xc]
	mov r0, #1
	str r0, [r4, #0x10]
	pop {r4, pc}
	nop
_0203BAA0: .word 0x020F9E86
_0203BAA4: .word 0x020F9E88
_0203BAA8: .word 0x020F9E8A
	thumb_func_end sub_0203BA74

	thumb_func_start sub_0203BAAC
sub_0203BAAC: ; 0x0203BAAC
	push {r4, lr}
	add r4, r1, #0
	bl sub_0203BA5C
	add r2, r0, #0
	mov r1, #0x12
	mul r2, r1
	ldr r0, _0203BAE0 ; =0x020F9E82
	sub r1, #0x13
	ldrh r0, [r0, r2]
	str r0, [r4]
	ldr r0, _0203BAE4 ; =0x020F9E80
	str r1, [r4, #4]
	add r1, r0, r2
	ldrh r0, [r1, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [r4, #8]
	ldrh r0, [r1, #4]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x18
	str r0, [r4, #0xc]
	mov r0, #0
	str r0, [r4, #0x10]
	pop {r4, pc}
	nop
_0203BAE0: .word 0x020F9E82
_0203BAE4: .word 0x020F9E80
	thumb_func_end sub_0203BAAC

	thumb_func_start sub_0203BAE8
sub_0203BAE8: ; 0x0203BAE8
	push {r4, lr}
	add r4, r1, #0
	bl sub_0203BA5C
	add r1, r0, #0
	mov r2, #0x12
	mul r1, r2
	ldr r0, _0203BB14 ; =0x020F9E8C
	sub r2, #0x13
	ldrh r0, [r0, r1]
	str r0, [r4]
	ldr r0, _0203BB18 ; =0x020F9E8E
	str r2, [r4, #4]
	ldrh r0, [r0, r1]
	str r0, [r4, #8]
	ldr r0, _0203BB1C ; =0x020F9E90
	ldrh r0, [r0, r1]
	str r0, [r4, #0xc]
	mov r0, #1
	str r0, [r4, #0x10]
	pop {r4, pc}
	nop
_0203BB14: .word 0x020F9E8C
_0203BB18: .word 0x020F9E8E
_0203BB1C: .word 0x020F9E90
	thumb_func_end sub_0203BAE8

	thumb_func_start sub_0203BB20
sub_0203BB20: ; 0x0203BB20
	push {r3, r4}
	ldr r3, _0203BB4C ; =0x020F9E80
	mov r2, #0
	add r4, r3, #0
_0203BB28:
	ldrh r1, [r3, #2]
	cmp r0, r1
	bne _0203BB3C
	ldrh r1, [r4]
	lsl r1, r1, #0x17
	lsr r1, r1, #0x1f
	beq _0203BB3C
	add r0, r2, #1
	pop {r3, r4}
	bx lr
_0203BB3C:
	add r2, r2, #1
	add r3, #0x12
	add r4, #0x12
	cmp r2, #0x1e
	blo _0203BB28
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0203BB4C: .word 0x020F9E80
	thumb_func_end sub_0203BB20

	thumb_func_start sub_0203BB50
sub_0203BB50: ; 0x0203BB50
	ldr r3, _0203BB6C ; =0x020F9E80
	mov r2, #0
_0203BB54:
	ldrh r1, [r3, #6]
	cmp r0, r1
	bne _0203BB5E
	add r0, r2, #1
	bx lr
_0203BB5E:
	add r2, r2, #1
	add r3, #0x12
	cmp r2, #0x1e
	blo _0203BB54
	mov r0, #0
	bx lr
	nop
_0203BB6C: .word 0x020F9E80
	thumb_func_end sub_0203BB50

	thumb_func_start sub_0203BB70
sub_0203BB70: ; 0x0203BB70
	push {r3, r4, r5, lr}
	ldr r2, _0203BBB0 ; =0x020F9E80
	mov r4, #0
	add r3, r2, #0
_0203BB78:
	ldrh r5, [r2, #6]
	cmp r1, r5
	bne _0203BBA2
	ldrh r5, [r3]
	lsl r5, r5, #0x16
	lsr r5, r5, #0x1f
	beq _0203BBA2
	ldr r0, [r0, #0xc]
	bl sub_020503D0
	mov r2, #0x12
	add r3, r4, #0
	mul r3, r2
	ldr r2, _0203BBB0 ; =0x020F9E80
	mov r1, #1
	ldrh r2, [r2, r3]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_02066930
	pop {r3, r4, r5, pc}
_0203BBA2:
	add r4, r4, #1
	add r2, #0x12
	add r3, #0x12
	cmp r4, #0x1e
	blo _0203BB78
	pop {r3, r4, r5, pc}
	nop
_0203BBB0: .word 0x020F9E80
	thumb_func_end sub_0203BB70

	thumb_func_start sub_0203BBB4
sub_0203BBB4: ; 0x0203BBB4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203B3E4
	ldr r1, _0203BC08 ; =0x000001D1
	add r7, r0, #0
	cmp r5, r1
	bne _0203BC04
	ldr r0, [r4, #0xc]
	bl Sav2_SysInfo_RTC_get
	add r3, r0, #0
	ldr r5, [r3, #8]
	ldr r1, _0203BC0C ; =0x020FA09C
	mov r2, #0
_0203BBD6:
	lsl r6, r2, #1
	add r0, r1, r6
	ldrb r6, [r1, r6]
	ldrb r0, [r0, #1]
	cmp r5, r6
	bne _0203BBF8
	ldr r6, [r3, #0xc]
	cmp r6, r0
	bne _0203BBF8
	add r0, r4, #0
	bl sub_02055670
	cmp r0, #0
	bne _0203BBF4
	mov r7, #8
_0203BBF4:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0203BBF8:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #8
	blo _0203BBD6
	add r0, r7, #0
_0203BC04:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203BC08: .word 0x000001D1
_0203BC0C: .word 0x020FA09C
	thumb_func_end sub_0203BBB4

	thumb_func_start sub_0203BC10
sub_0203BC10: ; 0x0203BC10
	push {r3, lr}
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	bl sub_0203B36C
	cmp r0, #0
	beq _0203BC22
	mov r0, #1
	pop {r3, pc}
_0203BC22:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203BC10

	thumb_func_start sub_0203BC28
sub_0203BC28: ; 0x0203BC28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0203BE34
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_020503D0
	bl sub_02066860
	cmp r0, #1
	bne _0203BC4E
	add r0, r5, #0
	bl sub_0203BECC
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _0203BCAA
_0203BC4E:
	ldr r0, [r5, #0xc]
	bl sub_020503D0
	bl sub_02066870
	cmp r0, #1
	bne _0203BC6A
	add r0, r5, #0
	bl sub_0203BED0
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _0203BCAA
_0203BC6A:
	ldr r0, [r5, #0xc]
	bl sub_020503D0
	bl sub_020668A0
	cmp r0, #1
	bne _0203BC86
	add r0, r5, #0
	bl sub_0203BED4
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _0203BCAA
_0203BC86:
	add r0, r5, #0
	bl sub_02067584
	cmp r0, #1
	bne _0203BC9E
	add r0, r5, #0
	bl sub_0203BED8
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _0203BCAA
_0203BC9E:
	add r0, r5, #0
	bl sub_0203BE60
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r4, r1]
_0203BCAA:
	mov r0, #0x35
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r5, #0x40]
	bl sub_0205CF60
	cmp r0, #1
	bne _0203BCCA
	ldr r0, [r5, #0x40]
	bl sub_0205C654
	add r1, r0, #0
	ldr r0, [r5, #0x40]
	bl sub_0205CFBC
_0203BCCA:
	ldr r1, _0203BCD8 ; =sub_0203BEF0
	add r0, r5, #0
	add r2, r4, #0
	bl sub_020504F0
	pop {r3, r4, r5, pc}
	nop
_0203BCD8: .word sub_0203BEF0
	thumb_func_end sub_0203BC28

	thumb_func_start sub_0203BCDC
sub_0203BCDC: ; 0x0203BCDC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0203BE34
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203BEE0
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r2, #1
	add r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r5, #0x40]
	bl sub_0205CF60
	cmp r0, #1
	bne _0203BD10
	ldr r0, [r5, #0x40]
	bl sub_0205C654
	add r1, r0, #0
	ldr r0, [r5, #0x40]
	bl sub_0205CFBC
_0203BD10:
	ldr r1, _0203BD1C ; =sub_0203BEF0
	add r0, r5, #0
	add r2, r4, #0
	bl sub_020504F0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203BD1C: .word sub_0203BEF0
	thumb_func_end sub_0203BCDC

	thumb_func_start sub_0203BD20
sub_0203BD20: ; 0x0203BD20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0203BE34
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203BEE8
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r2, #0
	add r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r5, #0x40]
	bl sub_0205CF60
	cmp r0, #1
	bne _0203BD54
	ldr r0, [r5, #0x40]
	bl sub_0205C654
	add r1, r0, #0
	ldr r0, [r5, #0x40]
	bl sub_0205CFBC
_0203BD54:
	ldr r1, _0203BD60 ; =sub_0203BEF0
	add r0, r5, #0
	add r2, r4, #0
	bl sub_020504F0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203BD60: .word sub_0203BEF0
	thumb_func_end sub_0203BD20

	thumb_func_start sub_0203BD64
sub_0203BD64: ; 0x0203BD64
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0203BE2C ; =0x000005FC
	bl PlaySE
	bl sub_0203BE34
	add r4, r0, #0
	mov r0, #0x35
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r5, #0xc]
	bl sub_020503D0
	bl sub_02066860
	cmp r0, #1
	bne _0203BD98
	add r0, r5, #0
	bl sub_0203BECC
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _0203BE20
_0203BD98:
	ldr r0, [r5, #0xc]
	bl sub_020503D0
	bl sub_02066870
	cmp r0, #1
	bne _0203BDB4
	add r0, r5, #0
	bl sub_0203BED0
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _0203BE20
_0203BDB4:
	ldr r0, [r5, #0xc]
	bl sub_020503D0
	bl sub_020668A0
	cmp r0, #1
	bne _0203BDD0
	add r0, r5, #0
	bl sub_0203BED4
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _0203BE20
_0203BDD0:
	add r0, r5, #0
	bl sub_02067584
	cmp r0, #1
	bne _0203BDE8
	add r0, r5, #0
	bl sub_0203BED8
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _0203BE20
_0203BDE8:
	ldr r0, [r5, #0x70]
	cmp r0, #3
	bne _0203BDFC
	add r0, r5, #0
	bl sub_0203BEE8
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _0203BE20
_0203BDFC:
	cmp r0, #2
	bne _0203BE14
	add r0, r5, #0
	bl sub_0203BEE0
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r2, #1
	add r0, r1, #4
	str r2, [r4, r0]
	b _0203BE20
_0203BE14:
	add r0, r5, #0
	bl sub_0203BE60
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r4, r1]
_0203BE20:
	ldr r0, [r5, #0x10]
	ldr r1, _0203BE30 ; =sub_0203BEF0
	add r2, r4, #0
	bl sub_02050510
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203BE2C: .word 0x000005FC
_0203BE30: .word sub_0203BEF0
	thumb_func_end sub_0203BD64

	thumb_func_start sub_0203BE34
sub_0203BE34: ; 0x0203BE34
	push {r4, lr}
	mov r1, #0xe3
	mov r0, #0xb
	lsl r1, r1, #2
	bl AllocFromHeap
	add r4, r0, #0
	mov r2, #0xe3
	mov r0, #0
	add r1, r4, #0
	lsl r2, r2, #2
	bl MIi_CpuClearFast
	mov r1, #0
	strh r1, [r4, #0x26]
	mov r0, #0xe
	strh r1, [r4, #0x24]
	lsl r0, r0, #6
	str r1, [r4, r0]
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203BE34

	thumb_func_start sub_0203BE60
sub_0203BE60: ; 0x0203BE60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r4, #0
	bl sub_020503D0
	bl sub_02066974
	cmp r0, #0
	bne _0203BE78
	mov r0, #1
	orr r4, r0
_0203BE78:
	ldr r0, [r5, #0xc]
	bl sub_020503D0
	bl sub_0206695C
	cmp r0, #0
	bne _0203BE8A
	mov r0, #2
	orr r4, r0
_0203BE8A:
	ldr r0, [r5, #0xc]
	bl sub_020503D0
	mov r1, #0
	bl sub_02066980
	cmp r0, #0
	bne _0203BE9E
	mov r0, #4
	orr r4, r0
_0203BE9E:
	ldr r0, [r5, #0xc]
	bl sub_020503D0
	bl sub_02066968
	cmp r0, #0
	bne _0203BEB2
	mov r0, #2
	lsl r0, r0, #8
	orr r4, r0
_0203BEB2:
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl sub_0203B5D8
	cmp r0, #1
	bne _0203BEC2
	mov r0, #6
	orr r4, r0
_0203BEC2:
	mov r0, #6
	lsl r0, r0, #6
	orr r0, r4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203BE60

	thumb_func_start sub_0203BECC
sub_0203BECC: ; 0x0203BECC
	mov r0, #0x90
	bx lr
	thumb_func_end sub_0203BECC

	thumb_func_start sub_0203BED0
sub_0203BED0: ; 0x0203BED0
	mov r0, #0x94
	bx lr
	thumb_func_end sub_0203BED0

	thumb_func_start sub_0203BED4
sub_0203BED4: ; 0x0203BED4
	mov r0, #0x94
	bx lr
	thumb_func_end sub_0203BED4

	thumb_func_start sub_0203BED8
sub_0203BED8: ; 0x0203BED8
	ldr r0, _0203BEDC ; =0x00000395
	bx lr
	.balign 4, 0
_0203BEDC: .word 0x00000395
	thumb_func_end sub_0203BED8

	thumb_func_start sub_0203BEE0
sub_0203BEE0: ; 0x0203BEE0
	mov r0, #0x11
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203BEE0

	thumb_func_start sub_0203BEE8
sub_0203BEE8: ; 0x0203BEE8
	ldr r0, _0203BEEC ; =0x00000391
	bx lr
	.balign 4, 0
_0203BEEC: .word 0x00000391
	thumb_func_end sub_0203BEE8

	thumb_func_start sub_0203BEF0
sub_0203BEF0: ; 0x0203BEF0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r5, r0, #0
	ldrh r1, [r5, #0x26]
	cmp r1, #0x14
	bls _0203BF0A
	b _0203C136
_0203BF0A:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0203BF16: ; jump table
	.short _0203BF40 - _0203BF16 - 2 ; case 0
	.short _0203BF60 - _0203BF16 - 2 ; case 1
	.short _0203BF96 - _0203BF16 - 2 ; case 2
	.short _0203BFE2 - _0203BF16 - 2 ; case 3
	.short _0203BFF0 - _0203BF16 - 2 ; case 4
	.short _0203BFF8 - _0203BF16 - 2 ; case 5
	.short _0203C000 - _0203BF16 - 2 ; case 6
	.short _0203C008 - _0203BF16 - 2 ; case 7
	.short _0203C010 - _0203BF16 - 2 ; case 8
	.short _0203C018 - _0203BF16 - 2 ; case 9
	.short _0203C054 - _0203BF16 - 2 ; case 10
	.short _0203C06A - _0203BF16 - 2 ; case 11
	.short _0203C08A - _0203BF16 - 2 ; case 12
	.short _0203C0A6 - _0203BF16 - 2 ; case 13
	.short _0203C0C6 - _0203BF16 - 2 ; case 14
	.short _0203C020 - _0203BF16 - 2 ; case 15
	.short _0203C0E0 - _0203BF16 - 2 ; case 16
	.short _0203C11A - _0203BF16 - 2 ; case 17
	.short _0203C0D2 - _0203BF16 - 2 ; case 18
	.short _0203C128 - _0203BF16 - 2 ; case 19
	.short _0203C130 - _0203BF16 - 2 ; case 20
_0203BF40:
	ldr r0, [r4, #0x3c]
	bl sub_0205F574
	add r0, r4, #0
	bl ov01_021F6B00
	cmp r0, #0
	beq _0203BF60
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov01_021F6A9C
	mov r0, #2
	strh r0, [r5, #0x26]
	b _0203C136
_0203BF60:
	mov r1, #0xd6
	lsl r1, r1, #2
	add r0, r4, #0
	add r1, r5, r1
	bl sub_020649B8
	mov r1, #0x37
	lsl r1, r1, #4
	add r0, r4, #0
	add r1, r5, r1
	bl sub_02067E10
	add r0, r6, #0
	bl sub_0203C14C
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x3f
	add r4, #0xd2
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r4]
	mov r0, #3
	strh r0, [r5, #0x26]
	b _0203C136
_0203BF96:
	add r0, r4, #0
	bl ov01_021F6B10
	cmp r0, #6
	bne _0203BFBA
	add r0, r6, #0
	bl sub_0203C14C
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x3f
	add r4, #0xd2
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r4]
	b _0203C136
_0203BFBA:
	add r0, r4, #0
	bl ov01_021F6B10
	cmp r0, #1
	bne _0203C02A
	mov r1, #0xd6
	lsl r1, r1, #2
	add r0, r4, #0
	add r1, r5, r1
	bl sub_020649B8
	mov r1, #0x37
	lsl r1, r1, #4
	add r0, r4, #0
	add r1, r5, r1
	bl sub_02067E10
	mov r0, #3
	strh r0, [r5, #0x26]
	b _0203C136
_0203BFE2:
	add r0, r6, #0
	bl sub_0203C47C
	cmp r0, #0
	bne _0203C02A
	mov r0, #0
	pop {r4, r5, r6, pc}
_0203BFF0:
	add r0, r6, #0
	bl sub_0203C870
	b _0203C136
_0203BFF8:
	add r0, r6, #0
	bl sub_0203C8B0
	b _0203C136
_0203C000:
	add r0, r6, #0
	bl sub_0203D264
	b _0203C136
_0203C008:
	add r0, r6, #0
	bl sub_0203D288
	b _0203C136
_0203C010:
	add r0, r6, #0
	bl sub_0203D9E8
	b _0203C136
_0203C018:
	add r0, r6, #0
	bl sub_0203DAE4
	b _0203C136
_0203C020:
	add r0, r4, #0
	bl sub_020505C8
	cmp r0, #0
	bne _0203C02C
_0203C02A:
	b _0203C136
_0203C02C:
	ldr r0, [r4, #0x3c]
	bl sub_0205F574
	add r0, r6, #0
	bl sub_0203C14C
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x3f
	add r4, #0xd2
	bic r1, r0
	mov r0, #1
	orr r1, r0
	strb r1, [r4]
	bl ov01_021E636C
	mov r0, #0x11
	strh r0, [r5, #0x26]
	b _0203C136
_0203C054:
	add r0, r4, #0
	bl sub_020505C8
	cmp r0, #0
	beq _0203C136
	mov r0, #1
	bl ov01_021E636C
	mov r0, #0xb
	strh r0, [r5, #0x26]
	b _0203C136
_0203C06A:
	bl sub_0200FB5C
	cmp r0, #0
	beq _0203C136
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203C69C
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [r4, #0x3c]
	bl sub_0205F5A4
	mov r0, #1
	pop {r4, r5, r6, pc}
_0203C08A:
	add r0, r4, #0
	bl sub_020505C8
	cmp r0, #0
	beq _0203C136
	ldr r0, [r4, #0x3c]
	bl sub_0205F574
	mov r0, #1
	bl ov01_021E636C
	mov r0, #0xd
	strh r0, [r5, #0x26]
	b _0203C136
_0203C0A6:
	bl sub_0200FB5C
	cmp r0, #0
	beq _0203C136
	mov r2, #0xd5
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	add r2, #0x2c
	ldr r2, [r5, r2]
	add r0, r6, #0
	bl sub_02050510
	add r0, r5, #0
	bl FreeToHeap
	b _0203C136
_0203C0C6:
	mov r1, #0xd5
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r6, #0
	blx r1
	b _0203C136
_0203C0D2:
	bl FreeToHeap
	ldr r0, [r4, #0x3c]
	bl sub_0205F5A4
	mov r0, #1
	pop {r4, r5, r6, pc}
_0203C0E0:
	add r1, r4, #0
	bl sub_0203C69C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203C38C
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x3f
	bic r1, r0
	mov r0, #2
	orr r1, r0
	add r0, r4, #0
	add r0, #0xd2
	strb r1, [r0]
	ldr r0, [r4, #8]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [r4, #0x3c]
	bl sub_0205F5A4
	mov r0, #1
	pop {r4, r5, r6, pc}
_0203C11A:
	bl sub_0200FB5C
	cmp r0, #0
	beq _0203C136
	mov r0, #3
	strh r0, [r5, #0x26]
	b _0203C136
_0203C128:
	add r0, r6, #0
	bl sub_0203D2EC
	b _0203C136
_0203C130:
	add r0, r6, #0
	bl sub_0203D304
_0203C136:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _0203C146
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0202457C
_0203C146:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203BEF0

	thumb_func_start sub_0203C14C
sub_0203C14C: ; 0x0203C14C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	bl sub_0205064C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r5, r0, #0
	add r1, r5, #0
	add r2, r5, #0
	add r1, #0x30
	add r2, #0x3a
	bl sub_0203C220
	add r6, r0, #0
	ldr r0, _0203C1F8 ; =0x00000000
	str r6, [r5, #0x2c]
	strh r0, [r5, #0x24]
	beq _0203C18E
_0203C176:
	add r1, r4, #0
	add r1, #0x90
	ldr r2, [r1]
	add r1, r5, r0
	add r1, #0x30
	ldrb r1, [r1]
	cmp r2, r1
	bne _0203C188
	strh r0, [r5, #0x24]
_0203C188:
	add r0, r0, #1
	cmp r0, r6
	blo _0203C176
_0203C18E:
	mov r1, #1
	str r1, [r5, #0x20]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r2, [r4, #8]
	mov r0, #0xe
	mov r1, #0xc
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #0xe
	mov r1, #0xf
	mov r2, #0
	lsl r3, r0, #5
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r2, [r4, #8]
	mov r0, #0xe
	mov r1, #0xd
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	add r3, r0, #0
	add r0, r5, #0
	add r5, #0x30
	lsl r3, r3, #0x18
	add r1, r5, #0
	add r2, r6, #0
	lsr r3, r3, #0x18
	bl sub_0203C6C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203C1F8: .word 0x00000000
	thumb_func_end sub_0203C14C

	thumb_func_start sub_0203C1FC
sub_0203C1FC: ; 0x0203C1FC
	push {r3, r4}
	ldr r4, [r2]
	strb r3, [r0, r4]
	mov r0, #0
	ldr r4, [sp, #8]
	mvn r0, r0
	cmp r4, r0
	bne _0203C210
	ldr r0, [r2]
	str r0, [sp, #8]
_0203C210:
	ldr r0, [sp, #8]
	strb r3, [r1, r0]
	ldr r0, [r2]
	add r0, r0, #1
	str r0, [r2]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203C1FC

	thumb_func_start sub_0203C220
sub_0203C220: ; 0x0203C220
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	mov r1, #0xd3
	str r0, [sp, #4]
	lsl r1, r1, #2
	add r6, r2, #0
	ldr r2, [r5, r1]
	mov r1, #1
	lsl r1, r1, #8
	tst r1, r2
	bne _0203C24C
	sub r0, r0, #1
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #4
	mov r3, #8
	bl sub_0203C1FC
_0203C24C:
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #0x80
	tst r1, r0
	bne _0203C268
	sub r0, #0x81
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #4
	mov r3, #7
	bl sub_0203C1FC
_0203C268:
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #1
	tst r1, r0
	bne _0203C284
	sub r0, r0, #2
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #4
	mov r3, #0
	bl sub_0203C1FC
_0203C284:
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #2
	tst r1, r0
	bne _0203C2A0
	sub r0, r0, #3
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0203C1FC
_0203C2A0:
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #4
	tst r1, r0
	bne _0203C2BC
	sub r0, r0, #5
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #4
	mov r3, #2
	bl sub_0203C1FC
_0203C2BC:
	mov r0, #0xd3
	lsl r0, r0, #2
	mov r1, #2
	ldr r2, [r5, r0]
	lsl r1, r1, #8
	tst r1, r2
	bne _0203C2F6
	add r0, r0, #4
	ldr r0, [r5, r0]
	add r2, sp, #4
	cmp r0, #0
	beq _0203C2E6
	mov r0, #0
	mvn r0, r0
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0xc
	bl sub_0203C1FC
	b _0203C2F6
_0203C2E6:
	mov r0, #0
	mvn r0, r0
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0xb
	bl sub_0203C1FC
_0203C2F6:
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #8
	tst r1, r0
	bne _0203C312
	sub r0, #9
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #4
	mov r3, #3
	bl sub_0203C1FC
_0203C312:
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #0x10
	tst r1, r0
	bne _0203C32E
	sub r0, #0x11
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #4
	mov r3, #4
	bl sub_0203C1FC
_0203C32E:
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #0x20
	tst r1, r0
	bne _0203C34A
	sub r0, #0x21
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #4
	mov r3, #5
	bl sub_0203C1FC
_0203C34A:
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #0x40
	tst r1, r0
	bne _0203C366
	sub r0, #0x41
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #4
	mov r3, #6
	bl sub_0203C1FC
_0203C366:
	mov r0, #7
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #4
	mov r3, #9
	bl sub_0203C1FC
	mov r0, #8
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #4
	mov r3, #0xa
	bl sub_0203C1FC
	ldr r0, [sp, #4]
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203C220

	thumb_func_start sub_0203C38C
sub_0203C38C: ; 0x0203C38C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203C830
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4, #8]
	mov r1, #3
	add r3, r2, #0
	bl FillBgTilemapRect
	mov r0, #0
	str r0, [r5, #0x20]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203C38C

	thumb_func_start sub_0203C3B8
sub_0203C3B8: ; 0x0203C3B8
	lsl r2, r1, #2
	ldr r1, _0203C3C4 ; =0x020FA0C4
	ldr r3, _0203C3C8 ; =sub_0203C3CC
	ldr r1, [r1, r2]
	bx r3
	nop
_0203C3C4: .word 0x020FA0C4
_0203C3C8: .word sub_0203C3CC
	thumb_func_end sub_0203C3B8

	thumb_func_start sub_0203C3CC
sub_0203C3CC: ; 0x0203C3CC
	push {r3, lr}
	cmp r1, #7
	bhi _0203C45A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0203C3DE: ; jump table
	.short _0203C3EE - _0203C3DE - 2 ; case 0
	.short _0203C3FA - _0203C3DE - 2 ; case 1
	.short _0203C406 - _0203C3DE - 2 ; case 2
	.short _0203C414 - _0203C3DE - 2 ; case 3
	.short _0203C420 - _0203C3DE - 2 ; case 4
	.short _0203C42E - _0203C3DE - 2 ; case 5
	.short _0203C43C - _0203C3DE - 2 ; case 6
	.short _0203C44A - _0203C3DE - 2 ; case 7
_0203C3EE:
	ldr r0, [r0, #0xc]
	bl sub_020503D0
	bl sub_02066974
	pop {r3, pc}
_0203C3FA:
	ldr r0, [r0, #0xc]
	bl sub_020503D0
	bl sub_0206695C
	pop {r3, pc}
_0203C406:
	ldr r0, [r0, #0xc]
	bl sub_020503D0
	mov r1, #0
	bl sub_02066980
	pop {r3, pc}
_0203C414:
	ldr r0, [r0, #0xc]
	bl sub_020503D0
	bl sub_02066968
	pop {r3, pc}
_0203C420:
	ldr r0, [r0, #0xc]
	bl sub_020503D0
	mov r1, #1
	bl sub_02066980
	pop {r3, pc}
_0203C42E:
	ldr r0, [r0, #0xc]
	bl sub_020503D0
	mov r1, #2
	bl sub_02066980
	pop {r3, pc}
_0203C43C:
	ldr r0, [r0, #0xc]
	bl sub_020503D0
	mov r1, #3
	bl sub_02066980
	pop {r3, pc}
_0203C44A:
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	bl sub_0203B9B4
	bl sub_0205C7C8
	pop {r3, pc}
_0203C45A:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203C3CC

	thumb_func_start sub_0203C460
sub_0203C460: ; 0x0203C460
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xe0
	ldr r1, [r1]
	cmp r1, #4
	beq _0203C47A
	cmp r1, #0xb
	beq _0203C47A
	mov r1, #0x45
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl sub_02092FA8
_0203C47A:
	pop {r3, pc}
	thumb_func_end sub_0203C460

	thumb_func_start sub_0203C47C
sub_0203C47C: ; 0x0203C47C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl ov01_021F6B00
	cmp r0, #0
	bne _0203C4FC
	add r0, r5, #0
	bl ov01_021F6B10
	cmp r0, #1
	bne _0203C4FC
	ldr r0, _0203C500 ; =gMain
	mov r1, #1
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _0203C4C6
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0203C508
	cmp r0, #0
	bne _0203C4BE
	mov r0, #0
	pop {r4, r5, r6, pc}
_0203C4BE:
	add r0, r5, #0
	bl sub_0203C460
	b _0203C4FC
_0203C4C6:
	add r1, r5, #0
	add r1, #0xd0
	ldrh r1, [r1]
	cmp r1, #0
	bne _0203C4E4
	ldr r1, _0203C504 ; =0x00000402
	tst r0, r1
	beq _0203C4FC
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0x10
	strh r0, [r4, #0x26]
	b _0203C4FC
_0203C4E4:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0203C5A4
	cmp r0, #0
	bne _0203C4F6
	mov r0, #0
	pop {r4, r5, r6, pc}
_0203C4F6:
	add r0, r5, #0
	bl sub_0203C460
_0203C4FC:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203C500: .word gMain
_0203C504: .word 0x00000402
	thumb_func_end sub_0203C47C

	thumb_func_start sub_0203C508
sub_0203C508: ; 0x0203C508
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0xd3
	add r4, r2, #0
	ldrb r1, [r0]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	bhs _0203C596
	ldr r0, _0203C59C ; =0x000005DC
	bl PlaySE
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl sub_02018410
	add r0, r5, #0
	add r0, #0xd3
	ldrb r0, [r0]
	str r0, [r4, #0x28]
	add r0, r4, r0
	add r0, #0x3a
	ldrb r1, [r0]
	ldr r0, _0203C5A0 ; =0x020FA0F8
	lsl r2, r1, #3
	ldr r2, [r0, r2]
	mov r0, #1
	mvn r0, r0
	cmp r2, r0
	bne _0203C550
	mov r0, #0x10
	strh r0, [r4, #0x26]
	b _0203C596
_0203C550:
	add r0, r0, #1
	cmp r2, r0
	beq _0203C596
	add r0, r5, #0
	bl sub_0203C3B8
	cmp r0, #0
	beq _0203C596
	ldr r0, [r4, #0x28]
	add r0, r4, r0
	add r0, #0x3a
	ldrb r0, [r0]
	lsl r1, r0, #3
	ldr r0, _0203C5A0 ; =0x020FA0F8
	ldr r6, [r0, r1]
	add r0, r5, #0
	mov r1, #0
	bl sub_0203DF64
	add r0, r5, #0
	bl ov01_021F6B50
	add r0, r5, #0
	mov r1, #0
	add r0, #0xd0
	strh r1, [r0]
	ldr r0, [r4, #0x28]
	add r5, #0xe0
	add r0, r4, r0
	add r0, #0x3a
	ldrb r0, [r0]
	str r0, [r5]
	add r0, r7, #0
	blx r6
	pop {r3, r4, r5, r6, r7, pc}
_0203C596:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203C59C: .word 0x000005DC
_0203C5A0: .word 0x020FA0F8
	thumb_func_end sub_0203C508

	thumb_func_start sub_0203C5A4
sub_0203C5A4: ; 0x0203C5A4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r0, #0
	add r0, r4, #0
	add r0, #0xd0
	ldrh r0, [r0]
	add r5, r2, #0
	cmp r0, #0
	beq _0203C5C2
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl sub_02018410
_0203C5C2:
	add r0, r4, #0
	add r0, #0xd0
	ldrh r0, [r0]
	cmp r0, #0xa
	bhi _0203C690
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0203C5D8: ; jump table
	.short _0203C690 - _0203C5D8 - 2 ; case 0
	.short _0203C5EE - _0203C5D8 - 2 ; case 1
	.short _0203C602 - _0203C5D8 - 2 ; case 2
	.short _0203C602 - _0203C5D8 - 2 ; case 3
	.short _0203C602 - _0203C5D8 - 2 ; case 4
	.short _0203C602 - _0203C5D8 - 2 ; case 5
	.short _0203C602 - _0203C5D8 - 2 ; case 6
	.short _0203C602 - _0203C5D8 - 2 ; case 7
	.short _0203C602 - _0203C5D8 - 2 ; case 8
	.short _0203C602 - _0203C5D8 - 2 ; case 9
	.short _0203C602 - _0203C5D8 - 2 ; case 10
_0203C5EE:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0x10
	strh r0, [r5, #0x26]
	mov r0, #0
	add r4, #0xd0
	strh r0, [r4]
	b _0203C690
_0203C602:
	sub r1, r0, #2
	add r0, r4, #0
	add r0, #0xd3
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xd3
	ldrb r1, [r0]
	ldr r0, [r5, #0x2c]
	cmp r1, r0
	bhs _0203C690
	ldr r0, _0203C694 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	add r0, #0xd3
	ldrb r0, [r0]
	str r0, [r5, #0x28]
	add r0, r5, r0
	add r0, #0x3a
	ldrb r1, [r0]
	ldr r0, _0203C698 ; =0x020FA0F8
	lsl r2, r1, #3
	ldr r2, [r0, r2]
	mov r0, #1
	mvn r0, r0
	cmp r2, r0
	bne _0203C644
	mov r0, #0x10
	strh r0, [r5, #0x26]
	mov r0, #0
	add r4, #0xd0
	strh r0, [r4]
	b _0203C690
_0203C644:
	add r0, r0, #1
	cmp r2, r0
	beq _0203C690
	add r0, r4, #0
	bl sub_0203C3B8
	cmp r0, #0
	beq _0203C68A
	ldr r0, [r5, #0x28]
	add r0, r5, r0
	add r0, #0x3a
	ldrb r0, [r0]
	lsl r1, r0, #3
	ldr r0, _0203C698 ; =0x020FA0F8
	ldr r6, [r0, r1]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xd0
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #1
	bl sub_0203DF64
	add r0, r4, #0
	bl ov01_021F6B50
	ldr r0, [r5, #0x28]
	add r4, #0xe0
	add r0, r5, r0
	add r0, #0x3a
	ldrb r0, [r0]
	str r0, [r4]
	add r0, r7, #0
	blx r6
	pop {r3, r4, r5, r6, r7, pc}
_0203C68A:
	mov r0, #0
	add r4, #0xd0
	strh r0, [r4]
_0203C690:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203C694: .word 0x000005DC
_0203C698: .word 0x020FA0F8
	thumb_func_end sub_0203C5A4

	thumb_func_start sub_0203C69C
sub_0203C69C: ; 0x0203C69C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02035650
	cmp r0, #0
	beq _0203C6C6
	mov r0, #0x35
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0203C6C6
	add r4, #0x84
	ldr r0, [r4]
	bl sub_0205AD0C
	bl sub_02037FF0
	mov r0, #0
	bl sub_0205A904
_0203C6C6:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203C69C

	thumb_func_start sub_0203C6C8
sub_0203C6C8: ; 0x0203C6C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	mov r1, #0x76
	add r5, r0, #0
	lsl r1, r1, #2
	mov r0, #1
	add r1, r5, r1
	mov r2, #0xb
	bl sub_02009F40
	mov r1, #0x75
	lsl r1, r1, #2
	mov r7, #3
	str r0, [r5, r1]
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #8
_0203C6EA:
	mov r0, #1
	add r1, r6, #0
	mov r2, #0xb
	bl sub_0200A090
	str r0, [r4, r7]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _0203C6EA
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #3
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	mov r1, #0xe
	mov r2, #0x40
	bl sub_0200A1D8
	mov r1, #0x31
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r3, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xb
	sub r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	mov r1, #0xe
	mov r2, #0x3d
	bl sub_0200A234
	mov r1, #0xc5
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0xb
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0xe
	mov r2, #0x3e
	mov r3, #1
	bl sub_0200A294
	mov r1, #0xc6
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0xb
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0xe
	mov r2, #0x3f
	mov r3, #1
	bl sub_0200A294
	mov r1, #0xc7
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0xc
	ldr r0, [r5, r1]
	bl sub_0200ADA4
	mov r0, #0xc5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200B00C
	mov r0, #0xc5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200A740
	mov r1, #0
	mov r2, #3
	str r1, [sp]
	sub r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	lsl r2, r2, #8
	ldr r0, [r5, r2]
	add r3, r1, #0
	str r0, [sp, #0x14]
	add r0, r2, #4
	ldr r0, [r5, r0]
	str r0, [sp, #0x18]
	add r0, r2, #0
	add r0, #8
	ldr r0, [r5, r0]
	str r0, [sp, #0x1c]
	add r0, r2, #0
	add r0, #0xc
	ldr r0, [r5, r0]
	add r2, #0x20
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, r5, r2
	add r2, r1, #0
	str r1, [sp, #0x28]
	bl sub_02009D48
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x32
	mov r2, #1
	lsl r2, r2, #0xc
	mov r3, #0
	lsl r1, r1, #4
	str r0, [sp, #0x2c]
	add r0, r5, r1
	str r0, [sp, #0x30]
	str r3, [sp, #0x3c]
	str r2, [sp, #0x40]
	str r2, [sp, #0x44]
	str r2, [sp, #0x48]
	add r2, sp, #0x2c
	strh r3, [r2, #0x20]
	str r0, [sp, #0x30]
	lsl r0, r1, #9
	str r0, [sp, #0x34]
	mov r0, #9
	mov r2, #1
	lsl r0, r0, #0x10
	str r2, [sp, #0x54]
	mov r2, #0xb
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	str r3, [sp, #0x50]
	str r2, [sp, #0x58]
	bl sub_02024624
	mov r1, #0xd1
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #1
	bl sub_0202484C
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203C6C8

	thumb_func_start sub_0203C830
sub_0203C830: ; 0x0203C830
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x31
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200AEB0
	mov r0, #0xc5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200B0A8
	mov r6, #3
	mov r4, #0
	lsl r6, r6, #8
_0203C84E:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, r6]
	bl sub_0200A0D0
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #4
	blo _0203C84E
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02024504
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203C830

	thumb_func_start sub_0203C870
sub_0203C870: ; 0x0203C870
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0200FB5C
	cmp r0, #0
	beq _0203C8AE
	add r0, r5, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r1, r6, #0
	add r4, r0, #0
	bl sub_0203C38C
	add r0, r6, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x3f
	add r6, #0xd2
	bic r1, r0
	strb r1, [r6]
	mov r1, #0xd5
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r5, #0
	blx r1
	mov r0, #5
	strh r0, [r4, #0x26]
_0203C8AE:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203C870

	thumb_func_start sub_0203C8B0
sub_0203C8B0: ; 0x0203C8B0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505A0
	cmp r0, #0
	bne _0203C8EE
	mov r1, #0xd5
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r6, #0
	blx r1
	ldrh r0, [r4, #0x26]
	cmp r0, #0xf
	bne _0203C8EE
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	bl sub_020183F0
	cmp r0, #1
	bne _0203C8EE
	mov r0, #0xa
	strh r0, [r4, #0x26]
_0203C8EE:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203C8B0

	thumb_func_start sub_0203C8F0
sub_0203C8F0: ; 0x0203C8F0
	mov r2, #0xd5
	lsl r2, r2, #2
	str r1, [r0, r2]
	mov r1, #5
	strh r1, [r0, #0x26]
	bx lr
	thumb_func_end sub_0203C8F0

	thumb_func_start sub_0203C8FC
sub_0203C8FC: ; 0x0203C8FC
	push {r4, lr}
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0
	bl ov01_021E636C
	mov r0, #0xd5
	ldr r1, _0203C91C ; =sub_0203C920
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #4
	strh r0, [r4, #0x26]
	mov r0, #1
	pop {r4, pc}
	nop
_0203C91C: .word sub_0203C920
	thumb_func_end sub_0203C8FC

	thumb_func_start sub_0203C920
sub_0203C920: ; 0x0203C920
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	bl sub_0205064C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02050650
	str r0, [sp]
	ldr r0, [r4, #0xc]
	bl sub_0203B9C4
	add r5, r0, #0
	bl sub_0203B958
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_0203B964
	str r0, [sp, #8]
	mov r0, #0xb
	mov r1, #0x1c
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x1c
	add r5, r0, #0
	bl MIi_CpuFill8
	ldr r0, [r4, #0xc]
	bl sub_0202A634
	str r0, [r5]
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r5, #4]
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	str r0, [r5, #8]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r4, r0
	str r0, [r5, #0xc]
	ldr r0, [r4, #0x40]
	bl sub_0205C67C
	add r6, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205C688
	add r7, r0, #0
	asr r1, r6, #4
	asr r2, r7, #4
	lsr r1, r1, #0x1b
	lsr r2, r2, #0x1b
	add r1, r6, r1
	add r2, r7, r2
	ldr r0, [r4, #0x30]
	asr r1, r1, #5
	asr r2, r2, #5
	bl sub_0203B024
	strh r0, [r5, #0x1a]
	ldr r0, [sp, #4]
	ldr r0, [r0]
	strh r0, [r5, #0x18]
	ldrh r0, [r5, #0x1a]
	bl sub_0203B564
	cmp r0, #0
	beq _0203C9BA
	str r6, [r5, #0x10]
	str r7, [r5, #0x14]
	b _0203C9F4
_0203C9BA:
	ldrh r0, [r5, #0x1a]
	add r1, sp, #0xc
	add r1, #2
	add r2, sp, #0xc
	bl sub_0203B518
	add r1, sp, #0xc
	mov r0, #2
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bne _0203C9E6
	mov r0, #0
	ldrsh r0, [r1, r0]
	cmp r0, #0
	bne _0203C9E6
	ldr r0, [sp, #8]
	ldr r0, [r0, #8]
	str r0, [r5, #0x10]
	ldr r0, [sp, #8]
	ldr r0, [r0, #0xc]
	str r0, [r5, #0x14]
	b _0203C9F4
_0203C9E6:
	lsl r0, r2, #5
	str r0, [r5, #0x10]
	add r1, sp, #0xc
	mov r0, #0
	ldrsh r0, [r1, r0]
	lsl r0, r0, #5
	str r0, [r5, #0x14]
_0203C9F4:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0203F7F4
	mov r1, #0xe
	ldr r0, [sp]
	lsl r1, r1, #6
	str r5, [r0, r1]
	ldr r2, _0203CA10 ; =sub_0203CA14
	sub r1, #0x2c
	str r2, [r0, r1]
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203CA10: .word sub_0203CA14
	thumb_func_end sub_0203C920

	thumb_func_start sub_0203CA14
sub_0203CA14: ; 0x0203CA14
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0203CA3C
	mov r0, #0xb
	bl FreeToHeapExplicit
_0203CA3C:
	mov r0, #0xf
	strh r0, [r4, #0x26]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203CA14

	thumb_func_start sub_0203CA44
sub_0203CA44: ; 0x0203CA44
	push {r4, lr}
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0
	bl ov01_021E636C
	mov r0, #0xd5
	ldr r1, _0203CA64 ; =sub_0203CA68
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #4
	strh r0, [r4, #0x26]
	mov r0, #1
	pop {r4, pc}
	nop
_0203CA64: .word sub_0203CA68
	thumb_func_end sub_0203CA44

	thumb_func_start sub_0203CA68
sub_0203CA68: ; 0x0203CA68
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	mov r1, #0x37
	add r4, r0, #0
	lsl r1, r1, #4
	add r0, r5, #0
	add r1, r4, r1
	mov r2, #0
	bl sub_0203E550
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r0, _0203CA98 ; =sub_0203CA9C
	sub r1, #0x2c
	str r0, [r4, r1]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203CA98: .word sub_0203CA9C
	thumb_func_end sub_0203CA68

	thumb_func_start sub_0203CA9C
sub_0203CA9C: ; 0x0203CA9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r7, #0
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0xe
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	mov r2, #0x44
	add r6, r0, #0
	bl memcpy
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r6, #0
	add r0, #0x27
	ldrb r0, [r0]
	cmp r0, #0x18
	bls _0203CADC
	b _0203CE6C
_0203CADC:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0203CAE8: ; jump table
	.short _0203CE6C - _0203CAE8 - 2 ; case 0
	.short _0203CB1A - _0203CAE8 - 2 ; case 1
	.short _0203CE6C - _0203CAE8 - 2 ; case 2
	.short _0203CD68 - _0203CAE8 - 2 ; case 3
	.short _0203CBA8 - _0203CAE8 - 2 ; case 4
	.short _0203CC3E - _0203CAE8 - 2 ; case 5
	.short _0203CCD4 - _0203CAE8 - 2 ; case 6
	.short _0203CD2A - _0203CAE8 - 2 ; case 7
	.short _0203CDCA - _0203CAE8 - 2 ; case 8
	.short _0203CDF6 - _0203CAE8 - 2 ; case 9
	.short _0203CE50 - _0203CAE8 - 2 ; case 10
	.short _0203CE2A - _0203CAE8 - 2 ; case 11
	.short _0203CE2A - _0203CAE8 - 2 ; case 12
	.short _0203CE2A - _0203CAE8 - 2 ; case 13
	.short _0203CE2A - _0203CAE8 - 2 ; case 14
	.short _0203CE2A - _0203CAE8 - 2 ; case 15
	.short _0203CE2A - _0203CAE8 - 2 ; case 16
	.short _0203CE2A - _0203CAE8 - 2 ; case 17
	.short _0203CE2A - _0203CAE8 - 2 ; case 18
	.short _0203CE2A - _0203CAE8 - 2 ; case 19
	.short _0203CE2A - _0203CAE8 - 2 ; case 20
	.short _0203CE2A - _0203CAE8 - 2 ; case 21
	.short _0203CE2A - _0203CAE8 - 2 ; case 22
	.short _0203CE2A - _0203CAE8 - 2 ; case 23
	.short _0203CE2A - _0203CAE8 - 2 ; case 24
_0203CB1A:
	mov r0, #0xb
	mov r1, #0x3c
	bl AllocFromHeap
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r7]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r7, #4]
	mov r0, #1
	strb r0, [r7, #0x11]
	add r0, r6, #0
	add r0, #0x26
	ldrb r0, [r0]
	strb r0, [r7, #0x14]
	ldr r0, [r7]
	bl GetPartyCount
	strb r0, [r7, #0x13]
	mov r0, #0
	strh r0, [r7, #0x18]
	strb r0, [r7, #0x12]
	ldr r0, [r5, #0xc]
	bl sub_0202D95C
	str r0, [r7, #0x20]
	ldr r0, [r5, #0xc]
	bl sub_02074910
	str r0, [r7, #0x1c]
	ldr r0, [r5, #0xc]
	bl sub_02088288
	str r0, [r7, #0x2c]
	mov r0, #0
	str r0, [r7, #0x28]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r7, #0x30]
	ldr r0, [r5, #0xc]
	bl sub_0208828C
	str r0, [r7, #0x34]
	ldr r1, _0203CEDC ; =0x020FA0B0
	add r0, r7, #0
	bl sub_02089D40
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r7, #0
	bl sub_0208AD34
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0203E4EC
	mov r0, #0xe
	lsl r0, r0, #6
	str r7, [r4, r0]
	ldr r1, _0203CEE0 ; =sub_0203D580
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203CEFE
_0203CBA8:
	mov r0, #0xb
	mov r1, #0x3c
	bl AllocFromHeap
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r7]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r7, #4]
	mov r1, #1
	add r0, r6, #0
	strb r1, [r7, #0x11]
	add r0, #0x26
	ldrb r0, [r0]
	strb r0, [r7, #0x14]
	strb r1, [r7, #0x13]
	ldrh r0, [r6, #0x2a]
	strh r0, [r7, #0x18]
	mov r0, #2
	strb r0, [r7, #0x12]
	ldr r0, [r5, #0xc]
	bl sub_02074910
	str r0, [r7, #0x1c]
	ldr r0, [r5, #0xc]
	bl sub_02088288
	str r0, [r7, #0x2c]
	mov r0, #0
	str r0, [r7, #0x28]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r7, #0x30]
	ldr r0, [r5, #0xc]
	bl sub_0208828C
	str r0, [r7, #0x34]
	ldr r1, _0203CEE4 ; =0x020FA0AC
	add r0, r7, #0
	bl sub_02089D40
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r7, #0
	bl sub_0208AD34
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0203E4EC
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeap
	ldrh r1, [r6, #0x28]
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r0, r1, #4
	str r7, [r4, r0]
	ldr r1, _0203CEE0 ; =sub_0203D580
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203CEFE
_0203CC3E:
	mov r0, #0xb
	mov r1, #0x3c
	bl AllocFromHeap
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r7]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r7, #4]
	mov r1, #1
	add r0, r6, #0
	strb r1, [r7, #0x11]
	add r0, #0x26
	ldrb r0, [r0]
	strb r0, [r7, #0x14]
	strb r1, [r7, #0x13]
	ldrh r0, [r6, #0x2a]
	strh r0, [r7, #0x18]
	mov r0, #2
	strb r0, [r7, #0x12]
	ldr r0, [r5, #0xc]
	bl sub_02074910
	str r0, [r7, #0x1c]
	ldr r0, [r5, #0xc]
	bl sub_02088288
	str r0, [r7, #0x2c]
	mov r0, #0
	str r0, [r7, #0x28]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r7, #0x30]
	ldr r0, [r5, #0xc]
	bl sub_0208828C
	str r0, [r7, #0x34]
	ldr r1, _0203CEE4 ; =0x020FA0AC
	add r0, r7, #0
	bl sub_02089D40
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r7, #0
	bl sub_0208AD34
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0203E4EC
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeap
	mov r1, #0
	strh r1, [r0]
	ldr r1, [r6, #0x38]
	strh r1, [r0, #2]
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r0, r1, #4
	str r7, [r4, r0]
	ldr r1, _0203CEE0 ; =sub_0203D580
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203CEFE
_0203CCD4:
	ldrh r0, [r6, #0x28]
	bl sub_02078078
	add r3, r0, #0
	mov r0, #0xb
	add r2, r6, #0
	str r0, [sp]
	add r2, #0x26
	ldrb r2, [r2]
	add r0, r5, #0
	mov r1, #2
	bl sub_0203EFEC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	add r0, r6, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0xa
	ldrh r0, [r6, #0x28]
	bne _0203CD0E
	add r2, r6, #0
	add r2, #0x26
	ldrb r2, [r2]
	mov r1, #0
	bl sub_0203D818
	b _0203CD1A
_0203CD0E:
	add r2, r6, #0
	add r2, #0x26
	ldrb r2, [r2]
	mov r1, #1
	bl sub_0203D818
_0203CD1A:
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r1, _0203CEE8 ; =sub_0203D830
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203CEFE
_0203CD2A:
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	add r1, #0x26
	ldrb r1, [r1]
	bl GetPartyMonByIndex
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0xb
	bl sub_0203F050
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	add r2, r6, #0
	add r2, #0x26
	ldrh r0, [r6, #0x28]
	ldrb r2, [r2]
	mov r1, #2
	bl sub_0203D818
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r1, _0203CEE8 ; =sub_0203D830
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203CEFE
_0203CD68:
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeap
	add r1, r6, #0
	add r1, #0x26
	ldrb r1, [r1]
	str r1, [r0]
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r5, #0xc]
	bl sub_0207879C
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	ldr r1, _0203CEEC ; =0x020FA0B8
	add r0, r7, #0
	mov r2, #0xb
	bl sub_02078644
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	add r3, r5, #0
	str r0, [sp]
	add r3, #0x94
	ldr r0, [r4, r1]
	ldr r1, [r5, #0xc]
	ldr r3, [r3]
	mov r2, #1
	bl sub_0207789C
	mov r1, #0xe
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	add r0, r5, #0
	bl sub_0203E3D4
	ldr r1, _0203CEF0 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203CEFE
_0203CDCA:
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeap
	ldrh r1, [r6, #0x28]
	strh r1, [r0, #2]
	mov r1, #3
	strb r1, [r0, #1]
	add r1, r6, #0
	add r1, #0x26
	ldrb r1, [r1]
	strb r1, [r0]
	ldrh r1, [r6, #0x3c]
	strh r1, [r0, #4]
	ldr r1, [r6, #0x40]
	str r1, [r0, #8]
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #8
	strh r0, [r4, #0x26]
	b _0203CEFE
_0203CDF6:
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeap
	add r7, r0, #0
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl sub_0203B60C
	strh r0, [r7, #2]
	mov r0, #0
	strb r0, [r7, #1]
	add r0, r6, #0
	add r0, #0x26
	ldrb r0, [r0]
	strb r0, [r7]
	ldrh r0, [r6, #0x3c]
	strh r0, [r7, #4]
	ldr r0, [r6, #0x40]
	str r0, [r7, #8]
	mov r0, #0xe
	lsl r0, r0, #6
	str r7, [r4, r0]
	mov r0, #8
	strh r0, [r4, #0x26]
	b _0203CEFE
_0203CE2A:
	sub r0, #0xb
	add r1, sp, #4
	strh r0, [r1, #6]
	add r0, r6, #0
	add r0, #0x26
	ldrb r0, [r0]
	strh r0, [r1, #4]
	str r7, [sp, #4]
	ldrh r1, [r1, #6]
	mov r0, #0
	bl sub_02067DF4
	mov r1, #0x37
	lsl r1, r1, #4
	add r2, r0, #0
	add r0, sp, #4
	add r1, r4, r1
	blx r2
	b _0203CEFE
_0203CE50:
	mov r1, #0xd6
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203CEF0 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203CEFE
_0203CE6C:
	add r0, r6, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #5
	beq _0203CE86
	cmp r0, #6
	beq _0203CE86
	cmp r0, #7
	beq _0203CE86
	cmp r0, #0x10
	beq _0203CE86
	cmp r0, #8
	bne _0203CEBA
_0203CE86:
	mov r1, #0xd6
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r2, #0xe
	lsl r2, r2, #6
	str r0, [r4, r2]
	add r0, r6, #0
	add r0, #0x26
	ldrb r1, [r0]
	ldr r0, [r4, r2]
	cmp r1, #6
	blo _0203CEAC
	mov r1, #0
	bl sub_020778E0
	b _0203CEB0
_0203CEAC:
	bl sub_020778E0
_0203CEB0:
	ldr r1, _0203CEF0 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203CEFE
_0203CEBA:
	cmp r0, #9
	bne _0203CEF4
	mov r1, #0xd6
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203CEF0 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203CEFE
	nop
_0203CEDC: .word 0x020FA0B0
_0203CEE0: .word sub_0203D580
_0203CEE4: .word 0x020FA0AC
_0203CEE8: .word sub_0203D830
_0203CEEC: .word 0x020FA0B8
_0203CEF0: .word sub_0203CFC0
_0203CEF4:
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xf
	strh r0, [r4, #0x26]
_0203CEFE:
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203CA9C

	thumb_func_start sub_0203CF0C
sub_0203CF0C: ; 0x0203CF0C
	push {r4, lr}
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0
	bl ov01_021E636C
	mov r0, #0xd5
	ldr r1, _0203CF2C ; =sub_0203CF30
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #4
	strh r0, [r4, #0x26]
	mov r0, #1
	pop {r4, pc}
	nop
_0203CF2C: .word sub_0203CF30
	thumb_func_end sub_0203CF0C

	thumb_func_start sub_0203CF30
sub_0203CF30: ; 0x0203CF30
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	mov r1, #0xd6
	add r4, r0, #0
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0
	bl sub_020778E0
	mov r0, #0xd5
	ldr r1, _0203CF70 ; =sub_0203CFC0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	bl ov01_021F4440
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0203CF70: .word sub_0203CFC0
	thumb_func_end sub_0203CF30

	thumb_func_start sub_0203CF74
sub_0203CF74: ; 0x0203CF74
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r2, #0
	mov r1, #0
	mov r2, #0x44
	add r5, r0, #0
	bl memset
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r5]
	ldr r0, [r4, #0xc]
	bl sub_0207879C
	str r0, [r5, #4]
	ldr r0, [r4, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r5, #8]
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r5, #0xc]
	mov r0, #0x37
	lsl r0, r0, #4
	add r0, r6, r0
	str r0, [r5, #0x18]
	add r0, r5, #0
	mov r1, #0
	add r0, #0x25
	strb r1, [r0]
	mov r0, #0x43
	lsl r0, r0, #2
	str r4, [r5, #0x1c]
	add r0, r4, r0
	str r0, [r5, #0x20]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203CF74

	thumb_func_start sub_0203CFC0
sub_0203CFC0: ; 0x0203CFC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	bl sub_0205064C
	str r0, [sp, #8]
	add r0, r5, #0
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0xb
	bl sub_02077878
	add r7, r0, #0
	bl sub_02077890
	mov r1, #0xe
	lsl r1, r1, #6
	add r2, r0, #0
	ldr r1, [r4, r1]
	add r0, r7, #0
	bl memcpy
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r7, #0
	bl sub_0207790C
	cmp r0, #5
	bls _0203D004
	b _0203D186
_0203D004:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203D010: ; jump table
	.short _0203D01C - _0203D010 - 2 ; case 0
	.short _0203D056 - _0203D010 - 2 ; case 1
	.short _0203D066 - _0203D010 - 2 ; case 2
	.short _0203D186 - _0203D010 - 2 ; case 3
	.short _0203D0AC - _0203D010 - 2 ; case 4
	.short _0203D186 - _0203D010 - 2 ; case 5
_0203D01C:
	add r0, r7, #0
	bl sub_02077904
	add r1, sp, #0x10
	strh r0, [r1, #4]
	add r0, r7, #0
	bl sub_02077914
	add r1, sp, #0x10
	strb r0, [r1, #6]
	str r5, [sp, #0x10]
	ldrh r0, [r1, #4]
	mov r1, #6
	mov r2, #0xb
	bl sub_02077D88
	add r1, r0, #0
	lsl r1, r1, #0x10
	mov r0, #0
	lsr r1, r1, #0x10
	bl sub_02064980
	mov r1, #0xd6
	lsl r1, r1, #2
	add r2, r0, #0
	add r0, sp, #0x10
	add r1, r4, r1
	blx r2
	b _0203D190
_0203D056:
	add r0, r7, #0
	bl sub_02077904
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0203D664
	b _0203D190
_0203D066:
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r5, r0, #0
	bl memset
	ldr r1, [sp, #8]
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0203CF74
	add r0, r5, #0
	mov r1, #9
	add r0, #0x24
	strb r1, [r0]
	add r0, r7, #0
	bl sub_02077904
	strh r0, [r5, #0x28]
	ldr r0, [sp, #8]
	ldr r1, _0203D19C ; =0x0210159C
	add r2, r5, #0
	bl SwitchToPokegearApp
	mov r0, #0xe
	lsl r0, r0, #6
	str r5, [r4, r0]
	ldr r1, _0203D1A0 ; =sub_0203CA9C
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203D190
_0203D0AC:
	ldr r0, [sp, #8]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [sp, #4]
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r6, [r0]
	add r0, r7, #0
	bl sub_02077904
	add r5, r0, #0
	ldr r0, [sp, #4]
	add r1, r6, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0xc]
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r5, #0
	bl sub_02078068
	cmp r0, #1
	bne _0203D12C
	ldr r0, [sp, #0xc]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0203D12C
	add r0, r5, #0
	bl sub_02078078
	add r3, r0, #0
	mov r0, #0xb
	str r0, [sp]
	lsl r2, r6, #0x18
	ldr r0, [sp, #8]
	mov r1, #2
	lsr r2, r2, #0x18
	bl sub_0203EFEC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	lsl r2, r6, #0x18
	add r0, r5, #0
	mov r1, #0
	lsr r2, r2, #0x18
	bl sub_0203D818
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r1, _0203D1A4 ; =sub_0203D830
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203D190
_0203D12C:
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r5, r0, #0
	bl memset
	ldr r1, [sp, #8]
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0203CF74
	ldr r0, [sp, #4]
	str r0, [r5]
	add r0, r7, #0
	bl sub_02077904
	strh r0, [r5, #0x28]
	add r0, r5, #0
	add r0, #0x26
	strb r6, [r0]
	ldrh r0, [r5, #0x28]
	cmp r0, #0
	bne _0203D164
	mov r1, #0
	b _0203D166
_0203D164:
	mov r1, #0xa
_0203D166:
	add r0, r5, #0
	add r0, #0x24
	strb r1, [r0]
	ldr r0, [sp, #8]
	ldr r1, _0203D19C ; =0x0210159C
	add r2, r5, #0
	bl SwitchToPokegearApp
	mov r0, #0xe
	lsl r0, r0, #6
	str r5, [r4, r0]
	ldr r1, _0203D1A0 ; =sub_0203CA9C
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203D190
_0203D186:
	ldr r0, [sp, #8]
	bl sub_020505C0
	mov r0, #0xf
	strh r0, [r4, #0x26]
_0203D190:
	add r0, r7, #0
	bl FreeToHeap
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203D19C: .word 0x0210159C
_0203D1A0: .word sub_0203CA9C
_0203D1A4: .word sub_0203D830
	thumb_func_end sub_0203CFC0

	thumb_func_start sub_0203D1A8
sub_0203D1A8: ; 0x0203D1A8
	push {r4, lr}
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0
	bl ov01_021E636C
	mov r0, #0xd5
	ldr r1, _0203D1C8 ; =sub_0203D1CC
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #4
	strh r0, [r4, #0x26]
	mov r0, #1
	pop {r4, pc}
	nop
_0203D1C8: .word sub_0203D1CC
	thumb_func_end sub_0203D1A8

	thumb_func_start sub_0203D1CC
sub_0203D1CC: ; 0x0203D1CC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0xb
	bl sub_020691C4
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r6, [r4, r1]
	mov r0, #1
	str r5, [sp]
	add r1, r0, #0
	mov r2, #0
	mov r3, #0xff
	str r6, [sp, #4]
	bl sub_02068FC8
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0203F7B0
	mov r0, #0xd5
	ldr r1, _0203D214 ; =sub_0203D218
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203D214: .word sub_0203D218
	thumb_func_end sub_0203D1CC

	thumb_func_start sub_0203D218
sub_0203D218: ; 0x0203D218
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_020691E0
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xf
	strh r0, [r4, #0x26]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203D218

	thumb_func_start sub_0203D244
sub_0203D244: ; 0x0203D244
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	mov r1, #1
	mov r2, #0
	bl ov01_021F6A9C
	mov r0, #6
	strh r0, [r4, #0x26]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203D244

	thumb_func_start sub_0203D264
sub_0203D264: ; 0x0203D264
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl ov01_021F6B00
	cmp r0, #1
	bne _0203D284
	mov r0, #7
	strh r0, [r4, #0x26]
_0203D284:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203D264

	thumb_func_start sub_0203D288
sub_0203D288: ; 0x0203D288
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl ov01_021F6B00
	cmp r0, #0
	bne _0203D2C8
	add r0, r5, #0
	bl ov01_021F6B10
	cmp r0, #1
	bne _0203D2C8
	add r0, r5, #0
	add r0, #0xd0
	ldrh r0, [r0]
	cmp r0, #1
	bne _0203D2C4
	mov r0, #0
	add r5, #0xd0
	strh r0, [r5]
	mov r0, #0x10
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
_0203D2C4:
	mov r0, #3
	strh r0, [r4, #0x26]
_0203D2C8:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203D288

	thumb_func_start sub_0203D2CC
sub_0203D2CC: ; 0x0203D2CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	mov r1, #8
	mov r2, #0
	bl ov01_021F6A9C
	mov r0, #0x13
	strh r0, [r4, #0x26]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203D2CC

	thumb_func_start sub_0203D2EC
sub_0203D2EC: ; 0x0203D2EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	mov r0, #0x14
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203D2EC

	thumb_func_start sub_0203D304
sub_0203D304: ; 0x0203D304
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r0, r4, #0
	bl sub_02050650
	mov r1, #0x10
	strh r1, [r0, #0x26]
	pop {r4, pc}
	thumb_func_end sub_0203D304

	thumb_func_start sub_0203D318
sub_0203D318: ; 0x0203D318
	push {r4, lr}
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0
	bl ov01_021E636C
	mov r0, #0xd5
	ldr r1, _0203D338 ; =sub_0203D33C
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #4
	strh r0, [r4, #0x26]
	mov r0, #1
	pop {r4, pc}
	nop
_0203D338: .word sub_0203D33C
	thumb_func_end sub_0203D318

	thumb_func_start sub_0203D33C
sub_0203D33C: ; 0x0203D33C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203EE24
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r0, _0203D364 ; =sub_0203D368
	sub r1, #0x2c
	str r0, [r4, r1]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203D364: .word sub_0203D368
	thumb_func_end sub_0203D33C

	thumb_func_start sub_0203D368
sub_0203D368: ; 0x0203D368
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xf
	strh r0, [r4, #0x26]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203D368

	thumb_func_start sub_0203D394
sub_0203D394: ; 0x0203D394
	push {r4, lr}
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0
	bl ov01_021E636C
	mov r0, #0xd5
	ldr r1, _0203D3B4 ; =sub_0203D3B8
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #4
	strh r0, [r4, #0x26]
	mov r0, #1
	pop {r4, pc}
	nop
_0203D3B4: .word sub_0203D3B8
	thumb_func_end sub_0203D394

	thumb_func_start sub_0203D3B8
sub_0203D3B8: ; 0x0203D3B8
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0xb
	str r0, [sp]
	mov r3, #0x43
	lsl r3, r3, #2
	ldr r2, [r5, #0xc]
	mov r0, #2
	mov r1, #0
	add r3, r5, r3
	bl sub_02090C94
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	add r0, sp, #4
	mov r1, #4
	bl MailMsg_init_withBank
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, sp, #4
	bl sub_02090D20
	mov r1, #0xe
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	add r0, r5, #0
	bl sub_0203EA24
	mov r0, #0xd5
	ldr r1, _0203D414 ; =sub_0203D418
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0203D414: .word sub_0203D418
	thumb_func_end sub_0203D3B8

	thumb_func_start sub_0203D418
sub_0203D418: ; 0x0203D418
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	bl sub_0205064C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r5, r0, #0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_02090D48
	cmp r0, #0
	bne _0203D466
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, sp, #0
	bl sub_02090D60
	bl sub_02035650
	cmp r0, #0
	beq _0203D460
	add r0, sp, #0
	bl sub_0205AB88
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, sp, #0
	bl sub_0205AA6C
_0203D460:
	mov r0, #0xa
	strh r0, [r5, #0x26]
	b _0203D46A
_0203D466:
	mov r0, #0xf
	strh r0, [r5, #0x26]
_0203D46A:
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_02090D0C
	add r0, r4, #0
	bl sub_020505C0
	add r4, #0x84
	ldr r0, [r4]
	bl sub_0205AD0C
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203D418

	thumb_func_start sub_0203D488
sub_0203D488: ; 0x0203D488
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r1, r4, #0
	add r6, r0, #0
	bl sub_0203C38C
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x3f
	bic r1, r0
	add r0, r4, #0
	add r0, #0xd2
	strb r1, [r0]
	ldr r0, [r4, #0xc]
	bl sub_020503D0
	bl sub_02066860
	cmp r0, #1
	bne _0203D4CA
	ldr r1, _0203D4F8 ; =0x00002266
	add r0, r5, #0
	mov r2, #0
	bl sub_0203FF0C
	b _0203D4EE
_0203D4CA:
	ldr r0, [r4, #0xc]
	bl sub_020503D0
	bl sub_02066870
	cmp r0, #1
	bne _0203D4E4
	ldr r1, _0203D4FC ; =0x000028A4
	add r0, r5, #0
	mov r2, #0
	bl sub_0203FF0C
	b _0203D4EE
_0203D4E4:
	add r0, r5, #0
	mov r1, #4
	mov r2, #0
	bl sub_0203FF0C
_0203D4EE:
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203D4F8: .word 0x00002266
_0203D4FC: .word 0x000028A4
	thumb_func_end sub_0203D488

	thumb_func_start sub_0203D500
sub_0203D500: ; 0x0203D500
	push {r4, lr}
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0
	bl ov01_021E636C
	mov r0, #0xd5
	ldr r1, _0203D520 ; =sub_0203D524
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #4
	strh r0, [r4, #0x26]
	mov r0, #1
	pop {r4, pc}
	nop
_0203D520: .word sub_0203D524
	thumb_func_end sub_0203D500

	thumb_func_start sub_0203D524
sub_0203D524: ; 0x0203D524
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203EA84
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r0, _0203D54C ; =sub_0203D550
	sub r1, #0x2c
	str r0, [r4, r1]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203D54C: .word sub_0203D550
	thumb_func_end sub_0203D524

	thumb_func_start sub_0203D550
sub_0203D550: ; 0x0203D550
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0203D578
	mov r0, #0xb
	bl FreeToHeapExplicit
_0203D578:
	mov r0, #0xf
	strh r0, [r4, #0x26]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203D550

	thumb_func_start sub_0203D580
sub_0203D580: ; 0x0203D580
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl sub_0205064C
	str r0, [sp]
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0x3c
	bl AllocFromHeap
	mov r1, #0xe
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	mov r2, #0x3c
	add r6, r0, #0
	bl memcpy
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldrb r0, [r6, #0x12]
	cmp r0, #2
	bne _0203D634
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0xe1
	lsl r1, r1, #2
	ldr r7, [r4, r1]
	ldr r1, [sp]
	add r2, r4, #0
	add r5, r0, #0
	bl sub_0203CF74
	ldrh r0, [r7]
	strh r0, [r5, #0x28]
	add r0, r5, #0
	ldrb r1, [r6, #0x14]
	add r0, #0x26
	strb r1, [r0]
	ldrh r0, [r6, #0x18]
	strh r0, [r5, #0x2a]
	add r0, r5, #0
	ldrb r1, [r6, #0x16]
	add r0, #0x2c
	strb r1, [r0]
	ldrh r0, [r7]
	cmp r0, #0
	beq _0203D5FA
	add r0, r5, #0
	mov r1, #7
	add r0, #0x24
	strb r1, [r0]
	mov r0, #0
	b _0203D604
_0203D5FA:
	add r0, r5, #0
	mov r1, #8
	add r0, #0x24
	strb r1, [r0]
	ldrh r0, [r7, #2]
_0203D604:
	str r0, [r5, #0x38]
	mov r1, #0x43
	ldr r0, [sp]
	lsl r1, r1, #2
	add r0, r0, r1
	str r0, [r5, #0x20]
	ldr r0, [sp]
	ldr r1, _0203D65C ; =0x0210159C
	add r2, r5, #0
	bl SwitchToPokegearApp
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0xe
	lsl r0, r0, #6
	str r5, [r4, r0]
	ldr r1, _0203D660 ; =sub_0203CA9C
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203D650
_0203D634:
	mov r1, #0x37
	lsl r1, r1, #4
	ldrb r2, [r6, #0x14]
	ldr r0, [sp]
	add r1, r4, r1
	bl sub_0203E550
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D660 ; =sub_0203CA9C
	add r0, r4, #0
	bl sub_0203C8F0
_0203D650:
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203D65C: .word 0x0210159C
_0203D660: .word sub_0203CA9C
	thumb_func_end sub_0203D580

	thumb_func_start sub_0203D664
sub_0203D664: ; 0x0203D664
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_0205064C
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_02050650
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl sub_0207879C
	add r4, r0, #0
	mov r5, #0
	mov r6, #1
	mov r7, #0xb
_0203D688:
	add r0, r5, #0
	bl sub_020780F4
	add r1, r0, #0
	add r0, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_020784B0
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0x40
	blo _0203D688
	ldr r0, [sp, #4]
	add r3, sp, #8
	add r0, #0x94
	str r0, [sp, #4]
	ldr r0, [r0]
	mov r1, #4
	add r2, sp, #8
	add r3, #1
	bl sub_020787C0
	ldr r0, [sp]
	ldr r1, _0203D6C4 ; =sub_0203D6C8
	bl sub_0203C8F0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0203D6C4: .word sub_0203D6C8
	thumb_func_end sub_0203D664

	thumb_func_start sub_0203D6C8
sub_0203D6C8: ; 0x0203D6C8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x94
	mov r2, #0
	ldr r0, [r0]
	mov r1, #4
	add r3, r2, #0
	bl sub_020787D4
	mov r1, #0xe
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	mov r0, #0xb
	bl FreeToHeapExplicit
	mov r1, #0xd6
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D714 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203D714: .word sub_0203CFC0
	thumb_func_end sub_0203D6C8

	thumb_func_start sub_0203D718
sub_0203D718: ; 0x0203D718
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	mov r1, #0xe
	add r4, r0, #0
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	mov r0, #0xb
	bl FreeToHeapExplicit
	mov r1, #0xd6
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D754 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203D754: .word sub_0203CFC0
	thumb_func_end sub_0203D718

	thumb_func_start sub_0203D758
sub_0203D758: ; 0x0203D758
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_0205064C
	add r7, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #0xb
	ldr r6, [r1]
	bl FreeToHeapExplicit
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r5, [r4, r0]
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _0203D7AE
	mov r0, #0xb
	add r1, r5, #0
	bl FreeToHeapExplicit
	mov r1, #0x37
	lsl r1, r1, #4
	lsl r2, r6, #0x18
	add r0, r7, #0
	add r1, r4, r1
	lsr r2, r2, #0x18
	bl sub_0203E550
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D810 ; =sub_0203CA9C
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203D808
_0203D7AE:
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r2, r0, #0
	ldrh r0, [r5, #0x20]
	lsl r3, r6, #0x10
	add r1, r7, #0
	str r0, [sp]
	ldr r0, [r5, #0x18]
	lsr r3, r3, #0x10
	lsl r0, r0, #5
	add r0, #0x10
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	lsl r0, r0, #5
	add r0, #0x10
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xb
	bl sub_02067BF8
	mov r1, #0xe
	lsl r1, r1, #6
	add r5, r0, #0
	ldr r1, [r4, r1]
	mov r0, #0xb
	bl FreeToHeapExplicit
	add r0, r7, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _0203D814 ; =sub_02067C30
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
_0203D808:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0203D810: .word sub_0203CA9C
_0203D814: .word sub_02067C30
	thumb_func_end sub_0203D758

	thumb_func_start sub_0203D818
sub_0203D818: ; 0x0203D818
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	mov r1, #4
	add r6, r2, #0
	bl AllocFromHeap
	strh r5, [r0]
	strb r6, [r0, #2]
	strb r4, [r0, #3]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203D818

	thumb_func_start sub_0203D830
sub_0203D830: ; 0x0203D830
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r6, [r4, r0]
	ldrb r1, [r6, #3]
	cmp r1, #3
	bhi _0203D928
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0203D85A: ; jump table
	.short _0203D8AC - _0203D85A - 2 ; case 0
	.short _0203D8EC - _0203D85A - 2 ; case 1
	.short _0203D886 - _0203D85A - 2 ; case 2
	.short _0203D862 - _0203D85A - 2 ; case 3
_0203D862:
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02090F90
	mov r1, #0xd6
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D938 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203D928
_0203D886:
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02090F90
	mov r1, #0x37
	lsl r1, r1, #4
	ldrb r2, [r6, #2]
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E550
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D93C ; =sub_0203CA9C
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203D928
_0203D8AC:
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02090F6C
	cmp r0, #1
	bne _0203D8C4
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0xc
	bl sub_0203D940
	b _0203D928
_0203D8C4:
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_02090F90
	mov r1, #0x37
	lsl r1, r1, #4
	ldrb r2, [r6, #2]
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E550
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D93C ; =sub_0203CA9C
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203D928
_0203D8EC:
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02090F6C
	cmp r0, #1
	bne _0203D904
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0xb
	bl sub_0203D940
	b _0203D928
_0203D904:
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_02090F90
	mov r1, #0xd6
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D938 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
_0203D928:
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_0203D938: .word sub_0203CFC0
_0203D93C: .word sub_0203CA9C
	thumb_func_end sub_0203D830

	thumb_func_start sub_0203D940
sub_0203D940: ; 0x0203D940
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0xe1
	add r5, r1, #0
	str r2, [sp]
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	add r1, r7, #0
	add r2, r5, #0
	add r4, r0, #0
	bl sub_0203CF74
	ldrh r0, [r6]
	strh r0, [r4, #0x28]
	add r0, r4, #0
	ldrb r1, [r6, #2]
	add r0, #0x26
	strb r1, [r0]
	add r1, r4, #0
	ldr r0, [sp]
	add r1, #0x24
	strb r0, [r1]
	ldrb r1, [r6, #2]
	ldr r0, [r4]
	bl GetPartyMonByIndex
	add r1, r0, #0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_02090F70
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_02090F90
	ldr r1, _0203D9AC ; =0x0210159C
	add r0, r7, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	mov r0, #0xe
	lsl r0, r0, #6
	str r4, [r5, r0]
	ldr r1, _0203D9B0 ; =sub_0203CA9C
	add r0, r5, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203D9AC: .word 0x0210159C
_0203D9B0: .word sub_0203CA9C
	thumb_func_end sub_0203D940

	thumb_func_start sub_0203D9B4
sub_0203D9B4: ; 0x0203D9B4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	mov r1, #0xd6
	add r4, r0, #0
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D9E4 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203D9E4: .word sub_0203CFC0
	thumb_func_end sub_0203D9B4

	thumb_func_start sub_0203D9E8
sub_0203D9E8: ; 0x0203D9E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r5, r0, #0
	bl sub_0205064C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r6, r0, #0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r5, [r6, r0]
	bl sub_02005FA0
	mov r0, #3
	mov r1, #0x47
	lsl r2, r0, #0x10
	bl sub_0201A910
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	ldrb r1, [r5]
	str r0, [sp, #0x1c]
	bl GetPartyMonByIndex
	str r0, [sp, #0x20]
	ldrb r0, [r5, #1]
	cmp r0, #0
	ldr r0, [r4, #0xc]
	bne _0203DA72
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [sp, #0x24]
	ldr r0, [r4, #0xc]
	bl sub_02088288
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0202A634
	str r0, [sp, #0x28]
	ldr r0, [r4, #0xc]
	bl sub_0207879C
	str r0, [sp, #0x2c]
	ldr r0, [r4, #0xc]
	bl sub_0202CF54
	ldr r1, [sp, #0x28]
	str r7, [sp]
	str r1, [sp, #4]
	ldr r1, [sp, #0x2c]
	ldr r3, [sp, #0x24]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #8]
	ldr r1, [sp, #0x20]
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0x47
	str r0, [sp, #0x18]
	ldrh r2, [r5, #4]
	ldr r0, [sp, #0x1c]
	bl sub_02075A7C
	b _0203DABA
_0203DA72:
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [sp, #0x30]
	ldr r0, [r4, #0xc]
	bl sub_02088288
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0202A634
	str r0, [sp, #0x34]
	ldr r0, [r4, #0xc]
	bl sub_0207879C
	str r0, [sp, #0x38]
	ldr r0, [r4, #0xc]
	bl sub_0202CF54
	ldr r1, [sp, #0x34]
	str r7, [sp]
	str r1, [sp, #4]
	ldr r1, [sp, #0x38]
	ldr r3, [sp, #0x30]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #8]
	ldr r1, [sp, #0x20]
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	mov r0, #0x47
	str r0, [sp, #0x18]
	ldrh r2, [r5, #4]
	ldr r0, [sp, #0x1c]
	bl sub_02075A7C
_0203DABA:
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeap
	ldrb r1, [r5]
	str r1, [r0]
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r6, r1]
	sub r0, r1, #4
	ldr r0, [r6, r0]
	bl FreeToHeap
	mov r0, #0xe
	lsl r0, r0, #6
	str r4, [r6, r0]
	mov r0, #9
	strh r0, [r6, #0x26]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0203D9E8

	thumb_func_start sub_0203DAE4
sub_0203DAE4: ; 0x0203DAE4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_02075D3C
	cmp r0, #1
	bne _0203DB60
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_02075D4C
	mov r0, #0x47
	bl sub_0201A9C4
	ldr r0, _0203DB64 ; =0x000003F3
	mov r1, #0
	bl sub_02005EB4
	mov r0, #0
	bl sub_02004AD8
	ldr r1, [r5, #0x20]
	add r0, r5, #0
	ldr r1, [r1]
	bl sub_02055164
	mov r1, #0xd6
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r1, [r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_020778E0
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r1, _0203DB68 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
_0203DB60:
	pop {r3, r4, r5, pc}
	nop
_0203DB64: .word 0x000003F3
_0203DB68: .word sub_0203CFC0
	thumb_func_end sub_0203DAE4

	thumb_func_start sub_0203DB6C
sub_0203DB6C: ; 0x0203DB6C
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203DB6C

	thumb_func_start sub_0203DB70
sub_0203DB70: ; 0x0203DB70
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203DB70

	thumb_func_start sub_0203DB74
sub_0203DB74: ; 0x0203DB74
	mov r0, #1
	bx lr
	thumb_func_end sub_0203DB74

	thumb_func_start sub_0203DB78
sub_0203DB78: ; 0x0203DB78
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x40]
	add r4, r1, #0
	add r5, r2, #0
	bl sub_0205C654
	add r7, r0, #0
	ldr r0, [r6, #0x40]
	bl sub_0205C67C
	str r0, [r4]
	ldr r0, [r6, #0x40]
	bl sub_0205C688
	str r0, [r5]
	cmp r7, #3
	bhi _0203DBCE
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203DBA8: ; jump table
	.short _0203DBB0 - _0203DBA8 - 2 ; case 0
	.short _0203DBB8 - _0203DBA8 - 2 ; case 1
	.short _0203DBC0 - _0203DBA8 - 2 ; case 2
	.short _0203DBC8 - _0203DBA8 - 2 ; case 3
_0203DBB0:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	b _0203DBCE
_0203DBB8:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0203DBCE
_0203DBC0:
	ldr r0, [r4]
	sub r0, r0, #1
	str r0, [r4]
	b _0203DBCE
_0203DBC8:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0203DBCE:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203DB78

	thumb_func_start sub_0203DBD4
sub_0203DBD4: ; 0x0203DBD4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl sub_0205C6DC
	bl sub_0205F9D0
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F9D0
	cmp r4, r0
	bne _0203DBF0
	mov r0, #1
	b _0203DBF2
_0203DBF0:
	mov r0, #0
_0203DBF2:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203DBD4

	thumb_func_start sub_0203DBF8
sub_0203DBF8: ; 0x0203DBF8
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r1, #0
	add r1, sp, #4
	add r2, sp, #0
	add r5, r0, #0
	bl sub_0203DB78
	add r4, r0, #0
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r5, #0
	bl sub_02054918
	bl sub_0205B700
	cmp r0, #1
	bne _0203DC52
	cmp r4, #3
	bhi _0203DC52
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203DC2C: ; jump table
	.short _0203DC34 - _0203DC2C - 2 ; case 0
	.short _0203DC3C - _0203DC2C - 2 ; case 1
	.short _0203DC44 - _0203DC2C - 2 ; case 2
	.short _0203DC4C - _0203DC2C - 2 ; case 3
_0203DC34:
	ldr r0, [sp]
	sub r0, r0, #1
	str r0, [sp]
	b _0203DC52
_0203DC3C:
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	b _0203DC52
_0203DC44:
	ldr r0, [sp, #4]
	sub r0, r0, #1
	str r0, [sp, #4]
	b _0203DC52
_0203DC4C:
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_0203DC52:
	ldr r0, [r5, #0x3c]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	mov r3, #0
	bl sub_0205FB58
	str r0, [r6]
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203DBF8

	thumb_func_start sub_0203DC64
sub_0203DC64: ; 0x0203DC64
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	bl sub_0203DBF8
	ldr r0, [r4]
	cmp r0, #0
	beq _0203DC8C
	bl sub_0205F6C8
	cmp r0, #1
	bne _0203DC8C
	ldr r0, [r5, #0x40]
	ldr r1, [r4]
	bl sub_0203DBD4
	cmp r0, #1
	bne _0203DC8C
	mov r0, #1
	pop {r3, r4, r5, pc}
_0203DC8C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203DC64

	thumb_func_start sub_0203DC90
sub_0203DC90: ; 0x0203DC90
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp]
	str r2, [sp, #4]
	add r1, sp, #0xc
	add r2, sp, #8
	add r6, r0, #0
	bl sub_0203DB78
	ldr r0, [sp, #4]
	mov r7, #0
	cmp r0, #0
	ble _0203DD04
	ldr r4, [sp]
	add r5, r4, #0
_0203DCAE:
	ldr r1, [sp, #0xc]
	ldr r0, [r4, #4]
	cmp r1, r0
	bne _0203DCF8
	ldr r1, [sp, #8]
	ldr r0, [r4, #8]
	cmp r1, r0
	bne _0203DCF8
	ldrh r0, [r4, #2]
	cmp r0, #2
	bne _0203DCDE
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0203DD10
	cmp r0, #1
	bne _0203DCF8
	mov r0, #0x14
	add r1, r7, #0
	mul r1, r0
	ldr r0, [sp]
	add sp, #0x10
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
_0203DCDE:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0203DD3C
	cmp r0, #1
	bne _0203DCF8
	mov r0, #0x14
	add r1, r7, #0
	mul r1, r0
	ldr r0, [sp]
	add sp, #0x10
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
_0203DCF8:
	ldr r0, [sp, #4]
	add r7, r7, #1
	add r4, #0x14
	add r5, #0x14
	cmp r7, r0
	blt _0203DCAE
_0203DD04:
	ldr r0, _0203DD0C ; =0x0000FFFF
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203DD0C: .word 0x0000FFFF
	thumb_func_end sub_0203DC90

	thumb_func_start sub_0203DD10
sub_0203DD10: ; 0x0203DD10
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r1, #2]
	cmp r0, #2
	beq _0203DD1E
	mov r0, #0
	pop {r4, pc}
_0203DD1E:
	ldrh r0, [r1]
	bl sub_0204055C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_020403FC
	cmp r0, #1
	beq _0203DD34
	mov r0, #1
	b _0203DD36
_0203DD34:
	mov r0, #0
_0203DD36:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, pc}
	thumb_func_end sub_0203DD10

	thumb_func_start sub_0203DD3C
sub_0203DD3C: ; 0x0203DD3C
	push {r4, lr}
	add r4, r1, #0
	ldrh r1, [r4, #0x10]
	cmp r1, #4
	bne _0203DD4A
	mov r0, #1
	pop {r4, pc}
_0203DD4A:
	ldr r0, [r0, #0x40]
	bl sub_0205C654
	cmp r0, #3
	bhi _0203DDA0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203DD60: ; jump table
	.short _0203DD68 - _0203DD60 - 2 ; case 0
	.short _0203DD76 - _0203DD60 - 2 ; case 1
	.short _0203DD84 - _0203DD60 - 2 ; case 2
	.short _0203DD92 - _0203DD60 - 2 ; case 3
_0203DD68:
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _0203DD72
	cmp r0, #6
	bne _0203DDA0
_0203DD72:
	mov r0, #1
	pop {r4, pc}
_0203DD76:
	ldrh r0, [r4, #0x10]
	cmp r0, #3
	beq _0203DD80
	cmp r0, #6
	bne _0203DDA0
_0203DD80:
	mov r0, #1
	pop {r4, pc}
_0203DD84:
	ldrh r0, [r4, #0x10]
	cmp r0, #2
	beq _0203DD8E
	cmp r0, #5
	bne _0203DDA0
_0203DD8E:
	mov r0, #1
	pop {r4, pc}
_0203DD92:
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	beq _0203DD9C
	cmp r0, #5
	bne _0203DDA0
_0203DD9C:
	mov r0, #1
	pop {r4, pc}
_0203DDA0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_0203DD3C

	thumb_func_start sub_0203DDA4
sub_0203DDA4: ; 0x0203DDA4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	add r6, r1, #0
	add r4, r2, #0
	bl sub_0205C654
	cmp r0, #0
	beq _0203DDBE
	add sp, #8
	ldr r0, _0203DE00 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_0203DDBE:
	add r0, r5, #0
	add r1, sp, #4
	add r2, sp, #0
	bl sub_0203DB78
	mov r0, #0
	cmp r4, #0
	ble _0203DDF8
	ldr r2, [sp, #4]
	ldr r3, [sp]
	add r1, r6, #0
_0203DDD4:
	ldr r5, [r1, #4]
	cmp r2, r5
	bne _0203DDF0
	ldr r5, [r1, #8]
	cmp r3, r5
	bne _0203DDF0
	ldrh r5, [r1, #2]
	cmp r5, #1
	bne _0203DDF0
	mov r1, #0x14
	mul r1, r0
	add sp, #8
	ldrh r0, [r6, r1]
	pop {r4, r5, r6, pc}
_0203DDF0:
	add r0, r0, #1
	add r1, #0x14
	cmp r0, r4
	blt _0203DDD4
_0203DDF8:
	ldr r0, _0203DE00 ; =0x0000FFFF
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0203DE00: .word 0x0000FFFF
	thumb_func_end sub_0203DDA4

	thumb_func_start sub_0203DE04
sub_0203DE04: ; 0x0203DE04
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	ldr r0, [r0, #0x40]
	str r1, [sp, #4]
	str r2, [sp, #8]
	bl sub_0205C67C
	add r6, r0, #0
	ldr r0, [sp]
	ldr r0, [r0, #0x40]
	bl sub_0205C688
	add r4, r0, #0
	ldr r0, [sp, #8]
	mov r7, #0
	cmp r0, #0
	ble _0203DE68
	ldr r5, [sp, #4]
_0203DE2A:
	ldrh r1, [r5, #2]
	cmp r6, r1
	blt _0203DE5E
	ldrh r0, [r5, #6]
	add r0, r1, r0
	cmp r6, r0
	bge _0203DE5E
	ldrh r1, [r5, #4]
	cmp r4, r1
	blt _0203DE5E
	ldrh r0, [r5, #8]
	add r0, r1, r0
	cmp r4, r0
	bge _0203DE5E
	ldrh r1, [r5, #0xe]
	ldr r0, [sp]
	bl sub_020403AC
	ldrh r1, [r5, #0xc]
	cmp r1, r0
	bne _0203DE5E
	ldr r0, [sp, #4]
	lsl r1, r7, #4
	add sp, #0xc
	ldrh r0, [r0, r1]
	pop {r4, r5, r6, r7, pc}
_0203DE5E:
	ldr r0, [sp, #8]
	add r7, r7, #1
	add r5, #0x10
	cmp r7, r0
	blt _0203DE2A
_0203DE68:
	ldr r0, _0203DE70 ; =0x0000FFFF
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0203DE70: .word 0x0000FFFF
	thumb_func_end sub_0203DE04

	thumb_func_start sub_0203DE74
sub_0203DE74: ; 0x0203DE74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020072A4
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203DFE0
	ldr r1, _0203DEA0 ; =0x021D4158
	str r0, [r1]
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _0203DE94
	bl sub_02053620
	b _0203DE98
_0203DE94:
	bl sub_0205353C
_0203DE98:
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203DEA0: .word 0x021D4158
	thumb_func_end sub_0203DE74

	thumb_func_start sub_0203DEA4
sub_0203DEA4: ; 0x0203DEA4
	push {r3, lr}
	bl sub_0203DFE0
	ldr r1, _0203DEB8 ; =0x021D4158
	str r0, [r1]
	bl sub_02053470
	mov r0, #1
	pop {r3, pc}
	nop
_0203DEB8: .word 0x021D4158
	thumb_func_end sub_0203DEA4

	thumb_func_start sub_0203DEBC
sub_0203DEBC: ; 0x0203DEBC
	push {r3, lr}
	bl sub_02007290
	bl sub_0203E0CC
	cmp r0, #0
	beq _0203DECE
	mov r0, #1
	pop {r3, pc}
_0203DECE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203DEBC

	.public ov60_021EAFE0

	thumb_func_start sub_0203DED4
sub_0203DED4: ; 0x0203DED4
	push {r3, lr}
	bl sub_0203E058
	ldr r0, _0203DEE8 ; =SDK_OVERLAY_OVY_60_ID
	ldr r1, _0203DEEC ; =ov60_021EAFE0
	bl RegisterMainOverlay
	mov r0, #1
	pop {r3, pc}
	nop
_0203DEE8: .word SDK_OVERLAY_OVY_60_ID
_0203DEEC: .word ov60_021EAFE0
	thumb_func_end sub_0203DED4

	thumb_func_start sub_0203DEF0
sub_0203DEF0: ; 0x0203DEF0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0203DF00
	bl GF_AssertFail
_0203DF00:
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	beq _0203DF0C
	bl GF_AssertFail
_0203DF0C:
	ldr r0, _0203DF2C ; =SDK_OVERLAY_OVY_1_ID
	mov r1, #2
	bl HandleLoadOverlay
	mov r1, #0
	str r1, [r4, #0x6c]
	ldr r0, [r4]
	mov r2, #0xb
	str r1, [r0, #8]
	ldr r0, _0203DF30 ; =0x02206378
	add r1, r4, #0
	bl OverlayManager_new
	ldr r1, [r4]
	str r0, [r1]
	pop {r4, pc}
	.balign 4, 0
_0203DF2C: .word SDK_OVERLAY_OVY_1_ID
_0203DF30: .word 0x02206378
	thumb_func_end sub_0203DEF0

	thumb_func_start sub_0203DF34
sub_0203DF34: ; 0x0203DF34
	mov r1, #0
	str r1, [r0, #0x6c]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203DF34

	thumb_func_start sub_0203DF3C
sub_0203DF3C: ; 0x0203DF3C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x11
	lsl r0, r0, #4
	ldrb r0, [r4, r0]
	mov r1, #1
	cmp r0, #0
	beq _0203DF52
	cmp r0, #1
	beq _0203DF52
	mov r1, #0
_0203DF52:
	cmp r1, #0
	bne _0203DF5A
	bl GF_AssertFail
_0203DF5A:
	mov r0, #0x11
	lsl r0, r0, #4
	ldrb r0, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203DF3C

	thumb_func_start sub_0203DF64
sub_0203DF64: ; 0x0203DF64
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	beq _0203DF74
	cmp r4, #1
	beq _0203DF74
	bl GF_AssertFail
_0203DF74:
	mov r0, #0x11
	lsl r0, r0, #4
	strb r4, [r5, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203DF64

	thumb_func_start sub_0203DF7C
sub_0203DF7C: ; 0x0203DF7C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	beq _0203DF88
	mov r0, #1
	bx lr
_0203DF88:
	mov r0, #0
	bx lr
	thumb_func_end sub_0203DF7C

	thumb_func_start sub_0203DF8C
sub_0203DF8C: ; 0x0203DF8C
	ldr r1, [r0]
	ldr r1, [r1]
	cmp r1, #0
	beq _0203DF9E
	ldr r0, [r0, #0x6c]
	cmp r0, #0
	beq _0203DF9E
	mov r0, #1
	bx lr
_0203DF9E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203DF8C

	thumb_func_start sub_0203DFA4
sub_0203DFA4: ; 0x0203DFA4
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0203DFB0
	mov r0, #1
	bx lr
_0203DFB0:
	mov r0, #0
	bx lr
	thumb_func_end sub_0203DFA4

	thumb_func_start SwitchToPokegearApp
SwitchToPokegearApp: ; 0x0203DFB4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	ldr r0, [r0, #4]
	add r6, r2, #0
	cmp r0, #0
	beq _0203DFC8
	bl GF_AssertFail
_0203DFC8:
	add r0, r5, #0
	bl sub_0203DF34
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #0xb
	bl OverlayManager_new
	ldr r1, [r5]
	str r0, [r1, #4]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end SwitchToPokegearApp

	thumb_func_start sub_0203DFE0
sub_0203DFE0: ; 0x0203DFE0
	push {r4, r5, r6, lr}
	mov r2, #7
	add r5, r0, #0
	mov r0, #3
	mov r1, #0xb
	lsl r2, r2, #0xe
	bl sub_0201A910
	mov r1, #0x20
	mov r0, #3
	lsl r2, r1, #9
	bl sub_0201A910
	mov r2, #0x57
	mov r0, #0
	mov r1, #0x59
	lsl r2, r2, #4
	bl sub_0201A910
	mov r1, #0x4a
	add r0, r5, #0
	lsl r1, r1, #2
	mov r2, #0xb
	bl sub_02007280
	mov r2, #0x4a
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MIi_CpuFill8
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeap
	str r0, [r4]
	mov r1, #0
	str r1, [r0]
	ldr r0, [r4]
	ldr r6, _0203E054 ; =SDK_OVERLAY_OVY_124_ID
	str r1, [r0, #4]
	ldr r0, [r4]
	str r1, [r0, #8]
	ldr r0, [r4]
	str r1, [r0, #0xc]
	add r0, r6, #0
	mov r1, #2
	bl HandleLoadOverlay
	add r0, r5, #0
	add r1, r4, #0
	bl ov124_02260C20
	add r0, r6, #0
	bl UnloadOverlayByID
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203E054: .word SDK_OVERLAY_OVY_124_ID
	thumb_func_end sub_0203DFE0

	thumb_func_start sub_0203E058
sub_0203E058: ; 0x0203E058
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02007290
	add r4, r0, #0
	ldr r0, [r4, #0x30]
	bl sub_0203AFD8
	add r0, r4, #0
	bl sub_0203B630
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	bl sub_02092BD0
	mov r0, #0x45
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02092DD8
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r5, #0
	bl sub_02007294
	mov r0, #0x59
	bl sub_0201A9C4
	mov r0, #0xb
	bl sub_0201A9C4
	mov r0, #0x20
	bl sub_0201A9C4
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203E058

	thumb_func_start sub_0203E0AC
sub_0203E0AC: ; 0x0203E0AC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0203E0C8
	bl OverlayManager_run
	cmp r0, #0
	beq _0203E0C8
	ldr r0, [r4]
	bl OverlayManager_delete
	mov r0, #0
	str r0, [r4]
_0203E0C8:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203E0AC

	thumb_func_start sub_0203E0CC
sub_0203E0CC: ; 0x0203E0CC
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203E15C
	add r0, r4, #0
	bl sub_02050544
	cmp r0, #1
	bne _0203E0EE
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0203E0EE
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov01_021F6830
_0203E0EE:
	ldr r0, [r4]
	ldr r1, [r0]
	cmp r1, #0
	beq _0203E10A
	bl sub_0203E0AC
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	bne _0203E116
	ldr r0, _0203E138 ; =SDK_OVERLAY_OVY_1_ID
	bl UnloadOverlayByID
	b _0203E116
_0203E10A:
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0203E116
	add r0, r0, #4
	bl sub_0203E0AC
_0203E116:
	ldr r1, [r4]
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0203E134
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0203E134
	ldr r0, [r1]
	cmp r0, #0
	bne _0203E134
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _0203E134
	mov r0, #1
	pop {r4, pc}
_0203E134:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0203E138: .word SDK_OVERLAY_OVY_1_ID
	thumb_func_end sub_0203E0CC

	thumb_func_start sub_0203E13C
sub_0203E13C: ; 0x0203E13C
	push {r3, lr}
	ldr r1, [r0]
	ldr r1, [r1, #8]
	cmp r1, #0
	bne _0203E158
	ldr r1, [r0, #0x6c]
	cmp r1, #0
	beq _0203E158
	bl sub_02050590
	cmp r0, #0
	bne _0203E158
	mov r0, #1
	pop {r3, pc}
_0203E158:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0203E13C

	thumb_func_start sub_0203E15C
sub_0203E15C: ; 0x0203E15C
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	bl sub_0203E13C
	add r5, r0, #0
	beq _0203E186
	ldr r0, [r4, #0x40]
	bl sub_0205CE68
	ldr r3, _0203E2EC ; =gMain
	add r0, sp, #8
	ldr r2, [r3, #0x48]
	ldr r3, [r3, #0x44]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	add r1, r4, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x10
	bl ov01_021E6928
_0203E186:
	ldr r0, [r4, #0x20]
	ldr r2, [r4, #0x70]
	ldr r1, [r0]
	ldr r0, _0203E2F0 ; =0x00000109
	cmp r1, r0
	bne _0203E194
	mov r2, #0
_0203E194:
	cmp r2, #2
	beq _0203E1CC
	cmp r2, #3
	beq _0203E1A2
	cmp r2, #4
	beq _0203E1F8
	b _0203E268
_0203E1A2:
	cmp r5, #0
	beq _0203E1C0
	bl sub_02057A0C
	cmp r0, #0
	beq _0203E1BE
	add r0, sp, #8
	add r1, r4, #0
	bl ov01_021E6E00
	cmp r0, #1
	bne _0203E1C0
	mov r5, #0
	b _0203E1C0
_0203E1BE:
	mov r5, #0
_0203E1C0:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020573F0
	add sp, #0x14
	pop {r4, r5, pc}
_0203E1CC:
	cmp r5, #0
	beq _0203E1DC
	add r0, sp, #8
	add r1, r4, #0
	bl ov01_021E6EFC
	cmp r0, #1
	bne _0203E1DE
_0203E1DC:
	b _0203E2E8
_0203E1DE:
	add r3, sp, #8
	ldrh r0, [r3, #8]
	mov r2, #0
	str r0, [sp]
	str r2, [sp, #4]
	ldrh r3, [r3, #6]
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x2c]
	sub r2, r2, #1
	bl sub_0205CB48
	add sp, #0x14
	pop {r4, r5, pc}
_0203E1F8:
	cmp r5, #0
	beq _0203E2E8
	add r0, sp, #8
	add r1, r4, #0
	bl ov01_021E6FD4
	cmp r0, #1
	bne _0203E22C
	ldr r0, [r4, #4]
	ldr r0, [r0, #8]
	bl ov01_021EFACC
	add r0, r4, #0
	mov r1, #4
	bl ov01_021F3DFC
	ldr r0, [r4, #0x40]
	bl ov01_021F2F24
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov01_021F6830
	add sp, #0x14
	pop {r4, r5, pc}
_0203E22C:
	ldr r0, _0203E2EC ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0203E23E
	ldr r0, [r4, #4]
	ldr r0, [r0, #8]
	bl ov01_021EFACC
_0203E23E:
	mov r5, #0
	bl sub_0203E324
	cmp r0, #0
	beq _0203E24E
	bl ov35_02259DB8
	add r5, r0, #0
_0203E24E:
	add r3, sp, #8
	ldrh r0, [r3, #8]
	mov r2, #0
	mvn r2, r2
	str r0, [sp]
	str r5, [sp, #4]
	ldrh r3, [r3, #6]
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x2c]
	bl sub_0205CB48
	add sp, #0x14
	pop {r4, r5, pc}
_0203E268:
	cmp r5, #0
	beq _0203E2E8
	add r0, sp, #8
	add r1, r4, #0
	bl ov01_021E6AF4
	add r5, r0, #0
	beq _0203E2B0
	ldr r0, [r4, #4]
	ldr r0, [r0, #8]
	bl ov01_021EFACC
	add r0, r4, #0
	mov r1, #4
	bl ov01_021F3DFC
	ldr r0, [r4, #0x40]
	bl sub_0205CF44
	ldr r0, [r4, #0x40]
	bl ov01_021F2F24
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov01_021F6830
	cmp r5, #2
	beq _0203E2E8
	mov r0, #0x45
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02092FA8
	add sp, #0x14
	pop {r4, r5, pc}
_0203E2B0:
	ldr r0, _0203E2EC ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0203E2C2
	ldr r0, [r4, #4]
	ldr r0, [r0, #8]
	bl ov01_021EFACC
_0203E2C2:
	mov r5, #0
	bl sub_0203E324
	cmp r0, #0
	beq _0203E2D2
	bl ov35_02259DB8
	add r5, r0, #0
_0203E2D2:
	add r3, sp, #8
	ldrh r0, [r3, #8]
	mov r2, #0
	mvn r2, r2
	str r0, [sp]
	str r5, [sp, #4]
	ldrh r3, [r3, #6]
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x2c]
	bl sub_0205CB48
_0203E2E8:
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_0203E2EC: .word gMain
_0203E2F0: .word 0x00000109
	thumb_func_end sub_0203E15C

	thumb_func_start sub_0203E2F4
sub_0203E2F4: ; 0x0203E2F4
	ldr r0, _0203E304 ; =0x021D4158
	ldr r3, _0203E308 ; =sub_02037504
	ldr r0, [r0]
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #8]
	bx r3
	nop
_0203E304: .word 0x021D4158
_0203E308: .word sub_02037504
	thumb_func_end sub_0203E2F4

	thumb_func_start sub_0203E30C
sub_0203E30C: ; 0x0203E30C
	ldr r0, _0203E31C ; =0x021D4158
	ldr r3, _0203E320 ; =sub_020374E4
	ldr r0, [r0]
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #8]
	bx r3
	nop
_0203E31C: .word 0x021D4158
_0203E320: .word sub_020374E4
	thumb_func_end sub_0203E30C

	thumb_func_start sub_0203E324
sub_0203E324: ; 0x0203E324
	ldr r0, _0203E338 ; =0x021D4158
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0203E332
	mov r0, #0
	bx lr
_0203E332:
	ldr r0, [r0, #0x14]
	bx lr
	nop
_0203E338: .word 0x021D4158
	thumb_func_end sub_0203E324

	thumb_func_start sub_0203E33C
sub_0203E33C: ; 0x0203E33C
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end sub_0203E33C

	thumb_func_start sub_0203E340
sub_0203E340: ; 0x0203E340
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end sub_0203E340

	thumb_func_start sub_0203E344
sub_0203E344: ; 0x0203E344
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0203E344

	thumb_func_start sub_0203E348
sub_0203E348: ; 0x0203E348
	push {r3, lr}
	bl LCRandom
	bl LCRandom
	pop {r3, pc}
	thumb_func_end sub_0203E348

	thumb_func_start sub_0203E354
sub_0203E354: ; 0x0203E354
	ldr r0, _0203E364 ; =0x021D4158
	mov r1, #1
	ldr r0, [r0]
	mvn r1, r1
	add r0, #0xc4
	str r1, [r0]
	bx lr
	nop
_0203E364: .word 0x021D4158
	thumb_func_end sub_0203E354

	thumb_func_start sub_0203E368
sub_0203E368: ; 0x0203E368
	ldr r2, _0203E37C ; =0x020FA17C
	add r3, r0, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	nop
_0203E37C: .word 0x020FA17C
	thumb_func_end sub_0203E368

	thumb_func_start sub_0203E380
sub_0203E380: ; 0x0203E380
	ldr r2, _0203E394 ; =0x020FA190
	add r3, r0, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	nop
_0203E394: .word 0x020FA190
	thumb_func_end sub_0203E380

	thumb_func_start sub_0203E398
sub_0203E398: ; 0x0203E398
	push {r3, lr}
	bl sub_0203B9C4
	bl sub_0203B958
	bl sub_0203E368
	pop {r3, pc}
	thumb_func_end sub_0203E398

	thumb_func_start sub_0203E3A8
sub_0203E3A8: ; 0x0203E3A8
	mov r0, #1
	bx lr
	thumb_func_end sub_0203E3A8

	thumb_func_start sub_0203E3AC
sub_0203E3AC: ; 0x0203E3AC
	push {r3, lr}
	bl ov12_022378C0
	cmp r0, #0
	beq _0203E3BA
	mov r0, #1
	pop {r3, pc}
_0203E3BA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203E3AC

	thumb_func_start sub_0203E3C0
sub_0203E3C0: ; 0x0203E3C0
	mov r0, #1
	bx lr
	thumb_func_end sub_0203E3C0

	thumb_func_start sub_0203E3C4
sub_0203E3C4: ; 0x0203E3C4
	ldr r3, _0203E3CC ; =SwitchToPokegearApp
	add r2, r1, #0
	ldr r1, _0203E3D0 ; =0x020FA484
	bx r3
	.balign 4, 0
_0203E3CC: .word SwitchToPokegearApp
_0203E3D0: .word 0x020FA484
	thumb_func_end sub_0203E3C4

	thumb_func_start sub_0203E3D4
sub_0203E3D4: ; 0x0203E3D4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203E3F8 ; =0x020FA464
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203E3F8: .word 0x020FA464
	thumb_func_end sub_0203E3D4

	thumb_func_start sub_0203E3FC
sub_0203E3FC: ; 0x0203E3FC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r6, r1, #0
	bl sub_0207879C
	ldr r1, _0203E45C ; =0x020FA1B8
	mov r2, #0xb
	bl sub_02078644
	mov r1, #0x43
	lsl r1, r1, #2
	add r1, r5, r1
	add r3, r5, #0
	str r1, [sp]
	add r3, #0x94
	ldr r1, [r5, #0xc]
	ldr r3, [r3]
	mov r2, #0
	add r4, r0, #0
	bl sub_0207789C
	ldr r1, [r5, #0x70]
	add r0, r4, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_020778E8
	ldr r0, [r5, #0x40]
	bl sub_0205C700
	cmp r0, #1
	bne _0203E446
	add r0, r4, #0
	bl sub_020778C8
_0203E446:
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020778DC
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203E3D4
	add r0, r4, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0203E45C: .word 0x020FA1B8
	thumb_func_end sub_0203E3FC

	thumb_func_start sub_0203E460
sub_0203E460: ; 0x0203E460
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	bl sub_0207879C
	add r6, r0, #0
	cmp r4, #0
	beq _0203E47A
	cmp r4, #1
	beq _0203E482
	b _0203E48A
_0203E47A:
	ldr r1, _0203E4C0 ; =0x020FA1A4
	ldr r0, _0203E4C4 ; =0x0210F978
	str r1, [r0]
	b _0203E48E
_0203E482:
	ldr r1, _0203E4C8 ; =0x020FA1AC
	ldr r0, _0203E4C4 ; =0x0210F978
	str r1, [r0]
	b _0203E48E
_0203E48A:
	bl GF_AssertFail
_0203E48E:
	ldr r1, _0203E4C4 ; =0x0210F978
	add r0, r6, #0
	ldr r1, [r1]
	mov r2, #0x20
	bl sub_02078644
	mov r1, #0x43
	lsl r1, r1, #2
	add r1, r5, r1
	add r3, r5, #0
	str r1, [sp]
	add r3, #0x94
	ldr r1, [r5, #0xc]
	ldr r3, [r3]
	add r4, r0, #0
	mov r2, #3
	bl sub_0207789C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203E3D4
	add r0, r4, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0203E4C0: .word 0x020FA1A4
_0203E4C4: .word 0x0210F978
_0203E4C8: .word 0x020FA1AC
	thumb_func_end sub_0203E460

	thumb_func_start sub_0203E4CC
sub_0203E4CC: ; 0x0203E4CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02077904
	add r4, r0, #0
	beq _0203E4E6
	add r0, r5, #0
	bl sub_0207790C
	cmp r0, #5
	bne _0203E4E6
	bl GF_AssertFail
_0203E4E6:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203E4CC

	thumb_func_start sub_0203E4EC
sub_0203E4EC: ; 0x0203E4EC
	ldr r3, _0203E4F4 ; =SwitchToPokegearApp
	add r2, r1, #0
	ldr r1, _0203E4F8 ; =0x02103A1C
	bx r3
	.balign 4, 0
_0203E4F4: .word SwitchToPokegearApp
_0203E4F8: .word 0x02103A1C
	thumb_func_end sub_0203E4EC

	thumb_func_start sub_0203E4FC
sub_0203E4FC: ; 0x0203E4FC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0x44
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x44
	bl MIi_CpuClearFast
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl sub_0207879C
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	add r0, r4, #0
	add r0, #0x25
	strb r6, [r0]
	add r0, r4, #0
	add r0, #0x24
	strb r7, [r0]
	mov r0, #0x43
	lsl r0, r0, #2
	str r5, [r4, #0x1c]
	add r0, r5, r0
	str r0, [r4, #0x20]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0203E4FC

	thumb_func_start sub_0203E550
sub_0203E550: ; 0x0203E550
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r2, #0
	mov r2, #0
	add r6, r1, #0
	mov r0, #0xb
	add r1, r5, #0
	add r3, r2, #0
	bl sub_0203E4FC
	add r4, r0, #0
	str r6, [r4, #0x18]
	add r0, #0x26
	strb r7, [r0]
	ldr r1, _0203E57C ; =0x0210159C
	add r0, r5, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203E57C: .word 0x0210159C
	thumb_func_end sub_0203E550

	thumb_func_start sub_0203E580
sub_0203E580: ; 0x0203E580
	push {r3, r4, r5, lr}
	mov r0, #0xb
	mov r2, #0
	mov r3, #3
	add r5, r1, #0
	bl sub_0203E4FC
	add r4, r0, #0
	ldr r1, _0203E5A0 ; =0x0210159C
	add r0, r5, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0203E5A0: .word 0x0210159C
	thumb_func_end sub_0203E580

	thumb_func_start sub_0203E5A4
sub_0203E5A4: ; 0x0203E5A4
	push {r3, r4, r5, lr}
	mov r0, #0xb
	mov r2, #0
	mov r3, #0x13
	add r5, r1, #0
	bl sub_0203E4FC
	add r4, r0, #0
	ldr r1, _0203E5C4 ; =0x0210159C
	add r0, r5, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0203E5C4: .word 0x0210159C
	thumb_func_end sub_0203E5A4

	thumb_func_start sub_0203E5C8
sub_0203E5C8: ; 0x0203E5C8
	add r0, #0x26
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203E5C8

	thumb_func_start sub_0203E5D0
sub_0203E5D0: ; 0x0203E5D0
	push {r4, r5, r6, lr}
	add r4, r2, #0
	mov r0, #0xb
	mov r2, #0
	mov r3, #0x12
	add r5, r1, #0
	bl sub_0203E4FC
	add r6, r0, #0
	add r0, #0x26
	strb r4, [r0]
	ldr r1, _0203E5F4 ; =0x0210159C
	add r0, r5, #0
	add r2, r6, #0
	bl SwitchToPokegearApp
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203E5F4: .word 0x0210159C
	thumb_func_end sub_0203E5D0

	thumb_func_start sub_0203E5F8
sub_0203E5F8: ; 0x0203E5F8
	add r0, #0x27
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203E5F8

	thumb_func_start sub_0203E600
sub_0203E600: ; 0x0203E600
	ldrb r0, [r0, #0x14]
	bx lr
	thumb_func_end sub_0203E600

	thumb_func_start sub_0203E604
sub_0203E604: ; 0x0203E604
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02050654
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #4
	bhi _0203E6CC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203E630: ; jump table
	.short _0203E63A - _0203E630 - 2 ; case 0
	.short _0203E64A - _0203E630 - 2 ; case 1
	.short _0203E680 - _0203E630 - 2 ; case 2
	.short _0203E6A2 - _0203E630 - 2 ; case 3
	.short _0203E6C2 - _0203E630 - 2 ; case 4
_0203E63A:
	ldr r1, _0203E6D0 ; =0x0210159C
	ldr r2, [r4, #4]
	add r0, r6, #0
	bl SwitchToPokegearApp
	mov r0, #1
	str r0, [r5]
	b _0203E6CC
_0203E64A:
	add r0, r6, #0
	bl sub_020505A0
	cmp r0, #0
	bne _0203E6CC
	ldr r0, [r4, #4]
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #6
	beq _0203E66E
	cmp r0, #7
	bne _0203E67A
	mov r0, #2
	bl sub_0205A508
	mov r0, #4
	str r0, [r5]
	b _0203E6CC
_0203E66E:
	mov r0, #1
	bl sub_0205A508
	mov r0, #4
	str r0, [r5]
	b _0203E6CC
_0203E67A:
	mov r0, #2
	str r0, [r5]
	b _0203E6CC
_0203E680:
	ldr r1, [r4]
	add r0, r6, #0
	mov r2, #0
	bl sub_0203E76C
	str r0, [r4, #8]
	ldr r1, [r4, #4]
	add r1, #0x26
	ldrb r1, [r1]
	strb r1, [r0, #0x14]
	ldr r1, [r4, #8]
	add r0, r6, #0
	bl sub_0203E4EC
	mov r0, #3
	str r0, [r5]
	b _0203E6CC
_0203E6A2:
	add r0, r6, #0
	bl sub_020505A0
	cmp r0, #0
	bne _0203E6CC
	ldr r0, [r4, #8]
	ldrb r1, [r0, #0x14]
	ldr r0, [r4, #4]
	add r0, #0x26
	strb r1, [r0]
	ldr r0, [r4, #8]
	bl FreeToHeap
	mov r0, #0
	str r0, [r5]
	b _0203E6CC
_0203E6C2:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_0203E6CC:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203E6D0: .word 0x0210159C
	thumb_func_end sub_0203E604

	thumb_func_start sub_0203E6D4
sub_0203E6D4: ; 0x0203E6D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0xc
	bl AllocFromHeap
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	mov r3, #2
	str r5, [r4]
	bl sub_0203E4FC
	add r5, r0, #0
	add r0, #0x36
	ldrb r1, [r0]
	mov r0, #0xf
	add r2, r4, #0
	bic r1, r0
	mov r0, #2
	orr r1, r0
	add r0, r5, #0
	add r0, #0x36
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x36
	ldrb r1, [r0]
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x20
	orr r1, r0
	add r0, r5, #0
	add r0, #0x36
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #0x1e
	add r0, #0x37
	strb r1, [r0]
	mov r0, #0
	str r0, [r5, #0x14]
	ldr r1, _0203E73C ; =sub_0203E604
	add r0, r7, #0
	str r5, [r4, #4]
	bl sub_02050530
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203E73C: .word sub_0203E604
	thumb_func_end sub_0203E6D4

	thumb_func_start sub_0203E740
sub_0203E740: ; 0x0203E740
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	add r1, r5, #0
	mov r2, #0
	mov r3, #0x15
	bl sub_0203E4FC
	add r6, r0, #0
	add r0, #0x26
	strb r4, [r0]
	ldr r1, _0203E768 ; =0x0210159C
	add r0, r5, #0
	add r2, r6, #0
	bl SwitchToPokegearApp
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_0203E768: .word 0x0210159C
	thumb_func_end sub_0203E740

	thumb_func_start sub_0203E76C
sub_0203E76C: ; 0x0203E76C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, r1, #0
	ldr r5, [r6, #0xc]
	mov r1, #0x3c
	add r7, r2, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl MIi_CpuFill8
	add r0, r5, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	add r0, r5, #0
	bl SavArray_PlayerParty_get
	str r0, [r4]
	mov r0, #1
	strb r0, [r4, #0x11]
	mov r0, #0
	strb r0, [r4, #0x14]
	ldr r0, [r4]
	bl GetPartyCount
	strb r0, [r4, #0x13]
	mov r0, #0
	strh r0, [r4, #0x18]
	strb r7, [r4, #0x12]
	add r0, r5, #0
	bl sub_02074910
	str r0, [r4, #0x1c]
	add r0, r5, #0
	bl sub_02088288
	str r0, [r4, #0x2c]
	add r0, r5, #0
	bl sub_0202D95C
	str r0, [r4, #0x20]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r6, r0
	str r0, [r4, #0x30]
	ldr r0, [r6, #0xc]
	bl sub_0208828C
	str r0, [r4, #0x34]
	ldr r1, _0203E7F0 ; =0x020FA1B0
	add r0, r4, #0
	bl sub_02089D40
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0208AD34
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203E7F0: .word 0x020FA1B0
	thumb_func_end sub_0203E76C

	thumb_func_start sub_0203E7F4
sub_0203E7F4: ; 0x0203E7F4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0x3c
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl MIi_CpuFill8
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #0x11]
	strb r6, [r4, #0x14]
	strb r0, [r4, #0x13]
	strh r7, [r4, #0x18]
	mov r0, #2
	strb r0, [r4, #0x12]
	ldr r0, [r5, #0xc]
	bl sub_02074910
	str r0, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #0x30]
	ldr r1, _0203E860 ; =0x020FA1A8
	add r0, r4, #0
	bl sub_02089D40
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0208AD34
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203E4EC
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203E860: .word 0x020FA1A8
	thumb_func_end sub_0203E7F4

	thumb_func_start sub_0203E864
sub_0203E864: ; 0x0203E864
	ldrb r0, [r0, #0x16]
	bx lr
	thumb_func_end sub_0203E864

	thumb_func_start sub_0203E868
sub_0203E868: ; 0x0203E868
	ldr r3, _0203E870 ; =SwitchToPokegearApp
	add r2, r1, #0
	ldr r1, _0203E874 ; =0x020FA414
	bx r3
	.balign 4, 0
_0203E870: .word SwitchToPokegearApp
_0203E874: .word 0x020FA414
	thumb_func_end sub_0203E868

	thumb_func_start sub_0203E878
sub_0203E878: ; 0x0203E878
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r0, #0
	bl sub_02050654
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205064C
	ldr r1, [r5]
	add r6, r0, #0
	cmp r1, #0
	beq _0203E8A4
	cmp r1, #1
	beq _0203E8B2
	cmp r1, #2
	beq _0203E8C2
	b _0203E958
_0203E8A4:
	ldr r1, [r4, #0xc]
	bl sub_0203EA24
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0203E958
_0203E8B2:
	bl sub_020505A0
	cmp r0, #0
	bne _0203E958
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0203E958
_0203E8C2:
	ldr r0, [r4, #0xc]
	bl sub_02090D48
	cmp r0, #0
	bne _0203E8D6
	ldr r0, [r4, #0xc]
	bl sub_02090D4C
	cmp r0, #0
	bne _0203E8DE
_0203E8D6:
	ldr r0, [r4]
	mov r1, #0
	strh r1, [r0]
	b _0203E946
_0203E8DE:
	ldr r0, [r4]
	mov r1, #1
	strh r1, [r0]
	ldr r0, [r4, #0x10]
	cmp r0, #5
	bhi _0203E902
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203E8F6: ; jump table
	.short _0203E902 - _0203E8F6 - 2 ; case 0
	.short _0203E90E - _0203E8F6 - 2 ; case 1
	.short _0203E926 - _0203E8F6 - 2 ; case 2
	.short _0203E926 - _0203E8F6 - 2 ; case 3
	.short _0203E926 - _0203E8F6 - 2 ; case 4
	.short _0203E926 - _0203E8F6 - 2 ; case 5
_0203E902:
	ldr r0, [r4, #0xc]
	bl sub_02090D50
	ldr r1, [r4, #4]
	strh r0, [r1]
	b _0203E946
_0203E90E:
	ldr r0, [r4, #0xc]
	add r1, sp, #8
	bl sub_02090D54
	add r0, sp, #0
	ldrh r2, [r0, #8]
	ldr r1, [r4, #4]
	strh r2, [r1]
	ldrh r1, [r0, #0xa]
	ldr r0, [r4, #8]
	strh r1, [r0]
	b _0203E946
_0203E926:
	ldr r0, [r4, #0xc]
	add r1, sp, #0
	bl sub_02090D60
	ldr r1, [r4, #0x10]
	ldr r0, [r6, #0xc]
	sub r1, r1, #2
	add r2, sp, #0
	bl sub_0202D640
	add r0, sp, #0
	mov r1, #0
	bl MailMsg_GetFieldI
	ldr r1, [r4, #4]
	strh r0, [r1]
_0203E946:
	ldr r0, [r4, #0xc]
	bl sub_02090D0C
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0203E958:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203E878

	thumb_func_start sub_0203E960
sub_0203E960: ; 0x0203E960
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #4]
	add r6, r1, #0
	str r2, [sp, #8]
	add r7, r3, #0
	bl sub_0205064C
	add r5, r0, #0
	mov r0, #0x20
	mov r1, #0x14
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [sp, #8]
	cmp r6, #5
	str r0, [r4]
	ldr r0, [sp, #0x20]
	str r7, [r4, #4]
	str r0, [r4, #8]
	str r6, [r4, #0x10]
	bhi _0203E9A4
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203E998: ; jump table
	.short _0203E9A4 - _0203E998 - 2 ; case 0
	.short _0203E9C0 - _0203E998 - 2 ; case 1
	.short _0203E9E0 - _0203E998 - 2 ; case 2
	.short _0203E9E0 - _0203E998 - 2 ; case 3
	.short _0203E9E0 - _0203E998 - 2 ; case 4
	.short _0203E9E0 - _0203E998 - 2 ; case 5
_0203E9A4:
	mov r3, #0x20
	str r3, [sp]
	mov r0, #0
	add r3, #0xec
	ldr r2, [r5, #0xc]
	add r1, r0, #0
	add r3, r5, r3
	bl sub_02090C94
	str r0, [r4, #0xc]
	ldrh r1, [r7]
	bl sub_02090D14
	b _0203EA12
_0203E9C0:
	mov r3, #0x20
	str r3, [sp]
	add r3, #0xec
	ldr r2, [r5, #0xc]
	mov r0, #1
	mov r1, #0
	add r3, r5, r3
	bl sub_02090C94
	str r0, [r4, #0xc]
	ldr r2, [sp, #0x20]
	ldrh r1, [r7]
	ldrh r2, [r2]
	bl sub_02090D18
	b _0203EA12
_0203E9E0:
	mov r3, #0x20
	str r3, [sp]
	add r3, #0xec
	ldr r2, [r5, #0xc]
	mov r0, #2
	mov r1, #0
	add r3, r5, r3
	bl sub_02090C94
	str r0, [r4, #0xc]
	bl sub_02090D40
	sub r1, r6, #2
	lsl r1, r1, #0x18
	ldr r0, [r5, #0xc]
	lsr r1, r1, #0x18
	bl sub_0202D660
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02090D20
	ldr r0, [r4, #0xc]
	bl sub_02090D34
_0203EA12:
	ldr r0, [sp, #4]
	ldr r1, _0203EA20 ; =sub_0203E878
	add r2, r4, #0
	bl sub_02050530
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0203EA20: .word sub_0203E878
	thumb_func_end sub_0203E960

	thumb_func_start sub_0203EA24
sub_0203EA24: ; 0x0203EA24
	ldr r3, _0203EA2C ; =SwitchToPokegearApp
	add r2, r1, #0
	ldr r1, _0203EA30 ; =0x020FA404
	bx r3
	.balign 4, 0
_0203EA2C: .word SwitchToPokegearApp
_0203EA30: .word 0x020FA404
	thumb_func_end sub_0203EA24

	thumb_func_start sub_0203EA34
sub_0203EA34: ; 0x0203EA34
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203EA58 ; =0x020FA3F4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203EA58: .word 0x020FA3F4
	thumb_func_end sub_0203EA34

	thumb_func_start SwitchToPokegearApp_Radio
SwitchToPokegearApp_Radio: ; 0x0203EA5C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203EA80 ; =0x020FA3E4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203EA80: .word 0x020FA3E4
	thumb_func_end SwitchToPokegearApp_Radio

	thumb_func_start sub_0203EA84
sub_0203EA84: ; 0x0203EA84
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x2c
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x2c
	bl MIi_CpuFill8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02092D80
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EA34
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203EA84

	thumb_func_start Radio_new
Radio_new: ; 0x0203EAB0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x2c
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x2c
	bl MIi_CpuFill8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02092D8C
	add r0, r5, #0
	add r1, r4, #0
	strb r6, [r4]
	bl SwitchToPokegearApp_Radio
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end Radio_new

	thumb_func_start sub_0203EAE0
sub_0203EAE0: ; 0x0203EAE0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203EB04 ; =0x020FA3D4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203EB04: .word 0x020FA3D4
	thumb_func_end sub_0203EAE0

	thumb_func_start sub_0203EB08
sub_0203EB08: ; 0x0203EB08
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x24
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x24
	add r4, r0, #0
	bl MIi_CpuFill8
	add r0, r5, #0
	bl sub_0203E344
	str r0, [r4]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EAE0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203EB08

	thumb_func_start sub_0203EB3C
sub_0203EB3C: ; 0x0203EB3C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203EB60 ; =0x020FA3C4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203EB60: .word 0x020FA3C4
	thumb_func_end sub_0203EB3C

	thumb_func_start sub_0203EB64
sub_0203EB64: ; 0x0203EB64
	push {r3, r4, r5, lr}
	mov r1, #0xb
	add r5, r0, #0
	bl ov02_0224E4EC
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EB3C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203EB64

	thumb_func_start sub_0203EB7C
sub_0203EB7C: ; 0x0203EB7C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203EBA0 ; =0x020FA3B4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203EBA0: .word 0x020FA3B4
	thumb_func_end sub_0203EB7C

	thumb_func_start sub_0203EBA4
sub_0203EBA4: ; 0x0203EBA4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x10
	add r6, r2, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x10
	add r4, r0, #0
	bl MIi_CpuFill8
	add r0, r5, #0
	bl sub_0203E344
	str r0, [r4, #0xc]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #8]
	add r0, r5, #0
	add r1, r4, #0
	strb r6, [r4, #2]
	bl sub_0203EB7C
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203EBA4

	thumb_func_start sub_0203EBDC
sub_0203EBDC: ; 0x0203EBDC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203EC00 ; =0x020FA3A4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203EC00: .word 0x020FA3A4
	thumb_func_end sub_0203EBDC

	thumb_func_start sub_0203EC04
sub_0203EC04: ; 0x0203EC04
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x10
	add r4, r0, #0
	bl MIi_CpuFill8
	add r0, r5, #0
	bl sub_0203E344
	str r0, [r4, #0xc]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #8]
	add r0, r5, #0
	add r1, r4, #0
	strb r6, [r4, #5]
	bl sub_0203EBDC
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203EC04

	thumb_func_start sub_0203EC3C
sub_0203EC3C: ; 0x0203EC3C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203EC60 ; =0x020FA394
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203EC60: .word 0x020FA394
	thumb_func_end sub_0203EC3C

	thumb_func_start sub_0203EC64
sub_0203EC64: ; 0x0203EC64
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MIi_CpuFill8
	add r0, r5, #0
	bl sub_0203E344
	str r0, [r4, #4]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EC3C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203EC64

	thumb_func_start sub_0203EC98
sub_0203EC98: ; 0x0203EC98
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203ECBC ; =0x020FA384
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203ECBC: .word 0x020FA384
	thumb_func_end sub_0203EC98

	thumb_func_start sub_0203ECC0
sub_0203ECC0: ; 0x0203ECC0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x10
	add r4, r0, #0
	bl MIi_CpuFill8
	add r0, r5, #0
	bl sub_0203E344
	str r0, [r4, #0xc]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #4]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	add r1, r4, #0
	str r0, [r4, #8]
	add r0, r5, #0
	bl sub_0203EC98
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203ECC0

	thumb_func_start sub_0203ECFC
sub_0203ECFC: ; 0x0203ECFC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203ED20 ; =0x020FA374
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203ED20: .word 0x020FA374
	thumb_func_end sub_0203ECFC

	thumb_func_start sub_0203ED24
sub_0203ED24: ; 0x0203ED24
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x1c
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x1c
	add r4, r0, #0
	bl MIi_CpuFill8
	add r0, r5, #0
	bl sub_0203E344
	str r0, [r4, #0x18]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x18]
	bl sub_0202CF54
	mov r1, #0
	bl sub_0202D18C
	str r0, [r4, #0x10]
	cmp r6, #1
	bne _0203ED72
	ldr r0, [r5, #0xc]
	bl sub_020503D0
	bl sub_02066A0C
	cmp r0, #0
	bne _0203ED72
	mov r0, #0
	strb r0, [r4]
	b _0203ED74
_0203ED72:
	strb r6, [r4]
_0203ED74:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203ECFC
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203ED24

	thumb_func_start sub_0203ED80
sub_0203ED80: ; 0x0203ED80
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x1c
	add r7, r2, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x1c
	add r4, r0, #0
	bl MIi_CpuFill8
	add r0, r5, #0
	bl sub_0203E344
	str r0, [r4, #0x18]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x18]
	bl sub_0202CF54
	mov r1, #0
	bl sub_0202D18C
	str r0, [r4, #0x10]
	mov r0, #3
	strb r0, [r4]
	str r6, [r4, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	str r7, [r4, #8]
	bl sub_0203ECFC
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0203ED80

	thumb_func_start sub_0203EDCC
sub_0203EDCC: ; 0x0203EDCC
	ldr r3, _0203EDD4 ; =SwitchToPokegearApp
	add r2, r1, #0
	ldr r1, _0203EDD8 ; =0x020FA364
	bx r3
	.balign 4, 0
_0203EDD4: .word SwitchToPokegearApp
_0203EDD8: .word 0x020FA364
	thumb_func_end sub_0203EDCC

	thumb_func_start sub_0203EDDC
sub_0203EDDC: ; 0x0203EDDC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x14
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x14
	bl MIi_CpuFill8
	str r6, [r4]
	ldr r0, [sp]
	str r7, [r4, #4]
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EDCC
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0203EDDC

	thumb_func_start sub_0203EE14
sub_0203EE14: ; 0x0203EE14
	ldr r3, _0203EE1C ; =SwitchToPokegearApp
	add r2, r1, #0
	ldr r1, _0203EE20 ; =0x020FA354
	bx r3
	.balign 4, 0
_0203EE1C: .word SwitchToPokegearApp
_0203EE20: .word 0x020FA354
	thumb_func_end sub_0203EE14

	thumb_func_start sub_0203EE24
sub_0203EE24: ; 0x0203EE24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203E344
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #8]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EE14
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203EE24

	thumb_func_start sub_0203EE54
sub_0203EE54: ; 0x0203EE54
	push {r4, lr}
	add r4, r0, #0
	bl sub_020503D0
	mov r1, #0xef
	bl sub_020503DC
	cmp r0, #0
	beq _0203EE8A
	add r0, r4, #0
	bl sub_020503D0
	mov r1, #0xf0
	bl sub_020503DC
	cmp r0, #0
	beq _0203EE8A
	add r0, r4, #0
	bl sub_020503D0
	mov r1, #0xf1
	bl sub_020503DC
	cmp r0, #0
	beq _0203EE8A
	mov r0, #1
	pop {r4, pc}
_0203EE8A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203EE54

	thumb_func_start sub_0203EE90
sub_0203EE90: ; 0x0203EE90
	ldr r3, _0203EE98 ; =SwitchToPokegearApp
	add r2, r1, #0
	ldr r1, _0203EE9C ; =0x020FA344
	bx r3
	.balign 4, 0
_0203EE98: .word SwitchToPokegearApp
_0203EE9C: .word 0x020FA344
	thumb_func_end sub_0203EE90

	thumb_func_start sub_0203EEA0
sub_0203EEA0: ; 0x0203EEA0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203E344
	add r6, r0, #0
	bl sub_02031968
	bl sub_02031974
	str r0, [r4]
	add r0, r6, #0
	bl sub_0203EE54
	str r0, [r4, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EE90
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203EEA0

	thumb_func_start sub_0203EED4
sub_0203EED4: ; 0x0203EED4
	ldr r3, _0203EEDC ; =SwitchToPokegearApp
	add r2, r1, #0
	ldr r1, _0203EEE0 ; =0x020FA314
	bx r3
	.balign 4, 0
_0203EEDC: .word SwitchToPokegearApp
_0203EEE0: .word 0x020FA314
	thumb_func_end sub_0203EED4

	thumb_func_start sub_0203EEE4
sub_0203EEE4: ; 0x0203EEE4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203E344
	add r6, r0, #0
	bl sub_02031968
	add r7, r0, #0
	add r0, r6, #0
	bl sub_0202A634
	str r0, [sp]
	str r0, [r4]
	add r0, r7, #0
	bl sub_02031978
	str r0, [r4, #4]
	ldr r0, [sp]
	bl sub_0202A55C
	str r0, [r4, #8]
	add r0, r6, #0
	bl sub_0203EE54
	str r0, [r4, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EED4
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203EEE4

	thumb_func_start sub_0203EF30
sub_0203EF30: ; 0x0203EF30
	ldr r3, _0203EF38 ; =SwitchToPokegearApp
	add r2, r1, #0
	ldr r1, _0203EF3C ; =0x020FA324
	bx r3
	.balign 4, 0
_0203EF38: .word SwitchToPokegearApp
_0203EF3C: .word 0x020FA324
	thumb_func_end sub_0203EF30

	thumb_func_start sub_0203EF40
sub_0203EF40: ; 0x0203EF40
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x14
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203E344
	add r6, r0, #0
	bl sub_02031968
	add r7, r0, #0
	bl sub_0203197C
	str r0, [r4]
	add r0, r7, #0
	bl sub_02031984
	str r0, [r4, #4]
	add r0, r6, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r4, #0xc]
	add r0, r6, #0
	bl sub_0203EE54
	str r0, [r4, #0x10]
	add r0, r7, #0
	bl sub_02031990
	str r0, [r4, #8]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EF30
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203EF40

	thumb_func_start sub_0203EF90
sub_0203EF90: ; 0x0203EF90
	ldr r3, _0203EF98 ; =SwitchToPokegearApp
	add r2, r1, #0
	ldr r1, _0203EF9C ; =0x020FA424
	bx r3
	.balign 4, 0
_0203EF98: .word SwitchToPokegearApp
_0203EF9C: .word 0x020FA424
	thumb_func_end sub_0203EF90

	thumb_func_start sub_0203EFA0
sub_0203EFA0: ; 0x0203EFA0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #3
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203E344
	add r7, r0, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r6, r0, #0
	add r0, r7, #0
	bl sub_02031968
	str r0, [r4]
	add r0, r5, #0
	add r1, r4, #0
	str r6, [r4, #4]
	bl sub_0203EF90
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203EFA0

	thumb_func_start sub_0203EFD4
sub_0203EFD4: ; 0x0203EFD4
	add r2, r1, #0
	mov r1, #0x43
	lsl r1, r1, #2
	add r1, r0, r1
	str r1, [r2, #0x1c]
	ldr r3, _0203EFE4 ; =SwitchToPokegearApp
	ldr r1, _0203EFE8 ; =0x020FA434
	bx r3
	.balign 4, 0
_0203EFE4: .word SwitchToPokegearApp
_0203EFE8: .word 0x020FA434
	thumb_func_end sub_0203EFD4

	thumb_func_start sub_0203EFEC
sub_0203EFEC: ; 0x0203EFEC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0203E344
	mov r1, #0xb
	str r1, [sp]
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_02090E68
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EFD4
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203EFEC

	thumb_func_start sub_0203F018
sub_0203F018: ; 0x0203F018
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	cmp r5, #3
	bne _0203F034
	bl sub_0203E344
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02090F38
	b _0203F042
_0203F034:
	bl sub_0203E344
	add r1, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_02090EC0
_0203F042:
	add r4, r0, #0
	add r0, r7, #0
	add r1, r4, #0
	bl sub_0203EFD4
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0203F018

	thumb_func_start sub_0203F050
sub_0203F050: ; 0x0203F050
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r2, #0
	add r5, r0, #0
	bl sub_0203E344
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02090F00
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EFD4
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203F050

	thumb_func_start sub_0203F074
sub_0203F074: ; 0x0203F074
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0xc
	bl AllocFromHeap
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203E344
	str r0, [r4]
	mov r0, #0x43
	lsl r0, r0, #2
	str r5, [r4, #4]
	add r0, r5, r0
	str r0, [r4, #8]
	ldr r1, _0203F0A4 ; =0x020FA2F4
	add r0, r5, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0203F0A4: .word 0x020FA2F4
	thumb_func_end sub_0203F074

	thumb_func_start sub_0203F0A8
sub_0203F0A8: ; 0x0203F0A8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203F0CC ; =0x020FA2E4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203F0CC: .word 0x020FA2E4
	thumb_func_end sub_0203F0A8

	thumb_func_start sub_0203F0D0
sub_0203F0D0: ; 0x0203F0D0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #0x24
	add r4, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x24
	add r5, r0, #0
	bl memset
	add r0, r6, #0
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	str r0, [r5]
	add r0, r6, #0
	bl sub_0202C028
	str r0, [sp]
	mov r1, #0
	bl sub_0202B9B8
	add r4, r0, #0
	ldr r0, [sp]
	bl sub_0202B9E0
	str r4, [r5, #4]
	str r0, [r5, #8]
	add r0, r6, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r5, #0xc]
	add r0, r6, #0
	bl sub_0202CF54
	str r0, [r5, #0x10]
	add r0, r6, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r5, #0x14]
	ldr r0, [sp, #0x18]
	str r7, [r5, #0x18]
	str r0, [r5, #0x1c]
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203F0D0

	thumb_func_start sub_0203F134
sub_0203F134: ; 0x0203F134
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _0203F152
	cmp r0, #1
	beq _0203F162
	b _0203F192
_0203F152:
	ldr r1, [r5, #0xc]
	add r0, r4, #0
	bl sub_0203F1E8
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0203F192
_0203F162:
	add r0, r4, #0
	bl sub_020505A0
	cmp r0, #0
	bne _0203F192
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _0203F182
	ldr r0, [r5, #8]
	cmp r0, #1
	bne _0203F17E
	mov r0, #1
	strh r0, [r1]
	b _0203F182
_0203F17E:
	mov r0, #0
	strh r0, [r1]
_0203F182:
	ldr r0, [r5, #0xc]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_0203F192:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203F134

	thumb_func_start sub_0203F198
sub_0203F198: ; 0x0203F198
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #0x20
	mov r1, #0x10
	add r7, r2, #0
	str r3, [sp, #4]
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x10
	mov r0, #0
_0203F1B4:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0203F1B4
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	add r3, r4, #0
	add r1, r7, #0
	str r0, [sp]
	ldr r2, [sp, #4]
	mov r0, #0x20
	add r3, #8
	bl sub_0203F0D0
	str r0, [r4, #0xc]
	ldr r1, _0203F1E4 ; =sub_0203F134
	add r0, r6, #0
	add r2, r4, #0
	str r5, [r4, #4]
	bl sub_02050530
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203F1E4: .word sub_0203F134
	thumb_func_end sub_0203F198

	thumb_func_start sub_0203F1E8
sub_0203F1E8: ; 0x0203F1E8
	push {r3, lr}
	add r2, r1, #0
	mov r1, #0x43
	lsl r1, r1, #2
	add r1, r0, r1
	str r1, [r2, #0x20]
	ldr r1, _0203F200 ; =0x0210F9AC
	bl SwitchToPokegearApp
	mov r0, #1
	pop {r3, pc}
	nop
_0203F200: .word 0x0210F9AC
	thumb_func_end sub_0203F1E8

	thumb_func_start sub_0203F204
sub_0203F204: ; 0x0203F204
	push {r3, lr}
	add r2, r1, #0
	ldr r1, _0203F214 ; =0x0210F99C
	bl SwitchToPokegearApp
	mov r0, #1
	pop {r3, pc}
	nop
_0203F214: .word 0x0210F99C
	thumb_func_end sub_0203F204

	thumb_func_start sub_0203F218
sub_0203F218: ; 0x0203F218
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r5, #4]
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r5, #8]
	ldr r0, [r4, #0xc]
	mov r1, #8
	bl SavArray_get
	str r0, [r5, #0xc]
	ldr r0, [r4, #0xc]
	bl sub_0202CA44
	str r0, [r5, #0x14]
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r5, #0x18]
	ldr r0, [r4, #0xc]
	bl sub_0202A634
	str r0, [r5, #0x20]
	ldr r0, [r4, #0xc]
	bl sub_02074910
	str r0, [r5, #0x2c]
	ldr r0, [r4, #0xc]
	str r0, [r5, #0x10]
	ldr r0, [r4, #0xc]
	bl sub_0202CF54
	str r0, [r5, #0x1c]
	bl sub_02028ECC
	add r1, r0, #0
	mov r0, #0x20
	bl AllocFromHeap
	str r0, [r5, #0x34]
	bl sub_02070D90
	add r1, r0, #0
	mov r0, #0x20
	bl AllocFromHeap
	str r0, [r5, #0x38]
	bl sub_02070D90
	add r1, r0, #0
	mov r0, #0x20
	bl AllocFromHeap
	str r0, [r5, #0x3c]
	str r4, [r5]
	mov r0, #0
	str r0, [r5, #0x30]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203F218

	thumb_func_start sub_0203F298
sub_0203F298: ; 0x0203F298
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _0203F2AA
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x34]
_0203F2AA:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0203F2B8
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x38]
_0203F2B8:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _0203F2C6
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x3c]
_0203F2C6:
	pop {r4, pc}
	thumb_func_end sub_0203F298

	thumb_func_start sub_0203F2C8
sub_0203F2C8: ; 0x0203F2C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r6, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #7
	bls _0203F2E4
	b _0203F49A
_0203F2E4:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0203F2F0: ; jump table
	.short _0203F300 - _0203F2F0 - 2 ; case 0
	.short _0203F316 - _0203F2F0 - 2 ; case 1
	.short _0203F324 - _0203F2F0 - 2 ; case 2
	.short _0203F336 - _0203F2F0 - 2 ; case 3
	.short _0203F354 - _0203F2F0 - 2 ; case 4
	.short _0203F3C2 - _0203F2F0 - 2 ; case 5
	.short _0203F446 - _0203F2F0 - 2 ; case 6
	.short _0203F472 - _0203F2F0 - 2 ; case 7
_0203F300:
	bl sub_02039998
	cmp r0, #0
	bne _0203F30E
	add r0, r6, #0
	bl sub_0205525C
_0203F30E:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0203F49A
_0203F316:
	add r0, r4, #4
	add r1, r5, #0
	bl sub_0203F218
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0203F324:
	ldr r1, _0203F4A0 ; =0x0210F98C
	add r0, r6, #0
	add r2, r4, #4
	bl sub_02050624
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0203F49A
_0203F336:
	ldr r1, [r4, #0x28]
	cmp r1, #0
	bne _0203F34E
	add r0, r4, #4
	bl sub_0203F298
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x2c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0203F34E:
	add r0, r0, #1
	str r0, [r4]
	b _0203F49A
_0203F354:
	ldr r0, [r4, #0x38]
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x3c]
	bl sub_02070DB0
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x40]
	bl sub_02070DB0
	str r0, [r4, #0x48]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0x58]
	mov r0, #1
	str r0, [r4, #0x54]
	add r0, r5, #0
	bl sub_020555E0
	cmp r0, #4
	bhi _0203F394
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203F38A: ; jump table
	.short _0203F394 - _0203F38A - 2 ; case 0
	.short _0203F394 - _0203F38A - 2 ; case 1
	.short _0203F39A - _0203F38A - 2 ; case 2
	.short _0203F3A0 - _0203F38A - 2 ; case 3
	.short _0203F3A0 - _0203F38A - 2 ; case 4
_0203F394:
	mov r0, #0
	str r0, [r4, #0x50]
	b _0203F3A4
_0203F39A:
	mov r0, #1
	str r0, [r4, #0x50]
	b _0203F3A4
_0203F3A0:
	mov r0, #2
	str r0, [r4, #0x50]
_0203F3A4:
	bl sub_02039998
	cmp r0, #0
	beq _0203F3B0
	mov r0, #3
	str r0, [r4, #0x50]
_0203F3B0:
	add r2, r4, #0
	ldr r1, _0203F4A4 ; =0x020FA2D4
	add r0, r6, #0
	add r2, #0x44
	bl sub_02050624
	mov r0, #5
	str r0, [r4]
	b _0203F49A
_0203F3C2:
	ldr r0, [r4, #0x40]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r3, r0, #0
	add r0, sp, #0x28
	str r0, [sp]
	lsl r3, r3, #0x10
	ldr r1, [r4, #0x40]
	mov r0, #0
	mov r2, #1
	lsr r3, r3, #0x10
	bl sub_02070E34
	str r0, [sp, #0x1c]
	cmp r0, #0
	beq _0203F440
	mov r0, #3
	mov r1, #0x1a
	lsl r2, r0, #0x10
	bl sub_0201A910
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [sp, #0x20]
	ldr r0, [r5, #0xc]
	bl sub_02088288
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0202A634
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0207879C
	str r0, [sp, #0x24]
	ldr r0, [r5, #0xc]
	bl sub_0202CF54
	str r6, [sp]
	ldr r1, [sp, #0x24]
	str r7, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x1c]
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #0x14]
	mov r0, #0x1a
	str r0, [sp, #0x18]
	ldr r1, [r4, #0x40]
	ldr r3, [sp, #0x20]
	mov r0, #0
	bl sub_02075A7C
	str r0, [r4, #0x5c]
	mov r0, #6
	str r0, [r4]
	b _0203F49A
_0203F440:
	mov r0, #7
	str r0, [r4]
	b _0203F49A
_0203F446:
	ldr r0, [r4, #0x5c]
	bl sub_02075D3C
	cmp r0, #0
	beq _0203F49A
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x2c]
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0207188C
	ldr r0, [r4, #0x5c]
	bl sub_02075D4C
	mov r0, #0x1a
	bl sub_0201A9C4
	mov r0, #7
	str r0, [r4]
	b _0203F49A
_0203F472:
	ldr r0, [r4, #0x34]
	add r0, r0, #1
	str r0, [r4, #0x34]
	mov r0, #2
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl sub_0202CF54
	mov r1, #0x10
	add r4, r0, #0
	bl sub_0202D1C0
	bl sub_02039998
	cmp r0, #0
	beq _0203F49A
	add r0, r4, #0
	mov r1, #0x72
	bl sub_0202D0FC
_0203F49A:
	mov r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0203F4A0: .word 0x0210F98C
_0203F4A4: .word 0x020FA2D4
	thumb_func_end sub_0203F2C8

	thumb_func_start sub_0203F4A8
sub_0203F4A8: ; 0x0203F4A8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x20
	mov r1, #0x64
	bl AllocFromHeap
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	ldr r1, _0203F4C4 ; =sub_0203F2C8
	add r0, r4, #0
	bl sub_02050530
	pop {r4, pc}
	.balign 4, 0
_0203F4C4: .word sub_0203F2C8
	thumb_func_end sub_0203F4A8

	thumb_func_start sub_0203F4C8
sub_0203F4C8: ; 0x0203F4C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x20
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	ldr r1, _0203F4F4 ; =0x020FA2C4
	add r0, r5, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	pop {r3, r4, r5, pc}
	nop
_0203F4F4: .word 0x020FA2C4
	thumb_func_end sub_0203F4C8

	thumb_func_start sub_0203F4F8
sub_0203F4F8: ; 0x0203F4F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x14
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	str r0, [r4]
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl sub_0202CF54
	str r0, [r4, #0xc]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #0x10]
	ldr r1, _0203F538 ; =0x020FA2B4
	add r0, r5, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203F538: .word 0x020FA2B4
	thumb_func_end sub_0203F4F8

	thumb_func_start sub_0203F53C
sub_0203F53C: ; 0x0203F53C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r0, r2, #0
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MIi_CpuFill8
	mov r0, #0x43
	lsl r0, r0, #2
	str r6, [r4]
	add r0, r5, r0
	str r0, [r4, #4]
	ldr r1, _0203F56C ; =0x020FA2A4
	add r0, r5, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203F56C: .word 0x020FA2A4
	thumb_func_end sub_0203F53C

	thumb_func_start sub_0203F570
sub_0203F570: ; 0x0203F570
	ldr r3, _0203F578 ; =SwitchToPokegearApp
	ldr r1, _0203F57C ; =0x02102830
	add r2, r0, #0
	bx r3
	.balign 4, 0
_0203F578: .word SwitchToPokegearApp
_0203F57C: .word 0x02102830
	thumb_func_end sub_0203F570

	thumb_func_start sub_0203F580
sub_0203F580: ; 0x0203F580
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #3
	bhi _0203F648
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203F5A4: ; jump table
	.short _0203F5AC - _0203F5A4 - 2 ; case 0
	.short _0203F5BA - _0203F5A4 - 2 ; case 1
	.short _0203F5CC - _0203F5A4 - 2 ; case 2
	.short _0203F5DA - _0203F5A4 - 2 ; case 3
_0203F5AC:
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0203F648
_0203F5BA:
	ldr r1, _0203F64C ; =0x02102610
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	bl sub_02050624
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0203F648
_0203F5CC:
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0203F648
_0203F5DA:
	ldr r1, [r4, #0xc]
	ldr r0, [r1]
	cmp r0, #1
	bne _0203F5F6
	ldr r0, [r1, #0x18]
	ldr r1, [r4, #0x10]
	bl StringCompare
	cmp r0, #0
	bne _0203F618
	ldr r0, [r4, #0xc]
	mov r1, #1
	str r1, [r0, #0x14]
	b _0203F618
_0203F5F6:
	cmp r0, #5
	bne _0203F618
	ldr r0, [r1, #0x18]
	bl String_c_str
	add r7, r0, #0
	ldr r0, [r6, #0xc]
	bl sub_0202C854
	add r1, r7, #0
	bl sub_0202C88C
	cmp r0, #0
	beq _0203F618
	ldr r0, [r4, #0xc]
	mov r1, #2
	str r1, [r0, #0x14]
_0203F618:
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0203F626
	add r0, r5, #0
	bl sub_0203F650
_0203F626:
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0203F632
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x14]
	strh r0, [r1]
_0203F632:
	ldr r0, [r4, #0xc]
	bl sub_0208311C
	ldr r0, [r4, #0x10]
	bl String_dtor
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0203F648:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203F64C: .word 0x02102610
	thumb_func_end sub_0203F580

	thumb_func_start sub_0203F650
sub_0203F650: ; 0x0203F650
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r0, [r0]
	cmp r0, #5
	bhi _0203F6DC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203F676: ; jump table
	.short _0203F682 - _0203F676 - 2 ; case 0
	.short _0203F6A2 - _0203F676 - 2 ; case 1
	.short _0203F6DC - _0203F676 - 2 ; case 2
	.short _0203F692 - _0203F676 - 2 ; case 3
	.short _0203F6DC - _0203F676 - 2 ; case 4
	.short _0203F6CA - _0203F676 - 2 ; case 5
_0203F682:
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	ldr r1, [r4, #0xc]
	add r1, #0x1c
	bl sub_02028F24
	pop {r4, r5, r6, pc}
_0203F692:
	ldr r0, [r5, #0xc]
	bl sub_0202A954
	ldr r1, [r4, #0xc]
	ldr r1, [r1, #0x18]
	bl sub_0202A9B0
	pop {r4, r5, r6, pc}
_0203F6A2:
	ldr r6, [r4, #4]
	cmp r6, #0xff
	bne _0203F6B2
	add r0, r5, #0
	bl sub_0206DB28
	ldr r0, [r0, #0x10]
	b _0203F6BE
_0203F6B2:
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
_0203F6BE:
	ldr r2, [r4, #0xc]
	mov r1, #0x76
	add r2, #0x1c
	bl sub_0206EC40
	pop {r4, r5, r6, pc}
_0203F6CA:
	ldr r0, [r5, #0xc]
	bl sub_0202C854
	ldr r3, [r4, #0xc]
	mov r1, #0
	ldr r3, [r3, #0x18]
	add r2, r1, #0
	bl sub_0202C7F8
_0203F6DC:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203F650

	thumb_func_start sub_0203F6E0
sub_0203F6E0: ; 0x0203F6E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #8]
	add r7, r1, #0
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r5, [sp, #0x2c]
	bl sub_0205064C
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #0x14
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r0, #0
	str r0, [r4]
	ldr r0, [sp, #0x28]
	str r0, [r4, #4]
	ldr r0, [sp, #0x30]
	str r0, [r4, #8]
	ldr r0, [r6, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [sp]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r6, r0
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	mov r0, #0xb
	add r1, r7, #0
	bl sub_020830D8
	str r0, [r4, #0xc]
	mov r0, #0xc
	mov r1, #0xb
	bl String_ctor
	str r0, [r4, #0x10]
	cmp r7, #1
	beq _0203F73C
	cmp r7, #5
	beq _0203F784
	b _0203F78E
_0203F73C:
	ldr r0, [sp, #0x28]
	cmp r0, #0xff
	bne _0203F74C
	add r0, r6, #0
	bl sub_0206DB28
	ldr r6, [r0, #0x10]
	b _0203F75A
_0203F74C:
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	ldr r1, [r4, #4]
	bl GetPartyMonByIndex
	add r6, r0, #0
_0203F75A:
	add r0, r6, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	ldr r1, [r4, #0xc]
	mov r2, #0
	str r0, [r1, #0x10]
	add r0, r6, #0
	mov r1, #0x70
	bl GetMonData
	ldr r1, [r4, #0xc]
	cmp r5, #0
	str r0, [r1, #8]
	beq _0203F79C
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl CopyU16ArrayToString
	b _0203F79C
_0203F784:
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl CopyU16ArrayToString
	b _0203F79C
_0203F78E:
	cmp r5, #0
	beq _0203F79C
	ldr r0, [r4, #0xc]
	add r1, r5, #0
	ldr r0, [r0, #0x18]
	bl CopyU16ArrayToString
_0203F79C:
	ldr r0, [sp, #8]
	ldr r1, _0203F7AC ; =sub_0203F580
	add r2, r4, #0
	bl sub_02050530
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0203F7AC: .word sub_0203F580
	thumb_func_end sub_0203F6E0

	thumb_func_start sub_0203F7B0
sub_0203F7B0: ; 0x0203F7B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x43
	lsl r0, r0, #2
	add r4, r1, #0
	add r1, r5, r0
	ldr r0, _0203F7E8 ; =0x0000066C
	str r1, [r4, r0]
	ldr r1, [r5, #0xc]
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r5, #0xc]
	bl sub_020503D0
	bl sub_02066614
	ldr r1, _0203F7EC ; =0x00000678
	mov r2, #0
	str r0, [r4, r1]
	sub r0, r1, #4
	str r2, [r4, r0]
	ldr r1, _0203F7F0 ; =0x020FA294
	add r0, r5, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	pop {r3, r4, r5, pc}
	nop
_0203F7E8: .word 0x0000066C
_0203F7EC: .word 0x00000678
_0203F7F0: .word 0x020FA294
	thumb_func_end sub_0203F7B0

	thumb_func_start sub_0203F7F4
sub_0203F7F4: ; 0x0203F7F4
	push {r3, lr}
	add r2, r1, #0
	ldr r1, _0203F804 ; =0x020FA284
	bl SwitchToPokegearApp
	mov r0, #1
	pop {r3, pc}
	nop
_0203F804: .word 0x020FA284
	thumb_func_end sub_0203F7F4

	thumb_func_start sub_0203F808
sub_0203F808: ; 0x0203F808
	ldr r3, _0203F810 ; =SwitchToPokegearApp
	add r2, r1, #0
	ldr r1, _0203F814 ; =0x020FA274
	bx r3
	.balign 4, 0
_0203F810: .word SwitchToPokegearApp
_0203F814: .word 0x020FA274
	thumb_func_end sub_0203F808

	thumb_func_start sub_0203F818
sub_0203F818: ; 0x0203F818
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0202C9D8
	ldr r5, _0203F840 ; =0x020FA254
	add r3, sp, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r1, r2, #0
	ldr r2, [r4, #0xc]
	add r0, r4, #0
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203F840: .word 0x020FA254
	thumb_func_end sub_0203F818

	thumb_func_start sub_0203F844
sub_0203F844: ; 0x0203F844
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r3, _0203F8E8 ; =0x020FA264
	add r2, sp, #0
	add r5, r0, #0
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0xb
	mov r1, #0x40
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0202DB34
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_SysInfo_get
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	bl SavArray_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl sub_020270D8
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	bl sub_0202A634
	str r0, [r4, #0x10]
	ldr r0, [r5, #0xc]
	bl sub_0202C6F4
	str r0, [r4, #0x14]
	ldr r0, [r5, #0xc]
	bl sub_0202CA44
	str r0, [r4, #0x18]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0x24]
	ldr r0, [r5, #0xc]
	bl sub_0202CF54
	str r0, [r4, #0x28]
	ldr r0, [r5, #0xc]
	bl sub_02088288
	str r0, [r4, #0x38]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0x20]
	ldr r0, [r5, #0xc]
	bl sub_02074910
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x14]
	bl sub_0203A040
	str r0, [r4, #0x34]
	ldr r0, [r5, #0xc]
	bl sub_0207879C
	str r0, [r4, #0x2c]
	add r0, r5, #0
	add r1, sp, #0
	add r2, r4, #0
	str r6, [r4, #0x3c]
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203F8E8: .word 0x020FA264
	thumb_func_end sub_0203F844

	thumb_func_start sub_0203F8EC
sub_0203F8EC: ; 0x0203F8EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r3, _0203F960 ; =0x020FA334
	add r7, r2, #0
	add r2, sp, #0
	add r5, r0, #0
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0xb
	mov r1, #0x28
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0202D918
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl sub_0202D928
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_SysInfo_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0x10]
	ldr r0, [r5, #0xc]
	bl sub_0202C6F4
	bl sub_0202C08C
	str r0, [r4, #0x14]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	bl sub_0202C6F4
	bl sub_0203A040
	str r0, [r4, #0x1c]
	str r6, [r4, #0x18]
	str r7, [r4, #0x24]
	mov r0, #1
	str r0, [r4, #0x20]
	add r0, r5, #0
	add r1, sp, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203F960: .word 0x020FA334
	thumb_func_end sub_0203F8EC

	thumb_func_start sub_0203F964
sub_0203F964: ; 0x0203F964
	ldr r3, _0203F96C ; =SwitchToPokegearApp
	ldr r1, _0203F970 ; =0x020FA224
	ldr r2, [r0, #0xc]
	bx r3
	.balign 4, 0
_0203F96C: .word SwitchToPokegearApp
_0203F970: .word 0x020FA224
	thumb_func_end sub_0203F964

	thumb_func_start sub_0203F974
sub_0203F974: ; 0x0203F974
	ldr r3, _0203F97C ; =SwitchToPokegearApp
	add r2, r1, #0
	ldr r1, _0203F980 ; =0x020FA214
	bx r3
	.balign 4, 0
_0203F97C: .word SwitchToPokegearApp
_0203F980: .word 0x020FA214
	thumb_func_end sub_0203F974

	thumb_func_start sub_0203F984
sub_0203F984: ; 0x0203F984
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r1, #0xb
	add r2, sp, #0
	bl LoadHallOfFame
	ldr r1, [sp]
	add r4, r0, #0
	cmp r1, #2
	bne _0203F9A2
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203F9A2:
	ldr r1, _0203F9B0 ; =0x020FA204
	add r0, r5, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203F9B0: .word 0x020FA204
	thumb_func_end sub_0203F984

	thumb_func_start sub_0203F9B4
sub_0203F9B4: ; 0x0203F9B4
	ldr r3, _0203F9BC ; =SwitchToPokegearApp
	add r2, r1, #0
	ldr r1, _0203F9C0 ; =0x020FA1F4
	bx r3
	.balign 4, 0
_0203F9BC: .word SwitchToPokegearApp
_0203F9C0: .word 0x020FA1F4
	thumb_func_end sub_0203F9B4

	thumb_func_start sub_0203F9C4
sub_0203F9C4: ; 0x0203F9C4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r6, _0203F9F0 ; =0x020FA1E4
	add r5, sp, #0
	add r3, r0, #0
	add r2, r1, #0
	add r4, r5, #0
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r3, r0
	str r0, [r2, #0xc]
	add r0, r3, #0
	add r1, r4, #0
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203F9F0: .word 0x020FA1E4
	thumb_func_end sub_0203F9C4

	thumb_func_start sub_0203F9F4
sub_0203F9F4: ; 0x0203F9F4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	bl sub_0206CE44
	add r5, r0, #0
	bne _0203FA0C
	bl GF_AssertFail
_0203FA0C:
	str r5, [sp]
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #8]
	ldr r1, [r4, #0x20]
	add r0, r4, #0
	ldr r1, [r1]
	bl sub_02054F60
	add r1, sp, #0
	strh r0, [r1, #0xc]
	ldr r0, [r4, #0x10]
	add r1, sp, #0
	bl sub_02091240
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203F9F4

	thumb_func_start sub_0203FA38
sub_0203FA38: ; 0x0203FA38
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x14
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x14
	add r4, r0, #0
	bl MIi_CpuFill8
	add r0, r5, #0
	bl sub_0203E344
	add r6, r0, #0
	bl sub_02028EB4
	str r0, [r4, #4]
	add r0, r6, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #8]
	add r0, r6, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	ldr r1, _0203FA88 ; =0x020FA234
	str r0, [r4, #0x10]
	add r0, r5, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_0203FA88: .word 0x020FA234
	thumb_func_end sub_0203FA38

	thumb_func_start sub_0203FA8C
sub_0203FA8C: ; 0x0203FA8C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #8
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	str r6, [r4, #4]
	ldr r0, [r5, #0xc]
	ldr r1, _0203FAB0 ; =0x020FA304
	str r0, [r4]
	add r0, r5, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203FAB0: .word 0x020FA304
	thumb_func_end sub_0203FA8C

	thumb_func_start sub_0203FAB4
sub_0203FAB4: ; 0x0203FAB4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	ldr r0, [sp, #0x18]
	mov r1, #8
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	add r4, r0, #0
	strb r6, [r4, #4]
	strb r7, [r4, #5]
	ldr r0, [sp]
	ldr r1, _0203FAE4 ; =0x0210F9BC
	strh r0, [r4, #6]
	ldr r0, [r5, #0xc]
	add r2, r4, #0
	str r0, [r4]
	add r0, r5, #0
	bl SwitchToPokegearApp
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203FAE4: .word 0x0210F9BC
	thumb_func_end sub_0203FAB4

	thumb_func_start sub_0203FAE8
sub_0203FAE8: ; 0x0203FAE8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x44
	add r6, r2, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl memset
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl sub_0207879C
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	bl sub_020270C4
	str r0, [r4, #0x10]
	mov r0, #0
	add r1, r4, #0
	str r0, [r4, #0x18]
	add r1, #0x25
	strb r0, [r1]
	add r1, r4, #0
	mov r2, #5
	add r1, #0x24
	strb r2, [r1]
	add r1, r4, #0
	strh r6, [r4, #0x28]
	add r1, #0x26
	strb r0, [r1]
	mov r0, #0x43
	lsl r0, r0, #2
	str r5, [r4, #0x1c]
	add r0, r5, r0
	str r0, [r4, #0x20]
	ldr r1, _0203FB5C ; =0x0210159C
	add r0, r5, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_0203FB5C: .word 0x0210159C
	thumb_func_end sub_0203FAE8

	thumb_func_start sub_0203FB60
sub_0203FB60: ; 0x0203FB60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x18
	mov r0, #0
_0203FB74:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0203FB74
	ldr r0, [r5, #0xc]
	ldr r1, _0203FB90 ; =0x0210F97C
	str r0, [r4]
	add r0, r5, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0203FB90: .word 0x0210F97C
	thumb_func_end sub_0203FB60

	thumb_func_start sub_0203FB94
sub_0203FB94: ; 0x0203FB94
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r0, #0xb
	mov r1, #0x3c
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #0x11]
	strb r6, [r4, #0x14]
	ldr r0, [r4]
	bl GetPartyCount
	strb r0, [r4, #0x13]
	mov r0, #0
	strh r0, [r4, #0x18]
	strb r0, [r4, #0x12]
	ldr r0, [r5, #0xc]
	bl sub_0202D95C
	str r0, [r4, #0x20]
	ldr r0, [r5, #0xc]
	bl sub_02074910
	str r0, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x2c]
	str r0, [r4, #0x28]
	ldr r0, [r5, #0xc]
	bl sub_0208828C
	str r0, [r4, #0x34]
	ldr r1, _0203FC0C ; =0x020FA0B0
	add r0, r4, #0
	bl sub_02089D40
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0208AD34
	ldr r1, _0203FC10 ; =0x02103A1C
	add r0, r5, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_0203FC0C: .word 0x020FA0B0
_0203FC10: .word 0x02103A1C
	thumb_func_end sub_0203FB94

	thumb_func_start sub_0203FC14
sub_0203FC14: ; 0x0203FC14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r3, _0203FC54 ; =0x020FA1C4
	add r7, r2, #0
	add r2, sp, #0
	add r5, r0, #0
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x10
	bl MIi_CpuFill8
	str r5, [r4]
	ldr r0, [r5, #0xc]
	add r1, sp, #0
	str r0, [r4, #4]
	str r6, [r4, #8]
	add r0, r5, #0
	add r2, r4, #0
	strb r7, [r4, #0xc]
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203FC54: .word 0x020FA1C4
	thumb_func_end sub_0203FC14

	thumb_func_start sub_0203FC58
sub_0203FC58: ; 0x0203FC58
	ldr r3, _0203FC60 ; =SwitchToPokegearApp
	add r2, r1, #0
	ldr r1, _0203FC64 ; =0x020FA244
	bx r3
	.balign 4, 0
_0203FC60: .word SwitchToPokegearApp
_0203FC64: .word 0x020FA244
	thumb_func_end sub_0203FC58

	thumb_func_start sub_0203FC68
sub_0203FC68: ; 0x0203FC68
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203FC8C ; =0x020FA454
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203FC8C: .word 0x020FA454
	thumb_func_end sub_0203FC68

	thumb_func_start sub_0203FC90
sub_0203FC90: ; 0x0203FC90
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203FCB4 ; =0x020FA1D4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl SwitchToPokegearApp
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203FCB4: .word 0x020FA1D4
	thumb_func_end sub_0203FC90

	thumb_func_start sub_0203FCB8
sub_0203FCB8: ; 0x0203FCB8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	ldr r0, [sp, #0x18]
	mov r1, #0x50
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x50
	add r4, r0, #0
	bl memset
	add r0, r6, #0
	bl sub_0203E344
	str r0, [r4]
	add r3, r4, #4
	mov r2, #9
_0203FCE0:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0203FCE0
	add r0, r4, #0
	add r0, #0x4c
	strh r7, [r0]
	add r1, r4, #0
	ldr r0, [sp]
	add r1, #0x4e
	strh r0, [r1]
	ldr r1, _0203FD04 ; =0x020FA474
	add r0, r6, #0
	add r2, r4, #0
	bl SwitchToPokegearApp
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203FD04: .word 0x020FA474
	thumb_func_end sub_0203FCB8

	thumb_func_start sub_0203FD08
sub_0203FD08: ; 0x0203FD08
	ldr r3, _0203FD10 ; =SwitchToPokegearApp
	add r2, r1, #0
	ldr r1, _0203FD14 ; =0x020FA494
	bx r3
	.balign 4, 0
_0203FD10: .word SwitchToPokegearApp
_0203FD14: .word 0x020FA494
	thumb_func_end sub_0203FD08

	thumb_func_start sub_0203FD18
sub_0203FD18: ; 0x0203FD18
	push {r3, r4}
	mov r3, #0
	strb r3, [r0, #1]
	str r3, [r0, #8]
	strb r3, [r0]
	strb r3, [r0, #3]
	str r3, [r0, #4]
	str r1, [r0, #0x5c]
	str r2, [r0, #0x60]
	add r1, r0, #0
	add r4, r3, #0
_0203FD2E:
	add r3, r3, #1
	str r4, [r1, #0x64]
	add r1, r1, #4
	cmp r3, #4
	blo _0203FD2E
	add r2, r0, #0
	mov r1, #0
_0203FD3C:
	add r4, r4, #1
	str r1, [r2, #0xc]
	add r2, r2, #4
	cmp r4, #0x14
	blo _0203FD3C
	str r1, [r0, #0x74]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_0203FD18

	thumb_func_start sub_0203FD4C
sub_0203FD4C: ; 0x0203FD4C
	str r1, [r0, #8]
	mov r1, #1
	strb r1, [r0, #1]
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203FD4C

	thumb_func_start sub_0203FD58
sub_0203FD58: ; 0x0203FD58
	mov r2, #2
	strb r2, [r0, #1]
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_0203FD58

	thumb_func_start sub_0203FD60
sub_0203FD60: ; 0x0203FD60
	mov r1, #0
	strb r1, [r0, #1]
	str r1, [r0, #8]
	bx lr
	thumb_func_end sub_0203FD60

	thumb_func_start sub_0203FD68
sub_0203FD68: ; 0x0203FD68
	str r1, [r0, #0x74]
	bx lr
	thumb_func_end sub_0203FD68

	thumb_func_start sub_0203FD6C
sub_0203FD6C: ; 0x0203FD6C
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #1]
	cmp r1, #0
	bne _0203FD7A
	mov r0, #0
	pop {r4, pc}
_0203FD7A:
	beq _0203FD86
	cmp r1, #1
	beq _0203FDA2
	cmp r1, #2
	beq _0203FD8A
	b _0203FDD4
_0203FD86:
	mov r0, #0
	pop {r4, pc}
_0203FD8A:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _0203FD9E
	blx r1
	cmp r0, #1
	bne _0203FD9A
	mov r0, #1
	strb r0, [r4, #1]
_0203FD9A:
	mov r0, #1
	pop {r4, pc}
_0203FD9E:
	mov r0, #1
	strb r0, [r4, #1]
_0203FDA2:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0203FDAE
	mov r0, #0
	strb r0, [r4, #1]
	pop {r4, pc}
_0203FDAE:
	add r0, r4, #0
	bl sub_0203FE2C
	add r1, r0, #0
	ldr r0, [r4, #0x60]
	cmp r1, r0
	blo _0203FDC6
	bl GF_AssertFail
	mov r0, #0
	strb r0, [r4, #1]
	pop {r4, pc}
_0203FDC6:
	ldr r2, [r4, #0x5c]
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	add r0, r4, #0
	blx r1
	cmp r0, #1
	bne _0203FDA2
_0203FDD4:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_0203FD6C

	thumb_func_start sub_0203FDD8
sub_0203FDD8: ; 0x0203FDD8
	ldrb r3, [r0]
	add r2, r3, #1
	cmp r2, #0x14
	blt _0203FDE4
	mov r0, #1
	bx lr
_0203FDE4:
	lsl r2, r3, #2
	add r2, r0, r2
	str r1, [r2, #0xc]
	ldrb r1, [r0]
	add r1, r1, #1
	strb r1, [r0]
	mov r0, #0
	bx lr
	thumb_func_end sub_0203FDD8

	thumb_func_start sub_0203FDF4
sub_0203FDF4: ; 0x0203FDF4
	ldrb r1, [r0]
	cmp r1, #0
	bne _0203FDFE
	mov r0, #0
	bx lr
_0203FDFE:
	sub r1, r1, #1
	strb r1, [r0]
	ldrb r1, [r0]
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0203FDF4

	thumb_func_start sub_0203FE0C
sub_0203FE0C: ; 0x0203FE0C
	str r1, [r0, #8]
	bx lr
	thumb_func_end sub_0203FE0C

	thumb_func_start sub_0203FE10
sub_0203FE10: ; 0x0203FE10
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #8]
	bl sub_0203FDD8
	str r4, [r5, #8]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203FE10

	thumb_func_start sub_0203FE20
sub_0203FE20: ; 0x0203FE20
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203FDF4
	str r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end sub_0203FE20

	thumb_func_start sub_0203FE2C
sub_0203FE2C: ; 0x0203FE2C
	ldr r1, [r0, #8]
	add r3, r1, #1
	str r3, [r0, #8]
	ldrb r2, [r1]
	add r1, r3, #1
	str r1, [r0, #8]
	ldrb r0, [r3]
	lsl r0, r0, #8
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end sub_0203FE2C

	thumb_func_start sub_0203FE44
sub_0203FE44: ; 0x0203FE44
	push {r4, r5}
	ldr r1, [r0, #8]
	add r2, r1, #1
	str r2, [r0, #8]
	ldrb r3, [r1]
	add r1, r2, #1
	add r5, r1, #1
	str r1, [r0, #8]
	ldrb r2, [r2]
	add r4, r5, #1
	str r5, [r0, #8]
	ldrb r1, [r1]
	str r4, [r0, #8]
	ldrb r0, [r5]
	mov r4, #0
	add r0, r4, r0
	lsl r0, r0, #8
	add r0, r0, r1
	lsl r0, r0, #8
	add r0, r0, r2
	lsl r0, r0, #8
	add r0, r0, r3
	pop {r4, r5}
	bx lr
	thumb_func_end sub_0203FE44

	thumb_func_start sub_0203FE74
sub_0203FE74: ; 0x0203FE74
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	bl sub_0204001C
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0204005C
	ldr r1, _0203FEA0 ; =sub_0203FF44
	add r0, r5, #0
	add r2, r4, #0
	bl sub_020504F0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203FEA0: .word sub_0203FF44
	thumb_func_end sub_0203FE74

	thumb_func_start sub_0203FEA4
sub_0203FEA4: ; 0x0203FEA4
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x10]
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_02050650
	ldr r2, [sp, #0x1c]
	mov r1, #0x1c
	add r3, r2, #0
	add r0, #0x54
	mul r3, r1
	add r1, r0, r3
	str r4, [r0, r3]
	ldr r0, [sp, #0x10]
	str r6, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [sp, #0x14]
	str r0, [r1, #0xc]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x10]
	str r5, [r1, #0x14]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203FEA4

	thumb_func_start sub_0203FED4
sub_0203FED4: ; 0x0203FED4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r7, r1, #0
	str r2, [sp, #4]
	add r5, r3, #0
	bl sub_0205064C
	str r0, [sp, #8]
	bl sub_0204001C
	add r4, r0, #0
	ldr r0, [sp, #8]
	ldr r3, [sp, #4]
	add r1, r4, #0
	add r2, r7, #0
	str r5, [sp]
	bl sub_0204005C
	ldr r1, _0203FF08 ; =sub_0203FF44
	add r0, r6, #0
	add r2, r4, #0
	bl sub_02050530
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0203FF08: .word sub_0203FF44
	thumb_func_end sub_0203FED4

	thumb_func_start sub_0203FF0C
sub_0203FF0C: ; 0x0203FF0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	bl sub_0205064C
	str r0, [sp, #4]
	bl sub_0204001C
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0204005C
	ldr r1, _0203FF40 ; =sub_0203FF44
	add r0, r5, #0
	add r2, r4, #0
	bl sub_02050510
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203FF40: .word sub_0203FF44
	thumb_func_end sub_0203FF0C

	thumb_func_start sub_0203FF44
sub_0203FF44: ; 0x0203FF44
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	ldrb r1, [r4, #4]
	str r0, [sp]
	cmp r1, #0
	beq _0203FF64
	cmp r1, #1
	beq _0203FF9A
	b _02040016
_0203FF64:
	ldrh r1, [r4, #0xa]
	bl sub_020400AC
	str r0, [r4, #0x38]
	mov r0, #1
	strb r0, [r4, #9]
	mov r0, #8
	mov r1, #0x40
	mov r2, #0xb
	bl ScrStrBufs_new_custom
	str r0, [r4, #0x44]
	mov r0, #1
	lsl r0, r0, #0xa
	mov r1, #0xb
	bl String_ctor
	str r0, [r4, #0x48]
	mov r0, #1
	lsl r0, r0, #0xa
	mov r1, #0xb
	bl String_ctor
	str r0, [r4, #0x4c]
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
_0203FF9A:
	mov r0, #0
	add r7, r4, #0
	str r0, [sp, #4]
	add r5, r4, #0
	add r7, #9
_0203FFA4:
	ldr r6, [r5, #0x38]
	cmp r6, #0
	beq _0203FFCE
	add r0, r6, #0
	bl sub_0203FD6C
	cmp r0, #0
	bne _0203FFCE
	add r0, r6, #0
	bl sub_02040044
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _0203FFC4
	bl GF_AssertFail
_0203FFC4:
	mov r0, #0
	str r0, [r5, #0x38]
	ldrb r0, [r7]
	sub r0, r0, #1
	strb r0, [r7]
_0203FFCE:
	ldr r0, [sp, #4]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #3
	blt _0203FFA4
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _02040016
	add r0, r4, #0
	add r0, #0xa8
	ldr r5, [r0]
	ldr r0, [r4, #0x44]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x48]
	bl String_dtor
	ldr r0, [r4, #0x4c]
	bl String_dtor
	mov r0, #0
	str r0, [r4]
	add r0, r4, #0
	bl FreeToHeap
	cmp r5, #0
	beq _02040010
	ldr r0, [sp]
	blx r5
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02040010:
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02040016:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0203FF44

	thumb_func_start sub_0204001C
sub_0204001C: ; 0x0204001C
	push {r4, lr}
	mov r0, #0xb
	mov r1, #0xe0
	bl AllocFromHeap
	add r4, r0, #0
	bne _0204002E
	bl GF_AssertFail
_0204002E:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xe0
	bl memset
	ldr r0, _02040040 ; =0x0003643F
	str r0, [r4]
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02040040: .word 0x0003643F
	thumb_func_end sub_0204001C

	thumb_func_start sub_02040044
sub_02040044: ; 0x02040044
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x78]
	bl DestroyMsgData
	ldr r0, [r4, #0x7c]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02040044

	thumb_func_start sub_0204005C
sub_0204005C: ; 0x0204005C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0x37
	add r4, r2, #0
	add r6, r3, #0
	bl sub_020401B4
	str r0, [sp]
	ldr r0, [r7, #0x40]
	bl sub_0205C654
	str r0, [r5, #0x28]
	str r6, [r5, #0x2c]
	ldr r0, [sp, #0x18]
	strh r4, [r5, #0xa]
	str r0, [r5, #0x34]
	cmp r6, #0
	beq _0204008E
	add r0, r6, #0
	bl sub_0205F24C
	ldr r1, [sp]
	strh r0, [r1]
_0204008E:
	mov r0, #0x7d
	lsl r0, r0, #6
	cmp r4, r0
	blo _020400A4
	ldr r0, _020400A8 ; =0x0000225F
	cmp r4, r0
	bhi _020400A4
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020405AC
_020400A4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020400A8: .word 0x0000225F
	thumb_func_end sub_0204005C

	thumb_func_start sub_020400AC
sub_020400AC: ; 0x020400AC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x84
	bl AllocFromHeap
	add r4, r0, #0
	bne _020400C2
	bl GF_AssertFail
_020400C2:
	ldr r2, _020400E0 ; =0x020FAC90
	ldr r1, _020400E4 ; =0x020FAD00
	ldr r2, [r2]
	add r0, r4, #0
	bl sub_0203FD18
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0
	bl sub_020400E8
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_020400E0: .word 0x020FAC90
_020400E4: .word 0x020FAD00
	thumb_func_end sub_020400AC

	thumb_func_start sub_020400E8
sub_020400E8: ; 0x020400E8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r3, r4, #0
	add r5, r0, #0
	add r3, #0x80
	str r5, [r3]
	bl sub_02040114
	add r6, r0, #0
	ldr r1, [r4, #0x7c]
	add r0, r4, #0
	bl sub_0203FD4C
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02040340
	ldr r1, [r5, #0x10]
	add r0, r4, #0
	bl sub_0203FD68
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020400E8

	thumb_func_start sub_02040114
sub_02040114: ; 0x02040114
	push {r4, r5, r6, lr}
	ldr r6, _02040164 ; =0x020FA4A4
	add r5, r2, #0
	mov r2, #0
	add r4, r6, #0
_0204011E:
	ldrh r3, [r4]
	cmp r5, r3
	blo _0204013E
	mov r3, #6
	add r4, r2, #0
	mul r4, r3
	add r3, r6, r4
	ldrh r2, [r3, #2]
	ldrh r3, [r3, #4]
	bl sub_02040168
	ldrh r0, [r6, r4]
	sub r0, r5, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
_0204013E:
	add r2, r2, #1
	add r4, r4, #6
	cmp r2, #0x1e
	blo _0204011E
	cmp r5, #1
	blo _02040156
	bl sub_0204018C
	sub r0, r5, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
_02040156:
	mov r2, #0x8c
	mov r3, #0xb8
	bl sub_02040168
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02040164: .word 0x020FA4A4
	thumb_func_end sub_02040114

	thumb_func_start sub_02040168
sub_02040168: ; 0x02040168
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r1, r2, #0
	add r4, r3, #0
	mov r0, #0xc
	mov r2, #0xb
	bl AllocAndReadWholeNarcMemberByIdPair
	str r0, [r5, #0x7c]
	mov r0, #1
	mov r1, #0x1b
	add r2, r4, #0
	mov r3, #0xb
	bl NewMsgDataFromNarc
	str r0, [r5, #0x78]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02040168

	thumb_func_start sub_0204018C
sub_0204018C: ; 0x0204018C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r4, r1, #0
	ldr r0, [r0]
	bl sub_02040358
	str r0, [r4, #0x7c]
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl sub_0204036C
	add r2, r0, #0
	mov r0, #1
	mov r1, #0x1b
	mov r3, #0xb
	bl NewMsgDataFromNarc
	str r0, [r4, #0x78]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0204018C

	thumb_func_start sub_020401B4
sub_020401B4: ; 0x020401B4
	push {r3, lr}
	cmp r1, #0x37
	bls _020401BC
	b _020402E8
_020401BC:
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_020401C8: ; jump table
	.short _02040238 - _020401C8 - 2 ; case 0
	.short _0204023C - _020401C8 - 2 ; case 1
	.short _02040240 - _020401C8 - 2 ; case 2
	.short _02040244 - _020401C8 - 2 ; case 3
	.short _02040248 - _020401C8 - 2 ; case 4
	.short _0204024C - _020401C8 - 2 ; case 5
	.short _02040250 - _020401C8 - 2 ; case 6
	.short _02040254 - _020401C8 - 2 ; case 7
	.short _02040258 - _020401C8 - 2 ; case 8
	.short _0204025C - _020401C8 - 2 ; case 9
	.short _02040260 - _020401C8 - 2 ; case 10
	.short _02040264 - _020401C8 - 2 ; case 11
	.short _02040268 - _020401C8 - 2 ; case 12
	.short _0204026C - _020401C8 - 2 ; case 13
	.short _0204026C - _020401C8 - 2 ; case 14
	.short _0204026C - _020401C8 - 2 ; case 15
	.short _02040276 - _020401C8 - 2 ; case 16
	.short _0204027A - _020401C8 - 2 ; case 17
	.short _0204027E - _020401C8 - 2 ; case 18
	.short _02040282 - _020401C8 - 2 ; case 19
	.short _02040286 - _020401C8 - 2 ; case 20
	.short _0204028A - _020401C8 - 2 ; case 21
	.short _0204028E - _020401C8 - 2 ; case 22
	.short _02040292 - _020401C8 - 2 ; case 23
	.short _02040296 - _020401C8 - 2 ; case 24
	.short _0204029A - _020401C8 - 2 ; case 25
	.short _0204029E - _020401C8 - 2 ; case 26
	.short _020402A2 - _020401C8 - 2 ; case 27
	.short _020402A6 - _020401C8 - 2 ; case 28
	.short _020402AA - _020401C8 - 2 ; case 29
	.short _020402AE - _020401C8 - 2 ; case 30
	.short _020402B2 - _020401C8 - 2 ; case 31
	.short _020402B6 - _020401C8 - 2 ; case 32
	.short _020402BA - _020401C8 - 2 ; case 33
	.short _020402BE - _020401C8 - 2 ; case 34
	.short _020402C2 - _020401C8 - 2 ; case 35
	.short _020402C6 - _020401C8 - 2 ; case 36
	.short _020402CA - _020401C8 - 2 ; case 37
	.short _020402CE - _020401C8 - 2 ; case 38
	.short _020402D2 - _020401C8 - 2 ; case 39
	.short _020402D6 - _020401C8 - 2 ; case 40
	.short _020402DA - _020401C8 - 2 ; case 41
	.short _020402DE - _020401C8 - 2 ; case 42
	.short _020402DE - _020401C8 - 2 ; case 43
	.short _020402DE - _020401C8 - 2 ; case 44
	.short _020402DE - _020401C8 - 2 ; case 45
	.short _020402DE - _020401C8 - 2 ; case 46
	.short _020402DE - _020401C8 - 2 ; case 47
	.short _020402DE - _020401C8 - 2 ; case 48
	.short _020402DE - _020401C8 - 2 ; case 49
	.short _020402DE - _020401C8 - 2 ; case 50
	.short _020402DE - _020401C8 - 2 ; case 51
	.short _020402DE - _020401C8 - 2 ; case 52
	.short _020402DE - _020401C8 - 2 ; case 53
	.short _020402DE - _020401C8 - 2 ; case 54
	.short _020402DE - _020401C8 - 2 ; case 55
_02040238:
	add r0, #0x10
	pop {r3, pc}
_0204023C:
	add r0, #0x14
	pop {r3, pc}
_02040240:
	add r0, #0x24
	pop {r3, pc}
_02040244:
	add r0, r0, #5
	pop {r3, pc}
_02040248:
	add r0, r0, #6
	pop {r3, pc}
_0204024C:
	add r0, r0, #7
	pop {r3, pc}
_02040250:
	add r0, #8
	pop {r3, pc}
_02040254:
	add r0, #9
	pop {r3, pc}
_02040258:
	add r0, #0xa
	pop {r3, pc}
_0204025C:
	add r0, #0x28
	pop {r3, pc}
_02040260:
	add r0, #0x2c
	pop {r3, pc}
_02040264:
	add r0, #0x30
	pop {r3, pc}
_02040268:
	add r0, #0x34
	pop {r3, pc}
_0204026C:
	sub r1, #0xd
	add r0, #0x38
	lsl r1, r1, #2
	add r0, r0, r1
	pop {r3, pc}
_02040276:
	add r0, #0x44
	pop {r3, pc}
_0204027A:
	add r0, #0x48
	pop {r3, pc}
_0204027E:
	add r0, #0x4c
	pop {r3, pc}
_02040282:
	add r0, #0x50
	pop {r3, pc}
_02040286:
	add r0, #0xac
	pop {r3, pc}
_0204028A:
	add r0, #0xb0
	pop {r3, pc}
_0204028E:
	add r0, #0xb4
	pop {r3, pc}
_02040292:
	add r0, #0xb8
	pop {r3, pc}
_02040296:
	add r0, #0xc
	pop {r3, pc}
_0204029A:
	add r0, #0x54
	pop {r3, pc}
_0204029E:
	add r0, #0x58
	pop {r3, pc}
_020402A2:
	add r0, #0x5c
	pop {r3, pc}
_020402A6:
	add r0, #0x60
	pop {r3, pc}
_020402AA:
	add r0, #0x64
	pop {r3, pc}
_020402AE:
	add r0, #0x68
	pop {r3, pc}
_020402B2:
	add r0, #0x6c
	pop {r3, pc}
_020402B6:
	add r0, #0x70
	pop {r3, pc}
_020402BA:
	add r0, #0x74
	pop {r3, pc}
_020402BE:
	add r0, #0x78
	pop {r3, pc}
_020402C2:
	add r0, #0x7c
	pop {r3, pc}
_020402C6:
	add r0, #0x80
	pop {r3, pc}
_020402CA:
	add r0, #0x84
	pop {r3, pc}
_020402CE:
	add r0, #0x88
	pop {r3, pc}
_020402D2:
	add r0, #0xbc
	pop {r3, pc}
_020402D6:
	add r0, #0xcc
	pop {r3, pc}
_020402DA:
	add r0, #0xdc
	pop {r3, pc}
_020402DE:
	sub r1, #0x2a
	add r0, #0x8c
	lsl r1, r1, #1
	add r0, r0, r1
	pop {r3, pc}
_020402E8:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_020401B4

	thumb_func_start sub_020402F0
sub_020402F0: ; 0x020402F0
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0x10]
	add r5, r1, #0
	bl sub_02050650
	add r4, r0, #0
	bne _02040302
	bl GF_AssertFail
_02040302:
	ldr r1, [r4]
	ldr r0, _02040318 ; =0x0003643F
	cmp r1, r0
	beq _0204030E
	bl GF_AssertFail
_0204030E:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020401B4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02040318: .word 0x0003643F
	thumb_func_end sub_020402F0

	thumb_func_start sub_0204031C
sub_0204031C: ; 0x0204031C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203BC10
	cmp r0, #1
	bne _02040338
	ldr r0, _0204033C ; =sub_0203BD64
	add r4, #0xa8
	str r0, [r4]
_02040338:
	pop {r3, r4, r5, pc}
	nop
_0204033C: .word sub_0203BD64
	thumb_func_end sub_0204031C

	thumb_func_start sub_02040340
sub_02040340: ; 0x02040340
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #8]
	lsl r1, r1, #2
	add r1, r2, r1
	str r1, [r4, #8]
	bl sub_0203FE44
	ldr r1, [r4, #8]
	add r0, r1, r0
	str r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end sub_02040340

	thumb_func_start sub_02040358
sub_02040358: ; 0x02040358
	push {r3, lr}
	bl sub_0203B2D4
	add r1, r0, #0
	mov r0, #0xc
	mov r2, #0xb
	bl AllocAndReadWholeNarcMemberByIdPair
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02040358

	thumb_func_start sub_0204036C
sub_0204036C: ; 0x0204036C
	ldr r3, _02040370 ; =sub_0203B2C0
	bx r3
	.balign 4, 0
_02040370: .word sub_0203B2C0
	thumb_func_end sub_0204036C

	thumb_func_start sub_02040374
sub_02040374: ; 0x02040374
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	bl sub_020503D0
	mov r1, #1
	lsl r1, r1, #0xe
	cmp r4, r1
	bhs _0204038C
	mov r0, #0
	pop {r3, r4, r5, pc}
_0204038C:
	lsl r1, r1, #1
	cmp r4, r1
	bhs _0204039A
	add r1, r4, #0
	bl sub_020504A4
	pop {r3, r4, r5, pc}
_0204039A:
	ldr r1, _020403A8 ; =0x00007FD6
	add r0, r5, #0
	sub r1, r4, r1
	bl sub_020402F0
	pop {r3, r4, r5, pc}
	nop
_020403A8: .word 0x00007FD6
	thumb_func_end sub_02040374

	thumb_func_start sub_020403AC
sub_020403AC: ; 0x020403AC
	push {r4, lr}
	add r4, r1, #0
	bl sub_02040374
	cmp r0, #0
	beq _020403BA
	ldrh r4, [r0]
_020403BA:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020403AC

	thumb_func_start sub_020403C0
sub_020403C0: ; 0x020403C0
	push {r4, lr}
	add r4, r2, #0
	bl sub_02040374
	cmp r0, #0
	bne _020403D0
	mov r0, #0
	pop {r4, pc}
_020403D0:
	strh r4, [r0]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020403C0

	thumb_func_start sub_020403D8
sub_020403D8: ; 0x020403D8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x10
	blo _020403E6
	bl GF_AssertFail
_020403E6:
	ldr r1, _020403F8 ; =0x00004020
	add r0, r5, #0
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_020403AC
	pop {r3, r4, r5, pc}
	nop
_020403F8: .word 0x00004020
	thumb_func_end sub_020403D8

	thumb_func_start sub_020403FC
sub_020403FC: ; 0x020403FC
	push {r4, lr}
	ldr r0, [r0, #0xc]
	add r4, r1, #0
	bl sub_020503D0
	add r1, r4, #0
	bl sub_020503DC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020403FC

	thumb_func_start sub_02040410
sub_02040410: ; 0x02040410
	push {r4, lr}
	ldr r0, [r0, #0xc]
	add r4, r1, #0
	bl sub_020503D0
	add r1, r4, #0
	bl sub_02050408
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02040410

	thumb_func_start sub_02040424
sub_02040424: ; 0x02040424
	push {r4, lr}
	ldr r0, [r0, #0xc]
	add r4, r1, #0
	bl sub_020503D0
	add r1, r4, #0
	bl sub_02050430
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02040424

	thumb_func_start sub_02040438
sub_02040438: ; 0x02040438
	push {r4, lr}
	ldr r0, [r0, #0xc]
	bl sub_020503D0
	mov r1, #1
	add r4, r0, #0
	bl sub_0205045C
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xe
	bl sub_020504A4
	mov r1, #0
	mov r2, #0x40
	bl memset
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02040438

	thumb_func_start sub_02040470
sub_02040470: ; 0x02040470
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl sub_020503D0
	mov r1, #0xaa
	lsl r1, r1, #4
	bl sub_0205045C
	mov r2, #0x18
	mov r1, #0
_02040484:
	strb r1, [r0]
	add r0, r0, #1
	sub r2, r2, #1
	bne _02040484
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02040470

	thumb_func_start sub_02040490
sub_02040490: ; 0x02040490
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0x2a
	add r6, r2, #0
	add r7, r3, #0
	bl sub_020402F0
	strh r4, [r0]
	add r0, r5, #0
	mov r1, #0x2b
	bl sub_020402F0
	strh r6, [r0]
	add r0, r5, #0
	mov r1, #0x2c
	bl sub_020402F0
	strh r7, [r0]
	add r0, r5, #0
	mov r1, #0x2d
	bl sub_020402F0
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	strh r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02040490

	thumb_func_start sub_020404C8
sub_020404C8: ; 0x020404C8
	ldr r1, _020404E4 ; =0x00001388
	cmp r0, r1
	bhs _020404D8
	ldr r1, _020404E8 ; =0x00000BB7
	sub r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
_020404D8:
	sub r1, r1, #1
	sub r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	nop
_020404E4: .word 0x00001388
_020404E8: .word 0x00000BB7
	thumb_func_end sub_020404C8

	thumb_func_start sub_020404EC
sub_020404EC: ; 0x020404EC
	ldr r1, _020404FC ; =0x00001388
	cmp r0, r1
	blo _020404F6
	mov r0, #1
	bx lr
_020404F6:
	mov r0, #0
	bx lr
	nop
_020404FC: .word 0x00001388
	thumb_func_end sub_020404EC

	thumb_func_start sub_02040500
sub_02040500: ; 0x02040500
	push {r3, lr}
	mov r1, #9
	bl sub_02073470
	cmp r0, #0
	beq _02040510
	mov r0, #1
	pop {r3, pc}
_02040510:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02040500

	thumb_func_start sub_02040514
sub_02040514: ; 0x02040514
	push {r4, lr}
	add r4, r1, #0
	bl sub_020503D0
	mov r1, #0x55
	lsl r1, r1, #4
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_020503DC
	pop {r4, pc}
	thumb_func_end sub_02040514

	thumb_func_start sub_0204052C
sub_0204052C: ; 0x0204052C
	push {r4, lr}
	add r4, r1, #0
	bl sub_020503D0
	mov r1, #0x55
	lsl r1, r1, #4
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_02050408
	pop {r4, pc}
	thumb_func_end sub_0204052C

	thumb_func_start sub_02040544
sub_02040544: ; 0x02040544
	push {r4, lr}
	add r4, r1, #0
	bl sub_020503D0
	mov r1, #0x55
	lsl r1, r1, #4
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_02050430
	pop {r4, pc}
	thumb_func_end sub_02040544

	thumb_func_start sub_0204055C
sub_0204055C: ; 0x0204055C
	ldr r1, _02040568 ; =0x00001C20
	sub r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	nop
_02040568: .word 0x00001C20
	thumb_func_end sub_0204055C

	thumb_func_start sub_0204056C
sub_0204056C: ; 0x0204056C
	mov r1, #0x7d
	lsl r1, r1, #6
	sub r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end sub_0204056C

	thumb_func_start sub_02040578
sub_02040578: ; 0x02040578
	push {r4, lr}
	ldr r4, _020405A8 ; =0x020FA558
	bl sub_0204056C
	mov r2, #0
	add r3, r4, #0
_02040584:
	ldrh r1, [r3, #6]
	cmp r0, r1
	beq _02040592
	add r2, r2, #1
	add r3, #8
	cmp r2, #0xe7
	blo _02040584
_02040592:
	cmp r2, #0xe7
	blo _0204059E
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_0204059E:
	lsl r0, r2, #3
	add r0, r4, r0
	ldrb r0, [r0, #3]
	pop {r4, pc}
	nop
_020405A8: .word 0x020FA558
	thumb_func_end sub_02040578

	thumb_func_start sub_020405AC
sub_020405AC: ; 0x020405AC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	mov r1, #0x2a
	bl sub_020401B4
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x2b
	bl sub_020401B4
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x2c
	bl sub_020401B4
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0204056C
	ldr r3, _02040610 ; =0x020FA558
	add r2, r0, #0
	mov r1, #0
_020405DA:
	ldrh r0, [r3, #6]
	cmp r2, r0
	beq _020405E8
	add r1, r1, #1
	add r3, #8
	cmp r1, #0xe7
	blo _020405DA
_020405E8:
	cmp r1, #0xe7
	blo _020405F4
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020405F4:
	lsl r0, r1, #3
	ldr r1, _02040610 ; =0x020FA558
	ldrh r1, [r1, r0]
	strh r1, [r7]
	ldr r1, _02040610 ; =0x020FA558
	add r0, r1, r0
	ldrb r0, [r0, #2]
	strh r0, [r6]
	add r0, r5, #0
	bl sub_0204055C
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02040610: .word 0x020FA558
	thumb_func_end sub_020405AC

	thumb_func_start sub_02040614
sub_02040614: ; 0x02040614
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp]
	add r4, r1, #0
	mov r6, #0
	bl sub_0203B6E0
	add r5, r0, #0
	add r2, r5, #1
	mov r1, #6
	add r0, r4, #0
	mul r1, r2
	bl AllocFromHeap
	str r0, [sp, #0x1c]
	cmp r5, #0
	bne _02040646
	mov r2, #0xff
	add r1, r0, #0
	strb r2, [r1, #4]
	sub r2, r6, #1
	strh r2, [r1]
	strh r2, [r1, #2]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_02040646:
	ldr r0, [sp]
	bl sub_0203B6D8
	add r4, r0, #0
	bne _02040660
	ldr r0, [sp, #0x1c]
	mov r1, #0xff
	strb r1, [r0, #4]
	sub r1, r6, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_02040660:
	ldr r0, [sp]
	ldr r0, [r0, #0x40]
	bl sub_0205C67C
	str r0, [sp, #0x18]
	ldr r0, [sp]
	ldr r0, [r0, #0x40]
	bl sub_0205C688
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	str r0, [sp, #0x10]
	sub r0, #0x11
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	str r0, [sp, #0xc]
	add r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	str r0, [sp, #8]
	sub r0, #0x11
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	add r0, #0x11
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bge _0204069E
	add r0, r6, #0
	str r0, [sp, #0x10]
_0204069E:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _020406A8
	mov r0, #0
	str r0, [sp, #8]
_020406A8:
	add r0, r5, #1
	mov r7, #0
	str r0, [sp, #0x20]
	cmp r0, #0
	ble _0204070E
	ldr r5, [sp, #0x1c]
_020406B4:
	ldrh r0, [r4, #2]
	cmp r0, #2
	bne _02040704
	ldrh r0, [r4]
	bl sub_0204055C
	add r1, r0, #0
	ldr r0, [sp]
	bl sub_020403FC
	cmp r0, #0
	bne _02040704
	ldr r1, [r4, #4]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blt _02040704
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _02040704
	ldr r1, [r4, #8]
	ldr r0, [sp, #8]
	cmp r1, r0
	blt _02040704
	ldr r0, [sp, #4]
	cmp r1, r0
	bgt _02040704
	ldrh r0, [r4]
	bl sub_02040578
	strb r0, [r5, #4]
	ldr r1, [r4, #4]
	ldr r0, [sp, #0x18]
	add r6, r6, #1
	sub r0, r1, r0
	strh r0, [r5]
	ldr r1, [r4, #8]
	ldr r0, [sp, #0x14]
	sub r0, r1, r0
	strh r0, [r5, #2]
	add r5, r5, #6
_02040704:
	ldr r0, [sp, #0x20]
	add r7, r7, #1
	add r4, #0x14
	cmp r7, r0
	blt _020406B4
_0204070E:
	mov r2, #6
	add r0, r6, #0
	mul r0, r2
	ldr r1, [sp, #0x1c]
	mov r4, #0xff
	add r3, r1, r0
	strb r4, [r3, #4]
	sub r2, r2, #7
	strh r2, [r1, r0]
	strh r2, [r3, #2]
	add r0, r1, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02040614

	thumb_func_start sub_02040728
sub_02040728: ; 0x02040728
	ldr r3, _02040730 ; =sub_02040734
	mov r1, #0x96
	lsl r1, r1, #6
	bx r3
	.balign 4, 0
_02040730: .word sub_02040734
	thumb_func_end sub_02040728

	thumb_func_start sub_02040734
sub_02040734: ; 0x02040734
	push {r4, lr}
	bl sub_020400AC
	add r4, r0, #0
_0204073C:
	add r0, r4, #0
	bl sub_0203FD6C
	cmp r0, #1
	beq _0204073C
	add r0, r4, #0
	bl sub_02040044
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02040734

	thumb_func_start sub_02040750
sub_02040750: ; 0x02040750
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	add r1, #0xac
	ldr r1, [r1]
	cmp r1, #0
	beq _02040764
	mov r0, #0
	pop {r3, r4, r5, pc}
_02040764:
	bl sub_0203B904
	add r1, r0, #0
	bne _02040770
	mov r0, #0
	pop {r3, r4, r5, pc}
_02040770:
	cmp r4, #1
	bne _0204077E
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0204080C
	b _02040784
_0204077E:
	add r1, r4, #0
	bl _020407E4
_02040784:
	add r1, r0, #0
	ldr r0, _020407A8 ; =0x0000FFFF
	cmp r1, r0
	bne _02040790
	mov r0, #0
	pop {r3, r4, r5, pc}
_02040790:
	cmp r4, #1
	bne _0204079E
	add r0, r5, #0
	mov r2, #0
	bl sub_0203FE74
	b _020407A4
_0204079E:
	add r0, r5, #0
	bl sub_02040734
_020407A4:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020407A8: .word 0x0000FFFF
	thumb_func_end sub_02040750

	thumb_func_start sub_020407AC
sub_020407AC: ; 0x020407AC
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	cmp r1, #0
	beq _020407BE
	mov r0, #0
	pop {r4, pc}
_020407BE:
	bl sub_0203B904
	add r1, r0, #0
	bne _020407CA
	mov r0, #0
	pop {r4, pc}
_020407CA:
	add r0, r4, #0
	mov r2, #1
	bl sub_0204080C
	ldr r1, _020407E0 ; =0x0000FFFF
	cmp r0, r1
	beq _020407DC
	mov r0, #1
	pop {r4, pc}
_020407DC:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_020407E0: .word 0x0000FFFF
_020407E4:
	ldrb r2, [r0]
	cmp r2, #0
	bne _020407EE
	ldr r0, _02040808 ; =0x0000FFFF
	bx lr
_020407EE:
	cmp r2, r1
	bne _02040800
	ldrb r1, [r0, #1]
	ldrb r0, [r0, #2]
	lsl r0, r0, #8
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
_02040800:
	add r0, r0, #5
	b _020407E4
	thumb_func_end sub_020407AC

	thumb_func_start sub_02040804
sub_02040804: ; 0x02040804
	bx lr
	nop
_02040808: .word 0x0000FFFF
	thumb_func_end sub_02040804

	thumb_func_start sub_0204080C
sub_0204080C: ; 0x0204080C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
_02040812:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0204081C
	ldr r0, _0204088C ; =0x0000FFFF
	pop {r3, r4, r5, r6, r7, pc}
_0204081C:
	cmp r0, r2
	bne _02040838
	ldrb r0, [r4, #4]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	lsl r1, r0, #0x18
	ldrb r0, [r4, #3]
	lsl r2, r2, #8
	add r2, r3, r2
	lsl r0, r0, #0x10
	add r0, r0, r2
	add r1, r1, r0
	add r0, r4, #5
	b _0204083C
_02040838:
	add r4, r4, #5
	b _02040812
_0204083C:
	cmp r1, #0
	bne _02040844
	ldr r0, _0204088C ; =0x0000FFFF
	pop {r3, r4, r5, r6, r7, pc}
_02040844:
	add r4, r0, r1
_02040846:
	ldrb r0, [r4, #1]
	ldrb r1, [r4]
	lsl r0, r0, #8
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	bne _02040858
	ldr r0, _0204088C ; =0x0000FFFF
	pop {r3, r4, r5, r6, r7, pc}
_02040858:
	ldrb r0, [r4, #3]
	ldrb r2, [r4, #2]
	lsl r0, r0, #8
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r5, #0
	bl sub_020403AC
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020403AC
	cmp r7, r0
	bne _02040886
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #4]
	lsl r0, r0, #8
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02040886:
	add r4, r4, #6
	b _02040846
_0204088A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204088C: .word 0x0000FFFF
	thumb_func_end sub_0204080C

	.rodata

_020F67DC:
	.byte 0x01, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00
	.byte 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x14, 0x00, 0x1E, 0x00, 0x23, 0x00, 0x28, 0x00, 0xF4, 0x01
	.byte 0x10, 0x27, 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0xE8, 0x03, 0x0B, 0x00, 0x14, 0x00
	.byte 0x0A, 0x00, 0x0F, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0A, 0x00, 0x0A, 0x00
_020F682C:
	.byte 0x00, 0x00, 0x04, 0xFF
	.byte 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0xFF, 0x21, 0x00, 0x00, 0x00, 0x02, 0x00, 0x08, 0xFF
	.byte 0x0A, 0x00, 0x00, 0x00, 0x01, 0x04, 0x04, 0xFF, 0x01, 0x00, 0x00, 0x00
_020F684C:
	.byte 0x06
_020F684D:
	.byte 0x00, 0x04, 0x06
	.byte 0x03, 0x0A, 0x00, 0x00
_020F6854:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00
	.byte 0x5B, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00
_020F6888:
	.byte 0x00, 0x07, 0x01, 0x05, 0x03, 0x06, 0x01, 0x08
	.byte 0x05, 0x06, 0x03, 0x07, 0x05, 0x09, 0x06, 0x07, 0x03, 0x08, 0x06, 0x0A, 0x07, 0x08, 0x03, 0x09
	.byte 0x07, 0x02, 0x08, 0x09, 0x03, 0x0A, 0x08, 0x00, 0x09, 0x0A, 0x03, 0x02, 0x09, 0x01, 0x0A, 0x02
	.byte 0x03, 0x00, 0x0A, 0x05, 0x02, 0x00, 0x03, 0x01, 0x02, 0x06, 0x00, 0x01, 0x03, 0x05, 0x00, 0x02
	.byte 0x05, 0x07, 0x03, 0x09
_020F68C4:
	.byte 0x00, 0x02, 0x01, 0x03
_020F68C8:
	.byte 0x00, 0x02, 0x03, 0x01, 0x03, 0x01, 0x00, 0x02
_020F68D0:
	.byte 0xED, 0x01, 0xF2, 0x01, 0xEE, 0x01, 0xF1, 0x01, 0xF0, 0x01, 0xEC, 0x01, 0xEF, 0x01
_020F68DE:
	.byte 0x04, 0xFE
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x04, 0xFE, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0xFE, 0xFE, 0x00, 0x00, 0x00, 0x04, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0x02, 0x02, 0x02, 0x02
	.byte 0x02, 0x00
_020F6902:
	.byte 0x00, 0x00
_020F6904:
	.byte 0x74, 0x16, 0x0A, 0x00, 0x00, 0x00, 0x96, 0x00, 0x78, 0x00, 0x14, 0x0E
	.byte 0x00, 0x00, 0x1C, 0x02, 0x7D, 0x00, 0x00, 0x1C, 0x14, 0x00, 0xC8, 0x00, 0x88, 0x00, 0x00, 0x00
	.byte 0x18, 0x0E, 0x96, 0x00, 0x68, 0x0C, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00
_020F692C:
	.byte 0x01, 0x01, 0x01, 0x01
	.byte 0x03, 0x03, 0x03, 0x04, 0x03, 0x04, 0x07, 0x03, 0x07, 0x04, 0x01, 0x04, 0x01, 0x01, 0x04, 0x01
	.byte 0x01, 0x01, 0x01, 0x03, 0x00, 0x00, 0x04, 0x01, 0x01, 0x02, 0x01, 0x01, 0x01, 0x03, 0x01, 0x03
	.byte 0x00, 0x01, 0x01, 0x01, 0x03
_020F6955:
	.byte 0x01, 0x01, 0x01, 0x01, 0x03, 0x03, 0x01, 0x01, 0x01, 0x01, 0x01
	.byte 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01
	.byte 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00
_020F6980:
	.byte 0x00, 0x00, 0x00, 0x00
_020F6984:
	.byte 0xC1, 0x42, 0x03, 0x02
_020F6988:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC1, 0x42, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00, 0x6D, 0x77, 0x03, 0x02, 0xC1, 0x42, 0x03, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0xD1, 0x45, 0x03, 0x02, 0x21, 0x45, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x3D, 0x45, 0x03, 0x02, 0x21, 0x45, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00, 0x25, 0x45, 0x03, 0x02
	.byte 0xC1, 0x42, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00, 0x3D, 0x8B, 0x03, 0x02, 0x19, 0x8C, 0x03, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x9D, 0x8B, 0x03, 0x02, 0x19, 0x8C, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0x76, 0x03, 0x02, 0xC5, 0x42, 0x03, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x41, 0x76, 0x03, 0x02, 0xC5, 0x42, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x69, 0x76, 0x03, 0x02, 0xC5, 0x42, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00, 0xCD, 0x42, 0x03, 0x02
	.byte 0xC1, 0x42, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00, 0x11, 0x43, 0x03, 0x02, 0xC1, 0x42, 0x03, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x39, 0x43, 0x03, 0x02, 0xC1, 0x42, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x25, 0x7A, 0x03, 0x02, 0xC5, 0x42, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00, 0xAD, 0x7A, 0x03, 0x02
	.byte 0xC5, 0x42, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00, 0x99, 0x7A, 0x03, 0x02, 0xC9, 0x42, 0x03, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x6D, 0x7B, 0x03, 0x02, 0x89, 0x7B, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x69, 0x7C, 0x03, 0x02, 0x95, 0x7C, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00, 0x21, 0x92, 0x03, 0x02
	.byte 0xC1, 0x42, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00
_020F6A88:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
_020F6A90:
	.byte 0x7D, 0x82, 0x03, 0x02, 0x99, 0x83, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00, 0xFC, 0x01, 0x14, 0x00
	.byte 0xFF, 0xFF, 0x00, 0x00, 0xF8, 0x01, 0x14, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xF4, 0x01, 0x14, 0x00
	.byte 0xFF, 0xFF, 0x00, 0x00, 0xF0, 0x01, 0x14, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xF0, 0x01, 0x14, 0x00
	.byte 0xF4, 0x01, 0x14, 0x00, 0xF8, 0x01, 0x14, 0x00, 0xFC, 0x01, 0x14, 0x00, 0xFF, 0xFF, 0x00, 0x00
_020F6AD0:
	.byte 0x00, 0x03, 0x03, 0x1A, 0x12, 0x01, 0x23, 0x00
_020F6AD8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020F6AE8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_020F6B04:
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020F6B2C:
	.byte 0x39, 0x72, 0x09, 0x02
	.byte 0x31, 0x72, 0x09, 0x02, 0x00, 0x00, 0x00, 0x00, 0x49, 0x72, 0x09, 0x02, 0x2D, 0x72, 0x09, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x59, 0x72, 0x09, 0x02, 0x35, 0x72, 0x09, 0x02, 0x00, 0x00, 0x00, 0x00
_020F6B50:
	.byte 0x00, 0x03, 0x03, 0x1A, 0x12, 0x01, 0x23, 0x00
_020F6B58:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020F6B68:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_020F6B84:
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020F6BAC:
	.byte 0xF5, 0x01, 0xDB, 0x01
	.byte 0xAC, 0x01, 0xB2, 0x01, 0x66, 0x01, 0x89, 0x01, 0xE2, 0x01, 0xFC, 0x01, 0x97, 0x01, 0x45, 0x00
	.byte 0x9E, 0x00, 0xA6, 0x00, 0xEC, 0x00, 0xB9, 0x00, 0xE2, 0x00, 0x51, 0x00, 0xF6, 0x00, 0x25, 0x01
	.byte 0x02, 0x02, 0xFF, 0x01, 0xD2, 0x01, 0xA9, 0x00, 0x10, 0x02, 0x16, 0x02, 0x00, 0x00, 0x00, 0x00
_020F6BE0:
	.byte 0xFF
_020F6BE1:
	.byte 0x00, 0x0F, 0x00
_020F6BE4:
	.byte 0x00, 0x00
_020F6BE6:
	.byte 0x8B, 0x00
_020F6BE8:
	.byte 0x8F, 0x01
_020F6BEA:
	.byte 0x03, 0x00
_020F6BEC:
	.byte 0xE8, 0x03
_020F6BEE:
	.byte 0xE8, 0x03
_020F6BF0:
	.byte 0x00, 0x00, 0x00, 0xA6, 0x00, 0x02, 0x30, 0x0E, 0xFF, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0xE8, 0x03, 0xE8, 0x03, 0x00, 0x00, 0x00, 0xA6, 0x00, 0x00, 0x30, 0x00
	.byte 0xFF, 0x1A, 0x0F, 0x00, 0x4A, 0x00, 0xBD, 0x03, 0xD6, 0x02, 0xE2, 0x02, 0x27, 0x04, 0x27, 0x04
	.byte 0x01, 0x00, 0x00, 0xA6, 0x00, 0x44, 0x60, 0x00, 0xFF, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x31, 0x04, 0x31, 0x04, 0x00, 0x00, 0x00, 0xA6, 0x00, 0x06, 0x30, 0x00
	.byte 0xFF, 0x1A, 0x0F, 0x00, 0x4B, 0x00, 0x89, 0x00, 0x8D, 0x01, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0x02, 0x00, 0x00, 0xA6, 0x00, 0x44, 0x60, 0x00, 0xFF, 0x1A, 0x0F, 0x00, 0x4C, 0x00, 0x8A, 0x00
	.byte 0x8E, 0x01, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0x03, 0x00, 0x00, 0xA6, 0x00, 0x44, 0x60, 0x00
	.byte 0xFF, 0x58, 0xCF, 0x10, 0x43, 0x00, 0x16, 0x00, 0x1B, 0x01, 0x3B, 0x00, 0xE9, 0x03, 0xE9, 0x03
	.byte 0x04, 0x00, 0xE6, 0x91, 0x00, 0x01, 0x08, 0xF6, 0x1C, 0x4E, 0xBF, 0x10, 0x19, 0x00, 0x17, 0x00
	.byte 0x1C, 0x01, 0x3C, 0x00, 0x34, 0x04, 0x34, 0x04, 0x05, 0x00, 0xCE, 0xA4, 0x00, 0x03, 0x88, 0xEC
	.byte 0xFF, 0x03, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x32, 0x04, 0x32, 0x04
	.byte 0x00, 0x00, 0xD1, 0x93, 0x00, 0x02, 0x08, 0xF6, 0x6F, 0x12, 0x0F, 0x00, 0x00, 0x00, 0xA8, 0x00
	.byte 0x9D, 0x01, 0x3F, 0x01, 0x1A, 0x04, 0x1A, 0x04, 0x06, 0x00, 0x95, 0xC3, 0x01, 0x02, 0x08, 0xF6
	.byte 0x70, 0x0A, 0x0F, 0x00, 0x00, 0x00, 0xA9, 0x00, 0x9E, 0x01, 0x40, 0x01, 0x1B, 0x04, 0x1B, 0x04
	.byte 0x07, 0x00, 0x96, 0xC3, 0x01, 0x02, 0x08, 0xF6, 0x71, 0x11, 0x0F, 0x00, 0x00, 0x00, 0xAF, 0x00
	.byte 0xA4, 0x01, 0x46, 0x01, 0x21, 0x04, 0x21, 0x04, 0x08, 0x00, 0x97, 0xC3, 0x01, 0x02, 0x08, 0xF6
	.byte 0x72, 0x0D, 0x0F, 0x00, 0x00, 0x00, 0xB2, 0x00, 0xA7, 0x01, 0x48, 0x01, 0x1D, 0x04, 0x1D, 0x04
	.byte 0x09, 0x00, 0x98, 0xC3, 0x01, 0x02, 0x08, 0xF6, 0x73, 0x0D, 0x0F, 0x00, 0x00, 0x00, 0xB3, 0x00
	.byte 0xA8, 0x01, 0x49, 0x01, 0x1D, 0x04, 0x1D, 0x04, 0x0A, 0x00, 0x99, 0xC3, 0x01, 0x02, 0x08, 0xF6
	.byte 0x74, 0x0B, 0x0F, 0x00, 0x00, 0x00, 0xB8, 0x00, 0xAD, 0x01, 0x4E, 0x01, 0x1C, 0x04, 0x1C, 0x04
	.byte 0x0B, 0x00, 0x9A, 0xC3, 0x01, 0x02, 0x08, 0xF6, 0x75, 0x0F, 0x0F, 0x00, 0x00, 0x00, 0xBA, 0x00
	.byte 0xAF, 0x01, 0x50, 0x01, 0x1F, 0x04, 0x1F, 0x04, 0x0C, 0x00, 0x9B, 0xC3, 0x01, 0x02, 0x08, 0xF6
	.byte 0x76, 0x0E, 0x0F, 0x00, 0x00, 0x00, 0xBC, 0x00, 0xB1, 0x01, 0x52, 0x01, 0x1E, 0x04, 0x1E, 0x04
	.byte 0x0D, 0x00, 0x9C, 0xC3, 0x01, 0x02, 0x08, 0xF6, 0x77, 0x0D, 0x0F, 0x00, 0x00, 0x00, 0xBE, 0x00
	.byte 0xB3, 0x01, 0x54, 0x01, 0x1D, 0x04, 0x1D, 0x04, 0x0E, 0x00, 0x9D, 0xC3, 0x01, 0x02, 0x08, 0xF6
	.byte 0x78, 0x0D, 0x0F, 0x00, 0x00, 0x00, 0xBF, 0x00, 0xB4, 0x01, 0x55, 0x01, 0x1D, 0x04, 0x1D, 0x04
	.byte 0x0F, 0x00, 0x9E, 0xC3, 0x01, 0x02, 0x08, 0xF6, 0x79, 0x0B, 0x0F, 0x00, 0x00, 0x00, 0xC5, 0x00
	.byte 0xBA, 0x01, 0x5A, 0x01, 0x23, 0x04, 0x23, 0x04, 0x10, 0x00, 0x9F, 0xC3, 0x01, 0x02, 0x08, 0xF6
	.byte 0x5C, 0x0E, 0x0F, 0x00, 0x00, 0x00, 0xC7, 0x00, 0xBC, 0x01, 0x5C, 0x01, 0x24, 0x04, 0x24, 0x04
	.byte 0x11, 0x00, 0xA0, 0xC3, 0x01, 0x02, 0x08, 0xF6, 0x7A, 0x0E, 0x0F, 0x00, 0x00, 0x00, 0xC9, 0x00
	.byte 0xBE, 0x01, 0x5E, 0x01, 0x24, 0x04, 0x24, 0x04, 0x12, 0x00, 0xA1, 0xC3, 0x01, 0x02, 0x08, 0xF6
	.byte 0x7B, 0x0E, 0x0F, 0x00, 0x00, 0x00, 0xCA, 0x00, 0xBF, 0x01, 0x5F, 0x01, 0x24, 0x04, 0x24, 0x04
	.byte 0x13, 0x00, 0xA2, 0xC3, 0x01, 0x02, 0x08, 0xF6, 0x7C, 0x0E, 0x0F, 0x00, 0x00, 0x00, 0xCB, 0x00
	.byte 0xC0, 0x01, 0x60, 0x01, 0x24, 0x04, 0x24, 0x04, 0x14, 0x00, 0xA3, 0xC3, 0x01, 0x02, 0x08, 0xF6
	.byte 0xFF, 0x10, 0x0F, 0x00, 0x00, 0x00, 0xCD, 0x00, 0xC2, 0x01, 0x62, 0x01, 0x20, 0x04, 0x20, 0x04
	.byte 0x15, 0x00, 0xA4, 0xC3, 0x01, 0x02, 0x08, 0xF6, 0x7E, 0x10, 0x0F, 0x00, 0x00, 0x00, 0xD1, 0x00
	.byte 0xC6, 0x01, 0x65, 0x01, 0xC0, 0x04, 0xC0, 0x04, 0x16, 0x00, 0xA5, 0xC3, 0x01, 0x02, 0x28, 0xF6
	.byte 0x7F, 0x10, 0x0F, 0x00, 0x00, 0x00, 0xD2, 0x00, 0xC7, 0x01, 0x66, 0x01, 0x20, 0x04, 0x20, 0x04
	.byte 0x17, 0x00, 0xA6, 0xC3, 0x01, 0x02, 0x08, 0xF6, 0x81, 0x0A, 0x0F, 0x00, 0x00, 0x00, 0xD4, 0x00
	.byte 0xC9, 0x01, 0x68, 0x01, 0x1B, 0x04, 0x1B, 0x04, 0x18, 0x00, 0xAA, 0xC3, 0x01, 0x02, 0x08, 0xF6
	.byte 0x82, 0x0D, 0x0F, 0x00, 0x00, 0x00, 0xD7, 0x00, 0xCC, 0x01, 0x6A, 0x01, 0x25, 0x04, 0x25, 0x04
	.byte 0x19, 0x00, 0xAC, 0xC3, 0x01, 0x02, 0x08, 0xF6, 0x83, 0x0D, 0x0F, 0x00, 0x00, 0x00, 0xD8, 0x00
	.byte 0xCD, 0x01, 0x6B, 0x01, 0x25, 0x04, 0x25, 0x04, 0x1A, 0x00, 0xAD, 0xC3, 0x01, 0x02, 0x08, 0xF6
	.byte 0x67, 0x02, 0x0F, 0x00, 0x00, 0x00, 0xDA, 0x00, 0xCF, 0x01, 0x6D, 0x01, 0x26, 0x04, 0x26, 0x04
	.byte 0x1B, 0x00, 0xAE, 0xC3, 0x01, 0x02, 0x08, 0xF6, 0x68, 0x02, 0x0F, 0x00, 0x00, 0x00, 0xDD, 0x00
	.byte 0xD2, 0x01, 0x71, 0x01, 0x26, 0x04, 0x26, 0x04, 0x1C, 0x00, 0xAF, 0xA3, 0x01, 0x02, 0x08, 0xF6
	.byte 0x69, 0x0A, 0x0F, 0x00, 0x00, 0x00, 0xDF, 0x00, 0xD4, 0x01, 0x73, 0x01, 0x3D, 0x04, 0x3D, 0x04
	.byte 0x1D, 0x00, 0xB0, 0xC3, 0x01, 0x02, 0x08, 0xF6, 0x01, 0x02, 0x0F, 0x00, 0x00, 0x00, 0xE1, 0x00
	.byte 0xD6, 0x01, 0x75, 0x01, 0x04, 0x04, 0x04, 0x04, 0x1E, 0x00, 0xB1, 0xB3, 0x00, 0x02, 0x08, 0xF6
	.byte 0x03, 0x02, 0x0F, 0x00, 0x00, 0x00, 0xE3, 0x00, 0xD8, 0x01, 0x77, 0x01, 0x05, 0x04, 0x05, 0x04
	.byte 0x1F, 0x00, 0xB2, 0xB3, 0x00, 0x02, 0x08, 0xF6, 0x04, 0x02, 0x0F, 0x00, 0x00, 0x00, 0xE6, 0x00
	.byte 0xDB, 0x01, 0x7A, 0x01, 0x05, 0x04, 0x05, 0x04, 0x20, 0x00, 0xB3, 0xB3, 0x00, 0x02, 0x08, 0xF6
	.byte 0x08, 0x03, 0x0F, 0x00, 0x00, 0x00, 0xE8, 0x00, 0xDD, 0x01, 0x7C, 0x01, 0x06, 0x04, 0x06, 0x04
	.byte 0x21, 0x00, 0xB4, 0xB3, 0x00, 0x02, 0x08, 0xF6, 0x11, 0x04, 0x0F, 0x00, 0x00, 0x00, 0xEC, 0x00
	.byte 0xE1, 0x01, 0x7F, 0x01, 0x07, 0x04, 0x07, 0x04, 0x22, 0x00, 0xB5, 0xB3, 0x02, 0x02, 0x08, 0xF6
	.byte 0x15, 0x05, 0x0F, 0x00, 0x00, 0x00, 0xED, 0x00, 0xE2, 0x01, 0x80, 0x01, 0x08, 0x04, 0x08, 0x04
	.byte 0x23, 0x00, 0xB6, 0xB3, 0x00, 0x02, 0x08, 0xF6, 0x16, 0x06, 0x0F, 0x00, 0x00, 0x00, 0xF0, 0x00
	.byte 0xE5, 0x01, 0x83, 0x01, 0x09, 0x04, 0x09, 0x04, 0x24, 0x00, 0xB7, 0xB3, 0x00, 0x02, 0x08, 0xF6
	.byte 0x19, 0x06, 0x0F, 0x00, 0x00, 0x00, 0xF3, 0x00, 0xE8, 0x01, 0x86, 0x01, 0x09, 0x04, 0x09, 0x04
	.byte 0x25, 0x00, 0xB8, 0xB3, 0x00, 0x02, 0x08, 0xF6, 0x1A, 0x06, 0x0F, 0x00, 0x00, 0x00, 0xF6, 0x00
	.byte 0xEB, 0x01, 0x89, 0x01, 0x09, 0x04, 0x09, 0x04, 0x26, 0x00, 0xB9, 0xB3, 0x00, 0x02, 0x08, 0xF6
	.byte 0x26, 0x07, 0x0F, 0x00, 0x00, 0x00, 0xF7, 0x00, 0xEC, 0x01, 0x8A, 0x01, 0x0C, 0x04, 0x0C, 0x04
	.byte 0x27, 0x00, 0xBA, 0xB3, 0x00, 0x02, 0x08, 0xF6, 0x27, 0x07, 0x0F, 0x00, 0x00, 0x00, 0xF9, 0x00
	.byte 0xEE, 0x01, 0x8C, 0x01, 0x0C, 0x04, 0x0C, 0x04, 0x28, 0x00, 0xBB, 0xB3, 0x00, 0x02, 0x08, 0xF6
	.byte 0x34, 0x08, 0x0F, 0x00, 0x00, 0x00, 0xFC, 0x00, 0xF1, 0x01, 0x8F, 0x01, 0x0D, 0x04, 0x0D, 0x04
	.byte 0x29, 0x00, 0xBE, 0xB3, 0x00, 0x02, 0x08, 0xF6, 0x39, 0x08, 0x0F, 0x00, 0x00, 0x00, 0xFE, 0x00
	.byte 0xF3, 0x01, 0x91, 0x01, 0x0D, 0x04, 0x0D, 0x04, 0x2A, 0x00, 0xBF, 0xB3, 0x00, 0x02, 0x08, 0xF6
	.byte 0x3B, 0x08, 0x0F, 0x00, 0x00, 0x00, 0x01, 0x01, 0xF6, 0x01, 0x94, 0x01, 0x0D, 0x04, 0x0D, 0x04
	.byte 0x2B, 0x00, 0xC0, 0xB3, 0x00, 0x02, 0x08, 0xF6, 0x43, 0x09, 0x0F, 0x00, 0x00, 0x00, 0x02, 0x01
	.byte 0xF7, 0x01, 0x95, 0x01, 0x0B, 0x04, 0x0B, 0x04, 0x2C, 0x00, 0xC1, 0xB3, 0x00, 0x02, 0x08, 0xF6
	.byte 0x44, 0x09, 0x0F, 0x00, 0x00, 0x00, 0x03, 0x01, 0xF8, 0x01, 0x96, 0x01, 0x0B, 0x04, 0x0B, 0x04
	.byte 0x2D, 0x00, 0xC2, 0xB3, 0x00, 0x02, 0x08, 0xF6, 0x5F, 0x12, 0x0F, 0x00, 0x00, 0x00, 0xDF, 0x02
	.byte 0xFC, 0x01, 0xBE, 0x01, 0x16, 0x04, 0x16, 0x04, 0x2E, 0x00, 0x8A, 0xC2, 0x01, 0x01, 0x08, 0xF6
	.byte 0x60, 0x0A, 0x0F, 0x00, 0x00, 0x00, 0xE5, 0x02, 0x02, 0x02, 0xC4, 0x01, 0x15, 0x04, 0x15, 0x04
	.byte 0x2F, 0x00, 0x8B, 0xC1, 0x01, 0x01, 0x28, 0xF6, 0xFF, 0x11, 0x0F, 0x00, 0x00, 0x00, 0xEE, 0x02
	.byte 0x0B, 0x02, 0xCC, 0x01, 0x14, 0x04, 0x14, 0x04, 0x30, 0x00, 0x8C, 0xC1, 0x01, 0x01, 0x28, 0xF6
	.byte 0x61, 0x0D, 0x0F, 0x00, 0x00, 0x00, 0xF6, 0x02, 0x13, 0x02, 0xD3, 0x01, 0x10, 0x04, 0x10, 0x04
	.byte 0x31, 0x00, 0x8D, 0xC1, 0x01, 0x01, 0x28, 0xF6, 0xFF, 0x0E, 0x0F, 0x00, 0x00, 0x00, 0xFF, 0x02
	.byte 0x1C, 0x02, 0xDB, 0x01, 0x11, 0x04, 0x11, 0x04, 0x32, 0x00, 0x8E, 0xC2, 0x01, 0x01, 0x28, 0xF6
	.byte 0x62, 0x0B, 0x0F, 0x00, 0x00, 0x00, 0x08, 0x03, 0x25, 0x02, 0xE3, 0x01, 0x0E, 0x04, 0x0E, 0x04
	.byte 0x33, 0x00, 0x8F, 0xC1, 0x01, 0x01, 0x28, 0xF6, 0x63, 0x0F, 0x0F, 0x00, 0x00, 0x00, 0x11, 0x03
	.byte 0x2E, 0x02, 0xEB, 0x01, 0x12, 0x04, 0x12, 0x04, 0x34, 0x00, 0x90, 0xC1, 0x01, 0x01, 0x28, 0xF6
	.byte 0x64, 0x10, 0x0F, 0x00, 0x00, 0x00, 0x27, 0x03, 0x44, 0x02, 0x00, 0x02, 0x13, 0x04, 0x13, 0x04
	.byte 0x35, 0x00, 0x91, 0xC1, 0x01, 0x01, 0x28, 0xF6, 0x65, 0x12, 0x0F, 0x00, 0x00, 0x00, 0x2F, 0x03
	.byte 0x4C, 0x02, 0x07, 0x02, 0x17, 0x04, 0x17, 0x04, 0x36, 0x00, 0x92, 0xC2, 0x01, 0x01, 0x28, 0xF6
	.byte 0xFF, 0x0A, 0x0F, 0x00, 0x00, 0x00, 0x32, 0x03, 0x4F, 0x02, 0x09, 0x02, 0x3D, 0x04, 0x3D, 0x04
	.byte 0x37, 0x00, 0x93, 0xC3, 0x01, 0x02, 0x28, 0xF6, 0xFF, 0x0C, 0x0F, 0x00, 0x00, 0x00, 0x3B, 0x03
	.byte 0x58, 0x02, 0x11, 0x02, 0x0F, 0x04, 0x0F, 0x04, 0x38, 0x00, 0x94, 0xC1, 0x01, 0x01, 0x28, 0xF6
	.byte 0x00, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x4A, 0x03, 0x67, 0x02, 0x1E, 0x02, 0xFA, 0x03, 0xFA, 0x03
	.byte 0x39, 0x00, 0x7E, 0x02, 0x00, 0x01, 0x08, 0xF6, 0xFF, 0x19, 0x5F, 0x31, 0x64, 0x00, 0x4B, 0x03
	.byte 0x68, 0x02, 0x1F, 0x02, 0x2A, 0x04, 0x2A, 0x04, 0x3A, 0x00, 0x7E, 0x09, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x5F, 0x31, 0x65, 0x00, 0x4C, 0x03, 0x69, 0x02, 0x20, 0x02, 0xFA, 0x03, 0xFA, 0x03
	.byte 0x3B, 0x00, 0x7E, 0x09, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x5F, 0x31, 0x47, 0x00, 0x4D, 0x03
	.byte 0x6A, 0x02, 0x21, 0x02, 0xFA, 0x03, 0xFA, 0x03, 0x3C, 0x00, 0x7E, 0x09, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x5F, 0x31, 0x48, 0x00, 0x4E, 0x03, 0x6B, 0x02, 0x22, 0x02, 0xFA, 0x03, 0xFA, 0x03
	.byte 0x3D, 0x00, 0x7E, 0x09, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x5F, 0x31, 0x42, 0x00, 0x4F, 0x03
	.byte 0x6C, 0x02, 0x23, 0x02, 0xFA, 0x03, 0xFA, 0x03, 0x3E, 0x00, 0x7E, 0x09, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x5F, 0x31, 0x47, 0x00, 0x50, 0x03, 0x6D, 0x02, 0x24, 0x02, 0xFA, 0x03, 0xFA, 0x03
	.byte 0x3F, 0x00, 0x7E, 0x09, 0x00, 0x44, 0x64, 0xE4, 0x02, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x52, 0x03
	.byte 0x6F, 0x02, 0x26, 0x02, 0xFB, 0x03, 0xFB, 0x03, 0x40, 0x00, 0x7F, 0x11, 0x00, 0x01, 0x08, 0xF6
	.byte 0xFF, 0x1B, 0x1F, 0x31, 0x68, 0x00, 0x53, 0x03, 0x70, 0x02, 0x27, 0x02, 0x28, 0x04, 0x28, 0x04
	.byte 0x41, 0x00, 0x7F, 0x19, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0x1F, 0x31, 0x49, 0x00, 0x54, 0x03
	.byte 0x71, 0x02, 0x28, 0x02, 0x27, 0x04, 0x27, 0x04, 0x42, 0x00, 0x7F, 0x19, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x0F, 0x31, 0x61, 0x00, 0x56, 0x03, 0x73, 0x02, 0x29, 0x02, 0xFB, 0x03, 0xFB, 0x03
	.byte 0x43, 0x00, 0x7F, 0x19, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x1F, 0x31, 0x60, 0x00, 0x57, 0x03
	.byte 0x74, 0x02, 0x2A, 0x02, 0xFB, 0x03, 0xFB, 0x03, 0x44, 0x00, 0x7F, 0x19, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x1F, 0x31, 0x61, 0x00, 0x58, 0x03, 0x75, 0x02, 0x2B, 0x02, 0xFB, 0x03, 0xFB, 0x03
	.byte 0x45, 0x00, 0x7F, 0x19, 0x00, 0x44, 0x64, 0xE4, 0x05, 0x03, 0x0F, 0x00, 0x00, 0x00, 0x59, 0x03
	.byte 0x76, 0x02, 0x2C, 0x02, 0xFC, 0x03, 0xFC, 0x03, 0x46, 0x00, 0x80, 0x21, 0x00, 0x01, 0x28, 0xF6
	.byte 0xFF, 0x04, 0x0F, 0x00, 0x00, 0x00, 0x62, 0x03, 0x7F, 0x02, 0x34, 0x02, 0xFD, 0x03, 0xFD, 0x03
	.byte 0x47, 0x00, 0x81, 0x32, 0x00, 0x01, 0x08, 0xF6, 0x33, 0x07, 0x0F, 0x00, 0x00, 0x00, 0x6B, 0x03
	.byte 0x88, 0x02, 0x3C, 0x02, 0x01, 0x04, 0x01, 0x04, 0x48, 0x00, 0x82, 0x41, 0x00, 0x01, 0x28, 0xF6
	.byte 0xFF, 0x05, 0x0F, 0x00, 0x00, 0x00, 0x75, 0x03, 0x92, 0x02, 0x45, 0x02, 0xFE, 0x03, 0xFE, 0x03
	.byte 0x49, 0x00, 0x83, 0x51, 0x00, 0x01, 0x28, 0xF6, 0x28, 0x07, 0x0F, 0x00, 0x00, 0x00, 0x8F, 0x03
	.byte 0xAC, 0x02, 0x5C, 0x02, 0x00, 0x04, 0x00, 0x04, 0x4A, 0x00, 0x84, 0x61, 0x00, 0x01, 0x28, 0xF6
	.byte 0x1B, 0x06, 0x0F, 0x00, 0x00, 0x00, 0x98, 0x03, 0xB5, 0x02, 0x64, 0x02, 0xFF, 0x03, 0xFF, 0x03
	.byte 0x4B, 0x00, 0x85, 0x71, 0x00, 0x01, 0x28, 0xF6, 0xFF, 0x1B, 0xCF, 0x14, 0x68, 0x00, 0x99, 0x03
	.byte 0xB6, 0x02, 0x65, 0x02, 0x28, 0x04, 0x28, 0x04, 0x4C, 0x00, 0x85, 0x79, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1F, 0xBF, 0x14, 0x5A, 0x00, 0x9A, 0x03, 0xB7, 0x02, 0x66, 0x02, 0x29, 0x04, 0x29, 0x04
	.byte 0x4D, 0x00, 0x85, 0x79, 0x00, 0x04, 0x64, 0xA4, 0xFF, 0x1A, 0xCF, 0x14, 0x49, 0x00, 0x9B, 0x03
	.byte 0xB8, 0x02, 0x67, 0x02, 0x27, 0x04, 0x27, 0x04, 0x4E, 0x00, 0x85, 0x79, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x0F, 0x00, 0x42, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0xFF, 0x03, 0xFF, 0x03
	.byte 0x4F, 0x00, 0x06, 0x79, 0x00, 0x44, 0x64, 0xE0, 0xFF, 0x3D, 0xCF, 0x10, 0x44, 0x00, 0x9E, 0x03
	.byte 0xBB, 0x02, 0x68, 0x02, 0xFF, 0x03, 0xFF, 0x03, 0x50, 0x00, 0x85, 0x79, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0xBF, 0x14, 0x42, 0x00, 0xA1, 0x03, 0xBE, 0x02, 0x6B, 0x02, 0xFF, 0x03, 0xFF, 0x03
	.byte 0x51, 0x00, 0x85, 0x79, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0xBF, 0x14, 0x42, 0x00, 0x9F, 0x03
	.byte 0xBC, 0x02, 0x69, 0x02, 0xFF, 0x03, 0xFF, 0x03, 0x52, 0x00, 0x85, 0x79, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x3D, 0xCF, 0x14, 0x7E, 0x00, 0xA0, 0x03, 0xBD, 0x02, 0x6A, 0x02, 0x2C, 0x04, 0x2C, 0x04
	.byte 0x53, 0x00, 0x85, 0x79, 0x00, 0xF4, 0x64, 0xE4, 0xFF, 0x08, 0x0F, 0x00, 0x00, 0x00, 0xA2, 0x03
	.byte 0xBF, 0x02, 0x6C, 0x02, 0x02, 0x04, 0x02, 0x04, 0x54, 0x00, 0x86, 0xA2, 0x00, 0x01, 0x08, 0xF6
	.byte 0x3A, 0x08, 0x0F, 0x00, 0x00, 0x00, 0xAA, 0x03, 0xC7, 0x02, 0x72, 0x02, 0x0D, 0x04, 0x0D, 0x04
	.byte 0x55, 0x00, 0x87, 0x98, 0x02, 0x02, 0x08, 0xF6, 0x41, 0x09, 0x0F, 0x00, 0x00, 0x00, 0xAD, 0x03
	.byte 0xCA, 0x02, 0x75, 0x02, 0x03, 0x04, 0x03, 0x04, 0x56, 0x00, 0x88, 0xA1, 0x00, 0x01, 0x08, 0xF6
	.byte 0x55, 0x0A, 0x0F, 0x00, 0x00, 0x00, 0xB5, 0x03, 0xD2, 0x02, 0x7C, 0x02, 0x3D, 0x04, 0x3D, 0x04
	.byte 0x57, 0x00, 0x89, 0x93, 0x00, 0x01, 0x08, 0xF6, 0x5D, 0x12, 0x0F, 0x00, 0x00, 0x00, 0xBE, 0x03
	.byte 0xD7, 0x02, 0xE4, 0x02, 0x20, 0x04, 0x20, 0x04, 0x58, 0x00, 0xA7, 0xC6, 0x01, 0x02, 0x08, 0xF6
	.byte 0x5E, 0x12, 0x0F, 0x00, 0x00, 0x00, 0xC0, 0x03, 0xD9, 0x02, 0xE6, 0x02, 0x20, 0x04, 0x20, 0x04
	.byte 0x59, 0x00, 0xA8, 0xC6, 0x01, 0x02, 0x18, 0xF6, 0x80, 0x12, 0x0F, 0x00, 0x00, 0x00, 0xC1, 0x03
	.byte 0xDA, 0x02, 0xE7, 0x02, 0x22, 0x04, 0x22, 0x04, 0x5A, 0x00, 0xA9, 0xC6, 0x01, 0x02, 0x18, 0xF6
	.byte 0x29, 0x07, 0x0F, 0x00, 0x00, 0x00, 0xC2, 0x03, 0xDB, 0x02, 0xE8, 0x02, 0x0A, 0x04, 0x0A, 0x04
	.byte 0x5B, 0x00, 0xBC, 0xB6, 0x00, 0x02, 0x18, 0xF6, 0x2A, 0x07, 0x0F, 0x00, 0x00, 0x00, 0xC4, 0x03
	.byte 0xDD, 0x02, 0xEA, 0x02, 0x0A, 0x04, 0x0A, 0x04, 0x5C, 0x00, 0xBD, 0xB6, 0x00, 0x02, 0x18, 0xF6
	.byte 0x17, 0x47, 0xBF, 0x1C, 0x1B, 0x00, 0x19, 0x00, 0x1E, 0x01, 0x3E, 0x00, 0x33, 0x04, 0x33, 0x04
	.byte 0x5D, 0x00, 0xCF, 0x97, 0x00, 0x01, 0x08, 0xF6, 0xFF, 0x3F, 0x0F, 0x21, 0x46, 0x00, 0xE7, 0x00
	.byte 0xDC, 0x01, 0x7B, 0x01, 0x05, 0x04, 0x05, 0x04, 0x5E, 0x00, 0xB3, 0xA9, 0x00, 0x44, 0x64, 0xE6
	.byte 0xFF, 0x3F, 0xEF, 0x24, 0x46, 0x00, 0xEB, 0x00, 0xE0, 0x01, 0x7E, 0x01, 0x06, 0x04, 0x06, 0x04
	.byte 0x5F, 0x00, 0xB4, 0xA9, 0x00, 0x44, 0x64, 0xE6, 0x0E, 0x57, 0xEF, 0x34, 0x2A, 0x00, 0x38, 0x00
	.byte 0x3D, 0x01, 0x57, 0x00, 0x31, 0x04, 0x31, 0x04, 0x60, 0x00, 0xD2, 0x84, 0x00, 0x03, 0x98, 0xEE
	.byte 0xFF, 0x3F, 0xBF, 0x38, 0x46, 0x00, 0x68, 0x03, 0x85, 0x02, 0x39, 0x02, 0x09, 0x04, 0x09, 0x04
	.byte 0x61, 0x00, 0x81, 0x39, 0x00, 0x44, 0x64, 0xE6, 0xFF, 0x3F, 0xBF, 0x24, 0x45, 0x00, 0xF1, 0x00
	.byte 0xE6, 0x01, 0x84, 0x01, 0x09, 0x04, 0x09, 0x04, 0x62, 0x00, 0xB7, 0xA9, 0x00, 0x44, 0x64, 0xE6
	.byte 0xFF, 0x3F, 0xBF, 0x20, 0xC4, 0x00, 0xF2, 0x00, 0xE7, 0x01, 0x85, 0x01, 0x09, 0x04, 0x09, 0x04
	.byte 0x63, 0x00, 0xB7, 0xA9, 0x00, 0x44, 0x64, 0xE6, 0xFF, 0x3F, 0xDF, 0x1C, 0x45, 0x00, 0xF4, 0x00
	.byte 0xE9, 0x01, 0x87, 0x01, 0x09, 0x04, 0x09, 0x04, 0x64, 0x00, 0xB8, 0xA9, 0x00, 0x44, 0x64, 0xE6
	.byte 0xFF, 0x3F, 0xCF, 0x1C, 0x46, 0x00, 0xF5, 0x00, 0xEA, 0x01, 0x88, 0x01, 0x09, 0x04, 0x09, 0x04
	.byte 0x65, 0x00, 0xB8, 0xA9, 0x00, 0x44, 0x64, 0xE6, 0xFF, 0x3F, 0x0F, 0x00, 0x46, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x09, 0x04, 0x09, 0x04, 0x66, 0x00, 0x06, 0x79, 0x00, 0x44, 0x64, 0xE0
	.byte 0x85, 0x52, 0x0F, 0x12, 0x02, 0x00, 0x05, 0x00, 0x0A, 0x01, 0x2F, 0x00, 0x3A, 0x04, 0x3A, 0x04
	.byte 0x67, 0x00, 0xC5, 0xC4, 0x01, 0x03, 0xA8, 0xEE, 0x6A, 0x46, 0x4F, 0x0E, 0x03, 0x00, 0x07, 0x00
	.byte 0x0C, 0x01, 0x31, 0x00, 0x31, 0x04, 0x31, 0x04, 0x68, 0x00, 0xC6, 0xC4, 0x01, 0x03, 0x78, 0xEE
	.byte 0x6C, 0x53, 0xCF, 0x12, 0x06, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x3A, 0x04, 0x3A, 0x04
	.byte 0x69, 0x00, 0xC8, 0xC4, 0x17, 0x03, 0x98, 0xEE, 0xFF, 0x4B, 0x5F, 0x32, 0x08, 0x00, 0x0C, 0x00
	.byte 0x11, 0x01, 0x34, 0x00, 0x87, 0x04, 0x87, 0x04, 0x6A, 0x00, 0x37, 0x87, 0x01, 0x02, 0x08, 0xA6
	.byte 0xFF, 0x4D, 0xFF, 0x1C, 0x0C, 0x00, 0x10, 0x00, 0x15, 0x01, 0x36, 0x00, 0x30, 0x04, 0x30, 0x04
	.byte 0x6B, 0x00, 0xCC, 0x94, 0x00, 0x03, 0x88, 0xEC, 0xFF, 0x4D, 0xCF, 0x10, 0x0F, 0x00, 0x13, 0x00
	.byte 0x18, 0x01, 0x39, 0x00, 0x35, 0x04, 0x35, 0x04, 0x6C, 0x00, 0xCD, 0x94, 0x00, 0x03, 0x88, 0xEC
	.byte 0xFF, 0x24, 0xAF, 0x28, 0x1C, 0x00, 0x1D, 0x00, 0x22, 0x01, 0x41, 0x00, 0xFE, 0x03, 0xFE, 0x03
	.byte 0x6D, 0x00, 0xD0, 0x99, 0x00, 0x44, 0x64, 0xE4, 0x09, 0x14, 0x0F, 0x00, 0x00, 0x00, 0x25, 0x00
	.byte 0x2A, 0x01, 0x48, 0x00, 0x31, 0x04, 0x31, 0x04, 0x6E, 0x00, 0xD1, 0x94, 0x00, 0x02, 0x48, 0xF6
	.byte 0xFF, 0x54, 0xDF, 0x38, 0x2D, 0x00, 0x3B, 0x00, 0x40, 0x01, 0x5A, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0x6F, 0x00, 0xD3, 0xB4, 0x00, 0x03, 0x98, 0xEE, 0xFF, 0x2F, 0x9F, 0x20, 0x2F, 0x00, 0x3E, 0x00
	.byte 0x43, 0x01, 0x5D, 0x00, 0x36, 0x04, 0x36, 0x04, 0x70, 0x00, 0xD4, 0x99, 0x00, 0x03, 0x64, 0xEC
	.byte 0xFF, 0x1B, 0x0F, 0x15, 0x8A, 0x00, 0x58, 0x00, 0x5D, 0x01, 0x6F, 0x00, 0x02, 0x04, 0x02, 0x04
	.byte 0x71, 0x00, 0x86, 0xA9, 0x00, 0x44, 0x64, 0xE4, 0x14, 0x4A, 0xBF, 0x38, 0x38, 0x00, 0x5C, 0x00
	.byte 0x61, 0x01, 0x73, 0x00, 0x31, 0x04, 0x31, 0x04, 0x72, 0x00, 0xD6, 0xB5, 0x00, 0x03, 0x38, 0xEE
	.byte 0xFF, 0x3E, 0xAF, 0x2C, 0x39, 0x00, 0x5D, 0x00, 0x62, 0x01, 0x74, 0x00, 0xFE, 0x03, 0xFE, 0x03
	.byte 0x73, 0x00, 0xD7, 0x59, 0x00, 0x44, 0x64, 0xE4, 0x35, 0x4F, 0xEF, 0x14, 0x3E, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x31, 0x04, 0x31, 0x04, 0x74, 0x00, 0xD8, 0x84, 0x00, 0x03, 0x98, 0xEE
	.byte 0x3C, 0x4C, 0x5F, 0x11, 0x84, 0x00, 0x63, 0x00, 0x68, 0x01, 0x7A, 0x00, 0x38, 0x04, 0x38, 0x04
	.byte 0x75, 0x00, 0xD9, 0x84, 0x00, 0x03, 0x98, 0xEE, 0x2B, 0x55, 0x7F, 0x2C, 0x8D, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x31, 0x04, 0x31, 0x04, 0x76, 0x00, 0xDA, 0xB4, 0x16, 0x03, 0x98, 0xEE
	.byte 0x56, 0x50, 0x9F, 0x21, 0x09, 0x01, 0x69, 0x00, 0x6E, 0x01, 0x03, 0x00, 0x36, 0x04, 0x36, 0x04
	.byte 0x77, 0x00, 0xDB, 0xA4, 0x00, 0x03, 0x98, 0xEE, 0x46, 0x57, 0x4F, 0x19, 0x62, 0x00, 0x6C, 0x00
	.byte 0x71, 0x01, 0x7F, 0x00, 0x38, 0x04, 0x38, 0x04, 0x78, 0x00, 0xDC, 0x84, 0x16, 0x03, 0x98, 0xEE
	.byte 0x6E, 0x46, 0xCF, 0x1D, 0xA1, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x3C, 0x04, 0x3C, 0x04
	.byte 0x79, 0x00, 0xDD, 0xB4, 0x01, 0x03, 0xB8, 0xEE, 0xFF, 0x56, 0x4F, 0x11, 0x91, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x39, 0x04, 0x39, 0x04, 0x7A, 0x00, 0xDE, 0xB4, 0x00, 0x03, 0x98, 0xEE
	.byte 0x84, 0x46, 0x7F, 0x31, 0x97, 0x00, 0x71, 0x00, 0x76, 0x01, 0x03, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0x7B, 0x00, 0xDF, 0xB4, 0x01, 0x03, 0x98, 0xEE, 0xFF, 0x19, 0x1F, 0x2D, 0x42, 0x00, 0xE4, 0x00
	.byte 0xD9, 0x01, 0x78, 0x01, 0x05, 0x04, 0x05, 0x04, 0x7C, 0x00, 0xB2, 0xA9, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0xCF, 0x14, 0x4A, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0x7D, 0x00, 0x85, 0x79, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0xCF, 0x14, 0x4B, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0x7E, 0x00, 0x85, 0x79, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0xCF, 0x14, 0x4C, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0x00, 0x00, 0x85, 0x79, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0xCF, 0x14, 0x4D, 0x00, 0x9C, 0x03
	.byte 0xB9, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0x7F, 0x00, 0x85, 0x79, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x3F, 0xDF, 0x14, 0x46, 0x00, 0xFD, 0x00, 0xF2, 0x01, 0x90, 0x01, 0x0D, 0x04, 0x0D, 0x04
	.byte 0x80, 0x00, 0xBE, 0xA9, 0x00, 0x44, 0x64, 0xE6, 0xFF, 0x19, 0x0F, 0x15, 0x5F, 0x00, 0xA9, 0x03
	.byte 0xC6, 0x02, 0x71, 0x02, 0x02, 0x04, 0x02, 0x04, 0x81, 0x00, 0x86, 0xA9, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x3F, 0x3F, 0x31, 0x45, 0x00, 0xE2, 0x00, 0xD7, 0x01, 0x76, 0x01, 0x04, 0x04, 0x04, 0x04
	.byte 0x82, 0x00, 0xB1, 0xA9, 0x00, 0x44, 0x64, 0xE6, 0xFF, 0x1C, 0xEF, 0x20, 0x57, 0x00, 0x5B, 0x03
	.byte 0x78, 0x02, 0x2E, 0x02, 0x29, 0x04, 0x29, 0x04, 0x83, 0x00, 0x80, 0x29, 0x00, 0x14, 0x64, 0xA4
	.byte 0xFF, 0x1D, 0xCF, 0x38, 0x58, 0x00, 0x64, 0x03, 0x81, 0x02, 0x36, 0x02, 0x29, 0x04, 0x29, 0x04
	.byte 0x84, 0x00, 0x81, 0x39, 0x00, 0x44, 0x64, 0xA4, 0xFF, 0x1E, 0xBF, 0x28, 0x59, 0x00, 0x76, 0x03
	.byte 0x93, 0x02, 0x46, 0x02, 0x29, 0x04, 0x29, 0x04, 0x85, 0x00, 0x83, 0x59, 0x00, 0x24, 0x64, 0xA4
	.byte 0xFF, 0x20, 0x8F, 0x1C, 0x5B, 0x00, 0x91, 0x03, 0xAE, 0x02, 0x5E, 0x02, 0x29, 0x04, 0x29, 0x04
	.byte 0x86, 0x00, 0x84, 0x69, 0x00, 0x44, 0x64, 0xA4, 0xFF, 0x21, 0x5F, 0x2C, 0x5C, 0x00, 0x6D, 0x03
	.byte 0x8A, 0x02, 0x3E, 0x02, 0x29, 0x04, 0x29, 0x04, 0x87, 0x00, 0x82, 0x49, 0x00, 0x04, 0x74, 0xA4
	.byte 0xFF, 0x22, 0x0F, 0x15, 0xE5, 0x00, 0xA4, 0x03, 0xC1, 0x02, 0x6E, 0x02, 0x29, 0x04, 0x29, 0x04
	.byte 0x88, 0x00, 0x86, 0xA9, 0x00, 0x04, 0x74, 0xA4, 0xFF, 0x23, 0x4F, 0x11, 0x5E, 0x00, 0xAF, 0x03
	.byte 0xCC, 0x02, 0x77, 0x02, 0x29, 0x04, 0x29, 0x04, 0x89, 0x00, 0x88, 0xA9, 0x00, 0x04, 0x64, 0xA4
	.byte 0xFF, 0x3F, 0x0F, 0x11, 0x45, 0x00, 0xFF, 0x00, 0xF4, 0x01, 0x92, 0x01, 0x0D, 0x04, 0x0D, 0x04
	.byte 0x8A, 0x00, 0xBF, 0xA9, 0x00, 0x44, 0x64, 0xE6, 0xFF, 0x3D, 0x1F, 0x25, 0x67, 0x00, 0xE5, 0x00
	.byte 0xDA, 0x01, 0x79, 0x01, 0x05, 0x04, 0x05, 0x04, 0x8B, 0x00, 0xB2, 0xA9, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0x1F, 0x31, 0x4D, 0x00, 0x55, 0x03, 0x72, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0x8C, 0x00, 0x7F, 0x19, 0x00, 0x44, 0x64, 0xE4, 0x8B, 0x49, 0x8F, 0x0E, 0x4E, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x3A, 0x04, 0x3A, 0x04, 0x8D, 0x00, 0xC7, 0xA4, 0x17, 0x03, 0x98, 0xEE
	.byte 0x4A, 0x46, 0x3F, 0x3E, 0x51, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x38, 0x04, 0x38, 0x04
	.byte 0x8E, 0x00, 0xCB, 0xA4, 0x01, 0x03, 0x98, 0xEE, 0x89, 0x67, 0x0F, 0x16, 0x56, 0x00, 0x73, 0x00
	.byte 0x78, 0x01, 0x84, 0x00, 0x3B, 0x04, 0x3B, 0x04, 0x8F, 0x00, 0xE0, 0xA5, 0x01, 0x03, 0x38, 0xEE
	.byte 0xFF, 0x19, 0x0F, 0x00, 0x42, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x14, 0x04, 0x14, 0x04
	.byte 0x00, 0x00, 0xC9, 0xC9, 0x01, 0x44, 0x64, 0xE0, 0xFF, 0x3F, 0xDF, 0x1C, 0x46, 0x00, 0x61, 0x03
	.byte 0x7E, 0x02, 0x33, 0x02, 0x09, 0x04, 0x09, 0x04, 0x90, 0x00, 0xB8, 0x29, 0x00, 0x44, 0x64, 0xE6
	.byte 0xFF, 0x3F, 0xBF, 0x1C, 0x45, 0x00, 0x1C, 0x00, 0x21, 0x01, 0x40, 0x00, 0x6E, 0x04, 0x6E, 0x04
	.byte 0x91, 0x00, 0xE1, 0x99, 0x00, 0x44, 0x64, 0xE4, 0x47, 0x13, 0x0F, 0x00, 0x00, 0x00, 0x04, 0x01
	.byte 0xF9, 0x01, 0x97, 0x01, 0x85, 0x04, 0x85, 0x04, 0x92, 0x00, 0xC3, 0xA3, 0x00, 0x02, 0x48, 0xF6
	.byte 0x66, 0x13, 0x0F, 0x00, 0x00, 0x00, 0x05, 0x01, 0xFA, 0x01, 0x98, 0x01, 0x85, 0x04, 0x85, 0x04
	.byte 0x93, 0x00, 0xC4, 0xA3, 0x00, 0x02, 0x48, 0xF6, 0x0F, 0x57, 0xEF, 0x34, 0x2B, 0x00, 0x39, 0x00
	.byte 0x3E, 0x01, 0x58, 0x00, 0x31, 0x04, 0x31, 0x04, 0x94, 0x00, 0xD2, 0x84, 0x00, 0x03, 0xA8, 0xEE
	.byte 0x10, 0x57, 0xEF, 0x34, 0x2C, 0x00, 0x3A, 0x00, 0x3F, 0x01, 0x59, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0x95, 0x00, 0xD2, 0x84, 0x00, 0x03, 0xB8, 0xEE, 0x06, 0x4D, 0xFF, 0x1C, 0x0D, 0x00, 0x11, 0x00
	.byte 0x16, 0x01, 0x37, 0x00, 0x30, 0x04, 0x30, 0x04, 0x96, 0x00, 0xCC, 0x94, 0x00, 0x03, 0x88, 0xEC
	.byte 0x07, 0x4D, 0xFF, 0x1C, 0x0E, 0x00, 0x12, 0x00, 0x17, 0x01, 0x38, 0x00, 0x30, 0x04, 0x30, 0x04
	.byte 0x97, 0x00, 0xCC, 0x94, 0x00, 0x03, 0x88, 0xEC, 0xFF, 0x1B, 0xEF, 0x20, 0x68, 0x00, 0x5A, 0x03
	.byte 0x77, 0x02, 0x2D, 0x02, 0x28, 0x04, 0x28, 0x04, 0x98, 0x00, 0x80, 0x29, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0xFF, 0x20, 0x49, 0x00, 0x5C, 0x03, 0x79, 0x02, 0x2F, 0x02, 0x27, 0x04, 0x27, 0x04
	.byte 0x99, 0x00, 0x80, 0x29, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x3D, 0xFF, 0x20, 0x66, 0x00, 0x5E, 0x03
	.byte 0x7B, 0x02, 0x30, 0x02, 0xFC, 0x03, 0xFC, 0x03, 0x9A, 0x00, 0x80, 0x29, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0xEF, 0x20, 0x5F, 0x00, 0x5F, 0x03, 0x7C, 0x02, 0x31, 0x02, 0xFC, 0x03, 0xFC, 0x03
	.byte 0x9B, 0x00, 0x80, 0x29, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x0F, 0x00, 0x42, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0xFB, 0x03, 0xFB, 0x03, 0x00, 0x00, 0x06, 0x30, 0x00, 0x44, 0x64, 0xE0
	.byte 0xFF, 0x19, 0xFF, 0x20, 0x5F, 0x00, 0x60, 0x03, 0x7D, 0x02, 0x32, 0x02, 0xFC, 0x03, 0xFC, 0x03
	.byte 0x9C, 0x00, 0x80, 0x29, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x3D, 0xDF, 0x38, 0x7D, 0x00, 0x69, 0x03
	.byte 0x86, 0x02, 0x3A, 0x02, 0xFD, 0x03, 0xFD, 0x03, 0x9D, 0x00, 0x81, 0x39, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x3D, 0xCF, 0x38, 0x7F, 0x00, 0x6A, 0x03, 0x87, 0x02, 0x3B, 0x02, 0xFD, 0x03, 0xFD, 0x03
	.byte 0x9E, 0x00, 0x81, 0x39, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1B, 0xDF, 0x38, 0x68, 0x00, 0x63, 0x03
	.byte 0x80, 0x02, 0x35, 0x02, 0x28, 0x04, 0x28, 0x04, 0x9F, 0x00, 0x81, 0x39, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0xCF, 0x38, 0x49, 0x00, 0x66, 0x03, 0x83, 0x02, 0x38, 0x02, 0x27, 0x04, 0x27, 0x04
	.byte 0xA0, 0x00, 0x81, 0x39, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0xFF, 0x20, 0x4D, 0x00, 0x5D, 0x03
	.byte 0x7A, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0xA1, 0x00, 0x80, 0x29, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0xCF, 0x38, 0x4D, 0x00, 0x67, 0x03, 0x84, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0xA2, 0x00, 0x81, 0x39, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0xEF, 0x34, 0x49, 0x00, 0xE9, 0x00
	.byte 0xDE, 0x01, 0x7D, 0x01, 0x27, 0x04, 0x27, 0x04, 0xA3, 0x00, 0xB4, 0xA9, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0xEF, 0x34, 0x4D, 0x00, 0xEA, 0x00, 0xDF, 0x01, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0xA4, 0x00, 0xB4, 0xA9, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x3F, 0xBF, 0x38, 0x45, 0x00, 0xEF, 0x00
	.byte 0xE4, 0x01, 0x82, 0x01, 0x08, 0x04, 0x08, 0x04, 0xA5, 0x00, 0xB6, 0xA9, 0x00, 0x44, 0x64, 0xE6
	.byte 0xFF, 0x3F, 0xAF, 0x14, 0x46, 0x00, 0xF8, 0x00, 0xED, 0x01, 0x8B, 0x01, 0x0C, 0x04, 0x0C, 0x04
	.byte 0xA6, 0x00, 0xBA, 0xA9, 0x00, 0x44, 0x64, 0xE6, 0xFF, 0x27, 0x2F, 0x20, 0xE3, 0x00, 0x77, 0x00
	.byte 0x7C, 0x01, 0x87, 0x00, 0x86, 0x04, 0x86, 0x04, 0xA7, 0x00, 0xE3, 0x87, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x13, 0x0F, 0x00, 0x00, 0x00, 0x74, 0x00, 0x79, 0x01, 0x85, 0x00, 0x86, 0x04, 0x86, 0x04
	.byte 0xA8, 0x00, 0xE3, 0x83, 0x00, 0x02, 0x08, 0xF6, 0xFF, 0x19, 0x0F, 0x00, 0x42, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0xFF, 0x03, 0xFF, 0x03, 0x00, 0x00, 0x06, 0x79, 0x00, 0x44, 0x64, 0xE0
	.byte 0x45, 0x57, 0x1F, 0x21, 0x63, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x38, 0x04, 0x38, 0x04
	.byte 0xA9, 0x00, 0xDC, 0x84, 0x16, 0x03, 0x98, 0xEE, 0x12, 0x54, 0xDF, 0x38, 0x2E, 0x00, 0x3C, 0x00
	.byte 0x41, 0x01, 0x5B, 0x00, 0x31, 0x04, 0x31, 0x04, 0xAA, 0x00, 0xD3, 0xB4, 0x00, 0x03, 0xA8, 0xEE
	.byte 0x86, 0x46, 0xCF, 0x1D, 0xA2, 0x00, 0x6D, 0x00, 0x72, 0x01, 0x03, 0x00, 0x3C, 0x04, 0x3C, 0x04
	.byte 0xAB, 0x00, 0xDD, 0xB4, 0x01, 0x03, 0xA8, 0xEE, 0x87, 0x46, 0xCF, 0x1D, 0xA3, 0x00, 0x6E, 0x00
	.byte 0x73, 0x01, 0x80, 0x00, 0x3C, 0x04, 0x3C, 0x04, 0xAC, 0x00, 0xDD, 0xB4, 0x01, 0x03, 0xB8, 0xEE
	.byte 0xFF, 0x1D, 0xCF, 0x38, 0x69, 0x00, 0x65, 0x03, 0x82, 0x02, 0x37, 0x02, 0x29, 0x04, 0x29, 0x04
	.byte 0xAD, 0x00, 0x81, 0x39, 0x00, 0x54, 0x84, 0xA4, 0x13, 0x54, 0xDF, 0x38, 0x6A, 0x00, 0x3D, 0x00
	.byte 0x42, 0x01, 0x5C, 0x00, 0x31, 0x04, 0x31, 0x04, 0xAE, 0x00, 0xD3, 0xB4, 0x00, 0x03, 0xB8, 0xEE
	.byte 0xFF, 0x1B, 0xBF, 0x2C, 0x6B, 0x00, 0x7A, 0x03, 0x97, 0x02, 0x48, 0x02, 0xFE, 0x03, 0xFE, 0x03
	.byte 0xAF, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1B, 0xAF, 0x2C, 0x6D, 0x00, 0x8A, 0x03
	.byte 0xA7, 0x02, 0x57, 0x02, 0x2D, 0x04, 0x2D, 0x04, 0xB0, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1B, 0xBF, 0x28, 0x6C, 0x00, 0x80, 0x03, 0x9D, 0x02, 0x4D, 0x02, 0xFE, 0x03, 0xFE, 0x03
	.byte 0xB1, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0xBF, 0x2C, 0x49, 0x00, 0x77, 0x03
	.byte 0x94, 0x02, 0x47, 0x02, 0x27, 0x04, 0x27, 0x04, 0xB2, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x24, 0xAF, 0x28, 0x1D, 0x00, 0x1E, 0x00, 0x23, 0x01, 0x42, 0x00, 0xFE, 0x03, 0xFE, 0x03
	.byte 0xB3, 0x00, 0xD0, 0x99, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x24, 0xAF, 0x28, 0x1E, 0x00, 0x1F, 0x00
	.byte 0x24, 0x01, 0x43, 0x00, 0xFE, 0x03, 0xFE, 0x03, 0xB4, 0x00, 0xD0, 0x99, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x24, 0xAF, 0x28, 0x1F, 0x00, 0x20, 0x00, 0x25, 0x01, 0x44, 0x00, 0xFE, 0x03, 0xFE, 0x03
	.byte 0xB5, 0x00, 0xD0, 0x99, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x24, 0xAF, 0x28, 0x20, 0x00, 0x21, 0x00
	.byte 0x26, 0x01, 0x45, 0x00, 0xFE, 0x03, 0xFE, 0x03, 0xB6, 0x00, 0xD0, 0x99, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x24, 0xAF, 0x28, 0x6E, 0x00, 0x22, 0x00, 0x27, 0x01, 0x46, 0x00, 0xFE, 0x03, 0xFE, 0x03
	.byte 0xB7, 0x00, 0xD0, 0x99, 0x00, 0x04, 0x64, 0xE4, 0xFF, 0x3E, 0xBF, 0x2C, 0x71, 0x00, 0x83, 0x03
	.byte 0xA0, 0x02, 0x50, 0x02, 0x28, 0x04, 0x28, 0x04, 0xB8, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x3E, 0xBF, 0x2C, 0x72, 0x00, 0x84, 0x03, 0xA1, 0x02, 0x51, 0x02, 0x28, 0x04, 0x28, 0x04
	.byte 0xB9, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x3E, 0xBF, 0x2C, 0x73, 0x00, 0x85, 0x03
	.byte 0xA2, 0x02, 0x52, 0x02, 0x28, 0x04, 0x28, 0x04, 0xBA, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x3E, 0xBF, 0x2C, 0x74, 0x00, 0x86, 0x03, 0xA3, 0x02, 0x53, 0x02, 0x28, 0x04, 0x28, 0x04
	.byte 0xBB, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x3E, 0xBF, 0x2C, 0x75, 0x00, 0x87, 0x03
	.byte 0xA4, 0x02, 0x54, 0x02, 0x28, 0x04, 0x28, 0x04, 0xBC, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x3E, 0xBF, 0x2C, 0x76, 0x00, 0x88, 0x03, 0xA5, 0x02, 0x55, 0x02, 0x28, 0x04, 0x28, 0x04
	.byte 0xBD, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x30, 0xAF, 0x28, 0x6F, 0x00, 0x7D, 0x03
	.byte 0x9A, 0x02, 0x4B, 0x02, 0xFE, 0x03, 0xFE, 0x03, 0xBE, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x30, 0xAF, 0x28, 0x70, 0x00, 0x7E, 0x03, 0x9B, 0x02, 0x4C, 0x02, 0xFE, 0x03, 0xFE, 0x03
	.byte 0xBF, 0x00, 0x83, 0x59, 0x00, 0x44, 0x60, 0xE4, 0xFF, 0x3E, 0xAF, 0x2C, 0x3A, 0x00, 0x5E, 0x00
	.byte 0x63, 0x01, 0x75, 0x00, 0xFE, 0x03, 0xFE, 0x03, 0xC0, 0x00, 0xD7, 0x59, 0x00, 0x04, 0x64, 0xE4
	.byte 0xFF, 0x3E, 0xBF, 0x2C, 0x3B, 0x00, 0x5F, 0x00, 0x64, 0x01, 0x76, 0x00, 0xFE, 0x03, 0xFE, 0x03
	.byte 0xC1, 0x00, 0x83, 0x59, 0x00, 0x44, 0x84, 0xE4, 0xFF, 0x3E, 0xBF, 0x2C, 0x3C, 0x00, 0x60, 0x00
	.byte 0x65, 0x01, 0x77, 0x00, 0x31, 0x04, 0x31, 0x04, 0xC2, 0x00, 0x83, 0x59, 0x00, 0x44, 0x84, 0xE4
	.byte 0xFF, 0x3E, 0xBF, 0x2C, 0x3D, 0x00, 0x61, 0x00, 0x66, 0x01, 0x78, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0xC3, 0x00, 0x83, 0x59, 0x00, 0x44, 0x84, 0xE4, 0xFF, 0x19, 0xAF, 0x2C, 0x61, 0x00, 0x7C, 0x03
	.byte 0x99, 0x02, 0x4A, 0x02, 0xFE, 0x03, 0xFE, 0x03, 0xC4, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0xBF, 0x2C, 0x60, 0x00, 0x7B, 0x03, 0x98, 0x02, 0x49, 0x02, 0xFE, 0x03, 0xFE, 0x03
	.byte 0xC5, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0xBF, 0x28, 0x60, 0x00, 0x81, 0x03
	.byte 0x9E, 0x02, 0x4E, 0x02, 0xFE, 0x03, 0xFE, 0x03, 0xC6, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2A, 0xBF, 0x28, 0x8C, 0x00, 0x82, 0x03, 0x9F, 0x02, 0x4F, 0x02, 0xFE, 0x03, 0xFE, 0x03
	.byte 0xC7, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x2D, 0x9F, 0x28, 0xED, 0x00, 0x8B, 0x03
	.byte 0xA8, 0x02, 0x58, 0x02, 0x82, 0x04, 0x82, 0x04, 0xC8, 0x00, 0x76, 0x59, 0x00, 0x44, 0x60, 0xE4
	.byte 0xFF, 0x3F, 0x0F, 0x00, 0x77, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0xFE, 0x03, 0xFE, 0x03
	.byte 0x00, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x3F, 0x0F, 0x00, 0x78, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0xFE, 0x03, 0xFE, 0x03, 0x00, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x3F, 0x0F, 0x00, 0x79, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0xFE, 0x03, 0xFE, 0x03
	.byte 0x00, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x3F, 0x0F, 0x00, 0x7A, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0xFE, 0x03, 0xFE, 0x03, 0x00, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x3F, 0x0F, 0x00, 0x7B, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0xFE, 0x03, 0xFE, 0x03
	.byte 0x00, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x3F, 0x0F, 0x00, 0x7C, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0xFE, 0x03, 0xFE, 0x03, 0x00, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2A, 0x8F, 0x14, 0x80, 0x00, 0xFA, 0x00, 0xEF, 0x01, 0x8D, 0x01, 0x0C, 0x04, 0x0C, 0x04
	.byte 0xC9, 0x00, 0xBB, 0xA9, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x2A, 0x8F, 0x14, 0x81, 0x00, 0xFB, 0x00
	.byte 0xF0, 0x01, 0x8E, 0x01, 0x0C, 0x04, 0x0C, 0x04, 0xCA, 0x00, 0xBB, 0xA9, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x3D, 0xCF, 0x10, 0x82, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0xFF, 0x03, 0xFF, 0x03
	.byte 0xCB, 0x00, 0x85, 0x79, 0x00, 0x44, 0x64, 0xE4, 0x1D, 0x4E, 0xBF, 0x10, 0x1A, 0x00, 0x18, 0x00
	.byte 0x1D, 0x01, 0x3D, 0x00, 0x34, 0x04, 0x34, 0x04, 0xCC, 0x00, 0xCE, 0xA4, 0x00, 0x03, 0x88, 0xEC
	.byte 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x32, 0x04, 0x32, 0x04
	.byte 0x00, 0x00, 0xD1, 0x94, 0x00, 0x02, 0x08, 0xE0, 0xFF, 0x1A, 0xBF, 0x2C, 0x4D, 0x00, 0x78, 0x03
	.byte 0x95, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0xCD, 0x00, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2F, 0x9F, 0x20, 0x30, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x36, 0x04, 0x36, 0x04
	.byte 0xCE, 0x00, 0xD4, 0x99, 0x00, 0x03, 0x84, 0xE4, 0xFF, 0x4A, 0x9F, 0x20, 0x31, 0x00, 0x3F, 0x00
	.byte 0x44, 0x01, 0x03, 0x00, 0x36, 0x04, 0x36, 0x04, 0xCF, 0x00, 0xD4, 0x99, 0x00, 0x33, 0x24, 0xF4
	.byte 0xFF, 0x2F, 0x9F, 0x20, 0x32, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x36, 0x04, 0x36, 0x04
	.byte 0xD0, 0x00, 0xD4, 0x99, 0x00, 0x03, 0x84, 0xE4, 0xFF, 0x2F, 0x9F, 0x20, 0x33, 0x00, 0x40, 0x00
	.byte 0x45, 0x01, 0x03, 0x00, 0x36, 0x04, 0x36, 0x04, 0xD1, 0x00, 0xD4, 0x99, 0x00, 0x03, 0x84, 0xE4
	.byte 0xFF, 0x2F, 0x9F, 0x20, 0x34, 0x00, 0x41, 0x00, 0x46, 0x01, 0x03, 0x00, 0x36, 0x04, 0x36, 0x04
	.byte 0xD2, 0x00, 0xD4, 0x99, 0x00, 0x03, 0x84, 0xE4, 0xFF, 0x59, 0x9F, 0x20, 0x83, 0x00, 0x42, 0x00
	.byte 0x47, 0x01, 0x5E, 0x00, 0x36, 0x04, 0x36, 0x04, 0xD3, 0x00, 0xD4, 0x99, 0x00, 0x03, 0x84, 0xE4
	.byte 0xFF, 0x1A, 0x8F, 0x20, 0x49, 0x00, 0x92, 0x03, 0xAF, 0x02, 0x5F, 0x02, 0x27, 0x04, 0x27, 0x04
	.byte 0xD4, 0x00, 0x84, 0x69, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1B, 0x8F, 0x20, 0x68, 0x00, 0x90, 0x03
	.byte 0xAD, 0x02, 0x5D, 0x02, 0x28, 0x04, 0x28, 0x04, 0xD5, 0x00, 0x84, 0x69, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x8F, 0x1C, 0x61, 0x00, 0x94, 0x03, 0xB1, 0x02, 0x60, 0x02, 0x00, 0x04, 0x00, 0x04
	.byte 0xD6, 0x00, 0x84, 0x69, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x9F, 0x1C, 0x61, 0x00, 0x95, 0x03
	.byte 0xB2, 0x02, 0x61, 0x02, 0x00, 0x04, 0x00, 0x04, 0xD7, 0x00, 0x84, 0x69, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x8F, 0x1C, 0x61, 0x00, 0x96, 0x03, 0xB3, 0x02, 0x62, 0x02, 0x00, 0x04, 0x00, 0x04
	.byte 0xD8, 0x00, 0x84, 0x69, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x2A, 0x8F, 0x20, 0x88, 0x00, 0x97, 0x03
	.byte 0xB4, 0x02, 0x63, 0x02, 0x00, 0x04, 0x00, 0x04, 0xD9, 0x00, 0x84, 0x69, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x5F, 0x2C, 0x5F, 0x00, 0x70, 0x03, 0x8D, 0x02, 0x40, 0x02, 0x01, 0x04, 0x01, 0x04
	.byte 0xDA, 0x00, 0x82, 0x49, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1B, 0x5F, 0x2C, 0x8B, 0x00, 0x71, 0x03
	.byte 0x8E, 0x02, 0x41, 0x02, 0x01, 0x04, 0x01, 0x04, 0xDB, 0x00, 0x82, 0x49, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x5F, 0x2C, 0x61, 0x00, 0x72, 0x03, 0x8F, 0x02, 0x42, 0x02, 0x01, 0x04, 0x01, 0x04
	.byte 0xDC, 0x00, 0x82, 0x49, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x5F, 0x2C, 0x5F, 0x00, 0x73, 0x03
	.byte 0x90, 0x02, 0x43, 0x02, 0x01, 0x04, 0x01, 0x04, 0xDD, 0x00, 0x82, 0x49, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0x5F, 0x2C, 0x49, 0x00, 0x6E, 0x03, 0x8B, 0x02, 0x3F, 0x02, 0x27, 0x04, 0x27, 0x04
	.byte 0xDE, 0x00, 0x82, 0x49, 0x00, 0x44, 0x64, 0xE4, 0x3D, 0x4C, 0x5F, 0x11, 0x85, 0x00, 0x64, 0x00
	.byte 0x69, 0x01, 0x03, 0x00, 0x38, 0x04, 0x38, 0x04, 0xDF, 0x00, 0xD9, 0x84, 0x00, 0x03, 0xA8, 0xEE
	.byte 0x3E, 0x4C, 0x5F, 0x11, 0x86, 0x00, 0x65, 0x00, 0x6A, 0x01, 0x7B, 0x00, 0x38, 0x04, 0x38, 0x04
	.byte 0xE0, 0x00, 0xD9, 0x84, 0x00, 0x03, 0xB8, 0xEE, 0x3F, 0x4C, 0x5F, 0x11, 0x87, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x38, 0x04, 0x38, 0x04, 0xE1, 0x00, 0xD9, 0x84, 0x00, 0x03, 0xB8, 0xEE
	.byte 0xFF, 0x3F, 0x8F, 0x20, 0x89, 0x00, 0x98, 0x00, 0x92, 0x01, 0xFF, 0x00, 0x00, 0x04, 0x00, 0x04
	.byte 0xE2, 0x00, 0x84, 0xA9, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0x5F, 0x2C, 0x4D, 0x00, 0x6F, 0x03
	.byte 0x8C, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0xE3, 0x00, 0x82, 0x49, 0x00, 0x44, 0x64, 0xE4
	.byte 0x2C, 0x55, 0x7F, 0x2C, 0x8E, 0x00, 0x66, 0x00, 0x6B, 0x01, 0x03, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0xE4, 0x00, 0xDA, 0xB4, 0x16, 0x03, 0xA8, 0xEE, 0x2E, 0x55, 0x7F, 0x2C, 0x8F, 0x00, 0x67, 0x00
	.byte 0x6C, 0x01, 0x7C, 0x00, 0x31, 0x04, 0x31, 0x04, 0xE5, 0x00, 0xDA, 0xB4, 0x00, 0x03, 0xB8, 0xAE
	.byte 0xFF, 0x62, 0x7F, 0x2C, 0x90, 0x00, 0x68, 0x00, 0x6D, 0x01, 0x7D, 0x00, 0xE9, 0x03, 0xE9, 0x03
	.byte 0xE6, 0x00, 0xDA, 0xB4, 0x00, 0xC3, 0xB0, 0x0C, 0xFF, 0x3F, 0x0F, 0x11, 0x45, 0x00, 0x00, 0x01
	.byte 0xF5, 0x01, 0x93, 0x01, 0x0D, 0x04, 0x0D, 0x04, 0xE7, 0x00, 0xBF, 0xA9, 0x00, 0x44, 0x64, 0xE6
	.byte 0xFF, 0x1A, 0x0F, 0x15, 0x49, 0x00, 0xA7, 0x03, 0xC4, 0x02, 0x70, 0x02, 0x27, 0x04, 0x27, 0x04
	.byte 0xE8, 0x00, 0x86, 0xA9, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x40, 0x0F, 0x15, 0x35, 0x00, 0x59, 0x00
	.byte 0x5E, 0x01, 0x70, 0x00, 0x37, 0x04, 0x37, 0x04, 0xE9, 0x00, 0xD5, 0xA9, 0x00, 0x43, 0x64, 0xA4
	.byte 0xFF, 0x40, 0x0F, 0x15, 0x36, 0x00, 0x5A, 0x00, 0x5F, 0x01, 0x71, 0x00, 0x37, 0x04, 0x37, 0x04
	.byte 0xEA, 0x00, 0xD5, 0xA9, 0x00, 0x43, 0x64, 0xA4, 0xFF, 0x40, 0x0F, 0x15, 0x37, 0x00, 0x5B, 0x00
	.byte 0x60, 0x01, 0x72, 0x00, 0x37, 0x04, 0x37, 0x04, 0xEB, 0x00, 0xD5, 0xA9, 0x00, 0x43, 0x64, 0xA4
	.byte 0x36, 0x4F, 0xEF, 0x14, 0x3F, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0xEC, 0x00, 0xD8, 0x84, 0x00, 0x03, 0xA8, 0xEE, 0x37, 0x4F, 0xEF, 0x14, 0x40, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x31, 0x04, 0x31, 0x04, 0xED, 0x00, 0xD8, 0x84, 0x00, 0x03, 0xA8, 0xEE
	.byte 0x38, 0x4F, 0xEF, 0x14, 0x41, 0x00, 0x62, 0x00, 0x67, 0x01, 0x79, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0xEE, 0x00, 0xD8, 0x84, 0x00, 0x03, 0xA8, 0xEE, 0x42, 0x56, 0x4F, 0x11, 0x92, 0x00, 0x6F, 0x00
	.byte 0x74, 0x01, 0x81, 0x00, 0x39, 0x04, 0x39, 0x04, 0xEF, 0x00, 0xDE, 0xB4, 0x00, 0x03, 0xA8, 0xEE
	.byte 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x2E, 0x04, 0x2E, 0x04
	.byte 0x00, 0x00, 0x51, 0xA2, 0x00, 0x01, 0x00, 0xE4, 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0x00, 0x00, 0x51, 0xA9, 0x00, 0x44, 0x00, 0xE4
	.byte 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0x00, 0x00, 0x51, 0xA9, 0x00, 0x44, 0x00, 0xE4, 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x28, 0x04, 0x28, 0x04, 0x00, 0x00, 0x51, 0xA9, 0x00, 0x44, 0x00, 0xE4
	.byte 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x2E, 0x04, 0x2E, 0x04
	.byte 0x00, 0x00, 0x51, 0xA9, 0x00, 0x44, 0x00, 0xE4, 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x2E, 0x04, 0x2E, 0x04, 0x00, 0x00, 0x51, 0xA9, 0x00, 0x44, 0x00, 0xE4
	.byte 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x2E, 0x04, 0x2E, 0x04
	.byte 0x00, 0x00, 0x51, 0xA9, 0x00, 0x44, 0x00, 0xE4, 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x2E, 0x04, 0x2E, 0x04, 0x00, 0x00, 0x51, 0xA9, 0x00, 0x44, 0x00, 0xE4
	.byte 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0x00, 0x00, 0x51, 0xA9, 0x00, 0x44, 0x00, 0xE4, 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x2E, 0x04, 0x2E, 0x04, 0x00, 0x00, 0x6F, 0xA2, 0x00, 0x44, 0x00, 0xE4
	.byte 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x2E, 0x04, 0x2E, 0x04
	.byte 0x00, 0x00, 0x6F, 0xA9, 0x00, 0x44, 0x00, 0xE4, 0xFF, 0x38, 0x7F, 0x1C, 0xE8, 0x00, 0x45, 0x00
	.byte 0x4A, 0x01, 0x60, 0x00, 0x2F, 0x04, 0x2F, 0x04, 0xF0, 0x00, 0x50, 0xA9, 0x00, 0x04, 0x61, 0xE4
	.byte 0xFF, 0x2C, 0x7F, 0x1C, 0x06, 0x01, 0x46, 0x00, 0x4B, 0x01, 0x03, 0x00, 0x2F, 0x04, 0x2F, 0x04
	.byte 0xF1, 0x00, 0x50, 0xA9, 0x00, 0x44, 0x60, 0x04, 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x2E, 0x04, 0x2E, 0x04, 0x00, 0x00, 0x50, 0xA9, 0x00, 0x44, 0x60, 0x00
	.byte 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x2E, 0x04, 0x2E, 0x04
	.byte 0x00, 0x00, 0x50, 0xA9, 0x00, 0x44, 0x60, 0x00, 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x2E, 0x04, 0x2E, 0x04, 0x00, 0x00, 0x50, 0xA9, 0x00, 0x44, 0x60, 0x00
	.byte 0xFF, 0x02, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x2E, 0x04, 0x2E, 0x04
	.byte 0x00, 0x00, 0x50, 0xA9, 0x00, 0x44, 0x60, 0x00, 0xFF, 0x26, 0x7F, 0x1C, 0x07, 0x01, 0x4B, 0x00
	.byte 0x50, 0x01, 0x63, 0x00, 0x2E, 0x04, 0x2E, 0x04, 0xF2, 0x00, 0x50, 0xA9, 0x00, 0x04, 0x60, 0xE4
	.byte 0xFF, 0x5C, 0x7F, 0x1C, 0xE6, 0x00, 0x4C, 0x00, 0x51, 0x01, 0x64, 0x00, 0x2E, 0x04, 0x2E, 0x04
	.byte 0xF3, 0x00, 0x70, 0x91, 0x00, 0x81, 0x60, 0xF6, 0xFF, 0x2E, 0x7F, 0x1C, 0xE7, 0x00, 0x50, 0x00
	.byte 0x55, 0x01, 0x67, 0x00, 0x2E, 0x04, 0x2E, 0x04, 0xF4, 0x00, 0x70, 0x99, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x38, 0x0F, 0x00, 0xE8, 0x00, 0x53, 0x00, 0x58, 0x01, 0x03, 0x00, 0x2F, 0x04, 0x2F, 0x04
	.byte 0xF5, 0x00, 0x50, 0xA9, 0x00, 0x04, 0x60, 0xE0, 0xFF, 0x39, 0x7F, 0x1C, 0xE9, 0x00, 0x54, 0x00
	.byte 0x59, 0x01, 0x6B, 0x00, 0x77, 0x04, 0x77, 0x04, 0xF6, 0x00, 0x71, 0xA9, 0x00, 0x04, 0x61, 0x64
	.byte 0xFF, 0x3A, 0x7F, 0x1C, 0xEA, 0x00, 0x55, 0x00, 0x5A, 0x01, 0x6C, 0x00, 0x78, 0x04, 0x78, 0x04
	.byte 0xF7, 0x00, 0x74, 0xA9, 0x00, 0x04, 0x61, 0x64, 0xFF, 0x3B, 0x7F, 0x1C, 0xEB, 0x00, 0x56, 0x00
	.byte 0x5B, 0x01, 0x6D, 0x00, 0x7A, 0x04, 0x7A, 0x04, 0xF8, 0x00, 0x72, 0xA9, 0x00, 0x04, 0x61, 0x64
	.byte 0xFF, 0x3C, 0x7F, 0x1C, 0xEC, 0x00, 0x57, 0x00, 0x5C, 0x01, 0x6E, 0x00, 0x79, 0x04, 0x79, 0x04
	.byte 0xF9, 0x00, 0x73, 0xA9, 0x1A, 0x04, 0x61, 0x64, 0x52, 0x46, 0x5F, 0x28, 0x98, 0x00, 0x79, 0x00
	.byte 0x7E, 0x01, 0x88, 0x00, 0x09, 0x04, 0x09, 0x04, 0xFA, 0x00, 0xEA, 0xA4, 0x00, 0x03, 0x98, 0xE6
	.byte 0xFF, 0x5A, 0xAF, 0x18, 0x99, 0x00, 0x7A, 0x00, 0x7F, 0x01, 0x89, 0x00, 0x09, 0x04, 0x09, 0x04
	.byte 0xFB, 0x00, 0xE1, 0xD1, 0x00, 0x01, 0x28, 0xF6, 0xFF, 0x25, 0xAF, 0x18, 0x9A, 0x00, 0x7B, 0x00
	.byte 0x80, 0x01, 0x8A, 0x00, 0x6E, 0x04, 0x6E, 0x04, 0xFC, 0x00, 0xE1, 0xD9, 0x00, 0x44, 0x74, 0xE4
	.byte 0xFF, 0x25, 0xAF, 0x18, 0x9B, 0x00, 0x7C, 0x00, 0x81, 0x01, 0x8B, 0x00, 0x6E, 0x04, 0x6E, 0x04
	.byte 0xFD, 0x00, 0xE1, 0xD9, 0x00, 0x74, 0x64, 0xE4, 0xFF, 0x25, 0xAF, 0x18, 0x9C, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x6E, 0x04, 0x6E, 0x04, 0xFE, 0x00, 0xE1, 0xD9, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x25, 0xAF, 0x18, 0x9D, 0x00, 0x7D, 0x00, 0x82, 0x01, 0x8C, 0x00, 0x6E, 0x04, 0x6E, 0x04
	.byte 0xFF, 0x00, 0xE1, 0xD9, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x25, 0xAF, 0x18, 0x9E, 0x00, 0x7E, 0x00
	.byte 0x83, 0x01, 0x8D, 0x00, 0x6E, 0x04, 0x6E, 0x04, 0x00, 0x01, 0xE1, 0xD9, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x25, 0xAF, 0x18, 0x9F, 0x00, 0x7F, 0x00, 0x84, 0x01, 0x8E, 0x00, 0x6E, 0x04, 0x6E, 0x04
	.byte 0x01, 0x01, 0xE1, 0xD9, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x25, 0xAF, 0x18, 0xA0, 0x00, 0x80, 0x00
	.byte 0x85, 0x01, 0x8F, 0x00, 0x75, 0x04, 0x75, 0x04, 0x02, 0x01, 0xE1, 0xD9, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2A, 0x4F, 0x11, 0x95, 0x00, 0x70, 0x00, 0x75, 0x01, 0x82, 0x00, 0x39, 0x04, 0x39, 0x04
	.byte 0x03, 0x01, 0xDE, 0xB9, 0x00, 0x44, 0x84, 0xE4, 0xFF, 0x19, 0x4F, 0x15, 0x5F, 0x00, 0xB2, 0x03
	.byte 0xCF, 0x02, 0x79, 0x02, 0x03, 0x04, 0x03, 0x04, 0x04, 0x01, 0x88, 0xA9, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x5F, 0x15, 0x5F, 0x00, 0xB3, 0x03, 0xD0, 0x02, 0x7A, 0x02, 0x03, 0x04, 0x03, 0x04
	.byte 0x05, 0x01, 0x88, 0xA9, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x4F, 0x15, 0x5F, 0x00, 0xB4, 0x03
	.byte 0xD1, 0x02, 0x7B, 0x02, 0x03, 0x04, 0x03, 0x04, 0x06, 0x01, 0x88, 0xA9, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1B, 0x4F, 0x15, 0x68, 0x00, 0xAE, 0x03, 0xCB, 0x02, 0x76, 0x02, 0x28, 0x04, 0x28, 0x04
	.byte 0x07, 0x01, 0x88, 0xA9, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0x5F, 0x15, 0x49, 0x00, 0xB0, 0x03
	.byte 0xCD, 0x02, 0x78, 0x02, 0x27, 0x04, 0x27, 0x04, 0x08, 0x01, 0x88, 0xA9, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0xFF, 0x04, 0x42, 0x00, 0xAB, 0x03, 0xC8, 0x02, 0x73, 0x02, 0x0D, 0x04, 0x0D, 0x04
	.byte 0x09, 0x01, 0x87, 0x99, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x0F, 0x09, 0x5F, 0x00, 0xAC, 0x03
	.byte 0xC9, 0x02, 0x74, 0x02, 0x0D, 0x04, 0x0D, 0x04, 0x0A, 0x01, 0x87, 0x99, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0xCF, 0x29, 0x42, 0x00, 0xDB, 0x00, 0xD0, 0x01, 0x6E, 0x01, 0x26, 0x04, 0x26, 0x04
	.byte 0x0B, 0x01, 0xAE, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x2A, 0xCF, 0x2D, 0x93, 0x00, 0xDC, 0x00
	.byte 0xD1, 0x01, 0x6F, 0x01, 0x26, 0x04, 0x26, 0x04, 0x0C, 0x01, 0xAE, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x46, 0x7F, 0x31, 0xA4, 0x00, 0x72, 0x00, 0x77, 0x01, 0x83, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0x0D, 0x01, 0xDF, 0xB4, 0x01, 0x03, 0xA8, 0xAE, 0xFF, 0x3F, 0xCF, 0x21, 0x96, 0x00, 0xD5, 0x00
	.byte 0xCA, 0x01, 0x69, 0x01, 0x26, 0x04, 0x26, 0x04, 0x0E, 0x01, 0xAE, 0xC9, 0x01, 0x44, 0x64, 0xE6
	.byte 0xFF, 0x1A, 0xCF, 0x19, 0x94, 0x00, 0x33, 0x03, 0x50, 0x02, 0x0A, 0x02, 0x3D, 0x04, 0x3D, 0x04
	.byte 0x0F, 0x01, 0x0F, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x29, 0xCF, 0x19, 0xA5, 0x00, 0x34, 0x03
	.byte 0x51, 0x02, 0x0B, 0x02, 0x3D, 0x04, 0x3D, 0x04, 0x10, 0x01, 0x0F, 0xC9, 0x01, 0x04, 0xC4, 0x84
	.byte 0xFF, 0x29, 0xCF, 0x19, 0xA6, 0x00, 0x35, 0x03, 0x52, 0x02, 0x0C, 0x02, 0x3D, 0x04, 0x3D, 0x04
	.byte 0x11, 0x01, 0x0F, 0xC9, 0x01, 0x04, 0xD4, 0x84, 0xFF, 0x29, 0xCF, 0x19, 0xA7, 0x00, 0x36, 0x03
	.byte 0x53, 0x02, 0x0D, 0x02, 0x3D, 0x04, 0x3D, 0x04, 0x12, 0x01, 0x0F, 0xC9, 0x01, 0x04, 0xE4, 0x84
	.byte 0xFF, 0x29, 0xCF, 0x19, 0xA8, 0x00, 0x37, 0x03, 0x54, 0x02, 0x0E, 0x02, 0x3D, 0x04, 0x3D, 0x04
	.byte 0x13, 0x01, 0x0F, 0xC9, 0x01, 0x04, 0xF4, 0x84, 0xFF, 0x41, 0xCF, 0x19, 0xA9, 0x00, 0x38, 0x03
	.byte 0x55, 0x02, 0x0F, 0x02, 0x3D, 0x04, 0x3D, 0x04, 0x14, 0x01, 0x0F, 0xC9, 0x01, 0x04, 0x04, 0x85
	.byte 0xFF, 0x41, 0xCF, 0x19, 0xAA, 0x00, 0x39, 0x03, 0x56, 0x02, 0x10, 0x02, 0x3D, 0x04, 0x3D, 0x04
	.byte 0x15, 0x01, 0x0F, 0xC9, 0x01, 0x04, 0x60, 0x84, 0xFF, 0x2A, 0x9F, 0x39, 0xAB, 0x00, 0x9C, 0x00
	.byte 0x96, 0x01, 0x03, 0x01, 0x48, 0x04, 0x48, 0x04, 0x16, 0x01, 0xE2, 0xA9, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2A, 0x9F, 0x39, 0xAC, 0x00, 0x9D, 0x00, 0x97, 0x01, 0x04, 0x01, 0x48, 0x04, 0x48, 0x04
	.byte 0x17, 0x01, 0xE2, 0xA9, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x2A, 0x9F, 0x39, 0xAD, 0x00, 0x9E, 0x00
	.byte 0x98, 0x01, 0x05, 0x01, 0x48, 0x04, 0x48, 0x04, 0x18, 0x01, 0xE2, 0xA9, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2A, 0x9F, 0x39, 0xAE, 0x00, 0x9F, 0x00, 0x99, 0x01, 0x03, 0x00, 0x48, 0x04, 0x48, 0x04
	.byte 0x19, 0x01, 0xE2, 0xA9, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x2A, 0x9F, 0x39, 0xAF, 0x00, 0xA0, 0x00
	.byte 0x9A, 0x01, 0x03, 0x00, 0x48, 0x04, 0x48, 0x04, 0x1A, 0x01, 0xE2, 0xA9, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x48, 0xDF, 0x20, 0x22, 0x00, 0x27, 0x00, 0x2C, 0x01, 0x4A, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0x1B, 0x01, 0xD1, 0x94, 0x00, 0x43, 0x84, 0xE4, 0xFF, 0x48, 0xDF, 0x20, 0x23, 0x00, 0x28, 0x00
	.byte 0x2D, 0x01, 0x03, 0x00, 0x31, 0x04, 0x31, 0x04, 0x1C, 0x01, 0xD1, 0x94, 0x00, 0x43, 0x84, 0xE4
	.byte 0xFF, 0x48, 0xDF, 0x24, 0x22, 0x00, 0x29, 0x00, 0x2E, 0x01, 0x4B, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0x1D, 0x01, 0xD1, 0x94, 0x00, 0x43, 0x84, 0xE4, 0x0A, 0x69, 0xDF, 0x20, 0x25, 0x00, 0x2A, 0x00
	.byte 0x2F, 0x01, 0x4C, 0x00, 0x32, 0x04, 0x32, 0x04, 0x1E, 0x01, 0xD1, 0x94, 0x00, 0x03, 0x88, 0xEC
	.byte 0xFF, 0x48, 0xDF, 0x24, 0x22, 0x00, 0x2B, 0x00, 0x30, 0x01, 0x4D, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0x1F, 0x01, 0xD1, 0x94, 0x00, 0x43, 0x84, 0xE4, 0xFF, 0x48, 0xDF, 0x24, 0x27, 0x00, 0x2C, 0x00
	.byte 0x31, 0x01, 0x03, 0x00, 0x31, 0x04, 0x31, 0x04, 0x20, 0x01, 0xD1, 0x94, 0x00, 0x43, 0x84, 0xE4
	.byte 0xFF, 0x48, 0xDF, 0x24, 0x22, 0x00, 0x2D, 0x00, 0x32, 0x01, 0x03, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0x21, 0x01, 0xD1, 0x94, 0x00, 0x43, 0x84, 0xE4, 0xFF, 0x48, 0xDF, 0x24, 0x29, 0x00, 0x2E, 0x00
	.byte 0x33, 0x01, 0x03, 0x00, 0x31, 0x04, 0x31, 0x04, 0x22, 0x01, 0xD1, 0x94, 0x00, 0x43, 0x84, 0xE4
	.byte 0xFF, 0x48, 0xDF, 0x24, 0xB4, 0x00, 0x2F, 0x00, 0x34, 0x01, 0x03, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0x23, 0x01, 0xD1, 0x94, 0x00, 0x43, 0x84, 0xE4, 0xFF, 0x3D, 0xDF, 0x20, 0x11, 0x01, 0x26, 0x00
	.byte 0x2B, 0x01, 0x49, 0x00, 0x31, 0x04, 0x31, 0x04, 0x24, 0x01, 0xD1, 0x99, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x7F, 0x31, 0x42, 0x00, 0xDE, 0x00, 0xD3, 0x01, 0x72, 0x01, 0x26, 0x04, 0x26, 0x04
	.byte 0x25, 0x01, 0xAF, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x69, 0xDF, 0x20, 0xB5, 0x00, 0x30, 0x00
	.byte 0x35, 0x01, 0x4F, 0x00, 0x31, 0x04, 0x31, 0x04, 0x26, 0x01, 0xD1, 0x94, 0x00, 0x43, 0x84, 0xE4
	.byte 0xFF, 0x48, 0xDF, 0x20, 0xB6, 0x00, 0x31, 0x00, 0x36, 0x01, 0x50, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0x27, 0x01, 0xD1, 0x94, 0x00, 0x43, 0x84, 0xE4, 0xFF, 0x48, 0xDF, 0x24, 0xB6, 0x00, 0x32, 0x00
	.byte 0x37, 0x01, 0x51, 0x00, 0x31, 0x04, 0x31, 0x04, 0x28, 0x01, 0xD1, 0x94, 0x00, 0x43, 0x84, 0xE4
	.byte 0xFF, 0x48, 0xDF, 0x24, 0xB6, 0x00, 0x33, 0x00, 0x38, 0x01, 0x52, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0x29, 0x01, 0xD1, 0x94, 0x00, 0x43, 0x84, 0xE4, 0xFF, 0x48, 0xDF, 0x24, 0xB6, 0x00, 0x34, 0x00
	.byte 0x39, 0x01, 0x53, 0x00, 0x31, 0x04, 0x31, 0x04, 0x2A, 0x01, 0xD1, 0x94, 0x00, 0x43, 0x84, 0xE4
	.byte 0xFF, 0x2A, 0x9F, 0x39, 0xB0, 0x00, 0xA1, 0x00, 0x9B, 0x01, 0x06, 0x01, 0x48, 0x04, 0x48, 0x04
	.byte 0x2B, 0x01, 0xE2, 0xA9, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x2A, 0x9F, 0x39, 0xB1, 0x00, 0xA2, 0x00
	.byte 0x9C, 0x01, 0x07, 0x01, 0x48, 0x04, 0x48, 0x04, 0x2C, 0x01, 0xE2, 0xA9, 0x00, 0x44, 0x84, 0xE4
	.byte 0xFF, 0x5E, 0x8F, 0x20, 0xB2, 0x00, 0x99, 0x00, 0x93, 0x01, 0x00, 0x01, 0x00, 0x04, 0x00, 0x04
	.byte 0x2D, 0x01, 0x84, 0xA1, 0x00, 0x01, 0x28, 0xF4, 0xFF, 0x1B, 0xBF, 0x30, 0xB3, 0x00, 0xEE, 0x00
	.byte 0xE3, 0x01, 0x81, 0x01, 0x08, 0x04, 0x08, 0x04, 0x2E, 0x01, 0xB6, 0xA9, 0x00, 0x44, 0x64, 0xE4
	.byte 0x1E, 0x4D, 0xCF, 0x10, 0x10, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x35, 0x04, 0x35, 0x04
	.byte 0x2F, 0x01, 0xCD, 0x94, 0x00, 0x03, 0x88, 0xEC, 0x1F, 0x4D, 0xCF, 0x10, 0x11, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x35, 0x04, 0x35, 0x04, 0x30, 0x01, 0xCD, 0x94, 0x00, 0x03, 0x88, 0xEC
	.byte 0x20, 0x4D, 0xCF, 0x10, 0x12, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x35, 0x04, 0x35, 0x04
	.byte 0x31, 0x01, 0xCD, 0x94, 0x00, 0x03, 0x88, 0xEC, 0x21, 0x4D, 0xCF, 0x10, 0x13, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x35, 0x04, 0x35, 0x04, 0x32, 0x01, 0xCD, 0x94, 0x00, 0x03, 0x88, 0xEC
	.byte 0x22, 0x4D, 0xCF, 0x10, 0x14, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x35, 0x04, 0x35, 0x04
	.byte 0x33, 0x01, 0xCD, 0x94, 0x00, 0x03, 0x88, 0xEC, 0x23, 0x4D, 0xCF, 0x10, 0x15, 0x00, 0x14, 0x00
	.byte 0x19, 0x01, 0x03, 0x00, 0x35, 0x04, 0x35, 0x04, 0x34, 0x01, 0xCD, 0x94, 0x00, 0x03, 0x88, 0xEC
	.byte 0x24, 0x4D, 0xCF, 0x10, 0x16, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x35, 0x04, 0x35, 0x04
	.byte 0x35, 0x01, 0xCD, 0x94, 0x00, 0x03, 0x88, 0xEC, 0x25, 0x4D, 0xCF, 0x10, 0x17, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x35, 0x04, 0x35, 0x04, 0x36, 0x01, 0xCD, 0x94, 0x00, 0x03, 0x88, 0xEC
	.byte 0xFF, 0x5B, 0xCF, 0x10, 0x18, 0x00, 0x15, 0x00, 0x1A, 0x01, 0x3A, 0x00, 0xE9, 0x03, 0xE9, 0x03
	.byte 0x37, 0x01, 0xCD, 0x94, 0x00, 0xD3, 0x20, 0x34, 0x54, 0x4D, 0xCF, 0x10, 0xB7, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x35, 0x04, 0x35, 0x04, 0x38, 0x01, 0xCD, 0x94, 0x00, 0x03, 0x88, 0xAC
	.byte 0x53, 0x46, 0x4F, 0x30, 0xB8, 0x00, 0x81, 0x00, 0x86, 0x01, 0x90, 0x00, 0x85, 0x04, 0x85, 0x04
	.byte 0x39, 0x01, 0xE4, 0xB4, 0x00, 0x03, 0x98, 0xEE, 0xFF, 0x4B, 0x0F, 0x00, 0xC5, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x0A, 0x04, 0x0A, 0x04, 0x00, 0x00, 0xCA, 0x87, 0x00, 0x43, 0x08, 0x00
	.byte 0xFF, 0x4B, 0x0F, 0x00, 0xC6, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x0A, 0x04, 0x0A, 0x04
	.byte 0x00, 0x00, 0xCA, 0x87, 0x00, 0x43, 0x08, 0x00, 0xFF, 0x4B, 0x0F, 0x00, 0xC7, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x0A, 0x04, 0x0A, 0x04, 0x00, 0x00, 0xCA, 0x87, 0x00, 0x43, 0x08, 0x00
	.byte 0xFF, 0x4B, 0x0F, 0x00, 0xC8, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x0A, 0x04, 0x0A, 0x04
	.byte 0x00, 0x00, 0xCA, 0x87, 0x00, 0x43, 0x08, 0x00, 0xFF, 0x4B, 0x0F, 0x00, 0xC9, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x0A, 0x04, 0x0A, 0x04, 0x00, 0x00, 0xCA, 0x87, 0x00, 0x43, 0x08, 0x00
	.byte 0xFF, 0x4B, 0x0F, 0x00, 0xCA, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x0A, 0x04, 0x0A, 0x04
	.byte 0x00, 0x00, 0xCA, 0x87, 0x00, 0x43, 0x08, 0x00, 0xFF, 0x4B, 0x0F, 0x00, 0xCB, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x0A, 0x04, 0x0A, 0x04, 0x00, 0x00, 0xCA, 0x87, 0x00, 0x43, 0x08, 0x00
	.byte 0xFF, 0x4B, 0x0F, 0x00, 0xCC, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x0A, 0x04, 0x0A, 0x04
	.byte 0x00, 0x00, 0xCA, 0x87, 0x00, 0x43, 0x08, 0x00, 0xFF, 0x4B, 0x0F, 0x00, 0xCD, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x0A, 0x04, 0x0A, 0x04, 0x00, 0x00, 0xCA, 0x87, 0x00, 0x43, 0x08, 0x00
	.byte 0xFF, 0x4B, 0x0F, 0x00, 0xCE, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x0A, 0x04, 0x0A, 0x04
	.byte 0x00, 0x00, 0xCA, 0x87, 0x00, 0x43, 0x08, 0x00, 0xFF, 0x4B, 0x0F, 0x00, 0xCF, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x0A, 0x04, 0x0A, 0x04, 0x00, 0x00, 0xCA, 0x87, 0x00, 0x43, 0x08, 0x00
	.byte 0xFF, 0x4B, 0x0F, 0x00, 0xD0, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x0A, 0x04, 0x0A, 0x04
	.byte 0x00, 0x00, 0xCA, 0x87, 0x00, 0x43, 0x08, 0x00, 0xFF, 0x4B, 0x0F, 0x00, 0xD1, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x0A, 0x04, 0x0A, 0x04, 0x00, 0x00, 0xCA, 0x87, 0x00, 0x43, 0x08, 0x00
	.byte 0xFF, 0x4B, 0x0F, 0x00, 0xD2, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x0A, 0x04, 0x0A, 0x04
	.byte 0x00, 0x00, 0xCA, 0x87, 0x00, 0x43, 0x08, 0x00, 0x5B, 0x4B, 0x0F, 0x00, 0xD4, 0x00, 0x78, 0x00
	.byte 0x7D, 0x01, 0x03, 0x00, 0x87, 0x04, 0x87, 0x04, 0x3A, 0x01, 0xCA, 0x89, 0x00, 0x02, 0x08, 0xA6
	.byte 0xFF, 0x1A, 0x8F, 0x26, 0x49, 0x00, 0x0B, 0x03, 0x28, 0x02, 0xE6, 0x01, 0x27, 0x04, 0x27, 0x04
	.byte 0x3B, 0x01, 0x8F, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0x8F, 0x26, 0x4D, 0x00, 0x0C, 0x03
	.byte 0x29, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0x3C, 0x01, 0x8F, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1B, 0x8F, 0x26, 0x68, 0x00, 0x09, 0x03, 0x26, 0x02, 0xE4, 0x01, 0x28, 0x04, 0x28, 0x04
	.byte 0x3D, 0x01, 0x8F, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x8F, 0x26, 0x5F, 0x00, 0x0D, 0x03
	.byte 0x2A, 0x02, 0xE7, 0x01, 0x0E, 0x04, 0x0E, 0x04, 0x3E, 0x01, 0x8F, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x28, 0x8F, 0x26, 0xB9, 0x00, 0x0E, 0x03, 0x2B, 0x02, 0xE8, 0x01, 0x0E, 0x04, 0x0E, 0x04
	.byte 0x3F, 0x01, 0x8F, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x8F, 0x26, 0x5F, 0x00, 0x0F, 0x03
	.byte 0x2C, 0x02, 0xE9, 0x01, 0x0E, 0x04, 0x0E, 0x04, 0x40, 0x01, 0x8F, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x8F, 0x26, 0x5F, 0x00, 0x10, 0x03, 0x2D, 0x02, 0xEA, 0x01, 0x0E, 0x04, 0x0E, 0x04
	.byte 0x41, 0x01, 0x8F, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x31, 0x8F, 0x26, 0xFF, 0x00, 0x0A, 0x03
	.byte 0x27, 0x02, 0xE5, 0x01, 0x29, 0x04, 0x29, 0x04, 0x42, 0x01, 0x8F, 0xC9, 0x01, 0x94, 0x64, 0xA4
	.byte 0xFF, 0x3F, 0x7F, 0x20, 0x45, 0x00, 0xC3, 0x03, 0xDC, 0x02, 0xE9, 0x02, 0x0A, 0x04, 0x0A, 0x04
	.byte 0x43, 0x01, 0xBC, 0xA9, 0x00, 0x44, 0x64, 0xE6, 0xFF, 0x1A, 0x8F, 0x20, 0x4D, 0x00, 0x93, 0x03
	.byte 0xB0, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0x44, 0x01, 0x84, 0x69, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0x0F, 0x15, 0x4D, 0x00, 0xA8, 0x03, 0xC5, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0x45, 0x01, 0x86, 0xA9, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0x5F, 0x15, 0x4D, 0x00, 0xB1, 0x03
	.byte 0xCE, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0x46, 0x01, 0x88, 0xA9, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x27, 0x5F, 0x1E, 0xD7, 0x00, 0x15, 0x03, 0x32, 0x02, 0xEE, 0x01, 0x28, 0x04, 0x28, 0x04
	.byte 0x47, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x27, 0x5F, 0x1E, 0xD8, 0x00, 0x16, 0x03
	.byte 0x33, 0x02, 0xEF, 0x01, 0x28, 0x04, 0x28, 0x04, 0x48, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x27, 0x5F, 0x1E, 0xD9, 0x00, 0x17, 0x03, 0x34, 0x02, 0xF0, 0x01, 0x28, 0x04, 0x28, 0x04
	.byte 0x49, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x27, 0x5F, 0x1E, 0xDA, 0x00, 0x18, 0x03
	.byte 0x35, 0x02, 0xF1, 0x01, 0x28, 0x04, 0x28, 0x04, 0x4A, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x27, 0x5F, 0x1E, 0xDB, 0x00, 0x19, 0x03, 0x36, 0x02, 0xF2, 0x01, 0x28, 0x04, 0x28, 0x04
	.byte 0x4B, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x27, 0x5F, 0x1E, 0xDC, 0x00, 0x1A, 0x03
	.byte 0x37, 0x02, 0xF3, 0x01, 0x28, 0x04, 0x28, 0x04, 0x4C, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x27, 0x6F, 0x1E, 0xDD, 0x00, 0x1C, 0x03, 0x39, 0x02, 0xF5, 0x01, 0x12, 0x04, 0x12, 0x04
	.byte 0x4D, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x27, 0x6F, 0x1E, 0xDE, 0x00, 0x1D, 0x03
	.byte 0x3A, 0x02, 0xF6, 0x01, 0x12, 0x04, 0x12, 0x04, 0x4E, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x27, 0x6F, 0x1E, 0xDF, 0x00, 0x1E, 0x03, 0x3B, 0x02, 0xF7, 0x01, 0x12, 0x04, 0x12, 0x04
	.byte 0x4F, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x5F, 0x6F, 0x1E, 0xE0, 0x00, 0x1F, 0x03
	.byte 0x3C, 0x02, 0xF8, 0x01, 0x12, 0x04, 0x12, 0x04, 0x50, 0x01, 0x90, 0xC9, 0x01, 0x31, 0x64, 0xF4
	.byte 0xFF, 0x28, 0x6F, 0x1E, 0xE1, 0x00, 0x20, 0x03, 0x3D, 0x02, 0xF9, 0x01, 0x12, 0x04, 0x12, 0x04
	.byte 0x51, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x28, 0x6F, 0x1E, 0xD5, 0x00, 0x23, 0x03
	.byte 0x40, 0x02, 0xFC, 0x01, 0x2D, 0x04, 0x2D, 0x04, 0x52, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x28, 0x6F, 0x1E, 0xD6, 0x00, 0x24, 0x03, 0x41, 0x02, 0xFD, 0x01, 0x2D, 0x04, 0x2D, 0x04
	.byte 0x53, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x28, 0x6F, 0x22, 0xE2, 0x00, 0x25, 0x03
	.byte 0x42, 0x02, 0xFE, 0x01, 0x12, 0x04, 0x12, 0x04, 0x54, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x5F, 0x31, 0x48, 0x00, 0x51, 0x03, 0x6E, 0x02, 0x25, 0x02, 0xFA, 0x03, 0xFA, 0x03
	.byte 0x55, 0x01, 0x7E, 0x09, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x5F, 0x28, 0x5F, 0x00, 0x74, 0x03
	.byte 0x91, 0x02, 0x44, 0x02, 0x01, 0x04, 0x01, 0x04, 0x56, 0x01, 0x82, 0x49, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x27, 0x8F, 0x2A, 0xBA, 0x00, 0x9A, 0x00, 0x94, 0x01, 0x01, 0x01, 0x0E, 0x04, 0x0E, 0x04
	.byte 0x57, 0x01, 0x8F, 0xA9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x5E, 0x8F, 0x2A, 0xD3, 0x00, 0x9B, 0x00
	.byte 0x95, 0x01, 0x02, 0x01, 0x0E, 0x04, 0x0E, 0x04, 0x58, 0x01, 0x8F, 0xA1, 0x01, 0x01, 0x28, 0xF4
	.byte 0xFF, 0x0E, 0x0F, 0x00, 0x00, 0x00, 0xC2, 0x00, 0xB7, 0x01, 0x57, 0x01, 0x1E, 0x04, 0x1E, 0x04
	.byte 0x59, 0x01, 0x9E, 0xC3, 0x01, 0x02, 0x48, 0xF6, 0xFF, 0x3F, 0x8F, 0x22, 0x45, 0x00, 0xB9, 0x00
	.byte 0xAE, 0x01, 0x4F, 0x01, 0x1C, 0x04, 0x1C, 0x04, 0x5A, 0x01, 0x9A, 0xC9, 0x01, 0x44, 0x64, 0xE6
	.byte 0xFF, 0x3F, 0xAF, 0x1E, 0x46, 0x00, 0xBD, 0x00, 0xB2, 0x01, 0x53, 0x01, 0x1E, 0x04, 0x1E, 0x04
	.byte 0x5B, 0x01, 0x9C, 0xC9, 0x01, 0x44, 0x64, 0xE6, 0xFF, 0x3F, 0x8F, 0x16, 0x45, 0x00, 0xB6, 0x00
	.byte 0xAB, 0x01, 0x4C, 0x01, 0x1D, 0x04, 0x1D, 0x04, 0x5C, 0x01, 0x99, 0xC9, 0x01, 0x44, 0x64, 0xE6
	.byte 0xFF, 0x3F, 0x7F, 0x36, 0x46, 0x00, 0xCC, 0x00, 0xC1, 0x01, 0x61, 0x01, 0x24, 0x04, 0x24, 0x04
	.byte 0x5D, 0x01, 0xA3, 0xC9, 0x01, 0x44, 0x64, 0xE6, 0xFF, 0x1A, 0x6F, 0x1E, 0x49, 0x00, 0x13, 0x03
	.byte 0x30, 0x02, 0xED, 0x01, 0x27, 0x04, 0x27, 0x04, 0x5E, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0x6F, 0x1E, 0x4D, 0x00, 0x14, 0x03, 0x31, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0x5F, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x34, 0x6F, 0x1E, 0x02, 0x01, 0x12, 0x03
	.byte 0x2F, 0x02, 0xEC, 0x01, 0x29, 0x04, 0x29, 0x04, 0x60, 0x01, 0x90, 0xC9, 0x01, 0x04, 0x64, 0xA4
	.byte 0xFF, 0x22, 0x0F, 0x15, 0xE4, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x29, 0x04, 0x29, 0x04
	.byte 0x61, 0x01, 0x86, 0xA9, 0x00, 0x04, 0x74, 0xA4, 0xFF, 0x22, 0x0F, 0x15, 0x5D, 0x00, 0xA6, 0x03
	.byte 0xC3, 0x02, 0x6F, 0x02, 0x29, 0x04, 0x29, 0x04, 0x62, 0x01, 0x86, 0xA9, 0x00, 0x04, 0x74, 0xA4
	.byte 0xFF, 0x28, 0x9F, 0x1A, 0xC0, 0x00, 0x40, 0x03, 0x5D, 0x02, 0x15, 0x02, 0x0F, 0x04, 0x0F, 0x04
	.byte 0x63, 0x01, 0x94, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x9F, 0x1E, 0x61, 0x00, 0x41, 0x03
	.byte 0x5E, 0x02, 0x16, 0x02, 0x0F, 0x04, 0x0F, 0x04, 0x64, 0x01, 0x94, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x30, 0x8F, 0x1A, 0xBB, 0x00, 0x42, 0x03, 0x5F, 0x02, 0x17, 0x02, 0x0F, 0x04, 0x0F, 0x04
	.byte 0x65, 0x01, 0x94, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x30, 0x8F, 0x1A, 0xBC, 0x00, 0x43, 0x03
	.byte 0x60, 0x02, 0x18, 0x02, 0x0F, 0x04, 0x0F, 0x04, 0x66, 0x01, 0x94, 0xC9, 0x01, 0x44, 0x60, 0xE4
	.byte 0xFF, 0x27, 0x8F, 0x1E, 0xBD, 0x00, 0x45, 0x03, 0x62, 0x02, 0x19, 0x02, 0x0F, 0x04, 0x0F, 0x04
	.byte 0x67, 0x01, 0x94, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x27, 0x8F, 0x1E, 0xF1, 0x00, 0x46, 0x03
	.byte 0x63, 0x02, 0x1A, 0x02, 0x0F, 0x04, 0x0F, 0x04, 0x68, 0x01, 0x79, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x27, 0x8F, 0x1A, 0xBE, 0x00, 0x48, 0x03, 0x65, 0x02, 0x1C, 0x02, 0x0F, 0x04, 0x0F, 0x04
	.byte 0x69, 0x01, 0x94, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x27, 0x8F, 0x1A, 0xBF, 0x00, 0x49, 0x03
	.byte 0x66, 0x02, 0x1D, 0x02, 0x0F, 0x04, 0x0F, 0x04, 0x6A, 0x01, 0x94, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x28, 0x0F, 0x00, 0x42, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x0F, 0x04, 0x0F, 0x04
	.byte 0x00, 0x00, 0x94, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0x8F, 0x1E, 0x49, 0x00, 0x3E, 0x03
	.byte 0x5B, 0x02, 0x14, 0x02, 0x27, 0x04, 0x27, 0x04, 0x6B, 0x01, 0x94, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0x8F, 0x1E, 0x4D, 0x00, 0x3F, 0x03, 0x5C, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0x6C, 0x01, 0x94, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x1B, 0x9F, 0x1A, 0x68, 0x00, 0x3C, 0x03
	.byte 0x59, 0x02, 0x12, 0x02, 0x28, 0x04, 0x28, 0x04, 0x6D, 0x01, 0x94, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x32, 0x9F, 0x1A, 0x00, 0x01, 0x3D, 0x03, 0x5A, 0x02, 0x13, 0x02, 0x29, 0x04, 0x29, 0x04
	.byte 0x6E, 0x01, 0x94, 0xC9, 0x01, 0x04, 0x64, 0xA4, 0xFF, 0x5D, 0x7F, 0x1C, 0xF0, 0x00, 0x51, 0x00
	.byte 0x56, 0x01, 0x68, 0x00, 0x2E, 0x04, 0x2E, 0x04, 0x6F, 0x01, 0xE5, 0x91, 0x00, 0x81, 0x28, 0xF2
	.byte 0xFF, 0x2D, 0x9F, 0x28, 0xEE, 0x00, 0x8C, 0x03, 0xA9, 0x02, 0x59, 0x02, 0x82, 0x04, 0x82, 0x04
	.byte 0x70, 0x01, 0x76, 0x59, 0x00, 0x44, 0x60, 0xE4, 0xFF, 0x2D, 0x9F, 0x28, 0xEF, 0x00, 0x8D, 0x03
	.byte 0xAA, 0x02, 0x5A, 0x02, 0x82, 0x04, 0x82, 0x04, 0x71, 0x01, 0x76, 0x59, 0x00, 0x44, 0x60, 0xE4
	.byte 0x88, 0x11, 0x0F, 0x00, 0x00, 0x00, 0xAA, 0x00, 0x9F, 0x01, 0x41, 0x01, 0x21, 0x04, 0x21, 0x04
	.byte 0x72, 0x01, 0x96, 0xC3, 0x01, 0x02, 0x08, 0xF6, 0xFF, 0x19, 0x4F, 0x22, 0x42, 0x00, 0xCE, 0x00
	.byte 0xC3, 0x01, 0x63, 0x01, 0x1F, 0x04, 0x1F, 0x04, 0x73, 0x01, 0xA4, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x10, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x22, 0x04, 0x22, 0x04
	.byte 0x00, 0x00, 0xA8, 0xC6, 0x01, 0x02, 0x68, 0xF6, 0xFF, 0x19, 0x0F, 0x12, 0x42, 0x00, 0xAB, 0x00
	.byte 0xA0, 0x01, 0x42, 0x01, 0x21, 0x04, 0x21, 0x04, 0x74, 0x01, 0x96, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x3F, 0x0F, 0x1A, 0x45, 0x00, 0xAC, 0x00, 0xA1, 0x01, 0x43, 0x01, 0x21, 0x04, 0x21, 0x04
	.byte 0x75, 0x01, 0x96, 0xC9, 0x01, 0x44, 0x64, 0xE6, 0xFF, 0x3F, 0x0F, 0x1A, 0x45, 0x00, 0xAD, 0x00
	.byte 0xA2, 0x01, 0x44, 0x01, 0x21, 0x04, 0x21, 0x04, 0x76, 0x01, 0x96, 0xC9, 0x01, 0x44, 0x64, 0xE6
	.byte 0xFF, 0x3F, 0x0F, 0x12, 0x45, 0x00, 0xAE, 0x00, 0xA3, 0x01, 0x45, 0x01, 0x21, 0x04, 0x21, 0x04
	.byte 0x77, 0x01, 0x96, 0xC9, 0x01, 0x44, 0x64, 0xE6, 0xFF, 0x3F, 0x4F, 0x22, 0x46, 0x00, 0xCF, 0x00
	.byte 0xC4, 0x01, 0x64, 0x01, 0x1F, 0x04, 0x1F, 0x04, 0x78, 0x01, 0xA4, 0xC9, 0x01, 0x44, 0x64, 0xE6
	.byte 0x7D, 0x0F, 0x0F, 0x00, 0x00, 0x00, 0xD0, 0x00, 0xC5, 0x01, 0x03, 0x00, 0x1F, 0x04, 0x1F, 0x04
	.byte 0x79, 0x01, 0xA4, 0xC3, 0x01, 0x02, 0x08, 0xF6, 0xFF, 0x3F, 0x4F, 0x36, 0x46, 0x00, 0xD3, 0x00
	.byte 0xC8, 0x01, 0x67, 0x01, 0x20, 0x04, 0x20, 0x04, 0x7A, 0x01, 0xA6, 0xC9, 0x01, 0x44, 0x64, 0xE6
	.byte 0xFF, 0x3F, 0x5F, 0x3A, 0x45, 0x00, 0xBF, 0x03, 0xD8, 0x02, 0xE5, 0x02, 0x20, 0x04, 0x20, 0x04
	.byte 0x7B, 0x01, 0xA7, 0xC9, 0x01, 0x44, 0x64, 0xE6, 0xFF, 0x3F, 0xBF, 0x26, 0x46, 0x00, 0xC6, 0x00
	.byte 0xBB, 0x01, 0x5B, 0x01, 0x23, 0x04, 0x23, 0x04, 0x7C, 0x01, 0x9F, 0xC9, 0x01, 0x44, 0x64, 0xE6
	.byte 0xFF, 0x1B, 0x8F, 0x12, 0x68, 0x00, 0xF7, 0x02, 0x14, 0x02, 0xD4, 0x01, 0x28, 0x04, 0x28, 0x04
	.byte 0x7D, 0x01, 0x8D, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x33, 0x9F, 0x12, 0x01, 0x01, 0xF8, 0x02
	.byte 0x15, 0x02, 0xD5, 0x01, 0x29, 0x04, 0x29, 0x04, 0x7E, 0x01, 0x8D, 0xC9, 0x01, 0x04, 0x64, 0xA4
	.byte 0xFF, 0x1A, 0x8F, 0x12, 0x49, 0x00, 0xF9, 0x02, 0x16, 0x02, 0xD6, 0x01, 0x27, 0x04, 0x27, 0x04
	.byte 0x7F, 0x01, 0x8D, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x8F, 0x0E, 0x60, 0x00, 0xFB, 0x02
	.byte 0x18, 0x02, 0xD7, 0x01, 0x10, 0x04, 0x10, 0x04, 0x80, 0x01, 0x8D, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x9F, 0x0E, 0x61, 0x00, 0xFC, 0x02, 0x19, 0x02, 0xD8, 0x01, 0x10, 0x04, 0x10, 0x04
	.byte 0x81, 0x01, 0x8D, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x8F, 0x12, 0x60, 0x00, 0xFD, 0x02
	.byte 0x1A, 0x02, 0xD9, 0x01, 0x10, 0x04, 0x10, 0x04, 0x82, 0x01, 0x8D, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1B, 0x8F, 0x12, 0x12, 0x01, 0xFE, 0x02, 0x1B, 0x02, 0xDA, 0x01, 0x10, 0x04, 0x10, 0x04
	.byte 0x83, 0x01, 0x8D, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x1B, 0xCF, 0x1E, 0x68, 0x00, 0x00, 0x03
	.byte 0x1D, 0x02, 0xDC, 0x01, 0x28, 0x04, 0x28, 0x04, 0x84, 0x01, 0x8E, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0xCF, 0x1E, 0x49, 0x00, 0x01, 0x03, 0x1E, 0x02, 0xDD, 0x01, 0x27, 0x04, 0x27, 0x04
	.byte 0x85, 0x01, 0x8E, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x28, 0xCF, 0x1E, 0xC1, 0x00, 0x03, 0x03
	.byte 0x20, 0x02, 0xDE, 0x01, 0x11, 0x04, 0x11, 0x04, 0x86, 0x01, 0x8E, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0xCF, 0x1E, 0x60, 0x00, 0x04, 0x03, 0x21, 0x02, 0xDF, 0x01, 0x11, 0x04, 0x11, 0x04
	.byte 0x87, 0x01, 0x8E, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x2A, 0xCF, 0x1E, 0x8C, 0x00, 0x05, 0x03
	.byte 0x22, 0x02, 0xE0, 0x01, 0x11, 0x04, 0x11, 0x04, 0x88, 0x01, 0x8E, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x28, 0xCF, 0x1E, 0xC2, 0x00, 0x06, 0x03, 0x23, 0x02, 0xE1, 0x01, 0x11, 0x04, 0x11, 0x04
	.byte 0x89, 0x01, 0x8E, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x27, 0xCF, 0x1E, 0xC3, 0x00, 0x07, 0x03
	.byte 0x24, 0x02, 0xE2, 0x01, 0x11, 0x04, 0x11, 0x04, 0x8A, 0x01, 0x8E, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2B, 0xBF, 0x06, 0xFE, 0x00, 0xD9, 0x00, 0xCE, 0x01, 0x6C, 0x01, 0x25, 0x04, 0x25, 0x04
	.byte 0x8B, 0x01, 0xAD, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x2C, 0xBF, 0x2C, 0x06, 0x01, 0x89, 0x03
	.byte 0xA6, 0x02, 0x56, 0x02, 0x28, 0x04, 0x28, 0x04, 0x8C, 0x01, 0x83, 0x59, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2C, 0x5F, 0x1E, 0x06, 0x01, 0x1B, 0x03, 0x38, 0x02, 0xF4, 0x01, 0x28, 0x04, 0x28, 0x04
	.byte 0x8D, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x2C, 0x6F, 0x1E, 0x06, 0x01, 0x21, 0x03
	.byte 0x3E, 0x02, 0xFA, 0x01, 0x12, 0x04, 0x12, 0x04, 0x8E, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2C, 0x6F, 0x1E, 0x06, 0x01, 0x22, 0x03, 0x3F, 0x02, 0xFB, 0x01, 0x12, 0x04, 0x12, 0x04
	.byte 0x8F, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x2C, 0x8F, 0x1E, 0x06, 0x01, 0x47, 0x03
	.byte 0x64, 0x02, 0x1B, 0x02, 0x0F, 0x04, 0x0F, 0x04, 0x90, 0x01, 0x94, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2C, 0x9F, 0x20, 0x06, 0x01, 0x43, 0x00, 0x48, 0x01, 0x5F, 0x00, 0x36, 0x04, 0x36, 0x04
	.byte 0x91, 0x01, 0xD4, 0x99, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x2C, 0xAF, 0x28, 0x06, 0x01, 0x23, 0x00
	.byte 0x28, 0x01, 0x47, 0x00, 0xFE, 0x03, 0xFE, 0x03, 0x92, 0x01, 0xD0, 0x99, 0x00, 0x44, 0x64, 0xE4
	.byte 0x6B, 0x46, 0x4F, 0x0E, 0x04, 0x00, 0x08, 0x00, 0x0D, 0x01, 0x03, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0x93, 0x01, 0xC6, 0xC4, 0x01, 0x03, 0x98, 0xEE, 0x48, 0x61, 0x4F, 0x0E, 0x05, 0x00, 0x09, 0x00
	.byte 0x0E, 0x01, 0x32, 0x00, 0x31, 0x04, 0x31, 0x04, 0x94, 0x01, 0xC6, 0xC4, 0x01, 0x02, 0x08, 0xF6
	.byte 0x8C, 0x49, 0x8F, 0x0E, 0x4F, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x3A, 0x04, 0x3A, 0x04
	.byte 0x95, 0x01, 0xC7, 0xA4, 0x17, 0x03, 0x98, 0xEE, 0x8D, 0x49, 0x8F, 0x0E, 0x50, 0x00, 0x0B, 0x00
	.byte 0x10, 0x01, 0x03, 0x00, 0x3A, 0x04, 0x3A, 0x04, 0x96, 0x01, 0xC7, 0xA4, 0x17, 0x03, 0xA8, 0xEE
	.byte 0x6D, 0x53, 0xCF, 0x12, 0x07, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x3A, 0x04, 0x3A, 0x04
	.byte 0x97, 0x01, 0xC8, 0xC4, 0x17, 0x03, 0xA8, 0xEE, 0x4B, 0x68, 0x3F, 0x3E, 0x52, 0x00, 0x0D, 0x00
	.byte 0x12, 0x01, 0x03, 0x00, 0x38, 0x04, 0x38, 0x04, 0x98, 0x01, 0xCB, 0xA4, 0x01, 0x03, 0xA8, 0xEE
	.byte 0x4C, 0x68, 0x3F, 0x3E, 0x53, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x38, 0x04, 0x38, 0x04
	.byte 0x99, 0x01, 0xCB, 0xA4, 0x01, 0x03, 0xB8, 0xEE, 0x4D, 0x68, 0x3F, 0x3E, 0x54, 0x00, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x38, 0x04, 0x38, 0x04, 0x9A, 0x01, 0xCB, 0xA4, 0x01, 0x03, 0xB8, 0xEE
	.byte 0x4E, 0x68, 0x3F, 0x3E, 0x55, 0x00, 0x0E, 0x00, 0x13, 0x01, 0x03, 0x00, 0x38, 0x04, 0x38, 0x04
	.byte 0x9B, 0x01, 0xCB, 0xA4, 0x01, 0x03, 0xB8, 0xEE, 0xFF, 0x51, 0x3F, 0x3E, 0x08, 0x01, 0x0F, 0x00
	.byte 0x14, 0x01, 0x35, 0x00, 0x29, 0x04, 0x29, 0x04, 0x9C, 0x01, 0xCB, 0xA4, 0x01, 0x03, 0xB8, 0xAC
	.byte 0xFF, 0x46, 0x0F, 0x00, 0x08, 0x01, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x38, 0x04, 0x38, 0x04
	.byte 0x00, 0x00, 0xCB, 0xA4, 0x01, 0x03, 0x98, 0xE8, 0x59, 0x60, 0x9F, 0x21, 0x0A, 0x01, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x36, 0x04, 0x36, 0x04, 0x9D, 0x01, 0xDB, 0xA4, 0x00, 0x03, 0x58, 0xF4
	.byte 0x57, 0x66, 0x9F, 0x21, 0x0B, 0x01, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x36, 0x04, 0x36, 0x04
	.byte 0x9E, 0x01, 0xDB, 0xA4, 0x00, 0x03, 0x48, 0xF6, 0x58, 0x50, 0x9F, 0x21, 0x0C, 0x01, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x36, 0x04, 0x36, 0x04, 0x9F, 0x01, 0xDB, 0xA4, 0x00, 0x03, 0xA8, 0xEE
	.byte 0x4F, 0x50, 0x9F, 0x21, 0x0D, 0x01, 0x6A, 0x00, 0x6F, 0x01, 0x03, 0x00, 0x36, 0x04, 0x36, 0x04
	.byte 0xA0, 0x01, 0xDB, 0xA4, 0x00, 0x03, 0xA8, 0xEE, 0x50, 0x50, 0x9F, 0x21, 0x0E, 0x01, 0x8B, 0x00
	.byte 0x8F, 0x01, 0x03, 0x00, 0x36, 0x04, 0x36, 0x04, 0xA1, 0x01, 0xDB, 0xA4, 0x00, 0x03, 0x98, 0xEE
	.byte 0x51, 0x50, 0x9F, 0x21, 0x0F, 0x01, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x36, 0x04, 0x36, 0x04
	.byte 0xA2, 0x01, 0xDB, 0xA4, 0x00, 0x03, 0x98, 0xEE, 0xFF, 0x60, 0x9F, 0x21, 0x10, 0x01, 0x6B, 0x00
	.byte 0x70, 0x01, 0x7E, 0x00, 0xE9, 0x03, 0xE9, 0x03, 0xA3, 0x01, 0xDB, 0xA4, 0x0A, 0x03, 0x58, 0xF4
	.byte 0xFF, 0x1A, 0xCF, 0x12, 0x49, 0x00, 0xC0, 0x00, 0xB5, 0x01, 0x56, 0x01, 0x27, 0x04, 0x27, 0x04
	.byte 0xA4, 0x01, 0x9E, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x2C, 0xCF, 0x16, 0xFB, 0x00, 0xC3, 0x00
	.byte 0xB8, 0x01, 0x58, 0x01, 0x14, 0x04, 0x14, 0x04, 0xA5, 0x01, 0xC9, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2C, 0x0F, 0x00, 0xFC, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x1D, 0x04, 0x1D, 0x04
	.byte 0x00, 0x00, 0x99, 0xC9, 0x01, 0x44, 0x64, 0xE0, 0xFF, 0x2C, 0x8F, 0x16, 0xFD, 0x00, 0xB4, 0x00
	.byte 0xA9, 0x01, 0x4A, 0x01, 0x3A, 0x04, 0x3A, 0x04, 0xA6, 0x01, 0x99, 0xC9, 0x01, 0x44, 0x64, 0xE6
	.byte 0xFF, 0x2C, 0x8F, 0x22, 0xFD, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x3A, 0x04, 0x3A, 0x04
	.byte 0xA7, 0x01, 0x9A, 0xC9, 0x01, 0x44, 0x64, 0xE6, 0xFF, 0x2C, 0x0F, 0x0A, 0xF2, 0x00, 0xF3, 0x02
	.byte 0x10, 0x02, 0xD0, 0x01, 0x14, 0x04, 0x14, 0x04, 0xA8, 0x01, 0x8C, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0x0F, 0x0E, 0x42, 0x00, 0xF4, 0x02, 0x11, 0x02, 0xD1, 0x01, 0x14, 0x04, 0x14, 0x04
	.byte 0xA9, 0x01, 0x8C, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x36, 0x0F, 0x0A, 0x04, 0x01, 0xF0, 0x02
	.byte 0x0D, 0x02, 0xCE, 0x01, 0x29, 0x04, 0x29, 0x04, 0xAA, 0x01, 0x8C, 0xC9, 0x01, 0x04, 0x64, 0xA4
	.byte 0xFF, 0x1B, 0x1F, 0x0E, 0x68, 0x00, 0xEF, 0x02, 0x0C, 0x02, 0xCD, 0x01, 0x28, 0x04, 0x28, 0x04
	.byte 0xAB, 0x01, 0x8C, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0x0F, 0x0E, 0x49, 0x00, 0xF1, 0x02
	.byte 0x0E, 0x02, 0xCF, 0x01, 0x27, 0x04, 0x27, 0x04, 0xAC, 0x01, 0x8C, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0x0F, 0x0E, 0x4D, 0x00, 0xF2, 0x02, 0x0F, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0xAD, 0x01, 0x8C, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x1F, 0x0A, 0x42, 0x00, 0xF5, 0x02
	.byte 0x12, 0x02, 0xD2, 0x01, 0x14, 0x04, 0x14, 0x04, 0xAE, 0x01, 0x8C, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1B, 0x5F, 0x36, 0x68, 0x00, 0x28, 0x03, 0x45, 0x02, 0x01, 0x02, 0x28, 0x04, 0x28, 0x04
	.byte 0xAF, 0x01, 0x91, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x2C, 0x5F, 0x32, 0xF3, 0x00, 0x2C, 0x03
	.byte 0x49, 0x02, 0x04, 0x02, 0x13, 0x04, 0x13, 0x04, 0xB0, 0x01, 0x37, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x35, 0x5F, 0x36, 0x03, 0x01, 0x29, 0x03, 0x46, 0x02, 0x02, 0x02, 0x29, 0x04, 0x29, 0x04
	.byte 0xB1, 0x01, 0x91, 0xC9, 0x01, 0xE4, 0x64, 0xA4, 0xFF, 0x19, 0x5F, 0x36, 0x60, 0x00, 0x2D, 0x03
	.byte 0x4A, 0x02, 0x05, 0x02, 0x13, 0x04, 0x13, 0x04, 0xB2, 0x01, 0x91, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0x5F, 0x36, 0x49, 0x00, 0x2A, 0x03, 0x47, 0x02, 0x03, 0x02, 0x27, 0x04, 0x27, 0x04
	.byte 0xB3, 0x01, 0x91, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x6F, 0x36, 0x61, 0x00, 0x2E, 0x03
	.byte 0x4B, 0x02, 0x06, 0x02, 0x13, 0x04, 0x13, 0x04, 0xB4, 0x01, 0x91, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0xCF, 0x12, 0x4D, 0x00, 0xC1, 0x00, 0xB6, 0x01, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0xB5, 0x01, 0x9E, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0x5F, 0x36, 0x4D, 0x00, 0x2B, 0x03
	.byte 0x48, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0xB6, 0x01, 0x91, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0x30, 0x62, 0x7F, 0x2C, 0x13, 0x01, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0xB7, 0x01, 0xDA, 0xB4, 0x00, 0xA3, 0xB8, 0x8E, 0x18, 0x47, 0xBF, 0x1C, 0x1B, 0x00, 0x1A, 0x00
	.byte 0x1F, 0x01, 0x3F, 0x00, 0x44, 0x04, 0x44, 0x04, 0xB8, 0x01, 0xCF, 0x97, 0x00, 0x01, 0x08, 0xA4
	.byte 0xFF, 0x47, 0xBF, 0x1C, 0x1B, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x33, 0x04, 0x33, 0x04
	.byte 0x00, 0x00, 0xCF, 0x97, 0x00, 0x01, 0x08, 0xA6, 0xFF, 0x2C, 0xCF, 0x16, 0x14, 0x01, 0xC4, 0x00
	.byte 0xB9, 0x01, 0x59, 0x01, 0x14, 0x04, 0x14, 0x04, 0xB9, 0x01, 0xC9, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0x0B, 0x69, 0xDF, 0x20, 0x25, 0x00, 0x35, 0x00, 0x3A, 0x01, 0x54, 0x00, 0x32, 0x04, 0x32, 0x04
	.byte 0xBA, 0x01, 0xD1, 0x94, 0x00, 0x03, 0x88, 0xEC, 0x0D, 0x69, 0xDF, 0x20, 0xB5, 0x00, 0x36, 0x00
	.byte 0x3B, 0x01, 0x55, 0x00, 0x32, 0x04, 0x32, 0x04, 0xBB, 0x01, 0xD1, 0x94, 0x00, 0x43, 0x84, 0xE4
	.byte 0x0C, 0x69, 0xDF, 0x20, 0x25, 0x00, 0x37, 0x00, 0x3C, 0x01, 0x56, 0x00, 0x32, 0x04, 0x32, 0x04
	.byte 0xBC, 0x01, 0xD1, 0x94, 0x00, 0x03, 0x88, 0xEC, 0xFF, 0x3F, 0x7F, 0x1E, 0x46, 0x00, 0xBB, 0x00
	.byte 0xB0, 0x01, 0x51, 0x01, 0x1F, 0x04, 0x1F, 0x04, 0xBD, 0x01, 0x9B, 0xC9, 0x01, 0x44, 0x64, 0xE6
	.byte 0xFF, 0x1A, 0xCF, 0x1E, 0x4D, 0x00, 0x02, 0x03, 0x1F, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0xBE, 0x01, 0x8E, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0x8F, 0x12, 0x4D, 0x00, 0xFA, 0x02
	.byte 0x17, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0xBF, 0x01, 0x8D, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x37, 0x0F, 0x1E, 0x05, 0x01, 0xE7, 0x02, 0x04, 0x02, 0xC6, 0x01, 0x29, 0x04, 0x29, 0x04
	.byte 0xC0, 0x01, 0x8B, 0xC9, 0x01, 0x04, 0x64, 0xA4, 0xFF, 0x19, 0x0F, 0x1E, 0x60, 0x00, 0xEA, 0x02
	.byte 0x07, 0x02, 0xC8, 0x01, 0x15, 0x04, 0x15, 0x04, 0xC1, 0x01, 0x8B, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2B, 0x0F, 0x1E, 0xF4, 0x00, 0xEB, 0x02, 0x08, 0x02, 0xC9, 0x01, 0x15, 0x04, 0x15, 0x04
	.byte 0xC2, 0x01, 0x8B, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x2B, 0x0F, 0x1E, 0xF5, 0x00, 0xEC, 0x02
	.byte 0x09, 0x02, 0xCA, 0x01, 0x15, 0x04, 0x15, 0x04, 0xC3, 0x01, 0x8B, 0xC9, 0x01, 0x44, 0x60, 0xE4
	.byte 0xFF, 0x1B, 0x0F, 0x1E, 0x68, 0x00, 0xE6, 0x02, 0x03, 0x02, 0xC5, 0x01, 0x28, 0x04, 0x28, 0x04
	.byte 0xC4, 0x01, 0x8B, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0x0F, 0x22, 0x49, 0x00, 0xE8, 0x02
	.byte 0x05, 0x02, 0xC7, 0x01, 0x27, 0x04, 0x27, 0x04, 0xC5, 0x01, 0x8B, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0x0F, 0x22, 0x4D, 0x00, 0xE9, 0x02, 0x06, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0xC6, 0x01, 0x8B, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x2B, 0x0F, 0x2E, 0xF6, 0x00, 0xE0, 0x02
	.byte 0xFD, 0x01, 0xBF, 0x01, 0x16, 0x04, 0x16, 0x04, 0xC7, 0x01, 0x8A, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2B, 0x0F, 0x2E, 0xF8, 0x00, 0xE2, 0x02, 0xFF, 0x01, 0xC1, 0x01, 0x16, 0x04, 0x16, 0x04
	.byte 0xC8, 0x01, 0x8A, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x2B, 0x0F, 0x2E, 0xFA, 0x00, 0xE4, 0x02
	.byte 0x01, 0x02, 0xC3, 0x01, 0x16, 0x04, 0x16, 0x04, 0xC9, 0x01, 0x8A, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2B, 0x0F, 0x2E, 0xF7, 0x00, 0xE1, 0x02, 0xFE, 0x01, 0xC0, 0x01, 0x16, 0x04, 0x16, 0x04
	.byte 0xCA, 0x01, 0x8A, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x2B, 0x0F, 0x2E, 0xF9, 0x00, 0xE3, 0x02
	.byte 0x00, 0x02, 0xC2, 0x01, 0x16, 0x04, 0x16, 0x04, 0xCB, 0x01, 0x8A, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0x0F, 0x3E, 0x49, 0x00, 0x30, 0x03, 0x4D, 0x02, 0x08, 0x02, 0x27, 0x04, 0x27, 0x04
	.byte 0xCC, 0x01, 0x92, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0x0F, 0x3E, 0x4D, 0x00, 0x31, 0x03
	.byte 0x4E, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0xCD, 0x01, 0x92, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x19, 0xAF, 0x21, 0x42, 0x00, 0xE0, 0x00, 0xD5, 0x01, 0x74, 0x01, 0x3D, 0x04, 0x3D, 0x04
	.byte 0xCE, 0x01, 0xB0, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0x4F, 0x0E, 0x49, 0x00, 0xB0, 0x00
	.byte 0xA5, 0x01, 0x47, 0x01, 0x27, 0x04, 0x27, 0x04, 0xCF, 0x01, 0x97, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0x4F, 0x0E, 0x4D, 0x00, 0xB1, 0x00, 0xA6, 0x01, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0xD0, 0x01, 0x97, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0x49, 0x61, 0x4F, 0x0E, 0x19, 0x01, 0x0A, 0x00
	.byte 0x0F, 0x01, 0x33, 0x00, 0x49, 0x04, 0x49, 0x04, 0xD1, 0x01, 0xC6, 0xC4, 0x01, 0x02, 0x08, 0xF6
	.byte 0xFF, 0x1A, 0x9F, 0x21, 0x49, 0x00, 0xB6, 0x03, 0xD3, 0x02, 0x7D, 0x02, 0x27, 0x04, 0x27, 0x04
	.byte 0xD2, 0x01, 0x89, 0x99, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0x9F, 0x21, 0x4D, 0x00, 0xB7, 0x03
	.byte 0xD4, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0xD3, 0x01, 0x89, 0x99, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2D, 0x0F, 0x00, 0x18, 0x01, 0x93, 0x00, 0x90, 0x01, 0xD4, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0xD4, 0x01, 0x00, 0xA9, 0x00, 0x44, 0x64, 0x04, 0xFF, 0x19, 0x8F, 0x16, 0x42, 0x00, 0xB7, 0x00
	.byte 0xAC, 0x01, 0x4D, 0x01, 0x1D, 0x04, 0x1D, 0x04, 0xD5, 0x01, 0x99, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1B, 0x4F, 0x0E, 0x8B, 0x00, 0x06, 0x00, 0x0B, 0x01, 0x30, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0xD6, 0x01, 0xC6, 0xC9, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x30, 0xAF, 0x28, 0x1A, 0x01, 0x7F, 0x03
	.byte 0x9C, 0x02, 0x03, 0x00, 0xFE, 0x03, 0xFE, 0x03, 0xD7, 0x01, 0x83, 0x59, 0x00, 0x44, 0x60, 0xE4
	.byte 0xFF, 0x30, 0x8F, 0x1A, 0x1B, 0x01, 0x44, 0x03, 0x61, 0x02, 0x03, 0x00, 0x0F, 0x04, 0x0F, 0x04
	.byte 0xD8, 0x01, 0x94, 0xC9, 0x01, 0x44, 0x60, 0xE4, 0xFF, 0x64, 0x4F, 0x05, 0x15, 0x01, 0x82, 0x00
	.byte 0x87, 0x01, 0x91, 0x00, 0x90, 0x04, 0x90, 0x04, 0xD9, 0x01, 0xE7, 0xA3, 0x0A, 0x02, 0x08, 0xA4
	.byte 0xFF, 0x65, 0x4F, 0x05, 0x16, 0x01, 0x83, 0x00, 0x88, 0x01, 0x92, 0x00, 0x90, 0x04, 0x90, 0x04
	.byte 0xDA, 0x01, 0xE7, 0xA4, 0x00, 0x03, 0x98, 0x24, 0xFF, 0x2A, 0x4F, 0x05, 0x1F, 0x01, 0x84, 0x00
	.byte 0x89, 0x01, 0x93, 0x00, 0x90, 0x04, 0x90, 0x04, 0xDB, 0x01, 0xE7, 0xA9, 0x00, 0x44, 0x64, 0xA4
	.byte 0xFF, 0x63, 0x2F, 0x30, 0x17, 0x01, 0x85, 0x00, 0x8A, 0x01, 0x94, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0xDC, 0x01, 0xE8, 0xA4, 0x00, 0x03, 0x94, 0xAC, 0xFF, 0x63, 0x2F, 0x30, 0x1C, 0x01, 0x86, 0x00
	.byte 0x8B, 0x01, 0x95, 0x00, 0x31, 0x04, 0x31, 0x04, 0xDD, 0x01, 0xE8, 0xA4, 0x00, 0x03, 0x94, 0xAC
	.byte 0xFF, 0x63, 0x2F, 0x30, 0x1D, 0x01, 0x87, 0x00, 0x8C, 0x01, 0x96, 0x00, 0x31, 0x04, 0x31, 0x04
	.byte 0xDE, 0x01, 0xE8, 0xA4, 0x00, 0x03, 0x94, 0xAC, 0xFF, 0x3F, 0x0F, 0x26, 0x45, 0x00, 0xED, 0x02
	.byte 0x0A, 0x02, 0xCB, 0x01, 0x15, 0x04, 0x15, 0x04, 0xDF, 0x01, 0x95, 0xC9, 0x01, 0x44, 0x64, 0xE6
	.byte 0xFF, 0x1A, 0x7F, 0x1C, 0x49, 0x00, 0x4E, 0x00, 0x53, 0x01, 0x66, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0xE0, 0x01, 0xE5, 0x99, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0x7F, 0x1C, 0x4D, 0x00, 0x4F, 0x00
	.byte 0x54, 0x01, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0xE1, 0x01, 0xE5, 0x99, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1B, 0x7F, 0x1C, 0x68, 0x00, 0x4D, 0x00, 0x52, 0x01, 0x65, 0x00, 0x28, 0x04, 0x28, 0x04
	.byte 0xE2, 0x01, 0xE5, 0x99, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x19, 0x7F, 0x1C, 0x61, 0x00, 0x52, 0x00
	.byte 0x57, 0x01, 0x69, 0x00, 0x2E, 0x04, 0x2E, 0x04, 0xE3, 0x01, 0xE5, 0x99, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x2C, 0x8F, 0x16, 0xFC, 0x00, 0xB5, 0x00, 0xAA, 0x01, 0x4B, 0x01, 0x3A, 0x04, 0x3A, 0x04
	.byte 0xE4, 0x01, 0x99, 0xC9, 0x01, 0x44, 0x64, 0xE6, 0xFF, 0x19, 0xCF, 0x26, 0x42, 0x00, 0xC8, 0x00
	.byte 0xBD, 0x01, 0x5D, 0x01, 0x24, 0x04, 0x24, 0x04, 0xE5, 0x01, 0xA0, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x1A, 0x2F, 0x24, 0x49, 0x00, 0x75, 0x00, 0x7A, 0x01, 0x86, 0x00, 0x27, 0x04, 0x27, 0x04
	.byte 0xE6, 0x01, 0xE3, 0x89, 0x00, 0x44, 0x64, 0xE4, 0xFF, 0x1A, 0x2F, 0x24, 0x4D, 0x00, 0x76, 0x00
	.byte 0x7B, 0x01, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0xE7, 0x01, 0xE3, 0x89, 0x00, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x42, 0xAF, 0x2C, 0x1E, 0x01, 0x8E, 0x03, 0xAB, 0x02, 0x5B, 0x02, 0x2D, 0x04, 0x2D, 0x04
	.byte 0xE8, 0x01, 0x83, 0x59, 0x01, 0x44, 0x64, 0xE4, 0xFF, 0x42, 0x6F, 0x1E, 0x1E, 0x01, 0x26, 0x03
	.byte 0x43, 0x02, 0xFF, 0x01, 0x2D, 0x04, 0x2D, 0x04, 0xE9, 0x01, 0x90, 0xC9, 0x01, 0x44, 0x64, 0xE4
	.byte 0xFF, 0x04, 0x0F, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x8F, 0x01, 0x03, 0x00, 0x2D, 0x04, 0x2D, 0x04
	.byte 0x00, 0x00, 0x00, 0xA6, 0x00, 0x02, 0x60, 0x00, 0xFF, 0x1A, 0x0F, 0x00, 0x4D, 0x00, 0x3A, 0x03
	.byte 0x57, 0x02, 0x03, 0x00, 0x27, 0x04, 0x27, 0x04, 0xEA, 0x01, 0x0F, 0xC9, 0x00, 0x44, 0x64, 0xE4
_020F9E80:
	.byte 0x0B, 0x03
_020F9E82:
	.byte 0x3F, 0x00, 0x06, 0x08
_020F9E86:
	.byte 0x3C, 0x00
_020F9E88:
	.byte 0xB7, 0x02
_020F9E8A:
	.byte 0x8D, 0x01
_020F9E8C:
	.byte 0x3C, 0x00
_020F9E8E:
	.byte 0xB7, 0x02
_020F9E90:
	.byte 0x8D, 0x01, 0x0C, 0x03, 0x45, 0x00, 0x08, 0x0D, 0x43, 0x00, 0x34, 0x02, 0x88, 0x01, 0x43, 0x00
	.byte 0x34, 0x02, 0x88, 0x01, 0x0D, 0x03, 0x9E, 0x00, 0x08, 0x0D, 0x49, 0x00, 0xF1, 0x01, 0x10, 0x01
	.byte 0x49, 0x00, 0xF1, 0x01, 0x10, 0x01, 0x0E, 0x03, 0xA6, 0x00, 0x08, 0x0D, 0x4A, 0x00, 0x9A, 0x01
	.byte 0xCD, 0x01, 0x4A, 0x00, 0x9A, 0x01, 0xCD, 0x01, 0x0F, 0x03, 0xEC, 0x00, 0x08, 0x0D, 0x4B, 0x00
	.byte 0xBB, 0x00, 0x72, 0x01, 0x4B, 0x00, 0xBB, 0x00, 0x72, 0x01, 0x10, 0x03, 0xB9, 0x00, 0x08, 0x0D
	.byte 0x4C, 0x00, 0x60, 0x01, 0x71, 0x01, 0x4C, 0x00, 0x60, 0x01, 0x71, 0x01, 0x11, 0x03, 0xE2, 0x00
	.byte 0x08, 0x0D, 0x4D, 0x00, 0x10, 0x01, 0x02, 0x01, 0x4D, 0x00, 0x10, 0x01, 0x02, 0x01, 0x12, 0x03
	.byte 0x51, 0x00, 0x08, 0x0D, 0x4E, 0x00, 0x8D, 0x01, 0xB8, 0x00, 0x4E, 0x00, 0x8D, 0x01, 0xB8, 0x00
	.byte 0x13, 0x03, 0xF6, 0x00, 0x08, 0x0D, 0x57, 0x00, 0x16, 0x02, 0xB8, 0x00, 0x57, 0x00, 0x16, 0x02
	.byte 0xB8, 0x00, 0x14, 0x02, 0x58, 0x00, 0x08, 0x0D, 0x58, 0x00, 0x18, 0x02, 0x5A, 0x00, 0x58, 0x00
	.byte 0x18, 0x02, 0x5A, 0x00, 0x15, 0x03, 0x25, 0x01, 0x08, 0x0D, 0x59, 0x00, 0xA2, 0x02, 0xB1, 0x00
	.byte 0x59, 0x00, 0xA2, 0x02, 0xB1, 0x00, 0x16, 0x03, 0x02, 0x02, 0x08, 0x0D, 0x5A, 0x00, 0x34, 0x03
	.byte 0x0A, 0x01, 0x5A, 0x00, 0x34, 0x03, 0x0A, 0x01, 0x00, 0x02, 0x31, 0x00, 0x08, 0x0D, 0x31, 0x00
	.byte 0x09, 0x04, 0x6C, 0x01, 0x31, 0x00, 0x09, 0x04, 0x6C, 0x01, 0x01, 0x03, 0xF5, 0x01, 0x08, 0x0D
	.byte 0x32, 0x00, 0x08, 0x04, 0x07, 0x01, 0x32, 0x00, 0x08, 0x04, 0x07, 0x01, 0x02, 0x03, 0xDB, 0x01
	.byte 0x08, 0x0D, 0x33, 0x00, 0x18, 0x04, 0x6B, 0x00, 0x33, 0x00, 0x18, 0x04, 0x6B, 0x00, 0x03, 0x03
	.byte 0xAC, 0x01, 0x08, 0x0D, 0x34, 0x00, 0x1D, 0x05, 0x84, 0x00, 0x34, 0x00, 0x1D, 0x05, 0x84, 0x00
	.byte 0x04, 0x03, 0xB2, 0x01, 0x08, 0x0D, 0x35, 0x00, 0x8A, 0x05, 0xEB, 0x00, 0x35, 0x00, 0x8A, 0x05
	.byte 0xEB, 0x00, 0x05, 0x03, 0x66, 0x01, 0x08, 0x0D, 0x36, 0x00, 0x11, 0x05, 0x27, 0x01, 0x36, 0x00
	.byte 0x11, 0x05, 0x27, 0x01, 0x06, 0x03, 0x89, 0x01, 0x08, 0x0D, 0x37, 0x00, 0xCF, 0x04, 0xEE, 0x00
	.byte 0x37, 0x00, 0xCF, 0x04, 0xEE, 0x00, 0x07, 0x03, 0xE2, 0x01, 0x08, 0x0D, 0x38, 0x00, 0xB9, 0x04
	.byte 0xB8, 0x01, 0x38, 0x00, 0xB9, 0x04, 0xB8, 0x01, 0x08, 0x02, 0xFC, 0x01, 0x08, 0x0D, 0x39, 0x00
	.byte 0x0F, 0x04, 0xF7, 0x01, 0x39, 0x00, 0x0F, 0x04, 0xF7, 0x01, 0x09, 0x03, 0x2C, 0x01, 0x06, 0x15
	.byte 0x3A, 0x00, 0x90, 0x03, 0xC9, 0x00, 0x3A, 0x00, 0x90, 0x03, 0xC9, 0x00, 0x0A, 0x03, 0x97, 0x01
	.byte 0x08, 0x0D, 0x3B, 0x00, 0x0E, 0x05, 0xF3, 0x00, 0x3B, 0x00, 0x0E, 0x05, 0xF3, 0x00, 0x1E, 0x03
	.byte 0x16, 0x02, 0x08, 0x0D, 0xAE, 0x00, 0x52, 0x00, 0x2F, 0x01, 0xAE, 0x00, 0x52, 0x00, 0x2F, 0x01
	.byte 0x1F, 0x03, 0x10, 0x02, 0x08, 0x0D, 0x9B, 0x01, 0x08, 0x00, 0x0F, 0x00, 0x5E, 0x00, 0xED, 0x00
	.byte 0x0B, 0x01, 0x23, 0x00, 0x18, 0x01, 0x08, 0x0D, 0x18, 0x01, 0x2A, 0x00, 0x17, 0x00, 0x27, 0x00
	.byte 0x6A, 0x01, 0x0B, 0x01, 0x21, 0x00, 0x2B, 0x01, 0x08, 0x0D, 0x1E, 0x00, 0x8D, 0x03, 0x29, 0x01
	.byte 0x1E, 0x00, 0x8D, 0x03, 0x29, 0x01, 0x1B, 0x01, 0xA9, 0x00, 0x08, 0x0D, 0x24, 0x00, 0xD4, 0x01
	.byte 0xA3, 0x01, 0x24, 0x00, 0xD4, 0x01, 0xA3, 0x01, 0x24, 0x01, 0xFF, 0x01, 0x08, 0x0D, 0x0B, 0x00
	.byte 0x8F, 0x04, 0x6B, 0x00, 0x0B, 0x00, 0x8F, 0x04, 0x6B, 0x00, 0x25, 0x01, 0xD2, 0x01, 0x08, 0x0D
	.byte 0x12, 0x00, 0x92, 0x05, 0xA4, 0x00, 0x12, 0x00, 0x92, 0x05, 0xA4, 0x00
_020FA09C:
	.byte 0x01, 0x01, 0x01, 0x1F
	.byte 0x02, 0x01, 0x02, 0x1D, 0x03, 0x0F, 0x0A, 0x0A, 0x0C, 0x03, 0x0C, 0x1F
_020FA0AC:
	.byte 0x01, 0x04, 0x00, 0x00
_020FA0B0:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00
_020FA0B8:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
	.byte 0xFF, 0x00, 0x00, 0x00
_020FA0C4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020FA0F8:
	.byte 0xFD, 0xC8, 0x03, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x45, 0xCA, 0x03, 0x02, 0x02, 0x00, 0x00, 0x00, 0x0D, 0xCF, 0x03, 0x02, 0x03, 0x00, 0x00, 0x00
	.byte 0xA9, 0xD1, 0x03, 0x02, 0x04, 0x00, 0x00, 0x00, 0x45, 0xD2, 0x03, 0x02, 0x05, 0x00, 0x00, 0x00
	.byte 0x19, 0xD3, 0x03, 0x02, 0x06, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF, 0x07, 0x00, 0x00, 0x00
	.byte 0x95, 0xD3, 0x03, 0x02, 0x08, 0x00, 0x00, 0x00, 0x89, 0xD4, 0x03, 0x02, 0x0E, 0x00, 0x00, 0x00
	.byte 0x01, 0xD5, 0x03, 0x02, 0x0E, 0x00, 0x00, 0x00, 0x01, 0xD5, 0x03, 0x02, 0x0E, 0x00, 0x00, 0x00
	.byte 0x01, 0xD5, 0x03, 0x02, 0x0E, 0x00, 0x00, 0x00, 0xCD, 0xD2, 0x03, 0x02
	.public _020FA15C
_020FA15C:
	.word sub_0203DEA4, sub_0203DEBC, sub_0203DED4, 0xFFFFFFFF
	.public _020FA16C
_020FA16C:
	.word sub_0203DE74, sub_0203DEBC, sub_0203DED4, 0xFFFFFFFF
_020FA17C:
	.byte 0x40, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_020FA190:
	.byte 0x3C, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xB7, 0x02, 0x00, 0x00, 0x8D, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
_020FA1A4:
	.byte 0x00, 0xFF, 0x00, 0x00
_020FA1A8:
	.byte 0x01, 0x04, 0x00, 0x00
_020FA1AC:
	.byte 0x04, 0xFF, 0x00, 0x00
_020FA1B0:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00
_020FA1B8:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
	.byte 0xFF, 0x00, 0x00, 0x00
_020FA1C4:
	.word sub_020192D0, sub_0201935C, sub_02019490, SDK_OVERLAY_OVY_39_ID
_020FA1D4:
	.word ov105_021E5900, ov105_021E59DC, ov105_021E5B14, SDK_OVERLAY_OVY_105_ID
_020FA1E4:
	.word ov68_021E5900, ov68_021E5968, ov68_021E5A3C, SDK_OVERLAY_OVY_68_ID
_020FA1F4:
	.word ov76_021E5900, ov76_021E5B60, ov76_021E5AA0, SDK_OVERLAY_OVY_76_ID
_020FA204:
	.word ov64_021E5900, ov64_021E5A18, ov64_021E59C8, SDK_OVERLAY_OVY_64_ID
_020FA214:
	.word ov63_0221BE20, ov63_0221BF88, ov63_0221BF28, SDK_OVERLAY_OVY_63_ID
_020FA224:
	.word ov69_021E5900, ov69_021E5A34, ov69_021E6080, SDK_OVERLAY_OVY_69_ID
_020FA234:
	.word ov122_021E82A8, ov122_021E8360, ov122_021E8308, SDK_OVERLAY_OVY_122_ID
_020FA244:
	.word ov96_021E5900, ov96_021E5A40, ov96_021E5B88, SDK_OVERLAY_OVY_96_ID
_020FA254:
	.word ov52_021E80C0, ov52_021E8248, ov52_021E82AC, SDK_OVERLAY_OVY_52_ID
_020FA264:
	.word ov70_02238430, ov70_022385C0, ov70_022386F4, SDK_OVERLAY_OVY_70_ID
_020FA274:
	.word ov61_021E5900, ov61_021E5A38, ov61_021E5F74, SDK_OVERLAY_OVY_61_ID
_020FA284:
	.word ov18_021E5AA0, ov18_021E5B64, ov18_021E5B80, SDK_OVERLAY_OVY_18_ID
_020FA294:
	.word ov50_021E5924, ov50_021E595C, ov50_021E59A8, SDK_OVERLAY_OVY_50_ID
_020FA2A4:
	.word ov43_02229EE0, ov43_02229FB4, ov43_0222A0AC, SDK_OVERLAY_OVY_43_ID
_020FA2B4:
	.word ov73_021E5900, ov73_021E5AB8, ov73_021E5BAC, SDK_OVERLAY_OVY_73_ID
_020FA2C4:
	.word ov37_021E5900, ov37_021E5A84, ov37_021E5B94, SDK_OVERLAY_OVY_37_ID
_020FA2D4:
	.word ov71_02246960, ov71_02246BB8, ov71_02246B58, SDK_OVERLAY_OVY_71_ID
_020FA2E4:
	.word ov67_021E5900, ov67_021E5984, ov67_021E5968, SDK_OVERLAY_OVY_67_ID
_020FA2F4:
	.word ov103_021EC940, ov103_021EC988, ov103_021EC9A4, SDK_OVERLAY_OVY_103_ID
_020FA304:
	.word ov78_021E5900, ov78_021E59EC, ov78_021E5B24, SDK_OVERLAY_OVY_78_ID
_020FA314:
	.word ov99_021E7818, ov99_021E794C, ov99_021E78F0, SDK_OVERLAY_OVY_99_ID
_020FA324:
	.word ov99_021E8304, ov99_021E83F4, ov99_021E83AC, SDK_OVERLAY_OVY_99_ID
_020FA334:
	.word ov72_02237E20, ov72_02237F9C, ov72_02238070, SDK_OVERLAY_OVY_72_ID
_020FA344:
	.word ov99_021E5900, ov99_021E5A38, ov99_021E5A04, SDK_OVERLAY_OVY_99_ID
_020FA354:
	.word ov54_021E5900, ov54_021E5B3C, ov54_021E5A10, SDK_OVERLAY_OVY_54_ID
_020FA364:
	.word ov111_021E5900, ov111_021E59B8, ov111_021E5960, SDK_OVERLAY_OVY_111_ID
_020FA374:
	.word ov58_022378E4, ov58_02237924, ov58_0223799C, SDK_OVERLAY_OVY_58_ID
_020FA384:
	.word ov16_0220196C, ov16_022019B8, ov16_02201A04, SDK_OVERLAY_OVY_16_ID
_020FA394:
	.word ov113_021E5900, ov113_021E5968, ov113_021E59C8, SDK_OVERLAY_OVY_113_ID
_020FA3A4:
	.word ov110_021E5900, ov110_021E5974, ov110_021E59F4, SDK_OVERLAY_OVY_110_ID
_020FA3B4:
	.word ov109_021E5900, ov109_021E5968, ov109_021E59F0, SDK_OVERLAY_OVY_109_ID
_020FA3C4:
	.word ov108_021E8850, ov108_021E8904, ov108_021E88C4, SDK_OVERLAY_OVY_108_ID
_020FA3D4:
	.word ov108_021E5900, ov108_021E5978, ov108_021E5948, SDK_OVERLAY_OVY_108_ID
_020FA3E4:
	.word ov101_Radio_OvyInit, ov101_Radio_OvyExec, ov101_Radio_OvyExit, SDK_OVERLAY_OVY_101_ID
_020FA3F4:
	.word ov100_021E642C, ov100_021E6520, ov100_021E65BC, SDK_OVERLAY_OVY_100_ID
_020FA404:
	.word ov102_021E7740, ov102_021E77B8, ov102_021E7868, SDK_OVERLAY_OVY_102_ID
_020FA414:
	.word ov14_021E5900, ov14_021E596C, ov14_021E5988, SDK_OVERLAY_OVY_14_ID
_020FA424:
	.word ov99_021E677C, ov99_021E6888, ov99_021E6840, SDK_OVERLAY_OVY_99_ID
_020FA434:
	.word ov55_021E5924, ov55_021E598C, ov55_021E5AE8, SDK_OVERLAY_OVY_55_ID
_020FA444:
	.word ov73_021E7E4C, ov73_021E7FB8, ov73_021E808C, SDK_OVERLAY_OVY_72_ID
_020FA454:
	.word ov104_021E5900, ov104_021E59E4, ov104_021E5B14, SDK_OVERLAY_OVY_104_ID
_020FA464:
	.word ov15_021F9380, ov15_021F9608, ov15_021F982C, SDK_OVERLAY_OVY_15_ID
_020FA474:
	.word sub_02097B78, sub_02097BAC, sub_02097BD0, SDK_OVERLAY_OVY_106_ID
_020FA484:
	.word sub_0203E3A8, sub_0203E3AC, sub_0203E3C0, SDK_OVERLAY_OVY_12_ID
_020FA494:
	.word ov121_021E5900, ov121_021E590C, ov121_021E59BC, SDK_OVERLAY_OVY_121_ID
_020FA4A4:
	.byte 0xFA, 0x28, 0x07, 0x01, 0xB1, 0x01, 0xD2, 0x28, 0x08, 0x01, 0x13, 0x00
	.byte 0xC8, 0x28, 0x02, 0x00, 0xEC, 0x02, 0xA0, 0x28, 0x97, 0x00, 0xF6, 0x00, 0x6E, 0x28, 0xB8, 0x03
	.byte 0xD6, 0x02, 0x3C, 0x28, 0xDE, 0x02, 0xBC, 0x01, 0xD8, 0x27, 0x90, 0x00, 0xD1, 0x00, 0xA6, 0x27
	.byte 0xBB, 0x03, 0xDC, 0x02, 0x74, 0x27, 0xBA, 0x03, 0xDD, 0x02, 0x10, 0x27, 0x92, 0x00, 0xD3, 0x00
	.byte 0xDE, 0x26, 0x94, 0x00, 0x9A, 0x02, 0xAC, 0x26, 0x88, 0x00, 0x28, 0x00, 0x7A, 0x26, 0xA7, 0x00
	.byte 0x38, 0x01, 0x48, 0x26, 0xA6, 0x00, 0x2B, 0x00, 0xE4, 0x25, 0xA3, 0x00, 0x0A, 0x01, 0x80, 0x25
	.byte 0x95, 0x00, 0x28, 0x00, 0x1C, 0x25, 0x09, 0x01, 0xB7, 0x01, 0x54, 0x24, 0x8F, 0x00, 0xCC, 0x00
	.byte 0xF0, 0x23, 0xA4, 0x00, 0x0B, 0x01, 0x8C, 0x23, 0x00, 0x00, 0x0E, 0x00, 0x28, 0x23, 0x04, 0x00
	.byte 0x2E, 0x00, 0xC4, 0x22, 0xA5, 0x00, 0x0C, 0x01, 0x60, 0x22, 0x06, 0x01, 0xAB, 0x01, 0x40, 0x1F
	.byte 0x91, 0x00, 0xD2, 0x00, 0x58, 0x1B, 0x8D, 0x00, 0xC7, 0x00, 0x88, 0x13, 0xB9, 0x03, 0x28, 0x00
	.byte 0xB8, 0x0B, 0xB9, 0x03, 0x28, 0x00, 0xF0, 0x0A, 0x96, 0x00, 0x17, 0x00, 0xC4, 0x09, 0x01, 0x00
	.byte 0x14, 0x00, 0xD0, 0x07, 0x03, 0x00, 0x28, 0x00
_020FA558:
	.byte 0x11, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE1, 0x00
	.byte 0x11, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0E, 0x00
	.byte 0x27, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00
	.byte 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x11, 0x00, 0x28, 0x00, 0x01, 0x00, 0x00, 0x00, 0x12, 0x00
	.byte 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x6C, 0x00
	.byte 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x92, 0x00, 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0x93, 0x00
	.byte 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0x94, 0x00, 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x95, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x96, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x97, 0x00
	.byte 0x16, 0x00, 0x01, 0x00, 0x00, 0x00, 0x98, 0x00, 0x59, 0x00, 0x01, 0x00, 0x00, 0x00, 0x9A, 0x00
	.byte 0x3B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x99, 0x00, 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x9B, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x31, 0x00, 0x01, 0x00, 0x00, 0x00, 0x9D, 0x00
	.byte 0x5D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00
	.byte 0x1A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x61, 0x00, 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x1A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1C, 0x00
	.byte 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x12, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1E, 0x00
	.byte 0x1A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00
	.byte 0x26, 0x00, 0x01, 0x00, 0x00, 0x00, 0x21, 0x00, 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD3, 0x00
	.byte 0x4F, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD4, 0x00, 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD5, 0x00
	.byte 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD6, 0x00, 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD7, 0x00
	.byte 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x1A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0x1A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x16, 0x00, 0x01, 0x00, 0x00, 0x00, 0x34, 0x00
	.byte 0x1A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x35, 0x00, 0x12, 0x00, 0x01, 0x00, 0x00, 0x00, 0x43, 0x00
	.byte 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x44, 0x00, 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x45, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x15, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0B, 0x00
	.byte 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x22, 0x00, 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x23, 0x00
	.byte 0x33, 0x00, 0x01, 0x00, 0x00, 0x00, 0x9F, 0x00, 0x2E, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA0, 0x00
	.byte 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x26, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0D, 0x00
	.byte 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x84, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x85, 0x00
	.byte 0x26, 0x00, 0x01, 0x00, 0x00, 0x00, 0x13, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x14, 0x00
	.byte 0x12, 0x00, 0x01, 0x00, 0x00, 0x00, 0x41, 0x00, 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x15, 0x00
	.byte 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0x7D, 0x00, 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0x7E, 0x00
	.byte 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0x80, 0x00
	.byte 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0x81, 0x00, 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x3E, 0x00
	.byte 0x17, 0x00, 0x01, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x30, 0x00, 0x01, 0x00, 0x00, 0x00, 0x40, 0x00
	.byte 0x2D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x16, 0x00, 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x62, 0x00
	.byte 0x33, 0x00, 0x01, 0x00, 0x00, 0x00, 0x87, 0x00, 0x39, 0x00, 0x01, 0x00, 0x00, 0x00, 0x88, 0x00
	.byte 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x17, 0x00, 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x89, 0x00
	.byte 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x42, 0x00, 0x2E, 0x00, 0x01, 0x00, 0x00, 0x00, 0x56, 0x00
	.byte 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0x9E, 0x00, 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA1, 0x00
	.byte 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x18, 0x00, 0x27, 0x00, 0x01, 0x00, 0x00, 0x00, 0x63, 0x00
	.byte 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xAA, 0x00, 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xAB, 0x00
	.byte 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xAC, 0x00, 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xAD, 0x00
	.byte 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x49, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x4A, 0x00
	.byte 0x4C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBF, 0x00, 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC0, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC1, 0x00, 0x17, 0x00, 0x01, 0x00, 0x00, 0x00, 0x4B, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x19, 0x00, 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1A, 0x00
	.byte 0x59, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD1, 0x00, 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x27, 0x00
	.byte 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0x28, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE2, 0x00
	.byte 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0x29, 0x00, 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0x82, 0x00
	.byte 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0x83, 0x00, 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2A, 0x00
	.byte 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2C, 0x00
	.byte 0x4D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x26, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2E, 0x00
	.byte 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x8D, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x8E, 0x00, 0x17, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2F, 0x00
	.byte 0x2D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x8F, 0x00
	.byte 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0x00, 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x31, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x32, 0x00, 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x33, 0x00
	.byte 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x36, 0x00, 0x3E, 0x00, 0x01, 0x00, 0x00, 0x00, 0x37, 0x00
	.byte 0x17, 0x00, 0x01, 0x00, 0x00, 0x00, 0x24, 0x00, 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x25, 0x00
	.byte 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x66, 0x00, 0x28, 0x00, 0x01, 0x00, 0x00, 0x00, 0x64, 0x00
	.byte 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x46, 0x00, 0x14, 0x00, 0x01, 0x00, 0x00, 0x00, 0x48, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE4, 0x00, 0x30, 0x00, 0x01, 0x00, 0x00, 0x00, 0x47, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x51, 0x00, 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x52, 0x00
	.byte 0x29, 0x00, 0x01, 0x00, 0x00, 0x00, 0x53, 0x00, 0x33, 0x00, 0x01, 0x00, 0x00, 0x00, 0x65, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB5, 0x00, 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB6, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB7, 0x00, 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB8, 0x00
	.byte 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x4F, 0x00, 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x50, 0x00
	.byte 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x33, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBA, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBD, 0x00, 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBB, 0x00
	.byte 0x34, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBC, 0x00, 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBE, 0x00
	.byte 0x2F, 0x00, 0x01, 0x00, 0x00, 0x00, 0x54, 0x00, 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x67, 0x00
	.byte 0x5D, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA2, 0x00
	.byte 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA3, 0x00, 0x59, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA4, 0x00
	.byte 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x38, 0x00, 0x31, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE0, 0x00
	.byte 0x17, 0x00, 0x01, 0x00, 0x00, 0x00, 0x39, 0x00, 0x3D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x3A, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x68, 0x00, 0x3C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x3B, 0x00
	.byte 0x3A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x3D, 0x00
	.byte 0x2D, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA9, 0x00, 0x30, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC5, 0x00
	.byte 0x26, 0x00, 0x01, 0x00, 0x00, 0x00, 0x69, 0x00, 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x6A, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x33, 0x00, 0x01, 0x00, 0x00, 0x00, 0x7A, 0x00
	.byte 0x27, 0x00, 0x01, 0x00, 0x00, 0x00, 0x6D, 0x00, 0x29, 0x00, 0x01, 0x00, 0x00, 0x00, 0x6E, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x86, 0x00, 0x31, 0x00, 0x01, 0x00, 0x00, 0x00, 0x6F, 0x00
	.byte 0x28, 0x00, 0x01, 0x00, 0x00, 0x00, 0x70, 0x00, 0x27, 0x00, 0x01, 0x00, 0x00, 0x00, 0x55, 0x00
	.byte 0x17, 0x00, 0x01, 0x00, 0x00, 0x00, 0x57, 0x00, 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD8, 0x00
	.byte 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD9, 0x00, 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDA, 0x00
	.byte 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDB, 0x00, 0x56, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDC, 0x00
	.byte 0x33, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC6, 0x00, 0x37, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC7, 0x00
	.byte 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE3, 0x00, 0x5B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x91, 0x00
	.byte 0x5B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x8A, 0x00, 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x8B, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC3, 0x00, 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC4, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x71, 0x00, 0x57, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC2, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xAE, 0x00
	.byte 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xAF, 0x00, 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB0, 0x00
	.byte 0x5A, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB1, 0x00, 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x72, 0x00
	.byte 0x2F, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA6, 0x00, 0x5B, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA7, 0x00
	.byte 0x4E, 0x00, 0x01, 0x00, 0x00, 0x00, 0x58, 0x00, 0x14, 0x00, 0x01, 0x00, 0x00, 0x00, 0x59, 0x00
	.byte 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5B, 0x00
	.byte 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD2, 0x00
	.byte 0x34, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDF, 0x00, 0x59, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB4, 0x00
	.byte 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB2, 0x00, 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB3, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCF, 0x00, 0x29, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD0, 0x00
	.byte 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x73, 0x00, 0x17, 0x00, 0x01, 0x00, 0x00, 0x00, 0x74, 0x00
	.byte 0x38, 0x00, 0x01, 0x00, 0x00, 0x00, 0x4C, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x4D, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC9, 0x00, 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA5, 0x00
	.byte 0x27, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCC, 0x00, 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCD, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCA, 0x00, 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCB, 0x00
	.byte 0x18, 0x00, 0x01, 0x00, 0x00, 0x00, 0x4E, 0x00, 0x2F, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDE, 0x00
	.byte 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCE, 0x00, 0x19, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5D, 0x00
	.byte 0x32, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5F, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x33, 0x00, 0x01, 0x00, 0x00, 0x00, 0x75, 0x00
	.byte 0x59, 0x00, 0x01, 0x00, 0x00, 0x00, 0x76, 0x00, 0x34, 0x00, 0x01, 0x00, 0x00, 0x00, 0x77, 0x00
	.byte 0x1B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x78, 0x00, 0x2E, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDD, 0x00
	.byte 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x79, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x7B, 0x00
	.byte 0x5C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x7C, 0x00, 0xE2, 0x00, 0x01, 0x00, 0x00, 0x00, 0x26, 0x00
	.byte 0xE3, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE5, 0x00, 0x35, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE6, 0x00
_020FAC90:
	.byte 0x55, 0x03, 0x00, 0x00
_020FAC94:
	.byte 0x03, 0x19, 0x0D, 0x06, 0x04, 0x0D, 0x1F, 0x02
_020FAC9C:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x01, 0x00, 0x01, 0x00, 0x00
_020FACB0:
	.byte 0x14, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00
	.byte 0x19, 0x00, 0x00, 0x00
_020FACC4:
	.byte 0xFF, 0xFF, 0xFF, 0x07, 0xFF, 0xFF, 0xFF, 0x07, 0xFF, 0xFF, 0xFF, 0x07
	.byte 0xFF, 0xFF, 0xFF, 0x07, 0xFF, 0xFF, 0xFF, 0x07, 0xFF, 0xFF, 0xFF, 0x07
_020FACDC:
	.byte 0x00, 0x30, 0x08, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x04, 0x00, 0x00, 0xD0, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x04, 0x00, 0x00, 0x80, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x04, 0x00
gScriptCommandTable: ; 0x020FAD00
	.word sub_02040890
	.word sub_02040894
	.word sub_02040898
	.word sub_020408A4
	.word sub_02040918
	.word sub_02040930
	.word sub_0204094C
	.word sub_02040968
	.word sub_02040980
	.word sub_0204099C
	.word sub_020409BC
	.word sub_020409E8
	.word sub_02040A18
	.word sub_02040A40
	.word sub_02040A68
	.word sub_02040A90
	.word sub_02040AAC
	.word sub_02040ACC
	.word sub_02040AF8
	.word sub_02040B30
	.word sub_02040B68
	.word sub_02040BFC
	.word sub_02040C2C
	.word sub_02040C44
	.word sub_02040C7C
	.word sub_02040CAC
	.word sub_02040CE0
	.word sub_02040CF8
	.word sub_02040D04
	.word sub_02040D38
	.word sub_02040D6C
	.word sub_02040D84
	.word sub_02040D9C
	.word sub_02040DF4
	.word sub_02040E1C
	.word sub_02040DB8
	.word sub_02040E44
	.word sub_02040E68
	.word sub_02040E8C
	.word sub_02040EB4
	.word sub_02040EE4
	.word sub_02040F14
	.word sub_02040F38
	.word sub_02040F68
	.word ov01_021EF050
	.word ov01_021EF31C
	.word ov01_021EF35C
	.word ov01_021EF3E0
	.word sub_02040F94
	.word sub_02040FF0
	.word sub_02041064
	.word sub_020410E0
	.word sub_02041110
	.word sub_02041168
	.word sub_020411A4
	.word sub_02041328
	.word sub_020413D4
	.word sub_02041410
	.word sub_0204142C
	.word sub_0204146C
	.word sub_020415C4
	.word sub_02041674
	.word sub_020411D8
	.word sub_02041684
	.word sub_020417EC
	.word sub_02041808
	.word sub_02041824
	.word sub_02041890
	.word sub_02041950
	.word sub_0204196C
	.word sub_02041988
	.word sub_020419E8
	.word sub_02041A98
	.word sub_02049228
	.word sub_02049244
	.word sub_02049260
	.word sub_020492A0
	.word sub_020492E0
	.word sub_02049304
	.word sub_02049320
	.word sub_02049134
	.word sub_02049144
	.word sub_02049158
	.word sub_02049170
	.word sub_02049188
	.word sub_020491C4
	.word sub_020491E8
	.word sub_02049204
	.word sub_02049214
	.word sub_02049344
	.word sub_0204937C
	.word sub_020493B4
	.word sub_020493C0
	.word sub_020493D4
	.word sub_02041B04
	.word sub_02041C98
	.word sub_02041D40
	.word sub_02041F50
	.word sub_02041F60
	.word sub_02041F8C
	.word sub_02041FB8
	.word sub_02042000
	.word sub_02042034
	.word sub_020420CC
	.word sub_0204219C
	.word sub_020422B4
	.word sub_020422F8
	.word sub_02042394
	.word sub_02042478
	.word sub_020424AC
	.word sub_0204CA50
	.word sub_0204CA74
	.word sub_0204CAC8
	.word ov01_02203138
	.word ov01_02203188
	.word ov01_022031A0
	.word ov20_022598C0
	.word ov22_0225991C
	.word ov22_02259934
	.word ov22_02259960
	.word ov22_0225998C
	.word ov22_022599B8
	.word ov22_02259ADC
	.word ov22_02259B08
	.word ov22_02259B34
	.word sub_0204E9D8
	.word sub_0204EA30
	.word sub_0204EA88
	.word sub_0204EAE0
	.word sub_0204EB7C
	.word sub_0204EBB0
	.word sub_02043964
	.word ov01_021EF41C
	.word ov01_02202674
	.word ov01_022026B4
	.word ov01_0220271C
	.word sub_02042530
	.word sub_0204D088
	.word sub_0204D248
	.word sub_0204D2D0
	.word sub_0204D328
	.word sub_0204D3CC
	.word sub_020428D8
	.word sub_020431E4
	.word sub_02046F34
	.word sub_02046F6C
	.word sub_02046FC8
	.word sub_02046FFC
	.word sub_020472C4
	.word sub_020472E8
	.word sub_02042A10
	.word sub_02042AB0
	.word sub_02042AC0
	.word sub_02042ACC
	.word sub_02042D00
	.word sub_02042D58
	.word sub_02042E48
	.word sub_02042E5C
	.word sub_02042F04
	.word sub_02042F5C
	.word sub_02042F78
	.word sub_02042F88
	.word sub_02042F98
	.word sub_02042FC4
	.word sub_02042FDC
	.word sub_02043044
	.word sub_020430A4
	.word sub_020430C4
	.word sub_02049460
	.word sub_0204952C
	.word sub_0204959C
	.word sub_020495C4
	.word sub_020431B4
	.word sub_02043214
	.word sub_02043400
	.word sub_02043448
	.word sub_0204346C
	.word sub_020435E8
	.word sub_02043618
	.word sub_02043648
	.word sub_02043678
	.word sub_020436C4
	.word sub_020436F4
	.word sub_02043724
	.word sub_020437B4
	.word sub_020437E4
	.word sub_02043884
	.word sub_0204389C
	.word sub_020438C4
	.word sub_020438DC
	.word sub_02048414
	.word sub_02048448
	.word sub_0204846C
	.word sub_02048490
	.word sub_02048510
	.word sub_02048548
	.word sub_02048580
	.word sub_020485BC
	.word sub_020485F4
	.word sub_020486F0
	.word sub_02048794
	.word sub_020487CC
	.word sub_02048818
	.word sub_020488A4
	.word sub_020488F4
	.word sub_02048944
	.word sub_02043938
	.word sub_02048994
	.word sub_020489CC
	.word sub_020489F4
	.word sub_02048A1C
	.word sub_020438EC
	.word sub_02049618
	.word sub_02049648
	.word sub_02043990
	.word sub_02049750
	.word sub_020497D8
	.word sub_02049860
	.word sub_02049894
	.word sub_020498C8
	.word sub_020498D4
	.word sub_02049904
	.word sub_02049980
	.word sub_020499AC
	.word sub_020499D8
	.word sub_02049A00
	.word sub_02043A28
	.word sub_02043AC0
	.word sub_02043B58
	.word sub_02043B64
	.word sub_02043B70
	.word sub_02043BA0
	.word sub_0206BB2C
	.word sub_0206BB5C
	.word sub_0206BBAC
	.word sub_0206BC2C
	.word sub_0206BC64
	.word sub_0206BC8C
	.word sub_0204DB3C
	.word sub_0204DBA0
	.word sub_02043BA4
	.word sub_02043C24
	.word sub_02043C54
	.word sub_02043CB4
	.word sub_02043CE4
	.word sub_02043D14
	.word sub_02043D44
	.word sub_02043D74
	.word sub_02043D78
	.word sub_02043E08
	.word sub_02043F0C
	.word sub_02043F48
	.word sub_02043F54
	.word sub_02043F70
	.word sub_02043FC4
	.word sub_02042DC0
	.word sub_02042DFC
	.word sub_02044024
	.word sub_02044070
	.word sub_0204407C
	.word sub_020440AC
	.word sub_020440E4
	.word sub_0204435C
	.word sub_0204436C
	.word sub_02044124
	.word sub_02044190
	.word sub_020441A0
	.word sub_020441D8
	.word sub_02044270
	.word sub_020442FC
	.word sub_02044348
	.word sub_02044380
	.word sub_020443BC
	.word sub_02044418
	.word sub_020442AC
	.word sub_02048060
	.word sub_02048158
	.word sub_02048194
	.word sub_020481DC
	.word sub_020445C0
	.word sub_020445CC
	.word sub_020445F8
	.word sub_02044628
	.word sub_02044640
	.word sub_0204468C
	.word sub_0204469C
	.word sub_02044480
	.word sub_02044490
	.word sub_020444CC
	.word sub_0204458C
	.word sub_0204E610
	.word sub_0204E640
	.word sub_0204E654
	.word sub_0204E684
	.word sub_0204E6A0
	.word sub_0204E6E8
	.word sub_0204E748
	.word sub_0204E71C
	.word sub_0204E774
	.word sub_0204E788
	.word sub_0204E7B4
	.word sub_0204E7C8
	.word sub_0204E838
	.word sub_0204E864
	.word sub_0204E878
	.word sub_0204E88C
	.word sub_0204E8B8
	.word sub_02044954
	.word sub_020449AC
	.word sub_020449C4
	.word sub_020449DC
	.word sub_020449F4
	.word sub_0204CB5C
	.word sub_0204CB7C
	.word sub_02044A0C
	.word sub_02044A1C
	.word sub_02044A44
	.word sub_02044A6C
	.word sub_02044AA8
	.word sub_02044AB8
	.word sub_02044AE0
	.word sub_02044AF0
	.word sub_02044B10
	.word sub_02044B40
	.word sub_02044B50
	.word sub_02044B60
	.word sub_02044B70
	.word sub_02044B80
	.word sub_02044B9C
	.word sub_02044BB8
	.word sub_02044BC8
	.word sub_02044BD8
	.word sub_0204D95C
	.word sub_020430D4
	.word sub_02043124
	.word sub_020446AC
	.word sub_02048A7C
	.word sub_02048AF4
	.word sub_020446EC
	.word sub_0204473C
	.word sub_020447CC
	.word sub_02044804
	.word sub_0204483C
	.word sub_0204488C
	.word sub_020448DC
	.word sub_02041728
	.word sub_02041758
	.word sub_02044928
	.word sub_02041018
	.word sub_02042574
	.word sub_020425D4
	.word sub_020425F8
	.word sub_02042860
	.word sub_0204280C
	.word sub_0204D180
	.word sub_0204D1DC
	.word sub_0204D988
	.word sub_0204D9E0
	.word sub_0204DA68
	.word sub_0204DAE4
	.word sub_0204CA98
	.word sub_0204CBF8
	.word sub_02045394
	.word sub_020453D0
	.word sub_0204D154
	.word sub_0204CBAC
	.word sub_0204CBC4
	.word sub_0204CC58
	.word sub_0204CB0C
	.word sub_02044C54
	.word sub_02043164
	.word sub_0204CCAC
	.word sub_0204CCFC
	.word sub_0204CD34
	.word sub_02044C64
	.word sub_02044C98
	.word sub_02044CCC
	.word sub_02044CFC
	.word sub_02044D28
	.word sub_02044D68
	.word sub_02044D8C
	.word sub_02044DC4
	.word sub_0204D6C0
	.word sub_0204D708
	.word sub_0204D7D8
	.word sub_0204CD74
	.word sub_0204236C
	.word sub_0204CE00
	.word sub_0204CE30
	.word sub_0204DF54
	.word ov20_02259A88
	.word ov20_02259B40
	.word ov20_02259BF4
	.word ov20_02259B88
	.word sub_0204EBE8
	.word sub_0204EC30
	.word sub_0204DBE8
	.word sub_0204DC90
	.word sub_0204DCD4
	.word sub_02048B64
	.word sub_0204E8CC
	.word sub_0204E928
	.word sub_0204E980
	.word sub_02044DFC
	.word sub_02044E40
	.word sub_02044E9C
	.word sub_02044F00
	.word sub_02044F30
	.word sub_02042E8C
	.word sub_02049CD8
	.word sub_02049CA8
	.word sub_02049CE8
	.word sub_02049D04
	.word sub_02049FC8
	.word sub_0204A048
	.word sub_0204A070
	.word sub_0204A098
	.word sub_0204A184
	.word sub_0204A230
	.word sub_0204A27C
	.word sub_02045040
	.word sub_02045060
	.word sub_020450B8
	.word sub_02044F74
	.word sub_02044FAC
	.word sub_02044FE4
	.word sub_0204DD34
	.word sub_02045028
	.word sub_0204DEE4
	.word ov20_022598C0
	.word sub_02047060
	.word sub_020470F4
	.word ov21_0225990C
	.word ov21_02259960
	.word sub_0204D4D0
	.word sub_0204D48C
	.word sub_02042A20
	.word sub_02040900
	.word ov01_021EF064
	.word ov01_021EF0A4
	.word ov01_021EF0F0
	.word ov01_021EF154
	.word ov01_021EF194
	.word ov01_021EF1E0
	.word ov01_021EF268
	.word sub_02043548
	.word sub_02043574
	.word sub_02045188
	.word sub_020434DC
	.word sub_02043538
	.word sub_02042E2C
	.word sub_02042AFC
	.word sub_02042B1C
	.word sub_02042C2C
	.word sub_02042CA8
	.word ov01_021EF488
	.word sub_0204523C
	.word sub_0204D5C0
	.word sub_0204D634
	.word sub_02045230
	.word sub_02047120
	.word sub_02047168
	.word sub_0204720C
	.word sub_02045254
	.word sub_02045264
	.word sub_02049A6C
	.word sub_0204EC7C
	.word sub_0204ED3C
	.word sub_0204ED7C
	.word sub_0204EDDC
	.word sub_0204527C
	.word sub_020452B0
	.word sub_020452E0
	.word sub_02045340
	.word sub_02045374
	.word sub_02045428
	.word sub_0204542C
	.word sub_02045440
	.word sub_0204E150
	.word sub_0204E1C4
	.word sub_0204E26C
	.word sub_0204E2D8
	.word sub_02048BCC
	.word sub_020454A4
	.word sub_02045540
	.word sub_02045568
	.word sub_02040894
	.word sub_02045588
	.word sub_020455B0
	.word sub_0204BDA4
	.word sub_0204EE20
	.word sub_0204EE38
	.word sub_020432FC
	.word sub_0204335C
	.word sub_020433BC
	.word sub_020455F0
	.word sub_0204D8A0
	.word sub_0204D8F0
	.word sub_0204560C
	.word sub_020456D8
	.word sub_02045780
	.word sub_0204579C
	.word sub_020457B8
	.word sub_02048EE0
	.word sub_02048F10
	.word sub_0204908C
	.word sub_02048738
	.word sub_0204583C
	.word sub_0204C874
	.word sub_0204C8D4
	.word sub_0204C91C
	.word sub_0204C9C0
	.word sub_02045868
	.word sub_0204588C
	.word sub_020458A4
	.word sub_020458CC
	.word sub_02048B2C
	.word sub_020458EC
	.word sub_0204592C
	.word sub_020459AC
	.word sub_02045A60
	.word sub_02045A74
	.word sub_02045A88
	.word sub_02045AAC
	.word sub_02045B40
	.word sub_02045BA4
	.word sub_02045BCC
	.word ov01_021EF2E0
	.word sub_02045C64
	.word sub_0204D8C8
	.word sub_02045C84
	.word sub_02045CC4
	.word ov22_02259A10
	.word ov22_02259A9C
	.word sub_02045CFC
	.word sub_0204D564
	.word sub_02045D28
	.word sub_02045D6C
	.word sub_02045D7C
	.word sub_02045E1C
	.word sub_02045DE8
	.word sub_0204863C
	.word sub_0204D840
	.word sub_02045E54
	.word sub_020493E4
	.word sub_02045EA8
	.word sub_02045ED8
	.word sub_02042BAC
	.word sub_02042C44
	.word sub_02042C5C
	.word sub_02045F18
	.word sub_02045F80
	.word sub_02045FC4
	.word sub_02046038
	.word sub_0204A2EC
	.word sub_0204A31C
	.word sub_0204A360
	.word sub_0204A3A4
	.word sub_02044534
	.word sub_0204184C
	.word sub_02046078
	.word ov01_02201A50
	.word sub_020496DC
	.word sub_02041B74
	.word sub_02046108
	.word sub_02046130
	.word sub_020425A4
	.word sub_0204E5BC
	.word sub_0204615C
	.word ov22_022599E4
	.word ov22_02259A50
	.word sub_020461A0
	.word ov01_02202648
	.word sub_02046290
	.word sub_020424E8
	.word sub_0204910C
	.word sub_020462A8
	.word sub_020462D8
	.word sub_020462E4
	.word sub_020462F0
	.word sub_02048C10
	.word sub_02041E84
	.word sub_02046300
	.word sub_02046360
	.word sub_0204E338
	.word sub_020418DC
	.word sub_02044230
	.word sub_02044674
	.word sub_02049950
	.word sub_02043E5C
	.word sub_0204639C
	.word sub_02043870
	.word ov01_021EF398
	.word sub_020463C4
	.word sub_020463F4
	.word sub_02046420
	.word sub_02046B1C
	.word sub_02046B48
	.word sub_02046B64
	.word sub_02046BB4
	.word sub_02046BC4
	.word sub_02046BDC
	.word sub_02046CB4
	.word sub_02046CF0
	.word sub_02046D10
	.word sub_02046D5C
	.word sub_02046DA8
	.word sub_02046DF8
	.word sub_02046E38
	.word sub_02046E5C
	.word sub_02046E80
	.word sub_02046E9C
	.word sub_02045310
	.word sub_0204723C
	.word sub_0204727C
	.word sub_02047304
	.word sub_0204731C
	.word sub_02047348
	.word ov01_02202308
	.word sub_0204E7DC
	.word sub_0204E808
	.word sub_02047358
	.word sub_020473D8
	.word sub_0204BC98
	.word sub_0204BCCC
	.word sub_0204BD04
	.word sub_02048C80
	.word sub_02046438
	.word sub_0204EE50
	.word sub_020432A0
	.word sub_020432CC
	.word sub_020464E0
	.word sub_0204DFE4
	.word sub_0204EF40
	.word sub_0204F1AC
	.word sub_02042644
	.word sub_0204F174
	.word sub_0204F8DC
	.word sub_0204FAD4
	.word sub_020426C4
	.word sub_0204F9DC
	.word sub_02043FEC
	.word sub_02043FFC
	.word sub_0204FE78
	.word sub_02050014
	.word sub_02042768
	.word sub_0204FF78
	.word sub_0204E0BC
	.word ov01_02200AF0
	.word sub_02046554
	.word sub_02046584
	.word sub_020465A0
	.word ov01_02202B00
	.word ov01_02202E68
	.word ov01_02202B78
	.word ov01_02202BD0
	.word ov01_02202C28
	.word ov01_022011D4
	.word sub_020483D8
	.word ov01_02201424
	.word sub_02048C48
	.word sub_0204869C
	.word sub_020465FC
	.word sub_02046674
	.word sub_02049418
	.word sub_0204941C
	.word sub_02049440
	.word sub_020466A8
	.word sub_020484D8
	.word sub_0204EB38
	.word ov01_02201594
	.word ov01_0220178C
	.word ov01_022017DC
	.word sub_020466E0
	.word ov01_02201470
	.word ov01_02201518
	.word ov01_02201844
	.word sub_02041A48
	.word sub_02042110
	.word sub_02042184
	.word sub_020468F4
	.word sub_02042CE0
	.word sub_02046914
	.word sub_02049A44
	.word sub_02042948
	.word sub_02044BE8
	.word sub_02043EB8
	.word sub_02045818
	.word sub_0204E3CC
	.word ov01_02201304
	.word sub_0204CFB8
	.word sub_02046970
	.word sub_0204F500
	.word sub_0204F6D0
	.word sub_0204F778
	.word sub_02041A0C
	.word sub_020469B4
	.word sub_0204F7FC
	.word sub_02046A1C
	.word ov01_0220188C
	.word ov01_0220192C
	.word sub_0204E470
	.word ov01_0220197C
	.word ov01_02201990
	.word sub_0204512C
	.word sub_02045160
	.word sub_02043008
	.word ov01_022019B0
	.word ov01_022019F0
	.word ov01_02201A40
	.word ov03_02256B88
	.word sub_02047414
	.word sub_02047424
	.word sub_0204749C
	.word ov01_02201B14
	.word sub_0204CE60
	.word ov03_0225894C
	.word ov03_02258978
	.word ov03_02258998
	.word ov03_022589D4
	.word ov03_02258A18
	.word ov03_02258BDC
	.word sub_020474D8
	.word sub_02047518
	.word ov01_02201B40
	.word ov01_02201C08
	.word ov01_02201C60
	.word sub_02047570
	.word sub_0204759C
	.word sub_020475C0
	.word sub_020475F0
	.word sub_02047634
	.word sub_02047644
	.word sub_02047664
	.word sub_0204769C
	.word ov01_02201C70
	.word ov01_02201C9C
	.word ov01_02201CB4
	.word ov01_02201CE0
	.word ov01_02201D1C
	.word ov01_02201D4C
	.word ov01_02201DA4
	.word ov01_02203094
	.word ov01_02201F10
	.word ov01_02201F30
	.word ov01_02202480
	.word sub_020476B4
	.word sub_0204771C
	.word sub_02047790
	.word sub_020477F8
	.word sub_02047814
	.word sub_02047830
	.word sub_02047888
	.word sub_02047AE8
	.word sub_02047B38
	.word sub_02047B5C
	.word sub_02047B6C
	.word sub_02047B7C
	.word sub_02047B8C
	.word sub_02047BA4
	.word sub_02047BB4
	.word sub_02047BC4
	.word sub_02047BDC
	.word sub_02047BF4
	.word sub_02047C04
	.word sub_02047C14
	.word sub_02047C24
	.word sub_02047C34
	.word sub_02047C44
	.word sub_02047C54
	.word ov01_0220205C
	.word sub_02048218
	.word sub_02048298
	.word sub_02047558
	.word ov01_02201A18
	.word ov01_02201AB8
	.word ov01_022020CC
	.word ov01_022021AC
	.word ov01_022021F8
	.word ov01_0220233C
	.word ov01_02202430
	.word sub_0204DDE4
	.word sub_0204812C
	.word sub_02047C64
	.word sub_02047C80
	.word ov01_02202930
	.word ov01_02202980
	.word ov01_022029B0
	.word ov01_02202A28
	.word ov01_02202A70
	.word ov01_02202ABC
	.word ov03_02258C00
	.word ov03_02258CDC
	.word sub_02047964
	.word sub_02047CBC
	.word ov01_02205164
	.word ov01_022051B4
	.word ov01_022051CC
	.word sub_02047CFC
	.word sub_02047D24
	.word sub_02047D58
	.word sub_02047D7C
	.word sub_02047DB0
	.word sub_02047DC8
	.word sub_02046FAC
	.word sub_02047E14
	.word sub_02047E20
	.word sub_0206DC50
	.word ov01_022053EC
	.word ov25_02259A30
	.word sub_02047E30
	.word ov01_022024B8
	.word ov01_022024FC
	.word sub_0204C83C
	.word sub_02047E40
	.word sub_02047778
	.word sub_02047E54
	.word sub_02047E64
	.word sub_02047E7C
	.word sub_02047E8C
	.word sub_02047E9C
	.word ov01_02202510
	.word sub_02047EB4
	.word sub_02047EC4
	.word sub_02047F14
	.word ov01_022025A8
	.word ov01_022025EC
	.word sub_0204E4E0
	.word sub_0204E528
	.word sub_02047F54
	.word sub_02047F84
	.word sub_02047FB4
	.word sub_02047FD4
	.word sub_02048004
	.word sub_020482F4
	.word sub_0204839C
	.word ov01_02202834
	.word sub_0204802C
	.word sub_02047A7C
	.word ov01_02202908
	.word sub_02043598
	.word sub_02041AC4
	.word sub_02041AE4
	.word sub_02048CBC
	.word sub_02048CF4
	.word sub_02048D2C
	.word sub_02048D74
	.word sub_02048DBC
	.word sub_02048DF0
	.word sub_02048E28
	.word sub_02048E60
	.word sub_02048E98
	.word sub_02048EB8
