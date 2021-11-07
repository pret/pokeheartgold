	.include "asm/macros.inc"
	.include "global.inc"

	.text

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
