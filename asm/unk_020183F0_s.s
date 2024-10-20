	.include "asm/macros.inc"
	.include "unk_020183F0.inc"
	.include "global.inc"

	.text

	.extern sub_02018498

	thumb_func_start sub_020189AC
sub_020189AC: ; 0x020189AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldrb r0, [r5, #0x18]
	ldrh r4, [r5, #0xc]
	sub r0, r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _020189C6
	add r4, #0xc
_020189C6:
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r3, r5, #0
	lsl r2, r4, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	add r3, #0x28
	lsr r2, r2, #0x10
	str r0, [sp, #0xc]
	ldrb r1, [r5, #6]
	ldrb r3, [r3]
	ldr r0, [r5, #0x14]
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r3, r5, #0
	add r2, r4, #1
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	add r3, #0x28
	lsl r2, r2, #0x10
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	lsr r2, r2, #0x10
	str r0, [sp, #0xc]
	ldrb r3, [r3]
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r3, r5, #0
	add r2, r4, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	lsl r2, r2, #0x10
	add r3, #0x28
	str r0, [sp, #0xc]
	ldrb r4, [r3]
	add r3, r5, #0
	add r3, #0x26
	ldrb r3, [r3]
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	add r3, r4, r3
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x24
	ldrh r4, [r5, #0xc]
	ldrb r1, [r0]
	ldr r0, [sp, #0x10]
	add r4, #9
	cmp r1, r0
	bne _02018A62
	add r4, #0xc
_02018A62:
	add r0, r5, #0
	add r0, #0x29
	ldrb r1, [r5, #0x18]
	ldrb r2, [r0]
	add r3, r5, #0
	lsl r0, r1, #1
	add r0, r1, r0
	add r0, r2, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	lsl r2, r4, #0x10
	add r3, #0x28
	str r0, [sp, #0xc]
	ldrb r1, [r5, #6]
	ldrb r3, [r3]
	ldr r0, [r5, #0x14]
	lsr r2, r2, #0x10
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x29
	ldrb r1, [r5, #0x18]
	ldrb r2, [r0]
	add r3, r5, #0
	lsl r0, r1, #1
	add r0, r1, r0
	add r0, r2, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	add r2, r4, #1
	lsl r2, r2, #0x10
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	add r3, #0x28
	lsr r2, r2, #0x10
	str r0, [sp, #0xc]
	ldrb r3, [r3]
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x29
	add r3, r5, #0
	ldrb r1, [r5, #0x18]
	ldrb r2, [r0]
	add r3, #0x28
	lsl r0, r1, #1
	add r0, r1, r0
	add r0, r2, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	add r2, r4, #2
	lsl r2, r2, #0x10
	str r0, [sp, #0xc]
	ldrb r4, [r3]
	add r3, r5, #0
	add r3, #0x26
	ldrb r3, [r3]
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	add r3, r4, r3
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldrb r1, [r5, #0x18]
	mov r6, #0
	sub r0, r1, #1
	cmp r0, #0
	ble _02018BFE
	ldr r0, [sp, #0x10]
	add r7, r6, #0
	sub r0, r0, #1
	str r0, [sp, #0x14]
_02018B22:
	ldrh r0, [r5, #0xc]
	add r4, r0, #6
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _02018B34
	cmp r6, #0
	beq _02018B38
_02018B34:
	cmp r0, r6
	bne _02018B3C
_02018B38:
	add r4, #0xc
	b _02018B50
_02018B3C:
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bne _02018B48
	ldr r1, [sp, #0x14]
	cmp r6, r1
	beq _02018B4E
_02018B48:
	add r1, r6, #1
	cmp r0, r1
	bne _02018B50
_02018B4E:
	add r4, #0x12
_02018B50:
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r1, r7, #3
	add r3, r5, #0
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	add r3, #0x28
	lsl r2, r4, #0x10
	str r0, [sp, #0xc]
	ldrb r1, [r5, #6]
	ldrb r3, [r3]
	ldr r0, [r5, #0x14]
	lsr r2, r2, #0x10
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r1, r7, #3
	add r3, r5, #0
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	add r3, #0x28
	add r2, r4, #1
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	str r0, [sp, #0xc]
	ldrb r3, [r3]
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x29
	add r3, r5, #0
	add r2, r4, #2
	ldrb r0, [r0]
	add r1, r7, #3
	add r3, #0x28
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	str r0, [sp, #0xc]
	ldrb r4, [r3]
	add r3, r5, #0
	add r3, #0x26
	ldrb r3, [r3]
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	add r3, r4, r3
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldrb r1, [r5, #0x18]
	add r6, r6, #1
	add r7, r7, #3
	sub r0, r1, #1
	cmp r6, r0
	blt _02018B22
_02018BFE:
	mov r7, #0
	cmp r1, #0
	ble _02018C8C
	add r6, r7, #0
_02018C06:
	ldrh r0, [r5, #0xc]
	add r4, r0, #3
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, r7
	bne _02018C16
	add r4, #0xc
_02018C16:
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r3, r5, #0
	lsl r2, r4, #0x10
	add r0, r0, r6
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	add r3, #0x28
	lsr r2, r2, #0x10
	str r0, [sp, #0xc]
	ldrb r1, [r5, #6]
	ldrb r3, [r3]
	ldr r0, [r5, #0x14]
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r3, r5, #0
	add r2, r4, #2
	add r0, r0, r6
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	lsl r2, r2, #0x10
	add r3, #0x28
	str r0, [sp, #0xc]
	ldrb r4, [r3]
	add r3, r5, #0
	add r3, #0x26
	ldrb r3, [r3]
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	add r3, r4, r3
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldrb r0, [r5, #0x18]
	add r7, r7, #1
	add r6, r6, #3
	cmp r7, r0
	blt _02018C06
_02018C8C:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020189AC

	thumb_func_start sub_02018C90
sub_02018C90: ; 0x02018C90
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r0, #0x26
	ldrb r0, [r0]
	mov r7, #0
	lsl r0, r0, #3
	str r0, [sp, #0x10]
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	ble _02018CFA
	add r6, r7, #0
	add r4, r7, #0
_02018CAA:
	ldrb r0, [r5, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x19
	bne _02018CB6
	ldrb r3, [r5, #5]
	b _02018CC8
_02018CB6:
	ldr r1, [r5, #0x10]
	mov r0, #4
	ldr r1, [r1, r6]
	mov r2, #0
	bl FontID_String_GetWidth
	ldr r1, [sp, #0x10]
	sub r0, r1, r0
	lsr r3, r0, #1
_02018CC8:
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02018D08 ; =0x00010203
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x10]
	ldr r0, [r5, #0x1c]
	ldr r2, [r2, r6]
	add r0, r0, r4
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [r5, #0x1c]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	ldrb r0, [r5, #0x18]
	add r7, r7, #1
	add r6, #8
	add r4, #0x10
	cmp r7, r0
	blt _02018CAA
_02018CFA:
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02018D08: .word 0x00010203
	thumb_func_end sub_02018C90

	thumb_func_start sub_02018D0C
sub_02018D0C: ; 0x02018D0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	cmp r2, #0
	beq _02018D20
	mov r0, #6
	ldr r7, _02018D88 ; =0x00040506
	str r0, [sp, #0x14]
	b _02018D26
_02018D20:
	mov r0, #3
	ldr r7, _02018D8C ; =0x00010203
	str r0, [sp, #0x14]
_02018D26:
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	lsl r6, r0, #3
	ldrb r0, [r5, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x19
	bne _02018D3C
	ldrb r0, [r5, #5]
	str r0, [sp, #0x10]
	b _02018D50
_02018D3C:
	ldr r2, [r5, #0x10]
	lsl r1, r4, #3
	ldr r1, [r2, r1]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	sub r0, r6, r0
	lsr r0, r0, #1
	str r0, [sp, #0x10]
_02018D50:
	ldr r0, [r5, #0x1c]
	lsl r6, r4, #4
	ldr r1, [sp, #0x14]
	add r0, r0, r6
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x10]
	lsl r2, r4, #3
	ldr r2, [r3, r2]
	ldr r3, [sp, #0x10]
	add r0, r0, r6
	mov r1, #4
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [r5, #0x1c]
	add r0, r0, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02018D88: .word 0x00040506
_02018D8C: .word 0x00010203
	thumb_func_end sub_02018D0C

	thumb_func_start sub_02018D90
sub_02018D90: ; 0x02018D90
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrb r0, [r5, #0x18]
	mov r6, #0
	cmp r0, #0
	ble _02018DB2
	add r4, r6, #0
_02018DA0:
	ldr r0, [r5, #0x1c]
	add r0, r0, r4
	bl ClearWindowTilemapAndScheduleTransfer
	ldrb r0, [r5, #0x18]
	add r6, r6, #1
	add r4, #0x10
	cmp r6, r0
	blt _02018DA0
_02018DB2:
	add r1, r5, #0
	add r1, #0x29
	ldrb r1, [r1]
	add r3, r5, #0
	add r3, #0x28
	str r1, [sp]
	add r1, r5, #0
	add r1, #0x26
	ldrb r1, [r1]
	mov r2, #0
	add r1, r1, #2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #4]
	lsl r1, r0, #1
	add r0, r0, r1
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	str r0, [sp, #0xc]
	ldrb r1, [r5, #6]
	ldrb r3, [r3]
	ldr r0, [r5, #0x14]
	bl FillBgTilemapRect
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02018D90

	thumb_func_start sub_02018DF4
sub_02018DF4: ; 0x02018DF4
	push {r4, lr}
	add r4, r0, #0
	bl sub_020189AC
	ldrb r1, [r4, #6]
	ldr r0, [r4, #0x14]
	bl ScheduleBgTilemapBufferTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02018DF4

	thumb_func_start sub_02018E08
sub_02018E08: ; 0x02018E08
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r4, r1, #0
	bl TouchscreenHitbox_FindRectAtTouchNew
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _02018E24
	mov r1, #0
	str r1, [r4]
	pop {r4, r5, r6, pc}
_02018E24:
	lsl r0, r6, #0x18
	mov r2, #1
	lsr r1, r0, #0x18
	add r0, r5, #0
	str r2, [r4]
	add r0, #0x24
	strb r1, [r0]
	add r0, r5, #0
	bl sub_02018D0C
	add r0, r5, #0
	bl sub_020189AC
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	mov r1, #1
	add r0, #0x25
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #8
	add r0, #0x2b
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x2a
	strb r6, [r0]
	add r0, r5, #0
	add r0, #0x27
	ldrb r1, [r0]
	mov r0, #0xfe
	bic r1, r0
	mov r0, #2
	orr r1, r0
	add r0, r5, #0
	add r0, #0x27
	strb r1, [r0]
	ldr r1, _02018E88 ; =0x000005DC
	add r0, r5, #0
	bl sub_02018FE8
	add r0, r5, #0
	mov r1, #2
	bl sub_02018FFC
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
	nop
_02018E88: .word 0x000005DC
	thumb_func_end sub_02018E08

	thumb_func_start sub_02018E8C
sub_02018E8C: ; 0x02018E8C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02018FDC ; =gSystem
	ldr r1, [r0, #0x48]
	ldr r0, _02018FE0 ; =0x00000CF3
	tst r0, r1
	beq _02018EAA
	add r0, r5, #0
	add r0, #0x27
	ldrb r1, [r0]
	mov r0, #0xfe
	bic r1, r0
	add r0, r5, #0
	add r0, #0x27
	strb r1, [r0]
_02018EAA:
	ldr r0, _02018FDC ; =gSystem
	mov r1, #2
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _02018ECA
	ldr r1, _02018FE4 ; =0x000005DC
	add r0, r5, #0
	bl sub_02018FE8
	add r0, r5, #0
	mov r1, #3
	bl sub_02018FFC
	mov r0, #1
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02018ECA:
	mov r2, #1
	add r1, r0, #0
	tst r1, r2
	beq _02018F10
	add r1, r5, #0
	add r1, #0x24
	ldrb r1, [r1]
	add r0, r5, #0
	bl sub_02018D0C
	add r0, r5, #0
	mov r1, #1
	add r0, #0x25
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #8
	add r0, #0x2b
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x24
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x2a
	strb r1, [r0]
	ldr r1, _02018FE4 ; =0x000005DC
	add r0, r5, #0
	bl sub_02018FE8
	add r0, r5, #0
	mov r1, #2
	bl sub_02018FFC
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02018F10:
	add r1, r5, #0
	add r1, #0x24
	ldrb r4, [r1]
	mov r1, #0x40
	tst r0, r1
	beq _02018F6E
	ldrb r0, [r5, #4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _02018F36
	ldrb r1, [r5, #0x18]
	sub r0, r1, #1
	add r0, r4, r0
	bl _s32_div_f
	add r0, r5, #0
	add r0, #0x24
	strb r1, [r0]
	b _02018F48
_02018F36:
	cmp r4, #0
	beq _02018F48
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r5, #0
	add r0, #0x24
	strb r1, [r0]
_02018F48:
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r4, r0
	beq _02018F6E
	ldr r1, _02018FE4 ; =0x000005DC
	add r0, r5, #0
	bl sub_02018FE8
	add r0, r5, #0
	mov r1, #1
	bl sub_02018FFC
	add r1, r5, #0
	add r1, #0x24
	ldrb r1, [r1]
	add r0, r5, #0
	bl sub_02018DF4
_02018F6E:
	ldr r0, _02018FDC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0x80
	tst r0, r1
	beq _02018FD6
	ldrb r0, [r5, #4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _02018F96
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	ldrb r1, [r5, #0x18]
	add r0, r0, #1
	bl _s32_div_f
	add r0, r5, #0
	add r0, #0x24
	strb r1, [r0]
	b _02018FB2
_02018F96:
	add r0, r5, #0
	add r0, #0x24
	ldrb r1, [r0]
	ldrb r0, [r5, #0x18]
	sub r0, r0, #1
	cmp r1, r0
	bge _02018FB2
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0x24
	strb r1, [r0]
_02018FB2:
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r4, r0
	beq _02018FD6
	ldr r1, _02018FE4 ; =0x000005DC
	add r0, r5, #0
	bl sub_02018FE8
	add r0, r5, #0
	mov r1, #1
	bl sub_02018FFC
	add r0, r5, #0
	add r5, #0x24
	ldrb r1, [r5]
	bl sub_02018DF4
_02018FD6:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02018FDC: .word gSystem
_02018FE0: .word 0x00000CF3
_02018FE4: .word 0x000005DC
	thumb_func_end sub_02018E8C

	thumb_func_start sub_02018FE8
sub_02018FE8: ; 0x02018FE8
	push {r3, lr}
	add r0, #0x27
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _02018FFA
	add r0, r1, #0
	bl PlaySE
_02018FFA:
	pop {r3, pc}
	thumb_func_end sub_02018FE8

	thumb_func_start sub_02018FFC
sub_02018FFC: ; 0x02018FFC
	push {r4, lr}
	ldr r4, [r0, #0x30]
	add r3, r1, #0
	cmp r4, #0
	beq _02019010
	add r1, r0, #0
	add r1, #0x24
	ldrb r1, [r1]
	ldr r2, [r0, #0x34]
	blx r4
_02019010:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02018FFC
