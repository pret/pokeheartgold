
	arm_func_start _start
_start: @ 0x02380000
	mov ip, #0x4000000
	str ip, [ip, #0x208]
	ldr r1, _023800CC @ =0x023801B0
	mov r0, #0x3800000
	cmp r0, r1
	movpl r1, r0
	ldr r2, _023800D0 @ =0x0380FF00
	mov r0, #0
_02380020:
	cmp r1, r2
	stmlt r1!, {r0}
	blt _02380020
	mov r0, #0x13
	msr cpsr_c, r0
	ldr sp, _023800D4 @ =0x0380FFC0
	mov r0, #0x12
	msr cpsr_c, r0
	ldr r0, _023800D8 @ =0x0380FF80
	mov sp, r0
	ldr r1, _023800DC @ =0x00000400
	sub r1, r0, r1
	mov r0, #0x1f
	msr cpsr_fsxc, r0
	sub sp, r1, #4
	ldr r0, _023800E0 @ =0x023FE940
	ldr r1, _023800E4 @ =0x027FFA80
	add r2, r1, #0x160
_02380068:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, r2
	bmi _02380068
	ldr r0, _023800E8 @ =0x023FE904
	add r2, r1, #0x20
_02380080:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, r2
	bmi _02380080
	bl sub_02380100
	ldr r0, _023800EC @ =_start_ModuleParams
	ldr r1, [r0, #0xc]
	ldr r2, [r0, #0x10]
	mov r0, #0
_023800A4:
	cmp r1, r2
	strlo r0, [r1], #4
	blo _023800A4
	bl sub_0238015C
	ldr r1, _023800F0 @ =0x0380FFFC
	ldr r0, _023800F4 @ =0x037F84E4
	str r0, [r1]
	ldr r1, _023800F8 @ =0x037F8000
	ldr lr, _023800FC @ =0xFFFF0000
	bx r1
	.align 2, 0
_023800CC: .4byte 0x023801B0
_023800D0: .4byte 0x0380FF00
_023800D4: .4byte 0x0380FFC0
_023800D8: .4byte 0x0380FF80
_023800DC: .4byte 0x00000400
_023800E0: .4byte 0x023FE940
_023800E4: .4byte 0x027FFA80
_023800E8: .4byte 0x023FE904
_023800EC: .4byte _start_ModuleParams
_023800F0: .4byte 0x0380FFFC
_023800F4: .4byte 0x037F84E4
_023800F8: .4byte 0x037F8000
_023800FC: .4byte 0xFFFF0000
	arm_func_end _start

	arm_func_start sub_02380100
sub_02380100: @ 0x02380100
	ldr r0, _02380154 @ =_start_ModuleParams
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r3, [r0, #8]
_02380110:
	cmp r1, r2
	beq _02380150
	ldr r4, [r1], #4
	ldr r5, [r1], #4
	add r6, r4, r5
_02380124:
	cmp r4, r6
	ldrmi r7, [r3], #4
	strmi r7, [r4], #4
	bmi _02380124
	ldr r5, [r1], #4
	add r6, r4, r5
	mov r7, #0
_02380140:
	cmp r4, r6
	strlo r7, [r4], #4
	blo _02380140
	beq _02380110
_02380150:
	b _02380158
	.align 2, 0
_02380154: .4byte _start_ModuleParams
	arm_func_end sub_02380100

	arm_func_start sub_02380158
sub_02380158:
	bx lr
	arm_func_end sub_02380158

	arm_func_start sub_0238015C
sub_0238015C: @ 0x0238015C
	mov r0, #1
	mov r1, #0
	ldr r2, _02380194 @ =0x027FFFFA
	sub r3, r2, #0x400000
_0238016C:
	strh r1, [r2]
	ldrh ip, [r3]
	cmp r1, ip
	movne r0, #2
	bne _0238018C
	add r1, r1, #1
	cmp r1, #2
	bne _0238016C
_0238018C:
	strh r0, [r2]
	bx lr
	.align 2, 0
_02380194: .4byte 0x027FFFFA
	arm_func_end sub_0238015C

_start_ModuleParams:
	.4byte 0x023A76B4
	.4byte 0x023A76D8
	.4byte 0x023801B0
	.4byte 0x023801B0
	.4byte 0x023801B0
	.4byte 0x00000000
; SDK_STATIC_TEXT_END = 0x023801B0
