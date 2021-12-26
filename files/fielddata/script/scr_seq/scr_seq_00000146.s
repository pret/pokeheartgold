#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000146_0000004E ; 000
	scrdef scr_seq_00000146_00000281 ; 001
	scrdef scr_seq_00000146_000004F6 ; 002
	scrdef scr_seq_00000146_00000738 ; 003
	scrdef scr_seq_00000146_000007ED ; 004
	scrdef scr_seq_00000146_00000949 ; 005
	scrdef scr_seq_00000146_00000A83 ; 006
	scrdef scr_seq_00000146_0000018A ; 007
	scrdef scr_seq_00000146_000003D9 ; 008
	scrdef scr_seq_00000146_00000626 ; 009
	scrdef scr_seq_00000146_000007D7 ; 010
	scrdef scr_seq_00000146_00000855 ; 011
	scrdef scr_seq_00000146_000009C8 ; 012
	scrdef scr_seq_00000146_00000873 ; 013
	scrdef scr_seq_00000146_00000A85 ; 014
	scrdef scr_seq_00000146_000006E6 ; 015
	scrdef scr_seq_00000146_000009E6 ; 016
	scrdef scr_seq_00000146_00000A65 ; 017
	scrdef scr_seq_00000146_00000BCF ; 018
	scrdef_end

scr_seq_00000146_0000004E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_141 32780, 15
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_00000146_0000009E
	scrcmd_294 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_0000009E
	msgbox 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_000000AD
	closemsg
	goto scr_seq_00000146_0000093D

scr_seq_00000146_0000009C:
	.byte 0x02, 0x00
scr_seq_00000146_0000009E:
	msgbox 2
	waitbutton
	closemsg
	goto scr_seq_00000146_0000093D

scr_seq_00000146_000000AB:
	.byte 0x02, 0x00
scr_seq_00000146_000000AD:
	scrcmd_141 32780, 15
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_727 32773
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	msgbox 1
	closemsg
	get_trcard_stars VAR_SPECIAL_x800C
	scrcmd_730 32774
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000146_000000EC
	scrcmd_183 32772
	scrcmd_560 0, 32773
	goto scr_seq_00000146_00000165

scr_seq_00000146_000000EC:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_00000109
	scrcmd_183 32772
	scrcmd_560 0, 32773
	goto scr_seq_00000146_00000165

scr_seq_00000146_00000109:
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	gotoif eq, scr_seq_00000146_00000126
	scrcmd_183 32772
	scrcmd_560 0, 32773
	goto scr_seq_00000146_00000165

scr_seq_00000146_00000126:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_00000146_00000143
	scrcmd_183 32772
	scrcmd_560 0, 32773
	goto scr_seq_00000146_00000165

scr_seq_00000146_00000143:
	scrcmd_598 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_00000146_0000025B
	scrcmd_076 16384, 0
	scrcmd_077
	scrcmd_560 3, 32773
scr_seq_00000146_00000165:
	wait 7, VAR_SPECIAL_x800C
	hide_person VAR_SPECIAL_x800D
scr_seq_00000146_0000016F:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_00000146_0000016F
	goto scr_seq_00000146_0000093D

scr_seq_00000146_00000188:
	.byte 0x02, 0x00
scr_seq_00000146_0000018A:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	msgbox 1
	closemsg
	scrcmd_727 32772
	get_trcard_stars VAR_SPECIAL_x800C
	scrcmd_730 32774
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000146_000001C1
	scrcmd_183 32768
	scrcmd_560 0, 32773
	goto scr_seq_00000146_0000023A

scr_seq_00000146_000001C1:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_000001DE
	scrcmd_183 32768
	scrcmd_560 0, 32773
	goto scr_seq_00000146_0000023A

scr_seq_00000146_000001DE:
	comparevartovar VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	gotoif eq, scr_seq_00000146_000001FB
	scrcmd_183 32768
	scrcmd_560 0, 32773
	goto scr_seq_00000146_0000023A

scr_seq_00000146_000001FB:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_00000146_00000218
	scrcmd_183 32772
	scrcmd_560 0, 32773
	goto scr_seq_00000146_0000023A

scr_seq_00000146_00000218:
	scrcmd_598 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_00000146_0000025B
	scrcmd_076 16384, 0
	scrcmd_077
	scrcmd_560 3, 32773
scr_seq_00000146_0000023A:
	wait 7, VAR_SPECIAL_x800C
	hide_person VAR_SPECIAL_x800D
scr_seq_00000146_00000244:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_00000146_00000244
	releaseall
	end

