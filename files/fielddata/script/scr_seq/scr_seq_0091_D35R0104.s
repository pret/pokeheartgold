#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D35R0104.h"
#include "msgdata/msg/msg_0114_D35R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D35R0104_000
	scrdef scr_seq_D35R0104_001
	scrdef scr_seq_D35R0104_002
	scrdef scr_seq_D35R0104_003
	scrdef scr_seq_D35R0104_004
	scrdef scr_seq_D35R0104_005
	scrdef scr_seq_D35R0104_006
	scrdef scr_seq_D35R0104_007
	scrdef scr_seq_D35R0104_008
	scrdef_end

scr_seq_D35R0104_006:
	checktrainerflag TRAINER_TEAM_ROCKET_F_GRUNT_5
	gotoif lt, _004F
	checktrainerflag TRAINER_TEAM_ROCKET_GRUNT_19
	gotoif lt, _004F
	comparevartovalue VAR_UNK_40AC, 3
	gotoif ge, _004F
	setvar VAR_UNK_40AC, 2
_004F:
	end

scr_seq_D35R0104_008:
	comparevartovalue VAR_UNK_40AC, 4
	gotoif ge, _0060
	end

_0060:
	move_person 10, 22, 0, 15, 0
	move_person 11, 22, 0, 15, 0
	end

scr_seq_D35R0104_001:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _00EC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement obj_D35R0104_wataru, _00F4
	wait_movement
	apply_movement obj_D35R0104_wataru, _00FC
	apply_movement obj_D35R0104_tsure_poke_607, _010C
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0114_D35R0104_00000, msg_0114_D35R0104_00001
	closemsg
	apply_movement obj_D35R0104_wataru, _0124
	apply_movement obj_D35R0104_tsure_poke_607, _012C
	wait_movement
	hide_person 5
	hide_person 6
	setflag FLAG_UNK_1E6
	releaseall
	setvar VAR_UNK_40AC, 1
	end
	.byte 0x00, 0x00, 0x00

_00EC:
	step 14, 1
	step_end

_00F4:
	step 75, 1
	step_end

_00FC:
	step 33, 1
	step 13, 3
	step 15, 3
	step_end

_010C:
	step 63, 1
	step 61, 1
	step 14, 1
	step 13, 3
	step 15, 2
	step_end

_0124:
	step 14, 9
	step_end

_012C:
	step 61, 1
	step 15, 1
	step 14, 9
	step_end
scr_seq_D35R0104_007:
	scrcmd_609
	lockall
	apply_movement obj_D35R0104_tsure_poke_613_2, _018C
	wait_movement
	npc_msg msg_0114_D35R0104_00010
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D35R0104_tsure_poke_613_2, _0194
	apply_movement obj_player, _01A4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40AC, 6
	hide_person 16
	setflag FLAG_UNK_24C
	clearflag FLAG_UNK_24D
	releaseall
	end
	.byte 0x00

_018C:
	step 51, 2
	step_end

_0194:
	step 1, 1
	step 49, 1
	step 17, 10
	step_end

_01A4:
	step 63, 1
	step 33, 1
	step_end
scr_seq_D35R0104_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0114_D35R0104_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D35R0104_002:
	scrcmd_609
	lockall
	apply_movement obj_player, _00F4
	wait_movement
	callstd std_play_rival_intro_music
	clearflag FLAG_UNK_1FD
	show_person 7
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 17
	gotoif ne, _01FE
	apply_movement obj_D35R0104_gsrivel, _0290
	goto _0221

_01FE:
	comparevartovalue VAR_TEMP_x4001, 18
	gotoif ne, _0219
	apply_movement obj_D35R0104_gsrivel, _029C
	goto _0221

_0219:
	apply_movement obj_D35R0104_gsrivel, _02A8
_0221:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _02B4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_rivals_name 0
	npc_msg msg_0114_D35R0104_00003
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement obj_D35R0104_gsrivel, _02BC
	apply_movement obj_player, _02C4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement obj_D35R0104_gsrivel, _02D8
	wait_movement
	callstd 2032
	hide_person 7
	setflag FLAG_UNK_1FD
	releaseall
	setvar VAR_UNK_40AC, 3
	end
	.byte 0x00, 0x00, 0x00

