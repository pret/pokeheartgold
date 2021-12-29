#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0141_0402 ; 000
	scrdef scr_seq_0141_0416 ; 001
	scrdef scr_seq_0141_042A ; 002
	scrdef scr_seq_0141_043E ; 003
	scrdef scr_seq_0141_0452 ; 004
	scrdef scr_seq_0141_0466 ; 005
	scrdef scr_seq_0141_047A ; 006
	scrdef scr_seq_0141_048E ; 007
	scrdef scr_seq_0141_04A2 ; 008
	scrdef scr_seq_0141_04B6 ; 009
	scrdef scr_seq_0141_04CA ; 010
	scrdef scr_seq_0141_04DE ; 011
	scrdef scr_seq_0141_04F2 ; 012
	scrdef scr_seq_0141_0506 ; 013
	scrdef scr_seq_0141_051A ; 014
	scrdef scr_seq_0141_052E ; 015
	scrdef scr_seq_0141_0542 ; 016
	scrdef scr_seq_0141_0556 ; 017
	scrdef scr_seq_0141_056A ; 018
	scrdef scr_seq_0141_057E ; 019
	scrdef scr_seq_0141_0592 ; 020
	scrdef scr_seq_0141_05A6 ; 021
	scrdef scr_seq_0141_05BA ; 022
	scrdef scr_seq_0141_05CE ; 023
	scrdef scr_seq_0141_05E2 ; 024
	scrdef scr_seq_0141_05F6 ; 025
	scrdef scr_seq_0141_060A ; 026
	scrdef scr_seq_0141_061E ; 027
	scrdef scr_seq_0141_0632 ; 028
	scrdef scr_seq_0141_0646 ; 029
	scrdef scr_seq_0141_065A ; 030
	scrdef scr_seq_0141_066E ; 031
	scrdef scr_seq_0141_0682 ; 032
	scrdef scr_seq_0141_0696 ; 033
	scrdef scr_seq_0141_06AA ; 034
	scrdef scr_seq_0141_06BE ; 035
	scrdef scr_seq_0141_06D2 ; 036
	scrdef scr_seq_0141_06E6 ; 037
	scrdef scr_seq_0141_06FA ; 038
	scrdef scr_seq_0141_070E ; 039
	scrdef scr_seq_0141_0722 ; 040
	scrdef scr_seq_0141_0736 ; 041
	scrdef scr_seq_0141_074A ; 042
	scrdef scr_seq_0141_075E ; 043
	scrdef scr_seq_0141_0772 ; 044
	scrdef scr_seq_0141_0786 ; 045
	scrdef scr_seq_0141_079A ; 046
	scrdef scr_seq_0141_07AE ; 047
	scrdef scr_seq_0141_07C2 ; 048
	scrdef scr_seq_0141_07D6 ; 049
	scrdef scr_seq_0141_07EA ; 050
	scrdef scr_seq_0141_07FE ; 051
	scrdef scr_seq_0141_0812 ; 052
	scrdef scr_seq_0141_0826 ; 053
	scrdef scr_seq_0141_083A ; 054
	scrdef scr_seq_0141_084E ; 055
	scrdef scr_seq_0141_0862 ; 056
	scrdef scr_seq_0141_0876 ; 057
	scrdef scr_seq_0141_088A ; 058
	scrdef scr_seq_0141_089E ; 059
	scrdef scr_seq_0141_08B2 ; 060
	scrdef scr_seq_0141_08C6 ; 061
	scrdef scr_seq_0141_08DA ; 062
	scrdef scr_seq_0141_08EE ; 063
	scrdef scr_seq_0141_0902 ; 064
	scrdef scr_seq_0141_0916 ; 065
	scrdef scr_seq_0141_092A ; 066
	scrdef scr_seq_0141_093E ; 067
	scrdef scr_seq_0141_0952 ; 068
	scrdef scr_seq_0141_0966 ; 069
	scrdef scr_seq_0141_097A ; 070
	scrdef scr_seq_0141_098E ; 071
	scrdef scr_seq_0141_09A2 ; 072
	scrdef scr_seq_0141_09B6 ; 073
	scrdef scr_seq_0141_09CA ; 074
	scrdef scr_seq_0141_09DE ; 075
	scrdef scr_seq_0141_09F2 ; 076
	scrdef scr_seq_0141_0A06 ; 077
	scrdef scr_seq_0141_0A1A ; 078
	scrdef scr_seq_0141_0A2E ; 079
	scrdef scr_seq_0141_0A42 ; 080
	scrdef scr_seq_0141_0A56 ; 081
	scrdef scr_seq_0141_0A6A ; 082
	scrdef scr_seq_0141_0A7E ; 083
	scrdef scr_seq_0141_0A92 ; 084
	scrdef scr_seq_0141_0AA6 ; 085
	scrdef scr_seq_0141_0ABA ; 086
	scrdef scr_seq_0141_0ACE ; 087
	scrdef scr_seq_0141_0AE2 ; 088
	scrdef scr_seq_0141_0AF6 ; 089
	scrdef scr_seq_0141_0B0A ; 090
	scrdef scr_seq_0141_0B1E ; 091
	scrdef scr_seq_0141_0B32 ; 092
	scrdef scr_seq_0141_0B46 ; 093
	scrdef scr_seq_0141_0B5A ; 094
	scrdef scr_seq_0141_0B6E ; 095
	scrdef scr_seq_0141_0B82 ; 096
	scrdef scr_seq_0141_0B96 ; 097
	scrdef scr_seq_0141_0BAA ; 098
	scrdef scr_seq_0141_0BBE ; 099
	scrdef scr_seq_0141_0BD2 ; 100
	scrdef scr_seq_0141_0BE6 ; 101
	scrdef scr_seq_0141_0BFA ; 102
	scrdef scr_seq_0141_0C0E ; 103
	scrdef scr_seq_0141_0C22 ; 104
	scrdef scr_seq_0141_0C36 ; 105
	scrdef scr_seq_0141_0C4A ; 106
	scrdef scr_seq_0141_0C5E ; 107
	scrdef scr_seq_0141_0C72 ; 108
	scrdef scr_seq_0141_0C86 ; 109
	scrdef scr_seq_0141_0C9A ; 110
	scrdef scr_seq_0141_0CAE ; 111
	scrdef scr_seq_0141_0CC2 ; 112
	scrdef scr_seq_0141_0CD6 ; 113
	scrdef scr_seq_0141_0CEA ; 114
	scrdef scr_seq_0141_0CFE ; 115
	scrdef scr_seq_0141_0D12 ; 116
	scrdef scr_seq_0141_0D26 ; 117
	scrdef scr_seq_0141_0D3A ; 118
	scrdef scr_seq_0141_0D4E ; 119
	scrdef scr_seq_0141_0D62 ; 120
	scrdef scr_seq_0141_0D76 ; 121
	scrdef scr_seq_0141_0D8A ; 122
	scrdef scr_seq_0141_0D9E ; 123
	scrdef scr_seq_0141_0DB2 ; 124
	scrdef scr_seq_0141_0DC6 ; 125
	scrdef scr_seq_0141_0DDA ; 126
	scrdef scr_seq_0141_0DEE ; 127
	scrdef scr_seq_0141_0E02 ; 128
	scrdef scr_seq_0141_0E16 ; 129
	scrdef scr_seq_0141_0E2A ; 130
	scrdef scr_seq_0141_0E3E ; 131
	scrdef scr_seq_0141_0E52 ; 132
	scrdef scr_seq_0141_0E66 ; 133
	scrdef scr_seq_0141_0E7A ; 134
	scrdef scr_seq_0141_0E8E ; 135
	scrdef scr_seq_0141_0EA2 ; 136
	scrdef scr_seq_0141_0EB6 ; 137
	scrdef scr_seq_0141_0ECA ; 138
	scrdef scr_seq_0141_0EDE ; 139
	scrdef scr_seq_0141_0EF2 ; 140
	scrdef scr_seq_0141_0F06 ; 141
	scrdef scr_seq_0141_0F1A ; 142
	scrdef scr_seq_0141_0F2E ; 143
	scrdef scr_seq_0141_0F42 ; 144
	scrdef scr_seq_0141_0F56 ; 145
	scrdef scr_seq_0141_0F6A ; 146
	scrdef scr_seq_0141_0F7E ; 147
	scrdef scr_seq_0141_0F92 ; 148
	scrdef scr_seq_0141_0FA6 ; 149
	scrdef scr_seq_0141_0FBA ; 150
	scrdef scr_seq_0141_0FCE ; 151
	scrdef scr_seq_0141_0FE2 ; 152
	scrdef scr_seq_0141_0FF6 ; 153
	scrdef scr_seq_0141_100A ; 154
	scrdef scr_seq_0141_101E ; 155
	scrdef scr_seq_0141_1032 ; 156
	scrdef scr_seq_0141_1046 ; 157
	scrdef scr_seq_0141_105A ; 158
	scrdef scr_seq_0141_106E ; 159
	scrdef scr_seq_0141_1082 ; 160
	scrdef scr_seq_0141_1096 ; 161
	scrdef scr_seq_0141_10AA ; 162
	scrdef scr_seq_0141_10BE ; 163
	scrdef scr_seq_0141_10D2 ; 164
	scrdef scr_seq_0141_10E6 ; 165
	scrdef scr_seq_0141_10FA ; 166
	scrdef scr_seq_0141_110E ; 167
	scrdef scr_seq_0141_1122 ; 168
	scrdef scr_seq_0141_1136 ; 169
	scrdef scr_seq_0141_114A ; 170
	scrdef scr_seq_0141_115E ; 171
	scrdef scr_seq_0141_1172 ; 172
	scrdef scr_seq_0141_1186 ; 173
	scrdef scr_seq_0141_119A ; 174
	scrdef scr_seq_0141_11AE ; 175
	scrdef scr_seq_0141_11C2 ; 176
	scrdef scr_seq_0141_11D6 ; 177
	scrdef scr_seq_0141_11EA ; 178
	scrdef scr_seq_0141_11FE ; 179
	scrdef scr_seq_0141_1212 ; 180
	scrdef scr_seq_0141_1226 ; 181
	scrdef scr_seq_0141_123A ; 182
	scrdef scr_seq_0141_124E ; 183
	scrdef scr_seq_0141_1262 ; 184
	scrdef scr_seq_0141_1276 ; 185
	scrdef scr_seq_0141_128A ; 186
	scrdef scr_seq_0141_129E ; 187
	scrdef scr_seq_0141_12B2 ; 188
	scrdef scr_seq_0141_12C6 ; 189
	scrdef scr_seq_0141_12DA ; 190
	scrdef scr_seq_0141_12EE ; 191
	scrdef scr_seq_0141_1302 ; 192
	scrdef scr_seq_0141_1316 ; 193
	scrdef scr_seq_0141_132A ; 194
	scrdef scr_seq_0141_133E ; 195
	scrdef scr_seq_0141_1352 ; 196
	scrdef scr_seq_0141_1366 ; 197
	scrdef scr_seq_0141_137A ; 198
	scrdef scr_seq_0141_138E ; 199
	scrdef scr_seq_0141_13A2 ; 200
	scrdef scr_seq_0141_13B6 ; 201
	scrdef scr_seq_0141_13CA ; 202
	scrdef scr_seq_0141_13DE ; 203
	scrdef scr_seq_0141_13F2 ; 204
	scrdef scr_seq_0141_1406 ; 205
	scrdef scr_seq_0141_141A ; 206
	scrdef scr_seq_0141_142E ; 207
	scrdef scr_seq_0141_1442 ; 208
	scrdef scr_seq_0141_1456 ; 209
	scrdef scr_seq_0141_146A ; 210
	scrdef scr_seq_0141_147E ; 211
	scrdef scr_seq_0141_1492 ; 212
	scrdef scr_seq_0141_14A6 ; 213
	scrdef scr_seq_0141_14BA ; 214
	scrdef scr_seq_0141_14CE ; 215
	scrdef scr_seq_0141_14E2 ; 216
	scrdef scr_seq_0141_14F6 ; 217
	scrdef scr_seq_0141_150A ; 218
	scrdef scr_seq_0141_151E ; 219
	scrdef scr_seq_0141_1532 ; 220
	scrdef scr_seq_0141_1546 ; 221
	scrdef scr_seq_0141_155A ; 222
	scrdef scr_seq_0141_156E ; 223
	scrdef scr_seq_0141_1582 ; 224
	scrdef scr_seq_0141_1596 ; 225
	scrdef scr_seq_0141_15AA ; 226
	scrdef scr_seq_0141_15BE ; 227
	scrdef scr_seq_0141_15D2 ; 228
	scrdef scr_seq_0141_15E6 ; 229
	scrdef scr_seq_0141_15FA ; 230
	scrdef scr_seq_0141_160E ; 231
	scrdef scr_seq_0141_1622 ; 232
	scrdef scr_seq_0141_1636 ; 233
	scrdef scr_seq_0141_164A ; 234
	scrdef scr_seq_0141_165E ; 235
	scrdef scr_seq_0141_1672 ; 236
	scrdef scr_seq_0141_1686 ; 237
	scrdef scr_seq_0141_169A ; 238
	scrdef scr_seq_0141_16AE ; 239
	scrdef scr_seq_0141_16C2 ; 240
	scrdef scr_seq_0141_16D6 ; 241
	scrdef scr_seq_0141_16EA ; 242
	scrdef scr_seq_0141_16FE ; 243
	scrdef scr_seq_0141_1712 ; 244
	scrdef scr_seq_0141_1726 ; 245
	scrdef scr_seq_0141_173A ; 246
	scrdef scr_seq_0141_174E ; 247
	scrdef scr_seq_0141_1762 ; 248
	scrdef scr_seq_0141_1776 ; 249
	scrdef scr_seq_0141_178A ; 250
	scrdef scr_seq_0141_179E ; 251
	scrdef scr_seq_0141_17B2 ; 252
	scrdef scr_seq_0141_17C6 ; 253
	scrdef scr_seq_0141_17DA ; 254
	scrdef scr_seq_0141_17EE ; 255
	scrdef_end

