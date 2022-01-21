#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "party_menu.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02067608
sub_02067608: ; 0x02067608
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0202D9F4
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl RoamerLocationSetRandom
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02067608

	thumb_func_start Save_UpdateRoamersOnConnection
Save_UpdateRoamersOnConnection: ; 0x02067620
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r5, #0
_02067626:
	add r0, r4, #0
	add r1, r5, #0
	bl GetRoamerIsActiveByIndex
	cmp r0, #0
	beq _0206763A
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02067608
_0206763A:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _02067626
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end Save_UpdateRoamersOnConnection

	thumb_func_start sub_02067648
sub_02067648: ; 0x02067648
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r4, #0
	mov r6, #0x1c
_02067650:
	add r0, r5, #0
	add r1, r4, #0
	bl GetRoamerIsActiveByIndex
	cmp r0, #0
	beq _0206768A
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r0, r0, #0x1c
	sub r0, r0, r1
	ror r0, r6
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _0206767A
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02067608
	b _0206768A
_0206767A:
	add r0, r5, #0
	bl sub_0202D9F4
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl RoamerLocationUpdate
_0206768A:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02067650
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02067648

	thumb_func_start sub_02067698
sub_02067698: ; 0x02067698
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x29
	blo _020676A4
	bl GF_AssertFail
_020676A4:
	ldr r0, _020676AC ; =sRoamerLocations
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_020676AC: .word sRoamerLocations
	thumb_func_end sub_02067698

	thumb_func_start sub_020676B0
sub_020676B0: ; 0x020676B0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r5, #0
_020676B6:
	add r0, r4, #0
	add r1, r5, #0
	bl GetRoamerIsActiveByIndex
	cmp r0, #0
	beq _020676C6
	mov r0, #1
	pop {r3, r4, r5, pc}
_020676C6:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _020676B6
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020676B0

	thumb_func_start sub_020676D4
sub_020676D4: ; 0x020676D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020676B0
	cmp r0, #0
	beq _020676EA
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202D9E8
_020676EA:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020676D4

	thumb_func_start Save_CreateRoamerByID
