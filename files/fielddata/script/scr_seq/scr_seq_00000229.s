#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000229_000000CF ; 000
	scrdef scr_seq_00000229_0000002F ; 001
	scrdef scr_seq_00000229_00000234 ; 002
	scrdef scr_seq_00000229_00000012 ; 003
	scrdef_end

scr_seq_00000229_00000012:
	comparevartovalue VAR_UNK_40F9, 1
	gotoif eq, scr_seq_00000229_00000021
	end

scr_seq_00000229_00000021:
	show_person_at 0, 5, 0, 6, 3
	end

scr_seq_00000229_0000002F:
	scrcmd_609
	lockall
	apply_movement 0, scr_seq_00000229_000003AC
	wait_movement
	apply_movement 1, scr_seq_00000229_0000041C
	apply_movement 0, scr_seq_00000229_000003B4
	wait_movement
	buffer_players_name 0
	gender_msgbox 0, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_00000229_000003C4
	apply_movement 255, scr_seq_00000229_00000404
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 0, scr_seq_00000229_000003E4
	wait_movement
	msgbox 2
	setvar VAR_SPECIAL_x8004, 484
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	msgbox 3
	msgbox 4
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_081 0
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	heal_party
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_00000229_000002E8

scr_seq_00000229_000000CD:
	.byte 0x02, 0x00
scr_seq_00000229_000000CF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40F9, 4
	gotoif ge, scr_seq_00000229_000000F1
	comparevartovalue VAR_UNK_40F9, 2
	gotoif ge, scr_seq_00000229_000002CD
scr_seq_00000229_000000F1:
	checkflag FLAG_UNK_06C
	gotoif TRUE, scr_seq_00000229_0000019F
	checkflag FLAG_UNK_0C9
	gotoif TRUE, scr_seq_00000229_0000012A
	comparevartovalue VAR_UNK_4107, 2
	gotoif ge, scr_seq_00000229_0000011F
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000229_0000011F:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000229_0000012A:
	buffer_players_name 0
	gender_msgbox 16, 17
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000229_00000189
	setvar VAR_SPECIAL_x8004, 216
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000229_00000194
	callstd 2033
	closemsg
	setflag FLAG_UNK_06C
	setvar VAR_SPECIAL_x8004, 478
	setvar VAR_SPECIAL_x8005, 1
	takeitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	releaseall
	end

scr_seq_00000229_00000189:
	msgbox 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000229_00000194:
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000229_0000019F:
	checkflag FLAG_UNK_107
	gotoif FALSE, scr_seq_00000229_0000011F
	msgbox 7
	closemsg
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000229_000001CE
	apply_movement 0, scr_seq_00000229_000001F8
	goto scr_seq_00000229_000001F1

scr_seq_00000229_000001CE:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000229_000001E9
	apply_movement 0, scr_seq_00000229_0000020C
	goto scr_seq_00000229_000001F1

scr_seq_00000229_000001E9:
	apply_movement 0, scr_seq_00000229_00000220
scr_seq_00000229_000001F1:
	wait_movement
	releaseall
	end

scr_seq_00000229_000001F7:
	.byte 0x00

scr_seq_00000229_000001F8:
	.short 1, 3
	.short 2, 3
	.short 0, 3
	.short 3, 3
	.short 254, 0

scr_seq_00000229_0000020C:
	.short 1, 3
	.short 3, 3
	.short 0, 3
	.short 2, 3
	.short 254, 0

scr_seq_00000229_00000220:
	.short 3, 3
	.short 0, 3
	.short 2, 3
	.short 1, 3
	.short 254, 0
scr_seq_00000229_00000234:
	scrcmd_609
	lockall
	setvar VAR_UNK_40F9, 2
	apply_movement 0, scr_seq_00000229_000003AC
	wait_movement
	apply_movement 0, scr_seq_00000229_000002D8
	wait_movement
	buffer_players_name 0
	gender_msgbox 21, 22
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_00000229_000003C4
	apply_movement 255, scr_seq_00000229_00000404
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 23
	closemsg
	apply_movement 0, scr_seq_00000229_000003E4
	wait_movement
	buffer_players_name 0
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000229_000002B0
	setvar VAR_SPECIAL_x8004, 535
	goto scr_seq_00000229_000002B6

scr_seq_00000229_000002B0:
	setvar VAR_SPECIAL_x8004, 534
scr_seq_00000229_000002B6:
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	closemsg
	msgbox 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000229_000002CD:
	msgbox 27
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000229_000002D8:
	.short 13, 1
	.short 14, 1
	.short 13, 1
	.short 254, 0
scr_seq_00000229_000002E8:
	play_bgm SEQ_GS_OHKIDO
	apply_movement 1, scr_seq_00000229_00000424
	wait_movement
	apply_movement 255, scr_seq_00000229_00000414
	wait_movement
	buffer_players_name 0
	gender_msgbox 8, 9
	closemsg
	apply_movement 1, scr_seq_00000229_00000438
	wait_movement
	msgbox 10
	closemsg
	apply_movement 1, scr_seq_00000229_00000444
	wait_movement
	msgbox 11
	buffer_players_name 0
	msgbox 12
	scrcmd_291
	setflag FLAG_UNK_06B
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	scrcmd_573
	gender_msgbox 13, 14
	closemsg
	buffer_players_name 0
	msgbox 15
	scrcmd_146 2
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	closemsg
	apply_movement 1, scr_seq_00000229_00000450
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	hide_person 1
	wait_se SEQ_SE_DP_DOOR
	fade_out_bgm 0, 30
	scrcmd_081 0
	reset_bgm
	releaseall
	setvar VAR_UNK_4107, 1
	scrcmd_280 2
	setflag FLAG_UNK_195
	setflag FLAG_UNK_316
	clearflag FLAG_UNK_315
	setflag FLAG_UNK_190
	setvar VAR_UNK_4073, 3
	clearflag FLAG_UNK_19C
	setvar VAR_UNK_4108, 3
	clearflag FLAG_UNK_19D
	setvar VAR_UNK_408C, 2
	end

scr_seq_00000229_000003AB:
	.byte 0x00

scr_seq_00000229_000003AC:
	.short 75, 1
	.short 254, 0

scr_seq_00000229_000003B4:
	.short 17, 1
	.short 18, 5
	.short 33, 1
	.short 254, 0

scr_seq_00000229_000003C4:
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0
	.byte 0x20, 0x00, 0x01, 0x00, 0x23, 0x00, 0x01, 0x00, 0x22, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00

scr_seq_00000229_000003E4:
	.short 18, 3
	.short 16, 1
	.short 63, 1
	.short 24, 1
	.short 9, 1
	.short 11, 3
	.short 29, 1
	.short 254, 0

scr_seq_00000229_00000404:
	.short 12, 1
	.short 15, 1
	.short 12, 2
	.short 254, 0

scr_seq_00000229_00000414:
	.short 34, 1
	.short 254, 0

scr_seq_00000229_0000041C:
	.short 34, 1
	.short 254, 0

scr_seq_00000229_00000424:
	.short 9, 1
	.short 10, 4
	.short 8, 2
	.short 31, 1
	.short 254, 0

scr_seq_00000229_00000438:
	.short 9, 1
	.short 31, 1
	.short 254, 0

scr_seq_00000229_00000444:
	.short 8, 1
	.short 31, 1
	.short 254, 0

scr_seq_00000229_00000450:
	.short 9, 3
	.short 63, 1
	.short 254, 0
	.balign 4, 0
