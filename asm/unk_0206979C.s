#include "constants/pokemon.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/sprites.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/std_script.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public NNS_G3dGlb

	.text

	thumb_func_start sub_0206979C
sub_0206979C: ; 0x0206979C
	ldr r3, _020697A4 ; =memset
	mov r1, #0
	mov r2, #0x24
	bx r3
	.balign 4, 0
_020697A4: .word memset
	thumb_func_end sub_0206979C

	thumb_func_start sub_020697A8
sub_020697A8: ; 0x020697A8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02069800
	ldr r1, [r4]
	mov r0, #1
	orr r0, r1
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020697A8

	thumb_func_start sub_020697BC
sub_020697BC: ; 0x020697BC
	push {r4, lr}
	add r4, r0, #0
	bl sub_02069800
	ldr r1, [r4]
	mov r0, #1
	bic r1, r0
	str r1, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020697BC

	thumb_func_start sub_020697D0
sub_020697D0: ; 0x020697D0
	ldr r3, _020697D8 ; =sub_020697BC
	ldr r1, [r1, #8]
	bx r3
	nop
_020697D8: .word sub_020697BC
	thumb_func_end sub_020697D0

	thumb_func_start sub_020697DC
sub_020697DC: ; 0x020697DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [sp, #0x14]
	add r4, r1, #0
	add r1, r3, #0
	str r0, [sp]
	add r0, r2, #0
	ldr r3, [sp, #0x10]
	mov r2, #0
	bl GfGfxLoader_LoadFromOpenNarc
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl sub_020697A8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020697DC

	thumb_func_start sub_02069800
sub_02069800: ; 0x02069800
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	bl sub_0206979C
	add r0, r4, #0
	mov r1, #0
	str r4, [r5, #8]
	bl NNS_G3dGetAnmByIdx
	str r0, [r5, #0xc]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069800

	thumb_func_start sub_02069818
sub_02069818: ; 0x02069818
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #1
	tst r0, r1
	beq _02069832
	ldr r0, [r4, #8]
	bl FreeToHeap
	ldr r1, [r4]
	mov r0, #1
	bic r1, r0
	str r1, [r4]
_02069832:
	mov r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02069818

	thumb_func_start sub_0206983C
sub_0206983C: ; 0x0206983C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r2, #0
	add r0, #0x14
	mov r2, #4
	bl GF_ExpHeap_FndInitAllocator
	add r0, r5, #0
	ldr r1, [r5, #0xc]
	add r0, #0x14
	add r2, r4, #0
	bl NNS_G3dAllocAnmObj
	str r0, [r5, #0x10]
	cmp r0, #0
	bne _02069862
	bl GF_AssertFail
_02069862:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0206983C

	thumb_func_start sub_02069864
sub_02069864: ; 0x02069864
	ldr r3, _0206986C ; =sub_0206983C
	ldr r1, [r1, #0xc]
	bx r3
	nop
_0206986C: .word sub_0206983C
	thumb_func_end sub_02069864

	thumb_func_start sub_02069870
sub_02069870: ; 0x02069870
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r3, r2, #0
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0xc]
	add r2, r4, #0
	bl NNS_G3dAnmObjInit
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069870

	thumb_func_start sub_02069884
sub_02069884: ; 0x02069884
	ldr r3, _02069890 ; =sub_02069870
	add r2, r1, #0
	ldr r1, [r2, #0xc]
	ldr r2, [r2, #0x10]
	bx r3
	nop
_02069890: .word sub_02069870
	thumb_func_end sub_02069884

	thumb_func_start sub_02069894
sub_02069894: ; 0x02069894
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	add r5, r0, #0
	bl sub_020697D0
	ldr r2, [sp, #0x10]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02069864
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02069884
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02069894

	thumb_func_start sub_020698B8
sub_020698B8: ; 0x020698B8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq _020698CC
	add r0, #0x14
	bl NNS_G3dFreeAnmObj
	mov r0, #0
	str r0, [r4, #0x10]
_020698CC:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020698B8

	thumb_func_start sub_020698D0
sub_020698D0: ; 0x020698D0
	push {r4, lr}
	add r4, r0, #0
	bl sub_020698B8
	add r0, r4, #0
	bl sub_02069818
	add r0, r4, #0
	bl sub_0206979C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020698D0

	thumb_func_start sub_020698E8
sub_020698E8: ; 0x020698E8
	push {r3, r4, r5, r6}
	ldr r3, [r0, #0x10]
	ldr r6, [r0, #4]
	ldr r3, [r3, #8]
	mov r4, #0
	ldrh r3, [r3, #4]
	add r6, r6, r1
	add r5, r4, #0
	str r6, [r0, #4]
	lsl r3, r3, #0xc
	cmp r1, #0
	ldr r1, [r0, #4]
	ble _02069916
	cmp r1, r3
	blt _02069928
	mov r5, #1
	cmp r2, #1
	bne _02069912
	sub r1, r1, r3
	str r1, [r0, #4]
	b _02069928
_02069912:
	str r3, [r0, #4]
	b _02069928
_02069916:
	cmp r1, #0
	bgt _02069928
	mov r5, #1
	cmp r2, #1
	bne _02069926
	add r1, r1, r3
	str r1, [r0, #4]
	b _02069928
_02069926:
	str r4, [r0, #4]
_02069928:
	ldr r2, [r0, #4]
	ldr r1, [r0, #0x10]
	cmp r5, #1
	str r2, [r1]
	ldr r2, [r0]
	bne _0206993C
	mov r1, #2
	orr r1, r2
	str r1, [r0]
	b _02069942
_0206993C:
	mov r1, #2
	bic r2, r1
	str r2, [r0]
_02069942:
	add r0, r5, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end sub_020698E8

	thumb_func_start sub_02069948
sub_02069948: ; 0x02069948
	ldr r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _02069954
	mov r0, #1
	bx lr
_02069954:
	mov r0, #0
	bx lr
	thumb_func_end sub_02069948

	; File boundary?

	thumb_func_start sub_02069958
sub_02069958: ; 0x02069958
	ldr r3, _02069960 ; =memset
	mov r1, #0
	mov r2, #0x54
	bx r3
	.balign 4, 0
_02069960: .word memset
	thumb_func_end sub_02069958

	thumb_func_start sub_02069964
sub_02069964: ; 0x02069964
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02069958
	add r0, r5, #0
	add r1, r4, #0
	bl NNS_G3dRenderObjInit
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069964

	thumb_func_start sub_02069978
sub_02069978: ; 0x02069978
	ldr r3, _02069980 ; =sub_02069964
	ldr r1, [r1, #0xc]
	bx r3
	nop
_02069980: .word sub_02069964
	thumb_func_end sub_02069978

	thumb_func_start sub_02069984
sub_02069984: ; 0x02069984
	ldr r3, _02069988 ; =NNS_G3dRenderObjAddAnmObj
	bx r3
	.balign 4, 0
_02069988: .word NNS_G3dRenderObjAddAnmObj
	thumb_func_end sub_02069984

	thumb_func_start sub_0206998C
sub_0206998C: ; 0x0206998C
	ldr r3, _02069994 ; =sub_02069984
	ldr r1, [r1, #0x10]
	bx r3
	nop
_02069994: .word sub_02069984
	thumb_func_end sub_0206998C

	thumb_func_start sub_02069998
sub_02069998: ; 0x02069998
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl sub_02069978
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0206998C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069998

	thumb_func_start sub_020699AC
sub_020699AC: ; 0x020699AC
	push {r4, lr}
	add r4, r2, #0
	add r2, r3, #0
	add r3, r4, #0
	bl Draw3dModel
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020699AC

	thumb_func_start sub_020699BC
sub_020699BC: ; 0x020699BC
	push {r3, lr}
	ldr r2, _020699C8 ; =_020FE8A4
	ldr r3, _020699CC ; =_020FE8B0
	bl sub_020699AC
	pop {r3, pc}
	.balign 4, 0
_020699C8: .word _020FE8A4
_020699CC: .word _020FE8B0
	thumb_func_end sub_020699BC

	thumb_func_start sub_020699D0
sub_020699D0: ; 0x020699D0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r4, r1, #0
	add r6, r2, #0
	add r5, r0, #0
	ldrh r1, [r3]
	ldrh r2, [r3, #2]
	ldrh r3, [r3, #4]
	add r0, sp, #0
	bl sub_02020DA4
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, sp, #0
	bl sub_020699AC
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020699D0

	.rodata

_020FE8A4:
	.word 0x00001000
	.word 0x00001000
	.word 0x00001000
_020FE8B0:
	.word 0x00001000, 0x00000000, 0x00000000
	.word 0x00000000, 0x00001000, 0x00000000
	.word 0x00000000, 0x00000000, 0x00001000
