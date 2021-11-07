	.include "asm/macros.inc"
	.include "global.inc"
#include "constants/items.h"
#include "constants/species.h"

	.text

	thumb_func_start ov21_022598C0
ov21_022598C0: ; 0x022598C0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r6, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	mov r4, #0
	ldr r7, _02259908 ; =_022599F0
	str r0, [sp]
	add r5, r4, #0
_022598E0:
	ldr r0, [r6, #0xc]
	bl Sav2_Bag_get
	lsl r1, r4, #2
	ldrh r1, [r7, r1]
	mov r2, #4
	bl Bag_GetQuantity
	add r0, r5, r0
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #7
	blo _022598E0
	ldr r0, [sp]
	strh r5, [r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02259908: .word _022599F0
	thumb_func_end ov21_022598C0

	thumb_func_start ScrCmd_432
ScrCmd_432: ; 0x0225990C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	mov r5, #0
	ldr r2, _02259958 ; =_022599F0
	strh r5, [r4]
_02259938:
	lsl r3, r5, #2
	ldrh r1, [r2, r3]
	cmp r0, r1
	bne _02259948
	ldr r0, _0225995C ; =_022599F0 + 2
	ldrh r0, [r0, r3]
	strh r0, [r4]
	b _02259952
_02259948:
	add r1, r5, #1
	lsl r1, r1, #0x10
	lsr r5, r1, #0x10
	cmp r5, #7
	blo _02259938
_02259952:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02259958: .word _022599F0
_0225995C: .word _022599F0 + 2
	thumb_func_end ScrCmd_432

	thumb_func_start ScrCmd_433
ScrCmd_433: ; 0x02259960
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #8]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #4]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	str r0, [sp]
	mov r4, #0
	ldr r0, [sp, #8]
	add r5, r4, #0
	strh r4, [r0]
	ldr r0, [sp, #4]
	strh r4, [r0]
_022599B0:
	ldr r0, [r6, #0xc]
	lsl r7, r4, #2
	bl Sav2_Bag_get
	ldr r1, _022599EC ; =_022599F0
	mov r2, #4
	ldrh r1, [r1, r7]
	bl Bag_GetQuantity
	add r0, r5, r0
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	ldr r0, [sp]
	cmp r5, r0
	blo _022599DC
	ldr r0, _022599EC ; =_022599F0
	ldrh r1, [r0, r7]
	ldr r0, [sp, #8]
	strh r1, [r0]
	ldr r0, [sp, #4]
	strh r4, [r0]
	b _022599E6
_022599DC:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #7
	blo _022599B0
_022599E6:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022599EC: .word _022599F0
	thumb_func_end ScrCmd_433

	.rodata

_022599F0:
	.short ITEM_OLD_AMBER, SPECIES_AERODACTYL
	.short ITEM_HELIX_FOSSIL, SPECIES_OMANYTE
	.short ITEM_DOME_FOSSIL, SPECIES_KABUTO
	.short ITEM_ROOT_FOSSIL, SPECIES_LILEEP
	.short ITEM_CLAW_FOSSIL, SPECIES_ANORITH
	.short ITEM_ARMOR_FOSSIL, SPECIES_SHIELDON
	.short ITEM_SKULL_FOSSIL, SPECIES_CRANIDOS
