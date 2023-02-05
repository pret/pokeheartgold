	.include "asm/macros.inc"
	.include "jn_spl.inc"
	.include "global.inc"

	.bss

spl_rndm_seed:
	.space 0x4

	.text

	arm_func_start SPL_DeleteAll
SPL_DeleteAll: ; 0x02097FF4
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	mov r5, r0
	ldr r1, [r5, #4]
	cmp r1, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r4, r5, lr}
	bxeq lr
_02098014:
	ldr r4, [r1]
	mov r0, r5
	bl SPL_Delete
	mov r1, r4
	cmp r4, #0
	bne _02098014
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end SPL_DeleteAll

	arm_func_start SPL_Delete
SPL_Delete: ; 0x02098038
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	mov r6, r1
	mov r7, r0
	add r0, r6, #8
	bl spl_pop_front
	movs r1, r0
	beq _02098078
	add r5, r7, #0x1c
	add r4, r6, #8
_02098060:
	mov r0, r5
	bl spl_push_front
	mov r0, r4
	bl spl_pop_front
	movs r1, r0
	bne _02098060
_02098078:
	add r0, r6, #0x14
	bl spl_pop_front
	movs r1, r0
	beq _020980A8
	add r5, r7, #0x1c
	add r4, r6, #0x14
_02098090:
	mov r0, r5
	bl spl_push_front
	mov r0, r4
	bl spl_pop_front
	movs r1, r0
	bne _02098090
_020980A8:
	mov r1, r6
	add r0, r7, #4
	bl spl_del
	mov r1, r6
	add r0, r7, #0x10
	bl spl_push_front
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end SPL_Delete

	arm_func_start SPL_CreateWithInitialize
