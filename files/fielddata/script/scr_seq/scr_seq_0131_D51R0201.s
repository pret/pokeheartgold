#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0131_D51R0201_00CC ; 000
	scrdef scr_seq_0131_D51R0201_00CE ; 001
	scrdef scr_seq_0131_D51R0201_0022 ; 002
	scrdef scr_seq_0131_D51R0201_0444 ; 003
	scrdef scr_seq_0131_D51R0201_03DC ; 004
	scrdef scr_seq_0131_D51R0201_04AC ; 005
	scrdef scr_seq_0131_D51R0201_0095 ; 006
	scrdef scr_seq_0131_D51R0201_0069 ; 007
	scrdef_end

scr_seq_0131_D51R0201_0022:
	comparevartovalue VAR_UNK_40FB, 7
	gotoif eq, scr_seq_0131_D51R0201_0065
	comparevartovalue VAR_UNK_40FB, 8
	gotoif eq, scr_seq_0131_D51R0201_0065
	comparevartovalue VAR_UNK_40FB, 9
	gotoif eq, scr_seq_0131_D51R0201_0065
	comparevartovalue VAR_UNK_40FB, 12
	gotoif eq, scr_seq_0131_D51R0201_0065
	comparevartovalue VAR_UNK_40FB, 13
	gotoif eq, scr_seq_0131_D51R0201_0065
	end

scr_seq_0131_D51R0201_0065:
	scrcmd_818
	end

scr_seq_0131_D51R0201_0069:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0131_D51R0201_00C4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40FB, 13
	releaseall
	end

scr_seq_0131_D51R0201_0095:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0131_D51R0201_00C4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40FB, 4
	releaseall
	end

scr_seq_0131_D51R0201_00C1:
	.byte 0x00, 0x00, 0x00

scr_seq_0131_D51R0201_00C4:
	step 13, 2
	step_end
scr_seq_0131_D51R0201_00CC:
	end

scr_seq_0131_D51R0201_00CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40FB, 8
	gotoif eq, scr_seq_0131_D51R0201_0165
	get_lead_mon_index VAR_TEMP_x4005
	scrcmd_698 2, 16389, 16390
	comparevartovalue VAR_TEMP_x4006, 1
	gotoif eq, scr_seq_0131_D51R0201_011A
	scrcmd_698 1, 16389, 16391
	comparevartovalue VAR_TEMP_x4007, 1
	gotoif eq, scr_seq_0131_D51R0201_011A
	npc_msg 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0131_D51R0201_011A:
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif eq, scr_seq_0131_D51R0201_0154
	npc_msg 0
	closemsg
	get_party_count VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ge, scr_seq_0131_D51R0201_0154
	apply_movement 0, scr_seq_0131_D51R0201_02CC
	wait_movement
	npc_msg 6
	closemsg
	goto scr_seq_0131_D51R0201_0170

scr_seq_0131_D51R0201_0152:
	.byte 0x02, 0x00
scr_seq_0131_D51R0201_0154:
	npc_msg 2
	waitbutton
	closemsg
	setvar VAR_TEMP_x4004, 1
	releaseall
	end

scr_seq_0131_D51R0201_0165:
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0131_D51R0201_0170:
	setvar VAR_UNK_40FB, 8
	setvar VAR_UNK_4104, 1
	scrcmd_386 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0131_D51R0201_019B
	apply_movement 0, scr_seq_0131_D51R0201_02B4
	goto scr_seq_0131_D51R0201_01BE

scr_seq_0131_D51R0201_019B:
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif ne, scr_seq_0131_D51R0201_01B6
	apply_movement 0, scr_seq_0131_D51R0201_02BC
	goto scr_seq_0131_D51R0201_01BE

scr_seq_0131_D51R0201_01B6:
	apply_movement 0, scr_seq_0131_D51R0201_02C4
scr_seq_0131_D51R0201_01BE:
	wait_movement
	npc_msg 4
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_0131_D51R0201_01EA
	apply_movement 0, scr_seq_0131_D51R0201_02D4
	goto scr_seq_0131_D51R0201_01F2

