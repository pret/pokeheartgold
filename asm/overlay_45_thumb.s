	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov45_02229EE0
ov45_02229EE0: ; 0x02229EE0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _02229F68 ; =FS_OVERLAY_ID(OVY_42)
	mov r1, #2
	bl HandleLoadOverlay
	bl LoadDwcOverlay
	bl LoadOVY38
	mov r0, #3
	bl sub_02039FD8
	mov r2, #5
	mov r0, #3
	mov r1, #0x6f
	lsl r2, r2, #0xc
	bl CreateHeap
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0x6f
	bl OverlayManager_CreateAndGetData
	add r5, r0, #0
	add r2, r5, #0
	mov r1, #0x10
	mov r0, #0
_02229F18:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02229F18
	add r0, r4, #0
	bl OverlayManager_GetParentWork
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #0x6f
	str r0, [r5]
	bl ov45_02229FF4
	str r0, [r5, #4]
	mov r0, #0x6f
	str r0, [sp]
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	ldr r2, [r4]
	ldr r3, [r5, #4]
	bl ov45_0222CD1C
	str r0, [r5, #8]
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	ldr r0, _02229F6C ; =ov45_02229FE0
	add r1, r5, #0
	mov r2, #0
	bl sub_0200E374
	str r0, [r5, #0xc]
	ldr r0, [r5, #8]
	bl ov45_0222CD84
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02229F68: .word FS_OVERLAY_ID(OVY_42)
_02229F6C: .word ov45_02229FE0
	thumb_func_end ov45_02229EE0

	thumb_func_start ov45_02229F70
ov45_02229F70: ; 0x02229F70
	push {r3, r4, r5, lr}
	bl OverlayManager_GetData
	add r5, r0, #0
	ldr r0, [r5, #8]
	bl ov45_0222CD90
	add r4, r0, #0
	ldr r0, [r5, #4]
	bl ov45_0222A15C
	cmp r4, #1
	bne _02229F8E
	mov r0, #1
	pop {r3, r4, r5, pc}
_02229F8E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_02229F70

	thumb_func_start ov45_02229F94
ov45_02229F94: ; 0x02229F94
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl DestroySysTask
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	ldr r0, [r4, #8]
	bl ov45_0222CD68
	ldr r0, [r4, #4]
	bl ov45_0222A0F0
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x6f
	bl DestroyHeap
	ldr r0, _02229FDC ; =FS_OVERLAY_ID(OVY_42)
	bl UnloadOverlayByID
	bl UnloadOVY38
	bl UnloadDwcOverlay
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02229FDC: .word FS_OVERLAY_ID(OVY_42)
	thumb_func_end ov45_02229F94

	thumb_func_start ov45_02229FE0
ov45_02229FE0: ; 0x02229FE0
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #8]
	bl ov45_0222CDC0
	ldr r0, [r4, #4]
	bl ov45_0222A1F8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_02229FE0

	thumb_func_start ov45_02229FF4
ov45_02229FF4: ; 0x02229FF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r1, #0
	mov r1, #0x53
	add r5, r0, #0
	add r0, r7, #0
	lsl r1, r1, #4
	bl AllocFromHeap
	mov r2, #0x53
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl memset
	ldr r0, _0222A0CC ; =0x00000528
	str r5, [r4]
	str r7, [r4, r0]
	ldr r0, _0222A0D0 ; =ov45_0222B2B4
	mov r2, #0x94
	str r0, [sp, #4]
	ldr r0, _0222A0D4 ; =ov45_0222B470
	add r3, sp, #4
	str r0, [sp, #8]
	ldr r0, _0222A0D8 ; =ov45_0222B530
	str r0, [sp, #0xc]
	ldr r0, _0222A0DC ; =ov45_0222B5A0
	str r0, [sp, #0x10]
	ldr r0, _0222A0E0 ; =ov45_0222B75C
	str r0, [sp, #0x14]
	str r4, [sp]
	ldr r1, [r4]
	add r0, r7, #0
	bl ov45_0222E5D4
	add r0, r7, #0
	bl ov45_0222D860
	str r0, [r4, #4]
	mov r6, #0
	add r5, r4, #0
_0222A046:
	add r0, r7, #0
	bl PlayerProfile_new
	add r1, r5, #0
	add r1, #0xe8
	add r6, r6, #1
	add r5, r5, #4
	str r0, [r1]
	cmp r6, #4
	blt _0222A046
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r1, [r4]
	add r0, r4, r0
	add r2, r7, #0
	bl ov45_0222B8A0
	mov r0, #7
	lsl r0, r0, #6
	add r0, r4, r0
	bl ov45_0222BD40
	mov r0, #0x7a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov45_0222BD30
	ldr r0, _0222A0E4 ; =ov45_02254AC4
	mov r1, #8
	add r2, r4, #0
	bl ov45_0222EE20
	mov r0, #0x7f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov45_0222BC3C
	mov r0, #0x83
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov45_0222C388
	mov r0, #0xeb
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov45_0222C8AC
	mov r0, #0xf9
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r7, #0
	bl ov45_0222C978
	ldr r0, _0222A0E8 ; =0x000004BC
	ldr r1, [r4]
	add r0, r4, r0
	bl ov45_0222CB44
	ldr r0, _0222A0EC ; =0x00000508
	add r1, r7, #0
	add r0, r4, r0
	bl ov45_0222BCC8
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222A0CC: .word 0x00000528
_0222A0D0: .word ov45_0222B2B4
_0222A0D4: .word ov45_0222B470
_0222A0D8: .word ov45_0222B530
_0222A0DC: .word ov45_0222B5A0
_0222A0E0: .word ov45_0222B75C
_0222A0E4: .word ov45_02254AC4
_0222A0E8: .word 0x000004BC
_0222A0EC: .word 0x00000508
	thumb_func_end ov45_02229FF4

	thumb_func_start ov45_0222A0F0
ov45_0222A0F0: ; 0x0222A0F0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	mov r0, #0x4a
	lsl r0, r0, #2
	add r0, r6, r0
	add r1, sp, #0
	bl ov45_0222AB0C
	ldr r0, [r6]
	bl sub_020318E8
	ldr r1, [sp]
	add r4, r0, #0
	bl sub_020318FC
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl sub_02031900
	ldr r0, _0222A158 ; =0x00000508
	add r0, r6, r0
	bl ov45_0222BCD8
	mov r0, #0xf9
	lsl r0, r0, #2
	add r0, r6, r0
	bl ov45_0222C994
	bl ov45_0222EE80
	ldr r0, [r6, #4]
	bl ov45_0222D890
	mov r4, #0
	add r5, r6, #0
_0222A138:
	add r0, r5, #0
	add r0, #0xe8
	ldr r0, [r0]
	bl FreeToHeap
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0222A138
	bl ov45_0222E688
	add r0, r6, #0
	bl FreeToHeap
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222A158: .word 0x00000508
	thumb_func_end ov45_0222A0F0

	thumb_func_start ov45_0222A15C
ov45_0222A15C: ; 0x0222A15C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl ov45_0222D8A4
	add r0, sp, #0
	bl ov45_0222ECB8
	add r1, sp, #0
	add r0, r1, #0
	ldmia r0!, {r2, r3}
	add r0, r4, #0
	add r0, #0xd8
	stmia r0!, {r2, r3}
	add r0, r4, #0
	add r0, #0xd4
	bl ov45_0222D500
	add r0, r4, #0
	bl ov45_0222B840
	mov r0, #7
	lsl r0, r0, #6
	add r0, r4, r0
	bl ov45_0222BE5C
	mov r0, #0x7a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov45_0222BD30
	add r0, r4, #0
	add r0, #0xf8
	bl ov45_0222BB58
	mov r2, #0x7f
	lsl r2, r2, #2
	ldr r3, _0222A1EC ; =0x0000049C
	add r0, r4, r2
	add r1, r4, #0
	add r2, #0x10
	add r1, #0xf8
	add r2, r4, r2
	add r3, r4, r3
	bl ov45_0222BB60
	mov r0, #0x3a
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov45_0222BCB8
	mov r0, #0x83
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov45_0222C3B0
	ldr r0, _0222A1EC ; =0x0000049C
	add r0, r4, r0
	bl ov45_0222CAA0
	ldr r0, _0222A1F0 ; =0x000004BC
	add r0, r4, r0
	bl ov45_0222CCDC
	cmp r0, #1
	bne _0222A1E8
	ldr r0, _0222A1F4 ; =0x0000052C
	mov r1, #1
	str r1, [r4, r0]
_0222A1E8:
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_0222A1EC: .word 0x0000049C
_0222A1F0: .word 0x000004BC
_0222A1F4: .word 0x0000052C
	thumb_func_end ov45_0222A15C

	thumb_func_start ov45_0222A1F8
ov45_0222A1F8: ; 0x0222A1F8
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222A1F8

	thumb_func_start ov45_0222A1FC
ov45_0222A1FC: ; 0x0222A1FC
	ldr r1, _0222A204 ; =0x0000052C
	ldr r0, [r0, r1]
	bx lr
	nop
_0222A204: .word 0x0000052C
	thumb_func_end ov45_0222A1FC

	thumb_func_start ov45_0222A208
ov45_0222A208: ; 0x0222A208
	ldr r3, _0222A20C ; =ov45_0222E9BC
	bx r3
	.balign 4, 0
_0222A20C: .word ov45_0222E9BC
	thumb_func_end ov45_0222A208

	thumb_func_start ov45_0222A210
ov45_0222A210: ; 0x0222A210
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov45_0222A210

	thumb_func_start ov45_0222A214
ov45_0222A214: ; 0x0222A214
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x42
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0xc
	bl ov45_0222B79C
	add r4, #0xc
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov45_0222A214

	thumb_func_start ov45_0222A22C
ov45_0222A22C: ; 0x0222A22C
	add r0, #0xd4
	bx lr
	thumb_func_end ov45_0222A22C

	thumb_func_start ov45_0222A230
ov45_0222A230: ; 0x0222A230
	push {r3, r4}
	mov r2, #1
	add r3, r2, #0
	lsl r3, r1
	add r1, r0, #0
	add r1, #0xf8
	ldr r1, [r1]
	tst r1, r3
	beq _0222A256
	add r1, r0, #0
	add r1, #0xf8
	ldr r4, [r1]
	mvn r1, r3
	and r1, r4
	add r0, #0xf8
	str r1, [r0]
	add r0, r2, #0
	pop {r3, r4}
	bx lr
_0222A256:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov45_0222A230

	thumb_func_start ov45_0222A25C
ov45_0222A25C: ; 0x0222A25C
	push {r3, r4}
	mov r2, #1
	add r3, r2, #0
	lsl r3, r1
	add r1, r0, #0
	add r1, #0xfc
	ldr r1, [r1]
	tst r1, r3
	beq _0222A282
	add r1, r0, #0
	add r1, #0xfc
	ldr r4, [r1]
	mvn r1, r3
	and r1, r4
	add r0, #0xfc
	str r1, [r0]
	add r0, r2, #0
	pop {r3, r4}
	bx lr
_0222A282:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov45_0222A25C

	thumb_func_start ov45_0222A288
ov45_0222A288: ; 0x0222A288
	mov r2, #1
	lsl r2, r2, #8
	ldr r3, [r0, r2]
	mov r0, #1
	add r2, r0, #0
	lsl r2, r1
	add r1, r3, #0
	tst r1, r2
	bne _0222A29C
	mov r0, #0
_0222A29C:
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222A288

	thumb_func_start ov45_0222A2A0
ov45_0222A2A0: ; 0x0222A2A0
	push {r4, r5}
	mov r4, #1
	add r5, r4, #0
	lsl r5, r1
	mov r1, #0x41
	lsl r1, r1, #2
	ldr r3, [r0, r1]
	add r2, r3, #0
	tst r2, r5
	beq _0222A2C0
	mvn r2, r5
	and r2, r3
	str r2, [r0, r1]
	add r0, r4, #0
	pop {r4, r5}
	bx lr
_0222A2C0:
	mov r0, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222A2A0

	thumb_func_start ov45_0222A2C8
ov45_0222A2C8: ; 0x0222A2C8
	ldr r0, [r0]
	bx lr
	thumb_func_end ov45_0222A2C8

	thumb_func_start ov45_0222A2CC
ov45_0222A2CC: ; 0x0222A2CC
	push {r3, lr}
	cmp r0, #0
	bne _0222A2D6
	bl GF_AssertFail
_0222A2D6:
	mov r0, #4
	bl ov45_0222ECDC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov45_0222A2CC

	thumb_func_start ov45_0222A2E0
ov45_0222A2E0: ; 0x0222A2E0
	push {r4, lr}
	add r4, r0, #0
	bne _0222A2EA
	bl GF_AssertFail
_0222A2EA:
	ldr r0, _0222A2F4 ; =0x0000020B
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	pop {r4, pc}
	.balign 4, 0
_0222A2F4: .word 0x0000020B
	thumb_func_end ov45_0222A2E0

	thumb_func_start ov45_0222A2F8
ov45_0222A2F8: ; 0x0222A2F8
	push {r4, lr}
	add r4, r0, #0
	bne _0222A302
	bl GF_AssertFail
_0222A302:
	ldr r0, _0222A30C ; =0x0000020B
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	pop {r4, pc}
	.balign 4, 0
_0222A30C: .word 0x0000020B
	thumb_func_end ov45_0222A2F8

	thumb_func_start ov45_0222A310
ov45_0222A310: ; 0x0222A310
	ldr r2, _0222A320 ; =0x0000020B
	mov r1, #0xf0
	ldrb r3, [r0, r2]
	bic r3, r1
	mov r1, #0x10
	orr r1, r3
	strb r1, [r0, r2]
	bx lr
	.balign 4, 0
_0222A320: .word 0x0000020B
	thumb_func_end ov45_0222A310

	thumb_func_start ov45_0222A324
ov45_0222A324: ; 0x0222A324
	mov r1, #0x7f
	lsl r1, r1, #2
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end ov45_0222A324

	thumb_func_start ov45_0222A330
ov45_0222A330: ; 0x0222A330
	mov r1, #0x7f
	lsl r1, r1, #2
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end ov45_0222A330

	thumb_func_start ov45_0222A33C
ov45_0222A33C: ; 0x0222A33C
	mov r1, #0x7f
	lsl r1, r1, #2
	ldrb r2, [r0, r1]
	lsl r2, r2, #0x1e
	lsr r2, r2, #0x1f
	cmp r2, #1
	bne _0222A356
	add r1, r1, #4
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bgt _0222A356
	mov r0, #1
	bx lr
_0222A356:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222A33C

	thumb_func_start ov45_0222A35C
ov45_0222A35C: ; 0x0222A35C
	mov r1, #0x81
	lsl r1, r1, #2
	ldrsh r2, [r0, r1]
	cmp r2, #0
	bgt _0222A370
	sub r1, #8
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1e
	bx lr
_0222A370:
	mov r0, #0
	bx lr
	thumb_func_end ov45_0222A35C

	thumb_func_start ov45_0222A374
ov45_0222A374: ; 0x0222A374
	mov r1, #0x7f
	lsl r1, r1, #2
	ldrb r2, [r0, r1]
	lsl r2, r2, #0x1b
	lsr r2, r2, #0x1f
	cmp r2, #1
	bne _0222A38E
	add r1, #0xa
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bgt _0222A38E
	mov r0, #1
	bx lr
_0222A38E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222A374

	thumb_func_start ov45_0222A394
ov45_0222A394: ; 0x0222A394
	mov r1, #0x7f
	lsl r1, r1, #2
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1e
	bx lr
	thumb_func_end ov45_0222A394

	thumb_func_start ov45_0222A3A0
ov45_0222A3A0: ; 0x0222A3A0
	ldr r1, [r0, #8]
	cmp r1, #1
	bne _0222A3B2
	ldr r1, _0222A3B8 ; =0x00000202
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bgt _0222A3B2
	mov r0, #1
	bx lr
_0222A3B2:
	mov r0, #0
	bx lr
	nop
_0222A3B8: .word 0x00000202
	thumb_func_end ov45_0222A3A0

	thumb_func_start ov45_0222A3BC
ov45_0222A3BC: ; 0x0222A3BC
	ldr r1, _0222A3D0 ; =0x00000202
	ldrsh r2, [r0, r1]
	cmp r2, #0
	bgt _0222A3CA
	sub r1, r1, #5
	ldrb r0, [r0, r1]
	bx lr
_0222A3CA:
	mov r0, #1
	bx lr
	nop
_0222A3D0: .word 0x00000202
	thumb_func_end ov45_0222A3BC

	thumb_func_start ov45_0222A3D4
ov45_0222A3D4: ; 0x0222A3D4
	ldr r1, _0222A3E8 ; =0x00000202
	ldrsh r2, [r0, r1]
	cmp r2, #0
	bgt _0222A3E2
	sub r1, r1, #4
	ldrb r0, [r0, r1]
	bx lr
_0222A3E2:
	mov r0, #7
	bx lr
	nop
_0222A3E8: .word 0x00000202
	thumb_func_end ov45_0222A3D4

	thumb_func_start ov45_0222A3EC
ov45_0222A3EC: ; 0x0222A3EC
	ldr r1, _0222A400 ; =0x00000202
	ldrsh r2, [r0, r1]
	cmp r2, #0
	bgt _0222A3FA
	sub r1, r1, #3
	ldrb r0, [r0, r1]
	bx lr
_0222A3FA:
	mov r0, #0xb
	bx lr
	nop
_0222A400: .word 0x00000202
	thumb_func_end ov45_0222A3EC

	thumb_func_start ov45_0222A404
ov45_0222A404: ; 0x0222A404
	mov r1, #0x3a
	lsl r1, r1, #4
	ldr r3, _0222A410 ; =ov45_0222BCA0
	add r0, r0, r1
	bx r3
	nop
_0222A410: .word ov45_0222BCA0
	thumb_func_end ov45_0222A404

	thumb_func_start ov45_0222A414
ov45_0222A414: ; 0x0222A414
	mov r1, #0x3a
	lsl r1, r1, #4
	ldr r3, _0222A420 ; =ov45_0222BCA8
	add r0, r0, r1
	bx r3
	nop
_0222A420: .word ov45_0222BCA8
	thumb_func_end ov45_0222A414

	thumb_func_start ov45_0222A424
ov45_0222A424: ; 0x0222A424
	ldr r1, _0222A42C ; =0x0000050C
	ldr r0, [r0, r1]
	bx lr
	nop
_0222A42C: .word 0x0000050C
	thumb_func_end ov45_0222A424

	thumb_func_start ov45_0222A430
ov45_0222A430: ; 0x0222A430
	ldr r2, _0222A438 ; =0x0000050C
	str r1, [r0, r2]
	bx lr
	nop
_0222A438: .word 0x0000050C
	thumb_func_end ov45_0222A430

	thumb_func_start ov45_0222A43C
ov45_0222A43C: ; 0x0222A43C
	mov r1, #0x3e
	add r2, r0, #0
	lsl r1, r1, #4
	add r1, r2, r1
	ldr r3, _0222A44C ; =MIi_CpuClear32
	mov r0, #0
	mov r2, #4
	bx r3
	.balign 4, 0
_0222A44C: .word MIi_CpuClear32
	thumb_func_end ov45_0222A43C

	thumb_func_start ov45_0222A450
ov45_0222A450: ; 0x0222A450
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	cmp r4, #4
	blo _0222A460
	bl GF_AssertFail
_0222A460:
	add r0, r6, #0
	bl ov45_0222EC68
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _0222A474
	bl GF_AssertFail
_0222A474:
	mov r0, #0x3e
	add r1, r5, r4
	lsl r0, r0, #4
	strb r6, [r1, r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov45_0222A450

	thumb_func_start ov45_0222A480
ov45_0222A480: ; 0x0222A480
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov45_0222E9E0
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl ov45_0222A450
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222A480

	thumb_func_start ov45_0222A498
ov45_0222A498: ; 0x0222A498
	mov r2, #0x3e
	lsl r2, r2, #4
	add r0, r0, r2
	ldr r3, _0222A4A4 ; =MI_CpuCopy8
	mov r2, #4
	bx r3
	.balign 4, 0
_0222A4A4: .word MI_CpuCopy8
	thumb_func_end ov45_0222A498

	thumb_func_start ov45_0222A4A8
ov45_0222A4A8: ; 0x0222A4A8
	mov r1, #0x3a
	lsl r1, r1, #4
	ldr r3, _0222A4B4 ; =ov45_0222BD24
	add r0, r0, r1
	bx r3
	nop
_0222A4B4: .word ov45_0222BD24
	thumb_func_end ov45_0222A4A8

	thumb_func_start ov45_0222A4B8
ov45_0222A4B8: ; 0x0222A4B8
	mov r1, #0x3a
	lsl r1, r1, #4
	ldr r3, _0222A4C4 ; =ov45_0222BD2C
	add r0, r0, r1
	bx r3
	nop
_0222A4C4: .word ov45_0222BD2C
	thumb_func_end ov45_0222A4B8

	thumb_func_start ov45_0222A4C8
ov45_0222A4C8: ; 0x0222A4C8
	mov r2, #0x82
	lsl r2, r2, #2
	strb r1, [r0, r2]
	bx lr
	thumb_func_end ov45_0222A4C8

	thumb_func_start ov45_0222A4D0
ov45_0222A4D0: ; 0x0222A4D0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x7f
	lsl r0, r0, #2
	ldrb r1, [r4, r0]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _0222A500
	add r0, #0xa
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bgt _0222A500
	ldr r1, _0222A518 ; =0x00000481
	mov r0, #0x15
	mov r2, #0
	bl sub_02004EC4
	mov r0, #0x7f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov45_0222BC84
	pop {r4, pc}
_0222A500:
	ldr r1, _0222A51C ; =0x0000047F
	mov r0, #0x15
	mov r2, #0
	bl sub_02004EC4
	mov r0, #0x7f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov45_0222BC84
	pop {r4, pc}
	nop
_0222A518: .word 0x00000481
_0222A51C: .word 0x0000047F
	thumb_func_end ov45_0222A4D0

	thumb_func_start ov45_0222A520
ov45_0222A520: ; 0x0222A520
	push {r3, lr}
	ldr r2, _0222A538 ; =0x00000209
	ldrb r3, [r0, r2]
	cmp r1, r3
	beq _0222A534
	strb r1, [r0, r2]
	sub r2, #0xd
	add r0, r0, r2
	bl ov45_0222BC84
_0222A534:
	pop {r3, pc}
	nop
_0222A538: .word 0x00000209
	thumb_func_end ov45_0222A520

	thumb_func_start ov45_0222A53C
ov45_0222A53C: ; 0x0222A53C
	push {r3, lr}
	bl ov45_0222E9E0
	bl ov45_0222EC68
	pop {r3, pc}
	thumb_func_end ov45_0222A53C

	thumb_func_start ov45_0222A548
ov45_0222A548: ; 0x0222A548
	ldr r3, _0222A54C ; =ov45_0222E9E0
	bx r3
	.balign 4, 0
_0222A54C: .word ov45_0222E9E0
	thumb_func_end ov45_0222A548

	thumb_func_start ov45_0222A550
ov45_0222A550: ; 0x0222A550
	push {r4, lr}
	sub sp, #8
	add r0, sp, #0
	add r4, r1, #0
	bl ov45_0222EC10
	ldr r1, [sp, #4]
	lsl r0, r4, #2
	ldr r1, [r1, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0222A570
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_0222A570:
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222A550

	thumb_func_start ov45_0222A578
ov45_0222A578: ; 0x0222A578
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x14
	blo _0222A588
	bl GF_AssertFail
_0222A588:
	add r0, sp, #0
	bl ov45_0222EC10
	ldr r1, [sp, #4]
	lsl r0, r5, #2
	ldr r5, [r1, r0]
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _0222A5A2
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222A5A2:
	bl ov45_0222E9E0
	cmp r5, r0
	bne _0222A5B4
	mov r0, #0x4a
	lsl r0, r0, #2
	add sp, #8
	add r0, r4, r0
	pop {r3, r4, r5, pc}
_0222A5B4:
	add r0, r5, #0
	bl ov45_0222EA2C
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222A578

	thumb_func_start ov45_0222A5C0
ov45_0222A5C0: ; 0x0222A5C0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r1, [r4]
	add r0, r4, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222A5DA
	ldr r0, _0222A5E4 ; =0x0000052C
	mov r1, #1
	str r1, [r4, r0]
_0222A5DA:
	mov r0, #0x4a
	lsl r0, r0, #2
	add r0, r4, r0
	pop {r4, pc}
	nop
_0222A5E4: .word 0x0000052C
	thumb_func_end ov45_0222A5C0

	thumb_func_start ov45_0222A5E8
ov45_0222A5E8: ; 0x0222A5E8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0xf
	blt _0222A5F6
	bl GF_AssertFail
_0222A5F6:
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r1, [r4]
	add r0, r4, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222A60E
	ldr r0, _0222A6F8 ; =0x0000052C
	mov r1, #1
	str r1, [r4, r0]
	pop {r3, r4, r5, pc}
_0222A60E:
	ldr r0, _0222A6FC ; =0x0000016B
	ldrb r0, [r4, r0]
	cmp r0, r5
	beq _0222A6F6
	cmp r5, #9
	beq _0222A64E
	add r0, r4, #0
	bl ov45_0222AFF8
	cmp r0, #1
	bne _0222A64E
	add r0, r4, #0
	bl ov45_0222B00C
	cmp r0, #0
	bne _0222A644
	mov r0, #0x71
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	bl ov45_0222EC90
	mov r1, #0x71
	lsl r1, r1, #2
	ldrh r1, [r4, r1]
	add r0, r4, #0
	bl ov45_0222BE28
_0222A644:
	mov r0, #7
	lsl r0, r0, #6
	add r0, r4, r0
	bl ov45_0222BD5C
_0222A64E:
	ldr r0, _0222A6FC ; =0x0000016B
	ldrb r0, [r4, r0]
	cmp r0, #8
	bhi _0222A6E2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222A662: ; jump table
	.short _0222A6E2 - _0222A662 - 2 ; case 0
	.short _0222A6E2 - _0222A662 - 2 ; case 1
	.short _0222A674 - _0222A662 - 2 ; case 2
	.short _0222A684 - _0222A662 - 2 ; case 3
	.short _0222A694 - _0222A662 - 2 ; case 4
	.short _0222A6A4 - _0222A662 - 2 ; case 5
	.short _0222A6B4 - _0222A662 - 2 ; case 6
	.short _0222A6C4 - _0222A662 - 2 ; case 7
	.short _0222A6D4 - _0222A662 - 2 ; case 8
_0222A674:
	ldr r0, _0222A700 ; =0x000004BC
	mov r1, #0x10
	add r2, r1, #0
	add r0, r4, r0
	sub r2, #0x11
	bl ov45_0222CB74
	b _0222A6E2
_0222A684:
	ldr r0, _0222A700 ; =0x000004BC
	mov r1, #0x11
	add r2, r1, #0
	add r0, r4, r0
	sub r2, #0x12
	bl ov45_0222CB74
	b _0222A6E2
_0222A694:
	ldr r0, _0222A700 ; =0x000004BC
	mov r1, #0x12
	add r2, r1, #0
	add r0, r4, r0
	sub r2, #0x13
	bl ov45_0222CB74
	b _0222A6E2
_0222A6A4:
	ldr r0, _0222A700 ; =0x000004BC
	mov r1, #0x13
	add r2, r1, #0
	add r0, r4, r0
	sub r2, #0x14
	bl ov45_0222CB74
	b _0222A6E2
_0222A6B4:
	ldr r0, _0222A700 ; =0x000004BC
	mov r1, #0x14
	add r2, r1, #0
	add r0, r4, r0
	sub r2, #0x15
	bl ov45_0222CB74
	b _0222A6E2
_0222A6C4:
	ldr r0, _0222A700 ; =0x000004BC
	mov r1, #0x15
	add r2, r1, #0
	add r0, r4, r0
	sub r2, #0x16
	bl ov45_0222CB74
	b _0222A6E2
_0222A6D4:
	ldr r0, _0222A700 ; =0x000004BC
	mov r1, #0x16
	add r2, r1, #0
	add r0, r4, r0
	sub r2, #0x17
	bl ov45_0222CB74
_0222A6E2:
	ldr r0, _0222A6FC ; =0x0000016B
	strb r5, [r4, r0]
	sub r0, #0x63
	ldr r1, [r4]
	add r0, r4, r0
	bl ov45_0222BAC4
	add r0, r4, #0
	bl ov45_0222BA3C
_0222A6F6:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222A6F8: .word 0x0000052C
_0222A6FC: .word 0x0000016B
_0222A700: .word 0x000004BC
	thumb_func_end ov45_0222A5E8

	thumb_func_start ov45_0222A704
ov45_0222A704: ; 0x0222A704
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x18
	blt _0222A714
	bl GF_AssertFail
_0222A714:
	ldr r0, _0222A728 ; =0x000004BC
	add r1, r4, #0
	add r0, r5, r0
	add r2, r6, #0
	bl ov45_0222CB74
	add r0, r5, #0
	bl ov45_0222BA3C
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222A728: .word 0x000004BC
	thumb_func_end ov45_0222A704

	thumb_func_start ov45_0222A72C
ov45_0222A72C: ; 0x0222A72C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x1b
	blo _0222A73A
	bl GF_AssertFail
_0222A73A:
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r1, [r5]
	add r0, r5, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222A752
	ldr r0, _0222A768 ; =0x0000052C
	mov r1, #1
	str r1, [r5, r0]
	pop {r3, r4, r5, pc}
_0222A752:
	ldr r0, _0222A76C ; =0x00000169
	strb r4, [r5, r0]
	sub r0, #0x61
	ldr r1, [r5]
	add r0, r5, r0
	bl ov45_0222BAC4
	add r0, r5, #0
	bl ov45_0222BA3C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222A768: .word 0x0000052C
_0222A76C: .word 0x00000169
	thumb_func_end ov45_0222A72C

	thumb_func_start ov45_0222A770
ov45_0222A770: ; 0x0222A770
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x12
	blt _0222A780
	bl GF_AssertFail
_0222A780:
	cmp r6, #0x12
	blt _0222A788
	bl GF_AssertFail
_0222A788:
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r1, [r5]
	add r0, r5, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222A7A0
	ldr r0, _0222A7D8 ; =0x0000052C
	mov r1, #1
	str r1, [r5, r0]
	pop {r4, r5, r6, pc}
_0222A7A0:
	cmp r4, #0x12
	bge _0222A7D6
	cmp r6, #0x12
	bge _0222A7D6
	cmp r4, #0
	bne _0222A7BA
	mov r0, #0x1b
	lsl r0, r0, #4
	strh r6, [r5, r0]
	mov r1, #0
	add r0, r0, #2
	strh r1, [r5, r0]
	b _0222A7C4
_0222A7BA:
	mov r0, #0x1b
	lsl r0, r0, #4
	strh r4, [r5, r0]
	add r0, r0, #2
	strh r6, [r5, r0]
_0222A7C4:
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r1, [r5]
	add r0, r5, r0
	bl ov45_0222BAC4
	add r0, r5, #0
	bl ov45_0222BA3C
_0222A7D6:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222A7D8: .word 0x0000052C
	thumb_func_end ov45_0222A770

	thumb_func_start ov45_0222A7DC
ov45_0222A7DC: ; 0x0222A7DC
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	cmp r4, #3
	blo _0222A7EC
	bl GF_AssertFail
_0222A7EC:
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r1, [r5]
	add r0, r5, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222A804
	ldr r0, _0222A840 ; =0x0000052C
	mov r1, #1
	str r1, [r5, r0]
	pop {r4, r5, r6, pc}
_0222A804:
	cmp r4, #3
	bhs _0222A83E
	mov r0, #0x6d
	lsl r0, r0, #2
	str r6, [r5, r0]
	add r1, r0, #4
	str r4, [r5, r1]
	add r1, r0, #0
	add r1, #0x57
	ldrb r2, [r5, r1]
	mov r1, #0xf
	add r0, #0x57
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strb r1, [r5, r0]
	add r0, r5, #0
	mov r1, #6
	bl ov45_0222B118
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r1, [r5]
	add r0, r5, r0
	bl ov45_0222BAC4
	add r0, r5, #0
	bl ov45_0222BA3C
_0222A83E:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222A840: .word 0x0000052C
	thumb_func_end ov45_0222A7DC

	thumb_func_start ov45_0222A844
ov45_0222A844: ; 0x0222A844
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r0, #8
	mov r1, #8
	add r7, r2, #0
	bl ov45_0222B28C
	mov r6, #0
	cmp r0, #1
	bne _0222A8A0
	add r1, r5, #0
	add r0, r4, #0
	add r1, #8
	bl Sav2_Profile_PlayerName_set
	mov r0, #0x20
	add r1, r7, #0
	bl String_ctor
	str r0, [sp]
	mov r0, #0x20
	add r1, r7, #0
	bl String_ctor
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl PlayerName_FlatToString
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r6, #0
	bl FontID_String_AllCharsValid
	cmp r0, #0
	bne _0222A892
	mov r6, #1
_0222A892:
	ldr r0, [sp]
	bl String_dtor
	ldr r0, [sp, #4]
	bl String_dtor
	b _0222A8A2
_0222A8A0:
	mov r6, #1
_0222A8A2:
	cmp r6, #0
	beq _0222A8D0
	ldr r2, _0222A91C ; =0x00000309
	mov r0, #1
	mov r1, #0x1b
	add r3, r7, #0
	bl NewMsgDataFromNarc
	mov r1, #0x40
	add r6, r0, #0
	bl NewString_ReadMsgData
	add r7, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl PlayerName_StringToFlat
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	bl DestroyMsgData
_0222A8D0:
	add r0, r5, #0
	bl ov45_0222A9A0
	add r1, r0, #0
	add r0, r4, #0
	bl PlayerProfile_SetTrainerID
	add r0, r5, #0
	bl ov45_0222A9CC
	add r1, r0, #0
	add r0, r4, #0
	bl PlayerProfile_SetTrainerGender
	add r0, r5, #0
	bl ov45_0222AA5C
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl PlayerProfile_SetAvatar
	add r0, r5, #0
	bl ov45_0222AA10
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl PlayerProfile_SetLanguage
	add r0, r4, #0
	bl PlayerProfile_SetGameClearFlag
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222A91C: .word 0x00000309
	thumb_func_end ov45_0222A844

	thumb_func_start ov45_0222A920
ov45_0222A920: ; 0x0222A920
	add r0, #0x43
	ldrb r0, [r0]
	cmp r0, #0xe
	blo _0222A92A
	mov r0, #0xe
_0222A92A:
	bx lr
	thumb_func_end ov45_0222A920

	thumb_func_start ov45_0222A92C
ov45_0222A92C: ; 0x0222A92C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xc
	blo _0222A93A
	bl GF_AssertFail
_0222A93A:
	mov r1, #0
	add r2, r1, #0
_0222A93E:
	add r0, r5, r2
	add r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0x18
	bhs _0222A94A
	add r1, r1, #1
_0222A94A:
	sub r0, r1, #1
	cmp r0, r4
	bne _0222A958
	add r0, r5, r2
	add r0, #0x4c
	ldrb r0, [r0]
	pop {r3, r4, r5, pc}
_0222A958:
	add r2, r2, #1
	cmp r2, #0xc
	blt _0222A93E
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222A92C

	thumb_func_start ov45_0222A964
ov45_0222A964: ; 0x0222A964
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xc
	blo _0222A972
	bl GF_AssertFail
_0222A972:
	mov r1, #0
	add r2, r1, #0
_0222A976:
	add r0, r5, r2
	add r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0x18
	bhs _0222A982
	add r1, r1, #1
_0222A982:
	sub r0, r1, #1
	cmp r0, r4
	bne _0222A990
	lsl r0, r2, #2
	add r0, r5, r0
	ldr r0, [r0, #0x58]
	pop {r3, r4, r5, pc}
_0222A990:
	add r2, r2, #1
	cmp r2, #0xc
	blt _0222A976
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222A964

	thumb_func_start ov45_0222A99C
ov45_0222A99C: ; 0x0222A99C
	ldr r0, [r0]
	bx lr
	thumb_func_end ov45_0222A99C

	thumb_func_start ov45_0222A9A0
ov45_0222A9A0: ; 0x0222A9A0
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov45_0222A9A0

	thumb_func_start ov45_0222A9A4
ov45_0222A9A4: ; 0x0222A9A4
	push {r3, lr}
	bl ov45_0222AA5C
	ldr r3, _0222A9C4 ; =ov45_02254A84
	mov r2, #0
_0222A9AE:
	ldrh r1, [r3]
	cmp r0, r1
	bne _0222A9B8
	add r0, r2, #0
	pop {r3, pc}
_0222A9B8:
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, #0x10
	blt _0222A9AE
	mov r0, #0x18
	pop {r3, pc}
	.balign 4, 0
_0222A9C4: .word ov45_02254A84
	thumb_func_end ov45_0222A9A4

	thumb_func_start ov45_0222A9C8
ov45_0222A9C8: ; 0x0222A9C8
	ldr r0, [r0, #0x1c]
	bx lr
	thumb_func_end ov45_0222A9C8

	thumb_func_start ov45_0222A9CC
ov45_0222A9CC: ; 0x0222A9CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x38
	ldrb r0, [r0]
	cmp r0, #2
	blo _0222AA00
	ldrh r0, [r5, #0x3a]
	bl ov45_0222CD04
	ldr r1, _0222AA08 ; =0x0000FFFF
	cmp r0, r1
	beq _0222A9FC
	ldrh r3, [r5, #0x3a]
	ldr r2, _0222AA0C ; =ov45_02254A84
	mov r1, #0
_0222A9EA:
	ldrh r0, [r2]
	cmp r3, r0
	bne _0222A9F2
	add r4, r0, #0
_0222A9F2:
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #0x10
	blo _0222A9EA
	b _0222AA02
_0222A9FC:
	mov r4, #1
	b _0222AA02
_0222AA00:
	add r4, r0, #0
_0222AA02:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0222AA08: .word 0x0000FFFF
_0222AA0C: .word ov45_02254A84
	thumb_func_end ov45_0222A9CC

	thumb_func_start ov45_0222AA10
ov45_0222AA10: ; 0x0222AA10
	push {r4, lr}
	add r4, r0, #0
	bl ov45_0222AA28
	cmp r0, #1
	bne _0222AA22
	add r4, #0x39
	ldrb r0, [r4]
	pop {r4, pc}
_0222AA22:
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222AA10

	thumb_func_start ov45_0222AA28
ov45_0222AA28: ; 0x0222AA28
	add r0, #0x39
	ldrb r0, [r0]
	cmp r0, #7
	bhi _0222AA50
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222AA3C: ; jump table
	.short _0222AA50 - _0222AA3C - 2 ; case 0
	.short _0222AA4C - _0222AA3C - 2 ; case 1
	.short _0222AA4C - _0222AA3C - 2 ; case 2
	.short _0222AA4C - _0222AA3C - 2 ; case 3
	.short _0222AA4C - _0222AA3C - 2 ; case 4
	.short _0222AA4C - _0222AA3C - 2 ; case 5
	.short _0222AA50 - _0222AA3C - 2 ; case 6
	.short _0222AA4C - _0222AA3C - 2 ; case 7
_0222AA4C:
	mov r0, #1
	bx lr
_0222AA50:
	mov r0, #0
	bx lr
	thumb_func_end ov45_0222AA28

	thumb_func_start ov45_0222AA54
ov45_0222AA54: ; 0x0222AA54
	add r0, #0x39
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222AA54

	thumb_func_start ov45_0222AA5C
ov45_0222AA5C: ; 0x0222AA5C
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #0x3a]
	bl ov45_0222CD04
	ldr r1, _0222AA80 ; =0x0000FFFF
	cmp r0, r1
	bne _0222AA7C
	add r0, r4, #0
	bl ov45_0222A9CC
	cmp r0, #0
	bne _0222AA7A
	mov r0, #3
	pop {r4, pc}
_0222AA7A:
	mov r0, #6
_0222AA7C:
	pop {r4, pc}
	nop
_0222AA80: .word 0x0000FFFF
	thumb_func_end ov45_0222AA5C

	thumb_func_start ov45_0222AA84
ov45_0222AA84: ; 0x0222AA84
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #0x3c]
	cmp r0, #0xea
	blo _0222AA92
	mov r0, #0
	pop {r4, pc}
_0222AA92:
	add r1, r4, #0
	add r1, #0x3e
	ldrb r1, [r1]
	bl ov45_0222D79C
	cmp r0, #0
	bne _0222AAA4
	mov r0, #0
	pop {r4, pc}
_0222AAA4:
	ldrh r0, [r4, #0x3c]
	pop {r4, pc}
	thumb_func_end ov45_0222AA84

	thumb_func_start ov45_0222AAA8
ov45_0222AAA8: ; 0x0222AAA8
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x3e
	ldrh r0, [r4, #0x3c]
	ldrb r1, [r1]
	bl ov45_0222D79C
	cmp r0, #0
	bne _0222AAC0
	mov r0, #0
	pop {r4, pc}
_0222AAC0:
	add r4, #0x3e
	ldrb r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222AAA8

	thumb_func_start ov45_0222AAC8
ov45_0222AAC8: ; 0x0222AAC8
	add r0, #0x41
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0222AAD4
	mov r0, #0
	bx lr
_0222AAD4:
	cmp r0, #0x1b
	blo _0222AADA
	mov r0, #0
_0222AADA:
	bx lr
	thumb_func_end ov45_0222AAC8

	thumb_func_start ov45_0222AADC
ov45_0222AADC: ; 0x0222AADC
	add r0, #0x41
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0222AAE8
	mov r0, #1
	bx lr
_0222AAE8:
	mov r0, #0
	bx lr
	thumb_func_end ov45_0222AADC

	thumb_func_start ov45_0222AAEC
ov45_0222AAEC: ; 0x0222AAEC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #2
	blo _0222AAFA
	bl GF_AssertFail
_0222AAFA:
	lsl r0, r5, #1
	add r0, r4, r0
	add r0, #0x88
	ldrh r0, [r0]
	cmp r0, #0x12
	blo _0222AB08
	mov r0, #0
_0222AB08:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222AAEC

	thumb_func_start ov45_0222AB0C
ov45_0222AB0C: ; 0x0222AB0C
	add r2, r0, #0
	add r2, #0x8c
	add r0, #0x90
	ldr r2, [r2]
	ldr r0, [r0]
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	thumb_func_end ov45_0222AB0C

	thumb_func_start ov45_0222AB1C
ov45_0222AB1C: ; 0x0222AB1C
	ldr r1, _0222AB24 ; =0x00000508
	ldr r0, [r0, r1]
	bx lr
	nop
_0222AB24: .word 0x00000508
	thumb_func_end ov45_0222AB1C

	thumb_func_start ov45_0222AB28
ov45_0222AB28: ; 0x0222AB28
	mov r2, #0xf3
	lsl r2, r2, #2
	ldr r3, _0222AB34 ; =ov45_0222C95C
	add r0, r0, r2
	bx r3
	nop
_0222AB34: .word ov45_0222C95C
	thumb_func_end ov45_0222AB28

	thumb_func_start ov45_0222AB38
ov45_0222AB38: ; 0x0222AB38
	mov r2, #0xf3
	lsl r2, r2, #2
	add r0, r0, r2
	ldr r3, _0222AB44 ; =MI_CpuCopy8
	mov r2, #0x14
	bx r3
	.balign 4, 0
_0222AB44: .word MI_CpuCopy8
	thumb_func_end ov45_0222AB38

	thumb_func_start ov45_0222AB48
ov45_0222AB48: ; 0x0222AB48
	mov r2, #0xf9
	lsl r2, r2, #2
	ldr r3, _0222AB54 ; =ov45_0222C9D0
	add r0, r0, r2
	bx r3
	nop
_0222AB54: .word ov45_0222C9D0
	thumb_func_end ov45_0222AB48

	thumb_func_start ov45_0222AB58
ov45_0222AB58: ; 0x0222AB58
	mov r2, #0xf9
	lsl r2, r2, #2
	ldr r3, _0222AB64 ; =ov45_0222C9EC
	add r0, r0, r2
	bx r3
	nop
_0222AB64: .word ov45_0222C9EC
	thumb_func_end ov45_0222AB58

	thumb_func_start ov45_0222AB68
ov45_0222AB68: ; 0x0222AB68
	push {r3, lr}
	sub sp, #8
	add r0, sp, #0
	bl ov45_0222EC3C
	ldr r0, [sp]
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov45_0222AB68

	thumb_func_start ov45_0222AB78
ov45_0222AB78: ; 0x0222AB78
	push {r3, lr}
	add r0, r1, #0
	bl ov45_0222ECA4
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222AB8E
	bl ov45_0222EC68
	add r1, r0, #0
_0222AB8E:
	add r0, r1, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov45_0222AB78

	thumb_func_start ov45_0222AB94
ov45_0222AB94: ; 0x0222AB94
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r2, #0
	add r0, sp, #0
	mov r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	str r2, [r0, #8]
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
	add r0, sp, #0
	strb r2, [r0, #0x11]
	add r0, r1, #0
	bl ov45_0222EC90
	str r0, [sp]
	add r0, r4, #0
	bl ov45_0222EC90
	str r0, [sp, #4]
	mov r1, #2
	add r0, sp, #0
	strb r1, [r0, #0x10]
	mov r0, #4
	add r1, sp, #0
	mov r2, #0x14
	bl ov45_0222EEF0
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov45_0222AB94

	thumb_func_start ov45_0222ABD0
ov45_0222ABD0: ; 0x0222ABD0
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r1, #0
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	str r0, [r1, #0x10]
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, #0x11]
	add r0, r2, #0
	add r4, r3, #0
	bl ov45_0222EC90
	str r0, [sp]
	add r0, r5, #0
	bl ov45_0222EC90
	str r0, [sp, #4]
	mov r1, #2
	add r0, sp, #0
	strb r1, [r0, #0x10]
	strb r4, [r0, #0x12]
	mov r0, #4
	add r1, sp, #0
	mov r2, #0x14
	bl ov45_0222EEF0
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222ABD0

	thumb_func_start ov45_0222AC14
ov45_0222AC14: ; 0x0222AC14
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r1, #0
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	add r5, r2, #0
	str r0, [r1, #0x10]
	cmp r4, #6
	bhi _0222ACB4
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222AC3A: ; jump table
	.short _0222AC48 - _0222AC3A - 2 ; case 0
	.short _0222AC48 - _0222AC3A - 2 ; case 1
	.short _0222AC48 - _0222AC3A - 2 ; case 2
	.short _0222AC4C - _0222AC3A - 2 ; case 3
	.short _0222AC4C - _0222AC3A - 2 ; case 4
	.short _0222AC50 - _0222AC3A - 2 ; case 5
	.short _0222AC54 - _0222AC3A - 2 ; case 6
_0222AC48:
	mov r1, #2
	b _0222AC5C
_0222AC4C:
	mov r1, #3
	b _0222AC5C
_0222AC50:
	mov r1, #4
	b _0222AC5C
_0222AC54:
	mov r1, #5
	b _0222AC5C
	thumb_func_end ov45_0222AC14

	thumb_func_start ov45_0222AC58
ov45_0222AC58: ; 0x0222AC58
	add sp, #0x14
	pop {r4, r5, pc}
_0222AC5C:
	add r0, sp, #0
	strb r1, [r0, #0x11]
	add r0, r3, #0
	bl ov45_0222EC90
	str r0, [sp]
	ldr r0, [sp, #0x20]
	bl ov45_0222EC90
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	bl ov45_0222EC90
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	bl ov45_0222EC90
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r5, [r0, #0x10]
	ldrb r1, [r0, #0x13]
	mov r2, #0x7f
	bic r1, r2
	lsl r2, r4, #0x18
	lsr r3, r2, #0x18
	mov r2, #0x7f
	and r2, r3
	orr r1, r2
	strb r1, [r0, #0x13]
	ldrb r1, [r0, #0x13]
	mov r2, #0x80
	bic r1, r2
	ldr r2, [sp, #0x2c]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x18
	orr r1, r2
	strb r1, [r0, #0x13]
	mov r0, #4
	add r1, sp, #0
	mov r2, #0x14
	bl ov45_0222EEF0
_0222ACB4:
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov45_0222AC58

	thumb_func_start ov45_0222ACB8
ov45_0222ACB8: ; 0x0222ACB8
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r1, #0
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	add r4, r2, #0
	str r0, [r1, #0x10]
	cmp r5, #0
	beq _0222ACDA
	cmp r5, #1
	beq _0222ACDA
	cmp r5, #2
	bne _0222AD28
_0222ACDA:
	mov r1, #8
	add r0, sp, #0
	strb r1, [r0, #0x11]
	add r0, r3, #0
	bl ov45_0222EC90
	str r0, [sp]
	ldr r0, [sp, #0x20]
	bl ov45_0222EC90
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	bl ov45_0222EC90
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	bl ov45_0222EC90
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r4, [r0, #0x10]
	ldrb r1, [r0, #0x13]
	mov r2, #0x7f
	bic r1, r2
	lsl r2, r5, #0x18
	lsr r3, r2, #0x18
	mov r2, #0x7f
	and r2, r3
	orr r1, r2
	strb r1, [r0, #0x13]
	ldrb r2, [r0, #0x13]
	mov r1, #0x80
	bic r2, r1
	strb r2, [r0, #0x13]
	mov r0, #4
	add r1, sp, #0
	mov r2, #0x14
	bl ov45_0222EEF0
_0222AD28:
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov45_0222ACB8

	thumb_func_start ov45_0222AD2C
ov45_0222AD2C: ; 0x0222AD2C
	push {r3, lr}
	mov r0, #3
	bl ov45_0222ECDC
	cmp r0, #5
	blo _0222AD3A
	mov r0, #0
_0222AD3A:
	pop {r3, pc}
	thumb_func_end ov45_0222AD2C

	thumb_func_start ov45_0222AD3C
ov45_0222AD3C: ; 0x0222AD3C
	push {r3, lr}
	mov r0, #2
	bl ov45_0222ECDC
	cmp r0, #5
	blo _0222AD4A
	mov r0, #0
_0222AD4A:
	pop {r3, pc}
	thumb_func_end ov45_0222AD3C

	thumb_func_start ov45_0222AD4C
ov45_0222AD4C: ; 0x0222AD4C
	push {r3, lr}
	mov r0, #5
	bl ov45_0222ECDC
	add r0, #0x1e
	pop {r3, pc}
	thumb_func_end ov45_0222AD4C

	thumb_func_start ov45_0222AD58
ov45_0222AD58: ; 0x0222AD58
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x14
	blo _0222AD66
	bl GF_AssertFail
_0222AD66:
	mov r0, #0x7a
	add r1, r5, r4
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222AD58

	thumb_func_start ov45_0222AD70
ov45_0222AD70: ; 0x0222AD70
	push {r3, lr}
	str r1, [sp]
	mov r0, #5
	add r1, sp, #0
	mov r2, #4
	bl ov45_0222EEF0
	pop {r3, pc}
	thumb_func_end ov45_0222AD70

	thumb_func_start ov45_0222AD80
ov45_0222AD80: ; 0x0222AD80
	mov r2, #0x83
	lsl r2, r2, #2
	ldr r3, _0222AD8C ; =ov45_0222C4E4
	add r0, r0, r2
	bx r3
	nop
_0222AD8C: .word ov45_0222C4E4
	thumb_func_end ov45_0222AD80

	thumb_func_start ov45_0222AD90
ov45_0222AD90: ; 0x0222AD90
	mov r2, #0x83
	lsl r2, r2, #2
	ldr r3, _0222AD9C ; =ov45_0222C4FC
	add r0, r0, r2
	bx r3
	nop
_0222AD9C: .word ov45_0222C4FC
	thumb_func_end ov45_0222AD90

	thumb_func_start ov45_0222ADA0
ov45_0222ADA0: ; 0x0222ADA0
	mov r0, #0x4b
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222ADA0

	thumb_func_start ov45_0222ADA8
ov45_0222ADA8: ; 0x0222ADA8
	mov r2, #0x83
	lsl r2, r2, #2
	ldr r3, _0222ADB4 ; =ov45_0222C5B4
	add r0, r0, r2
	bx r3
	nop
_0222ADB4: .word ov45_0222C5B4
	thumb_func_end ov45_0222ADA8

	thumb_func_start ov45_0222ADB8
ov45_0222ADB8: ; 0x0222ADB8
	mov r3, #0x83
	lsl r3, r3, #2
	add r0, r0, r3
	ldr r3, _0222ADC4 ; =ov45_0222C408
	bx r3
	nop
_0222ADC4: .word ov45_0222C408
	thumb_func_end ov45_0222ADB8

	thumb_func_start ov45_0222ADC8
ov45_0222ADC8: ; 0x0222ADC8
	mov r2, #0x83
	lsl r2, r2, #2
	ldr r3, _0222ADD4 ; =ov45_0222C480
	add r0, r0, r2
	bx r3
	nop
_0222ADD4: .word ov45_0222C480
	thumb_func_end ov45_0222ADC8

	thumb_func_start ov45_0222ADD8
ov45_0222ADD8: ; 0x0222ADD8
	mov r2, #0x83
	lsl r2, r2, #2
	ldr r3, _0222ADE4 ; =ov45_0222C514
	add r0, r0, r2
	bx r3
	nop
_0222ADE4: .word ov45_0222C514
	thumb_func_end ov45_0222ADD8

	thumb_func_start ov45_0222ADE8
ov45_0222ADE8: ; 0x0222ADE8
	mov r2, #0x83
	lsl r2, r2, #2
	ldr r3, _0222ADF4 ; =ov45_0222C54C
	add r0, r0, r2
	bx r3
	nop
_0222ADF4: .word ov45_0222C54C
	thumb_func_end ov45_0222ADE8

	thumb_func_start ov45_0222ADF8
ov45_0222ADF8: ; 0x0222ADF8
	mov r2, #0x83
	lsl r2, r2, #2
	ldr r3, _0222AE04 ; =ov45_0222C580
	add r0, r0, r2
	bx r3
	nop
_0222AE04: .word ov45_0222C580
	thumb_func_end ov45_0222ADF8

	thumb_func_start ov45_0222AE08
ov45_0222AE08: ; 0x0222AE08
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	mov r1, #3
	add r4, r2, #0
	bl _u32_div_f
	str r0, [r5]
	add r0, r6, #0
	mov r1, #3
	bl _u32_div_f
	str r1, [r4]
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222AE08

	thumb_func_start ov45_0222AE24
ov45_0222AE24: ; 0x0222AE24
	mov r3, #0x83
	lsl r3, r3, #2
	add r0, r0, r3
	ldr r3, _0222AE30 ; =ov45_0222C5E8
	bx r3
	nop
_0222AE30: .word ov45_0222C5E8
	thumb_func_end ov45_0222AE24

	thumb_func_start ov45_0222AE34
ov45_0222AE34: ; 0x0222AE34
	mov r2, #0x83
	lsl r2, r2, #2
	ldr r3, _0222AE40 ; =ov45_0222C658
	add r0, r0, r2
	bx r3
	nop
_0222AE40: .word ov45_0222C658
	thumb_func_end ov45_0222AE34

	thumb_func_start ov45_0222AE44
ov45_0222AE44: ; 0x0222AE44
	push {r3, lr}
	mov r0, #6
	add r1, sp, #0
	mov r2, #4
	bl ov45_0222EEF0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov45_0222AE44

	thumb_func_start ov45_0222AE54
ov45_0222AE54: ; 0x0222AE54
	push {r3, lr}
	mov r0, #7
	add r1, sp, #0
	mov r2, #4
	bl ov45_0222EEF0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov45_0222AE54

	thumb_func_start ov45_0222AE64
ov45_0222AE64: ; 0x0222AE64
	mov r1, #7
	lsl r1, r1, #6
	ldr r3, _0222AE70 ; =ov45_0222BD4C
	add r0, r0, r1
	bx r3
	nop
_0222AE70: .word ov45_0222BD4C
	thumb_func_end ov45_0222AE64

	thumb_func_start ov45_0222AE74
ov45_0222AE74: ; 0x0222AE74
	push {r3, r4, r5, lr}
	ldr r2, _0222AED4 ; =0x000001CA
	add r5, r0, #0
	ldrb r2, [r5, r2]
	add r4, r1, #0
	cmp r2, #0
	beq _0222AE86
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222AE86:
	bl ov45_0222A578
	bl ov45_0222A920
	cmp r0, #1
	beq _0222AE96
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222AE96:
	mov r0, #0x71
	lsl r0, r0, #2
	strh r4, [r5, r0]
	mov r2, #1
	add r1, r0, #2
	strb r2, [r5, r1]
	add r1, r0, #6
	sub r0, r0, #4
	strb r2, [r5, r1]
	add r0, r5, r0
	mov r1, #0
	bl ov45_0222BE00
	add r0, r4, #0
	bl ov45_0222EC90
	mov r2, #0x1e
	lsl r2, r2, #4
	add r1, r0, #0
	mov r0, #0
	add r2, r5, r2
	mov r3, #4
	bl ov45_0222EF4C
	mov r0, #7
	lsl r0, r0, #6
	add r0, r5, r0
	bl ov45_0222BE48
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222AED4: .word 0x000001CA
	thumb_func_end ov45_0222AE74

	thumb_func_start ov45_0222AED8
ov45_0222AED8: ; 0x0222AED8
	push {r4, lr}
	ldr r3, _0222AF78 ; =0x000001CA
	add r4, r0, #0
	ldrb r2, [r4, r3]
	mov r0, #0
	cmp r2, #1
	bne _0222AEF2
	sub r3, r3, #4
	ldrb r3, [r4, r3]
	cmp r3, #2
	beq _0222AF00
	mov r0, #1
	b _0222AF00
_0222AEF2:
	cmp r2, #2
	bne _0222AF00
	sub r3, r3, #4
	ldrb r3, [r4, r3]
	cmp r3, #3
	beq _0222AF00
	mov r0, #1
_0222AF00:
	cmp r0, #0
	beq _0222AF18
	mov r0, #0x71
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	bl ov45_0222EC90
	add r1, r0, #0
	add r0, r4, #0
	bl ov45_0222BE28
	pop {r4, pc}
_0222AF18:
	cmp r2, #1
	beq _0222AF22
	cmp r2, #2
	beq _0222AF2A
	b _0222AF32
_0222AF22:
	ldr r0, _0222AF7C ; =0x000001C6
	mov r2, #3
	strb r2, [r4, r0]
	b _0222AF46
_0222AF2A:
	ldr r0, _0222AF7C ; =0x000001C6
	mov r2, #2
	strb r2, [r4, r0]
	b _0222AF46
_0222AF32:
	mov r0, #0x71
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	bl ov45_0222EC90
	add r1, r0, #0
	add r0, r4, #0
	bl ov45_0222BE28
	pop {r4, pc}
_0222AF46:
	mov r0, #7
	lsl r0, r0, #6
	add r0, r4, r0
	bl ov45_0222BE00
	mov r0, #0x71
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	bl ov45_0222EC90
	mov r2, #0x1e
	lsl r2, r2, #4
	add r1, r0, #0
	mov r0, #2
	add r2, r4, r2
	mov r3, #4
	bl ov45_0222EF4C
	mov r0, #7
	lsl r0, r0, #6
	add r0, r4, r0
	bl ov45_0222BE48
	pop {r4, pc}
	nop
_0222AF78: .word 0x000001CA
_0222AF7C: .word 0x000001C6
	thumb_func_end ov45_0222AED8

	thumb_func_start ov45_0222AF80
ov45_0222AF80: ; 0x0222AF80
	push {r4, lr}
	ldr r1, _0222AFC0 ; =0x000001C6
	add r4, r0, #0
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _0222AFBE
	add r0, r1, #4
	ldrb r0, [r4, r0]
	cmp r0, #1
	bne _0222AFBE
	add r0, r1, #0
	mov r2, #0
	add r0, #0x1c
	strh r2, [r4, r0]
	sub r0, r1, #2
	ldrh r0, [r4, r0]
	bl ov45_0222EC90
	mov r2, #0x1e
	lsl r2, r2, #4
	add r1, r0, #0
	mov r0, #3
	add r2, r4, r2
	mov r3, #4
	bl ov45_0222EF4C
	mov r0, #7
	lsl r0, r0, #6
	add r0, r4, r0
	bl ov45_0222BD4C
_0222AFBE:
	pop {r4, pc}
	.balign 4, 0
_0222AFC0: .word 0x000001C6
	thumb_func_end ov45_0222AF80

	thumb_func_start ov45_0222AFC4
ov45_0222AFC4: ; 0x0222AFC4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222AFF4 ; =0x000001C6
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _0222AFF0
	sub r0, r0, #2
	ldrh r0, [r4, r0]
	bl ov45_0222EC90
	ldr r2, _0222AFF4 ; =0x000001C6
	add r1, r0, #0
	mov r3, #4
	add r0, r2, #0
	strb r3, [r4, r2]
	add r0, #0x1c
	add r2, #0x1a
	strh r3, [r4, r0]
	mov r0, #2
	add r2, r4, r2
	bl ov45_0222EF4C
_0222AFF0:
	pop {r4, pc}
	nop
_0222AFF4: .word 0x000001C6
	thumb_func_end ov45_0222AFC4

	thumb_func_start ov45_0222AFF8
ov45_0222AFF8: ; 0x0222AFF8
	ldr r1, _0222B008 ; =0x000001CA
	ldrb r0, [r0, r1]
	cmp r0, #0
	beq _0222B004
	mov r0, #1
	bx lr
_0222B004:
	mov r0, #0
	bx lr
	.balign 4, 0
_0222B008: .word 0x000001CA
	thumb_func_end ov45_0222AFF8

	thumb_func_start ov45_0222B00C
ov45_0222B00C: ; 0x0222B00C
	ldr r1, _0222B01C ; =0x000001CA
	ldrb r0, [r0, r1]
	cmp r0, #2
	bne _0222B018
	mov r0, #1
	bx lr
_0222B018:
	mov r0, #0
	bx lr
	.balign 4, 0
_0222B01C: .word 0x000001CA
	thumb_func_end ov45_0222B00C

	thumb_func_start ov45_0222B020
ov45_0222B020: ; 0x0222B020
	mov r1, #0x71
	lsl r1, r1, #2
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end ov45_0222B020

	thumb_func_start ov45_0222B028
ov45_0222B028: ; 0x0222B028
	ldr r1, _0222B030 ; =0x000001CB
	ldrb r0, [r0, r1]
	bx lr
	nop
_0222B030: .word 0x000001CB
	thumb_func_end ov45_0222B028

	thumb_func_start ov45_0222B034
ov45_0222B034: ; 0x0222B034
	ldr r1, _0222B03C ; =0x000001C6
	ldrb r0, [r0, r1]
	bx lr
	nop
_0222B03C: .word 0x000001C6
	thumb_func_end ov45_0222B034

	thumb_func_start ov45_0222B040
ov45_0222B040: ; 0x0222B040
	mov r1, #0x72
	lsl r1, r1, #2
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end ov45_0222B040

	thumb_func_start ov45_0222B048
ov45_0222B048: ; 0x0222B048
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x14
	blo _0222B056
	bl GF_AssertFail
_0222B056:
	mov r0, #0x73
	add r1, r5, r4
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	cmp r0, #6
	blo _0222B066
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222B066:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222B048

	thumb_func_start ov45_0222B06C
ov45_0222B06C: ; 0x0222B06C
	push {r3, lr}
	ldr r1, _0222B090 ; =0x000001C6
	ldrb r2, [r0, r1]
	cmp r2, #4
	bne _0222B07A
	mov r0, #1
	pop {r3, pc}
_0222B07A:
	sub r1, r1, #6
	add r0, r0, r1
	bl ov45_0222BE74
	cmp r0, #0
	bne _0222B08A
	mov r0, #1
	pop {r3, pc}
_0222B08A:
	mov r0, #0
	pop {r3, pc}
	nop
_0222B090: .word 0x000001C6
	thumb_func_end ov45_0222B06C

	thumb_func_start ov45_0222B094
ov45_0222B094: ; 0x0222B094
	mov r1, #7
	lsl r1, r1, #6
	ldr r3, _0222B0A0 ; =ov45_0222BE94
	add r0, r0, r1
	bx r3
	nop
_0222B0A0: .word ov45_0222BE94
	thumb_func_end ov45_0222B094

	thumb_func_start ov45_0222B0A4
ov45_0222B0A4: ; 0x0222B0A4
	ldr r1, _0222B0AC ; =0x000001C7
	mov r2, #1
	strb r2, [r0, r1]
	bx lr
	.balign 4, 0
_0222B0AC: .word 0x000001C7
	thumb_func_end ov45_0222B0A4

	thumb_func_start ov45_0222B0B0
ov45_0222B0B0: ; 0x0222B0B0
	ldr r1, _0222B0B8 ; =0x000001C7
	ldrb r0, [r0, r1]
	bx lr
	nop
_0222B0B8: .word 0x000001C7
	thumb_func_end ov45_0222B0B0

	thumb_func_start ov45_0222B0BC
ov45_0222B0BC: ; 0x0222B0BC
	push {r4, lr}
	add r4, r0, #0
	bl ov45_0222AFF8
	cmp r0, #1
	bne _0222B0D6
	mov r1, #7
	lsl r1, r1, #6
	add r0, r4, r1
	add r1, r1, #4
	ldrh r1, [r4, r1]
	bl ov45_0222BDCC
_0222B0D6:
	pop {r4, pc}
	thumb_func_end ov45_0222B0BC

	thumb_func_start ov45_0222B0D8
ov45_0222B0D8: ; 0x0222B0D8
	mov r2, #7
	lsl r2, r2, #6
	ldr r3, _0222B0E4 ; =ov45_0222BDCC
	add r0, r0, r2
	bx r3
	nop
_0222B0E4: .word ov45_0222BDCC
	thumb_func_end ov45_0222B0D8

	thumb_func_start ov45_0222B0E8
ov45_0222B0E8: ; 0x0222B0E8
	mov r2, #7
	lsl r2, r2, #6
	ldr r3, _0222B0F4 ; =ov45_0222BD94
	add r0, r0, r2
	bx r3
	nop
_0222B0F4: .word ov45_0222BD94
	thumb_func_end ov45_0222B0E8

	thumb_func_start ov45_0222B0F8
ov45_0222B0F8: ; 0x0222B0F8
	push {r3, lr}
	ldr r0, [r0]
	bl Sav2_GameStats_get
	mov r1, #0x2f
	bl GameStats_Inc
	pop {r3, pc}
	thumb_func_end ov45_0222B0F8

	thumb_func_start ov45_0222B108
ov45_0222B108: ; 0x0222B108
	push {r3, lr}
	ldr r0, [r0]
	bl Sav2_GameStats_get
	mov r1, #0x77
	bl GameStats_Inc
	pop {r3, pc}
	thumb_func_end ov45_0222B108

	thumb_func_start ov45_0222B118
ov45_0222B118: ; 0x0222B118
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #8
	blt _0222B126
	bl GF_AssertFail
_0222B126:
	mov r0, #0xe9
	mov r2, #1
	add r1, r5, r4
	lsl r0, r0, #2
	strb r2, [r1, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222B118

	thumb_func_start ov45_0222B134
ov45_0222B134: ; 0x0222B134
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r6, #0xe9
	add r5, r0, #0
	add r7, r4, #0
	lsl r6, r6, #2
_0222B140:
	add r0, r5, r4
	ldrb r0, [r0, r6]
	cmp r0, #0
	bne _0222B1A8
	cmp r4, #7
	bhi _0222B19E
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222B158: ; jump table
	.short _0222B168 - _0222B158 - 2 ; case 0
	.short _0222B168 - _0222B158 - 2 ; case 1
	.short _0222B168 - _0222B158 - 2 ; case 2
	.short _0222B17A - _0222B158 - 2 ; case 3
	.short _0222B17A - _0222B158 - 2 ; case 4
	.short _0222B17A - _0222B158 - 2 ; case 5
	.short _0222B18C - _0222B158 - 2 ; case 6
	.short _0222B19E - _0222B158 - 2 ; case 7
_0222B168:
	add r0, r5, #0
	bl ov45_0222A394
	cmp r0, #1
	bne _0222B176
	add r0, r7, #0
	b _0222B1A0
_0222B176:
	mov r0, #1
	b _0222B1A0
_0222B17A:
	add r0, r5, #0
	bl ov45_0222A330
	cmp r0, #1
	bne _0222B188
	mov r0, #0
	b _0222B1A0
_0222B188:
	mov r0, #1
	b _0222B1A0
_0222B18C:
	add r0, r5, #0
	bl ov45_0222A3A0
	cmp r0, #1
	bne _0222B19A
	mov r0, #0
	b _0222B1A0
_0222B19A:
	mov r0, #1
	b _0222B1A0
_0222B19E:
	mov r0, #1
_0222B1A0:
	cmp r0, #1
	bne _0222B1A8
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222B1A8:
	add r4, r4, #1
	cmp r4, #8
	blt _0222B140
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov45_0222B134

	thumb_func_start ov45_0222B1B4
ov45_0222B1B4: ; 0x0222B1B4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0xeb
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov45_0222C900
	add r5, r0, #0
	add r0, r4, #0
	bl ov45_0222A53C
	add r1, r0, #0
	add r0, r4, #0
	bl ov45_0222AB28
	cmp r0, #1
	bne _0222B1D8
	add r5, r5, #2
_0222B1D8:
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222B1B4

	thumb_func_start ov45_0222B1DC
ov45_0222B1DC: ; 0x0222B1DC
	ldr r1, _0222B1E4 ; =0x0000049C
	ldr r3, _0222B1E8 ; =ov45_0222CB40
	add r0, r0, r1
	bx r3
	.balign 4, 0
_0222B1E4: .word 0x0000049C
_0222B1E8: .word ov45_0222CB40
	thumb_func_end ov45_0222B1DC

	thumb_func_start ov45_0222B1EC
ov45_0222B1EC: ; 0x0222B1EC
	ldr r1, _0222B1F4 ; =0x0000049C
	ldr r3, _0222B1F8 ; =ov45_0222CB3C
	add r0, r0, r1
	bx r3
	.balign 4, 0
_0222B1F4: .word 0x0000049C
_0222B1F8: .word ov45_0222CB3C
	thumb_func_end ov45_0222B1EC

	thumb_func_start ov45_0222B1FC
ov45_0222B1FC: ; 0x0222B1FC
	add r3, r1, #0
	ldr r1, _0222B218 ; =0x00000524
	mov r2, #1
	str r2, [r0, r1]
	sub r1, #0x14
	add r2, r0, r1
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	nop
_0222B218: .word 0x00000524
	thumb_func_end ov45_0222B1FC

	thumb_func_start ov45_0222B21C
ov45_0222B21C: ; 0x0222B21C
	add r3, r1, #0
	ldr r1, _0222B240 ; =0x00000524
	ldr r2, [r0, r1]
	cmp r2, #1
	bne _0222B23A
	sub r1, #0x14
	add r2, r0, r1
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	mov r0, #1
	bx lr
_0222B23A:
	mov r0, #0
	bx lr
	nop
_0222B240: .word 0x00000524
	thumb_func_end ov45_0222B21C

	thumb_func_start ov45_0222B244
ov45_0222B244: ; 0x0222B244
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222B268 ; =0x000004B8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222B254
	bl GF_AssertFail
_0222B254:
	ldr r0, [r4]
	bl Sav2_PlayerData_GetProfileAddr
	ldr r1, _0222B26C ; =0x00000528
	ldr r1, [r4, r1]
	bl sub_02078DD8
	ldr r1, _0222B268 ; =0x000004B8
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_0222B268: .word 0x000004B8
_0222B26C: .word 0x00000528
	thumb_func_end ov45_0222B244

	thumb_func_start ov45_0222B270
ov45_0222B270: ; 0x0222B270
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222B288 ; =0x000004B8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222B286
	bl sub_02078E28
	ldr r0, _0222B288 ; =0x000004B8
	mov r1, #0
	str r1, [r4, r0]
_0222B286:
	pop {r4, pc}
	.balign 4, 0
_0222B288: .word 0x000004B8
	thumb_func_end ov45_0222B270

	thumb_func_start ov45_0222B28C
ov45_0222B28C: ; 0x0222B28C
	push {r3, r4}
	mov r4, #0
	cmp r1, #0
	bls _0222B2AA
	ldr r2, _0222B2B0 ; =0x0000FFFF
_0222B296:
	ldrh r3, [r0]
	cmp r3, r2
	bne _0222B2A2
	mov r0, #1
	pop {r3, r4}
	bx lr
_0222B2A2:
	add r4, r4, #1
	add r0, r0, #2
	cmp r4, r1
	blo _0222B296
_0222B2AA:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0222B2B0: .word 0x0000FFFF
	thumb_func_end ov45_0222B28C

	thumb_func_start ov45_0222B2B4
ov45_0222B2B4: ; 0x0222B2B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r2, #0
	str r1, [sp]
	cmp r3, #0
	beq _0222B38A
	ldr r2, _0222B460 ; =0x00000508
	mov r1, #0x42
	add r0, r4, r2
	add r2, #0x20
	lsl r1, r1, #2
	ldr r2, [r4, r2]
	add r1, r4, r1
	bl ov45_0222BCE4
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r1, [r4]
	add r0, r4, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222B2EA
	ldr r0, _0222B464 ; =0x0000052C
	mov r1, #1
	str r1, [r4, r0]
_0222B2EA:
	add r0, r5, #0
	bl ov45_0222EC68
	mov r2, #0x16
	lsl r2, r2, #4
	add r1, r0, #0
	ldrb r2, [r4, r2]
	ldr r0, [r4, #4]
	mov r3, #3
	bl ov45_0222D8C8
	mov r0, #0x4a
	lsl r0, r0, #2
	str r5, [r4, r0]
	add r0, r5, #0
	add r1, sp, #0xc
	bl ov45_0222EA4C
	mov r0, #5
	lsl r0, r0, #6
	add r0, r4, r0
	add r1, sp, #0xc
	bl ov45_0222D500
	mov r0, #0x4a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov45_0222AA84
	add r6, r0, #0
	mov r0, #0x4a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov45_0222AAA8
	add r7, r0, #0
	mov r0, #0x4a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov45_0222AA28
	cmp r6, #0
	beq _0222B364
	cmp r0, #1
	bne _0222B364
	mov r2, #5
	ldr r3, _0222B468 ; =0x00000528
	lsl r2, r2, #6
	lsl r0, r6, #0x10
	lsl r1, r7, #0x18
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	bl ov45_02230F94
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [sp, #4]
	str r0, [r4, r1]
	b _0222B376
_0222B364:
	mov r0, #0x51
	mov r1, #0xc
	lsl r0, r0, #2
	strb r1, [r4, r0]
	add r1, r0, #1
	mov r2, #0
	strb r2, [r4, r1]
	add r0, r0, #2
	strb r2, [r4, r0]
_0222B376:
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r1, [r4]
	add r0, r4, r0
	bl ov45_0222BAC4
	add r0, r4, #0
	bl ov45_0222BA3C
	b _0222B3CE
_0222B38A:
	bl ov45_0222EA78
	add r6, r0, #0
	add r0, r5, #0
	bl ov45_0222EC68
	add r7, r0, #0
	ldr r0, [sp]
	bl ov45_0222A9CC
	add r2, r0, #0
	ldr r0, [r4, #4]
	add r1, r7, #0
	mov r3, #0
	bl ov45_0222D8C8
	cmp r6, r5
	bne _0222B3B6
	ldr r0, [r4, #4]
	add r1, r7, #0
	bl ov45_0222D8F0
_0222B3B6:
	ldr r0, _0222B46C ; =0x000004BC
	mov r2, #0
	add r0, r4, r0
	add r1, r5, #0
	mvn r2, r2
	bl ov45_0222CBD0
	cmp r0, #0
	beq _0222B3CE
	add r0, r4, #0
	bl ov45_0222BA3C
_0222B3CE:
	add r0, r5, #0
	bl ov45_0222EC68
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0xf8
	ldr r1, [r0]
	mov r0, #1
	lsl r0, r6
	orr r1, r0
	add r0, r4, #0
	add r0, #0xf8
	str r1, [r0]
	add r0, r5, #0
	bl ov45_0222F484
	cmp r0, #1
	bne _0222B43E
	mov r0, #0xf3
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r6, #0
	mov r2, #1
	bl ov45_0222C944
	str r6, [sp, #8]
	mov r2, #0xf3
	lsl r2, r2, #2
	ldr r0, [r4, #4]
	add r1, sp, #8
	add r2, r4, r2
	bl ov45_0222DC08
	add r0, r5, #0
	bl ov45_0222F4AC
	add r3, r0, #0
	beq _0222B42C
	mov r0, #0xf9
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r6, #0
	mov r2, #1
	bl ov45_0222C9A0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0222B42C:
	mov r0, #0xf9
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r6, #0
	mov r2, #0
	bl ov45_0222C9A0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0222B43E:
	mov r0, #0xf3
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r6, #0
	mov r2, #0
	bl ov45_0222C944
	mov r0, #0xf9
	lsl r0, r0, #2
	mov r2, #0
	add r0, r4, r0
	add r1, r6, #0
	add r3, r2, #0
	bl ov45_0222C9A0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222B460: .word 0x00000508
_0222B464: .word 0x0000052C
_0222B468: .word 0x00000528
_0222B46C: .word 0x000004BC
	thumb_func_end ov45_0222B2B4

	thumb_func_start ov45_0222B470
ov45_0222B470: ; 0x0222B470
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl ov45_0222E9E0
	cmp r6, r0
	beq _0222B528
	add r0, r6, #0
	bl ov45_0222EC68
	add r4, r0, #0
	add r0, r5, #0
	bl ov45_0222AFF8
	cmp r0, #1
	bne _0222B4A4
	add r0, r5, #0
	bl ov45_0222B020
	cmp r4, r0
	bne _0222B4A4
	mov r0, #7
	lsl r0, r0, #6
	add r0, r5, r0
	bl ov45_0222BD5C
_0222B4A4:
	ldr r0, [r5, #4]
	add r1, r4, #0
	bl ov45_0222D8D4
	cmp r0, #0
	beq _0222B4C2
	add r0, r6, #0
	bl ov45_0222EAD4
	bl ov45_0222EC68
	add r1, r0, #0
	ldr r0, [r5, #4]
	bl ov45_0222D8F0
_0222B4C2:
	mov r0, #0xf3
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0
	bl ov45_0222C944
	mov r0, #7
	lsl r0, r0, #6
	add r0, r5, r0
	add r1, r4, #0
	bl ov45_0222BDE8
	mov r0, #7
	lsl r0, r0, #6
	add r0, r5, r0
	add r1, r4, #0
	bl ov45_0222BDB0
	ldr r0, _0222B52C ; =0x000004BC
	mov r2, #0
	add r0, r5, r0
	add r1, r6, #0
	mvn r2, r2
	bl ov45_0222CBD0
	cmp r0, #0
	beq _0222B500
	add r0, r5, #0
	bl ov45_0222BA3C
_0222B500:
	mov r0, #0xf9
	lsl r0, r0, #2
	mov r2, #0
	add r0, r5, r0
	add r1, r4, #0
	add r3, r2, #0
	bl ov45_0222C9A0
	add r0, r6, #0
	bl ov45_0222EC68
	add r1, r5, #0
	add r1, #0xfc
	ldr r2, [r1]
	mov r1, #1
	lsl r1, r0
	add r0, r2, #0
	orr r0, r1
	add r5, #0xfc
	str r0, [r5]
_0222B528:
	pop {r4, r5, r6, pc}
	nop
_0222B52C: .word 0x000004BC
	thumb_func_end ov45_0222B470

	thumb_func_start ov45_0222B530
ov45_0222B530: ; 0x0222B530
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl ov45_0222EC68
	mov r1, #0x41
	add r6, r0, #0
	lsl r1, r1, #2
	mov r2, #1
	ldr r0, [r4, r1]
	lsl r2, r6
	orr r0, r2
	str r0, [r4, r1]
	add r0, r5, #0
	bl ov45_0222A920
	cmp r0, #8
	bhi _0222B57E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222B560: ; jump table
	.short _0222B57E - _0222B560 - 2 ; case 0
	.short _0222B57E - _0222B560 - 2 ; case 1
	.short _0222B572 - _0222B560 - 2 ; case 2
	.short _0222B572 - _0222B560 - 2 ; case 3
	.short _0222B572 - _0222B560 - 2 ; case 4
	.short _0222B572 - _0222B560 - 2 ; case 5
	.short _0222B572 - _0222B560 - 2 ; case 6
	.short _0222B572 - _0222B560 - 2 ; case 7
	.short _0222B572 - _0222B560 - 2 ; case 8
_0222B572:
	mov r0, #7
	lsl r0, r0, #6
	add r0, r4, r0
	add r1, r6, #0
	bl ov45_0222BDE8
_0222B57E:
	add r0, r5, #0
	bl ov45_0222AADC
	cmp r0, #1
	bne _0222B59C
	add r0, r5, #0
	bl ov45_0222AAC8
	add r1, r0, #0
	mov r0, #0xeb
	lsl r0, r0, #2
	add r0, r4, r0
	add r2, r6, #0
	bl ov45_0222C8C8
_0222B59C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov45_0222B530

	thumb_func_start ov45_0222B5A0
ov45_0222B5A0: ; 0x0222B5A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0
	mov r6, #0
	bl ov45_022320C4
	add r0, r4, #0
	add r0, #0xd4
	add r1, sp, #0
	bl ov45_0222D500
	add r0, sp, #0
	ldmia r0!, {r2, r3}
	add r0, r4, #0
	add r0, #0xd8
	stmia r0!, {r2, r3}
	cmp r5, #0x13
	bls _0222B5CA
	b _0222B73A
_0222B5CA:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222B5D6: ; jump table
	.short _0222B5FE - _0222B5D6 - 2 ; case 0
	.short _0222B64A - _0222B5D6 - 2 ; case 1
	.short _0222B634 - _0222B5D6 - 2 ; case 2
	.short _0222B634 - _0222B5D6 - 2 ; case 3
	.short _0222B634 - _0222B5D6 - 2 ; case 4
	.short _0222B634 - _0222B5D6 - 2 ; case 5
	.short _0222B634 - _0222B5D6 - 2 ; case 6
	.short _0222B672 - _0222B5D6 - 2 ; case 7
	.short _0222B65C - _0222B5D6 - 2 ; case 8
	.short _0222B65C - _0222B5D6 - 2 ; case 9
	.short _0222B65C - _0222B5D6 - 2 ; case 10
	.short _0222B69A - _0222B5D6 - 2 ; case 11
	.short _0222B684 - _0222B5D6 - 2 ; case 12
	.short _0222B684 - _0222B5D6 - 2 ; case 13
	.short _0222B684 - _0222B5D6 - 2 ; case 14
	.short _0222B71E - _0222B5D6 - 2 ; case 15
	.short _0222B6AC - _0222B5D6 - 2 ; case 16
	.short _0222B6D6 - _0222B5D6 - 2 ; case 17
	.short _0222B6F4 - _0222B5D6 - 2 ; case 18
	.short _0222B704 - _0222B5D6 - 2 ; case 19
_0222B5FE:
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0xd4
	bl ov45_0222D8BC
	add r0, r4, #0
	add r0, #0xd8
	ldmia r0!, {r2, r3}
	add r0, r4, #0
	mov r1, #0x7f
	add r0, #0xe0
	stmia r0!, {r2, r3}
	lsl r1, r1, #2
	ldrb r3, [r4, r1]
	mov r0, #1
	mov r2, #1
	bic r3, r0
	add r0, r3, #0
	orr r0, r2
	strb r0, [r4, r1]
	add r0, r2, #0
	add r0, #0xff
	ldr r0, [r4, r0]
	orr r0, r2
	add r2, #0xff
	str r0, [r4, r2]
	b _0222B73A
_0222B634:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0222B64A
	mov r1, #0x4b
	lsl r1, r1, #2
	mov r6, #1
	add r0, r1, #0
	str r6, [r4, #8]
	add r0, #0xd6
	mov r7, #0
	strh r1, [r4, r0]
_0222B64A:
	ldr r0, _0222B74C ; =0x000001FD
	strb r5, [r4, r0]
	sub r0, #0xfd
	ldr r1, [r4, r0]
	mov r0, #2
	orr r1, r0
	add r0, #0xfe
	str r1, [r4, r0]
	b _0222B73A
_0222B65C:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0222B672
	mov r1, #0x4b
	lsl r1, r1, #2
	mov r6, #1
	add r0, r1, #0
	str r6, [r4, #8]
	add r0, #0xd6
	mov r7, #0
	strh r1, [r4, r0]
_0222B672:
	ldr r0, _0222B750 ; =0x000001FE
	strb r5, [r4, r0]
	sub r0, #0xfe
	ldr r1, [r4, r0]
	mov r0, #4
	orr r1, r0
	add r0, #0xfc
	str r1, [r4, r0]
	b _0222B73A
_0222B684:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0222B69A
	mov r1, #0x4b
	lsl r1, r1, #2
	mov r6, #1
	add r0, r1, #0
	str r6, [r4, #8]
	add r0, #0xd6
	mov r7, #0
	strh r1, [r4, r0]
_0222B69A:
	ldr r0, _0222B754 ; =0x000001FF
	strb r5, [r4, r0]
	sub r0, #0xff
	ldr r1, [r4, r0]
	mov r0, #8
	orr r1, r0
	add r0, #0xf8
	str r1, [r4, r0]
	b _0222B73A
_0222B6AC:
	mov r6, #1
	mov r0, #6
	add r7, r6, #0
	bl ov45_0222ECDC
	add r5, r0, #0
	mov r0, #7
	bl ov45_0222ECDC
	add r2, r0, #0
	ldr r0, _0222B758 ; =0x0000049C
	add r1, r5, #0
	add r0, r4, r0
	bl ov45_0222CA7C
	mov r1, #0x4b
	lsl r1, r1, #2
	add r0, r1, #0
	add r0, #0xd8
	strh r1, [r4, r0]
	b _0222B73A
_0222B6D6:
	mov r1, #0x7f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0xc
	bic r2, r0
	mov r0, #8
	orr r2, r0
	add r0, #0xf8
	strb r2, [r4, r1]
	ldr r1, [r4, r0]
	mov r0, #0x20
	orr r1, r0
	add r0, #0xe0
	str r1, [r4, r0]
	b _0222B73A
_0222B6F4:
	mov r1, #0x4b
	lsl r1, r1, #2
	add r0, r1, #0
	add r0, #0xda
	mov r6, #1
	mov r7, #2
	strh r1, [r4, r0]
	b _0222B73A
_0222B704:
	mov r1, #0x7f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x80
	mov r6, #1
	orr r2, r0
	strb r2, [r4, r1]
	mov r1, #0xe1
	lsl r1, r1, #2
	lsl r0, r0, #2
	mov r7, #4
	strh r1, [r4, r0]
	b _0222B73A
_0222B71E:
	mov r1, #0x7f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x60
	bic r2, r0
	mov r0, #0x20
	orr r2, r0
	add r0, #0xe0
	strb r2, [r4, r1]
	ldr r1, [r4, r0]
	mov r0, #0x10
	orr r1, r0
	add r0, #0xf0
	str r1, [r4, r0]
_0222B73A:
	cmp r6, #0
	beq _0222B746
	add r0, r4, #0
	add r1, r7, #0
	bl ov45_0222C370
_0222B746:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222B74C: .word 0x000001FD
_0222B750: .word 0x000001FE
_0222B754: .word 0x000001FF
_0222B758: .word 0x0000049C
	thumb_func_end ov45_0222B5A0

	thumb_func_start ov45_0222B75C
ov45_0222B75C: ; 0x0222B75C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x42
	add r4, r2, #0
	add r6, r1, #0
	lsl r0, r0, #2
	ldr r1, [r4]
	add r0, r4, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222B77C
	ldr r0, _0222B798 ; =0x0000052C
	mov r1, #1
	str r1, [r4, r0]
	pop {r4, r5, r6, pc}
_0222B77C:
	mov r0, #0x42
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r5, #0
	add r2, r6, #0
	bl ov45_0222BB00
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r1, [r4]
	add r0, r4, r0
	bl ov45_0222BAC4
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222B798: .word 0x0000052C
	thumb_func_end ov45_0222B75C

	thumb_func_start ov45_0222B79C
ov45_0222B79C: ; 0x0222B79C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	mov r2, #0xc8
	bl memset
	add r0, sp, #4
	bl ov45_0222EC10
	add r4, #0x20
	add r0, r4, #0
	bl ov45_0222AA84
	add r6, r0, #0
	add r0, r4, #0
	bl ov45_0222AAA8
	add r2, r0, #0
	lsl r1, r6, #0x10
	lsl r2, r2, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x18
	mov r3, #0
	bl ov45_0222D638
	mov r6, #0
	add r4, r6, #0
_0222B7DA:
	ldr r0, [sp, #8]
	mov r1, #0
	ldr r0, [r0, r4]
	mvn r1, r1
	cmp r0, r1
	beq _0222B80A
	bl ov45_0222EA2C
	str r0, [sp]
	bl ov45_0222AA84
	add r7, r0, #0
	ldr r0, [sp]
	bl ov45_0222AAA8
	add r2, r0, #0
	lsl r1, r7, #0x10
	lsl r2, r2, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x18
	mov r3, #0
	bl ov45_0222D638
_0222B80A:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #0x14
	blt _0222B7DA
	mov r4, #0
	mov r7, #1
_0222B816:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl ov45_0222EDC4
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl ov45_0222EDF0
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl ov45_0222D638
	add r4, r4, #1
	cmp r4, #0x14
	blt _0222B816
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222B79C

	thumb_func_start ov45_0222B840
ov45_0222B840: ; 0x0222B840
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x7f
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _0222B89E
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0222B89E
	bl ov45_0222E96C
	cmp r0, #2
	bne _0222B89E
	add r0, r4, #0
	bl ov45_0222AD4C
	add r2, r4, #0
	add r2, #0xe0
	ldr r3, [r2]
	add r2, r4, #0
	add r2, #0xe4
	mov r1, #0
	ldr r2, [r2]
	add r5, r0, r3
	adc r1, r2
	add r0, r4, #0
	add r0, #0xd8
	ldr r3, [r0]
	add r0, r4, #0
	add r0, #0xdc
	ldr r2, [r0]
	sub r0, r5, r3
	sbc r1, r2
	bge _0222B89E
	mov r1, #0x7f
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	mov r0, #0x80
	orr r2, r0
	strb r2, [r4, r1]
	mov r1, #0xe1
	lsl r1, r1, #2
	lsl r0, r0, #2
	strh r1, [r4, r0]
_0222B89E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222B840

	thumb_func_start ov45_0222B8A0
ov45_0222B8A0: ; 0x0222B8A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	str r1, [sp]
	add r0, r1, #0
	add r4, r2, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #0x18]
	ldr r0, [sp]
	bl SavArray_PlayerParty_get
	str r0, [sp, #0x14]
	ldr r0, [sp]
	bl Sav2_Pokedex_get
	str r0, [sp, #0xc]
	ldr r0, [sp]
	bl sub_0202CA44
	str r0, [sp, #0x10]
	ldr r0, [sp]
	bl Sav2_SysInfo_RTC_get
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	bl PlayerProfile_GetPlayerName_NewString
	add r1, r5, #0
	add r4, r0, #0
	add r1, #0x28
	mov r2, #8
	bl CopyStringToU16Array
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #8
	bl CopyStringToU16Array
	add r0, r4, #0
	bl String_dtor
	mov r0, #0
	mvn r0, r0
	str r0, [r5, #0x20]
	ldr r0, [sp, #0x18]
	bl PlayerProfile_GetTrainerID
	str r0, [r5, #0x24]
	ldr r0, [sp, #0x14]
	bl GetPartyCount
	str r0, [sp, #4]
	mov r4, #0
	add r6, r5, #0
_0222B910:
	ldr r0, [sp, #4]
	cmp r4, r0
	bge _0222B950
	ldr r0, [sp, #0x14]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	add r1, r6, #0
	add r1, #0x40
	strh r0, [r1]
	add r0, r7, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r5, r4
	add r1, #0x4c
	strb r0, [r1]
	add r0, r7, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	add r1, r5, r4
	add r1, #0x52
	strb r0, [r1]
	b _0222B958
_0222B950:
	add r1, r6, #0
	ldr r0, _0222BA38 ; =0x000001EF
	add r1, #0x40
	strh r0, [r1]
_0222B958:
	add r4, r4, #1
	add r6, r6, #2
	cmp r4, #6
	blt _0222B910
	ldr r0, [sp, #0x18]
	bl PlayerProfile_GetTrainerGender
	add r1, r5, #0
	add r1, #0x58
	strb r0, [r1]
	ldr r0, [sp, #0x18]
	bl PlayerProfile_GetLanguage
	add r1, r5, #0
	add r1, #0x59
	strb r0, [r1]
	ldr r0, [sp, #0x18]
	bl PlayerProfile_GetAvatar
	add r1, r5, #0
	add r1, #0x5a
	strh r0, [r1]
	add r0, r5, #0
	add r0, #0x5a
	ldrh r0, [r0]
	bl ov45_0222CCE4
	add r1, r5, #0
	add r1, #0x5a
	strh r0, [r1]
	ldr r0, [sp, #0x10]
	bl sub_0202CA8C
	add r1, r5, #0
	add r1, #0x5c
	strh r0, [r1]
	ldr r0, [sp, #0x10]
	bl sub_0202CA90
	add r1, r5, #0
	add r1, #0x5e
	strb r0, [r1]
	ldr r0, [sp, #0xc]
	bl Pokedex_GetNatDexFlag
	add r1, r5, #0
	add r1, #0x5f
	strb r0, [r1]
	ldr r0, [sp, #0x18]
	bl PlayerProfile_GetGameClearFlag
	add r1, r5, #0
	add r1, #0x60
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #0xff
	add r0, #0x61
	strb r1, [r0]
	add r1, r5, #0
	mov r0, #0
	add r1, #0x63
	strb r0, [r1]
	add r1, r5, #0
	mov r2, #GAME_VERSION
	add r1, #0x62
	strb r2, [r1]
	ldr r1, [sp, #8]
	add r4, r5, #0
	add r1, #0x24
	str r1, [sp, #8]
	ldmia r1!, {r2, r3}
	str r1, [sp, #8]
	add r1, r5, #0
	add r1, #0x64
	stmia r1!, {r2, r3}
	mov r3, #0x18
	add r2, r3, #0
	sub r2, #0x19
_0222B9F4:
	add r1, r5, r0
	add r1, #0x6c
	strb r3, [r1]
	str r2, [r4, #0x78]
	add r0, r0, #1
	add r4, r4, #4
	cmp r0, #0xc
	blt _0222B9F4
	mov r2, #0
	add r3, r5, #0
	add r1, r2, #0
_0222BA0A:
	add r0, r3, #0
	add r0, #0xa8
	add r2, r2, #1
	add r3, r3, #2
	strh r1, [r0]
	cmp r2, #2
	blt _0222BA0A
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	add r0, #0xac
	str r1, [r0]
	add r0, r5, #0
	mov r1, #3
	add r0, #0xb0
	str r1, [r0]
	ldr r1, [sp]
	add r0, r5, #0
	bl ov45_0222BAC4
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0222BA38: .word 0x000001EF
	thumb_func_end ov45_0222B8A0

	thumb_func_start ov45_0222BA3C
ov45_0222BA3C: ; 0x0222BA3C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r1, [r5]
	add r0, r5, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222BA58
	ldr r0, _0222BABC ; =0x0000052C
	mov r1, #1
	str r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0222BA58:
	ldr r7, _0222BAC0 ; =0x000004BC
	mov r4, #0
	add r6, r5, #0
_0222BA5E:
	add r0, r5, r7
	add r1, r4, #0
	bl ov45_0222CC50
	mov r1, #0x5d
	add r2, r5, r4
	lsl r1, r1, #2
	strb r0, [r2, r1]
	add r0, r5, r7
	add r1, r4, #0
	bl ov45_0222CC7C
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r6, r1]
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #0xc
	blt _0222BA5E
	sub r1, #0x68
	add r0, r5, r1
	add r1, #0x18
	add r1, r5, r1
	mov r2, #0x10
	bl MI_CpuCopy8
	mov r0, #0x4a
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov45_0222E9F8
	mov r1, #0x42
	lsl r1, r1, #2
	add r0, r5, r1
	add r1, #0x28
	add r1, r5, r1
	mov r2, #0x10
	bl MI_CpuCopy8
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r1, [r5]
	add r0, r5, r0
	bl ov45_0222BAC4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222BABC: .word 0x0000052C
_0222BAC0: .word 0x000004BC
	thumb_func_end ov45_0222BA3C

	thumb_func_start ov45_0222BAC4
ov45_0222BAC4: ; 0x0222BAC4
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	add r1, r4, #0
	add r1, #0x20
	mov r2, #0x94
	bl SavArray_CalcCRC16
	add r4, #0xb4
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222BAC4

	thumb_func_start ov45_0222BADC
ov45_0222BADC: ; 0x0222BADC
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	add r1, r4, #0
	add r1, #0x20
	mov r2, #0x94
	bl SavArray_CalcCRC16
	add r4, #0xb4
	ldr r1, [r4]
	cmp r0, r1
	beq _0222BAFC
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_0222BAFC:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov45_0222BADC

	thumb_func_start ov45_0222BB00
ov45_0222BB00: ; 0x0222BB00
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r3, r5, #0
	add r7, r2, #0
	add r6, r4, #0
	add r3, #0x20
	mov r2, #0x12
_0222BB10:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0222BB10
	ldr r0, [r6]
	cmp r7, #0x94
	str r0, [r3]
	bhi _0222BB2E
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x20
	add r2, r7, #0
	bl MI_CpuCopy8
	b _0222BB3A
_0222BB2E:
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x20
	mov r2, #0x94
	bl MI_CpuCopy8
_0222BB3A:
	add r4, #8
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x10
	mov r2, #0x10
	bl MI_CpuCopy8
	add r0, r5, #0
	add r5, #0x28
	add r1, r5, #0
	mov r2, #0x10
	bl MI_CpuCopy8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov45_0222BB00

	thumb_func_start ov45_0222BB58
ov45_0222BB58: ; 0x0222BB58
	mov r1, #0
	str r1, [r0, #8]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222BB58

	thumb_func_start ov45_0222BB60
ov45_0222BB60: ; 0x0222BB60
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #4
	add r6, r2, #0
	ldrsh r2, [r5, r1]
	add r7, r3, #0
	sub r0, r2, #1
	bmi _0222BB8C
	strh r0, [r5, #4]
	ldrsh r1, [r5, r1]
	mov r0, #0xd2
	lsl r0, r0, #2
	cmp r1, r0
	bne _0222BBA6
	mov r0, #0
	mov r1, #0x7f
	bl GF_SndStartFadeOutBGM
	mov r0, #1
	strb r0, [r5, #0xe]
	b _0222BBA6
_0222BB8C:
	cmp r2, #0
	bne _0222BBA6
	ldrb r2, [r5]
	mov r0, #2
	orr r0, r2
	strb r0, [r5]
	ldr r2, [r4, #8]
	mov r0, #0x80
	orr r0, r2
	str r0, [r4, #8]
	ldrsh r0, [r5, r1]
	sub r0, r0, #1
	strh r0, [r5, #4]
_0222BBA6:
	mov r0, #6
	ldrsh r2, [r5, r0]
	sub r1, r2, #1
	bmi _0222BBB2
	strh r1, [r5, #6]
	b _0222BBCC
_0222BBB2:
	cmp r2, #0
	bne _0222BBCC
	ldr r2, [r4, #8]
	mov r1, #4
	orr r2, r1
	mov r1, #8
	orr r2, r1
	mov r1, #2
	orr r1, r2
	str r1, [r4, #8]
	ldrsh r0, [r5, r0]
	sub r0, r0, #1
	strh r0, [r5, #6]
_0222BBCC:
	mov r0, #8
	ldrsh r2, [r5, r0]
	sub r1, r2, #1
	bmi _0222BBD8
	strh r1, [r5, #8]
	b _0222BBFC
_0222BBD8:
	cmp r2, #0
	bne _0222BBFC
	ldrb r1, [r5]
	mov r2, #0xc
	bic r1, r2
	mov r2, #4
	orr r1, r2
	strb r1, [r5]
	ldr r2, [r4, #8]
	mov r1, #0x20
	orr r1, r2
	str r1, [r4, #8]
	ldrsh r0, [r5, r0]
	sub r0, r0, #1
	strh r0, [r5, #8]
	add r0, r7, #0
	bl ov45_0222CA8C
_0222BBFC:
	mov r0, #0xa
	ldrsh r1, [r5, r0]
	sub r0, r1, #1
	bmi _0222BC08
	strh r0, [r5, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0222BC08:
	cmp r1, #0
	bne _0222BC36
	add r0, r6, #0
	bl ov45_0222C3A8
	ldrb r0, [r5, #0xc]
	cmp r0, #0
	bne _0222BC1E
	ldr r0, _0222BC38 ; =0x00000481
	bl PlayBGM
_0222BC1E:
	ldrb r1, [r5]
	mov r0, #0x10
	orr r0, r1
	strb r0, [r5]
	ldr r1, [r4, #8]
	mov r0, #0x40
	orr r0, r1
	str r0, [r4, #8]
	mov r0, #0xa
	ldrsh r0, [r5, r0]
	sub r0, r0, #1
	strh r0, [r5, #0xa]
_0222BC36:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222BC38: .word 0x00000481
	thumb_func_end ov45_0222BB60

	thumb_func_start ov45_0222BC3C
ov45_0222BC3C: ; 0x0222BC3C
	ldrb r2, [r0]
	mov r1, #1
	bic r2, r1
	strb r2, [r0]
	ldrb r2, [r0]
	mov r1, #2
	bic r2, r1
	strb r2, [r0]
	ldrb r2, [r0]
	mov r1, #0xc
	bic r2, r1
	strb r2, [r0]
	ldrb r2, [r0]
	mov r1, #0x10
	bic r2, r1
	strb r2, [r0]
	ldrb r2, [r0]
	mov r1, #0x60
	bic r2, r1
	strb r2, [r0]
	ldrb r2, [r0]
	mov r1, #0x80
	bic r2, r1
	strb r2, [r0]
	mov r1, #1
	strb r1, [r0, #1]
	mov r1, #7
	strb r1, [r0, #2]
	mov r1, #0xb
	strb r1, [r0, #3]
	sub r1, #0xc
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	thumb_func_end ov45_0222BC3C

	thumb_func_start ov45_0222BC84
ov45_0222BC84: ; 0x0222BC84
	push {r3, lr}
	ldrb r0, [r0, #0xd]
	cmp r0, #1
	bne _0222BC96
	mov r0, #7
	mov r1, #0x2a
	bl GF_SndHandleSetPlayerVolume
	pop {r3, pc}
_0222BC96:
	mov r0, #7
	mov r1, #0x7f
	bl GF_SndHandleSetPlayerVolume
	pop {r3, pc}
	thumb_func_end ov45_0222BC84

	thumb_func_start ov45_0222BCA0
ov45_0222BCA0: ; 0x0222BCA0
	mov r1, #0xe1
	lsl r1, r1, #2
	strh r1, [r0]
	bx lr
	thumb_func_end ov45_0222BCA0

	thumb_func_start ov45_0222BCA8
ov45_0222BCA8: ; 0x0222BCA8
	mov r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _0222BCB2
	mov r1, #1
_0222BCB2:
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222BCA8

	thumb_func_start ov45_0222BCB8
ov45_0222BCB8: ; 0x0222BCB8
	mov r1, #0
	ldrsh r1, [r0, r1]
	cmp r1, #0
	ble _0222BCC4
	sub r1, r1, #1
	strh r1, [r0]
_0222BCC4:
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222BCB8

	thumb_func_start ov45_0222BCC8
ov45_0222BCC8: ; 0x0222BCC8
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl PlayerProfile_new
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222BCC8

	thumb_func_start ov45_0222BCD8
ov45_0222BCD8: ; 0x0222BCD8
	ldr r3, _0222BCE0 ; =FreeToHeap
	ldr r0, [r0]
	bx r3
	nop
_0222BCE0: .word FreeToHeap
	thumb_func_end ov45_0222BCD8

	thumb_func_start ov45_0222BCE4
ov45_0222BCE4: ; 0x0222BCE4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	add r0, r7, #0
	mov r1, #0x94
	bl AllocFromHeap
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x20
	add r1, r6, #0
	mov r2, #0x94
	bl MIi_CpuCopyFast
	add r4, #0x10
	add r1, r6, #0
	add r0, r4, #0
	add r1, #8
	mov r2, #0x10
	bl MI_CpuCopy8
	ldr r1, [r5]
	add r0, r6, #0
	add r2, r7, #0
	bl ov45_0222A844
	add r0, r6, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov45_0222BCE4

	thumb_func_start ov45_0222BD24
ov45_0222BD24: ; 0x0222BD24
	mov r1, #1
	strb r1, [r0, #2]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222BD24

	thumb_func_start ov45_0222BD2C
ov45_0222BD2C: ; 0x0222BD2C
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end ov45_0222BD2C

	thumb_func_start ov45_0222BD30
ov45_0222BD30: ; 0x0222BD30
	mov r2, #0x14
	mov r1, #0
_0222BD34:
	strb r1, [r0]
	add r0, r0, #1
	sub r2, r2, #1
	bne _0222BD34
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222BD30

	thumb_func_start ov45_0222BD40
ov45_0222BD40: ; 0x0222BD40
	ldr r3, _0222BD48 ; =memset
	mov r1, #0
	mov r2, #0x28
	bx r3
	.balign 4, 0
_0222BD48: .word memset
	thumb_func_end ov45_0222BD40

	thumb_func_start ov45_0222BD4C
ov45_0222BD4C: ; 0x0222BD4C
	mov r1, #0
	strh r1, [r0, #4]
	strb r1, [r0, #6]
	ldr r3, _0222BD58 ; =ov45_0222BE54
	strb r1, [r0, #0xa]
	bx r3
	.balign 4, 0
_0222BD58: .word ov45_0222BE54
	thumb_func_end ov45_0222BD4C

	thumb_func_start ov45_0222BD5C
ov45_0222BD5C: ; 0x0222BD5C
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	strh r1, [r4, #4]
	mov r1, #4
	strb r1, [r4, #6]
	bl ov45_0222BE54
	mov r0, #0
	strb r0, [r4, #0xa]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222BD5C

	thumb_func_start ov45_0222BD74
ov45_0222BD74: ; 0x0222BD74
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x14
	blo _0222BD82
	bl GF_AssertFail
_0222BD82:
	mov r0, #1
	add r1, r0, #0
	ldr r2, [r5]
	lsl r1, r4
	tst r1, r2
	bne _0222BD90
	mov r0, #0
_0222BD90:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222BD74

	thumb_func_start ov45_0222BD94
ov45_0222BD94: ; 0x0222BD94
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x14
	blo _0222BDA2
	bl GF_AssertFail
_0222BDA2:
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r4
	orr r0, r1
	str r0, [r5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222BD94

	thumb_func_start ov45_0222BDB0
ov45_0222BDB0: ; 0x0222BDB0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x14
	blo _0222BDBE
	bl GF_AssertFail
_0222BDBE:
	mov r0, #1
	lsl r0, r4
	ldr r1, [r5]
	mvn r0, r0
	and r0, r1
	str r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222BDB0

	thumb_func_start ov45_0222BDCC
ov45_0222BDCC: ; 0x0222BDCC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x14
	blo _0222BDDA
	bl GF_AssertFail
_0222BDDA:
	add r5, #0xc
	ldrb r0, [r5, r4]
	add r0, r0, #1
	cmp r0, #6
	bgt _0222BDE6
	strb r0, [r5, r4]
_0222BDE6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222BDCC

	thumb_func_start ov45_0222BDE8
ov45_0222BDE8: ; 0x0222BDE8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x14
	blo _0222BDF6
	bl GF_AssertFail
_0222BDF6:
	mov r1, #0
	add r0, r5, r4
	strb r1, [r0, #0xc]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222BDE8

	thumb_func_start ov45_0222BE00
ov45_0222BE00: ; 0x0222BE00
	ldrb r2, [r0, #6]
	strh r2, [r0, #0x22]
	strh r1, [r0, #0x20]
	bx lr
	thumb_func_end ov45_0222BE00

	thumb_func_start ov45_0222BE08
ov45_0222BE08: ; 0x0222BE08
	push {r4, lr}
	ldr r4, _0222BE24 ; =0x000001E2
	add r3, r0, #0
	mov r0, #2
	strh r0, [r3, r4]
	sub r0, r4, #2
	strh r2, [r3, r0]
	sub r2, r4, #2
	add r2, r3, r2
	mov r0, #1
	mov r3, #4
	bl ov45_0222EF4C
	pop {r4, pc}
	.balign 4, 0
_0222BE24: .word 0x000001E2
	thumb_func_end ov45_0222BE08

	thumb_func_start ov45_0222BE28
ov45_0222BE28: ; 0x0222BE28
	push {r4, lr}
	ldr r2, _0222BE44 ; =0x000001C6
	add r4, r0, #0
	mov r3, #4
	add r0, r2, #0
	strb r3, [r4, r2]
	add r0, #0x1c
	add r2, #0x1a
	strh r3, [r4, r0]
	mov r0, #2
	add r2, r4, r2
	bl ov45_0222EF4C
	pop {r4, pc}
	.balign 4, 0
_0222BE44: .word 0x000001C6
	thumb_func_end ov45_0222BE28

	thumb_func_start ov45_0222BE48
ov45_0222BE48: ; 0x0222BE48
	mov r1, #1
	strh r1, [r0, #0x24]
	mov r1, #0
	strh r1, [r0, #0x26]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222BE48

	thumb_func_start ov45_0222BE54
ov45_0222BE54: ; 0x0222BE54
	mov r1, #0
	strh r1, [r0, #0x24]
	strh r1, [r0, #0x26]
	bx lr
	thumb_func_end ov45_0222BE54

	thumb_func_start ov45_0222BE5C
ov45_0222BE5C: ; 0x0222BE5C
	ldrh r1, [r0, #0x24]
	cmp r1, #1
	bne _0222BE72
	mov r1, #0x26
	ldrsh r1, [r0, r1]
	add r2, r1, #1
	mov r1, #0xe1
	lsl r1, r1, #2
	cmp r2, r1
	bgt _0222BE72
	strh r2, [r0, #0x26]
_0222BE72:
	bx lr
	thumb_func_end ov45_0222BE5C

	thumb_func_start ov45_0222BE74
ov45_0222BE74: ; 0x0222BE74
	ldrh r1, [r0, #0x24]
	cmp r1, #0
	bne _0222BE7E
	mov r0, #1
	bx lr
_0222BE7E:
	mov r1, #0x26
	ldrsh r1, [r0, r1]
	mov r0, #0xe1
	lsl r0, r0, #2
	cmp r1, r0
	bge _0222BE8E
	mov r0, #1
	bx lr
_0222BE8E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222BE74

	thumb_func_start ov45_0222BE94
ov45_0222BE94: ; 0x0222BE94
	mov r1, #0x26
	ldrsh r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222BE94

	thumb_func_start ov45_0222BE9C
ov45_0222BE9C: ; 0x0222BE9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldrb r0, [r1, #0x10]
	str r1, [sp]
	cmp r0, #2
	bne _0222BF0E
	mov r7, #0
	add r4, r1, #0
	add r5, r6, #0
_0222BEB0:
	ldr r0, [r4]
	bl ov45_0222EC68
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0222BF0E
	add r0, r6, #0
	bl ov45_0222A578
	add r1, r5, #0
	ldr r2, _0222BF14 ; =0x00000528
	add r1, #0xe8
	ldr r1, [r1]
	ldr r2, [r6, r2]
	bl ov45_0222A844
	add r7, r7, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #2
	blt _0222BEB0
	add r0, r6, #0
	add r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #4]
	add r0, r6, #0
	add r0, #0xec
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [sp]
	ldr r0, [r0]
	bl ov45_0222EC68
	add r1, sp, #4
	strh r0, [r1, #8]
	ldr r0, [sp]
	ldr r0, [r0, #4]
	bl ov45_0222EC68
	add r1, sp, #4
	strh r0, [r1, #0xa]
	ldr r0, [r6, #4]
	add r1, sp, #4
	bl ov45_0222D940
_0222BF0E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222BF14: .word 0x00000528
	thumb_func_end ov45_0222BE9C

	thumb_func_start ov45_0222BF18
ov45_0222BF18: ; 0x0222BF18
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	ldrb r0, [r1, #0x10]
	str r1, [sp]
	cmp r0, #2
	bne _0222BF90
	mov r7, #0
	add r4, r1, #0
	add r5, r6, #0
_0222BF2C:
	ldr r0, [r4]
	bl ov45_0222EC68
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0222BF90
	add r0, r6, #0
	bl ov45_0222A578
	add r1, r5, #0
	ldr r2, _0222BF94 ; =0x00000528
	add r1, #0xe8
	ldr r1, [r1]
	ldr r2, [r6, r2]
	bl ov45_0222A844
	add r7, r7, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #2
	blt _0222BF2C
	add r0, r6, #0
	add r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #4]
	add r0, r6, #0
	add r0, #0xec
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [sp]
	ldr r0, [r0]
	bl ov45_0222EC68
	add r1, sp, #4
	strh r0, [r1, #8]
	ldr r0, [sp]
	ldr r0, [r0, #4]
	bl ov45_0222EC68
	add r1, sp, #4
	strh r0, [r1, #0xa]
	ldr r0, [sp]
	add r1, sp, #4
	ldrb r0, [r0, #0x12]
	str r0, [sp, #0x10]
	ldr r0, [r6, #4]
	bl ov45_0222D990
_0222BF90:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222BF94: .word 0x00000528
	thumb_func_end ov45_0222BF18

	thumb_func_start ov45_0222BF98
ov45_0222BF98: ; 0x0222BF98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r6, r0, #0
	ldrb r0, [r1, #0x10]
	str r1, [sp]
	cmp r0, #4
	bhi _0222BFAA
	cmp r0, #0
	bne _0222BFAC
_0222BFAA:
	b _0222C0C2
_0222BFAC:
	add r0, r1, #0
	ldrb r0, [r0, #0x13]
	add r5, sp, #0x30
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0222C010
	add r0, r1, #0
	mov r7, #0
	str r0, [sp, #4]
	add r4, r6, #0
_0222BFC2:
	ldr r0, [sp]
	ldrb r0, [r0, #0x10]
	cmp r7, r0
	bge _0222BFFA
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov45_0222EC68
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0222C0C2
	add r0, r6, #0
	bl ov45_0222A578
	add r1, r4, #0
	ldr r2, _0222C0C8 ; =0x00000528
	add r1, #0xe8
	ldr r1, [r1]
	ldr r2, [r6, r2]
	bl ov45_0222A844
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	str r0, [r5]
	b _0222BFFE
_0222BFFA:
	mov r0, #0
	str r0, [r5]
_0222BFFE:
	ldr r0, [sp, #4]
	add r7, r7, #1
	add r0, r0, #4
	str r0, [sp, #4]
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #4
	blt _0222BFC2
	b _0222C060
_0222C010:
	add r0, r1, #0
	mov r7, #0
	str r0, [sp, #8]
	add r4, r6, #0
_0222C018:
	cmp r7, #0
	bne _0222C04C
	ldr r0, [sp, #8]
	ldr r0, [r0]
	bl ov45_0222EC68
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0222C0C2
	add r0, r6, #0
	bl ov45_0222A578
	add r1, r4, #0
	ldr r2, _0222C0C8 ; =0x00000528
	add r1, #0xe8
	ldr r1, [r1]
	ldr r2, [r6, r2]
	bl ov45_0222A844
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	str r0, [r5]
	b _0222C050
_0222C04C:
	mov r0, #0
	str r0, [r5]
_0222C050:
	ldr r0, [sp, #8]
	add r7, r7, #1
	add r0, r0, #4
	str r0, [sp, #8]
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #4
	blt _0222C018
_0222C060:
	ldr r0, [sp]
	ldrb r0, [r0, #0x13]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldrb r0, [r0, #0x10]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x34]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0x20]
	ldr r0, [sp]
	ldr r0, [r0]
	bl ov45_0222EC68
	add r1, sp, #0xc
	strh r0, [r1, #0x18]
	ldr r0, [sp]
	ldr r0, [r0, #4]
	bl ov45_0222EC68
	add r1, sp, #0xc
	strh r0, [r1, #0x1a]
	ldr r0, [sp]
	ldr r0, [r0, #8]
	bl ov45_0222EC68
	add r1, sp, #0xc
	strh r0, [r1, #0x1c]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl ov45_0222EC68
	add r1, sp, #0xc
	strh r0, [r1, #0x1e]
	ldr r0, [sp]
	add r1, sp, #0xc
	ldrb r0, [r0, #0x13]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	str r0, [sp, #0x2c]
	ldr r0, [r6, #4]
	bl ov45_0222D9EC
_0222C0C2:
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222C0C8: .word 0x00000528
	thumb_func_end ov45_0222BF98

	thumb_func_start ov45_0222C0CC
ov45_0222C0CC: ; 0x0222C0CC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0x10]
	cmp r0, #8
	bhi _0222C128
	cmp r0, #0
	beq _0222C128
	ldr r0, [r4]
	bl ov45_0222EC68
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0222C128
	add r0, r5, #0
	bl ov45_0222A578
	add r1, r5, #0
	ldr r2, _0222C12C ; =0x00000528
	add r1, #0xe8
	ldr r1, [r1]
	ldr r2, [r5, r2]
	bl ov45_0222A844
	ldrb r0, [r4, #0x13]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	str r0, [sp]
	ldrb r0, [r4, #0x10]
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [r4]
	bl ov45_0222EC68
	add r1, sp, #0
	strh r0, [r1, #0xc]
	ldr r0, [r5, #4]
	add r1, sp, #0
	bl ov45_0222DA80
_0222C128:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222C12C: .word 0x00000528
	thumb_func_end ov45_0222C0CC

	thumb_func_start ov45_0222C130
ov45_0222C130: ; 0x0222C130
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r0, [sp]
	ldrb r0, [r1, #0x10]
	str r1, [sp, #4]
	cmp r0, #4
	bhi _0222C1E2
	cmp r0, #0
	beq _0222C1E2
	ldr r4, [sp]
	mov r7, #0
	add r6, r1, #0
	add r5, sp, #0x24
_0222C14A:
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0x10]
	cmp r7, r0
	bge _0222C182
	ldr r0, [r6]
	bl ov45_0222EC68
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0222C1E2
	ldr r0, [sp]
	bl ov45_0222A578
	add r1, r4, #0
	add r1, #0xe8
	ldr r3, [sp]
	ldr r2, _0222C1E8 ; =0x00000528
	ldr r1, [r1]
	ldr r2, [r3, r2]
	bl ov45_0222A844
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	str r0, [r5]
	b _0222C186
_0222C182:
	mov r0, #0
	str r0, [r5]
_0222C186:
	add r7, r7, #1
	add r6, r6, #4
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #4
	blt _0222C14A
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0x10]
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x14]
	ldr r0, [sp, #4]
	ldr r0, [r0, #4]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x16]
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x18]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x1a]
	ldr r0, [sp]
	add r1, sp, #8
	ldr r0, [r0, #4]
	bl ov45_0222DAE0
_0222C1E2:
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0222C1E8: .word 0x00000528
	thumb_func_end ov45_0222C130

	thumb_func_start ov45_0222C1EC
ov45_0222C1EC: ; 0x0222C1EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r0, [sp]
	ldrb r0, [r1, #0x10]
	str r1, [sp, #4]
	cmp r0, #4
	bhi _0222C29E
	cmp r0, #0
	beq _0222C29E
	ldr r4, [sp]
	mov r7, #0
	add r6, r1, #0
	add r5, sp, #0x24
_0222C206:
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0x10]
	cmp r7, r0
	bge _0222C23E
	ldr r0, [r6]
	bl ov45_0222EC68
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0222C29E
	ldr r0, [sp]
	bl ov45_0222A578
	add r1, r4, #0
	add r1, #0xe8
	ldr r3, [sp]
	ldr r2, _0222C2A4 ; =0x00000528
	ldr r1, [r1]
	ldr r2, [r3, r2]
	bl ov45_0222A844
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	str r0, [r5]
	b _0222C242
_0222C23E:
	mov r0, #0
	str r0, [r5]
_0222C242:
	add r7, r7, #1
	add r6, r6, #4
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #4
	blt _0222C206
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0x10]
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x14]
	ldr r0, [sp, #4]
	ldr r0, [r0, #4]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x16]
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x18]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x1a]
	ldr r0, [sp]
	add r1, sp, #8
	ldr r0, [r0, #4]
	bl ov45_0222DB3C
_0222C29E:
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0222C2A4: .word 0x00000528
	thumb_func_end ov45_0222C1EC

	thumb_func_start ov45_0222C2A8
ov45_0222C2A8: ; 0x0222C2A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp]
	ldrb r0, [r1, #0x10]
	str r1, [sp, #4]
	cmp r0, #4
	bhi _0222C364
	cmp r0, #0
	beq _0222C364
	ldr r4, [sp]
	mov r7, #0
	add r6, r1, #0
	add r5, sp, #0x28
_0222C2C2:
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0x10]
	cmp r7, r0
	bge _0222C2FA
	ldr r0, [r6]
	bl ov45_0222EC68
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0222C364
	ldr r0, [sp]
	bl ov45_0222A578
	add r1, r4, #0
	add r1, #0xe8
	ldr r3, [sp]
	ldr r2, _0222C368 ; =0x00000528
	ldr r1, [r1]
	ldr r2, [r3, r2]
	bl ov45_0222A844
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	str r0, [r5]
	b _0222C2FE
_0222C2FA:
	mov r0, #0
	str r0, [r5]
_0222C2FE:
	add r7, r7, #1
	add r6, r6, #4
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #4
	blt _0222C2C2
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0x13]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0x10]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x34]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x18]
	ldr r0, [sp, #4]
	ldr r0, [r0, #4]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x1a]
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x1c]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x1e]
	ldr r0, [sp]
	add r1, sp, #8
	ldr r0, [r0, #4]
	bl ov45_0222DC64
_0222C364:
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C368: .word 0x00000528
	thumb_func_end ov45_0222C2A8

	thumb_func_start ov45_0222C36C
ov45_0222C36C: ; 0x0222C36C
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222C36C

	thumb_func_start ov45_0222C370
ov45_0222C370: ; 0x0222C370
	push {r3, lr}
	sub sp, #8
	add r2, r0, #0
	add r2, #0xd4
	str r1, [sp, #4]
	str r2, [sp]
	ldr r0, [r0, #4]
	add r1, sp, #0
	bl ov45_0222DB98
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov45_0222C370

	thumb_func_start ov45_0222C388
ov45_0222C388: ; 0x0222C388
	push {r4, lr}
	mov r2, #0x65
	add r4, r0, #0
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	mov r0, #0
	add r4, #0x50
	mvn r0, r0
	add r1, r4, #0
	mov r2, #0x6c
	bl MIi_CpuClear32
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222C388

	thumb_func_start ov45_0222C3A8
ov45_0222C3A8: ; 0x0222C3A8
	mov r1, #1
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222C3A8

	thumb_func_start ov45_0222C3B0
ov45_0222C3B0: ; 0x0222C3B0
	push {r4, r5, r6, r7}
	ldr r1, [r0]
	cmp r1, #0
	beq _0222C3FA
	ldr r3, _0222C400 ; =ov45_02254A3C
	mov r2, #0
	add r4, r0, #0
	mov r1, #1
	mov r6, #2
_0222C3C2:
	ldr r7, [r0, #4]
	ldr r5, [r3]
	cmp r7, r5
	bne _0222C3CC
	str r1, [r4, #0x2c]
_0222C3CC:
	ldr r5, [r4, #0x2c]
	cmp r5, #1
	bne _0222C3E4
	ldr r5, [r4, #8]
	add r7, r5, #1
	mov r5, #0x4b
	lsl r5, r5, #4
	cmp r7, r5
	bgt _0222C3E2
	str r7, [r4, #8]
	b _0222C3E4
_0222C3E2:
	str r6, [r4, #0x2c]
_0222C3E4:
	add r2, r2, #1
	add r3, r3, #4
	add r4, r4, #4
	cmp r2, #9
	blt _0222C3C2
	ldr r1, [r0, #4]
	add r2, r1, #1
	ldr r1, _0222C404 ; =0x000010E0
	cmp r2, r1
	bgt _0222C3FA
	str r2, [r0, #4]
_0222C3FA:
	pop {r4, r5, r6, r7}
	bx lr
	nop
_0222C400: .word ov45_02254A3C
_0222C404: .word 0x000010E0
	thumb_func_end ov45_0222C3B0

	thumb_func_start ov45_0222C408
ov45_0222C408: ; 0x0222C408
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	str r1, [sp]
	add r7, r2, #0
	bl ov45_0222C5B4
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0222C476
	mov r5, #0
	str r5, [sp, #4]
_0222C422:
	ldr r1, [sp, #4]
	add r0, r6, #0
	bl ov45_0222C4E4
	cmp r0, #2
	beq _0222C46A
	mov r4, #0
_0222C430:
	add r0, r6, #0
	add r1, r4, r5
	add r2, r7, #0
	bl ov45_0222C61C
	cmp r0, #0
	bne _0222C464
	add r0, r6, #0
	add r1, r4, r5
	bl ov45_0222C4B4
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0222C464
	ldr r0, [sp, #4]
	mov r1, #0xc
	mul r1, r0
	add r1, r6, r1
	lsl r0, r4, #2
	add r1, r1, r0
	ldr r0, [sp]
	add sp, #8
	str r0, [r1, #0x50]
	add r0, r4, r5
	pop {r3, r4, r5, r6, r7, pc}
_0222C464:
	add r4, r4, #1
	cmp r4, #3
	blt _0222C430
_0222C46A:
	ldr r0, [sp, #4]
	add r5, r5, #3
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #9
	blt _0222C422
_0222C476:
	mov r0, #0
	mvn r0, r0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov45_0222C408

	thumb_func_start ov45_0222C480
ov45_0222C480: ; 0x0222C480
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov45_0222C5B4
	mov r1, #0
	add r6, r0, #0
	mvn r1, r1
	cmp r6, r1
	beq _0222C4B2
	mov r1, #3
	bl _u32_div_f
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #3
	bl _u32_div_f
	mov r2, #0xc
	mul r2, r4
	mov r0, #0
	add r2, r5, r2
	lsl r1, r1, #2
	mvn r0, r0
	add r1, r2, r1
	str r0, [r1, #0x50]
_0222C4B2:
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222C480

	thumb_func_start ov45_0222C4B4
ov45_0222C4B4: ; 0x0222C4B4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x1b
	blo _0222C4C2
	bl GF_AssertFail
_0222C4C2:
	add r0, r4, #0
	mov r1, #3
	bl _u32_div_f
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #3
	bl _u32_div_f
	mov r0, #0xc
	mul r0, r6
	add r2, r5, r0
	lsl r0, r1, #2
	add r0, r2, r0
	ldr r0, [r0, #0x50]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov45_0222C4B4

	thumb_func_start ov45_0222C4E4
ov45_0222C4E4: ; 0x0222C4E4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #9
	blo _0222C4F2
	bl GF_AssertFail
_0222C4F2:
	lsl r0, r5, #2
	add r0, r4, r0
	ldr r0, [r0, #0x2c]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222C4E4

	thumb_func_start ov45_0222C4FC
ov45_0222C4FC: ; 0x0222C4FC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #9
	blo _0222C50A
	bl GF_AssertFail
_0222C50A:
	lsl r0, r5, #2
	add r0, r4, r0
	ldr r0, [r0, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222C4FC

	thumb_func_start ov45_0222C514
ov45_0222C514: ; 0x0222C514
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov45_0222C5B4
	mov r1, #0
	add r6, r0, #0
	mvn r1, r1
	cmp r6, r1
	beq _0222C548
	mov r1, #3
	bl _u32_div_f
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #3
	bl _u32_div_f
	mov r2, #0xc
	mul r2, r4
	add r2, r5, r2
	lsl r1, r1, #2
	add r2, r2, r1
	mov r1, #0x4a
	mov r0, #1
	lsl r1, r1, #2
	str r0, [r2, r1]
_0222C548:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov45_0222C514

	thumb_func_start ov45_0222C54C
ov45_0222C54C: ; 0x0222C54C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x1b
	blo _0222C55A
	bl GF_AssertFail
_0222C55A:
	add r0, r4, #0
	mov r1, #3
	bl _u32_div_f
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #3
	bl _u32_div_f
	mov r0, #0xc
	mul r0, r6
	add r2, r5, r0
	lsl r0, r1, #2
	add r1, r2, r0
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov45_0222C54C

	thumb_func_start ov45_0222C580
ov45_0222C580: ; 0x0222C580
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x1b
	blo _0222C58E
	bl GF_AssertFail
_0222C58E:
	add r0, r4, #0
	mov r1, #3
	bl _u32_div_f
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #3
	bl _u32_div_f
	mov r2, #0xc
	mul r2, r6
	add r2, r5, r2
	lsl r1, r1, #2
	add r2, r2, r1
	mov r1, #0x4a
	mov r0, #0
	lsl r1, r1, #2
	str r0, [r2, r1]
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222C580

	thumb_func_start ov45_0222C5B4
ov45_0222C5B4: ; 0x0222C5B4
	push {r3, r4, r5, r6}
	mov r4, #0
	add r3, r4, #0
_0222C5BA:
	add r5, r3, #0
	add r6, r0, #0
_0222C5BE:
	ldr r2, [r6, #0x50]
	cmp r1, r2
	bne _0222C5CE
	lsl r0, r4, #1
	add r0, r4, r0
	add r0, r5, r0
	pop {r3, r4, r5, r6}
	bx lr
_0222C5CE:
	add r5, r5, #1
	add r6, r6, #4
	cmp r5, #3
	blt _0222C5BE
	add r4, r4, #1
	add r0, #0xc
	cmp r4, #9
	blt _0222C5BA
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222C5B4

	thumb_func_start ov45_0222C5E8
ov45_0222C5E8: ; 0x0222C5E8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x1b
	blo _0222C5F8
	bl GF_AssertFail
_0222C5F8:
	add r0, r4, #0
	mov r1, #3
	bl _u32_div_f
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #3
	bl _u32_div_f
	mov r2, #0xc
	mul r2, r7
	add r2, r5, r2
	lsl r1, r1, #2
	add r1, r2, r1
	add r0, r6, #1
	add r1, #0xbc
	str r0, [r1]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222C5E8

	thumb_func_start ov45_0222C61C
ov45_0222C61C: ; 0x0222C61C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x1b
	blo _0222C62C
	bl GF_AssertFail
_0222C62C:
	add r0, r4, #0
	mov r1, #3
	bl _u32_div_f
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #3
	bl _u32_div_f
	mov r0, #0xc
	mul r0, r7
	add r2, r5, r0
	lsl r0, r1, #2
	add r0, r2, r0
	add r0, #0xbc
	ldr r0, [r0]
	cmp r0, r6
	bhi _0222C654
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C654:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222C61C

	thumb_func_start ov45_0222C658
ov45_0222C658: ; 0x0222C658
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x1b
	blo _0222C666
	bl GF_AssertFail
_0222C666:
	add r0, r4, #0
	mov r1, #3
	bl _u32_div_f
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #3
	bl _u32_div_f
	mov r0, #0xc
	mul r0, r6
	add r2, r5, r0
	lsl r0, r1, #2
	add r0, r2, r0
	add r0, #0xbc
	ldr r0, [r0]
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222C658

	thumb_func_start ov45_0222C688
ov45_0222C688: ; 0x0222C688
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	str r1, [sp]
	add r5, r3, #0
	bl ov45_0222EC68
	add r6, r0, #0
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r1, [r5]
	add r0, r5, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222C6AC
	ldr r0, _0222C734 ; =0x0000052C
	mov r1, #1
	str r1, [r5, r0]
_0222C6AC:
	mov r0, #0x4a
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov45_0222A920
	add r4, r0, #0
	add r0, r5, #0
	bl ov45_0222AFF8
	cmp r4, #1
	bne _0222C6E2
	mov r1, #0
	mvn r1, r1
	cmp r6, r1
	beq _0222C6E2
	ldr r1, [sp]
	ldrh r1, [r1, #2]
	cmp r1, #1
	bne _0222C6E2
	cmp r0, #1
	beq _0222C6E2
	add r0, r5, #0
	add r1, r6, #0
	bl ov45_0222B048
	cmp r0, #0
	bne _0222C6EE
_0222C6E2:
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0
	bl ov45_0222BE08
	pop {r3, r4, r5, r6, r7, pc}
_0222C6EE:
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #1
	bl ov45_0222BE08
	mov r0, #7
	lsl r0, r0, #6
	add r0, r5, r0
	add r1, r6, #0
	bl ov45_0222BD74
	cmp r0, #0
	bne _0222C70C
	mov r1, #1
	b _0222C70E
_0222C70C:
	mov r1, #0
_0222C70E:
	ldr r0, _0222C738 ; =0x000001CB
	mov r2, #2
	strb r1, [r5, r0]
	mov r0, #0x71
	lsl r0, r0, #2
	strh r6, [r5, r0]
	add r1, r0, #2
	strb r2, [r5, r1]
	add r1, r0, #6
	strb r2, [r5, r1]
	add r1, r0, #3
	sub r0, r0, #4
	mov r2, #0
	add r0, r5, r0
	strb r2, [r5, r1]
	bl ov45_0222BE48
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222C734: .word 0x0000052C
_0222C738: .word 0x000001CB
	thumb_func_end ov45_0222C688

	thumb_func_start ov45_0222C73C
ov45_0222C73C: ; 0x0222C73C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r3, #0
	bl ov45_0222EC68
	ldr r2, _0222C790 ; =0x000001CA
	add r1, r0, #0
	ldrb r0, [r4, r2]
	cmp r0, #0
	beq _0222C78E
	sub r0, r2, #6
	ldrh r0, [r4, r0]
	cmp r0, r1
	bne _0222C78E
	ldrh r0, [r5]
	cmp r0, #1
	bne _0222C77C
	sub r2, #0xa
	add r0, r4, r2
	bl ov45_0222BD74
	cmp r0, #0
	bne _0222C76E
	mov r1, #1
	b _0222C770
_0222C76E:
	mov r1, #0
_0222C770:
	ldr r0, _0222C794 ; =0x000001CB
	strb r1, [r4, r0]
	ldr r0, _0222C798 ; =0x000001C6
	mov r1, #2
	strb r1, [r4, r0]
	b _0222C784
_0222C77C:
	sub r2, #0xa
	add r0, r4, r2
	bl ov45_0222BD4C
_0222C784:
	mov r0, #7
	lsl r0, r0, #6
	add r0, r4, r0
	bl ov45_0222BE54
_0222C78E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222C790: .word 0x000001CA
_0222C794: .word 0x000001CB
_0222C798: .word 0x000001C6
	thumb_func_end ov45_0222C73C

	thumb_func_start ov45_0222C79C
ov45_0222C79C: ; 0x0222C79C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r1, _0222C7F8 ; =0x000001CA
	add r4, r3, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _0222C7F4
	bl ov45_0222EC68
	mov r1, #0x71
	lsl r1, r1, #2
	ldrh r2, [r4, r1]
	cmp r2, r0
	bne _0222C7E4
	ldrh r0, [r5, #2]
	ldr r2, _0222C7FC ; =0x0000FFFE
	add r2, r0, r2
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	cmp r2, #1
	bhi _0222C7DA
	add r2, r1, #2
	strb r0, [r4, r2]
	ldrh r2, [r5]
	add r0, r1, #4
	strh r2, [r4, r0]
	sub r0, r1, #4
	add r0, r4, r0
	bl ov45_0222BE54
	pop {r3, r4, r5, pc}
_0222C7DA:
	sub r0, r1, #4
	add r0, r4, r0
	bl ov45_0222BD5C
	pop {r3, r4, r5, pc}
_0222C7E4:
	mov r2, #0
	mvn r2, r2
	cmp r0, r2
	bne _0222C7F4
	sub r0, r1, #4
	add r0, r4, r0
	bl ov45_0222BD5C
_0222C7F4:
	pop {r3, r4, r5, pc}
	nop
_0222C7F8: .word 0x000001CA
_0222C7FC: .word 0x0000FFFE
	thumb_func_end ov45_0222C79C

	thumb_func_start ov45_0222C800
ov45_0222C800: ; 0x0222C800
	push {r4, lr}
	ldr r1, _0222C824 ; =0x000001C6
	add r4, r3, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _0222C822
	bl ov45_0222EC68
	mov r1, #0x71
	lsl r1, r1, #2
	ldrh r2, [r4, r1]
	cmp r2, r0
	bne _0222C822
	sub r0, r1, #4
	add r0, r4, r0
	bl ov45_0222BD4C
_0222C822:
	pop {r4, pc}
	.balign 4, 0
_0222C824: .word 0x000001C6
	thumb_func_end ov45_0222C800

	thumb_func_start ov45_0222C828
ov45_0222C828: ; 0x0222C828
	push {r3, lr}
	ldrb r2, [r1, #0x11]
	add r0, r3, #0
	lsl r3, r2, #2
	ldr r2, _0222C838 ; =ov45_02254A60
	ldr r2, [r2, r3]
	blx r2
	pop {r3, pc}
	.balign 4, 0
_0222C838: .word ov45_02254A60
	thumb_func_end ov45_0222C828

	thumb_func_start ov45_0222C83C
ov45_0222C83C: ; 0x0222C83C
	push {r4, lr}
	add r4, r3, #0
	bl ov45_0222EC68
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222C856
	add r1, r4, r0
	mov r0, #0x7a
	mov r2, #1
	lsl r0, r0, #2
	strb r2, [r1, r0]
_0222C856:
	pop {r4, pc}
	thumb_func_end ov45_0222C83C

	thumb_func_start ov45_0222C858
ov45_0222C858: ; 0x0222C858
	push {r3, r4, r5, r6, r7, lr}
	add r5, r3, #0
	bl ov45_0222EC68
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _0222C888
	mov r7, #0x83
	mov r4, #0
	lsl r7, r7, #2
_0222C870:
	add r0, r5, r7
	add r1, r6, #0
	add r2, r4, #0
	bl ov45_0222C408
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0222C888
	add r4, r4, #1
	cmp r4, #3
	blt _0222C870
_0222C888:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov45_0222C858

	thumb_func_start ov45_0222C88C
ov45_0222C88C: ; 0x0222C88C
	push {r4, lr}
	add r4, r3, #0
	bl ov45_0222EC68
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0222C8A8
	mov r0, #0x83
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov45_0222C514
_0222C8A8:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222C88C

	thumb_func_start ov45_0222C8AC
ov45_0222C8AC: ; 0x0222C8AC
	push {r4, lr}
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl memset
	mov r1, #0
	mov r0, #0x64
_0222C8BC:
	strb r0, [r4, r1]
	add r1, r1, #1
	cmp r1, #9
	blt _0222C8BC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222C8AC

	thumb_func_start ov45_0222C8C8
ov45_0222C8C8: ; 0x0222C8C8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	cmp r4, #0x14
	blo _0222C8D8
	bl GF_AssertFail
_0222C8D8:
	cmp r6, #0x1b
	blo _0222C8E0
	bl GF_AssertFail
_0222C8E0:
	add r7, r5, #0
	add r7, #0xc
	ldrb r0, [r7, r4]
	cmp r0, #0
	bne _0222C8FC
	add r0, r6, #0
	mov r1, #3
	bl _u32_div_f
	ldrb r1, [r5, r0]
	asr r1, r1, #1
	strb r1, [r5, r0]
	mov r0, #1
	strb r0, [r7, r4]
_0222C8FC:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov45_0222C8C8

	thumb_func_start ov45_0222C900
ov45_0222C900: ; 0x0222C900
	push {r3, r4, r5, lr}
	mov r5, #0
	add r4, r0, #0
	add r1, r5, #0
_0222C908:
	ldrb r0, [r4, r1]
	add r1, r1, #1
	add r5, r5, r0
	cmp r1, #9
	blt _0222C908
	bl MTRandom
	add r1, r5, #0
	bl _u32_div_f
	mov r3, #0
	add r0, r3, #0
_0222C920:
	cmp r3, r1
	bhi _0222C932
	ldrb r2, [r4, r0]
	add r2, r3, r2
	cmp r2, r1
	bls _0222C932
	lsl r1, r0, #1
	add r0, r0, r1
	pop {r3, r4, r5, pc}
_0222C932:
	ldrb r2, [r4, r0]
	add r0, r0, #1
	add r3, r3, r2
	cmp r0, #9
	blt _0222C920
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222C900

	thumb_func_start ov45_0222C944
ov45_0222C944: ; 0x0222C944
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x14
	blo _0222C954
	bl GF_AssertFail
_0222C954:
	cmp r4, #0x14
	bhs _0222C95A
	strb r6, [r5, r4]
_0222C95A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222C944

	thumb_func_start ov45_0222C95C
ov45_0222C95C: ; 0x0222C95C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x14
	blo _0222C96A
	bl GF_AssertFail
_0222C96A:
	cmp r4, #0x14
	bhs _0222C972
	ldrb r0, [r5, r4]
	pop {r3, r4, r5, pc}
_0222C972:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222C95C

	thumb_func_start ov45_0222C978
ov45_0222C978: ; 0x0222C978
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0
	mov r2, #0xb8
	add r5, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl WallpaperPasswordBank_Create
	add r5, #0xb4
	str r0, [r5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222C978

	thumb_func_start ov45_0222C994
ov45_0222C994: ; 0x0222C994
	ldr r3, _0222C99C ; =WallpaperPasswordBank_Delete
	add r0, #0xb4
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_0222C99C: .word WallpaperPasswordBank_Delete
	thumb_func_end ov45_0222C994

	thumb_func_start ov45_0222C9A0
ov45_0222C9A0: ; 0x0222C9A0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r4, #0x14
	blo _0222C9B2
	bl GF_AssertFail
_0222C9B2:
	cmp r4, #0x14
	bhs _0222C9CE
	strb r6, [r5, r4]
	cmp r6, #1
	bne _0222C9CE
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	add r5, #0x14
	lsl r2, r4, #3
	add r1, r7, #0
	add r2, r5, r2
	bl ov45_0222CA10
_0222C9CE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222C9A0

	thumb_func_start ov45_0222C9D0
ov45_0222C9D0: ; 0x0222C9D0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x14
	blo _0222C9DE
	bl GF_AssertFail
_0222C9DE:
	cmp r4, #0x14
	bhs _0222C9E6
	ldrb r0, [r5, r4]
	pop {r3, r4, r5, pc}
_0222C9E6:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222C9D0

	thumb_func_start ov45_0222C9EC
ov45_0222C9EC: ; 0x0222C9EC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x14
	blo _0222C9FA
	bl GF_AssertFail
_0222C9FA:
	cmp r4, #0x14
	bhs _0222CA0C
	ldrb r0, [r5, r4]
	cmp r0, #0
	beq _0222CA0C
	add r5, #0x14
	lsl r0, r4, #3
	add r0, r5, r0
	pop {r3, r4, r5, pc}
_0222CA0C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222C9EC

	thumb_func_start ov45_0222CA10
ov45_0222CA10: ; 0x0222CA10
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r6, r0, #0
	add r5, r2, #0
	bl WallpaperPasswordBank_GetNum
	add r7, r0, #0
	str r4, [sp, #8]
	add r0, sp, #8
	ldrb r4, [r0]
	ldrb r0, [r0, #3]
	add r1, r7, #0
	str r0, [sp]
	add r0, r0, r4
	bl _u32_div_f
	add r0, r6, #0
	bl WallpaperPasswordBank_GetWordI
	strh r0, [r5]
	add r0, sp, #8
	ldrb r0, [r0, #1]
	add r1, r7, #0
	str r0, [sp, #4]
	add r0, r4, r0
	bl _u32_div_f
	add r0, r6, #0
	bl WallpaperPasswordBank_GetWordI
	strh r0, [r5, #2]
	add r0, sp, #8
	ldrb r4, [r0, #2]
	ldr r0, [sp, #4]
	add r1, r7, #0
	add r0, r0, r4
	bl _u32_div_f
	add r0, r6, #0
	bl WallpaperPasswordBank_GetWordI
	strh r0, [r5, #4]
	ldr r0, [sp]
	add r1, r7, #0
	add r0, r4, r0
	bl _u32_div_f
	add r0, r6, #0
	bl WallpaperPasswordBank_GetWordI
	strh r0, [r5, #6]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222CA10

	thumb_func_start ov45_0222CA7C
ov45_0222CA7C: ; 0x0222CA7C
	mov r3, #0
	str r3, [r0]
	sub r2, r2, r1
	mov r1, #0x1e
	str r3, [r0, #0xc]
	mul r1, r2
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end ov45_0222CA7C

	thumb_func_start ov45_0222CA8C
ov45_0222CA8C: ; 0x0222CA8C
	mov r1, #1
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #0xc]
	ldr r3, _0222CA9C ; =ov45_0222ECB8
	add r0, r0, #4
	bx r3
	nop
_0222CA9C: .word ov45_0222ECB8
	thumb_func_end ov45_0222CA8C

	thumb_func_start ov45_0222CAA0
ov45_0222CAA0: ; 0x0222CAA0
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0222CB32
	add r0, sp, #0
	bl ov45_0222ECB8
	ldr r3, [sp]
	ldr r0, [r4, #4]
	ldr r1, [sp, #4]
	ldr r2, [r4, #8]
	sub r0, r3, r0
	sbc r1, r2
	mov r2, #0x1e
	mov r3, #0
	bl _ll_mul
	ldr r2, [r4, #0xc]
	asr r3, r2, #0x1f
	sub r2, r2, r0
	sbc r3, r1
	bge _0222CAD2
	str r0, [r4, #0xc]
_0222CAD2:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	bge _0222CB12
	add r0, r1, #1
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	lsl r0, r0, #8
	bl _s32_div_f
	mov r2, #0
	ldr r5, _0222CB38 ; =_02254A28
	add r3, r2, #0
_0222CAEC:
	ldrh r1, [r5, #2]
	add r2, r2, r1
	cmp r2, r0
	blo _0222CB08
	ldr r0, _0222CB38 ; =_02254A28
	lsl r1, r3, #2
	ldrh r1, [r0, r1]
	ldr r0, [r4, #0x14]
	cmp r0, r1
	beq _0222CB2C
	str r1, [r4, #0x14]
	mov r0, #0
	str r0, [r4, #0x18]
	b _0222CB2C
_0222CB08:
	add r3, r3, #1
	add r5, r5, #4
	cmp r3, #5
	blo _0222CAEC
	b _0222CB2C
_0222CB12:
	ldr r0, [r4, #0x14]
	cmp r0, #5
	beq _0222CB20
	mov r0, #5
	str r0, [r4, #0x14]
	mov r0, #0
	str r0, [r4, #0x18]
_0222CB20:
	ldr r0, [r4, #0x18]
	cmp r0, #0x78
	blo _0222CB2C
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4]
_0222CB2C:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
_0222CB32:
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0222CB38: .word _02254A28
	thumb_func_end ov45_0222CAA0

	thumb_func_start ov45_0222CB3C
ov45_0222CB3C: ; 0x0222CB3C
	ldr r0, [r0, #0x18]
	bx lr
	thumb_func_end ov45_0222CB3C

	thumb_func_start ov45_0222CB40
ov45_0222CB40: ; 0x0222CB40
	ldr r0, [r0, #0x14]
	bx lr
	thumb_func_end ov45_0222CB40

	thumb_func_start ov45_0222CB44
ov45_0222CB44: ; 0x0222CB44
	push {r4, r5, r6, lr}
	mov r4, #0x18
	add r3, r4, #0
	mov r5, #0
	add r6, r0, #0
	sub r3, #0x19
_0222CB50:
	add r2, r0, r5
	add r2, #0x34
	strb r4, [r2]
	add r5, r5, #1
	stmia r6!, {r3}
	cmp r5, #0xd
	blt _0222CB50
	add r2, r0, #0
	mov r3, #0
	add r2, #0x41
	strb r3, [r2]
	add r2, r0, #0
	add r2, #0x42
	strb r3, [r2]
	str r1, [r0, #0x44]
	bl ov45_0222CCA4
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222CB44

	thumb_func_start ov45_0222CB74
ov45_0222CB74: ; 0x0222CB74
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov45_0222CCB8
	add r0, r5, #0
	add r0, #0x42
	ldrb r0, [r0]
	mov r1, #0xd
	add r0, r0, #1
	bl _s32_div_f
	add r0, r5, #0
	add r0, #0x41
	ldrb r0, [r0]
	cmp r1, r0
	bne _0222CB9E
	add r0, r5, #0
	bl ov45_0222CC00
_0222CB9E:
	add r0, r5, #0
	add r0, #0x42
	ldrb r0, [r0]
	mov r1, #0xd
	add r0, r5, r0
	add r0, #0x34
	strb r4, [r0]
	add r0, r5, #0
	add r0, #0x42
	ldrb r0, [r0]
	lsl r0, r0, #2
	str r6, [r5, r0]
	add r0, r5, #0
	add r0, #0x42
	ldrb r0, [r0]
	add r0, r0, #1
	bl _s32_div_f
	add r0, r5, #0
	add r0, #0x42
	strb r1, [r0]
	add r0, r5, #0
	bl ov45_0222CCA4
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222CB74

	thumb_func_start ov45_0222CBD0
ov45_0222CBD0: ; 0x0222CBD0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	mov r6, #0
	bl ov45_0222CCB8
	add r2, r6, #0
	add r3, r7, #0
	mov r0, #1
_0222CBE4:
	ldr r1, [r3]
	cmp r5, r1
	bne _0222CBEE
	str r4, [r3]
	add r6, r0, #0
_0222CBEE:
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, #0xd
	blt _0222CBE4
	add r0, r7, #0
	bl ov45_0222CCA4
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222CBD0

	thumb_func_start ov45_0222CC00
ov45_0222CC00: ; 0x0222CC00
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov45_0222CCB8
	add r0, r5, #0
	add r0, #0x41
	ldrb r2, [r0]
	add r0, r5, #0
	add r0, #0x42
	ldrb r0, [r0]
	cmp r0, r2
	bne _0222CC1C
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0222CC1C:
	add r0, r5, #0
	add r0, #0x34
	ldrb r4, [r0, r2]
	mov r1, #0x18
	strb r1, [r0, r2]
	add r0, r5, #0
	add r0, #0x42
	ldrb r0, [r0]
	sub r1, #0x19
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	add r0, #0x41
	ldrb r0, [r0]
	mov r1, #0xd
	add r0, r0, #1
	bl _s32_div_f
	add r0, r5, #0
	add r0, #0x41
	strb r1, [r0]
	add r0, r5, #0
	bl ov45_0222CCA4
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222CC00

	thumb_func_start ov45_0222CC50
ov45_0222CC50: ; 0x0222CC50
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xc
	blo _0222CC5E
	bl GF_AssertFail
_0222CC5E:
	add r0, r5, #0
	bl ov45_0222CCB8
	add r0, r5, #0
	add r0, #0x42
	ldrb r1, [r0]
	add r0, r4, #1
	sub r0, r1, r0
	bpl _0222CC72
	add r0, #0xd
_0222CC72:
	add r0, r5, r0
	add r0, #0x34
	ldrb r0, [r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222CC50

	thumb_func_start ov45_0222CC7C
ov45_0222CC7C: ; 0x0222CC7C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xc
	blo _0222CC8A
	bl GF_AssertFail
_0222CC8A:
	add r0, r5, #0
	bl ov45_0222CCB8
	add r0, r5, #0
	add r0, #0x42
	ldrb r1, [r0]
	add r0, r4, #1
	sub r0, r1, r0
	bpl _0222CC9E
	add r0, #0xd
_0222CC9E:
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222CC7C

	thumb_func_start ov45_0222CCA4
ov45_0222CCA4: ; 0x0222CCA4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x44]
	add r1, r4, #0
	mov r2, #0x44
	bl SavArray_CalcCRC16
	add r4, #0x48
	strh r0, [r4]
	pop {r4, pc}
	thumb_func_end ov45_0222CCA4

	thumb_func_start ov45_0222CCB8
ov45_0222CCB8: ; 0x0222CCB8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x44]
	add r1, r4, #0
	mov r2, #0x44
	bl SavArray_CalcCRC16
	add r1, r4, #0
	add r1, #0x48
	ldrh r1, [r1]
	cmp r0, r1
	beq _0222CCDA
	bl GF_AssertFail
	mov r0, #1
	add r4, #0x4a
	strh r0, [r4]
_0222CCDA:
	pop {r4, pc}
	thumb_func_end ov45_0222CCB8

	thumb_func_start ov45_0222CCDC
ov45_0222CCDC: ; 0x0222CCDC
	add r0, #0x4a
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222CCDC

	thumb_func_start ov45_0222CCE4
ov45_0222CCE4: ; 0x0222CCE4
	ldr r3, _0222CD00 ; =ov45_02254A84
	mov r2, #0
_0222CCE8:
	ldrh r1, [r3]
	cmp r0, r1
	bne _0222CCF2
	add r0, r2, #0
	bx lr
_0222CCF2:
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, #0x10
	blt _0222CCE8
	mov r0, #0x10
	bx lr
	nop
_0222CD00: .word ov45_02254A84
	thumb_func_end ov45_0222CCE4

	thumb_func_start ov45_0222CD04
ov45_0222CD04: ; 0x0222CD04
	cmp r0, #0x10
	bhs _0222CD10
	lsl r1, r0, #2
	ldr r0, _0222CD14 ; =ov45_02254A84
	ldrh r0, [r0, r1]
	bx lr
_0222CD10:
	ldr r0, _0222CD18 ; =0x0000FFFF
	bx lr
	.balign 4, 0
_0222CD14: .word ov45_02254A84
_0222CD18: .word 0x0000FFFF
	thumb_func_end ov45_0222CD04

	thumb_func_start ov45_0222CD1C
ov45_0222CD1C: ; 0x0222CD1C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r6, [sp, #0x20]
	add r5, r0, #0
	add r7, r1, #0
	add r0, r6, #0
	mov r1, #0x48
	str r2, [sp]
	str r3, [sp, #4]
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x48
	add r4, r0, #0
	bl memset
	ldr r0, [sp, #4]
	str r0, [r4, #0x3c]
	ldr r0, [sp]
	str r7, [r4, #0x40]
	str r0, [r4, #0x44]
	add r0, r4, #0
	add r0, #0x39
	strb r5, [r0]
	strh r6, [r4, #0x3a]
	mov r5, #0
_0222CD50:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ov45_0222CDE4
	add r5, r5, #1
	cmp r5, #0xd
	blt _0222CD50
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov45_0222CD1C

	thumb_func_start ov45_0222CD68
ov45_0222CD68: ; 0x0222CD68
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0222CD6E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov45_0222CE0C
	add r4, r4, #1
	cmp r4, #0xd
	blt _0222CD6E
	add r0, r5, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222CD68

	thumb_func_start ov45_0222CD84
ov45_0222CD84: ; 0x0222CD84
	ldr r3, _0222CD8C ; =ov45_0222CE2C
	mov r1, #5
	bx r3
	nop
_0222CD8C: .word ov45_0222CE2C
	thumb_func_end ov45_0222CD84

	thumb_func_start ov45_0222CD90
ov45_0222CD90: ; 0x0222CD90
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r5, #0
	cmp r0, #0
	beq _0222CDBA
	bl OverlayManager_run
	cmp r0, #0
	beq _0222CDBA
	ldr r0, [r4]
	bl OverlayManager_delete
	add r0, r5, #0
	str r0, [r4]
	add r0, r4, #0
	add r4, #0x38
	ldrb r1, [r4]
	bl ov45_0222CE54
	add r5, r0, #0
_0222CDBA:
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222CD90

	thumb_func_start ov45_0222CDC0
ov45_0222CDC0: ; 0x0222CDC0
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222CDC0

	thumb_func_start ov45_0222CDC4
ov45_0222CDC4: ; 0x0222CDC4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	cmp r0, #0
	beq _0222CDD6
	bl GF_AssertFail
_0222CDD6:
	ldrh r2, [r5, #0x3a]
	ldr r1, [r4]
	add r0, r6, #0
	bl OverlayManager_new
	str r0, [r5]
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222CDC4

	thumb_func_start ov45_0222CDE4
ov45_0222CDE4: ; 0x0222CDE4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0xd
	blo _0222CDF4
	bl GF_AssertFail
_0222CDF4:
	lsl r3, r4, #2
	add r1, r5, #4
	ldr r4, _0222CE08 ; =ov45_02254E88
	add r1, r1, r3
	ldr r3, [r4, r3]
	add r0, r5, #0
	add r2, r6, #0
	blx r3
	pop {r4, r5, r6, pc}
	nop
_0222CE08: .word ov45_02254E88
	thumb_func_end ov45_0222CDE4

	thumb_func_start ov45_0222CE0C
ov45_0222CE0C: ; 0x0222CE0C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0xd
	blo _0222CE1A
	bl GF_AssertFail
_0222CE1A:
	ldr r1, _0222CE28 ; =_02254E20
	lsl r2, r5, #2
	add r0, r4, #4
	ldr r1, [r1, r2]
	add r0, r0, r2
	blx r1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222CE28: .word _02254E20
	thumb_func_end ov45_0222CE0C

	thumb_func_start ov45_0222CE2C
ov45_0222CE2C: ; 0x0222CE2C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xd
	blo _0222CE3A
	bl GF_AssertFail
_0222CE3A:
	ldr r2, _0222CE50 ; =ov45_02254E54
	lsl r3, r4, #2
	add r1, r5, #4
	ldr r2, [r2, r3]
	add r0, r5, #0
	add r1, r1, r3
	blx r2
	add r5, #0x38
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	nop
_0222CE50: .word ov45_02254E54
	thumb_func_end ov45_0222CE2C

	thumb_func_start ov45_0222CE54
ov45_0222CE54: ; 0x0222CE54
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0xd
	blo _0222CE62
	bl GF_AssertFail
_0222CE62:
	ldr r2, _0222CE74 ; =ov45_02254EBC
	lsl r3, r5, #2
	add r1, r4, #4
	ldr r2, [r2, r3]
	add r0, r4, #0
	add r1, r1, r3
	blx r2
	pop {r3, r4, r5, pc}
	nop
_0222CE74: .word ov45_02254EBC
	thumb_func_end ov45_0222CE54

	thumb_func_start ov45_0222CE78
ov45_0222CE78: ; 0x0222CE78
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
_0222CE80:
	add r0, r6, #0
	bl PlayerProfile_new
	str r0, [r5, #0x20]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0222CE80
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov45_0222CE78

	thumb_func_start ov45_0222CE94
ov45_0222CE94: ; 0x0222CE94
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
_0222CE9C:
	ldr r0, [r5, #0x20]
	bl FreeToHeap
	str r6, [r5, #0x20]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0222CE9C
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov45_0222CE94

	thumb_func_start ov45_0222CEB0
ov45_0222CEB0: ; 0x0222CEB0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r6, r0, #0
	add r0, r7, #0
	str r2, [sp]
	bl ov45_0222A5C0
	bl ov45_0222AAC8
	add r1, r6, #0
	str r0, [r6]
	add r0, r7, #0
	add r1, #8
	bl ov45_0222AB38
	add r0, r7, #0
	add r1, r6, #4
	bl ov45_0222A498
	str r7, [r6, #0x30]
	mov r4, #0
	str r4, [r6, #0x1c]
	add r5, r6, #0
_0222CEDE:
	add r1, r6, r4
	ldrb r1, [r1, #4]
	add r0, r7, #0
	bl ov45_0222A578
	cmp r0, #0
	beq _0222CEF4
	ldr r1, [r5, #0x20]
	ldr r2, [sp]
	bl ov45_0222A844
_0222CEF4:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0222CEDE
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov45_0222CEB0

	thumb_func_start ov45_0222CF00
ov45_0222CF00: ; 0x0222CF00
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r0, r2, #0
	mov r1, #0x20
	bl AllocFromHeap
	str r0, [r5]
	mov r1, #0
	mov r2, #0x20
	bl memset
	ldr r1, [r5]
	ldr r0, [r4, #0x40]
	str r0, [r1]
	ldr r0, [r4, #0x3c]
	str r0, [r1, #0x1c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222CF00

	thumb_func_start ov45_0222CF24
ov45_0222CF24: ; 0x0222CF24
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _0222CF32
	bl GF_AssertFail
_0222CF32:
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222CF24

	thumb_func_start ov45_0222CF40
ov45_0222CF40: ; 0x0222CF40
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	ldr r4, [r6]
	ldr r0, [r5, #0x3c]
	bl ov45_0222AD2C
	str r0, [r4, #4]
	ldr r0, [r5, #0x3c]
	bl ov45_0222AD3C
	str r0, [r4, #8]
	ldr r2, _0222CF64 ; =ov45_02254B94
	add r0, r5, #0
	add r1, r6, #0
	bl ov45_0222CDC4
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222CF64: .word ov45_02254B94
	thumb_func_end ov45_0222CF40

	thumb_func_start ov45_0222CF68
ov45_0222CF68: ; 0x0222CF68
	push {r3, lr}
	ldr r1, [r1]
	ldr r1, [r1, #0x18]
	cmp r1, #0xa
	bhi _0222CFEC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0222CF7E: ; jump table
	.short _0222CF94 - _0222CF7E - 2 ; case 0
	.short _0222CF9C - _0222CF7E - 2 ; case 1
	.short _0222CFA4 - _0222CF7E - 2 ; case 2
	.short _0222CFBC - _0222CF7E - 2 ; case 3
	.short _0222CFC4 - _0222CF7E - 2 ; case 4
	.short _0222CFCC - _0222CF7E - 2 ; case 5
	.short _0222CFAC - _0222CF7E - 2 ; case 6
	.short _0222CFB4 - _0222CF7E - 2 ; case 7
	.short _0222CFD4 - _0222CF7E - 2 ; case 8
	.short _0222CFDC - _0222CF7E - 2 ; case 9
	.short _0222CFE4 - _0222CF7E - 2 ; case 10
_0222CF94:
	mov r1, #9
	bl ov45_0222CE2C
	b _0222CFF0
_0222CF9C:
	mov r1, #1
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFA4:
	mov r1, #2
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFAC:
	mov r1, #3
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFB4:
	mov r1, #4
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFBC:
	mov r1, #6
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFC4:
	mov r1, #7
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFCC:
	mov r1, #8
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFD4:
	mov r1, #0xa
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFDC:
	mov r1, #0xb
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFE4:
	mov r1, #0xc
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFEC:
	bl GF_AssertFail
_0222CFF0:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov45_0222CF68

	thumb_func_start ov45_0222CFF4
ov45_0222CFF4: ; 0x0222CFF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	mov r1, #0x10
	bl AllocFromHeap
	str r0, [r4]
	mov r2, #0x10
	mov r1, #0
_0222D008:
	strb r1, [r0]
	add r0, r0, #1
	sub r2, r2, #1
	bne _0222D008
	ldr r1, [r4]
	ldr r0, [r5, #0x40]
	str r0, [r1, #4]
	ldr r0, [r5, #0x3c]
	str r0, [r1, #0xc]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222CFF4

	thumb_func_start ov45_0222D01C
ov45_0222D01C: ; 0x0222D01C
	ldr r3, _0222D024 ; =FreeToHeap
	ldr r0, [r0]
	bx r3
	nop
_0222D024: .word FreeToHeap
	thumb_func_end ov45_0222D01C

	thumb_func_start ov45_0222D028
ov45_0222D028: ; 0x0222D028
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	ldr r4, [r6]
	ldr r0, [r5, #0x3c]
	bl ov45_0222A214
	str r0, [r4]
	ldr r0, [r5, #0x3c]
	bl ov45_0222A22C
	ldr r0, [r0]
	ldr r2, _0222D050 ; =ov45_02254B84
	str r0, [r4, #8]
	add r0, r5, #0
	add r1, r6, #0
	bl ov45_0222CDC4
	pop {r4, r5, r6, pc}
	nop
_0222D050: .word ov45_02254B84
	thumb_func_end ov45_0222D028

	thumb_func_start ov45_0222D054
ov45_0222D054: ; 0x0222D054
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl ov45_0222A33C
	cmp r0, #0
	beq _0222D06C
	add r0, r4, #0
	mov r1, #0xa
	bl ov45_0222CE2C
	b _0222D074
_0222D06C:
	add r0, r4, #0
	mov r1, #0
	bl ov45_0222CE2C
_0222D074:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov45_0222D054

	thumb_func_start ov45_0222D078
ov45_0222D078: ; 0x0222D078
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r0, r2, #0
	mov r1, #0xc
	bl AllocFromHeap
	str r0, [r5]
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	ldr r5, [r5]
	ldr r0, [r4, #0x3c]
	bl ov45_0222A210
	str r0, [r5]
	ldr r0, [r4, #0x3c]
	bl ov45_0222A22C
	str r0, [r5, #4]
	ldr r0, [r4, #0x3c]
	str r0, [r5, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D078

	thumb_func_start ov45_0222D0BC
ov45_0222D0BC: ; 0x0222D0BC
	ldr r3, _0222D0C4 ; =FreeToHeap
	ldr r0, [r0]
	bx r3
	nop
_0222D0C4: .word FreeToHeap
	thumb_func_end ov45_0222D0BC

	thumb_func_start ov45_0222D0C8
ov45_0222D0C8: ; 0x0222D0C8
	ldr r3, _0222D0D0 ; =ov45_0222CDC4
	ldr r2, _0222D0D4 ; =ov45_02254B74
	bx r3
	nop
_0222D0D0: .word ov45_0222CDC4
_0222D0D4: .word ov45_02254B74
	thumb_func_end ov45_0222D0C8

	thumb_func_start ov45_0222D0D8
ov45_0222D0D8: ; 0x0222D0D8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl ov45_0222A33C
	cmp r0, #0
	beq _0222D0F0
	add r0, r4, #0
	mov r1, #0xa
	bl ov45_0222CE2C
	b _0222D0F8
_0222D0F0:
	add r0, r4, #0
	mov r1, #0
	bl ov45_0222CE2C
_0222D0F8:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov45_0222D0D8

	thumb_func_start ov45_0222D0FC
ov45_0222D0FC: ; 0x0222D0FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	mov r1, #0x14
	bl AllocFromHeap
	str r0, [r4]
	mov r2, #0x14
	mov r1, #0
_0222D110:
	strb r1, [r0]
	add r0, r0, #1
	sub r2, r2, #1
	bne _0222D110
	ldr r1, [r4]
	ldr r0, [r5, #0x40]
	str r0, [r1]
	ldr r0, [r5, #0x3c]
	str r0, [r1, #4]
	add r0, r5, #0
	add r0, #0x39
	ldrb r0, [r0]
	str r0, [r1, #8]
	ldr r0, [r5, #0x44]
	str r0, [r1, #0xc]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222D0FC

	thumb_func_start ov45_0222D130
ov45_0222D130: ; 0x0222D130
	ldr r3, _0222D138 ; =FreeToHeap
	ldr r0, [r0]
	bx r3
	nop
_0222D138: .word FreeToHeap
	thumb_func_end ov45_0222D130

	thumb_func_start ov45_0222D13C
ov45_0222D13C: ; 0x0222D13C
	ldr r3, _0222D144 ; =ov45_0222CDC4
	ldr r2, _0222D148 ; =ov45_02254B64
	bx r3
	nop
_0222D144: .word ov45_0222CDC4
_0222D148: .word ov45_02254B64
	thumb_func_end ov45_0222D13C

	thumb_func_start ov45_0222D14C
ov45_0222D14C: ; 0x0222D14C
	push {r3, lr}
	ldr r1, [r1]
	ldr r1, [r1, #0x10]
	cmp r1, #0
	bne _0222D15A
	mov r0, #1
	pop {r3, pc}
_0222D15A:
	mov r1, #0
	bl ov45_0222CE2C
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov45_0222D14C

	thumb_func_start ov45_0222D164
ov45_0222D164: ; 0x0222D164
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	add r0, r6, #0
	mov r1, #0x3c
	bl AllocFromHeap
	str r0, [r4]
	mov r1, #0
	mov r2, #0x3c
	bl memset
	ldr r0, [r4]
	mov r2, #0
	add r1, r0, #0
	add r1, #0x38
	strb r2, [r1]
	add r1, r0, #0
	mov r2, #1
	add r1, #0x39
	strb r2, [r1]
	ldr r1, [r5, #0x40]
	str r1, [r0, #0x34]
	add r1, r6, #0
	bl ov45_0222CE78
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222D164

	thumb_func_start ov45_0222D19C
ov45_0222D19C: ; 0x0222D19C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl ov45_0222CE94
	ldr r0, [r4]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D19C

	thumb_func_start ov45_0222D1B0
ov45_0222D1B0: ; 0x0222D1B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, _0222D1D4 ; =FS_OVERLAY_ID(OVY_90)
	mov r1, #2
	bl HandleLoadOverlay
	ldrh r2, [r5, #0x3a]
	ldr r0, [r4]
	ldr r1, [r5, #0x3c]
	bl ov45_0222CEB0
	ldr r2, _0222D1D8 ; =ov45_02254B54
	add r0, r5, #0
	add r1, r4, #0
	bl ov45_0222CDC4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222D1D4: .word FS_OVERLAY_ID(OVY_90)
_0222D1D8: .word ov45_02254B54
	thumb_func_end ov45_0222D1B0

	thumb_func_start ov45_0222D1DC
ov45_0222D1DC: ; 0x0222D1DC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0222D208 ; =FS_OVERLAY_ID(OVY_90)
	add r5, r1, #0
	bl UnloadOverlayByID
	ldr r5, [r5]
	ldr r0, [r4, #0x3c]
	ldr r1, [r5, #0x1c]
	bl ov45_0222A430
	ldr r0, [r4, #0x3c]
	ldr r1, [r5]
	bl ov45_0222A72C
	add r0, r4, #0
	mov r1, #0
	bl ov45_0222CE2C
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222D208: .word FS_OVERLAY_ID(OVY_90)
	thumb_func_end ov45_0222D1DC

	thumb_func_start ov45_0222D20C
ov45_0222D20C: ; 0x0222D20C
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	add r0, r6, #0
	mov r1, #0x40
	bl AllocFromHeap
	str r0, [r4]
	mov r1, #0
	mov r2, #0x40
	bl memset
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0, #0x3c]
	mov r1, #1
	str r1, [r0, #0x38]
	ldr r1, [r5, #0x40]
	str r1, [r0, #0x34]
	add r1, r6, #0
	bl ov45_0222CE78
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222D20C

	thumb_func_start ov45_0222D23C
ov45_0222D23C: ; 0x0222D23C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl ov45_0222CE94
	ldr r0, [r4]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D23C

	thumb_func_start ov45_0222D250
ov45_0222D250: ; 0x0222D250
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, _0222D274 ; =FS_OVERLAY_ID(OVY_90)
	mov r1, #2
	bl HandleLoadOverlay
	ldrh r2, [r5, #0x3a]
	ldr r0, [r4]
	ldr r1, [r5, #0x3c]
	bl ov45_0222CEB0
	ldr r2, _0222D278 ; =ov45_02254BA4
	add r0, r5, #0
	add r1, r4, #0
	bl ov45_0222CDC4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222D274: .word FS_OVERLAY_ID(OVY_90)
_0222D278: .word ov45_02254BA4
	thumb_func_end ov45_0222D250

	thumb_func_start ov45_0222D27C
ov45_0222D27C: ; 0x0222D27C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0222D2A8 ; =FS_OVERLAY_ID(OVY_90)
	add r5, r1, #0
	bl UnloadOverlayByID
	ldr r5, [r5]
	ldr r0, [r4, #0x3c]
	ldr r1, [r5, #0x1c]
	bl ov45_0222A430
	ldr r0, [r4, #0x3c]
	ldr r1, [r5]
	bl ov45_0222A72C
	add r0, r4, #0
	mov r1, #0
	bl ov45_0222CE2C
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222D2A8: .word FS_OVERLAY_ID(OVY_90)
	thumb_func_end ov45_0222D27C

	thumb_func_start ov45_0222D2AC
ov45_0222D2AC: ; 0x0222D2AC
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	add r0, r6, #0
	mov r1, #0x3c
	bl AllocFromHeap
	str r0, [r4]
	mov r1, #0
	mov r2, #0x3c
	bl memset
	ldr r0, [r4]
	mov r2, #0
	add r1, r0, #0
	add r1, #0x38
	strb r2, [r1]
	add r1, r0, #0
	mov r2, #1
	add r1, #0x39
	strb r2, [r1]
	ldr r1, [r5, #0x40]
	str r1, [r0, #0x34]
	add r1, r6, #0
	bl ov45_0222CE78
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222D2AC

	thumb_func_start ov45_0222D2E4
ov45_0222D2E4: ; 0x0222D2E4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl ov45_0222CE94
	ldr r0, [r4]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D2E4

	thumb_func_start ov45_0222D2F8
ov45_0222D2F8: ; 0x0222D2F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, _0222D31C ; =FS_OVERLAY_ID(OVY_90)
	mov r1, #2
	bl HandleLoadOverlay
	ldrh r2, [r5, #0x3a]
	ldr r0, [r4]
	ldr r1, [r5, #0x3c]
	bl ov45_0222CEB0
	ldr r2, _0222D320 ; =ov45_02254B34
	add r0, r5, #0
	add r1, r4, #0
	bl ov45_0222CDC4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222D31C: .word FS_OVERLAY_ID(OVY_90)
_0222D320: .word ov45_02254B34
	thumb_func_end ov45_0222D2F8

	thumb_func_start ov45_0222D324
ov45_0222D324: ; 0x0222D324
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0222D350 ; =FS_OVERLAY_ID(OVY_90)
	add r5, r1, #0
	bl UnloadOverlayByID
	ldr r5, [r5]
	ldr r0, [r4, #0x3c]
	ldr r1, [r5, #0x1c]
	bl ov45_0222A430
	ldr r0, [r4, #0x3c]
	ldr r1, [r5]
	bl ov45_0222A72C
	add r0, r4, #0
	mov r1, #0
	bl ov45_0222CE2C
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222D350: .word FS_OVERLAY_ID(OVY_90)
	thumb_func_end ov45_0222D324

	thumb_func_start ov45_0222D354
ov45_0222D354: ; 0x0222D354
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	mov r1, #8
	bl AllocFromHeap
	str r0, [r4]
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	ldr r1, [r5, #0x3c]
	ldr r0, [r4]
	str r1, [r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D354

	thumb_func_start ov45_0222D380
ov45_0222D380: ; 0x0222D380
	ldr r3, _0222D388 ; =FreeToHeap
	ldr r0, [r0]
	bx r3
	nop
_0222D388: .word FreeToHeap
	thumb_func_end ov45_0222D380

	thumb_func_start ov45_0222D38C
ov45_0222D38C: ; 0x0222D38C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl ov45_0222A33C
	cmp r0, #0
	beq _0222D3A4
	add r0, r4, #0
	mov r1, #0xa
	bl ov45_0222CE2C
	b _0222D3AC
_0222D3A4:
	add r0, r4, #0
	mov r1, #0
	bl ov45_0222CE2C
_0222D3AC:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov45_0222D38C

	thumb_func_start ov45_0222D3B0
ov45_0222D3B0: ; 0x0222D3B0
	ldr r2, [r1]
	mov r3, #0
	strb r3, [r2, #4]
	ldr r3, _0222D3BC ; =ov45_0222CDC4
	ldr r2, _0222D3C0 ; =ov45_02254B24
	bx r3
	.balign 4, 0
_0222D3BC: .word ov45_0222CDC4
_0222D3C0: .word ov45_02254B24
	thumb_func_end ov45_0222D3B0

	thumb_func_start ov45_0222D3C4
ov45_0222D3C4: ; 0x0222D3C4
	ldr r2, [r1]
	mov r3, #1
	strb r3, [r2, #4]
	ldr r3, _0222D3D0 ; =ov45_0222CDC4
	ldr r2, _0222D3D4 ; =ov45_02254B14
	bx r3
	.balign 4, 0
_0222D3D0: .word ov45_0222CDC4
_0222D3D4: .word ov45_02254B14
	thumb_func_end ov45_0222D3C4

	thumb_func_start ov45_0222D3D8
ov45_0222D3D8: ; 0x0222D3D8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	mov r1, #0xc
	bl AllocFromHeap
	str r0, [r4]
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	ldr r1, [r4]
	ldr r0, [r5, #0x40]
	str r0, [r1]
	ldr r0, [r5, #0x3c]
	str r0, [r1, #4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D3D8

	thumb_func_start ov45_0222D410
ov45_0222D410: ; 0x0222D410
	ldr r3, _0222D418 ; =FreeToHeap
	ldr r0, [r0]
	bx r3
	nop
_0222D418: .word FreeToHeap
	thumb_func_end ov45_0222D410

	thumb_func_start ov45_0222D41C
ov45_0222D41C: ; 0x0222D41C
	ldr r3, _0222D424 ; =ov45_0222D434
	mov r2, #0
	bx r3
	nop
_0222D424: .word ov45_0222D434
	thumb_func_end ov45_0222D41C

	thumb_func_start ov45_0222D428
ov45_0222D428: ; 0x0222D428
	ldr r3, _0222D430 ; =ov45_0222D434
	mov r2, #1
	bx r3
	nop
_0222D430: .word ov45_0222D434
	thumb_func_end ov45_0222D428

	thumb_func_start ov45_0222D434
ov45_0222D434: ; 0x0222D434
	ldr r3, [r1]
	str r2, [r3, #8]
	ldr r3, _0222D440 ; =ov45_0222CDC4
	ldr r2, _0222D444 ; =ov45_02254B04
	bx r3
	nop
_0222D440: .word ov45_0222CDC4
_0222D444: .word ov45_02254B04
	thumb_func_end ov45_0222D434

	thumb_func_start ov45_0222D448
ov45_0222D448: ; 0x0222D448
	mov r0, #1
	bx lr
	thumb_func_end ov45_0222D448

	thumb_func_start ov45_0222D44C
ov45_0222D44C: ; 0x0222D44C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	mov r1, #0xc
	bl AllocFromHeap
	str r0, [r4]
	mov r2, #0
	strb r2, [r0]
	strb r2, [r0, #1]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	strb r2, [r0, #4]
	strb r2, [r0, #5]
	strb r2, [r0, #6]
	strb r2, [r0, #7]
	strb r2, [r0, #8]
	strb r2, [r0, #9]
	strb r2, [r0, #0xa]
	strb r2, [r0, #0xb]
	ldr r1, [r4]
	ldr r0, [r5, #0x40]
	str r0, [r1]
	ldr r0, [r5, #0x3c]
	str r0, [r1, #4]
	str r2, [r1, #8]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222D44C

	thumb_func_start ov45_0222D484
ov45_0222D484: ; 0x0222D484
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	mov r1, #0xc
	bl AllocFromHeap
	str r0, [r4]
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	ldr r1, [r4]
	ldr r0, [r5, #0x40]
	str r0, [r1]
	ldr r0, [r5, #0x3c]
	str r0, [r1, #4]
	mov r0, #1
	str r0, [r1, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D484

	thumb_func_start ov45_0222D4C0
ov45_0222D4C0: ; 0x0222D4C0
	ldr r3, _0222D4C8 ; =FreeToHeap
	ldr r0, [r0]
	bx r3
	nop
_0222D4C8: .word FreeToHeap
	thumb_func_end ov45_0222D4C0

	thumb_func_start ov45_0222D4CC
ov45_0222D4CC: ; 0x0222D4CC
	ldr r3, _0222D4D4 ; =ov45_0222CDC4
	ldr r2, _0222D4D8 ; =ov45_02254B44
	bx r3
	nop
_0222D4D4: .word ov45_0222CDC4
_0222D4D8: .word ov45_02254B44
	thumb_func_end ov45_0222D4CC

	thumb_func_start ov45_0222D4DC
ov45_0222D4DC: ; 0x0222D4DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl ov45_0222A33C
	cmp r0, #0
	beq _0222D4F4
	add r0, r4, #0
	mov r1, #0xa
	bl ov45_0222CE2C
	b _0222D4FC
_0222D4F4:
	add r0, r4, #0
	mov r1, #0
	bl ov45_0222CE2C
_0222D4FC:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov45_0222D4DC

	thumb_func_start ov45_0222D500
ov45_0222D500: ; 0x0222D500
	push {r3, r4, lr}
	sub sp, #0x1c
	add r3, r1, #0
	ldmia r3!, {r2, r3}
	add r4, r0, #0
	add r0, sp, #0xc
	add r1, sp, #0
	bl RTC_ConvertSecondToDateTime
	ldr r0, [sp]
	strb r0, [r4]
	ldr r0, [sp, #4]
	strb r0, [r4, #1]
	ldr r0, [sp, #8]
	strb r0, [r4, #2]
	add sp, #0x1c
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D500

	thumb_func_start ov45_0222D524
ov45_0222D524: ; 0x0222D524
	push {r4, lr}
	sub sp, #8
	ldr r0, [r0]
	add r4, r2, #0
	str r0, [sp, #4]
	ldr r0, [r1]
	str r0, [sp]
	add r0, sp, #0
	ldrb r2, [r0, #6]
	ldrb r1, [r0, #2]
	add r1, r2, r1
	strb r1, [r0, #6]
	ldrb r0, [r0, #6]
	mov r1, #0x3c
	bl _s32_div_f
	add r1, sp, #0
	ldrb r2, [r1, #5]
	add r0, r2, r0
	strb r0, [r1, #5]
	ldrb r0, [r1, #6]
	mov r1, #0x3c
	bl _s32_div_f
	strb r1, [r4, #2]
	add r0, sp, #0
	ldrb r2, [r0, #5]
	ldrb r1, [r0, #1]
	add r1, r2, r1
	strb r1, [r0, #5]
	ldrb r0, [r0, #5]
	mov r1, #0x3c
	bl _s32_div_f
	add r1, sp, #0
	ldrb r2, [r1, #4]
	add r0, r2, r0
	strb r0, [r1, #4]
	ldrb r0, [r1, #5]
	mov r1, #0x3c
	bl _s32_div_f
	strb r1, [r4, #1]
	add r0, sp, #0
	ldrb r2, [r0, #4]
	ldrb r1, [r0]
	add r1, r2, r1
	strb r1, [r0, #4]
	ldrb r0, [r0, #4]
	mov r1, #0x18
	bl _s32_div_f
	strb r1, [r4]
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D524

	thumb_func_start ov45_0222D594
ov45_0222D594: ; 0x0222D594
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r0, [r0]
	add r4, r2, #0
	str r0, [sp, #4]
	ldr r0, [r1]
	add r1, sp, #0
	str r0, [sp]
	ldrb r5, [r1, #2]
	mov r0, #6
	ldrsb r1, [r1, r0]
	lsl r0, r5, #0x18
	asr r0, r0, #0x18
	sub r0, r1, r0
	bpl _0222D5CE
	neg r0, r0
	mov r1, #0x3c
	bl _s32_div_f
	add r2, sp, #0
	ldrb r3, [r2, #6]
	add r0, r0, #1
	mov r1, #0x3c
	mul r1, r0
	add r1, r3, r1
	strb r1, [r2, #6]
	ldrb r1, [r2, #5]
	sub r0, r1, r0
	strb r0, [r2, #5]
_0222D5CE:
	add r1, sp, #0
	ldrb r0, [r1, #6]
	sub r0, r0, r5
	strb r0, [r4, #2]
	ldrb r5, [r1, #1]
	mov r0, #5
	ldrsb r1, [r1, r0]
	lsl r0, r5, #0x18
	asr r0, r0, #0x18
	sub r0, r1, r0
	bpl _0222D600
	neg r0, r0
	mov r1, #0x3c
	bl _s32_div_f
	add r2, sp, #0
	ldrb r3, [r2, #5]
	add r0, r0, #1
	mov r1, #0x3c
	mul r1, r0
	add r1, r3, r1
	strb r1, [r2, #5]
	ldrb r1, [r2, #4]
	sub r0, r1, r0
	strb r0, [r2, #4]
_0222D600:
	add r1, sp, #0
	ldrb r0, [r1, #5]
	sub r0, r0, r5
	strb r0, [r4, #1]
	mov r0, #4
	ldrsb r2, [r1, r0]
	mov r0, #0
	ldrsb r0, [r1, r0]
	sub r0, r2, r0
	bpl _0222D62A
	neg r0, r0
	mov r1, #0x18
	bl _s32_div_f
	add r1, sp, #0
	add r2, r0, #1
	mov r0, #0x18
	ldrb r3, [r1, #4]
	mul r0, r2
	add r0, r3, r0
	strb r0, [r1, #4]
_0222D62A:
	add r0, sp, #0
	ldrb r1, [r0, #4]
	ldrb r0, [r0]
	sub r0, r1, r0
	strb r0, [r4]
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222D594

	thumb_func_start ov45_0222D638
ov45_0222D638: ; 0x0222D638
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	add r4, r2, #0
	add r6, r3, #0
	cmp r5, #0
	beq _0222D6AE
	add r0, r5, #0
	bl LocationGmmDatRegionCountGetByCountryMsgNo
	cmp r4, r0
	bhi _0222D6AE
	mov r1, #0
	ldr r2, [sp]
	add r0, r1, #0
	mov r7, #1
_0222D658:
	ldrb r3, [r2, #3]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x1c
	bne _0222D664
	add r1, r7, #0
	b _0222D676
_0222D664:
	ldrh r3, [r2]
	cmp r5, r3
	bne _0222D676
	ldrb r3, [r2, #2]
	cmp r4, r3
	bne _0222D676
	cmp r6, #1
	beq _0222D6AE
	mov r1, #1
_0222D676:
	cmp r1, #0
	beq _0222D6A6
	lsl r2, r0, #2
	ldr r0, [sp]
	ldr r1, [sp]
	add r0, r0, r2
	strh r5, [r1, r2]
	strb r4, [r0, #2]
	ldrb r3, [r0, #3]
	mov r1, #0xf
	bic r3, r1
	lsl r1, r6, #0x18
	lsr r2, r1, #0x18
	mov r1, #0xf
	and r1, r2
	orr r1, r3
	strb r1, [r0, #3]
	ldrb r2, [r0, #3]
	mov r1, #0xf0
	bic r2, r1
	mov r1, #0x10
	orr r1, r2
	strb r1, [r0, #3]
	pop {r3, r4, r5, r6, r7, pc}
_0222D6A6:
	add r0, r0, #1
	add r2, r2, #4
	cmp r0, #0x32
	blt _0222D658
_0222D6AE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222D638

	thumb_func_start ov45_0222D6B0
ov45_0222D6B0: ; 0x0222D6B0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x32
	blo _0222D6BE
	bl GF_AssertFail
_0222D6BE:
	lsl r0, r5, #2
	add r4, r4, r0
	ldrb r0, [r4, #3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #1
	beq _0222D6D0
	bl GF_AssertFail
_0222D6D0:
	ldrh r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222D6B0

	thumb_func_start ov45_0222D6D4
ov45_0222D6D4: ; 0x0222D6D4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x32
	blo _0222D6E2
	bl GF_AssertFail
_0222D6E2:
	lsl r4, r4, #2
	add r0, r5, r4
	ldrb r0, [r0, #3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #1
	beq _0222D6F4
	bl GF_AssertFail
_0222D6F4:
	add r0, r5, r4
	ldrb r0, [r0, #2]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D6D4

	thumb_func_start ov45_0222D6FC
ov45_0222D6FC: ; 0x0222D6FC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x32
	blo _0222D70A
	bl GF_AssertFail
_0222D70A:
	lsl r0, r5, #2
	add r4, r4, r0
	ldrb r0, [r4, #3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #1
	beq _0222D71C
	bl GF_AssertFail
_0222D71C:
	ldrb r0, [r4, #3]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222D6FC

	thumb_func_start ov45_0222D724
ov45_0222D724: ; 0x0222D724
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x32
	blo _0222D732
	bl GF_AssertFail
_0222D732:
	lsl r0, r5, #2
	add r0, r4, r0
	ldrb r0, [r0, #3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D724

	thumb_func_start ov45_0222D740
ov45_0222D740: ; 0x0222D740
	push {r4, lr}
	bl NNS_G3dGetMdlSet
	cmp r0, #0
	beq _0222D76A
	add r2, r0, #0
	add r2, #8
	beq _0222D75E
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _0222D75E
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _0222D760
_0222D75E:
	mov r1, #0
_0222D760:
	cmp r1, #0
	beq _0222D76A
	ldr r1, [r1]
	add r4, r0, r1
	b _0222D76C
_0222D76A:
	mov r4, #0
_0222D76C:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x40
	bl NNSi_G3dModifyMatFlag
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x80
	bl NNSi_G3dModifyMatFlag
	mov r2, #2
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #8
	bl NNSi_G3dModifyMatFlag
	mov r2, #1
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #0xa
	bl NNSi_G3dModifyMatFlag
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D740

	thumb_func_start ov45_0222D79C
ov45_0222D79C: ; 0x0222D79C
	push {r4, lr}
	add r4, r1, #0
	bl LocationGmmDatRegionCountGetByCountryMsgNo
	cmp r0, #0
	bne _0222D7B0
	cmp r4, #0
	bne _0222D7B0
	mov r0, #1
	pop {r4, pc}
_0222D7B0:
	cmp r4, #1
	blo _0222D7BC
	cmp r4, r0
	bhi _0222D7BC
	mov r0, #1
	pop {r4, pc}
_0222D7BC:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov45_0222D79C

	thumb_func_start ov45_0222D7C0
ov45_0222D7C0: ; 0x0222D7C0
	ldr r1, _0222D7C8 ; =ov45_02254BB4
	ldrb r0, [r1, r0]
	bx lr
	nop
_0222D7C8: .word ov45_02254BB4
	thumb_func_end ov45_0222D7C0

	thumb_func_start ov45_0222D7CC
ov45_0222D7CC: ; 0x0222D7CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov00_021E6A70
	cmp r0, #0xb
	beq _0222D7DE
	cmp r5, #0x19
	bne _0222D7EA
_0222D7DE:
	cmp r4, #2
	beq _0222D7E6
	mov r0, #0xe
	pop {r3, r4, r5, pc}
_0222D7E6:
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_0222D7EA:
	cmp r5, #0x1a
	bne _0222D7F2
	mov r0, #0xd
	pop {r3, r4, r5, pc}
_0222D7F2:
	cmp r0, #0
	bge _0222D7F8
	mov r0, #0xb
_0222D7F8:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D7CC

	thumb_func_start ov45_0222D7FC
ov45_0222D7FC: ; 0x0222D7FC
	push {r4, lr}
	add r4, r0, #0
	bl ov00_021E6A70
	cmp r4, #0x19
	bne _0222D80C
	mov r0, #0xb
	b _0222D812
_0222D80C:
	cmp r4, #0x1a
	bne _0222D812
	mov r0, #0xc
_0222D812:
	cmp r0, #0xb
	bhi _0222D83E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222D822: ; jump table
	.short _0222D83E - _0222D822 - 2 ; case 0
	.short _0222D83A - _0222D822 - 2 ; case 1
	.short _0222D83E - _0222D822 - 2 ; case 2
	.short _0222D83E - _0222D822 - 2 ; case 3
	.short _0222D83A - _0222D822 - 2 ; case 4
	.short _0222D83A - _0222D822 - 2 ; case 5
	.short _0222D83A - _0222D822 - 2 ; case 6
	.short _0222D83A - _0222D822 - 2 ; case 7
	.short _0222D83A - _0222D822 - 2 ; case 8
	.short _0222D83A - _0222D822 - 2 ; case 9
	.short _0222D83A - _0222D822 - 2 ; case 10
	.short _0222D83A - _0222D822 - 2 ; case 11
_0222D83A:
	mov r0, #0
	pop {r4, pc}
_0222D83E:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D7FC

	thumb_func_start ov45_0222D844
ov45_0222D844: ; 0x0222D844
	push {r3, lr}
	bl sub_020393C8
	cmp r0, #0
	bne _0222D856
	bl sub_020397FC
	cmp r0, #0
	beq _0222D85A
_0222D856:
	mov r0, #1
	pop {r3, pc}
_0222D85A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D844

	thumb_func_start ov45_0222D860
ov45_0222D860: ; 0x0222D860
	push {r3, r4, r5, lr}
	mov r1, #0x23
	lsl r1, r1, #4
	add r5, r0, #0
	bl AllocFromHeap
	mov r2, #0x23
	add r4, r0, #0
	mov r1, #0
	lsl r2, r2, #4
	bl memset
	add r0, r4, #0
	add r0, #8
	bl ov45_0222DE1C
	add r0, r4, #0
	add r0, #0x5c
	add r1, r5, #0
	bl ov45_0222DF78
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D860

	thumb_func_start ov45_0222D890
ov45_0222D890: ; 0x0222D890
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x5c
	bl ov45_0222DFD0
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D890

	thumb_func_start ov45_0222D8A4
ov45_0222D8A4: ; 0x0222D8A4
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x5c
	bl ov45_0222E000
	add r4, #8
	add r0, r4, #0
	mov r1, #0
	bl ov45_0222DEA4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D8A4

	thumb_func_start ov45_0222D8BC
ov45_0222D8BC: ; 0x0222D8BC
	ldr r1, [r1]
	str r1, [r0]
	mov r1, #1
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222D8BC

	thumb_func_start ov45_0222D8C8
ov45_0222D8C8: ; 0x0222D8C8
	push {r3, lr}
	add r0, #8
	bl ov45_0222DE58
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D8C8

	thumb_func_start ov45_0222D8D4
ov45_0222D8D4: ; 0x0222D8D4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #8
	add r4, r1, #0
	bl ov45_0222DF14
	add r5, #8
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov45_0222DE74
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222D8D4

	thumb_func_start ov45_0222D8F0
ov45_0222D8F0: ; 0x0222D8F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	str r0, [sp]
	str r1, [sp, #4]
	mov r5, #0
	add r4, #8
	mov r6, #2
	mov r7, #2
_0222D902:
	add r0, r4, #0
	add r1, r5, #0
	bl ov45_0222DF38
	add r2, r0, #0
	tst r0, r7
	beq _0222D91A
	add r0, r4, #0
	add r1, r5, #0
	bic r2, r6
	bl ov45_0222DE8C
_0222D91A:
	add r5, r5, #1
	cmp r5, #0x14
	blt _0222D902
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r0, #8
	bl ov45_0222DF38
	add r3, r0, #0
	ldr r0, [sp]
	mov r2, #2
	add r0, #8
	ldr r1, [sp, #4]
	orr r2, r3
	str r0, [sp]
	bl ov45_0222DE8C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222D8F0

	thumb_func_start ov45_0222D940
ov45_0222D940: ; 0x0222D940
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	add r5, r0, #0
	add r4, r1, #0
	add r0, #0x5c
	mov r1, #8
	bl ov45_0222E04C
	add r6, r0, #0
	beq _0222D98C
	ldr r1, [r4]
	str r1, [sp]
	ldr r1, [r4, #4]
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldrh r2, [r4, #8]
	add r3, r1, #0
	str r2, [sp, #0x10]
	ldrh r2, [r4, #0xa]
	str r2, [sp, #0x14]
	str r1, [sp, #0x18]
	mov r2, #0x96
	str r1, [sp, #0x1c]
	lsl r2, r2, #2
	str r2, [sp, #0x20]
	mov r2, #8
	str r2, [sp, #0x24]
	add r2, r1, #0
	str r1, [sp, #0x28]
	bl ov45_0222E0E0
	add r5, #0x5c
	add r0, r5, #0
	add r1, r6, #0
	bl ov45_0222E0A4
_0222D98C:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov45_0222D940

	thumb_func_start ov45_0222D990
ov45_0222D990: ; 0x0222D990
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0x1b
	bhs _0222D9E6
	add r0, r5, #0
	add r0, #0x5c
	mov r1, #7
	bl ov45_0222E04C
	add r6, r0, #0
	beq _0222D9E6
	ldr r1, [r4]
	mov r2, #0
	str r1, [sp]
	ldr r1, [r4, #4]
	add r3, r2, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	ldrh r1, [r4, #8]
	str r1, [sp, #0x10]
	ldrh r1, [r4, #0xa]
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	mov r1, #0x96
	str r2, [sp, #0x1c]
	lsl r1, r1, #2
	str r1, [sp, #0x20]
	mov r1, #7
	str r1, [sp, #0x24]
	mov r1, #1
	str r1, [sp, #0x28]
	ldr r1, [r4, #0xc]
	bl ov45_0222E0E0
	add r5, #0x5c
	add r0, r5, #0
	add r1, r6, #0
	bl ov45_0222E0A4
_0222D9E6:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov45_0222D990

	thumb_func_start ov45_0222D9EC
ov45_0222D9EC: ; 0x0222D9EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r1, #0
	ldr r4, [r5]
	add r6, r0, #0
	cmp r4, #0
	beq _0222DA02
	cmp r4, #1
	beq _0222DA02
	cmp r4, #2
	bne _0222DA76
_0222DA02:
	ldr r0, [r5, #0x20]
	cmp r0, #1
	ldr r0, [r5, #4]
	bne _0222DA16
	cmp r0, #2
	blo _0222DA76
	cmp r0, #4
	bls _0222DA1E
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
_0222DA16:
	cmp r0, #1
	blo _0222DA76
	cmp r0, #4
	bhi _0222DA76
_0222DA1E:
	ldr r0, _0222DA7C ; =ov45_02254BDC
	lsl r1, r4, #2
	ldr r7, [r0, r1]
	add r0, r6, #0
	lsl r1, r7, #0x10
	add r0, #0x5c
	lsr r1, r1, #0x10
	bl ov45_0222E04C
	str r0, [sp, #0x2c]
	cmp r0, #0
	beq _0222DA76
	ldr r1, [r5, #8]
	str r1, [sp]
	ldr r1, [r5, #0xc]
	str r1, [sp, #4]
	ldr r1, [r5, #0x10]
	str r1, [sp, #8]
	ldr r1, [r5, #0x14]
	str r1, [sp, #0xc]
	ldrh r1, [r5, #0x18]
	str r1, [sp, #0x10]
	ldrh r1, [r5, #0x1a]
	str r1, [sp, #0x14]
	ldrh r1, [r5, #0x1c]
	str r1, [sp, #0x18]
	ldrh r1, [r5, #0x1e]
	str r1, [sp, #0x1c]
	mov r1, #0xe1
	lsl r1, r1, #2
	str r1, [sp, #0x20]
	str r7, [sp, #0x24]
	mov r1, #2
	str r1, [sp, #0x28]
	ldr r2, [r5, #4]
	ldr r3, [r5, #0x20]
	add r1, r4, #0
	bl ov45_0222E0E0
	add r6, #0x5c
	ldr r1, [sp, #0x2c]
	add r0, r6, #0
	bl ov45_0222E0A4
_0222DA76:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DA7C: .word ov45_02254BDC
	thumb_func_end ov45_0222D9EC

	thumb_func_start ov45_0222DA80
ov45_0222DA80: ; 0x0222DA80
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	add r4, r1, #0
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #3
	beq _0222DA92
	cmp r1, #4
	bne _0222DADA
_0222DA92:
	add r1, r1, #5
	add r0, r5, #0
	lsl r1, r1, #0x10
	add r0, #0x5c
	lsr r1, r1, #0x10
	bl ov45_0222E04C
	add r6, r0, #0
	beq _0222DADA
	ldr r1, [r4]
	ldr r2, [r4, #8]
	mov r3, #0
	str r2, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	ldrh r2, [r4, #0xc]
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	str r3, [sp, #0x18]
	mov r2, #0xe1
	str r3, [sp, #0x1c]
	lsl r2, r2, #2
	str r2, [sp, #0x20]
	add r2, r1, #5
	str r2, [sp, #0x24]
	mov r2, #3
	str r2, [sp, #0x28]
	ldr r2, [r4, #4]
	bl ov45_0222E0E0
	add r5, #0x5c
	add r0, r5, #0
	add r1, r6, #0
	bl ov45_0222E0A4
_0222DADA:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov45_0222DA80

	thumb_func_start ov45_0222DAE0
ov45_0222DAE0: ; 0x0222DAE0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	add r5, r0, #0
	add r4, r1, #0
	add r0, #0x5c
	mov r1, #0xc
	bl ov45_0222E04C
	add r6, r0, #0
	beq _0222DB34
	ldr r1, [r4, #4]
	mov r2, #0
	str r1, [sp]
	ldr r1, [r4, #8]
	add r3, r2, #0
	str r1, [sp, #4]
	ldr r1, [r4, #0xc]
	str r1, [sp, #8]
	ldr r1, [r4, #0x10]
	str r1, [sp, #0xc]
	ldrh r1, [r4, #0x14]
	str r1, [sp, #0x10]
	ldrh r1, [r4, #0x16]
	str r1, [sp, #0x14]
	ldrh r1, [r4, #0x18]
	str r1, [sp, #0x18]
	ldrh r1, [r4, #0x1a]
	str r1, [sp, #0x1c]
	ldr r1, _0222DB38 ; =0x000001C2
	str r1, [sp, #0x20]
	mov r1, #0xc
	str r1, [sp, #0x24]
	mov r1, #4
	str r1, [sp, #0x28]
	ldr r1, [r4]
	bl ov45_0222E0E0
	add r5, #0x5c
	add r0, r5, #0
	add r1, r6, #0
	bl ov45_0222E0A4
_0222DB34:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222DB38: .word 0x000001C2
	thumb_func_end ov45_0222DAE0

	thumb_func_start ov45_0222DB3C
ov45_0222DB3C: ; 0x0222DB3C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	add r5, r0, #0
	add r4, r1, #0
	add r0, #0x5c
	mov r1, #0xd
	bl ov45_0222E04C
	add r6, r0, #0
	beq _0222DB90
	ldr r1, [r4, #4]
	mov r2, #0
	str r1, [sp]
	ldr r1, [r4, #8]
	add r3, r2, #0
	str r1, [sp, #4]
	ldr r1, [r4, #0xc]
	str r1, [sp, #8]
	ldr r1, [r4, #0x10]
	str r1, [sp, #0xc]
	ldrh r1, [r4, #0x14]
	str r1, [sp, #0x10]
	ldrh r1, [r4, #0x16]
	str r1, [sp, #0x14]
	ldrh r1, [r4, #0x18]
	str r1, [sp, #0x18]
	ldrh r1, [r4, #0x1a]
	str r1, [sp, #0x1c]
	ldr r1, _0222DB94 ; =0x000001C2
	str r1, [sp, #0x20]
	mov r1, #0xd
	str r1, [sp, #0x24]
	mov r1, #5
	str r1, [sp, #0x28]
	ldr r1, [r4]
	bl ov45_0222E0E0
	add r5, #0x5c
	add r0, r5, #0
	add r1, r6, #0
	bl ov45_0222E0A4
_0222DB90:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222DB94: .word 0x000001C2
	thumb_func_end ov45_0222DB3C

	thumb_func_start ov45_0222DB98
ov45_0222DB98: ; 0x0222DB98
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #4
	bhi _0222DC02
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222DBB2: ; jump table
	.short _0222DBC0 - _0222DBB2 - 2 ; case 0
	.short _0222DBC0 - _0222DBB2 - 2 ; case 1
	.short _0222DBC0 - _0222DBB2 - 2 ; case 2
	.short _0222DBBC - _0222DBB2 - 2 ; case 3
	.short _0222DBC0 - _0222DBB2 - 2 ; case 4
_0222DBBC:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
_0222DBC0:
	add r0, r5, #0
	add r0, #0x5c
	mov r1, #0xe
	bl ov45_0222E04C
	add r6, r0, #0
	beq _0222DC02
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	str r3, [sp, #0x14]
	str r3, [sp, #0x18]
	mov r1, #0xe1
	str r3, [sp, #0x1c]
	lsl r1, r1, #2
	str r1, [sp, #0x20]
	mov r1, #0xe
	str r1, [sp, #0x24]
	mov r1, #6
	str r1, [sp, #0x28]
	ldr r1, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r1]
	bl ov45_0222E0E0
	add r5, #0x5c
	add r0, r5, #0
	add r1, r6, #0
	bl ov45_0222E0A4
_0222DC02:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov45_0222DB98

	thumb_func_start ov45_0222DC08
ov45_0222DC08: ; 0x0222DC08
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0x14
	bhs _0222DC5A
	ldrb r0, [r2, r0]
	cmp r0, #0
	beq _0222DC5A
	add r0, r5, #0
	add r0, #0x5c
	mov r1, #1
	bl ov45_0222E04C
	add r6, r0, #0
	beq _0222DC5A
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r1, _0222DC60 ; =0x00000708
	str r2, [sp, #0x1c]
	str r1, [sp, #0x20]
	mov r1, #1
	str r1, [sp, #0x24]
	mov r1, #7
	str r1, [sp, #0x28]
	ldr r1, [r4]
	add r3, r2, #0
	bl ov45_0222E0E0
	add r5, #0x5c
	add r0, r5, #0
	add r1, r6, #0
	bl ov45_0222E0A4
_0222DC5A:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	nop
_0222DC60: .word 0x00000708
	thumb_func_end ov45_0222DC08

	thumb_func_start ov45_0222DC64
ov45_0222DC64: ; 0x0222DC64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0222DC7A
	cmp r0, #1
	beq _0222DC7A
	cmp r0, #2
	bne _0222DCDA
_0222DC7A:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl ov45_0222E5B4
	cmp r0, #0
	beq _0222DCDA
	ldr r7, [r4]
	ldr r0, _0222DCE0 ; =ov45_02254BC8
	ldrb r6, [r0, r7]
	add r0, r5, #0
	add r0, #0x5c
	add r1, r6, #0
	bl ov45_0222E04C
	str r0, [sp, #0x2c]
	cmp r0, #0
	beq _0222DCDA
	ldr r1, [r4, #8]
	mov r3, #0
	str r1, [sp]
	ldr r1, [r4, #0xc]
	str r1, [sp, #4]
	ldr r1, [r4, #0x10]
	str r1, [sp, #8]
	ldr r1, [r4, #0x14]
	str r1, [sp, #0xc]
	ldrh r1, [r4, #0x18]
	str r1, [sp, #0x10]
	ldrh r1, [r4, #0x1a]
	str r1, [sp, #0x14]
	ldrh r1, [r4, #0x1c]
	str r1, [sp, #0x18]
	ldrh r1, [r4, #0x1e]
	str r1, [sp, #0x1c]
	ldr r1, _0222DCE4 ; =0x000001C2
	str r1, [sp, #0x20]
	str r6, [sp, #0x24]
	mov r1, #8
	str r1, [sp, #0x28]
	ldr r2, [r4, #4]
	add r1, r7, #0
	bl ov45_0222E0E0
	add r5, #0x5c
	ldr r1, [sp, #0x2c]
	add r0, r5, #0
	bl ov45_0222E0A4
_0222DCDA:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DCE0: .word ov45_02254BC8
_0222DCE4: .word 0x000001C2
	thumb_func_end ov45_0222DC64

	thumb_func_start ov45_0222DCE8
ov45_0222DCE8: ; 0x0222DCE8
	ldr r3, _0222DCF0 ; =ov45_0222E03C
	add r0, #0x5c
	bx r3
	nop
_0222DCF0: .word ov45_0222E03C
	thumb_func_end ov45_0222DCE8

	thumb_func_start ov45_0222DCF4
ov45_0222DCF4: ; 0x0222DCF4
	ldr r2, [r0]
	str r2, [r1]
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov45_0222DCF4

	thumb_func_start ov45_0222DCFC
ov45_0222DCFC: ; 0x0222DCFC
	ldr r3, _0222DD04 ; =ov45_0222DECC
	add r0, #8
	bx r3
	nop
_0222DD04: .word ov45_0222DECC
	thumb_func_end ov45_0222DCFC

	thumb_func_start ov45_0222DD08
ov45_0222DD08: ; 0x0222DD08
	ldr r3, _0222DD10 ; =ov45_0222DEE0
	add r0, #8
	bx r3
	nop
_0222DD10: .word ov45_0222DEE0
	thumb_func_end ov45_0222DD08

	thumb_func_start ov45_0222DD14
ov45_0222DD14: ; 0x0222DD14
	ldr r3, _0222DD1C ; =ov45_0222DEF4
	add r0, #8
	bx r3
	nop
_0222DD1C: .word ov45_0222DEF4
	thumb_func_end ov45_0222DD14

	thumb_func_start ov45_0222DD20
ov45_0222DD20: ; 0x0222DD20
	ldr r3, _0222DD28 ; =ov45_0222DF14
	add r0, #8
	bx r3
	nop
_0222DD28: .word ov45_0222DF14
	thumb_func_end ov45_0222DD20

	thumb_func_start ov45_0222DD2C
ov45_0222DD2C: ; 0x0222DD2C
	ldr r3, _0222DD34 ; =ov45_0222DF58
	add r0, #8
	bx r3
	nop
_0222DD34: .word ov45_0222DF58
	thumb_func_end ov45_0222DD2C

	thumb_func_start ov45_0222DD38
ov45_0222DD38: ; 0x0222DD38
	ldr r3, _0222DD40 ; =ov45_0222DF50
	add r0, #8
	bx r3
	nop
_0222DD40: .word ov45_0222DF50
	thumb_func_end ov45_0222DD38

	thumb_func_start ov45_0222DD44
ov45_0222DD44: ; 0x0222DD44
	mov r1, #0x8a
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	sub r1, #0x2c
	add r0, r0, r1
	cmp r2, r0
	beq _0222DD56
	mov r0, #1
	bx lr
_0222DD56:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222DD44

	thumb_func_start ov45_0222DD5C
ov45_0222DD5C: ; 0x0222DD5C
	push {r4, lr}
	add r4, r0, #0
	bl ov45_0222DD44
	cmp r0, #0
	bne _0222DD6C
	bl GF_AssertFail
_0222DD6C:
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222DD5C

	thumb_func_start ov45_0222DD78
ov45_0222DD78: ; 0x0222DD78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	str r1, [sp, #8]
	add r5, r3, #0
	bl ov45_0222DD44
	cmp r0, #0
	bne _0222DD8E
	bl GF_AssertFail
_0222DD8E:
	mov r2, #0x8a
	lsl r2, r2, #2
	ldr r4, [r4, r2]
	ldr r3, [sp, #0x28]
	mov r0, #1
	mov r1, #0x1b
	add r2, #0xcd
	bl NewMsgDataFromNarc
	add r7, r0, #0
	ldr r0, [sp, #0x28]
	bl ScrStrBufs_new
	ldrb r6, [r4]
	str r0, [sp, #0xc]
	cmp r6, #9
	bhs _0222DDCA
	ldr r0, [sp, #0x28]
	str r5, [sp]
	str r0, [sp, #4]
	add r0, r4, #0
	ldr r4, _0222DDE0 ; =ov45_02254C0C
	lsl r5, r6, #2
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r4, [r4, r5]
	add r3, r7, #0
	blx r4
	add r4, r0, #0
	b _0222DDCC
_0222DDCA:
	mov r4, #0
_0222DDCC:
	add r0, r7, #0
	bl DestroyMsgData
	ldr r0, [sp, #0xc]
	bl ScrStrBufs_delete
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DDE0: .word ov45_02254C0C
	thumb_func_end ov45_0222DD78

	thumb_func_start ov45_0222DDE4
ov45_0222DDE4: ; 0x0222DDE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl ov45_0222DD44
	cmp r0, #0
	bne _0222DDF6
	bl GF_AssertFail
_0222DDF6:
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r2, [r0]
	cmp r2, #9
	bhs _0222DE0E
	lsl r3, r2, #2
	ldr r2, _0222DE18 ; =ov45_02254BE8
	add r1, r4, #0
	ldr r2, [r2, r3]
	blx r2
	pop {r3, r4, r5, pc}
_0222DE0E:
	bl GF_AssertFail
	mov r0, #0x14
	pop {r3, r4, r5, pc}
	nop
_0222DE18: .word ov45_02254BE8
	thumb_func_end ov45_0222DDE4

	thumb_func_start ov45_0222DE1C
ov45_0222DE1C: ; 0x0222DE1C
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	add r5, r0, #0
	mov r6, #2
	add r7, r4, #0
_0222DE26:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov45_0222DE3C
	add r4, r4, #1
	cmp r4, #0x14
	blt _0222DE26
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov45_0222DE1C

	thumb_func_start ov45_0222DE3C
ov45_0222DE3C: ; 0x0222DE3C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r4, #0x14
	blo _0222DE4E
	bl GF_AssertFail
_0222DE4E:
	lsl r0, r4, #2
	strh r6, [r5, r0]
	add r0, r5, r0
	strh r7, [r0, #2]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222DE3C

	thumb_func_start ov45_0222DE58
ov45_0222DE58: ; 0x0222DE58
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov45_0222DE3C
	add r0, r5, #0
	mov r1, #1
	bl ov45_0222DEA4
	add r0, r5, #0
	add r1, r4, #0
	bl ov45_0222DEB8
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222DE58

	thumb_func_start ov45_0222DE74
ov45_0222DE74: ; 0x0222DE74
	push {r4, lr}
	add r4, r0, #0
	mov r2, #2
	mov r3, #0
	bl ov45_0222DE3C
	add r0, r4, #0
	mov r1, #2
	bl ov45_0222DEA4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222DE74

	thumb_func_start ov45_0222DE8C
ov45_0222DE8C: ; 0x0222DE8C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x14
	blo _0222DE9C
	bl GF_AssertFail
_0222DE9C:
	lsl r0, r4, #2
	add r0, r5, r0
	strh r6, [r0, #2]
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222DE8C

	thumb_func_start ov45_0222DEA4
ov45_0222DEA4: ; 0x0222DEA4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #2
	ble _0222DEB2
	bl GF_AssertFail
_0222DEB2:
	add r5, #0x50
	strh r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222DEA4

	thumb_func_start ov45_0222DEB8
ov45_0222DEB8: ; 0x0222DEB8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x14
	blo _0222DEC6
	bl GF_AssertFail
_0222DEC6:
	add r5, #0x52
	strh r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222DEB8

	thumb_func_start ov45_0222DECC
ov45_0222DECC: ; 0x0222DECC
	push {r3, lr}
	bl ov45_0222DEE0
	cmp r0, #2
	beq _0222DEDA
	mov r0, #1
	pop {r3, pc}
_0222DEDA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov45_0222DECC

	thumb_func_start ov45_0222DEE0
ov45_0222DEE0: ; 0x0222DEE0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x14
	blo _0222DEEE
	bl GF_AssertFail
_0222DEEE:
	lsl r0, r5, #2
	ldrh r0, [r4, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222DEE0

	thumb_func_start ov45_0222DEF4
ov45_0222DEF4: ; 0x0222DEF4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x14
	blo _0222DF02
	bl GF_AssertFail
_0222DF02:
	lsl r0, r5, #2
	add r0, r4, r0
	ldrh r1, [r0, #2]
	mov r0, #1
	tst r1, r0
	bne _0222DF10
	mov r0, #0
_0222DF10:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222DEF4

	thumb_func_start ov45_0222DF14
ov45_0222DF14: ; 0x0222DF14
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x14
	blo _0222DF22
	bl GF_AssertFail
_0222DF22:
	lsl r0, r5, #2
	add r0, r4, r0
	ldrh r1, [r0, #2]
	mov r0, #2
	tst r0, r1
	beq _0222DF32
	mov r0, #1
	pop {r3, r4, r5, pc}
_0222DF32:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222DF14

	thumb_func_start ov45_0222DF38
ov45_0222DF38: ; 0x0222DF38
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x14
	blo _0222DF46
	bl GF_AssertFail
_0222DF46:
	lsl r0, r5, #2
	add r0, r4, r0
	ldrh r0, [r0, #2]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222DF38

	thumb_func_start ov45_0222DF50
ov45_0222DF50: ; 0x0222DF50
	add r0, #0x50
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222DF50

	thumb_func_start ov45_0222DF58
ov45_0222DF58: ; 0x0222DF58
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x14
	blo _0222DF66
	bl GF_AssertFail
_0222DF66:
	add r5, #0x52
	ldrh r0, [r5]
	cmp r0, r4
	bne _0222DF72
	mov r0, #1
	pop {r3, r4, r5, pc}
_0222DF72:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222DF58

	thumb_func_start ov45_0222DF78
ov45_0222DF78: ; 0x0222DF78
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r2, #0x75
	add r6, r1, #0
	mov r1, #0
	lsl r2, r2, #2
	str r0, [sp]
	bl memset
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp]
	mov r7, #8
	str r0, [sp, #4]
_0222DF94:
	ldr r5, [sp, #4]
	mov r4, #0
_0222DF98:
	add r0, r7, #0
	add r1, r6, #0
	bl String_ctor
	str r0, [r5, #0x10]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0222DF98
	ldr r0, [sp, #4]
	add r0, #0x34
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #8
	blt _0222DF94
	mov r2, #0x1a
	lsl r2, r2, #4
	ldr r0, [sp]
	add r1, r2, #0
	add r3, r0, r2
	add r1, #0x2c
	str r3, [r0, r1]
	add r2, #0x30
	str r3, [r0, r2]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222DF78

	thumb_func_start ov45_0222DFD0
ov45_0222DFD0: ; 0x0222DFD0
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	mov r7, #0
	add r6, r0, #0
_0222DFD8:
	mov r4, #0
	add r5, r6, #0
_0222DFDC:
	ldr r0, [r5, #0x10]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0222DFDC
	add r7, r7, #1
	add r6, #0x34
	cmp r7, #8
	blt _0222DFD8
	mov r2, #0x75
	ldr r0, [sp]
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222DFD0

	thumb_func_start ov45_0222E000
ov45_0222E000: ; 0x0222E000
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	sub r0, #0x2c
	add r4, r6, r0
	cmp r1, r4
	beq _0222E038
	mov r7, #0
_0222E014:
	ldr r5, [r1, #0x2c]
	mov r0, #0x2a
	strh r7, [r1, #0x28]
	ldrsh r0, [r1, r0]
	sub r0, r0, #1
	cmp r0, #0
	ble _0222E02C
	mov r0, #0x2a
	ldrsh r0, [r1, r0]
	sub r0, r0, #1
	strh r0, [r1, #0x2a]
	b _0222E032
_0222E02C:
	add r0, r6, #0
	bl ov45_0222E0CC
_0222E032:
	add r1, r5, #0
	cmp r5, r4
	bne _0222E014
_0222E038:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov45_0222E000

	thumb_func_start ov45_0222E03C
ov45_0222E03C: ; 0x0222E03C
	mov r1, #0x73
	lsl r1, r1, #2
	ldr r3, _0222E048 ; =ov45_0222E0CC
	ldr r1, [r0, r1]
	bx r3
	nop
_0222E048: .word ov45_0222E0CC
	thumb_func_end ov45_0222E03C

	thumb_func_start ov45_0222E04C
ov45_0222E04C: ; 0x0222E04C
	push {r3, r4, r5, lr}
	mov r4, #0
	add r3, r4, #0
	add r5, r0, #0
_0222E054:
	ldr r2, [r5, #0x2c]
	cmp r2, #0
	bne _0222E062
	mov r2, #0x34
	mul r2, r3
	add r4, r0, r2
	b _0222E06A
_0222E062:
	add r3, r3, #1
	add r5, #0x34
	cmp r3, #8
	blt _0222E054
_0222E06A:
	cmp r4, #0
	bne _0222E08E
	mov r2, #0
	add r5, r0, #0
_0222E072:
	ldrh r3, [r5, #0x28]
	cmp r3, r1
	blo _0222E086
	mov r1, #0x34
	mul r1, r2
	add r4, r0, r1
	add r1, r4, #0
	bl ov45_0222E0CC
	b _0222E08E
_0222E086:
	add r2, r2, #1
	add r5, #0x34
	cmp r2, #8
	blt _0222E072
_0222E08E:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222E04C

	thumb_func_start ov45_0222E094
ov45_0222E094: ; 0x0222E094
	ldr r2, [r0, #0x2c]
	str r2, [r1, #0x2c]
	str r0, [r1, #0x30]
	str r1, [r0, #0x2c]
	ldr r0, [r1, #0x2c]
	str r1, [r0, #0x30]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222E094

	thumb_func_start ov45_0222E0A4
ov45_0222E0A4: ; 0x0222E0A4
	push {r4, lr}
	mov r2, #0x1d
	lsl r2, r2, #4
	ldr r3, [r0, r2]
	sub r2, #0x30
	add r2, r0, r2
	cmp r3, r2
	beq _0222E0C2
	ldrh r4, [r1, #0x28]
_0222E0B6:
	ldrh r0, [r3, #0x28]
	cmp r0, r4
	blo _0222E0C2
	ldr r3, [r3, #0x30]
	cmp r3, r2
	bne _0222E0B6
_0222E0C2:
	add r0, r3, #0
	bl ov45_0222E094
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_0222E0A4

	thumb_func_start ov45_0222E0CC
ov45_0222E0CC: ; 0x0222E0CC
	ldr r2, [r1, #0x2c]
	ldr r0, [r1, #0x30]
	str r2, [r0, #0x2c]
	ldr r2, [r1, #0x30]
	ldr r0, [r1, #0x2c]
	str r2, [r0, #0x30]
	mov r0, #0
	str r0, [r1, #0x30]
	str r0, [r1, #0x2c]
	bx lr
	thumb_func_end ov45_0222E0CC

	thumb_func_start ov45_0222E0E0
ov45_0222E0E0: ; 0x0222E0E0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [sp, #0x40]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #9
	blo _0222E0F4
	bl GF_AssertFail
_0222E0F4:
	ldr r0, [sp, #0x40]
	strb r0, [r5]
	ldr r0, [sp, #0x38]
	strh r0, [r5, #0x2a]
	ldr r0, [sp, #0x3c]
	strh r0, [r5, #0x28]
	str r4, [r5, #4]
	str r6, [r5, #8]
	str r7, [r5, #0xc]
	add r0, sp, #8
	ldrh r1, [r0, #0x20]
	strh r1, [r5, #0x20]
	ldrh r1, [r0, #0x24]
	strh r1, [r5, #0x22]
	ldrh r1, [r0, #0x28]
	strh r1, [r5, #0x24]
	ldrh r0, [r0, #0x2c]
	strh r0, [r5, #0x26]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _0222E124
	ldr r1, [r5, #0x10]
	bl PlayerName_FlatToString
_0222E124:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0222E130
	ldr r1, [r5, #0x14]
	bl PlayerName_FlatToString
_0222E130:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0222E13C
	ldr r1, [r5, #0x18]
	bl PlayerName_FlatToString
_0222E13C:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _0222E148
	ldr r1, [r5, #0x1c]
	bl PlayerName_FlatToString
_0222E148:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov45_0222E0E0

	thumb_func_start ov45_0222E14C
ov45_0222E14C: ; 0x0222E14C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0222E19C ; =gGameLanguage
	add r6, r2, #0
	ldrb r4, [r0]
	mov r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	mov r1, #0
	add r7, r3, #0
	ldr r2, [r5, #0x10]
	add r0, r6, #0
	add r3, r1, #0
	bl BufferString
	mov r1, #1
	str r1, [sp]
	str r4, [sp, #4]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	mov r3, #0
	bl BufferString
	add r0, r7, #0
	mov r1, #7
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, [sp, #0x20]
	add r0, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222E19C: .word gGameLanguage
	thumb_func_end ov45_0222E14C

	thumb_func_start ov45_0222E1A0
ov45_0222E1A0: ; 0x0222E1A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0222E1FC ; =gGameLanguage
	add r6, r2, #0
	ldrb r4, [r0]
	mov r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	mov r1, #0
	add r7, r3, #0
	ldr r2, [r5, #0x10]
	add r0, r6, #0
	add r3, r1, #0
	bl BufferString
	mov r1, #1
	str r1, [sp]
	str r4, [sp, #4]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	mov r3, #0
	bl BufferString
	ldr r2, [r5, #4]
	add r0, r6, #0
	mov r1, #2
	bl BufferWiFiPlazaInstrumentName
	add r0, r7, #0
	mov r1, #8
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, [sp, #0x20]
	add r0, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E1FC: .word gGameLanguage
	thumb_func_end ov45_0222E1A0

	thumb_func_start ov45_0222E200
ov45_0222E200: ; 0x0222E200
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r2, #0
	ldr r2, [r5, #4]
	add r0, r4, #0
	mov r1, #0
	add r7, r3, #0
	bl BufferWiFiPlazaActivityName
	ldr r0, [r5, #0xc]
	cmp r0, #1
	bne _0222E2EE
	ldr r0, [r5, #8]
	cmp r0, #2
	beq _0222E266
	cmp r0, #3
	beq _0222E22A
	cmp r0, #4
	beq _0222E290
	b _0222E2DE
_0222E22A:
	ldr r0, _0222E338 ; =gGameLanguage
	mov r1, #1
	ldrb r6, [r0]
	str r1, [sp]
	add r0, r4, #0
	str r6, [sp, #4]
	ldr r2, [r5, #0x10]
	mov r3, #0
	bl BufferString
	mov r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	ldr r2, [r5, #0x14]
	add r0, r4, #0
	mov r1, #2
	mov r3, #0
	bl BufferString
	mov r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	ldr r2, [r5, #0x18]
	add r0, r4, #0
	mov r1, #3
	mov r3, #0
	bl BufferString
	mov r1, #0x12
	b _0222E2E4
_0222E266:
	ldr r0, _0222E338 ; =gGameLanguage
	mov r1, #1
	ldrb r6, [r0]
	str r1, [sp]
	add r0, r4, #0
	str r6, [sp, #4]
	ldr r2, [r5, #0x10]
	mov r3, #0
	bl BufferString
	mov r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	ldr r2, [r5, #0x14]
	add r0, r4, #0
	mov r1, #2
	mov r3, #0
	bl BufferString
	mov r1, #0x13
	b _0222E2E4
_0222E290:
	ldr r0, _0222E338 ; =gGameLanguage
	mov r1, #1
	ldrb r6, [r0]
	str r1, [sp]
	add r0, r4, #0
	str r6, [sp, #4]
	ldr r2, [r5, #0x10]
	mov r3, #0
	bl BufferString
	mov r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	ldr r2, [r5, #0x14]
	add r0, r4, #0
	mov r1, #2
	mov r3, #0
	bl BufferString
	mov r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	ldr r2, [r5, #0x18]
	add r0, r4, #0
	mov r1, #3
	mov r3, #0
	bl BufferString
	mov r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	ldr r2, [r5, #0x1c]
	add r0, r4, #0
	mov r1, #4
	mov r3, #0
	bl BufferString
	mov r1, #6
	b _0222E2E4
_0222E2DE:
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222E2E4:
	add r0, r7, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	b _0222E320
_0222E2EE:
	ldr r0, _0222E338 ; =gGameLanguage
	mov r1, #1
	ldrb r0, [r0]
	str r1, [sp]
	mov r3, #0
	str r0, [sp, #4]
	ldr r2, [r5, #0x10]
	add r0, r4, #0
	bl BufferString
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r5, [r5, #8]
	mov r2, #4
	add r0, r4, #0
	mov r1, #2
	sub r2, r2, r5
	bl BufferIntegerAsString
	add r0, r7, #0
	mov r1, #5
	bl NewString_ReadMsgData
	add r5, r0, #0
_0222E320:
	ldr r1, [sp, #0x20]
	add r0, r4, #0
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E338: .word gGameLanguage
	thumb_func_end ov45_0222E200

	thumb_func_start ov45_0222E33C
ov45_0222E33C: ; 0x0222E33C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r2, #0
	ldr r2, [r5, #4]
	add r0, r4, #0
	mov r1, #0
	add r6, r3, #0
	bl BufferWiFiPlazaActivityName
	ldr r0, _0222E398 ; =gGameLanguage
	mov r1, #1
	ldrb r0, [r0]
	str r1, [sp]
	mov r3, #0
	str r0, [sp, #4]
	ldr r2, [r5, #0x10]
	add r0, r4, #0
	bl BufferString
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r5, [r5, #8]
	mov r2, #8
	add r0, r4, #0
	mov r1, #2
	sub r2, r2, r5
	bl BufferIntegerAsString
	add r0, r6, #0
	mov r1, #9
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, [sp, #0x18]
	add r0, r4, #0
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222E398: .word gGameLanguage
	thumb_func_end ov45_0222E33C

	thumb_func_start ov45_0222E39C
ov45_0222E39C: ; 0x0222E39C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r1, [r6, #4]
	add r7, r2, #0
	mov r4, #0
	str r3, [sp, #8]
	cmp r1, #0
	bls _0222E3D4
	ldr r0, _0222E410 ; =gGameLanguage
	add r5, r6, #0
	ldrb r0, [r0]
	str r0, [sp, #0xc]
_0222E3B6:
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r1, r4, #0
	str r0, [sp, #4]
	ldr r2, [r5, #0x10]
	add r0, r7, #0
	mov r3, #0
	bl BufferString
	ldr r1, [r6, #4]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r1
	blo _0222E3B6
_0222E3D4:
	ldrb r0, [r6]
	cmp r0, #4
	bne _0222E3E4
	add r0, r7, #0
	mov r2, #5
	bl BufferWiFiPlazaActivityName
	b _0222E3EC
_0222E3E4:
	add r0, r7, #0
	mov r2, #6
	bl BufferWiFiPlazaActivityName
_0222E3EC:
	ldr r2, [r6, #4]
	mov r1, #0xe
	ldr r0, [sp, #8]
	sub r1, r1, r2
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, [sp, #0x28]
	add r0, r7, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222E410: .word gGameLanguage
	thumb_func_end ov45_0222E39C

	thumb_func_start ov45_0222E414
ov45_0222E414: ; 0x0222E414
	push {r3, r4, r5, lr}
	ldr r0, [r0, #8]
	add r4, r2, #0
	add r5, r3, #0
	cmp r0, #4
	bhi _0222E464
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222E42C: ; jump table
	.short _0222E436 - _0222E42C - 2 ; case 0
	.short _0222E444 - _0222E42C - 2 ; case 1
	.short _0222E452 - _0222E42C - 2 ; case 2
	.short _0222E464 - _0222E42C - 2 ; case 3
	.short _0222E460 - _0222E42C - 2 ; case 4
_0222E436:
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl BufferWiFiPlazaEventName
	mov r1, #0xf
	b _0222E468
_0222E444:
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl BufferWiFiPlazaEventName
	mov r1, #0x14
	b _0222E468
_0222E452:
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl BufferWiFiPlazaEventName
	mov r1, #0x10
	b _0222E468
_0222E460:
	mov r1, #0x11
	b _0222E468
_0222E464:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222E468:
	add r0, r5, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, [sp, #0x10]
	add r0, r4, #0
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222E414

	thumb_func_start ov45_0222E484
ov45_0222E484: ; 0x0222E484
	push {r3, lr}
	ldr r0, [r0, #4]
	cmp r0, #0x14
	blo _0222E490
	mov r0, #0
	pop {r3, pc}
_0222E490:
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0222E49A
	mov r0, #0
	pop {r3, pc}
_0222E49A:
	ldr r2, [sp, #8]
	add r0, r3, #0
	mov r1, #0x15
	bl ReadMsgDataIntoString
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov45_0222E484

	thumb_func_start ov45_0222E4A8
ov45_0222E4A8: ; 0x0222E4A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r0, [r6, #4]
	ldr r1, [r6, #8]
	add r7, r2, #0
	str r3, [sp, #8]
	bl ov45_0222E5B4
	cmp r0, #0
	bne _0222E4C4
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222E4C4:
	ldr r2, [r6, #4]
	add r0, r7, #0
	mov r1, #0
	bl BufferWiFiPlazaActivityName
	ldr r1, [r6, #8]
	mov r4, #0
	cmp r1, #0
	bls _0222E4FC
	ldr r0, _0222E534 ; =gGameLanguage
	add r5, r6, #0
	ldrb r0, [r0]
	str r0, [sp, #0xc]
_0222E4DE:
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r1, r4, #1
	str r0, [sp, #4]
	ldr r2, [r5, #0x10]
	add r0, r7, #0
	mov r3, #0
	bl BufferString
	ldr r1, [r6, #8]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r1
	blo _0222E4DE
_0222E4FC:
	ldr r0, [r6, #4]
	cmp r0, #1
	bhi _0222E510
	lsl r2, r1, #1
	ldr r1, _0222E538 ; =ov45_02254BCA
	ldr r0, [sp, #8]
	ldrh r1, [r1, r2]
	bl NewString_ReadMsgData
	b _0222E51C
_0222E510:
	lsl r2, r1, #1
	ldr r1, _0222E53C ; =ov45_02254BD2
	ldr r0, [sp, #8]
	ldrh r1, [r1, r2]
	bl NewString_ReadMsgData
_0222E51C:
	add r4, r0, #0
	ldr r1, [sp, #0x28]
	add r0, r7, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222E534: .word gGameLanguage
_0222E538: .word ov45_02254BCA
_0222E53C: .word ov45_02254BD2
	thumb_func_end ov45_0222E4A8

	thumb_func_start ov45_0222E540
ov45_0222E540: ; 0x0222E540
	cmp r1, #2
	blo _0222E548
	mov r0, #0x14
	bx lr
_0222E548:
	lsl r1, r1, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x20]
	bx lr
	thumb_func_end ov45_0222E540

	thumb_func_start ov45_0222E550
ov45_0222E550: ; 0x0222E550
	cmp r1, #2
	blo _0222E558
	mov r0, #0x14
	bx lr
_0222E558:
	lsl r1, r1, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x20]
	bx lr
	thumb_func_end ov45_0222E550

	thumb_func_start ov45_0222E560
ov45_0222E560: ; 0x0222E560
	ldr r2, [r0, #8]
	cmp r2, r1
	bhi _0222E56A
	mov r0, #0x14
	bx lr
_0222E56A:
	lsl r1, r1, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x20]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222E560

	thumb_func_start ov45_0222E574
ov45_0222E574: ; 0x0222E574
	cmp r1, #1
	blo _0222E57C
	mov r0, #0x14
	bx lr
_0222E57C:
	lsl r1, r1, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x20]
	bx lr
	thumb_func_end ov45_0222E574

	thumb_func_start ov45_0222E584
ov45_0222E584: ; 0x0222E584
	ldr r2, [r0, #4]
	cmp r2, r1
	bhi _0222E58E
	mov r0, #0x14
	bx lr
_0222E58E:
	lsl r1, r1, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x20]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222E584

	thumb_func_start ov45_0222E598
ov45_0222E598: ; 0x0222E598
	mov r0, #0x14
	bx lr
	thumb_func_end ov45_0222E598

	thumb_func_start ov45_0222E59C
ov45_0222E59C: ; 0x0222E59C
	mov r0, #0x14
	bx lr
	thumb_func_end ov45_0222E59C

	thumb_func_start ov45_0222E5A0
ov45_0222E5A0: ; 0x0222E5A0
	ldr r2, [r0, #8]
	cmp r2, r1
	bhi _0222E5AA
	mov r0, #0x14
	bx lr
_0222E5AA:
	lsl r1, r1, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x20]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222E5A0

	thumb_func_start ov45_0222E5B4
ov45_0222E5B4: ; 0x0222E5B4
	cmp r0, #1
	bhi _0222E5C4
	cmp r1, #1
	blo _0222E5C0
	cmp r1, #4
	bls _0222E5D0
_0222E5C0:
	mov r0, #0
	bx lr
_0222E5C4:
	cmp r1, #2
	blo _0222E5CC
	cmp r1, #4
	bls _0222E5D0
_0222E5CC:
	mov r0, #0
	bx lr
_0222E5D0:
	mov r0, #1
	bx lr
	thumb_func_end ov45_0222E5B4

	thumb_func_start ov45_0222E5D4
ov45_0222E5D4: ; 0x0222E5D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0222E67C ; =_022577C0
	add r6, r1, #0
	ldr r0, [r0]
	add r7, r2, #0
	add r4, r3, #0
	cmp r0, #0
	beq _0222E5EA
	bl GF_AssertFail
_0222E5EA:
	mov r0, #0x4b
	lsl r0, r0, #2
	cmp r7, r0
	blo _0222E5F6
	bl GF_AssertFail
_0222E5F6:
	ldr r1, _0222E680 ; =0x00000988
	add r0, r5, #0
	bl AllocFromHeap
	ldr r1, _0222E67C ; =_022577C0
	ldr r2, _0222E680 ; =0x00000988
	str r0, [r1]
	mov r1, #0
	bl memset
	ldr r0, _0222E67C ; =_022577C0
	ldr r0, [r0]
	str r6, [r0]
	add r0, r6, #0
	bl sub_0202C6F4
	ldr r1, _0222E67C ; =_022577C0
	ldr r1, [r1]
	str r0, [r1, #4]
	add r0, r6, #0
	bl sub_0202CA44
	ldr r6, _0222E67C ; =_022577C0
	ldr r1, [r6]
	str r0, [r1, #8]
	ldr r3, [r6]
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	add r2, #0xc
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	add r1, r7, #0
	str r0, [r2]
	ldr r0, [sp, #0x18]
	add r2, r5, #0
	str r0, [r3, #0x20]
	ldr r0, [r6]
	bl ov45_0222F848
	add r0, r6, #0
	ldr r0, [r0]
	mov r1, #0x14
	mov r2, #8
	add r3, r5, #0
	bl ov45_0222F9B8
	add r0, r6, #0
	ldr r0, [r0]
	bl ov45_02230144
	add r0, r6, #0
	ldr r1, [r0]
	mov r0, #0x6a
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0x80
	add r2, r5, #0
	bl ov45_022303E4
	add r0, r6, #0
	ldr r1, [r0]
	ldr r0, _0222E684 ; =0x00000984
	mov r2, #0
	str r2, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222E67C: .word _022577C0
_0222E680: .word 0x00000988
_0222E684: .word 0x00000984
	thumb_func_end ov45_0222E5D4

	thumb_func_start ov45_0222E688
ov45_0222E688: ; 0x0222E688
	push {r3, lr}
	ldr r0, _0222E6C4 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E696
	bl GF_AssertFail
_0222E696:
	ldr r0, _0222E6C4 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x6a
	lsl r0, r0, #4
	add r0, r1, r0
	bl ov45_022303FC
	ldr r0, _0222E6C4 ; =_022577C0
	ldr r0, [r0]
	bl ov45_0222FA10
	ldr r0, _0222E6C4 ; =_022577C0
	ldr r0, [r0]
	bl ov45_0222F878
	ldr r0, _0222E6C4 ; =_022577C0
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _0222E6C4 ; =_022577C0
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_0222E6C4: .word _022577C0
	thumb_func_end ov45_0222E688

	thumb_func_start ov45_0222E6C8
ov45_0222E6C8: ; 0x0222E6C8
	push {r3, lr}
	ldr r0, _0222E7C4 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E6D6
	mov r0, #0
	pop {r3, pc}
_0222E6D6:
	bl ov45_02231514
	cmp r0, #0xa
	bhi _0222E744
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222E6EA: ; jump table
	.short _0222E700 - _0222E6EA - 2 ; case 0
	.short _0222E70E - _0222E6EA - 2 ; case 1
	.short _0222E70E - _0222E6EA - 2 ; case 2
	.short _0222E70E - _0222E6EA - 2 ; case 3
	.short _0222E70E - _0222E6EA - 2 ; case 4
	.short _0222E70E - _0222E6EA - 2 ; case 5
	.short _0222E70E - _0222E6EA - 2 ; case 6
	.short _0222E70E - _0222E6EA - 2 ; case 7
	.short _0222E71C - _0222E6EA - 2 ; case 8
	.short _0222E72A - _0222E6EA - 2 ; case 9
	.short _0222E738 - _0222E6EA - 2 ; case 10
_0222E700:
	ldr r0, _0222E7C4 ; =_022577C0
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x4b
	lsl r0, r0, #2
	strb r2, [r1, r0]
	b _0222E744
_0222E70E:
	ldr r0, _0222E7C4 ; =_022577C0
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0x4b
	lsl r0, r0, #2
	strb r2, [r1, r0]
	b _0222E744
_0222E71C:
	ldr r0, _0222E7C4 ; =_022577C0
	mov r2, #2
	ldr r1, [r0]
	mov r0, #0x4b
	lsl r0, r0, #2
	strb r2, [r1, r0]
	b _0222E744
_0222E72A:
	ldr r0, _0222E7C4 ; =_022577C0
	mov r2, #3
	ldr r1, [r0]
	mov r0, #0x4b
	lsl r0, r0, #2
	strb r2, [r1, r0]
	b _0222E744
_0222E738:
	ldr r0, _0222E7C4 ; =_022577C0
	mov r2, #4
	ldr r1, [r0]
	mov r0, #0x4b
	lsl r0, r0, #2
	strb r2, [r1, r0]
_0222E744:
	ldr r0, _0222E7C4 ; =_022577C0
	mov r1, #0x4b
	ldr r0, [r0]
	lsl r1, r1, #2
	ldrb r1, [r0, r1]
	cmp r1, #2
	bne _0222E7BC
	bl ov45_022302E4
	ldr r0, _0222E7C4 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x67
	lsl r0, r0, #2
	add r0, r1, r0
	bl ov45_022320C4
	bl ov45_022321E0
	cmp r0, #3
	bhi _0222E7BC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222E778: ; jump table
	.short _0222E780 - _0222E778 - 2 ; case 0
	.short _0222E794 - _0222E778 - 2 ; case 1
	.short _0222E7A0 - _0222E778 - 2 ; case 2
	.short _0222E7B2 - _0222E778 - 2 ; case 3
_0222E780:
	ldr r1, _0222E7C4 ; =_022577C0
	ldr r0, _0222E7C8 ; =0x0000012E
	ldr r2, [r1]
	mov r3, #0
	strb r3, [r2, r0]
	ldr r1, [r1]
	mov r2, #4
	sub r0, r0, #1
	strb r2, [r1, r0]
	b _0222E7BC
_0222E794:
	ldr r0, _0222E7C4 ; =_022577C0
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _0222E7C8 ; =0x0000012E
	strb r2, [r1, r0]
	b _0222E7BC
_0222E7A0:
	ldr r0, _0222E7C4 ; =_022577C0
	ldr r2, [r0]
	ldr r0, _0222E7C8 ; =0x0000012E
	ldrb r1, [r2, r0]
	cmp r1, #3
	beq _0222E7BC
	mov r1, #2
	strb r1, [r2, r0]
	b _0222E7BC
_0222E7B2:
	ldr r0, _0222E7C4 ; =_022577C0
	mov r2, #4
	ldr r1, [r0]
	ldr r0, _0222E7C8 ; =0x0000012E
	strb r2, [r1, r0]
_0222E7BC:
	bl ov45_0222E96C
	pop {r3, pc}
	nop
_0222E7C4: .word _022577C0
_0222E7C8: .word 0x0000012E
	thumb_func_end ov45_0222E6C8

	thumb_func_start ov45_0222E7CC
ov45_0222E7CC: ; 0x0222E7CC
	push {r3, lr}
	ldr r0, _0222E7F4 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E7DA
	bl GF_AssertFail
_0222E7DA:
	ldr r0, _0222E7F4 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222E7F8 ; =0x00000984
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0222E7EC
	bl ov45_02233220
	pop {r3, pc}
_0222E7EC:
	bl ov45_022331E8
	pop {r3, pc}
	nop
_0222E7F4: .word _022577C0
_0222E7F8: .word 0x00000984
	thumb_func_end ov45_0222E7CC

	thumb_func_start ov45_0222E7FC
ov45_0222E7FC: ; 0x0222E7FC
	ldr r3, _0222E800 ; =ov45_02233204
	bx r3
	.balign 4, 0
_0222E800: .word ov45_02233204
	thumb_func_end ov45_0222E7FC

	thumb_func_start ov45_0222E804
ov45_0222E804: ; 0x0222E804
	ldr r3, _0222E80C ; =ov45_0222E810
	mov r1, #0
	bx r3
	nop
_0222E80C: .word ov45_0222E810
	thumb_func_end ov45_0222E804

	thumb_func_start ov45_0222E810
ov45_0222E810: ; 0x0222E810
	push {r3, r4, r5, lr}
	sub sp, #0x50
	add r5, r0, #0
	ldr r0, _0222E8A0 ; =_022577C0
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E824
	bl GF_AssertFail
_0222E824:
	ldr r0, _0222E8A4 ; =ov45_0222FC44
	str r0, [sp, #0xc]
	ldr r0, _0222E8A8 ; =ov45_0222FCE0
	str r0, [sp, #0x10]
	ldr r0, _0222E8AC ; =ov45_0222FD50
	str r0, [sp, #0x14]
	ldr r0, _0222E8B0 ; =ov45_0222FDD4
	str r0, [sp, #0x18]
	ldr r0, _0222E8B4 ; =ov45_0222FDD8
	str r0, [sp, #0x1c]
	ldr r0, _0222E8B8 ; =ov45_0222FE84
	str r0, [sp, #0x20]
	ldr r0, _0222E8BC ; =ov45_0222FEC4
	str r0, [sp, #0x24]
	ldr r0, _0222E8C0 ; =ov45_0222FF40
	str r0, [sp, #0x28]
	ldr r0, _0222E8C4 ; =ov45_0222FF7C
	str r0, [sp, #0x2c]
	ldr r0, _0222E8C8 ; =ov45_02230008
	str r0, [sp, #0x30]
	ldr r0, _0222E8CC ; =ov45_02230050
	str r0, [sp, #0x34]
	ldr r0, _0222E8D0 ; =ov45_02230064
	str r0, [sp, #0x38]
	ldr r0, _0222E8D4 ; =ov45_02230090
	str r0, [sp, #0x3c]
	ldr r0, _0222E8D8 ; =ov45_022300B0
	str r0, [sp, #0x40]
	ldr r0, _0222E8DC ; =ov45_022300DC
	str r0, [sp, #0x44]
	ldr r0, _0222E8E0 ; =ov45_02230108
	str r0, [sp, #0x48]
	ldr r0, _0222E8E4 ; =ov45_02230130
	str r0, [sp, #0x4c]
	ldr r0, _0222E8A0 ; =_022577C0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl sub_0202C08C
	str r0, [sp]
	ldr r0, _0222E8A0 ; =_022577C0
	str r5, [sp, #4]
	ldr r0, [r0]
	ldr r1, _0222E8E8 ; =ov45_02254F14
	ldr r0, [r0, #0x28]
	add r2, r4, #0
	str r0, [sp, #8]
	ldr r0, _0222E8EC ; =ov45_02254F04
	add r3, sp, #0xc
	bl ov45_022310C0
	ldr r2, _0222E8A0 ; =_022577C0
	ldr r1, _0222E8F0 ; =0x00000984
	ldr r3, [r2]
	str r0, [r3, r1]
	ldr r0, [r2]
	ldr r0, [r0, r1]
	bl ov45_0222F74C
	add sp, #0x50
	pop {r3, r4, r5, pc}
	nop
_0222E8A0: .word _022577C0
_0222E8A4: .word ov45_0222FC44
_0222E8A8: .word ov45_0222FCE0
_0222E8AC: .word ov45_0222FD50
_0222E8B0: .word ov45_0222FDD4
_0222E8B4: .word ov45_0222FDD8
_0222E8B8: .word ov45_0222FE84
_0222E8BC: .word ov45_0222FEC4
_0222E8C0: .word ov45_0222FF40
_0222E8C4: .word ov45_0222FF7C
_0222E8C8: .word ov45_02230008
_0222E8CC: .word ov45_02230050
_0222E8D0: .word ov45_02230064
_0222E8D4: .word ov45_02230090
_0222E8D8: .word ov45_022300B0
_0222E8DC: .word ov45_022300DC
_0222E8E0: .word ov45_02230108
_0222E8E4: .word ov45_02230130
_0222E8E8: .word ov45_02254F14
_0222E8EC: .word ov45_02254F04
_0222E8F0: .word 0x00000984
	thumb_func_end ov45_0222E810

	thumb_func_start ov45_0222E8F4
ov45_0222E8F4: ; 0x0222E8F4
	push {r3, lr}
	ldr r0, _0222E918 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E902
	bl GF_AssertFail
_0222E902:
	ldr r0, _0222E918 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x4b
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _0222E914
	mov r0, #1
	pop {r3, pc}
_0222E914:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0222E918: .word _022577C0
	thumb_func_end ov45_0222E8F4

	thumb_func_start ov45_0222E91C
ov45_0222E91C: ; 0x0222E91C
	push {r3, lr}
	ldr r0, _0222E940 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E92A
	bl GF_AssertFail
_0222E92A:
	bl ov45_0222F78C
	bl ov45_02231490
	bl ov45_0222F74C
	cmp r0, #0
	bne _0222E93E
	bl GF_AssertFail
_0222E93E:
	pop {r3, pc}
	.balign 4, 0
_0222E940: .word _022577C0
	thumb_func_end ov45_0222E91C

	thumb_func_start ov45_0222E944
ov45_0222E944: ; 0x0222E944
	push {r3, lr}
	ldr r0, _0222E968 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E952
	bl GF_AssertFail
_0222E952:
	ldr r0, _0222E968 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x4b
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0222E964
	mov r0, #1
	pop {r3, pc}
_0222E964:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0222E968: .word _022577C0
	thumb_func_end ov45_0222E944

	thumb_func_start ov45_0222E96C
ov45_0222E96C: ; 0x0222E96C
	push {r3, lr}
	ldr r0, _0222E9B0 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E97A
	bl GF_AssertFail
_0222E97A:
	ldr r0, _0222E9B0 ; =_022577C0
	ldr r1, _0222E9B4 ; =0x0000012D
	ldr r0, [r0]
	ldrb r2, [r0, r1]
	cmp r2, #4
	beq _0222E992
	add r1, r1, #1
	ldrb r1, [r0, r1]
	cmp r1, #4
	bne _0222E992
	mov r0, #4
	pop {r3, pc}
_0222E992:
	ldr r2, _0222E9B8 ; =0x00000133
	ldrb r1, [r0, r2]
	cmp r1, #0
	beq _0222E99E
	mov r0, #4
	pop {r3, pc}
_0222E99E:
	sub r1, r2, #1
	ldrb r1, [r0, r1]
	cmp r1, #0
	beq _0222E9AA
	mov r0, #4
	pop {r3, pc}
_0222E9AA:
	sub r1, r2, #7
	ldrb r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0222E9B0: .word _022577C0
_0222E9B4: .word 0x0000012D
_0222E9B8: .word 0x00000133
	thumb_func_end ov45_0222E96C

	thumb_func_start ov45_0222E9BC
ov45_0222E9BC: ; 0x0222E9BC
	push {r3, lr}
	ldr r0, _0222E9D8 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E9CA
	bl GF_AssertFail
_0222E9CA:
	ldr r0, _0222E9D8 ; =_022577C0
	ldr r1, _0222E9DC ; =0x00000131
	ldr r3, [r0]
	mov r2, #0
	ldrb r0, [r3, r1]
	strb r2, [r3, r1]
	pop {r3, pc}
	.balign 4, 0
_0222E9D8: .word _022577C0
_0222E9DC: .word 0x00000131
	thumb_func_end ov45_0222E9BC

	thumb_func_start ov45_0222E9E0
ov45_0222E9E0: ; 0x0222E9E0
	push {r3, lr}
	ldr r0, _0222E9F4 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E9EE
	bl GF_AssertFail
_0222E9EE:
	bl ov45_02232580
	pop {r3, pc}
	.balign 4, 0
_0222E9F4: .word _022577C0
	thumb_func_end ov45_0222E9E0

	thumb_func_start ov45_0222E9F8
ov45_0222E9F8: ; 0x0222E9F8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222EA28 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EA08
	bl GF_AssertFail
_0222EA08:
	bl ov45_02232580
	add r1, r0, #0
	ldr r0, _0222EA28 ; =_022577C0
	add r2, r4, #0
	ldr r0, [r0]
	bl ov45_0222F88C
	ldr r1, _0222EA28 ; =_022577C0
	add r0, r4, #0
	ldr r1, [r1]
	mov r2, #0
	ldr r1, [r1, #0x28]
	bl ov45_022325B0
	pop {r4, pc}
	.balign 4, 0
_0222EA28: .word _022577C0
	thumb_func_end ov45_0222E9F8

	thumb_func_start ov45_0222EA2C
ov45_0222EA2C: ; 0x0222EA2C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222EA48 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EA3C
	bl GF_AssertFail
_0222EA3C:
	ldr r0, _0222EA48 ; =_022577C0
	add r1, r4, #0
	ldr r0, [r0]
	bl ov45_0222F8D8
	pop {r4, pc}
	.balign 4, 0
_0222EA48: .word _022577C0
	thumb_func_end ov45_0222EA2C

	thumb_func_start ov45_0222EA4C
ov45_0222EA4C: ; 0x0222EA4C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0222EA74 ; =_022577C0
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EA5E
	bl GF_AssertFail
_0222EA5E:
	ldr r0, _0222EA74 ; =_022577C0
	add r1, r5, #0
	ldr r0, [r0]
	bl ov45_0222F954
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [r4]
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
	nop
_0222EA74: .word _022577C0
	thumb_func_end ov45_0222EA4C

	thumb_func_start ov45_0222EA78
ov45_0222EA78: ; 0x0222EA78
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r0, #0
	mvn r0, r0
	str r0, [sp]
	lsr r6, r0, #4
	add r5, r0, #0
	ldr r0, _0222EAD0 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EA92
	bl GF_AssertFail
_0222EA92:
	mov r4, #0
_0222EA94:
	ldr r0, _0222EAD0 ; =_022577C0
	add r1, r4, #0
	ldr r0, [r0]
	mov r2, #0
	bl ov45_0222FB5C
	mov r1, #0
	add r7, r0, #0
	mvn r1, r1
	cmp r7, r1
	beq _0222EAC4
	add r1, sp, #4
	bl ov45_0222EA4C
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	sub r0, r2, r5
	mov ip, r1
	mov r0, ip
	sbc r0, r6
	bge _0222EAC4
	add r5, r2, #0
	add r6, r1, #0
	str r7, [sp]
_0222EAC4:
	add r4, r4, #1
	cmp r4, #0x14
	blt _0222EA94
	ldr r0, [sp]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222EAD0: .word _022577C0
	thumb_func_end ov45_0222EA78

	thumb_func_start ov45_0222EAD4
ov45_0222EAD4: ; 0x0222EAD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #4]
	lsr r7, r0, #4
	add r6, r0, #0
	ldr r0, _0222EB34 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EAF0
	bl GF_AssertFail
_0222EAF0:
	mov r4, #0
_0222EAF2:
	ldr r0, _0222EB34 ; =_022577C0
	add r1, r4, #0
	ldr r0, [r0]
	mov r2, #0
	bl ov45_0222FB5C
	mov r1, #0
	add r5, r0, #0
	mvn r1, r1
	cmp r5, r1
	beq _0222EB28
	ldr r1, [sp]
	cmp r5, r1
	beq _0222EB28
	add r1, sp, #8
	bl ov45_0222EA4C
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	sub r0, r2, r6
	mov ip, r1
	mov r0, ip
	sbc r0, r7
	bge _0222EB28
	add r6, r2, #0
	add r7, r1, #0
	str r5, [sp, #4]
_0222EB28:
	add r4, r4, #1
	cmp r4, #0x14
	blt _0222EAF2
	ldr r0, [sp, #4]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222EB34: .word _022577C0
	thumb_func_end ov45_0222EAD4

	thumb_func_start ov45_0222EB38
ov45_0222EB38: ; 0x0222EB38
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222EB6C ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EB48
	bl GF_AssertFail
_0222EB48:
	add r0, r4, #0
	bl ov45_0222F7B0
	bl ov45_02231C8C
	bl ov45_0222F74C
	cmp r0, #1
	bne _0222EB6A
	ldr r2, _0222EB6C ; =_022577C0
	ldr r1, _0222EB70 ; =0x0000012D
	ldr r3, [r2]
	strb r4, [r3, r1]
	ldr r2, [r2]
	mov r3, #0
	add r1, r1, #2
	strb r3, [r2, r1]
_0222EB6A:
	pop {r4, pc}
	.balign 4, 0
_0222EB6C: .word _022577C0
_0222EB70: .word 0x0000012D
	thumb_func_end ov45_0222EB38

	thumb_func_start ov45_0222EB74
ov45_0222EB74: ; 0x0222EB74
	push {r3, lr}
	ldr r0, _0222EB8C ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EB82
	bl GF_AssertFail
_0222EB82:
	ldr r0, _0222EB8C ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222EB90 ; =0x0000012F
	ldrb r0, [r1, r0]
	pop {r3, pc}
	.balign 4, 0
_0222EB8C: .word _022577C0
_0222EB90: .word 0x0000012F
	thumb_func_end ov45_0222EB74

	thumb_func_start ov45_0222EB94
ov45_0222EB94: ; 0x0222EB94
	push {r3, lr}
	ldr r0, _0222EBBC ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EBA2
	bl GF_AssertFail
_0222EBA2:
	bl ov45_02231EC0
	bl ov45_0222F74C
	cmp r0, #1
	bne _0222EBB8
	ldr r1, _0222EBBC ; =_022577C0
	mov r3, #3
	ldr r2, [r1]
	ldr r1, _0222EBC0 ; =0x0000012E
	strb r3, [r2, r1]
_0222EBB8:
	pop {r3, pc}
	nop
_0222EBBC: .word _022577C0
_0222EBC0: .word 0x0000012E
	thumb_func_end ov45_0222EB94

	thumb_func_start ov45_0222EBC4
ov45_0222EBC4: ; 0x0222EBC4
	push {r3, lr}
	ldr r0, _0222EBE8 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EBD2
	bl GF_AssertFail
_0222EBD2:
	ldr r0, _0222EBE8 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222EBEC ; =0x0000012E
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0222EBE2
	mov r0, #1
	pop {r3, pc}
_0222EBE2:
	mov r0, #0
	pop {r3, pc}
	nop
_0222EBE8: .word _022577C0
_0222EBEC: .word 0x0000012E
	thumb_func_end ov45_0222EBC4

	thumb_func_start ov45_0222EBF0
ov45_0222EBF0: ; 0x0222EBF0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222EC0C ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EC00
	bl GF_AssertFail
_0222EC00:
	ldr r0, _0222EC0C ; =_022577C0
	add r1, r4, #0
	ldr r0, [r0]
	bl ov45_0222FBD8
	pop {r4, pc}
	.balign 4, 0
_0222EC0C: .word _022577C0
	thumb_func_end ov45_0222EBF0

	thumb_func_start ov45_0222EC10
ov45_0222EC10: ; 0x0222EC10
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222EC38 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EC20
	bl GF_AssertFail
_0222EC20:
	ldr r1, _0222EC38 ; =_022577C0
	mov r0, #0x47
	ldr r2, [r1]
	lsl r0, r0, #2
	ldrsh r2, [r2, r0]
	add r0, r0, #4
	str r2, [r4]
	ldr r1, [r1]
	ldr r0, [r1, r0]
	str r0, [r4, #4]
	pop {r4, pc}
	nop
_0222EC38: .word _022577C0
	thumb_func_end ov45_0222EC10

	thumb_func_start ov45_0222EC3C
ov45_0222EC3C: ; 0x0222EC3C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222EC64 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EC4C
	bl GF_AssertFail
_0222EC4C:
	ldr r1, _0222EC64 ; =_022577C0
	mov r0, #0x49
	ldr r2, [r1]
	lsl r0, r0, #2
	ldrsh r2, [r2, r0]
	add r0, r0, #4
	str r2, [r4]
	ldr r1, [r1]
	ldr r0, [r1, r0]
	str r0, [r4, #4]
	pop {r4, pc}
	nop
_0222EC64: .word _022577C0
	thumb_func_end ov45_0222EC3C

	thumb_func_start ov45_0222EC68
ov45_0222EC68: ; 0x0222EC68
	add r1, r0, #0
	ldr r0, _0222EC74 ; =_022577C0
	ldr r3, _0222EC78 ; =ov45_0222FB24
	ldr r0, [r0]
	mov r2, #0
	bx r3
	.balign 4, 0
_0222EC74: .word _022577C0
_0222EC78: .word ov45_0222FB24
	thumb_func_end ov45_0222EC68

	thumb_func_start ov45_0222EC7C
ov45_0222EC7C: ; 0x0222EC7C
	add r1, r0, #0
	ldr r0, _0222EC88 ; =_022577C0
	ldr r3, _0222EC8C ; =ov45_0222FB24
	ldr r0, [r0]
	mov r2, #1
	bx r3
	.balign 4, 0
_0222EC88: .word _022577C0
_0222EC8C: .word ov45_0222FB24
	thumb_func_end ov45_0222EC7C

	thumb_func_start ov45_0222EC90
ov45_0222EC90: ; 0x0222EC90
	add r1, r0, #0
	ldr r0, _0222EC9C ; =_022577C0
	ldr r3, _0222ECA0 ; =ov45_0222FB5C
	ldr r0, [r0]
	mov r2, #0
	bx r3
	.balign 4, 0
_0222EC9C: .word _022577C0
_0222ECA0: .word ov45_0222FB5C
	thumb_func_end ov45_0222EC90

	thumb_func_start ov45_0222ECA4
ov45_0222ECA4: ; 0x0222ECA4
	add r1, r0, #0
	ldr r0, _0222ECB0 ; =_022577C0
	ldr r3, _0222ECB4 ; =ov45_0222FB5C
	ldr r0, [r0]
	mov r2, #1
	bx r3
	.balign 4, 0
_0222ECB0: .word _022577C0
_0222ECB4: .word ov45_0222FB5C
	thumb_func_end ov45_0222ECA4

	thumb_func_start ov45_0222ECB8
ov45_0222ECB8: ; 0x0222ECB8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222ECD8 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222ECC8
	bl GF_AssertFail
_0222ECC8:
	ldr r0, _0222ECD8 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x67
	lsl r0, r0, #2
	add r0, r1, r0
	ldmia r0!, {r2, r3}
	stmia r4!, {r2, r3}
	pop {r4, pc}
	.balign 4, 0
_0222ECD8: .word _022577C0
	thumb_func_end ov45_0222ECB8

	thumb_func_start ov45_0222ECDC
ov45_0222ECDC: ; 0x0222ECDC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0222ED78 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222ECEC
	bl GF_AssertFail
_0222ECEC:
	ldr r1, _0222ED78 ; =_022577C0
	mov r0, #1
	ldr r2, [r1]
	mov r1, #0x4b
	lsl r1, r1, #2
	ldrb r1, [r2, r1]
	cmp r1, #2
	beq _0222ED02
	cmp r1, #4
	beq _0222ED02
	mov r0, #0
_0222ED02:
	cmp r0, #0
	bne _0222ED0A
	bl GF_AssertFail
_0222ED0A:
	cmp r5, #8
	blt _0222ED12
	bl GF_AssertFail
_0222ED12:
	ldr r0, _0222ED78 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x6d
	lsl r0, r0, #2
	add r0, r1, r0
	cmp r5, #7
	bhi _0222ED74
	add r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0222ED2C: ; jump table
	.short _0222ED3C - _0222ED2C - 2 ; case 0
	.short _0222ED40 - _0222ED2C - 2 ; case 1
	.short _0222ED44 - _0222ED2C - 2 ; case 2
	.short _0222ED48 - _0222ED2C - 2 ; case 3
	.short _0222ED4C - _0222ED2C - 2 ; case 4
	.short _0222ED58 - _0222ED2C - 2 ; case 5
	.short _0222ED62 - _0222ED2C - 2 ; case 6
	.short _0222ED6C - _0222ED2C - 2 ; case 7
_0222ED3C:
	ldr r4, [r0]
	b _0222ED74
_0222ED40:
	ldr r4, [r0, #4]
	b _0222ED74
_0222ED44:
	ldrb r4, [r0, #0xc]
	b _0222ED74
_0222ED48:
	ldrb r4, [r0, #0xd]
	b _0222ED74
_0222ED4C:
	ldr r0, [r0, #8]
	mov r4, #1
	tst r0, r4
	bne _0222ED74
	mov r4, #0
	b _0222ED74
_0222ED58:
	mov r1, #0x13
	bl ov45_022303BC
	add r4, r0, #0
	b _0222ED74
_0222ED62:
	mov r1, #0x10
	bl ov45_022303BC
	add r4, r0, #0
	b _0222ED74
_0222ED6C:
	mov r1, #0x11
	bl ov45_022303BC
	add r4, r0, #0
_0222ED74:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222ED78: .word _022577C0
	thumb_func_end ov45_0222ECDC

	thumb_func_start ov45_0222ED7C
ov45_0222ED7C: ; 0x0222ED7C
	push {r3, lr}
	ldr r0, _0222EDA4 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222ED8A
	bl GF_AssertFail
_0222ED8A:
	ldr r0, _0222EDA4 ; =_022577C0
	ldr r0, [r0]
	bl ov45_0222F7B4
	cmp r0, #0
	beq _0222EDA2
	ldr r1, _0222EDA4 ; =_022577C0
	mov r3, #1
	ldr r2, [r1]
	mov r1, #0x13
	lsl r1, r1, #4
	strb r3, [r2, r1]
_0222EDA2:
	pop {r3, pc}
	.balign 4, 0
_0222EDA4: .word _022577C0
	thumb_func_end ov45_0222ED7C

	thumb_func_start ov45_0222EDA8
ov45_0222EDA8: ; 0x0222EDA8
	ldr r0, _0222EDC0 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x13
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0222EDBA
	mov r0, #1
	bx lr
_0222EDBA:
	mov r0, #0
	bx lr
	nop
_0222EDC0: .word _022577C0
	thumb_func_end ov45_0222EDA8

	thumb_func_start ov45_0222EDC4
ov45_0222EDC4: ; 0x0222EDC4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222EDEC ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EDD4
	bl GF_AssertFail
_0222EDD4:
	cmp r4, #0x14
	blo _0222EDDC
	bl GF_AssertFail
_0222EDDC:
	ldr r0, _0222EDEC ; =_022577C0
	ldr r1, [r0]
	lsl r0, r4, #2
	add r1, r1, r0
	mov r0, #0x4d
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	pop {r4, pc}
	.balign 4, 0
_0222EDEC: .word _022577C0
	thumb_func_end ov45_0222EDC4

	thumb_func_start ov45_0222EDF0
ov45_0222EDF0: ; 0x0222EDF0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222EE18 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EE00
	bl GF_AssertFail
_0222EE00:
	cmp r4, #0x14
	blo _0222EE08
	bl GF_AssertFail
_0222EE08:
	ldr r0, _0222EE18 ; =_022577C0
	ldr r1, [r0]
	lsl r0, r4, #2
	add r1, r1, r0
	ldr r0, _0222EE1C ; =0x00000136
	ldrb r0, [r1, r0]
	pop {r4, pc}
	nop
_0222EE18: .word _022577C0
_0222EE1C: .word 0x00000136
	thumb_func_end ov45_0222EDF0

	thumb_func_start ov45_0222EE20
ov45_0222EE20: ; 0x0222EE20
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0222EE4C ; =_022577C0
	add r4, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	cmp r0, #0
	bne _0222EE34
	bl GF_AssertFail
_0222EE34:
	ldr r2, _0222EE4C ; =_022577C0
	mov r1, #0x61
	ldr r0, [r2]
	lsl r1, r1, #2
	str r5, [r0, r1]
	ldr r3, [r2]
	add r0, r1, #4
	str r4, [r3, r0]
	ldr r0, [r2]
	add r1, #8
	str r6, [r0, r1]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222EE4C: .word _022577C0
	thumb_func_end ov45_0222EE20

	thumb_func_start ov45_0222EE50
ov45_0222EE50: ; 0x0222EE50
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0222EE7C ; =_022577C0
	add r4, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	cmp r0, #0
	bne _0222EE64
	bl GF_AssertFail
_0222EE64:
	ldr r2, _0222EE7C ; =_022577C0
	mov r1, #0x19
	ldr r0, [r2]
	lsl r1, r1, #4
	str r5, [r0, r1]
	ldr r3, [r2]
	add r0, r1, #4
	str r4, [r3, r0]
	ldr r0, [r2]
	add r1, #8
	str r6, [r0, r1]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222EE7C: .word _022577C0
	thumb_func_end ov45_0222EE50

	thumb_func_start ov45_0222EE80
ov45_0222EE80: ; 0x0222EE80
	push {r3, lr}
	ldr r0, _0222EEB4 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EE8E
	bl GF_AssertFail
_0222EE8E:
	ldr r0, _0222EEB4 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x61
	lsl r0, r0, #2
	add r1, r1, r0
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	strb r0, [r1, #4]
	strb r0, [r1, #5]
	strb r0, [r1, #6]
	strb r0, [r1, #7]
	strb r0, [r1, #8]
	strb r0, [r1, #9]
	strb r0, [r1, #0xa]
	strb r0, [r1, #0xb]
	pop {r3, pc}
	.balign 4, 0
_0222EEB4: .word _022577C0
	thumb_func_end ov45_0222EE80

	thumb_func_start ov45_0222EEB8
ov45_0222EEB8: ; 0x0222EEB8
	push {r3, lr}
	ldr r0, _0222EEEC ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EEC6
	bl GF_AssertFail
_0222EEC6:
	ldr r0, _0222EEEC ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x19
	lsl r0, r0, #4
	add r1, r1, r0
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	strb r0, [r1, #4]
	strb r0, [r1, #5]
	strb r0, [r1, #6]
	strb r0, [r1, #7]
	strb r0, [r1, #8]
	strb r0, [r1, #9]
	strb r0, [r1, #0xa]
	strb r0, [r1, #0xb]
	pop {r3, pc}
	.balign 4, 0
_0222EEEC: .word _022577C0
	thumb_func_end ov45_0222EEB8

	thumb_func_start ov45_0222EEF0
ov45_0222EEF0: ; 0x0222EEF0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0222EF48 ; =_022577C0
	add r6, r1, #0
	ldr r0, [r0]
	add r4, r2, #0
	cmp r0, #0
	bne _0222EF04
	bl GF_AssertFail
_0222EF04:
	ldr r0, _0222EF48 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, r5
	bhi _0222EF16
	bl GF_AssertFail
_0222EF16:
	ldr r0, _0222EF48 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	lsl r0, r5, #3
	add r0, r1, r0
	ldr r0, [r0, #4]
	cmp r4, r0
	beq _0222EF2E
	bl GF_AssertFail
_0222EF2E:
	mov r0, #0
	add r1, r5, #0
	add r2, r6, #0
	add r3, r4, #0
	bl ov45_0223247C
	bl ov45_0222F74C
	cmp r0, #1
	beq _0222EF46
	bl GF_AssertFail
_0222EF46:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222EF48: .word _022577C0
	thumb_func_end ov45_0222EEF0

	thumb_func_start ov45_0222EF4C
ov45_0222EF4C: ; 0x0222EF4C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0222EFA8 ; =_022577C0
	add r6, r1, #0
	ldr r0, [r0]
	add r7, r2, #0
	add r4, r3, #0
	cmp r0, #0
	bne _0222EF62
	bl GF_AssertFail
_0222EF62:
	ldr r0, _0222EFA8 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, r5
	bhi _0222EF74
	bl GF_AssertFail
_0222EF74:
	ldr r0, _0222EFA8 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	lsl r0, r5, #3
	add r0, r1, r0
	ldr r0, [r0, #4]
	cmp r4, r0
	beq _0222EF8C
	bl GF_AssertFail
_0222EF8C:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	add r3, r4, #0
	bl ov45_02232500
	bl ov45_0222F74C
	cmp r0, #1
	beq _0222EFA4
	bl GF_AssertFail
_0222EFA4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EFA8: .word _022577C0
	thumb_func_end ov45_0222EF4C

	thumb_func_start ov45_0222EFAC
ov45_0222EFAC: ; 0x0222EFAC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0222F020 ; =_022577C0
	add r6, r1, #0
	ldr r0, [r0]
	add r4, r2, #0
	cmp r0, #0
	bne _0222EFC0
	bl GF_AssertFail
_0222EFC0:
	ldr r0, _0222F020 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, r5
	bhi _0222EFD2
	bl GF_AssertFail
_0222EFD2:
	ldr r0, _0222F020 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r1, [r1, r0]
	lsl r0, r5, #3
	add r0, r1, r0
	ldr r0, [r0, #4]
	cmp r4, r0
	beq _0222EFEA
	bl GF_AssertFail
_0222EFEA:
	ldr r0, _0222F020 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222F024 ; =0x0000012D
	ldrb r0, [r1, r0]
	cmp r0, #4
	bne _0222EFFA
	bl GF_AssertFail
_0222EFFA:
	ldr r0, _0222F020 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222F024 ; =0x0000012D
	ldrb r0, [r1, r0]
	bl ov45_0222F7B0
	add r1, r5, #0
	add r2, r6, #0
	add r3, r4, #0
	bl ov45_0223247C
	bl ov45_0222F74C
	cmp r0, #1
	beq _0222F01C
	bl GF_AssertFail
_0222F01C:
	pop {r4, r5, r6, pc}
	nop
_0222F020: .word _022577C0
_0222F024: .word 0x0000012D
	thumb_func_end ov45_0222EFAC

	thumb_func_start ov45_0222F028
ov45_0222F028: ; 0x0222F028
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, _0222F138 ; =_022577C0
	add r6, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F03A
	bl GF_AssertFail
_0222F03A:
	ldr r0, _0222F138 ; =_022577C0
	add r1, r4, #0
	ldr r0, [r0]
	bl ov45_0223021C
	cmp r0, #1
	bne _0222F04C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F04C:
	ldr r2, _0222F138 ; =_022577C0
	ldr r1, _0222F13C ; =0x0000069C
	ldr r0, [r2]
	ldrh r3, [r0, r1]
	cmp r3, #3
	beq _0222F05C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F05C:
	mov r3, #0x4c
	add r5, r4, #0
	mul r5, r3
	add r3, r0, r5
	add r0, r1, #0
	sub r0, #0xe4
	str r4, [r3, r0]
	ldr r0, [r2]
	mov r7, #1
	add r3, r0, r5
	add r0, r1, #0
	sub r0, #0xe0
	str r6, [r3, r0]
	ldr r0, [r2]
	add r3, r0, r5
	add r0, r1, #0
	sub r0, #0xdc
	str r7, [r3, r0]
	ldr r0, [r2]
	mov r7, #0
	add r3, r0, r5
	add r0, r1, #0
	sub r0, #0xd8
	str r7, [r3, r0]
	ldr r2, [r2]
	sub r1, #0xe4
	add r0, r2, r1
	mov r1, #0x67
	lsl r1, r1, #2
	add r0, r0, r5
	add r1, r2, r1
	bl ov45_02230378
	ldr r0, _0222F138 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222F140 ; =0x000005B8
	add r0, r1, r0
	add r0, r0, r5
	bl ov45_0223285C
	bl ov45_0222F74C
	cmp r0, #0
	bne _0222F0B8
	bl GF_AssertFail
_0222F0B8:
	ldr r1, _0222F138 ; =_022577C0
	mov r0, #0x4c
	add r5, r4, #0
	mul r5, r0
	ldr r1, [r1]
	mov r0, #1
	add r2, r1, r5
	ldr r1, _0222F144 ; =0x000005FC
	strh r0, [r2, r1]
	bl ov45_02232580
	ldr r1, _0222F138 ; =_022577C0
	mov r7, #6
	ldr r2, [r1]
	lsl r7, r7, #8
	add r2, r2, r5
	str r0, [r2, r7]
	ldr r2, [r1]
	ldr r0, _0222F148 ; =0x00000708
	add r3, r2, r5
	sub r2, r7, #2
	strh r0, [r3, r2]
	add r2, r0, #0
	ldr r3, [r1]
	sub r2, #0x6c
	strh r4, [r3, r2]
	add r2, r0, #0
	ldr r3, [r1]
	mov r4, #1
	sub r2, #0x6a
	strb r4, [r3, r2]
	ldr r2, [r1]
	mov r3, #0
	sub r0, #0x69
	strb r3, [r2, r0]
	ldr r4, [r1]
	sub r0, r7, #2
	add r1, r4, r5
	ldrh r0, [r1, r0]
	mov r1, #0x1e
	bl _s32_div_f
	add r3, r0, #0
	add r0, r7, #0
	sub r0, #0x18
	add r0, r4, r0
	add r0, r0, r5
	add r1, r6, #0
	mov r2, #1
	bl ov00_021E5CEC
	ldr r1, _0222F138 ; =_022577C0
	ldr r0, _0222F14C ; =ov45_02230390
	ldr r1, [r1]
	bl ov00_021E5CD0
	ldr r1, _0222F138 ; =_022577C0
	ldr r0, _0222F150 ; =ov45_02230394
	ldr r1, [r1]
	bl ov00_021E5CA0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222F138: .word _022577C0
_0222F13C: .word 0x0000069C
_0222F140: .word 0x000005B8
_0222F144: .word 0x000005FC
_0222F148: .word 0x00000708
_0222F14C: .word ov45_02230390
_0222F150: .word ov45_02230394
	thumb_func_end ov45_0222F028

	thumb_func_start ov45_0222F154
ov45_0222F154: ; 0x0222F154
	push {r4, lr}
	ldr r0, _0222F1B0 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F162
	bl GF_AssertFail
_0222F162:
	ldr r0, _0222F1B0 ; =_022577C0
	ldr r2, [r0]
	ldr r0, _0222F1B4 ; =0x0000069C
	ldrh r1, [r2, r0]
	cmp r1, #3
	beq _0222F1AC
	add r0, r0, #2
	ldrb r0, [r2, r0]
	cmp r0, #0
	beq _0222F1AC
	bl ov45_02232CA4
	bl ov45_0222F74C
	cmp r0, #0
	bne _0222F186
	bl GF_AssertFail
_0222F186:
	ldr r0, _0222F1B0 ; =_022577C0
	ldr r4, [r0]
	bl ov45_02232580
	ldr r1, _0222F1B4 ; =0x0000069C
	add r2, r0, #0
	ldrh r1, [r4, r1]
	add r0, r4, #0
	bl ov45_022301E0
	cmp r0, #0
	bne _0222F1A2
	bl GF_AssertFail
_0222F1A2:
	ldr r0, _0222F1B0 ; =_022577C0
	mov r2, #0
	ldr r1, [r0]
	ldr r0, _0222F1B8 ; =0x0000069E
	strb r2, [r1, r0]
_0222F1AC:
	pop {r4, pc}
	nop
_0222F1B0: .word _022577C0
_0222F1B4: .word 0x0000069C
_0222F1B8: .word 0x0000069E
	thumb_func_end ov45_0222F154

	thumb_func_start ov45_0222F1BC
ov45_0222F1BC: ; 0x0222F1BC
	push {r4, r5, r6, lr}
	ldr r0, _0222F210 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F1CA
	bl GF_AssertFail
_0222F1CA:
	ldr r4, _0222F210 ; =_022577C0
	ldr r3, _0222F214 ; =0x0000069E
	ldr r1, [r4]
	ldrb r0, [r1, r3]
	cmp r0, #0
	beq _0222F20C
	sub r2, r3, #2
	ldrh r5, [r1, r2]
	mov r2, #0x4c
	mov r0, #1
	add r6, r5, #0
	mul r6, r2
	add r5, r1, r6
	add r1, r3, #0
	sub r1, #0xda
	str r0, [r5, r1]
	add r0, r3, #0
	ldr r1, [r4]
	sub r0, #0xe6
	add r4, r1, r0
	sub r0, r3, #2
	ldrh r0, [r1, r0]
	add r1, r0, #0
	mul r1, r2
	add r0, r4, r1
	bl ov45_02232BB0
	bl ov45_0222F74C
	cmp r0, #0
	bne _0222F20C
	bl GF_AssertFail
_0222F20C:
	pop {r4, r5, r6, pc}
	nop
_0222F210: .word _022577C0
_0222F214: .word 0x0000069E
	thumb_func_end ov45_0222F1BC

	thumb_func_start ov45_0222F218
ov45_0222F218: ; 0x0222F218
	push {r3, lr}
	ldr r0, _0222F24C ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F226
	bl GF_AssertFail
_0222F226:
	ldr r0, _0222F24C ; =_022577C0
	ldr r1, _0222F250 ; =0x0000069C
	ldr r3, [r0]
	ldrh r2, [r3, r1]
	cmp r2, #3
	bne _0222F236
	mov r0, #0
	pop {r3, pc}
_0222F236:
	mov r0, #0x4c
	mul r0, r2
	add r0, r3, r0
	sub r1, #0xd8
	ldr r0, [r0, r1]
	cmp r0, #1
	bne _0222F248
	mov r0, #1
	pop {r3, pc}
_0222F248:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0222F24C: .word _022577C0
_0222F250: .word 0x0000069C
	thumb_func_end ov45_0222F218

	thumb_func_start ov45_0222F254
ov45_0222F254: ; 0x0222F254
	push {r3, lr}
	ldr r0, _0222F26C ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F262
	bl GF_AssertFail
_0222F262:
	ldr r0, _0222F26C ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222F270 ; =0x0000069F
	ldrb r0, [r1, r0]
	pop {r3, pc}
	.balign 4, 0
_0222F26C: .word _022577C0
_0222F270: .word 0x0000069F
	thumb_func_end ov45_0222F254

	thumb_func_start ov45_0222F274
ov45_0222F274: ; 0x0222F274
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222F290 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F284
	bl GF_AssertFail
_0222F284:
	ldr r0, _0222F290 ; =_022577C0
	add r1, r4, #0
	ldr r0, [r0]
	bl ov45_0223021C
	pop {r4, pc}
	.balign 4, 0
_0222F290: .word _022577C0
	thumb_func_end ov45_0222F274

	thumb_func_start ov45_0222F294
ov45_0222F294: ; 0x0222F294
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222F2CC ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F2A4
	bl GF_AssertFail
_0222F2A4:
	add r0, r4, #0
	bl ov45_0222F274
	cmp r0, #0
	bne _0222F2B2
	mov r0, #0
	pop {r4, pc}
_0222F2B2:
	ldr r0, _0222F2CC ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x4c
	mul r0, r4
	add r1, r1, r0
	ldr r0, _0222F2D0 ; =0x000005C4
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0222F2C8
	mov r0, #1
	pop {r4, pc}
_0222F2C8:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0222F2CC: .word _022577C0
_0222F2D0: .word 0x000005C4
	thumb_func_end ov45_0222F294

	thumb_func_start ov45_0222F2D4
ov45_0222F2D4: ; 0x0222F2D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222F310 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F2E4
	bl GF_AssertFail
_0222F2E4:
	cmp r4, #3
	blt _0222F2EC
	bl GF_AssertFail
_0222F2EC:
	ldr r0, _0222F310 ; =_022577C0
	add r1, r4, #0
	ldr r0, [r0]
	bl ov45_0223021C
	cmp r0, #0
	bne _0222F2FE
	mov r0, #0
	pop {r4, pc}
_0222F2FE:
	ldr r0, _0222F310 ; =_022577C0
	add r1, r4, #0
	ldr r0, [r0]
	bl ov45_022302B0
	ldr r1, [r0, #4]
	ldr r0, [r0, #8]
	sub r0, r1, r0
	pop {r4, pc}
	.balign 4, 0
_0222F310: .word _022577C0
	thumb_func_end ov45_0222F2D4

	thumb_func_start ov45_0222F314
ov45_0222F314: ; 0x0222F314
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222F34C ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F324
	bl GF_AssertFail
_0222F324:
	cmp r4, #3
	blt _0222F32C
	bl GF_AssertFail
_0222F32C:
	ldr r0, _0222F34C ; =_022577C0
	add r1, r4, #0
	ldr r0, [r0]
	bl ov45_0223021C
	cmp r0, #0
	bne _0222F33E
	mov r0, #0
	pop {r4, pc}
_0222F33E:
	ldr r0, _0222F34C ; =_022577C0
	add r1, r4, #0
	ldr r0, [r0]
	bl ov45_022302B0
	ldr r0, [r0, #8]
	pop {r4, pc}
	.balign 4, 0
_0222F34C: .word _022577C0
	thumb_func_end ov45_0222F314

	thumb_func_start ov45_0222F350
ov45_0222F350: ; 0x0222F350
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0222F3D4 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F360
	bl GF_AssertFail
_0222F360:
	ldr r0, _0222F3D4 ; =_022577C0
	add r1, r5, #0
	ldr r0, [r0]
	bl ov45_0223021C
	cmp r0, #0
	bne _0222F372
	mov r0, #0
	pop {r4, r5, r6, pc}
_0222F372:
	ldr r3, _0222F3D4 ; =_022577C0
	ldr r2, _0222F3D8 ; =0x0000069C
	ldr r0, [r3]
	ldrh r1, [r0, r2]
	cmp r1, #3
	beq _0222F382
	mov r0, #0
	pop {r4, r5, r6, pc}
_0222F382:
	mov r1, #0x4c
	add r4, r5, #0
	mul r4, r1
	add r1, r2, #0
	add r6, r0, r4
	sub r1, #0xd8
	ldr r1, [r6, r1]
	cmp r1, #1
	bne _0222F398
	mov r0, #0
	pop {r4, r5, r6, pc}
_0222F398:
	strh r5, [r0, r2]
	ldr r5, [r3]
	sub r2, #0x9e
	add r0, r5, r4
	ldrh r0, [r0, r2]
	mov r1, #0x1e
	bl _s32_div_f
	ldr r1, _0222F3DC ; =0x000005E8
	add r3, r0, #0
	add r0, r5, r1
	add r2, r5, r4
	sub r1, #0x2c
	ldr r1, [r2, r1]
	add r0, r0, r4
	mov r2, #0
	bl ov00_021E5CEC
	ldr r1, _0222F3D4 ; =_022577C0
	ldr r0, _0222F3E0 ; =ov45_02230390
	ldr r1, [r1]
	bl ov00_021E5CD0
	ldr r1, _0222F3D4 ; =_022577C0
	ldr r0, _0222F3E4 ; =ov45_02230394
	ldr r1, [r1]
	bl ov00_021E5CA0
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222F3D4: .word _022577C0
_0222F3D8: .word 0x0000069C
_0222F3DC: .word 0x000005E8
_0222F3E0: .word ov45_02230390
_0222F3E4: .word ov45_02230394
	thumb_func_end ov45_0222F350

	thumb_func_start ov45_0222F3E8
ov45_0222F3E8: ; 0x0222F3E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222F424 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F3F8
	bl GF_AssertFail
_0222F3F8:
	cmp r4, #3
	blt _0222F400
	bl GF_AssertFail
_0222F400:
	ldr r0, _0222F424 ; =_022577C0
	add r1, r4, #0
	ldr r0, [r0]
	bl ov45_0223021C
	cmp r0, #0
	bne _0222F412
	ldr r0, _0222F428 ; =0x00000708
	pop {r4, pc}
_0222F412:
	ldr r0, _0222F424 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x4c
	mul r0, r4
	add r1, r1, r0
	ldr r0, _0222F42C ; =0x000005FE
	ldrh r0, [r1, r0]
	pop {r4, pc}
	nop
_0222F424: .word _022577C0
_0222F428: .word 0x00000708
_0222F42C: .word 0x000005FE
	thumb_func_end ov45_0222F3E8

	thumb_func_start ov45_0222F430
ov45_0222F430: ; 0x0222F430
	push {r3, lr}
	ldr r0, _0222F45C ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F43E
	bl GF_AssertFail
_0222F43E:
	ldr r0, _0222F45C ; =_022577C0
	ldr r1, _0222F460 ; =0x0000069C
	ldr r3, [r0]
	ldrh r2, [r3, r1]
	cmp r2, #3
	bne _0222F450
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
_0222F450:
	mov r0, #0x4c
	mul r0, r2
	add r0, r3, r0
	sub r1, #0x9c
	ldr r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0222F45C: .word _022577C0
_0222F460: .word 0x0000069C
	thumb_func_end ov45_0222F430

	thumb_func_start ov45_0222F464
ov45_0222F464: ; 0x0222F464
	push {r3, lr}
	ldr r0, _0222F47C ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F472
	bl GF_AssertFail
_0222F472:
	ldr r0, _0222F47C ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222F480 ; =0x0000069E
	ldrb r0, [r1, r0]
	pop {r3, pc}
	.balign 4, 0
_0222F47C: .word _022577C0
_0222F480: .word 0x0000069E
	thumb_func_end ov45_0222F464

	thumb_func_start ov45_0222F484
ov45_0222F484: ; 0x0222F484
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222F4A8 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F494
	bl GF_AssertFail
_0222F494:
	ldr r0, _0222F4A8 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x6a
	lsl r0, r0, #4
	add r0, r1, r0
	add r1, r4, #0
	bl ov45_02230434
	pop {r4, pc}
	nop
_0222F4A8: .word _022577C0
	thumb_func_end ov45_0222F484

	thumb_func_start ov45_0222F4AC
ov45_0222F4AC: ; 0x0222F4AC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222F4D0 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F4BC
	bl GF_AssertFail
_0222F4BC:
	ldr r0, _0222F4D0 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x6a
	lsl r0, r0, #4
	add r0, r1, r0
	add r1, r4, #0
	bl ov45_0223045C
	pop {r4, pc}
	nop
_0222F4D0: .word _022577C0
	thumb_func_end ov45_0222F4AC

	thumb_func_start ov45_0222F4D4
ov45_0222F4D4: ; 0x0222F4D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222F520 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F4E4
	bl GF_AssertFail
_0222F4E4:
	cmp r4, #3
	blt _0222F4EC
	bl GF_AssertFail
_0222F4EC:
	ldr r0, _0222F520 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x26
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	cmp r0, #1
	bne _0222F4FE
	bl GF_AssertFail
_0222F4FE:
	add r0, r4, #0
	bl ov45_02232E60
	bl ov45_0222F74C
	cmp r0, #1
	beq _0222F510
	bl GF_AssertFail
_0222F510:
	ldr r0, _0222F520 ; =_022577C0
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0x26
	lsl r0, r0, #6
	str r2, [r1, r0]
	pop {r4, pc}
	nop
_0222F520: .word _022577C0
	thumb_func_end ov45_0222F4D4

	thumb_func_start ov45_0222F524
ov45_0222F524: ; 0x0222F524
	push {r3, lr}
	ldr r0, _0222F540 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F532
	bl GF_AssertFail
_0222F532:
	ldr r0, _0222F540 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x26
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	pop {r3, pc}
	nop
_0222F540: .word _022577C0
	thumb_func_end ov45_0222F524

	thumb_func_start ov45_0222F544
ov45_0222F544: ; 0x0222F544
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222F608 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F554
	bl GF_AssertFail
_0222F554:
	cmp r4, #0xb
	blt _0222F55C
	bl GF_AssertFail
_0222F55C:
	cmp r4, #0xa
	bhi _0222F5FE
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222F56C: ; jump table
	.short _0222F582 - _0222F56C - 2 ; case 0
	.short _0222F58C - _0222F56C - 2 ; case 1
	.short _0222F596 - _0222F56C - 2 ; case 2
	.short _0222F5A0 - _0222F56C - 2 ; case 3
	.short _0222F5B8 - _0222F56C - 2 ; case 4
	.short _0222F5C2 - _0222F56C - 2 ; case 5
	.short _0222F5CC - _0222F56C - 2 ; case 6
	.short _0222F5D6 - _0222F56C - 2 ; case 7
	.short _0222F5EE - _0222F56C - 2 ; case 8
	.short _0222F5EE - _0222F56C - 2 ; case 9
	.short _0222F5EE - _0222F56C - 2 ; case 10
_0222F582:
	ldr r0, _0222F608 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222F60C ; =0x000006A8
	ldr r0, [r1, r0]
	pop {r4, pc}
_0222F58C:
	ldr r0, _0222F608 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222F610 ; =0x000006AC
	ldr r0, [r1, r0]
	pop {r4, pc}
_0222F596:
	ldr r0, _0222F608 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222F614 ; =0x00000804
	ldr r0, [r1, r0]
	pop {r4, pc}
_0222F5A0:
	ldr r0, _0222F608 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222F610 ; =0x000006AC
	ldr r1, [r1, r0]
	mov r0, #0xfa
	lsl r0, r0, #2
	cmp r1, r0
	blt _0222F5B4
	mov r0, #1
	pop {r4, pc}
_0222F5B4:
	mov r0, #0
	pop {r4, pc}
_0222F5B8:
	ldr r0, _0222F608 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222F618 ; =0x00000808
	ldr r0, [r1, r0]
	pop {r4, pc}
_0222F5C2:
	ldr r0, _0222F608 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222F61C ; =0x0000080C
	ldr r0, [r1, r0]
	pop {r4, pc}
_0222F5CC:
	ldr r0, _0222F608 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222F620 ; =0x00000964
	ldr r0, [r1, r0]
	pop {r4, pc}
_0222F5D6:
	ldr r0, _0222F608 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222F61C ; =0x0000080C
	ldr r1, [r1, r0]
	mov r0, #0xfa
	lsl r0, r0, #2
	cmp r1, r0
	blt _0222F5EA
	mov r0, #1
	pop {r4, pc}
_0222F5EA:
	mov r0, #0
	pop {r4, pc}
_0222F5EE:
	ldr r0, _0222F608 ; =_022577C0
	sub r4, #8
	ldr r1, [r0]
	lsl r0, r4, #2
	add r1, r1, r0
	ldr r0, _0222F624 ; =0x00000974
	ldr r0, [r1, r0]
	pop {r4, pc}
_0222F5FE:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
	nop
_0222F608: .word _022577C0
_0222F60C: .word 0x000006A8
_0222F610: .word 0x000006AC
_0222F614: .word 0x00000804
_0222F618: .word 0x00000808
_0222F61C: .word 0x0000080C
_0222F620: .word 0x00000964
_0222F624: .word 0x00000974
	thumb_func_end ov45_0222F544

	thumb_func_start ov45_0222F628
ov45_0222F628: ; 0x0222F628
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222F6A4 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F638
	bl GF_AssertFail
_0222F638:
	cmp r4, #8
	blt _0222F640
	bl GF_AssertFail
_0222F640:
	cmp r4, #7
	bhi _0222F69C
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222F650: ; jump table
	.short _0222F660 - _0222F650 - 2 ; case 0
	.short _0222F66C - _0222F650 - 2 ; case 1
	.short _0222F66C - _0222F650 - 2 ; case 2
	.short _0222F66C - _0222F650 - 2 ; case 3
	.short _0222F67E - _0222F650 - 2 ; case 4
	.short _0222F68A - _0222F650 - 2 ; case 5
	.short _0222F68A - _0222F650 - 2 ; case 6
	.short _0222F68A - _0222F650 - 2 ; case 7
_0222F660:
	ldr r0, _0222F6A4 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x6b
	lsl r0, r0, #4
	add r0, r1, r0
	pop {r4, pc}
_0222F66C:
	ldr r0, _0222F6A4 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222F6A8 ; =0x0000078C
	add r2, r1, r0
	sub r1, r4, #1
	mov r0, #0x24
	mul r0, r1
	add r0, r2, r0
	pop {r4, pc}
_0222F67E:
	ldr r0, _0222F6A4 ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x81
	lsl r0, r0, #4
	add r0, r1, r0
	pop {r4, pc}
_0222F68A:
	ldr r0, _0222F6A4 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0222F6AC ; =0x000008EC
	add r2, r1, r0
	sub r1, r4, #5
	mov r0, #0x24
	mul r0, r1
	add r0, r2, r0
	pop {r4, pc}
_0222F69C:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0222F6A4: .word _022577C0
_0222F6A8: .word 0x0000078C
_0222F6AC: .word 0x000008EC
	thumb_func_end ov45_0222F628

	thumb_func_start ov45_0222F6B0
ov45_0222F6B0: ; 0x0222F6B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0222F700 ; =_022577C0
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F6C2
	bl GF_AssertFail
_0222F6C2:
	cmp r5, #2
	blt _0222F6CA
	bl GF_AssertFail
_0222F6CA:
	cmp r4, #0xc
	blo _0222F6D2
	bl GF_AssertFail
_0222F6D2:
	cmp r5, #2
	blt _0222F6DA
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222F6DA:
	cmp r4, #0xc
	blo _0222F6E2
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222F6E2:
	cmp r5, #0
	bne _0222F6F2
	ldr r0, _0222F700 ; =_022577C0
	ldr r0, [r0]
	add r1, r0, r4
	ldr r0, _0222F704 ; =0x000007F8
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
_0222F6F2:
	ldr r0, _0222F700 ; =_022577C0
	ldr r0, [r0]
	add r1, r0, r4
	ldr r0, _0222F708 ; =0x00000958
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
	nop
_0222F700: .word _022577C0
_0222F704: .word 0x000007F8
_0222F708: .word 0x00000958
	thumb_func_end ov45_0222F6B0

	thumb_func_start ov45_0222F70C
ov45_0222F70C: ; 0x0222F70C
	push {r4, lr}
	ldr r0, _0222F744 ; =_022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F71A
	bl GF_AssertFail
_0222F71A:
	mov r0, #0
	add r1, r0, #0
	bl ov00_021E5CD0
	mov r0, #0
	add r1, r0, #0
	bl ov00_021E5CA0
	ldr r2, _0222F744 ; =_022577C0
	ldr r0, _0222F748 ; =0x0000069C
	ldr r1, [r2]
	mov r3, #3
	strh r3, [r1, r0]
	add r1, r0, #2
	ldr r3, [r2]
	mov r4, #0
	strb r4, [r3, r1]
	ldr r1, [r2]
	add r0, r0, #3
	strb r4, [r1, r0]
	pop {r4, pc}
	.balign 4, 0
_0222F744: .word _022577C0
_0222F748: .word 0x0000069C
	thumb_func_end ov45_0222F70C

	thumb_func_start ov45_0222F74C
ov45_0222F74C: ; 0x0222F74C
	push {r3, lr}
	mov r1, #1
	cmp r0, #7
	bhi _0222F780
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222F760: ; jump table
	.short _0222F786 - _0222F760 - 2 ; case 0
	.short _0222F770 - _0222F760 - 2 ; case 1
	.short _0222F770 - _0222F760 - 2 ; case 2
	.short _0222F774 - _0222F760 - 2 ; case 3
	.short _0222F770 - _0222F760 - 2 ; case 4
	.short _0222F770 - _0222F760 - 2 ; case 5
	.short _0222F774 - _0222F760 - 2 ; case 6
	.short _0222F77C - _0222F760 - 2 ; case 7
_0222F770:
	mov r1, #0
	b _0222F786
_0222F774:
	bl GF_AssertFail
	mov r1, #0
	b _0222F786
_0222F77C:
	mov r1, #0
	b _0222F786
_0222F780:
	bl GF_AssertFail
	mov r1, #0
_0222F786:
	add r0, r1, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov45_0222F74C

	thumb_func_start ov45_0222F78C
ov45_0222F78C: ; 0x0222F78C
	ldr r1, _0222F7A0 ; =_022577C0
	ldr r0, _0222F7A4 ; =0x00000133
	ldr r2, [r1]
	mov r3, #0
	strb r3, [r2, r0]
	ldr r1, [r1]
	sub r0, r0, #1
	strb r3, [r1, r0]
	bx lr
	nop
_0222F7A0: .word _022577C0
_0222F7A4: .word 0x00000133
	thumb_func_end ov45_0222F78C

	thumb_func_start ov45_0222F7A8
ov45_0222F7A8: ; 0x0222F7A8
	sub r0, r0, #1
	bpl _0222F7AE
	mov r0, #4
_0222F7AE:
	bx lr
	thumb_func_end ov45_0222F7A8

	thumb_func_start ov45_0222F7B0
ov45_0222F7B0: ; 0x0222F7B0
	add r0, r0, #1
	bx lr
	thumb_func_end ov45_0222F7B0

	thumb_func_start ov45_0222F7B4
ov45_0222F7B4: ; 0x0222F7B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp, #4]
	ldr r0, [r0, #8]
	bl sub_0202CA8C
	add r4, r0, #0
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	bl sub_0202CA90
	cmp r4, #0
	bne _0222F7D4
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F7D4:
	ldr r7, _0222F840 ; =0x00000136
	ldr r2, [sp, #4]
	mov r1, #0
	sub r3, r7, #2
	add r5, r7, #1
_0222F7DE:
	ldrb r6, [r2, r5]
	cmp r6, #0
	beq _0222F7FE
	ldrh r6, [r2, r3]
	cmp r4, r6
	bne _0222F7F6
	ldrb r6, [r2, r7]
	cmp r0, r6
	bne _0222F7F6
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F7F6:
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #0x14
	blt _0222F7DE
_0222F7FE:
	cmp r1, #0x14
	blt _0222F80C
	bl GF_AssertFail
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F80C:
	lsl r2, r1, #2
	ldr r1, [sp, #4]
	mov r3, #0x4d
	add r2, r1, r2
	lsl r3, r3, #2
	strh r4, [r2, r3]
	add r1, r3, #2
	strb r0, [r2, r1]
	mov r1, #1
	add r0, r3, #3
	strb r1, [r2, r0]
	mov r0, #0x50
	str r0, [sp]
	ldr r2, _0222F844 ; =ov45_02254EF0
	ldr r4, [sp, #4]
	ldr r2, [r2]
	sub r0, #0x51
	mov r1, #0
	add r3, r4, r3
	bl ov45_022322A4
	bl ov45_0222F74C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222F840: .word 0x00000136
_0222F844: .word ov45_02254EF0
	thumb_func_end ov45_0222F7B4

	thumb_func_start ov45_0222F848
ov45_0222F848: ; 0x0222F848
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r0, #0x14
	add r4, r5, #0
	mul r4, r0
	add r0, r2, #0
	add r1, r4, #0
	bl AllocFromHeap
	ldr r1, _0222F874 ; =_022577C0
	ldr r2, [r1]
	str r0, [r2, #0x24]
	ldr r0, [r1]
	mov r1, #0
	ldr r0, [r0, #0x24]
	add r2, r4, #0
	bl memset
	ldr r0, _0222F874 ; =_022577C0
	ldr r0, [r0]
	str r5, [r0, #0x28]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222F874: .word _022577C0
	thumb_func_end ov45_0222F848

	thumb_func_start ov45_0222F878
ov45_0222F878: ; 0x0222F878
	ldr r0, _0222F884 ; =_022577C0
	ldr r3, _0222F888 ; =FreeToHeap
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	bx r3
	nop
_0222F884: .word _022577C0
_0222F888: .word FreeToHeap
	thumb_func_end ov45_0222F878

	thumb_func_start ov45_0222F88C
ov45_0222F88C: ; 0x0222F88C
	push {r3, lr}
	ldr r3, [r0, #0x28]
	bl ov45_0222F898
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov45_0222F88C

	thumb_func_start ov45_0222F898
ov45_0222F898: ; 0x0222F898
	push {r3, r4, r5, r6, r7, lr}
	str r2, [sp]
	mov r2, #0
	add r4, r0, #0
	add r6, r3, #0
	bl ov45_0222FB24
	add r7, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r7, r0
	bne _0222F8B4
	bl GF_AssertFail
_0222F8B4:
	ldr r2, [r4, #0x28]
	ldr r5, [r4, #0x24]
	add r4, r2, #0
	mul r4, r7
	cmp r2, r6
	bls _0222F8CA
	add r0, r5, r4
	mov r1, #0
	bl memset
	b _0222F8CC
_0222F8CA:
	add r6, r2, #0
_0222F8CC:
	ldr r1, [sp]
	add r0, r5, r4
	add r2, r6, #0
	bl memcpy
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222F898

	thumb_func_start ov45_0222F8D8
ov45_0222F8D8: ; 0x0222F8D8
	push {r3, r4, r5, lr}
	mov r2, #0
	add r5, r0, #0
	bl ov45_0222FB24
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0222F8F0
	bl GF_AssertFail
_0222F8F0:
	ldr r0, [r5, #0x28]
	ldr r2, [r5, #0x24]
	add r1, r0, #0
	mul r1, r4
	add r0, r2, r1
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222F8D8

	thumb_func_start ov45_0222F8FC
ov45_0222F8FC: ; 0x0222F8FC
	push {r3, r4, r5, lr}
	mov r2, #0
	add r5, r0, #0
	bl ov45_0222FB24
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0222F914
	bl GF_AssertFail
_0222F914:
	ldr r2, [r5, #0x28]
	ldr r1, [r5, #0x24]
	add r0, r2, #0
	mul r0, r4
	add r0, r1, r0
	mov r1, #0
	bl memset
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222F8FC

	thumb_func_start ov45_0222F928
ov45_0222F928: ; 0x0222F928
	push {r4, r5, r6, lr}
	add r4, r2, #0
	mov r2, #0
	add r5, r0, #0
	bl ov45_0222FB24
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _0222F942
	bl GF_AssertFail
_0222F942:
	mov r0, #0xc
	mul r0, r6
	add r2, r5, r0
	ldmia r4!, {r0, r1}
	add r2, #0x2c
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222F928

	thumb_func_start ov45_0222F954
ov45_0222F954: ; 0x0222F954
	push {r3, r4, r5, lr}
	mov r2, #0
	add r5, r0, #0
	bl ov45_0222FB24
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0222F96C
	bl GF_AssertFail
_0222F96C:
	mov r0, #0xc
	add r5, #0x2c
	mul r0, r4
	add r0, r5, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222F954

	thumb_func_start ov45_0222F978
ov45_0222F978: ; 0x0222F978
	push {r3, r4, r5, lr}
	mov r2, #0
	add r5, r0, #0
	bl ov45_0222FB24
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0222F990
	bl GF_AssertFail
_0222F990:
	mov r0, #0xc
	add r1, r4, #0
	mul r1, r0
	add r5, #0x2c
	mov r0, #0
	add r2, r5, r1
	strb r0, [r5, r1]
	strb r0, [r2, #1]
	strb r0, [r2, #2]
	strb r0, [r2, #3]
	strb r0, [r2, #4]
	strb r0, [r2, #5]
	strb r0, [r2, #6]
	strb r0, [r2, #7]
	strb r0, [r2, #8]
	strb r0, [r2, #9]
	strb r0, [r2, #0xa]
	strb r0, [r2, #0xb]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0222F978

	thumb_func_start ov45_0222F9B8
ov45_0222F9B8: ; 0x0222F9B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r4, #0
	add r5, r7, #0
_0222F9C8:
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222F9D6
	bl GF_AssertFail
_0222F9D6:
	cmp r4, #0
	bne _0222F9DE
	ldr r6, [sp]
	b _0222F9E0
_0222F9DE:
	ldr r6, [sp, #4]
_0222F9E0:
	mov r0, #0x47
	mov r1, #0
	lsl r0, r0, #2
	strh r1, [r5, r0]
	ldr r0, [sp, #8]
	lsl r1, r6, #2
	bl AllocFromHeap
	mov r1, #0x12
	lsl r1, r1, #4
	str r0, [r5, r1]
	sub r0, r1, #2
	strh r6, [r5, r0]
	add r0, r7, #0
	add r1, r4, #0
	bl ov45_0222FA40
	add r4, r4, #1
	add r5, #8
	cmp r4, #2
	blt _0222F9C8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov45_0222F9B8

	thumb_func_start ov45_0222FA10
ov45_0222FA10: ; 0x0222FA10
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r7, #0x12
	add r5, r0, #0
	add r6, r4, #0
	lsl r7, r7, #4
_0222FA1C:
	ldr r0, [r5, r7]
	cmp r0, #0
	bne _0222FA26
	bl GF_AssertFail
_0222FA26:
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl FreeToHeap
	mov r0, #0x12
	lsl r0, r0, #4
	str r6, [r5, r0]
	add r4, r4, #1
	add r5, #8
	cmp r4, #2
	blt _0222FA1C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222FA10

	thumb_func_start ov45_0222FA40
ov45_0222FA40: ; 0x0222FA40
	push {r3, r4, r5, r6}
	lsl r2, r1, #3
	add r0, r0, r2
	mov r2, #0x47
	mov r1, #0
	lsl r2, r2, #2
	strh r1, [r0, r2]
	add r2, r2, #2
	ldrh r2, [r0, r2]
	cmp r2, #0
	ble _0222FA6E
	mov r2, #0x12
	lsl r2, r2, #4
	add r6, r1, #0
	sub r5, r1, #1
	sub r3, r2, #2
_0222FA60:
	ldr r4, [r0, r2]
	add r1, r1, #1
	str r5, [r4, r6]
	ldrh r4, [r0, r3]
	add r6, r6, #4
	cmp r1, r4
	blt _0222FA60
_0222FA6E:
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222FA40

	thumb_func_start ov45_0222FA74
ov45_0222FA74: ; 0x0222FA74
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	str r1, [sp]
	add r4, r2, #0
	bl ov45_0222FB24
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0222FAF0
	ldr r0, _0222FAF4 ; =0x0000011E
	lsl r4, r4, #3
	add r5, r7, r0
	sub r0, r0, #2
	add r1, r7, r0
	add r0, r1, r4
	str r0, [sp, #4]
	ldrsh r1, [r1, r4]
	ldrh r0, [r5, r4]
	cmp r1, r0
	blt _0222FAA4
	bl GF_AssertFail
_0222FAA4:
	ldr r1, [sp, #4]
	mov r0, #0
	ldrh r2, [r5, r4]
	ldrsh r1, [r1, r0]
	cmp r1, r2
	bge _0222FAF0
	cmp r2, #0
	ble _0222FAD4
	mov r1, #0x12
	add r2, r7, r4
	lsl r1, r1, #4
	ldr r1, [r2, r1]
	ldr r3, _0222FAF4 ; =0x0000011E
	sub r5, r0, #1
_0222FAC0:
	ldr r6, [r1]
	cmp r6, r5
	bne _0222FACA
	str r0, [sp, #8]
	b _0222FAD4
_0222FACA:
	ldrh r6, [r2, r3]
	add r0, r0, #1
	add r1, r1, #4
	cmp r0, r6
	blt _0222FAC0
_0222FAD4:
	mov r0, #0x12
	add r1, r7, r4
	lsl r0, r0, #4
	ldr r2, [r1, r0]
	ldr r0, [sp, #8]
	lsl r1, r0, #2
	ldr r0, [sp]
	str r0, [r2, r1]
	ldr r0, [sp, #4]
	mov r1, #0
	ldrsh r0, [r0, r1]
	add r1, r0, #1
	ldr r0, [sp, #4]
	strh r1, [r0]
_0222FAF0:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222FAF4: .word 0x0000011E
	thumb_func_end ov45_0222FA74

	thumb_func_start ov45_0222FAF8
ov45_0222FAF8: ; 0x0222FAF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl ov45_0222FB24
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222FB22
	lsl r2, r4, #3
	mov r3, #0x12
	add r4, r5, r2
	lsl r3, r3, #4
	ldr r4, [r4, r3]
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, r3, #4
	add r1, r5, r0
	ldrsh r0, [r1, r2]
	sub r0, r0, #1
	strh r0, [r1, r2]
_0222FB22:
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222FAF8

	thumb_func_start ov45_0222FB24
ov45_0222FB24: ; 0x0222FB24
	push {r4, r5}
	lsl r2, r2, #3
	add r0, r0, r2
	ldr r2, _0222FB58 ; =0x0000011E
	mov r3, #0
	ldrh r4, [r0, r2]
	cmp r4, #0
	ble _0222FB50
	add r2, r2, #2
	ldr r5, [r0, r2]
	ldr r2, _0222FB58 ; =0x0000011E
_0222FB3A:
	ldr r4, [r5]
	cmp r1, r4
	bne _0222FB46
	add r0, r3, #0
	pop {r4, r5}
	bx lr
_0222FB46:
	ldrh r4, [r0, r2]
	add r3, r3, #1
	add r5, r5, #4
	cmp r3, r4
	blt _0222FB3A
_0222FB50:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5}
	bx lr
	.balign 4, 0
_0222FB58: .word 0x0000011E
	thumb_func_end ov45_0222FB24

	thumb_func_start ov45_0222FB5C
ov45_0222FB5C: ; 0x0222FB5C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	lsl r6, r2, #3
	add r4, r1, #0
	ldr r0, _0222FB80 ; =0x0000011E
	add r1, r5, r6
	ldrh r0, [r1, r0]
	cmp r4, r0
	blt _0222FB72
	bl GF_AssertFail
_0222FB72:
	mov r0, #0x12
	add r1, r5, r6
	lsl r0, r0, #4
	ldr r1, [r1, r0]
	lsl r0, r4, #2
	ldr r0, [r1, r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222FB80: .word 0x0000011E
	thumb_func_end ov45_0222FB5C

	thumb_func_start ov45_0222FB84
ov45_0222FB84: ; 0x0222FB84
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl ov45_0222F7B0
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl ov45_0222FA40
	ldr r0, _0222FBD4 ; =0x0000011E
	mov r4, #0
	ldrh r0, [r5, r0]
	cmp r0, #0
	ble _0222FBD2
	add r6, r5, #0
_0222FBA4:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov45_0222FB5C
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0222FBC6
	ldr r0, [r6, #0x34]
	cmp r7, r0
	bne _0222FBC6
	add r0, r5, #0
	mov r2, #1
	bl ov45_0222FA74
_0222FBC6:
	ldr r0, _0222FBD4 ; =0x0000011E
	add r4, r4, #1
	ldrh r0, [r5, r0]
	add r6, #0xc
	cmp r4, r0
	blt _0222FBA4
_0222FBD2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222FBD4: .word 0x0000011E
	thumb_func_end ov45_0222FB84

	thumb_func_start ov45_0222FBD8
ov45_0222FBD8: ; 0x0222FBD8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	str r1, [sp]
	cmp r1, #4
	blt _0222FBE8
	bl GF_AssertFail
_0222FBE8:
	ldr r0, [sp]
	bl ov45_0222F7B0
	str r0, [sp, #4]
	ldr r0, _0222FC3C ; =0x0000011E
	mov r7, #0
	ldrh r0, [r6, r0]
	add r4, r7, #0
	cmp r0, #0
	ble _0222FC26
	add r5, r6, #0
_0222FBFE:
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0
	bl ov45_0222FB5C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222FC1A
	ldr r1, [r5, #0x34]
	ldr r0, [sp, #4]
	cmp r0, r1
	bne _0222FC1A
	add r7, r7, #1
_0222FC1A:
	ldr r0, _0222FC3C ; =0x0000011E
	add r4, r4, #1
	ldrh r0, [r6, r0]
	add r5, #0xc
	cmp r4, r0
	blt _0222FBFE
_0222FC26:
	ldr r1, _0222FC40 ; =ov45_02254C30
	ldr r0, [sp]
	ldrb r0, [r1, r0]
	cmp r0, r7
	ble _0222FC36
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222FC36:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222FC3C: .word 0x0000011E
_0222FC40: .word ov45_02254C30
	thumb_func_end ov45_0222FBD8

	thumb_func_start ov45_0222FC44
ov45_0222FC44: ; 0x0222FC44
	push {r3, r4, r5, lr}
	add r5, r0, #0
	cmp r1, #0
	bne _0222FC84
	ldr r0, _0222FCD0 ; =_022577C0
	mov r3, #1
	ldr r2, [r0]
	ldr r1, _0222FCD4 ; =0x000005B4
	lsl r3, r3, #0xa
	str r3, [r2, r1]
	ldr r2, [r0]
	mov r0, #0x6d
	lsl r0, r0, #2
	add r0, r2, r0
	add r1, r2, r1
	bl ov45_02232170
	bl ov45_0222F74C
	cmp r0, #0
	bne _0222FC72
	bl GF_AssertFail
_0222FC72:
	ldr r2, _0222FCD8 ; =ov45_02254EF0
	mov r0, #0
	mov r1, #0
	ldr r2, [r2]
	mvn r0, r0
	add r3, r1, #0
	bl ov45_02232304
	pop {r3, r4, r5, pc}
_0222FC84:
	ldr r0, _0222FCD0 ; =_022577C0
	ldr r4, [r0]
	add r0, r1, #0
	bl ov45_0222F7A8
	ldr r1, _0222FCDC ; =0x0000012D
	ldrb r2, [r4, r1]
	cmp r2, r0
	bne _0222FCC4
	cmp r5, #1
	bne _0222FCBC
	mov r2, #1
	add r0, r1, #2
	strb r2, [r4, r0]
	ldr r0, _0222FCD0 ; =_022577C0
	ldr r0, [r0]
	ldrb r1, [r0, r1]
	bl ov45_0222FB84
	bl ov45_02232580
	add r1, r0, #0
	ldr r0, _0222FCD0 ; =_022577C0
	mov r2, #1
	ldr r0, [r0]
	bl ov45_0222FA74
	pop {r3, r4, r5, pc}
_0222FCBC:
	mov r2, #2
	add r0, r1, #2
	strb r2, [r4, r0]
	pop {r3, r4, r5, pc}
_0222FCC4:
	bl GF_AssertFail
	bl ov45_0222EB94
	pop {r3, r4, r5, pc}
	nop
_0222FCD0: .word _022577C0
_0222FCD4: .word 0x000005B4
_0222FCD8: .word ov45_02254EF0
_0222FCDC: .word 0x0000012D
	thumb_func_end ov45_0222FC44

	thumb_func_start ov45_0222FCE0
ov45_0222FCE0: ; 0x0222FCE0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	bl ov45_02232580
	cmp r5, r0
	bne _0222FD04
	ldr r0, _0222FD4C ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x67
	lsl r0, r0, #2
	add r0, r1, r0
	bl ov45_022320C4
	mov r4, #1
	b _0222FD06
_0222FD04:
	mov r4, #0
_0222FD06:
	ldr r0, _0222FD4C ; =_022577C0
	add r1, r5, #0
	ldr r0, [r0]
	mov r2, #0
	bl ov45_0222FA74
	ldr r0, _0222FD4C ; =_022577C0
	ldr r3, [sp]
	ldr r0, [r0]
	add r1, r5, #0
	add r2, r7, #0
	bl ov45_0222F898
	ldr r0, _0222FD4C ; =_022577C0
	add r1, r5, #0
	ldr r0, [r0]
	add r2, r6, #0
	bl ov45_0222F928
	ldr r0, _0222FD4C ; =_022577C0
	add r1, r5, #0
	ldr r6, [r0]
	add r0, r6, #0
	bl ov45_0222F8D8
	add r3, r4, #0
	ldr r4, _0222FD4C ; =_022577C0
	add r1, r0, #0
	ldr r4, [r4]
	ldr r2, [r6, #0x20]
	ldr r4, [r4, #0xc]
	add r0, r5, #0
	blx r4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FD4C: .word _022577C0
	thumb_func_end ov45_0222FCE0

	thumb_func_start ov45_0222FD50
ov45_0222FD50: ; 0x0222FD50
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0222FDCC ; =_022577C0
	add r1, r5, #0
	ldr r0, [r0]
	mov r2, #0
	bl ov45_0222FB24
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222FDC8
	mov r6, #0
	ldr r7, _0222FDCC ; =_022577C0
	add r4, r6, #0
_0222FD6E:
	ldr r1, [r7]
	mov r0, #6
	add r2, r1, r4
	lsl r0, r0, #8
	ldr r0, [r2, r0]
	cmp r5, r0
	bne _0222FD88
	ldr r2, _0222FDD0 ; =0x000005B8
	add r0, r5, #0
	add r1, r1, r2
	add r1, r1, r4
	bl ov45_02230008
_0222FD88:
	add r6, r6, #1
	add r4, #0x4c
	cmp r6, #3
	blt _0222FD6E
	ldr r0, _0222FDCC ; =_022577C0
	ldr r2, [r0]
	add r0, r5, #0
	ldr r1, [r2, #0x20]
	ldr r2, [r2, #0x10]
	blx r2
	ldr r0, _0222FDCC ; =_022577C0
	add r1, r5, #0
	ldr r0, [r0]
	bl ov45_0222F978
	ldr r0, _0222FDCC ; =_022577C0
	add r1, r5, #0
	ldr r0, [r0]
	bl ov45_0222F8FC
	ldr r0, _0222FDCC ; =_022577C0
	add r1, r5, #0
	ldr r0, [r0]
	mov r2, #0
	bl ov45_0222FAF8
	ldr r0, _0222FDCC ; =_022577C0
	add r1, r5, #0
	ldr r0, [r0]
	mov r2, #1
	bl ov45_0222FAF8
_0222FDC8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FDCC: .word _022577C0
_0222FDD0: .word 0x000005B8
	thumb_func_end ov45_0222FD50

	thumb_func_start ov45_0222FDD4
ov45_0222FDD4: ; 0x0222FDD4
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0222FDD4

	thumb_func_start ov45_0222FDD8
ov45_0222FDD8: ; 0x0222FDD8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _0222FE7C ; =_022577C0
	add r4, r1, #0
	add r5, r2, #0
	ldr r0, [r0]
	add r1, r7, #0
	mov r2, #0
	str r3, [sp]
	bl ov45_0222FB24
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222FE78
	cmp r4, #5
	bhi _0222FE78
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222FE06: ; jump table
	.short _0222FE12 - _0222FE06 - 2 ; case 0
	.short _0222FE16 - _0222FE06 - 2 ; case 1
	.short _0222FE16 - _0222FE06 - 2 ; case 2
	.short _0222FE16 - _0222FE06 - 2 ; case 3
	.short _0222FE16 - _0222FE06 - 2 ; case 4
	.short _0222FE2C - _0222FE06 - 2 ; case 5
_0222FE12:
	mov r1, #0
	b _0222FE32
_0222FE16:
	add r0, r4, #0
	bl ov45_0222F7A8
	ldr r1, _0222FE7C ; =_022577C0
	ldr r2, [r1]
	ldr r1, _0222FE80 ; =0x0000012D
	ldrb r1, [r2, r1]
	cmp r1, r0
	bne _0222FE78
	mov r1, #1
	b _0222FE32
_0222FE2C:
	mov r1, #0
	b _0222FE32
	thumb_func_end ov45_0222FDD8

	thumb_func_start ov45_0222FE30
ov45_0222FE30: ; 0x0222FE30
	pop {r3, r4, r5, r6, r7, pc}
_0222FE32:
	add r4, r1, #0
	mov r0, #0xc
	mul r4, r0
	ldr r0, _0222FE7C ; =_022577C0
	mov r1, #0x62
	ldr r0, [r0]
	lsl r1, r1, #2
	add r0, r0, r4
	ldr r2, [r0, r1]
	cmp r2, r5
	bls _0222FE78
	sub r1, r1, #4
	ldr r0, [r0, r1]
	lsl r5, r5, #3
	add r0, r0, r5
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bls _0222FE5C
	bl GF_AssertFail
_0222FE5C:
	ldr r0, _0222FE7C ; =_022577C0
	mov r3, #0x61
	ldr r0, [r0]
	lsl r3, r3, #2
	add r6, r0, r4
	ldr r4, [r6, r3]
	add r3, #8
	add r2, r4, r5
	ldr r1, [sp]
	ldr r2, [r2, #4]
	ldr r3, [r6, r3]
	ldr r4, [r4, r5]
	add r0, r7, #0
	blx r4
_0222FE78:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FE7C: .word _022577C0
_0222FE80: .word 0x0000012D
	thumb_func_end ov45_0222FE30

	thumb_func_start ov45_0222FE84
ov45_0222FE84: ; 0x0222FE84
	push {r3, lr}
	ldr r1, _0222FEBC ; =ov45_02254EF0
	ldr r0, [sp, #8]
	ldr r1, [r1]
	bl strcmp
	cmp r0, #0
	bne _0222FEB8
	ldr r0, _0222FEC0 ; =_022577C0
	mov r2, #0x50
	ldr r1, [r0]
	mov r0, #0x4d
	lsl r0, r0, #2
	add r0, r1, r0
	ldr r1, [sp, #0xc]
	bl memcpy
	ldr r0, _0222FEC0 ; =_022577C0
	ldr r2, [r0]
	mov r0, #0x13
	lsl r0, r0, #4
	ldrb r1, [r2, r0]
	cmp r1, #0
	beq _0222FEB8
	mov r1, #0
	strb r1, [r2, r0]
_0222FEB8:
	pop {r3, pc}
	nop
_0222FEBC: .word ov45_02254EF0
_0222FEC0: .word _022577C0
	thumb_func_end ov45_0222FE84

	thumb_func_start ov45_0222FEC4
ov45_0222FEC4: ; 0x0222FEC4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0222FF38 ; =_022577C0
	add r7, r1, #0
	ldr r0, [r0]
	add r1, r5, #0
	mov r2, #0
	bl ov45_0222FB24
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222FF36
	ldr r0, _0222FF38 ; =_022577C0
	ldr r1, _0222FF3C ; =0x0000012D
	ldr r0, [r0]
	ldrb r1, [r0, r1]
	cmp r1, #4
	beq _0222FF2A
	add r1, r5, #0
	bl ov45_0222F954
	ldr r4, [r0, #8]
	ldr r0, _0222FF38 ; =_022577C0
	ldr r6, [r7, #8]
	ldr r1, [r0]
	ldr r0, _0222FF3C ; =0x0000012D
	ldrb r0, [r1, r0]
	bl ov45_0222F7B0
	cmp r4, #5
	bne _0222FF16
	cmp r6, r0
	bne _0222FF16
	ldr r0, _0222FF38 ; =_022577C0
	add r1, r5, #0
	ldr r0, [r0]
	mov r2, #1
	bl ov45_0222FA74
	b _0222FF2A
_0222FF16:
	cmp r4, r0
	bne _0222FF2A
	cmp r6, r0
	beq _0222FF2A
	ldr r0, _0222FF38 ; =_022577C0
	add r1, r5, #0
	ldr r0, [r0]
	mov r2, #1
	bl ov45_0222FAF8
_0222FF2A:
	ldr r0, _0222FF38 ; =_022577C0
	add r1, r5, #0
	ldr r0, [r0]
	add r2, r7, #0
	bl ov45_0222F928
_0222FF36:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222FF38: .word _022577C0
_0222FF3C: .word 0x0000012D
	thumb_func_end ov45_0222FEC4

	thumb_func_start ov45_0222FF40
ov45_0222FF40: ; 0x0222FF40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0222FF78 ; =_022577C0
	add r4, r1, #0
	ldr r0, [r0]
	add r1, r5, #0
	mov r2, #0
	bl ov45_0222FB24
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222FF74
	ldr r0, _0222FF78 ; =_022577C0
	add r1, r5, #0
	ldr r0, [r0]
	add r2, r4, #0
	bl ov45_0222F88C
	ldr r0, _0222FF78 ; =_022577C0
	add r1, r4, #0
	ldr r3, [r0]
	add r0, r5, #0
	ldr r2, [r3, #0x20]
	ldr r3, [r3, #0x14]
	blx r3
_0222FF74:
	pop {r3, r4, r5, pc}
	nop
_0222FF78: .word _022577C0
	thumb_func_end ov45_0222FF40

	thumb_func_start ov45_0222FF7C
ov45_0222FF7C: ; 0x0222FF7C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _0222FFFC ; =_022577C0
	add r4, r1, #0
	ldr r0, [r0]
	add r1, r5, #0
	mov r2, #0
	bl ov45_0222FB24
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222FFF8
	bl ov45_0222E9E0
	cmp r0, r5
	beq _0222FFEA
	ldr r0, _0222FFFC ; =_022577C0
	ldr r2, _02230000 ; =0x0000069E
	ldr r1, [r0]
	ldrb r0, [r1, r2]
	cmp r0, #0
	beq _0222FFEA
	sub r0, r2, #2
	ldrh r0, [r1, r0]
	ldr r3, [r4]
	cmp r0, r3
	bne _0222FFEA
	sub r2, #0xe6
	add r2, r1, r2
	mov r1, #0x4c
	mul r1, r0
	add r0, r2, r1
	add r1, sp, #8
	bl ov45_02230384
	add r0, r4, #0
	add r1, sp, #0
	bl ov45_02230384
	ldr r3, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	sub r0, r3, r0
	sbc r2, r1
	blt _0222FFF8
	ldr r0, _0222FFFC ; =_022577C0
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _02230004 ; =0x0000069F
	strb r2, [r1, r0]
	bl ov45_0222F154
_0222FFEA:
	ldr r0, _0222FFFC ; =_022577C0
	ldr r1, [r4]
	ldr r0, [r0]
	add r2, r5, #0
	add r3, r4, #0
	bl ov45_02230164
_0222FFF8:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222FFFC: .word _022577C0
_02230000: .word 0x0000069E
_02230004: .word 0x0000069F
	thumb_func_end ov45_0222FF7C

	thumb_func_start ov45_02230008
ov45_02230008: ; 0x02230008
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02230048 ; =_022577C0
	add r4, r1, #0
	ldr r0, [r0]
	add r1, r5, #0
	mov r2, #0
	bl ov45_0222FB24
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02230046
	ldr r0, _02230048 ; =_022577C0
	ldr r1, [r4]
	ldr r0, [r0]
	add r2, r5, #0
	bl ov45_022301E0
	ldr r1, _02230048 ; =_022577C0
	ldr r2, [r4]
	ldr r5, [r1]
	ldr r1, _0223004C ; =0x0000069C
	ldrh r3, [r5, r1]
	cmp r3, r2
	bne _02230046
	cmp r0, #1
	bne _02230046
	mov r2, #1
	add r0, r1, #3
	strb r2, [r5, r0]
_02230046:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02230048: .word _022577C0
_0223004C: .word 0x0000069C
	thumb_func_end ov45_02230008

	thumb_func_start ov45_02230050
ov45_02230050: ; 0x02230050
	push {r3, lr}
	ldr r1, _02230060 ; =_022577C0
	ldr r2, [r1]
	ldr r1, [r2, #0x20]
	ldr r2, [r2, #0x18]
	blx r2
	pop {r3, pc}
	nop
_02230060: .word _022577C0
	thumb_func_end ov45_02230050

	thumb_func_start ov45_02230064
ov45_02230064: ; 0x02230064
	push {r3, lr}
	cmp r0, #0
	beq _02230076
	ldr r0, _02230088 ; =_022577C0
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _0223008C ; =0x00000133
	strb r2, [r1, r0]
	pop {r3, pc}
_02230076:
	ldr r0, _02230088 ; =_022577C0
	ldr r3, [r0]
	add r0, r1, #0
	add r1, r2, #0
	ldr r2, [r3, #0x20]
	ldr r3, [r3, #0x1c]
	blx r3
	pop {r3, pc}
	nop
_02230088: .word _022577C0
_0223008C: .word 0x00000133
	thumb_func_end ov45_02230064

	thumb_func_start ov45_02230090
ov45_02230090: ; 0x02230090
	cmp r0, #0
	bne _02230098
	mov r0, #1
	bx lr
_02230098:
	ldr r0, _022300A8 ; =_022577C0
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _022300AC ; =0x00000132
	strb r2, [r1, r0]
	mov r0, #0
	bx lr
	nop
_022300A8: .word _022577C0
_022300AC: .word 0x00000132
	thumb_func_end ov45_02230090

	thumb_func_start ov45_022300B0
ov45_022300B0: ; 0x022300B0
	push {r3, lr}
	cmp r0, #0
	bne _022300C6
	ldr r0, _022300D4 ; =_022577C0
	ldr r3, [r0]
	mov r0, #0x6a
	lsl r0, r0, #4
	add r0, r3, r0
	bl ov45_0223040C
	pop {r3, pc}
_022300C6:
	ldr r0, _022300D4 ; =_022577C0
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _022300D8 ; =0x00000132
	strb r2, [r1, r0]
	pop {r3, pc}
	nop
_022300D4: .word _022577C0
_022300D8: .word 0x00000132
	thumb_func_end ov45_022300B0

	thumb_func_start ov45_022300DC
ov45_022300DC: ; 0x022300DC
	push {r3, lr}
	cmp r0, #0
	bne _022300F0
	ldr r0, _022300FC ; =_022577C0
	ldr r2, [r0]
	ldr r0, _02230100 ; =0x000006A8
	add r0, r2, r0
	bl ov45_0223048C
	pop {r3, pc}
_022300F0:
	ldr r0, _022300FC ; =_022577C0
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _02230104 ; =0x00000132
	strb r2, [r1, r0]
	pop {r3, pc}
	.balign 4, 0
_022300FC: .word _022577C0
_02230100: .word 0x000006A8
_02230104: .word 0x00000132
	thumb_func_end ov45_022300DC

	thumb_func_start ov45_02230108
ov45_02230108: ; 0x02230108
	push {r3, lr}
	ldr r0, _0223012C ; =_022577C0
	ldr r1, [r0]
	mov r0, #0x26
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	cmp r0, #1
	beq _0223011C
	bl GF_AssertFail
_0223011C:
	ldr r0, _0223012C ; =_022577C0
	mov r2, #2
	ldr r1, [r0]
	mov r0, #0x26
	lsl r0, r0, #6
	str r2, [r1, r0]
	pop {r3, pc}
	nop
_0223012C: .word _022577C0
	thumb_func_end ov45_02230108

	thumb_func_start ov45_02230130
ov45_02230130: ; 0x02230130
	ldr r0, _0223013C ; =_022577C0
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _02230140 ; =0x00000131
	strb r2, [r1, r0]
	bx lr
	.balign 4, 0
_0223013C: .word _022577C0
_02230140: .word 0x00000131
	thumb_func_end ov45_02230130

	thumb_func_start ov45_02230144
ov45_02230144: ; 0x02230144
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223015C ; =0x000005B8
	mov r1, #0
	add r0, r4, r0
	mov r2, #0xe4
	bl memset
	ldr r0, _02230160 ; =0x0000069C
	mov r1, #3
	strh r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_0223015C: .word 0x000005B8
_02230160: .word 0x0000069C
	thumb_func_end ov45_02230144

	thumb_func_start ov45_02230164
ov45_02230164: ; 0x02230164
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r7, r3, #0
	str r2, [sp]
	cmp r6, #3
	blt _02230176
	bl GF_AssertFail
_02230176:
	add r0, r5, #0
	add r1, r6, #0
	bl ov45_0223021C
	cmp r0, #1
	bne _02230194
	mov r0, #0x4c
	mul r0, r6
	add r1, r5, r0
	mov r0, #6
	lsl r0, r0, #8
	ldr r1, [r1, r0]
	ldr r0, [sp]
	cmp r0, r1
	bne _022301D2
_02230194:
	mov r0, #0x4c
	add r4, r6, #0
	mul r4, r0
	ldr r0, _022301D4 ; =0x000005B8
	add r1, r5, r4
	add r3, r1, r0
	mov r2, #8
_022301A2:
	ldmia r7!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _022301A2
	ldr r0, [r7]
	str r0, [r3]
	ldr r0, _022301D8 ; =0x000005FC
	add r2, r5, r0
	ldrh r1, [r2, r4]
	cmp r1, #0
	bne _022301D2
	mov r1, #1
	strh r1, [r2, r4]
	add r1, r0, #4
	ldr r0, [sp]
	add r2, r5, r4
	str r0, [r2, r1]
	add r0, r5, #0
	add r1, r6, #0
	bl ov45_0223023C
	ldr r1, _022301DC ; =0x000005FE
	add r2, r5, r4
	strh r0, [r2, r1]
_022301D2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022301D4: .word 0x000005B8
_022301D8: .word 0x000005FC
_022301DC: .word 0x000005FE
	thumb_func_end ov45_02230164

	thumb_func_start ov45_022301E0
ov45_022301E0: ; 0x022301E0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #3
	blt _022301F0
	bl GF_AssertFail
_022301F0:
	add r0, r5, #0
	add r1, r4, #0
	bl ov45_0223021C
	cmp r0, #1
	bne _02230216
	mov r0, #0x4c
	mul r0, r4
	add r2, r5, r0
	mov r0, #6
	lsl r0, r0, #8
	ldr r1, [r2, r0]
	cmp r6, r1
	bne _02230216
	mov r1, #0
	sub r0, r0, #4
	strh r1, [r2, r0]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02230216:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov45_022301E0

	thumb_func_start ov45_0223021C
ov45_0223021C: ; 0x0223021C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #3
	blt _0223022A
	bl GF_AssertFail
_0223022A:
	mov r0, #0x4c
	mul r0, r4
	add r1, r5, r0
	ldr r0, _02230238 ; =0x000005FC
	ldrh r0, [r1, r0]
	pop {r3, r4, r5, pc}
	nop
_02230238: .word 0x000005FC
	thumb_func_end ov45_0223021C

	thumb_func_start ov45_0223023C
ov45_0223023C: ; 0x0223023C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	add r5, r1, #0
	bl ov45_0223021C
	cmp r0, #0
	bne _02230252
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_02230252:
	add r0, r4, #0
	add r1, r5, #0
	bl ov45_022302B0
	add r1, sp, #0
	bl ov45_02230384
	mov r1, #0x67
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r2, [r4, r1]
	ldr r3, [sp]
	ldr r1, [sp, #4]
	sub r0, r0, r3
	sbc r2, r1
	mov r3, #0
	mov r1, #0x1e
	sub r1, r1, r0
	sbc r3, r2
	bge _02230282
	mov r0, #0x1e
	mov r2, #0
	b _02230294
_02230282:
	mov r1, #0
	mov r3, #0
	sub r1, r0, r1
	mov ip, r2
	mov r1, ip
	sbc r1, r3
	bge _02230294
	mov r0, #0
	add r2, r0, #0
_02230294:
	mov r1, #0x3c
	mov r3, #0
	sub r0, r1, r0
	mov ip, r3
	mov r1, ip
	sbc r1, r2
	mov r2, #0x1e
	bl _ll_mul
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_0223023C

	thumb_func_start ov45_022302B0
ov45_022302B0: ; 0x022302B0
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	cmp r6, #3
	blt _022302BE
	bl GF_AssertFail
_022302BE:
	mov r0, #0x4c
	add r4, r6, #0
	mul r4, r0
	ldr r0, _022302DC ; =0x000005FC
	add r1, r5, r4
	ldrh r0, [r1, r0]
	cmp r0, #1
	beq _022302D2
	bl GF_AssertFail
_022302D2:
	ldr r0, _022302E0 ; =0x000005B8
	add r0, r5, r0
	add r0, r0, r4
	pop {r4, r5, r6, pc}
	nop
_022302DC: .word 0x000005FC
_022302E0: .word 0x000005B8
	thumb_func_end ov45_022302B0

	thumb_func_start ov45_022302E4
ov45_022302E4: ; 0x022302E4
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02230364 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _02230368 ; =0x0000069E
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0223031E
	bl ov00_021E7144
	add r4, r0, #0
	cmp r4, #4
	bls _02230300
	bl GF_AssertFail
_02230300:
	ldr r0, _02230364 ; =_022577C0
	ldr r1, [r0]
	ldr r0, _0223036C ; =0x000005B8
	add r2, r1, r0
	add r0, #0xe4
	ldrh r1, [r1, r0]
	mov r0, #0x4c
	mul r0, r1
	add r0, r2, r0
	ldr r1, [r0, #8]
	cmp r1, r4
	beq _0223031E
	str r4, [r0, #8]
	bl ov45_02232BB0
_0223031E:
	mov r4, #0
	ldr r6, _02230364 ; =_022577C0
	ldr r7, _02230370 ; =0x000005FC
	add r5, r4, #0
_02230326:
	ldr r0, [r6]
	add r0, r0, r5
	ldrh r1, [r0, r7]
	cmp r1, #1
	bne _0223035A
	ldr r1, _02230374 ; =0x000005FE
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _02230342
	ldr r1, _02230374 ; =0x000005FE
	ldrh r1, [r0, r1]
	sub r2, r1, #1
	ldr r1, _02230374 ; =0x000005FE
	strh r2, [r0, r1]
_02230342:
	ldr r0, [r6]
	add r1, r4, #0
	bl ov45_0223023C
	ldr r1, [r6]
	ldr r2, _02230374 ; =0x000005FE
	add r1, r1, r5
	ldrh r2, [r1, r2]
	cmp r0, r2
	bhs _0223035A
	ldr r2, _02230374 ; =0x000005FE
	strh r0, [r1, r2]
_0223035A:
	add r4, r4, #1
	add r5, #0x4c
	cmp r4, #3
	blt _02230326
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02230364: .word _022577C0
_02230368: .word 0x0000069E
_0223036C: .word 0x000005B8
_02230370: .word 0x000005FC
_02230374: .word 0x000005FE
	thumb_func_end ov45_022302E4

	thumb_func_start ov45_02230378
ov45_02230378: ; 0x02230378
	ldr r2, [r1]
	ldr r1, [r1, #4]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_02230378

	thumb_func_start ov45_02230384
ov45_02230384: ; 0x02230384
	ldr r2, [r0, #0x10]
	ldr r0, [r0, #0x14]
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_02230384

	thumb_func_start ov45_02230390
ov45_02230390: ; 0x02230390
	bx lr
	.balign 4, 0
	thumb_func_end ov45_02230390

	thumb_func_start ov45_02230394
ov45_02230394: ; 0x02230394
	push {r3, lr}
	ldr r2, _022303B4 ; =0x0000069E
	ldrb r1, [r1, r2]
	cmp r1, #1
	bne _022303A4
	bl ov45_0222F154
	pop {r3, pc}
_022303A4:
	cmp r0, #0
	bne _022303B2
	ldr r0, _022303B8 ; =_022577C0
	mov r3, #1
	ldr r1, [r0]
	add r0, r2, #1
	strb r3, [r1, r0]
_022303B2:
	pop {r3, pc}
	.balign 4, 0
_022303B4: .word 0x0000069E
_022303B8: .word _022577C0
	thumb_func_end ov45_02230394

	thumb_func_start ov45_022303BC
ov45_022303BC: ; 0x022303BC
	push {r4, r5}
	ldrh r2, [r0, #0xe]
	mov r3, #0
	add r4, r3, #0
	cmp r2, #0
	ble _022303DC
	add r5, r0, #0
_022303CA:
	ldr r2, [r5, #0x14]
	cmp r1, r2
	bne _022303D2
	ldr r3, [r5, #0x10]
_022303D2:
	ldrh r2, [r0, #0xe]
	add r4, r4, #1
	add r5, #8
	cmp r4, r2
	blt _022303CA
_022303DC:
	add r0, r3, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov45_022303BC

	thumb_func_start ov45_022303E4
ov45_022303E4: ; 0x022303E4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	add r0, r2, #0
	lsl r1, r5, #3
	bl AllocFromHeap
	str r0, [r4]
	strh r5, [r4, #4]
	mov r0, #0
	strh r0, [r4, #6]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_022303E4

	thumb_func_start ov45_022303FC
ov45_022303FC: ; 0x022303FC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov45_022303FC

	thumb_func_start ov45_0223040C
ov45_0223040C: ; 0x0223040C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r0, [r5, #4]
	add r4, r2, #0
	add r6, r1, #0
	cmp r4, r0
	blo _0223041E
	bl GF_AssertFail
_0223041E:
	ldrh r0, [r5, #4]
	cmp r4, r0
	blo _02230426
	add r4, r0, #0
_02230426:
	ldr r1, [r5]
	add r0, r6, #0
	lsl r2, r4, #3
	bl MIi_CpuCopy32
	strh r4, [r5, #6]
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0223040C

	thumb_func_start ov45_02230434
ov45_02230434: ; 0x02230434
	push {r3, r4}
	ldrh r2, [r0, #6]
	mov r3, #0
	cmp r2, #0
	ble _02230456
	ldr r4, [r0]
_02230440:
	ldr r2, [r4]
	cmp r1, r2
	bne _0223044C
	mov r0, #1
	pop {r3, r4}
	bx lr
_0223044C:
	ldrh r2, [r0, #6]
	add r3, r3, #1
	add r4, #8
	cmp r3, r2
	blt _02230440
_02230456:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov45_02230434

	thumb_func_start ov45_0223045C
ov45_0223045C: ; 0x0223045C
	push {r4, r5}
	ldrh r2, [r0, #6]
	mov r3, #0
	cmp r2, #0
	ble _02230484
	ldr r5, [r0]
	add r4, r5, #0
_0223046A:
	ldr r2, [r4]
	cmp r1, r2
	bne _0223047A
	lsl r0, r3, #3
	add r0, r5, r0
	ldr r0, [r0, #4]
	pop {r4, r5}
	bx lr
_0223047A:
	ldrh r2, [r0, #6]
	add r3, r3, #1
	add r4, #8
	cmp r3, r2
	blt _0223046A
_02230484:
	mov r0, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov45_0223045C

	thumb_func_start ov45_0223048C
ov45_0223048C: ; 0x0223048C
	ldr r3, _02230494 ; =memcpy
	mov r2, #0xb6
	lsl r2, r2, #2
	bx r3
	.balign 4, 0
_02230494: .word memcpy
	thumb_func_end ov45_0223048C

	thumb_func_start ov45_02230498
ov45_02230498: ; 0x02230498
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r7, r2, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r7, #0
	mov r1, #0x30
	str r3, [sp, #0xc]
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x30
	add r4, r0, #0
	bl memset
	ldr r2, [sp, #4]
	mov r1, #0x90
	add r0, r7, #0
	mul r1, r2
	bl AllocFromHeap
	str r0, [r4, #0x10]
	ldr r0, [sp, #4]
	mov r6, #0
	str r0, [r4, #0x14]
	cmp r0, #0
	bls _022304E2
	add r5, r6, #0
_022304D0:
	ldr r0, [r4, #0x10]
	add r0, r0, r5
	bl ov45_02230AB4
	ldr r0, [r4, #0x14]
	add r6, r6, #1
	add r5, #0x90
	cmp r6, r0
	blo _022304D0
_022304E2:
	mov r0, #1
	add r1, r7, #0
	bl Create2DGfxResMan
	str r0, [r4]
	mov r0, #2
	add r1, r7, #0
	bl Create2DGfxResMan
	str r0, [r4, #4]
	mov r0, #0x14
	add r1, r7, #0
	bl sub_02025780
	str r0, [r4, #8]
	mov r0, #1
	add r1, r7, #0
	bl sub_02023738
	ldr r0, [sp, #4]
	str r7, [sp, #0x24]
	str r0, [sp, #0x20]
	add r0, sp, #0x20
	bl sub_020237EC
	str r0, [r4, #0xc]
	mov r0, #0x51
	add r1, r7, #0
	bl NARC_ctor
	str r0, [sp, #0x18]
	mov r0, #0xd1
	add r1, r7, #0
	bl NARC_ctor
	mov r2, #0
	ldr r3, [sp, #0xc]
	str r2, [sp]
	mov r1, #0x7f
	str r0, [sp, #0x14]
	bl GfGfxLoader_LoadFromOpenNarc
	add r5, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	mov r2, #0x7f
	bl sub_020255C4
	add r0, r5, #0
	bl ov45_0222D740
	add r0, r5, #0
	bl NNS_G3dGetMdlSet
	cmp r0, #0
	beq _02230572
	add r2, r0, #0
	add r2, #8
	beq _02230566
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _02230566
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _02230568
_02230566:
	mov r1, #0
_02230568:
	cmp r1, #0
	beq _02230572
	ldr r1, [r1]
	add r0, r0, r1
	b _02230574
_02230572:
	mov r0, #0
_02230574:
	mov r1, #0
	bl NNS_G3dMdlGetMdlLightEnableFlag
	mov r6, #0
	ldr r5, _02230630 ; =ov45_02254C38
	str r0, [r4, #0x2c]
	add r7, r6, #0
_02230582:
	str r7, [sp]
	ldrh r1, [r5]
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0xc]
	add r2, r7, #0
	bl GfGfxLoader_LoadFromOpenNarc
	add r1, r0, #0
	ldrh r2, [r5]
	ldr r0, [r4, #4]
	bl sub_020255C4
	add r6, r6, #1
	add r5, r5, #2
	cmp r6, #2
	blt _02230582
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _022305AE
	mov r0, #1
	str r0, [sp, #0x10]
	b _022305B2
_022305AE:
	mov r0, #0
	str r0, [sp, #0x10]
_022305B2:
	ldr r5, _02230634 ; =ov45_02254C48
	mov r7, #0
_022305B6:
	ldr r0, [sp, #0x10]
	cmp r0, r7
	beq _02230608
	ldrh r0, [r5, #2]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	bne _022305C8
	mov r6, #1
	b _022305CA
_022305C8:
	mov r6, #0
_022305CA:
	mov r0, #0
	str r0, [sp]
	ldrh r1, [r5, #2]
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0xc]
	lsl r1, r1, #0x11
	lsr r1, r1, #0x11
	mov r2, #0
	bl GfGfxLoader_LoadFromOpenNarc
	add r1, r0, #0
	ldr r0, [sp, #0xc]
	add r3, r6, #0
	str r0, [sp]
	ldrh r2, [r5, #2]
	ldr r0, [r4, #8]
	lsl r2, r2, #0x11
	lsr r2, r2, #0x11
	bl sub_02025800
	str r0, [sp, #0x1c]
	cmp r6, #1
	bne _02230608
	bl sub_02025A64
	ldr r0, [sp, #0x1c]
	bl sub_020259B0
	ldr r0, [sp, #0x1c]
	bl sub_020259FC
_02230608:
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, #0x14
	blt _022305B6
	add r0, r4, #0
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0xc]
	add r0, #0x18
	mov r2, #0x80
	bl ov45_022309E8
	ldr r0, [sp, #0x18]
	bl NARC_dtor
	ldr r0, [sp, #0x14]
	bl NARC_dtor
	add r0, r4, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02230630: .word ov45_02254C38
_02230634: .word ov45_02254C48
	thumb_func_end ov45_02230498

	thumb_func_start ov45_02230638
ov45_02230638: ; 0x02230638
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x18
	bl ov45_02230A44
	ldr r0, [r4, #8]
	bl sub_02025900
	ldr r0, [r4]
	bl sub_0202568C
	ldr r0, [r4, #4]
	bl sub_0202568C
	ldr r0, [r4, #0xc]
	bl sub_02023874
	bl sub_02023778
	ldr r0, [r4, #8]
	bl sub_020257C4
	ldr r0, [r4]
	bl Destroy2DGfxResMan
	ldr r0, [r4, #4]
	bl Destroy2DGfxResMan
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_02230638

	thumb_func_start ov45_02230680
ov45_02230680: ; 0x02230680
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	mov r6, #0
	cmp r0, #0
	bls _022306B0
	add r4, r6, #0
_0223068E:
	ldr r0, [r5, #0x10]
	add r0, r0, r4
	bl ov45_02230ACC
	ldr r0, [r5, #0x10]
	add r0, r0, r4
	bl ov45_02230CB0
	ldr r0, [r5, #0x10]
	add r0, r0, r4
	bl ov45_02230DF4
	ldr r0, [r5, #0x14]
	add r6, r6, #1
	add r4, #0x90
	cmp r6, r0
	blo _0223068E
_022306B0:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov45_02230680

	thumb_func_start ov45_022306B4
ov45_022306B4: ; 0x022306B4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_020237B0
	add r0, r5, #0
	add r0, #0x18
	bl ov45_02230A58
	cmp r0, #0
	beq _022306F0
	ldr r0, [r5, #0x14]
	mov r6, #0
	cmp r0, #0
	bls _022306F0
	add r4, r6, #0
_022306D2:
	ldr r0, [r5, #0x10]
	add r0, r0, r4
	bl ov45_02230AA4
	cmp r0, #1
	bne _022306E6
	ldr r0, [r5, #0x10]
	add r0, r0, r4
	bl ov45_02230AC0
_022306E6:
	ldr r0, [r5, #0x14]
	add r6, r6, #1
	add r4, #0x90
	cmp r6, r0
	blo _022306D2
_022306F0:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov45_022306B4

	thumb_func_start ov45_022306F4
ov45_022306F4: ; 0x022306F4
	ldr r3, _022306FC ; =sub_02023910
	ldr r0, [r0, #0xc]
	bx r3
	nop
_022306FC: .word sub_02023910
	thumb_func_end ov45_022306F4

	thumb_func_start ov45_02230700
ov45_02230700: ; 0x02230700
	ldr r3, _02230708 ; =ov45_02230A4C
	add r0, #0x18
	bx r3
	nop
_02230708: .word ov45_02230A4C
	thumb_func_end ov45_02230700

	thumb_func_start ov45_0223070C
ov45_0223070C: ; 0x0223070C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x98
	add r5, r0, #0
	add r7, r1, #0
	bl ov45_02230A6C
	add r4, r0, #0
	str r7, [r4, #4]
	add r1, sp, #0x34
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	ldr r3, _02230874 ; =ov45_02254C3C
	str r0, [r1, #8]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x28
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #7
	str r0, [r2]
	add r0, r7, #0
	bl ov42_02228188
	bl ov45_0223099C
	add r6, r0, #0
	ldr r0, [r5]
	mov r1, #0x7f
	bl sub_020256C8
	bl sub_020256FC
	ldrh r1, [r6, #2]
	str r0, [sp, #0x14]
	ldr r0, [r5, #8]
	lsl r1, r1, #0x11
	lsr r1, r1, #0x11
	bl sub_02025940
	str r0, [sp, #0x18]
	bl sub_0202599C
	str r0, [sp, #0x10]
	ldrh r0, [r6, #2]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _02230770
	ldr r1, _02230878 ; =0x00000119
	b _02230774
_02230770:
	mov r1, #0x46
	lsl r1, r1, #2
_02230774:
	ldr r0, [r5, #4]
	bl sub_020256C8
	bl sub_020256FC
	add r1, sp, #0x40
	bl sub_02026E18
	ldrh r0, [r6, #2]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _022307A0
	add r0, sp, #0x40
	str r0, [sp]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, _0223087C ; =ov45_02254C98
	add r0, sp, #0x70
	bl sub_02023E2C
	b _022307CE
_022307A0:
	ldr r0, [sp, #0x18]
	bl sub_02025A9C
	add r6, r0, #0
	ldr r0, [sp, #0x18]
	bl sub_02025AAC
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	bl sub_02025ABC
	add r1, sp, #0x40
	str r1, [sp]
	ldr r1, [sp, #0x1c]
	str r6, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, _0223087C ; =ov45_02254C98
	add r0, sp, #0x70
	bl sub_02023E04
_022307CE:
	add r0, r7, #0
	bl ov42_022282DC
	add r1, sp, #0x20
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r2, [r1]
	add r0, sp, #0x24
	strh r2, [r1, #4]
	ldrh r2, [r1, #2]
	strh r2, [r1, #6]
	add r1, sp, #0x34
	bl ov49_02258800
	mov r0, #1
	ldr r1, [sp, #0x3c]
	lsl r0, r0, #0x10
	add r0, r1, r0
	str r0, [sp, #0x3c]
	ldr r0, [r5, #0xc]
	add r3, sp, #0x34
	str r0, [sp, #0x50]
	add r0, sp, #0x70
	str r0, [sp, #0x54]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x58
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r3, sp, #0x28
	str r0, [r2]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x64
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add r0, sp, #0x50
	bl sub_02023D44
	ldr r1, _02230880 ; =ov45_02230E64
	add r2, r4, #0
	str r0, [r4, #8]
	bl sub_02023FE4
	add r0, r5, #0
	add r1, r4, #0
	add r0, #0x18
	add r1, #0xc
	bl ov45_02230A5C
	mov r2, #2
	lsl r2, r2, #0xc
	add r0, r4, #0
	ldr r6, [sp, #0x3c]
	lsl r3, r2, #2
	ldr r1, [sp, #0x34]
	add r0, #0xc
	sub r3, r6, r3
	bl sub_020182A8
	ldrb r1, [r4]
	mov r0, #0xf
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r4]
	ldrb r1, [r4]
	mov r0, #0xc0
	bic r1, r0
	mov r0, #0x40
	orr r0, r1
	strb r0, [r4]
	ldrb r1, [r4]
	mov r0, #0x30
	bic r1, r0
	strb r1, [r4]
	add r0, r4, #0
	ldr r1, [r5, #0x2c]
	add r0, #0x8c
	str r1, [r0]
	add r0, r4, #0
	add sp, #0x98
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02230874: .word ov45_02254C3C
_02230878: .word 0x00000119
_0223087C: .word ov45_02254C98
_02230880: .word ov45_02230E64
	thumb_func_end ov45_0223070C

	thumb_func_start ov45_02230884
ov45_02230884: ; 0x02230884
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl sub_02023DA4
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x90
	bl memset
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_02230884

	thumb_func_start ov45_0223089C
ov45_0223089C: ; 0x0223089C
	ldrb r3, [r0]
	mov r2, #0xf
	lsl r1, r1, #0x18
	bic r3, r2
	lsr r2, r1, #0x18
	mov r1, #0xf
	and r1, r2
	orr r1, r3
	strb r1, [r0]
	bx lr
	thumb_func_end ov45_0223089C

	thumb_func_start ov45_022308B0
ov45_022308B0: ; 0x022308B0
	add r0, #0x8c
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_022308B0

	thumb_func_start ov45_022308B8
ov45_022308B8: ; 0x022308B8
	ldrb r0, [r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1e
	bx lr
	thumb_func_end ov45_022308B8

	thumb_func_start ov45_022308C0
ov45_022308C0: ; 0x022308C0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, r1, #0
	add r1, sp, #0
	bl ov49_02258800
	mov r0, #1
	ldr r1, [sp, #8]
	lsl r0, r0, #0x10
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, sp, #0
	bl ov45_022308E4
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov45_022308C0

	thumb_func_start ov45_022308E4
ov45_022308E4: ; 0x022308E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	add r4, r1, #0
	bl sub_02023E50
	mov r2, #2
	ldr r1, [r4]
	lsl r2, r2, #0xc
	add r5, #0xc
	ldr r4, [r4, #8]
	lsl r3, r2, #2
	add r0, r5, #0
	sub r3, r4, r3
	bl sub_020182A8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov45_022308E4

	thumb_func_start ov45_02230908
ov45_02230908: ; 0x02230908
	push {r4, lr}
	ldr r0, [r0, #8]
	add r4, r1, #0
	bl sub_02023E68
	add r2, r0, #0
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_02230908

	thumb_func_start ov45_02230920
ov45_02230920: ; 0x02230920
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	bl ov45_022309C4
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl sub_02023EE0
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023F40
	pop {r4, pc}
	thumb_func_end ov45_02230920

	thumb_func_start ov45_0223093C
ov45_0223093C: ; 0x0223093C
	push {r3, r4}
	ldrb r3, [r0, #1]
	mov r2, #1
	lsl r1, r1, #0x18
	bic r3, r2
	add r2, r3, #0
	mov r4, #1
	orr r2, r4
	strb r2, [r0, #1]
	lsr r1, r1, #0x18
	lsl r1, r1, #0x19
	ldrb r2, [r0, #1]
	mov r3, #0xfe
	lsr r1, r1, #0x18
	bic r2, r3
	orr r1, r2
	strb r1, [r0, #1]
	mov r1, #0
	strb r1, [r0, #2]
	strb r4, [r0, #3]
	pop {r3, r4}
	bx lr
	thumb_func_end ov45_0223093C

	thumb_func_start ov45_02230968
ov45_02230968: ; 0x02230968
	ldrb r2, [r0, #1]
	mov r1, #1
	bic r2, r1
	strb r2, [r0, #1]
	bx lr
	.balign 4, 0
	thumb_func_end ov45_02230968

	thumb_func_start ov45_02230974
ov45_02230974: ; 0x02230974
	strb r1, [r0, #3]
	bx lr
	thumb_func_end ov45_02230974

	thumb_func_start ov45_02230978
ov45_02230978: ; 0x02230978
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1e
	ldrb r2, [r0]
	mov r3, #0xc0
	lsr r1, r1, #0x18
	bic r2, r3
	orr r1, r2
	ldr r3, _02230990 ; =ov45_02230E28
	strb r1, [r0]
	bx r3
	nop
_02230990: .word ov45_02230E28
	thumb_func_end ov45_02230978

	thumb_func_start ov45_02230994
ov45_02230994: ; 0x02230994
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	bx lr
	thumb_func_end ov45_02230994

	thumb_func_start ov45_0223099C
ov45_0223099C: ; 0x0223099C
	push {r3, lr}
	ldr r3, _022309C0 ; =ov45_02254C48
	mov r2, #0
_022309A2:
	ldrh r1, [r3]
	cmp r0, r1
	bne _022309B0
	ldr r1, _022309C0 ; =ov45_02254C48
	lsl r0, r2, #2
	add r0, r1, r0
	pop {r3, pc}
_022309B0:
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, #0x14
	blt _022309A2
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_022309C0: .word ov45_02254C48
	thumb_func_end ov45_0223099C

	thumb_func_start ov45_022309C4
ov45_022309C4: ; 0x022309C4
	cmp r0, #0
	bne _022309CA
	add r1, r1, #4
_022309CA:
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov45_022309C4

	thumb_func_start ov45_022309D0
ov45_022309D0: ; 0x022309D0
	push {r3, lr}
	add r3, r0, #0
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	add r0, r1, #0
	mul r0, r2
	add r1, r3, #0
	bl _u32_div_f
	lsl r0, r0, #0xc
	pop {r3, pc}
	thumb_func_end ov45_022309D0

	thumb_func_start ov45_022309E8
ov45_022309E8: ; 0x022309E8
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	add r0, sp, #0
	bl ov49_02258830
	ldr r0, [sp]
	str r0, [r4]
	bl NNS_G3dGetMdlSet
	str r0, [r4, #4]
	cmp r0, #0
	beq _02230A22
	add r2, r0, #0
	add r2, #8
	beq _02230A16
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _02230A16
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _02230A18
_02230A16:
	mov r1, #0
_02230A18:
	cmp r1, #0
	beq _02230A22
	ldr r1, [r1]
	add r0, r0, r1
	b _02230A24
_02230A22:
	mov r0, #0
_02230A24:
	str r0, [r4, #8]
	ldr r0, [r4]
	bl NNS_G3dGetTex
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	bl Bind3dModelSet
	ldr r0, [r4, #8]
	mov r1, #0x14
	bl NNS_G3dMdlSetMdlPolygonIDAll
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov45_022309E8

	thumb_func_start ov45_02230A44
ov45_02230A44: ; 0x02230A44
	ldr r3, _02230A48 ; =sub_02018068
	bx r3
	.balign 4, 0
_02230A48: .word sub_02018068
	thumb_func_end ov45_02230A44

	thumb_func_start ov45_02230A4C
ov45_02230A4C: ; 0x02230A4C
	ldr r3, _02230A54 ; =NNS_G3dMdlSetMdlAlphaAll
	str r1, [r0, #0x10]
	ldr r0, [r0, #8]
	bx r3
	.balign 4, 0
_02230A54: .word NNS_G3dMdlSetMdlAlphaAll
	thumb_func_end ov45_02230A4C

	thumb_func_start ov45_02230A58
ov45_02230A58: ; 0x02230A58
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end ov45_02230A58

	thumb_func_start ov45_02230A5C
ov45_02230A5C: ; 0x02230A5C
	ldr r3, _02230A68 ; =sub_020181B0
	add r2, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	bx r3
	nop
_02230A68: .word sub_020181B0
	thumb_func_end ov45_02230A5C

	thumb_func_start ov45_02230A6C
ov45_02230A6C: ; 0x02230A6C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	mov r6, #0
	cmp r0, #0
	bls _02230A9A
	add r4, r6, #0
_02230A7A:
	ldr r0, [r5, #0x10]
	add r0, r0, r4
	bl ov45_02230AA4
	cmp r0, #0
	bne _02230A90
	mov r0, #0x90
	ldr r1, [r5, #0x10]
	mul r0, r6
	add r0, r1, r0
	pop {r4, r5, r6, pc}
_02230A90:
	ldr r0, [r5, #0x14]
	add r6, r6, #1
	add r4, #0x90
	cmp r6, r0
	blo _02230A7A
_02230A9A:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov45_02230A6C

	thumb_func_start ov45_02230AA4
ov45_02230AA4: ; 0x02230AA4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02230AAE
	mov r0, #1
	bx lr
_02230AAE:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov45_02230AA4

	thumb_func_start ov45_02230AB4
ov45_02230AB4: ; 0x02230AB4
	ldr r3, _02230ABC ; =memset
	mov r1, #0
	mov r2, #0x90
	bx r3
	.balign 4, 0
_02230ABC: .word memset
	thumb_func_end ov45_02230AB4

	thumb_func_start ov45_02230AC0
ov45_02230AC0: ; 0x02230AC0
	ldr r3, _02230AC8 ; =sub_020181EC
	add r0, #0xc
	bx r3
	nop
_02230AC8: .word sub_020181EC
	thumb_func_end ov45_02230AC0

	thumb_func_start ov45_02230ACC
ov45_02230ACC: ; 0x02230ACC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldrb r0, [r5]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	beq _02230B5C
	ldr r0, [r5, #4]
	mov r1, #5
	bl ov42_02228188
	add r4, r0, #0
	ldr r0, [r5, #4]
	mov r1, #8
	bl ov42_02228188
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x86
	ldrh r0, [r0]
	cmp r0, r6
	bhi _02230B02
	add r0, r5, #0
	add r0, #0x84
	ldrb r0, [r0]
	cmp r0, r4
	beq _02230B2E
_02230B02:
	add r0, r5, #0
	add r0, #0x84
	ldrb r0, [r0]
	bl ov45_02230DC4
	cmp r0, #1
	bne _02230B28
	ldr r0, [r5, #8]
	bl sub_02023EF4
	add r1, r5, #0
	add r1, #0x85
	strb r0, [r1]
	ldr r0, [r5, #8]
	bl sub_02023F70
	add r1, r5, #0
	add r1, #0x88
	str r0, [r1]
_02230B28:
	add r0, r5, #0
	add r0, #0x84
	strb r4, [r0]
_02230B2E:
	ldr r1, _02230B60 ; =ov45_02254F28
	add r0, r5, #0
	lsl r2, r4, #2
	add r0, #0x86
	strh r6, [r0]
	ldr r1, [r1, r2]
	add r0, r5, #0
	blx r1
	ldr r0, [r5, #4]
	bl ov42_022282F4
	add r2, sp, #0
	strh r0, [r2]
	lsr r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	add r1, sp, #4
	strh r0, [r2, #4]
	ldrh r0, [r2, #2]
	strh r0, [r2, #6]
	add r0, r5, #0
	bl ov45_022308C0
_02230B5C:
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02230B60: .word ov45_02254F28
	thumb_func_end ov45_02230ACC

	thumb_func_start ov45_02230B64
ov45_02230B64: ; 0x02230B64
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #6
	bl ov42_02228188
	add r1, r0, #0
	mov r0, #1
	bl ov45_022309C4
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl sub_02023EE0
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023F40
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_02230B64

	thumb_func_start ov45_02230B8C
ov45_02230B8C: ; 0x02230B8C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	mov r1, #6
	bl ov42_02228188
	add r1, r0, #0
	mov r0, #1
	bl ov45_022309C4
	add r4, r0, #0
	ldr r0, [r5, #4]
	mov r1, #9
	bl ov42_02228188
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r0, [r5, #4]
	mov r1, #8
	bl ov42_02228188
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	add r0, r6, #0
	mov r2, #8
	bl ov45_022309D0
	add r6, r0, #0
	ldr r0, [r5, #8]
	add r1, r4, #0
	bl sub_02023EE0
	add r0, r5, #0
	add r0, #0x85
	ldrb r0, [r0]
	cmp r0, r4
	ldr r0, [r5, #8]
	bne _02230BEC
	mov r1, #0
	bl sub_02023F40
	ldr r0, [r5, #8]
	add r5, #0x88
	ldr r1, [r5]
	add r1, r6, r1
	bl sub_02023F04
	pop {r4, r5, r6, pc}
_02230BEC:
	mov r1, #0
	bl sub_02023F40
	ldr r0, [r5, #8]
	add r1, r6, #0
	bl sub_02023F04
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_02230B8C

	thumb_func_start ov45_02230BFC
ov45_02230BFC: ; 0x02230BFC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #8
	bl ov42_02228188
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #4
	bhs _02230C1C
	mov r1, #1
	ldr r0, [r4, #8]
	lsl r1, r1, #0xe
	bl sub_02023F40
	pop {r4, pc}
_02230C1C:
	ldr r0, [r4, #4]
	mov r1, #6
	bl ov42_02228188
	add r1, r0, #0
	mov r0, #1
	bl ov45_022309C4
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl sub_02023EE0
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023F40
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_02230BFC

	thumb_func_start ov45_02230C40
ov45_02230C40: ; 0x02230C40
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	mov r1, #6
	bl ov42_02228188
	add r1, r0, #0
	mov r0, #0
	bl ov45_022309C4
	add r4, r0, #0
	ldr r0, [r5, #4]
	mov r1, #9
	bl ov42_02228188
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r0, [r5, #4]
	mov r1, #8
	bl ov42_02228188
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	add r0, r6, #0
	mov r2, #4
	bl ov45_022309D0
	add r6, r0, #0
	ldr r0, [r5, #8]
	add r1, r4, #0
	bl sub_02023EE0
	add r0, r5, #0
	add r0, #0x85
	ldrb r0, [r0]
	cmp r0, r4
	ldr r0, [r5, #8]
	bne _02230CA0
	mov r1, #0
	bl sub_02023F40
	ldr r0, [r5, #8]
	add r5, #0x88
	ldr r1, [r5]
	add r1, r6, r1
	bl sub_02023F04
	pop {r4, r5, r6, pc}
_02230CA0:
	mov r1, #0
	bl sub_02023F40
	ldr r0, [r5, #8]
	add r1, r6, #0
	bl sub_02023F04
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_02230C40

	thumb_func_start ov45_02230CB0
ov45_02230CB0: ; 0x02230CB0
	push {r3, lr}
	ldrb r1, [r0]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bne _02230CD0
	ldrb r1, [r0, #1]
	lsl r2, r1, #0x1f
	lsr r2, r2, #0x1f
	cmp r2, #1
	bne _02230CD0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x19
	lsl r2, r1, #2
	ldr r1, _02230CD4 ; =ov45_02254F1C
	ldr r1, [r1, r2]
	blx r1
_02230CD0:
	pop {r3, pc}
	nop
_02230CD4: .word ov45_02254F1C
	thumb_func_end ov45_02230CB0

	thumb_func_start ov45_02230CD8
ov45_02230CD8: ; 0x02230CD8
	push {r4, lr}
	add r4, r0, #0
	ldrb r3, [r4, #2]
	mov r0, #0x1e
	lsr r2, r3, #0x1f
	lsl r1, r3, #0x1e
	sub r1, r1, r2
	ror r1, r0
	add r0, r2, r1
	bne _02230D08
	ldr r1, _02230D1C ; =ov45_02254C34
	lsr r2, r3, #2
	ldrb r1, [r1, r2]
	mov r0, #1
	bl ov45_022309C4
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl sub_02023EE0
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023F40
_02230D08:
	ldrb r1, [r4, #3]
	ldrb r0, [r4, #2]
	add r0, r0, r1
	cmp r0, #0x10
	bge _02230D16
	strb r0, [r4, #2]
	pop {r4, pc}
_02230D16:
	mov r0, #0
	strb r0, [r4, #2]
	pop {r4, pc}
	.balign 4, 0
_02230D1C: .word ov45_02254C34
	thumb_func_end ov45_02230CD8

	thumb_func_start ov45_02230D20
ov45_02230D20: ; 0x02230D20
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _02230D5A
	ldr r0, [r4, #4]
	mov r1, #6
	bl ov42_02228188
	ldr r0, [r4, #4]
	mov r1, #6
	bl ov42_02228188
	add r1, r0, #0
	mov r0, #1
	bl ov45_022309C4
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl sub_02023EE0
	mov r1, #1
	ldr r0, [r4, #8]
	lsl r1, r1, #0xe
	bl sub_02023F40
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
_02230D5A:
	pop {r4, pc}
	thumb_func_end ov45_02230D20

	thumb_func_start ov45_02230D5C
ov45_02230D5C: ; 0x02230D5C
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _02230D8A
	ldr r0, [r4, #4]
	mov r1, #6
	bl ov42_02228188
	add r1, r0, #0
	mov r0, #1
	bl ov45_022309C4
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl sub_02023EE0
	mov r1, #1
	ldr r0, [r4, #8]
	lsl r1, r1, #0xe
	bl sub_02023F40
	b _02230DB0
_02230D8A:
	cmp r0, #4
	bne _02230DB0
	ldr r0, [r4, #4]
	mov r1, #6
	bl ov42_02228188
	add r1, r0, #0
	mov r0, #1
	bl ov45_022309C4
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl sub_02023EE0
	mov r1, #3
	ldr r0, [r4, #8]
	lsl r1, r1, #0xe
	bl sub_02023F40
_02230DB0:
	ldrb r0, [r4, #2]
	add r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1d
	sub r1, r1, r2
	mov r0, #0x1d
	ror r1, r0
	add r0, r2, r1
	strb r0, [r4, #2]
	pop {r4, pc}
	thumb_func_end ov45_02230D5C

	thumb_func_start ov45_02230DC4
ov45_02230DC4: ; 0x02230DC4
	cmp r0, #0xb
	bhi _02230DF0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230DD4: ; jump table
	.short _02230DF0 - _02230DD4 - 2 ; case 0
	.short _02230DF0 - _02230DD4 - 2 ; case 1
	.short _02230DEC - _02230DD4 - 2 ; case 2
	.short _02230DEC - _02230DD4 - 2 ; case 3
	.short _02230DF0 - _02230DD4 - 2 ; case 4
	.short _02230DEC - _02230DD4 - 2 ; case 5
	.short _02230DEC - _02230DD4 - 2 ; case 6
	.short _02230DF0 - _02230DD4 - 2 ; case 7
	.short _02230DF0 - _02230DD4 - 2 ; case 8
	.short _02230DF0 - _02230DD4 - 2 ; case 9
	.short _02230DEC - _02230DD4 - 2 ; case 10
	.short _02230DEC - _02230DD4 - 2 ; case 11
_02230DEC:
	mov r0, #1
	bx lr
_02230DF0:
	mov r0, #0
	bx lr
	thumb_func_end ov45_02230DC4

	thumb_func_start ov45_02230DF4
ov45_02230DF4: ; 0x02230DF4
	push {r4, lr}
	add r4, r0, #0
	bl ov45_02230AA4
	cmp r0, #0
	beq _02230E24
	ldr r0, [r4, #8]
	bl ov45_02230E78
	cmp r0, #0
	ldrb r1, [r4]
	bne _02230E18
	mov r0, #0x30
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strb r0, [r4]
	b _02230E1E
_02230E18:
	mov r0, #0x30
	bic r1, r0
	strb r1, [r4]
_02230E1E:
	add r0, r4, #0
	bl ov45_02230E28
_02230E24:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_02230DF4

	thumb_func_start ov45_02230E28
ov45_02230E28: ; 0x02230E28
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4]
	lsl r1, r0, #0x1a
	lsr r1, r1, #0x1e
	bne _02230E50
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	cmp r0, #1
	bne _02230E50
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02023EA4
	add r4, #0xc
	add r0, r4, #0
	mov r1, #1
	bl sub_020182A0
	pop {r4, pc}
_02230E50:
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02023EA4
	add r4, #0xc
	add r0, r4, #0
	mov r1, #0
	bl sub_020182A0
	pop {r4, pc}
	thumb_func_end ov45_02230E28

	thumb_func_start ov45_02230E64
ov45_02230E64: ; 0x02230E64
	push {r4, lr}
	add r4, r1, #0
	bl sub_02023FDC
	add r4, #0x8c
	ldr r1, [r4]
	bl NNS_G3dMdlSetMdlLightEnableFlagAll
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov45_02230E64

	thumb_func_start ov45_02230E78
ov45_02230E78: ; 0x02230E78
	push {r3, r4, r5, r6, lr}
	sub sp, #0x44
	add r5, r0, #0
	bl sub_02023F90
	cmp r0, #0
	beq _02230E8C
	add r4, r0, #0
	add r4, #0x14
	b _02230E8E
_02230E8C:
	mov r4, #0
_02230E8E:
	add r0, r5, #0
	bl sub_02023E68
	add r3, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x38
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0
	str r0, [r2]
	mov r0, #0x1e
	ldrsh r0, [r4, r0]
	strh r0, [r1, #0x24]
	mov r0, #0x20
	ldrsh r2, [r4, r0]
	strh r2, [r1, #0x26]
	ldrsh r0, [r4, r0]
	strh r0, [r1, #0x28]
	ldr r0, [r4, #0x24]
	asr r0, r0, #0xc
	str r0, [sp, #0x2c]
	ldr r0, [r4, #0x24]
	asr r0, r0, #0xc
	str r0, [sp, #0x30]
	ldr r0, [r4, #0x24]
	asr r0, r0, #0xc
	str r0, [sp, #0x34]
	mov r0, #0x18
	ldrsh r0, [r4, r0]
	ldr r2, [r4, #0x24]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r3, #2
	mov r6, #0
	lsl r3, r3, #0xa
	add r3, r0, r3
	adc r1, r6
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	ldr r2, [sp, #0x38]
	orr r1, r0
	add r0, r2, r1
	str r0, [sp, #0x38]
	mov r0, #0x1a
	ldrsh r0, [r4, r0]
	ldr r2, [r4, #0x24]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r3, #2
	lsl r3, r3, #0xa
	add r3, r0, r3
	adc r1, r6
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	ldr r2, [sp, #0x3c]
	orr r1, r0
	add r0, r2, r1
	str r0, [sp, #0x3c]
	mov r0, #0x1c
	ldrsh r0, [r4, r0]
	ldr r2, [r4, #0x24]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r3, #2
	lsl r3, r3, #0xa
	add r3, r0, r3
	adc r1, r6
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	ldr r2, [sp, #0x40]
	orr r1, r0
	add r0, r2, r1
	str r0, [sp, #0x40]
	mov r0, #0x20
	ldrsh r0, [r4, r0]
	ldr r2, [r4, #0x24]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r3, #2
	add r4, r6, #0
	lsl r3, r3, #0xa
	add r3, r0, r3
	adc r1, r4
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	ldr r2, [sp, #0x40]
	orr r1, r0
	sub r0, r2, r1
	str r0, [sp, #0x40]
	add r0, sp, #0
	bl MTX_Identity33_
	ldr r1, _02230F8C ; =NNS_G3dGlb + 0xBC
	add r0, sp, #0
	bl MI_Copy36B
	ldr r1, _02230F90 ; =NNS_G3dGlb + 0x80
	mov r0, #0xa4
	ldr r2, [r1, #0x7c]
	bic r2, r0
	add r0, r5, #0
	str r2, [r1, #0x7c]
	bl sub_02023E94
	bl NNS_G3dGlbSetBaseScale
	add r0, sp, #0x38
	add r1, sp, #0x24
	bl sub_0201FA34
	cmp r0, #0
	bne _02230F84
	add sp, #0x44
	add r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_02230F84:
	mov r0, #1
	add sp, #0x44
	pop {r3, r4, r5, r6, pc}
	nop
_02230F8C: .word NNS_G3dGlb + 0xBC
_02230F90: .word NNS_G3dGlb + 0x80
	thumb_func_end ov45_02230E78

	thumb_func_start ov45_02230F94
ov45_02230F94: ; 0x02230F94
	push {r0, r1, r2, r3}
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r3, #0
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x62
	add r1, r7, #0
	bl NARC_ctor
	add r1, sp, #0xc
	str r1, [sp]
	add r1, r7, #0
	mov r2, #0xdb
	mov r3, #3
	add r4, r0, #0
	bl ov45_02231018
	add r0, sp, #8
	str r0, [sp]
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	add r3, r6, #0
	bl ov45_02231018
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	sub r0, r1, r0
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0x18
	mul r0, r1
	ldr r1, _02231014 ; =0x0000FFFF
	bl _s32_div_f
	cmp r0, #0
	bge _02230FE2
	add r0, #0x18
_02230FE2:
	cmp r0, #0x18
	blt _02230FEE
	mov r1, #0x18
	bl _s32_div_f
	add r0, r1, #0
_02230FEE:
	add r2, sp, #4
	mov r1, #0
	str r1, [r2]
	add r1, sp, #4
	strb r0, [r1]
	add r0, r2, #0
	add r1, sp, #0x30
	bl ov45_0222D524
	add r0, r4, #0
	bl NARC_dtor
	ldr r0, [sp, #4]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	nop
_02231014: .word 0x0000FFFF
	thumb_func_end ov45_02230F94

	thumb_func_start ov45_02231018
ov45_02231018: ; 0x02231018
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r1, [sp, #0xc]
	str r3, [sp, #0x10]
	mov r7, #0
	add r5, r2, #0
	str r7, [sp]
	add r1, sp, #0x18
	str r1, [sp, #4]
	ldr r3, [sp, #0xc]
	mov r1, #0x12
	add r2, r7, #0
	str r0, [sp, #8]
	ldr r4, [sp, #0x30]
	bl GfGfxLoader_LoadFromOpenNarc_GetSizeOut
	add r6, r0, #0
	ldr r0, [sp, #0x18]
	mov r1, #6
	bl _u32_div_f
	cmp r5, r0
	blt _0223104A
	bl GF_AssertFail
_0223104A:
	mov r0, #6
	add r1, r5, #0
	mul r1, r0
	ldrh r0, [r6, r1]
	cmp r0, #2
	beq _02231060
	add r1, r6, r1
	mov r0, #4
	ldrsh r0, [r1, r0]
	mov r7, #1
	str r0, [r4]
_02231060:
	add r0, r6, #0
	bl FreeToHeap
	cmp r7, #0
	bne _022310AC
	add r0, r5, #0
	bl LocationGmmDatIndexGetByCountryMsgNo
	bl LocationGmmDatGetEarthPlaceDatId
	mov r2, #0
	add r1, r0, #0
	str r2, [sp]
	add r0, sp, #0x14
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r3, [sp, #0xc]
	bl GfGfxLoader_LoadFromOpenNarc_GetSizeOut
	add r5, r0, #0
	ldr r0, [sp, #0x14]
	lsr r1, r0, #2
	ldr r0, [sp, #0x10]
	cmp r0, r1
	bge _0223109C
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #2
	ldrsh r0, [r1, r0]
	b _022310A4
_0223109C:
	bl GF_AssertFail
	mov r0, #2
	ldrsh r0, [r5, r0]
_022310A4:
	str r0, [r4]
	add r0, r5, #0
	bl FreeToHeap
_022310AC:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov45_02231018

	.rodata

_02254A28:
	.byte 0x02, 0x00, 0x50, 0x00, 0x01, 0x00, 0x02, 0x00
	.byte 0x03, 0x00, 0x8E, 0x00, 0x01, 0x00, 0x02, 0x00, 0x04, 0x00, 0x1E, 0x00

ov45_02254A3C: ; 0x02254A3C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x68, 0x01, 0x00, 0x00, 0xD0, 0x02, 0x00, 0x00, 0xB0, 0x04, 0x00, 0x00, 0x18, 0x06, 0x00, 0x00
	.byte 0x80, 0x07, 0x00, 0x00, 0x60, 0x09, 0x00, 0x00, 0xC8, 0x0A, 0x00, 0x00, 0x30, 0x0C, 0x00, 0x00

ov45_02254A60: ; 0x02254A60
	.word ov45_0222BE9C
	.word ov45_0222BF18
	.word ov45_0222BF98
	.word ov45_0222C0CC
	.word ov45_0222C130
	.word ov45_0222C1EC
	.word ov45_0222C36C
	.word ov45_0222C36C
	.word ov45_0222C2A8

ov45_02254A84: ; 0x02254A84
	.byte 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x3E, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x07, 0x00, 0x01, 0x00, 0x0D, 0x00, 0x01, 0x00
	.byte 0x0E, 0x00, 0x01, 0x00, 0x23, 0x00, 0x01, 0x00, 0x25, 0x00, 0x01, 0x00, 0x2A, 0x00, 0x01, 0x00
	.byte 0x3F, 0x00, 0x01, 0x00

ov45_02254AC4: ; 0x02254AC4
	.word ov45_0222C688
	.byte 0x04, 0x00, 0x00, 0x00
	.word ov45_0222C73C
	.byte 0x04, 0x00, 0x00, 0x00
	.word ov45_0222C79C
	.byte 0x04, 0x00, 0x00, 0x00
	.word ov45_0222C800
	.byte 0x04, 0x00, 0x00, 0x00
	.word ov45_0222C828
	.byte 0x14, 0x00, 0x00, 0x00
	.word ov45_0222C83C
	.byte 0x04, 0x00, 0x00, 0x00
	.word ov45_0222C858
	.byte 0x04, 0x00, 0x00, 0x00
	.word ov45_0222C88C
	.byte 0x04, 0x00, 0x00, 0x00

ov45_02254B04: ; 0x02254B04
	.word ov46_02258CB4
	.word ov46_02258DA8
	.word ov46_02258EFC
	.word FS_OVERLAY_ID(OVY_46)

ov45_02254B14: ; 0x02254B14
	.word ov89_02258800
	.word ov89_02258B04
	.word ov89_02258F00
	.word FS_OVERLAY_ID(OVY_89)

ov45_02254B24: ; 0x02254B24
	.word ov89_02258800
	.word ov89_02258B04
	.word ov89_02258F00
	.word FS_OVERLAY_ID(OVY_89)

ov45_02254B34: ; 0x02254B34
	.word ov93_0225C540
	.word ov93_0225C574
	.word ov93_0225C6C0
	.word FS_OVERLAY_ID(OVY_93)

ov45_02254B44: ; 0x02254B44
	.word ov47_02258800
	.word ov47_02258898
	.word ov47_022589A8
	.word FS_OVERLAY_ID(OVY_47)

ov45_02254B54: ; 0x02254B54
	.word ov91_0225C540
	.word ov91_0225C58C
	.word ov91_0225C9EC
	.word FS_OVERLAY_ID(OVY_91)

ov45_02254B64: ; 0x02254B64
	.word ov46_02258800
	.word ov46_0225892C
	.word ov46_02258C38
	.word FS_OVERLAY_ID(OVY_46)

ov45_02254B74: ; 0x02254B74
	.word ov88_02258800
	.word ov88_022588C4
	.word ov88_022589FC
	.word FS_OVERLAY_ID(OVY_88)

ov45_02254B84: ; 0x02254B84
	.word ov48_02258800
	.word ov48_02258920
	.word ov48_022589FC
	.word FS_OVERLAY_ID(OVY_48)

ov45_02254B94: ; 0x02254B94
	.word ov49_02259AA4
	.word ov49_02259C90
	.word ov49_02259EF8
	.word FS_OVERLAY_ID(OVY_49)

ov45_02254BA4: ; 0x02254BA4
	.word ov92_0225CAB4
	.word ov92_0225CDF4
	.word ov92_0225D36C
	.word FS_OVERLAY_ID(OVY_92)

ov45_02254BB4: ; 0x02254BB4
	.byte 0x09, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x0A, 0x0B
	.byte 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x00, 0x00

ov45_02254BC8: ; 0x02254BC8
	.byte 0x0B, 0x0A

ov45_02254BCA: ; 0x02254BCA
	.byte 0x09, 0x00, 0x16, 0x00, 0x18, 0x00
	.byte 0x19, 0x00

ov45_02254BD2: ; 0x02254BD2
	.byte 0x1A, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x1C, 0x00, 0x17, 0x00

ov45_02254BDC: ; 0x02254BDC
	.byte 0x04, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov45_02254BE8: ; 0x02254BE8
	.word ov45_0222E540
	.word ov45_0222E550
	.word ov45_0222E560
	.word ov45_0222E574
	.word ov45_0222E584
	.word ov45_0222E584
	.word ov45_0222E598
	.word ov45_0222E59C
	.word ov45_0222E5A0

ov45_02254C0C: ; 0x02254C0C
	.word ov45_0222E14C
	.word ov45_0222E1A0
	.word ov45_0222E200
	.word ov45_0222E33C
	.word ov45_0222E39C
	.word ov45_0222E39C
	.word ov45_0222E414
	.word ov45_0222E484
	.word ov45_0222E4A8

ov45_02254C30: ; 0x02254C30
	.byte 0x08, 0x08, 0x04, 0x04

ov45_02254C34: ; 0x02254C34
	.byte 0x01, 0x02, 0x00, 0x03

ov45_02254C38: ; 0x02254C38
	.byte 0x18, 0x01, 0x19, 0x01

ov45_02254C3C: ; 0x02254C3C
	.byte 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov45_02254C48: ; 0x02254C48
	.byte 0x00, 0x00, 0x45, 0x80, 0x61, 0x00, 0x46, 0x80
	.byte 0x03, 0x00, 0x02, 0x00, 0x05, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0A, 0x00, 0x1F, 0x00, 0x24, 0x00
	.byte 0x32, 0x00, 0x2F, 0x00, 0x33, 0x00, 0x30, 0x00, 0x3E, 0x00, 0x1B, 0x00, 0x46, 0x00, 0x21, 0x00
	.byte 0x06, 0x00, 0x05, 0x00, 0x07, 0x00, 0x06, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0E, 0x00
	.byte 0x23, 0x00, 0x26, 0x00, 0x25, 0x00, 0x28, 0x00, 0x2A, 0x00, 0x2B, 0x00, 0x3F, 0x00, 0x1C, 0x00
	.byte 0x1E, 0x01, 0x66, 0x00, 0x1D, 0x01, 0x65, 0x00

ov45_02254C98: ; 0x02254C98
	.byte 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x3F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x4F, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00
	.byte 0x7F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00

	.data

_02254E20:
	.word ov45_0222CF24
	.word ov45_0222D01C
	.word ov45_0222D0BC
	.word ov45_0222D380
	.word ov45_0222D380
	.word ov45_0222D130
	.word ov45_0222D19C
	.word ov45_0222D23C
	.word ov45_0222D2E4
	.word ov45_0222D410
	.word ov45_0222D410
	.word ov45_0222D4C0
	.word ov45_0222D4C0

ov45_02254E54: ; 0x02254E54
	.word ov45_0222CF40
	.word ov45_0222D028
	.word ov45_0222D0C8
	.word ov45_0222D3B0
	.word ov45_0222D3C4
	.word ov45_0222D13C
	.word ov45_0222D1B0
	.word ov45_0222D250
	.word ov45_0222D2F8
	.word ov45_0222D41C
	.word ov45_0222D428
	.word ov45_0222D4CC
	.word ov45_0222D4CC

ov45_02254E88: ; 0x02254E88
	.word ov45_0222CF00
	.word ov45_0222CFF4
	.word ov45_0222D078
	.word ov45_0222D354
	.word ov45_0222D354
	.word ov45_0222D0FC
	.word ov45_0222D164
	.word ov45_0222D20C
	.word ov45_0222D2AC
	.word ov45_0222D3D8
	.word ov45_0222D3D8
	.word ov45_0222D44C
	.word ov45_0222D484

ov45_02254EBC: ; 0x02254EBC
	.word ov45_0222CF68
	.word ov45_0222D054
	.word ov45_0222D0D8
	.word ov45_0222D38C
	.word ov45_0222D38C
	.word ov45_0222D14C
	.word ov45_0222D1DC
	.word ov45_0222D27C
	.word ov45_0222D324
	.word ov45_0222D448
	.word ov45_0222D448
	.word ov45_0222D4DC
	.word ov45_0222D4DC

ov45_02254EF0: ; 0x02254EF0
	.word ov45_02254EF4

	.balign 4, 0
ov45_02254EF4:
	.asciz "b_lby_wlddata"

	.balign 4, 0
ov45_02254F04: ; 0x02254F04
	.asciz "pokemonplatds"

	.balign 4, 0
ov45_02254F14: ; 0x02254F14
	.asciz "IIup73"

	.balign 4, 0
ov45_02254F1C: ; 0x02254F1C
	.word ov45_02230CD8
	.word ov45_02230D20
	.word ov45_02230D5C

ov45_02254F28: ; 0x02254F28
	.word ov45_02230B64
	.word ov45_02230BFC
	.word ov45_02230B8C
	.word ov45_02230C40
	.word ov45_02230B64
	.word ov45_02230B8C
	.word ov45_02230B8C
	.word ov45_02230B8C
	.word ov45_02230B8C
	.word ov45_02230B8C
	.word ov45_02230B8C
	.word 0

	.bss

_022577C0:
	.space 0x4
