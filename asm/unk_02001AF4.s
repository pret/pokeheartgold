#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	.public sub_02001AF4
	.public sub_02001B7C

	thumb_func_start sub_02001DE8
sub_02001DE8: ; 0x02001DE8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r1, [r5, #9]
	ldrb r0, [r5, #0xa]
	mov r6, #0
	add r4, r6, #0
	mul r0, r1
	cmp r0, #0
	ble _02001E24
	add r7, r6, #0
_02001DFC:
	ldr r2, [r5]
	lsl r1, r4, #3
	ldr r1, [r2, r1]
	ldrb r0, [r5, #8]
	add r2, r7, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r6, r0
	bhs _02001E14
	add r6, r0, #0
_02001E14:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldrb r1, [r5, #9]
	ldrb r0, [r5, #0xa]
	mul r0, r1
	cmp r4, r0
	blt _02001DFC
_02001E24:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02001DE8

	thumb_func_start sub_02001E28
sub_02001E28: ; 0x02001E28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrb r0, [r5, #8]
	mov r1, #6
	bl GetFontAttribute
	add r1, r0, #0
	ldr r0, [r5, #4]
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #0x19]
	ldrb r1, [r5, #0x16]
	ldrb r7, [r5, #0x17]
	lsl r0, r0, #1
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	ldrb r0, [r5, #9]
	mov r6, #0
	cmp r0, #0
	bls _02001EB0
_02001E56:
	ldrb r2, [r5, #0xa]
	mov r4, #0
	cmp r2, #0
	bls _02001E9C
_02001E5E:
	ldrb r3, [r5, #0xb]
	mul r2, r6
	ldrb r0, [r5, #0x1a]
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x1c
	add r0, r0, r3
	ldrb r1, [r5, #0x18]
	mul r0, r4
	add r2, r4, r2
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r3, [r5]
	lsl r2, r2, #3
	ldr r2, [r3, r2]
	ldrb r1, [r5, #8]
	ldr r0, [r5, #4]
	add r3, r7, #0
	bl AddTextPrinterParameterized
	add r0, r4, #1
	lsl r0, r0, #0x18
	ldrb r2, [r5, #0xa]
	lsr r4, r0, #0x18
	cmp r4, r2
	blo _02001E5E
_02001E9C:
	ldr r0, [sp, #0xc]
	add r0, r7, r0
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldrb r0, [r5, #9]
	cmp r6, r0
	blo _02001E56
_02001EB0:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02001E28

	thumb_func_start sub_02001EB4
sub_02001EB4: ; 0x02001EB4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldrb r1, [r4, #0xb]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1e
	cmp r1, #1
	beq _02001EDE
	ldrb r3, [r4, #0x15]
	add r1, sp, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02001EE4
	add r3, sp, #0
	ldrb r2, [r3, #1]
	ldrb r3, [r3]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #4]
	bl ListMenuUpdateCursorObj
_02001EDE:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02001EB4

	thumb_func_start sub_02001EE4
sub_02001EE4: ; 0x02001EE4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r7, r3, #0
	ldrb r1, [r5, #0xa]
	add r0, r7, #0
	add r6, r2, #0
	bl _s32_div_f
	ldrb r2, [r5, #0x19]
	ldrb r1, [r5, #0x16]
	lsl r2, r2, #1
	add r1, r1, r2
	mul r1, r0
	strb r1, [r4]
	ldrb r1, [r5, #0xa]
	add r0, r7, #0
	bl _s32_div_f
	ldrb r2, [r5, #0xb]
	ldrb r3, [r5, #0x1a]
	ldrb r0, [r5, #0x18]
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x1c
	add r2, r3, r2
	mul r2, r1
	add r0, r0, r2
	strb r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02001EE4

	thumb_func_start CreateYesNoMenu
CreateYesNoMenu: ; 0x02001F20
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r5, [sp, #0x3c]
	str r2, [sp, #0xc]
	add r7, r0, #0
	str r1, [sp, #8]
	str r3, [sp, #0x10]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xbf
	add r3, r5, #0
	bl NewMsgDataFromNarc
	add r4, r0, #0
	mov r0, #2
	add r1, r5, #0
	bl ListMenuItems_ctor
	add r1, r4, #0
	mov r2, #0x2a
	mov r3, #0
	add r6, r0, #0
	bl ListMenuItems_AppendFromMsgData
	mov r3, #0x2b
	add r2, r3, #0
	add r0, r6, #0
	add r1, r4, #0
	sub r3, #0x2d
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #0
	bl DestroyMsgData
	add r0, r5, #0
	mov r1, #1
	str r6, [sp, #0x14]
	bl AllocWindows
	add r1, r0, #0
	str r1, [sp, #0x18]
	mov r0, #0
	add r2, sp, #0x14
	strb r0, [r2, #8]
	mov r0, #1
	strb r0, [r2, #9]
	mov r0, #2
	strb r0, [r2, #0xa]
	ldrb r3, [r2, #0xb]
	mov r0, #0xf
	bic r3, r0
	strb r3, [r2, #0xb]
	ldrb r3, [r2, #0xb]
	mov r0, #0x30
	bic r3, r0
	strb r3, [r2, #0xb]
	ldrb r3, [r2, #0xb]
	mov r0, #0xc0
	bic r3, r0
	strb r3, [r2, #0xb]
	ldr r2, [sp, #8]
	add r0, r7, #0
	bl AddWindow
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	mov r1, #1
	bl DrawFrameAndWindow1
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r3, sp, #0x28
	ldrb r3, [r3, #0x10]
	add r0, sp, #0x14
	mov r1, #8
	mov r2, #0
	bl sub_02001B7C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end CreateYesNoMenu

	thumb_func_start Std_CreateYesNoMenu
Std_CreateYesNoMenu: ; 0x02001FC8
	push {r4, lr}
	sub sp, #8
	mov r4, #0
	str r4, [sp]
	ldr r4, [sp, #0x10]
	str r4, [sp, #4]
	bl CreateYesNoMenu
	add sp, #8
	pop {r4, pc}
	thumb_func_end Std_CreateYesNoMenu

	thumb_func_start sub_02001FDC
sub_02001FDC: ; 0x02001FDC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02001BE0
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _02001FF8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02001FFC
_02001FF8:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02001FDC

	thumb_func_start sub_02001FFC
sub_02001FFC: ; 0x02001FFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	mov r1, #0
	bl sub_0200E5D4
	ldr r0, [r5, #4]
	bl RemoveWindow
	ldr r1, [r5, #4]
	add r0, r4, #0
	bl FreeToHeapExplicit
	ldr r0, [r5]
	bl ListMenuItems_dtor
	add r0, r5, #0
	mov r1, #0
	bl sub_02001BC4
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02001FFC
