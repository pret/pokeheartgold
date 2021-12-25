#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000805_000000E8 ; 000
	scrdef scr_seq_00000805_00000087 ; 001
	scrdef scr_seq_00000805_000000A2 ; 002
	scrdef scr_seq_00000805_000000BD ; 003
	scrdef scr_seq_00000805_00000044 ; 004
	scrdef scr_seq_00000805_0000001E ; 005
	scrdef scr_seq_00000805_000000FB ; 006
	scrdef_end

scr_seq_00000805_0000001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	closemsg
	apply_movement 3, scr_seq_00000805_0000003C
	wait_movement
	releaseall
	end

scr_seq_00000805_00000039:
	.byte 0x00, 0x00, 0x00

scr_seq_00000805_0000003C:
	.short 35, 1
	.short 254, 0
scr_seq_00000805_00000044:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000805_00000074
	msgbox 4
	closemsg
	apply_movement 1, scr_seq_00000805_000000D8
	wait_movement
	releaseall
	end

scr_seq_00000805_00000074:
	msgbox 5
	closemsg
	apply_movement 1, scr_seq_00000805_000000D8
	wait_movement
	releaseall
	end

scr_seq_00000805_00000087:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	closemsg
	apply_movement 5, scr_seq_00000805_000000E0
	wait_movement
	releaseall
	end

scr_seq_00000805_000000A2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	closemsg
	apply_movement 4, scr_seq_00000805_000000E0
	wait_movement
	releaseall
	end

scr_seq_00000805_000000BD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	closemsg
	apply_movement 2, scr_seq_00000805_000000D8
	wait_movement
	releaseall
	end


scr_seq_00000805_000000D8:
	.short 33, 1
	.short 254, 0

scr_seq_00000805_000000E0:
	.short 32, 1
	.short 254, 0
scr_seq_00000805_000000E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000805_000000FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
