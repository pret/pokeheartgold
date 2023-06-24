#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/trainer_class.h"
	.include "asm/macros.inc"
	.include "unk_020517A4.inc"
	.include "global.inc"

	.rodata

_020FC3B4:
	.short SPECIES_RAIKOU | (22 << 10)
	.short SPECIES_ENTEI | (23 << 10)
	.short SPECIES_SUICUNE | (24 << 10)
	.short SPECIES_LUGIA | (26 << 10)
	.short SPECIES_HO_OH | (25 << 10)
	.short SPECIES_GROUDON | (27 << 10)
	.short SPECIES_KYOGRE | (27 << 10)
	.short SPECIES_RAYQUAZA | (27 << 10)
	.short SPECIES_MEWTWO | (28 << 10)
	.short SPECIES_LATIOS | (28 << 10)
	.short SPECIES_LATIAS | (28 << 10)
_020FC3CA:
	.short TRAINERCLASS_LEADER_FALKNER | (0 << 10)
	.short TRAINERCLASS_LEADER_BUGSY | (1 << 10)
	.short TRAINERCLASS_LEADER_WHITNEY | (2 << 10)
	.short TRAINERCLASS_LEADER_MORTY | (3 << 10)
	.short TRAINERCLASS_LEADER_JASMINE | (4 << 10)
	.short TRAINERCLASS_LEADER_CHUCK | (5 << 10)
	.short TRAINERCLASS_LEADER_PRYCE | (6 << 10)
	.short TRAINERCLASS_LEADER_CLAIR | (7 << 10)
	.short TRAINERCLASS_LEADER_BROCK | (8 << 10)
	.short TRAINERCLASS_LEADER_MISTY | (9 << 10)
	.short TRAINERCLASS_LEADER_LT_SURGE | (10 << 10)
	.short TRAINERCLASS_LEADER_ERIKA | (11 << 10)
	.short TRAINERCLASS_LEADER_JANINE | (12 << 10)
	.short TRAINERCLASS_LEADER_SABRINA | (13 << 10)
	.short TRAINERCLASS_LEADER_BLAINE | (14 << 10)
	.short TRAINERCLASS_LEADER_BLUE | (15 << 10)
	.short TRAINERCLASS_ELITE_FOUR_WILL | (16 << 10)
	.short TRAINERCLASS_ELITE_FOUR_KOGA | (17 << 10)
	.short TRAINERCLASS_ELITE_FOUR_BRUNO | (18 << 10)
	.short TRAINERCLASS_ELITE_FOUR_KAREN | (19 << 10)
	.short TRAINERCLASS_CHAMPION | (20 << 10)
	.short TRAINERCLASS_RIVAL | (21 << 10)
	.short TRAINERCLASS_PASSERBY | (21 << 10)
	.short TRAINERCLASS_EXECUTIVE_ARCHER | (32 << 10)
	.short TRAINERCLASS_EXECUTIVE_ARIANA | (33 << 10)
	.short TRAINERCLASS_EXECUTIVE_PROTON | (31 << 10)
	.short TRAINERCLASS_EXECUTIVE_PETREL | (30 << 10)
	.short TRAINERCLASS_ROCKET_BOSS | (34 << 10)
	.short TRAINERCLASS_TEAM_ROCKET | (29 << 10)
	.short TRAINERCLASS_TEAM_ROCKET_F | (29 << 10)
	.short TRAINERCLASS_KIMONO_GIRL | (43 << 10)
	.short TRAINERCLASS_PKMN_TRAINER_RED | (44 << 10)
