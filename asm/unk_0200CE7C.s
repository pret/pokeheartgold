	.include "asm/macros.inc"
	.include "unk_0200CE7C.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0200CE7C
sub_0200CE7C: ; 0x0200CE7C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r2, #0
	ldr r2, [sp, #0x2c]
	add r6, r3, #0
	str r2, [sp]
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	add r5, r0, #0
	bl sub_0200CDAC
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x28]
	add r1, r4, #0
	add r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	bl PrintUIntOnWindow
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_0200CE7C

	thumb_func_start sub_0200CEB0
sub_0200CEB0: ; 0x0200CEB0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r4, r2, #0
	ldr r2, [r7, #0x28]
	ldr r6, [sp, #0x18]
	lsl r0, r2, #4
	orr r0, r2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r7, #0
	add r2, r3, #0
	add r0, #8
	add r3, r4, #0
	bl ConvertUIntToDecimalString
	ldrh r1, [r7, #8]
	ldr r0, _0200CF14 ; =0x0000FFFF
	cmp r1, r0
	beq _0200CF10
	add r4, r7, #0
	mov r5, #0
_0200CEDC:
	ldrh r2, [r4, #8]
	cmp r2, #0xa2
	blo _0200CEFA
	cmp r2, #0xab
	bhi _0200CEFA
	ldr r0, [r7, #4]
	sub r2, #0xa2
	ldr r1, [r0, #0x14]
	lsl r0, r2, #5
	add r0, r1, r0
	add r1, r6, r5
	mov r2, #0x20
	bl MIi_CpuCopy32
	b _0200CF04
_0200CEFA:
	ldr r1, [sp]
	add r0, r6, r5
	mov r2, #0x20
	bl MI_CpuFill8
_0200CF04:
	add r4, r4, #2
	ldrh r1, [r4, #8]
	ldr r0, _0200CF14 ; =0x0000FFFF
	add r5, #0x20
	cmp r1, r0
	bne _0200CEDC
_0200CF10:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0200CF14: .word 0x0000FFFF
	thumb_func_end sub_0200CEB0
