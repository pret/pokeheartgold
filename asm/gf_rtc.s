	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D1048:
	.space 0x58

	.text

	thumb_func_start GF_InitRTCWork
GF_InitRTCWork: ; 0x02014634
	push {r3, lr}
	bl RTC_Init
	mov r0, #0
	ldr r3, _02014664 ; =_021D1048
	add r1, r0, #0
	mov r2, #5
_02014642:
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02014642
	stmia r3!, {r0, r1}
	ldr r0, _02014668 ; =_021D1048
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r0, _02014664 ; =_021D1048
	bl GF_RTC_GetDateTime
	ldr r0, _02014664 ; =_021D1048
	bl sub_02014700
	pop {r3, pc}
	.balign 4, 0
_02014664: .word _021D1048
_02014668: .word _021D1048
	thumb_func_end GF_InitRTCWork

	thumb_func_start GF_RTC_UpdateOnFrame
GF_RTC_UpdateOnFrame: ; 0x0201466C
	push {r3, lr}
	ldr r0, _0201468C ; =_021D1048
	ldr r1, [r0, #4]
	cmp r1, #0
	bne _0201468A
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	cmp r1, #0xa
	ble _0201468A
	mov r1, #0
	str r1, [r0, #8]
	ldr r0, _02014690 ; =_021D1048
	bl GF_RTC_GetDateTime
_0201468A:
	pop {r3, pc}
	.balign 4, 0
_0201468C: .word _021D1048
_02014690: .word _021D1048
	thumb_func_end GF_RTC_UpdateOnFrame

	thumb_func_start GF_RTC_GetDateTime_Callback
GF_RTC_GetDateTime_Callback: ; 0x02014694
	push {r4, lr}
	add r4, r1, #0
	str r0, [r4, #0xc]
	cmp r0, #0
	beq _020146A2
	bl GF_AssertFail
_020146A2:
	add r3, r4, #0
	mov r0, #1
	add r2, r4, #0
	add r3, #0x2c
	str r0, [r4]
	ldmia r3!, {r0, r1}
	add r2, #0x10
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r3, r4, #0
	add r3, #0x3c
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x20
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #0
	str r0, [r4, #4]
	pop {r4, pc}
	thumb_func_end GF_RTC_GetDateTime_Callback

	thumb_func_start GF_RTC_GetDateTime
GF_RTC_GetDateTime: ; 0x020146CC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	str r0, [r4, #4]
	add r0, r4, #0
	add r1, r4, #0
	ldr r2, _020146F0 ; =GF_RTC_GetDateTime_Callback
	add r0, #0x2c
	add r1, #0x3c
	add r3, r4, #0
	bl RTC_GetDateTimeAsync
	str r0, [r4, #0xc]
	cmp r0, #0
	beq _020146EE
	bl GF_AssertFail
_020146EE:
	pop {r4, pc}
	.balign 4, 0
_020146F0: .word GF_RTC_GetDateTime_Callback
	thumb_func_end GF_RTC_GetDateTime

	thumb_func_start sub_020146F4
sub_020146F4: ; 0x020146F4
	mov r3, #3
	str r3, [r0, #0x48]
	str r1, [r0, #0x4c]
	str r2, [r0, #0x50]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020146F4

	thumb_func_start sub_02014700
sub_02014700: ; 0x02014700
	mov r1, #0
	str r1, [r0, #0x48]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02014700

	thumb_func_start GF_RTC_CopyDateTime
GF_RTC_CopyDateTime: ; 0x02014708
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0201473C ; =_021D1048
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #1
	beq _0201471A
	bl GF_AssertFail
_0201471A:
	ldr r2, _02014740 ; =_021D1048 + 0x10
	ldmia r2!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, _0201473C ; =_021D1048
	ldr r0, [r0, #0x48]
	cmp r0, #3
	bne _02014730
	ldr r2, _02014744 ; =_021D1048 + 0x4C
	b _02014732
_02014730:
	ldr r2, _02014748 ; =_021D1048 + 0x20
_02014732:
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0201473C: .word _021D1048
_02014740: .word _021D1048 + 0x10
_02014744: .word _021D1048 + 0x4C
_02014748: .word _021D1048 + 0x20
	thumb_func_end GF_RTC_CopyDateTime

	thumb_func_start GF_RTC_CopyTime
GF_RTC_CopyTime: ; 0x0201474C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02014774 ; =_021D1048
	ldr r0, [r0]
	cmp r0, #1
	beq _0201475C
	bl GF_AssertFail
_0201475C:
	ldr r0, _02014774 ; =_021D1048
	ldr r0, [r0, #0x48]
	cmp r0, #3
	bne _02014768
	ldr r2, _02014778 ; =_021D1048 + 0x4C
	b _0201476A
_02014768:
	ldr r2, _0201477C ; =_021D1048 + 0x20
_0201476A:
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_02014774: .word _021D1048
_02014778: .word _021D1048 + 0x4C
_0201477C: .word _021D1048 + 0x20
	thumb_func_end GF_RTC_CopyTime

	thumb_func_start GF_RTC_CopyDate
GF_RTC_CopyDate: ; 0x02014780
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0201479C ; =_021D1048
	ldr r0, [r0]
	cmp r0, #1
	beq _02014790
	bl GF_AssertFail
_02014790:
	ldr r2, _020147A0 ; =_021D1048 + 0x10
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	pop {r4, pc}
	.balign 4, 0
_0201479C: .word _021D1048
_020147A0: .word _021D1048 + 0x10
	thumb_func_end GF_RTC_CopyDate

	thumb_func_start GF_RTC_TimeToSec
GF_RTC_TimeToSec: ; 0x020147A4
	push {r3, r4}
	ldr r0, _020147D0 ; =_021D1048
	ldr r0, [r0, #0x48]
	cmp r0, #3
	bne _020147B2
	ldr r4, _020147D4 ; =_021D1048 + 0x4C
	b _020147B4
_020147B2:
	ldr r4, _020147D8 ; =_021D1048 + 0x20
_020147B4:
	ldr r1, [r4, #4]
	mov r0, #0x3c
	add r2, r1, #0
	mul r2, r0
	mov r0, #0xe1
	ldr r1, [r4]
	lsl r0, r0, #4
	mul r0, r1
	ldr r3, [r4, #8]
	add r0, r2, r0
	add r0, r3, r0
	pop {r3, r4}
	bx lr
	nop
_020147D0: .word _021D1048
_020147D4: .word _021D1048 + 0x4C
_020147D8: .word _021D1048 + 0x20
	thumb_func_end GF_RTC_TimeToSec

	thumb_func_start GF_RTC_DateTimeToSec
GF_RTC_DateTimeToSec: ; 0x020147DC
	ldr r0, _020147F0 ; =_021D1048
	ldr r0, [r0, #0x48]
	cmp r0, #3
	bne _020147E8
	ldr r1, _020147F4 ; =_021D1048 + 0x4C
	b _020147EA
_020147E8:
	ldr r1, _020147F8 ; =_021D1048 + 0x20
_020147EA:
	ldr r3, _020147FC ; =RTC_ConvertDateTimeToSecond
	ldr r0, _02014800 ; =_021D1048 + 0x10
	bx r3
	.balign 4, 0
_020147F0: .word _021D1048
_020147F4: .word _021D1048 + 0x4C
_020147F8: .word _021D1048 + 0x20
_020147FC: .word RTC_ConvertDateTimeToSecond
_02014800: .word _021D1048 + 0x10
	thumb_func_end GF_RTC_DateTimeToSec

	thumb_func_start IsNighttime
IsNighttime: ; 0x02014804
	push {r3, lr}
	bl GF_RTC_GetTimeOfDay
	cmp r0, #3
	beq _02014812
	cmp r0, #4
	bne _02014816
_02014812:
	mov r0, #1
	pop {r3, pc}
_02014816:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end IsNighttime

	thumb_func_start GF_RTC_GetTimeOfDay
GF_RTC_GetTimeOfDay: ; 0x0201481C
	push {lr}
	sub sp, #0xc
	add r0, sp, #0
	bl GF_RTC_CopyTime
	ldr r0, [sp]
	bl GF_RTC_GetTimeOfDayByHour
	add sp, #0xc
	pop {pc}
	thumb_func_end GF_RTC_GetTimeOfDay

	thumb_func_start sub_02014830
sub_02014830: ; 0x02014830
	push {lr}
	sub sp, #0xc
	add r0, sp, #0
	bl GF_RTC_CopyTime
	ldr r0, [sp]
	bl sub_0201485C
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02014830

	thumb_func_start GF_RTC_GetTimeOfDayByHour
GF_RTC_GetTimeOfDayByHour: ; 0x02014844
	push {r4, lr}
	add r4, r0, #0
	bmi _0201484E
	cmp r4, #0x18
	blt _02014852
_0201484E:
	bl GF_AssertFail
_02014852:
	ldr r0, _02014858 ; =0x020F6060
	ldrb r0, [r0, r4]
	pop {r4, pc}
	.balign 4, 0
_02014858: .word 0x020F6060
	thumb_func_end GF_RTC_GetTimeOfDayByHour

	thumb_func_start sub_0201485C
sub_0201485C: ; 0x0201485C
	push {r3, lr}
	bl GF_RTC_GetTimeOfDayByHour
	cmp r0, #0
	beq _02014870
	cmp r0, #1
	beq _02014874
	cmp r0, #2
	beq _02014874
	b _02014878
_02014870:
	mov r0, #0
	pop {r3, pc}
_02014874:
	mov r0, #1
	pop {r3, pc}
_02014878:
	mov r0, #2
	pop {r3, pc}
	thumb_func_end sub_0201485C

	thumb_func_start GF_RTC_TimeDelta
GF_RTC_TimeDelta: ; 0x0201487C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r6, r3, #0
	ldr r3, _020148E8 ; =0x020F6038
	add r4, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	add r2, sp, #0x14
	ldmia r3!, {r0, r1}
	str r2, [sp]
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r3, _020148EC ; =0x020F602C
	add r2, sp, #8
	ldmia r3!, {r0, r1}
	str r2, [sp, #4]
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r1, [sp, #4]
	str r0, [r2]
	ldr r0, [sp]
	bl RTC_ConvertDateTimeToSecond
	add r2, r1, #0
	add r3, r0, #0
	mov r1, #0
	ldr r0, _020148F0 ; =0xBC19137F
	eor r1, r2
	eor r0, r3
	orr r0, r1
	beq _020148C0
	bl GF_AssertFail
_020148C0:
	sub r0, r4, r5
	mov ip, r7
	mov r0, ip
	sbc r0, r6
	bge _020148D4
	sub r0, r5, r4
	sbc r6, r7
	add sp, #0x24
	add r1, r6, #0
	pop {r4, r5, r6, r7, pc}
_020148D4:
	ldr r0, _020148F0 ; =0xBC19137F
	mov r1, #0
	sub r0, r0, r4
	sbc r1, r7
	add r0, r5, r0
	adc r6, r1
	add r1, r6, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_020148E8: .word 0x020F6038
_020148EC: .word 0x020F602C
_020148F0: .word 0xBC19137F
	thumb_func_end GF_RTC_TimeDelta

	thumb_func_start sub_020148F4
sub_020148F4: ; 0x020148F4
	ldr r3, _020148FC ; =sub_02014700
	ldr r0, _02014900 ; =_021D1048
	bx r3
	nop
_020148FC: .word sub_02014700
_02014900: .word _021D1048
	thumb_func_end sub_020148F4

	thumb_func_start sub_02014904
sub_02014904: ; 0x02014904
	add r3, r0, #0
	add r2, r1, #0
	add r1, r3, #0
	ldr r3, _02014910 ; =sub_020146F4
	ldr r0, _02014914 ; =_021D1048
	bx r3
	.balign 4, 0
_02014910: .word sub_020146F4
_02014914: .word _021D1048
	thumb_func_end sub_02014904
