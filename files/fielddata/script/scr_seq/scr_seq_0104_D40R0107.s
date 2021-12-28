#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0104_D40R0107_00FC ; 000
	scrdef scr_seq_0104_D40R0107_0B44 ; 001
	scrdef scr_seq_0104_D40R0107_002A ; 002
	scrdef scr_seq_0104_D40R0107_0BAF ; 003
	scrdef scr_seq_0104_D40R0107_005D ; 004
	scrdef scr_seq_0104_D40R0107_01AE ; 005
	scrdef scr_seq_0104_D40R0107_001E ; 006
	scrdef_end

scr_seq_0104_D40R0107_001E:
	setvar VAR_TEMP_x4003, 111
	setflag FLAG_UNK_105
	end

scr_seq_0104_D40R0107_002A:
	setflag FLAG_UNK_99A
	checkflag FLAG_UNK_0A4
	gotoif TRUE, scr_seq_0104_D40R0107_003B
	end

scr_seq_0104_D40R0107_003B:
	setflag FLAG_UNK_243
	hide_person 5
	hide_person 6
	hide_person 7
	hide_person 8
	hide_person 9
	hide_person 10
	clearflag FLAG_UNK_0A4
	end

scr_seq_0104_D40R0107_005D:
	checkflag FLAG_UNK_243
	gotoif TRUE, scr_seq_0104_D40R0107_007C
	scrcmd_375 6
	scrcmd_375 7
	scrcmd_375 8
	scrcmd_375 9
	scrcmd_375 10
scr_seq_0104_D40R0107_007C:
	comparevartovalue VAR_TEMP_x400B, 123
	gotoif ne, scr_seq_0104_D40R0107_0093
	scrcmd_074 2143
	setvar VAR_TEMP_x400B, 0
scr_seq_0104_D40R0107_0093:
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_0104_D40R0107_00FA
	checkflag FLAG_UNK_10B
	gotoif FALSE, scr_seq_0104_D40R0107_00FA
	comparevartovalue VAR_TEMP_x4003, 111
	gotoif ne, scr_seq_0104_D40R0107_00FA
	show_person_at 4, 16, 1, 32, 0
	show_person_at 2, 13, 1, 33, 0
	show_person_at 3, 13, 1, 27, 0
	show_person_at 0, 19, 1, 33, 0
	show_person_at 1, 19, 1, 27, 0
	setvar VAR_TEMP_x4003, 0
	end

scr_seq_0104_D40R0107_00FA:
	end

scr_seq_0104_D40R0107_00FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 249
	scrcmd_076 16394, 0
	npc_msg 4
	scrcmd_077
	closemsg
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0104_D40R0107_0134
	setvar VAR_SPECIAL_x8004, 70
	goto scr_seq_0104_D40R0107_013A

scr_seq_0104_D40R0107_0134:
	setvar VAR_SPECIAL_x8004, 45
scr_seq_0104_D40R0107_013A:
	setflag FLAG_UNK_0A4
	scrcmd_589 16394, 32772, 0
	clearflag FLAG_UNK_0A4
	scrcmd_683 16389
	comparevartovalue VAR_TEMP_x4005, 2
	gotoif eq, scr_seq_0104_D40R0107_019E
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif eq, scr_seq_0104_D40R0107_019E
	comparevartovalue VAR_TEMP_x4005, 4
	callif eq, scr_seq_0104_D40R0107_01A8
	releaseall
	setflag FLAG_UNK_109
	setvar VAR_UNK_4081, 3
	setflag FLAG_UNK_1A2
	setflag FLAG_UNK_1A1
	setflag FLAG_UNK_2E8
	clearflag FLAG_UNK_2E5
	setflag FLAG_UNK_245
	clearflag FLAG_UNK_23C
	clearflag FLAG_UNK_241
	end

scr_seq_0104_D40R0107_019E:
	clearflag FLAG_UNK_243
	scrcmd_219
	releaseall
	end

scr_seq_0104_D40R0107_01A8:
	setflag FLAG_UNK_117
	return

