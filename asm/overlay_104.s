	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov104_021E5900
ov104_021E5900: ; 0x021E5900
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r2, #0x31
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x95
	lsl r2, r2, #0xc
	bl sub_0201A910
	mov r1, #0x17
	add r0, r5, #0
	lsl r1, r1, #4
	mov r2, #0x95
	bl sub_02007280
	mov r2, #0x17
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl sub_020E5B44
	add r0, r5, #0
	bl sub_020072A4
	add r5, r0, #0
	mov r0, #0x59
	ldrb r1, [r5]
	lsl r0, r0, #2
	strb r1, [r4, r0]
	ldrb r2, [r5, #1]
	add r1, r0, #1
	strb r2, [r4, r1]
	add r1, r0, #2
	ldrb r2, [r5, #2]
	add r0, r0, #3
	strb r2, [r4, r1]
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #0x95
	bl sub_02023114
	str r0, [r4]
	bl ov104_021E5B88
	add r0, r4, #0
	bl ov104_021E5CC8
	add r0, r4, #0
	bl ov104_021E5BEC
	mov r4, #0
	mov r7, #2
	mov r6, #4
_021E596A:
	ldr r2, [r5, #4]
	mov r0, #6
	add r1, r4, #0
	mul r1, r0
	add r3, r2, r1
	ldrsh r1, [r2, r1]
	ldrsh r2, [r3, r7]
	ldrsh r3, [r3, r6]
	add r0, r4, #0
	bl sub_020BF034
	ldr r2, [r5, #4]
	lsl r1, r4, #1
	add r1, r2, r1
	ldrh r1, [r1, #0x18]
	add r0, r4, #0
	bl sub_020BF070
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E596A
	ldr r2, [r5, #4]
	ldrh r0, [r2, #0x20]
	ldrh r1, [r2, #0x22]
	ldr r2, [r2, #0x28]
	bl sub_020BF084
	ldr r2, [r5, #4]
	ldrh r0, [r2, #0x24]
	ldrh r1, [r2, #0x26]
	ldr r2, [r2, #0x2c]
	bl sub_020BF0A8
	ldr r3, [r5, #4]
	ldr r0, [r3, #0x40]
	str r0, [sp]
	ldr r0, [r3, #0x44]
	str r0, [sp, #4]
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x34]
	ldr r2, [r3, #0x38]
	ldr r3, [r3, #0x3c]
	bl sub_020BF0CC
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x95
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl sub_0200FA24
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov104_021E5900

	thumb_func_start ov104_021E59E4
ov104_021E59E4: ; 0x021E59E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r6, r1, #0
	bl sub_02007290
	add r5, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	mov r0, #0x6c
	add r2, r5, #4
	mul r0, r1
	add r4, r2, r0
	ldr r0, [r6]
	mov r7, #0
	cmp r0, #0
	beq _021E5A0C
	cmp r0, #1
	beq _021E5A2A
	b _021E5A64
_021E5A0C:
	add r0, r4, #0
	bl ov104_021E5E78
	cmp r0, #0
	beq _021E5A64
	mov r0, #0x5a
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	mov r1, #0x95
	bl ov104_021E5EB0
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _021E5A64
_021E5A2A:
	bl sub_0200FB5C
	cmp r0, #0
	beq _021E5A64
	mov r0, #0x5a
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	add r1, r1, #1
	strb r1, [r5, r0]
	add r1, r0, #1
	ldrb r1, [r5, r1]
	add r2, r1, #1
	add r1, r0, #1
	strb r2, [r5, r1]
	add r0, r0, #1
	ldrb r0, [r5, r0]
	cmp r0, #3
	blo _021E5A52
	mov r7, #1
	b _021E5A64
_021E5A52:
	add r0, r5, #0
	bl ov104_021E5BEC
	add r0, r7, #0
	mov r1, #0x95
	bl sub_020880CC
	add r0, r7, #0
	str r0, [r6]
_021E5A64:
	ldr r0, [r4, #0x64]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E5A96
	mov r1, #0x5b
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, r1, #4
	ldrb r1, [r5, r1]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0200604C
	mov r0, #0x5a
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	cmp r0, #2
	bne _021E5A96
	ldr r1, _021E5B08 ; =0x00000447
	mov r0, #0x44
	mov r2, #1
	bl sub_02004EC4
_021E5A96:
	mov r3, #1
	mov r2, #0
	lsl r3, r3, #0xc
_021E5A9C:
	lsl r0, r2, #2
	add r0, r4, r0
	ldr r1, [r0, #0x64]
	ldr r5, [r1, #8]
	ldr r0, [r1]
	ldrh r5, [r5, #4]
	add r0, r0, r3
	lsl r5, r5, #0xc
	cmp r0, r5
	bge _021E5AB2
	str r0, [r1]
_021E5AB2:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #2
	blo _021E5A9C
	ldr r5, _021E5B0C ; =0x021E5F3C
	add r3, sp, #0x18
	mov r2, #4
_021E5AC2:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5AC2
	ldr r0, [r5]
	add r2, sp, #0xc
	str r0, [r3]
	ldr r3, _021E5B10 ; =0x021E5EFC
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0
	str r0, [r2]
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	bl sub_02026E48
	bl sub_02023154
	add r0, r4, #0
	add r1, sp, #0
	add r2, sp, #0x18
	add r3, sp, #0xc
	bl sub_0201F554
	mov r0, #1
	add r1, r0, #0
	bl sub_02026E50
	add r0, r7, #0
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_021E5B08: .word 0x00000447
_021E5B0C: .word 0x021E5F3C
_021E5B10: .word 0x021E5EFC
	thumb_func_end ov104_021E59E4

	thumb_func_start ov104_021E5B14
ov104_021E5B14: ; 0x021E5B14
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	bl sub_02007290
	add r7, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	add r0, r7, #4
	str r0, [sp, #8]
_021E5B28:
	ldr r1, [sp, #4]
	mov r0, #0x6c
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #8]
	mov r4, #0
	add r6, r0, r2
_021E5B36:
	lsl r0, r4, #2
	add r5, r6, r0
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r1, [r5, #0x64]
	add r0, r7, r0
	bl sub_020C2BA0
	ldr r0, [r5, #0x5c]
	bl sub_0201AB0C
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _021E5B36
	ldr r0, [r6, #0x58]
	bl sub_0201AB0C
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #3
	blo _021E5B28
	ldr r0, [r7]
	bl sub_02023120
	ldr r0, [sp]
	bl sub_02007294
	bl sub_0201F63C
	mov r0, #0x95
	bl sub_0201A9C4
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov104_021E5B14

	thumb_func_start ov104_021E5B88
ov104_021E5B88: ; 0x021E5B88
	push {r3, lr}
	mov r0, #0
	add r1, r0, #0
	bl sub_0201A0FC
	bl sub_0201A108
	bl sub_02022C54
	bl sub_02022CBC
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5BD8 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5BDC ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	bl ov104_021E5CA8
	mov r0, #0x95
	bl sub_0201F590
	ldr r2, _021E5BE0 ; =0x04000060
	ldr r0, _021E5BE4 ; =0xFFFFCFFF
	ldrh r1, [r2]
	and r1, r0
	mov r0, #0x20
	orr r0, r1
	strh r0, [r2]
	ldr r0, _021E5BE8 ; =0x021E5F14
	bl sub_020CF8E4
	bl sub_02022D3C
	pop {r3, pc}
	nop
_021E5BD8: .word 0xFFFFE0FF
_021E5BDC: .word 0x04001000
_021E5BE0: .word 0x04000060
_021E5BE4: .word 0xFFFFCFFF
_021E5BE8: .word 0x021E5F14
	thumb_func_end ov104_021E5B88

	thumb_func_start ov104_021E5BEC
ov104_021E5BEC: ; 0x021E5BEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	add r6, sp, #0xc
	mov r0, #0
	str r0, [r6]
	str r0, [r6, #4]
	mov r2, #0x56
	str r0, [r6, #8]
	lsl r2, r2, #2
	add r5, r4, r2
	ldmia r6!, {r0, r1}
	add r3, r5, #0
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	str r0, [r5]
	add r0, r2, #0
	add r0, #0x10
	ldrb r7, [r4, r0]
	add r2, #0xc
	ldrb r1, [r4, r2]
	mov r0, #0x14
	add r6, r7, #0
	mul r6, r0
	mov r0, #0x3c
	add r5, r1, #0
	mul r5, r0
	ldr r0, _021E5C90 ; =0x021E5FD0
	add r1, r0, r5
	ldr r0, _021E5C94 ; =0x021E5FDC
	add r2, r1, r6
	add r0, r0, r5
	ldrb r0, [r6, r0]
	add r2, r2, #4
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	add r0, r3, #0
	ldr r3, _021E5C98 ; =0x021E5FDE
	ldr r1, [r1, r6]
	add r3, r3, r5
	ldrh r3, [r6, r3]
	bl sub_02023254
	mov r0, #0x59
	lsl r0, r0, #2
	ldrb r1, [r4, r0]
	mov r0, #0x24
	ldr r2, _021E5C9C ; =0x021E5F88
	mul r0, r1
	add r1, r2, r0
	mov r0, #0xc
	mul r0, r7
	add r0, r1, r0
	ldr r1, [r4]
	bl sub_02023514
	mov r0, #0x59
	lsl r0, r0, #2
	ldrb r3, [r4, r0]
	mov r0, #0xc
	lsl r2, r7, #2
	add r1, r3, #0
	mul r1, r0
	ldr r0, _021E5CA0 ; =0x021E5F24
	ldr r3, _021E5CA4 ; =0x021E5F26
	add r0, r0, r1
	add r1, r3, r1
	ldrh r0, [r2, r0]
	ldrh r1, [r2, r1]
	ldr r2, [r4]
	lsl r0, r0, #0xc
	lsl r1, r1, #0xc
	bl sub_02023240
	ldr r0, [r4]
	bl sub_0202313C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E5C90: .word 0x021E5FD0
_021E5C94: .word 0x021E5FDC
_021E5C98: .word 0x021E5FDE
_021E5C9C: .word 0x021E5F88
_021E5CA0: .word 0x021E5F24
_021E5CA4: .word 0x021E5F26
	thumb_func_end ov104_021E5BEC

	thumb_func_start ov104_021E5CA8
ov104_021E5CA8: ; 0x021E5CA8
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5CC4 ; =0x021E5F60
	add r3, sp, #0
	mov r2, #5
_021E5CB2:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5CB2
	add r0, sp, #0
	bl sub_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E5CC4: .word 0x021E5F60
	thumb_func_end ov104_021E5CA8

	thumb_func_start ov104_021E5CC8
ov104_021E5CC8: ; 0x021E5CC8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	mov r0, #0xeb
	mov r1, #0x95
	bl sub_02007688
	str r0, [sp, #8]
	mov r1, #0x52
	ldr r0, [sp]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0x95
	mov r2, #4
	bl sub_0201AC14
	mov r2, #0x59
	ldr r0, [sp]
	lsl r2, r2, #2
	ldrb r0, [r0, r2]
	cmp r0, #0
	bne _021E5D34
	ldr r0, [sp]
	add r1, r2, #2
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _021E5D14
	ldr r0, [sp]
	add r1, r2, #1
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _021E5D0E
	ldr r0, _021E5E50 ; =0x021E60C0
	str r0, [sp, #0x10]
	b _021E5D28
_021E5D0E:
	ldr r0, _021E5E54 ; =0x021E60D8
	str r0, [sp, #0x10]
	b _021E5D28
_021E5D14:
	ldr r0, [sp]
	add r1, r2, #1
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _021E5D24
	ldr r0, _021E5E58 ; =0x021E6090
	str r0, [sp, #0x10]
	b _021E5D28
_021E5D24:
	ldr r0, _021E5E5C ; =0x021E60F0
	str r0, [sp, #0x10]
_021E5D28:
	mov r1, #0x5b
	ldr r2, _021E5E60 ; =_021E5EF0
	ldr r0, [sp]
	lsl r1, r1, #2
	str r2, [r0, r1]
	b _021E5D72
_021E5D34:
	ldr r0, [sp]
	add r1, r2, #2
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _021E5D54
	ldr r0, [sp]
	add r1, r2, #1
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _021E5D4E
	ldr r0, _021E5E64 ; =0x021E6060
	str r0, [sp, #0x10]
	b _021E5D68
_021E5D4E:
	ldr r0, _021E5E68 ; =0x021E60A8
	str r0, [sp, #0x10]
	b _021E5D68
_021E5D54:
	ldr r0, [sp]
	add r1, r2, #1
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _021E5D64
	ldr r0, _021E5E6C ; =0x021E6078
	str r0, [sp, #0x10]
	b _021E5D68
_021E5D64:
	ldr r0, _021E5E70 ; =0x021E6108
	str r0, [sp, #0x10]
_021E5D68:
	mov r1, #0x5b
	ldr r2, _021E5E74 ; =0x021E5F08
	ldr r0, [sp]
	lsl r1, r1, #2
	str r2, [r0, r1]
_021E5D72:
	mov r0, #0
	str r0, [sp, #0x14]
_021E5D76:
	ldr r0, [sp, #0x14]
	mov r1, #0x6c
	add r4, r0, #0
	ldr r0, [sp]
	mul r4, r1
	add r0, r0, #4
	add r5, r0, r4
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	lsl r2, r0, #3
	ldr r0, [sp, #0x10]
	ldr r1, [r1, r2]
	add r0, r0, r2
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	mov r2, #0x95
	bl sub_0200771C
	add r1, r5, #0
	add r2, r5, #0
	str r0, [r5, #0x58]
	add r0, r5, #0
	add r1, #0x54
	add r2, #0x58
	bl sub_0201F51C
	ldr r0, [sp]
	add r0, r0, r4
	ldr r0, [r0, #0x5c]
	bl sub_020C3B50
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	cmp r0, #2
	bne _021E5DE8
	ldr r0, [r5, #0x54]
	mov r1, #0
	mov r2, #0x40
	bl sub_020C2BAC
	ldr r0, [r5, #0x54]
	mov r1, #0
	mov r2, #0x80
	bl sub_020C2BAC
	mov r2, #2
	ldr r0, [r5, #0x54]
	mov r1, #0
	lsl r2, r2, #8
	bl sub_020C2BAC
	mov r2, #1
	ldr r0, [r5, #0x54]
	mov r1, #0
	lsl r2, r2, #0xa
	bl sub_020C2BAC
_021E5DE8:
	mov r4, #0
_021E5DEA:
	ldr r1, [sp, #4]
	lsl r2, r4, #1
	add r1, r1, r2
	lsl r0, r4, #2
	add r6, r5, r0
	ldrh r1, [r1, #4]
	ldr r0, [sp, #8]
	mov r2, #0x95
	bl sub_0200771C
	mov r1, #0
	str r0, [r6, #0x5c]
	bl sub_020C3B90
	add r7, r0, #0
	mov r0, #0x52
	ldr r1, [sp]
	lsl r0, r0, #2
	add r0, r1, r0
	ldr r2, [r5, #0x54]
	add r1, r7, #0
	bl sub_020C2B7C
	str r0, [r6, #0x64]
	ldr r2, [r5, #0x54]
	ldr r3, [sp, #0xc]
	add r1, r7, #0
	bl sub_020BE008
	ldr r1, [r6, #0x64]
	add r0, r5, #0
	bl sub_020BE294
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _021E5DEA
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	cmp r0, #3
	blo _021E5D76
	ldr r0, [sp, #8]
	bl sub_0200770C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5E50: .word 0x021E60C0
_021E5E54: .word 0x021E60D8
_021E5E58: .word 0x021E6090
_021E5E5C: .word 0x021E60F0
_021E5E60: .word _021E5EF0
_021E5E64: .word 0x021E6060
_021E5E68: .word 0x021E60A8
_021E5E6C: .word 0x021E6078
_021E5E70: .word 0x021E6108
_021E5E74: .word 0x021E5F08
	thumb_func_end ov104_021E5CC8

	thumb_func_start ov104_021E5E78
ov104_021E5E78: ; 0x021E5E78
	add r1, r1, #1
	cmp r1, #3
	blt _021E5E94
	ldr r0, [r0, #0x64]
	ldr r1, [r0]
	mov r0, #1
	lsl r0, r0, #0xc
	add r1, r1, r0
	mov r0, #0xcd
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _021E5EAC
	mov r0, #1
	bx lr
_021E5E94:
	ldr r2, [r0, #0x64]
	mov r0, #1
	ldr r1, [r2]
	lsl r0, r0, #0xc
	add r1, r1, r0
	ldr r0, [r2, #8]
	ldrh r0, [r0, #4]
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _021E5EAC
	mov r0, #1
	bx lr
_021E5EAC:
	mov r0, #0
	bx lr
	thumb_func_end ov104_021E5E78

	thumb_func_start ov104_021E5EB0
ov104_021E5EB0: ; 0x021E5EB0
	push {lr}
	sub sp, #0xc
	add r0, r0, #1
	cmp r0, #3
	blt _021E5ED4
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0
	str r1, [sp, #8]
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl sub_0200FA24
	add sp, #0xc
	pop {pc}
_021E5ED4:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0
	str r1, [sp, #8]
	mov r1, #8
	add r2, r0, #0
	add r3, r0, #0
	bl sub_0200FA24
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov104_021E5EB0

	.rodata

_021E5EF0:
	.byte 0xD5, 0x06, 0x00, 0x00, 0xF3, 0x06, 0x00, 0x00, 0xF1, 0x06, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0xD6, 0x06, 0x00, 0x00, 0xF2, 0x06, 0x00, 0x00
	.byte 0xF0, 0x06, 0x00, 0x00, 0x00, 0x00, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10, 0x96, 0x00, 0xA4, 0x06, 0x96, 0x00, 0x84, 0x03, 0x96, 0x00, 0x84, 0x03
	.byte 0x96, 0x00, 0xA4, 0x06, 0x96, 0x00, 0x84, 0x03, 0x96, 0x00, 0x84, 0x03, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0xA8, 0x5C, 0x06, 0x00, 0xAA, 0xC3, 0x03, 0x00
	.byte 0x5E, 0xF5, 0xF7, 0xFF, 0x00, 0x80, 0x01, 0x00, 0x71, 0x9F, 0x03, 0x00, 0x35, 0xE4, 0xFA, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x85, 0x38, 0x01, 0x00, 0x33, 0x38, 0xFE, 0xFF, 0x77, 0x55, 0xFA, 0xFF
	.byte 0xAA, 0xC3, 0x03, 0x00, 0x0D, 0x70, 0xF8, 0xFF, 0x00, 0x80, 0x01, 0x00, 0x71, 0x9F, 0x03, 0x00
	.byte 0x35, 0xE4, 0xFA, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x85, 0x38, 0x01, 0x00, 0x33, 0x38, 0xFE, 0xFF
	.byte 0x52, 0x81, 0x1B, 0x00, 0xA2, 0xFA, 0xE0, 0xCA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x08
	.byte 0x00, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0x22, 0xDC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xC1, 0x05, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x9E, 0x29, 0x00, 0x02, 0xE0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x06, 0x00, 0x00, 0x00, 0x00, 0x52, 0x81, 0x1B, 0x00
	.byte 0xA2, 0xFA, 0xE0, 0x33, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x08, 0x00, 0x00, 0x00, 0x00
	.byte 0xC1, 0xAE, 0x29, 0x00, 0x22, 0xDC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05
	.byte 0x00, 0x00, 0x00, 0x00, 0xC1, 0x9E, 0x29, 0x00, 0x02, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xC1, 0x06, 0x00, 0x00, 0x00, 0x00

	.data

_021E6060:
	.byte 0x1E, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x20, 0x00, 0x2A, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x2C, 0x00
	.byte 0x36, 0x00, 0x00, 0x00, 0x37, 0x00, 0x38, 0x00, 0x24, 0x00, 0x00, 0x00, 0x25, 0x00, 0x26, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x31, 0x00, 0x32, 0x00, 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x3B, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x08, 0x00, 0x12, 0x00, 0x00, 0x00, 0x13, 0x00, 0x14, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x1D, 0x00, 0x21, 0x00, 0x00, 0x00, 0x22, 0x00, 0x23, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x36, 0x00, 0x00, 0x00, 0x37, 0x00, 0x38, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x0E, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x19, 0x00, 0x1A, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x05, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x11, 0x00, 0x18, 0x00, 0x00, 0x00, 0x19, 0x00, 0x1A, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x17, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x1D, 0x00, 0x27, 0x00, 0x00, 0x00, 0x28, 0x00, 0x29, 0x00
	.byte 0x33, 0x00, 0x00, 0x00, 0x34, 0x00, 0x35, 0x00, 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x3B, 0x00
	; 0x021E6120
