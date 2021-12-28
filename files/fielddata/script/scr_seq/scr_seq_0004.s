#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0004_004A ; 000
	scrdef scr_seq_0004_02A8 ; 001
	scrdef scr_seq_0004_0BD5 ; 002
	scrdef scr_seq_0004_0C1B ; 003
	scrdef scr_seq_0004_0E66 ; 004
	scrdef scr_seq_0004_0E68 ; 005
	scrdef scr_seq_0004_0E6A ; 006
	scrdef scr_seq_0004_0E6C ; 007
	scrdef scr_seq_0004_0E6E ; 008
	scrdef scr_seq_0004_0E70 ; 009
	scrdef scr_seq_0004_0E72 ; 010
	scrdef scr_seq_0004_0E86 ; 011
	scrdef scr_seq_0004_006C ; 012
	scrdef scr_seq_0004_0147 ; 013
	scrdef scr_seq_0004_006C ; 014
	scrdef scr_seq_0004_006C ; 015
	scrdef scr_seq_0004_0F35 ; 016
	scrdef scr_seq_0004_0F44 ; 017
	scrdef_end

scr_seq_0004_004A:
	comparevartovalue VAR_UNK_4133, 2
	gotoif eq, scr_seq_0004_0066
	comparevartovalue VAR_UNK_4133, 1
	gotoif eq, scr_seq_0004_0066
	end

scr_seq_0004_0066:
	scrcmd_375 255
	end

scr_seq_0004_006C:
	scrcmd_609
	lockall
	scrcmd_446 32780
	scrcmd_840 32780, 32772
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, scr_seq_0004_0099
	goto scr_seq_0004_027A

scr_seq_0004_0093:
	.byte 0x16, 0x00, 0xa8, 0x00, 0x00, 0x00
scr_seq_0004_0099:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_0004_00F0
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif eq, scr_seq_0004_00BF
	goto scr_seq_0004_027A

scr_seq_0004_00B9:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0004_00BF:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif eq, scr_seq_0004_00D2
	goto scr_seq_0004_027A

scr_seq_0004_00D2:
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto scr_seq_0004_0222

scr_seq_0004_00EA:
	.byte 0x16, 0x00, 0x51, 0x00, 0x00, 0x00
scr_seq_0004_00F0:
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ne, scr_seq_0004_0141
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif eq, scr_seq_0004_0116
	goto scr_seq_0004_027A

scr_seq_0004_0110:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0004_0116:
	comparevartovalue VAR_TEMP_x4001, 11
	gotoif eq, scr_seq_0004_0129
	goto scr_seq_0004_027A

scr_seq_0004_0129:
	setvar VAR_TEMP_x4000, 18
	setvar VAR_TEMP_x4001, 11
	setvar VAR_TEMP_x4002, 14
	goto scr_seq_0004_0222

scr_seq_0004_0141:
	goto scr_seq_0004_027A

scr_seq_0004_0147:
	scrcmd_609
	lockall
	scrcmd_446 32780
	scrcmd_840 32780, 32772
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, scr_seq_0004_0174
	goto scr_seq_0004_027A

scr_seq_0004_016E:
	.byte 0x16, 0x00
	.byte 0xa8, 0x00, 0x00, 0x00
scr_seq_0004_0174:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_0004_01CB
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif eq, scr_seq_0004_019A
	goto scr_seq_0004_027A

scr_seq_0004_0194:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0004_019A:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif eq, scr_seq_0004_01AD
	goto scr_seq_0004_027A

scr_seq_0004_01AD:
	setvar VAR_TEMP_x4000, 7
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto scr_seq_0004_0222

scr_seq_0004_01C5:
	.byte 0x16, 0x00, 0x51, 0x00, 0x00, 0x00
scr_seq_0004_01CB:
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ne, scr_seq_0004_021C
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0004_01F1
	goto scr_seq_0004_027A

scr_seq_0004_01EB:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00
	.byte 0x00
scr_seq_0004_01F1:
	comparevartovalue VAR_TEMP_x4001, 11
	gotoif eq, scr_seq_0004_0204
	goto scr_seq_0004_027A

scr_seq_0004_0204:
	setvar VAR_TEMP_x4000, 4
	setvar VAR_TEMP_x4001, 11
	setvar VAR_TEMP_x4002, 14
	goto scr_seq_0004_0222

