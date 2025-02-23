	.include "asm/macros.inc"
	.include "MSL_Common_file_pos.inc"
	.include "global.inc"

	.text

	arm_func_start _ftell
_ftell: ; 0x020E5484
	ldr r1, [r0, #4]
	mov r1, r1, lsl #0x16
	mov r1, r1, lsr #0x1d
	and r1, r1, #0xff
	add r1, r1, #0xff
	and r1, r1, #0xff
	cmp r1, #1
	bhi _020E54B0
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	beq _020E54C4
_020E54B0:
	ldr r0, _020E54FC ; =errno
	mov r1, #0x28
	str r1, [r0]
	sub r0, r1, #0x29
	bx lr
_020E54C4:
	ldr r1, [r0, #8]
	mov r1, r1, lsl #0x1d
	movs ip, r1, lsr #0x1d
	ldreq r0, [r0, #0x18]
	bxeq lr
	ldr r2, [r0, #0x24]
	ldr r1, [r0, #0x1c]
	ldr r3, [r0, #0x34]
	sub r0, r2, r1
	cmp ip, #3
	add r0, r3, r0
	subhs r1, ip, #2
	subhs r0, r0, r1
	bx lr
	.align 2, 0
_020E54FC: .word errno
	arm_func_end _ftell

	arm_func_start ftell
ftell: ; 0x020E5500
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _020E5600 ; =__files
	mov r7, r0
	cmp r7, r1
	moveq r6, #2
	beq _020E5538
	ldr r0, _020E5604 ; =__files + 0x4C
	cmp r7, r0
	moveq r6, #3
	beq _020E5538
	ldr r0, _020E5608 ; =__files + 0x98
	cmp r7, r0
	moveq r6, #4
	movne r6, #5
_020E5538:
	mov r0, #0x18
	mul r4, r6, r0
	ldr r5, _020E560C ; =__cs
	add r0, r5, r4
	bl OS_TryLockMutex
	cmp r0, #0
	bne _020E5578
	ldr r0, _020E5610 ; =OSi_ThreadInfo
	ldr r2, _020E5614 ; =__cs_id
	ldr r1, [r0, #4]
	ldr r0, _020E5618 ; =__cs_ref
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
	b _020E55D0
_020E5578:
	ldr r0, _020E5610 ; =OSi_ThreadInfo
	ldr r1, _020E5614 ; =__cs_id
	ldr r0, [r0, #4]
	ldr r1, [r1, r6, lsl #2]
	ldr r0, [r0, #0x6c]
	cmp r1, r0
	bne _020E55A8
	ldr r1, _020E5618 ; =__cs_ref
	ldr r0, [r1, r6, lsl #2]
	add r0, r0, #1
	str r0, [r1, r6, lsl #2]
	b _020E55D0
_020E55A8:
	add r0, r5, r4
	bl OS_LockMutex
	ldr r0, _020E5610 ; =OSi_ThreadInfo
	ldr r2, _020E5614 ; =__cs_id
	ldr r1, [r0, #4]
	ldr r0, _020E5618 ; =__cs_ref
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
_020E55D0:
	mov r0, r7
	bl _ftell
	ldr r1, _020E5618 ; =__cs_ref
	mov r7, r0
	ldr r0, [r1, r6, lsl #2]
	subs r0, r0, #1
	str r0, [r1, r6, lsl #2]
	bne _020E55F8
	add r0, r5, r4
	bl OS_UnlockMutex
_020E55F8:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020E5600: .word __files
_020E5604: .word __files + 0x4C
_020E5608: .word __files + 0x98
_020E560C: .word __cs
_020E5610: .word OSi_ThreadInfo
_020E5614: .word __cs_id
_020E5618: .word __cs_ref
	arm_func_end ftell

	arm_func_start _fseek
_fseek: ; 0x020E561C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r1, [r5, #4]
	mov r4, r2
	mov r1, r1, lsl #0x16
	mov r1, r1, lsr #0x1d
	and r1, r1, #0xff
	cmp r1, #1
	ldreqb r1, [r5, #0xd]
	cmpeq r1, #0
	beq _020E5668
	ldr r0, _020E5800 ; =errno
	mov r1, #0x28
	str r1, [r0]
	sub r0, r1, #0x29
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_020E5668:
	ldr r1, [r5, #8]
	mov r1, r1, lsl #0x1d
	mov r1, r1, lsr #0x1d
	cmp r1, #1
	bne _020E56B8
	mov r1, #0
	bl __flush_buffer
	cmp r0, #0
	beq _020E56B8
	mov r0, #1
	strb r0, [r5, #0xd]
	mov r2, #0
	ldr r0, _020E5800 ; =errno
	mov r1, #0x28
	str r2, [r5, #0x28]
	str r1, [r0]
	sub r0, r1, #0x29
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_020E56B8:
	cmp r4, #1
	bne _020E56D8
	mov r0, r5
	mov r4, #0
	bl _ftell
	ldr r1, [sp, #0x14]
	add r0, r1, r0
	str r0, [sp, #0x14]
_020E56D8:
	cmp r4, #2
	beq _020E576C
	ldr r0, [r5, #4]
	mov r0, r0, lsl #0x1b
	mov r0, r0, lsr #0x1d
	cmp r0, #3
	beq _020E576C
	ldr r0, [r5, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	sub r0, r0, #2
	cmp r0, #1
	bhi _020E576C
	ldr r2, [sp, #0x14]
	ldr r0, [r5, #0x18]
	cmp r2, r0
	bhs _020E5728
	ldr r0, [r5, #0x34]
	cmp r2, r0
	bhs _020E5738
_020E5728:
	ldr r0, [r5, #8]
	bic r0, r0, #7
	str r0, [r5, #8]
	b _020E5778
_020E5738:
	ldr r1, [r5, #0x1c]
	sub r0, r2, r0
	add r0, r1, r0
	str r0, [r5, #0x24]
	ldr r1, [r5, #0x18]
	ldr r0, [sp, #0x14]
	sub r0, r1, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #8]
	bic r0, r0, #7
	orr r0, r0, #2
	str r0, [r5, #8]
	b _020E5778
_020E576C:
	ldr r0, [r5, #8]
	bic r0, r0, #7
	str r0, [r5, #8]
_020E5778:
	ldr r0, [r5, #8]
	mov r0, r0, lsl #0x1d
	movs r0, r0, lsr #0x1d
	bne _020E57F0
	ldr ip, [r5, #0x38]
	cmp ip, #0
	beq _020E57DC
	ldr r0, [r5]
	ldr r3, [r5, #0x48]
	add r1, sp, #0x14
	mov r2, r4
	blx ip
	cmp r0, #0
	beq _020E57DC
	mov r0, #1
	strb r0, [r5, #0xd]
	mov r2, #0
	ldr r0, _020E5800 ; =errno
	mov r1, #0x28
	str r2, [r5, #0x28]
	str r1, [r0]
	sub r0, r1, #0x29
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_020E57DC:
	mov r1, #0
	strb r1, [r5, #0xc]
	ldr r0, [sp, #0x14]
	str r0, [r5, #0x18]
	str r1, [r5, #0x28]
_020E57F0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020E5800: .word errno
	arm_func_end _fseek

	arm_func_start fseek
fseek: ; 0x020E5804
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r3, _020E5914 ; =__files
	mov sb, r0
	cmp sb, r3
	mov r8, r1
	mov r7, r2
	moveq r6, #2
	beq _020E5844
	ldr r0, _020E5918 ; =__files + 0x4C
	cmp sb, r0
	moveq r6, #3
	beq _020E5844
	ldr r0, _020E591C ; =__files + 0x98
	cmp sb, r0
	moveq r6, #4
	movne r6, #5
_020E5844:
	mov r0, #0x18
	mul r4, r6, r0
	ldr r5, _020E5920 ; =__cs
	add r0, r5, r4
	bl OS_TryLockMutex
	cmp r0, #0
	bne _020E5884
	ldr r0, _020E5924 ; =OSi_ThreadInfo
	ldr r2, _020E5928 ; =__cs_id
	ldr r1, [r0, #4]
	ldr r0, _020E592C ; =__cs_ref
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
	b _020E58DC
_020E5884:
	ldr r0, _020E5924 ; =OSi_ThreadInfo
	ldr r1, _020E5928 ; =__cs_id
	ldr r0, [r0, #4]
	ldr r1, [r1, r6, lsl #2]
	ldr r0, [r0, #0x6c]
	cmp r1, r0
	bne _020E58B4
	ldr r1, _020E592C ; =__cs_ref
	ldr r0, [r1, r6, lsl #2]
	add r0, r0, #1
	str r0, [r1, r6, lsl #2]
	b _020E58DC
_020E58B4:
	add r0, r5, r4
	bl OS_LockMutex
	ldr r0, _020E5924 ; =OSi_ThreadInfo
	ldr r2, _020E5928 ; =__cs_id
	ldr r1, [r0, #4]
	ldr r0, _020E592C ; =__cs_ref
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
_020E58DC:
	mov r0, sb
	mov r1, r8
	mov r2, r7
	bl _fseek
	ldr r1, _020E592C ; =__cs_ref
	mov r7, r0
	ldr r0, [r1, r6, lsl #2]
	subs r0, r0, #1
	str r0, [r1, r6, lsl #2]
	bne _020E590C
	add r0, r5, r4
	bl OS_UnlockMutex
_020E590C:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020E5914: .word __files
_020E5918: .word __files + 0x4C
_020E591C: .word __files + 0x98
_020E5920: .word __cs
_020E5924: .word OSi_ThreadInfo
_020E5928: .word __cs_id
_020E592C: .word __cs_ref
	arm_func_end fseek

	arm_func_start rewind
rewind: ; 0x020E5930
	stmdb sp!, {r4, lr}
	mov r1, #0
	mov r4, r0
	mov r2, r1
	strb r1, [r4, #0xd]
	bl fseek
	mov r0, #0
	strb r0, [r4, #0xd]
	ldmia sp!, {r4, pc}
	arm_func_end rewind

	exception ftell, 0x011D, 0x00300F00
	exception _fseek, 0x01E9, 0x00400320
	exception fseek, 0x012D, 0x00403F00
	exception rewind, 0x0025, 0x00100100
