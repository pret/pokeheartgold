	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov92_0225C540
ov92_0225C540: ; 0x0225C540
	push {r4, lr}
	ldr r1, [r2]
	ldr r0, [r2, #4]
	add r4, r3, #0
	str r1, [r4, #0x14]
	str r0, [r4, #0x18]
	bl SetLCRNGSeed
	add r0, r4, #0
	bl ov92_0225D8D4
	pop {r4, pc}
	thumb_func_end ov92_0225C540

	thumb_func_start ov92_0225C558
ov92_0225C558: ; 0x0225C558
	add r0, r3, #0
	ldr r3, _0225C560 ; =ov92_0225D8DC
	bx r3
	nop
_0225C560: .word ov92_0225D8DC
	thumb_func_end ov92_0225C558

	thumb_func_start ov92_0225C564
ov92_0225C564: ; 0x0225C564
	ldr r1, [r3, #4]
	lsl r0, r0, #2
	add r1, r1, r0
	ldr r2, [r2]
	ldr r0, _0225C574 ; =0x00002B9C
	str r2, [r1, r0]
	bx lr
	nop
_0225C574: .word 0x00002B9C
	thumb_func_end ov92_0225C564

	thumb_func_start ov92_0225C578
ov92_0225C578: ; 0x0225C578
	lsl r0, r0, #3
	ldr r1, [r2]
	add r0, r3, r0
	str r1, [r0, #0x24]
	bx lr
	.balign 4, 0
	thumb_func_end ov92_0225C578

	thumb_func_start ov92_0225C584
ov92_0225C584: ; 0x0225C584
	bx lr
	.balign 4, 0
	thumb_func_end ov92_0225C584

	thumb_func_start ov92_0225C588
ov92_0225C588: ; 0x0225C588
	mov r0, #0
	bx lr
	thumb_func_end ov92_0225C588

	thumb_func_start ov92_0225C58C
ov92_0225C58C: ; 0x0225C58C
	mov r0, #8
	bx lr
	thumb_func_end ov92_0225C58C

	thumb_func_start ov92_0225C590
ov92_0225C590: ; 0x0225C590
	mov r0, #4
	bx lr
	thumb_func_end ov92_0225C590

	thumb_func_start ov92_0225C594
ov92_0225C594: ; 0x0225C594
	mov r0, #8
	bx lr
	thumb_func_end ov92_0225C594

	thumb_func_start ov92_0225C598
ov92_0225C598: ; 0x0225C598
	mov r0, #0x20
	bx lr
	thumb_func_end ov92_0225C598

	thumb_func_start ov92_0225C59C
ov92_0225C59C: ; 0x0225C59C
	ldr r0, _0225C5A0 ; =_0226383C
	bx lr
	.balign 4, 0
_0225C5A0: .word _0226383C
	thumb_func_end ov92_0225C59C

	thumb_func_start ov92_0225C5A4
ov92_0225C5A4: ; 0x0225C5A4
	mov r0, #5
	bx lr
	thumb_func_end ov92_0225C5A4

	thumb_func_start ov92_0225C5A8
ov92_0225C5A8: ; 0x0225C5A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov92_0225C59C
	add r4, r0, #0
	bl ov92_0225C5A4
	add r1, r0, #0
	add r0, r4, #0
	add r2, r5, #0
	bl sub_0203410C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov92_0225C5A8

	thumb_func_start ov92_0225C5C4
ov92_0225C5C4: ; 0x0225C5C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xb8
	add r5, r0, #0
	bl GetLCRNGSeed
	add r1, r5, #0
	add r1, #0x80
	str r0, [r1]
	add r0, r5, #0
	bl ov92_0225D3CC
	ldr r0, _0225C934 ; =ov92_0225D894
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r0, #0x20
	mov r1, #0x71
	bl GF_CreateVramTransferManager
	ldr r1, _0225C938 ; =0x00200010
	mov r0, #1
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	bl sub_0203A880
	mov r0, #0x71
	bl sub_0203A4AC
	add r1, sp, #0x24
	add r4, r0, #0
	bl NNS_G2dGetUnpackedPaletteData
	mov r0, #0x20
	str r0, [sp]
	ldr r1, [sp, #0x24]
	ldr r0, [r5, #0x5c]
	ldr r1, [r1, #0xc]
	mov r2, #2
	mov r3, #0xe0
	bl PaletteData_LoadPalette
	add r0, r4, #0
	bl FreeToHeap
	bl sub_020347A0
	add r4, r0, #0
	bl sub_0203769C
	str r0, [r5, #0x44]
	add r0, r5, #0
	bl ov92_0225C5A8
	add r0, r5, #0
	bl ov92_0225D8C4
	cmp r0, #1
	bne _0225C64E
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x48
	bl ov92_0225EB40
	str r0, [r5]
_0225C64E:
	add r2, r5, #0
	ldr r1, [r5, #0x44]
	add r0, r4, #0
	add r2, #0x48
	bl ov92_0225EB88
	str r0, [r5, #4]
	ldrb r2, [r5, #0x14]
	ldr r1, _0225C93C ; =0x00002BB4
	str r2, [r0, r1]
	add r0, r5, #0
	add r0, #0x80
	ldr r3, [r0]
	ldr r2, [r5, #4]
	sub r0, r1, #4
	str r3, [r2, r0]
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	add r0, r5, #0
	bl ov92_0225E9B4
	add r0, r5, #0
	bl ov92_0225E3C4
	ldr r1, [r5, #4]
	add r0, r5, #0
	bl ov92_0225E6A4
	ldr r0, [r5, #4]
	bl ov92_0225DE70
	ldr r0, [r5, #4]
	bl ov92_0225DE08
	ldr r0, [r5, #4]
	bl ov92_0225E820
	ldr r0, [r5, #4]
	bl ov92_0225E93C
	ldr r1, [r5, #0x44]
	add r0, r5, #0
	bl ov92_0226077C
	add r1, r0, #0
	add r0, r5, #0
	bl ov92_0225E130
	ldr r4, _0225C940 ; =ov92_02263A14
	add r3, sp, #0x38
	mov r2, #0x10
_0225C6BA:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0225C6BA
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r4, [sp, #0xc]
	add r0, sp, #0x38
	str r0, [sp, #8]
	add r0, r5, #0
	str r0, [sp, #0x10]
	add r0, #0x6c
	add r7, r4, #0
	add r6, r4, #0
	str r0, [sp, #0x10]
_0225C6D8:
	mov r0, #0xb5
	ldr r2, [sp, #8]
	ldr r1, [r5, #4]
	lsl r0, r0, #4
	add r0, r1, r0
	ldr r1, [r5, #0x48]
	ldr r2, [r2]
	add r0, r0, r4
	bl ov92_0225D9A8
	mov r0, #0xb5
	ldr r1, [r5, #4]
	lsl r0, r0, #4
	add r0, r1, r0
	ldrb r1, [r5, #0x14]
	add r0, r0, r4
	bl ov92_0225D9B4
	ldr r1, [r5, #4]
	mov r0, #0x71
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r2, _0225C944 ; =0x00000BC8
	str r0, [sp, #4]
	ldr r0, _0225C948 ; =0x00000BD8
	ldr r3, [sp, #8]
	add r0, r1, r0
	add r1, r1, r2
	ldr r2, [r5, #0x48]
	ldr r3, [r3, #4]
	add r0, r0, r4
	add r1, r1, r4
	bl sub_020180BC
	mov r0, #0xb5
	ldr r1, [r5, #4]
	lsl r0, r0, #4
	add r0, r1, r0
	ldr r2, _0225C948 ; =0x00000BD8
	add r0, r0, r4
	add r1, r1, r2
	add r1, r1, r4
	bl sub_020181D4
	ldr r1, [r5, #4]
	ldr r0, _0225C948 ; =0x00000BD8
	add r0, r1, r0
	add r0, r0, r4
	mov r1, #0
	bl sub_02018198
	mov r0, #0xb5
	ldr r1, [r5, #4]
	lsl r0, r0, #4
	add r0, r1, r0
	add r0, r0, r4
	mov r1, #0
	bl sub_020182A0
	ldrb r0, [r5, #0x14]
	ldr r1, [sp, #0xc]
	cmp r0, #0
	ldr r0, [sp, #0xc]
	lsl r2, r1, #0x1f
	lsr r0, r0, #0x1f
	sub r2, r2, r0
	mov r1, #0x1f
	ror r2, r1
	add r0, r0, r2
	beq _0225C7A6
	cmp r7, #0
	ble _0225C77A
	add r0, r6, #0
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225C788
_0225C77A:
	add r0, r6, #0
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225C788:
	ldr r1, [r5, #4]
	add r1, r1, r4
	str r1, [sp, #0x14]
	bl _ffix
	mov r1, #0xd3
	ldr r2, [sp, #0x14]
	lsl r1, r1, #4
	ldr r1, [r2, r1]
	add r2, r1, r0
	mov r0, #0xd3
	ldr r1, [sp, #0x14]
	lsl r0, r0, #4
	str r2, [r1, r0]
	b _0225C7E6
_0225C7A6:
	cmp r7, #0
	ble _0225C7BC
	add r0, r6, #0
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225C7CA
_0225C7BC:
	add r0, r6, #0
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225C7CA:
	ldr r1, [r5, #4]
	add r1, r1, r4
	str r1, [sp, #0x18]
	bl _ffix
	mov r1, #0xd3
	ldr r2, [sp, #0x18]
	lsl r1, r1, #4
	ldr r1, [r2, r1]
	sub r2, r1, r0
	mov r0, #0xd3
	ldr r1, [sp, #0x18]
	lsl r0, r0, #4
	str r2, [r1, r0]
_0225C7E6:
	ldr r0, [sp, #0xc]
	cmp r0, #8
	bge _0225C830
	add r1, r0, #1
	mov r0, #5
	mul r0, r1
	cmp r0, #0
	ble _0225C808
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225C816
_0225C808:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225C816:
	ldr r1, [r5, #4]
	add r1, r1, r4
	str r1, [sp, #0x1c]
	bl _ffix
	ldr r2, [sp, #0x1c]
	ldr r1, _0225C94C ; =0x00000D38
	ldr r1, [r2, r1]
	add r2, r1, r0
	ldr r1, [sp, #0x1c]
	ldr r0, _0225C94C ; =0x00000D38
	str r2, [r1, r0]
	b _0225C86C
_0225C830:
	cmp r7, #0
	ble _0225C846
	add r0, r6, #0
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225C854
_0225C846:
	add r0, r6, #0
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225C854:
	ldr r1, [r5, #4]
	add r1, r1, r4
	str r1, [sp, #0x20]
	bl _ffix
	ldr r2, [sp, #0x20]
	ldr r1, _0225C94C ; =0x00000D38
	ldr r1, [r2, r1]
	sub r2, r1, r0
	ldr r1, [sp, #0x20]
	ldr r0, _0225C94C ; =0x00000D38
	str r2, [r1, r0]
_0225C86C:
	ldr r0, [sp, #8]
	add r7, r7, #5
	add r0, #8
	str r0, [sp, #8]
	mov r0, #0x83
	lsl r0, r0, #2
	add r4, r4, r0
	mov r0, #5
	lsl r0, r0, #0xc
	add r6, r6, r0
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #8
	bge _0225C88C
	b _0225C6D8
_0225C88C:
	ldr r1, [r5, #4]
	ldr r0, _0225C950 ; =0x00000944
	mov r2, #0x47
	add r0, r1, r0
	ldr r1, [r5, #0x48]
	bl ov92_0225D9A8
	ldr r1, [r5, #4]
	ldr r0, _0225C950 ; =0x00000944
	add r0, r1, r0
	ldrb r1, [r5, #0x14]
	bl ov92_0225D9B4
	ldr r1, [r5, #4]
	ldr r0, _0225C950 ; =0x00000944
	add r0, r1, r0
	mov r1, #0
	bl sub_020182A0
	ldr r3, _0225C954 ; =ov92_022638A0
	add r2, sp, #0x28
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r1, [r5, #0x44]
	add r0, r5, #0
	bl ov92_0226077C
	lsl r1, r0, #2
	add r0, sp, #0x28
	ldr r2, [r0, r1]
	mov r0, #0x45
	ldr r1, [r5, #4]
	lsl r0, r0, #2
	add r0, r1, r0
	ldr r1, [r5, #0x48]
	bl ov92_0225D9A8
	mov r0, #0x45
	ldr r1, [r5, #4]
	lsl r0, r0, #2
	add r0, r1, r0
	ldrb r1, [r5, #0x14]
	bl ov92_0225D9B4
	mov r0, #0x32
	ldr r1, [r5, #4]
	lsl r0, r0, #4
	add r0, r1, r0
	ldr r1, [r5, #0x48]
	mov r2, #0x33
	bl ov92_0225D9A8
	ldr r1, [r5, #4]
	ldr r0, _0225C958 ; =0x0000052C
	mov r2, #0x39
	add r0, r1, r0
	ldr r1, [r5, #0x48]
	bl ov92_0225D9A8
	ldr r1, [r5, #4]
	ldr r0, _0225C95C ; =0x00000738
	mov r2, #0x37
	add r0, r1, r0
	ldr r1, [r5, #0x48]
	bl ov92_0225D9A8
	mov r0, #0x32
	ldr r1, [r5, #4]
	lsl r0, r0, #4
	add r0, r1, r0
	ldrb r1, [r5, #0x14]
	bl ov92_0225D9B4
	ldr r1, [r5, #4]
	ldr r0, _0225C958 ; =0x0000052C
	add r0, r1, r0
	ldrb r1, [r5, #0x14]
	bl ov92_0225D9B4
	ldr r1, [r5, #4]
	ldr r0, _0225C95C ; =0x00000738
	b _0225C960
	.balign 4, 0
_0225C934: .word ov92_0225D894
_0225C938: .word 0x00200010
_0225C93C: .word 0x00002BB4
_0225C940: .word ov92_02263A14
_0225C944: .word 0x00000BC8
_0225C948: .word 0x00000BD8
_0225C94C: .word 0x00000D38
_0225C950: .word 0x00000944
_0225C954: .word ov92_022638A0
_0225C958: .word 0x0000052C
_0225C95C: .word 0x00000738
_0225C960:
	add r0, r1, r0
	ldrb r1, [r5, #0x14]
	bl ov92_0225D9B4
	mov r6, #0x32
	ldr r4, [r5, #4]
	mov r0, #0x71
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x6c
	lsl r6, r6, #4
	str r0, [sp, #4]
	add r0, r4, r6
	add r1, r4, r6
	ldr r2, [r5, #0x48]
	add r0, #0x88
	add r1, #0x78
	mov r3, #0x35
	bl sub_020180BC
	add r0, r4, r6
	add r1, r0, #0
	add r1, #0x88
	bl sub_020181D4
	add r0, r4, r6
	add r0, #0x88
	mov r1, #0
	bl sub_02018198
	mov r0, #0x71
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x6c
	str r0, [sp, #4]
	add r0, r4, r6
	add r1, r4, r6
	ldr r2, [r5, #0x48]
	add r0, #0x9c
	add r1, #0x78
	mov r3, #0x34
	bl sub_020180BC
	add r0, r4, r6
	add r0, #0x9c
	mov r1, #0
	bl sub_02018198
	mov r0, #0x71
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x6c
	str r0, [sp, #4]
	add r0, r4, r6
	add r1, r4, r6
	ldr r2, [r5, #0x48]
	add r0, #0xb0
	add r1, #0x78
	mov r3, #0x3a
	bl sub_020180BC
	add r0, r4, r6
	add r0, #0xb0
	mov r1, #0
	bl sub_02018198
	ldr r4, [r5, #4]
	mov r0, #0x71
	str r0, [sp]
	add r0, r5, #0
	ldr r6, _0225CAA0 ; =0x0000052C
	add r0, #0x6c
	str r0, [sp, #4]
	add r0, r4, r6
	add r1, r4, r6
	ldr r2, [r5, #0x48]
	add r0, #0x88
	add r1, #0x78
	mov r3, #0x38
	bl sub_020180BC
	add r0, r4, r6
	add r1, r0, #0
	add r1, #0x88
	bl sub_020181D4
	add r0, r4, r6
	add r0, #0x88
	mov r1, #0
	bl sub_02018198
	ldr r4, [r5, #4]
	mov r0, #0x71
	str r0, [sp]
	add r0, r5, #0
	ldr r6, _0225CAA4 ; =0x00000738
	add r0, #0x6c
	str r0, [sp, #4]
	add r0, r4, r6
	add r1, r4, r6
	ldr r2, [r5, #0x48]
	add r0, #0x88
	add r1, #0x78
	mov r3, #0x36
	bl sub_020180BC
	add r0, r4, r6
	add r1, r0, #0
	add r1, #0x88
	bl sub_020181D4
	add r0, r4, r6
	add r0, #0x88
	mov r1, #0
	bl sub_02018198
	ldrb r0, [r5, #0x14]
	cmp r0, #0
	beq _0225CA6C
	mov r1, #0xbe
	ldr r0, _0225CAA8 ; =0xFFFF8000
	ldr r2, [r5, #4]
	lsl r1, r1, #2
	str r0, [r2, r1]
	ldr r2, [r5, #4]
	ldr r1, _0225CAAC ; =0x00000504
	str r0, [r2, r1]
	add r1, r6, #0
	ldr r2, [r5, #4]
	sub r1, #0x28
	str r0, [r2, r1]
	ldr r2, [r5, #4]
	ldr r1, _0225CAB0 ; =0x0000091C
	str r0, [r2, r1]
_0225CA6C:
	ldr r0, [r5, #0x54]
	bl sub_0200E2B0
	mov r1, #0x71
	bl ov90_02258BD4
	add r1, r5, #0
	add r1, #0x84
	str r0, [r1]
	mov r1, #2
	ldr r0, [r5, #0x5c]
	mov r2, #0
	lsl r3, r1, #8
	bl sub_020032A4
	add r5, #0x88
	ldr r0, [r5]
	ldr r0, [r0, #0x3c]
	cmp r0, #0
	beq _0225CA9A
	mov r0, #0x71
	bl ov00_021E69A8
_0225CA9A:
	add sp, #0xb8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225CAA0: .word 0x0000052C
_0225CAA4: .word 0x00000738
_0225CAA8: .word 0xFFFF8000
_0225CAAC: .word 0x00000504
_0225CAB0: .word 0x0000091C
	thumb_func_end ov92_0225C5C4

	thumb_func_start ov92_0225CAB4
ov92_0225CAB4: ; 0x0225CAB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r2, #0x65
	add r4, r0, #0
	mov r0, #3
	mov r1, #0x71
	lsl r2, r2, #0xc
	bl CreateHeap
	add r0, r4, #0
	mov r1, #0xd0
	mov r2, #0x71
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0xd0
	str r0, [sp, #4]
	bl memset
	add r0, r4, #0
	bl OverlayManager_GetParentWork
	ldr r1, [sp, #4]
	ldr r6, [sp, #4]
	add r1, #0x88
	str r0, [r1]
	mov r4, #0
	add r5, r6, #0
	mov r7, #0xff
_0225CAEE:
	add r0, r6, #0
	add r0, #0xbc
	str r7, [r0]
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _0225CB06
	add r0, r5, #0
	add r0, #0xbc
	str r4, [r0]
	add r5, r5, #4
_0225CB06:
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #4
	blt _0225CAEE
	ldr r0, [sp, #4]
	add r0, #0x88
	ldr r3, [r0]
	ldr r0, [sp, #4]
	str r3, [sp]
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x34]
	add r0, #0x8c
	ldr r3, [r3, #0x3c]
	str r0, [sp, #4]
	bl ov90_02258800
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov92_0225CAB4

	thumb_func_start ov92_0225CB2C
ov92_0225CB2C: ; 0x0225CB2C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0
	bne _0225CBC6
	cmp r6, #0
	bne _0225CBC6
	ldr r3, _0225CC48 ; =0x00001FD4
	mov r0, #0
	mov r2, #0xc3
	str r0, [r5, r3]
	add r1, r3, #4
	lsl r2, r2, #2
	str r0, [r5, r1]
	ldr r1, [r5, r2]
	cmp r1, #0
	beq _0225CB82
	mov r0, #0x45
	lsl r0, r0, #2
	mov r1, #0xfe
	add r0, r5, r0
	lsl r1, r1, #0x16
	bl ov92_02260628
	ldr r4, _0225CC4C ; =ov92_02263884
	add r3, sp, #0x18
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #0x4d
	str r0, [r3]
	add r0, r2, #0
	ldr r2, _0225CC50 ; =0x00001FC8
	lsl r1, r1, #4
	add r1, r5, r1
	add r2, r5, r2
	bl MTX_MultVec43
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0225CB82:
	add r1, r2, #4
	str r0, [r5, r1]
	add r2, #8
	str r0, [r5, r2]
	add r1, r3, #4
	ldr r2, [r5, r1]
	ldr r1, [r5, r3]
	ldr r3, _0225CC54 ; =0x3FF0A3D7
	str r2, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r5, r0
	add r3, r1, #0
	bl ov92_02260428
	ldr r0, _0225CC58 ; =0x00001FD8
	ldr r2, [r5, r0]
	sub r0, r0, #4
	ldr r1, [r5, r0]
	ldr r0, _0225CC5C ; =0x3E6147AE
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	add r3, r1, #0
	bl ov92_02260428
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0225CBC6:
	ldr r0, _0225CC60 ; =0x00001FCC
	mov r1, #0x28
	ldr r0, [r5, r0]
	asr r7, r0, #0xc
	mov r0, #0x64
	sub r0, r0, r7
	bl _s32_div_f
	bl _fflt
	ldr r0, _0225CC48 ; =0x00001FD4
	cmp r7, #0x5f
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _0225CBEA
	str r4, [r5, r0]
	add r0, r0, #4
	str r6, [r5, r0]
_0225CBEA:
	ldr r3, _0225CC58 ; =0x00001FD8
	add r1, r4, #0
	ldr r0, [r5, r3]
	sub r3, r3, #4
	str r0, [sp]
	mov r0, #1
	lsl r0, r0, #0x1e
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x45
	lsl r0, r0, #2
	ldr r3, [r5, r3]
	add r0, r5, r0
	add r2, r6, #0
	bl ov92_02260428
	ldr r3, _0225CC64 ; =ov92_02263878
	add r2, sp, #0xc
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #0x4d
	str r0, [r2]
	ldr r2, _0225CC50 ; =0x00001FC8
	lsl r1, r1, #4
	add r0, r7, #0
	add r1, r5, r1
	add r2, r5, r2
	bl MTX_MultVec43
	ldr r0, _0225CC68 ; =0x0000058A
	bl IsSEPlaying
	cmp r0, #0
	bne _0225CC3A
	ldr r0, _0225CC68 ; =0x0000058A
	bl PlaySE
_0225CC3A:
	ldr r0, _0225CC48 ; =0x00001FD4
	str r4, [r5, r0]
	add r0, r0, #4
	str r6, [r5, r0]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0225CC48: .word 0x00001FD4
_0225CC4C: .word ov92_02263884
_0225CC50: .word 0x00001FC8
_0225CC54: .word 0x3FF0A3D7
_0225CC58: .word 0x00001FD8
_0225CC5C: .word 0x3E6147AE
_0225CC60: .word 0x00001FCC
_0225CC64: .word ov92_02263878
_0225CC68: .word 0x0000058A
	thumb_func_end ov92_0225CB2C

	thumb_func_start ov92_0225CC6C
ov92_0225CC6C: ; 0x0225CC6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xcc
	ldr r3, _0225CDEC ; =ov92_02263A94
	add r5, r0, #0
	add r2, sp, #0xc
	mov r1, #0x60
_0225CC78:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _0225CC78
	add r0, r5, #0
	add r0, #0xf0
	ldr r0, [r0]
	bl sub_0200DCD4
	add r7, r0, #0
	ldr r1, [r5, #0xc]
	mov r0, #0xc
	mul r0, r1
	add r0, r7, r0
	lsl r1, r0, #2
	add r0, sp, #0xc
	ldrsh r4, [r0, r1]
	add r0, sp, #0xc
	add r0, #2
	ldrsh r6, [r0, r1]
	cmp r4, #0
	bne _0225CCB8
	cmp r6, #0
	bne _0225CCB8
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov92_0225CB2C
	b _0225CCF0
_0225CCB8:
	add r1, r4, #0
	add r2, r6, #0
	add r0, r5, #0
	add r1, #0x80
	add r2, #0x80
	bl ov92_0225CB2C
	cmp r4, #0
	beq _0225CCDE
	add r4, #0x58
	add r6, #0x80
	lsl r1, r4, #0x10
	lsl r2, r6, #0x10
	add r0, r5, #0
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov92_02260A38
	b _0225CCF0
_0225CCDE:
	add r4, #0x80
	add r6, #0x80
	lsl r1, r4, #0x10
	lsl r2, r6, #0x10
	add r0, r5, #0
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov92_02260A38
_0225CCF0:
	cmp r7, #0
	bne _0225CD00
	ldr r0, [r5, #8]
	cmp r0, r7
	beq _0225CD00
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
_0225CD00:
	str r7, [r5, #8]
	ldr r0, [r5, #0xc]
	cmp r0, #2
	bne _0225CD76
	add r0, r5, #0
	add r0, #0xf0
	ldr r0, [r0]
	bl sub_0200DC64
	cmp r0, #2
	beq _0225CD76
	add r0, r5, #0
	add r0, #0xf0
	ldr r0, [r0]
	mov r1, #0x80
	mov r2, #0x64
	bl sub_0200DDB8
	add r0, r5, #0
	add r0, #0xf0
	ldr r0, [r0]
	mov r1, #2
	bl sub_0200DC58
	mov r0, #0xa9
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov92_022630E8
	mov r0, #0xad
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov92_022630E8
	mov r3, #5
	mov r1, #0
	ldr r0, _0225CDF0 ; =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	mov r3, #4
	mvn r3, r3
	mov r1, #0
	ldr r0, _0225CDF0 ; =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
_0225CD76:
	ldr r0, [r5, #0xc]
	cmp r0, #3
	bne _0225CDDC
	cmp r7, #0xb
	bne _0225CDDC
	mov r1, #0
	str r1, [r5, #8]
	add r0, r5, #0
	str r1, [r5, #0xc]
	add r0, #0xf0
	ldr r0, [r0]
	bl sub_0200DCE8
	mov r0, #0xa9
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov92_022630E8
	mov r0, #0xad
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov92_022630E8
	mov r3, #5
	mov r1, #0
	ldr r0, _0225CDF0 ; =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	mov r3, #4
	mvn r3, r3
	mov r1, #0
	ldr r0, _0225CDF0 ; =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	add sp, #0xcc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0225CDDC:
	add r5, #0xf0
	ldr r0, [r5]
	bl sub_0200DC24
	mov r0, #0
	add sp, #0xcc
	pop {r4, r5, r6, r7, pc}
	nop
_0225CDEC: .word ov92_02263A94
_0225CDF0: .word 0x3F4CCCCD
	thumb_func_end ov92_0225CC6C

	thumb_func_start ov92_0225CDF4
ov92_0225CDF4: ; 0x0225CDF4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov92_0225D8E4
	cmp r0, #0
	beq _0225CE18
	cmp r0, #1
	beq _0225CE10
	cmp r0, #2
	beq _0225CE14
	b _0225CE18
_0225CE10:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225CE14:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225CE18:
	ldr r0, [r7]
	cmp r0, #0x14
	bls _0225CE20
	b _0225D1B8
_0225CE20:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225CE2C: ; jump table
	.short _0225CE56 - _0225CE2C - 2 ; case 0
	.short _0225CE74 - _0225CE2C - 2 ; case 1
	.short _0225CE8C - _0225CE2C - 2 ; case 2
	.short _0225CEBE - _0225CE2C - 2 ; case 3
	.short _0225CEDC - _0225CE2C - 2 ; case 4
	.short _0225CEEE - _0225CE2C - 2 ; case 5
	.short _0225CF0E - _0225CE2C - 2 ; case 6
	.short _0225CF44 - _0225CE2C - 2 ; case 7
	.short _0225CF52 - _0225CE2C - 2 ; case 8
	.short _0225CF6A - _0225CE2C - 2 ; case 9
	.short _0225CF92 - _0225CE2C - 2 ; case 10
	.short _0225CFE6 - _0225CE2C - 2 ; case 11
	.short _0225D00E - _0225CE2C - 2 ; case 12
	.short _0225D026 - _0225CE2C - 2 ; case 13
	.short _0225D068 - _0225CE2C - 2 ; case 14
	.short _0225D096 - _0225CE2C - 2 ; case 15
	.short _0225D0AA - _0225CE2C - 2 ; case 16
	.short _0225D0C6 - _0225CE2C - 2 ; case 17
	.short _0225D12A - _0225CE2C - 2 ; case 18
	.short _0225D194 - _0225CE2C - 2 ; case 19
	.short _0225D1B8 - _0225CE2C - 2 ; case 20
_0225CE56:
	add r0, r4, #0
	add r0, #0x8c
	mov r1, #0x71
	bl ov90_02258920
	add r1, r4, #0
	add r1, #0x9c
	str r0, [r1]
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CE74:
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl ov90_022589BC
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #2
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CE8C:
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl ov90_022589CC
	strb r0, [r4, #0x14]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl ov90_02258938
	add r0, r4, #0
	mov r1, #0
	add r0, #0x9c
	str r1, [r0]
	add r0, r4, #0
	bl ov92_0225C5C4
	add r0, r4, #0
	mov r1, #1
	mov r2, #3
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CEBE:
	mov r0, #0x1b
	bl ov92_0225D868
	add r5, r0, #0
	ldr r1, [r4, #4]
	add r0, r4, #0
	bl ov92_0225E1A8
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #4
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CEDC:
	bl IsPaletteFadeFinished
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #5
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CEEE:
	ldr r0, [r4, #4]
	bl ov92_0225E070
	ldr r0, [r4, #4]
	bl ov92_0226156C
	ldr r0, [r4, #4]
	bl ov92_02261B18
	add r0, r4, #0
	mov r1, #1
	mov r2, #6
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CF0E:
	ldr r0, [r4, #4]
	bl ov92_0225CC6C
	add r5, r0, #0
	beq _0225CF36
	add r0, r4, #0
	bl ov92_0225D8C4
	cmp r0, #1
	bne _0225CF36
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r4, #0
	str r0, [r4, #0x18]
	mov r0, #0x16
	add r1, #0x14
	mov r2, #8
	bl sub_02037030
_0225CF36:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #7
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CF44:
	ldr r1, [r4, #8]
	add r0, r4, #0
	mov r2, #8
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CF52:
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov90_02258C8C
	add r0, r4, #0
	mov r1, #1
	mov r2, #9
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CF6A:
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov90_02258CE0
	add r5, r0, #0
	beq _0225CF84
	ldr r0, [r4, #4]
	bl ov92_0225E360
	ldr r0, [r4, #4]
	bl ov92_0225E100
_0225CF84:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0xa
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CF92:
	ldr r5, [r4, #0xc]
	cmp r5, #0
	beq _0225CFA8
	ldr r1, [r4, #4]
	ldr r0, _0225D1E4 ; =0x00002AE4
	ldr r1, [r1, r0]
	mov r0, #0x4b
	lsl r0, r0, #4
	cmp r1, r0
	bge _0225CFA8
	mov r5, #0
_0225CFA8:
	cmp r5, #0
	bne _0225CFD8
	add r0, r4, #0
	bl ov92_0225D8C4
	cmp r0, #1
	bne _0225CFD2
	ldr r0, [r4]
	bl ov92_0225EB70
	cmp r0, #0
	bne _0225CFD2
	ldr r0, _0225D1E8 ; =0x00000589
	mov r1, #0
	bl StopSE
	mov r1, #0
	mov r0, #0x17
	add r2, r1, #0
	bl sub_02037030
_0225CFD2:
	ldr r0, [r4, #4]
	bl ov92_0225FC2C
_0225CFD8:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0xb
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CFE6:
	ldr r0, _0225D1EC ; =0x0000058B
	mov r1, #0
	bl StopSE
	ldr r0, _0225D1E8 ; =0x00000589
	mov r1, #0
	bl StopSE
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov90_02258CB0
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xc
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D00E:
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov90_02258CE0
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0xd
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D026:
	ldr r1, [r4, #4]
	ldr r0, _0225D1F0 ; =0x00002AF0
	ldr r0, [r1, r0]
	mov r1, #0xa
	bl _s32_div_f
	mov r1, #0x64
	mul r1, r0
	ldr r0, _0225D1F4 ; =0x000186A0
	str r1, [r4, #0x1c]
	cmp r1, r0
	blo _0225D040
	str r0, [r4, #0x1c]
_0225D040:
	ldr r1, [r4, #4]
	ldr r0, _0225D1F8 ; =0x00002B94
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0225D04E
	mov r0, #1
	str r0, [r4, #0x1c]
_0225D04E:
	add r1, r4, #0
	mov r0, #0x19
	add r1, #0x1c
	mov r2, #8
	bl sub_02037030
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xe
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D068:
	mov r1, #0
	add r0, r1, #0
	add r3, r1, #0
	add r5, r4, #0
_0225D070:
	ldr r2, [r5, #0x24]
	cmp r2, #0
	beq _0225D078
	add r0, r0, #1
_0225D078:
	add r3, r3, #1
	add r5, #8
	cmp r3, #4
	blt _0225D070
	ldr r2, [r4, #4]
	ldr r2, [r2, #4]
	cmp r0, r2
	bne _0225D08A
	mov r1, #1
_0225D08A:
	add r0, r4, #0
	mov r2, #0xf
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D096:
	mov r0, #0x1a
	bl ov92_0225D868
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0x10
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D0AA:
	bl IsPaletteFadeFinished
	add r5, r0, #0
	beq _0225D0B8
	add r0, r4, #0
	bl ov92_0225D1FC
_0225D0B8:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0x11
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D0C6:
	mov r6, #0
	add r5, r4, #0
_0225D0CA:
	add r0, r4, #0
	add r1, r6, #0
	bl ov92_0226077C
	cmp r0, #0xff
	beq _0225D0F2
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r2, [r5, #0x24]
	add r1, #0xa0
	str r2, [r1]
	add r1, r4, r0
	add r1, #0xa0
	ldr r1, [r1]
	cmp r1, #1
	bhi _0225D0F2
	add r1, r4, r0
	add r1, #0xa0
	mov r0, #0
	str r0, [r1]
_0225D0F2:
	add r6, r6, #1
	add r5, #8
	cmp r6, #4
	blt _0225D0CA
	add r1, r4, #0
	add r1, #0x94
	ldrb r1, [r1]
	add r0, r4, #0
	add r0, #0xa0
	bl ov90_02258AA8
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x8c
	add r1, #0xa0
	mov r2, #0x71
	bl ov90_022589EC
	add r1, r4, #0
	add r1, #0xb8
	str r0, [r1]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x12
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D12A:
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl ov90_02258AA0
	add r5, r0, #0
	beq _0225D186
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl ov90_02258AA4
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl ov90_02258A04
	add r0, r4, #0
	mov r1, #0
	add r0, #0xb8
	str r1, [r0]
	cmp r6, #0
	beq _0225D186
	add r0, r4, #0
	mov r1, #1
	add r0, #0xcc
	str r1, [r0]
	add r0, r4, #0
	bl ov92_0225D344
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	add r3, r7, #0
	bl ov92_0225D88C
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	cmp r0, #0
	beq _0225D1CA
	bl ov00_021E6A4C
	b _0225D1CA
_0225D186:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0x13
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D194:
	mov r0, #0x1b
	bl sub_02037AC0
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	cmp r0, #0
	beq _0225D1AA
	bl ov00_021E6A4C
_0225D1AA:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x14
	add r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D1B8:
	mov r0, #0x1b
	bl sub_02037B38
	cmp r0, #1
	bne _0225D1C6
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225D1C6:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225D1CA:
	ldr r0, [r7]
	cmp r0, #3
	blt _0225D1E0
	cmp r0, #0x10
	bge _0225D1E0
	ldr r0, [r4, #4]
	bl ov92_0225E008
	add r0, r4, #0
	bl ov92_0225DA40
_0225D1E0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225D1E4: .word 0x00002AE4
_0225D1E8: .word 0x00000589
_0225D1EC: .word 0x0000058B
_0225D1F0: .word 0x00002AF0
_0225D1F4: .word 0x000186A0
_0225D1F8: .word 0x00002B94
	thumb_func_end ov92_0225CDF4

	thumb_func_start ov92_0225D1FC
ov92_0225D1FC: ; 0x0225D1FC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GF_DestroyVramTransferManager
	bl sub_02021238
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl SetLCRNGSeed
	ldr r0, [r5, #4]
	bl ov92_0225E03C
	ldr r0, [r5, #4]
	bl ov92_0225DEF0
	ldr r0, [r5, #4]
	bl ov92_0225DF40
	ldr r0, [r5, #4]
	bl ov92_0225E918
	ldr r0, [r5, #4]
	bl ov92_0225E9A8
	mov r0, #0x45
	ldr r1, [r5, #4]
	lsl r0, r0, #2
	add r0, r1, r0
	bl ov92_0225DA2C
	mov r0, #0x32
	ldr r1, [r5, #4]
	lsl r0, r0, #4
	add r0, r1, r0
	bl ov92_0225DA2C
	ldr r1, [r5, #4]
	ldr r0, _0225D32C ; =0x0000052C
	add r0, r1, r0
	bl ov92_0225DA2C
	ldr r1, [r5, #4]
	ldr r0, _0225D330 ; =0x00000738
	add r0, r1, r0
	bl ov92_0225DA2C
	ldr r1, [r5, #4]
	ldr r0, _0225D334 ; =0x00000944
	add r0, r1, r0
	bl ov92_0225DA2C
	mov r0, #0xea
	ldr r1, [r5, #4]
	lsl r0, r0, #2
	add r0, r1, r0
	add r1, r5, #0
	add r1, #0x6c
	bl sub_020180F8
	mov r0, #0xef
	ldr r1, [r5, #4]
	lsl r0, r0, #2
	add r0, r1, r0
	add r1, r5, #0
	add r1, #0x6c
	bl sub_020180F8
	mov r0, #0x3d
	ldr r1, [r5, #4]
	lsl r0, r0, #4
	add r0, r1, r0
	add r1, r5, #0
	add r1, #0x6c
	bl sub_020180F8
	ldr r1, [r5, #4]
	ldr r0, _0225D338 ; =0x000005B4
	add r0, r1, r0
	add r1, r5, #0
	add r1, #0x6c
	bl sub_020180F8
	mov r0, #0x1f
	ldr r1, [r5, #4]
	lsl r0, r0, #6
	add r0, r1, r0
	add r1, r5, #0
	add r1, #0x6c
	bl sub_020180F8
	mov r7, #0
	add r6, r5, #0
	add r4, r7, #0
	add r6, #0x6c
_0225D2C8:
	mov r0, #0xb5
	ldr r1, [r5, #4]
	lsl r0, r0, #4
	add r0, r1, r0
	add r0, r0, r4
	bl ov92_0225DA2C
	ldr r1, [r5, #4]
	ldr r0, _0225D33C ; =0x00000BD8
	add r0, r1, r0
	add r0, r0, r4
	add r1, r6, #0
	bl sub_020180F8
	ldr r1, [r5, #4]
	ldr r0, _0225D340 ; =0x00000BEC
	add r0, r1, r0
	add r0, r0, r4
	add r1, r6, #0
	bl sub_020180F8
	mov r0, #0x83
	lsl r0, r0, #2
	add r7, r7, #1
	add r4, r4, r0
	cmp r7, #8
	blt _0225D2C8
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ov90_02258C38
	add r0, r5, #0
	bl ov92_0225D49C
	add r0, r5, #0
	bl ov92_0225D8C4
	cmp r0, #1
	bne _0225D31E
	ldr r0, [r5]
	bl ov92_0225EB68
_0225D31E:
	ldr r0, [r5, #4]
	bl ov92_0225ED60
	mov r0, #0
	str r0, [r5]
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225D32C: .word 0x0000052C
_0225D330: .word 0x00000738
_0225D334: .word 0x00000944
_0225D338: .word 0x000005B4
_0225D33C: .word 0x00000BD8
_0225D340: .word 0x00000BEC
	thumb_func_end ov92_0225D1FC

	thumb_func_start ov92_0225D344
ov92_0225D344: ; 0x0225D344
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	str r1, [r0, #0x10]
	add r2, r0, #0
	strb r1, [r0, #0x1c]
	add r2, #0x1c
	strb r1, [r2, #1]
	strb r1, [r2, #2]
	strb r1, [r2, #3]
	strb r1, [r2, #4]
	strb r1, [r2, #5]
	strb r1, [r2, #6]
	strb r1, [r2, #7]
	ldr r3, _0225D368 ; =memset
	add r0, #0x24
	mov r2, #0x20
	bx r3
	.balign 4, 0
_0225D368: .word memset
	thumb_func_end ov92_0225D344

	thumb_func_start ov92_0225D36C
ov92_0225D36C: ; 0x0225D36C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, [r5]
	add r6, r0, #0
	cmp r1, #0
	bne _0225D3AC
	bl OverlayManager_GetData
	bl ov92_0225D8E4
	add r4, r0, #0
	add r0, r6, #0
	bl OverlayManager_FreeData
	mov r0, #0x71
	bl DestroyHeap
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	cmp r4, #0
	beq _0225D39E
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225D39E:
	mov r0, #0xe7
	bl sub_02037AC0
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225D3C8
_0225D3AC:
	mov r0, #0xe7
	bl sub_02037B38
	cmp r0, #1
	beq _0225D3C4
	bl sub_02037454
	add r4, r0, #0
	bl sub_020347A0
	cmp r4, r0
	bge _0225D3C8
_0225D3C4:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225D3C8:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov92_0225D36C

	thumb_func_start ov92_0225D3CC
ov92_0225D3CC: ; 0x0225D3CC
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0xc1
	mov r1, #0x71
	bl NARC_ctor
	str r0, [r4, #0x48]
	mov r0, #0xbd
	mov r1, #0x71
	bl NARC_ctor
	str r0, [r4, #0x4c]
	mov r0, #0x71
	bl BgConfig_Alloc
	str r0, [r4, #0x58]
	mov r0, #0x71
	bl sub_020030E8
	str r0, [r4, #0x5c]
	mov r0, #4
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r0, #0x71
	mov r2, #1
	add r3, r1, #0
	bl GF_3DVramMan_Create
	str r0, [r4, #0x60]
	mov r0, #0x71
	bl GF_Camera_Create
	str r0, [r4, #0x64]
	add r0, r4, #0
	bl ov92_0225DD88
	ldr r0, [r4, #0x5c]
	mov r1, #1
	bl sub_02003B50
	mov r2, #2
	ldr r0, [r4, #0x5c]
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #0x71
	bl PaletteData_AllocBuffers
	mov r1, #1
	ldr r0, [r4, #0x5c]
	lsl r2, r1, #9
	mov r3, #0x71
	bl PaletteData_AllocBuffers
	mov r1, #2
	ldr r0, [r4, #0x5c]
	lsl r2, r1, #8
	mov r3, #0x71
	bl PaletteData_AllocBuffers
	mov r2, #2
	ldr r0, [r4, #0x5c]
	mov r1, #3
	lsl r2, r2, #8
	mov r3, #0x71
	bl PaletteData_AllocBuffers
	ldr r0, [r4, #0x58]
	bl ov92_0225D594
	add r0, r4, #0
	bl ov92_0225D7CC
	ldr r0, _0225D490 ; =0x04000060
	ldr r1, _0225D494 ; =0xFFFFCFFF
	ldrh r2, [r0]
	add r3, r2, #0
	and r3, r1
	mov r2, #8
	orr r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	and r2, r1
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0]
	ldr r0, _0225D498 ; =ov92_022638B0
	bl G3X_SetEdgeColorTable
	add r4, #0x6c
	add r0, r4, #0
	mov r1, #0x71
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_0225D490: .word 0x04000060
_0225D494: .word 0xFFFFCFFF
_0225D498: .word ov92_022638B0
	thumb_func_end ov92_0225D3CC

	thumb_func_start ov92_0225D49C
ov92_0225D49C: ; 0x0225D49C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #0x58]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x58]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x58]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x58]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x58]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x58]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x58]
	mov r1, #7
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x58]
	bl FreeToHeap
	ldr r0, [r4, #0x5c]
	mov r1, #0
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x5c]
	mov r1, #1
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x5c]
	mov r1, #2
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x5c]
	mov r1, #3
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x5c]
	bl sub_02003104
	ldr r0, [r4, #0x48]
	bl NARC_dtor
	ldr r0, [r4, #0x4c]
	bl NARC_dtor
	ldr r0, [r4, #0x60]
	bl GF_3DVramMan_Delete
	ldr r0, [r4, #0x64]
	bl sub_02023120
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x54]
	bl sub_0200D998
	ldr r0, [r4, #0x50]
	bl sub_0200D108
	ldr r0, _0225D588 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	ldr r2, _0225D58C ; =0x04000060
	ldr r0, _0225D590 ; =0x0000CFF7
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	pop {r4, pc}
	.balign 4, 0
_0225D588: .word gSystem + 0x60
_0225D58C: .word 0x04000060
_0225D590: .word 0x0000CFF7
	thumb_func_end ov92_0225D49C

	thumb_func_start ov92_0225D594
ov92_0225D594: ; 0x0225D594
	push {r4, r5, lr}
	sub sp, #0x11c
	add r4, r0, #0
	bl GX_DisableEngineALayers
	ldr r5, _0225D7B0 ; =ov92_02263890
	add r3, sp, #0x2c
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _0225D7B4 ; =ov92_0226390C
	add r3, sp, #4
	mov r2, #5
_0225D5B8:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0225D5B8
	add r0, sp, #4
	bl GX_SetBanks
	mov r1, #6
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x18
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x62
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	mov r1, #0x19
	mov r2, #1
	mov r0, #0
	lsl r1, r1, #0x16
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x66
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	ldr r5, _0225D7B8 ; =ov92_02263934
	add r3, sp, #0xac
	mov r2, #0xe
_0225D604:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0225D604
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x71
	bl BG_ClearCharDataRange
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x71
	bl BG_ClearCharDataRange
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x71
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #1
	add r2, sp, #0xc8
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	add r2, sp, #0xe4
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	add r2, sp, #0x100
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0225D7BC ; =ov92_022639A4
	add r3, sp, #0x3c
	mov r2, #0xe
_0225D67A:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0225D67A
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x71
	bl BG_ClearCharDataRange
	mov r0, #5
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x71
	bl BG_ClearCharDataRange
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x71
	bl BG_ClearCharDataRange
	mov r0, #7
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x71
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #4
	add r2, sp, #0x3c
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #5
	add r2, sp, #0x58
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #6
	add r2, sp, #0x74
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #7
	add r2, sp, #0x90
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x71
	bl BG_ClearCharDataRange
	mov r0, #5
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x71
	bl BG_ClearCharDataRange
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x71
	bl BG_ClearCharDataRange
	mov r0, #7
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x71
	bl BG_ClearCharDataRange
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, _0225D7C0 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #0xa
	str r0, [sp]
	ldr r0, _0225D7C4 ; =0x04000050
	mov r1, #0
	mov r2, #0x1e
	mov r3, #7
	bl G2x_SetBlendAlpha_
	mov r0, #0xa
	str r0, [sp]
	ldr r0, _0225D7C8 ; =0x04001050
	mov r1, #0
	mov r2, #0x11
	mov r3, #7
	bl G2x_SetBlendAlpha_
	add sp, #0x11c
	pop {r4, r5, pc}
	.balign 4, 0
_0225D7B0: .word ov92_02263890
_0225D7B4: .word ov92_0226390C
_0225D7B8: .word ov92_02263934
_0225D7BC: .word ov92_022639A4
_0225D7C0: .word gSystem + 0x60
_0225D7C4: .word 0x04000050
_0225D7C8: .word 0x04001050
	thumb_func_end ov92_0225D594

	thumb_func_start ov92_0225D7CC
ov92_0225D7CC: ; 0x0225D7CC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x4c
	add r4, r0, #0
	mov r0, #0x71
	bl sub_0200CF18
	add r2, sp, #0x2c
	ldr r5, _0225D85C ; =ov92_022638EC
	str r0, [r4, #0x50]
	ldmia r5!, {r0, r1}
	add r3, r2, #0
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	ldr r6, _0225D860 ; =ov92_022638C0
	stmia r2!, {r0, r1}
	add r5, sp, #0x18
	ldmia r6!, {r0, r1}
	add r2, r5, #0
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r1, r3, #0
	str r0, [r5]
	ldr r0, [r4, #0x50]
	mov r3, #0x20
	bl sub_0200CF70
	ldr r3, _0225D864 ; =ov92_022638D4
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4, #0x50]
	bl sub_0200CF38
	str r0, [r4, #0x54]
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x54]
	mov r2, #0xff
	bl sub_0200CFF4
	cmp r0, #0
	bne _0225D836
	bl GF_AssertFail
_0225D836:
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x54]
	add r2, sp, #0
	bl sub_0200D3F8
	cmp r0, #0
	bne _0225D848
	bl GF_AssertFail
_0225D848:
	ldr r0, [r4, #0x50]
	bl sub_0200CF6C
	mov r2, #1
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	add sp, #0x4c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0225D85C: .word ov92_022638EC
_0225D860: .word ov92_022638C0
_0225D864: .word ov92_022638D4
	thumb_func_end ov92_0225D7CC

	thumb_func_start ov92_0225D868
ov92_0225D868: ; 0x0225D868
	push {lr}
	sub sp, #0xc
	add r1, r0, #0
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x71
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov92_0225D868

	thumb_func_start ov92_0225D88C
ov92_0225D88C: ; 0x0225D88C
	cmp r1, #0
	beq _0225D892
	str r2, [r3]
_0225D892:
	bx lr
	thumb_func_end ov92_0225D88C

	thumb_func_start ov92_0225D894
ov92_0225D894: ; 0x0225D894
	push {r4, lr}
	add r4, r0, #0
	bl GF_RunVramTransferTasks
	bl sub_0200D034
	ldr r0, [r4, #0x5c]
	bl sub_0200398C
	ldr r0, [r4, #0x58]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _0225D8BC ; =0x027E0000
	ldr r1, _0225D8C0 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_0225D8BC: .word 0x027E0000
_0225D8C0: .word 0x00003FF8
	thumb_func_end ov92_0225D894

	thumb_func_start ov92_0225D8C4
ov92_0225D8C4: ; 0x0225D8C4
	ldr r0, [r0, #0x44]
	cmp r0, #0
	bne _0225D8CE
	mov r0, #1
	bx lr
_0225D8CE:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov92_0225D8C4

	thumb_func_start ov92_0225D8D4
ov92_0225D8D4: ; 0x0225D8D4
	mov r1, #1
	str r1, [r0, #8]
	bx lr
	.balign 4, 0
	thumb_func_end ov92_0225D8D4

	thumb_func_start ov92_0225D8DC
ov92_0225D8DC: ; 0x0225D8DC
	mov r1, #1
	str r1, [r0, #0xc]
	bx lr
	.balign 4, 0
	thumb_func_end ov92_0225D8DC

	thumb_func_start ov92_0225D8E4
ov92_0225D8E4: ; 0x0225D8E4
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x8c
	bl ov90_02258B54
	cmp r0, #1
	bne _0225D96A
	add r0, r4, #0
	add r0, #0x7c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225D916
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0225D908
	bl sub_0200FB70
_0225D908:
	mov r0, #0
	bl sub_0200FC20
	mov r0, #1
	add r4, #0x7c
	strb r0, [r4]
	pop {r4, pc}
_0225D916:
	add r0, r4, #0
	add r0, #0x8c
	bl ov90_02258B98
	cmp r0, #0
	bne _0225D926
	mov r0, #1
	pop {r4, pc}
_0225D926:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0225D93C
	bl ov92_0225E360
	ldr r0, [r4, #4]
	bl ov92_0225E100
	add r0, r4, #0
	bl ov92_0225D1FC
_0225D93C:
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	cmp r0, #0
	beq _0225D952
	bl ov90_02258A04
	add r0, r4, #0
	mov r1, #0
	add r0, #0xb8
	str r1, [r0]
_0225D952:
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	beq _0225D966
	bl ov90_02258938
	mov r0, #0
	add r4, #0x9c
	str r0, [r4]
_0225D966:
	mov r0, #2
	pop {r4, pc}
_0225D96A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov92_0225D8E4

	thumb_func_start ov92_0225D970
ov92_0225D970: ; 0x0225D970
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x6c]
	add r4, r1, #0
	add r6, r2, #0
	cmp r0, #0
	beq _0225D9A4
	bl NNS_G3dGlbFlushP
	mov r0, #0x1c
	add r1, r6, #0
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
	mov r0, #0x19
	add r1, r4, #0
	mov r2, #0xc
	bl NNS_G3dGeBufferOP_N
	add r0, r5, #0
	add r0, #0x60
	bl NNS_G3dGlbSetBaseScale
	add r0, r5, #0
	bl NNS_G3dDraw
_0225D9A4:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov92_0225D970

	thumb_func_start ov92_0225D9A8
ov92_0225D9A8: ; 0x0225D9A8
	push {r3, lr}
	add r0, #0x78
	mov r3, #0x71
	bl sub_02018030
	pop {r3, pc}
	thumb_func_end ov92_0225D9A8

	thumb_func_start ov92_0225D9B4
ov92_0225D9B4: ; 0x0225D9B4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r1, r4, #0
	add r1, #0x78
	bl sub_020181B0
	mov r1, #0
	ldr r2, _0225DA28 ; =0xFFFEC000
	add r0, r4, #0
	add r3, r1, #0
	bl sub_020182A8
	cmp r5, #0
	bne _0225D9E2
	mov r1, #1
	lsl r1, r1, #0xc
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_020182C4
	b _0225D9F0
_0225D9E2:
	mov r1, #6
	lsl r1, r1, #0xa
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_020182C4
_0225D9F0:
	add r0, r4, #0
	mov r1, #1
	bl sub_020182A0
	mov r2, #0x1e
	lsl r2, r2, #4
	mov r0, #0
	ldr r3, _0225DA28 ; =0xFFFEC000
	str r0, [r4, r2]
	add r1, r2, #4
	str r3, [r4, r1]
	add r1, r2, #0
	add r1, #8
	str r0, [r4, r1]
	add r1, r2, #0
	add r1, #0x1c
	str r0, [r4, r1]
	add r1, r2, #0
	add r1, #0x20
	str r0, [r4, r1]
	add r1, r2, #0
	add r1, #0xc
	str r0, [r4, r1]
	mov r0, #1
	add r2, #0x10
	str r0, [r4, r2]
	pop {r3, r4, r5, pc}
	nop
_0225DA28: .word 0xFFFEC000
	thumb_func_end ov92_0225D9B4

	thumb_func_start ov92_0225DA2C
ov92_0225DA2C: ; 0x0225DA2C
	mov r1, #0x1f
	ldr r3, _0225DA3C ; =sub_02018068
	mov r2, #0
	lsl r1, r1, #4
	str r2, [r0, r1]
	add r0, #0x78
	bx r3
	nop
_0225DA3C: .word sub_02018068
	thumb_func_end ov92_0225DA2C

	thumb_func_start ov92_0225DA40
ov92_0225DA40: ; 0x0225DA40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	bl sub_02026E48
	bl sub_02023154
	ldr r4, _0225DD04 ; =ov92_02263B68
	add r3, sp, #0x18
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	add r1, r2, #0
	str r0, [r3]
	add r0, r2, #0
	bl VEC_Normalize
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	mov r0, #0
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl NNS_G3dGlbLightVector
	ldr r1, _0225DD08 ; =0x00007FFF
	mov r0, #0
	bl NNS_G3dGlbLightColor
	ldr r0, _0225DD08 ; =0x00007FFF
	mov r2, #0
	add r1, r0, #0
	bl NNS_G3dGlbMaterialColorDiffAmb
	ldr r0, _0225DD08 ; =0x00007FFF
	mov r2, #0
	add r1, r0, #0
	bl NNS_G3dGlbMaterialColorSpecEmi
	mov r7, #0
	add r4, r7, #0
_0225DA9C:
	mov r0, #0xb5
	ldr r1, [r5, #4]
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	add r6, r0, r4
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	mov r1, #0x1b
	mov r2, #0x1e
	lsl r1, r1, #4
	lsl r2, r2, #4
	add r0, r6, #0
	add r1, r6, r1
	add r2, r6, r2
	bl ov92_0225D970
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0x12
	add r1, sp, #0x14
	mov r2, #1
	bl NNS_G3dGeBufferOP_N
	ldr r1, [r5, #4]
	ldr r0, _0225DD0C ; =0x00000BD8
	add r0, r1, r0
	mov r1, #1
	add r0, r0, r4
	lsl r1, r1, #0xc
	bl sub_02018124
	mov r0, #0x83
	lsl r0, r0, #2
	add r7, r7, #1
	add r4, r4, r0
	cmp r7, #8
	blt _0225DA9C
	ldr r1, [r5, #4]
	sub r0, #0xfc
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225DB00
	cmp r0, #1
	beq _0225DB40
	cmp r0, #2
	beq _0225DB74
	b _0225DBA8
_0225DB00:
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #1
	bl sub_020182A0
	ldr r1, [r5, #4]
	ldr r0, _0225DD10 ; =0x0000052C
	add r0, r1, r0
	mov r1, #0
	bl sub_020182A0
	ldr r1, [r5, #4]
	ldr r0, _0225DD14 ; =0x00000738
	add r0, r1, r0
	mov r1, #0
	bl sub_020182A0
	mov r0, #0xea
	ldr r1, [r5, #4]
	lsl r0, r0, #2
	add r2, r1, r0
	ldr r0, _0225DD18 ; =0x00000514
	ldr r1, [r1, r0]
	mov r0, #0x14
	mul r0, r1
	mov r1, #1
	add r0, r2, r0
	lsl r1, r1, #0xc
	bl sub_02018124
	b _0225DBA8
_0225DB40:
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl sub_020182A0
	ldr r1, [r5, #4]
	ldr r0, _0225DD10 ; =0x0000052C
	add r0, r1, r0
	mov r1, #1
	bl sub_020182A0
	ldr r1, [r5, #4]
	ldr r0, _0225DD14 ; =0x00000738
	add r0, r1, r0
	mov r1, #0
	bl sub_020182A0
	ldr r1, [r5, #4]
	ldr r0, _0225DD1C ; =0x000005B4
	add r0, r1, r0
	mov r1, #1
	lsl r1, r1, #0xc
	bl sub_0201815C
	b _0225DBA8
_0225DB74:
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl sub_020182A0
	ldr r1, [r5, #4]
	ldr r0, _0225DD10 ; =0x0000052C
	add r0, r1, r0
	mov r1, #0
	bl sub_020182A0
	ldr r1, [r5, #4]
	ldr r0, _0225DD14 ; =0x00000738
	add r0, r1, r0
	mov r1, #1
	bl sub_020182A0
	mov r0, #0x1f
	ldr r1, [r5, #4]
	lsl r0, r0, #6
	add r0, r1, r0
	mov r1, #1
	lsl r1, r1, #0xc
	bl sub_0201815C
_0225DBA8:
	mov r0, #0x32
	ldr r1, [r5, #4]
	lsl r0, r0, #4
	add r4, r1, r0
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r1, [r1, r0]
	add r0, #0xfc
	add r6, r1, #0
	mov r1, #0
	mul r6, r0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	mov r2, #0x1b
	lsl r2, r2, #4
	add r1, r4, r2
	add r2, #0x30
	add r0, r4, r6
	add r2, r4, r2
	bl ov92_0225D970
	mov r2, #1
	str r2, [sp, #0x10]
	mov r0, #0x12
	add r1, sp, #0x10
	bl NNS_G3dGeBufferOP_N
	mov r0, #0x45
	ldr r1, [r5, #4]
	lsl r0, r0, #2
	add r4, r1, r0
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	mov r2, #0x1b
	lsl r2, r2, #4
	add r1, r4, r2
	add r2, #0x30
	add r0, r4, #0
	add r2, r4, r2
	bl ov92_0225D970
	mov r2, #1
	str r2, [sp, #0xc]
	mov r0, #0x12
	add r1, sp, #0xc
	bl NNS_G3dGeBufferOP_N
	ldr r1, [r5, #4]
	ldr r0, _0225DD20 ; =0x00000944
	add r4, r1, r0
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	mov r2, #0x1b
	lsl r2, r2, #4
	add r1, r4, r2
	add r2, #0x30
	add r0, r4, #0
	add r2, r4, r2
	bl ov92_0225D970
	mov r2, #1
	str r2, [sp, #8]
	mov r0, #0x12
	add r1, sp, #8
	bl NNS_G3dGeBufferOP_N
	ldr r1, [r5, #4]
	ldr r0, _0225DD24 ; =0x00001FAC
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225DCA6
	ldr r0, _0225DD28 ; =0x00001DBC
	add r4, r1, r0
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	mov r2, #0x1b
	lsl r2, r2, #4
	add r1, r4, r2
	add r2, #0x30
	add r0, r4, #0
	add r2, r4, r2
	bl ov92_0225D970
	mov r2, #1
	str r2, [sp, #4]
	mov r0, #0x12
	add r1, sp, #4
	bl NNS_G3dGeBufferOP_N
	ldr r1, [r5, #4]
	ldr r0, _0225DD2C ; =0x00001FA8
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225DCA6
	ldr r0, _0225DD30 ; =0x00001E44
	add r0, r1, r0
	mov r1, #1
	lsl r1, r1, #0xc
	bl sub_0201815C
	add r4, r0, #0
	ldr r1, [r5, #4]
	ldr r0, _0225DD34 ; =0x00001E58
	add r0, r1, r0
	mov r1, #1
	lsl r1, r1, #0xc
	bl sub_0201815C
	cmp r4, #0
	beq _0225DCA6
	cmp r0, #0
	beq _0225DCA6
	ldr r1, [r5, #4]
	ldr r0, _0225DD2C ; =0x00001FA8
	mov r2, #0
	str r2, [r1, r0]
_0225DCA6:
	ldr r1, [r5, #4]
	ldr r0, _0225DD38 ; =0x00001DA0
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225DCF0
	ldr r0, _0225DD3C ; =0x00001BB0
	add r4, r1, r0
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	mov r2, #0x1b
	lsl r2, r2, #4
	add r1, r4, r2
	add r2, #0x30
	add r0, r4, #0
	add r2, r4, r2
	bl ov92_0225D970
	mov r2, #1
	str r2, [sp]
	mov r0, #0x12
	add r1, sp, #0
	bl NNS_G3dGeBufferOP_N
	ldr r1, [r5, #4]
	ldr r0, _0225DD40 ; =0x00001D9C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225DCF0
	ldr r0, _0225DD44 ; =0x00001C4C
	add r0, r1, r0
	mov r1, #1
	lsl r1, r1, #0xc
	bl sub_02018124
_0225DCF0:
	mov r0, #0
	mov r1, #1
	bl sub_02026E50
	ldr r0, [r5, #0x54]
	bl sub_0200D020
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0225DD04: .word ov92_02263B68
_0225DD08: .word 0x00007FFF
_0225DD0C: .word 0x00000BD8
_0225DD10: .word 0x0000052C
_0225DD14: .word 0x00000738
_0225DD18: .word 0x00000514
_0225DD1C: .word 0x000005B4
_0225DD20: .word 0x00000944
_0225DD24: .word 0x00001FAC
_0225DD28: .word 0x00001DBC
_0225DD2C: .word 0x00001FA8
_0225DD30: .word 0x00001E44
_0225DD34: .word 0x00001E58
_0225DD38: .word 0x00001DA0
_0225DD3C: .word 0x00001BB0
_0225DD40: .word 0x00001D9C
_0225DD44: .word 0x00001C4C
	thumb_func_end ov92_0225DA40

	thumb_func_start ov92_0225DD48
ov92_0225DD48: ; 0x0225DD48
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0225DD84 ; =0x00000514
	add r4, r1, #0
	ldr r1, [r5, r0]
	cmp r4, r1
	beq _0225DD82
	mov r2, #0x32
	lsl r2, r2, #4
	add r0, r5, r2
	add r2, #0x88
	add r3, r5, r2
	mov r2, #0x14
	mul r2, r1
	add r1, r3, r2
	bl sub_020181E0
	ldr r0, _0225DD84 ; =0x00000514
	mov r1, #0x32
	lsl r1, r1, #4
	str r4, [r5, r0]
	add r0, r5, r1
	add r1, #0x88
	add r2, r5, r1
	mov r1, #0x14
	mul r1, r4
	add r1, r2, r1
	bl sub_020181D4
_0225DD82:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225DD84: .word 0x00000514
	thumb_func_end ov92_0225DD48

	thumb_func_start ov92_0225DD88
ov92_0225DD88: ; 0x0225DD88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r6, _0225DDD0 ; =ov92_02263B5C
	add r4, r0, #0
	ldmia r6!, {r0, r1}
	add r5, sp, #8
	add r2, r5, #0
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r1, r2, #0
	mov r2, #0xb6
	add r7, sp, #0x14
	mov r3, #0
	str r3, [r7]
	str r3, [r7, #4]
	str r3, [r7, #8]
	str r0, [r5]
	str r3, [sp]
	ldr r0, [r4, #0x64]
	lsl r2, r2, #4
	str r0, [sp, #4]
	add r0, r7, #0
	bl sub_02023308
	mov r1, #0xfa
	ldr r0, _0225DDD4 ; =0xFFC18000
	ldr r2, [r4, #0x64]
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	ldr r0, [r4, #0x64]
	bl GF_Camera_RegisterToStaticPtr
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225DDD0: .word ov92_02263B5C
_0225DDD4: .word 0xFFC18000
	thumb_func_end ov92_0225DD88

	thumb_func_start ov92_0225DDD8
ov92_0225DDD8: ; 0x0225DDD8
	push {r3, r4}
	strh r1, [r0]
	strh r2, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	mov r2, #2
	str r2, [r0, #0x2c]
	str r1, [r0, #0x30]
	ldr r1, [sp, #8]
	ldr r4, [sp, #0xc]
	str r1, [r0, #0xc]
	str r4, [r0, #0x14]
	str r4, [r0, #0x18]
	str r4, [r0, #0x1c]
	str r4, [r0, #0x20]
	sub r1, r2, #3
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov92_0225DDD8

	thumb_func_start ov92_0225DE08
ov92_0225DE08: ; 0x0225DE08
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	ldr r1, [r0, #0x14]
	str r0, [sp, #8]
	ldr r0, [r1, #8]
	mov r6, #0
	ldr r7, [r1, #0xc]
	ldr r5, [sp, #8]
	str r0, [sp, #0xc]
	add r4, r6, #0
_0225DE1C:
	mov r0, #3
	str r0, [sp]
	ldr r0, _0225DE6C ; =0x0000232E
	lsl r1, r4, #0x10
	str r0, [sp, #4]
	add r0, sp, #0x10
	asr r1, r1, #0x10
	mov r2, #0x14
	mov r3, #1
	bl ov92_0225DDD8
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	add r2, sp, #0x10
	bl sub_0200D734
	mov r1, #3
	str r0, [r5, #0x40]
	bl sub_0200DD24
	add r0, r6, #0
	mov r1, #0xb
	bl _s32_div_f
	ldr r0, [r5, #0x40]
	add r1, r1, #1
	bl sub_0200DC4C
	add r6, r6, #1
	add r4, #8
	add r5, r5, #4
	cmp r6, #0x24
	blt _0225DE1C
	mov r1, #0
	ldr r0, [sp, #8]
	add r2, r1, #0
	bl ov92_0225DF0C
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225DE6C: .word 0x0000232E
	thumb_func_end ov92_0225DE08

	thumb_func_start ov92_0225DE70
ov92_0225DE70: ; 0x0225DE70
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	add r5, r0, #0
	ldr r1, [r5, #0x14]
	add r4, sp, #0xc
	ldr r0, [r1, #8]
	ldr r7, [r1, #0xc]
	ldr r1, _0225DEE8 ; =ov92_02263B54
	str r0, [sp, #8]
	ldrh r2, [r1]
	add r0, sp, #0xc
	mov r6, #0
	strh r2, [r0]
	ldrh r2, [r1, #2]
	strh r2, [r0, #2]
	ldrh r2, [r1, #4]
	ldrh r1, [r1, #6]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
_0225DE96:
	mov r0, #1
	str r0, [sp]
	ldr r0, _0225DEEC ; =0x0000232C
	mov r1, #0
	str r0, [sp, #4]
	ldrsh r1, [r4, r1]
	add r0, sp, #0x14
	mov r2, #0xe0
	mov r3, #1
	bl ov92_0225DDD8
	mov r0, #0
	str r0, [sp, #0x40]
	mov r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	add r1, r7, #0
	add r2, sp, #0x14
	bl sub_0200D734
	add r1, r5, #0
	add r1, #0xd0
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl sub_0200DC24
	add r0, r5, #0
	add r0, #0xd0
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DD24
	add r6, r6, #1
	add r4, r4, #2
	add r5, r5, #4
	cmp r6, #4
	blt _0225DE96
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225DEE8: .word ov92_02263B54
_0225DEEC: .word 0x0000232C
	thumb_func_end ov92_0225DE70

	thumb_func_start ov92_0225DEF0
ov92_0225DEF0: ; 0x0225DEF0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0225DEF6:
	add r0, r5, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0225DEF6
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov92_0225DEF0

	thumb_func_start ov92_0225DF0C
ov92_0225DF0C: ; 0x0225DF0C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
_0225DF14:
	ldr r0, [r5, #0x40]
	add r1, r6, #0
	bl sub_0200DCE8
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x24
	blt _0225DF14
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov92_0225DF0C

	thumb_func_start ov92_0225DF28
ov92_0225DF28: ; 0x0225DF28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0225DF2E:
	ldr r0, [r5, #0x40]
	bl sub_0200DC24
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x24
	blt _0225DF2E
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov92_0225DF28

	thumb_func_start ov92_0225DF40
ov92_0225DF40: ; 0x0225DF40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0225DF46:
	ldr r0, [r5, #0x40]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x24
	blt _0225DF46
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov92_0225DF40

	thumb_func_start ov92_0225DF58
ov92_0225DF58: ; 0x0225DF58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r4, _0225DFA0 ; =ov92_02263BCC
	add r6, r2, #0
	add r2, sp, #0
	add r5, r0, #0
	add r3, r1, #0
	add r7, r2, #0
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	lsl r0, r3, #1
	add r0, r5, r0
	add r0, #0xf4
	lsl r4, r6, #3
	ldrh r0, [r0]
	ldr r1, [r7, r4]
	lsl r6, r0, #2
	add r0, r5, r6
	ldr r0, [r0, #0x1c]
	bl sub_0200DC4C
	add r0, r5, r6
	add r1, sp, #4
	ldr r0, [r0, #0x28]
	ldr r1, [r1, r4]
	bl sub_0200DC4C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225DFA0: .word ov92_02263BCC
	thumb_func_end ov92_0225DF58

	thumb_func_start ov92_0225DFA4
ov92_0225DFA4: ; 0x0225DFA4
	push {r4, r5, r6, lr}
	sub sp, #0x20
	ldr r3, _0225E004 ; =ov92_02263B8C
	add r2, sp, #0
	add r5, r0, #0
	add r4, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	lsl r0, r4, #1
	add r0, r5, r0
	add r0, #0xf4
	ldrh r0, [r0]
	lsl r6, r0, #2
	add r0, r5, r6
	ldr r0, [r0, #0x1c]
	bl sub_0200DC64
	add r4, r0, #0
	add r0, r5, r6
	ldr r0, [r0, #0x28]
	bl sub_0200DC64
	mov r2, #0
	add r3, sp, #0
_0225DFE0:
	ldr r1, [r3]
	cmp r4, r1
	bne _0225DFF2
	ldr r1, [r3, #4]
	cmp r0, r1
	bne _0225DFF2
	add sp, #0x20
	add r0, r2, #0
	pop {r4, r5, r6, pc}
_0225DFF2:
	add r2, r2, #1
	add r3, #8
	cmp r2, #4
	blt _0225DFE0
	bl GF_AssertFail
	mov r0, #0
	add sp, #0x20
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225E004: .word ov92_02263B8C
	thumb_func_end ov92_0225DFA4

	thumb_func_start ov92_0225E008
ov92_0225E008: ; 0x0225E008
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r6, #4]
	mov r4, #0
	cmp r0, #0
	ble _0225E038
	add r5, r6, #0
_0225E016:
	ldr r0, [r6]
	cmp r4, r0
	beq _0225E030
	ldr r0, [r5, #0x1c]
	bl sub_0200DC24
	ldr r0, [r5, #0x28]
	bl sub_0200DC24
	ldr r0, [r5, #0x34]
	bl sub_0200DC24
	add r5, r5, #4
_0225E030:
	ldr r0, [r6, #4]
	add r4, r4, #1
	cmp r4, r0
	blt _0225E016
_0225E038:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov92_0225E008

	thumb_func_start ov92_0225E03C
ov92_0225E03C: ; 0x0225E03C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r6, #4]
	mov r4, #0
	cmp r0, #0
	ble _0225E06C
	add r5, r6, #0
_0225E04A:
	ldr r0, [r6]
	cmp r4, r0
	beq _0225E064
	ldr r0, [r5, #0x1c]
	bl sub_0200D9DC
	ldr r0, [r5, #0x28]
	bl sub_0200D9DC
	ldr r0, [r5, #0x34]
	bl sub_0200D9DC
	add r5, r5, #4
_0225E064:
	ldr r0, [r6, #4]
	add r4, r4, #1
	cmp r4, r0
	blt _0225E04A
_0225E06C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov92_0225E03C

	thumb_func_start ov92_0225E070
ov92_0225E070: ; 0x0225E070
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, _0225E0FC ; =0x00001FE0
	add r0, r5, r0
	bl InitWindow
	mov r1, #0x13
	str r1, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	lsl r0, r1, #4
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x14]
	ldr r1, _0225E0FC ; =0x00001FE0
	ldr r0, [r0, #0x10]
	add r1, r5, r1
	mov r2, #7
	mov r3, #2
	bl AddWindowParameterized
	ldr r0, _0225E0FC ; =0x00001FE0
	mov r1, #0xff
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xeb
	mov r3, #0x71
	bl NewMsgDataFromNarc
	mov r1, #0
	add r6, r0, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r1, #0
	ldr r0, _0225E0FC ; =0x00001FE0
	str r1, [sp]
	str r1, [sp, #4]
	add r0, r5, r0
	add r2, r4, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl String_dtor
	add r0, r6, #0
	bl DestroyMsgData
	ldr r0, _0225E0FC ; =0x00001FE0
	mov r1, #0
	add r0, r5, r0
	mov r2, #0xb4
	mov r3, #0xd
	bl DrawFrameAndWindow1
	ldr r0, _0225E0FC ; =0x00001FE0
	add r0, r5, r0
	bl CopyWindowToVram
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0225E0FC: .word 0x00001FE0
	thumb_func_end ov92_0225E070

	thumb_func_start ov92_0225E100
ov92_0225E100: ; 0x0225E100
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0225E12C ; =0x00001FE0
	add r0, r4, r0
	bl WindowIsInUse
	cmp r0, #1
	bne _0225E12A
	ldr r0, _0225E12C ; =0x00001FE0
	mov r1, #1
	add r0, r4, r0
	bl sub_0200E5D4
	ldr r0, _0225E12C ; =0x00001FE0
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0225E12C ; =0x00001FE0
	add r0, r4, r0
	bl RemoveWindow
_0225E12A:
	pop {r4, pc}
	.balign 4, 0
_0225E12C: .word 0x00001FE0
	thumb_func_end ov92_0225E100

	thumb_func_start ov92_0225E130
ov92_0225E130: ; 0x0225E130
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	ldr r0, [r7, #0x5c]
	mov r4, #0
	str r0, [sp, #0x10]
	mov r0, #0x14
	ldr r2, _0225E184 ; =_02264020
	mul r0, r1
	add r5, r4, #0
	add r6, r2, r0
_0225E146:
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	add r0, r4, #1
	lsl r0, r0, #0x14
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [r7, #4]
	mov r2, #0x49
	ldr r1, [r0, #4]
	mov r0, #0x50
	mul r0, r1
	add r0, r6, r0
	add r0, r5, r0
	sub r0, #0x4c
	ldr r0, [r0]
	mov r1, #0xc1
	lsl r0, r0, #0x14
	lsr r0, r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov r3, #0x71
	bl PaletteData_LoadFromNarc
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0225E146
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E184: .word _02264020
	thumb_func_end ov92_0225E130

	thumb_func_start ov92_0225E188
ov92_0225E188: ; 0x0225E188
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r4, r0, #0
	add r0, r5, #0
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r1, r0, r4
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov92_0225E188

	thumb_func_start ov92_0225E1A8
ov92_0225E1A8: ; 0x0225E1A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	str r0, [sp, #0x18]
	mov r0, #1
	lsl r0, r0, #8
	add r5, r1, #0
	ldr r3, _0225E350 ; =ov92_02263BEC
	str r0, [sp, #0x24]
	add r2, sp, #0x34
	mov r1, #0x24
_0225E1BC:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _0225E1BC
	ldr r0, [r5, #4]
	cmp r0, #2
	beq _0225E1D8
	cmp r0, #3
	beq _0225E1F4
	cmp r0, #4
	beq _0225E210
	b _0225E22C
_0225E1D8:
	ldr r2, [r5, #0x14]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	str r0, [sp, #0xc]
	ldr r0, [r2]
	ldr r2, [r2, #0x10]
	mov r1, #0x4f
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	b _0225E230
_0225E1F4:
	ldr r2, [r5, #0x14]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	str r0, [sp, #0xc]
	ldr r0, [r2]
	ldr r2, [r2, #0x10]
	mov r1, #0x50
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	b _0225E230
_0225E210:
	ldr r2, [r5, #0x14]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	str r0, [sp, #0xc]
	ldr r0, [r2]
	ldr r2, [r2, #0x10]
	mov r1, #0x51
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	b _0225E230
_0225E22C:
	bl GF_AssertFail
_0225E230:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	bgt _0225E23A
	b _0225E34C
_0225E23A:
	ldr r0, _0225E354 ; =0x00001FF0
	str r6, [sp, #0x1c]
	add r4, r5, r0
	ldr r0, [sp, #0x18]
	add r0, #0x8c
	str r0, [sp, #0x18]
_0225E246:
	ldr r0, [r5]
	cmp r6, r0
	beq _0225E342
	ldr r0, [sp, #0x18]
	add r1, r6, #0
	bl ov90_022588A4
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x18]
	add r1, r6, #0
	bl ov90_022588CC
	str r0, [sp, #0x2c]
	add r0, r4, #0
	bl InitWindow
	ldr r1, [r5, #4]
	mov r0, #0x18
	add r2, r1, #0
	mul r2, r0
	add r0, sp, #0x34
	add r1, r0, r2
	ldr r0, [sp, #0x1c]
	mov r2, #7
	add r7, r1, r0
	mov r0, #0x2b
	mvn r0, r0
	ldrsh r0, [r7, r0]
	add r3, r2, #0
	sub r3, #0x37
	str r0, [sp, #0x20]
	mov r0, #0x29
	mvn r0, r0
	ldrsh r0, [r7, r0]
	add r1, r4, #0
	str r0, [sp, #0x30]
	mov r0, #0x2d
	mvn r0, r0
	ldrsh r0, [r7, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x20]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrsh r3, [r7, r3]
	ldr r0, [r5, #0x14]
	lsl r3, r3, #0x18
	ldr r0, [r0, #0x10]
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x30]
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x24]
	mov r1, #0xff
	add r0, r0, r2
	str r0, [sp, #0x24]
	add r0, r4, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x2c]
	mov r1, #0x71
	bl PlayerProfile_GetPlayerName_NewString
	add r7, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl ov92_0225E188
	add r3, r0, #0
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _0225E312
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0225E358 ; =0x0005060F
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r2, r7, #0
	bl AddTextPrinterParameterized3
	b _0225E32E
_0225E312:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0225E35C ; =0x0001020F
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r2, r7, #0
	bl AddTextPrinterParameterized3
_0225E32E:
	add r0, r7, #0
	bl String_dtor
	add r0, r4, #0
	bl CopyWindowToVram
	ldr r0, [sp, #0x1c]
	add r4, #0x10
	add r0, #8
	str r0, [sp, #0x1c]
_0225E342:
	ldr r0, [r5, #4]
	add r6, r6, #1
	cmp r6, r0
	bge _0225E34C
	b _0225E246
_0225E34C:
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E350: .word ov92_02263BEC
_0225E354: .word 0x00001FF0
_0225E358: .word 0x0005060F
_0225E35C: .word 0x0001020F
	thumb_func_end ov92_0225E1A8

	thumb_func_start ov92_0225E360
ov92_0225E360: ; 0x0225E360
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r0, [r6, #4]
	mov r4, #0
	cmp r0, #0
	ble _0225E3A2
	ldr r0, _0225E3C0 ; =0x00001FF0
	mov r7, #1
	add r5, r6, r0
_0225E374:
	ldr r0, [r6]
	cmp r4, r0
	beq _0225E39A
	add r0, r5, #0
	bl WindowIsInUse
	cmp r0, #1
	bne _0225E398
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0200E5D4
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
_0225E398:
	add r5, #0x10
_0225E39A:
	ldr r0, [r6, #4]
	add r4, r4, #1
	cmp r4, r0
	blt _0225E374
_0225E3A2:
	ldr r2, [r6, #0x14]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	str r0, [sp, #0xc]
	ldr r0, [r2]
	ldr r2, [r2, #0x10]
	mov r1, #0x4e
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E3C0: .word 0x00001FF0
	thumb_func_end ov92_0225E360

	thumb_func_start ov92_0225E3C4
ov92_0225E3C4: ; 0x0225E3C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r4, [r0, #0x48]
	ldr r5, [r0, #0x54]
	ldr r6, [r0, #0x50]
	ldr r7, [r0, #0x5c]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _0225E688 ; =0x00002328
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x54
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E688 ; =0x00002328
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x53
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E688 ; =0x00002328
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x52
	bl sub_0200D71C
	str r4, [sp]
	mov r0, #0x55
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _0225E688 ; =0x00002328
	mov r1, #3
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r2, r6, #0
	add r3, r5, #0
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0225E68C ; =0x0000232B
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x1d
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E68C ; =0x0000232B
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x1c
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E68C ; =0x0000232B
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x1b
	bl sub_0200D71C
	str r4, [sp]
	mov r0, #0x1e
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0225E68C ; =0x0000232B
	mov r1, #2
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r2, r6, #0
	add r3, r5, #0
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0225E690 ; =0x0000232C
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0xd
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E690 ; =0x0000232C
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0xc
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E690 ; =0x0000232C
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0xb
	bl sub_0200D71C
	str r4, [sp]
	mov r0, #0xe
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0225E690 ; =0x0000232C
	mov r1, #2
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r2, r6, #0
	add r3, r5, #0
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0225E694 ; =0x0000232D
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x15
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E694 ; =0x0000232D
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x14
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E694 ; =0x0000232D
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x13
	bl sub_0200D71C
	str r4, [sp]
	mov r0, #0x16
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0225E694 ; =0x0000232D
	mov r1, #2
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r2, r6, #0
	add r3, r5, #0
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0225E698 ; =0x0000232E
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x11
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E698 ; =0x0000232E
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x10
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E698 ; =0x0000232E
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0xf
	bl sub_0200D71C
	str r4, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0225E698 ; =0x0000232E
	mov r1, #2
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r2, r6, #0
	add r3, r5, #0
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0225E69C ; =0x0000232A
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x19
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E69C ; =0x0000232A
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x18
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E69C ; =0x0000232A
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x17
	bl sub_0200D71C
	str r4, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, _0225E69C ; =0x0000232A
	mov r1, #2
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r2, r6, #0
	add r3, r5, #0
	bl sub_0200D68C
	mov r0, #0xc8
	mov r1, #0x71
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0225E6A0 ; =0x0000232F
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x15
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E6A0 ; =0x0000232F
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x16
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E6A0 ; =0x0000232F
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x17
	bl sub_0200D71C
	str r4, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r1, #2
	str r1, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, _0225E6A0 ; =0x0000232F
	add r2, r6, #0
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r3, r5, #0
	bl sub_0200D68C
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E688: .word 0x00002328
_0225E68C: .word 0x0000232B
_0225E690: .word 0x0000232C
_0225E694: .word 0x0000232D
_0225E698: .word 0x0000232E
_0225E69C: .word 0x0000232A
_0225E6A0: .word 0x0000232F
	thumb_func_end ov92_0225E3C4

	thumb_func_start ov92_0225E6A4
ov92_0225E6A4: ; 0x0225E6A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	add r6, r1, #0
	ldr r1, [r6, #0x14]
	str r0, [sp, #8]
	ldr r0, [r1, #8]
	mov r4, #0
	str r0, [sp, #0x18]
	ldr r0, [r1, #0xc]
	str r4, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [r6, #4]
	cmp r0, #0
	bgt _0225E6C2
	b _0225E7D8
_0225E6C2:
	str r6, [sp, #0xc]
	add r7, r4, #0
	add r5, r6, #0
_0225E6C8:
	ldr r1, [sp, #0xc]
	mov r0, #0xff
	add r1, #0xf4
	strh r0, [r1]
	ldr r0, [r6]
	cmp r4, r0
	beq _0225E7C8
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r1, #0xf4
	strh r0, [r1]
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E7DC ; =0x00002328
	mov r2, #6
	str r0, [sp, #4]
	ldr r1, [r6, #4]
	add r0, sp, #0x1c
	mul r2, r1
	ldr r1, _0225E7E0 ; =ov92_02263B74
	mov r3, #2
	add r1, r1, r2
	add r2, r7, r1
	mov r1, #5
	mvn r1, r1
	ldrsh r1, [r2, r1]
	mov r2, #0xf0
	bl ov92_0225DDD8
	mov r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x1c
	bl sub_0200D734
	str r0, [r5, #0x1c]
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E7DC ; =0x00002328
	mov r2, #6
	str r0, [sp, #4]
	ldr r1, [r6, #4]
	add r0, sp, #0x1c
	mul r2, r1
	ldr r1, _0225E7E0 ; =ov92_02263B74
	mov r3, #2
	add r1, r1, r2
	add r2, r7, r1
	mov r1, #5
	mvn r1, r1
	ldrsh r1, [r2, r1]
	mov r2, #0xf0
	bl ov92_0225DDD8
	mov r0, #2
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x1c
	bl sub_0200D734
	str r0, [r5, #0x28]
	ldr r0, [sp, #8]
	add r1, r4, #0
	bl ov92_0226077C
	add r1, r0, #0
	ldr r0, [r5, #0x28]
	bl sub_0200DD24
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E7DC ; =0x00002328
	mov r2, #6
	str r0, [sp, #4]
	ldr r1, [r6, #4]
	add r0, sp, #0x1c
	mul r2, r1
	ldr r1, _0225E7E0 ; =ov92_02263B74
	mov r3, #2
	add r1, r1, r2
	add r2, r7, r1
	mov r1, #5
	mvn r1, r1
	ldrsh r1, [r2, r1]
	mov r2, #0xf0
	bl ov92_0225DDD8
	mov r0, #3
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x1c
	bl sub_0200D734
	str r0, [r5, #0x34]
	ldr r0, [sp, #8]
	add r1, r4, #0
	bl ov92_0226077C
	add r1, r0, #0
	ldr r0, [r5, #0x34]
	bl sub_0200DD24
	ldr r0, [r5, #0x34]
	mov r1, #5
	bl sub_0200DC4C
	ldr r0, [r5, #0x1c]
	bl sub_0200DC24
	ldr r0, [r5, #0x28]
	bl sub_0200DC24
	ldr r0, [r5, #0x34]
	bl sub_0200DC24
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0
	bl ov92_0225DF58
	ldr r0, [sp, #0x10]
	add r7, r7, #2
	add r0, r0, #1
	add r5, r5, #4
	str r0, [sp, #0x10]
_0225E7C8:
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	add r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [r6, #4]
	cmp r4, r0
	bge _0225E7D8
	b _0225E6C8
_0225E7D8:
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E7DC: .word 0x00002328
_0225E7E0: .word ov92_02263B74
	thumb_func_end ov92_0225E6A4

	thumb_func_start ov92_0225E7E4
ov92_0225E7E4: ; 0x0225E7E4
	push {r4, r5, lr}
	sub sp, #0x3c
	ldr r0, [r0, #0x14]
	mov r3, #1
	ldr r4, [r0, #8]
	ldr r5, [r0, #0xc]
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E81C ; =0x0000232B
	str r0, [sp, #4]
	add r0, sp, #8
	bl ov92_0225DDD8
	mov r0, #0
	str r0, [sp, #0x34]
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r1, r5, #0
	add r2, sp, #8
	bl sub_0200D734
	add r4, r0, #0
	bl sub_0200DC24
	add r0, r4, #0
	add sp, #0x3c
	pop {r4, r5, pc}
	nop
_0225E81C: .word 0x0000232B
	thumb_func_end ov92_0225E7E4

	thumb_func_start ov92_0225E820
ov92_0225E820: ; 0x0225E820
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	add r7, sp, #0xc
	ldr r6, [r0, #8]
	ldr r4, [r0, #0xc]
	mov r0, #0
	str r0, [sp, #8]
_0225E832:
	mov r0, #4
	str r0, [sp]
	ldr r0, _0225E910 ; =0x0000232A
	mov r1, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r2, r1, #0
	mov r3, #1
	bl ov92_0225DDD8
	mov r0, #2
	str r0, [sp, #0x38]
	mov r0, #0x14
	str r0, [sp, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_0200D734
	add r1, r5, #0
	add r1, #0xe8
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DC4C
	add r0, r5, #0
	add r0, #0xe8
	ldr r0, [r0]
	bl sub_0200DC18
	add r0, r5, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #4
	bl sub_0200DD24
	add r0, r5, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200E0FC
	add r0, r5, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225E914 ; =0x00002328
	mov r1, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r2, r1, #0
	mov r3, #2
	bl ov92_0225DDD8
	mov r0, #2
	str r0, [sp, #0x38]
	mov r0, #0x14
	str r0, [sp, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_0200D734
	add r1, r5, #0
	add r1, #0xe0
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xe0
	ldr r0, [r0]
	mov r1, #6
	bl sub_0200DC4C
	add r0, r5, #0
	add r0, #0xe0
	ldr r0, [r0]
	bl sub_0200DC18
	add r0, r5, #0
	add r0, #0xe0
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DD24
	add r0, r5, #0
	add r0, #0xe0
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200E0FC
	add r0, r5, #0
	add r0, #0xe0
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [sp, #8]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #2
	blt _0225E832
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E910: .word 0x0000232A
_0225E914: .word 0x00002328
	thumb_func_end ov92_0225E820

	thumb_func_start ov92_0225E918
ov92_0225E918: ; 0x0225E918
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0225E91E:
	add r0, r5, #0
	add r0, #0xe8
	ldr r0, [r0]
	bl sub_0200D9DC
	add r0, r5, #0
	add r0, #0xe0
	ldr r0, [r0]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0225E91E
	pop {r3, r4, r5, pc}
	thumb_func_end ov92_0225E918

	thumb_func_start ov92_0225E93C
ov92_0225E93C: ; 0x0225E93C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x3c
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	mov r1, #0x80
	ldr r6, [r0, #8]
	ldr r4, [r0, #0xc]
	mov r0, #7
	str r0, [sp]
	ldr r0, _0225E9A4 ; =0x0000232F
	add r2, r1, #0
	str r0, [sp, #4]
	add r0, sp, #8
	mov r3, #1
	bl ov92_0225DDD8
	mov r0, #0
	str r0, [sp, #0x34]
	str r0, [sp, #0x10]
	add r0, r6, #0
	add r1, r4, #0
	add r2, sp, #8
	bl sub_0200D734
	add r1, r5, #0
	add r1, #0xf0
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xf0
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DC4C
	add r0, r5, #0
	add r0, #0xf0
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DCE8
	add r0, r5, #0
	add r0, #0xf0
	ldr r0, [r0]
	bl sub_0200DC18
	add r5, #0xf0
	ldr r0, [r5]
	mov r1, #7
	bl sub_0200DD24
	add sp, #0x3c
	pop {r3, r4, r5, r6, pc}
	nop
_0225E9A4: .word 0x0000232F
	thumb_func_end ov92_0225E93C

	thumb_func_start ov92_0225E9A8
ov92_0225E9A8: ; 0x0225E9A8
	ldr r3, _0225E9B0 ; =sub_0200D9DC
	add r0, #0xf0
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_0225E9B0: .word sub_0200D9DC
	thumb_func_end ov92_0225E9A8

	thumb_func_start ov92_0225E9B4
ov92_0225E9B4: ; 0x0225E9B4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, [r0, #0x58]
	ldr r4, [r0, #0x48]
	ldr r6, [r0, #0x5c]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x48
	add r2, r5, #0
	mov r3, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x4b
	add r2, r5, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x4a
	add r2, r5, #0
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x4c
	add r2, r5, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x4d
	add r2, r5, #0
	mov r3, #6
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x4e
	add r2, r5, #0
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0xa0
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r6, #0
	mov r1, #0xc1
	mov r2, #0x49
	mov r3, #0x71
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #5
	add r2, r5, #0
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #8
	add r2, r5, #0
	mov r3, #1
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #7
	add r2, r5, #0
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #9
	add r2, r5, #0
	mov r3, #1
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x71
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0xa
	add r2, r5, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r6, #0
	mov r1, #0xc1
	mov r2, #6
	mov r3, #0x71
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	add r0, r6, #0
	mov r1, #0x10
	mov r2, #8
	mov r3, #0x71
	bl PaletteData_LoadNarc
	bl sub_0200E3D8
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xd0
	str r0, [sp, #8]
	add r0, r6, #0
	mov r1, #0x26
	mov r3, #0x71
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x71
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #7
	mov r2, #0xb4
	mov r3, #0xd
	bl LoadUserFrameGfx1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov92_0225E9B4

	thumb_func_start ov92_0225EB40
ov92_0225EB40: ; 0x0225EB40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x71
	mov r1, #0x10
	bl AllocFromHeap
	add r3, r0, #0
	mov r2, #0x10
	mov r1, #0
_0225EB54:
	strb r1, [r3]
	add r3, r3, #1
	sub r2, r2, #1
	bne _0225EB54
	mov r1, #0x4b
	str r5, [r0, #4]
	lsl r1, r1, #4
	strh r1, [r0, #8]
	str r4, [r0, #0xc]
	pop {r3, r4, r5, pc}
	thumb_func_end ov92_0225EB40

	thumb_func_start ov92_0225EB68
ov92_0225EB68: ; 0x0225EB68
	ldr r3, _0225EB6C ; =FreeToHeap
	bx r3
	.balign 4, 0
_0225EB6C: .word FreeToHeap
	thumb_func_end ov92_0225EB68

	thumb_func_start ov92_0225EB70
ov92_0225EB70: ; 0x0225EB70
	mov r1, #8
	ldrsh r2, [r0, r1]
	sub r2, r2, #1
	strh r2, [r0, #8]
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _0225EB82
	mov r0, #1
	bx lr
_0225EB82:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov92_0225EB70

	thumb_func_start ov92_0225EB88
ov92_0225EB88: ; 0x0225EB88
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	ldr r1, _0225EBD4 ; =0x00002BBC
	mov r0, #0x71
	add r7, r2, #0
	bl AllocFromHeap
	ldr r2, _0225EBD4 ; =0x00002BBC
	add r4, r0, #0
	mov r1, #0
	bl memset
	str r5, [r4, #4]
	ldr r3, _0225EBD8 ; =0x00002BB8
	str r6, [r4]
	mov r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	str r7, [r4, #0x14]
	add r1, r3, #0
	str r0, [r4, r3]
	sub r1, #0xcc
	ldr r2, [r4, r1]
	ldr r1, _0225EBDC ; =0x00002228
	str r2, [r4, r1]
	add r2, r3, #0
	sub r2, #0xcc
	add r2, r4, r2
	add r1, r1, #4
	str r2, [r4, r1]
	sub r3, #0x24
	str r0, [r4, r3]
	add r0, r4, #0
	bl ov92_0225EBE0
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225EBD4: .word 0x00002BBC
_0225EBD8: .word 0x00002BB8
_0225EBDC: .word 0x00002228
	thumb_func_end ov92_0225EB88

	thumb_func_start ov92_0225EBE0
ov92_0225EBE0: ; 0x0225EBE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r2, _0225ED44 ; =0x00001FC8
	add r7, r0, #0
	mov r0, #0
	mov r3, #0x19
	str r0, [r7, r2]
	add r1, r2, #4
	lsl r3, r3, #0xe
	str r3, [r7, r1]
	add r2, #8
	mov r3, #0x31
	ldr r1, _0225ED48 ; =0x0000051C
	str r0, [r7, r2]
	str r0, [r7, r1]
	add r2, r1, #4
	str r0, [r7, r2]
	lsl r3, r3, #4
	str r0, [r7, r3]
	add r2, r3, #4
	str r0, [r7, r2]
	sub r1, r1, #4
	str r0, [r7, r1]
	sub r1, r3, #4
	sub r3, #0x6c
	str r0, [r7, r1]
	add r0, r7, r3
	bl ov92_022630E8
	mov r0, #0xad
	lsl r0, r0, #2
	add r0, r7, r0
	bl ov92_022630E8
	mov r0, #0x4b
	lsl r0, r0, #4
	add r0, r7, r0
	bl ov92_022630E8
	mov r0, #0x13
	lsl r0, r0, #6
	add r0, r7, r0
	bl ov92_022630E8
	ldr r0, _0225ED4C ; =0x00000AD4
	add r0, r7, r0
	bl ov92_022630E8
	ldr r0, _0225ED50 ; =0x00000AE4
	add r0, r7, r0
	bl ov92_022630E8
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0xce
	lsl r0, r0, #4
	add r6, r7, r0
	add r0, #0x10
	add r4, r7, r0
	mov r0, #0xb5
	lsl r0, r0, #4
	add r5, r7, r0
_0225EC5C:
	add r0, r6, #0
	bl ov92_022630E8
	add r0, r4, #0
	bl ov92_022630E8
	mov r0, #5
	str r0, [sp]
	ldr r0, _0225ED54 ; =0x3F4CCCCD
	mov r1, #0
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #5
	bl ov92_02260428
	mov r1, #0
	mov r0, #4
	mvn r0, r0
	str r0, [sp]
	ldr r0, _0225ED54 ; =0x3F4CCCCD
	add r2, r1, #0
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	sub r3, r1, #5
	bl ov92_02260428
	mov r0, #0x83
	lsl r0, r0, #2
	add r6, r6, r0
	add r4, r4, r0
	add r5, r5, r0
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #8
	blt _0225EC5C
	mov r3, #5
	ldr r0, _0225ED58 ; =0x3FF0A3D7
	str r3, [sp]
	str r0, [sp, #4]
	mov r1, #0
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r7, r0
	add r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	mov r3, #4
	mvn r3, r3
	mov r1, #0
	ldr r0, _0225ED58 ; =0x3FF0A3D7
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r7, r0
	add r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	mov r3, #5
	mov r1, #0
	ldr r0, _0225ED54 ; =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r7, r0
	add r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	mov r3, #4
	mvn r3, r3
	mov r1, #0
	ldr r0, _0225ED54 ; =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r7, r0
	add r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	mov r3, #5
	mov r1, #0
	ldr r0, _0225ED58 ; =0x3FF0A3D7
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0225ED5C ; =0x00000944
	add r2, r1, #0
	add r0, r7, r0
	str r1, [sp, #8]
	bl ov92_02260428
	mov r3, #4
	mvn r3, r3
	mov r1, #0
	ldr r0, _0225ED54 ; =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0225ED5C ; =0x00000944
	add r2, r1, #0
	add r0, r7, r0
	str r1, [sp, #8]
	bl ov92_02260428
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225ED44: .word 0x00001FC8
_0225ED48: .word 0x0000051C
_0225ED4C: .word 0x00000AD4
_0225ED50: .word 0x00000AE4
_0225ED54: .word 0x3F4CCCCD
_0225ED58: .word 0x3FF0A3D7
_0225ED5C: .word 0x00000944
	thumb_func_end ov92_0225EBE0

	thumb_func_start ov92_0225ED60
ov92_0225ED60: ; 0x0225ED60
	ldr r3, _0225ED64 ; =FreeToHeap
	bx r3
	.balign 4, 0
_0225ED64: .word FreeToHeap
	thumb_func_end ov92_0225ED60

	thumb_func_start ov92_0225ED68
ov92_0225ED68: ; 0x0225ED68
	ldr r1, _0225ED7C ; =0x00001FCC
	ldr r0, [r0, r1]
	asr r0, r0, #0xc
	cmp r0, #0x2d
	bgt _0225ED76
	mov r0, #1
	bx lr
_0225ED76:
	mov r0, #0
	bx lr
	nop
_0225ED7C: .word 0x00001FCC
	thumb_func_end ov92_0225ED68

	thumb_func_start ov92_0225ED80
ov92_0225ED80: ; 0x0225ED80
	push {r3, lr}
	ldr r1, _0225EDB0 ; =0x00001FCC
	ldr r1, [r0, r1]
	asr r1, r1, #0xc
	cmp r1, #0x4b
	bge _0225ED98
	cmp r1, #0x3d
	ble _0225ED98
	mov r1, #1
	bl ov92_0225DD48
	pop {r3, pc}
_0225ED98:
	cmp r1, #0x3c
	bge _0225EDA8
	cmp r1, #0x2e
	ble _0225EDA8
	mov r1, #2
	bl ov92_0225DD48
	pop {r3, pc}
_0225EDA8:
	mov r1, #0
	bl ov92_0225DD48
	pop {r3, pc}
	.balign 4, 0
_0225EDB0: .word 0x00001FCC
	thumb_func_end ov92_0225ED80

	thumb_func_start ov92_0225EDB4
ov92_0225EDB4: ; 0x0225EDB4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x71
	mov r1, #0x30
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x30
	add r4, r0, #0
	bl memset
	add r1, r5, #0
	add r1, #0xf4
	lsl r0, r6, #1
	ldrh r2, [r1, r0]
	lsl r2, r2, #2
	add r2, r5, r2
	ldr r2, [r2, #0x1c]
	str r2, [r4, #0xc]
	ldrh r0, [r1, r0]
	mov r2, #1
	add r1, r4, #0
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x28]
	lsl r2, r2, #0xc
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	ldr r0, [r5, #0x14]
	str r0, [r4, #0x2c]
	ldr r0, _0225EE00 ; =ov92_0225F254
	bl CreateSysTask
	pop {r4, r5, r6, pc}
	nop
_0225EE00: .word ov92_0225F254
	thumb_func_end ov92_0225EDB4

	thumb_func_start ov92_0225EE04
ov92_0225EE04: ; 0x0225EE04
	push {r3, r4, r5, lr}
	ldr r2, _0225EE54 ; =0x000029D0
	add r3, r0, r2
	mov r2, #0x44
	mul r2, r1
	add r3, r3, r2
	ldr r2, [r3, #0x30]
	cmp r2, #1
	beq _0225EE52
	ldr r4, _0225EE58 ; =0x00002BB4
	ldr r2, [r0, r4]
	sub r4, #0xac
	str r2, [r3, #0x40]
	mov r2, #1
	add r5, r0, r4
	lsl r4, r1, #2
	str r2, [r3, #0x30]
	add r4, r5, r4
	str r4, [r3, #0x2c]
	ldr r4, [r4]
	lsl r1, r1, #1
	add r1, r0, r1
	str r4, [r3, #0x28]
	add r1, #0xf4
	ldrh r1, [r1]
	lsl r2, r2, #0xc
	lsl r1, r1, #2
	add r1, r0, r1
	ldr r1, [r1, #0x34]
	str r1, [r3, #0xc]
	mov r1, #0
	str r1, [r3]
	str r1, [r3, #4]
	ldr r0, [r0, #0x14]
	add r1, r3, #0
	str r0, [r3, #0x3c]
	ldr r0, _0225EE5C ; =ov92_0225F338
	bl CreateSysTask
_0225EE52:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225EE54: .word 0x000029D0
_0225EE58: .word 0x00002BB4
_0225EE5C: .word ov92_0225F338
	thumb_func_end ov92_0225EE04

	thumb_func_start ov92_0225EE60
ov92_0225EE60: ; 0x0225EE60
	push {r3, lr}
	ldr r2, _0225EEA8 ; =0x000029D0
	add r3, r0, r2
	mov r2, #0x44
	mul r2, r1
	add r1, r3, r2
	ldr r2, [r1, #0x30]
	cmp r2, #1
	beq _0225EEA4
	ldr r3, _0225EEAC ; =0x00002BB4
	ldr r2, [r0, r3]
	sub r3, #0xc8
	str r2, [r1, #0x40]
	mov r2, #1
	str r2, [r1, #0x30]
	add r3, r0, r3
	str r3, [r1, #0x2c]
	ldr r3, [r3]
	lsl r2, r2, #0xc
	str r3, [r1, #0x28]
	ldr r3, _0225EEB0 ; =0x00001BB0
	add r3, r0, r3
	str r3, [r1, #0x34]
	ldr r3, _0225EEB4 ; =0x00001DBC
	add r3, r0, r3
	str r3, [r1, #0x38]
	mov r3, #0
	str r3, [r1]
	str r3, [r1, #4]
	ldr r0, [r0, #0x14]
	str r0, [r1, #0x3c]
	ldr r0, _0225EEB8 ; =ov92_0225F530
	bl CreateSysTask
_0225EEA4:
	pop {r3, pc}
	nop
_0225EEA8: .word 0x000029D0
_0225EEAC: .word 0x00002BB4
_0225EEB0: .word 0x00001BB0
_0225EEB4: .word 0x00001DBC
_0225EEB8: .word ov92_0225F530
	thumb_func_end ov92_0225EE60

	thumb_func_start ov92_0225EEBC
ov92_0225EEBC: ; 0x0225EEBC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x71
	mov r1, #0x7c
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x7c
	add r4, r0, #0
	bl memset
	mov r0, #0x11
	lsl r0, r0, #4
	add r1, r5, r0
	str r1, [r4, #0xc]
	mov r1, #0x32
	lsl r1, r1, #4
	add r1, r5, r1
	add r0, r0, #4
	add r2, r4, #0
	str r1, [r4, #0x10]
	add r0, r5, r0
	str r0, [r4, #0x14]
	ldr r0, _0225EF3C ; =0x00001FC8
	add r2, #0x20
	add r3, r5, r0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #0
	str r0, [r2]
	ldr r0, _0225EF40 ; =0x00002BB4
	ldr r0, [r5, r0]
	str r0, [r4, #0x74]
	ldr r0, [r5, #0x14]
	str r0, [r4, #0x78]
	add r0, r5, #0
	bl ov92_0225DD48
	mov r0, #0xea
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl sub_02018198
	ldr r0, _0225EF44 ; =0x000005B4
	mov r1, #0
	add r0, r5, r0
	bl sub_02018198
	mov r0, #0x1f
	lsl r0, r0, #6
	add r0, r5, r0
	mov r1, #0
	bl sub_02018198
	mov r2, #1
	ldr r0, _0225EF48 ; =ov92_0225EF4C
	add r1, r4, #0
	lsl r2, r2, #0xc
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	nop
_0225EF3C: .word 0x00001FC8
_0225EF40: .word 0x00002BB4
_0225EF44: .word 0x000005B4
_0225EF48: .word ov92_0225EF4C
	thumb_func_end ov92_0225EEBC

	thumb_func_start ov92_0225EF4C
ov92_0225EF4C: ; 0x0225EF4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4, #0x28]
	lsl r0, r0, #4
	asr r5, r0, #0x10
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225EF6C
	ldr r0, [r4, #0x78]
	add r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225EF7C
_0225EF6C:
	add r0, r6, #0
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0225EF7C:
	ldr r0, [r4]
	cmp r0, #3
	bls _0225EF84
	b _0225F1DE
_0225EF84:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225EF90: ; jump table
	.short _0225EF98 - _0225EF90 - 2 ; case 0
	.short _0225F04A - _0225EF90 - 2 ; case 1
	.short _0225F166 - _0225EF90 - 2 ; case 2
	.short _0225F1AA - _0225EF90 - 2 ; case 3
_0225EF98:
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x10]
	cmp r0, #0
	bne _0225EFEC
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r2, #3
	add r0, r4, #0
	lsl r2, r2, #0xe
	add r0, #0x44
	add r2, r1, r2
	mov r3, #4
	bl ov92_02260860
	cmp r5, #0
	ldr r1, [r4, #0x10]
	ble _0225EFD4
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r2, #1
	add r0, r4, #0
	lsl r2, r2, #0x10
	add r0, #0x5c
	add r2, r1, r2
	mov r3, #4
	bl ov92_02260860
	b _0225F036
_0225EFD4:
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r2, #1
	add r0, r4, #0
	lsl r2, r2, #0x10
	add r0, #0x5c
	sub r2, r1, r2
	mov r3, #4
	bl ov92_02260860
	b _0225F036
_0225EFEC:
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r2, #3
	add r0, r4, #0
	lsl r2, r2, #0x10
	add r0, #0x44
	add r2, r1, r2
	mov r3, #8
	bl ov92_02260860
	cmp r5, #0
	ldr r1, [r4, #0x10]
	ble _0225F020
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r2, #1
	add r0, r4, #0
	lsl r2, r2, #0x10
	add r0, #0x5c
	sub r2, r1, r2
	mov r3, #8
	bl ov92_02260860
	b _0225F036
_0225F020:
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r2, #1
	add r0, r4, #0
	lsl r2, r2, #0x10
	add r0, #0x5c
	add r2, r1, r2
	mov r3, #4
	bl ov92_02260860
_0225F036:
	ldr r0, _0225F240 ; =0x0000060A
	bl PlaySE
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F04A:
	add r0, r4, #0
	add r0, #0x44
	bl ov92_02260870
	add r7, r0, #0
	add r0, r4, #0
	add r0, #0x5c
	bl ov92_02260870
	add r6, r0, #0
	mov r0, #0x79
	ldr r2, [r4, #0x44]
	ldr r1, [r4, #0x10]
	lsl r0, r0, #2
	str r2, [r1, r0]
	add r1, r0, #4
	ldr r3, [r4, #0x5c]
	ldr r2, [r4, #0x10]
	cmp r7, #0
	str r3, [r2, r1]
	beq _0225F078
	cmp r6, #0
	bne _0225F07A
_0225F078:
	b _0225F23A
_0225F07A:
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _0225F114
	ldr r1, [r4, #0xc]
	mov r2, #1
	str r2, [r1]
	ldr r1, [r4, #0x10]
	sub r0, #0x54
	add r0, r1, r0
	bl ov92_022630E8
	mov r0, #0x1a
	ldr r1, [r4, #0x10]
	lsl r0, r0, #4
	add r0, r1, r0
	bl ov92_022630E8
	mov r3, #5
	mov r1, #0
	ldr r0, _0225F244 ; =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	bl ov92_02260428
	mov r3, #4
	mvn r3, r3
	mov r1, #0
	ldr r0, _0225F244 ; =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	bl ov92_02260428
	mov r0, #0x79
	mov r2, #3
	ldr r1, [r4, #0x10]
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	add r0, r4, #0
	lsl r2, r2, #0x10
	add r0, #0x44
	sub r2, r1, r2
	mov r3, #8
	bl ov92_02260860
	cmp r5, #0
	ldr r1, [r4, #0x10]
	ble _0225F0FC
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r2, #1
	add r0, r4, #0
	lsl r2, r2, #0x10
	add r0, #0x5c
	add r2, r1, r2
	mov r3, #8
	bl ov92_02260860
	b _0225F15C
_0225F0FC:
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r2, #1
	add r0, r4, #0
	lsl r2, r2, #0x10
	add r0, #0x5c
	sub r2, r1, r2
	mov r3, #8
	bl ov92_02260860
	b _0225F15C
_0225F114:
	ldr r1, [r4, #0x10]
	mov r2, #3
	ldr r1, [r1, r0]
	add r0, r4, #0
	lsl r2, r2, #0xe
	add r0, #0x44
	sub r2, r1, r2
	mov r3, #4
	bl ov92_02260860
	cmp r5, #0
	ldr r1, [r4, #0x10]
	ble _0225F146
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r2, #1
	add r0, r4, #0
	lsl r2, r2, #0x10
	add r0, #0x5c
	sub r2, r1, r2
	mov r3, #4
	bl ov92_02260860
	b _0225F15C
_0225F146:
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r2, #1
	add r0, r4, #0
	lsl r2, r2, #0x10
	add r0, #0x5c
	add r2, r1, r2
	mov r3, #4
	bl ov92_02260860
_0225F15C:
	ldr r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F166:
	add r0, r4, #0
	add r0, #0x44
	bl ov92_02260870
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x5c
	bl ov92_02260870
	mov r1, #0x79
	ldr r3, [r4, #0x44]
	ldr r2, [r4, #0x10]
	lsl r1, r1, #2
	str r3, [r2, r1]
	add r1, r1, #4
	ldr r3, [r4, #0x5c]
	ldr r2, [r4, #0x10]
	cmp r5, #0
	str r3, [r2, r1]
	beq _0225F23A
	cmp r0, #0
	beq _0225F23A
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0225F1A0
	mov r0, #0x63
	lsl r0, r0, #4
	bl PlaySE
_0225F1A0:
	ldr r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F1AA:
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _0225F1D6
	ldr r0, [r4, #8]
	cmp r0, #8
	bne _0225F1BC
	ldr r0, _0225F248 ; =0x0000058D
	bl PlaySE
_0225F1BC:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x28
	blt _0225F23A
	ldr r0, [r4, #0xc]
	mov r1, #2
	str r1, [r0]
	ldr r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F1D6:
	add r0, r0, #1
	add sp, #0xc
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F1DE:
	ldr r0, [r4, #4]
	cmp r0, #0
	ldr r0, [r4, #8]
	bne _0225F208
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x2d
	blt _0225F23A
	ldr r0, [r4, #0xc]
	mov r1, #0
	str r1, [r0]
	ldr r0, _0225F240 ; =0x0000060A
	bl PlaySE
	mov r0, #0
	str r0, [r4]
	ldr r0, [r4, #4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, r6, r7, pc}
_0225F208:
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0xa
	blt _0225F23A
	ldr r0, [r4, #0x74]
	cmp r0, #0
	beq _0225F21A
	ldr r2, _0225F24C ; =0xFFFF8000
	b _0225F21C
_0225F21A:
	ldr r2, _0225F250 ; =0xFFFEC000
_0225F21C:
	mov r0, #0x79
	ldr r1, [r4, #0x10]
	lsl r0, r0, #2
	str r2, [r1, r0]
	mov r0, #0x7a
	ldr r1, [r4, #0x10]
	mov r2, #0
	lsl r0, r0, #2
	str r2, [r1, r0]
	add r0, r6, #0
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
_0225F23A:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225F240: .word 0x0000060A
_0225F244: .word 0x3F4CCCCD
_0225F248: .word 0x0000058D
_0225F24C: .word 0xFFFF8000
_0225F250: .word 0xFFFEC000
	thumb_func_end ov92_0225EF4C

	thumb_func_start ov92_0225F254
ov92_0225F254: ; 0x0225F254
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0200DCD4
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225F274
	ldr r0, [r4, #0x2c]
	add r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225F284
_0225F274:
	add r0, r5, #0
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0225F284:
	ldr r0, [r4]
	cmp r0, #0
	beq _0225F290
	cmp r0, #1
	beq _0225F2D4
	b _0225F300
_0225F290:
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	add r1, sp, #0xc
	add r2, sp, #8
	bl sub_0200DF2C
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0225F2B8
	mov r2, #2
	add r0, r4, #0
	ldr r1, [sp, #8]
	lsl r2, r2, #0x10
	add r0, #0x14
	add r2, r1, r2
	mov r3, #0x10
	bl ov92_02260860
	b _0225F2CA
_0225F2B8:
	mov r2, #2
	add r0, r4, #0
	ldr r1, [sp, #8]
	lsl r2, r2, #0x10
	add r0, #0x14
	sub r2, r1, r2
	mov r3, #4
	bl ov92_02260860
_0225F2CA:
	ldr r0, [r4]
	add sp, #0x10
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225F2D4:
	add r0, r4, #0
	add r0, #0x14
	bl ov92_02260870
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	add r1, sp, #4
	add r2, sp, #0
	bl sub_0200DF2C
	ldr r0, [r4, #0xc]
	ldr r1, [sp, #4]
	ldr r2, [r4, #0x14]
	bl sub_0200DF08
	cmp r5, #0
	beq _0225F332
	ldr r0, [r4]
	add sp, #0x10
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225F300:
	ldr r0, [r4, #4]
	cmp r0, #0
	ldr r0, [r4, #8]
	bne _0225F31E
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x23
	blt _0225F332
	ldr r0, [r4, #4]
	add sp, #0x10
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225F31E:
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0xa
	blt _0225F332
	add r0, r5, #0
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
_0225F332:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov92_0225F254

	thumb_func_start ov92_0225F338
ov92_0225F338: ; 0x0225F338
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225F352
	ldr r0, [r4, #0x3c]
	add r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225F360
_0225F352:
	mov r0, #0
	str r0, [r4, #0x30]
	add r0, r5, #0
	bl DestroySysTask
	add sp, #8
	pop {r3, r4, r5, pc}
_0225F360:
	ldr r0, [r4]
	cmp r0, #5
	bls _0225F368
	b _0225F4F2
_0225F368:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225F374: ; jump table
	.short _0225F380 - _0225F374 - 2 ; case 0
	.short _0225F3F4 - _0225F374 - 2 ; case 1
	.short _0225F426 - _0225F374 - 2 ; case 2
	.short _0225F43C - _0225F374 - 2 ; case 3
	.short _0225F46C - _0225F374 - 2 ; case 4
	.short _0225F4BC - _0225F374 - 2 ; case 5
_0225F380:
	ldr r0, [r4, #0xc]
	mov r1, #7
	bl sub_0200DC4C
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl sub_0200DD68
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r4, #0xc]
	add r1, sp, #4
	add r2, sp, #0
	bl sub_0200E060
	ldr r0, [sp]
	mov r1, #0
	bl _fgr
	ldr r0, _0225F524 ; =0x45800000
	bls _0225F3C0
	ldr r1, [sp]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225F3CE
_0225F3C0:
	ldr r1, [sp]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225F3CE:
	bl _ffix
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #2
	add r0, #0x10
	lsl r2, r2, #0xc
	mov r3, #2
	bl ov92_02260860
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0xc]
	ldr r1, [r1]
	sub r1, r1, #1
	bl sub_0200DD24
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0225F3F4:
	add r0, r4, #0
	add r0, #0x10
	bl ov92_02260870
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	bl _fflt
	ldr r1, _0225F524 ; =0x45800000
	bl _fdiv
	add r2, r0, #0
	mov r1, #0xfe
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x16
	bl sub_0200E024
	cmp r5, #0
	bne _0225F41C
	b _0225F520
_0225F41C:
	ldr r0, [r4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225F426:
	add r0, r4, #0
	mov r1, #2
	ldr r2, _0225F528 ; =0x00000666
	add r0, #0x10
	lsl r1, r1, #0xc
	mov r3, #4
	bl ov92_02260860
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0225F43C:
	add r0, r4, #0
	add r0, #0x10
	bl ov92_02260870
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	bl _fflt
	ldr r1, _0225F524 ; =0x45800000
	bl _fdiv
	add r2, r0, #0
	mov r1, #0xfe
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x16
	bl sub_0200E024
	cmp r5, #0
	beq _0225F520
	ldr r0, [r4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225F46C:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x28]
	ldr r0, [r0]
	cmp r1, r0
	beq _0225F47C
	mov r0, #0
	str r0, [r4]
	b _0225F4A6
_0225F47C:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0225F492
	add r0, r4, #0
	ldr r1, _0225F528 ; =0x00000666
	ldr r2, _0225F52C ; =0x00000CCD
	add r0, #0x10
	mov r3, #2
	bl ov92_02260860
	b _0225F4A0
_0225F492:
	ldr r1, _0225F52C ; =0x00000CCD
	add r0, r4, #0
	add r0, #0x10
	lsr r2, r1, #1
	mov r3, #4
	bl ov92_02260860
_0225F4A0:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0225F4A6:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	cmp r0, #0
	bne _0225F520
	mov r0, #0xff
	add sp, #8
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225F4BC:
	add r0, r4, #0
	add r0, #0x10
	bl ov92_02260870
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	bl _fflt
	ldr r1, _0225F524 ; =0x45800000
	bl _fdiv
	add r2, r0, #0
	mov r1, #0xfe
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x16
	bl sub_0200E024
	cmp r5, #0
	beq _0225F520
	mov r0, #4
	str r0, [r4]
	ldr r1, [r4, #4]
	mov r0, #1
	eor r0, r1
	add sp, #8
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0225F4F2:
	mov r1, #0xfe
	lsl r1, r1, #0x16
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl sub_0200E024
	ldr r0, [r4, #0xc]
	mov r1, #5
	bl sub_0200DC4C
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl sub_0200DD68
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl sub_0200DF98
	mov r0, #0
	str r0, [r4, #0x30]
	add r0, r5, #0
	bl DestroySysTask
_0225F520:
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225F524: .word 0x45800000
_0225F528: .word 0x00000666
_0225F52C: .word 0x00000CCD
	thumb_func_end ov92_0225F338

	thumb_func_start ov92_0225F530
ov92_0225F530: ; 0x0225F530
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r7, r0, #0
	ldr r6, [r4, #0x34]
	ldr r5, [r4, #0x38]
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225F550
	ldr r2, [r4, #0x3c]
	add r0, r2, #0
	add r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225F59A
_0225F550:
	add r0, r6, #0
	bl ov92_0225DA2C
	add r0, r5, #0
	bl ov92_0225DA2C
	ldr r1, [r4, #0x3c]
	add r0, r6, #0
	add r0, #0x88
	add r1, #0x24
	bl sub_020180F8
	ldr r1, [r4, #0x3c]
	add r6, #0x9c
	add r0, r6, #0
	add r1, #0x24
	bl sub_020180F8
	ldr r1, [r4, #0x3c]
	add r0, r5, #0
	add r0, #0x88
	add r1, #0x24
	bl sub_020180F8
	ldr r1, [r4, #0x3c]
	add r5, #0x9c
	add r0, r5, #0
	add r1, #0x24
	bl sub_020180F8
	mov r0, #0
	str r0, [r4, #0x30]
	add r0, r7, #0
	bl DestroySysTask
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0225F59A:
	ldr r0, [r4, #0x2c]
	ldr r1, [r0]
	sub r3, r1, #1
	bmi _0225F5A6
	cmp r3, #4
	ble _0225F5A8
_0225F5A6:
	mov r3, #0
_0225F5A8:
	ldr r0, [r4]
	cmp r0, #5
	bls _0225F5B0
	b _0225F81E
_0225F5B0:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225F5BC: ; jump table
	.short _0225F5C8 - _0225F5BC - 2 ; case 0
	.short _0225F5E8 - _0225F5BC - 2 ; case 1
	.short _0225F69C - _0225F5BC - 2 ; case 2
	.short _0225F6BC - _0225F5BC - 2 ; case 3
	.short _0225F798 - _0225F5BC - 2 ; case 4
	.short _0225F7C4 - _0225F5BC - 2 ; case 5
_0225F5C8:
	ldr r1, [r2]
	ldr r2, _0225F868 ; =ov92_02263CD0
	lsl r3, r3, #3
	ldr r2, [r2, r3]
	add r0, r6, #0
	bl ov92_0225D9A8
	ldr r1, [r4, #0x40]
	add r0, r6, #0
	bl ov92_0225D9B4
	ldr r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F5E8:
	mov r0, #0x71
	str r0, [sp]
	add r0, r2, #0
	add r0, #0x24
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r6, #0
	ldr r2, [r2]
	add r0, #0x88
	add r1, #0x78
	mov r3, #0x27
	bl sub_020180BC
	add r1, r6, #0
	ldr r2, [r4, #0x3c]
	mov r0, #0x71
	str r0, [sp]
	add r0, r2, #0
	add r0, #0x24
	str r0, [sp, #4]
	add r0, r6, #0
	ldr r2, [r2]
	add r0, #0x9c
	add r1, #0x78
	mov r3, #0x28
	bl sub_020180BC
	add r1, r6, #0
	add r0, r6, #0
	add r1, #0x88
	bl sub_020181D4
	add r1, r6, #0
	add r0, r6, #0
	add r1, #0x9c
	bl sub_020181D4
	add r0, r6, #0
	add r0, #0x88
	mov r1, #0
	bl sub_02018198
	add r0, r6, #0
	add r0, #0x9c
	mov r1, #0
	bl sub_02018198
	add r0, r6, #0
	mov r1, #0
	bl sub_020182A0
	mov r0, #0x7b
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r6, r0]
	sub r0, #0x5c
	add r0, r6, r0
	bl ov92_022630E8
	mov r0, #0x1a
	lsl r0, r0, #4
	add r0, r6, r0
	bl ov92_022630E8
	mov r3, #5
	mov r1, #0
	ldr r0, _0225F86C ; =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	mov r3, #4
	mvn r3, r3
	mov r1, #0
	ldr r0, _0225F86C ; =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r6, #0
	add r2, r1, #0
	bl ov92_02260428
	ldr r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F69C:
	ldr r1, [r2]
	ldr r2, _0225F870 ; =ov92_02263CD4
	lsl r3, r3, #3
	ldr r2, [r2, r3]
	add r0, r5, #0
	bl ov92_0225D9A8
	ldr r1, [r4, #0x40]
	add r0, r5, #0
	bl ov92_0225D9B4
	ldr r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F6BC:
	mov r0, #0x71
	str r0, [sp]
	add r0, r2, #0
	add r0, #0x24
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r5, #0
	ldr r2, [r2]
	add r0, #0x88
	add r1, #0x78
	mov r3, #0x29
	bl sub_020180BC
	add r1, r5, #0
	ldr r2, [r4, #0x3c]
	mov r0, #0x71
	str r0, [sp]
	add r0, r2, #0
	add r0, #0x24
	str r0, [sp, #4]
	add r0, r5, #0
	ldr r2, [r2]
	add r0, #0x9c
	add r1, #0x78
	mov r3, #0x2a
	bl sub_020180BC
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x88
	bl sub_020181D4
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x9c
	bl sub_020181D4
	add r0, r5, #0
	add r0, #0x88
	mov r1, #0
	bl sub_02018198
	add r0, r5, #0
	add r0, #0x9c
	mov r1, #0
	bl sub_02018198
	add r0, r5, #0
	mov r1, #1
	bl sub_020182A0
	mov r0, #0x7b
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r5, r0]
	sub r0, #0x5c
	add r0, r5, r0
	bl ov92_022630E8
	mov r0, #0x1a
	lsl r0, r0, #4
	add r0, r5, r0
	bl ov92_022630E8
	mov r3, #5
	mov r1, #0
	ldr r0, _0225F86C ; =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	mov r3, #4
	mvn r3, r3
	mov r1, #0
	ldr r0, _0225F86C ; =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r5, #0
	add r2, r1, #0
	bl ov92_02260428
	ldr r0, [r4, #0x40]
	cmp r0, #0
	beq _0225F78E
	mov r1, #0
	ldr r2, _0225F874 ; =0xFFFF8000
	add r0, r6, #0
	add r3, r1, #0
	bl sub_020182A8
	mov r1, #0
	ldr r2, _0225F874 ; =0xFFFF8000
	add r0, r5, #0
	add r3, r1, #0
	bl sub_020182A8
	mov r0, #0x79
	ldr r1, _0225F874 ; =0xFFFF8000
	lsl r0, r0, #2
	str r1, [r6, r0]
	str r1, [r5, r0]
_0225F78E:
	ldr r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F798:
	mov r0, #0x7b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0225F864
	add r0, r6, #0
	mov r1, #1
	bl sub_020182A0
	add r0, r5, #0
	mov r1, #0
	bl sub_020182A0
	mov r0, #0x7b
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r6, r0]
	ldr r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F7C4:
	cmp r1, #0
	bne _0225F7CE
	mov r0, #0xff
	str r0, [r4]
	b _0225F814
_0225F7CE:
	ldr r0, [r4, #0x28]
	cmp r0, r1
	beq _0225F814
	add r0, r6, #0
	bl ov92_0225DA2C
	add r0, r5, #0
	bl ov92_0225DA2C
	ldr r1, [r4, #0x3c]
	add r0, r6, #0
	add r0, #0x88
	add r1, #0x24
	bl sub_020180F8
	ldr r1, [r4, #0x3c]
	add r6, #0x9c
	add r0, r6, #0
	add r1, #0x24
	bl sub_020180F8
	ldr r1, [r4, #0x3c]
	add r0, r5, #0
	add r0, #0x88
	add r1, #0x24
	bl sub_020180F8
	ldr r1, [r4, #0x3c]
	add r5, #0x9c
	add r0, r5, #0
	add r1, #0x24
	bl sub_020180F8
	mov r0, #0
	str r0, [r4]
_0225F814:
	ldr r0, [r4, #0x2c]
	add sp, #0xc
	ldr r0, [r0]
	str r0, [r4, #0x28]
	pop {r4, r5, r6, r7, pc}
_0225F81E:
	add r0, r6, #0
	bl ov92_0225DA2C
	add r0, r5, #0
	bl ov92_0225DA2C
	ldr r1, [r4, #0x3c]
	add r0, r6, #0
	add r0, #0x88
	add r1, #0x24
	bl sub_020180F8
	ldr r1, [r4, #0x3c]
	add r6, #0x9c
	add r0, r6, #0
	add r1, #0x24
	bl sub_020180F8
	ldr r1, [r4, #0x3c]
	add r0, r5, #0
	add r0, #0x88
	add r1, #0x24
	bl sub_020180F8
	ldr r1, [r4, #0x3c]
	add r5, #0x9c
	add r0, r5, #0
	add r1, #0x24
	bl sub_020180F8
	mov r0, #0
	str r0, [r4, #0x30]
	add r0, r7, #0
	bl DestroySysTask
_0225F864:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225F868: .word ov92_02263CD0
_0225F86C: .word 0x3F4CCCCD
_0225F870: .word ov92_02263CD4
_0225F874: .word 0xFFFF8000
	thumb_func_end ov92_0225F530

	thumb_func_start ov92_0225F878
ov92_0225F878: ; 0x0225F878
	push {r3, r4}
	sub sp, #8
	ldr r3, _0225F8A8 ; =ov92_02263C34
	add r2, sp, #0
	ldrh r4, [r3, #0x10]
	add r1, sp, #0
	strh r4, [r2]
	ldrh r4, [r3, #0x12]
	strh r4, [r2, #2]
	ldrh r4, [r3, #0x14]
	ldrh r3, [r3, #0x16]
	strh r4, [r2, #4]
	strh r3, [r2, #6]
	ldr r3, _0225F8AC ; =0x00002AF0
	sub r2, r3, #4
	ldr r2, [r0, r2]
	ldr r4, [r0, r3]
	lsl r2, r2, #1
	ldrh r1, [r1, r2]
	add r1, r4, r1
	str r1, [r0, r3]
	add sp, #8
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0225F8A8: .word ov92_02263C34
_0225F8AC: .word 0x00002AF0
	thumb_func_end ov92_0225F878

	thumb_func_start ov92_0225F8B0
ov92_0225F8B0: ; 0x0225F8B0
	push {r3, r4}
	sub sp, #8
	ldr r3, _0225F8E4 ; =ov92_02263C34
	add r1, sp, #0
	ldrh r4, [r3, #0x18]
	add r2, sp, #0
	strh r4, [r1]
	ldrh r4, [r3, #0x1a]
	strh r4, [r1, #2]
	ldrh r4, [r3, #0x1c]
	ldrh r3, [r3, #0x1e]
	strh r4, [r1, #4]
	ldr r4, _0225F8E8 ; =0x00002AF0
	strh r3, [r1, #6]
	sub r3, r4, #4
	ldr r3, [r0, r3]
	ldr r1, [r0, r4]
	sub r3, r3, #1
	lsl r3, r3, #1
	ldrh r2, [r2, r3]
	add r1, r1, r2
	str r1, [r0, r4]
	add sp, #8
	pop {r3, r4}
	bx lr
	nop
_0225F8E4: .word ov92_02263C34
_0225F8E8: .word 0x00002AF0
	thumb_func_end ov92_0225F8B0

	thumb_func_start ov92_0225F8EC
ov92_0225F8EC: ; 0x0225F8EC
	ldr r2, _0225F958 ; =0x00002B18
	ldr r1, _0225F95C ; =0x0000010D
	ldr r3, [r0, r2]
	cmp r3, r1
	bgt _0225F906
	bge _0225F926
	cmp r3, #0
	bgt _0225F900
	beq _0225F946
	b _0225F94C
_0225F900:
	cmp r3, #0x77
	beq _0225F91E
	b _0225F94C
_0225F906:
	ldr r1, _0225F960 ; =0x00000239
	cmp r3, r1
	bgt _0225F916
	bge _0225F936
	sub r1, #0x96
	cmp r3, r1
	beq _0225F92E
	b _0225F94C
_0225F916:
	add r1, #0x96
	cmp r3, r1
	beq _0225F93E
	b _0225F94C
_0225F91E:
	mov r1, #1
	sub r2, #0x30
	str r1, [r0, r2]
	b _0225F94C
_0225F926:
	mov r1, #2
	sub r2, #0x30
	str r1, [r0, r2]
	b _0225F94C
_0225F92E:
	mov r1, #3
	sub r2, #0x30
	str r1, [r0, r2]
	b _0225F94C
_0225F936:
	mov r1, #4
	sub r2, #0x30
	str r1, [r0, r2]
	b _0225F94C
_0225F93E:
	mov r1, #5
	sub r2, #0x30
	str r1, [r0, r2]
	b _0225F94C
_0225F946:
	mov r1, #0
	sub r2, #0x30
	str r1, [r0, r2]
_0225F94C:
	ldr r2, _0225F958 ; =0x00002B18
	ldr r3, _0225F964 ; =ov92_0225F968
	ldr r1, [r0, r2]
	sub r2, #0x2c
	add r2, r0, r2
	bx r3
	.balign 4, 0
_0225F958: .word 0x00002B18
_0225F95C: .word 0x0000010D
_0225F960: .word 0x00000239
_0225F964: .word ov92_0225F968
	thumb_func_end ov92_0225F8EC

	thumb_func_start ov92_0225F968
ov92_0225F968: ; 0x0225F968
	ldr r0, _0225F9B8 ; =0x00000257
	cmp r1, r0
	bgt _0225F980
	bge _0225F998
	cmp r1, #0
	bgt _0225F978
	beq _0225F9B0
	b _0225F9B4
_0225F978:
	lsr r0, r0, #1
	cmp r1, r0
	beq _0225F992
	b _0225F9B4
_0225F980:
	ldr r0, _0225F9BC ; =0x00000383
	cmp r1, r0
	bgt _0225F98A
	beq _0225F9A0
	b _0225F9B4
_0225F98A:
	ldr r0, _0225F9C0 ; =0x000004AF
	cmp r1, r0
	beq _0225F9A8
	b _0225F9B4
_0225F992:
	mov r0, #1
	str r0, [r2]
	bx lr
_0225F998:
	mov r0, #2
	str r0, [r2]
	mov r0, #1
	bx lr
_0225F9A0:
	mov r0, #3
	str r0, [r2]
	mov r0, #1
	bx lr
_0225F9A8:
	mov r0, #4
	str r0, [r2]
	mov r0, #1
	bx lr
_0225F9B0:
	mov r0, #0
	str r0, [r2]
_0225F9B4:
	mov r0, #0
	bx lr
	.balign 4, 0
_0225F9B8: .word 0x00000257
_0225F9BC: .word 0x00000383
_0225F9C0: .word 0x000004AF
	thumb_func_end ov92_0225F968

	thumb_func_start ov92_0225F9C4
ov92_0225F9C4: ; 0x0225F9C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #4]
	mov r4, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _0225FAA0
	ldr r0, _0225FAA4 ; =0x00002B08
	add r7, r5, #0
	add r0, r5, r0
	str r0, [sp]
	add r6, r5, #0
_0225F9DE:
	ldr r0, [r5]
	cmp r4, r0
	beq _0225FA8E
	ldr r0, _0225FAA8 ; =0x00002B9C
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _0225F9F6
	cmp r0, #1
	beq _0225FA36
	cmp r0, #2
	beq _0225FA76
	b _0225FA8E
_0225F9F6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov92_0225DFA4
	cmp r0, #1
	beq _0225FA0C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov92_0225DF58
_0225FA0C:
	mov r1, #0x2b
	lsl r1, r1, #8
	ldrsh r1, [r6, r1]
	ldr r2, [sp]
	add r0, r5, #0
	bl ov92_0225F968
	cmp r0, #0
	beq _0225FA26
	add r0, r5, #0
	add r1, r4, #0
	bl ov92_0225EE04
_0225FA26:
	mov r0, #0x2b
	lsl r0, r0, #8
	ldrsh r0, [r6, r0]
	add r1, r0, #1
	mov r0, #0x2b
	lsl r0, r0, #8
	strh r1, [r6, r0]
	b _0225FA8E
_0225FA36:
	ldr r0, _0225FAAC ; =0x00002AFE
	mov r1, #0
	strh r1, [r5, r0]
	add r0, r0, #2
	strh r1, [r6, r0]
	ldr r0, _0225FAA4 ; =0x00002B08
	str r1, [r7, r0]
	ldr r0, _0225FAB0 ; =0x000021A4
	str r1, [r5, r0]
	add r0, r5, #0
	add r1, r4, #0
	bl ov92_0225DFA4
	cmp r0, #3
	beq _0225FA8E
	ldr r0, _0225FAB4 ; =0x00002BB8
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0225FA8E
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #3
	bl ov92_0225DF58
	add r0, r5, #0
	add r1, r4, #0
	bl ov92_0225EDB4
	ldr r0, _0225FAB4 ; =0x00002BB8
	mov r1, #1
	str r1, [r5, r0]
	b _0225FA8E
_0225FA76:
	ldr r0, _0225FAB4 ; =0x00002BB8
	mov r1, #0
	str r1, [r5, r0]
	sub r0, #0xba
	strh r1, [r5, r0]
	mov r0, #0x2b
	lsl r0, r0, #8
	strh r1, [r6, r0]
	add r0, #8
	str r1, [r7, r0]
	ldr r0, _0225FAA8 ; =0x00002B9C
	str r1, [r7, r0]
_0225FA8E:
	ldr r0, [sp]
	add r4, r4, #1
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #4]
	add r7, r7, #4
	add r6, r6, #2
	cmp r4, r0
	blt _0225F9DE
_0225FAA0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225FAA4: .word 0x00002B08
_0225FAA8: .word 0x00002B9C
_0225FAAC: .word 0x00002AFE
_0225FAB0: .word 0x000021A4
_0225FAB4: .word 0x00002BB8
	thumb_func_end ov92_0225F9C4

	thumb_func_start ov92_0225FAB8
ov92_0225FAB8: ; 0x0225FAB8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r1, _0225FC1C ; =0x00002B9C
	ldr r2, [r4]
	add r3, r4, r1
	lsl r2, r2, #2
	ldr r5, [r3, r2]
	cmp r5, #3
	bls _0225FACC
	b _0225FC18
_0225FACC:
	add r5, r5, r5
	add r5, pc
	ldrh r5, [r5, #6]
	lsl r5, r5, #0x10
	asr r5, r5, #0x10
	add pc, r5
_0225FAD8: ; jump table
	.short _0225FAE0 - _0225FAD8 - 2 ; case 0
	.short _0225FB52 - _0225FAD8 - 2 ; case 1
	.short _0225FB8C - _0225FAD8 - 2 ; case 2
	.short _0225FBEA - _0225FAD8 - 2 ; case 3
_0225FAE0:
	mov r1, #0
	bl ov92_0225ED68
	cmp r0, #0
	beq _0225FB28
	ldr r0, _0225FC20 ; =0x00002AFC
	mov r1, #0
	strh r1, [r4, r0]
	add r0, r4, #0
	bl ov92_0225EEBC
	add r0, r4, #0
	bl ov92_0225FEB4
	ldr r0, [r4]
	ldr r1, _0225FC1C ; =0x00002B9C
	lsl r0, r0, #2
	mov r2, #1
	add r0, r4, r0
	str r2, [r0, r1]
	add r2, r4, r1
	ldr r1, [r4]
	mov r0, #0x18
	lsl r1, r1, #2
	add r1, r2, r1
	mov r2, #4
	bl sub_02037030
	ldr r0, _0225FC24 ; =0x00002B18
	mov r1, #0
	str r1, [r4, r0]
	sub r0, #0x1a
	strh r1, [r4, r0]
	ldr r0, _0225FC28 ; =0x000021A4
	str r1, [r4, r0]
	pop {r3, r4, r5, pc}
_0225FB28:
	add r0, r4, #0
	bl ov92_0225ED80
	add r0, r4, #0
	bl ov92_0225FC9C
	add r0, r4, #0
	bl ov92_0225FF1C
	add r0, r4, #0
	bl ov92_0225F878
	mov r0, #0x2b
	lsl r0, r0, #8
	add r2, r4, r0
	ldr r0, [r4]
	lsl r1, r0, #1
	ldrsh r0, [r2, r1]
	add r0, r0, #1
	strh r0, [r2, r1]
	pop {r3, r4, r5, pc}
_0225FB52:
	add r0, r1, #0
	sub r0, #0xa0
	ldrsh r0, [r4, r0]
	add r2, r0, #1
	add r0, r1, #0
	sub r0, #0xa0
	strh r2, [r4, r0]
	add r0, r1, #0
	sub r0, #0xa0
	ldrsh r0, [r4, r0]
	cmp r0, #0x5a
	blt _0225FB74
	ldr r0, [r4]
	mov r2, #2
	lsl r0, r0, #2
	add r0, r4, r0
	str r2, [r0, r1]
_0225FB74:
	ldr r1, _0225FC24 ; =0x00002B18
	mov r2, #0
	add r0, r1, #0
	str r2, [r4, r1]
	sub r0, #0x1a
	strh r2, [r4, r0]
	ldr r0, [r4]
	sub r1, #0x18
	lsl r0, r0, #1
	add r0, r4, r0
	strh r2, [r0, r1]
	pop {r3, r4, r5, pc}
_0225FB8C:
	add r0, r1, #0
	sub r0, #0xa0
	ldrsh r0, [r4, r0]
	cmp r0, #0
	beq _0225FBE4
	add r2, r1, #0
	mov r0, #0
	sub r2, #0x84
	str r0, [r4, r2]
	add r2, r1, #0
	sub r2, #0x9e
	strh r0, [r4, r2]
	add r2, r1, #0
	sub r2, #0xa0
	strh r0, [r4, r2]
	ldr r2, [r4]
	lsl r2, r2, #1
	add r3, r4, r2
	add r2, r1, #0
	sub r2, #0x9c
	strh r0, [r3, r2]
	add r0, r1, #0
	sub r0, #0xa4
	ldr r2, [r4, r0]
	add r0, r1, #0
	sub r0, #0xa8
	ldr r0, [r4, r0]
	cmp r2, r0
	beq _0225FBCA
	sub r1, #0xa8
	str r2, [r4, r1]
_0225FBCA:
	add r0, r4, #0
	bl ov92_0225EBE0
	ldr r1, _0225FC1C ; =0x00002B9C
	mov r0, #0x18
	add r2, r4, r1
	ldr r1, [r4]
	lsl r1, r1, #2
	add r1, r2, r1
	mov r2, #4
	bl sub_02037030
	pop {r3, r4, r5, pc}
_0225FBE4:
	mov r0, #0
	str r0, [r3, r2]
	pop {r3, r4, r5, pc}
_0225FBEA:
	add r2, r1, #0
	sub r2, #0xa0
	ldrsh r2, [r4, r2]
	add r3, r2, #1
	add r2, r1, #0
	sub r2, #0xa0
	strh r3, [r4, r2]
	add r2, r1, #0
	sub r2, #0xa0
	ldrsh r2, [r4, r2]
	cmp r2, #0x1d
	blo _0225FC18
	mov r2, #0
	sub r1, #0xa0
	strh r2, [r4, r1]
	bl ov92_0225EBE0
	ldr r0, [r4]
	mov r2, #0
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _0225FC1C ; =0x00002B9C
	str r2, [r1, r0]
_0225FC18:
	pop {r3, r4, r5, pc}
	nop
_0225FC1C: .word 0x00002B9C
_0225FC20: .word 0x00002AFC
_0225FC24: .word 0x00002B18
_0225FC28: .word 0x000021A4
	thumb_func_end ov92_0225FAB8

	thumb_func_start ov92_0225FC2C
ov92_0225FC2C: ; 0x0225FC2C
	push {r4, lr}
	ldr r1, _0225FC90 ; =0x00002AE4
	add r4, r0, #0
	ldr r2, [r4, r1]
	mov r1, #0x4b
	lsl r1, r1, #4
	cmp r2, r1
	bge _0225FC8C
	bl ov92_0225FAB8
	add r0, r4, #0
	bl ov92_0225F9C4
	add r0, r4, #0
	bl ov92_0225F8EC
	cmp r0, #1
	bne _0225FC64
	ldr r1, [r4]
	add r0, r4, #0
	bl ov92_0225EE60
	add r0, r4, #0
	bl ov92_0225F8B0
	ldr r0, _0225FC94 ; =0x0000058C
	bl PlaySE
_0225FC64:
	add r0, r4, #0
	bl ov92_0225FEE4
	ldr r1, _0225FC98 ; =0x00002B18
	ldr r0, [r4, r1]
	add r0, r0, #1
	str r0, [r4, r1]
	add r0, r1, #0
	sub r0, #0x34
	ldr r0, [r4, r0]
	add r2, r0, #1
	add r0, r1, #0
	sub r0, #0x34
	str r2, [r4, r0]
	add r0, r1, #0
	sub r0, #0x1a
	ldrsh r0, [r4, r0]
	sub r1, #0x1a
	add r0, r0, #1
	strh r0, [r4, r1]
_0225FC8C:
	pop {r4, pc}
	nop
_0225FC90: .word 0x00002AE4
_0225FC94: .word 0x0000058C
_0225FC98: .word 0x00002B18
	thumb_func_end ov92_0225FC2C

	thumb_func_start ov92_0225FC9C
ov92_0225FC9C: ; 0x0225FC9C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	add r5, r0, #0
	add r0, sp, #0x10
	add r1, sp, #0xc
	bl sub_02025364
	ldr r0, _0225FE78 ; =0x00002B84
	mov r1, #0
	str r1, [r5, r0]
	add r0, #0x30
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0225FCC4
	ldr r0, _0225FE7C ; =ov92_02263C3C
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl sub_0202539C
	b _0225FCCE
_0225FCC4:
	ldr r0, _0225FE80 ; =ov92_02263C34
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl sub_0202539C
_0225FCCE:
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0225FD72
	ldr r3, _0225FE84 ; =0x00001FD4
	mov r0, #0
	mov r2, #0xc3
	str r0, [r5, r3]
	add r1, r3, #4
	lsl r2, r2, #2
	str r0, [r5, r1]
	ldr r1, [r5, r2]
	cmp r1, #0
	beq _0225FD2E
	mov r0, #0x45
	lsl r0, r0, #2
	mov r1, #0xfe
	add r0, r5, r0
	lsl r1, r1, #0x16
	bl ov92_02260628
	mov r0, #0x32
	lsl r0, r0, #4
	mov r1, #0x3f
	add r0, r5, r0
	lsl r1, r1, #0x18
	bl ov92_02260628
	ldr r4, _0225FE88 ; =ov92_02263C5C
	add r3, sp, #0x20
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #0x4d
	str r0, [r3]
	add r0, r2, #0
	ldr r2, _0225FE8C ; =0x00001FC8
	lsl r1, r1, #4
	add r1, r5, r1
	add r2, r5, r2
	bl MTX_MultVec43
	ldr r0, _0225FE78 ; =0x00002B84
	mov r1, #1
	add sp, #0x2c
	str r1, [r5, r0]
	pop {r3, r4, r5, r6, pc}
_0225FD2E:
	add r1, r2, #4
	str r0, [r5, r1]
	add r2, #8
	str r0, [r5, r2]
	add r1, r3, #4
	ldr r2, [r5, r1]
	ldr r1, [r5, r3]
	ldr r3, _0225FE90 ; =0x3FF0A3D7
	str r2, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r5, r0
	add r3, r1, #0
	bl ov92_02260428
	ldr r0, _0225FE94 ; =0x00001FD8
	ldr r2, [r5, r0]
	sub r0, r0, #4
	ldr r1, [r5, r0]
	ldr r0, _0225FE98 ; =0x3E6147AE
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	add r3, r1, #0
	bl ov92_02260428
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
_0225FD72:
	ldr r0, _0225FE9C ; =0x00001FCC
	mov r1, #0x28
	ldr r0, [r5, r0]
	asr r4, r0, #0xc
	mov r0, #0x64
	sub r0, r0, r4
	bl _s32_div_f
	bl _fflt
	add r6, r0, #0
	cmp r4, #0x5f
	blt _0225FD8E
	ldr r6, _0225FEA0 ; =0x3DCCCCCD
_0225FD8E:
	add r0, r6, #0
	bl _f2d
	ldr r2, _0225FEA4 ; =0xC28F5C29
	ldr r3, _0225FEA8 ; =0x3FCC28F5
	bl _dgeq
	blo _0225FDA2
	ldr r4, _0225FE98 ; =0x3E6147AE
	b _0225FDBA
_0225FDA2:
	add r0, r6, #0
	bl _f2d
	add r2, r0, #0
	add r3, r1, #0
	ldr r0, _0225FEA4 ; =0xC28F5C29
	ldr r1, _0225FEA8 ; =0x3FCC28F5
	bl _dsub
	bl _d2f
	add r4, r0, #0
_0225FDBA:
	ldr r0, _0225FE84 ; =0x00001FD4
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _0225FDCC
	ldr r1, [sp, #0x10]
	str r1, [r5, r0]
	ldr r1, [sp, #0xc]
	add r0, r0, #4
	str r1, [r5, r0]
_0225FDCC:
	ldr r3, _0225FE94 ; =0x00001FD8
	ldr r0, [r5, r3]
	sub r3, r3, #4
	str r0, [sp]
	mov r0, #1
	lsl r0, r0, #0x1e
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x45
	lsl r0, r0, #2
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	ldr r3, [r5, r3]
	add r0, r5, r0
	bl ov92_02260428
	ldr r3, _0225FE94 ; =0x00001FD8
	ldr r0, [r5, r3]
	sub r3, r3, #4
	str r0, [sp]
	str r4, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	ldr r3, [r5, r3]
	add r0, r5, r0
	bl ov92_02260428
	ldr r4, _0225FEAC ; =ov92_02263C68
	add r3, sp, #0x14
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #0x4d
	str r0, [r3]
	add r0, r2, #0
	ldr r2, _0225FE8C ; =0x00001FC8
	lsl r1, r1, #4
	add r1, r5, r1
	add r2, r5, r2
	bl MTX_MultVec43
	ldr r0, _0225FE78 ; =0x00002B84
	mov r2, #1
	add r1, r0, #0
	str r2, [r5, r0]
	add r1, #0x10
	ldr r1, [r5, r1]
	cmp r1, #0
	bne _0225FE3E
	add r0, #0x10
	str r2, [r5, r0]
_0225FE3E:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0225FE66
	ldr r0, _0225FEB0 ; =0x0000058A
	bl IsSEPlaying
	cmp r0, #0
	bne _0225FE54
	ldr r0, _0225FEB0 ; =0x0000058A
	bl PlaySE
_0225FE54:
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	add r0, r5, #0
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov92_02260A38
_0225FE66:
	ldr r1, [sp, #0x10]
	ldr r0, _0225FE84 ; =0x00001FD4
	str r1, [r5, r0]
	ldr r1, [sp, #0xc]
	add r0, r0, #4
	str r1, [r5, r0]
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	nop
_0225FE78: .word 0x00002B84
_0225FE7C: .word ov92_02263C3C
_0225FE80: .word ov92_02263C34
_0225FE84: .word 0x00001FD4
_0225FE88: .word ov92_02263C5C
_0225FE8C: .word 0x00001FC8
_0225FE90: .word 0x3FF0A3D7
_0225FE94: .word 0x00001FD8
_0225FE98: .word 0x3E6147AE
_0225FE9C: .word 0x00001FCC
_0225FEA0: .word 0x3DCCCCCD
_0225FEA4: .word 0xC28F5C29
_0225FEA8: .word 0x3FCC28F5
_0225FEAC: .word ov92_02263C68
_0225FEB0: .word 0x0000058A
	thumb_func_end ov92_0225FC9C

	thumb_func_start ov92_0225FEB4
ov92_0225FEB4: ; 0x0225FEB4
	ldr r2, _0225FEE0 ; =0x00002B20
	mov r3, #0
	add r1, r2, #0
	strh r3, [r0, r2]
	sub r1, #0x40
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #0x64
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #0x68
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #0x6c
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #0x70
	str r3, [r0, r1]
	sub r2, #0x34
	str r3, [r0, r2]
	bx lr
	nop
_0225FEE0: .word 0x00002B20
	thumb_func_end ov92_0225FEB4

	thumb_func_start ov92_0225FEE4
ov92_0225FEE4: ; 0x0225FEE4
	ldr r2, _0225FF14 ; =0x00002AFE
	ldrsh r1, [r0, r2]
	cmp r1, #0x95
	blt _0225FF12
	add r1, r2, #0
	sub r1, #0xa
	ldr r3, [r0, r1]
	cmp r3, #8
	beq _0225FF12
	sub r1, r2, #6
	str r3, [r0, r1]
	add r1, r2, #0
	sub r1, #0xa
	ldr r1, [r0, r1]
	add r3, r1, #1
	add r1, r2, #0
	sub r1, #0xa
	str r3, [r0, r1]
	mov r1, #0
	strh r1, [r0, r2]
	ldr r1, _0225FF18 ; =0x000021A4
	mov r2, #1
	str r2, [r0, r1]
_0225FF12:
	bx lr
	.balign 4, 0
_0225FF14: .word 0x00002AFE
_0225FF18: .word 0x000021A4
	thumb_func_end ov92_0225FEE4

	thumb_func_start ov92_0225FF1C
ov92_0225FF1C: ; 0x0225FF1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	ldr r1, _0226023C ; =ov92_02263C34
	add r5, r0, #0
	ldrh r3, [r1, #0x20]
	add r0, sp, #0x18
	add r2, sp, #0x18
	strh r3, [r0]
	ldrh r3, [r1, #0x22]
	strh r3, [r0, #2]
	ldrh r3, [r1, #0x24]
	ldrh r1, [r1, #0x26]
	strh r3, [r0, #4]
	strh r1, [r0, #6]
	ldr r1, _02260240 ; =0x00002AE0
	ldr r0, [r5, r1]
	add r0, r0, #1
	str r0, [r5, r1]
	add r0, r1, #0
	add r0, #0x40
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bne _0225FF4C
	b _02260090
_0225FF4C:
	add r0, r1, #0
	add r0, #0x42
	ldrsh r0, [r5, r0]
	cmp r0, #9
	bge _0225FFC4
	cmp r0, #8
	bgt _0225FFAE
	add r0, r1, #0
	add r0, #0x74
	ldr r7, [r5, r0]
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x74
	ldr r6, [r5, r0]
	add r0, r5, r1
	bl ov92_022607F8
	str r0, [sp, #0x10]
	ldr r0, _02260244 ; =0x00002B6C
	add r0, r5, r0
	bl ov92_022607F8
	ldr r2, _02260248 ; =0x00002B54
	ldr r1, [r5, r2]
	add r2, #0x18
	sub r1, r1, r7
	lsl r1, r1, #4
	asr r1, r1, #0x10
	str r1, [sp, #0xc]
	ldr r1, [r5, r2]
	sub r1, r1, r6
	lsl r1, r1, #4
	asr r4, r1, #0x10
	ldr r1, [sp, #0x10]
	cmp r1, #1
	beq _0225FF98
	cmp r0, #1
	bne _02260028
_0225FF98:
	ldr r1, _02260248 ; =0x00002B54
	ldr r0, [r5, r1]
	sub r0, r0, r7
	str r0, [r5, r1]
	add r0, r1, #0
	add r0, #0x18
	ldr r0, [r5, r0]
	add r1, #0x18
	sub r0, r0, r6
	str r0, [r5, r1]
	b _02260028
_0225FFAE:
	add r0, r1, #0
	add r0, #0x74
	ldr r0, [r5, r0]
	add r1, #0x8c
	lsl r0, r0, #4
	asr r0, r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	lsl r0, r0, #4
	asr r4, r0, #0x10
	b _02260028
_0225FFC4:
	add r0, r1, #0
	add r0, #0x44
	ldr r7, [r5, r0]
	add r0, r1, #0
	add r0, #0x5c
	add r1, #0x44
	ldr r6, [r5, r0]
	add r0, r5, r1
	bl ov92_022607F8
	str r0, [sp, #0x14]
	ldr r0, _0226024C ; =0x00002B3C
	add r0, r5, r0
	bl ov92_022607F8
	ldr r2, _02260250 ; =0x00002B24
	ldr r1, [r5, r2]
	add r2, #0x18
	sub r1, r1, r7
	lsl r1, r1, #4
	asr r1, r1, #0x10
	str r1, [sp, #0xc]
	ldr r1, [r5, r2]
	sub r1, r1, r6
	lsl r1, r1, #4
	asr r4, r1, #0x10
	ldr r1, [sp, #0x14]
	cmp r1, #1
	beq _02260002
	cmp r0, #1
	bne _02260028
_02260002:
	ldr r0, _02260254 ; =0x00002B88
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _02260028
	mov r1, #1
	str r1, [r5, r0]
	add r1, r0, #0
	sub r1, #0x64
	ldr r1, [r5, r1]
	sub r2, r1, r7
	add r1, r0, #0
	sub r1, #0x64
	str r2, [r5, r1]
	add r1, r0, #0
	sub r1, #0x4c
	ldr r1, [r5, r1]
	sub r0, #0x4c
	sub r1, r1, r6
	str r1, [r5, r0]
_02260028:
	ldr r0, _02260258 ; =0x3FF0A3D7
	str r4, [sp]
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r0, #0x45
	lsl r0, r0, #2
	ldr r3, [sp, #0xc]
	add r0, r5, r0
	add r2, r1, #0
	bl ov92_02260428
	mov r1, #0
	ldr r0, _0226025C ; =0x3F4CCCCD
	str r4, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r3, [sp, #0xc]
	add r0, r5, r0
	add r2, r1, #0
	bl ov92_02260428
	cmp r0, #0
	beq _0226007A
	ldr r4, _02260260 ; =ov92_02263C8C
	add r3, sp, #0x38
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #0x4d
	str r0, [r3]
	add r0, r2, #0
	ldr r2, _02260264 ; =0x00001FC8
	lsl r1, r1, #4
	add r1, r5, r1
	add r2, r5, r2
	bl MTX_MultVec43
_0226007A:
	ldr r0, _02260268 ; =0x00002B22
	add sp, #0x44
	ldrsh r1, [r5, r0]
	add r1, r1, #1
	strh r1, [r5, r0]
	sub r1, r0, #2
	ldrsh r1, [r5, r1]
	sub r0, r0, #2
	sub r1, r1, #1
	strh r1, [r5, r0]
	pop {r4, r5, r6, r7, pc}
_02260090:
	ldr r0, [r5, r1]
	add r1, #0xc
	ldr r1, [r5, r1]
	lsl r1, r1, #1
	ldrsh r1, [r2, r1]
	bl _s32_div_f
	cmp r1, #0
	bne _022600AE
	ldr r0, _02260240 ; =0x00002AE0
	mov r1, #0
	str r1, [r5, r0]
	mov r1, #1
	add r0, #0xac
	str r1, [r5, r0]
_022600AE:
	ldr r1, _0226026C ; =0x00002B84
	ldr r2, [r5, r1]
	cmp r2, #0
	bne _02260124
	add r0, r1, #4
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _02260124
	add r0, r1, #0
	sub r0, #0x48
	ldr r0, [r5, r0]
	sub r1, #0x60
	lsl r0, r0, #4
	asr r4, r0, #0x10
	ldr r0, [r5, r1]
	mov r1, #0
	lsl r0, r0, #4
	asr r6, r0, #0x10
	ldr r0, _02260258 ; =0x3FF0A3D7
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, r1, #0
	add r3, r6, #0
	str r1, [sp, #8]
	bl ov92_02260428
	mov r1, #0
	ldr r0, _0226025C ; =0x3F4CCCCD
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	add r2, r1, #0
	add r3, r6, #0
	str r1, [sp, #8]
	bl ov92_02260428
	cmp r0, #0
	beq _02260194
	ldr r4, _02260270 ; =ov92_02263C74
	add r3, sp, #0x2c
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #0x4d
	str r0, [r3]
	add r0, r2, #0
	ldr r2, _02260264 ; =0x00001FC8
	lsl r1, r1, #4
	add r1, r5, r1
	add r2, r5, r2
	bl MTX_MultVec43
	b _02260194
_02260124:
	cmp r2, #1
	bne _02260194
	ldr r1, _02260254 ; =0x00002B88
	ldr r0, [r5, r1]
	cmp r0, #1
	bne _02260194
	add r0, r1, #0
	sub r0, #0x4c
	ldr r0, [r5, r0]
	sub r1, #0x64
	lsl r0, r0, #4
	asr r4, r0, #0x10
	ldr r0, [r5, r1]
	mov r1, #0
	lsl r0, r0, #4
	asr r6, r0, #0x10
	ldr r0, _02260258 ; =0x3FF0A3D7
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, r1, #0
	add r3, r6, #0
	str r1, [sp, #8]
	bl ov92_02260428
	mov r1, #0
	ldr r0, _0226025C ; =0x3F4CCCCD
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	add r2, r1, #0
	add r3, r6, #0
	str r1, [sp, #8]
	bl ov92_02260428
	cmp r0, #0
	beq _02260194
	ldr r4, _02260274 ; =ov92_02263C80
	add r3, sp, #0x20
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #0x4d
	str r0, [r3]
	add r0, r2, #0
	ldr r2, _02260264 ; =0x00001FC8
	lsl r1, r1, #4
	add r1, r5, r1
	add r2, r5, r2
	bl MTX_MultVec43
_02260194:
	ldr r1, _02260278 ; =0x00002B90
	ldr r0, [r5, r1]
	cmp r0, #0
	beq _022601AE
	sub r0, r1, #4
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _022601AC
	sub r1, #8
	ldr r0, [r5, r1]
	cmp r0, #1
	beq _022601AE
_022601AC:
	b _02260408
_022601AE:
	bl GetLCRNGSeed
	add r4, r0, #0
	bl LCRandom
	add r6, r0, #0
	add r0, r4, #0
	bl SetLCRNGSeed
	add r0, r6, #0
	mov r1, #0x64
	bl _u32_div_f
	ldr r0, _0226027C ; =0x00002AEC
	add r4, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0
	lsl r7, r0, #5
	ldr r0, _02260280 ; =ov92_02263D88
	add r3, r1, #0
	ldr r2, [r0, r7]
	ldr r0, _02260284 ; =ov92_02263D84
	add r0, r0, r7
_022601DC:
	cmp r4, r2
	blt _022601EE
	add r6, r3, r0
	ldr r6, [r6, #0xc]
	add r1, r1, #1
	add r2, r2, r6
	add r3, #8
	cmp r1, #3
	blt _022601DC
_022601EE:
	ldr r0, _02260284 ; =ov92_02263D84
	lsl r1, r1, #3
	add r0, r0, r7
	ldr r6, [r1, r0]
	ldr r1, _02260264 ; =0x00001FC8
	ldr r0, [r5, r1]
	add r1, #8
	lsl r0, r0, #4
	ldr r1, [r5, r1]
	asr r7, r0, #0x10
	lsl r0, r1, #4
	asr r0, r0, #0x10
	cmp r1, #0
	bne _02260224
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r0, r0, #0x1f
	sub r0, r0, r1
	mov r4, #0x1f
	ror r0, r4
	add r0, r1, r0
	beq _02260220
	mov r4, #1
	b _02260236
_02260220:
	sub r4, #0x20
	b _02260236
_02260224:
	cmp r0, #0
	blt _0226022C
	mov r0, #1
	b _02260230
_0226022C:
	mov r0, #0
	mvn r0, r0
_02260230:
	neg r0, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
_02260236:
	ldr r0, _02260264 ; =0x00001FC8
	b _02260288
	nop
_0226023C: .word ov92_02263C34
_02260240: .word 0x00002AE0
_02260244: .word 0x00002B6C
_02260248: .word 0x00002B54
_0226024C: .word 0x00002B3C
_02260250: .word 0x00002B24
_02260254: .word 0x00002B88
_02260258: .word 0x3FF0A3D7
_0226025C: .word 0x3F4CCCCD
_02260260: .word ov92_02263C8C
_02260264: .word 0x00001FC8
_02260268: .word 0x00002B22
_0226026C: .word 0x00002B84
_02260270: .word ov92_02263C74
_02260274: .word ov92_02263C80
_02260278: .word 0x00002B90
_0226027C: .word 0x00002AEC
_02260280: .word ov92_02263D88
_02260284: .word ov92_02263D84
_02260288:
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _022602A8
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r0, r0, #0x1f
	sub r0, r0, r2
	mov r1, #0x1f
	ror r0, r1
	add r0, r2, r0
	beq _022602A4
	mov r1, #1
	b _022602C2
_022602A4:
	sub r1, #0x20
	b _022602C2
_022602A8:
	cmp r7, #0
	blt _022602B0
	mov r1, #1
	b _022602B4
_022602B0:
	mov r1, #0
	mvn r1, r1
_022602B4:
	cmp r4, #0
	bge _022602C2
	mov r0, #0
	mvn r0, r0
	mul r0, r1
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
_022602C2:
	ldr r0, _0226040C ; =0x00002AEC
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _022602CC
	mov r1, #0
_022602CC:
	add r0, r6, #0
	mul r0, r1
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	add r0, r6, #0
	mul r0, r4
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	mov r0, #0x14
	add r2, r1, #0
	mul r2, r0
	mul r0, r4
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	ldr r0, _02260410 ; =0x00002B98
	lsl r1, r2, #0x10
	strh r7, [r5, r0]
	add r0, r0, #2
	asr r1, r1, #0x10
	strh r6, [r5, r0]
	cmp r1, #0
	ble _0226030A
	lsl r0, r1, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02260318
_0226030A:
	lsl r0, r1, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02260318:
	bl _ffix
	add r2, r0, #0
	mov r0, #8
	str r0, [sp]
	ldr r0, _02260414 ; =0x00002B54
	mov r1, #0
	add r0, r5, r0
	add r3, r1, #0
	bl ov92_02260798
	cmp r4, #0
	ble _02260344
	lsl r0, r4, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02260352
_02260344:
	lsl r0, r4, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02260352:
	bl _ffix
	add r2, r0, #0
	mov r0, #8
	str r0, [sp]
	ldr r0, _02260418 ; =0x00002B6C
	mov r1, #0
	add r0, r5, r0
	add r3, r1, #0
	bl ov92_02260798
	cmp r7, #0
	ble _0226037E
	lsl r0, r7, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0226038C
_0226037E:
	lsl r0, r7, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0226038C:
	bl _ffix
	add r2, r0, #0
	mov r0, #0xc
	str r0, [sp]
	ldr r0, _0226041C ; =0x00002B24
	mov r1, #0
	add r0, r5, r0
	add r3, r1, #0
	bl ov92_02260798
	cmp r6, #0
	ble _022603B8
	lsl r0, r6, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022603C6
_022603B8:
	lsl r0, r6, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022603C6:
	bl _ffix
	add r2, r0, #0
	mov r0, #0xc
	str r0, [sp]
	ldr r0, _02260420 ; =0x00002B3C
	mov r1, #0
	add r0, r5, r0
	add r3, r1, #0
	bl ov92_02260798
	ldr r0, _02260424 ; =0x00002B20
	mov r1, #0x16
	strh r1, [r5, r0]
	mov r1, #0
	add r2, r0, #2
	strh r1, [r5, r2]
	sub r2, r0, #4
	strh r7, [r5, r2]
	sub r2, r0, #2
	strh r6, [r5, r2]
	add r2, r0, #0
	add r2, #0x64
	str r1, [r5, r2]
	add r2, r0, #0
	add r2, #0x6c
	str r1, [r5, r2]
	add r2, r0, #0
	add r2, #0x68
	str r1, [r5, r2]
	mov r1, #1
	add r0, #0x70
	str r1, [r5, r0]
_02260408:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0226040C: .word 0x00002AEC
_02260410: .word 0x00002B98
_02260414: .word 0x00002B54
_02260418: .word 0x00002B6C
_0226041C: .word 0x00002B24
_02260420: .word 0x00002B3C
_02260424: .word 0x00002B20
	thumb_func_end ov92_0225FF1C

	thumb_func_start ov92_02260428
ov92_02260428: ; 0x02260428
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r5, r0, #0
	ldr r0, [sp, #0x64]
	add r4, r1, #0
	add r6, r3, #0
	add r7, r2, #0
	bl _f2d
	str r0, [sp, #0x10]
	sub r0, r4, r6
	str r1, [sp, #4]
	bl _dflt
	add r2, r0, #0
	add r3, r1, #0
	ldr r0, _02260610 ; =0x147AE148
	ldr r1, _02260614 ; =0x3F7547AE
	bl _dmul
	add r2, r0, #0
	add r3, r1, #0
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #4]
	bl _dmul
	bl _d2f
	add r6, r0, #0
	ldr r0, [sp, #0x64]
	bl _f2d
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x60]
	add r4, r1, #0
	sub r0, r7, r0
	bl _dflt
	add r2, r0, #0
	add r3, r1, #0
	ldr r0, _02260618 ; =0x55555555
	ldr r1, _0226061C ; =0x3F755555
	bl _dmul
	add r2, r0, #0
	add r3, r1, #0
	ldr r0, [sp, #0x14]
	add r1, r4, #0
	bl _dmul
	bl _d2f
	add r4, r0, #0
	ldr r0, [sp, #0x68]
	cmp r0, #0
	beq _022604DC
	mov r0, #0x7f
	lsl r0, r0, #2
	str r6, [r5, r0]
	add r1, r0, #4
	str r4, [r5, r1]
	sub r1, r0, #4
	mov r2, #8
	str r2, [r5, r1]
	sub r0, r0, #4
	ldr r0, [r5, r0]
	bl _fflt
	add r1, r0, #0
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl _fdiv
	mov r1, #0x81
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0xc
	ldr r0, [r5, r1]
	bl _fflt
	add r1, r0, #0
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	bl _fdiv
	mov r1, #0x82
	lsl r1, r1, #2
	str r0, [r5, r1]
_022604DC:
	add r0, r6, #0
	add r1, r6, #0
	bl _fmul
	add r7, r0, #0
	add r0, r4, #0
	add r1, r4, #0
	bl _fmul
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	mov r1, #0
	add r7, r0, #0
	bl _fgr
	ldr r0, _02260620 ; =0x45800000
	bls _02260514
	add r1, r7, #0
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02260522
_02260514:
	add r1, r7, #0
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02260522:
	bl _ffix
	bl FX_Sqrt
	add r7, r0, #0
	bl _fflt
	ldr r1, _02260620 ; =0x45800000
	bl _fdiv
	str r0, [sp, #0x18]
	bl _f2d
	add r2, r0, #0
	mov r0, #0
	add r3, r1, #0
	add r1, r0, #0
	bl _dneq
	beq _0226060A
	add r0, r7, #0
	bl FX_SinFx64c
	str r0, [sp, #0x1c]
	str r1, [sp, #0xc]
	add r0, r7, #0
	bl FX_CosFx64c
	str r0, [sp, #0x20]
	add r7, r1, #0
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0xc]
	bl _f_lltof
	ldr r1, _02260624 ; =0x4F800000
	bl _fdiv
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	add r1, r7, #0
	bl _f_lltof
	ldr r1, _02260624 ; =0x4F800000
	bl _fdiv
	add r7, r0, #0
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x18]
	bl _fdiv
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	str r7, [sp, #0x3c]
	bl _fmul
	str r0, [sp, #0x40]
	ldr r1, [sp, #0x28]
	add r0, r6, #0
	bl _fmul
	mov r2, #0x19
	str r0, [sp, #0x44]
	mov r0, #0
	lsl r2, r2, #4
	str r0, [sp, #0x48]
	add r0, r5, r2
	add r2, #0x10
	add r1, sp, #0x3c
	add r2, r5, r2
	bl ov92_02263108
	mov r1, #0x15
	lsl r1, r1, #4
	add r0, r5, r1
	add r1, #0x40
	add r1, r5, r1
	bl ov92_022632E8
	mov r1, #0x1a
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0x10
	add r1, r5, r1
	bl ov92_022630F8
	mov r1, #0x15
	lsl r1, r1, #4
	add r0, r5, r1
	add r1, #0x60
	add r1, r5, r1
	bl ov92_02263824
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r5, r0
	bl ov92_0226325C
	mov r7, #0x19
	lsl r7, r7, #4
	add r3, sp, #0x2c
	add r4, r5, r7
	add r6, r0, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r1, r2, #0
	add r0, r5, r7
	add r2, r6, #0
	bl ov92_022632B4
	add sp, #0x4c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0226060A:
	mov r0, #0
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02260610: .word 0x147AE148
_02260614: .word 0x3F7547AE
_02260618: .word 0x55555555
_0226061C: .word 0x3F755555
_02260620: .word 0x45800000
_02260624: .word 0x4F800000
	thumb_func_end ov92_02260428

	thumb_func_start ov92_02260628
ov92_02260628: ; 0x02260628
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	mov r1, #0x7f
	lsl r1, r1, #2
	add r5, r0, #0
	add r0, r1, #4
	ldr r4, [r5, r1]
	ldr r0, [r5, r0]
	add r1, #8
	str r0, [sp]
	ldr r1, [r5, r1]
	add r0, r4, #0
	bl _fsub
	mov r1, #0x7f
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #4
	add r1, #0xc
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl _fsub
	mov r1, #2
	lsl r1, r1, #8
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #8
	ldr r0, [r5, r0]
	sub r1, #8
	sub r0, r0, #1
	str r0, [r5, r1]
	add r0, r4, #0
	add r1, r4, #0
	bl _fmul
	add r6, r0, #0
	ldr r0, [sp]
	add r1, r0, #0
	bl _fmul
	add r1, r0, #0
	add r0, r6, #0
	bl _fadd
	mov r1, #0
	add r6, r0, #0
	bl _fgr
	ldr r0, _02260774 ; =0x45800000
	bls _022606A0
	add r1, r6, #0
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022606AE
_022606A0:
	add r1, r6, #0
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022606AE:
	bl _ffix
	bl FX_Sqrt
	add r6, r0, #0
	bl _fflt
	ldr r1, _02260774 ; =0x45800000
	bl _fdiv
	str r0, [sp, #4]
	bl _f2d
	add r2, r0, #0
	mov r0, #0
	add r3, r1, #0
	add r1, r0, #0
	bl _dneq
	beq _0226076E
	add r0, r6, #0
	bl FX_SinFx64c
	str r0, [sp, #8]
	add r0, r6, #0
	add r7, r1, #0
	bl FX_CosFx64c
	str r0, [sp, #0xc]
	add r6, r1, #0
	ldr r0, [sp, #8]
	add r1, r7, #0
	bl _f_lltof
	ldr r1, _02260778 ; =0x4F800000
	bl _fdiv
	add r7, r0, #0
	ldr r0, [sp, #0xc]
	add r1, r6, #0
	bl _f_lltof
	ldr r1, _02260778 ; =0x4F800000
	bl _fdiv
	add r6, r0, #0
	ldr r1, [sp, #4]
	add r0, r7, #0
	bl _fdiv
	add r7, r0, #0
	ldr r0, [sp]
	add r1, r7, #0
	str r6, [sp, #0x10]
	bl _fmul
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r1, r7, #0
	bl _fmul
	mov r2, #0x19
	str r0, [sp, #0x18]
	mov r0, #0
	lsl r2, r2, #4
	str r0, [sp, #0x1c]
	add r0, r5, r2
	add r2, #0x10
	add r1, sp, #0x10
	add r2, r5, r2
	bl ov92_02263108
	mov r1, #0x15
	lsl r1, r1, #4
	add r0, r5, r1
	add r1, #0x40
	add r1, r5, r1
	bl ov92_022632E8
	mov r1, #0x1a
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0x10
	add r1, r5, r1
	bl ov92_022630F8
	mov r1, #0x15
	lsl r1, r1, #4
	add r0, r5, r1
	add r1, #0x60
	add r1, r5, r1
	bl ov92_02263824
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0226076E:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02260774: .word 0x45800000
_02260778: .word 0x4F800000
	thumb_func_end ov92_02260628

	thumb_func_start ov92_0226077C
ov92_0226077C: ; 0x0226077C
	mov r3, #0
_0226077E:
	add r2, r0, #0
	add r2, #0xbc
	ldr r2, [r2]
	cmp r1, r2
	bne _0226078C
	add r0, r3, #0
	bx lr
_0226078C:
	add r3, r3, #1
	add r0, r0, #4
	cmp r3, #4
	blt _0226077E
	mov r0, #0xff
	bx lr
	thumb_func_end ov92_0226077C

	thumb_func_start ov92_02260798
ov92_02260798: ; 0x02260798
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x18]
	add r5, r0, #0
	add r7, r2, #0
	add r0, r3, #0
	add r6, r1, #0
	lsl r2, r4, #0xc
	str r3, [sp]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r2, r0, #0
	sub r0, r7, r6
	mov r7, #2
	mov r3, #0
	lsl r7, r7, #0xa
	add r2, r2, r7
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r2, r2, #0xc
	orr r2, r1
	sub r2, r0, r2
	asr r1, r2, #0x1f
	lsr r0, r2, #0x13
	lsl r1, r1, #0xd
	orr r1, r0
	lsl r0, r2, #0xd
	add r0, r0, r7
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	add r1, r4, #0
	mul r1, r4
	lsl r1, r1, #0xc
	bl FX_Div
	str r6, [r5]
	ldr r1, [sp]
	str r6, [r5, #4]
	str r1, [r5, #8]
	str r0, [r5, #0xc]
	mov r0, #0
	str r0, [r5, #0x10]
	str r4, [r5, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov92_02260798

	thumb_func_start ov92_022607F8
ov92_022607F8: ; 0x022607F8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r6, [r5, #0x10]
	ldr r0, [r5, #8]
	lsl r2, r6, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsr r4, r2, #0xc
	lsl r0, r1, #0x14
	add r2, r6, #0
	orr r4, r0
	ldr r0, [r5, #0xc]
	mul r2, r6
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
	lsl r1, r2, #2
	bl FX_Div
	ldr r1, [r5, #4]
	add r0, r4, r0
	add r0, r1, r0
	str r0, [r5]
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	add r0, r0, #1
	cmp r0, r1
	bgt _02260858
	str r0, [r5, #0x10]
	mov r0, #0
	pop {r4, r5, r6, pc}
_02260858:
	str r1, [r5, #0x10]
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov92_022607F8

	thumb_func_start ov92_02260860
ov92_02260860: ; 0x02260860
	str r1, [r0]
	str r1, [r0, #4]
	sub r1, r2, r1
	str r1, [r0, #0xc]
	mov r1, #0
	str r1, [r0, #0x10]
	str r3, [r0, #0x14]
	bx lr
	thumb_func_end ov92_02260860

	thumb_func_start ov92_02260870
ov92_02260870: ; 0x02260870
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x14]
	ldr r0, [r5, #0x10]
	cmp r0, r2
	blt _02260880
	mov r4, #1
	b _02260888
_02260880:
	add r2, r0, #0
	add r0, r0, #1
	str r0, [r5, #0x10]
	mov r4, #0
_02260888:
	ldr r0, [r5, #0xc]
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
	ldr r1, [r5, #0x14]
	lsl r1, r1, #0xc
	bl FX_Div
	ldr r1, [r5, #4]
	add r0, r0, r1
	str r0, [r5]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov92_02260870

	thumb_func_start ov92_022608B8
ov92_022608B8: ; 0x022608B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x74
	ldr r3, _02260A28 ; =ov92_02263E70
	add r6, r0, #0
	mov r0, #1
	str r1, [sp, #4]
	str r0, [sp, #0x18]
	add r2, sp, #0x3c
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r3, _02260A2C ; =ov92_02263E88
	add r2, sp, #0x24
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _022608FA
	ldr r0, [sp, #4]
	add r0, #0xa4
	ldr r0, [r0]
	add r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _0226091C
_022608FA:
	ldr r5, [sp, #4]
	mov r4, #0
_022608FE:
	ldr r0, [r5, #8]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _022608FE
	ldr r0, [sp, #4]
	mov r1, #0
	str r1, [r0]
	add r0, r6, #0
	bl DestroySysTask
	add sp, #0x74
	pop {r4, r5, r6, r7, pc}
_0226091C:
	ldr r0, [sp, #4]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0226092A
	cmp r0, #1
	beq _02260994
	b _02260A06
_0226092A:
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r7, sp, #0x3c
	add r6, r0, #0
	add r5, r0, #0
	str r0, [sp, #0x10]
	add r6, #0x14
	add r4, sp, #0x24
	add r5, #0x2c
_0226093E:
	ldr r0, [sp, #0x10]
	add r1, sp, #0x20
	ldr r0, [r0, #8]
	add r2, sp, #0x1c
	bl sub_0200DF2C
	ldr r1, [sp, #0x20]
	mov r0, #8
	str r0, [sp]
	ldr r2, [r7]
	ldr r3, _02260A30 ; =0x000004CD
	add r0, r6, #0
	add r2, r1, r2
	bl ov92_02260798
	ldr r1, [sp, #0x1c]
	mov r0, #8
	str r0, [sp]
	ldr r2, [r4]
	ldr r3, _02260A34 ; =0x00000333
	add r0, r5, #0
	add r2, r1, r2
	bl ov92_02260798
	ldr r0, [sp, #0x10]
	add r7, r7, #4
	add r0, r0, #4
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	add r6, #0x30
	add r0, r0, #1
	add r4, r4, #4
	add r5, #0x30
	str r0, [sp, #8]
	cmp r0, #3
	blt _0226093E
	ldr r0, [sp, #4]
	ldr r0, [r0, #4]
	add r1, r0, #1
	ldr r0, [sp, #4]
	add sp, #0x74
	str r1, [r0, #4]
	pop {r4, r5, r6, r7, pc}
_02260994:
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	ldr r7, [sp, #4]
	ldr r6, [sp, #4]
	str r0, [sp, #0x14]
	add r0, #0x14
	str r0, [sp, #0x14]
	add r4, sp, #0x54
	add r7, #0x2c
	add r5, r6, #0
_022609AA:
	ldr r0, [sp, #0x14]
	bl ov92_022607F8
	str r0, [r4]
	add r0, r7, #0
	bl ov92_022607F8
	str r0, [r4, #4]
	ldr r0, [r5, #8]
	ldr r1, [r6, #0x14]
	ldr r2, [r6, #0x2c]
	bl sub_0200DF08
	ldr r0, [r4]
	cmp r0, #0
	beq _022609D0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _022609D4
_022609D0:
	mov r0, #0
	str r0, [sp, #0x18]
_022609D4:
	ldr r0, [r5, #8]
	bl sub_0200DC18
	ldr r0, [sp, #0x14]
	add r4, #8
	add r0, #0x30
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	add r7, #0x30
	add r0, r0, #1
	add r6, #0x30
	add r5, r5, #4
	str r0, [sp, #0xc]
	cmp r0, #3
	blt _022609AA
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _02260A24
	ldr r0, [sp, #4]
	ldr r0, [r0, #4]
	add r1, r0, #1
	ldr r0, [sp, #4]
	add sp, #0x74
	str r1, [r0, #4]
	pop {r4, r5, r6, r7, pc}
_02260A06:
	ldr r4, [sp, #4]
	mov r5, #0
_02260A0A:
	ldr r0, [r4, #8]
	bl sub_0200D9DC
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #3
	blt _02260A0A
	ldr r0, [sp, #4]
	mov r1, #0
	str r1, [r0]
	add r0, r6, #0
	bl DestroySysTask
_02260A24:
	add sp, #0x74
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02260A28: .word ov92_02263E70
_02260A2C: .word ov92_02263E88
_02260A30: .word 0x000004CD
_02260A34: .word 0x00000333
	thumb_func_end ov92_022608B8

	thumb_func_start ov92_02260A38
ov92_02260A38: ; 0x02260A38
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	ldr r3, [sp]
	ldr r1, _02260AD0 ; =0x00002490
	add r5, r2, #0
	mov r0, #0
_02260A48:
	ldr r2, [r3, r1]
	cmp r2, #1
	beq _02260AC4
	mov r1, #0xa8
	mul r1, r0
	str r1, [sp, #0xc]
	ldr r1, [sp]
	mov r7, #0
	ldr r3, [r1, #0x14]
	add r2, r1, #0
	ldr r1, [sp, #0xc]
	add r6, r7, #0
	add r4, r2, r1
	ldr r2, _02260AD4 ; =0x00002534
	add r1, r2, #0
	str r3, [r4, r2]
	sub r1, #0xa0
	str r7, [r4, r1]
	ldr r1, [sp]
	sub r2, #0xa4
	add r1, r1, r2
	str r1, [sp, #0x10]
	add r2, r1, #0
	ldr r1, [sp, #0xc]
	mov r3, #1
	str r3, [r2, r1]
	add r1, r0, #1
	ldr r0, [sp, #4]
	mul r1, r0
	str r1, [sp, #8]
_02260A84:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r5, #0
	bl ov92_0225E7E4
	ldr r1, _02260AD8 ; =0x00002498
	str r0, [r4, r1]
	ldr r0, [sp, #8]
	add r1, r6, r5
	add r0, r0, r1
	mov r1, #3
	bl _s32_div_f
	ldr r0, _02260AD8 ; =0x00002498
	ldr r0, [r4, r0]
	bl sub_0200DC4C
	add r7, r7, #1
	add r4, r4, #4
	add r6, r6, r5
	cmp r7, #3
	blt _02260A84
	ldr r2, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldr r0, _02260ADC ; =ov92_022608B8
	add r1, r2, r1
	mov r2, #1
	lsl r2, r2, #0xc
	bl CreateSysTask
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02260AC4:
	add r0, r0, #1
	add r3, #0xa8
	cmp r0, #8
	blt _02260A48
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02260AD0: .word 0x00002490
_02260AD4: .word 0x00002534
_02260AD8: .word 0x00002498
_02260ADC: .word ov92_022608B8
	thumb_func_end ov92_02260A38

	thumb_func_start ov92_02260AE0
ov92_02260AE0: ; 0x02260AE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r4, r0, #0
	ldr r0, [r1]
	str r1, [sp]
	ldr r5, [r0, #0x14]
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02260AFC
	add r5, #0x34
	ldrb r0, [r5]
	cmp r0, #1
	bne _02260B14
_02260AFC:
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0, #0x10]
	str r1, [r0]
	add r0, r4, #0
	bl DestroySysTask
	ldr r0, [sp]
	bl FreeToHeap
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
_02260B14:
	ldr r0, [sp]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02260B28
	cmp r0, #1
	beq _02260B36
	cmp r0, #2
	bne _02260B26
	b _02260D86
_02260B26:
	b _022610BE
_02260B28:
	ldr r0, [sp]
	mov r1, #0
	str r1, [r0, #0xc]
	ldr r0, [r0, #4]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
_02260B36:
	ldr r3, _02260E74 ; =ov92_02263E5C
	add r2, sp, #0x1c
	mov r1, #0xa
_02260B3C:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _02260B3C
	ldr r0, [sp]
	mov r5, #0
	ldr r0, [r0, #0xc]
	mov r6, #0x3f
	lsl r1, r0, #2
	add r0, sp, #0x1c
	ldrsh r0, [r0, r1]
	str r5, [sp, #0xc]
	lsl r6, r6, #0x18
	str r0, [sp, #0x18]
	add r0, sp, #0x1c
	add r0, #2
	ldrsh r0, [r0, r1]
	str r0, [sp, #0x14]
	ldr r0, [sp]
	str r5, [r0, #8]
	add r4, r0, #0
	ldr r0, [sp, #0x18]
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	lsl r0, r0, #0xc
	str r0, [sp, #4]
_02260B76:
	lsr r2, r5, #0x1f
	lsl r1, r5, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r4, #0
	add r1, r2, r1
	add r0, #0x3a
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #3
	bl _s32_div_f
	add r7, r1, #0
	mov r0, #6
	sub r0, r0, r7
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	add r0, r4, #0
	add r0, #0x42
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x44
	strh r1, [r0]
	ldr r0, [sp]
	ldr r1, [r0]
	ldr r0, [sp, #0xc]
	add r0, r1, r0
	ldr r0, [r0, #0x40]
	mov r1, #3
	str r0, [r4, #0x14]
	add r0, r5, #0
	bl _s32_div_f
	mov r1, #0x1e
	mul r1, r0
	str r1, [r4, #0x3c]
	add r0, r1, #0
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	str r1, [r4, #0x3c]
	add r1, r4, #0
	add r1, #0x40
	mov r0, #0
	strh r0, [r1]
	lsl r0, r7, #1
	neg r1, r0
	add r0, r4, #0
	add r0, #0x46
	strh r1, [r0]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _02260BF4
	ldr r0, [sp, #8]
	bl _ffltu
	add r1, r0, #0
	add r0, r6, #0
	bl _fadd
	b _02260C00
_02260BF4:
	ldr r0, [sp, #8]
	bl _ffltu
	add r1, r6, #0
	bl _fsub
_02260C00:
	bl _ffix
	str r0, [r4, #0x20]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _02260C1C
	ldr r0, [sp, #4]
	bl _ffltu
	add r1, r0, #0
	add r0, r6, #0
	bl _fadd
	b _02260C28
_02260C1C:
	ldr r0, [sp, #4]
	bl _ffltu
	add r1, r6, #0
	bl _fsub
_02260C28:
	bl _ffix
	str r0, [r4, #0x24]
	mov r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	str r0, [r4, #0x28]
	add r1, r4, #0
	str r0, [r4, #0x2c]
	add r1, #0x38
	strb r0, [r1]
	add r1, r4, #0
	add r1, #0x39
	mov r0, #1
	strb r0, [r1]
	add r1, r4, #0
	add r1, #0x3b
	mov r0, #0
	strb r0, [r1]
	ldr r0, [r4, #0x3c]
	cmp r0, #0xb4
	bne _02260C60
	add r1, r4, #0
	add r1, #0x38
	mov r0, #2
	strb r0, [r1]
_02260C60:
	ldr r1, [r4, #0x3c]
	ldr r0, _02260E78 ; =0x0000010E
	cmp r1, r0
	blt _02260C74
	cmp r1, #0x5a
	bgt _02260C74
	add r1, r4, #0
	add r1, #0x38
	mov r0, #1
	strb r0, [r1]
_02260C74:
	mov r0, #0x42
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02260C8C
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r6, #0
	bl _fadd
	b _02260C98
_02260C8C:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r6, #0
	bl _fsub
_02260C98:
	bl _ffix
	add r7, r0, #0
	ldr r0, [r4, #0x3c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	asr r1, r0, #0x1f
	asr r3, r7, #0x1f
	add r2, r7, #0
	bl _ll_mul
	mov r2, #2
	lsl r2, r2, #0xa
	add r2, r0, r2
	ldr r0, _02260E7C ; =0x00000000
	adc r1, r0
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [r4, #0x30]
	mov r0, #0x44
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02260CDC
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r6, #0
	bl _fadd
	b _02260CE8
_02260CDC:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r6, #0
	bl _fsub
_02260CE8:
	bl _ffix
	add r7, r0, #0
	ldr r0, [r4, #0x3c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_CosDeg
	asr r1, r0, #0x1f
	asr r3, r7, #0x1f
	add r2, r7, #0
	bl _ll_mul
	mov r2, #2
	lsl r2, r2, #0xa
	add r2, r0, r2
	ldr r0, _02260E7C ; =0x00000000
	adc r1, r0
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [r4, #0x34]
	mov r0, #0x40
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02260D2C
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r6, #0
	bl _fadd
	b _02260D38
_02260D2C:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r6, #0
	bl _fsub
_02260D38:
	bl _ffix
	ldr r1, [r4, #0x1c]
	add r0, r1, r0
	str r0, [r4, #0x1c]
	ldr r2, [r4, #0x28]
	ldr r1, [r4, #0x20]
	mov ip, r0
	add r1, r2, r1
	ldr r7, [r4, #0x30]
	ldr r3, [r4, #0x18]
	add r1, r7, r1
	add r1, r3, r1
	ldr r3, [r4, #0x2c]
	ldr r2, [r4, #0x24]
	ldr r7, [r4, #0x34]
	add r2, r3, r2
	add r2, r7, r2
	mov r3, ip
	add r2, r3, r2
	mov r3, #0xe
	ldr r0, [r4, #0x14]
	lsl r3, r3, #0x10
	bl sub_0200DF44
	ldr r0, [sp, #0xc]
	add r5, r5, #1
	add r0, r0, #4
	add r4, #0x34
	str r0, [sp, #0xc]
	cmp r5, #0x24
	bge _02260D7A
	b _02260B76
_02260D7A:
	ldr r0, [sp]
	ldr r0, [r0, #4]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
	b _022610D6
_02260D86:
	ldr r0, [sp]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _02260DA4
	add r1, r0, #1
	ldr r0, [sp]
	mov r2, #0
	str r1, [r0, #8]
	ldr r0, [r0]
	mov r1, #1
	bl ov92_0225DF0C
	ldr r0, _02260E80 ; =0x0000058B
	bl PlaySE
_02260DA4:
	ldr r0, [sp]
	ldr r0, [r0, #8]
	cmp r0, #0x1e
	ble _02260DD0
	ldr r0, [sp]
	mov r1, #1
	str r1, [r0, #4]
	ldr r0, [r0, #0xc]
	ldr r1, [sp]
	add r0, r0, #1
	str r0, [r1, #0xc]
	mov r1, #5
	bl _s32_div_f
	ldr r0, [sp]
	mov r2, #1
	str r1, [r0, #0xc]
	ldr r0, [r0]
	mov r1, #0
	bl ov92_0225DF0C
	b _022610A8
_02260DD0:
	add r1, r0, #1
	ldr r0, [sp]
	mov r4, #0x3f
	str r1, [r0, #8]
	mov r0, #0
	ldr r5, [sp]
	str r0, [sp, #0x10]
	lsl r4, r4, #0x18
_02260DE0:
	mov r0, #0x46
	ldrsh r0, [r5, r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0x46
	strh r1, [r0]
	mov r0, #0x46
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bge _02260DF6
	b _0226109A
_02260DF6:
	add r0, r5, #0
	add r0, #0x3a
	ldrb r0, [r0]
	add r0, #0xa
	cmp r1, r0
	blt _02260EAE
	cmp r1, r0
	bne _02260E0E
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl sub_0200DC4C
_02260E0E:
	mov r0, #0x46
	ldrsh r1, [r5, r0]
	add r0, r5, #0
	add r0, #0x3a
	ldrb r0, [r0]
	add r0, #0x12
	cmp r1, r0
	bne _02260E28
	add r1, r5, #0
	add r1, #0x39
	mov r0, #0
	strb r0, [r1]
	b _02260E46
_02260E28:
	lsr r2, r1, #0x1f
	lsl r1, r1, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	beq _02260E46
	add r0, r5, #0
	add r0, #0x39
	ldrb r1, [r0]
	mov r0, #1
	eor r1, r0
	add r0, r5, #0
	add r0, #0x39
	strb r1, [r0]
_02260E46:
	add r1, r5, #0
	add r1, #0x39
	ldrb r1, [r1]
	ldr r0, [r5, #0x14]
	bl sub_0200DCE8
	add r0, r5, #0
	add r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _02260E66
	cmp r0, #1
	beq _02260E6C
	cmp r0, #2
	beq _02260E88
	b _02260E8E
_02260E66:
	ldr r0, _02260E84 ; =0xFFFFF000
	str r0, [r5, #0x28]
	b _02260E8E
_02260E6C:
	mov r0, #0
	str r0, [r5, #0x28]
	b _02260E8E
	nop
_02260E74: .word ov92_02263E5C
_02260E78: .word 0x0000010E
_02260E7C: .word 0x00000000
_02260E80: .word 0x0000058B
_02260E84: .word 0xFFFFF000
_02260E88:
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r5, #0x28]
_02260E8E:
	add r0, r5, #0
	add r0, #0x3b
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0x3b
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x3b
	ldrb r0, [r0]
	mov r1, #3
	bl _s32_div_f
	add r0, r5, #0
	add r0, #0x3b
	strb r1, [r0]
_02260EAE:
	mov r0, #0x46
	ldrsh r1, [r5, r0]
	cmp r1, #5
	ble _02260EF6
	add r0, r5, #0
	add r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _02260EE8
	cmp r0, #1
	beq _02260ED8
	cmp r0, #2
	bne _02260EF6
	add r0, r1, #5
	mov r1, #6
	bl _s32_div_f
	add r1, r5, #0
	add r1, #0x40
	strh r0, [r1]
	b _02260EF6
_02260ED8:
	add r0, r1, #5
	mov r1, #6
	bl _s32_div_f
	add r1, r5, #0
	add r1, #0x40
	strh r0, [r1]
	b _02260EF6
_02260EE8:
	add r0, r1, #5
	mov r1, #7
	bl _s32_div_f
	add r1, r5, #0
	add r1, #0x40
	strh r0, [r1]
_02260EF6:
	add r0, r5, #0
	add r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _02260F54
	cmp r0, #1
	beq _02260F2E
	cmp r0, #2
	bne _02260F2E
	mov r0, #0x46
	ldrsh r0, [r5, r0]
	mov r1, #0x1e
	add r2, r0, #5
	sub r2, r1, r2
	asr r1, r2, #2
	lsr r1, r1, #0x1d
	add r1, r2, r1
	add r2, r0, #7
	mov r0, #0x1e
	sub r2, r0, r2
	asr r0, r2, #2
	lsr r0, r0, #0x1d
	add r0, r2, r0
	lsl r1, r1, #0xd
	lsl r0, r0, #0xd
	asr r1, r1, #0x10
	asr r0, r0, #0x10
	b _02260F78
_02260F2E:
	mov r0, #0x46
	ldrsh r0, [r5, r0]
	mov r1, #0x1e
	add r2, r0, #5
	sub r2, r1, r2
	asr r1, r2, #2
	lsr r1, r1, #0x1d
	add r1, r2, r1
	add r2, r0, #6
	mov r0, #0x1e
	sub r2, r0, r2
	asr r0, r2, #2
	lsr r0, r0, #0x1d
	add r0, r2, r0
	lsl r1, r1, #0xd
	lsl r0, r0, #0xd
	asr r1, r1, #0x10
	asr r0, r0, #0x10
	b _02260F78
_02260F54:
	mov r0, #0x46
	ldrsh r0, [r5, r0]
	mov r1, #0x1e
	add r2, r0, #5
	sub r2, r1, r2
	asr r1, r2, #2
	lsr r1, r1, #0x1d
	add r1, r2, r1
	add r2, r0, #4
	mov r0, #0x1e
	sub r2, r0, r2
	asr r0, r2, #2
	lsr r0, r0, #0x1d
	add r0, r2, r0
	lsl r1, r1, #0xd
	lsl r0, r0, #0xd
	asr r1, r1, #0x10
	asr r0, r0, #0x10
_02260F78:
	cmp r1, #0
	ble _02260F84
	mov r2, #0x42
	ldrsh r2, [r5, r2]
	add r2, r2, r1
	b _02260F8A
_02260F84:
	mov r1, #0x42
	ldrsh r1, [r5, r1]
	add r2, r1, #1
_02260F8A:
	add r1, r5, #0
	add r1, #0x42
	strh r2, [r1]
	cmp r0, #0
	ble _02260F9C
	mov r1, #0x44
	ldrsh r1, [r5, r1]
	add r1, r1, r0
	b _02260FA2
_02260F9C:
	mov r0, #0x44
	ldrsh r0, [r5, r0]
	add r1, r0, #1
_02260FA2:
	add r0, r5, #0
	add r0, #0x44
	strh r1, [r0]
	mov r0, #0x42
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _02260FC0
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r4, #0
	bl _fadd
	b _02260FCC
_02260FC0:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r4, #0
	bl _fsub
_02260FCC:
	bl _ffix
	add r6, r0, #0
	ldr r0, [r5, #0x3c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	asr r1, r0, #0x1f
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	mov r2, #2
	lsl r2, r2, #0xa
	add r2, r0, r2
	ldr r0, _022610E4 ; =0x00000000
	adc r1, r0
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [r5, #0x30]
	mov r0, #0x44
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _02261010
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r4, #0
	bl _fadd
	b _0226101C
_02261010:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r4, #0
	bl _fsub
_0226101C:
	bl _ffix
	add r6, r0, #0
	ldr r0, [r5, #0x3c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_CosDeg
	asr r1, r0, #0x1f
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	mov r2, #2
	lsl r2, r2, #0xa
	add r2, r0, r2
	ldr r0, _022610E4 ; =0x00000000
	adc r1, r0
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [r5, #0x34]
	mov r0, #0x40
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _02261060
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r4, #0
	bl _fadd
	b _0226106C
_02261060:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r4, #0
	bl _fsub
_0226106C:
	bl _ffix
	ldr r1, [r5, #0x1c]
	add r7, r1, r0
	str r7, [r5, #0x1c]
	ldr r2, [r5, #0x28]
	ldr r1, [r5, #0x20]
	ldr r3, [r5, #0x30]
	add r1, r2, r1
	add r1, r3, r1
	ldr r6, [r5, #0x18]
	ldr r3, [r5, #0x2c]
	ldr r2, [r5, #0x24]
	add r1, r6, r1
	add r2, r3, r2
	ldr r6, [r5, #0x34]
	mov r3, #0xe
	add r2, r6, r2
	ldr r0, [r5, #0x14]
	add r2, r7, r2
	lsl r3, r3, #0x10
	bl sub_0200DF44
_0226109A:
	ldr r0, [sp, #0x10]
	add r5, #0x34
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #0x24
	bge _022610A8
	b _02260DE0
_022610A8:
	ldr r0, [sp]
	ldr r0, [r0, #0x10]
	ldr r0, [r0]
	cmp r0, #0
	beq _022610D6
	ldr r0, [sp]
	ldr r0, [r0, #4]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
	b _022610D6
_022610BE:
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0]
	add r2, r1, #0
	bl ov92_0225DF0C
	ldr r0, [sp]
	bl FreeToHeap
	add r0, r4, #0
	bl DestroySysTask
_022610D6:
	ldr r0, [sp]
	ldr r0, [r0]
	bl ov92_0225DF28
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022610E4: .word 0x00000000
	thumb_func_end ov92_02260AE0

	thumb_func_start ov92_022610E8
ov92_022610E8: ; 0x022610E8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, _02261110 ; =0x00000764
	mov r0, #0x71
	bl AllocFromHeap
	add r1, r0, #0
	mov r2, #1
	str r5, [r1]
	mov r0, #0
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, _02261114 ; =ov92_02260AE0
	lsl r2, r2, #0xc
	str r4, [r1, #0x10]
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	nop
_02261110: .word 0x00000764
_02261114: .word ov92_02260AE0
	thumb_func_end ov92_022610E8

	thumb_func_start ov92_02261118
ov92_02261118: ; 0x02261118
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r4, #8]
	ldr r5, [r4, #0xc]
	ldr r6, [r4, #0x14]
	ldr r7, [r4, #0x10]
	cmp r1, #0
	beq _02261206
	ldr r1, [r4]
	cmp r1, #3
	bhi _022611FA
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0226113C: ; jump table
	.short _02261144 - _0226113C - 2 ; case 0
	.short _0226118A - _0226113C - 2 ; case 1
	.short _0226119C - _0226113C - 2 ; case 2
	.short _022611B4 - _0226113C - 2 ; case 3
_02261144:
	ldr r0, [r5]
	cmp r0, #4
	bge _02261150
	add r0, r0, #1
	str r0, [r5]
	b _0226115A
_02261150:
	mov r0, #4
	str r0, [r5]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0226115A:
	mov r1, #0
	str r1, [sp]
	ldr r4, [r5]
	ldr r3, [r6]
	add r0, r7, #0
	add r3, r4, r3
	lsl r3, r3, #0x18
	mov r2, #1
	lsr r3, r3, #0x18
	bl sub_02003EA4
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r4, [r5]
	ldr r3, [r6]
	add r0, r7, #0
	add r3, r4, r3
	lsl r3, r3, #0x18
	add r2, r1, #0
	lsr r3, r3, #0x18
	bl sub_02003EA4
	pop {r3, r4, r5, r6, r7, pc}
_0226118A:
	mov r1, #1
	bl sub_020182A0
	mov r0, #0
	str r0, [r4, #0x28]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0226119C:
	ldr r0, [r4, #0x50]
	cmp r0, #1
	bne _02261206
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	cmp r0, #0xf
	blt _02261206
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_022611B4:
	ldr r0, [r5]
	cmp r0, #0
	ble _022611C0
	sub r0, r0, #1
	str r0, [r5]
	b _022611CA
_022611C0:
	mov r0, #0
	str r0, [r5]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_022611CA:
	mov r1, #0
	str r1, [sp]
	ldr r4, [r5]
	ldr r3, [r6]
	add r0, r7, #0
	add r3, r4, r3
	lsl r3, r3, #0x18
	mov r2, #1
	lsr r3, r3, #0x18
	bl sub_02003EA4
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r4, [r5]
	ldr r3, [r6]
	add r0, r7, #0
	add r3, r4, r3
	lsl r3, r3, #0x18
	add r2, r1, #0
	lsr r3, r3, #0x18
	bl sub_02003EA4
	pop {r3, r4, r5, r6, r7, pc}
_022611FA:
	mov r1, #0
	str r1, [r4, #0x50]
	str r1, [r4, #4]
	str r1, [r4]
	bl sub_020182A0
_02261206:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov92_02261118

	thumb_func_start ov92_02261208
ov92_02261208: ; 0x02261208
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	ldr r0, _02261354 ; =ov92_02263E04
	add r3, sp, #0x20
	ldrh r1, [r0]
	add r6, sp, #0x14
	ldr r2, _02261358 ; =ov92_02263E3C
	strh r1, [r6, #4]
	ldrh r1, [r0, #2]
	add r4, r3, #0
	add r7, sp, #0x18
	strh r1, [r6, #6]
	ldrh r1, [r0, #4]
	ldrh r0, [r0, #6]
	strh r1, [r6, #8]
	strh r0, [r6, #0xa]
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _0226123A
	b _0226134E
_0226123A:
	ldr r0, [r5]
	cmp r0, #0
	beq _0226124A
	cmp r0, #1
	beq _022612BA
	cmp r0, #2
	beq _022612D2
	b _02261332
_0226124A:
	mov r0, #0
	str r0, [sp, #0x10]
	str r5, [sp, #8]
_02261250:
	ldr r0, [sp, #8]
	ldr r0, [r0, #8]
	str r0, [sp, #0xc]
	cmp r0, #0
	beq _02261284
	add r1, sp, #0x14
	add r1, #2
	add r2, sp, #0x14
	bl sub_0200DE44
	mov r0, #0
	ldrsh r1, [r6, r0]
	ldrsh r0, [r7, r0]
	cmp r1, r0
	ble _02261284
	sub r0, r1, #6
	strh r0, [r6]
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [sp, #0xc]
	bl sub_0200DDB8
	mov r0, #0
	str r0, [r4]
_02261284:
	ldr r0, [sp, #8]
	add r7, r7, #2
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	add r4, r4, #4
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _02261250
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0226133A
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _0226133A
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _0226133A
	beq _0226133A
	mov r0, #0
	str r0, [r5, #0x28]
	str r0, [r5, #0x50]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0226133A
_022612BA:
	ldr r0, [r5, #0x50]
	cmp r0, #1
	bne _0226133A
	ldr r0, [r5, #0x28]
	add r0, r0, #1
	str r0, [r5, #0x28]
	cmp r0, #0xf
	blt _0226133A
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0226133A
_022612D2:
	mov r0, #0
	str r0, [sp, #4]
	add r7, r5, #0
_022612D8:
	ldr r0, [r7, #8]
	str r0, [sp]
	cmp r0, #0
	beq _02261308
	add r1, sp, #0x14
	add r1, #2
	add r2, sp, #0x14
	bl sub_0200DE44
	mov r0, #0
	ldrsh r0, [r6, r0]
	cmp r0, #0xe0
	bge _02261308
	add r0, r0, #6
	strh r0, [r6]
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [sp]
	bl sub_0200DDB8
	mov r0, #0
	str r0, [r4]
_02261308:
	ldr r0, [sp, #4]
	add r7, r7, #4
	add r0, r0, #1
	add r4, r4, #4
	str r0, [sp, #4]
	cmp r0, #4
	blt _022612D8
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0226133A
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _0226133A
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _0226133A
	beq _0226133A
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0226133A
_02261332:
	mov r0, #0
	str r0, [r5, #0x50]
	str r0, [r5, #4]
	str r0, [r5]
_0226133A:
	mov r4, #0
_0226133C:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02261346
	bl sub_0200DC24
_02261346:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0226133C
_0226134E:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02261354: .word ov92_02263E04
_02261358: .word ov92_02263E3C
	thumb_func_end ov92_02261208

	thumb_func_start ov92_0226135C
ov92_0226135C: ; 0x0226135C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _022613EE
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #0
	beq _02261374
	cmp r0, #1
	beq _022613AE
	b _022613CE
_02261374:
	mov r7, #0
	ldr r4, [sp]
	add r5, r7, #0
_0226137A:
	ldr r6, [r4, #8]
	add r0, r5, #0
	mov r1, #0x28
	bl _s32_div_f
	add r0, r6, #0
	add r0, #0x88
	bl sub_02018198
	add r0, r6, #0
	mov r1, #1
	bl sub_020182A0
	add r7, r7, #1
	add r4, r4, #4
	add r5, #0x14
	cmp r7, #8
	blt _0226137A
	ldr r0, [sp]
	mov r1, #0
	str r1, [r0, #0x4c]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
_022613AE:
	ldr r0, [sp]
	ldr r0, [r0, #0x50]
	cmp r0, #1
	bne _022613EE
	ldr r0, [sp]
	ldr r0, [r0, #0x4c]
	add r1, r0, #1
	ldr r0, [sp]
	cmp r1, #0xf
	str r1, [r0, #0x4c]
	blt _022613EE
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
_022613CE:
	mov r5, #0
	ldr r4, [sp]
	add r6, r5, #0
_022613D4:
	ldr r0, [r4, #8]
	add r1, r6, #0
	bl sub_020182A0
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #8
	blt _022613D4
	ldr r0, [sp]
	mov r1, #0
	str r1, [r0, #0x50]
	str r1, [r0, #4]
	str r1, [r0]
_022613EE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov92_0226135C

	thumb_func_start ov92_022613F0
ov92_022613F0: ; 0x022613F0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02261446
	ldr r0, [r4]
	cmp r0, #0
	beq _02261406
	cmp r0, #1
	beq _0226141C
	b _02261438
_02261406:
	add r1, r4, #0
	ldr r0, [r4, #8]
	add r1, #0x54
	bl ov92_022610E8
	mov r0, #0
	str r0, [r4, #0x28]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0226141C:
	ldr r0, [r4, #0x50]
	cmp r0, #1
	bne _02261446
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	cmp r0, #0xf
	blt _02261446
	mov r0, #1
	str r0, [r4, #0x54]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_02261438:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _02261446
	mov r0, #0
	str r0, [r4, #0x50]
	str r0, [r4, #4]
	str r0, [r4]
_02261446:
	pop {r4, pc}
	thumb_func_end ov92_022613F0

	thumb_func_start ov92_02261448
ov92_02261448: ; 0x02261448
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0x99
	add r4, r1, #0
	lsl r0, r0, #2
	ldr r5, [r4, r0]
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02261464
	add r5, #0x34
	ldrb r0, [r5]
	cmp r0, #1
	bne _0226146C
_02261464:
	add r0, r6, #0
	bl DestroySysTask
	pop {r4, r5, r6, pc}
_0226146C:
	ldr r0, [r4, #4]
	ldr r0, [r0]
	cmp r0, #5
	bhi _02261508
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02261480: ; jump table
	.short _02261508 - _02261480 - 2 ; case 0
	.short _022614F8 - _02261480 - 2 ; case 1
	.short _022614D8 - _02261480 - 2 ; case 2
	.short _022614BE - _02261480 - 2 ; case 3
	.short _022614A0 - _02261480 - 2 ; case 4
	.short _0226148C - _02261480 - 2 ; case 5
_0226148C:
	mov r0, #0x7b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _022614A0
	mov r1, #1
	str r1, [r4, r0]
	mov r1, #0
	add r0, #0x4c
	str r1, [r4, r0]
_022614A0:
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _022614BE
	ldr r0, _02261564 ; =0x0000060E
	bl PlaySE
	mov r0, #0x5d
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0
	add r0, #0x4c
	str r1, [r4, r0]
_022614BE:
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	cmp r0, #0
	bne _022614D8
	add r0, r4, #0
	mov r1, #1
	add r0, #0xfc
	str r1, [r0]
	mov r0, #0x52
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_022614D8:
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	cmp r0, #0
	bne _022614F8
	ldr r0, _02261568 ; =0x00000589
	bl PlaySE
	add r0, r4, #0
	mov r1, #1
	add r0, #0x84
	str r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xd0
	str r1, [r0]
_022614F8:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _02261530
	mov r0, #1
	str r0, [r4, #0xc]
	mov r0, #0
	str r0, [r4, #0x58]
	b _02261530
_02261508:
	ldr r1, [r4]
	cmp r0, r1
	beq _02261530
	mov r2, #1
	add r0, r4, #0
	mov r1, #0x52
	str r2, [r4, #0x58]
	add r0, #0xd0
	lsl r1, r1, #2
	str r2, [r0]
	add r0, r1, #0
	str r2, [r4, r1]
	add r0, #0x78
	str r2, [r4, r0]
	add r1, #0xf0
	str r2, [r4, r1]
	ldr r0, _02261568 ; =0x00000589
	mov r1, #0
	bl StopSE
_02261530:
	add r0, r4, #0
	add r0, #8
	bl ov92_02261118
	add r0, r4, #0
	add r0, #0x80
	bl ov92_02261208
	add r0, r4, #0
	add r0, #0xf8
	bl ov92_0226135C
	mov r0, #0x17
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov92_02261208
	mov r0, #0x7a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov92_022613F0
	ldr r0, [r4, #4]
	ldr r0, [r0]
	str r0, [r4]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02261564: .word 0x0000060E
_02261568: .word 0x00000589
	thumb_func_end ov92_02261448

	thumb_func_start ov92_0226156C
ov92_0226156C: ; 0x0226156C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r1, [r4, #0x14]
	ldr r0, _022616BC ; =0x0000248C
	mov r6, #0
	str r1, [r4, r0]
	ldr r0, _022616C0 ; =0x00002AE8
	add r1, r4, r0
	ldr r0, _022616C4 ; =0x0000222C
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	ldr r2, [r1]
	sub r1, r0, #4
	add r0, r0, #4
	str r2, [r4, r1]
	add r5, r4, r0
_0226158E:
	mov r1, #0
	str r1, [r5]
	str r1, [r5, #4]
	cmp r6, #4
	bhi _0226163C
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022615A4: ; jump table
	.short _022615AE - _022615A4 - 2 ; case 0
	.short _022615CA - _022615A4 - 2 ; case 1
	.short _02261624 - _022615A4 - 2 ; case 2
	.short _0226163E - _022615A4 - 2 ; case 3
	.short _02261698 - _022615A4 - 2 ; case 4
_022615AE:
	ldr r0, _022616C8 ; =0x00000944
	add r0, r4, r0
	str r0, [r5, #8]
	mov r0, #0x42
	lsl r0, r0, #2
	add r1, r4, r0
	add r0, r0, #4
	str r1, [r5, #0xc]
	add r0, r4, r0
	str r0, [r5, #0x14]
	ldr r0, [r4, #0x14]
	ldr r0, [r0, #0x14]
	str r0, [r5, #0x10]
	b _0226169A
_022615CA:
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	add r2, sp, #4
	str r0, [r5, #8]
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	str r0, [r5, #0xc]
	str r1, [r5, #0x10]
	add r0, r4, #0
	str r1, [r5, #0x14]
	add r0, #0xd0
	add r1, sp, #4
	ldr r0, [r0]
	add r1, #2
	bl sub_0200DE44
	add r0, r4, #0
	add r0, #0xd0
	add r2, sp, #0
	mov r1, #6
	ldrsh r1, [r2, r1]
	ldr r0, [r0]
	mov r2, #0xe0
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xd4
	add r1, sp, #4
	ldr r0, [r0]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	add r0, r4, #0
	add r0, #0xd4
	add r2, sp, #0
	mov r1, #6
	ldrsh r1, [r2, r1]
	ldr r0, [r0]
	mov r2, #0xe0
	bl sub_0200DDB8
	b _0226169A
_02261624:
	mov r0, #0xb5
	lsl r0, r0, #4
	add r2, r4, r0
	mov r0, #0x83
	add r3, r5, #0
	lsl r0, r0, #2
_02261630:
	add r1, r1, #1
	str r2, [r3, #8]
	add r2, r2, r0
	add r3, r3, #4
	cmp r1, #8
	blt _02261630
_0226163C:
	b _0226169A
_0226163E:
	str r1, [r5, #8]
	add r0, r4, #0
	str r1, [r5, #0xc]
	add r0, #0xd8
	ldr r0, [r0]
	add r1, sp, #0
	str r0, [r5, #0x10]
	add r0, r4, #0
	add r0, #0xdc
	ldr r0, [r0]
	add r1, #2
	str r0, [r5, #0x14]
	add r0, r4, #0
	add r0, #0xd8
	ldr r0, [r0]
	add r2, sp, #0
	bl sub_0200DE44
	add r0, r4, #0
	add r0, #0xd8
	add r2, sp, #0
	mov r1, #2
	ldrsh r1, [r2, r1]
	ldr r0, [r0]
	mov r2, #0xe0
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xdc
	add r1, sp, #0
	ldr r0, [r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r0, r4, #0
	add r0, #0xdc
	add r2, sp, #0
	mov r1, #2
	ldrsh r1, [r2, r1]
	ldr r0, [r0]
	mov r2, #0xe0
	bl sub_0200DDB8
	b _0226169A
_02261698:
	str r4, [r5, #8]
_0226169A:
	add r6, r6, #1
	add r5, #0x78
	cmp r6, #5
	bge _022616A4
	b _0226158E
_022616A4:
	ldr r1, _022616CC ; =0x00002228
	mov r2, #1
	ldr r0, _022616D0 ; =ov92_02261448
	add r1, r4, r1
	lsl r2, r2, #0xc
	bl CreateSysTask
	ldr r1, _022616D4 ; =0x00002488
	str r0, [r4, r1]
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_022616BC: .word 0x0000248C
_022616C0: .word 0x00002AE8
_022616C4: .word 0x0000222C
_022616C8: .word 0x00000944
_022616CC: .word 0x00002228
_022616D0: .word ov92_02261448
_022616D4: .word 0x00002488
	thumb_func_end ov92_0226156C

	thumb_func_start ov92_022616D8
ov92_022616D8: ; 0x022616D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	mov r1, #0x57
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	str r0, [sp, #8]
	add r0, r1, #4
	ldr r0, [r5, r0]
	str r0, [sp, #4]
	add r0, r1, #0
	add r0, #0x14
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02261700
	cmp r0, #1
	beq _0226173E
	cmp r0, #2
	beq _022617E2
	b _022617F0
_02261700:
	add r1, #0x24
	mov r2, #0xa
	add r0, r5, r1
	mov r1, #0
	lsl r2, r2, #0xe
	mov r3, #0xa
	bl ov92_02260860
	mov r0, #0x66
	lsl r0, r0, #2
	mov r2, #5
	add r0, r5, r0
	mov r1, #0
	lsl r2, r2, #0x10
	mov r3, #0xa
	bl ov92_02260860
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r2, _0226184C ; =0xFFFB0000
	add r0, r5, r0
	mov r1, #0
	mov r3, #0xa
	bl ov92_02260860
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
	b _022617F0
_0226173E:
	add r1, #0x24
	mov r7, #0
	add r6, r5, r1
	add r4, sp, #0xc
_02261746:
	add r0, r6, #0
	bl ov92_02260870
	add r7, r7, #1
	add r6, #0x18
	stmia r4!, {r0}
	cmp r7, #3
	blt _02261746
	mov r0, #0x5f
	lsl r0, r0, #2
	mov r2, #3
	ldr r0, [r5, r0]
	lsl r3, r2, #7
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	mov r1, #7
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
	mov r3, #0x5f
	lsl r3, r3, #2
	ldr r0, [r5, r3]
	add r3, #0x1c
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	mov r1, #5
	mov r2, #0
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
	mov r3, #0x5f
	lsl r3, r3, #2
	ldr r0, [r5, r3]
	add r3, #0x34
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	mov r1, #6
	mov r2, #0
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
	mov r3, #0x5f
	lsl r3, r3, #2
	ldr r0, [r5, r3]
	add r3, #0x1c
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	mov r1, #1
	mov r2, #0
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
	mov r3, #0x5f
	lsl r3, r3, #2
	ldr r0, [r5, r3]
	add r3, #0x34
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	mov r1, #2
	mov r2, #0
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _022617F0
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _022617F0
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _022617F0
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
	b _022617F0
_022617E2:
	add r0, r1, #0
	mov r2, #1
	add r0, #0x1c
	str r2, [r5, r0]
	mov r0, #0
	add r1, #0x14
	str r0, [r5, r1]
_022617F0:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	cmp r0, #6
	bge _022617FE
	add r1, r0, #1
	ldr r0, [sp, #4]
	b _02261802
_022617FE:
	ldr r0, [sp, #4]
	mov r1, #6
_02261802:
	str r1, [r0]
	mov r1, #0
	ldr r3, [sp, #8]
	str r1, [sp]
	ldr r4, [r3]
	ldr r3, [sp, #4]
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r3, [r3]
	ldr r0, [r5, r0]
	add r3, r4, r3
	lsl r3, r3, #0x18
	ldr r0, [r0, #0x14]
	mov r2, #1
	lsr r3, r3, #0x18
	bl sub_02003EA4
	mov r0, #0
	str r0, [sp]
	ldr r3, [sp, #8]
	mov r0, #0x5f
	ldr r4, [r3]
	ldr r3, [sp, #4]
	lsl r0, r0, #2
	ldr r3, [r3]
	ldr r0, [r5, r0]
	add r3, r4, r3
	mov r1, #1
	lsl r3, r3, #0x18
	ldr r0, [r0, #0x14]
	add r2, r1, #0
	lsr r3, r3, #0x18
	bl sub_02003EA4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226184C: .word 0xFFFB0000
	thumb_func_end ov92_022616D8

	thumb_func_start ov92_02261850
ov92_02261850: ; 0x02261850
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	mov r1, #0x57
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	str r0, [sp, #8]
	add r0, r1, #4
	ldr r0, [r5, r0]
	str r0, [sp, #4]
	add r0, r1, #0
	add r0, #0x14
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02261878
	cmp r0, #1
	beq _022618B6
	cmp r0, #2
	beq _0226195A
	b _02261966
_02261878:
	add r1, #0x24
	add r0, r5, r1
	mov r1, #0xa
	lsl r1, r1, #0xe
	mov r2, #0
	mov r3, #0xa
	bl ov92_02260860
	mov r0, #0x66
	lsl r0, r0, #2
	mov r1, #5
	add r0, r5, r0
	lsl r1, r1, #0x10
	mov r2, #0
	mov r3, #0xa
	bl ov92_02260860
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r1, _022619C0 ; =0xFFFB0000
	add r0, r5, r0
	mov r2, #0
	mov r3, #0xa
	bl ov92_02260860
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
	b _02261966
_022618B6:
	add r1, #0x24
	mov r7, #0
	add r6, r5, r1
	add r4, sp, #0xc
_022618BE:
	add r0, r6, #0
	bl ov92_02260870
	add r7, r7, #1
	add r6, #0x18
	stmia r4!, {r0}
	cmp r7, #3
	blt _022618BE
	mov r0, #0x5f
	lsl r0, r0, #2
	mov r2, #3
	ldr r0, [r5, r0]
	lsl r3, r2, #7
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	mov r1, #7
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
	mov r3, #0x5f
	lsl r3, r3, #2
	ldr r0, [r5, r3]
	add r3, #0x1c
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	mov r1, #5
	mov r2, #0
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
	mov r3, #0x5f
	lsl r3, r3, #2
	ldr r0, [r5, r3]
	add r3, #0x34
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	mov r1, #6
	mov r2, #0
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
	mov r3, #0x5f
	lsl r3, r3, #2
	ldr r0, [r5, r3]
	add r3, #0x1c
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	mov r1, #1
	mov r2, #0
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
	mov r3, #0x5f
	lsl r3, r3, #2
	ldr r0, [r5, r3]
	add r3, #0x34
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	mov r1, #2
	mov r2, #0
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02261966
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _02261966
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _02261966
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
	b _02261966
_0226195A:
	add r0, r1, #0
	mov r2, #0
	add r0, #0x1c
	str r2, [r5, r0]
	add r1, #0x14
	str r2, [r5, r1]
_02261966:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	cmp r0, #4
	ble _02261974
	sub r1, r0, #1
	ldr r0, [sp, #4]
	b _02261978
_02261974:
	ldr r0, [sp, #4]
	mov r1, #0
_02261978:
	str r1, [r0]
	mov r1, #0
	ldr r3, [sp, #8]
	str r1, [sp]
	ldr r4, [r3]
	ldr r3, [sp, #4]
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r3, [r3]
	ldr r0, [r5, r0]
	add r3, r4, r3
	lsl r3, r3, #0x18
	ldr r0, [r0, #0x14]
	mov r2, #1
	lsr r3, r3, #0x18
	bl sub_02003EA4
	mov r0, #0
	str r0, [sp]
	ldr r3, [sp, #8]
	mov r0, #0x5f
	ldr r4, [r3]
	ldr r3, [sp, #4]
	lsl r0, r0, #2
	ldr r3, [r3]
	ldr r0, [r5, r0]
	add r3, r4, r3
	mov r1, #1
	lsl r3, r3, #0x18
	ldr r0, [r0, #0x14]
	add r2, r1, #0
	lsr r3, r3, #0x18
	bl sub_02003EA4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022619C0: .word 0xFFFB0000
	thumb_func_end ov92_02261850

	thumb_func_start ov92_022619C4
ov92_022619C4: ; 0x022619C4
	cmp r0, #0xa
	bhi _02261A12
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022619D4: ; jump table
	.short _02261A12 - _022619D4 - 2 ; case 0
	.short _022619EA - _022619D4 - 2 ; case 1
	.short _022619EE - _022619D4 - 2 ; case 2
	.short _022619F2 - _022619D4 - 2 ; case 3
	.short _022619F6 - _022619D4 - 2 ; case 4
	.short _022619FA - _022619D4 - 2 ; case 5
	.short _022619FE - _022619D4 - 2 ; case 6
	.short _02261A02 - _022619D4 - 2 ; case 7
	.short _02261A06 - _022619D4 - 2 ; case 8
	.short _02261A0A - _022619D4 - 2 ; case 9
	.short _02261A0E - _022619D4 - 2 ; case 10
_022619EA:
	mov r0, #0x1c
	bx lr
_022619EE:
	mov r0, #0xe
	bx lr
_022619F2:
	mov r0, #0xc
	bx lr
_022619F6:
	mov r0, #0xa
	bx lr
_022619FA:
	mov r0, #9
	bx lr
_022619FE:
	mov r0, #0x20
	bx lr
_02261A02:
	mov r0, #0xe
	bx lr
_02261A06:
	mov r0, #0xc
	bx lr
_02261A0A:
	mov r0, #0xb
	bx lr
_02261A0E:
	mov r0, #0xb
	bx lr
_02261A12:
	mov r0, #9
	bx lr
	.balign 4, 0
	thumb_func_end ov92_022619C4

	thumb_func_start ov92_02261A18
ov92_02261A18: ; 0x02261A18
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x56
	add r6, r1, #0
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	ldr r4, [r0]
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02261A3C
	mov r1, #0x5f
	lsl r1, r1, #2
	ldr r0, [r6, r1]
	add r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _02261A44
_02261A3C:
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, r6, r7, pc}
_02261A44:
	add r0, r1, #0
	sub r0, #8
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _02261AD8
	sub r0, r1, #4
	ldr r0, [r6, r0]
	cmp r0, #0
	bne _02261A5C
	add r0, r6, #0
	bl ov92_022616D8
_02261A5C:
	mov r1, #0x59
	lsl r1, r1, #2
	ldr r0, [r6, r1]
	cmp r0, #0
	bne _02261AF2
	cmp r4, #0
	beq _02261AF2
	cmp r4, #8
	bge _02261AF2
	add r2, r4, #0
	mov r0, #0x28
	mul r2, r0
	str r2, [sp]
	ldr r2, _02261B04 ; =ov92_02263EA0
	ldr r3, [sp]
	mov r7, #0
	ldr r3, [r2, r3]
	ldr r4, _02261B08 ; =ov92_02263EA4
	str r3, [r6, r1]
	add r3, r1, #4
	str r7, [r6, r3]
	ldr r3, [sp]
	lsl r0, r0, #3
	ldr r3, [r4, r3]
	add r5, r6, #0
	sub r3, r3, #1
	str r3, [r6, r0]
	ldr r3, _02261B0C ; =ov92_02263EA8
	ldr r0, [sp]
	ldr r3, [r3, r0]
	add r0, r1, #0
	sub r0, #0x20
	str r3, [r6, r0]
	add r0, r3, #5
	sub r1, #0x1c
	str r0, [r6, r1]
	ldr r0, [sp]
	add r4, r2, r0
_02261AA8:
	ldr r1, [r4, #0xc]
	ldr r0, [r5]
	add r1, r1, #4
	bl sub_0200DD24
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, [r4, #0x18]
	bl sub_0200DD24
	add r7, r7, #1
	add r4, r4, #4
	add r5, #0x50
	cmp r7, #2
	blt _02261AA8
	ldr r1, _02261B10 ; =ov92_02263EC4
	ldr r0, [sp]
	ldr r2, _02261B14 ; =0x00001001
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl CreateSysTask
	b _02261AF2
_02261AD8:
	bne _02261AF2
	add r0, r1, #0
	sub r0, #0x18
	ldr r0, [r6, r0]
	cmp r0, #0
	bne _02261AF2
	sub r0, r1, #4
	ldr r0, [r6, r0]
	cmp r0, #1
	bne _02261AF2
	add r0, r6, #0
	bl ov92_02261850
_02261AF2:
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	cmp r1, #0
	beq _02261B00
	sub r1, r1, #1
	str r1, [r6, r0]
_02261B00:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02261B04: .word ov92_02263EA0
_02261B08: .word ov92_02263EA4
_02261B0C: .word ov92_02263EA8
_02261B10: .word ov92_02263EC4
_02261B14: .word 0x00001001
	thumb_func_end ov92_02261A18

	thumb_func_start ov92_02261B18
ov92_02261B18: ; 0x02261B18
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, _02261B8C ; =0x00002AF4
	ldr r6, _02261B90 ; =0x00002030
	add r1, r4, r0
	ldr r0, _02261B94 ; =0x00002188
	str r1, [r4, r0]
	mov r1, #0x42
	lsl r1, r1, #2
	add r3, r4, r1
	add r2, r0, #4
	str r3, [r4, r2]
	add r1, r1, #4
	add r2, r4, r1
	add r1, r0, #0
	add r1, #8
	str r2, [r4, r1]
	add r1, r0, #0
	ldr r2, [r4, #0x14]
	add r1, #0x24
	str r2, [r4, r1]
	add r2, r0, #0
	mov r1, #0
	add r2, #0xc
	str r1, [r4, r2]
	add r2, r0, #0
	add r2, #0x18
	str r1, [r4, r2]
	add r0, #0x1c
	str r1, [r4, r0]
	add r0, r6, #0
	add r2, r4, #0
	add r3, r4, #0
	add r0, #0xa0
_02261B5C:
	add r5, r2, #0
	add r5, #0xe8
	ldr r5, [r5]
	add r1, r1, #1
	str r5, [r3, r6]
	add r5, r2, #0
	add r5, #0xe0
	ldr r5, [r5]
	add r2, r2, #4
	str r5, [r3, r0]
	add r3, #0x50
	cmp r1, #2
	blt _02261B5C
	ldr r1, _02261B90 ; =0x00002030
	mov r2, #1
	ldr r0, _02261B98 ; =ov92_02261A18
	add r1, r4, r1
	lsl r2, r2, #0xc
	bl CreateSysTask
	ldr r1, _02261B9C ; =0x00002184
	str r0, [r4, r1]
	pop {r4, r5, r6, pc}
	nop
_02261B8C: .word 0x00002AF4
_02261B90: .word 0x00002030
_02261B94: .word 0x00002188
_02261B98: .word ov92_02261A18
_02261B9C: .word 0x00002184
	thumb_func_end ov92_02261B18

	thumb_func_start ov92_02261BA0
ov92_02261BA0: ; 0x02261BA0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02261BBE
	mov r1, #0x5f
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _02261BC8
_02261BBE:
	add r0, r5, #0
	bl DestroySysTask
	add sp, #8
	pop {r4, r5, r6, pc}
_02261BC8:
	add r0, r1, #0
	sub r0, #0x14
	ldr r0, [r4, r0]
	cmp r0, #4
	bls _02261BD4
	b _02261E74
_02261BD4:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02261BE0: ; jump table
	.short _02261BEA - _02261BE0 - 2 ; case 0
	.short _02261D5A - _02261BE0 - 2 ; case 1
	.short _02261DA2 - _02261BE0 - 2 ; case 2
	.short _02261DE8 - _02261BE0 - 2 ; case 3
	.short _02261E2E - _02261BE0 - 2 ; case 4
_02261BEA:
	mov r0, #0
	strh r0, [r4, #8]
	mov r0, #0x80
	strh r0, [r4, #0x14]
	mov r0, #0xa0
	strh r0, [r4, #0x16]
	mov r0, #0x40
	str r0, [r4, #0x18]
	mov r0, #0x18
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	mov r1, #1
	bl sub_0200DCE8
	add r0, r4, #0
	mov r1, #0
	add r0, #0xa8
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0x80
	add r0, #0xb4
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0xa0
	add r0, #0xb6
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0x40
	add r0, #0xb8
	str r1, [r0]
	add r0, r4, #0
	mov r1, #0x18
	add r0, #0xbc
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r3, #1
	ldr r0, [r4]
	add r1, sp, #4
	add r2, sp, #0
	lsl r3, r3, #0x14
	bl sub_0200DF70
	ldrh r0, [r4, #8]
	bl GF_SinDeg
	mov r1, #0x14
	ldrsh r1, [r4, r1]
	lsl r2, r1, #0xc
	ldr r1, [r4, #0x18]
	mul r0, r1
	add r5, r2, r0
	ldrh r0, [r4, #8]
	bl GF_CosDeg
	mov r1, #0x16
	ldrsh r1, [r4, r1]
	mov r3, #1
	lsl r3, r3, #0x14
	lsl r2, r1, #0xc
	ldr r1, [r4, #0x1c]
	mul r0, r1
	add r6, r2, r0
	ldr r0, [r4]
	add r1, r5, #0
	add r2, r6, #0
	bl sub_0200DF44
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov92_022619C4
	mov r2, #0x2d
	add r3, r0, #0
	add r0, r4, #0
	lsl r2, r2, #0xe
	add r0, #0x20
	add r1, r5, #0
	add r2, r5, r2
	bl ov92_02260860
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov92_022619C4
	mov r2, #6
	add r3, r0, #0
	add r0, r4, #0
	lsl r2, r2, #0xe
	add r0, #0x38
	add r1, r6, #0
	sub r2, r6, r2
	bl ov92_02260860
	add r0, r4, #0
	add r0, #0xa0
	mov r3, #1
	ldr r0, [r0]
	add r1, sp, #4
	add r2, sp, #0
	lsl r3, r3, #0x14
	bl sub_0200DF70
	add r0, r4, #0
	add r0, #0xa8
	ldrh r0, [r0]
	bl GF_SinDeg
	mov r1, #0xb4
	ldrsh r1, [r4, r1]
	lsl r2, r1, #0xc
	add r1, r4, #0
	add r1, #0xb8
	ldr r1, [r1]
	mul r0, r1
	add r6, r2, r0
	add r0, r4, #0
	add r0, #0xa8
	ldrh r0, [r0]
	bl GF_CosDeg
	mov r1, #0xb6
	ldrsh r1, [r4, r1]
	mov r3, #1
	lsl r3, r3, #0x14
	lsl r2, r1, #0xc
	add r1, r4, #0
	add r1, #0xbc
	ldr r1, [r1]
	mul r0, r1
	sub r5, r2, r0
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	add r1, r6, #0
	add r2, r5, #0
	bl sub_0200DF44
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov92_022619C4
	mov r2, #0x2d
	add r3, r0, #0
	add r0, r4, #0
	lsl r2, r2, #0xe
	add r0, #0xc0
	add r1, r6, #0
	sub r2, r6, r2
	bl ov92_02260860
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov92_022619C4
	mov r2, #6
	add r3, r0, #0
	add r0, r4, #0
	lsl r2, r2, #0xe
	add r0, #0xd8
	add r1, r5, #0
	add r2, r5, r2
	bl ov92_02260860
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02261D5A:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #1
	bl ov92_022620D0
	mov r1, #0x52
	lsl r1, r1, #2
	add r5, r0, #0
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	mov r3, #3
	bl ov92_02262018
	cmp r5, #0
	beq _02261E7A
	cmp r0, #0
	beq _02261E7A
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add sp, #8
	add r1, r1, #1
	str r1, [r4, r0]
	pop {r4, r5, r6, pc}
_02261DA2:
	sub r1, #0x38
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #3
	bl ov92_02261E88
	mov r1, #0x52
	lsl r1, r1, #2
	add r5, r0, #0
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	mov r3, #2
	bl ov92_02261E88
	cmp r5, #0
	beq _02261E7A
	cmp r0, #0
	beq _02261E7A
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add sp, #8
	add r1, r1, #1
	str r1, [r4, r0]
	pop {r4, r5, r6, pc}
_02261DE8:
	sub r1, #0x38
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #2
	bl ov92_02261F60
	mov r1, #0x52
	lsl r1, r1, #2
	add r5, r0, #0
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	mov r3, #3
	bl ov92_02262018
	cmp r5, #0
	beq _02261E7A
	cmp r0, #0
	beq _02261E7A
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add sp, #8
	add r1, r1, #1
	str r1, [r4, r0]
	pop {r4, r5, r6, pc}
_02261E2E:
	sub r1, #0x38
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #1
	bl ov92_022620D0
	mov r1, #0x52
	lsl r1, r1, #2
	add r5, r0, #0
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	mov r3, #2
	bl ov92_02261E88
	cmp r5, #0
	beq _02261E7A
	cmp r0, #0
	beq _02261E7A
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add sp, #8
	add r1, r1, #1
	str r1, [r4, r0]
	pop {r4, r5, r6, pc}
_02261E74:
	add r0, r5, #0
	bl DestroySysTask
_02261E7A:
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov92_02261BA0

	thumb_func_start ov92_02261E80
ov92_02261E80: ; 0x02261E80
	mov r1, #0
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end ov92_02261E80

	thumb_func_start ov92_02261E88
ov92_02261E88: ; 0x02261E88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	beq _02261EA0
	cmp r0, #1
	beq _02261F28
	b _02261F52
_02261EA0:
	mov r3, #1
	ldr r0, [r5]
	add r1, sp, #4
	add r2, sp, #0
	lsl r3, r3, #0x14
	bl sub_0200DF70
	cmp r6, #0
	bne _02261ECE
	add r0, r4, #0
	ldr r6, [sp, #4]
	bl ov92_022619C4
	mov r2, #0x2d
	add r3, r0, #0
	add r0, r5, #0
	lsl r2, r2, #0xe
	add r0, #0x20
	add r1, r6, #0
	sub r2, r6, r2
	bl ov92_02260860
	b _02261EE8
_02261ECE:
	add r0, r4, #0
	ldr r6, [sp, #4]
	bl ov92_022619C4
	mov r2, #0x2d
	add r3, r0, #0
	add r0, r5, #0
	lsl r2, r2, #0xe
	add r0, #0x20
	add r1, r6, #0
	add r2, r6, r2
	bl ov92_02260860
_02261EE8:
	cmp r7, #2
	bne _02261F08
	add r0, r4, #0
	ldr r6, [sp]
	bl ov92_022619C4
	mov r2, #6
	add r3, r0, #0
	add r0, r5, #0
	lsl r2, r2, #0xe
	add r0, #0x38
	add r1, r6, #0
	sub r2, r6, r2
	bl ov92_02260860
	b _02261F22
_02261F08:
	add r0, r4, #0
	ldr r6, [sp]
	bl ov92_022619C4
	mov r2, #6
	add r3, r0, #0
	add r0, r5, #0
	lsl r2, r2, #0xe
	add r0, #0x38
	add r1, r6, #0
	add r2, r6, r2
	bl ov92_02260860
_02261F22:
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
_02261F28:
	add r0, r5, #0
	add r0, #0x20
	bl ov92_02260870
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x38
	bl ov92_02260870
	mov r3, #1
	ldr r0, [r5]
	ldr r1, [r5, #0x20]
	ldr r2, [r5, #0x38]
	lsl r3, r3, #0x14
	bl sub_0200DF44
	cmp r4, #0
	beq _02261F58
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02261F52:
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02261F58:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov92_02261E88

	thumb_func_start ov92_02261F60
ov92_02261F60: ; 0x02261F60
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	add r6, r3, #0
	cmp r0, #0
	beq _02261F74
	cmp r0, #1
	beq _02261FE4
	b _0226200C
_02261F74:
	cmp r2, #0
	bne _02261F92
	add r0, r4, #0
	bl ov92_022619C4
	add r3, r0, #0
	add r0, r5, #0
	mov r1, #0x4d
	mov r2, #2
	add r0, #0x20
	lsl r1, r1, #0xe
	lsl r2, r2, #0x12
	bl ov92_02260860
	b _02261FA8
_02261F92:
	add r0, r4, #0
	bl ov92_022619C4
	add r3, r0, #0
	add r0, r5, #0
	mov r2, #2
	ldr r1, _02262014 ; =0xFFFC2000
	add r0, #0x20
	lsl r2, r2, #0x12
	bl ov92_02260860
_02261FA8:
	cmp r6, #2
	bne _02261FC6
	add r0, r4, #0
	bl ov92_022619C4
	add r3, r0, #0
	add r0, r5, #0
	mov r1, #0xa
	mov r2, #0x22
	add r0, #0x38
	lsl r1, r1, #0x10
	lsl r2, r2, #0xe
	bl ov92_02260860
	b _02261FDE
_02261FC6:
	add r0, r4, #0
	bl ov92_022619C4
	add r3, r0, #0
	add r0, r5, #0
	mov r1, #0xa
	mov r2, #0x2e
	add r0, #0x38
	lsl r1, r1, #0x10
	lsl r2, r2, #0xe
	bl ov92_02260860
_02261FDE:
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
_02261FE4:
	add r0, r5, #0
	add r0, #0x20
	bl ov92_02260870
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x38
	bl ov92_02260870
	mov r3, #1
	ldr r0, [r5]
	ldr r1, [r5, #0x20]
	ldr r2, [r5, #0x38]
	lsl r3, r3, #0x14
	bl sub_0200DF44
	cmp r4, #0
	beq _02262010
	mov r0, #1
	pop {r4, r5, r6, pc}
_0226200C:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02262010:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02262014: .word 0xFFFC2000
	thumb_func_end ov92_02261F60

	thumb_func_start ov92_02262018
ov92_02262018: ; 0x02262018
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	add r6, r3, #0
	cmp r0, #0
	beq _0226202C
	cmp r0, #1
	beq _0226209C
	b _022620C4
_0226202C:
	cmp r2, #0
	bne _0226204A
	add r0, r4, #0
	bl ov92_022619C4
	add r3, r0, #0
	add r0, r5, #0
	mov r1, #0x4d
	mov r2, #2
	add r0, #0x20
	lsl r1, r1, #0xe
	lsl r2, r2, #0x12
	bl ov92_02260860
	b _02262060
_0226204A:
	add r0, r4, #0
	bl ov92_022619C4
	add r3, r0, #0
	add r0, r5, #0
	mov r2, #2
	ldr r1, _022620CC ; =0xFFFC2000
	add r0, #0x20
	lsl r2, r2, #0x12
	bl ov92_02260860
_02262060:
	cmp r6, #2
	bne _0226207E
	add r0, r4, #0
	bl ov92_022619C4
	add r3, r0, #0
	add r0, r5, #0
	mov r1, #6
	mov r2, #0x12
	add r0, #0x38
	lsl r1, r1, #0x10
	lsl r2, r2, #0xe
	bl ov92_02260860
	b _02262096
_0226207E:
	add r0, r4, #0
	bl ov92_022619C4
	add r3, r0, #0
	add r0, r5, #0
	mov r1, #6
	mov r2, #0x1e
	add r0, #0x38
	lsl r1, r1, #0x10
	lsl r2, r2, #0xe
	bl ov92_02260860
_02262096:
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
_0226209C:
	add r0, r5, #0
	add r0, #0x20
	bl ov92_02260870
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x38
	bl ov92_02260870
	mov r3, #1
	ldr r0, [r5]
	ldr r1, [r5, #0x20]
	ldr r2, [r5, #0x38]
	lsl r3, r3, #0x14
	bl sub_0200DF44
	cmp r4, #0
	beq _022620C8
	mov r0, #1
	pop {r4, r5, r6, pc}
_022620C4:
	mov r0, #1
	pop {r4, r5, r6, pc}
_022620C8:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022620CC: .word 0xFFFC2000
	thumb_func_end ov92_02262018

	thumb_func_start ov92_022620D0
ov92_022620D0: ; 0x022620D0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4, #4]
	add r5, r2, #0
	add r6, r3, #0
	cmp r0, #0
	beq _022620E6
	cmp r0, #1
	beq _022620F2
	b _02262196
_022620E6:
	mov r0, #0
	str r0, [r4, #0x10]
	strh r0, [r4, #8]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
_022620F2:
	add r0, r1, #0
	bl ov92_022619C4
	add r1, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	bl _s32_div_f
	mov r1, #8
	ldrsh r2, [r4, r1]
	add r0, r2, r0
	strh r0, [r4, #8]
	mov r0, #0x5a
	ldrsh r1, [r4, r1]
	lsl r0, r0, #2
	cmp r1, r0
	blt _02262118
	mov r0, #0
	strh r0, [r4, #8]
_02262118:
	mov r3, #1
	ldr r0, [r4]
	add r1, sp, #4
	add r2, sp, #0
	lsl r3, r3, #0x14
	bl sub_0200DF70
	cmp r5, #0
	ldrh r0, [r4, #8]
	bne _02262144
	bl GF_SinDeg
	mov r1, #0x14
	ldrsh r1, [r4, r1]
	lsl r2, r1, #0xc
	ldr r1, [r4, #0x18]
	mul r0, r1
	sub r5, r2, r0
	ldrh r0, [r4, #8]
	bl GF_CosDeg
	b _0226215A
_02262144:
	bl GF_SinDeg
	mov r1, #0x14
	ldrsh r1, [r4, r1]
	lsl r2, r1, #0xc
	ldr r1, [r4, #0x18]
	mul r0, r1
	add r5, r2, r0
	ldrh r0, [r4, #8]
	bl GF_CosDeg
_0226215A:
	mov r1, #0x16
	ldrsh r1, [r4, r1]
	mov r3, #1
	lsl r3, r3, #0x14
	lsl r2, r1, #0xc
	ldr r1, [r4, #0x1c]
	mul r0, r1
	sub r2, r2, r0
	ldr r0, [r4]
	add r1, r5, #0
	bl sub_0200DF44
	mov r0, #8
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _0226219C
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	cmp r0, r6
	blt _02262190
	ldr r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02262190:
	mov r0, #1
	str r0, [r4, #4]
	b _0226219C
_02262196:
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0226219C:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov92_022620D0

	thumb_func_start ov92_022621A4
ov92_022621A4: ; 0x022621A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r3, _022621FC ; =ov92_02263E1C
	add r2, sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _022621CE
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, #0x34
	ldrb r1, [r1]
	cmp r1, #1
	bne _022621D8
_022621CE:
	add r0, r5, #0
	bl DestroySysTask
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_022621D8:
	add r1, r0, #0
	sub r1, #0x14
	ldr r1, [r4, r1]
	cmp r1, #4
	bls _022621E4
	b _0226253E
_022621E4:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022621F0: ; jump table
	.short _02262200 - _022621F0 - 2 ; case 0
	.short _02262338 - _022621F0 - 2 ; case 1
	.short _022623BA - _022621F0 - 2 ; case 2
	.short _02262436 - _022621F0 - 2 ; case 3
	.short _022624B2 - _022621F0 - 2 ; case 4
	nop
_022621FC: .word ov92_02263E1C
_02262200:
	sub r0, #0x3c
	ldr r0, [r4, r0]
	mov r1, #0
	str r1, [sp]
	cmp r0, #0
	ble _02262308
	add r5, r4, #0
_0226220E:
	mov r0, #0
	strh r0, [r5, #8]
	mov r0, #0x80
	strh r0, [r5, #0x14]
	mov r0, #0xa0
	strh r0, [r5, #0x16]
	mov r0, #0x40
	str r0, [r5, #0x18]
	mov r0, #0x18
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	mov r1, #1
	bl sub_0200DCE8
	add r1, r5, #0
	add r1, #0xa8
	mov r0, #0
	strh r0, [r1]
	add r1, r5, #0
	add r1, #0xb4
	mov r0, #0x80
	strh r0, [r1]
	add r1, r5, #0
	add r1, #0xb6
	mov r0, #0xa0
	strh r0, [r1]
	add r1, r5, #0
	add r1, #0xb8
	mov r0, #0x40
	str r0, [r1]
	add r1, r5, #0
	add r1, #0xbc
	mov r0, #0x18
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r3, #1
	ldr r0, [r5]
	add r1, sp, #8
	add r2, sp, #4
	lsl r3, r3, #0x14
	bl sub_0200DF70
	ldrh r0, [r5, #8]
	bl GF_SinDeg
	mov r1, #0x14
	ldrsh r1, [r5, r1]
	lsl r6, r1, #0xc
	ldr r1, [r5, #0x18]
	add r7, r1, #0
	mul r7, r0
	ldrh r0, [r5, #8]
	bl GF_CosDeg
	mov r1, #0x16
	ldrsh r1, [r5, r1]
	lsl r3, r1, #0xc
	ldr r1, [r5, #0x1c]
	add r2, r1, #0
	mul r2, r0
	add r2, r3, r2
	mov r3, #1
	ldr r0, [r5]
	add r1, r6, r7
	lsl r3, r3, #0x14
	bl sub_0200DF44
	add r0, r5, #0
	add r0, #0xa0
	mov r3, #1
	ldr r0, [r0]
	add r1, sp, #8
	add r2, sp, #4
	lsl r3, r3, #0x14
	bl sub_0200DF70
	add r0, r5, #0
	add r0, #0xa8
	ldrh r0, [r0]
	bl GF_SinDeg
	mov r1, #0xb4
	ldrsh r1, [r5, r1]
	lsl r6, r1, #0xc
	add r1, r5, #0
	add r1, #0xb8
	ldr r1, [r1]
	add r7, r1, #0
	mul r7, r0
	add r0, r5, #0
	add r0, #0xa8
	ldrh r0, [r0]
	bl GF_CosDeg
	mov r1, #0xb6
	add r2, r5, #0
	ldrsh r1, [r5, r1]
	add r2, #0xbc
	ldr r2, [r2]
	lsl r1, r1, #0xc
	mul r0, r2
	sub r2, r1, r0
	add r0, r5, #0
	add r0, #0xa0
	mov r3, #1
	ldr r0, [r0]
	add r1, r6, r7
	lsl r3, r3, #0x14
	bl sub_0200DF44
	ldr r0, [sp]
	add r5, #0x50
	add r0, r0, #1
	str r0, [sp]
	mov r0, #5
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	ldr r0, [sp]
	cmp r0, r1
	blt _0226220E
_02262308:
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02262338:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #3
	bl ov92_02261E88
	mov r1, #0x51
	str r0, [sp, #0xc]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xf0
	mov r2, #0
	mov r3, #2
	bl ov92_02261F60
	mov r1, #0x52
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	mov r3, #3
	bl ov92_02262018
	mov r2, #1
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	cmp r1, #0
	beq _0226240C
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _0226240C
	cmp r0, #0
	beq _0226240C
	cmp r2, #0
	beq _0226240C
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_022623BA:
	mov r3, #1
	mov r1, #0x51
	add r0, r4, #0
	str r3, [sp, #0xc]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, #0xf0
	mov r2, #0
	bl ov92_022620D0
	mov r1, #0x52
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	mov r3, #2
	bl ov92_02261E88
	mov r1, #0x52
	str r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0x50
	mov r2, #1
	mov r3, #3
	bl ov92_02262018
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _0226240C
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _0226240C
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _0226240C
	cmp r0, #0
	bne _0226240E
_0226240C:
	b _02262544
_0226240E:
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02262436:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #2
	bl ov92_02261F60
	mov r1, #0x51
	str r0, [sp, #0xc]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xf0
	mov r2, #0
	mov r3, #3
	bl ov92_02261E88
	mov r2, #1
	mov r1, #0x52
	str r0, [sp, #0x10]
	add r0, r4, #0
	str r2, [sp, #0x14]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, #0x50
	mov r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _02262544
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262544
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _02262544
	cmp r0, #0
	beq _02262544
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_022624B2:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #1
	bl ov92_022620D0
	mov r2, #1
	mov r1, #0x52
	str r0, [sp, #0xc]
	add r0, r4, #0
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, #0x50
	mov r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _02262544
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262544
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _02262544
	cmp r0, #0
	beq _02262544
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	mov r1, #0x53
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #1
	beq _0226252A
	add r0, r0, #1
	str r0, [r4, r1]
	mov r0, #1
	add r1, #0x1c
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_0226252A:
	mov r0, #0
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x1c
	ldr r0, [r4, r0]
	add r1, #0x1c
	add r0, r0, #1
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_0226253E:
	add r0, r5, #0
	bl DestroySysTask
_02262544:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov92_022621A4

	thumb_func_start ov92_02262548
ov92_02262548: ; 0x02262548
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r3, _022625A0 ; =ov92_02263E0C
	add r2, sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02262572
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, #0x34
	ldrb r1, [r1]
	cmp r1, #1
	bne _0226257C
_02262572:
	add r0, r5, #0
	bl DestroySysTask
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_0226257C:
	add r1, r0, #0
	sub r1, #0x14
	ldr r1, [r4, r1]
	cmp r1, #4
	bls _02262588
	b _022628E4
_02262588:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02262594: ; jump table
	.short _022625A4 - _02262594 - 2 ; case 0
	.short _022626DC - _02262594 - 2 ; case 1
	.short _0226275E - _02262594 - 2 ; case 2
	.short _022627DC - _02262594 - 2 ; case 3
	.short _02262858 - _02262594 - 2 ; case 4
	nop
_022625A0: .word ov92_02263E0C
_022625A4:
	sub r0, #0x3c
	ldr r0, [r4, r0]
	mov r1, #0
	str r1, [sp]
	cmp r0, #0
	ble _022626AC
	add r5, r4, #0
_022625B2:
	mov r0, #0
	strh r0, [r5, #8]
	mov r0, #0x80
	strh r0, [r5, #0x14]
	mov r0, #0xa0
	strh r0, [r5, #0x16]
	mov r0, #0x40
	str r0, [r5, #0x18]
	mov r0, #0x18
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	mov r1, #1
	bl sub_0200DCE8
	add r1, r5, #0
	add r1, #0xa8
	mov r0, #0
	strh r0, [r1]
	add r1, r5, #0
	add r1, #0xb4
	mov r0, #0x80
	strh r0, [r1]
	add r1, r5, #0
	add r1, #0xb6
	mov r0, #0xa0
	strh r0, [r1]
	add r1, r5, #0
	add r1, #0xb8
	mov r0, #0x40
	str r0, [r1]
	add r1, r5, #0
	add r1, #0xbc
	mov r0, #0x18
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r3, #1
	ldr r0, [r5]
	add r1, sp, #8
	add r2, sp, #4
	lsl r3, r3, #0x14
	bl sub_0200DF70
	ldrh r0, [r5, #8]
	bl GF_SinDeg
	mov r1, #0x14
	ldrsh r1, [r5, r1]
	lsl r6, r1, #0xc
	ldr r1, [r5, #0x18]
	add r7, r1, #0
	mul r7, r0
	ldrh r0, [r5, #8]
	bl GF_CosDeg
	mov r1, #0x16
	ldrsh r1, [r5, r1]
	lsl r3, r1, #0xc
	ldr r1, [r5, #0x1c]
	add r2, r1, #0
	mul r2, r0
	add r2, r3, r2
	mov r3, #1
	ldr r0, [r5]
	add r1, r6, r7
	lsl r3, r3, #0x14
	bl sub_0200DF44
	add r0, r5, #0
	add r0, #0xa0
	mov r3, #1
	ldr r0, [r0]
	add r1, sp, #8
	add r2, sp, #4
	lsl r3, r3, #0x14
	bl sub_0200DF70
	add r0, r5, #0
	add r0, #0xa8
	ldrh r0, [r0]
	bl GF_SinDeg
	mov r1, #0xb4
	ldrsh r1, [r5, r1]
	lsl r6, r1, #0xc
	add r1, r5, #0
	add r1, #0xb8
	ldr r1, [r1]
	add r7, r1, #0
	mul r7, r0
	add r0, r5, #0
	add r0, #0xa8
	ldrh r0, [r0]
	bl GF_CosDeg
	mov r1, #0xb6
	add r2, r5, #0
	ldrsh r1, [r5, r1]
	add r2, #0xbc
	ldr r2, [r2]
	lsl r1, r1, #0xc
	mul r0, r2
	sub r2, r1, r0
	add r0, r5, #0
	add r0, #0xa0
	mov r3, #1
	ldr r0, [r0]
	add r1, r6, r7
	lsl r3, r3, #0x14
	bl sub_0200DF44
	ldr r0, [sp]
	add r5, #0x50
	add r0, r0, #1
	str r0, [sp]
	mov r0, #5
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	ldr r0, [sp]
	cmp r0, r1
	blt _022625B2
_022626AC:
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_022626DC:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #3
	bl ov92_02261E88
	mov r1, #0x51
	str r0, [sp, #0xc]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xf0
	mov r2, #0
	mov r3, #2
	bl ov92_02261F60
	mov r1, #0x52
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	mov r3, #3
	bl ov92_02262018
	mov r2, #1
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	cmp r1, #0
	beq _022627B2
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _022627B2
	cmp r0, #0
	beq _022627B2
	cmp r2, #0
	beq _022627B2
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_0226275E:
	mov r0, #1
	mov r1, #0x51
	str r0, [sp, #0xc]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xf0
	mov r2, #0
	mov r3, #2
	bl ov92_022620D0
	mov r1, #0x52
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	mov r3, #2
	bl ov92_02261E88
	mov r1, #0x52
	str r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0x50
	mov r2, #1
	mov r3, #3
	bl ov92_02262018
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _022627B2
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _022627B2
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _022627B2
	cmp r0, #0
	bne _022627B4
_022627B2:
	b _022628EA
_022627B4:
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_022627DC:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #2
	bl ov92_02261F60
	mov r1, #0x51
	str r0, [sp, #0xc]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xf0
	mov r2, #0
	mov r3, #3
	bl ov92_02261E88
	mov r2, #1
	mov r1, #0x52
	str r0, [sp, #0x10]
	add r0, r4, #0
	str r2, [sp, #0x14]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, #0x50
	mov r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _022628EA
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _022628EA
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _022628EA
	cmp r0, #0
	beq _022628EA
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02262858:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #2
	bl ov92_022620D0
	mov r2, #1
	mov r1, #0x52
	str r0, [sp, #0xc]
	add r0, r4, #0
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, #0x50
	mov r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _022628EA
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _022628EA
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _022628EA
	cmp r0, #0
	beq _022628EA
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	mov r1, #0x53
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #1
	beq _022628D0
	add r0, r0, #1
	str r0, [r4, r1]
	mov r0, #1
	add r1, #0x1c
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_022628D0:
	mov r0, #0
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x1c
	ldr r0, [r4, r0]
	add r1, #0x1c
	add r0, r0, #1
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_022628E4:
	add r0, r5, #0
	bl DestroySysTask
_022628EA:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov92_02262548

	thumb_func_start ov92_022628F0
ov92_022628F0: ; 0x022628F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r3, _0226294C ; =ov92_02263E2C
	add r2, sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0226291A
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, #0x34
	ldrb r1, [r1]
	cmp r1, #1
	bne _02262924
_0226291A:
	add r0, r5, #0
	bl DestroySysTask
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_02262924:
	add r1, r0, #0
	sub r1, #0x14
	ldr r1, [r4, r1]
	cmp r1, #6
	bls _02262930
	b _02262CE2
_02262930:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0226293C: ; jump table
	.short _02262950 - _0226293C - 2 ; case 0
	.short _02262A88 - _0226293C - 2 ; case 1
	.short _02262B0A - _0226293C - 2 ; case 2
	.short _02262B84 - _0226293C - 2 ; case 3
	.short _02262BB0 - _0226293C - 2 ; case 4
	.short _02262C2C - _0226293C - 2 ; case 5
	.short _02262C96 - _0226293C - 2 ; case 6
	nop
_0226294C: .word ov92_02263E2C
_02262950:
	sub r0, #0x3c
	ldr r0, [r4, r0]
	mov r1, #0
	str r1, [sp]
	cmp r0, #0
	ble _02262A58
	add r5, r4, #0
_0226295E:
	mov r0, #0
	strh r0, [r5, #8]
	mov r0, #0x80
	strh r0, [r5, #0x14]
	mov r0, #0xa0
	strh r0, [r5, #0x16]
	mov r0, #0x40
	str r0, [r5, #0x18]
	mov r0, #0x18
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	mov r1, #1
	bl sub_0200DCE8
	add r1, r5, #0
	add r1, #0xa8
	mov r0, #0
	strh r0, [r1]
	add r1, r5, #0
	add r1, #0xb4
	mov r0, #0x80
	strh r0, [r1]
	add r1, r5, #0
	add r1, #0xb6
	mov r0, #0xa0
	strh r0, [r1]
	add r1, r5, #0
	add r1, #0xb8
	mov r0, #0x40
	str r0, [r1]
	add r1, r5, #0
	add r1, #0xbc
	mov r0, #0x18
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r3, #1
	ldr r0, [r5]
	add r1, sp, #8
	add r2, sp, #4
	lsl r3, r3, #0x14
	bl sub_0200DF70
	ldrh r0, [r5, #8]
	bl GF_SinDeg
	mov r1, #0x14
	ldrsh r1, [r5, r1]
	lsl r6, r1, #0xc
	ldr r1, [r5, #0x18]
	add r7, r1, #0
	mul r7, r0
	ldrh r0, [r5, #8]
	bl GF_CosDeg
	mov r1, #0x16
	ldrsh r1, [r5, r1]
	lsl r3, r1, #0xc
	ldr r1, [r5, #0x1c]
	add r2, r1, #0
	mul r2, r0
	add r2, r3, r2
	mov r3, #1
	ldr r0, [r5]
	add r1, r6, r7
	lsl r3, r3, #0x14
	bl sub_0200DF44
	add r0, r5, #0
	add r0, #0xa0
	mov r3, #1
	ldr r0, [r0]
	add r1, sp, #8
	add r2, sp, #4
	lsl r3, r3, #0x14
	bl sub_0200DF70
	add r0, r5, #0
	add r0, #0xa8
	ldrh r0, [r0]
	bl GF_SinDeg
	mov r1, #0xb4
	ldrsh r1, [r5, r1]
	lsl r6, r1, #0xc
	add r1, r5, #0
	add r1, #0xb8
	ldr r1, [r1]
	add r7, r1, #0
	mul r7, r0
	add r0, r5, #0
	add r0, #0xa8
	ldrh r0, [r0]
	bl GF_CosDeg
	mov r1, #0xb6
	add r2, r5, #0
	ldrsh r1, [r5, r1]
	add r2, #0xbc
	ldr r2, [r2]
	lsl r1, r1, #0xc
	mul r0, r2
	sub r2, r1, r0
	add r0, r5, #0
	add r0, #0xa0
	mov r3, #1
	ldr r0, [r0]
	add r1, r6, r7
	lsl r3, r3, #0x14
	bl sub_0200DF44
	ldr r0, [sp]
	add r5, #0x50
	add r0, r0, #1
	str r0, [sp]
	mov r0, #5
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	ldr r0, [sp]
	cmp r0, r1
	blt _0226295E
_02262A58:
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02262A88:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #3
	bl ov92_02261E88
	mov r1, #0x51
	str r0, [sp, #0xc]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xf0
	mov r2, #0
	mov r3, #2
	bl ov92_02261F60
	mov r1, #0x52
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	mov r3, #3
	bl ov92_02262018
	mov r2, #1
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	cmp r1, #0
	beq _02262B9C
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262B9C
	cmp r0, #0
	beq _02262B9C
	cmp r2, #0
	beq _02262B9C
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02262B0A:
	mov r3, #1
	mov r1, #0x51
	add r0, r4, #0
	str r3, [sp, #0xc]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, #0xf0
	mov r2, #0
	bl ov92_022620D0
	mov r1, #0x52
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	mov r3, #2
	bl ov92_02261E88
	mov r1, #0x52
	str r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0x50
	mov r2, #1
	mov r3, #3
	bl ov92_02262018
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _02262B9C
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262B9C
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _02262B9C
	cmp r0, #0
	beq _02262B9C
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02262B84:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	mov r2, #1
	ldr r1, [r4, r1]
	add r0, #0xf0
	add r3, r2, #0
	bl ov92_022620D0
	str r0, [sp, #0x10]
	cmp r0, #0
	bne _02262B9E
_02262B9C:
	b _02262CE8
_02262B9E:
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02262BB0:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #2
	bl ov92_02261F60
	mov r1, #0x51
	str r0, [sp, #0xc]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xf0
	mov r2, #0
	mov r3, #3
	bl ov92_02261E88
	mov r2, #1
	mov r1, #0x52
	str r0, [sp, #0x10]
	add r0, r4, #0
	str r2, [sp, #0x14]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, #0x50
	mov r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _02262CE8
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262CE8
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _02262CE8
	cmp r0, #0
	beq _02262CE8
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02262C2C:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #1
	bl ov92_022620D0
	mov r2, #1
	mov r1, #0x52
	str r0, [sp, #0xc]
	add r0, r4, #0
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, #0x50
	mov r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _02262CE8
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262CE8
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _02262CE8
	cmp r0, #0
	beq _02262CE8
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02262C96:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	mov r2, #1
	ldr r1, [r4, r1]
	add r0, #0xa0
	add r3, r2, #0
	bl ov92_022620D0
	str r0, [sp, #0xc]
	cmp r0, #0
	beq _02262CE8
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	mov r1, #0x53
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #1
	beq _02262CCE
	add r0, r0, #1
	str r0, [r4, r1]
	mov r0, #1
	add r1, #0x1c
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_02262CCE:
	mov r0, #0
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x1c
	ldr r0, [r4, r0]
	add r1, #0x1c
	add r0, r0, #1
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_02262CE2:
	add r0, r5, #0
	bl DestroySysTask
_02262CE8:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov92_022628F0

	thumb_func_start ov92_02262CEC
ov92_02262CEC: ; 0x02262CEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r3, _02262D48 ; =ov92_02263E4C
	add r2, sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02262D16
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, #0x34
	ldrb r1, [r1]
	cmp r1, #1
	bne _02262D20
_02262D16:
	add r0, r5, #0
	bl DestroySysTask
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_02262D20:
	add r1, r0, #0
	sub r1, #0x14
	ldr r1, [r4, r1]
	cmp r1, #6
	bls _02262D2C
	b _022630DE
_02262D2C:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02262D38: ; jump table
	.short _02262D4C - _02262D38 - 2 ; case 0
	.short _02262E84 - _02262D38 - 2 ; case 1
	.short _02262F06 - _02262D38 - 2 ; case 2
	.short _02262F80 - _02262D38 - 2 ; case 3
	.short _02262FAC - _02262D38 - 2 ; case 4
	.short _02263028 - _02262D38 - 2 ; case 5
	.short _02263092 - _02262D38 - 2 ; case 6
	nop
_02262D48: .word ov92_02263E4C
_02262D4C:
	sub r0, #0x3c
	ldr r0, [r4, r0]
	mov r1, #0
	str r1, [sp]
	cmp r0, #0
	ble _02262E54
	add r5, r4, #0
_02262D5A:
	mov r0, #0
	strh r0, [r5, #8]
	mov r0, #0x80
	strh r0, [r5, #0x14]
	mov r0, #0xa0
	strh r0, [r5, #0x16]
	mov r0, #0x40
	str r0, [r5, #0x18]
	mov r0, #0x18
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	mov r1, #1
	bl sub_0200DCE8
	add r1, r5, #0
	add r1, #0xa8
	mov r0, #0
	strh r0, [r1]
	add r1, r5, #0
	add r1, #0xb4
	mov r0, #0x80
	strh r0, [r1]
	add r1, r5, #0
	add r1, #0xb6
	mov r0, #0xa0
	strh r0, [r1]
	add r1, r5, #0
	add r1, #0xb8
	mov r0, #0x40
	str r0, [r1]
	add r1, r5, #0
	add r1, #0xbc
	mov r0, #0x18
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r3, #1
	ldr r0, [r5]
	add r1, sp, #8
	add r2, sp, #4
	lsl r3, r3, #0x14
	bl sub_0200DF70
	ldrh r0, [r5, #8]
	bl GF_SinDeg
	mov r1, #0x14
	ldrsh r1, [r5, r1]
	lsl r6, r1, #0xc
	ldr r1, [r5, #0x18]
	add r7, r1, #0
	mul r7, r0
	ldrh r0, [r5, #8]
	bl GF_CosDeg
	mov r1, #0x16
	ldrsh r1, [r5, r1]
	lsl r3, r1, #0xc
	ldr r1, [r5, #0x1c]
	add r2, r1, #0
	mul r2, r0
	add r2, r3, r2
	mov r3, #1
	ldr r0, [r5]
	add r1, r6, r7
	lsl r3, r3, #0x14
	bl sub_0200DF44
	add r0, r5, #0
	add r0, #0xa0
	mov r3, #1
	ldr r0, [r0]
	add r1, sp, #8
	add r2, sp, #4
	lsl r3, r3, #0x14
	bl sub_0200DF70
	add r0, r5, #0
	add r0, #0xa8
	ldrh r0, [r0]
	bl GF_SinDeg
	mov r1, #0xb4
	ldrsh r1, [r5, r1]
	lsl r6, r1, #0xc
	add r1, r5, #0
	add r1, #0xb8
	ldr r1, [r1]
	add r7, r1, #0
	mul r7, r0
	add r0, r5, #0
	add r0, #0xa8
	ldrh r0, [r0]
	bl GF_CosDeg
	mov r1, #0xb6
	add r2, r5, #0
	ldrsh r1, [r5, r1]
	add r2, #0xbc
	ldr r2, [r2]
	lsl r1, r1, #0xc
	mul r0, r2
	sub r2, r1, r0
	add r0, r5, #0
	add r0, #0xa0
	mov r3, #1
	ldr r0, [r0]
	add r1, r6, r7
	lsl r3, r3, #0x14
	bl sub_0200DF44
	ldr r0, [sp]
	add r5, #0x50
	add r0, r0, #1
	str r0, [sp]
	mov r0, #5
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	ldr r0, [sp]
	cmp r0, r1
	blt _02262D5A
_02262E54:
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02262E84:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #3
	bl ov92_02261E88
	mov r1, #0x51
	str r0, [sp, #0xc]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xf0
	mov r2, #0
	mov r3, #2
	bl ov92_02261F60
	mov r1, #0x52
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	mov r3, #3
	bl ov92_02262018
	mov r2, #1
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	cmp r1, #0
	beq _02262F98
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262F98
	cmp r0, #0
	beq _02262F98
	cmp r2, #0
	beq _02262F98
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02262F06:
	mov r3, #1
	mov r1, #0x51
	add r0, r4, #0
	str r3, [sp, #0xc]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, #0xf0
	mov r2, #0
	bl ov92_022620D0
	mov r1, #0x52
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	mov r3, #2
	bl ov92_02261E88
	mov r1, #0x52
	str r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0x50
	mov r2, #1
	mov r3, #3
	bl ov92_02262018
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _02262F98
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262F98
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _02262F98
	cmp r0, #0
	beq _02262F98
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02262F80:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	mov r2, #1
	ldr r1, [r4, r1]
	add r0, #0xf0
	add r3, r2, #0
	bl ov92_022620D0
	str r0, [sp, #0x10]
	cmp r0, #0
	bne _02262F9A
_02262F98:
	b _022630E4
_02262F9A:
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02262FAC:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #2
	bl ov92_02261F60
	mov r1, #0x51
	str r0, [sp, #0xc]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xf0
	mov r2, #0
	mov r3, #3
	bl ov92_02261E88
	mov r2, #1
	mov r1, #0x52
	str r0, [sp, #0x10]
	add r0, r4, #0
	str r2, [sp, #0x14]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, #0x50
	mov r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _022630E4
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _022630E4
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _022630E4
	cmp r0, #0
	beq _022630E4
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02263028:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xa0
	mov r2, #0
	mov r3, #1
	bl ov92_022620D0
	mov r2, #1
	mov r1, #0x52
	str r0, [sp, #0xc]
	add r0, r4, #0
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, #0x50
	mov r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _022630E4
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _022630E4
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _022630E4
	cmp r0, #0
	beq _022630E4
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0xf0
	bl ov92_02261E80
	add r0, r4, #0
	bl ov92_02261E80
	add r0, r4, #0
	add r0, #0x50
	bl ov92_02261E80
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02263092:
	mov r1, #0x51
	lsl r1, r1, #2
	add r0, r4, #0
	mov r2, #1
	ldr r1, [r4, r1]
	add r0, #0xa0
	add r3, r2, #0
	bl ov92_022620D0
	str r0, [sp, #0xc]
	cmp r0, #0
	beq _022630E4
	add r0, r4, #0
	add r0, #0xa0
	bl ov92_02261E80
	mov r1, #0x53
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #8
	beq _022630CA
	add r0, r0, #1
	str r0, [r4, r1]
	mov r0, #1
	add r1, #0x1c
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_022630CA:
	mov r0, #0
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x1c
	ldr r0, [r4, r0]
	add r1, #0x1c
	add r0, r0, #1
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_022630DE:
	add r0, r5, #0
	bl DestroySysTask
_022630E4:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov92_02262CEC

	thumb_func_start ov92_022630E8
ov92_022630E8: ; 0x022630E8
	mov r1, #0xfe
	lsl r1, r1, #0x16
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov92_022630E8

	thumb_func_start ov92_022630F8
ov92_022630F8: ; 0x022630F8
	add r3, r0, #0
	add r2, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	bx lr
	.balign 4, 0
	thumb_func_end ov92_022630F8

	thumb_func_start ov92_02263108
ov92_02263108: ; 0x02263108
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r4, r2, #0
	add r6, r0, #0
	ldr r0, [r5]
	ldr r1, [r4]
	bl _fmul
	add r7, r0, #0
	ldr r0, [r5, #4]
	ldr r1, [r4, #4]
	bl _fmul
	add r1, r0, #0
	add r0, r7, #0
	bl _fsub
	add r7, r0, #0
	ldr r0, [r5, #8]
	ldr r1, [r4, #8]
	bl _fmul
	add r1, r0, #0
	add r0, r7, #0
	bl _fsub
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0xc]
	bl _fmul
	add r1, r0, #0
	add r0, r7, #0
	bl _fsub
	str r0, [r6]
	ldr r0, [r5, #8]
	ldr r1, [r4, #0xc]
	bl _fmul
	add r7, r0, #0
	ldr r0, [r5]
	ldr r1, [r4, #4]
	bl _fmul
	str r0, [sp]
	ldr r0, [r5, #4]
	ldr r1, [r4]
	bl _fmul
	add r1, r0, #0
	ldr r0, [sp]
	bl _fadd
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #8]
	bl _fmul
	add r1, r0, #0
	add r0, r7, #0
	bl _fsub
	str r0, [r6, #4]
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #4]
	bl _fmul
	add r7, r0, #0
	ldr r0, [r5, #8]
	ldr r1, [r4]
	bl _fmul
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r4, #8]
	bl _fmul
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	ldr r1, [r4, #0xc]
	bl _fmul
	add r1, r0, #0
	ldr r0, [sp, #8]
	bl _fsub
	add r1, r0, #0
	ldr r0, [sp, #4]
	bl _fadd
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	str r0, [r6, #8]
	ldr r0, [r5, #0xc]
	ldr r1, [r4]
	bl _fmul
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r4, #0xc]
	bl _fmul
	add r7, r0, #0
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	bl _fmul
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	add r7, r0, #0
	ldr r0, [r5, #8]
	ldr r1, [r4, #4]
	bl _fmul
	add r1, r0, #0
	add r0, r7, #0
	bl _fsub
	add r1, r0, #0
	ldr r0, [sp, #0xc]
	bl _fadd
	str r0, [r6, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov92_02263108

	thumb_func_start ov92_02263218
ov92_02263218: ; 0x02263218
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r1, r0, #0
	bl _fadd
	add r4, r0, #0
	ldr r0, [r5, #8]
	add r1, r0, #0
	bl _fadd
	add r6, r0, #0
	ldr r0, [r5]
	add r1, r0, #0
	bl _fmul
	add r7, r0, #0
	ldr r0, [r5, #4]
	add r1, r0, #0
	bl _fadd
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	add r1, r0, #0
	add r0, r6, #0
	bl _fadd
	add r1, r0, #0
	add r0, r4, #0
	bl _fadd
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov92_02263218

	thumb_func_start ov92_0226325C
ov92_0226325C: ; 0x0226325C
	push {r4, lr}
	add r4, r0, #0
	bl ov92_02263218
	mov r1, #0
	bl _fgr
	bls _02263286
	add r0, r4, #0
	bl ov92_02263218
	add r1, r0, #0
	ldr r0, _022632B0 ; =0x45800000
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0226329C
_02263286:
	add r0, r4, #0
	bl ov92_02263218
	add r1, r0, #0
	ldr r0, _022632B0 ; =0x45800000
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0226329C:
	bl _ffix
	bl FX_Sqrt
	bl _fflt
	ldr r1, _022632B0 ; =0x45800000
	bl _fdiv
	pop {r4, pc}
	.balign 4, 0
_022632B0: .word 0x45800000
	thumb_func_end ov92_0226325C

	thumb_func_start ov92_022632B4
ov92_022632B4: ; 0x022632B4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl _fdiv
	str r0, [r5]
	ldr r0, [r4, #4]
	add r1, r6, #0
	bl _fdiv
	str r0, [r5, #4]
	ldr r0, [r4, #8]
	add r1, r6, #0
	bl _fdiv
	str r0, [r5, #8]
	ldr r0, [r4, #0xc]
	add r1, r6, #0
	bl _fdiv
	str r0, [r5, #0xc]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov92_022632B4

	thumb_func_start ov92_022632E8
ov92_022632E8: ; 0x022632E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r1, #0
	add r4, r0, #0
	ldr r0, [r5, #4]
	add r1, r0, #0
	bl _fmul
	bl _f2d
	add r3, r1, #0
	mov r1, #1
	add r2, r0, #0
	mov r0, #0
	lsl r1, r1, #0x1e
	bl _dmul
	bl _d2f
	str r0, [sp, #8]
	ldr r0, [r5, #8]
	add r1, r0, #0
	bl _fmul
	bl _f2d
	add r3, r1, #0
	mov r1, #1
	add r2, r0, #0
	mov r0, #0
	lsl r1, r1, #0x1e
	bl _dmul
	bl _d2f
	str r0, [sp, #0xc]
	ldr r0, [r5, #0xc]
	add r1, r0, #0
	bl _fmul
	bl _f2d
	add r3, r1, #0
	mov r1, #1
	add r2, r0, #0
	mov r0, #0
	lsl r1, r1, #0x1e
	bl _dmul
	bl _d2f
	add r6, r0, #0
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	bl _fmul
	bl _f2d
	add r3, r1, #0
	mov r1, #1
	add r2, r0, #0
	mov r0, #0
	lsl r1, r1, #0x1e
	bl _dmul
	bl _d2f
	str r0, [sp, #0x10]
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	bl _fmul
	bl _f2d
	add r3, r1, #0
	mov r1, #1
	add r2, r0, #0
	mov r0, #0
	lsl r1, r1, #0x1e
	bl _dmul
	bl _d2f
	str r0, [sp, #0x14]
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #4]
	bl _fmul
	bl _f2d
	add r3, r1, #0
	mov r1, #1
	add r2, r0, #0
	mov r0, #0
	lsl r1, r1, #0x1e
	bl _dmul
	bl _d2f
	str r0, [sp, #0x18]
	ldr r0, [r5, #4]
	ldr r1, [r5]
	bl _fmul
	bl _f2d
	add r3, r1, #0
	mov r1, #1
	add r2, r0, #0
	mov r0, #0
	lsl r1, r1, #0x1e
	bl _dmul
	bl _d2f
	str r0, [sp, #0x1c]
	ldr r0, [r5, #8]
	ldr r1, [r5]
	bl _fmul
	bl _f2d
	add r3, r1, #0
	mov r1, #1
	add r2, r0, #0
	mov r0, #0
	lsl r1, r1, #0x1e
	bl _dmul
	bl _d2f
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	bl _fmul
	bl _f2d
	add r3, r1, #0
	mov r1, #1
	add r2, r0, #0
	mov r0, #0
	lsl r1, r1, #0x1e
	bl _dmul
	bl _d2f
	add r5, r0, #0
	ldr r0, [sp, #0xc]
	bl _f2d
	add r3, r1, #0
	add r2, r0, #0
	ldr r1, _022634F4 ; =0x3FF00000
	mov r0, #0
	bl _dsub
	str r0, [sp, #0x20]
	str r1, [sp, #4]
	add r0, r6, #0
	bl _f2d
	add r2, r0, #0
	add r3, r1, #0
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #4]
	bl _dsub
	bl _d2f
	str r0, [r4]
	ldr r0, [sp, #0x10]
	add r1, r5, #0
	bl _fadd
	str r0, [r4, #4]
	ldr r0, [sp, #0x18]
	add r1, r7, #0
	bl _fsub
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0xc]
	ldr r0, [sp, #0x10]
	add r1, r5, #0
	bl _fsub
	str r0, [r4, #0x10]
	add r0, r6, #0
	bl _f2d
	add r3, r1, #0
	add r2, r0, #0
	ldr r1, _022634F4 ; =0x3FF00000
	mov r0, #0
	bl _dsub
	add r6, r0, #0
	ldr r0, [sp, #8]
	add r5, r1, #0
	bl _f2d
	add r2, r0, #0
	add r3, r1, #0
	add r0, r6, #0
	add r1, r5, #0
	bl _dsub
	bl _d2f
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	bl _fadd
	str r0, [r4, #0x18]
	mov r0, #0
	str r0, [r4, #0x1c]
	ldr r0, [sp, #0x18]
	add r1, r7, #0
	bl _fadd
	str r0, [r4, #0x20]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	bl _fsub
	str r0, [r4, #0x24]
	ldr r0, [sp, #8]
	bl _f2d
	add r3, r1, #0
	add r2, r0, #0
	ldr r1, _022634F4 ; =0x3FF00000
	mov r0, #0
	bl _dsub
	add r6, r0, #0
	ldr r0, [sp, #0xc]
	add r5, r1, #0
	bl _f2d
	add r2, r0, #0
	add r3, r1, #0
	add r0, r6, #0
	add r1, r5, #0
	bl _dsub
	bl _d2f
	str r0, [r4, #0x28]
	mov r0, #0
	str r0, [r4, #0x2c]
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	str r0, [r4, #0x38]
	mov r0, #0xfe
	lsl r0, r0, #0x16
	str r0, [r4, #0x3c]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_022634F4: .word 0x3FF00000
	thumb_func_end ov92_022632E8

	thumb_func_start ov92_022634F8
ov92_022634F8: ; 0x022634F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _0226351C
	ldr r1, [r5]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0226352A
_0226351C:
	ldr r1, [r5]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0226352A:
	bl _ffix
	str r0, [r4]
	ldr r0, [r5, #4]
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _0226354E
	ldr r1, [r5, #4]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0226355C
_0226354E:
	ldr r1, [r5, #4]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0226355C:
	bl _ffix
	str r0, [r4, #4]
	ldr r0, [r5, #8]
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _02263580
	ldr r1, [r5, #8]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0226358E
_02263580:
	ldr r1, [r5, #8]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0226358E:
	bl _ffix
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _022635B2
	ldr r1, [r5, #0xc]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022635C0
_022635B2:
	ldr r1, [r5, #0xc]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022635C0:
	bl _ffix
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x10]
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _022635E4
	ldr r1, [r5, #0x10]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022635F2
_022635E4:
	ldr r1, [r5, #0x10]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022635F2:
	bl _ffix
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _02263616
	ldr r1, [r5, #0x14]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02263624
_02263616:
	ldr r1, [r5, #0x14]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02263624:
	bl _ffix
	str r0, [r4, #0x14]
	ldr r0, [r5, #0x18]
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _02263648
	ldr r1, [r5, #0x18]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02263656
_02263648:
	ldr r1, [r5, #0x18]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02263656:
	bl _ffix
	str r0, [r4, #0x18]
	ldr r0, [r5, #0x1c]
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _0226367A
	ldr r1, [r5, #0x1c]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02263688
_0226367A:
	ldr r1, [r5, #0x1c]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02263688:
	bl _ffix
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x20]
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _022636AC
	ldr r1, [r5, #0x20]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022636BA
_022636AC:
	ldr r1, [r5, #0x20]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022636BA:
	bl _ffix
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _022636DE
	ldr r1, [r5, #0x24]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022636EC
_022636DE:
	ldr r1, [r5, #0x24]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022636EC:
	bl _ffix
	str r0, [r4, #0x24]
	ldr r0, [r5, #0x28]
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _02263710
	ldr r1, [r5, #0x28]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0226371E
_02263710:
	ldr r1, [r5, #0x28]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0226371E:
	bl _ffix
	str r0, [r4, #0x28]
	ldr r0, [r5, #0x2c]
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _02263742
	ldr r1, [r5, #0x2c]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02263750
_02263742:
	ldr r1, [r5, #0x2c]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02263750:
	bl _ffix
	str r0, [r4, #0x2c]
	ldr r0, [r5, #0x30]
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _02263774
	ldr r1, [r5, #0x30]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02263782
_02263774:
	ldr r1, [r5, #0x30]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02263782:
	bl _ffix
	str r0, [r4, #0x30]
	ldr r0, [r5, #0x34]
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _022637A6
	ldr r1, [r5, #0x34]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022637B4
_022637A6:
	ldr r1, [r5, #0x34]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022637B4:
	bl _ffix
	str r0, [r4, #0x34]
	ldr r0, [r5, #0x38]
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _022637D8
	ldr r1, [r5, #0x38]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022637E6
_022637D8:
	ldr r1, [r5, #0x38]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022637E6:
	bl _ffix
	str r0, [r4, #0x38]
	ldr r0, [r5, #0x3c]
	mov r1, #0
	bl _fgr
	ldr r0, _02263820 ; =0x45800000
	bls _0226380A
	ldr r1, [r5, #0x3c]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02263818
_0226380A:
	ldr r1, [r5, #0x3c]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02263818:
	bl _ffix
	str r0, [r4, #0x3c]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02263820: .word 0x45800000
	thumb_func_end ov92_022634F8

	thumb_func_start ov92_02263824
ov92_02263824: ; 0x02263824
	push {r4, lr}
	sub sp, #0x40
	add r4, r1, #0
	add r1, sp, #0
	bl ov92_022634F8
	add r0, sp, #0
	add r1, r4, #0
	bl MTX_Copy44To43_
	add sp, #0x40
	pop {r4, pc}
	thumb_func_end ov92_02263824

	.rodata

_0226383C:
	.word ov92_0225C540, ov92_0225C58C, 0
	.word ov92_0225C558, ov92_0225C588, 0
	.word ov92_0225C564, ov92_0225C590, 0
	.word ov92_0225C578, ov92_0225C594, 0
	.word ov92_0225C584, ov92_0225C598, 0

ov92_02263878: ; 0x02263878
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x06, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov92_02263884: ; 0x02263884
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00

ov92_02263890: ; 0x02263890
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov92_022638A0: ; 0x022638A0
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov92_022638B0: ; 0x022638B0
	.byte 0x00, 0x00, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10

ov92_022638C0: ; 0x022638C0
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00
	.byte 0x10, 0x00, 0x10, 0x00

ov92_022638D4: ; 0x022638D4
	.byte 0x80, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov92_022638EC: ; 0x022638EC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov92_0226390C: ; 0x0226390C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00

ov92_02263934: ; 0x02263934
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x05, 0x05, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x07, 0x05
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x09, 0x04, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov92_022639A4: ; 0x022639A4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x16, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x17, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x19, 0x01
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x1B, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov92_02263A14: ; 0x02263A14
	.byte 0x2C, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x31, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x31, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x31, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x31, 0x00, 0x00, 0x00

ov92_02263A94: ; 0x02263A94
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD8, 0xFF, 0x00, 0x00, 0xE2, 0xFF
	.byte 0x00, 0x00, 0xEC, 0xFF, 0x00, 0x00, 0xF6, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00
	.byte 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD8, 0xFF, 0x00, 0x00, 0xE2, 0xFF
	.byte 0x00, 0x00, 0xEC, 0xFF, 0x00, 0x00, 0xF6, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00
	.byte 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov92_02263B54: ; 0x02263B54
	.byte 0x48, 0x00, 0xB4, 0x00, 0x18, 0x00, 0xE8, 0x00

ov92_02263B5C: ; 0x02263B5C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00

ov92_02263B68: ; 0x02263B68
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xFF, 0xFF
	.byte 0x00, 0xF0, 0xFF, 0xFF

ov92_02263B74: ; 0x02263B74
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x55, 0x00, 0xAA, 0x00, 0x00, 0x00, 0x40, 0x00, 0x80, 0x00, 0xC0, 0x00

ov92_02263B8C: ; 0x02263B8C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov92_02263BCC: ; 0x02263BCC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov92_02263BEC: ; 0x02263BEC
	.byte 0x0C, 0x00, 0x08, 0x00
	.byte 0x08, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x08, 0x00, 0x08, 0x00, 0x02, 0x00, 0x13, 0x00, 0x08, 0x00
	.byte 0x08, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08, 0x00
	.byte 0x08, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x08, 0x00, 0x08, 0x00, 0x02, 0x00, 0x17, 0x00, 0x08, 0x00
	.byte 0x08, 0x00, 0x02, 0x00

ov92_02263C34: ; 0x02263C34
	.byte 0xFE, 0x80, 0x80, 0x30, 0xFF, 0x00, 0x00, 0x00

ov92_02263C3C: ; 0x02263C3C
	.byte 0xFE, 0x80, 0x80, 0x40
	.byte 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x04, 0x00, 0xBC, 0x02, 0x78, 0x05
	.byte 0x34, 0x08, 0xF0, 0x0A, 0x78, 0x00, 0x5A, 0x00, 0x3C, 0x00, 0x2D, 0x00

ov92_02263C5C: ; 0x02263C5C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x40, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00

ov92_02263C68: ; 0x02263C68
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x06, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov92_02263C74: ; 0x02263C74
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00

ov92_02263C80: ; 0x02263C80
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00

ov92_02263C8C: ; 0x02263C8C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x40, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00
	.byte 0x29, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00
	.byte 0xFE, 0xFF, 0xFE, 0xFF, 0xFE, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x03, 0x00
	.byte 0x04, 0x00, 0x04, 0x00, 0x06, 0x00, 0x06, 0x00, 0x07, 0x00, 0x07, 0x00, 0x08, 0x00, 0x08, 0x00

ov92_02263CD0: ; 0x02263CD0
	.byte 0x1F, 0x00, 0x00, 0x00

ov92_02263CD4: ; 0x02263CD4
	.byte 0x20, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00
	.byte 0x25, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xEE, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFD, 0xFF, 0xFD, 0xFF, 0xFE, 0xFF, 0xFE, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xEE, 0x00, 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00

ov92_02263D84: ; 0x02263D84
	.byte 0x13, 0x00, 0x00, 0x00

ov92_02263D88: ; 0x02263D88
	.byte 0x2D, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x28, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00

ov92_02263E04: ; 0x02263E04
	.byte 0xBC, 0x00, 0xBC, 0x00, 0xB4, 0x00, 0xB4, 0x00

ov92_02263E0C: ; 0x02263E0C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov92_02263E1C: ; 0x02263E1C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov92_02263E2C: ; 0x02263E2C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov92_02263E3C: ; 0x02263E3C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov92_02263E4C: ; 0x02263E4C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov92_02263E5C: ; 0x02263E5C
	.byte 0x60, 0x00, 0x3A, 0x00
	.byte 0xE6, 0x00, 0x30, 0x00, 0x80, 0x00, 0x20, 0x00, 0x28, 0x00, 0x40, 0x00, 0xB4, 0x00, 0x30, 0x00

ov92_02263E70: ; 0x02263E70
	.byte 0x00, 0xB0, 0xFF, 0xFF, 0x00, 0x30, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xD0, 0xFF, 0xFF
	.byte 0x00, 0x30, 0x00, 0x00, 0x00, 0xE0, 0xFF, 0xFF

ov92_02263E88: ; 0x02263E88
	.byte 0x00, 0x40, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00
	.byte 0x00, 0xC0, 0xFF, 0xFF, 0x00, 0xB0, 0xFF, 0xFF, 0x00, 0xD0, 0xFF, 0xFF, 0x00, 0x20, 0x00, 0x00

ov92_02263EA0: ; 0x02263EA0
	.byte 0x96, 0x00, 0x00, 0x00

ov92_02263EA4: ; 0x02263EA4
	.byte 0x00, 0x00, 0x00, 0x00

ov92_02263EA8: ; 0x02263EA8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov92_02263EC4: ; 0x02263EC4
	.byte 0x00, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov92_02261BA0
	.byte 0x96, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov92_022621A4
	.byte 0x96, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov92_022621A4
	.byte 0x96, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov92_02262548
	.byte 0x96, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov92_02262548
	.byte 0x96, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov92_022628F0
	.byte 0x96, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov92_02262CEC
	.byte 0x96, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov92_02262CEC

	.data

_02264020:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02264160:
	; 0x02264160