scr_seq_0131_D51R0201_01EA:
	apply_movement 0, scr_seq_0131_D51R0201_02E0
scr_seq_0131_D51R0201_01F2:
	wait_movement
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0131_D51R0201_0217
	apply_movement 255, scr_seq_0131_D51R0201_0390
	apply_movement 0, scr_seq_0131_D51R0201_0308
	goto scr_seq_0131_D51R0201_024A

scr_seq_0131_D51R0201_0217:
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif ne, scr_seq_0131_D51R0201_023A
	apply_movement 255, scr_seq_0131_D51R0201_03A0
	apply_movement 0, scr_seq_0131_D51R0201_0308
	goto scr_seq_0131_D51R0201_024A

scr_seq_0131_D51R0201_023A:
	apply_movement 255, scr_seq_0131_D51R0201_03B4
	apply_movement 0, scr_seq_0131_D51R0201_02EC
scr_seq_0131_D51R0201_024A:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 5
	closemsg
	apply_movement 0, scr_seq_0131_D51R0201_0324
	wait_movement
	npc_msg 7
	closemsg
	apply_movement 0, scr_seq_0131_D51R0201_0334
	wait_movement
	npc_msg 8
	closemsg
	apply_movement 0, scr_seq_0131_D51R0201_0348
	wait_movement
	npc_msg 9
	closemsg
	apply_movement 0, scr_seq_0131_D51R0201_0364
	wait_movement
	npc_msg 10
	closemsg
	apply_movement 0, scr_seq_0131_D51R0201_0370
	apply_movement 255, scr_seq_0131_D51R0201_03C8
	wait_movement
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0131_D51R0201_02B4:
	step 33, 1
	step_end

scr_seq_0131_D51R0201_02BC:
	step 34, 1
	step_end

scr_seq_0131_D51R0201_02C4:
	step 35, 1
	step_end

scr_seq_0131_D51R0201_02CC:
	step 32, 1
	step_end

scr_seq_0131_D51R0201_02D4:
	step 14, 1
	step 35, 1
	step_end

scr_seq_0131_D51R0201_02E0:
	step 15, 1
	step 34, 1
	step_end

scr_seq_0131_D51R0201_02EC:
	step 65, 1
	step 15, 1
	step 12, 3
	step 15, 1
	step 12, 2
	step 34, 1
	step_end

scr_seq_0131_D51R0201_0308:
	step 65, 1
	step 14, 1
	step 12, 3
	step 15, 1
	step 12, 2
	step 34, 1
	step_end

scr_seq_0131_D51R0201_0324:
	step 15, 3
	step 13, 1
	step 34, 1
	step_end

scr_seq_0131_D51R0201_0334:
	step 13, 1
	step 14, 8
	step 12, 1
	step 35, 1
	step_end

scr_seq_0131_D51R0201_0348:
	step 12, 3
	step 15, 2
	step 12, 3
	step 15, 2
	step 12, 1
	step 33, 1
	step_end

scr_seq_0131_D51R0201_0364:
	step 13, 3
	step 33, 1
	step_end

scr_seq_0131_D51R0201_0370:
	step 15, 1
	step 13, 6
	step 14, 1
	step 32, 1
	step_end
	.byte 0x21, 0x00, 0x01, 0x00, 0x0d, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0131_D51R0201_0390:
	step 12, 6
	step 65, 1
	step 35, 1
	step_end

scr_seq_0131_D51R0201_03A0:
	step 15, 1
	step 12, 5
	step 65, 1
	step 35, 1
	step_end

scr_seq_0131_D51R0201_03B4:
	step 14, 1
	step 12, 5
	step 65, 1
	step 35, 1
	step_end

scr_seq_0131_D51R0201_03C8:
	step 63, 2
	step 35, 1
	step 63, 3
	step 35, 1
	step_end