scr_seq_0141_0402:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0414:
	.byte 0x02, 0x00
scr_seq_0141_0416:
	setvar VAR_SPECIAL_x8008, 18
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0428:
	.byte 0x02, 0x00
scr_seq_0141_042A:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_043C:
	.byte 0x02, 0x00
scr_seq_0141_043E:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0450:
	.byte 0x02, 0x00
scr_seq_0141_0452:
	setvar VAR_SPECIAL_x8008, 4
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0464:
	.byte 0x02, 0x00
scr_seq_0141_0466:
	setvar VAR_SPECIAL_x8008, 50
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0478:
	.byte 0x02, 0x00
scr_seq_0141_047A:
	setvar VAR_SPECIAL_x8008, 51
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_048C:
	.byte 0x02, 0x00
scr_seq_0141_048E:
	setvar VAR_SPECIAL_x8008, 22
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_04A0:
	.byte 0x02, 0x00
scr_seq_0141_04A2:
	setvar VAR_SPECIAL_x8008, 60
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_04B4:
	.byte 0x02, 0x00
scr_seq_0141_04B6:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_04C8:
	.byte 0x02, 0x00
scr_seq_0141_04CA:
	setvar VAR_SPECIAL_x8008, 78
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_04DC:
	.byte 0x02, 0x00
