#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0905_0006 ; 000
	scrdef_end

scr_seq_0905_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0905_0075
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0905_007F
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0905_0089
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0905_0093
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0905_009D
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0905_00A7
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0905_00B1
	end

scr_seq_0905_0075:
	scrcmd_852 0, 6
	goto scr_seq_0905_00BC

scr_seq_0905_007F:
	scrcmd_852 0, 5
	goto scr_seq_0905_00BC

scr_seq_0905_0089:
	scrcmd_852 0, 4
	goto scr_seq_0905_00BC

scr_seq_0905_0093:
	scrcmd_852 0, 3
	goto scr_seq_0905_00BC

scr_seq_0905_009D:
	scrcmd_852 0, 2
	goto scr_seq_0905_00BC

scr_seq_0905_00A7:
	scrcmd_852 0, 1
	goto scr_seq_0905_00BC

scr_seq_0905_00B1:
	scrcmd_198 0, 0
	goto scr_seq_0905_00BC

scr_seq_0905_00BC:
	scrcmd_242 20, 1, 16659, 16659
	npc_msg 0
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 121, 255, 6
	scrcmd_751 120, 255, 0
	scrcmd_751 119, 255, 1
	scrcmd_751 118, 255, 2
	scrcmd_751 117, 255, 3
	scrcmd_751 116, 255, 4
	scrcmd_751 122, 255, 5
	scrcmd_751 126, 255, 7
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0905_05D7
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0905_04F8
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0905_0419
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0905_033A
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0905_025B
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0905_017C
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0905_06B6
	goto scr_seq_0905_0898

scr_seq_0905_017C:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 191, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 1
	gotoif eq, scr_seq_0905_0881
	comparevartovalue VAR_UNK_4113, 1
	callif gt, scr_seq_0905_07A0
	comparevartovalue VAR_UNK_4113, 1
	callif lt, scr_seq_0905_0795
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0905_01D2
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_0249

scr_seq_0905_01D2:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0905_01EB
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_0249

scr_seq_0905_01EB:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0905_0204
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0905_0249

scr_seq_0905_0204:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0905_021D
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0905_0249

scr_seq_0905_021D:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_0905_0236
	setvar VAR_SPECIAL_x8005, 5
	goto scr_seq_0905_0249

scr_seq_0905_0236:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0905_0249
	setvar VAR_SPECIAL_x8005, 1
scr_seq_0905_0249:
	call scr_seq_0905_07AB
	setvar VAR_UNK_4113, 1
	goto scr_seq_0905_07C9

scr_seq_0905_025B:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 192, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 2
	gotoif eq, scr_seq_0905_0881
	comparevartovalue VAR_UNK_4113, 2
	callif gt, scr_seq_0905_07A0
	comparevartovalue VAR_UNK_4113, 2
	callif lt, scr_seq_0905_0795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0905_02B1
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_0328

scr_seq_0905_02B1:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0905_02CA
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_0328

scr_seq_0905_02CA:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0905_02E3
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_0328

scr_seq_0905_02E3:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0905_02FC
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0905_0328

scr_seq_0905_02FC:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_0905_0315
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0905_0328

scr_seq_0905_0315:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0905_0328
	setvar VAR_SPECIAL_x8005, 2
scr_seq_0905_0328:
	call scr_seq_0905_07AB
	setvar VAR_UNK_4113, 2
	goto scr_seq_0905_07C9

scr_seq_0905_033A:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 193, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 3
	gotoif eq, scr_seq_0905_0881
	comparevartovalue VAR_UNK_4113, 3
	callif gt, scr_seq_0905_07A0
	comparevartovalue VAR_UNK_4113, 3
	callif lt, scr_seq_0905_0795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0905_0390
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_0407

scr_seq_0905_0390:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0905_03A9
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_0407

scr_seq_0905_03A9:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0905_03C2
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_0407

scr_seq_0905_03C2:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0905_03DB
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_0407

scr_seq_0905_03DB:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_0905_03F4
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0905_0407

scr_seq_0905_03F4:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0905_0407
	setvar VAR_SPECIAL_x8005, 3
scr_seq_0905_0407:
	call scr_seq_0905_07AB
	setvar VAR_UNK_4113, 3
	goto scr_seq_0905_07C9

scr_seq_0905_0419:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 194, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 4
	gotoif eq, scr_seq_0905_0881
	comparevartovalue VAR_UNK_4113, 4
	callif gt, scr_seq_0905_07A0
	comparevartovalue VAR_UNK_4113, 4
	callif lt, scr_seq_0905_0795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0905_046F
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0905_04E6

scr_seq_0905_046F:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0905_0488
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_04E6

scr_seq_0905_0488:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0905_04A1
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_04E6

scr_seq_0905_04A1:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0905_04BA
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_04E6

scr_seq_0905_04BA:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_0905_04D3
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_04E6

scr_seq_0905_04D3:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0905_04E6
	setvar VAR_SPECIAL_x8005, 4
