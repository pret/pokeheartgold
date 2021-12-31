#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T21FS0101.h"
#include "msgdata/msg/msg_0551_T21FS0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T21FS0101_000
	scrdef scr_seq_T21FS0101_001
	scrdef scr_seq_T21FS0101_002
	scrdef scr_seq_T21FS0101_003
	scrdef_end

scr_seq_T21FS0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 0
	callstd 2048
	releaseall
	end

scr_seq_T21FS0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 0
	callstd 2052
	releaseall
	end

scr_seq_T21FS0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_SCENE_ELMS_LAB, 4
	gotoif lt, _0068
	npc_msg msg_0551_T21FS0101_00001
	goto _006B

_0068:
	npc_msg msg_0551_T21FS0101_00000
_006B:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T21FS0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0551_T21FS0101_00002
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
