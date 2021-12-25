#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000893_0000005A ; 000
	scrdef scr_seq_00000893_000000B4 ; 001
	scrdef scr_seq_00000893_0000015D ; 002
	scrdef scr_seq_00000893_0000015F ; 003
	scrdef scr_seq_00000893_00000161 ; 004
	scrdef scr_seq_00000893_0000003F ; 005
	scrdef scr_seq_00000893_00000022 ; 006
	scrdef scr_seq_00000893_0000014C ; 007
	scrdef_end

scr_seq_00000893_00000022:
	scrcmd_582 76, 348, 350
	checkflag FLAG_UNK_118
	gotoif eq, scr_seq_00000893_00000037
	end

scr_seq_00000893_00000037:
	setvar VAR_UNK_410B, 0
	end

scr_seq_00000893_0000003F:
	checkflag FLAG_UNK_118
	gotoif eq, scr_seq_00000893_0000004C
	end

scr_seq_00000893_0000004C:
	scrcmd_339 0, 4, 0, 6, 3
	end

scr_seq_00000893_0000005A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_118
	gotoif eq, scr_seq_00000893_00000078
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000893_00000078:
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000893_00000096
	msgbox 5
	waitbutton
	closemsg
	goto scr_seq_00000893_000000A5

scr_seq_00000893_00000096:
	msgbox 7
	closemsg
	apply_movement 0, scr_seq_00000893_000000AC
	wait_movement
scr_seq_00000893_000000A5:
	releaseall
	end

scr_seq_00000893_000000A9:
	.byte 0x00, 0x00, 0x00

scr_seq_00000893_000000AC:
	.short 3, 1
	.short 254, 0
scr_seq_00000893_000000B4:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000893_0000013C
	wait_movement
	checkflag FLAG_UNK_123
	gotoif eq, scr_seq_00000893_00000118
	msgbox 1
	closemsg
	setflag FLAG_UNK_123
scr_seq_00000893_000000D6:
	wait 50, VAR_SPECIAL_x8004
	hasitem ITEM_PASS, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000893_00000123
	msgbox 2
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000893_00000144
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_00000893_00000118:
	msgbox 3
	closemsg
	goto scr_seq_00000893_000000D6

scr_seq_00000893_00000123:
	msgbox 4
	waitbutton
	closemsg
	setvar VAR_UNK_410B, 1
	setvar VAR_UNK_411E, 1
	releaseall
	end

scr_seq_00000893_0000013A:
	.byte 0x00, 0x00

scr_seq_00000893_0000013C:
	.short 34, 1
	.short 254, 0

scr_seq_00000893_00000144:
	.short 13, 2
	.short 254, 0
scr_seq_00000893_0000014C:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000893_0000015D:
	end

scr_seq_00000893_0000015F:
	end

scr_seq_00000893_00000161:
	end
	.balign 4, 0