scr_seq_0141_04DE:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_04F0:
	.byte 0x02, 0x00
scr_seq_0141_04F2:
	setvar VAR_SPECIAL_x8008, 25
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0504:
	.byte 0x02, 0x00
scr_seq_0141_0506:
	setvar VAR_SPECIAL_x8008, 36
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0518:
	.byte 0x02, 0x00
scr_seq_0141_051A:
	setvar VAR_SPECIAL_x8008, 34
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_052C:
	.byte 0x02, 0x00
scr_seq_0141_052E:
	setvar VAR_SPECIAL_x8008, 155
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0540:
	.byte 0x02, 0x00
scr_seq_0141_0542:
	setvar VAR_SPECIAL_x8008, 151
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0554:
	.byte 0x02, 0x00
scr_seq_0141_0556:
	setvar VAR_SPECIAL_x8008, 36
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0568:
	.byte 0x02, 0x00
scr_seq_0141_056A:
	setvar VAR_SPECIAL_x8008, 35
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_057C:
	.byte 0x02, 0x00
scr_seq_0141_057E:
	setvar VAR_SPECIAL_x8008, 158
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0590:
	.byte 0x02, 0x00
scr_seq_0141_0592:
	setvar VAR_SPECIAL_x8008, 81
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_05A4:
	.byte 0x02, 0x00
scr_seq_0141_05A6:
	setvar VAR_SPECIAL_x8008, 90
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_05B8:
	.byte 0x02, 0x00
scr_seq_0141_05BA:
	setvar VAR_SPECIAL_x8008, 91
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_05CC:
	.byte 0x02, 0x00
scr_seq_0141_05CE:
	setvar VAR_SPECIAL_x8008, 154
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_05E0:
	.byte 0x02, 0x00
scr_seq_0141_05E2:
	setvar VAR_SPECIAL_x8008, 243
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_05F4:
	.byte 0x02, 0x00
scr_seq_0141_05F6:
	setvar VAR_SPECIAL_x8008, 37
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0608:
	.byte 0x02, 0x00
scr_seq_0141_060A:
	setvar VAR_SPECIAL_x8008, 249
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_061C:
	.byte 0x02, 0x00
scr_seq_0141_061E:
	setvar VAR_SPECIAL_x8008, 270
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0630:
	.byte 0x02, 0x00
scr_seq_0141_0632:
	setvar VAR_SPECIAL_x8008, 154
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0644:
	.byte 0x02, 0x00
scr_seq_0141_0646:
	setvar VAR_SPECIAL_x8008, 79
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0658:
	.byte 0x02, 0x00
scr_seq_0141_065A:
	setvar VAR_SPECIAL_x8008, 3
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_066C:
	.byte 0x02, 0x00
scr_seq_0141_066E:
	setvar VAR_SPECIAL_x8008, 336
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0680:
	.byte 0x02, 0x00
scr_seq_0141_0682:
	setvar VAR_SPECIAL_x8008, 253
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0694:
	.byte 0x02, 0x00
scr_seq_0141_0696:
	setvar VAR_SPECIAL_x8008, 57
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_06A8:
	.byte 0x02, 0x00
