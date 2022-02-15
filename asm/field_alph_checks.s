#include "constants/species.h"
#include "constants/maps.h"
#include "constants/sprites.h"
#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public NNS_G3dGlb

	.text

	thumb_func_start CheckUseEscapeRopeInAlphChamber
CheckUseEscapeRopeInAlphChamber: ; 0x0206BD10
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetPosition
	mov r1, #MAP_D24R0202>>2
	ldr r2, [r0]
	lsl r1, r1, #2
	cmp r2, r1
	beq _0206BD2A
	mov r0, #0
	pop {r3, pc}
_0206BD2A:
	ldr r1, [r0, #8]
	cmp r1, #6
	bne _0206BD3C
	ldr r1, [r0, #0xc]
	cmp r1, #3
	bne _0206BD3C
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _0206BD40
_0206BD3C:
	mov r0, #0
	pop {r3, pc}
_0206BD40:
	mov r0, #1
	pop {r3, pc}
	thumb_func_end CheckUseEscapeRopeInAlphChamber

	thumb_func_start CheckUseFlashInAlphChamber
CheckUseFlashInAlphChamber: ; 0x0206BD44
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetPosition
	ldr r2, [r0]
	ldr r1, _0206BD78 ; =MAP_D24R0204
	cmp r2, r1
	beq _0206BD5C
	mov r0, #0
	pop {r3, pc}
_0206BD5C:
	ldr r1, [r0, #8]
	cmp r1, #6
	bne _0206BD6E
	ldr r1, [r0, #0xc]
	cmp r1, #3
	bne _0206BD6E
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _0206BD72
_0206BD6E:
	mov r0, #0
	pop {r3, pc}
_0206BD72:
	mov r0, #1
	pop {r3, pc}
	nop
_0206BD78: .word MAP_D24R0204
	thumb_func_end CheckUseFlashInAlphChamber

	thumb_func_start CheckUseWaterStoneInAlphChamber
CheckUseWaterStoneInAlphChamber: ; 0x0206BD7C
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetPosition
	mov r1, #MAP_D24R0206>>2
	ldr r2, [r0]
	lsl r1, r1, #2
	cmp r2, r1
	beq _0206BD96
	mov r0, #0
	pop {r3, pc}
_0206BD96:
	ldr r1, [r0, #8]
	cmp r1, #6
	bne _0206BDA8
	ldr r1, [r0, #0xc]
	cmp r1, #3
	bne _0206BDA8
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _0206BDAC
_0206BDA8:
	mov r0, #0
	pop {r3, pc}
_0206BDAC:
	mov r0, #1
	pop {r3, pc}
	thumb_func_end CheckUseWaterStoneInAlphChamber
