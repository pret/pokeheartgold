#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000849_00000027 ; 000
	scrdef scr_seq_00000849_000001A1 ; 001
	scrdef scr_seq_00000849_00000016 ; 002
	scrdef scr_seq_00000849_000001BC ; 003
	scrdef scr_seq_00000849_000001CD ; 004
	scrdef_end

scr_seq_00000849_00000016:
	checkflag FLAG_UNK_2E5
	gotoif eq, scr_seq_00000849_00000025
	scrcmd_144 16416
scr_seq_00000849_00000025:
	end

scr_seq_00000849_00000027:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000849_0000006D
	scrcmd_190 0
	checkflag FLAG_GOT_STARTER
	gotoif eq, scr_seq_00000849_0000005C
	scrcmd_132 0, 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000849_0000005C:
	scrcmd_193 1, 32780
	scrcmd_132 2, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000849_0000006D:
	scrcmd_529 VAR_SPECIAL_x8006
	scrcmd_825 32774, 32780
	checkflag FLAG_UNK_161
	gotoif eq, scr_seq_00000849_000000B1
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000849_0000009E
scr_seq_00000849_0000008F:
	scrcmd_190 0
	scrcmd_132 5, 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000849_0000009E:
	setflag FLAG_UNK_161
	scrcmd_190 0
	scrcmd_132 7, 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000849_000000B1:
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8004, 6
	gotoif eq, scr_seq_00000849_000000E4
	comparevartovalue VAR_SPECIAL_x8004, 5
	gotoif eq, scr_seq_00000849_000000FC
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ge, scr_seq_00000849_00000137
	goto scr_seq_00000849_0000008F

scr_seq_00000849_000000E4:
	scrcmd_190 0
	scrcmd_727 32780
	bufferpartymonnick 1, VAR_SPECIAL_x800C
	scrcmd_132 15, 16
	closemsg
	goto scr_seq_00000849_0000010D

scr_seq_00000849_000000FC:
	scrcmd_826 32774
	setflag FLAG_UNK_184
	scrcmd_190 0
	scrcmd_132 11, 12
	closemsg
scr_seq_00000849_0000010D:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_425 2
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_132 13, 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000849_00000137:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_00000849_00000150
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_00000849_00000188

scr_seq_00000849_00000150:
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ne, scr_seq_00000849_00000169
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000849_00000188

scr_seq_00000849_00000169:
	comparevartovalue VAR_SPECIAL_x8004, 3
	gotoif ne, scr_seq_00000849_00000182
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000849_00000188

scr_seq_00000849_00000182:
	setvar VAR_SPECIAL_x8005, 1
scr_seq_00000849_00000188:
	scrcmd_190 0
	scrcmd_198 1, 32772
	scrcmd_198 2, 32773
	scrcmd_132 9, 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000849_000001A1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	scrcmd_076 183, 0
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000849_000001BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000849_000001CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