scr_seq_0104_D40R0107_01AE:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0104_D40R0107_0964
	wait_movement
	scrcmd_805
	apply_movement 4, scr_seq_0104_D40R0107_09A8
	wait_movement
	npc_msg 0
	closemsg
	scrcmd_074 2143
	fade_screen 4, 4, 0, 32767
	wait_fade
	scrcmd_755
	scrcmd_757
	play_se SEQ_SE_GS_SUZUSYUTUGEN_RU
	fade_screen 4, 4, 1, 32767
	wait_fade
	wait_se SEQ_SE_GS_SUZUSYUTUGEN_RU
	apply_movement 4, scr_seq_0104_D40R0107_096C
	apply_movement 2, scr_seq_0104_D40R0107_0978
	apply_movement 3, scr_seq_0104_D40R0107_0984
	apply_movement 0, scr_seq_0104_D40R0107_0990
	apply_movement 1, scr_seq_0104_D40R0107_099C
	wait_movement
	wait 16, VAR_SPECIAL_x800C
	apply_movement 4, scr_seq_0104_D40R0107_09A8
	apply_movement 2, scr_seq_0104_D40R0107_09A8
	apply_movement 3, scr_seq_0104_D40R0107_09A8
	apply_movement 0, scr_seq_0104_D40R0107_09A8
	apply_movement 1, scr_seq_0104_D40R0107_09A8
	wait_movement
	wait 16, VAR_SPECIAL_x800C
	scrcmd_081 0
	temp_bgm SEQ_GS_E_MAIKO_MAI
	wait 18, VAR_SPECIAL_x800C
	apply_movement 4, scr_seq_0104_D40R0107_09B8
	apply_movement 2, scr_seq_0104_D40R0107_09B8
	apply_movement 3, scr_seq_0104_D40R0107_09B8
	apply_movement 0, scr_seq_0104_D40R0107_09B8
	apply_movement 1, scr_seq_0104_D40R0107_09B8
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 67, VAR_SPECIAL_x800C
	apply_movement 4, scr_seq_0104_D40R0107_09B8
	apply_movement 2, scr_seq_0104_D40R0107_09B8
	apply_movement 3, scr_seq_0104_D40R0107_09B8
	apply_movement 0, scr_seq_0104_D40R0107_09B8
	apply_movement 1, scr_seq_0104_D40R0107_09B8
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	fade_screen 4, 6, 1, 32767
	scrcmd_765
	wait_fade
	wait 6, VAR_SPECIAL_x800C
	apply_movement 4, scr_seq_0104_D40R0107_0B34
	apply_movement 2, scr_seq_0104_D40R0107_0B34
	apply_movement 3, scr_seq_0104_D40R0107_0B24
	apply_movement 0, scr_seq_0104_D40R0107_0B1C
	apply_movement 1, scr_seq_0104_D40R0107_0B2C
	wait_movement
	apply_movement 4, scr_seq_0104_D40R0107_0A48
	apply_movement 2, scr_seq_0104_D40R0107_0A48
	apply_movement 3, scr_seq_0104_D40R0107_0A00
	apply_movement 0, scr_seq_0104_D40R0107_09DC
	apply_movement 1, scr_seq_0104_D40R0107_0A24
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	apply_movement 4, scr_seq_0104_D40R0107_0B1C
	apply_movement 2, scr_seq_0104_D40R0107_0B34
	apply_movement 3, scr_seq_0104_D40R0107_0B24
	apply_movement 0, scr_seq_0104_D40R0107_0B1C
	apply_movement 1, scr_seq_0104_D40R0107_0B2C
	wait_movement
	apply_movement 4, scr_seq_0104_D40R0107_09DC
	apply_movement 2, scr_seq_0104_D40R0107_0A48
	apply_movement 3, scr_seq_0104_D40R0107_0A00
	apply_movement 0, scr_seq_0104_D40R0107_09DC
	apply_movement 1, scr_seq_0104_D40R0107_0A24
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 33, VAR_SPECIAL_x800C
	apply_movement 4, scr_seq_0104_D40R0107_0B1C
	apply_movement 2, scr_seq_0104_D40R0107_0B34
	apply_movement 3, scr_seq_0104_D40R0107_0B24
	apply_movement 0, scr_seq_0104_D40R0107_0B1C
	apply_movement 1, scr_seq_0104_D40R0107_0B2C
	wait_movement
	apply_movement 4, scr_seq_0104_D40R0107_09DC
	apply_movement 2, scr_seq_0104_D40R0107_0AF0
	apply_movement 3, scr_seq_0104_D40R0107_0A98
	apply_movement 0, scr_seq_0104_D40R0107_0A6C
	apply_movement 1, scr_seq_0104_D40R0107_0AC4
	wait 15, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	apply_movement 4, scr_seq_0104_D40R0107_0B2C
	apply_movement 2, scr_seq_0104_D40R0107_0B1C
	apply_movement 3, scr_seq_0104_D40R0107_0B34
	apply_movement 0, scr_seq_0104_D40R0107_0B2C
	apply_movement 1, scr_seq_0104_D40R0107_0B24
	wait_movement
	apply_movement 4, scr_seq_0104_D40R0107_0A24
	apply_movement 2, scr_seq_0104_D40R0107_09DC
	apply_movement 3, scr_seq_0104_D40R0107_0A48
	apply_movement 0, scr_seq_0104_D40R0107_0A24
	apply_movement 1, scr_seq_0104_D40R0107_0A00
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	scrcmd_766
	scrcmd_762 0
	wait 32, VAR_SPECIAL_x800C
	apply_movement 4, scr_seq_0104_D40R0107_0B2C
	apply_movement 2, scr_seq_0104_D40R0107_0B1C
	apply_movement 3, scr_seq_0104_D40R0107_0B34
	apply_movement 0, scr_seq_0104_D40R0107_0B2C
	apply_movement 1, scr_seq_0104_D40R0107_0B24
	wait_movement
	apply_movement 4, scr_seq_0104_D40R0107_0A24
	apply_movement 2, scr_seq_0104_D40R0107_09DC
	apply_movement 3, scr_seq_0104_D40R0107_0A48
	apply_movement 0, scr_seq_0104_D40R0107_0A24
	apply_movement 1, scr_seq_0104_D40R0107_0A00
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 29, VAR_SPECIAL_x800C
	apply_movement 4, scr_seq_0104_D40R0107_0B24
	apply_movement 2, scr_seq_0104_D40R0107_0B1C
	apply_movement 3, scr_seq_0104_D40R0107_0B34
	apply_movement 0, scr_seq_0104_D40R0107_0B2C
	apply_movement 1, scr_seq_0104_D40R0107_0B24
	wait_movement
	apply_movement 4, scr_seq_0104_D40R0107_0A00
	apply_movement 2, scr_seq_0104_D40R0107_0A6C
	apply_movement 3, scr_seq_0104_D40R0107_0AF0
	apply_movement 0, scr_seq_0104_D40R0107_0AC4
	apply_movement 1, scr_seq_0104_D40R0107_0A98
	wait 15, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 41, VAR_SPECIAL_x800C
	scrcmd_763
	wait 16, VAR_SPECIAL_x800C
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_761 1
	fade_screen 6, 1, 1, 0
	wait_fade
	apply_movement 4, scr_seq_0104_D40R0107_0A00
	apply_movement 2, scr_seq_0104_D40R0107_0A24
	apply_movement 3, scr_seq_0104_D40R0107_09DC
	apply_movement 0, scr_seq_0104_D40R0107_0A00
	apply_movement 1, scr_seq_0104_D40R0107_0A48
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	apply_movement 4, scr_seq_0104_D40R0107_0B24
	apply_movement 2, scr_seq_0104_D40R0107_0B2C
	apply_movement 3, scr_seq_0104_D40R0107_0B1C
	apply_movement 0, scr_seq_0104_D40R0107_0B24
	apply_movement 1, scr_seq_0104_D40R0107_0B34
	wait_movement
	apply_movement 4, scr_seq_0104_D40R0107_0A00
	apply_movement 2, scr_seq_0104_D40R0107_0A24
	apply_movement 3, scr_seq_0104_D40R0107_09DC
	apply_movement 0, scr_seq_0104_D40R0107_0A00
	apply_movement 1, scr_seq_0104_D40R0107_0A48
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 29, VAR_SPECIAL_x800C
	apply_movement 4, scr_seq_0104_D40R0107_0B34
	apply_movement 2, scr_seq_0104_D40R0107_0B2C
	apply_movement 3, scr_seq_0104_D40R0107_0B1C
	apply_movement 0, scr_seq_0104_D40R0107_0B24
	apply_movement 1, scr_seq_0104_D40R0107_0B34
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_761 2
	fade_screen 6, 1, 1, 0
	wait_fade
	wait_movement
	apply_movement 4, scr_seq_0104_D40R0107_0A48
	apply_movement 2, scr_seq_0104_D40R0107_0A24
	apply_movement 3, scr_seq_0104_D40R0107_09DC
	apply_movement 0, scr_seq_0104_D40R0107_0A00
	apply_movement 1, scr_seq_0104_D40R0107_0A48
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	apply_movement 4, scr_seq_0104_D40R0107_0B34
	apply_movement 2, scr_seq_0104_D40R0107_0B2C
	apply_movement 3, scr_seq_0104_D40R0107_0B1C
	apply_movement 0, scr_seq_0104_D40R0107_0B24
	apply_movement 1, scr_seq_0104_D40R0107_0B34
	wait_movement
	apply_movement 4, scr_seq_0104_D40R0107_0A48
	apply_movement 2, scr_seq_0104_D40R0107_0A24
	apply_movement 3, scr_seq_0104_D40R0107_09DC
	apply_movement 0, scr_seq_0104_D40R0107_0A00
	apply_movement 1, scr_seq_0104_D40R0107_0A48
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 38, VAR_SPECIAL_x800C
	apply_movement 4, scr_seq_0104_D40R0107_0B1C
	apply_movement 2, scr_seq_0104_D40R0107_0B24
	apply_movement 3, scr_seq_0104_D40R0107_0B2C
	apply_movement 0, scr_seq_0104_D40R0107_0B34
	apply_movement 1, scr_seq_0104_D40R0107_0B1C
	wait_movement
	apply_movement 4, scr_seq_0104_D40R0107_09DC
	apply_movement 2, scr_seq_0104_D40R0107_0A00
	apply_movement 3, scr_seq_0104_D40R0107_0A24
	apply_movement 0, scr_seq_0104_D40R0107_0A48
	apply_movement 1, scr_seq_0104_D40R0107_09DC
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	scrcmd_762 1
	wait 32, VAR_SPECIAL_x800C
	apply_movement 4, scr_seq_0104_D40R0107_0B1C
	apply_movement 2, scr_seq_0104_D40R0107_0B24
	apply_movement 3, scr_seq_0104_D40R0107_0B2C
	apply_movement 0, scr_seq_0104_D40R0107_0B34
	apply_movement 1, scr_seq_0104_D40R0107_0B1C
	wait_movement
	apply_movement 4, scr_seq_0104_D40R0107_09DC
	apply_movement 2, scr_seq_0104_D40R0107_0A00
	apply_movement 3, scr_seq_0104_D40R0107_0A24
	apply_movement 0, scr_seq_0104_D40R0107_0A48
	apply_movement 1, scr_seq_0104_D40R0107_09DC
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	fade_out_bgm 0, 100
	scrcmd_081 0
	wait 32, VAR_SPECIAL_x800C
	apply_movement 4, scr_seq_0104_D40R0107_0B2C
	apply_movement 2, scr_seq_0104_D40R0107_0B24
	apply_movement 3, scr_seq_0104_D40R0107_0B2C
	apply_movement 0, scr_seq_0104_D40R0107_0B34
	apply_movement 1, scr_seq_0104_D40R0107_0B1C
	wait_movement
	apply_movement 4, scr_seq_0104_D40R0107_0A24
	apply_movement 2, scr_seq_0104_D40R0107_0A00
	apply_movement 3, scr_seq_0104_D40R0107_0A24
	apply_movement 0, scr_seq_0104_D40R0107_0A48
	apply_movement 1, scr_seq_0104_D40R0107_09DC
	wait 12, VAR_SPECIAL_x800C
	wait_movement
	scrcmd_763
	wait 32, VAR_SPECIAL_x800C
	temp_bgm SEQ_GS_E_LUGIA
	wait 48, VAR_SPECIAL_x800C
	scrcmd_561 3, 3, 15, 5
	wait 10, VAR_SPECIAL_x800C
	wait 70, VAR_SPECIAL_x800C
	scrcmd_759
	wait 26, VAR_SPECIAL_x800C
	scrcmd_756
	setvar VAR_TEMP_x400B, 123
	fade_screen 6, 1, 0, 0
	wait_fade
	clearflag FLAG_UNK_243
	scrcmd_100 5
	scrcmd_375 5
	scrcmd_100 6
	scrcmd_100 7
	scrcmd_100 8
	scrcmd_100 9
	scrcmd_100 10
	scrcmd_099 4
	scrcmd_099 2
	scrcmd_099 3
	scrcmd_099 0
	scrcmd_099 1
	show_person_at 4, 16, 1, 33, 0
	show_person_at 2, 13, 1, 33, 0
	show_person_at 3, 13, 1, 27, 0
	show_person_at 0, 19, 1, 33, 0
	show_person_at 1, 19, 1, 27, 0
	scrcmd_773 1
	scrcmd_767
	fade_screen 6, 1, 1, 0
	wait_fade
	wait 59, VAR_SPECIAL_x800C
	scrcmd_764
	scrcmd_081 15
	scrcmd_769
	scrcmd_768
	wait 16, VAR_SPECIAL_x800C
	scrcmd_726
	apply_movement 4, scr_seq_0104_D40R0107_0B3C
	wait_movement
	buffer_players_name 0
	npc_msg 2
	closemsg
	apply_movement 4, scr_seq_0104_D40R0107_09A8
	wait_movement
	buffer_players_name 0
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_10B
	setvar VAR_UNK_40FA, 2
	end

