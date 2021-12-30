#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0905_T25R1007_0006 ; 000
	scrdef_end

scr_seq_0905_T25R1007_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0905_T25R1007_0075
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0905_T25R1007_007F
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0905_T25R1007_0089
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0905_T25R1007_0093
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0905_T25R1007_009D
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0905_T25R1007_00A7
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0905_T25R1007_00B1
	end

scr_seq_0905_T25R1007_0075:
	scrcmd_852 0, 6
	goto scr_seq_0905_T25R1007_00BC

scr_seq_0905_T25R1007_007F:
	scrcmd_852 0, 5
	goto scr_seq_0905_T25R1007_00BC

scr_seq_0905_T25R1007_0089:
	scrcmd_852 0, 4
	goto scr_seq_0905_T25R1007_00BC

scr_seq_0905_T25R1007_0093:
	scrcmd_852 0, 3
	goto scr_seq_0905_T25R1007_00BC

scr_seq_0905_T25R1007_009D:
	scrcmd_852 0, 2
	goto scr_seq_0905_T25R1007_00BC

scr_seq_0905_T25R1007_00A7:
	scrcmd_852 0, 1
	goto scr_seq_0905_T25R1007_00BC

scr_seq_0905_T25R1007_00B1:
	buffer_int 0, 0
	goto scr_seq_0905_T25R1007_00BC

scr_seq_0905_T25R1007_00BC:
	scrcmd_242 20, 1, 16659, 16659
	npc_msg 0
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 121, 255, 6
	menu_item_add 120, 255, 0
	menu_item_add 119, 255, 1
	menu_item_add 118, 255, 2
	menu_item_add 117, 255, 3
	menu_item_add 116, 255, 4
	menu_item_add 122, 255, 5
	menu_item_add 126, 255, 7
	menu_exec
	touchscreen_menu_show
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0905_T25R1007_05D7
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0905_T25R1007_04F8
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0905_T25R1007_0419
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0905_T25R1007_033A
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0905_T25R1007_025B
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0905_T25R1007_017C
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0905_T25R1007_06B6
	goto scr_seq_0905_T25R1007_0898

scr_seq_0905_T25R1007_017C:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 191, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 1
	gotoif eq, scr_seq_0905_T25R1007_0881
	comparevartovalue VAR_UNK_4113, 1
	callif gt, scr_seq_0905_T25R1007_07A0
	comparevartovalue VAR_UNK_4113, 1
	callif lt, scr_seq_0905_T25R1007_0795
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0905_T25R1007_01D2
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_T25R1007_0249

scr_seq_0905_T25R1007_01D2:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0905_T25R1007_01EB
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_T25R1007_0249

scr_seq_0905_T25R1007_01EB:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0905_T25R1007_0204
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0905_T25R1007_0249

scr_seq_0905_T25R1007_0204:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0905_T25R1007_021D
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0905_T25R1007_0249

scr_seq_0905_T25R1007_021D:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_0905_T25R1007_0236
	setvar VAR_SPECIAL_x8005, 5
	goto scr_seq_0905_T25R1007_0249

scr_seq_0905_T25R1007_0236:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0905_T25R1007_0249
	setvar VAR_SPECIAL_x8005, 1
scr_seq_0905_T25R1007_0249:
	call scr_seq_0905_T25R1007_07AB
	setvar VAR_UNK_4113, 1
	goto scr_seq_0905_T25R1007_07C9

scr_seq_0905_T25R1007_025B:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 192, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 2
	gotoif eq, scr_seq_0905_T25R1007_0881
	comparevartovalue VAR_UNK_4113, 2
	callif gt, scr_seq_0905_T25R1007_07A0
	comparevartovalue VAR_UNK_4113, 2
	callif lt, scr_seq_0905_T25R1007_0795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0905_T25R1007_02B1
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_T25R1007_0328

scr_seq_0905_T25R1007_02B1:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0905_T25R1007_02CA
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_T25R1007_0328

scr_seq_0905_T25R1007_02CA:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0905_T25R1007_02E3
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_T25R1007_0328

scr_seq_0905_T25R1007_02E3:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0905_T25R1007_02FC
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0905_T25R1007_0328

scr_seq_0905_T25R1007_02FC:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_0905_T25R1007_0315
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0905_T25R1007_0328

scr_seq_0905_T25R1007_0315:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0905_T25R1007_0328
	setvar VAR_SPECIAL_x8005, 2
