#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0302.h"
#include "msgdata/msg/msg_0260_P01R0302.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_P01R0302_000
	scrdef scr_seq_P01R0302_001
	scrdef scr_seq_P01R0302_002
	scrdef_end

scr_seq_P01R0302_002:
	comparevartovalue VAR_UNK_40CB, 4
	gotoif ge, _001D
	end

_001D:
	setflag FLAG_UNK_217
	end

scr_seq_P01R0302_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40CB, 6
	gotoif ge, _005B
	comparevartovalue VAR_UNK_40CB, 4
	gotoif eq, _0050
	npc_msg msg_0260_P01R0302_00004
	waitbutton
	closemsg
	releaseall
	end

_0050:
	npc_msg msg_0260_P01R0302_00005
	waitbutton
	closemsg
	releaseall
	end

_005B:
	checkflag FLAG_UNK_ABB
	gotoif TRUE, _0084
	checkflag FLAG_UNK_092
	gotoif TRUE, _0084
	check_badge 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, _008F
_0084:
	npc_msg msg_0260_P01R0302_00006
	waitbutton
	closemsg
	releaseall
	end

_008F:
	npc_msg msg_0260_P01R0302_00007
	closemsg
	comparevartovalue VAR_UNK_4101, 0
	gotoif ne, _00B3
	setvar VAR_SPECIAL_x8004, 298
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_00B3:
	comparevartovalue VAR_UNK_4101, 1
	gotoif ne, _00D2
	setvar VAR_SPECIAL_x8004, 299
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_00D2:
	comparevartovalue VAR_UNK_4101, 2
	gotoif ne, _00F1
	setvar VAR_SPECIAL_x8004, 300
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_00F1:
	comparevartovalue VAR_UNK_4101, 3
	gotoif ne, _0110
	setvar VAR_SPECIAL_x8004, 301
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_0110:
	comparevartovalue VAR_UNK_4101, 4
	gotoif ne, _012F
	setvar VAR_SPECIAL_x8004, 302
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_012F:
	comparevartovalue VAR_UNK_4101, 5
	gotoif ne, _014E
	setvar VAR_SPECIAL_x8004, 303
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_014E:
	comparevartovalue VAR_UNK_4101, 6
	gotoif ne, _016D
	setvar VAR_SPECIAL_x8004, 304
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_016D:
	comparevartovalue VAR_UNK_4101, 7
	gotoif ne, _018C
	setvar VAR_SPECIAL_x8004, 305
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_018C:
	comparevartovalue VAR_UNK_4101, 8
	gotoif ne, _01AB
	setvar VAR_SPECIAL_x8004, 306
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_01AB:
	comparevartovalue VAR_UNK_4101, 9
	gotoif ne, _01CA
	setvar VAR_SPECIAL_x8004, 307
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_01CA:
	comparevartovalue VAR_UNK_4101, 10
	gotoif ne, _01E9
	setvar VAR_SPECIAL_x8004, 308
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_01E9:
	comparevartovalue VAR_UNK_4101, 11
	gotoif ne, _0208
	setvar VAR_SPECIAL_x8004, 309
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_0208:
	comparevartovalue VAR_UNK_4101, 12
	gotoif ne, _0227
	setvar VAR_SPECIAL_x8004, 310
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_0227:
	comparevartovalue VAR_UNK_4101, 13
	gotoif ne, _0246
	setvar VAR_SPECIAL_x8004, 311
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_0246:
	comparevartovalue VAR_UNK_4101, 14
	gotoif ne, _0265
	setvar VAR_SPECIAL_x8004, 312
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_0265:
	comparevartovalue VAR_UNK_4101, 15
	gotoif ne, _0284
	setvar VAR_SPECIAL_x8004, 313
	setvar VAR_SPECIAL_x8005, 1
	goto _0296

_0284:
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	goto _029C

_0296:
	addvar VAR_UNK_4101, 1
_029C:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _02C3
	callstd std_obtain_item_verbose
	setflag FLAG_UNK_ABB
	setflag FLAG_UNK_092
	closemsg
	releaseall
	end

_02C3:
	buffer_item_name 1, VAR_SPECIAL_x8004
	npc_msg msg_0260_P01R0302_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_P01R0302_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0260_P01R0302_00000
	closemsg
	get_player_facing VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _02FD
	apply_movement obj_P01R0302_gsbabygirl1, _0340
	goto _0305

_02FD:
	apply_movement obj_P01R0302_gsbabygirl1, _0350
_0305:
	wait_movement
	gender_msgbox msg_0260_P01R0302_00003, msg_0260_P01R0302_00002
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	setvar VAR_UNK_40CB, 4
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	hide_person obj_P01R0302_gsbabygirl1
	setflag FLAG_UNK_217
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end
	.byte 0x00

_0340:
	step 75, 1
	step 63, 1
	step 0, 2
	step_end

_0350:
	step 75, 1
	step 63, 1
	step 3, 2
	step_end
	.balign 4, 0
