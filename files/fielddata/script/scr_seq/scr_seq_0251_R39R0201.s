#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0251_R39R0201_004D ; 000
	scrdef scr_seq_0251_R39R0201_00AF ; 001
	scrdef scr_seq_0251_R39R0201_022C ; 002
	scrdef scr_seq_0251_R39R0201_0386 ; 003
	scrdef scr_seq_0251_R39R0201_0016 ; 004
	scrdef_end

scr_seq_0251_R39R0201_0016:
	scrcmd_379 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0251_R39R0201_0047
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0251_R39R0201_0047
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0251_R39R0201_0047
	clearflag FLAG_UNK_226
	end

scr_seq_0251_R39R0201_0047:
	setflag FLAG_UNK_226
	end

scr_seq_0251_R39R0201_004D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_100
	gotoif TRUE, scr_seq_0251_R39R0201_00A2
	checkflag FLAG_UNK_0AA
	gotoif TRUE, scr_seq_0251_R39R0201_007E
	npc_msg 5
	closemsg
scr_seq_0251_R39R0201_0070:
	apply_movement 0, scr_seq_0251_R39R0201_021C
	wait_movement
	releaseall
	end

scr_seq_0251_R39R0201_007E:
	npc_msg 6
	setvar VAR_SPECIAL_x8004, 434
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	npc_msg 7
	closemsg
	setflag FLAG_UNK_100
	goto scr_seq_0251_R39R0201_0070

scr_seq_0251_R39R0201_00A0:
	.byte 0x02, 0x00
scr_seq_0251_R39R0201_00A2:
	npc_msg 8
	closemsg
	goto scr_seq_0251_R39R0201_0070

scr_seq_0251_R39R0201_00AD:
	.byte 0x02, 0x00
scr_seq_0251_R39R0201_00AF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_101
	gotoif TRUE, scr_seq_0251_R39R0201_00E0
	checkflag FLAG_UNK_0AA
	gotoif TRUE, scr_seq_0251_R39R0201_00FA
	npc_msg 0
	closemsg
scr_seq_0251_R39R0201_00D2:
	apply_movement 2, scr_seq_0251_R39R0201_0224
	wait_movement
	releaseall
	end

scr_seq_0251_R39R0201_00E0:
	npc_msg 4
	closemsg
	goto scr_seq_0251_R39R0201_00D2

scr_seq_0251_R39R0201_00EB:
	.byte 0x02, 0x00
scr_seq_0251_R39R0201_00ED:
	npc_msg 2
	closemsg
	goto scr_seq_0251_R39R0201_00D2

scr_seq_0251_R39R0201_00F8:
	.byte 0x02, 0x00
scr_seq_0251_R39R0201_00FA:
	checkflag FLAG_UNK_100
	gotoif FALSE, scr_seq_0251_R39R0201_00ED
	npc_msg 1
	setvar VAR_SPECIAL_x8004, 29
	setvar VAR_SPECIAL_x8005, 34
	setvar VAR_SPECIAL_x8006, 39
	scrcmd_133 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 99
	gotoif eq, scr_seq_0251_R39R0201_020C
	scrcmd_133 32773, 32780
	comparevartovalue VAR_SPECIAL_x800C, 99
	gotoif eq, scr_seq_0251_R39R0201_020C
	scrcmd_133 32774, 32780
	comparevartovalue VAR_SPECIAL_x800C, 99
	gotoif eq, scr_seq_0251_R39R0201_020C
	setvar VAR_SPECIAL_x8000, 3
	setvar VAR_SPECIAL_x8001, 3
	setvar VAR_SPECIAL_x8002, 3
	scrcmd_133 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 96
	gotoif le, scr_seq_0251_R39R0201_01C2
	subvar VAR_SPECIAL_x800C, 96
	subvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	scrcmd_133 32773, 32780
	comparevartovalue VAR_SPECIAL_x800C, 96
	gotoif le, scr_seq_0251_R39R0201_01C2
	subvar VAR_SPECIAL_x800C, 96
	subvar VAR_SPECIAL_x8001, VAR_SPECIAL_x800C
	scrcmd_133 32774, 32780
	comparevartovalue VAR_SPECIAL_x800C, 96
	gotoif le, scr_seq_0251_R39R0201_01C2
	subvar VAR_SPECIAL_x800C, 96
	subvar VAR_SPECIAL_x8002, VAR_SPECIAL_x800C
