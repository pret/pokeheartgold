	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F6888:
	.byte 0x00, 0x07, 0x01, 0x05, 0x03, 0x06, 0x01, 0x08
	.byte 0x05, 0x06, 0x03, 0x07, 0x05, 0x09, 0x06, 0x07, 0x03, 0x08, 0x06, 0x0A, 0x07, 0x08, 0x03, 0x09
	.byte 0x07, 0x02, 0x08, 0x09, 0x03, 0x0A, 0x08, 0x00, 0x09, 0x0A, 0x03, 0x02, 0x09, 0x01, 0x0A, 0x02
	.byte 0x03, 0x00, 0x0A, 0x05, 0x02, 0x00, 0x03, 0x01, 0x02, 0x06, 0x00, 0x01, 0x03, 0x05, 0x00, 0x02
	.byte 0x05, 0x07, 0x03, 0x09

	.text

	thumb_func_start sub_0202F574
sub_0202F574: ; 0x0202F574
	ldr r0, _0202F578 ; =0x000005FC
	bx lr
	.balign 4, 0
_0202F578: .word 0x000005FC
	thumb_func_end sub_0202F574

	thumb_func_start sub_0202F57C
sub_0202F57C: ; 0x0202F57C
	ldr r3, _0202F584 ; =SavArray_get
	mov r1, #0x23
	bx r3
	nop
_0202F584: .word SavArray_get
	thumb_func_end sub_0202F57C

	thumb_func_start sub_0202F588
sub_0202F588: ; 0x0202F588
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r6, #0xba
	str r0, [sp]
	add r5, r0, #0
	add r7, r4, #0
	lsl r6, r6, #2
_0202F596:
	mov r2, #0xba
	add r0, r5, #0
	add r1, r7, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	add r4, r4, #1
	add r5, r5, r6
	cmp r4, #2
	blt _0202F596
	mov r1, #0x5d
	ldr r0, [sp]
	lsl r1, r1, #4
	add r0, r0, r1
	bl sub_0202FA08
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202F588

	thumb_func_start sub_0202F5B8
sub_0202F5B8: ; 0x0202F5B8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, r1, #0
	mov r1, #0xa
	mov r6, #0
	bl _u32_div_f
	mov r0, #6
	ldr r2, _0202F5F4 ; =_020F6888
	mul r0, r1
	add r4, r2, r0
	add r5, r7, #0
_0202F5D0:
	ldrb r1, [r4]
	add r0, r5, #0
	bl sub_0202F9E8
	add r6, r6, #1
	add r4, r4, #1
	add r5, #0x7a
	cmp r6, #6
	blt _0202F5D0
	mov r0, #0xb7
	lsl r0, r0, #2
	add r0, r7, r0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202F5F4: .word _020F6888
	thumb_func_end sub_0202F5B8

	thumb_func_start sub_0202F5F8
sub_0202F5F8: ; 0x0202F5F8
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #2
	blt _0202F606
	bl GF_AssertFail
	mov r1, #0
_0202F606:
	ldr r3, _0202F61C ; =0x000005F9
	lsl r1, r1, #0x18
	ldrb r0, [r4, r3]
	lsr r1, r1, #0x18
	mov r2, #0xc0
	lsl r1, r1, #0x1e
	bic r0, r2
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r4, r3]
	pop {r4, pc}
	.balign 4, 0
_0202F61C: .word 0x000005F9
	thumb_func_end sub_0202F5F8

	thumb_func_start sub_0202F620
sub_0202F620: ; 0x0202F620
	ldr r1, _0202F62C ; =0x000005F9
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	bx lr
	nop
_0202F62C: .word 0x000005F9
	thumb_func_end sub_0202F620

	thumb_func_start sub_0202F630
sub_0202F630: ; 0x0202F630
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #3
	bne _0202F640
	ldr r0, _0202F654 ; =0x000005F9
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x1e
_0202F640:
	cmp r1, #2
	blt _0202F64A
	bl GF_AssertFail
	mov r1, #0
_0202F64A:
	mov r0, #0xba
	lsl r0, r0, #2
	mul r0, r1
	add r0, r4, r0
	pop {r4, pc}
	.balign 4, 0