scr_seq_0131_D51R0201_03DC:
	scrcmd_609
	lockall
	comparevartovalue VAR_UNK_40FB, 13
	gotoif lt, scr_seq_0131_D51R0201_0430
	comparevartovalue VAR_UNK_4103, 1
	gotoif eq, scr_seq_0131_D51R0201_0545
	call scr_seq_0131_D51R0201_0550
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif eq, scr_seq_0131_D51R0201_0633
	comparevartovalue VAR_TEMP_x400A, 2
	gotoif eq, scr_seq_0131_D51R0201_061D
	comparevartovalue VAR_TEMP_x400A, 3
	gotoif eq, scr_seq_0131_D51R0201_0628
	npc_msg 27
	goto scr_seq_0131_D51R0201_0433

scr_seq_0131_D51R0201_0430:
	npc_msg 13
scr_seq_0131_D51R0201_0433:
	scrcmd_820 1
	setvar VAR_TEMP_x4009, 483
	goto scr_seq_0131_D51R0201_0514

scr_seq_0131_D51R0201_0442:
	.byte 0x02, 0x00
scr_seq_0131_D51R0201_0444:
	scrcmd_609
	lockall
	comparevartovalue VAR_UNK_40FB, 13
	gotoif lt, scr_seq_0131_D51R0201_0498
	comparevartovalue VAR_UNK_4103, 2
	gotoif eq, scr_seq_0131_D51R0201_0545
	call scr_seq_0131_D51R0201_0550
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif eq, scr_seq_0131_D51R0201_0633
	comparevartovalue VAR_TEMP_x400A, 2
	gotoif eq, scr_seq_0131_D51R0201_061D
	comparevartovalue VAR_TEMP_x400A, 3
	gotoif eq, scr_seq_0131_D51R0201_0628
	npc_msg 28
	goto scr_seq_0131_D51R0201_049B

scr_seq_0131_D51R0201_0498:
	npc_msg 14
scr_seq_0131_D51R0201_049B:
	scrcmd_820 2
	setvar VAR_TEMP_x4009, 484
	goto scr_seq_0131_D51R0201_0514

scr_seq_0131_D51R0201_04AA:
	.byte 0x02, 0x00
scr_seq_0131_D51R0201_04AC:
	scrcmd_609
	lockall
	comparevartovalue VAR_UNK_40FB, 13
	gotoif lt, scr_seq_0131_D51R0201_0500
	comparevartovalue VAR_UNK_4103, 3
	gotoif eq, scr_seq_0131_D51R0201_0545
	call scr_seq_0131_D51R0201_0550
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif eq, scr_seq_0131_D51R0201_0633
	comparevartovalue VAR_TEMP_x400A, 2
	gotoif eq, scr_seq_0131_D51R0201_061D
	comparevartovalue VAR_TEMP_x400A, 3
	gotoif eq, scr_seq_0131_D51R0201_0628
	npc_msg 29
	goto scr_seq_0131_D51R0201_0503

scr_seq_0131_D51R0201_0500:
	npc_msg 15
scr_seq_0131_D51R0201_0503:
	scrcmd_820 3
	setvar VAR_TEMP_x4009, 487
	goto scr_seq_0131_D51R0201_0514

scr_seq_0131_D51R0201_0512:
	.byte 0x02, 0x00
scr_seq_0131_D51R0201_0514:
	scrcmd_490 16393
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0131_D51R0201_063E
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0131_D51R0201_053C
	end

scr_seq_0131_D51R0201_053C:
	closemsg
	scrcmd_820 0
	releaseall
	end

scr_seq_0131_D51R0201_0545:
	npc_msg 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0131_D51R0201_0550:
	get_party_count VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif eq, scr_seq_0131_D51R0201_056D
	scrcmd_490 16392
	setvar VAR_TEMP_x400A, 2
	return

scr_seq_0131_D51R0201_056D:
	get_lead_mon_index VAR_TEMP_x4000
	comparevartovalue VAR_UNK_4102, 1
	gotoif ne, scr_seq_0131_D51R0201_05B2
	scrcmd_698 1, 16384, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0131_D51R0201_0605
	scrcmd_698 2, 16384, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0131_D51R0201_060D
	goto scr_seq_0131_D51R0201_0615

scr_seq_0131_D51R0201_05AC:
	.byte 0x16, 0x00, 0x47, 0x00
	.byte 0x00, 0x00
