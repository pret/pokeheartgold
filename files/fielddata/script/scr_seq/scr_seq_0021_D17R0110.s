#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0021_D17R0110_00C5 ; 000
	scrdef scr_seq_0021_D17R0110_06E6 ; 001
	scrdef scr_seq_0021_D17R0110_001E ; 002
	scrdef scr_seq_0021_D17R0110_0039 ; 003
	scrdef scr_seq_0021_D17R0110_0940 ; 004
	scrdef scr_seq_0021_D17R0110_0045 ; 005
	scrdef scr_seq_0021_D17R0110_0177 ; 006
	scrdef_end

scr_seq_0021_D17R0110_001E:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, scr_seq_0021_D17R0110_002B
	end

scr_seq_0021_D17R0110_002B:
	setflag FLAG_UNK_242
	hide_person 5
	clearflag FLAG_UNK_0A4
	end

scr_seq_0021_D17R0110_0039:
	setvar VAR_TEMP_x4003, 111
	setflag FLAG_UNK_105
	end

scr_seq_0021_D17R0110_0045:
	comparevartovalue VAR_TEMP_x400B, 123
	gotoif ne, scr_seq_0021_D17R0110_005C
	scrcmd_074 2153
	setvar VAR_TEMP_x400B, 0
scr_seq_0021_D17R0110_005C:
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_0021_D17R0110_00C3
	checkflag FLAG_UNK_10A
	gotoif FALSE, scr_seq_0021_D17R0110_00C3
	comparevartovalue VAR_TEMP_x4003, 111
	gotoif ne, scr_seq_0021_D17R0110_00BB
	move_person 0, 16, 1, 18, 0
	move_person 1, 12, 1, 18, 0
	move_person 2, 12, 1, 12, 1
	move_person 3, 18, 1, 18, 0
	move_person 4, 18, 1, 12, 1
scr_seq_0021_D17R0110_00BB:
	setvar VAR_TEMP_x4003, 0
	end

scr_seq_0021_D17R0110_00C3:
	end

scr_seq_0021_D17R0110_00C5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 250
	scrcmd_076 VAR_TEMP_x400A, 0
	npc_msg 4
	scrcmd_077
	closemsg
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0021_D17R0110_00FD
	setvar VAR_SPECIAL_x8004, 45
	goto scr_seq_0021_D17R0110_0103

scr_seq_0021_D17R0110_00FD:
	setvar VAR_SPECIAL_x8004, 70
scr_seq_0021_D17R0110_0103:
	setflag FLAG_UNK_0A4
	scrcmd_589 16394, 32772, 0
	clearflag FLAG_UNK_0A4
	scrcmd_683 16389
	comparevartovalue VAR_TEMP_x4005, 2
	gotoif eq, scr_seq_0021_D17R0110_0167
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif eq, scr_seq_0021_D17R0110_0167
	comparevartovalue VAR_TEMP_x4005, 4
	callif eq, scr_seq_0021_D17R0110_0171
	releaseall
	setflag FLAG_UNK_108
	setvar VAR_SCENE_NEW_BARK_EAST_EXIT, 3
	setflag FLAG_HIDE_NEW_BARK_FRIEND
	setflag FLAG_HIDE_NEW_BARK_MARILL
	setflag FLAG_HIDE_NEW_BARK_FRIEND_2
	clearflag FLAG_UNK_2E5
	setflag FLAG_UNK_244
	clearflag FLAG_UNK_23C
	clearflag FLAG_UNK_241
	end

scr_seq_0021_D17R0110_0167:
	clearflag FLAG_UNK_242
	white_out
	releaseall
	end

scr_seq_0021_D17R0110_0171:
	setflag FLAG_UNK_116
	return