scr_seq_0004_021C:
	goto scr_seq_0004_027A

scr_seq_0004_0222:
	scrcmd_307 0, 0, 16384, 16385, 77
	call scr_seq_0004_0BC2
	apply_movement 255, scr_seq_0004_0288
	wait_movement
	call scr_seq_0004_0BCA
	scrcmd_307 0, 0, 16384, 16386, 77
	call scr_seq_0004_0BC2
	apply_movement 255, scr_seq_0004_02A0
	wait_movement
	call scr_seq_0004_0BCA
	scrcmd_606
	clearflag FLAG_UNK_966
	setvar VAR_UNK_4133, 0
	setvar VAR_UNK_4133, 0
	releaseall
	end

scr_seq_0004_027A:
	setvar VAR_UNK_4133, 0
	scrcmd_374 255
	releaseall
	end


scr_seq_0004_0288:
	.short 1, 1
	.short 70, 1
	.short 13, 2
	.short 254, 0
	.byte 0x0d, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0004_02A0:
	.short 13, 2
	.short 254, 0
scr_seq_0004_02A8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_584 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0004_0F27
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0004_0C10
	npc_msg 0
	goto scr_seq_0004_02DD

scr_seq_0004_02DB:
	.byte 0x02, 0x00
scr_seq_0004_02DD:
	npc_msg 2
	touchscreen_menu_hide
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 166, 255, 0
	scrcmd_751 167, 255, 1
	scrcmd_751 11, 255, 2
	scrcmd_751 12, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0004_0364
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0004_03DF
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0004_033F
	goto scr_seq_0004_034C

scr_seq_0004_033F:
	npc_msg 6
	closemsg
	goto scr_seq_0004_02DD

scr_seq_0004_034A:
	.byte 0x02, 0x00
scr_seq_0004_034C:
	npc_msg 29
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0004_0359:
	npc_msg 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0004_0364:
	npc_msg 1
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 6, 255, 0
	scrcmd_751 7, 255, 1
	scrcmd_751 8, 255, 2
	scrcmd_751 10, 255, 3
	scrcmd_751 13, 255, 4
	scrcmd_752
	copyvar VAR_TEMP_x4003, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0004_0415
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0004_0423
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0004_044D
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0004_04A1
	goto scr_seq_0004_02DD

scr_seq_0004_03DF:
	npc_msg 3
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 4, 255, 0
	scrcmd_751 5, 255, 1
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0004_0477
	goto scr_seq_0004_02DD

scr_seq_0004_0415:
	setvar VAR_SPECIAL_x8004, 1
	goto scr_seq_0004_04AF

scr_seq_0004_0421:
	.byte 0x02, 0x00
scr_seq_0004_0423:
	setvar VAR_SPECIAL_x8004, 2
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif lt, scr_seq_0004_0440
	goto scr_seq_0004_04AF

scr_seq_0004_0440:
	npc_msg 10
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0004_044D:
	setvar VAR_SPECIAL_x8004, 3
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif lt, scr_seq_0004_046A
	goto scr_seq_0004_0905

scr_seq_0004_046A:
	npc_msg 141
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0004_0477:
	setvar VAR_SPECIAL_x8004, 4
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif lt, scr_seq_0004_0494
	goto scr_seq_0004_0905

scr_seq_0004_0494:
	npc_msg 140
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0004_04A1:
	setvar VAR_SPECIAL_x8004, 37
	goto scr_seq_0004_059A

scr_seq_0004_04AD:
	.byte 0x02, 0x00
scr_seq_0004_04AF:
	npc_msg 120
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 20, 255, 12
	scrcmd_798 0
	scrcmd_751 19, 255, 0
	scrcmd_798 1
	scrcmd_751 19, 255, 1
	scrcmd_798 2
	scrcmd_751 19, 255, 2
	scrcmd_798 3
	scrcmd_751 19, 255, 3
	scrcmd_798 4
	scrcmd_751 19, 255, 4
	scrcmd_837 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0004_051B
	scrcmd_798 5
	scrcmd_751 19, 255, 5
