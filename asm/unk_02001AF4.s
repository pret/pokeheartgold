#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02001AF4
sub_02001AF4: ; 0x02001AF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	str r3, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	add r6, r1, #0
	mov r1, #0x20
	add r7, r2, #0
	str r0, [sp, #4]
	bl AllocFromHeap
	add r4, r0, #0
	add r3, r5, #0
	ldmia r3!, {r0, r1}
	add r2, r4, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #4]
	bl ListMenuCursorNew
	str r0, [r4, #0xc]
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x10]
	ldr r0, [sp]
	strb r0, [r4, #0x15]
	add r0, r4, #0
	bl sub_02001DE8
	strb r0, [r4, #0x16]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	mov r1, #0
	strb r0, [r4, #0x1c]
	strb r6, [r4, #0x17]
	strb r7, [r4, #0x18]
	ldrb r0, [r5, #8]
	bl GetFontAttribute
	add r6, r0, #0
	ldrb r0, [r5, #8]
	mov r1, #2
	bl GetFontAttribute
	add r0, r6, r0
	strb r0, [r4, #0x19]
	ldrb r0, [r5, #8]
	mov r1, #1
	bl GetFontAttribute
	add r6, r0, #0
	ldrb r0, [r5, #8]
	mov r1, #3
	bl GetFontAttribute
	add r0, r6, r0
	strb r0, [r4, #0x1a]
	add r0, r4, #0
	bl sub_02001E28
	add r0, r4, #0
	bl sub_02001EB4
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02001AF4

	thumb_func_start sub_02001B7C
sub_02001B7C: ; 0x02001B7C
	push {r4, lr}
	sub sp, #8
	add r4, sp, #0
	ldrb r4, [r4, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x14]
	str r4, [sp, #4]
	bl sub_02001AF4
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl CopyWindowToVram
	add r0, r4, #0
	add sp, #8
	pop {r4, pc}
	thumb_func_end sub_02001B7C

	thumb_func_start sub_02001B9C
sub_02001B9C: ; 0x02001B9C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldrb r0, [r5, #8]
	add r6, r1, #0
	add r4, r2, #0
	mov r1, #0
	bl GetFontAttribute
	add r1, r0, #0
	str r4, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #0
	add r3, r6, #0
	bl sub_02001B7C
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02001B9C

	thumb_func_start sub_02001BC4
sub_02001BC4: ; 0x02001BC4
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	beq _02001BD0
	ldrb r0, [r4, #0x15]
	strb r0, [r1]
_02001BD0:
	ldr r0, [r4, #0xc]
	bl DestroyListMenuCursorObj
	ldrb r0, [r4, #0x1c]
	add r1, r4, #0
	bl FreeToHeapExplicit
	pop {r4, pc}
	thumb_func_end sub_02001BC4

	thumb_func_start sub_02001BE0
sub_02001BE0: ; 0x02001BE0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r1, #0
	ldr r2, _02001C8C ; =gMain
	strb r1, [r4, #0x1b]
	ldr r2, [r2, #0x48]
	mov r5, #1
	add r3, r2, #0
	tst r3, r5
	beq _02001C06
	ldr r0, _02001C90 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	ldrb r0, [r4, #0x15]
	ldr r1, [r4]
	lsl r0, r0, #3
	add r0, r1, r0
	ldr r0, [r0, #4]
	pop {r3, r4, r5, pc}
_02001C06:
	ldr r3, [r4, #0x10]
	tst r3, r2
	beq _02001C16
	ldr r0, _02001C90 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	sub r0, r5, #3
	pop {r3, r4, r5, pc}
_02001C16:
	mov r3, #0x40
	tst r3, r2
	beq _02001C30
	ldr r2, _02001C90 ; =SEQ_SE_DP_SELECT
	bl sub_02001C98
	cmp r0, #1
	bne _02001C2A
	add r0, r5, #0
	strb r0, [r4, #0x1b]
_02001C2A:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02001C30:
	mov r1, #0x80
	tst r1, r2
	beq _02001C4C
	ldr r2, _02001C90 ; =SEQ_SE_DP_SELECT
	add r1, r5, #0
	bl sub_02001C98
	cmp r0, #1
	bne _02001C46
	mov r0, #2
	strb r0, [r4, #0x1b]
_02001C46:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02001C4C:
	mov r1, #0x20
	tst r1, r2
	beq _02001C68
	ldr r2, _02001C90 ; =SEQ_SE_DP_SELECT
	mov r1, #2
	bl sub_02001C98
	cmp r0, #1
	bne _02001C62
	mov r0, #3
	strb r0, [r4, #0x1b]
_02001C62:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02001C68:
	mov r1, #0x10
	tst r2, r1
	beq _02001C84
	ldr r2, _02001C90 ; =SEQ_SE_DP_SELECT
	mov r1, #3
	bl sub_02001C98
	cmp r0, #1
	bne _02001C7E
	mov r0, #4
	strb r0, [r4, #0x1b]
_02001C7E:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02001C84:
	sub r1, #0x11
	add r0, r1, #0
	pop {r3, r4, r5, pc}
	nop
_02001C8C: .word gMain
_02001C90: .word SEQ_SE_DP_SELECT
	thumb_func_end sub_02001BE0

	thumb_func_start sub_02001C94
sub_02001C94: ; 0x02001C94
	ldrb r0, [r0, #0x15]
	bx lr
	thumb_func_end sub_02001C94

	thumb_func_start sub_02001C98
sub_02001C98: ; 0x02001C98
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r2, #0
	ldrb r4, [r5, #0x15]
	bl sub_02001CF0
	cmp r0, #0
	bne _02001CB0
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02001CB0:
	ldrb r0, [r5, #8]
	mov r1, #6
	bl GetFontAttribute
	add r1, sp, #8
	add r7, r0, #0
	add r0, r5, #0
	add r1, #1
	add r2, sp, #8
	add r3, r4, #0
	bl sub_02001EE4
	mov r0, #8
	str r0, [sp]
	ldrb r0, [r5, #0x1a]
	add r3, sp, #8
	add r1, r7, #0
	str r0, [sp, #4]
	ldrb r2, [r3, #1]
	ldrb r3, [r3]
	ldr r0, [r5, #4]
	bl FillWindowPixelRect
	add r0, r5, #0
	bl sub_02001EB4
	add r0, r6, #0
	bl PlaySE
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02001C98

	thumb_func_start sub_02001CF0
sub_02001CF0: ; 0x02001CF0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	cmp r1, #0
	bne _02001D2E
	ldrb r6, [r5, #0xa]
	cmp r6, #1
	bhi _02001D02
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001D02:
	ldrb r4, [r5, #0x15]
	add r1, r6, #0
	add r0, r4, #0
	bl _s32_div_f
	cmp r1, #0
	bne _02001D26
	ldrb r0, [r5, #0xb]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	bne _02001D1C
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001D1C:
	sub r0, r6, #1
	add r0, r4, r0
	lsl r0, r0, #0x18
	asr r2, r0, #0x18
	b _02001DCE
_02001D26:
	sub r0, r4, #1
	lsl r0, r0, #0x18
	asr r2, r0, #0x18
	b _02001DCE
_02001D2E:
	cmp r1, #1
	bne _02001D66
	ldrb r1, [r5, #0xa]
	cmp r1, #1
	bhi _02001D3C
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001D3C:
	ldrb r6, [r5, #0x15]
	sub r4, r1, #1
	add r0, r6, #0
	bl _s32_div_f
	cmp r4, r1
	bne _02001D5E
	ldrb r0, [r5, #0xb]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	bne _02001D56
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001D56:
	sub r0, r6, r4
	lsl r0, r0, #0x18
	asr r2, r0, #0x18
	b _02001DCE
_02001D5E:
	add r0, r6, #1
	lsl r0, r0, #0x18
	asr r2, r0, #0x18
	b _02001DCE
_02001D66:
	cmp r1, #2
	bne _02001D9C
	ldrb r3, [r5, #9]
	cmp r3, #1
	bhi _02001D74
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001D74:
	ldrb r2, [r5, #0xa]
	ldrb r1, [r5, #0x15]
	cmp r1, r2
	bhs _02001D94
	ldrb r0, [r5, #0xb]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	bne _02001D88
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001D88:
	sub r0, r3, #1
	mul r0, r2
	add r0, r1, r0
	lsl r0, r0, #0x18
	asr r2, r0, #0x18
	b _02001DCE
_02001D94:
	sub r0, r1, r2
	lsl r0, r0, #0x18
	asr r2, r0, #0x18
	b _02001DCE
_02001D9C:
	ldrb r2, [r5, #9]
	cmp r2, #1
	bhi _02001DA6
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001DA6:
	ldrb r1, [r5, #0xa]
	ldrb r0, [r5, #0x15]
	sub r2, r2, #1
	mul r2, r1
	cmp r0, r2
	blt _02001DC8
	ldrb r2, [r5, #0xb]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1e
	bne _02001DBE
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001DBE:
	bl _s32_div_f
	lsl r0, r1, #0x18
	asr r2, r0, #0x18
	b _02001DCE
_02001DC8:
	add r0, r0, r1
	lsl r0, r0, #0x18
	asr r2, r0, #0x18
_02001DCE:
	ldr r1, [r5]
	lsl r0, r2, #3
	add r0, r1, r0
	ldr r1, [r0, #4]
	mov r0, #2
	mvn r0, r0
	cmp r1, r0
	bne _02001DE2
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001DE2:
	strb r2, [r5, #0x15]
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02001CF0

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
	bl sub_02002F30
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