scr_seq_0021_D17R0110_0177:
	scrcmd_609
	lockall
	scrcmd_805
	apply_movement 0, scr_seq_0021_D17R0110_0790
	wait_movement
	npc_msg 0
	closemsg
	scrcmd_074 2153
	fade_screen 4, 4, 0, 0x7FFF
	wait_fade
	scrcmd_755
	scrcmd_757
	play_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	fade_screen 4, 4, 1, 0x7FFF
	wait_fade
	wait_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	apply_movement 0, scr_seq_0021_D17R0110_0754
	apply_movement 1, scr_seq_0021_D17R0110_0760
	apply_movement 2, scr_seq_0021_D17R0110_076C
	apply_movement 3, scr_seq_0021_D17R0110_0778
	apply_movement 4, scr_seq_0021_D17R0110_0784
	wait_movement
	wait 16, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0021_D17R0110_0790
	apply_movement 1, scr_seq_0021_D17R0110_0790
	apply_movement 2, scr_seq_0021_D17R0110_0790
	apply_movement 3, scr_seq_0021_D17R0110_0790
	apply_movement 4, scr_seq_0021_D17R0110_0790
	wait_movement
	wait 16, VAR_SPECIAL_x800C
	scrcmd_081 0
	temp_bgm SEQ_GS_E_MAIKO_MAI
	wait 18, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0021_D17R0110_07A0
	apply_movement 1, scr_seq_0021_D17R0110_07A0
	apply_movement 2, scr_seq_0021_D17R0110_07A0
	apply_movement 3, scr_seq_0021_D17R0110_07A0
	apply_movement 4, scr_seq_0021_D17R0110_07A0
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 67, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0021_D17R0110_07A0
	apply_movement 1, scr_seq_0021_D17R0110_07A0
	apply_movement 2, scr_seq_0021_D17R0110_07A0
	apply_movement 3, scr_seq_0021_D17R0110_07A0
	apply_movement 4, scr_seq_0021_D17R0110_07A0
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	fade_screen 4, 6, 1, 0x7FFF
	scrcmd_765
	wait_fade
	wait 4, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0021_D17R0110_0914
	apply_movement 1, scr_seq_0021_D17R0110_0904
	apply_movement 2, scr_seq_0021_D17R0110_091C
	apply_movement 3, scr_seq_0021_D17R0110_0914
	apply_movement 4, scr_seq_0021_D17R0110_090C
	wait_movement
	apply_movement 0, scr_seq_0021_D17R0110_080C
	apply_movement 1, scr_seq_0021_D17R0110_07C4
	apply_movement 2, scr_seq_0021_D17R0110_0830
	apply_movement 3, scr_seq_0021_D17R0110_080C
	apply_movement 4, scr_seq_0021_D17R0110_07E8
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0021_D17R0110_0904
	apply_movement 1, scr_seq_0021_D17R0110_0904
	apply_movement 2, scr_seq_0021_D17R0110_091C
	apply_movement 3, scr_seq_0021_D17R0110_0914
	apply_movement 4, scr_seq_0021_D17R0110_090C
	wait_movement
	apply_movement 0, scr_seq_0021_D17R0110_07C4
	apply_movement 1, scr_seq_0021_D17R0110_07C4
	apply_movement 2, scr_seq_0021_D17R0110_0830
	apply_movement 3, scr_seq_0021_D17R0110_080C
	apply_movement 4, scr_seq_0021_D17R0110_07E8
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 33, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0021_D17R0110_0904
	apply_movement 1, scr_seq_0021_D17R0110_0904
	apply_movement 2, scr_seq_0021_D17R0110_091C
	apply_movement 3, scr_seq_0021_D17R0110_0914
	apply_movement 4, scr_seq_0021_D17R0110_090C
	wait_movement
	apply_movement 0, scr_seq_0021_D17R0110_07C4
	apply_movement 1, scr_seq_0021_D17R0110_0854
	apply_movement 2, scr_seq_0021_D17R0110_08D8
	apply_movement 3, scr_seq_0021_D17R0110_08AC
	apply_movement 4, scr_seq_0021_D17R0110_0880
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0021_D17R0110_091C
	apply_movement 1, scr_seq_0021_D17R0110_091C
	apply_movement 2, scr_seq_0021_D17R0110_090C
	apply_movement 3, scr_seq_0021_D17R0110_0904
	apply_movement 4, scr_seq_0021_D17R0110_0914
	wait_movement
	apply_movement 0, scr_seq_0021_D17R0110_0830
	apply_movement 1, scr_seq_0021_D17R0110_0830
	apply_movement 2, scr_seq_0021_D17R0110_07E8
	apply_movement 3, scr_seq_0021_D17R0110_07C4
	apply_movement 4, scr_seq_0021_D17R0110_080C
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	scrcmd_766
	scrcmd_762 0
	wait 32, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0021_D17R0110_091C
	apply_movement 1, scr_seq_0021_D17R0110_091C
	apply_movement 2, scr_seq_0021_D17R0110_090C
	apply_movement 3, scr_seq_0021_D17R0110_0904
	apply_movement 4, scr_seq_0021_D17R0110_0914
	wait_movement
	apply_movement 0, scr_seq_0021_D17R0110_0830
	apply_movement 1, scr_seq_0021_D17R0110_0830
	apply_movement 2, scr_seq_0021_D17R0110_07E8
	apply_movement 3, scr_seq_0021_D17R0110_07C4
	apply_movement 4, scr_seq_0021_D17R0110_080C
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0021_D17R0110_090C
	apply_movement 1, scr_seq_0021_D17R0110_091C
	apply_movement 2, scr_seq_0021_D17R0110_090C
	apply_movement 3, scr_seq_0021_D17R0110_0904
	apply_movement 4, scr_seq_0021_D17R0110_0914
	wait_movement
	apply_movement 0, scr_seq_0021_D17R0110_07E8
	apply_movement 1, scr_seq_0021_D17R0110_0830
	apply_movement 2, scr_seq_0021_D17R0110_07E8
	apply_movement 3, scr_seq_0021_D17R0110_07C4
	apply_movement 4, scr_seq_0021_D17R0110_080C
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 41, VAR_SPECIAL_x800C
	scrcmd_763
	wait 8, VAR_SPECIAL_x800C
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_761 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	wait 20, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	release 0
	release 1
	release 2
	release 3
	release 4
	move_person 0, 15, 1, 18, 0
	move_person 1, 12, 1, 18, 0
	move_person 2, 12, 1, 12, 1
	move_person 3, 18, 1, 18, 0
	move_person 4, 18, 1, 12, 1
	wait 86, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait 32, VAR_SPECIAL_x800C
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_761 2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	wait 22, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0021_D17R0110_07C4
	apply_movement 1, scr_seq_0021_D17R0110_07C4
	apply_movement 2, scr_seq_0021_D17R0110_07E8
	apply_movement 3, scr_seq_0021_D17R0110_07C4
	apply_movement 4, scr_seq_0021_D17R0110_07E8
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	wait 34, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_0021_D17R0110_07C4
	apply_movement 1, scr_seq_0021_D17R0110_07C4
	apply_movement 2, scr_seq_0021_D17R0110_07E8
	apply_movement 3, scr_seq_0021_D17R0110_07C4
	apply_movement 4, scr_seq_0021_D17R0110_07E8
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 60, VAR_SPECIAL_x800C
	scrcmd_762 1
	scrcmd_763
	scrcmd_081 0
	scrcmd_756
	setvar VAR_TEMP_x400B, 123
	fade_screen 6, 1, 0, 0x7FFF
	wait_fade
	scrcmd_773 0
	clearflag FLAG_UNK_242
	show_person 5
	scrcmd_375 5
	wait 6, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0x7FFF
	wait_fade
	wait 20, VAR_SPECIAL_x800C
	scrcmd_764
	scrcmd_081 30
	apply_movement 0, scr_seq_0021_D17R0110_0798
	wait_movement
	scrcmd_726
	buffer_players_name 0
	npc_msg 2
	closemsg
	apply_movement 0, scr_seq_0021_D17R0110_0790
	wait_movement
	buffer_players_name 0
	npc_msg 3
	closemsg
	apply_movement 0, scr_seq_0021_D17R0110_092C
	wait_movement
	releaseall
	setflag FLAG_UNK_10A
	setvar VAR_UNK_40FA, 2
	end