scr_seq_0131_D51R0201_05B2:
	comparevartovalue VAR_UNK_4102, 2
	gotoif ne, scr_seq_0131_D51R0201_05F3
	scrcmd_698 2, 16384, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0131_D51R0201_0605
	scrcmd_698 1, 16384, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0131_D51R0201_060D
	goto scr_seq_0131_D51R0201_0615

scr_seq_0131_D51R0201_05ED:
	.byte 0x16, 0x00, 0x06
	.byte 0x00, 0x00, 0x00
scr_seq_0131_D51R0201_05F3:
	goto scr_seq_0131_D51R0201_0615

scr_seq_0131_D51R0201_05F9:
	.byte 0xea, 0x01, 0x07, 0x40, 0x29, 0x00, 0x0a
	.byte 0x40, 0x02, 0x00, 0x1b, 0x00
scr_seq_0131_D51R0201_0605:
	setvar VAR_TEMP_x400A, 1
	return

scr_seq_0131_D51R0201_060D:
	setvar VAR_TEMP_x400A, 3
	return

scr_seq_0131_D51R0201_0615:
	setvar VAR_TEMP_x400A, 0
	return

scr_seq_0131_D51R0201_061D:
	npc_msg 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0131_D51R0201_0628:
	npc_msg 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0131_D51R0201_0633:
	npc_msg 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0131_D51R0201_063E:
	closemsg
	comparevartovalue VAR_UNK_40FB, 13
	gotoif ne, scr_seq_0131_D51R0201_0659
	setvar VAR_UNK_40FB, 14
	goto scr_seq_0131_D51R0201_065F

scr_seq_0131_D51R0201_0659:
	setvar VAR_UNK_40FB, 9
scr_seq_0131_D51R0201_065F:
	scrcmd_820 0
	setvar VAR_UNK_4104, 0
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_386 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4009, 483
	gotoif ne, scr_seq_0131_D51R0201_0691
	goto scr_seq_0131_D51R0201_06B0

scr_seq_0131_D51R0201_068B:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00
	.byte 0x00
scr_seq_0131_D51R0201_0691:
	comparevartovalue VAR_TEMP_x4009, 484
	gotoif ne, scr_seq_0131_D51R0201_06AA
	goto scr_seq_0131_D51R0201_0731

scr_seq_0131_D51R0201_06A4:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0131_D51R0201_06AA:
	goto scr_seq_0131_D51R0201_07B2

scr_seq_0131_D51R0201_06B0:
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0131_D51R0201_06D3
	apply_movement 253, scr_seq_0131_D51R0201_0BE4
	apply_movement 241, scr_seq_0131_D51R0201_0C28
	goto scr_seq_0131_D51R0201_0729

scr_seq_0131_D51R0201_06D3:
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif ne, scr_seq_0131_D51R0201_06F6
	apply_movement 253, scr_seq_0131_D51R0201_0BF4
	apply_movement 241, scr_seq_0131_D51R0201_0C28
	goto scr_seq_0131_D51R0201_0729

scr_seq_0131_D51R0201_06F6:
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_0131_D51R0201_0719
	apply_movement 253, scr_seq_0131_D51R0201_0C08
	apply_movement 241, scr_seq_0131_D51R0201_0C28
	goto scr_seq_0131_D51R0201_0729

scr_seq_0131_D51R0201_0719:
	apply_movement 253, scr_seq_0131_D51R0201_0C18
	apply_movement 241, scr_seq_0131_D51R0201_0C28
scr_seq_0131_D51R0201_0729:
	wait_movement
	goto scr_seq_0131_D51R0201_0833

scr_seq_0131_D51R0201_0731:
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0131_D51R0201_0754
	apply_movement 253, scr_seq_0131_D51R0201_0C34
	apply_movement 241, scr_seq_0131_D51R0201_0C78
	goto scr_seq_0131_D51R0201_07AA

scr_seq_0131_D51R0201_0754:
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif ne, scr_seq_0131_D51R0201_0777
	apply_movement 253, scr_seq_0131_D51R0201_0C44
	apply_movement 241, scr_seq_0131_D51R0201_0C78
	goto scr_seq_0131_D51R0201_07AA

