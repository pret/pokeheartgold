#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0096_D37R0104_042C ; 000
	scrdef scr_seq_0096_D37R0104_0274 ; 001
	scrdef scr_seq_0096_D37R0104_00BC ; 002
	scrdef scr_seq_0096_D37R0104_0595 ; 003
	scrdef scr_seq_0096_D37R0104_061C ; 004
	scrdef scr_seq_0096_D37R0104_0071 ; 005
	scrdef scr_seq_0096_D37R0104_001E ; 006
	scrdef_end

scr_seq_0096_D37R0104_001E:
	setflag FLAG_UNK_1B7
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_0096_D37R0104_0033
	clearflag FLAG_UNK_1B7
scr_seq_0096_D37R0104_0033:
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 0
	setvar VAR_TEMP_x4002, 1
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	setvar VAR_TEMP_x4005, 0
	setvar VAR_TEMP_x4006, 0
	setvar VAR_TEMP_x4007, 0
	setvar VAR_TEMP_x4008, 0
	setvar VAR_TEMP_x4009, 1
	end

scr_seq_0096_D37R0104_0071:
	scrcmd_375 31
	scrcmd_375 30
	scrcmd_375 29
	scrcmd_375 32
	scrcmd_375 33
	scrcmd_375 34
	checkflag FLAG_UNK_09B
	gotoif TRUE, scr_seq_0096_D37R0104_0096
	end

scr_seq_0096_D37R0104_0096:
	show_person_at 26, 18, 0, 14, 0
	show_person_at 27, 24, 0, 14, 0
	show_person_at 34, 24, 0, 14, 0
	end

scr_seq_0096_D37R0104_00BC:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_ZUKAN06
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0096_D37R0104_00F5
	apply_movement 8, scr_seq_0096_D37R0104_05CC
	apply_movement 9, scr_seq_0096_D37R0104_05D4
	apply_movement 30, scr_seq_0096_D37R0104_060C
	setvar VAR_TEMP_x4001, 1
	goto scr_seq_0096_D37R0104_0113

scr_seq_0096_D37R0104_00F5:
	apply_movement 8, scr_seq_0096_D37R0104_05DC
	apply_movement 9, scr_seq_0096_D37R0104_05E4
	apply_movement 30, scr_seq_0096_D37R0104_0614
	setvar VAR_TEMP_x4001, 0
scr_seq_0096_D37R0104_0113:
	comparevartovalue VAR_TEMP_x4003, 0
	gotoif ne, scr_seq_0096_D37R0104_013C
	apply_movement 12, scr_seq_0096_D37R0104_05EC
	apply_movement 13, scr_seq_0096_D37R0104_05F4
	setvar VAR_TEMP_x4003, 1
	goto scr_seq_0096_D37R0104_0152

scr_seq_0096_D37R0104_013C:
	apply_movement 12, scr_seq_0096_D37R0104_05FC
	apply_movement 13, scr_seq_0096_D37R0104_0604
	setvar VAR_TEMP_x4003, 0
scr_seq_0096_D37R0104_0152:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0096_D37R0104_0183
	apply_movement 16, scr_seq_0096_D37R0104_05CC
	apply_movement 17, scr_seq_0096_D37R0104_05D4
	apply_movement 32, scr_seq_0096_D37R0104_060C
	setvar VAR_TEMP_x4005, 1
	goto scr_seq_0096_D37R0104_01A1

scr_seq_0096_D37R0104_0183:
	apply_movement 16, scr_seq_0096_D37R0104_05DC
	apply_movement 17, scr_seq_0096_D37R0104_05E4
	apply_movement 32, scr_seq_0096_D37R0104_0614
	setvar VAR_TEMP_x4005, 0
scr_seq_0096_D37R0104_01A1:
	comparevartovalue VAR_TEMP_x4006, 0
	gotoif ne, scr_seq_0096_D37R0104_01D2
	apply_movement 18, scr_seq_0096_D37R0104_05CC
	apply_movement 19, scr_seq_0096_D37R0104_05D4
	apply_movement 33, scr_seq_0096_D37R0104_060C
	setvar VAR_TEMP_x4006, 1
	goto scr_seq_0096_D37R0104_01F0

