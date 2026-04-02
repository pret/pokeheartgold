	.include "asm/macros.inc"
	.include "unk_02054514.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0205455C
sub_0205455C: ; 0x0205455C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r0, [sp, #4]
	mov r2, #0
	add r1, sp, #0x18
	strb r2, [r1]
	bl MapMatrix_GetWidth
	add r6, r0, #0
	ldr r0, [sp, #4]
	bl MapMatrix_GetHeight
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ble _020545BC
	ldr r7, [sp, #0x14]
_02054586:
	mov r5, #0
	cmp r6, #0
	ble _020545AE
_0205458C:
	add r0, r5, r7
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl MapMatrix_GetMapModelNo
	add r1, sp, #0x18
	add r1, #2
	add r2, sp, #0x18
	bl sub_0205460C
	ldr r1, [sp, #8]
	add r5, r5, #1
	strb r0, [r1, r4]
	cmp r5, r6
	blt _0205458C
_020545AE:
	ldr r0, [sp, #0x14]
	add r7, r7, r6
	add r1, r0, #1
	ldr r0, [sp, #0x10]
	str r1, [sp, #0x14]
	cmp r1, r0
	blt _02054586
_020545BC:
	mov r0, #0x41
	mov r1, #0xb
	bl NARC_New
	add r7, r0, #0
	ldr r0, [sp, #0xc]
	mov r6, #0
	cmp r0, #0
	ble _02054600
	ldr r0, [sp, #8]
	add r4, sp, #0x18
	add r0, #0xe2
	add r4, #2
	add r5, r6, #0
	str r0, [sp, #8]
_020545DA:
	ldr r0, [sp, #8]
	lsl r1, r5, #1
	add r0, r0, r1
	str r0, [sp]
	ldrh r1, [r4]
	mov r3, #2
	add r0, r7, #0
	mov r2, #0x14
	lsl r3, r3, #0xa
	bl NARC_ReadFromMember
	mov r0, #1
	lsl r0, r0, #0xa
	add r5, r5, r0
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	add r4, r4, #2
	cmp r6, r0
	blt _020545DA
_02054600:
	add r0, r7, #0
	bl NARC_Delete
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205455C

	thumb_func_start sub_0205460C
sub_0205460C: ; 0x0205460C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	ldrb r0, [r7]
	add r6, r1, #0
	mov r4, #0
	cmp r0, #0
	bls _02054632
_0205461C:
	lsl r1, r4, #1
	ldrh r1, [r6, r1]
	cmp r5, r1
	bne _02054628
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_02054628:
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, r0
	blo _0205461C
_02054632:
	cmp r4, #0x10
	blo _0205463A
	bl GF_AssertFail
_0205463A:
	lsl r0, r4, #1
	strh r5, [r6, r0]
	ldrb r0, [r7]
	add r0, r0, #1
	strb r0, [r7]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205460C