_0202F654: .word 0x000005F9
	thumb_func_end sub_0202F630

	thumb_func_start sub_0202F658
sub_0202F658: ; 0x0202F658
	push {r4, lr}
	add r4, r2, #0
	cmp r1, #2
	blt _0202F66C
	bl GF_AssertFail
	add r0, r4, #0
	bl sub_0202F9CC
	pop {r4, pc}
_0202F66C:
	mov r2, #0xba
	add r3, r1, #0
	lsl r2, r2, #2
	mul r3, r2
	add r0, r0, r3
	add r1, r4, #0
	bl MI_CpuCopy8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202F658

	thumb_func_start sub_0202F680
sub_0202F680: ; 0x0202F680
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #2
	blt _0202F68E
	bl GF_AssertFail
	pop {r4, pc}
_0202F68E:
	add r0, r2, #0
	mov r2, #0xba
	lsl r2, r2, #2
	add r3, r1, #0
	mul r3, r2
	add r1, r4, r3
	bl MI_CpuCopy8
	pop {r4, pc}
	thumb_func_end sub_0202F680

	thumb_func_start sub_0202F6A0
sub_0202F6A0: ; 0x0202F6A0
	ldr r2, _0202F6A8 ; =0x000005F8
	strb r1, [r0, r2]
	bx lr
	nop
_0202F6A8: .word 0x000005F8
	thumb_func_end sub_0202F6A0

	thumb_func_start sub_0202F6AC
sub_0202F6AC: ; 0x0202F6AC
	ldr r1, _0202F6B4 ; =0x000005F8
	ldrb r0, [r0, r1]
	bx lr
	nop
_0202F6B4: .word 0x000005F8
	thumb_func_end sub_0202F6AC

	thumb_func_start sub_0202F6B8
