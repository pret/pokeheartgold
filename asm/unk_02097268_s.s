#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_02097268.inc"
	.include "global.inc"

	.text

	.extern sub_02097650

	thumb_func_start sub_02097694
sub_02097694: ; 0x02097694
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r2, #0
	mov r2, #0x7a
	mul r2, r1
	add r1, r0, r2
	str r1, [sp]
	ldrb r1, [r0, r2]
	add r1, r0, r1
	mov r0, #0xb7
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldr r0, [sp]
	mov r4, #0
	ldrb r0, [r0, #1]
	cmp r0, #0
	ble _0209771A
	ldr r5, [sp]
	add r7, sp, #8
_020976D0:
	ldrb r1, [r5, #2]
	add r0, sp, #8
	mov r2, #2
	bl sub_02097268
	ldrb r0, [r7, #2]
	cmp r0, #0
	beq _0209770E
	add r0, r6, r0
	add r0, r0, #4
	sub r0, r0, #1
	ldrb r1, [r0]
	add r1, r1, #1
	strb r1, [r0]
	ldrb r1, [r7, #2]
	ldr r0, [sp, #4]
	bl sub_02097650
	add r3, r0, #0
	ldrb r0, [r7, #2]
	add r0, r6, r0
	sub r0, r0, #1
	ldrb r1, [r0]
	add r2, r3, r1
	cmp r2, #0xff
	ble _0209770A
	mov r1, #0xff
	strb r1, [r0]
	b _0209770E
_0209770A:
	add r1, r1, r3
	strb r1, [r0]
_0209770E:
	ldr r0, [sp]
	add r4, r4, #1
	ldrb r0, [r0, #1]
	add r5, r5, #4
	cmp r4, r0
	blt _020976D0
_0209771A:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02097694

	.rodata
