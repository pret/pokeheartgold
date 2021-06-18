
	thumb_func_start MOD35_02259D80
MOD35_02259D80: @ 0x02259D80
	push {r3, lr}
	cmp r1, #5
	bhi _02259DB4
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02259D92: @ jump table
	.2byte _02259DB4 - _02259D92 - 2 @ case 0
	.2byte _02259D9E - _02259D92 - 2 @ case 1
	.2byte _02259DB4 - _02259D92 - 2 @ case 2
	.2byte _02259DB4 - _02259D92 - 2 @ case 3
	.2byte _02259DA4 - _02259D92 - 2 @ case 4
	.2byte _02259DB4 - _02259D92 - 2 @ case 5
_02259D9E:
	movs r1, #1
	strb r1, [r0, #4]
	pop {r3, pc}
_02259DA4:
	ldrb r1, [r0, #2]
	cmp r1, #2
	bne _02259DB4
	ldr r1, [r0, #0x44]
	cmp r1, #0
	beq _02259DB4
	ldr r0, [r0, #0x48]
	blx r1
_02259DB4:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end MOD35_02259D80