_0290:
	step 13, 9
	step 15, 2
	step_end

_029C:
	step 13, 10
	step 15, 2
	step_end

_02A8:
	step 13, 11
	step 15, 2
	step_end

_02B4:
	step 14, 2
	step_end

_02BC:
	step 19, 1
	step_end

_02C4:
	step 71, 1
	step 19, 1
	step 55, 1
	step 72, 1
	step_end

_02D8:
	step 40, 1
	step 42, 1
	step 63, 1
	step 14, 2
	step 12, 9
	step_end
scr_seq_D35R0104_003:
	scrcmd_609
	lockall
	apply_movement obj_player, _00F4
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 23
	gotoif ne, _0329
	apply_movement obj_player, _040C
	goto _0331

_0329:
	apply_movement obj_player, _041C
_0331:
	apply_movement obj_D35R0104_sakaki, _0440
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	npc_msg msg_0114_D35R0104_00004
	closemsg
	apply_movement obj_D35R0104_sakaki, _044C
	wait_movement
	npc_msg msg_0114_D35R0104_00005
	closemsg
	apply_movement obj_D35R0104_sakaki, _0458
	wait_movement
	clearflag FLAG_UNK_1F4
	show_person 8
	setflag FLAG_UNK_280
	hide_person 18
	apply_movement obj_D35R0104_rkanbum2, _047C
	wait_movement
	npc_msg msg_0114_D35R0104_00006
	closemsg
	trainer_battle TRAINER_EXECUTIVE_PETREL_PETREL_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0405
	npc_msg msg_0114_D35R0104_00007
	closemsg
	apply_movement obj_D35R0104_rkanbum2, _04A8
	wait_movement
	hide_person 8
	setflag FLAG_UNK_1F4
	apply_movement obj_D35R0104_tsure_poke_613, _04E4
	wait_movement
	npc_msg msg_0114_D35R0104_00008
	closemsg
	npc_msg msg_0114_D35R0104_00009
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D35R0104_tsure_poke_613, _04F4
	apply_movement obj_player, _042C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40AC, 4
	hide_person 9
	setflag FLAG_UNK_24A
	clearflag FLAG_UNK_24B
	releaseall
	end

_0405:
	white_out
	releaseall
	end
	.byte 0x00

_040C:
	step 12, 5
	step 14, 1
	step 34, 1
	step_end

_041C:
	step 12, 5
	step 14, 2
	step 34, 1
	step_end

_042C:
	step 63, 3
	step 1, 1
	step 63, 3
	step 13, 3
	step_end

_0440:
	step 63, 4
	step 35, 1
	step_end

_044C:
	step 75, 1
	step 63, 2
	step_end

_0458:
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step_end

_047C:
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step_end
	.byte 0x0f, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_04A8:
	step 71, 1
	step 10, 1
	step 72, 1
	step 63, 1
	step 17, 5
	step 71, 1
	step 52, 1
	step 72, 1
	step 17, 1
	step 19, 3
	step 17, 5
	step 18, 7
	step 16, 12
	step 18, 4
	step_end

_04E4:
	step 13, 3
	step 15, 2
	step 51, 2
	step_end

_04F4:
	step 1, 1
	step 17, 1
	step 19, 2
	step 17, 9
	step 18, 7
	step 16, 13
	step 18, 5
	step_end
scr_seq_D35R0104_004:
	comparevartovalue VAR_UNK_40AC, 4
	gotoif ge, _055F
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag TRAINER_TEAM_ROCKET_F_GRUNT_5
	gotoif lt, _0561
	checktrainerflag TRAINER_TEAM_ROCKET_GRUNT_19
	gotoif lt, _0561
	buffer_players_name 0
	npc_msg msg_0114_D35R0104_00012
	closemsg
	play_se SEQ_SE_DP_DOOR10
	apply_movement obj_D35R0104_babyboy1_9, _056C
	apply_movement obj_D35R0104_babyboy1_9_2, _056C
	wait_movement
	releaseall
_055F:
	end

_0561:
	npc_msg msg_0114_D35R0104_00011
	waitbutton
	closemsg
	releaseall
	end


_056C:
	step 14, 3
	step_end
scr_seq_D35R0104_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0114_D35R0104_00008
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_0D3
	end
	.balign 4, 0
