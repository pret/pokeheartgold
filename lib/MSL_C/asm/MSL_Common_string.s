	.include "asm/macros.inc"
	.include "MSL_Common_string.inc"
	.include "global.inc"

	.data

strtok_string: ; 0x02111358
	.asciz ""
	.balign 4

strtok_ns: ; 0x0211135C
	.word strtok_string
	.word strtok_string

	.text

	arm_func_start strlen
strlen: ; 0x020E9580
	mvn r2, #0
_020E9584:
	ldrsb r1, [r0], #1
	add r2, r2, #1
	cmp r1, #0
	bne _020E9584
	mov r0, r2
	bx lr
	arm_func_end strlen

	arm_func_start strcpy
strcpy: ; 0x020E959C
	stmdb sp!, {r3, r4, r5, lr}
	and r4, r1, #3
	and r3, r0, #3
	mov r2, r0
	cmp r3, r4
	bne _020E9638
	cmp r4, #0
	beq _020E95F4
	ldrb r3, [r1]
	strb r3, [r0]
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	rsbs r4, r4, #3
	beq _020E95EC
_020E95D4:
	ldrb r3, [r1, #1]!
	cmp r3, #0
	strb r3, [r2, #1]!
	ldmeqia sp!, {r3, r4, r5, pc}
	subs r4, r4, #1
	bne _020E95D4
_020E95EC:
	add r2, r2, #1
	add r1, r1, #1
_020E95F4:
	ldr r5, [r1]
	ldr r3, _020E965C ; =0xFEFEFEFF
	mvn r4, r5
	add lr, r5, r3
	ldr ip, _020E9660 ; =0x80808080
	and r4, lr, r4
	tst r4, ip
	bne _020E9638
	sub r2, r2, #4
_020E9618:
	str r5, [r2, #4]!
	ldr r5, [r1, #4]!
	add r4, r5, r3
	mvn lr, r5
	and lr, r4, lr
	tst lr, ip
	beq _020E9618
	add r2, r2, #4
_020E9638:
	ldrb r3, [r1]
	strb r3, [r2]
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_020E9648:
	ldrb r3, [r1, #1]!
	cmp r3, #0
	strb r3, [r2, #1]!
	bne _020E9648
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020E965C: .word 0xFEFEFEFF
_020E9660: .word 0x80808080
	arm_func_end strcpy

	arm_func_start strncpy
strncpy: ; 0x020E9664
	stmdb sp!, {r3, lr}
	mov lr, r0
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
_020E9674:
	ldrsb r3, [r1], #1
	mov ip, lr
	strb r3, [lr], #1
	ldrsb r3, [ip]
	cmp r3, #0
	bne _020E96A8
	subs r2, r2, #1
	ldmeqia sp!, {r3, pc}
	mov r1, #0
_020E9698:
	strb r1, [lr], #1
	subs r2, r2, #1
	bne _020E9698
	ldmia sp!, {r3, pc}
_020E96A8:
	subs r2, r2, #1
	bne _020E9674
	ldmia sp!, {r3, pc}
	arm_func_end strncpy

	arm_func_start strcat
strcat: ; 0x020E96B4
	mov r3, r0
_020E96B8:
	ldrsb r2, [r3], #1
	cmp r2, #0
	bne _020E96B8
	sub r3, r3, #1
_020E96C8:
	ldrsb r2, [r1], #1
	mov ip, r3
	strb r2, [r3], #1
	ldrsb r2, [ip]
	cmp r2, #0
	bne _020E96C8
	bx lr
	arm_func_end strcat

	arm_func_start strncat
strncat: ; 0x020E96E4
	stmdb sp!, {r3, lr}
	mov ip, r0
_020E96EC:
	ldrsb r3, [ip], #1
	cmp r3, #0
	bne _020E96EC
	cmp r2, #0
	sub ip, ip, #1
	beq _020E9728
_020E9704:
	ldrsb r3, [r1], #1
	mov lr, ip
	strb r3, [ip], #1
	ldrsb r3, [lr]
	cmp r3, #0
	subeq ip, ip, #1
	beq _020E9728
	subs r2, r2, #1
	bne _020E9704
_020E9728:
	mov r1, #0
	strb r1, [ip]
	ldmia sp!, {r3, pc}
	arm_func_end strncat

	arm_func_start strcmp
strcmp: ; 0x020E9734
	stmdb sp!, {r4, lr}
	ldrb r2, [r0]
	ldrb r3, [r1]
	subs r3, r2, r3
	movne r0, r3
	ldmneia sp!, {r4, pc}
	and r4, r0, #3
	and r3, r1, #3
	cmp r3, r4
	bne _020E9810
	cmp r4, #0
	beq _020E97A8
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	rsbs r4, r4, #3
	beq _020E97A0
_020E9778:
	ldrb r3, [r0, #1]!
	ldrb r2, [r1, #1]!
	subs r2, r3, r2
	movne r0, r2
	ldmneia sp!, {r4, pc}
	cmp r3, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	subs r4, r4, #1
	bne _020E9778
_020E97A0:
	add r0, r0, #1
	add r1, r1, #1
_020E97A8:
	ldr r2, [r0]
	ldr r3, _020E9840 ; =0xFEFEFEFF
	mvn r4, r2
	add lr, r2, r3
	ldr ip, _020E9844 ; =0x80808080
	and r4, lr, r4
	tst r4, ip
	ldr r4, [r1]
	bne _020E97FC
	cmp r2, r4
	bne _020E97F0
_020E97D4:
	ldr r2, [r0, #4]!
	ldr r4, [r1, #4]!
	add lr, r2, r3
	tst lr, ip
	bne _020E97FC
	cmp r2, r4
	beq _020E97D4
_020E97F0:
	sub r0, r0, #1
	sub r1, r1, #1
	b _020E9810
_020E97FC:
	ldrb r2, [r0]
	ldrb r3, [r1]
	subs r3, r2, r3
	movne r0, r3
	ldmneia sp!, {r4, pc}
_020E9810:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
_020E981C:
	ldrb r3, [r0, #1]!
	ldrb r2, [r1, #1]!
	subs r2, r3, r2
	movne r0, r2
	ldmneia sp!, {r4, pc}
	cmp r3, #0
	bne _020E981C
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020E9840: .word 0xFEFEFEFF
_020E9844: .word 0x80808080
	arm_func_end strcmp

	arm_func_start strncmp
strncmp: ; 0x020E9848
	cmp r2, #0
	beq _020E9874
_020E9850:
	ldrb ip, [r1], #1
	ldrb r3, [r0], #1
	cmp r3, ip
	subne r0, r3, ip
	bxne lr
	cmp r3, #0
	beq _020E9874
	subs r2, r2, #1
	bne _020E9850
_020E9874:
	mov r0, #0
	bx lr
	arm_func_end strncmp

	arm_func_start strchr
strchr: ; 0x020E987C
	ldrsb r2, [r0], #1
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	cmp r2, #0
	beq _020E98A8
_020E9890:
	cmp r2, r1
	subeq r0, r0, #1
	bxeq lr
	ldrsb r2, [r0], #1
	cmp r2, #0
	bne _020E9890
_020E98A8:
	cmp r1, #0
	movne r0, #0
	subeq r0, r0, #1
	bx lr
	arm_func_end strchr

	arm_func_start strspn
strspn: ; 0x020E98B8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x20
	add ip, sp, #0
	mov r3, #8
	mov r2, #0
_020E98CC:
	strb r2, [ip]
	strb r2, [ip, #1]
	strb r2, [ip, #2]
	strb r2, [ip, #3]
	add ip, ip, #4
	subs r3, r3, #1
	bne _020E98CC
	ldrb r3, [r1]
	add r4, r1, #1
	cmp r3, #0
	beq _020E9928
	add lr, sp, #0
	mov r2, #1
_020E9900:
	and ip, r3, #0xff
	and r1, r3, #7
	mov r1, r2, lsl r1
	ldrb r3, [lr, ip, asr #3]
	and r1, r1, #0xff
	orr r1, r3, r1
	strb r1, [lr, ip, asr #3]
	ldrb r3, [r4], #1
	cmp r3, #0
	bne _020E9900
_020E9928:
	ldrb r1, [r0]
	add r4, r0, #1
	cmp r1, #0
	beq _020E9968
	add ip, sp, #0
	mov r2, #1
_020E9940:
	and r3, r1, #0xff
	and r1, r1, #7
	mov r1, r2, lsl r1
	ldrb r3, [ip, r3, asr #3]
	and r1, r1, #0xff
	tst r3, r1
	bne _020E9968
	ldrb r1, [r4], #1
	cmp r1, #0
	bne _020E9940
_020E9968:
	sub r0, r4, r0
	sub r0, r0, #1
	add sp, sp, #0x20
	ldmia sp!, {r4, pc}
	arm_func_end strspn

	arm_func_start strtok
strtok: ; 0x020E9978
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x20
	add ip, sp, #0
	mov r3, #8
	mov r2, #0
_020E998C:
	strb r2, [ip]
	strb r2, [ip, #1]
	strb r2, [ip, #2]
	strb r2, [ip, #3]
	add ip, ip, #4
	subs r3, r3, #1
	bne _020E998C
	cmp r0, #0
	ldrne r2, _020E9ACC ; =strtok_ns
	add lr, r1, #1
	strne r0, [r2, #4]
	ldrb r0, [r1]
	cmp r0, #0
	beq _020E99F4
	add ip, sp, #0
	mov r1, #1
_020E99CC:
	and r3, r0, #0xff
	and r0, r0, #7
	mov r0, r1, lsl r0
	ldrb r2, [ip, r3, asr #3]
	and r0, r0, #0xff
	orr r0, r2, r0
	strb r0, [ip, r3, asr #3]
	ldrb r0, [lr], #1
	cmp r0, #0
	bne _020E99CC
_020E99F4:
	ldr r0, _020E9ACC ; =strtok_ns
	ldr r0, [r0, #4]
	ldrb r4, [r0]
	add r1, r0, #1
	cmp r4, #0
	beq _020E9A38
	add ip, sp, #0
	mov r2, #1
_020E9A14:
	and r3, r4, #0xff
	and r0, r4, #7
	mov r0, r2, lsl r0
	ldrb r3, [ip, r3, asr #3]
	and r0, r0, #0xff
	tst r3, r0
	ldrneb r4, [r1], #1
	cmpne r4, #0
	bne _020E9A14
_020E9A38:
	cmp r4, #0
	bne _020E9A58
	ldr r1, _020E9ACC ; =strtok_ns
	add sp, sp, #0x20
	ldr r2, [r1]
	mov r0, #0
	str r2, [r1, #4]
	ldmia sp!, {r4, pc}
_020E9A58:
	sub r0, r1, #1
	ldrb r4, [r1], #1
	cmp r4, #0
	beq _020E9A98
	add lr, sp, #0
	mov r3, #1
_020E9A70:
	and ip, r4, #0xff
	and r2, r4, #7
	mov r2, r3, lsl r2
	ldrb ip, [lr, ip, asr #3]
	and r2, r2, #0xff
	tst ip, r2
	bne _020E9A98
	ldrb r4, [r1], #1
	cmp r4, #0
	bne _020E9A70
_020E9A98:
	cmp r4, #0
	bne _020E9AB4
	ldr r1, _020E9ACC ; =strtok_ns
	add sp, sp, #0x20
	ldr r2, [r1]
	str r2, [r1, #4]
	ldmia sp!, {r4, pc}
_020E9AB4:
	ldr r2, _020E9ACC ; =strtok_ns
	mov r3, #0
	str r1, [r2, #4]
	strb r3, [r1, #-1]
	add sp, sp, #0x20
	ldmia sp!, {r4, pc}
	.align 2, 0
_020E9ACC: .word strtok_ns
	arm_func_end strtok

	arm_func_start strstr
strstr: ; 0x020E9AD0
	stmdb sp!, {r4, lr}
	cmp r1, #0
	ldrneb r2, [r1]
	cmpne r2, #0
	ldmeqia sp!, {r4, pc}
	ldrb r3, [r0]
	add r4, r0, #1
	cmp r3, #0
	beq _020E9B34
_020E9AF4:
	cmp r3, r2
	bne _020E9B28
	mov lr, r4
	add ip, r1, #1
_020E9B04:
	ldrb r3, [ip], #1
	ldrb r0, [lr], #1
	cmp r0, r3
	bne _020E9B1C
	cmp r0, #0
	bne _020E9B04
_020E9B1C:
	cmp r3, #0
	subeq r0, r4, #1
	ldmeqia sp!, {r4, pc}
_020E9B28:
	ldrb r3, [r4], #1
	cmp r3, #0
	bne _020E9AF4
_020E9B34:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end strstr
