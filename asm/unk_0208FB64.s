#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "unk_0208FB64.inc"
	.include "global.inc"

	.public _020FA484
	.public gNatureStatMods

	.text

	thumb_func_start sub_0208FB64
sub_0208FB64: ; 0x0208FB64
	ldr r3, _0208FB70 ; =sub_0203410C
	add r2, r0, #0
	ldr r0, _0208FB74 ; =_021059DC
	mov r1, #0x6e
	bx r3
	nop
_0208FB70: .word sub_0203410C
_0208FB74: .word _021059DC
	thumb_func_end sub_0208FB64

	thumb_func_start sub_0208FB78
sub_0208FB78: ; 0x0208FB78
	ldr r0, _0208FB84 ; =0x00004A08
	ldr r1, [r3, r0]
	add r1, r1, #1
	str r1, [r3, r0]
	bx lr
	nop
_0208FB84: .word 0x00004A08
	thumb_func_end sub_0208FB78

	thumb_func_start sub_0208FB88
sub_0208FB88: ; 0x0208FB88
	cmp r0, #0
	bne _0208FB92
	ldrb r1, [r2]
	ldr r0, _0208FB94 ; =0x00004A10
	str r1, [r3, r0]
_0208FB92:
	bx lr
	.balign 4, 0
_0208FB94: .word 0x00004A10
	thumb_func_end sub_0208FB88

	thumb_func_start sub_0208FB98
sub_0208FB98: ; 0x0208FB98
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0208FBD8 ; =0x00004A08
	add r4, r3, #0
	mov r1, #0
	str r1, [r4, r0]
	mov r1, #1
	add r0, #0xc
	strb r1, [r4, r0]
	bl sub_0203769C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0208FD3C
	add r0, r4, #0
	bl ov73_021E6B98
	lsl r2, r5, #0x18
	add r0, r4, #0
	mov r1, #0x19
	lsr r2, r2, #0x18
	bl ov73_021E705C
	mov r0, #1
	add r1, r0, #0
	bl sub_020398D4
	ldr r0, _0208FBDC ; =0x00000657
	bl PlaySE
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0208FBD8: .word 0x00004A08
_0208FBDC: .word 0x00000657
	thumb_func_end sub_0208FB98

	thumb_func_start sub_0208FBE0
sub_0208FBE0: ; 0x0208FBE0
	add r0, r3, #0
	ldr r3, _0208FBEC ; =ov73_021E705C
	mov r1, #2
	mov r2, #0
	bx r3
	nop
_0208FBEC: .word ov73_021E705C
	thumb_func_end sub_0208FBE0

	thumb_func_start sub_0208FBF0