scr_seq_0905_04E6:
	call scr_seq_0905_07AB
	setvar VAR_UNK_4113, 4
	goto scr_seq_0905_07C9

scr_seq_0905_04F8:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 195, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 5
	gotoif eq, scr_seq_0905_0881
	comparevartovalue VAR_UNK_4113, 5
	callif gt, scr_seq_0905_07A0
	comparevartovalue VAR_UNK_4113, 5
	callif lt, scr_seq_0905_0795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0905_054E
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0905_05C5

scr_seq_0905_054E:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0905_0567
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0905_05C5

scr_seq_0905_0567:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0905_0580
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_05C5

scr_seq_0905_0580:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0905_0599
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_05C5

scr_seq_0905_0599:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_0905_05B2
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_05C5

scr_seq_0905_05B2:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0905_05C5
	setvar VAR_SPECIAL_x8005, 5
scr_seq_0905_05C5:
	call scr_seq_0905_07AB
	setvar VAR_UNK_4113, 5
	goto scr_seq_0905_07C9

scr_seq_0905_05D7:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 196, 1, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 6
	gotoif eq, scr_seq_0905_0881
	comparevartovalue VAR_UNK_4113, 6
	callif gt, scr_seq_0905_07A0
	comparevartovalue VAR_UNK_4113, 6
	callif lt, scr_seq_0905_0795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0905_062D
	setvar VAR_SPECIAL_x8005, 5
	goto scr_seq_0905_06A4

scr_seq_0905_062D:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0905_0646
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0905_06A4

scr_seq_0905_0646:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0905_065F
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0905_06A4

scr_seq_0905_065F:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0905_0678
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_06A4

scr_seq_0905_0678:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0905_0691
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_06A4

scr_seq_0905_0691:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_0905_06A4
	setvar VAR_SPECIAL_x8005, 6
scr_seq_0905_06A4:
	call scr_seq_0905_07AB
	setvar VAR_UNK_4113, 6
	goto scr_seq_0905_07C9

scr_seq_0905_06B6:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 200, 1, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 0
	gotoif eq, scr_seq_0905_0881
	comparevartovalue VAR_UNK_4113, 0
	callif gt, scr_seq_0905_07A0
	comparevartovalue VAR_UNK_4113, 0
	callif lt, scr_seq_0905_0795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_0905_070C
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0905_0783

scr_seq_0905_070C:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_0905_0725
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0905_0783

scr_seq_0905_0725:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_0905_073E
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0905_0783

scr_seq_0905_073E:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_0905_0757
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0905_0783

scr_seq_0905_0757:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_0905_0770
	setvar VAR_SPECIAL_x8005, 5
	goto scr_seq_0905_0783

scr_seq_0905_0770:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_0905_0783
	setvar VAR_SPECIAL_x8005, 6
scr_seq_0905_0783:
	call scr_seq_0905_07AB
	setvar VAR_UNK_4113, 0
	goto scr_seq_0905_07C9

scr_seq_0905_0795:
	npc_msg 2
	setvar VAR_SPECIAL_x8004, 0
	return

scr_seq_0905_07A0:
	npc_msg 3
	setvar VAR_SPECIAL_x8004, 1
	return

scr_seq_0905_07AB:
	setvar VAR_UNK_4113, 65535
	closemsg
	apply_movement 0, scr_seq_0905_08B0
	wait_movement
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 32773
	return

scr_seq_0905_07C9:
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0905_082C
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0905_0837
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0905_0842
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0905_084D
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0905_0858
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0905_0863
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0905_086E
	end

scr_seq_0905_082C:
	npc_msg 10
	goto scr_seq_0905_0879

scr_seq_0905_0835:
	.byte 0x02, 0x00
scr_seq_0905_0837:
	npc_msg 9
	goto scr_seq_0905_0879

scr_seq_0905_0840:
	.byte 0x02, 0x00
scr_seq_0905_0842:
	npc_msg 8
	goto scr_seq_0905_0879

scr_seq_0905_084B:
	.byte 0x02, 0x00
scr_seq_0905_084D:
	npc_msg 7
	goto scr_seq_0905_0879

scr_seq_0905_0856:
	.byte 0x02, 0x00
scr_seq_0905_0858:
	npc_msg 6
	goto scr_seq_0905_0879

scr_seq_0905_0861:
	.byte 0x02, 0x00
scr_seq_0905_0863:
	npc_msg 5
	goto scr_seq_0905_0879

scr_seq_0905_086C:
	.byte 0x02, 0x00
scr_seq_0905_086E:
	npc_msg 11
	goto scr_seq_0905_0879

scr_seq_0905_0877:
	.byte 0x02, 0x00
scr_seq_0905_0879:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0905_0881:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0905_0898:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0905_08AF:
	.byte 0x00

scr_seq_0905_08B0:
	.short 33, 1
	.short 254, 0
	.balign 4, 0
