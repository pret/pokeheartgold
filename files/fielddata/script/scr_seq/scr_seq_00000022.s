#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000022_0000000A ; 000
	scrdef scr_seq_00000022_000000AB ; 001
	scrdef_end

scr_seq_00000022_0000000A:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000022_0000001B
	clearflag FLAG_UNK_189
	end

scr_seq_00000022_0000001B:
	checkflag FLAG_UNK_964
	gotoif lt, scr_seq_00000022_000000A5
	scrcmd_142 37, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000022_000000A5
	scrcmd_147 37, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000022_00000084
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000022_00000067
	clearflag FLAG_UNK_2CA
	goto scr_seq_00000022_00000082

scr_seq_00000022_00000067:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000022_0000007E
	clearflag FLAG_UNK_2CA
	goto scr_seq_00000022_00000082

scr_seq_00000022_0000007E:
	setflag FLAG_UNK_2CA
scr_seq_00000022_00000082:
	end

scr_seq_00000022_00000084:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000022_0000009F
	clearflag FLAG_UNK_2CA
	goto scr_seq_00000022_000000A3

scr_seq_00000022_0000009F:
	setflag FLAG_UNK_2CA
scr_seq_00000022_000000A3:
	end

scr_seq_00000022_000000A5:
	setflag FLAG_UNK_2CA
	end

scr_seq_00000022_000000AB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 37, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000022_00000159
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_00000022_0000014E
	msgbox 0
scr_seq_00000022_000000D6:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000022_000000FA
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000022_0000013D
	end

scr_seq_00000022_000000FA:
	scrcmd_190 0
	msgbox 1
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 37
	msgbox 2
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	setflag FLAG_UNK_2CA
	hide_person 0
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000022_0000013D:
	setvar VAR_TEMP_x4002, 1
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000022_0000014E:
	msgbox 4
	goto scr_seq_00000022_000000D6

scr_seq_00000022_00000157:
	.byte 0x02, 0x00
scr_seq_00000022_00000159:
	msgbox 5
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000022_000001BA
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000022_000001C5
	msgbox 6
	closemsg
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 20
	faceplayer
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000022_000001BA:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000022_000001C5:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
