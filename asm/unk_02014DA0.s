	.include "asm/macros.inc"
	.include "global.inc"

	.public NNS_G3dGlb

	.rodata

_020F6078:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_020F6084:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020F6090:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
_020F609C:
	.word sub_02014FA4
	.word sub_02014FD0
	.word sub_02014FFC
	.word sub_02015028
	.word sub_02015054
	.word sub_02015080
	.word sub_020150AC
	.word sub_020150D8
	.word sub_02015104
	.word sub_02015130
	.word sub_0201515C
	.word sub_02015188
	.word sub_020151B4
	.word sub_020151E0
	.word sub_0201520C
	.word sub_02015238
_020F60DC:
	.short 0x011F, 0xFFFF ; ‣

	.bss

_021D10A0:
	.space 8

_021D10A8:
	.space 0x40

	.text

	thumb_func_start sub_02014DA0
sub_02014DA0: ; 0x02014DA0
	mov r1, #0
	ldr r2, _02014DB0 ; =_021D10A8
	add r0, r1, #0
_02014DA6:
	add r1, r1, #1
	stmia r2!, {r0}
	cmp r1, #0x10
	blt _02014DA6
	bx lr
	.balign 4, 0
_02014DB0: .word _021D10A8
	thumb_func_end sub_02014DA0

	thumb_func_start sub_02014DB4
