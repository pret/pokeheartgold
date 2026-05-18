#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0141.h"
#include "msgdata/msg/msg_0199.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0141_000
	ScrDef scr_seq_0141_001
	ScrDef scr_seq_0141_002
	ScrDef scr_seq_0141_003
	ScrDef scr_seq_0141_004
	ScrDef scr_seq_0141_005
	ScrDef scr_seq_0141_006
	ScrDef scr_seq_0141_007
	ScrDef scr_seq_0141_008
	ScrDef scr_seq_0141_009
	ScrDef scr_seq_0141_010
	ScrDef scr_seq_0141_011
	ScrDef scr_seq_0141_012
	ScrDef scr_seq_0141_013
	ScrDef scr_seq_0141_014
	ScrDef scr_seq_0141_015
	ScrDef scr_seq_0141_016
	ScrDef scr_seq_0141_017
	ScrDef scr_seq_0141_018
	ScrDef scr_seq_0141_019
	ScrDef scr_seq_0141_020
	ScrDef scr_seq_0141_021
	ScrDef scr_seq_0141_022
	ScrDef scr_seq_0141_023
	ScrDef scr_seq_0141_024
	ScrDef scr_seq_0141_025
	ScrDef scr_seq_0141_026
	ScrDef scr_seq_0141_027
	ScrDef scr_seq_0141_028
	ScrDef scr_seq_0141_029
	ScrDef scr_seq_0141_030
	ScrDef scr_seq_0141_031
	ScrDef scr_seq_0141_032
	ScrDef scr_seq_0141_033
	ScrDef scr_seq_0141_034
	ScrDef scr_seq_0141_035
	ScrDef scr_seq_0141_036
	ScrDef scr_seq_0141_037
	ScrDef scr_seq_0141_038
	ScrDef scr_seq_0141_039
	ScrDef scr_seq_0141_040
	ScrDef scr_seq_0141_041
	ScrDef scr_seq_0141_042
	ScrDef scr_seq_0141_043
	ScrDef scr_seq_0141_044
	ScrDef scr_seq_0141_045
	ScrDef scr_seq_0141_046
	ScrDef scr_seq_0141_047
	ScrDef scr_seq_0141_048
	ScrDef scr_seq_0141_049
	ScrDef scr_seq_0141_050
	ScrDef scr_seq_0141_051
	ScrDef scr_seq_0141_052
	ScrDef scr_seq_0141_053
	ScrDef scr_seq_0141_054
	ScrDef scr_seq_0141_055
	ScrDef scr_seq_0141_056
	ScrDef scr_seq_0141_057
	ScrDef scr_seq_0141_058
	ScrDef scr_seq_0141_059
	ScrDef scr_seq_0141_060
	ScrDef scr_seq_0141_061
	ScrDef scr_seq_0141_062
	ScrDef scr_seq_0141_063
	ScrDef scr_seq_0141_064
	ScrDef scr_seq_0141_065
	ScrDef scr_seq_0141_066
	ScrDef scr_seq_0141_067
	ScrDef scr_seq_0141_068
	ScrDef scr_seq_0141_069
	ScrDef scr_seq_0141_070
	ScrDef scr_seq_0141_071
	ScrDef scr_seq_0141_072
	ScrDef scr_seq_0141_073
	ScrDef scr_seq_0141_074
	ScrDef scr_seq_0141_075
	ScrDef scr_seq_0141_076
	ScrDef scr_seq_0141_077
	ScrDef scr_seq_0141_078
	ScrDef scr_seq_0141_079
	ScrDef scr_seq_0141_080
	ScrDef scr_seq_0141_081
	ScrDef scr_seq_0141_082
	ScrDef scr_seq_0141_083
	ScrDef scr_seq_0141_084
	ScrDef scr_seq_0141_085
	ScrDef scr_seq_0141_086
	ScrDef scr_seq_0141_087
	ScrDef scr_seq_0141_088
	ScrDef scr_seq_0141_089
	ScrDef scr_seq_0141_090
	ScrDef scr_seq_0141_091
	ScrDef scr_seq_0141_092
	ScrDef scr_seq_0141_093
	ScrDef scr_seq_0141_094
	ScrDef scr_seq_0141_095
	ScrDef scr_seq_0141_096
	ScrDef scr_seq_0141_097
	ScrDef scr_seq_0141_098
	ScrDef scr_seq_0141_099
	ScrDef scr_seq_0141_100
	ScrDef scr_seq_0141_101
	ScrDef scr_seq_0141_102
	ScrDef scr_seq_0141_103
	ScrDef scr_seq_0141_104
	ScrDef scr_seq_0141_105
	ScrDef scr_seq_0141_106
	ScrDef scr_seq_0141_107
	ScrDef scr_seq_0141_108
	ScrDef scr_seq_0141_109
	ScrDef scr_seq_0141_110
	ScrDef scr_seq_0141_111
	ScrDef scr_seq_0141_112
	ScrDef scr_seq_0141_113
	ScrDef scr_seq_0141_114
	ScrDef scr_seq_0141_115
	ScrDef scr_seq_0141_116
	ScrDef scr_seq_0141_117
	ScrDef scr_seq_0141_118
	ScrDef scr_seq_0141_119
	ScrDef scr_seq_0141_120
	ScrDef scr_seq_0141_121
	ScrDef scr_seq_0141_122
	ScrDef scr_seq_0141_123
	ScrDef scr_seq_0141_124
	ScrDef scr_seq_0141_125
	ScrDef scr_seq_0141_126
	ScrDef scr_seq_0141_127
	ScrDef scr_seq_0141_128
	ScrDef scr_seq_0141_129
	ScrDef scr_seq_0141_130
	ScrDef scr_seq_0141_131
	ScrDef scr_seq_0141_132
	ScrDef scr_seq_0141_133
	ScrDef scr_seq_0141_134
	ScrDef scr_seq_0141_135
	ScrDef scr_seq_0141_136
	ScrDef scr_seq_0141_137
	ScrDef scr_seq_0141_138
	ScrDef scr_seq_0141_139
	ScrDef scr_seq_0141_140
	ScrDef scr_seq_0141_141
	ScrDef scr_seq_0141_142
	ScrDef scr_seq_0141_143
	ScrDef scr_seq_0141_144
	ScrDef scr_seq_0141_145
	ScrDef scr_seq_0141_146
	ScrDef scr_seq_0141_147
	ScrDef scr_seq_0141_148
	ScrDef scr_seq_0141_149
	ScrDef scr_seq_0141_150
	ScrDef scr_seq_0141_151
	ScrDef scr_seq_0141_152
	ScrDef scr_seq_0141_153
	ScrDef scr_seq_0141_154
	ScrDef scr_seq_0141_155
	ScrDef scr_seq_0141_156
	ScrDef scr_seq_0141_157
	ScrDef scr_seq_0141_158
	ScrDef scr_seq_0141_159
	ScrDef scr_seq_0141_160
	ScrDef scr_seq_0141_161
	ScrDef scr_seq_0141_162
	ScrDef scr_seq_0141_163
	ScrDef scr_seq_0141_164
	ScrDef scr_seq_0141_165
	ScrDef scr_seq_0141_166
	ScrDef scr_seq_0141_167
	ScrDef scr_seq_0141_168
	ScrDef scr_seq_0141_169
	ScrDef scr_seq_0141_170
	ScrDef scr_seq_0141_171
	ScrDef scr_seq_0141_172
	ScrDef scr_seq_0141_173
	ScrDef scr_seq_0141_174
	ScrDef scr_seq_0141_175
	ScrDef scr_seq_0141_176
	ScrDef scr_seq_0141_177
	ScrDef scr_seq_0141_178
	ScrDef scr_seq_0141_179
	ScrDef scr_seq_0141_180
	ScrDef scr_seq_0141_181
	ScrDef scr_seq_0141_182
	ScrDef scr_seq_0141_183
	ScrDef scr_seq_0141_184
	ScrDef scr_seq_0141_185
	ScrDef scr_seq_0141_186
	ScrDef scr_seq_0141_187
	ScrDef scr_seq_0141_188
	ScrDef scr_seq_0141_189
	ScrDef scr_seq_0141_190
	ScrDef scr_seq_0141_191
	ScrDef scr_seq_0141_192
	ScrDef scr_seq_0141_193
	ScrDef scr_seq_0141_194
	ScrDef scr_seq_0141_195
	ScrDef scr_seq_0141_196
	ScrDef scr_seq_0141_197
	ScrDef scr_seq_0141_198
	ScrDef scr_seq_0141_199
	ScrDef scr_seq_0141_200
	ScrDef scr_seq_0141_201
	ScrDef scr_seq_0141_202
	ScrDef scr_seq_0141_203
	ScrDef scr_seq_0141_204
	ScrDef scr_seq_0141_205
	ScrDef scr_seq_0141_206
	ScrDef scr_seq_0141_207
	ScrDef scr_seq_0141_208
	ScrDef scr_seq_0141_209
	ScrDef scr_seq_0141_210
	ScrDef scr_seq_0141_211
	ScrDef scr_seq_0141_212
	ScrDef scr_seq_0141_213
	ScrDef scr_seq_0141_214
	ScrDef scr_seq_0141_215
	ScrDef scr_seq_0141_216
	ScrDef scr_seq_0141_217
	ScrDef scr_seq_0141_218
	ScrDef scr_seq_0141_219
	ScrDef scr_seq_0141_220
	ScrDef scr_seq_0141_221
	ScrDef scr_seq_0141_222
	ScrDef scr_seq_0141_223
	ScrDef scr_seq_0141_224
	ScrDef scr_seq_0141_225
	ScrDef scr_seq_0141_226
	ScrDef scr_seq_0141_227
	ScrDef scr_seq_0141_228
	ScrDef scr_seq_0141_229
	ScrDef scr_seq_0141_230
	ScrDef scr_seq_0141_231
	ScrDef scr_seq_0141_232
	ScrDef scr_seq_0141_233
	ScrDef scr_seq_0141_234
	ScrDef scr_seq_0141_235
	ScrDef scr_seq_0141_236
	ScrDef scr_seq_0141_237
	ScrDef scr_seq_0141_238
	ScrDef scr_seq_0141_239
	ScrDef scr_seq_0141_240
	ScrDef scr_seq_0141_241
	ScrDef scr_seq_0141_242
	ScrDef scr_seq_0141_243
	ScrDef scr_seq_0141_244
	ScrDef scr_seq_0141_245
	ScrDef scr_seq_0141_246
	ScrDef scr_seq_0141_247
	ScrDef scr_seq_0141_248
	ScrDef scr_seq_0141_249
	ScrDef scr_seq_0141_250
	ScrDef scr_seq_0141_251
	ScrDef scr_seq_0141_252
	ScrDef scr_seq_0141_253
	ScrDef scr_seq_0141_254
	ScrDef scr_seq_0141_255
	ScrDefEnd

