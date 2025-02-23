	.include "asm/macros.inc"
	.include "MSL_Common_direct_io.inc"
	.include "global.inc"

	.text

	arm_func_start fread
fread: ; 0x020E4C24
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r4, _020E4D1C ; =__files
	mov r7, r3
	cmp r7, r4
	moveq r6, #2
	mov sl, r0
	movne r6, #5
	mov r0, #0x18
	mul r4, r6, r0
	ldr r5, _020E4D20 ; =__cs
	mov sb, r1
	add r0, r5, r4
	mov r8, r2
	bl OS_TryLockMutex
	cmp r0, #0
	bne _020E4C88
	ldr r0, _020E4D24 ; =OSi_ThreadInfo
	ldr r2, _020E4D28 ; =__cs_id
	ldr r1, [r0, #4]
	ldr r0, _020E4D2C ; =__cs_ref
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
	b _020E4CE0
_020E4C88:
	ldr r0, _020E4D24 ; =OSi_ThreadInfo
	ldr r1, _020E4D28 ; =__cs_id
	ldr r0, [r0, #4]
	ldr r1, [r1, r6, lsl #2]
	ldr r0, [r0, #0x6c]
	cmp r1, r0
	bne _020E4CB8
	ldr r1, _020E4D2C ; =__cs_ref
	ldr r0, [r1, r6, lsl #2]
	add r0, r0, #1
	str r0, [r1, r6, lsl #2]
	b _020E4CE0
_020E4CB8:
	add r0, r5, r4
	bl OS_LockMutex
	ldr r0, _020E4D24 ; =OSi_ThreadInfo
	ldr r2, _020E4D28 ; =__cs_id
	ldr r1, [r0, #4]
	ldr r0, _020E4D2C ; =__cs_ref
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
_020E4CE0:
	mov r0, sl
	mov r1, sb
	mov r2, r8
	mov r3, r7
	bl __fread
	ldr r1, _020E4D2C ; =__cs_ref
	mov r7, r0
	ldr r0, [r1, r6, lsl #2]
	subs r0, r0, #1
	str r0, [r1, r6, lsl #2]
	bne _020E4D14
	add r0, r5, r4
	bl OS_UnlockMutex
_020E4D14:
	mov r0, r7
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020E4D1C: .word __files
_020E4D20: .word __cs
_020E4D24: .word OSi_ThreadInfo
_020E4D28: .word __cs_id
_020E4D2C: .word __cs_ref
	arm_func_end fread

	arm_func_start __fread
__fread: ; 0x020E4D30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r7, r3
	mov sb, r0
	mov r8, r1
	mov r0, r7
	mov r1, #0
	mov r4, r2
	bl fwide
	cmp r0, #0
	bne _020E4D68
	mov r0, r7
	mvn r1, #0
	bl fwide
_020E4D68:
	muls r4, r8, r4
	beq _020E4D8C
	ldrb r0, [r7, #0xd]
	cmp r0, #0
	bne _020E4D8C
	ldr r1, [r7, #4]
	mov r0, r1, lsl #0x16
	movs r0, r0, lsr #0x1d
	bne _020E4D98
_020E4D8C:
	add sp, sp, #4
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_020E4D98:
	mov r0, r1, lsl #0x13
	movs r0, r0, lsr #0x1f
	movne r0, r1, lsl #0x19
	movne r0, r0, lsr #0x1e
	ldr r1, [r7, #8]
	cmpne r0, #2
	mov r6, #1
	mov r0, r1, lsl #0x1d
	movne r6, #0
	movs r0, r0, lsr #0x1d
	bne _020E4DEC
	ldr r0, [r7, #4]
	mov r0, r0, lsl #0x1b
	mov r0, r0, lsr #0x1d
	tst r0, #1
	beq _020E4DEC
	bic r0, r1, #7
	orr r0, r0, #2
	str r0, [r7, #8]
	mov r0, #0
	str r0, [r7, #0x28]
_020E4DEC:
	ldr r0, [r7, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #2
	bhs _020E4E18
	mov r0, #1
	strb r0, [r7, #0xd]
	mov r0, #0
	add sp, sp, #4
	str r0, [r7, #0x28]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_020E4E18:
	ldr r0, [r7, #4]
	mov r0, r0, lsl #0x19
	mov r0, r0, lsr #0x1e
	tst r0, #1
	beq _020E4E50
	bl __flush_line_buffered_output_files
	cmp r0, #0
	beq _020E4E50
	mov r0, #1
	strb r0, [r7, #0xd]
	mov r0, #0
	add sp, sp, #4
	str r0, [r7, #0x28]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_020E4E50:
	cmp r4, #0
	mov r5, #0
	beq _020E4F14
	ldr r0, [r7, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #3
	blo _020E4F14
	mov sl, r5
_020E4E74:
	mov r0, r7
	mov r1, sl
	bl fwide
	cmp r0, #1
	ldr r0, [r7, #8]
	bne _020E4EA8
	mov r0, r0, lsl #0x1d
	add r0, r7, r0, lsr #28
	ldrh r0, [r0, #0xe]
	add r5, r5, #2
	sub r4, r4, #2
	strh r0, [sb], #2
	b _020E4EC0
_020E4EA8:
	mov r0, r0, lsl #0x1d
	add r0, r7, r0, lsr #29
	ldrb r0, [r0, #0xf]
	add r5, r5, #1
	sub r4, r4, #1
	strb r0, [sb], #1
_020E4EC0:
	ldr r1, [r7, #8]
	cmp r4, #0
	mov r0, r1, lsl #0x1d
	mov r0, r0, lsr #0x1d
	sub r0, r0, #1
	bic r1, r1, #7
	and r0, r0, #7
	orr r0, r1, r0
	str r0, [r7, #8]
	beq _020E4EFC
	ldr r0, [r7, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #3
	bhs _020E4E74
_020E4EFC:
	ldr r0, [r7, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #2
	ldreq r0, [r7, #0x30]
	streq r0, [r7, #0x28]
_020E4F14:
	cmp r4, #0
	beq _020E4FD8
	ldr r0, [r7, #0x28]
	cmp r0, #0
	cmpeq r6, #0
	beq _020E4FD8
	mov sl, #0
_020E4F30:
	ldr r0, [r7, #0x28]
	cmp r0, #0
	bne _020E4F84
	mov r0, r7
	mov r1, sl
	mov r2, sl
	bl __load_buffer
	cmp r0, #0
	beq _020E4F84
	cmp r0, #1
	mov r0, #1
	streqb r0, [r7, #0xd]
	beq _020E4F74
	ldr r1, [r7, #8]
	bic r1, r1, #7
	str r1, [r7, #8]
	strb r0, [r7, #0xc]
_020E4F74:
	mov r0, #0
	str r0, [r7, #0x28]
	mov r4, #0
	b _020E4FD8
_020E4F84:
	ldr r0, [r7, #0x28]
	str r0, [sp]
	cmp r0, r4
	strhi r4, [sp]
	ldr r1, [r7, #0x24]
	ldr r2, [sp]
	mov r0, sb
	bl memcpy
	ldr r2, [sp]
	ldr r0, [r7, #0x24]
	subs r4, r4, r2
	add r0, r0, r2
	str r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	ldr r0, [sp]
	add sb, sb, r2
	sub r0, r1, r0
	add r5, r5, r2
	str r0, [r7, #0x28]
	cmpne r6, #0
	bne _020E4F30
_020E4FD8:
	cmp r4, #0
	beq _020E5064
	cmp r6, #0
	bne _020E5064
	ldr r6, [r7, #0x1c]
	ldr sl, [r7, #0x20]
	add r1, sp, #0
	str sb, [r7, #0x1c]
	mov r0, r7
	mov r2, #1
	str r4, [r7, #0x20]
	bl __load_buffer
	cmp r0, #0
	beq _020E5044
	cmp r0, #1
	mov r0, #1
	bne _020E502C
	strb r0, [r7, #0xd]
	mov r0, #0
	str r0, [r7, #0x28]
	b _020E5044
_020E502C:
	ldr r1, [r7, #8]
	bic r1, r1, #7
	str r1, [r7, #8]
	strb r0, [r7, #0xc]
	mov r0, #0
	str r0, [r7, #0x28]
_020E5044:
	ldr r1, [sp]
	mov r0, r7
	str r6, [r7, #0x1c]
	str sl, [r7, #0x20]
	add r5, r5, r1
	bl __prep_buffer
	mov r0, #0
	str r0, [r7, #0x28]
_020E5064:
	mov r0, r5
	mov r1, r8
	bl _u32_div_f
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end __fread

	arm_func_start __fwrite
__fwrite: ; 0x020E5078
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sb, r3
	mov sl, r0
	str r1, [sp]
	mov r0, sb
	mov r1, #0
	mov r4, r2
	bl fwide
	cmp r0, #0
	bne _020E50B0
	mov r0, sb
	mvn r1, #0
	bl fwide
_020E50B0:
	ldr r0, [sp]
	muls r5, r0, r4
	beq _020E50D8
	ldrb r0, [sb, #0xd]
	cmp r0, #0
	bne _020E50D8
	ldr r1, [sb, #4]
	mov r0, r1, lsl #0x16
	movs r0, r0, lsr #0x1d
	bne _020E50E4
_020E50D8:
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020E50E4:
	mov r0, r1, lsl #0x13
	movs r0, r0, lsr #0x1f
	movne r0, r1, lsl #0x19
	movne r0, r0, lsr #0x1e
	cmpne r0, #2
	ldr r1, [sb, #8]
	cmpne r0, #1
	mov r8, #1
	mov r0, r1, lsl #0x1d
	movne r8, #0
	movs r0, r0, lsr #0x1d
	bne _020E513C
	ldr r0, [sb, #4]
	mov r0, r0, lsl #0x1b
	mov r0, r0, lsr #0x1d
	tst r0, #2
	beq _020E513C
	bic r0, r1, #7
	orr r1, r0, #1
	mov r0, sb
	str r1, [sb, #8]
	bl __prep_buffer
_020E513C:
	ldr r0, [sb, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #1
	beq _020E5168
	mov r0, #1
	strb r0, [sb, #0xd]
	mov r0, #0
	add sp, sp, #8
	str r0, [sb, #0x28]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020E5168:
	cmp r5, #0
	mov r6, #0
	beq _020E5290
	ldr r0, [sb, #0x1c]
	ldr r2, [sb, #0x24]
	cmp r2, r0
	cmpeq r8, #0
	beq _020E5290
	ldr r1, [sb, #0x20]
	sub r0, r2, r0
	sub r0, r1, r0
	str r0, [sb, #0x28]
	mov fp, #0xa
	mov r4, #0
_020E51A0:
	ldr r0, [sb, #0x28]
	mov r7, r4
	str r0, [sp, #4]
	cmp r0, r5
	strhi r5, [sp, #4]
	ldr r0, [sb, #4]
	mov r0, r0, lsl #0x19
	mov r0, r0, lsr #0x1e
	cmp r0, #1
	bne _020E51F0
	ldr r2, [sp, #4]
	cmp r2, #0
	beq _020E51F0
	mov r0, sl
	mov r1, fp
	bl __memrchr
	movs r7, r0
	addne r0, r7, #1
	subne r0, r0, sl
	strne r0, [sp, #4]
_020E51F0:
	ldr r2, [sp, #4]
	cmp r2, #0
	beq _020E5230
	ldr r0, [sb, #0x24]
	mov r1, sl
	bl memcpy
	ldr r2, [sp, #4]
	ldr r0, [sb, #0x24]
	add sl, sl, r2
	add r0, r0, r2
	str r0, [sb, #0x24]
	ldr r1, [sb, #0x28]
	ldr r0, [sp, #4]
	sub r5, r5, r2
	sub r0, r1, r0
	str r0, [sb, #0x28]
_020E5230:
	ldr r0, [sb, #0x28]
	cmp r0, #0
	beq _020E5254
	cmp r7, #0
	bne _020E5254
	ldr r0, [sb, #4]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1e
	bne _020E527C
_020E5254:
	mov r0, sb
	mov r1, #0
	bl __flush_buffer
	cmp r0, #0
	beq _020E527C
	mov r0, #1
	strb r0, [sb, #0xd]
	mov r5, #0
	str r5, [sb, #0x28]
	b _020E5290
_020E527C:
	ldr r0, [sp, #4]
	cmp r5, #0
	add r6, r6, r0
	cmpne r8, #0
	bne _020E51A0
_020E5290:
	cmp r5, #0
	beq _020E52FC
	cmp r8, #0
	bne _020E52FC
	ldr r4, [sb, #0x1c]
	ldr r7, [sb, #0x20]
	add r2, sl, r5
	str sl, [sb, #0x1c]
	str r5, [sb, #0x20]
	add r1, sp, #4
	mov r0, sb
	str r2, [sb, #0x24]
	bl __flush_buffer
	cmp r0, #0
	ldreq r0, [sp, #4]
	addeq r6, r6, r0
	beq _020E52E4
	mov r0, #1
	strb r0, [sb, #0xd]
	mov r0, #0
	str r0, [sb, #0x28]
_020E52E4:
	str r4, [sb, #0x1c]
	mov r0, sb
	str r7, [sb, #0x20]
	bl __prep_buffer
	mov r0, #0
	str r0, [sb, #0x28]
_020E52FC:
	ldr r0, [sb, #4]
	ldr r1, [sp]
	mov r0, r0, lsl #0x19
	mov r0, r0, lsr #0x1e
	cmp r0, #2
	movne r0, #0
	strne r0, [sb, #0x28]
	mov r0, r6
	bl _u32_div_f
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end __fwrite

	exception fread, 0x010D, 0x00407F00
	exception __fread, 0x0349, 0x00507F00
	exception __fwrite, 0x02B1, 0x0060FF00
