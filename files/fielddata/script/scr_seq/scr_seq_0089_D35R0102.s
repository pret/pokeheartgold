#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0089_027D ; 000
	scrdef scr_seq_0089_0C09 ; 001
	scrdef scr_seq_0089_0D6E ; 002
	scrdef scr_seq_0089_0D70 ; 003
	scrdef scr_seq_0089_0D72 ; 004
	scrdef scr_seq_0089_04B4 ; 005
	scrdef scr_seq_0089_06F8 ; 006
	scrdef scr_seq_0089_08A9 ; 007
	scrdef scr_seq_0089_0A56 ; 008
	scrdef scr_seq_0089_0C52 ; 009
	scrdef scr_seq_0089_0C99 ; 010
	scrdef scr_seq_0089_0CE0 ; 011
	scrdef scr_seq_0089_0D27 ; 012
	scrdef scr_seq_0089_0F2F ; 013
	scrdef scr_seq_0089_0F5C ; 014
	scrdef scr_seq_0089_0F89 ; 015
	scrdef scr_seq_0089_0FB6 ; 016
	scrdef scr_seq_0089_0FE3 ; 017
	scrdef scr_seq_0089_1010 ; 018
	scrdef scr_seq_0089_103D ; 019
	scrdef scr_seq_0089_106A ; 020
	scrdef scr_seq_0089_1097 ; 021
	scrdef scr_seq_0089_10C4 ; 022
	scrdef scr_seq_0089_10F1 ; 023
	scrdef scr_seq_0089_111E ; 024
	scrdef scr_seq_0089_114B ; 025
	scrdef scr_seq_0089_1178 ; 026
	scrdef scr_seq_0089_11A5 ; 027
	scrdef scr_seq_0089_11D2 ; 028
	scrdef scr_seq_0089_1205 ; 029
	scrdef scr_seq_0089_00DC ; 030
	scrdef scr_seq_0089_0088 ; 031
	scrdef scr_seq_0089_0086 ; 032
	scrdef_end

scr_seq_0089_0086:
	end

scr_seq_0089_0088:
	comparevartovalue VAR_UNK_40AC, 4
	gotoif eq, scr_seq_0089_00BE
	comparevartovalue VAR_UNK_40AC, 5
	gotoif eq, scr_seq_0089_00BE
	comparevartovalue VAR_UNK_40AC, 6
	gotoif eq, scr_seq_0089_00BE
	comparevartovalue VAR_UNK_40AC, 7
	gotoif eq, scr_seq_0089_00BE
	end

scr_seq_0089_00BE:
	setvar VAR_UNK_40AC, 8
	setvar VAR_UNK_40A9, 2
	setflag FLAG_UNK_24B
	setflag FLAG_UNK_24C
	setflag FLAG_UNK_24D
	clearflag FLAG_UNK_252
	end

scr_seq_0089_00DC:
	comparevartovalue VAR_UNK_40AC, 9
	callif ge, scr_seq_0089_025D
	comparevartovalue VAR_UNK_40AD, 2
	gotoif ne, scr_seq_0089_0108
	show_person_at 0, 44, 0, 3, 2
	goto scr_seq_0089_0133

scr_seq_0089_0108:
	comparevartovalue VAR_UNK_40AD, 1
	gotoif ne, scr_seq_0089_0127
	show_person_at 0, 44, 0, 3, 1
	goto scr_seq_0089_0133

scr_seq_0089_0127:
	show_person_at 0, 44, 0, 3, 0
scr_seq_0089_0133:
	comparevartovalue VAR_UNK_40AE, 2
	gotoif ne, scr_seq_0089_0152
	show_person_at 2, 18, 0, 3, 2
	goto scr_seq_0089_017D

scr_seq_0089_0152:
	comparevartovalue VAR_UNK_40AE, 1
	gotoif ne, scr_seq_0089_0171
	show_person_at 2, 18, 0, 3, 1
	goto scr_seq_0089_017D