scr_seq_00000146_0000025B:
	scrcmd_732 20
	scrcmd_733 12, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_0000027C
	scrcmd_734 2
	scrcmd_732 1
	goto scr_seq_00000146_0000027F

scr_seq_00000146_0000027C:
	scrcmd_734 1
scr_seq_00000146_0000027F:
	return

scr_seq_00000146_00000281:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_141 32780, 249
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_00000146_000002D7
	scrcmd_294 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_000002D7
	msgbox 3
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_000002E6
	closemsg
	goto scr_seq_00000146_0000093D

scr_seq_00000146_000002D5:
	.byte 0x02, 0x00
scr_seq_00000146_000002D7:
	msgbox 4
	waitbutton
	closemsg
	goto scr_seq_00000146_0000093D

scr_seq_00000146_000002E4:
	.byte 0x02, 0x00
scr_seq_00000146_000002E6:
	bufferpartymonnick 0, VAR_SPECIAL_x8004
	msgbox 5
	closemsg
	scrcmd_727 32773
	get_trcard_stars VAR_SPECIAL_x800C
	scrcmd_730 32774
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000146_0000031F
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 32772
	scrcmd_560 1, 32773
	goto scr_seq_00000146_000003AA

scr_seq_00000146_0000031F:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_00000342
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 32772
	scrcmd_560 1, 32773
	goto scr_seq_00000146_000003AA

scr_seq_00000146_00000342:
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	gotoif eq, scr_seq_00000146_00000365
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 32772
	scrcmd_560 1, 32773
	goto scr_seq_00000146_000003AA

scr_seq_00000146_00000365:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_00000146_00000382
	scrcmd_183 32772
	scrcmd_560 1, 32773
	goto scr_seq_00000146_000003AA

scr_seq_00000146_00000382:
	setvar VAR_SPECIAL_x8007, 1
	scrcmd_598 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_00000146_000004D0
	scrcmd_076 16384, 0
	scrcmd_077
	scrcmd_560 2, 32773
scr_seq_00000146_000003AA:
	wait 10, VAR_SPECIAL_x800C
	hide_person VAR_SPECIAL_x800D
scr_seq_00000146_000003B4:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_00000146_000003B4
	releaseall
	scrcmd_753 32775, 32780, 32774
	goto scr_seq_00000146_00000CEB

scr_seq_00000146_000003D7:
	.byte 0x02, 0x00
scr_seq_00000146_000003D9:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	msgbox 5
	closemsg
	scrcmd_727 32772
	get_trcard_stars VAR_SPECIAL_x800C
	scrcmd_730 32774
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000146_00000416
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 32768
	scrcmd_560 1, 32773
	goto scr_seq_00000146_000004A1

scr_seq_00000146_00000416:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_00000439
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 32768
	scrcmd_560 1, 32773
	goto scr_seq_00000146_000004A1

scr_seq_00000146_00000439:
	comparevartovar VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	gotoif eq, scr_seq_00000146_0000045C
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 32768
	scrcmd_560 1, 32773
	goto scr_seq_00000146_000004A1

scr_seq_00000146_0000045C:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_00000146_00000479
	scrcmd_183 32772
	scrcmd_560 1, 32773
	goto scr_seq_00000146_000004A1

scr_seq_00000146_00000479:
	scrcmd_598 1
	setvar VAR_SPECIAL_x8007, 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_00000146_000004D0
	scrcmd_076 16384, 0
	scrcmd_077
	scrcmd_560 2, 32773
scr_seq_00000146_000004A1:
	wait 10, VAR_SPECIAL_x800C
	hide_person VAR_SPECIAL_x800D
scr_seq_00000146_000004AB:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_00000146_000004AB
	releaseall
	scrcmd_753 32775, 32780, 32774
	goto scr_seq_00000146_00000CEB

scr_seq_00000146_000004CE:
	.byte 0x02, 0x00
scr_seq_00000146_000004D0:
	scrcmd_732 20
	scrcmd_733 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_000004F1
	scrcmd_734 2
	scrcmd_732 1
	goto scr_seq_00000146_000004F4

scr_seq_00000146_000004F1:
	scrcmd_734 1
scr_seq_00000146_000004F4:
	return

scr_seq_00000146_000004F6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_400 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_0000051C
	call scr_seq_00000146_0000061D
	goto scr_seq_00000146_0000093D

scr_seq_00000146_0000051C:
	scrcmd_141 32780, 70
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_00000146_00000564
	scrcmd_294 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_00000564
	msgbox 7
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_00000573
	closemsg
	goto scr_seq_00000146_0000093D