sub_0202F6B8: ; 0x0202F6B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r1, #0
	str r0, [sp]
	cmp r7, #0
	ble _0202F71C
	mov r4, #0
	add r0, sp, #8
	add r1, r4, #0
	mov r2, #6
	bl MI_CpuFill8
	add r0, r4, #0
	ldr r5, [sp]
	str r0, [sp, #4]
_0202F6D6:
	ldrb r6, [r5]
	lsl r2, r4, #0x18
	add r1, sp, #8
	add r0, r6, #0
	lsr r2, r2, #0x18
	bl sub_0202FA3C
	cmp r0, #0
	bne _0202F710
	ldr r0, [sp]
	mov r1, #0xb7
	add r0, r0, r6
	lsl r1, r1, #2
	ldrb r1, [r0, r1]
	add r1, r7, r1
	cmp r1, #0xff
	bge _0202F702
	mov r1, #0xb7
	lsl r1, r1, #2
	ldrb r1, [r0, r1]
	add r2, r1, r7
	b _0202F704
_0202F702:
	mov r2, #0xff
_0202F704:
	mov r1, #0xb7
	lsl r1, r1, #2
	strb r2, [r0, r1]
	add r0, sp, #8
	strb r6, [r0, r4]
	add r4, r4, #1
_0202F710:
	ldr r0, [sp, #4]
	add r5, #0x7a
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #6
	blt _0202F6D6
_0202F71C:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202F6B8

	thumb_func_start sub_0202F720
sub_0202F720: ; 0x0202F720
	ldr r1, _0202F72C ; =0x000005F9
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	bx lr
	nop
_0202F72C: .word 0x000005F9
	thumb_func_end sub_0202F720

	thumb_func_start sub_0202F730
sub_0202F730: ; 0x0202F730
	push {r4, lr}
	ldr r2, _0202F750 ; =0x000005F9
	add r4, r0, #0
	ldrb r2, [r4, r2]
	lsl r2, r2, #0x1a
	lsr r2, r2, #0x1a
	add r1, r2, r1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_0202F754
	ldr r0, _0202F750 ; =0x000005F9
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	pop {r4, pc}
	.balign 4, 0
_0202F750: .word 0x000005F9
	thumb_func_end sub_0202F730

	thumb_func_start sub_0202F754
sub_0202F754: ; 0x0202F754
	push {r3, r4}
	cmp r1, #4
	bls _0202F76C
	ldr r2, _0202F780 ; =0x000005F9
	mov r1, #0x3f
	ldrb r3, [r0, r2]
	bic r3, r1
	mov r1, #4
	orr r1, r3
	strb r1, [r0, r2]
	pop {r3, r4}
	bx lr
_0202F76C:
	ldr r3, _0202F780 ; =0x000005F9
	mov r2, #0x3f
	ldrb r4, [r0, r3]
	bic r4, r2
	mov r2, #0x3f
	and r1, r2
	orr r1, r4
	strb r1, [r0, r3]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0202F780: .word 0x000005F9
	thumb_func_end sub_0202F754

	thumb_func_start sub_0202F784
sub_0202F784: ; 0x0202F784
	ldrh r2, [r1]
	ldrb r3, [r1, #2]
	mov r1, #0x3c
	mul r1, r2
	add r2, r3, r1
	ldr r1, _0202F794 ; =0x000005FA
	strh r2, [r0, r1]
	bx lr
	.balign 4, 0
_0202F794: .word 0x000005FA
	thumb_func_end sub_0202F784

	thumb_func_start sub_0202F798
sub_0202F798: ; 0x0202F798
	push {r4, r5}
	ldrb r5, [r1, #2]
	ldrh r1, [r1]
	mov r4, #0x3c
	add r3, r1, #0
	mul r3, r4
	add r1, r5, r3
	ldr r3, _0202F7D0 ; =0x000005FA
	lsl r1, r1, #0x10
	ldrh r0, [r0, r3]
	lsr r1, r1, #0x10
	sub r3, r1, r0
	add r0, r2, #0
	mul r0, r4
	cmp r3, r0
	blt _0202F7BE
	mov r0, #1
	pop {r4, r5}
	bx lr
_0202F7BE:
	ldr r0, _0202F7D4 ; =0x0000EA5F
	cmp r1, r0
	blo _0202F7CA
	mov r0, #2
	pop {r4, r5}
	bx lr
_0202F7CA:
	mov r0, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
_0202F7D0: .word 0x000005FA
_0202F7D4: .word 0x0000EA5F
	thumb_func_end sub_0202F798

	thumb_func_start sub_0202F7D8
sub_0202F7D8: ; 0x0202F7D8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x5d
	lsl r0, r0, #4
	add r5, r1, #0
	add r4, r6, r0
	add r0, r5, #0
	add r7, r2, #0
	bl PlayerProfile_GetTrainerID
	str r0, [r4, #0x14]
	add r0, r5, #0
	bl PlayerProfile_GetTrainerGender
	strb r0, [r4, #0x11]
	add r0, r5, #0
	bl PlayerProfile_GetLanguage
	strb r0, [r4, #0x12]
	add r0, r5, #0
	bl PlayerProfile_GetVersion
	strb r0, [r4, #0x13]
	mov r0, #0x10
	add r1, r7, #0
	bl String_ctor
	add r7, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl PlayerName_FlatToString
	add r1, r4, #0
	add r0, r7, #0
	add r1, #0x18
	mov r2, #0x10
	bl CopyStringToU16Array
	add r0, r7, #0
	bl String_dtor
	mov r0, #1
	strb r0, [r4, #0x10]
	bl GF_RTC_DateTimeToSec
	mov r2, #0x5d
	lsl r2, r2, #4
	str r0, [r6, r2]
	str r1, [r4, #4]
	bl OS_GetOwnerRtcOffset
	str r0, [r4, #8]
	str r1, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202F7D8

	thumb_func_start sub_0202F844
sub_0202F844: ; 0x0202F844
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x5d
	lsl r1, r1, #4
	add r5, r0, r1
	ldr r1, [r5, #0x14]
	add r0, r4, #0
	bl PlayerProfile_SetTrainerID
	ldrb r1, [r5, #0x11]
	add r0, r4, #0
	bl PlayerProfile_SetTrainerGender
	ldrb r1, [r5, #0x12]
	add r0, r4, #0
	bl PlayerProfile_SetLanguage
	ldrb r1, [r5, #0x13]
	add r0, r4, #0
	bl PlayerProfile_SetVersion
	add r5, #0x18
	add r0, r4, #0
	add r1, r5, #0
	bl Sav2_Profile_PlayerName_set
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202F844

	thumb_func_start sub_0202F87C
sub_0202F87C: ; 0x0202F87C
	ldr r1, _0202F884 ; =0x000005E1
	ldrb r0, [r0, r1]
	bx lr
	nop
_0202F884: .word 0x000005E1
	thumb_func_end sub_0202F87C

	thumb_func_start sub_0202F888
sub_0202F888: ; 0x0202F888
	mov r1, #0x5e
	lsl r1, r1, #4
	ldrb r0, [r0, r1]
	bx lr
	thumb_func_end sub_0202F888

	thumb_func_start sub_0202F890
sub_0202F890: ; 0x0202F890
	push {r4, lr}
	mov r1, #0x5d
	lsl r1, r1, #4
	add r4, r0, r1
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	beq _0202F8CE
	bl GF_RTC_DateTimeToSec
	ldr r3, [r4]
	ldr r2, [r4, #4]
	sub r3, r0, r3
	sbc r1, r2
	mov r2, #0
	ldr r0, _0202F8D0 ; =0x00015180
	sub r0, r0, r3
	sbc r2, r1
	bge _0202F8BA
	mov r0, #0
	strb r0, [r4, #0x10]
	pop {r4, pc}
_0202F8BA:
	bl OS_GetOwnerRtcOffset
	ldr r3, [r4, #8]
	ldr r2, [r4, #0xc]
	eor r0, r3
	eor r1, r2
	orr r0, r1
	beq _0202F8CE
	mov r0, #0
	strb r0, [r4, #0x10]
_0202F8CE:
	pop {r4, pc}
	.balign 4, 0
_0202F8D0: .word 0x00015180
	thumb_func_end sub_0202F890

	thumb_func_start sub_0202F8D4
sub_0202F8D4: ; 0x0202F8D4
	push {r4, r5, r6}
	sub sp, #0x7c
	mov r4, #0x7a
	add r3, r1, #0
	mul r3, r4
	add r1, r0, r3
	add r6, r1, #0
	add r5, sp, #0
_0202F8E4:
	ldrb r3, [r6]
	add r6, r6, #1
	strb r3, [r5]
	add r5, r5, #1
	sub r4, r4, #1
	bne _0202F8E4
	mov r3, #0x7a
	add r4, r2, #0
	mul r4, r3
	add r4, r0, r4
	add r2, r4, #0
_0202F8FA:
	ldrb r0, [r2]
	add r2, r2, #1
	strb r0, [r1]
	add r1, r1, #1
	sub r3, r3, #1
	bne _0202F8FA
	add r2, sp, #0
	mov r1, #0x7a
_0202F90A:
	ldrb r0, [r2]
	add r2, r2, #1
	strb r0, [r4]
	add r4, r4, #1
	sub r1, r1, #1
	bne _0202F90A
	add sp, #0x7c
	pop {r4, r5, r6}
	bx lr
	thumb_func_end sub_0202F8D4

	thumb_func_start sub_0202F91C
sub_0202F91C: ; 0x0202F91C
	mov r3, #0x7a
	mul r3, r1
	add r0, r0, r3
	lsl r1, r2, #0x18
	ldr r3, _0202F92C ; =sub_0202F9E8
	lsr r1, r1, #0x18
	bx r3
	nop
_0202F92C: .word sub_0202F9E8
	thumb_func_end sub_0202F91C

	thumb_func_start sub_0202F930
sub_0202F930: ; 0x0202F930
	push {r3, lr}
	cmp r1, #6
	blt _0202F93C
	bl GF_AssertFail
	pop {r3, pc}
_0202F93C:
	mov r3, #0x7a
	mul r3, r1
	add r3, r0, r3
	ldrb r1, [r3, #1]
	cmp r1, #0x1e
	blo _0202F94E
	bl GF_AssertFail
	pop {r3, pc}
_0202F94E:
	add r0, r1, #1
	strb r0, [r3, #1]
	lsl r0, r1, #2
	add r1, r3, r0
	ldrb r0, [r2]
	strb r0, [r1, #2]
	ldrb r0, [r2, #1]
	strb r0, [r1, #3]
	ldrb r0, [r2, #2]
	strb r0, [r1, #4]
	ldrb r0, [r2, #3]
	strb r0, [r1, #5]
	pop {r3, pc}
	thumb_func_end sub_0202F930

	thumb_func_start sub_0202F968
sub_0202F968: ; 0x0202F968
	push {r4, lr}
	cmp r1, #6
	blt _0202F974
	bl GF_AssertFail
	pop {r4, pc}
_0202F974:
	mov r3, #0x7a
	mul r3, r1
	add r0, r0, r3
	ldrb r1, [r0, #1]
	cmp r2, r1
	blo _0202F986
	bl GF_AssertFail
	pop {r4, pc}
_0202F986:
	sub r1, r1, #1
	strb r1, [r0, #1]
	ldrb r4, [r0, #1]
	cmp r2, r4
	bne _0202F99C
	add r1, r0, #2
	lsl r0, r2, #2
	add r0, r1, r0
	bl sub_0202F9FC
	pop {r4, pc}
_0202F99C:
	cmp r2, r4
	bge _0202F9BE
	lsl r1, r2, #2
	add r3, r0, r1
_0202F9A4:
	ldrb r1, [r3, #6]
	add r2, r2, #1
	strb r1, [r3, #2]
	ldrb r1, [r3, #7]
	strb r1, [r3, #3]
	ldrb r1, [r3, #8]
	strb r1, [r3, #4]
	ldrb r1, [r3, #9]
	strb r1, [r3, #5]
	ldrb r4, [r0, #1]
	add r3, r3, #4
	cmp r2, r4
	blt _0202F9A4
_0202F9BE:
	add r1, r0, #2
	lsl r0, r4, #2
	add r0, r1, r0
	bl sub_0202F9FC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202F968

	thumb_func_start sub_0202F9CC
sub_0202F9CC: ; 0x0202F9CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0202F9D2:
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0202F9E8
	add r4, r4, #1
	add r5, #0x7a
	cmp r4, #6
	blt _0202F9D2
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202F9CC

	thumb_func_start sub_0202F9E8
sub_0202F9E8: ; 0x0202F9E8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0
	mov r2, #0x7a
	add r5, r0, #0
	bl MI_CpuFill8
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202F9E8

	thumb_func_start sub_0202F9FC
sub_0202F9FC: ; 0x0202F9FC
	ldr r3, _0202FA04 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #4
	bx r3
	.balign 4, 0
_0202FA04: .word MI_CpuFill8
	thumb_func_end sub_0202F9FC

	thumb_func_start sub_0202FA08
sub_0202FA08: ; 0x0202FA08
	push {r4, lr}
	mov r1, #0
	mov r2, #0x28
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	str r0, [r4, #0x14]
	strb r0, [r4, #0x11]
	ldr r0, _0202FA34 ; =gGameLanguage
	mov r1, #8
	ldrb r0, [r0]
	strb r0, [r4, #0x12]
	ldr r0, _0202FA38 ; =gGameVersion
	ldrb r0, [r0]
	strb r0, [r4, #0x13]
	add r4, #0x18
	add r0, r4, #0
	bl StringFillEOS
	pop {r4, pc}
	nop
_0202FA34: .word gGameLanguage
_0202FA38: .word gGameVersion
	thumb_func_end sub_0202FA08

	thumb_func_start sub_0202FA3C
sub_0202FA3C: ; 0x0202FA3C
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	ble _0202FA56
_0202FA44:
	ldrb r3, [r1, r4]
	cmp r0, r3
	bne _0202FA50
	mov r0, #1
	pop {r3, r4}
	bx lr
_0202FA50:
	add r4, r4, #1
	cmp r4, r2
	blt _0202FA44
_0202FA56:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end sub_0202FA3C