scr_seq_0089_0171:
	show_person_at 2, 18, 0, 3, 0
scr_seq_0089_017D:
	comparevartovalue VAR_UNK_40AF, 2
	gotoif ne, scr_seq_0089_019C
	show_person_at 3, 44, 0, 10, 2
	goto scr_seq_0089_01C7

scr_seq_0089_019C:
	comparevartovalue VAR_UNK_40AF, 1
	gotoif ne, scr_seq_0089_01BB
	show_person_at 3, 44, 0, 10, 1
	goto scr_seq_0089_01C7

scr_seq_0089_01BB:
	show_person_at 3, 44, 0, 10, 0
scr_seq_0089_01C7:
	comparevartovalue VAR_UNK_40B0, 2
	gotoif ne, scr_seq_0089_01E6
	show_person_at 4, 44, 0, 28, 2
	goto scr_seq_0089_0211

scr_seq_0089_01E6:
	comparevartovalue VAR_UNK_40B0, 1
	gotoif ne, scr_seq_0089_0205
	show_person_at 4, 44, 0, 28, 1
	goto scr_seq_0089_0211

scr_seq_0089_0205:
	show_person_at 4, 44, 0, 28, 0
scr_seq_0089_0211:
	comparevartovalue VAR_UNK_40B1, 2
	gotoif ne, scr_seq_0089_0230
	show_person_at 5, 18, 0, 28, 2
	goto scr_seq_0089_025B

scr_seq_0089_0230:
	comparevartovalue VAR_UNK_40B1, 1
	gotoif ne, scr_seq_0089_024F
	show_person_at 5, 18, 0, 28, 1
	goto scr_seq_0089_025B

scr_seq_0089_024F:
	show_person_at 5, 18, 0, 28, 0
scr_seq_0089_025B:
	end

scr_seq_0089_025D:
	setvar VAR_UNK_40AD, 2
	setvar VAR_UNK_40AE, 2
	setvar VAR_UNK_40AF, 2
	setvar VAR_UNK_40B0, 2
	setvar VAR_UNK_40B1, 2
	return

scr_seq_0089_027D:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0089_0428
	wait_movement
	apply_movement 0, scr_seq_0089_0454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	scrcmd_074 2173
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif ne, scr_seq_0089_02C4
	addvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_02D0

scr_seq_0089_02BE:
	.byte 0x16, 0x00
	.byte 0x0c, 0x00, 0x00, 0x00
scr_seq_0089_02C4:
	subvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_036C

scr_seq_0089_02D0:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	show_person_at 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_0460
	wait_movement
	apply_movement 255, scr_seq_0089_0478
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle 223, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_0490
	wait_movement
	show_person_at 1, 33, 0, VAR_TEMP_x4001, 3
	apply_movement 1, scr_seq_0089_0460
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle 224, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_0490
	wait_movement
	goto scr_seq_0089_0402

scr_seq_0089_036C:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	show_person_at 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_046C
	wait_movement
	apply_movement 255, scr_seq_0089_0484
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle 223, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_0490
	wait_movement
	show_person_at 1, 33, 0, VAR_TEMP_x4001, 3
	apply_movement 1, scr_seq_0089_046C
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle 224, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_0490
	wait_movement
scr_seq_0089_0402:
	show_person_at 1, 37, 0, 0, 2
	setflag FLAG_UNK_1E8
	setvar VAR_UNK_40AD, 2
	apply_movement 0, scr_seq_0089_049C
	wait_movement
	releaseall
	end

scr_seq_0089_0426:
	.byte 0x00, 0x00

scr_seq_0089_0428:
	.short 75, 1
	.short 63, 2
	.short 3, 2
	.short 63, 1
	.short 2, 2
	.short 63, 1
	.short 3, 2
	.short 63, 1
	.short 0, 2
	.short 63, 1
	.short 254, 0

