#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D17R0110.h"
#include "msgdata/msg/msg_0058_D17R0110.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D17R0110_000
	scrdef scr_seq_D17R0110_001
	scrdef scr_seq_D17R0110_002
	scrdef scr_seq_D17R0110_003
	scrdef scr_seq_D17R0110_004
	scrdef scr_seq_D17R0110_005
	scrdef scr_seq_D17R0110_006
	scrdef_end

scr_seq_D17R0110_002:
	goto_if_set FLAG_ENGAGING_STATIC_POKEMON, _002B
	end

_002B:
	setflag FLAG_HIDE_BELL_TOWER_HO_OH
	hide_person obj_D17R0110_hou_obj01
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	end

scr_seq_D17R0110_003:
	setvar VAR_TEMP_x4003, 111
	setflag FLAG_UNK_105
	end

scr_seq_D17R0110_005:
	compare VAR_TEMP_x400B, 123
	goto_if_ne _005C
	stop_se SEQ_SE_GS_KYOUHUU
	setvar VAR_TEMP_x400B, 0
_005C:
	goto_if_set FLAG_UNK_108, _00C3
	goto_if_unset FLAG_UNK_10A, _00C3
	compare VAR_TEMP_x4003, 111
	goto_if_ne _00BB
	move_person_facing obj_D17R0110_dancer, 16, 1, 18, DIR_NORTH
	move_person_facing obj_D17R0110_dancer_2, 12, 1, 18, DIR_NORTH
	move_person_facing obj_D17R0110_dancer_3, 12, 1, 12, DIR_SOUTH
	move_person_facing obj_D17R0110_dancer_4, 18, 1, 18, DIR_NORTH
	move_person_facing obj_D17R0110_dancer_5, 18, 1, 12, DIR_SOUTH
_00BB:
	setvar VAR_TEMP_x4003, 0
	end

_00C3:
	end

scr_seq_D17R0110_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 250
	play_cry VAR_TEMP_x400A, 0
	npc_msg msg_0058_D17R0110_00004
	wait_cry
	closemsg
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _00FD
	setvar VAR_SPECIAL_x8004, 45
	goto _0103

_00FD:
	setvar VAR_SPECIAL_x8004, 70
_0103:
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle VAR_TEMP_x400A, VAR_SPECIAL_x8004, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	scrcmd_683 VAR_TEMP_x4005
	compare VAR_TEMP_x4005, 2
	goto_if_eq _0167
	compare VAR_TEMP_x4005, 3
	goto_if_eq _0167
	compare VAR_TEMP_x4005, 4
	call_if_eq _0171
	releaseall
	setflag FLAG_UNK_108
	setvar VAR_SCENE_NEW_BARK_EAST_EXIT, 3
	setflag FLAG_HIDE_NEW_BARK_FRIEND
	setflag FLAG_HIDE_NEW_BARK_MARILL
	setflag FLAG_HIDE_NEW_BARK_FRIEND_2
	clearflag FLAG_HIDE_NEW_BARK_FRIENDS_ROOM_FRIEND
	setflag FLAG_HIDE_BELL_TOWER_SUMMIT_KIMONO_GIRLS
	clearflag FLAG_HIDE_DANCE_STUDIO_KIMONO_GIRLS
	clearflag FLAG_UNK_241
	end

_0167:
	clearflag FLAG_HIDE_BELL_TOWER_HO_OH
	white_out
	releaseall
	end

_0171:
	setflag FLAG_CAUGHT_HO_OH
	return