scr_seq_00000146_00000562:
	.byte 0x02, 0x00
scr_seq_00000146_00000564:
	msgbox 9
	waitbutton
	closemsg
	goto scr_seq_00000146_0000093D

scr_seq_00000146_00000571:
	.byte 0x02, 0x00
scr_seq_00000146_00000573:
	scrcmd_400 1
	scrcmd_141 32780, 70
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	msgbox 11
	closemsg
	scrcmd_727 32773
	get_trcard_stars VAR_SPECIAL_x800C
	scrcmd_730 32774
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000146_000005AF
	scrcmd_183 32772
	goto scr_seq_00000146_0000060E

scr_seq_00000146_000005AF:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_000005C6
	scrcmd_183 32772
	goto scr_seq_00000146_0000060E

scr_seq_00000146_000005C6:
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	gotoif eq, scr_seq_00000146_000005DD
	scrcmd_183 32772
	goto scr_seq_00000146_0000060E

scr_seq_00000146_000005DD:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_00000146_000005F4
	scrcmd_183 32772
	goto scr_seq_00000146_0000060E

scr_seq_00000146_000005F4:
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_00000146_00000715
	scrcmd_076 16384, 0
	scrcmd_077
	scrcmd_731
scr_seq_00000146_0000060E:
	msgbox 12
	waitbutton
	closemsg
	goto scr_seq_00000146_0000093D

scr_seq_00000146_0000061B:
	.byte 0x02, 0x00
scr_seq_00000146_0000061D:
	msgbox 10
	waitbutton
	closemsg
	return

scr_seq_00000146_00000626:
	scrcmd_609
	lockall
	scrcmd_400 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_00000648
	call scr_seq_00000146_0000061D
	goto scr_seq_00000146_00000945

scr_seq_00000146_00000648:
	scrcmd_400 1
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	msgbox 11
	closemsg
	scrcmd_727 32772
	get_trcard_stars VAR_SPECIAL_x800C
	scrcmd_730 32774
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000146_00000678
	scrcmd_183 32768
	goto scr_seq_00000146_000006D7

scr_seq_00000146_00000678:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_0000068F
	scrcmd_183 32768
	goto scr_seq_00000146_000006D7

scr_seq_00000146_0000068F:
	comparevartovar VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	gotoif eq, scr_seq_00000146_000006A6
	scrcmd_183 32768
	goto scr_seq_00000146_000006D7

scr_seq_00000146_000006A6:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_00000146_000006BD
	scrcmd_183 32768
	goto scr_seq_00000146_000006D7

scr_seq_00000146_000006BD:
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_00000146_00000715
	scrcmd_076 16384, 0
	scrcmd_077
	scrcmd_731
scr_seq_00000146_000006D7:
	msgbox 12
	waitbutton
	closemsg
	goto scr_seq_00000146_00000945

scr_seq_00000146_000006E4:
	.byte 0x02, 0x00
scr_seq_00000146_000006E6:
	play_se SEQ_SE_GS_IWAOTOSHI01
	wait 12, VAR_SPECIAL_x800C
	play_se SEQ_SE_GS_IWAOTOSHI02
	scrcmd_561 0, 4, 2, 8
	scrcmd_561 0, 2, 1, 8
	wait_se SEQ_SE_GS_IWAOTOSHI02
	msgbox 13
	waitbutton
	closemsg
	end

scr_seq_00000146_00000715:
	scrcmd_733 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_00000733
	scrcmd_734 2
	scrcmd_732 1
	goto scr_seq_00000146_00000736

scr_seq_00000146_00000733:
	scrcmd_734 1
scr_seq_00000146_00000736:
	return

scr_seq_00000146_00000738:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_141 32780, 431
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_00000146_00000797
	scrcmd_294 15, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_00000797
	scrcmd_299 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000146_000007A6
	msgbox 20
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_000007B5
	closemsg
	goto scr_seq_00000146_00000941

scr_seq_00000146_00000795:
	.byte 0x02, 0x00
scr_seq_00000146_00000797:
	msgbox 22
	waitbutton
	closemsg
	goto scr_seq_00000146_00000941

scr_seq_00000146_000007A4:
	.byte 0x02, 0x00
scr_seq_00000146_000007A6:
	msgbox 23
	waitbutton
	closemsg
	goto scr_seq_00000146_00000941

scr_seq_00000146_000007B3:
	.byte 0x02, 0x00
scr_seq_00000146_000007B5:
	scrcmd_141 32780, 431
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	msgbox 21
	closemsg
	scrcmd_177 32772
	goto scr_seq_00000146_00000941