scr_seq_0089_0454:
	.short 75, 1
	.short 63, 2
	.short 254, 0

scr_seq_0089_0460:
	.short 23, 11
	.short 0, 2
	.short 254, 0

scr_seq_0089_046C:
	.short 23, 11
	.short 1, 2
	.short 254, 0

scr_seq_0089_0478:
	.short 1, 2
	.short 63, 2
	.short 254, 0

scr_seq_0089_0484:
	.short 0, 2
	.short 63, 2
	.short 254, 0

scr_seq_0089_0490:
	.short 2, 2
	.short 22, 10
	.short 254, 0

scr_seq_0089_049C:
	.short 2, 1
	.short 254, 0

scr_seq_0089_04A4:
	.short 1, 1
	.short 254, 0

scr_seq_0089_04AC:
	.short 0, 1
	.short 254, 0
scr_seq_0089_04B4:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0089_0428
	wait_movement
	apply_movement 2, scr_seq_0089_0454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif ne, scr_seq_0089_04F7
	addvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_0503

scr_seq_0089_04F1:
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
scr_seq_0089_04F7:
	subvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_05A9

scr_seq_0089_0503:
	scrcmd_338 1, 27, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	show_person_at 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_0668
	wait_movement
	apply_movement 255, scr_seq_0089_0478
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle 223, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06C8
	wait_movement
	show_person_at 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_0668
	wait_movement
	apply_movement 255, scr_seq_0089_0478
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle 224, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06C8
	wait_movement
	goto scr_seq_0089_0649

scr_seq_0089_05A9:
	scrcmd_338 1, 27, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	show_person_at 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_0674
	wait_movement
	apply_movement 255, scr_seq_0089_0484
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle 223, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06C8
	wait_movement
	show_person_at 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_0674
	wait_movement
	apply_movement 255, scr_seq_0089_0484
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle 224, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06C8
	wait_movement
scr_seq_0089_0649:
	hide_person 1
	setflag FLAG_UNK_1E8
	setvar VAR_UNK_40AE, 2
	apply_movement 2, scr_seq_0089_049C
	wait_movement
	releaseall
	end

scr_seq_0089_0665:
	.byte 0x00, 0x00, 0x00

scr_seq_0089_0668:
	.short 22, 9
	.short 0, 2
	.short 254, 0

scr_seq_0089_0674:
	.short 22, 9
	.short 1, 2
	.short 254, 0

scr_seq_0089_0680:
	.short 23, 11
	.short 0, 2
	.short 254, 0

scr_seq_0089_068C:
	.short 23, 11
	.short 1, 2
	.short 254, 0

scr_seq_0089_0698:
	.short 23, 11
	.short 0, 2
	.short 254, 0

scr_seq_0089_06A4:
	.short 23, 11
	.short 1, 2
	.short 254, 0

scr_seq_0089_06B0:
	.short 22, 9
	.short 0, 2
	.short 254, 0

scr_seq_0089_06BC:
	.short 22, 9
	.short 1, 2
	.short 254, 0

scr_seq_0089_06C8:
	.short 3, 2
	.short 23, 10
	.short 254, 0

scr_seq_0089_06D4:
	.short 2, 2
	.short 22, 10
	.short 254, 0

scr_seq_0089_06E0:
	.short 2, 2
	.short 22, 10
	.short 254, 0

scr_seq_0089_06EC:
	.short 3, 2
	.short 23, 10
	.short 254, 0
scr_seq_0089_06F8:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0089_0428
	wait_movement
	apply_movement 3, scr_seq_0089_0454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 11
	gotoif ne, scr_seq_0089_073B
	addvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_0747

scr_seq_0089_0735:
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
scr_seq_0089_073B:
	subvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_07ED

scr_seq_0089_0747:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	show_person_at 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_0680
	wait_movement
	apply_movement 255, scr_seq_0089_0478
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle 223, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06D4
	wait_movement
	show_person_at 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_0680
	wait_movement
	apply_movement 255, scr_seq_0089_0478
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle 224, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06D4
	wait_movement
	goto scr_seq_0089_088D

