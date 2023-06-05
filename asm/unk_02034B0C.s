	.include "asm/macros.inc"
	.include "unk_02034B0C.inc"
	.include "global.inc"

	.bss

_021D4134:
	.space 0xC

	.rodata

_020F6A88:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF

	.text

	thumb_func_start sub_02034B0C
sub_02034B0C: ; 0x02034B0C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, _02034BCC ; =_021D4134
	add r7, r1, #0
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _02034BCA
	ldr r1, _02034BD0 ; =0x00000D98
	mov r0, #0xf
	bl AllocFromHeap
	ldr r1, _02034BCC ; =_021D4134
	ldr r2, _02034BD0 ; =0x00000D98
	str r0, [r1, #8]
	mov r1, #0
	bl MI_CpuFill8
	bl sub_020335B4
	add r1, r0, #0
	mov r0, #0xf
	bl AllocFromHeap
	ldr r1, _02034BCC ; =_021D4134
	ldr r2, [r1, #8]
	ldr r1, _02034BD4 ; =0x00000D64
	str r0, [r2, r1]
	bl sub_020335B4
	add r2, r0, #0
	ldr r0, _02034BCC ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _02034BD4 ; =0x00000D64
	ldr r0, [r1, r0]
	mov r1, #0
	bl MI_CpuFill8
	bl sub_020290B4
	add r1, r0, #0
	mov r0, #0xf
	bl AllocFromHeap
	ldr r1, _02034BCC ; =_021D4134
	ldr r2, [r1, #8]
	ldr r1, _02034BD8 ; =0x00000D7C
	str r0, [r2, r1]
	bl sub_020290B4
	add r2, r0, #0
	ldr r0, _02034BCC ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _02034BD8 ; =0x00000D7C
	ldr r0, [r1, r0]
	mov r1, #0
	bl MI_CpuFill8
	mov r0, #0xf
	mov r1, #0x90
	bl AllocFromHeap
	ldr r2, _02034BCC ; =_021D4134
	ldr r1, _02034BDC ; =0x00000D84
	ldr r3, [r2, #8]
	str r0, [r3, r1]
	ldr r6, [r2, #8]
	mov r0, #0x1f
	ldr r5, [r6, r1]
	add r3, r5, #0
	and r3, r0
	mov r0, #0x20
	sub r0, r0, r3
	add r3, r0, r5
	add r0, r1, #4
	str r3, [r6, r0]
	ldr r5, _02034BE0 ; =0x00000333
	ldr r3, [r2, #8]
	sub r0, r1, #4
	str r5, [r3, r0]
	add r0, r1, #0
	ldr r3, [r2, #8]
	sub r0, #0xc
	str r4, [r3, r0]
	ldr r0, [r2, #8]
	sub r1, #0x1c
	add r0, r0, r1
	bl MailMsg_Init
	add r0, r7, #0
	bl sub_02034DF0
	bl WM_GetNextTgid
	ldr r1, _02034BCC ; =_021D4134
	strh r0, [r1]
_02034BCA:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02034BCC: .word _021D4134
_02034BD0: .word 0x00000D98
_02034BD4: .word 0x00000D64
_02034BD8: .word 0x00000D7C
_02034BDC: .word 0x00000D84
_02034BE0: .word 0x00000333
	thumb_func_end sub_02034B0C

	thumb_func_start sub_02034BE4
sub_02034BE4: ; 0x02034BE4
	ldr r0, _02034BF4 ; =_021D4134
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02034BF0
	mov r0, #1
	bx lr
_02034BF0:
	mov r0, #0
	bx lr
	.balign 4, 0
_02034BF4: .word _021D4134
	thumb_func_end sub_02034BE4

	thumb_func_start sub_02034BF8
sub_02034BF8: ; 0x02034BF8
	push {r4, r5}
	mov r5, #0
	cmp r2, #0
	ble _02034C18
_02034C00:
	ldrb r4, [r0]
	ldrb r3, [r1]
	cmp r4, r3
	beq _02034C0E
	mov r0, #0
	pop {r4, r5}
	bx lr
_02034C0E:
	add r5, r5, #1
	add r0, r0, #1
	add r1, r1, #1
	cmp r5, r2
	blt _02034C00
_02034C18:
	mov r0, #1
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02034BF8

	thumb_func_start sub_02034C20
sub_02034C20: ; 0x02034C20
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_0203993C
	add r5, r0, #0
	bl sub_02039954
	add r4, r6, #0
	add r7, r0, #0
	add r4, #0x50
	cmp r5, #0xe
	beq _02034C62
	ldrb r0, [r4, #4]
	bl sub_0203401C
	cmp r0, #0
	beq _02034C4C
	add r0, r5, #0
	bl sub_0203401C
	cmp r0, #0
	bne _02034C62
_02034C4C:
	add r0, r4, #0
	add r0, #0x54
	ldrb r0, [r0]
	cmp r0, #0
	beq _02034C5C
	ldrb r0, [r4, #4]
	cmp r0, #0xa
	beq _02034C88
_02034C5C:
	ldrb r0, [r4, #4]
	cmp r0, r5
	bne _02034C88
_02034C62:
	cmp r5, #0xe
	beq _02034C6C
	ldrb r0, [r4, #5]
	cmp r0, r7
	bne _02034C88
_02034C6C:
	ldr r1, _02034C8C ; =_021D4134
	add r0, r6, #0
	ldr r1, [r1, #8]
	mov r2, #0xc0
	add r1, #0x54
	bl MI_CpuCopy8
	ldr r0, _02034C8C ; =_021D4134
	ldr r1, _02034C90 ; =0x00000D95
	ldr r3, [r0, #8]
	mov r0, #0x40
	ldrb r2, [r3, r1]
	orr r0, r2
	strb r0, [r3, r1]
_02034C88:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02034C8C: .word _021D4134
_02034C90: .word 0x00000D95
	thumb_func_end sub_02034C20

	thumb_func_start sub_02034C94
sub_02034C94: ; 0x02034C94
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02034D50 ; =_021D4134
	ldr r1, _02034D54 ; =0x00000D95
	ldr r3, [r0, #8]
	ldrb r2, [r3, r1]
	add r7, r3, #0
	add r7, #0x54
	lsl r0, r2, #0x19
	lsr r0, r0, #0x1f
	beq _02034D4E
	mov r0, #0x40
	mov r6, #0
	bic r2, r0
	strb r2, [r3, r1]
	add r4, r6, #0
	add r5, r6, #0
_02034CB4:
	ldr r0, _02034D50 ; =_021D4134
	ldr r1, _02034D58 ; =0x00000D44
	ldr r0, [r0, #8]
	add r2, r0, r4
	ldrh r1, [r2, r1]
	cmp r1, #0
	beq _02034CFC
	mov r1, #0x46
	lsl r1, r1, #2
	add r0, r0, r1
	add r0, r0, r5
	add r1, r7, #4
	mov r2, #6
	bl sub_02034BF8
	cmp r0, #0
	beq _02034CFC
	ldr r2, _02034D50 ; =_021D4134
	mov r1, #0x4b
	ldr r3, [r2, #8]
	lsl r0, r6, #1
	add r3, r3, r0
	ldr r0, _02034D58 ; =0x00000D44
	lsl r1, r1, #2
	strh r1, [r3, r0]
	ldr r2, [r2, #8]
	sub r1, #0x18
	add r3, r2, r1
	mov r2, #0xc0
	add r1, r6, #0
	mul r1, r2
	add r0, r7, #0
	add r1, r3, r1
	bl MI_CpuCopy8
	pop {r3, r4, r5, r6, r7, pc}
_02034CFC:
	add r6, r6, #1
	add r4, r4, #2
	add r5, #0xc0
	cmp r6, #0x10
	blt _02034CB4
	ldr r0, _02034D50 ; =_021D4134
	ldr r1, _02034D58 ; =0x00000D44
	ldr r0, [r0, #8]
	mov r3, #0
	add r4, r0, #0
_02034D10:
	ldrh r2, [r4, r1]
	cmp r2, #0
	beq _02034D1E
	add r3, r3, #1
	add r4, r4, #2
	cmp r3, #0x10
	blt _02034D10
_02034D1E:
	cmp r3, #0x10
	bge _02034D4E
	lsl r2, r3, #1
	mov r1, #0x4b
	add r2, r0, r2
	ldr r0, _02034D58 ; =0x00000D44
	lsl r1, r1, #2
	strh r1, [r2, r0]
	ldr r2, _02034D50 ; =_021D4134
	sub r1, #0x18
	ldr r2, [r2, #8]
	add r0, r7, #0
	add r4, r2, r1
	mov r2, #0xc0
	add r1, r3, #0
	mul r1, r2
	add r1, r4, r1
	bl MI_CpuCopy8
	ldr r0, _02034D50 ; =_021D4134
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02034D5C ; =0x00000D74
	strb r2, [r1, r0]
_02034D4E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02034D50: .word _021D4134
_02034D54: .word 0x00000D95
_02034D58: .word 0x00000D44
_02034D5C: .word 0x00000D74
	thumb_func_end sub_02034C94

	thumb_func_start sub_02034D60
sub_02034D60: ; 0x02034D60
	push {r3, lr}
	cmp r1, #0
	beq _02034D6A
	bl OS_Terminate
_02034D6A:
	ldr r0, _02034D74 ; =_021D4134
	mov r1, #2
	str r1, [r0, #4]
	pop {r3, pc}
	nop
_02034D74: .word _021D4134
	thumb_func_end sub_02034D60

	thumb_func_start sub_02034D78
sub_02034D78: ; 0x02034D78
	ldr r0, _02034D84 ; =_021D4134
	mov r1, #0
	str r1, [r0, #4]
	ldr r3, _02034D88 ; =Sys_ClearSleepDisableFlag
	mov r0, #4
	bx r3
	.balign 4, 0
_02034D84: .word _021D4134
_02034D88: .word Sys_ClearSleepDisableFlag
	thumb_func_end sub_02034D78

	thumb_func_start sub_02034D8C
sub_02034D8C: ; 0x02034D8C
	push {r3, lr}
	mov r0, #4
	bl Sys_SetSleepDisableFlag
	ldr r0, _02034DB0 ; =_021D4134
	mov r1, #1
	str r1, [r0, #4]
	ldr r1, _02034DB4 ; =sub_02034D60
	mov r0, #8
	mov r2, #0
	bl WVR_StartUpAsync
	cmp r0, #1
	beq _02034DAC
	bl OS_Terminate
_02034DAC:
	pop {r3, pc}
	nop
_02034DB0: .word _021D4134
_02034DB4: .word sub_02034D60
	thumb_func_end sub_02034D8C

	thumb_func_start sub_02034DB8
sub_02034DB8: ; 0x02034DB8
	ldr r0, _02034DC8 ; =_021D4134
	ldr r0, [r0, #4]
	cmp r0, #2
	bne _02034DC4
	mov r0, #1
	bx lr
_02034DC4:
	mov r0, #0
	bx lr
	.balign 4, 0
_02034DC8: .word _021D4134
	thumb_func_end sub_02034DB8

	thumb_func_start sub_02034DCC
sub_02034DCC: ; 0x02034DCC
	ldr r0, _02034DDC ; =_021D4134
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02034DD8
	mov r0, #1
	bx lr
_02034DD8:
	mov r0, #0
	bx lr
	.balign 4, 0
_02034DDC: .word _021D4134
	thumb_func_end sub_02034DCC

	thumb_func_start sub_02034DE0
sub_02034DE0: ; 0x02034DE0
	ldr r3, _02034DE8 ; =WVR_TerminateAsync
	ldr r0, _02034DEC ; =sub_02034D78
	mov r1, #0
	bx r3
	.balign 4, 0
_02034DE8: .word WVR_TerminateAsync
_02034DEC: .word sub_02034D78
	thumb_func_end sub_02034DE0

	thumb_func_start sub_02034DF0
sub_02034DF0: ; 0x02034DF0
	push {r4, lr}
	ldr r2, _02034E28 ; =_021D4134
	add r1, r0, #0
	mov r0, #0xd7
	ldr r3, [r2, #8]
	mov r4, #0
	lsl r0, r0, #4
	str r4, [r3, r0]
	ldr r2, [r2, #8]
	sub r0, #0xc
	ldr r3, [r2, r0]
	mov r0, #0x1f
	add r2, r3, #0
	and r2, r0
	mov r0, #0x20
	sub r0, r0, r2
	add r0, r3, r0
	bl sub_02033528
	ldr r0, _02034E28 ; =_021D4134
	ldr r1, [r0, #8]
	mov r0, #0x36
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	bl sub_02033234
	pop {r4, pc}
	nop
_02034E28: .word _021D4134
	thumb_func_end sub_02034DF0

	thumb_func_start sub_02034E2C
sub_02034E2C: ; 0x02034E2C
	push {r3, r4, r5, lr}
	mov r4, #0
	ldr r2, _02034E5C ; =_021D4134
	ldr r0, _02034E60 ; =0x00000D44
	add r5, r4, #0
	add r1, r4, #0
_02034E38:
	ldr r3, [r2, #8]
	add r4, r4, #1
	add r3, r3, r5
	add r5, r5, #2
	strh r1, [r3, r0]
	cmp r4, #0x10
	blt _02034E38
	ldr r0, _02034E5C ; =_021D4134
	ldr r2, [r0, #8]
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r2, r0
	mov r2, #3
	lsl r2, r2, #0xa
	bl MI_CpuFill8
	pop {r3, r4, r5, pc}
	nop
_02034E5C: .word _021D4134
_02034E60: .word 0x00000D44
	thumb_func_end sub_02034E2C

	thumb_func_start sub_02034E64
sub_02034E64: ; 0x02034E64
	push {r3, r4}
	ldr r1, _02034E84 ; =_021D4134
	lsl r0, r0, #0x18
	ldr r2, [r1, #8]
	ldr r4, _02034E88 ; =0x00000D95
	lsr r0, r0, #0x18
	ldrb r1, [r2, r4]
	mov r3, #8
	lsl r0, r0, #0x1f
	bic r1, r3
	lsr r0, r0, #0x1c
	orr r0, r1
	strb r0, [r2, r4]
	pop {r3, r4}
	bx lr
	nop
_02034E84: .word _021D4134
_02034E88: .word 0x00000D95
	thumb_func_end sub_02034E64

	thumb_func_start sub_02034E8C
sub_02034E8C: ; 0x02034E8C
	push {r4, r5}
	ldr r1, _02034EE8 ; =_021D4134
	ldr r0, _02034EEC ; =0x00000D74
	ldr r3, [r1, #8]
	mov r2, #0
	strb r2, [r3, r0]
	add r3, r0, #0
	ldr r5, [r1, #8]
	add r3, #0x21
	ldrb r4, [r5, r3]
	mov r3, #1
	bic r4, r3
	add r3, r0, #0
	add r3, #0x21
	strb r4, [r5, r3]
	add r3, r0, #0
	ldr r5, [r1, #8]
	add r3, #0x21
	ldrb r4, [r5, r3]
	mov r3, #4
	bic r4, r3
	add r3, r0, #0
	add r3, #0x21
	strb r4, [r5, r3]
	add r3, r0, #0
	ldr r4, [r1, #8]
	add r3, #0x1e
	strb r2, [r4, r3]
	add r3, r0, #0
	ldr r5, [r1, #8]
	add r3, #0x21
	ldrb r4, [r5, r3]
	mov r3, #0x10
	bic r4, r3
	add r3, r0, #0
	add r3, #0x21
	strb r4, [r5, r3]
	add r3, r0, #0
	ldr r4, [r1, #8]
	add r3, #0x20
	strb r2, [r4, r3]
	ldr r1, [r1, #8]
	add r0, #0x1f
	strb r2, [r1, r0]
	pop {r4, r5}
	bx lr
	.balign 4, 0
_02034EE8: .word _021D4134
_02034EEC: .word 0x00000D74
	thumb_func_end sub_02034E8C

	thumb_func_start sub_02034EF0
sub_02034EF0: ; 0x02034EF0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_02034E8C
	add r0, r5, #0
	bl sub_02034E64
	bl sub_02033A68
	ldr r0, _02034F54 ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _02034F58 ; =0x00000D93
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02034F22
	ldr r0, _02034F5C ; =sub_02036904
	mov r1, #0xe
	bl sub_020337D0
	ldr r0, _02034F54 ; =_021D4134
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02034F58 ; =0x00000D93
	strb r2, [r1, r0]
_02034F22:
	ldr r0, _02034F54 ; =_021D4134
	ldr r3, _02034F60 ; =0x00000D95
	ldr r1, [r0, #8]
	mov r2, #0x20
	ldrb r0, [r1, r3]
	bic r0, r2
	lsl r2, r4, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1a
	orr r0, r2
	strb r0, [r1, r3]
	bl sub_02033298
	cmp r0, #1
	bne _02034F4E
	bl sub_020332C0
	cmp r0, #0
	beq _02034F4E
	mov r0, #1
	pop {r3, r4, r5, pc}
_02034F4E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02034F54: .word _021D4134
_02034F58: .word 0x00000D93
_02034F5C: .word sub_02036904
_02034F60: .word 0x00000D95
	thumb_func_end sub_02034EF0

	thumb_func_start sub_02034F64
sub_02034F64: ; 0x02034F64
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	bl sub_02034E8C
	cmp r4, #0
	beq _02034F76
	bl sub_02034E2C
_02034F76:
	ldr r0, _02034FD4 ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _02034FD8 ; =0x00000D93
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02034F94
	ldr r0, _02034FDC ; =sub_020367A8
	mov r1, #0xe
	bl sub_020337D0
	ldr r0, _02034FD4 ; =_021D4134
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02034FD8 ; =0x00000D93
	strb r2, [r1, r0]
_02034F94:
	bl sub_02033298
	cmp r0, #1
	bne _02034FCC
	ldr r2, _02034FE0 ; =_020F6A88
	add r0, sp, #0
	ldrb r3, [r2]
	add r1, sp, #0
	strb r3, [r0]
	ldrb r3, [r2, #1]
	strb r3, [r0, #1]
	ldrb r3, [r2, #2]
	strb r3, [r0, #2]
	ldrb r3, [r2, #3]
	strb r3, [r0, #3]
	ldrb r3, [r2, #4]
	ldrb r2, [r2, #5]
	strb r3, [r0, #4]
	strb r2, [r0, #5]
	ldr r0, _02034FE4 ; =sub_02034C20
	mov r2, #0
	bl sub_02032C1C
	cmp r0, #0
	beq _02034FCC
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_02034FCC:
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	nop
_02034FD4: .word _021D4134
_02034FD8: .word 0x00000D93
_02034FDC: .word sub_020367A8
_02034FE0: .word _020F6A88
_02034FE4: .word sub_02034C20
	thumb_func_end sub_02034F64

	thumb_func_start sub_02034FE8
sub_02034FE8: ; 0x02034FE8
	push {r3, lr}
	ldr r0, _02035074 ; =_021D4134
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _02034FF6
	mov r0, #1
	pop {r3, pc}
_02034FF6:
	ldr r0, _02035078 ; =0x00000D94
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02035008
	cmp r0, #1
	beq _02035038
	cmp r0, #2
	beq _02035050
	b _0203506E
_02035008:
	bl sub_02033990
	cmp r0, #0
	beq _02035020
	bl sub_02032E24
	ldr r0, _02035074 ; =_021D4134
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02035078 ; =0x00000D94
	strb r2, [r1, r0]
	b _0203506E
_02035020:
	bl sub_0203393C
	cmp r0, #0
	bne _0203506E
	bl sub_02033858
	ldr r0, _02035074 ; =_021D4134
	mov r2, #2
	ldr r1, [r0, #8]
	ldr r0, _02035078 ; =0x00000D94
	strb r2, [r1, r0]
	b _0203506E
_02035038:
	bl sub_0203393C
	cmp r0, #0
	bne _0203506E
	bl sub_02033858
	ldr r0, _02035074 ; =_021D4134
	mov r2, #2
	ldr r1, [r0, #8]
	ldr r0, _02035078 ; =0x00000D94
	strb r2, [r1, r0]
	b _0203506E
_02035050:
	bl sub_02033920
	cmp r0, #0
	beq _0203505C
	mov r0, #1
	pop {r3, pc}
_0203505C:
	bl sub_02033958
	cmp r0, #0
	beq _0203506E
	ldr r0, _02035074 ; =_021D4134
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02035078 ; =0x00000D94
	strb r2, [r1, r0]
_0203506E:
	mov r0, #0
	pop {r3, pc}
	nop
_02035074: .word _021D4134
_02035078: .word 0x00000D94
	thumb_func_end sub_02034FE8

	thumb_func_start sub_0203507C
sub_0203507C: ; 0x0203507C
	push {r3, lr}
	ldr r0, _020350A0 ; =_021D4134
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _0203509A
	ldr r0, _020350A4 ; =0x00000D92
	ldrb r1, [r2, r0]
	cmp r1, #0
	bne _0203509A
	mov r1, #1
	strb r1, [r2, r0]
	bl sub_02033858
	mov r0, #1
	pop {r3, pc}
_0203509A:
	mov r0, #0
	pop {r3, pc}
	nop
_020350A0: .word _021D4134
_020350A4: .word 0x00000D92
	thumb_func_end sub_0203507C

	thumb_func_start sub_020350A8
sub_020350A8: ; 0x020350A8
	push {r3, lr}
	ldr r1, _020350CC ; =_021D4134
	ldr r2, [r1, #8]
	cmp r2, #0
	beq _020350C8
	cmp r0, #0
	ldr r0, _020350D0 ; =0x00000D92
	beq _020350BE
	mov r1, #2
	strb r1, [r2, r0]
	pop {r3, pc}
_020350BE:
	mov r1, #0
	strb r1, [r2, r0]
	mov r0, #1
	bl sub_02034DF0
_020350C8:
	pop {r3, pc}
	nop
_020350CC: .word _021D4134
_020350D0: .word 0x00000D92
	thumb_func_end sub_020350A8

	thumb_func_start sub_020350D4
sub_020350D4: ; 0x020350D4
	push {r3, lr}
	ldr r0, _0203510C ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035110 ; =0x00000D7C
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, _0203510C ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035114 ; =0x00000D64
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, _0203510C ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035118 ; =0x00000D84
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, _0203510C ; =_021D4134
	ldr r0, [r0, #8]
	bl FreeToHeap
	ldr r0, _0203510C ; =_021D4134
	mov r1, #0
	str r1, [r0, #8]
	pop {r3, pc}
	nop
_0203510C: .word _021D4134
_02035110: .word 0x00000D7C
_02035114: .word 0x00000D64
_02035118: .word 0x00000D84
	thumb_func_end sub_020350D4

	thumb_func_start sub_0203511C
sub_0203511C: ; 0x0203511C
	push {r4, lr}
	bl sub_02037474
	cmp r0, #0
	bne _0203512A
	mov r0, #0
	pop {r4, pc}
_0203512A:
	ldr r1, _02035148 ; =_021D4134
	mov r0, #0
	ldr r4, [r1, #8]
	ldr r1, _0203514C ; =0x00000D44
	add r3, r0, #0
_02035134:
	ldrh r2, [r4, r1]
	cmp r2, #0
	beq _0203513C
	add r0, r0, #1
_0203513C:
	add r3, r3, #1
	add r4, r4, #2
	cmp r3, #0x10
	blt _02035134
	pop {r4, pc}
	nop
_02035148: .word _021D4134
_0203514C: .word 0x00000D44
	thumb_func_end sub_0203511C

	thumb_func_start sub_02035150
sub_02035150: ; 0x02035150
	push {r3, r4, r5, lr}
	ldr r1, _0203517C ; =_021D4134
	mov r4, #0
	ldr r5, [r1, #8]
	ldr r1, _02035180 ; =0x00000D44
	add r3, r4, #0
_0203515C:
	ldrh r2, [r5, r1]
	cmp r2, #0
	beq _0203516C
	cmp r4, r0
	bne _0203516A
	add r0, r3, #0
	pop {r3, r4, r5, pc}
_0203516A:
	add r4, r4, #1
_0203516C:
	add r3, r3, #1
	add r5, r5, #2
	cmp r3, #0x10
	blt _0203515C
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203517C: .word _021D4134
_02035180: .word 0x00000D44
	thumb_func_end sub_02035150

	thumb_func_start sub_02035184
sub_02035184: ; 0x02035184
	ldr r0, _02035190 ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035194 ; =0x00000D74
	ldrb r0, [r1, r0]
	bx lr
	nop
_02035190: .word _021D4134
_02035194: .word 0x00000D74
	thumb_func_end sub_02035184

	thumb_func_start sub_02035198
sub_02035198: ; 0x02035198
	ldr r0, _020351A4 ; =_021D4134
	mov r2, #0
	ldr r1, [r0, #8]
	ldr r0, _020351A8 ; =0x00000D74
	strb r2, [r1, r0]
	bx lr
	.balign 4, 0
_020351A4: .word _021D4134
_020351A8: .word 0x00000D74
	thumb_func_end sub_02035198

	thumb_func_start sub_020351AC
sub_020351AC: ; 0x020351AC
	ldr r1, _020351D4 ; =_021D4134
	ldr r3, [r1, #8]
	lsl r1, r0, #1
	add r2, r3, r1
	ldr r1, _020351D8 ; =0x00000D44
	ldrh r1, [r2, r1]
	cmp r1, #0
	beq _020351D0
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	add r0, r3, r2
	add r1, #0xaa
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _020351D2
	mov r0, #1
	bx lr
_020351D0:
	mov r0, #0
_020351D2:
	bx lr
	.balign 4, 0
_020351D4: .word _021D4134
_020351D8: .word 0x00000D44
	thumb_func_end sub_020351AC

	thumb_func_start sub_020351DC
sub_020351DC: ; 0x020351DC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	ldr r1, _02035210 ; =_021D4134
	mov r5, #0
	ldr r6, [r1, #8]
	ldr r1, _02035214 ; =0x00000D44
	add r3, r5, #0
_020351EA:
	ldrh r2, [r6, r1]
	cmp r2, #0
	beq _02035204
	cmp r0, r5
	bne _02035202
	add r0, r3, #0
	bl sub_02035798
	add r1, r4, #0
	bl PlayerProfile_Copy
	pop {r4, r5, r6, pc}
_02035202:
	add r5, r5, #1
_02035204:
	add r3, r3, #1
	add r6, r6, #2
	cmp r3, #0x10
	blt _020351EA
	pop {r4, r5, r6, pc}
	nop
_02035210: .word _021D4134
_02035214: .word 0x00000D44
	thumb_func_end sub_020351DC

	thumb_func_start sub_02035218
sub_02035218: ; 0x02035218
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02033298
	cmp r0, #2
	bne _0203522C
	bl sub_02032E24
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203522C:
	bl sub_02033298
	cmp r0, #1
	bne _02035282
	bl sub_0203993C
	ldr r2, _02035288 ; =_021D4134
	mov r1, #0xc0
	add r4, r5, #0
	mul r4, r1
	ldr r3, [r2, #8]
	add r1, #0x8a
	add r2, r3, r4
	ldrh r2, [r2, r1]
	mov r1, #0xd9
	lsl r1, r1, #4
	strb r2, [r3, r1]
	bl sub_0203401C
	cmp r0, #0
	beq _0203526C
	ldr r1, _02035288 ; =_021D4134
	mov r0, #1
	ldr r2, [r1, #8]
	mov r1, #0x46
	lsl r1, r1, #2
	add r1, r2, r1
	add r1, r1, r4
	mov r2, #0
	bl sub_02032B84
	b _0203527E
_0203526C:
	ldr r1, _02035288 ; =_021D4134
	mov r0, #1
	ldr r2, [r1, #8]
	mov r1, #0x45
	lsl r1, r1, #2
	add r1, r2, r1
	add r1, r1, r4
	bl sub_0203373C
_0203527E:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02035282:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02035288: .word _021D4134
	thumb_func_end sub_02035218

	thumb_func_start sub_0203528C
sub_0203528C: ; 0x0203528C
	push {r3, r4, r5, r6, r7, lr}
	bl sub_02034C94
	mov r4, #0
	ldr r1, _020352CC ; =_021D4134
	ldr r0, _020352D0 ; =0x00000D44
	add r5, r4, #0
	mov r2, #1
_0203529C:
	ldr r3, [r1, #8]
	add r3, r3, r5
	ldrh r6, [r3, r0]
	cmp r6, #0
	beq _020352C0
	beq _020352C0
	ldr r6, _020352D0 ; =0x00000D44
	ldrh r6, [r3, r6]
	sub r7, r6, #1
	ldr r6, _020352D0 ; =0x00000D44
	strh r7, [r3, r6]
	ldr r3, [r1, #8]
	add r7, r3, r5
	ldrh r6, [r7, r6]
	cmp r6, #0
	bne _020352C0
	ldr r6, _020352D4 ; =0x00000D74
	strb r2, [r3, r6]
_020352C0:
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #0x10
	blt _0203529C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020352CC: .word _021D4134
_020352D0: .word 0x00000D44
_020352D4: .word 0x00000D74
	thumb_func_end sub_0203528C

	thumb_func_start sub_020352D8
sub_020352D8: ; 0x020352D8
	push {r3, r4, r5, lr}
	bl sub_0203993C
	add r5, r0, #0
	bl sub_02035784
	add r4, r0, #0
	cmp r5, #0xf
	beq _02035360
	ldr r0, _020353A8 ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _020353AC ; =0x00000D88
	ldr r5, [r1, r0]
	bl sub_020290B4
	cmp r0, #0x20
	ble _020352FE
	bl GF_AssertFail
_020352FE:
	bl PlayerProfile_sizeof
	cmp r0, #0x20
	beq _0203530A
	bl GF_AssertFail
_0203530A:
	bl PlayerProfile_sizeof
	add r1, r5, #0
	add r2, r0, #0
	add r0, r4, #0
	add r1, #0x10
	bl MI_CpuCopy8
	bl sub_020290B4
	add r2, r0, #0
	ldr r0, _020353A8 ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _020353B0 ; =0x00000D7C
	ldr r0, [r1, r0]
	add r1, r5, #0
	add r1, #0x30
	bl MI_CpuCopy8
	add r0, r4, #0
	bl PlayerProfile_GetTrainerID
	str r0, [r5]
	bl sub_0203993C
	strb r0, [r5, #4]
	bl sub_02039954
	strb r0, [r5, #5]
	ldr r0, _020353A8 ; =_021D4134
	mov r2, #8
	ldr r1, [r0, #8]
	ldr r0, _020353B4 ; =0x00000D68
	add r0, r1, r0
	add r1, r5, #0
	add r1, #8
	bl MI_CpuCopy8
	bl sub_02033AB8
	add r5, #0x54
	strb r0, [r5]
	b _02035388
_02035360:
	ldr r1, _020353A8 ; =_021D4134
	ldr r2, [r1, #8]
	ldr r1, _020353AC ; =0x00000D88
	ldr r4, [r2, r1]
	bl PlayerProfile_GetTrainerID
	str r0, [r4]
	bl sub_0203993C
	strb r0, [r4, #4]
	bl sub_02039954
	strb r0, [r4, #5]
	ldr r0, _020353A8 ; =_021D4134
	add r4, #8
	ldr r0, [r0, #8]
	add r1, r4, #0
	mov r2, #0x54
	bl MI_CpuCopy8
_02035388:
	ldr r0, _020353A8 ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _020353AC ; =0x00000D88
	ldr r0, [r1, r0]
	mov r1, #0x5c
	bl DC_FlushRange
	ldr r0, _020353A8 ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _020353AC ; =0x00000D88
	ldr r0, [r1, r0]
	mov r1, #0x5c
	bl sub_02033240
	pop {r3, r4, r5, pc}
	nop
_020353A8: .word _021D4134
_020353AC: .word 0x00000D88
_020353B0: .word 0x00000D7C
_020353B4: .word 0x00000D68
	thumb_func_end sub_020352D8

	thumb_func_start sub_020353B8
sub_020353B8: ; 0x020353B8
	push {r4, lr}
	ldr r0, _02035404 ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035408 ; =0x00000D88
	ldr r4, [r1, r0]
	bl sub_02035610
	ldrb r1, [r4, #6]
	cmp r1, r0
	beq _02035402
	bl sub_02035610
	strb r0, [r4, #6]
	ldr r0, _02035404 ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035408 ; =0x00000D88
	ldr r0, [r1, r0]
	mov r1, #0x5c
	bl DC_FlushRange
	ldr r0, _02035404 ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035408 ; =0x00000D88
	ldr r0, [r1, r0]
	mov r1, #0x5c
	bl sub_02033240
	ldr r3, _02035404 ; =_021D4134
	ldr r2, _02035408 ; =0x00000D88
	ldr r4, [r3, #8]
	ldrh r3, [r3]
	ldr r0, [r4, r2]
	sub r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x5c
	bl sub_020339B4
_02035402:
	pop {r4, pc}
	.balign 4, 0
_02035404: .word _021D4134
_02035408: .word 0x00000D88
	thumb_func_end sub_020353B8

	thumb_func_start sub_0203540C
sub_0203540C: ; 0x0203540C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_02033298
	add r5, r0, #0
	bl sub_020347CC
	add r6, r0, #0
	bl sub_020353B8
	bl sub_020338F4
	cmp r0, #0
	bne _0203544A
	bl sub_0203567C
	cmp r0, #0
	bne _0203544A
	ldr r0, _020355AC ; =_021D4134
	ldr r3, _020355B0 ; =0x00000D95
	ldr r1, [r0, #8]
	ldrb r0, [r1, r3]
	lsl r2, r0, #0x1d
	lsr r2, r2, #0x1f
	beq _0203544A
	mov r2, #1
	bic r0, r2
	mov r2, #1
	orr r0, r2
	strb r0, [r1, r3]
_0203544A:
	ldr r0, _020355AC ; =_021D4134
	ldr r3, _020355B4 ; =0x00000D8E
	ldr r2, [r0, #8]
	ldr r0, _020355B8 ; =0x0000FFFF
	ldrh r1, [r2, r3]
	cmp r1, r0
	bne _0203545A
	strh r4, [r2, r3]
_0203545A:
	ldr r0, _020355AC ; =_021D4134
	ldr r3, _020355B0 ; =0x00000D95
	ldr r1, [r0, #8]
	ldrb r0, [r1, r3]
	lsl r2, r0, #0x1e
	lsr r2, r2, #0x1f
	beq _02035490
	sub r2, r3, #7
	ldrh r2, [r1, r2]
	cmp r2, r4
	bls _0203547A
	mov r2, #1
	bic r0, r2
	mov r2, #1
	orr r0, r2
	strb r0, [r1, r3]
_0203547A:
	cmp r6, #0
	beq _02035490
	ldr r0, _020355AC ; =_021D4134
	ldr r2, _020355B0 ; =0x00000D95
	ldr r0, [r0, #8]
	mov r1, #1
	ldrb r3, [r0, r2]
	bic r3, r1
	mov r1, #1
	orr r1, r3
	strb r1, [r0, r2]
_02035490:
	bl sub_020332AC
	cmp r0, #0x19
	bne _0203549E
	mov r0, #0
	bl sub_020399DC
_0203549E:
	cmp r5, #9
	bls _020354A4
	b _020355A6
_020354A4:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020354B0: ; jump table
	.short _020354C4 - _020354B0 - 2 ; case 0
	.short _020354E4 - _020354B0 - 2 ; case 1
	.short _020355A6 - _020354B0 - 2 ; case 2
	.short _020355A6 - _020354B0 - 2 ; case 3
	.short _020355A6 - _020354B0 - 2 ; case 4
	.short _020355A6 - _020354B0 - 2 ; case 5
	.short _020355A6 - _020354B0 - 2 ; case 6
	.short _02035528 - _020354B0 - 2 ; case 7
	.short _0203550E - _020354B0 - 2 ; case 8
	.short _0203550E - _020354B0 - 2 ; case 9
_020354C4:
	ldr r0, _020355AC ; =_021D4134
	ldr r2, [r0, #8]
	ldr r0, _020355BC ; =0x00000D92
	ldrb r1, [r2, r0]
	cmp r1, #1
	bne _020354D8
	bl sub_020350D4
	add sp, #8
	pop {r4, r5, r6, pc}
_020354D8:
	cmp r1, #2
	bne _020355A6
	mov r1, #3
	strb r1, [r2, r0]
	add sp, #8
	pop {r4, r5, r6, pc}
_020354E4:
	ldr r0, _020355AC ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _020355BC ; =0x00000D92
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _020354F8
	bl sub_020338D0
	cmp r0, #0
	bne _020355A6
_020354F8:
	ldr r0, _020355AC ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _020355BC ; =0x00000D92
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _020355A6
	bl sub_020338D0
	add sp, #8
	cmp r0, #0
	pop {r4, r5, r6, pc}
_0203550E:
	ldr r0, _020355AC ; =_021D4134
	ldr r3, [r0, #8]
	cmp r3, #0
	beq _020355A6
	ldr r1, _020355B0 ; =0x00000D95
	mov r0, #1
	ldrb r2, [r3, r1]
	add sp, #8
	bic r2, r0
	mov r0, #1
	orr r0, r2
	strb r0, [r3, r1]
	pop {r4, r5, r6, pc}
_02035528:
	bl sub_02033468
	ldr r3, _020355AC ; =_021D4134
	ldr r2, _020355C0 ; =0x00000D91
	ldr r4, [r3, #8]
	ldrb r1, [r4, r2]
	cmp r1, #0
	bne _02035544
	sub r1, r2, #5
	strh r0, [r4, r1]
	ldr r0, [r3, #8]
	mov r1, #5
	strb r1, [r0, r2]
	b _02035548
_02035544:
	sub r0, r1, #1
	strb r0, [r4, r2]
_02035548:
	ldr r0, _020355AC ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _020355C4 ; =0x00000D8C
	ldrh r5, [r1, r0]
	add r0, #9
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	beq _02035562
	bl WM_GetNextTgid
	ldr r1, _020355AC ; =_021D4134
	strh r0, [r1]
_02035562:
	bl sub_020352D8
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r4, r0, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02035724
	str r0, [sp]
	ldr r1, _020355AC ; =_021D4134
	ldr r0, _020355B0 ; =0x00000D95
	ldr r2, [r1, #8]
	add r3, r4, #0
	ldrb r0, [r2, r0]
	add r2, r5, #0
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	str r0, [sp, #4]
	ldrh r1, [r1]
	mov r0, #0
	bl sub_02033668
	ldr r0, _020355AC ; =_021D4134
	ldr r1, [r0, #8]
	mov r0, #0xd9
	lsl r0, r0, #4
	strb r5, [r1, r0]
_020355A6:
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_020355AC: .word _021D4134
_020355B0: .word 0x00000D95
_020355B4: .word 0x00000D8E
_020355B8: .word 0x0000FFFF
_020355BC: .word 0x00000D92
_020355C0: .word 0x00000D91
_020355C4: .word 0x00000D8C
	thumb_func_end sub_0203540C

	thumb_func_start sub_020355C8
sub_020355C8: ; 0x020355C8
	push {r3, lr}
	ldr r1, _020355D8 ; =_021D4134
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _020355D6
	bl sub_0203540C
_020355D6:
	pop {r3, pc}
	.balign 4, 0
_020355D8: .word _021D4134
	thumb_func_end sub_020355C8

	thumb_func_start sub_020355DC
sub_020355DC: ; 0x020355DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0203560C ; =_021D4134
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _020355EC
	mov r0, #0
	pop {r4, pc}
_020355EC:
	bl sub_02033298
	cmp r0, #4
	beq _020355F8
	mov r0, #0
	pop {r4, pc}
_020355F8:
	bl sub_02033250
	mov r2, #1
	add r1, r2, #0
	lsl r1, r4
	tst r0, r1
	bne _02035608
	mov r2, #0
_02035608:
	add r0, r2, #0
	pop {r4, pc}
	.balign 4, 0
_0203560C: .word _021D4134
	thumb_func_end sub_020355DC

	thumb_func_start sub_02035610
sub_02035610: ; 0x02035610
	push {r3, r4, r5, lr}
	mov r4, #0
	add r5, r4, #0
_02035616:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl sub_020355DC
	cmp r0, #0
	beq _02035624
	add r4, r4, #1
_02035624:
	add r5, r5, #1
	cmp r5, #8
	blt _02035616
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02035610

	thumb_func_start sub_02035630
sub_02035630: ; 0x02035630
	ldr r0, _02035648 ; =_021D4134
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _02035644
	ldr r0, _0203564C ; =0x00000D92
	ldrb r0, [r1, r0]
	cmp r0, #3
	bne _02035644
	mov r0, #1
	bx lr
_02035644:
	mov r0, #0
	bx lr
	.balign 4, 0
_02035648: .word _021D4134
_0203564C: .word 0x00000D92
	thumb_func_end sub_02035630

	thumb_func_start sub_02035650
sub_02035650: ; 0x02035650
	ldr r0, _02035660 ; =_021D4134
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0203565C
	mov r0, #1
	bx lr
_0203565C:
	mov r0, #0
	bx lr
	.balign 4, 0
_02035660: .word _021D4134
	thumb_func_end sub_02035650

	thumb_func_start sub_02035664
sub_02035664: ; 0x02035664
	push {r3, lr}
	ldr r0, _02035678 ; =_021D4134
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02035674
	bl sub_02033920
	pop {r3, pc}
_02035674:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02035678: .word _021D4134
	thumb_func_end sub_02035664

	thumb_func_start sub_0203567C
sub_0203567C: ; 0x0203567C
	push {r3, lr}
	ldr r0, _02035694 ; =_021D4134
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02035690
	bl sub_02033250
	ldr r1, _02035698 ; =0x0000FFFE
	and r0, r1
	pop {r3, pc}
_02035690:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02035694: .word _021D4134
_02035698: .word 0x0000FFFE
	thumb_func_end sub_0203567C

	thumb_func_start sub_0203569C
sub_0203569C: ; 0x0203569C
	ldr r0, _020356B8 ; =_021D4134
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _020356B2
	ldr r0, _020356BC ; =0x00000D95
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _020356B2
	mov r0, #1
	bx lr
_020356B2:
	mov r0, #0
	bx lr
	nop
_020356B8: .word _021D4134
_020356BC: .word 0x00000D95
	thumb_func_end sub_0203569C

	thumb_func_start sub_020356C0
sub_020356C0: ; 0x020356C0
	push {r3, r4}
	ldr r1, _020356E4 ; =_021D4134
	ldr r2, [r1, #8]
	cmp r2, #0
	beq _020356DE
	ldr r4, _020356E8 ; =0x00000D95
	lsl r0, r0, #0x18
	ldrb r1, [r2, r4]
	lsr r0, r0, #0x18
	mov r3, #4
	lsl r0, r0, #0x1f
	bic r1, r3
	lsr r0, r0, #0x1d
	orr r0, r1
	strb r0, [r2, r4]
_020356DE:
	pop {r3, r4}
	bx lr
	nop
_020356E4: .word _021D4134
_020356E8: .word 0x00000D95
	thumb_func_end sub_020356C0

	thumb_func_start sub_020356EC
sub_020356EC: ; 0x020356EC
	push {r4, r5}
	ldr r5, _02035718 ; =_021D4134
	ldr r2, [r5, #8]
	cmp r2, #0
	beq _02035712
	ldr r4, _0203571C ; =0x00000D95
	lsl r0, r0, #0x18
	ldrb r1, [r2, r4]
	lsr r0, r0, #0x18
	mov r3, #2
	lsl r0, r0, #0x1f
	bic r1, r3
	lsr r0, r0, #0x1e
	orr r0, r1
	strb r0, [r2, r4]
	ldr r2, _02035720 ; =0x0000FFFF
	ldr r1, [r5, #8]
	sub r0, r4, #7
	strh r2, [r1, r0]
_02035712:
	pop {r4, r5}
	bx lr
	nop
_02035718: .word _021D4134
_0203571C: .word 0x00000D95
_02035720: .word 0x0000FFFF
	thumb_func_end sub_020356EC

	thumb_func_start sub_02035724
sub_02035724: ; 0x02035724
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl WM_GetDispersionBeaconPeriod
	add r4, r0, #0
	cmp r5, #0x29
	blo _02035736
	bl GF_AssertFail
_02035736:
	cmp r5, #0xa
	bne _02035740
	lsl r0, r4, #0xe
	lsr r0, r0, #0x10
	pop {r3, r4, r5, pc}
_02035740:
	cmp r5, #9
	beq _02035748
	cmp r5, #0xd
	bne _0203574E
_02035748:
	lsl r0, r4, #0xe
	lsr r0, r0, #0x10
	pop {r3, r4, r5, pc}
_0203574E:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02035724

	thumb_func_start sub_02035754
sub_02035754: ; 0x02035754
	ldr r1, _0203577C ; =_021D4134
	ldr r3, [r1, #8]
	cmp r3, #0
	beq _02035776
	lsl r1, r0, #1
	add r2, r3, r1
	ldr r1, _02035780 ; =0x00000D44
	ldrh r1, [r2, r1]
	cmp r1, #0
	beq _02035776
	mov r1, #0x45
	lsl r1, r1, #2
	add r2, r3, r1
	mov r1, #0xc0
	mul r1, r0
	add r0, r2, r1
	bx lr
_02035776:
	mov r0, #0
	bx lr
	nop
_0203577C: .word _021D4134
_02035780: .word 0x00000D44
	thumb_func_end sub_02035754

	thumb_func_start sub_02035784
sub_02035784: ; 0x02035784
	ldr r0, _02035790 ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035794 ; =0x00000D78
	ldr r0, [r1, r0]
	bx lr
	nop
_02035790: .word _021D4134
_02035794: .word 0x00000D78
	thumb_func_end sub_02035784

	thumb_func_start sub_02035798
sub_02035798: ; 0x02035798
	ldr r1, _020357BC ; =_021D4134
	ldr r3, [r1, #8]
	lsl r1, r0, #1
	add r2, r3, r1
	ldr r1, _020357C0 ; =0x00000D44
	ldrh r1, [r2, r1]
	cmp r1, #0
	bne _020357AC
	mov r0, #0
	bx lr
_020357AC:
	mov r1, #0x59
	lsl r1, r1, #2
	add r2, r3, r1
	mov r1, #0xc0
	mul r1, r0
	add r0, r2, r1
	add r0, #0x10
	bx lr
	.balign 4, 0
_020357BC: .word _021D4134
_020357C0: .word 0x00000D44
	thumb_func_end sub_02035798

	thumb_func_start sub_020357C4
sub_020357C4: ; 0x020357C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _020357F4 ; =_021D4134
	add r4, r1, #0
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _020357F0
	cmp r4, #8
	blt _020357DA
	bl GF_AssertFail
_020357DA:
	ldr r1, _020357F4 ; =_021D4134
	add r0, r5, #0
	ldr r2, [r1, #8]
	ldr r1, _020357F8 ; =0x00000D14
	add r3, r2, r1
	mov r2, #6
	add r1, r4, #0
	mul r1, r2
	add r1, r3, r1
	bl MI_CpuCopy8
_020357F0:
	pop {r3, r4, r5, pc}
	nop
_020357F4: .word _021D4134
_020357F8: .word 0x00000D14
	thumb_func_end sub_020357C4

	thumb_func_start sub_020357FC
sub_020357FC: ; 0x020357FC
	ldr r0, _02035814 ; =_021D4134
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0203580E
	ldr r0, _02035818 ; =0x00000D95
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	bx lr
_0203580E:
	mov r0, #0
	bx lr
	nop
_02035814: .word _021D4134
_02035818: .word 0x00000D95
	thumb_func_end sub_020357FC

	thumb_func_start sub_0203581C
sub_0203581C: ; 0x0203581C
	ldr r0, _02035830 ; =_021D4134
	ldr r3, [r0, #8]
	cmp r3, #0
	beq _0203582E
	ldr r1, _02035834 ; =0x00000D95
	mov r0, #0x10
	ldrb r2, [r3, r1]
	orr r0, r2
	strb r0, [r3, r1]
_0203582E:
	bx lr
	.balign 4, 0
_02035830: .word _021D4134
_02035834: .word 0x00000D95
	thumb_func_end sub_0203581C

	thumb_func_start sub_02035838
sub_02035838: ; 0x02035838
	ldr r1, _02035848 ; =_021D4134
	ldr r3, _0203584C ; =MI_CpuCopy8
	ldr r2, [r1, #8]
	ldr r1, _02035850 ; =0x00000D68
	add r1, r2, r1
	mov r2, #8
	bx r3
	nop
_02035848: .word _021D4134
_0203584C: .word MI_CpuCopy8
_02035850: .word 0x00000D68
	thumb_func_end sub_02035838

	thumb_func_start sub_02035854
sub_02035854: ; 0x02035854
	push {r4, lr}
	add r4, r0, #0
	bl sub_020290B4
	ldr r1, _02035870 ; =_021D4134
	add r2, r0, #0
	ldr r3, [r1, #8]
	ldr r1, _02035874 ; =0x00000D7C
	add r0, r4, #0
	ldr r1, [r3, r1]
	bl MI_CpuCopy8
	pop {r4, pc}
	nop
_02035870: .word _021D4134
_02035874: .word 0x00000D7C
	thumb_func_end sub_02035854

	thumb_func_start sub_02035878
sub_02035878: ; 0x02035878
	ldr r0, _02035884 ; =_021D4134
	ldr r1, [r0, #8]
	ldr r0, _02035888 ; =0x00000D7C
	ldr r0, [r1, r0]
	bx lr
	nop
_02035884: .word _021D4134
_02035888: .word 0x00000D7C
	thumb_func_end sub_02035878

	thumb_func_start sub_0203588C
sub_0203588C: ; 0x0203588C
	push {r4, lr}
	bl sub_020352D8
	ldr r3, _020358A8 ; =_021D4134
	ldr r2, _020358AC ; =0x00000D88
	ldr r4, [r3, #8]
	ldrh r3, [r3]
	ldr r0, [r4, r2]
	sub r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x5c
	bl sub_020339B4
	pop {r4, pc}
	.balign 4, 0
_020358A8: .word _021D4134
_020358AC: .word 0x00000D88
	thumb_func_end sub_0203588C

	thumb_func_start sub_020358B0
sub_020358B0: ; 0x020358B0
	ldr r3, _020358B4 ; =sub_02033A44
	bx r3
	.balign 4, 0
_020358B4: .word sub_02033A44
	thumb_func_end sub_020358B0

	thumb_func_start sub_020358B8
sub_020358B8: ; 0x020358B8
	push {r3, lr}
	ldr r1, _020358CC ; =_021D4134
	mov r2, #0x54
	ldr r1, [r1, #8]
	bl MI_CpuCopy8
	bl sub_0203588C
	pop {r3, pc}
	nop
_020358CC: .word _021D4134
	thumb_func_end sub_020358B8

	thumb_func_start sub_020358D0
sub_020358D0: ; 0x020358D0
	ldr r1, _020358F8 ; =_021D4134
	ldr r3, [r1, #8]
	cmp r3, #0
	beq _020358F4
	lsl r1, r0, #1
	add r2, r3, r1
	ldr r1, _020358FC ; =0x00000D44
	ldrh r1, [r2, r1]
	cmp r1, #0
	beq _020358F4
	mov r1, #0x59
	lsl r1, r1, #2
	add r2, r3, r1
	mov r1, #0xc0
	mul r1, r0
	add r0, r2, r1
	add r0, #8
	bx lr
_020358F4:
	mov r0, #0
	bx lr
	.balign 4, 0
_020358F8: .word _021D4134
_020358FC: .word 0x00000D44
	thumb_func_end sub_020358D0
