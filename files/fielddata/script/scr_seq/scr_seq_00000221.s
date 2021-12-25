#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000221_00000028 ; 000
	scrdef scr_seq_00000221_0000003B ; 001
	scrdef scr_seq_00000221_000000D0 ; 002
	scrdef scr_seq_00000221_00000016 ; 003
	scrdef scr_seq_00000221_000000E5 ; 004
	scrdef_end

scr_seq_00000221_00000016:
	checkflag FLAG_UNK_168
	gotoif eq, scr_seq_00000221_00000026
	scrcmd_804 1
	end

scr_seq_00000221_00000026:
	end

scr_seq_00000221_00000028:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000221_0000003B:
	scrcmd_609
	lockall
	apply_movement 0, scr_seq_00000221_000000A8
	wait_movement
	msgbox 0
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, scr_seq_00000221_0000006F
	apply_movement 0, scr_seq_00000221_000000C4
	goto scr_seq_00000221_00000092

scr_seq_00000221_0000006F:
	comparevartovalue VAR_TEMP_x4001, 403
	gotoif ne, scr_seq_00000221_0000008A
	apply_movement 0, scr_seq_00000221_000000B0
	goto scr_seq_00000221_00000092

scr_seq_00000221_0000008A:
	apply_movement 0, scr_seq_00000221_000000B8
scr_seq_00000221_00000092:
	wait_movement
	msgbox 1
	waitbutton
	closemsg
	releaseall
	setvar VAR_UNK_408A, 1
	end

scr_seq_00000221_000000A5:
	.byte 0x00, 0x00, 0x00

scr_seq_00000221_000000A8:
	.short 75, 1
	.short 254, 0

scr_seq_00000221_000000B0:
	.short 14, 4
	.short 254, 0

scr_seq_00000221_000000B8:
	.short 13, 1
	.short 14, 4
	.short 254, 0

scr_seq_00000221_000000C4:
	.short 12, 1
	.short 14, 4
	.short 254, 0
scr_seq_00000221_000000D0:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 2, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000221_000000E5:
	scrcmd_055 3, 1, 5, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
