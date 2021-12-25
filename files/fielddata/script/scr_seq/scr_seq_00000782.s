#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000782_00000022 ; 000
	scrdef scr_seq_00000782_000000A9 ; 001
	scrdef scr_seq_00000782_000000BC ; 002
	scrdef scr_seq_00000782_0000014C ; 003
	scrdef scr_seq_00000782_0000015F ; 004
	scrdef scr_seq_00000782_0000019A ; 005
	scrdef scr_seq_00000782_000001AD ; 006
	scrdef scr_seq_00000782_0000017A ; 007
	scrdef_end

scr_seq_00000782_00000022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F8
	gotoif lt, scr_seq_00000782_00000044
	scrcmd_190 0
	scrcmd_132 4, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000782_00000044:
	msgbox 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000782_0000009E
	msgbox 1
	setvar VAR_SPECIAL_x8004, 50
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000782_00000093
	callstd 2033
	setflag FLAG_UNK_0F8
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000782_00000093:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000782_0000009E:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000782_000000A9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000782_000000BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity 479, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000782_00000141
	getitemquantity 480, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000782_00000141
	checkflag FLAG_UNK_119
	gotoif eq, scr_seq_00000782_00000116
	checkflag FLAG_UNK_118
	gotoif eq, scr_seq_00000782_0000010B
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000782_0000010B:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000782_00000116:
	msgbox 11
	scrcmd_101 5
	setflag FLAG_UNK_2FC
	setvar VAR_SPECIAL_x8004, 479
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_UNK_4130, 1
	clearflag FLAG_UNK_2FD
	closemsg
	releaseall
	end

scr_seq_00000782_00000141:
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000782_0000014C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000782_0000015F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 153, 0
	msgbox 16
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000782_0000017A:
	checkflag FLAG_UNK_2FC
	gotoif eq, scr_seq_00000782_00000198
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000782_00000198:
	end

scr_seq_00000782_0000019A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000782_000001AD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