scr_seq_D17R0110_006:
	scrcmd_609
	lockall
	scrcmd_805
	apply_movement obj_D17R0110_dancer, _0790
	wait_movement
	npc_msg msg_0058_D17R0110_00000
	closemsg
	stop_se SEQ_SE_GS_KYOUHUU
	fade_screen 4, 4, 0, RGB_WHITE
	wait_fade
	scrcmd_755
	scrcmd_757
	play_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	fade_screen 4, 4, 1, RGB_WHITE
	wait_fade
	wait_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	apply_movement obj_D17R0110_dancer, _0754
	apply_movement obj_D17R0110_dancer_2, _0760
	apply_movement obj_D17R0110_dancer_3, _076C
	apply_movement obj_D17R0110_dancer_4, _0778
	apply_movement obj_D17R0110_dancer_5, _0784
	wait_movement
	wait 16, VAR_SPECIAL_RESULT
	apply_movement obj_D17R0110_dancer, _0790
	apply_movement obj_D17R0110_dancer_2, _0790
	apply_movement obj_D17R0110_dancer_3, _0790
	apply_movement obj_D17R0110_dancer_4, _0790
	apply_movement obj_D17R0110_dancer_5, _0790
	wait_movement
	wait 16, VAR_SPECIAL_RESULT
	scrcmd_081 0
	temp_bgm SEQ_GS_E_MAIKO_MAI
	wait 18, VAR_SPECIAL_RESULT
	apply_movement obj_D17R0110_dancer, _07A0
	apply_movement obj_D17R0110_dancer_2, _07A0
	apply_movement obj_D17R0110_dancer_3, _07A0
	apply_movement obj_D17R0110_dancer_4, _07A0
	apply_movement obj_D17R0110_dancer_5, _07A0
	wait 12, VAR_SPECIAL_RESULT
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 67, VAR_SPECIAL_RESULT
	apply_movement obj_D17R0110_dancer, _07A0
	apply_movement obj_D17R0110_dancer_2, _07A0
	apply_movement obj_D17R0110_dancer_3, _07A0
	apply_movement obj_D17R0110_dancer_4, _07A0
	apply_movement obj_D17R0110_dancer_5, _07A0
	wait 12, VAR_SPECIAL_RESULT
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	fade_screen 4, 6, 1, RGB_WHITE
	scrcmd_765
	wait_fade
	wait 4, VAR_SPECIAL_RESULT
	apply_movement obj_D17R0110_dancer, _0914
	apply_movement obj_D17R0110_dancer_2, _0904
	apply_movement obj_D17R0110_dancer_3, _091C
	apply_movement obj_D17R0110_dancer_4, _0914
	apply_movement obj_D17R0110_dancer_5, _090C
	wait_movement
	apply_movement obj_D17R0110_dancer, _080C
	apply_movement obj_D17R0110_dancer_2, _07C4
	apply_movement obj_D17R0110_dancer_3, _0830
	apply_movement obj_D17R0110_dancer_4, _080C
	apply_movement obj_D17R0110_dancer_5, _07E8
	wait 12, VAR_SPECIAL_RESULT
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 32, VAR_SPECIAL_RESULT
	apply_movement obj_D17R0110_dancer, _0904
	apply_movement obj_D17R0110_dancer_2, _0904
	apply_movement obj_D17R0110_dancer_3, _091C
	apply_movement obj_D17R0110_dancer_4, _0914
	apply_movement obj_D17R0110_dancer_5, _090C
	wait_movement
	apply_movement obj_D17R0110_dancer, _07C4
	apply_movement obj_D17R0110_dancer_2, _07C4
	apply_movement obj_D17R0110_dancer_3, _0830
	apply_movement obj_D17R0110_dancer_4, _080C
	apply_movement obj_D17R0110_dancer_5, _07E8
	wait 12, VAR_SPECIAL_RESULT
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 33, VAR_SPECIAL_RESULT
	apply_movement obj_D17R0110_dancer, _0904
	apply_movement obj_D17R0110_dancer_2, _0904
	apply_movement obj_D17R0110_dancer_3, _091C
	apply_movement obj_D17R0110_dancer_4, _0914
	apply_movement obj_D17R0110_dancer_5, _090C
	wait_movement
	apply_movement obj_D17R0110_dancer, _07C4
	apply_movement obj_D17R0110_dancer_2, _0854
	apply_movement obj_D17R0110_dancer_3, _08D8
	apply_movement obj_D17R0110_dancer_4, _08AC
	apply_movement obj_D17R0110_dancer_5, _0880
	wait 12, VAR_SPECIAL_RESULT
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 32, VAR_SPECIAL_RESULT
	apply_movement obj_D17R0110_dancer, _091C
	apply_movement obj_D17R0110_dancer_2, _091C
	apply_movement obj_D17R0110_dancer_3, _090C
	apply_movement obj_D17R0110_dancer_4, _0904
	apply_movement obj_D17R0110_dancer_5, _0914
	wait_movement
	apply_movement obj_D17R0110_dancer, _0830
	apply_movement obj_D17R0110_dancer_2, _0830
	apply_movement obj_D17R0110_dancer_3, _07E8
	apply_movement obj_D17R0110_dancer_4, _07C4
	apply_movement obj_D17R0110_dancer_5, _080C
	wait 12, VAR_SPECIAL_RESULT
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	scrcmd_766
	scrcmd_762 0
	wait 32, VAR_SPECIAL_RESULT
	apply_movement obj_D17R0110_dancer, _091C
	apply_movement obj_D17R0110_dancer_2, _091C
	apply_movement obj_D17R0110_dancer_3, _090C
	apply_movement obj_D17R0110_dancer_4, _0904
	apply_movement obj_D17R0110_dancer_5, _0914
	wait_movement
	apply_movement obj_D17R0110_dancer, _0830
	apply_movement obj_D17R0110_dancer_2, _0830
	apply_movement obj_D17R0110_dancer_3, _07E8
	apply_movement obj_D17R0110_dancer_4, _07C4
	apply_movement obj_D17R0110_dancer_5, _080C
	wait 12, VAR_SPECIAL_RESULT
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 32, VAR_SPECIAL_RESULT
	apply_movement obj_D17R0110_dancer, _090C
	apply_movement obj_D17R0110_dancer_2, _091C
	apply_movement obj_D17R0110_dancer_3, _090C
	apply_movement obj_D17R0110_dancer_4, _0904
	apply_movement obj_D17R0110_dancer_5, _0914
	wait_movement
	apply_movement obj_D17R0110_dancer, _07E8
	apply_movement obj_D17R0110_dancer_2, _0830
	apply_movement obj_D17R0110_dancer_3, _07E8
	apply_movement obj_D17R0110_dancer_4, _07C4
	apply_movement obj_D17R0110_dancer_5, _080C
	wait 12, VAR_SPECIAL_RESULT
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 41, VAR_SPECIAL_RESULT
	scrcmd_763
	wait 8, VAR_SPECIAL_RESULT
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_761 1
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	wait 20, VAR_SPECIAL_RESULT
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	release obj_D17R0110_dancer
	release obj_D17R0110_dancer_2
	release obj_D17R0110_dancer_3
	release obj_D17R0110_dancer_4
	release obj_D17R0110_dancer_5
	move_person_facing obj_D17R0110_dancer, 15, 1, 18, DIR_NORTH
	move_person_facing obj_D17R0110_dancer_2, 12, 1, 18, DIR_NORTH
	move_person_facing obj_D17R0110_dancer_3, 12, 1, 12, DIR_SOUTH
	move_person_facing obj_D17R0110_dancer_4, 18, 1, 18, DIR_NORTH
	move_person_facing obj_D17R0110_dancer_5, 18, 1, 12, DIR_SOUTH
	wait 86, VAR_SPECIAL_RESULT
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait 32, VAR_SPECIAL_RESULT
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_761 2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	wait 22, VAR_SPECIAL_RESULT
	apply_movement obj_D17R0110_dancer, _07C4
	apply_movement obj_D17R0110_dancer_2, _07C4
	apply_movement obj_D17R0110_dancer_3, _07E8
	apply_movement obj_D17R0110_dancer_4, _07C4
	apply_movement obj_D17R0110_dancer_5, _07E8
	wait 12, VAR_SPECIAL_RESULT
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 32, VAR_SPECIAL_RESULT
	wait 34, VAR_SPECIAL_RESULT
	apply_movement obj_D17R0110_dancer, _07C4
	apply_movement obj_D17R0110_dancer_2, _07C4
	apply_movement obj_D17R0110_dancer_3, _07E8
	apply_movement obj_D17R0110_dancer_4, _07C4
	apply_movement obj_D17R0110_dancer_5, _07E8
	wait 12, VAR_SPECIAL_RESULT
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 60, VAR_SPECIAL_RESULT
	scrcmd_762 1
	scrcmd_763
	scrcmd_081 0
	scrcmd_756
	setvar VAR_TEMP_x400B, 123
	fade_screen 6, 1, 0, RGB_WHITE
	wait_fade
	cinematic 0
	clearflag FLAG_HIDE_BELL_TOWER_HO_OH
	show_person obj_D17R0110_hou_obj01
	scrcmd_375 obj_D17R0110_hou_obj01
	wait 6, VAR_SPECIAL_RESULT
	fade_screen 6, 1, 1, RGB_WHITE
	wait_fade
	wait 20, VAR_SPECIAL_RESULT
	scrcmd_764
	scrcmd_081 30
	apply_movement obj_D17R0110_dancer, _0798
	wait_movement
	scrcmd_726
	buffer_players_name 0
	npc_msg msg_0058_D17R0110_00002
	closemsg
	apply_movement obj_D17R0110_dancer, _0790
	wait_movement
	buffer_players_name 0
	npc_msg msg_0058_D17R0110_00003
	closemsg
	apply_movement obj_D17R0110_dancer, _092C
	wait_movement
	releaseall
	setflag FLAG_UNK_10A
	setvar VAR_UNK_40FA, 2
	end

