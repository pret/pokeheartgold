#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000943_00000112 ; 000
	scrdef scr_seq_00000943_0000001A ; 001
	scrdef scr_seq_00000943_000001DE ; 002
	scrdef scr_seq_00000943_00000260 ; 003
	scrdef scr_seq_00000943_0000029C ; 004
	scrdef scr_seq_00000943_000003E0 ; 005
	scrdef_end

scr_seq_00000943_0000001A:
	scrcmd_329
	setvar VAR_UNK_4120, 0
	scrcmd_142 27, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000943_0000010C
	comparevartovalue VAR_UNK_40FC, 2
	gotoif ge, scr_seq_00000943_00000044
	end

scr_seq_00000943_00000044:
	scrcmd_147 27, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000943_000000BD
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000943_00000072
	setflag FLAG_UNK_2EF
	goto scr_seq_00000943_000000BB

scr_seq_00000943_00000072:
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000943_00000089
	setflag FLAG_UNK_2EF
	goto scr_seq_00000943_000000BB

scr_seq_00000943_00000089:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_00000943_000000A0
	setflag FLAG_UNK_2EF
	goto scr_seq_00000943_000000BB

scr_seq_00000943_000000A0:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_00000943_000000B7
	setflag FLAG_UNK_2EF
	goto scr_seq_00000943_000000BB

scr_seq_00000943_000000B7:
	clearflag FLAG_UNK_2EF
scr_seq_00000943_000000BB:
	end

scr_seq_00000943_000000BD:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_00000943_000000D8
	setflag FLAG_UNK_2EF
	goto scr_seq_00000943_0000010A

scr_seq_00000943_000000D8:
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, scr_seq_00000943_000000EF
	setflag FLAG_UNK_2EF
	goto scr_seq_00000943_0000010A

scr_seq_00000943_000000EF:
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_00000943_00000106
	setflag FLAG_UNK_2EF
	goto scr_seq_00000943_0000010A

scr_seq_00000943_00000106:
	clearflag FLAG_UNK_2EF
scr_seq_00000943_0000010A:
	end

scr_seq_00000943_0000010C:
	setflag FLAG_UNK_2EF
	end

scr_seq_00000943_00000112:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0EA
	gotoif TRUE, scr_seq_00000943_0000018E
	checkflag FLAG_UNK_0D1
	gotoif TRUE, scr_seq_00000943_0000017D
	msgbox 3
	closemsg
	trainer_battle 35, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000943_00000188
	settrainerflag 110
	settrainerflag 112
	settrainerflag 111
	settrainerflag 119
	settrainerflag 117
	scrcmd_515 22
	setflag FLAG_UNK_0D1
	setflag FLAG_UNK_202
	clearflag FLAG_UNK_203
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000943_0000017D:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000943_00000188:
	scrcmd_219
	releaseall
	end

scr_seq_00000943_0000018E:
	checkflag FLAG_UNK_0DA
	gotoif TRUE, scr_seq_00000943_000001C8
	msgbox 6
	setvar VAR_SPECIAL_x8004, 386
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000943_000001D3
	callstd 2033
	setflag FLAG_UNK_0DA
	msgbox 7
scr_seq_00000943_000001C8:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000943_000001D3:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000943_000001DE:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_GYURU
	apply_movement 255, scr_seq_00000943_00000218
	wait_movement
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 141, 0, 8, 83, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end


scr_seq_00000943_00000218:
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 2
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 2
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 2
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 1
	.short 69, 0
	.short 254, 0
scr_seq_00000943_00000260:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0D1
	gotoif TRUE, scr_seq_00000943_00000291
	msgbox 0
	scrcmd_600
	scrcmd_783 1
	scrcmd_607
	scrcmd_109 253, 56
	setvar VAR_UNK_4120, 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000943_00000291:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000943_0000029C:
	scrcmd_609
	lockall
	checkflag FLAG_UNK_138
	gotoif TRUE, scr_seq_00000943_00000352
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, scr_seq_00000943_000002D4
	apply_movement 6, scr_seq_00000943_00000370
	apply_movement 255, scr_seq_00000943_0000039C
	goto scr_seq_00000943_00000307

scr_seq_00000943_000002D4:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, scr_seq_00000943_000002F7
	apply_movement 6, scr_seq_00000943_00000380
	apply_movement 255, scr_seq_00000943_000003A8
	goto scr_seq_00000943_00000307

scr_seq_00000943_000002F7:
	apply_movement 6, scr_seq_00000943_00000390
	apply_movement 255, scr_seq_00000943_000003B4
scr_seq_00000943_00000307:
	wait_movement
	msgbox 2
	closemsg
	setflag FLAG_UNK_138
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, scr_seq_00000943_0000032D
	apply_movement 6, scr_seq_00000943_000003C0
	goto scr_seq_00000943_00000350

scr_seq_00000943_0000032D:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, scr_seq_00000943_00000348
	apply_movement 6, scr_seq_00000943_000003CC
	goto scr_seq_00000943_00000350

scr_seq_00000943_00000348:
	apply_movement 6, scr_seq_00000943_000003D8
scr_seq_00000943_00000350:
	wait_movement
scr_seq_00000943_00000352:
	scrcmd_600
	scrcmd_783 1
	scrcmd_607
	scrcmd_109 253, 56
	setvar VAR_UNK_4120, 1
	setvar VAR_UNK_4120, 1
	releaseall
	end

scr_seq_00000943_0000036F:
	.byte 0x00

scr_seq_00000943_00000370:
	.short 2, 1
	.short 75, 1
	.short 14, 2
	.short 254, 0

scr_seq_00000943_00000380:
	.short 2, 1
	.short 75, 1
	.short 14, 1
	.short 254, 0

scr_seq_00000943_00000390:
	.short 2, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000943_0000039C:
	.short 63, 5
	.short 3, 1
	.short 254, 0

scr_seq_00000943_000003A8:
	.short 63, 4
	.short 3, 1
	.short 254, 0

scr_seq_00000943_000003B4:
	.short 63, 2
	.short 3, 1
	.short 254, 0

scr_seq_00000943_000003C0:
	.short 15, 2
	.short 1, 1
	.short 254, 0

scr_seq_00000943_000003CC:
	.short 15, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000943_000003D8:
	.short 1, 1
	.short 254, 0
scr_seq_00000943_000003E0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 7, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000943_00000407
	msgbox 10
	goto scr_seq_00000943_0000040A

scr_seq_00000943_00000407:
	msgbox 11
scr_seq_00000943_0000040A:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