scr_seq_0004_051B:
	scrcmd_751 22, 255, 255
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 12
	gotoif eq, scr_seq_0004_08F9
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0004_058E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0004_058E
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0004_058E
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0004_058E
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0004_058E
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0004_058E
	goto scr_seq_0004_02DD

scr_seq_0004_058C:
	.byte 0x02, 0x00
scr_seq_0004_058E:
	scrcmd_800 16384
	goto scr_seq_0004_0682

scr_seq_0004_0598:
	.byte 0x02, 0x00
scr_seq_0004_059A:
	setvar VAR_SPECIAL_x8004, 37
	npc_msg 120
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 20, 255, 6
	scrcmd_798 7
	scrcmd_751 19, 255, 7
	scrcmd_798 8
	scrcmd_751 19, 255, 8
	scrcmd_798 9
	scrcmd_751 19, 255, 9
	scrcmd_798 10
	scrcmd_751 23, 255, 10
	scrcmd_798 11
	scrcmd_751 19, 255, 11
	scrcmd_751 22, 255, 255
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0004_08F9
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_0004_058E
	comparevartovalue VAR_SPECIAL_x8008, 8
	gotoif eq, scr_seq_0004_058E
	comparevartovalue VAR_SPECIAL_x8008, 9
	gotoif eq, scr_seq_0004_0653
	comparevartovalue VAR_SPECIAL_x8008, 10
	gotoif eq, scr_seq_0004_065F
	comparevartovalue VAR_SPECIAL_x8008, 11
	gotoif eq, scr_seq_0004_0653
	goto scr_seq_0004_02DD

scr_seq_0004_0653:
	setvar VAR_SPECIAL_x8004, 38
	goto scr_seq_0004_058E

scr_seq_0004_065F:
	setvar VAR_SPECIAL_x8004, 38
	scrcmd_800 16384
	scrcmd_803 16384, 16386
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_0004_0440
	goto scr_seq_0004_0905

scr_seq_0004_0682:
	scrcmd_799 16384
	npc_msg 121
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 130, 255, 0
	scrcmd_751 131, 255, 1
	comparevartovalue VAR_TEMP_x4000, 11
	gotoif ne, scr_seq_0004_06B6
	scrcmd_751 24, 255, 2
scr_seq_0004_06B6:
	scrcmd_751 22, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0004_0702
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0004_0751
	comparevartovalue VAR_TEMP_x4000, 11
	gotoif ne, scr_seq_0004_06FA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0004_0778
scr_seq_0004_06FA:
	goto scr_seq_0004_0763

scr_seq_0004_0700:
	.byte 0x02, 0x00
scr_seq_0004_0702:
	scrcmd_803 16384, 16386
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_0004_0905
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_0004_072A
	goto scr_seq_0004_0744

scr_seq_0004_0728:
	.byte 0x02, 0x00
scr_seq_0004_072A:
	npc_msg 122
	scrcmd_049
	comparevartovalue VAR_TEMP_x4003, 3
	gotoif eq, scr_seq_0004_059A
	goto scr_seq_0004_04AF

scr_seq_0004_0742:
	.byte 0x02, 0x00
scr_seq_0004_0744:
	npc_msg 136
	scrcmd_049
	goto scr_seq_0004_04AF

scr_seq_0004_074F:
	.byte 0x02
	.byte 0x00
scr_seq_0004_0751:
	closemsg
	scrcmd_801 16384
	scrcmd_049
	scrcmd_802
	goto scr_seq_0004_0682

scr_seq_0004_0761:
	.byte 0x02, 0x00
scr_seq_0004_0763:
	comparevartovalue VAR_TEMP_x4003, 3
	gotoif eq, scr_seq_0004_059A
	goto scr_seq_0004_04AF

scr_seq_0004_0776:
	.byte 0x02, 0x00
scr_seq_0004_0778:
	touchscreen_menu_show
	buffer_players_name 0
	npc_msg 25
	setvar VAR_TEMP_x4005, 0
	scrcmd_707 150, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_0004_07AA
	buffer_species_name_custom 0, SPECIES_MEWTWO, 0, 0
	npc_msg 26
	setvar VAR_TEMP_x4005, 1
scr_seq_0004_07AA:
	scrcmd_707 249, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_0004_07CE
	buffer_species_name_custom 0, SPECIES_LUGIA, 0, 0
	npc_msg 26
	setvar VAR_TEMP_x4005, 1
