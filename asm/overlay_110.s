#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "overlay_110.inc"
	.include "global.inc"

	.text
    .public ov110_021E5D90
    .public ov110_021E6F54
    .public ov110_021E61B0
    .public ov110_021E6DC0
    .public ov110_021E6E34
    .public ov110_021E6E6C
    .public ov110_021E6E88
    .public ov110_021E6DFC
    .public ov110_021E6E18
    .public ov110_021E6E50
    .public ov110_021E6678
    
	thumb_func_start ov110_021E66F8
ov110_021E66F8: ; 0x021E66F8
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r0, #0x84
	add r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D0E4
	add r0, r4, #0
	mov r1, #0
	add r0, #0x88
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl sub_0200D108
	add r0, r4, #0
	mov r1, #0
	add r0, #0x84
	str r1, [r0]
	bl GF_DestroyVramTransferManager
	ldr r0, [r4]
	bl sub_0200B2E0
	pop {r4, pc}
	thumb_func_end ov110_021E66F8

	thumb_func_start ov110_021E6730
ov110_021E6730: ; 0x021E6730
	push {r4, lr}
	add r4, r0, #0
	bl ov110_021E6678
	add r0, r4, #0
	bl ov110_021E6764
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	pop {r4, pc}
	thumb_func_end ov110_021E6730

	thumb_func_start ov110_021E6748
ov110_021E6748: ; 0x021E6748
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl ov110_021E6898
	add r0, r4, #0
	bl ov110_021E66F8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov110_021E6748

	thumb_func_start ov110_021E6764
ov110_021E6764: ; 0x021E6764
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r6, _021E6890 ; =ov110_021E6F7C
	mov r7, #0
	add r4, r5, #0