sub_02014DB4: ; 0x02014DB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #8]
	ldr r1, _02014EA8 ; =_021D10A8
	add r7, r0, #0
	add r6, r2, #0
	str r3, [sp, #0xc]
	mov r5, #0
_02014DC4:
	ldr r0, [r1]
	cmp r0, #0
	beq _02014DD2
	add r5, r5, #1
	add r1, r1, #4
	cmp r5, #0x10
	blt _02014DC4
_02014DD2:
	cmp r5, #0x10
	blt _02014DDC
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02014DDC:
	ldr r0, [sp, #0x2c]
	mov r1, #0xdc
	bl AllocFromHeap
	add r4, r0, #0
	bne _02014DEC
	bl GF_AssertFail
_02014DEC:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xdc
	bl memset
	add r2, r4, #0
	ldr r0, [sp, #8]
	str r7, [r4, #0x18]
	ldr r3, _02014EAC ; =_020F6090
	str r0, [r4, #0x1c]
	ldmia r3!, {r0, r1}
	add r2, #0x34
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _02014EB0 ; =_020F6078
	str r0, [r2]
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x40
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _02014EB4 ; =_020F6084
	str r0, [r2]
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x4c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #0
	str r0, [r2]
	ldr r2, [sp, #0xc]
	add r0, r6, #0
	bl memset
	ldr r0, [sp, #0xc]
	str r6, [r4, #0xc]
	str r6, [r4, #0x10]
	add r0, r6, r0
	str r0, [r4, #0x14]
	add r0, r4, #0
	add r0, #0xda
	strb r5, [r0]
	ldr r0, _02014EA8 ; =_021D10A8
	lsl r5, r5, #2
	str r4, [r0, r5]
	ldr r0, [sp, #0x28]
	cmp r0, #1
	bne _02014E80
	ldr r0, [sp, #0x2c]
	bl GF_Camera_Create
	str r0, [r4, #0x20]
	mov r3, #0
	str r3, [r4, #0x24]
	str r3, [r4, #0x28]
	mov r0, #2
	str r3, [r4, #0x2c]
	lsl r0, r0, #0xc
	strh r0, [r4, #0x30]
	str r3, [sp]
	ldr r0, [r4, #0x20]
	ldr r1, _02014EAC ; =_020F6090
	str r0, [sp, #4]
	ldrh r2, [r4, #0x30]
	ldr r0, _02014EB4 ; =_020F6084
	bl sub_02023308
	add r0, r4, #0
	mov r1, #0
	add r0, #0xdb
	strb r1, [r0]
	ldr r0, [r4, #0x20]
	bl GF_Camera_RegisterToStaticPtr
_02014E80:
	mov r0, #6
	str r0, [sp]
	mov r0, #0x3f
	str r0, [sp, #4]
	ldr r0, _02014EB8 ; =_020F609C
	mov r1, #0x14
	ldr r0, [r0, r5]
	mov r2, #0xc8
	mov r3, #5
	bl SPL_Init
	str r0, [r4]
	ldr r1, _02014EB0 ; =_020F6078
	add r0, r4, #0
	bl sub_020154E4
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02014EA8: .word _021D10A8
_02014EAC: .word _020F6090
_02014EB0: .word _020F6078
_02014EB4: .word _020F6084
_02014EB8: .word _020F609C
	thumb_func_end sub_02014DB4

	thumb_func_start sub_02014EBC
sub_02014EBC: ; 0x02014EBC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_020154B8
	add r0, r5, #0
	add r0, #0xd8
	ldrb r1, [r0]
	mov r0, #1
	tst r0, r1
	beq _02014EDA
	add r0, r5, #0
	add r0, #0x58
	bl NNS_GfdSetFrmTexVramState
	b _02014EFA
_02014EDA:
	mov r0, #2
	tst r0, r1
	beq _02014EFA
	mov r6, #0
	add r4, r5, #0
	add r7, r6, #0
_02014EE6:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq _02014EF2
	bl NNS_GfdFreeLnkTexVram
	str r7, [r4, #0x58]
_02014EF2:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #0x10
	blt _02014EE6
_02014EFA:
	add r0, r5, #0
	add r0, #0xd8
	ldrb r1, [r0]
	mov r0, #4
	tst r0, r1
	beq _02014F10
	add r0, r5, #0
	add r0, #0x98
	bl NNS_GfdSetFrmPlttVramState
	b _02014F38
_02014F10:
	mov r0, #8
	tst r0, r1
	beq _02014F38
	mov r6, #0
	add r4, r5, #0
	add r7, r6, #0
_02014F1C:
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	cmp r0, #0
	beq _02014F30
	bl NNS_GfdFreeLnkPlttVram
	add r0, r4, #0
	add r0, #0x98
	str r7, [r0]
_02014F30:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #0x10
	blt _02014F1C
_02014F38:
	add r0, r5, #0
	mov r1, #0
	add r0, #0xd8
	strb r1, [r0]
	str r1, [r5, #8]
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _02014F50
	bl FreeToHeap
	mov r0, #0
	str r0, [r5, #4]
_02014F50:
	ldr r2, _02014F80 ; =_021D10A8
	mov r1, #0
_02014F54:
	ldr r0, [r2]
	cmp r0, r5
	bne _02014F64
	ldr r0, _02014F80 ; =_021D10A8
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r0, r1]
	b _02014F6C
_02014F64:
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #0x10
	blt _02014F54
_02014F6C:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _02014F76
	bl sub_02023120
_02014F76:
	add r0, r5, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02014F80: .word _021D10A8
	thumb_func_end sub_02014EBC

	thumb_func_start sub_02014F84
sub_02014F84: ; 0x02014F84
	push {r3, r4, r5, lr}
	ldr r5, _02014FA0 ; =_021D10A8
	mov r4, #0
_02014F8A:
	ldr r0, [r5]
	cmp r0, #0
	beq _02014F94
	bl sub_02014EBC
_02014F94:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x10
	blt _02014F8A
	pop {r3, r4, r5, pc}
	nop
_02014FA0: .word _021D10A8
	thumb_func_end sub_02014F84

	thumb_func_start sub_02014FA4
sub_02014FA4: ; 0x02014FA4
	push {r4, lr}
	ldr r1, _02014FCC ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #8]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _02014FBC
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_02014FBC:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _02014FC8
	bl GF_AssertFail
_02014FC8:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02014FCC: .word _021D10A0
	thumb_func_end sub_02014FA4

	thumb_func_start sub_02014FD0
sub_02014FD0: ; 0x02014FD0
	push {r4, lr}
	ldr r1, _02014FF8 ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #0xc]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _02014FE8
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_02014FE8:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _02014FF4
	bl GF_AssertFail
_02014FF4:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02014FF8: .word _021D10A0
	thumb_func_end sub_02014FD0

	thumb_func_start sub_02014FFC
sub_02014FFC: ; 0x02014FFC
	push {r4, lr}
	ldr r1, _02015024 ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #0x10]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _02015014
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_02015014:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _02015020
	bl GF_AssertFail
_02015020:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02015024: .word _021D10A0
	thumb_func_end sub_02014FFC

	thumb_func_start sub_02015028
sub_02015028: ; 0x02015028
	push {r4, lr}
	ldr r1, _02015050 ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #0x14]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _02015040
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_02015040:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _0201504C
	bl GF_AssertFail
_0201504C:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02015050: .word _021D10A0
	thumb_func_end sub_02015028

	thumb_func_start sub_02015054
sub_02015054: ; 0x02015054
	push {r4, lr}
	ldr r1, _0201507C ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #0x18]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _0201506C
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_0201506C:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _02015078
	bl GF_AssertFail
_02015078:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_0201507C: .word _021D10A0
	thumb_func_end sub_02015054

	thumb_func_start sub_02015080
sub_02015080: ; 0x02015080
	push {r4, lr}
	ldr r1, _020150A8 ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #0x1c]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _02015098
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_02015098:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _020150A4
	bl GF_AssertFail
_020150A4:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_020150A8: .word _021D10A0
	thumb_func_end sub_02015080

	thumb_func_start sub_020150AC
sub_020150AC: ; 0x020150AC
	push {r4, lr}
	ldr r1, _020150D4 ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #0x20]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _020150C4
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_020150C4:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _020150D0
	bl GF_AssertFail
_020150D0:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_020150D4: .word _021D10A0
	thumb_func_end sub_020150AC

	thumb_func_start sub_020150D8
sub_020150D8: ; 0x020150D8
	push {r4, lr}
	ldr r1, _02015100 ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #0x24]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _020150F0
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_020150F0:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _020150FC
	bl GF_AssertFail
_020150FC:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02015100: .word _021D10A0
	thumb_func_end sub_020150D8

	thumb_func_start sub_02015104
sub_02015104: ; 0x02015104
	push {r4, lr}
	ldr r1, _0201512C ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #0x28]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _0201511C
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_0201511C:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _02015128
	bl GF_AssertFail
_02015128:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_0201512C: .word _021D10A0
	thumb_func_end sub_02015104

	thumb_func_start sub_02015130
sub_02015130: ; 0x02015130
	push {r4, lr}
	ldr r1, _02015158 ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #0x2c]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _02015148
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_02015148:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _02015154
	bl GF_AssertFail
_02015154:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02015158: .word _021D10A0
	thumb_func_end sub_02015130

	thumb_func_start sub_0201515C
sub_0201515C: ; 0x0201515C
	push {r4, lr}
	ldr r1, _02015184 ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #0x30]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _02015174
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_02015174:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _02015180
	bl GF_AssertFail
_02015180:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02015184: .word _021D10A0
	thumb_func_end sub_0201515C

	thumb_func_start sub_02015188
sub_02015188: ; 0x02015188
	push {r4, lr}
	ldr r1, _020151B0 ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #0x34]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _020151A0
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_020151A0:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _020151AC
	bl GF_AssertFail
_020151AC:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_020151B0: .word _021D10A0
	thumb_func_end sub_02015188

	thumb_func_start sub_020151B4
sub_020151B4: ; 0x020151B4
	push {r4, lr}
	ldr r1, _020151DC ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #0x38]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _020151CC
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_020151CC:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _020151D8
	bl GF_AssertFail
_020151D8:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_020151DC: .word _021D10A0
	thumb_func_end sub_020151B4

	thumb_func_start sub_020151E0
sub_020151E0: ; 0x020151E0
	push {r4, lr}
	ldr r1, _02015208 ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #0x3c]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _020151F8
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_020151F8:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _02015204
	bl GF_AssertFail
_02015204:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02015208: .word _021D10A0
	thumb_func_end sub_020151E0

	thumb_func_start sub_0201520C
sub_0201520C: ; 0x0201520C
	push {r4, lr}
	ldr r1, _02015234 ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #0x40]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _02015224
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_02015224:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _02015230
	bl GF_AssertFail
_02015230:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02015234: .word _021D10A0
	thumb_func_end sub_0201520C

	thumb_func_start sub_02015238
sub_02015238: ; 0x02015238
	push {r4, lr}
	ldr r1, _02015260 ; =_021D10A0
	mov r2, #3
	ldr r1, [r1, #0x44]
	ldr r4, [r1, #0x10]
	add r0, r4, r0
	add r3, r0, #0
	and r3, r2
	beq _02015250
	mov r2, #4
	sub r2, r2, r3
	add r0, r0, r2
_02015250:
	str r0, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r0, r1
	blo _0201525C
	bl GF_AssertFail
_0201525C:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02015260: .word _021D10A0
	thumb_func_end sub_02015238

	thumb_func_start sub_02015264
sub_02015264: ; 0x02015264
	ldr r3, _02015268 ; =AllocAndReadWholeNarcMemberByIdPair
	bx r3
	.balign 4, 0
_02015268: .word AllocAndReadWholeNarcMemberByIdPair
	thumb_func_end sub_02015264

	thumb_func_start sub_0201526C
sub_0201526C: ; 0x0201526C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	add r4, r2, #0
	add r7, r3, #0
	cmp r0, #0
	bne _02015280
	bl GF_AssertFail
_02015280:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0201528A
	bl GF_AssertFail
_0201528A:
	add r0, r5, #0
	add r0, #0xd8
	strb r4, [r0]
	mov r0, #1
	tst r0, r4
	beq _020152A0
	add r0, r5, #0
	add r0, #0x58
	bl NNS_GfdGetFrmTexVramState
	b _020152B6
_020152A0:
	mov r0, #2
	tst r0, r4
	beq _020152B6
	mov r1, #0
	add r2, r5, #0
	add r0, r1, #0
_020152AC:
	add r1, r1, #1
	str r0, [r2, #0x58]
	add r2, r2, #4
	cmp r1, #0x10
	blt _020152AC
_020152B6:
	mov r0, #4
	tst r0, r4
	beq _020152C6
	add r0, r5, #0
	add r0, #0x98
	bl NNS_GfdGetFrmPlttVramState
	b _020152E0
_020152C6:
	mov r0, #8
	tst r0, r4
	beq _020152E0
	mov r2, #0
	add r3, r5, #0
	add r1, r2, #0
_020152D2:
	add r0, r3, #0
	add r0, #0x98
	add r2, r2, #1
	add r3, r3, #4
	str r1, [r0]
	cmp r2, #0x10
	blt _020152D2
_020152E0:
	str r6, [r5, #4]
	cmp r7, #1
	bne _020152EE
	add r0, r5, #0
	bl sub_02015300
	pop {r3, r4, r5, r6, r7, pc}
_020152EE:
	ldr r0, _020152FC ; =sub_02015340
	add r1, r5, #0
	mov r2, #5
	bl sub_0200E374
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020152FC: .word sub_02015340
	thumb_func_end sub_0201526C

	thumb_func_start sub_02015300
sub_02015300: ; 0x02015300
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl SPL_Load
	ldr r0, _0201533C ; =_021D10A0
	str r4, [r0]
	ldr r1, [r4, #0x18]
	ldr r0, [r4]
	cmp r1, #0
	bne _0201531E
	bl SPL_LoadTexByVRAMManager
	b _02015322
_0201531E:
	bl SPL_LoadTexByCallbackFunction
_02015322:
	ldr r1, [r4, #0x1c]
	ldr r0, [r4]
	cmp r1, #0
	bne _02015330
	bl SPL_LoadTexPlttByVRAMManager
	b _02015334
_02015330:
	bl SPL_LoadTexPlttByCallbackFunction
_02015334:
	ldr r0, _0201533C ; =_021D10A0
	mov r1, #0
	str r1, [r0]
	pop {r4, pc}
	.balign 4, 0
_0201533C: .word _021D10A0
	thumb_func_end sub_02015300

	thumb_func_start sub_02015340
sub_02015340: ; 0x02015340
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl sub_02015300
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02015340

	thumb_func_start sub_02015354
sub_02015354: ; 0x02015354
	push {r4, lr}
	add r4, r0, #0
	bne _0201535E
	bl GF_AssertFail
_0201535E:
	ldr r0, _02015390 ; =_021D10A0
	ldr r0, [r0]
	cmp r0, #0
	bne _0201536A
	bl GF_AssertFail
_0201536A:
	ldr r0, _02015390 ; =_021D10A0
	mov r1, #0
	ldr r3, [r0]
	add r2, r3, #0
_02015372:
	ldr r0, [r2, #0x58]
	cmp r0, #0
	bne _02015380
	lsl r0, r1, #2
	add r0, r3, r0
	str r4, [r0, #0x58]
	pop {r4, pc}
_02015380:
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #0x10
	blt _02015372
	bl GF_AssertFail
	pop {r4, pc}
	nop
_02015390: .word _021D10A0
	thumb_func_end sub_02015354

	thumb_func_start sub_02015394
sub_02015394: ; 0x02015394
	push {r4, lr}
	add r4, r0, #0
	bne _0201539E
	bl GF_AssertFail
_0201539E:
	ldr r0, _020153D4 ; =_021D10A0
	ldr r0, [r0]
	cmp r0, #0
	bne _020153AA
	bl GF_AssertFail
_020153AA:
	ldr r0, _020153D4 ; =_021D10A0
	mov r1, #0
	ldr r3, [r0]
	add r2, r3, #0
_020153B2:
	add r0, r2, #0
	add r0, #0x98
	ldr r0, [r0]
	cmp r0, #0
	bne _020153C6
	lsl r0, r1, #2
	add r0, r3, r0
	add r0, #0x98
	str r4, [r0]
	pop {r4, pc}
_020153C6:
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #0x10
	blt _020153B2
	bl GF_AssertFail
	pop {r4, pc}
	.balign 4, 0
_020153D4: .word _021D10A0
	thumb_func_end sub_02015394

	thumb_func_start sub_020153D8
sub_020153D8: ; 0x020153D8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x20]
	cmp r1, #0
	beq _020153F4
	add r0, #0xdb
	ldrb r0, [r0]
	bl sub_020233D8
	ldr r0, [r4, #0x20]
	bl GF_Camera_RegisterToStaticPtr
	bl sub_02023154
_020153F4:
	bl NNS_G3dGlbFlushP
	ldr r0, [r4]
	ldr r1, _02015410 ; =NNS_G3dGlb + 0x4C
	bl SPL_Draw
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0201540A
	bl sub_02023148
_0201540A:
	bl NNS_G3dGlbFlushP
	pop {r4, pc}
	.balign 4, 0
_02015410: .word NNS_G3dGlb + 0x4C
	thumb_func_end sub_020153D8

	thumb_func_start sub_02015414
sub_02015414: ; 0x02015414
	ldr r3, _0201541C ; =SPL_Calc
	ldr r0, [r0]
	bx r3
	nop
_0201541C: .word SPL_Calc
	thumb_func_end sub_02015414

	thumb_func_start sub_02015420
sub_02015420: ; 0x02015420
	mov r0, #0
	ldr r3, _02015438 ; =_021D10A8
	add r2, r0, #0
_02015426:
	ldr r1, [r3]
	cmp r1, #0
	beq _0201542E
	add r0, r0, #1
_0201542E:
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, #0x10
	blt _02015426
	bx lr
	.balign 4, 0
_02015438: .word _021D10A8
	thumb_func_end sub_02015420

	thumb_func_start sub_0201543C
sub_0201543C: ; 0x0201543C
	push {r4, r5, r6, lr}
	mov r4, #0
	ldr r5, _0201545C ; =_021D10A8
	add r6, r4, #0
_02015444:
	ldr r0, [r5]
	cmp r0, #0
	beq _02015450
	bl sub_020153D8
	add r4, r4, #1
_02015450:
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #0x10
	blt _02015444
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0201545C: .word _021D10A8
	thumb_func_end sub_0201543C

	thumb_func_start sub_02015460
sub_02015460: ; 0x02015460
	push {r4, r5, r6, lr}
	mov r4, #0
	ldr r5, _02015480 ; =_021D10A8
	add r6, r4, #0
_02015468:
	ldr r0, [r5]
	cmp r0, #0
	beq _02015474
	bl sub_02015414
	add r4, r4, #1
_02015474:
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #0x10
	blt _02015468
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02015480: .word _021D10A8
	thumb_func_end sub_02015460

	thumb_func_start sub_02015484
sub_02015484: ; 0x02015484
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl SPL_Create
	str r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02015484

	thumb_func_start sub_02015494
sub_02015494: ; 0x02015494
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020154AC ; =_021D10A0
	str r3, [r0, #4]
	ldr r0, [r4]
	bl SPL_CreateWithInitialize
	ldr r1, _020154AC ; =_021D10A0
	mov r2, #0
	str r2, [r1, #4]
	str r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
_020154AC: .word _021D10A0
	thumb_func_end sub_02015494

	thumb_func_start sub_020154B0
sub_020154B0: ; 0x020154B0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020154B0

	thumb_func_start sub_020154B8
sub_020154B8: ; 0x020154B8
	ldr r3, _020154C0 ; =SPL_DeleteAll
	ldr r0, [r0]
	bx r3
	nop
_020154C0: .word SPL_DeleteAll
	thumb_func_end sub_020154B8

	thumb_func_start sub_020154C4
sub_020154C4: ; 0x020154C4
	ldr r3, _020154CC ; =SPL_Delete
	ldr r0, [r0]
	bx r3
	nop
_020154CC: .word SPL_Delete
	thumb_func_end sub_020154C4

	thumb_func_start sub_020154D0
sub_020154D0: ; 0x020154D0
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_020154D0

	thumb_func_start sub_020154D4
sub_020154D4: ; 0x020154D4
	add r2, r0, #0
	add r2, #0x40
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end sub_020154D4

	thumb_func_start sub_020154E4
sub_020154E4: ; 0x020154E4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r3, r4, #0
	add r2, r5, #0
	ldmia r3!, {r0, r1}
	add r2, #0x40
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [r5, #0x20]
	add r0, r4, #0
	bl GF_Camera_SetBindTarget
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020154E4

	thumb_func_start sub_02015504
sub_02015504: ; 0x02015504
	ldr r0, _0201550C ; =_021D10A0
	ldr r0, [r0, #4]
	bx lr
	nop
_0201550C: .word _021D10A0
	thumb_func_end sub_02015504

	thumb_func_start sub_02015510
sub_02015510: ; 0x02015510
	ldr r2, _02015520 ; =_020F6078
	add r3, r0, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	nop
_02015520: .word _020F6078
	thumb_func_end sub_02015510

	thumb_func_start sub_02015524
sub_02015524: ; 0x02015524
	ldr r0, [r0, #0x20]
	bx lr
	thumb_func_end sub_02015524

	thumb_func_start sub_02015528
sub_02015528: ; 0x02015528
	add r0, #0xdb
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02015528

	thumb_func_start sub_02015530
sub_02015530: ; 0x02015530
	add r0, #0xdb
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02015530

	thumb_func_start sub_02015538
sub_02015538: ; 0x02015538
	add r2, r0, #0
	add r2, #0x50
	ldrh r2, [r2]
	strh r2, [r1]
	add r2, r0, #0
	add r2, #0x52
	ldrh r2, [r2]
	add r0, #0x54
	strh r2, [r1, #2]
	ldrh r0, [r0]
	strh r0, [r1, #4]
	bx lr
	thumb_func_end sub_02015538

	thumb_func_start sub_02015550
sub_02015550: ; 0x02015550
	push {r4, r5, r6, r7}
	ldr r0, [r0, #0x20]
	add r4, r1, #0
	ldrh r2, [r0, #0x1c]
	cmp r2, #0
	bne _02015562
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_02015562:
	mov r1, #0
	cmp r2, #0
	ble _020155EC
	ldr r3, [r0, #0x18]
	ldr r7, _020155F4 ; =spl_calc_random
	ldr r0, _020155F8 ; =spl_calc_gravity
_0201556E:
	cmp r3, #0
	beq _020155E4
	cmp r4, #5
	bhi _020155DE
	add r5, r4, r4
	add r5, pc
	ldrh r5, [r5, #6]
	lsl r5, r5, #0x10
	asr r5, r5, #0x10
	add pc, r5
_02015582: ; jump table
	.short _0201558E - _02015582 - 2 ; case 0
	.short _0201559A - _02015582 - 2 ; case 1
	.short _020155A6 - _02015582 - 2 ; case 2
	.short _020155B4 - _02015582 - 2 ; case 3
	.short _020155C2 - _02015582 - 2 ; case 4
	.short _020155D0 - _02015582 - 2 ; case 5
_0201558E:
	ldr r5, [r3]
	cmp r5, r0
	bne _020155E4
	ldr r0, [r3, #4]
	pop {r4, r5, r6, r7}
	bx lr
_0201559A:
	ldr r5, [r3]
	cmp r5, r7
	bne _020155E4
	ldr r0, [r3, #4]
	pop {r4, r5, r6, r7}
	bx lr
_020155A6:
	ldr r6, [r3]
	ldr r5, _020155FC ; =spl_calc_magnet
	cmp r6, r5
	bne _020155E4
	ldr r0, [r3, #4]
	pop {r4, r5, r6, r7}
	bx lr
_020155B4:
	ldr r6, [r3]
	ldr r5, _02015600 ; =spl_calc_spin
	cmp r6, r5
	bne _020155E4
	ldr r0, [r3, #4]
	pop {r4, r5, r6, r7}
	bx lr
_020155C2:
	ldr r6, [r3]
	ldr r5, _02015604 ; =spl_calc_scfield
	cmp r6, r5
	bne _020155E4
	ldr r0, [r3, #4]
	pop {r4, r5, r6, r7}
	bx lr
_020155D0:
	ldr r6, [r3]
	ldr r5, _02015608 ; =spl_calc_convergence
	cmp r6, r5
	bne _020155E4
	ldr r0, [r3, #4]
	pop {r4, r5, r6, r7}
	bx lr
_020155DE:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_020155E4:
	add r1, r1, #1
	add r3, #8
	cmp r1, r2
	blt _0201556E
_020155EC:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	nop
_020155F4: .word spl_calc_random
_020155F8: .word spl_calc_gravity
_020155FC: .word spl_calc_magnet
_02015600: .word spl_calc_spin
_02015604: .word spl_calc_scfield
_02015608: .word spl_calc_convergence
	thumb_func_end sub_02015550

	thumb_func_start sub_0201560C
sub_0201560C: ; 0x0201560C
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0
	bl sub_02015550
	cmp r0, #0
	beq _02015626
	ldrh r1, [r4]
	strh r1, [r0]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	strh r1, [r0, #4]
_02015626:
	pop {r4, pc}
	thumb_func_end sub_0201560C

	thumb_func_start sub_02015628
sub_02015628: ; 0x02015628
	push {r4, lr}
	add r4, r1, #0
	mov r1, #2
	bl sub_02015550
	add r2, r0, #0
	beq _0201563E
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
_0201563E:
	pop {r4, pc}
	thumb_func_end sub_02015628

	thumb_func_start sub_02015640
sub_02015640: ; 0x02015640
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	mov r1, #2
	bl sub_02015550
	add r2, r0, #0
	bne _02015666
	add r2, sp, #0
	mov r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	str r0, [r2, #8]
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	add sp, #0xc
	str r0, [r4]
	pop {r3, r4, pc}
_02015666:
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02015640

	thumb_func_start sub_02015674
sub_02015674: ; 0x02015674
	push {r4, lr}
	add r4, r1, #0
	mov r1, #2
	bl sub_02015550
	cmp r0, #0
	beq _02015688
	mov r1, #0
	ldrsh r1, [r4, r1]
	strh r1, [r0, #0xc]
_02015688:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02015674

	thumb_func_start sub_0201568C
sub_0201568C: ; 0x0201568C
	push {r4, lr}
	add r4, r1, #0
	mov r1, #2
	bl sub_02015550
	cmp r0, #0
	bne _020156A0
	mov r0, #0
	strh r0, [r4]
	pop {r4, pc}
_020156A0:
	mov r1, #0xc
	ldrsh r0, [r0, r1]
	strh r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_0201568C

	thumb_func_start sub_020156A8
sub_020156A8: ; 0x020156A8
	push {r4, lr}
	add r4, r1, #0
	mov r1, #3
	bl sub_02015550
	cmp r0, #0
	beq _020156BA
	ldrh r1, [r4]
	strh r1, [r0]
_020156BA:
	pop {r4, pc}
	thumb_func_end sub_020156A8

	thumb_func_start sub_020156BC
sub_020156BC: ; 0x020156BC
	push {r4, lr}
	add r4, r1, #0
	mov r1, #3
	bl sub_02015550
	cmp r0, #0
	bne _020156D0
	mov r0, #0
	strh r0, [r4]
	pop {r4, pc}
_020156D0:
	ldrh r0, [r0]
	strh r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020156BC

	thumb_func_start sub_020156D8
sub_020156D8: ; 0x020156D8
	push {r4, lr}
	add r4, r1, #0
	mov r1, #3
	bl sub_02015550
	cmp r0, #0
	beq _020156EA
	ldrh r1, [r4]
	strh r1, [r0, #2]
_020156EA:
	pop {r4, pc}
	thumb_func_end sub_020156D8

	thumb_func_start sub_020156EC
sub_020156EC: ; 0x020156EC
	push {r4, lr}
	add r4, r1, #0
	mov r1, #3
	bl sub_02015550
	cmp r0, #0
	bne _02015700
	mov r0, #0
	strh r0, [r4]
	pop {r4, pc}
_02015700:
	ldrh r0, [r0, #2]
	strh r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020156EC

	thumb_func_start sub_02015708
sub_02015708: ; 0x02015708
	push {r4, lr}
	add r4, r1, #0
	mov r1, #5
	bl sub_02015550
	add r2, r0, #0
	beq _0201571E
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
_0201571E:
	pop {r4, pc}
	thumb_func_end sub_02015708

	thumb_func_start sub_02015720
sub_02015720: ; 0x02015720
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	mov r1, #5
	bl sub_02015550
	add r2, r0, #0
	bne _02015746
	add r2, sp, #0
	mov r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	str r0, [r2, #8]
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	add sp, #0xc
	str r0, [r4]
	pop {r3, r4, pc}
_02015746:
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02015720

	thumb_func_start sub_02015754
sub_02015754: ; 0x02015754
	push {r4, lr}
	add r4, r1, #0
	mov r1, #5
	bl sub_02015550
	cmp r0, #0
	beq _02015768
	mov r1, #0
	ldrsh r1, [r4, r1]
	strh r1, [r0, #0xc]
_02015768:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02015754

	thumb_func_start sub_0201576C
sub_0201576C: ; 0x0201576C
	push {r4, lr}
	add r4, r1, #0
	mov r1, #5
	bl sub_02015550
	cmp r0, #0
	bne _02015780
	mov r0, #0
	strh r0, [r4]
	pop {r4, pc}
_02015780:
	mov r1, #0xc
	ldrsh r0, [r0, r1]
	strh r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_0201576C

	thumb_func_start ListMenuCursorNew
ListMenuCursorNew: ; 0x02015788
	push {r3, r4, r5, lr}
	mov r1, #8
	add r5, r0, #0
	bl AllocFromHeap
	add r4, r0, #0
	beq _020157AA
	ldr r0, _020157B0 ; =0x0001020F
	add r1, r5, #0
	str r0, [r4]
	mov r0, #4
	bl String_ctor
	ldr r1, _020157B4 ; =_020F60DC
	str r0, [r4, #4]
	bl CopyU16ArrayToString
_020157AA:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_020157B0: .word 0x0001020F
_020157B4: .word _020F60DC
	thumb_func_end ListMenuCursorNew

	thumb_func_start DestroyListMenuCursorObj
DestroyListMenuCursorObj: ; 0x020157B8
	push {r4, lr}
	add r4, r0, #0
	bne _020157C2
	bl GF_AssertFail
_020157C2:
	cmp r4, #0
	beq _020157D6
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _020157D0
	bl String_dtor
_020157D0:
	add r0, r4, #0
	bl FreeToHeap
_020157D6:
	pop {r4, pc}
	thumb_func_end DestroyListMenuCursorObj

	thumb_func_start ListMenuCursorSetColor
ListMenuCursorSetColor: ; 0x020157D8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _020157E6
	bl GF_AssertFail
_020157E6:
	cmp r5, #0
	beq _020157EC
	str r4, [r5]
_020157EC:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ListMenuCursorSetColor

	thumb_func_start ListMenuUpdateCursorObj
ListMenuUpdateCursorObj: ; 0x020157F0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r6]
	add r5, r1, #0
	str r0, [sp, #8]
	mov r1, #0
	add r4, r2, #0
	str r1, [sp, #0xc]
	ldr r2, [r6, #4]
	add r0, r5, #0
	add r3, r4, #0
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl CopyWindowPixelsToVram_TextMode
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ListMenuUpdateCursorObj
