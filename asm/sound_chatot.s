#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ChatotSoundMain
ChatotSoundMain: ; 0x02006C8C
	push {r4, lr}
	mov r0, #0x10
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	mov r0, #0x1e
	bl GF_SdatGetAttrPtr
	ldrb r0, [r0]
	cmp r0, #1
	bne _02006CC2
	ldrb r0, [r4]
	cmp r0, #1
	bne _02006CBA
	mov r0, #0xe
	bl sub_02005738
	cmp r0, #0
	bne _02006CC2
	bl sub_02006DB8
	mov r0, #1
	pop {r4, pc}
_02006CBA:
	bl sub_02006DB8
	mov r0, #1
	pop {r4, pc}
_02006CC2:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ChatotSoundMain

	thumb_func_start Chatot_checkCry
Chatot_checkCry: ; 0x02006CC8
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0x1f
	bl GF_SdatGetAttrPtr
	add r5, r0, #0
	mov r0, #0x36
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	add r0, r6, #0
	bl Chatot_exists
	cmp r0, #0
	bne _02006CEA
	mov r0, #0
	pop {r4, r5, r6, pc}
_02006CEA:
	ldrb r0, [r4]
	cmp r0, #1
	bne _02006CF4
	mov r0, #0
	pop {r4, r5, r6, pc}
_02006CF4:
	ldrb r0, [r5]
	cmp r0, #1
	beq _02006CFE
	mov r0, #1
	pop {r4, r5, r6, pc}
_02006CFE:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end Chatot_checkCry

	thumb_func_start sub_02006D04