scr_seq_0905_T25R1007_0328:
	call scr_seq_0905_T25R1007_07AB
	setvar VAR_UNK_4113, 2
	goto scr_seq_0905_T25R1007_07C9

scr_seq_0905_T25R1007_033A:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 193, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 3
	gotoif eq, scr_seq_0905_T25R1007_0881
	comparevartovalue VAR_UNK_4113, 3
	callif gt, scr_seq_0905_T25R1007_07A0
	comparevartovalue VAR_UNK_4113, 3
	callif lt, scr_seq_0905_T25R1007_0795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0905_T25R1007_0390
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_T25R1007_0407

scr_seq_0905_T25R1007_0390:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0905_T25R1007_03A9
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_T25R1007_0407

scr_seq_0905_T25R1007_03A9:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0905_T25R1007_03C2
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_T25R1007_0407

scr_seq_0905_T25R1007_03C2:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0905_T25R1007_03DB
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_T25R1007_0407

scr_seq_0905_T25R1007_03DB:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_0905_T25R1007_03F4
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0905_T25R1007_0407

scr_seq_0905_T25R1007_03F4:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0905_T25R1007_0407
	setvar VAR_SPECIAL_x8005, 3
scr_seq_0905_T25R1007_0407:
	call scr_seq_0905_T25R1007_07AB
	setvar VAR_UNK_4113, 3
	goto scr_seq_0905_T25R1007_07C9

scr_seq_0905_T25R1007_0419:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 194, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 4
	gotoif eq, scr_seq_0905_T25R1007_0881
	comparevartovalue VAR_UNK_4113, 4
	callif gt, scr_seq_0905_T25R1007_07A0
	comparevartovalue VAR_UNK_4113, 4
	callif lt, scr_seq_0905_T25R1007_0795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0905_T25R1007_046F
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0905_T25R1007_04E6

scr_seq_0905_T25R1007_046F:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0905_T25R1007_0488
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_T25R1007_04E6

scr_seq_0905_T25R1007_0488:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0905_T25R1007_04A1
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_T25R1007_04E6

scr_seq_0905_T25R1007_04A1:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0905_T25R1007_04BA
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_T25R1007_04E6

scr_seq_0905_T25R1007_04BA:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_0905_T25R1007_04D3
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_T25R1007_04E6

scr_seq_0905_T25R1007_04D3:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0905_T25R1007_04E6
	setvar VAR_SPECIAL_x8005, 4
scr_seq_0905_T25R1007_04E6:
	call scr_seq_0905_T25R1007_07AB
	setvar VAR_UNK_4113, 4
	goto scr_seq_0905_T25R1007_07C9

scr_seq_0905_T25R1007_04F8:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 195, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 5
	gotoif eq, scr_seq_0905_T25R1007_0881
	comparevartovalue VAR_UNK_4113, 5
	callif gt, scr_seq_0905_T25R1007_07A0
	comparevartovalue VAR_UNK_4113, 5
	callif lt, scr_seq_0905_T25R1007_0795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0905_T25R1007_054E
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0905_T25R1007_05C5

scr_seq_0905_T25R1007_054E:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0905_T25R1007_0567
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0905_T25R1007_05C5

scr_seq_0905_T25R1007_0567:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0905_T25R1007_0580
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_T25R1007_05C5

scr_seq_0905_T25R1007_0580:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0905_T25R1007_0599
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_T25R1007_05C5

scr_seq_0905_T25R1007_0599:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_0905_T25R1007_05B2
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_T25R1007_05C5

scr_seq_0905_T25R1007_05B2:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0905_T25R1007_05C5
	setvar VAR_SPECIAL_x8005, 5
scr_seq_0905_T25R1007_05C5:
	call scr_seq_0905_T25R1007_07AB
	setvar VAR_UNK_4113, 5
	goto scr_seq_0905_T25R1007_07C9

scr_seq_0905_T25R1007_05D7:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 196, 1, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 6
	gotoif eq, scr_seq_0905_T25R1007_0881
	comparevartovalue VAR_UNK_4113, 6
	callif gt, scr_seq_0905_T25R1007_07A0
	comparevartovalue VAR_UNK_4113, 6
	callif lt, scr_seq_0905_T25R1007_0795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0905_T25R1007_062D
	setvar VAR_SPECIAL_x8005, 5
	goto scr_seq_0905_T25R1007_06A4

scr_seq_0905_T25R1007_062D:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0905_T25R1007_0646
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0905_T25R1007_06A4