scr_seq_0131_D51R0201_0777:
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_0131_D51R0201_079A
	apply_movement 253, scr_seq_0131_D51R0201_0C54
	apply_movement 241, scr_seq_0131_D51R0201_0C78
	goto scr_seq_0131_D51R0201_07AA

scr_seq_0131_D51R0201_079A:
	apply_movement 253, scr_seq_0131_D51R0201_0C68
	apply_movement 241, scr_seq_0131_D51R0201_0C78
scr_seq_0131_D51R0201_07AA:
	wait_movement
	goto scr_seq_0131_D51R0201_0833

scr_seq_0131_D51R0201_07B2:
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0131_D51R0201_07D5
	apply_movement 253, scr_seq_0131_D51R0201_0C84
	apply_movement 241, scr_seq_0131_D51R0201_0CC4
	goto scr_seq_0131_D51R0201_082B

scr_seq_0131_D51R0201_07D5:
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif ne, scr_seq_0131_D51R0201_07F8
	apply_movement 253, scr_seq_0131_D51R0201_0C90
	apply_movement 241, scr_seq_0131_D51R0201_0CC4
	goto scr_seq_0131_D51R0201_082B

scr_seq_0131_D51R0201_07F8:
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_0131_D51R0201_081B
	apply_movement 253, scr_seq_0131_D51R0201_0CA0
	apply_movement 241, scr_seq_0131_D51R0201_0CC4
	goto scr_seq_0131_D51R0201_082B

scr_seq_0131_D51R0201_081B:
	apply_movement 253, scr_seq_0131_D51R0201_0CB0
	apply_movement 241, scr_seq_0131_D51R0201_0CC4
scr_seq_0131_D51R0201_082B:
	wait_movement
	goto scr_seq_0131_D51R0201_0833

scr_seq_0131_D51R0201_0833:
	fade_out_bgm 0, 30
	play_se SEQ_SE_GS_TAMASYUTUGEN
	scrcmd_816
	scrcmd_074 2366
	scrcmd_773 2
	comparevartovalue VAR_UNK_40FB, 14
	gotoif eq, scr_seq_0131_D51R0201_086E
	release 0
	move_person 0, 16, 1, 28, 0
	wait 5, VAR_SPECIAL_x800C
	lock 0
scr_seq_0131_D51R0201_086E:
	comparevartovalue VAR_TEMP_x4009, 483
	gotoif ne, scr_seq_0131_D51R0201_0889
	apply_movement 255, scr_seq_0131_D51R0201_0CCC
	goto scr_seq_0131_D51R0201_08AC

scr_seq_0131_D51R0201_0889:
	comparevartovalue VAR_TEMP_x4009, 484
	gotoif ne, scr_seq_0131_D51R0201_08A4
	apply_movement 255, scr_seq_0131_D51R0201_0CD8
	goto scr_seq_0131_D51R0201_08AC

scr_seq_0131_D51R0201_08A4:
	apply_movement 255, scr_seq_0131_D51R0201_0CE4
scr_seq_0131_D51R0201_08AC:
	wait 150, VAR_SPECIAL_x800C
	fade_screen 6, 30, 1, 0
	wait_fade
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_490 32772
	scrcmd_490 32773
	apply_movement 241, scr_seq_0131_D51R0201_0CF0
	wait_movement
	play_se SEQ_SE_GS_TAMASYUTUGEN
	comparevartovalue VAR_TEMP_x4009, 483
	gotoif ne, scr_seq_0131_D51R0201_08F6
	scrcmd_817 0
	goto scr_seq_0131_D51R0201_090F

scr_seq_0131_D51R0201_08F6:
	comparevartovalue VAR_TEMP_x4009, 484
	gotoif ne, scr_seq_0131_D51R0201_090C
	scrcmd_817 1
	goto scr_seq_0131_D51R0201_090F

scr_seq_0131_D51R0201_090C:
	scrcmd_817 2