scr_seq_0141_06AA:
	setvar VAR_SPECIAL_x8008, 3
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_06BC:
	.byte 0x02, 0x00
scr_seq_0141_06BE:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_06D0:
	.byte 0x02, 0x00
scr_seq_0141_06D2:
	setvar VAR_SPECIAL_x8008, 21
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_06E4:
	.byte 0x02, 0x00
scr_seq_0141_06E6:
	setvar VAR_SPECIAL_x8008, 58
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_06F8:
	.byte 0x02, 0x00
scr_seq_0141_06FA:
	setvar VAR_SPECIAL_x8008, 366
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_070C:
	.byte 0x02, 0x00
scr_seq_0141_070E:
	setvar VAR_SPECIAL_x8008, 40
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0720:
	.byte 0x02, 0x00
scr_seq_0141_0722:
	setvar VAR_SPECIAL_x8008, 25
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0734:
	.byte 0x02, 0x00
scr_seq_0141_0736:
	setvar VAR_SPECIAL_x8008, 26
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0748:
	.byte 0x02, 0x00
scr_seq_0141_074A:
	setvar VAR_SPECIAL_x8008, 345
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_075C:
	.byte 0x02, 0x00
scr_seq_0141_075E:
	setvar VAR_SPECIAL_x8008, 28
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0770:
	.byte 0x02, 0x00
scr_seq_0141_0772:
	setvar VAR_SPECIAL_x8008, 57
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0784:
	.byte 0x02, 0x00
scr_seq_0141_0786:
	setvar VAR_SPECIAL_x8008, 18
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0798:
	.byte 0x02, 0x00
scr_seq_0141_079A:
	setvar VAR_SPECIAL_x8008, 38
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_07AC:
	.byte 0x02, 0x00
scr_seq_0141_07AE:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_07C0:
	.byte 0x02, 0x00
scr_seq_0141_07C2:
	setvar VAR_SPECIAL_x8008, 390
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_07D4:
	.byte 0x02, 0x00
scr_seq_0141_07D6:
	setvar VAR_SPECIAL_x8008, 409
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_07E8:
	.byte 0x02, 0x00
scr_seq_0141_07EA:
	setvar VAR_SPECIAL_x8008, 39
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_07FC:
	.byte 0x02, 0x00
scr_seq_0141_07FE:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0810:
	.byte 0x02, 0x00
scr_seq_0141_0812:
	setvar VAR_SPECIAL_x8008, 19
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0824:
	.byte 0x02, 0x00
scr_seq_0141_0826:
	setvar VAR_SPECIAL_x8008, 223
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0838:
	.byte 0x02, 0x00
scr_seq_0141_083A:
	setvar VAR_SPECIAL_x8008, 38
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_084C:
	.byte 0x02, 0x00
scr_seq_0141_084E:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0860:
	.byte 0x02, 0x00
scr_seq_0141_0862:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0874:
	.byte 0x02, 0x00
scr_seq_0141_0876:
	setvar VAR_SPECIAL_x8008, 228
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0888:
	.byte 0x02, 0x00
scr_seq_0141_088A:
	setvar VAR_SPECIAL_x8008, 444
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_089C:
	.byte 0x02, 0x00
scr_seq_0141_089E:
	setvar VAR_SPECIAL_x8008, 405
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_08B0:
	.byte 0x02, 0x00
scr_seq_0141_08B2:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_08C4:
	.byte 0x02, 0x00
scr_seq_0141_08C6:
	setvar VAR_SPECIAL_x8008, 393
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_08D8:
	.byte 0x02, 0x00
scr_seq_0141_08DA:
	setvar VAR_SPECIAL_x8008, 22
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_08EC:
	.byte 0x02, 0x00
scr_seq_0141_08EE:
	setvar VAR_SPECIAL_x8008, 218
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0900:
	.byte 0x02, 0x00
scr_seq_0141_0902:
	setvar VAR_SPECIAL_x8008, 355
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0914:
	.byte 0x02, 0x00
scr_seq_0141_0916:
	setvar VAR_SPECIAL_x8008, 107
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0928:
	.byte 0x02, 0x00
scr_seq_0141_092A:
	setvar VAR_SPECIAL_x8008, 25
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_093C:
	.byte 0x02, 0x00
scr_seq_0141_093E:
	setvar VAR_SPECIAL_x8008, 18
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0950:
	.byte 0x02, 0x00
scr_seq_0141_0952:
	setvar VAR_SPECIAL_x8008, 45
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0964:
	.byte 0x02, 0x00
scr_seq_0141_0966:
	setvar VAR_SPECIAL_x8008, 339
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0978:
	.byte 0x02, 0x00
scr_seq_0141_097A:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_098C:
	.byte 0x02, 0x00
scr_seq_0141_098E:
	setvar VAR_SPECIAL_x8008, 78
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_09A0:
	.byte 0x02, 0x00
scr_seq_0141_09A2:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_09B4:
	.byte 0x02, 0x00
scr_seq_0141_09B6:
	setvar VAR_SPECIAL_x8008, 51
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_09C8:
	.byte 0x02, 0x00
scr_seq_0141_09CA:
	setvar VAR_SPECIAL_x8008, 50
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_09DC:
	.byte 0x02, 0x00
scr_seq_0141_09DE:
	setvar VAR_SPECIAL_x8008, 24
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_09F0:
	.byte 0x02, 0x00
scr_seq_0141_09F2:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0A04:
	.byte 0x02, 0x00
scr_seq_0141_0A06:
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0A18:
	.byte 0x02, 0x00
scr_seq_0141_0A1A:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0A2C:
	.byte 0x02, 0x00
scr_seq_0141_0A2E:
	setvar VAR_SPECIAL_x8008, 41
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0A40:
	.byte 0x02, 0x00
scr_seq_0141_0A42:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0A54:
	.byte 0x02, 0x00
scr_seq_0141_0A56:
	setvar VAR_SPECIAL_x8008, 45
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0A68:
	.byte 0x02, 0x00
scr_seq_0141_0A6A:
	setvar VAR_SPECIAL_x8008, 24
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0A7C:
	.byte 0x02, 0x00
scr_seq_0141_0A7E:
	setvar VAR_SPECIAL_x8008, 255
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0A90:
	.byte 0x02, 0x00
