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

	thumb_func_start sub_0208F658
sub_0208F658: ; 0x0208F658
	ldr r3, _0208F664 ; =sub_0203410C
	add r2, r0, #0
	ldr r0, _0208F668 ; =_02105430
	mov r1, #0xb
	bx r3
	nop
_0208F664: .word sub_0203410C
_0208F668: .word _02105430
	thumb_func_end sub_0208F658

	thumb_func_start sub_0208F66C
sub_0208F66C: ; 0x0208F66C
	cmp r0, #0xc
	bne _0208F674
	mov r0, #0xc
	bx lr
_0208F674:
	cmp r0, #6
	bhs _0208F67C
	add r0, r0, #6
	bx lr
_0208F67C:
	sub r0, r0, #6
	bx lr
	thumb_func_end sub_0208F66C

	thumb_func_start sub_0208F680
sub_0208F680: ; 0x0208F680
	push {r4, r5, r6, lr}
	add r3, #0x88
	add r5, r0, #0
	add r6, r2, #0
	ldr r4, [r3]
	bl sub_0203769C
	cmp r5, r0
	beq _0208F6EA
	ldr r0, _0208F6EC ; =0x00002228
	mov r2, #0x59
	ldr r0, [r4, r0]
	add r1, r6, #0
	lsl r2, r2, #4
	bl memcpy
	ldr r0, [r4, #0x64]
	add r2, r0, #1
	mov r0, #0x59
	lsl r0, r0, #4
	add r1, r2, #0
	mul r1, r0
	str r2, [r4, #0x64]
	cmp r1, r0
	blt _0208F6D6
	bl sub_0203769C
	cmp r0, #1
	bne _0208F6C6
	add r0, r4, #0
	mov r1, #0x1b
	mov r2, #0
	bl ov65_0221DE24
	b _0208F6E4
_0208F6C6:
	bl sub_0203769C
	ldr r1, _0208F6F0 ; =0x00002224
	ldr r2, [r4, #0x5c]
	ldr r1, [r4, r1]
	bl ov65_0221DE64
	b _0208F6E4
_0208F6D6:
	bl sub_0203769C
	ldr r1, _0208F6F0 ; =0x00002224
	ldr r2, [r4, #0x5c]
	ldr r1, [r4, r1]
	bl ov65_0221DE64
_0208F6E4:
	ldr r0, [r4, #0x5c]
	add r0, r0, #1
	str r0, [r4, #0x5c]
_0208F6EA:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0208F6EC: .word 0x00002228
_0208F6F0: .word 0x00002224
	thumb_func_end sub_0208F680

	thumb_func_start sub_0208F6F4
sub_0208F6F4: ; 0x0208F6F4
	push {r4, r5, r6, lr}
	add r3, #0x88
	add r5, r0, #0
	add r6, r2, #0
	ldr r4, [r3]
	bl sub_0203769C
	cmp r5, r0
	beq _0208F710
	ldrb r0, [r6]
	bl sub_0208F66C
	add r4, #0x98
	str r0, [r4]
_0208F710:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0208F6F4

	thumb_func_start sub_0208F714
sub_0208F714: ; 0x0208F714
	add r3, #0x88
	ldrb r2, [r2]
	ldr r1, [r3]
	lsl r0, r0, #2
	add r0, r1, r0
	str r2, [r0, #0x6c]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F714

	thumb_func_start sub_0208F724
sub_0208F724: ; 0x0208F724
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F724

	thumb_func_start sub_0208F728
sub_0208F728: ; 0x0208F728
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F728

	thumb_func_start sub_0208F72C
sub_0208F72C: ; 0x0208F72C
	add r3, #0x88
	ldr r0, [r3]
	mov r1, #2
	str r1, [r0, #0x60]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F72C

	thumb_func_start sub_0208F738
sub_0208F738: ; 0x0208F738
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F738

	thumb_func_start sub_0208F73C
sub_0208F73C: ; 0x0208F73C
	add r3, #0x88
	ldrb r2, [r2]
	ldr r1, [r3]
	ldr r0, _0208F748 ; =0x000022CC
	str r2, [r1, r0]
	bx lr
	.balign 4, 0
_0208F748: .word 0x000022CC
	thumb_func_end sub_0208F73C

	thumb_func_start sub_0208F74C
sub_0208F74C: ; 0x0208F74C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r3, #0xc]
	add r5, r2, #0
	bl Save_SpecialRibbons_get
	add r4, r0, #0
	bl sub_0203769C
	cmp r6, r0
	beq _0208F778
	mov r2, #0
_0208F764:
	ldrb r1, [r5, r2]
	cmp r1, #0
	beq _0208F772
	ldrb r0, [r4, r2]
	cmp r0, r1
	beq _0208F772
	strb r1, [r4, r2]
_0208F772:
	add r2, r2, #1
	cmp r2, #0xe
	blt _0208F764
_0208F778:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0208F74C

	thumb_func_start sub_0208F77C
sub_0208F77C: ; 0x0208F77C
	push {r4, r5, r6, lr}
	add r3, #0x88
	add r5, r0, #0
	add r6, r2, #0
	ldr r4, [r3]
	bl sub_0203769C
	cmp r5, r0
	beq _0208F7A0
	ldr r0, _0208F7A4 ; =0x00002230
	add r1, r6, #0
	ldr r0, [r4, r0]
	mov r2, #1
	mov r3, #0x1a
	bl SavePalPad_Merge
	mov r0, #3
	str r0, [r4, #0x60]
_0208F7A0:
	pop {r4, r5, r6, pc}
	nop
_0208F7A4: .word 0x00002230
	thumb_func_end sub_0208F77C

	thumb_func_start sub_0208F7A8
sub_0208F7A8: ; 0x0208F7A8
	push {r4, r5, r6, lr}
	add r3, #0x88
	add r5, r0, #0
	add r6, r2, #0
	ldr r4, [r3]
	bl sub_0203769C
	cmp r5, r0
	beq _0208F7DA
	ldr r1, _0208F7DC ; =0x00002E20
	mov r2, #0xfb
	add r3, r4, r1
	lsl r2, r2, #2
	add r1, r5, #0
	mul r1, r2
	add r0, r6, #0
	add r1, r3, r1
	sub r2, r2, #4
	bl MIi_CpuCopyFast
	mov r0, #4
	str r0, [r4, #0x60]
	mov r0, #0
	bl sub_020378E4
_0208F7DA:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0208F7DC: .word 0x00002E20
	thumb_func_end sub_0208F7A8

	thumb_func_start sub_0208F7E0
sub_0208F7E0: ; 0x0208F7E0
	add r0, #0x88
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F7E0

	thumb_func_start sub_0208F7E8
sub_0208F7E8: ; 0x0208F7E8
	mov r0, #0xfb
	lsl r0, r0, #2
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F7E8

	thumb_func_start sub_0208F7F0
sub_0208F7F0: ; 0x0208F7F0
	mov r0, #0xe
	bx lr
	thumb_func_end sub_0208F7F0

	thumb_func_start sub_0208F7F4
sub_0208F7F4: ; 0x0208F7F4
	mov r0, #0x88
	bx lr
	thumb_func_end sub_0208F7F4

	thumb_func_start sub_0208F7F8
sub_0208F7F8: ; 0x0208F7F8
	mov r0, #0x59
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F7F8

	thumb_func_start sub_0208F800
sub_0208F800: ; 0x0208F800
	add r1, #0x88
	ldr r2, [r1]
	mov r1, #0x23
	lsl r1, r1, #8
	add r2, r2, r1
	mov r1, #0x59
	lsl r1, r1, #4
	mul r1, r0
	add r0, r2, r1
	bx lr
	thumb_func_end sub_0208F800

	.rodata

_02105430:
	.word sub_0208F680, sub_0208F7F8, sub_0208F800
	.word sub_0208F6F4, sub_020342C4, 0
	.word sub_0208F714, sub_020342C4, 0
	.word sub_0208F724, sub_020342C4, 0
	.word sub_0208F728, sub_020342C4, 0
	.word sub_0208F72C, sub_020342C4, 0
	.word sub_0208F77C, sub_0208F7F4, sub_0208F800
	.word sub_0208F7A8, sub_0208F7E8, sub_0208F800
	.word sub_0208F738, sub_020342C0, 0
	.word sub_0208F73C, sub_020342C4, 0
	.word sub_0208F74C, sub_0208F7F0, 0
