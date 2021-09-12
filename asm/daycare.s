	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start Sav2_Daycare_sizeof
Sav2_Daycare_sizeof: ; 0x020292A8
	mov r0, #0x1e
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end Sav2_Daycare_sizeof

	thumb_func_start Sav2_Daycare_init
Sav2_Daycare_init: ; 0x020292B0
	push {r4, lr}
	mov r2, #0x1e
	add r4, r0, #0
	mov r1, #0
	lsl r2, r2, #4
	bl memset
	add r0, r4, #0
	bl ZeroBoxMonData
	add r0, r4, #0
	add r0, #0xec
	bl ZeroBoxMonData
	mov r0, #0x76
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r0, #4
	strb r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end Sav2_Daycare_init

	thumb_func_start Sav2_DayCare_GetMonX
Sav2_DayCare_GetMonX: ; 0x020292DC
	mov r2, #0xec
	mul r2, r1
	add r0, r0, r2
	bx lr
	thumb_func_end Sav2_DayCare_GetMonX

	thumb_func_start DayCareMon_GetBoxMon
DayCareMon_GetBoxMon: ; 0x020292E4
	bx lr
	.balign 4, 0
	thumb_func_end DayCareMon_GetBoxMon

	thumb_func_start DayCareMon_GetExtras
DayCareMon_GetExtras: ; 0x020292E8
	add r0, #0x88
	bx lr
	thumb_func_end DayCareMon_GetExtras

	thumb_func_start DayCareMon_GetSteps
DayCareMon_GetSteps: ; 0x020292EC
	add r0, #0xe8
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end DayCareMon_GetSteps

	thumb_func_start DayCareMail_GetCapsule
DayCareMail_GetCapsule: ; 0x020292F4
	bx lr
	.balign 4, 0
	thumb_func_end DayCareMail_GetCapsule

	thumb_func_start Sav2_DayCare_HasEgg
Sav2_DayCare_HasEgg: ; 0x020292F8
	mov r1, #0x76
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02029306
	mov r0, #1
	bx lr
_02029306:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end Sav2_DayCare_HasEgg

	thumb_func_start Sav2_DayCare_GetEggPID
Sav2_DayCare_GetEggPID: ; 0x0202930C
	mov r1, #0x76
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end Sav2_DayCare_GetEggPID

	thumb_func_start Sav2_DayCare_GetEggCycleCounter
Sav2_DayCare_GetEggCycleCounter: ; 0x02029314
	mov r1, #0x77
	lsl r1, r1, #2
	ldrb r0, [r0, r1]
	bx lr
	thumb_func_end Sav2_DayCare_GetEggCycleCounter

	thumb_func_start DayCareMon_SetSteps
DayCareMon_SetSteps: ; 0x0202931C
	add r0, #0xe8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end DayCareMon_SetSteps

	thumb_func_start DayCareMon_AddSteps
DayCareMon_AddSteps: ; 0x02029324
	add r2, r0, #0
	add r2, #0xe8
	ldr r2, [r2]
	add r0, #0xe8
	add r1, r2, r1
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end DayCareMon_AddSteps

	thumb_func_start Sav2_DayCare_SetEggPID
Sav2_DayCare_SetEggPID: ; 0x02029334
	mov r2, #0x76
	lsl r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end Sav2_DayCare_SetEggPID

	thumb_func_start Sav2_DayCare_SetEggCycleCounter
Sav2_DayCare_SetEggCycleCounter: ; 0x0202933C
	mov r2, #0x77
	lsl r2, r2, #2
	strb r1, [r0, r2]
	bx lr
	thumb_func_end Sav2_DayCare_SetEggCycleCounter

	thumb_func_start Sav2_DayCare_MasudaCheck
Sav2_DayCare_MasudaCheck: ; 0x02029344
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0xc
	mov r2, #0
	bl GetBoxMonData
	add r5, #0xec
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0xc
	mov r2, #0
	bl GetBoxMonData
	cmp r4, r0
	beq _02029366
	mov r0, #1
	pop {r3, r4, r5, pc}
_02029366:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end Sav2_DayCare_MasudaCheck

	thumb_func_start DayCareMon_Copy
DayCareMon_Copy: ; 0x0202936C
	push {r3, r4}
	add r4, r0, #0
	add r3, r1, #0
	mov r2, #0x1d
_02029374:
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r2, r2, #1
	bne _02029374
	ldr r0, [r3]
	str r0, [r4]
	pop {r3, r4}
	bx lr
	thumb_func_end DayCareMon_Copy

	thumb_func_start DayCareMon_Extras_init
DayCareMon_Extras_init: ; 0x02029384
	push {r3, r4}
	mov r1, #0
	add r2, r0, #0
	add r4, r1, #0
_0202938C:
	add r1, r1, #1
	strh r4, [r2, #0x38]
	add r2, r2, #2
	cmp r1, #8
	blt _0202938C
	add r3, r0, #0
	mov r2, #0
_0202939A:
	add r1, r3, #0
	add r1, #0x48
	add r4, r4, #1
	add r3, r3, #2
	strh r2, [r1]
	cmp r4, #0xb
	blt _0202939A
	ldr r1, _020293B4 ; =0x0000FFFF
	strh r1, [r0, #0x38]
	add r0, #0x48
	strh r1, [r0]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_020293B4: .word 0x0000FFFF
	thumb_func_end DayCareMon_Extras_init

	thumb_func_start DayCareMon_init
DayCareMon_init: ; 0x020293B8
	push {r4, lr}
	add r4, r0, #0
	bl ZeroBoxMonData
	add r0, r4, #0
	mov r1, #0
	add r0, #0xe8
	add r4, #0x88
	str r1, [r0]
	add r0, r4, #0
	bl DayCareMon_Extras_init
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end DayCareMon_init

	thumb_func_start Sav2_DayCare_get
Sav2_DayCare_get: ; 0x020293D4
	ldr r3, _020293DC ; =SavArray_get
	mov r1, #7
	bx r3
	nop
_020293DC: .word SavArray_get
	thumb_func_end Sav2_DayCare_get
