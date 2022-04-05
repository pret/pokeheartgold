#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public _020FA484
	.public gNatureStatMods

	.text

	thumb_func_start sub_0208C3E4
sub_0208C3E4: ; 0x0208C3E4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r5, #0
	add r4, r7, #4
_0208C3EC:
	ldr r2, _0208C428 ; =_02104D94
	lsl r6, r5, #4
	lsl r3, r5, #3
	ldr r0, [r7]
	add r1, r4, r6
	add r2, r2, r3
	bl AddWindow
	add r0, r4, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #0x22
	blo _0208C3EC
	add r0, r7, #0
	bl sub_0208C9A4
	add r0, r7, #0
	bl sub_0208C57C
	add r0, r7, #0
	bl sub_0208C614
	add r0, r7, #0
	bl sub_0208C6B4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208C428: .word _02104D94
	thumb_func_end sub_0208C3E4

	thumb_func_start sub_0208C42C
sub_0208C42C: ; 0x0208C42C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, _0208C4D0 ; =0x000007BC
	ldrsb r0, [r4, r0]
	cmp r0, #3
	bhi _0208C4CE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208C444: ; jump table
	.short _0208C44C - _0208C444 - 2 ; case 0
	.short _0208C458 - _0208C444 - 2 ; case 1
	.short _0208C464 - _0208C444 - 2 ; case 2
	.short _0208C470 - _0208C444 - 2 ; case 3
_0208C44C:
	mov r0, #0x8a
	mov r1, #8
	lsl r0, r0, #2
	ldr r7, _0208C4D4 ; =_02104CC4
	str r1, [r4, r0]
	b _0208C48C
_0208C458:
	mov r0, #0x8a
	mov r1, #0x12
	lsl r0, r0, #2
	ldr r7, _0208C4D8 ; =_02104D04
	str r1, [r4, r0]
	b _0208C48C
_0208C464:
	mov r0, #0x8a
	mov r1, #8
	lsl r0, r0, #2
	ldr r7, _0208C4DC ; =_02104C84
	str r1, [r4, r0]
	b _0208C48C
_0208C470:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #3
	beq _0208C480
	cmp r0, #4
	bne _0208C4CE
_0208C480:
	mov r0, #0x8a
	mov r1, #3
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0208C48C
_0208C48A:
	pop {r3, r4, r5, r6, r7, pc}
_0208C48C:
	mov r1, #0x8a
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	mov r0, #0x13
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl AllocWindows
	mov r1, #0x89
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #4
	ldr r0, [r4, r0]
	mov r5, #0
	cmp r0, #0
	bls _0208C4CE
	add r6, r5, #0
_0208C4AE:
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r0, [r4]
	add r1, r1, r6
	add r2, r7, #0
	bl AddWindow
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r5, r5, #1
	add r7, #8
	add r6, #0x10
	cmp r5, r0
	blo _0208C4AE
_0208C4CE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208C4D0: .word 0x000007BC
_0208C4D4: .word _02104CC4
_0208C4D8: .word _02104D04
_0208C4DC: .word _02104C84
	thumb_func_end sub_0208C42C

	thumb_func_start sub_0208C4E0
sub_0208C4E0: ; 0x0208C4E0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, _0208C55C ; =0x000007BC
	ldrsb r0, [r4, r0]
	cmp r0, #3
	bhi _0208C55A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208C4F8: ; jump table
	.short _0208C500 - _0208C4F8 - 2 ; case 0
	.short _0208C500 - _0208C4F8 - 2 ; case 1
	.short _0208C52A - _0208C4F8 - 2 ; case 2
	.short _0208C536 - _0208C4F8 - 2 ; case 3
_0208C500:
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r6, #0
	cmp r0, #0
	bls _0208C548
	mov r7, #0x8a
	add r5, r6, #0
	lsl r7, r7, #2
_0208C512:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, r0, r5
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, [r4, r7]
	add r6, r6, #1
	add r5, #0x10
	cmp r6, r0
	blo _0208C512
	b _0208C548
_0208C52A:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ClearWindowTilemapAndCopyToVram
	b _0208C548
_0208C536:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #3
	beq _0208C548
	cmp r0, #4
	beq _0208C548
	pop {r3, r4, r5, r6, r7, pc}
_0208C548:
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl WindowArray_dtor
_0208C55A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208C55C: .word 0x000007BC
	thumb_func_end sub_0208C4E0

	thumb_func_start sub_0208C560
sub_0208C560: ; 0x0208C560
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0208C4E0
	mov r4, #0
	add r5, r5, #4
_0208C56C:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x22
	blo _0208C56C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0208C560

	thumb_func_start sub_0208C57C
