#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0143_0006 ; 000
	scrdef_end

scr_seq_0143_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_465 0, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_0070
	call scr_seq_0143_0122
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0143_003C
	goto scr_seq_0143_0055

scr_seq_0143_003C:
	scrcmd_465 3, 1, 0
	scrcmd_465 2, 1, 1
	npc_msg 0
	goto scr_seq_0143_00B6

scr_seq_0143_0055:
	scrcmd_465 3, 1, 0
	scrcmd_465 2, 1, 1
	npc_msg 1
	goto scr_seq_0143_008C

scr_seq_0143_006E:
	.byte 0x02, 0x00
scr_seq_0143_0070:
	npc_msg 2
scr_seq_0143_0073:
	call scr_seq_0143_0122
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0143_00B6
	goto scr_seq_0143_008C

scr_seq_0143_008C:
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x8004
	scrcmd_751 11, 255, 1
	scrcmd_751 13, 255, 3
	scrcmd_751 14, 255, 4
	scrcmd_752
	goto scr_seq_0143_00E2

scr_seq_0143_00B6:
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x8004
	scrcmd_751 11, 255, 1
	scrcmd_751 12, 255, 2
	scrcmd_751 13, 255, 3
	scrcmd_751 14, 255, 4
	scrcmd_752
scr_seq_0143_00E2:
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0143_01EF
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0143_0287
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0143_056C
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0143_0577
	goto scr_seq_0143_0577

scr_seq_0143_0122:
	scrcmd_465 0, 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_014C
	scrcmd_465 1, 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_01DF
scr_seq_0143_014C:
	scrcmd_465 0, 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_0176
	scrcmd_465 1, 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_01DF
scr_seq_0143_0176:
	scrcmd_465 0, 3, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_01A0
	scrcmd_465 1, 3, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_01DF
scr_seq_0143_01A0:
	scrcmd_465 0, 4, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_01CA
	scrcmd_465 1, 4, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_01DF
scr_seq_0143_01CA:
	scrcmd_465 0, 5, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_01E7
scr_seq_0143_01DF:
	setvar VAR_SPECIAL_x800C, 1
	return

scr_seq_0143_01E7:
	setvar VAR_SPECIAL_x800C, 0
	return

scr_seq_0143_01EF:
	scrcmd_747
	scrcmd_465 0, 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_021E
	npc_msg 5
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0143_0579
scr_seq_0143_021E:
	npc_msg 6
	scrcmd_049
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_465 4, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0143_0579
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0143_027C
	scrcmd_465 6
	scrcmd_465 2, 0, 0
	scrcmd_465 3, 0, 1
	npc_msg 7
	waitbutton
	goto scr_seq_0143_057E

scr_seq_0143_027C:
	npc_msg 27
	waitbutton
	goto scr_seq_0143_057E

scr_seq_0143_0287:
	npc_msg 3
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x8004
	scrcmd_465 7, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_0400
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0143_02B2
scr_seq_0143_02B2:
	scrcmd_465 0, 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_02EC
	scrcmd_465 1, 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0143_02EC
	scrcmd_465 2, 0, 0
	scrcmd_751 15, 255, 0
scr_seq_0143_02EC:
	scrcmd_465 0, 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_0326
	scrcmd_465 1, 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0143_0326
	scrcmd_465 2, 2, 1
	scrcmd_751 16, 255, 2
scr_seq_0143_0326:
	scrcmd_465 0, 3, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_0360
	scrcmd_465 1, 3, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0143_0360
	scrcmd_465 2, 3, 2
	scrcmd_751 17, 255, 3
scr_seq_0143_0360:
	scrcmd_465 0, 4, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_039A
	scrcmd_465 1, 4, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0143_039A
	scrcmd_465 2, 4, 3
	scrcmd_751 18, 255, 4
scr_seq_0143_039A:
	scrcmd_465 0, 5, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_03D4
	scrcmd_465 1, 5, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0143_03D4
	scrcmd_465 2, 5, 4
	scrcmd_751 19, 255, 5
scr_seq_0143_03D4:
	scrcmd_751 25, 255, 6
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x8004, 6
	gotoif eq, scr_seq_0143_0579
	comparevartovalue VAR_SPECIAL_x8004, 65534
	gotoif eq, scr_seq_0143_0579
	goto scr_seq_0143_0528

scr_seq_0143_0400:
	scrcmd_465 0, 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_043A
	scrcmd_465 1, 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0143_043A
	scrcmd_465 2, 0, 0
	scrcmd_751 20, 255, 0
scr_seq_0143_043A:
	scrcmd_465 0, 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_0474
	scrcmd_465 1, 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0143_0474
	scrcmd_465 2, 2, 1
	scrcmd_751 21, 255, 2
scr_seq_0143_0474:
	scrcmd_465 0, 3, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_04AE
	scrcmd_465 1, 3, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0143_04AE
	scrcmd_465 2, 3, 2
	scrcmd_751 22, 255, 3
scr_seq_0143_04AE:
	scrcmd_465 0, 4, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_04E8
	scrcmd_465 1, 4, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0143_04E8
	scrcmd_465 2, 4, 3
	scrcmd_751 23, 255, 4
scr_seq_0143_04E8:
	scrcmd_465 0, 5, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0143_03D4
	scrcmd_465 1, 5, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0143_03D4
	scrcmd_465 2, 5, 4
	scrcmd_751 24, 255, 5
	goto scr_seq_0143_03D4

scr_seq_0143_0528:
	scrcmd_465 2, VAR_SPECIAL_x8004, 0
	scrcmd_465 3, VAR_SPECIAL_x8004, 1
	npc_msg 8
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0143_0287
	scrcmd_747
	scrcmd_465 5, VAR_SPECIAL_x8004
	buffer_players_name 0
	scrcmd_465 2, VAR_SPECIAL_x8004, 1
	npc_msg 9
	waitbutton
	goto scr_seq_0143_057E

scr_seq_0143_056C:
	scrcmd_747
	npc_msg 10
	goto scr_seq_0143_0073

scr_seq_0143_0577:
	scrcmd_747
scr_seq_0143_0579:
	npc_msg 4
	waitbutton
scr_seq_0143_057E:
	closemsg
	releaseall
	end
	.balign 4, 0
