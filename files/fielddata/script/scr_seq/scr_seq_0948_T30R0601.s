#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T30R0601.h"
#include "msgdata/msg/msg_0635_T30R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T30R0601_000
	scrdef scr_seq_T30R0601_001
	scrdef scr_seq_T30R0601_002
	scrdef scr_seq_T30R0601_003
	scrdef scr_seq_T30R0601_004
	scrdef_end

scr_seq_T30R0601_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_001
	gotoif TRUE, _0036
	npc_msg msg_0635_T30R0601_00000
	setflag FLAG_UNK_001
	goto _0036

_0036:
	npc_msg msg_0635_T30R0601_00001
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _005D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _014A
	end

_005D:
	npc_msg msg_0635_T30R0601_00002
	closemsg
	goto _0068

_0068:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_349
	scrcmd_351 32770
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x8002, 255
	gotoif eq, _014A
	get_partymon_species VAR_SPECIAL_x8002, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 0
	gotoif eq, _0134
	scrcmd_396 32780, 32770
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _013F
	npc_msg msg_0635_T30R0601_00006
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_394 32770
	scrcmd_395 32769
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x8001, 255
	gotoif eq, _005D
	buffer_party_mon_move_name 0, VAR_SPECIAL_x8002, VAR_SPECIAL_x8001
	npc_msg msg_0635_T30R0601_00007
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _011D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _005D
	end

_011D:
	scrcmd_397 32770, 32769
	play_fanfare SEQ_ME_WASURE
	wait_fanfare
	npc_msg msg_0635_T30R0601_00008
	waitbutton
	closemsg
	releaseall
	end

_0134:
	npc_msg msg_0635_T30R0601_00005
	closemsg
	goto _0068

_013F:
	npc_msg msg_0635_T30R0601_00004
	closemsg
	goto _0068

_014A:
	npc_msg msg_0635_T30R0601_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T30R0601_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_15E
	gotoif FALSE, _0238
	hasitem ITEM_HEART_SCALE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _022D
	npc_msg msg_0635_T30R0601_00010
	npc_msg msg_0635_T30R0601_00012
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_349
	scrcmd_351 32773
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x8005, 255
	gotoif eq, _022D
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0247
	scrcmd_466 32780, 32773
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0222
	npc_msg msg_0635_T30R0601_00013
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_467 32773
	scrcmd_469 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _022D
	takeitem ITEM_HEART_SCALE, 1, VAR_SPECIAL_x800C
	buffer_players_name 3
	npc_msg msg_0635_T30R0601_00025
	waitbutton
	closemsg
	releaseall
	end

_0222:
	npc_msg msg_0635_T30R0601_00014
	waitbutton
	closemsg
	releaseall
	end

_022D:
	npc_msg msg_0635_T30R0601_00011
	waitbutton
	closemsg
	releaseall
	end

_0238:
	npc_msg msg_0635_T30R0601_00009
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_15E
	end

_0247:
	npc_msg msg_0635_T30R0601_00015
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T30R0601_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_186
	gotoif TRUE, _0287
	setflag FLAG_UNK_186
	npc_msg msg_0635_T30R0601_00026
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _02A5
	goto _02EC

_0287:
	npc_msg msg_0635_T30R0601_00027
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _02A5
	goto _02EC

_02A5:
	npc_msg msg_0635_T30R0601_00028
	waitbutton
	closemsg
	releaseall
	end

_02B0:
	npc_msg msg_0635_T30R0601_00029
	waitbutton
	closemsg
	releaseall
	end

_02BB:
	npc_msg msg_0635_T30R0601_00032
	waitbutton
	closemsg
	releaseall
	end

_02C6:
	npc_msg msg_0635_T30R0601_00033
	waitbutton
	closemsg
	releaseall
	end

_02D1:
	buffer_move_name 0, MOVE_DRACO_METEOR
	npc_msg msg_0635_T30R0601_00034
	waitbutton
	closemsg
	releaseall
	end

_02E1:
	npc_msg msg_0635_T30R0601_00031
	waitbutton
	closemsg
	releaseall
	end

_02EC:
	get_party_count VAR_TEMP_x4000
_02F0:
	subvar VAR_TEMP_x4000, 1
	get_partymon_species VAR_TEMP_x4000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0346
	scrcmd_497 32772, 32773, 16384
	comparevartovalue VAR_SPECIAL_x8004, 16
	gotoif eq, _0331
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif eq, _0331
	goto _0346

_0331:
	mon_has_move VAR_SPECIAL_x800C, MOVE_DRACO_METEOR, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0359
_0346:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _02F0
	goto _02B0