_021E6770:
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x84
	add r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r6, #0
	bl sub_0200D2B4
	add r1, r4, #0
	add r1, #0x8c
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x8c
	mov r1, #1
	ldr r0, [r0]
	lsl r1, r1, #0xc
	bl sub_02024868
	add r7, r7, #1
	add r6, #0x28
	add r4, r4, #4
	cmp r7, #1
	ble _021E6770
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	mov r1, #0
	bl sub_02024B78
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	mov r1, #2
	bl sub_02024A04
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	mov r1, #1
	bl sub_02024B78
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r5, #0
	ldrb r3, [r5, #0x19]
	add r0, #0x84
	add r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0xac
	add r3, r3, #4
	bl sub_0200E248
	mov r7, #0
	add r6, r5, #0
_021E680A:
	add r0, r7, #2
	lsl r0, r0, #0x18
	lsr r4, r0, #0x16
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x84
	add r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _021E6894 ; =ov110_021E6FCC
	bl sub_0200D2B4
	add r1, r5, r4
	add r1, #0x8c
	str r0, [r1]
	add r0, r5, r4
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r5, r4
	add r0, #0x8c
	ldr r0, [r0]
	add r1, r7, #0
	bl Set2dSpriteAnimSeqNo
	add r0, r5, r4
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #0
	bl sub_02024B78
	add r0, r5, r4
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #2
	bl sub_0202487C
	add r0, r5, r4
	add r0, #0x8c
	ldr r1, [r0]
	add r0, r6, #0
	add r0, #0xe0
	str r1, [r0]
	add r0, r6, #0
	add r0, #0xde
	ldrb r0, [r0]
	add r2, r6, #0
	add r3, r6, #0
	str r0, [sp]
	add r2, #0xdc
	add r3, #0xdd
	lsl r1, r7, #0x18
	ldrb r2, [r2]
	ldrb r3, [r3]
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov110_021E6C18
	add r7, r7, #1
	add r6, #8
	cmp r7, #0x10
	blt _021E680A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6890: .word ov110_021E6F7C
_021E6894: .word ov110_021E6FCC
	thumb_func_end ov110_021E6764

	thumb_func_start ov110_021E6898
ov110_021E6898: ; 0x021E6898
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_021E689E:
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl Sprite_Delete
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x12
	blt _021E689E
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov110_021E6898

	thumb_func_start ov110_021E68B4
ov110_021E68B4: ; 0x021E68B4
	push {r3, r4}
	mov r1, #0
	mov r3, #0x1e
_021E68BA:
	add r2, r0, #0
	add r2, #0xde
	ldrb r2, [r2]
	cmp r2, #0
	bne _021E68EE
	lsr r4, r1, #0x1f
	lsl r2, r1, #0x1e
	sub r2, r2, r4
	ror r2, r3
	add r2, r4, r2
	add r4, r2, #1
	add r2, r0, #0
	add r2, #0xdc
	ldrb r2, [r2]
	cmp r4, r2
	bne _021E68EE
	asr r2, r1, #1
	lsr r2, r2, #0x1e
	add r2, r1, r2
	asr r2, r2, #2
	add r4, r2, #1
	add r2, r0, #0
	add r2, #0xdd
	ldrb r2, [r2]
	cmp r4, r2
	beq _021E68F4
_021E68EE:
	mov r0, #0
	pop {r3, r4}
	bx lr
_021E68F4:
	add r1, r1, #1
	add r0, #8
	cmp r1, #0x10
	blt _021E68BA
	mov r0, #1
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov110_021E68B4

	thumb_func_start ov110_021E6904
ov110_021E6904: ; 0x021E6904
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	add r0, #0x4c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	add r1, r4, #0
	bl Set2dSpriteAnimSeqNo
	cmp r4, #1
	bne _021E693C
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl sub_02024964
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	b _021E6948
_021E693C:
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
_021E6948:
	ldr r1, [r5, #0x34]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	mov r1, #4
	add r3, r0, #0
	lsl r2, r4, #2
	mov r4, #0x30
	sub r3, r4, r3
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6984 ; =ov110_021E6DA4
	lsr r3, r3, #1
	ldr r0, [r0, r2]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r5, #0x34]
	add r0, #0x4c
	bl AddTextPrinterParameterized2
	add r5, #0x4c
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6984: .word ov110_021E6DA4
	thumb_func_end ov110_021E6904

	thumb_func_start ov110_021E6988
ov110_021E6988: ; 0x021E6988
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	add r6, r3, #0
	cmp r2, #0
	beq _021E69A2
	mov r1, #1
	add r0, #0x5c
	add r2, r1, #0
	mov r3, #5
	bl DrawFrameAndWindow2
_021E69A2:
	add r0, r5, #0
	add r0, #0x5c
	mov r1, #0xf
	bl FillWindowPixelBuffer
	cmp r6, #0
	bne _021E69D0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6A00 ; =0x0001020F
	lsl r2, r4, #2
	str r0, [sp, #8]
	add r0, r5, #0
	str r3, [sp, #0xc]
	add r2, r5, r2
	ldr r2, [r2, #0x48]
	add r0, #0x5c
	mov r1, #1
	bl AddTextPrinterParameterized2
	b _021E69F2
_021E69D0:
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6A00 ; =0x0001020F
	str r6, [sp, #4]
	str r0, [sp, #8]
	lsl r2, r4, #2
	add r0, r5, #0
	str r3, [sp, #0xc]
	add r2, r5, r2
	ldr r2, [r2, #0x48]
	add r0, #0x5c
	mov r1, #1
	bl AddTextPrinterParameterized2
	add r1, r5, #0
	add r1, #0x24
	strb r0, [r1]
_021E69F2:
	add r5, #0x5c
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E6A00: .word 0x0001020F
	thumb_func_end ov110_021E6988

	thumb_func_start ov110_021E6A04
ov110_021E6A04: ; 0x021E6A04
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x6c
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6A40 ; =0x00020100
	mov r1, #4
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldrb r2, [r4, #0x19]
	add r0, r4, #0
	add r0, #0x6c
	lsl r2, r2, #2
	add r2, r4, r2
	ldr r2, [r2, #0x38]
	bl AddTextPrinterParameterized2
	add r4, #0x6c
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	nop
_021E6A40: .word 0x00020100
	thumb_func_end ov110_021E6A04

	thumb_func_start ov110_021E6A44
ov110_021E6A44: ; 0x021E6A44
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r1, #0
	add r4, r2, #0
	cmp r3, #0
	bne _021E6A74
	lsl r1, r4, #0x1a
	lsr r1, r1, #0x18
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r2, #0
	lsl r3, r5, #2
	str r2, [sp, #0xc]
	add r3, r3, #4
	lsl r3, r3, #0x18
	ldr r0, [r0, #0x14]
	mov r1, #2
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add sp, #0x1c
	pop {r4, r5, pc}
_021E6A74:
	add r1, r0, #0
	add r1, #0xd4
	ldr r1, [r1]
	mov r2, #4
	str r2, [sp]
	str r2, [sp, #4]
	add r2, r1, #0
	add r2, #0xc
	str r2, [sp, #8]
	sub r2, r3, #1
	lsl r2, r2, #0x1a
	lsr r2, r2, #0x18
	str r2, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	ldrh r2, [r1]
	lsl r3, r4, #0x1a
	lsr r3, r3, #0x18
	lsl r2, r2, #0x15
	lsr r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r1, [r1, #2]
	lsl r2, r5, #2
	add r2, r2, #4
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x18]
	lsl r2, r2, #0x18
	ldr r0, [r0, #0x14]
	mov r1, #2
	lsr r2, r2, #0x18
	bl CopyToBgTilemapRect
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov110_021E6A44

	thumb_func_start ov110_021E6ABC
ov110_021E6ABC: ; 0x021E6ABC
	push {r4, r5, r6, lr}
	add r6, r2, #0
	mov r2, #0x57
	add r5, r0, #0
	lsl r2, r2, #2
	add r4, r1, #0
	add r1, r5, #0
	ldr r3, [r5, r2]
	add r1, #0x22
	ldrb r1, [r1]
	ldrb r2, [r3]
	cmp r2, r1
	bne _021E6AEA
	add r2, r5, #0
	add r2, #0x23
	ldrb r2, [r2]
	ldrb r3, [r3, #1]
	cmp r3, r2
	bne _021E6AEA
	mov r3, #2
	bl ov110_021E6A44
	b _021E6AF8
_021E6AEA:
	add r2, r5, #0
	add r2, #0x23
	ldrb r2, [r2]
	add r0, r5, #0
	mov r3, #0
	bl ov110_021E6A44
_021E6AF8:
	ldr r0, [r5, #0x14]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	cmp r4, #0
	bne _021E6B08
	cmp r6, #0
	beq _021E6B34
_021E6B08:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	ldrb r0, [r1]
	cmp r0, r4
	bne _021E6B28
	ldrb r0, [r1, #1]
	cmp r0, r6
	bne _021E6B28
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #3
	bl ov110_021E6A44
	pop {r4, r5, r6, pc}
_021E6B28:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #1
	bl ov110_021E6A44
_021E6B34:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov110_021E6ABC

	thumb_func_start ov110_021E6B38
ov110_021E6B38: ; 0x021E6B38
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4, #0x14]
	mov r2, #0
	str r0, [sp]
	mov r0, #0x1f
	str r0, [sp, #8]
	mov r0, #6
	str r0, [sp, #0xc]
	str r2, [sp, #4]
	mov r1, #0x19
	add r0, sp, #0
	strb r1, [r0, #0x10]
	mov r1, #0xa
	strb r1, [r0, #0x11]
	ldrb r1, [r0, #0x12]
	mov r3, #0xf
	bic r1, r3
	ldr r3, [r4, #4]
	lsl r3, r3, #0x18
	lsr r5, r3, #0x18
	mov r3, #0xf
	and r3, r5
	orr r1, r3
	strb r1, [r0, #0x12]
	ldrb r3, [r0, #0x12]
	mov r1, #0xf0
	bic r3, r1
	mov r1, #0x10
	orr r1, r3
	strb r1, [r0, #0x12]
	strb r2, [r0, #0x13]
	ldr r0, [r4, #0x7c]
	add r4, #0x80
	ldr r2, [r4]
	add r1, sp, #0
	bl sub_02016704
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov110_021E6B38

	thumb_func_start ov110_021E6B94
ov110_021E6B94: ; 0x021E6B94
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x7c]
	bl sub_020168F4
	cmp r0, #1
	beq _021E6BA8
	cmp r0, #2
	beq _021E6BAC
	b _021E6BB0
_021E6BA8:
	mov r4, #7
	b _021E6BB4
_021E6BAC:
	mov r4, #1
	b _021E6BB4
_021E6BB0:
	mov r0, #5
	pop {r3, r4, r5, pc}
_021E6BB4:
	ldr r0, [r5, #0x7c]
	bl sub_020169C0
	str r0, [r5, #4]
	ldr r0, [r5, #0x7c]
	bl sub_020169CC
	add r0, r5, #0
	add r0, #0x5c
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r0, #0x5c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x5c
	bl ScheduleWindowCopyToVram
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov110_021E6B94

	thumb_func_start ov110_021E6BEC
ov110_021E6BEC: ; 0x021E6BEC
	push {r4, lr}
	ldrb r3, [r0, #2]
	ldr r4, _021E6C10 ; =ov110_021E6D94
	ldr r0, [r0, #4]
	lsl r3, r3, #1
	ldrsb r4, [r4, r3]
	add r1, r1, r4
	ldr r4, _021E6C14 ; =ov110_021E6D94 + 1
	lsl r1, r1, #0x10
	ldrsb r3, [r4, r3]
	asr r1, r1, #0x10
	add r2, r2, r3
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	pop {r4, pc}
	nop
_021E6C10: .word ov110_021E6D94
_021E6C14: .word ov110_021E6D94 + 1
	thumb_func_end ov110_021E6BEC

	thumb_func_start ov110_021E6C18
ov110_021E6C18: ; 0x021E6C18
	push {r4, lr}
	add r0, #0xdc
	lsl r1, r1, #3
	add r4, r0, r1
	strb r2, [r0, r1]
	lsl r1, r2, #5
	ldr r0, _021E6C54 ; =0xFFFFFFF8
	lsl r2, r3, #5
	add r1, #0x30
	add r2, #0x10
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	strb r3, [r4, #1]
	add r0, sp
	ldrb r0, [r0, #0x10]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	strb r0, [r4, #2]
	add r0, r4, #0
	bl ov110_021E6BEC
	ldr r1, _021E6C54 ; =0xFFFFFFF8
	ldr r0, [r4, #4]
	add r1, sp
	ldrb r1, [r1, #0x10]
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x10
	bl sub_02024818
	pop {r4, pc}
	.balign 4, 0
_021E6C54: .word 0xFFFFFFF8
	thumb_func_end ov110_021E6C18

	thumb_func_start ov110_021E6C58
ov110_021E6C58: ; 0x021E6C58
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	cmp r2, #0
	beq _021E6CCC
	strb r1, [r4, #0x1b]
	ldrb r0, [r4, #0x1b]
	add r1, r4, #0
	add r1, #0xdc
	lsl r0, r0, #3
	add r1, r1, r0
	mov r0, #0x57
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	mov r1, #0
	ldr r0, [r0, #4]
	bl sub_02024ADC
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	mvn r1, r1
	ldr r0, [r0, #4]
	add r2, r1, #0
	bl sub_0200DEA0
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	add r0, r4, #0
	ldrb r1, [r2]
	ldrb r2, [r2, #1]
	add r0, #0x90
	lsl r1, r1, #5
	lsl r2, r2, #5
	add r1, #0x30
	add r2, #0x10
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	add r0, r4, #0
	mov r1, #2
	bl ov110_021E6904
	add sp, #4
	pop {r3, r4, pc}
_021E6CCC:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	ldr r0, [r0, #4]
	bl sub_02024ADC
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r3, [r4, r0]
	ldrb r0, [r3, #2]
	str r0, [sp]
	ldrb r2, [r3]
	ldrb r1, [r4, #0x1b]
	ldrb r3, [r3, #1]
	add r0, r4, #0
	bl ov110_021E6C18
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #0
	bl ov110_021E6904
	add r0, r4, #0
	mov r1, #0
	add r0, #0x22
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x23
	strb r1, [r0]
	mov r0, #0x57
	lsl r0, r0, #2
	str r1, [r4, r0]
	strb r1, [r4, #0x1b]
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov110_021E6C58

	thumb_func_start ov110_021E6D20
ov110_021E6D20: ; 0x021E6D20
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #8
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #8
	add r5, r0, #0
	bl MI_CpuFill8
	ldr r0, _021E6D50 ; =ov110_021E6D54
	add r1, r5, #0
	mov r2, #0
	str r4, [r5]
	bl CreateSysTask
	add r0, r4, #0
	mov r1, #1
	bl ov110_021E6904
	mov r0, #1
	strb r0, [r4, #0x1a]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6D50: .word ov110_021E6D54
	thumb_func_end ov110_021E6D20

	thumb_func_start ov110_021E6D54
ov110_021E6D54: ; 0x021E6D54
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	add r0, #0x8c
	ldr r0, [r0]
	bl sub_02024B68
	cmp r0, #0
	bne _021E6D8A
	ldr r0, [r4]
	mov r1, #0
	bl ov110_021E6904
	ldr r0, [r4]
	mov r1, #0
	strb r1, [r0, #0x1a]
	add r0, r4, #0
	mov r2, #8
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_021E6D8A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov110_021E6D54

	.rodata

.public _021E6D8C

_021E6D8C:
	.byte 0xA9, 0xBF, 0xD1, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00

ov110_021E6D94: ; 0x021E6D94
	.byte 0x00, 0x00
	.byte 0xFF, 0x00
	.byte 0xFF, 0xFF
	.byte 0x00, 0xFF

.public ov110_021E6D9C

ov110_021E6D9C: ; 0x021E6D9C
	.byte 0x00, 0x00
	.byte 0x05, 0x00
	.byte 0x00, 0x05
	.byte 0x05, 0x05

ov110_021E6DA4: ; 0x021E6DA4
	.word 0x00010200
	.word 0x00030400
	.word 0x00050600

.public ov110_021E6DB0
ov110_021E6DB0: ; 0x021E6DB0
	.byte 0x0A, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x08, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x4A, 0x00, 0x00, 0x00

ov110_021E6DC0: ; 0x021E6DC0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

.public ov110_021E6DD0
ov110_021E6DD0: ; 0x021E6DD0
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

.public ov110_021E6DE4

ov110_021E6DE4: ; 0x021E6DE4
	.byte 0x02, 0x1A, 0x15, 0x06, 0x03, 0x03
	.short 0x03EE
	.byte 0x00, 0x02, 0x13, 0x1B, 0x04, 0x04
	.short 0x005B
	.byte 0x04, 0x04, 0x0F, 0x18, 0x06, 0x03
	.short 0x0001

ov110_021E6DFC: ; 0x021E6DFC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov110_021E6E18: ; 0x021E6E18
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov110_021E6E34: ; 0x021E6E34
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov110_021E6E50: ; 0x021E6E50
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov110_021E6E6C: ; 0x021E6E6C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov110_021E6E88: ; 0x021E6E88
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

.public ov110_021E6EA4
ov110_021E6EA4: ; 0x021E6EA4
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00

sAlphKabutoPuzzle:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x26, 0x81, 0x00, 0x83, 0x84, 0x00
	.byte 0x00, 0x85, 0x00, 0x87, 0x88, 0x4B 
    .byte 0x00, 0x00, 0x8A, 0x00, 0x8C, 0x00
    .byte 0x62, 0x8D, 0x8E, 0x8F, 0x90, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x29, 0x00

sAlphAerodactylPuzzle:
	.byte 0x00, 0x6A, 0x00, 0x4E, 0x00, 0x00 
    .byte 0x00, 0x00, 0x00, 0x83, 0x84, 0x00 
    .byte 0x00, 0x00, 0x00, 0x87, 0x88, 0x70
    .byte 0x62, 0x89, 0x00, 0x8B, 0x8C, 0x00
	.byte 0x00, 0x8D, 0x00, 0x8F, 0x00, 0x46
    .byte 0x00, 0x00, 0x41, 0x00, 0x25, 0x00

sAlphOmanytePuzzle:
	.byte 0x00, 0x00, 0x2B, 0x00, 0x0A, 0x00 
    .byte 0x09, 0x00, 0x82, 0x83, 0x84, 0x00 
    .byte 0x00, 0x85, 0x86, 0x00, 0x00, 0x4E 
    .byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x6D 
    .byte 0x61, 0x00, 0x00, 0x8F, 0x90, 0x00 
    .byte 0x00, 0x47, 0x2C, 0x00, 0x00, 0x00

sAlphHoOhPuzzle:
	.byte 0x00, 0x00, 0x09, 0x6E, 0x61, 0x00 
    .byte 0x4F, 0x00, 0x00, 0x83, 0x84, 0x00 
    .byte 0x4D, 0x85, 0x86, 0x87, 0x00, 0x6A 
    .byte 0x62, 0x00, 0x00, 0x00, 0x8C, 0x00 
    .byte 0x00, 0x00, 0x00, 0x00, 0x90, 0x6B
    .byte 0x00, 0x45, 0x28, 0x00, 0x00, 0x00

ov110_021E6F54: ; 0x021E6F54
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov110_021E6F7C: ; 0x021E6F7C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov110_021E6FCC: ; 0x021E6FCC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.data

.public dAlphPuzzles

dAlphPuzzles:
	.word sAlphKabutoPuzzle
	.word sAlphAerodactylPuzzle
	.word sAlphOmanytePuzzle
	.word sAlphHoOhPuzzle
	; 0x021E7020