SPL_CreateWithInitialize: ; 0x020980CC
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	mov r7, r0
	ldr r0, [r7, #0x10]
	mov r6, r1
	mov r5, r2
	cmp r0, #0
	mov r4, #0
	beq _02098150
	add r1, sp, #0
	str r4, [r1]
	str r4, [r1, #4]
	add r0, r7, #0x10
	str r4, [r1, #8]
	bl spl_pop_front
	ldr r1, [r7, #0x28]
	add r2, sp, #0
	add r1, r1, r6, lsl #5
	mov r4, r0
	bl spl_init
	cmp r5, #0
	beq _0209812C
	mov r0, r4
	blx r5
_0209812C:
	mov r1, r4
	add r0, r7, #4
	bl spl_push_front
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #0x11
	movs r0, r0, lsr #0x1f
	movne r4, #0
_02098150:
	mov r0, r4
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end SPL_CreateWithInitialize

	arm_func_start SPL_Create
SPL_Create: ; 0x02098160
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	mov r7, r0
	ldr r0, [r7, #0x10]
	mov r6, r1
	mov r5, r2
	cmp r0, #0
	mov r4, #0
	beq _020981C4
	add r0, r7, #0x10
	bl spl_pop_front
	ldr r1, [r7, #0x28]
	mov r4, r0
	mov r2, r5
	add r1, r1, r6, lsl #5
	bl spl_init
	mov r1, r4
	add r0, r7, #4
	bl spl_push_front
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #0x11
	movs r0, r0, lsr #0x1f
	movne r4, #0
_020981C4:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end SPL_Create

	arm_func_start SPL_Draw
SPL_Draw: ; 0x020981D4
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	ldr r2, _02098298 ; =0x04000060
	mov r4, r0
	ldrh r0, [r2]
	bic r0, r0, #0x3000
	orr r0, r0, #8
	strh r0, [r2]
	str r1, [r4, #0x44]
	ldr r0, [r4, #0x38]
	mov r0, r0, lsl #7
	movs r0, r0, lsr #0x1f
	bne _02098250
	ldr r5, [r4, #4]
	cmp r5, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r4, r5, lr}
	bxeq lr
_0209821C:
	str r5, [r4, #0x40]
	ldr r0, [r5, #0x24]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	bne _02098238
	mov r0, r4
	bl spl_draw
_02098238:
	ldr r5, [r5]
	cmp r5, #0
	bne _0209821C
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
_02098250:
	ldr r5, [r4, #0xc]
	cmp r5, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r4, r5, lr}
	bxeq lr
_02098264:
	str r5, [r4, #0x40]
	ldr r0, [r5, #0x24]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	bne _02098280
	mov r0, r4
	bl spl_draw
_02098280:
	ldr r5, [r5, #4]
	cmp r5, #0
	bne _02098264
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	.align 2, 0
_02098298: .word 0x04000060
	arm_func_end SPL_Draw

	arm_func_start SPL_Calc
SPL_Calc: ; 0x0209829C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r8, r0
	ldr r7, [r8, #4]
	cmp r7, #0
	beq _020983B0
	add sl, r8, #4
	add sb, r8, #0x10
	mov r4, #0
_020982BC:
	ldr r2, [r7, #0x24]
	ldr r1, [r7, #0x20]
	mov r0, r2, lsl #0x1b
	movs r0, r0, lsr #0x1f
	ldr r5, [r1]
	ldr r6, [r7]
	bne _020982F0
	ldrh r1, [r7, #0x4c]
	ldrh r0, [r5, #0x32]
	cmp r1, r0
	orrhs r0, r2, #0x10
	strhs r0, [r7, #0x24]
	strhsh r4, [r7, #0x4c]
_020982F0:
	ldr r0, [r7, #0x24]
	mov r0, r0, lsl #0x1d
	movs r0, r0, lsr #0x1f
	bne _0209832C
	ldr r0, [r7, #0x80]
	mov r0, r0, lsl #0xd
	movs r0, r0, lsr #0x1d
	beq _02098320
	ldrh r1, [r8, #0x48]
	sub r0, r0, #1
	cmp r1, r0
	bne _0209832C
_02098320:
	mov r0, r8
	mov r1, r7
	bl spl_calc
_0209832C:
	ldr r0, [r5]
	mov r0, r0, lsl #0x11
	movs r0, r0, lsr #0x1f
	beq _02098364
	ldrh r1, [r5, #0x3c]
	cmp r1, #0
	beq _02098364
	ldr r0, [r7, #0x24]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _02098364
	ldrh r0, [r7, #0x4c]
	cmp r0, r1
	bhi _02098374
_02098364:
	ldr r0, [r7, #0x24]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _020983A4
_02098374:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _020983A4
	ldr r0, [r7, #0x18]
	cmp r0, #0
	bne _020983A4
	mov r0, sl
	mov r1, r7
	bl spl_del
	mov r1, r0
	mov r0, sb
	bl spl_push_front
_020983A4:
	mov r7, r6
	cmp r6, #0
	bne _020982BC
_020983B0:
	ldrh r0, [r8, #0x48]
	add r0, r0, #1
	strh r0, [r8, #0x48]
	ldrh r0, [r8, #0x48]
	cmp r0, #1
	movhi r0, #0
	strhih r0, [r8, #0x48]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	arm_func_end SPL_Calc

	arm_func_start SPL_LoadTexPlttByVRAMManager
SPL_LoadTexPlttByVRAMManager: ; 0x020983D4
	ldr ip, _020983E0 ; =SPL_LoadTexPlttByCallbackFunction
	ldr r1, _020983E4 ; =sAllocTexPalette
	bx ip
	.align 2, 0
_020983E0: .word SPL_LoadTexPlttByCallbackFunction
_020983E4: .word sAllocTexPalette
	arm_func_end SPL_LoadTexPlttByVRAMManager

	arm_func_start SPL_LoadTexByVRAMManager
SPL_LoadTexByVRAMManager: ; 0x020983E8
	ldr ip, _020983F4 ; =SPL_LoadTexByCallbackFunction
	ldr r1, _020983F8 ; =sAllocTex
	bx ip
	.align 2, 0
_020983F4: .word SPL_LoadTexByCallbackFunction
_020983F8: .word sAllocTex
	arm_func_end SPL_LoadTexByVRAMManager

	arm_func_start SPL_LoadTexPlttByCallbackFunction
SPL_LoadTexPlttByCallbackFunction: ; 0x020983FC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #4
	mov sl, r0
	mov fp, r1
	bl GX_BeginLoadTexPltt
	ldrh r0, [sl, #0x32]
	mov sb, #0
	cmp r0, #0
	ble _0209849C
	mov r0, #1
	mov r5, sb
	mov r4, sb
	str r0, [sp]
_02098430:
	ldr r0, [sl, #0x2c]
	mov r6, r4
	ldr r7, [r0, r5]
	add r8, r0, r5
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _02098484
	ldr r1, [r7, #4]
	mov r1, r1, lsl #0x1c
	mov r1, r1, lsr #0x1c
	cmp r1, #2
	ldreq r1, [sp]
	movne r1, r4
	blx fp
	mov r6, r0
	ldr r1, [r8]
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #0x10]
	add r0, r1, r0
	mov r1, r6
	bl GX_LoadTexPltt
_02098484:
	str r6, [r8, #8]
	ldrh r0, [sl, #0x32]
	add sb, sb, #1
	add r5, r5, #0x14
	cmp sb, r0
	blt _02098430
_0209849C:
	bl GX_EndLoadTexPltt
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end SPL_LoadTexPlttByCallbackFunction

	arm_func_start SPL_LoadTexByCallbackFunction
SPL_LoadTexByCallbackFunction: ; 0x020984B0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	mov fp, r1
	bl GX_BeginLoadTex
	ldrh r0, [sl, #0x32]
	mov sb, #0
	cmp r0, #0
	ble _02098568
	mov r0, #1
	mov r6, sb
	str sb, [sp, #4]
	str r0, [sp]
	mov r4, #0x14
_020984E8:
	ldr r2, [sl, #0x2c]
	ldr r7, [r2, r6]
	add r8, r2, r6
	ldr r0, [r7, #4]
	mov r1, r0, lsl #0xe
	movs r1, r1, lsr #0x1f
	beq _0209851C
	mov r0, r0, lsl #6
	mov r1, r0, lsr #0x18
	mla r0, r1, r4, r2
	ldr r0, [r0, #4]
	str r0, [r8, #4]
	b _02098554
_0209851C:
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #5
	ldreq r1, [sp]
	ldr r0, [r7, #8]
	ldrne r1, [sp, #4]
	blx fp
	mov r5, r0
	ldr r0, [r8]
	ldr r2, [r7, #8]
	add r0, r0, #0x20
	mov r1, r5
	bl GX_LoadTex
	str r5, [r8, #4]
_02098554:
	ldrh r0, [sl, #0x32]
	add sb, sb, #1
	add r6, r6, #0x14
	cmp sb, r0
	blt _020984E8
_02098568:
	bl GX_EndLoadTex
	mov r0, #1
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end SPL_LoadTexByCallbackFunction

	arm_func_start SPL_Load
SPL_Load: ; 0x0209857C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov sb, r1
	ldrh r1, [sb, #8]
	mov sl, r0
	mov r8, #0x20
	strh r1, [sl, #0x30]
	ldrh r0, [sb, #0xa]
	strh r0, [sl, #0x32]
	ldrh r0, [sl, #0x30]
	ldr r1, [sl]
	mov r0, r0, lsl #5
	blx r1
	str r0, [sl, #0x28]
	ldrh r2, [sl, #0x30]
	ldr r0, [sl, #0x28]
	mov r1, #0
	mov r2, r2, lsl #5
	bl MI_CpuFill8
	ldrh r1, [sl, #0x30]
	mov r0, #0
	str r0, [sp]
	cmp r1, #0
	ble _0209881C
	mov r6, r0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
_020985F8:
	ldr r1, [sl, #0x28]
	add r0, sb, r8
	str r0, [r1, r6]
	ldr r0, [r1, r6]
	add r8, r8, #0x58
	ldr r0, [r0]
	add r7, r1, r6
	str r0, [sp, #0x28]
	mov r0, r0, lsl #0x17
	movs r0, r0, lsr #0x1f
	addne r0, sb, r8
	strne r0, [r7, #4]
	ldreq r0, [sp, #0x10]
	addne r8, r8, #0xc
	streq r0, [r7, #4]
	ldr r0, [sp, #0x28]
	mov r0, r0, lsl #0x16
	movs r0, r0, lsr #0x1f
	addne r0, sb, r8
	strne r0, [r7, #8]
	ldreq r0, [sp, #0x14]
	addne r8, r8, #0xc
	streq r0, [r7, #8]
	ldr r0, [sp, #0x28]
	mov r0, r0, lsl #0x15
	movs r0, r0, lsr #0x1f
	addne r0, sb, r8
	strne r0, [r7, #0xc]
	ldreq r0, [sp, #0x18]
	addne r8, r8, #8
	streq r0, [r7, #0xc]
	ldr r0, [sp, #0x28]
	mov r0, r0, lsl #0x14
	movs r0, r0, lsr #0x1f
	addne r0, sb, r8
	strne r0, [r7, #0x10]
	ldreq r0, [sp, #0x1c]
	addne r8, r8, #0xc
	streq r0, [r7, #0x10]
	ldr r0, [sp, #0x28]
	mov r0, r0, lsl #0xf
	movs r0, r0, lsr #0x1f
	addne r0, sb, r8
	strne r0, [r7, #0x14]
	ldreq r0, [sp, #0x20]
	addne r8, r8, #0x14
	streq r0, [r7, #0x14]
	ldr r0, [sp, #0x28]
	mov r1, r0, lsl #7
	mov r2, r0, lsl #6
	mov r5, r1, lsr #0x1f
	mov r4, r2, lsr #0x1f
	add r1, r5, r2, lsr #31
	mov r2, r0, lsl #5
	add r1, r1, r2, lsr #31
	mov r3, r0, lsl #4
	mov fp, r2, lsr #0x1f
	add r2, r1, r3, lsr #31
	mov r1, r3, lsr #0x1f
	mov ip, r0, lsl #3
	str r1, [sp, #4]
	mov r3, r0, lsl #2
	mov r0, ip, lsr #0x1f
	add r1, r2, ip, lsr #31
	str r0, [sp, #8]
	add r0, r1, r3, lsr #31
	strh r0, [r7, #0x1c]
	mov r0, r3, lsr #0x1f
	str r0, [sp, #0xc]
	ldrh r0, [r7, #0x1c]
	cmp r0, #0
	beq _020987F8
	mov r0, r0, lsl #3
	ldr r1, [sl]
	blx r1
	str r0, [r7, #0x18]
	cmp r5, #0
	ldr r0, [r7, #0x18]
	beq _0209874C
	add r1, sb, r8
	str r1, [r0, #4]
	ldr r1, _020988DC ; =spl_calc_gravity
	add r8, r8, #8
	str r1, [r0]
	add r0, r0, #8
_0209874C:
	cmp r4, #0
	beq _0209876C
	add r1, sb, r8
	str r1, [r0, #4]
	ldr r1, _020988E0 ; =spl_calc_random
	add r8, r8, #8
	str r1, [r0]
	add r0, r0, #8
_0209876C:
	cmp fp, #0
	beq _0209878C
	add r1, sb, r8
	str r1, [r0, #4]
	ldr r1, _020988E4 ; =spl_calc_magnet
	add r8, r8, #0x10
	str r1, [r0]
	add r0, r0, #8
_0209878C:
	ldr r1, [sp, #4]
	cmp r1, #0
	beq _020987B0
	add r1, sb, r8
	str r1, [r0, #4]
	ldr r1, _020988E8 ; =spl_calc_spin
	add r8, r8, #4
	str r1, [r0]
	add r0, r0, #8
_020987B0:
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _020987D4
	add r1, sb, r8
	str r1, [r0, #4]
	ldr r1, _020988EC ; =spl_calc_scfield
	add r8, r8, #8
	str r1, [r0]
	add r0, r0, #8
_020987D4:
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq _02098800
	add r1, sb, r8
	str r1, [r0, #4]
	ldr r1, _020988F0 ; =spl_calc_convergence
	add r8, r8, #0x10
	str r1, [r0]
	b _02098800
_020987F8:
	ldr r0, [sp, #0x24]
	str r0, [r7, #0x18]
_02098800:
	ldr r0, [sp]
	ldrh r1, [sl, #0x30]
	add r0, r0, #1
	add r6, r6, #0x20
	str r0, [sp]
	cmp r0, r1
	blt _020985F8
_0209881C:
	ldrh r2, [sl, #0x32]
	mov r0, #0x14
	ldr r1, [sl]
	mul r0, r2, r0
	blx r1
	str r0, [sl, #0x2c]
	ldrh r3, [sl, #0x32]
	mov r1, #0x14
	ldr r0, [sl, #0x2c]
	mul r2, r3, r1
	mov r1, #0
	bl MI_CpuFill8
	ldrh r0, [sl, #0x32]
	mov r3, #0
	cmp r0, #0
	addle sp, sp, #0x2c
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxle lr
	mov r4, r3
	mov r0, #1
_0209886C:
	ldr r2, [sl, #0x2c]
	add r1, sb, r8
	str r1, [r2, r4]
	ldr r5, [r1, #4]
	add r2, r2, r4
	mov r5, r5, lsl #0x18
	mov r5, r5, lsr #0x1c
	add r5, r5, #3
	mov r5, r0, lsl r5
	strh r5, [r2, #0x10]
	ldr r5, [r1, #4]
	add r3, r3, #1
	mov r5, r5, lsl #0x14
	mov r5, r5, lsr #0x1c
	add r5, r5, #3
	mov r5, r0, lsl r5
	strh r5, [r2, #0x12]
	ldr r5, [r1, #4]
	add r4, r4, #0x14
	str r5, [r2, #0xc]
	ldrh r2, [sl, #0x32]
	ldr r1, [r1, #0x1c]
	cmp r3, r2
	add r8, r8, r1
	blt _0209886C
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_020988DC: .word spl_calc_gravity
_020988E0: .word spl_calc_random
_020988E4: .word spl_calc_magnet
_020988E8: .word spl_calc_spin
_020988EC: .word spl_calc_scfield
_020988F0: .word spl_calc_convergence
	arm_func_end SPL_Load

	arm_func_start SPL_Init
SPL_Init: ; 0x020988F4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r8, r0
	mov r0, #0x4c
	mov r7, r1
	mov r6, r2
	mov r4, r3
	blx r8
	mov r5, r0
	mov r1, #0
	mov r2, #0x4c
	bl MI_CpuFill8
	strh r7, [r5, #0x34]
	strh r6, [r5, #0x36]
	ldrh r0, [sp, #0x20]
	and r2, r4, #0x3f
	ldr r1, [r5, #0x38]
	and r0, r0, #0x3f
	bic r1, r1, #0x3f
	orr r0, r1, r0
	str r0, [r5, #0x38]
	ldrh r0, [sp, #0x24]
	ldr r3, [r5, #0x38]
	mov r1, #0
	bic r3, r3, #0xfc0
	and r0, r0, #0x3f
	orr r0, r3, r0, lsl #6
	str r0, [r5, #0x38]
	ldr r3, [r5, #0x38]
	mov r0, #0x9c
	mul r4, r7, r0
	bic ip, r3, #0x3f000
	mov r0, r3, lsl #0x1a
	mov r0, r0, lsr #0x1a
	and r0, r0, #0x3f
	orr r0, ip, r0, lsl #12
	str r0, [r5, #0x38]
	ldr r3, [r5, #0x38]
	mov r0, r4
	bic r3, r3, #0xfc0000
	orr r2, r3, r2, lsl #18
	str r2, [r5, #0x38]
	ldr r2, [r5, #0x38]
	bic r2, r2, #0x1000000
	str r2, [r5, #0x38]
	ldr r2, [r5, #0x38]
	bic r2, r2, #0xfe000000
	str r2, [r5, #0x38]
	str r8, [r5]
	str r1, [r5, #8]
	str r1, [r5, #0x14]
	str r1, [r5, #0x20]
	str r1, [r5, #4]
	str r1, [r5, #0x10]
	str r1, [r5, #0x1c]
	str r1, [r5, #0x3c]
	strh r1, [r5, #0x48]
	blx r8
	mov r2, r4
	mov sb, r0
	mov r1, #0
	bl MI_CpuFill8
	cmp r7, #0
	mov sl, #0
	ble _02098A14
	add r4, r5, #0x10
_020989F8:
	mov r0, r4
	mov r1, sb
	bl spl_push_front
	add sl, sl, #1
	cmp sl, r7
	add sb, sb, #0x9c
	blt _020989F8
_02098A14:
	mov r0, #0x44
	mul r4, r6, r0
	mov r0, r4
	blx r8
	mov r2, r4
	mov r1, #0
	mov r8, r0
	bl MI_CpuFill8
	cmp r6, #0
	mov r7, #0
	ble _02098A60
	add r4, r5, #0x1c
_02098A44:
	mov r0, r4
	mov r1, r8
	bl spl_push_front
	add r7, r7, #1
	cmp r7, r6
	add r8, r8, #0x44
	blt _02098A44
_02098A60:
	mov r0, #0
	str r0, [r5, #0x28]
	str r0, [r5, #0x2c]
	strh r0, [r5, #0x32]
	ldrh r1, [r5, #0x32]
	mov r0, r5
	strh r1, [r5, #0x30]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	arm_func_end SPL_Init

	arm_func_start sAllocTexPalette
sAllocTexPalette: ; 0x02098A84
	stmdb sp!, {lr}
	sub sp, sp, #4
	ldr r3, _02098AB4 ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r2, #0
	ldr r3, [r3]
	blx r3
	ldr r1, _02098AB8 ; =0x0000FFFF
	and r0, r0, r1
	mov r0, r0, lsl #3
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_02098AB4: .word NNS_GfdDefaultFuncAllocPlttVram
_02098AB8: .word 0x0000FFFF
	arm_func_end sAllocTexPalette

	arm_func_start sAllocTex
sAllocTex: ; 0x02098ABC
	stmdb sp!, {lr}
	sub sp, sp, #4
	ldr r3, _02098AEC ; =NNS_GfdDefaultFuncAllocTexVram
	mov r2, #0
	ldr r3, [r3]
	blx r3
	ldr r1, _02098AF0 ; =0x0000FFFF
	and r0, r0, r1
	mov r0, r0, lsl #3
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_02098AEC: .word NNS_GfdDefaultFuncAllocTexVram
_02098AF0: .word 0x0000FFFF
	arm_func_end sAllocTex

	arm_func_start spl_draw
spl_draw: ; 0x02098AF4
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r1, [r4, #0x40]
	ldr r1, [r1, #0x20]
	ldr r5, [r1]
	ldr r1, [r5]
	mov r2, r1, lsl #0xa
	movs r2, r2, lsr #0x1f
	beq _02098B4C
	bl sDrawChild
	ldr r0, [r5]
	mov r0, r0, lsl #9
	movs r0, r0, lsr #0x1f
	addne sp, sp, #4
	ldmneia sp!, {r4, r5, lr}
	bxne lr
	mov r0, r4
	bl sDrawParent
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
_02098B4C:
	mov r1, r1, lsl #9
	movs r1, r1, lsr #0x1f
	bne _02098B5C
	bl sDrawParent
_02098B5C:
	mov r0, r4
	bl sDrawChild
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end spl_draw

	arm_func_start sDrawChild
sDrawChild: ; 0x02098B70
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	mov r7, r0
	ldr r6, [r7, #0x40]
	mov r4, #0
	ldr r5, [r6, #0x20]
	ldr r0, [r5]
	ldr r0, [r0]
	mov r0, r0, lsl #0xf
	movs r0, r0, lsr #0x1f
	addeq sp, sp, #4
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	ldr r0, [r5, #0x14]
	ldr r2, [r7, #0x2c]
	ldrb r1, [r0, #0xf]
	mov r0, #0x14
	mla r0, r1, r0, r2
	bl spl_set_tex
	ldr r0, [r5, #0x14]
	ldrh r0, [r0]
	mov r0, r0, lsl #0x17
	mov r0, r0, lsr #0x1e
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02098C10
_02098BD8: ; jump table
	b _02098BEC ; case 0
	b _02098BF4 ; case 1
	b _02098BFC ; case 2
	b _02098C04 ; case 3
	b _02098C0C ; case 4
_02098BEC:
	ldr r4, _02098C48 ; =spl_draw_chld_bb
	b _02098C10
_02098BF4:
	ldr r4, _02098C4C ; =spl_draw_chld_dbb
	b _02098C10
_02098BFC:
	ldr r4, _02098C50 ; =spl_draw_chld_pol
	b _02098C10
_02098C04:
	ldr r4, _02098C54 ; =spl_draw_chld_dpl
	b _02098C10
_02098C0C:
	ldr r4, _02098C54 ; =spl_draw_chld_dpl
_02098C10:
	ldr r5, [r6, #0x14]
	cmp r5, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
_02098C24:
	mov r0, r7
	mov r1, r5
	blx r4
	ldr r5, [r5]
	cmp r5, #0
	bne _02098C24
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02098C48: .word spl_draw_chld_bb
_02098C4C: .word spl_draw_chld_dbb
_02098C50: .word spl_draw_chld_pol
_02098C54: .word spl_draw_chld_dpl
	arm_func_end sDrawChild

	arm_func_start sDrawParent
sDrawParent: ; 0x02098C58
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	ldr r6, [r7, #0x40]
	ldr r2, [r7, #0x2c]
	ldr r1, [r6, #0x20]
	mov r0, #0x14
	ldr r5, [r1]
	mov r4, #0
	ldrb r1, [r5, #0x47]
	mla r0, r1, r0, r2
	bl spl_set_tex
	ldr r0, [r5]
	mov r0, r0, lsl #0x1a
	mov r0, r0, lsr #0x1e
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02098CD4
_02098C9C: ; jump table
	b _02098CB0 ; case 0
	b _02098CB8 ; case 1
	b _02098CC0 ; case 2
	b _02098CC8 ; case 3
	b _02098CD0 ; case 4
_02098CB0:
	ldr r4, _02098D2C ; =spl_draw_bb
	b _02098CD4
_02098CB8:
	ldr r4, _02098D30 ; =spl_draw_dbb
	b _02098CD4
_02098CC0:
	ldr r4, _02098D34 ; =spl_draw_pol
	b _02098CD4
_02098CC8:
	ldr r4, _02098D38 ; =spl_draw_dpl
	b _02098CD4
_02098CD0:
	ldr r4, _02098D38 ; =spl_draw_dpl
_02098CD4:
	ldr r0, [r5]
	ldr r8, [r6, #8]
	mov r0, r0, lsl #0x14
	movs r0, r0, lsr #0x1f
	ldrne r5, _02098D3C ; =spl_set_tex
	ldreq r5, _02098D40 ; =spl_set_tex_dummy
	cmp r8, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
	bxeq lr
	mov r6, #0x14
_02098CFC:
	ldrb r1, [r8, #0x2c]
	ldr r0, [r7, #0x2c]
	mla r0, r1, r6, r0
	blx r5
	mov r0, r7
	mov r1, r8
	blx r4
	ldr r8, [r8]
	cmp r8, #0
	bne _02098CFC
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02098D2C: .word spl_draw_bb
_02098D30: .word spl_draw_dbb
_02098D34: .word spl_draw_pol
_02098D38: .word spl_draw_dpl
_02098D3C: .word spl_set_tex
_02098D40: .word spl_set_tex_dummy
	arm_func_end sDrawParent

	arm_func_start spl_calc
spl_calc: ; 0x02098D44
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x74
	mov sb, r1
	ldr r8, [sb, #0x20]
	mov sl, r0
	ldr r0, [r8, #0x14]
	ldr r4, [r8]
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r6, #0
	str r0, [sp, #0x24]
	ldrb r0, [r4, #0x46]
	ldr r2, [sb, #0x90]
	ldrh r7, [r8, #0x1c]
	add r0, r0, #0x180
	cmp r2, #0
	str r0, [sp, #8]
	beq _02098D98
	mov r0, sb
	mov r1, r6
	blx r2
_02098D98:
	ldrh r1, [r4, #0x3c]
	cmp r1, #0
	beq _02098DB0
	ldrh r0, [sb, #0x4c]
	cmp r0, r1
	bhs _02098DF8
_02098DB0:
	ldrh r0, [sb, #0x4c]
	ldrb r1, [sb, #0x80]
	bl _s32_div_f
	cmp r1, #0
	bne _02098DF8
	ldr r1, [sb, #0x24]
	mov r0, r1, lsl #0x1f
	movs r0, r0, lsr #0x1f
	bne _02098DF8
	mov r0, r1, lsl #0x1e
	movs r0, r0, lsr #0x1f
	bne _02098DF8
	mov r0, r1, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _02098DF8
	mov r0, sb
	add r1, sl, #0x1c
	bl spl_gen_ptcl
_02098DF8:
	ldr r0, [sp, #0x24]
	mov r0, r0, lsl #0x17
	movs r0, r0, lsr #0x1f
	beq _02098E28
	ldr r0, _02099574 ; =spl_scl_in_out
	add r6, r6, #1
	str r0, [sp, #0x28]
	ldr r0, [r8, #4]
	ldrh r0, [r0, #8]
	mov r0, r0, lsl #0x1f
	mov r0, r0, lsr #0x1f
	str r0, [sp, #0x2c]
_02098E28:
	ldr r0, [sp, #0x24]
	mov r0, r0, lsl #0x16
	movs r0, r0, lsr #0x1f
	beq _02098E74
	ldr r3, [r8, #8]
	ldrh r0, [r3, #8]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	bne _02098E74
	ldr r2, _02099578 ; =spl_clr_in_out
	add r1, sp, #0x28
	str r2, [r1, r6, lsl #3]
	ldrh r1, [r3, #8]
	mov r2, r6, lsl #3
	add r0, sp, #0x2c
	mov r1, r1, lsl #0x1e
	mov r1, r1, lsr #0x1f
	add r6, r6, #1
	str r1, [r0, r2]
_02098E74:
	ldr r0, [sp, #0x24]
	mov r0, r0, lsl #0x15
	movs r0, r0, lsr #0x1f
	beq _02098EB0
	ldr r2, _0209957C ; =spl_alp_in_out
	add r1, sp, #0x28
	str r2, [r1, r6, lsl #3]
	ldr r1, [r8, #0xc]
	mov r2, r6, lsl #3
	ldrh r1, [r1, #2]
	add r0, sp, #0x2c
	add r6, r6, #1
	mov r1, r1, lsl #0x17
	mov r1, r1, lsr #0x1f
	str r1, [r0, r2]
_02098EB0:
	ldr r0, [sp, #0x24]
	mov r0, r0, lsl #0x14
	movs r0, r0, lsr #0x1f
	beq _02098EF8
	ldr r3, [r8, #0x10]
	ldr r0, [r3, #8]
	mov r0, r0, lsl #0xf
	movs r0, r0, lsr #0x1f
	bne _02098EF8
	ldr r2, _02099580 ; =spl_tex_ptn_anm
	add r1, sp, #0x28
	str r2, [r1, r6, lsl #3]
	ldr r1, [r3, #8]
	add r0, sp, #0x2c
	mov r1, r1, lsl #0xe
	mov r1, r1, lsr #0x1f
	str r1, [r0, r6, lsl #3]
	add r6, r6, #1
_02098EF8:
	ldr r4, [sb, #8]
	cmp r4, #0
	beq _02099234
	ldr r0, [sp, #0x24]
	add fp, sp, #0x28
	mov r2, r0, lsl #0x10
	mov r1, r0, lsl #0xf
	mov r0, r2, lsr #0x1f
	str r0, [sp, #0xc]
	mov r0, r1, lsr #0x1f
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x18]
_02098F2C:
	ldr r0, [r4]
	ldrh r1, [r4, #0x2a]
	str r0, [sp]
	ldrh r0, [r4, #0x26]
	cmp r6, #0
	ldr r5, [sp, #0x18]
	mul r2, r1, r0
	mov r1, r2, asr #8
	strb r1, [sp, #0x20]
	ldrh r1, [r4, #0x28]
	ldrb r2, [r4, #0x2d]
	mul r0, r1, r0
	add r0, r2, r0, asr #8
	strb r0, [sp, #0x21]
	ble _02098F94
_02098F68:
	add r2, fp, r5, lsl #3
	ldr ip, [r2, #4]
	add r2, sp, #0x20
	ldrb r2, [r2, ip]
	ldr r3, [fp, r5, lsl #3]
	mov r0, r4
	mov r1, r8
	blx r3
	add r5, r5, #1
	cmp r5, r6
	blt _02098F68
_02098F94:
	ldr r0, [sp, #0x18]
	ldr r5, [sp, #0x18]
	str r0, [sp, #0x70]
	str r0, [sp, #0x6c]
	str r0, [sp, #0x68]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	addne r0, sb, #0x28
	addne r3, r4, #0x38
	ldmneia r0, {r0, r1, r2}
	stmneia r3, {r0, r1, r2}
	cmp r7, #0
	ble _02098FF4
_02098FC8:
	ldr r2, [r8, #0x18]
	mov r1, r4
	add r0, r2, r5, lsl #3
	ldr ip, [r2, r5, lsl #3]
	ldr r0, [r0, #4]
	add r2, sp, #0x68
	mov r3, sb
	blx ip
	add r5, r5, #1
	cmp r5, r7
	blt _02098FC8
_02098FF4:
	ldr r0, [sp, #0x10]
	ldrh r1, [r4, #0x20]
	cmp r0, #0
	ldrsh r0, [r4, #0x22]
	add r0, r1, r0
	strh r0, [r4, #0x20]
	ldr r1, [r4, #0x14]
	ldr r0, [sp, #8]
	mul r0, r1, r0
	mov r0, r0, asr #9
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r0, [sp, #8]
	mul r0, r1, r0
	mov r0, r0, asr #9
	str r0, [r4, #0x18]
	ldr r1, [r4, #0x1c]
	ldr r0, [sp, #8]
	mul r0, r1, r0
	mov r0, r0, asr #9
	str r0, [r4, #0x1c]
	ldr r1, [r4, #0x14]
	ldr r0, [sp, #0x68]
	add r0, r1, r0
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r0, [sp, #0x6c]
	add r0, r1, r0
	str r0, [r4, #0x18]
	ldr r1, [r4, #0x1c]
	ldr r0, [sp, #0x70]
	add r0, r1, r0
	str r0, [r4, #0x1c]
	ldr r1, [r4, #0x14]
	ldr r0, [sb, #0x34]
	ldr r2, [r4, #8]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r4, #8]
	ldr r1, [r4, #0x18]
	ldr r0, [sb, #0x38]
	ldr r2, [r4, #0xc]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x1c]
	ldr r0, [sb, #0x3c]
	ldr r2, [r4, #0x10]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r4, #0x10]
	beq _0209912C
	ldr r0, [sp, #4]
	ldrh r2, [r4, #0x24]
	ldrb r1, [r0, #0xd]
	ldrh r3, [r4, #0x26]
	mov r2, r2, lsl #0xc
	mov r1, r1, lsl #0xc
	mov r0, r3, lsl #0xc
	smull r5, r3, r2, r1
	mov r1, #0x800
	adds r2, r5, r1
	adc r1, r3, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	mov r1, r2, asr #8
	subs r0, r0, r1
	bmi _0209912C
	ldr r1, [sp, #4]
	mov r0, r0, asr #0xc
	ldrb r1, [r1, #0xe]
	bl _s32_div_f
	cmp r1, #0
	bne _0209912C
	mov r0, r4
	mov r1, sb
	add r2, sl, #0x1c
	bl spl_gen_child
_0209912C:
	ldr r0, [sb, #0x20]
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #1
	movs r0, r0, lsr #0x1f
	beq _02099170
	ldrh r0, [r4, #0x2e]
	ldr r1, [sl, #0x38]
	bic r0, r0, #0xfc00
	mov r1, r1, lsl #8
	mov r1, r1, lsr #0x1a
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r1, r1, #0x3f
	orr r0, r0, r1, lsl #10
	strh r0, [r4, #0x2e]
	b _020991F0
_02099170:
	ldrh r0, [r4, #0x2e]
	ldr r2, [sl, #0x38]
	add r1, sl, #0x38
	bic r0, r0, #0xfc00
	mov r2, r2, lsl #0xe
	mov r2, r2, lsr #0x1a
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	and r2, r2, #0x3f
	orr r0, r0, r2, lsl #10
	strh r0, [r4, #0x2e]
	ldr r2, [sl, #0x38]
	bic r0, r2, #0x3f000
	mov r2, r2, lsl #0xe
	mov r2, r2, lsr #0x1a
	add r2, r2, #1
	and r2, r2, #0x3f
	orr r0, r0, r2, lsl #12
	str r0, [sl, #0x38]
	ldr r2, [sl, #0x38]
	mov r0, r2, lsl #0xe
	mov r3, r0, lsr #0x1a
	mov r0, r2, lsl #0x14
	cmp r3, r0, lsr #26
	bls _020991F0
	mov r0, r2, lsl #0x1a
	mov r0, r0, lsr #0x1a
	and r0, r0, #0x3f
	ldr r2, [r1]
	bic r2, r2, #0x3f000
	orr r0, r2, r0, lsl #12
	str r0, [r1]
_020991F0:
	ldrh r0, [r4, #0x26]
	add r0, r0, #1
	strh r0, [r4, #0x26]
	ldrh r1, [r4, #0x26]
	ldrh r0, [r4, #0x24]
	cmp r1, r0
	bls _02099224
	mov r1, r4
	add r0, sb, #8
	bl spl_del
	mov r1, r0
	add r0, sl, #0x1c
	bl spl_push_front
_02099224:
	ldr r0, [sp]
	cmp r0, #0
	mov r4, r0
	bne _02098F2C
_02099234:
	ldr r0, [sp, #0x24]
	mov r0, r0, lsl #0xf
	movs r0, r0, lsr #0x1f
	beq _0209953C
	ldr r0, [sp, #4]
	mov r6, #0
	ldrh r0, [r0]
	mov r0, r0, lsl #0x1e
	movs r0, r0, lsr #0x1f
	ldrne r0, _02099584 ; =spl_chld_scl_out
	strne r6, [sp, #0x4c]
	strne r0, [sp, #0x48]
	ldr r0, [sp, #4]
	addne r6, r6, #1
	ldrh r0, [r0]
	mov r0, r0, lsl #0x1d
	movs r0, r0, lsr #0x1f
	beq _02099298
	ldr r2, _02099588 ; =spl_chld_alp_out
	add r1, sp, #0x48
	str r2, [r1, r6, lsl #3]
	add r0, sp, #0x4c
	mov r1, #0
	str r1, [r0, r6, lsl #3]
	add r6, r6, #1
_02099298:
	ldr r0, [sp, #4]
	ldr r5, [sb, #0x14]
	ldrh r0, [r0]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	moveq r7, #0
	cmp r5, #0
	beq _0209953C
	mov r0, #0
	str r0, [sp, #0x1c]
_020992C0:
	ldrh r2, [r5, #0x26]
	ldr r0, [r5]
	ldrh r1, [r5, #0x24]
	str r0, [sp, #0x14]
	mov r0, r2, lsl #8
	bl _s32_div_f
	ldr r4, [sp, #0x1c]
	strb r0, [sp, #0x20]
	cmp r6, #0
	ble _02099310
	ldrb fp, [sp, #0x20]
_020992EC:
	add r3, sp, #0x48
	ldr r3, [r3, r4, lsl #3]
	mov r0, r5
	mov r1, r8
	mov r2, fp
	blx r3
	add r4, r4, #1
	cmp r4, r6
	blt _020992EC
_02099310:
	ldr r0, [sp, #0x1c]
	ldr r4, [sp, #0x1c]
	str r0, [sp, #0x70]
	str r0, [sp, #0x6c]
	str r0, [sp, #0x68]
	ldr r0, [sp, #4]
	ldrh r0, [r0]
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	addne r0, sb, #0x28
	addne r3, r5, #0x38
	ldmneia r0, {r0, r1, r2}
	stmneia r3, {r0, r1, r2}
	cmp r7, #0
	ble _02099378
_0209934C:
	ldr r2, [r8, #0x18]
	mov r1, r5
	add r0, r2, r4, lsl #3
	ldr fp, [r2, r4, lsl #3]
	ldr r0, [r0, #4]
	add r2, sp, #0x68
	mov r3, sb
	blx fp
	add r4, r4, #1
	cmp r4, r7
	blt _0209934C
_02099378:
	ldrh r1, [r5, #0x20]
	ldrsh r0, [r5, #0x22]
	add r0, r1, r0
	strh r0, [r5, #0x20]
	ldr r1, [r5, #0x14]
	ldr r0, [sp, #8]
	mul r0, r1, r0
	mov r0, r0, asr #9
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r0, [sp, #8]
	mul r0, r1, r0
	mov r0, r0, asr #9
	str r0, [r5, #0x18]
	ldr r1, [r5, #0x1c]
	ldr r0, [sp, #8]
	mul r0, r1, r0
	mov r0, r0, asr #9
	str r0, [r5, #0x1c]
	ldr r1, [r5, #0x14]
	ldr r0, [sp, #0x68]
	add r0, r1, r0
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r0, [sp, #0x6c]
	add r0, r1, r0
	str r0, [r5, #0x18]
	ldr r1, [r5, #0x1c]
	ldr r0, [sp, #0x70]
	add r0, r1, r0
	str r0, [r5, #0x1c]
	ldr r1, [r5, #0x14]
	ldr r0, [sb, #0x34]
	ldr r2, [r5, #8]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r5, #8]
	ldr r1, [r5, #0x18]
	ldr r0, [sb, #0x38]
	ldr r2, [r5, #0xc]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r5, #0xc]
	ldr r1, [r5, #0x1c]
	ldr r0, [sb, #0x3c]
	ldr r2, [r5, #0x10]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r5, #0x10]
	ldr r0, [sb, #0x20]
	ldr r0, [r0]
	ldr r0, [r0]
	movs r0, r0, lsr #0x1f
	beq _0209947C
	ldr r0, [sl, #0x38]
	ldrh r1, [r5, #0x2e]
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x1a
	bic r1, r1, #0xfc00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	and r0, r0, #0x3f
	orr r0, r1, r0, lsl #10
	strh r0, [r5, #0x2e]
	b _020994FC
_0209947C:
	ldr r0, [sl, #0x38]
	ldrh r1, [r5, #0x2e]
	mov r0, r0, lsl #0xe
	mov r0, r0, lsr #0x1a
	bic r1, r1, #0xfc00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	and r0, r0, #0x3f
	orr r0, r1, r0, lsl #10
	strh r0, [r5, #0x2e]
	ldr r1, [sl, #0x38]
	add r0, sl, #0x38
	bic r2, r1, #0x3f000
	mov r1, r1, lsl #0xe
	mov r1, r1, lsr #0x1a
	add r1, r1, #1
	and r1, r1, #0x3f
	orr r1, r2, r1, lsl #12
	str r1, [sl, #0x38]
	ldr r2, [sl, #0x38]
	mov r1, r2, lsl #0xe
	mov r3, r1, lsr #0x1a
	mov r1, r2, lsl #0x14
	cmp r3, r1, lsr #26
	bls _020994FC
	mov r1, r2, lsl #0x1a
	mov r1, r1, lsr #0x1a
	and r1, r1, #0x3f
	ldr r2, [r0]
	bic r2, r2, #0x3f000
	orr r1, r2, r1, lsl #12
	str r1, [r0]
_020994FC:
	ldrh r0, [r5, #0x26]
	add r0, r0, #1
	strh r0, [r5, #0x26]
	ldrh r1, [r5, #0x26]
	ldrh r0, [r5, #0x24]
	cmp r1, r0
	bls _02099530
	mov r1, r5
	add r0, sb, #0x14
	bl spl_del
	mov r1, r0
	add r0, sl, #0x1c
	bl spl_push_front
_02099530:
	ldr r5, [sp, #0x14]
	movs r0, r5
	bne _020992C0
_0209953C:
	ldrh r0, [sb, #0x4c]
	add r0, r0, #1
	strh r0, [sb, #0x4c]
	ldr r2, [sb, #0x90]
	cmp r2, #0
	addeq sp, sp, #0x74
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	mov r0, sb
	mov r1, #1
	blx r2
	add sp, sp, #0x74
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02099574: .word spl_scl_in_out
_02099578: .word spl_clr_in_out
_0209957C: .word spl_alp_in_out
_02099580: .word spl_tex_ptn_anm
_02099584: .word spl_chld_scl_out
_02099588: .word spl_chld_alp_out
	arm_func_end spl_calc

	arm_func_start spl_init
spl_init: ; 0x0209958C
	stmdb sp!, {r4, r5, r6, lr}
	str r1, [r0, #0x20]
	mov r3, #0
	str r3, [r0, #0x24]
	ldr r1, [r0, #0x20]
	ldr r5, [r2]
	ldr r1, [r1]
	ldr r4, _02099850 ; =0x00007FFF
	ldr r1, [r1, #4]
	ldr ip, _02099854 ; =0x0007FFFF
	add r1, r5, r1
	str r1, [r0, #0x28]
	ldr r1, [r0, #0x20]
	ldr r6, [r2, #4]
	ldr r1, [r1]
	mov lr, #0x80000000
	ldr r5, [r1, #8]
	mov r1, #0x1000
	add r5, r6, r5
	str r5, [r0, #0x2c]
	ldr r5, [r0, #0x20]
	ldr r6, [r2, #8]
	ldr r2, [r5]
	ldr r2, [r2, #0xc]
	add r2, r6, r2
	str r2, [r0, #0x30]
	str r3, [r0, #0x40]
	str r3, [r0, #0x44]
	str r3, [r0, #0x48]
	str r3, [r0, #0x3c]
	ldr r2, [r0, #0x3c]
	str r2, [r0, #0x38]
	ldr r2, [r0, #0x38]
	str r2, [r0, #0x34]
	strh r3, [r0, #0x4c]
	strh r3, [r0, #0x4e]
	ldr r2, [r0, #0x20]
	ldr r5, [r2]
	ldrh r3, [r5, #0x1c]
	ldrh r2, [r5, #0x1e]
	strh r3, [r0, #0x50]
	strh r2, [r0, #0x52]
	ldrh r2, [r5, #0x20]
	strh r2, [r0, #0x54]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldrh r2, [r2, #0x38]
	strh r2, [r0, #0x56]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x10]
	str r2, [r0, #0x58]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x14]
	str r2, [r0, #0x5c]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x18]
	str r2, [r0, #0x60]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x24]
	str r2, [r0, #0x64]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x28]
	str r2, [r0, #0x68]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x2c]
	str r2, [r0, #0x6c]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldrh r2, [r2, #0x3e]
	strh r2, [r0, #0x70]
	strh r4, [r0, #0x72]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldrb r2, [r2, #0x44]
	strb r2, [r0, #0x80]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldrb r2, [r2, #0x45]
	strb r2, [r0, #0x81]
	ldr r2, [r0, #0x80]
	bic r2, r2, #0x70000
	str r2, [r0, #0x80]
	ldr r2, [r0, #0x80]
	and r2, r2, ip
	str r2, [r0, #0x80]
	str lr, [r0, #0x74]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x48]
	mov r2, r2, lsl #6
	mov r2, r2, lsr #0x1e
	mov r2, r1, lsl r2
	strh r2, [r0, #0x78]
	ldr r2, [r0, #0x20]
	ldr r2, [r2]
	ldr r2, [r2, #0x48]
	mov r2, r2, lsl #4
	mov r2, r2, lsr #0x1e
	mov r1, r1, lsl r2
	strh r1, [r0, #0x7a]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #0x4c]
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	ldrnesh r2, [r0, #0x78]
	mvnne r1, #0
	smulbbne r1, r2, r1
	strneh r1, [r0, #0x78]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #0x4c]
	mov r1, r1, lsl #0x1e
	movs r1, r1, lsr #0x1f
	ldrnesh r2, [r0, #0x7a]
	mvnne r1, #0
	smulbbne r1, r2, r1
	strneh r1, [r0, #0x7a]
	ldr r2, [r0, #0x20]
	ldr r1, [r2]
	ldr r1, [r1]
	mov r1, r1, lsl #0xf
	movs r1, r1, lsr #0x1f
	beq _02099814
	ldr r1, [r2, #0x14]
	mov r2, #0x1000
	ldr r1, [r1, #0x10]
	mov r1, r1, lsl #0x1e
	mov r1, r1, lsr #0x1e
	mov r1, r2, lsl r1
	strh r1, [r0, #0x7c]
	ldr r1, [r0, #0x20]
	ldr r1, [r1, #0x14]
	ldr r1, [r1, #0x10]
	mov r1, r1, lsl #0x1c
	mov r1, r1, lsr #0x1e
	mov r1, r2, lsl r1
	strh r1, [r0, #0x7e]
	ldr r1, [r0, #0x20]
	ldr r1, [r1, #0x14]
	ldr r1, [r1, #0x10]
	mov r1, r1, lsl #0x1b
	movs r1, r1, lsr #0x1f
	ldrnesh r2, [r0, #0x7c]
	mvnne r1, #0
	smulbbne r1, r2, r1
	strneh r1, [r0, #0x7c]
	ldr r1, [r0, #0x20]
	ldr r1, [r1, #0x14]
	ldr r1, [r1, #0x10]
	mov r1, r1, lsl #0x1a
	movs r1, r1, lsr #0x1f
	ldrnesh r2, [r0, #0x7e]
	mvnne r1, #0
	smulbbne r1, r2, r1
	strneh r1, [r0, #0x7e]
_02099814:
	mov r2, #0
	str r2, [r0, #4]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #0x14]
	ldr r1, [r0, #0x14]
	str r1, [r0, #8]
	str r2, [r0, #0x18]
	ldr r1, [r0, #0x18]
	str r1, [r0, #0xc]
	str r2, [r0, #0x90]
	str r2, [r0, #0x94]
	str r2, [r0, #0x98]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02099850: .word 0x00007FFF
_02099854: .word 0x0007FFFF
	arm_func_end spl_init

	arm_func_start spl_set_tex_dummy
spl_set_tex_dummy: ; 0x02099858
	bx lr
	arm_func_end spl_set_tex_dummy

	arm_func_start spl_set_tex
spl_set_tex: ; 0x0209985C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	ldr r7, [r0, #0xc]
	ldr r3, _02099934 ; =0x040004A8
	str r7, [sp]
	ldr r1, [r0, #4]
	mov r2, r7, lsl #0x1c
	mov lr, r2, lsr #0x1c
	mov r1, r1, lsr #3
	orr ip, r1, lr, lsl #26
	mov r4, r7, lsl #0x18
	mov r5, r7, lsl #0x14
	mov r2, r7, lsl #0xf
	mov r4, r4, lsr #0x1c
	orr ip, ip, #0x40000000
	mov r6, r7, lsl #0x12
	orr ip, ip, r4, lsl #20
	mov r5, r5, lsr #0x1c
	mov r1, r7, lsl #0x10
	orr ip, ip, r5, lsl #23
	mov r4, r6, lsr #0x1e
	mov r5, r1, lsr #0x1e
	orr r1, ip, r4, lsl #16
	mov r2, r2, lsr #0x1f
	orr r1, r1, r5, lsl #18
	orr r1, r1, r2, lsl #29
	str r1, [r3]
	cmp lr, #2
	moveq r1, #1
	movne r1, #0
	ldr r2, [r0, #8]
	rsb r1, r1, #4
	mov r2, r2, lsr r1
	ldr r1, _02099938 ; =0x040004AC
	ldr ip, _0209993C ; =0x04000440
	str r2, [r1]
	mov r2, #3
	ldr r1, _02099940 ; =0x04000454
	str r2, [ip]
	mov r3, #0
	str r3, [r1]
	ldrh r1, [r0, #0x10]
	ldrh r2, [r0, #0x12]
	ldr r0, _02099944 ; =0x0400046C
	mov r1, r1, lsl #0xc
	str r1, [r0]
	mov r1, r2, lsl #0xc
	str r1, [r0]
	str r3, [r0]
	mov r0, #1
	str r0, [ip]
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02099934: .word 0x040004A8
_02099938: .word 0x040004AC
_0209993C: .word 0x04000440
_02099940: .word 0x04000454
_02099944: .word 0x0400046C
	arm_func_end spl_set_tex

	arm_func_start spl_draw_chld_dpl
spl_draw_chld_dpl: ; 0x02099948
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xf0
	mov r4, r1
	ldrh r2, [r4, #0x2e]
	mov r5, r0
	ldr r0, [r5, #0x3c]
	mov r1, r2, lsl #0x16
	mov r3, r2, lsl #0x1b
	mov r1, r1, lsr #0x1b
	mov r3, r3, lsr #0x1b
	add r1, r1, #1
	mul r6, r3, r1
	mov r1, r2, lsl #0x10
	movs r2, r6, asr #5
	mov r1, r1, lsr #0x1a
	orr r0, r0, #0xc0
	orr r1, r0, r1, lsl #24
	ldr r0, _02099DA4 ; =0x040004A4
	orr r1, r1, r2, lsl #16
	str r1, [r0]
	addeq sp, sp, #0xf0
	ldr r0, [r0]
	ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r0, [r5, #0x40]
	ldrh r1, [r4, #0x20]
	ldr r0, [r0, #0x20]
	ldr r6, _02099DA8 ; =FX_SinCosTable_
	ldr r0, [r0, #0x14]
	mov r1, r1, asr #4
	ldrh r0, [r0]
	mov r2, r1, lsl #1
	add r1, r2, #1
	mov r7, r2, lsl #1
	mov r1, r1, lsl #1
	mov r0, r0, lsl #0x15
	mov r3, r0, lsr #0x1e
	ldr r2, _02099DAC ; =_021105E4
	ldrsh r0, [r6, r7]
	ldr r3, [r2, r3, lsl #2]
	ldrsh r1, [r6, r1]
	add r2, sp, #0x30
	blx r3
	add r0, sp, #0xc0
	bl MTX_Identity43_
	ldr r0, [r5, #0x40]
	ldr r0, [r0, #0x20]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x10]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	bne _02099A28
	add r1, sp, #0x90
	add r0, r4, #0x14
	bl VEC_Normalize
	b _02099A58
_02099A28:
	add r1, sp, #0x90
	add r0, r4, #8
	bl VEC_Normalize
	ldr r2, [sp, #0x90]
	ldr r1, [sp, #0x94]
	ldr r0, [sp, #0x98]
	rsb r2, r2, #0
	rsb r1, r1, #0
	rsb r0, r0, #0
	str r2, [sp, #0x90]
	str r1, [sp, #0x94]
	str r0, [sp, #0x98]
_02099A58:
	mov r3, #0
	mov r2, #0x1000
	add r0, sp, #0x90
	add r1, sp, #0xb4
	str r3, [sp, #0xb4]
	str r2, [sp, #0xb8]
	str r3, [sp, #0xbc]
	bl VEC_DotProduct
	ldr r1, _02099DB0 ; =0x00000CCD
	cmp r0, r1
	bgt _02099A90
	ldr r1, _02099DB4 ; =0xFFFFF333
	cmp r0, r1
	bge _02099AA4
_02099A90:
	mov r0, #0
	mov r1, #0x1000
	str r1, [sp, #0xb4]
	str r0, [sp, #0xb8]
	str r0, [sp, #0xbc]
_02099AA4:
	add r0, sp, #0x90
	add r1, sp, #0xb4
	add r2, sp, #0x9c
	bl VEC_CrossProduct
	add r0, sp, #0x90
	add r1, sp, #0x9c
	add r2, sp, #0xa8
	bl VEC_CrossProduct
	ldr r7, [sp, #0x9c]
	ldr r6, [sp, #0xa0]
	ldr r3, [sp, #0xa4]
	ldr r0, [sp, #0x90]
	ldr r1, [sp, #0x94]
	ldr r2, [sp, #0x98]
	str r7, [sp, #0xc0]
	ldr r7, [sp, #0xa8]
	str r6, [sp, #0xc4]
	ldr r6, [sp, #0xac]
	str r3, [sp, #0xc8]
	ldr r3, [sp, #0xb0]
	str r0, [sp, #0xcc]
	str r1, [sp, #0xd0]
	add r0, sp, #0x30
	str r2, [sp, #0xd4]
	add r1, sp, #0xc0
	mov r2, r0
	str r7, [sp, #0xd8]
	str r6, [sp, #0xdc]
	str r3, [sp, #0xe0]
	bl MTX_Concat43
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0x30]
	ldr r0, [r0, #0x20]
	mov ip, #0x800
	ldr r0, [r0]
	mov r3, r2, asr #0x1f
	ldrsh r1, [r0, #0x30]
	ldr r0, [r0, #0x48]
	mov lr, #0
	smull r6, r1, r2, r1
	adds r7, r6, ip
	adc r6, r1, #0
	mov r0, r0, lsl #1
	mov r1, r7, lsr #0xc
	orr r1, r1, r6, lsl #20
	movs r0, r0, lsr #0x1d
	beq _02099B74
	cmp r0, #1
	beq _02099BB0
	cmp r0, #2
	beq _02099BCC
	b _02099BF0
_02099B74:
	ldrsh r0, [r4, #0x34]
	mov r8, r0, asr #0x1f
	umull r7, r6, r2, r0
	mla r6, r2, r8, r6
	smull r8, r2, r1, r0
	adds r1, r8, ip
	adc r8, r2, lr
	adds r2, r7, ip
	mla r6, r3, r0, r6
	mov r1, r1, lsr #0xc
	adc r0, r6, lr
	mov r2, r2, lsr #0xc
	orr r1, r1, r8, lsl #20
	orr r2, r2, r0, lsl #20
	b _02099BF0
_02099BB0:
	ldrsh r0, [r4, #0x34]
	smull r3, r0, r1, r0
	adds r1, r3, ip
	adc r0, r0, lr
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	b _02099BF0
_02099BCC:
	ldrsh r6, [r4, #0x34]
	mov r0, r6, asr #0x1f
	umull r8, r7, r2, r6
	mla r7, r2, r0, r7
	adds r2, r8, ip
	mla r7, r3, r6, r7
	adc r0, r7, lr
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
_02099BF0:
	add r0, sp, #0x60
	mov r3, r2
	bl MTX_Scale43_
	add r0, sp, #0x30
	add r1, sp, #0x60
	add r2, sp, #0
	bl MTX_Concat43
	ldr r0, [r5, #0x40]
	ldr r0, [r0, #0x20]
	ldr r3, [r0]
	ldr r0, [r3]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _02099C6C
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x38]
	add r0, r1, r0
	str r0, [sp, #0x24]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x3c]
	add r0, r1, r0
	str r0, [sp, #0x28]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x40]
	add r0, r1, r0
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x44]
	bl G3_LoadMtx43
	add r0, sp, #0
	bl G3_MultMtx43
	b _02099D10
_02099C6C:
	ldr r2, [r4, #8]
	ldr r1, [r4, #0x38]
	ldr r0, [r3, #4]
	add r1, r2, r1
	sub r0, r1, r0
	str r0, [sp, #0x24]
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldr r1, [r4, #0x3c]
	ldr r0, [r0]
	add r2, r2, r1
	ldr r1, [r0, #8]
	ldr r0, _02099DB8 ; =0x04000454
	sub r1, r2, r1
	str r1, [sp, #0x28]
	ldr r1, [r5, #0x40]
	ldr r3, [r4, #0x10]
	ldr r1, [r1, #0x20]
	ldr r2, [r4, #0x40]
	ldr r1, [r1]
	add r3, r3, r2
	ldr r2, [r1, #0xc]
	mov r1, #0
	sub r2, r3, r2
	str r2, [sp, #0x2c]
	str r1, [r0]
	ldr r1, [r5, #0x40]
	ldr r0, _02099DBC ; =0x04000470
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #8]
	ldr r1, [r1, #4]
	str r1, [r0]
	str r2, [r0]
	str r3, [r0]
	ldr r0, [r5, #0x44]
	bl G3_MultMtx43
	add r0, sp, #0
	bl G3_MultMtx43
_02099D10:
	ldr r0, [r5, #0x40]
	ldrh r4, [r4, #0x36]
	ldrh ip, [r0, #0x72]
	mov r2, #0
	and r1, r4, #0x1f
	and r0, ip, #0x1f
	mul r3, r1, r0
	and r1, r4, #0x3e0
	and r0, ip, #0x3e0
	mul r0, r1, r0
	and r4, r4, #0x7c00
	and r1, ip, #0x7c00
	mul ip, r4, r1
	mov r1, r3, asr #5
	mov r0, r0, asr #0xf
	mov r3, ip, asr #0x19
	orr r0, r1, r0, lsl #5
	orr r0, r0, r3, lsl #10
	mov r0, r0, lsl #0x10
	ldr r1, _02099DC0 ; =0x04000480
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r5, [r5, #0x40]
	ldr r4, _02099DC4 ; =_021105DC
	ldr r1, [r5, #0x20]
	ldrsh r0, [r5, #0x7c]
	ldr r3, [r1, #0x14]
	ldrsh r1, [r5, #0x7e]
	ldrh r5, [r3]
	mov r3, r2
	mov r5, r5, lsl #0x14
	mov r5, r5, lsr #0x1f
	ldr r4, [r4, r5, lsl #2]
	blx r4
	add sp, sp, #0xf0
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02099DA4: .word 0x040004A4
_02099DA8: .word FX_SinCosTable_
_02099DAC: .word _021105E4
_02099DB0: .word 0x00000CCD
_02099DB4: .word 0xFFFFF333
_02099DB8: .word 0x04000454
_02099DBC: .word 0x04000470
_02099DC0: .word 0x04000480
_02099DC4: .word _021105DC
	arm_func_end spl_draw_chld_dpl

	arm_func_start spl_draw_dpl
spl_draw_dpl: ; 0x02099DC8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xf0
	mov r4, r1
	ldrh r2, [r4, #0x2e]
	mov r5, r0
	ldr r0, [r5, #0x3c]
	mov r1, r2, lsl #0x16
	mov r3, r2, lsl #0x1b
	mov r1, r1, lsr #0x1b
	mov r3, r3, lsr #0x1b
	add r1, r1, #1
	mul r6, r3, r1
	mov r1, r2, lsl #0x10
	movs r2, r6, asr #5
	mov r1, r1, lsr #0x1a
	orr r0, r0, #0xc0
	orr r1, r0, r1, lsl #24
	ldr r0, _0209A220 ; =0x040004A4
	orr r1, r1, r2, lsl #16
	str r1, [r0]
	addeq sp, sp, #0xf0
	ldr r0, [r0]
	ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r0, [r5, #0x40]
	ldrh r1, [r4, #0x20]
	ldr r0, [r0, #0x20]
	ldr r6, _0209A224 ; =FX_SinCosTable_
	ldr r0, [r0]
	mov r1, r1, asr #4
	mov r2, r1, lsl #1
	ldr r0, [r0]
	add r1, r2, #1
	mov r7, r2, lsl #1
	mov r1, r1, lsl #1
	mov r0, r0, lsl #0xd
	mov r3, r0, lsr #0x1e
	ldr r2, _0209A228 ; =_021105E4
	ldrsh r0, [r6, r7]
	ldr r3, [r2, r3, lsl #2]
	ldrsh r1, [r6, r1]
	add r2, sp, #0x30
	blx r3
	add r0, sp, #0xc0
	bl MTX_Identity43_
	ldr r0, [r5, #0x40]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #0x48]
	movs r0, r0, lsr #0x1f
	bne _02099EA4
	add r1, sp, #0x90
	add r0, r4, #0x14
	bl VEC_Normalize
	b _02099ED4
_02099EA4:
	add r1, sp, #0x90
	add r0, r4, #8
	bl VEC_Normalize
	ldr r2, [sp, #0x90]
	ldr r1, [sp, #0x94]
	ldr r0, [sp, #0x98]
	rsb r2, r2, #0
	rsb r1, r1, #0
	rsb r0, r0, #0
	str r2, [sp, #0x90]
	str r1, [sp, #0x94]
	str r0, [sp, #0x98]
_02099ED4:
	mov r3, #0
	mov r2, #0x1000
	add r0, sp, #0x90
	add r1, sp, #0xb4
	str r3, [sp, #0xb4]
	str r2, [sp, #0xb8]
	str r3, [sp, #0xbc]
	bl VEC_DotProduct
	ldr r1, _0209A22C ; =0x00000CCD
	cmp r0, r1
	bgt _02099F0C
	ldr r1, _0209A230 ; =0xFFFFF333
	cmp r0, r1
	bge _02099F20
_02099F0C:
	mov r0, #0
	mov r1, #0x1000
	str r1, [sp, #0xb4]
	str r0, [sp, #0xb8]
	str r0, [sp, #0xbc]
_02099F20:
	add r0, sp, #0x90
	add r1, sp, #0xb4
	add r2, sp, #0x9c
	bl VEC_CrossProduct
	add r0, sp, #0x90
	add r1, sp, #0x9c
	add r2, sp, #0xa8
	bl VEC_CrossProduct
	ldr r7, [sp, #0x9c]
	ldr r6, [sp, #0xa0]
	ldr r3, [sp, #0xa4]
	ldr r0, [sp, #0x90]
	ldr r1, [sp, #0x94]
	ldr r2, [sp, #0x98]
	str r7, [sp, #0xc0]
	ldr r7, [sp, #0xa8]
	str r6, [sp, #0xc4]
	ldr r6, [sp, #0xac]
	str r3, [sp, #0xc8]
	ldr r3, [sp, #0xb0]
	str r0, [sp, #0xcc]
	str r1, [sp, #0xd0]
	add r0, sp, #0x30
	str r2, [sp, #0xd4]
	add r1, sp, #0xc0
	mov r2, r0
	str r7, [sp, #0xd8]
	str r6, [sp, #0xdc]
	str r3, [sp, #0xe0]
	bl MTX_Concat43
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0x30]
	ldr r0, [r0, #0x20]
	mov ip, #0x800
	ldr r0, [r0]
	mov r3, r2, asr #0x1f
	ldrsh r1, [r0, #0x30]
	ldr r0, [r0, #0x48]
	mov lr, #0
	smull r6, r1, r2, r1
	adds r7, r6, ip
	adc r6, r1, #0
	mov r0, r0, lsl #1
	mov r1, r7, lsr #0xc
	orr r1, r1, r6, lsl #20
	movs r0, r0, lsr #0x1d
	beq _02099FF0
	cmp r0, #1
	beq _0209A02C
	cmp r0, #2
	beq _0209A048
	b _0209A06C
_02099FF0:
	ldrsh r0, [r4, #0x34]
	mov r8, r0, asr #0x1f
	umull r7, r6, r2, r0
	mla r6, r2, r8, r6
	smull r8, r2, r1, r0
	adds r1, r8, ip
	adc r8, r2, lr
	adds r2, r7, ip
	mla r6, r3, r0, r6
	mov r1, r1, lsr #0xc
	adc r0, r6, lr
	mov r2, r2, lsr #0xc
	orr r1, r1, r8, lsl #20
	orr r2, r2, r0, lsl #20
	b _0209A06C
_0209A02C:
	ldrsh r0, [r4, #0x34]
	smull r3, r0, r1, r0
	adds r1, r3, ip
	adc r0, r0, lr
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	b _0209A06C
_0209A048:
	ldrsh r6, [r4, #0x34]
	mov r0, r6, asr #0x1f
	umull r8, r7, r2, r6
	mla r7, r2, r0, r7
	adds r2, r8, ip
	mla r7, r3, r6, r7
	adc r0, r7, lr
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
_0209A06C:
	add r0, sp, #0x60
	mov r3, r2
	bl MTX_Scale43_
	add r0, sp, #0x60
	add r1, sp, #0x30
	add r2, sp, #0
	bl MTX_Concat43
	ldr r0, [r5, #0x40]
	ldr r0, [r0, #0x20]
	ldr r3, [r0]
	ldr r0, [r3]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _0209A0E8
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x38]
	add r0, r1, r0
	str r0, [sp, #0x24]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x3c]
	add r0, r1, r0
	str r0, [sp, #0x28]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x40]
	add r0, r1, r0
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x44]
	bl G3_LoadMtx43
	add r0, sp, #0
	bl G3_MultMtx43
	b _0209A18C
_0209A0E8:
	ldr r2, [r4, #8]
	ldr r1, [r4, #0x38]
	ldr r0, [r3, #4]
	add r1, r2, r1
	sub r0, r1, r0
	str r0, [sp, #0x24]
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldr r1, [r4, #0x3c]
	ldr r0, [r0]
	add r2, r2, r1
	ldr r1, [r0, #8]
	ldr r0, _0209A234 ; =0x04000454
	sub r1, r2, r1
	str r1, [sp, #0x28]
	ldr r1, [r5, #0x40]
	ldr r3, [r4, #0x10]
	ldr r1, [r1, #0x20]
	ldr r2, [r4, #0x40]
	ldr r1, [r1]
	add r3, r3, r2
	ldr r2, [r1, #0xc]
	mov r1, #0
	sub r2, r3, r2
	str r2, [sp, #0x2c]
	str r1, [r0]
	ldr r1, [r5, #0x40]
	ldr r0, _0209A238 ; =0x04000470
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #8]
	ldr r1, [r1, #4]
	str r1, [r0]
	str r2, [r0]
	str r3, [r0]
	ldr r0, [r5, #0x44]
	bl G3_MultMtx43
	add r0, sp, #0
	bl G3_MultMtx43
_0209A18C:
	ldr r0, [r5, #0x40]
	ldrh r4, [r4, #0x36]
	ldrh ip, [r0, #0x72]
	ldr r1, _0209A23C ; =0x04000480
	and r2, r4, #0x1f
	and r0, ip, #0x1f
	mul r3, r2, r0
	and r2, r4, #0x3e0
	and r0, ip, #0x3e0
	mul r0, r2, r0
	and r4, r4, #0x7c00
	and r2, ip, #0x7c00
	mul ip, r4, r2
	mov r2, r3, asr #5
	mov r0, r0, asr #0xf
	mov r3, ip, asr #0x19
	orr r0, r2, r0, lsl #5
	orr r0, r0, r3, lsl #10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r2, [r5, #0x40]
	ldr r4, _0209A240 ; =_021105DC
	ldr r1, [r2, #0x20]
	ldrsh r0, [r2, #0x78]
	ldr ip, [r1]
	ldrsh r1, [r2, #0x7a]
	ldr r3, [ip]
	ldrsh r2, [ip, #0x50]
	mov r3, r3, lsl #0xc
	mov r5, r3, lsr #0x1f
	ldrsh r3, [ip, #0x52]
	ldr r4, [r4, r5, lsl #2]
	blx r4
	add sp, sp, #0xf0
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0209A220: .word 0x040004A4
_0209A224: .word FX_SinCosTable_
_0209A228: .word _021105E4
_0209A22C: .word 0x00000CCD
_0209A230: .word 0xFFFFF333
_0209A234: .word 0x04000454
_0209A238: .word 0x04000470
_0209A23C: .word 0x04000480
_0209A240: .word _021105DC
	arm_func_end spl_draw_dpl

	arm_func_start spl_draw_chld_pol
spl_draw_chld_pol: ; 0x0209A244
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x90
	mov r4, r1
	ldrh r2, [r4, #0x2e]
	mov r5, r0
	ldr r0, [r5, #0x3c]
	mov r1, r2, lsl #0x16
	mov r3, r2, lsl #0x1b
	mov r1, r1, lsr #0x1b
	mov r3, r3, lsr #0x1b
	add r1, r1, #1
	mul r6, r3, r1
	mov r1, r2, lsl #0x10
	movs r2, r6, asr #5
	mov r1, r1, lsr #0x1a
	orr r0, r0, #0xc0
	orr r1, r0, r1, lsl #24
	ldr r0, _0209A578 ; =0x040004A4
	orr r1, r1, r2, lsl #16
	str r1, [r0]
	addeq sp, sp, #0x90
	ldr r0, [r0]
	ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r0, [r5, #0x40]
	ldrh r1, [r4, #0x20]
	ldr r0, [r0, #0x20]
	ldr r6, _0209A57C ; =FX_SinCosTable_
	ldr r0, [r0, #0x14]
	mov r1, r1, asr #4
	ldrh r0, [r0]
	mov r2, r1, lsl #1
	add r1, r2, #1
	mov r7, r2, lsl #1
	mov r1, r1, lsl #1
	mov r0, r0, lsl #0x15
	mov r3, r0, lsr #0x1e
	ldr r2, _0209A580 ; =_021105E4
	ldrsh r0, [r6, r7]
	ldr r3, [r2, r3, lsl #2]
	ldrsh r1, [r6, r1]
	add r2, sp, #0x30
	blx r3
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0x30]
	ldr r0, [r0, #0x20]
	mov ip, #0x800
	ldr r0, [r0]
	mov r3, r2, asr #0x1f
	ldrsh r1, [r0, #0x30]
	ldr r0, [r0, #0x48]
	mov lr, #0
	smull r6, r1, r2, r1
	adds r7, r6, ip
	adc r6, r1, #0
	mov r1, r7, lsr #0xc
	mov r0, r0, lsl #1
	orr r1, r1, r6, lsl #20
	movs r0, r0, lsr #0x1d
	beq _0209A348
	cmp r0, #1
	beq _0209A384
	cmp r0, #2
	beq _0209A3A0
	b _0209A3C4
_0209A348:
	ldrsh r0, [r4, #0x34]
	mov r8, r0, asr #0x1f
	umull r7, r6, r2, r0
	mla r6, r2, r8, r6
	smull r8, r2, r1, r0
	adds r1, r8, ip
	adc r8, r2, lr
	adds r2, r7, ip
	mla r6, r3, r0, r6
	mov r1, r1, lsr #0xc
	adc r0, r6, lr
	mov r2, r2, lsr #0xc
	orr r1, r1, r8, lsl #20
	orr r2, r2, r0, lsl #20
	b _0209A3C4
_0209A384:
	ldrsh r0, [r4, #0x34]
	smull r3, r0, r1, r0
	adds r1, r3, ip
	adc r0, r0, lr
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	b _0209A3C4
_0209A3A0:
	ldrsh r6, [r4, #0x34]
	mov r0, r6, asr #0x1f
	umull r8, r7, r2, r6
	mla r7, r2, r0, r7
	adds r2, r8, ip
	mla r7, r3, r6, r7
	adc r0, r7, lr
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
_0209A3C4:
	add r0, sp, #0x60
	mov r3, r2
	bl MTX_Scale43_
	add r0, sp, #0x30
	add r1, sp, #0x60
	add r2, sp, #0
	bl MTX_Concat43
	ldr r0, [r5, #0x40]
	ldr r0, [r0, #0x20]
	ldr r3, [r0]
	ldr r0, [r3]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _0209A440
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x38]
	add r0, r1, r0
	str r0, [sp, #0x24]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x3c]
	add r0, r1, r0
	str r0, [sp, #0x28]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x40]
	add r0, r1, r0
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x44]
	bl G3_LoadMtx43
	add r0, sp, #0
	bl G3_MultMtx43
	b _0209A4E4
_0209A440:
	ldr r2, [r4, #8]
	ldr r1, [r4, #0x38]
	ldr r0, [r3, #4]
	add r1, r2, r1
	sub r0, r1, r0
	str r0, [sp, #0x24]
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldr r1, [r4, #0x3c]
	ldr r0, [r0]
	add r2, r2, r1
	ldr r1, [r0, #8]
	ldr r0, _0209A584 ; =0x04000454
	sub r1, r2, r1
	str r1, [sp, #0x28]
	ldr r1, [r5, #0x40]
	ldr r3, [r4, #0x10]
	ldr r1, [r1, #0x20]
	ldr r2, [r4, #0x40]
	ldr r1, [r1]
	add r3, r3, r2
	ldr r2, [r1, #0xc]
	mov r1, #0
	sub r2, r3, r2
	str r2, [sp, #0x2c]
	str r1, [r0]
	ldr r1, [r5, #0x40]
	ldr r0, _0209A588 ; =0x04000470
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #8]
	ldr r1, [r1, #4]
	str r1, [r0]
	str r2, [r0]
	str r3, [r0]
	ldr r0, [r5, #0x44]
	bl G3_MultMtx43
	add r0, sp, #0
	bl G3_MultMtx43
_0209A4E4:
	ldr r0, [r5, #0x40]
	ldrh r4, [r4, #0x36]
	ldrh ip, [r0, #0x72]
	mov r2, #0
	and r1, r4, #0x1f
	and r0, ip, #0x1f
	mul r3, r1, r0
	and r1, r4, #0x3e0
	and r0, ip, #0x3e0
	mul r0, r1, r0
	and r4, r4, #0x7c00
	and r1, ip, #0x7c00
	mul ip, r4, r1
	mov r1, r3, asr #5
	mov r0, r0, asr #0xf
	mov r3, ip, asr #0x19
	orr r0, r1, r0, lsl #5
	orr r0, r0, r3, lsl #10
	mov r0, r0, lsl #0x10
	ldr r1, _0209A58C ; =0x04000480
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r5, [r5, #0x40]
	ldr r4, _0209A590 ; =_021105DC
	ldr r1, [r5, #0x20]
	ldrsh r0, [r5, #0x7c]
	ldr r3, [r1, #0x14]
	ldrsh r1, [r5, #0x7e]
	ldrh r5, [r3]
	mov r3, r2
	mov r5, r5, lsl #0x14
	mov r5, r5, lsr #0x1f
	ldr r4, [r4, r5, lsl #2]
	blx r4
	add sp, sp, #0x90
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0209A578: .word 0x040004A4
_0209A57C: .word FX_SinCosTable_
_0209A580: .word _021105E4
_0209A584: .word 0x04000454
_0209A588: .word 0x04000470
_0209A58C: .word 0x04000480
_0209A590: .word _021105DC
	arm_func_end spl_draw_chld_pol

	arm_func_start spl_draw_pol
spl_draw_pol: ; 0x0209A594
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x90
	mov r4, r1
	ldrh r2, [r4, #0x2e]
	mov r5, r0
	ldr r0, [r5, #0x3c]
	mov r1, r2, lsl #0x16
	mov r3, r2, lsl #0x1b
	mov r1, r1, lsr #0x1b
	mov r3, r3, lsr #0x1b
	add r1, r1, #1
	mul r6, r3, r1
	mov r1, r2, lsl #0x10
	movs r2, r6, asr #5
	mov r1, r1, lsr #0x1a
	orr r0, r0, #0xc0
	orr r1, r0, r1, lsl #24
	ldr r0, _0209A8C8 ; =0x040004A4
	orr r1, r1, r2, lsl #16
	str r1, [r0]
	addeq sp, sp, #0x90
	ldr r0, [r0]
	ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r0, [r5, #0x40]
	ldrh r1, [r4, #0x20]
	ldr r0, [r0, #0x20]
	ldr r6, _0209A8CC ; =FX_SinCosTable_
	ldr r0, [r0]
	mov r1, r1, asr #4
	mov r2, r1, lsl #1
	ldr r0, [r0]
	add r1, r2, #1
	mov r7, r2, lsl #1
	mov r1, r1, lsl #1
	mov r0, r0, lsl #0xd
	mov r3, r0, lsr #0x1e
	ldr r2, _0209A8D0 ; =_021105E4
	ldrsh r0, [r6, r7]
	ldr r3, [r2, r3, lsl #2]
	ldrsh r1, [r6, r1]
	add r2, sp, #0x30
	blx r3
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0x30]
	ldr r0, [r0, #0x20]
	mov ip, #0x800
	ldr r0, [r0]
	mov r3, r2, asr #0x1f
	ldrsh r1, [r0, #0x30]
	ldr r0, [r0, #0x48]
	mov lr, #0
	smull r6, r1, r2, r1
	adds r7, r6, ip
	adc r6, r1, #0
	mov r1, r7, lsr #0xc
	mov r0, r0, lsl #1
	orr r1, r1, r6, lsl #20
	movs r0, r0, lsr #0x1d
	beq _0209A698
	cmp r0, #1
	beq _0209A6D4
	cmp r0, #2
	beq _0209A6F0
	b _0209A714
_0209A698:
	ldrsh r0, [r4, #0x34]
	mov r8, r0, asr #0x1f
	umull r7, r6, r2, r0
	mla r6, r2, r8, r6
	smull r8, r2, r1, r0
	adds r1, r8, ip
	adc r8, r2, lr
	adds r2, r7, ip
	mla r6, r3, r0, r6
	mov r1, r1, lsr #0xc
	adc r0, r6, lr
	mov r2, r2, lsr #0xc
	orr r1, r1, r8, lsl #20
	orr r2, r2, r0, lsl #20
	b _0209A714
_0209A6D4:
	ldrsh r0, [r4, #0x34]
	smull r3, r0, r1, r0
	adds r1, r3, ip
	adc r0, r0, lr
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	b _0209A714
_0209A6F0:
	ldrsh r6, [r4, #0x34]
	mov r0, r6, asr #0x1f
	umull r8, r7, r2, r6
	mla r7, r2, r0, r7
	adds r2, r8, ip
	mla r7, r3, r6, r7
	adc r0, r7, lr
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
_0209A714:
	add r0, sp, #0x60
	mov r3, r2
	bl MTX_Scale43_
	add r0, sp, #0x60
	add r1, sp, #0x30
	add r2, sp, #0
	bl MTX_Concat43
	ldr r0, [r5, #0x40]
	ldr r0, [r0, #0x20]
	ldr r3, [r0]
	ldr r0, [r3]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _0209A790
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x38]
	add r0, r1, r0
	str r0, [sp, #0x24]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x3c]
	add r0, r1, r0
	str r0, [sp, #0x28]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x40]
	add r0, r1, r0
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x44]
	bl G3_LoadMtx43
	add r0, sp, #0
	bl G3_MultMtx43
	b _0209A834
_0209A790:
	ldr r2, [r4, #8]
	ldr r1, [r4, #0x38]
	ldr r0, [r3, #4]
	add r1, r2, r1
	sub r0, r1, r0
	str r0, [sp, #0x24]
	ldr r0, [r5, #0x40]
	ldr r2, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldr r1, [r4, #0x3c]
	ldr r0, [r0]
	add r2, r2, r1
	ldr r1, [r0, #8]
	ldr r0, _0209A8D4 ; =0x04000454
	sub r1, r2, r1
	str r1, [sp, #0x28]
	ldr r1, [r5, #0x40]
	ldr r3, [r4, #0x10]
	ldr r1, [r1, #0x20]
	ldr r2, [r4, #0x40]
	ldr r1, [r1]
	add r3, r3, r2
	ldr r2, [r1, #0xc]
	mov r1, #0
	sub r2, r3, r2
	str r2, [sp, #0x2c]
	str r1, [r0]
	ldr r1, [r5, #0x40]
	ldr r0, _0209A8D8 ; =0x04000470
	ldr r1, [r1, #0x20]
	ldr r1, [r1]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #8]
	ldr r1, [r1, #4]
	str r1, [r0]
	str r2, [r0]
	str r3, [r0]
	ldr r0, [r5, #0x44]
	bl G3_MultMtx43
	add r0, sp, #0
	bl G3_MultMtx43
_0209A834:
	ldr r0, [r5, #0x40]
	ldrh r4, [r4, #0x36]
	ldrh ip, [r0, #0x72]
	ldr r1, _0209A8DC ; =0x04000480
	and r2, r4, #0x1f
	and r0, ip, #0x1f
	mul r3, r2, r0
	and r2, r4, #0x3e0
	and r0, ip, #0x3e0
	mul r0, r2, r0
	and r4, r4, #0x7c00
	and r2, ip, #0x7c00
	mul ip, r4, r2
	mov r2, r3, asr #5
	mov r0, r0, asr #0xf
	mov r3, ip, asr #0x19
	orr r0, r2, r0, lsl #5
	orr r0, r0, r3, lsl #10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r2, [r5, #0x40]
	ldr r4, _0209A8E0 ; =_021105DC
	ldr r1, [r2, #0x20]
	ldrsh r0, [r2, #0x78]
	ldr ip, [r1]
	ldrsh r1, [r2, #0x7a]
	ldr r3, [ip]
	ldrsh r2, [ip, #0x50]
	mov r3, r3, lsl #0xc
	mov r5, r3, lsr #0x1f
	ldrsh r3, [ip, #0x52]
	ldr r4, [r4, r5, lsl #2]
	blx r4
	add sp, sp, #0x90
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0209A8C8: .word 0x040004A4
_0209A8CC: .word FX_SinCosTable_
_0209A8D0: .word _021105E4
_0209A8D4: .word 0x04000454
_0209A8D8: .word 0x04000470
_0209A8DC: .word 0x04000480
_0209A8E0: .word _021105DC
	arm_func_end spl_draw_pol

	arm_func_start spl_draw_chld_dbb
spl_draw_chld_dbb: ; 0x0209A8E4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x88
	mov r6, r1
	ldrh r1, [r6, #0x2e]
	mov r7, r0
	ldr r4, [r7, #0x40]
	mov r0, r1, lsl #0x16
	mov r2, r1, lsl #0x1b
	mov r0, r0, lsr #0x1b
	mov r2, r2, lsr #0x1b
	add r0, r0, #1
	mul r3, r2, r0
	ldr r2, [r4, #0x20]
	movs r3, r3, asr #5
	ldr r0, [r7, #0x3c]
	ldr r4, [r2]
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x1a
	orr r1, r0, #0xc0
	orr r2, r1, r2, lsl #24
	ldrsh r0, [r4, #0x30]
	ldr r8, [r7, #0x44]
	ldr r1, _0209AFB4 ; =0x040004A4
	orr r2, r2, r3, lsl #16
	str r2, [r1]
	addeq sp, sp, #0x88
	ldr r1, [r1]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
	ldr r4, [r6, #0x30]
	ldr r1, [r7, #0x40]
	smull r2, r5, r4, r0
	ldr r0, [r1, #0x20]
	mov r3, #0x800
	adds r1, r2, r3
	ldr r2, [r0]
	adc sb, r5, #0
	ldr r0, [r2, #0x48]
	mov r5, r1, lsr #0xc
	mov r0, r0, lsl #1
	mov r1, r4, asr #0x1f
	orr r5, r5, sb, lsl #20
	movs r0, r0, lsr #0x1d
	mov sb, #0
	beq _0209A9AC
	cmp r0, #1
	beq _0209A9E8
	cmp r0, #2
	beq _0209AA04
	b _0209AA28
_0209A9AC:
	ldrsh r0, [r6, #0x34]
	mov lr, r0, asr #0x1f
	umull ip, sl, r4, r0
	mla sl, r4, lr, sl
	smull lr, r4, r5, r0
	mla sl, r1, r0, sl
	adds r0, lr, r3
	adc lr, r4, sb
	adds r1, ip, r3
	mov r5, r0, lsr #0xc
	adc r0, sl, sb
	mov r4, r1, lsr #0xc
	orr r5, r5, lr, lsl #20
	orr r4, r4, r0, lsl #20
	b _0209AA28
_0209A9E8:
	ldrsh r0, [r6, #0x34]
	smull r1, r0, r5, r0
	adds r1, r1, r3
	adc r0, r0, sb
	mov r5, r1, lsr #0xc
	orr r5, r5, r0, lsl #20
	b _0209AA28
_0209AA04:
	ldrsh sl, [r6, #0x34]
	mov r0, sl, asr #0x1f
	umull lr, ip, r4, sl
	mla ip, r4, r0, ip
	adds r3, lr, r3
	mla ip, r1, sl, ip
	adc r0, ip, sb
	mov r4, r3, lsr #0xc
	orr r4, r4, r0, lsl #20
_0209AA28:
	ldr r0, [r2]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _0209AC90
	ldr r1, [r6, #8]
	ldr r0, [r6, #0x38]
	add sb, sp, #0x18
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #0x3c]
	add r0, r6, #0x14
	add r1, r2, r1
	str r1, [sp, #0x10]
	ldr r2, [r6, #0x10]
	ldr r1, [r6, #0x40]
	add r1, r2, r1
	str r1, [sp, #0x14]
	ldmia r0, {r0, r1, r2}
	stmia sb, {r0, r1, r2}
	ldr r0, [r8, #8]
	add r1, sp, #0x24
	str r0, [sp, #0x24]
	ldr r2, [r8, #0x14]
	mov r0, sb
	str r2, [sp, #0x28]
	ldr r3, [r8, #0x20]
	mov r2, sb
	str r3, [sp, #0x2c]
	bl VEC_CrossProduct
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0209AACC
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _0209AACC
	ldr r0, [sp, #0x20]
	cmp r0, #0
	addeq sp, sp, #0x88
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
_0209AACC:
	add r0, sp, #0x18
	mov r1, r0
	bl VEC_Normalize
	add r1, sp, #0x30
	mov r0, r8
	bl MI_Copy36B
	add r0, sp, #0x18
	add r1, sp, #0x30
	mov r2, r0
	bl MTX_MultVec33
	add r0, sp, #0xc
	mov r1, r8
	mov r2, r0
	bl MTX_MultVec43
	add r0, r6, #0x14
	add r3, sp, #0
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, r3
	mov r1, r3
	bl VEC_Normalize
	ldr r0, [r8, #0x20]
	ldr r1, [sp, #8]
	rsb r0, r0, #0
	smull r3, r0, r1, r0
	mov r2, #0x800
	adds r1, r3, r2
	ldr r3, [r8, #0x14]
	adc r0, r0, #0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	ldr r0, [r8, #8]
	ldr sb, [sp]
	rsb r0, r0, #0
	smull r8, r0, sb, r0
	adds sb, r8, r2
	adc r8, r0, #0
	mov r0, sb, lsr #0xc
	orr r0, r0, r8, lsl #20
	ldr r8, [sp, #4]
	rsb r3, r3, #0
	smull sb, r3, r8, r3
	adds r8, sb, r2
	adc r2, r3, #0
	mov r3, r8, lsr #0xc
	orr r3, r3, r2, lsl #20
	add r0, r0, r3
	adds r1, r1, r0
	ldr r0, [r7, #0x40]
	rsbmi r1, r1, #0
	ldr r0, [r0, #0x20]
	rsb r2, r1, #0x1000
	ldr r0, [r0]
	mov sb, #0x800
	ldr r0, [r0, #0x48]
	ldr ip, [sp, #0x18]
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x10
	smull r8, r0, r2, r0
	adds r2, r8, sb
	adc r0, r0, #0
	mov r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	add r0, r2, #0x1000
	smull r2, r0, r4, r0
	adds r2, r2, sb
	adc r0, r0, #0
	mov lr, r2, lsr #0xc
	orr lr, lr, r0, lsl #20
	smull r0, r4, ip, r5
	adds r8, r0, sb
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	rsb r2, r3, #0
	str r0, [sp, #0x78]
	ldr r0, [sp, #0x10]
	smull sl, r5, r3, r5
	str r0, [sp, #0x7c]
	smull r3, r0, r2, lr
	adc r4, r4, #0
	mov r8, r8, lsr #0xc
	orr r8, r8, r4, lsl #20
	adds r3, r3, sb
	smull lr, r2, ip, lr
	str r8, [sp, #0x54]
	adc r0, r0, #0
	adds r8, sl, sb
	adc r4, r5, #0
	adds r5, lr, sb
	mov sb, r3, lsr #0xc
	orr sb, sb, r0, lsl #20
	mov r8, r8, lsr #0xc
	orr r8, r8, r4, lsl #20
	ldr r3, [sp, #0x14]
	adc r0, r2, #0
	mov r5, r5, lsr #0xc
	orr r5, r5, r0, lsl #20
	mov r4, #0x1000
	ldr r2, _0209AFB8 ; =0x04000454
	str sb, [sp, #0x60]
	str r8, [sp, #0x58]
	add r0, sp, #0x54
	str r5, [sp, #0x64]
	str r1, [sp, #0x6c]
	str r1, [sp, #0x70]
	str r1, [sp, #0x5c]
	str r1, [sp, #0x68]
	str r4, [sp, #0x74]
	str r3, [sp, #0x80]
	str r1, [r2]
	bl G3_MultMtx43
	b _0209AF3C
_0209AC90:
	ldr r3, [r6, #8]
	ldr r1, [r6, #0x38]
	ldr r0, [r2, #4]
	add r1, r3, r1
	sub r0, r1, r0
	str r0, [sp, #0xc]
	ldr r0, [r7, #0x40]
	ldr r2, [r6, #0xc]
	ldr r0, [r0, #0x20]
	ldr r1, [r6, #0x3c]
	ldr r0, [r0]
	add r1, r2, r1
	ldr r0, [r0, #8]
	add sb, sp, #0x18
	sub r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [r7, #0x40]
	ldr r2, [r6, #0x10]
	ldr r0, [r0, #0x20]
	ldr r1, [r6, #0x40]
	ldr r0, [r0]
	add r2, r2, r1
	ldr r1, [r0, #0xc]
	add r0, r6, #0x14
	sub r1, r2, r1
	str r1, [sp, #0x14]
	ldmia r0, {r0, r1, r2}
	stmia sb, {r0, r1, r2}
	ldr r0, [r8, #8]
	add r1, sp, #0x24
	str r0, [sp, #0x24]
	ldr r2, [r8, #0x14]
	mov r0, sb
	str r2, [sp, #0x28]
	ldr r3, [r8, #0x20]
	mov r2, sb
	str r3, [sp, #0x2c]
	bl VEC_CrossProduct
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0209AD54
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _0209AD54
	ldr r0, [sp, #0x20]
	cmp r0, #0
	addeq sp, sp, #0x88
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
_0209AD54:
	add r0, sp, #0x18
	mov r1, r0
	bl VEC_Normalize
	add r1, sp, #0x30
	mov r0, r8
	bl MI_Copy36B
	add r0, sp, #0x18
	add r1, sp, #0x30
	mov r2, r0
	bl MTX_MultVec33
	add r0, sp, #0xc
	mov r1, r8
	mov r2, r0
	bl MTX_MultVec43
	add r0, r6, #0x14
	add r3, sp, #0
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, r3
	mov r1, r3
	bl VEC_Normalize
	ldr r0, [r8, #0x20]
	ldr r1, [sp, #8]
	rsb r0, r0, #0
	smull r3, r0, r1, r0
	mov r2, #0x800
	adds r1, r3, r2
	ldr r3, [r8, #0x14]
	adc r0, r0, #0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	ldr r0, [r8, #8]
	ldr sb, [sp]
	rsb r0, r0, #0
	smull r8, r0, sb, r0
	adds sb, r8, r2
	adc r8, r0, #0
	mov r0, sb, lsr #0xc
	orr r0, r0, r8, lsl #20
	ldr r8, [sp, #4]
	rsb r3, r3, #0
	smull sb, r3, r8, r3
	adds r8, sb, r2
	adc r2, r3, #0
	mov r3, r8, lsr #0xc
	orr r3, r3, r2, lsl #20
	add r0, r0, r3
	adds r1, r1, r0
	ldr r0, [r7, #0x40]
	rsbmi r1, r1, #0
	ldr r0, [r0, #0x20]
	rsb r2, r1, #0x1000
	ldr r0, [r0]
	mov sb, #0x800
	ldr r0, [r0, #0x48]
	ldr lr, [sp, #0x18]
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x10
	smull r8, r0, r2, r0
	adds r2, r8, sb
	adc r0, r0, #0
	mov r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	add r0, r2, #0x1000
	smull r2, r0, r4, r0
	adds r2, r2, sb
	adc r0, r0, #0
	mov r8, r2, lsr #0xc
	orr r8, r8, r0, lsl #20
	smull r0, r4, lr, r5
	adds ip, r0, sb
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	rsb r2, r3, #0
	str r0, [sp, #0x78]
	ldr r0, [sp, #0x10]
	smull sl, r5, r3, r5
	str r0, [sp, #0x7c]
	smull r3, r0, r2, r8
	adc r4, r4, #0
	mov ip, ip, lsr #0xc
	adds r3, r3, sb
	orr ip, ip, r4, lsl #20
	adc r0, r0, #0
	adds sl, sl, sb
	smull r8, r2, lr, r8
	adc r4, r5, #0
	adds r5, r8, sb
	mov sb, r3, lsr #0xc
	orr sb, sb, r0, lsl #20
	mov r8, sl, lsr #0xc
	orr r8, r8, r4, lsl #20
	ldr r3, [sp, #0x14]
	adc r0, r2, #0
	mov r2, r5, lsr #0xc
	orr r2, r2, r0, lsl #20
	mov r4, #0x1000
	ldr r0, _0209AFB8 ; =0x04000454
	str ip, [sp, #0x54]
	str sb, [sp, #0x60]
	str r8, [sp, #0x58]
	str r1, [sp, #0x6c]
	str r2, [sp, #0x64]
	str r1, [sp, #0x70]
	str r1, [sp, #0x5c]
	str r1, [sp, #0x68]
	str r4, [sp, #0x74]
	str r3, [sp, #0x80]
	str r1, [r0]
	ldr r0, [r7, #0x40]
	ldr r1, _0209AFBC ; =0x04000470
	ldr r2, [r0, #0x20]
	add r0, sp, #0x54
	ldr r2, [r2]
	ldr r4, [r2, #0xc]
	ldr r3, [r2, #8]
	ldr r2, [r2, #4]
	str r2, [r1]
	str r3, [r1]
	str r4, [r1]
	bl G3_MultMtx43
_0209AF3C:
	ldr r0, [r7, #0x40]
	ldrh r4, [r6, #0x36]
	ldrh r5, [r0, #0x72]
	mov r2, #0
	and r1, r4, #0x1f
	and r0, r5, #0x1f
	mul r3, r1, r0
	and r1, r4, #0x3e0
	and r0, r5, #0x3e0
	mul r0, r1, r0
	and r4, r4, #0x7c00
	and r1, r5, #0x7c00
	mul r5, r4, r1
	mov r1, r3, asr #5
	mov r0, r0, asr #0xf
	mov r3, r5, asr #0x19
	orr r0, r1, r0, lsl #5
	orr r0, r0, r3, lsl #10
	mov r0, r0, lsl #0x10
	ldr r1, _0209AFC0 ; =0x04000480
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r1, [r7, #0x40]
	mov r3, r2
	ldrsh r0, [r1, #0x7c]
	ldrsh r1, [r1, #0x7e]
	bl drawXYPlane
	add sp, sp, #0x88
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0209AFB4: .word 0x040004A4
_0209AFB8: .word 0x04000454
_0209AFBC: .word 0x04000470
_0209AFC0: .word 0x04000480
	arm_func_end spl_draw_chld_dbb

	arm_func_start spl_draw_dbb
spl_draw_dbb: ; 0x0209AFC4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x88
	mov r6, r1
	ldrh r1, [r6, #0x2e]
	mov r7, r0
	ldr r4, [r7, #0x40]
	mov r0, r1, lsl #0x16
	mov r2, r1, lsl #0x1b
	mov r0, r0, lsr #0x1b
	mov r2, r2, lsr #0x1b
	add r0, r0, #1
	mul r3, r2, r0
	ldr r2, [r4, #0x20]
	movs r3, r3, asr #5
	ldr r0, [r7, #0x3c]
	ldr r4, [r2]
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x1a
	orr r1, r0, #0xc0
	orr r2, r1, r2, lsl #24
	ldrsh r0, [r4, #0x30]
	ldr r8, [r7, #0x44]
	ldr r1, _0209B69C ; =0x040004A4
	orr r2, r2, r3, lsl #16
	str r2, [r1]
	addeq sp, sp, #0x88
	ldr r1, [r1]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
	ldr r4, [r6, #0x30]
	ldr r1, [r7, #0x40]
	smull r2, r5, r4, r0
	ldr r0, [r1, #0x20]
	mov r3, #0x800
	adds r1, r2, r3
	ldr r2, [r0]
	adc sb, r5, #0
	ldr r0, [r2, #0x48]
	mov r5, r1, lsr #0xc
	mov r0, r0, lsl #1
	mov r1, r4, asr #0x1f
	orr r5, r5, sb, lsl #20
	movs r0, r0, lsr #0x1d
	mov sb, #0
	beq _0209B08C
	cmp r0, #1
	beq _0209B0C8
	cmp r0, #2
	beq _0209B0E4
	b _0209B108
_0209B08C:
	ldrsh r0, [r6, #0x34]
	mov lr, r0, asr #0x1f
	umull ip, sl, r4, r0
	mla sl, r4, lr, sl
	smull lr, r4, r5, r0
	mla sl, r1, r0, sl
	adds r0, lr, r3
	adc lr, r4, sb
	adds r1, ip, r3
	mov r5, r0, lsr #0xc
	adc r0, sl, sb
	mov r4, r1, lsr #0xc
	orr r5, r5, lr, lsl #20
	orr r4, r4, r0, lsl #20
	b _0209B108
_0209B0C8:
	ldrsh r0, [r6, #0x34]
	smull r1, r0, r5, r0
	adds r1, r1, r3
	adc r0, r0, sb
	mov r5, r1, lsr #0xc
	orr r5, r5, r0, lsl #20
	b _0209B108
_0209B0E4:
	ldrsh sl, [r6, #0x34]
	mov r0, sl, asr #0x1f
	umull lr, ip, r4, sl
	mla ip, r4, r0, ip
	adds r3, lr, r3
	mla ip, r1, sl, ip
	adc r0, ip, sb
	mov r4, r3, lsr #0xc
	orr r4, r4, r0, lsl #20
_0209B108:
	ldr r0, [r2]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _0209B370
	ldr r1, [r6, #8]
	ldr r0, [r6, #0x38]
	add sb, sp, #0x18
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #0x3c]
	add r0, r6, #0x14
	add r1, r2, r1
	str r1, [sp, #0x10]
	ldr r2, [r6, #0x10]
	ldr r1, [r6, #0x40]
	add r1, r2, r1
	str r1, [sp, #0x14]
	ldmia r0, {r0, r1, r2}
	stmia sb, {r0, r1, r2}
	ldr r0, [r8, #8]
	add r1, sp, #0x24
	str r0, [sp, #0x24]
	ldr r2, [r8, #0x14]
	mov r0, sb
	str r2, [sp, #0x28]
	ldr r3, [r8, #0x20]
	mov r2, sb
	str r3, [sp, #0x2c]
	bl VEC_CrossProduct
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0209B1AC
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _0209B1AC
	ldr r0, [sp, #0x20]
	cmp r0, #0
	addeq sp, sp, #0x88
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
_0209B1AC:
	add r0, sp, #0x18
	mov r1, r0
	bl VEC_Normalize
	add r1, sp, #0x30
	mov r0, r8
	bl MI_Copy36B
	add r0, sp, #0x18
	add r1, sp, #0x30
	mov r2, r0
	bl MTX_MultVec33
	add r0, sp, #0xc
	mov r1, r8
	mov r2, r0
	bl MTX_MultVec43
	add r0, r6, #0x14
	add r3, sp, #0
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, r3
	mov r1, r3
	bl VEC_Normalize
	ldr r0, [r8, #0x20]
	ldr r1, [sp, #8]
	rsb r0, r0, #0
	smull r3, r0, r1, r0
	mov r2, #0x800
	adds r1, r3, r2
	ldr r3, [r8, #0x14]
	adc r0, r0, #0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	ldr r0, [r8, #8]
	ldr sb, [sp]
	rsb r0, r0, #0
	smull r8, r0, sb, r0
	adds sb, r8, r2
	adc r8, r0, #0
	mov r0, sb, lsr #0xc
	orr r0, r0, r8, lsl #20
	ldr r8, [sp, #4]
	rsb r3, r3, #0
	smull sb, r3, r8, r3
	adds r8, sb, r2
	adc r2, r3, #0
	mov r3, r8, lsr #0xc
	orr r3, r3, r2, lsl #20
	add r0, r0, r3
	adds r1, r1, r0
	ldr r0, [r7, #0x40]
	rsbmi r1, r1, #0
	ldr r0, [r0, #0x20]
	rsb r2, r1, #0x1000
	ldr r0, [r0]
	mov sb, #0x800
	ldr r0, [r0, #0x48]
	ldr ip, [sp, #0x18]
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x10
	smull r8, r0, r2, r0
	adds r2, r8, sb
	adc r0, r0, #0
	mov r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	add r0, r2, #0x1000
	smull r2, r0, r4, r0
	adds r2, r2, sb
	adc r0, r0, #0
	mov lr, r2, lsr #0xc
	orr lr, lr, r0, lsl #20
	smull r0, r4, ip, r5
	adds r8, r0, sb
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	rsb r2, r3, #0
	str r0, [sp, #0x78]
	ldr r0, [sp, #0x10]
	smull sl, r5, r3, r5
	str r0, [sp, #0x7c]
	smull r3, r0, r2, lr
	adc r4, r4, #0
	mov r8, r8, lsr #0xc
	orr r8, r8, r4, lsl #20
	adds r3, r3, sb
	smull lr, r2, ip, lr
	str r8, [sp, #0x54]
	adc r0, r0, #0
	adds r8, sl, sb
	adc r4, r5, #0
	adds r5, lr, sb
	mov sb, r3, lsr #0xc
	orr sb, sb, r0, lsl #20
	mov r8, r8, lsr #0xc
	orr r8, r8, r4, lsl #20
	ldr r3, [sp, #0x14]
	adc r0, r2, #0
	mov r5, r5, lsr #0xc
	orr r5, r5, r0, lsl #20
	mov r4, #0x1000
	ldr r2, _0209B6A0 ; =0x04000454
	str sb, [sp, #0x60]
	str r8, [sp, #0x58]
	add r0, sp, #0x54
	str r5, [sp, #0x64]
	str r1, [sp, #0x6c]
	str r1, [sp, #0x70]
	str r1, [sp, #0x5c]
	str r1, [sp, #0x68]
	str r4, [sp, #0x74]
	str r3, [sp, #0x80]
	str r1, [r2]
	bl G3_MultMtx43
	b _0209B61C
_0209B370:
	ldr r3, [r6, #8]
	ldr r1, [r6, #0x38]
	ldr r0, [r2, #4]
	add r1, r3, r1
	sub r0, r1, r0
	str r0, [sp, #0xc]
	ldr r0, [r7, #0x40]
	ldr r2, [r6, #0xc]
	ldr r0, [r0, #0x20]
	ldr r1, [r6, #0x3c]
	ldr r0, [r0]
	add r1, r2, r1
	ldr r0, [r0, #8]
	add sb, sp, #0x18
	sub r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [r7, #0x40]
	ldr r2, [r6, #0x10]
	ldr r0, [r0, #0x20]
	ldr r1, [r6, #0x40]
	ldr r0, [r0]
	add r2, r2, r1
	ldr r1, [r0, #0xc]
	add r0, r6, #0x14
	sub r1, r2, r1
	str r1, [sp, #0x14]
	ldmia r0, {r0, r1, r2}
	stmia sb, {r0, r1, r2}
	ldr r0, [r8, #8]
	add r1, sp, #0x24
	str r0, [sp, #0x24]
	ldr r2, [r8, #0x14]
	mov r0, sb
	str r2, [sp, #0x28]
	ldr r3, [r8, #0x20]
	mov r2, sb
	str r3, [sp, #0x2c]
	bl VEC_CrossProduct
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0209B434
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _0209B434
	ldr r0, [sp, #0x20]
	cmp r0, #0
	addeq sp, sp, #0x88
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
_0209B434:
	add r0, sp, #0x18
	mov r1, r0
	bl VEC_Normalize
	add r1, sp, #0x30
	mov r0, r8
	bl MI_Copy36B
	add r0, sp, #0x18
	add r1, sp, #0x30
	mov r2, r0
	bl MTX_MultVec33
	add r0, sp, #0xc
	mov r1, r8
	mov r2, r0
	bl MTX_MultVec43
	add r0, r6, #0x14
	add r3, sp, #0
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, r3
	mov r1, r3
	bl VEC_Normalize
	ldr r0, [r8, #0x20]
	ldr r1, [sp, #8]
	rsb r0, r0, #0
	smull r3, r0, r1, r0
	mov r2, #0x800
	adds r1, r3, r2
	ldr r3, [r8, #0x14]
	adc r0, r0, #0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	ldr r0, [r8, #8]
	ldr sb, [sp]
	rsb r0, r0, #0
	smull r8, r0, sb, r0
	adds sb, r8, r2
	adc r8, r0, #0
	mov r0, sb, lsr #0xc
	orr r0, r0, r8, lsl #20
	ldr r8, [sp, #4]
	rsb r3, r3, #0
	smull sb, r3, r8, r3
	adds r8, sb, r2
	adc r2, r3, #0
	mov r3, r8, lsr #0xc
	orr r3, r3, r2, lsl #20
	add r0, r0, r3
	adds r1, r1, r0
	ldr r0, [r7, #0x40]
	rsbmi r1, r1, #0
	ldr r0, [r0, #0x20]
	rsb r2, r1, #0x1000
	ldr r0, [r0]
	mov sb, #0x800
	ldr r0, [r0, #0x48]
	ldr lr, [sp, #0x18]
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x10
	smull r8, r0, r2, r0
	adds r2, r8, sb
	adc r0, r0, #0
	mov r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	add r0, r2, #0x1000
	smull r2, r0, r4, r0
	adds r2, r2, sb
	adc r0, r0, #0
	mov r8, r2, lsr #0xc
	orr r8, r8, r0, lsl #20
	smull r0, r4, lr, r5
	adds ip, r0, sb
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	rsb r2, r3, #0
	str r0, [sp, #0x78]
	ldr r0, [sp, #0x10]
	smull sl, r5, r3, r5
	str r0, [sp, #0x7c]
	smull r3, r0, r2, r8
	adc r4, r4, #0
	mov ip, ip, lsr #0xc
	adds r3, r3, sb
	orr ip, ip, r4, lsl #20
	adc r0, r0, #0
	adds sl, sl, sb
	smull r8, r2, lr, r8
	adc r4, r5, #0
	adds r5, r8, sb
	mov sb, r3, lsr #0xc
	orr sb, sb, r0, lsl #20
	mov r8, sl, lsr #0xc
	orr r8, r8, r4, lsl #20
	ldr r3, [sp, #0x14]
	adc r0, r2, #0
	mov r2, r5, lsr #0xc
	orr r2, r2, r0, lsl #20
	mov r4, #0x1000
	ldr r0, _0209B6A0 ; =0x04000454
	str ip, [sp, #0x54]
	str sb, [sp, #0x60]
	str r8, [sp, #0x58]
	str r1, [sp, #0x6c]
	str r2, [sp, #0x64]
	str r1, [sp, #0x70]
	str r1, [sp, #0x5c]
	str r1, [sp, #0x68]
	str r4, [sp, #0x74]
	str r3, [sp, #0x80]
	str r1, [r0]
	ldr r0, [r7, #0x40]
	ldr r1, _0209B6A4 ; =0x04000470
	ldr r2, [r0, #0x20]
	add r0, sp, #0x54
	ldr r2, [r2]
	ldr r4, [r2, #0xc]
	ldr r3, [r2, #8]
	ldr r2, [r2, #4]
	str r2, [r1]
	str r3, [r1]
	str r4, [r1]
	bl G3_MultMtx43
_0209B61C:
	ldr r0, [r7, #0x40]
	ldrh r4, [r6, #0x36]
	ldrh r5, [r0, #0x72]
	ldr r1, _0209B6A8 ; =0x04000480
	and r2, r4, #0x1f
	and r0, r5, #0x1f
	mul r3, r2, r0
	and r2, r4, #0x3e0
	and r0, r5, #0x3e0
	mul r0, r2, r0
	and r4, r4, #0x7c00
	and r2, r5, #0x7c00
	mul r5, r4, r2
	mov r2, r3, asr #5
	mov r0, r0, asr #0xf
	mov r3, r5, asr #0x19
	orr r0, r2, r0, lsl #5
	orr r0, r0, r3, lsl #10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r2, [r7, #0x40]
	ldr r1, [r2, #0x20]
	ldrsh r0, [r2, #0x78]
	ldr r3, [r1]
	ldrsh r1, [r2, #0x7a]
	ldrsh r2, [r3, #0x50]
	ldrsh r3, [r3, #0x52]
	bl drawXYPlane
	add sp, sp, #0x88
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0209B69C: .word 0x040004A4
_0209B6A0: .word 0x04000454
_0209B6A4: .word 0x04000470
_0209B6A8: .word 0x04000480
	arm_func_end spl_draw_dbb

	arm_func_start spl_draw_chld_bb
spl_draw_chld_bb: ; 0x0209B6AC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x40
	mov r6, r1
	ldrh r1, [r6, #0x2e]
	mov r7, r0
	ldr r4, [r7, #0x40]
	mov r0, r1, lsl #0x16
	mov r2, r1, lsl #0x1b
	mov r0, r0, lsr #0x1b
	mov r2, r2, lsr #0x1b
	add r0, r0, #1
	mul r3, r2, r0
	ldr r2, [r4, #0x20]
	ldr r0, [r7, #0x3c]
	ldr r4, [r2]
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x1a
	orr r1, r0, #0xc0
	ldrsh r0, [r4, #0x30]
	movs r4, r3, asr #5
	orr r3, r1, r2, lsl #24
	ldr r1, [r7, #0x44]
	ldr r2, _0209BAEC ; =0x040004A4
	orr r3, r3, r4, lsl #16
	str r3, [r2]
	addeq sp, sp, #0x40
	ldr r2, [r2]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
	ldr r4, [r6, #0x30]
	ldr r2, [r7, #0x40]
	smull r3, r5, r4, r0
	ldr r0, [r2, #0x20]
	mov r8, #0x800
	adds r2, r3, r8
	ldr r3, [r0]
	adc sb, r5, #0
	ldr r0, [r3, #0x48]
	mov r5, r2, lsr #0xc
	mov r0, r0, lsl #1
	mov r2, r4, asr #0x1f
	orr r5, r5, sb, lsl #20
	movs r0, r0, lsr #0x1d
	mov sb, #0
	beq _0209B774
	cmp r0, #1
	beq _0209B7B0
	cmp r0, #2
	beq _0209B7CC
	b _0209B7F0
_0209B774:
	ldrsh r0, [r6, #0x34]
	mov lr, r0, asr #0x1f
	umull ip, sl, r4, r0
	mla sl, r4, lr, sl
	smull lr, r4, r5, r0
	mla sl, r2, r0, sl
	adds r0, lr, r8
	adc lr, r4, sb
	adds r2, ip, r8
	mov r5, r0, lsr #0xc
	adc r0, sl, sb
	mov r4, r2, lsr #0xc
	orr r5, r5, lr, lsl #20
	orr r4, r4, r0, lsl #20
	b _0209B7F0
_0209B7B0:
	ldrsh r0, [r6, #0x34]
	smull r2, r0, r5, r0
	adds r2, r2, r8
	adc r0, r0, sb
	mov r5, r2, lsr #0xc
	orr r5, r5, r0, lsl #20
	b _0209B7F0
_0209B7CC:
	ldrsh sl, [r6, #0x34]
	mov r0, sl, asr #0x1f
	umull lr, ip, r4, sl
	mla ip, r4, r0, ip
	adds r4, lr, r8
	mla ip, r2, sl, ip
	adc r0, ip, sb
	mov r4, r4, lsr #0xc
	orr r4, r4, r0, lsl #20
_0209B7F0:
	ldr r0, [r3]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _0209B910
	ldr r3, [r6, #8]
	ldr r2, [r6, #0x38]
	add r0, sp, #0
	add r2, r3, r2
	str r2, [sp]
	ldr r8, [r6, #0xc]
	ldr r3, [r6, #0x3c]
	mov r2, r0
	add r3, r8, r3
	str r3, [sp, #4]
	ldr r8, [r6, #0x10]
	ldr r3, [r6, #0x40]
	add r3, r8, r3
	str r3, [sp, #8]
	bl MTX_MultVec43
	ldrh r0, [r6, #0x20]
	ldr r2, _0209BAF0 ; =FX_SinCosTable_
	mov sb, #0
	mov r0, r0, asr #4
	mov r3, r0, lsl #1
	mov r0, r3, lsl #1
	ldrsh r1, [r2, r0]
	add r0, r3, #1
	mov r0, r0, lsl #1
	ldrsh r0, [r2, r0]
	mov lr, #0x1000
	ldr r3, [sp]
	ldr r2, [sp, #4]
	str r3, [sp, #0x30]
	smull ip, sl, r1, r5
	str lr, [sp, #0x2c]
	rsb r8, r1, #0
	ldr r1, [sp, #8]
	smull lr, r5, r0, r5
	mov r3, #0x800
	str r2, [sp, #0x34]
	adds r2, lr, r3
	adc r5, r5, #0
	adds ip, ip, r3
	mov lr, r2, lsr #0xc
	orr lr, lr, r5, lsl #20
	smull r5, r2, r8, r4
	adc sl, sl, #0
	mov r8, ip, lsr #0xc
	orr r8, r8, sl, lsl #20
	adds r5, r5, r3
	smull sl, r4, r0, r4
	adc r0, r2, #0
	adds r2, sl, r3
	mov r5, r5, lsr #0xc
	orr r5, r5, r0, lsl #20
	mov r3, r2, lsr #0xc
	adc r0, r4, #0
	orr r3, r3, r0, lsl #20
	ldr r2, _0209BAF4 ; =0x04000454
	str lr, [sp, #0xc]
	add r0, sp, #0xc
	str r8, [sp, #0x10]
	str sb, [sp, #0x14]
	str r5, [sp, #0x18]
	str r3, [sp, #0x1c]
	str sb, [sp, #0x20]
	str sb, [sp, #0x24]
	str sb, [sp, #0x28]
	str r1, [sp, #0x38]
	str sb, [r2]
	bl G3_MultMtx43
	b _0209BA74
_0209B910:
	ldr r8, [r6, #8]
	ldr r2, [r6, #0x38]
	ldr r0, [r3, #4]
	add r2, r8, r2
	sub r0, r2, r0
	str r0, [sp]
	ldr r2, [r7, #0x40]
	ldr r8, [r6, #0xc]
	ldr r2, [r2, #0x20]
	ldr r3, [r6, #0x3c]
	ldr r2, [r2]
	add r3, r8, r3
	ldr r2, [r2, #8]
	add r0, sp, #0
	sub r2, r3, r2
	str r2, [sp, #4]
	ldr r2, [r7, #0x40]
	ldr r8, [r6, #0x10]
	ldr r2, [r2, #0x20]
	ldr r3, [r6, #0x40]
	ldr r2, [r2]
	add r8, r8, r3
	ldr r3, [r2, #0xc]
	mov r2, r0
	sub r3, r8, r3
	str r3, [sp, #8]
	bl MTX_MultVec43
	ldrh r0, [r6, #0x20]
	ldr r2, _0209BAF0 ; =FX_SinCosTable_
	mov lr, #0
	mov r0, r0, asr #4
	mov r3, r0, lsl #1
	mov r0, r3, lsl #1
	ldrsh r1, [r2, r0]
	add r0, r3, #1
	mov r0, r0, lsl #1
	ldrsh r0, [r2, r0]
	mov sl, #0x1000
	ldr r3, [sp]
	ldr r2, [sp, #4]
	str r3, [sp, #0x30]
	smull sb, r8, r1, r5
	str sl, [sp, #0x2c]
	rsb ip, r1, #0
	smull sl, r5, r0, r5
	ldr r1, [sp, #8]
	mov r3, #0x800
	str r2, [sp, #0x34]
	adds r2, sl, r3
	adc r5, r5, #0
	mov sl, r2, lsr #0xc
	orr sl, sl, r5, lsl #20
	str r1, [sp, #0x38]
	adds sb, sb, r3
	str sl, [sp, #0xc]
	adc sl, r8, #0
	smull r5, r2, ip, r4
	mov r8, sb, lsr #0xc
	orr r8, r8, sl, lsl #20
	smull sb, r4, r0, r4
	adds r5, r5, r3
	adc r0, r2, #0
	adds r2, sb, r3
	mov r3, r5, lsr #0xc
	orr r3, r3, r0, lsl #20
	adc r0, r4, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	ldr r0, _0209BAF4 ; =0x04000454
	str r8, [sp, #0x10]
	str lr, [sp, #0x14]
	str r3, [sp, #0x18]
	str r2, [sp, #0x1c]
	str lr, [sp, #0x20]
	str lr, [sp, #0x24]
	str lr, [sp, #0x28]
	str lr, [r0]
	ldr r0, [r7, #0x40]
	ldr r1, _0209BAF8 ; =0x04000470
	ldr r2, [r0, #0x20]
	add r0, sp, #0xc
	ldr r2, [r2]
	ldr r4, [r2, #0xc]
	ldr r3, [r2, #8]
	ldr r2, [r2, #4]
	str r2, [r1]
	str r3, [r1]
	str r4, [r1]
	bl G3_MultMtx43
_0209BA74:
	ldr r0, [r7, #0x40]
	ldrh r4, [r6, #0x36]
	ldrh r5, [r0, #0x72]
	mov r2, #0
	and r1, r4, #0x1f
	and r0, r5, #0x1f
	mul r3, r1, r0
	and r1, r4, #0x3e0
	and r0, r5, #0x3e0
	mul r0, r1, r0
	and r4, r4, #0x7c00
	and r1, r5, #0x7c00
	mul r5, r4, r1
	mov r1, r3, asr #5
	mov r0, r0, asr #0xf
	mov r3, r5, asr #0x19
	orr r0, r1, r0, lsl #5
	orr r0, r0, r3, lsl #10
	mov r0, r0, lsl #0x10
	ldr r1, _0209BAFC ; =0x04000480
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r1, [r7, #0x40]
	mov r3, r2
	ldrsh r0, [r1, #0x7c]
	ldrsh r1, [r1, #0x7e]
	bl drawXYPlane
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0209BAEC: .word 0x040004A4
_0209BAF0: .word FX_SinCosTable_
_0209BAF4: .word 0x04000454
_0209BAF8: .word 0x04000470
_0209BAFC: .word 0x04000480
	arm_func_end spl_draw_chld_bb

	arm_func_start spl_draw_bb
spl_draw_bb: ; 0x0209BB00
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x3c
	mov r8, r1
	ldrh r3, [r8, #0x2e]
	mov sb, r0
	ldr r1, [sb, #0x40]
	mov r0, r3, lsl #0x16
	mov r2, r3, lsl #0x1b
	mov r0, r0, lsr #0x1b
	ldr r4, [r1, #0x20]
	mov r2, r2, lsr #0x1b
	ldr r5, [r4]
	add r0, r0, #1
	mul r0, r2, r0
	movs fp, r0, asr #5
	mov r3, r3, lsl #0x10
	ldr r2, [sb, #0x3c]
	mov r6, r3, lsr #0x1a
	orr r3, r2, #0xc0
	ldr r4, [r5, #0x48]
	ldrsh r7, [r5, #0x30]
	mov r2, r4, lsl #1
	ldrh r4, [r1, #0x72]
	orr r3, r3, r6, lsl #24
	ldrsh sl, [r8, #0x34]
	ldrh r5, [r8, #0x36]
	ldr r1, [sb, #0x44]
	ldr r0, _0209BF38 ; =0x040004A4
	orr r3, r3, fp, lsl #16
	str r3, [r0]
	mov r2, r2, lsr #0x1d
	addeq sp, sp, #0x3c
	and r3, r2, #0xff
	ldr r0, [r0]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	ldr r6, [r8, #0x30]
	mov r0, #0x800
	smull r7, r2, r6, r7
	adds r7, r7, r0
	adc r2, r2, #0
	mov r7, r7, lsr #0xc
	cmp r3, #0
	mov lr, r6, asr #0x1f
	orr r7, r7, r2, lsl #20
	mov r2, #0
	bne _0209BBF4
	mov ip, sl, asr #0x1f
	umull fp, r3, r6, sl
	mla r3, r6, ip, r3
	mla r3, lr, sl, r3
	smull r6, sl, r7, sl
	adds r6, r6, r0
	adc sl, sl, r2
	adds fp, fp, r0
	adc r0, r3, r2
	mov r7, r6, lsr #0xc
	mov r6, fp, lsr #0xc
	orr r7, r7, sl, lsl #20
	orr r6, r6, r0, lsl #20
	b _0209BC34
_0209BBF4:
	cmp r3, #1
	bne _0209BC14
	smull sl, r3, r7, sl
	adds r7, sl, r0
	adc r0, r3, r2
	mov r7, r7, lsr #0xc
	orr r7, r7, r0, lsl #20
	b _0209BC34
_0209BC14:
	mov ip, sl, asr #0x1f
	umull fp, r3, r6, sl
	adds r0, fp, r0
	mla r3, r6, ip, r3
	mla r3, lr, sl, r3
	adc r2, r3, r2
	mov r6, r0, lsr #0xc
	orr r6, r6, r2, lsl #20
_0209BC34:
	ldr r0, [sb, #0x40]
	ldr r0, [r0, #0x20]
	ldr sl, [r0]
	ldr r0, [sl]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	bne _0209BD60
	ldr r3, [r8, #8]
	ldr r2, [r8, #0x38]
	add r0, sp, #0
	add r2, r3, r2
	str r2, [sp]
	ldr sl, [r8, #0xc]
	ldr r3, [r8, #0x3c]
	mov r2, r0
	add r3, sl, r3
	str r3, [sp, #4]
	ldr sl, [r8, #0x10]
	ldr r3, [r8, #0x40]
	add r3, sl, r3
	str r3, [sp, #8]
	bl MTX_MultVec43
	ldrh r0, [r8, #0x20]
	ldr r2, _0209BF3C ; =FX_SinCosTable_
	ldr ip, [sp]
	mov r0, r0, asr #4
	mov r3, r0, lsl #1
	mov r0, r3, lsl #1
	ldrsh r1, [r2, r0]
	add r0, r3, #1
	mov r0, r0, lsl #1
	ldrsh r0, [r2, r0]
	str ip, [sp, #0x30]
	mov ip, #0x1000
	ldr r2, [sp, #4]
	smull fp, sl, r1, r7
	str ip, [sp, #0x2c]
	rsb r3, r1, #0
	ldr r1, [sp, #8]
	str r2, [sp, #0x34]
	mov r8, #0
	smull ip, r7, r0, r7
	mov r2, #0x800
	str r1, [sp, #0x38]
	adds r1, ip, r2
	adc ip, r7, #0
	adds r7, fp, r2
	mov fp, r1, lsr #0xc
	orr fp, fp, ip, lsl #20
	smull ip, r1, r3, r6
	adc sl, sl, #0
	mov r7, r7, lsr #0xc
	orr r7, r7, sl, lsl #20
	adds r3, ip, r2
	smull sl, r6, r0, r6
	adc r0, r1, #0
	adds r1, sl, r2
	mov r3, r3, lsr #0xc
	orr r3, r3, r0, lsl #20
	mov r2, r1, lsr #0xc
	adc r0, r6, #0
	orr r2, r2, r0, lsl #20
	ldr r1, _0209BF40 ; =0x04000454
	str fp, [sp, #0xc]
	add r0, sp, #0xc
	str r7, [sp, #0x10]
	str r8, [sp, #0x14]
	str r3, [sp, #0x18]
	str r2, [sp, #0x1c]
	str r8, [sp, #0x20]
	str r8, [sp, #0x24]
	str r8, [sp, #0x28]
	str r8, [r1]
	bl G3_MultMtx43
	b _0209BEC4
_0209BD60:
	ldr r3, [r8, #8]
	ldr r2, [r8, #0x38]
	ldr r0, [sl, #4]
	add r2, r3, r2
	sub r0, r2, r0
	str r0, [sp]
	ldr r2, [sb, #0x40]
	ldr sl, [r8, #0xc]
	ldr r2, [r2, #0x20]
	ldr r3, [r8, #0x3c]
	ldr r2, [r2]
	add r3, sl, r3
	ldr r2, [r2, #8]
	add r0, sp, #0
	sub r2, r3, r2
	str r2, [sp, #4]
	ldr r2, [sb, #0x40]
	ldr sl, [r8, #0x10]
	ldr r2, [r2, #0x20]
	ldr r3, [r8, #0x40]
	ldr r2, [r2]
	add sl, sl, r3
	ldr r3, [r2, #0xc]
	mov r2, r0
	sub r3, sl, r3
	str r3, [sp, #8]
	bl MTX_MultVec43
	ldrh r0, [r8, #0x20]
	ldr r2, _0209BF3C ; =FX_SinCosTable_
	mov r8, #0
	mov r0, r0, asr #4
	mov r3, r0, lsl #1
	mov r0, r3, lsl #1
	ldrsh r1, [r2, r0]
	add r0, r3, #1
	mov r0, r0, lsl #1
	ldrsh r0, [r2, r0]
	ldr ip, [sp]
	ldr r2, [sp, #4]
	str ip, [sp, #0x30]
	mov ip, #0x1000
	str r2, [sp, #0x34]
	smull fp, sl, r1, r7
	str ip, [sp, #0x2c]
	rsb r3, r1, #0
	ldr r1, [sp, #8]
	smull ip, r7, r0, r7
	mov r2, #0x800
	str r1, [sp, #0x38]
	adds r1, ip, r2
	adc ip, r7, #0
	adds r7, fp, r2
	mov fp, r1, lsr #0xc
	orr fp, fp, ip, lsl #20
	smull ip, r1, r3, r6
	adc sl, sl, #0
	mov r7, r7, lsr #0xc
	orr r7, r7, sl, lsl #20
	smull sl, r6, r0, r6
	adds r3, ip, r2
	adc r0, r1, #0
	adds r1, sl, r2
	mov r2, r3, lsr #0xc
	orr r2, r2, r0, lsl #20
	adc r0, r6, #0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0x1c]
	ldr r0, _0209BF40 ; =0x04000454
	str fp, [sp, #0xc]
	str r7, [sp, #0x10]
	str r8, [sp, #0x14]
	str r2, [sp, #0x18]
	str r8, [sp, #0x20]
	str r8, [sp, #0x24]
	str r8, [sp, #0x28]
	str r8, [r0]
	ldr r0, [sb, #0x40]
	ldr r1, _0209BF44 ; =0x04000470
	ldr r2, [r0, #0x20]
	add r0, sp, #0xc
	ldr r2, [r2]
	ldr r6, [r2, #0xc]
	ldr r3, [r2, #8]
	ldr r2, [r2, #4]
	str r2, [r1]
	str r3, [r1]
	str r6, [r1]
	bl G3_MultMtx43
_0209BEC4:
	and r1, r5, #0x1f
	and r0, r4, #0x1f
	mul r2, r1, r0
	and r1, r5, #0x3e0
	and r0, r4, #0x3e0
	mul r0, r1, r0
	and r3, r5, #0x7c00
	and r1, r4, #0x7c00
	mul r4, r3, r1
	mov r1, r2, asr #5
	mov r0, r0, asr #0xf
	mov r2, r4, asr #0x19
	orr r0, r1, r0, lsl #5
	orr r0, r0, r2, lsl #10
	mov r0, r0, lsl #0x10
	ldr r1, _0209BF48 ; =0x04000480
	mov r0, r0, lsr #0x10
	str r0, [r1]
	ldr r2, [sb, #0x40]
	ldr r1, [r2, #0x20]
	ldrsh r0, [r2, #0x78]
	ldr r3, [r1]
	ldrsh r1, [r2, #0x7a]
	ldrsh r2, [r3, #0x50]
	ldrsh r3, [r3, #0x52]
	bl drawXYPlane
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0209BF38: .word 0x040004A4
_0209BF3C: .word FX_SinCosTable_
_0209BF40: .word 0x04000454
_0209BF44: .word 0x04000470
_0209BF48: .word 0x04000480
	arm_func_end spl_draw_bb

	arm_func_start rotTypeY
rotTypeY: ; 0x0209BF4C
	str r1, [r2]
	mov ip, #0
	str ip, [r2, #0xc]
	str r0, [r2, #0x18]
	str ip, [r2, #0x24]
	str ip, [r2, #4]
	mov r3, #0x1000
	str r3, [r2, #0x10]
	str ip, [r2, #0x1c]
	str ip, [r2, #0x28]
	rsb r0, r0, #0
	str r0, [r2, #8]
	str ip, [r2, #0x14]
	str r1, [r2, #0x20]
	str ip, [r2, #0x2c]
	bx lr
	arm_func_end rotTypeY

	arm_func_start rotTypeXYZ
rotTypeXYZ: ; 0x0209BF8C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #4
	ldr r3, _0209C030 ; =0x00000555
	rsb r7, r1, #0x1000
	ldr ip, _0209C034 ; =0x0000093D
	mov r4, #0
	umull sb, r8, r7, r3
	umull r6, r5, r0, ip
	mov lr, #0x800
	adds sb, sb, lr
	mla r8, r7, r4, r8
	mov r7, r7, asr #0x1f
	mla r8, r7, r3, r8
	adc r7, r8, #0
	mov r3, sb, lsr #0xc
	adds r6, r6, lr
	orr r3, r3, r7, lsl #20
	add r1, r3, r1
	mla r5, r0, r4, r5
	mov r0, r0, asr #0x1f
	mla r5, r0, ip, r5
	adc r0, r5, #0
	mov r5, r6, lsr #0xc
	orr r5, r5, r0, lsl #20
	str r1, [r2]
	add ip, r3, r5
	str ip, [r2, #0xc]
	sub r0, r3, r5
	str r0, [r2, #0x18]
	str r4, [r2, #0x24]
	str r0, [r2, #4]
	str r1, [r2, #0x10]
	str ip, [r2, #0x1c]
	str r4, [r2, #0x28]
	str ip, [r2, #8]
	str r0, [r2, #0x14]
	str r1, [r2, #0x20]
	str r4, [r2, #0x2c]
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0209C030: .word 0x00000555
_0209C034: .word 0x0000093D
	arm_func_end rotTypeXYZ

	arm_func_start drawXZPlane
drawXZPlane: ; 0x0209C038
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub r7, r2, #0x1000
	add r5, r3, #0x1000
	add r4, r2, #0x1000
	mov r2, r0, lsl #8
	mov r0, r1, lsl #8
	sub r3, r3, #0x1000
	mov r0, r0, lsr #0x10
	mov r1, r2, lsr #0x10
	ldr ip, _0209C0E0 ; =0x04000500
	mov r8, #1
	ldr r6, _0209C0E4 ; =0x000003FF
	mov r2, r7, lsl #0x10
	mov lr, r5, lsl #0x10
	mov r4, r4, lsl #0x10
	mov r5, r3, lsl #0x10
	ldr r3, _0209C0E8 ; =0x04000488
	str r8, [ip]
	mov ip, #0
	and r2, r6, r2, asr #22
	and r7, r6, lr, asr #22
	and lr, r6, r4, asr #22
	and r4, r6, r5, asr #22
	ldr r6, _0209C0EC ; =0x04000490
	str ip, [r3]
	orr r5, r2, r7, lsl #20
	str r5, [r6]
	str r1, [r3]
	orr r5, lr, r7, lsl #20
	str r5, [r6]
	orr r1, r1, r0, lsl #16
	str r1, [r3]
	orr r1, lr, r4, lsl #20
	str r1, [r6]
	mov r0, r0, lsl #0x10
	str r0, [r3]
	orr r1, r2, r4, lsl #20
	ldr r0, _0209C0F0 ; =0x04000504
	str r1, [r6]
	str ip, [r0]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0209C0E0: .word 0x04000500
_0209C0E4: .word 0x000003FF
_0209C0E8: .word 0x04000488
_0209C0EC: .word 0x04000490
_0209C0F0: .word 0x04000504
	arm_func_end drawXZPlane

	arm_func_start drawXYPlane
drawXYPlane: ; 0x0209C0F4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	add ip, r3, #0x1000
	sub r5, r2, #0x1000
	add r4, r2, #0x1000
	mov r2, r0, lsl #8
	mov r0, r1, lsl #8
	sub r3, r3, #0x1000
	mov r0, r0, lsr #0x10
	mov r1, r2, lsr #0x10
	ldr r7, _0209C19C ; =0x04000500
	mov r8, #1
	ldr r6, _0209C1A0 ; =0x000003FF
	mov r2, ip, lsl #0x10
	mov lr, r5, lsl #0x10
	mov r4, r4, lsl #0x10
	mov r5, r3, lsl #0x10
	ldr r3, _0209C1A4 ; =0x04000488
	str r8, [r7]
	mov ip, #0
	and r7, r6, r2, asr #22
	and r2, r6, lr, asr #22
	and lr, r6, r4, asr #22
	and r4, r6, r5, asr #22
	ldr r6, _0209C1A8 ; =0x04000490
	str ip, [r3]
	orr r5, r2, r7, lsl #10
	str r5, [r6]
	str r1, [r3]
	orr r5, lr, r7, lsl #10
	str r5, [r6]
	orr r1, r1, r0, lsl #16
	str r1, [r3]
	orr r1, lr, r4, lsl #10
	str r1, [r6]
	mov r0, r0, lsl #0x10
	str r0, [r3]
	orr r1, r2, r4, lsl #10
	ldr r0, _0209C1AC ; =0x04000504
	str r1, [r6]
	str ip, [r0]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0209C19C: .word 0x04000500
_0209C1A0: .word 0x000003FF
_0209C1A4: .word 0x04000488
_0209C1A8: .word 0x04000490
_0209C1AC: .word 0x04000504
	arm_func_end drawXYPlane

	arm_func_start spl_gen_child
spl_gen_child: ; 0x0209C1B0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	ldr r3, [r1, #0x20]
	str r1, [sp]
	ldr r6, [r3, #0x14]
	mov r8, r0
	ldrb r3, [r6, #8]
	ldrb r0, [r6, #0xc]
	str r2, [sp, #4]
	mov r3, r3, lsl #0xc
	mov r2, r3, asr #0x1f
	mov r2, r2, lsl #4
	mov r1, #0x800
	mov r4, r3, lsl #4
	adds r4, r4, r1
	orr r2, r2, r3, lsr #28
	adc r1, r2, #0
	mov r5, r4, lsr #0xc
	cmp r0, #0
	mov r0, #0
	str r0, [sp, #8]
	orr r5, r5, r1, lsl #20
	addle sp, sp, #0x24
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxle lr
	ldr sb, _0209C4C0 ; =spl_rndm_seed
	str r0, [sp, #0x18]
	str r0, [sp, #0x14]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	mov r0, #0x1000
	mov r4, r5, asr #0x1f
	str r0, [sp, #0x10]
_0209C234:
	ldr r0, [sp, #4]
	bl spl_pop_front
	movs r7, r0
	addeq sp, sp, #0x24
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	ldr r0, [sp]
	mov r1, r7
	add r0, r0, #0x14
	bl spl_push_front
	add r0, r7, #0x38
	add r1, r8, #8
	str r0, [sp, #0xc]
	add sl, r7, #8
	ldmia r1, {r0, r1, r2}
	stmia sl, {r0, r1, r2}
	ldr sl, [r8, #0x14]
	ldr ip, [sb]
	ldr r1, _0209C4C4 ; =0x5EEDF715
	ldr r0, _0209C4C8 ; =0x1B0CB173
	mov r2, sl, asr #0x1f
	mla r0, ip, r1, r0
	str r0, [sb]
	umull lr, ip, sl, r5
	mla ip, sl, r4, ip
	ldrsh r1, [r6, #2]
	mov r0, r0, lsr #0x17
	mla ip, r2, r5, ip
	mul r0, r1, r0
	mov r3, #0x800
	adds r2, lr, r3
	sub r0, r0, r1, lsl #8
	adc sl, ip, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, sl, lsl #20
	add r0, r2, r0, asr #8
	str r0, [r7, #0x14]
	ldr sl, [r8, #0x18]
	ldr ip, [sb]
	ldr r1, _0209C4C4 ; =0x5EEDF715
	ldr r0, _0209C4C8 ; =0x1B0CB173
	mov r2, sl, asr #0x1f
	mla r0, ip, r1, r0
	str r0, [sb]
	umull lr, ip, sl, r5
	mla ip, sl, r4, ip
	mla ip, r2, r5, ip
	adds r2, lr, r3
	ldrsh r1, [r6, #2]
	mov r0, r0, lsr #0x17
	adc sl, ip, #0
	mul r0, r1, r0
	mov r2, r2, lsr #0xc
	sub r0, r0, r1, lsl #8
	orr r2, r2, sl, lsl #20
	add r0, r2, r0, asr #8
	str r0, [r7, #0x18]
	ldr ip, [r8, #0x1c]
	ldr sl, [sb]
	ldr r1, _0209C4C4 ; =0x5EEDF715
	ldr r0, _0209C4C8 ; =0x1B0CB173
	mov r2, ip, asr #0x1f
	mla r0, sl, r1, r0
	umull sl, lr, ip, r5
	str r0, [sb]
	mla lr, ip, r4, lr
	adds r3, sl, r3
	mla lr, r2, r5, lr
	ldrsh r1, [r6, #2]
	mov r0, r0, lsr #0x17
	adc r2, lr, #0
	mul r0, r1, r0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	sub r0, r0, r1, lsl #8
	add r0, r3, r0, asr #8
	ldr r3, [sp, #0xc]
	add fp, r8, #0x38
	str r0, [r7, #0x1c]
	ldmia fp, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldrb r0, [r6, #9]
	ldrsh r1, [r8, #0x34]
	ldr r2, [r8, #0x30]
	add r0, r0, #1
	mul r1, r2, r1
	mov r1, r1, asr #0xc
	mul r0, r1, r0
	mov r0, r0, asr #6
	str r0, [r7, #0x30]
	ldr r0, [sp, #0x10]
	strh r0, [r7, #0x34]
	ldrh r0, [r6]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	ldrneh r0, [r6, #0xa]
	strneh r0, [r7, #0x36]
	ldreqh r0, [r8, #0x36]
	streqh r0, [r7, #0x36]
	ldrh r1, [r8, #0x2e]
	ldrh r0, [r7, #0x2e]
	mov r2, r1, lsl #0x1b
	mov r1, r1, lsl #0x16
	mov r1, r1, lsr #0x1b
	mov r2, r2, lsr #0x1b
	add r1, r1, #1
	mul r1, r2, r1
	mov r1, r1, lsl #0xb
	mov r1, r1, lsr #0x10
	bic r0, r0, #0x1f
	and r1, r1, #0x1f
	orr r0, r0, r1
	strh r0, [r7, #0x2e]
	ldrh r0, [r7, #0x2e]
	bic r0, r0, #0x3e0
	orr r0, r0, #0x3e0
	strh r0, [r7, #0x2e]
	ldrh r0, [r6]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1e
	beq _0209C438
	cmp r0, #1
	beq _0209C448
	cmp r0, #2
	ldreqh r0, [r8, #0x20]
	streqh r0, [r7, #0x20]
	ldreqsh r0, [r8, #0x22]
	streqh r0, [r7, #0x22]
	b _0209C458
_0209C438:
	ldr r0, [sp, #0x14]
	strh r0, [r7, #0x20]
	strh r0, [r7, #0x22]
	b _0209C458
_0209C448:
	ldrh r0, [r8, #0x20]
	strh r0, [r7, #0x20]
	ldr r0, [sp, #0x18]
	strh r0, [r7, #0x22]
_0209C458:
	ldrh r1, [r6, #6]
	ldr r0, _0209C4CC ; =0x0000FFFF
	strh r1, [r7, #0x24]
	ldr r1, [sp, #0x1c]
	strh r1, [r7, #0x26]
	ldrb r1, [r6, #0xf]
	strb r1, [r7, #0x2c]
	ldrh r1, [r8, #0x24]
	mov r1, r1, lsr #1
	bl _s32_div_f
	strh r0, [r7, #0x28]
	ldrh r1, [r8, #0x24]
	ldr r0, _0209C4CC ; =0x0000FFFF
	bl _s32_div_f
	strh r0, [r7, #0x2a]
	ldr r0, [sp, #0x20]
	strb r0, [r7, #0x2d]
	ldr r0, [sp, #8]
	ldrb r1, [r6, #0xc]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, r1
	blt _0209C234
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0209C4C0: .word spl_rndm_seed
_0209C4C4: .word 0x5EEDF715
_0209C4C8: .word 0x1B0CB173
_0209C4CC: .word 0x0000FFFF
	arm_func_end spl_gen_child

	arm_func_start spl_gen_ptcl
spl_gen_ptcl: ; 0x0209C4D0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc4
	mov sb, r0
	ldr r0, [sb, #0x20]
	ldrsh r3, [sb, #0x4e]
	str r0, [sp, #4]
	ldr r0, [sb, #0x58]
	ldr r2, _0209D1DC ; =0x00000FFF
	add r3, r0, r3
	ldr r0, [sp, #4]
	str r1, [sp]
	ldr r8, [r0]
	and r0, r3, r2
	strh r0, [sb, #0x4e]
	ldr r0, [r8]
	mov r0, r0, lsl #0x1c
	mov r1, r0, lsr #0x1c
	mov r0, r3, asr #0xc
	cmp r1, #2
	str r0, [sp, #0xc]
	beq _0209C538
	cmp r1, #3
	beq _0209C538
	sub r0, r1, #5
	cmp r0, #4
	bhi _0209C540
_0209C538:
	mov r0, sb
	bl spl_set_cross_to_axis
_0209C540:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	mov r0, #0
	str r0, [sp, #8]
	addle sp, sp, #0xc4
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxle lr
	str r0, [sp, #0x18]
	str r0, [sp, #0x24]
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	mov r0, #0x1000
	str r0, [sp, #0x34]
	ldr r0, [sp, #8]
	ldr r6, _0209D1E0 ; =spl_rndm_seed
	ldr r4, _0209D1E4 ; =0x5EEDF715
	ldr r5, _0209D1E8 ; =0x1B0CB173
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	str r0, [sp, #0x40]
_0209C590:
	ldr r0, [sp]
	bl spl_pop_front
	movs r7, r0
	addeq sp, sp, #0xc4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	add r0, sb, #8
	mov r1, r7
	bl spl_push_front
	ldr r0, [r8]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0209CCD0
_0209C5CC: ; jump table
	b _0209C5F4 ; case 0
	b _0209C610 ; case 1
	b _0209C680 ; case 2
	b _0209C6E8 ; case 3
	b _0209C77C ; case 4
	b _0209C87C ; case 5
	b _0209CB74 ; case 6
	b _0209CBF8 ; case 7
	b _0209C938 ; case 8
	b _0209CA08 ; case 9
_0209C5F4:
	ldr r0, [sp, #0x1c]
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	str r0, [r7, #8]
	b _0209CCD0
_0209C610:
	add r0, r7, #8
	bl spl_rndm_get_arb_vec_xyz
	ldr r2, [r7, #8]
	ldr r1, [sb, #0x5c]
	mov r0, #0x800
	smull r3, r1, r2, r1
	adds r2, r3, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #8]
	ldr r2, [r7, #0xc]
	ldr r1, [sb, #0x5c]
	smull r3, r1, r2, r1
	adds r2, r3, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #0xc]
	ldr r2, [r7, #0x10]
	ldr r1, [sb, #0x5c]
	smull r3, r1, r2, r1
	adds r2, r3, r0
	adc r0, r1, #0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [r7, #0x10]
	b _0209CCD0
_0209C680:
	add r0, sp, #0x58
	bl spl_rndm_get_arb_vec_xy
	ldr r2, [sp, #0x58]
	ldr r0, [sb, #0x5c]
	mov r1, #0x800
	smull r3, r0, r2, r0
	adds r2, r3, r1
	adc r0, r0, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #0x58]
	ldr r3, [sp, #0x5c]
	ldr r2, [sb, #0x5c]
	add r0, r7, #8
	smull sl, r2, r3, r2
	adds r3, sl, r1
	adc r1, r2, #0
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	ldr r1, [sp, #0x20]
	str r2, [sp, #0x5c]
	str r1, [sp, #0x60]
	add r1, sp, #0x58
	mov r2, sb
	bl spl_set_circle_axis
	b _0209CCD0
_0209C6E8:
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0xc]
	bl _s32_div_f
	ldr r1, [sp, #0x18]
	mov r0, r0, asr #4
	add r1, r1, #0x10000
	mov r2, r0, lsl #1
	str r1, [sp, #0x18]
	ldr r0, _0209D1EC ; =FX_SinCosTable_
	mov r1, r2, lsl #1
	ldrsh r0, [r0, r1]
	add r1, r2, #1
	mov r2, r1, lsl #1
	ldr r1, _0209D1EC ; =FX_SinCosTable_
	ldrsh r3, [r1, r2]
	ldr r2, [sb, #0x5c]
	mov r1, #0x800
	smull sl, r2, r0, r2
	adds sl, sl, r1
	adc r0, r2, #0
	mov r2, sl, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #0x64]
	ldr r2, [sb, #0x5c]
	add r0, r7, #8
	smull sl, r2, r3, r2
	adds r3, sl, r1
	adc r1, r2, #0
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	ldr r1, [sp, #0x24]
	str r2, [sp, #0x68]
	str r1, [sp, #0x6c]
	add r1, sp, #0x64
	mov r2, sb
	bl spl_set_circle_axis
	b _0209CCD0
_0209C77C:
	add r0, r7, #8
	bl spl_rndm_get_arb_vec_xyz
	ldr r1, [r6]
	mov r0, #0x800
	mla r2, r1, r4, r5
	str r2, [r6]
	mov r1, r2, lsr #0x17
	mov r1, r1, lsl #0xc
	sub r1, r1, #0x100000
	mov r1, r1, asr #8
	ldr r3, [r7, #8]
	ldr r2, [sb, #0x5c]
	smull sl, r2, r3, r2
	adds r3, sl, r0
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	smull r2, r1, r3, r1
	adds r2, r2, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #8]
	ldr r1, [r6]
	mla r2, r1, r4, r5
	str r2, [r6]
	mov r1, r2, lsr #0x17
	mov r1, r1, lsl #0xc
	sub r1, r1, #0x100000
	mov r1, r1, asr #8
	ldr r3, [r7, #0xc]
	ldr r2, [sb, #0x5c]
	smull sl, r2, r3, r2
	adds r3, sl, r0
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	smull r2, r1, r3, r1
	adds r2, r2, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #0xc]
	ldr r1, [r6]
	mla r2, r1, r4, r5
	str r2, [r6]
	mov r1, r2, lsr #0x17
	mov r1, r1, lsl #0xc
	sub r1, r1, #0x100000
	mov r1, r1, asr #8
	ldr r3, [r7, #0x10]
	ldr r2, [sb, #0x5c]
	smull sl, r2, r3, r2
	adds r3, sl, r0
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	smull r2, r1, r3, r1
	adds r2, r2, r0
	adc r0, r1, #0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [r7, #0x10]
	b _0209CCD0
_0209C87C:
	add r0, sp, #0x70
	bl spl_rndm_get_arb_vec_xy
	ldr r0, [r6]
	ldr r3, [sp, #0x70]
	mla r1, r0, r4, r5
	str r1, [r6]
	ldr r0, [sb, #0x5c]
	mov r2, #0x800
	smull sl, r0, r3, r0
	adds sl, sl, r2
	adc r3, r0, #0
	mov r0, sl, lsr #0xc
	orr r0, r0, r3, lsl #20
	mov r3, r1, lsr #0x17
	mov r3, r3, lsl #0xc
	sub r3, r3, #0x100000
	mov r3, r3, asr #8
	smull sl, r3, r0, r3
	adds sl, sl, r2
	adc r0, r3, #0
	mov r3, sl, lsr #0xc
	orr r3, r3, r0, lsl #20
	mla r0, r1, r4, r5
	str r0, [r6]
	str r3, [sp, #0x70]
	mov r0, r0, lsr #0x17
	mov r0, r0, lsl #0xc
	sub r0, r0, #0x100000
	mov r1, r0, asr #8
	ldr sl, [sp, #0x74]
	ldr r3, [sb, #0x5c]
	add r0, r7, #8
	smull fp, r3, sl, r3
	adds sl, fp, r2
	adc r3, r3, #0
	mov sl, sl, lsr #0xc
	orr sl, sl, r3, lsl #20
	smull r3, r1, sl, r1
	adds r2, r3, r2
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0x74]
	add r1, sp, #0x70
	mov r2, sb
	bl spl_set_circle_axis
	b _0209CCD0
_0209C938:
	add r0, r7, #8
	bl spl_rndm_get_arb_vec_xyz
	add r0, sb, #0x84
	add r1, sb, #0x8a
	add r2, sp, #0x44
	bl VEC_Fx16CrossProduct
	ldrsh r1, [sp, #0x46]
	ldrsh r0, [sp, #0x48]
	ldrsh r2, [sp, #0x44]
	str r1, [sp, #0x80]
	str r0, [sp, #0x84]
	add r0, sp, #0x7c
	add r1, r7, #8
	str r2, [sp, #0x7c]
	bl VEC_DotProduct
	cmp r0, #0
	bgt _0209C9A0
	ldr r0, [r7, #8]
	rsb r0, r0, #0
	str r0, [r7, #8]
	ldr r0, [r7, #0xc]
	rsb r0, r0, #0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0x10]
	rsb r0, r0, #0
	str r0, [r7, #0x10]
_0209C9A0:
	ldr r2, [r7, #8]
	ldr r1, [sb, #0x5c]
	mov r0, #0x800
	smull r3, r1, r2, r1
	adds r2, r3, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #8]
	ldr r2, [r7, #0xc]
	ldr r1, [sb, #0x5c]
	smull r3, r1, r2, r1
	adds r2, r3, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #0xc]
	ldr r2, [r7, #0x10]
	ldr r1, [sb, #0x5c]
	smull r3, r1, r2, r1
	adds r2, r3, r0
	adc r0, r1, #0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [r7, #0x10]
	b _0209CCD0
_0209CA08:
	add r0, r7, #8
	bl spl_rndm_get_arb_vec_xyz
	add r0, sb, #0x84
	add r1, sb, #0x8a
	add r2, sp, #0x4a
	bl VEC_Fx16CrossProduct
	ldrsh r1, [sp, #0x4c]
	ldrsh r0, [sp, #0x4e]
	ldrsh r2, [sp, #0x4a]
	str r1, [sp, #0x8c]
	str r0, [sp, #0x90]
	add r0, sp, #0x88
	add r1, r7, #8
	str r2, [sp, #0x88]
	bl VEC_DotProduct
	cmp r0, #0
	bge _0209CA70
	ldr r0, [r7, #8]
	rsb r0, r0, #0
	str r0, [r7, #8]
	ldr r0, [r7, #0xc]
	rsb r0, r0, #0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0x10]
	rsb r0, r0, #0
	str r0, [r7, #0x10]
_0209CA70:
	ldr r1, [r6]
	mov r0, #0x800
	mla r2, r1, r4, r5
	str r2, [r6]
	mov r1, r2, lsr #0x17
	mov r1, r1, lsl #0xc
	sub r1, r1, #0x100000
	mov r1, r1, asr #9
	add r1, r1, #0x800
	ldr r3, [r7, #8]
	ldr r2, [sb, #0x5c]
	smull sl, r2, r3, r2
	adds r3, sl, r0
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	smull r2, r1, r3, r1
	adds r2, r2, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #8]
	ldr r1, [r6]
	mla r2, r1, r4, r5
	str r2, [r6]
	mov r1, r2, lsr #0x17
	mov r1, r1, lsl #0xc
	sub r1, r1, #0x100000
	mov r1, r1, asr #9
	add r1, r1, #0x800
	ldr r3, [r7, #0xc]
	ldr r2, [sb, #0x5c]
	smull sl, r2, r3, r2
	adds r3, sl, r0
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	smull r2, r1, r3, r1
	adds r2, r2, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [r7, #0xc]
	ldr r1, [r6]
	mla r2, r1, r4, r5
	str r2, [r6]
	mov r1, r2, lsr #0x17
	mov r1, r1, lsl #0xc
	sub r1, r1, #0x100000
	mov r1, r1, asr #9
	add r1, r1, #0x800
	ldr r3, [r7, #0x10]
	ldr r2, [sb, #0x5c]
	smull sl, r2, r3, r2
	adds r3, sl, r0
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	smull r2, r1, r3, r1
	adds r2, r2, r0
	adc r0, r1, #0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [r7, #0x10]
	b _0209CCD0
_0209CB74:
	add r0, r7, #0x14
	bl spl_rndm_get_arb_vec_xy
	ldr r2, [r7, #0x14]
	ldr r1, [sb, #0x5c]
	mov r0, #0x800
	smull r3, r1, r2, r1
	adds r2, r3, r0
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0x94]
	ldr r3, [r7, #0x18]
	ldr r2, [sb, #0x5c]
	ldr r1, [r6]
	smull sl, r2, r3, r2
	adds r3, sl, r0
	adc r0, r2, #0
	mov r2, r3, lsr #0xc
	orr r2, r2, r0, lsl #20
	mla r0, r1, r4, r5
	str r0, [r6]
	str r2, [sp, #0x98]
	mov r1, r0, lsr #0x17
	ldr r2, [sb, #0x60]
	add r0, r7, #8
	mul r1, r2, r1
	sub r1, r1, r2, lsl #8
	mov r1, r1, asr #8
	str r1, [sp, #0x9c]
	add r1, sp, #0x94
	mov r2, sb
	bl spl_set_circle_axis
	b _0209CCD0
_0209CBF8:
	add r0, r7, #0x14
	bl spl_rndm_get_arb_vec_xy
	ldr r0, [r6]
	mov r3, #0x800
	mla r2, r0, r4, r5
	str r2, [r6]
	ldr sl, [r7, #0x14]
	ldr r0, [sb, #0x5c]
	mov r1, r2, lsr #0x17
	smull fp, r0, sl, r0
	adds fp, fp, r3
	mov r1, r1, lsl #0xc
	adc sl, r0, #0
	mov r0, fp, lsr #0xc
	sub r1, r1, #0x100000
	orr r0, r0, sl, lsl #20
	mov r1, r1, asr #8
	smull sl, r1, r0, r1
	adds sl, sl, r3
	adc r0, r1, #0
	mov r1, sl, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0xa0]
	mla r1, r2, r4, r5
	str r1, [r6]
	mov r2, r1, lsr #0x17
	mov r2, r2, lsl #0xc
	sub r2, r2, #0x100000
	ldr sl, [r7, #0x18]
	ldr r0, [sb, #0x5c]
	mov r2, r2, asr #8
	smull fp, r0, sl, r0
	adds fp, fp, r3
	adc sl, r0, #0
	mov r0, fp, lsr #0xc
	orr r0, r0, sl, lsl #20
	smull sl, r2, r0, r2
	adds r3, sl, r3
	adc r0, r2, #0
	mov r2, r3, lsr #0xc
	orr r2, r2, r0, lsl #20
	mla r0, r1, r4, r5
	str r0, [r6]
	str r2, [sp, #0xa4]
	mov r1, r0, lsr #0x17
	ldr r2, [sb, #0x60]
	add r0, r7, #8
	mul r1, r2, r1
	sub r1, r1, r2, lsl #8
	mov r1, r1, asr #8
	str r1, [sp, #0xa8]
	add r1, sp, #0xa0
	mov r2, sb
	bl spl_set_circle_axis
_0209CCD0:
	ldr r1, [r6]
	mla r0, r1, r4, r5
	str r0, [r6]
	ldrb r2, [r8, #0x42]
	mov r1, r0, lsr #0x18
	ldr r3, [sb, #0x64]
	mul r1, r2, r1
	add r2, r2, #0xff
	sub r1, r2, r1, asr #7
	mul r1, r3, r1
	mov r1, r1, asr #8
	str r1, [sp, #0x10]
	mla r1, r0, r4, r5
	str r1, [r6]
	mov r0, r1, lsr #0x18
	ldrb r2, [r8, #0x42]
	ldr r3, [sb, #0x68]
	ldr r1, [r8]
	mul r0, r2, r0
	add r2, r2, #0xff
	sub r0, r2, r0, asr #7
	mul r0, r3, r0
	mov r0, r0, asr #8
	str r0, [sp, #0x14]
	mov r0, r1, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #6
	bne _0209CE1C
	ldrsh r0, [sb, #0x84]
	ldr r1, [r7, #0x14]
	mov r2, #0x800
	smull r3, r0, r1, r0
	adds r1, r3, r2
	ldrsh r3, [sb, #0x8a]
	ldr lr, [r7, #0x18]
	mov ip, r1, lsr #0xc
	smull sl, r3, lr, r3
	adc r0, r0, #0
	adds sl, sl, r2
	orr ip, ip, r0, lsl #20
	adc r3, r3, #0
	mov sl, sl, lsr #0xc
	orr sl, sl, r3, lsl #20
	add r3, ip, sl
	str r3, [sp, #0xb8]
	ldrsh sl, [sb, #0x86]
	ldr r3, [r7, #0x14]
	ldrsh lr, [sb, #0x8c]
	smull ip, sl, r3, sl
	adds ip, ip, r2
	ldr fp, [r7, #0x18]
	adc sl, sl, #0
	smull r3, lr, fp, lr
	mov ip, ip, lsr #0xc
	adds r3, r3, r2
	orr ip, ip, sl, lsl #20
	adc sl, lr, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, sl, lsl #20
	add r3, ip, r3
	str r3, [sp, #0xbc]
	ldr sl, [r7, #0x18]
	ldrsh fp, [sb, #0x88]
	ldr r3, [r7, #0x14]
	str sl, [sp, #0x28]
	smull ip, fp, r3, fp
	ldrsh sl, [sb, #0x8e]
	ldr r3, [sp, #0x28]
	adds ip, ip, r2
	smull sl, lr, r3, sl
	adc r3, fp, #0
	adds r2, sl, r2
	mov sl, ip, lsr #0xc
	orr sl, sl, r3, lsl #20
	adc r3, lr, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r3, lsl #20
	add r2, sl, r2
	add r0, sp, #0xb8
	add r1, sp, #0xac
	str r2, [sp, #0xc0]
	bl VEC_Normalize
	b _0209CE58
_0209CE1C:
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _0209CE4C
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0209CE4C
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _0209CE4C
	add r0, sp, #0xac
	bl spl_rndm_get_arb_vec_xyz
	b _0209CE58
_0209CE4C:
	add r0, r7, #8
	add r1, sp, #0xac
	bl VEC_Normalize
_0209CE58:
	ldr r2, [sp, #0xac]
	ldr r1, [sp, #0x10]
	mov r0, #0x800
	smull sl, r1, r2, r1
	adds r2, sl, r0
	add sl, sb, #0x28
	str sl, [sp, #0x2c]
	add sl, r7, #0x38
	str sl, [sp, #0x30]
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	ldrsh r1, [sb, #0x50]
	ldr sl, [sp, #0x14]
	ldr r3, [sb, #0x40]
	smull fp, sl, r1, sl
	adds fp, fp, r0
	adc r1, sl, #0
	mov sl, fp, lsr #0xc
	orr sl, sl, r1, lsl #20
	add r1, r2, sl
	add r1, r3, r1
	str r1, [r7, #0x14]
	ldr r3, [sp, #0xb0]
	ldr r1, [sp, #0x10]
	ldrsh sl, [sb, #0x52]
	smull fp, r1, r3, r1
	adds fp, fp, r0
	adc r3, r1, #0
	mov r1, fp, lsr #0xc
	orr r1, r1, r3, lsl #20
	ldr r3, [sp, #0x14]
	ldr r2, [sb, #0x44]
	smull fp, r3, sl, r3
	adds sl, fp, r0
	adc r3, r3, #0
	mov sl, sl, lsr #0xc
	orr sl, sl, r3, lsl #20
	add r1, r1, sl
	add r1, r2, r1
	str r1, [r7, #0x18]
	ldr r1, [sp, #0xb4]
	ldr r2, [sp, #0x10]
	ldrsh lr, [sb, #0x54]
	smull sl, r3, r1, r2
	ldr r1, [sp, #0x14]
	adds sl, sl, r0
	smull r2, r1, lr, r1
	adc r3, r3, #0
	adds r0, r2, r0
	mov r2, sl, lsr #0xc
	orr r2, r2, r3, lsl #20
	adc r1, r1, #0
	mov r0, r0, lsr #0xc
	orr r0, r0, r1, lsl #20
	ldr ip, [sb, #0x48]
	add r0, r2, r0
	add r0, ip, r0
	str r0, [r7, #0x1c]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldr r0, [r6]
	mla r1, r0, r4, r5
	str r1, [r6]
	mov r0, r1, lsr #0x18
	ldrb r1, [r8, #0x40]
	ldr r2, [sb, #0x6c]
	mul r0, r1, r0
	add r1, r1, #0xff
	sub r0, r1, r0, asr #7
	mul r0, r2, r0
	mov r0, r0, asr #8
	str r0, [r7, #0x30]
	ldr r0, [sp, #0x34]
	strh r0, [r7, #0x34]
	ldr r0, [r8]
	mov r0, r0, lsl #0x16
	movs r0, r0, lsr #0x1f
	beq _0209D010
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	ldrh r0, [r0, #8]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _0209D010
	ldr r0, [r6]
	ldr r3, _0209D1F0 ; =0x00000003
	mla r1, r0, r4, r5
	str r1, [r6]
	mov r0, r1, lsr #0x14
	ldr r1, [sp, #4]
	ldr r2, [r1, #8]
	ldr r1, _0209D1F4 ; =0xAAAAAAAB
	umull r1, sl, r0, r1
	mov sl, sl, lsr #1
	umull sl, fp, r3, sl
	ldrh r1, [r2]
	sub sl, r0, sl
	strh r1, [sp, #0x50]
	ldrh r0, [r8, #0x22]
	mov r1, sl, lsl #1
	strh r0, [sp, #0x52]
	ldrh r0, [r2, #2]
	strh r0, [sp, #0x54]
	add r0, sp, #0x50
	ldrh r0, [r0, r1]
	strh r0, [r7, #0x36]
	b _0209D018
_0209D010:
	ldrh r0, [r8, #0x22]
	strh r0, [r7, #0x36]
_0209D018:
	ldrh r1, [r7, #0x2e]
	ldrb r0, [sb, #0x81]
	bic r1, r1, #0x1f
	and r0, r0, #0x1f
	orr r0, r1, r0
	strh r0, [r7, #0x2e]
	ldrh r0, [r7, #0x2e]
	bic r0, r0, #0x3e0
	orr r0, r0, #0x3e0
	strh r0, [r7, #0x2e]
	ldr r0, [r8]
	mov r0, r0, lsl #0x12
	movs r0, r0, lsr #0x1f
	ldrne r0, [r6]
	mlane r1, r0, r4, r5
	strne r1, [r6]
	strneh r1, [r7, #0x20]
	ldreqh r0, [sb, #0x56]
	streqh r0, [r7, #0x20]
	ldr r0, [r8]
	mov r0, r0, lsl #0x13
	movs r0, r0, lsr #0x1f
	ldreq r0, [sp, #0x38]
	streqh r0, [r7, #0x22]
	beq _0209D0A8
	ldr r0, [r6]
	mla r1, r0, r4, r5
	str r1, [r6]
	mov r0, r1, lsr #0x14
	ldrsh r2, [r8, #0x34]
	ldrsh r1, [r8, #0x36]
	sub r1, r1, r2
	mul r0, r1, r0
	add r0, r0, r2, lsl #12
	mov r0, r0, lsr #0xc
	strh r0, [r7, #0x22]
_0209D0A8:
	ldr r0, [r6]
	mla r1, r0, r4, r5
	str r1, [r6]
	mov r0, r1, lsr #0x18
	ldrb r1, [r8, #0x41]
	ldrh r2, [sb, #0x70]
	mul r0, r1, r0
	mov r0, r0, asr #8
	rsb r0, r0, #0xff
	mul r0, r2, r0
	mov r0, r0, asr #8
	add r0, r0, #1
	strh r0, [r7, #0x24]
	ldr r0, [sp, #0x3c]
	strh r0, [r7, #0x26]
	ldr r0, [r8]
	mov r0, r0, lsl #0x14
	movs r1, r0, lsr #0x1f
	beq _0209D138
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #8]
	mov r0, r0, lsl #0xf
	movs r0, r0, lsr #0x1f
	beq _0209D138
	ldr r0, [r6]
	mla r1, r0, r4, r5
	str r1, [r6]
	mov r0, r1, lsr #0x14
	ldr r1, [sp, #4]
	ldr sl, [r1, #0x10]
	ldrb r1, [sl, #8]
	bl _u32_div_f
	ldrb r0, [sl, r1]
	strb r0, [r7, #0x2c]
	b _0209D168
_0209D138:
	cmp r1, #0
	beq _0209D160
	ldr r0, [sp, #4]
	ldr r1, [r0, #0x10]
	ldr r0, [r1, #8]
	mov r0, r0, lsl #0xf
	movs r0, r0, lsr #0x1f
	ldreqb r0, [r1]
	streqb r0, [r7, #0x2c]
	beq _0209D168
_0209D160:
	ldrb r0, [r8, #0x47]
	strb r0, [r7, #0x2c]
_0209D168:
	ldr r1, [sp, #4]
	ldr r0, _0209D1F8 ; =0x0000FFFF
	ldr r1, [r1]
	ldrb r1, [r1, #0x48]
	bl _s32_div_f
	strh r0, [r7, #0x28]
	ldrh r1, [r7, #0x24]
	ldr r0, _0209D1F8 ; =0x0000FFFF
	bl _s32_div_f
	strh r0, [r7, #0x2a]
	ldr r0, [sp, #0x40]
	strb r0, [r7, #0x2d]
	ldr r0, [r8]
	mov r0, r0, lsl #0xb
	movs r0, r0, lsr #0x1f
	ldrne r0, [r6]
	mlane r1, r0, r4, r5
	strne r1, [r6]
	movne r0, r1, lsr #0x18
	strneb r0, [r7, #0x2d]
	ldr r0, [sp, #8]
	add r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp, #8]
	cmp r1, r0
	blt _0209C590
	add sp, sp, #0xc4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0209D1DC: .word 0x00000FFF
_0209D1E0: .word spl_rndm_seed
_0209D1E4: .word 0x5EEDF715
_0209D1E8: .word 0x1B0CB173
_0209D1EC: .word FX_SinCosTable_
_0209D1F0: .word 0x00000003
_0209D1F4: .word 0xAAAAAAAB
_0209D1F8: .word 0x0000FFFF
	arm_func_end spl_gen_ptcl

	arm_func_start spl_set_circle_axis
spl_set_circle_axis: ; 0x0209D1FC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r4, r2
	mov r6, r0
	mov r5, r1
	add r2, sp, #0
	add r0, r4, #0x84
	add r1, r4, #0x8a
	bl VEC_Fx16CrossProduct
	add r0, sp, #0
	mov r1, r0
	bl VEC_Fx16Normalize
	ldrsh r1, [sp]
	ldr lr, [r5, #8]
	ldrsh r0, [r4, #0x84]
	ldr ip, [r5]
	smull r3, r2, lr, r1
	smull r1, r0, ip, r0
	ldrsh r7, [r4, #0x8a]
	ldr r8, [r5, #4]
	mov ip, #0x800
	smull lr, r7, r8, r7
	adds r8, r3, ip
	adc r3, r2, #0
	mov r2, r8, lsr #0xc
	adds r1, r1, ip
	orr r2, r2, r3, lsl #20
	adc r0, r0, #0
	mov r3, r1, lsr #0xc
	adds r1, lr, ip
	orr r3, r3, r0, lsl #20
	adc r0, r7, #0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	add r0, r3, r1
	add r0, r2, r0
	str r0, [r6]
	ldrsh r0, [sp, #2]
	ldr r1, [r5, #8]
	ldrsh r3, [r4, #0x86]
	smull r2, r0, r1, r0
	adds r2, r2, ip
	ldr lr, [r5]
	adc r1, r0, #0
	mov r0, r2, lsr #0xc
	orr r0, r0, r1, lsl #20
	smull r8, r7, lr, r3
	ldrsh r1, [r4, #0x8c]
	ldr r2, [r5, #4]
	adds r8, r8, ip
	smull r3, r1, r2, r1
	adc r2, r7, #0
	mov r7, r8, lsr #0xc
	orr r7, r7, r2, lsl #20
	adds r2, r3, ip
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	add r1, r7, r2
	add r0, r0, r1
	str r0, [r6, #4]
	ldrsh r0, [sp, #4]
	ldr r1, [r5, #8]
	ldr lr, [r5]
	smull r3, r0, r1, r0
	adds r3, r3, ip
	adc r1, r0, #0
	mov r0, r3, lsr #0xc
	orr r0, r0, r1, lsl #20
	ldrsh r3, [r4, #0x88]
	ldrsh r1, [r4, #0x8e]
	ldr r2, [r5, #4]
	smull r5, r4, lr, r3
	adds r5, r5, ip
	smull r3, r1, r2, r1
	adc r4, r4, #0
	adds r2, r3, ip
	mov r3, r5, lsr #0xc
	adc r1, r1, #0
	mov r2, r2, lsr #0xc
	orr r3, r3, r4, lsl #20
	orr r2, r2, r1, lsl #20
	add r1, r3, r2
	add r0, r0, r1
	str r0, [r6, #8]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end spl_set_circle_axis

	arm_func_start spl_set_cross_to_axis
spl_set_cross_to_axis: ; 0x0209D35C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	ldr r1, _0209D5E0 ; =_021105EC
	mov r4, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #2]
	ldrh r0, [r1, #4]
	strh r3, [sp]
	strh r2, [sp, #2]
	strh r0, [sp, #4]
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1e
	beq _0209D3DC
	cmp r0, #1
	beq _0209D3C4
	cmp r0, #2
	bne _0209D3F4
	mov r0, #0
	mov r1, #0x1000
	strh r1, [sp, #6]
	strh r0, [sp, #8]
	strh r0, [sp, #0xa]
	b _0209D400
_0209D3C4:
	mov r1, #0
	mov r0, #0x1000
	strh r1, [sp, #6]
	strh r0, [sp, #8]
	strh r1, [sp, #0xa]
	b _0209D400
_0209D3DC:
	mov r1, #0
	mov r0, #0x1000
	strh r1, [sp, #6]
	strh r1, [sp, #8]
	strh r0, [sp, #0xa]
	b _0209D400
_0209D3F4:
	add r1, sp, #6
	add r0, r4, #0x50
	bl VEC_Fx16Normalize
_0209D400:
	add r0, sp, #0
	add r1, sp, #6
	bl VEC_Fx16DotProduct
	cmp r0, #0x1000
	beq _0209D424
	mov r1, #0x1000
	rsb r1, r1, #0
	cmp r0, r1
	bne _0209D438
_0209D424:
	mov r0, #0
	mov r1, #0x1000
	strh r1, [sp]
	strh r0, [sp, #2]
	strh r0, [sp, #4]
_0209D438:
	ldrsh r3, [sp, #8]
	ldrsh r1, [sp, #4]
	ldrsh r2, [sp, #0xa]
	ldrsh r0, [sp, #2]
	smull r6, r5, r3, r1
	mov r1, #0x800
	adds r6, r6, r1
	smull r3, r0, r2, r0
	adc r5, r5, #0
	adds r2, r3, r1
	mov r3, r6, lsr #0xc
	adc r0, r0, #0
	mov r2, r2, lsr #0xc
	orr r3, r3, r5, lsl #20
	orr r2, r2, r0, lsl #20
	sub r0, r3, r2
	strh r0, [r4, #0x84]
	ldrsh r5, [sp, #0xa]
	ldrsh r3, [sp]
	ldrsh r2, [sp, #6]
	ldrsh r0, [sp, #4]
	smull r3, r6, r5, r3
	adds ip, r3, r1
	smull r3, r0, r2, r0
	adc r5, r6, #0
	adds r2, r3, r1
	mov r3, ip, lsr #0xc
	adc r0, r0, #0
	mov r2, r2, lsr #0xc
	orr r3, r3, r5, lsl #20
	orr r2, r2, r0, lsl #20
	sub r0, r3, r2
	strh r0, [r4, #0x86]
	ldrsh r5, [sp, #6]
	ldrsh r3, [sp, #2]
	ldrsh r2, [sp, #8]
	ldrsh r0, [sp]
	smull r3, r6, r5, r3
	adds ip, r3, r1
	smull r3, r0, r2, r0
	adc r5, r6, #0
	adds r2, r3, r1
	mov r3, ip, lsr #0xc
	adc r0, r0, #0
	mov r2, r2, lsr #0xc
	orr r3, r3, r5, lsl #20
	orr r2, r2, r0, lsl #20
	sub r0, r3, r2
	strh r0, [r4, #0x88]
	ldrsh r6, [sp, #8]
	ldrsh r5, [r4, #0x88]
	add r0, r4, #0x84
	ldrsh r3, [sp, #0xa]
	ldrsh r2, [r4, #0x86]
	smull r5, ip, r6, r5
	adds lr, r5, r1
	smull r5, r2, r3, r2
	adc r6, ip, #0
	adds r3, r5, r1
	mov r5, lr, lsr #0xc
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r5, r5, r6, lsl #20
	orr r3, r3, r2, lsl #20
	sub r2, r5, r3
	strh r2, [r4, #0x8a]
	ldrsh r6, [sp, #0xa]
	ldrsh r5, [r4, #0x84]
	ldrsh r3, [sp, #6]
	ldrsh r2, [r4, #0x88]
	smull lr, ip, r6, r5
	smull r5, r2, r3, r2
	adds r6, lr, r1
	adc r3, ip, #0
	mov r6, r6, lsr #0xc
	orr r6, r6, r3, lsl #20
	adds r3, r5, r1
	adc r2, r2, #0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	sub r2, r6, r3
	strh r2, [r4, #0x8c]
	ldrsh lr, [sp, #6]
	ldrsh ip, [r4, #0x86]
	ldrsh r3, [sp, #8]
	ldrsh r2, [r4, #0x84]
	smull r6, r5, lr, ip
	smull ip, r2, r3, r2
	adds r6, r6, r1
	adc r5, r5, #0
	adds r3, ip, r1
	mov r6, r6, lsr #0xc
	orr r6, r6, r5, lsl #20
	adc r1, r2, #0
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	sub r1, r6, r2
	strh r1, [r4, #0x8e]
	mov r1, r0
	bl VEC_Fx16Normalize
	add r0, r4, #0x8a
	mov r1, r0
	bl VEC_Fx16Normalize
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0209D5E0: .word _021105EC
	arm_func_end spl_set_cross_to_axis

	arm_func_start spl_chld_alp_out
spl_chld_alp_out: ; 0x0209D5E4
	stmdb sp!, {lr}
	sub sp, sp, #4
	rsb r2, r2, #0xff
	mov r1, #0x1f
	mul r3, r2, r1
	ldr r2, _0209D638 ; =0x80808081
	ldrh lr, [r0, #0x2e]
	smull r1, ip, r2, r3
	add ip, r3, ip
	mov ip, ip, asr #7
	mov r1, r3, lsr #0x1f
	add ip, r1, ip
	mov r1, ip, lsl #0x10
	mov r1, r1, lsr #0x10
	bic r2, lr, #0x3e0
	and r1, r1, #0x1f
	orr r1, r2, r1, lsl #5
	strh r1, [r0, #0x2e]
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_0209D638: .word 0x80808081
	arm_func_end spl_chld_alp_out

	arm_func_start spl_chld_scl_out
spl_chld_scl_out: ; 0x0209D63C
	stmdb sp!, {lr}
	sub sp, sp, #4
	ldr r3, [r1, #0x14]
	sub r1, r2, #0xff
	ldrsh lr, [r3, #4]
	ldr r2, _0209D684 ; =0x80808081
	sub r3, lr, #0x1000
	mul ip, r3, r1
	smull r1, r3, r2, ip
	add r3, ip, r3
	mov r3, r3, asr #7
	mov r1, ip, lsr #0x1f
	add r3, r1, r3
	add r1, lr, r3
	strh r1, [r0, #0x34]
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_0209D684: .word 0x80808081
	arm_func_end spl_chld_scl_out

	arm_func_start spl_tex_ptn_anm
spl_tex_ptn_anm: ; 0x0209D688
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	ldr r5, [r1, #0x10]
	mov r4, #0
	ldrb r3, [r5, #8]
	cmp r3, #0
	addle sp, sp, #4
	ldmleia sp!, {r4, r5, lr}
	bxle lr
	ldrb ip, [r5, #9]
	mov lr, r4
_0209D6B4:
	add r1, lr, ip
	cmp r2, r1
	ldrltb r1, [r5, r4]
	addlt sp, sp, #4
	strltb r1, [r0, #0x2c]
	ldmltia sp!, {r4, r5, lr}
	bxlt lr
	add r4, r4, #1
	cmp r4, r3
	add lr, lr, ip
	blt _0209D6B4
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end spl_tex_ptn_anm

	arm_func_start spl_alp_in_out
spl_alp_in_out: ; 0x0209D6EC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, [r1, #0xc]
	mov r5, r0
	ldrb r1, [r4, #4]
	ldrb r3, [r4, #5]
	cmp r2, r1
	bge _0209D72C
	ldrh r3, [r4]
	mov r0, r3, lsl #0x16
	mov r6, r3, lsl #0x1b
	mov r0, r0, lsr #0x1b
	sub r0, r0, r6, lsr #27
	mul r0, r2, r0
	bl _s32_div_f
	add r0, r0, r6, lsr #27
	b _0209D768
_0209D72C:
	cmp r2, r3
	ldrlth r0, [r4]
	movlt r0, r0, lsl #0x16
	movlt r0, r0, lsr #0x1b
	blt _0209D768
	ldrh r0, [r4]
	sub r2, r2, #0xff
	rsb r1, r3, #0xff
	mov r6, r0, lsl #0x11
	mov r3, r6, lsr #0x1b
	mov r0, r0, lsl #0x16
	sub r0, r3, r0, lsr #27
	mul r0, r2, r0
	bl _s32_div_f
	add r0, r0, r6, lsr #27
_0209D768:
	ldr r3, _0209D7BC ; =spl_rndm_seed
	ldr r1, _0209D7C0 ; =0x5EEDF715
	ldr ip, [r3]
	ldr r2, _0209D7C4 ; =0x1B0CB173
	mla r1, ip, r1, r2
	str r1, [r3]
	ldrb r2, [r4, #2]
	mov r1, r1, lsr #0x18
	ldrh r3, [r5, #0x2e]
	mul r1, r2, r1
	mov r1, r1, asr #8
	rsb r1, r1, #0xff
	mul r1, r0, r1
	mov r0, r1, lsl #8
	mov r0, r0, lsr #0x10
	bic r1, r3, #0x3e0
	and r0, r0, #0x1f
	orr r0, r1, r0, lsl #5
	strh r0, [r5, #0x2e]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0209D7BC: .word spl_rndm_seed
_0209D7C0: .word 0x5EEDF715
_0209D7C4: .word 0x1B0CB173
	arm_func_end spl_alp_in_out

	arm_func_start spl_clr_in_out
spl_clr_in_out: ; 0x0209D7C8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #4
	ldr r4, [r1, #8]
	mov sl, r0
	ldrb r3, [r4, #4]
	ldr r0, [r1]
	ldrb r1, [r4, #5]
	cmp r2, r3
	ldrb fp, [r4, #6]
	ldrlth r0, [r4]
	addlt sp, sp, #4
	strlth r0, [sl, #0x36]
	ldmltia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxlt lr
	cmp r2, r1
	bge _0209D8C0
	ldrh sb, [r0, #0x22]
	ldrh r0, [r4, #8]
	ldrh r8, [r4]
	mov r7, sb, asr #5
	mov fp, sb, asr #0xa
	mov r4, r0, lsl #0x1d
	mov r6, r8, asr #5
	mov r5, r8, asr #0xa
	movs r4, r4, lsr #0x1f
	and sb, sb, #0x1f
	and r7, r7, #0x1f
	and r0, fp, #0x1f
	orreq r1, sb, r7, lsl #5
	orreq r0, r1, r0, lsl #10
	and r8, r8, #0x1f
	and r6, r6, #0x1f
	and r5, r5, #0x1f
	addeq sp, sp, #4
	streqh r0, [sl, #0x36]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	sub r4, r2, r3
	sub r0, r0, r5
	mul r0, r4, r0
	sub fp, r1, r3
	mov r1, fp
	bl _s32_div_f
	sub r1, sb, r8
	mov sb, r0
	mul r0, r4, r1
	mov r1, fp
	bl _s32_div_f
	sub r1, r7, r6
	mov r7, r0
	mul r0, r4, r1
	mov r1, fp
	bl _s32_div_f
	add r1, r8, r7
	add r0, r6, r0
	add r2, r5, sb
	orr r0, r1, r0, lsl #5
	orr r0, r0, r2, lsl #10
	add sp, sp, #4
	strh r0, [sl, #0x36]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_0209D8C0:
	cmp r2, fp
	bge _0209D980
	ldrh r7, [r4, #2]
	ldrh r8, [r0, #0x22]
	ldrh r0, [r4, #8]
	mov r5, r7, asr #5
	mov r4, r7, asr #0xa
	mov r3, r0, lsl #0x1d
	mov r6, r8, asr #5
	mov sb, r8, asr #0xa
	movs r3, r3, lsr #0x1f
	and r7, r7, #0x1f
	and r5, r5, #0x1f
	and r0, r4, #0x1f
	orreq r1, r7, r5, lsl #5
	orreq r0, r1, r0, lsl #10
	and r8, r8, #0x1f
	and r6, r6, #0x1f
	and sb, sb, #0x1f
	addeq sp, sp, #4
	streqh r0, [sl, #0x36]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	sub r4, r2, r1
	sub r0, r0, sb
	mul r0, r4, r0
	sub fp, fp, r1
	mov r1, fp
	bl _s32_div_f
	sub r1, r7, r8
	mov r7, r0
	mul r0, r4, r1
	mov r1, fp
	bl _s32_div_f
	sub r1, r5, r6
	mov r5, r0
	mul r0, r4, r1
	mov r1, fp
	bl _s32_div_f
	add r1, r8, r5
	add r0, r6, r0
	add r2, sb, r7
	orr r0, r1, r0, lsl #5
	orr r0, r0, r2, lsl #10
	add sp, sp, #4
	strh r0, [sl, #0x36]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_0209D980:
	ldrh r0, [r4, #2]
	strh r0, [sl, #0x36]
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end spl_clr_in_out

	arm_func_start spl_scl_in_out
spl_scl_in_out: ; 0x0209D994
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	ldr ip, [r1, #4]
	mov r4, r0
	ldrb r1, [ip, #6]
	ldrb r3, [ip, #7]
	cmp r2, r1
	bge _0209D9DC
	ldrsh r5, [ip]
	ldrsh r0, [ip, #2]
	sub r0, r0, r5
	mul r0, r2, r0
	bl _s32_div_f
	add r0, r5, r0
	add sp, sp, #4
	strh r0, [r4, #0x34]
	ldmia sp!, {r4, r5, lr}
	bx lr
_0209D9DC:
	cmp r2, r3
	ldrltsh r0, [ip, #2]
	addlt sp, sp, #4
	strlth r0, [r4, #0x34]
	ldmltia sp!, {r4, r5, lr}
	bxlt lr
	ldrsh r5, [ip, #4]
	ldrsh r0, [ip, #2]
	sub r2, r2, #0xff
	rsb r1, r3, #0xff
	sub r0, r5, r0
	mul r0, r2, r0
	bl _s32_div_f
	add r0, r5, r0
	strh r0, [r4, #0x34]
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end spl_scl_in_out

	arm_func_start spl_calc_convergence
spl_calc_convergence: ; 0x0209DA24
	stmdb sp!, {r4, lr}
	ldr lr, [r1, #8]
	ldr r2, [r0]
	ldrsh r4, [r0, #0xc]
	sub r3, r2, lr
	mov r2, #0x800
	smull ip, r3, r4, r3
	adds r4, ip, r2
	adc r3, r3, #0
	mov r4, r4, lsr #0xc
	orr r4, r4, r3, lsl #20
	add r3, lr, r4
	str r3, [r1, #8]
	ldr r4, [r1, #0xc]
	ldr r3, [r0, #4]
	ldrsh ip, [r0, #0xc]
	sub r3, r3, r4
	smull lr, r3, ip, r3
	adds ip, lr, r2
	adc r3, r3, #0
	mov ip, ip, lsr #0xc
	orr ip, ip, r3, lsl #20
	add r3, r4, ip
	str r3, [r1, #0xc]
	ldr lr, [r1, #0x10]
	ldr r3, [r0, #8]
	ldrsh ip, [r0, #0xc]
	sub r0, r3, lr
	smull r3, r0, ip, r0
	adds r2, r3, r2
	adc r0, r0, #0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	add r0, lr, r2
	str r0, [r1, #0x10]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end spl_calc_convergence

	arm_func_start spl_calc_scfield
spl_calc_scfield: ; 0x0209DAB8
	ldr r3, [r3, #0x74]
	ldr r2, [r0]
	cmp r3, #0x80000000
	movne r2, r3
	ldrh r3, [r0, #6]
	mov r3, r3, lsl #0x1e
	movs r3, r3, lsr #0x1e
	beq _0209DAE4
	cmp r3, #1
	beq _0209DB38
	bx lr
_0209DAE4:
	ldr r3, [r1, #0x3c]
	cmp r3, r2
	bge _0209DB10
	ldr r0, [r1, #0xc]
	add r0, r3, r0
	cmp r0, r2
	subgt r0, r2, r3
	strgt r0, [r1, #0xc]
	ldrgth r0, [r1, #0x24]
	strgth r0, [r1, #0x26]
	bxgt lr
_0209DB10:
	cmp r3, r2
	bxlt lr
	ldr r0, [r1, #0xc]
	add r0, r3, r0
	cmp r0, r2
	sublt r0, r2, r3
	strlt r0, [r1, #0xc]
	ldrlth r0, [r1, #0x24]
	strlth r0, [r1, #0x26]
	bx lr
_0209DB38:
	ldr ip, [r1, #0x3c]
	cmp ip, r2
	bge _0209DB88
	ldr r3, [r1, #0xc]
	add r3, ip, r3
	cmp r3, r2
	ble _0209DB88
	sub r2, r2, ip
	str r2, [r1, #0xc]
	ldrsh r2, [r0, #4]
	ldr r3, [r1, #0x18]
	mov r0, #0x800
	smull ip, r2, r3, r2
	adds r3, ip, r0
	adc r0, r2, #0
	mov r2, r3, lsr #0xc
	orr r2, r2, r0, lsl #20
	rsb r0, r2, #0
	str r0, [r1, #0x18]
	bx lr
_0209DB88:
	cmp ip, r2
	bxlt lr
	ldr r3, [r1, #0xc]
	add r3, ip, r3
	cmp r3, r2
	bxge lr
	sub r2, r2, ip
	str r2, [r1, #0xc]
	ldrsh r2, [r0, #4]
	ldr r3, [r1, #0x18]
	mov r0, #0x800
	smull ip, r2, r3, r2
	adds r3, ip, r0
	adc r0, r2, #0
	mov r2, r3, lsr #0xc
	orr r2, r2, r0, lsl #20
	rsb r0, r2, #0
	str r0, [r1, #0x18]
	bx lr
	arm_func_end spl_calc_scfield

	arm_func_start spl_calc_spin
spl_calc_spin: ; 0x0209DBD4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x28
	ldrh r2, [r0, #2]
	mov r4, r1
	cmp r2, #0
	beq _0209DC00
	cmp r2, #1
	beq _0209DC30
	cmp r2, #2
	beq _0209DC60
	b _0209DC8C
_0209DC00:
	ldrh r1, [r0]
	ldr r3, _0209DCA8 ; =FX_SinCosTable_
	add r0, sp, #0
	mov r1, r1, asr #4
	mov r2, r1, lsl #1
	add r1, r2, #1
	mov ip, r2, lsl #1
	mov r2, r1, lsl #1
	ldrsh r1, [r3, ip]
	ldrsh r2, [r3, r2]
	bl MTX_RotX33_
	b _0209DC8C
_0209DC30:
	ldrh r1, [r0]
	ldr r3, _0209DCA8 ; =FX_SinCosTable_
	add r0, sp, #0
	mov r1, r1, asr #4
	mov r2, r1, lsl #1
	add r1, r2, #1
	mov ip, r2, lsl #1
	mov r2, r1, lsl #1
	ldrsh r1, [r3, ip]
	ldrsh r2, [r3, r2]
	bl MTX_RotY33_
	b _0209DC8C
_0209DC60:
	ldrh r1, [r0]
	ldr r3, _0209DCA8 ; =FX_SinCosTable_
	add r0, sp, #0
	mov r1, r1, asr #4
	mov r2, r1, lsl #1
	add r1, r2, #1
	mov ip, r2, lsl #1
	mov r2, r1, lsl #1
	ldrsh r1, [r3, ip]
	ldrsh r2, [r3, r2]
	bl MTX_RotZ33_
_0209DC8C:
	add r0, r4, #8
	add r1, sp, #0
	mov r2, r0
	bl MTX_MultVec33
	add sp, sp, #0x28
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0209DCA8: .word FX_SinCosTable_
	arm_func_end spl_calc_spin

	arm_func_start spl_calc_magnet
spl_calc_magnet: ; 0x0209DCAC
	stmdb sp!, {r4, lr}
	ldr ip, [r0]
	ldr r4, [r1, #8]
	ldrsh lr, [r0, #0xc]
	ldr r3, [r1, #0x14]
	sub r4, ip, r4
	sub r3, r4, r3
	mul r3, lr, r3
	ldr r4, [r2]
	add r3, r4, r3, asr #12
	str r3, [r2]
	ldr lr, [r0, #4]
	ldr ip, [r1, #0xc]
	ldrsh r4, [r0, #0xc]
	ldr r3, [r1, #0x18]
	sub ip, lr, ip
	sub r3, ip, r3
	mul r3, r4, r3
	ldr r4, [r2, #4]
	add r3, r4, r3, asr #12
	str r3, [r2, #4]
	ldr ip, [r0, #8]
	ldr r3, [r1, #0x10]
	ldrsh lr, [r0, #0xc]
	ldr r0, [r1, #0x1c]
	sub r1, ip, r3
	sub r0, r1, r0
	mul r0, lr, r0
	ldr r1, [r2, #8]
	add r0, r1, r0, asr #12
	str r0, [r2, #8]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end spl_calc_magnet

	arm_func_start spl_calc_random
spl_calc_random: ; 0x0209DD30
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	mov r5, r0
	ldrh r0, [r1, #0x26]
	ldrh r1, [r5, #6]
	mov r4, r2
	bl _s32_div_f
	cmp r1, #0
	addne sp, sp, #4
	ldmneia sp!, {r4, r5, lr}
	bxne lr
	ldr r2, _0209DDEC ; =spl_rndm_seed
	ldr r0, _0209DDF0 ; =0x5EEDF715
	ldr r3, [r2]
	ldr r1, _0209DDF4 ; =0x1B0CB173
	mla ip, r3, r0, r1
	str ip, [r2]
	ldrsh lr, [r5]
	mov r3, ip, lsr #0x17
	ldr ip, [r4]
	mul r3, lr, r3
	sub r3, r3, lr, lsl #8
	add r3, ip, r3, asr #8
	str r3, [r4]
	ldr r3, [r2]
	mla ip, r3, r0, r1
	str ip, [r2]
	ldrsh lr, [r5, #2]
	mov r3, ip, lsr #0x17
	ldr ip, [r4, #4]
	mul r3, lr, r3
	sub r3, r3, lr, lsl #8
	add r3, ip, r3, asr #8
	str r3, [r4, #4]
	ldr r3, [r2]
	mla r0, r3, r0, r1
	str r0, [r2]
	ldrsh r2, [r5, #4]
	mov r0, r0, lsr #0x17
	ldr r1, [r4, #8]
	mul r0, r2, r0
	sub r0, r0, r2, lsl #8
	add r0, r1, r0, asr #8
	str r0, [r4, #8]
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	.align 2, 0
_0209DDEC: .word spl_rndm_seed
_0209DDF0: .word 0x5EEDF715
_0209DDF4: .word 0x1B0CB173
	arm_func_end spl_calc_random

	arm_func_start spl_calc_gravity
spl_calc_gravity: ; 0x0209DDF8
	ldrsh r1, [r0]
	ldr r3, [r2]
	add r1, r3, r1
	str r1, [r2]
	ldrsh r1, [r0, #2]
	ldr r3, [r2, #4]
	add r1, r3, r1
	str r1, [r2, #4]
	ldrsh r0, [r0, #4]
	ldr r1, [r2, #8]
	add r0, r1, r0
	str r0, [r2, #8]
	bx lr
	arm_func_end spl_calc_gravity

	arm_func_start spl_del
spl_del: ; 0x0209DE2C
	ldr r3, [r1]
	cmp r3, #0
	bne _0209DE6C
	ldr r2, [r0]
	cmp r2, r1
	moveq r2, #0
	streq r2, [r0]
	streq r2, [r0, #8]
	beq _0209DE98
	ldr r2, [r1, #4]
	mov r3, #0
	str r3, [r2]
	ldr r2, [r0, #8]
	ldr r2, [r2, #4]
	str r2, [r0, #8]
	b _0209DE98
_0209DE6C:
	ldr r2, [r0]
	cmp r2, r1
	streq r3, [r0]
	ldreq r2, [r0]
	moveq r3, #0
	streq r3, [r2, #4]
	ldrne r2, [r1, #4]
	strne r2, [r3, #4]
	ldrne r3, [r1]
	ldrne r2, [r1, #4]
	strne r3, [r2]
_0209DE98:
	ldr r2, [r0, #4]
	sub r2, r2, #1
	str r2, [r0, #4]
	mov r0, r1
	bx lr
	arm_func_end spl_del

	arm_func_start spl_pop_front
spl_pop_front: ; 0x0209DEAC
	ldr r2, [r0]
	mov r3, #0
	mov ip, r3
	cmp r2, #0
	beq _0209DEF0
	ldr r1, [r2]
	mov ip, r2
	str r1, [r0]
	ldr r1, [r0]
	cmp r1, #0
	ldrne r1, [r2]
	strne r3, [r1, #4]
	streq r3, [r0]
	streq r3, [r0, #8]
	ldr r1, [r0, #4]
	sub r1, r1, #1
	str r1, [r0, #4]
_0209DEF0:
	mov r0, ip
	bx lr
	arm_func_end spl_pop_front

	arm_func_start spl_push_front
spl_push_front: ; 0x0209DEF8
	ldr r2, [r0]
	cmp r2, #0
	bne _0209DF20
	str r1, [r0]
	str r1, [r0, #8]
	mov r2, #0
	str r2, [r1]
	ldr r2, [r1]
	str r2, [r1, #4]
	b _0209DF38
_0209DF20:
	str r2, [r1]
	mov r2, #0
	str r2, [r1, #4]
	ldr r2, [r0]
	str r1, [r2, #4]
	str r1, [r0]
_0209DF38:
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	bx lr
	arm_func_end spl_push_front

	arm_func_start spl_rndm_get_arb_vec_xy
spl_rndm_get_arb_vec_xy: ; 0x0209DF48
	stmdb sp!, {r4, lr}
	ldr ip, _0209DF98 ; =spl_rndm_seed
	ldr r2, _0209DF9C ; =0x5EEDF715
	ldr r4, [ip]
	ldr r3, _0209DFA0 ; =0x1B0CB173
	mov r1, r0
	mla lr, r4, r2, r3
	str lr, [ip]
	mov r4, lr, asr #8
	str r4, [r0]
	ldr r4, [ip]
	mov lr, #0
	mla r2, r4, r2, r3
	str r2, [ip]
	mov r2, r2, asr #8
	str r2, [r0, #4]
	str lr, [r0, #8]
	bl VEC_Normalize
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0209DF98: .word spl_rndm_seed
_0209DF9C: .word 0x5EEDF715
_0209DFA0: .word 0x1B0CB173
	arm_func_end spl_rndm_get_arb_vec_xy

	arm_func_start spl_rndm_get_arb_vec_xyz
spl_rndm_get_arb_vec_xyz: ; 0x0209DFA4
	stmdb sp!, {r4, lr}
	ldr ip, _0209E000 ; =spl_rndm_seed
	ldr r2, _0209E004 ; =0x5EEDF715
	ldr r4, [ip]
	ldr r3, _0209E008 ; =0x1B0CB173
	mov r1, r0
	mla lr, r4, r2, r3
	str lr, [ip]
	mov r4, lr, asr #8
	str r4, [r0]
	ldr lr, [ip]
	mla r4, lr, r2, r3
	str r4, [ip]
	mov lr, r4, asr #8
	str lr, [r0, #4]
	ldr lr, [ip]
	mla r2, lr, r2, r3
	str r2, [ip]
	mov r2, r2, asr #8
	str r2, [r0, #8]
	bl VEC_Normalize
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0209E000: .word spl_rndm_seed
_0209E004: .word 0x5EEDF715
_0209E008: .word 0x1B0CB173
	arm_func_end spl_rndm_get_arb_vec_xyz

	.data

_021105DC:
	.word drawXYPlane
	.word drawXZPlane
_021105E4:
	.word rotTypeY
	.word rotTypeXYZ
_021105EC:
	.short 0, 0x1000, 0
	.balign 4, 0
