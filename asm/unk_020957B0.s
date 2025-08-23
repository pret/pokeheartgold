#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_020957B0.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020957B0
sub_020957B0: ; 0x020957B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, sp, #0x10
	mov r4, #0x10
	ldrsb r4, [r5, r4]
	add r7, r0, #0
	add r6, r1, #0
	str r4, [sp]
	bl sub_02095BF0
	str r0, [sp, #4]
	cmp r0, #4
	bhi _02095834
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020957D6: ; jump table
	.short _02095834 - _020957D6 - 2 ; case 0
	.short _020957E0 - _020957D6 - 2 ; case 1
	.short _020957F6 - _020957D6 - 2 ; case 2
	.short _0209580C - _020957D6 - 2 ; case 3
	.short _02095822 - _020957D6 - 2 ; case 4
_020957E0:
	mov r0, #1
	ldrsb r1, [r6, r0]
	add r0, sp, #4
	add r2, sp, #4
	strb r1, [r0, #4]
	add r0, r7, #0
	mov r1, #3
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_020957F6:
	mov r0, #1
	ldrsb r1, [r6, r0]
	add r0, sp, #4
	add r2, sp, #4
	strb r1, [r0, #4]
	add r0, r7, #0
	mov r1, #3
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0209580C:
	mov r0, #0
	ldrsb r1, [r6, r0]
	add r0, sp, #4
	add r2, sp, #4
	strb r1, [r0, #4]
	add r0, r7, #0
	mov r1, #5
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095822:
	mov r0, #0
	ldrsb r1, [r6, r0]
	add r0, sp, #4
	add r2, sp, #4
	strb r1, [r0, #4]
	add r0, r7, #0
	mov r1, #5
	bl sub_02095CB8
_02095834:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_020957B0

	thumb_func_start sub_02095838
sub_02095838: ; 0x02095838
	push {r3, r4}
	ldr r0, [r3]
	cmp r0, #4
	bhi _020958BA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0209584C: ; jump table
	.short _020958BA - _0209584C - 2 ; case 0
	.short _0209588C - _0209584C - 2 ; case 1
	.short _020958A8 - _0209584C - 2 ; case 2
	.short _02095870 - _0209584C - 2 ; case 3
	.short _02095856 - _0209584C - 2 ; case 4
_02095856:
	mov r0, #2
	strb r0, [r1]
	mov r0, #0
	strb r0, [r1, #1]
	ldrsb r4, [r1, r0]
	mov r0, #1
	ldrsb r3, [r1, r0]
	ldrb r0, [r2]
	mul r0, r3
	add r0, r4, r0
	strb r0, [r1, #2]
	pop {r3, r4}
	bx lr
_02095870:
	mov r0, #2
	strb r0, [r1]
	mov r0, #4
	strb r0, [r1, #1]
	mov r0, #0
	ldrsb r4, [r1, r0]
	mov r0, #1
	ldrsb r3, [r1, r0]
	ldrb r0, [r2]
	mul r0, r3
	add r0, r4, r0
	strb r0, [r1, #2]
	pop {r3, r4}
	bx lr
_0209588C:
	mov r0, #5
	strb r0, [r1]
	ldrb r0, [r3, #4]
	strb r0, [r1, #1]
	mov r0, #0
	ldrsb r4, [r1, r0]
	mov r0, #1
	ldrsb r3, [r1, r0]
	ldrb r0, [r2]
	mul r0, r3
	add r0, r4, r0
	strb r0, [r1, #2]
	pop {r3, r4}
	bx lr
_020958A8:
	mov r0, #0
	strb r0, [r1]
	ldrb r0, [r3, #4]
	strb r0, [r1, #1]
	mov r0, #1
	ldrsb r3, [r1, r0]
	ldrb r0, [r2]
	mul r0, r3
	strb r0, [r1, #2]
_020958BA:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02095838

	thumb_func_start sub_020958C0
sub_020958C0: ; 0x020958C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, sp, #0x10
	mov r5, #0x10
	ldrsb r5, [r6, r5]
	add r4, r0, #0
	add r7, r1, #0
	str r5, [sp]
	bl sub_02095BF0
	mov r2, #0
	str r0, [sp, #4]
	ldrsb r3, [r7, r2]
	add r1, sp, #4
	cmp r0, #1
	strb r3, [r1, #4]
	beq _020958F6
	cmp r0, #3
	bne _0209591C
	strb r2, [r1, #4]
	add r0, r4, #0
	mov r1, #3
	add r2, sp, #4
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_020958F6:
	ldr r0, [r4, #4]
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _0209590E
	strb r2, [r1, #4]
	add r0, r4, #0
	mov r1, #6
	add r2, sp, #4
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0209590E:
	mov r0, #4
	strb r0, [r1, #4]
	add r0, r4, #0
	mov r1, #2
	add r2, sp, #4
	bl sub_02095CB8
_0209591C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_020958C0

	thumb_func_start sub_02095920
sub_02095920: ; 0x02095920
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02095920

	thumb_func_start sub_0209592C
sub_0209592C: ; 0x0209592C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, sp, #0x10
	mov r5, #0x10
	ldrsb r5, [r6, r5]
	add r4, r0, #0
	add r7, r1, #0
	str r5, [sp]
	bl sub_02095BF0
	str r0, [sp, #4]
	mov r1, #1
	ldrsb r1, [r7, r1]
	cmp r1, #0
	bne _02095952
	mov r2, #0
	add r1, sp, #4
	strb r2, [r1, #4]
	b _02095962
_02095952:
	cmp r1, #1
	add r1, sp, #4
	bne _0209595E
	mov r2, #2
	strb r2, [r1, #4]
	b _02095962
_0209595E:
	mov r2, #3
	strb r2, [r1, #4]
_02095962:
	cmp r0, #1
	beq _02095972
	cmp r0, #2
	beq _0209599A
	cmp r0, #4
	beq _020959C2
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095972:
	ldr r0, [r4, #4]
	add r2, sp, #4
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _0209598E
	mov r1, #0
	add r0, sp, #4
	strb r1, [r0, #4]
	add r0, r4, #0
	mov r1, #6
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0209598E:
	add r0, r4, #0
	mov r1, #2
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0209599A:
	ldr r0, [r4, #4]
	add r2, sp, #4
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _020959B6
	mov r1, #0
	add r0, sp, #4
	strb r1, [r0, #4]
	add r0, r4, #0
	mov r1, #6
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_020959B6:
	add r0, r4, #0
	mov r1, #2
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_020959C2:
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _020959D2
	add r0, r4, #0
	mov r1, #1
	add r2, sp, #4
	bl sub_02095CB8
_020959D2:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0209592C

	thumb_func_start sub_020959D8
sub_020959D8: ; 0x020959D8
	push {r4, r5, r6, lr}
	ldr r0, [r3]
	add r5, r1, #0
	add r4, r2, #0
	cmp r0, #1
	beq _02095A12
	cmp r0, #2
	beq _02095A12
	cmp r0, #3
	bne _02095A32
	ldrb r6, [r4]
	ldrb r0, [r4, #2]
	add r1, r6, #0
	sub r0, r0, #1
	bl _s32_div_f
	mul r0, r6
	strb r0, [r5, #2]
	ldrb r0, [r5, #2]
	ldrb r1, [r4]
	bl _s32_div_f
	strb r1, [r5]
	ldrb r0, [r5, #2]
	ldrb r1, [r4]
	bl _s32_div_f
	strb r0, [r5, #1]
	pop {r4, r5, r6, pc}
_02095A12:
	ldrb r0, [r3, #4]
	cmp r0, #2
	bhs _02095A1E
	mov r0, #0
	strb r0, [r5, #2]
	b _02095A2A
_02095A1E:
	bls _02095A26
	mov r0, #2
	strb r0, [r5, #2]
	b _02095A2A
_02095A26:
	mov r0, #1
	strb r0, [r5, #2]
_02095A2A:
	mov r0, #0
	strb r0, [r5]
	ldrb r0, [r5, #2]
	strb r0, [r5, #1]
_02095A32:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020959D8

	thumb_func_start sub_02095A34
sub_02095A34: ; 0x02095A34
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, sp, #0x10
	mov r5, #0x10
	ldrsb r5, [r6, r5]
	add r4, r0, #0
	str r5, [sp]
	bl sub_02095BF0
	mov r2, #0
	str r0, [sp, #4]
	add r1, sp, #4
	strb r2, [r1, #4]
	cmp r0, #3
	beq _02095A5A
	cmp r0, #4
	beq _02095A68
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02095A5A:
	add r0, r4, #0
	mov r1, #4
	add r2, sp, #4
	bl sub_02095CB8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02095A68:
	add r0, r4, #0
	mov r1, #4
	add r2, sp, #4
	bl sub_02095CB8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02095A34

	thumb_func_start sub_02095A78
sub_02095A78: ; 0x02095A78
	bx lr
	.balign 4, 0
	thumb_func_end sub_02095A78

	thumb_func_start sub_02095A7C
sub_02095A7C: ; 0x02095A7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, sp, #0x10
	mov r4, #0x10
	ldrsb r4, [r5, r4]
	add r6, r0, #0
	add r7, r1, #0
	str r4, [sp]
	bl sub_02095BF0
	mov r1, #0
	str r0, [sp, #4]
	ldrsb r2, [r7, r1]
	add r1, sp, #4
	cmp r0, #4
	strb r2, [r1, #4]
	bhi _02095AF4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02095AAA: ; jump table
	.short _02095AF4 - _02095AAA - 2 ; case 0
	.short _02095AF4 - _02095AAA - 2 ; case 1
	.short _02095AF4 - _02095AAA - 2 ; case 2
	.short _02095AB4 - _02095AAA - 2 ; case 3
	.short _02095AD6 - _02095AAA - 2 ; case 4
_02095AB4:
	ldr r0, [r6, #4]
	add r2, sp, #4
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _02095ACA
	add r0, r6, #0
	mov r1, #6
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095ACA:
	add r0, r6, #0
	mov r1, #2
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095AD6:
	ldr r0, [r6, #4]
	add r2, sp, #4
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _02095AEC
	add r0, r6, #0
	mov r1, #6
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095AEC:
	add r0, r6, #0
	mov r1, #2
	bl sub_02095CB8
_02095AF4:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02095A7C

	thumb_func_start sub_02095AF8
sub_02095AF8: ; 0x02095AF8
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02095AF8

	thumb_func_start sub_02095B04
sub_02095B04: ; 0x02095B04
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, sp, #0x10
	mov r4, #0x10
	ldrsb r4, [r5, r4]
	add r7, r0, #0
	add r6, r1, #0
	str r4, [sp]
	bl sub_02095BF0
	mov r1, #0
	str r0, [sp, #4]
	ldrsb r3, [r6, r1]
	add r2, sp, #4
	cmp r0, #4
	strb r3, [r2, #4]
	bhi _02095B84
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02095B32: ; jump table
	.short _02095B84 - _02095B32 - 2 ; case 0
	.short _02095B3C - _02095B32 - 2 ; case 1
	.short _02095B50 - _02095B32 - 2 ; case 2
	.short _02095B64 - _02095B32 - 2 ; case 3
	.short _02095B76 - _02095B32 - 2 ; case 4
_02095B3C:
	mov r0, #1
	ldrsb r0, [r6, r0]
	mov r1, #3
	strb r0, [r2, #4]
	add r0, r7, #0
	add r2, sp, #4
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095B50:
	mov r0, #1
	ldrsb r0, [r6, r0]
	mov r1, #3
	strb r0, [r2, #4]
	add r0, r7, #0
	add r2, sp, #4
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095B64:
	ldrsb r0, [r6, r1]
	mov r1, #5
	strb r0, [r2, #4]
	add r0, r7, #0
	add r2, sp, #4
	bl sub_02095CB8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02095B76:
	ldrsb r0, [r6, r1]
	mov r1, #5
	strb r0, [r2, #4]
	add r0, r7, #0
	add r2, sp, #4
	bl sub_02095CB8
_02095B84:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02095B04

	thumb_func_start sub_02095B88
sub_02095B88: ; 0x02095B88
	push {r3, r4}
	ldr r0, [r3]
	cmp r0, #4
	bhi _02095BEA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02095B9C: ; jump table
	.short _02095BEA - _02095B9C - 2 ; case 0
	.short _02095BC0 - _02095B9C - 2 ; case 1
	.short _02095BDA - _02095B9C - 2 ; case 2
	.short _02095BA6 - _02095B9C - 2 ; case 3
	.short _02095BA6 - _02095B9C - 2 ; case 4
_02095BA6:
	mov r0, #2
	strb r0, [r1]
	mov r0, #0
	strb r0, [r1, #1]
	ldrsb r4, [r1, r0]
	mov r0, #1
	ldrsb r3, [r1, r0]
	ldrb r0, [r2]
	mul r0, r3
	add r0, r4, r0
	strb r0, [r1, #2]
	pop {r3, r4}
	bx lr
_02095BC0:
	mov r0, #5
	strb r0, [r1]
	mov r0, #0
	strb r0, [r1, #1]
	ldrsb r4, [r1, r0]
	mov r0, #1
	ldrsb r3, [r1, r0]
	ldrb r0, [r2]
	mul r0, r3
	add r0, r4, r0
	strb r0, [r1, #2]
	pop {r3, r4}
	bx lr
_02095BDA:
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	mov r0, #1
	ldrsb r3, [r1, r0]
	ldrb r0, [r2]
	mul r0, r3
	strb r0, [r1, #2]
_02095BEA:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02095B88

	thumb_func_start sub_02095BF0
sub_02095BF0: ; 0x02095BF0
	push {r4, r5, r6, r7}
	add r7, r2, #0
	ldrb r2, [r7, #1]
	add r4, r1, #0
	mov r0, #0
	ldrb r1, [r7]
	mov ip, r2
	cmp r3, #0
	beq _02095C3C
	ldrsb r2, [r4, r0]
	add r2, r2, r3
	lsl r2, r2, #0x18
	asr r5, r2, #0x18
	ldr r2, _02095C8C ; =FS_OVERLAY_ID(field)
	ldrsb r6, [r4, r2]
	bpl _02095C14
	add r0, r2, #0
	b _02095C2E
_02095C14:
	cmp r5, r1
	blt _02095C1C
	mov r0, #2
	b _02095C2E
_02095C1C:
	add r2, r6, #0
	mul r2, r1
	add r2, r5, r2
	lsl r2, r2, #0x18
	lsr r3, r2, #0x18
	ldrb r2, [r7, #2]
	cmp r3, r2
	blo _02095C2E
	mov r0, #2
_02095C2E:
	cmp r0, #0
	bne _02095C86
	add r2, r6, #0
	mul r2, r1
	strb r5, [r4]
	add r2, r5, r2
	strb r2, [r4, #2]
_02095C3C:
	add r3, sp, #0
	mov r2, #0x10
	ldrsb r2, [r3, r2]
	cmp r2, #0
	beq _02095C84
	mov r5, #1
	ldrsb r5, [r4, r5]
	mov r3, #0
	ldrsb r3, [r4, r3]
	add r2, r5, r2
	lsl r2, r2, #0x18
	asr r2, r2, #0x18
	bpl _02095C5A
	mov r0, #3
	b _02095C76
_02095C5A:
	mov r5, ip
	cmp r2, r5
	blt _02095C64
	mov r0, #4
	b _02095C76
_02095C64:
	add r5, r2, #0
	mul r5, r1
	add r5, r3, r5
	lsl r5, r5, #0x18
	lsr r6, r5, #0x18
	ldrb r5, [r7, #2]
	cmp r6, r5
	blo _02095C76
	mov r0, #4
_02095C76:
	cmp r0, #0
	bne _02095C86
	add r0, r2, #0
	mul r0, r1
	strb r2, [r4, #1]
	add r0, r3, r0
	strb r0, [r4, #2]
_02095C84:
	mov r0, #0
_02095C86:
	pop {r4, r5, r6, r7}
	bx lr
	nop
_02095C8C: .word FS_OVERLAY_ID(field)
	thumb_func_end sub_02095BF0

	thumb_func_start sub_02095C90
sub_02095C90: ; 0x02095C90
	push {r4, r5}
	ldrb r5, [r0, #1]
	mov r3, #0
	cmp r5, #0
	ble _02095CB2
	ldr r4, [r0, #8]
_02095C9C:
	ldr r2, [r4]
	ldrb r2, [r2, #3]
	cmp r1, r2
	bne _02095CAA
	strb r3, [r0]
	pop {r4, r5}
	bx lr
_02095CAA:
	add r3, r3, #1
	add r4, #0xc
	cmp r3, r5
	blt _02095C9C
_02095CB2:
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02095C90

	thumb_func_start sub_02095CB8
sub_02095CB8: ; 0x02095CB8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r7, r2, #0
	bl sub_02095C90
	ldrb r1, [r4]
	mov r0, #0xc
	ldr r5, [r4, #8]
	add r6, r1, #0
	mul r6, r0
	ldr r2, [r4, #0xc]
	add r0, r4, #0
	lsl r1, r1, #2
	add r4, r5, r6
	add r1, r2, r1
	ldr r2, [r5, r6]
	ldr r4, [r4, #8]
	add r3, r7, #0
	blx r4
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02095CB8

	thumb_func_start sub_02095CE0
sub_02095CE0: ; 0x02095CE0
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r1, #0x10
	add r6, r0, #0
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x10
	mov r0, #0
_02095CF4:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02095CF4
	mov r0, #6
	strb r0, [r4, #1]
	ldrb r1, [r4, #1]
	add r0, r6, #0
	lsl r1, r1, #2
	bl AllocFromHeap
	str r0, [r4, #0xc]
	ldrb r2, [r4, #1]
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	str r5, [r4, #4]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02095CE0

	thumb_func_start sub_02095D1C
sub_02095D1C: ; 0x02095D1C
	mov r2, #0
	strb r2, [r0]
	ldr r2, _02095D28 ; =_02108434
	str r2, [r0, #8]
	strb r1, [r0, #2]
	bx lr
	.balign 4, 0
_02095D28: .word _02108434
	thumb_func_end sub_02095D1C

	thumb_func_start sub_02095D2C
sub_02095D2C: ; 0x02095D2C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl Heap_Free
	add r0, r4, #0
	bl Heap_Free
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02095D2C

	thumb_func_start sub_02095D40
sub_02095D40: ; 0x02095D40
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r2, #0
	bl sub_02095C90
	ldrb r0, [r5]
	ldr r2, [r5, #0xc]
	lsl r1, r0, #2
	add r4, r2, r1
	mov r1, #0xc
	ldr r2, [r5, #8]
	mul r1, r0
	ldr r5, [r2, r1]
	ldrb r0, [r5, #2]
	cmp r6, r0
	blo _02095D64
	bl GF_AssertFail
_02095D64:
	strb r6, [r4, #2]
	ldrb r1, [r4, #2]
	ldrb r0, [r5, #2]
	cmp r1, r0
	blo _02095D72
	mov r0, #0
	strb r0, [r4, #2]
_02095D72:
	ldrb r0, [r4, #2]
	ldrb r1, [r5]
	bl _s32_div_f
	strb r1, [r4]
	ldrb r0, [r4, #2]
	ldrb r1, [r5]
	bl _s32_div_f
	strb r0, [r4, #1]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02095D40

	thumb_func_start sub_02095D88
sub_02095D88: ; 0x02095D88
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	str r2, [sp, #8]
	ldrb r7, [r4]
	ldr r2, [r4, #0xc]
	mov ip, r1
	lsl r1, r7, #2
	add r5, r2, r1
	mov r1, #0xc
	add r3, r7, #0
	mul r3, r1
	ldr r2, [r4, #8]
	ldrb r1, [r5, #2]
	add r6, r2, r3
	str r1, [sp, #4]
	ldr r1, [sp, #8]
	str r1, [sp]
	ldr r2, [r2, r3]
	ldr r6, [r6, #4]
	add r1, r5, #0
	mov r3, ip
	blx r6
	ldrb r0, [r4]
	cmp r7, r0
	beq _02095DC2
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02095DC2:
	ldrb r1, [r5, #2]
	ldr r0, [sp, #4]
	cmp r0, r1
	beq _02095DD0
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02095DD0:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02095D88

	thumb_func_start sub_02095DD8
sub_02095DD8: ; 0x02095DD8
	ldrb r1, [r0]
	ldr r2, [r0, #8]
	mov r0, #0xc
	mul r0, r1
	ldr r0, [r2, r0]
	ldrb r0, [r0, #3]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02095DD8

	thumb_func_start sub_02095DE8
sub_02095DE8: ; 0x02095DE8
	ldr r1, [r0, #0xc]
	ldrb r0, [r0]
	lsl r0, r0, #2
	add r0, r1, r0
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end sub_02095DE8

	.rodata

	; File boundary
_0210841C:
	.byte 0x06, 0x01, 0x06, 0x06
_02108420:
	.byte 0x01, 0x03, 0x03, 0x04
_02108424:
	.byte 0x01, 0x01, 0x01, 0x05
_02108428:
	.byte 0x01, 0x03, 0x03, 0x03
_0210842C:
	.byte 0x01, 0x01, 0x01, 0x01
_02108430:
	.byte 0x06, 0x05, 0x1E, 0x02
_02108434:
	.word _02108430, sub_020957B0, sub_02095838
	.word _0210842C, sub_020958C0, sub_02095920
	.word _02108428, sub_0209592C, sub_020959D8
	.word _02108420, sub_02095A34, sub_02095A78
	.word _02108424, sub_02095A7C, sub_02095AF8
	.word _0210841C, sub_02095B04, sub_02095B88