scr_seq_0096_D37R0104_01D2:
	apply_movement 18, scr_seq_0096_D37R0104_05DC
	apply_movement 19, scr_seq_0096_D37R0104_05E4
	apply_movement 33, scr_seq_0096_D37R0104_0614
	setvar VAR_TEMP_x4006, 0
scr_seq_0096_D37R0104_01F0:
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, scr_seq_0096_D37R0104_0219
	apply_movement 20, scr_seq_0096_D37R0104_05EC
	apply_movement 21, scr_seq_0096_D37R0104_05F4
	setvar VAR_TEMP_x4007, 1
	goto scr_seq_0096_D37R0104_022F

scr_seq_0096_D37R0104_0219:
	apply_movement 20, scr_seq_0096_D37R0104_05FC
	apply_movement 21, scr_seq_0096_D37R0104_0604
	setvar VAR_TEMP_x4007, 0
scr_seq_0096_D37R0104_022F:
	comparevartovalue VAR_TEMP_x4008, 0
	gotoif ne, scr_seq_0096_D37R0104_0258
	apply_movement 22, scr_seq_0096_D37R0104_05EC
	apply_movement 23, scr_seq_0096_D37R0104_05F4
	setvar VAR_TEMP_x4008, 1
	goto scr_seq_0096_D37R0104_026E

scr_seq_0096_D37R0104_0258:
	apply_movement 22, scr_seq_0096_D37R0104_05FC
	apply_movement 23, scr_seq_0096_D37R0104_0604
	setvar VAR_TEMP_x4008, 0
scr_seq_0096_D37R0104_026E:
	wait_movement
	releaseall
	end

scr_seq_0096_D37R0104_0274:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_ZUKAN06
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0096_D37R0104_02AD
	apply_movement 6, scr_seq_0096_D37R0104_05CC
	apply_movement 7, scr_seq_0096_D37R0104_05D4
	apply_movement 31, scr_seq_0096_D37R0104_060C
	setvar VAR_TEMP_x4000, 1
	goto scr_seq_0096_D37R0104_02CB

scr_seq_0096_D37R0104_02AD:
	apply_movement 6, scr_seq_0096_D37R0104_05DC
	apply_movement 7, scr_seq_0096_D37R0104_05E4
	apply_movement 31, scr_seq_0096_D37R0104_0614
	setvar VAR_TEMP_x4000, 0
scr_seq_0096_D37R0104_02CB:
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0096_D37R0104_02F4
	apply_movement 10, scr_seq_0096_D37R0104_05EC
	apply_movement 11, scr_seq_0096_D37R0104_05F4
	setvar VAR_TEMP_x4002, 1
	goto scr_seq_0096_D37R0104_030A

scr_seq_0096_D37R0104_02F4:
	apply_movement 10, scr_seq_0096_D37R0104_05FC
	apply_movement 11, scr_seq_0096_D37R0104_0604
	setvar VAR_TEMP_x4002, 0
scr_seq_0096_D37R0104_030A:
	comparevartovalue VAR_TEMP_x4004, 0
	gotoif ne, scr_seq_0096_D37R0104_033B
	apply_movement 14, scr_seq_0096_D37R0104_05CC
	apply_movement 15, scr_seq_0096_D37R0104_05D4
	apply_movement 29, scr_seq_0096_D37R0104_060C
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_0096_D37R0104_0359

scr_seq_0096_D37R0104_033B:
	apply_movement 14, scr_seq_0096_D37R0104_05DC
	apply_movement 15, scr_seq_0096_D37R0104_05E4
	apply_movement 29, scr_seq_0096_D37R0104_0614
	setvar VAR_TEMP_x4004, 0
scr_seq_0096_D37R0104_0359:
	comparevartovalue VAR_TEMP_x4006, 0
	gotoif ne, scr_seq_0096_D37R0104_038A
	apply_movement 18, scr_seq_0096_D37R0104_05CC
	apply_movement 19, scr_seq_0096_D37R0104_05D4
	apply_movement 33, scr_seq_0096_D37R0104_060C
	setvar VAR_TEMP_x4006, 1
	goto scr_seq_0096_D37R0104_03A8