scr_seq_0141_0A92:
	setvar VAR_SPECIAL_x8008, 387
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0AA4:
	.byte 0x02, 0x00
scr_seq_0141_0AA6:
	setvar VAR_SPECIAL_x8008, 384
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0AB8:
	.byte 0x02, 0x00
scr_seq_0141_0ABA:
	setvar VAR_SPECIAL_x8008, 50
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0ACC:
	.byte 0x02, 0x00
scr_seq_0141_0ACE:
	setvar VAR_SPECIAL_x8008, 38
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0AE0:
	.byte 0x02, 0x00
scr_seq_0141_0AE2:
	setvar VAR_SPECIAL_x8008, 414
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0AF4:
	.byte 0x02, 0x00
scr_seq_0141_0AF6:
	setvar VAR_SPECIAL_x8008, 76
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0B08:
	.byte 0x02, 0x00
scr_seq_0141_0B0A:
	setvar VAR_SPECIAL_x8008, 26
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0B1C:
	.byte 0x02, 0x00
scr_seq_0141_0B1E:
	setvar VAR_SPECIAL_x8008, 415
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0B30:
	.byte 0x02, 0x00
scr_seq_0141_0B32:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0B44:
	.byte 0x02, 0x00
scr_seq_0141_0B46:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0B58:
	.byte 0x02, 0x00
scr_seq_0141_0B5A:
	setvar VAR_SPECIAL_x8008, 78
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0B6C:
	.byte 0x02, 0x00
scr_seq_0141_0B6E:
	setvar VAR_SPECIAL_x8008, 48
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0B80:
	.byte 0x02, 0x00
scr_seq_0141_0B82:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0B94:
	.byte 0x02, 0x00
scr_seq_0141_0B96:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0BA8:
	.byte 0x02, 0x00
scr_seq_0141_0BAA:
	setvar VAR_SPECIAL_x8008, 49
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0BBC:
	.byte 0x02, 0x00
scr_seq_0141_0BBE:
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0BD0:
	.byte 0x02, 0x00
scr_seq_0141_0BD2:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0BE4:
	.byte 0x02, 0x00
scr_seq_0141_0BE6:
	setvar VAR_SPECIAL_x8008, 41
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0BF8:
	.byte 0x02, 0x00
scr_seq_0141_0BFA:
	setvar VAR_SPECIAL_x8008, 50
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0C0C:
	.byte 0x02, 0x00
scr_seq_0141_0C0E:
	setvar VAR_SPECIAL_x8008, 28
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0C20:
	.byte 0x02, 0x00
scr_seq_0141_0C22:
	setvar VAR_SPECIAL_x8008, 279
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0C34:
	.byte 0x02, 0x00
scr_seq_0141_0C36:
	setvar VAR_SPECIAL_x8008, 317
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0C48:
	.byte 0x02, 0x00
scr_seq_0141_0C4A:
	setvar VAR_SPECIAL_x8008, 69
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0C5C:
	.byte 0x02, 0x00
scr_seq_0141_0C5E:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0C70:
	.byte 0x02, 0x00
scr_seq_0141_0C72:
	setvar VAR_SPECIAL_x8008, 26
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0C84:
	.byte 0x02, 0x00
scr_seq_0141_0C86:
	setvar VAR_SPECIAL_x8008, 324
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0C98:
	.byte 0x02, 0x00
scr_seq_0141_0C9A:
	setvar VAR_SPECIAL_x8008, 392
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0CAC:
	.byte 0x02, 0x00
scr_seq_0141_0CAE:
	setvar VAR_SPECIAL_x8008, 38
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0CC0:
	.byte 0x02, 0x00
scr_seq_0141_0CC2:
	setvar VAR_SPECIAL_x8008, 28
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0CD4:
	.byte 0x02, 0x00
scr_seq_0141_0CD6:
	setvar VAR_SPECIAL_x8008, 78
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0CE8:
	.byte 0x02, 0x00
scr_seq_0141_0CEA:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0CFC:
	.byte 0x02, 0x00
scr_seq_0141_0CFE:
	setvar VAR_SPECIAL_x8008, 278
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0D10:
	.byte 0x02, 0x00
scr_seq_0141_0D12:
	setvar VAR_SPECIAL_x8008, 24
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0D24:
	.byte 0x02, 0x00
scr_seq_0141_0D26:
	setvar VAR_SPECIAL_x8008, 47
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0D38:
	.byte 0x02, 0x00
scr_seq_0141_0D3A:
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0D4C:
	.byte 0x02, 0x00
scr_seq_0141_0D4E:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0D60:
	.byte 0x02, 0x00
scr_seq_0141_0D62:
	setvar VAR_SPECIAL_x8008, 316
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0D74:
	.byte 0x02, 0x00
scr_seq_0141_0D76:
	setvar VAR_SPECIAL_x8008, 321
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0D88:
	.byte 0x02, 0x00
scr_seq_0141_0D8A:
	setvar VAR_SPECIAL_x8008, 50
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0D9C:
	.byte 0x02, 0x00
scr_seq_0141_0D9E:
	setvar VAR_SPECIAL_x8008, 24
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0DB0:
	.byte 0x02, 0x00
scr_seq_0141_0DB2:
	setvar VAR_SPECIAL_x8008, 367
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0DC4:
	.byte 0x02, 0x00
scr_seq_0141_0DC6:
	setvar VAR_SPECIAL_x8008, 40
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0DD8:
	.byte 0x02, 0x00
scr_seq_0141_0DDA:
	setvar VAR_SPECIAL_x8008, 235
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0DEC:
	.byte 0x02, 0x00
scr_seq_0141_0DEE:
	setvar VAR_SPECIAL_x8008, 78
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0E00:
	.byte 0x02, 0x00
scr_seq_0141_0E02:
	setvar VAR_SPECIAL_x8008, 48
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0E14:
	.byte 0x02, 0x00
scr_seq_0141_0E16:
	setvar VAR_SPECIAL_x8008, 51
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0E28:
	.byte 0x02, 0x00
scr_seq_0141_0E2A:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0E3C:
	.byte 0x02, 0x00
