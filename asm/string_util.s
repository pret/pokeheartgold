	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start CopyU16StringArray
CopyU16StringArray: ; 0x02002028
	ldrh r3, [r1]
	ldr r2, _02002044 ; =0x0000FFFF
	cmp r3, r2
	beq _0200203C
_02002030:
	add r1, r1, #2
	strh r3, [r0]
	ldrh r3, [r1]
	add r0, r0, #2
	cmp r3, r2
	bne _02002030
_0200203C:
	ldr r1, _02002044 ; =0x0000FFFF
	strh r1, [r0]
	bx lr
	nop
_02002044: .word 0x0000FFFF
	thumb_func_end CopyU16StringArray

	thumb_func_start CopyU16StringArrayN
CopyU16StringArrayN: ; 0x02002048
	push {r4, r5}
	mov r4, #0
	cmp r2, #0
	bls _02002060
	add r5, r0, #0
_02002052:
	ldrh r3, [r1]
	add r4, r4, #1
	add r1, r1, #2
	strh r3, [r5]
	add r5, r5, #2
	cmp r4, r2
	blo _02002052
_02002060:
	lsl r1, r2, #1
	add r0, r0, r1
	pop {r4, r5}
	bx lr
	thumb_func_end CopyU16StringArrayN

	thumb_func_start StringLength
StringLength: ; 0x02002068
	ldrh r2, [r0]
	ldr r1, _02002080 ; =0x0000FFFF
	mov r3, #0
	cmp r2, r1
	beq _0200207C
_02002072:
	add r0, r0, #2
	ldrh r2, [r0]
	add r3, r3, #1
	cmp r2, r1
	bne _02002072
_0200207C:
	add r0, r3, #0
	bx lr
	.balign 4, 0
_02002080: .word 0x0000FFFF
	thumb_func_end StringLength

	thumb_func_start StringNotEqual
StringNotEqual: ; 0x02002084
	push {r3, r4}
	ldrh r4, [r0]
	ldrh r2, [r1]
	cmp r4, r2
	bne _020020A6
	ldr r2, _020020AC ; =0x0000FFFF
_02002090:
	cmp r4, r2
	bne _0200209A
	mov r0, #0
	pop {r3, r4}
	bx lr
_0200209A:
	add r0, r0, #2
	add r1, r1, #2
	ldrh r4, [r0]
	ldrh r3, [r1]
	cmp r4, r3
	beq _02002090
_020020A6:
	mov r0, #1
	pop {r3, r4}
	bx lr
	.balign 4, 0
_020020AC: .word 0x0000FFFF
	thumb_func_end StringNotEqual

	thumb_func_start StringNotEqualN
StringNotEqualN: ; 0x020020B0
	push {r3, r4, r5, r6}
	ldrh r6, [r1]
	ldrh r5, [r0]
	cmp r5, r6
	bne _020020E4
	ldr r3, _020020EC ; =0x0000FFFF
	add r4, r3, #0
_020020BE:
	cmp r2, #0
	bne _020020C8
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
_020020C8:
	cmp r5, r4
	bne _020020D6
	cmp r6, r3
	bne _020020D6
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
_020020D6:
	add r0, r0, #2
	add r1, r1, #2
	ldrh r6, [r1]
	ldrh r5, [r0]
	sub r2, r2, #1
	cmp r5, r6
	beq _020020BE
_020020E4:
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
	nop
_020020EC: .word 0x0000FFFF
	thumb_func_end StringNotEqualN

	thumb_func_start StringFill
StringFill: ; 0x020020F0
	push {r3, r4}
	mov r3, #0
	cmp r2, #0
	bls _02002104
	add r4, r0, #0
_020020FA:
	add r3, r3, #1
	strh r1, [r4]
	add r4, r4, #2
	cmp r3, r2
	blo _020020FA
_02002104:
	lsl r1, r3, #1
	add r0, r0, r1
	pop {r3, r4}
	bx lr
	thumb_func_end StringFill

	thumb_func_start StringFillEOS
StringFillEOS: ; 0x0200210C
	ldr r3, _02002114 ; =StringFill
	add r2, r1, #0
	ldr r1, _02002118 ; =0x0000FFFF
	bx r3
	.balign 4, 0
_02002114: .word StringFill
_02002118: .word 0x0000FFFF
	thumb_func_end StringFillEOS

	thumb_func_start ConvertUIntToDecimalString
ConvertUIntToDecimalString: ; 0x0200211C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	ldr r0, _02002194 ; =0x020F5690
	lsl r1, r3, #2
	ldr r4, [r0, r1]
	add r6, r2, #0
	cmp r4, #0
	beq _0200218C
_0200212E:
	add r0, r7, #0
	add r1, r4, #0
	bl _u32_div_f
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	add r0, r4, #0
	mul r0, r1
	sub r7, r7, r0
	cmp r6, #2
	bne _02002158
	cmp r1, #0xa
	blo _0200214C
	mov r0, #0xe2
	b _02002152
_0200214C:
	ldr r0, _02002198 ; =0x020F5674
	lsl r1, r1, #1
	ldrh r0, [r0, r1]
_02002152:
	strh r0, [r5]
	add r5, r5, #2
	b _02002180
_02002158:
	cmp r1, #0
	bne _02002160
	cmp r4, #1
	bne _02002176
_02002160:
	mov r6, #2
	cmp r1, #0xa
	blo _0200216A
	mov r0, #0xe2
	b _02002170
_0200216A:
	ldr r0, _02002198 ; =0x020F5674
	lsl r1, r1, #1
	ldrh r0, [r0, r1]
_02002170:
	strh r0, [r5]
	add r5, r5, #2
	b _02002180
_02002176:
	cmp r6, #1
	bne _02002180
	mov r0, #1
	strh r0, [r5]
	add r5, r5, #2
_02002180:
	add r0, r4, #0
	mov r1, #0xa
	bl _u32_div_f
	add r4, r0, #0
	bne _0200212E
_0200218C:
	ldr r0, _0200219C ; =0x0000FFFF
	strh r0, [r5]
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02002194: .word 0x020F5690
_02002198: .word 0x020F5674
_0200219C: .word 0x0000FFFF
	thumb_func_end ConvertUIntToDecimalString
