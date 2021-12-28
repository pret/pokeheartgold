#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0819_T10R0101_021C ; 000
	scrdef scr_seq_0819_T10R0101_00AE ; 001
	scrdef scr_seq_0819_T10R0101_00C1 ; 002
	scrdef scr_seq_0819_T10R0101_00D4 ; 003
	scrdef scr_seq_0819_T10R0101_0228 ; 004
	scrdef scr_seq_0819_T10R0101_0026 ; 005
	scrdef scr_seq_0819_T10R0101_00EF ; 006
	scrdef scr_seq_0819_T10R0101_02C0 ; 007
	scrdef scr_seq_0819_T10R0101_0244 ; 008
	scrdef_end

scr_seq_0819_T10R0101_0026:
	setflag FLAG_UNK_20B
	setflag FLAG_UNK_20C
	setflag FLAG_UNK_20D
	setflag FLAG_UNK_20E
	clearflag FLAG_UNK_211
	clearflag FLAG_UNK_212
	clearflag FLAG_UNK_213
	clearflag FLAG_UNK_214
	clearflag FLAG_UNK_0E4
	clearflag FLAG_UNK_0E5
	clearflag FLAG_UNK_0E6
	clearflag FLAG_UNK_0E7
	comparevartovalue VAR_UNK_40FC, 1
	gotoif le, scr_seq_0819_T10R0101_00AC
	checkflag FLAG_UNK_AA9
	gotoif TRUE, scr_seq_0819_T10R0101_00AC
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0819_T10R0101_008B
	setvar VAR_UNK_4119, 1
	goto scr_seq_0819_T10R0101_00AA

scr_seq_0819_T10R0101_008B:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0819_T10R0101_00A4
	setvar VAR_UNK_4119, 1
	goto scr_seq_0819_T10R0101_00AA

scr_seq_0819_T10R0101_00A4:
	setvar VAR_UNK_4119, 0
scr_seq_0819_T10R0101_00AA:
	end

scr_seq_0819_T10R0101_00AC:
	end

scr_seq_0819_T10R0101_00AE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0819_T10R0101_00C1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0819_T10R0101_00D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 63, 0
	npc_msg 2
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0819_T10R0101_00EF:
	scrcmd_609
	lockall
	fade_out_bgm 0, 3
	apply_movement 255, scr_seq_0819_T10R0101_01DC
	wait_movement
	callstd std_play_rival_intro_music
	get_player_coords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	clearflag FLAG_UNK_250
	scrcmd_100 5
	show_person_at 5, VAR_SPECIAL_x8000, 0, 23, 0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 5, scr_seq_0819_T10R0101_0208
	apply_movement 255, scr_seq_0819_T10R0101_01E8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_191 0
	npc_msg 3
	closemsg
	get_starter_choice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 152
	gotoif ne, scr_seq_0819_T10R0101_016E
	trainer_battle TRAINER_RIVAL_SILVER_20, 0, 0, 0
	goto scr_seq_0819_T10R0101_0191

scr_seq_0819_T10R0101_016E:
	comparevartovalue VAR_SPECIAL_x800C, 155
	gotoif ne, scr_seq_0819_T10R0101_0189
	trainer_battle TRAINER_RIVAL_SILVER_21, 0, 0, 0
	goto scr_seq_0819_T10R0101_0191

scr_seq_0819_T10R0101_0189:
	trainer_battle TRAINER_RIVAL_SILVER_19, 0, 0, 0
scr_seq_0819_T10R0101_0191:
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0819_T10R0101_01CE
	callstd std_play_rival_outro_music
	scrcmd_191 0
	npc_msg 4
	closemsg
	apply_movement 5, scr_seq_0819_T10R0101_0210
	wait_movement
	setvar VAR_UNK_4119, 0
	setflag FLAG_UNK_AA9
	hide_person 5
	callstd 2071
	releaseall
	end

scr_seq_0819_T10R0101_01CE:
	hide_person 5
	setflag FLAG_UNK_250
	white_out
	releaseall
	end


scr_seq_0819_T10R0101_01DC:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_0819_T10R0101_01E8:
	.short 63, 2
	.short 13, 1
	.short 254, 0
	.byte 0x3f, 0x00, 0x02, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x01, 0x00
	.byte 0x21, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0819_T10R0101_0208:
	.short 12, 7
	.short 254, 0

scr_seq_0819_T10R0101_0210:
	.short 33, 1
	.short 13, 7
	.short 254, 0
scr_seq_0819_T10R0101_021C:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_0819_T10R0101_0228:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 13
	callstd 2052
	releaseall
	end

scr_seq_0819_T10R0101_0244:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ge, scr_seq_0819_T10R0101_0293
	npc_msg 5
	closemsg
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0819_T10R0101_027D
	apply_movement 8, scr_seq_0819_T10R0101_02A0
	goto scr_seq_0819_T10R0101_0287

scr_seq_0819_T10R0101_027D:
	apply_movement 8, scr_seq_0819_T10R0101_02B0
	wait_movement