Save_CreateRoamerByID: ; 0x020676EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r1, [sp, #0x10]
	add r7, r0, #0
	bl Save_Roamers_get
	ldr r1, [sp, #0x10]
	str r0, [sp, #0x14]
	bl Roamers_GetRoamMonStats
	add r4, r0, #0
	ldr r0, [sp, #0x10]
	cmp r0, #3
	bhi _02067736
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02067714: ; jump table
	.short _0206771C - _02067714 - 2 ; case 0
	.short _02067722 - _02067714 - 2 ; case 1
	.short _02067728 - _02067714 - 2 ; case 2
	.short _02067730 - _02067714 - 2 ; case 3
_0206771C:
	mov r6, #SPECIES_RAIKOU
	mov r5, #40
	b _0206773E
_02067722:
	mov r6, #SPECIES_ENTEI
	mov r5, #40
	b _0206773E
_02067728:
	mov r6, #SPECIES_LATIAS>>2
	lsl r6, r6, #2
	mov r5, #35
	b _0206773E
_02067730:
	ldr r6, _020677F0 ; =SPECIES_LATIOS
	mov r5, #35
	b _0206773E
_02067736:
	bl GF_AssertFail
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_0206773E:
	add r0, r4, #0
	mov r1, #4
	add r2, r6, #0
	bl SetRoamerData
	add r0, r4, #0
	mov r1, #6
	add r2, r5, #0
	bl SetRoamerData
	add r0, r7, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #0x18]
	mov r0, #4
	bl AllocMonZeroed
	add r7, r0, #0
	bl ZeroMonData
	ldr r0, [sp, #0x18]
	bl PlayerProfile_GetTrainerID_VisibleHalf
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	mov r3, #0x20
	bl CreateMon
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl SetRoamerData
	add r0, r4, #0
	mov r1, #8
	mov r2, #1
	bl SetRoamerData
	add r0, r7, #0
	mov r1, #MON_DATA_IVS_WORD
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #2
	bl SetRoamerData
	mov r1, #MON_DATA_PERSONALITY
	add r0, r7, #0
	add r2, r1, #0
	bl GetMonData
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #3
	bl SetRoamerData
	add r0, r7, #0
	mov r1, #MON_DATA_MAXHP
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #5
	bl SetRoamerData
	add r0, r7, #0
	bl FreeToHeap
	ldr r0, [sp, #0x14]
	bl sub_0202D9F4
	add r2, r0, #0
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	bl RoamerLocationSetRandom
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_020677F0: .word 0x0000017D
	thumb_func_end Save_CreateRoamerByID

	thumb_func_start SpeciesToRoamerIdx
SpeciesToRoamerIdx: ; 0x020677F4
	push {r3, lr}
	mov r1, #SPECIES_LATIAS>>2
	lsl r1, r1, #2
	cmp r0, r1
	bgt _02067810
	bge _02067824
	cmp r0, #SPECIES_ENTEI
	bgt _02067828
	cmp r0, #SPECIES_RAIKOU
	blt _02067828
	beq _02067818
	cmp r0, #SPECIES_ENTEI
	beq _0206781C
	b _02067828
_02067810:
	add r1, r1, #SPECIES_LATIOS-SPECIES_LATIAS
	cmp r0, r1
	beq _02067820
	b _02067828
_02067818:
	mov r0, #0
	pop {r3, pc}
_0206781C:
	mov r0, #1
	pop {r3, pc}
_02067820:
	mov r0, #3
	pop {r3, pc}
_02067824:
	mov r0, #2
	pop {r3, pc}
_02067828:
	bl GF_AssertFail
	mov r0, #4
	pop {r3, pc}
	thumb_func_end SpeciesToRoamerIdx

	thumb_func_start RoamerLocationSetRandom
RoamerLocationSetRandom: ; 0x02067830
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	add r7, r2, #0
	bl Roamer_GetLocation
	lsl r1, r0, #2
	ldr r0, _02067880 ; =sRoamerLocations
	ldr r6, [r0, r1]
	ldr r0, [sp, #4]
	cmp r0, #1
	bhi _02067850
	mov r4, #0x10
	mov r5, #0
	b _02067854
_02067850:
	mov r4, #0x19
	mov r5, #0x10
_02067854:
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	add r0, r5, r1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, _02067880 ; =sRoamerLocations
	lsl r1, r2, #2
	ldr r3, [r0, r1]
	cmp r3, r7
	beq _02067854
	cmp r3, r6
	beq _02067854
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ApplyRoamerLocation
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02067880: .word sRoamerLocations
	thumb_func_end RoamerLocationSetRandom

	thumb_func_start RoamerLocationUpdate
RoamerLocationUpdate: ; 0x02067884
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	add r6, r2, #0
	bl Roamer_GetLocation
	mov r1, #0xe
	ldr r2, _0206790C ; =sRoamerAdjacencyTable
	mul r1, r0
	ldrh r0, [r2, r1]
	add r4, r2, r1
	cmp r0, #1
	bne _020678CA
	ldrh r0, [r4, #2]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, _02067910 ; =sRoamerLocations
	lsl r1, r2, #2
	ldr r3, [r0, r1]
	cmp r3, r6
	bne _020678BE
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r6, #0
	bl RoamerLocationSetRandom
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_020678BE:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ApplyRoamerLocation
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_020678CA:
	ldr r7, _02067910 ; =sRoamerLocations
_020678CC:
	ldrh r5, [r4]
	cmp r5, #0
	bne _020678D6
	bl GF_AssertFail
_020678D6:
	cmp r5, #1
	bhi _020678DE
	mov r0, #0
	b _020678EC
_020678DE:
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
_020678EC:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x17
	add r0, r4, r0
	ldrh r0, [r0, #2]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	lsl r0, r2, #2
	ldr r3, [r7, r0]
	cmp r3, r6
	beq _020678CC
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ApplyRoamerLocation
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206790C: .word sRoamerAdjacencyTable
_02067910: .word sRoamerLocations
	thumb_func_end RoamerLocationUpdate

	thumb_func_start ApplyRoamerLocation
ApplyRoamerLocation: ; 0x02067914
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl Roamers_GetRoamMonStats
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl Roamer_SetLocation
	ldr r0, [sp]
	mov r1, #1
	add r2, r7, #0
	bl SetRoamerData
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ApplyRoamerLocation

	.rodata

sRoamerLocations:
; Johto
	.word MAP_R29
	.word MAP_R30
	.word MAP_R31
	.word MAP_R32
	.word MAP_R33
	.word MAP_R34
	.word MAP_R35
	.word MAP_R36
	.word MAP_R37
	.word MAP_R38
	.word MAP_R39
	.word MAP_R42
	.word MAP_R43
	.word MAP_R44
	.word MAP_R45
	.word MAP_R46
; Kanto
	.word MAP_R01
	.word MAP_R02
	.word MAP_R03
	.word MAP_R04
	.word MAP_R05
	.word MAP_R06
	.word MAP_R07
	.word MAP_R08
	.word MAP_R09
	.word MAP_R10
	.word MAP_R11
	.word MAP_R12
	.word MAP_R13
	.word MAP_R14
	.word MAP_R15
	.word MAP_R16
	.word MAP_R17
	.word MAP_R18
	.word MAP_W19
	.word MAP_W20
	.word MAP_W21
	.word MAP_R22
	.word MAP_R24
	.word MAP_R26
	.word MAP_R28

	; Structure: number of entries in row, followed by entries.
	; Extra entries are filled with FF.
	; Each entry indexes the above array of map IDs.
	; In this way, the roamer's movements are limited to adjacent
	; maps.
sRoamerAdjacencyTable:
; Johto
	.short      2,      1,     15, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      2,      0,      2, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      3,      1,      3,      7, 0xFFFF, 0xFFFF, 0xFFFF
	.short      3,      2,      4,      7, 0xFFFF, 0xFFFF, 0xFFFF
	.short      2,      3,      5, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      2,      4,      6, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      2,      5,      7, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      3,      2,      3,      8, 0xFFFF, 0xFFFF, 0xFFFF
	.short      3,      7,      9,     11, 0xFFFF, 0xFFFF, 0xFFFF
	.short      3,      8,     10,     11, 0xFFFF, 0xFFFF, 0xFFFF
	.short      1,      9, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      4,      8,      9,     12,     13, 0xFFFF, 0xFFFF
	.short      2,     11,     13, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      3,     11,     12,     15, 0xFFFF, 0xFFFF, 0xFFFF
	.short      2,     13,     15, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      2,      0,     14, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
; Kanto
	.short      2,     17,     37, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      3,     16,     37,     18, 0xFFFF, 0xFFFF, 0xFFFF
	.short      2,     17,     19, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      3,     18,     20,     38, 0xFFFF, 0xFFFF, 0xFFFF
	.short      6,     19,     21,     22,     23,     24,     38
	.short      3,     22,     23,     26, 0xFFFF, 0xFFFF, 0xFFFF
	.short      4,     20,     21,     23,     31, 0xFFFF, 0xFFFF
	.short      5,     20,     21,     22,     25,     27, 0xFFFF
	.short      4,     19,     20,     25,     38, 0xFFFF, 0xFFFF
	.short      3,     23,     24,     27, 0xFFFF, 0xFFFF, 0xFFFF
	.short      2,     21,     27, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      4,     23,     25,     26,     28, 0xFFFF, 0xFFFF
	.short      2,     27,     29, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      2,     28,     30, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      3,     29,     33,     34, 0xFFFF, 0xFFFF, 0xFFFF
	.short      2,     22,     37, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      2,     31,     33, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      3,     30,     32,     34, 0xFFFF, 0xFFFF, 0xFFFF
	.short      2,     30,     33, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      2,     34,     36, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      2,     16,     34, 0xFFFF, 0xFFFF, 0xFFFF,      0
	.short      4,     16,     17,     39,     40, 0xFFFF, 0xFFFF
	.short      3,     19,     20,     24, 0xFFFF, 0xFFFF, 0xFFFF
	.short      2,     37,     40, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.short      3,     37,     39,     24, 0xFFFF, 0xFFFF, 0xFFFF