scr_seq_0089_07ED:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	show_person_at 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_068C
	wait_movement
	apply_movement 255, scr_seq_0089_0484
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle 223, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06D4
	wait_movement
	show_person_at 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_068C
	wait_movement
	apply_movement 255, scr_seq_0089_0484
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle 224, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06D4
	wait_movement
scr_seq_0089_088D:
	hide_person 1
	setflag FLAG_UNK_1E8
	setvar VAR_UNK_40AF, 2
	apply_movement 3, scr_seq_0089_049C
	wait_movement
	releaseall
	end

scr_seq_0089_08A9:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0089_0428
	wait_movement
	apply_movement 4, scr_seq_0089_0454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 29
	gotoif ne, scr_seq_0089_08EC
	addvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_08F8

scr_seq_0089_08E6:
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
scr_seq_0089_08EC:
	subvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_099E

scr_seq_0089_08F8:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	show_person_at 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_0698
	wait_movement
	apply_movement 255, scr_seq_0089_0478
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle 223, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06E0
	wait_movement
	show_person_at 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_0698
	wait_movement
	apply_movement 255, scr_seq_0089_0478
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle 224, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06E0
	wait_movement
	goto scr_seq_0089_0A3E

scr_seq_0089_099E:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	show_person_at 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_06A4
	wait_movement
	apply_movement 255, scr_seq_0089_0484
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle 223, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06E0
	wait_movement
	show_person_at 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_06A4
	wait_movement
	apply_movement 255, scr_seq_0089_0484
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle 224, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06E0
	wait_movement
scr_seq_0089_0A3E:
	hide_person 1
	setvar VAR_UNK_40B0, 2
	apply_movement 4, scr_seq_0089_049C
	wait_movement
	releaseall
	end

scr_seq_0089_0A56:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0089_0428
	wait_movement
	apply_movement 5, scr_seq_0089_0454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 29
	gotoif ne, scr_seq_0089_0A99
	addvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_0AA5

scr_seq_0089_0A93:
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
scr_seq_0089_0A99:
	subvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_0B4B

scr_seq_0089_0AA5:
	scrcmd_338 1, 27, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	show_person_at 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_06B0
	wait_movement
	apply_movement 255, scr_seq_0089_0478
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle 223, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06EC
	wait_movement
	show_person_at 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_06B0
	wait_movement
	apply_movement 255, scr_seq_0089_0478
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle 224, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06EC
	wait_movement
	goto scr_seq_0089_0BEB

scr_seq_0089_0B4B:
	scrcmd_338 1, 27, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	show_person_at 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_06BC
	wait_movement
	apply_movement 255, scr_seq_0089_0484
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle 223, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06EC
	wait_movement
	show_person_at 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_06BC
	wait_movement
	apply_movement 255, scr_seq_0089_0484
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle 224, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0C03
	apply_movement 1, scr_seq_0089_06EC
	wait_movement
scr_seq_0089_0BEB:
	hide_person 1
	setvar VAR_UNK_40B1, 2
	apply_movement 5, scr_seq_0089_049C
	wait_movement
	releaseall
	end

scr_seq_0089_0C03:
	scrcmd_219
	releaseall
	end

scr_seq_0089_0C09:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_40AD, 0
	gotoif ne, scr_seq_0089_0C2B
	npc_msg 2
	goto scr_seq_0089_0C4A

scr_seq_0089_0C25:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0089_0C2B:
	comparevartovalue VAR_UNK_40AD, 1
	gotoif ne, scr_seq_0089_0C47
	npc_msg 3
	goto scr_seq_0089_0C4A

scr_seq_0089_0C41:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_0089_0C47:
	npc_msg 4