scr_seq_0141_000:
	SetVar VAR_SPECIAL_x8008, 17
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_001:
	SetVar VAR_SPECIAL_x8008, 18
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_002:
	SetVar VAR_SPECIAL_x8008, 17
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_003:
	SetVar VAR_SPECIAL_x8008, 17
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_004:
	SetVar VAR_SPECIAL_x8008, 4
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_005:
	SetVar VAR_SPECIAL_x8008, 50
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_006:
	SetVar VAR_SPECIAL_x8008, 51
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_007:
	SetVar VAR_SPECIAL_x8008, 22
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_008:
	SetVar VAR_SPECIAL_x8008, 60
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_009:
	SetVar VAR_SPECIAL_x8008, 17
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_010:
	SetVar VAR_SPECIAL_x8008, 78
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_011:
	SetVar VAR_SPECIAL_x8008, 17
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_012:
	SetVar VAR_SPECIAL_x8008, 25
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_013:
	SetVar VAR_SPECIAL_x8008, 36
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_014:
	SetVar VAR_SPECIAL_x8008, 34
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_015:
	SetVar VAR_SPECIAL_x8008, 155
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_016:
	SetVar VAR_SPECIAL_x8008, 151
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_017:
	SetVar VAR_SPECIAL_x8008, 36
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_018:
	SetVar VAR_SPECIAL_x8008, 35
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_019:
	SetVar VAR_SPECIAL_x8008, 158
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_020:
	SetVar VAR_SPECIAL_x8008, 81
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_021:
	SetVar VAR_SPECIAL_x8008, 90
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_022:
	SetVar VAR_SPECIAL_x8008, 91
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_023:
	SetVar VAR_SPECIAL_x8008, 154
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_024:
	SetVar VAR_SPECIAL_x8008, 243
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_025:
	SetVar VAR_SPECIAL_x8008, 37
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_026:
	SetVar VAR_SPECIAL_x8008, 249
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_027:
	SetVar VAR_SPECIAL_x8008, 270
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_028:
	SetVar VAR_SPECIAL_x8008, 154
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_029:
	SetVar VAR_SPECIAL_x8008, 79
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_030:
	SetVar VAR_SPECIAL_x8008, 3
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_031:
	SetVar VAR_SPECIAL_x8008, 336
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_032:
	SetVar VAR_SPECIAL_x8008, 253
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_033:
	SetVar VAR_SPECIAL_x8008, 57
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_034:
	SetVar VAR_SPECIAL_x8008, 3
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_035:
	SetVar VAR_SPECIAL_x8008, 17
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_036:
	SetVar VAR_SPECIAL_x8008, 21
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_037:
	SetVar VAR_SPECIAL_x8008, 58
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_038:
	SetVar VAR_SPECIAL_x8008, 366
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_039:
	SetVar VAR_SPECIAL_x8008, 40
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_040:
	SetVar VAR_SPECIAL_x8008, 25
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_041:
	SetVar VAR_SPECIAL_x8008, 26
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_042:
	SetVar VAR_SPECIAL_x8008, 345
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_043:
	SetVar VAR_SPECIAL_x8008, 28
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_044:
	SetVar VAR_SPECIAL_x8008, 57
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_045:
	SetVar VAR_SPECIAL_x8008, 18
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_046:
	SetVar VAR_SPECIAL_x8008, 38
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_047:
	SetVar VAR_SPECIAL_x8008, 92
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_048:
	SetVar VAR_SPECIAL_x8008, 390
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_049:
	SetVar VAR_SPECIAL_x8008, 409
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_050:
	SetVar VAR_SPECIAL_x8008, 39
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_051:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_052:
	SetVar VAR_SPECIAL_x8008, 19
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_053:
	SetVar VAR_SPECIAL_x8008, 223
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_054:
	SetVar VAR_SPECIAL_x8008, 38
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_055:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_056:
	SetVar VAR_SPECIAL_x8008, 27
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_057:
	SetVar VAR_SPECIAL_x8008, 228
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_058:
	SetVar VAR_SPECIAL_x8008, 444
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_059:
	SetVar VAR_SPECIAL_x8008, 405
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_060:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_061:
	SetVar VAR_SPECIAL_x8008, 393
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_062:
	SetVar VAR_SPECIAL_x8008, 22
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_063:
	SetVar VAR_SPECIAL_x8008, 218
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_064:
	SetVar VAR_SPECIAL_x8008, 355
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_065:
	SetVar VAR_SPECIAL_x8008, 107
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_066:
	SetVar VAR_SPECIAL_x8008, 25
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_067:
	SetVar VAR_SPECIAL_x8008, 18
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_068:
	SetVar VAR_SPECIAL_x8008, 45
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_069:
	SetVar VAR_SPECIAL_x8008, 339
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_070:
	SetVar VAR_SPECIAL_x8008, 27
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_071:
	SetVar VAR_SPECIAL_x8008, 78
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_072:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_073:
	SetVar VAR_SPECIAL_x8008, 51
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_074:
	SetVar VAR_SPECIAL_x8008, 50
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_075:
	SetVar VAR_SPECIAL_x8008, 24
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_076:
	SetVar VAR_SPECIAL_x8008, 27
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_077:
	SetVar VAR_SPECIAL_x8008, 29
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_078:
	SetVar VAR_SPECIAL_x8008, 23
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_079:
	SetVar VAR_SPECIAL_x8008, 41
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_080:
	SetVar VAR_SPECIAL_x8008, 92
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_081:
	SetVar VAR_SPECIAL_x8008, 45
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_082:
	SetVar VAR_SPECIAL_x8008, 24
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_083:
	SetVar VAR_SPECIAL_x8008, 255
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_084:
	SetVar VAR_SPECIAL_x8008, 387
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_085:
	SetVar VAR_SPECIAL_x8008, 384
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_086:
	SetVar VAR_SPECIAL_x8008, 50
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_087:
	SetVar VAR_SPECIAL_x8008, 38
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_088:
	SetVar VAR_SPECIAL_x8008, 414
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_089:
	SetVar VAR_SPECIAL_x8008, 76
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_090:
	SetVar VAR_SPECIAL_x8008, 26
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_091:
	SetVar VAR_SPECIAL_x8008, 415
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_092:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_093:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_094:
	SetVar VAR_SPECIAL_x8008, 78
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_095:
	SetVar VAR_SPECIAL_x8008, 48
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_096:
	SetVar VAR_SPECIAL_x8008, 23
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_097:
	SetVar VAR_SPECIAL_x8008, 92
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_098:
	SetVar VAR_SPECIAL_x8008, 49
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_099:
	SetVar VAR_SPECIAL_x8008, 29
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_100:
	SetVar VAR_SPECIAL_x8008, 23
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_101:
	SetVar VAR_SPECIAL_x8008, 41
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_102:
	SetVar VAR_SPECIAL_x8008, 50
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_103:
	SetVar VAR_SPECIAL_x8008, 28
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_104:
	SetVar VAR_SPECIAL_x8008, 279
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_105:
	SetVar VAR_SPECIAL_x8008, 317
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_106:
	SetVar VAR_SPECIAL_x8008, 69
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_107:
	SetVar VAR_SPECIAL_x8008, 92
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_108:
	SetVar VAR_SPECIAL_x8008, 26
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_109:
	SetVar VAR_SPECIAL_x8008, 324
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_110:
	SetVar VAR_SPECIAL_x8008, 392
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_111:
	SetVar VAR_SPECIAL_x8008, 38
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_112:
	SetVar VAR_SPECIAL_x8008, 28
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_113:
	SetVar VAR_SPECIAL_x8008, 78
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_114:
	SetVar VAR_SPECIAL_x8008, 92
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_115:
	SetVar VAR_SPECIAL_x8008, 278
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_116:
	SetVar VAR_SPECIAL_x8008, 24
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_117:
	SetVar VAR_SPECIAL_x8008, 47
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_118:
	SetVar VAR_SPECIAL_x8008, 29
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_119:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_120:
	SetVar VAR_SPECIAL_x8008, 316
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_121:
	SetVar VAR_SPECIAL_x8008, 321
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_122:
	SetVar VAR_SPECIAL_x8008, 50
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_123:
	SetVar VAR_SPECIAL_x8008, 24
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_124:
	SetVar VAR_SPECIAL_x8008, 367
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_125:
	SetVar VAR_SPECIAL_x8008, 40
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_126:
	SetVar VAR_SPECIAL_x8008, 235
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_127:
	SetVar VAR_SPECIAL_x8008, 78
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_128:
	SetVar VAR_SPECIAL_x8008, 48
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_129:
	SetVar VAR_SPECIAL_x8008, 51
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_130:
	SetVar VAR_SPECIAL_x8008, 23
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_131:
	SetVar VAR_SPECIAL_x8008, 39
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_132:
	SetVar VAR_SPECIAL_x8008, 25
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_133:
	SetVar VAR_SPECIAL_x8008, 25
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_134:
	SetVar VAR_SPECIAL_x8008, 55
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_135:
	SetVar VAR_SPECIAL_x8008, 92
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_136:
	SetVar VAR_SPECIAL_x8008, 373
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_137:
	SetVar VAR_SPECIAL_x8008, 376
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_138:
	SetVar VAR_SPECIAL_x8008, 27
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_139:
	SetVar VAR_SPECIAL_x8008, 46
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_140:
	SetVar VAR_SPECIAL_x8008, 61
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_141:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_142:
	SetVar VAR_SPECIAL_x8008, 39
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_143:
	SetVar VAR_SPECIAL_x8008, 370
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_144:
	SetVar VAR_SPECIAL_x8008, 297
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_145:
	SetVar VAR_SPECIAL_x8008, 67
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_146:
	SetVar VAR_SPECIAL_x8008, 77
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_147:
	SetVar VAR_SPECIAL_x8008, 29
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_148:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_149:
	SetVar VAR_SPECIAL_x8008, 426
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_150:
	SetVar VAR_SPECIAL_x8008, 46
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_151:
	SetVar VAR_SPECIAL_x8008, 51
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_152:
	SetVar VAR_SPECIAL_x8008, 27
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_153:
	SetVar VAR_SPECIAL_x8008, 24
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_154:
	SetVar VAR_SPECIAL_x8008, 246
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_155:
	SetVar VAR_SPECIAL_x8008, 399
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_156:
	SetVar VAR_SPECIAL_x8008, 47
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_157:
	SetVar VAR_SPECIAL_x8008, 49
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_158:
	SetVar VAR_SPECIAL_x8008, 41
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_159:
	SetVar VAR_SPECIAL_x8008, 250
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_160:
	SetVar VAR_SPECIAL_x8008, 40
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_161:
	SetVar VAR_SPECIAL_x8008, 24
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_162:
	SetVar VAR_SPECIAL_x8008, 27
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_163:
	SetVar VAR_SPECIAL_x8008, 92
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_164:
	SetVar VAR_SPECIAL_x8008, 28
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_165:
	SetVar VAR_SPECIAL_x8008, 59
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_166:
	SetVar VAR_SPECIAL_x8008, 381
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_167:
	SetVar VAR_SPECIAL_x8008, 28
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_168:
	SetVar VAR_SPECIAL_x8008, 17
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_169:
	SetVar VAR_SPECIAL_x8008, 25
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_170:
	SetVar VAR_SPECIAL_x8008, 27
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_171:
	SetVar VAR_SPECIAL_x8008, 56
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_172:
	SetVar VAR_SPECIAL_x8008, 68
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_173:
	SetVar VAR_SPECIAL_x8008, 81
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_174:
	SetVar VAR_SPECIAL_x8008, 50
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_175:
	SetVar VAR_SPECIAL_x8008, 329
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_176:
	SetVar VAR_SPECIAL_x8008, 280
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_177:
	SetVar VAR_SPECIAL_x8008, 41
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_178:
	SetVar VAR_SPECIAL_x8008, 29
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_179:
	SetVar VAR_SPECIAL_x8008, 27
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_180:
	SetVar VAR_SPECIAL_x8008, 17
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_181:
	SetVar VAR_SPECIAL_x8008, 353
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_182:
	SetVar VAR_SPECIAL_x8008, 45
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_183:
	SetVar VAR_SPECIAL_x8008, 23
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_184:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_185:
	SetVar VAR_SPECIAL_x8008, 406
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_186:
	SetVar VAR_SPECIAL_x8008, 50
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_187:
	SetVar VAR_SPECIAL_x8008, 319
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_188:
	SetVar VAR_SPECIAL_x8008, 288
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_189:
	SetVar VAR_SPECIAL_x8008, 53
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_190:
	SetVar VAR_SPECIAL_x8008, 315
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_191:
	SetVar VAR_SPECIAL_x8008, 389
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_192:
	SetVar VAR_SPECIAL_x8008, 368
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_193:
	SetVar VAR_SPECIAL_x8008, 396
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_194:
	SetVar VAR_SPECIAL_x8008, 40
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_195:
	SetVar VAR_SPECIAL_x8008, 383
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_196:
	SetVar VAR_SPECIAL_x8008, 47
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_197:
	SetVar VAR_SPECIAL_x8008, 51
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_198:
	SetVar VAR_SPECIAL_x8008, 28
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_199:
	SetVar VAR_SPECIAL_x8008, 110
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_200:
	SetVar VAR_SPECIAL_x8008, 418
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_201:
	SetVar VAR_SPECIAL_x8008, 23
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_202:
	SetVar VAR_SPECIAL_x8008, 269
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_203:
	SetVar VAR_SPECIAL_x8008, 24
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_204:
	SetVar VAR_SPECIAL_x8008, 46
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_205:
	SetVar VAR_SPECIAL_x8008, 219
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_206:
	SetVar VAR_SPECIAL_x8008, 394
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_207:
	SetVar VAR_SPECIAL_x8008, 49
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_208:
	SetVar VAR_SPECIAL_x8008, 66
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_209:
	SetVar VAR_SPECIAL_x8008, 51
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_210:
	SetVar VAR_SPECIAL_x8008, 318
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_211:
	SetVar VAR_SPECIAL_x8008, 413
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_212:
	SetVar VAR_SPECIAL_x8008, 48
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_213:
	SetVar VAR_SPECIAL_x8008, 40
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_214:
	SetVar VAR_SPECIAL_x8008, 56
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_215:
	SetVar VAR_SPECIAL_x8008, 65
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_216:
	SetVar VAR_SPECIAL_x8008, 85
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_217:
	SetVar VAR_SPECIAL_x8008, 404
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_218:
	SetVar VAR_SPECIAL_x8008, 267
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_219:
	SetVar VAR_SPECIAL_x8008, 296
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_220:
	SetVar VAR_SPECIAL_x8008, 45
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_221:
	SetVar VAR_SPECIAL_x8008, 323
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_222:
	SetVar VAR_SPECIAL_x8008, 20
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_223:
	SetVar VAR_SPECIAL_x8008, 286
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_224:
	SetVar VAR_SPECIAL_x8008, 84
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_225:
	SetVar VAR_SPECIAL_x8008, 28
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_226:
	SetVar VAR_SPECIAL_x8008, 89
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_227:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_228:
	SetVar VAR_SPECIAL_x8008, 340
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_229:
	SetVar VAR_SPECIAL_x8008, 382
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_230:
	SetVar VAR_SPECIAL_x8008, 362
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_231:
	SetVar VAR_SPECIAL_x8008, 325
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_232:
	SetVar VAR_SPECIAL_x8008, 23
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_233:
	SetVar VAR_SPECIAL_x8008, 320
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_234:
	SetVar VAR_SPECIAL_x8008, 109
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_235:
	SetVar VAR_SPECIAL_x8008, 78
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_236:
	SetVar VAR_SPECIAL_x8008, 403
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_237:
	SetVar VAR_SPECIAL_x8008, 268
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_238:
	SetVar VAR_SPECIAL_x8008, 41
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_239:
	SetVar VAR_SPECIAL_x8008, 49
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_240:
	SetVar VAR_SPECIAL_x8008, 46
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_241:
	SetVar VAR_SPECIAL_x8008, 29
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_242:
	SetVar VAR_SPECIAL_x8008, 41
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_243:
	SetVar VAR_SPECIAL_x8008, 23
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_244:
	SetVar VAR_SPECIAL_x8008, 92
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_245:
	SetVar VAR_SPECIAL_x8008, 254
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_246:
	SetVar VAR_SPECIAL_x8008, 51
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_247:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_248:
	SetVar VAR_SPECIAL_x8008, 351
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_249:
	SetVar VAR_SPECIAL_x8008, 314
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_250:
	SetVar VAR_SPECIAL_x8008, 29
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_251:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_252:
	SetVar VAR_SPECIAL_x8008, 108
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_253:
	SetVar VAR_SPECIAL_x8008, 322
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_254:
	SetVar VAR_SPECIAL_x8008, 281
	SetVar VAR_SPECIAL_x8009, 1
	GoTo scr_seq_0141_255
	End