scr_seq_0905_T25R1007_0646:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0905_T25R1007_065F
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0905_T25R1007_06A4

scr_seq_0905_T25R1007_065F:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0905_T25R1007_0678
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_T25R1007_06A4

scr_seq_0905_T25R1007_0678:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0905_T25R1007_0691
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_T25R1007_06A4

scr_seq_0905_T25R1007_0691:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0905_T25R1007_06A4
	setvar VAR_SPECIAL_x8005, 6
scr_seq_0905_T25R1007_06A4:
	call scr_seq_0905_T25R1007_07AB
	setvar VAR_UNK_4113, 6
	goto scr_seq_0905_T25R1007_07C9

scr_seq_0905_T25R1007_06B6:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 200, 1, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 0
	gotoif eq, scr_seq_0905_T25R1007_0881
	comparevartovalue VAR_UNK_4113, 0
	callif gt, scr_seq_0905_T25R1007_07A0
	comparevartovalue VAR_UNK_4113, 0
	callif lt, scr_seq_0905_T25R1007_0795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0905_T25R1007_070C
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_T25R1007_0783

scr_seq_0905_T25R1007_070C:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0905_T25R1007_0725
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_T25R1007_0783

scr_seq_0905_T25R1007_0725:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0905_T25R1007_073E
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0905_T25R1007_0783

scr_seq_0905_T25R1007_073E:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0905_T25R1007_0757
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0905_T25R1007_0783

scr_seq_0905_T25R1007_0757:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0905_T25R1007_0770
	setvar VAR_SPECIAL_x8005, 5
	goto scr_seq_0905_T25R1007_0783

scr_seq_0905_T25R1007_0770:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_0905_T25R1007_0783
	setvar VAR_SPECIAL_x8005, 6
scr_seq_0905_T25R1007_0783:
	call scr_seq_0905_T25R1007_07AB
	setvar VAR_UNK_4113, 0
	goto scr_seq_0905_T25R1007_07C9

scr_seq_0905_T25R1007_0795:
	npc_msg 2
	setvar VAR_SPECIAL_x8004, 0
	return

scr_seq_0905_T25R1007_07A0:
	npc_msg 3
	setvar VAR_SPECIAL_x8004, 1
	return

scr_seq_0905_T25R1007_07AB:
	setvar VAR_UNK_4113, 65535
	closemsg
	apply_movement 0, scr_seq_0905_T25R1007_08B0
	wait_movement
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 32773
	return

scr_seq_0905_T25R1007_07C9:
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0905_T25R1007_082C
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0905_T25R1007_0837
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0905_T25R1007_0842
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0905_T25R1007_084D
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0905_T25R1007_0858
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0905_T25R1007_0863
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0905_T25R1007_086E
	end

scr_seq_0905_T25R1007_082C:
	npc_msg 10
	goto scr_seq_0905_T25R1007_0879

scr_seq_0905_T25R1007_0835:
	.byte 0x02, 0x00
scr_seq_0905_T25R1007_0837:
	npc_msg 9
	goto scr_seq_0905_T25R1007_0879

scr_seq_0905_T25R1007_0840:
	.byte 0x02, 0x00
scr_seq_0905_T25R1007_0842:
	npc_msg 8
	goto scr_seq_0905_T25R1007_0879

scr_seq_0905_T25R1007_084B:
	.byte 0x02, 0x00
scr_seq_0905_T25R1007_084D:
	npc_msg 7
	goto scr_seq_0905_T25R1007_0879

scr_seq_0905_T25R1007_0856:
	.byte 0x02, 0x00
scr_seq_0905_T25R1007_0858:
	npc_msg 6
	goto scr_seq_0905_T25R1007_0879

scr_seq_0905_T25R1007_0861:
	.byte 0x02, 0x00
scr_seq_0905_T25R1007_0863:
	npc_msg 5
	goto scr_seq_0905_T25R1007_0879

scr_seq_0905_T25R1007_086C:
	.byte 0x02, 0x00
scr_seq_0905_T25R1007_086E:
	npc_msg 11
	goto scr_seq_0905_T25R1007_0879

scr_seq_0905_T25R1007_0877:
	.byte 0x02, 0x00
scr_seq_0905_T25R1007_0879:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0905_T25R1007_0881:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0905_T25R1007_0898:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0905_T25R1007_08AF:
	.byte 0x00

scr_seq_0905_T25R1007_08B0:
	step 33, 1
	step_end
	.balign 4, 0
