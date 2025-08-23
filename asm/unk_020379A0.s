	.include "asm/macros.inc"
	.include "unk_020379A0.inc"
	.include "global.inc"

	.bss

_021D414C:
	.space 0x4

	.text

	thumb_func_start sub_020379A0
sub_020379A0: ; 0x020379A0
	push {r4, lr}
	ldr r1, _020379F0 ; =_021D414C
	ldr r1, [r1]
	cmp r1, #0
	bne _020379C0
	mov r1, #0x99
	lsl r1, r1, #2
	bl AllocFromHeap
	ldr r1, _020379F0 ; =_021D414C
	mov r2, #0x99
	str r0, [r1]
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
_020379C0:
	ldr r1, _020379F0 ; =_021D414C
	mov r3, #0
	mov r0, #0xff
_020379C6:
	ldr r2, [r1]
	add r2, r2, r3
	add r3, r3, #1
	strb r0, [r2, #0x10]
	cmp r3, #8
	blt _020379C6
	ldr r3, _020379F0 ; =_021D414C
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
_020379F0: .word _021D414C
_020379F4: .word 0x00000261
	thumb_func_end sub_020379A0

	thumb_func_start sub_020379F8
sub_020379F8: ; 0x020379F8
	push {r3, lr}
	ldr r0, _02037A0C ; =_021D414C
	ldr r0, [r0]
	bl Heap_Free
	ldr r0, _02037A0C ; =_021D414C
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	nop
_02037A0C: .word _021D414C
	thumb_func_end sub_020379F8

	thumb_func_start sub_02037A10
sub_02037A10: ; 0x02037A10
	ldr r0, _02037A20 ; =_021D414C
	ldr r0, [r0]
	cmp r0, #0
	beq _02037A1C
	mov r0, #1
	bx lr
_02037A1C:
	mov r0, #0
	bx lr
	.balign 4, 0
_02037A20: .word _021D414C
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
	ldr r6, _02037A94 ; =_021D414C
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
	ldr r0, _02037A94 ; =_021D414C
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0x26
	lsl r0, r0, #4
	strb r2, [r1, r0]
_02037A8E:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02037A94: .word _021D414C
	thumb_func_end sub_02037A24

	thumb_func_start sub_02037A98
sub_02037A98: ; 0x02037A98
	ldr r0, _02037AA8 ; =_021D414C
	ldrb r3, [r2, #1]
	ldr r1, [r0]
	ldrb r0, [r2]
	add r0, r1, r0
	strb r3, [r0, #0x10]
	bx lr
	nop
_02037AA8: .word _021D414C
	thumb_func_end sub_02037A98

	thumb_func_start sub_02037AAC
sub_02037AAC: ; 0x02037AAC
	ldr r0, _02037AB8 ; =_021D414C
	ldrb r2, [r2]
	ldr r1, [r0]
	ldr r0, _02037ABC ; =0x00000261
	strb r2, [r1, r0]
	bx lr
	.balign 4, 0
_02037AB8: .word _021D414C
_02037ABC: .word 0x00000261
	thumb_func_end sub_02037AAC

	thumb_func_start sub_02037AC0
sub_02037AC0: ; 0x02037AC0
	ldr r2, _02037AD4 ; =_021D414C
	ldr r1, _02037AD8 ; =0x00000262
	ldr r3, [r2]
	strb r0, [r3, r1]
	ldr r2, [r2]
	mov r3, #1
	add r0, r1, #1
	strb r3, [r2, r0]
	bx lr
	nop
_02037AD4: .word _021D414C
_02037AD8: .word 0x00000262
	thumb_func_end sub_02037AC0

	thumb_func_start sub_02037ADC
sub_02037ADC: ; 0x02037ADC
	push {r3, lr}
	ldr r0, _02037B30 ; =_021D414C
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
	ldr r0, _02037B30 ; =_021D414C
	mov r2, #0
	ldr r1, [r0]
	ldr r0, _02037B34 ; =0x00000263
	strb r2, [r1, r0]
_02037B06:
	ldr r0, _02037B30 ; =_021D414C
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
	ldr r0, _02037B30 ; =_021D414C
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x26
	lsl r0, r0, #4
	strb r2, [r1, r0]
_02037B2C:
	pop {r3, pc}
	nop
_02037B30: .word _021D414C
_02037B34: .word 0x00000263
	thumb_func_end sub_02037ADC

	thumb_func_start sub_02037B38
sub_02037B38: ; 0x02037B38
	ldr r1, _02037B54 ; =_021D414C
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
_02037B54: .word _021D414C
_02037B58: .word 0x00000261
	thumb_func_end sub_02037B38

	thumb_func_start sub_02037B5C
sub_02037B5C: ; 0x02037B5C
	ldr r1, _02037B68 ; =_021D414C
	ldr r1, [r1]
	add r0, r1, r0
	ldrb r0, [r0, #0x10]
	bx lr
	nop
_02037B68: .word _021D414C
	thumb_func_end sub_02037B5C

	thumb_func_start sub_02037B6C
sub_02037B6C: ; 0x02037B6C
	push {r3, r4}
	lsl r4, r0, #1
	ldr r0, _02037B84 ; =_021D414C
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
_02037B84: .word _021D414C
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
	ldr r2, _02037BC4 ; =_021D414C
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
_02037BC4: .word _021D414C
	thumb_func_end sub_02037BA0

	thumb_func_start sub_02037BC8
sub_02037BC8: ; 0x02037BC8
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r6, _02037BE8 ; =_021D414C
	add r5, r4, #0
	add r7, r4, #0
_02037BD2:
	ldr r0, [r6]
	add r1, r7, #0
	add r0, r0, r5
	mov r2, #2
	bl MI_CpuFill8
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #8
	blt _02037BD2
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02037BE8: .word _021D414C
	thumb_func_end sub_02037BC8

	thumb_func_start sub_02037BEC
sub_02037BEC: ; 0x02037BEC
	push {r3, r4}
	mov r4, #0
	mov r0, #0x96
	ldr r1, _02037C08 ; =_021D414C
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
_02037C08: .word _021D414C
	thumb_func_end sub_02037BEC

	thumb_func_start sub_02037C0C
sub_02037C0C: ; 0x02037C0C
	push {r4, lr}
	ldr r2, _02037C40 ; =_021D414C
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
	bl MI_CpuCopy8
	ldr r1, _02037C40 ; =_021D414C
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
_02037C40: .word _021D414C
	thumb_func_end sub_02037C0C

	thumb_func_start sub_02037C44
sub_02037C44: ; 0x02037C44
	ldr r1, _02037C64 ; =_021D414C
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
_02037C64: .word _021D414C
	thumb_func_end sub_02037C44

	thumb_func_start sub_02037C68
sub_02037C68: ; 0x02037C68
	push {r3, r4, r5, lr}
	ldr r3, _02037C90 ; =_021D414C
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
	bl MI_CpuCopy8
	pop {r3, r4, r5, pc}
	nop
_02037C90: .word _021D414C
	thumb_func_end sub_02037C68
