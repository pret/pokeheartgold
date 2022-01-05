#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "msgdata/msg/msg_0075_D24R0204.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D24R0204_000
	scrdef scr_seq_D24R0204_001
	scrdef scr_seq_D24R0204_002
	scrdef scr_seq_D24R0204_003
	scrdef_end

scr_seq_D24R0204_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	scrcmd_713 1
	scrcmd_150
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	checkflag FLAG_UNK_978
	gotoif TRUE, _0046
	releaseall
	end

_0046:
	wait 2, VAR_SPECIAL_x8004
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement obj_player, _02BC
	wait_movement
	hide_person obj_D24R0204_babyboy1_13
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_111
	setflag FLAG_UNK_21E
	clearflag FLAG_HIDE_RUINS_OF_ALPH_ASSISTANTS
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _009A
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _00AA
	end

_009A:
	apply_movement obj_player, _022C
	wait_movement
	goto _00BC

_00AA:
	apply_movement obj_player, _022C
	apply_movement obj_partner_poke, _0238
	wait_movement
_00BC:
	setvar VAR_UNK_40CE, 1
	comparevartovalue VAR_UNK_40EC, 1
	gotoif ge, _0107
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	scrcmd_176 315, 0, 25, 42, 0
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	setvar VAR_UNK_40DE, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

_0107:
	setflag FLAG_HIDE_RUINS_OF_ALPH_ASSISTANTS
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	scrcmd_176 315, 0, 25, 42, 0
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	setvar VAR_UNK_40DE, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_D24R0204_003:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0167
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0177
	end

_0167:
	apply_movement obj_player, _022C
	wait_movement
	goto _0189

_0177:
	apply_movement obj_player, _022C
	apply_movement obj_partner_poke, _0238
	wait_movement
_0189:
	setvar VAR_UNK_40CE, 1
	play_se SEQ_SE_GS_RAKKA01
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, _01D5
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, _01FF
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	scrcmd_176 315, 0, 25, 42, 0
	fade_screen 6, 1, 1, 0x0000
	wait_fade
_01D1:
	releaseall
	end

_01D5:
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	scrcmd_176 492, 0, 25, 42, 0
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	goto _01D1

_01FF:
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	scrcmd_176 490, 0, 25, 42, 0
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	goto _01D1
	.byte 0x00, 0x00, 0x00

_022C:
	step 40, 4
	step 69, 1
	step_end

_0238:
	step 62, 3
	step 20, 1
	step 69, 1
	step_end
scr_seq_D24R0204_001:
	scrcmd_609
	lockall
	scrcmd_714 1
	releaseall
	end

scr_seq_D24R0204_002:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	get_std_msg_naix 1, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 28
	closemsg
	scrcmd_183 VAR_SPECIAL_x8000
	wait 2, VAR_SPECIAL_x8004
	checkflag FLAG_UNK_21D
	gotoif TRUE, _02A9
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement obj_player, _02BC
	wait_movement
	hide_person obj_D24R0204_babyboy1_12
	setflag FLAG_UNK_21D
	play_se SEQ_SE_DP_UG_008
	releaseall
	end

_02A9:
	wait 20, VAR_SPECIAL_x8004
	npc_msg msg_0075_D24R0204_00001
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00

_02BC:
	step 75, 1
	step_end
	.balign 4, 0
