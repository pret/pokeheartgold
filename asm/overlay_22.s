	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov22_022598C0
ov22_022598C0: ; 0x022598C0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl sub_0203FE2C
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_020403AC
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0203FE2C
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_020403AC
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x27
	bl sub_020402F0
	lsl r2, r6, #0x18
	lsl r3, r7, #0x18
	add r5, #0x80
	str r0, [sp]
	ldr r0, [r5]
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov01_021EEC00
	ldr r1, [sp]
	str r0, [r1]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov22_022598C0

	thumb_func_start ov22_0225991C
ov22_0225991C: ; 0x0225991C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x27
	bl sub_020402F0
	ldr r0, [r0]
	bl ov01_021EEC68
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov22_0225991C

	thumb_func_start ov22_02259934
ov22_02259934: ; 0x02259934
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5, #8]
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	add r0, #0x80
	ldrb r4, [r1]
	ldr r0, [r0]
	mov r1, #0x27
	bl sub_020402F0
	add r1, r0, #0
	add r5, #0x80
	ldr r0, [r5]
	ldr r1, [r1]
	add r2, r4, #0
	bl ov01_021EEC7C
	mov r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov22_02259934

	thumb_func_start ov22_02259960
ov22_02259960: ; 0x02259960
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0203FE2C
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02040374
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_02028EB4
	bl sub_0202C950
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov22_02259960

	thumb_func_start ov22_0225998C
ov22_0225998C: ; 0x0225998C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl sub_0203FE2C
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl sub_020403AC
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02028EB4
	add r1, r5, #0
	bl sub_0202C954
	mov r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov22_0225998C

	thumb_func_start ov22_022599B8
ov22_022599B8: ; 0x022599B8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl sub_0203FE2C
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl sub_020403AC
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02028EB4
	add r1, r5, #0
	bl sub_0202C98C
	mov r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov22_022599B8

	thumb_func_start ov22_022599E4
ov22_022599E4: ; 0x022599E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl sub_0203FE2C
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl sub_02040374
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02028EB4
	ldrh r1, [r5]
	bl sub_0202C98C
	mov r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov22_022599E4

	thumb_func_start ov22_02259A10
ov22_02259A10: ; 0x02259A10
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r1, r6, #0
	add r1, #0x80
	ldr r5, [r1]
	bl sub_0203FE2C
	add r1, r0, #0
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02040374
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0203FE44
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_02028EB4
	bl sub_0202C950
	cmp r0, r6
	bhs _02259A46
	mov r0, #0
	b _02259A48
_02259A46:
	mov r0, #1
_02259A48:
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov22_02259A10

	thumb_func_start ov22_02259A50
ov22_02259A50: ; 0x02259A50
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r6, [r1]
	bl sub_0203FE2C
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02040374
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203FE2C
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl sub_02040374
	add r5, r0, #0
	ldr r0, [r6, #0xc]
	bl sub_02028EB4
	bl sub_0202C950
	ldrh r1, [r5]
	cmp r0, r1
	bhs _02259A92
	mov r0, #0
	b _02259A94
_02259A92:
	mov r0, #1
_02259A94:
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov22_02259A50

	thumb_func_start ov22_02259A9C
ov22_02259A9C: ; 0x02259A9C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl sub_0203FE2C
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02040374
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0203FE2C
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl sub_020403AC
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02028EB4
	add r1, r5, #0
	bl sub_0202C974
	strh r0, [r6]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov22_02259A9C

	thumb_func_start ov22_02259ADC
ov22_02259ADC: ; 0x02259ADC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl sub_0203FE2C
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl sub_020403AC
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02031968
	add r1, r5, #0
	bl sub_02031A38
	mov r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov22_02259ADC

	thumb_func_start ov22_02259B08
ov22_02259B08: ; 0x02259B08
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl sub_0203FE2C
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl sub_020403AC
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02031968
	add r1, r5, #0
	bl sub_02031A54
	mov r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov22_02259B08

	thumb_func_start ov22_02259B34
ov22_02259B34: ; 0x02259B34
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r6, [r1]
	bl sub_0203FE2C
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02040374
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203FE2C
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl sub_020403AC
	add r5, r0, #0
	ldr r0, [r6, #0xc]
	bl sub_02031968
	bl sub_02031A6C
	cmp r0, r5
	bhs _02259B74
	mov r0, #0
	b _02259B76
_02259B74:
	mov r0, #1
_02259B76:
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov22_02259B34
