#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "unk_0208F814.inc"
	.include "global.inc"

	.public _020FA484
	.public gNatureStatMods

	.text

	thumb_func_start sub_0208F814
sub_0208F814: ; 0x0208F814
	ldr r3, _0208F820 ; =sub_0203410C
	add r2, r0, #0
	ldr r0, _0208F824 ; =_021054B4
	mov r1, #0x6e
	bx r3
	nop
_0208F820: .word sub_0203410C
_0208F824: .word _021054B4
	thumb_func_end sub_0208F814

	thumb_func_start sub_0208F828
sub_0208F828: ; 0x0208F828
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	bl sub_0203769C
	cmp r0, #0
	beq _0208F886
	mov r3, #0xfb
	lsl r3, r3, #2
	ldrb r2, [r5, r3]
	sub r0, r3, #4
	add r1, r2, #0
	mul r1, r0
	mov r0, #0xe1
	lsl r0, r0, #6
	cmp r1, r0
	ldr r2, _0208F8B4 ; =0x000043D0
	ble _0208F85C
	add r2, r4, r2
	add r1, r2, r1
	mov r2, #0x19
	add r0, r5, #0
	lsl r2, r2, #4
	bl MIi_CpuCopyFast
	b _0208F868
_0208F85C:
	add r2, r4, r2
	add r1, r2, r1
	add r0, r5, #0
	sub r2, r3, #4
	bl MIi_CpuCopyFast
_0208F868:
	mov r1, #0xb5
	ldr r0, _0208F8B4 ; =0x000043D0
	lsl r1, r1, #2
	mov r2, #0xe1
	ldr r1, [r4, r1]
	add r0, r4, r0
	lsl r2, r2, #6
	bl MIi_CpuCopyFast
	mov r0, #0xb2
	lsl r0, r0, #2
	add r0, r4, r0
	bl CopyWindowToVram
	pop {r3, r4, r5, pc}
_0208F886:
	ldr r1, _0208F8B8 ; =0x000043CC
	mov r0, #0xfa
	ldr r2, [r4, r1]
	lsl r0, r0, #2
	add r3, r2, #0
	mul r3, r0
	mov r0, #0xe1
	lsl r0, r0, #6
	cmp r3, r0
	bge _0208F8A8
	add r0, r2, #1
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl sub_0208FAF8
	pop {r3, r4, r5, pc}
_0208F8A8:
	mov r1, #0
	mov r0, #0x7c
	add r2, r1, #0
	bl sub_02037108
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0208F8B4: .word 0x000043D0
_0208F8B8: .word 0x000043CC
	thumb_func_end sub_0208F828

	thumb_func_start sub_0208F8BC
sub_0208F8BC: ; 0x0208F8BC
	push {r3, r4}
	cmp r0, #0
	beq _0208F8DA
	add r4, r0, #0
	mov r1, #0xa
	mul r4, r1
	ldr r0, _0208F8E0 ; =0x000093BD
	add r3, r3, r4
	add r3, r3, r0
_0208F8CE:
	ldrb r0, [r2]
	add r2, r2, #1
	strb r0, [r3]
	add r3, r3, #1
	sub r1, r1, #1
	bne _0208F8CE
_0208F8DA:
	pop {r3, r4}
	bx lr
	nop
_0208F8E0: .word 0x000093BD
	thumb_func_end sub_0208F8BC

	thumb_func_start sub_0208F8E4
sub_0208F8E4: ; 0x0208F8E4
	push {r4, r5, r6, r7}
	cmp r3, #0
	beq _0208F90E
	cmp r0, #0
	bne _0208F90E
	ldr r0, _0208F914 ; =0x00004382
	mov r7, #0
_0208F8F2:
	add r6, r2, #0
	add r5, r3, r0
	mov r4, #0xa
_0208F8F8:
	ldrb r1, [r6]
	add r6, r6, #1
	strb r1, [r5]
	add r5, r5, #1
	sub r4, r4, #1
	bne _0208F8F8
	add r7, r7, #1
	add r2, #0xa
	add r3, #0xa
	cmp r7, #5
	blt _0208F8F2
_0208F90E:
	pop {r4, r5, r6, r7}
	bx lr
	nop
_0208F914: .word 0x00004382
	thumb_func_end sub_0208F8E4

	thumb_func_start sub_0208F918