scr_seq_00000146_000007D5:
	.byte 0x02, 0x00
scr_seq_00000146_000007D7:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	msgbox 21
	closemsg
	scrcmd_177 32768
	releaseall
	end

scr_seq_00000146_000007ED:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_299 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000146_00000826
	msgbox 14
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_00000833
	closemsg
	goto scr_seq_00000146_00000941

scr_seq_00000146_00000824:
	.byte 0x02, 0x00
scr_seq_00000146_00000826:
	msgbox 16
	waitbutton
	closemsg
	goto scr_seq_00000146_00000941

scr_seq_00000146_00000833:
	scrcmd_141 32780, 57
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	msgbox 15
	closemsg
	scrcmd_178 32772
	goto scr_seq_00000146_00000941

scr_seq_00000146_00000853:
	.byte 0x02, 0x00
scr_seq_00000146_00000855:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	msgbox 15
	closemsg
	scrcmd_099 255
	scrcmd_178 32768
	scrcmd_098 255
	releaseall
	end

scr_seq_00000146_00000873:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	msgbox 28
	closemsg
	scrcmd_727 32773
	get_trcard_stars VAR_SPECIAL_x800C
	scrcmd_730 32774
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000146_000008A4
	scrcmd_183 32768
	goto scr_seq_00000146_00000909

scr_seq_00000146_000008A4:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_000008BB
	scrcmd_183 32768
	goto scr_seq_00000146_00000909

scr_seq_00000146_000008BB:
	comparevartovar VAR_SPECIAL_x8000, VAR_SPECIAL_x8005
	gotoif eq, scr_seq_00000146_000008D2
	scrcmd_183 32768
	goto scr_seq_00000146_00000909

scr_seq_00000146_000008D2:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_00000146_000008E9
	scrcmd_183 32768
	goto scr_seq_00000146_00000909

scr_seq_00000146_000008E9:
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_00000146_0000091A
	scrcmd_076 16384, 0
	scrcmd_077
	scrcmd_728 16, 2
	scrcmd_728 16, 2
scr_seq_00000146_00000909:
	scrcmd_401 1, 181
	wait 42, VAR_SPECIAL_x800C
	goto scr_seq_00000146_00000945

scr_seq_00000146_0000091A:
	scrcmd_733 14, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_00000938
	scrcmd_734 2
	scrcmd_732 1
	goto scr_seq_00000146_0000093B

scr_seq_00000146_00000938:
	scrcmd_734 1
scr_seq_00000146_0000093B:
	return

scr_seq_00000146_0000093D:
	releaseall
	end

scr_seq_00000146_00000941:
	releaseall
	end

scr_seq_00000146_00000945:
	releaseall
	end

scr_seq_00000146_00000949:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_141 32780, 127
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_00000146_00000997
	scrcmd_294 7, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_00000997
	msgbox 24
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_000009A6
	closemsg
	goto scr_seq_00000146_00000941

scr_seq_00000146_00000995:
	.byte 0x02, 0x00
scr_seq_00000146_00000997:
	msgbox 26
	waitbutton
	closemsg
	goto scr_seq_00000146_00000941

scr_seq_00000146_000009A4:
	.byte 0x02, 0x00
scr_seq_00000146_000009A6:
	scrcmd_141 32780, 127
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	msgbox 25
	closemsg
	scrcmd_179 32772
	goto scr_seq_00000146_00000941

scr_seq_00000146_000009C6:
	.byte 0x02, 0x00
scr_seq_00000146_000009C8:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	msgbox 25
	closemsg
	scrcmd_099 255
	scrcmd_179 32768
	scrcmd_098 255
	releaseall
	end

scr_seq_00000146_000009E6:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_141 32780, 250
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_00000146_00000A34
	scrcmd_294 6, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_00000A34
	msgbox 29
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_00000A43
	closemsg
	goto scr_seq_00000146_00000941

scr_seq_00000146_00000A32:
	.byte 0x02, 0x00
scr_seq_00000146_00000A34:
	msgbox 31
	waitbutton
	closemsg
	goto scr_seq_00000146_00000941

scr_seq_00000146_00000A41:
	.byte 0x02, 0x00
scr_seq_00000146_00000A43:
	scrcmd_141 32780, 250
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	msgbox 30
	closemsg
	scrcmd_182 32772
	goto scr_seq_00000146_00000941

scr_seq_00000146_00000A63:
	.byte 0x02, 0x00
scr_seq_00000146_00000A65:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	msgbox 30
	closemsg
	scrcmd_099 255
	scrcmd_182 32768
	scrcmd_098 255
	releaseall
	end

