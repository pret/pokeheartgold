	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02055418
sub_02055418: ; 0x02055418
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_SysInfo_RTC_get
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0205544A
	add r0, sp, #0xc
	add r1, sp, #0
	bl GF_RTC_CopyDateTime
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0xc
	bl sub_02055450
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0xc
	add r3, sp, #0
	bl sub_02055478
_0205544A:
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02055418

	thumb_func_start sub_02055450
sub_02055450: ; 0x02055450
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r0, r2, #0
	bl RTC_ConvertDateToDay
	ldr r1, [r5, #0x20]
	add r4, r0, #0
	cmp r4, r1
	bhs _02055468
	str r4, [r5, #0x20]
	pop {r4, r5, r6, pc}
_02055468:
	cmp r4, r1
	bls _02055476
	add r0, r6, #0
	sub r1, r4, r1
	bl sub_02055508
	str r4, [r5, #0x20]
_02055476:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02055450

	thumb_func_start sub_02055478
sub_02055478: ; 0x02055478
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r2, #0
	str r0, [sp]
	add r6, r3, #0
	add r5, r1, #0
	add r0, r4, #0
	add r1, r6, #0
	bl RTC_ConvertDateTimeToSecond
	str r1, [sp, #8]
	add r1, r5, #0
	add r7, r0, #0
	add r0, r5, #4
	add r1, #0x14
	bl RTC_ConvertDateTimeToSecond
	sub r2, r7, r0
	ldr r2, [sp, #8]
	sbc r2, r1
	bge _020554BA
	add r2, r5, #4
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r6!, {r0, r1}
	add r5, #0x14
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add sp, #0x10
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_020554BA:
	sub r0, r7, r0
	str r0, [sp, #0xc]
	cmp r0, #0
	ble _020554D0
	ldr r0, [sp]
	bl sub_02092DEC
	ldr r2, [sp, #8]
	add r1, r7, #0
	bl sub_02092F30
_020554D0:
	ldr r0, [sp, #0xc]
	mov r1, #0x3c
	bl _s32_div_f
	add r7, r0, #0
	cmp r7, #0
	ble _02055504
	add r0, r5, #0
	add r1, r7, #0
	bl sub_02028E2C
	ldr r0, [sp]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_020555B4
	add r2, r5, #4
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r6!, {r0, r1}
	add r5, #0x14
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	str r0, [r5]
_02055504:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02055478

	thumb_func_start sub_02055508
sub_02055508: ; 0x02055508
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02055670
	add r6, r0, #0
	add r0, r5, #0
	bl ClearDailyFlags
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	bl sub_0206759C
	ldr r0, [r5, #0xc]
	bl sub_0202C854
	add r1, r4, #0
	bl sub_0202C78C
	ldr r0, [r5, #0xc]
	bl sub_0202D9C4
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0202C854
	bl sub_0202C7DC
	add r1, r0, #0
	add r0, r7, #0
	bl sub_0202D9A0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl Party_UpdatePokerus
	lsl r1, r4, #0x10
	ldr r0, [r5, #0xc]
	lsr r1, r1, #0x10
	bl sub_02066D10
	ldr r0, [r5, #0xc]
	bl sub_02066D60
	ldr r0, [r5, #0xc]
	bl sub_020674BC
	ldr r0, [r5, #0xc]
	bl sub_0202CA44
	bl sub_0202CB6C
	add r0, r5, #0
	bl sub_020556B8
	ldr r0, [r5, #0xc]
	bl sub_0202ED88
	add r1, r4, #0
	bl sub_0202F294
	cmp r6, #0
	bne _0205559E
	ldr r0, [r5, #0xc]
	bl sub_02031B14
	add r1, r4, #0
	bl sub_02031CCC
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	bl sub_0209730C
_0205559E:
	ldr r0, [r5, #0xc]
	bl sub_02031968
	bl sub_02031AE4
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl sub_02066E94
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02055508

	thumb_func_start sub_020555B4
sub_020555B4: ; 0x020555B4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	bl sub_02092DEC
	add r1, r4, #0
	mov r2, #0
	bl sub_02092E34
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0206DB34
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	add r2, r6, #0
	bl Party_TryResetShaymin
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020555B4

	thumb_func_start sub_020555E0
sub_020555E0: ; 0x020555E0
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl Sav2_SysInfo_RTC_get
	ldr r0, [r0, #0x14]
	bl GF_RTC_GetTimeOfDayByHour
	pop {r3, pc}
	thumb_func_end sub_020555E0

	thumb_func_start sub_020555F0
sub_020555F0: ; 0x020555F0
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl Sav2_SysInfo_RTC_get
	ldr r0, [r0, #0x14]
	bl sub_0201485C
	pop {r3, pc}
	thumb_func_end sub_020555F0

	thumb_func_start sub_02055600
sub_02055600: ; 0x02055600
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl Sav2_SysInfo_RTC_get
	ldr r0, [r0, #8]
	pop {r3, pc}
	thumb_func_end sub_02055600

	thumb_func_start sub_0205560C
sub_0205560C: ; 0x0205560C
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl Sav2_SysInfo_RTC_get
	ldr r0, [r0, #0xc]
	pop {r3, pc}
	thumb_func_end sub_0205560C

	thumb_func_start sub_02055618
sub_02055618: ; 0x02055618
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl Sav2_SysInfo_RTC_get
	ldr r0, [r0, #0x14]
	pop {r3, pc}
	thumb_func_end sub_02055618

	thumb_func_start sub_02055624
sub_02055624: ; 0x02055624
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0xc]
	add r5, r1, #0
	add r4, r2, #0
	bl Sav2_SysInfo_RTC_get
	add r3, r0, #0
	ldr r2, [r3, #0x24]
	ldr r3, [r3, #0x28]
	add r0, r5, #0
	add r1, r4, #0
	bl RTC_ConvertSecondToDateTime
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02055624

	thumb_func_start sub_02055640
sub_02055640: ; 0x02055640
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0xc]
	add r5, r1, #0
	add r4, r2, #0
	bl Sav2_SysInfo_RTC_get
	add r3, r0, #0
	ldr r2, [r3, #0x2c]
	ldr r3, [r3, #0x30]
	add r0, r5, #0
	add r1, r4, #0
	bl RTC_ConvertSecondToDateTime
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02055640

	thumb_func_start sub_0205565C
sub_0205565C: ; 0x0205565C
	push {r4, lr}
	ldr r0, [r0, #0xc]
	bl Sav2_SysInfo_RTC_get
	add r4, r0, #0
	bl GF_RTC_DateTimeToSec
	str r0, [r4, #0x2c]
	str r1, [r4, #0x30]
	pop {r4, pc}
	thumb_func_end sub_0205565C

	thumb_func_start sub_02055670
sub_02055670: ; 0x02055670
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl Sav2_SysInfo_RTC_get
	bl sub_02028E1C
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02055670

	thumb_func_start sub_02055680
sub_02055680: ; 0x02055680
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0x60
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x60
	bl MI_CpuFill8
	add r0, r5, #0
	add r1, r4, #0
	str r6, [r4]
	bl sub_020556C8
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02055680

	thumb_func_start sub_020556A8
sub_020556A8: ; 0x020556A8
	push {r4, lr}
	add r4, r0, #0
	bl sub_020556FC
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_020556A8

	thumb_func_start sub_020556B8
sub_020556B8: ; 0x020556B8
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl sub_0202A96C
	bl sub_0202AE74
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020556B8

	thumb_func_start sub_020556C8
sub_020556C8: ; 0x020556C8
	push {r3, r4, r5, lr}
	ldr r4, [r0, #0x44]
	add r5, r1, #0
	add r0, r4, #0
	mov r1, #0x1f
	bl ov01_021F149C
	add r1, r0, #0
	ldr r0, [r5]
	bl AllocFromHeap
	str r0, [r5, #0x5c]
	ldr r2, [r5, #0x5c]
	add r0, r4, #0
	mov r1, #0x1f
	bl ov01_021F14A8
	add r1, r5, #0
	add r0, r5, #4
	add r5, #0x5c
	add r1, #0x58
	add r2, r5, #0
	bl sub_0201F51C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020556C8

	thumb_func_start sub_020556FC
sub_020556FC: ; 0x020556FC
	ldr r3, _02055704 ; =ov01_021F1448
	ldr r0, [r0, #0x5c]
	bx r3
	nop
_02055704: .word ov01_021F1448
	thumb_func_end sub_020556FC

	thumb_func_start sub_02055708
sub_02055708: ; 0x02055708
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bne _02055714
	mov r0, #0
	pop {r3, r4, r5, pc}
_02055714:
	add r0, r4, #0
	bl sub_0205F25C
	ldr r1, _0205575C ; =0x00000107
	cmp r0, r1
	beq _02055748
	add r2, r1, #1
	cmp r0, r2
	beq _02055748
	add r2, r1, #2
	cmp r0, r2
	beq _02055748
	add r2, r1, #3
	cmp r0, r2
	beq _02055748
	add r2, r1, #4
	cmp r0, r2
	beq _02055748
	add r2, r1, #5
	cmp r0, r2
	beq _02055748
	add r1, r1, #6
	cmp r0, r1
	beq _02055748
	mov r0, #0
	pop {r3, r4, r5, pc}
_02055748:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02055780
	cmp r0, #1
	bne _02055758
	mov r0, #1
	pop {r3, r4, r5, pc}
_02055758:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0205575C: .word 0x00000107
	thumb_func_end sub_02055708

	thumb_func_start sub_02055760
sub_02055760: ; 0x02055760
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0xc]
	add r5, r1, #0
	bl sub_0202A96C
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F2F4
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0202AE68
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02055760

	thumb_func_start sub_02055780
sub_02055780: ; 0x02055780
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0xc]
	add r5, r1, #0
	bl sub_0202A96C
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F2F4
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0202AE38
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02055780

	thumb_func_start sub_020557A0
sub_020557A0: ; 0x020557A0
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0xc]
	add r5, r1, #0
	bl sub_0202A96C
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F2F4
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0202AE40
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020557A0

	thumb_func_start sub_020557C0
sub_020557C0: ; 0x020557C0
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0xc]
	add r5, r1, #0
	bl sub_0202A96C
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F2F4
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0202AE4C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020557C0
