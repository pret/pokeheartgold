#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000738_00000006 ; 000
	scrdef_end

scr_seq_00000738_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_490 16674
	comparevartovalue VAR_UNK_4122, 7
	gotoif eq, scr_seq_00000738_0000003B
scr_seq_00000738_0000001F:
	scrcmd_522 32780
	comparevartovalue VAR_SPECIAL_x800C, 15
	gotoif eq, scr_seq_00000738_00000056
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000738_0000003B:
	scrcmd_147 31, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000738_0000001F
	goto scr_seq_00000738_0000015D

scr_seq_00000738_00000054:
	.byte 0x02, 0x00
scr_seq_00000738_00000056:
	checkflag FLAG_UNK_AA8
	gotoif TRUE, scr_seq_00000738_00000152
	msgbox 1
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000738_00000147
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000738_00000099
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000738_000000A7
	end

scr_seq_00000738_00000099:
	setvar VAR_SPECIAL_x8004, 0
	goto scr_seq_00000738_000000F0

scr_seq_00000738_000000A5:
	.byte 0x02, 0x00
scr_seq_00000738_000000A7:
	msgbox 2
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32772
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_490 32772
	comparevartovalue VAR_SPECIAL_x8004, 255
	gotoif eq, scr_seq_00000738_00000147
	get_partymon_species VAR_SPECIAL_x8004, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000738_0000013C
scr_seq_00000738_000000F0:
	bufferpartymonnick 0, VAR_SPECIAL_x8004
	play_se SEQ_SE_DP_FW367
	msgbox 3
	wait_se SEQ_SE_DP_FW367
	wait 15, VAR_SPECIAL_x800C
	scrcmd_383 10, 32772
	scrcmd_828 32772, 1, 32
	scrcmd_828 32772, 5, 22
	comparevartovalue VAR_UNK_4122, 7
	gotoif eq, scr_seq_00000738_0000012D
	addvar VAR_UNK_4122, 1
scr_seq_00000738_0000012D:
	setflag FLAG_UNK_AA8
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000738_0000013C:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000738_00000147:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000738_00000152:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000738_0000015D:
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ge, scr_seq_00000738_000001AE
	msgbox 8
scr_seq_00000738_0000016D:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000738_0000019D
	scrcmd_146 31
	buffer_players_name 0
	msgbox 9
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000738_0000019D:
	msgbox 11
	waitbutton
	closemsg
	setvar VAR_TEMP_x4004, 1
	releaseall
	end

scr_seq_00000738_000001AE:
	msgbox 12
	goto scr_seq_00000738_0000016D

scr_seq_00000738_000001B7:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00
	.balign 4, 0
