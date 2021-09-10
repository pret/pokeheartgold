	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov21_022598C0
ov21_022598C0: ; 0x022598C0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r6, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_02040374
	mov r4, #0
	ldr r7, _02259908 ; =0x022599F0
	str r0, [sp]
	add r5, r4, #0
_022598E0:
	ldr r0, [r6, #0xc]
	bl sub_0207879C
	lsl r1, r4, #2
	ldrh r1, [r7, r1]
	mov r2, #4
	bl sub_02078550
	add r0, r5, r0
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #7
	blo _022598E0
	ldr r0, [sp]
	strh r5, [r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02259908: .word 0x022599F0
	thumb_func_end ov21_022598C0

	thumb_func_start ov21_0225990C
ov21_0225990C: ; 0x0225990C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02040374
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl sub_020403AC
	mov r5, #0
	ldr r2, _02259958 ; =0x022599F0
	strh r5, [r4]
_02259938:
	lsl r3, r5, #2
	ldrh r1, [r2, r3]
	cmp r0, r1
	bne _02259948
	ldr r0, _0225995C ; =0x022599F2
	ldrh r0, [r0, r3]
	strh r0, [r4]
	b _02259952
_02259948:
	add r1, r5, #1
	lsl r1, r1, #0x10
	lsr r5, r1, #0x10
	cmp r5, #7
	blo _02259938
_02259952:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02259958: .word 0x022599F0
_0225995C: .word 0x022599F2
	thumb_func_end ov21_0225990C

	thumb_func_start ov21_02259960
ov21_02259960: ; 0x02259960
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02040374
	str r0, [sp, #8]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02040374
	str r0, [sp, #4]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_020403AC
	str r0, [sp]
	mov r4, #0
	ldr r0, [sp, #8]
	add r5, r4, #0
	strh r4, [r0]
	ldr r0, [sp, #4]
	strh r4, [r0]
_022599B0:
	ldr r0, [r6, #0xc]
	lsl r7, r4, #2
	bl sub_0207879C
	ldr r1, _022599EC ; =0x022599F0
	mov r2, #4
	ldrh r1, [r1, r7]
	bl sub_02078550
	add r0, r5, r0
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	ldr r0, [sp]
	cmp r5, r0
	blo _022599DC
	ldr r0, _022599EC ; =0x022599F0
	ldrh r1, [r0, r7]
	ldr r0, [sp, #8]
	strh r1, [r0]
	ldr r0, [sp, #4]
	strh r4, [r0]
	b _022599E6
_022599DC:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #7
	blo _022599B0
_022599E6:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022599EC: .word 0x022599F0
	thumb_func_end ov21_02259960

	.rodata

_022599F0:
	.byte 0x67, 0x00, 0x8E, 0x00, 0x65, 0x00, 0x8A, 0x00, 0x66, 0x00, 0x8C, 0x00, 0x63, 0x00, 0x59, 0x01
	.byte 0x64, 0x00, 0x5B, 0x01, 0x68, 0x00, 0x9A, 0x01, 0x69, 0x00, 0x98, 0x01
