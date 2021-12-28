#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0845_T20R0201_001E ; 000
	scrdef scr_seq_0845_T20R0201_0126 ; 001
	scrdef scr_seq_0845_T20R0201_0449 ; 002
	scrdef scr_seq_0845_T20R0201_045A ; 003
	scrdef scr_seq_0845_T20R0201_046B ; 004
	scrdef scr_seq_0845_T20R0201_047C ; 005
	scrdef scr_seq_0845_T20R0201_00DC ; 006
	scrdef_end

scr_seq_0845_T20R0201_001E:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0845_T20R0201_00A4
	apply_movement 0, scr_seq_0845_T20R0201_00B0
	wait_movement
	callstd 2036
	wait 30, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0845_T20R0201_00B8
	wait_movement
	buffer_players_name 0
	gender_msgbox 0, 1
	setflag FLAG_GOT_BAG
	play_fanfare SEQ_SE_PL_KIRAKIRA
	wait_fanfare
	npc_msg 2
	setflag FLAG_GOT_TRAINER_CARD
	play_fanfare SEQ_SE_PL_KIRAKIRA
	wait_fanfare
	npc_msg 3
	setflag FLAG_GOT_SAVE_BUTTON
	play_fanfare SEQ_SE_PL_KIRAKIRA
	wait_fanfare
	npc_msg 4
	setflag FLAG_GOT_OPTIONS_BUTTON
	play_fanfare SEQ_SE_PL_KIRAKIRA
	wait_fanfare
	npc_msg 5
	closemsg
	wait 15, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0845_T20R0201_00C8
	wait_movement
	callstd 2038
	setvar VAR_UNK_4106, 1
	releaseall
	end

scr_seq_0845_T20R0201_00A3:
	.byte 0x00

scr_seq_0845_T20R0201_00A4:
	.short 62, 1
	.short 33, 1
	.short 254, 0

scr_seq_0845_T20R0201_00B0:
	.short 32, 1
	.short 254, 0

scr_seq_0845_T20R0201_00B8:
	.short 12, 2
	.short 14, 3
	.short 12, 1
	.short 254, 0

scr_seq_0845_T20R0201_00C8:
	.short 33, 1
	.short 13, 3
	.short 15, 3
	.short 32, 1
	.short 254, 0
scr_seq_0845_T20R0201_00DC:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0845_T20R0201_00A4
	apply_movement 0, scr_seq_0845_T20R0201_00B0
	wait_movement
	callstd 2036
	wait 30, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0845_T20R0201_00B8
	wait_movement
	buffer_players_name 0
	npc_msg 33
	closemsg
	apply_movement 0, scr_seq_0845_T20R0201_00C8
	wait_movement
	callstd 2038
	setvar VAR_UNK_4106, 4
	releaseall
	end

scr_seq_0845_T20R0201_0126:
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_0845_T20R0201_015C
	comparevartovalue VAR_UNK_4108, 4
	gotoif ge, scr_seq_0845_T20R0201_0205
	checkflag FLAG_GOT_STARTER
	gotoif TRUE, scr_seq_0845_T20R0201_0179
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_015C:
	hasitem ITEM_S_S__TICKET, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0845_T20R0201_01F2
	goto scr_seq_0845_T20R0201_0205

scr_seq_0845_T20R0201_0177:
	.byte 0x02, 0x00
scr_seq_0845_T20R0201_0179:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_09C
	gotoif TRUE, scr_seq_0845_T20R0201_01D4
	buffer_players_name 0
	npc_msg 7
	buffer_players_name 0
	npc_msg 8
	setflag FLAG_UNK_09C
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg 9
	npc_msg 10
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0845_T20R0201_01C6
	npc_msg 11
	goto scr_seq_0845_T20R0201_01C9

scr_seq_0845_T20R0201_01C6:
	npc_msg 12
scr_seq_0845_T20R0201_01C9:
	npc_msg 13
	scrcmd_051
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_01D4:
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_01DF:
	.byte 0x49
	.byte 0x00, 0xdc, 0x05, 0x60, 0x00, 0x68, 0x00, 0x2d, 0x00, 0x07, 0x32, 0x00, 0x35, 0x00, 0x61, 0x00
	.byte 0x02, 0x00
scr_seq_0845_T20R0201_01F2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_0205:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0A7
	gotoif TRUE, scr_seq_0845_T20R0201_0275
	scrcmd_294 0, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0845_T20R0201_0234
	npc_msg 15
	goto scr_seq_0845_T20R0201_023A

scr_seq_0845_T20R0201_0234:
	buffer_players_name 0
	npc_msg 16
scr_seq_0845_T20R0201_023A:
	setflag FLAG_UNK_0A7
	setvar VAR_UNK_4095, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0845_T20R0201_0266
	npc_msg 17
	setflag FLAG_UNK_986
	goto scr_seq_0845_T20R0201_026D

scr_seq_0845_T20R0201_0266:
	npc_msg 18
	clearflag FLAG_UNK_986
scr_seq_0845_T20R0201_026D:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_0275:
	npc_msg 20
	scrcmd_795 1, 1
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 29, 255, 0
	scrcmd_751 30, 255, 1
	scrcmd_751 31, 255, 2
	scrcmd_751 32, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0845_T20R0201_02DF
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0845_T20R0201_0335
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0845_T20R0201_0398
	goto scr_seq_0845_T20R0201_03D1

scr_seq_0845_T20R0201_02DD:
	.byte 0x02, 0x00
scr_seq_0845_T20R0201_02DF:
	bank_or_wallet_is_full 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0845_T20R0201_043A
	check_bank_balance VAR_SPECIAL_x800C, 1
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0845_T20R0201_041C
	bank_transaction 1, VAR_SPECIAL_x800C
	scrcmd_796
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0845_T20R0201_03E0
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0845_T20R0201_0411
	releaseall
	end

scr_seq_0845_T20R0201_0335:
	bank_or_wallet_is_full 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0845_T20R0201_042B
	hasenoughmoneyvar 32780, 1
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0845_T20R0201_0389
	bank_transaction 0, VAR_SPECIAL_x800C
	scrcmd_796
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0845_T20R0201_03FA
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0845_T20R0201_0411
	releaseall
	end

scr_seq_0845_T20R0201_0389:
	scrcmd_747
	scrcmd_796
	npc_msg 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_0398:
	npc_msg 25
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	scrcmd_796
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0845_T20R0201_03C2
	buffer_players_name 0
	npc_msg 17
	setflag FLAG_UNK_986
	goto scr_seq_0845_T20R0201_03C9

scr_seq_0845_T20R0201_03C2:
	npc_msg 18
	clearflag FLAG_UNK_986
scr_seq_0845_T20R0201_03C9:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_03D1:
	scrcmd_796
	scrcmd_747
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_03E0:
	closemsg
	wait 8, VAR_SPECIAL_x800C
	play_se SEQ_SE_GS_OKOZUKAI
	buffer_players_name 0
	npc_msg 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_03FA:
	closemsg
	wait 8, VAR_SPECIAL_x800C
	play_se SEQ_SE_GS_OKOZUKAI
	npc_msg 23
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_0411:
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_041C:
	scrcmd_747
	scrcmd_796
	npc_msg 22
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_042B:
	scrcmd_747
	scrcmd_796
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_043A:
	scrcmd_747
	scrcmd_796
	npc_msg 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_0449:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 35
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_045A:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 36
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_046B:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 37
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0845_T20R0201_047C:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 38
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
