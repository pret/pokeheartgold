#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000917_0000000E ; 000
	scrdef scr_seq_00000917_00000021 ; 001
	scrdef scr_seq_00000917_00000034 ; 002
	scrdef_end

scr_seq_00000917_0000000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000917_00000021:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000917_00000034:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_AB9
	gotoif lt, scr_seq_00000917_00000050
	msgbox 4
	goto scr_seq_00000917_000000E3

scr_seq_00000917_00000050:
	msgbox 2
	hasitem ITEM_SEAL_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000917_00000071
	msgbox 5
	goto scr_seq_00000917_000000E3

scr_seq_00000917_00000071:
	scrcmd_135 32768, 32769, 32770
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif ne, scr_seq_00000917_0000008F
	msgbox 3
	goto scr_seq_00000917_000000E3

scr_seq_00000917_0000008F:
	setflag FLAG_UNK_AB9
	scrcmd_580 0, 32768
	msgbox 6
	play_fanfare SEQ_ME_ITEM
	msgbox 11
	wait_fanfare
	comparevartovalue VAR_SPECIAL_x8001, 0
	gotoif eq, scr_seq_00000917_000000EB
	scrcmd_580 0, 32769
	msgbox 7
	play_fanfare SEQ_ME_ITEM
	msgbox 11
	wait_fanfare
	comparevartovalue VAR_SPECIAL_x8002, 0
	gotoif eq, scr_seq_00000917_000000EB
	scrcmd_580 0, 32770
	msgbox 8
	play_fanfare SEQ_ME_ITEM
	msgbox 11
	wait_fanfare
	msgbox 9
scr_seq_00000917_000000E3:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000917_000000EB:
	msgbox 10
	goto scr_seq_00000917_000000E3

scr_seq_00000917_000000F4:
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