_0359:
	npc_msg msg_0635_T30R0601_00030
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, _02A5
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 0
	gotoif eq, _02C6
	call _042B
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _02BB
	mon_has_move VAR_SPECIAL_x800C, MOVE_DRACO_METEOR, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _02D1
	scrcmd_382 VAR_SPECIAL_x800C, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif lt, _02E1
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	npc_msg msg_0635_T30R0601_00062
	closemsg
	setvar VAR_SPECIAL_x8003, 434
	goto _03EF

_03EF:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_468 32768, 434
	scrcmd_469 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _02A5
	npc_msg msg_0635_T30R0601_00042
	waitbutton
	closemsg
	releaseall
	end

_042B:
	scrcmd_497 32772, 32773, 32768
	comparevartovalue VAR_SPECIAL_x8004, 16
	gotoif eq, _0455
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif eq, _0455
	setvar VAR_SPECIAL_x800C, 0
	return

_0455:
	setvar VAR_SPECIAL_x800C, 1
	return

scr_seq_T30R0601_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_187
	gotoif TRUE, _0490
	setflag FLAG_UNK_187
	npc_msg msg_0635_T30R0601_00043
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _04AC
	goto _06EE

_0490:
	npc_msg msg_0635_T30R0601_00044
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _04AC
	goto _06EE

_04AC:
	npc_msg msg_0635_T30R0601_00045
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, _06EE
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 0
	gotoif eq, _0708
	call _05F4
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _06FB
	copyvar VAR_SPECIAL_x8002, VAR_SPECIAL_x800C
	call _06B0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0722
	scrcmd_382 VAR_SPECIAL_x800C, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif lt, _0715
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8002, 1
	gotoif eq, _0555
	comparevartovalue VAR_SPECIAL_x8002, 2
	gotoif eq, _0577
	goto _0599

_0555:
	npc_msg msg_0635_T30R0601_00052
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _06EE
	setvar VAR_SPECIAL_x8003, 307
	goto _05BB

_0577:
	npc_msg msg_0635_T30R0601_00053
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _06EE
	setvar VAR_SPECIAL_x8003, 308
	goto _05BB

_0599:
	npc_msg msg_0635_T30R0601_00054
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _06EE
	setvar VAR_SPECIAL_x8003, 338
	goto _05BB

_05BB:
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_468 32768, 32771
	scrcmd_469 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _06EE
	touchscreen_menu_show
	releaseall
	end

_05F4:
	comparevartovalue VAR_SPECIAL_x8001, 6
	gotoif eq, _0698
	comparevartovalue VAR_SPECIAL_x8001, 157
	gotoif eq, _0698
	comparevartovalue VAR_SPECIAL_x8001, 257
	gotoif eq, _0698
	comparevartovalue VAR_SPECIAL_x8001, 392
	gotoif eq, _0698
	comparevartovalue VAR_SPECIAL_x8001, 9
	gotoif eq, _06A0
	comparevartovalue VAR_SPECIAL_x8001, 160
	gotoif eq, _06A0
	comparevartovalue VAR_SPECIAL_x8001, 260
	gotoif eq, _06A0
	comparevartovalue VAR_SPECIAL_x8001, 395
	gotoif eq, _06A0
	comparevartovalue VAR_SPECIAL_x8001, 3
	gotoif eq, _06A8
	comparevartovalue VAR_SPECIAL_x8001, 154
	gotoif eq, _06A8
	comparevartovalue VAR_SPECIAL_x8001, 254
	gotoif eq, _06A8
	comparevartovalue VAR_SPECIAL_x8001, 389
	gotoif eq, _06A8
	setvar VAR_SPECIAL_x800C, 0
	return

_0698:
	setvar VAR_SPECIAL_x800C, 1
	return

_06A0:
	setvar VAR_SPECIAL_x800C, 2
	return

_06A8:
	setvar VAR_SPECIAL_x800C, 3
	return

_06B0:
	comparevartovalue VAR_SPECIAL_x8002, 1
	gotoif eq, _06D0
	comparevartovalue VAR_SPECIAL_x8002, 2
	gotoif eq, _06DA
	goto _06E4

_06D0:
	mon_has_move VAR_SPECIAL_x800C, MOVE_BLAST_BURN, VAR_SPECIAL_x8000
	return

_06DA:
	mon_has_move VAR_SPECIAL_x800C, MOVE_HYDRO_CANNON, VAR_SPECIAL_x8000
	return

_06E4:
	mon_has_move VAR_SPECIAL_x800C, MOVE_FRENZY_PLANT, VAR_SPECIAL_x8000
	return

_06EE:
	npc_msg msg_0635_T30R0601_00046
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

_06FB:
	npc_msg msg_0635_T30R0601_00048
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0708:
	npc_msg msg_0635_T30R0601_00049
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0715:
	npc_msg msg_0635_T30R0601_00050
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0722:
	npc_msg msg_0635_T30R0601_00051
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_T30R0601_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0635_T30R0601_00061
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
