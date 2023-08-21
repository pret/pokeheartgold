	.include "asm/macros.inc"
	.include "unk_02037C94.inc"
	.include "global.inc"

	.bss

_021D4150:
	.space 0x4

	.rodata

_020F6A90:
	.word sub_0203827C
	.word sub_02038398
	.word 0

	.data

	.balign 4, 0
_0210F904:
	.asciz " GAME"
	.balign 4, 0
_0210F90C:
	.asciz "FREAK"
	.balign 4, 0
_0210F914:
	.asciz " FULL"

	.text

	thumb_func_start sub_02037C94
sub_02037C94: ; 0x02037C94
	mov r0, #0x46
	bx lr
	thumb_func_end sub_02037C94

	thumb_func_start sub_02037C98
sub_02037C98: ; 0x02037C98
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02037D28 ; =_021D4150
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _02037D24
	cmp r5, #0
	bne _02037CAE
	bl GF_AssertFail
_02037CAE:
	bl sub_02034D8C
	mov r0, #0xf
	mov r1, #0x68
	bl AllocFromHeap
	ldr r1, _02037D28 ; =_021D4150
	mov r2, #0x68
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _02037D28 ; =_021D4150
	mov r2, #0x32
	ldr r1, [r0]
	str r2, [r1, #0x44]
	ldr r1, [r0]
	mov r2, #1
	add r1, #0x52
	strb r2, [r1]
	ldr r0, [r0]
	str r5, [r0, #0x28]
	add r0, r5, #0
	bl Save_PlayerData_GetProfileAddr
	ldr r1, _02037D28 ; =_021D4150
	ldr r2, [r1]
	str r0, [r2, #0x2c]
	ldr r0, [r1]
	mov r2, #2
	add r0, #0x4a
	strb r2, [r0]
	ldr r0, [r1]
	mov r2, #0
	add r0, #0x4c
	strb r2, [r0]
	ldr r0, [r1]
	add r0, #0x57
	strb r2, [r0]
	ldr r0, [r1]
	add r0, #0x4e
	strb r4, [r0]
	ldr r0, [r1]
	add r0, #0xc
	bl sub_0203778C
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	bl sub_0203410C
	cmp r4, #9
	beq _02037D24
	cmp r4, #0x11
	beq _02037D24
	cmp r4, #0xf
	beq _02037D24
	bl sub_0203A880
_02037D24:
	pop {r3, r4, r5, pc}
	nop
_02037D28: .word _021D4150
	thumb_func_end sub_02037C98

	thumb_func_start sub_02037D2C
sub_02037D2C: ; 0x02037D2C
	push {r3, lr}
	ldr r0, _02037D74 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _02037D72
	bl sub_02034154
	ldr r0, _02037D74 ; =_021D4150
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	beq _02037D48
	bl FreeToHeap
_02037D48:
	bl sub_02039998
	cmp r0, #0
	beq _02037D56
	mov r0, #0x30
	bl DestroyHeap
_02037D56:
	bl sub_0203A914
	bl sub_02034DE0
	ldr r0, _02037D74 ; =_021D4150
	ldr r0, [r0]
	bl FreeToHeap
	mov r0, #0xf
	bl DestroyHeap
	ldr r0, _02037D74 ; =_021D4150
	mov r1, #0
	str r1, [r0]
_02037D72:
	pop {r3, pc}
	.balign 4, 0
_02037D74: .word _021D4150
	thumb_func_end sub_02037D2C

	thumb_func_start sub_02037D78
sub_02037D78: ; 0x02037D78
	ldr r0, _02037D88 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _02037D84
	mov r0, #1
	bx lr
_02037D84:
	mov r0, #0
	bx lr
	.balign 4, 0
_02037D88: .word _021D4150
	thumb_func_end sub_02037D78

	thumb_func_start sub_02037D8C
sub_02037D8C: ; 0x02037D8C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl sub_02037474
	cmp r0, #0
	bne _02037DC4
	ldr r2, _02037DC8 ; =0x00007080
	mov r0, #3
	mov r1, #0xf
	bl CreateHeapAtEnd
	add r0, r6, #0
	add r1, r7, #0
	bl sub_02037C98
	ldr r0, _02037DCC ; =_021D4150
	ldr r1, [r0]
	add r1, #0x4f
	strb r5, [r1]
	ldr r0, [r0]
	mov r1, #0
	str r4, [r0, #0x30]
	ldr r0, _02037DD0 ; =sub_02038218
	bl sub_020381C0
_02037DC4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02037DC8: .word 0x00007080
_02037DCC: .word _021D4150
_02037DD0: .word sub_02038218
	thumb_func_end sub_02037D8C

	thumb_func_start sub_02037DD4
sub_02037DD4: ; 0x02037DD4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl sub_02037474
	cmp r0, #0
	bne _02037E0C
	ldr r2, _02037E10 ; =0x00007080
	mov r0, #3
	mov r1, #0xf
	bl CreateHeapAtEnd
	add r0, r6, #0
	add r1, r7, #0
	bl sub_02037C98
	ldr r0, _02037E14 ; =_021D4150
	ldr r1, [r0]
	add r1, #0x4f
	strb r5, [r1]
	ldr r0, [r0]
	mov r1, #0
	str r4, [r0, #0x30]
	ldr r0, _02037E18 ; =sub_02038294
	bl sub_020381C0
_02037E0C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02037E10: .word 0x00007080
_02037E14: .word _021D4150
_02037E18: .word sub_02038294
	thumb_func_end sub_02037DD4

	thumb_func_start sub_02037E1C
sub_02037E1C: ; 0x02037E1C
	ldr r1, _02037E2C ; =_021D4150
	ldr r3, _02037E30 ; =sub_020381C0
	ldr r1, [r1]
	add r1, #0x4d
	strb r0, [r1]
	ldr r0, _02037E34 ; =sub_020382E4
	mov r1, #0
	bx r3
	.balign 4, 0
_02037E2C: .word _021D4150
_02037E30: .word sub_020381C0
_02037E34: .word sub_020382E4
	thumb_func_end sub_02037E1C

	thumb_func_start sub_02037E38
sub_02037E38: ; 0x02037E38
	push {r3, lr}
	bl sub_02036274
	ldr r0, _02037E48 ; =sub_020383B0
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02037E48: .word sub_020383B0
	thumb_func_end sub_02037E38

	thumb_func_start sub_02037E4C
sub_02037E4C: ; 0x02037E4C
	push {r3, lr}
	ldr r0, _02037E94 ; =_021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x40]
	cmp r0, #0
	ble _02037E5E
	sub r0, r0, #1
	str r0, [r1, #0x40]
	b _02037E64
_02037E5E:
	bne _02037E64
	bl sub_020399EC
_02037E64:
	ldr r0, _02037E94 ; =_021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _02037E72
	sub r0, r0, #1
	str r0, [r1, #0x44]
_02037E72:
	bl sub_02034FE8
	cmp r0, #0
	beq _02037E90
	ldr r0, _02037E94 ; =_021D4150
	ldr r0, [r0]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	bne _02037E90
	bl sub_02036024
	ldr r0, _02037E98 ; =sub_02038408
	mov r1, #0
	bl sub_020381C0
_02037E90:
	pop {r3, pc}
	nop
_02037E94: .word _021D4150
_02037E98: .word sub_02038408
	thumb_func_end sub_02037E4C

	thumb_func_start sub_02037E9C
sub_02037E9C: ; 0x02037E9C
	push {r3, lr}
	ldr r0, _02037EB4 ; =_021D4150
	ldr r1, [r0]
	cmp r1, #0
	beq _02037EB2
	ldr r0, _02037EB8 ; =0x00000708
	str r0, [r1, #0x40]
	ldr r0, _02037EBC ; =sub_02037E4C
	mov r1, #5
	bl sub_020381C0
_02037EB2:
	pop {r3, pc}
	.balign 4, 0
_02037EB4: .word _021D4150
_02037EB8: .word 0x00000708
_02037EBC: .word sub_02037E4C
	thumb_func_end sub_02037E9C

	thumb_func_start sub_02037EC0
sub_02037EC0: ; 0x02037EC0
	ldr r3, _02037EC4 ; =sub_02033A0C
	bx r3
	.balign 4, 0
_02037EC4: .word sub_02033A0C
	thumb_func_end sub_02037EC0

	thumb_func_start sub_02037EC8
sub_02037EC8: ; 0x02037EC8
	push {r4}
	sub sp, #0xc
	ldr r4, _02037F10 ; =_020F6A90
	add r3, sp, #0
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	ldr r0, _02037F14 ; =_021D4150
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	cmp r0, #0
	bne _02037EEC
	add sp, #0xc
	mov r0, #0
	pop {r4}
	bx lr
_02037EEC:
	ldr r0, [sp]
	cmp r0, #0
	beq _02037F08
_02037EF2:
	ldr r0, [r2]
	cmp r1, r0
	bne _02037F00
	add sp, #0xc
	mov r0, #1
	pop {r4}
	bx lr
_02037F00:
	add r2, r2, #4
	ldr r0, [r2]
	cmp r0, #0
	bne _02037EF2
_02037F08:
	mov r0, #0
	add sp, #0xc
	pop {r4}
	bx lr
	.balign 4, 0
_02037F10: .word _020F6A90
_02037F14: .word _021D4150
	thumb_func_end sub_02037EC8

	thumb_func_start sub_02037F18
sub_02037F18: ; 0x02037F18
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02037F58 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _02037F56
	ldr r2, _02037F5C ; =0x00007080
	mov r0, #3
	mov r1, #0xf
	bl CreateHeapAtEnd
	cmp r0, #0
	bne _02037F36
	bl sub_020399EC
_02037F36:
	add r0, r4, #0
	mov r1, #9
	bl sub_02037C98
	ldr r0, _02037F58 ; =_021D4150
	mov r2, #9
	ldr r1, [r0]
	add r1, #0x4e
	strb r2, [r1]
	ldr r0, [r0]
	mov r1, #0
	add r0, #0x4f
	strb r1, [r0]
	ldr r0, _02037F60 ; =sub_020384B4
	bl sub_020381C0
_02037F56:
	pop {r4, pc}
	.balign 4, 0
_02037F58: .word _021D4150
_02037F5C: .word 0x00007080
_02037F60: .word sub_020384B4
	thumb_func_end sub_02037F18

	thumb_func_start sub_02037F64
sub_02037F64: ; 0x02037F64
	push {r3, lr}
	ldr r1, _02037F8C ; =_021D4150
	ldr r2, [r1]
	add r2, #0x4d
	strb r0, [r2]
	ldr r0, [r1]
	mov r2, #3
	add r0, #0x48
	strh r2, [r0]
	mov r0, #1
	bl sub_02033AA4
	bl sub_0203A880
	ldr r0, _02037F90 ; =sub_02038668
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	nop
_02037F8C: .word _021D4150
_02037F90: .word sub_02038668
	thumb_func_end sub_02037F64

	thumb_func_start sub_02037F94
sub_02037F94: ; 0x02037F94
	ldr r0, _02037FC0 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _02037FA2
	mov r0, #0
	mvn r0, r0
	bx lr
_02037FA2:
	ldr r1, [r0, #0x24]
	ldr r0, _02037FC4 ; =sub_020387E8
	cmp r1, r0
	bne _02037FAE
	mov r0, #1
	bx lr
_02037FAE:
	ldr r0, _02037FC8 ; =sub_02038800
	cmp r1, r0
	bne _02037FB8
	mov r0, #1
	b _02037FBA
_02037FB8:
	mov r0, #0
_02037FBA:
	neg r0, r0
	bx lr
	nop
_02037FC0: .word _021D4150
_02037FC4: .word sub_020387E8
_02037FC8: .word sub_02038800
	thumb_func_end sub_02037F94

	thumb_func_start sub_02037FCC
sub_02037FCC: ; 0x02037FCC
	ldr r0, _02037FE8 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _02037FD8
	mov r0, #0
	bx lr
_02037FD8:
	ldr r1, [r0, #0x24]
	ldr r0, _02037FEC ; =sub_02038854
	cmp r1, r0
	bne _02037FE4
	mov r0, #1
	bx lr
_02037FE4:
	mov r0, #0
	bx lr
	.balign 4, 0
_02037FE8: .word _021D4150
_02037FEC: .word sub_02038854
	thumb_func_end sub_02037FCC

	thumb_func_start sub_02037FF0
sub_02037FF0: ; 0x02037FF0
	push {r3, lr}
	mov r0, #0
	bl sub_02033AA4
	ldr r0, _02038064 ; =_021D4150
	ldr r1, [r0]
	add r0, r1, #0
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #1
	bne _02038018
	add r0, r1, #0
	add r0, #0x54
	ldrb r0, [r0]
	cmp r0, #1
	bne _02038018
	add r1, #0x4e
	ldrb r0, [r1]
	cmp r0, #9
	bne _02038020
_02038018:
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
_02038020:
	bl sub_0203A914
	ldr r0, _02038064 ; =_021D4150
	mov r2, #9
	ldr r1, [r0]
	add r1, #0x4e
	strb r2, [r1]
	ldr r1, [r0]
	mov r2, #0
	add r1, #0x57
	strb r2, [r1]
	ldr r0, [r0]
	add r0, #0x4a
	ldrb r0, [r0]
	bl sub_02033908
	bl sub_0203769C
	cmp r0, #0
	bne _02038058
	mov r0, #1
	bl sub_02033ACC
	ldr r0, _02038068 ; =sub_02038418
	mov r1, #0xf
	bl sub_020381C0
	pop {r3, pc}
_02038058:
	ldr r0, _0203806C ; =sub_02038460
	mov r1, #5
	bl sub_020381C0
	pop {r3, pc}
	nop
_02038064: .word _021D4150
_02038068: .word sub_02038418
_0203806C: .word sub_02038460
	thumb_func_end sub_02037FF0

	thumb_func_start sub_02038070
sub_02038070: ; 0x02038070
	ldr r0, _0203808C ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _0203807C
	mov r0, #1
	bx lr
_0203807C:
	ldr r1, [r0, #0x24]
	ldr r0, _02038090 ; =sub_02038538
	cmp r1, r0
	beq _02038088
	mov r0, #1
	bx lr
_02038088:
	mov r0, #0
	bx lr
	.balign 4, 0
_0203808C: .word _021D4150
_02038090: .word sub_02038538
	thumb_func_end sub_02038070

	thumb_func_start sub_02038094
sub_02038094: ; 0x02038094
	push {r3, lr}
	ldr r0, _020380A8 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _020380A6
	ldr r0, _020380AC ; =sub_0203847C
	mov r1, #5
	bl sub_020381C0
_020380A6:
	pop {r3, pc}
	.balign 4, 0
_020380A8: .word _021D4150
_020380AC: .word sub_0203847C
	thumb_func_end sub_02038094

	thumb_func_start sub_020380B0
sub_020380B0: ; 0x020380B0
	push {r3, lr}
	ldr r0, _020380C8 ; =_021D4150
	ldr r1, [r0]
	cmp r1, #0
	beq _020380C4
	mov r0, #1
	add r1, #0x57
	strb r0, [r1]
	bl sub_02033AA4
_020380C4:
	pop {r3, pc}
	nop
_020380C8: .word _021D4150
	thumb_func_end sub_020380B0

	thumb_func_start sub_020380CC
sub_020380CC: ; 0x020380CC
	push {r3, lr}
	ldr r0, _020380EC ; =_021D4150
	ldr r1, [r0]
	cmp r1, #0
	beq _020380E8
	mov r0, #1
	add r1, #0x57
	strb r0, [r1]
	bl sub_02033AA4
	ldr r0, _020380F0 ; =sub_020388A8
	mov r1, #0
	bl sub_020381C0
_020380E8:
	pop {r3, pc}
	nop
_020380EC: .word _021D4150
_020380F0: .word sub_020388A8
	thumb_func_end sub_020380CC

	thumb_func_start sub_020380F4
sub_020380F4: ; 0x020380F4
	ldr r0, _02038100 ; =_021D4150
	mov r1, #0x12
	ldr r0, [r0]
	add r0, #0x4e
	strb r1, [r0]
	bx lr
	.balign 4, 0
_02038100: .word _021D4150
	thumb_func_end sub_020380F4

	thumb_func_start sub_02038104
sub_02038104: ; 0x02038104
	ldr r0, _02038110 ; =_021D4150
	mov r1, #9
	ldr r0, [r0]
	add r0, #0x4e
	strb r1, [r0]
	bx lr
	.balign 4, 0
_02038110: .word _021D4150
	thumb_func_end sub_02038104

	thumb_func_start sub_02038114
sub_02038114: ; 0x02038114
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02037474
	cmp r0, #0
	bne _0203813C
	ldr r2, _02038140 ; =0x00007080
	mov r0, #3
	mov r1, #0xf
	bl CreateHeapAtEnd
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02037C98
	ldr r0, _02038144 ; =sub_02038E00
	mov r1, #0
	bl sub_020381C0
_0203813C:
	pop {r3, r4, r5, pc}
	nop
_02038140: .word 0x00007080
_02038144: .word sub_02038E00
	thumb_func_end sub_02038114

	thumb_func_start sub_02038148
sub_02038148: ; 0x02038148
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02037474
	cmp r0, #0
	bne _02038170
	ldr r2, _02038174 ; =0x00007080
	mov r0, #3
	mov r1, #0xf
	bl CreateHeapAtEnd
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02037C98
	ldr r0, _02038178 ; =sub_02038E48
	mov r1, #0
	bl sub_020381C0
_02038170:
	pop {r3, r4, r5, pc}
	nop
_02038174: .word 0x00007080
_02038178: .word sub_02038E48
	thumb_func_end sub_02038148

	thumb_func_start sub_0203817C
sub_0203817C: ; 0x0203817C
	push {r3, lr}
	ldr r0, _020381BC ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _0203818E
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _0203818E
	blx r0
_0203818E:
	bl sub_02039998
	cmp r0, #0
	beq _020381A4
	bl ov00_021EC9D4
	mov r1, #3
	sub r0, r1, r0
	bl sub_0203A930
	pop {r3, pc}
_020381A4:
	bl sub_02035650
	cmp r0, #0
	beq _020381B8
	bl WM_GetLinkLevel
	mov r1, #3
	sub r0, r1, r0
	bl sub_0203A930
_020381B8:
	pop {r3, pc}
	nop
_020381BC: .word _021D4150
	thumb_func_end sub_0203817C

	thumb_func_start sub_020381C0
sub_020381C0: ; 0x020381C0
	ldr r2, _020381CC ; =_021D4150
	ldr r3, [r2]
	str r0, [r3, #0x24]
	ldr r0, [r2]
	str r1, [r0, #0x44]
	bx lr
	.balign 4, 0
_020381CC: .word _021D4150
	thumb_func_end sub_020381C0

	thumb_func_start sub_020381D0
sub_020381D0: ; 0x020381D0
	push {r3, lr}
	bl sub_02039998
	cmp r0, #0
	bne _020381EC
	bl sub_02035664
	cmp r0, #0
	beq _020381F4
	bl sub_020374E4
	mov r0, #1
	bl sub_020350A8
_020381EC:
	ldr r0, _020381F8 ; =sub_02038404
	mov r1, #0
	bl sub_020381C0
_020381F4:
	pop {r3, pc}
	nop
_020381F8: .word sub_02038404
	thumb_func_end sub_020381D0

	thumb_func_start sub_020381FC
sub_020381FC: ; 0x020381FC
	push {r3, lr}
	bl sub_02034FE8
	cmp r0, #0
	beq _02038212
	bl sub_0203622C
	ldr r0, _02038214 ; =sub_020381D0
	mov r1, #0
	bl sub_020381C0
_02038212:
	pop {r3, pc}
	.balign 4, 0
_02038214: .word sub_020381D0
	thumb_func_end sub_020381FC

	thumb_func_start sub_02038218
sub_02038218: ; 0x02038218
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _02038256
	ldr r0, _02038258 ; =_021D4150
	mov r1, #1
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bl sub_02034B0C
	ldr r0, _02038258 ; =_021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x28]
	ldr r1, [r1, #0x30]
	bl sub_02034354
	mov r0, #1
	add r1, r0, #0
	lsl r2, r0, #9
	add r3, r0, #0
	bl sub_02035ED8
	cmp r0, #0
	beq _02038256
	bl sub_02035FD8
	ldr r0, _0203825C ; =sub_02038260
	mov r1, #0
	bl sub_020381C0
_02038256:
	pop {r3, pc}
	.balign 4, 0
_02038258: .word _021D4150
_0203825C: .word sub_02038260
	thumb_func_end sub_02038218

	thumb_func_start sub_02038260
sub_02038260: ; 0x02038260
	push {r3, lr}
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	beq _02038276
	ldr r0, _02038278 ; =sub_0203827C
	mov r1, #0
	bl sub_020381C0
_02038276:
	pop {r3, pc}
	.balign 4, 0
_02038278: .word sub_0203827C
	thumb_func_end sub_02038260

	thumb_func_start sub_0203827C
sub_0203827C: ; 0x0203827C
	push {r3, lr}
	bl sub_02037474
	cmp r0, #0
	bne _0203828E
	ldr r0, _02038290 ; =sub_02038408
	mov r1, #0
	bl sub_020381C0
_0203828E:
	pop {r3, pc}
	.balign 4, 0
_02038290: .word sub_02038408
	thumb_func_end sub_0203827C

	thumb_func_start sub_02038294
sub_02038294: ; 0x02038294
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _020382D0
	ldr r0, _020382D4 ; =_021D4150
	mov r1, #1
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bl sub_02034B0C
	ldr r0, _020382D4 ; =_021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x28]
	ldr r1, [r1, #0x30]
	bl sub_02034354
	mov r0, #1
	add r1, r0, #0
	lsl r2, r0, #9
	bl sub_02035F14
	cmp r0, #0
	beq _020382D0
	bl sub_02035FD8
	ldr r0, _020382D8 ; =sub_020382DC
	mov r1, #0
	bl sub_020381C0
_020382D0:
	pop {r3, pc}
	nop
_020382D4: .word _021D4150
_020382D8: .word sub_020382DC
	thumb_func_end sub_02038294

	thumb_func_start sub_020382DC
sub_020382DC: ; 0x020382DC
	ldr r3, _020382E0 ; =sub_0203528C
	bx r3
	.balign 4, 0
_020382E0: .word sub_0203528C
	thumb_func_end sub_020382DC

	thumb_func_start sub_020382E4
sub_020382E4: ; 0x020382E4
	push {r3, lr}
	bl sub_0203528C
	ldr r0, _02038304 ; =_021D4150
	ldr r0, [r0]
	add r0, #0x4d
	ldrb r0, [r0]
	bl sub_020360E4
	cmp r0, #0
	beq _02038302
	ldr r0, _02038308 ; =sub_0203830C
	mov r1, #0xa
	bl sub_020381C0
_02038302:
	pop {r3, pc}
	.balign 4, 0
_02038304: .word _021D4150
_02038308: .word sub_0203830C
	thumb_func_end sub_020382E4

	thumb_func_start sub_0203830C
sub_0203830C: ; 0x0203830C
	push {r3, lr}
	bl sub_02037700
	cmp r0, #0
	beq _0203831E
	ldr r0, _0203833C ; =sub_02038344
	mov r1, #0
	bl sub_020381C0
_0203831E:
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	beq _0203833A
	bl sub_0203769C
	cmp r0, #0
	beq _0203833A
	ldr r0, _02038340 ; =sub_02038398
	mov r1, #0
	bl sub_020381C0
_0203833A:
	pop {r3, pc}
	.balign 4, 0
_0203833C: .word sub_02038344
_02038340: .word sub_02038398
	thumb_func_end sub_0203830C

	thumb_func_start sub_02038344
sub_02038344: ; 0x02038344
	push {r3, lr}
	bl sub_02034FE8
	ldr r0, _02038354 ; =sub_02038358
	mov r1, #2
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02038354: .word sub_02038358
	thumb_func_end sub_02038344

	thumb_func_start sub_02038358
sub_02038358: ; 0x02038358
	push {r3, lr}
	ldr r0, _02038390 ; =_021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _0203836A
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_0203836A:
	bl sub_02035664
	cmp r0, #0
	beq _0203838C
	mov r1, #1
	mov r0, #0
	lsl r2, r1, #9
	bl sub_02035F14
	cmp r0, #0
	beq _0203838C
	bl sub_02035FD8
	ldr r0, _02038394 ; =sub_020382E4
	mov r1, #0xa
	bl sub_020381C0
_0203838C:
	pop {r3, pc}
	nop
_02038390: .word _021D4150
_02038394: .word sub_020382E4
	thumb_func_end sub_02038358

	thumb_func_start sub_02038398
sub_02038398: ; 0x02038398
	push {r3, lr}
	bl sub_02037474
	cmp r0, #0
	bne _020383AA
	ldr r0, _020383AC ; =sub_02038408
	mov r1, #0
	bl sub_020381C0
_020383AA:
	pop {r3, pc}
	.balign 4, 0
_020383AC: .word sub_02038408
	thumb_func_end sub_02038398

	thumb_func_start sub_020383B0
sub_020383B0: ; 0x020383B0
	push {r3, lr}
	bl sub_02034FE8
	ldr r0, _020383C0 ; =sub_020383C4
	mov r1, #2
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_020383C0: .word sub_020383C4
	thumb_func_end sub_020383B0

	thumb_func_start sub_020383C4
sub_020383C4: ; 0x020383C4
	push {r3, lr}
	ldr r0, _020383FC ; =_021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _020383D6
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_020383D6:
	bl sub_02035664
	cmp r0, #0
	beq _020383F8
	mov r1, #1
	mov r0, #0
	lsl r2, r1, #9
	bl sub_02035F14
	cmp r0, #0
	beq _020383F8
	bl sub_02035FD8
	ldr r0, _02038400 ; =sub_020382DC
	mov r1, #0xa
	bl sub_020381C0
_020383F8:
	pop {r3, pc}
	nop
_020383FC: .word _021D4150
_02038400: .word sub_020382DC
	thumb_func_end sub_020383C4

	thumb_func_start sub_02038404
sub_02038404: ; 0x02038404
	bx lr
	.balign 4, 0
	thumb_func_end sub_02038404

	thumb_func_start sub_02038408
sub_02038408: ; 0x02038408
	push {r3, lr}
	bl sub_02037474
	cmp r0, #0
	bne _02038416
	bl sub_02037D2C
_02038416:
	pop {r3, pc}
	thumb_func_end sub_02038408

	thumb_func_start sub_02038418
sub_02038418: ; 0x02038418
	push {r3, lr}
	bl sub_02037454
	cmp r0, #1
	bgt _02038434
	mov r0, #0
	bl sub_02033ACC
	bl sub_0203624C
	ldr r0, _02038458 ; =sub_02038538
	mov r1, #0
	bl sub_020381C0
_02038434:
	ldr r0, _0203845C ; =_021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _02038444
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_02038444:
	mov r0, #0
	bl sub_02033ACC
	bl sub_0203624C
	ldr r0, _02038458 ; =sub_02038538
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02038458: .word sub_02038538
_0203845C: .word _021D4150
	thumb_func_end sub_02038418

	thumb_func_start sub_02038460
sub_02038460: ; 0x02038460
	push {r3, lr}
	bl sub_02034FE8
	cmp r0, #0
	beq _02038476
	bl sub_0203622C
	ldr r0, _02038478 ; =sub_02038538
	mov r1, #0
	bl sub_020381C0
_02038476:
	pop {r3, pc}
	.balign 4, 0
_02038478: .word sub_02038538
	thumb_func_end sub_02038460

	thumb_func_start sub_0203847C
sub_0203847C: ; 0x0203847C
	push {r3, lr}
	ldr r0, _020384AC ; =_021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _0203848C
	sub r0, r0, #1
	str r0, [r1, #0x44]
_0203848C:
	bl sub_02034FE8
	cmp r0, #0
	beq _020384AA
	ldr r0, _020384AC ; =_021D4150
	ldr r0, [r0]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	bne _020384AA
	bl sub_02036024
	ldr r0, _020384B0 ; =sub_02038408
	mov r1, #0
	bl sub_020381C0
_020384AA:
	pop {r3, pc}
	.balign 4, 0
_020384AC: .word _021D4150
_020384B0: .word sub_02038408
	thumb_func_end sub_0203847C

	thumb_func_start sub_020384B4
sub_020384B4: ; 0x020384B4
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _020384FC
	ldr r0, _02038500 ; =_021D4150
	mov r1, #1
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bl sub_02034B0C
	ldr r0, _02038500 ; =_021D4150
	ldr r0, [r0]
	add r0, #0x4a
	ldrb r0, [r0]
	bl sub_02033908
	ldr r0, _02038500 ; =_021D4150
	mov r1, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bl sub_02034354
	mov r0, #1
	add r1, r0, #0
	lsl r2, r0, #9
	bl sub_02035F14
	cmp r0, #0
	beq _020384FC
	bl sub_02035FD8
	ldr r0, _02038504 ; =sub_02038508
	mov r1, #0x40
	bl sub_020381C0
_020384FC:
	pop {r3, pc}
	nop
_02038500: .word _021D4150
_02038504: .word sub_02038508
	thumb_func_end sub_020384B4

	thumb_func_start sub_02038508
sub_02038508: ; 0x02038508
	push {r3, lr}
	bl sub_0203528C
	ldr r0, _02038530 ; =_021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _0203851E
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_0203851E:
	bl sub_02034FE8
	cmp r0, #0
	beq _0203852E
	ldr r0, _02038534 ; =sub_02038550
	mov r1, #0
	bl sub_020381C0
_0203852E:
	pop {r3, pc}
	.balign 4, 0
_02038530: .word _021D4150
_02038534: .word sub_02038550
	thumb_func_end sub_02038508

	thumb_func_start sub_02038538
sub_02038538: ; 0x02038538
	push {r3, lr}
	bl sub_02034FE8
	cmp r0, #0
	beq _0203854A
	ldr r0, _0203854C ; =sub_02038550
	mov r1, #0
	bl sub_020381C0
_0203854A:
	pop {r3, pc}
	.balign 4, 0
_0203854C: .word sub_02038550
	thumb_func_end sub_02038538

	thumb_func_start sub_02038550
sub_02038550: ; 0x02038550
	push {r3, r4, r5, lr}
	bl sub_02035664
	cmp r0, #0
	beq _020385A8
	ldr r1, _020385AC ; =_021D4150
	mov r2, #2
	ldr r1, [r1]
	mov r0, #0
	add r1, #0x52
	ldrb r1, [r1]
	lsl r2, r2, #8
	mov r3, #1
	bl sub_02035ED8
	cmp r0, #0
	beq _020385A8
	ldr r0, _020385AC ; =_021D4150
	ldr r4, [r0]
	add r5, r4, #0
	add r5, #0xc
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	ldr r2, [r4, #0xc]
	ldr r3, [r5, #4]
	bl _ll_mul
	ldr r2, [r5, #0x10]
	ldr r3, [r5, #0x14]
	add r0, r2, r0
	adc r3, r1
	str r0, [r4, #0xc]
	str r3, [r5, #4]
	bl sub_02035FD8
	ldr r0, _020385AC ; =_021D4150
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x52
	strb r1, [r0]
	ldr r0, _020385B0 ; =sub_020385B8
	ldr r1, _020385B4 ; =0x00002710
	bl sub_020381C0
_020385A8:
	pop {r3, r4, r5, pc}
	nop
_020385AC: .word _021D4150
_020385B0: .word sub_020385B8
_020385B4: .word 0x00002710
	thumb_func_end sub_02038550

	thumb_func_start sub_020385B8
sub_020385B8: ; 0x020385B8
	push {r3, lr}
	bl sub_020358B0
	cmp r0, #0
	bne _020385F2
	bl sub_020376F8
	cmp r0, #0
	beq _020385E2
	ldr r0, _02038604 ; =_021D4150
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x52
	strb r1, [r0]
	bl sub_0203A880
	ldr r0, _02038608 ; =sub_02038854
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_020385E2:
	ldr r0, _02038604 ; =_021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _020385F2
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_020385F2:
	bl sub_02034FE8
	cmp r0, #0
	beq _02038602
	ldr r0, _0203860C ; =sub_02038610
	mov r1, #0
	bl sub_020381C0
_02038602:
	pop {r3, pc}
	.balign 4, 0
_02038604: .word _021D4150
_02038608: .word sub_02038854
_0203860C: .word sub_02038610
	thumb_func_end sub_020385B8

	thumb_func_start sub_02038610
sub_02038610: ; 0x02038610
	push {r3, r4, r5, lr}
	bl sub_02035664
	cmp r0, #0
	beq _0203865C
	mov r0, #0
	mov r2, #2
	add r1, r0, #0
	lsl r2, r2, #8
	bl sub_02035F14
	cmp r0, #0
	beq _0203865C
	bl sub_02035FD8
	ldr r0, _02038660 ; =_021D4150
	ldr r4, [r0]
	add r5, r4, #0
	add r5, #0xc
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	ldr r2, [r4, #0xc]
	ldr r3, [r5, #4]
	bl _ll_mul
	ldr r2, [r5, #0x10]
	ldr r3, [r5, #0x14]
	add r0, r2, r0
	adc r3, r1
	str r0, [r4, #0xc]
	mov r1, #0
	ldr r0, _02038664 ; =sub_02038508
	lsr r2, r3, #0x1b
	lsl r1, r1, #5
	orr r1, r2
	str r3, [r5, #4]
	bl sub_020381C0
_0203865C:
	pop {r3, r4, r5, pc}
	nop
_02038660: .word _021D4150
_02038664: .word sub_02038508
	thumb_func_end sub_02038610

	thumb_func_start sub_02038668
sub_02038668: ; 0x02038668
	push {r3, lr}
	bl sub_02034FE8
	cmp r0, #0
	beq _0203867A
	ldr r0, _0203867C ; =sub_02038680
	mov r1, #0
	bl sub_020381C0
_0203867A:
	pop {r3, pc}
	.balign 4, 0
_0203867C: .word sub_02038680
	thumb_func_end sub_02038668

	thumb_func_start sub_02038680
sub_02038680: ; 0x02038680
	push {r3, lr}
	bl sub_02035664
	cmp r0, #0
	beq _020386A6
	mov r0, #0
	mov r2, #2
	add r1, r0, #0
	lsl r2, r2, #8
	bl sub_02035F14
	cmp r0, #0
	beq _020386A6
	bl sub_02035FD8
	ldr r0, _020386A8 ; =sub_020386AC
	mov r1, #0x64
	bl sub_020381C0
_020386A6:
	pop {r3, pc}
	.balign 4, 0
_020386A8: .word sub_020386AC
	thumb_func_end sub_02038680

	thumb_func_start sub_020386AC
sub_020386AC: ; 0x020386AC
	push {r3, lr}
	ldr r0, _02038704 ; =_021D4150
	ldr r0, [r0]
	add r0, #0x4d
	ldrb r0, [r0]
	bl sub_020351AC
	cmp r0, #0
	beq _020386D8
	ldr r0, _02038704 ; =_021D4150
	ldr r0, [r0]
	add r0, #0x4d
	ldrb r0, [r0]
	bl sub_020360E4
	cmp r0, #0
	beq _020386D8
	ldr r0, _02038708 ; =sub_02038710
	mov r1, #0x64
	bl sub_020381C0
	pop {r3, pc}
_020386D8:
	bl sub_02037700
	cmp r0, #0
	beq _020386EA
	ldr r0, _0203870C ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_020386EA:
	ldr r0, _02038704 ; =_021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _020386FA
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_020386FA:
	ldr r0, _0203870C ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02038704: .word _021D4150
_02038708: .word sub_02038710
_0203870C: .word sub_02038804
	thumb_func_end sub_020386AC

	thumb_func_start sub_02038710
sub_02038710: ; 0x02038710
	push {r3, lr}
	bl sub_02037700
	cmp r0, #0
	beq _02038724
	ldr r0, _02038760 ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038724:
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	beq _02038744
	ldr r0, _02038764 ; =_021D4150
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x4c
	strb r1, [r0]
	ldr r0, _02038768 ; =sub_0203876C
	mov r1, #0x78
	bl sub_020381C0
	pop {r3, pc}
_02038744:
	ldr r0, _02038764 ; =_021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _02038754
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_02038754:
	ldr r0, _02038760 ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	nop
_02038760: .word sub_02038804
_02038764: .word _021D4150
_02038768: .word sub_0203876C
	thumb_func_end sub_02038710

	thumb_func_start sub_0203876C
sub_0203876C: ; 0x0203876C
	push {r3, lr}
	bl sub_02037700
	cmp r0, #0
	beq _02038780
	ldr r0, _020387D4 ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038780:
	ldr r0, _020387D8 ; =_021D4150
	ldr r1, [r0]
	add r0, r1, #0
	add r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #2
	bne _02038798
	ldr r0, _020387DC ; =sub_02038800
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038798:
	cmp r0, #1
	bne _020387AA
	bl sub_02034434
	ldr r0, _020387E0 ; =sub_020387E8
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_020387AA:
	ldr r0, [r1, #0x44]
	cmp r0, #0x6e
	ble _020387B8
	ldr r1, _020387E4 ; =_0210F90C
	mov r0, #6
	bl sub_020376E0
_020387B8:
	ldr r0, _020387D8 ; =_021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _020387C8
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_020387C8:
	ldr r0, _020387D4 ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	nop
_020387D4: .word sub_02038804
_020387D8: .word _021D4150
_020387DC: .word sub_02038800
_020387E0: .word sub_020387E8
_020387E4: .word _0210F90C
	thumb_func_end sub_0203876C

	thumb_func_start sub_020387E8
sub_020387E8: ; 0x020387E8
	push {r3, lr}
	bl sub_02037700
	cmp r0, #0
	beq _020387FA
	ldr r0, _020387FC ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
_020387FA:
	pop {r3, pc}
	.balign 4, 0
_020387FC: .word sub_02038804
	thumb_func_end sub_020387E8

	thumb_func_start sub_02038800
sub_02038800: ; 0x02038800
	bx lr
	.balign 4, 0
	thumb_func_end sub_02038800

	thumb_func_start sub_02038804
sub_02038804: ; 0x02038804
	push {r3, lr}
	ldr r0, _02038848 ; =_021D4150
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x4c
	strb r1, [r0]
	bl sub_02034FE8
	cmp r0, #0
	beq _02038844
	ldr r0, _02038848 ; =_021D4150
	ldr r1, [r0]
	add r0, r1, #0
	add r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq _0203883C
	add r0, r1, #0
	add r0, #0x48
	ldrh r0, [r0]
	add r1, #0x48
	sub r0, r0, #1
	strh r0, [r1]
	ldr r0, _0203884C ; =sub_02038680
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_0203883C:
	ldr r0, _02038850 ; =sub_02038800
	mov r1, #0
	bl sub_020381C0
_02038844:
	pop {r3, pc}
	nop
_02038848: .word _021D4150
_0203884C: .word sub_02038680
_02038850: .word sub_02038800
	thumb_func_end sub_02038804

	thumb_func_start sub_02038854
sub_02038854: ; 0x02038854
	push {r3, lr}
	bl sub_020376F8
	cmp r0, #0
	bne _02038878
	bl sub_02039918
	cmp r0, #0
	bne _02038884
	bl sub_02034FE8
	cmp r0, #0
	beq _02038884
	ldr r0, _020388A0 ; =sub_02038610
	mov r1, #0
	bl sub_020381C0
	b _02038884
_02038878:
	bl sub_0203769C
	cmp r0, #0
	bne _02038884
	bl sub_02034638
_02038884:
	bl sub_02037700
	cmp r0, #0
	beq _0203889C
	bl sub_02039918
	cmp r0, #0
	bne _0203889C
	ldr r0, _020388A4 ; =sub_02038804
	mov r1, #0
	bl sub_020381C0
_0203889C:
	pop {r3, pc}
	nop
_020388A0: .word sub_02038610
_020388A4: .word sub_02038804
	thumb_func_end sub_02038854

	thumb_func_start sub_020388A8
sub_020388A8: ; 0x020388A8
	push {r3, lr}
	bl sub_02035664
	cmp r0, #0
	beq _020388D6
	ldr r1, _020388D8 ; =_021D4150
	mov r0, #0
	ldr r1, [r1]
	mov r2, #2
	add r1, #0x52
	ldrb r1, [r1]
	lsl r2, r2, #8
	add r3, r0, #0
	bl sub_02035ED8
	cmp r0, #0
	beq _020388D6
	bl sub_02035FD8
	ldr r0, _020388DC ; =sub_02038404
	mov r1, #0
	bl sub_020381C0
_020388D6:
	pop {r3, pc}
	.balign 4, 0
_020388D8: .word _021D4150
_020388DC: .word sub_02038404
	thumb_func_end sub_020388A8

	thumb_func_start sub_020388E0
sub_020388E0: ; 0x020388E0
	push {r3, lr}
	ldr r0, _02038914 ; =_021D4150
	mov r1, #0xd
	ldr r0, [r0]
	add r0, #0x4e
	strb r1, [r0]
	bl sub_0203769C
	cmp r0, #0
	add r0, sp, #0
	bne _02038906
	mov r1, #0
	strb r1, [r0, #1]
	add r1, sp, #0
	mov r0, #0xa
	add r1, #1
	bl sub_020376E0
	pop {r3, pc}
_02038906:
	mov r1, #0
	strb r1, [r0]
	mov r0, #0xa
	add r1, sp, #0
	bl sub_020376E0
	pop {r3, pc}
	.balign 4, 0
_02038914: .word _021D4150
	thumb_func_end sub_020388E0

	thumb_func_start sub_02038918
sub_02038918: ; 0x02038918
	ldr r1, _02038930 ; =_021D4150
	ldr r3, _02038934 ; =sub_020381C0
	ldr r2, [r1]
	add r2, #0x4d
	strb r0, [r2]
	ldr r0, [r1]
	mov r2, #3
	add r0, #0x48
	strh r2, [r0]
	ldr r0, _02038938 ; =sub_020389BC
	mov r1, #0
	bx r3
	.balign 4, 0
_02038930: .word _021D4150
_02038934: .word sub_020381C0
_02038938: .word sub_020389BC
	thumb_func_end sub_02038918

	thumb_func_start sub_0203893C
sub_0203893C: ; 0x0203893C
	ldr r0, _02038948 ; =_021D4150
	mov r1, #7
	ldr r0, [r0]
	add r0, #0x4e
	strb r1, [r0]
	bx lr
	.balign 4, 0
_02038948: .word _021D4150
	thumb_func_end sub_0203893C

	thumb_func_start sub_0203894C
sub_0203894C: ; 0x0203894C
	push {r3, lr}
	ldr r1, _02038974 ; =_021D4150
	ldr r2, [r1]
	add r2, #0x4d
	strb r0, [r2]
	ldr r0, [r1]
	mov r2, #7
	add r0, #0x4e
	strb r2, [r0]
	ldr r0, [r1]
	mov r2, #3
	add r0, #0x48
	strh r2, [r0]
	bl sub_0203A880
	ldr r0, _02038978 ; =sub_02038668
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02038974: .word _021D4150
_02038978: .word sub_02038668
	thumb_func_end sub_0203894C

	thumb_func_start sub_0203897C
sub_0203897C: ; 0x0203897C
	ldr r0, _02038988 ; =_021D4150
	mov r1, #0x1a
	ldr r0, [r0]
	add r0, #0x4e
	strb r1, [r0]
	bx lr
	.balign 4, 0
_02038988: .word _021D4150
	thumb_func_end sub_0203897C

	thumb_func_start sub_0203898C
sub_0203898C: ; 0x0203898C
	push {r3, lr}
	ldr r1, _020389B4 ; =_021D4150
	ldr r2, [r1]
	add r2, #0x4d
	strb r0, [r2]
	ldr r0, [r1]
	mov r2, #0x1a
	add r0, #0x4e
	strb r2, [r0]
	ldr r0, [r1]
	mov r2, #3
	add r0, #0x48
	strh r2, [r0]
	bl sub_0203A880
	ldr r0, _020389B8 ; =sub_02038668
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_020389B4: .word _021D4150
_020389B8: .word sub_02038668
	thumb_func_end sub_0203898C

	thumb_func_start sub_020389BC
sub_020389BC: ; 0x020389BC
	push {r3, lr}
	bl sub_02034FE8
	cmp r0, #0
	beq _020389CE
	ldr r0, _020389D0 ; =sub_020389D4
	mov r1, #0
	bl sub_020381C0
_020389CE:
	pop {r3, pc}
	.balign 4, 0
_020389D0: .word sub_020389D4
	thumb_func_end sub_020389BC

	thumb_func_start sub_020389D4
sub_020389D4: ; 0x020389D4
	push {r3, lr}
	bl sub_02035664
	cmp r0, #0
	beq _02038A04
	ldr r0, _02038A08 ; =_021D4150
	mov r2, #2
	ldr r0, [r0]
	mov r1, #0xd
	add r0, #0x4e
	strb r1, [r0]
	mov r0, #0
	add r1, r0, #0
	lsl r2, r2, #8
	bl sub_02035F14
	cmp r0, #0
	beq _02038A04
	bl sub_02035FE4
	ldr r0, _02038A0C ; =sub_02038A10
	mov r1, #0x64
	bl sub_020381C0
_02038A04:
	pop {r3, pc}
	nop
_02038A08: .word _021D4150
_02038A0C: .word sub_02038A10
	thumb_func_end sub_020389D4

	thumb_func_start sub_02038A10
sub_02038A10: ; 0x02038A10
	push {r3, lr}
	ldr r0, _02038A84 ; =_021D4150
	ldr r0, [r0]
	add r0, #0x4d
	ldrb r0, [r0]
	bl sub_020351AC
	cmp r0, #0
	beq _02038A3C
	ldr r0, _02038A84 ; =_021D4150
	ldr r0, [r0]
	add r0, #0x4d
	ldrb r0, [r0]
	bl sub_020360E4
	cmp r0, #0
	beq _02038A3C
	ldr r0, _02038A88 ; =sub_02038A94
	mov r1, #0x64
	bl sub_020381C0
	pop {r3, pc}
_02038A3C:
	bl sub_02037700
	cmp r0, #0
	bne _02038A4E
	ldr r0, _02038A84 ; =_021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	bne _02038A7C
_02038A4E:
	ldr r1, _02038A84 ; =_021D4150
	ldr r2, [r1]
	add r0, r2, #0
	add r0, #0x48
	ldrh r0, [r0]
	add r2, #0x48
	sub r0, r0, #1
	strh r0, [r2]
	ldr r0, [r1]
	add r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _02038A72
	ldr r0, _02038A8C ; =sub_02038800
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038A72:
	ldr r0, _02038A90 ; =sub_020389BC
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038A7C:
	beq _02038A82
	sub r0, r0, #1
	str r0, [r1, #0x44]
_02038A82:
	pop {r3, pc}
	.balign 4, 0
_02038A84: .word _021D4150
_02038A88: .word sub_02038A94
_02038A8C: .word sub_02038800
_02038A90: .word sub_020389BC
	thumb_func_end sub_02038A10

	thumb_func_start sub_02038A94
sub_02038A94: ; 0x02038A94
	push {r3, lr}
	ldr r0, _02038B2C ; =_021D4150
	ldr r1, [r0]
	ldr r0, [r1, #0x44]
	cmp r0, #0x5a
	ble _02038AA6
	sub r0, r0, #1
	str r0, [r1, #0x44]
	pop {r3, pc}
_02038AA6:
	bl sub_02037700
	cmp r0, #0
	beq _02038ADC
	ldr r1, _02038B2C ; =_021D4150
	ldr r2, [r1]
	add r0, r2, #0
	add r0, #0x48
	ldrh r0, [r0]
	add r2, #0x48
	sub r0, r0, #1
	strh r0, [r2]
	ldr r0, [r1]
	add r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _02038AD2
	ldr r0, _02038B30 ; =sub_02038800
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038AD2:
	ldr r0, _02038B34 ; =sub_020389BC
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038ADC:
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	beq _02038AF2
	ldr r0, _02038B38 ; =sub_020387E8
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038AF2:
	ldr r1, _02038B2C ; =_021D4150
	ldr r2, [r1]
	ldr r0, [r2, #0x44]
	cmp r0, #0
	beq _02038B02
	sub r0, r0, #1
	str r0, [r2, #0x44]
	pop {r3, pc}
_02038B02:
	add r0, r2, #0
	add r0, #0x48
	ldrh r0, [r0]
	add r2, #0x48
	sub r0, r0, #1
	strh r0, [r2]
	ldr r0, [r1]
	add r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _02038B22
	ldr r0, _02038B30 ; =sub_02038800
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038B22:
	ldr r0, _02038B34 ; =sub_020389BC
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02038B2C: .word _021D4150
_02038B30: .word sub_02038800
_02038B34: .word sub_020389BC
_02038B38: .word sub_020387E8
	thumb_func_end sub_02038A94

	thumb_func_start sub_02038B3C
sub_02038B3C: ; 0x02038B3C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl sub_0203769C
	cmp r0, #0
	bne _02038B8A
	ldr r6, _02038B8C ; =_0210F90C
	mov r3, #1
	mov r2, #0
_02038B50:
	ldrb r1, [r6]
	ldrb r0, [r4, r2]
	cmp r1, r0
	beq _02038B5C
	mov r3, #0
	b _02038B64
_02038B5C:
	add r2, r2, #1
	add r6, r6, #1
	cmp r2, #6
	blo _02038B50
_02038B64:
	cmp r3, #0
	beq _02038B80
	ldr r0, _02038B90 ; =_021D4150
	ldr r0, [r0]
	add r0, #0x57
	ldrb r0, [r0]
	cmp r0, #0
	bne _02038B80
	ldr r1, _02038B94 ; =_0210F904
	mov r0, #7
	strb r5, [r1]
	bl sub_02037184
	pop {r4, r5, r6, pc}
_02038B80:
	ldr r1, _02038B98 ; =_0210F914
	mov r0, #7
	strb r5, [r1]
	bl sub_02037184
_02038B8A:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02038B8C: .word _0210F90C
_02038B90: .word _021D4150
_02038B94: .word _0210F904
_02038B98: .word _0210F914
	thumb_func_end sub_02038B3C

	thumb_func_start sub_02038B9C
sub_02038B9C: ; 0x02038B9C
	push {r3, r4, r5, lr}
	mov r4, #1
	ldr r5, _02038C0C ; =_0210F904 + 1
	add r3, r4, #0
_02038BA4:
	ldrb r1, [r5]
	ldrb r0, [r2, r3]
	cmp r1, r0
	beq _02038BB0
	mov r4, #0
	b _02038BB8
_02038BB0:
	add r3, r3, #1
	add r5, r5, #1
	cmp r3, #6
	blo _02038BA4
_02038BB8:
	cmp r4, #0
	beq _02038BD2
	ldrb r4, [r2]
	bl sub_0203769C
	cmp r4, r0
	bne _02038C08
	ldr r0, _02038C10 ; =_021D4150
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x4c
	strb r1, [r0]
	pop {r3, r4, r5, pc}
_02038BD2:
	mov r4, #1
	ldr r3, _02038C14 ; =_0210F914 + 1
	add r5, r4, #0
_02038BD8:
	ldrb r1, [r3]
	ldrb r0, [r2, r5]
	cmp r1, r0
	beq _02038BE4
	mov r4, #0
	b _02038BEC
_02038BE4:
	add r5, r5, #1
	add r3, r3, #1
	cmp r5, #6
	blo _02038BD8
_02038BEC:
	cmp r4, #0
	beq _02038C08
	ldrb r4, [r2]
	bl sub_0203769C
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r4, r0
	bne _02038C08
	ldr r0, _02038C10 ; =_021D4150
	mov r1, #2
	ldr r0, [r0]
	add r0, #0x4c
	strb r1, [r0]
_02038C08:
	pop {r3, r4, r5, pc}
	nop
_02038C0C: .word _0210F904 + 1
_02038C10: .word _021D4150
_02038C14: .word _0210F914 + 1
	thumb_func_end sub_02038B9C

	thumb_func_start sub_02038C18
sub_02038C18: ; 0x02038C18
	mov r0, #6
	bx lr
	thumb_func_end sub_02038C18

	thumb_func_start sub_02038C1C
sub_02038C1C: ; 0x02038C1C
	push {r3, lr}
	ldr r1, _02038C30 ; =_021D4150
	ldr r1, [r1]
	cmp r1, #0
	beq _02038C2E
	add r1, #0x4a
	strb r0, [r1]
	bl sub_02033908
_02038C2E:
	pop {r3, pc}
	.balign 4, 0
_02038C30: .word _021D4150
	thumb_func_end sub_02038C1C

	thumb_func_start sub_02038C34
sub_02038C34: ; 0x02038C34
	ldr r3, _02038C38 ; =sub_0203528C
	bx r3
	.balign 4, 0
_02038C38: .word sub_0203528C
	thumb_func_end sub_02038C34

	thumb_func_start sub_02038C3C
sub_02038C3C: ; 0x02038C3C
	ldr r2, _02038CB4 ; =0x00400131
	cmp r0, r2
	bhi _02038C4C
	bhs _02038C8A
	ldr r2, _02038CB8 ; =0x00000333
	cmp r0, r2
	beq _02038C5E
	bx lr
_02038C4C:
	ldr r1, _02038CBC ; =0x00400286
	cmp r0, r1
	bhi _02038C56
	beq _02038C9E
	bx lr
_02038C56:
	add r1, #0x92
	cmp r0, r1
	beq _02038C76
	bx lr
_02038C5E:
	cmp r1, #0xf
	bne _02038CB0
	ldr r0, _02038CC0 ; =_021D4150
	ldr r2, [r0]
	add r0, r2, #0
	add r0, #0x58
	ldrb r1, [r0]
	mov r0, #1
	add r2, #0x58
	orr r0, r1
	strb r0, [r2]
	bx lr
_02038C76:
	ldr r0, _02038CC0 ; =_021D4150
	ldr r2, [r0]
	add r0, r2, #0
	add r0, #0x58
	ldrb r1, [r0]
	mov r0, #1
	add r2, #0x58
	orr r0, r1
	strb r0, [r2]
	bx lr
_02038C8A:
	ldr r0, _02038CC0 ; =_021D4150
	ldr r2, [r0]
	add r0, r2, #0
	add r0, #0x58
	ldrb r1, [r0]
	mov r0, #2
	add r2, #0x58
	orr r0, r1
	strb r0, [r2]
	bx lr
_02038C9E:
	ldr r0, _02038CC0 ; =_021D4150
	ldr r2, [r0]
	add r0, r2, #0
	add r0, #0x58
	ldrb r1, [r0]
	mov r0, #4
	add r2, #0x58
	orr r0, r1
	strb r0, [r2]
_02038CB0:
	bx lr
	nop
_02038CB4: .word 0x00400131
_02038CB8: .word 0x00000333
_02038CBC: .word 0x00400286
_02038CC0: .word _021D4150
	thumb_func_end sub_02038C3C

	thumb_func_start sub_02038CC4
sub_02038CC4: ; 0x02038CC4
	push {r3, lr}
	mov r0, #1
	add r1, r0, #0
	mov r2, #0x20
	bl sub_02035F14
	cmp r0, #0
	beq _02038CE0
	bl sub_02035FD8
	ldr r0, _02038CE4 ; =sub_02038C34
	mov r1, #0
	bl sub_020381C0
_02038CE0:
	pop {r3, pc}
	nop
_02038CE4: .word sub_02038C34
	thumb_func_end sub_02038CC4

	thumb_func_start sub_02038CE8
sub_02038CE8: ; 0x02038CE8
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _02038D18
	ldr r0, _02038D1C ; =_021D4150
	mov r1, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bl sub_02034B0C
	ldr r0, _02038D1C ; =_021D4150
	mov r1, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bl sub_02034354
	ldr r0, _02038D20 ; =sub_02038C3C
	bl sub_02033A7C
	ldr r0, _02038D24 ; =sub_02038CC4
	mov r1, #0
	bl sub_020381C0
_02038D18:
	pop {r3, pc}
	nop
_02038D1C: .word _021D4150
_02038D20: .word sub_02038C3C
_02038D24: .word sub_02038CC4
	thumb_func_end sub_02038CE8

	thumb_func_start sub_02038D28
sub_02038D28: ; 0x02038D28
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037474
	cmp r0, #0
	bne _02038D58
	mov r2, #7
	mov r0, #3
	mov r1, #0xf
	lsl r2, r2, #0xc
	bl CreateHeapAtEnd
	add r0, r4, #0
	mov r1, #0x11
	bl sub_02037C98
	ldr r0, _02038D5C ; =_021D4150
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x4f
	strb r1, [r0]
	ldr r0, _02038D60 ; =sub_02038CE8
	bl sub_020381C0
_02038D58:
	pop {r4, pc}
	nop
_02038D5C: .word _021D4150
_02038D60: .word sub_02038CE8
	thumb_func_end sub_02038D28

	thumb_func_start sub_02038D64
sub_02038D64: ; 0x02038D64
	push {r3, lr}
	ldr r0, _02038D78 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _02038D76
	ldr r0, _02038D7C ; =sub_0203847C
	mov r1, #5
	bl sub_020381C0
_02038D76:
	pop {r3, pc}
	.balign 4, 0
_02038D78: .word _021D4150
_02038D7C: .word sub_0203847C
	thumb_func_end sub_02038D64

	thumb_func_start sub_02038D80
sub_02038D80: ; 0x02038D80
	ldr r0, _02038D8C ; =_021D4150
	ldr r0, [r0]
	add r0, #0x58
	ldrb r0, [r0]
	bx lr
	nop
_02038D8C: .word _021D4150
	thumb_func_end sub_02038D80

	thumb_func_start sub_02038D90
sub_02038D90: ; 0x02038D90
	push {r3, lr}
	bl sub_02037988
	ldr r0, _02038DF0 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _02038DA2
	mov r0, #1
	pop {r3, pc}
_02038DA2:
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _02038DB2
	cmp r0, #0x19
	beq _02038DB2
	cmp r0, #0x24
	bne _02038DBA
_02038DB2:
	bl ov00_021E6CB8
	mov r0, #1
	pop {r3, pc}
_02038DBA:
	bl sub_02039998
	cmp r0, #0
	beq _02038DE2
	ldr r0, _02038DF0 ; =_021D4150
	ldr r0, [r0]
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _02038DD8
	ldr r0, _02038DF4 ; =sub_02039D78
	mov r1, #0
	bl sub_020381C0
	b _02038DEA
_02038DD8:
	ldr r0, _02038DF8 ; =sub_020392F4
	mov r1, #0
	bl sub_020381C0
	b _02038DEA
_02038DE2:
	ldr r0, _02038DFC ; =sub_020381FC
	mov r1, #0
	bl sub_020381C0
_02038DEA:
	mov r0, #0
	pop {r3, pc}
	nop
_02038DF0: .word _021D4150
_02038DF4: .word sub_02039D78
_02038DF8: .word sub_020392F4
_02038DFC: .word sub_020381FC
	thumb_func_end sub_02038D90

	thumb_func_start sub_02038E00
sub_02038E00: ; 0x02038E00
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _02038E3E
	ldr r0, _02038E40 ; =_021D4150
	mov r1, #1
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bl sub_02034B0C
	ldr r0, _02038E40 ; =_021D4150
	mov r1, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bl sub_02034354
	mov r0, #1
	add r1, r0, #0
	lsl r2, r0, #9
	add r3, r0, #0
	bl sub_02035ED8
	cmp r0, #0
	beq _02038E3E
	bl sub_02035FD8
	ldr r0, _02038E44 ; =sub_02038260
	mov r1, #0
	bl sub_020381C0
_02038E3E:
	pop {r3, pc}
	.balign 4, 0
_02038E40: .word _021D4150
_02038E44: .word sub_02038260
	thumb_func_end sub_02038E00

	thumb_func_start sub_02038E48
sub_02038E48: ; 0x02038E48
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _02038E84
	ldr r0, _02038E88 ; =_021D4150
	mov r1, #1
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bl sub_02034B0C
	ldr r0, _02038E88 ; =_021D4150
	mov r1, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bl sub_02034354
	mov r0, #1
	add r1, r0, #0
	lsl r2, r0, #9
	bl sub_02035F14
	cmp r0, #0
	beq _02038E84
	bl sub_02035FD8
	ldr r0, _02038E8C ; =sub_020382DC
	mov r1, #0
	bl sub_020381C0
_02038E84:
	pop {r3, pc}
	nop
_02038E88: .word _021D4150
_02038E8C: .word sub_020382DC
	thumb_func_end sub_02038E48

	thumb_func_start sub_02038E90
sub_02038E90: ; 0x02038E90
	bx lr
	.balign 4, 0
	thumb_func_end sub_02038E90

	thumb_func_start sub_02038E94
sub_02038E94: ; 0x02038E94
	push {r3, lr}
	mov r0, #0
	bl ov00_021E5E54
	cmp r0, #0
	bge _02038EA8
	ldr r0, _02038EAC ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_02038EA8:
	pop {r3, pc}
	nop
_02038EAC: .word sub_02038E90
	thumb_func_end sub_02038E94

	thumb_func_start sub_02038EB0
sub_02038EB0: ; 0x02038EB0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02038EB0

	thumb_func_start sub_02038EB4
sub_02038EB4: ; 0x02038EB4
	bx lr
	.balign 4, 0
	thumb_func_end sub_02038EB4

	thumb_func_start sub_02038EB8
sub_02038EB8: ; 0x02038EB8
	push {r3, lr}
	mov r0, #1
	bl sub_0203786C
	mov r0, #0
	bl ov00_021E5E54
	cmp r0, #0xa
	blt _02038ED8
	cmp r0, #0x14
	bge _02038ED8
	ldr r0, _02038F60 ; =sub_02038EB4
	mov r1, #0
	bl sub_020381C0
	b _02038F3A
_02038ED8:
	cmp r0, #0
	bge _02038EE6
	ldr r0, _02038F64 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	b _02038F3A
_02038EE6:
	cmp r0, #0x17
	bne _02038EF4
	ldr r0, _02038F68 ; =sub_02038E94
	mov r1, #0
	bl sub_020381C0
	b _02038F3A
_02038EF4:
	cmp r0, #0x18
	bne _02038F18
	ldr r0, _02038F6C ; =_021D4150
	ldr r0, [r0]
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	beq _02038F0E
	ldr r0, _02038F64 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	b _02038F3A
_02038F0E:
	ldr r0, _02038F70 ; =sub_02038EB0
	mov r1, #0
	bl sub_020381C0
	b _02038F3A
_02038F18:
	cmp r0, #0x15
	bne _02038F3A
	ldr r0, _02038F6C ; =_021D4150
	ldr r0, [r0]
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	beq _02038F32
	ldr r0, _02038F64 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	b _02038F3A
_02038F32:
	ldr r0, _02038F70 ; =sub_02038EB0
	mov r1, #0
	bl sub_020381C0
_02038F3A:
	ldr r0, _02038F6C ; =_021D4150
	ldr r0, [r0]
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	beq _02038F5E
	bl sub_02037454
	ldr r1, _02038F6C ; =_021D4150
	ldr r1, [r1]
	add r1, #0x4b
	ldrb r1, [r1]
	cmp r1, r0
	beq _02038F5E
	ldr r0, _02038F64 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_02038F5E:
	pop {r3, pc}
	.balign 4, 0
_02038F60: .word sub_02038EB4
_02038F64: .word sub_02038E90
_02038F68: .word sub_02038E94
_02038F6C: .word _021D4150
_02038F70: .word sub_02038EB0
	thumb_func_end sub_02038EB8

	thumb_func_start sub_02038F74
sub_02038F74: ; 0x02038F74
	push {r3, r4}
	ldr r3, _02038F98 ; =_021D4150
	ldr r4, [r3]
	cmp r4, #0
	beq _02038F94
	add r3, r0, #0
	sub r3, #0x19
	cmp r3, #1
	bls _02038F88
	neg r0, r0
_02038F88:
	str r0, [r4, #0x34]
	ldr r0, _02038F98 ; =_021D4150
	ldr r3, [r0]
	str r1, [r3, #0x38]
	ldr r0, [r0]
	str r2, [r0, #0x3c]
_02038F94:
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02038F98: .word _021D4150
	thumb_func_end sub_02038F74

	thumb_func_start sub_02038F9C
sub_02038F9C: ; 0x02038F9C
	push {r3, lr}
	mov r0, #0
	bl ov00_021E5E54
	cmp r0, #0xa
	blt _02038FB6
	cmp r0, #0x14
	bge _02038FB6
	ldr r0, _02038FFC ; =sub_02038EB4
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038FB6:
	cmp r0, #0
	bge _02038FC4
	ldr r0, _02039000 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038FC4:
	cmp r0, #0x14
	bne _02038FD2
	ldr r0, _02039004 ; =sub_02038EB8
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038FD2:
	cmp r0, #0x15
	bne _02038FE0
	ldr r0, _02039008 ; =sub_02038EB0
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038FE0:
	cmp r0, #0x16
	bne _02038FEE
	ldr r0, _02038FFC ; =sub_02038EB4
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02038FEE:
	cmp r0, #0x18
	bne _02038FFA
	ldr r0, _02039008 ; =sub_02038EB0
	mov r1, #0
	bl sub_020381C0
_02038FFA:
	pop {r3, pc}
	.balign 4, 0
_02038FFC: .word sub_02038EB4
_02039000: .word sub_02038E90
_02039004: .word sub_02038EB8
_02039008: .word sub_02038EB0
	thumb_func_end sub_02038F9C

	thumb_func_start sub_0203900C
sub_0203900C: ; 0x0203900C
	push {r3, lr}
	mov r0, #1
	bl ov00_021E5E54
	cmp r0, #0
	bge _02039022
	ldr r0, _02039074 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039022:
	ldr r0, _02039078 ; =_021D4150
	ldr r0, [r0]
	add r0, #0x4e
	ldrb r0, [r0]
	bl sub_02033FC4
	add r2, r0, #0
	ldr r0, _02039078 ; =_021D4150
	ldr r1, [r0]
	mov r0, #0x51
	ldrsb r0, [r1, r0]
	add r1, r2, #1
	mov r2, #0
	bl ov00_021E6D7C
	add r0, r0, #3
	cmp r0, #3
	bhi _02039070
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02039052: ; jump table
	.short _02039068 - _02039052 - 2 ; case 0
	.short _02039070 - _02039052 - 2 ; case 1
	.short _02039070 - _02039052 - 2 ; case 2
	.short _0203905A - _02039052 - 2 ; case 3
_0203905A:
	bl sub_0203622C
	ldr r0, _0203907C ; =sub_02038F9C
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039068:
	ldr r0, _02039074 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_02039070:
	pop {r3, pc}
	nop
_02039074: .word sub_02038E90
_02039078: .word _021D4150
_0203907C: .word sub_02038F9C
	thumb_func_end sub_0203900C

	thumb_func_start sub_02039080
sub_02039080: ; 0x02039080
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020390B0 ; =_021D4150
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	ldr r0, _020390B4 ; =sub_02038F9C
	cmp r1, r0
	beq _02039094
	mov r0, #0
	pop {r4, pc}
_02039094:
	ldr r0, _020390B8 ; =sub_02036904
	ldr r1, _020390BC ; =sub_020367A8
	bl ov00_021E5C84
	ldr r0, _020390B0 ; =_021D4150
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x51
	strb r4, [r0]
	ldr r0, _020390C0 ; =sub_0203900C
	bl sub_020381C0
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_020390B0: .word _021D4150
_020390B4: .word sub_02038F9C
_020390B8: .word sub_02036904
_020390BC: .word sub_020367A8
_020390C0: .word sub_0203900C
	thumb_func_end sub_02039080

	thumb_func_start sub_020390C4
sub_020390C4: ; 0x020390C4
	ldr r0, _02039120 ; =_021D4150
	ldr r1, _02039124 ; =sub_02038F9C
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	cmp r0, r1
	bne _020390D4
	mov r0, #0
	bx lr
_020390D4:
	ldr r1, _02039128 ; =sub_02038EB8
	cmp r0, r1
	bne _020390DE
	mov r0, #1
	bx lr
_020390DE:
	ldr r1, _0203912C ; =sub_02038E94
	cmp r0, r1
	bne _020390E8
	mov r0, #3
	bx lr
_020390E8:
	ldr r1, _02039130 ; =sub_02038EB0
	cmp r0, r1
	bne _020390F2
	mov r0, #4
	bx lr
_020390F2:
	ldr r1, _02039134 ; =sub_02038EB4
	cmp r0, r1
	bne _020390FC
	mov r0, #5
	bx lr
_020390FC:
	ldr r1, _02039138 ; =sub_02039DE4
	cmp r0, r1
	bne _02039106
	mov r0, #0
	bx lr
_02039106:
	ldr r1, _0203913C ; =sub_02039DC4
	cmp r0, r1
	bne _02039110
	mov r0, #1
	bx lr
_02039110:
	ldr r1, _02039140 ; =sub_02039E7C
	cmp r0, r1
	bne _0203911A
	mov r0, #3
	bx lr
_0203911A:
	mov r0, #2
	bx lr
	nop
_02039120: .word _021D4150
_02039124: .word sub_02038F9C
_02039128: .word sub_02038EB8
_0203912C: .word sub_02038E94
_02039130: .word sub_02038EB0
_02039134: .word sub_02038EB4
_02039138: .word sub_02039DE4
_0203913C: .word sub_02039DC4
_02039140: .word sub_02039E7C
	thumb_func_end sub_020390C4

	thumb_func_start sub_02039144
sub_02039144: ; 0x02039144
	push {r3, lr}
	ldr r0, _020391BC ; =sub_02036904
	ldr r1, _020391C0 ; =sub_020367A8
	bl ov00_021E5C84
	mov r0, #0
	mvn r0, r0
	mov r1, #4
	mov r2, #1
	bl ov00_021E6D7C
	add r0, r0, #4
	cmp r0, #4
	bhi _0203919A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203916C: ; jump table
	.short _02039198 - _0203916C - 2 ; case 0
	.short _0203918E - _0203916C - 2 ; case 1
	.short _0203919A - _0203916C - 2 ; case 2
	.short _0203919A - _0203916C - 2 ; case 3
	.short _02039176 - _0203916C - 2 ; case 4
_02039176:
	ldr r0, _020391C4 ; =_021D4150
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x5c
	strb r1, [r0]
	bl sub_0203622C
	ldr r0, _020391C8 ; =sub_02038F9C
	mov r1, #0
	bl sub_020381C0
	b _0203919A
_0203918E:
	ldr r0, _020391CC ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	b _0203919A
_02039198:
	pop {r3, pc}
_0203919A:
	bl ov00_021E6690
	cmp r0, #0
	bge _020391AC
	ldr r0, _020391CC ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_020391AC:
	cmp r0, #0x1a
	bne _020391B8
	ldr r0, _020391CC ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_020391B8:
	pop {r3, pc}
	nop
_020391BC: .word sub_02036904
_020391C0: .word sub_020367A8
_020391C4: .word _021D4150
_020391C8: .word sub_02038F9C
_020391CC: .word sub_02038E90
	thumb_func_end sub_02039144

	thumb_func_start sub_020391D0
sub_020391D0: ; 0x020391D0
	push {r3, lr}
	mov r0, #0
	bl sub_0203786C
	ldr r0, _02039214 ; =_021D4150
	ldr r0, [r0]
	add r0, #0x50
	ldrb r0, [r0]
	bl ov00_021E6BE4
	cmp r0, #0
	beq _020391FE
	bl ov00_021E6C68
	cmp r0, #0
	beq _020391FE
	bl sub_020343E4
	ldr r0, _02039218 ; =sub_02039144
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_020391FE:
	mov r0, #0
	bl ov00_021E5E54
	cmp r0, #0
	bge _02039210
	ldr r0, _0203921C ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_02039210:
	pop {r3, pc}
	nop
_02039214: .word _021D4150
_02039218: .word sub_02039144
_0203921C: .word sub_02038E90
	thumb_func_end sub_020391D0

	thumb_func_start sub_02039220
sub_02039220: ; 0x02039220
	push {r3, lr}
	bl sub_0203769C
	cmp r0, #0
	bne _0203923C
	ldr r0, _0203925C ; =_021D4150
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x50
	strb r1, [r0]
	ldr r0, _02039260 ; =sub_020391D0
	bl sub_020381C0
	b _0203924E
_0203923C:
	ldr r0, _0203925C ; =_021D4150
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x50
	strb r1, [r0]
	ldr r0, _02039260 ; =sub_020391D0
	mov r1, #0
	bl sub_020381C0
_0203924E:
	ldr r0, _0203925C ; =_021D4150
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x5c
	strb r1, [r0]
	pop {r3, pc}
	nop
_0203925C: .word _021D4150
_02039260: .word sub_020391D0
	thumb_func_end sub_02039220

	thumb_func_start sub_02039264
sub_02039264: ; 0x02039264
	ldr r0, _02039270 ; =_021D4150
	ldr r0, [r0]
	add r0, #0x5c
	ldrb r0, [r0]
	bx lr
	nop
_02039270: .word _021D4150
	thumb_func_end sub_02039264

	thumb_func_start sub_02039274
sub_02039274: ; 0x02039274
	ldr r0, _02039294 ; =_021D4150
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	ldr r0, _02039298 ; =sub_02039144
	cmp r1, r0
	bne _02039284
	mov r0, #1
	bx lr
_02039284:
	ldr r0, _0203929C ; =sub_02039C60
	cmp r1, r0
	bne _0203928E
	mov r0, #1
	bx lr
_0203928E:
	mov r0, #0
	bx lr
	nop
_02039294: .word _021D4150
_02039298: .word sub_02039144
_0203929C: .word sub_02039C60
	thumb_func_end sub_02039274

	thumb_func_start sub_020392A0
sub_020392A0: ; 0x020392A0
	ldr r0, _020392C8 ; =_021D4150
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	ldr r0, _020392CC ; =sub_02038F9C
	cmp r1, r0
	bne _020392B0
	mov r0, #1
	bx lr
_020392B0:
	ldr r0, _020392D0 ; =sub_02039144
	cmp r1, r0
	bne _020392BA
	mov r0, #1
	bx lr
_020392BA:
	ldr r0, _020392D4 ; =sub_02039C60
	cmp r1, r0
	bne _020392C4
	mov r0, #1
	bx lr
_020392C4:
	mov r0, #0
	bx lr
	.balign 4, 0
_020392C8: .word _021D4150
_020392CC: .word sub_02038F9C
_020392D0: .word sub_02039144
_020392D4: .word sub_02039C60
	thumb_func_end sub_020392A0

	thumb_func_start sub_020392D8
sub_020392D8: ; 0x020392D8
	push {r3, lr}
	ldr r0, _020392F0 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _020392E6
	bl GF_AssertFail
_020392E6:
	ldr r0, _020392F0 ; =_021D4150
	ldr r0, [r0]
	add r0, #0x34
	pop {r3, pc}
	nop
_020392F0: .word _021D4150
	thumb_func_end sub_020392D8

	thumb_func_start sub_020392F4
sub_020392F4: ; 0x020392F4
	push {r3, lr}
	mov r0, #0
	bl sub_0203786C
	mov r0, #0
	bl ov00_021E6BE4
	cmp r0, #0
	beq _02039312
	bl ov00_021E6C68
	ldr r0, _02039328 ; =sub_0203847C
	mov r1, #0
	bl sub_020381C0
_02039312:
	mov r0, #0
	bl ov00_021E5E54
	cmp r0, #0
	bge _02039324
	ldr r0, _0203932C ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_02039324:
	pop {r3, pc}
	nop
_02039328: .word sub_0203847C
_0203932C: .word sub_02038E90
	thumb_func_end sub_020392F4

	thumb_func_start sub_02039330
sub_02039330: ; 0x02039330
	push {r3, lr}
	ldr r0, _02039350 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _0203934C
	mov r0, #1
	bl sub_0201A738
	bl sub_020343E4
	ldr r0, _02039354 ; =sub_0203847C
	mov r1, #5
	bl sub_020381C0
_0203934C:
	pop {r3, pc}
	nop
_02039350: .word _021D4150
_02039354: .word sub_0203847C
	thumb_func_end sub_02039330

	thumb_func_start sub_02039358
sub_02039358: ; 0x02039358
	push {r3, lr}
	ldr r0, _02039370 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _0203936E
	mov r1, #0
	add r0, #0x50
	strb r1, [r0]
	ldr r0, _02039374 ; =sub_020391D0
	bl sub_020381C0
_0203936E:
	pop {r3, pc}
	.balign 4, 0
_02039370: .word _021D4150
_02039374: .word sub_020391D0
	thumb_func_end sub_02039358

	thumb_func_start sub_02039378
sub_02039378: ; 0x02039378
	push {r3, lr}
	ldr r0, _020393AC ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _020393AA
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	bl sub_0203769C
	cmp r0, #0
	bne _02039398
	mov r1, #0
	ldr r0, _020393AC ; =_021D4150
	b _0203939C
_02039398:
	ldr r0, _020393AC ; =_021D4150
	mov r1, #1
_0203939C:
	ldr r0, [r0]
	add r0, #0x50
	strb r1, [r0]
	ldr r0, _020393B0 ; =sub_020391D0
	mov r1, #0
	bl sub_020381C0
_020393AA:
	pop {r3, pc}
	.balign 4, 0
_020393AC: .word _021D4150
_020393B0: .word sub_020391D0
	thumb_func_end sub_02039378

	thumb_func_start sub_020393B4
sub_020393B4: ; 0x020393B4
	push {r3, lr}
	bl sub_0203769C
	add r1, sp, #0
	strb r0, [r1]
	mov r0, #0x15
	add r1, sp, #0
	bl sub_020376E0
	pop {r3, pc}
	thumb_func_end sub_020393B4

	thumb_func_start sub_020393C8
sub_020393C8: ; 0x020393C8
	ldr r0, _02039408 ; =_021D4150
	ldr r2, [r0]
	cmp r2, #0
	beq _02039402
	ldr r1, [r2, #0x24]
	ldr r0, _0203940C ; =sub_02038E90
	cmp r1, r0
	bne _020393DC
	mov r0, #1
	bx lr
_020393DC:
	ldr r0, _02039410 ; =sub_02038E94
	cmp r1, r0
	bne _020393F0
	add r0, r2, #0
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	beq _020393F0
	mov r0, #1
	bx lr
_020393F0:
	ldr r0, _02039414 ; =sub_02039E7C
	cmp r1, r0
	bne _02039402
	add r2, #0x53
	ldrb r0, [r2]
	cmp r0, #0
	beq _02039402
	mov r0, #1
	bx lr
_02039402:
	mov r0, #0
	bx lr
	nop
_02039408: .word _021D4150
_0203940C: .word sub_02038E90
_02039410: .word sub_02038E94
_02039414: .word sub_02039E7C
	thumb_func_end sub_020393C8

	thumb_func_start sub_02039418
sub_02039418: ; 0x02039418
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02039468 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _02039466
	mov r1, #0xf
	add r2, r1, #0
	mov r0, #3
	add r2, #0xf1
	bl CreateHeapAtEnd
	mov r0, #0xf
	mov r1, #0x68
	bl AllocFromHeap
	ldr r1, _02039468 ; =_021D4150
	mov r2, #0x68
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _02039468 ; =_021D4150
	mov r2, #0x18
	ldr r1, [r0]
	add r1, #0x4e
	strb r2, [r1]
	ldr r2, [r0]
	mov r1, #1
	add r2, #0x55
	strb r1, [r2]
	ldr r0, [r0]
	str r4, [r0, #0x28]
	mov r0, #0
	bl sub_020398D4
	mov r0, #1
	bl sub_0201A728
_02039466:
	pop {r4, pc}
	.balign 4, 0
_02039468: .word _021D4150
	thumb_func_end sub_02039418

	thumb_func_start sub_0203946C
sub_0203946C: ; 0x0203946C
	push {r3, lr}
	ldr r0, _0203949C ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _02039498
	mov r0, #1
	bl sub_0201A738
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
	ldr r0, _0203949C ; =_021D4150
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _0203949C ; =_021D4150
	mov r1, #0
	str r1, [r0]
	mov r0, #0xf
	bl DestroyHeap
_02039498:
	pop {r3, pc}
	nop
_0203949C: .word _021D4150
	thumb_func_end sub_0203946C

	thumb_func_start sub_020394A0
sub_020394A0: ; 0x020394A0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020394F0 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _020394EE
	mov r1, #0xf
	add r2, r1, #0
	mov r0, #3
	add r2, #0xf1
	bl CreateHeapAtEnd
	mov r0, #0xf
	mov r1, #0x68
	bl AllocFromHeap
	ldr r1, _020394F0 ; =_021D4150
	mov r2, #0x68
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _020394F0 ; =_021D4150
	mov r2, #0x19
	ldr r1, [r0]
	add r1, #0x4e
	strb r2, [r1]
	ldr r2, [r0]
	mov r1, #1
	add r2, #0x55
	strb r1, [r2]
	ldr r0, [r0]
	str r4, [r0, #0x28]
	mov r0, #0
	bl sub_020398D4
	mov r0, #1
	bl sub_0201A728
_020394EE:
	pop {r4, pc}
	.balign 4, 0
_020394F0: .word _021D4150
	thumb_func_end sub_020394A0

	thumb_func_start sub_020394F4
sub_020394F4: ; 0x020394F4
	push {r3, lr}
	ldr r0, _02039524 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _02039520
	mov r0, #1
	bl sub_0201A738
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
	ldr r0, _02039524 ; =_021D4150
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _02039524 ; =_021D4150
	mov r1, #0
	str r1, [r0]
	mov r0, #0xf
	bl DestroyHeap
_02039520:
	pop {r3, pc}
	nop
_02039524: .word _021D4150
	thumb_func_end sub_020394F4

	thumb_func_start sub_02039528
sub_02039528: ; 0x02039528
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02039578 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _02039576
	mov r1, #0xf
	add r2, r1, #0
	mov r0, #3
	add r2, #0xf1
	bl CreateHeapAtEnd
	mov r0, #0xf
	mov r1, #0x68
	bl AllocFromHeap
	ldr r1, _02039578 ; =_021D4150
	mov r2, #0x68
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _02039578 ; =_021D4150
	mov r2, #0x24
	ldr r1, [r0]
	add r1, #0x4e
	strb r2, [r1]
	ldr r2, [r0]
	mov r1, #1
	add r2, #0x55
	strb r1, [r2]
	ldr r0, [r0]
	str r4, [r0, #0x28]
	mov r0, #0
	bl sub_020398D4
	mov r0, #1
	bl sub_0201A728
_02039576:
	pop {r4, pc}
	.balign 4, 0
_02039578: .word _021D4150
	thumb_func_end sub_02039528

	thumb_func_start sub_0203957C
sub_0203957C: ; 0x0203957C
	push {r3, lr}
	ldr r0, _020395AC ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _020395A8
	mov r0, #1
	bl sub_0201A738
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
	ldr r0, _020395AC ; =_021D4150
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _020395AC ; =_021D4150
	mov r1, #0
	str r1, [r0]
	mov r0, #0xf
	bl DestroyHeap
_020395A8:
	pop {r3, pc}
	nop
_020395AC: .word _021D4150
	thumb_func_end sub_0203957C

	thumb_func_start sub_020395B0
sub_020395B0: ; 0x020395B0
	push {r3, lr}
	sub sp, #8
	ldr r0, _02039608 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _020395C2
	add sp, #8
	mov r0, #0
	pop {r3, pc}
_020395C2:
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _020395CE
	cmp r0, #0x24
	bne _020395E4
_020395CE:
	add r0, sp, #4
	add r1, sp, #0
	bl ov00_021EC11C
	cmp r0, #0
	beq _02039600
	bl ov00_021EC210
	add sp, #8
	mov r0, #1
	pop {r3, pc}
_020395E4:
	cmp r0, #0x19
	bne _02039600
	add r0, sp, #4
	add r1, sp, #0
	bl ov00_021EC11C
	cmp r0, #0
	beq _02039600
	ldr r0, [sp]
	cmp r0, #7
	bne _02039600
	add sp, #8
	mov r0, #1
	pop {r3, pc}
_02039600:
	mov r0, #0
	add sp, #8
	pop {r3, pc}
	nop
_02039608: .word _021D4150
	thumb_func_end sub_020395B0

	thumb_func_start sub_0203960C
sub_0203960C: ; 0x0203960C
	push {r3, lr}
	bl ov00_021E5B6C
	ldr r1, _02039680 ; =_021D4150
	ldr r3, [r1]
	ldr r2, [r3, #0x44]
	sub r2, r2, #1
	str r2, [r3, #0x44]
	cmp r0, #0x1b
	bne _02039660
	ldr r1, [r1]
	add r0, r1, #0
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _02039656
	ldr r0, [r1, #0x60]
	bl ov45_0222E804
	cmp r0, #1
	bne _0203964C
	ldr r1, _02039680 ; =_021D4150
	mov r2, #1
	ldr r0, [r1]
	add r0, #0x64
	strb r2, [r0]
	ldr r1, [r1]
	ldr r0, _02039684 ; =sub_02039C14
	ldr r1, [r1, #0x44]
	bl sub_020381C0
	pop {r3, pc}
_0203964C:
	ldr r0, _02039688 ; =sub_02039DC0
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039656:
	ldr r0, _0203968C ; =sub_02039144
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039660:
	cmp r0, #0
	beq _0203966C
	ldr r0, _02039690 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_0203966C:
	ldr r0, _02039680 ; =_021D4150
	ldr r0, [r0]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	bgt _0203967E
	ldr r0, _02039690 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_0203967E:
	pop {r3, pc}
	.balign 4, 0
_02039680: .word _021D4150
_02039684: .word sub_02039C14
_02039688: .word sub_02039DC0
_0203968C: .word sub_02039144
_02039690: .word sub_02038E90
	thumb_func_end sub_0203960C

	thumb_func_start sub_02039694
sub_02039694: ; 0x02039694
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _020396EE
	mov r2, #0xd5
	mov r0, #3
	mov r1, #0x30
	lsl r2, r2, #0xa
	bl CreateHeapAtEnd
	mov r0, #1
	add r1, r0, #0
	lsl r2, r0, #9
	add r3, r0, #0
	bl sub_02035ED8
	cmp r0, #0
	beq _020396EE
	ldr r0, _020396F0 ; =_021D4150
	ldr r0, [r0]
	add r0, #0x4e
	ldrb r0, [r0]
	bl sub_02033FC4
	add r3, r0, #0
	ldr r0, _020396F0 ; =_021D4150
	mov r2, #0xb1
	ldr r0, [r0]
	mov r1, #0x30
	ldr r0, [r0, #0x28]
	lsl r2, r2, #0xa
	add r3, r3, #1
	bl ov00_021E5900
	ldr r0, _020396F4 ; =sub_020399DC
	bl ov00_021E6CA4
	bl sub_02035FD8
	mov r1, #0xe1
	ldr r0, _020396F8 ; =sub_0203960C
	lsl r1, r1, #4
	bl sub_020381C0
_020396EE:
	pop {r3, pc}
	.balign 4, 0
_020396F0: .word _021D4150
_020396F4: .word sub_020399DC
_020396F8: .word sub_0203960C
	thumb_func_end sub_02039694

	thumb_func_start sub_020396FC
sub_020396FC: ; 0x020396FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl Save_PlayerData_GetProfileAddr
	bl sub_02037474
	cmp r0, #0
	beq _02039712
	mov r0, #0
	pop {r3, r4, r5, pc}
_02039712:
	mov r0, #1
	bl sub_0201A728
	ldr r2, _02039760 ; =0x00007080
	mov r0, #3
	mov r1, #0xf
	bl CreateHeapAtEnd
	add r0, r5, #0
	mov r1, #0x17
	bl sub_02037C98
	mov r0, #0xf
	add r1, r4, #0
	bl AllocFromHeap
	ldr r1, _02039764 ; =_021D4150
	ldr r2, [r1]
	str r0, [r2]
	ldr r0, [r1]
	mov r1, #0
	ldr r0, [r0]
	add r2, r4, #0
	bl MI_CpuFill8
	ldr r0, _02039764 ; =_021D4150
	mov r1, #0
	ldr r2, [r0]
	add r2, #0x4f
	strb r1, [r2]
	ldr r0, [r0]
	str r5, [r0, #0x28]
	ldr r0, _02039768 ; =sub_02039694
	bl sub_020381C0
	ldr r0, _02039764 ; =_021D4150
	ldr r0, [r0]
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02039760: .word 0x00007080
_02039764: .word _021D4150
_02039768: .word sub_02039694
	thumb_func_end sub_020396FC

	thumb_func_start sub_0203976C
sub_0203976C: ; 0x0203976C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl Save_PlayerData_GetProfileAddr
	bl sub_02037474
	cmp r0, #0
	bne _020397B8
	mov r0, #1
	bl sub_0201A728
	ldr r2, _020397BC ; =0x00007080
	mov r0, #3
	mov r1, #0xf
	bl CreateHeapAtEnd
	add r0, r5, #0
	mov r1, #0x21
	bl sub_02037C98
	ldr r0, _020397C0 ; =_021D4150
	mov r1, #0
	ldr r2, [r0]
	str r1, [r2]
	ldr r2, [r0]
	str r4, [r2, #0x60]
	ldr r2, [r0]
	add r2, #0x64
	strb r1, [r2]
	ldr r2, [r0]
	add r2, #0x4f
	strb r1, [r2]
	ldr r0, [r0]
	str r5, [r0, #0x28]
	ldr r0, _020397C4 ; =sub_02039BA0
	bl sub_020381C0
_020397B8:
	pop {r3, r4, r5, pc}
	nop
_020397BC: .word 0x00007080
_020397C0: .word _021D4150
_020397C4: .word sub_02039BA0
	thumb_func_end sub_0203976C

	thumb_func_start sub_020397C8
sub_020397C8: ; 0x020397C8
	push {r3, lr}
	ldr r0, _020397DC ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _020397DA
	ldr r0, _020397E0 ; =sub_02039D78
	mov r1, #0
	bl sub_020381C0
_020397DA:
	pop {r3, pc}
	.balign 4, 0
_020397DC: .word _021D4150
_020397E0: .word sub_02039D78
	thumb_func_end sub_020397C8

	thumb_func_start sub_020397E4
sub_020397E4: ; 0x020397E4
	ldr r0, _020397F8 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _020397F0
	mov r0, #0
	bx lr
_020397F0:
	add r0, #0x64
	ldrb r0, [r0]
	bx lr
	nop
_020397F8: .word _021D4150
	thumb_func_end sub_020397E4

	thumb_func_start sub_020397FC
sub_020397FC: ; 0x020397FC
	ldr r0, _02039814 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _02039810
	ldr r1, [r0, #0x24]
	ldr r0, _02039818 ; =sub_02039DC0
	cmp r1, r0
	bne _02039810
	mov r0, #1
	bx lr
_02039810:
	mov r0, #0
	bx lr
	.balign 4, 0
_02039814: .word _021D4150
_02039818: .word sub_02039DC0
	thumb_func_end sub_020397FC

	thumb_func_start sub_0203981C
sub_0203981C: ; 0x0203981C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02039864 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	bne _0203982C
	bl GF_AssertFail
_0203982C:
	bl sub_020392A0
	cmp r0, #1
	beq _02039838
	bl GF_AssertFail
_02039838:
	add r0, r4, #0
	bl ov45_0222F274
	cmp r0, #0
	bne _02039854
	add r0, r4, #0
	mov r1, #4
	bl ov45_0222F028
	ldr r0, _02039868 ; =sub_02039DE4
	mov r1, #0
	bl sub_020381C0
	pop {r4, pc}
_02039854:
	add r0, r4, #0
	bl ov45_0222F350
	ldr r0, _02039868 ; =sub_02039DE4
	mov r1, #0
	bl sub_020381C0
	pop {r4, pc}
	.balign 4, 0
_02039864: .word _021D4150
_02039868: .word sub_02039DE4
	thumb_func_end sub_0203981C

	thumb_func_start sub_0203986C
sub_0203986C: ; 0x0203986C
	push {r3, lr}
	bl ov45_0222F464
	cmp r0, #1
	bne _0203987A
	bl ov45_0222F154
_0203987A:
	bl ov45_0222F70C
	ldr r0, _02039888 ; =sub_02039E30
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02039888: .word sub_02039E30
	thumb_func_end sub_0203986C

	thumb_func_start sub_0203988C
sub_0203988C: ; 0x0203988C
	ldr r0, _020398B8 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _020398B4
	ldr r1, [r0, #0x24]
	ldr r0, _020398BC ; =sub_02039DC4
	cmp r1, r0
	bne _020398A0
	mov r0, #2
	bx lr
_020398A0:
	ldr r0, _020398C0 ; =sub_02039DE4
	cmp r1, r0
	bne _020398AA
	mov r0, #1
	bx lr
_020398AA:
	ldr r0, _020398C4 ; =sub_02039E30
	cmp r1, r0
	bne _020398B4
	mov r0, #3
	bx lr
_020398B4:
	mov r0, #0
	bx lr
	.balign 4, 0
_020398B8: .word _021D4150
_020398BC: .word sub_02039DC4
_020398C0: .word sub_02039DE4
_020398C4: .word sub_02039E30
	thumb_func_end sub_0203988C

	thumb_func_start sub_020398C8
sub_020398C8: ; 0x020398C8
	ldr r0, _020398D0 ; =_021D4150
	ldr r0, [r0]
	ldr r0, [r0]
	bx lr
	.balign 4, 0
_020398D0: .word _021D4150
	thumb_func_end sub_020398C8

	thumb_func_start sub_020398D4
sub_020398D4: ; 0x020398D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02039914 ; =_021D4150
	ldr r2, [r0]
	cmp r2, #0
	beq _02039904
	add r2, #0x53
	strb r4, [r2]
	ldr r2, [r0]
	add r2, #0x54
	strb r1, [r2]
	cmp r4, #0
	beq _020398FC
	bl sub_02037454
	ldr r1, _02039914 ; =_021D4150
	ldr r1, [r1]
	add r1, #0x4b
	strb r0, [r1]
	b _02039904
_020398FC:
	ldr r0, [r0]
	mov r1, #0
	add r0, #0x4b
	strb r1, [r0]
_02039904:
	add r0, r4, #0
	bl sub_020356C0
	add r0, r4, #0
	bl sub_020356EC
	pop {r4, pc}
	nop
_02039914: .word _021D4150
	thumb_func_end sub_020398D4

	thumb_func_start sub_02039918
sub_02039918: ; 0x02039918
	ldr r0, _02039938 ; =_021D4150
	ldr r1, [r0]
	cmp r1, #0
	beq _02039934
	add r0, r1, #0
	add r0, #0x5d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0203992E
	mov r0, #1
	bx lr
_0203992E:
	add r1, #0x54
	ldrb r0, [r1]
	bx lr
_02039934:
	mov r0, #0
	bx lr
	.balign 4, 0
_02039938: .word _021D4150
	thumb_func_end sub_02039918

	thumb_func_start sub_0203993C
sub_0203993C: ; 0x0203993C
	ldr r0, _02039950 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _0203994A
	add r0, #0x4e
	ldrb r0, [r0]
	bx lr
_0203994A:
	mov r0, #1
	bx lr
	nop
_02039950: .word _021D4150
	thumb_func_end sub_0203993C

	thumb_func_start sub_02039954
sub_02039954: ; 0x02039954
	ldr r0, _02039968 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _02039962
	add r0, #0x4f
	ldrb r0, [r0]
	bx lr
_02039962:
	mov r0, #0
	bx lr
	nop
_02039968: .word _021D4150
	thumb_func_end sub_02039954

	thumb_func_start sub_0203996C
sub_0203996C: ; 0x0203996C
	ldr r1, _02039978 ; =_021D4150
	ldr r3, _0203997C ; =MI_CpuCopy8
	ldr r1, [r1]
	mov r2, #6
	add r1, r1, #4
	bx r3
	.balign 4, 0
_02039978: .word _021D4150
_0203997C: .word MI_CpuCopy8
	thumb_func_end sub_0203996C

	thumb_func_start sub_02039980
sub_02039980: ; 0x02039980
	add r1, r0, #0
	ldr r0, _02039990 ; =_021D4150
	ldr r3, _02039994 ; =MI_CpuCopy8
	ldr r0, [r0]
	mov r2, #6
	add r0, r0, #4
	bx r3
	nop
_02039990: .word _021D4150
_02039994: .word MI_CpuCopy8
	thumb_func_end sub_02039980

	thumb_func_start sub_02039998
sub_02039998: ; 0x02039998
	push {r3, lr}
	bl sub_0203993C
	bl sub_02034044
	pop {r3, pc}
	thumb_func_end sub_02039998

	thumb_func_start sub_020399A4
sub_020399A4: ; 0x020399A4
	ldr r1, _020399B4 ; =_021D4150
	ldr r1, [r1]
	cmp r1, #0
	beq _020399B0
	add r1, #0x56
	strb r0, [r1]
_020399B0:
	bx lr
	nop
_020399B4: .word _021D4150
	thumb_func_end sub_020399A4

	thumb_func_start sub_020399B8
sub_020399B8: ; 0x020399B8
	push {r3, lr}
	bl sub_0201A79C
	cmp r0, #0
	beq _020399C6
	mov r0, #0
	pop {r3, pc}
_020399C6:
	ldr r0, _020399D8 ; =_021D4150
	ldr r0, [r0]
	cmp r0, #0
	beq _020399D4
	add r0, #0x56
	ldrb r0, [r0]
	pop {r3, pc}
_020399D4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_020399D8: .word _021D4150
	thumb_func_end sub_020399B8

	thumb_func_start sub_020399DC
sub_020399DC: ; 0x020399DC
	push {r3, lr}
	add r2, r0, #0
	mov r0, #0
	mov r1, #1
	bl ShowCommunicationError
_020399E8:
	b _020399E8
	.balign 4, 0
	thumb_func_end sub_020399DC

	thumb_func_start sub_020399EC
sub_020399EC: ; 0x020399EC
	push {r3, lr}
	mov r0, #0
	mov r1, #4
	add r2, r0, #0
	bl ShowCommunicationError
_020399F8:
	b _020399F8
	.balign 4, 0
	thumb_func_end sub_020399EC

	thumb_func_start sub_020399FC
sub_020399FC: ; 0x020399FC
	bx lr
	.balign 4, 0
	thumb_func_end sub_020399FC

	thumb_func_start sub_02039A00
sub_02039A00: ; 0x02039A00
	push {r3, lr}
	bl sub_02039918
	cmp r0, #0
	beq _02039A98
	bl sub_02037700
	cmp r0, #0
	bne _02039A36
	bl sub_020393C8
	cmp r0, #0
	bne _02039A36
	bl sub_020395B0
	cmp r0, #0
	bne _02039A36
	ldr r0, _02039A9C ; =_021D4150
	ldr r0, [r0]
	add r0, #0x5d
	ldrb r0, [r0]
	cmp r0, #0
	bne _02039A36
	bl sub_020397FC
	cmp r0, #0
	beq _02039A98
_02039A36:
	bl sub_0201A79C
	cmp r0, #0
	bne _02039A98
	bl sub_020399B8
	cmp r0, #0
	bne _02039A98
	bl Sound_Stop
	ldr r0, _02039A9C ; =_021D4150
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bl Save_Cancel
	ldr r1, _02039AA0 ; =gSystem + 0x60
	mov r0, #1
	strb r0, [r1, #8]
	ldr r1, _02039A9C ; =_021D4150
	ldr r2, [r1]
	add r1, r2, #0
	add r1, #0x5d
	ldrb r1, [r1]
	cmp r1, #3
	bne _02039A70
	mov r0, #3
	bl sub_020399A4
	pop {r3, pc}
_02039A70:
	cmp r1, #5
	bne _02039A7C
	mov r0, #5
	bl sub_020399A4
	pop {r3, pc}
_02039A7C:
	add r2, #0x4e
	ldrb r1, [r2]
	cmp r1, #0x19
	beq _02039A8C
	cmp r1, #0xf
	beq _02039A8C
	cmp r1, #0x24
	bne _02039A94
_02039A8C:
	mov r0, #2
	bl sub_020399A4
	pop {r3, pc}
_02039A94:
	bl sub_020399A4
_02039A98:
	pop {r3, pc}
	nop
_02039A9C: .word _021D4150
_02039AA0: .word gSystem + 0x60
	thumb_func_end sub_02039A00

	thumb_func_start sub_02039AA4
sub_02039AA4: ; 0x02039AA4
	push {r3, lr}
	bl sub_02035630
	cmp r0, #0
	bne _02039AB6
	bl sub_02037D78
	cmp r0, #0
	bne _02039ABA
_02039AB6:
	mov r0, #1
	pop {r3, pc}
_02039ABA:
	bl sub_02034BE4
	cmp r0, #0
	bne _02039AC6
	mov r0, #1
	pop {r3, pc}
_02039AC6:
	bl sub_02033974
	cmp r0, #0
	beq _02039AD2
	mov r0, #1
	pop {r3, pc}
_02039AD2:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02039AA4

	thumb_func_start sub_02039AD8
sub_02039AD8: ; 0x02039AD8
	push {r3, lr}
	ldr r1, _02039AF4 ; =_021D4150
	ldr r1, [r1]
	cmp r1, #0
	beq _02039AEE
	add r1, #0x5d
	strb r0, [r1]
	bl sub_02037988
	mov r0, #1
	pop {r3, pc}
_02039AEE:
	mov r0, #0
	pop {r3, pc}
	nop
_02039AF4: .word _021D4150
	thumb_func_end sub_02039AD8

	thumb_func_start sub_02039AF8
sub_02039AF8: ; 0x02039AF8
	ldr r0, _02039B0C ; =_021D4150
	mov r1, #0x1d
	ldr r0, [r0]
	ldr r3, _02039B10 ; =ov00_021E5C84
	add r0, #0x4e
	strb r1, [r0]
	ldr r0, _02039B14 ; =sub_020369CC
	add r1, r0, #0
	bx r3
	nop
_02039B0C: .word _021D4150
_02039B10: .word ov00_021E5C84
_02039B14: .word sub_020369CC
	thumb_func_end sub_02039AF8

	thumb_func_start sub_02039B18
sub_02039B18: ; 0x02039B18
	ldr r0, _02039B2C ; =_021D4150
	mov r1, #0x23
	ldr r0, [r0]
	ldr r3, _02039B30 ; =ov00_021E5C84
	add r0, #0x4e
	strb r1, [r0]
	ldr r0, _02039B34 ; =sub_020369CC
	add r1, r0, #0
	bx r3
	nop
_02039B2C: .word _021D4150
_02039B30: .word ov00_021E5C84
_02039B34: .word sub_020369CC
	thumb_func_end sub_02039B18

	thumb_func_start sub_02039B38
sub_02039B38: ; 0x02039B38
	ldr r0, _02039B4C ; =_021D4150
	mov r1, #0x21
	ldr r0, [r0]
	ldr r3, _02039B50 ; =ov00_021E5C84
	add r0, #0x4e
	strb r1, [r0]
	ldr r0, _02039B54 ; =sub_020369CC
	add r1, r0, #0
	bx r3
	nop
_02039B4C: .word _021D4150
_02039B50: .word ov00_021E5C84
_02039B54: .word sub_020369CC
	thumb_func_end sub_02039B38

	thumb_func_start sub_02039B58
sub_02039B58: ; 0x02039B58
	ldr r0, _02039B6C ; =_021D4150
	ldr r3, _02039B70 ; =ov00_021E5C84
	ldr r0, [r0]
	mov r1, #0x17
	add r0, #0x4e
	strb r1, [r0]
	ldr r0, _02039B74 ; =sub_02036904
	ldr r1, _02039B78 ; =sub_020367A8
	bx r3
	nop
_02039B6C: .word _021D4150
_02039B70: .word ov00_021E5C84
_02039B74: .word sub_02036904
_02039B78: .word sub_020367A8
	thumb_func_end sub_02039B58

	thumb_func_start sub_02039B7C
sub_02039B7C: ; 0x02039B7C
	ldr r0, _02039B90 ; =_021D4150
	ldr r3, _02039B94 ; =ov00_021E5C84
	ldr r0, [r0]
	mov r1, #0x13
	add r0, #0x4e
	strb r1, [r0]
	ldr r0, _02039B98 ; =sub_02036904
	ldr r1, _02039B9C ; =sub_020367A8
	bx r3
	nop
_02039B90: .word _021D4150
_02039B94: .word ov00_021E5C84
_02039B98: .word sub_02036904
_02039B9C: .word sub_020367A8
	thumb_func_end sub_02039B7C

	thumb_func_start sub_02039BA0
sub_02039BA0: ; 0x02039BA0
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _02039C04
	mov r1, #0x30
	mov r0, #3
	lsl r2, r1, #0xd
	bl CreateHeapAtEnd
	mov r0, #1
	add r1, r0, #0
	lsl r2, r0, #9
	add r3, r0, #0
	bl sub_02035ED8
	cmp r0, #0
	beq _02039C04
	ldr r0, _02039C08 ; =_021D4150
	ldr r0, [r0]
	add r0, #0x4e
	ldrb r0, [r0]
	bl sub_02033FC4
	add r3, r0, #0
	ldr r0, _02039C08 ; =_021D4150
	mov r2, #0x16
	ldr r0, [r0]
	mov r1, #0x30
	ldr r0, [r0, #0x28]
	lsl r2, r2, #0xe
	add r3, r3, #1
	bl ov00_021E5900
	ldr r0, _02039C0C ; =sub_020399DC
	bl ov00_021E6CA4
	bl sub_02035FD8
	mov r0, #0
	bl ov00_021E70B8
	mov r0, #0
	bl sub_020378E4
	mov r1, #0xe1
	ldr r0, _02039C10 ; =sub_0203960C
	lsl r1, r1, #4
	bl sub_020381C0
_02039C04:
	pop {r3, pc}
	nop
_02039C08: .word _021D4150
_02039C0C: .word sub_020399DC
_02039C10: .word sub_0203960C
	thumb_func_end sub_02039BA0

	thumb_func_start sub_02039C14
sub_02039C14: ; 0x02039C14
	push {r3, lr}
	ldr r0, _02039C54 ; =_021D4150
	ldr r2, [r0]
	ldr r1, [r2, #0x44]
	sub r1, r1, #1
	str r1, [r2, #0x44]
	ldr r0, [r0]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	bgt _02039C32
	ldr r0, _02039C58 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039C32:
	mov r0, #1
	bl sub_0203786C
	bl sub_02039D3C
	cmp r0, #0
	beq _02039C50
	bl ov45_0222E8F4
	cmp r0, #0
	beq _02039C50
	ldr r0, _02039C5C ; =sub_02039C60
	mov r1, #0
	bl sub_020381C0
_02039C50:
	pop {r3, pc}
	nop
_02039C54: .word _021D4150
_02039C58: .word sub_02038E90
_02039C5C: .word sub_02039C60
	thumb_func_end sub_02039C14

	thumb_func_start sub_02039C60
sub_02039C60: ; 0x02039C60
	push {r3, lr}
	bl sub_02039D3C
	cmp r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02039C60

	thumb_func_start sub_02039C6C
sub_02039C6C: ; 0x02039C6C
	push {r4, lr}
	mov r4, #1
	cmp r0, #0xa
	blt _02039C84
	cmp r0, #0x14
	bge _02039C84
	ldr r0, _02039CF4 ; =sub_02038EB4
	mov r1, #0
	bl sub_020381C0
	mov r4, #0
	b _02039CC8
_02039C84:
	cmp r0, #0
	bge _02039C94
	ldr r0, _02039CF8 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	mov r4, #0
	b _02039CC8
_02039C94:
	cmp r0, #0x17
	bne _02039CA4
	ldr r0, _02039CFC ; =sub_02039E7C
	mov r1, #0
	bl sub_020381C0
	mov r4, #0
	b _02039CC8
_02039CA4:
	cmp r0, #0x18
	bne _02039CC8
	ldr r0, _02039D00 ; =_021D4150
	mov r4, #0
	ldr r0, [r0]
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	beq _02039CC0
	ldr r0, _02039CF8 ; =sub_02038E90
	add r1, r4, #0
	bl sub_020381C0
	b _02039CC8
_02039CC0:
	ldr r0, _02039D04 ; =sub_02038EB0
	add r1, r4, #0
	bl sub_020381C0
_02039CC8:
	ldr r0, _02039D00 ; =_021D4150
	ldr r0, [r0]
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	beq _02039CEE
	bl sub_02037454
	ldr r1, _02039D00 ; =_021D4150
	ldr r1, [r1]
	add r1, #0x4b
	ldrb r1, [r1]
	cmp r1, r0
	beq _02039CEE
	ldr r0, _02039CF8 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	mov r4, #0
_02039CEE:
	add r0, r4, #0
	pop {r4, pc}
	nop
_02039CF4: .word sub_02038EB4
_02039CF8: .word sub_02038E90
_02039CFC: .word sub_02039E7C
_02039D00: .word _021D4150
_02039D04: .word sub_02038EB0
	thumb_func_end sub_02039C6C

	thumb_func_start sub_02039D08
sub_02039D08: ; 0x02039D08
	push {r4, lr}
	mov r4, #1
	bl ov45_0222E6C8
	cmp r0, #4
	bhi _02039D34
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02039D20: ; jump table
	.short _02039D34 - _02039D20 - 2 ; case 0
	.short _02039D34 - _02039D20 - 2 ; case 1
	.short _02039D34 - _02039D20 - 2 ; case 2
	.short _02039D34 - _02039D20 - 2 ; case 3
	.short _02039D2A - _02039D20 - 2 ; case 4
_02039D2A:
	ldr r0, _02039D38 ; =sub_02039DC0
	mov r1, #0
	bl sub_020381C0
	mov r4, #0
_02039D34:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02039D38: .word sub_02039DC0
	thumb_func_end sub_02039D08

	thumb_func_start sub_02039D3C
sub_02039D3C: ; 0x02039D3C
	push {r3, lr}
	mov r0, #0
	bl ov00_021E5E54
	bl sub_02039C6C
	cmp r0, #0
	beq _02039D50
	bl sub_02039D08
_02039D50:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02039D3C

	thumb_func_start sub_02039D54
sub_02039D54: ; 0x02039D54
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	bl ov00_021E5E54
	cmp r0, #0x14
	blt _02039D66
	str r0, [r4]
	b _02039D72
_02039D66:
	mov r1, #0
	str r1, [r4]
	bl sub_02039C6C
	cmp r0, #0
	beq _02039D76
_02039D72:
	bl sub_02039D08
_02039D76:
	pop {r4, pc}
	thumb_func_end sub_02039D54

	thumb_func_start sub_02039D78
sub_02039D78: ; 0x02039D78
	push {r3, lr}
	bl ov45_0222E91C
	ldr r0, _02039D88 ; =sub_02039D8C
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
	.balign 4, 0
_02039D88: .word sub_02039D8C
	thumb_func_end sub_02039D78

	thumb_func_start sub_02039D8C
sub_02039D8C: ; 0x02039D8C
	push {r3, lr}
	mov r0, #0
	bl ov00_021E5E54
	bl sub_02039D08
	bl ov45_0222E944
	cmp r0, #0
	beq _02039DB8
	mov r0, #1
	bl sub_0201A738
	bl sub_020343E4
	ldr r0, _02039DBC ; =sub_0203847C
	mov r1, #5
	bl sub_020381C0
	mov r0, #0
	bl sub_0203786C
_02039DB8:
	pop {r3, pc}
	nop
_02039DBC: .word sub_0203847C
	thumb_func_end sub_02039D8C

	thumb_func_start sub_02039DC0
sub_02039DC0: ; 0x02039DC0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02039DC0

	thumb_func_start sub_02039DC4
sub_02039DC4: ; 0x02039DC4
	push {r3, lr}
	bl sub_02039D3C
	bl ov45_0222F254
	cmp r0, #1
	bne _02039DDE
	bl ov45_0222F70C
	ldr r0, _02039DE0 ; =sub_02039E30
	mov r1, #0
	bl sub_020381C0
_02039DDE:
	pop {r3, pc}
	.balign 4, 0
_02039DE0: .word sub_02039E30
	thumb_func_end sub_02039DC4

	thumb_func_start sub_02039DE4
sub_02039DE4: ; 0x02039DE4
	push {r3, lr}
	bl ov45_0222F254
	cmp r0, #1
	bne _02039DFC
	bl ov45_0222F70C
	ldr r0, _02039E24 ; =sub_02039E30
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039DFC:
	add r0, sp, #0
	bl sub_02039D54
	ldr r0, [sp]
	cmp r0, #0
	beq _02039E22
	cmp r0, #0x14
	bne _02039E16
	ldr r0, _02039E28 ; =sub_02039DC4
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039E16:
	bl ov45_0222F70C
	ldr r0, _02039E2C ; =sub_02039C60
	mov r1, #0
	bl sub_020381C0
_02039E22:
	pop {r3, pc}
	.balign 4, 0
_02039E24: .word sub_02039E30
_02039E28: .word sub_02039DC4
_02039E2C: .word sub_02039C60
	thumb_func_end sub_02039DE4

	thumb_func_start sub_02039E30
sub_02039E30: ; 0x02039E30
	push {r3, lr}
	mov r0, #1
	bl ov00_021E5E54
	cmp r0, #0
	bge _02039E46
	ldr r0, _02039E74 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
	pop {r3, pc}
_02039E46:
	bl sub_02039D08
	cmp r0, #0
	beq _02039E72
	mov r0, #0
	bl ov00_021E6BE4
	cmp r0, #0
	beq _02039E72
	bl ov00_021E6C68
	cmp r0, #0
	beq _02039E72
	bl sub_0203622C
	mov r0, #0
	bl sub_020378E4
	ldr r0, _02039E78 ; =sub_02039C60
	mov r1, #0
	bl sub_020381C0
_02039E72:
	pop {r3, pc}
	.balign 4, 0
_02039E74: .word sub_02038E90
_02039E78: .word sub_02039C60
	thumb_func_end sub_02039E30

	thumb_func_start sub_02039E7C
sub_02039E7C: ; 0x02039E7C
	push {r3, lr}
	mov r0, #0
	bl ov00_021E5E54
	cmp r0, #0
	bge _02039E90
	ldr r0, _02039E98 ; =sub_02038E90
	mov r1, #0
	bl sub_020381C0
_02039E90:
	bl sub_02039D08
	pop {r3, pc}
	nop
_02039E98: .word sub_02038E90
	thumb_func_end sub_02039E7C

	thumb_func_start sub_02039E9C
sub_02039E9C: ; 0x02039E9C
	ldr r0, _02039EA8 ; =_021D4150
	mov r1, #0x22
	ldr r0, [r0]
	add r0, #0x4e
	strb r1, [r0]
	bx lr
	.balign 4, 0
_02039EA8: .word _021D4150
	thumb_func_end sub_02039E9C

	thumb_func_start sub_02039EAC
sub_02039EAC: ; 0x02039EAC
	mov r1, #0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02039EAC

	thumb_func_start sub_02039EB4
sub_02039EB4: ; 0x02039EB4
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r6, r1, #0
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #6
	bhi _02039F64
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02039ECE: ; jump table
	.short _02039EDC - _02039ECE - 2 ; case 0
	.short _02039EE8 - _02039ECE - 2 ; case 1
	.short _02039F00 - _02039ECE - 2 ; case 2
	.short _02039F28 - _02039ECE - 2 ; case 3
	.short _02039F38 - _02039ECE - 2 ; case 4
	.short _02039F5A - _02039ECE - 2 ; case 5
	.short _02039F60 - _02039ECE - 2 ; case 6
_02039EDC:
	mov r0, #0x6f
	bl sub_02037AC0
	mov r0, #1
	str r0, [r4]
	b _02039F64
_02039EE8:
	mov r0, #0x6f
	bl sub_02037B38
	cmp r0, #0
	beq _02039F64
	add r0, r5, #0
	add r1, r6, #0
	bl Save_PrepareForAsyncWrite
	mov r0, #2
	str r0, [r4]
	b _02039F64
_02039F00:
	bl Save_WriteFileAsync
	add r5, r0, #0
	cmp r5, #2
	bne _02039F0E
	bl GF_AssertFail
_02039F0E:
	cmp r5, #1
	bne _02039F1E
	mov r0, #3
	str r0, [r4]
	mov r0, #0x70
	bl sub_02037AC0
	b _02039F64
_02039F1E:
	cmp r5, #3
	bne _02039F64
	mov r0, #7
	str r0, [r4]
	b _02039F64
_02039F28:
	mov r0, #0x70
	bl sub_02037B38
	cmp r0, #0
	beq _02039F64
	mov r0, #4
	str r0, [r4]
	b _02039F64
_02039F38:
	bl Save_WriteFileAsync
	add r5, r0, #0
	cmp r5, #1
	bne _02039F46
	bl GF_AssertFail
_02039F46:
	cmp r5, #2
	bne _02039F50
	mov r0, #5
	str r0, [r4]
	b _02039F64
_02039F50:
	cmp r5, #3
	bne _02039F64
	mov r0, #7
	str r0, [r4]
	b _02039F64
_02039F5A:
	mov r0, #6
	str r0, [r4]
	b _02039F64
_02039F60:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02039F64:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02039EB4

	thumb_func_start sub_02039F68
sub_02039F68: ; 0x02039F68
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl sub_02037454
	add r7, r0, #0
	mov r0, #0
	bl sub_02034818
	cmp r0, #0
	beq _02039FB6
	mov r5, #0
	cmp r7, #0
	ble _02039FB6
_02039F82:
	bl sub_0203769C
	cmp r5, r0
	beq _02039FB0
	add r0, r5, #0
	bl sub_020348A8
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020348CC
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02034818
	bl PlayerProfile_GetLanguage
	add r3, r0, #0
	ldr r0, [sp]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02039FB8
_02039FB0:
	add r5, r5, #1
	cmp r5, r7
	blt _02039F82
_02039FB6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02039F68

	thumb_func_start sub_02039FB8
sub_02039FB8: ; 0x02039FB8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0202CA94
	cmp r0, #0
	bne _02039FD4
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #1
	bl sub_0202CAE4
_02039FD4:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02039FB8

	thumb_func_start sub_02039FD8
sub_02039FD8: ; 0x02039FD8
	push {r3, r4, r5, lr}
	mov r1, #0x72
	lsl r1, r1, #4
	bl AllocFromHeap
	add r4, r0, #0
	add r0, #0x1f
	mov r1, #0x1f
	bic r0, r1
	bl DWC_Init
	add r5, r0, #0
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02039FD8

	thumb_func_start sub_02039FFC
sub_02039FFC: ; 0x02039FFC
	push {r4, lr}
	add r4, r0, #0
	bl LoadDwcOverlay
	bl LoadOVY38
	add r0, r4, #0
	bl sub_02039FD8
	add r4, r0, #0
	bl UnloadDwcOverlay
	bl UnloadOVY38
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_02039FFC

	thumb_func_start sub_0203A01C
sub_0203A01C: ; 0x0203A01C
	push {r4, lr}
	bl sub_0202C08C
	add r4, r0, #0
	bl DWC_CheckUserData
	cmp r0, #0
	bne _0203A03A
	ldr r1, _0203A03C ; =0x4144414A
	add r0, r4, #0
	bl DWC_CreateUserData
	add r0, r4, #0
	bl DWC_ClearDirtyFlag
_0203A03A:
	pop {r4, pc}
	.balign 4, 0
_0203A03C: .word 0x4144414A
	thumb_func_end sub_0203A01C

	thumb_func_start sub_0203A040
sub_0203A040: ; 0x0203A040
	push {r3, r4, lr}
	sub sp, #0xc
	bl sub_0202C08C
	add r4, r0, #0
	add r1, sp, #0
	bl DWC_CreateExchangeToken
	add r0, r4, #0
	add r1, sp, #0
	bl DWC_GetGsProfileId
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end sub_0203A040

	thumb_func_start sub_0203A05C
sub_0203A05C: ; 0x0203A05C
	push {r4, lr}
	bl sub_0202C6F4
	bl sub_0202C08C
	add r4, r0, #0
	bl DWC_CheckHasProfile
	cmp r0, #0
	beq _0203A07E
	add r0, r4, #0
	bl DWC_CheckValidConsole
	cmp r0, #0
	beq _0203A07E
	mov r0, #1
	pop {r4, pc}
_0203A07E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203A05C

	thumb_func_start sub_0203A084
sub_0203A084: ; 0x0203A084
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r5, r1, #0
	str r2, [sp]
	bl sub_0202C6F4
	bl sub_0202C08C
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0202C6F4
	mov r1, #0
	bl sub_0202C23C
	add r4, r0, #0
	mov r1, #0
	ldr r0, [sp]
	mvn r1, r1
	str r1, [r0]
	add r0, r5, #0
	bl DWC_IsValidFriendData
	cmp r0, #0
	bne _0203A0BE
	add sp, #8
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0203A0BE:
	mov r7, #0
_0203A0C0:
	add r0, r5, #0
	add r1, r4, #0
	bl DWC_IsEqualFriendData
	cmp r0, #0
	beq _0203A0D6
	ldr r0, [sp]
	add sp, #8
	str r7, [r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0203A0D6:
	add r0, r6, #0
	add r1, r5, #0
	bl DWC_GetGsProfileId
	cmp r0, #0
	ble _0203A104
	add r0, r6, #0
	add r1, r5, #0
	bl DWC_GetGsProfileId
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r4, #0
	bl DWC_GetGsProfileId
	ldr r1, [sp, #4]
	cmp r1, r0
	bne _0203A104
	ldr r0, [sp]
	add sp, #8
	str r7, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0203A104:
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #0
	bge _0203A11A
	add r0, r4, #0
	bl DWC_IsValidFriendData
	cmp r0, #0
	bne _0203A11A
	ldr r0, [sp]
	str r7, [r0]
_0203A11A:
	add r7, r7, #1
	add r4, #0xc
	cmp r7, #0x20
	blt _0203A0C0
	mov r0, #2
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0203A084

	thumb_func_start sub_0203A128
sub_0203A128: ; 0x0203A128
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	add r6, r3, #0
	bl sub_0202C6F4
	bl sub_0202C08C
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0202C6F4
	mov r1, #0
	bl sub_0202C23C
	add r5, r0, #0
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, r7, #0
	bl DWC_CheckFriendKey
	cmp r0, #0
	bne _0203A160
	add sp, #0x18
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0203A160:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, sp, #0xc
	bl DWC_CreateFriendKeyToken
	add r0, r7, #0
	add r1, sp, #0xc
	bl DWC_GetGsProfileId
	cmp r0, #0
	bgt _0203A17C
	add sp, #0x18
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0203A17C:
	mov r0, #0
	mvn r0, r0
	str r0, [r6]
	mov r4, #0
_0203A184:
	add r0, r7, #0
	add r1, sp, #0xc
	bl DWC_GetGsProfileId
	str r0, [sp, #8]
	add r0, r7, #0
	add r1, r5, #0
	bl DWC_GetGsProfileId
	ldr r1, [sp, #8]
	cmp r1, r0
	bne _0203A1A4
	add sp, #0x18
	str r4, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0203A1A4:
	ldr r0, [r6]
	cmp r0, #0
	bge _0203A1B6
	add r0, r5, #0
	bl DWC_IsValidFriendData
	cmp r0, #0
	bne _0203A1B6
	str r4, [r6]
_0203A1B6:
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #0x20
	blt _0203A184
	mov r0, #2
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0203A128

	thumb_func_start sub_0203A1C4
sub_0203A1C4: ; 0x0203A1C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	mov r1, #0
	add r5, r0, #0
	str r2, [sp, #4]
	str r1, [sp, #0xc]
	bl sub_0202C6F4
	mov r1, #0
	bl sub_0202C23C
	str r0, [sp, #8]
	mov r4, #0
	bl sub_02037454
	cmp r0, #0
	ble _0203A278
_0203A1E8:
	bl sub_0203769C
	cmp r4, r0
	beq _0203A26C
	add r0, r4, #0
	bl sub_0203484C
	add r7, r0, #0
	beq _0203A26C
	add r0, r5, #0
	add r1, r7, #0
	add r2, sp, #0x10
	bl sub_0203A084
	str r0, [r6]
	cmp r0, #3
	bne _0203A20E
	bl GF_AssertFail
_0203A20E:
	ldr r0, [r6]
	cmp r0, #0
	bne _0203A22C
	mov r0, #2
	str r0, [sp]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203A280
	add r0, r5, #0
	bl sub_02034A20
	b _0203A26C
_0203A22C:
	cmp r0, #1
	bne _0203A264
	bl sub_02039998
	cmp r0, #0
	bne _0203A26C
	mov r0, #1
	str r0, [sp]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203A280
	ldr r2, [sp, #0x10]
	mov r1, #0xc
	add r3, r2, #0
	mul r3, r1
	ldr r1, [sp, #8]
	add r0, r7, #0
	add r1, r1, r3
	mov r2, #0xc
	bl MI_CpuCopy8
	add r0, r5, #0
	bl sub_02034A20
	b _0203A26C
_0203A264:
	cmp r0, #2
	bne _0203A26C
	mov r0, #1
	str r0, [sp, #0xc]
_0203A26C:
	add r6, r6, #4
	add r4, r4, #1
	bl sub_02037454
	cmp r4, r0
	blt _0203A1E8
_0203A278:
	ldr r0, [sp, #0xc]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203A1C4

	thumb_func_start sub_0203A280
sub_0203A280: ; 0x0203A280
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r2, #0
	str r0, [sp]
	add r7, r1, #0
	str r3, [sp, #4]
	bl sub_0202C6F4
	add r1, r5, #0
	add r4, r0, #0
	bl sub_0202C23C
	str r0, [sp, #8]
	add r0, r7, #0
	bl sub_02034818
	add r6, r0, #0
	ldr r0, [sp, #0x28]
	cmp r0, #2
	beq _0203A2B6
	add r0, r7, #0
	bl sub_0203484C
	ldr r1, [sp, #8]
	mov r2, #0xc
	bl MI_CpuCopy8
_0203A2B6:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	bne _0203A2FC
	ldr r1, [sp, #4]
	add r0, r6, #0
	bl PlayerProfile_GetPlayerName_NewString
	str r0, [sp, #0xc]
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0202C270
	ldr r0, [sp, #0xc]
	bl String_Delete
	add r0, r6, #0
	bl PlayerProfile_GetTrainerGender
	add r3, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #8
	bl sub_0202C190
	add r0, r6, #0
	bl PlayerProfile_GetTrainerID
	add r3, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl sub_0202C190
	b _0203A334
_0203A2FC:
	sub r0, r0, #1
	cmp r0, #1
	bhi _0203A334
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #8
	bl sub_0202C090
	cmp r0, #2
	bne _0203A334
	add r0, r6, #0
	bl PlayerProfile_GetTrainerGender
	add r3, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #8
	bl sub_0202C190
	add r0, r6, #0
	bl PlayerProfile_GetTrainerID
	add r3, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl sub_0202C190
_0203A334:
	ldr r1, [sp, #4]
	mov r0, #0x78
	bl String_New
	str r0, [sp, #0x10]
	add r0, r7, #0
	bl sub_02034884
	add r1, r0, #0
	ldr r0, [sp, #0x10]
	bl CopyU16ArrayToString
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0202C2B4
	ldr r0, [sp, #0x10]
	bl String_Delete
	add r0, r6, #0
	bl PlayerProfile_GetAvatar
	add r3, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #7
	bl sub_0202C190
	ldr r0, [sp]
	bl sub_02034A20
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0203A280

	thumb_func_start sub_0203A378
sub_0203A378: ; 0x0203A378
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl sub_0203484C
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0202C6F4
	add r5, r0, #0
	mov r4, #0
_0203A38E:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202C23C
	add r1, r0, #0
	add r0, r6, #0
	bl DWC_IsEqualFriendData
	cmp r0, #0
	beq _0203A3A6
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_0203A3A6:
	add r4, r4, #1
	cmp r4, #0x20
	blt _0203A38E
	mov r0, #0x20
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203A378
