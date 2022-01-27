#include "msgdata/msg/msg_0287.h"
#include "mail_message.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public _020F677C

	.text

	thumb_func_start sub_0202AB18
sub_0202AB18: ; 0x0202AB18
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp]
	str r3, [sp, #4]
	add r4, r0, #0
	ldr r0, [sp]
	mov ip, r2
	cmp r0, #2
	bhi _0202ABA2
	lsl r7, r0, #1
	ldr r0, _0202ABA8 ; =_020F677C + 1
	ldrb r6, [r0, r7]
	ldr r0, _0202ABAC ; =_020F677C
	ldrb r0, [r0, r7]
	str r0, [sp, #8]
	add r0, r0, r6
	ldr r3, [sp, #8]
	sub r5, r0, #1
	add r0, r3, #0
	cmp r0, r5
	bgt _0202AB60
	mov r0, #0xa
	lsl r0, r0, #6
_0202AB46:
	add r2, r4, r3
	ldrb r1, [r2, r0]
	cmp r1, #0xff
	bne _0202AB5A
	mov r1, #0xa
	ldr r0, [sp, #4]
	lsl r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0202AB5A:
	add r3, r3, #1
	cmp r3, r5
	ble _0202AB46
_0202AB60:
	add r1, r6, #1
	mov r0, ip
	cmp r0, r1
	bne _0202AB80
	ldr r1, [sp]
	add r0, r4, #0
	bl sub_0202AA9C
	ldr r0, [sp, #8]
	mov r1, #0xa
	add r2, r4, r0
	ldr r0, [sp, #4]
	lsl r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0202AB80:
	mov r0, #0xa
	ldr r2, _0202ABAC ; =_020F677C
	lsl r0, r0, #6
	add r1, r4, r0
	ldr r0, [sp, #8]
	ldrb r2, [r2, r7]
	add r0, r0, #1
	add r0, r1, r0
	add r1, r1, r2
	sub r2, r6, #1
	bl MI_CpuCopy8
	mov r1, #0xa
	ldr r0, [sp, #4]
	add r2, r4, r5
	lsl r1, r1, #6
	strb r0, [r2, r1]
_0202ABA2:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0202ABA8: .word _020F677C + 1
_0202ABAC: .word _020F677C
	thumb_func_end sub_0202AB18

	thumb_func_start sub_0202ABB0
sub_0202ABB0: ; 0x0202ABB0
	mov r3, #0xb6
	lsl r3, r3, #2
	str r1, [r0, r3]
	add r1, r3, #4
	strb r2, [r0, r1]
	bx lr
	thumb_func_end sub_0202ABB0

	thumb_func_start sub_0202ABBC
sub_0202ABBC: ; 0x0202ABBC
	push {r3, r4}
	mov r3, #0xb6
	lsl r3, r3, #2
	ldr r4, [r0, r3]
	str r4, [r1]
	add r1, r3, #4
	ldrb r0, [r0, r1]
	strb r0, [r2]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_0202ABBC

	thumb_func_start sub_0202ABD0
sub_0202ABD0: ; 0x0202ABD0
	mov r2, #0x2a
	lsl r2, r2, #4
	ldrh r3, [r0, r2]
	strh r3, [r1]
	add r3, r2, #2
	ldrh r3, [r0, r3]
	strh r3, [r1, #2]
	add r3, r2, #4
	ldrh r3, [r0, r3]
	add r2, r2, #6
	strh r3, [r1, #4]
	ldrh r0, [r0, r2]
	strh r0, [r1, #6]
	bx lr
	thumb_func_end sub_0202ABD0

	thumb_func_start sub_0202ABEC
sub_0202ABEC: ; 0x0202ABEC
	push {r3, r4}
	ldrh r3, [r1]
	mov r2, #0x2a
	lsl r2, r2, #4
	strh r3, [r0, r2]
	ldrh r4, [r1, #2]
	add r3, r2, #2
	strh r4, [r0, r3]
	ldrh r4, [r1, #4]
	add r3, r2, #4
	strh r4, [r0, r3]
	ldrh r3, [r1, #6]
	add r1, r2, #6
	strh r3, [r0, r1]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_0202ABEC

	thumb_func_start sub_0202AC0C
sub_0202AC0C: ; 0x0202AC0C
	ldr r2, _0202AC18 ; =0x0000029B
	ldrb r0, [r0, r2]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1c
	strb r0, [r1]
	bx lr
	.balign 4, 0
_0202AC18: .word 0x0000029B
	thumb_func_end sub_0202AC0C

	thumb_func_start sub_0202AC1C
sub_0202AC1C: ; 0x0202AC1C
	push {r3, r4}
	ldr r3, _0202AC34 ; =0x0000029B
	lsl r1, r1, #0x1c
	ldrb r4, [r0, r3]
	mov r2, #0x1e
	lsr r1, r1, #0x1b
	bic r4, r2
	orr r1, r4
	strb r1, [r0, r3]
	pop {r3, r4}
	bx lr
	nop
_0202AC34: .word 0x0000029B
	thumb_func_end sub_0202AC1C

	thumb_func_start sub_0202AC38
sub_0202AC38: ; 0x0202AC38
	push {r3, r4, r5, r6}
	sub r4, r1, #1
	lsl r1, r4, #2
	mov r5, #0xaa
	add r1, r0, r1
	lsl r5, r5, #2
	ldr r6, [r1, r5]
	add r0, r0, r4
	str r6, [r2]
	add r2, r5, #0
	add r2, #0x14
	ldr r1, [r1, r2]
	add r5, #0x28
	str r1, [r3]
	ldrb r1, [r0, r5]
	ldr r0, [sp, #0x10]
	strb r1, [r0]
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202AC38

	thumb_func_start sub_0202AC60
sub_0202AC60: ; 0x0202AC60
	push {r4, r5}
	sub r1, r1, #1
	lsl r4, r1, #2
	add r5, r0, r4
	mov r4, #0xaa
	lsl r4, r4, #2
	str r2, [r5, r4]
	add r2, r4, #0
	add r2, #0x14
	str r3, [r5, r2]
	ldr r2, _0202AC84 ; =0xFFFFFFF8
	add r0, r0, r1
	add r2, sp
	ldrb r2, [r2, #0x10]
	add r4, #0x28
	strb r2, [r0, r4]
	pop {r4, r5}
	bx lr
	.balign 4, 0
_0202AC84: .word 0xFFFFFFF8
	thumb_func_end sub_0202AC60