scr_seq_0021_D17R0110_06E6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_0021_D17R0110_0704
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0021_D17R0110_0704:
	comparevartovalue VAR_TEMP_x4005, 5
	gotoif ne, scr_seq_0021_D17R0110_071A
	npc_msg 8
	goto scr_seq_0021_D17R0110_0749

scr_seq_0021_D17R0110_071A:
	comparevartovalue VAR_TEMP_x4005, 6
	gotoif ne, scr_seq_0021_D17R0110_0730
	npc_msg 8
	goto scr_seq_0021_D17R0110_0749

scr_seq_0021_D17R0110_0730:
	comparevartovalue VAR_TEMP_x4005, 4
	gotoif ne, scr_seq_0021_D17R0110_0746
	npc_msg 6
	goto scr_seq_0021_D17R0110_0749

scr_seq_0021_D17R0110_0746:
	npc_msg 7
scr_seq_0021_D17R0110_0749:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0021_D17R0110_0751:
	.byte 0x00, 0x00, 0x00

scr_seq_0021_D17R0110_0754:
	step 63, 6
	step 12, 1
	step_end

scr_seq_0021_D17R0110_0760:
	step 63, 5
	step 14, 2
	step_end

scr_seq_0021_D17R0110_076C:
	step 14, 1
	step 12, 6
	step_end

scr_seq_0021_D17R0110_0778:
	step 63, 5
	step 15, 2
	step_end

scr_seq_0021_D17R0110_0784:
	step 15, 1
	step 12, 6
	step_end

scr_seq_0021_D17R0110_0790:
	step 33, 1
	step_end

scr_seq_0021_D17R0110_0798:
	step 32, 1
	step_end

scr_seq_0021_D17R0110_07A0:
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step_end

scr_seq_0021_D17R0110_07C4:
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step_end

scr_seq_0021_D17R0110_07E8:
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step_end

scr_seq_0021_D17R0110_080C:
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step_end

scr_seq_0021_D17R0110_0830:
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step_end

scr_seq_0021_D17R0110_0854:
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step_end

scr_seq_0021_D17R0110_0880:
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step_end

scr_seq_0021_D17R0110_08AC:
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step_end

scr_seq_0021_D17R0110_08D8:
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step_end

scr_seq_0021_D17R0110_0904:
	step 8, 2
	step_end

scr_seq_0021_D17R0110_090C:
	step 9, 2
	step_end

scr_seq_0021_D17R0110_0914:
	step 10, 2
	step_end

scr_seq_0021_D17R0110_091C:
	step 11, 2
	step_end
	.byte 0x09, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0021_D17R0110_092C:
	step 2, 1
	step 71, 1
	step 11, 1
	step 72, 1
	step_end
scr_seq_0021_D17R0110_0940:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_0021_D17R0110_095E
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0021_D17R0110_095E:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