sub_0208C57C: ; 0x0208C57C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r4, #0x85
	add r5, r0, #0
	lsl r4, r4, #2
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	add r2, r4, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208C60C ; =0x000E0F00
	add r2, #0x20
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r5, r4
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	add r0, #0x2e
	ldrb r1, [r5, r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1f
	bne _0208C600
	add r0, r0, #1
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1e
	bne _0208C5E0
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #1
	bl ReadMsgDataIntoString
	mov r2, #0xc1
	add r0, r5, #0
	add r1, r5, r4
	lsl r2, r2, #0xa
	mov r3, #1
	bl sub_0208C778
	b _0208C600
_0208C5E0:
	cmp r0, #1
	bne _0208C600
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #2
	bl ReadMsgDataIntoString
	ldr r2, _0208C610 ; =0x00050600
	add r0, r5, #0
	add r1, r5, r4
	mov r3, #1
	bl sub_0208C778
_0208C600:
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0208C60C: .word 0x000E0F00
_0208C610: .word 0x00050600
	thumb_func_end sub_0208C57C

	thumb_func_start sub_0208C614
sub_0208C614: ; 0x0208C614
	push {r4, r5, r6, lr}
	sub sp, #0x10
	mov r6, #0x81
	add r5, r0, #0
	lsl r6, r6, #2
	add r0, r5, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #0
	add r0, #0x7c
	ldr r0, [r5, r0]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	bne _0208C69C
	mov r0, #5
	str r0, [sp]
	ldr r0, _0208C6A8 ; =0x0000079C
	mov r1, #1
	ldr r0, [r5, r0]
	add r2, r5, r6
	mov r3, #0
	bl sub_0200CDAC
	mov r0, #0x7a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #3
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	add r2, r6, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r2, #0x3e
	ldrb r2, [r5, r2]
	ldr r0, _0208C6AC ; =0x000007A8
	mov r3, #3
	lsl r2, r2, #0x19
	ldr r0, [r5, r0]
	lsr r2, r2, #0x19
	bl BufferIntegerAsString
	ldr r1, _0208C6AC ; =0x000007A8
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	lsl r0, r6, #7
	str r0, [sp, #8]
	ldr r2, _0208C6B0 ; =0x000007AC
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r5, r6
	mov r3, #0x10
	bl AddTextPrinterParameterized2
_0208C69C:
	add r0, r5, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0208C6A8: .word 0x0000079C
_0208C6AC: .word 0x000007A8
_0208C6B0: .word 0x000007AC
	thumb_func_end sub_0208C614

	thumb_func_start sub_0208C6B4
sub_0208C6B4: ; 0x0208C6B4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0208C730 ; =0x0000023E
	ldrh r2, [r5, r0]
	cmp r2, #0
	beq _0208C6FA
	ldr r0, _0208C734 ; =0x000007A8
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferItemName
	mov r0, #0x7a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #5
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _0208C734 ; =0x000007A8
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	b _0208C70A
_0208C6FA:
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #6
	bl ReadMsgDataIntoString
_0208C70A:
	mov r1, #0x7d
	lsl r1, r1, #2
	ldr r2, _0208C738 ; =0x00010200
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0
	bl sub_0208C778
	add r0, r5, #0
	add r0, #0x64
	bl ScheduleWindowCopyToVram
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	pop {r3, r4, r5, pc}
	nop
_0208C730: .word 0x0000023E
_0208C734: .word 0x000007A8
_0208C738: .word 0x00010200
	thumb_func_end sub_0208C6B4

	thumb_func_start sub_0208C73C
sub_0208C73C: ; 0x0208C73C
	push {r4, lr}
	mov r3, #0x8b
	lsl r3, r3, #2
	add r1, r0, #0
	add r2, r3, #0
	add r2, #0x18
	ldr r0, [r1, r3]
	ldr r4, [r1, r2]
	ldr r2, [r0, #0xc]
	cmp r4, r2
	bne _0208C774
	add r2, r3, #0
	add r2, #0x48
	ldrb r2, [r1, r2]
	ldrb r0, [r0, #0x10]
	cmp r2, r0
	bne _0208C774
	mov r2, #0x7b
	add r3, #0xc
	lsl r2, r2, #4
	ldr r0, [r1, r3]
	ldr r1, [r1, r2]
	bl StringCompare
	cmp r0, #0
	bne _0208C774
	mov r0, #1
	pop {r4, pc}
_0208C774:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_0208C73C

	thumb_func_start sub_0208C778
sub_0208C778: ; 0x0208C778
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	cmp r3, #0
	beq _0208C790
	cmp r3, #1
	beq _0208C794
	cmp r3, #2
	beq _0208C7B6
	b _0208C7DA
_0208C790:
	mov r3, #0
	b _0208C7DA
_0208C794:
	ldr r1, _0208C7F4 ; =0x000007AC
	mov r0, #0
	ldr r1, [r4, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r6, #0
	bl GetWindowWidth
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x18
	sub r0, r0, r5
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	b _0208C7DA
_0208C7B6:
	ldr r1, _0208C7F4 ; =0x000007AC
	mov r0, #0
	ldr r1, [r4, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r6, #0
	bl GetWindowWidth
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x18
	sub r1, r0, r5
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0x17
	lsr r3, r0, #0x18
_0208C7DA:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r7, [sp, #8]
	ldr r2, _0208C7F4 ; =0x000007AC
	str r1, [sp, #0xc]
	ldr r2, [r4, r2]
	add r0, r6, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208C7F4: .word 0x000007AC
	thumb_func_end sub_0208C778

	thumb_func_start sub_0208C7F8
sub_0208C7F8: ; 0x0208C7F8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0208C83C ; =0x00000263
	add r6, r1, #0
	ldrb r1, [r5, r0]
	ldr r4, _0208C840 ; =0x000E0F00
	lsl r0, r1, #2
	add r1, r1, r0
	ldr r0, _0208C844 ; =gNatureStatMods
	add r0, r0, r1
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bge _0208C816
	ldr r4, _0208C848 ; =0x000E0800
	b _0208C81A
_0208C816:
	ble _0208C81A
	ldr r4, _0208C84C ; =0x000E0700
_0208C81A:
	mov r3, #0x7a
	lsl r3, r3, #4
	ldr r0, [r5, r3]
	add r3, #0xc
	add r1, r2, #0
	ldr r2, [r5, r3]
	bl ReadMsgDataIntoString
	add r2, r5, #4
	lsl r1, r6, #4
	add r1, r2, r1
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0208C778
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0208C83C: .word 0x00000263
_0208C840: .word 0x000E0F00
_0208C844: .word gNatureStatMods
_0208C848: .word 0x000E0800
_0208C84C: .word 0x000E0700
	thumb_func_end sub_0208C7F8

	thumb_func_start sub_0208C850
sub_0208C850: ; 0x0208C850
	push {r4, r5, r6, lr}
	add r6, r3, #0
	mov r3, #0x7a
	add r5, r0, #0
	lsl r3, r3, #4
	ldr r0, [r5, r3]
	add r4, r1, #0
	add r3, #0xc
	add r1, r2, #0
	ldr r2, [r5, r3]
	bl ReadMsgDataIntoString
	add r2, r5, #4
	lsl r1, r4, #4
	add r1, r2, r1
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	add r2, r6, #0
	bl sub_0208C778
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0208C850

	thumb_func_start sub_0208C87C
sub_0208C87C: ; 0x0208C87C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x7a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r6, r2, #0
	add r7, r3, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	mov r1, #0
	add r2, r6, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0208C8C4 ; =0x000007A8
	add r3, r7, #0
	ldr r0, [r5, r0]
	bl BufferIntegerAsString
	ldr r1, _0208C8C4 ; =0x000007A8
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208C8C4: .word 0x000007A8
	thumb_func_end sub_0208C87C

	thumb_func_start sub_0208C8C8
sub_0208C8C8: ; 0x0208C8C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r0, #0
	str r3, [sp, #0x10]
	mov r0, #0x89
	mov r3, #0x7a
	lsl r0, r0, #2
	lsl r7, r1, #4
	lsl r3, r3, #4
	ldr r5, [r4, r0]
	ldr r0, [r4, r3]
	add r3, #0xc
	add r1, r2, #0
	ldr r2, [r4, r3]
	bl ReadMsgDataIntoString
	ldr r1, _0208C99C ; =0x000007AC
	mov r0, #0
	ldr r1, [r4, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r1, sp, #0x48
	ldrb r2, [r1]
	lsr r1, r0, #1
	sub r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	add r0, r1, r0
	str r1, [sp, #0x14]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x18]
	add r0, sp, #0x4c
	ldrb r0, [r0]
	mov r1, #0
	ldr r2, _0208C99C ; =0x000007AC
	str r0, [sp, #0x1c]
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208C9A0 ; =0x00010200
	ldr r3, [sp, #0x14]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r4, r2]
	add r0, r5, r7
	bl AddTextPrinterParameterized2
	mov r0, #0
	str r0, [sp]
	add r3, sp, #0x28
	ldrh r2, [r3, #0x14]
	ldrb r3, [r3, #0x1c]
	ldr r1, [sp, #0x10]
	add r0, r4, #0
	bl sub_0208C87C
	ldr r1, _0208C99C ; =0x000007AC
	mov r0, #0
	ldr r1, [r4, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov ip, r0
	ldr r0, [sp, #0x1c]
	mov r1, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208C9A0 ; =0x00010200
	ldr r2, _0208C99C ; =0x000007AC
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r3, [sp, #0x14]
	mov r6, ip
	ldr r2, [r4, r2]
	add r0, r5, r7
	sub r3, r3, r6
	bl AddTextPrinterParameterized2
	mov r0, #0
	str r0, [sp]
	add r3, sp, #0x28
	ldrh r2, [r3, #0x18]
	ldrb r3, [r3, #0x1c]
	ldr r1, [sp, #0x38]
	add r0, r4, #0
	bl sub_0208C87C
	ldr r0, [sp, #0x1c]
	mov r1, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208C9A0 ; =0x00010200
	ldr r2, _0208C99C ; =0x000007AC
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r4, r2]
	ldr r3, [sp, #0x18]
	add r0, r5, r7
	bl AddTextPrinterParameterized2
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208C99C: .word 0x000007AC
_0208C9A0: .word 0x00010200
	thumb_func_end sub_0208C8C8

	thumb_func_start sub_0208C9A4
sub_0208C9A4: ; 0x0208C9A4
	push {r4, lr}
	sub sp, #0x10
	ldr r3, _0208CBC8 ; =0x000E0F00
	mov r1, #0
	mov r2, #7
	add r4, r0, #0
	str r1, [sp]
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x17
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #2
	mov r2, #0x6d
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #3
	mov r2, #0x7e
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #4
	mov r2, #0x80
	bl sub_0208C850
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq _0208CA14
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #5
	mov r2, #0x9d
	bl sub_0208C850
	b _0208CA1E
_0208CA14:
	add r0, r4, #0
	add r0, #0x54
	mov r1, #0
	bl FillWindowPixelBuffer
_0208CA1E:
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #6
	mov r2, #4
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #7
	mov r2, #8
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #8
	mov r2, #0xa
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #9
	mov r2, #0xc
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0xd
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0xf
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #0x11
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0x13
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #0x6e
	bl sub_0208C850
	mov r3, #0
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0x6f
	str r3, [sp]
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x11
	mov r2, #0x70
	mov r3, #1
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0x71
	mov r3, #3
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #0x72
	mov r3, #4
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x14
	mov r2, #0x73
	mov r3, #2
	bl sub_0208C7F8
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0x74
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0208CBC8 ; =0x000E0F00
	add r2, #0x55
	str r0, [sp, #8]
	add r0, r4, r2
	ldr r2, _0208CBCC ; =0x000007AC
	str r1, [sp, #0xc]
	ldr r2, [r4, r2]
	mov r3, #3
	bl AddTextPrinterParameterized2
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0x92
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	ldr r0, _0208CBC8 ; =0x000E0F00
	ldr r2, _0208CBCC ; =0x000007AC
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r1, #0x75
	add r0, r4, r1
	ldr r2, [r4, r2]
	mov r1, #4
	bl AddTextPrinterParameterized2
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #0x95
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0x19
	mov r2, #0x93
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0x1a
	mov r2, #0x94
	bl sub_0208C850
	mov r0, #2
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0x1b
	mov r2, #0xa2
	bl sub_0208C850
	mov r0, #2
	str r0, [sp]
	ldr r3, _0208CBD0 ; =0x00010200
	add r0, r4, #0
	mov r1, #0x1c
	mov r2, #0xa0
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBD0 ; =0x00010200
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #0xb6
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0x1e
	mov r2, #0xb3
	bl sub_0208C850
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0208CBC8: .word 0x000E0F00
_0208CBCC: .word 0x000007AC
_0208CBD0: .word 0x00010200
	thumb_func_end sub_0208C9A4

	thumb_func_start sub_0208CBD4
sub_0208CBD4: ; 0x0208CBD4
	push {r4, lr}
	sub sp, #0x10
	mov r2, #0
	add r4, r0, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	mov r1, #1
	add r3, r2, #0
	bl FillBgTilemapRect
	mov r0, #2
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	mov r0, #0x16
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r2, #0
	ldr r0, [r4]
	mov r1, #1
	add r3, r2, #0
	bl FillBgTilemapRect
	mov r0, #1
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	mov r0, #0x17
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r2, #0
	ldr r0, [r4]
	mov r1, #4
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, _0208CC84 ; =0x000007BC
	ldrsb r0, [r4, r0]
	cmp r0, #3
	bhi _0208CC7E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208CC40: ; jump table
	.short _0208CC48 - _0208CC40 - 2 ; case 0
	.short _0208CC58 - _0208CC40 - 2 ; case 1
	.short _0208CC68 - _0208CC40 - 2 ; case 2
	.short _0208CC78 - _0208CC40 - 2 ; case 3
_0208CC48:
	add r0, r4, #0
	bl sub_0208CC88
	add r0, r4, #0
	bl sub_0208D0A4
	add sp, #0x10
	pop {r4, pc}
_0208CC58:
	add r0, r4, #0
	bl sub_0208D178
	add r0, r4, #0
	bl sub_0208D474
	add sp, #0x10
	pop {r4, pc}
_0208CC68:
	add r0, r4, #0
	bl sub_0208D520
	add r0, r4, #0
	bl sub_0208D6B8
	add sp, #0x10
	pop {r4, pc}
_0208CC78:
	add r0, r4, #0
	bl sub_0208D728
_0208CC7E:
	add sp, #0x10
	pop {r4, pc}
	nop
_0208CC84: .word 0x000007BC
	thumb_func_end sub_0208CBD4

	thumb_func_start sub_0208CC88
sub_0208CC88: ; 0x0208CC88
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0xa
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	beq _0208CD34
	add r0, r4, #4
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0x74
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0x84
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0x94
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0xa4
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0xb4
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0xc4
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0xd4
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0xe4
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x10
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x20
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x30
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x40
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x50
	bl ClearWindowTilemapAndScheduleTransfer
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0208CD34:
	add r0, r4, #4
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x74
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x84
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x94
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0xa4
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0xb4
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0xc4
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0xd4
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0xe4
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x10
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x20
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x30
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x40
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x50
	bl FillWindowPixelBuffer
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x10
	ldrh r1, [r4, r1]
	ldr r0, [r0, #0x1c]
	bl Pokedex_ConvertToCurrentDexNo
	add r2, r0, #0
	beq _0208CDF0
	mov r0, #2
	str r0, [sp]
	add r0, r4, #0
	mov r1, #9
	mov r3, #3
	bl sub_0208C87C
	b _0208CE00
_0208CDF0:
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0x16
	bl ReadMsgDataIntoString
_0208CE00:
	mov r1, #0xa
	lsl r1, r1, #6
	ldr r0, [r4, r1]
	lsl r0, r0, #2
	lsr r0, r0, #0x1f
	bne _0208CE1C
	sub r1, #0x5c
	ldr r1, [r4, r1]
	ldr r2, _0208CFA8 ; =0x00010200
	add r0, r4, #0
	mov r3, #2
	bl sub_0208C778
	b _0208CE2A
_0208CE1C:
	sub r1, #0x5c
	ldr r1, [r4, r1]
	ldr r2, _0208CFAC ; =0x00050600
	add r0, r4, #0
	mov r3, #2
	bl sub_0208C778
_0208CE2A:
	mov r1, #0x23
	lsl r1, r1, #4
	mov r0, #0
	ldr r1, [r4, r1]
	add r2, r0, #0
	mov r3, #0x48
	bl FontID_String_GetCenterAlignmentX
	mov r1, #0
	add r3, r0, #0
	mov r2, #0x89
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208CFA8 ; =0x00010200
	lsl r2, r2, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	add r0, #0x10
	bl AddTextPrinterParameterized2
	mov r1, #0x9d
	lsl r1, r1, #2
	ldrb r0, [r4, r1]
	cmp r0, #0
	bne _0208CE96
	sub r1, #0x3c
	mov r0, #0
	ldr r1, [r4, r1]
	add r2, r0, #0
	mov r3, #0x48
	bl FontID_String_GetCenterAlignmentX
	mov r1, #0
	add r3, r0, #0
	mov r2, #0x89
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0xc1
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	add r2, #0x14
	ldr r2, [r4, r2]
	add r0, #0x20
	bl AddTextPrinterParameterized2
	b _0208CEC4
_0208CE96:
	sub r1, #0x3c
	mov r0, #0
	ldr r1, [r4, r1]
	add r2, r0, #0
	mov r3, #0x48
	bl FontID_String_GetCenterAlignmentX
	mov r1, #0
	add r3, r0, #0
	mov r2, #0x89
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208CFAC ; =0x00050600
	lsl r2, r2, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, r2]
	add r2, #0x14
	ldr r2, [r4, r2]
	add r0, #0x20
	bl AddTextPrinterParameterized2
_0208CEC4:
	mov r0, #2
	mov r2, #0x91
	str r0, [sp]
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	add r0, r4, #0
	lsl r2, r2, #0x10
	mov r1, #0x10
	lsr r2, r2, #0x10
	mov r3, #5
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208CFA8 ; =0x00010200
	add r0, r4, #0
	add r1, #0x30
	mov r3, #2
	bl sub_0208C778
	mov r0, #0
	mov r2, #0x92
	str r0, [sp]
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	add r0, r4, #0
	mov r1, #0x12
	mov r3, #7
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208CFA8 ; =0x00010200
	add r0, r4, #0
	add r1, #0x40
	mov r3, #1
	bl sub_0208C778
	ldr r3, _0208CFB0 ; =0x00000242
	ldrb r0, [r4, r3]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	cmp r0, #0x64
	bhs _0208CF3C
	mov r0, #0
	add r2, r3, #0
	str r0, [sp]
	add r2, #0xe
	ldr r5, [r4, r2]
	add r2, r3, #6
	ldr r2, [r4, r2]
	add r0, r4, #0
	mov r1, #0x15
	sub r2, r5, r2
	mov r3, #7
	bl sub_0208C87C
	b _0208CF4A
_0208CF3C:
	mov r2, #0
	add r0, r4, #0
	mov r1, #0x15
	mov r3, #7
	str r2, [sp]
	bl sub_0208C87C
_0208CF4A:
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208CFA8 ; =0x00010200
	add r0, r4, #0
	add r1, #0x50
	mov r3, #1
	bl sub_0208C778
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x10
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x20
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x30
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x40
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x50
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0208CFA8: .word 0x00010200
_0208CFAC: .word 0x00050600
_0208CFB0: .word 0x00000242
	thumb_func_end sub_0208CC88

	thumb_func_start sub_0208CFB4
sub_0208CFB4: ; 0x0208CFB4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0x13
	bl sub_0208E600
	add r4, r0, #0
	ldr r2, [r4, #0x18]
	cmp r2, #0
	beq _0208CFE8
	ldr r0, [r4, #0x14]
	mov r1, #0
	sub r0, r0, #1
	lsl r0, r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D074 ; =0x00010200
	mov r3, #6
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_0208CFE8:
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _0208D00A
	ldr r0, [r4, #0x1c]
	mov r1, #0
	sub r0, r0, #1
	lsl r0, r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D074 ; =0x00010200
	mov r3, #6
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_0208D00A:
	ldr r2, [r4, #0x28]
	cmp r2, #0
	beq _0208D02C
	ldr r0, [r4, #0x24]
	mov r1, #0
	sub r0, r0, #1
	lsl r0, r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D074 ; =0x00010200
	mov r3, #6
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_0208D02C:
	ldr r2, [r4, #0x38]
	cmp r2, #0
	beq _0208D04E
	ldr r0, [r4, #0x34]
	mov r1, #0
	sub r0, r0, #1
	lsl r0, r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D074 ; =0x00010200
	mov r3, #6
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_0208D04E:
	mov r0, #5
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5]
	mov r1, #1
	mov r3, #0x10
	bl FillBgTilemapRect
	add r0, r4, #0
	bl sub_0208E994
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0208D074: .word 0x00010200
	thumb_func_end sub_0208CFB4

	thumb_func_start sub_0208D078
sub_0208D078: ; 0x0208D078
	push {r3, r4, r5, r6}
	ldr r6, _0208D0A0 ; =0x00000299
	sub r1, r6, #1
	ldrb r4, [r0, r1]
	sub r1, r6, #2
	ldrb r3, [r0, r1]
	sub r1, r6, #3
	ldrb r2, [r0, r1]
	sub r1, r6, #5
	ldrb r5, [r0, r6]
	sub r6, r6, #4
	ldrb r1, [r0, r1]
	ldrb r0, [r0, r6]
	add r0, r1, r0
	add r0, r2, r0
	add r0, r3, r0
	add r0, r4, r0
	add r0, r5, r0
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_0208D0A0: .word 0x00000299
	thumb_func_end sub_0208D078

	thumb_func_start sub_0208D0A4
sub_0208D0A4: ; 0x0208D0A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x14
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r0, #0x60
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl sub_0208A520
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0208C73C
	add r7, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	ldrb r1, [r1, #0x11]
	cmp r1, #2
	bne _0208D102
	mov r0, #0x13
	bl AllocMonZeroed
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl CopyBoxPokemonToPokemon
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	add r0, #0x60
	add r2, r7, #0
	bl sub_0208CFB4
	add r0, r4, #0
	bl FreeToHeap
	b _0208D110
_0208D102:
	sub r0, #8
	ldr r0, [r5, r0]
	add r1, r6, #0
	add r0, #0x60
	add r2, r7, #0
	bl sub_0208CFB4
_0208D110:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x60
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl sub_0208D078
	cmp r0, #0
	beq _0208D170
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r0, #0x70
	bl FillWindowPixelBuffer
	mov r0, #0x7a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0xc0
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	ldr r0, _0208D174 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r4, #0
	add r0, #0x70
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x70
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
_0208D170:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208D174: .word 0x00010200
	thumb_func_end sub_0208D0A4

	thumb_func_start sub_0208D178
sub_0208D178: ; 0x0208D178
	push {r3, r4, r5, lr}
	sub sp, #0x18
	mov r3, #0
	mov r1, #0x10
	mov r2, #0x6f
	add r4, r0, #0
	str r3, [sp]
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x11
	mov r2, #0x70
	mov r3, #1
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0x71
	mov r3, #3
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #0x72
	mov r3, #4
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x14
	mov r2, #0x73
	mov r3, #2
	bl sub_0208C7F8
	add r0, r4, #0
	add r0, #0x24
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0xf4
	bl ScheduleWindowCopyToVram
	mov r0, #0x41
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x49
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x4d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x51
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x55
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x10
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x20
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x30
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x40
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x50
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x60
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x70
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl GetWindowWidth
	mov r1, #0x76
	str r1, [sp]
	mov r1, #0x95
	lsl r1, r1, #2
	ldrh r2, [r4, r1]
	lsl r0, r0, #0x1a
	add r1, r1, #2
	str r2, [sp, #4]
	ldrh r1, [r4, r1]
	lsr r0, r0, #0x18
	mov r2, #0x75
	str r1, [sp, #8]
	mov r1, #3
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r1, #0
	add r0, r4, #0
	mov r3, #0x77
	str r1, [sp, #0x14]
	bl sub_0208C8C8
	mov r0, #0
	mov r2, #0x96
	str r0, [sp]
	lsl r2, r2, #2
	ldrh r2, [r4, r2]
	add r0, r4, #0
	mov r1, #0x78
	mov r3, #3
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D458 ; =0x00010200
	add r0, r4, #0
	add r1, #0x10
	mov r3, #1
	bl sub_0208C778
	mov r0, #0
	str r0, [sp]
	ldr r2, _0208D45C ; =0x0000025A
	add r0, r4, #0
	ldrh r2, [r4, r2]
	mov r1, #0x79
	mov r3, #3
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D458 ; =0x00010200
	add r0, r4, #0
	add r1, #0x20
	mov r3, #1
	bl sub_0208C778
	mov r0, #0
	mov r2, #0x97
	str r0, [sp]
	lsl r2, r2, #2
	ldrh r2, [r4, r2]
	add r0, r4, #0
	mov r1, #0x7a
	mov r3, #3
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D458 ; =0x00010200
	add r0, r4, #0
	add r1, #0x30
	mov r3, #1
	bl sub_0208C778
	mov r0, #0
	str r0, [sp]
	ldr r2, _0208D460 ; =0x0000025E
	add r0, r4, #0
	ldrh r2, [r4, r2]
	mov r1, #0x7b
	mov r3, #3
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D458 ; =0x00010200
	add r0, r4, #0
	add r1, #0x40
	mov r3, #1
	bl sub_0208C778
	mov r0, #0
	mov r2, #0x26
	str r0, [sp]
	lsl r2, r2, #4
	ldrh r2, [r4, r2]
	add r0, r4, #0
	mov r1, #0x7c
	mov r3, #3
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D458 ; =0x00010200
	add r0, r4, #0
	add r1, #0x50
	mov r3, #1
	bl sub_0208C778
	ldr r2, _0208D464 ; =0x00000262
	ldr r0, _0208D468 ; =0x000007A8
	ldrb r2, [r4, r2]
	ldr r0, [r4, r0]
	mov r1, #0
	bl BufferAbilityName
	mov r0, #0x7a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x7d
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _0208D468 ; =0x000007A8
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D458 ; =0x00010200
	add r0, r4, #0
	add r1, #0x60
	mov r3, #0
	bl sub_0208C778
	ldr r2, _0208D46C ; =0x000002D2
	mov r0, #1
	mov r1, #0x1b
	mov r3, #0x13
	bl NewMsgDataFromNarc
	ldr r1, _0208D464 ; =0x00000262
	ldr r2, _0208D470 ; =0x000007AC
	ldrb r1, [r4, r1]
	ldr r2, [r4, r2]
	add r5, r0, #0
	bl ReadMsgDataIntoString
	add r0, r5, #0
	bl DestroyMsgData
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D458 ; =0x00010200
	ldr r2, _0208D470 ; =0x000007AC
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	add r0, #0x70
	mov r3, #3
	bl AddTextPrinterParameterized2
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x10
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x20
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x30
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x40
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x50
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x60
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x70
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_0208D458: .word 0x00010200
_0208D45C: .word 0x0000025A
_0208D460: .word 0x0000025E
_0208D464: .word 0x00000262
_0208D468: .word 0x000007A8
_0208D46C: .word 0x000002D2
_0208D470: .word 0x000007AC
	thumb_func_end sub_0208D178

	thumb_func_start sub_0208D474
sub_0208D474: ; 0x0208D474
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #2
	beq _0208D48C
	add r0, r4, #0
	add r0, #0x44
	bl ScheduleWindowCopyToVram
_0208D48C:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x80
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x90
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0xa0
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0xb0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	mov r1, #0
	bl sub_0208D884
	add r0, r4, #0
	mov r1, #1
	bl sub_0208D884
	add r0, r4, #0
	mov r1, #2
	bl sub_0208D884
	add r0, r4, #0
	mov r1, #3
	bl sub_0208D884
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x80
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x90
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xa0
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xb0
	bl ScheduleWindowCopyToVram
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
	thumb_func_end sub_0208D474

	thumb_func_start sub_0208D520
sub_0208D520: ; 0x0208D520
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x54
	bl ScheduleWindowCopyToVram
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _0208D53A
	b _0208D6AA
_0208D53A:
	sub r0, #8
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x30
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x40
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x50
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x60
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x70
	bl FillWindowPixelBuffer
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xbb
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D6B0 ; =0x00010200
	ldr r2, _0208D6B4 ; =0x000007AC
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	add r0, #0x30
	mov r3, #4
	bl AddTextPrinterParameterized2
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xbc
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D6B0 ; =0x00010200
	ldr r2, _0208D6B4 ; =0x000007AC
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	add r0, #0x40
	mov r3, #4
	bl AddTextPrinterParameterized2
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xbd
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D6B0 ; =0x00010200
	ldr r2, _0208D6B4 ; =0x000007AC
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	add r0, #0x50
	mov r3, #4
	bl AddTextPrinterParameterized2
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xbe
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D6B0 ; =0x00010200
	ldr r2, _0208D6B4 ; =0x000007AC
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	add r0, #0x60
	mov r3, #4
	bl AddTextPrinterParameterized2
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xbf
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D6B0 ; =0x00010200
	ldr r2, _0208D6B4 ; =0x000007AC
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	add r0, #0x70
	mov r3, #4
	bl AddTextPrinterParameterized2
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x30
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x40
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x50
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x60
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x70
	bl ScheduleWindowCopyToVram
_0208D6AA:
	add sp, #0x10
	pop {r4, pc}
	nop
_0208D6B0: .word 0x00010200
_0208D6B4: .word 0x000007AC
	thumb_func_end sub_0208D520

	thumb_func_start sub_0208D6B8
sub_0208D6B8: ; 0x0208D6B8
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0x79
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x75
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	ldr r2, _0208D720 ; =0x000007C6
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #0xb7
	mov r3, #3
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D724 ; =0x00010200
	add r0, r4, #0
	mov r3, #0
	bl sub_0208C778
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScheduleWindowCopyToVram
	ldr r0, [r4]
	mov r1, #4
	bl BgCommitTilemapBufferToVram
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0208D720: .word 0x000007C6
_0208D724: .word 0x00010200
	thumb_func_end sub_0208D6B8

	thumb_func_start sub_0208D728
sub_0208D728: ; 0x0208D728
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #3
	beq _0208D73E
	cmp r0, #4
	bne _0208D7B0
_0208D73E:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x10
	bl FillWindowPixelBuffer
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xa5
	bl ReadMsgDataIntoString
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D7B4 ; =0x000E0F00
	add r0, r4, #0
	add r1, #0x10
	mov r3, #0
	bl sub_0208C778
	ldr r1, _0208D7B8 ; =0x0000027B
	mov r2, #0x7a
	lsl r2, r2, #4
	ldrb r1, [r4, r1]
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	add r1, #0xa6
	bl ReadMsgDataIntoString
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D7BC ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r2, _0208D7C0 ; =0x000007AC
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	add r0, #0x10
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x10
	bl ScheduleWindowCopyToVram
_0208D7B0:
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0208D7B4: .word 0x000E0F00
_0208D7B8: .word 0x0000027B
_0208D7BC: .word 0x00010200
_0208D7C0: .word 0x000007AC
	thumb_func_end sub_0208D728

	thumb_func_start sub_0208D7C4
sub_0208D7C4: ; 0x0208D7C4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x10
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x20
	bl FillWindowPixelBuffer
	ldr r0, _0208D870 ; =0x000007C4
	add r1, r0, #1
	ldrb r2, [r4, r1]
	ldrb r3, [r4, r0]
	lsl r1, r2, #3
	add r1, r2, r1
	add r2, r3, r1
	add r1, r0, #2
	ldrb r1, [r4, r1]
	cmp r2, r1
	bge _0208D854
	add r0, r0, #3
	ldrb r0, [r4, r0]
	mov r1, #3
	bl GetRibbonAttr
	ldr r2, _0208D874 ; =0x000007A4
	add r1, r0, #0
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	bl ReadMsgDataIntoString
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D878 ; =0x000E0F00
	add r0, r4, #0
	add r1, #0x10
	mov r3, #0
	bl sub_0208C778
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, _0208D87C ; =0x000007C7
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0, #0x20]
	bl GetRibbonDescGmm
	ldr r2, _0208D874 ; =0x000007A4
	add r1, r0, #0
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	bl ReadMsgDataIntoString
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D880 ; =0x00010200
	add r0, r4, #0
	add r1, #0x20
	mov r3, #0
	bl sub_0208C778
_0208D854:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x10
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x20
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
	nop
_0208D870: .word 0x000007C4
_0208D874: .word 0x000007A4
_0208D878: .word 0x000E0F00
_0208D87C: .word 0x000007C7
_0208D880: .word 0x00010200
	thumb_func_end sub_0208D7C4

	thumb_func_start sub_0208D884
sub_0208D884: ; 0x0208D884
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	mov r0, #0x89
	add r4, r1, #0
	lsl r0, r0, #2
	add r1, #8
	lsl r7, r1, #4
	ldr r6, [r5, r0]
	cmp r4, #4
	beq _0208D8B8
	lsl r1, r4, #1
	add r2, r5, r1
	add r1, r0, #0
	add r1, #0x40
	ldrh r1, [r2, r1]
	add r2, r0, #0
	add r2, #0x48
	str r1, [sp, #0x20]
	add r1, r5, r4
	ldrb r2, [r1, r2]
	add r0, #0x4c
	str r2, [sp, #0x1c]
	ldrb r0, [r1, r0]
	str r0, [sp, #0x18]
	b _0208D8CA
_0208D8B8:
	add r0, #8
	ldr r0, [r5, r0]
	mov r1, #0
	ldrh r0, [r0, #0x18]
	str r0, [sp, #0x20]
	bl WazaGetMaxPp
	str r0, [sp, #0x1c]
	str r0, [sp, #0x18]
_0208D8CA:
	ldr r2, _0208D994 ; =0x000007B4
	ldr r1, [sp, #0x20]
	ldr r0, [r5, r2]
	sub r2, #8
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r0, #2
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D998 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r2, _0208D99C ; =0x000007AC
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r6, r7
	mov r3, #1
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0208D952
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x87
	bl ReadMsgDataIntoString
	mov r3, #0x10
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D998 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r2, _0208D99C ; =0x000007AC
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r6, r7
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x8d
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	add r4, #0x88
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	add r1, #8
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x3c
	str r0, [sp, #0x10]
	mov r0, #0x10
	str r0, [sp, #0x14]
	add r0, r5, #0
	mov r2, #0x75
	add r3, r4, #0
	bl sub_0208C8C8
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0208D952:
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x99
	bl ReadMsgDataIntoString
	ldr r1, _0208D99C ; =0x000007AC
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D998 ; =0x00010200
	lsr r4, r3, #1
	str r0, [sp, #8]
	mov r1, #0
	mov r3, #0x3c
	ldr r2, _0208D99C ; =0x000007AC
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r6, r7
	sub r3, r3, r4
	bl AddTextPrinterParameterized2
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0208D994: .word 0x000007B4
_0208D998: .word 0x00010200
_0208D99C: .word 0x000007AC
	thumb_func_end sub_0208D884

	thumb_func_start sub_0208D9A0
sub_0208D9A0: ; 0x0208D9A0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r5, r0
	add r4, r1, #0
	bl ScheduleWindowCopyToVram
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x69
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r0, #0xd0
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r0, #0xe0
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r0, #0xf0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	mov r1, #2
	bl GetWazaAttr
	add r2, r0, #0
	cmp r2, #1
	bhi _0208DA10
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x9a
	bl ReadMsgDataIntoString
	b _0208DA1E
_0208DA10:
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x96
	mov r3, #3
	bl sub_0208C87C
_0208DA1E:
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldr r2, _0208DAC8 ; =0x00010200
	add r0, r5, #0
	add r1, #0xd0
	mov r3, #1
	bl sub_0208C778
	add r0, r4, #0
	mov r1, #4
	bl GetWazaAttr
	add r2, r0, #0
	bne _0208DA4E
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x9a
	bl ReadMsgDataIntoString
	b _0208DA5C
_0208DA4E:
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x97
	mov r3, #3
	bl sub_0208C87C
_0208DA5C:
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldr r2, _0208DAC8 ; =0x00010200
	add r0, r5, #0
	add r1, #0xe0
	mov r3, #1
	bl sub_0208C778
	ldr r2, _0208DACC ; =0x000002ED
	mov r0, #1
	mov r1, #0x1b
	mov r3, #0x13
	bl NewMsgDataFromNarc
	ldr r2, _0208DAD0 ; =0x000007AC
	add r1, r4, #0
	ldr r2, [r5, r2]
	add r6, r0, #0
	bl ReadMsgDataIntoString
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldr r2, _0208DAC8 ; =0x00010200
	add r0, r5, #0
	add r1, #0xf0
	mov r3, #0
	bl sub_0208C778
	add r0, r6, #0
	bl DestroyMsgData
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0xd0
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0xe0
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0xf0
	bl ScheduleWindowCopyToVram
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0208DAC8: .word 0x00010200
_0208DACC: .word 0x000002ED
_0208DAD0: .word 0x000007AC
	thumb_func_end sub_0208D9A0

	thumb_func_start sub_0208DAD4
sub_0208DAD4: ; 0x0208DAD4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x69
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xd0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xe0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xf0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	thumb_func_end sub_0208DAD4

	thumb_func_start sub_0208DB1C
sub_0208DB1C: ; 0x0208DB1C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldrh r1, [r1, #0x18]
	cmp r1, #0
	beq _0208DB4E
	sub r0, #8
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0xc0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	mov r1, #4
	bl sub_0208D884
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xc0
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
_0208DB4E:
	sub r0, #0xb8
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
	thumb_func_end sub_0208DB1C

	thumb_func_start sub_0208DB58
sub_0208DB58: ; 0x0208DB58
	ldr r3, _0208DB60 ; =ScheduleBgTilemapBufferTransfer
	ldr r0, [r0]
	mov r1, #1
	bx r3
	.balign 4, 0
_0208DB60: .word ScheduleBgTilemapBufferTransfer
	thumb_func_end sub_0208DB58

	thumb_func_start sub_0208DB64
sub_0208DB64: ; 0x0208DB64
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldr r0, _0208DBEC ; =0x000007BD
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	add r0, #8
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldr r0, _0208DBEC ; =0x000007BD
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	add r0, #8
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _0208DBEC ; =0x000007BD
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bl sub_0208D884
	ldr r1, _0208DBEC ; =0x000007BD
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	bl sub_0208D884
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldr r0, _0208DBEC ; =0x000007BD
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	add r0, #8
	lsl r0, r0, #4
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldr r0, _0208DBEC ; =0x000007BD
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	add r0, #8
	lsl r0, r0, #4
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
	nop
_0208DBEC: .word 0x000007BD
	thumb_func_end sub_0208DB64

	thumb_func_start sub_0208DBF0
sub_0208DBF0: ; 0x0208DBF0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0208DC60 ; =0x000007BC
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne _0208DC2A
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0xd0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0xe0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0xf0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r4, #0xf0
	b _0208DC32
_0208DC2A:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r4, #0x50
_0208DC32:
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x9c
	bl ReadMsgDataIntoString
	ldr r2, _0208DC64 ; =0x00010200
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl sub_0208C778
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	pop {r3, r4, r5, pc}
	nop
_0208DC60: .word 0x000007BC
_0208DC64: .word 0x00010200
	thumb_func_end sub_0208DBF0

	thumb_func_start sub_0208DC68
sub_0208DC68: ; 0x0208DC68
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	cmp r1, #1
	bne _0208DCD6
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #1
	lsl r0, r0, #8
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xc1
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	mov r2, #0xff
	ldr r0, _0208DD18 ; =0x000E0F00
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x89
	str r3, [sp, #0xc]
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r0, r2, #1
	ldr r2, _0208DD1C ; =0x000007AC
	add r0, r1, r0
	ldr r2, [r4, r2]
	mov r1, #4
	bl AddTextPrinterParameterized2
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xc0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #1
	lsl r0, r0, #8
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
_0208DCD6:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #1
	lsl r0, r0, #8
	add r0, r1, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldrh r1, [r1, #0x18]
	cmp r1, #0
	beq _0208DD12
	sub r0, #8
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0xc0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	mov r1, #4
	bl sub_0208D884
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xc0
	bl ScheduleWindowCopyToVram
_0208DD12:
	add sp, #0x10
	pop {r4, pc}
	nop
_0208DD18: .word 0x000E0F00
_0208DD1C: .word 0x000007AC
	thumb_func_end sub_0208DC68

	thumb_func_start sub_0208DD20
sub_0208DD20: ; 0x0208DD20
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	cmp r1, #1
	bne _0208DD82
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xc2
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	ldr r0, _0208DD98 ; =0x000E0F00
	ldr r2, _0208DD9C ; =0x000007AC
	str r0, [sp, #8]
	mov r0, #0x89
	str r3, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, #0x11
	add r0, r0, r1
	ldr r2, [r4, r2]
	mov r1, #4
	bl AddTextPrinterParameterized2
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
_0208DD82:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r1, r0
	bl ClearWindowTilemapAndScheduleTransfer
	add sp, #0x10
	pop {r4, pc}
	nop
_0208DD98: .word 0x000E0F00
_0208DD9C: .word 0x000007AC
	thumb_func_end sub_0208DD20

	thumb_func_start sub_0208DDA0
sub_0208DDA0: ; 0x0208DDA0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	cmp r1, #4
	bgt _0208DDC4
	cmp r1, #0
	blt _0208DDE2
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208DDBA: ; jump table
	.short _0208DDCA - _0208DDBA - 2 ; case 0
	.short _0208DDCE - _0208DDBA - 2 ; case 1
	.short _0208DDD2 - _0208DDBA - 2 ; case 2
	.short _0208DDD6 - _0208DDBA - 2 ; case 3
	.short _0208DDDA - _0208DDBA - 2 ; case 4
_0208DDC4:
	cmp r1, #0xfe
	beq _0208DDDE
	b _0208DDE2
_0208DDCA:
	mov r5, #0xac
	b _0208DDE4
_0208DDCE:
	mov r5, #0xae
	b _0208DDE4
_0208DDD2:
	mov r5, #0xaf
	b _0208DDE4
_0208DDD6:
	mov r5, #0xb0
	b _0208DDE4
_0208DDDA:
	mov r5, #0xad
	b _0208DDE4
_0208DDDE:
	mov r5, #0xb1
	b _0208DDE4
_0208DDE2:
	mov r5, #0xb2
_0208DDE4:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r6, [r4, r0]
	ldr r2, _0208DE34 ; =0x000003E2
	add r6, #0x20
	add r0, r6, #0
	mov r1, #1
	mov r3, #0xd
	bl DrawFrameAndWindow2
	add r0, r6, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	add r1, r5, #0
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208DE38 ; =0x0001020F
	ldr r2, _0208DE3C ; =0x000007AC
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r4, r2]
	add r0, r6, #0
	mov r1, #1
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0208DE34: .word 0x000003E2
_0208DE38: .word 0x0001020F
_0208DE3C: .word 0x000007AC
	thumb_func_end sub_0208DDA0

	.rodata

	.balign 4, 0
_02104C84:
	.byte 0x04, 0x0D, 0x11, 0x05, 0x02, 0x0D
	.short 0x021F
	.byte 0x04, 0x01, 0x10, 0x15, 0x02, 0x0D
	.short 0x0229
	.byte 0x04, 0x01, 0x12, 0x1E, 0x04, 0x0D
	.short 0x0253
	.byte 0x01, 0x01, 0x03, 0x0A, 0x02, 0x0D
	.short 0x021F
	.byte 0x01, 0x01, 0x07, 0x0A, 0x02, 0x0D
	.short 0x0233
	.byte 0x01, 0x01, 0x0B, 0x0A, 0x02, 0x0D
	.short 0x0247
	.byte 0x01, 0x01, 0x0F, 0x0A, 0x02, 0x0D
	.short 0x025B
	.byte 0x01, 0x01, 0x13, 0x0A, 0x02, 0x0D
	.short 0x026F
_02104CC4:
	.byte 0x04, 0x0C, 0x01, 0x03, 0x02, 0x0D
	.short 0x021F
	.byte 0x04, 0x09, 0x03, 0x09, 0x02, 0x0D
	.short 0x0227
	.byte 0x04, 0x09, 0x07, 0x09, 0x02, 0x0D
	.short 0x0239
	.byte 0x04, 0x0B, 0x09, 0x05, 0x02, 0x0D
	.short 0x024B
	.byte 0x04, 0x0A, 0x0D, 0x07, 0x02, 0x0D
	.short 0x0255
	.byte 0x04, 0x0B, 0x11, 0x06, 0x02, 0x0D
	.short 0x0263
	.byte 0x01, 0x00, 0x03, 0x12, 0x12, 0x0D
	.short 0x021F
	.byte 0x01, 0x01, 0x16, 0x0B, 0x02, 0x0D
	.short 0x0363
_02104D04:
	.byte 0x01, 0x0B, 0x03, 0x07, 0x02, 0x0D
	.short 0x021F
	.byte 0x01, 0x0D, 0x06, 0x03, 0x02, 0x0D
	.short 0x022D
	.byte 0x01, 0x0D, 0x08, 0x03, 0x02, 0x0D
	.short 0x0233
	.byte 0x01, 0x0D, 0x0A, 0x03, 0x02, 0x0D
	.short 0x0239
	.byte 0x01, 0x0D, 0x0C, 0x03, 0x02, 0x0D
	.short 0x023F
	.byte 0x01, 0x0D, 0x0E, 0x03, 0x02, 0x0D
	.short 0x0245
	.byte 0x01, 0x09, 0x11, 0x09, 0x02, 0x0D
	.short 0x024B
	.byte 0x01, 0x00, 0x13, 0x13, 0x04, 0x0D
	.short 0x025D
	.byte 0x04, 0x05, 0x01, 0x0B, 0x04, 0x0D
	.short 0x021F
	.byte 0x04, 0x05, 0x05, 0x0B, 0x04, 0x0D
	.short 0x024B
	.byte 0x04, 0x05, 0x09, 0x0B, 0x04, 0x0D
	.short 0x0277
	.byte 0x04, 0x05, 0x0D, 0x0B, 0x04, 0x0D
	.short 0x02A3
	.byte 0x04, 0x05, 0x13, 0x0B, 0x04, 0x0D
	.short 0x02CF
	.byte 0x04, 0x1B, 0x06, 0x03, 0x02, 0x0D
	.short 0x02FB
	.byte 0x04, 0x1B, 0x08, 0x03, 0x02, 0x0D
	.short 0x0301
	.byte 0x04, 0x11, 0x0A, 0x0F, 0x0A, 0x0D
	.short 0x0307
	.byte 0x04, 0x01, 0x14, 0x0F, 0x02, 0x0D
	.short 0x039D
	.byte 0x04, 0x01, 0x11, 0x0A, 0x02, 0x0D
	.short 0x039D
_02104D94:
	.byte 0x04, 0x14, 0x01, 0x0B, 0x02, 0x0D
	.short 0x0001
	.byte 0x01, 0x14, 0x01, 0x0B, 0x02, 0x0D
	.short 0x0017
	.byte 0x01, 0x14, 0x01, 0x0B, 0x02, 0x0D
	.short 0x002D
	.byte 0x01, 0x01, 0x00, 0x0B, 0x02, 0x0D
	.short 0x0043
	.byte 0x04, 0x14, 0x01, 0x0B, 0x02, 0x0D
	.short 0x0059
	.byte 0x01, 0x14, 0x01, 0x0B, 0x02, 0x0D
	.short 0x006F
	.byte 0x01, 0x14, 0x14, 0x06, 0x02, 0x0D
	.short 0x0085
	.byte 0x04, 0x01, 0x01, 0x09, 0x02, 0x0D
	.short 0x0091
	.byte 0x04, 0x01, 0x03, 0x05, 0x02, 0x0D
	.short 0x00A3
	.byte 0x04, 0x01, 0x05, 0x05, 0x02, 0x0D
	.short 0x00AD
	.byte 0x04, 0x01, 0x07, 0x05, 0x02, 0x0D
	.short 0x00B7
	.byte 0x04, 0x01, 0x09, 0x05, 0x02, 0x0D
	.short 0x00C1
	.byte 0x04, 0x01, 0x0B, 0x0F, 0x02, 0x0D
	.short 0x00CB
	.byte 0x04, 0x01, 0x0F, 0x0C, 0x02, 0x0D
	.short 0x00E9
	.byte 0x04, 0x06, 0x11, 0x03, 0x02, 0x0D
	.short 0x0101
	.byte 0x01, 0x05, 0x03, 0x02, 0x02, 0x0D
	.short 0x0107
	.byte 0x01, 0x03, 0x06, 0x06, 0x02, 0x0D
	.short 0x010B
	.byte 0x01, 0x03, 0x08, 0x06, 0x02, 0x0D
	.short 0x0117
	.byte 0x01, 0x03, 0x0A, 0x06, 0x02, 0x0D
	.short 0x0123
	.byte 0x01, 0x03, 0x0C, 0x06, 0x02, 0x0D
	.short 0x012F
	.byte 0x01, 0x03, 0x0E, 0x06, 0x02, 0x0D
	.short 0x013B
	.byte 0x01, 0x00, 0x11, 0x07, 0x02, 0x0D
	.short 0x0147
	.byte 0x01, 0x01, 0x16, 0x06, 0x02, 0x0D
	.short 0x0147
	.byte 0x04, 0x19, 0x15, 0x05, 0x02, 0x0D
	.short 0x0153
	.byte 0x04, 0x12, 0x04, 0x06, 0x02, 0x0D
	.short 0x015D
	.byte 0x04, 0x12, 0x06, 0x06, 0x02, 0x0D
	.short 0x0169
	.byte 0x04, 0x12, 0x08, 0x08, 0x02, 0x0D
	.short 0x0175
	.byte 0x01, 0x12, 0x0B, 0x09, 0x02, 0x0D
	.short 0x0185
	.byte 0x01, 0x02, 0x0D, 0x0C, 0x02, 0x0D
	.short 0x0197
	.byte 0x04, 0x01, 0x11, 0x0C, 0x02, 0x0D
	.short 0x01AF
	.byte 0x04, 0x14, 0x01, 0x0B, 0x02, 0x0D
	.short 0x01C7
	.byte 0x01, 0x14, 0x16, 0x0C, 0x02, 0x0D
	.short 0x01DD
	.byte 0x01, 0x14, 0x06, 0x06, 0x02, 0x0D
	.short 0x01F5
	.byte 0x01, 0x16, 0x04, 0x09, 0x02, 0x0D
	.short 0x0201