scr_seq_0104_D40R0107_0963:
	.byte 0x00

scr_seq_0104_D40R0107_0964:
	.short 8, 2
	.short 254, 0

scr_seq_0104_D40R0107_096C:
	.short 63, 6
	.short 12, 1
	.short 254, 0

scr_seq_0104_D40R0107_0978:
	.short 63, 5
	.short 14, 2
	.short 254, 0

scr_seq_0104_D40R0107_0984:
	.short 14, 1
	.short 12, 6
	.short 254, 0

scr_seq_0104_D40R0107_0990:
	.short 63, 5
	.short 15, 2
	.short 254, 0

scr_seq_0104_D40R0107_099C:
	.short 15, 1
	.short 12, 6
	.short 254, 0

scr_seq_0104_D40R0107_09A8:
	.short 33, 1
	.short 254, 0
	.byte 0x20, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0104_D40R0107_09B8:
	.short 3, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 254, 0

scr_seq_0104_D40R0107_09DC:
	.short 2, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 254, 0

scr_seq_0104_D40R0107_0A00:
	.short 3, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 254, 0

scr_seq_0104_D40R0107_0A24:
	.short 1, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 254, 0

scr_seq_0104_D40R0107_0A48:
	.short 0, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 254, 0

scr_seq_0104_D40R0107_0A6C:
	.short 2, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 254, 0