sub_02006D04: ; 0x02006D04
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r6, r0, #0
	add r5, r2, #0
	add r7, r3, #0
	bl sub_020059D8
	str r0, [sp]
	mov r0, #0x1e
	bl GF_SdatGetAttrPtr
	str r0, [sp, #4]
	add r0, r6, #0
	bl Chatot_checkCry
	cmp r0, #0
	bne _02006D2C
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02006D2C:
	mov r0, #0
	bl sub_02006300
	bl sub_02006DB8
	mov r0, #0xe
	bl sub_02005600
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x13
	sub r1, r1, r2
	mov r0, #0x13
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r6, #0
	bl Chatot_GetData
	add r1, r0, #0
	ldr r0, [sp]
	bl Chatot_Decode
	mov r0, #0xe
	bl sub_020055AC
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	bl sub_020059D8
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	mov r0, #0x7d
	lsl r0, r0, #4
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	mov r0, #2
	lsl r0, r0, #0xe
	add r0, r4, r0
	str r0, [sp, #0x28]
	lsr r0, r7, #0x1f
	add r0, r7, r0
	asr r0, r0, #1
	add r0, #0x40
	str r0, [sp, #0x2c]
	add r0, sp, #8
	mov r1, #0xe
	str r5, [sp, #0x24]
	bl sub_020056E8
	add r4, r0, #0
	mov r0, #0xe
	add r1, r5, #0
	bl sub_02005774
	ldr r0, [sp, #4]
	mov r1, #1
	strb r1, [r0]
	mov r0, #0
	bl sub_02006E3C
	add r0, r4, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02006D04

	thumb_func_start sub_02006DB8
sub_02006DB8: ; 0x02006DB8
	push {r3, r4, r5, lr}
	mov r0, #0x10
	bl GF_SdatGetAttrPtr
	add r5, r0, #0
	mov r0, #0x1e
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	ldrb r0, [r5]
	cmp r0, #1
	bne _02006DDC
	mov r0, #0xe
	bl sub_020058B8
	mov r0, #0xe
	bl sub_02005680
_02006DDC:
	mov r0, #0
	strb r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02006DB8

	thumb_func_start Chatot_startRecording
Chatot_startRecording: ; 0x02006DE4
	push {lr}
	sub sp, #0x1c
	mov r0, #2
	str r0, [sp]
	bl sub_020059D8
	mov r1, #0x7d
	str r0, [sp, #4]
	lsl r1, r1, #4
	mov r0, #0x1f
	str r1, [sp, #8]
	tst r0, r1
	beq _02006E04
	mov r0, #0x1f
	bic r1, r0
	str r1, [sp, #8]
_02006E04:
	ldr r0, _02006E1C ; =0x00004174
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	add r0, sp, #0
	bl GF_MIC_StartAutoSampling
	add sp, #0x1c
	pop {pc}
	nop
_02006E1C: .word 0x00004174
	thumb_func_end Chatot_startRecording

	thumb_func_start Chatot_stopRecording
Chatot_stopRecording: ; 0x02006E20
	ldr r3, _02006E24 ; =GF_MIC_StopAutoSampling
	bx r3
	.balign 4, 0
_02006E24: .word GF_MIC_StopAutoSampling
	thumb_func_end Chatot_stopRecording

	thumb_func_start Chatot_saveRecording
Chatot_saveRecording: ; 0x02006E28
	push {r4, lr}
	add r4, r0, #0
	bl sub_020059D8
	add r1, r0, #0
	add r0, r4, #0
	bl Chatot_Encode
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end Chatot_saveRecording

	thumb_func_start sub_02006E3C
sub_02006E3C: ; 0x02006E3C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1f
	bl GF_SdatGetAttrPtr
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02006E3C

	thumb_func_start sub_02006E4C
sub_02006E4C: ; 0x02006E4C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x24
	add r7, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl GF_SdatGetAttrPtr ; ->myChatot
	cmp r5, #0
	bne _02006E70
	ldr r0, [r0]
	add r1, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_02006D04
	b _02006E7C
_02006E70:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_02006D04
_02006E7C:
	cmp r0, #0
	bne _02006E98
	mov r0, #1
	bl sub_02006E3C
	mov r0, #0xb
	str r0, [sp]
	mov r0, #0
	ldr r1, _02006E9C ; =SPECIES_CHATOT
	add r2, r6, #0
	add r3, r4, #0
	str r0, [sp, #4]
	bl PlayCryEx
_02006E98:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02006E9C: .word SPECIES_CHATOT
	thumb_func_end sub_02006E4C

	thumb_func_start sub_02006EA0
sub_02006EA0: ; 0x02006EA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x24
	add r7, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl GF_SdatGetAttrPtr
	cmp r5, #0
	bne _02006EC4
	ldr r0, [r0]
	add r1, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_02006D04
	b _02006ED0
_02006EC4:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_02006D04
_02006ED0:
	cmp r0, #0
	bne _02006EF4
	mov r0, #1
	bl sub_02006E3C
	mov r0, #0xb
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	ldr r1, _02006EF8 ; =0x000001B9
	add r2, r6, #0
	str r0, [sp, #4]
	mov r0, #0
	add r3, r4, #0
	str r0, [sp, #8]
	bl sub_02006920
	mov r0, #1
_02006EF4:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02006EF8: .word 0x000001B9
	thumb_func_end sub_02006EA0

	thumb_func_start sub_02006EFC
sub_02006EFC: ; 0x02006EFC
	push {r4, lr}
	add r4, r0, #0
	bl Chatot_exists
	cmp r0, #0
	bne _02006F0C
	mov r0, #0
	pop {r4, pc}
_02006F0C:
	add r0, r4, #0
	bl Chatot_GetData
	mov r1, #0xf
	ldrsb r0, [r0, r1]
	sub r1, #0x2d
	cmp r0, r1
	bge _02006F20
	mov r0, #1
	pop {r4, pc}
_02006F20:
	cmp r0, #0x1e
	blt _02006F2C
	cmp r0, #0x80
	bge _02006F2C
	mov r0, #2
	pop {r4, pc}
_02006F2C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02006EFC

	thumb_func_start sub_02006F30
sub_02006F30: ; 0x02006F30
	cmp r0, #0xb
	bgt _02006F4A
	bge _02006F4E
	cmp r0, #5
	bgt _02006F52
	cmp r0, #0
	blt _02006F52
	beq _02006F4E
	cmp r0, #1
	beq _02006F4E
	cmp r0, #5
	beq _02006F4E
	b _02006F52
_02006F4A:
	cmp r0, #0xc
	bne _02006F52
_02006F4E:
	mov r0, #1
	bx lr
_02006F52:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02006F30
