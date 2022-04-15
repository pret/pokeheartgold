#include "constants/sndseq.h"
#include "constants/moves.h"
#include "constants/std_script.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "constants/maps.h"
#include "constants/mmodel.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_648
ScrCmd_648: ; 0x02200AF0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	str r0, [sp, #0x1c]
	add r0, #0x80
	ldr r6, [r0]
	mov r1, #0x10
	add r0, r6, #0
	bl FieldSysGetAttrAddr
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x1c]
	bl ScriptReadHalfword
	add r1, r0, #0
	ldr r0, [sp, #0x1c]
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x1c]
	bl ScriptReadHalfword
	add r1, r0, #0
	ldr r0, [sp, #0x1c]
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x1c]
	bl ScriptReadHalfword
	add r4, r0, #0
	ldr r0, [sp, #0x1c]
	bl ScriptReadHalfword
	add r7, r0, #0
	ldr r0, [sp, #0x1c]
	bl ScriptReadHalfword
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x1c]
	mov r1, #0x1b
	str r4, [r0, #0x64]
	mov r0, #0
	mov r2, #0xed
	mov r3, #0x20
	bl NewMsgDataFromNarc
	str r0, [sp, #0x20]
	add r0, r6, #0
	add r1, r4, #0
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [sp, #0x1c]
	mov r1, #1
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSysGetAttrAddr
	add r5, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl GetVarPointer
	add r7, r0, #0
	ldr r1, [sp, #0x38]
	add r0, r6, #0
	bl GetVarPointer
	mov r2, #1
	str r2, [sp]
	ldr r1, [sp, #0x2c]
	str r4, [sp, #4]
	ldr r1, [r1]
	mov r3, #0
	str r1, [sp, #8]
	ldr r1, [sp, #0x20]
	str r5, [sp, #0xc]
	str r1, [sp, #0x10]
	str r7, [sp, #0x14]
	str r0, [sp, #0x18]
	add r0, r6, #0
	mov r1, #0x14
	bl ov01_02200D9C
	add r7, r0, #0
	ldr r0, [r6, #0xc]
	mov r1, #0xb
	add r2, sp, #0x44
	bl sub_020312C4
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x44]
	cmp r0, #1
	bne _02200C0A
	ldr r1, [sp, #0x34]
	mov r0, #0x20
	lsl r2, r1, #1
	ldr r1, _02200C60 ; =ov01_02209AE0
	ldrh r1, [r1, r2]
	add r2, sp, #0x40
	bl ov01_02200C94
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x40]
	mov r4, #0
	cmp r0, #0
	ble _02200C04
	ldr r0, [sp, #0x30]
	ldr r5, [sp, #0x24]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x3c]
_02200BD8:
	ldr r0, [sp, #0x3c]
	bl sub_0205C144
	add r2, r0, #0
	ldrh r3, [r5]
	ldr r0, [r6, #0xc]
	ldr r1, [sp, #0x28]
	bl sub_020312E0
	cmp r0, #0
	beq _02200BFA
	ldrh r1, [r5]
	add r0, r7, #0
	mov r2, #0xff
	add r3, r1, #0
	bl ov01_02200DF8
_02200BFA:
	ldr r0, [sp, #0x40]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, r0
	blt _02200BD8
_02200C04:
	ldr r0, [sp, #0x24]
	bl FreeToHeap
_02200C0A:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _02200C14
	bl FreeToHeap
_02200C14:
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xbf
	mov r3, #0x20
	bl NewMsgDataFromNarc
	add r4, r0, #0
	add r0, r7, #0
	add r1, r4, #0
	bl ov01_02200CB4
	ldr r3, _02200C64 ; =0x0000FFFE
	add r0, r7, #0
	mov r1, #0xd
	mov r2, #0xff
	bl ov01_02200DF8
	add r0, r4, #0
	bl DestroyMsgData
	ldr r1, [sp, #0x20]
	add r0, r7, #0
	bl ov01_02200CB4
	add r0, r7, #0
	bl ov01_02200E00
	ldr r0, [sp, #0x1c]
	ldr r1, _02200C68 ; =ov01_02200C6C
	bl SetupNativeScript
	ldr r0, [sp, #0x20]
	bl DestroyMsgData
	mov r0, #1
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02200C60: .word ov01_02209AE0
_02200C64: .word 0x0000FFFE
_02200C68: .word ov01_02200C6C
	thumb_func_end ScrCmd_648

	thumb_func_start ov01_02200C6C
ov01_02200C6C: ; 0x02200C6C
	push {r3, lr}
	add r1, r0, #0
	ldr r1, [r1, #0x64]
	add r0, #0x80
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	ldrh r1, [r0]
	ldr r0, _02200C90 ; =0x0000EEEE
	cmp r1, r0
	beq _02200C8A
	mov r0, #1
	pop {r3, pc}
_02200C8A:
	mov r0, #0
	pop {r3, pc}
	nop
_02200C90: .word 0x0000EEEE
	thumb_func_end ov01_02200C6C

	thumb_func_start ov01_02200C94
ov01_02200C94: ; 0x02200C94
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r2, #0
	mov r2, #0
	add r3, r0, #0
	str r2, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	mov r0, #0x4a
	bl GfGfxLoader_LoadFromNarc_GetSizeOut
	ldr r1, [sp, #8]
	lsr r1, r1, #1
	str r1, [r4]
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov01_02200C94

	thumb_func_start ov01_02200CB4
ov01_02200CB4: ; 0x02200CB4
	mov r2, #0x7f
	lsl r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov01_02200CB4

	thumb_func_start ov01_02200CBC
ov01_02200CBC: ; 0x02200CBC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r2, #0
	mov r2, #0x7f
	ldr r1, [sp, #0x2c]
	lsl r2, r2, #2
	str r1, [r6, r2]
	add r1, r2, #0
	add r1, #0xb
	add r5, r3, #0
	ldrb r1, [r6, r1]
	mov r3, #2
	bic r1, r3
	add r3, r2, #0
	add r3, #0xb
	strb r1, [r6, r3]
	ldr r3, [sp, #0x24]
	add r1, r2, #4
	str r3, [r6, r1]
	str r0, [r6]
	add r0, r2, #0
	ldr r1, [sp, #0x20]
	add r0, #0x14
	str r1, [r6, r0]
	add r0, r2, #0
	add r0, #0x14
	ldr r0, [r6, r0]
	mov r1, #0
	strh r1, [r0]
	add r0, r2, #0
	ldr r3, [sp, #0x30]
	add r0, #0x18
	str r3, [r6, r0]
	add r0, r2, #0
	ldr r3, [sp, #0x34]
	add r0, #0x1c
	str r3, [r6, r0]
	add r0, r2, #0
	add r0, #0xb
	ldrb r4, [r6, r0]
	mov r0, #1
	bic r4, r0
	add r0, sp, #8
	ldrb r3, [r0, #0x14]
	mov r0, #1
	and r0, r3
	add r3, r4, #0
	orr r3, r0
	add r0, r2, #0
	add r0, #0xb
	strb r3, [r6, r0]
	add r0, sp, #8
	add r3, r2, #0
	ldrb r0, [r0, #0x10]
	add r3, #0xa
	strb r0, [r6, r3]
	add r3, r2, #0
	add r3, #0xc
	strb r7, [r6, r3]
	add r3, r2, #0
	add r3, #0xd
	strb r5, [r6, r3]
	add r3, r2, #0
	add r3, #0xf
	strb r1, [r6, r3]
	ldr r3, [sp, #0x28]
	add r2, #8
	str r3, [r6, #0x18]
	mov r3, #3
	strb r3, [r6, r2]
	ldr r2, _02200D90 ; =0x000006F4
	ldr r7, _02200D94 ; =0x00000604
	strh r0, [r6, r2]
	add r2, r6, #0
	add r3, r6, #0
	add r5, r1, #0
	mov r0, #0xff
_02200D56:
	mov r4, #0x91
	lsl r4, r4, #2
	str r5, [r2, r4]
	add r4, r4, #4
	str r5, [r2, r4]
	strh r0, [r3, r7]
	add r1, r1, #1
	add r2, #8
	add r3, r3, #2
	cmp r1, #0x78
	blt _02200D56
	add r4, r6, #0
	mov r7, #0x50
_02200D70:
	add r0, r7, #0
	mov r1, #4
	bl String_ctor
	str r0, [r4, #0x1c]
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #0x78
	blt _02200D70
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r1, _02200D98 ; =0x0000EEEE
	ldr r0, [r6, r0]
	strh r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02200D90: .word 0x000006F4
_02200D94: .word 0x00000604
_02200D98: .word 0x0000EEEE
	thumb_func_end ov01_02200CBC

	thumb_func_start ov01_02200D9C
ov01_02200D9C: ; 0x02200D9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r7, r1, #0
	add r6, r0, #0
	ldr r1, _02200DF4 ; =0x000006F8
	mov r0, #4
	str r2, [sp, #0x20]
	add r5, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _02200DBA
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02200DBA:
	ldr r2, _02200DF4 ; =0x000006F8
	mov r1, #0
	bl memset
	str r5, [sp]
	add r0, sp, #0x28
	ldrb r0, [r0, #0x10]
	add r1, r4, #0
	add r2, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #8]
	ldr r0, [sp, #0x40]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x44]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x48]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x50]
	str r0, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	add r0, r6, #0
	bl ov01_02200CBC
	add r0, r4, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02200DF4: .word 0x000006F8
	thumb_func_end ov01_02200D9C

	thumb_func_start ov01_02200DF8
ov01_02200DF8: ; 0x02200DF8
	push {r3, lr}
	bl ov01_02200EC8
	pop {r3, pc}
	thumb_func_end ov01_02200DF8

	thumb_func_start ov01_02200E00
ov01_02200E00: ; 0x02200E00
	push {r3, r4, lr}
	sub sp, #0x14
	ldr r3, _02200EBC ; =0x0000020B
	add r4, r0, #0
	ldrb r1, [r4, r3]
	cmp r1, #8
	bls _02200E38
	sub r0, r3, #2
	ldrb r0, [r4, r0]
	add r1, r4, #0
	sub r3, r3, #3
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldrb r3, [r4, r3]
	ldr r0, [r0, #8]
	add r1, #8
	mov r2, #3
	bl AddWindowParameterized
	b _02200E62
_02200E38:
	sub r0, r3, #2
	ldrb r0, [r4, r0]
	sub r3, r3, #3
	mov r2, #3
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	lsl r0, r1, #0x19
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, r4, #0
	ldrb r3, [r4, r3]
	ldr r0, [r0, #8]
	add r1, #8
	bl AddWindowParameterized
_02200E62:
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02200EC0 ; =0x000003D9
	ldr r0, [r0, #8]
	mov r1, #3
	mov r3, #0xb
	bl LoadUserFrameGfx1
	add r0, r4, #0
	ldr r2, _02200EC0 ; =0x000003D9
	add r0, #8
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add r0, r4, #0
	bl ov01_02200F54
	mov r2, #0x87
	lsl r2, r2, #2
	add r1, r2, #0
	add r0, r4, r2
	sub r1, #8
	sub r2, r2, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	ldrh r1, [r1]
	ldrh r2, [r2]
	mov r3, #4
	bl ListMenuInit
	mov r1, #0x8f
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _02200EC4 ; =ov01_022010CC
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r4, #4]
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_02200EBC: .word 0x0000020B
_02200EC0: .word 0x000003D9
_02200EC4: .word ov01_022010CC
	thumb_func_end ov01_02200E00

	thumb_func_start ov01_02200EC8
ov01_02200EC8: ; 0x02200EC8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0x50
	mov r1, #4
	add r7, r2, #0
	add r4, r3, #0
	bl String_ctor
	add r6, r0, #0
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp]
	add r2, r6, #0
	bl ReadMsgDataIntoString
	mov r1, #2
	lsl r1, r1, #8
	ldr r0, [r5, r1]
	add r1, #0xb
	ldrb r1, [r5, r1]
	add r2, r6, #0
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r1, [r1, #0x1c]
	bl StringExpandPlaceholders
	ldr r2, _02200F4C ; =0x0000020B
	ldrb r1, [r5, r2]
	add r2, #0x39
	lsl r0, r1, #2
	add r0, r5, r0
	lsl r1, r1, #3
	ldr r0, [r0, #0x1c]
	add r1, r5, r1
	str r0, [r1, r2]
	add r0, r6, #0
	bl String_dtor
	cmp r4, #0xfa
	ldr r0, _02200F4C ; =0x0000020B
	bne _02200F2E
	ldrb r1, [r5, r0]
	mov r2, #2
	mvn r2, r2
	lsl r1, r1, #3
	add r1, r5, r1
	add r0, #0x3d
	str r2, [r1, r0]
	b _02200F38
_02200F2E:
	ldrb r1, [r5, r0]
	add r0, #0x3d
	lsl r1, r1, #3
	add r1, r5, r1
	str r4, [r1, r0]
_02200F38:
	ldr r1, _02200F4C ; =0x0000020B
	ldrb r0, [r5, r1]
	lsl r0, r0, #1
	add r2, r5, r0
	ldr r0, _02200F50 ; =0x00000604
	strh r7, [r2, r0]
	ldrb r0, [r5, r1]
	add r0, r0, #1
	strb r0, [r5, r1]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02200F4C: .word 0x0000020B
_02200F50: .word 0x00000604
	thumb_func_end ov01_02200EC8

	thumb_func_start ov01_02200F54
ov01_02200F54: ; 0x02200F54
	push {r4, r5}
	mov r3, #0x91
	lsl r3, r3, #2
	add r1, r3, #0
	add r2, r0, r3
	sub r1, #0x28
	str r2, [r0, r1]
	add r1, r3, #0
	ldr r2, _02201050 ; =ov01_02201088
	sub r1, #0x24
	str r2, [r0, r1]
	add r1, r3, #0
	ldr r2, _02201054 ; =ov01_02201064
	sub r1, #0x20
	str r2, [r0, r1]
	add r2, r0, #0
	add r1, r3, #0
	add r2, #8
	sub r1, #0x1c
	str r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0x39
	ldrb r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0x18
	strh r2, [r0, r1]
	add r1, r3, #0
	mov r2, #8
	sub r1, #0x16
	strh r2, [r0, r1]
	add r1, r3, #0
	mov r2, #1
	sub r1, #0x14
	strb r2, [r0, r1]
	add r1, r3, #0
	mov r4, #0xc
	sub r1, #0x13
	strb r4, [r0, r1]
	add r1, r3, #0
	mov r4, #2
	sub r1, #0x12
	strb r4, [r0, r1]
	add r1, r3, #0
	sub r1, #0x11
	ldrb r4, [r0, r1]
	mov r1, #0xf
	bic r4, r1
	orr r4, r2
	add r2, r3, #0
	sub r2, #0x11
	strb r4, [r0, r2]
	add r2, r3, #0
	sub r2, #0x11
	ldrb r5, [r0, r2]
	mov r2, #0xf0
	mov r4, #0x10
	bic r5, r2
	orr r5, r4
	add r4, r3, #0
	sub r4, #0x11
	strb r5, [r0, r4]
	add r4, r3, #0
	sub r4, #0x10
	ldrb r4, [r0, r4]
	bic r4, r1
	mov r1, #0xf
	orr r4, r1
	add r1, r3, #0
	sub r1, #0x10
	strb r4, [r0, r1]
	add r1, r3, #0
	sub r1, #0x10
	ldrb r4, [r0, r1]
	mov r1, #0x20
	bic r4, r2
	add r2, r4, #0
	orr r2, r1
	add r1, r3, #0
	sub r1, #0x10
	strb r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	mov r1, #7
	bic r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	mov r1, #0x78
	bic r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	ldr r1, _02201058 ; =0xFFFFFE7F
	and r2, r1
	mov r1, #0x80
	orr r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	ldr r1, _0220105C ; =0xFFFF81FF
	and r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	ldr r1, _02201060 ; =0xFFFF7FFF
	and r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	sub r3, #0xc
	str r0, [r0, r3]
	pop {r4, r5}
	bx lr
	.balign 4, 0
_02201050: .word ov01_02201088
_02201054: .word ov01_02201064
_02201058: .word 0xFFFFFE7F
_0220105C: .word 0xFFFF81FF
_02201060: .word 0xFFFF7FFF
	thumb_func_end ov01_02200F54

	thumb_func_start ov01_02201064
ov01_02201064: ; 0x02201064
	push {r3, lr}
	mov r2, #2
	mvn r2, r2
	cmp r1, r2
	bne _0220107A
	mov r1, #3
	mov r2, #0xf
	mov r3, #4
	bl ListMenuOverrideSetColors
	pop {r3, pc}
_0220107A:
	mov r1, #1
	mov r2, #0xf
	mov r3, #2
	bl ListMenuOverrideSetColors
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_02201064

	thumb_func_start ov01_02201088
ov01_02201088: ; 0x02201088
	push {r3, r4, r5, lr}
	mov r2, #0
	add r1, sp, #0
	strh r2, [r1, #2]
	strh r2, [r1]
	mov r1, #0x13
	add r5, r0, #0
	bl ListMenuGetTemplateField
	add r1, sp, #0
	add r4, r0, #0
	add r0, r5, #0
	add r1, #2
	add r2, sp, #0
	bl ListMenuGetScrollAndRow
	mov r1, #0x85
	lsl r1, r1, #2
	ldr r3, [r4, r1]
	cmp r3, #0
	beq _022010C8
	add r0, r1, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022010C8
	add r0, sp, #0
	ldrh r2, [r0, #2]
	strh r2, [r3]
	ldrh r2, [r0]
	add r0, r1, #4
	ldr r0, [r4, r0]
	strh r2, [r0]
_022010C8:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_02201088

	thumb_func_start ov01_022010CC
ov01_022010CC: ; 0x022010CC
	push {r4, r5, r6, lr}
	mov r0, #0x81
	add r5, r1, #0
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	cmp r1, #0
	beq _022010E0
	sub r1, r1, #1
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_022010E0:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0220115A
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenu_ProcessInput
	add r4, r0, #0
	mov r0, #0x8f
	ldr r1, _0220115C ; =0x000006F4
	lsl r0, r0, #2
	ldrh r6, [r5, r1]
	ldr r0, [r5, r0]
	add r1, r5, r1
	bl ListMenuGetCurrentItemArrayId
	ldr r0, _0220115C ; =0x000006F4
	ldrh r0, [r5, r0]
	cmp r6, r0
	beq _02201112
	ldr r0, _02201160 ; =SEQ_SE_DP_SELECT
	bl PlaySE
_02201112:
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _02201122
	add r0, r0, #1
	cmp r4, r0
	beq _0220115A
	b _02201146
_02201122:
	ldr r0, _02201164 ; =0x00000207
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0220115A
	ldr r0, _02201160 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r1, _02201168 ; =0x0000FFFE
	ldr r0, [r5, r0]
	strh r1, [r0]
	add r0, r5, #0
	bl ov01_0220116C
	pop {r4, r5, r6, pc}
_02201146:
	ldr r0, _02201160 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	strh r4, [r0]
	add r0, r5, #0
	bl ov01_0220116C
_0220115A:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0220115C: .word 0x000006F4
_02201160: .word SEQ_SE_DP_SELECT
_02201164: .word 0x00000207
_02201168: .word 0x0000FFFE
	thumb_func_end ov01_022010CC

	thumb_func_start ov01_0220116C
ov01_0220116C: ; 0x0220116C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _022011CC ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #0x8f
	lsl r0, r0, #2
	mov r1, #0
	ldr r0, [r6, r0]
	add r2, r1, #0
	bl DestroyListMenu
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl sub_0200E5D4
	add r0, r6, #0
	add r0, #8
	bl RemoveWindow
	mov r4, #0
	add r5, r6, #0
_0220119C:
	ldr r0, [r5, #0x1c]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x78
	blt _0220119C
	ldr r0, _022011D0 ; =0x00000207
	ldrb r1, [r6, r0]
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _022011BE
	sub r0, #0xb
	ldr r0, [r6, r0]
	bl DestroyMsgData
_022011BE:
	ldr r0, [r6, #4]
	bl DestroySysTask
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022011CC: .word SEQ_SE_DP_SELECT
_022011D0: .word 0x00000207
	thumb_func_end ov01_0220116C

	thumb_func_start ScrCmd_StatJudge
ScrCmd_StatJudge: ; 0x022011D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r1, [r1]
	str r1, [sp, #4]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r4, r0, #0
	mov r1, #0x46
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x47
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x48
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0x49
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #0x4a
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x18]
	add r0, r4, #0
	mov r1, #0x4b
	mov r2, #0
	bl GetMonData
	mov r4, #0
	str r0, [sp, #0x1c]
	strh r4, [r5]
	add r2, r4, #0
	add r1, sp, #8
_0220128C:
	lsl r0, r2, #2
	ldrh r3, [r5]
	ldr r0, [r1, r0]
	add r3, r3, r0
	strh r3, [r5]
	cmp r4, r0
	bhs _0220129E
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0220129E:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #6
	blo _0220128C
	mov r1, #0x49
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	strh r0, [r7]
	add r6, sp, #8
_022012BA:
	lsl r1, r0, #2
	ldr r1, [r6, r1]
	cmp r4, r1
	bne _022012D6
	strh r0, [r7]
	add r0, r0, #1
	mov r1, #6
	bl _s32_div_f
	mov r2, #0x49
	ldr r0, [sp, #4]
	lsl r2, r2, #2
	str r1, [r0, r2]
	b _022012EC
_022012D6:
	add r0, r0, #1
	mov r1, #6
	bl _s32_div_f
	lsl r0, r1, #0x18
	add r1, r5, #1
	lsl r1, r1, #0x18
	lsr r5, r1, #0x18
	lsr r0, r0, #0x18
	cmp r5, #6
	blo _022012BA
_022012EC:
	ldr r0, [sp]
	strh r4, [r0]
	ldrh r0, [r7]
	lsl r1, r0, #1
	ldr r0, _02201300 ; =sStatJudgeBestStatMsgIdxs
	ldrh r0, [r0, r1]
	strh r0, [r7]
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02201300: .word sStatJudgeBestStatMsgIdxs
	thumb_func_end ScrCmd_StatJudge

	thumb_func_start ScrCmd_CommSanitizeParty
ScrCmd_CommSanitizeParty: ; 0x02201304
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	mov r1, #0
	add r4, r0, #0
	str r1, [sp, #8]
	add r1, r4, #0
	add r1, #0x80
	ldr r1, [r1]
	str r1, [sp, #4]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r7, r0, #0
	bl GetPartyCount
	add r6, r0, #0
	mov r4, #0
	ldr r0, [sp]
	cmp r6, #0
	strh r4, [r0]
	ble _02201366
	add r5, sp, #0x10
_02201342:
	add r0, r7, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #6
	mov r2, #0
	bl GetMonData
	str r0, [r5]
	cmp r0, #0x70
	bne _0220135E
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
_0220135E:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _02201342
_02201366:
	ldr r0, [sp, #8]
	cmp r0, #0
	ble _022013BA
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl Sav2_Bag_get
	ldr r2, [sp, #8]
	mov r1, #0x70
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	mov r3, #4
	bl Bag_AddItem
	cmp r0, #0
	bne _02201392
	ldr r0, [sp]
	mov r1, #0xff
	strh r1, [r0]
	add sp, #0x28
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02201392:
	mov r5, #0
	str r5, [sp, #0xc]
	cmp r6, #0
	ble _022013BA
	add r4, sp, #0x10
_0220139C:
	ldr r0, [r4]
	cmp r0, #0x70
	bne _022013B2
	add r0, r7, #0
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #6
	add r2, sp, #0xc
	bl SetMonData
_022013B2:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r6
	blt _0220139C
_022013BA:
	mov r5, #0
	cmp r6, #0
	ble _02201418
_022013C0:
	add r0, r7, #0
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x70
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	ble _02201412
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	ldr r1, _02201420 ; =SPECIES_ROTOM
	cmp r0, r1
	beq _022013FE
	add r1, #8
	cmp r0, r1
	beq _022013F6
	mov r1, #0x7b
	lsl r1, r1, #2
	cmp r0, r1
	beq _0220140A
	b _02201412
_022013F6:
	add r0, r4, #0
	bl Mon_UpdateGiratinaForme
	b _02201412
_022013FE:
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl Mon_UpdateRotomForme
	b _02201412
_0220140A:
	add r0, r4, #0
	mov r1, #0
	bl Mon_UpdateShayminForme
_02201412:
	add r5, r5, #1
	cmp r5, r6
	blt _022013C0
_02201418:
	mov r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02201420: .word SPECIES_ROTOM
	thumb_func_end ScrCmd_CommSanitizeParty

	thumb_func_start ScrCmd_SetMonForme
ScrCmd_SetMonForme: ; 0x02201424
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r1, sp, #0
	strh r0, [r1]
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #0x70
	add r2, sp, #0
	bl SetMonData
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ScrCmd_SetMonForme

	thumb_func_start ScrCmd_CountTranformedRotomsInParty
ScrCmd_CountTranformedRotomsInParty: ; 0x02201470
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r6, r0, #0
	mov r0, #0xff
	strh r0, [r6]
	ldr r0, [r4, #0xc]
	mov r7, #0
	bl SavArray_PlayerParty_get
	str r0, [sp, #4]
	bl GetPartyCount
	add r5, r7, #0
	str r0, [sp, #8]
	cmp r0, #0
	ble _02201508
_022014BA:
	ldr r0, [sp, #4]
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r4, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	ldr r2, [sp, #0xc]
	ldr r1, _02201514 ; =SPECIES_ROTOM
	cmp r2, r1
	bne _02201500
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02201500
	cmp r0, #0
	bne _02201500
	ldrh r0, [r6]
	cmp r0, #0xff
	bne _022014FE
	strh r5, [r6]
_022014FE:
	add r7, r7, #1
_02201500:
	ldr r0, [sp, #8]
	add r5, r5, #1
	cmp r5, r0
	blt _022014BA
_02201508:
	ldr r0, [sp]
	strh r7, [r0]
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02201514: .word SPECIES_ROTOM
	thumb_func_end ScrCmd_CountTranformedRotomsInParty

	thumb_func_start ScrCmd_UpdateRotomForme
ScrCmd_UpdateRotomForme: ; 0x02201518
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	ldr r2, [sp]
	add r1, r7, #0
	add r5, r0, #0
	bl Mon_UpdateRotomForme
	ldr r0, [r4, #0xc]
	bl Sav2_Pokedex_get
	add r1, r5, #0
	bl Pokedex_SetMonCaughtFlag
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_UpdateRotomForme

	thumb_func_start ScrCmd_GetHiddenPowerType
ScrCmd_GetHiddenPowerType: ; 0x02201594
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r7, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r6, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02201682
	ldr r0, _02201698 ; =0x0000010A
	cmp r4, r0
	bgt _02201634
	bge _02201678
	cmp r4, #0x84
	bgt _02201620
	bge _02201678
	cmp r4, #0xe
	bgt _0220161A
	add r0, r4, #0
	sub r0, #0xa
	bmi _02201682
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02201610: ; jump table
	.short _02201678 - _02201610 - 2 ; case 0
	.short _02201678 - _02201610 - 2 ; case 1
	.short _02201682 - _02201610 - 2 ; case 2
	.short _02201678 - _02201610 - 2 ; case 3
	.short _02201678 - _02201610 - 2 ; case 4
_0220161A:
	cmp r4, #0x81
	beq _02201678
	b _02201682
_02201620:
	cmp r4, #0xeb
	bgt _0220162C
	bge _02201678
	cmp r4, #0xca
	beq _02201678
	b _02201682
_0220162C:
	sub r0, r0, #1
	cmp r4, r0
	beq _02201678
	b _02201682
_02201634:
	add r1, r0, #0
	add r1, #0x6c
	cmp r4, r1
	bgt _0220165A
	add r1, r0, #0
	add r1, #0x6c
	cmp r4, r1
	bge _02201678
	add r1, r0, #2
	cmp r4, r1
	bgt _02201652
	add r0, r0, #2
	cmp r4, r0
	beq _02201678
	b _02201682
_02201652:
	add r0, #0x5e
	cmp r4, r0
	beq _02201678
	b _02201682
_0220165A:
	add r1, r0, #0
	add r1, #0x92
	cmp r4, r1
	bgt _02201672
	add r1, r0, #0
	add r1, #0x92
	cmp r4, r1
	bge _02201678
	add r0, #0x87
	cmp r4, r0
	beq _02201678
	b _02201682
_02201672:
	add r0, #0x95
	cmp r4, r0
	bne _02201682
_02201678:
	ldr r0, _0220169C ; =0x0000FFFF
	add sp, #8
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02201682:
	add r0, r6, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov01_022016A0
	ldr r0, [sp]
	strh r0, [r5]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02201698: .word 0x0000010A
_0220169C: .word 0x0000FFFF
	thumb_func_end ScrCmd_GetHiddenPowerType

	thumb_func_start ov01_022016A0
ov01_022016A0: ; 0x022016A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	add r4, r2, #0
	add r6, r0, #0
	mov r1, #0x46
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x10]
	add r0, r6, #0
	mov r1, #0x47
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x48
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	add r0, r6, #0
	mov r1, #0x49
	mov r2, #0
	bl GetMonData
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0x4a
	mov r2, #0
	bl GetMonData
	str r0, [sp]
	add r0, r6, #0
	mov r1, #0x4b
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	cmp r5, #0
	beq _0220173C
	mov r1, #2
	and r0, r1
	lsl r0, r0, #4
	mov ip, r0
	ldr r0, [sp]
	and r0, r1
	lsl r3, r0, #3
	ldr r0, [sp, #4]
	and r0, r1
	lsl r0, r0, #2
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	and r0, r1
	lsl r2, r0, #1
	ldr r0, [sp, #0x10]
	and r0, r1
	asr r6, r0, #1
	ldr r0, [sp, #0xc]
	and r0, r1
	orr r0, r6
	add r1, r2, #0
	orr r1, r0
	ldr r0, [sp, #0x14]
	orr r0, r1
	add r1, r3, #0
	orr r1, r0
	mov r0, ip
	orr r1, r0
	mov r0, #0x28
	str r1, [r5]
	mul r0, r1
	mov r1, #0x3f
	bl _s32_div_f
	add r0, #0x1e
	str r0, [r5]
_0220173C:
	cmp r4, #0
	beq _02201786
	lsl r0, r7, #0x1f
	lsr r5, r0, #0x1a
	ldr r0, [sp]
	mov r6, #1
	lsl r0, r0, #0x1f
	lsr r3, r0, #0x1b
	ldr r0, [sp, #4]
	lsl r0, r0, #0x1f
	lsr r2, r0, #0x1c
	ldr r0, [sp, #8]
	lsl r0, r0, #0x1f
	lsr r1, r0, #0x1d
	ldr r0, [sp, #0x10]
	and r0, r6
	ldr r6, [sp, #0xc]
	lsl r6, r6, #0x1f
	lsr r6, r6, #0x1e
	orr r0, r6
	orr r0, r1
	orr r0, r2
	orr r0, r3
	add r1, r5, #0
	orr r1, r0
	mov r0, #0xf
	str r1, [r4]
	mul r0, r1
	mov r1, #0x3f
	bl _s32_div_f
	add r0, r0, #1
	str r0, [r4]
	cmp r0, #9
	blt _02201786
	add r0, r0, #1
	str r0, [r4]
_02201786:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_022016A0

	thumb_func_start ScrCmd_671
ScrCmd_671: ; 0x0220178C
	push {r3, r4, r5, r6, r7, lr}
	add r0, #0x80
	ldr r4, [r0]
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	mov r1, #0
	bl GetPartyMonByIndex
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl Sav2_Misc_get
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	add r3, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0202A9E8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_671

	thumb_func_start ScrCmd_672
ScrCmd_672: ; 0x022017DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_Misc_get
	add r1, sp, #8
	add r2, sp, #4
	add r3, sp, #0
	bl sub_0202AA20
	ldr r0, [sp, #8]
	strh r0, [r6]
	ldr r0, [sp, #4]
	strh r0, [r7]
	ldr r0, [sp]
	strh r0, [r4]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_672

	thumb_func_start ScrCmd_GetPartyMonForme
ScrCmd_GetPartyMonForme: ; 0x02201844
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_GetPartyMonForme

	thumb_func_start ScrCmd_699
ScrCmd_699: ; 0x0220188C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r1, #0
	str r1, [sp, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldr r6, [r0, #0x3c]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0xc
	str r0, [sp]
	bl MapObject_GetPositionVec
	add r0, r6, #0
	add r1, sp, #4
	add r2, sp, #8
	mov r3, #1
	ldr r5, [sp, #0x10]
	bl sub_0205EEF4
	cmp r0, #1
	bne _02201926
	asr r1, r5, #3
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r7, r0, #0xc
_022018C4:
	ldr r0, [sp, #4]
	ldr r1, [sp]
	cmp r0, r1
	beq _02201916
	mov r1, #2
	lsl r1, r1, #0xc
	bl MapObject_SetBits
	mov r1, #1
	ldr r0, [sp, #4]
	lsl r1, r1, #0xc
	bl MapObject_TestBits
	cmp r0, #1
	bne _022018FC
	ldr r0, [sp, #4]
	add r1, sp, #0xc
	bl MapObject_GetPositionVec
	ldr r0, [sp, #4]
	add r1, sp, #0xc
	str r5, [sp, #0x10]
	bl MapObject_SetPositionVec
	ldr r0, [sp, #4]
	add r1, r7, #0
	bl MapObject_SetCurrentHeight
_022018FC:
	ldr r0, [sp, #4]
	bl ov01_021F72DC
	add r4, r0, #0
	beq _02201916
	ldr r0, [sp, #4]
	add r1, r4, #0
	bl ov01_021FA3E8
	add r0, r4, #0
	mov r1, #1
	bl sub_02023EA4
_02201916:
	add r0, r6, #0
	add r1, sp, #4
	add r2, sp, #8
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	beq _022018C4
_02201926:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_699

	thumb_func_start ScrCmd_700
ScrCmd_700: ; 0x0220192C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r1, #0
	str r1, [sp, #4]
	add r0, #0x80
	ldr r0, [r0]
	ldr r4, [r0, #0x3c]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	add r0, r4, #0
	add r1, sp, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	bne _02201974
	mov r6, #2
	lsl r6, r6, #0xc
	add r7, sp, #0
_02201958:
	ldr r0, [sp]
	cmp r0, r5
	beq _02201964
	add r1, r6, #0
	bl MapObject_ClearBits
_02201964:
	add r0, r4, #0
	add r1, r7, #0
	add r2, sp, #4
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	beq _02201958
_02201974:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_700

	thumb_func_start ScrCmd_702
ScrCmd_702: ; 0x0220197C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0202CA44
	bl sub_02039F68
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_702

	thumb_func_start ScrCmd_703
ScrCmd_703: ; 0x02201990
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r1, r0, #0
	mov r0, #1
	bl GF_SndHandleSetPlayerVolume
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_703

	thumb_func_start ScrCmd_707
ScrCmd_707: ; 0x022019B0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r1, r6, #0
	bl Pokedex_CheckMonSeenFlag
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_707

	thumb_func_start ScrCmd_708
ScrCmd_708: ; 0x022019F0
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	add r4, #0x80
	ldr r0, [r4]
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x10]
	lsr r1, r1, #0x18
	bl ov02_022460AC
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_708

	thumb_func_start ScrCmd_774
ScrCmd_774: ; 0x02201A18
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	add r4, #0x80
	ldr r0, [r4]
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x10]
	lsr r1, r1, #0x18
	bl ov02_0224618C
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_774

	thumb_func_start ScrCmd_709
ScrCmd_709: ; 0x02201A40
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl ov02_022462E8
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_709

	thumb_func_start ScrCmd_561
ScrCmd_561: ; 0x02201A50
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	str r0, [sp]
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x10]
	add r2, r6, #0
	add r3, r7, #0
	bl ov02_02246714
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_561

	thumb_func_start ScrCmd_775
ScrCmd_775: ; 0x02201AB8
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r5, #0
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r6, #0
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	add r4, #0x80
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	ldr r0, [r0, #0x10]
	bl ov02_022469B4
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_775

	thumb_func_start ScrCmd_714
ScrCmd_714: ; 0x02201B14
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldrb r1, [r2]
	ldr r0, [r0, #0x10]
	bl ov02_022467C4
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_714

	thumb_func_start ov01_02201B2C
ov01_02201B2C: ; 0x02201B2C
	ldr r1, _02201B3C ; =0x0000FFFF
	cmp r0, r1
	bhi _02201B36
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
_02201B36:
	add r0, r1, #0
	bx lr
	nop
_02201B3C: .word 0x0000FFFF
	thumb_func_end ov01_02201B2C

	thumb_func_start ScrCmd_724
ScrCmd_724: ; 0x02201B40
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r6, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, #0x80
	add r4, r0, #0
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	bl Save_Pokeathlon_get
	bl sub_0203199C
	cmp r5, #9
	bhi _02201B8E
	lsl r1, r5, #2
	add r0, r0, r1
	ldr r0, [r0, #0x44]
	bl ov01_02201B2C
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
_02201B8E:
	sub r5, #0xa
	cmp r5, #7
	bhi _02201C00
	add r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02201BA0: ; jump table
	.short _02201BB0 - _02201BA0 - 2 ; case 0
	.short _02201BBA - _02201BA0 - 2 ; case 1
	.short _02201BC4 - _02201BA0 - 2 ; case 2
	.short _02201BCE - _02201BA0 - 2 ; case 3
	.short _02201BD8 - _02201BA0 - 2 ; case 4
	.short _02201BE2 - _02201BA0 - 2 ; case 5
	.short _02201BEC - _02201BA0 - 2 ; case 6
	.short _02201BF6 - _02201BA0 - 2 ; case 7
_02201BB0:
	ldr r0, [r0, #8]
	bl ov01_02201B2C
	strh r0, [r4]
	b _02201C04
_02201BBA:
	ldr r0, [r0, #0x70]
	bl ov01_02201B2C
	strh r0, [r4]
	b _02201C04
_02201BC4:
	ldr r0, [r0, #4]
	bl ov01_02201B2C
	strh r0, [r4]
	b _02201C04
_02201BCE:
	ldr r0, [r0, #0x14]
	bl ov01_02201B2C
	strh r0, [r4]
	b _02201C04
_02201BD8:
	ldr r0, [r0, #0x1c]
	bl ov01_02201B2C
	strh r0, [r4]
	b _02201C04
_02201BE2:
	ldr r0, [r0, #0x24]
	bl ov01_02201B2C
	strh r0, [r4]
	b _02201C04
_02201BEC:
	ldr r0, [r0, #0x2c]
	bl ov01_02201B2C
	strh r0, [r4]
	b _02201C04
_02201BF6:
	ldr r0, [r0, #0x30]
	bl ov01_02201B2C
	strh r0, [r4]
	b _02201C04
_02201C00:
	mov r0, #0
	strh r0, [r4]
_02201C04:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_724

	thumb_func_start ScrCmd_725
ScrCmd_725: ; 0x02201C08
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r6, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_Pokeathlon_get
	bl sub_020319F0
	cmp r6, #0
	ldr r1, [r0, #0x70]
	bne _02201C4A
	add r2, r1, r4
	ldr r1, _02201C5C ; =0x0000FFFF
	cmp r2, r1
	bls _02201C46
	str r1, [r0, #0x70]
	b _02201C56
_02201C46:
	str r2, [r0, #0x70]
	b _02201C56
_02201C4A:
	sub r1, r1, r4
	bpl _02201C54
	mov r1, #0
	str r1, [r0, #0x70]
	b _02201C56
_02201C54:
	str r1, [r0, #0x70]
_02201C56:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02201C5C: .word 0x0000FFFF
	thumb_func_end ScrCmd_725

	thumb_func_start ScrCmd_726
ScrCmd_726: ; 0x02201C60
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #1
	bl ov01_021E7F00
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_726

	thumb_func_start ScrCmd_735
ScrCmd_735: ; 0x02201C70
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_ApricornBox_get
	bl ApricornBox_GetKurtQuantity
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_735

	thumb_func_start ScrCmd_736
ScrCmd_736: ; 0x02201C9C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Save_ApricornBox_get
	mov r1, #0
	add r2, r1, #0
	bl ApricornBox_SetKurtApricorn
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_736

	thumb_func_start ScrCmd_737
ScrCmd_737: ; 0x02201CB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_ApricornBox_get
	bl ApricornBox_GetKurtBall
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_737

	thumb_func_start ScrCmd_738
ScrCmd_738: ; 0x02201CE0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r7, r0, #0
	ldr r0, [r4]
	mov r5, #0
	ldr r0, [r0, #0xc]
	bl Save_ApricornBox_get
	add r6, r0, #0
	add r4, r5, #0
_02201D06:
	add r0, r6, #0
	add r1, r4, #0
	bl ApricornBox_CountApricorn
	add r4, r4, #1
	add r5, r5, r0
	cmp r4, #7
	blt _02201D06
	strh r5, [r7]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_738

	thumb_func_start ScrCmd_739
ScrCmd_739: ; 0x02201D1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #2
	bl CreateApricornBoxWork
	str r0, [r4]
	ldr r1, _02201D48 ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02201D48: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_739

	thumb_func_start ScrCmd_740
ScrCmd_740: ; 0x02201D4C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r2, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r6, #0
	bl sub_0203ED80
	str r0, [r4]
	ldr r1, _02201DA0 ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_02201DA0: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_740

	thumb_func_start ScrCmd_741
ScrCmd_741: ; 0x02201DA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Save_ApricornBox_get
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	str r0, [sp, #8]
	add r0, sp, #0x20
	bl GF_RTC_CopyDate
	ldr r0, [sp, #0x10]
	add r2, sp, #0x18
	add r0, r0, #5
	strh r0, [r4]
	ldrh r1, [r4]
	ldr r0, [sp, #0xc]
	bl sub_02031CEC
	cmp r0, #0
	bne _02201E46
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x2c]
	lsl r0, r0, #1
	add r0, r1, r0
	mov r1, #5
	bl _s32_div_f
	strh r1, [r4]
	ldrh r1, [r4]
	ldr r0, [sp, #0xc]
	add r2, sp, #0x18
	bl sub_02031CEC
_02201E46:
	ldrh r1, [r4]
	ldr r0, [sp, #0xc]
	mov r2, #0x20
	bl sub_020322AC
	str r0, [sp, #0x14]
	ldr r0, _02201F08 ; =gGameVersion
	ldr r2, [sp, #0x14]
	ldrb r5, [r0]
	mov r0, #1
	str r0, [sp]
	str r5, [sp, #4]
	ldr r0, [r7]
	mov r1, #0
	mov r3, #2
	bl BufferString
	ldr r0, [sp, #0x14]
	bl FreeToHeap
	ldrh r1, [r4]
	ldr r0, [sp, #0xc]
	mov r2, #0x20
	bl sub_02032308
	mov r1, #1
	str r1, [sp]
	add r4, r0, #0
	str r5, [sp, #4]
	ldr r0, [r7]
	add r2, r4, #0
	mov r3, #2
	bl BufferString
	add r0, r4, #0
	bl FreeToHeap
	add r0, sp, #0x18
	bl sub_02031D80
	add r4, r0, #0
	add r0, sp, #0x18
	ldrh r0, [r0]
	mov r1, #0xa
	bl _s32_div_f
	lsl r1, r4, #1
	add r0, r0, r1
	strh r0, [r6]
	ldrh r1, [r6]
	cmp r1, #0x64
	bhs _02201EB4
	mov r0, #0x64
	strh r0, [r6]
	b _02201EBC
_02201EB4:
	ldr r0, _02201F0C ; =0x00001388
	cmp r1, r0
	bls _02201EBC
	strh r0, [r6]
_02201EBC:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldrh r2, [r6]
	ldr r0, [r7]
	mov r1, #2
	mov r3, #4
	bl BufferIntegerAsString
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #3
	ldr r0, [r7]
	add r2, r4, #0
	add r3, r1, #0
	bl BufferIntegerAsString
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r2, sp, #0x18
	ldrb r2, [r2, #2]
	ldr r0, [r7]
	mov r1, #4
	mov r3, #3
	bl BufferIntegerAsString
	add r0, sp, #0x18
	ldrh r1, [r0]
	ldr r0, [sp, #8]
	strh r1, [r0]
	mov r0, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02201F08: .word gGameVersion
_02201F0C: .word 0x00001388
	thumb_func_end ScrCmd_741

	thumb_func_start ScrCmd_743
ScrCmd_743: ; 0x02201F10
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, r0, #0
	ldr r0, [r4, #0x74]
	bl ov03_02258CFC
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_743

	thumb_func_start ScrCmd_744
ScrCmd_744: ; 0x02201F30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r0, #0x80
	ldr r7, [r0]
	ldr r0, [r7, #0xc]
	bl sub_02031B00
	ldr r5, _02201F90 ; =ov01_022093B4
	add r4, r0, #0
	mov r6, #0
_02201F44:
	add r1, r6, #0
	ldr r0, [r7, #0x3c]
	add r1, #0xf6
	bl GetMapObjectByID
	cmp r0, #0
	beq _02201F56
	bl DeleteMapObject
_02201F56:
	ldrh r2, [r4]
	cmp r2, #0
	beq _02201F80
	ldr r0, _02201F94 ; =0x000001ED
	cmp r2, r0
	bhi _02201F80
	ldrb r0, [r4, #2]
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	str r0, [sp]
	ldrb r0, [r5]
	str r0, [sp, #4]
	ldrb r0, [r5, #1]
	str r0, [sp, #8]
	ldr r0, [r7, #0x20]
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldrb r3, [r4, #3]
	ldr r0, [r7, #0x3c]
	bl ov01_02201F98
_02201F80:
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #2
	cmp r6, #3
	blt _02201F44
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02201F90: .word ov01_022093B4
_02201F94: .word 0x000001ED
	thumb_func_end ScrCmd_744

	thumb_func_start ov01_02201F98
ov01_02201F98: ; 0x02201F98
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r3, [sp, #0x18]
	add r6, r1, #0
	add r7, r2, #0
	add r4, r0, #0
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x30]
	add r0, r7, #0
	bl FollowingPokemon_GetSpriteID
	lsl r5, r0, #1
	add r0, r7, #0
	bl GetFollowPokeSizeParamBySpecies
	lsl r1, r0, #1
	add r0, r0, r1
	add r1, r6, r0
	ldr r0, _02202058 ; =0x0000019F
	ldr r2, [sp, #0x38]
	add r0, r1, r0
	str r0, [sp]
	mov r1, #0
	ldr r0, [sp, #0x3c]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [sp, #0x34]
	add r0, r4, #0
	mov r3, #1
	str r5, [sp, #0x14]
	bl CreateSpecialFieldObjectEx
	add r4, r0, #0
	bne _02201FE4
	bl GF_AssertFail
_02201FE4:
	add r6, #0xf6
	add r0, r4, #0
	add r1, r6, #0
	bl MapObject_SetID
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetType
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetFlagID
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetScript
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl MapObject_SetParam
	str r5, [sp]
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	lsl r2, r2, #0x18
	add r1, r7, #0
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02069F0C
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl MapObject_SetXRange
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl MapObject_SetYRange
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0x1e
	bl MapObject_SetBits
	add r0, r4, #0
	mov r1, #0
	bl MapObject_ClearBits
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F89C
	add r0, r4, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02202058: .word 0x0000019F
	thumb_func_end ov01_02201F98

	thumb_func_start ScrCmd_770
ScrCmd_770: ; 0x0220205C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	str r0, [sp]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	mov r1, #1
	add r7, r0, #0
	bl Pokedex_GetSeenFormeNum_Unown
	add r6, r0, #0
	cmp r6, #0x1a
	bge _02202094
	ldr r0, [sp]
	mov r1, #0
	strh r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02202094:
	mov r5, #0
	add r4, r5, #0
	cmp r6, #0
	ble _022020B6
_0220209C:
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #1
	bl Pokedex_GetSeenFormeByIdx_Unown
	cmp r0, #0x1a
	beq _022020B0
	cmp r0, #0x1b
	beq _022020B0
	add r5, r5, #1
_022020B0:
	add r4, r4, #1
	cmp r4, r6
	blt _0220209C
_022020B6:
	cmp r5, #0x1a
	bne _022020C0
	mov r1, #1
	ldr r0, [sp]
	b _022020C4
_022020C0:
	ldr r0, [sp]
	mov r1, #0
_022020C4:
	strh r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_770

	thumb_func_start ScrCmd_GiveTogepiEgg
ScrCmd_GiveTogepiEgg: ; 0x022020CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r0, #0x80
	ldr r7, [r0]
	ldr r0, [r7, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r4, r0, #0
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [sp, #8]
	bl GetPartyCount
	cmp r0, #6
	blt _022020F2
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022020F2:
	mov r0, #0xb
	bl AllocMonZeroed
	add r5, r0, #0
	bl ZeroMonData
	mov r0, #1
	mov r1, #0xd
	bl sub_02017FE4
	mov r1, #3
	str r1, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0xaf
	mov r2, #1
	add r3, r4, #0
	bl SetEggStats
	mov r4, #0
	add r6, r4, #0
_0220211C:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x36
	add r2, r6, #0
	bl GetMonData
	cmp r0, #0
	beq _02202132
	add r4, r4, #1
	cmp r4, #4
	blt _0220211C
_02202132:
	cmp r4, #4
	bne _02202138
	mov r4, #3
_02202138:
	ldr r1, _022021A8 ; =0x00000146
	add r0, sp, #0xc
	strh r1, [r0, #2]
	add r1, r4, #0
	add r2, sp, #0xc
	add r0, r5, #0
	add r1, #0x36
	add r2, #2
	bl SetMonData
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x42
	mov r2, #0
	bl GetMonData
	add r1, sp, #0xc
	strb r0, [r1]
	add r4, #0x3a
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0xc
	bl SetMonData
	ldr r0, [sp, #8]
	add r1, r5, #0
	bl AddMonToParty
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [r7, #0xc]
	bl Sav2_Misc_get
	mov r1, #0
	add r4, r0, #0
	add r0, r5, #0
	add r2, r1, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	lsl r2, r2, #0x18
	add r0, r4, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl sub_0202ABB0
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022021A8: .word 0x00000146
	thumb_func_end ScrCmd_GiveTogepiEgg

	thumb_func_start ScrCmd_777
ScrCmd_777: ; 0x022021AC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r5, #0x80
	ldr r1, [r5]
	ldr r1, [r1, #0xc]
	bl sub_0206D8D0
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_777

	thumb_func_start ScrCmd_GiveSpikyEarPichu
ScrCmd_GiveSpikyEarPichu: ; 0x022021F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp, #0x10]
	add r0, #0x80
	ldr r0, [r0]
	str r0, [sp, #0x18]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [sp, #0x1c]
	bl GetPartyCount
	cmp r0, #6
	blt _02202224
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02202224:
	mov r0, #0xb
	bl AllocMonZeroed
	add r5, r0, #0
	bl ZeroMonData
	ldr r0, [sp, #0x14]
	bl PlayerProfile_GetTrainerID
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #0xac
	mov r2, #4
	mov r3, #1
	add r4, r0, #0
	bl sub_02072490
	mov r1, #1
	str r1, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r5, #0
	mov r1, #SPECIES_PICHU
	mov r2, #30
	mov r3, #0x20
	str r4, [sp, #0xc]
	bl CreateMon
	add r2, sp, #0x20
	mov r1, #1
	add r0, sp, #0x20
	strb r1, [r0, #1]
	add r0, r5, #0
	mov r1, #0x70
	add r2, #1
	bl SetMonData
	ldr r6, _02202304 ; =sSpikyEarPichuMoveset
	mov r4, #0
	add r7, sp, #0x20
_02202276:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x36
	add r2, r6, #0
	bl SetMonData
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x42
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	strb r0, [r7]
	add r0, r5, #0
	add r1, #0x3a
	add r2, sp, #0x20
	bl SetMonData
	add r4, r4, #1
	add r6, r6, #2
	cmp r4, #4
	blt _02202276
	mov r1, #0x4b
	add r2, sp, #0x20
	lsl r1, r1, #2
	add r0, sp, #0x20
	strh r1, [r0, #2]
	add r0, r5, #0
	mov r1, #6
	add r2, #2
	bl SetMonData
	ldr r0, [sp, #0x10]
	add r0, #0x80
	str r0, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	add r1, r0, #0
	mov r0, #0
	bl sub_02017FE4
	add r3, r0, #0
	mov r0, #0x18
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	mov r2, #4
	bl sub_020720FC
	ldr r0, [sp, #0x1c]
	add r1, r5, #0
	bl AddMonToParty
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [sp, #0x18]
	add r1, r5, #0
	ldr r0, [r0, #0xc]
	bl UpdatePokedexWithReceivedSpecies
	mov r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02202304: .word sSpikyEarPichuMoveset
	thumb_func_end ScrCmd_GiveSpikyEarPichu

	thumb_func_start ScrCmd_PhotoAlbumIsFull
ScrCmd_PhotoAlbumIsFull: ; 0x02202308
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_PhotoAlbum_get
	bl PhotoAlbum_GetNumSaved
	cmp r0, #0x24
	blo _02202334
	mov r0, #1
	b _02202336
_02202334:
	mov r0, #0
_02202336:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_PhotoAlbumIsFull

	thumb_func_start ScrCmd_RadioMusicIsPlaying
ScrCmd_RadioMusicIsPlaying: ; 0x0220233C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	bl ov02_022522B4
	cmp r5, r0
	bne _02202370
	mov r0, #1
	b _02202372
_02202370:
	mov r0, #0
_02202372:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_RadioMusicIsPlaying

	thumb_func_start ov01_02202378
ov01_02202378: ; 0x02202378
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp]
	add r5, r2, #0
	bl Save_FriendGroup_get
	add r4, r0, #0
	cmp r5, #0
	beq _02202390
	mov r0, #0xe
	str r0, [sp, #4]
	b _02202394
_02202390:
	mov r0, #0x15
	str r0, [sp, #4]
_02202394:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	cmp r1, r0
	blo _022023A2
	add sp, #0x14
	mov r0, #3
	pop {r4, r5, r6, r7, pc}
_022023A2:
	bl GetLCRNGSeed
	str r0, [sp, #0xc]
	add r0, r4, #0
	bl sub_0202C7DC
	bl SetLCRNGSeed
	ldr r1, [sp, #4]
	mov r0, #0x20
	bl AllocFromHeapAtEnd
	ldr r2, [sp, #4]
	mov r1, #0
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	str r0, [sp, #8]
	ldr r1, _0220242C ; =ov01_022093D0
	lsl r0, r5, #3
	add r6, r1, r0
_022023CE:
	ldr r0, [sp, #8]
	mov r5, #0
	lsl r7, r0, #2
	ldr r0, [r6, r7]
	cmp r0, #0
	ble _02202408
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
_022023E4:
	bl LCRandom
	ldr r1, [sp, #4]
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r1, r0, #0x18
	ldrb r0, [r4, r1]
	cmp r0, #0
	bne _022023E4
	ldr r0, [sp, #0x10]
	strb r0, [r4, r1]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r0, [r6, r7]
	cmp r5, r0
	blt _022023E4
_02202408:
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	cmp r0, #2
	blo _022023CE
	ldr r0, [sp]
	ldrb r5, [r4, r0]
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [sp, #0xc]
	bl SetLCRNGSeed
	add r0, r5, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0220242C: .word ov01_022093D0
	thumb_func_end ov01_02202378

	thumb_func_start ScrCmd_CasinoGame
ScrCmd_CasinoGame: ; 0x02202430
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	add r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0]
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	add r0, #0x80
	ldrb r4, [r1]
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r6, #0
	ldr r0, [r0, #0xc]
	add r2, r4, #0
	bl ov01_02202378
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203FA38
	str r0, [r7]
	ldr r1, _0220247C ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0220247C: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_CasinoGame

	thumb_func_start ScrCmd_BufferPokeathlonCourseName
ScrCmd_BufferPokeathlonCourseName: ; 0x02202480
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	lsl r2, r6, #0x18
	ldr r0, [r0]
	add r1, r4, #0
	lsr r2, r2, #0x18
	bl BufferPokeathlonCourseName
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_BufferPokeathlonCourseName

	thumb_func_start ScrCmd_811
ScrCmd_811: ; 0x022024B8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SaveData_GetMomsSavingsAddr
	mov r1, #0
	add r2, r6, #0
	bl sub_0202F224
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_811

	thumb_func_start ScrCmd_812
ScrCmd_812: ; 0x022024FC
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SaveData_GetMomsSavingsAddr
	bl sub_0202F1F4
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_812

	thumb_func_start ScrCmd_GetBuenasPassword
ScrCmd_GetBuenasPassword: ; 0x02202510
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_GetBuenasPasswordSet
	mov r1, #0x1e
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r5, r0, #0x18
	add r0, r5, #0
	mov r1, #3
	bl _s32_div_f
	lsl r1, r0, #1
	add r0, r0, r1
	add r0, #msg_0066_D23R0102_00040
	strh r0, [r4]
	add r0, r5, #0
	mov r1, #3
	bl _s32_div_f
	strh r1, [r6]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_GetBuenasPassword

	thumb_func_start ov01_02202570
ov01_02202570: ; 0x02202570
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r6, r0, #0
	add r4, r5, #0
	add r7, r5, #0
_0220257A:
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0xb5
	add r2, r7, #0
	bl GetMonData
	add r4, r4, #1
	add r5, r5, r0
	cmp r4, #5
	blt _0220257A
	cmp r5, #5
	bne _022025A2
	add r0, r6, #0
	mov r1, #0xba
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _022025A2
	mov r5, #6
_022025A2:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_02202570

	thumb_func_start ScrCmd_825
ScrCmd_825: ; 0x022025A8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	bl ov01_02202570
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_825

	thumb_func_start ScrCmd_826
ScrCmd_826: ; 0x022025EC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	bl ov01_02202570
	cmp r0, #5
	bne _02202640
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0]
	add r0, r6, #0
	mov r1, #0xba
	add r2, sp, #0
	bl SetMonData
_02202640:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_826

	thumb_func_start ScrCmd_572
ScrCmd_572: ; 0x02202648
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_SealCase_get
	bl SealCase_CountUniqueSeals
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_572

	thumb_func_start ScrCmd_GetSealQuantity
ScrCmd_GetSealQuantity: ; 0x02202674
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_SealCase_get
	add r1, r6, #0
	bl SealCase_CountSealOccurrenceAnywhere
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_GetSealQuantity

	thumb_func_start ScrCmd_GiveOrTakeSeal
ScrCmd_GiveOrTakeSeal: ; 0x022026B4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_SealCase_get
	lsl r2, r4, #0x10
	add r1, r6, #0
	asr r2, r2, #0x10
	bl GiveOrTakeSeal
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GiveOrTakeSeal

	thumb_func_start ov01_022026F8
ov01_022026F8: ; 0x022026F8
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	ble _02202714
_02202700:
	ldrh r3, [r1]
	cmp r0, r3
	bne _0220270C
	mov r0, #1
	pop {r3, r4}
	bx lr
_0220270C:
	add r4, r4, #1
	add r1, r1, #2
	cmp r4, r2
	blt _02202700
_02202714:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_022026F8

	thumb_func_start ScrCmd_GiveRandomSeal
ScrCmd_GiveRandomSeal: ; 0x0220271C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	mov r1, #0
	add r4, r0, #0
	str r1, [sp, #0x18]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #0xc]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #8]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl Sav2_SealCase_get
	str r0, [sp, #0x10]
	mov r0, #0x20
	mov r1, #0x9a
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x9a
	str r0, [sp, #0x14]
	bl MI_CpuFill8
	add r0, sp, #0x24
	add r0, #2
	mov r1, #0
	mov r2, #3
	bl MI_CpuFill8
	ldr r5, [sp, #0x14]
	mov r4, #0
	mov r6, #0x63
_02202790:
	ldr r0, [sp, #0x10]
	add r1, r4, #1
	bl SealCase_CountSealOccurrenceAnywhere
	sub r1, r6, r0
	ldr r0, [sp, #0x18]
	add r4, r4, #1
	add r0, r0, r1
	strh r0, [r5]
	add r5, r5, #2
	str r0, [sp, #0x18]
	cmp r4, #0x4d
	blt _02202790
	cmp r0, #3
	ble _022027B4
	mov r0, #3
	str r0, [sp]
	b _022027B6
_022027B4:
	str r0, [sp]
_022027B6:
	ldr r0, [sp]
	mov r7, #0
	cmp r0, #0
	ble _02202812
	add r6, sp, #0x20
	add r5, sp, #0x24
	add r5, #2
	str r6, [sp, #0x1c]
_022027C6:
	bl LCRandom
	ldr r1, [sp, #0x18]
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r4, r0, #0x10
	ldr r1, [sp, #0x1c]
	add r0, r4, #0
	add r2, r7, #0
	bl ov01_022026F8
	cmp r0, #0
	bne _022027C6
	ldr r2, [sp, #0x14]
	strh r4, [r6]
	mov r1, #0
_022027E8:
	ldrh r0, [r2]
	cmp r4, r0
	bhs _022027FE
	add r0, r1, #1
	strb r0, [r5]
	ldrb r1, [r5]
	ldr r0, [sp, #0x10]
	mov r2, #1
	bl GiveOrTakeSeal
	b _02202806
_022027FE:
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, #0x4d
	blt _022027E8
_02202806:
	ldr r0, [sp]
	add r7, r7, #1
	add r6, r6, #2
	add r5, r5, #1
	cmp r7, r0
	blt _022027C6
_02202812:
	ldr r0, [sp, #0x14]
	bl FreeToHeap
	add r1, sp, #0x20
	ldrb r2, [r1, #6]
	ldr r0, [sp, #0xc]
	strh r2, [r0]
	ldrb r2, [r1, #7]
	ldr r0, [sp, #8]
	strh r2, [r0]
	ldrb r1, [r1, #8]
	ldr r0, [sp, #4]
	strh r1, [r0]
	mov r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GiveRandomSeal

	thumb_func_start ScrCmd_836
ScrCmd_836: ; 0x02202834
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	str r0, [sp]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [sp, #4]
	bl GetPartyCount
	str r0, [sp, #8]
	add r0, r5, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r0, #0
	ble _022028EC
_0220286A:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0xc]
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	add r0, r4, #0
	mov r1, #0x7a
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _022028E0
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _022028E0
	add r0, r4, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _022028E0
	ldr r0, _02202904 ; =0x0000017E
	cmp r7, r0
	beq _022028C6
	add r0, r0, #1
	cmp r7, r0
	beq _022028D4
	b _022028E0
_022028C6:
	cmp r6, #7
	bne _022028E0
	mov r0, #1
	orr r0, r5
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	b _022028E0
_022028D4:
	cmp r6, #8
	bne _022028E0
	mov r0, #2
	orr r0, r5
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_022028E0:
	ldr r0, [sp, #0xc]
	add r1, r0, #1
	ldr r0, [sp, #8]
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _0220286A
_022028EC:
	cmp r5, #3
	bne _022028F6
	mov r1, #1
	ldr r0, [sp]
	b _022028FA
_022028F6:
	ldr r0, [sp]
	mov r1, #0
_022028FA:
	strh r1, [r0]
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02202904: .word 0x0000017E
	thumb_func_end ScrCmd_836

	thumb_func_start ScrCmd_839
ScrCmd_839: ; 0x02202908
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	cmp r0, #0
	beq _02202926
	mov r0, #8
	bl Sys_SetSleepDisableFlag
	b _0220292C
_02202926:
	mov r0, #8
	bl Sys_ClearSleepDisableFlag
_0220292C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_839

	thumb_func_start ScrCmd_BugContestAction
ScrCmd_BugContestAction: ; 0x02202930
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r1, r0, #0
	ldr r5, [r5]
	cmp r4, #0
	bne _02202964
	add r0, r5, #0
	bl BugContest_new
	mov r1, #0x46
	lsl r1, r1, #2
	str r0, [r5, r1]
	b _0220297C
_02202964:
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl BugContest_delete
	mov r0, #0x46
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl sub_02093070
_0220297C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_BugContestAction

	thumb_func_start ScrCmd_BufferBugContestWinner
ScrCmd_BufferBugContestWinner: ; 0x02202980
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSys_BugContest_get
	ldr r3, [r5, #8]
	add r1, r3, #1
	str r1, [r5, #8]
	ldrb r3, [r3]
	ldr r1, [r5, #0x78]
	ldr r2, [r4]
	bl BugContest_BufferContestWinnerNames
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_BufferBugContestWinner

	thumb_func_start ScrCmd_JudgeBugContest
ScrCmd_JudgeBugContest: ; 0x022029B0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSys_BugContest_get
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl BugContest_Judge
	ldrb r0, [r5, #0x17]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1a
	strh r0, [r6]
	ldrh r0, [r5, #0x1a]
	strh r0, [r7]
	ldrb r0, [r5, #0x17]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _02202A16
	mov r0, #0
	b _02202A20
_02202A16:
	ldr r0, [r5, #0x10]
	mov r1, #5
	mov r2, #0
	bl GetMonData
_02202A20:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_JudgeBugContest

	thumb_func_start ScrCmd_BufferBugContestMonNick
ScrCmd_BufferBugContestMonNick: ; 0x02202A28
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSys_BugContest_get
	ldr r1, [r4, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r4, #8]
	add r0, r4, #0
	ldrb r5, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldr r1, [r6]
	add r0, r7, #0
	add r2, r5, #0
	bl BugContest_BufferCaughtMonNick
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_BufferBugContestMonNick

	thumb_func_start ScrCmd_BugContestGetTimeLeft
ScrCmd_BugContestGetTimeLeft: ; 0x02202A70
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	ldr r1, [r5, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r5, #0x80
	ldr r0, [r5]
	ldrb r6, [r1]
	mov r4, #1
	bl FieldSys_BugContest_get
	cmp r0, #0
	beq _02202AA2
	ldr r1, [r0, #0x1c]
	cmp r1, #0x14
	bhs _02202AA2
	mov r0, #0x14
	sub r4, r0, r1
_02202AA2:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r7]
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #2
	bl BufferIntegerAsString
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_BugContestGetTimeLeft

	thumb_func_start ScrCmd_IsBugContestantRegistered
ScrCmd_IsBugContestantRegistered: ; 0x02202ABC
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSys_BugContest_get
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	lsl r1, r5, #0x18
	add r4, r0, #0
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl BugContest_ContestantIsRegistered
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_IsBugContestantRegistered

	.rodata

ov01_022093B4: ; 0x022093B4
	.byte 0x04, 0x0A, 0x07, 0x05, 0x0A, 0x0A

sSpikyEarPichuMoveset: ; 0x022093BA
	.short MOVE_HELPING_HAND
	.short MOVE_VOLT_TACKLE
	.short MOVE_SWAGGER
	.short MOVE_PAIN_SPLIT

sStatJudgeBestStatMsgIdxs: ; 0x022093C2
	.short msg_0096_D31R0201_00122
	.short msg_0096_D31R0201_00123
	.short msg_0096_D31R0201_00124
	.short msg_0096_D31R0201_00127
	.short msg_0096_D31R0201_00125
	.short msg_0096_D31R0201_00126

	.balign 4, 0
ov01_022093D0:
	.word 7, 3
	.word 5, 2

	.data

	.balign 4, 0
ov01_02209AE0: ; 0x02209AE0
	.byte 0x5D, 0x00, 0x5E, 0x00, 0x5F, 0x00, 0x60, 0x00, 0x61, 0x00, 0x62, 0x00, 0x63, 0x00, 0x64, 0x00
	.byte 0x65, 0x00, 0x00, 0x00
