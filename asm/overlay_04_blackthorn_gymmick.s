#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "overlay_04.inc"
	.include "global.inc"

	.text

	.extern ov04_02255858
	.extern ov04_02255910
	.extern ov04_02255960

	thumb_func_start ov04_02255D34
ov04_02255D34: ; 0x02255D34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	bne _02255D48
	mov r1, #0xe
	ldr r3, _02255D78 ; =ov04_02257638
	ldr r4, _02255D7C ; =ov04_02257618
	b _02255D4E
_02255D48:
	ldr r3, _02255D80 ; =ov04_02257648
	ldr r4, _02255D84 ; =ov04_02257614
	mov r1, #0x18
_02255D4E:
	ldrb r0, [r5, #4]
	add r2, r5, #0
	add r2, #0xf8
	str r0, [sp]
	add r0, r7, #0
	bl ov04_02255960
	mov r2, #0x6e
	lsl r2, r2, #2
	add r6, r0, #0
	ldr r1, [sp]
	add r0, r7, #0
	add r2, r5, r2
	add r3, r4, #0
	bl ov04_02255960
	cmp r6, r0
	bhi _02255D74
	add r0, r6, #0
_02255D74:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02255D78: .word ov04_02257638
_02255D7C: .word ov04_02257618
_02255D80: .word ov04_02257648
_02255D84: .word ov04_02257614
	thumb_func_end ov04_02255D34

	thumb_func_start ov04_02255D88
ov04_02255D88: ; 0x02255D88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r4, r1, #0
	ldr r6, [r4, #0x70]
	add r7, r0, #0
	ldr r1, [r6, #4]
	ldr r5, [r1, #0x24]
	ldr r1, [r4]
	cmp r1, #6
	bhi _02255E5C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02255DA8: ; jump table
	.short _02255FB8 - _02255DA8 - 2 ; case 0
	.short _02255DB6 - _02255DA8 - 2 ; case 1
	.short _02255DEA - _02255DA8 - 2 ; case 2
	.short _02255FB8 - _02255DA8 - 2 ; case 3
	.short _02255EDE - _02255DA8 - 2 ; case 4
	.short _02255EEC - _02255DA8 - 2 ; case 5
	.short _02255F1C - _02255DA8 - 2 ; case 6
_02255DB6:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4f
	strb r1, [r0]
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r1, r5, r1
	ldrb r1, [r1, #9]
	add r0, r6, #0
	add r2, r4, #4
	bl ov04_02255910
	cmp r0, #0xff
	bne _02255DE2
	mov r0, #2
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255DE2:
	mov r0, #4
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255DEA:
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r0, r6, #0
	add r1, r5, r1
	add r0, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r0]
	bl MapPropManager_GetMapPropByIndex
	str r0, [sp]
	ldr r1, [sp]
	add r0, sp, #0x34
	bl MapProp_GetTranslation
	add r0, sp, #0x34
	add r1, r4, #0
	add r1, #0x58
	add r2, r0, #0
	bl VEC_Add
	ldr r0, [sp]
	add r1, sp, #0x34
	bl MapProp_SetTranslation
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0x28
	add r6, r0, #0
	bl MapObject_CopyPositionVector
	add r0, sp, #0x28
	add r1, r4, #0
	add r1, #0x58
	add r2, r0, #0
	bl VEC_Add
	add r0, r6, #0
	add r1, sp, #0x28
	bl MapObject_SetPositionVector
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #2
	bhs _02255E5E
_02255E5C:
	b _02255FB8
_02255E5E:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4c
	ldrb r1, [r0]
	mov r0, #0x27
	lsl r0, r0, #4
	mul r0, r1
	add r0, r5, r0
	ldrb r0, [r0, #9]
	add r1, r4, #0
	bl ov04_02255858
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r1, r0
	blo _02255ED6
	add r0, r6, #0
	add r1, sp, #0x1c
	bl MapObject_CopyPositionVector
	ldr r2, [sp, #0x1c]
	add r0, r6, #0
	asr r1, r2, #0xf
	lsr r1, r1, #0x10
	add r1, r2, r1
	asr r1, r1, #0x10
	bl MapObject_SetCurrentX
	ldr r2, [sp, #0x24]
	add r0, r6, #0
	asr r1, r2, #0xf
	lsr r1, r1, #0x10
	add r1, r2, r1
	asr r1, r1, #0x10
	bl MapObject_SetCurrentZ
	add r0, r6, #0
	bl sub_02060F78
	add r0, r7, #0
	bl SysTask_Destroy
	mov r0, #3
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255ED6:
	mov r0, #1
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255EDE:
	ldr r0, _02255FBC ; =SEQ_SE_GS_GONDORA_KABEHIT
	bl PlaySE
	mov r0, #5
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255EEC:
	add r1, r4, #0
	add r1, #0x4d
	ldrb r1, [r1]
	cmp r1, #0
	bne _02255F02
	bl SysTask_Destroy
	mov r0, #7
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255F02:
	ldr r1, [r4, #0x58]
	mov r0, #0
	mvn r0, r0
	add r2, r1, #0
	mul r2, r0
	str r2, [r4, #0x58]
	ldr r1, [r4, #0x60]
	add sp, #0x40
	mul r0, r1
	str r0, [r4, #0x60]
	mov r0, #6
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255F1C:
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r0, r6, #0
	add r1, r5, r1
	add r0, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r0]
	bl MapPropManager_GetMapPropByIndex
	add r5, r0, #0
	add r0, sp, #0x10
	add r1, r5, #0
	bl MapProp_GetTranslation
	add r0, sp, #0x10
	add r1, r4, #0
	add r1, #0x58
	add r2, r0, #0
	bl VEC_Add
	add r0, r5, #0
	add r1, sp, #0x10
	bl MapProp_SetTranslation
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #4
	add r5, r0, #0
	bl MapObject_CopyPositionVector
	add r0, sp, #4
	add r1, r4, #0
	add r1, #0x58
	add r2, r0, #0
	bl VEC_Add
	add r0, r5, #0
	add r1, sp, #4
	bl MapObject_SetPositionVector
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #2
	blo _02255FB8
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne _02255FB8
	add r0, r7, #0
	bl SysTask_Destroy
	mov r0, #7
	str r0, [r4]
_02255FB8:
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02255FBC: .word SEQ_SE_GS_GONDORA_KABEHIT
	thumb_func_end ov04_02255D88

    .rodata

	.global ov04_02257614
ov04_02257614: ; 0x02257614
	.byte 0x40, 0x14, 0x1E, 0x2E

	.global ov04_02257618
ov04_02257618: ; 0x02257618
	.byte 0x40, 0x40, 0x40, 0x40, 0x2A, 0x00, 0x00, 0x00

	.global ov04_02257620
ov04_02257620: ; 0x02257620
	.word 0x00000000
	.word 0x00030000
	.word 0x00000000

	.global ov04_0225762C
ov04_0225762C: ; 0x0225762C
	.word 0x00000078
	.word 0x00000079
	.word 0x00000078

	.global ov04_02257638
ov04_02257638: ; 0x02257638
	.byte 0x0A, 0x0A, 0x0D, 0x12, 0x19, 0x26, 0x33, 0x40
	.byte 0x40, 0x17, 0x1C, 0x23, 0x2D, 0x37, 0x00, 0x00

	.global ov04_02257648
ov04_02257648: ; 0x02257648
	.byte 0x08, 0x09, 0x0A, 0x0E, 0x13, 0x1A, 0x25, 0x33
	.byte 0x40, 0x11, 0x13, 0x17, 0x1C, 0x23, 0x2E, 0x37, 0x40, 0x40, 0x40, 0x1E, 0x23, 0x29, 0x31, 0x39