scr_seq_0004_07CE:
	scrcmd_707 250, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_0004_07F2
	buffer_species_name_custom 0, SPECIES_HO_OH, 0, 0
	npc_msg 26
	setvar VAR_TEMP_x4005, 1
scr_seq_0004_07F2:
	scrcmd_707 382, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_0004_0816
	buffer_species_name_custom 0, SPECIES_KYOGRE, 0, 0
	npc_msg 26
	setvar VAR_TEMP_x4005, 1
scr_seq_0004_0816:
	scrcmd_707 383, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_0004_083A
	buffer_species_name_custom 0, SPECIES_GROUDON, 0, 0
	npc_msg 26
	setvar VAR_TEMP_x4005, 1
scr_seq_0004_083A:
	scrcmd_707 384, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_0004_085E
	buffer_species_name_custom 0, SPECIES_RAYQUAZA, 0, 0
	npc_msg 26
	setvar VAR_TEMP_x4005, 1
scr_seq_0004_085E:
	scrcmd_707 483, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_0004_0882
	buffer_species_name_custom 0, SPECIES_DIALGA, 0, 0
	npc_msg 26
	setvar VAR_TEMP_x4005, 1
scr_seq_0004_0882:
	scrcmd_707 484, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_0004_08A6
	buffer_species_name_custom 0, SPECIES_PALKIA, 0, 0
	npc_msg 26
	setvar VAR_TEMP_x4005, 1
scr_seq_0004_08A6:
	scrcmd_707 487, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_0004_08CA
	buffer_species_name_custom 0, SPECIES_GIRATINA, 0, 0
	npc_msg 26
	setvar VAR_TEMP_x4005, 1
scr_seq_0004_08CA:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_0004_08E0
	npc_msg 27
	goto scr_seq_0004_08E3

scr_seq_0004_08E0:
	npc_msg 28
scr_seq_0004_08E3:
	touchscreen_menu_hide
	goto scr_seq_0004_0682

scr_seq_0004_08EB:
	.byte 0x29, 0x00, 0x05, 0x80, 0x00
	.byte 0x00, 0x16, 0x00, 0x0e, 0x00, 0x00, 0x00, 0x02, 0x00
scr_seq_0004_08F9:
	scrcmd_800 16384
	goto scr_seq_0004_0905

scr_seq_0004_0903:
	.byte 0x02, 0x00
scr_seq_0004_0905:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0004_0924
	goto scr_seq_0004_0359

scr_seq_0004_0922:
	.byte 0x02, 0x00
scr_seq_0004_0924:
	touchscreen_menu_hide
scr_seq_0004_0926:
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_0004_09BE
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_0004_09BE
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_0004_09BE
	comparevartovalue VAR_SPECIAL_x8004, 37
	callif eq, scr_seq_0004_09BE
	comparevartovalue VAR_SPECIAL_x8004, 38
	callif eq, scr_seq_0004_09BE
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_0004_09C3
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 5, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0004_09C8
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0004_0A41
	goto scr_seq_0004_034C

scr_seq_0004_09BC:
	.byte 0x02, 0x00
scr_seq_0004_09BE:
	npc_msg 36
	return

scr_seq_0004_09C3:
	npc_msg 57
	return

scr_seq_0004_09C8:
	npc_msg 139
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0004_0926
	closemsg
	scrcmd_226 32772, 32773, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0004_0A17
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0004_0A23
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0004_0A32
	goto scr_seq_0004_0ABA

scr_seq_0004_0A15:
	.byte 0x02, 0x00
scr_seq_0004_0A17:
	scrcmd_283
	touchscreen_menu_hide
	goto scr_seq_0004_0926

scr_seq_0004_0A21:
	.byte 0x02, 0x00
scr_seq_0004_0A23:
	scrcmd_283
	touchscreen_menu_show
	npc_msg 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0004_0A32:
	scrcmd_283
	npc_msg 29
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0004_0A41:
	npc_msg 139
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0004_0926
	closemsg
	scrcmd_227 32772, 32773, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0004_0A90
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0004_0A9C
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0004_0AAB
	goto scr_seq_0004_0ABA

scr_seq_0004_0A8E:
	.byte 0x02, 0x00
