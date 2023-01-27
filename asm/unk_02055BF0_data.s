	.include "asm/macros.inc"
	.include "unk_02055BF0_data.inc"
	.include "global.inc"

	.rodata

.public sMapEnterRoutines
.public sMapExitRoutines
.public _020FC76C;

.public sub_02056530
.public sub_020565FC
.public sub_02056680
.public sub_020566F8
.public sub_020567B4
.public sub_02056004
.public sub_02056040
.public sub_020560C4
.public sub_0205613C
.public sub_02056424
.public sub_02056268
.public sub_02056220
.public sub_020562B0

sMapEnterRoutines:
	.word sub_02056530
	.word sub_020565FC
	.word sub_02056680
	.word sub_020566F8
	.word sub_020565FC
	.word sub_020567B4
	.word sub_020565FC
	.word sub_0205681C
	.word sub_02056938
sMapExitRoutines:
	.word sub_02056004
	.word sub_02056040
	.word sub_020560C4
	.word sub_0205613C
	.word sub_02056220
	.word sub_02056268
	.word sub_02056004
	.word sub_020562B0
	.word sub_02056424
_020FC76C:
	.word 0
	.word 0
	.word sub_02056A54
	.word sub_02056AEC
	.word 0
	.word 0
	.word 0
	.word sub_02056BC8
	.word sub_02056C64

	.text