sub_0208FBF0: ; 0x0208FBF0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r6, #0
	beq _0208FC86
	bl sub_0203769C
	cmp r0, #0
	bne _0208FCD0
	ldrb r0, [r5]
	add r1, sp, #0
	strb r0, [r1]
	ldrb r0, [r5, #1]
	strb r0, [r1, #1]
	ldrb r0, [r5, #2]
	strb r0, [r1, #2]
	ldrb r0, [r5, #3]
	strb r0, [r1, #3]
	ldr r0, _0208FCD4 ; =0x00004A1C
	strb r6, [r1]
	ldr r0, [r4, r0]
	strb r0, [r1, #1]
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _0208FC2A
	cmp r0, #1
	b _0208FC78
_0208FC2A:
	bl sub_02037454
	ldr r1, _0208FCD4 ; =0x00004A1C
	ldr r1, [r4, r1]
	cmp r1, r0
	bne _0208FC52
	bl ov73_021E7488
	ldr r1, _0208FCD4 ; =0x00004A1C
	ldr r1, [r4, r1]
	cmp r1, r0
	bne _0208FC52
	bl sub_02033250
	bl MATH_CountPopulation
	ldr r1, _0208FCD4 ; =0x00004A1C
	ldr r2, [r4, r1]
	cmp r2, r0
	beq _0208FC5A
_0208FC52:
	mov r1, #0
	add r0, sp, #0
	strb r1, [r0, #3]
	b _0208FC78
_0208FC5A:
	add r0, r1, #0
	add r0, #8
	mov r2, #1
	ldr r3, [r4, r0]
	add r0, r2, #0
	lsl r0, r6
	orr r0, r3
	add r1, #8
	str r0, [r4, r1]
	add r0, sp, #0
	strb r2, [r0, #3]
	bl sub_02037454
	bl sub_02038C1C
_0208FC78:
	mov r0, #0x70
	add r1, sp, #0
	mov r2, #4
	bl sub_02037030
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208FC86:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _0208FC94
	cmp r0, #1
	beq _0208FCC6
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208FC94:
	ldrb r6, [r5]
	bl sub_0203769C
	cmp r6, r0
	bne _0208FCD0
	ldrb r0, [r5, #3]
	cmp r0, #0
	bne _0208FCB2
	add r0, r4, #0
	mov r1, #8
	add r2, r6, #0
	bl ov73_021E705C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208FCB2:
	ldrb r1, [r5, #1]
	ldr r0, _0208FCD8 ; =0x00004A30
	strh r1, [r4, r0]
	ldrb r2, [r5]
	add r0, r4, #0
	mov r1, #7
	bl ov73_021E705C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208FCC6:
	ldrb r2, [r5]
	add r0, r4, #0
	mov r1, #0x13
	bl ov73_021E705C
_0208FCD0:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0208FCD4: .word 0x00004A1C
_0208FCD8: .word 0x00004A30
	thumb_func_end sub_0208FBF0

	thumb_func_start sub_0208FCDC
sub_0208FCDC: ; 0x0208FCDC
	push {r4, lr}
	ldrb r2, [r2]
	add r4, r3, #0
	add r0, r4, #0
	mov r1, #1
	bl ov73_021E7120
	bl sub_0203769C
	cmp r0, #0
	bne _0208FCFA
	mov r0, #0xe1
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_0208FCFA:
	pop {r4, pc}
	thumb_func_end sub_0208FCDC

	thumb_func_start sub_0208FCFC
sub_0208FCFC: ; 0x0208FCFC
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208FCFC

	thumb_func_start sub_0208FD00
sub_0208FD00: ; 0x0208FD00
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208FD00

	thumb_func_start sub_0208FD04
sub_0208FD04: ; 0x0208FD04
	push {r4, lr}
	add r4, r3, #0
	bl sub_0203769C
	cmp r0, #0
	beq _0208FD1A
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0
	bl ov73_021E705C
_0208FD1A:
	pop {r4, pc}
	thumb_func_end sub_0208FD04

	thumb_func_start sub_0208FD1C
sub_0208FD1C: ; 0x0208FD1C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl sub_0203769C
	cmp r0, #0
	bne _0208FD38
	add r0, sp, #0
	strb r4, [r0]
	mov r0, #0x6e
	add r1, sp, #0
	mov r2, #1
	bl sub_02037030
_0208FD38:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_0208FD1C

	thumb_func_start sub_0208FD3C
sub_0208FD3C: ; 0x0208FD3C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0xe2
	mov r3, #0
	lsl r0, r0, #2
	add r5, r4, r0
	add r2, r3, #0
	sub r0, #0x9a
_0208FD4C:
	ldr r1, [r5]
	add r2, r2, #1
	eor r3, r1
	add r5, r5, #4
	cmp r2, r0
	blt _0208FD4C
	mov r0, #0x3d
	lsl r0, r0, #6
	str r3, [r4, r0]
	bl LCRandom
	ldr r1, _0208FD78 ; =0x00000F44
	mov r2, #0x2f
	str r0, [r4, r1]
	mov r1, #0xe2
	lsl r1, r1, #2
	mov r0, #0x74
	add r1, r4, r1
	lsl r2, r2, #6
	bl sub_02036FD8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0208FD78: .word 0x00000F44
	thumb_func_end sub_0208FD3C

	thumb_func_start sub_0208FD7C
sub_0208FD7C: ; 0x0208FD7C
	mov r0, #0
	bx lr
	thumb_func_end sub_0208FD7C

	thumb_func_start sub_0208FD80
sub_0208FD80: ; 0x0208FD80
	mov r0, #1
	bx lr
	thumb_func_end sub_0208FD80

	thumb_func_start sub_0208FD84
sub_0208FD84: ; 0x0208FD84
	mov r0, #4
	bx lr
	thumb_func_end sub_0208FD84

	thumb_func_start sub_0208FD88
sub_0208FD88: ; 0x0208FD88
	ldr r2, _0208FD98 ; =0x00000F48
	add r2, r1, r2
	mov r1, #0x2f
	lsl r1, r1, #6
	mul r1, r0
	add r0, r2, r1
	bx lr
	nop
_0208FD98: .word 0x00000F48
	thumb_func_end sub_0208FD88

	.rodata

_021059DC:
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_0208FCFC, sub_0208FD80, 0
	.word sub_0208FD00, sub_0208FD80, 0
	.word sub_0208FCDC, sub_0208FD80, 0
	.word sub_0208FBE0, sub_0208FD7C, 0
	.word sub_0208FBF0, sub_0208FD84, 0
	.word sub_0208FD04, sub_0208FD7C, 0
	.word sub_0208FD1C, sub_0208FD7C, 0
	.word sub_0208FB98, sub_0208FD7C, 0
	.word sub_0208FB78, sub_02091590, sub_0208FD88
	.word sub_0208FB88, sub_0208FD80, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