scr_seq_D17R0110_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_108, _0704
	npc_msg msg_0058_D17R0110_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0704:
	compare VAR_TEMP_x4005, 5
	goto_if_ne _071A
	npc_msg msg_0058_D17R0110_00008
	goto _0749

_071A:
	compare VAR_TEMP_x4005, 6
	goto_if_ne _0730
	npc_msg msg_0058_D17R0110_00008
	goto _0749

_0730:
	compare VAR_TEMP_x4005, 4
	goto_if_ne _0746
	npc_msg msg_0058_D17R0110_00006
	goto _0749

_0746:
	npc_msg msg_0058_D17R0110_00007
_0749:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0754:
	step 63, 6
	step 12, 1
	step_end

_0760:
	step 63, 5
	step 14, 2
	step_end

_076C:
	step 14, 1
	step 12, 6
	step_end

_0778:
	step 63, 5
	step 15, 2
	step_end

_0784:
	step 15, 1
	step 12, 6
	step_end

_0790:
	step 33, 1
	step_end

_0798:
	step 32, 1
	step_end

_07A0:
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step_end

_07C4:
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step_end

_07E8:
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step_end

_080C:
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step_end

_0830:
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step_end

_0854:
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

_0880:
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

_08AC:
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

_08D8:
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

_0904:
	step 8, 2
	step_end

_090C:
	step 9, 2
	step_end

_0914:
	step 10, 2
	step_end

_091C:
	step 11, 2
	step_end
	.byte 0x09, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_092C:
	step 2, 1
	step 71, 1
	step 11, 1
	step 72, 1
	step_end
scr_seq_D17R0110_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_108, _095E
	npc_msg msg_0058_D17R0110_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_095E:
	npc_msg msg_0058_D17R0110_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
