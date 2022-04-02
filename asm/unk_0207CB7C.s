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

	thumb_func_start sub_0207CB7C
sub_0207CB7C: ; 0x0207CB7C
	ldr r3, _0207CB88 ; =G2x_SetBlendBrightness_
	ldr r0, _0207CB8C ; =0x04000050
	mov r1, #0x1e
	mov r2, #8
	bx r3
	nop
_0207CB88: .word G2x_SetBlendBrightness_
_0207CB8C: .word 0x04000050
	thumb_func_end sub_0207CB7C

	thumb_func_start sub_0207CB90
sub_0207CB90: ; 0x0207CB90
	ldr r0, _0207CB98 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	bx lr
	.balign 4, 0
_0207CB98: .word 0x04000050
	thumb_func_end sub_0207CB90

	thumb_func_start sub_0207CB9C
sub_0207CB9C: ; 0x0207CB9C
	push {r3, r4}
	mov r3, #0xc9
	lsl r3, r3, #4
	add r0, r0, r3
	ldrb r4, [r0, #6]
	mov r3, #0xf
	bic r4, r3
	strb r4, [r0, #6]
	ldrb r4, [r0, #6]
	mov r3, #0xf0
	bic r4, r3
	strb r4, [r0, #6]
	add r3, r1, #4
	str r3, [r0]
	ldrb r3, [r1, #2]
	strb r3, [r0, #4]
	ldrb r3, [r1, #1]
	strb r3, [r0, #5]
	ldrb r1, [r1, #3]
	strb r1, [r0, #7]
	str r2, [r0, #8]
	mov r1, #1
	str r1, [r0, #0xc]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0207CB9C

	thumb_func_start sub_0207CBD0
sub_0207CBD0: ; 0x0207CBD0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	mov r2, #0xc9
	lsl r2, r2, #4
	add r5, r0, r2
	str r3, [sp]
	ldrb r3, [r5, #6]
	mov r2, #0xf
	lsl r4, r1, #2
	bic r3, r2
	strb r3, [r5, #6]
	ldrb r3, [r5, #6]
	mov r2, #0xf0
	bic r3, r2
	strb r3, [r5, #6]
	mov r2, #0
	str r2, [r5]
	strb r1, [r5, #5]
	mov r1, #0x66
	lsl r1, r1, #4
	add r6, r0, r1
	ldr r0, [r6, r4]
	bl sub_020249A8
	mov r1, #2
	and r0, r1
	strb r0, [r5, #7]
	ldr r0, [sp]
	cmp r0, #1
	bne _0207CC1C
	ldr r0, [r6, r4]
	mov r1, #0
	bl sub_020249D4
	ldrb r1, [r5, #7]
	ldr r0, [r6, r4]
	bl Set2dSpriteAnimSeqNo
_0207CC1C:
	str r7, [r5, #8]
	mov r0, #1
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0207CBD0

	thumb_func_start sub_0207CC24
sub_0207CC24: ; 0x0207CC24
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #0xc9
	add r5, r0, #0
	lsl r1, r1, #4
	add r4, r5, r1
	ldrb r2, [r4, #6]
	lsl r1, r2, #0x18
	lsr r1, r1, #0x1c
	beq _0207CC44
	cmp r1, #1
	beq _0207CCB6
	cmp r1, #2
	bne _0207CC42
	b _0207CD54
_0207CC42:
	b _0207CD7E
_0207CC44:
	ldr r1, [r4]
	cmp r1, #0
	beq _0207CC76
	mov r1, #2
	str r1, [sp]
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	ldrb r3, [r4, #7]
	bl sub_0207E3A8
	ldrb r0, [r4, #7]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrb r2, [r4, #4]
	ldrb r3, [r4, #5]
	ldr r1, [r4]
	add r0, r5, #0
	bl sub_0207E28C
	ldr r0, [r5]
	mov r1, #0
	bl BgCommitTilemapBufferToVram
	b _0207CC9A
_0207CC76:
	ldrb r0, [r4, #5]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_020249D4
	ldrb r0, [r4, #5]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	ldrb r1, [r4, #7]
	bl Set2dSpriteAnimSeqNo
_0207CC9A:
	ldrb r2, [r4, #6]
	mov r1, #0xf0
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x1c
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r4, #6]
	b _0207CD7E
_0207CCB6:
	add r1, r2, #0
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x1c
	add r2, r2, #1
	mov r3, #0xf
	lsl r2, r2, #0x18
	bic r1, r3
	lsr r3, r2, #0x18
	mov r2, #0xf
	and r2, r3
	orr r1, r2
	strb r1, [r4, #6]
	ldrb r1, [r4, #6]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	cmp r1, #2
	bne _0207CD7E
	ldr r1, [r4]
	cmp r1, #0
	beq _0207CD0A
	mov r1, #1
	str r1, [sp]
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	ldrb r3, [r4, #7]
	bl sub_0207E3A8
	ldrb r0, [r4, #7]
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldrb r2, [r4, #4]
	ldrb r3, [r4, #5]
	ldr r1, [r4]
	add r0, r5, #0
	bl sub_0207E28C
	ldr r0, [r5]
	mov r1, #0
	bl BgCommitTilemapBufferToVram
	b _0207CD30
_0207CD0A:
	ldrb r0, [r4, #5]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_020249D4
	ldrb r0, [r4, #5]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	ldrb r1, [r4, #7]
	add r1, r1, #1
	bl Set2dSpriteAnimSeqNo
_0207CD30:
	ldrb r1, [r4, #6]
	mov r0, #0xf
	bic r1, r0
	strb r1, [r4, #6]
	ldrb r2, [r4, #6]
	mov r1, #0xf0
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x1c
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r4, #6]
	b _0207CD7E
_0207CD54:
	mov r1, #0xf
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1c
	lsr r1, r1, #0x1c
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0xf
	and r1, r2
	orr r0, r1
	strb r0, [r4, #6]
	ldrb r0, [r4, #6]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #2
	bne _0207CD7E
	mov r0, #0
	add sp, #8
	str r0, [r4, #0xc]
	pop {r3, r4, r5, pc}
_0207CD7E:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0207CC24

	thumb_func_start sub_0207CD84
sub_0207CD84: ; 0x0207CD84
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r6, r0, #0
	bl AddWindow
	add r1, r5, #0
	add r2, r4, #0
	add r0, r6, #0
	add r1, #0x10
	add r2, #8
	bl AddWindow
	add r1, r5, #0
	add r2, r4, #0
	add r0, r6, #0
	add r1, #0x20
	add r2, #0x10
	bl AddWindow
	add r1, r5, #0
	add r2, r4, #0
	add r0, r6, #0
	add r1, #0x30
	add r2, #0x18
	bl AddWindow
	add r5, #0x40
	add r4, #0x20
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0207CD84

	thumb_func_start sub_0207CDCC
sub_0207CDCC: ; 0x0207CDCC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r4, _0207CF38 ; =_02101734
	ldr r0, [r5]
	add r1, r5, #4
	add r2, r4, #0
	bl sub_0207CD84
	add r1, r5, #0
	ldr r0, [r5]
	ldr r2, _0207CF3C ; =_02101734 + 0x50
	add r1, #0xa4
	bl sub_0207CD84
	mov r1, #0x51
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF40 ; =_02101734 + 0xA0
	add r1, r5, r1
	bl sub_0207CD84
	ldr r0, _0207CF44 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x25
	ldrb r0, [r0]
	cmp r0, #2
	ldr r0, [r5]
	bne _0207CE34
	add r1, r5, #0
	add r2, r4, #0
	add r1, #0x54
	add r2, #0xf0
	bl sub_0207CD84
	mov r2, #0x46
	add r1, r5, #0
	lsl r2, r2, #2
	ldr r0, [r5]
	add r1, #0xf4
	add r2, r4, r2
	bl sub_0207CD84
	mov r2, #0x65
	lsl r2, r2, #2
	add r1, r5, r2
	sub r2, #0x54
	ldr r0, [r5]
	add r2, r4, r2
	bl sub_0207CD84
	b _0207CE5E
_0207CE34:
	add r1, r5, #0
	add r2, r4, #0
	add r1, #0x54
	add r2, #0x28
	bl sub_0207CD84
	add r1, r5, #0
	add r2, r4, #0
	ldr r0, [r5]
	add r1, #0xf4
	add r2, #0x78
	bl sub_0207CD84
	mov r1, #0x65
	lsl r1, r1, #2
	add r2, r4, #0
	ldr r0, [r5]
	add r1, r5, r1
	add r2, #0xc8
	bl sub_0207CD84
_0207CE5E:
	mov r2, #0x95
	lsl r2, r2, #2
	add r1, r5, r2
	sub r2, #0xec
	ldr r0, [r5]
	add r2, r4, r2
	bl AddWindow
	mov r2, #0x99
	lsl r2, r2, #2
	add r1, r5, r2
	sub r2, #0xf4
	ldr r0, [r5]
	add r2, r4, r2
	bl AddWindow
	mov r2, #0x9d
	lsl r2, r2, #2
	add r1, r5, r2
	sub r2, #0xfc
	ldr r0, [r5]
	add r2, r4, r2
	bl AddWindow
	ldr r0, _0207CF44 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0207CEA8
	cmp r0, #0x11
	beq _0207CEA8
	add r0, #0xea
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0207CED0
_0207CEA8:
	ldr r1, _0207CF48 ; =_021015EC
	add r0, sp, #0
	ldrh r3, [r1, #0x30]
	add r2, sp, #0
	strh r3, [r0]
	ldrh r3, [r1, #0x32]
	strh r3, [r0, #2]
	ldrh r3, [r1, #0x34]
	ldrh r1, [r1, #0x36]
	strh r3, [r0, #4]
	strh r1, [r0, #6]
	mov r1, #0x16
	strb r1, [r0, #2]
	mov r1, #0x7d
	lsl r1, r1, #2
	ldr r0, [r5]
	add r1, r5, r1
	bl AddWindow
	b _0207CEDE
_0207CED0:
	mov r1, #0x7d
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF4C ; =_0210161C
	add r1, r5, r1
	bl AddWindow
_0207CEDE:
	mov r1, #0x79
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF50 ; =_02101624
	add r1, r5, r1
	bl AddWindow
	mov r1, #0x81
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF54 ; =_0210162C
	add r1, r5, r1
	bl AddWindow
	mov r1, #0x85
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF58 ; =_02101634
	add r1, r5, r1
	bl AddWindow
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF5C ; =_0210163C
	add r1, r5, r1
	bl AddWindow
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF60 ; =_02101644
	add r1, r5, r1
	bl AddWindow
	mov r1, #0x91
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF64 ; =_0210164C
	add r1, r5, r1
	bl AddWindow
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0207CF38: .word _02101734
_0207CF3C: .word _02101734 + 0x50
_0207CF40: .word _02101734 + 0xA0
_0207CF44: .word 0x00000654
_0207CF48: .word _021015EC
_0207CF4C: .word _0210161C
_0207CF50: .word _02101624
_0207CF54: .word _0210162C
_0207CF58: .word _02101634
_0207CF5C: .word _0210163C
_0207CF60: .word _02101644
_0207CF64: .word _0210164C
	thumb_func_end sub_0207CDCC

	thumb_func_start sub_0207CF68
sub_0207CF68: ; 0x0207CF68
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r5, #0
	add r4, r6, #4
_0207CF70:
	lsl r0, r5, #4
	add r0, r4, r0
	bl RemoveWindow
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #0x28
	blo _0207CF70
	mov r4, #0xa1
	lsl r4, r4, #2
	add r0, r6, r4
	bl WindowIsInUse
	cmp r0, #1
	bne _0207CF96
	add r0, r6, r4
	bl RemoveWindow
_0207CF96:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0207CF68

	thumb_func_start sub_0207CF98
sub_0207CF98: ; 0x0207CF98
	push {r4, lr}
	mov r2, #0x1f
	add r4, r0, #0
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x10
	ldr r2, [r4, r2]
	mov r1, #0x80
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x14
	ldr r2, [r4, r2]
	mov r1, #0x81
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x18
	ldr r2, [r4, r2]
	mov r1, #0x82
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x1c
	ldr r2, [r4, r2]
	mov r1, #0x8f
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x20
	ldr r2, [r4, r2]
	mov r1, #0x90
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x24
	ldr r2, [r4, r2]
	mov r1, #0x83
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x28
	ldr r2, [r4, r2]
	mov r1, #0x84
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x2c
	ldr r2, [r4, r2]
	mov r1, #0x85
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x30
	ldr r2, [r4, r2]
	mov r1, #0x86
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x34
	ldr r2, [r4, r2]
	mov r1, #0x87
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x38
	ldr r2, [r4, r2]
	mov r1, #0x88
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x3c
	ldr r2, [r4, r2]
	mov r1, #0x89
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x40
	ldr r2, [r4, r2]
	mov r1, #0x8a
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x44
	ldr r2, [r4, r2]
	mov r1, #0x89
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x48
	ldr r2, [r4, r2]
	mov r1, #0x95
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x4c
	ldr r2, [r4, r2]
	mov r1, #0xba
	bl ReadMsgDataIntoString
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0207CF98

	thumb_func_start sub_0207D0A0
sub_0207D0A0: ; 0x0207D0A0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	add r4, r2, #0
	add r7, r1, #0
	add r1, r4, #0
	ldr r0, [r5, r0]
	add r1, #0x8b
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, _0207D0E0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r7, #0
	bl BufferMoveName
	ldr r1, _0207D0E0 ; =0x000007C4
	add r4, #0x10
	lsl r2, r4, #2
	ldr r0, [r5, r1]
	add r2, r5, r2
	add r1, #0xc
	ldr r1, [r2, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207D0E0: .word 0x000007C4
	thumb_func_end sub_0207D0A0

	thumb_func_start sub_0207D0E4
sub_0207D0E4: ; 0x0207D0E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r7, r1, #0
	add r0, r2, #0
	mov r1, #0xc
	str r2, [sp, #4]
	bl ListMenuItems_ctor
	mov r1, #0x82
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r6, #0
	ldr r0, [sp, #4]
	add r4, r6, #0
	cmp r0, #0
	ble _0207D156
_0207D106:
	ldrb r0, [r7, r4]
	cmp r0, #0x10
	blo _0207D12E
	bl sub_0207F42C
	lsl r1, r6, #2
	add r2, r0, #0
	mov r0, #0x82
	add r3, r5, r1
	mov r1, #0x81
	lsl r0, r0, #4
	lsl r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r3, r1]
	bl ListMenuItems_AddItem
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	b _0207D14A
_0207D12E:
	bl sub_0207F42C
	ldrb r1, [r7, r4]
	add r2, r0, #0
	mov r0, #0x82
	lsl r1, r1, #2
	add r3, r5, r1
	mov r1, #0x7d
	lsl r0, r0, #4
	lsl r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r3, r1]
	bl ListMenuItems_AddItem
_0207D14A:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [sp, #4]
	cmp r4, r0
	blt _0207D106
_0207D156:
	mov r0, #0x82
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0xa1
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #0xc]
	add r0, sp, #8
	strb r1, [r0, #8]
	mov r1, #1
	strb r1, [r0, #9]
	ldr r1, [sp, #4]
	strb r1, [r0, #0xa]
	ldrb r2, [r0, #0xb]
	mov r1, #0xf
	bic r2, r1
	strb r2, [r0, #0xb]
	ldrb r2, [r0, #0xb]
	mov r1, #0x30
	bic r2, r1
	strb r2, [r0, #0xb]
	ldr r1, [sp, #4]
	ldrb r2, [r0, #0xb]
	cmp r1, #4
	blo _0207D198
	mov r1, #0xc0
	bic r2, r1
	mov r1, #0x40
	orr r1, r2
	strb r1, [r0, #0xb]
	b _0207D19E
_0207D198:
	mov r1, #0xc0
	bic r2, r1
	strb r2, [r0, #0xb]
_0207D19E:
	add r1, sp, #8
	ldrb r1, [r1, #0xa]
	mov r2, #0
	add r0, r5, #0
	add r3, r2, #0
	bl sub_0207E54C
	mov r2, #0
	add r0, r5, #0
	add r1, sp, #8
	mov r3, #0xc
	str r2, [sp]
	bl sub_0207E590
	ldr r1, _0207D1C4 ; =0x00000824
	str r0, [r5, r1]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0207D1C4: .word 0x00000824
	thumb_func_end sub_0207D0E4

	thumb_func_start sub_0207D1C8
sub_0207D1C8: ; 0x0207D1C8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0207D258 ; =0x00000654
	ldr r0, [r5, r0]
	add r1, r0, #0
	add r1, #0x24
	ldrb r1, [r1]
	cmp r1, #0xf
	bne _0207D1EC
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x2b
	bl ReadMsgDataIntoString
	pop {r4, r5, r6, pc}
_0207D1EC:
	cmp r1, #0x15
	bne _0207D214
	ldr r1, _0207D25C ; =0x00000C65
	ldrb r2, [r5, r1]
	mov r1, #0x30
	mul r1, r2
	ldr r2, _0207D260 ; =0x00000838
	add r1, r5, r1
	ldrb r1, [r1, r2]
	cmp r1, #1
	bne _0207D214
	add r0, r2, #0
	sub r0, #0x78
	sub r2, #0x70
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	mov r1, #0xb7
	bl ReadMsgDataIntoString
	pop {r4, r5, r6, pc}
_0207D214:
	ldr r1, _0207D25C ; =0x00000C65
	ldr r0, [r0]
	ldrb r1, [r5, r1]
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x26
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207D264 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _0207D264 ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
	nop
_0207D258: .word 0x00000654
_0207D25C: .word 0x00000C65
_0207D260: .word 0x00000838
_0207D264: .word 0x000007C4
	thumb_func_end sub_0207D1C8

	thumb_func_start sub_0207D268
sub_0207D268: ; 0x0207D268
	push {r3, r4, lr}
	sub sp, #4
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	ldr r0, _0207D290 ; =0x000007BC
	add r4, r1, #0
	ldr r0, [r2, r0]
	add r3, r2, #4
	lsl r2, r4, #2
	add r2, r4, r2
	add r2, r2, #2
	lsl r2, r2, #4
	add r2, r3, r2
	mov r1, #0
	mov r3, #0x1c
	bl sub_0200CDAC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0207D290: .word 0x000007BC
	thumb_func_end sub_0207D268

	thumb_func_start sub_0207D294
sub_0207D294: ; 0x0207D294
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r4, r2, #0
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r1, _0207D2DC ; =_021015BC
	lsl r2, r4, #3
	ldrh r1, [r1, r2]
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207D2E0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207D2E0 ; =0x000007C4
	mov r1, #0x30
	mul r1, r4
	ldr r0, [r5, r2]
	add r1, r5, r1
	add r2, #0x64
	ldr r1, [r1, r2]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207D2DC: .word _021015BC
_0207D2E0: .word 0x000007C4
	thumb_func_end sub_0207D294

	thumb_func_start sub_0207D2E4
sub_0207D2E4: ; 0x0207D2E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	lsl r0, r1, #2
	add r0, r1, r0
	lsl r6, r0, #4
	add r7, r1, #0
	mov r0, #0x30
	mul r7, r0
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207D3C8 ; =0x000F0E00
	ldr r2, _0207D3CC ; =0x00000828
	str r0, [sp, #8]
	add r4, r5, #4
	str r1, [sp, #0xc]
	add r3, r5, r7
	ldr r2, [r3, r2]
	add r0, r4, r6
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldr r0, _0207D3D0 ; =0x00000838
	add r1, r5, r7
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0207D328
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0207D328:
	mov r0, #0x99
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	ldr r0, _0207D3C8 ; =0x000F0E00
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r2, _0207D3D4 ; =0x000007D8
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #2
	bl AddTextPrinterParameterized2
	ldr r2, _0207D3D8 ; =0x00000836
	add r0, r5, r2
	ldrh r0, [r0, r7]
	lsl r1, r0, #0x13
	lsr r1, r1, #0x1f
	bne _0207D3BE
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1e
	bne _0207D390
	add r0, r2, #0
	sub r0, #0x76
	sub r2, #0x6a
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	mov r1, #0x1b
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0xc1
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	ldr r2, _0207D3DC ; =0x000007CC
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r4, r6
	mov r3, #0x40
	bl AddTextPrinterParameterized2
	b _0207D3BE
_0207D390:
	cmp r0, #1
	bne _0207D3BE
	add r0, r2, #0
	sub r0, #0x76
	sub r2, #0x6a
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	mov r1, #0x1c
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207D3E0 ; =0x00050600
	ldr r2, _0207D3DC ; =0x000007CC
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r4, r6
	mov r3, #0x40
	bl AddTextPrinterParameterized2
_0207D3BE:
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207D3C8: .word 0x000F0E00
_0207D3CC: .word 0x00000828
_0207D3D0: .word 0x00000838
_0207D3D4: .word 0x000007D8
_0207D3D8: .word 0x00000836
_0207D3DC: .word 0x000007CC
_0207D3E0: .word 0x00050600
	thumb_func_end sub_0207D2E4

	thumb_func_start sub_0207D3E4
sub_0207D3E4: ; 0x0207D3E4
	push {r4, lr}
	sub sp, #0x10
	lsl r2, r1, #2
	add r2, r1, r2
	add r2, r2, #1
	add r3, r0, #4
	lsl r2, r2, #4
	add r4, r3, r2
	mov r2, #0x30
	mul r2, r1
	ldr r3, _0207D43C ; =0x00000836
	add r2, r0, r2
	ldrh r1, [r2, r3]
	lsl r1, r1, #0x14
	lsr r1, r1, #0x14
	cmp r1, #7
	beq _0207D410
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
_0207D410:
	mov r1, #0
	str r1, [sp]
	str r4, [sp, #4]
	mov r1, #5
	str r1, [sp, #8]
	mov r1, #2
	str r1, [sp, #0xc]
	add r1, r3, #0
	sub r3, r3, #4
	sub r1, #0x7a
	ldrh r2, [r2, r3]
	ldr r0, [r0, r1]
	mov r1, #1
	mov r3, #3
	bl sub_0200CE7C
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	nop
_0207D43C: .word 0x00000836
	thumb_func_end sub_0207D3E4

	thumb_func_start sub_0207D440
sub_0207D440: ; 0x0207D440
	push {r4, r5, lr}
	sub sp, #0xc
	add r2, r0, #0
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, r0, #2
	add r3, r2, #4
	lsl r0, r0, #4
	add r4, r3, r0
	mov r3, #0x30
	mul r3, r1
	add r1, r2, r3
	str r4, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	ldr r5, _0207D47C ; =0x000007BC
	str r0, [sp, #8]
	ldr r0, [r2, r5]
	add r5, #0x72
	ldrh r1, [r1, r5]
	mov r2, #3
	mov r3, #1
	bl sub_0200CDF0
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0207D47C: .word 0x000007BC
	thumb_func_end sub_0207D440

	thumb_func_start sub_0207D480
sub_0207D480: ; 0x0207D480
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #4
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, r0, #2
	mov r1, #0
	lsl r4, r0, #4
	mov r0, #0x18
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	add r0, r5, r4
	add r2, r1, #0
	add r3, r1, #0
	bl FillWindowPixelRect
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0207D480

	thumb_func_start sub_0207D4AC
sub_0207D4AC: ; 0x0207D4AC
	push {r4, r5, lr}
	sub sp, #0xc
	add r2, r0, #0
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, r0, #2
	add r3, r2, #4
	lsl r0, r0, #4
	add r4, r3, r0
	mov r3, #0x30
	mul r3, r1
	add r1, r2, r3
	str r4, [sp]
	mov r0, #0x24
	str r0, [sp, #4]
	mov r0, #2
	ldr r5, _0207D4E8 ; =0x000007BC
	str r0, [sp, #8]
	ldr r0, [r2, r5]
	add r5, #0x74
	ldrh r1, [r1, r5]
	mov r2, #3
	mov r3, #0
	bl sub_0200CDF0
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0207D4E8: .word 0x000007BC
	thumb_func_end sub_0207D4AC

	thumb_func_start sub_0207D4EC
sub_0207D4EC: ; 0x0207D4EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsl r2, r1, #2
	add r2, r1, r2
	add r5, r0, #0
	add r2, r2, #3
	add r0, r5, #4
	lsl r2, r2, #4
	add r4, r0, r2
	mov r0, #0x83
	lsl r0, r0, #4
	add r7, r5, r0
	sub r0, r0, #2
	add r0, r5, r0
	mov r2, #0x30
	add r6, r1, #0
	mul r6, r2
	str r0, [sp, #8]
	ldrh r0, [r0, r6]
	ldrh r1, [r7, r6]
	bl sub_020880B0
	cmp r0, #4
	bhi _0207D582
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207D528: ; jump table
	.short _0207D532 - _0207D528 - 2 ; case 0
	.short _0207D56C - _0207D528 - 2 ; case 1
	.short _0207D554 - _0207D528 - 2 ; case 2
	.short _0207D53C - _0207D528 - 2 ; case 3
	.short _0207D53C - _0207D528 - 2 ; case 4
_0207D532:
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0207D53C:
	ldrb r3, [r4, #9]
	ldr r1, _0207D5D0 ; =0x00000566
	mov r0, #1
	lsl r3, r3, #4
	add r3, #9
	lsl r3, r3, #0x11
	add r1, r5, r1
	mov r2, #4
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
	b _0207D582
_0207D554:
	ldrb r3, [r4, #9]
	ldr r1, _0207D5D4 ; =0x00000586
	mov r0, #1
	lsl r3, r3, #4
	add r3, #9
	lsl r3, r3, #0x11
	add r1, r5, r1
	mov r2, #4
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
	b _0207D582
_0207D56C:
	ldrb r3, [r4, #9]
	ldr r1, _0207D5D8 ; =0x000005A6
	mov r0, #1
	lsl r3, r3, #4
	add r3, #9
	lsl r3, r3, #0x11
	add r1, r5, r1
	mov r2, #4
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
_0207D582:
	ldr r0, [sp, #8]
	ldrh r1, [r7, r6]
	ldrh r0, [r0, r6]
	mov r2, #0x30
	bl sub_02088068
	add r5, r0, #0
	str r5, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	mov r3, #2
	bl FillWindowPixelRect
	str r5, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #9
	mov r2, #0
	mov r3, #3
	bl FillWindowPixelRect
	str r5, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	mov r3, #5
	bl FillWindowPixelRect
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207D5D0: .word 0x00000566
_0207D5D4: .word 0x00000586
_0207D5D8: .word 0x000005A6
	thumb_func_end sub_0207D4EC

	thumb_func_start sub_0207D5DC
sub_0207D5DC: ; 0x0207D5DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r1, #0
	add r5, r0, #0
	lsl r0, r6, #2
	add r4, r6, r0
	add r0, r5, #4
	str r0, [sp]
	lsl r0, r4, #4
	ldr r1, [sp]
	str r0, [sp, #4]
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #1
	lsl r0, r0, #4
	add r7, r5, #4
	str r0, [sp, #8]
	add r0, r7, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r7, #0
	str r0, [sp, #0xc]
	add r0, r4, #2
	lsl r0, r0, #4
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r7, #0
	str r0, [sp, #0x14]
	add r0, r4, #3
	lsl r4, r0, #4
	ldr r0, [sp, #0x14]
	mov r1, #0
	add r0, r0, r4
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D2E4
	mov r0, #0x30
	mul r0, r6
	add r1, r5, r0
	ldr r0, _0207D69C ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0207D66E
	ldr r1, [sp]
	ldr r0, [sp, #4]
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #8]
	add r0, r7, r0
	bl ScheduleWindowCopyToVram
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x14]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_0207D66E:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D268
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D3E4
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D440
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D4AC
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D4EC
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207D69C: .word 0x00000838
	thumb_func_end sub_0207D5DC

	thumb_func_start sub_0207D6A0
sub_0207D6A0: ; 0x0207D6A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	lsl r0, r1, #2
	add r4, r1, r0
	add r1, r5, #4
	lsl r0, r4, #4
	add r0, r1, r0
	bl CopyWindowPixelsToVram_TextMode
	add r0, r4, #1
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	bl CopyWindowPixelsToVram_TextMode
	add r0, r4, #2
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	bl CopyWindowPixelsToVram_TextMode
	add r0, r4, #3
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	bl CopyWindowPixelsToVram_TextMode
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0207D6A0

	thumb_func_start sub_0207D6D8
sub_0207D6D8: ; 0x0207D6D8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	lsl r0, r1, #2
	add r4, r1, r0
	add r1, r5, #4
	lsl r0, r4, #4
	add r0, r1, r0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #1
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #2
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #3
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0207D6D8

	thumb_func_start sub_0207D710
sub_0207D710: ; 0x0207D710
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #2
	add r6, r4, r0
	add r1, r5, #4
	lsl r0, r6, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #1
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D2E4
	mov r0, #0x30
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0207D7A0 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0207D75A
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl sub_0207DC20
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0207D75A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D3E4
	ldr r0, _0207D7A4 ; =0x00000654
	add r1, r4, #0
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r1, r0, #0
	mov r0, #0
	ldr r3, _0207D7A4 ; =0x00000654
	str r0, [sp]
	ldr r3, [r5, r3]
	mov r2, #3
	ldrh r3, [r3, #0x28]
	bl GetMonEvolution
	cmp r0, #0
	bne _0207D792
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl sub_0207DC20
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0207D792:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl sub_0207DC20
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0207D7A0: .word 0x00000838
_0207D7A4: .word 0x00000654
	thumb_func_end sub_0207D710

	thumb_func_start sub_0207D7A8
sub_0207D7A8: ; 0x0207D7A8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #2
	add r6, r4, r0
	add r1, r5, #4
	lsl r0, r6, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #1
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D2E4
	mov r0, #0x30
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0207D838 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0207D7EE
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl sub_0207DC90
	pop {r4, r5, r6, pc}
_0207D7EE:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D3E4
	ldr r0, _0207D83C ; =0x00000654
	add r1, r4, #0
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r1, r0, #0
	add r0, r5, #0
	bl sub_020820DC
	cmp r0, #0xff
	bne _0207D81A
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl sub_0207DC90
	pop {r4, r5, r6, pc}
_0207D81A:
	cmp r0, #0xfd
	bne _0207D82A
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #2
	bl sub_0207DC90
	pop {r4, r5, r6, pc}
_0207D82A:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl sub_0207DC90
	pop {r4, r5, r6, pc}
	nop
_0207D838: .word 0x00000838
_0207D83C: .word 0x00000654
	thumb_func_end sub_0207D7A8

	thumb_func_start sub_0207D840
sub_0207D840: ; 0x0207D840
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #2
	add r6, r4, r0
	add r1, r5, #4
	lsl r0, r6, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #1
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D2E4
	mov r0, #0x30
	add r6, r4, #0
	mul r6, r0
	ldr r0, _0207D89C ; =0x00000838
	add r1, r5, r6
	ldrb r0, [r1, r0]
	cmp r0, #1
	beq _0207D884
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D3E4
_0207D884:
	ldr r2, _0207D8A0 ; =0x00000836
	add r3, r5, r6
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #0x10
	lsr r2, r2, #0x1f
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207DD14
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207D89C: .word 0x00000838
_0207D8A0: .word 0x00000836
	thumb_func_end sub_0207D840

	thumb_func_start sub_0207D8A4
sub_0207D8A4: ; 0x0207D8A4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #2
	add r6, r4, r0
	add r1, r5, #4
	lsl r0, r6, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #1
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D2E4
	mov r0, #0x30
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0207D8E8 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #1
	beq _0207D8E6
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D3E4
_0207D8E6:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207D8E8: .word 0x00000838
	thumb_func_end sub_0207D8A4

	thumb_func_start sub_0207D8EC
sub_0207D8EC: ; 0x0207D8EC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0207D984 ; =0x00000654
	add r4, r1, #0
	ldr r1, [r5, r0]
	mov r2, #0
	add r0, r1, #0
	add r0, #0x36
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r3, r0, #0x1c
	beq _0207D924
	add r0, r4, #1
_0207D906:
	add r6, r1, r2
	add r6, #0x30
	ldrb r6, [r6]
	cmp r0, r6
	bne _0207D91A
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207DD7C
	pop {r4, r5, r6, pc}
_0207D91A:
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	cmp r2, r3
	blo _0207D906
_0207D924:
	add r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x16
	bne _0207D944
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207B418
	cmp r0, #0
	bne _0207D978
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	bl sub_0207DD7C
	pop {r4, r5, r6, pc}
_0207D944:
	cmp r0, #0x17
	bne _0207D960
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207B4A0
	cmp r0, #0
	bne _0207D978
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	bl sub_0207DD7C
	pop {r4, r5, r6, pc}
_0207D960:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207B364
	cmp r0, #0
	bne _0207D978
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	bl sub_0207DD7C
	pop {r4, r5, r6, pc}
_0207D978:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #7
	bl sub_0207DD7C
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207D984: .word 0x00000654
	thumb_func_end sub_0207D8EC

	thumb_func_start sub_0207D988
sub_0207D988: ; 0x0207D988
	push {r4, lr}
	add r4, r2, #0
	mov r2, #0
	bl FontID_String_GetWidth
	sub r0, r4, r0
	lsr r0, r0, #1
	pop {r4, pc}
	thumb_func_end sub_0207D988

	thumb_func_start sub_0207D998
sub_0207D998: ; 0x0207D998
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x79
	lsl r0, r0, #2
	add r4, r1, #0
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #1
	tst r0, r4
	beq _0207DA04
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r2, _0207DA54 ; =0x000001EB
	ldr r1, _0207DA58 ; =0x000007CC
	ldrb r2, [r5, r2]
	ldr r1, [r5, r1]
	mov r0, #0
	lsl r2, r2, #3
	bl sub_0207D988
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0207DA5C ; =0x000F0E00
	add r2, #0xe5
	str r0, [sp, #8]
	add r0, r5, r2
	ldr r2, _0207DA58 ; =0x000007CC
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	bl AddTextPrinterParameterized2
	mov r0, #0x79
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
_0207DA04:
	mov r0, #2
	tst r0, r4
	beq _0207DA50
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #1
	bl ReadMsgDataIntoString
	ldr r2, _0207DA60 ; =0x000001FB
	ldr r1, _0207DA58 ; =0x000007CC
	ldrb r2, [r5, r2]
	ldr r1, [r5, r1]
	mov r0, #0
	lsl r2, r2, #3
	bl sub_0207D988
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0207DA5C ; =0x000F0E00
	add r2, #0xf5
	str r0, [sp, #8]
	add r0, r5, r2
	ldr r2, _0207DA58 ; =0x000007CC
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	bl AddTextPrinterParameterized2
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
_0207DA50:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0207DA54: .word 0x000001EB
_0207DA58: .word 0x000007CC
_0207DA5C: .word 0x000F0E00
_0207DA60: .word 0x000001FB
	thumb_func_end sub_0207D998

	thumb_func_start sub_0207DA64
sub_0207DA64: ; 0x0207DA64
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	cmp r3, #1
	bne _0207DA7E
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x2a
	mov r3, #0xf
	bl DrawFrameAndWindow2
_0207DA7E:
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _0207DA9E
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	add r1, r6, #0
	bl ReadMsgDataIntoString
_0207DA9E:
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r2, _0207DAC0 ; =0x000007C8
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r1, #1
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0207DAC0: .word 0x000007C8
	thumb_func_end sub_0207DA64

	thumb_func_start sub_0207DAC4
sub_0207DAC4: ; 0x0207DAC4
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x81
	lsl r1, r1, #2
	add r3, r2, #0
	add r1, r0, r1
	add r2, r4, #0
	bl sub_0207DA64
	pop {r4, pc}
	thumb_func_end sub_0207DAC4

	thumb_func_start sub_0207DAD8
sub_0207DAD8: ; 0x0207DAD8
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x85
	lsl r1, r1, #2
	add r3, r2, #0
	add r1, r0, r1
	add r2, r4, #0
	bl sub_0207DA64
	pop {r4, pc}
	thumb_func_end sub_0207DAD8

	thumb_func_start sub_0207DAEC
sub_0207DAEC: ; 0x0207DAEC
	push {r4, r5, r6, lr}
	mov r6, #0x89
	add r5, r0, #0
	add r4, r1, #0
	lsl r6, r6, #2
	cmp r2, #1
	bne _0207DB06
	add r0, r5, r6
	mov r1, #1
	mov r2, #0x2a
	mov r3, #0xf
	bl DrawFrameAndWindow2
_0207DB06:
	add r0, r5, r6
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _0207DB26
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	add r1, r4, #0
	bl ReadMsgDataIntoString
_0207DB26:
	add r0, r5, #0
	bl sub_0207DB30
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0207DAEC

	thumb_func_start sub_0207DB30
sub_0207DB30: ; 0x0207DB30
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	ldr r0, _0207DB70 ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0, #0xc]
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0207DB74 ; =sub_0207DB80
	ldr r2, _0207DB78 ; =0x000007C8
	str r0, [sp, #8]
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r2, [r4, r2]
	add r0, r4, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _0207DB7C ; =0x00000C64
	strb r0, [r4, r1]
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0207DB70: .word 0x00000654
_0207DB74: .word sub_0207DB80
_0207DB78: .word 0x000007C8
_0207DB7C: .word 0x00000C64
	thumb_func_end sub_0207DB30

	thumb_func_start sub_0207DB80
sub_0207DB80: ; 0x0207DB80
	push {r3, lr}
	cmp r1, #5
	bhi _0207DBC4
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207DB92: ; jump table
	.short _0207DBC4 - _0207DB92 - 2 ; case 0
	.short _0207DB9E - _0207DB92 - 2 ; case 1
	.short _0207DBA4 - _0207DB92 - 2 ; case 2
	.short _0207DBAA - _0207DB92 - 2 ; case 3
	.short _0207DBB2 - _0207DB92 - 2 ; case 4
	.short _0207DBBC - _0207DB92 - 2 ; case 5
_0207DB9E:
	bl GF_IsAnySEPlaying
	pop {r3, pc}
_0207DBA4:
	bl IsFanfarePlaying
	pop {r3, pc}
_0207DBAA:
	ldr r0, _0207DBC8 ; =0x000005E6
	bl PlaySE
	b _0207DBC4
_0207DBB2:
	mov r0, #0x4a
	lsl r0, r0, #4
	bl PlayFanfare
	b _0207DBC4
_0207DBBC:
	ldr r0, _0207DBC8 ; =0x000005E6
	bl IsSEPlaying
	pop {r3, pc}
_0207DBC4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0207DBC8: .word 0x000005E6
	thumb_func_end sub_0207DB80

	thumb_func_start sub_0207DBCC
sub_0207DBCC: ; 0x0207DBCC
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0xc
	bl sub_0201660C
	ldr r2, _0207DC1C ; =0x00000C88
	mov r1, #0x26
	str r0, [r4, r2]
	ldr r0, [r4]
	lsl r1, r1, #4
	str r0, [sp]
	mov r0, #0
	str r1, [sp, #8]
	mov r1, #0xb
	str r1, [sp, #0xc]
	str r0, [sp, #4]
	mov r1, #0x19
	add r3, sp, #0
	strb r1, [r3, #0x10]
	mov r1, #0xa
	strb r1, [r3, #0x11]
	ldrb r5, [r3, #0x12]
	mov r1, #0xf
	bic r5, r1
	strb r5, [r3, #0x12]
	ldrb r5, [r3, #0x12]
	mov r1, #0xf0
	bic r5, r1
	strb r5, [r3, #0x12]
	strb r0, [r3, #0x13]
	ldr r0, [r4, r2]
	add r1, sp, #0
	bl sub_020166FC
	bl sub_0207CB7C
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_0207DC1C: .word 0x00000C88
	thumb_func_end sub_0207DBCC

	thumb_func_start sub_0207DC20
sub_0207DC20: ; 0x0207DC20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, r0, #4
	add r4, r5, #4
	lsl r6, r0, #4
	add r0, r4, r6
	mov r1, #0
	add r7, r2, #0
	bl FillWindowPixelBuffer
	cmp r7, #0
	beq _0207DC44
	cmp r7, #1
	beq _0207DC54
	b _0207DC62
_0207DC44:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xa1
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	b _0207DC62
_0207DC54:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xa2
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
_0207DC62:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207DC8C ; =0x000F0E00
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	add r0, r4, r6
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0207DC8C: .word 0x000F0E00
	thumb_func_end sub_0207DC20

	thumb_func_start sub_0207DC90
sub_0207DC90: ; 0x0207DC90
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, r0, #4
	add r4, r5, #4
	lsl r7, r0, #4
	add r0, r4, r7
	mov r1, #0
	add r6, r2, #0
	bl FillWindowPixelBuffer
	cmp r6, #0
	beq _0207DCB8
	cmp r6, #1
	beq _0207DCC8
	cmp r6, #2
	beq _0207DCD8
	b _0207DCE6
_0207DCB8:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x9e
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	b _0207DCE6
_0207DCC8:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x9f
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	b _0207DCE6
_0207DCD8:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xa0
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
_0207DCE6:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207DD10 ; =0x000F0E00
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	add r0, r4, r7
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r4, r7
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0207DD10: .word 0x000F0E00
	thumb_func_end sub_0207DC90

	thumb_func_start sub_0207DD14
sub_0207DD14: ; 0x0207DD14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, r0, #4
	add r4, r5, #4
	lsl r6, r0, #4
	add r0, r4, r6
	mov r1, #0
	add r7, r2, #0
	bl FillWindowPixelBuffer
	cmp r7, #0
	bne _0207DD40
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xa4
	bl NewString_ReadMsgData
	b _0207DD4C
_0207DD40:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xa3
	bl NewString_ReadMsgData
_0207DD4C:
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207DD78 ; =0x000F0E00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, r6
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207DD78: .word 0x000F0E00
	thumb_func_end sub_0207DD14

	thumb_func_start sub_0207DD7C
sub_0207DD7C: ; 0x0207DD7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, r0, #4
	add r4, r5, #4
	lsl r7, r0, #4
	add r0, r4, r7
	mov r1, #0
	add r6, r2, #0
	bl FillWindowPixelBuffer
	cmp r6, #6
	bhs _0207DDAC
	mov r0, #0x1f
	lsl r0, r0, #6
	add r6, #0x98
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	b _0207DDCE
_0207DDAC:
	cmp r6, #7
	bne _0207DDC0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x96
	bl NewString_ReadMsgData
	add r5, r0, #0
	b _0207DDCE
_0207DDC0:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x97
	bl NewString_ReadMsgData
	add r5, r0, #0
_0207DDCE:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207DDF8 ; =0x000F0E00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, r7
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r4, r7
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207DDF8: .word 0x000F0E00
	thumb_func_end sub_0207DD7C

	thumb_func_start sub_0207DDFC
sub_0207DDFC: ; 0x0207DDFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	ldr r0, _0207DF84 ; =0x00000654
	ldr r1, _0207DF88 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0xa4
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	add r1, sp, #0x24
	strh r0, [r1]
	add r0, r4, #0
	mov r1, #0xa5
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x24
	strh r0, [r1, #2]
	add r0, r4, #0
	mov r1, #0xa6
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x24
	strh r0, [r1, #4]
	add r0, r4, #0
	mov r1, #0xa8
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x24
	strh r0, [r1, #6]
	add r0, r4, #0
	mov r1, #0xa9
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x24
	strh r0, [r1, #8]
	add r0, r4, #0
	mov r1, #0xa7
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x24
	strh r0, [r1, #0xa]
	mov r3, #1
	mov r1, #0x26
	str r3, [sp]
	mov r0, #0xe
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	lsl r1, r1, #4
	str r1, [sp, #0x10]
	add r1, #0x24
	ldr r0, [r5]
	add r1, r5, r1
	bl AddWindowParameterized
	mov r0, #0xa1
	lsl r0, r0, #2
	mov r1, #1
	add r0, r5, r0
	add r2, r1, #0
	mov r3, #0xe
	bl DrawFrameAndWindow1
	mov r0, #0xa1
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xaf
	bl NewString_ReadMsgData
	mov r4, #0
	str r0, [sp, #0x18]
	str r4, [sp, #0x14]
	add r7, r5, #0
	add r6, sp, #0x24
_0207DEB6:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r1, [sp, #0x14]
	ldr r0, [r5, r0]
	add r1, #0xa9
	bl NewString_ReadMsgData
	str r0, [sp, #0x1c]
	mov r1, #0
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0xa1
	lsl r0, r0, #2
	ldr r2, [sp, #0x1c]
	add r0, r5, r0
	add r3, r1, #0
	bl AddTextPrinterParameterized
	ldr r0, [sp, #0x1c]
	bl String_dtor
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0xa1
	lsl r0, r0, #2
	ldr r2, [sp, #0x18]
	add r0, r5, r0
	mov r1, #0
	mov r3, #0x50
	bl AddTextPrinterParameterized
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xb0
	bl NewString_ReadMsgData
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, _0207DF8C ; =0x00000C68
	ldr r0, _0207DF90 ; =0x000007C4
	ldrh r3, [r6]
	ldrh r2, [r7, r2]
	ldr r0, [r5, r0]
	mov r1, #0
	sub r2, r3, r2
	mov r3, #2
	bl BufferIntegerAsString
	ldr r0, _0207DF90 ; =0x000007C4
	ldr r1, _0207DF94 ; =0x000007C8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x20]
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x20]
	bl String_dtor
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r2, _0207DF94 ; =0x000007C8
	mov r0, #0xa1
	lsl r0, r0, #2
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #0
	mov r3, #0x5e
	bl AddTextPrinterParameterized
	ldrh r1, [r6]
	ldr r0, _0207DF8C ; =0x00000C68
	add r4, #0x10
	strh r1, [r7, r0]
	ldr r0, [sp, #0x14]
	add r7, r7, #2
	add r0, r0, #1
	add r6, r6, #2
	str r0, [sp, #0x14]
	cmp r0, #6
	blo _0207DEB6
	ldr r0, [sp, #0x18]
	bl String_dtor
	mov r0, #0xa1
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207DF84: .word 0x00000654
_0207DF88: .word 0x00000C65
_0207DF8C: .word 0x00000C68
_0207DF90: .word 0x000007C4
_0207DF94: .word 0x000007C8
	thumb_func_end sub_0207DDFC

	thumb_func_start sub_0207DF98
sub_0207DF98: ; 0x0207DF98
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x70
	str r0, [sp, #4]
	mov r0, #0xa1
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	mov r2, #0x50
	mov r3, #0
	bl FillWindowPixelRect
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xb0
	bl NewString_ReadMsgData
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	add r6, r5, #0
	add r4, r0, #0
_0207DFCC:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, _0207E040 ; =0x00000C68
	ldr r0, _0207E044 ; =0x000007C4
	ldrh r2, [r6, r2]
	ldr r0, [r5, r0]
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, _0207E044 ; =0x000007C4
	ldr r1, _0207E048 ; =0x000007C8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0xc]
	bl StringExpandPlaceholders
	ldr r1, _0207E048 ; =0x000007C8
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r7, r0, #0
	mov r3, #0x68
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r2, _0207E048 ; =0x000007C8
	mov r0, #0xa1
	lsl r0, r0, #2
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #0
	sub r3, r3, r7
	bl AddTextPrinterParameterized
	ldr r0, [sp, #0x10]
	add r6, r6, #2
	add r0, r0, #1
	add r4, #0x10
	str r0, [sp, #0x10]
	cmp r0, #6
	blo _0207DFCC
	ldr r0, [sp, #0xc]
	bl String_dtor
	mov r0, #0xa1
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207E040: .word 0x00000C68
_0207E044: .word 0x000007C4
_0207E048: .word 0x000007C8
	thumb_func_end sub_0207DF98

	thumb_func_start sub_0207E04C
sub_0207E04C: ; 0x0207E04C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xa1
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0xa1
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	thumb_func_end sub_0207E04C

	thumb_func_start sub_0207E068
sub_0207E068: ; 0x0207E068
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x95
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x9d
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0207E168 ; =0x00000654
	ldr r1, _0207E16C ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #8
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207E170 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _0207E170 ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207E174 ; =0x000F0E00
	ldr r2, _0207E178 ; =0x000007C8
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r2, [r5, r2]
	add r0, r5, r0
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	ldr r0, _0207E168 ; =0x00000654
	ldr r1, _0207E16C ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xb6
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, _0207E170 ; =0x000007C4
	mov r1, #1
	ldr r0, [r5, r0]
	bl BufferItemName
	ldr r1, _0207E170 ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207E174 ; =0x000F0E00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r2, _0207E178 ; =0x000007C8
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #2
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	mov r0, #0x95
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x9d
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207E168: .word 0x00000654
_0207E16C: .word 0x00000C65
_0207E170: .word 0x000007C4
_0207E174: .word 0x000F0E00
_0207E178: .word 0x000007C8
	thumb_func_end sub_0207E068

	thumb_func_start sub_0207E17C
sub_0207E17C: ; 0x0207E17C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r4, r2, #0
	str r0, [sp]
	cmp r7, #8
	ble _0207E18C
	bl GF_AssertFail
_0207E18C:
	mov r6, #0
	cmp r7, #0
	ble _0207E1D2
	sub r0, r7, #1
	ldr r1, _0207E1D4 ; =_021016B4
	lsl r0, r0, #4
	add r1, r1, r0
	lsl r0, r4, #3
	add r5, r1, r0
	mov r1, #0xa5
	ldr r0, [sp]
	lsl r1, r1, #2
	add r4, r0, r1
_0207E1A6:
	mov r0, #0
	ldrsb r2, [r5, r0]
	ldr r0, [sp]
	lsl r1, r2, #4
	lsl r3, r2, #3
	ldr r2, _0207E1D8 ; =_02101654
	ldr r0, [r0]
	add r1, r4, r1
	add r2, r2, r3
	bl AddWindow
	mov r0, #0
	ldrsb r0, [r5, r0]
	mov r1, #4
	lsl r0, r0, #4
	add r0, r4, r0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r5, r5, #1
	cmp r6, r7
	blt _0207E1A6
_0207E1D2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207E1D4: .word _021016B4
_0207E1D8: .word _02101654
	thumb_func_end sub_0207E17C

	thumb_func_start sub_0207E1DC
sub_0207E1DC: ; 0x0207E1DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	add r5, r2, #0
	str r0, [sp, #0x10]
	cmp r6, #8
	ble _0207E1EE
	bl GF_AssertFail
_0207E1EE:
	mov r4, #0
	cmp r6, #0
	ble _0207E21C
	sub r0, r6, #1
	ldr r1, _0207E260 ; =_021016B4
	lsl r0, r0, #4
	add r1, r1, r0
	lsl r0, r5, #3
	add r5, r1, r0
	mov r1, #0xa5
	ldr r0, [sp, #0x10]
	lsl r1, r1, #2
	add r7, r0, r1
_0207E208:
	mov r0, #0
	ldrsb r0, [r5, r0]
	lsl r0, r0, #4
	add r0, r7, r0
	bl RemoveWindow
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, r6
	blt _0207E208
_0207E21C:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	str r1, [sp, #0xc]
	ldr r0, [r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r0, #0x13
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	mov r1, #0
	ldr r0, [sp, #0x10]
	str r1, [sp, #0xc]
	ldr r0, [r0]
	add r2, r1, #0
	mov r3, #0x19
	bl FillBgTilemapRect
	ldr r0, [sp, #0x10]
	mov r1, #0
	ldr r0, [r0]
	bl BgCommitTilemapBufferToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207E260: .word _021016B4
	thumb_func_end sub_0207E1DC

	thumb_func_start sub_0207E264
sub_0207E264: ; 0x0207E264
	cmp r0, #4
	bge _0207E26C
	ldr r0, _0207E270 ; =0x000E0F0B
	bx lr
_0207E26C:
	ldr r0, _0207E274 ; =0x00090A0B
	bx lr
	.balign 4, 0
_0207E270: .word 0x000E0F0B
_0207E274: .word 0x00090A0B
	thumb_func_end sub_0207E264

	thumb_func_start sub_0207E278
sub_0207E278: ; 0x0207E278
	cmp r0, #4
	bge _0207E280
	ldr r0, _0207E284 ; =0x000E0F04
	bx lr
_0207E280:
	ldr r0, _0207E288 ; =0x00090A04
	bx lr
	.balign 4, 0
_0207E284: .word 0x000E0F04
_0207E288: .word 0x00090A04
	thumb_func_end sub_0207E278

	thumb_func_start sub_0207E28C
sub_0207E28C: ; 0x0207E28C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #0x14]
	sub r0, r2, #1
	add r5, r3, #0
	lsl r3, r0, #4
	ldr r2, _0207E34C ; =_021016B4
	ldr r0, [sp, #0x38]
	str r1, [sp, #0x10]
	lsl r1, r0, #3
	add r0, r2, r3
	add r0, r1, r0
	ldrb r7, [r5, r0]
	cmp r7, #7
	bne _0207E2EC
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _0207E2BC
	ldr r0, _0207E350 ; =0x000E0F04
	mov r6, #4
	str r0, [sp, #0x1c]
	b _0207E2C2
_0207E2BC:
	ldr r0, _0207E354 ; =0x000E0F0B
	mov r6, #0xb
	str r0, [sp, #0x1c]
_0207E2C2:
	mov r0, #4
	str r0, [sp, #0x18]
	mov r0, #0xa5
	lsl r0, r0, #2
	add r1, r4, r0
	lsl r0, r7, #4
	add r0, r1, r0
	bl GetWindowWidth
	add r3, r0, #0
	ldr r1, [sp, #0x10]
	mov r0, #4
	ldr r2, [r1]
	lsl r1, r5, #3
	ldr r1, [r2, r1]
	mov r2, #0
	lsl r3, r3, #3
	bl FontID_String_GetCenterAlignmentX
	str r0, [sp, #0x14]
	b _0207E30C
_0207E2EC:
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _0207E2FE
	add r0, r5, #0
	mov r6, #4
	bl sub_0207E278
	str r0, [sp, #0x1c]
	b _0207E308
_0207E2FE:
	add r0, r5, #0
	mov r6, #0xb
	bl sub_0207E264
	str r0, [sp, #0x1c]
_0207E308:
	mov r0, #0
	str r0, [sp, #0x18]
_0207E30C:
	mov r0, #0xa5
	lsl r0, r0, #2
	lsl r1, r6, #0x18
	add r4, r4, r0
	lsl r7, r7, #4
	add r0, r4, r7
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x10]
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r3, [r2]
	lsl r2, r5, #3
	ldr r2, [r3, r2]
	ldr r3, [sp, #0x14]
	add r0, r4, r7
	bl AddTextPrinterParameterized2
	add r0, r4, r7
	bl ScheduleWindowCopyToVram
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207E34C: .word _021016B4
_0207E350: .word 0x000E0F04
_0207E354: .word 0x000E0F0B
	thumb_func_end sub_0207E28C

	thumb_func_start sub_0207E358
sub_0207E358: ; 0x0207E358
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r2, #0
	add r7, r0, #0
	str r1, [sp, #8]
	str r3, [sp, #0xc]
	ldr r6, [sp, #0x28]
	cmp r5, #8
	ble _0207E36E
	bl GF_AssertFail
_0207E36E:
	mov r4, #0
	cmp r5, #0
	ble _0207E3A4
_0207E374:
	ldr r0, [sp, #0xc]
	cmp r0, r4
	str r6, [sp]
	bne _0207E38E
	mov r0, #1
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	add r0, r7, #0
	add r2, r5, #0
	add r3, r4, #0
	bl sub_0207E28C
	b _0207E39E
_0207E38E:
	mov r0, #0
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	add r0, r7, #0
	add r2, r5, #0
	add r3, r4, #0
	bl sub_0207E28C
_0207E39E:
	add r4, r4, #1
	cmp r4, r5
	blt _0207E374
_0207E3A4:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0207E358

	thumb_func_start sub_0207E3A8
sub_0207E3A8: ; 0x0207E3A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	sub r1, r1, #1
	lsl r4, r1, #4
	ldr r1, _0207E538 ; =_021016B4
	lsl r3, r3, #3
	add r1, r1, r4
	add r1, r3, r1
	ldrsb r1, [r2, r1]
	add r5, r0, #0
	ldr r0, _0207E53C ; =_021015EC
	lsl r1, r1, #2
	add r4, r0, r1
	ldr r0, [sp, #0x38]
	cmp r0, #0
	bne _0207E3CE
	mov r2, #2
	lsl r2, r2, #0xc
	b _0207E3D8
_0207E3CE:
	cmp r0, #1
	bne _0207E3D6
	ldr r2, _0207E540 ; =0x00002009
	b _0207E3D8
_0207E3D6:
	ldr r2, _0207E544 ; =0x00002012
_0207E3D8:
	ldr r6, _0207E548 ; =_021015AC
	mov r1, #0
	add r2, #0xa
	add r7, sp, #0x10
_0207E3E0:
	lsl r0, r1, #1
	ldrh r3, [r6, r0]
	add r3, r2, r3
	strh r3, [r7, r0]
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r1, #8
	blo _0207E3E0
	ldrb r0, [r4, #1]
	mov r1, #0
	add r2, r7, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r3, [r4]
	ldr r0, [r5]
	bl LoadRectToBgTilemapRect
	ldrb r0, [r4, #1]
	add r2, sp, #0x10
	mov r1, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r6, [r4]
	ldrb r3, [r4, #2]
	ldr r0, [r5]
	add r2, #2
	add r3, r6, r3
	sub r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl LoadRectToBgTilemapRect
	ldrb r1, [r4, #1]
	ldrb r0, [r4, #3]
	add r2, sp, #0x14
	add r0, r1, r0
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r3, [r4]
	ldr r0, [r5]
	mov r1, #0
	bl LoadRectToBgTilemapRect
	add r2, sp, #0x14
	ldrb r1, [r4, #1]
	ldrb r0, [r4, #3]
	add r2, #2
	add r0, r1, r0
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r6, [r4]
	ldrb r3, [r4, #2]
	ldr r0, [r5]
	mov r1, #0
	add r3, r6, r3
	sub r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl LoadRectToBgTilemapRect
	ldrb r0, [r4, #1]
	add r2, sp, #0x10
	mov r1, #0
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldrb r0, [r4, #3]
	sub r0, r0, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldrh r2, [r2, #8]
	ldrb r3, [r4]
	ldr r0, [r5]
	bl FillBgTilemapRect
	ldrb r0, [r4, #1]
	add r2, sp, #0x10
	mov r1, #0
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldrb r0, [r4, #3]
	sub r0, r0, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldrb r6, [r4]
	ldrb r3, [r4, #2]
	ldrh r2, [r2, #0xa]
	ldr r0, [r5]
	add r3, r6, r3
	sub r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldrb r0, [r4, #1]
	add r2, sp, #0x10
	mov r1, #0
	str r0, [sp]
	ldrb r0, [r4, #2]
	sub r0, r0, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldrb r3, [r4]
	ldrh r2, [r2, #0xc]
	ldr r0, [r5]
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldrb r1, [r4, #1]
	ldrb r0, [r4, #3]
	add r2, sp, #0x10
	add r0, r1, r0
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldrb r0, [r4, #2]
	mov r1, #0
	sub r0, r0, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldrb r3, [r4]
	ldrh r2, [r2, #0xe]
	ldr r0, [r5]
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207E538: .word _021016B4
_0207E53C: .word _021015EC
_0207E540: .word 0x00002009
_0207E544: .word 0x00002012
_0207E548: .word _021015AC
	thumb_func_end sub_0207E3A8

	thumb_func_start sub_0207E54C
sub_0207E54C: ; 0x0207E54C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r0, #0
	str r2, [sp, #4]
	add r7, r3, #0
	mov r4, #0
	cmp r5, #0
	ble _0207E58C
_0207E55E:
	ldr r0, [sp, #4]
	cmp r0, r4
	bne _0207E576
	mov r0, #1
	str r0, [sp]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0207E3A8
	b _0207E586
_0207E576:
	mov r0, #0
	str r0, [sp]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0207E3A8
_0207E586:
	add r4, r4, #1
	cmp r4, r5
	blt _0207E55E
_0207E58C:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0207E54C

	thumb_func_start sub_0207E590
sub_0207E590: ; 0x0207E590
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r0, r3, #0
	mov r1, #0x10
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	ldmia r6!, {r0, r1}
	add r2, r4, #4
	stmia r2!, {r0, r1}
	ldr r0, [r6]
	str r0, [r2]
	ldrb r0, [r4, #0xe]
	strb r0, [r4, #2]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	strb r0, [r4]
	strb r0, [r4, #1]
	ldr r0, [sp, #0x18]
	strb r0, [r4, #3]
	ldrb r1, [r4, #0xe]
	ldrb r2, [r4, #3]
	add r0, r5, #0
	bl sub_0207E17C
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	ldrb r2, [r4, #0xe]
	ldrb r3, [r4]
	add r0, r5, #0
	bl sub_0207E358
	bl sub_0207CB7C
	ldr r0, _0207E610 ; =0x00000684
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0207E614 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0207E5FE
	cmp r0, #0x11
	beq _0207E5FE
	add r0, #0xea
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0207E60A
_0207E5FE:
	mov r0, #0x1a
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0207E60A:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207E610: .word 0x00000684
_0207E614: .word 0x00000654
	thumb_func_end sub_0207E590

	thumb_func_start sub_0207E618
sub_0207E618: ; 0x0207E618
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	add r4, r0, #0
	bl sub_0207E1DC
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, _0207E67C ; =0x00000654
	ldr r1, [r4, r0]
	add r1, #0x24
	ldrb r1, [r1]
	cmp r1, #4
	beq _0207E63C
	cmp r1, #0x15
	bne _0207E648
_0207E63C:
	ldr r0, _0207E680 ; =0x00000684
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	b _0207E652
_0207E648:
	add r0, #0x30
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
_0207E652:
	ldr r0, _0207E67C ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0207E66C
	cmp r0, #0x11
	beq _0207E66C
	add r0, #0xea
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0207E678
_0207E66C:
	mov r0, #0x1a
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
_0207E678:
	pop {r3, r4, r5, pc}
	nop
_0207E67C: .word 0x00000654
_0207E680: .word 0x00000684
	thumb_func_end sub_0207E618

	thumb_func_start sub_0207E684
sub_0207E684: ; 0x0207E684
	push {r3, r4}
	sub r1, r1, #1
	ldr r4, _0207E6B0 ; =_021016B4
	lsl r1, r1, #4
	mov r3, #0
	add r1, r4, r1
	lsl r0, r0, #3
	add r4, r1, r0
	add r0, r3, #0
_0207E696:
	ldrsb r1, [r4, r0]
	cmp r2, r1
	bne _0207E6A2
	mov r0, #1
	pop {r3, r4}
	bx lr
_0207E6A2:
	add r3, r3, #1
	add r4, r4, #1
	cmp r3, #8
	blt _0207E696
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0207E6B0: .word _021016B4
	thumb_func_end sub_0207E684

	thumb_func_start sub_0207E6B4
sub_0207E6B4: ; 0x0207E6B4
	push {r3, r4}
	sub r1, r1, #1
	ldr r4, _0207E6E4 ; =_021016B4
	lsl r1, r1, #4
	mov r3, #0
	add r1, r4, r1
	lsl r0, r0, #3
	add r4, r1, r0
	add r0, r3, #0
_0207E6C6:
	ldrsb r1, [r4, r0]
	cmp r2, r1
	bne _0207E6D2
	add r0, r3, #0
	pop {r3, r4}
	bx lr
_0207E6D2:
	add r3, r3, #1
	add r4, r4, #1
	cmp r3, #8
	blt _0207E6C6
	mov r0, #0
	mvn r0, r0
	pop {r3, r4}
	bx lr
	nop
_0207E6E4: .word _021016B4
	thumb_func_end sub_0207E6B4

	thumb_func_start sub_0207E6E8
sub_0207E6E8: ; 0x0207E6E8
	push {r3, r4}
	sub r1, r1, #1
	lsl r4, r1, #4
	ldr r3, _0207E710 ; =_021016B4
	lsl r1, r0, #3
	add r0, r3, r4
	add r0, r1, r0
	ldrsb r1, [r2, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0207E70A
	cmp r1, #7
	beq _0207E70A
	mov r0, #1
	pop {r3, r4}
	bx lr
_0207E70A:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0207E710: .word _021016B4
	thumb_func_end sub_0207E6E8

	thumb_func_start sub_0207E714
sub_0207E714: ; 0x0207E714
	push {r3, r4, r5, r6}
	sub r3, r1, #2
	add r6, r3, #0
	ldrb r3, [r0]
	mov r1, #0x60
	mul r6, r1
	ldr r4, _0207E744 ; =_02110244
	add r5, r3, #0
	mov r1, #0xc
	mul r5, r1
	add r4, r4, r6
	lsl r3, r2, #2
	add r2, r5, r4
	ldr r2, [r3, r2]
	sub r1, #0xd
	cmp r2, r1
	beq _0207E73E
	strb r2, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_0207E73E:
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_0207E744: .word _02110244
	thumb_func_end sub_0207E714

	thumb_func_start sub_0207E748
sub_0207E748: ; 0x0207E748
	push {r3, r4, r5, r6}
	sub r3, r1, #2
	add r6, r3, #0
	ldrb r3, [r0]
	mov r1, #0x28
	mul r6, r1
	ldr r4, _0207E774 ; =_021101A4
	lsl r5, r3, #3
	add r4, r4, r6
	lsl r3, r2, #2
	add r2, r5, r4
	ldr r2, [r3, r2]
	sub r1, #0x29
	cmp r2, r1
	beq _0207E76E
	strb r2, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_0207E76E:
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_0207E774: .word _021101A4
	thumb_func_end sub_0207E748

	thumb_func_start sub_0207E778
sub_0207E778: ; 0x0207E778
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	mov r1, #0xc9
	add r6, r0, #0
	lsl r1, r1, #4
	add r7, r6, r1
	ldr r1, [r7, #0xc]
	mov r4, #0
	cmp r1, #1
	bne _0207E7A2
	bl sub_0207CC24
	cmp r0, #0
	bne _0207E79C
	add sp, #8
	ldr r0, [r7, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0207E79C:
	add sp, #8
	sub r0, r4, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207E7A2:
	ldr r0, _0207E930 ; =_02110180
	bl sub_02025224
	add r7, r0, #0
	sub r0, r4, #1
	cmp r7, r0
	beq _0207E81E
	ldrb r0, [r5, #3]
	ldrb r1, [r5, #2]
	add r2, r7, #0
	bl sub_0207E684
	cmp r0, #1
	beq _0207E7C0
	b _0207E900
_0207E7C0:
	cmp r7, #7
	bne _0207E7CE
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	b _0207E7D4
_0207E7CE:
	ldr r0, _0207E934 ; =0x000005DC
	bl PlaySE
_0207E7D4:
	mov r0, #0
	str r0, [sp]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #1]
	ldrb r3, [r5, #3]
	add r0, r6, #0
	bl sub_0207E3A8
	ldrb r0, [r5, #3]
	add r1, r5, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #1]
	add r0, r6, #0
	bl sub_0207E28C
	ldrb r0, [r5, #3]
	ldrb r1, [r5, #2]
	add r2, r7, #0
	bl sub_0207E6B4
	strb r0, [r5, #1]
	ldrb r2, [r5, #1]
	ldr r3, [r5, #4]
	add r0, r6, #0
	lsl r2, r2, #3
	add r2, r3, r2
	ldr r2, [r2, #4]
	add r1, r5, #0
	bl sub_0207CB9C
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0207E81E:
	ldr r0, _0207E938 ; =gSystem
	mov r2, #0x40
	ldr r1, [r0, #0x4c]
	tst r2, r1
	beq _0207E83A
	ldrb r1, [r5, #2]
	add r0, r5, #1
	add r2, r4, #0
	bl sub_0207E714
	cmp r0, #0
	beq _0207E900
	add r4, r4, #1
	b _0207E900
_0207E83A:
	mov r2, #0x80
	tst r2, r1
	beq _0207E852
	ldrb r1, [r5, #2]
	add r0, r5, #1
	mov r2, #1
	bl sub_0207E714
	cmp r0, #0
	beq _0207E900
	add r4, r4, #1
	b _0207E900
_0207E852:
	mov r2, #0x20
	tst r2, r1
	bne _0207E85E
	mov r2, #0x10
	tst r1, r2
	beq _0207E870
_0207E85E:
	ldrb r1, [r5, #2]
	add r0, r5, #1
	mov r2, #2
	bl sub_0207E714
	cmp r0, #0
	beq _0207E900
	add r4, r4, #1
	b _0207E900
_0207E870:
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207E8B2
	ldrb r0, [r5, #3]
	ldrb r1, [r5, #2]
	mov r2, #7
	bl sub_0207E6B4
	ldrb r1, [r5, #1]
	cmp r1, r0
	bne _0207E892
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	b _0207E898
_0207E892:
	ldr r0, _0207E934 ; =0x000005DC
	bl PlaySE
_0207E898:
	ldrb r2, [r5, #1]
	ldr r3, [r5, #4]
	add r0, r6, #0
	lsl r2, r2, #3
	add r2, r3, r2
	ldr r2, [r2, #4]
	add r1, r5, #0
	bl sub_0207CB9C
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0207E8B2:
	mov r0, #2
	tst r0, r1
	beq _0207E900
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	str r0, [sp]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #1]
	ldrb r3, [r5, #3]
	add r0, r6, #0
	bl sub_0207E3A8
	ldrb r0, [r5, #3]
	add r1, r5, #4
	str r0, [sp]
	add r0, r4, #0
	str r0, [sp, #4]
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #1]
	add r0, r6, #0
	bl sub_0207E28C
	ldrb r0, [r5, #3]
	ldrb r1, [r5, #2]
	mov r2, #7
	bl sub_0207E6B4
	strb r0, [r5, #1]
	add r0, r6, #0
	add r1, r5, #0
	sub r2, r4, #2
	bl sub_0207CB9C
	add sp, #8
	sub r0, r4, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207E900:
	cmp r4, #0
	beq _0207E926
	ldr r0, _0207E934 ; =0x000005DC
	bl PlaySE
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #1]
	ldrb r3, [r5, #3]
	add r0, r6, #0
	bl sub_0207E54C
	ldrb r0, [r5, #3]
	add r1, r5, #4
	str r0, [sp]
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #1]
	add r0, r6, #0
	bl sub_0207E358
_0207E926:
	mov r0, #0
	mvn r0, r0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207E930: .word _02110180
_0207E934: .word 0x000005DC
_0207E938: .word gSystem
	thumb_func_end sub_0207E778

	thumb_func_start sub_0207E93C
sub_0207E93C: ; 0x0207E93C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	mov r1, #0xc9
	add r5, r0, #0
	lsl r1, r1, #4
	add r7, r5, r1
	ldr r1, [r7, #0xc]
	mov r6, #0
	cmp r1, #1
	bne _0207E966
	bl sub_0207CC24
	cmp r0, #0
	bne _0207E960
	add sp, #8
	ldr r0, [r7, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0207E960:
	add sp, #8
	sub r0, r6, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207E966:
	ldr r0, _0207EB18 ; =_02110168
	bl sub_02025224
	add r7, r0, #0
	sub r0, r6, #1
	cmp r7, r0
	beq _0207EA0E
	cmp r7, #4
	bne _0207E9BA
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r6, #0
	str r0, [sp]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	bl sub_0207E3A8
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	add r0, r6, #0
	str r0, [sp, #4]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	add r0, r5, #0
	bl sub_0207E28C
	ldrb r0, [r4, #2]
	add r1, r4, #0
	sub r2, r6, #2
	sub r0, r0, #1
	strb r0, [r4, #1]
	add r0, r5, #0
	bl sub_0207CB9C
	add sp, #8
	sub r0, r6, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207E9BA:
	ldrb r0, [r4, #3]
	ldrb r1, [r4, #2]
	add r2, r7, #0
	bl sub_0207E6E8
	cmp r0, #1
	beq _0207E9CA
	b _0207EAEA
_0207E9CA:
	ldr r0, _0207EB1C ; =0x000005DC
	bl PlaySE
	add r0, r6, #0
	str r0, [sp]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	bl sub_0207E3A8
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	add r0, r6, #0
	str r0, [sp, #4]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	add r0, r5, #0
	bl sub_0207E28C
	strb r7, [r4, #1]
	ldrb r2, [r4, #1]
	ldr r3, [r4, #4]
	add r0, r5, #0
	lsl r2, r2, #3
	add r2, r3, r2
	ldr r2, [r2, #4]
	add r1, r4, #0
	bl sub_0207CB9C
	add sp, #8
	sub r0, r6, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207EA0E:
	ldr r2, _0207EB20 ; =gSystem
	mov r1, #0x40
	ldr r0, [r2, #0x4c]
	tst r1, r0
	beq _0207EA2A
	ldrb r1, [r4, #2]
	add r0, r4, #1
	add r2, r6, #0
	bl sub_0207E748
	cmp r0, #0
	beq _0207EAEA
	add r6, r6, #1
	b _0207EAEA
_0207EA2A:
	mov r1, #0x80
	tst r0, r1
	beq _0207EA42
	ldrb r1, [r4, #2]
	add r0, r4, #1
	mov r2, #1
	bl sub_0207E748
	cmp r0, #0
	beq _0207EAEA
	add r6, r6, #1
	b _0207EAEA
_0207EA42:
	ldr r1, [r2, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207EAA2
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #1]
	sub r0, r0, #1
	cmp r1, r0
	bne _0207EA5E
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	b _0207EA64
_0207EA5E:
	ldr r0, _0207EB1C ; =0x000005DC
	bl PlaySE
_0207EA64:
	mov r0, #0
	str r0, [sp]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	bl sub_0207E3A8
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	add r0, r5, #0
	bl sub_0207E28C
	ldrb r2, [r4, #1]
	ldr r3, [r4, #4]
	add r0, r5, #0
	lsl r2, r2, #3
	add r2, r3, r2
	ldr r2, [r2, #4]
	add r1, r4, #0
	bl sub_0207CB9C
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0207EAA2:
	mov r0, #2
	tst r0, r1
	beq _0207EAEA
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r6, #0
	str r0, [sp]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	bl sub_0207E3A8
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	add r0, r6, #0
	str r0, [sp, #4]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	add r0, r5, #0
	bl sub_0207E28C
	ldrb r0, [r4, #2]
	add r1, r4, #0
	sub r2, r6, #2
	sub r0, r0, #1
	strb r0, [r4, #1]
	add r0, r5, #0
	bl sub_0207CB9C
	add sp, #8
	sub r0, r6, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207EAEA:
	cmp r6, #0
	beq _0207EB10
	ldr r0, _0207EB1C ; =0x000005DC
	bl PlaySE
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	bl sub_0207E54C
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	add r0, r5, #0
	bl sub_0207E358
_0207EB10:
	mov r0, #0
	mvn r0, r0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207EB18: .word _02110168
_0207EB1C: .word 0x000005DC
_0207EB20: .word gSystem
	thumb_func_end sub_0207E93C

	.rodata

_021015AC:
	.short 0, 2, 6, 8, 3, 5, 1, 7
_021015BC:
	.short 0x0008, 0x0002, 0x0014, 0x000E
	.short 0x0009, 0x0003, 0x0015, 0x000F
	.short 0x000A, 0x0004, 0x0016, 0x0010
	.short 0x000B, 0x0005, 0x0017, 0x0011
	.short 0x000C, 0x0006, 0x0018, 0x0012
	.short 0x000D, 0x0007, 0x0019, 0x0013
_021015EC:
	.byte 0x10, 0x03, 0x10, 0x04
	.byte 0x10, 0x07, 0x10, 0x04
	.byte 0x10, 0x0B, 0x10, 0x04
	.byte 0x00, 0x02, 0x10, 0x04
	.byte 0x00, 0x06, 0x10, 0x04
	.byte 0x00, 0x0A, 0x10, 0x04
	.byte 0x00, 0x0E, 0x10, 0x04
	.byte 0x19, 0x13, 0x07, 0x05
	.byte 0x10, 0x02, 0x10, 0x04
	.byte 0x10, 0x06, 0x10, 0x04
	.byte 0x10, 0x0A, 0x10, 0x04
	.byte 0x10, 0x0E, 0x10, 0x04

_0210161C:
	.byte 0x01, 0x1A, 0x15, 0x05, 0x02, 0x00, 0x80, 0x01
_02101624:
	.byte 0x01, 0x19, 0x14, 0x07, 0x02, 0x00, 0x8A, 0x01
_0210162C:
	.byte 0x00, 0x02, 0x15, 0x14, 0x02, 0x0D, 0x98, 0x01
_02101634:
	.byte 0x00, 0x02, 0x13, 0x0D, 0x04, 0x0D, 0xC0, 0x01
_0210163C:
	.byte 0x00, 0x02, 0x13, 0x1B, 0x04, 0x0D, 0xF4, 0x01
_02101644:
	.byte 0x00, 0x13, 0x11, 0x0C, 0x06, 0x00, 0x60, 0x02
_0210164C:
	.byte 0x00, 0x13, 0x0F, 0x0C, 0x08, 0x00, 0x60, 0x02
_02101654:
	.byte 0x00, 0x11, 0x04, 0x0E, 0x02, 0x02, 0x60, 0x02
	.byte 0x00, 0x11, 0x08, 0x0E, 0x02, 0x02, 0x7C, 0x02
	.byte 0x00, 0x11, 0x0C, 0x0E, 0x02, 0x02, 0x98, 0x02
	.byte 0x00, 0x01, 0x03, 0x0E, 0x02, 0x02, 0xB4, 0x02
	.byte 0x00, 0x01, 0x07, 0x0E, 0x02, 0x02, 0xD0, 0x02
	.byte 0x00, 0x01, 0x0B, 0x0E, 0x02, 0x02, 0xEC, 0x02
	.byte 0x00, 0x01, 0x0F, 0x0E, 0x02, 0x02, 0x08, 0x03
	.byte 0x00, 0x1A, 0x14, 0x05, 0x03, 0x02, 0x24, 0x03
	.byte 0x00, 0x11, 0x03, 0x0E, 0x02, 0x02, 0x60, 0x02
	.byte 0x00, 0x11, 0x07, 0x0E, 0x02, 0x02, 0x7C, 0x02
	.byte 0x00, 0x11, 0x0B, 0x0E, 0x02, 0x02, 0x98, 0x02
	.byte 0x00, 0x11, 0x0F, 0x0E, 0x02, 0x02, 0xB4, 0x02
_021016B4:
	.byte 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF

	.byte 0x00, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x08, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF

	.byte 0x00, 0x01, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x08, 0x09, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF

	.byte 0x00, 0x01, 0x02, 0x07, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x08, 0x09, 0x0A, 0x07, 0xFF, 0xFF, 0xFF, 0xFF

	.byte 0x00, 0x01, 0x02, 0x07, 0x03, 0xFF, 0xFF, 0xFF
	.byte 0x08, 0x09, 0x0A, 0x0B, 0x07, 0xFF, 0xFF, 0xFF

	.byte 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0xFF, 0xFF
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x08, 0xFF, 0xFF

	.byte 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0x05, 0xFF
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x08, 0xFF

	.byte 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0x05, 0x06
	.byte 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0x05, 0x06
_02101734:
// struct WindowTemplate[][5]
	.byte 0x01, 0x06, 0x01, 0x09, 0x02, 0x00, 0x48, 0x00
	.byte 0x01, 0x00, 0x04, 0x06, 0x02, 0x00, 0x5A, 0x00
	.byte 0x01, 0x07, 0x04, 0x08, 0x02, 0x00, 0x66, 0x00
	.byte 0x01, 0x08, 0x03, 0x06, 0x01, 0x03, 0x76, 0x00
	.byte 0x01, 0x06, 0x04, 0x0A, 0x02, 0x00, 0x66, 0x00
; 0x0210175C
	.byte 0x01, 0x16, 0x02, 0x09, 0x02, 0x00, 0x7C, 0x00
	.byte 0x01, 0x10, 0x05, 0x06, 0x02, 0x00, 0x8E, 0x00
	.byte 0x01, 0x17, 0x05, 0x08, 0x02, 0x00, 0x9A, 0x00
	.byte 0x01, 0x18, 0x04, 0x06, 0x01, 0x04, 0xAA, 0x00
	.byte 0x01, 0x16, 0x05, 0x0A, 0x02, 0x00, 0x9A, 0x00
; 0x02101784
	.byte 0x01, 0x06, 0x07, 0x09, 0x02, 0x00, 0xB0, 0x00
	.byte 0x01, 0x00, 0x0A, 0x06, 0x02, 0x00, 0xC2, 0x00
	.byte 0x01, 0x07, 0x0A, 0x08, 0x02, 0x00, 0xCE, 0x00
	.byte 0x01, 0x08, 0x09, 0x06, 0x01, 0x05, 0xDE, 0x00
	.byte 0x01, 0x06, 0x0A, 0x0A, 0x02, 0x00, 0xCE, 0x00
; 0x021017AC
	.byte 0x01, 0x16, 0x08, 0x09, 0x02, 0x00, 0xE4, 0x00
	.byte 0x01, 0x10, 0x0B, 0x06, 0x02, 0x00, 0xF6, 0x00
	.byte 0x01, 0x17, 0x0B, 0x08, 0x02, 0x00, 0x02, 0x01
	.byte 0x01, 0x18, 0x0A, 0x06, 0x01, 0x06, 0x12, 0x01
	.byte 0x01, 0x16, 0x0B, 0x0A, 0x02, 0x00, 0x02, 0x01
; 0x021017D4
	.byte 0x01, 0x06, 0x0D, 0x09, 0x02, 0x00, 0x18, 0x01
	.byte 0x01, 0x00, 0x10, 0x06, 0x02, 0x00, 0x2A, 0x01
	.byte 0x01, 0x07, 0x10, 0x08, 0x02, 0x00, 0x36, 0x01
	.byte 0x01, 0x08, 0x0F, 0x06, 0x01, 0x07, 0x46, 0x01
	.byte 0x01, 0x06, 0x10, 0x0A, 0x02, 0x00, 0x36, 0x01
; 0x021017FC
	.byte 0x01, 0x16, 0x0E, 0x09, 0x02, 0x00, 0x4C, 0x01
	.byte 0x01, 0x10, 0x11, 0x06, 0x02, 0x00, 0x5E, 0x01
	.byte 0x01, 0x17, 0x11, 0x08, 0x02, 0x00, 0x6A, 0x01
	.byte 0x01, 0x18, 0x10, 0x06, 0x01, 0x08, 0x7A, 0x01
	.byte 0x01, 0x16, 0x11, 0x0A, 0x02, 0x00, 0x6A, 0x01
; 0x02101824
	.byte 0x01, 0x16, 0x01, 0x09, 0x02, 0x00, 0x7C, 0x00
	.byte 0x01, 0x11, 0x05, 0x05, 0x02, 0x00, 0x8E, 0x00
	.byte 0x01, 0x17, 0x05, 0x08, 0x02, 0x00, 0x9A, 0x00
	.byte 0x01, 0x18, 0x04, 0x06, 0x01, 0x04, 0xAA, 0x00
	.byte 0x01, 0x18, 0x04, 0x06, 0x01, 0x04, 0xAA, 0x00
; 0x0210184C
	.byte 0x01, 0x16, 0x08, 0x09, 0x02, 0x00, 0xE4, 0x00
	.byte 0x01, 0x11, 0x0B, 0x05, 0x02, 0x00, 0xF6, 0x00
	.byte 0x01, 0x17, 0x0B, 0x08, 0x02, 0x00, 0x02, 0x01
	.byte 0x01, 0x18, 0x0A, 0x06, 0x01, 0x06, 0x12, 0x01
	.byte 0x01, 0x18, 0x04, 0x06, 0x01, 0x04, 0xAA, 0x00
; 0x02101874
	.byte 0x01, 0x16, 0x0E, 0x09, 0x02, 0x00, 0x4C, 0x01
	.byte 0x01, 0x11, 0x11, 0x05, 0x02, 0x00, 0x5E, 0x01
	.byte 0x01, 0x17, 0x11, 0x08, 0x02, 0x00, 0x6A, 0x01
	.byte 0x01, 0x18, 0x10, 0x06, 0x01, 0x08, 0x7A, 0x01
	.byte 0x01, 0x18, 0x04, 0x06, 0x01, 0x04, 0xAA, 0x00
; 0x0210189C
	.byte 0x06, 0x07, 0x18, 0x0A, 0x02, 0x02, 0x01, 0x00
	.byte 0x06, 0x11, 0x18, 0x06, 0x02, 0x02, 0x15, 0x00
	.byte 0x06, 0x11, 0x1A, 0x0C, 0x03, 0x02, 0x21, 0x00

	.data

_02110168:
	.byte 0x10, 0x30, 0x80, 0x00, 0x30, 0x50, 0x80, 0x00
	.byte 0x50, 0x70, 0x80, 0x00, 0x70, 0x90, 0x80, 0x00, 0x98, 0xC0, 0xC8, 0x00, 0xFF, 0x00, 0x00, 0x00
_02110180:
	.byte 0x18, 0x38, 0x80, 0x00, 0x38, 0x58, 0x80, 0x00, 0x58, 0x78, 0x80, 0x00, 0x10, 0x30, 0x00, 0x80
	.byte 0x30, 0x50, 0x00, 0x80, 0x50, 0x70, 0x00, 0x80, 0x70, 0x90, 0x00, 0x80, 0x98, 0xC0, 0xC8, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00
_021101A4:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02110244:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x06, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x07, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00