scr_seq_0141_0E3E:
	setvar VAR_SPECIAL_x8008, 39
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0E50:
	.byte 0x02, 0x00
scr_seq_0141_0E52:
	setvar VAR_SPECIAL_x8008, 25
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0E64:
	.byte 0x02, 0x00
scr_seq_0141_0E66:
	setvar VAR_SPECIAL_x8008, 25
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0E78:
	.byte 0x02, 0x00
scr_seq_0141_0E7A:
	setvar VAR_SPECIAL_x8008, 55
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0E8C:
	.byte 0x02, 0x00
scr_seq_0141_0E8E:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0EA0:
	.byte 0x02, 0x00
scr_seq_0141_0EA2:
	setvar VAR_SPECIAL_x8008, 373
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0EB4:
	.byte 0x02, 0x00
scr_seq_0141_0EB6:
	setvar VAR_SPECIAL_x8008, 376
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0EC8:
	.byte 0x02, 0x00
scr_seq_0141_0ECA:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0EDC:
	.byte 0x02, 0x00
scr_seq_0141_0EDE:
	setvar VAR_SPECIAL_x8008, 46
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0EF0:
	.byte 0x02, 0x00
scr_seq_0141_0EF2:
	setvar VAR_SPECIAL_x8008, 61
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0F04:
	.byte 0x02, 0x00
scr_seq_0141_0F06:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0F18:
	.byte 0x02, 0x00
scr_seq_0141_0F1A:
	setvar VAR_SPECIAL_x8008, 39
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0F2C:
	.byte 0x02, 0x00
scr_seq_0141_0F2E:
	setvar VAR_SPECIAL_x8008, 370
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0F40:
	.byte 0x02, 0x00
scr_seq_0141_0F42:
	setvar VAR_SPECIAL_x8008, 297
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0F54:
	.byte 0x02, 0x00
scr_seq_0141_0F56:
	setvar VAR_SPECIAL_x8008, 67
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0F68:
	.byte 0x02, 0x00
scr_seq_0141_0F6A:
	setvar VAR_SPECIAL_x8008, 77
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0F7C:
	.byte 0x02, 0x00
scr_seq_0141_0F7E:
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0F90:
	.byte 0x02, 0x00
scr_seq_0141_0F92:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0FA4:
	.byte 0x02, 0x00
scr_seq_0141_0FA6:
	setvar VAR_SPECIAL_x8008, 426
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0FB8:
	.byte 0x02, 0x00
scr_seq_0141_0FBA:
	setvar VAR_SPECIAL_x8008, 46
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0FCC:
	.byte 0x02, 0x00
scr_seq_0141_0FCE:
	setvar VAR_SPECIAL_x8008, 51
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0FE0:
	.byte 0x02, 0x00
scr_seq_0141_0FE2:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_0FF4:
	.byte 0x02, 0x00
scr_seq_0141_0FF6:
	setvar VAR_SPECIAL_x8008, 24
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1008:
	.byte 0x02, 0x00
scr_seq_0141_100A:
	setvar VAR_SPECIAL_x8008, 246
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_101C:
	.byte 0x02, 0x00
scr_seq_0141_101E:
	setvar VAR_SPECIAL_x8008, 399
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1030:
	.byte 0x02, 0x00
scr_seq_0141_1032:
	setvar VAR_SPECIAL_x8008, 47
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1044:
	.byte 0x02, 0x00
scr_seq_0141_1046:
	setvar VAR_SPECIAL_x8008, 49
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1058:
	.byte 0x02, 0x00
scr_seq_0141_105A:
	setvar VAR_SPECIAL_x8008, 41
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_106C:
	.byte 0x02, 0x00
scr_seq_0141_106E:
	setvar VAR_SPECIAL_x8008, 250
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1080:
	.byte 0x02, 0x00
scr_seq_0141_1082:
	setvar VAR_SPECIAL_x8008, 40
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1094:
	.byte 0x02, 0x00
scr_seq_0141_1096:
	setvar VAR_SPECIAL_x8008, 24
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_10A8:
	.byte 0x02, 0x00
scr_seq_0141_10AA:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_10BC:
	.byte 0x02, 0x00
scr_seq_0141_10BE:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_10D0:
	.byte 0x02, 0x00
scr_seq_0141_10D2:
	setvar VAR_SPECIAL_x8008, 28
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_10E4:
	.byte 0x02, 0x00
scr_seq_0141_10E6:
	setvar VAR_SPECIAL_x8008, 59
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_10F8:
	.byte 0x02, 0x00
scr_seq_0141_10FA:
	setvar VAR_SPECIAL_x8008, 381
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_110C:
	.byte 0x02, 0x00
scr_seq_0141_110E:
	setvar VAR_SPECIAL_x8008, 28
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1120:
	.byte 0x02, 0x00
scr_seq_0141_1122:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1134:
	.byte 0x02, 0x00
scr_seq_0141_1136:
	setvar VAR_SPECIAL_x8008, 25
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1148:
	.byte 0x02, 0x00
scr_seq_0141_114A:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_115C:
	.byte 0x02, 0x00
scr_seq_0141_115E:
	setvar VAR_SPECIAL_x8008, 56
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1170:
	.byte 0x02, 0x00
scr_seq_0141_1172:
	setvar VAR_SPECIAL_x8008, 68
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1184:
	.byte 0x02, 0x00
scr_seq_0141_1186:
	setvar VAR_SPECIAL_x8008, 81
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1198:
	.byte 0x02, 0x00
scr_seq_0141_119A:
	setvar VAR_SPECIAL_x8008, 50
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_11AC:
	.byte 0x02, 0x00
scr_seq_0141_11AE:
	setvar VAR_SPECIAL_x8008, 329
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_11C0:
	.byte 0x02, 0x00
scr_seq_0141_11C2:
	setvar VAR_SPECIAL_x8008, 280
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_11D4:
	.byte 0x02, 0x00
scr_seq_0141_11D6:
	setvar VAR_SPECIAL_x8008, 41
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_11E8:
	.byte 0x02, 0x00
scr_seq_0141_11EA:
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_11FC:
	.byte 0x02, 0x00
scr_seq_0141_11FE:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1210:
	.byte 0x02, 0x00
scr_seq_0141_1212:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1224:
	.byte 0x02, 0x00
