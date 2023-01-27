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
	.include "overlay_01_021FAD1C.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021FAD1C
ov01_021FAD1C: ; 0x021FAD1C
	push {r3, r4, r5, r6}
	ldr r4, [r0]
	ldr r3, [r1]
	cmp r4, r3
	bgt _021FAD2C
	add r3, r0, #0
	add r4, r1, #0
	b _021FAD30
_021FAD2C:
	add r3, r1, #0
	add r4, r0, #0
_021FAD30:
	ldr r6, [r0, #4]
	ldr r5, [r1, #4]
	cmp r6, r5
	bgt _021FAD3E
	add r5, r0, #4
	add r0, r1, #4
	b _021FAD42
_021FAD3E:
	add r5, r1, #4
	add r0, r0, #4
_021FAD42:
	ldr r6, [r2]
	ldr r1, [r3]
	cmp r1, r6
	bgt _021FAD64
	ldr r1, [r4]
	cmp r6, r1
	bgt _021FAD64
	ldr r2, [r2, #4]
	ldr r1, [r5]
	cmp r1, r2
	bgt _021FAD64
	ldr r0, [r0]
	cmp r2, r0
	bgt _021FAD64
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_021FAD64:
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FAD1C

	thumb_func_start ov01_021FAD6C
ov01_021FAD6C: ; 0x021FAD6C
	push {r4, r5}
	lsl r3, r1, #3
	ldr r1, [r0]
	ldr r5, [r0, #0x10]
	ldrh r1, [r1, r3]
	lsl r4, r1, #3
	add r1, r5, r4
	ldr r4, [r5, r4]
	ldr r1, [r1, #4]
	str r4, [r2]
	str r1, [r2, #4]
	ldr r1, [r0, #0x10]
	ldr r0, [r0]
	add r0, r0, r3
	ldrh r0, [r0, #2]
	lsl r3, r0, #3
	add r0, r1, r3
	ldr r1, [r1, r3]
	ldr r0, [r0, #4]
	str r1, [r2, #8]
	str r0, [r2, #0xc]
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FAD6C

	thumb_func_start ov01_021FAD9C
ov01_021FAD9C: ; 0x021FAD9C
	push {r3, r4}
	ldr r4, [r0]
	ldr r3, [r0, #0x14]
	lsl r0, r1, #3
	add r0, r4, r0
	ldrh r1, [r0, #4]
	mov r0, #0xc
	mul r0, r1
	add r3, r3, r0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FAD9C

	thumb_func_start ov01_021FADBC
ov01_021FADBC: ; 0x021FADBC
	push {r3, r4}
	ldr r4, [r0]
	ldr r3, [r0, #4]
	lsl r0, r1, #3
	add r0, r4, r0
	ldrh r0, [r0, #6]
	lsl r0, r0, #2
	ldr r0, [r3, r0]
	str r0, [r2]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FADBC

	thumb_func_start ov01_021FADD4
ov01_021FADD4: ; 0x021FADD4
	mov r3, #0
	add r2, r3, #0
	sub r1, r3, #1
_021FADDA:
	str r2, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	add r3, r3, #1
	add r0, #0xc
	cmp r3, #0xa
	blt _021FADDA
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FADD4

	thumb_func_start ov01_021FADEC
ov01_021FADEC: ; 0x021FADEC
	push {r3, r4, r5, r6}
	cmp r1, #0
	bne _021FADF8
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
_021FADF8:
	cmp r1, #1
	bne _021FAE06
	mov r0, #0
	strh r0, [r3]
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_021FAE06:
	sub r1, r1, #1
	lsr r5, r1, #0x1f
	add r5, r1, r5
	mov r4, #0
	asr r5, r5, #1
_021FAE10:
	lsl r6, r5, #3
	ldr r6, [r0, r6]
	cmp r6, r2
	ble _021FAE32
	sub r1, r1, #1
	cmp r1, r4
	ble _021FAE2A
	add r6, r4, r5
	add r1, r5, #0
	lsr r5, r6, #0x1f
	add r5, r6, r5
	asr r5, r5, #1
	b _021FAE10
_021FAE2A:
	strh r5, [r3]
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_021FAE32:
	add r4, r4, #1
	cmp r4, r1
	bge _021FAE44
	add r6, r5, r1
	add r4, r5, #0
	lsr r5, r6, #0x1f
	add r5, r6, r5
	asr r5, r5, #1
	b _021FAE10
_021FAE44:
	add r0, r5, #1
	strh r0, [r3]
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FADEC

	thumb_func_start ov01_021FAE50
ov01_021FAE50: ; 0x021FAE50
	push {r4, r5, r6, r7, lr}
	sub sp, #0xcc
	str r0, [sp]
	ldr r0, [sp, #0xe4]
	ldr r5, [sp, #0xe0]
	str r0, [sp, #0xe4]
	ldr r0, [r5, #0x18]
	str r1, [sp, #4]
	cmp r0, #0
	bne _021FAE6A
	add sp, #0xcc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021FAE6A:
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x54
	mov r4, #0
	bl ov01_021FADD4
	ldr r1, [r5, #0x1c]
	ldr r6, [r5, #8]
	lsl r1, r1, #0x10
	ldr r2, [sp, #0x34]
	add r0, r6, #0
	lsr r1, r1, #0x10
	add r3, sp, #0x28
	bl ov01_021FADEC
	cmp r0, #0
	bne _021FAE92
	add sp, #0xcc
	add r0, r4, #0
	pop {r4, r5, r6, r7, pc}
_021FAE92:
	add r0, sp, #0x28
	ldrh r0, [r0]
	lsl r0, r0, #3
	add r1, r6, r0
	ldrh r0, [r1, #4]
	str r0, [sp, #0x14]
	ldrh r1, [r1, #6]
	add r0, r4, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bls _021FAF58
	lsl r0, r1, #1
	add r7, sp, #0x54
	str r0, [sp, #0x10]
_021FAEB0:
	ldr r0, [sp, #0x18]
	ldr r2, [r5, #0xc]
	lsl r1, r0, #1
	ldr r0, [sp, #0x10]
	add r0, r0, r2
	ldrh r6, [r1, r0]
	add r0, r5, #0
	add r2, sp, #0x44
	add r1, r6, #0
	bl ov01_021FAD6C
	add r0, sp, #0x44
	add r1, sp, #0x4c
	add r2, sp, #0x30
	bl ov01_021FAD1C
	cmp r0, #1
	bne _021FAF48
	add r0, r5, #0
	add r1, r6, #0
	add r2, sp, #0x38
	bl ov01_021FAD9C
	add r0, r5, #0
	add r1, r6, #0
	add r2, sp, #0x2c
	bl ov01_021FADBC
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x30]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	str r0, [sp, #0x1c]
	ldr r2, [sp, #0x34]
	ldr r0, [sp, #0x40]
	str r1, [sp, #0xc]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r6, r0, #0
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x1c]
	mov ip, r0
	mov r0, #2
	lsl r0, r0, #0xa
	add r0, r2, r0
	ldr r3, [sp, #0xc]
	ldr r2, _021FB048 ; =0x00000000
	adc r3, r2
	lsl r2, r3, #0x14
	lsr r0, r0, #0xc
	orr r0, r2
	mov r2, #2
	lsl r2, r2, #0xa
	str r3, [sp, #0xc]
	add r3, r6, r2
	ldr r2, _021FB048 ; =0x00000000
	adc r1, r2
	lsl r1, r1, #0x14
	lsr r2, r3, #0xc
	orr r2, r1
	add r1, r0, r2
	mov r0, ip
	add r0, r0, r1
	ldr r1, [sp, #0x3c]
	neg r0, r0
	bl FX_Div
	str r0, [r7]
	add r4, r4, #1
	add r7, #0xc
	cmp r4, #0xa
	bge _021FAF58
_021FAF48:
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	str r1, [sp, #0x18]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	blo _021FAEB0
_021FAF58:
	cmp r4, #1
	ble _021FB022
	ldr r0, [sp]
	mov r6, #0
	cmp r0, #0
	beq _021FAFBE
	cmp r0, #1
	beq _021FAF6E
	cmp r0, #2
	beq _021FAF96
	b _021FAFBE
_021FAF6E:
	mov r1, #0xff
	lsl r1, r1, #0x18
	add r2, r6, #0
	cmp r4, #0
	ble _021FB00E
	add r0, sp, #0x54
	mov r3, #0xc
_021FAF7C:
	add r5, r2, #0
	mul r5, r3
	ldr r5, [r0, r5]
	cmp r1, r5
	bge _021FAF8A
	add r1, r5, #0
	add r6, r2, #0
_021FAF8A:
	add r2, r2, #1
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	cmp r2, r4
	blt _021FAF7C
	b _021FB00E
_021FAF96:
	mov r2, #1
	lsl r2, r2, #0x18
	add r1, r6, #0
	cmp r4, #0
	ble _021FB00E
	add r0, sp, #0x54
	mov r3, #0xc
_021FAFA4:
	add r5, r1, #0
	mul r5, r3
	ldr r5, [r0, r5]
	cmp r2, r5
	ble _021FAFB2
	add r2, r5, #0
	add r6, r1, #0
_021FAFB2:
	add r1, r1, #1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	cmp r1, r4
	blt _021FAFA4
	b _021FB00E
_021FAFBE:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x54]
	bl sub_02020B94
	add r5, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x54]
	bl sub_02020B8C
	sub r7, r5, r0
	mov r5, #1
	cmp r4, #1
	ble _021FB00E
_021FAFD8:
	mov r0, #0xc
	mul r0, r5
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x20]
	add r2, sp, #0x54
	ldr r0, [sp, #4]
	ldr r1, [r2, r1]
	bl sub_02020B94
	str r0, [sp, #0x24]
	ldr r1, [sp, #0x20]
	add r2, sp, #0x54
	ldr r0, [sp, #4]
	ldr r1, [r2, r1]
	bl sub_02020B8C
	ldr r1, [sp, #0x24]
	sub r0, r1, r0
	cmp r7, r0
	ble _021FB004
	add r7, r0, #0
	add r6, r5, #0
_021FB004:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, r4
	blt _021FAFD8
_021FB00E:
	mov r0, #0xc
	add r1, r6, #0
	mul r1, r0
	add r0, sp, #0x54
	ldr r1, [r0, r1]
	ldr r0, [sp, #0xe4]
	add sp, #0xcc
	str r1, [r0]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021FB022:
	bne _021FB030
	ldr r1, [sp, #0x54]
	ldr r0, [sp, #0xe4]
	add sp, #0xcc
	str r1, [r0]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021FB030:
	cmp r4, #0
	beq _021FB040
	ldr r1, [sp, #0x54]
	ldr r0, [sp, #0xe4]
	add sp, #0xcc
	str r1, [r0]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021FB040:
	mov r0, #0
	add sp, #0xcc
	pop {r4, r5, r6, r7, pc}
	nop
_021FB048: .word 0x00000000
	thumb_func_end ov01_021FAE50
