	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F5C40:
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
_020F5C50:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
_020F5C60:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020F5C78:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD5, 0x5C, 0x01, 0x00
	.byte 0xD5, 0x5C, 0x01, 0x00, 0xD5, 0x5C, 0x01, 0x00, 0xD5, 0x5C, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.text

	thumb_func_start sub_0200E398
sub_0200E398: ; 0x0200E398
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	cmp r3, #0
	str r2, [sp]
	bne _0200E3BE
	mov r1, #0
	str r1, [sp, #4]
	ldr r0, [sp, #0x20]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #0x26
	add r2, r5, #0
	add r3, r4, #0
	bl GfGfxLoader_LoadCharData
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0200E3BE:
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	mov r1, #1
	str r0, [sp, #0xc]
	mov r0, #0x26
	add r2, r5, #0
	add r3, r4, #0
	bl GfGfxLoader_LoadCharData
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0200E398

	thumb_func_start sub_0200E3D8
sub_0200E3D8: ; 0x0200E3D8
	mov r0, #0x19
	bx lr
	thumb_func_end sub_0200E3D8

	thumb_func_start LoadUserFrameGfx1
LoadUserFrameGfx1: ; 0x0200E3DC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	add r5, r1, #0
	add r4, r3, #0
	cmp r0, #0
	beq _0200E3F2
	mov r1, #1
	b _0200E3F4
_0200E3F2:
	mov r1, #0
_0200E3F4:
	str r2, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	add r2, r6, #0
	str r0, [sp, #0xc]
	mov r0, #0x26
	add r3, r5, #0
	bl GfGfxLoader_LoadCharData
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	cmp r0, #2
	bne _0200E416
	mov r1, #0x2e
	b _0200E418
_0200E416:
	mov r1, #0x19
_0200E418:
	cmp r5, #4
	bhs _0200E432
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x24]
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x26
	lsl r3, r4, #5
	bl GfGfxLoader_GXLoadPal
	add sp, #0x10
	pop {r4, r5, r6, pc}
_0200E432:
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x24]
	mov r2, #4
	str r0, [sp, #4]
	mov r0, #0x26
	lsl r3, r4, #5
	bl GfGfxLoader_GXLoadPal
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end LoadUserFrameGfx1

	thumb_func_start sub_0200E448
sub_0200E448: ; 0x0200E448
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	ldr r2, [sp, #0x1c]
	ldr r5, [sp, #0x40]
	sub r7, r2, #1
	ldr r2, [sp, #0x18]
	str r0, [sp, #0x10]
	sub r6, r2, #1
	lsl r2, r7, #0x18
	lsr r2, r2, #0x18
	str r2, [sp]
	mov r2, #1
	str r2, [sp, #4]
	str r2, [sp, #8]
	lsl r3, r6, #0x18
	str r5, [sp, #0xc]
	add r2, sp, #0x28
	ldrh r2, [r2, #0x1c]
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r1, sp, #0x28
	ldrh r4, [r1, #0x1c]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldrb r0, [r1, #0x10]
	add r2, r4, #1
	lsl r2, r2, #0x10
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x18]
	lsr r2, r2, #0x10
	bl FillBgTilemapRect
	add r0, sp, #0x28
	ldrb r1, [r0, #0x10]
	ldr r0, [sp, #0x18]
	add r2, r4, #2
	add r0, r0, r1
	str r0, [sp, #0x20]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [sp, #0x20]
	str r5, [sp, #0xc]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x1c]
	add r2, r4, #3
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, sp, #0x28
	ldrb r0, [r0, #0x14]
	lsl r2, r2, #0x10
	lsl r3, r6, #0x18
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, sp, #0x28
	ldrb r0, [r0, #0x14]
	add r2, r4, #5
	lsl r2, r2, #0x10
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, sp, #0x28
	ldrb r1, [r0, #0x14]
	ldr r0, [sp, #0x1c]
	add r2, r4, #6
	add r7, r0, r1
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	lsl r2, r2, #0x10
	lsl r3, r6, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x28
	ldrb r0, [r0, #0x10]
	add r2, r4, #7
	lsl r2, r2, #0x10
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x18]
	lsr r2, r2, #0x10
	bl FillBgTilemapRect
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [sp, #0x20]
	str r5, [sp, #0xc]
	add r4, #8
	lsl r2, r4, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0200E448

	thumb_func_start DrawFrameAndWindow1
DrawFrameAndWindow1: ; 0x0200E580
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl GetWindowBgId
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl GetWindowX
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl GetWindowY
	str r0, [sp, #0x18]
	add r0, r5, #0
	bl GetWindowWidth
	str r0, [sp, #0x1c]
	add r0, r5, #0
	bl GetWindowHeight
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x14]
	str r1, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r6, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [sp, #0x10]
	ldr r3, [sp, #0x18]
	bl sub_0200E448
	cmp r4, #0
	bne _0200E5D0
	add r0, r5, #0
	bl CopyWindowToVram
_0200E5D0:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end DrawFrameAndWindow1

	thumb_func_start sub_0200E5D4
sub_0200E5D4: ; 0x0200E5D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	bl GetWindowBgId
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl GetWindowX
	add r6, r0, #0
	add r0, r5, #0
	bl GetWindowY
	add r7, r0, #0
	add r0, r5, #0
	bl GetWindowWidth
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl GetWindowHeight
	sub r1, r7, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	ldr r1, [sp, #0x14]
	add r0, r0, #2
	add r1, r1, #2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r0, r0, #0x18
	str r1, [sp, #4]
	lsr r0, r0, #0x18
	sub r3, r6, #1
	lsl r3, r3, #0x18
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [sp, #0x10]
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	cmp r4, #0
	bne _0200E636
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
_0200E636:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0200E5D4

	thumb_func_start sub_0200E63C
sub_0200E63C: ; 0x0200E63C
	add r0, r0, #2
	bx lr
	thumb_func_end sub_0200E63C

	thumb_func_start sub_0200E640
sub_0200E640: ; 0x0200E640
	add r0, #0x1a
	bx lr
	thumb_func_end sub_0200E640

	thumb_func_start LoadUserFrameGfx2
LoadUserFrameGfx2: ; 0x0200E644
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #0x10]
	add r0, sp, #0x18
	ldrb r7, [r0, #0x10]
	add r6, r2, #0
	add r5, r1, #0
	add r0, r7, #0
	add r4, r3, #0
	bl sub_0200E63C
	add r1, r0, #0
	str r6, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x10]
	str r0, [sp, #0xc]
	mov r0, #0x26
	add r3, r5, #0
	bl GfGfxLoader_LoadCharData
	cmp r5, #4
	bhs _0200E694
	add r0, r7, #0
	bl sub_0200E640
	add r1, r0, #0
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x26
	lsl r3, r4, #5
	bl GfGfxLoader_GXLoadPal
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0200E694:
	add r0, r7, #0
	bl sub_0200E640
	add r1, r0, #0
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	mov r2, #4
	str r0, [sp, #4]
	mov r0, #0x26
	lsl r3, r4, #5
	bl GfGfxLoader_GXLoadPal
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end LoadUserFrameGfx2

	thumb_func_start sub_0200E6B4
sub_0200E6B4: ; 0x0200E6B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	ldr r2, [sp, #0x4c]
	add r7, r0, #0
	str r2, [sp, #0x4c]
	ldr r2, [sp, #0x18]
	ldr r5, [sp, #0x50]
	sub r6, r2, #1
	ldr r2, [sp, #0x14]
	sub r2, r2, #2
	str r2, [sp, #0x28]
	lsl r2, r6, #0x18
	lsr r2, r2, #0x18
	str r2, [sp]
	mov r2, #1
	str r2, [sp, #4]
	str r2, [sp, #8]
	ldr r3, [sp, #0x28]
	str r5, [sp, #0xc]
	add r2, sp, #0x38
	lsl r3, r3, #0x18
	ldrh r2, [r2, #0x1c]
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x14]
	sub r0, r0, #1
	str r0, [sp, #0x24]
	add r0, sp, #0x38
	ldrh r4, [r0, #0x1c]
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [sp, #0x24]
	str r5, [sp, #0xc]
	add r2, r4, #1
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x38
	ldrb r0, [r0, #0x10]
	add r2, r4, #2
	lsl r2, r2, #0x10
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, r7, #0
	lsr r2, r2, #0x10
	bl FillBgTilemapRect
	add r0, sp, #0x38
	ldrb r1, [r0, #0x10]
	ldr r0, [sp, #0x14]
	add r2, r4, #3
	add r0, r0, r1
	str r0, [sp, #0x2c]
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [sp, #0x2c]
	str r5, [sp, #0xc]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x2c]
	add r2, r4, #4
	add r0, r0, #1
	str r0, [sp, #0x20]
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [sp, #0x20]
	str r5, [sp, #0xc]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x2c]
	add r2, r4, #5
	add r0, r0, #2
	str r0, [sp, #0x1c]
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [sp, #0x1c]
	str r5, [sp, #0xc]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x28]
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x4c]
	add r2, r4, #6
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x24]
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x4c]
	add r2, r4, #7
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x18]
	add r2, r4, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x4c]
	ldr r3, [sp, #0x2c]
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	add r2, #9
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x18]
	add r2, r4, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x4c]
	ldr r3, [sp, #0x20]
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	add r2, #0xa
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x18]
	add r2, r4, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x4c]
	ldr r3, [sp, #0x1c]
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	add r2, #0xb
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r2, r4, #0
	ldr r3, [sp, #0x28]
	add r2, #0xc
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x4c]
	lsr r2, r2, #0x10
	add r6, r1, r0
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r2, r4, #0
	ldr r3, [sp, #0x24]
	str r5, [sp, #0xc]
	add r2, #0xd
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x38
	ldrb r0, [r0, #0x10]
	add r2, r4, #0
	add r2, #0xe
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	lsl r2, r2, #0x10
	ldr r1, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, r7, #0
	lsr r2, r2, #0x10
	bl FillBgTilemapRect
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r2, r4, #0
	ldr r3, [sp, #0x2c]
	str r5, [sp, #0xc]
	add r2, #0xf
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r2, r4, #0
	ldr r3, [sp, #0x20]
	str r5, [sp, #0xc]
	add r2, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [sp, #0x1c]
	str r5, [sp, #0xc]
	add r4, #0x11
	lsl r2, r4, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0200E6B4

	thumb_func_start sub_0200E948
sub_0200E948: ; 0x0200E948
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	bl GetWindowBgId
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl GetWindowX
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl GetWindowY
	str r0, [sp, #0x18]
	add r0, r5, #0
	bl GetWindowWidth
	add r4, r0, #0
	add r0, r5, #0
	bl GetWindowHeight
	str r4, [sp]
	str r0, [sp, #4]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl sub_0200E6B4
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0200E948

	thumb_func_start DrawFrameAndWindow2
DrawFrameAndWindow2: ; 0x0200E998
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r4, r1, #0
	add r1, r6, #0
	add r2, r3, #0
	add r5, r0, #0
	bl sub_0200E948
	cmp r4, #0
	bne _0200E9B2
	add r0, r5, #0
	bl CopyWindowToVram
_0200E9B2:
	add r0, r6, #0
	bl sub_020027F0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end DrawFrameAndWindow2

	thumb_func_start ClearFrameAndWindow2
ClearFrameAndWindow2: ; 0x0200E9BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	bl GetWindowBgId
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl GetWindowX
	add r6, r0, #0
	add r0, r5, #0
	bl GetWindowY
	add r7, r0, #0
	add r0, r5, #0
	bl GetWindowWidth
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl GetWindowHeight
	sub r1, r7, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	ldr r1, [sp, #0x14]
	add r0, r0, #2
	add r1, r1, #5
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r0, r0, #0x18
	str r1, [sp, #4]
	lsr r0, r0, #0x18
	sub r3, r6, #2
	lsl r3, r3, #0x18
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [sp, #0x10]
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	cmp r4, #0
	bne _0200EA1E
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
_0200EA1E:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ClearFrameAndWindow2

	thumb_func_start sub_0200EA24
sub_0200EA24: ; 0x0200EA24
	push {r4, r5, lr}
	sub sp, #0x24
	add r5, r1, #0
	str r0, [sp, #0x1c]
	add r1, sp, #0x14
	strh r3, [r1, #0xc]
	add r4, r2, #0
	add r0, sp, #0x20
	ldrh r2, [r0, #0x10]
	add r3, r4, #0
	strh r2, [r1, #0xe]
	ldr r2, [sp, #0x34]
	str r2, [sp, #0x14]
	ldrh r2, [r0, #0x18]
	strh r2, [r1, #4]
	ldrh r2, [r0, #0x1c]
	strh r2, [r1, #6]
	ldrh r1, [r0, #0x20]
	add r2, r5, #0
	str r1, [sp]
	ldrh r1, [r0, #0x24]
	str r1, [sp, #4]
	ldrh r1, [r0, #0x28]
	str r1, [sp, #8]
	ldrh r0, [r0, #0x2c]
	add r1, sp, #0x14
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	add r0, sp, #0x1c
	bl BlitBitmapRect4Bit
	add sp, #0x24
	pop {r4, r5, pc}
	thumb_func_end sub_0200EA24

	thumb_func_start sub_0200EA68
sub_0200EA68: ; 0x0200EA68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	str r2, [sp, #0x24]
	str r3, [sp, #0x28]
	str r0, [sp, #0x20]
	ldr r0, [r0]
	add r7, r1, #0
	bl BgConfig_GetHeapId
	add r6, r0, #0
	ldr r0, [sp, #0x20]
	bl GetWindowBgId
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	lsl r0, r0, #7
	str r0, [sp, #0x30]
	ldr r1, [sp, #0x30]
	add r0, r6, #0
	bl AllocFromHeap
	add r5, r0, #0
	ldr r0, [sp, #0x2c]
	bl BgGetCharPtr
	add r4, r0, #0
	str r6, [sp]
	mov r0, #0x26
	add r1, r7, #0
	mov r2, #0
	add r3, sp, #0x44
	bl GfGfxLoader_GetCharData
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x44]
	mov r7, #0
	ldr r0, [r0, #0x14]
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x28]
	cmp r0, #0
	ble _0200EB12
	ldr r0, [sp, #0x24]
	add r0, #0xa
	lsl r0, r0, #5
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x24]
	add r0, #0xb
	lsl r0, r0, #5
	str r0, [sp, #0x40]
_0200EACA:
	ldr r1, [sp, #0x3c]
	lsl r6, r7, #7
	add r0, r5, r6
	add r1, r4, r1
	mov r2, #0x20
	bl memcpy
	add r0, r6, #0
	ldr r1, [sp, #0x40]
	add r0, #0x20
	add r0, r5, r0
	add r1, r4, r1
	mov r2, #0x20
	bl memcpy
	add r0, r6, #0
	ldr r1, [sp, #0x3c]
	add r0, #0x40
	add r0, r5, r0
	add r1, r4, r1
	mov r2, #0x20
	bl memcpy
	ldr r1, [sp, #0x40]
	add r6, #0x60
	add r0, r5, r6
	add r1, r4, r1
	mov r2, #0x20
	bl memcpy
	add r0, r7, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [sp, #0x28]
	cmp r7, r0
	blt _0200EACA
_0200EB12:
	add r1, sp, #0x50
	ldrb r2, [r1, #0x14]
	mov r3, #0x10
	ldr r0, [sp, #0x28]
	sub r4, r3, r2
	mul r0, r4
	ldrb r1, [r1, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	sub r3, r3, r1
	lsl r3, r3, #0x18
	str r0, [sp]
	lsr r3, r3, #0x18
	str r5, [sp, #4]
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	mov r4, #0
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	str r3, [sp, #0x18]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x38]
	bl sub_0200EA24
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x30]
	add r0, #0x12
	str r0, [sp, #0x24]
	str r0, [sp]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x2c]
	ldr r0, [r0]
	add r2, r5, #0
	bl BG_LoadCharTilesData
	ldr r0, [sp, #0x34]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0200EA68

	thumb_func_start sub_0200EB68
sub_0200EB68: ; 0x0200EB68
	push {r3, lr}
	sub sp, #8
	mov r3, #3
	add r2, r1, #0
	str r3, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #0x16
	bl sub_0200EA68
	add sp, #8
	pop {r3, pc}
	thumb_func_end sub_0200EB68

	thumb_func_start sub_0200EB80
sub_0200EB80: ; 0x0200EB80
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, sp, #0x18
	ldrb r0, [r0, #0x10]
	add r7, r2, #0
	add r5, r3, #0
	bl sub_0200E63C
	add r1, r0, #0
	ldr r0, [sp, #0x2c]
	mov r2, #0
	str r0, [sp]
	mov r0, #0x26
	add r3, sp, #0x10
	bl GfGfxLoader_GetCharData
	str r0, [sp, #0xc]
	mov r1, #9
	ldr r0, [sp, #0x2c]
	lsl r1, r1, #6
	bl AllocFromHeap
	ldr r1, [sp, #0x10]
	mov r2, #9
	ldr r1, [r1, #0x14]
	lsl r2, r2, #6
	add r4, r0, #0
	bl memcpy
	mov r0, #9
	mov r3, #0
	lsl r0, r0, #6
	mov r1, #0xf
_0200EBC6:
	ldrb r2, [r4, r3]
	lsl r6, r2, #0x14
	and r2, r1
	lsl r2, r2, #0x18
	lsr r6, r6, #0x18
	lsr r2, r2, #0x18
	cmp r6, #0
	bne _0200EBD8
	add r6, r5, #0
_0200EBD8:
	cmp r2, #0
	bne _0200EBDE
	add r2, r5, #0
_0200EBDE:
	lsl r6, r6, #4
	orr r2, r6
	strb r2, [r4, r3]
	add r3, r3, #1
	cmp r3, r0
	blo _0200EBC6
	str r7, [sp]
	mov r3, #9
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	add r2, r4, #0
	lsl r3, r3, #6
	bl BG_LoadCharTilesData
	ldr r0, [sp, #0xc]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0200EB80

	thumb_func_start sub_0200EC0C
sub_0200EC0C: ; 0x0200EC0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0x10]
	add r5, r2, #0
	mov r0, #0xf
	add r6, r1, #0
	add r7, r3, #0
	str r5, [sp]
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r1, #0
	ldr r4, [sp, #0x38]
	str r1, [sp, #8]
	ldr r2, [sp, #0x10]
	mov r0, #0x24
	add r3, r6, #0
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadCharData
	mov r0, #0x24
	mov r1, #1
	add r2, r4, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	add r1, sp, #0x18
	str r0, [sp, #0x14]
	bl NNS_G2dGetUnpackedPaletteData
	add r2, sp, #0x20
	ldr r1, [sp, #0x18]
	ldrb r2, [r2, #0x10]
	lsl r3, r7, #0x15
	ldr r1, [r1, #0xc]
	lsl r2, r2, #5
	add r1, r1, r2
	add r0, r6, #0
	mov r2, #0x20
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
	ldr r1, [sp, #0x14]
	add r0, r4, #0
	bl FreeToHeapExplicit
	add r0, sp, #0x20
	ldrb r3, [r0, #0x10]
	cmp r3, #1
	bhi _0200EC80
	ldrh r0, [r0, #0x14]
	add r5, #0x1e
	lsl r2, r5, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x10]
	add r1, r6, #0
	lsr r2, r2, #0x10
	str r4, [sp, #4]
	bl sub_0200EC84
_0200EC80:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0200EC0C

	thumb_func_start sub_0200EC84
sub_0200EC84: ; 0x0200EC84
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, [sp, #0x20]
	cmp r3, #0
	bne _0200EC98
	add r1, #0x21
	lsl r0, r1, #0x10
	b _0200EC9C
_0200EC98:
	add r0, r1, #2
	lsl r0, r0, #0x10
_0200EC9C:
	lsr r1, r0, #0x10
	mov r0, #3
	str r2, [sp]
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	add r2, r5, #0
	str r0, [sp, #0xc]
	mov r0, #0x24
	add r3, r4, #0
	bl GfGfxLoader_LoadCharData
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0200EC84

	thumb_func_start sub_0200ECBC
sub_0200ECBC: ; 0x0200ECBC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	ldr r2, [sp, #0x1c]
	ldr r6, [sp, #0x5c]
	sub r7, r2, #1
	ldr r2, [sp, #0x18]
	ldr r5, [sp, #0x60]
	str r2, [sp, #0x34]
	sub r2, #9
	str r2, [sp, #0x34]
	lsl r2, r7, #0x18
	lsr r2, r2, #0x18
	str r2, [sp]
	mov r2, #1
	str r2, [sp, #4]
	str r2, [sp, #8]
	ldr r3, [sp, #0x34]
	str r5, [sp, #0xc]
	add r2, sp, #0x48
	lsl r3, r3, #0x18
	ldrh r2, [r2, #0x1c]
	lsr r3, r3, #0x18
	str r0, [sp, #0x10]
	bl FillBgTilemapRect
	ldr r0, [sp, #0x18]
	str r0, [sp, #0x30]
	sub r0, #8
	str r0, [sp, #0x30]
	add r0, sp, #0x48
	ldrh r4, [r0, #0x1c]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [sp, #0x30]
	str r5, [sp, #0xc]
	add r2, r4, #1
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, sp, #0x48
	ldrb r0, [r0, #0x10]
	add r2, r4, #2
	lsl r2, r2, #0x10
	str r0, [sp, #0x3c]
	add r0, r0, #7
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	lsr r2, r2, #0x10
	sub r0, r0, #7
	str r0, [sp, #0x20]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x20]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r2, r4, #3
	lsl r2, r2, #0x10
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x3c]
	lsr r2, r2, #0x10
	add r0, r1, r0
	str r0, [sp, #0x38]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [sp, #0x38]
	str r5, [sp, #0xc]
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x38]
	add r2, r4, #4
	add r0, r0, #1
	str r0, [sp, #0x2c]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [sp, #0x2c]
	str r5, [sp, #0xc]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x38]
	add r0, r0, #2
	str r0, [sp, #0x28]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [sp, #0x28]
	str r5, [sp, #0xc]
	add r2, r4, #5
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #0x34]
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r6, [sp, #8]
	str r5, [sp, #0xc]
	add r2, r4, #6
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #0x30]
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r6, [sp, #8]
	str r5, [sp, #0xc]
	add r2, r4, #7
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x1c]
	add r2, r4, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r6, [sp, #8]
	str r5, [sp, #0xc]
	ldr r3, [sp, #0x18]
	add r2, #8
	sub r3, r3, #1
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x1c]
	add r2, r4, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r3, [sp, #0x38]
	str r5, [sp, #0xc]
	add r2, #9
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x1c]
	add r2, r4, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r3, [sp, #0x2c]
	str r5, [sp, #0xc]
	add r2, #0xa
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x1c]
	add r2, r4, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r3, [sp, #0x28]
	str r5, [sp, #0xc]
	add r2, #0xb
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x1c]
	add r2, r4, #0
	add r6, r0, r6
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [sp, #0x34]
	str r5, [sp, #0xc]
	add r2, #0xc
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r2, r4, #0
	ldr r3, [sp, #0x30]
	str r5, [sp, #0xc]
	add r2, #0xd
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x24]
	add r2, r4, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r3, [sp, #0x20]
	str r5, [sp, #0xc]
	add r2, #0xe
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r2, r4, #0
	ldr r3, [sp, #0x38]
	str r5, [sp, #0xc]
	add r2, #0xf
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r2, r4, #0
	ldr r3, [sp, #0x2c]
	str r5, [sp, #0xc]
	add r2, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [sp, #0x28]
	str r5, [sp, #0xc]
	add r4, #0x11
	lsl r2, r4, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0200ECBC

	thumb_func_start sub_0200EF84
sub_0200EF84: ; 0x0200EF84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r1, [sp, #0x10]
	add r7, r0, #0
	str r2, [sp, #0x14]
	bl GetWindowBgId
	str r0, [sp, #0x20]
	add r0, r7, #0
	bl GetWindowX
	sub r0, r0, #7
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x18]
	add r0, r7, #0
	bl GetWindowY
	str r0, [sp, #0x1c]
	mov r0, #0
	str r0, [sp, #0x24]
_0200EFAE:
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x24]
	add r3, r2, #0
	add r0, r1, r0
	mov r1, #6
	mul r3, r1
	ldr r1, [sp, #0x10]
	lsl r0, r0, #0x18
	mov r4, #0
	add r5, r1, r3
	lsr r6, r0, #0x18
_0200EFC6:
	str r6, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x18]
	str r0, [sp, #0xc]
	add r2, r4, r5
	add r3, r3, r4
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [r7]
	ldr r1, [sp, #0x20]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #6
	blo _0200EFC6
	ldr r0, [sp, #0x24]
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x24]
	cmp r0, #4
	blo _0200EFAE
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0200EF84

	thumb_func_start DrawFrameAndWindow3
DrawFrameAndWindow3: ; 0x0200F004
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r4, r0, #0
	str r1, [sp, #0x10]
	add r6, r2, #0
	add r7, r3, #0
	bl GetWindowBgId
	str r0, [sp, #0x14]
	add r0, sp, #0x30
	ldrb r0, [r0, #0x10]
	cmp r0, #1
	bhi _0200F062
	add r0, r4, #0
	bl GetWindowX
	str r0, [sp, #0x18]
	add r0, r4, #0
	bl GetWindowY
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl GetWindowWidth
	add r5, r0, #0
	add r0, r4, #0
	bl GetWindowHeight
	str r5, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r6, [sp, #0xc]
	ldr r0, [r4]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl sub_0200ECBC
	add r1, r6, #0
	add r1, #0x1e
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	add r2, r7, #0
	bl sub_0200EF84
	b _0200F094
_0200F062:
	add r0, r4, #0
	bl GetWindowX
	str r0, [sp, #0x20]
	add r0, r4, #0
	bl GetWindowY
	str r0, [sp, #0x24]
	add r0, r4, #0
	bl GetWindowWidth
	add r5, r0, #0
	add r0, r4, #0
	bl GetWindowHeight
	str r5, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r6, [sp, #0xc]
	ldr r0, [r4]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	bl sub_0200E6B4
_0200F094:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0200F0A0
	add r0, r4, #0
	bl CopyWindowToVram
_0200F0A0:
	add r0, r6, #0
	bl sub_020027F0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end DrawFrameAndWindow3

	thumb_func_start sub_0200F0AC
sub_0200F0AC: ; 0x0200F0AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r0, [sp, #0x20]
	ldr r0, [r0]
	str r1, [sp, #0x24]
	bl BgConfig_GetHeapId
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x20]
	bl GetWindowBgId
	bl BgGetCharPtr
	add r5, r0, #0
	ldr r0, [sp, #0x28]
	ldr r1, _0200F1C4 ; =0x0000048C
	bl AllocFromHeap
	ldr r1, [sp, #0x24]
	add r4, r0, #0
	ldr r0, _0200F1C8 ; =0x00000404
	add r1, #0x12
	lsl r1, r1, #5
	add r0, r4, r0
	add r1, r5, r1
	mov r2, #0x80
	bl memcpy
	ldr r0, [sp, #0x28]
	mov r1, #0x80
	bl AllocFromHeap
	ldr r1, [sp, #0x24]
	mov r2, #0x20
	add r1, #0xa
	lsl r1, r1, #5
	str r1, [sp, #0x2c]
	add r1, r5, r1
	add r6, r0, #0
	bl memcpy
	ldr r0, [sp, #0x24]
	mov r2, #0x20
	add r0, #0xb
	lsl r7, r0, #5
	add r0, r6, #0
	add r0, #0x20
	add r1, r5, r7
	bl memcpy
	ldr r1, [sp, #0x2c]
	add r0, r6, #0
	add r0, #0x40
	add r1, r5, r1
	mov r2, #0x20
	bl memcpy
	add r0, r6, #0
	add r0, #0x60
	add r1, r5, r7
	mov r2, #0x20
	bl memcpy
	mov r5, #0
	add r7, r4, #4
_0200F12E:
	lsl r0, r5, #7
	add r0, r7, r0
	add r1, r6, #0
	mov r2, #0x80
	bl memcpy
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #8
	blo _0200F12E
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, [sp, #0x28]
	mov r1, #0x17
	str r0, [sp]
	mov r0, #0x26
	mov r2, #0
	add r3, sp, #0x30
	bl GfGfxLoader_GetCharData
	mov r2, #0x80
	add r5, r0, #0
	str r2, [sp]
	add r0, r4, #4
	str r0, [sp, #4]
	mov r3, #0x10
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	mov r1, #0
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	str r3, [sp, #0x18]
	str r2, [sp, #0x1c]
	ldr r0, [sp, #0x30]
	add r2, r1, #0
	ldr r0, [r0, #0x14]
	bl sub_0200EA24
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [sp, #0x20]
	ldr r1, _0200F1CC ; =0x00000484
	str r0, [r4]
	ldr r0, [sp, #0x24]
	mov r2, #0
	strh r0, [r4, r1]
	add r0, r1, #2
	strb r2, [r4, r0]
	add r0, r1, #3
	ldrb r3, [r4, r0]
	mov r0, #0x7f
	bic r3, r0
	add r0, r1, #3
	strb r3, [r4, r0]
	add r0, r1, #4
	ldrb r3, [r4, r0]
	mov r0, #3
	bic r3, r0
	add r0, r1, #4
	strb r3, [r4, r0]
	ldr r0, _0200F1D0 ; =sub_0200F3D0
	add r1, r4, #0
	bl sub_0200E33C
	add r0, r4, #0
	mov r1, #1
	bl sub_0200F1D4
	add r0, r4, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0200F1C4: .word 0x0000048C
_0200F1C8: .word 0x00000404
_0200F1CC: .word 0x00000484
_0200F1D0: .word sub_0200F3D0
	thumb_func_end sub_0200F0AC

	thumb_func_start sub_0200F1D4
sub_0200F1D4: ; 0x0200F1D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl GetWindowBgId
	add r4, r0, #0
	ldr r0, [r5]
	bl GetWindowX
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl GetWindowY
	str r0, [sp, #0x1c]
	ldr r0, [r5]
	bl GetWindowWidth
	str r0, [sp, #0x20]
	cmp r6, #2
	bne _0200F2DE
	ldr r2, _0200F3CC ; =0x00000484
	add r1, r4, #0
	ldrh r0, [r5, r2]
	sub r2, #0x80
	add r2, r5, r2
	add r0, #0x12
	str r0, [sp]
	ldr r0, [r5]
	mov r3, #0x80
	ldr r0, [r0]
	bl BG_LoadCharTilesData
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	add r7, r0, #2
	ldr r0, [sp, #0x20]
	ldr r2, _0200F3CC ; =0x00000484
	add r6, r1, r0
	add r0, r6, #1
	str r0, [sp, #0x14]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldrh r2, [r5, r2]
	ldr r0, [r5]
	ldr r3, [sp, #0x14]
	add r2, #0xa
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [r0]
	add r1, r4, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r2, _0200F3CC ; =0x00000484
	ldr r0, [r5]
	ldrh r2, [r5, r2]
	add r6, r6, #2
	lsl r3, r6, #0x18
	add r2, #0xb
	lsl r2, r2, #0x10
	ldr r0, [r0]
	add r1, r4, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #0x14]
	add r7, r0, #3
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r2, _0200F3CC ; =0x00000484
	ldr r0, [r5]
	ldrh r2, [r5, r2]
	lsl r3, r3, #0x18
	ldr r0, [r0]
	add r2, #0xa
	lsl r2, r2, #0x10
	add r1, r4, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r2, _0200F3CC ; =0x00000484
	ldr r0, [r5]
	ldrh r2, [r5, r2]
	lsl r3, r6, #0x18
	ldr r0, [r0]
	add r2, #0xb
	lsl r2, r2, #0x10
	add r1, r4, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0]
	bl BgCommitTilemapBufferToVram
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0200F2DE:
	ldr r3, _0200F3CC ; =0x00000484
	add r2, r5, #4
	ldrh r0, [r5, r3]
	add r3, r3, #3
	add r1, r4, #0
	add r0, #0x12
	str r0, [sp]
	ldrb r3, [r5, r3]
	ldr r0, [r5]
	lsl r3, r3, #0x19
	lsr r3, r3, #0x19
	lsl r3, r3, #7
	add r2, r2, r3
	ldr r0, [r0]
	mov r3, #0x80
	bl BG_LoadCharTilesData
	cmp r6, #0
	beq _0200F3C6
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	add r7, r0, #2
	ldr r0, [sp, #0x20]
	ldr r2, _0200F3CC ; =0x00000484
	add r6, r1, r0
	add r0, r6, #1
	str r0, [sp, #0x10]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldrh r2, [r5, r2]
	ldr r0, [r5]
	ldr r3, [sp, #0x10]
	add r2, #0x12
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [r0]
	add r1, r4, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r2, _0200F3CC ; =0x00000484
	ldr r0, [r5]
	ldrh r2, [r5, r2]
	add r6, r6, #2
	lsl r3, r6, #0x18
	add r2, #0x13
	lsl r2, r2, #0x10
	ldr r0, [r0]
	add r1, r4, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #0x10]
	add r7, r0, #3
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r2, _0200F3CC ; =0x00000484
	ldr r0, [r5]
	ldrh r2, [r5, r2]
	lsl r3, r3, #0x18
	ldr r0, [r0]
	add r2, #0x14
	lsl r2, r2, #0x10
	add r1, r4, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r2, _0200F3CC ; =0x00000484
	ldr r0, [r5]
	ldrh r2, [r5, r2]
	lsl r3, r6, #0x18
	ldr r0, [r0]
	add r2, #0x15
	lsl r2, r2, #0x10
	add r1, r4, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0]
	bl BgCommitTilemapBufferToVram
_0200F3C6:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0200F3CC: .word 0x00000484
	thumb_func_end sub_0200F1D4

	thumb_func_start sub_0200F3D0
sub_0200F3D0: ; 0x0200F3D0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0200F438 ; =0x00000488
	ldrb r2, [r1, r0]
	lsl r2, r2, #0x1e
	lsr r2, r2, #0x1e
	beq _0200F3F2
	cmp r2, #1
	bne _0200F3EA
	add r0, r1, #0
	mov r1, #2
	bl sub_0200F1D4
_0200F3EA:
	add r0, r4, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
_0200F3F2:
	sub r2, r0, #2
	ldrb r2, [r1, r2]
	add r3, r2, #1
	sub r2, r0, #2
	strb r3, [r1, r2]
	ldrb r2, [r1, r2]
	cmp r2, #0x10
	bne _0200F434
	mov r3, #0
	sub r2, r0, #2
	strb r3, [r1, r2]
	sub r2, r0, #1
	ldrb r2, [r1, r2]
	mov r4, #0x7f
	bic r2, r4
	sub r4, r0, #1
	ldrb r4, [r1, r4]
	sub r0, r0, #1
	lsl r4, r4, #0x19
	lsr r4, r4, #0x19
	add r5, r4, #1
	mov r4, #7
	and r4, r5
	lsl r4, r4, #0x18
	lsr r5, r4, #0x18
	mov r4, #0x7f
	and r4, r5
	orr r2, r4
	strb r2, [r1, r0]
	add r0, r1, #0
	add r1, r3, #0
	bl sub_0200F1D4
_0200F434:
	pop {r3, r4, r5, pc}
	nop
_0200F438: .word 0x00000488
	thumb_func_end sub_0200F3D0

	thumb_func_start sub_0200F43C
sub_0200F43C: ; 0x0200F43C
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl FreeToHeap
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0200F43C

	thumb_func_start sub_0200F450
sub_0200F450: ; 0x0200F450
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0200F470 ; =sub_0200F43C
	add r1, r4, #0
	mov r2, #0
	bl sub_0200E374
	ldr r1, _0200F474 ; =0x00000488
	mov r0, #3
	ldrb r2, [r4, r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	strb r0, [r4, r1]
	pop {r4, pc}
	nop
_0200F470: .word sub_0200F43C
_0200F474: .word 0x00000488
	thumb_func_end sub_0200F450

	thumb_func_start sub_0200F478
sub_0200F478: ; 0x0200F478
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0200F498 ; =sub_0200F43C
	add r1, r4, #0
	mov r2, #0
	bl sub_0200E374
	ldr r1, _0200F49C ; =0x00000488
	mov r0, #3
	ldrb r2, [r4, r1]
	bic r2, r0
	mov r0, #2
	orr r0, r2
	strb r0, [r4, r1]
	pop {r4, pc}
	nop
_0200F498: .word sub_0200F43C
_0200F49C: .word 0x00000488
	thumb_func_end sub_0200F478

	thumb_func_start sub_0200F4A0
sub_0200F4A0: ; 0x0200F4A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r2, [sp, #4]
	ldr r5, [sp, #0x30]
	str r3, [sp, #8]
	add r6, r0, #0
	add r7, r1, #0
	str r5, [sp]
	bl sub_0200F5C4
	add r4, r0, #0
	add r1, r5, #0
	bl sub_0200F600
	add r0, r4, #0
	bl sub_0200F62C
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	add r0, r4, #0
	bl sub_0200F684
	add r2, sp, #0x10
	ldrh r1, [r2, #0x18]
	ldrb r2, [r2, #0x1c]
	add r0, r4, #0
	bl sub_0200F6D4
	add r2, sp, #0x10
	ldrb r1, [r2, #0x10]
	ldrh r2, [r2, #0x14]
	add r0, r4, #0
	bl sub_0200F82C
	add r0, r6, #0
	add r1, r7, #0
	bl BgCommitTilemapBufferToVram
	ldr r0, _0200F4F4 ; =0x0000016F
	add r0, r4, r0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0200F4F4: .word 0x0000016F
	thumb_func_end sub_0200F4A0

	thumb_func_start sub_0200F4F8
sub_0200F4F8: ; 0x0200F4F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r2, [sp, #4]
	ldr r5, [sp, #0x2c]
	str r3, [sp, #8]
	add r6, r0, #0
	add r7, r1, #0
	str r5, [sp]
	bl sub_0200F5C4
	add r4, r0, #0
	add r1, r5, #0
	bl sub_0200F600
	add r0, r4, #0
	bl sub_0200F62C
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	add r0, r4, #0
	bl sub_0200F684
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	bl sub_0200F714
	add r2, sp, #0x10
	ldrb r1, [r2, #0x10]
	ldrh r2, [r2, #0x14]
	add r0, r4, #0
	bl sub_0200F82C
	add r0, r6, #0
	add r1, r7, #0
	bl BgCommitTilemapBufferToVram
	ldr r0, _0200F548 ; =0x0000016F
	add r0, r4, r0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0200F548: .word 0x0000016F
	thumb_func_end sub_0200F4F8

	thumb_func_start sub_0200F54C
sub_0200F54C: ; 0x0200F54C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0200F5C0 ; =0x0000016F
	add r4, r1, #0
	ldrb r1, [r4, r0]
	cmp r1, #1
	beq _0200F564
	cmp r1, #2
	beq _0200F582
	cmp r1, #3
	beq _0200F594
	b _0200F5A8
_0200F564:
	add r0, r4, #0
	bl sub_0200F9DC
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D9DC
	add r0, r4, #0
	bl ov01_021E86F4
	add r0, r5, #0
	bl sub_02007234
	pop {r3, r4, r5, pc}
_0200F582:
	mov r1, #3
	strb r1, [r4, r0]
	sub r0, #0xb
	ldr r0, [r4, r0]
	mov r1, #1
	ldr r0, [r0]
	bl Set2dSpriteAnimSeqNo
	b _0200F5A8
_0200F594:
	sub r0, #0xb
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl sub_020249F8
	cmp r0, #6
	bne _0200F5A8
	ldr r0, _0200F5C0 ; =0x0000016F
	mov r1, #0
	strb r1, [r4, r0]
_0200F5A8:
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	ldr r0, [r0]
	lsl r1, r1, #0xc
	bl sub_020249B0
	ldr r0, [r4]
	bl sub_0202457C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0200F5C0: .word 0x0000016F
	thumb_func_end sub_0200F54C

	thumb_func_start sub_0200F5C4
sub_0200F5C4: ; 0x0200F5C4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r7, r3, #0
	mov r1, #0x17
	add r6, r2, #0
	ldr r0, _0200F5F8 ; =sub_0200F54C
	ldr r3, [sp, #0x18]
	lsl r1, r1, #4
	mov r2, #0
	bl sub_02007200
	bl sub_0201F988
	ldr r1, _0200F5FC ; =0x0000016F
	mov r2, #0
	strb r2, [r0, r1]
	sub r2, r1, #7
	str r5, [r0, r2]
	sub r2, r1, #3
	strb r4, [r0, r2]
	sub r2, r1, #2
	strb r6, [r0, r2]
	sub r1, r1, #1
	strb r7, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200F5F8: .word sub_0200F54C
_0200F5FC: .word 0x0000016F
	thumb_func_end sub_0200F5C4

	thumb_func_start sub_0200F600
sub_0200F600: ; 0x0200F600
	push {r4, r5, r6, lr}
	sub sp, #0x18
	ldr r5, _0200F628 ; =_020F5C60
	add r4, sp, #0
	add r6, r0, #0
	add r3, r1, #0
	add r2, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r1, r2, #0
	add r0, r6, #0
	mov r2, #1
	bl ov01_021E8298
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0200F628: .word _020F5C60
	thumb_func_end sub_0200F600

	thumb_func_start sub_0200F62C
sub_0200F62C: ; 0x0200F62C
	push {r3, r4, lr}
	sub sp, #0xc
	mov r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	ldr r1, _0200F680 ; =0x00015CD5
	mov r2, #0x32
	str r1, [sp, #8]
	mov r1, #0x26
	mov r3, #0
	add r4, r0, #0
	bl ov01_021E8378
	ldr r0, _0200F680 ; =0x00015CD5
	mov r1, #0x26
	str r0, [sp]
	add r0, r4, #0
	mov r2, #0x30
	mov r3, #0
	bl ov01_021E83F0
	ldr r0, _0200F680 ; =0x00015CD5
	mov r1, #0x26
	str r0, [sp]
	add r0, r4, #0
	mov r2, #0x2f
	mov r3, #0
	bl ov01_021E8404
	mov r0, #1
	str r0, [sp]
	ldr r0, _0200F680 ; =0x00015CD5
	mov r1, #0x26
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x31
	mov r3, #0
	bl ov01_021E8418
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0200F680: .word 0x00015CD5
	thumb_func_end sub_0200F62C

	thumb_func_start sub_0200F684
sub_0200F684: ; 0x0200F684
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r5, _0200F6D0 ; =_020F5C78
	add r6, r2, #0
	add r4, r0, #0
	add r7, r1, #0
	add r3, sp, #0
	mov r2, #6
_0200F694:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0200F694
	ldr r0, [r5]
	str r0, [r3]
	add r0, r7, #5
	lsl r1, r0, #3
	add r0, sp, #0
	strh r1, [r0]
	add r1, r6, #5
	lsl r1, r1, #3
	strh r1, [r0, #2]
	add r0, r4, #0
	add r1, sp, #0
	bl ov01_021E851C
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4]
	bl sub_0202457C
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0200F6D0: .word _020F5C78
	thumb_func_end sub_0200F684

	thumb_func_start sub_0200F6D4
sub_0200F6D4: ; 0x0200F6D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, _0200F710 ; =0x00000162
	add r4, r1, #0
	ldrh r0, [r5, r0]
	add r6, r2, #0
	bl sub_02007FD4
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r0, sp, #0xc
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #2
	bl GetMonSpriteCharAndPlttNarcIdsEx
	add r0, r5, #0
	add r1, sp, #0xc
	bl sub_0200F748
	add r0, r7, #0
	bl sub_02008524
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0200F710: .word 0x00000162
	thumb_func_end sub_0200F6D4

	thumb_func_start sub_0200F714
sub_0200F714: ; 0x0200F714
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _0200F744 ; =0x00000162
	add r4, r1, #0
	ldrh r0, [r5, r0]
	bl sub_02007FD4
	add r6, r0, #0
	add r0, sp, #0
	add r1, r4, #0
	mov r2, #2
	bl GetPokemonSpriteCharAndPlttNarcIds
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0200F748
	add r0, r6, #0
	bl sub_02008524
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0200F744: .word 0x00000162
	thumb_func_end sub_0200F714

	thumb_func_start sub_0200F748
sub_0200F748: ; 0x0200F748
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	ldr r0, _0200F81C ; =0x00000162
	add r6, r1, #0
	mov r1, #0x19
	ldrh r0, [r5, r0]
	lsl r1, r1, #8
	bl AllocFromHeap
	add r2, sp, #0x18
	ldr r3, _0200F820 ; =_020F5C50
	add r4, r0, #0
	add r7, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	str r4, [sp]
	ldr r2, _0200F81C ; =0x00000162
	ldrh r0, [r6]
	ldrh r1, [r6, #2]
	ldrh r2, [r5, r2]
	add r3, r7, #0
	bl sub_020143E0
	ldr r3, _0200F824 ; =_020F5C40
	add r2, sp, #8
	add r7, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0x32
	lsl r0, r0, #6
	add r0, r4, r0
	str r0, [sp]
	ldr r2, _0200F81C ; =0x00000162
	ldrh r0, [r6]
	ldrh r1, [r6, #2]
	ldrh r2, [r5, r2]
	add r3, r7, #0
	bl sub_020143E0
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, _0200F828 ; =0x00015CD5
	bl Get2DGfxResObjById
	bl sub_0200AF00
	mov r1, #1
	str r0, [sp, #4]
	bl NNS_G2dGetImageLocation
	mov r1, #0x19
	add r7, r0, #0
	add r0, r4, #0
	lsl r1, r1, #8
	bl DC_FlushRange
	mov r2, #0x19
	add r0, r4, #0
	add r1, r7, #0
	lsl r2, r2, #8
	bl GX_LoadOBJ
	add r0, r4, #0
	bl FreeToHeap
	ldr r2, _0200F81C ; =0x00000162
	ldrh r0, [r6]
	ldrh r1, [r6, #4]
	ldrh r2, [r5, r2]
	bl sub_02014450
	add r4, r0, #0
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0200F828 ; =0x00015CD5
	bl Get2DGfxResObjById
	ldr r1, [sp, #4]
	bl sub_0200B0F8
	mov r1, #1
	bl NNS_G2dGetImagePaletteLocation
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x20
	bl DC_FlushRange
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0x20
	bl GX_LoadOBJPltt
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0200F81C: .word 0x00000162
_0200F820: .word _020F5C50
_0200F824: .word _020F5C40
_0200F828: .word 0x00015CD5
	thumb_func_end sub_0200F748

	thumb_func_start sub_0200F82C
sub_0200F82C: ; 0x0200F82C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r3, _0200F9D8 ; =0x0000016E
	add r5, r0, #0
	ldrb r0, [r5, r3]
	add r4, r1, #0
	sub r1, r3, #2
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	sub r0, r3, #6
	sub r3, r3, #1
	ldrb r3, [r5, r3]
	ldrb r1, [r5, r1]
	ldr r0, [r5, r0]
	sub r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	add r6, r2, #0
	bl FillBgTilemapRect
	ldr r3, _0200F9D8 ; =0x0000016E
	add r2, r6, #1
	ldrb r0, [r5, r3]
	sub r1, r3, #2
	lsl r2, r2, #0x10
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	sub r0, r3, #6
	sub r3, r3, #1
	ldrb r1, [r5, r1]
	ldrb r3, [r5, r3]
	ldr r0, [r5, r0]
	lsr r2, r2, #0x10
	bl FillBgTilemapRect
	ldr r3, _0200F9D8 ; =0x0000016E
	add r2, r6, #2
	ldrb r0, [r5, r3]
	lsl r2, r2, #0x10
	sub r1, r3, #2
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	sub r0, r3, #6
	sub r3, r3, #1
	ldrb r3, [r5, r3]
	ldrb r1, [r5, r1]
	ldr r0, [r5, r0]
	add r3, #0xa
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r3, _0200F9D8 ; =0x0000016E
	add r2, r6, #4
	ldrb r0, [r5, r3]
	lsl r2, r2, #0x10
	sub r1, r3, #2
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	sub r0, r3, #6
	sub r3, r3, #1
	ldrb r1, [r5, r1]
	ldrb r3, [r5, r3]
	ldr r0, [r5, r0]
	lsr r2, r2, #0x10
	bl FillBgTilemapRect
	ldr r3, _0200F9D8 ; =0x0000016E
	add r2, r6, #3
	ldrb r0, [r5, r3]
	lsl r2, r2, #0x10
	sub r1, r3, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	sub r0, r3, #6
	sub r3, r3, #1
	ldrb r3, [r5, r3]
	ldrb r1, [r5, r1]
	ldr r0, [r5, r0]
	sub r3, r3, #1
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r3, _0200F9D8 ; =0x0000016E
	add r2, r6, #5
	ldrb r0, [r5, r3]
	lsl r2, r2, #0x10
	sub r1, r3, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	sub r0, r3, #6
	sub r3, r3, #1
	ldrb r3, [r5, r3]
	ldrb r1, [r5, r1]
	ldr r0, [r5, r0]
	add r3, #0xa
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r3, _0200F9D8 ; =0x0000016E
	add r2, r6, #6
	ldrb r0, [r5, r3]
	lsl r2, r2, #0x10
	sub r1, r3, #2
	add r0, #0xa
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	sub r0, r3, #6
	sub r3, r3, #1
	ldrb r3, [r5, r3]
	ldrb r1, [r5, r1]
	ldr r0, [r5, r0]
	sub r3, r3, #1
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r3, _0200F9D8 ; =0x0000016E
	add r2, r6, #7
	ldrb r0, [r5, r3]
	sub r1, r3, #2
	lsl r2, r2, #0x10
	add r0, #0xa
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	sub r0, r3, #6
	sub r3, r3, #1
	ldrb r1, [r5, r1]
	ldrb r3, [r5, r3]
	ldr r0, [r5, r0]
	lsr r2, r2, #0x10
	bl FillBgTilemapRect
	ldr r3, _0200F9D8 ; =0x0000016E
	add r6, #8
	ldrb r0, [r5, r3]
	lsl r2, r6, #0x10
	sub r1, r3, #2
	add r0, #0xa
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	sub r0, r3, #6
	sub r3, r3, #1
	ldrb r3, [r5, r3]
	ldrb r1, [r5, r1]
	ldr r0, [r5, r0]
	add r3, #0xa
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	mov r1, #0x5a
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldrb r1, [r5, r1]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0200F9D8: .word 0x0000016E
	thumb_func_end sub_0200F82C

	thumb_func_start sub_0200F9DC
sub_0200F9DC: ; 0x0200F9DC
	push {r4, lr}
	sub sp, #0x10
	ldr r3, _0200FA20 ; =0x0000016E
	add r4, r0, #0
	ldrb r0, [r4, r3]
	mov r2, #0
	sub r1, r3, #2
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	sub r0, r3, #6
	sub r3, r3, #1
	ldrb r3, [r4, r3]
	ldrb r1, [r4, r1]
	ldr r0, [r4, r0]
	sub r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	mov r1, #0x5a
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldrb r1, [r4, r1]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0200FA20: .word 0x0000016E
	thumb_func_end sub_0200F9DC