scr_seq_0141_1226:
	setvar VAR_SPECIAL_x8008, 353
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1238:
	.byte 0x02, 0x00
scr_seq_0141_123A:
	setvar VAR_SPECIAL_x8008, 45
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_124C:
	.byte 0x02, 0x00
scr_seq_0141_124E:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1260:
	.byte 0x02, 0x00
scr_seq_0141_1262:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1274:
	.byte 0x02, 0x00
scr_seq_0141_1276:
	setvar VAR_SPECIAL_x8008, 406
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1288:
	.byte 0x02, 0x00
scr_seq_0141_128A:
	setvar VAR_SPECIAL_x8008, 50
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_129C:
	.byte 0x02, 0x00
scr_seq_0141_129E:
	setvar VAR_SPECIAL_x8008, 319
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_12B0:
	.byte 0x02, 0x00
scr_seq_0141_12B2:
	setvar VAR_SPECIAL_x8008, 288
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_12C4:
	.byte 0x02, 0x00
scr_seq_0141_12C6:
	setvar VAR_SPECIAL_x8008, 53
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_12D8:
	.byte 0x02, 0x00
scr_seq_0141_12DA:
	setvar VAR_SPECIAL_x8008, 315
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_12EC:
	.byte 0x02, 0x00
scr_seq_0141_12EE:
	setvar VAR_SPECIAL_x8008, 389
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1300:
	.byte 0x02, 0x00
scr_seq_0141_1302:
	setvar VAR_SPECIAL_x8008, 368
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1314:
	.byte 0x02, 0x00
scr_seq_0141_1316:
	setvar VAR_SPECIAL_x8008, 396
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1328:
	.byte 0x02, 0x00
scr_seq_0141_132A:
	setvar VAR_SPECIAL_x8008, 40
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_133C:
	.byte 0x02, 0x00
scr_seq_0141_133E:
	setvar VAR_SPECIAL_x8008, 383
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1350:
	.byte 0x02, 0x00
scr_seq_0141_1352:
	setvar VAR_SPECIAL_x8008, 47
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1364:
	.byte 0x02, 0x00
scr_seq_0141_1366:
	setvar VAR_SPECIAL_x8008, 51
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1378:
	.byte 0x02, 0x00
scr_seq_0141_137A:
	setvar VAR_SPECIAL_x8008, 28
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_138C:
	.byte 0x02, 0x00
scr_seq_0141_138E:
	setvar VAR_SPECIAL_x8008, 110
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_13A0:
	.byte 0x02, 0x00
scr_seq_0141_13A2:
	setvar VAR_SPECIAL_x8008, 418
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_13B4:
	.byte 0x02, 0x00
scr_seq_0141_13B6:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_13C8:
	.byte 0x02, 0x00
scr_seq_0141_13CA:
	setvar VAR_SPECIAL_x8008, 269
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_13DC:
	.byte 0x02, 0x00
scr_seq_0141_13DE:
	setvar VAR_SPECIAL_x8008, 24
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_13F0:
	.byte 0x02, 0x00
scr_seq_0141_13F2:
	setvar VAR_SPECIAL_x8008, 46
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1404:
	.byte 0x02, 0x00
scr_seq_0141_1406:
	setvar VAR_SPECIAL_x8008, 219
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1418:
	.byte 0x02, 0x00
scr_seq_0141_141A:
	setvar VAR_SPECIAL_x8008, 394
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_142C:
	.byte 0x02, 0x00
scr_seq_0141_142E:
	setvar VAR_SPECIAL_x8008, 49
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1440:
	.byte 0x02, 0x00
scr_seq_0141_1442:
	setvar VAR_SPECIAL_x8008, 66
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1454:
	.byte 0x02, 0x00
scr_seq_0141_1456:
	setvar VAR_SPECIAL_x8008, 51
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1468:
	.byte 0x02, 0x00
scr_seq_0141_146A:
	setvar VAR_SPECIAL_x8008, 318
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_147C:
	.byte 0x02, 0x00
scr_seq_0141_147E:
	setvar VAR_SPECIAL_x8008, 413
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1490:
	.byte 0x02, 0x00
scr_seq_0141_1492:
	setvar VAR_SPECIAL_x8008, 48
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_14A4:
	.byte 0x02, 0x00
scr_seq_0141_14A6:
	setvar VAR_SPECIAL_x8008, 40
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_14B8:
	.byte 0x02, 0x00
scr_seq_0141_14BA:
	setvar VAR_SPECIAL_x8008, 56
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_14CC:
	.byte 0x02, 0x00
scr_seq_0141_14CE:
	setvar VAR_SPECIAL_x8008, 65
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_14E0:
	.byte 0x02, 0x00
scr_seq_0141_14E2:
	setvar VAR_SPECIAL_x8008, 85
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_14F4:
	.byte 0x02, 0x00
scr_seq_0141_14F6:
	setvar VAR_SPECIAL_x8008, 404
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1508:
	.byte 0x02, 0x00
scr_seq_0141_150A:
	setvar VAR_SPECIAL_x8008, 267
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_151C:
	.byte 0x02, 0x00
scr_seq_0141_151E:
	setvar VAR_SPECIAL_x8008, 296
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1530:
	.byte 0x02, 0x00
scr_seq_0141_1532:
	setvar VAR_SPECIAL_x8008, 45
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1544:
	.byte 0x02, 0x00
scr_seq_0141_1546:
	setvar VAR_SPECIAL_x8008, 323
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1558:
	.byte 0x02, 0x00
scr_seq_0141_155A:
	setvar VAR_SPECIAL_x8008, 20
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_156C:
	.byte 0x02, 0x00
scr_seq_0141_156E:
	setvar VAR_SPECIAL_x8008, 286
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1580:
	.byte 0x02, 0x00
scr_seq_0141_1582:
	setvar VAR_SPECIAL_x8008, 84
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1594:
	.byte 0x02, 0x00
scr_seq_0141_1596:
	setvar VAR_SPECIAL_x8008, 28
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_15A8:
	.byte 0x02, 0x00
scr_seq_0141_15AA:
	setvar VAR_SPECIAL_x8008, 89
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_15BC:
	.byte 0x02, 0x00
scr_seq_0141_15BE:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_15D0:
	.byte 0x02, 0x00
