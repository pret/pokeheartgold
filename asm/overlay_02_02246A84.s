#include "constants/abilities.h"
#include "constants/species.h"
#include "constants/sndseq.h"
#include "constants/items.h"
#include "constants/pokemon.h"
#include "constants/std_script.h"
	.include "asm/macros.inc"
	.include "overlay_02.inc"
	.include "global.inc"

	.text

    .extern ov02_02248418

	thumb_func_start ov02_02248444
ov02_02248444: ; 0x02248444
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	beq _02248470
	bl LCRandom
	ldr r1, _02248554 ; =ov02_022532B4 + 0x24 - 0x48
	lsr r2, r0, #0x1f
	ldr r3, [r1, #0x48]
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	add sp, #0x18
	ldrb r0, [r3, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02248470:
	mov r0, #4
	mov r1, #0x1c
	bl Heap_AllocAtEnd
	str r0, [sp, #8]
	mov r0, #4
	mov r1, #0x1c
	bl Heap_AllocAtEnd
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	mov r1, #0
	mov r2, #0x1c
	bl MI_CpuFill8
	ldr r0, [sp, #4]
	mov r1, #0
	mov r2, #0x1c
	bl MI_CpuFill8
	bl GetRadioMusicPlayingSeq
	cmp r0, #6
	bne _022484A4
	mov r0, #1
	str r0, [sp, #0xc]
_022484A4:
	ldr r0, [sp]
	mov r6, #0
	ldr r0, [r0, #0x18]
	mov r1, #1
	add r7, r6, #0
	bl Pokedex_GetSeenFormNum_Unown
	lsl r0, r0, #0x18
	add r1, r6, #0
	lsr r0, r0, #0x18
	ldr r4, _02248558 ; =ov02_022532B4
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
_022484BE:
	ldr r1, [sp]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	beq _02248500
	ldr r0, [r4]
	mov r5, #0
	cmp r0, #0
	ble _02248500
_022484D2:
	ldr r2, [r4, #4]
	ldr r0, [sp]
	ldrb r2, [r2, r5]
	ldr r0, [r0, #0x18]
	ldr r1, [sp, #0x14]
	bl ov02_02248418
	cmp r0, #0
	bne _022484EE
	ldr r0, [r4, #4]
	ldrb r1, [r0, r5]
	ldr r0, [sp, #4]
	strb r1, [r0, r6]
	add r6, r6, #1
_022484EE:
	ldr r0, [r4, #4]
	ldrb r1, [r0, r5]
	ldr r0, [sp, #8]
	add r5, r5, #1
	strb r1, [r0, r7]
	ldr r0, [r4]
	add r7, r7, #1
	cmp r5, r0
	blt _022484D2
_02248500:
	ldr r0, [sp, #0x10]
	add r4, #8
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _022484BE
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02248534
	cmp r6, #0
	ble _02248534
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	cmp r1, #0x32
	bge _02248534
	bl LCRandom
	add r1, r6, #0
	bl _s32_div_f
	ldr r0, [sp, #4]
	ldrb r4, [r0, r1]
	b _02248542
_02248534:
	bl LCRandom
	add r1, r7, #0
	bl _s32_div_f
	ldr r0, [sp, #8]
	ldrb r4, [r0, r1]
_02248542:
	ldr r0, [sp, #4]
	bl Heap_Free
	ldr r0, [sp, #8]
	bl Heap_Free
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02248554: .word ov02_022532B4 + 0x24 - 0x48
_02248558: .word ov02_022532B4
	thumb_func_end ov02_02248444

	thumb_func_start ov02_0224855C
ov02_0224855C: ; 0x0224855C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldrb r0, [r5, #0xd]
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #0
	bne _02248576
	ldrb r0, [r5, #0xe]
	cmp r0, #0xe
	bne _02248576
	mov r2, #1
	b _02248578
_02248576:
	mov r2, #0
_02248578:
	ldr r1, [r6]
	add r0, r4, #0
	bl WildMonSetRandomHeldItem
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r0, #SPECIES_UNOWN
	bne _022485A2
	add r0, r5, #0
	bl ov02_02248444
	add r1, sp, #0
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0x70
	add r2, sp, #0
	bl SetMonData
_022485A2:
	lsl r0, r7, #2
	add r0, r6, r0
	ldr r0, [r0, #4]
	add r1, r4, #0
	bl Party_AddMon
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224855C

	thumb_func_start ov02_022485B0
ov02_022485B0: ; 0x022485B0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r2, #0xd]
	add r6, r1, #0
	add r4, r3, #0
	cmp r0, #0
	bne _02248614
	ldrb r0, [r2, #0xe]
	cmp r0, #0x48
	beq _022485CC
	cmp r0, #0x37
	beq _022485CC
	cmp r0, #0x2e
	bne _02248614
_022485CC:
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _022485E6
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_022485E6:
	mov r7, #0
	cmp r6, #0
	ble _02248610
_022485EC:
	lsl r2, r4, #3
	lsl r0, r7, #3
	add r3, r5, r2
	add r1, r5, r0
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	cmp r0, r2
	bne _02248606
	ldrh r1, [r1, #4]
	ldrh r0, [r3, #4]
	cmp r1, r0
	bls _02248606
	add r4, r7, #0
_02248606:
	add r0, r7, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	cmp r7, r6
	blt _022485EC
_02248610:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_02248614:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_022485B0

	thumb_func_start ov02_02248618
ov02_02248618: ; 0x02248618
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	add r5, r3, #0
	bl GetMonData
	cmp r0, #0
	bne _0224863C
	mov r2, #0
	add r0, r4, #0
	mov r1, #0xa
	strb r2, [r5, #0xd]
	bl GetMonData
	b _02248642
_0224863C:
	mov r0, #1
	strb r0, [r5, #0xd]
	mov r0, #NUM_ABILITIES
_02248642:
	strb r0, [r5, #0xe]
	mov r0, #0
	strb r0, [r5, #0xc]
	str r0, [r5, #4]
	str r0, [r5, #8]
	strb r0, [r5, #0xf]
	strb r0, [r5, #0x10]
	ldr r0, [r7, #0xc]
	bl Save_VarsFlags_Get
	add r6, r0, #0
	ldr r0, [r7, #0x20]
	ldr r1, [r0]
	ldr r0, _02248694 ; =0x000001EB
	cmp r1, r0
	bne _02248666
	mov r0, #1
	b _02248668
_02248666:
	mov r0, #0
_02248668:
	strb r0, [r5, #0x11]
	mov r4, #0
_0224866C:
	add r0, r6, #0
	add r1, r4, #0
	bl Save_VarsFlags_CheckAlphPuzzleFlag
	add r1, r5, r4
	add r4, r4, #1
	strb r0, [r1, #0x12]
	cmp r4, #4
	blt _0224866C
	ldr r0, [r7, #0xc]
	bl Save_Pokedex_Get
	str r0, [r5, #0x18]
	ldr r0, [r7, #0xc]
	bl Save_PlayerData_GetProfile
	bl PlayerProfile_GetTrainerID
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02248694: .word 0x000001EB
	thumb_func_end ov02_02248618

	thumb_func_start ov02_02248698
ov02_02248698: ; 0x02248698
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #0
	cmp r0, #3
	bhi _022486F8
	add r2, r0, r0
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_022486B8: ; jump table
	.short _022486C0 - _022486B8 - 2 ; case 0
	.short _022486CE - _022486B8 - 2 ; case 1
	.short _022486DC - _022486B8 - 2 ; case 2
	.short _022486EA - _022486B8 - 2 ; case 3
_022486C0:
	add r2, r4, #0
	add r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #1
	bne _022486FE
	mov r1, #1
	b _022486FE
_022486CE:
	add r2, r4, #0
	add r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #0
	bne _022486FE
	mov r1, #1
	b _022486FE
_022486DC:
	add r2, r4, #0
	add r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #3
	bne _022486FE
	mov r1, #1
	b _022486FE
_022486EA:
	add r2, r4, #0
	add r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #2
	bne _022486FE
	mov r1, #1
	b _022486FE
_022486F8:
	bl GF_AssertFail
	pop {r4, pc}
_022486FE:
	cmp r1, #0
	beq _0224871C
	add r1, r4, #0
	add r1, #0x7c
	ldrh r2, [r1]
	ldr r1, _02248724 ; =0x0000FFFF
	cmp r2, r1
	bhs _0224871C
	add r1, r4, #0
	add r1, #0x7c
	ldrh r1, [r1]
	add r2, r1, #1
	add r1, r4, #0
	add r1, #0x7c
	strh r2, [r1]
_0224871C:
	add r4, #0x7a
	strh r0, [r4]
	pop {r4, pc}
	nop
_02248724: .word 0x0000FFFF
	thumb_func_end ov02_02248698

    .rodata

ov02_02253288:
	.byte 0x1A, 0x1B, 0x00, 0x00

ov02_0225328C:
	.byte 0x16, 0x17, 0x18, 0x19

    .global ov02_02253290
ov02_02253290: ; 0x02253290
    .word 2

    .global ov02_02253294
ov02_02253294: ; 0x02253294
    .word 0, 2, 3

    .global ov02_022532A0
ov02_022532A0: ; 0x022532A0
    .word 0, 1, 2, 3, 4

ov02_022532B4: ; 0x022532B4
	.word 0x0A, ov02_022532EC
	.word 0x05, ov02_022532DC
	.word 0x07, ov02_022532E4
	.word 0x04, ov02_0225328C
	.word 0x02, ov02_02253288

ov02_022532DC:
	.byte 0x11, 0x12, 0x13, 0x14, 0x15, 0x00, 0x00, 0x00

ov02_022532E4:
	.byte 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x00

ov02_022532EC:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x00, 0x00