scr_seq_0131_D51R0201_090F:
	scrcmd_074 2322
	apply_movement 255, scr_seq_0131_D51R0201_0D0C
	wait_movement
	scrcmd_819
	wait 2, VAR_SPECIAL_x800C
	npc_msg 25
	scrcmd_490 16393
	buffer_players_name 0
	buffer_species_name_custom 1, VAR_TEMP_x4009, 0, 0
	play_fanfare SEQ_ME_SHINKAOME
	npc_msg 26
	wait_fanfare
	closemsg
	apply_movement 241, scr_seq_0131_D51R0201_0CF8
	wait_movement
	scrcmd_103
	reset_bgm
	scrcmd_490 16393
	comparevartovalue VAR_TEMP_x4009, 483
	gotoif ne, scr_seq_0131_D51R0201_097B
	give_mon SPECIES_DIALGA, 1, 135, 0, 0, VAR_SPECIAL_x800C
	setvar VAR_UNK_4103, 1
	goto scr_seq_0131_D51R0201_09B6

scr_seq_0131_D51R0201_097B:
	comparevartovalue VAR_TEMP_x4009, 484
	gotoif ne, scr_seq_0131_D51R0201_09A2
	give_mon SPECIES_PALKIA, 1, 136, 0, 0, VAR_SPECIAL_x800C
	setvar VAR_UNK_4103, 2
	goto scr_seq_0131_D51R0201_09B6

scr_seq_0131_D51R0201_09A2:
	give_mon SPECIES_GIRATINA, 1, 112, 1, 26, VAR_SPECIAL_x800C
	setvar VAR_UNK_4103, 3
scr_seq_0131_D51R0201_09B6:
	touchscreen_menu_hide
	npc_msg 32
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	scrcmd_815 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif eq, scr_seq_0131_D51R0201_0BB2
	comparevartovalue VAR_UNK_40FB, 14
	gotoif eq, scr_seq_0131_D51R0201_0A4D
	apply_movement 0, scr_seq_0131_D51R0201_0D28
	apply_movement 255, scr_seq_0131_D51R0201_0D00
	apply_movement 253, scr_seq_0131_D51R0201_0D1C
	wait_movement
	npc_msg 16
	closemsg
	apply_movement 0, scr_seq_0131_D51R0201_0D4C
	wait_movement
	npc_msg 17
	closemsg
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, 0
	wait_fade
	wait 1, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 0
	wait_fade
	apply_movement 0, scr_seq_0131_D51R0201_0D30
	wait_movement
	npc_msg 18
	closemsg
	apply_movement 0, scr_seq_0131_D51R0201_0D44
	wait_movement
	npc_msg 19
	closemsg
scr_seq_0131_D51R0201_0A4D:
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, 0
	wait_fade
	wait 1, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 0
	wait_fade
	comparevartovalue VAR_UNK_40FB, 14
	gotoif eq, scr_seq_0131_D51R0201_0AAA
	get_lead_mon_index VAR_TEMP_x4005
	scrcmd_698 2, 16389, 16390
	comparevartovalue VAR_TEMP_x4006, 1
	gotoif ne, scr_seq_0131_D51R0201_0AA0
	setvar VAR_UNK_4102, 1
	goto scr_seq_0131_D51R0201_0AA6

scr_seq_0131_D51R0201_0AA0:
	setvar VAR_UNK_4102, 2
scr_seq_0131_D51R0201_0AA6:
	clearflag FLAG_UNK_2E7
scr_seq_0131_D51R0201_0AAA:
	play_se SEQ_SE_DP_KAIDAN2
	comparevartovalue VAR_UNK_403E, 6
	gotoif ne, scr_seq_0131_D51R0201_0AE5
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 490, 0, 9, 24, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0131_D51R0201_0BAE

scr_seq_0131_D51R0201_0AE5:
	comparevartovalue VAR_UNK_403E, 7
	gotoif ne, scr_seq_0131_D51R0201_0B1C
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 492, 0, 9, 24, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0131_D51R0201_0BAE

