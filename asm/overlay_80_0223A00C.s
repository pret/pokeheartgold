	.include "asm/macros.inc"
	.include "overlay_80_0223A00C.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_0223A00C
ov80_0223A00C: ; 0x0223A00C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r7, r2, #0
	mov r1, #0x5a
	mov r2, #0xfa
	str r3, [sp]
	ldr r0, _0223A0B4 ; =ov80_0223A144
	lsl r1, r1, #2
	lsl r2, r2, #2
	mov r3, #0x65
	bl sub_02007200
	bl sub_0201F988
	add r4, r0, #0
	str r5, [r4, #0x10]
	ldr r0, [sp]
	str r7, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [sp, #0x18]
	add r1, sp, #8
	str r0, [r4, #0x1c]
	ldr r0, [sp, #0x1c]
	str r0, [r4, #0x20]
	mov r0, #0x18
	ldrsh r0, [r1, r0]
	strh r0, [r4, #0x28]
	mov r0, #0x1c
	ldrsh r0, [r1, r0]
	mov r1, #0x65
	strh r0, [r4, #0x2a]
	mov r0, #0x6d
	bl NARC_New
	str r0, [r4, #0x24]
	ldr r1, [r4, #0x20]
	cmp r1, #0
	beq _0223A05E
	mov r0, #0
	strh r0, [r1]
_0223A05E:
	add r0, r4, #0
	sub r1, r6, #1
	add r0, #0x2c
	strb r1, [r0]
	mov r0, #1
	bl BgGetCharPtr
	mov r2, #2
	add r1, r0, #0
	mov r0, #0
	lsl r2, r2, #0xe
	bl MIi_CpuClear32
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	add r3, r2, #0
	bl ScheduleSetBgPosText
	add r0, r5, #0
	mov r1, #1
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	add r1, r4, #0
	add r1, #0x2c
	ldrb r2, [r1]
	mov r1, #0xc
	ldr r3, _0223A0B8 ; =ov80_0223DB98
	mul r1, r2
	add r0, r4, #0
	add r1, r3, r1
	bl ov80_0223A938
	ldr r0, _0223A0BC ; =ov80_0223A0EC
	add r1, r4, #0
	mov r2, #1
	bl sub_0200E374
	str r0, [r4, #0x34]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223A0B4: .word ov80_0223A144
_0223A0B8: .word ov80_0223DB98
_0223A0BC: .word ov80_0223A0EC
	thumb_func_end ov80_0223A00C

	thumb_func_start ov80_0223A0C0
ov80_0223A0C0: ; 0x0223A0C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl DestroySysTask
	ldr r0, [r5, #0x34]
	bl DestroySysTask
	ldr r0, [r5, #0x24]
	bl NARC_Delete
	ldr r1, [r5, #0xc]
	mov r0, #0x65
	bl FreeToHeapExplicit
	add r0, r4, #0
	bl sub_02007234
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223A0C0

	thumb_func_start ov80_0223A0EC
ov80_0223A0EC: ; 0x0223A0EC
	push {r3, r4, r5, r6}
	add r0, r1, #0
	ldr r1, _0223A13C ; =0x00000151
	sub r2, r1, #2
	ldrb r3, [r0, r2]
	sub r2, r1, #3
	ldrb r2, [r0, r2]
	ldrb r4, [r0, r1]
	lsl r3, r3, #8
	lsl r5, r2, #8
	add r6, r5, #0
	sub r5, r1, #1
	mov r2, #0xff
	lsl r2, r2, #8
	and r3, r2
	ldrb r5, [r0, r5]
	and r6, r2
	orr r3, r4
	orr r5, r6
	ldr r6, _0223A140 ; =0x04000040
	strh r5, [r6]
	strh r3, [r6, #4]
	add r3, r1, #4
	ldrb r5, [r0, r3]
	add r3, r1, #2
	ldrb r4, [r0, r3]
	add r3, r1, #1
	ldrb r3, [r0, r3]
	add r1, r1, #3
	ldrb r0, [r0, r1]
	lsl r3, r3, #8
	and r3, r2
	orr r0, r3
	strh r0, [r6, #2]
	lsl r0, r4, #8
	and r0, r2
	orr r0, r5
	strh r0, [r6, #6]
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_0223A13C: .word 0x00000151
_0223A140: .word 0x04000040
	thumb_func_end ov80_0223A0EC

	thumb_func_start ov80_0223A144
ov80_0223A144: ; 0x0223A144
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r3, r4, #0
	add r3, #0x2c
	ldrb r6, [r3]
	mov r3, #0xc
	ldr r2, _0223A170 ; =ov80_0223DB98
	mul r3, r6
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x65
	add r2, r2, r3
	bl ov80_0223A174
	cmp r0, #1
	bne _0223A16C
	add r0, r4, #0
	add r1, r5, #0
	bl ov80_0223A0C0
_0223A16C:
	pop {r4, r5, r6, pc}
	nop
_0223A170: .word ov80_0223DB98
	thumb_func_end ov80_0223A144

	thumb_func_start ov80_0223A174
ov80_0223A174: ; 0x0223A174
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r4, r0, #0
	add r6, r1, #0
	ldr r1, [r4]
	add r7, r2, #0
	ldr r5, [r4, #0xc]
	cmp r1, #0x12
	bls _0223A188
	b _0223A620
_0223A188:
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0223A194: ; jump table
	.short _0223A1BA - _0223A194 - 2 ; case 0
	.short _0223A410 - _0223A194 - 2 ; case 1
	.short _0223A42E - _0223A194 - 2 ; case 2
	.short _0223A43E - _0223A194 - 2 ; case 3
	.short _0223A458 - _0223A194 - 2 ; case 4
	.short _0223A468 - _0223A194 - 2 ; case 5
	.short _0223A476 - _0223A194 - 2 ; case 6
	.short _0223A48A - _0223A194 - 2 ; case 7
	.short _0223A4A6 - _0223A194 - 2 ; case 8
	.short _0223A4AC - _0223A194 - 2 ; case 9
	.short _0223A4C4 - _0223A194 - 2 ; case 10
	.short _0223A4D0 - _0223A194 - 2 ; case 11
	.short _0223A4F4 - _0223A194 - 2 ; case 12
	.short _0223A57A - _0223A194 - 2 ; case 13
	.short _0223A594 - _0223A194 - 2 ; case 14
	.short _0223A5A8 - _0223A194 - 2 ; case 15
	.short _0223A5B8 - _0223A194 - 2 ; case 16
	.short _0223A5D8 - _0223A194 - 2 ; case 17
	.short _0223A5E8 - _0223A194 - 2 ; case 18
_0223A1BA:
	add r0, r6, #0
	mov r1, #0x94
	bl AllocFromHeap
	str r0, [r4, #0xc]
	mov r1, #0
	mov r2, #0x94
	bl memset
	ldr r5, [r4, #0xc]
	ldr r0, [r4, #0x24]
	mov r1, #2
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0223A50C ; =0x000007D4
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #0x14]
	ldr r3, [r4, #0x18]
	bl sub_0200D68C
	mov r3, #0x59
	add r1, r0, #0
	lsl r3, r3, #2
	mov r2, #1
	lsl r2, r1
	ldr r0, [r4, r3]
	mov r1, #0x65
	orr r0, r2
	str r0, [r4, r3]
	mov r0, #4
	bl sub_02013534
	str r0, [r4, #0x30]
	ldr r2, _0223A510 ; =0x000002D9
	mov r0, #1
	mov r1, #0x1b
	add r3, r6, #0
	bl NewMsgDataFromNarc
	ldr r1, [r7]
	str r0, [sp, #0x20]
	bl NewString_ReadMsgData
	str r0, [sp, #0x24]
	ldr r0, _0223A514 ; =0x00010200
	add r1, r5, #0
	str r0, [sp]
	mov r3, #0
	ldr r0, _0223A50C ; =0x000007D4
	str r3, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x28
	ldrsh r0, [r4, r0]
	ldr r2, [sp, #0x24]
	add r1, #0x7c
	add r0, #0x74
	str r0, [sp, #0xc]
	mov r0, #0x2a
	ldrsh r0, [r4, r0]
	add r0, #0x58
	str r0, [sp, #0x10]
	str r3, [sp, #0x14]
	str r3, [sp, #0x18]
	add r0, r4, #0
	bl ov80_0223A62C
	ldr r0, [r5, #0x7c]
	mov r1, #0
	bl sub_020137C0
	ldr r0, [sp, #0x24]
	bl String_Delete
	ldr r0, [sp, #0x20]
	bl DestroyMsgData
	ldr r0, [r4, #0x24]
	mov r1, #2
	str r0, [sp]
	ldrb r0, [r7, #4]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0223A518 ; =0x000007D2
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #0x14]
	ldr r3, [r4, #0x18]
	bl sub_0200D68C
	mov r3, #0x16
	lsl r3, r3, #4
	str r0, [r4, r3]
	add r0, r3, #4
	ldr r2, [r4, r3]
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r1, r2
	orr r1, r0
	add r0, r3, #4
	str r1, [r4, r0]
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0223A51C ; =0x000007DA
	str r0, [sp, #8]
	ldrb r3, [r7, #5]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0223A518 ; =0x000007D2
	str r0, [sp, #4]
	ldrb r3, [r7, #6]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0223A518 ; =0x000007D2
	str r0, [sp, #4]
	ldrb r3, [r7, #7]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl sub_0200D71C
	mov r0, #0xe
	str r0, [sp]
	mov r0, #0
	mov r2, #0x16
	str r0, [sp, #4]
	lsl r2, r2, #4
	ldr r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	lsl r2, r2, #0x14
	mov r1, #2
	lsr r2, r2, #0x10
	mov r3, #0x10
	bl sub_02003E5C
	ldr r0, [r4, #0x24]
	mov r1, #2
	str r0, [sp]
	mov r0, #0x3b
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0223A520 ; =0x000007D3
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #0x14]
	ldr r3, [r4, #0x18]
	bl sub_0200D68C
	add r3, r0, #0
	mov r7, #0x59
	mov r0, #1
	lsl r7, r7, #2
	add r1, r0, #0
	lsl r1, r3
	ldr r2, [r4, r7]
	mov r3, #0xcc
	orr r1, r2
	str r1, [r4, r7]
	mov r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, _0223A524 ; =0x000007DB
	str r0, [sp, #8]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0223A520 ; =0x000007D3
	mov r3, #0xcd
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0223A520 ; =0x000007D3
	mov r3, #0xce
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl sub_0200D71C
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, _0223A528 ; =ov80_0223DB30
	bl sub_0200D734
	add r1, r5, #0
	add r1, #0x90
	str r0, [r1]
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DCE8
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_0200DC0C
	mov r0, #0x2a
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0223A3AA
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp, #0x1c]
	b _0223A3BA
_0223A3AA:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp, #0x1c]
_0223A3BA:
	mov r0, #0x28
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0223A3D4
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0223A3E2
_0223A3D4:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0223A3E2:
	bl _ffix
	add r7, r0, #0
	ldr r0, [sp, #0x1c]
	bl _ffix
	add r5, #0x14
	add r1, r5, #0
	mov r2, #0x12
	mov r5, #0x52
	add r3, r0, #0
	lsl r2, r2, #0xe
	lsl r5, r5, #0xc
	str r6, [sp]
	add r0, r4, #0
	add r2, r7, r2
	add r3, r3, r5
	bl ov80_0223A78C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A410:
	mov r0, #3
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0
	ldr r3, _0223A52C ; =0x00007FFF
	str r6, [sp, #8]
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A42E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223A4FC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A43E:
	mov r0, #3
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r3, _0223A52C ; =0x00007FFF
	str r6, [sp, #8]
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A458:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223A4FC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A468:
	mov r1, #0
	bl ov80_0223AA80
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A476:
	mov r0, #0x53
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r0, #1
	bne _0223A4FC
	add r0, r1, #1
	str r0, [r4]
	mov r0, #0xa
	str r0, [r5, #0x78]
	b _0223A620
_0223A48A:
	ldr r0, [r5, #0x78]
	sub r0, r0, #1
	str r0, [r5, #0x78]
	bpl _0223A4FC
	add r5, #0x14
	add r0, r5, #0
	bl ov80_0223A834
	cmp r0, #1
	bne _0223A4FC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A4A6:
	add r0, r1, #1
	str r0, [r4]
	b _0223A620
_0223A4AC:
	mov r2, #0x56
	lsl r2, r2, #2
	add r1, r5, #0
	add r2, r4, r2
	bl ov80_0223AB94
	cmp r0, #1
	bne _0223A4FC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A4C4:
	mov r0, #0xa
	str r0, [r5, #0x78]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A4D0:
	ldr r0, [r5, #0x78]
	sub r0, r0, #1
	str r0, [r5, #0x78]
	bpl _0223A4FC
	mov r0, #3
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r1, #0
	ldr r3, _0223A52C ; =0x00007FFF
	str r6, [sp, #8]
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A4F4:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _0223A4FE
_0223A4FC:
	b _0223A620
_0223A4FE:
	mov r0, #0
	mov r2, #0x59
	str r0, [sp]
	lsl r2, r2, #2
	ldr r3, [r4, r2]
	ldr r2, _0223A530 ; =0x00003FFF
	b _0223A534
	.balign 4, 0
_0223A50C: .word 0x000007D4
_0223A510: .word 0x000002D9
_0223A514: .word 0x00010200
_0223A518: .word 0x000007D2
_0223A51C: .word 0x000007DA
_0223A520: .word 0x000007D3
_0223A524: .word 0x000007DB
_0223A528: .word ov80_0223DB30
_0223A52C: .word 0x00007FFF
_0223A530: .word 0x00003FFF
_0223A534:
	ldr r0, [r4, #0x1c]
	eor r2, r3
	lsl r2, r2, #0x10
	mov r1, #2
	lsr r2, r2, #0x10
	mov r3, #0xe
	bl sub_02003EA4
	mov r0, #0
	str r0, [sp]
	mov r2, #0x16
	str r0, [sp, #4]
	lsl r2, r2, #4
	ldr r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	lsl r2, r2, #0x14
	mov r1, #2
	lsr r2, r2, #0x10
	mov r3, #0x10
	bl sub_02003E5C
	mov r0, #0xd
	mvn r0, r0
	mov r1, #0x2c
	mov r2, #1
	bl SetBlendBrightness
	ldr r0, [r5, #0x7c]
	mov r1, #1
	bl sub_020137C0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A57A:
	mov r0, #3
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r3, _0223A628 ; =0x00007FFF
	str r6, [sp, #8]
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A594:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223A620
	mov r0, #0x1a
	str r0, [r5, #0x78]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A5A8:
	ldr r0, [r5, #0x78]
	sub r0, r0, #1
	str r0, [r5, #0x78]
	bpl _0223A620
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A5B8:
	mov r0, #0xf
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x65
	mov r1, #0
	str r0, [sp, #8]
	ldr r3, _0223A628 ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A5D8:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223A620
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A5E8:
	ldr r1, _0223A628 ; =0x00007FFF
	mov r0, #1
	bl sub_0200FBF4
	ldr r1, [r4, #0x20]
	cmp r1, #0
	beq _0223A5FA
	mov r0, #1
	strh r0, [r1]
_0223A5FA:
	add r0, r5, #0
	add r0, #0x7c
	bl ov80_0223A748
	ldr r0, [r4, #0x30]
	bl sub_020135AC
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	bl sub_0200D9DC
	add r5, #0x14
	add r0, r5, #0
	bl ov80_0223A81C
	add sp, #0x28
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223A620:
	mov r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223A628: .word 0x00007FFF
	thumb_func_end ov80_0223A174

	thumb_func_start ov80_0223A62C
ov80_0223A62C: ; 0x0223A62C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	ldr r6, [sp, #0x9c]
	ldr r4, [sp, #0xa8]
	cmp r0, #0
	beq _0223A646
	bl GF_AssertFail
_0223A646:
	ldr r0, [r7, #0x10]
	cmp r4, #0
	str r0, [sp, #0x24]
	ldr r0, [r7, #0x18]
	str r0, [sp, #0x20]
	bne _0223A660
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	add r2, sp, #0x2c
	add r3, sp, #0x28
	bl ov80_0223A75C
	b _0223A668
_0223A660:
	ldrh r0, [r4, #0x12]
	str r0, [sp, #0x2c]
	ldrh r0, [r4, #0x10]
	str r0, [sp, #0x28]
_0223A668:
	cmp r4, #0
	bne _0223A6A6
	add r0, sp, #0x3c
	bl InitWindow
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x28]
	ldr r0, [sp, #0x24]
	lsl r2, r2, #0x18
	add r1, sp, #0x3c
	lsr r2, r2, #0x18
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x90]
	ldr r1, [sp, #0x1c]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r2, [sp, #0x18]
	add r0, sp, #0x3c
	str r3, [sp, #0x14]
	bl AddTextPrinterParameterized3
	b _0223A6B2
_0223A6A6:
	add r3, r4, #0
	add r2, sp, #0x3c
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
_0223A6B2:
	add r0, sp, #0x3c
	mov r1, #1
	mov r2, #0x65
	bl sub_02013688
	mov r1, #1
	add r2, r1, #0
	add r3, sp, #0x30
	bl sub_02021AC8
	ldr r0, [sp, #0xa4]
	cmp r0, #1
	bne _0223A6D6
	ldr r1, [sp, #0x2c]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	sub r6, r6, r0
_0223A6D6:
	ldr r0, [r7, #0x30]
	str r0, [sp, #0x4c]
	add r0, sp, #0x3c
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x20]
	bl sub_0200E2B0
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x98]
	bl sub_0200D934
	mov r1, #0
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x34]
	str r1, [sp, #0x5c]
	str r0, [sp, #0x60]
	ldr r0, [sp, #0xa0]
	str r6, [sp, #0x64]
	sub r0, #8
	str r0, [sp, #0x68]
	mov r0, #0xb
	str r0, [sp, #0x70]
	mov r0, #1
	str r0, [sp, #0x74]
	mov r0, #0x65
	str r0, [sp, #0x78]
	add r0, sp, #0x4c
	str r1, [sp, #0x6c]
	bl sub_020135D8
	ldr r1, [sp, #0x94]
	add r7, r0, #0
	bl sub_020138E0
	ldr r2, [sp, #0xa0]
	add r0, r7, #0
	add r1, r6, #0
	sub r2, #8
	bl sub_020136B4
	cmp r4, #0
	bne _0223A732
	add r0, sp, #0x3c
	bl RemoveWindow
_0223A732:
	str r7, [r5]
	add r3, sp, #0x30
	ldmia r3!, {r0, r1}
	add r2, r5, #4
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #0x2c]
	strh r0, [r5, #0x10]
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_0223A62C

	thumb_func_start ov80_0223A748
ov80_0223A748: ; 0x0223A748
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_02013660
	add r0, r4, #4
	bl sub_02021B5C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223A748

	thumb_func_start ov80_0223A75C
ov80_0223A75C: ; 0x0223A75C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r6, r2, #0
	add r0, r1, #0
	add r1, r4, #0
	mov r2, #0
	add r7, r3, #0
	bl FontID_String_GetWidth
	add r4, r0, #0
	asr r1, r4, #2
	lsr r1, r1, #0x1d
	add r1, r4, r1
	asr r5, r1, #3
	mov r1, #8
	bl FX_ModS32
	cmp r0, #0
	beq _0223A784
	add r5, r5, #1
_0223A784:
	str r4, [r6]
	str r5, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0223A75C

	thumb_func_start ov80_0223A78C
ov80_0223A78C: ; 0x0223A78C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r6, r3, #0
	mov ip, r2
	ldr r3, _0223A818 ; =ov80_0223DB64
	add r7, r0, #0
	add r4, r1, #0
	add r2, sp, #0
	mov r5, #6
_0223A79E:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _0223A79E
	ldr r0, [r3]
	add r5, r4, #0
	str r0, [r2]
	mov r0, ip
	asr r1, r0, #0xc
	add r0, sp, #0
	strh r1, [r0]
	asr r1, r6, #0xc
	strh r1, [r0, #2]
	mov r6, #0
	strh r6, [r4]
	strh r6, [r4, #2]
	add r5, #0x14
_0223A7C0:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x18]
	add r2, sp, #0
	bl sub_0200D734
	mov r1, #0
	str r0, [r4, #4]
	bl sub_0200DCE8
	cmp r6, #3
	beq _0223A7FA
	ldr r0, [r4, #4]
	mov r1, #2
	ldr r0, [r0]
	bl sub_0202487C
	ldr r0, [r4, #4]
	mov r1, #1
	ldr r0, [r0]
	bl Set2dSpriteAnimSeqNo
	mov r1, #2
	lsl r1, r1, #0xc
	add r0, r5, #0
	lsr r2, r1, #1
	mov r3, #6
	bl ov80_0223A8C4
	b _0223A808
_0223A7FA:
	mov r1, #1
	lsl r1, r1, #0xc
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #6
	bl ov80_0223A8C4
_0223A808:
	add r6, r6, #1
	add r4, r4, #4
	add r5, #0x14
	cmp r6, #4
	blt _0223A7C0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0223A818: .word ov80_0223DB64
	thumb_func_end ov80_0223A78C

	thumb_func_start ov80_0223A81C
ov80_0223A81C: ; 0x0223A81C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0223A822:
	ldr r0, [r5, #4]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0223A822
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0223A81C

	thumb_func_start ov80_0223A834
ov80_0223A834: ; 0x0223A834
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r0, #0
	mov r0, #1
	mov r1, #2
	str r0, [sp]
	ldrsh r0, [r7, r1]
	cmp r0, #4
	bge _0223A862
	mov r0, #0
	str r0, [sp]
	ldrsh r0, [r7, r0]
	sub r0, r0, #1
	strh r0, [r7]
	ldr r0, [sp]
	ldrsh r0, [r7, r0]
	cmp r0, #0
	bgt _0223A862
	mov r0, #3
	strh r0, [r7]
	ldrsh r0, [r7, r1]
	add r0, r0, #1
	strh r0, [r7, #2]
_0223A862:
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	ldrsh r0, [r7, r0]
	cmp r0, #0
	ble _0223A8BE
	add r6, r7, #0
	add r6, #0x14
	add r4, r7, #0
	add r5, r7, #0
_0223A876:
	add r0, r6, #0
	bl ov80_0223A8D4
	ldr r1, [r4, #0x14]
	str r0, [sp, #8]
	add r0, sp, #0xc
	add r2, r1, #0
	add r3, r1, #0
	bl ov80_0223A91C
	ldr r0, [r5, #4]
	add r1, sp, #0xc
	ldr r0, [r0]
	bl sub_020247F4
	ldr r0, [r5, #4]
	mov r1, #1
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0223A8A8
	mov r0, #0
	str r0, [sp]
_0223A8A8:
	ldr r0, [sp, #4]
	add r6, #0x14
	add r0, r0, #1
	str r0, [sp, #4]
	mov r0, #2
	ldrsh r1, [r7, r0]
	ldr r0, [sp, #4]
	add r4, #0x14
	add r5, r5, #4
	cmp r0, r1
	blt _0223A876
_0223A8BE:
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0223A834

	thumb_func_start ov80_0223A8C4
ov80_0223A8C4: ; 0x0223A8C4
	str r1, [r0]
	str r1, [r0, #4]
	sub r1, r2, r1
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov80_0223A8C4

	thumb_func_start ov80_0223A8D4
ov80_0223A8D4: ; 0x0223A8D4
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #0xc]
	ldr r0, [r4, #8]
	lsl r2, r2, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	ldr r1, [r4, #0x10]
	lsl r1, r1, #0xc
	bl FX_Div
	ldr r1, [r4, #4]
	add r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r0, r0, #1
	cmp r0, r1
	bgt _0223A914
	str r0, [r4, #0xc]
	mov r0, #0
	pop {r4, pc}
_0223A914:
	str r1, [r4, #0xc]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223A8D4

	thumb_func_start ov80_0223A91C
ov80_0223A91C: ; 0x0223A91C
	push {r4}
	sub sp, #0xc
	str r2, [sp, #4]
	str r3, [sp, #8]
	add r2, sp, #0
	add r4, r0, #0
	str r1, [sp]
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	add sp, #0xc
	pop {r4}
	bx lr
	thumb_func_end ov80_0223A91C

	thumb_func_start ov80_0223A938
ov80_0223A938: ; 0x0223A938
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r3, #1
	lsl r3, r3, #0x1a
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r3]
	ldr r0, _0223AA3C ; =0xFFFF1FFF
	add r2, r3, #0
	and r1, r0
	mov r0, #6
	lsl r0, r0, #0xc
	orr r0, r1
	str r0, [r3]
	add r2, #0x48
	ldrh r6, [r2]
	mov r0, #0x3f
	mov r1, #0x1f
	bic r6, r0
	orr r1, r6
	mov r7, #0x20
	orr r1, r7
	strh r1, [r2]
	ldrh r6, [r2]
	ldr r1, _0223AA40 ; =0xFFFFC0FF
	and r1, r6
	mov r6, #0x1f
	lsl r6, r6, #8
	orr r6, r1
	lsl r1, r7, #8
	orr r1, r6
	strh r1, [r2]
	add r1, r3, #0
	add r1, #0x4a
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #0x1d
	orr r0, r2
	orr r0, r7
	strh r0, [r1]
	add r1, r3, #0
	mov r0, #0
	add r1, #0x40
	strh r0, [r1]
	add r1, r3, #0
	add r1, #0x44
	strh r0, [r1]
	add r1, r3, #0
	add r1, #0x42
	strh r0, [r1]
	add r3, #0x46
	strh r0, [r3]
	str r0, [sp]
	str r7, [sp, #4]
	mov r0, #0xc0
	str r0, [sp, #8]
	ldrb r2, [r4, #8]
	ldr r0, [r5, #0x1c]
	mov r1, #0x6d
	mov r3, #0x65
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x65
	str r0, [sp, #0xc]
	ldrb r1, [r4, #9]
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x10]
	mov r3, #1
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x65
	str r0, [sp, #0xc]
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x10]
	mov r3, #1
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r7, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r5, #0x10]
	mov r1, #1
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	ldr r0, [r5, #0x10]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldrb r1, [r4, #8]
	mov r0, #0x6d
	add r2, sp, #0x10
	mov r3, #0x65
	bl GfGfxLoader_GetPlttData
	add r4, r0, #0
	ldr r0, [sp, #0x10]
	add r1, r5, #0
	add r2, r7, #0
	ldr r0, [r0, #0xc]
	add r1, #0x40
	add r2, #0xe0
	bl MIi_CpuCopy16
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, _0223AA44 ; =ov80_0223AA4C
	ldr r2, _0223AA48 ; =0x0000044C
	add r1, r5, #0
	bl CreateSysTask
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r5, r1]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0223AA3C: .word 0xFFFF1FFF
_0223AA40: .word 0xFFFFC0FF
_0223AA44: .word ov80_0223AA4C
_0223AA48: .word 0x0000044C
	thumb_func_end ov80_0223A938

	thumb_func_start ov80_0223AA4C
ov80_0223AA4C: ; 0x0223AA4C
	push {r3, lr}
	ldr r0, [r1, #0x38]
	add r0, r0, #1
	str r0, [r1, #0x38]
	bmi _0223AA7E
	mov r2, #0
	str r2, [r1, #0x38]
	ldr r0, [r1, #0x3c]
	add r0, r0, #1
	str r0, [r1, #0x3c]
	cmp r0, #8
	blt _0223AA66
	str r2, [r1, #0x3c]
_0223AA66:
	mov r0, #0x20
	str r0, [sp]
	add r2, r1, #0
	ldr r0, [r1, #0x1c]
	ldr r1, [r1, #0x3c]
	add r2, #0x40
	lsl r1, r1, #5
	add r1, r2, r1
	mov r2, #0
	mov r3, #0xc0
	bl PaletteData_LoadPalette
_0223AA7E:
	pop {r3, pc}
	thumb_func_end ov80_0223AA4C

	thumb_func_start ov80_0223AA80
ov80_0223AA80: ; 0x0223AA80
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r1, #0x51
	lsl r1, r1, #2
	add r4, r0, r1
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	cmp r5, #0
	bne _0223AAAE
	mov r0, #5
	lsl r0, r0, #0xc
	str r0, [r4]
	str r0, [r4, #4]
	mov r2, #0xfa
	ldr r0, _0223AAC8 ; =ov80_0223AAD0
	add r1, r4, #0
	lsl r2, r2, #2
	bl CreateSysTask
	pop {r3, r4, r5, pc}
_0223AAAE:
	mov r0, #0x2e
	lsl r0, r0, #8
	str r0, [r4]
	mov r0, #0x72
	lsl r0, r0, #8
	str r0, [r4, #4]
	mov r2, #0xfa
	ldr r0, _0223AACC ; =ov80_0223AB34
	add r1, r4, #0
	lsl r2, r2, #2
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223AAC8: .word ov80_0223AAD0
_0223AACC: .word ov80_0223AB34
	thumb_func_end ov80_0223AA80

	thumb_func_start ov80_0223AAD0
ov80_0223AAD0: ; 0x0223AAD0
	push {r3, lr}
	ldrb r2, [r1, #9]
	cmp r2, #0
	bne _0223AB28
	mov r0, #2
	ldr r2, [r1]
	lsl r0, r0, #0xa
	sub r2, r2, r0
	str r2, [r1]
	ldr r2, [r1, #4]
	add r0, r2, r0
	str r0, [r1, #4]
	mov r0, #0x2e
	ldr r2, [r1]
	lsl r0, r0, #8
	cmp r2, r0
	bgt _0223AB00
	str r0, [r1]
	mov r0, #0x72
	lsl r0, r0, #8
	str r0, [r1, #4]
	ldrb r0, [r1, #9]
	add r0, r0, #1
	strb r0, [r1, #9]
_0223AB00:
	mov r0, #0
	strb r0, [r1, #0xa]
	ldr r2, [r1]
	asr r2, r2, #8
	strb r2, [r1, #0xb]
	mov r2, #0xff
	strb r2, [r1, #0xc]
	ldr r2, [r1, #4]
	asr r2, r2, #8
	strb r2, [r1, #0xd]
	mov r2, #1
	strb r2, [r1, #0xe]
	ldr r2, [r1]
	asr r2, r2, #8
	strb r2, [r1, #0xf]
	strb r0, [r1, #0x10]
	ldr r0, [r1, #4]
	asr r0, r0, #8
	strb r0, [r1, #0x11]
	pop {r3, pc}
_0223AB28:
	mov r2, #1
	strb r2, [r1, #8]
	bl DestroySysTask
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0223AAD0

	thumb_func_start ov80_0223AB34
ov80_0223AB34: ; 0x0223AB34
	push {r3, lr}
	ldrb r2, [r1, #9]
	cmp r2, #0
	bne _0223AB88
	mov r0, #2
	ldr r2, [r1]
	lsl r0, r0, #0xa
	add r2, r2, r0
	str r2, [r1]
	ldr r2, [r1, #4]
	sub r0, r2, r0
	str r0, [r1, #4]
	mov r0, #5
	ldr r2, [r1]
	lsl r0, r0, #0xc
	cmp r2, r0
	blt _0223AB60
	str r0, [r1]
	str r0, [r1, #4]
	ldrb r0, [r1, #9]
	add r0, r0, #1
	strb r0, [r1, #9]
_0223AB60:
	mov r0, #0
	strb r0, [r1, #0xa]
	ldr r2, [r1]
	asr r2, r2, #8
	strb r2, [r1, #0xb]
	mov r2, #0xff
	strb r2, [r1, #0xc]
	ldr r2, [r1, #4]
	asr r2, r2, #8
	strb r2, [r1, #0xd]
	mov r2, #1
	strb r2, [r1, #0xe]
	ldr r2, [r1]
	asr r2, r2, #8
	strb r2, [r1, #0xf]
	strb r0, [r1, #0x10]
	ldr r0, [r1, #4]
	asr r0, r0, #8
	strb r0, [r1, #0x11]
	pop {r3, pc}
_0223AB88:
	mov r2, #1
	strb r2, [r1, #8]
	bl DestroySysTask
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0223AB34

	thumb_func_start ov80_0223AB94
ov80_0223AB94: ; 0x0223AB94
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r3, r0, #0
	ldr r0, [r4, #4]
	add r5, r1, #0
	cmp r0, #0
	beq _0223ABA8
	cmp r0, #1
	beq _0223ABE4
	b _0223AC1C
_0223ABA8:
	mov r1, #0x28
	ldrsh r2, [r3, r1]
	add r1, #0xd8
	add r0, r5, #0
	add r1, r2, r1
	mov r2, #0x2a
	ldrsh r2, [r3, r2]
	add r0, #0x90
	lsl r1, r1, #0x10
	add r2, #0x50
	lsl r2, r2, #0x10
	mov r3, #2
	ldr r0, [r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	lsl r3, r3, #0x14
	bl sub_0200DDF4
	add r5, #0x90
	ldr r0, [r5]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #1
	lsl r0, r0, #0x10
	str r0, [r4]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0223AC20
_0223ABE4:
	mov r0, #0xf
	ldr r1, [r4]
	lsl r0, r0, #8
	sub r1, r1, r0
	mov r0, #0xd
	lsl r0, r0, #0xc
	str r1, [r4]
	cmp r1, r0
	bgt _0223ABFE
	str r0, [r4]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
_0223ABFE:
	mov r2, #0x2a
	ldrsh r2, [r3, r2]
	ldr r1, [r4]
	add r5, #0x90
	add r2, #0x50
	lsl r1, r1, #8
	lsl r2, r2, #0x10
	mov r3, #2
	ldr r0, [r5]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	lsl r3, r3, #0x14
	bl sub_0200DDF4
	b _0223AC20
_0223AC1C:
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223AC20:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223AB94

    .rodata

ov80_0223DB30: ; 0x0223DB30
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xDA, 0x07, 0x00, 0x00, 0xD2, 0x07, 0x00, 0x00, 0xD2, 0x07, 0x00, 0x00
	.byte 0xD2, 0x07, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov80_0223DB64: ; 0x0223DB64
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDB, 0x07, 0x00, 0x00, 0xD3, 0x07, 0x00, 0x00
	.byte 0xD3, 0x07, 0x00, 0x00, 0xD3, 0x07, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov80_0223DB98: ; 0x0223DB98
	.byte 0xC3, 0x02, 0x00, 0x00, 0xBA, 0xB9, 0xBB, 0xBC
	.byte 0xCA, 0xC9, 0xCB, 0x00, 0xC5, 0x02, 0x00, 0x00, 0xAE, 0xAD, 0xAF, 0xB0, 0xC1, 0xC0, 0xC2, 0x00
	.byte 0xC5, 0x02, 0x00, 0x00, 0xAE, 0xAD, 0xAF, 0xB0, 0xC1, 0xC0, 0xC2, 0x00, 0xC7, 0x02, 0x00, 0x00
	.byte 0xAA, 0xA9, 0xAB, 0xAC, 0xBE, 0xBD, 0xBF, 0x00, 0xC4, 0x02, 0x00, 0x00, 0xB6, 0xB5, 0xB7, 0xB8
	.byte 0xC7, 0xC6, 0xC8, 0x00, 0xC6, 0x02, 0x00, 0x00, 0xB2, 0xB1, 0xB3, 0xB4, 0xC4, 0xC3, 0xC5, 0x00
