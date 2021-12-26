#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000868_0000000A ; 000
	scrdef scr_seq_00000868_0000003B ; 001
	scrdef_end

scr_seq_00000868_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000868_00000030
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000868_00000030:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000868_0000003B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 1, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000868_00000062
	msgbox 2
	goto scr_seq_00000868_00000065

scr_seq_00000868_00000062:
	msgbox 3
scr_seq_00000868_00000065:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