scr_seq_0141_255:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_x8008
	CopyVar VAR_SPECIAL_x8005, VAR_SPECIAL_x8009
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _1830
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _19B8
	End

_182A:
	CloseMsg
	ReleaseAll
	End

_1830:
	CallStd std_hidden_item_fanfare
	HidePerson VAR_SPECIAL_LAST_TALKED
	GiveItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	ItemIsTMOrHM VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _198D
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _19A5
	End

_1862:
	WaitFanfare
	BufferPlayersName 0
	BufferItemName 1, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 7, _18F5
	Case 0, _18E2
	Case 4, _1941
	Case 1, _192E
	Case 2, _1954
	Case 6, _1967
	Case 5, _191B
	Case 3, _1908
	End

_18E2:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _197A
	End

_18F5:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _197A
	End

_1908:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _197A
	End

_191B:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _197A
	End

_192E:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _197A
	End

_1941:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _197A
	End

_1954:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _197A
	End

_1967:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _197A
	End

_197A:
	NPCMsg msg_0199_00009
	WaitButton
	SetVar VAR_SPECIAL_RESULT, 1
	GoTo _182A
	End

_198D:
	BufferPlayersName 0
	BufferItemNameIndef 1, VAR_SPECIAL_x8004
	BufferTMHMMoveName 2, VAR_SPECIAL_x8004
	NPCMsg msg_0199_00006
	GoTo _1862
	End

_19A5:
	BufferPlayersName 0
	BufferItemNameIndef 1, VAR_SPECIAL_x8004
	NPCMsg msg_0199_00003
	GoTo _1862
	End

_19B8:
	BufferItemName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0199_00004
	WaitButton
	SetVar VAR_SPECIAL_RESULT, 0
	GoTo _182A
	End

	.balign 4, 0