scr_seq_0089_0C4A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0089_0C52:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_40AE, 0
	gotoif ne, scr_seq_0089_0C74
	npc_msg 2
	goto scr_seq_0089_0C4A

scr_seq_0089_0C6E:
	.byte 0x16, 0x00
	.byte 0x1f, 0x00, 0x00, 0x00
scr_seq_0089_0C74:
	comparevartovalue VAR_UNK_40AE, 1
	gotoif ne, scr_seq_0089_0C90
	npc_msg 3
	goto scr_seq_0089_0C4A

scr_seq_0089_0C8A:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_0089_0C90:
	npc_msg 4
	goto scr_seq_0089_0C4A

scr_seq_0089_0C99:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_40AF, 0
	gotoif ne, scr_seq_0089_0CBB
	npc_msg 2
	goto scr_seq_0089_0C4A

scr_seq_0089_0CB5:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0089_0CBB:
	comparevartovalue VAR_UNK_40AF, 1
	gotoif ne, scr_seq_0089_0CD7
	npc_msg 3
	goto scr_seq_0089_0C4A

scr_seq_0089_0CD1:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_0089_0CD7:
	npc_msg 4
	goto scr_seq_0089_0C4A

scr_seq_0089_0CE0:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_40B0, 0
	gotoif ne, scr_seq_0089_0D02
	npc_msg 2
	goto scr_seq_0089_0C4A

scr_seq_0089_0CFC:
	.byte 0x16, 0x00, 0x1f, 0x00
	.byte 0x00, 0x00
scr_seq_0089_0D02:
	comparevartovalue VAR_UNK_40B0, 1
	gotoif ne, scr_seq_0089_0D1E
	npc_msg 3
	goto scr_seq_0089_0C4A

scr_seq_0089_0D18:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_0089_0D1E:
	npc_msg 4
	goto scr_seq_0089_0C4A

scr_seq_0089_0D27:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_40B1, 0
	gotoif ne, scr_seq_0089_0D49
	npc_msg 2
	goto scr_seq_0089_0C4A

scr_seq_0089_0D43:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0089_0D49:
	comparevartovalue VAR_UNK_40B1, 1
	gotoif ne, scr_seq_0089_0D65
	npc_msg 3
	goto scr_seq_0089_0C4A

scr_seq_0089_0D5F:
	.byte 0x16
	.byte 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_0089_0D65:
	npc_msg 4
	goto scr_seq_0089_0C4A

scr_seq_0089_0D6E:
	end

scr_seq_0089_0D70:
	end

scr_seq_0089_0D72:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40AC, 9
	gotoif ge, scr_seq_0089_0F24
	checkflag FLAG_UNK_0D6
	gotoif TRUE, scr_seq_0089_0E58
	npc_msg 5
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0DB7
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0089_0F1E
scr_seq_0089_0DB7:
	play_se SEQ_SE_DP_DENSI01
	npc_msg 7
	closemsg
	setflag FLAG_UNK_0D6
	comparevartovalue VAR_UNK_40AD, 2
	gotoif ge, scr_seq_0089_0DDF
	setvar VAR_UNK_40AD, 1
	apply_movement 0, scr_seq_0089_04A4
scr_seq_0089_0DDF:
	comparevartovalue VAR_UNK_40AE, 2
	gotoif ge, scr_seq_0089_0DFA
	setvar VAR_UNK_40AE, 1
	apply_movement 2, scr_seq_0089_04A4
scr_seq_0089_0DFA:
	comparevartovalue VAR_UNK_40AF, 2
	gotoif ge, scr_seq_0089_0E15
	setvar VAR_UNK_40AF, 1
	apply_movement 3, scr_seq_0089_04A4
scr_seq_0089_0E15:
	comparevartovalue VAR_UNK_40B0, 2
	gotoif ge, scr_seq_0089_0E30
	setvar VAR_UNK_40B0, 1
	apply_movement 4, scr_seq_0089_04A4
