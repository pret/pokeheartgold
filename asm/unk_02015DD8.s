	.include "asm/macros.inc"
	.include "unk_02015DD8.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02015DDC
sub_02015DDC: ; 0x02015DDC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	bne _02015DF0
	bl GF_AssertFail
_02015DF0:
	ldr r0, [r5]
	ldr r1, [r5, #0xc]
	bl sub_0201605C
	str r0, [r4]
	ldr r0, [r5]
	str r0, [r4, #4]
	ldr r0, [r5, #4]
	ldr r1, [r5, #0xc]
	bl sub_0201608C
	str r0, [r4, #8]
	ldr r0, [r5, #4]
	str r0, [r4, #0xc]
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	bl sub_020160BC
	str r0, [r4, #0x10]
	ldr r0, [r5, #8]
	str r0, [r4, #0x14]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02015DDC

	thumb_func_start sub_02015E20
sub_02015E20: ; 0x02015E20
	push {r4, lr}
	add r4, r0, #0
	bne _02015E2A
	bl GF_AssertFail
_02015E2A:
	ldr r0, [r4]
	cmp r0, #0
	bne _02015E34
	bl GF_AssertFail
_02015E34:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _02015E3E
	bl GF_AssertFail
_02015E3E:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _02015E48
	bl GF_AssertFail
_02015E48:
	ldr r0, [r4]
	bl Heap_Free
	ldr r0, [r4, #8]
	bl Heap_Free
	ldr r0, [r4, #0x10]
	bl Heap_Free
	add r0, r4, #0
	bl Heap_Free
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02015E20

	thumb_func_start sub_02015E64
sub_02015E64: ; 0x02015E64
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _02015E98 ; =0x04000444
	mov r6, #0
	str r6, [r0]
	ldr r0, [r5, #4]
	cmp r0, #0
	ble _02015E8E
	add r4, r6, #0
_02015E76:
	ldr r0, [r5]
	add r0, r0, r4
	ldr r1, [r0, #0x20]
	cmp r1, #0
	beq _02015E84
	bl sub_020161CC
_02015E84:
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, #0x40
	cmp r6, r0
	blt _02015E76
_02015E8E:
	ldr r0, _02015E9C ; =0x04000448
	mov r1, #1
	str r1, [r0]
	pop {r4, r5, r6, pc}
	nop
_02015E98: .word 0x04000444
_02015E9C: .word 0x04000448
	thumb_func_end sub_02015E64

	thumb_func_start sub_02015EA0
sub_02015EA0: ; 0x02015EA0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl sub_02016118
	add r4, r0, #0
	bne _02015EB2
	bl GF_AssertFail
_02015EB2:
	ldr r0, [r5, #4]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02015EBE
	bl GF_AssertFail
_02015EBE:
	ldr r0, [r5, #4]
	bl sub_02016170
	str r0, [r4]
	cmp r0, #0
	bne _02015ECE
	bl GF_AssertFail
_02015ECE:
	ldr r0, [r5, #4]
	ldr r1, [r4]
	add r2, r4, #4
	bl sub_02016198
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02015EA0

	thumb_func_start sub_02015EDC
sub_02015EDC: ; 0x02015EDC
	push {r4, lr}
	ldr r1, _02015EF0 ; =NNS_GfdDefaultFuncFreeTexVram
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r1]
	blx r1
	add r0, r4, #0
	bl sub_02016044
	pop {r4, pc}
	.balign 4, 0
_02015EF0: .word NNS_GfdDefaultFuncFreeTexVram
	thumb_func_end sub_02015EDC

	thumb_func_start sub_02015EF4
sub_02015EF4: ; 0x02015EF4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r6, #0
	cmp r0, #0
	ble _02015F1A
	add r4, r6, #0
_02015F02:
	ldr r1, [r5, #8]
	ldr r0, [r1, r4]
	cmp r0, #0
	beq _02015F10
	add r0, r1, r4
	bl sub_02015EDC
_02015F10:
	ldr r0, [r5, #0xc]
	add r6, r6, #1
	add r4, #0x28
	cmp r6, r0
	blt _02015F02
_02015F1A:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02015EF4

	thumb_func_start sub_02015F1C
sub_02015F1C: ; 0x02015F1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl sub_02016144
	add r4, r0, #0
	bne _02015F2E
	bl GF_AssertFail
_02015F2E:
	ldr r0, [r5, #8]
	bl sub_02016184
	str r0, [r4]
	cmp r0, #0
	bne _02015F3E
	bl GF_AssertFail
_02015F3E:
	ldr r0, [r5, #4]
	ldr r1, [r4]
	add r2, r4, #4
	bl sub_020161A8
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02015F1C

	thumb_func_start sub_02015F4C
sub_02015F4C: ; 0x02015F4C
	push {r4, lr}
	ldr r1, _02015F60 ; =NNS_GfdDefaultFuncFreePlttVram
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r1]
	blx r1
	add r0, r4, #0
	bl sub_02016050
	pop {r4, pc}
	.balign 4, 0
_02015F60: .word NNS_GfdDefaultFuncFreePlttVram
	thumb_func_end sub_02015F4C

	thumb_func_start sub_02015F64
sub_02015F64: ; 0x02015F64
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	mov r6, #0
	cmp r0, #0
	ble _02015F8A
	add r4, r6, #0
_02015F72:
	ldr r1, [r5, #0x10]
	ldr r0, [r1, r4]
	cmp r0, #0
	beq _02015F80
	add r0, r1, r4
	bl sub_02015F4C
_02015F80:
	ldr r0, [r5, #0x14]
	add r6, r6, #1
	add r4, #0x18
	cmp r6, r0
	blt _02015F72
_02015F8A:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02015F64

	thumb_func_start sub_02015F8C
sub_02015F8C: ; 0x02015F8C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl sub_020160EC
	add r4, r0, #0
	bne _02015F9E
	bl GF_AssertFail
_02015F9E:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0201630C
	mov r0, #1
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02015F8C

	thumb_func_start sub_02015FB0
sub_02015FB0: ; 0x02015FB0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02015FBE
	bl GF_AssertFail
_02015FBE:
	str r4, [r5, #0x20]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02015FB0

	thumb_func_start sub_02015FC4
sub_02015FC4: ; 0x02015FC4
	strh r1, [r0]
	strh r2, [r0, #2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02015FC4

	thumb_func_start sub_02015FCC
sub_02015FCC: ; 0x02015FCC
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	lsl r1, r1, #0x10
	orr r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end sub_02015FCC

	thumb_func_start sub_02015FD8
sub_02015FD8: ; 0x02015FD8
	strh r1, [r0, #4]
	strh r2, [r0, #6]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02015FD8

	thumb_func_start sub_02015FE0
sub_02015FE0: ; 0x02015FE0
	strh r1, [r0, #8]
	strh r2, [r0, #0xa]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02015FE0

	thumb_func_start sub_02015FE8
sub_02015FE8: ; 0x02015FE8
	ldrh r1, [r0, #0xa]
	ldrh r0, [r0, #8]
	lsl r1, r1, #0x10
	orr r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end sub_02015FE8

	thumb_func_start sub_02015FF4
sub_02015FF4: ; 0x02015FF4
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end sub_02015FF4

	thumb_func_start sub_02015FF8
sub_02015FF8: ; 0x02015FF8
	ldr r0, [r0, #0x14]
	bx lr
	thumb_func_end sub_02015FF8

	thumb_func_start sub_02015FFC
sub_02015FFC: ; 0x02015FFC
	add r0, #0x3e
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02015FFC

	thumb_func_start sub_02016004
sub_02016004: ; 0x02016004
	str r1, [r0, #0x24]
	bx lr
	thumb_func_end sub_02016004

	thumb_func_start sub_02016008
sub_02016008: ; 0x02016008
	str r1, [r0, #0x28]
	bx lr
	thumb_func_end sub_02016008

	thumb_func_start sub_0201600C
sub_0201600C: ; 0x0201600C
	str r1, [r0, #0x2c]
	bx lr
	thumb_func_end sub_0201600C

	thumb_func_start sub_02016010
sub_02016010: ; 0x02016010
	str r1, [r0, #0x30]
	bx lr
	thumb_func_end sub_02016010

	thumb_func_start sub_02016014
sub_02016014: ; 0x02016014
	cmp r1, #0
	bne _0201601C
	str r2, [r0, #0x34]
	bx lr
_0201601C:
	str r2, [r0, #0x38]
	bx lr
	thumb_func_end sub_02016014

	thumb_func_start sub_02016020
sub_02016020: ; 0x02016020
	str r1, [r0, #0x18]
	bx lr
	thumb_func_end sub_02016020

	thumb_func_start sub_02016024
sub_02016024: ; 0x02016024
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x40
	bl memset
	add r0, r4, #0
	mov r1, #0x1f
	add r0, #0x3e
	strb r1, [r0]
	ldr r0, _02016040 ; =0x00007FFF
	strh r0, [r4, #0x3c]
	pop {r4, pc}
	nop
_02016040: .word 0x00007FFF
	thumb_func_end sub_02016024

	thumb_func_start sub_02016044
sub_02016044: ; 0x02016044
	ldr r3, _0201604C ; =NNS_G2dInitImageProxy
	mov r1, #0
	stmia r0!, {r1}
	bx r3
	.balign 4, 0
_0201604C: .word NNS_G2dInitImageProxy
	thumb_func_end sub_02016044

	thumb_func_start sub_02016050
sub_02016050: ; 0x02016050
	ldr r3, _02016058 ; =NNS_G2dInitImagePaletteProxy
	mov r1, #0
	stmia r0!, {r1}
	bx r3
	.balign 4, 0
_02016058: .word NNS_G2dInitImagePaletteProxy
	thumb_func_end sub_02016050

	thumb_func_start sub_0201605C
sub_0201605C: ; 0x0201605C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, r1, #0
	lsl r1, r6, #6
	bl AllocFromHeap
	add r7, r0, #0
	bne _02016070
	bl GF_AssertFail
_02016070:
	mov r4, #0
	cmp r6, #0
	ble _02016086
	add r5, r7, #0
_02016078:
	add r0, r5, #0
	bl sub_02016024
	add r4, r4, #1
	add r5, #0x40
	cmp r4, r6
	blt _02016078
_02016086:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0201605C

	thumb_func_start sub_0201608C
sub_0201608C: ; 0x0201608C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, r1, #0
	mov r1, #0x28
	mul r1, r6
	bl AllocFromHeap
	add r7, r0, #0
	bne _020160A2
	bl GF_AssertFail
_020160A2:
	mov r4, #0
	cmp r6, #0
	ble _020160B8
	add r5, r7, #0
_020160AA:
	add r0, r5, #0
	bl sub_02016044
	add r4, r4, #1
	add r5, #0x28
	cmp r4, r6
	blt _020160AA
_020160B8:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0201608C

	thumb_func_start sub_020160BC
sub_020160BC: ; 0x020160BC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, r1, #0
	mov r1, #0x18
	mul r1, r6
	bl AllocFromHeap
	add r7, r0, #0
	bne _020160D2
	bl GF_AssertFail
_020160D2:
	mov r4, #0
	cmp r6, #0
	ble _020160E8
	add r5, r7, #0
_020160DA:
	add r0, r5, #0
	bl sub_02016050
	add r4, r4, #1
	add r5, #0x18
	cmp r4, r6
	blt _020160DA
_020160E8:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020160BC

	thumb_func_start sub_020160EC
sub_020160EC: ; 0x020160EC
	push {r3, r4}
	ldr r4, [r0, #4]
	mov r1, #0
	cmp r4, #0
	ble _02016110
	ldr r3, [r0]
	add r2, r3, #0
_020160FA:
	ldr r0, [r2, #0x1c]
	cmp r0, #0
	bne _02016108
	lsl r0, r1, #6
	add r0, r3, r0
	pop {r3, r4}
	bx lr
_02016108:
	add r1, r1, #1
	add r2, #0x40
	cmp r1, r4
	blt _020160FA
_02016110:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020160EC

	thumb_func_start sub_02016118
sub_02016118: ; 0x02016118
	push {r3, r4}
	ldr r4, [r0, #4]
	mov r1, #0
	cmp r4, #0
	ble _0201613E
	ldr r3, [r0, #8]
	add r2, r3, #0
_02016126:
	ldr r0, [r2]
	cmp r0, #0
	bne _02016136
	mov r0, #0x28
	mul r0, r1
	add r0, r3, r0
	pop {r3, r4}
	bx lr
_02016136:
	add r1, r1, #1
	add r2, #0x28
	cmp r1, r4
	blt _02016126
_0201613E:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02016118

	thumb_func_start sub_02016144
sub_02016144: ; 0x02016144
	push {r3, r4}
	ldr r4, [r0, #4]
	mov r1, #0
	cmp r4, #0
	ble _0201616A
	ldr r3, [r0, #0x10]
	add r2, r3, #0
_02016152:
	ldr r0, [r2]
	cmp r0, #0
	bne _02016162
	mov r0, #0x18
	mul r0, r1
	add r0, r3, r0
	pop {r3, r4}
	bx lr
_02016162:
	add r1, r1, #1
	add r2, #0x18
	cmp r1, r4
	blt _02016152
_0201616A:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02016144

	thumb_func_start sub_02016170
sub_02016170: ; 0x02016170
	push {r3, lr}
	ldr r3, _02016180 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r1, #0
	ldr r0, [r0, #0x10]
	ldr r3, [r3]
	add r2, r1, #0
	blx r3
	pop {r3, pc}
	.balign 4, 0
_02016180: .word NNS_GfdDefaultFuncAllocTexVram
	thumb_func_end sub_02016170

	thumb_func_start sub_02016184
sub_02016184: ; 0x02016184
	push {r3, lr}
	ldr r3, _02016194 ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r1, #0
	ldr r3, [r3]
	lsl r0, r0, #5
	add r2, r1, #0
	blx r3
	pop {r3, pc}
	.balign 4, 0
_02016194: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end sub_02016184

	thumb_func_start sub_02016198
sub_02016198: ; 0x02016198
	push {r3, lr}
	lsl r1, r1, #0x10
	add r3, r2, #0
	lsr r1, r1, #0xd
	mov r2, #0
	bl NNS_G2dLoadImage2DMapping
	pop {r3, pc}
	thumb_func_end sub_02016198

	thumb_func_start sub_020161A8
sub_020161A8: ; 0x020161A8
	push {r3, r4, r5, lr}
	add r3, r2, #0
	ldr r2, _020161C8 ; =0xFFFF0000
	add r5, r0, #0
	and r2, r1
	lsr r2, r2, #0x10
	lsl r1, r1, #0x10
	ldr r4, [r5, #8]
	lsl r2, r2, #3
	str r2, [r5, #8]
	lsr r1, r1, #0xd
	mov r2, #0
	bl NNS_G2dLoadPalette
	str r4, [r5, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020161C8: .word 0xFFFF0000
	thumb_func_end sub_020161A8

	thumb_func_start sub_020161CC
sub_020161CC: ; 0x020161CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r7, _020162EC ; =0x04000444
	mov r6, #0
	add r5, r0, #0
	str r6, [r7]
	ldrh r1, [r5, #0x3c]
	ldr r0, _020162F0 ; =0x7FFF8000
	orr r0, r1
	str r0, [r7, #0x7c]
	add r0, r7, #0
	ldr r1, _020162F4 ; =0x00004210
	add r0, #0x80
	str r1, [r0]
	ldr r3, [r5, #0x24]
	ldr r4, [r3, #8]
	ldr r2, [r3, #0x10]
	ldr r1, [r3, #4]
	ldr r0, [r3]
	lsl r3, r2, #0x1d
	lsl r2, r1, #0x17
	lsl r1, r0, #0x14
	ldr r0, [r5, #0x28]
	lsl r4, r4, #0x1a
	lsr r0, r0, #3
	orr r4, r0
	mov r0, #1
	lsl r0, r0, #0x1e
	orr r0, r4
	orr r0, r1
	orr r0, r2
	orr r0, r3
	str r0, [r7, #0x64]
	ldr r0, [r5, #0x24]
	ldr r0, [r0, #8]
	cmp r0, #2
	bne _02016218
	mov r6, #1
_02016218:
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x2c]
	lsl r0, r0, #5
	add r1, r1, r0
	mov r0, #4
	sub r0, r0, r6
	lsr r1, r0
	ldr r2, _020162F8 ; =0x040004AC
	add r0, r5, #0
	str r1, [r2]
	add r0, #0x3e
	ldrb r0, [r0]
	sub r2, #8
	lsl r1, r0, #0x10
	mov r0, #0xc0
	orr r0, r1
	str r0, [r2]
	ldr r0, [r5, #0x34]
	cmp r0, #0
	beq _0201624A
	mov r0, #8
	ldrsh r0, [r5, r0]
	mov r7, #0
	str r0, [sp, #0x14]
	b _02016252
_0201624A:
	mov r0, #8
	ldrsh r7, [r5, r0]
	mov r0, #0
	str r0, [sp, #0x14]
_02016252:
	ldr r0, [r5, #0x38]
	cmp r0, #0
	beq _02016260
	mov r0, #0xa
	ldrsh r6, [r5, r0]
	mov r4, #0
	b _02016266
_02016260:
	mov r0, #0xa
	ldrsh r4, [r5, r0]
	mov r6, #0
_02016266:
	ldr r0, [r5, #0x14]
	mov r1, #6
	lsl r2, r0, #0xc
	mov r0, #2
	ldrsh r0, [r5, r0]
	ldrsh r1, [r5, r1]
	mov r3, #4
	ldrsh r3, [r5, r3]
	add r0, r0, r1
	lsl r1, r0, #0xc
	mov r0, #0
	ldrsh r0, [r5, r0]
	add r0, r0, r3
	ldr r3, _020162FC ; =0x04000470
	lsl r0, r0, #0xc
	str r0, [r3]
	str r1, [r3]
	str r2, [r3]
	ldr r0, [r5, #0x18]
	ldr r1, _02016300 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r0, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r0, [r1, r0]
	ldrsh r1, [r1, r2]
	bl G3_RotZ
	ldr r2, [r5, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, _02016304 ; =0x0400046C
	mov r3, #8
	str r0, [r1]
	str r2, [r1]
	lsr r0, r1, #0xe
	str r0, [r1]
	mov r2, #4
	mov r0, #6
	ldrsh r2, [r5, r2]
	ldrsh r0, [r5, r0]
	neg r2, r2
	neg r0, r0
	lsl r2, r2, #0xc
	lsl r0, r0, #0xc
	str r2, [r1, #4]
	str r0, [r1, #4]
	mov r0, #0
	str r0, [r1, #4]
	mov r1, #0xa
	ldrsh r1, [r5, r1]
	add r2, r0, #0
	str r1, [sp]
	ldr r1, [sp, #0x14]
	str r1, [sp, #4]
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	str r4, [sp, #0x10]
	ldrsh r3, [r5, r3]
	add r1, r0, #0
	bl NNS_G2dDrawSpriteFast
	ldr r0, _02016308 ; =0x04000448
	mov r1, #1
	str r1, [r0]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020162EC: .word 0x04000444
_020162F0: .word 0x7FFF8000
_020162F4: .word 0x00004210
_020162F8: .word 0x040004AC
_020162FC: .word 0x04000470
_02016300: .word FX_SinCosTable_
_02016304: .word 0x0400046C
_02016308: .word 0x04000448
	thumb_func_end sub_020161CC

	thumb_func_start sub_0201630C
sub_0201630C: ; 0x0201630C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r1, [r5, #4]
	add r7, r0, #0
	ldr r2, [r1, #0x10]
	mov r6, #8
	mov r0, #0
	cmp r2, #0
	ble _0201632A
_0201631E:
	ldr r2, [r5, #4]
	add r0, r0, #1
	ldr r2, [r2, #0x10]
	lsl r6, r6, #1
	cmp r0, r2
	blt _0201631E
_0201632A:
	ldr r1, [r1, #0x14]
	mov r4, #8
	mov r0, #0
	cmp r1, #0
	ble _02016340
_02016334:
	ldr r1, [r5, #4]
	add r0, r0, #1
	ldr r1, [r1, #0x14]
	lsl r4, r4, #1
	cmp r0, r1
	blt _02016334
_02016340:
	mov r1, #0xc
	mov r2, #0xe
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	add r0, r7, #0
	bl sub_02015FC4
	lsr r1, r6, #0x1f
	lsr r2, r4, #0x1f
	add r1, r6, r1
	add r2, r4, r2
	lsl r1, r1, #0xf
	lsl r2, r2, #0xf
	add r0, r7, #0
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_02015FD8
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r7, #0xc]
	str r0, [r7, #0x10]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	bl sub_02015FE0
	ldr r1, [r5, #0x18]
	add r0, r7, #0
	bl sub_02015FF4
	ldr r1, [r5, #0x14]
	add r0, r7, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02015FFC
	ldr r1, [r5, #4]
	add r0, r7, #0
	add r1, #0x10
	bl sub_02016004
	ldr r0, [r5, #4]
	mov r1, #0
	add r0, r0, #4
	bl NNS_G2dGetImageLocation
	add r1, r0, #0
	add r0, r7, #0
	bl sub_02016008
	ldr r0, [r5, #8]
	mov r1, #0
	add r0, r0, #4
	bl NNS_G2dGetImagePaletteLocation
	add r1, r0, #0
	add r0, r7, #0
	bl sub_0201600C
	ldrh r1, [r5, #0x1c]
	add r0, r7, #0
	bl sub_02016010
	mov r1, #0
	add r0, r7, #0
	add r2, r1, #0
	bl sub_02016014
	add r0, r7, #0
	mov r1, #1
	mov r2, #0
	bl sub_02016014
	ldrh r1, [r5, #0x10]
	add r0, r7, #0
	bl sub_02016020
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0201630C