scr_seq_0096_D37R0104_038A:
	apply_movement 18, scr_seq_0096_D37R0104_05DC
	apply_movement 19, scr_seq_0096_D37R0104_05E4
	apply_movement 33, scr_seq_0096_D37R0104_0614
	setvar VAR_TEMP_x4006, 0
scr_seq_0096_D37R0104_03A8:
	comparevartovalue VAR_TEMP_x4008, 0
	gotoif ne, scr_seq_0096_D37R0104_03D1
	apply_movement 22, scr_seq_0096_D37R0104_05EC
	apply_movement 23, scr_seq_0096_D37R0104_05F4
	setvar VAR_TEMP_x4008, 1
	goto scr_seq_0096_D37R0104_03E7

scr_seq_0096_D37R0104_03D1:
	apply_movement 22, scr_seq_0096_D37R0104_05FC
	apply_movement 23, scr_seq_0096_D37R0104_0604
	setvar VAR_TEMP_x4008, 0
scr_seq_0096_D37R0104_03E7:
	comparevartovalue VAR_TEMP_x4009, 0
	gotoif ne, scr_seq_0096_D37R0104_0410
	apply_movement 24, scr_seq_0096_D37R0104_05EC
	apply_movement 25, scr_seq_0096_D37R0104_05F4
	setvar VAR_TEMP_x4009, 1
	goto scr_seq_0096_D37R0104_0426

scr_seq_0096_D37R0104_0410:
	apply_movement 24, scr_seq_0096_D37R0104_05FC
	apply_movement 25, scr_seq_0096_D37R0104_0604
	setvar VAR_TEMP_x4009, 0
scr_seq_0096_D37R0104_0426:
	wait_movement
	releaseall
	end

scr_seq_0096_D37R0104_042C:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_ZUKAN06
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0096_D37R0104_045D
	apply_movement 10, scr_seq_0096_D37R0104_05EC
	apply_movement 11, scr_seq_0096_D37R0104_05F4
	setvar VAR_TEMP_x4002, 1
	goto scr_seq_0096_D37R0104_0473

scr_seq_0096_D37R0104_045D:
	apply_movement 10, scr_seq_0096_D37R0104_05FC
	apply_movement 11, scr_seq_0096_D37R0104_0604
	setvar VAR_TEMP_x4002, 0
scr_seq_0096_D37R0104_0473:
	comparevartovalue VAR_TEMP_x4003, 0
	gotoif ne, scr_seq_0096_D37R0104_049C
	apply_movement 12, scr_seq_0096_D37R0104_05EC
	apply_movement 13, scr_seq_0096_D37R0104_05F4
	setvar VAR_TEMP_x4003, 1
	goto scr_seq_0096_D37R0104_04B2

scr_seq_0096_D37R0104_049C:
	apply_movement 12, scr_seq_0096_D37R0104_05FC
	apply_movement 13, scr_seq_0096_D37R0104_0604
	setvar VAR_TEMP_x4003, 0
scr_seq_0096_D37R0104_04B2:
	comparevartovalue VAR_TEMP_x4004, 0
	gotoif ne, scr_seq_0096_D37R0104_04E3
	apply_movement 14, scr_seq_0096_D37R0104_05CC
	apply_movement 15, scr_seq_0096_D37R0104_05D4
	apply_movement 29, scr_seq_0096_D37R0104_060C
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_0096_D37R0104_0501

scr_seq_0096_D37R0104_04E3:
	apply_movement 14, scr_seq_0096_D37R0104_05DC
	apply_movement 15, scr_seq_0096_D37R0104_05E4
	apply_movement 29, scr_seq_0096_D37R0104_0614
	setvar VAR_TEMP_x4004, 0
scr_seq_0096_D37R0104_0501:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0096_D37R0104_0532
	apply_movement 16, scr_seq_0096_D37R0104_05CC
	apply_movement 17, scr_seq_0096_D37R0104_05D4
	apply_movement 32, scr_seq_0096_D37R0104_060C
	setvar VAR_TEMP_x4005, 1
	goto scr_seq_0096_D37R0104_0550

scr_seq_0096_D37R0104_0532:
	apply_movement 16, scr_seq_0096_D37R0104_05DC
	apply_movement 17, scr_seq_0096_D37R0104_05E4
	apply_movement 32, scr_seq_0096_D37R0104_0614
	setvar VAR_TEMP_x4005, 0