_020FC40A:
	.short 12, SEQ_GS_VS_GYMREADER         ; 00
	.short 13, SEQ_GS_VS_GYMREADER         ; 01
	.short 14, SEQ_GS_VS_GYMREADER         ; 02
	.short 15, SEQ_GS_VS_GYMREADER         ; 03
	.short 16, SEQ_GS_VS_GYMREADER         ; 04
	.short 17, SEQ_GS_VS_GYMREADER         ; 05
	.short 18, SEQ_GS_VS_GYMREADER         ; 06
	.short 19, SEQ_GS_VS_GYMREADER         ; 07
	.short 20, SEQ_GS_VS_GYMREADER_KANTO   ; 08
	.short 21, SEQ_GS_VS_GYMREADER_KANTO   ; 09
	.short 22, SEQ_GS_VS_GYMREADER_KANTO   ; 10
	.short 23, SEQ_GS_VS_GYMREADER_KANTO   ; 11
	.short 24, SEQ_GS_VS_GYMREADER_KANTO   ; 12
	.short 25, SEQ_GS_VS_GYMREADER_KANTO   ; 13
	.short 26, SEQ_GS_VS_GYMREADER_KANTO   ; 14
	.short 27, SEQ_GS_VS_GYMREADER_KANTO   ; 15
	.short 29, SEQ_GS_VS_GYMREADER         ; 16
	.short 30, SEQ_GS_VS_GYMREADER         ; 17
	.short 31, SEQ_GS_VS_GYMREADER         ; 18
	.short 32, SEQ_GS_VS_GYMREADER         ; 19
	.short 33, SEQ_GS_VS_CHAMP             ; 20
	.short 28, SEQ_GS_VS_RIVAL             ; 21
	.short 0xFFFF, SEQ_GS_VS_RAIKOU        ; 22
	.short 0xFFFF, SEQ_GS_VS_ENTEI         ; 23
	.short 0xFFFF, SEQ_GS_VS_SUICUNE       ; 24
	.short 35, SEQ_GS_VS_HOUOU             ; 25
	.short 36, SEQ_GS_VS_LUGIA             ; 26
	.short 34, SEQ_GS_VS_KODAI             ; 27
	.short 34, SEQ_GS_VS_NORAPOKE_KANTO    ; 28
	.short 39, SEQ_GS_VS_ROCKET            ; 29
	.short 40, SEQ_GS_VS_ROCKET            ; 30
	.short 41, SEQ_GS_VS_ROCKET            ; 31
	.short 42, SEQ_GS_VS_ROCKET            ; 32
	.short 43, SEQ_GS_VS_ROCKET            ; 33
	.short 44, SEQ_GS_VS_ROCKET            ; 34
	.short 37, SEQ_GS_VS_TRAINER           ; 35
	.short 37, SEQ_GS_VS_TRAINER           ; 36
	.short 38, SEQ_GS_VS_TRAINER           ; 37
	.short 38, SEQ_GS_VS_NORAPOKE          ; 38
	.short 37, SEQ_GS_BA_BRAIN             ; 39
	.short 38, SEQ_GS_VS_GYMREADER         ; 40
	.short 0xFFFF, SEQ_GS_VS_TRAINER       ; 41
	.short 0xFFFF, SEQ_GS_VS_NORAPOKE      ; 42
	.short 45, SEQ_GS_VS_TRAINER           ; 43
	.short 46, SEQ_GS_VS_CHAMP             ; 44

	.text

	thumb_func_start BattleSetup_GetTransitionAndMusicParam
BattleSetup_GetTransitionAndMusicParam: ; 0x02051738
	push {r4, lr}
	add r2, r0, #0
	ldr r4, [r2]
	mov r0, #1
	tst r0, r4
	beq _02051788
	add r2, #0x5d ; ->trainers[1].trainerClass
	ldrb r0, [r2]
	bl NPCTrainerGetBattleIntroAndMusicParam
	mov r1, #0x80
	tst r1, r4
	beq _02051764
	cmp r0, #39
	beq _020517A0
	mov r0, #2
	tst r0, r4
	beq _02051760
	mov r0, #37
	pop {r4, pc}
_02051760:
	mov r0, #35
	pop {r4, pc}
_02051764:
	cmp r0, #29
	blo _0205176C
	cmp r0, #34
	bls _020517A0
_0205176C:
	cmp r0, #43
	beq _020517A0
	cmp r0, #44
	beq _020517A0
	mov r1, #2
	tst r1, r4
	beq _0205177E
	mov r0, #37
	pop {r4, pc}
_0205177E:
	mov r1, #4
	tst r1, r4
	beq _020517A0
	mov r0, #36
	pop {r4, pc}