scr_seq_0004_0A90:
	scrcmd_283
	touchscreen_menu_hide
	goto scr_seq_0004_0926

scr_seq_0004_0A9A:
	.byte 0x02, 0x00
scr_seq_0004_0A9C:
	scrcmd_283
	npc_msg 30
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0004_0AAB:
	scrcmd_283
	npc_msg 29
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0004_0ABA:
	setvar VAR_UNK_4133, 1
	setflag FLAG_UNK_966
	scrcmd_047 66
	scrcmd_348 45
	scrcmd_257 96
	closemsg
	scrcmd_600
	heal_party
	scrcmd_815 0
	scrcmd_446 32780
	comparevartovalue VAR_SPECIAL_x800C, 300
	gotoif ne, scr_seq_0004_0B13
	apply_movement 255, scr_seq_0004_0BE8
	wait_movement
	setvar VAR_TEMP_x4000, 18
	setvar VAR_TEMP_x4001, 11
	setvar VAR_TEMP_x4002, 14
	goto scr_seq_0004_0B35

scr_seq_0004_0B0D:
	.byte 0x16, 0x00, 0x22
	.byte 0x00, 0x00, 0x00
scr_seq_0004_0B13:
	apply_movement 255, scr_seq_0004_0BDC
	wait_movement
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto scr_seq_0004_0B35

scr_seq_0004_0B35:
	scrcmd_307 0, 0, 16384, 16386, 77
	call scr_seq_0004_0BC2
	apply_movement 255, scr_seq_0004_0BF4
	wait_movement
	call scr_seq_0004_0BCA
	apply_movement 255, scr_seq_0004_0BFC
	wait_movement
	scrcmd_307 0, 0, 16384, 16385, 77
	call scr_seq_0004_0BC2
	apply_movement 255, scr_seq_0004_0C04
	wait_movement
	call scr_seq_0004_0BCA
	comparevartovalue VAR_SPECIAL_x8004, 4
	gotoif eq, scr_seq_0004_0BA8
	scrcmd_451 32780
	addvar VAR_SPECIAL_x800C, 7
	scrcmd_448 4, 0, 32780, 11, 0
	releaseall
	end

scr_seq_0004_0BA8:
	scrcmd_451 32780
	addvar VAR_SPECIAL_x800C, 6
	scrcmd_448 5, 0, 32780, 11, 0
	releaseall
	end

scr_seq_0004_0BC2:
	scrcmd_310 77
	scrcmd_308 77
	return

scr_seq_0004_0BCA:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return

scr_seq_0004_0BD5:
	scrcmd_230
	scrcmd_284
	end

scr_seq_0004_0BDB:
	.byte 0x00

scr_seq_0004_0BDC:
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_0004_0BE8:
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_0004_0BF4:
	.short 12, 2
	.short 254, 0

scr_seq_0004_0BFC:
	.short 12, 1
	.short 254, 0

scr_seq_0004_0C04:
	.short 12, 1
	.short 69, 1
	.short 254, 0
scr_seq_0004_0C10:
	npc_msg 144
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0004_0C1B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_584 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0004_0F27
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0004_0E3A
	get_party_count VAR_TEMP_x4009
	setvar VAR_TEMP_x400A, 0
scr_seq_0004_0C4F:
	get_partymon_species VAR_TEMP_x400A, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 172
	gotoif ne, scr_seq_0004_0C7B
	get_partymon_forme VAR_TEMP_x400A, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0004_0C7B
	goto scr_seq_0004_0E45

scr_seq_0004_0C7B:
	addvar VAR_TEMP_x400A, 1
	comparevartovar VAR_TEMP_x400A, VAR_TEMP_x4009
	gotoif ge, scr_seq_0004_0C94
	goto scr_seq_0004_0C4F

scr_seq_0004_0C94:
	goto scr_seq_0004_0C9C

scr_seq_0004_0C9A:
	.byte 0x02, 0x00
scr_seq_0004_0C9C:
	npc_msg 71
	touchscreen_menu_hide
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 42, 255, 0
	scrcmd_751 11, 255, 1
	scrcmd_751 45, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0004_0D14
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0004_0CF8
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0004_034C
	goto scr_seq_0004_034C

scr_seq_0004_0CF6:
	.byte 0x02, 0x00