scr_seq_00000146_00000A83:
	end

scr_seq_00000146_00000A85:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_141 32780, 29
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_00000146_00000AC2
	msgbox 32
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_00000AD1
	closemsg
	goto scr_seq_00000146_0000093D

scr_seq_00000146_00000AC0:
	.byte 0x02, 0x00
scr_seq_00000146_00000AC2:
	msgbox 34
	waitbutton
	closemsg
	goto scr_seq_00000146_0000093D

scr_seq_00000146_00000ACF:
	.byte 0x02
	.byte 0x00
scr_seq_00000146_00000AD1:
	scrcmd_141 32780, 29
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_727 32773
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	msgbox 33
	closemsg
	get_trcard_stars VAR_SPECIAL_x800C
	scrcmd_730 32774
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000146_00000B10
	scrcmd_183 32772
	scrcmd_560 4, 32773
	goto scr_seq_00000146_00000BAE

scr_seq_00000146_00000B10:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_00000B2D
	scrcmd_183 32772
	scrcmd_560 4, 32773
	goto scr_seq_00000146_00000BAE

scr_seq_00000146_00000B2D:
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	gotoif eq, scr_seq_00000146_00000B4A
	scrcmd_183 32772
	scrcmd_560 4, 32773
	goto scr_seq_00000146_00000BAE

scr_seq_00000146_00000B4A:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_00000146_00000B67
	scrcmd_183 32772
	scrcmd_560 4, 32773
	goto scr_seq_00000146_00000BAE

scr_seq_00000146_00000B67:
	scrcmd_829 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_00000BA0
	scrcmd_598 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_00000146_00000CC5
	scrcmd_076 16384, 0
	scrcmd_077
	scrcmd_560 5, 32773
	goto scr_seq_00000146_00000BAE

scr_seq_00000146_00000BA0:
	scrcmd_600
	scrcmd_606
	scrcmd_183 32772
	scrcmd_560 4, 32773
scr_seq_00000146_00000BAE:
	wait 7, VAR_SPECIAL_x800C
scr_seq_00000146_00000BB4:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_00000146_00000BB4
	releaseall
	scrcmd_754 32780
	end

scr_seq_00000146_00000BCF:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	msgbox 33
	closemsg
	scrcmd_727 32772
	get_trcard_stars VAR_SPECIAL_x800C
	scrcmd_730 32774
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000146_00000C06
	scrcmd_183 32768
	scrcmd_560 4, 32773
	goto scr_seq_00000146_00000CA4

scr_seq_00000146_00000C06:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_00000C23
	scrcmd_183 32768
	scrcmd_560 4, 32773
	goto scr_seq_00000146_00000CA4

scr_seq_00000146_00000C23:
	comparevartovar VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	gotoif eq, scr_seq_00000146_00000C40
	scrcmd_183 32768
	scrcmd_560 4, 32773
	goto scr_seq_00000146_00000CA4

scr_seq_00000146_00000C40:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_00000146_00000C5D
	scrcmd_183 32772
	scrcmd_560 4, 32773
	goto scr_seq_00000146_00000CA4

scr_seq_00000146_00000C5D:
	scrcmd_829 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_00000C96
	scrcmd_598 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call scr_seq_00000146_00000CC5
	scrcmd_076 16384, 0
	scrcmd_077
	scrcmd_560 5, 32773
	goto scr_seq_00000146_00000CA4

scr_seq_00000146_00000C96:
	scrcmd_600
	scrcmd_606
	scrcmd_183 32772
	scrcmd_560 4, 32773
scr_seq_00000146_00000CA4:
	wait 7, VAR_SPECIAL_x800C
scr_seq_00000146_00000CAA:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_00000146_00000CAA
	releaseall
	scrcmd_754 32780
	end

scr_seq_00000146_00000CC5:
	scrcmd_732 20
	scrcmd_733 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000146_00000CE6
	scrcmd_734 2
	scrcmd_732 1
	goto scr_seq_00000146_00000CE9

scr_seq_00000146_00000CE6:
	scrcmd_734 1
scr_seq_00000146_00000CE9:
	return

scr_seq_00000146_00000CEB:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_00000D2A
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8006
	setvar VAR_SPECIAL_x8005, 1
	scrcmd_843 1, 32772
	scrcmd_851 1
	msgbox 6
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000146_00000D2C
	callstd 2008
	closemsg
scr_seq_00000146_00000D2A:
	end

scr_seq_00000146_00000D2C:
	callstd 2009
	closemsg
	end
	.balign 4, 0
