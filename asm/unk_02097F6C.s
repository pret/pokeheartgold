#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02097F6C
sub_02097F6C: ; 0x02097F6C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r1, #0x14
	add r4, r2, #0
	bl _u32_div_f
	lsl r0, r1, #0x18
	lsr r1, r0, #0x16
	ldr r0, _02097F94 ; =_02108F4C
	ldrh r0, [r0, r1]
	cmp r5, r0
	bne _02097F90
	ldr r0, _02097F98 ; =_02108F4C + 2
	ldrh r0, [r0, r1]
	cmp r4, r0
	bne _02097F90
	mov r0, #1
	pop {r3, r4, r5, pc}
_02097F90:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02097F94: .word _02108F4C
_02097F98: .word _02108F4C + 2
	thumb_func_end sub_02097F6C

	thumb_func_start sub_02097F9C
sub_02097F9C: ; 0x02097F9C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc4
	add r6, r1, #0
	mov r1, #0x14
	add r5, r2, #0
	bl _u32_div_f
	ldr r2, _02097FF0 ; =_02108F4C
	lsl r1, r1, #2
	add r4, r2, r1
	ldrh r1, [r2, r1]
	add r0, sp, #0
	bl WildEncounters_ReadFromNarc
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _02097FD8
	cmp r0, #1
	beq _02097FC8
	cmp r0, #2
	beq _02097FD0
	b _02097FDE
_02097FC8:
	add r0, sp, #0x80
	ldrh r0, [r0, #0x3e] ; swarmSpecies[1]
	strh r0, [r5]
	b _02097FDE
_02097FD0:
	add r0, sp, #0xc0
	ldrh r0, [r0, #2] ; swarmSpecies[3]
	strh r0, [r5]
	b _02097FDE
_02097FD8:
	add r0, sp, #0x80
	ldrh r0, [r0, #0x3c] ; swarmSpecies[0]
	strh r0, [r5]
_02097FDE:
	ldrh r0, [r5]
	cmp r0, #0
	bne _02097FE8
	bl GF_AssertFail
_02097FE8:
	ldrh r0, [r4]
	strh r0, [r6]
	add sp, #0xc4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02097FF0: .word _02108F4C
	thumb_func_end sub_02097F9C

	.rodata

_02108F4C:
	.short MAP_R01, 0x0000
	.short MAP_R03, 0x0000
	.short MAP_R09, 0x0000
	.short MAP_R12, 0x0002
	.short MAP_R13, 0x0000
	.short MAP_W19, 0x0001
	.short MAP_R32, 0x0002
	.short MAP_R25, 0x0000
	.short MAP_R27, 0x0001
	.short MAP_R34, 0x0000
	.short MAP_R35, 0x0000
	.short MAP_R38, 0x0000
	.short MAP_R44, 0x0002
	.short MAP_R45, 0x0000
	.short MAP_R47, 0x0000
	.short MAP_D38R0101, 0x0000
	.short MAP_D42R0102, 0x0000
	.short MAP_D46R0101, 0x0000
	.short MAP_T06, 0x0001
	.short MAP_T22, 0x0002