scr_seq_0251_R39R0201_01C2:
	scrcmd_134 32772, 32768
	scrcmd_134 32773, 32769
	scrcmd_134 32774, 32770
	scrcmd_850 0, 32772
	npc_msg 20
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	scrcmd_850 0, 32773
	npc_msg 20
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	scrcmd_850 0, 32774
	npc_msg 20
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	closemsg
	setflag FLAG_UNK_101
	goto scr_seq_0251_R39R0201_00D2

scr_seq_0251_R39R0201_020A:
	.byte 0x02, 0x00
scr_seq_0251_R39R0201_020C:
	npc_msg 3
	closemsg
	goto scr_seq_0251_R39R0201_00D2

scr_seq_0251_R39R0201_0217:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00

scr_seq_0251_R39R0201_021C:
	.short 35, 1
	.short 254, 0

scr_seq_0251_R39R0201_0224:
	.short 34, 1
	.short 254, 0
scr_seq_0251_R39R0201_022C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0AA
	gotoif TRUE, scr_seq_0251_R39R0201_0354
	scrcmd_076 241, 11
	npc_msg 9
	scrcmd_077
	checkflag FLAG_UNK_0A8
	gotoif TRUE, scr_seq_0251_R39R0201_0260
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0251_R39R0201_0260:
	npc_msg 10
	scrcmd_049
	npc_msg 13
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0251_R39R0201_028C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0251_R39R0201_0378
	end

scr_seq_0251_R39R0201_028C:
	setvar VAR_SPECIAL_x8004, 155
	setvar VAR_SPECIAL_x8005, 1
	hasitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0251_R39R0201_036A
	takeitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	buffer_players_name 0
	npc_msg 14
	waitbutton
	closemsg
	checkflag FLAG_UNK_0B0
	gotoif TRUE, scr_seq_0251_R39R0201_033F
	checkflag FLAG_UNK_0AF
	gotoif TRUE, scr_seq_0251_R39R0201_0337
	checkflag FLAG_UNK_0AE
	gotoif TRUE, scr_seq_0251_R39R0201_0328
	checkflag FLAG_UNK_0AD
	gotoif TRUE, scr_seq_0251_R39R0201_0320
	checkflag FLAG_UNK_0AC
	gotoif TRUE, scr_seq_0251_R39R0201_0311
	checkflag FLAG_UNK_0A9
	gotoif TRUE, scr_seq_0251_R39R0201_0309
	setflag FLAG_UNK_0A9
	releaseall
	end

scr_seq_0251_R39R0201_0309:
	setflag FLAG_UNK_0AC
	releaseall
	end

scr_seq_0251_R39R0201_0311:
	setflag FLAG_UNK_0AD
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0251_R39R0201_0320:
	setflag FLAG_UNK_0AE
	releaseall
	end

scr_seq_0251_R39R0201_0328:
	setflag FLAG_UNK_0AF
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0251_R39R0201_0337:
	setflag FLAG_UNK_0B0
	releaseall
	end

scr_seq_0251_R39R0201_033F:
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	npc_msg 17
	waitbutton
	closemsg
	setflag FLAG_UNK_0AA
	releaseall
	end

scr_seq_0251_R39R0201_0354:
	scrcmd_076 241, 0
	npc_msg 11
	scrcmd_077
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0251_R39R0201_036A:
	buffer_players_name 0
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0251_R39R0201_0378:
	buffer_players_name 0
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0251_R39R0201_0386:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 241, 0
	npc_msg 11
	scrcmd_077
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