_02051788:
	mov r1, #0x56
	lsl r1, r1, #2
	ldr r0, [r2, #8] ; ->parties[1]
	ldr r1, [r2, r1]
	bl WildPokemonGetBattleIntroAndMusicParam
	cmp r0, #42
	blo _020517A0
	mov r1, #2
	tst r1, r4
	beq _020517A0
	mov r0, #38
_020517A0:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BattleSetup_GetTransitionAndMusicParam

	thumb_func_start BattleStartGetTransition
BattleStartGetTransition: ; 0x020517A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0x2d
	blo _020517B2
	bl GF_AssertFail
_020517B2:
	ldr r0, _020517C8 ; =_020FC40A
	lsl r1, r5, #2
	ldrh r0, [r0, r1]
	ldr r1, _020517CC ; =0x0000FFFF
	cmp r0, r1
	bne _020517C4
	add r0, r4, #0
	bl ov01_021F0D20
_020517C4:
	pop {r3, r4, r5, pc}
	nop
_020517C8: .word _020FC40A
_020517CC: .word 0x0000FFFF
	thumb_func_end BattleStartGetTransition

	thumb_func_start BattleStartGetMusic
BattleStartGetMusic: ; 0x020517D0
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x2d
	blo _020517DC
	bl GF_AssertFail
_020517DC:
	ldr r0, _020517E4 ; =_020FC40A + 2
	lsl r1, r4, #2
	ldrh r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_020517E4: .word _020FC40A + 2
	thumb_func_end BattleStartGetMusic

	thumb_func_start sub_020517E8
sub_020517E8: ; 0x020517E8
	push {r4, lr}
	add r4, r0, #0
	bl BattleSetup_GetTransitionAndMusicParam
	add r1, r4, #0
	bl BattleStartGetTransition
	pop {r4, pc}
	thumb_func_end sub_020517E8

	thumb_func_start sub_020517F8
sub_020517F8: ; 0x020517F8
	mov r0, #1
	bx lr
	thumb_func_end sub_020517F8

	thumb_func_start sub_020517FC
sub_020517FC: ; 0x020517FC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl BattleSetup_GetTransitionAndMusicParam
	add r1, r5, #0
	add r6, r0, #0
	bl BattleStartGetMusic
	add r4, r0, #0
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl Save_VarsFlags_Get
	mov r1, #2
	mov r2, #5
	bl Save_VarsFlags_FlypointFlagAction
	cmp r0, #1
	bne _0205185C
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl MapHeader_IsKanto
	cmp r0, #0
	beq _0205185C
	ldr r1, _02051860 ; =0x0000045C
	cmp r4, r1
	bne _0205183E
	add r4, r1, #0
	add r4, #9
	b _0205185C
_0205183E:
	add r0, r1, #1
	cmp r4, r0
	bne _0205184A
	add r4, r1, #0
	add r4, #0xa
	b _0205185C
_0205184A:
	add r0, r1, #2
	cmp r4, r0
	bne _0205185C
	add r0, r6, #0
	bl sub_020517F8
	cmp r0, #0
	bne _0205185C
	ldr r4, _02051864 ; =0x00000467
_0205185C:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02051860: .word 0x0000045C
_02051864: .word 0x00000467
	thumb_func_end sub_020517FC

	thumb_func_start NPCTrainerGetBattleIntroAndMusicParam
NPCTrainerGetBattleIntroAndMusicParam: ; 0x02051868
	ldr r3, _02051890 ; =_020FC3CA
	mov r2, #0
_0205186C:
	ldrh r1, [r3]
	lsl r1, r1, #0x16
	lsr r1, r1, #0x16
	cmp r0, r1
	bne _02051882
	ldr r0, _02051890 ; =_020FC3CA
	lsl r1, r2, #1
	ldrh r0, [r0, r1]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1a
	bx lr
_02051882:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #0x20
	blo _0205186C
	mov r0, #0x29
	bx lr
	nop
_02051890: .word _020FC3CA
	thumb_func_end NPCTrainerGetBattleIntroAndMusicParam

	thumb_func_start WildPokemonGetBattleIntroAndMusicParam
WildPokemonGetBattleIntroAndMusicParam: ; 0x02051894
	push {r4, lr}
	add r4, r1, #0
	bl GetFirstAliveMonInParty_CrashIfNone
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r4, #0x6d
	bne _020518AC
	mov r0, #0x2a
	pop {r4, pc}
_020518AC:
	ldr r3, _020518D4 ; =_020FC3B4
	mov r2, #0
_020518B0:
	ldrh r1, [r3]
	lsl r1, r1, #0x16
	lsr r1, r1, #0x16
	cmp r0, r1
	bne _020518C6
	ldr r0, _020518D4 ; =_020FC3B4
	lsl r1, r2, #1
	ldrh r0, [r0, r1]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1a
	pop {r4, pc}
_020518C6:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #0xb
	blo _020518B0
	mov r0, #0x2a
	pop {r4, pc}
	nop
_020518D4: .word _020FC3B4
	thumb_func_end WildPokemonGetBattleIntroAndMusicParam
