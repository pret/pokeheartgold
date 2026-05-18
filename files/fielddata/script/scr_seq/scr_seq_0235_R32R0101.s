#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R32R0101.h"
#include "msgdata/msg/msg_0382_R32R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R32R0101_000
	ScrDef scr_seq_R32R0101_001
	ScrDef scr_seq_R32R0101_002
	ScrDef scr_seq_R32R0101_003
	ScrDefEnd

scr_seq_R32R0101_000:
	End

scr_seq_R32R0101_001:
	SimpleNPCMsg msg_0382_R32R0101_00000
	End

scr_seq_R32R0101_002:
	SimpleNPCMsg msg_0382_R32R0101_00002
	End

scr_seq_R32R0101_003:
	SimpleNPCMsg msg_0382_R32R0101_00001
	End
	.balign 4, 0
