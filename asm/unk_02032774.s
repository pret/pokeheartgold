	.include "asm/macros.inc"
	.include "global.inc"

	.text

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