scr_seq_0131_D51R0201_0B1C:
	comparevartovalue VAR_UNK_403E, 8
	gotoif ne, scr_seq_0131_D51R0201_0B53
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 492, 0, 9, 24, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0131_D51R0201_0BAE

scr_seq_0131_D51R0201_0B53:
	comparevartovalue VAR_UNK_403E, 9
	gotoif ne, scr_seq_0131_D51R0201_0B8A
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 492, 0, 9, 24, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0131_D51R0201_0BAE

scr_seq_0131_D51R0201_0B8A:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 9, 24, 1
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0131_D51R0201_0BAE:
	releaseall
	end

scr_seq_0131_D51R0201_0BB2:
	get_party_count VAR_SPECIAL_x800C
	subvar VAR_SPECIAL_x800C, 1
	setvar VAR_TEMP_x4008, 0
	fade_screen 6, 1, 0, 0
	wait_fade
	nickname_input VAR_SPECIAL_x800C, VAR_TEMP_x4008
	scrcmd_819
	fade_screen 6, 1, 1, 0
	wait_fade
	return


scr_seq_0131_D51R0201_0BE4:
	step 11, 4
	step 8, 4
	step 33, 1
	step_end

scr_seq_0131_D51R0201_0BF4:
	step 8, 2
	step 11, 5
	step 8, 1
	step 33, 1
	step_end

scr_seq_0131_D51R0201_0C08:
	step 11, 3
	step 8, 3
	step 33, 1
	step_end

scr_seq_0131_D51R0201_0C18:
	step 11, 4
	step 8, 2
	step 33, 1
	step_end

scr_seq_0131_D51R0201_0C28:
	step 11, 4
	step 8, 3
	step_end

scr_seq_0131_D51R0201_0C34:
	step 10, 4
	step 8, 4
	step 33, 1
	step_end

scr_seq_0131_D51R0201_0C44:
	step 10, 3
	step 8, 3
	step 33, 1
	step_end

scr_seq_0131_D51R0201_0C54:
	step 8, 2
	step 10, 5
	step 8, 1
	step 33, 1
	step_end

scr_seq_0131_D51R0201_0C68:
	step 10, 4
	step 8, 2
	step 33, 1
	step_end

scr_seq_0131_D51R0201_0C78:
	step 10, 4
	step 8, 3
	step_end

scr_seq_0131_D51R0201_0C84:
	step 9, 3
	step 33, 1
	step_end

scr_seq_0131_D51R0201_0C90:
	step 9, 4
	step 11, 1
	step 33, 1
	step_end

scr_seq_0131_D51R0201_0CA0:
	step 9, 4
	step 10, 1
	step 33, 1
	step_end

scr_seq_0131_D51R0201_0CB0:
	step 11, 1
	step 9, 5
	step 10, 1
	step 33, 1
	step_end

scr_seq_0131_D51R0201_0CC4:
	step 9, 4
	step_end

scr_seq_0131_D51R0201_0CCC:
	step 23, 4
	step 0, 1
	step_end

scr_seq_0131_D51R0201_0CD8:
	step 22, 4
	step 0, 1
	step_end

scr_seq_0131_D51R0201_0CE4:
	step 13, 7
	step 0, 1
	step_end

scr_seq_0131_D51R0201_0CF0:
	step 12, 3
	step_end

scr_seq_0131_D51R0201_0CF8:
	step 13, 3
	step_end

scr_seq_0131_D51R0201_0D00:
	step 65, 2
	step 13, 2
	step_end

scr_seq_0131_D51R0201_0D0C:
	step 63, 1
	step 75, 1
	step 63, 1
	step_end

scr_seq_0131_D51R0201_0D1C:
	step 65, 2
	step 13, 4
	step_end

scr_seq_0131_D51R0201_0D28:
	step 12, 9
	step_end

scr_seq_0131_D51R0201_0D30:
	step 3, 1
	step 63, 3
	step 2, 1
	step 63, 3
	step_end

scr_seq_0131_D51R0201_0D44:
	step 32, 1
	step_end

scr_seq_0131_D51R0201_0D4C:
	step 63, 1
	step 33, 1
	step_end
	.balign 4, 0
