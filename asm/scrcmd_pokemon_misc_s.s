#include "constants/sndseq.h"
#include "constants/moves.h"
#include "constants/std_script.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "constants/pokemon.h"
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
    
	.rodata

.public sFriendshipRoomStatuesPositions

sFriendshipRoomStatuesPositions: ; 0x022093B4
	.byte 0x04, 0x0A, 0x07, 0x05, 0x0A, 0x0A

.public sSpikyEarPichuMoveset

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

.public ov01_022093D0

	.balign 4, 0
ov01_022093D0:
	.word 7, 3
	.word 5, 2

	.data

	.balign 4, 0
ov01_02209AE0: ; 0x02209AE0
	.byte 0x5D, 0x00, 0x5E, 0x00, 0x5F, 0x00, 0x60, 0x00, 0x61, 0x00, 0x62, 0x00, 0x63, 0x00, 0x64, 0x00
	.byte 0x65, 0x00, 0x00, 0x00
