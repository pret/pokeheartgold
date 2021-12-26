#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000878_00000012 ; 000
	scrdef scr_seq_00000878_0000001E ; 001
	scrdef scr_seq_00000878_00000031 ; 002
	scrdef scr_seq_00000878_000000EF ; 003
	scrdef_end

scr_seq_00000878_00000012:
	setvar VAR_SPECIAL_x8007, 3
	callstd 2002
	end

scr_seq_00000878_0000001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000878_00000031:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_507 32780
	comparevartovalue VAR_SPECIAL_x800C, 540
	gotoif ne, scr_seq_00000878_00000056
	goto scr_seq_00000878_0000005C

scr_seq_00000878_00000050:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000878_00000056:
	goto scr_seq_00000878_000000E4

scr_seq_00000878_0000005C:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000878_00000079
	goto scr_seq_00000878_0000007F

scr_seq_00000878_00000073:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000878_00000079:
	goto scr_seq_00000878_000000E4

scr_seq_00000878_0000007F:
	msgbox 4
	buffer_players_name 0
	msgbox 5
	play_fanfare SEQ_ME_POKEGET
	wait_fanfare
	scrcmd_137 72, 15, 0, 0, 0, 32780
	msgbox 6
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000878_000000BC
	scrcmd_747
	closemsg
	goto scr_seq_00000878_000000E0

scr_seq_00000878_000000BC:
	closemsg
	scrcmd_815 0
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_173 1, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_00000878_000000E0:
	releaseall
	end

scr_seq_00000878_000000E4:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000878_000000EF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 4, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000878_00000115
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000878_00000115:
	buffer_players_name 0
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
