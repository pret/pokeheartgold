	.include "asm/macros.inc"
	.include "unk_020215A0.inc"
	.include "global.inc"

	.bss

_021D21F4:
	.space 0x4

	.text

	thumb_func_start sub_020215A0
sub_020215A0: ; 0x020215A0
	ldr r1, _020215B4 ; =0x04001000
	ldr r2, [r1]
	ldr r1, _020215B8 ; =0x00300010
	lsl r3, r1, #0x16
	ldr r3, [r3]
	and r2, r1
	and r1, r3
	ldr r3, _020215BC ; =sub_020215C0
	bx r3
	nop
_020215B4: .word 0x04001000
_020215B8: .word 0x00300010
_020215BC: .word sub_020215C0
	thumb_func_end sub_020215A0

	thumb_func_start sub_020215C0
sub_020215C0: ; 0x020215C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _02021680 ; =_021D21F4
	str r1, [sp]
	ldr r0, [r0]
	str r2, [sp, #4]
	cmp r0, #0
	bne _0202167A
	ldr r0, [r5, #0xc]
	mov r1, #0x3c
	bl AllocFromHeap
	add r1, r0, #0
	ldr r0, _02021680 ; =_021D21F4
	mov r2, #0x3c
	str r1, [r0]
	mov r0, #0
	bl MIi_CpuClear32
	ldr r1, _02021680 ; =_021D21F4
	ldr r2, [r5]
	ldr r0, [r1]
	str r2, [r0, #4]
	ldr r1, [r1]
	ldr r0, [r5, #0xc]
	ldr r2, [r1, #4]
	mov r1, #0x54
	mul r1, r2
	bl AllocFromHeap
	ldr r7, _02021680 ; =_021D21F4
	mov r6, #0
	ldr r1, [r7]
	str r0, [r1]
	ldr r0, [r5]
	cmp r0, #0
	ble _02021622
	add r4, r6, #0
_0202160E:
	ldr r0, [r7]
	ldr r0, [r0]
	add r0, r0, r4
	bl sub_02021C08
	ldr r0, [r5]
	add r6, r6, #1
	add r4, #0x54
	cmp r6, r0
	blt _0202160E
_02021622:
	ldr r0, [sp]
	bl sub_02022448
	ldr r1, _02021680 ; =_021D21F4
	ldr r1, [r1]
	str r0, [r1, #0x2c]
	ldr r0, [sp, #4]
	bl sub_02022448
	ldr r2, _02021680 ; =_021D21F4
	mov r3, #1
	ldr r1, [r2]
	lsl r3, r3, #0x1a
	str r0, [r1, #0x30]
	ldr r0, [r3]
	ldr r1, _02021684 ; =0xFFCFFFEF
	add r4, r0, #0
	ldr r0, [sp]
	and r4, r1
	orr r0, r4
	str r0, [r3]
	ldr r3, _02021688 ; =0x04001000
	ldr r0, [r3]
	and r1, r0
	ldr r0, [sp, #4]
	orr r0, r1
	str r0, [r3]
	ldr r1, [r2]
	ldr r0, [r5, #4]
	ldr r1, [r1, #0x2c]
	bl sub_020224A8
	ldr r1, _02021680 ; =_021D21F4
	add r4, r0, #0
	ldr r1, [r1]
	ldr r0, [r5, #8]
	ldr r1, [r1, #0x30]
	bl sub_020224A8
	add r1, r0, #0
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	bl sub_020221D0
_0202167A:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02021680: .word _021D21F4
_02021684: .word 0xFFCFFFEF
_02021688: .word 0x04001000
	thumb_func_end sub_020215C0

	thumb_func_start sub_0202168C
sub_0202168C: ; 0x0202168C
	push {r3, lr}
	ldr r0, _020216C4 ; =_021D21F4
	ldr r0, [r0]
	cmp r0, #0
	beq _020216C2
	ldr r0, [r0, #0x34]
	bl sub_02022238
	ldr r0, _020216C4 ; =_021D21F4
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	bl sub_02022238
	bl sub_020218D4
	ldr r0, _020216C4 ; =_021D21F4
	ldr r0, [r0]
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _020216C4 ; =_021D21F4
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _020216C4 ; =_021D21F4
	mov r1, #0
	str r1, [r0]
_020216C2:
	pop {r3, pc}
	.balign 4, 0
_020216C4: .word _021D21F4
	thumb_func_end sub_0202168C

	thumb_func_start sub_020216C8
sub_020216C8: ; 0x020216C8
	push {r3, lr}
	ldr r0, _020216F0 ; =_021D21F4
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0xc]
	ldr r1, [r0]
	str r2, [r1, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0x34]
	bl sub_02022278
	ldr r0, _020216F0 ; =_021D21F4
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	bl sub_02022278
	bl sub_02022060
	pop {r3, pc}
	nop
_020216F0: .word _021D21F4
	thumb_func_end sub_020216C8

	thumb_func_start sub_020216F4
sub_020216F4: ; 0x020216F4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r3, r1, #0
	cmp r2, #1
	add r0, sp, #4
	bne _0202172A
	str r0, [sp]
	ldr r0, _02021754 ; =_021D21F4
	add r2, r3, #0
	ldr r0, [r0]
	add r1, r4, #0
	ldr r0, [r0, #0x1c]
	add r3, sp, #8
	bl sub_0202256C
	ldr r3, [sp, #4]
	cmp r3, #0
	ble _02021750
	mov r2, #0
	str r2, [sp]
	ldr r1, [sp, #8]
	mov r0, #1
	bl sub_02021EC0
	add sp, #0xc
	pop {r3, r4, pc}
_0202172A:
	str r0, [sp]
	ldr r0, _02021754 ; =_021D21F4
	add r2, r3, #0
	ldr r0, [r0]
	add r1, r4, #0
	ldr r0, [r0, #0x20]
	add r3, sp, #8
	bl sub_0202256C
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _02021750
	str r0, [sp]
	mov r1, #0
	ldr r2, [sp, #8]
	mov r0, #2
	add r3, r1, #0
	bl sub_02021EC0
_02021750:
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02021754: .word _021D21F4
	thumb_func_end sub_020216F4

	thumb_func_start sub_02021758
sub_02021758: ; 0x02021758
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	bl sub_0202180C
	cmp r0, #1
	bne _0202176A
	bl GF_AssertFail
_0202176A:
	bl sub_02022024
	add r4, r0, #0
	bne _0202177A
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202177A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02021C2C
	cmp r0, #0
	bne _0202178A
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202178A:
	add r0, r4, #0
	bl sub_02021C9C
	cmp r0, #0
	bne _0202179E
	ldr r0, [r4, #0xc]
	bl sub_02021884
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202179E:
	ldr r0, _020217AC ; =_021D21F4
	ldr r1, [r0]
	ldr r0, [r1, #8]
	add r0, r0, #1
	str r0, [r1, #8]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020217AC: .word _021D21F4
	thumb_func_end sub_02021758

	thumb_func_start sub_020217B0
sub_020217B0: ; 0x020217B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	bl sub_0202180C
	cmp r0, #1
	bne _020217C2
	bl GF_AssertFail
_020217C2:
	bl sub_02022024
	add r4, r0, #0
	bne _020217D2
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_020217D2:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02021C2C
	cmp r0, #0
	bne _020217E2
	mov r0, #0
	pop {r3, r4, r5, pc}
_020217E2:
	mov r0, #1
	str r0, [r4, #0x40]
	add r0, r4, #0
	bl sub_02021C9C
	cmp r0, #0
	bne _020217FA
	ldr r0, [r4, #0xc]
	bl sub_02021884
	mov r0, #0
	pop {r3, r4, r5, pc}
_020217FA:
	ldr r0, _02021808 ; =_021D21F4
	ldr r1, [r0]
	ldr r0, [r1, #8]
	add r0, r0, #1
	str r0, [r1, #8]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02021808: .word _021D21F4
	thumb_func_end sub_020217B0

	thumb_func_start sub_0202180C
sub_0202180C: ; 0x0202180C
	push {r3, r4}
	ldr r1, _02021838 ; =_021D21F4
	mov r2, #0
	ldr r4, [r1]
	ldr r1, [r4, #4]
	cmp r1, #0
	ble _02021832
	ldr r3, [r4]
_0202181C:
	ldr r1, [r3, #0xc]
	cmp r0, r1
	bne _02021828
	mov r0, #1
	pop {r3, r4}
	bx lr
_02021828:
	ldr r1, [r4, #4]
	add r2, r2, #1
	add r3, #0x54
	cmp r2, r1
	blt _0202181C
_02021832:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02021838: .word _021D21F4
	thumb_func_end sub_0202180C

	thumb_func_start sub_0202183C
sub_0202183C: ; 0x0202183C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bne _02021848
	bl GF_AssertFail
_02021848:
	add r0, r4, #0
	bl sub_02021D70
	add r4, r0, #0
	bne _02021856
	bl GF_AssertFail
_02021856:
	str r5, [r4]
	ldr r1, [r4, #4]
	mov r0, #1
	tst r0, r1
	beq _0202186C
	ldr r1, [r4, #0x34]
	ldr r2, [r5, #0x14]
	ldr r3, [r5, #0x10]
	mov r0, #0x13
	bl GF_CreateNewVramTransferTask
_0202186C:
	ldr r1, [r4, #4]
	mov r0, #2
	tst r0, r1
	beq _02021880
	ldr r1, [r4, #0x38]
	ldr r2, [r5, #0x14]
	ldr r3, [r5, #0x10]
	mov r0, #0x23
	bl GF_CreateNewVramTransferTask
_02021880:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202183C

	thumb_func_start sub_02021884
sub_02021884: ; 0x02021884
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r5, #1
	mov r7, #0
_0202188C:
	add r0, r6, #0
	bl sub_02021D70
	add r4, r0, #0
	bne _0202189A
	bl GF_AssertFail
_0202189A:
	add r0, r4, #0
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #4
	bne _020218AE
	add r0, r4, #0
	add r0, #0x10
	bl sub_02021A50
	b _020218B0
_020218AE:
	add r5, r7, #0
_020218B0:
	cmp r5, #0
	bne _0202188C
	add r0, r4, #0
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	beq _020218CE
	add r0, r4, #0
	bl sub_02021D58
	ldr r0, _020218D0 ; =_021D21F4
	ldr r1, [r0]
	ldr r0, [r1, #8]
	sub r0, r0, #1
	str r0, [r1, #8]
_020218CE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020218D0: .word _021D21F4
	thumb_func_end sub_02021884

	thumb_func_start sub_020218D4
sub_020218D4: ; 0x020218D4
	push {r4, r5, r6, lr}
	ldr r6, _0202190C ; =_021D21F4
	mov r4, #0
	ldr r1, [r6]
	ldr r0, [r1, #4]
	cmp r0, #0
	ble _0202190A
	add r5, r4, #0
_020218E4:
	ldr r1, [r1]
	add r0, r1, r5
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	beq _020218FE
	add r0, r1, r5
	bl sub_02021D58
	ldr r1, [r6]
	ldr r0, [r1, #8]
	sub r0, r0, #1
	str r0, [r1, #8]
_020218FE:
	ldr r1, [r6]
	add r4, r4, #1
	ldr r0, [r1, #4]
	add r5, #0x54
	cmp r4, r0
	blt _020218E4
_0202190A:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202190C: .word _021D21F4
	thumb_func_end sub_020218D4

	thumb_func_start sub_02021910
sub_02021910: ; 0x02021910
	push {r4, lr}
	bl sub_02021D70
	add r4, r0, #0
	bne _0202191E
	bl GF_AssertFail
_0202191E:
	add r0, r4, #0
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0202192C
	mov r0, #0
	pop {r4, pc}
_0202192C:
	add r4, #0x10
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02021910

	thumb_func_start sub_02021934
sub_02021934: ; 0x02021934
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r1, #0
	bl sub_02021D70
	add r4, r0, #0
	bne _02021946
	bl GF_AssertFail
_02021946:
	add r0, r4, #0
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _02021956
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, pc}
_02021956:
	add r0, sp, #0xc
	str r0, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	add r1, sp, #0x14
	add r2, sp, #0x10
	add r3, r5, #0
	bl sub_02021DE4
	add r0, r4, #0
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #3
	bne _0202197A
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202197A:
	add r0, r4, #0
	mov r1, #3
	add r0, #0x3c
	strb r1, [r0]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl sub_02021E90
	mov r0, #1
	str r0, [r4, #0x48]
	ldr r0, [sp, #0xc]
	str r0, [r4, #0x4c]
	ldr r0, [sp, #8]
	str r0, [r4, #0x50]
	add r0, r4, #0
	bl sub_02021FB0
	ldr r0, [sp, #8]
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0xc]
	bl sub_02021EC0
	add r4, #0x10
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02021934

	thumb_func_start sub_020219B8
sub_020219B8: ; 0x020219B8
	push {r3, r4, r5, lr}
	sub sp, #0x18
	bl sub_02021C50
	add r4, r0, #0
	bne _020219C8
	bl GF_AssertFail
_020219C8:
	bl sub_02022024
	add r5, r0, #0
	bne _020219D4
	bl GF_AssertFail
_020219D4:
	add r0, r4, #0
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #3
	beq _020219E4
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, pc}
_020219E4:
	add r3, r5, #0
	mov r2, #0xa
_020219E8:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020219E8
	ldr r0, [r4]
	mov r1, #4
	str r0, [r3]
	add r0, r5, #0
	add r0, #0x3c
	strb r1, [r0]
	ldr r0, [r5, #4]
	mov r1, #1
	tst r1, r0
	beq _02021A08
	ldr r3, [r5, #0x4c]
	b _02021A0A
_02021A08:
	ldr r3, [r5, #0x50]
_02021A0A:
	add r1, sp, #0xc
	str r1, [sp]
	add r1, sp, #8
	str r1, [sp, #4]
	add r1, sp, #0x14
	add r2, sp, #0x10
	bl sub_02021DE4
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r5, #0
	bl sub_02021E90
	mov r0, #1
	str r0, [r5, #0x48]
	ldr r0, [sp, #0xc]
	str r0, [r5, #0x4c]
	ldr r0, [sp, #8]
	str r0, [r5, #0x50]
	add r0, r5, #0
	bl sub_02021FB0
	ldr r0, [sp, #8]
	str r0, [sp]
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0xc]
	bl sub_02021EC0
	add r5, #0x10
	add r0, r5, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020219B8

	thumb_func_start sub_02021A50
sub_02021A50: ; 0x02021A50
	push {r4, r5, r6, lr}
	ldr r2, _02021AC4 ; =_021D21F4
	mov r1, #0
	ldr r5, [r2]
	ldr r4, [r5, #4]
	cmp r4, #0
	ble _02021A8E
	ldr r2, [r5]
	add r3, r1, #0
_02021A62:
	add r6, r2, #0
	add r6, #0x3c
	ldrb r6, [r6]
	cmp r6, #3
	beq _02021A78
	ldr r6, [r5]
	add r6, r6, r3
	add r6, #0x3c
	ldrb r6, [r6]
	cmp r6, #4
	bne _02021A82
_02021A78:
	ldr r6, [r5]
	add r6, r6, r3
	add r6, #0x10
	cmp r6, r0
	beq _02021A8E
_02021A82:
	ldr r6, [r5, #4]
	add r1, r1, #1
	add r2, #0x54
	add r3, #0x54
	cmp r1, r6
	blt _02021A62
_02021A8E:
	cmp r1, r4
	bge _02021AC2
	mov r0, #0x54
	add r4, r1, #0
	mul r4, r0
	ldr r0, [r5]
	add r0, r0, r4
	bl sub_020223C4
	ldr r0, _02021AC4 ; =_021D21F4
	ldr r1, [r0]
	ldr r2, [r1]
	add r2, #0x3c
	ldrb r1, [r2, r4]
	cmp r1, #3
	bne _02021AB4
	mov r0, #2
	strb r0, [r2, r4]
	pop {r4, r5, r6, pc}
_02021AB4:
	mov r1, #0
	strb r1, [r2, r4]
	ldr r0, [r0]
	ldr r0, [r0]
	add r0, r0, r4
	bl sub_02021C08
_02021AC2:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02021AC4: .word _021D21F4
	thumb_func_end sub_02021A50

	thumb_func_start sub_02021AC8
sub_02021AC8: ; 0x02021AC8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r1, #0
	bne _02021B02
	add r1, r5, #0
	add r2, sp, #0x14
	add r3, sp, #0x10
	bl sub_020224C0
	add r7, r0, #0
	beq _02021B52
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02022510
	strh r5, [r4, #8]
	str r6, [r4]
	cmp r5, #1
	bne _02021AF8
	ldr r0, [sp, #0x14]
	b _02021AFA
_02021AF8:
	ldr r0, [sp, #0x10]
_02021AFA:
	str r0, [r4, #4]
	mov r0, #0
	strh r0, [r4, #0xa]
	b _02021B52
_02021B02:
	add r0, sp, #0xc
	str r0, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0x14
	add r2, sp, #0x10
	add r3, r6, #0
	bl sub_02021DE4
	add r7, r0, #0
	beq _02021B52
	ldr r0, [sp, #8]
	str r0, [sp]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0xc]
	add r0, r5, #0
	bl sub_02021EC0
	strh r5, [r4, #8]
	cmp r5, #1
	bne _02021B3E
	ldr r0, [sp, #0xc]
	str r0, [r4]
	ldr r0, _02021B58 ; =_021D21F4
	ldr r1, [sp, #0x14]
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	b _02021B4A
_02021B3E:
	ldr r0, [sp, #8]
	str r0, [r4]
	ldr r0, _02021B58 ; =_021D21F4
	ldr r1, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
_02021B4A:
	add r0, r1, r0
	str r0, [r4, #4]
	mov r0, #1
	strh r0, [r4, #0xa]
_02021B52:
	add r0, r7, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02021B58: .word _021D21F4
	thumb_func_end sub_02021AC8

	thumb_func_start sub_02021B5C
sub_02021B5C: ; 0x02021B5C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrh r0, [r4, #0xa]
	cmp r0, #0
	beq _02021BCA
	ldrh r1, [r4, #8]
	mov r0, #1
	tst r0, r1
	beq _02021B98
	ldr r1, _02021BCC ; =_021D21F4
	ldr r0, [r4]
	ldr r1, [r1]
	ldr r1, [r1, #0x2c]
	bl sub_020224A8
	add r5, r0, #0
	ldr r0, _02021BCC ; =_021D21F4
	ldr r1, [r4, #4]
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	sub r0, r1, r0
	ldr r1, [r2, #0x2c]
	bl sub_020224A8
	ldr r2, _02021BCC ; =_021D21F4
	add r1, r5, #0
	ldr r2, [r2]
	ldr r2, [r2, #0x34]
	bl sub_02022374
_02021B98:
	ldrh r1, [r4, #8]
	mov r0, #2
	tst r0, r1
	beq _02021BCA
	ldr r1, _02021BCC ; =_021D21F4
	ldr r0, [r4]
	ldr r1, [r1]
	ldr r1, [r1, #0x30]
	bl sub_020224A8
	add r5, r0, #0
	ldr r0, _02021BCC ; =_021D21F4
	ldr r1, [r4, #4]
	ldr r2, [r0]
	ldr r0, [r2, #0x20]
	sub r0, r1, r0
	ldr r1, [r2, #0x30]
	bl sub_020224A8
	ldr r2, _02021BCC ; =_021D21F4
	add r1, r5, #0
	ldr r2, [r2]
	ldr r2, [r2, #0x38]
	bl sub_02022374
_02021BCA:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02021BCC: .word _021D21F4
	thumb_func_end sub_02021B5C

	thumb_func_start sub_02021BD0
sub_02021BD0: ; 0x02021BD0
	push {r3, lr}
	ldr r0, _02021BE8 ; =_021D21F4
	ldr r0, [r0]
	cmp r0, #0
	bne _02021BDE
	bl GF_AssertFail
_02021BDE:
	ldr r1, _02021BE8 ; =_021D21F4
	mov r2, #0
	ldr r0, [r1]
	str r2, [r1]
	pop {r3, pc}
	.balign 4, 0
_02021BE8: .word _021D21F4
	thumb_func_end sub_02021BD0

	thumb_func_start sub_02021BEC
sub_02021BEC: ; 0x02021BEC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02021C04 ; =_021D21F4
	ldr r0, [r0]
	cmp r0, #0
	beq _02021BFC
	bl GF_AssertFail
_02021BFC:
	ldr r0, _02021C04 ; =_021D21F4
	str r4, [r0]
	pop {r4, pc}
	nop
_02021C04: .word _021D21F4
	thumb_func_end sub_02021BEC

	thumb_func_start sub_02021C08
sub_02021C08: ; 0x02021C08
	mov r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	strb r2, [r0, #8]
	sub r1, r2, #1
	str r1, [r0, #0xc]
	str r2, [r0, #0x34]
	add r1, r0, #0
	str r2, [r0, #0x38]
	add r1, #0x3c
	strb r2, [r1]
	str r2, [r0, #0x40]
	ldr r3, _02021C28 ; =NNS_G2dInitImageProxy
	add r0, #0x10
	bx r3
	nop
_02021C28: .word NNS_G2dInitImageProxy
	thumb_func_end sub_02021C08

	thumb_func_start sub_02021C2C
sub_02021C2C: ; 0x02021C2C
	ldr r2, [r0]
	str r2, [r1]
	ldr r2, [r0, #8]
	str r2, [r1, #0xc]
	ldr r2, [r0, #4]
	str r2, [r1, #4]
	ldr r2, [r1]
	ldr r2, [r2, #0xc]
	lsr r2, r2, #8
	strb r2, [r1, #8]
	ldr r0, [r0, #0xc]
	str r0, [r1, #0x44]
	mov r0, #0
	str r0, [r1, #0x48]
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	mov r0, #1
	bx lr
	thumb_func_end sub_02021C2C

	thumb_func_start sub_02021C50
sub_02021C50: ; 0x02021C50
	push {r3, r4, r5, r6}
	ldr r2, _02021C98 ; =_021D21F4
	mov r1, #0
	ldr r5, [r2]
	ldr r4, [r5, #4]
	cmp r4, #0
	ble _02021C82
	ldr r2, [r5]
	add r3, r1, #0
_02021C62:
	add r6, r2, #0
	add r6, #0x3c
	ldrb r6, [r6]
	cmp r6, #0
	beq _02021C76
	ldr r6, [r5]
	add r6, r6, r3
	add r6, #0x10
	cmp r6, r0
	beq _02021C82
_02021C76:
	ldr r6, [r5, #4]
	add r1, r1, #1
	add r2, #0x54
	add r3, #0x54
	cmp r1, r6
	blt _02021C62
_02021C82:
	cmp r1, r4
	blt _02021C8C
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
_02021C8C:
	mov r0, #0x54
	ldr r2, [r5]
	mul r0, r1
	add r0, r2, r0
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_02021C98: .word _021D21F4
	thumb_func_end sub_02021C50

	thumb_func_start sub_02021C9C
sub_02021C9C: ; 0x02021C9C
	push {r3, lr}
	ldrb r1, [r0, #8]
	mov r2, #1
	cmp r1, #0
	beq _02021CAE
	mov r1, #2
	add r0, #0x3c
	strb r1, [r0]
	b _02021CC8
_02021CAE:
	add r1, r0, #0
	add r1, #0x3c
	strb r2, [r1]
	ldr r1, [r0, #0x44]
	cmp r1, #0
	bne _02021CC2
	bl sub_02021CCC
	add r2, r0, #0
	b _02021CC8
_02021CC2:
	bl sub_02021D00
	add r2, r0, #0
_02021CC8:
	add r0, r2, #0
	pop {r3, pc}
	thumb_func_end sub_02021C9C

	thumb_func_start sub_02021CCC
sub_02021CCC: ; 0x02021CCC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x10]
	add r2, sp, #4
	add r3, sp, #0
	bl sub_020224C0
	add r4, r0, #0
	beq _02021CF8
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r5, #0
	bl sub_02021DD0
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x10]
	bl sub_02022510
_02021CF8:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02021CCC

	thumb_func_start sub_02021D00
sub_02021D00: ; 0x02021D00
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	add r0, sp, #0xc
	str r0, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	ldr r3, [r4]
	ldr r0, [r4, #4]
	ldr r3, [r3, #0x10]
	add r1, sp, #0x14
	add r2, sp, #0x10
	bl sub_02021DE4
	cmp r0, #0
	bne _02021D26
	add sp, #0x18
	mov r0, #0
	pop {r4, pc}
_02021D26:
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl sub_02021E90
	mov r0, #1
	str r0, [r4, #0x48]
	ldr r0, [sp, #0xc]
	str r0, [r4, #0x4c]
	ldr r0, [sp, #8]
	str r0, [r4, #0x50]
	add r0, r4, #0
	bl sub_02021F28
	ldr r0, [sp, #8]
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0xc]
	bl sub_02021EC0
	mov r0, #1
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end sub_02021D00

	thumb_func_start sub_02021D58
sub_02021D58: ; 0x02021D58
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x48]
	cmp r1, #0
	beq _02021D66
	bl sub_020223C4
_02021D66:
	add r0, r4, #0
	bl sub_02021C08
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02021D58

	thumb_func_start sub_02021D70
sub_02021D70: ; 0x02021D70
	push {r4, r5}
	ldr r2, _02021DA4 ; =_021D21F4
	mov r1, #0
	ldr r5, [r2]
	ldr r2, [r5, #4]
	cmp r2, #0
	ble _02021D9C
	ldr r2, [r5]
	add r4, r2, #0
_02021D82:
	ldr r3, [r4, #0xc]
	cmp r0, r3
	bne _02021D92
	mov r0, #0x54
	mul r0, r1
	add r0, r2, r0
	pop {r4, r5}
	bx lr
_02021D92:
	ldr r3, [r5, #4]
	add r1, r1, #1
	add r4, #0x54
	cmp r1, r3
	blt _02021D82
_02021D9C:
	mov r0, #0
	pop {r4, r5}
	bx lr
	nop
_02021DA4: .word _021D21F4
	thumb_func_end sub_02021D70

	thumb_func_start sub_02021DA8
sub_02021DA8: ; 0x02021DA8
	cmp r1, #1
	bne _02021DB4
	mov r1, #1
	lsl r1, r1, #0x1a
	ldr r2, [r1]
	b _02021DB8
_02021DB4:
	ldr r1, _02021DC8 ; =0x04001000
	ldr r2, [r1]
_02021DB8:
	ldr r1, _02021DCC ; =0x00300010
	and r2, r1
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bx lr
	nop
_02021DC8: .word 0x04001000
_02021DCC: .word 0x00300010
	thumb_func_end sub_02021DA8

	thumb_func_start sub_02021DD0
sub_02021DD0: ; 0x02021DD0
	push {r3, lr}
	str r1, [r0, #0x34]
	str r2, [r0, #0x38]
	ldrb r1, [r0, #8]
	cmp r1, #0
	bne _02021DE0
	bl sub_02021F28
_02021DE0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02021DD0

	thumb_func_start sub_02021DE4
sub_02021DE4: ; 0x02021DE4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [sp, #0x1c]
	add r6, r2, #0
	str r0, [sp, #0x1c]
	mov r2, #1
	add r0, r5, #0
	add r4, r1, #0
	str r3, [sp]
	ldr r7, [sp, #0x18]
	tst r0, r2
	beq _02021E3C
	ldr r1, _02021E8C ; =_021D21F4
	add r0, r3, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x2c]
	bl sub_02022488
	ldr r1, _02021E8C ; =_021D21F4
	str r0, [r7]
	ldr r1, [r1]
	ldr r1, [r1, #0x2c]
	bl sub_020224A8
	ldr r1, _02021E8C ; =_021D21F4
	ldr r1, [r1]
	ldr r1, [r1, #0x34]
	bl sub_020222EC
	mov r1, #0
	mvn r1, r1
	str r0, [r4]
	cmp r0, r1
	bne _02021E30
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02021E30:
	ldr r1, _02021E8C ; =_021D21F4
	ldr r1, [r1]
	ldr r1, [r1, #0x2c]
	bl sub_020224B8
	str r0, [r4]
_02021E3C:
	mov r0, #2
	tst r0, r5
	beq _02021E86
	ldr r1, _02021E8C ; =_021D21F4
	ldr r0, [sp]
	ldr r1, [r1]
	mov r2, #1
	ldr r1, [r1, #0x30]
	bl sub_02022488
	ldr r1, [sp, #0x1c]
	str r0, [r1]
	ldr r1, _02021E8C ; =_021D21F4
	ldr r1, [r1]
	ldr r1, [r1, #0x30]
	bl sub_020224A8
	ldr r1, _02021E8C ; =_021D21F4
	ldr r1, [r1]
	ldr r1, [r1, #0x38]
	bl sub_020222EC
	mov r1, #0
	mvn r1, r1
	str r0, [r6]
	cmp r0, r1
	bne _02021E7A
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02021E7A:
	ldr r1, _02021E8C ; =_021D21F4
	ldr r1, [r1]
	ldr r1, [r1, #0x30]
	bl sub_020224B8
	str r0, [r6]
_02021E86:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02021E8C: .word _021D21F4
	thumb_func_end sub_02021DE4

	thumb_func_start sub_02021E90
sub_02021E90: ; 0x02021E90
	push {r3, r4}
	ldr r4, [r0, #4]
	mov r3, #1
	tst r3, r4
	beq _02021EA4
	ldr r3, _02021EBC ; =_021D21F4
	ldr r3, [r3]
	ldr r3, [r3, #0x1c]
	add r1, r1, r3
	str r1, [r0, #0x34]
_02021EA4:
	ldr r3, [r0, #4]
	mov r1, #2
	tst r1, r3
	beq _02021EB6
	ldr r1, _02021EBC ; =_021D21F4
	ldr r1, [r1]
	ldr r1, [r1, #0x20]
	add r1, r2, r1
	str r1, [r0, #0x38]
_02021EB6:
	pop {r3, r4}
	bx lr
	nop
_02021EBC: .word _021D21F4
	thumb_func_end sub_02021E90

	thumb_func_start sub_02021EC0
sub_02021EC0: ; 0x02021EC0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #1
	add r4, r1, #0
	add r6, r2, #0
	tst r0, r5
	beq _02021EF4
	ldr r1, _02021F24 ; =_021D21F4
	add r0, r3, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x2c]
	bl sub_020224A8
	ldr r1, _02021F24 ; =_021D21F4
	add r7, r0, #0
	ldr r1, [r1]
	add r0, r4, #0
	ldr r1, [r1, #0x2c]
	bl sub_020224A8
	ldr r2, _02021F24 ; =_021D21F4
	add r1, r7, #0
	ldr r2, [r2]
	ldr r2, [r2, #0x34]
	bl sub_02022290
_02021EF4:
	mov r0, #2
	tst r0, r5
	beq _02021F20
	ldr r1, _02021F24 ; =_021D21F4
	ldr r0, [sp, #0x18]
	ldr r1, [r1]
	ldr r1, [r1, #0x30]
	bl sub_020224A8
	ldr r1, _02021F24 ; =_021D21F4
	add r4, r0, #0
	ldr r1, [r1]
	add r0, r6, #0
	ldr r1, [r1, #0x30]
	bl sub_020224A8
	ldr r2, _02021F24 ; =_021D21F4
	add r1, r4, #0
	ldr r2, [r2]
	ldr r2, [r2, #0x38]
	bl sub_02022290
_02021F20:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02021F24: .word _021D21F4
	thumb_func_end sub_02021EC0

	thumb_func_start sub_02021F28
sub_02021F28: ; 0x02021F28
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x10
	bl NNS_G2dInitImageProxy
	ldr r1, [r4, #4]
	cmp r1, #3
	beq _02021F40
	add r0, r4, #0
	bl sub_02021F54
	pop {r4, pc}
_02021F40:
	add r0, r4, #0
	mov r1, #1
	bl sub_02021F54
	add r0, r4, #0
	mov r1, #2
	bl sub_02021F54
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02021F28

	thumb_func_start sub_02021F54
sub_02021F54: ; 0x02021F54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x40]
	add r4, r1, #0
	cmp r2, #0
	beq _02021F66
	bl sub_02021DA8
	b _02021F68
_02021F66:
	add r0, r4, #0
_02021F68:
	cmp r4, #1
	bne _02021F76
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r5, #0x34]
	ldr r2, [r2]
	b _02021F7C
_02021F76:
	ldr r2, _02021FAC ; =0x04001000
	ldr r1, [r5, #0x38]
	ldr r2, [r2]
_02021F7C:
	cmp r0, #0
	ldr r0, [r5]
	bne _02021F8E
	add r5, #0x10
	add r2, r4, #0
	add r3, r5, #0
	bl NNS_G2dLoadImage2DMapping
	b _02021F98
_02021F8E:
	add r5, #0x10
	add r2, r4, #0
	add r3, r5, #0
	bl NNS_G2dLoadImage1DMapping
_02021F98:
	cmp r4, #1
	bne _02021FA4
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
_02021FA4:
	ldr r0, _02021FAC ; =0x04001000
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
	nop
_02021FAC: .word 0x04001000
	thumb_func_end sub_02021F54

	thumb_func_start sub_02021FB0
sub_02021FB0: ; 0x02021FB0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x10
	bl NNS_G2dInitImageProxy
	ldr r1, [r4, #4]
	cmp r1, #3
	beq _02021FC8
	add r0, r4, #0
	bl sub_02021FDC
	pop {r4, pc}
_02021FC8:
	add r0, r4, #0
	mov r1, #1
	bl sub_02021FDC
	add r0, r4, #0
	mov r1, #2
	bl sub_02021FDC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02021FB0

	thumb_func_start sub_02021FDC
sub_02021FDC: ; 0x02021FDC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x40]
	add r4, r1, #0
	cmp r2, #0
	beq _02021FEC
	bl sub_02021DA8
_02021FEC:
	cmp r4, #1
	bne _02021FFA
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r1, [r5, #0x34]
	ldr r0, [r0]
	b _02022000
_02021FFA:
	ldr r0, _02022020 ; =0x04001000
	ldr r1, [r5, #0x38]
	ldr r0, [r0]
_02022000:
	ldr r0, [r5]
	add r5, #0x10
	add r2, r4, #0
	add r3, r5, #0
	bl NNS_G2dLoadImageVramTransfer
	cmp r4, #1
	bne _02022018
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
_02022018:
	ldr r0, _02022020 ; =0x04001000
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
	nop
_02022020: .word 0x04001000
	thumb_func_end sub_02021FDC

	thumb_func_start sub_02022024
sub_02022024: ; 0x02022024
	push {r3, r4}
	ldr r1, _0202205C ; =_021D21F4
	mov r0, #0
	ldr r4, [r1]
	ldr r1, [r4, #4]
	cmp r1, #0
	ble _02022054
	ldr r1, [r4]
	add r3, r1, #0
_02022036:
	add r2, r3, #0
	add r2, #0x3c
	ldrb r2, [r2]
	cmp r2, #0
	bne _0202204A
	mov r2, #0x54
	mul r2, r0
	add r0, r1, r2
	pop {r3, r4}
	bx lr
_0202204A:
	ldr r2, [r4, #4]
	add r0, r0, #1
	add r3, #0x54
	cmp r0, r2
	blt _02022036
_02022054:
	mov r0, #0
	pop {r3, r4}
	bx lr
	nop
_0202205C: .word _021D21F4
	thumb_func_end sub_02022024

	thumb_func_start sub_02022060
sub_02022060: ; 0x02022060
	push {r3, lr}
	bl GX_GetBankForOBJ
	cmp r0, #0x30
	bgt _02022090
	bge _020220D8
	cmp r0, #0x10
	bgt _0202208A
	bge _020220CC
	cmp r0, #3
	bhi _02022108
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02022082: ; jump table
	.short _020220AA - _02022082 - 2 ; case 0
	.short _020220F0 - _02022082 - 2 ; case 1
	.short _020220F0 - _02022082 - 2 ; case 2
	.short _020220FC - _02022082 - 2 ; case 3
_0202208A:
	cmp r0, #0x20
	beq _020220B4
	b _02022108
_02022090:
	cmp r0, #0x50
	bgt _0202209C
	bge _020220D8
	cmp r0, #0x40
	beq _020220B4
	b _02022108
_0202209C:
	cmp r0, #0x60
	bgt _020220A4
	beq _020220C0
	b _02022108
_020220A4:
	cmp r0, #0x70
	beq _020220E4
	b _02022108
_020220AA:
	ldr r0, _020221B0 ; =_021D21F4
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02022110
_020220B4:
	ldr r0, _020221B0 ; =_021D21F4
	mov r1, #1
	ldr r0, [r0]
	lsl r1, r1, #0xe
	str r1, [r0, #0x14]
	b _02022110
_020220C0:
	ldr r0, _020221B0 ; =_021D21F4
	mov r1, #2
	ldr r0, [r0]
	lsl r1, r1, #0xe
	str r1, [r0, #0x14]
	b _02022110
_020220CC:
	ldr r0, _020221B0 ; =_021D21F4
	mov r1, #1
	ldr r0, [r0]
	lsl r1, r1, #0x10
	str r1, [r0, #0x14]
	b _02022110
_020220D8:
	ldr r0, _020221B0 ; =_021D21F4
	mov r1, #5
	ldr r0, [r0]
	lsl r1, r1, #0xe
	str r1, [r0, #0x14]
	b _02022110
_020220E4:
	ldr r0, _020221B0 ; =_021D21F4
	mov r1, #6
	ldr r0, [r0]
	lsl r1, r1, #0xe
	str r1, [r0, #0x14]
	b _02022110
_020220F0:
	ldr r0, _020221B0 ; =_021D21F4
	mov r1, #2
	ldr r0, [r0]
	lsl r1, r1, #0x10
	str r1, [r0, #0x14]
	b _02022110
_020220FC:
	ldr r0, _020221B0 ; =_021D21F4
	mov r1, #1
	ldr r0, [r0]
	lsl r1, r1, #0x12
	str r1, [r0, #0x14]
	b _02022110
_02022108:
	ldr r0, _020221B0 ; =_021D21F4
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x14]
_02022110:
	bl GX_GetBankForSubOBJ
	cmp r0, #0
	beq _02022126
	cmp r0, #8
	beq _0202213A
	mov r1, #1
	lsl r1, r1, #8
	cmp r0, r1
	beq _02022130
	b _02022146
_02022126:
	ldr r0, _020221B0 ; =_021D21F4
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x18]
	b _0202214E
_02022130:
	ldr r0, _020221B0 ; =_021D21F4
	lsl r1, r1, #6
	ldr r0, [r0]
	str r1, [r0, #0x18]
	b _0202214E
_0202213A:
	ldr r0, _020221B0 ; =_021D21F4
	mov r1, #2
	ldr r0, [r0]
	lsl r1, r1, #0x10
	str r1, [r0, #0x18]
	b _0202214E
_02022146:
	ldr r0, _020221B0 ; =_021D21F4
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x18]
_0202214E:
	ldr r0, _020221B0 ; =_021D21F4
	ldr r1, [r0]
	ldr r0, [r1, #0x24]
	ldr r1, [r1, #0x2c]
	bl sub_020224B8
	ldr r1, _020221B0 ; =_021D21F4
	ldr r3, [r1]
	ldr r2, [r3, #0x14]
	sub r0, r2, r0
	str r0, [r3, #0x1c]
	ldr r1, [r1]
	ldr r0, [r1, #0x28]
	ldr r1, [r1, #0x30]
	bl sub_020224B8
	ldr r1, _020221B0 ; =_021D21F4
	ldr r3, [r1]
	ldr r2, [r3, #0x18]
	sub r0, r2, r0
	str r0, [r3, #0x20]
	ldr r1, [r1]
	mov r2, #0
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	blt _0202218A
	ldr r0, [r1, #0x20]
	cmp r0, #0
	blt _0202218A
	mov r2, #1
_0202218A:
	cmp r2, #0
	bne _02022192
	bl GF_AssertFail
_02022192:
	ldr r0, _020221B0 ; =_021D21F4
	mov r2, #0
	ldr r1, [r0]
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	blt _020221A6
	ldr r0, [r1, #0x20]
	cmp r0, #0
	blt _020221A6
	mov r2, #1
_020221A6:
	cmp r2, #0
	bne _020221AE
	bl GF_AssertFail
_020221AE:
	pop {r3, pc}
	.balign 4, 0
_020221B0: .word _021D21F4
	thumb_func_end sub_02022060

	thumb_func_start sub_020221B4
sub_020221B4: ; 0x020221B4
	push {r3, lr}
	ldr r0, _020221CC ; =_021D21F4
	ldr r0, [r0]
	ldr r0, [r0, #0x34]
	bl sub_02022278
	ldr r0, _020221CC ; =_021D21F4
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	bl sub_02022278
	pop {r3, pc}
	.balign 4, 0
_020221CC: .word _021D21F4
	thumb_func_end sub_020221B4

	thumb_func_start sub_020221D0
sub_020221D0: ; 0x020221D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _02022234 ; =_021D21F4
	add r4, r1, #0
	ldr r1, [r0]
	add r6, r2, #0
	str r5, [r1, #0x24]
	ldr r1, [r0]
	str r4, [r1, #0x28]
	ldr r0, [r0]
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq _020221EE
	bl FreeToHeap
_020221EE:
	ldr r0, _02022234 ; =_021D21F4
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	cmp r0, #0
	beq _020221FC
	bl FreeToHeap
_020221FC:
	ldr r0, _02022234 ; =_021D21F4
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _02022214
	add r0, r6, #0
	lsr r1, r5, #3
	bl AllocFromHeap
	ldr r1, _02022234 ; =_021D21F4
	ldr r1, [r1]
	str r0, [r1, #0x34]
_02022214:
	ldr r0, _02022234 ; =_021D21F4
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	cmp r0, #0
	beq _0202222C
	add r0, r6, #0
	lsr r1, r4, #3
	bl AllocFromHeap
	ldr r1, _02022234 ; =_021D21F4
	ldr r1, [r1]
	str r0, [r1, #0x38]
_0202222C:
	bl sub_020221B4
	pop {r4, r5, r6, pc}
	nop
_02022234: .word _021D21F4
	thumb_func_end sub_020221D0

	thumb_func_start sub_02022238
sub_02022238: ; 0x02022238
	push {r3, lr}
	cmp r0, #0
	beq _0202225A
	ldr r1, _0202225C ; =_021D21F4
	ldr r2, [r1]
	ldr r1, [r2, #0x34]
	cmp r0, r1
	bne _02022252
	mov r1, #0
	str r1, [r2, #0x24]
	bl FreeToHeap
	pop {r3, pc}
_02022252:
	mov r1, #0
	str r1, [r2, #0x28]
	bl FreeToHeap
_0202225A:
	pop {r3, pc}
	.balign 4, 0
_0202225C: .word _021D21F4
	thumb_func_end sub_02022238

	thumb_func_start sub_02022260
sub_02022260: ; 0x02022260
	ldr r1, _02022274 ; =_021D21F4
	ldr r2, [r1]
	ldr r1, [r2, #0x34]
	cmp r0, r1
	bne _0202226E
	ldr r0, [r2, #0x24]
	bx lr
_0202226E:
	ldr r0, [r2, #0x28]
	bx lr
	nop
_02022274: .word _021D21F4
	thumb_func_end sub_02022260

	thumb_func_start sub_02022278
sub_02022278: ; 0x02022278
	push {r4, lr}
	add r4, r0, #0
	beq _0202228E
	bl sub_02022260
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	lsr r2, r2, #3
	bl memset
_0202228E:
	pop {r4, pc}
	thumb_func_end sub_02022278

	thumb_func_start sub_02022290
sub_02022290: ; 0x02022290
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	beq _020222E6
	add r0, r4, #0
	bl sub_02022260
	add r6, r5, r6
	add r7, r0, #0
	cmp r5, r6
	bhs _020222E6
_020222AA:
	cmp r5, r7
	bhs _020222E6
	add r0, r5, #0
	add r1, sp, #4
	add r2, sp, #0
	bl sub_02022560
	add r0, sp, #0
	ldrb r1, [r0]
	mov r0, #1
	lsl r0, r1
	ldr r1, [sp, #4]
	ldrb r1, [r4, r1]
	tst r0, r1
	beq _020222CC
	bl GF_AssertFail
_020222CC:
	add r2, sp, #0
	ldrb r3, [r2]
	ldr r1, [sp, #4]
	mov r2, #1
	lsl r2, r3
	lsl r2, r2, #0x18
	ldrb r0, [r4, r1]
	lsr r2, r2, #0x18
	add r5, r5, #1
	orr r0, r2
	strb r0, [r4, r1]
	cmp r5, r6
	blo _020222AA
_020222E6:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02022290

	thumb_func_start sub_020222EC
sub_020222EC: ; 0x020222EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	str r1, [sp]
	cmp r1, #0
	beq _0202236A
	add r0, r1, #0
	bl sub_02022260
	mov r6, #0
	str r0, [sp, #4]
	cmp r0, #0
	bls _0202236A
_02022306:
	add r0, r6, #0
	add r1, sp, #0xc
	add r2, sp, #8
	bl sub_02022560
	add r0, sp, #8
	ldrb r1, [r0]
	mov r0, #1
	mov r4, #0
	lsl r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	b _02022348
_02022320:
	add r5, r6, r4
	add r0, r5, #0
	add r1, sp, #0xc
	add r2, sp, #8
	bl sub_02022560
	add r0, sp, #8
	ldrb r1, [r0]
	mov r0, #1
	lsl r0, r1
	lsl r0, r0, #0x18
	ldr r1, [sp, #4]
	lsr r0, r0, #0x18
	cmp r5, r1
	blo _02022346
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02022346:
	add r4, r4, #1
_02022348:
	ldr r2, [sp, #0xc]
	ldr r1, [sp]
	ldrb r1, [r1, r2]
	tst r0, r1
	bne _02022356
	cmp r4, r7
	bls _02022320
_02022356:
	cmp r4, r7
	bls _02022360
	add sp, #0x10
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02022360:
	add r0, r6, r4
	add r6, r0, #1
	ldr r0, [sp, #4]
	cmp r6, r0
	blo _02022306
_0202236A:
	mov r0, #0
	mvn r0, r0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020222EC

	thumb_func_start sub_02022374
sub_02022374: ; 0x02022374
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r2, #0
	beq _020223BE
	add r6, r5, r1
	cmp r5, r6
	bhs _020223BE
	add r7, sp, #0
_02022386:
	add r0, r5, #0
	add r1, sp, #4
	add r2, sp, #0
	bl sub_02022560
	ldrb r1, [r7]
	mov r0, #1
	lsl r0, r1
	ldr r1, [sp, #4]
	ldrb r1, [r4, r1]
	tst r0, r1
	bne _020223A2
	bl GF_AssertFail
_020223A2:
	ldrb r0, [r7]
	mov r1, #1
	ldr r3, [sp, #4]
	lsl r1, r0
	mov r0, #0xff
	eor r0, r1
	lsl r0, r0, #0x18
	ldrb r2, [r4, r3]
	lsr r0, r0, #0x18
	add r5, r5, #1
	and r0, r2
	strb r0, [r4, r3]
	cmp r5, r6
	blo _02022386
_020223BE:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02022374

	thumb_func_start sub_020223C4
sub_020223C4: ; 0x020223C4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #1
	tst r0, r1
	beq _02022402
	add r0, r4, #0
	add r0, #0x10
	bl NNS_G2dGetImageLocation
	ldr r1, _02022444 ; =_021D21F4
	ldr r2, [r1]
	ldr r1, [r2, #0x1c]
	sub r0, r0, r1
	ldr r1, [r2, #0x2c]
	bl sub_020224A8
	ldr r1, _02022444 ; =_021D21F4
	add r5, r0, #0
	ldr r1, [r1]
	ldr r0, [r4, #0x4c]
	ldr r1, [r1, #0x2c]
	bl sub_020224A8
	ldr r2, _02022444 ; =_021D21F4
	add r1, r0, #0
	ldr r2, [r2]
	add r0, r5, #0
	ldr r2, [r2, #0x34]
	bl sub_02022374
_02022402:
	ldr r0, [r4, #4]
	mov r1, #2
	tst r0, r1
	beq _0202243C
	add r0, r4, #0
	add r0, #0x10
	bl NNS_G2dGetImageLocation
	ldr r1, _02022444 ; =_021D21F4
	ldr r2, [r1]
	ldr r1, [r2, #0x20]
	sub r0, r0, r1
	ldr r1, [r2, #0x30]
	bl sub_020224A8
	ldr r1, _02022444 ; =_021D21F4
	add r5, r0, #0
	ldr r1, [r1]
	ldr r0, [r4, #0x50]
	ldr r1, [r1, #0x30]
	bl sub_020224A8
	ldr r2, _02022444 ; =_021D21F4
	add r1, r0, #0
	ldr r2, [r2]
	add r0, r5, #0
	ldr r2, [r2, #0x38]
	bl sub_02022374
_0202243C:
	mov r0, #0
	str r0, [r4, #0x48]
	pop {r3, r4, r5, pc}
	nop
_02022444: .word _021D21F4
	thumb_func_end sub_020223C4

	thumb_func_start sub_02022448
sub_02022448: ; 0x02022448
	ldr r1, _0202247C ; =0x00100010
	cmp r0, r1
	bgt _02022456
	bge _0202246C
	cmp r0, #0x10
	beq _02022468
	b _02022478
_02022456:
	ldr r1, _02022480 ; =0x00200010
	cmp r0, r1
	bgt _02022460
	beq _02022470
	b _02022478
_02022460:
	ldr r1, _02022484 ; =0x00300010
	cmp r0, r1
	beq _02022474
	b _02022478
_02022468:
	mov r0, #1
	bx lr
_0202246C:
	mov r0, #2
	bx lr
_02022470:
	mov r0, #4
	bx lr
_02022474:
	mov r0, #8
	bx lr
_02022478:
	mov r0, #1
	bx lr
	.balign 4, 0
_0202247C: .word 0x00100010
_02022480: .word 0x00200010
_02022484: .word 0x00300010
	thumb_func_end sub_02022448

	thumb_func_start sub_02022488
sub_02022488: ; 0x02022488
	push {r4, r5, r6, lr}
	add r4, r1, #0
	lsl r4, r4, #5
	add r1, r4, #0
	add r5, r0, #0
	add r6, r2, #0
	bl _s32_div_f
	cmp r1, #0
	beq _020224A4
	sub r5, r5, r1
	cmp r6, #1
	bne _020224A4
	add r5, r5, r4
_020224A4:
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02022488

	thumb_func_start sub_020224A8
sub_020224A8: ; 0x020224A8
	asr r2, r0, #4
	lsr r2, r2, #0x1b
	add r2, r0, r2
	ldr r3, _020224B4 ; =_s32_div_f
	asr r0, r2, #5
	bx r3
	.balign 4, 0
_020224B4: .word _s32_div_f
	thumb_func_end sub_020224A8

	thumb_func_start sub_020224B8
sub_020224B8: ; 0x020224B8
	mul r1, r0
	lsl r0, r1, #5
	bx lr
	.balign 4, 0
	thumb_func_end sub_020224B8

	thumb_func_start sub_020224C0
sub_020224C0: ; 0x020224C0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r1, r2, #0
	mov r0, #1
	add r2, r4, #0
	add r7, r3, #0
	tst r2, r0
	beq _020224EA
	ldr r2, _0202250C ; =_021D21F4
	ldr r2, [r2]
	ldr r6, [r2, #0xc]
	ldr r2, [r2, #0x1c]
	add r3, r6, r5
	cmp r3, r2
	bls _020224E8
	bl GF_AssertFail
	mov r0, #0
	b _020224EA
_020224E8:
	str r6, [r1]
_020224EA:
	mov r1, #2
	tst r1, r4
	beq _02022508
	ldr r1, _0202250C ; =_021D21F4
	ldr r1, [r1]
	ldr r3, [r1, #0x10]
	ldr r1, [r1, #0x20]
	add r2, r3, r5
	cmp r2, r1
	bls _02022506
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02022506:
	str r3, [r7]
_02022508:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202250C: .word _021D21F4
	thumb_func_end sub_020224C0

	thumb_func_start sub_02022510
sub_02022510: ; 0x02022510
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r2, #1
	add r0, r4, #0
	tst r0, r2
	beq _02022538
	ldr r0, _0202255C ; =_021D21F4
	ldr r3, [r0]
	ldr r1, [r3, #0xc]
	add r1, r1, r5
	str r1, [r3, #0xc]
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	ldr r1, [r1, #0x2c]
	bl sub_02022488
	ldr r1, _0202255C ; =_021D21F4
	ldr r1, [r1]
	str r0, [r1, #0xc]
_02022538:
	mov r0, #2
	tst r0, r4
	beq _0202255A
	ldr r0, _0202255C ; =_021D21F4
	ldr r2, [r0]
	ldr r1, [r2, #0x10]
	add r1, r1, r5
	str r1, [r2, #0x10]
	ldr r1, [r0]
	mov r2, #1
	ldr r0, [r1, #0x10]
	ldr r1, [r1, #0x30]
	bl sub_02022488
	ldr r1, _0202255C ; =_021D21F4
	ldr r1, [r1]
	str r0, [r1, #0x10]
_0202255A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202255C: .word _021D21F4
	thumb_func_end sub_02022510

	thumb_func_start sub_02022560
sub_02022560: ; 0x02022560
	asr r3, r0, #3
	str r3, [r1]
	mov r1, #7
	and r0, r1
	strb r0, [r2]
	bx lr
	thumb_func_end sub_02022560

	thumb_func_start sub_0202256C
sub_0202256C: ; 0x0202256C
	push {r3, r4}
	sub r0, r1, r0
	ldr r4, [sp, #8]
	str r0, [r3]
	bpl _02022582
	add r0, r2, r0
	str r0, [r4]
	mov r0, #0
	str r0, [r3]
	pop {r3, r4}
	bx lr
_02022582:
	str r2, [r4]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_0202256C