scr_seq_0104_D40R0107_0A98:
	.short 3, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 254, 0

scr_seq_0104_D40R0107_0AC4:
	.short 1, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 254, 0

scr_seq_0104_D40R0107_0AF0:
	.short 0, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 254, 0

scr_seq_0104_D40R0107_0B1C:
	.short 8, 2
	.short 254, 0

scr_seq_0104_D40R0107_0B24:
	.short 9, 2
	.short 254, 0

scr_seq_0104_D40R0107_0B2C:
	.short 10, 2
	.short 254, 0

scr_seq_0104_D40R0107_0B34:
	.short 11, 2
	.short 254, 0

scr_seq_0104_D40R0107_0B3C:
	.short 8, 1
	.short 254, 0
scr_seq_0104_D40R0107_0B44:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_0104_D40R0107_0B62
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0104_D40R0107_0B62:
	comparevartovalue VAR_TEMP_x4005, 5
	gotoif ne, scr_seq_0104_D40R0107_0B78
	npc_msg 8
	goto scr_seq_0104_D40R0107_0BA7

scr_seq_0104_D40R0107_0B78:
	comparevartovalue VAR_TEMP_x4005, 6
	gotoif ne, scr_seq_0104_D40R0107_0B8E
	npc_msg 8
	goto scr_seq_0104_D40R0107_0BA7

scr_seq_0104_D40R0107_0B8E:
	comparevartovalue VAR_TEMP_x4005, 4
	gotoif ne, scr_seq_0104_D40R0107_0BA4
	npc_msg 6
	goto scr_seq_0104_D40R0107_0BA7

scr_seq_0104_D40R0107_0BA4:
	npc_msg 7
scr_seq_0104_D40R0107_0BA7:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0104_D40R0107_0BAF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_0104_D40R0107_0BCD
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0104_D40R0107_0BCD:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