scr_seq_0141_15D2:
	setvar VAR_SPECIAL_x8008, 340
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_15E4:
	.byte 0x02, 0x00
scr_seq_0141_15E6:
	setvar VAR_SPECIAL_x8008, 382
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_15F8:
	.byte 0x02, 0x00
scr_seq_0141_15FA:
	setvar VAR_SPECIAL_x8008, 362
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_160C:
	.byte 0x02, 0x00
scr_seq_0141_160E:
	setvar VAR_SPECIAL_x8008, 325
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1620:
	.byte 0x02, 0x00
scr_seq_0141_1622:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1634:
	.byte 0x02, 0x00
scr_seq_0141_1636:
	setvar VAR_SPECIAL_x8008, 320
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1648:
	.byte 0x02, 0x00
scr_seq_0141_164A:
	setvar VAR_SPECIAL_x8008, 109
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_165C:
	.byte 0x02, 0x00
scr_seq_0141_165E:
	setvar VAR_SPECIAL_x8008, 78
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1670:
	.byte 0x02, 0x00
scr_seq_0141_1672:
	setvar VAR_SPECIAL_x8008, 403
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1684:
	.byte 0x02, 0x00
scr_seq_0141_1686:
	setvar VAR_SPECIAL_x8008, 268
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1698:
	.byte 0x02, 0x00
scr_seq_0141_169A:
	setvar VAR_SPECIAL_x8008, 41
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_16AC:
	.byte 0x02, 0x00
scr_seq_0141_16AE:
	setvar VAR_SPECIAL_x8008, 49
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_16C0:
	.byte 0x02, 0x00
scr_seq_0141_16C2:
	setvar VAR_SPECIAL_x8008, 46
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_16D4:
	.byte 0x02, 0x00
scr_seq_0141_16D6:
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_16E8:
	.byte 0x02, 0x00
scr_seq_0141_16EA:
	setvar VAR_SPECIAL_x8008, 41
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_16FC:
	.byte 0x02, 0x00
scr_seq_0141_16FE:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1710:
	.byte 0x02, 0x00
scr_seq_0141_1712:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1724:
	.byte 0x02, 0x00
scr_seq_0141_1726:
	setvar VAR_SPECIAL_x8008, 254
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1738:
	.byte 0x02, 0x00
scr_seq_0141_173A:
	setvar VAR_SPECIAL_x8008, 51
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_174C:
	.byte 0x02, 0x00
scr_seq_0141_174E:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1760:
	.byte 0x02, 0x00
scr_seq_0141_1762:
	setvar VAR_SPECIAL_x8008, 351
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1774:
	.byte 0x02, 0x00
scr_seq_0141_1776:
	setvar VAR_SPECIAL_x8008, 314
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_1788:
	.byte 0x02, 0x00
scr_seq_0141_178A:
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_179C:
	.byte 0x02, 0x00
scr_seq_0141_179E:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_17B0:
	.byte 0x02, 0x00
scr_seq_0141_17B2:
	setvar VAR_SPECIAL_x8008, 108
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_17C4:
	.byte 0x02, 0x00
scr_seq_0141_17C6:
	setvar VAR_SPECIAL_x8008, 322
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_17D8:
	.byte 0x02, 0x00
scr_seq_0141_17DA:
	setvar VAR_SPECIAL_x8008, 281
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_17EE

scr_seq_0141_17EC:
	.byte 0x02, 0x00
scr_seq_0141_17EE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	wait_se SEQ_SE_DP_SELECT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8008
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8009
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0141_1830
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0141_19B8
	end

scr_seq_0141_182A:
	closemsg
	releaseall
	end

scr_seq_0141_1830:
	callstd 2001
	hide_person VAR_SPECIAL_x800D
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	itemistmorhm VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0141_198D
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0141_19A5
	end

scr_seq_0141_1862:
	wait_fanfare
	buffer_players_name 0
	buffer_item_name 1, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_0141_18F5
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0141_18E2
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0141_1941
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0141_192E
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0141_1954
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0141_1967
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0141_191B
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0141_1908
	end

scr_seq_0141_18E2:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto scr_seq_0141_197A

scr_seq_0141_18F3:
	.byte 0x02, 0x00
scr_seq_0141_18F5:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto scr_seq_0141_197A

scr_seq_0141_1906:
	.byte 0x02, 0x00
scr_seq_0141_1908:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto scr_seq_0141_197A

scr_seq_0141_1919:
	.byte 0x02, 0x00
scr_seq_0141_191B:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto scr_seq_0141_197A

scr_seq_0141_192C:
	.byte 0x02, 0x00
scr_seq_0141_192E:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto scr_seq_0141_197A

scr_seq_0141_193F:
	.byte 0x02
	.byte 0x00
scr_seq_0141_1941:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto scr_seq_0141_197A

scr_seq_0141_1952:
	.byte 0x02, 0x00
scr_seq_0141_1954:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto scr_seq_0141_197A

scr_seq_0141_1965:
	.byte 0x02, 0x00
scr_seq_0141_1967:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto scr_seq_0141_197A

scr_seq_0141_1978:
	.byte 0x02, 0x00
scr_seq_0141_197A:
	npc_msg 9
	waitbutton
	setvar VAR_SPECIAL_x800C, 1
	goto scr_seq_0141_182A

scr_seq_0141_198B:
	.byte 0x02, 0x00
scr_seq_0141_198D:
	buffer_players_name 0
	buffer_item_name_indef 1, VAR_SPECIAL_x8004
	buffer_tmhm_move_name 2, VAR_SPECIAL_x8004
	npc_msg 6
	goto scr_seq_0141_1862

scr_seq_0141_19A3:
	.byte 0x02, 0x00
scr_seq_0141_19A5:
	buffer_players_name 0
	buffer_item_name_indef 1, VAR_SPECIAL_x8004
	npc_msg 3
	goto scr_seq_0141_1862

scr_seq_0141_19B6:
	.byte 0x02, 0x00
scr_seq_0141_19B8:
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 4
	waitbutton
	setvar VAR_SPECIAL_x800C, 0
	goto scr_seq_0141_182A

scr_seq_0141_19CE:
	.byte 0x02, 0x00
	.balign 4, 0
