	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02040890
sub_02040890: ; 0x02040890
	mov r0, #0
	bx lr
	thumb_func_end sub_02040890

	thumb_func_start sub_02040894
sub_02040894: ; 0x02040894
	mov r0, #0
	bx lr
	thumb_func_end sub_02040894

	thumb_func_start sub_02040898
sub_02040898: ; 0x02040898
	push {r3, lr}
	bl StopScript
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02040898

	thumb_func_start sub_020408A4
sub_020408A4: ; 0x020408A4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r6, [r1]
	bl ScriptReadHalfword
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl GetVarPointer
	strh r7, [r0]
	ldr r1, _020408D4 ; =sub_020408D8
	add r0, r5, #0
	str r4, [r5, #0x64]
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020408D4: .word sub_020408D8
	thumb_func_end sub_020408A4

	thumb_func_start sub_020408D8
sub_020408D8: ; 0x020408D8
	push {r3, lr}
	add r1, r0, #0
	ldr r1, [r1, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	ldrh r1, [r0]
	sub r1, r1, #1
	strh r1, [r0]
	ldrh r0, [r0]
	cmp r0, #0
	bne _020408FA
	mov r0, #1
	pop {r3, pc}
_020408FA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020408D8

	thumb_func_start sub_02040900
sub_02040900: ; 0x02040900
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02040900

	thumb_func_start sub_02040918
sub_02040918: ; 0x02040918
	ldr r1, [r0, #8]
	add r2, r1, #1
	str r2, [r0, #8]
	ldrb r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r2, [r2]
	lsl r1, r3, #2
	add r0, r0, r1
	str r2, [r0, #0x64]
	mov r0, #0
	bx lr
	thumb_func_end sub_02040918

	thumb_func_start sub_02040930
sub_02040930: ; 0x02040930
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r5, [r2]
	bl ScriptReadWord
	lsl r1, r5, #2
	add r1, r4, r1
	str r0, [r1, #0x64]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02040930

	thumb_func_start sub_0204094C
sub_0204094C: ; 0x0204094C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadWord
	ldrb r1, [r0]
	lsl r0, r4, #2
	add r0, r5, r0
	str r1, [r0, #0x64]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0204094C

	thumb_func_start sub_02040968
sub_02040968: ; 0x02040968
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadWord
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	strb r1, [r0]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02040968

	thumb_func_start sub_02040980
sub_02040980: ; 0x02040980
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadWord
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #0x64]
	strb r1, [r0]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02040980

	thumb_func_start sub_0204099C
sub_0204099C: ; 0x0204099C
	ldr r1, [r0, #8]
	add r2, r1, #1
	str r2, [r0, #8]
	ldrb r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	lsl r1, r1, #2
	add r1, r0, r1
	ldr r2, [r1, #0x64]
	lsl r1, r3, #2
	add r0, r0, r1
	str r2, [r0, #0x64]
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0204099C

	thumb_func_start sub_020409BC
sub_020409BC: ; 0x020409BC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadWord
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadWord
	ldrb r0, [r0]
	strb r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020409BC

	thumb_func_start sub_020409D4
sub_020409D4: ; 0x020409D4
	cmp r0, r1
	bhs _020409DC
	mov r0, #0
	bx lr
_020409DC:
	cmp r0, r1
	bne _020409E4
	mov r0, #1
	bx lr
_020409E4:
	mov r0, #2
	bx lr
	thumb_func_end sub_020409D4

	thumb_func_start sub_020409E8
sub_020409E8: ; 0x020409E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	add r1, r0, #1
	str r1, [r4, #8]
	ldrb r0, [r0]
	add r2, r1, #1
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x64]
	str r2, [r4, #8]
	ldrb r1, [r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #0x64]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_020409D4
	strb r0, [r4, #2]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_020409E8

	thumb_func_start sub_02040A18
sub_02040A18: ; 0x02040A18
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	add r1, r0, #1
	str r1, [r4, #8]
	ldrb r0, [r0]
	add r2, r1, #1
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x64]
	str r2, [r4, #8]
	ldrb r1, [r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020409D4
	strb r0, [r4, #2]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02040A18

	thumb_func_start sub_02040A40
sub_02040A40: ; 0x02040A40
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #0x64]
	lsl r1, r1, #0x18
	lsr r5, r1, #0x18
	bl ScriptReadWord
	ldrb r1, [r0]
	add r0, r5, #0
	bl sub_020409D4
	strb r0, [r4, #2]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02040A40

	thumb_func_start sub_02040A68
sub_02040A68: ; 0x02040A68
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadWord
	ldr r2, [r4, #8]
	ldrb r0, [r0]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #0x64]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_020409D4
	strb r0, [r4, #2]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02040A68

	thumb_func_start sub_02040A90
sub_02040A90: ; 0x02040A90
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadWord
	ldr r2, [r4, #8]
	ldrb r0, [r0]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	bl sub_020409D4
	strb r0, [r4, #2]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02040A90

	thumb_func_start sub_02040AAC
sub_02040AAC: ; 0x02040AAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadWord
	ldrb r4, [r0]
	add r0, r5, #0
	bl ScriptReadWord
	ldrb r1, [r0]
	add r0, r4, #0
	bl sub_020409D4
	strb r0, [r5, #2]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02040AAC

	thumb_func_start sub_02040ACC
sub_02040ACC: ; 0x02040ACC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	ldrh r5, [r0]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	bl sub_020409D4
	strb r0, [r4, #2]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02040ACC

	thumb_func_start sub_02040AF8
sub_02040AF8: ; 0x02040AF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r1, r0, #0
	ldrh r0, [r4]
	ldrh r1, [r1]
	bl sub_020409D4
	strb r0, [r5, #2]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02040AF8

	thumb_func_start sub_02040B30
sub_02040B30: ; 0x02040B30
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #7
	add r0, r5, #0
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0xe
	bl sub_020402F0
	add r6, r0, #0
	add r0, r7, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	bl CreateScriptContext
	str r0, [r6]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02040B30

	thumb_func_start sub_02040B68
sub_02040B68: ; 0x02040B68
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, #0x80
	ldr r7, [r0]
	mov r1, #5
	add r0, r7, #0
	bl sub_020402F0
	add r5, r0, #0
	add r0, r7, #0
	mov r1, #7
	bl sub_020402F0
	add r4, r0, #0
	ldrb r1, [r4]
	add r0, r7, #0
	add r1, #0xd
	bl sub_020402F0
	str r0, [sp]
	add r0, r6, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r7, #0
	bl CreateScriptContext
	ldr r1, [sp]
	str r0, [r1]
	ldrb r1, [r4]
	strb r1, [r0, #3]
	ldrb r0, [r4]
	mov r1, #1
	add r0, r0, #1
	strb r0, [r4]
	ldrb r0, [r6, #3]
	ldrb r2, [r5]
	lsl r1, r0
	add r0, r2, #0
	orr r0, r1
	strb r0, [r5]
	ldr r1, _02040BC8 ; =sub_02040BCC
	add r0, r6, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02040BC8: .word sub_02040BCC
	thumb_func_end sub_02040B68

	thumb_func_start sub_02040BCC
sub_02040BCC: ; 0x02040BCC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	mov r1, #5
	add r0, r6, #0
	bl sub_020402F0
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #7
	bl sub_020402F0
	mov r0, #1
	ldrb r1, [r5, #3]
	add r2, r0, #0
	ldrb r3, [r4]
	lsl r2, r1
	add r1, r3, #0
	tst r1, r2
	beq _02040BF8
	mov r0, #0
_02040BF8:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02040BCC

	thumb_func_start sub_02040BFC
sub_02040BFC: ; 0x02040BFC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	mov r1, #5
	add r0, r6, #0
	bl sub_020402F0
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #7
	bl sub_020402F0
	ldrb r0, [r5, #3]
	ldrb r2, [r4]
	mov r1, #1
	sub r0, r0, #1
	lsl r1, r0
	add r0, r2, #0
	eor r0, r1
	strb r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02040BFC

	thumb_func_start sub_02040C2C
sub_02040C2C: ; 0x02040C2C
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadWord
	add r2, r0, #0
	ldr r1, [r4, #8]
	add r0, r4, #0
	add r1, r1, r2
	bl ScriptJump
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02040C2C

	thumb_func_start sub_02040C44
sub_02040C44: ; 0x02040C44
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xa
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadWord
	add r7, r0, #0
	ldr r0, [r6]
	bl sub_0205F24C
	cmp r4, r0
	bne _02040C78
	ldr r1, [r5, #8]
	add r0, r5, #0
	add r1, r1, r7
	bl ScriptJump
_02040C78:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02040C44

	thumb_func_start sub_02040C7C
sub_02040C7C: ; 0x02040C7C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x74]
	bl sub_02050658
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r4, [r1]
	add r0, r5, #0
	bl ScriptReadWord
	add r2, r0, #0
	cmp r6, r4
	bne _02040CA6
	ldr r1, [r5, #8]
	add r0, r5, #0
	add r1, r1, r2
	bl ScriptJump
_02040CA6:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02040C7C

	thumb_func_start sub_02040CAC
sub_02040CAC: ; 0x02040CAC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #9
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r4, [r1]
	add r0, r5, #0
	bl ScriptReadWord
	add r2, r0, #0
	ldr r0, [r6]
	cmp r0, r4
	bne _02040CDC
	ldr r1, [r5, #8]
	add r0, r5, #0
	add r1, r1, r2
	bl ScriptJump
_02040CDC:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02040CAC

	thumb_func_start sub_02040CE0
sub_02040CE0: ; 0x02040CE0
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadWord
	add r2, r0, #0
	ldr r1, [r4, #8]
	add r0, r4, #0
	add r1, r1, r2
	bl ScriptCall
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02040CE0

	thumb_func_start sub_02040CF8
sub_02040CF8: ; 0x02040CF8
	push {r3, lr}
	bl ScriptReturn
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02040CF8

	thumb_func_start sub_02040D04
sub_02040D04: ; 0x02040D04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadWord
	add r1, r0, #0
	lsl r0, r4, #1
	add r3, r4, r0
	ldr r0, _02040D34 ; =0x020FAC9C
	ldrb r2, [r5, #2]
	add r0, r0, r3
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _02040D30
	ldr r2, [r5, #8]
	add r0, r5, #0
	add r1, r2, r1
	bl ScriptJump
_02040D30:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02040D34: .word 0x020FAC9C
	thumb_func_end sub_02040D04

	thumb_func_start sub_02040D38
sub_02040D38: ; 0x02040D38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadWord
	add r1, r0, #0
	lsl r0, r4, #1
	add r3, r4, r0
	ldr r0, _02040D68 ; =0x020FAC9C
	ldrb r2, [r5, #2]
	add r0, r0, r3
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _02040D64
	ldr r2, [r5, #8]
	add r0, r5, #0
	add r1, r2, r1
	bl ScriptCall
_02040D64:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02040D68: .word 0x020FAC9C
	thumb_func_end sub_02040D38

	thumb_func_start sub_02040D6C
sub_02040D6C: ; 0x02040D6C
	push {r4, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02040410
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02040D6C

	thumb_func_start sub_02040D84
sub_02040D84: ; 0x02040D84
	push {r4, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02040424
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02040D84

	thumb_func_start sub_02040D9C
sub_02040D9C: ; 0x02040D9C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	bl sub_020403FC
	strb r0, [r4, #2]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02040D9C

	thumb_func_start sub_02040DB8
sub_02040DB8: ; 0x02040DB8
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldrh r1, [r6]
	add r0, r5, #0
	bl sub_020403FC
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02040DB8

	thumb_func_start sub_02040DF4
sub_02040DF4: ; 0x02040DF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r1, r0, #0
	ldrh r1, [r1]
	add r0, r4, #0
	bl sub_02040410
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02040DF4

	thumb_func_start sub_02040E1C
sub_02040E1C: ; 0x02040E1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r1, r0, #0
	ldrh r1, [r1]
	add r0, r4, #0
	bl sub_02040424
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02040E1C

	thumb_func_start sub_02040E44
sub_02040E44: ; 0x02040E44
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_0204052C
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02040E44

	thumb_func_start sub_02040E68
sub_02040E68: ; 0x02040E68
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_02040544
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02040E68

	thumb_func_start sub_02040E8C
sub_02040E8C: ; 0x02040E8C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02040514
	strb r0, [r5, #2]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02040E8C

	thumb_func_start sub_02040EB4
sub_02040EB4: ; 0x02040EB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	ldrh r1, [r4]
	add r0, r1, r0
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02040EB4

	thumb_func_start sub_02040EE4
sub_02040EE4: ; 0x02040EE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	ldrh r1, [r4]
	sub r0, r1, r0
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02040EE4

	thumb_func_start sub_02040F14
sub_02040F14: ; 0x02040F14
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02040F14

	thumb_func_start sub_02040F38
sub_02040F38: ; 0x02040F38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	ldrh r0, [r0]
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02040F38

	thumb_func_start sub_02040F68
sub_02040F68: ; 0x02040F68
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02040F68

	thumb_func_start sub_02040F94
sub_02040F94: ; 0x02040F94
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r1, [r5, #8]
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r4, [r1]
	bl sub_02037474
	cmp r0, #0
	bne _02040FBC
	mov r0, #0
	str r0, [sp]
	ldr r1, [r5, #0x78]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #1
	bl ov01_021EF4DC
	b _02040FDC
_02040FBC:
	add r0, sp, #4
	add r1, r5, #0
	bl ov01_021EF4C4
	mov r1, #1
	add r0, sp, #4
	strb r1, [r0]
	strb r1, [r0, #1]
	add r0, sp, #4
	str r0, [sp]
	ldr r1, [r5, #0x78]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl ov01_021EF4DC
_02040FDC:
	ldr r1, _02040FEC ; =0x021EF349
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02040FEC: .word 0x021EF349
	thumb_func_end sub_02040F94

	thumb_func_start sub_02040FF0
sub_02040FF0: ; 0x02040FF0
	push {r3, lr}
	ldr r1, _02040FFC ; =sub_02041000
	bl SetupNativeScript
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02040FFC: .word sub_02041000
	thumb_func_end sub_02040FF0

	thumb_func_start sub_02041000
sub_02041000: ; 0x02041000
	ldr r0, _02041014 ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0204100E
	mov r0, #1
	bx lr
_0204100E:
	mov r0, #0
	bx lr
	nop
_02041014: .word gMain
	thumb_func_end sub_02041000

	thumb_func_start sub_02041018
sub_02041018: ; 0x02041018
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [r4, #0x64]
	ldr r1, _0204103C ; =sub_02041040
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_0204103C: .word sub_02041040
	thumb_func_end sub_02041018

	thumb_func_start sub_02041040
sub_02041040: ; 0x02041040
	ldr r1, _02041060 ; =gMain
	ldr r2, [r1, #0x48]
	mov r1, #3
	tst r1, r2
	beq _0204104E
	mov r0, #1
	bx lr
_0204104E:
	ldr r1, [r0, #0x64]
	sub r1, r1, #1
	str r1, [r0, #0x64]
	bne _0204105A
	mov r0, #1
	bx lr
_0204105A:
	mov r0, #0
	bx lr
	nop
_02041060: .word gMain
	thumb_func_end sub_02041040

	thumb_func_start sub_02041064
sub_02041064: ; 0x02041064
	push {r3, lr}
	ldr r1, _02041070 ; =sub_02041074
	bl SetupNativeScript
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02041070: .word sub_02041074
	thumb_func_end sub_02041064

	thumb_func_start sub_02041074
sub_02041074: ; 0x02041074
	push {r3, lr}
	ldr r1, _020410DC ; =gMain
	ldr r2, [r1, #0x48]
	mov r1, #3
	add r3, r2, #0
	tst r3, r1
	beq _02041086
	mov r0, #1
	pop {r3, pc}
_02041086:
	mov r3, #0x40
	tst r3, r2
	beq _0204109A
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	ldr r0, [r0, #0x40]
	bl sub_0205C660
	b _020410D8
_0204109A:
	mov r3, #0x80
	tst r3, r2
	beq _020410AE
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #1
	ldr r0, [r0, #0x40]
	bl sub_0205C660
	b _020410D8
_020410AE:
	mov r3, #0x20
	tst r3, r2
	beq _020410C2
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #2
	ldr r0, [r0, #0x40]
	bl sub_0205C660
	b _020410D8
_020410C2:
	mov r3, #0x10
	tst r2, r3
	beq _020410D4
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl sub_0205C660
	b _020410D8
_020410D4:
	mov r0, #0
	pop {r3, pc}
_020410D8:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_020410DC: .word gMain
	thumb_func_end sub_02041074

	thumb_func_start sub_020410E0
sub_020410E0: ; 0x020410E0
	push {r3, lr}
	ldr r1, _020410EC ; =sub_020410F0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_020410EC: .word sub_020410F0
	thumb_func_end sub_020410E0

	thumb_func_start sub_020410F0
sub_020410F0: ; 0x020410F0
	ldr r0, _0204110C ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _020410FE
	mov r0, #1
	bx lr
_020410FE:
	mov r0, #0xf0
	tst r0, r1
	beq _02041108
	mov r0, #1
	bx lr
_02041108:
	mov r0, #0
	bx lr
	.balign 4, 0
_0204110C: .word gMain
	thumb_func_end sub_020410F0

	thumb_func_start sub_02041110
sub_02041110: ; 0x02041110
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #6
	add r0, r4, #0
	bl sub_020402F0
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl sub_020402F0
	add r1, r0, #0
	ldr r0, [r4, #8]
	mov r2, #3
	bl sub_0205B514
	add r0, r4, #0
	mov r1, #1
	bl sub_020402F0
	add r5, #0x80
	add r7, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r1, r0, #0
	add r0, r7, #0
	bl sub_0205B564
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r4, #0xd2
	orr r0, r1
	strb r0, [r4]
	mov r0, #1
	strb r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02041110

	thumb_func_start sub_02041168
sub_02041168: ; 0x02041168
	push {r4, r5, r6, lr}
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #1
	add r0, r5, #0
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #6
	bl sub_020402F0
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl RemoveWindow
	add r0, r5, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r5, #0xd2
	bic r1, r0
	strb r1, [r5]
	mov r0, #0
	strb r0, [r6]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02041168

	thumb_func_start sub_020411A4
sub_020411A4: ; 0x020411A4
	push {r4, r5, r6, lr}
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #1
	add r0, r5, #0
	bl sub_020402F0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #6
	bl sub_020402F0
	add r4, r0, #0
	add r0, r6, #0
	bl RemoveWindow
	add r0, r5, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r5, #0xd2
	bic r1, r0
	strb r1, [r5]
	mov r0, #0
	strb r0, [r4]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020411A4

	thumb_func_start sub_020411D8
sub_020411D8: ; 0x020411D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0x32
	add r0, r4, #0
	bl sub_020402F0
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x2e
	bl sub_020402F0
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x33
	bl sub_020402F0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x34
	bl sub_020402F0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0x2f
	bl sub_020402F0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x35
	bl sub_020402F0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	strh r1, [r6]
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	strh r1, [r7]
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r2, [r2]
	ldr r1, [sp]
	strh r2, [r1]
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r2, [r2]
	ldr r1, [sp, #4]
	strh r2, [r1]
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r2, [r2]
	ldr r1, [sp, #8]
	strh r2, [r1]
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	strh r1, [r0]
	ldr r1, _0204126C ; =sub_02041270
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0204126C: .word sub_02041270
	thumb_func_end sub_020411D8

	thumb_func_start sub_02041270
sub_02041270: ; 0x02041270
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0x32
	add r0, r4, #0
	bl sub_020402F0
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x33
	bl sub_020402F0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x34
	bl sub_020402F0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0x35
	bl sub_020402F0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x2e
	bl sub_020402F0
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x2f
	bl sub_020402F0
	add r5, r0, #0
	ldrh r0, [r6]
	cmp r0, #0
	bne _020412C6
	ldrh r0, [r5]
	cmp r0, #0
	bne _020412C6
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_020412C6:
	ldrh r3, [r7]
	cmp r3, #0
	beq _020412E8
	ldr r0, [sp, #8]
	ldrh r0, [r0]
	cmp r0, #0
	ldr r0, [r4, #8]
	bne _020412E0
	mov r1, #3
	mov r2, #1
	bl sub_0201BC8C
	b _020412E8
_020412E0:
	mov r1, #3
	mov r2, #2
	bl sub_0201BC8C
_020412E8:
	ldr r0, [sp, #4]
	ldrh r3, [r0]
	cmp r3, #0
	beq _0204130C
	ldr r0, [sp]
	ldrh r0, [r0]
	cmp r0, #0
	ldr r0, [r4, #8]
	bne _02041304
	mov r1, #3
	mov r2, #4
	bl sub_0201BC8C
	b _0204130C
_02041304:
	mov r1, #3
	mov r2, #5
	bl sub_0201BC8C
_0204130C:
	ldrh r0, [r6]
	cmp r0, #0
	beq _02041316
	sub r0, r0, #1
	strh r0, [r6]
_02041316:
	ldrh r0, [r5]
	cmp r0, #0
	beq _02041320
	sub r0, r0, #1
	strh r0, [r5]
_02041320:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02041270

	thumb_func_start sub_02041328
sub_02041328: ; 0x02041328
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0x12
	add r0, r4, #0
	bl sub_020402F0
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x11
	bl sub_020402F0
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	bl sub_020402F0
	str r0, [sp, #0x18]
	ldr r0, [r5, #8]
	add r1, r0, #1
	str r1, [r5, #8]
	ldrb r0, [r0]
	str r0, [sp, #0x10]
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r0, [r1]
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl ScriptReadHalfword
	str r0, [sp, #0x1c]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	ldr r2, [sp, #0x1c]
	orr r1, r0
	add r0, r4, #0
	add r0, #0xd2
	strb r1, [r0]
	ldr r0, [r4, #0x68]
	ldr r1, [sp, #0x14]
	bl ov01_021F3D68
	ldr r0, [r4, #0x68]
	mov r1, #1
	bl ov01_021F3D70
	add r0, r4, #0
	bl ov01_021F3D98
	ldr r0, [r5, #0x78]
	ldr r1, [sp, #0x10]
	ldr r2, [r6]
	bl ReadMsgDataIntoString
	ldr r0, [sp, #0x18]
	ldr r1, [r7]
	ldr r0, [r0]
	ldr r2, [r6]
	bl StringExpandPlaceholders
	ldr r0, [r4, #0x68]
	bl ov01_021F3D80
	mov r3, #0
	str r3, [sp]
	ldr r1, _020413D0 ; =0x00020A0F
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r7]
	mov r1, #1
	bl AddTextPrinterParameterized2
	mov r0, #1
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020413D0: .word 0x00020A0F
	thumb_func_end sub_02041328

	thumb_func_start sub_020413D4
sub_020413D4: ; 0x020413D4
	push {r3, r4, r5, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r4, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r5, [r2]
	bl ScriptReadHalfword
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	orr r1, r0
	add r0, r4, #0
	add r0, #0xd2
	strb r1, [r0]
	ldr r0, [r4, #0x68]
	add r1, r5, #0
	bl ov01_021F3D68
	ldr r0, [r4, #0x68]
	mov r1, #1
	bl ov01_021F3D70
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020413D4

	thumb_func_start sub_02041410
sub_02041410: ; 0x02041410
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	ldr r0, [r3, #0x68]
	bl ov01_021F3D70
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02041410

	thumb_func_start sub_0204142C
sub_0204142C: ; 0x0204142C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x68]
	bl ov01_021F3D88
	cmp r0, #1
	bne _02041442
	mov r0, #0
	pop {r4, pc}
_02041442:
	ldr r1, _02041450 ; =sub_02041454
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_02041450: .word sub_02041454
	thumb_func_end sub_0204142C

	thumb_func_start sub_02041454
sub_02041454: ; 0x02041454
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x68]
	bl ov01_021F3D88
	cmp r0, #1
	bne _02041468
	mov r0, #1
	pop {r3, pc}
_02041468:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02041454

	thumb_func_start sub_0204146C
sub_0204146C: ; 0x0204146C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #3
	add r0, r4, #0
	bl sub_020402F0
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #0x12
	bl sub_020402F0
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x11
	bl sub_020402F0
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	str r0, [sp, #0x18]
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r0, [r1]
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ScriptReadHalfword
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x78]
	ldr r1, [sp, #0x10]
	ldr r2, [r6]
	bl ReadMsgDataIntoString
	ldr r0, [sp, #0x18]
	ldr r1, [r7]
	ldr r0, [r0]
	ldr r2, [r6]
	bl StringExpandPlaceholders
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B8C
	ldr r0, [r4, #0x68]
	bl ov01_021F3D80
	add r6, r0, #0
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	bl sub_0202AD3C
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _02041518 ; =0x00020A0F
	mov r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r7]
	add r0, r6, #0
	bl AddTextPrinterParameterized2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	ldr r0, [sp, #0x1c]
	ldr r1, _0204151C ; =sub_02041520
	str r0, [r5, #0x64]
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02041518: .word 0x00020A0F
_0204151C: .word sub_02041520
	thumb_func_end sub_0204146C

	thumb_func_start sub_02041520
sub_02041520: ; 0x02041520
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #3
	add r0, r4, #0
	bl sub_020402F0
	ldr r1, [r5, #0x64]
	add r7, r0, #0
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r6, r0, #0
	ldr r0, [r4, #0x68]
	bl ov01_021F3D84
	ldrb r0, [r7]
	ldr r4, _020415BC ; =0x0000FFFF
	bl sub_0205B624
	cmp r0, #1
	bne _0204155A
	mov r0, #2
	strh r0, [r6]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0204155A:
	ldr r0, _020415C0 ; =gMain
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _02041568
	mov r4, #0
	b _02041584
_02041568:
	mov r1, #0x80
	tst r1, r0
	beq _02041572
	mov r4, #1
	b _02041584
_02041572:
	mov r1, #0x20
	tst r1, r0
	beq _0204157C
	mov r4, #2
	b _02041584
_0204157C:
	mov r1, #0x10
	tst r0, r1
	beq _02041584
	mov r4, #3
_02041584:
	ldr r0, _020415BC ; =0x0000FFFF
	cmp r4, r0
	beq _020415B8
	ldrb r0, [r7]
	bl sub_020200A0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r4, #0
	ldr r0, [r0, #0x40]
	bl sub_0205C660
	mov r0, #0
	strh r0, [r6]
	add r5, #0x80
	ldr r2, [r5]
	add r0, r2, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r2, #0xd2
	bic r1, r0
	strb r1, [r2]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020415B8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020415BC: .word 0x0000FFFF
_020415C0: .word gMain
	thumb_func_end sub_02041520

	thumb_func_start sub_020415C4
sub_020415C4: ; 0x020415C4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	str r0, [r4, #0x64]
	ldr r1, _020415DC ; =sub_020415E0
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_020415DC: .word sub_020415E0
	thumb_func_end sub_020415C4

	thumb_func_start sub_020415E0
sub_020415E0: ; 0x020415E0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r1, [r5, #0x64]
	ldr r4, [r0]
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r6, r0, #0
	ldr r0, _0204166C ; =gMain
	ldr r1, _02041670 ; =0x0000FFFF
	ldr r2, [r0, #0x48]
	mov r0, #3
	add r3, r2, #0
	tst r3, r0
	beq _0204161A
	mov r0, #0
	strh r0, [r6]
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r4, #0xd2
	bic r1, r0
	strb r1, [r4]
	mov r0, #1
	pop {r4, r5, r6, pc}
_0204161A:
	mov r3, #0x40
	tst r3, r2
	beq _02041624
	mov r1, #0
	b _02041640
_02041624:
	mov r3, #0x80
	tst r3, r2
	beq _0204162E
	mov r1, #1
	b _02041640
_0204162E:
	mov r3, #0x20
	tst r3, r2
	beq _02041638
	mov r1, #2
	b _02041640
_02041638:
	mov r3, #0x10
	tst r2, r3
	beq _02041640
	add r1, r0, #0
_02041640:
	ldr r0, _02041670 ; =0x0000FFFF
	cmp r1, r0
	beq _02041666
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0x40]
	bl sub_0205C660
	mov r0, #0
	strh r0, [r6]
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r4, #0xd2
	bic r1, r0
	strb r1, [r4]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02041666:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_0204166C: .word gMain
_02041670: .word 0x0000FFFF
	thumb_func_end sub_020415E0

	thumb_func_start sub_02041674
sub_02041674: ; 0x02041674
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0204031C
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02041674

	thumb_func_start sub_02041684
sub_02041684: ; 0x02041684
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #2
	add r0, r4, #0
	bl sub_020402F0
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	ldr r2, _020416D8 ; =0x000003D9
	mov r1, #3
	mov r3, #0xb
	bl sub_0200E3DC
	mov r0, #4
	str r0, [sp]
	ldr r0, [r4, #8]
	ldr r1, _020416DC ; =0x020FAC94
	ldr r2, _020416D8 ; =0x000003D9
	mov r3, #0xb
	bl Std_CreateYesNoMenu
	str r0, [r6]
	ldr r1, _020416E0 ; =sub_020416E4
	add r0, r5, #0
	str r7, [r5, #0x64]
	bl SetupNativeScript
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020416D8: .word 0x000003D9
_020416DC: .word 0x020FAC94
_020416E0: .word sub_020416E4
	thumb_func_end sub_02041684

	thumb_func_start sub_020416E4
sub_020416E4: ; 0x020416E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	mov r1, #2
	add r0, r6, #0
	bl sub_020402F0
	ldr r1, [r5, #0x64]
	add r4, r0, #0
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #4
	bl sub_02001FDC
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02041718
	mov r0, #0
	pop {r4, r5, r6, pc}
_02041718:
	cmp r0, #0
	bne _02041720
	mov r0, #0
	b _02041722
_02041720:
	mov r0, #1
_02041722:
	strh r0, [r5]
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020416E4

	thumb_func_start sub_02041728
sub_02041728: ; 0x02041728
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #1
	bl sub_020402F0
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	mov r1, #0x13
	bl sub_020402F0
	add r5, r0, #0
	ldr r1, _02041754 ; =0x000003E2
	add r0, r4, #0
	bl sub_0200F0AC
	str r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02041754: .word 0x000003E2
	thumb_func_end sub_02041728

	thumb_func_start sub_02041758
sub_02041758: ; 0x02041758
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x13
	bl sub_020402F0
	ldr r0, [r0]
	bl sub_0200F450
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02041758

	thumb_func_start sub_02041770
sub_02041770: ; 0x02041770
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	add r6, r1, #0
	mov r1, #0x10
	add r7, r2, #0
	str r0, [sp, #0x20]
	bl sub_020402F0
	str r0, [sp, #0x24]
	ldr r0, [r5, #8]
	add r1, r0, #1
	str r1, [r5, #8]
	ldrb r0, [r0]
	add r2, r1, #1
	str r0, [sp, #0x1c]
	str r2, [r5, #8]
	ldrb r0, [r1]
	add r1, r2, #1
	str r0, [sp, #0x18]
	str r1, [r5, #8]
	ldrb r0, [r2]
	str r0, [sp, #0x14]
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x28]
	bl GetVarPointer
	str r0, [sp, #0x2c]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #1
	bl sub_020402F0
	ldr r1, [sp, #0x2c]
	str r4, [sp]
	str r1, [sp, #4]
	ldr r1, [sp, #0x24]
	ldr r1, [r1]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r7, [sp, #0x10]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x14]
	bl ov01_021EDF78
	str r0, [r6]
	ldr r0, [sp, #0x28]
	str r0, [r5, #0x64]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02041770

	thumb_func_start sub_020417EC
sub_020417EC: ; 0x020417EC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_020402F0
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl sub_02041770
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_020417EC

	thumb_func_start sub_02041808
sub_02041808: ; 0x02041808
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_020402F0
	add r1, r0, #0
	ldr r2, [r4, #0x78]
	add r0, r4, #0
	bl sub_02041770
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02041808

	thumb_func_start sub_02041824
sub_02041824: ; 0x02041824
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_020402F0
	ldr r1, [r4, #8]
	add r3, r1, #1
	str r3, [r4, #8]
	ldrb r1, [r1]
	add r2, r3, #1
	str r2, [r4, #8]
	ldrb r2, [r3]
	ldr r0, [r0]
	bl ov01_021EDC7C
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02041824

	thumb_func_start sub_0204184C
sub_0204184C: ; 0x0204184C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl ov01_021EDC7C
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0204184C

	thumb_func_start sub_02041890
sub_02041890: ; 0x02041890
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_020402F0
	ldr r0, [r0]
	bl ov01_021EDC84
	ldr r1, _020418B0 ; =sub_020418B4
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_020418B0: .word sub_020418B4
	thumb_func_end sub_02041890

	thumb_func_start sub_020418B4
sub_020418B4: ; 0x020418B4
	push {r3, lr}
	add r1, r0, #0
	ldr r1, [r1, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	ldrh r1, [r0]
	ldr r0, _020418D8 ; =0x0000EEEE
	cmp r1, r0
	beq _020418D2
	mov r0, #1
	pop {r3, pc}
_020418D2:
	mov r0, #0
	pop {r3, pc}
	nop
_020418D8: .word 0x0000EEEE
	thumb_func_end sub_020418B4

	thumb_func_start sub_020418DC
sub_020418DC: ; 0x020418DC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_020402F0
	ldr r0, [r0]
	bl ov01_021EDC84
	ldr r1, _020418FC ; =sub_02041900
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_020418FC: .word sub_02041900
	thumb_func_end sub_020418DC

	thumb_func_start sub_02041900
sub_02041900: ; 0x02041900
	push {r4, r5, r6, lr}
	add r1, r0, #0
	add r0, #0x80
	ldr r1, [r1, #0x64]
	ldr r5, [r0]
	lsl r1, r1, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl sub_020402F0
	add r6, r0, #0
	ldrh r1, [r4]
	ldr r0, _0204194C ; =0x0000EEEE
	cmp r1, r0
	bne _02041946
	add r5, #0x80
	ldr r0, [r5]
	bl sub_0205A478
	cmp r0, #0
	beq _02041942
	mov r0, #8
	strh r0, [r4]
	ldr r0, [r6]
	bl ov01_021EDF38
	mov r0, #1
	pop {r4, r5, r6, pc}
_02041942:
	mov r0, #0
	pop {r4, r5, r6, pc}
_02041946:
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0204194C: .word 0x0000EEEE
	thumb_func_end sub_02041900

	thumb_func_start sub_02041950
sub_02041950: ; 0x02041950
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_020402F0
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl sub_02041770
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02041950

	thumb_func_start sub_0204196C
sub_0204196C: ; 0x0204196C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_020402F0
	add r1, r0, #0
	ldr r2, [r4, #0x78]
	add r0, r4, #0
	bl sub_02041770
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_0204196C

	thumb_func_start sub_02041988
sub_02041988: ; 0x02041988
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r3, r0, #0
	lsl r1, r6, #0x18
	lsl r2, r7, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r4]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov01_021EDF9C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02041988

	thumb_func_start sub_020419E8
sub_020419E8: ; 0x020419E8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_020402F0
	ldr r0, [r0]
	bl ov01_021EDFA4
	ldr r1, _02041A08 ; =sub_020418B4
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02041A08: .word sub_020418B4
	thumb_func_end sub_020419E8

	thumb_func_start sub_02041A0C
sub_02041A0C: ; 0x02041A0C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	ldr r0, [r4]
	bl ov01_021EE014
	ldr r1, _02041A44 ; =sub_020418B4
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02041A44: .word sub_020418B4
	thumb_func_end sub_02041A0C

	thumb_func_start sub_02041A48
sub_02041A48: ; 0x02041A48
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl ov01_021EE0EC
	ldr r1, _02041A94 ; =sub_020418B4
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02041A94: .word sub_020418B4
	thumb_func_end sub_02041A48

	thumb_func_start sub_02041A98
sub_02041A98: ; 0x02041A98
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_020402F0
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov01_021EE974
	ldr r1, _02041AC0 ; =sub_020418B4
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02041AC0: .word sub_020418B4
	thumb_func_end sub_02041A98

	thumb_func_start sub_02041AC4
sub_02041AC4: ; 0x02041AC4
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_020402F0
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov01_021EF018
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02041AC4

	thumb_func_start sub_02041AE4
sub_02041AE4: ; 0x02041AE4
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_020402F0
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov01_021EF034
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02041AE4

	thumb_func_start sub_02041B04
sub_02041B04: ; 0x02041B04
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadWord
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_02041C70
	add r7, r0, #0
	bne _02041B3E
	cmp r4, #0xfd
	beq _02041B3A
	bl GF_AssertFail
_02041B3A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02041B3E:
	cmp r4, #0xfd
	bne _02041B46
	bl ov01_021F7704
_02041B46:
	ldr r1, [r5, #8]
	add r0, r7, #0
	add r1, r1, r6
	bl sub_02062214
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #4
	bl sub_020402F0
	ldrb r1, [r0]
	add r5, #0x80
	mov r2, #0
	add r1, r1, #1
	strb r1, [r0]
	ldr r0, [r5]
	add r1, r4, #0
	bl sub_02041CC4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02041B04

	thumb_func_start sub_02041B74
sub_02041B74: ; 0x02041B74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_02041C70
	str r0, [sp, #4]
	cmp r0, #0
	bne _02041BCA
	bl GF_AssertFail
_02041BCA:
	mov r0, #4
	add r1, r0, #0
	add r1, #0xfc
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [sp, #4]
	bl sub_0205F914
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r0, [sp, #4]
	bl sub_0205F934
	lsl r0, r0, #0x10
	ldr r2, [sp]
	lsr r0, r0, #0x10
	mov r1, #0
	cmp r6, r2
	bhs _02041C00
	mov r2, #0xf
	strh r2, [r4]
	ldr r2, [sp]
	add r1, r1, #1
	sub r2, r2, r6
	strh r2, [r4, #2]
	b _02041C10
_02041C00:
	cmp r6, r2
	bls _02041C10
	mov r2, #0xe
	strh r2, [r4]
	ldr r2, [sp]
	add r1, r1, #1
	sub r2, r6, r2
	strh r2, [r4, #2]
_02041C10:
	cmp r0, r7
	bhs _02041C24
	lsl r2, r1, #2
	mov r3, #0xc
	strh r3, [r4, r2]
	sub r3, r7, r0
	add r0, r4, r2
	strh r3, [r0, #2]
	add r1, r1, #1
	b _02041C36
_02041C24:
	cmp r0, r7
	bls _02041C36
	lsl r2, r1, #2
	mov r3, #0xd
	strh r3, [r4, r2]
	sub r3, r0, r7
	add r0, r4, r2
	strh r3, [r0, #2]
	add r1, r1, #1
_02041C36:
	lsl r2, r1, #2
	mov r0, #0xfe
	strh r0, [r4, r2]
	mov r1, #0
	add r0, r4, r2
	strh r1, [r0, #2]
	ldr r0, [sp, #4]
	add r1, r4, #0
	bl sub_02062214
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #4
	bl sub_020402F0
	ldrb r1, [r0]
	add r5, #0x80
	add r2, r4, #0
	add r1, r1, #1
	strb r1, [r0]
	ldr r0, [r5]
	add r1, r6, #0
	bl sub_02041CC4
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02041B74

	thumb_func_start sub_02041C70
sub_02041C70: ; 0x02041C70
	push {r3, lr}
	cmp r1, #0xf2
	bne _02041C80
	ldr r0, [r0, #0x3c]
	mov r1, #0x30
	bl sub_0205EEB4
	pop {r3, pc}
_02041C80:
	cmp r1, #0xf1
	bne _02041C8E
	mov r1, #0xb
	bl sub_020402F0
	ldr r0, [r0]
	pop {r3, pc}
_02041C8E:
	ldr r0, [r0, #0x3c]
	bl sub_0205EE60
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02041C70

	thumb_func_start sub_02041C98
sub_02041C98: ; 0x02041C98
	push {r3, lr}
	ldr r1, _02041CA4 ; =sub_02041CA8
	bl SetupNativeScript
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02041CA4: .word sub_02041CA8
	thumb_func_end sub_02041C98

	thumb_func_start sub_02041CA8
sub_02041CA8: ; 0x02041CA8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #4
	bl sub_020402F0
	ldrb r0, [r0]
	cmp r0, #0
	bne _02041CBE
	mov r0, #1
	pop {r3, pc}
_02041CBE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02041CA8

	thumb_func_start sub_02041CC4
sub_02041CC4: ; 0x02041CC4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #4
	mov r1, #0x10
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _02041CDE
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
_02041CDE:
	str r5, [r4, #0xc]
	str r6, [r4, #4]
	ldr r0, _02041CF4 ; =sub_02041CF8
	add r1, r4, #0
	mov r2, #0
	str r7, [r4, #8]
	bl sub_0200E320
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02041CF4: .word sub_02041CF8
	thumb_func_end sub_02041CC4

	thumb_func_start sub_02041CF8
sub_02041CF8: ; 0x02041CF8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r0, [r5, #0xc]
	mov r1, #4
	bl sub_020402F0
	add r4, r0, #0
	ldr r0, [r5, #4]
	bl sub_02062260
	cmp r0, #1
	bne _02041D3C
	ldr r0, [r5, #4]
	bl sub_0206226C
	ldr r0, [r5]
	bl sub_0200E390
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02041D26
	bl FreeToHeap
_02041D26:
	add r0, r5, #0
	bl FreeToHeap
	ldrb r0, [r4]
	cmp r0, #0
	bne _02041D38
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_02041D38:
	sub r0, r0, #1
	strb r0, [r4]
_02041D3C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02041CF8

	thumb_func_start sub_02041D40
sub_02041D40: ; 0x02041D40
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0xa
	add r0, r5, #0
	bl sub_020402F0
	ldr r0, [r0]
	cmp r0, #0
	bne _02041D8A
	ldr r0, [r5, #0x3c]
	bl sub_0205F574
	add r0, r5, #0
	bl sub_02069D68
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02041D90
	add r0, r4, #0
	bl sub_0205F648
	cmp r0, #0
	beq _02041D90
	add r0, r4, #0
	bl sub_0205F708
	ldr r1, _02041D94 ; =sub_02041E60
	add r0, r6, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
_02041D8A:
	add r0, r6, #0
	bl sub_02041E84
_02041D90:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02041D94: .word sub_02041E60
	thumb_func_end sub_02041D40

	thumb_func_start sub_02041D98
sub_02041D98: ; 0x02041D98
	push {r4, r5, r6, lr}
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0xa
	add r0, r4, #0
	bl sub_020402F0
	add r5, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	ldr r1, _02041E5C ; =0x021D415C
	add r6, r0, #0
	ldrb r2, [r1]
	mov r1, #1
	tst r1, r2
	beq _02041DD2
	bl sub_02062198
	cmp r0, #1
	bne _02041DD2
	add r0, r6, #0
	bl sub_0205F6FC
	ldr r1, _02041E5C ; =0x021D415C
	mov r0, #0xfe
	ldrb r2, [r1]
	and r0, r2
	strb r0, [r1]
_02041DD2:
	ldr r0, _02041E5C ; =0x021D415C
	ldrb r1, [r0]
	mov r0, #4
	tst r0, r1
	beq _02041DF6
	ldr r0, [r5]
	bl sub_0205F648
	cmp r0, #0
	bne _02041DF6
	ldr r0, [r5]
	bl sub_0205F6FC
	ldr r1, _02041E5C ; =0x021D415C
	mov r0, #0xfb
	ldrb r2, [r1]
	and r0, r2
	strb r0, [r1]
_02041DF6:
	ldr r0, _02041E5C ; =0x021D415C
	ldrb r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _02041E22
	ldr r0, [r4, #0x3c]
	mov r1, #0x30
	bl sub_0205EEB4
	add r4, r0, #0
	bl sub_0205F648
	cmp r0, #0
	bne _02041E22
	add r0, r4, #0
	bl sub_0205F6FC
	ldr r1, _02041E5C ; =0x021D415C
	mov r0, #0xfd
	ldrb r2, [r1]
	and r0, r2
	strb r0, [r1]
_02041E22:
	ldr r0, _02041E5C ; =0x021D415C
	ldrb r1, [r0]
	mov r0, #8
	tst r0, r1
	beq _02041E4C
	ldr r0, [r5]
	bl sub_020660C0
	add r4, r0, #0
	bl sub_0205F648
	cmp r0, #0
	bne _02041E4C
	add r0, r4, #0
	bl sub_0205F6FC
	ldr r1, _02041E5C ; =0x021D415C
	mov r0, #0xf7
	ldrb r2, [r1]
	and r0, r2
	strb r0, [r1]
_02041E4C:
	ldr r0, _02041E5C ; =0x021D415C
	ldrb r0, [r0]
	cmp r0, #0
	bne _02041E58
	mov r0, #1
	pop {r4, r5, r6, pc}
_02041E58:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02041E5C: .word 0x021D415C
	thumb_func_end sub_02041D98

	thumb_func_start sub_02041E60
sub_02041E60: ; 0x02041E60
	push {r4, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069D68
	add r4, r0, #0
	bl sub_0205F648
	cmp r0, #0
	bne _02041E7E
	add r0, r4, #0
	bl sub_0205F6FC
	mov r0, #1
	pop {r4, pc}
_02041E7E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02041E60

	thumb_func_start sub_02041E84
sub_02041E84: ; 0x02041E84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0xa
	add r0, r4, #0
	bl sub_020402F0
	add r5, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	str r0, [sp, #4]
	ldr r0, [r4, #0x3c]
	mov r1, #0x30
	bl sub_0205EEB4
	add r7, r0, #0
	ldr r0, [r5]
	bl sub_020660C0
	add r6, r0, #0
	ldr r0, [r4, #0x3c]
	ldr r1, _02041F48 ; =0x021D415C
	mov r2, #0
	strb r2, [r1]
	bl sub_0205F574
	ldr r0, [sp, #4]
	bl sub_02062198
	cmp r0, #0
	bne _02041ED8
	ldr r1, _02041F48 ; =0x021D415C
	mov r0, #1
	ldrb r2, [r1]
	orr r0, r2
	strb r0, [r1]
	ldr r0, [sp, #4]
	bl sub_0205F708
_02041ED8:
	ldr r0, [r5]
	bl sub_0205F648
	cmp r0, #0
	beq _02041EF2
	ldr r1, _02041F48 ; =0x021D415C
	mov r0, #4
	ldrb r2, [r1]
	orr r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	bl sub_0205F708
_02041EF2:
	cmp r7, #0
	beq _02041F1A
	add r0, r4, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02041F1A
	add r0, r7, #0
	bl sub_0205F648
	cmp r0, #0
	bne _02041F1A
	ldr r1, _02041F48 ; =0x021D415C
	mov r0, #2
	ldrb r2, [r1]
	orr r0, r2
	strb r0, [r1]
	add r0, r7, #0
	bl sub_0205F708
_02041F1A:
	cmp r6, #0
	beq _02041F38
	add r0, r6, #0
	bl sub_0205F648
	cmp r0, #0
	beq _02041F38
	ldr r1, _02041F48 ; =0x021D415C
	mov r0, #8
	ldrb r2, [r1]
	orr r0, r2
	strb r0, [r1]
	add r0, r6, #0
	bl sub_0205F708
_02041F38:
	ldr r0, [sp]
	ldr r1, _02041F4C ; =sub_02041D98
	bl SetupNativeScript
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02041F48: .word 0x021D415C
_02041F4C: .word sub_02041D98
	thumb_func_end sub_02041E84

	thumb_func_start sub_02041F50
sub_02041F50: ; 0x02041F50
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl sub_0205F5A4
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02041F50

	thumb_func_start sub_02041F60
sub_02041F60: ; 0x02041F60
	push {r3, r4, r5, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, r0, #0
	ldr r0, [r5, #0x3c]
	add r1, r4, #0
	bl sub_0205EE60
	cmp r0, #0
	beq _02041F80
	bl sub_0205F6FC
	b _02041F88
_02041F80:
	cmp r4, #0xfd
	beq _02041F88
	bl GF_AssertFail
_02041F88:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02041F60

	thumb_func_start sub_02041F8C
sub_02041F8C: ; 0x02041F8C
	push {r3, r4, r5, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, r0, #0
	ldr r0, [r5, #0x3c]
	add r1, r4, #0
	bl sub_0205EE60
	cmp r0, #0
	beq _02041FAC
	bl sub_0205F708
	b _02041FB4
_02041FAC:
	cmp r4, #0xfd
	beq _02041FB4
	bl GF_AssertFail
_02041FB4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02041F8C

	thumb_func_start sub_02041FB8
sub_02041FB8: ; 0x02041FB8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203B74C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0203B754
	str r0, [sp]
	ldr r3, [r5, #0x20]
	ldr r0, [r5, #0x3c]
	ldr r3, [r3]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0205E34C
	cmp r0, #0
	bne _02041FFA
	bl GF_AssertFail
_02041FFA:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02041FB8

	thumb_func_start sub_02042000
sub_02042000: ; 0x02042000
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r1, r0, #0
	ldr r0, [r5, #0x3c]
	bl sub_0205EE60
	cmp r0, #0
	bne _0204202A
	bl GF_AssertFail
	b _0204202E
_0204202A:
	bl sub_0205E400
_0204202E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02042000

	thumb_func_start sub_02042034
sub_02042034: ; 0x02042034
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xb
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	mov r1, #2
	ldr r0, [r0]
	lsl r1, r1, #0xc
	str r1, [sp]
	mov r3, #0
	str r3, [sp, #4]
	ldr r1, [r0, #0x20]
	add r2, r7, #0
	ldr r1, [r1]
	str r1, [sp, #8]
	ldr r0, [r0, #0x3c]
	add r1, r6, #0
	bl sub_0205E294
	str r0, [r4]
	bl sub_02061070
	ldr r0, [r4]
	mov r1, #1
	bl sub_0205F690
	ldr r0, [r4]
	mov r1, #0
	bl sub_0205F6AC
	ldr r0, [r4]
	bl sub_0205F964
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	add r4, r0, #0
	ldr r1, [r1, #0x2c]
	bl ov01_021F62E8
	add r5, #0x80
	ldr r1, [r5]
	add r0, r4, #0
	ldr r1, [r1, #0x24]
	bl sub_02023214
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02042034

	thumb_func_start sub_020420CC
sub_020420CC: ; 0x020420CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xb
	bl sub_020402F0
	ldr r0, [r0]
	bl sub_0205E3CC
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xff
	ldr r0, [r0, #0x3c]
	bl sub_0205EE60
	bl sub_0205F964
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	add r4, r0, #0
	ldr r1, [r1, #0x2c]
	bl ov01_021F62E8
	add r5, #0x80
	ldr r1, [r5]
	add r0, r4, #0
	ldr r1, [r1, #0x24]
	bl sub_02023214
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020420CC

	thumb_func_start sub_02042110
sub_02042110: ; 0x02042110
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xb
	bl sub_020402F0
	mov r1, #2
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	lsl r1, r1, #0xc
	str r1, [sp]
	mov r3, #0
	str r3, [sp, #4]
	ldr r1, [r0, #0x20]
	add r2, r7, #0
	ldr r1, [r1]
	str r1, [sp, #8]
	ldr r0, [r0, #0x3c]
	add r1, r6, #0
	bl sub_0205E294
	str r0, [r4]
	bl sub_02061070
	ldr r0, [r4]
	mov r1, #1
	bl sub_0205F690
	ldr r0, [r4]
	mov r1, #0
	bl sub_0205F6AC
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02042110

	thumb_func_start sub_02042184
sub_02042184: ; 0x02042184
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xb
	bl sub_020402F0
	ldr r0, [r0]
	bl sub_0205E3CC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02042184

	thumb_func_start sub_0204219C
sub_0204219C: ; 0x0204219C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r0, #0x80
	ldr r5, [r0]
	ldr r0, [r5, #0x40]
	bl sub_0205C654
	bl sub_020611F4
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0xa
	bl sub_020402F0
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _020421C6
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_020421C6:
	bl sub_0205F2A8
	add r7, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl ov01_021F9408
	ldr r0, [r4]
	bl sub_0205F24C
	cmp r0, #0xfd
	bne _020422AC
	ldr r0, [r4]
	bl ov01_022055DC
	cmp r0, #0
	beq _020422AC
	cmp r7, r6
	beq _020422AC
	ldr r0, [r4]
	add r1, sp, #8
	add r2, sp, #4
	bl ov01_02205604
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r5, #0
	bl sub_02054918
	add r5, r0, #0
	sub r0, r6, #2
	cmp r0, #1
	bhi _02042242
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6E8
	cmp r0, #1
	bne _02042226
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	mov r1, #0
	bl ov01_021FF0E4
	b _02042242
_02042226:
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	bne _02042242
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	mov r1, #0
	bl ov01_021FF964
_02042242:
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6E8
	cmp r0, #0
	bne _020422AC
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #0
	bne _020422AC
	ldr r0, [r4]
	add r1, r5, #0
	bl sub_02060E54
	cmp r0, #0
	bne _020422AC
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B984
	cmp r0, #0
	bne _020422AC
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B7A4
	cmp r0, #0
	bne _020422AC
	ldr r0, [r4]
	add r1, r5, #0
	bl sub_02060EBC
	cmp r0, #0
	bne _020422AC
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B8AC
	cmp r0, #0
	bne _020422AC
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BA70
	cmp r0, #0
	bne _020422AC
	mov r1, #1
	ldr r0, [r4]
	lsl r1, r1, #0x14
	bl sub_0205F214
_020422AC:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204219C

	thumb_func_start sub_020422B4
sub_020422B4: ; 0x020422B4
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r5, #0x40]
	bl sub_0205C67C
	strh r0, [r6]
	ldr r0, [r5, #0x40]
	bl sub_0205C688
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020422B4

	thumb_func_start sub_020422F8
sub_020422F8: ; 0x020422F8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	ldr r0, [r5, #0x3c]
	add r1, r7, #0
	bl sub_0205EE60
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	cmp r5, #0
	beq _0204235A
	add r0, r5, #0
	bl sub_0205F914
	strh r0, [r6]
	add r0, r5, #0
	bl sub_0205F934
	strh r0, [r4]
	b _02042368
_0204235A:
	mov r0, #0xff
	strh r0, [r6]
	strh r0, [r4]
	cmp r7, #0xfd
	beq _02042368
	bl GF_AssertFail
_02042368:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020422F8

	thumb_func_start sub_0204236C
sub_0204236C: ; 0x0204236C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x40]
	bl sub_0205C654
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204236C

	thumb_func_start sub_02042394
sub_02042394: ; 0x02042394
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	cmp r7, #0
	beq _020423EA
	lsl r0, r7, #0xc
	bl _itof
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _020423F8
_020423EA:
	lsl r0, r7, #0xc
	bl _itof
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_020423F8:
	bl _ftoi
	str r0, [sp]
	cmp r6, #0
	beq _02042414
	lsl r0, r6, #0xc
	bl _itof
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02042422
_02042414:
	lsl r0, r6, #0xc
	bl _itof
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02042422:
	bl _ftoi
	str r0, [sp, #4]
	cmp r4, #0
	beq _0204243E
	lsl r0, r4, #0xc
	bl _itof
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0204244C
_0204243E:
	lsl r0, r4, #0xc
	bl _itof
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0204244C:
	bl _ftoi
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl sub_0205C6DC
	add r1, sp, #0
	bl sub_0205F9A0
	add r5, #0x80
	ldr r1, [r5]
	add r0, sp, #0
	ldr r1, [r1, #0x24]
	bl sub_02023514
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02042394

	thumb_func_start sub_02042478
sub_02042478: ; 0x02042478
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl sub_0205EE60
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	bl sub_0205F79C
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02042478

	thumb_func_start sub_020424AC
sub_020424AC: ; 0x020424AC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl sub_0205EE60
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	cmp r5, #0
	beq _020424E2
	add r0, r5, #0
	bl sub_0205FC94
_020424E2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020424AC

	thumb_func_start sub_020424E8
sub_020424E8: ; 0x020424E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x3c]
	bl sub_0205EE60
	cmp r0, #0
	beq _0204252A
	bl sub_0205F264
	strh r0, [r4]
_0204252A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020424E8

	thumb_func_start sub_02042530
sub_02042530: ; 0x02042530
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	bl GetMonUnownLetter
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02042530

	thumb_func_start sub_02042574
sub_02042574: ; 0x02042574
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r1, r5, #0
	add r1, #0x80
	add r4, r0, #0
	ldr r1, [r1]
	mov r0, #0x20
	bl sub_0203E580
	str r0, [r4]
	ldr r1, _020425A0 ; =sub_020429F8
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_020425A0: .word sub_020429F8
	thumb_func_end sub_02042574

	thumb_func_start sub_020425A4
sub_020425A4: ; 0x020425A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r1, r5, #0
	add r1, #0x80
	add r4, r0, #0
	ldr r1, [r1]
	mov r0, #0x20
	bl sub_0203E5A4
	str r0, [r4]
	ldr r1, _020425D0 ; =sub_020429F8
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_020425D0: .word sub_020429F8
	thumb_func_end sub_020425A4

	thumb_func_start sub_020425D4
sub_020425D4: ; 0x020425D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	mov r1, #0x20
	ldr r0, [r0, #0x10]
	bl sub_0203E6D4
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020425D4

	thumb_func_start sub_020425F8
sub_020425F8: ; 0x020425F8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _02042624
	bl GF_AssertFail
_02042624:
	ldr r0, [r4]
	bl sub_0203E5C8
	strh r0, [r5]
	ldrh r0, [r5]
	cmp r0, #7
	bne _02042636
	mov r0, #0xff
	strh r0, [r5]
_02042636:
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020425F8

	thumb_func_start sub_02042644
sub_02042644: ; 0x02042644
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r6, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	ldr r7, [r4]
	cmp r7, #0
	bne _02042684
	bl GF_AssertFail
_02042684:
	ldr r0, [r4]
	bl sub_0203E5C8
	cmp r0, #7
	bne _02042694
	mov r0, #0xff
	strh r0, [r5]
	b _020426B6
_02042694:
	cmp r0, #6
	bne _020426B6
	add r0, r7, #0
	add r0, #0x30
	ldrb r0, [r0]
	add r7, #0x31
	strh r0, [r5]
	ldrh r0, [r5]
	sub r0, r0, #1
	strh r0, [r5]
	ldrb r0, [r7]
	strh r0, [r6]
	ldrh r0, [r6]
	cmp r0, #0
	beq _020426B6
	sub r0, r0, #1
	strh r0, [r6]
_020426B6:
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02042644

	thumb_func_start sub_020426C4
sub_020426C4: ; 0x020426C4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r7, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl sub_020402F0
	add r6, r0, #0
	ldr r4, [r6]
	cmp r4, #0
	bne _02042718
	bl GF_AssertFail
_02042718:
	ldr r0, [r6]
	bl sub_0203E5C8
	cmp r0, #7
	bne _02042728
	mov r0, #0xff
	strh r0, [r5]
	b _0204275C
_02042728:
	cmp r0, #6
	bne _0204275C
	add r0, r4, #0
	add r0, #0x30
	ldrb r0, [r0]
	strh r0, [r5]
	ldrh r0, [r5]
	sub r0, r0, #1
	strh r0, [r5]
	add r0, r4, #0
	add r0, #0x31
	ldrb r1, [r0]
	ldr r0, [sp]
	add r4, #0x32
	strh r1, [r0]
	ldrh r0, [r0]
	sub r1, r0, #1
	ldr r0, [sp]
	strh r1, [r0]
	ldrb r0, [r4]
	strh r0, [r7]
	ldrh r0, [r7]
	cmp r0, #0
	beq _0204275C
	sub r0, r0, #1
	strh r0, [r7]
_0204275C:
	ldr r0, [r6]
	bl FreeToHeap
	mov r0, #0
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020426C4

	thumb_func_start sub_02042768
sub_02042768: ; 0x02042768
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r7, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl sub_020402F0
	add r6, r0, #0
	ldr r4, [r6]
	cmp r4, #0
	bne _020427BC
	bl GF_AssertFail
_020427BC:
	ldr r0, [r6]
	bl sub_0203E5C8
	cmp r0, #7
	bne _020427CC
	mov r0, #0xff
	strh r0, [r5]
	b _02042800
_020427CC:
	cmp r0, #6
	bne _02042800
	add r0, r4, #0
	add r0, #0x30
	ldrb r0, [r0]
	strh r0, [r5]
	ldrh r0, [r5]
	sub r0, r0, #1
	strh r0, [r5]
	add r0, r4, #0
	add r0, #0x31
	ldrb r1, [r0]
	ldr r0, [sp]
	add r4, #0x32
	strh r1, [r0]
	ldrh r0, [r0]
	sub r1, r0, #1
	ldr r0, [sp]
	strh r1, [r0]
	ldrb r0, [r4]
	strh r0, [r7]
	ldrh r0, [r7]
	cmp r0, #0
	beq _02042800
	sub r0, r0, #1
	strh r0, [r7]
_02042800:
	ldr r0, [r6]
	bl FreeToHeap
	mov r0, #0
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02042768

	thumb_func_start sub_0204280C
sub_0204280C: ; 0x0204280C
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r6, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _02042840
	bl GF_AssertFail
_02042840:
	cmp r6, #1
	ldr r0, [r4]
	bne _0204284C
	bl sub_0203E864
	b _02042850
_0204284C:
	bl sub_0203E600
_02042850:
	strh r0, [r5]
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0204280C

	thumb_func_start sub_02042860
sub_02042860: ; 0x02042860
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r4, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r3, r0, #0
	cmp r6, #1
	bne _020428B6
	add r1, r5, #0
	add r1, #0x80
	lsl r2, r7, #0x18
	ldr r1, [r1]
	mov r0, #0x20
	lsr r2, r2, #0x18
	bl sub_0203E7F4
	b _020428C4
_020428B6:
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	mov r0, #0x20
	add r2, r7, #0
	bl sub_0203FB94
_020428C4:
	ldr r1, _020428D4 ; =sub_020429F8
	str r0, [r4]
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020428D4: .word sub_020429F8
	thumb_func_end sub_02042860

	thumb_func_start sub_020428D8
sub_020428D8: ; 0x020428D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	mov r0, #0x20
	bl sub_02095EF8
	add r7, r0, #0
	ldr r0, _02042944 ; =SDK_OVERLAY_OVY_26_ID
	mov r1, #2
	bl HandleLoadOverlay
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_020555F0
	add r3, r0, #0
	add r5, #0x80
	ldr r1, [r5]
	lsl r0, r4, #0x18
	lsl r3, r3, #0x18
	ldr r1, [r1, #0xc]
	lsr r0, r0, #0x18
	add r2, r7, #0
	lsr r3, r3, #0x18
	bl sub_020932A4
	strh r0, [r6]
	ldr r0, _02042944 ; =SDK_OVERLAY_OVY_26_ID
	bl UnloadOverlayByID
	add r0, r7, #0
	bl sub_02095F68
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02042944: .word SDK_OVERLAY_OVY_26_ID
	thumb_func_end sub_020428D8

	thumb_func_start sub_02042948
sub_02042948: ; 0x02042948
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	bl sub_0203B984
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02042948

	thumb_func_start sub_02042974
sub_02042974: ; 0x02042974
	push {r3, r4, r5, lr}
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0x14
	add r0, r5, #0
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505A0
	cmp r0, #0
	beq _02042992
	mov r0, #0
	pop {r3, r4, r5, pc}
_02042992:
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02042974

	thumb_func_start sub_020429A0
sub_020429A0: ; 0x020429A0
	push {r3, r4, r5, lr}
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0x14
	add r0, r5, #0
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505A0
	cmp r0, #0
	beq _020429BE
	mov r0, #0
	pop {r3, r4, r5, pc}
_020429BE:
	add r0, r5, #0
	bl sub_02093070
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020429A0

	thumb_func_start sub_020429D4
sub_020429D4: ; 0x020429D4
	push {r4, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_020970C0
	cmp r0, #0
	bne _020429F0
	mov r0, #0
	pop {r4, pc}
_020429F0:
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_020429D4

	thumb_func_start sub_020429F8
sub_020429F8: ; 0x020429F8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_020505A0
	cmp r0, #0
	bne _02042A0A
	mov r0, #1
	pop {r3, pc}
_02042A0A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020429F8

	thumb_func_start sub_02042A10
sub_02042A10: ; 0x02042A10
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl sub_020552A4
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02042A10

	thumb_func_start sub_02042A20
sub_02042A20: ; 0x02042A20
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl sub_0205525C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02042A20

	thumb_func_start sub_02042A30
sub_02042A30: ; 0x02042A30
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0xc]
	add r5, r1, #0
	add r4, r2, #0
	bl sub_0202C028
	cmp r5, #0
	bne _02042A4E
	add r1, r4, #0
	bl sub_0202B9EC
	cmp r0, #0
	bne _02042A5C
	mov r0, #0
	pop {r3, r4, r5, pc}
_02042A4E:
	add r1, r4, #0
	bl sub_0202BA08
	cmp r0, #0
	bne _02042A5C
	mov r0, #0
	pop {r3, r4, r5, pc}
_02042A5C:
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02042A30

	thumb_func_start sub_02042A60
sub_02042A60: ; 0x02042A60
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	ldr r0, [r5, #0xc]
	add r4, r2, #0
	add r6, r3, #0
	bl sub_0202C028
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02042A30
	cmp r0, #0
	bne _02042A84
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02042A84:
	ldr r0, [sp]
	mov r1, #0xc
	bl AllocFromHeap
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
	str r7, [r0]
	str r4, [r0, #8]
	str r6, [r0, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02042A60

	thumb_func_start sub_02042AB0
sub_02042AB0: ; 0x02042AB0
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov01_021F729C
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02042AB0

	thumb_func_start sub_02042AC0
sub_02042AC0: ; 0x02042AC0
	push {r3, lr}
	ldr r0, [r0, #0x74]
	bl sub_02078B58
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02042AC0

	thumb_func_start sub_02042ACC
sub_02042ACC: ; 0x02042ACC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	ldr r1, [r4]
	ldr r1, [r1, #4]
	strh r1, [r0]
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02042ACC

	thumb_func_start sub_02042AFC
sub_02042AFC: ; 0x02042AFC
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	bl sub_0203769C
	strh r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02042AFC

	thumb_func_start sub_02042B1C
sub_02042B1C: ; 0x02042B1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl sub_020402F0
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r2, _02042BA8 ; =0x000003D9
	ldr r0, [r0, #8]
	mov r1, #3
	mov r3, #0xb
	bl sub_0200E3DC
	mov r0, #0xb
	str r0, [sp]
	ldr r0, _02042BA8 ; =0x000003D9
	mov r1, #3
	str r0, [sp, #4]
	lsl r0, r7, #0x18
	str r4, [sp, #8]
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	mov r0, #4
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r2, #0xa
	ldr r0, [r0, #8]
	mov r3, #5
	bl sub_0200F4A0
	add r5, #0x80
	str r0, [r6]
	ldr r0, [r5]
	add r1, r4, #0
	bl sub_020457D4
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02042BA8: .word 0x000003D9
	thumb_func_end sub_02042B1C

	thumb_func_start sub_02042BAC
sub_02042BAC: ; 0x02042BAC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r2, _02042C28 ; =0x000003D9
	ldr r0, [r0, #8]
	mov r1, #3
	mov r3, #0xb
	bl sub_0200E3DC
	mov r0, #0xb
	str r0, [sp]
	ldr r0, _02042C28 ; =0x000003D9
	add r5, #0x80
	str r0, [sp, #4]
	str r6, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r0, [r5]
	mov r1, #3
	ldr r0, [r0, #8]
	mov r2, #0xa
	mov r3, #5
	bl sub_0200F4F8
	str r0, [r4]
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02042C28: .word 0x000003D9
	thumb_func_end sub_02042BAC

	thumb_func_start sub_02042C2C
sub_02042C2C: ; 0x02042C2C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl sub_020402F0
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0]
	add r0, r1, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02042C2C

	thumb_func_start sub_02042C44
sub_02042C44: ; 0x02042C44
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl sub_020402F0
	ldr r0, [r0]
	mov r1, #2
	strb r1, [r0]
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02042C44

	thumb_func_start sub_02042C5C
sub_02042C5C: ; 0x02042C5C
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	str r0, [r4, #0x64]
	ldr r1, _02042C74 ; =sub_02042C78
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_02042C74: .word sub_02042C78
	thumb_func_end sub_02042C5C

	thumb_func_start sub_02042C78
sub_02042C78: ; 0x02042C78
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	ldr r1, [r5, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #3
	beq _02042CA4
	mov r0, #1
	pop {r3, r4, r5, pc}
_02042CA4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02042C78

	thumb_func_start sub_02042CA8
sub_02042CA8: ; 0x02042CA8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xa
	bl sub_020402F0
	ldr r6, _02042CDC ; =SDK_OVERLAY_OVY_26_ID
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #2
	bl HandleLoadOverlay
	ldr r1, [r4]
	cmp r1, #0
	beq _02042CD0
	add r5, #0x80
	ldr r0, [r5]
	bl ov26_022599D8
_02042CD0:
	add r0, r6, #0
	bl UnloadOverlayByID
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02042CDC: .word SDK_OVERLAY_OVY_26_ID
	thumb_func_end sub_02042CA8

	thumb_func_start sub_02042CE0
sub_02042CE0: ; 0x02042CE0
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r1, r0, #0
	ldr r0, [r4, #0x74]
	bl sub_020961D8
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02042CE0

	thumb_func_start sub_02042D00
sub_02042D00: ; 0x02042D00
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	ldr r2, [r5]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, [r2, #0x10]
	ldr r2, [r2, #0xc]
	add r3, r4, #0
	bl sub_0203F198
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02042D00

	thumb_func_start sub_02042D58
sub_02042D58: ; 0x02042D58
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r1, r5, #0
	add r1, #0x80
	add r6, r0, #0
	ldr r1, [r1]
	mov r0, #0xb
	mov r2, #0
	add r3, r7, #0
	bl sub_02042A60
	str r0, [r4]
	cmp r0, #0
	bne _02042DA0
	mov r0, #1
	strh r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02042DA0:
	mov r0, #0
	strh r0, [r6]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [r4]
	bl sub_0203F204
	ldr r1, _02042DBC ; =sub_02042974
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02042DBC: .word sub_02042974
	thumb_func_end sub_02042D58

	thumb_func_start sub_02042DC0
sub_02042DC0: ; 0x02042DC0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	mov r1, #0
	add r2, r6, #0
	bl sub_02042A30
	cmp r0, #1
	bne _02042DF4
	mov r0, #1
	strh r0, [r4]
	pop {r4, r5, r6, pc}
_02042DF4:
	mov r0, #0
	strh r0, [r4]
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02042DC0

	thumb_func_start sub_02042DFC
sub_02042DFC: ; 0x02042DFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202C028
	mov r1, #0
	bl sub_0202B9B8
	add r1, r4, #0
	bl sub_0202BD7C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02042DFC

	thumb_func_start sub_02042E2C
sub_02042E2C: ; 0x02042E2C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203F964
	ldr r1, _02042E44 ; =sub_020429F8
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02042E44: .word sub_020429F8
	thumb_func_end sub_02042E2C

	thumb_func_start sub_02042E48
sub_02042E48: ; 0x02042E48
	push {r3, lr}
	add r1, r0, #0
	ldr r0, [r1, #0x74]
	add r1, #0x80
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	bl sub_0206B910
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02042E48

	thumb_func_start sub_02042E5C
sub_02042E5C: ; 0x02042E5C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #1
	bl Radio_new
	str r0, [r4]
	ldr r1, _02042E88 ; =sub_02042974
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02042E88: .word sub_02042974
	thumb_func_end sub_02042E5C

	thumb_func_start sub_02042E8C
sub_02042E8C: ; 0x02042E8C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	str r0, [r6]
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [sp]
	strh r7, [r4, #4]
	strh r0, [r4, #6]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	str r0, [r4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [r6]
	bl sub_0203F0A8
	ldr r1, _02042F00 ; =sub_02042974
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02042F00: .word sub_02042974
	thumb_func_end sub_02042E8C

	thumb_func_start sub_02042F04
sub_02042F04: ; 0x02042F04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeap
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	str r1, [r0]
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	str r1, [r0, #8]
	add r1, r5, #0
	add r1, #0x80
	ldr r2, [r1]
	mov r1, #0x43
	lsl r1, r1, #2
	add r1, r2, r1
	str r1, [r0, #4]
	str r0, [r4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [r4]
	bl sub_0203E868
	ldr r1, _02042F58 ; =sub_020429A0
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02042F58: .word sub_020429A0
	thumb_func_end sub_02042F04

	thumb_func_start sub_02042F5C
sub_02042F5C: ; 0x02042F5C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203F4C8
	ldr r1, _02042F74 ; =sub_020429F8
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02042F74: .word sub_020429F8
	thumb_func_end sub_02042F5C

	thumb_func_start sub_02042F78
sub_02042F78: ; 0x02042F78
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069464
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02042F78

	thumb_func_start sub_02042F88
sub_02042F88: ; 0x02042F88
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl sub_0203F4A8
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02042F88

	thumb_func_start sub_02042F98
sub_02042F98: ; 0x02042F98
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203F4F8
	str r0, [r4]
	ldr r1, _02042FC0 ; =sub_02042974
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02042FC0: .word sub_02042974
	thumb_func_end sub_02042F98

	thumb_func_start sub_02042FC4
sub_02042FC4: ; 0x02042FC4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x10]
	bl Special_EnterHallOfFame
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02042FC4

	thumb_func_start sub_02042FDC
sub_02042FDC: ; 0x02042FDC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203F984
	str r0, [r4]
	ldr r1, _02043004 ; =sub_02042974
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02043004: .word sub_02042974
	thumb_func_end sub_02042FDC

	thumb_func_start sub_02043008
sub_02043008: ; 0x02043008
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #4
	ldr r0, [r0, #0xc]
	add r2, sp, #0
	bl LoadHallOfFame
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	mov r1, #0
	strh r1, [r0]
	ldr r1, [sp]
	cmp r1, #2
	bne _0204303A
	mov r1, #1
	strh r1, [r0]
_0204303A:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02043008

	thumb_func_start sub_02043044
sub_02043044: ; 0x02043044
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0203A05C
	cmp r0, #0
	beq _02043098
	mov r0, #1
	strh r0, [r4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r6, #0
	bl sub_0203F844
	ldr r1, _020430A0 ; =sub_020429F8
	add r0, r5, #0
	bl SetupNativeScript
	b _0204309C
_02043098:
	mov r0, #0
	strh r0, [r4]
_0204309C:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020430A0: .word sub_020429F8
	thumb_func_end sub_02043044

	thumb_func_start sub_020430A4
sub_020430A4: ; 0x020430A4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r1, r0, #0
	ldr r0, [r4, #0x74]
	bl sub_02078B78
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_020430A4

	thumb_func_start sub_020430C4
sub_020430C4: ; 0x020430C4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0209600C
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020430C4

	thumb_func_start sub_020430D4
sub_020430D4: ; 0x020430D4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r1, [r5, #8]
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r0, [r1]
	cmp r0, #0
	beq _020430E8
	mov r0, #1
	b _020430EA
_020430E8:
	mov r0, #0
_020430EA:
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r6, r0, #0
	ldr r0, [r6]
	cmp r0, #0
	beq _02043106
	bl GF_AssertFail
_02043106:
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_0203E460
	str r0, [r6]
	ldr r1, _02043120 ; =sub_020429F8
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02043120: .word sub_020429F8
	thumb_func_end sub_020430D4

	thumb_func_start sub_02043124
sub_02043124: ; 0x02043124
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _02043150
	bl GF_AssertFail
_02043150:
	ldr r0, [r4]
	bl sub_0203E4CC
	strh r0, [r5]
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02043124

	thumb_func_start sub_02043164
sub_02043164: ; 0x02043164
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r1, [r5, #8]
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r0, [r1]
	cmp r0, #0
	beq _02043178
	mov r0, #1
	b _0204317A
_02043178:
	mov r0, #0
_0204317A:
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r6, r0, #0
	ldr r0, [r6]
	cmp r0, #0
	beq _02043196
	bl GF_AssertFail
_02043196:
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_0203E460
	str r0, [r6]
	ldr r1, _020431B0 ; =sub_02042974
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020431B0: .word sub_02042974
	thumb_func_end sub_02043164

	thumb_func_start sub_020431B4
sub_020431B4: ; 0x020431B4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #0x74]
	add r2, r1, #0
	mov r3, #7
	bl sub_0203F6E0
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_020431B4

	thumb_func_start sub_020431E4
sub_020431E4: ; 0x020431E4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #0x74]
	mov r1, #3
	mov r3, #7
	bl sub_0203F6E0
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_020431E4

	thumb_func_start sub_02043214
sub_02043214: ; 0x02043214
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	cmp r6, #0xff
	bne _0204324E
	add r0, r5, #0
	bl sub_0206DB28
	ldrb r1, [r0, #0x17]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	bne _0204324A
	add sp, #0x34
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0204324A:
	ldr r5, [r0, #0x10]
	b _0204325C
_0204324E:
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r5, r0, #0
_0204325C:
	add r0, r5, #0
	mov r1, #0x75
	add r2, sp, #0xc
	bl GetMonData
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	str r6, [sp]
	add r0, sp, #0xc
	str r0, [sp, #4]
	str r7, [sp, #8]
	ldr r0, [r4, #0x74]
	mov r1, #1
	mov r3, #0xa
	bl sub_0203F6E0
	mov r0, #1
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02043214

	thumb_func_start sub_020432A0
sub_020432A0: ; 0x020432A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0209707C
	str r0, [r4]
	ldr r1, _020432C8 ; =sub_020429D4
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020432C8: .word sub_020429D4
	thumb_func_end sub_020432A0

	thumb_func_start sub_020432CC
sub_020432CC: ; 0x020432CC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	bl sub_0205A894
	add r5, r0, #0
	bl sub_02029084
	cmp r5, r0
	bne _020432F2
	mov r0, #0
	b _020432F4
_020432F2:
	mov r0, #1
_020432F4:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020432CC

	thumb_func_start sub_020432FC
sub_020432FC: ; 0x020432FC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r3, r0, #0
	ldr r0, _02043358 ; =0x0000FFFF
	add r5, #0x80
	strh r0, [r3]
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x10]
	add r2, r6, #0
	bl sub_0203E960
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02043358: .word 0x0000FFFF
	thumb_func_end sub_020432FC

	thumb_func_start sub_0204335C
sub_0204335C: ; 0x0204335C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	ldr r1, _020433B8 ; =0x0000FFFF
	add r5, #0x80
	strh r1, [r4]
	strh r1, [r0]
	str r0, [sp]
	ldr r0, [r5]
	mov r1, #1
	ldr r0, [r0, #0x10]
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0203E960
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_020433B8: .word 0x0000FFFF
	thumb_func_end sub_0204335C

	thumb_func_start sub_020433BC
sub_020433BC: ; 0x020433BC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl sub_0200C528
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020433BC

	thumb_func_start sub_02043400
sub_02043400: ; 0x02043400
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	str r4, [sp]
	add r3, r0, #0
	str r6, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r1, r7, #0
	add r2, r7, #0
	bl sub_0200FA24
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02043400

	thumb_func_start sub_02043448
sub_02043448: ; 0x02043448
	push {r3, lr}
	ldr r1, _02043454 ; =sub_02043458
	bl SetupNativeScript
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02043454: .word sub_02043458
	thumb_func_end sub_02043448

	thumb_func_start sub_02043458
sub_02043458: ; 0x02043458
	push {r3, lr}
	bl sub_0200FB5C
	cmp r0, #1
	bne _02043466
	mov r0, #1
	pop {r3, pc}
_02043466:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02043458

	thumb_func_start sub_0204346C
sub_0204346C: ; 0x0204346C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r4, [sp]
	str r0, [sp, #4]
	mov r2, #0
	ldr r0, [r5, #0x74]
	add r1, r6, #0
	mvn r2, r2
	add r3, r7, #0
	bl sub_0205388C
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0204346C

	thumb_func_start sub_020434DC
sub_020434DC: ; 0x020434DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	str r4, [sp]
	mov r2, #0
	add r5, #0x80
	str r0, [sp, #4]
	ldr r0, [r5]
	add r1, r6, #0
	ldr r0, [r0, #0x10]
	mvn r2, r2
	add r3, r7, #0
	bl sub_0205412C
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020434DC

	thumb_func_start sub_02043538
sub_02043538: ; 0x02043538
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl sub_02054190
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02043538

	thumb_func_start sub_02043548
sub_02043548: ; 0x02043548
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	bl sub_0203B960
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	ldr r1, [r5]
	strh r1, [r0]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02043548

	thumb_func_start sub_02043574
sub_02043574: ; 0x02043574
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	ldr r1, [r4]
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	strh r1, [r0]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02043574

	thumb_func_start sub_02043598
sub_02043598: ; 0x02043598
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4]
	add r0, r5, #0
	bl MapHeader_MapIsPokemonCenterSecondFloor
	cmp r0, #1
	bne _020435D4
	mov r0, #1
	strh r0, [r4]
	b _020435E2
_020435D4:
	add r0, r5, #0
	bl sub_0203B5FC
	cmp r0, #1
	bne _020435E2
	mov r0, #2
	strh r0, [r4]
_020435E2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02043598

	thumb_func_start sub_020435E8
sub_020435E8: ; 0x020435E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl sub_0205C654
	add r1, r0, #0
	ldr r0, [r5, #0x74]
	add r2, r4, #0
	bl ov01_021F2590
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020435E8

	thumb_func_start sub_02043618
sub_02043618: ; 0x02043618
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl sub_0205C654
	add r1, r0, #0
	ldr r0, [r5, #0x74]
	add r2, r4, #0
	bl ov01_021F2068
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02043618

	thumb_func_start sub_02043648
sub_02043648: ; 0x02043648
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl sub_0205C654
	add r1, r0, #0
	ldr r0, [r5, #0x74]
	add r2, r4, #0
	bl ov01_021F2908
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02043648

	thumb_func_start sub_02043678
sub_02043678: ; 0x02043678
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	mov r2, #1
	str r2, [sp, #4]
	add r5, #0x80
	ldr r0, [r5]
	add r1, r4, #0
	sub r2, r2, #2
	add r3, r6, #0
	bl sub_020538C0
	mov r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02043678

	thumb_func_start sub_020436C4
sub_020436C4: ; 0x020436C4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	add r5, r0, #0
	mov r1, #0xc
	bl sub_0203B98C
	add r0, r5, #0
	bl sub_0203B984
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl ov01_021EB2B8
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020436C4

	thumb_func_start sub_020436F4
sub_020436F4: ; 0x020436F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl sub_0205C654
	add r1, r0, #0
	ldr r0, [r5, #0x74]
	add r2, r4, #0
	bl ov01_021F2DA4
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020436F4

	thumb_func_start sub_02043724
sub_02043724: ; 0x02043724
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl sub_0205C724
	add r3, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	add r2, r6, #0
	bl ov02_02249458
	str r0, [r4]
	ldr r1, _02043788 ; =sub_0204378C
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_02043788: .word sub_0204378C
	thumb_func_end sub_02043724

	thumb_func_start sub_0204378C
sub_0204378C: ; 0x0204378C
	push {r4, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl sub_020402F0
	add r4, r0, #0
	ldr r0, [r4]
	bl ov02_0224953C
	cmp r0, #1
	bne _020437AE
	ldr r0, [r4]
	bl ov02_02249548
	mov r0, #1
	pop {r4, pc}
_020437AE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0204378C

	thumb_func_start sub_020437B4
sub_020437B4: ; 0x020437B4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x40]
	bl sub_0205C700
	cmp r0, #1
	bne _020437DC
	mov r0, #1
	b _020437DE
_020437DC:
	mov r0, #0
_020437DE:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020437B4

	thumb_func_start sub_020437E4
sub_020437E4: ; 0x020437E4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	add r0, r1, #1
	str r0, [r4, #8]
	ldrb r0, [r1]
	cmp r0, #1
	bne _02043828
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, _0204386C ; =0x000003F5
	bl sub_02054F28
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, _0204386C ; =0x000003F5
	mov r2, #1
	bl sub_02054FDC
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #2
	ldr r0, [r0, #0x40]
	bl ov01_021F1AFC
	add r4, #0x80
	ldr r0, [r4]
	ldr r0, [r0, #0x40]
	bl ov01_021F1B04
	b _02043868
_02043828:
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #1
	ldr r0, [r0, #0x40]
	bl ov01_021F1AFC
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl ov01_021F1B04
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl sub_02054F28
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	bl sub_02054F60
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	mov r2, #1
	bl sub_02054FDC
_02043868:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0204386C: .word 0x000003F5
	thumb_func_end sub_020437E4

	thumb_func_start sub_02043870
sub_02043870: ; 0x02043870
	push {r3, lr}
	add r0, #0x80
	mov r1, #0x13
	ldr r0, [r0]
	lsl r1, r1, #6
	bl sub_02054F28
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02043870

	thumb_func_start sub_02043884
sub_02043884: ; 0x02043884
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldrb r1, [r2]
	ldr r0, [r0, #0x40]
	bl sub_0205CAA4
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02043884

	thumb_func_start sub_0204389C
sub_0204389C: ; 0x0204389C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x40]
	bl sub_0205C700
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204389C

	thumb_func_start sub_020438C4
sub_020438C4: ; 0x020438C4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x40]
	bl sub_0205C710
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_020438C4

	thumb_func_start sub_020438DC
sub_020438DC: ; 0x020438DC
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl ov01_021F1B04
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_020438DC

	thumb_func_start sub_020438EC
sub_020438EC: ; 0x020438EC
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0202D9C4
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #2
	bl sub_0202D9A8
	add r1, r6, #0
	add r2, r4, #0
	bl sub_02097F9C
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020438EC

	thumb_func_start sub_02043938
sub_02043938: ; 0x02043938
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066AF0
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02043938

	thumb_func_start sub_02043964
sub_02043964: ; 0x02043964
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	add r1, r4, #0
	bl sub_02066AE0
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02043964

	thumb_func_start sub_02043990
sub_02043990: ; 0x02043990
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #8
	add r0, r4, #0
	bl sub_020402F0
	add r0, r4, #0
	mov r1, #0x11
	bl sub_020402F0
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #3
	bl sub_020402F0
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	ldr r0, [sp]
	ldr r2, [r6]
	mov r3, #0xb
	bl GetTrainerMessageByIdPair
	add r0, r4, #0
	mov r1, #1
	bl sub_020402F0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r4, #0
	mov r1, #1
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r2, r0, #0
	ldr r1, [r6]
	add r0, r4, #0
	mov r3, #1
	bl sub_0205B5B4
	strb r0, [r7]
	ldr r1, _02043A24 ; =0x021EF349
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02043A24: .word 0x021EF349
	thumb_func_end sub_02043990

	thumb_func_start sub_02043A28
sub_02043A28: ; 0x02043A28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #4]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	ldr r2, [sp]
	ldr r3, [sp, #4]
	add r0, r4, #0
	add r1, r7, #0
	bl ov03_02255BB0
	ldr r1, _02043A94 ; =sub_02043A98
	add r0, r5, #0
	str r6, [r5, #0x64]
	bl SetupNativeScript
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02043A94: .word sub_02043A98
	thumb_func_end sub_02043A28

	thumb_func_start sub_02043A98
sub_02043A98: ; 0x02043A98
	push {r4, lr}
	add r1, r0, #0
	ldr r1, [r1, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r4, r0, #0
	bl ov03_02255BFC
	cmp r0, #0
	bne _02043AB8
	mov r0, #0
	pop {r4, pc}
_02043AB8:
	strh r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02043A98

	thumb_func_start sub_02043AC0
sub_02043AC0: ; 0x02043AC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #4]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	ldr r2, [sp]
	ldr r3, [sp, #4]
	add r0, r4, #0
	add r1, r7, #0
	bl ov03_02255C18
	ldr r1, _02043B2C ; =sub_02043B30
	add r0, r5, #0
	str r6, [r5, #0x64]
	bl SetupNativeScript
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02043B2C: .word sub_02043B30
	thumb_func_end sub_02043AC0

	thumb_func_start sub_02043B30
sub_02043B30: ; 0x02043B30
	push {r4, lr}
	add r1, r0, #0
	ldr r1, [r1, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r4, r0, #0
	bl ov03_02255C64
	cmp r0, #0
	bne _02043B50
	mov r0, #0
	pop {r4, pc}
_02043B50:
	strh r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02043B30

	thumb_func_start sub_02043B58
sub_02043B58: ; 0x02043B58
	push {r3, lr}
	bl ScriptReadHalfword
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02043B58

	thumb_func_start sub_02043B64
sub_02043B64: ; 0x02043B64
	push {r3, lr}
	bl ScriptReadHalfword
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02043B64

	thumb_func_start sub_02043B70
sub_02043B70: ; 0x02043B70
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r6, r0, #0
	add r5, #0x80
	ldr r4, [r6]
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x10]
	add r1, #0x30
	mov r2, #5
	bl sub_02051428
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	str r0, [r6]
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02043B70

	thumb_func_start sub_02043BA0
sub_02043BA0: ; 0x02043BA0
	mov r0, #1
	bx lr
	thumb_func_end sub_02043BA0

	thumb_func_start sub_02043BA4
sub_02043BA4: ; 0x02043BA4
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #4]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #8]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0xc]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, #0x80
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	add r1, sp, #0
	bl sub_0203B96C
	mov r0, #0
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02043BA4

	thumb_func_start sub_02043C24
sub_02043C24: ; 0x02043C24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	bl sub_0203B968
	ldr r0, [r0]
	bl ov01_021EE81C
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02043C24

	thumb_func_start sub_02043C54
sub_02043C54: ; 0x02043C54
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	str r0, [sp, #8]
	bl sub_020402F0
	add r7, r0, #0
	ldr r0, [r5, #8]
	add r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0]
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	ldr r1, [r7]
	ldr r3, [sp, #0xc]
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	add r1, r6, #0
	add r2, r4, #0
	bl ov01_021EE664
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02043C54

	thumb_func_start sub_02043CB4
sub_02043CB4: ; 0x02043CB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02029EF4
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02043CB4

	thumb_func_start sub_02043CE4
sub_02043CE4: ; 0x02043CE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02029EA0
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02043CE4

	thumb_func_start sub_02043D14
sub_02043D14: ; 0x02043D14
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02029E48
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02043D14

	thumb_func_start sub_02043D44
sub_02043D44: ; 0x02043D44
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02029E0C
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02043D44

	thumb_func_start sub_02043D74
sub_02043D74: ; 0x02043D74
	mov r0, #0
	bx lr
	thumb_func_end sub_02043D74

	thumb_func_start sub_02043D78
sub_02043D78: ; 0x02043D78
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	ldr r1, [r5, #8]
	str r0, [sp]
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	cmp r6, #0
	bne _02043DE6
	add r0, r7, #0
	bl sub_02029FAC
	add r6, r0, #0
	ldr r0, [sp]
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	add r2, r5, #0
	bl sub_0205BBD0
	b _02043E02
_02043DE6:
	add r0, r7, #0
	bl sub_02029F74
	add r6, r0, #0
	ldr r0, [sp]
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	add r2, r5, #0
	bl sub_0205BC78
_02043E02:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02043D78

	thumb_func_start sub_02043E08
sub_02043E08: ; 0x02043E08
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x18
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	lsl r2, r2, #0x18
	ldr r0, [r5, #0x74]
	add r1, r6, #0
	lsr r2, r2, #0x18
	add r3, r4, #0
	bl sub_02051020
	mov r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02043E08

	thumb_func_start sub_02043E5C
sub_02043E5C: ; 0x02043E5C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x18
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	ldr r1, [r5, #8]
	lsl r2, r2, #0x18
	add r0, r1, #1
	str r0, [r5, #8]
	mov r0, #1
	str r0, [sp]
	ldrb r0, [r1]
	add r1, r6, #0
	lsr r2, r2, #0x18
	str r0, [sp, #4]
	ldr r0, [r5, #0x74]
	add r3, r4, #0
	bl sub_02051020
	mov r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02043E5C

	thumb_func_start sub_02043EB8
sub_02043EB8: ; 0x02043EB8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x18
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	lsl r2, r2, #0x18
	ldr r0, [r5, #0x74]
	add r1, r6, #0
	lsr r2, r2, #0x18
	add r3, r4, #0
	bl sub_02051090
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02043EB8

	thumb_func_start sub_02043F0C
sub_02043F0C: ; 0x02043F0C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	lsl r2, r2, #0x18
	ldr r0, [r5, #0x74]
	add r1, r4, #0
	lsr r2, r2, #0x18
	bl sub_02051228
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02043F0C

	thumb_func_start sub_02043F48
sub_02043F48: ; 0x02043F48
	push {r3, lr}
	ldr r0, [r0, #0x74]
	bl sub_02051334
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02043F48

	thumb_func_start sub_02043F54
sub_02043F54: ; 0x02043F54
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203F818
	ldr r1, _02043F6C ; =sub_020429F8
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02043F6C: .word sub_020429F8
	thumb_func_end sub_02043F54

	thumb_func_start sub_02043F70
sub_02043F70: ; 0x02043F70
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r5, [r1, #0xc]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02027500
	cmp r0, #0
	beq _02043F9C
	mov r0, #0
	strh r0, [r4]
	b _02043FC0
_02043F9C:
	add r0, r5, #0
	bl sub_020274E0
	cmp r0, #0
	bne _02043FAC
	mov r0, #1
	strh r0, [r4]
	b _02043FC0
_02043FAC:
	add r0, r5, #0
	bl sub_02027520
	cmp r0, #0
	beq _02043FBC
	mov r0, #2
	strh r0, [r4]
	b _02043FC0
_02043FBC:
	mov r0, #3
	strh r0, [r4]
_02043FC0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02043F70

	thumb_func_start sub_02043FC4
sub_02043FC4: ; 0x02043FC4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ov01_021F43E8
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02043FC4

	thumb_func_start sub_02043FEC
sub_02043FEC: ; 0x02043FEC
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02027FFC
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02043FEC

	thumb_func_start sub_02043FFC
sub_02043FFC: ; 0x02043FFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_020274E8
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02043FFC

	thumb_func_start sub_02044024
sub_02044024: ; 0x02044024
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [r4, #0x64]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02037AC0
	ldr r1, _02044050 ; =sub_02044054
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_02044050: .word sub_02044054
	thumb_func_end sub_02044024

	thumb_func_start sub_02044054
sub_02044054: ; 0x02044054
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037454
	cmp r0, #2
	bge _02044064
	mov r0, #1
	pop {r4, pc}
_02044064:
	ldr r0, [r4, #0x64]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02037B38
	pop {r4, pc}
	thumb_func_end sub_02044054

	thumb_func_start sub_02044070
sub_02044070: ; 0x02044070
	push {r3, lr}
	bl sub_02037BEC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044070

	thumb_func_start sub_0204407C
sub_0204407C: ; 0x0204407C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_0205A6AC
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204407C

	thumb_func_start sub_020440AC
sub_020440AC: ; 0x020440AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	add r1, r0, #0
	add r5, #0x80
	ldr r0, [r5]
	ldr r1, [r1]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205A9A0
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020440AC

	thumb_func_start sub_020440E4
sub_020440E4: ; 0x020440E4
	push {r4, lr}
	bl ScriptReadHalfword
	add r4, r0, #0
	cmp r4, #5
	beq _02044104
	cmp r4, #7
	beq _02044104
	cmp r4, #9
	beq _02044104
	cmp r4, #6
	beq _02044104
	cmp r4, #0xc
	beq _02044104
	cmp r4, #0xa
	bne _0204410A
_02044104:
	bl sub_020380F4
	b _02044112
_0204410A:
	cmp r4, #0xb
	bne _02044112
	bl sub_02038104
_02044112:
	bl sub_0203769C
	cmp r0, #0
	bne _02044120
	add r0, r4, #0
	bl sub_0205A904
_02044120:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_020440E4

	thumb_func_start sub_02044124
sub_02044124: ; 0x02044124
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xa
	bl sub_020402F0
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r5, #0x80
	str r0, [sp, #4]
	ldr r0, [r5]
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_02015C28
	add r5, r0, #0
	cmp r4, #0
	bne _0204417A
	ldr r0, [r7]
	bl sub_0205F24C
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	b _0204417C
_0204417A:
	mov r2, #0
_0204417C:
	str r5, [sp]
	ldr r0, [r6]
	ldr r3, [sp, #4]
	add r1, r4, #0
	bl sub_0205AA9C
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02044124

	thumb_func_start sub_02044190
sub_02044190: ; 0x02044190
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02091574
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044190

	thumb_func_start sub_020441A0
sub_020441A0: ; 0x020441A0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0x84
	ldr r0, [r0]
	bl sub_0205AD0C
	bl sub_02037FF0
	ldr r1, _020441C0 ; =sub_020441C4
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_020441C0: .word sub_020441C4
	thumb_func_end sub_020441A0

	thumb_func_start sub_020441C4
sub_020441C4: ; 0x020441C4
	push {r3, lr}
	bl sub_02037454
	cmp r0, #2
	bge _020441D2
	mov r0, #1
	pop {r3, pc}
_020441D2:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020441C4

	thumb_func_start sub_020441D8
sub_020441D8: ; 0x020441D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xa
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	add r7, r0, #0
	ldr r0, [r4]
	bl sub_0205F24C
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	ldr r2, [sp]
	add r0, #0x80
	ldr r0, [r0]
	ldr r3, [r7]
	bl sub_0205A750
	strh r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020441D8

	thumb_func_start sub_02044230
sub_02044230: ; 0x02044230
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205A4D8
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0
	beq _0204426C
	add r5, #0x80
	ldr r0, [r5]
	mov r1, #0x14
	bl sub_020402F0
	ldr r0, [r0]
	bl FreeToHeap
_0204426C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02044230

	thumb_func_start sub_02044270
sub_02044270: ; 0x02044270
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0xa
	add r0, r5, #0
	bl sub_020402F0
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r6]
	bl sub_0205F24C
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl sub_0205A200
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02044270

	thumb_func_start sub_020442AC
sub_020442AC: ; 0x020442AC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0xa
	add r0, r5, #0
	bl sub_020402F0
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r6]
	bl sub_0205F24C
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	add r2, r7, #0
	bl sub_0205A284
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020442AC

	thumb_func_start sub_020442FC
sub_020442FC: ; 0x020442FC
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	str r0, [r4, #0x64]
	ldr r1, _02044314 ; =sub_02044318
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_02044314: .word sub_02044318
	thumb_func_end sub_020442FC

	thumb_func_start sub_02044318
sub_02044318: ; 0x02044318
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205A358
	ldr r1, [r5, #0x64]
	add r4, r0, #0
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	cmp r4, #0
	bne _02044340
	mov r0, #0
	pop {r4, r5, r6, pc}
_02044340:
	strh r4, [r0]
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02044318

	thumb_func_start sub_02044348
sub_02044348: ; 0x02044348
	push {r3, lr}
	add r0, #0x80
	ldr r1, [r0]
	ldr r0, [r1, #0x3c]
	add r1, #0x84
	ldr r1, [r1]
	bl sub_0205B27C
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02044348

	thumb_func_start sub_0204435C
sub_0204435C: ; 0x0204435C
	push {r3, lr}
	mov r0, #4
	bl sub_0205A904
	bl sub_020380CC
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0204435C

	thumb_func_start sub_0204436C
sub_0204436C: ; 0x0204436C
	push {r3, lr}
	bl sub_02038104
	bl sub_02037FF0
	mov r0, #0
	bl sub_0205A904
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0204436C

	thumb_func_start sub_02044380
sub_02044380: ; 0x02044380
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r4, #0x80
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl sub_0205A3B0
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02044380

	thumb_func_start sub_020443BC
sub_020443BC: ; 0x020443BC
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	str r0, [r4, #0x64]
	ldr r1, _020443D4 ; =sub_020443D8
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_020443D4: .word sub_020443D8
	thumb_func_end sub_020443BC

	thumb_func_start sub_020443D8
sub_020443D8: ; 0x020443D8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205A35C
	cmp r0, #1
	blo _02044410
	add r5, #0x80
	strh r0, [r4]
	ldr r0, [r5]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205ABB0
	mov r0, #1
	pop {r3, r4, r5, pc}
_02044410:
	mov r0, #0
	strh r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020443D8

	thumb_func_start sub_02044418
sub_02044418: ; 0x02044418
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	str r0, [r4, #0x64]
	ldr r1, _02044430 ; =sub_02044434
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_02044430: .word sub_02044434
	thumb_func_end sub_02044418

	thumb_func_start sub_02044434
sub_02044434: ; 0x02044434
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205A39C
	ldr r1, _0204447C ; =gMain
	ldr r2, [r1, #0x48]
	mov r1, #2
	tst r1, r2
	beq _0204446E
	add r5, #0x80
	ldr r0, [r5]
	mov r1, #8
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205A47C
_0204446E:
	cmp r0, #0
	beq _02044478
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_02044478:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0204447C: .word gMain
	thumb_func_end sub_02044434

	thumb_func_start sub_02044480
sub_02044480: ; 0x02044480
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl sub_02054030
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02044480

	thumb_func_start sub_02044490
sub_02044490: ; 0x02044490
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #0x10
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl PlayerProfile_GetTrainerID
	add r6, r0, #0
	add r0, r5, #0
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	ldr r2, [r4]
	add r0, r6, #0
	bl sub_0205B3DC
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02044490

	thumb_func_start sub_020444CC
sub_020444CC: ; 0x020444CC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl PlayerProfile_GetTrainerID
	add r6, r0, #0
	add r0, r5, #0
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	add r0, r6, #0
	add r2, r7, #0
	bl sub_0205B418
	strh r0, [r4]
	add r0, r5, #0
	bl PlayerProfile_GetTrainerGender
	ldrh r1, [r4]
	mov r2, #2
	bl sub_0205B46C
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020444CC

	thumb_func_start sub_02044534
sub_02044534: ; 0x02044534
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl PlayerProfile_GetTrainerID
	add r6, r0, #0
	add r0, r5, #0
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	add r0, r6, #0
	add r2, r7, #0
	bl sub_0205B418
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02044534

	thumb_func_start sub_0204458C
sub_0204458C: ; 0x0204458C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl PlayerProfile_SetAvatar
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204458C

	thumb_func_start sub_020445C0
sub_020445C0: ; 0x020445C0
	push {r3, lr}
	ldr r0, [r0, #0x74]
	bl sub_0205297C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020445C0

	thumb_func_start sub_020445CC
sub_020445CC: ; 0x020445CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	add r1, r4, #0
	bl sub_0203B99C
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020445CC

	thumb_func_start sub_020445F8
sub_020445F8: ; 0x020445F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020445F8

	thumb_func_start sub_02044628
sub_02044628: ; 0x02044628
	push {r3, lr}
	ldr r0, [r0, #0x74]
	bl sub_0205064C
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	bl HealParty
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044628

	thumb_func_start sub_02044640
sub_02044640: ; 0x02044640
	push {r4, lr}
	add r4, r0, #0
	bl sub_02058284
	ldr r1, _02044654 ; =sub_02044658
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02044654: .word sub_02044658
	thumb_func_end sub_02044640

	thumb_func_start sub_02044658
sub_02044658: ; 0x02044658
	push {r3, lr}
	bl sub_02037D78
	cmp r0, #1
	beq _0204466E
	bl sub_02035650
	cmp r0, #1
	beq _0204466E
	mov r0, #1
	pop {r3, pc}
_0204466E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044658

	thumb_func_start sub_02044674
sub_02044674: ; 0x02044674
	push {r4, lr}
	add r4, r0, #0
	bl sub_020582A8
	ldr r1, _02044688 ; =sub_02044658
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02044688: .word sub_02044658
	thumb_func_end sub_02044674

	thumb_func_start sub_0204468C
sub_0204468C: ; 0x0204468C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02058190
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0204468C

	thumb_func_start sub_0204469C
sub_0204469C: ; 0x0204469C
	push {r3, lr}
	bl ScriptReadHalfword
	bl sub_02057F28
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0204469C

	thumb_func_start sub_020446AC
sub_020446AC: ; 0x020446AC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_Bag_get
	add r1, r6, #0
	bl sub_020784C4
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020446AC

	thumb_func_start sub_020446EC
sub_020446EC: ; 0x020446EC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r3, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0203B75C
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020446EC

	thumb_func_start sub_0204473C
sub_0204473C: ; 0x0204473C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #4]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #8]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	add r1, r6, #0
	ldr r0, [r0, #0x3c]
	bl sub_0205EE60
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r5, r0, #0
	add r1, r7, #0
	str r4, [sp]
	bl sub_0205FC2C
	add r0, r5, #0
	bl sub_02061070
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204473C

	thumb_func_start sub_020447CC
sub_020447CC: ; 0x020447CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	bl sub_0203B7C4
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020447CC

	thumb_func_start sub_02044804
sub_02044804: ; 0x02044804
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	bl sub_0203B794
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02044804

	thumb_func_start sub_0204483C
sub_0204483C: ; 0x0204483C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r3, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0203B7F4
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0204483C

	thumb_func_start sub_0204488C
sub_0204488C: ; 0x0204488C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r3, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0203B80C
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0204488C

	thumb_func_start sub_020448DC
sub_020448DC: ; 0x020448DC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	add r1, r6, #0
	ldr r0, [r0, #0x3c]
	bl sub_0205EE60
	add r5, r0, #0
	bne _0204491A
	bl GF_AssertFail
_0204491A:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021F9408
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020448DC

	thumb_func_start sub_02044928
sub_02044928: ; 0x02044928
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xc
	bl sub_020402F0
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	ldr r1, [r5]
	cmp r1, #0
	beq _02044950
	strh r0, [r1]
_02044950:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02044928

	thumb_func_start sub_02044954
sub_02044954: ; 0x02044954
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	lsl r1, r4, #5
	ldr r3, [r5, #8]
	add r2, r0, #0
	add r0, r3, #1
	str r0, [r5, #8]
	add r5, #0x80
	lsl r4, r6, #5
	ldrb r3, [r3]
	ldr r0, [r5]
	add r1, r7, r1
	add r2, r2, r4
	bl ov01_021E9AE8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02044954

	thumb_func_start sub_020449AC
sub_020449AC: ; 0x020449AC
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov01_021E9C00
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020449AC

	thumb_func_start sub_020449C4
sub_020449C4: ; 0x020449C4
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov01_021E9C20
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020449C4

	thumb_func_start sub_020449DC
sub_020449DC: ; 0x020449DC
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov01_021E9BB8
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020449DC

	thumb_func_start sub_020449F4
sub_020449F4: ; 0x020449F4
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov01_021E9BDC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020449F4

	thumb_func_start sub_02044A0C
sub_02044A0C: ; 0x02044A0C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068DE0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044A0C

	thumb_func_start sub_02044A1C
sub_02044A1C: ; 0x02044A1C
	push {r4, lr}
	add r0, #0x80
	ldr r4, [r0]
	add r0, r4, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	bl sub_0202AEBC
	cmp r0, #1
	beq _02044A38
	mov r0, #0
	pop {r4, pc}
_02044A38:
	add r0, r4, #0
	bl ov04_02254D98
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02044A1C

	thumb_func_start sub_02044A44
sub_02044A44: ; 0x02044A44
	push {r4, lr}
	add r0, #0x80
	ldr r4, [r0]
	add r0, r4, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	bl sub_0202AEBC
	cmp r0, #1
	beq _02044A60
	mov r0, #0
	pop {r4, pc}
_02044A60:
	add r0, r4, #0
	bl ov04_02254DD0
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02044A44

	thumb_func_start sub_02044A6C
sub_02044A6C: ; 0x02044A6C
	push {r3, r4, r5, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r4, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, r4, #0
	ldrb r5, [r2]
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	bl sub_0202AEBC
	cmp r0, #1
	beq _02044A92
	mov r0, #1
	pop {r3, r4, r5, pc}
_02044A92:
	cmp r5, #0
	beq _02044A9A
	mov r1, #0xa
	b _02044A9C
_02044A9A:
	mov r1, #0x1e
_02044A9C:
	add r0, r4, #0
	bl ov04_02254DE0
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02044A6C

	thumb_func_start sub_02044AA8
sub_02044AA8: ; 0x02044AA8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068E08
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044AA8

	thumb_func_start sub_02044AB8
sub_02044AB8: ; 0x02044AB8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ov04_02256058
	strh r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02044AB8

	thumb_func_start sub_02044AE0
sub_02044AE0: ; 0x02044AE0
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068E24
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044AE0

	thumb_func_start sub_02044AF0
sub_02044AF0: ; 0x02044AF0
	push {r4, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r4, [r1]
	ldr r1, [r0, #8]
	add r3, r1, #1
	str r3, [r0, #8]
	ldrb r1, [r1]
	add r2, r3, #1
	str r2, [r0, #8]
	ldrb r2, [r3]
	add r0, r4, #0
	bl ov04_0225640C
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02044AF0

	thumb_func_start sub_02044B10
sub_02044B10: ; 0x02044B10
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r2, [r4, #8]
	ldr r6, [r1]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r5, [r2]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl ov04_022563C4
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02044B10

	thumb_func_start sub_02044B40
sub_02044B40: ; 0x02044B40
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068E70
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044B40

	thumb_func_start sub_02044B50
sub_02044B50: ; 0x02044B50
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068EB0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044B50

	thumb_func_start sub_02044B60
sub_02044B60: ; 0x02044B60
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov04_02253ED4
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044B60

	thumb_func_start sub_02044B70
sub_02044B70: ; 0x02044B70
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068ED0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044B70

	thumb_func_start sub_02044B80
sub_02044B80: ; 0x02044B80
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	add r0, r3, #0
	bl ov04_02254568
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044B80

	thumb_func_start sub_02044B9C
sub_02044B9C: ; 0x02044B9C
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	add r0, r3, #0
	bl ov04_02254404
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044B9C

	thumb_func_start sub_02044BB8
sub_02044BB8: ; 0x02044BB8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068F00
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044BB8

	thumb_func_start sub_02044BC8
sub_02044BC8: ; 0x02044BC8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068F40
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044BC8

	thumb_func_start sub_02044BD8
sub_02044BD8: ; 0x02044BD8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02068F54
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044BD8

	thumb_func_start sub_02044BE8
sub_02044BE8: ; 0x02044BE8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	add r4, r0, #0
	bl sub_0205F914
	strh r0, [r6]
	add r0, r4, #0
	bl sub_0205F924
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r0, r1, #1
	strh r0, [r7]
	add r0, r4, #0
	bl sub_0205F934
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02044BE8

	thumb_func_start sub_02044C54
sub_02044C54: ; 0x02044C54
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203F9F4
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02044C54

	thumb_func_start sub_02044C64
sub_02044C64: ; 0x02044C64
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r1, r0, #0
	ldr r0, [r5, #0x3c]
	bl sub_0205EE60
	add r4, r0, #0
	bne _02044C8C
	bl GF_AssertFail
_02044C8C:
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F690
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02044C64

	thumb_func_start sub_02044C98
sub_02044C98: ; 0x02044C98
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r1, r0, #0
	ldr r0, [r5, #0x3c]
	bl sub_0205EE60
	add r4, r0, #0
	bne _02044CC0
	bl GF_AssertFail
_02044CC0:
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F690
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02044C98

	thumb_func_start sub_02044CCC
sub_02044CCC: ; 0x02044CCC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xb
	bl sub_0203F074
	str r0, [r4]
	ldr r1, _02044CF8 ; =sub_02042974
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02044CF8: .word sub_02042974
	thumb_func_end sub_02044CCC

	thumb_func_start sub_02044CFC
sub_02044CFC: ; 0x02044CFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl Sav2_Mailbox_get
	mov r1, #0
	bl Mailbox_CountMessages
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02044CFC

	thumb_func_start sub_02044D28
sub_02044D28: ; 0x02044D28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	add r5, #0x80
	lsl r1, r4, #0x18
	lsl r2, r2, #0x18
	ldr r0, [r5]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl sub_02097D3C
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02044D28

	thumb_func_start sub_02044D68
sub_02044D68: ; 0x02044D68
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_020555E0
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02044D68

	thumb_func_start sub_02044D8C
sub_02044D8C: ; 0x02044D8C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	strh r1, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02044D8C

	thumb_func_start sub_02044DC4
sub_02044DC4: ; 0x02044DC4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	strh r1, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02044DC4

	thumb_func_start sub_02044DFC
sub_02044DFC: ; 0x02044DFC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202C028
	bl sub_0202B9E0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0202BB08
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02044DFC

	thumb_func_start sub_02044E40
sub_02044E40: ; 0x02044E40
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202C028
	bl sub_0202B9E0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0202BA2C
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02044E40

	thumb_func_start sub_02044E9C
sub_02044E9C: ; 0x02044E9C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202C028
	bl sub_0202B9E0
	add r1, r7, #0
	bl sub_0202BA70
	cmp r6, r0
	bhi _02044EF6
	mov r0, #1
	b _02044EF8
_02044EF6:
	mov r0, #0
_02044EF8:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02044E9C

	thumb_func_start sub_02044F00
sub_02044F00: ; 0x02044F00
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202C028
	bl sub_0202B9E0
	add r1, r4, #0
	bl sub_0202BBD8
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02044F00

	thumb_func_start sub_02044F30
sub_02044F30: ; 0x02044F30
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202C028
	bl sub_0202B9E0
	add r1, r6, #0
	bl sub_0202BA5C
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02044F30

	thumb_func_start sub_02044F74
sub_02044F74: ; 0x02044F74
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4]
	add r0, r5, #0
	bl sub_02029F60
	cmp r0, #1
	bne _02044FA8
	mov r0, #1
	strh r0, [r4]
_02044FA8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02044F74

	thumb_func_start sub_02044FAC
sub_02044FAC: ; 0x02044FAC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4]
	add r0, r5, #0
	bl sub_02029F48
	cmp r0, #1
	bne _02044FE0
	mov r0, #1
	strh r0, [r4]
_02044FE0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02044FAC

	thumb_func_start sub_02044FE4
sub_02044FE4: ; 0x02044FE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x20
	bl sub_0203FA8C
	str r0, [r4]
	ldr r1, _02045024 ; =sub_02042974
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02045024: .word sub_02042974
	thumb_func_end sub_02044FE4

	thumb_func_start sub_02045028
sub_02045028: ; 0x02045028
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02045028

	thumb_func_start sub_02045040
sub_02045040: ; 0x02045040
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r4, #0
	bl GameStats_Inc
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02045040

	thumb_func_start sub_02045060
sub_02045060: ; 0x02045060
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r4, #0
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r6, #0
	bl GetVarPointer
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r7, #0
	bl GameStats_GetCapped
	ldr r1, _020450B4 ; =0xFFFF0000
	and r1, r0
	lsr r1, r1, #0x10
	strh r1, [r4]
	strh r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020450B4: .word 0xFFFF0000
	thumb_func_end sub_02045060

	thumb_func_start sub_020450B8
sub_020450B8: ; 0x020450B8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	ldr r1, [r5, #8]
	add r2, r1, #1
	str r2, [r5, #8]
	lsl r2, r4, #0x10
	add r4, r2, #0
	orr r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _020450EC
	cmp r0, #1
	beq _02045100
	cmp r0, #2
	beq _02045114
	b _02045126
_020450EC:
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r6, #0
	add r2, r4, #0
	bl GameStats_Add
	b _02045126
_02045100:
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r6, #0
	add r2, r4, #0
	bl GameStats_SetCapped
	b _02045126
_02045114:
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r6, #0
	add r2, r4, #0
	bl GameStats_UpdateBounded
_02045126:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020450B8

	thumb_func_start sub_0204512C
sub_0204512C: ; 0x0204512C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r4, #0
	add r2, r6, #0
	bl GameStats_Add
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0204512C

	thumb_func_start sub_02045160
sub_02045160: ; 0x02045160
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadWord
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r4, #0
	add r2, r6, #0
	bl GameStats_Add
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02045160

	thumb_func_start sub_02045188
sub_02045188: ; 0x02045188
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0202F57C
	str r0, [sp, #8]
	ldr r0, [r5, #8]
	add r1, r0, #1
	str r1, [r5, #8]
	ldrb r4, [r0]
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r0, [r1]
	str r0, [sp]
	add r0, r6, #0
	bl sub_0203B9B8
	add r7, r0, #0
	add r0, r6, #0
	bl sub_0203B9BC
	add r6, r0, #0
	cmp r4, #0
	beq _020451E0
	cmp r4, #1
	beq _020451F8
	b _02045228
_020451E0:
	ldr r0, [sp, #4]
	bl sub_02066840
	ldr r0, [sp, #8]
	ldr r1, [sp]
	bl sub_0202F5F8
	mov r0, #0x1e
	strh r0, [r7]
	mov r0, #0
	strh r0, [r6]
	b _02045228
_020451F8:
	ldr r0, [sp, #4]
	bl sub_02066850
	ldr r0, [sp, #8]
	mov r1, #1
	bl sub_0202F5F8
	ldr r0, [sp, #8]
	bl sub_0202F6AC
	add r1, r0, #0
	beq _02045222
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0209730C
	ldr r0, [sp, #8]
	mov r1, #0
	bl sub_0202F6A0
_02045222:
	mov r0, #0
	strh r0, [r7]
	strh r0, [r6]
_02045228:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02045188

	thumb_func_start sub_02045230
sub_02045230: ; 0x02045230
	push {r3, lr}
	ldr r0, [r0, #0x74]
	bl ov02_02245B80
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02045230

	thumb_func_start sub_0204523C
sub_0204523C: ; 0x0204523C
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldrb r1, [r2]
	ldr r0, [r0, #0x40]
	bl sub_0205C858
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0204523C

	thumb_func_start sub_02045254
sub_02045254: ; 0x02045254
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0202D9D0
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02045254

	thumb_func_start sub_02045264
sub_02045264: ; 0x02045264
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldrb r1, [r2]
	ldr r0, [r0, #0xc]
	bl sub_020676EC
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02045264

	thumb_func_start sub_0204527C
sub_0204527C: ; 0x0204527C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r4, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r5, [r1]
	ldr r0, _020452AC ; =SDK_OVERLAY_OVY_23_ID
	mov r1, #2
	bl HandleLoadOverlay
	mov r0, #0xb
	add r1, r5, #0
	bl ov23_022598C0
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_020452AC: .word SDK_OVERLAY_OVY_23_ID
	thumb_func_end sub_0204527C

	thumb_func_start sub_020452B0
sub_020452B0: ; 0x020452B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4]
	bl ov23_02259B50
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020452B0

	thumb_func_start sub_020452E0
sub_020452E0: ; 0x020452E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4]
	bl ov23_02259B58
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020452E0

	thumb_func_start sub_02045310
sub_02045310: ; 0x02045310
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4]
	bl ov23_02259B60
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02045310

	thumb_func_start sub_02045340
sub_02045340: ; 0x02045340
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r5, #0x74]
	ldr r1, [r4]
	mov r3, #0xb
	bl sub_02067A1C
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02045340

	thumb_func_start sub_02045374
sub_02045374: ; 0x02045374
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl sub_020402F0
	ldr r0, [r0]
	bl ov23_02259944
	ldr r0, _02045390 ; =SDK_OVERLAY_OVY_23_ID
	bl UnloadOverlayByID
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02045390: .word SDK_OVERLAY_OVY_23_ID
	thumb_func_end sub_02045374

	thumb_func_start sub_02045394
sub_02045394: ; 0x02045394
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r1, [r5, #8]
	add r2, r1, #1
	str r2, [r5, #8]
	ldrb r6, [r1]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r7, r0, #0
	ldr r0, _020453CC ; =SDK_OVERLAY_OVY_23_ID
	mov r1, #2
	bl HandleLoadOverlay
	add r5, #0x80
	ldr r0, [r5]
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl ov23_02259964
	ldr r0, _020453CC ; =SDK_OVERLAY_OVY_23_ID
	bl UnloadOverlayByID
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020453CC: .word SDK_OVERLAY_OVY_23_ID
	thumb_func_end sub_02045394

	thumb_func_start sub_020453D0
sub_020453D0: ; 0x020453D0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	ldr r0, _02045424 ; =SDK_OVERLAY_OVY_23_ID
	mov r1, #2
	bl HandleLoadOverlay
	add r5, #0x80
	lsl r2, r6, #0x18
	ldr r0, [r5]
	add r1, r4, #0
	lsr r2, r2, #0x18
	bl ov23_02259AA0
	strh r0, [r7]
	ldr r0, _02045424 ; =SDK_OVERLAY_OVY_23_ID
	bl UnloadOverlayByID
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02045424: .word SDK_OVERLAY_OVY_23_ID
	thumb_func_end sub_020453D0

	thumb_func_start sub_02045428
sub_02045428: ; 0x02045428
	mov r0, #0
	bx lr
	thumb_func_end sub_02045428

	thumb_func_start sub_0204542C
sub_0204542C: ; 0x0204542C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	bl sub_0202A57C
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0204542C

	thumb_func_start sub_02045440
sub_02045440: ; 0x02045440
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	mov r0, #0
	strh r0, [r6]
	cmp r4, #1
	bne _02045486
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	bl sub_0202A53C
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_SetNatDexFlag
	b _020454A0
_02045486:
	cmp r4, #2
	bne _0204549C
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	bl sub_0202A55C
	strh r0, [r6]
	b _020454A0
_0204549C:
	bl GF_AssertFail
_020454A0:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02045440

	thumb_func_start sub_020454A4
sub_020454A4: ; 0x020454A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r5, r0, #0
	mov r1, #0xd
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0xe
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0xf
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl GetMonData
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x11
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #0
	bl GetMonData
	add r1, r4, r6
	add r2, r7, r1
	ldr r1, [sp, #4]
	add r2, r1, r2
	ldr r1, [sp, #8]
	add r1, r1, r2
	add r1, r0, r1
	ldr r0, [sp]
	strh r1, [r0]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020454A4

	thumb_func_start sub_02045540
sub_02045540: ; 0x02045540
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, sp, #0
	bl GF_RTC_CopyDate
	ldr r0, [sp, #0xc]
	strh r0, [r4]
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02045540

	thumb_func_start sub_02045568
sub_02045568: ; 0x02045568
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r1, r0, #0
	ldr r0, [r4, #0x74]
	bl ov03_022566B0
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02045568

	thumb_func_start sub_02045588
sub_02045588: ; 0x02045588
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	add r4, #0x80
	lsl r1, r1, #0x18
	ldr r0, [r4]
	lsr r1, r1, #0x18
	bl ov02_0224BB18
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02045588

	thumb_func_start sub_020455B0
sub_020455B0: ; 0x020455B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	add r5, #0x80
	lsl r1, r4, #0x18
	lsl r2, r2, #0x18
	ldr r0, [r5]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov02_0224BDE8
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020455B0

	thumb_func_start sub_020455F0
sub_020455F0: ; 0x020455F0
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	mov r1, #GAME_VERSION
	strh r1, [r0]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020455F0

	thumb_func_start sub_0204560C
sub_0204560C: ; 0x0204560C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	add r0, r6, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #8]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r6, #0xc]
	bl GetStoragePCPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r1, r7, #0
	bl ov02_0224CD38
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	beq _020456AA
	cmp r5, #7
	ble _020456B4
_020456AA:
	mov r0, #0xff
	strh r0, [r4]
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_020456B4:
	add r0, r6, #0
	add r1, r5, #0
	bl PCStorage_IsBonusWallpaperUnlocked
	cmp r0, #0
	beq _020456C4
	mov r0, #0
	b _020456CE
_020456C4:
	add r0, r6, #0
	add r1, r5, #0
	bl PCStorage_UnlockBonusWallpaper
	add r0, r5, #1
_020456CE:
	strh r0, [r4]
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204560C

	thumb_func_start sub_020456D8
sub_020456D8: ; 0x020456D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	add r0, r6, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #8]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r6, #0xc]
	bl GetStoragePCPointer
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r3, [sp, #0xc]
	add r1, r6, #0
	add r2, r7, #0
	bl ov02_0224CD74
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02045778
	mov r0, #0xff
	strh r0, [r4]
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02045778:
	strh r0, [r4]
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020456D8

	thumb_func_start sub_02045780
sub_02045780: ; 0x02045780
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	add r0, r3, #0
	bl ov02_0224BF58
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02045780

	thumb_func_start sub_0204579C
sub_0204579C: ; 0x0204579C
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	add r0, r3, #0
	bl ov02_0224BFC0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0204579C

	thumb_func_start sub_020457B8
sub_020457B8: ; 0x020457B8
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r2, [r0, #8]
	ldr r3, [r1]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	add r0, r3, #0
	bl ov02_0224BFCC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020457B8

	thumb_func_start sub_020457D4
sub_020457D4: ; 0x020457D4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r0, [r0, #0xc]
	add r5, r1, #0
	bl Sav2_Pokedex_get
	add r6, r0, #0
	mov r0, #0x20
	bl AllocMonZeroed
	add r4, r0, #0
	bl ZeroMonData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0x32
	mov r3, #0x20
	bl CreateMon
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202A36C
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020457D4

	thumb_func_start sub_02045818
sub_02045818: ; 0x02045818
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_020457D4
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02045818

	thumb_func_start sub_0204583C
sub_0204583C: ; 0x0204583C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl GetStoragePCPointer
	bl PCStorage_CountEmptySpotsInAllBoxes
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204583C

	thumb_func_start sub_02045868
sub_02045868: ; 0x02045868
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x17
	bl sub_020402F0
	add r4, r0, #0
	mov r0, #0
	add r5, #0x80
	str r0, [r4]
	ldr r0, [r5]
	bl ov01_021F2F70
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02045868

	thumb_func_start sub_0204588C
sub_0204588C: ; 0x0204588C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x17
	bl sub_020402F0
	ldr r0, [r0]
	bl ov01_021F2FF0
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0204588C

	thumb_func_start sub_020458A4
sub_020458A4: ; 0x020458A4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	add r4, #0x80
	lsl r1, r1, #0x18
	ldr r0, [r4]
	lsr r1, r1, #0x18
	bl ov02_0224CDB0
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020458A4

	thumb_func_start sub_020458CC
sub_020458CC: ; 0x020458CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r4, #0
	bl GameStats_AddSpecial
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020458CC

	thumb_func_start sub_020458EC
sub_020458EC: ; 0x020458EC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl sub_020748CC
	strh r0, [r4]
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020458EC

	thumb_func_start sub_0204592C
sub_0204592C: ; 0x0204592C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, sp, #4
	strh r0, [r1]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [sp]
	bl GetPartyCount
	add r4, #0x80
	add r6, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r7, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _020459A2
_0204596C:
	ldr r0, [sp]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	ldr r1, _020459A8 ; =0x00000182
	cmp r0, r1
	bne _0204599C
	add r0, r4, #0
	mov r1, #0x70
	add r2, sp, #4
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
	add r0, r7, #0
	add r1, r4, #0
	bl Pokedex_SetMonCaughtFlag
_0204599C:
	add r5, r5, #1
	cmp r5, r6
	blt _0204596C
_020459A2:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020459A8: .word 0x00000182
	thumb_func_end sub_0204592C

	thumb_func_start sub_020459AC
sub_020459AC: ; 0x020459AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	str r0, [sp]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [sp, #0xc]
	bl GetPartyCount
	add r2, sp, #0x18
	mov r4, #0
	ldr r3, _02045A5C ; =0x020FACC4
	str r0, [sp, #8]
	add r7, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [sp, #8]
	str r4, [sp, #4]
	cmp r0, #0
	ble _02045A50
	mov r5, #1
	str r7, [sp, #0x14]
_020459F6:
	ldr r0, [sp, #0xc]
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x10]
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r3, r0, #0
	mov r0, #0x67
	ldr r1, [sp, #0x10]
	lsl r0, r0, #2
	cmp r1, r0
	bne _02045A46
	mov r2, #0
	add r1, r2, #0
	str r3, [r7]
	cmp r4, #0
	ble _02045A3C
	ldr r6, [sp, #0x14]
_02045A2C:
	ldr r0, [r6]
	cmp r3, r0
	bne _02045A34
	add r2, r5, #0
_02045A34:
	add r1, r1, #1
	add r6, r6, #4
	cmp r1, r4
	blt _02045A2C
_02045A3C:
	cmp r2, #0
	bne _02045A46
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_02045A46:
	ldr r0, [sp, #8]
	add r4, r4, #1
	add r7, r7, #4
	cmp r4, r0
	blt _020459F6
_02045A50:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	strh r1, [r0]
	mov r0, #1
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02045A5C: .word 0x020FACC4
	thumb_func_end sub_020459AC

	thumb_func_start sub_02045A60
sub_02045A60: ; 0x02045A60
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066820
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02045A60

	thumb_func_start sub_02045A74
sub_02045A74: ; 0x02045A74
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066830
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02045A74

	thumb_func_start sub_02045A88
sub_02045A88: ; 0x02045A88
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02055618
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02045A88

	thumb_func_start sub_02045AAC
sub_02045AAC: ; 0x02045AAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #8]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r7, #0
	ldr r0, [r0, #0x3c]
	bl sub_0205EE60
	add r7, r0, #0
	bne _02045B2A
	bl GF_AssertFail
_02045B2A:
	str r6, [sp]
	str r4, [sp, #4]
	ldr r0, [r5, #0x74]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #8]
	add r1, r7, #0
	bl sub_0205BED8
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02045AAC

	thumb_func_start sub_02045B40
sub_02045B40: ; 0x02045B40
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r5, #0
	ldr r0, [r0, #0x3c]
	bl sub_0205EE60
	add r5, r0, #0
	bne _02045B94
	bl GF_AssertFail
_02045B94:
	ldr r0, [r4, #0x74]
	add r1, r5, #0
	add r2, r7, #0
	add r3, r6, #0
	bl sub_0205BFB4
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02045B40

	thumb_func_start sub_02045BA4
sub_02045BA4: ; 0x02045BA4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0205BDB8
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02045BA4

	thumb_func_start sub_02045BCC
sub_02045BCC: ; 0x02045BCC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	str r0, [sp]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_0202C028
	bl sub_0202B9E0
	mov r6, #0
	add r7, r0, #0
	add r4, r6, #0
	add r5, sp, #4
_02045BFA:
	add r1, r4, #0
	add r0, r7, #0
	add r1, #0x22
	mov r2, #1
	bl sub_0202BA2C
	cmp r0, #1
	bne _02045C10
	mov r0, #1
	strh r0, [r5]
	add r6, r6, #1
_02045C10:
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #0x10
	blt _02045BFA
	cmp r6, #0
	bne _02045C28
	ldr r0, [sp]
	ldr r1, _02045C60 ; =0x0000FFFF
	add sp, #0x24
	strh r1, [r0]
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02045C28:
	bl LCRandom
	add r1, r6, #0
	bl _s32_div_f
	mov r4, #0
	add r2, sp, #4
_02045C36:
	ldrh r0, [r2]
	cmp r0, #1
	bne _02045C42
	cmp r1, #0
	beq _02045C4A
	sub r1, r1, #1
_02045C42:
	add r4, r4, #1
	add r2, r2, #2
	cmp r4, #0x10
	blt _02045C36
_02045C4A:
	cmp r4, #0x10
	blt _02045C52
	bl GF_AssertFail
_02045C52:
	ldr r0, [sp]
	add r4, #0x22
	strh r4, [r0]
	mov r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02045C60: .word 0x0000FFFF
	thumb_func_end sub_02045BCC

	thumb_func_start sub_02045C64
sub_02045C64: ; 0x02045C64
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	ldr r1, _02045C80 ; =gMain + 0x60
	ldrb r1, [r1, #0xa]
	strh r1, [r0]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02045C80: .word gMain + 0x60
	thumb_func_end sub_02045C64

	thumb_func_start sub_02045C84
sub_02045C84: ; 0x02045C84
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r5, #0x80
	ldr r0, [r5]
	ldrb r4, [r1]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	cmp r4, #0
	beq _02045CB8
	add r1, r6, #0
	bl sub_02066C1C
	b _02045CBE
_02045CB8:
	add r1, r6, #0
	bl sub_02066C4C
_02045CBE:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02045C84

	thumb_func_start sub_02045CC4
sub_02045CC4: ; 0x02045CC4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r4, #0
	bl BufferContestBackgroundName
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02045CC4

	thumb_func_start sub_02045CFC
sub_02045CFC: ; 0x02045CFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066D40
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02045CFC

	thumb_func_start sub_02045D28
sub_02045D28: ; 0x02045D28
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202C028
	bl sub_0202B9E0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0202BB7C
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02045D28

	thumb_func_start sub_02045D6C
sub_02045D6C: ; 0x02045D6C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02066D60
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02045D6C

	thumb_func_start sub_02045D7C
sub_02045D7C: ; 0x02045D7C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_02015C28
	bl sub_02015C48
	cmp r0, #0x20
	bne _02045DCE
	ldr r0, _02045DE4 ; =0x0000FFFF
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02045DCE:
	strh r0, [r4]
	bl sub_02015CC8
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r7, #0
	bl sub_0200C528
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02045DE4: .word 0x0000FFFF
	thumb_func_end sub_02045D7C

	thumb_func_start sub_02045DE8
sub_02045DE8: ; 0x02045DE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_02015C28
	bl sub_02015CAC
	cmp r0, #1
	bne _02045E14
	mov r0, #1
	b _02045E16
_02045E14:
	mov r0, #0
_02045E16:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02045DE8

	thumb_func_start sub_02045E1C
sub_02045E1C: ; 0x02045E1C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02066DA8
	cmp r0, #5
	blo _02045E4C
	mov r0, #1
	b _02045E4E
_02045E4C:
	mov r0, #0
_02045E4E:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02045E1C

	thumb_func_start sub_02045E54
sub_02045E54: ; 0x02045E54
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	ldr r6, [r4]
	add r5, r0, #0
	ldr r0, [r6, #0xc]
	bl Sav2_SysInfo_get
	add r7, r0, #0
	bl Sav2_SysInfo_GetBirthMonth
	add r4, r0, #0
	add r0, r6, #0
	bl sub_02055600
	cmp r4, r0
	bne _02045E9E
	add r0, r7, #0
	bl Sav2_SysInfo_GetBirthDay
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205560C
	cmp r4, r0
	bne _02045E9E
	mov r0, #1
	strh r0, [r5]
	b _02045EA2
_02045E9E:
	mov r0, #0
	strh r0, [r5]
_02045EA2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02045E54

	thumb_func_start sub_02045EA8
sub_02045EA8: ; 0x02045EA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl sub_0202A14C
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02045EA8

	thumb_func_start sub_02045ED8
sub_02045ED8: ; 0x02045ED8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	add r5, r0, #0
	cmp r4, #1
	bls _02045F0A
	bl GF_AssertFail
_02045F0A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02066BC0
	strh r0, [r6]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02045ED8

	thumb_func_start sub_02045F18
sub_02045F18: ; 0x02045F18
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #0x20
	ldr r0, [r0, #0xc]
	add r2, sp, #0
	bl LoadHallOfFame
	ldr r1, [sp]
	add r4, r0, #0
	cmp r1, #0
	bne _02045F50
	mov r1, #0
	strh r1, [r5]
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02045F50:
	cmp r1, #1
	bne _02045F66
	mov r1, #0
	bl sub_0202E2C4
	strh r0, [r5]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02045F66:
	cmp r1, #2
	bne _02045F76
	mov r1, #0
	strh r1, [r5]
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02045F76:
	mov r0, #0
	strh r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02045F18

	thumb_func_start sub_02045F80
sub_02045F80: ; 0x02045F80
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r1, r5, #0
	add r1, #0x80
	add r4, r0, #0
	ldr r1, [r1]
	mov r0, #0x20
	add r2, r6, #0
	bl sub_0203E5D0
	str r0, [r4]
	ldr r1, _02045FC0 ; =sub_020429F8
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02045FC0: .word sub_020429F8
	thumb_func_end sub_02045F80

	thumb_func_start sub_02045FC4
sub_02045FC4: ; 0x02045FC4
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _02046004
	bl GF_AssertFail
_02046004:
	ldr r0, [r4]
	bl sub_0203E5C8
	strh r0, [r6]
	ldrh r0, [r6]
	cmp r0, #7
	bne _02046016
	mov r0, #0xff
	strh r0, [r6]
_02046016:
	ldr r0, [r4]
	bl sub_0203E5F8
	strh r0, [r5]
	ldrh r0, [r5]
	cmp r0, #1
	bne _02046028
	mov r0, #1
	b _0204602A
_02046028:
	mov r0, #0
_0204602A:
	strh r0, [r5]
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02045FC4

	thumb_func_start sub_02046038
sub_02046038: ; 0x02046038
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	cmp r4, #0x64
	bls _0204605A
	mov r4, #0x64
_0204605A:
	bl LCRandom
	mov r1, #0x65
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	cmp r0, r4
	bgt _02046070
	mov r0, #1
	b _02046072
_02046070:
	mov r0, #0
_02046072:
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02046038

	thumb_func_start sub_02046078
sub_02046078: ; 0x02046078
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	cmp r5, #5
	bhi _020460FE
	add r2, r5, r5
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_020460B6: ; jump table
	.short _020460C2 - _020460B6 - 2 ; case 0
	.short _020460CC - _020460B6 - 2 ; case 1
	.short _020460D6 - _020460B6 - 2 ; case 2
	.short _020460E0 - _020460B6 - 2 ; case 3
	.short _020460EA - _020460B6 - 2 ; case 4
	.short _020460F4 - _020460B6 - 2 ; case 5
_020460C2:
	mov r2, #0
	mov r3, #0x20
	bl ov02_0224E074
	b _02046102
_020460CC:
	mov r2, #1
	mov r3, #0x20
	bl ov02_0224E074
	b _02046102
_020460D6:
	mov r2, #2
	mov r3, #0x20
	bl ov02_0224E074
	b _02046102
_020460E0:
	mov r2, #3
	mov r3, #0x20
	bl ov02_0224E074
	b _02046102
_020460EA:
	mov r2, #4
	mov r3, #0x20
	bl ov02_0224E074
	b _02046102
_020460F4:
	mov r2, #5
	mov r3, #0x20
	bl ov02_0224E074
	b _02046102
_020460FE:
	bl GF_AssertFail
_02046102:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02046078

	thumb_func_start sub_02046108
sub_02046108: ; 0x02046108
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0203A05C
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02046108

	thumb_func_start sub_02046130
sub_02046130: ; 0x02046130
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202C6F4
	bl sub_0202C2F8
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02046130

	thumb_func_start sub_0204615C
sub_0204615C: ; 0x0204615C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	mov r1, #0
	strh r1, [r0]
	ldr r1, _0204619C ; =0x0000012A
	cmp r4, r1
	blo _02046196
	add r1, #0xf
	cmp r4, r1
	bhi _02046196
	mov r1, #1
	strh r1, [r0]
_02046196:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0204619C: .word 0x0000012A
	thumb_func_end sub_0204615C

	thumb_func_start sub_020461A0
sub_020461A0: ; 0x020461A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #4]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #8]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0xc]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r7, r0, #0
	mov r0, #0x20
	bl ScrStrBufs_new
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xca
	mov r3, #0x20
	bl NewMsgDataFromNarc
	add r5, r0, #0
	ldr r2, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	bl sub_0200C528
	ldr r2, [sp, #8]
	add r0, r4, #0
	mov r1, #1
	bl sub_0200C528
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	mov r1, #2
	bl sub_0200C528
	add r0, r4, #0
	mov r1, #3
	add r2, r7, #0
	bl sub_0200C528
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	mov r3, #0x20
	bl ReadMsgData_ExpandPlaceholders
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl NewString_ReadMsgData
	str r0, [sp]
	ldr r1, [sp]
	add r0, r7, #0
	bl StringCompare
	cmp r0, #0
	bne _0204626C
	mov r0, #1
	b _0204626E
_0204626C:
	mov r0, #0
_0204626E:
	strh r0, [r6]
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp]
	bl String_dtor
	add r0, r5, #0
	bl DestroyMsgData
	add r0, r4, #0
	bl ScrStrBufs_delete
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020461A0

	thumb_func_start sub_02046290
sub_02046290: ; 0x02046290
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_SysInfo_get
	mov r1, #1
	bl sub_02028DD0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02046290

	thumb_func_start sub_020462A8
sub_020462A8: ; 0x020462A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	bl sub_020402F0
	ldr r0, [r0]
	bl sub_0205A6AC
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020462A8

	thumb_func_start sub_020462D8
sub_020462D8: ; 0x020462D8
	push {r3, lr}
	bl sub_0203A880
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020462D8

	thumb_func_start sub_020462E4
sub_020462E4: ; 0x020462E4
	push {r3, lr}
	bl sub_0203A914
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020462E4

	thumb_func_start sub_020462F0
sub_020462F0: ; 0x020462F0
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203B9DC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020462F0

	thumb_func_start sub_02046300
sub_02046300: ; 0x02046300
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r7, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	bl sub_0203B964
	str r4, [r0]
	str r6, [r0, #8]
	mov r1, #0
	str r7, [r0, #0xc]
	mvn r1, r1
	str r1, [r0, #4]
	mov r1, #1
	str r1, [r0, #0x10]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02046300

	thumb_func_start sub_02046360
sub_02046360: ; 0x02046360
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	ldr r2, [r5, #8]
	add r1, r0, #0
	add r0, r2, #1
	str r0, [r5, #8]
	add r5, #0x80
	ldr r0, [r5]
	ldrb r4, [r2]
	ldr r0, [r0, #0x3c]
	bl sub_0205EE60
	add r5, r0, #0
	bne _02046390
	bl GF_AssertFail
_02046390:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F6AC
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02046360

	thumb_func_start sub_0204639C
sub_0204639C: ; 0x0204639C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl sub_020691E8
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204639C

	thumb_func_start sub_020463C4
sub_020463C4: ; 0x020463C4
	push {r3, r4, r5, lr}
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0x29
	add r0, r5, #0
	bl sub_020402F0
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_02027500
	cmp r0, #0
	bne _020463EE
	add r0, r5, #0
	mov r1, #4
	mov r2, #3
	bl ov01_021F41C0
	str r0, [r4]
	bl ov01_021F412C
_020463EE:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020463C4

	thumb_func_start sub_020463F4
sub_020463F4: ; 0x020463F4
	push {r3, r4, r5, lr}
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0x29
	add r0, r5, #0
	bl sub_020402F0
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_02027500
	cmp r0, #0
	bne _0204641A
	ldr r0, [r4]
	bl ov01_021F41A4
	ldr r0, [r4]
	bl ov01_021F421C
_0204641A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020463F4

	thumb_func_start sub_02046420
sub_02046420: ; 0x02046420
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl sub_02067A80
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02046420

	thumb_func_start sub_02046438
sub_02046438: ; 0x02046438
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r6, [r1]
	mov r0, #0xb
	mov r1, #0x28
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x28
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r6, #0
	add r0, #0xfb
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r4, [r7]
	cmp r0, #1
	bhi _0204647C
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0xa0
	ldr r0, [r0]
	b _0204647E
_0204647C:
	mov r0, #0
_0204647E:
	str r0, [r4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	add r0, r4, #0
	add r0, #0x20
	strb r6, [r0]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, _020464D8 ; =0x02108584
	ldr r0, [r0, #0xc]
	add r2, r4, #0
	str r0, [r4, #8]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	str r0, [r4, #0x18]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0x94
	ldr r0, [r0]
	str r0, [r4, #0xc]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0xb0
	ldr r0, [r0]
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x74]
	bl sub_02050624
	ldr r1, _020464DC ; =sub_02042974
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020464D8: .word 0x02108584
_020464DC: .word sub_02042974
	thumb_func_end sub_02046438

	thumb_func_start sub_020464E0
sub_020464E0: ; 0x020464E0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r3, r0, #0
	mov r0, #0x20
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x80
	lsl r1, r6, #0x18
	lsl r2, r7, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl sub_0203FAB4
	str r0, [r4]
	ldr r1, _02046550 ; =sub_02042974
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02046550: .word sub_02042974
	thumb_func_end sub_020464E0

	thumb_func_start sub_02046554
sub_02046554: ; 0x02046554
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x20
	bl sub_0203FB60
	str r0, [r4]
	ldr r1, _02046580 ; =sub_020429F8
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02046580: .word sub_020429F8
	thumb_func_end sub_02046554

	thumb_func_start sub_02046584
sub_02046584: ; 0x02046584
	push {r4, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02046584

	thumb_func_start sub_020465A0
sub_020465A0: ; 0x020465A0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r7, r0, #0
	ldr r0, [r5]
	mov r1, #0x14
	bl sub_020402F0
	ldr r1, [r0]
	lsl r0, r4, #1
	add r1, r1, r0
	ldrh r0, [r1, #8]
	strh r0, [r6]
	ldrh r0, [r1, #0xe]
	strh r0, [r7]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020465A0

	thumb_func_start sub_020465FC
sub_020465FC: ; 0x020465FC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0203A05C
	cmp r0, #0
	beq _02046666
	mov r0, #1
	strh r0, [r4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0203FC14
	ldr r1, _02046670 ; =sub_020429F8
	add r0, r5, #0
	bl SetupNativeScript
	b _0204666A
_02046666:
	mov r0, #0
	strh r0, [r4]
_0204666A:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02046670: .word sub_020429F8
	thumb_func_end sub_020465FC

	thumb_func_start sub_02046674
sub_02046674: ; 0x02046674
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0203A05C
	cmp r0, #0
	beq _020466A2
	ldrh r1, [r4]
	ldr r0, [r5, #0x74]
	bl sub_02056D00
_020466A2:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02046674

	thumb_func_start sub_020466A8
sub_020466A8: ; 0x020466A8
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	mov r1, #0
	strh r1, [r0]
	ldr r1, _020466DC ; =gMain
	ldr r2, [r1, #0x44]
	mov r1, #1
	tst r2, r1
	beq _020466CA
	strh r1, [r0]
_020466CA:
	ldr r1, _020466DC ; =gMain
	ldr r2, [r1, #0x44]
	mov r1, #2
	tst r1, r2
	beq _020466D8
	mov r1, #1
	strh r1, [r0]
_020466D8:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_020466DC: .word gMain
	thumb_func_end sub_020466A8

	thumb_func_start sub_020466E0
sub_020466E0: ; 0x020466E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	str r1, [sp]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #4]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [sp, #4]
	mov r1, #0
	strh r1, [r0]
	strh r1, [r7]
	strh r1, [r6]
	strh r1, [r4]
	ldr r0, [sp]
	strh r1, [r5]
	ldr r0, [r0, #0xc]
	bl sub_020467A8
	lsr r1, r0, #1
	mov r2, #1
	and r1, r2
	cmp r1, #1
	bne _02046772
	ldr r1, [sp, #4]
	strh r2, [r1]
_02046772:
	lsr r2, r0, #2
	mov r1, #1
	and r2, r1
	cmp r2, #1
	bne _0204677E
	strh r1, [r7]
_0204677E:
	lsr r2, r0, #3
	mov r1, #1
	and r2, r1
	cmp r2, #1
	bne _0204678A
	strh r1, [r6]
_0204678A:
	lsr r2, r0, #4
	mov r1, #1
	and r2, r1
	cmp r2, #1
	bne _02046796
	strh r1, [r4]
_02046796:
	lsr r1, r0, #5
	mov r0, #1
	and r1, r0
	cmp r1, #1
	bne _020467A2
	strh r0, [r5]
_020467A2:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020466E0

	thumb_func_start sub_020467A8
sub_020467A8: ; 0x020467A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	mov r6, #0
	bl SavArray_PlayerParty_get
	str r0, [sp, #8]
	bl GetPartyCount
	add r7, r0, #0
	add r4, r6, #0
	cmp r7, #0
	ble _020467FE
_020467C2:
	ldr r0, [sp, #8]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	ldr r1, _020468F0 ; =0x000001DF
	cmp r0, r1
	bne _020467F8
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _020467F8
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	mov r1, #1
	lsl r1, r0
	orr r6, r1
_020467F8:
	add r4, r4, #1
	cmp r4, r7
	blt _020467C2
_020467FE:
	ldr r0, [sp]
	bl Sav2_DayCare_get
	add r7, r0, #0
	mov r4, #0
_02046808:
	add r0, r7, #0
	add r1, r4, #0
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetBoxMon
	mov r1, #5
	mov r2, #0
	add r5, r0, #0
	bl GetBoxMonData
	ldr r1, _020468F0 ; =0x000001DF
	cmp r0, r1
	bne _02046842
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _02046842
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	mov r1, #1
	lsl r1, r0
	orr r6, r1
_02046842:
	add r4, r4, #1
	cmp r4, #2
	blt _02046808
	ldr r0, [sp]
	bl GetStoragePCPointer
	str r0, [sp, #4]
	mov r7, #0
_02046852:
	mov r5, #0
_02046854:
	ldr r0, [sp, #4]
	add r1, r7, #0
	add r2, r5, #0
	bl PCStorage_GetMonByIndexPair
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetBoxMonData
	ldr r1, _020468F0 ; =0x000001DF
	cmp r0, r1
	bne _0204688C
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0204688C
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	mov r1, #1
	lsl r1, r0
	orr r6, r1
_0204688C:
	add r5, r5, #1
	cmp r5, #0x1e
	blt _02046854
	add r7, r7, #1
	cmp r7, #0x12
	blo _02046852
	mov r0, #0x20
	bl AllocMonZeroed
	add r5, r0, #0
	bl Mon_GetBoxMon
	add r4, r0, #0
	ldr r0, [sp]
	bl Sav2_Pokewalker_get
	add r1, r4, #0
	bl sub_020326DC
	cmp r0, #0
	beq _020468E4
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	ldr r1, _020468F0 ; =0x000001DF
	cmp r0, r1
	bne _020468E4
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _020468E4
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	mov r1, #1
	lsl r1, r0
	orr r6, r1
_020468E4:
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020468F0: .word 0x000001DF
	thumb_func_end sub_020467A8

	thumb_func_start sub_020468F4
sub_020468F4: ; 0x020468F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	add r1, r4, #0
	bl GameStats_AddSpecial
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020468F4

	thumb_func_start sub_02046914
sub_02046914: ; 0x02046914
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r6, r0, #0
	mov r0, #0xb
	bl GF_ExpHeap_FndGetTotalFreeSize
	add r4, r0, #0
	mov r0, #4
	bl GF_ExpHeap_FndGetTotalFreeSize
	add r7, r0, #0
	mov r0, #0x20
	bl GF_ExpHeap_FndGetTotalFreeSize
	add r5, r0, #0
	cmp r6, #0
	bne _0204694E
	ldr r0, _0204696C ; =0x021D415C
	str r4, [r0, #8]
	str r7, [r0, #4]
	str r5, [r0, #0xc]
	b _02046966
_0204694E:
	ldr r0, _0204696C ; =0x021D415C
	ldr r0, [r0, #8]
	cmp r4, r0
	beq _0204695A
	bl GF_AssertFail
_0204695A:
	ldr r0, _0204696C ; =0x021D415C
	ldr r0, [r0, #0xc]
	cmp r5, r0
	beq _02046966
	bl GF_AssertFail
_02046966:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0204696C: .word 0x021D415C
	thumb_func_end sub_02046914

	thumb_func_start sub_02046970
sub_02046970: ; 0x02046970
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	bl GF_RTC_DateTimeToSec
	add r2, r5, #0
	add r2, #0xb4
	add r5, #0xb8
	ldr r3, [r2]
	ldr r2, [r5]
	sub r3, r0, r3
	sbc r1, r2
	mov r2, #0
	mov r0, #0x78
	sub r0, r3, r0
	sbc r1, r2
	blt _020469AA
	mov r0, #1
	b _020469AC
_020469AA:
	mov r0, #0
_020469AC:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02046970

	thumb_func_start sub_020469B4
sub_020469B4: ; 0x020469B4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [sp]
	add r1, r5, #0
	bl sub_02071D3C
	ldr r0, [sp]
	bl GetPartyCount
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _02046A18
_020469F0:
	ldr r0, [sp]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _02046A12
	ldr r0, [r6, #0xc]
	bl Sav2_Pokedex_get
	add r1, r4, #0
	bl Pokedex_SetMonCaughtFlag
_02046A12:
	add r5, r5, #1
	cmp r5, r7
	blt _020469F0
_02046A18:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020469B4

	thumb_func_start sub_02046A1C
sub_02046A1C: ; 0x02046A1C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	mov r0, #0
	strh r0, [r6]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r7, #0
	bl GetPartyMonByIndex
	add r7, r0, #0
	cmp r4, #4
	blo _02046A6E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02046A6E:
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02046A88
	add r0, r7, #0
	mov r1, #3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02046A8C
_02046A88:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02046A8C:
	add r0, r7, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	add r5, #0x80
	str r0, [sp]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerID
	ldr r1, [sp]
	cmp r1, r0
	bne _02046AB0
	mov r2, #1
	b _02046AB2
_02046AB0:
	mov r2, #0
_02046AB2:
	add r0, r4, #0
	add r1, r7, #0
	bl sub_0208E9E0
	cmp r0, #0
	bne _02046AC2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02046AC2:
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r4, #3
	bhi _02046B12
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02046ADC: ; jump table
	.short _02046AE4 - _02046ADC - 2 ; case 0
	.short _02046AFE - _02046ADC - 2 ; case 1
	.short _02046AFE - _02046ADC - 2 ; case 2
	.short _02046B0A - _02046ADC - 2 ; case 3
_02046AE4:
	cmp r0, #0xac
	beq _02046AEE
	sub r0, #0x19
	cmp r0, #1
	bhi _02046B12
_02046AEE:
	add r0, r7, #0
	bl MonIsShiny
	cmp r0, #0
	beq _02046B12
	mov r0, #1
	strh r0, [r6]
	b _02046B12
_02046AFE:
	ldr r1, _02046B18 ; =0x000001ED
	cmp r0, r1
	bne _02046B12
	mov r0, #1
	strh r0, [r6]
	b _02046B12
_02046B0A:
	cmp r0, #0xfb
	bne _02046B12
	mov r0, #1
	strh r0, [r6]
_02046B12:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02046B18: .word 0x000001ED
	thumb_func_end sub_02046A1C

	thumb_func_start sub_02046B1C
sub_02046B1C: ; 0x02046B1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4, #0x3c]
	mov r1, #0xfd
	bl sub_0205EE60
	bl ov01_022055DC
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02046B1C

	thumb_func_start sub_02046B48
sub_02046B48: ; 0x02046B48
	push {r4, lr}
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0xfd
	ldr r0, [r4, #0x3c]
	bl sub_0205EE60
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl ov01_02203AB4
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02046B48

	thumb_func_start sub_02046B64
sub_02046B64: ; 0x02046B64
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	cmp r0, #1
	bne _02046B88
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02069D68
	add r1, r0, #0
	b _02046BA6
_02046B88:
	cmp r0, #2
	bne _02046B9E
	add r0, r4, #0
	bl sub_02069D68
	add r6, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	add r1, r0, #0
	b _02046BA6
_02046B9E:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
_02046BA6:
	ldr r2, [r5, #0x74]
	add r0, r6, #0
	bl ov02_0224E0BC
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02046B64

	thumb_func_start sub_02046BB4
sub_02046BB4: ; 0x02046BB4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov01_02205AEC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02046BB4

	thumb_func_start sub_02046BC4
sub_02046BC4: ; 0x02046BC4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov01_02205D68
	cmp r0, #0
	beq _02046BD6
	mov r0, #1
	pop {r3, pc}
_02046BD6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02046BC4

	thumb_func_start sub_02046BDC
sub_02046BDC: ; 0x02046BDC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046CAC
	ldr r0, [sp, #4]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069D68
	bl ov01_022055DC
	cmp r0, #0
	beq _02046C9C
	ldr r0, [sp, #4]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205CA1C
	bl sub_0205C6DC
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205CA1C
	bl sub_0205C654
	add r4, r0, #0
	ldr r0, [sp, #0xc]
	bl sub_0205F914
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02060F0C
	lsl r5, r0, #1
	ldr r0, [sp, #0xc]
	bl sub_0205F924
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	bl sub_0205F934
	add r7, r0, #0
	add r0, r4, #0
	bl sub_02060F18
	lsl r4, r0, #1
	ldr r0, [sp, #4]
	add r1, r6, r5
	add r0, #0x80
	ldr r0, [r0]
	add r2, r7, r4
	bl sub_02054918
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	add r1, sp, #0x18
	bl sub_0205F944
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, sp, #0x18
	add r0, #0x80
	ldr r0, [r0]
	add r2, r6, r5
	add r3, r7, r4
	bl sub_020549A8
	cmp r0, #0
	bne _02046C98
	ldr r0, [sp, #0x14]
	bl sub_0205B778
	cmp r0, #0
	bne _02046C98
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r1, r6, r5
	add r3, r7, r4
	bl sub_02060BFC
	cmp r0, #0
	beq _02046C9C
_02046C98:
	mov r0, #0
	str r0, [sp, #8]
_02046C9C:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02046CAC
	ldr r0, [sp, #4]
	bl sub_0204219C
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_02046CAC:
	mov r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02046BDC

	thumb_func_start sub_02046CB4
sub_02046CB4: ; 0x02046CB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046CEA
	cmp r4, #0
	beq _02046CDE
	add r5, #0x80
	ldr r0, [r5]
	bl sub_02069D68
	bl sub_0205F6FC
	b _02046CEA
_02046CDE:
	add r5, #0x80
	ldr r0, [r5]
	bl sub_02069D68
	bl sub_0205F708
_02046CEA:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02046CB4

	thumb_func_start sub_02046CF0
sub_02046CF0: ; 0x02046CF0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046D08
	ldr r1, _02046D0C ; =sub_02046D40
	add r0, r4, #0
	bl SetupNativeScript
_02046D08:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02046D0C: .word sub_02046D40
	thumb_func_end sub_02046CF0

	thumb_func_start sub_02046D10
sub_02046D10: ; 0x02046D10
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046D3A
	add r5, #0x80
	ldr r0, [r5]
	mov r1, #0xfd
	ldr r0, [r0, #0x3c]
	bl sub_0205EE60
	add r1, r4, #0
	bl sub_0205FC94
_02046D3A:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02046D10

	thumb_func_start sub_02046D40
sub_02046D40: ; 0x02046D40
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069D68
	bl sub_02062198
	cmp r0, #0
	beq _02046D56
	mov r0, #1
	pop {r3, pc}
_02046D56:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02046D40

	thumb_func_start sub_02046D5C
sub_02046D5C: ; 0x02046D5C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	add r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0]
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldrb r4, [r1]
	bl sub_02069F88
	cmp r0, #0
	beq _02046DA2
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bl sub_0205C6DC
	add r5, #0x80
	add r7, r0, #0
	ldr r0, [r5]
	mov r1, #0xfd
	ldr r0, [r0, #0x3c]
	bl sub_0205EE60
	add r1, r0, #0
	add r0, r7, #0
	add r2, r6, #0
	add r3, r4, #0
	bl ov01_02205720
_02046DA2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02046D5C

	thumb_func_start sub_02046DA8
sub_02046DA8: ; 0x02046DA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046DF4
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069D68
	add r4, r0, #0
	bl sub_02069F7C
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	bl sub_02069FF4
	cmp r0, #0
	beq _02046DF4
	add r0, r4, #0
	mov r1, #1
	bl sub_02069E84
	add r0, r4, #0
	mov r1, #1
	bl sub_02069DEC
	add r5, #0x80
	ldr r0, [r5]
	mov r1, #1
	bl ov01_02205790
_02046DF4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02046DA8

	thumb_func_start sub_02046DF8
sub_02046DF8: ; 0x02046DF8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046E32
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069D68
	bl sub_02069F7C
	add r1, r4, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	bl sub_02069FF4
	cmp r0, #0
	beq _02046E32
	add r4, #0x80
	ldr r0, [r4]
	mov r1, #1
	bl ov01_02205790
_02046E32:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02046DF8

	thumb_func_start sub_02046E38
sub_02046E38: ; 0x02046E38
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046E58
	add r4, #0x80
	ldr r0, [r4]
	mov r1, #0xfd
	ldr r0, [r0, #0x3c]
	bl sub_0205EE60
	bl ov01_02205784
_02046E58:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02046E38

	thumb_func_start sub_02046E5C
sub_02046E5C: ; 0x02046E5C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	beq _02046E7C
	add r4, #0x80
	ldr r0, [r4]
	mov r1, #0xfd
	ldr r0, [r0, #0x3c]
	bl sub_0205EE60
	bl sub_020659CC
_02046E7C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02046E5C

	thumb_func_start sub_02046E80
sub_02046E80: ; 0x02046E80
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r4, #0x80
	ldr r0, [r4]
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x28]
	lsr r1, r1, #0x18
	bl ov01_021EACBC
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02046E80

	thumb_func_start sub_02046E9C
sub_02046E9C: ; 0x02046E9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r1, [r5, #8]
	add r2, r1, #1
	str r2, [r5, #8]
	ldrb r6, [r1]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #0x18]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	ldr r1, [sp, #0x10]
	lsl r3, r7, #0x18
	str r1, [sp]
	ldr r1, [sp, #0x14]
	add r5, #0x80
	str r1, [sp, #4]
	ldr r1, [sp, #0x18]
	add r2, r4, #0
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5]
	add r1, r6, #0
	lsr r3, r3, #0x18
	bl sub_02095DF4
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02046E9C

	thumb_func_start sub_02046F34
sub_02046F34: ; 0x02046F34
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	beq _02046F62
	mov r0, #0
	b _02046F64
_02046F62:
	mov r0, #0x61
_02046F64:
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02046F34

	thumb_func_start sub_02046F6C
sub_02046F6C: ; 0x02046F6C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202ED7C
	ldr r2, [r4, #8]
	add r1, r2, #1
	str r1, [r4, #8]
	ldrb r1, [r2]
	cmp r1, #0
	beq _02046FA2
	cmp r1, #1
	beq _02046F92
	cmp r1, #2
	beq _02046F9A
	b _02046FA2
_02046F92:
	mov r1, #1
	bl sub_0202EE00
	b _02046FA8
_02046F9A:
	mov r1, #2
	bl sub_0202EE00
	b _02046FA8
_02046FA2:
	mov r1, #0
	bl sub_0202EE00
_02046FA8:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02046F6C

	thumb_func_start sub_02046FAC
sub_02046FAC: ; 0x02046FAC
	push {r4, lr}
	ldr r4, [r0, #8]
	add r1, r4, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0202ED7C
	ldrb r1, [r4]
	bl sub_0202EE58
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02046FAC

	thumb_func_start sub_02046FC8
sub_02046FC8: ; 0x02046FC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202ED7C
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #0x4b
	bhs _02046FF8
	add r0, r4, #0
	bl sub_0202EF18
_02046FF8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02046FC8

	thumb_func_start sub_02046FFC
sub_02046FFC: ; 0x02046FFC
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202ED7C
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	cmp r5, #0x4b
	bhs _02047056
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202EEE4
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0xff
	bne _02047050
	mov r0, #0
	strh r0, [r4]
	b _0204705A
_02047050:
	mov r0, #1
	strh r0, [r4]
	b _0204705A
_02047056:
	mov r0, #0
	strh r0, [r4]
_0204705A:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02046FFC

	thumb_func_start sub_02047060
sub_02047060: ; 0x02047060
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02092DEC
	bl sub_02092DF4
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r5, #0x80
	add r1, r0, #0
	add r1, #0xd2
	ldrb r2, [r1]
	mov r1, #0x80
	add r0, #0xd2
	orr r1, r2
	strb r1, [r0]
	ldr r0, [r5]
	bl sub_02092DEC
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	lsl r1, r7, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #4]
	lsl r1, r4, #0x18
	lsr r1, r1, #0x18
	mov r2, #0xff
	mov r3, #0
	bl ov02_02251EB8
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02047060

	thumb_func_start sub_020470F4
sub_020470F4: ; 0x020470F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203EA84
	str r0, [r4]
	ldr r1, _0204711C ; =sub_02042974
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0204711C: .word sub_02042974
	thumb_func_end sub_020470F4

	thumb_func_start sub_02047120
sub_02047120: ; 0x02047120
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	bl sub_02092DEC
	bl sub_02092E10
	add r1, r0, #0
	add r0, r6, #0
	mov r2, #0x20
	bl sub_02095F94
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02047120

	thumb_func_start sub_02047168
sub_02047168: ; 0x02047168
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #8
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	bl sub_02092DEC
	bl sub_02092E10
	add r5, r0, #0
	ldrb r0, [r5]
	bl sub_02095FEC
	ldr r1, [sp]
	strh r0, [r1]
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _020471CE
	mov r0, #0
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020471CE:
	cmp r6, #4
	bls _020471D4
	mov r6, #0
_020471D4:
	ldrh r0, [r7]
	bl sub_020404C8
	add r1, r6, #1
	lsl r1, r1, #0x10
	lsr r5, r1, #0x10
	mov r1, #0xb9
	lsl r1, r1, #2
	cmp r0, r1
	blo _020471EC
	strh r5, [r4]
	b _02047208
_020471EC:
	ldrh r0, [r7]
	bl sub_020404C8
	bl sub_02040500
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _02047200
	strh r5, [r4]
	b _02047208
_02047200:
	ldrh r0, [r7]
	bl sub_020404EC
	strh r5, [r4]
_02047208:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02047168

	thumb_func_start sub_0204720C
sub_0204720C: ; 0x0204720C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202ED88
	lsl r1, r4, #0x18
	lsr r1, r1, #0x18
	mov r2, #0
	bl sub_0202F0C4
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204720C

	thumb_func_start sub_0204723C
sub_0204723C: ; 0x0204723C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	bl sub_02092DEC
	bl sub_02092E10
	ldrh r0, [r0, #8]
	cmp r0, #0x95
	bne _02047274
	bl LCRandom
	mov r1, #0xa
	bl _s32_div_f
	add r1, #0x95
	strh r1, [r4]
	b _02047276
_02047274:
	strh r0, [r4]
_02047276:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204723C

	thumb_func_start sub_0204727C
sub_0204727C: ; 0x0204727C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02092DEC
	bl sub_02092E10
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202ED88
	ldrb r1, [r4]
	add r5, r0, #0
	bl sub_0202F128
	strh r0, [r6]
	ldrb r1, [r4]
	add r0, r5, #0
	mov r2, #0
	bl sub_0202F100
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0204727C

	thumb_func_start sub_020472C4
sub_020472C4: ; 0x020472C4
	push {r3, r4, r5, lr}
	ldr r1, [r0, #8]
	add r5, r1, #1
	str r5, [r0, #8]
	ldrb r4, [r1]
	add r1, r5, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02092DEC
	ldrb r2, [r5]
	add r1, r4, #0
	bl sub_02092E14
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020472C4

	thumb_func_start sub_020472E8
sub_020472E8: ; 0x020472E8
	push {r4, lr}
	ldr r4, [r0, #8]
	add r1, r4, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0202ED88
	ldrb r1, [r4]
	bl sub_0202F050
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_020472E8

	thumb_func_start sub_02047304
sub_02047304: ; 0x02047304
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_0206A798
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02047304

	thumb_func_start sub_0204731C
sub_0204731C: ; 0x0204731C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202FA64
	bl sub_0202FAB0
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204731C

	thumb_func_start sub_02047348
sub_02047348: ; 0x02047348
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0206A860
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047348

	thumb_func_start sub_02047358
sub_02047358: ; 0x02047358
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r0, #0x80
	ldr r4, [r0]
	ldr r5, _020473D4 ; =0x020FACDC
	add r3, sp, #4
	mov r2, #4
_02047366:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02047366
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x73
	bl sub_020403FC
	cmp r0, #0
	beq _0204738E
	mov r7, #0
	b _020473A8
_0204738E:
	add r0, r4, #0
	mov r1, #0x99
	bl sub_020403FC
	cmp r0, #0
	beq _0204739E
	mov r7, #1
	b _020473A8
_0204739E:
	cmp r5, #0
	ble _020473A6
	mov r7, #2
	b _020473A8
_020473A6:
	mov r7, #3
_020473A8:
	mov r6, #0
	cmp r7, #0
	ble _020473CC
	add r5, sp, #4
_020473B0:
	ldr r0, [r4, #0x54]
	mov r1, #0x8d
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	add r2, r5, #0
	mov r3, #0
	bl ov01_021F3C0C
	add r6, r6, #1
	add r5, #0xc
	cmp r6, r7
	blt _020473B0
_020473CC:
	mov r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020473D4: .word 0x020FACDC
	thumb_func_end sub_02047358

	thumb_func_start sub_020473D8
sub_020473D8: ; 0x020473D8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	add r1, r6, #0
	ldr r0, [r0, #0x3c]
	bl sub_0205EE60
	cmp r0, #0
	beq _0204740C
	bl sub_0205F2A8
	b _0204740E
_0204740C:
	mov r0, #0
_0204740E:
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020473D8

	thumb_func_start sub_02047414
sub_02047414: ; 0x02047414
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_0224EF80
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047414

	thumb_func_start sub_02047424
sub_02047424: ; 0x02047424
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r4, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r0, [r1]
	cmp r0, #3
	bhi _0204747E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0204744C: ; jump table
	.short _0204747E - _0204744C - 2 ; case 0
	.short _02047454 - _0204744C - 2 ; case 1
	.short _02047462 - _0204744C - 2 ; case 2
	.short _02047470 - _0204744C - 2 ; case 3
_02047454:
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203EEE4
	str r0, [r4]
	b _0204748A
_02047462:
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203EF40
	str r0, [r4]
	b _0204748A
_02047470:
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203EFA0
	str r0, [r4]
	b _0204748A
_0204747E:
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203EEA0
	str r0, [r4]
_0204748A:
	ldr r1, _02047498 ; =sub_02042974
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02047498: .word sub_02042974
	thumb_func_end sub_02047424

	thumb_func_start sub_0204749C
sub_0204749C: ; 0x0204749C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl sub_020402F0
	ldr r1, [r5, #8]
	add r4, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r1, [r1]
	cmp r1, #4
	bls _020474BA
	mov r1, #0
_020474BA:
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203EC04
	str r0, [r4]
	ldr r1, _020474D4 ; =sub_02042974
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_020474D4: .word sub_02042974
	thumb_func_end sub_0204749C

	thumb_func_start sub_020474D8
sub_020474D8: ; 0x020474D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r1, [r5, #8]
	add r2, r1, #1
	str r2, [r5, #8]
	ldrb r7, [r1]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r6, [r2]
	bl ScriptReadHalfword
	str r0, [sp, #8]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	str r4, [sp]
	add r5, #0x80
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r3, [sp, #8]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_020977CC
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_020474D8

	thumb_func_start sub_02047518
sub_02047518: ; 0x02047518
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r1, [r5, #8]
	add r2, r1, #1
	str r2, [r5, #8]
	ldrb r7, [r1]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r6, [r2]
	bl ScriptReadHalfword
	str r0, [sp, #8]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	str r4, [sp]
	add r5, #0x80
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r3, [sp, #8]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_020979A8
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02047518

	thumb_func_start sub_02047558
sub_02047558: ; 0x02047558
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_02097BE0
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02047558

	thumb_func_start sub_02047570
sub_02047570: ; 0x02047570
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	bl GetIdxOfFirstAliveMonInParty_CrashIfNone
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02047570

	thumb_func_start sub_0204759C
sub_0204759C: ; 0x0204759C
	push {r3, lr}
	ldr r1, [r0, #8]
	add r3, r1, #1
	str r3, [r0, #8]
	ldrb r1, [r1]
	add r2, r3, #1
	str r2, [r0, #8]
	add r0, #0x80
	ldrb r2, [r3]
	ldr r0, [r0]
	bl ov01_022060B8
	cmp r0, #0
	beq _020475BC
	mov r0, #1
	pop {r3, pc}
_020475BC:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0204759C

	thumb_func_start sub_020475C0
sub_020475C0: ; 0x020475C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	bl sub_02069F88
	cmp r0, #0
	beq _020475E6
	mov r0, #1
	b _020475E8
_020475E6:
	mov r0, #0
_020475E8:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020475C0

	thumb_func_start sub_020475F0
sub_020475F0: ; 0x020475F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02069F88
	cmp r0, #0
	bne _0204761A
	mov r0, #1
	strh r0, [r4]
	b _02047630
_0204761A:
	add r5, #0x80
	ldr r0, [r5]
	bl ov01_022057C4
	cmp r0, #0
	beq _0204762C
	mov r0, #1
	strh r0, [r4]
	b _02047630
_0204762C:
	mov r0, #0
	strh r0, [r4]
_02047630:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020475F0

	thumb_func_start sub_02047634
sub_02047634: ; 0x02047634
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_022508B4
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047634

	thumb_func_start sub_02047644
sub_02047644: ; 0x02047644
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r1, [r0]
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	ldrsb r1, [r2, r1]
	bl sub_0206A1F4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047644

	thumb_func_start sub_02047664
sub_02047664: ; 0x02047664
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r6, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	add r1, r6, #0
	bl ov02_02250780
	cmp r0, #0
	beq _02047694
	mov r0, #1
	b _02047696
_02047694:
	mov r0, #0
_02047696:
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02047664

	thumb_func_start sub_0204769C
sub_0204769C: ; 0x0204769C
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov02_022507B4
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0204769C

	thumb_func_start sub_020476B4
sub_020476B4: ; 0x020476B4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	add r0, r4, #0
	bl ov01_021F6B00
	cmp r0, #3
	bne _020476CA
	mov r0, #0
	pop {r3, r4, r5, pc}
_020476CA:
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl ov01_021F6A9C
	ldr r1, _020476E4 ; =sub_020476E8
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #3
	str r0, [r4, #0x1c]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020476E4: .word sub_020476E8
	thumb_func_end sub_020476B4

	thumb_func_start sub_020476E8
sub_020476E8: ; 0x020476E8
	push {r3, r4, r5, lr}
	add r1, r0, #0
	add r0, #0x80
	ldr r1, [r1, #0x64]
	ldr r4, [r0]
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r0, r4, #0
	bl ov01_021F6B00
	add r5, r0, #0
	add r0, r4, #0
	bl ov01_021F6B10
	cmp r5, #3
	bne _02047716
	cmp r0, #1
	bne _02047716
	mov r0, #1
	pop {r3, r4, r5, pc}
_02047716:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020476E8

	thumb_func_start sub_0204771C
sub_0204771C: ; 0x0204771C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov01_021F6A9C
	ldr r1, _02047740 ; =sub_02047744
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #0
	str r0, [r4, #0x1c]
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02047740: .word sub_02047744
	thumb_func_end sub_0204771C

	thumb_func_start sub_02047744
sub_02047744: ; 0x02047744
	push {r3, r4, r5, lr}
	add r1, r0, #0
	add r0, #0x80
	ldr r1, [r1, #0x64]
	ldr r4, [r0]
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r0, r4, #0
	bl ov01_021F6B00
	add r5, r0, #0
	add r0, r4, #0
	bl ov01_021F6B10
	cmp r5, #0
	bne _02047772
	cmp r0, #1
	bne _02047772
	mov r0, #1
	pop {r3, r4, r5, pc}
_02047772:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02047744

	thumb_func_start sub_02047778
sub_02047778: ; 0x02047778
	push {r4, lr}
	add r1, r0, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0203E33C
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02047778

	thumb_func_start sub_02047790
sub_02047790: ; 0x02047790
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	mov r1, #3
	add r3, r4, #0
	str r0, [r4, #0x64]
	add r0, r5, #0
	add r2, r1, #0
	add r3, #0x68
	bl ov01_021F6ABC
	ldr r1, _020477BC ; =sub_020477C0
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_020477BC: .word sub_020477C0
	thumb_func_end sub_02047790

	thumb_func_start sub_020477C0
sub_020477C0: ; 0x020477C0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r1, [r5, #0x64]
	ldr r4, [r0]
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ov01_021F6B00
	add r7, r0, #0
	add r0, r4, #0
	bl ov01_021F6AEC
	cmp r7, #3
	bne _020477F4
	cmp r0, #6
	bne _020477F4
	ldr r0, [r5, #0x68]
	strh r0, [r6]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020477F4:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020477C0

	thumb_func_start sub_020477F8
sub_020477F8: ; 0x020477F8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ov01_021F6B20
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl sub_02041770
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020477F8

	thumb_func_start sub_02047814
sub_02047814: ; 0x02047814
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ov01_021F6B20
	add r1, r0, #0
	ldr r2, [r4, #0x78]
	add r0, r4, #0
	bl sub_02041770
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02047814

	thumb_func_start sub_02047830
sub_02047830: ; 0x02047830
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ov01_021F6B20
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r3, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	add r2, r7, #0
	bl ov01_021EDF9C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02047830

	thumb_func_start sub_02047888
sub_02047888: ; 0x02047888
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	add r0, r4, #0
	bl ov01_021F6B20
	ldr r1, [r5, #0x64]
	add r6, r0, #0
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r3, r0, #0
	add r0, r4, #0
	mov r1, #3
	mov r2, #7
	bl ov01_021F6ABC
	ldr r1, _020478C8 ; =sub_02047908
	ldr r2, [r6]
	add r0, r4, #0
	bl ov01_021F6B34
	ldr r1, _020478CC ; =sub_020478D0
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_020478C8: .word sub_02047908
_020478CC: .word sub_020478D0
	thumb_func_end sub_02047888

	thumb_func_start sub_020478D0
sub_020478D0: ; 0x020478D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	add r0, r6, #0
	bl ov01_021F6B20
	ldr r1, [r5, #0x64]
	add r4, r0, #0
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl GetVarPointer
	ldrh r1, [r0]
	ldr r0, _02047904 ; =0x0000EEEE
	cmp r1, r0
	bne _020478F8
	mov r0, #0
	pop {r4, r5, r6, pc}
_020478F8:
	ldr r0, [r4]
	bl ov01_021EDF00
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_02047904: .word 0x0000EEEE
	thumb_func_end sub_020478D0

	thumb_func_start sub_02047908
sub_02047908: ; 0x02047908
	push {r3, lr}
	bl ov01_021EEF9C
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047908

	thumb_func_start sub_02047914
sub_02047914: ; 0x02047914
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r6, r1, #0
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetMoney
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0202ED88
	mov r1, #0
	add r2, r1, #0
	bl sub_0202F14C
	cmp r6, #0
	beq _0204793E
	cmp r6, #1
	beq _0204794A
	b _02047956
_0204793E:
	ldr r1, _02047960 ; =0x000F423F
	sub r7, r1, r0
	cmp r4, r7
	bhi _0204795A
	add r7, r4, #0
	b _0204795A
_0204794A:
	ldr r1, _02047960 ; =0x000F423F
	sub r7, r1, r4
	cmp r0, r7
	bhi _0204795A
	add r7, r0, #0
	b _0204795A
_02047956:
	bl GF_AssertFail
_0204795A:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02047960: .word 0x000F423F
	thumb_func_end sub_02047914

	thumb_func_start sub_02047964
sub_02047964: ; 0x02047964
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	mov r0, #4
	mov r1, #8
	bl AllocFromHeap
	str r0, [r4]
	add r4, r0, #0
	mov r0, #4
	mov r1, #8
	bl AllocFromHeap
	str r0, [r4]
	add r0, r5, #0
	str r6, [r4, #4]
	add r0, #0x80
	ldr r0, [r0]
	add r1, r6, #0
	bl sub_02047914
	ldr r1, [r4]
	str r0, [r1]
	mov r1, #0
	ldr r0, [r4]
	mvn r1, r1
	str r1, [r0, #4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r2, [r4]
	mov r1, #5
	bl ov01_021F6A9C
	ldr r1, _020479D0 ; =sub_020479D4
	add r0, r5, #0
	str r7, [r5, #0x64]
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020479D0: .word sub_020479D4
	thumb_func_end sub_02047964

	thumb_func_start sub_020479D4
sub_020479D4: ; 0x020479D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl sub_020402F0
	str r0, [sp]
	add r0, r5, #0
	ldr r1, [r5, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r7, r0, #0
	ldr r0, [sp]
	ldr r4, [r0]
	ldr r0, [r4]
	ldr r6, [r0, #4]
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _02047A0A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02047A0A:
	cmp r6, #0
	bne _02047A14
	mov r0, #1
	strh r0, [r7]
	b _02047A6A
_02047A14:
	add r5, #0x80
	ldr r0, [r5]
	ldr r5, [r0, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02047A26
	cmp r0, #1
	beq _02047A44
	b _02047A62
_02047A26:
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r6, #0
	bl PlayerProfile_SubMoney
	add r0, r5, #0
	bl sub_0202ED88
	ldr r2, [r4]
	mov r1, #2
	ldr r2, [r2, #4]
	bl sub_0202F14C
	b _02047A66
_02047A44:
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r6, #0
	bl PlayerProfile_AddMoney
	add r0, r5, #0
	bl sub_0202ED88
	ldr r2, [r4]
	mov r1, #3
	ldr r2, [r2, #4]
	bl sub_0202F14C
	b _02047A66
_02047A62:
	bl GF_AssertFail
_02047A66:
	mov r0, #0
	strh r0, [r7]
_02047A6A:
	ldr r0, [r4]
	bl FreeToHeap
	ldr r0, [sp]
	ldr r0, [r0]
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020479D4

	thumb_func_start sub_02047A7C
sub_02047A7C: ; 0x02047A7C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	cmp r6, #0
	bne _02047AC2
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202ED88
	mov r1, #0
	add r2, r1, #0
	bl sub_0202F14C
	ldr r1, _02047AE4 ; =0x000F423F
	cmp r0, r1
	bne _02047ABC
	mov r0, #1
	strh r0, [r4]
	b _02047AE0
_02047ABC:
	mov r0, #0
	strh r0, [r4]
	b _02047AE0
_02047AC2:
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetMoney
	ldr r1, _02047AE4 ; =0x000F423F
	cmp r0, r1
	bne _02047ADC
	mov r0, #1
	strh r0, [r4]
	b _02047AE0
_02047ADC:
	mov r0, #0
	strh r0, [r4]
_02047AE0:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02047AE4: .word 0x000F423F
	thumb_func_end sub_02047A7C

	thumb_func_start sub_02047AE8
sub_02047AE8: ; 0x02047AE8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	lsl r1, r4, #0x18
	add r5, #0x80
	add r3, r0, #0
	ldr r0, [r5]
	lsr r1, r1, #0x18
	add r2, r6, #0
	bl ov01_02204C44
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02047AE8

	thumb_func_start sub_02047B38
sub_02047B38: ; 0x02047B38
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl ov01_02204ED8
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02047B38

	thumb_func_start sub_02047B5C
sub_02047B5C: ; 0x02047B5C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02250A60
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047B5C

	thumb_func_start sub_02047B6C
sub_02047B6C: ; 0x02047B6C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02250AC8
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047B6C

	thumb_func_start sub_02047B7C
sub_02047B7C: ; 0x02047B7C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02250AE8
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047B7C

	thumb_func_start sub_02047B8C
sub_02047B8C: ; 0x02047B8C
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	lsl r0, r0, #0x18
	add r4, #0x80
	lsr r1, r0, #0x18
	ldr r0, [r4]
	bl ov02_02250AFC
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02047B8C

	thumb_func_start sub_02047BA4
sub_02047BA4: ; 0x02047BA4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02250B80
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047BA4

	thumb_func_start sub_02047BB4
sub_02047BB4: ; 0x02047BB4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02250B30
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047BB4

	thumb_func_start sub_02047BC4
sub_02047BC4: ; 0x02047BC4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	lsl r0, r0, #0x18
	add r4, #0x80
	lsr r1, r0, #0x18
	ldr r0, [r4]
	bl ov02_02251424
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02047BC4

	thumb_func_start sub_02047BDC
sub_02047BDC: ; 0x02047BDC
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	lsl r0, r0, #0x18
	add r4, #0x80
	lsr r1, r0, #0x18
	ldr r0, [r4]
	bl ov02_022514C8
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02047BDC

	thumb_func_start sub_02047BF4
sub_02047BF4: ; 0x02047BF4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02251554
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047BF4

	thumb_func_start sub_02047C04
sub_02047C04: ; 0x02047C04
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_022515A4
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047C04

	thumb_func_start sub_02047C14
sub_02047C14: ; 0x02047C14
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_022518E0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047C14

	thumb_func_start sub_02047C24
sub_02047C24: ; 0x02047C24
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02251B14
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047C24

	thumb_func_start sub_02047C34
sub_02047C34: ; 0x02047C34
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02251CF0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047C34

	thumb_func_start sub_02047C44
sub_02047C44: ; 0x02047C44
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02251DC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047C44

	thumb_func_start sub_02047C54
sub_02047C54: ; 0x02047C54
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02251DE8
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047C54

	thumb_func_start sub_02047C64
sub_02047C64: ; 0x02047C64
	push {r4, lr}
	ldr r4, [r0, #8]
	add r1, r4, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0202ED34
	ldrb r1, [r4]
	bl sub_0202ED58
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02047C64

	thumb_func_start sub_02047C80
sub_02047C80: ; 0x02047C80
	push {r3, lr}
	ldr r1, [r0, #8]
	add r3, r1, #1
	str r3, [r0, #8]
	ldrb r2, [r1]
	add r1, r3, #1
	str r1, [r0, #8]
	ldrb r0, [r3]
	cmp r2, #5
	blo _02047C98
	mov r0, #0
	pop {r3, pc}
_02047C98:
	cmp r0, #0
	bne _02047CAA
	ldr r0, _02047CB8 ; =0x020FACB0
	lsl r1, r2, #2
	ldr r0, [r0, r1]
	mov r1, #2
	bl HandleLoadOverlay
	b _02047CB4
_02047CAA:
	ldr r0, _02047CB8 ; =0x020FACB0
	lsl r1, r2, #2
	ldr r0, [r0, r1]
	bl UnloadOverlayByID
_02047CB4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02047CB8: .word 0x020FACB0
	thumb_func_end sub_02047C80

	thumb_func_start sub_02047CBC
sub_02047CBC: ; 0x02047CBC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadWord
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202ED88
	mov r1, #0
	add r2, r1, #0
	bl sub_0202F14C
	cmp r0, r6
	blo _02047CF4
	mov r0, #1
	b _02047CF6
_02047CF4:
	mov r0, #0
_02047CF6:
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02047CBC

	thumb_func_start sub_02047CFC
sub_02047CFC: ; 0x02047CFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	add r1, r0, #0
	add r5, #0x80
	ldr r0, [r5]
	ldr r1, [r1]
	add r2, r4, #0
	bl ov03_022566D0
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02047CFC

	thumb_func_start sub_02047D24
sub_02047D24: ; 0x02047D24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	add r1, r0, #0
	add r5, #0x80
	ldrh r2, [r4]
	ldr r0, [r5]
	ldr r1, [r1]
	bl ov03_022566D0
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02047D24

	thumb_func_start sub_02047D58
sub_02047D58: ; 0x02047D58
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r1, r0, #0
	add r4, #0x80
	ldrh r1, [r1]
	ldr r0, [r4]
	bl ov03_02256710
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02047D58

	thumb_func_start sub_02047D7C
sub_02047D7C: ; 0x02047D7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x28
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r1, r0, #0
	add r5, #0x80
	ldrh r1, [r1]
	ldr r0, [r5]
	bl ov01_021EEF68
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02047D7C

	thumb_func_start sub_02047DB0
sub_02047DB0: ; 0x02047DB0
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x28
	bl sub_020402F0
	ldr r0, [r0]
	bl ov01_021EEF88
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047DB0

	thumb_func_start sub_02047DC8
sub_02047DC8: ; 0x02047DC8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	add r1, r0, #0
	add r5, #0x80
	ldrh r2, [r4]
	ldr r0, [r5]
	ldr r1, [r1]
	bl ov03_02256A2C
	strh r0, [r6]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02047DC8

	thumb_func_start sub_02047E14
sub_02047E14: ; 0x02047E14
	push {r3, lr}
	mov r0, #0x4b
	bl sub_02004B24
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02047E14

	thumb_func_start sub_02047E20
sub_02047E20: ; 0x02047E20
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl ov02_022523B4
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02047E20

	thumb_func_start sub_02047E30
sub_02047E30: ; 0x02047E30
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_02252534
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047E30

	thumb_func_start sub_02047E40
sub_02047E40: ; 0x02047E40
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066A1C
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02047E40

	thumb_func_start sub_02047E54
sub_02047E54: ; 0x02047E54
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov02_022529FC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047E54

	thumb_func_start sub_02047E64
sub_02047E64: ; 0x02047E64
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov02_02252EE4
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047E64

	thumb_func_start sub_02047E7C
sub_02047E7C: ; 0x02047E7C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0206DCC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047E7C

	thumb_func_start sub_02047E8C
sub_02047E8C: ; 0x02047E8C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov04_02256ED8
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047E8C

	thumb_func_start sub_02047E9C
sub_02047E9C: ; 0x02047E9C
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldrb r1, [r2]
	ldr r0, [r0]
	bl ov04_02256F00
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047E9C

	thumb_func_start sub_02047EB4
sub_02047EB4: ; 0x02047EB4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	bl ov03_02258910
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02047EB4

	thumb_func_start sub_02047EC4
sub_02047EC4: ; 0x02047EC4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl sub_020402F0
	add r7, r0, #0
	mov r0, #4
	bl PlayerProfile_new
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202F57C
	add r1, r4, #0
	bl sub_0202F844
	ldrh r1, [r6]
	ldr r0, [r7]
	add r2, r4, #0
	bl BufferPlayersName
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02047EC4

	thumb_func_start sub_02047F14
sub_02047F14: ; 0x02047F14
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0202F57C
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0202F890
	add r0, r5, #0
	bl sub_0202F888
	cmp r0, #0
	beq _02047F4A
	mov r0, #1
	b _02047F4C
_02047F4A:
	mov r0, #0
_02047F4C:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02047F14

	thumb_func_start sub_02047F54
sub_02047F54: ; 0x02047F54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	bl ov01_02206268
	cmp r0, #0
	beq _02047F7A
	mov r0, #1
	b _02047F7C
_02047F7A:
	mov r0, #0
_02047F7C:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02047F54

	thumb_func_start sub_02047F84
sub_02047F84: ; 0x02047F84
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl ov02_02253134
	cmp r0, #1
	bne _02047FAC
	mov r0, #1
	b _02047FAE
_02047FAC:
	mov r0, #0
_02047FAE:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02047F84

	thumb_func_start sub_02047FB4
sub_02047FB4: ; 0x02047FB4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	bl ov02_0225316C
	strh r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02047FB4

	thumb_func_start sub_02047FD4
sub_02047FD4: ; 0x02047FD4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl ov02_02253188
	cmp r0, #1
	bne _02047FFC
	mov r0, #1
	b _02047FFE
_02047FFC:
	mov r0, #0
_02047FFE:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02047FD4

	thumb_func_start sub_02048004
sub_02048004: ; 0x02048004
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl ov02_022531B4
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02048004

	thumb_func_start sub_0204802C
sub_0204802C: ; 0x0204802C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	mov r1, #0
	ldr r0, [r0, #0xc]
	bl sub_020291A4
	cmp r0, #0
	beq _02048056
	mov r0, #1
	b _02048058
_02048056:
	mov r0, #0
_02048058:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204802C