scr_seq_0089_0E30:
	comparevartovalue VAR_UNK_40B1, 2
	gotoif ge, scr_seq_0089_0E4D
	setvar VAR_UNK_40B1, 1
	apply_movement 5, scr_seq_0089_04A4
	wait_movement
scr_seq_0089_0E4D:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0089_0E58:
	npc_msg 6
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_0E7D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0089_0F1E
scr_seq_0089_0E7D:
	play_se SEQ_SE_DP_DENSI01
	npc_msg 7
	closemsg
	clearflag FLAG_UNK_0D6
	comparevartovalue VAR_UNK_40AD, 2
	gotoif ge, scr_seq_0089_0EA5
	setvar VAR_UNK_40AD, 0
	apply_movement 0, scr_seq_0089_04AC
scr_seq_0089_0EA5:
	comparevartovalue VAR_UNK_40AE, 2
	gotoif ge, scr_seq_0089_0EC0
	setvar VAR_UNK_40AE, 0
	apply_movement 2, scr_seq_0089_04AC
scr_seq_0089_0EC0:
	comparevartovalue VAR_UNK_40AF, 2
	gotoif ge, scr_seq_0089_0EDB
	setvar VAR_UNK_40AF, 0
	apply_movement 3, scr_seq_0089_04AC
scr_seq_0089_0EDB:
	comparevartovalue VAR_UNK_40B0, 2
	gotoif ge, scr_seq_0089_0EF6
	setvar VAR_UNK_40B0, 0
	apply_movement 4, scr_seq_0089_04AC
scr_seq_0089_0EF6:
	comparevartovalue VAR_UNK_40B1, 2
	gotoif ge, scr_seq_0089_0F13
	setvar VAR_UNK_40B1, 0
	apply_movement 5, scr_seq_0089_04AC
	wait_movement
scr_seq_0089_0F13:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0089_0F1E:
	closemsg
	releaseall
	end

scr_seq_0089_0F24:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0089_0F2F:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	scrcmd_249 109, 21
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40B2, 1
	releaseall
	end

scr_seq_0089_0F5C:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40B3, 1
	releaseall
	end

scr_seq_0089_0F89:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	scrcmd_249 74, 21
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40B4, 1
	releaseall
	end

scr_seq_0089_0FB6:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40B5, 1
	releaseall
	end

scr_seq_0089_0FE3:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	scrcmd_249 74, 21
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40B6, 1
	releaseall
	end

scr_seq_0089_1010:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40B7, 1
	releaseall
	end

scr_seq_0089_103D:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40B8, 1
	releaseall
	end

scr_seq_0089_106A:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	scrcmd_249 109, 21
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40B9, 1
	releaseall
	end

scr_seq_0089_1097:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	scrcmd_249 109, 21
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40BA, 1
	releaseall
	end

scr_seq_0089_10C4:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	scrcmd_249 74, 21
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40BB, 1
	releaseall
	end

scr_seq_0089_10F1:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	scrcmd_249 74, 21
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40BC, 1
	releaseall
	end

scr_seq_0089_111E:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	scrcmd_249 109, 21
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40BD, 1
	releaseall
	end

scr_seq_0089_114B:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40BE, 1
	releaseall
	end

scr_seq_0089_1178:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40BF, 1
	releaseall
	end

scr_seq_0089_11A5:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	scrcmd_249 109, 21
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40C0, 1
	releaseall
	end

scr_seq_0089_11D2:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	scrcmd_249 74, 21
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_11FF
	setvar VAR_UNK_40C1, 1
	releaseall
	end

scr_seq_0089_11FF:
	scrcmd_219
	releaseall
	end

scr_seq_0089_1205:
	scrcmd_609
	lockall
	play_se SEQ_SE_PL_BOWABOWA
	fade_screen 6, 1, 0, 0
	wait_fade
	wait 15, VAR_SPECIAL_x800C
	scrcmd_176 247, 0, 50, 4, 2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end
	.balign 4, 0
