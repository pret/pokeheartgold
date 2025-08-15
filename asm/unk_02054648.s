	.include "asm/macros.inc"
	.include "unk_02054648.inc"
	.include "global.inc"

	.rodata

_020FC5FC:
	.short 0x00D0
	.short 0x00D2
	.short 0x00D3
	.short 0x0000
_020FC604:
	.word sub_02054774
	.word sub_020547D8
_020FC60C:
	.short 0x00D0
	.short 0x00D1
	.short 0x00D2
	.short 0x00D3
_020FC614:
	.word sub_020547A4
	.word sub_02054824

	.text

	thumb_func_start sub_02054648
sub_02054648: ; 0x02054648
	cmp r0, r1
	blt _02054650
	sub r0, r0, r1
	bx lr
_02054650:
	sub r0, r1, r0
	bx lr
	thumb_func_end sub_02054648

	thumb_func_start sub_02054654
sub_02054654: ; 0x02054654
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r5, r0, #0
	add r6, r3, #0
	mov r4, #0
	ldr r0, [sp, #0x50]
	str r6, [sp, #0x30]
	str r4, [sp, #0x34]
	str r0, [sp, #0x38]
	ldr r0, [r5, #0x2c]
	str r1, [sp, #8]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x30]
	str r2, [sp, #0xc]
	bl MapMatrix_GetWidth
	str r0, [sp, #0x28]
	lsl r0, r0, #5
	str r0, [sp, #0x14]
	asr r0, r6, #0xf
	lsr r0, r0, #0x10
	add r0, r6, r0
	add r2, r5, #0
	add r2, #0x98
	ldr r1, [sp, #0x50]
	asr r7, r0, #0x10
	asr r0, r1, #0xf
	lsr r0, r0, #0x10
	add r0, r1, r0
	asr r0, r0, #0x10
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x20]
	ldr r2, [r2]
	add r0, r7, #0
	add r3, sp, #0x2c
	bl ov01_021FB42C
	str r0, [sp, #0x24]
	lsr r0, r7, #5
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x50]
	lsr r0, r0, #5
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	lsl r0, r0, #5
	add r0, #0x10
	lsl r0, r0, #0x10
	sub r0, r6, r0
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x18]
	lsl r0, r0, #5
	add r0, #0x10
	lsl r0, r0, #0x10
	sub r0, r1, r0
	str r0, [sp, #0x38]
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x14]
	mul r0, r1
	ldr r1, [sp, #0x14]
	add r0, r7, r0
	bl ov01_021F6328
	ldr r2, [sp, #0x18]
	add r1, r0, #0
	add r3, r2, #0
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x10]
	mul r3, r0
	ldr r0, [sp, #0x1c]
	add r0, r0, r3
	bl ov01_021F635C
	add r1, r0, #0
	cmp r1, #3
	bls _020546F0
	add r6, r4, #0
	b _0205470E
_020546F0:
	lsl r1, r1, #0x18
	ldr r0, [sp, #0x10]
	lsr r1, r1, #0x18
	bl ov01_021F65D0
	str r0, [sp]
	add r0, sp, #0x34
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x38]
	bl ov01_021FAE50
	add r6, r0, #0
_0205470E:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _02054758
	add r0, sp, #0x2c
	add r5, #0x98
	ldrb r0, [r0]
	ldr r1, [r5]
	bl ov01_021FB474
	add r5, r0, #0
	cmp r6, #0
	beq _02054752
	ldr r4, [sp, #0x34]
	cmp r5, r4
	bgt _02054730
	mov r1, #1
	b _02054764
_02054730:
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	bl sub_02054648
	add r4, r0, #0
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl sub_02054648
	cmp r4, r0
	bgt _0205474C
	ldr r4, [sp, #0x34]
	mov r1, #1
	b _02054764
_0205474C:
	add r4, r5, #0
	mov r1, #2
	b _02054764
_02054752:
	mov r1, #2
	add r4, r5, #0
	b _02054764
_02054758:
	cmp r6, #0
	beq _02054762
	mov r1, #1
	ldr r4, [sp, #0x34]
	b _02054764
_02054762:
	mov r1, #0
_02054764:
	ldr r0, [sp, #0x54]
	cmp r0, #0
	beq _0205476C
	strb r1, [r0]
_0205476C:
	add r0, r4, #0
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02054654

	thumb_func_start sub_02054774
sub_02054774: ; 0x02054774
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r2, #0
	str r3, [sp]
	ldr r1, [sp, #0x18]
	add r2, r5, #0
	str r1, [sp, #4]
	mov r1, #0
	add r3, r4, #0
	bl sub_02054654
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02054774

	thumb_func_start sub_02054790
sub_02054790: ; 0x02054790
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x14]
	str r4, [sp, #4]
	bl sub_02054654
	add sp, #8
	pop {r4, pc}
	thumb_func_end sub_02054790

	thumb_func_start sub_020547A4
sub_020547A4: ; 0x020547A4
	push {r3, lr}
	asr r1, r2, #0xf
	lsr r1, r1, #0x10
	add r1, r2, r1
	asr r2, r3, #0xf
	lsr r2, r2, #0x10
	add r2, r3, r2
	ldr r0, [r0, #0x2c]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	mov r3, #0
	bl ov01_021F654C
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _020547D2
	cmp r0, #0
	beq _020547CC
	mov r1, #1
	b _020547CE
_020547CC:
	mov r1, #0
_020547CE:
	ldr r0, [sp, #8]
	strb r1, [r0]
_020547D2:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020547A4

	thumb_func_start sub_020547D8
sub_020547D8: ; 0x020547D8
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, [r0, #0x2c]
	add r4, r3, #0
	add r0, r7, #0
	add r3, sp, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov01_021F654C
	cmp r0, #0
	bne _020547F6
	mov r0, #0xff
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020547F6:
	add r1, sp, #0
	ldrb r1, [r1]
	add r0, r7, #0
	bl ov01_021F65E4
	lsr r2, r5, #0x1f
	lsl r1, r5, #0x1b
	sub r1, r1, r2
	mov r3, #0x1b
	ror r1, r3
	add r1, r2, r1
	lsr r5, r6, #0x1f
	lsl r2, r6, #0x1b
	sub r2, r2, r5
	ror r2, r3
	add r2, r5, r2
	lsl r2, r2, #5
	add r1, r1, r2
	lsl r1, r1, #1
	ldrh r0, [r0, r1]
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020547D8

	thumb_func_start sub_02054824
sub_02054824: ; 0x02054824
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x30]
	add r4, r2, #0
	add r5, r1, #0
	add r7, r3, #0
	bl MapMatrix_GetWidth
	asr r2, r4, #4
	asr r1, r5, #4
	lsr r2, r2, #0x1b
	lsr r1, r1, #0x1b
	add r2, r4, r2
	add r1, r5, r1
	asr r2, r2, #5
	asr r1, r1, #5
	mul r0, r2
	add r0, r1, r0
	ldr r1, [r6, #0x5c]
	bl sub_02054550
	lsr r2, r5, #0x1f
	lsl r1, r5, #0x1b
	sub r1, r1, r2
	mov r3, #0x1b
	ror r1, r3
	add r1, r2, r1
	lsr r5, r4, #0x1f
	lsl r2, r4, #0x1b
	sub r2, r2, r5
	ror r2, r3
	add r2, r5, r2
	lsl r2, r2, #5
	add r1, r1, r2
	lsl r1, r1, #1
	ldrh r0, [r0, r1]
	strh r0, [r7]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02054824

	thumb_func_start sub_02054874
sub_02054874: ; 0x02054874
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [r0, #0x2c]
	add r3, sp, #0
	add r0, r4, #0
	bl ov01_021F654C
	cmp r0, #0
	bne _0205488C
	add sp, #4
	mov r0, #0
	pop {r3, r4, pc}
_0205488C:
	add r1, sp, #0
	ldrb r1, [r1]
	add r0, r4, #0
	bl ov01_021F6600
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02054874

	thumb_func_start sub_0205489C
sub_0205489C: ; 0x0205489C
	push {r3, lr}
	cmp r1, #0
	bne _020548A8
	ldr r1, _020548B8 ; =_020FC604
	str r1, [r0]
	pop {r3, pc}
_020548A8:
	cmp r1, #1
	bne _020548B2
	ldr r1, _020548BC ; =_020FC614
	str r1, [r0]
	pop {r3, pc}
_020548B2:
	bl GF_AssertFail
	pop {r3, pc}
	.balign 4, 0
_020548B8: .word _020FC604
_020548BC: .word _020FC614
	thumb_func_end sub_0205489C

	thumb_func_start sub_020548C0
sub_020548C0: ; 0x020548C0
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [r0, #0x60]
	add r3, sp, #0
	ldr r4, [r4, #4]
	blx r4
	cmp r0, #0
	beq _020548E6
	add r0, sp, #0
	ldrh r0, [r0]
	asr r0, r0, #0xf
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #1
	and r1, r0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #1
	beq _020548E8
_020548E6:
	mov r0, #0
_020548E8:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_020548C0

	thumb_func_start sub_020548EC
sub_020548EC: ; 0x020548EC
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [r0, #0x60]
	add r3, sp, #0
	ldr r4, [r4, #4]
	blx r4
	cmp r0, #0
	beq _02054912
	add r0, sp, #0
	ldrh r0, [r0]
	add sp, #4
	asr r0, r0, #8
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x7f
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, pc}
_02054912:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_020548EC

	thumb_func_start GetMetatileBehavior
GetMetatileBehavior: ; 0x02054918
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [r0, #0x60]
	add r3, sp, #0
	ldr r4, [r4, #4]
	blx r4
	cmp r0, #0
	beq _02054938
	add r0, sp, #0
	ldrh r0, [r0]
	add sp, #4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, pc}
_02054938:
	mov r0, #0xff
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end GetMetatileBehavior

	thumb_func_start sub_02054940
sub_02054940: ; 0x02054940
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r4, [r0, #0x60]
	ldr r4, [r4]
	blx r4
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02054940

	thumb_func_start sub_02054954
sub_02054954: ; 0x02054954
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [sp, #0x10]
	mov r5, #2
	str r1, [sp]
	ldr r1, [r4, #4]
	lsl r2, r2, #0x10
	lsl r5, r5, #0xe
	lsl r3, r3, #0x10
	add r2, r2, r5
	add r3, r3, r5
	bl sub_02054940
	ldr r1, [r4, #4]
	cmp r0, r1
	bge _0205497C
	mov r4, #0
	add r2, r1, #0
	mvn r4, r4
	b _0205498C
_0205497C:
	cmp r0, r1
	ble _02054988
	add r2, r0, #0
	add r0, r1, #0
	mov r4, #1
	b _0205498C
_02054988:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0205498C:
	sub r1, r2, r0
	mov r0, #5
	lsl r0, r0, #0xe
	cmp r1, r0
	blt _020549A0
	cmp r4, #0
	bne _020549A2
	bl GF_AssertFail
	b _020549A2
_020549A0:
	mov r4, #0
_020549A2:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02054954

	thumb_func_start sub_020549A8
sub_020549A8: ; 0x020549A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, sp, #4
	add r5, r0, #0
	add r4, r2, #0
	add r7, r3, #0
	str r6, [sp]
	bl sub_02054954
	ldr r1, [sp, #0x20]
	cmp r1, #0
	beq _020549C2
	strb r0, [r1]
_020549C2:
	cmp r0, #0
	bne _020549EC
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_020548C0
	add r6, r0, #0
	bne _020549E6
	add r0, sp, #4
	ldrb r0, [r0]
	cmp r0, #2
	bne _020549E6
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl GetMetatileBehavior
_020549E6:
	add sp, #8
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_020549EC:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020549A8

	thumb_func_start sub_020549F4
sub_020549F4: ; 0x020549F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, sp, #8
	add r5, r0, #0
	str r1, [sp, #4]
	add r4, r2, #0
	add r7, r3, #0
	str r6, [sp]
	bl sub_02054954
	ldr r1, [sp, #0x28]
	cmp r1, #0
	beq _02054A10
	strb r0, [r1]
_02054A10:
	cmp r0, #0
	bne _02054A58
	add r0, sp, #0xc
	str r0, [sp]
	ldr r3, [sp, #4]
	add r0, r5, #0
	ldr r3, [r3, #4]
	add r1, r4, #0
	add r2, r7, #0
	bl sub_02064938
	cmp r0, #0
	bne _02054A52
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_020548C0
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _02054A4C
	add r0, sp, #8
	ldrb r0, [r0]
	cmp r0, #2
	bne _02054A4C
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl GetMetatileBehavior
_02054A4C:
	ldr r0, [sp, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02054A52:
	ldr r0, [sp, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02054A58:
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020549F4

	thumb_func_start sub_02054A60
sub_02054A60: ; 0x02054A60
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, r2
	ldr r0, [sp, #0x18]
	add r4, r1, r3
	add r0, r6, r0
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	add r7, r4, r0
	cmp r6, #0
	blt _02054A84
	cmp r4, #0
	blt _02054A84
	ldr r0, [sp]
	cmp r0, #0
	blt _02054A84
	cmp r7, #0
	bge _02054A88
_02054A84:
	bl GF_AssertFail
_02054A88:
	lsl r0, r6, #0x10
	str r0, [r5]
	lsl r0, r4, #0x10
	str r0, [r5, #4]
	ldr r0, [sp]
	lsl r0, r0, #0x10
	str r0, [r5, #8]
	lsl r0, r7, #0x10
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02054A60

	thumb_func_start sub_02054A9C
sub_02054A9C: ; 0x02054A9C
	push {r4, r5, lr}
	sub sp, #0xc
	add r3, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r0, sp, #0
	add r1, r3, #0
	bl ov01_021F3B0C
	ldr r1, [sp]
	ldr r0, [r4]
	ldr r2, [sp, #8]
	add r0, r1, r0
	str r0, [sp]
	ldr r1, [r4, #8]
	add r2, r2, r1
	str r2, [sp, #8]
	ldr r1, [r5]
	cmp r1, r0
	bgt _02054ADC
	ldr r1, [r5, #8]
	cmp r0, r1
	bgt _02054ADC
	ldr r0, [r5, #4]
	cmp r0, r2
	bgt _02054ADC
	ldr r0, [r5, #0xc]
	cmp r2, r0
	bgt _02054ADC
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_02054ADC:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02054A9C

	thumb_func_start sub_02054AE4
sub_02054AE4: ; 0x02054AE4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp]
	mov r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #4]
	str r0, [sp, #8]
_02054AF4:
	ldr r1, [sp]
	ldr r0, [sp, #8]
	ldr r1, [r1, #0x2c]
	add r2, sp, #0xc
	bl ov01_021F630C
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02054B5E
	ldr r0, [sp]
	ldr r1, [sp, #8]
	ldr r0, [r0, #0x2c]
	bl ov01_021F652C
	add r4, r0, #0
	ldr r0, [sp]
	ldr r0, [r0, #0x30]
	bl MapMatrix_GetWidth
	add r1, r0, #0
	add r0, r4, #0
	add r2, sp, #0x10
	bl sub_02054DC8
	mov r5, #0
_02054B26:
	ldr r0, [sp, #0xc]
	add r1, r5, #0
	bl ov01_021F3B44
	add r1, r7, #0
	add r2, sp, #0x10
	add r4, r0, #0
	bl sub_02054A9C
	cmp r0, #0
	beq _02054B54
	add r0, r4, #0
	bl ov01_021F3B34
	cmp r0, r6
	bne _02054B54
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02054B4E
	str r4, [r0]
_02054B4E:
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02054B54:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0x20
	blo _02054B26
_02054B5E:
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	cmp r0, #4
	blo _02054AF4
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02054AE4

	thumb_func_start sub_02054B74
sub_02054B74: ; 0x02054B74
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp]
	mov r0, #0
	add r5, r1, #0
	add r4, r2, #0
	str r3, [sp, #4]
	str r0, [sp, #8]
_02054B84:
	ldr r1, [sp]
	ldr r0, [sp, #8]
	ldr r1, [r1, #0x2c]
	add r2, sp, #0xc
	bl ov01_021F630C
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02054C0A
	ldr r0, [sp]
	ldr r1, [sp, #8]
	ldr r0, [r0, #0x2c]
	bl ov01_021F652C
	add r6, r0, #0
	ldr r0, [sp]
	ldr r0, [r0, #0x30]
	bl MapMatrix_GetWidth
	add r1, r0, #0
	add r0, r6, #0
	add r2, sp, #0x10
	bl sub_02054DC8
	mov r6, #0
_02054BB6:
	ldr r0, [sp, #0xc]
	add r1, r6, #0
	bl ov01_021F3B44
	ldr r1, [sp, #4]
	add r2, sp, #0x10
	add r7, r0, #0
	bl sub_02054A9C
	cmp r0, #0
	beq _02054C00
	add r0, r7, #0
	bl ov01_021F3B34
	mov r1, #0
	cmp r4, #0
	bls _02054C00
_02054BD8:
	lsl r2, r1, #2
	ldr r2, [r5, r2]
	cmp r0, r2
	bne _02054BF6
	ldr r1, [sp, #0x30]
	cmp r1, #0
	beq _02054BE8
	str r7, [r1]
_02054BE8:
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _02054BF0
	str r0, [r1]
_02054BF0:
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02054BF6:
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, r4
	blo _02054BD8
_02054C00:
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #0x20
	blo _02054BB6
_02054C0A:
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	cmp r0, #4
	blo _02054B84
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02054B74

	thumb_func_start sub_02054C20
sub_02054C20: ; 0x02054C20
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	add r5, r1, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r7, #0
_02054C2E:
	ldr r1, [sp]
	add r0, r7, #0
	ldr r1, [r1, #0x2c]
	add r2, sp, #0xc
	bl ov01_021F630C
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02054C80
	mov r4, #0
_02054C42:
	ldr r0, [sp, #0xc]
	add r1, r4, #0
	bl ov01_021F3B44
	add r6, r0, #0
	bl ov01_021F3B34
	cmp r0, r5
	bne _02054C76
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02054C5C
	str r6, [r0]
_02054C5C:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02054C70
	ldr r0, [sp]
	add r1, r7, #0
	ldr r0, [r0, #0x2c]
	bl ov01_021F652C
	ldr r1, [sp, #8]
	str r0, [r1]
_02054C70:
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02054C76:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0x20
	blo _02054C42
_02054C80:
	add r0, r7, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	cmp r7, #4
	blo _02054C2E
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02054C20

	thumb_func_start sub_02054C90
sub_02054C90: ; 0x02054C90
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	mov r0, #0
	add r5, r1, #0
	add r4, r2, #0
	str r3, [sp, #4]
	str r0, [sp, #8]
_02054CA0:
	ldr r1, [sp]
	ldr r0, [sp, #8]
	ldr r1, [r1, #0x2c]
	add r2, sp, #0xc
	bl ov01_021F630C
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02054CFA
	mov r6, #0
_02054CB4:
	ldr r0, [sp, #0xc]
	add r1, r6, #0
	bl ov01_021F3B44
	add r7, r0, #0
	bl ov01_021F3B34
	mov r1, #0
	cmp r4, #0
	bls _02054CF0
_02054CC8:
	lsl r2, r1, #2
	ldr r2, [r5, r2]
	cmp r0, r2
	bne _02054CE6
	ldr r1, [sp, #4]
	cmp r1, #0
	beq _02054CD8
	str r7, [r1]
_02054CD8:
	ldr r1, [sp, #0x28]
	cmp r1, #0
	beq _02054CE0
	str r0, [r1]
_02054CE0:
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02054CE6:
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, r4
	blo _02054CC8
_02054CF0:
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #0x20
	blo _02054CB4
_02054CFA:
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	cmp r0, #4
	blo _02054CA0
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02054C90

	thumb_func_start sub_02054D10
sub_02054D10: ; 0x02054D10
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r7, r2, #0
	str r0, [sp]
	add r0, r1, #0
	lsl r1, r7, #2
	str r3, [sp, #4]
	bl Heap_AllocAtEnd
	str r0, [sp, #8]
	mov r0, #0
	cmp r7, #0
	ble _02054D36
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x38]
_02054D2E:
	add r0, r0, #1
	stmia r1!, {r2}
	cmp r0, r7
	blt _02054D2E
_02054D36:
	mov r4, #0
	str r4, [sp, #0xc]
_02054D3A:
	ldr r1, [sp]
	ldr r0, [sp, #0xc]
	ldr r1, [r1, #0x2c]
	add r2, sp, #0x10
	bl ov01_021F630C
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _02054DB2
	ldr r0, [sp]
	ldr r1, [sp, #0xc]
	ldr r0, [r0, #0x2c]
	bl ov01_021F652C
	add r5, r0, #0
	ldr r0, [sp]
	ldr r0, [r0, #0x30]
	bl MapMatrix_GetWidth
	add r1, r0, #0
	add r0, r5, #0
	add r2, sp, #0x14
	bl sub_02054DC8
	mov r5, #0
_02054D6C:
	ldr r0, [sp, #0x10]
	add r1, r5, #0
	bl ov01_021F3B44
	ldr r1, [sp, #4]
	add r2, sp, #0x14
	add r6, r0, #0
	bl sub_02054A9C
	cmp r0, #0
	beq _02054DA8
	add r0, r6, #0
	bl ov01_021F3B34
	cmp r0, #0
	beq _02054DA8
	cmp r4, r7
	blo _02054D9A
	bl GF_AssertFail
	ldr r0, [sp, #8]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_02054D9A:
	add r1, r4, #1
	lsl r1, r1, #0x18
	add r2, r4, #0
	lsr r4, r1, #0x18
	ldr r1, [sp, #8]
	lsl r2, r2, #2
	str r0, [r1, r2]
_02054DA8:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0x20
	blo _02054D6C
_02054DB2:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	cmp r0, #4
	blo _02054D3A
	ldr r0, [sp, #8]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02054D10

	thumb_func_start sub_02054DC8
sub_02054DC8: ; 0x02054DC8
	push {r4, r5, r6, lr}
	add r4, r2, #0
	mov r2, #1
	lsl r2, r2, #0x14
	str r2, [r4]
	add r5, r0, #0
	add r6, r1, #0
	str r2, [r4, #8]
	bl _s32_div_f
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	ldr r0, [r4]
	lsl r1, r1, #0x15
	add r0, r0, r1
	str r0, [r4]
	add r0, r5, #0
	add r1, r6, #0
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	ldr r1, [r4, #8]
	lsl r0, r0, #0x15
	add r0, r1, r0
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02054DC8

	thumb_func_start sub_02054E00
sub_02054E00: ; 0x02054E00
	ldr r3, _02054E1C ; =_020FC60C
	mov r2, #0
_02054E04:
	ldrh r1, [r3]
	cmp r0, r1
	bne _02054E0E
	mov r0, #1
	bx lr
_02054E0E:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #4
	blt _02054E04
	mov r0, #0
	bx lr
	nop
_02054E1C: .word _020FC60C
	thumb_func_end sub_02054E00

	thumb_func_start sub_02054E20
sub_02054E20: ; 0x02054E20
	push {r4, lr}
	add r4, r0, #0
	bl sub_02054E00
	cmp r0, #0
	bne _02054E30
	mov r0, #0
	pop {r4, pc}
_02054E30:
	ldr r2, _02054E4C ; =_020FC5FC
	mov r1, #0
_02054E34:
	ldrh r0, [r2]
	cmp r4, r0
	bne _02054E3E
	mov r0, #1
	pop {r4, pc}
_02054E3E:
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, #3
	blt _02054E34
	mov r0, #0
	pop {r4, pc}
	nop
_02054E4C: .word _020FC5FC
	thumb_func_end sub_02054E20