sub_0208F918: ; 0x0208F918
	push {r4, lr}
	add r4, r3, #0
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl ov37_021E6FC8
	ldr r1, _0208F958 ; =0x000043D0
	mov r2, #0xe1
	mov r0, #0
	add r1, r4, r1
	lsl r2, r2, #6
	bl MIi_CpuClearFast
	bl sub_0203769C
	cmp r0, #0
	bne _0208F956
	bl sub_02037454
	mov r1, #0xc6
	lsl r1, r1, #2
	str r0, [r4, r1]
	bl sub_02033250
	mov r1, #0xc7
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _0208F95C ; =0x000093F4
	mov r1, #1
	str r1, [r4, r0]
_0208F956:
	pop {r4, pc}
	.balign 4, 0
_0208F958: .word 0x000043D0
_0208F95C: .word 0x000093F4
	thumb_func_end sub_0208F918

	thumb_func_start sub_0208F960
sub_0208F960: ; 0x0208F960
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r6, #0
	beq _0208F9FA
	bl sub_0203769C
	cmp r0, #0
	bne _0208FA44
	ldrb r0, [r5]
	add r1, sp, #0
	strb r0, [r1]
	ldrb r0, [r5, #1]
	strb r0, [r1, #1]
	ldrb r0, [r5, #2]
	strb r0, [r1, #2]
	ldrb r0, [r5, #3]
	strb r0, [r1, #3]
	mov r0, #0xc6
	strb r6, [r1]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	strb r0, [r1, #1]
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _0208F99C
	cmp r0, #1
	b _0208F9EC
_0208F99C:
	bl sub_02037454
	mov r1, #0xc6
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, r0
	bne _0208F9CA
	bl ov37_021E75E0
	mov r1, #0xc6
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, r0
	bne _0208F9CA
	bl sub_02033250
	bl MATH_CountPopulation
	mov r1, #0xc6
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, r0
	beq _0208F9D2
_0208F9CA:
	mov r1, #0
	add r0, sp, #0
	strb r1, [r0, #3]
	b _0208F9EC
_0208F9D2:
	ldr r0, _0208FA48 ; =0x000093B4
	mov r1, #1
	add r2, r1, #0
	ldr r3, [r4, r0]
	lsl r2, r6
	orr r2, r3
	str r2, [r4, r0]
	add r0, sp, #0
	strb r1, [r0, #3]
	bl sub_02037454
	bl sub_02038C1C
_0208F9EC:
	mov r0, #0x7e
	add r1, sp, #0
	mov r2, #4
	bl sub_02037108
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208F9FA:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _0208FA08
	cmp r0, #1
	beq _0208FA3A
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208FA08:
	ldrb r6, [r5]
	bl sub_0203769C
	cmp r6, r0
	bne _0208FA44
	ldrb r0, [r5, #3]
	cmp r0, #0
	bne _0208FA26
	add r0, r4, #0
	mov r1, #9
	add r2, r6, #0
	bl ov37_021E6FC8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208FA26:
	ldrb r1, [r5, #1]
	ldr r0, _0208FA4C ; =0x000093B8
	strh r1, [r4, r0]
	ldrb r2, [r5]
	add r0, r4, #0
	mov r1, #8
	bl ov37_021E6FC8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208FA3A:
	ldrb r2, [r5]
	add r0, r4, #0
	mov r1, #0x15
	bl ov37_021E6FC8
_0208FA44:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0208FA48: .word 0x000093B4
_0208FA4C: .word 0x000093B8
	thumb_func_end sub_0208F960

	thumb_func_start sub_0208FA50
sub_0208FA50: ; 0x0208FA50
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208FA50

	thumb_func_start sub_0208FA54
sub_0208FA54: ; 0x0208FA54
	push {r4, lr}
	ldrb r2, [r2]
	add r4, r3, #0
	add r0, r4, #0
	mov r1, #1
	bl ov37_021E6FC8
	bl sub_0203769C
	cmp r0, #0
	bne _0208FA82
	mov r0, #3
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0208FA82
	ldr r1, _0208FA84 ; =0x000043CC
	mov r0, #0
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl sub_0208FAF8
_0208FA82:
	pop {r4, pc}
	.balign 4, 0
_0208FA84: .word 0x000043CC
	thumb_func_end sub_0208FA54

	thumb_func_start sub_0208FA88
sub_0208FA88: ; 0x0208FA88
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208FA88

	thumb_func_start sub_0208FA8C
sub_0208FA8C: ; 0x0208FA8C
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208FA8C

	thumb_func_start sub_0208FA90
sub_0208FA90: ; 0x0208FA90
	push {r4, lr}
	add r4, r3, #0
	bl sub_0203769C
	cmp r0, #0
	beq _0208FAA6
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #0
	bl ov37_021E6FC8
_0208FAA6:
	pop {r4, pc}
	thumb_func_end sub_0208FA90

	thumb_func_start sub_0208FAA8
sub_0208FAA8: ; 0x0208FAA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r3, #0
	bl sub_0203769C
	cmp r0, #0
	beq _0208FABA
	bl GF_AssertFail
_0208FABA:
	bl sub_0203769C
	cmp r0, #0
	bne _0208FADE
	ldr r0, _0208FAE8 ; =0x000093FC
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0208FADA
	add r0, sp, #0
	strb r5, [r0]
	mov r0, #0x7b
	add r1, sp, #0
	mov r2, #1
	bl sub_02037108
	b _0208FADE
_0208FADA:
	mov r1, #1
	str r1, [r4, r0]
_0208FADE:
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0208FAE8: .word 0x000093FC
	thumb_func_end sub_0208FAA8

	thumb_func_start sub_0208FAEC
sub_0208FAEC: ; 0x0208FAEC
	ldr r0, _0208FAF4 ; =0x000093F4
	mov r1, #1
	str r1, [r3, r0]
	bx lr
	.balign 4, 0
_0208FAF4: .word 0x000093F4
	thumb_func_end sub_0208FAEC

	thumb_func_start sub_0208FAF8
sub_0208FAF8: ; 0x0208FAF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb5
	mov r2, #0xfa
	add r4, r1, #0
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	lsl r2, r2, #2
	add r0, r4, #0
	mul r0, r2
	add r0, r1, r0
	ldr r1, _0208FB44 ; =0x00007C10
	add r1, r5, r1
	bl MIi_CpuCopyFast
	ldr r0, _0208FB44 ; =0x00007C10
	mov r2, #0
	add r1, r2, #0
	add r3, r5, r0
_0208FB1E:
	ldr r0, [r3]
	add r1, r1, #1
	eor r2, r0
	add r3, r3, #4
	cmp r1, #0xfa
	blt _0208FB1E
	ldr r0, _0208FB48 ; =0x00007FF8
	ldr r1, _0208FB44 ; =0x00007C10
	str r2, [r5, r0]
	add r0, r0, #4
	mov r2, #0x3f
	strb r4, [r5, r0]
	mov r0, #0x76
	add r1, r5, r1
	lsl r2, r2, #4
	bl sub_02037088
	pop {r3, r4, r5, pc}
	nop
_0208FB44: .word 0x00007C10
_0208FB48: .word 0x00007FF8
	thumb_func_end sub_0208FAF8

	thumb_func_start sub_0208FB4C
sub_0208FB4C: ; 0x0208FB4C
	mov r2, #2
	lsl r2, r2, #0xe
	add r2, r1, r2
	mov r1, #0x3f
	lsl r1, r1, #4
	mul r1, r0
	add r0, r2, r1
	bx lr
	thumb_func_end sub_0208FB4C

	thumb_func_start sub_0208FB5C
sub_0208FB5C: ; 0x0208FB5C
	mov r0, #4
	bx lr
	thumb_func_end sub_0208FB5C

	thumb_func_start sub_0208FB60
sub_0208FB60: ; 0x0208FB60
	mov r0, #4
	bx lr
	thumb_func_end sub_0208FB60

	.rodata

_021054B4:
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_0208FB5C, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_0208F828, sub_02091598, sub_0208FB4C
	.word sub_0208F8BC, sub_020915A0, 0
	.word sub_0208F8E4, sub_020915A4, 0
	.word sub_0208FA88, sub_020342C4, 0
	.word sub_0208FA8C, sub_020342C4, 0
	.word sub_0208FA54, sub_020342C4, 0
	.word sub_0208F918, sub_020342C0, 0
	.word sub_0208FA50, sub_020342C0, 0
	.word sub_0208F960, sub_0208FB60, 0
	.word sub_0208FA90, sub_020342C0, 0
	.word sub_0208FAA8, sub_020342C0, 0
	.word sub_0208FAEC, sub_020342C0, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
