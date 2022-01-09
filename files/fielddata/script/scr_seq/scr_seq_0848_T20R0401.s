#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0401.h"
#include "msgdata/msg/msg_0548_T20R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T20R0401_000
	scrdef_end

scr_seq_T20R0401_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_2E5, _0035
	compare VAR_SCENE_ELMS_LAB, 1
	goto_if_ge _0044
	buffer_players_name 0
	gender_msgbox msg_0548_T20R0401_00000, msg_0548_T20R0401_00001
	waitbutton
	closemsg
	releaseall
	end

_0035:
	buffer_players_name 0
	gender_msgbox msg_0548_T20R0401_00002, msg_0548_T20R0401_00003
	waitbutton
	closemsg
	releaseall
	end

_0044:
	buffer_players_name 0
	gender_msgbox msg_0548_T20R0401_00004, msg_0548_T20R0401_00005
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
