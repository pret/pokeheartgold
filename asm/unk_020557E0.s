	.include "asm/macros.inc"
	.include "unk_020557E0.inc"
	.include "global.inc"

	.bss

_021D4178:
	.space 0x4C

	.text

	thumb_func_start sub_020557E0
sub_020557E0: ; 0x020557E0
	mov r2, #0
	ldr r3, _020557F4 ; =_021D4178
	add r1, r2, #0
_020557E6:
	add r0, r3, r2
	add r0, #0x30
	add r2, r2, #1
	strb r1, [r0]
	cmp r2, #6
	blt _020557E6
	bx lr
	.balign 4, 0
_020557F4: .word _021D4178
	thumb_func_end sub_020557E0

	thumb_func_start sub_020557F8
sub_020557F8: ; 0x020557F8
	push {r4, lr}
	ldr r1, _02055820 ; =_021D4178
	add r4, r0, #0
	mov r0, #0
	mov r2, #0x4c
	bl MIi_CpuClearFast
	ldr r1, _02055820 ; =_021D4178
	add r0, r4, #0
	bl sub_0205592C
	ldr r0, _02055820 ; =_021D4178
	bl sub_020559D0
	bl GF_RTC_DateTimeToSec
	ldr r2, _02055824 ; =_021D4178
	str r0, [r2, #0x40]
	str r1, [r2, #0x44]
	pop {r4, pc}
	.balign 4, 0
_02055820: .word _021D4178
_02055824: .word _021D4178
	thumb_func_end sub_020557F8

	thumb_func_start sub_02055828
sub_02055828: ; 0x02055828
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0xc]
	ldr r4, _0205586C ; =_021D4178
	bl Sav2_GameStats_get
	add r5, r0, #0
	bl GF_RTC_DateTimeToSec
	add r3, r1, #0
	ldr r1, _02055870 ; =_021D4178
	add r2, r0, #0
	ldr r0, [r1, #0x40]
	ldr r1, [r1, #0x44]
	bl GF_RTC_TimeDelta
	mov r2, #0xfa
	mov r3, #0
	lsl r2, r2, #2
	sub r2, r0, r2
	sbc r1, r3
	bge _0205585C
	mov r1, #0xfa
	lsl r1, r1, #2
	sub r0, r1, r0
	lsl r0, r0, #1
	b _0205585E
_0205585C:
	mov r0, #0
_0205585E:
	str r0, [r4, #0x48]
	add r0, r5, #0
	mov r1, #0x11
	bl GameStats_AddSpecial
	pop {r3, r4, r5, pc}
	nop
_0205586C: .word _021D4178
_02055870: .word _021D4178
	thumb_func_end sub_02055828

	thumb_func_start sub_02055874
sub_02055874: ; 0x02055874
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _02055898 ; =_021D4178
	add r4, r1, #0
	add r6, r2, #0
	bl sub_020559E8
	cmp r0, #1
	bne _02055894
	ldr r1, _02055898 ; =_021D4178
	add r0, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_02055A48
	pop {r4, r5, r6, pc}
_02055894:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02055898: .word _021D4178
	thumb_func_end sub_02055874

	thumb_func_start sub_0205589C
sub_0205589C: ; 0x0205589C
	ldr r3, _020558A4 ; =sub_02055B1C
	ldr r1, _020558A8 ; =_021D4178
	bx r3
	nop
_020558A4: .word sub_02055B1C
_020558A8: .word _021D4178
	thumb_func_end sub_0205589C

	thumb_func_start sub_020558AC
sub_020558AC: ; 0x020558AC
	ldr r3, _020558B4 ; =sub_02055AF4
	ldr r2, _020558B8 ; =_021D4178
	bx r3
	nop
_020558B4: .word sub_02055AF4
_020558B8: .word _021D4178
	thumb_func_end sub_020558AC

	thumb_func_start sub_020558BC
sub_020558BC: ; 0x020558BC
	push {r3, lr}
	ldr r0, _020558CC ; =_021D4178
	bl sub_020559B4
	mov r1, #6
	sub r0, r1, r0
	pop {r3, pc}
	nop
_020558CC: .word _021D4178
	thumb_func_end sub_020558BC

	thumb_func_start sub_020558D0
sub_020558D0: ; 0x020558D0
	ldr r3, _020558D8 ; =sub_02055B68
	ldr r0, _020558DC ; =_021D4178
	bx r3
	nop
_020558D8: .word sub_02055B68
_020558DC: .word _021D4178
	thumb_func_end sub_020558D0

	thumb_func_start sub_020558E0
sub_020558E0: ; 0x020558E0
	ldr r3, _020558E8 ; =sub_02055BEC
	ldr r0, _020558EC ; =_021D4178
	bx r3
	nop
_020558E8: .word sub_02055BEC
_020558EC: .word _021D4178
	thumb_func_end sub_020558E0

	thumb_func_start sub_020558F0
sub_020558F0: ; 0x020558F0
	ldr r3, _020558F8 ; =sub_02055B7C
	ldr r0, _020558FC ; =_021D4178
	bx r3
	nop
_020558F8: .word sub_02055B7C
_020558FC: .word _021D4178
	thumb_func_end sub_020558F0

	thumb_func_start sub_02055900
sub_02055900: ; 0x02055900
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	beq _02055910
	ldr r0, _02055928 ; =0x000001ED
	cmp r5, r0
	bls _02055914
_02055910:
	bl GF_AssertFail
_02055914:
	mov r3, #6
	add r0, r4, #0
	sub r4, r5, #1
	str r3, [sp]
	mov r1, #0x7d
	mov r2, #0
	mul r3, r4
	bl ReadFromNarcMemberByIdPair
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02055928: .word 0x000001ED
	thumb_func_end sub_02055900

	thumb_func_start sub_0205592C
sub_0205592C: ; 0x0205592C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r0, [r0, #0xc]
	str r1, [sp]
	bl sub_020270F8
	str r0, [sp, #4]
	mov r0, #4
	bl AllocMonZeroed
	ldr r5, [sp]
	add r4, r0, #0
	mov r6, #0
	add r7, sp, #8
_02055948:
	ldr r0, [sp]
	add r2, r4, #0
	add r1, r0, r6
	add r1, #0x30
	mov r0, #0
	strb r0, [r1]
	ldr r0, [sp, #4]
	add r1, r6, #0
	bl sub_0202EC70
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	strh r0, [r5]
	add r1, sp, #8
	bl sub_02055900
	ldrb r0, [r7]
	cmp r0, #0
	beq _0205597A
	b _0205597E
_0205597A:
	ldrb r0, [r7, #1]
	add r0, r0, #4
_0205597E:
	strb r0, [r5, #2]
	ldrb r0, [r7, #3]
	mov r1, #0xb1
	mov r2, #0
	strb r0, [r5, #3]
	ldrb r0, [r7, #2]
	strh r0, [r5, #4]
	add r0, r4, #0
	bl GetMonData
	strb r0, [r5, #6]
	add r0, r4, #0
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	strb r0, [r5, #7]
	add r6, r6, #1
	add r5, #8
	cmp r6, #6
	blt _02055948
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205592C

	thumb_func_start sub_020559B4
sub_020559B4: ; 0x020559B4
	mov r3, #0
	add r2, r3, #0
_020559B8:
	add r1, r0, r2
	add r1, #0x30
	ldrb r1, [r1]
	cmp r1, #0
	beq _020559C4
	add r3, r3, #1
_020559C4:
	add r2, r2, #1
	cmp r2, #6
	blt _020559B8
	add r0, r3, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_020559B4

	thumb_func_start sub_020559D0
sub_020559D0: ; 0x020559D0
	push {r4, lr}
	add r4, r0, #0
	bl LCRandom
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	add r0, r0, #5
	str r0, [r4, #0x38]
	pop {r4, pc}
	thumb_func_end sub_020559D0

	thumb_func_start sub_020559E8
sub_020559E8: ; 0x020559E8
	push {r3, lr}
	ldr r1, [r0, #0x38]
	sub r1, r1, #1
	str r1, [r0, #0x38]
	bne _020559FA
	bl sub_020559D0
	mov r0, #1
	pop {r3, pc}
_020559FA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020559E8

	thumb_func_start sub_02055A00
sub_02055A00: ; 0x02055A00
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r2, #0
	bl GetMetatileBehaviorAt
	add r4, r0, #0
	cmp r5, #0x20
	blt _02055A14
	mov r5, #1
	b _02055A16
_02055A14:
	mov r5, #0
_02055A16:
	cmp r6, #0x20
	bge _02055A1E
	mov r0, #0
	b _02055A20
_02055A1E:
	mov r0, #2
_02055A20:
	add r5, r5, r0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6E8
	cmp r0, #0
	beq _02055A32
	add r0, r5, #1
	pop {r4, r5, r6, pc}
_02055A32:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B778
	cmp r0, #0
	beq _02055A42
	add r0, r5, #5
	pop {r4, r5, r6, pc}
_02055A42:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02055A00

	thumb_func_start sub_02055A48
sub_02055A48: ; 0x02055A48
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	mov r6, #0
	bl sub_02055A00
	add r4, r0, #0
	bne _02055A5E
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_02055A5E:
	add r0, r6, #0
	add r1, r5, #0
_02055A62:
	add r2, r5, r0
	add r2, #0x30
	ldrb r2, [r2]
	cmp r2, #0
	bne _02055A76
	ldrb r2, [r1, #2]
	cmp r4, r2
	bne _02055A76
	ldrb r2, [r1, #3]
	add r6, r6, r2
_02055A76:
	add r0, r0, #1
	add r1, #8
	cmp r0, #6
	blt _02055A62
	cmp r6, #0
	bne _02055A86
	mov r0, #0
	pop {r4, r5, r6, pc}
_02055A86:
	add r0, r6, #0
	add r0, #0x14
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _02055A94
	bl GF_AssertFail
_02055A94:
	add r0, r6, #0
	add r0, #0x14
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bhi _02055AA4
	mov r0, #0
	b _02055AB6
_02055AA4:
	bl LCRandom
	add r6, #0x14
	lsl r1, r6, #0x10
	lsr r1, r1, #0x10
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
_02055AB6:
	cmp r0, #0x14
	bge _02055ABE
	mov r0, #0
	pop {r4, r5, r6, pc}
_02055ABE:
	sub r0, #0x14
	mov r2, #0
	add r1, r5, #0
_02055AC4:
	add r3, r5, r2
	add r3, #0x30
	ldrb r3, [r3]
	cmp r3, #0
	bne _02055AE2
	ldrb r3, [r1, #2]
	cmp r4, r3
	bne _02055AE2
	ldrb r3, [r1, #3]
	cmp r0, r3
	bge _02055AE0
	str r2, [r5, #0x3c]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02055AE0:
	sub r0, r0, r3
_02055AE2:
	add r2, r2, #1
	add r1, #8
	cmp r2, #6
	blt _02055AC4
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02055A48

	thumb_func_start sub_02055AF4
sub_02055AF4: ; 0x02055AF4
	push {r4, lr}
	ldr r0, [r1, #0x14]
	add r4, r2, #0
	cmp r0, #4
	beq _02055B04
	cmp r0, #5
	beq _02055B1A
	b _02055B16
_02055B04:
	add r0, r4, #0
	bl sub_020559B4
	add r1, r0, #1
	ldr r0, [r4, #0x3c]
	add r0, r4, r0
	add r0, #0x30
	strb r1, [r0]
	pop {r4, pc}
_02055B16:
	bl GF_AssertFail
_02055B1A:
	pop {r4, pc}
	thumb_func_end sub_02055AF4

	thumb_func_start sub_02055B1C
sub_02055B1C: ; 0x02055B1C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x20
	add r6, r1, #0
	bl AllocMonZeroed
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_020270F8
	str r0, [sp]
	add r0, r5, #0
	bl sub_020558BC
	add r1, r0, #0
	mov r0, #0xb
	bl sub_02051A98
	add r1, r5, #0
	add r7, r0, #0
	bl BattleSetup_InitFromFsys
	ldr r0, [sp]
	ldr r1, [r6, #0x3c]
	add r2, r4, #0
	bl sub_0202EC70
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #1
	bl sub_02051C9C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02055B1C

	thumb_func_start sub_02055B68
sub_02055B68: ; 0x02055B68
	mov r3, #0
	add r2, r3, #0
_02055B6C:
	ldrh r1, [r0, #4]
	add r2, r2, #1
	add r0, #8
	add r3, r3, r1
	cmp r2, #6
	blt _02055B6C
	add r0, r3, #0
	bx lr
	thumb_func_end sub_02055B68

	thumb_func_start sub_02055B7C
sub_02055B7C: ; 0x02055B7C
	push {r4, r5, r6, r7}
	mov r3, #0
	add r5, r0, #0
	add r4, r3, #0
	mov r0, #1
_02055B86:
	mov r1, #0
_02055B88:
	add r2, r5, r1
	add r2, #0x30
	ldrb r2, [r2]
	cmp r0, r2
	bne _02055BC8
	lsl r1, r1, #3
	add r2, r5, r1
	ldrb r1, [r2, #6]
	ldrb r2, [r2, #7]
	cmp r0, #1
	beq _02055BB4
	mov r6, ip
	cmp r6, r1
	beq _02055BB4
	mov r6, ip
	cmp r6, r2
	beq _02055BB4
	cmp r7, r1
	beq _02055BB4
	cmp r7, r2
	beq _02055BB4
	add r4, #0xc8
_02055BB4:
	mov r6, #1
	mov ip, r1
	lsl r6, r1
	add r1, r3, #0
	mov r3, #1
	lsl r3, r2
	orr r1, r6
	add r7, r2, #0
	orr r3, r1
	b _02055BCE
_02055BC8:
	add r1, r1, #1
	cmp r1, #6
	blt _02055B88
_02055BCE:
	add r0, r0, #1
	cmp r0, #7
	blt _02055B86
	cmp r3, #0
	beq _02055BE6
	mov r0, #1
_02055BDA:
	add r1, r3, #0
	tst r1, r0
	beq _02055BE2
	add r4, #0x32
_02055BE2:
	lsr r3, r3, #1
	bne _02055BDA
_02055BE6:
	add r0, r4, #0
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end sub_02055B7C

	thumb_func_start sub_02055BEC
sub_02055BEC: ; 0x02055BEC
	ldr r0, [r0, #0x48]
	bx lr
	thumb_func_end sub_02055BEC
