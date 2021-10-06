	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start Sav2_SysInfo_sizeof
Sav2_SysInfo_sizeof: ; 0x02028D14
	mov r0, #0x5c
	bx lr
	thumb_func_end Sav2_SysInfo_sizeof

	thumb_func_start Sav2_SysInfo_init
Sav2_SysInfo_init: ; 0x02028D18
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x5c
	bl MIi_CpuClearFast
	add r4, #0x10
	add r0, r4, #0
	bl Sav2_SysInfo_RTC_init
	pop {r4, pc}
	thumb_func_end Sav2_SysInfo_init

	thumb_func_start Sav2_SysInfo_get
Sav2_SysInfo_get: ; 0x02028D30
	ldr r3, _02028D38 ; =SavArray_get
	mov r1, #0
	bx r3
	nop
_02028D38: .word SavArray_get
	thumb_func_end Sav2_SysInfo_get

	thumb_func_start Sav2_SysInfo_RTC_get
Sav2_SysInfo_RTC_get: ; 0x02028D3C
	push {r3, lr}
	bl Sav2_SysInfo_get
	add r0, #0x10
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end Sav2_SysInfo_RTC_get

	thumb_func_start Sav2_SysInfo_InitFromSystem
Sav2_SysInfo_InitFromSystem: ; 0x02028D48
	push {r3, r4, lr}
	sub sp, #0x54
	add r4, r0, #0
	bl OS_GetOwnerRtcOffset
	str r0, [r4]
	add r0, r4, #0
	add r0, #8
	str r1, [r4, #4]
	bl OS_GetMacAddress
	add r0, sp, #0
	bl OS_GetOwnerInfo
	add r0, sp, #0
	ldrb r1, [r0, #2]
	strb r1, [r4, #0xe]
	ldrb r0, [r0, #3]
	strb r0, [r4, #0xf]
	add sp, #0x54
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end Sav2_SysInfo_InitFromSystem

	thumb_func_start Sav2_SysInfo_MacAddressIsMine
Sav2_SysInfo_MacAddressIsMine: ; 0x02028D74
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, sp, #0
	bl OS_GetMacAddress
	mov r2, #0
	add r3, sp, #0
_02028D84:
	add r0, r4, r2
	ldrb r1, [r3]
	ldrb r0, [r0, #8]
	cmp r1, r0
	beq _02028D94
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_02028D94:
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, #6
	blt _02028D84
	mov r0, #1
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end Sav2_SysInfo_MacAddressIsMine

	thumb_func_start Sav2_SysInfo_RTCOffsetIsMine
Sav2_SysInfo_RTCOffsetIsMine: ; 0x02028DA4
	push {r4, lr}
	add r4, r0, #0
	bl OS_GetOwnerRtcOffset
	ldr r3, [r4]
	ldr r2, [r4, #4]
	eor r0, r3
	eor r1, r2
	orr r0, r1
	bne _02028DBC
	mov r0, #1
	pop {r4, pc}
_02028DBC:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end Sav2_SysInfo_RTCOffsetIsMine

	thumb_func_start Sav2_SysInfo_GetBirthMonth
Sav2_SysInfo_GetBirthMonth: ; 0x02028DC0
	ldrb r0, [r0, #0xe]
	bx lr
	thumb_func_end Sav2_SysInfo_GetBirthMonth

	thumb_func_start Sav2_SysInfo_GetBirthDay
Sav2_SysInfo_GetBirthDay: ; 0x02028DC4
	ldrb r0, [r0, #0xf]
	bx lr
	thumb_func_end Sav2_SysInfo_GetBirthDay

	thumb_func_start sub_02028DC8
sub_02028DC8: ; 0x02028DC8
	add r0, #0x48
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02028DC8

	thumb_func_start sub_02028DD0
sub_02028DD0: ; 0x02028DD0
	add r0, #0x48
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02028DD0

	thumb_func_start sub_02028DD8
sub_02028DD8: ; 0x02028DD8
	ldr r0, [r0, #0x4c]
	bx lr
	thumb_func_end sub_02028DD8

	thumb_func_start sub_02028DDC
sub_02028DDC: ; 0x02028DDC
	ldr r2, [r0, #0x4c]
	cmp r2, #0
	bne _02028DE4
	str r1, [r0, #0x4c]
_02028DE4:
	bx lr
	.balign 4, 0
	thumb_func_end sub_02028DDC

	thumb_func_start Sav2_SysInfo_RTC_init
Sav2_SysInfo_RTC_init: ; 0x02028DE8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	add r1, r4, #0
	str r0, [r4]
	add r0, r4, #4
	add r1, #0x14
	bl GF_RTC_CopyDateTime
	add r0, r4, #4
	bl RTC_ConvertDateToDay
	add r1, r4, #0
	str r0, [r4, #0x20]
	add r0, r4, #4
	add r1, #0x14
	bl RTC_ConvertDateTimeToSecond
	str r0, [r4, #0x24]
	str r1, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end Sav2_SysInfo_RTC_init

	thumb_func_start sub_02028E1C
sub_02028E1C: ; 0x02028E1C
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq _02028E26
	mov r0, #1
	bx lr
_02028E26:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02028E1C

	thumb_func_start sub_02028E2C
sub_02028E2C: ; 0x02028E2C
	mov r2, #0x5a
	ldr r3, [r0, #0x34]
	lsl r2, r2, #4
	cmp r3, r2
	bls _02028E38
	str r2, [r0, #0x34]
_02028E38:
	ldr r2, [r0, #0x34]
	cmp r2, r1
	bhs _02028E44
	mov r1, #0
	str r1, [r0, #0x34]
	bx lr
_02028E44:
	sub r1, r2, r1
	str r1, [r0, #0x34]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02028E2C

	thumb_func_start sub_02028E4C
sub_02028E4C: ; 0x02028E4C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #4
	add r1, r4, #0
	str r0, [r4, #0x34]
	add r0, r4, #4
	add r1, #0x14
	bl GF_RTC_CopyDateTime
	add r0, r4, #4
	bl RTC_ConvertDateToDay
	str r0, [r4, #0x20]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02028E4C
