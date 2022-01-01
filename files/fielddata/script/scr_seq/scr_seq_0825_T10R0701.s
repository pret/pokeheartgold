#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0701.h"
#include "msgdata/msg/msg_0528_T10R0701.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T10R0701_000
	scrdef scr_seq_T10R0701_001
	scrdef_end

scr_seq_T10R0701_001:
	scrcmd_081 0
	end

scr_seq_T10R0701_000:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0188
	apply_movement obj_T10R0701_wataru, _0194
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	gender_msgbox msg_0528_T10R0701_00000, msg_0528_T10R0701_00001
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _01A8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	party_count_not_egg VAR_SPECIAL_x800C
	hall_of_fame_anim VAR_SPECIAL_x800C
	add_special_game_stat 23
	fade_screen 6, 1, 0, 0x00
	wait_fade
	call _01B4
	hasitem ITEM_S_S__TICKET, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _009A
	setvar VAR_SCENE_PLAYERS_HOUSE_1F, 3
_009A:
	setflag FLAG_UNK_97E
	clearflag FLAG_UNK_2CC
	checkflag FLAG_UNK_116
	callif FALSE, _01C9
	checkflag FLAG_UNK_117
	callif FALSE, _01CF
	checkflag FLAG_UNK_169
	callif FALSE, _01D5
	checkflag FLAG_UNK_16A
	callif FALSE, _01DB
	checkflag FLAG_UNK_16B
	callif FALSE, _01E1
	checkflag FLAG_UNK_16C
	callif FALSE, _01E7
	checkflag FLAG_UNK_14A
	callif FALSE, _01ED
	checkflag FLAG_UNK_16D
	callif FALSE, _0206
	checkflag FLAG_UNK_173
	gotoif FALSE, _020C
_0105:
	checkflag FLAG_UNK_175
	callif FALSE, _0227
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, _012D
	goto _023A
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_012D:
	goto _024F

_0133:
	checkflag FLAG_UNK_17B
	callif FALSE, _0264
	comparevartovalue VAR_UNK_4046, 2
	callif eq, _026A
	comparevartovalue VAR_UNK_4045, 2
	callif eq, _0275
	comparevartovalue VAR_UNK_4047, 2
	callif eq, _0280
	comparevartovalue VAR_UNK_4048, 2
	callif eq, _028B
	hof_credits 0
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end


_0188:
	step 12, 14
	step 3, 2
	step_end

_0194:
	step 12, 12
	step 3, 2
	step 15, 1
	step 2, 2
	step_end

_01A8:
	step 0, 2
	step 12, 4
	step_end
_01B4:
	checkflag FLAG_GAME_CLEAR
	gotoif TRUE, _01C3
	setflag FLAG_UNK_998
_01C3:
	clearflag FLAG_UNK_25F
	return

_01C9:
	clearflag FLAG_UNK_242
	return

_01CF:
	clearflag FLAG_UNK_243
	return

_01D5:
	clearflag FLAG_UNK_1C2
	return

_01DB:
	clearflag FLAG_HIDE_LAKE_OF_RAGE_RED_GYARADOS
	return

_01E1:
	clearflag FLAG_UNK_305
	return

_01E7:
	clearflag FLAG_UNK_306
	return

_01ED:
	check_badge 15, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0204
	clearflag FLAG_UNK_297
_0204:
	return

_0206:
	clearflag FLAG_UNK_307
	return

_020C:
	checkflag FLAG_UNK_0F9
	gotoif TRUE, _021D
	goto _0105

_021D:
	clearflag FLAG_UNK_31B
	goto _0105

_0227:
	comparevartovalue VAR_UNK_4089, 3
	gotoif ne, _0238
	clearflag FLAG_UNK_30E
_0238:
	return

_023A:
	checkflag FLAG_UNK_17A
	gotoif TRUE, _0133
	clearflag FLAG_UNK_18B
	goto _0133

_024F:
	checkflag FLAG_UNK_17A
	gotoif TRUE, _0133
	clearflag FLAG_UNK_18B
	goto _0133

_0264:
	clearflag FLAG_UNK_2D2
	return

_026A:
	setvar VAR_UNK_4046, 0
	scrcmd_464 1
	return

_0275:
	setvar VAR_UNK_4045, 0
	scrcmd_464 0
	return

_0280:
	setvar VAR_UNK_4047, 0
	scrcmd_464 2
	return

_028B:
	setvar VAR_UNK_4048, 0
	scrcmd_464 3
	return
	.balign 4, 0