scr_seq_0004_0CF8:
	npc_msg 72
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0004_0D14
	goto scr_seq_0004_034C

scr_seq_0004_0D12:
	.byte 0x02, 0x00
scr_seq_0004_0D14:
	setvar VAR_SPECIAL_x8004, 9
	npc_msg 139
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0004_034C
	scrcmd_689 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0004_0E34
	setvar VAR_UNK_4133, 2
	setflag FLAG_UNK_966
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0004_0D70
	setvar VAR_UNK_4133, 0
	clearflag FLAG_UNK_966
	goto scr_seq_0004_0359

scr_seq_0004_0D70:
	setvar VAR_UNK_4133, 2
	setflag FLAG_UNK_966
	npc_msg 77
	closemsg
	scrcmd_600
	heal_party
	apply_movement 255, scr_seq_0004_0BDC
	wait_movement
	scrcmd_815 0
	goto scr_seq_0004_0D99

scr_seq_0004_0D97:
	.byte 0x02, 0x00
scr_seq_0004_0D99:
	scrcmd_446 32780
	comparevartovalue VAR_SPECIAL_x800C, 300
	gotoif ne, scr_seq_0004_0DC8
	setvar VAR_TEMP_x4000, 4
	setvar VAR_TEMP_x4001, 11
	setvar VAR_TEMP_x4002, 14
	goto scr_seq_0004_0DE2

scr_seq_0004_0DC2:
	.byte 0x16, 0x00, 0x18, 0x00, 0x00, 0x00
scr_seq_0004_0DC8:
	setvar VAR_TEMP_x4000, 7
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto scr_seq_0004_0DE2

scr_seq_0004_0DE0:
	.byte 0x02, 0x00
scr_seq_0004_0DE2:
	scrcmd_307 0, 0, 16384, 16386, 77
	call scr_seq_0004_0BC2
	apply_movement 255, scr_seq_0004_0BF4
	wait_movement
	call scr_seq_0004_0BCA
	apply_movement 255, scr_seq_0004_0BFC
	wait_movement
	scrcmd_307 0, 0, 16384, 16385, 77
	call scr_seq_0004_0BC2
	apply_movement 255, scr_seq_0004_0C04
	wait_movement
	call scr_seq_0004_0BCA
	releaseall
	scrcmd_286
	end

scr_seq_0004_0E34:
	callstd 2041
	end

scr_seq_0004_0E3A:
	npc_msg 146
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0004_0E45:
	comparevartovalue VAR_UNK_412F, 0
	gotoif ne, scr_seq_0004_0E5B
	npc_msg 172
	goto scr_seq_0004_0E5E

scr_seq_0004_0E5B:
	npc_msg 147
scr_seq_0004_0E5E:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0004_0E66:
	end

scr_seq_0004_0E68:
	end

scr_seq_0004_0E6A:
	end

scr_seq_0004_0E6C:
	end

scr_seq_0004_0E6E:
	end

scr_seq_0004_0E70:
	end

scr_seq_0004_0E72:
	scrcmd_436
	scrcmd_152
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	end

scr_seq_0004_0E86:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_UNK_066
	npc_msg 116
	goto scr_seq_0004_0E9D

scr_seq_0004_0E9B:
	.byte 0x02, 0x00
scr_seq_0004_0E9D:
	npc_msg 117
	scrcmd_064 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 42, 0
	scrcmd_066 43, 1
	scrcmd_066 11, 2
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0004_0EF6
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0004_0F1C
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0004_0EEB
	goto scr_seq_0004_0F1C

scr_seq_0004_0EE9:
	.byte 0x02, 0x00
scr_seq_0004_0EEB:
	npc_msg 119
	goto scr_seq_0004_0E9D

scr_seq_0004_0EF4:
	.byte 0x02, 0x00
scr_seq_0004_0EF6:
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_252
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0004_0F1C

scr_seq_0004_0F1A:
	.byte 0x02, 0x00
scr_seq_0004_0F1C:
	npc_msg 118
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0004_0F27:
	call scr_seq_0004_0F3F
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0004_0F35:
	call scr_seq_0004_0F3F
	endstd
	end

scr_seq_0004_0F3F:
	npc_msg 142
	return

scr_seq_0004_0F44:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 149
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