scr_seq_0096_D37R0104_0550:
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, scr_seq_0096_D37R0104_0579
	apply_movement 20, scr_seq_0096_D37R0104_05EC
	apply_movement 21, scr_seq_0096_D37R0104_05F4
	setvar VAR_TEMP_x4007, 1
	goto scr_seq_0096_D37R0104_058F

scr_seq_0096_D37R0104_0579:
	apply_movement 20, scr_seq_0096_D37R0104_05FC
	apply_movement 21, scr_seq_0096_D37R0104_0604
	setvar VAR_TEMP_x4007, 0
scr_seq_0096_D37R0104_058F:
	wait_movement
	releaseall
	end

scr_seq_0096_D37R0104_0595:
	checkflag FLAG_UNK_09B
	gotoif TRUE, scr_seq_0096_D37R0104_05CA
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_ZUKAN06
	apply_movement 26, scr_seq_0096_D37R0104_05DC
	apply_movement 27, scr_seq_0096_D37R0104_05E4
	apply_movement 34, scr_seq_0096_D37R0104_0614
	wait_movement
	setflag FLAG_UNK_09B
	releaseall
	end

scr_seq_0096_D37R0104_05CA:
	end


scr_seq_0096_D37R0104_05CC:
	.short 15, 2
	.short 254, 0

scr_seq_0096_D37R0104_05D4:
	.short 14, 2
	.short 254, 0

scr_seq_0096_D37R0104_05DC:
	.short 14, 2
	.short 254, 0

scr_seq_0096_D37R0104_05E4:
	.short 15, 2
	.short 254, 0

scr_seq_0096_D37R0104_05EC:
	.short 13, 2
	.short 254, 0

scr_seq_0096_D37R0104_05F4:
	.short 12, 2
	.short 254, 0

scr_seq_0096_D37R0104_05FC:
	.short 12, 2
	.short 254, 0

scr_seq_0096_D37R0104_0604:
	.short 13, 2
	.short 254, 0

scr_seq_0096_D37R0104_060C:
	.short 15, 2
	.short 254, 0

scr_seq_0096_D37R0104_0614:
	.short 14, 2
	.short 254, 0
scr_seq_0096_D37R0104_061C:
	scrcmd_609
	lockall
	callstd std_play_rival_intro_music
	show_person_at 28, 28, 0, 4, 2
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 28, scr_seq_0096_D37R0104_06E0
	apply_movement 255, scr_seq_0096_D37R0104_06F4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_191 0
	npc_msg 0
	closemsg
	get_starter_choice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 152
	gotoif ne, scr_seq_0096_D37R0104_067D
	trainer_battle TRAINER_RIVAL_SILVER_18, 0, 0, 0
	goto scr_seq_0096_D37R0104_06A0

scr_seq_0096_D37R0104_067D:
	comparevartovalue VAR_SPECIAL_x800C, 155
	gotoif ne, scr_seq_0096_D37R0104_0698
	trainer_battle TRAINER_RIVAL_SILVER_12, 0, 0, 0
	goto scr_seq_0096_D37R0104_06A0

scr_seq_0096_D37R0104_0698:
	trainer_battle TRAINER_RIVAL_SILVER_17, 0, 0, 0
scr_seq_0096_D37R0104_06A0:
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0096_D37R0104_06D9
	callstd std_play_rival_outro_music
	scrcmd_191 0
	npc_msg 1
	closemsg
	setvar VAR_UNK_40A0, 1
	apply_movement 28, scr_seq_0096_D37R0104_0700
	wait_movement
	hide_person 28
	callstd 2071
	releaseall
	end

scr_seq_0096_D37R0104_06D9:
	white_out
	releaseall
	end

scr_seq_0096_D37R0104_06DF:
	.byte 0x00

scr_seq_0096_D37R0104_06E0:
	.short 62, 6
	.short 14, 3
	.short 13, 1
	.short 14, 4
	.short 254, 0

scr_seq_0096_D37R0104_06F4:
	.short 75, 1
	.short 15, 1
	.short 254, 0

scr_seq_0096_D37R0104_0700:
	.short 15, 4
	.short 12, 1
	.short 15, 4
	.short 254, 0
	.balign 4, 0