scr_seq_0819_T10R0101_0287:
	wait_movement
	setvar VAR_TEMP_x4005, 1
	releaseall
	end

scr_seq_0819_T10R0101_0293:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0819_T10R0101_029E:
	.byte 0x00, 0x00

scr_seq_0819_T10R0101_02A0:
	.short 71, 1
	.short 14, 1
	.short 72, 1
	.short 254, 0

scr_seq_0819_T10R0101_02B0:
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0
scr_seq_0819_T10R0101_02C0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	scrcmd_746
scr_seq_0819_T10R0101_02CD:
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 8, 255, 0
	scrcmd_751 9, 255, 1
	scrcmd_751 10, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0819_T10R0101_0317
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0819_T10R0101_0456
	goto scr_seq_0819_T10R0101_058C

scr_seq_0819_T10R0101_0315:
	.byte 0x02, 0x00
scr_seq_0819_T10R0101_0317:
	comparevartovalue VAR_UNK_40E6, 0
	gotoif eq, scr_seq_0819_T10R0101_037A
	npc_msg 11
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 12, 255, 0
	scrcmd_751 13, 255, 1
	scrcmd_751 14, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0819_T10R0101_037A
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0819_T10R0101_03F1
	goto scr_seq_0819_T10R0101_0371

scr_seq_0819_T10R0101_036F:
	.byte 0x02
	.byte 0x00
scr_seq_0819_T10R0101_0371:
	npc_msg 7
	goto scr_seq_0819_T10R0101_02CD

scr_seq_0819_T10R0101_037A:
	npc_msg 15
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 16, 255, 0
	scrcmd_751 17, 255, 1
	scrcmd_751 18, 255, 2
	scrcmd_751 19, 255, 3
	scrcmd_751 26, 255, 4
	scrcmd_752
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0819_T10R0101_03CF
	closemsg
	scrcmd_378 4, 32780
	npc_msg 7
	scrcmd_746
	goto scr_seq_0819_T10R0101_02CD

scr_seq_0819_T10R0101_03CF:
	comparevartovalue VAR_UNK_40E6, 0
	gotoif ne, scr_seq_0819_T10R0101_03EB
	npc_msg 7
	goto scr_seq_0819_T10R0101_02CD

scr_seq_0819_T10R0101_03E5:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0819_T10R0101_03EB:
	goto scr_seq_0819_T10R0101_0317

scr_seq_0819_T10R0101_03F1:
	npc_msg 15
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 20, 255, 0
	scrcmd_751 21, 255, 1
	scrcmd_751 22, 255, 2
	scrcmd_751 23, 255, 3
	scrcmd_751 24, 255, 4
	scrcmd_751 25, 255, 5
	scrcmd_751 26, 255, 6
	scrcmd_752
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0819_T10R0101_03CF
	closemsg
	scrcmd_378 3, 32780
	npc_msg 7
	scrcmd_746
	goto scr_seq_0819_T10R0101_02CD

scr_seq_0819_T10R0101_0456:
	comparevartovalue VAR_UNK_40E6, 0
	gotoif eq, scr_seq_0819_T10R0101_04B0
	npc_msg 11
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 12, 255, 0
	scrcmd_751 13, 255, 1
	scrcmd_751 14, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0819_T10R0101_04B0
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0819_T10R0101_0527
	goto scr_seq_0819_T10R0101_02CD

scr_seq_0819_T10R0101_04AE:
	.byte 0x02, 0x00
scr_seq_0819_T10R0101_04B0:
	npc_msg 15
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 16, 255, 0
	scrcmd_751 17, 255, 1
	scrcmd_751 18, 255, 2
	scrcmd_751 19, 255, 3
	scrcmd_751 26, 255, 4
	scrcmd_752
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0819_T10R0101_0505
	closemsg
	scrcmd_378 1, 32780
	npc_msg 7
	scrcmd_746
	goto scr_seq_0819_T10R0101_02CD

scr_seq_0819_T10R0101_0505:
	comparevartovalue VAR_UNK_40E6, 0
	gotoif ne, scr_seq_0819_T10R0101_0521
	npc_msg 7
	goto scr_seq_0819_T10R0101_02CD

scr_seq_0819_T10R0101_051B:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00
	.byte 0x00
scr_seq_0819_T10R0101_0521:
	goto scr_seq_0819_T10R0101_0456

scr_seq_0819_T10R0101_0527:
	npc_msg 15
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 20, 255, 0
	scrcmd_751 21, 255, 1
	scrcmd_751 22, 255, 2
	scrcmd_751 23, 255, 3
	scrcmd_751 24, 255, 4
	scrcmd_751 25, 255, 5
	scrcmd_751 26, 255, 6
	scrcmd_752
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0819_T10R0101_0505
	closemsg
	scrcmd_378 0, 32780
	npc_msg 7
	scrcmd_746
	goto scr_seq_0819_T10R0101_02CD

scr_seq_0819_T10R0101_058C:
	scrcmd_747
	closemsg
	releaseall
	end
	.balign 4, 0
