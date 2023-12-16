#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0141.h"
#include "msgdata/msg/msg_0199.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0141_000
	scrdef scr_seq_0141_001
	scrdef scr_seq_0141_002
	scrdef scr_seq_0141_003
	scrdef scr_seq_0141_004
	scrdef scr_seq_0141_005
	scrdef scr_seq_0141_006
	scrdef scr_seq_0141_007
	scrdef scr_seq_0141_008
	scrdef scr_seq_0141_009
	scrdef scr_seq_0141_010
	scrdef scr_seq_0141_011
	scrdef scr_seq_0141_012
	scrdef scr_seq_0141_013
	scrdef scr_seq_0141_014
	scrdef scr_seq_0141_015
	scrdef scr_seq_0141_016
	scrdef scr_seq_0141_017
	scrdef scr_seq_0141_018
	scrdef scr_seq_0141_019
	scrdef scr_seq_0141_020
	scrdef scr_seq_0141_021
	scrdef scr_seq_0141_022
	scrdef scr_seq_0141_023
	scrdef scr_seq_0141_024
	scrdef scr_seq_0141_025
	scrdef scr_seq_0141_026
	scrdef scr_seq_0141_027
	scrdef scr_seq_0141_028
	scrdef scr_seq_0141_029
	scrdef scr_seq_0141_030
	scrdef scr_seq_0141_031
	scrdef scr_seq_0141_032
	scrdef scr_seq_0141_033
	scrdef scr_seq_0141_034
	scrdef scr_seq_0141_035
	scrdef scr_seq_0141_036
	scrdef scr_seq_0141_037
	scrdef scr_seq_0141_038
	scrdef scr_seq_0141_039
	scrdef scr_seq_0141_040
	scrdef scr_seq_0141_041
	scrdef scr_seq_0141_042
	scrdef scr_seq_0141_043
	scrdef scr_seq_0141_044
	scrdef scr_seq_0141_045
	scrdef scr_seq_0141_046
	scrdef scr_seq_0141_047
	scrdef scr_seq_0141_048
	scrdef scr_seq_0141_049
	scrdef scr_seq_0141_050
	scrdef scr_seq_0141_051
	scrdef scr_seq_0141_052
	scrdef scr_seq_0141_053
	scrdef scr_seq_0141_054
	scrdef scr_seq_0141_055
	scrdef scr_seq_0141_056
	scrdef scr_seq_0141_057
	scrdef scr_seq_0141_058
	scrdef scr_seq_0141_059
	scrdef scr_seq_0141_060
	scrdef scr_seq_0141_061
	scrdef scr_seq_0141_062
	scrdef scr_seq_0141_063
	scrdef scr_seq_0141_064
	scrdef scr_seq_0141_065
	scrdef scr_seq_0141_066
	scrdef scr_seq_0141_067
	scrdef scr_seq_0141_068
	scrdef scr_seq_0141_069
	scrdef scr_seq_0141_070
	scrdef scr_seq_0141_071
	scrdef scr_seq_0141_072
	scrdef scr_seq_0141_073
	scrdef scr_seq_0141_074
	scrdef scr_seq_0141_075
	scrdef scr_seq_0141_076
	scrdef scr_seq_0141_077
	scrdef scr_seq_0141_078
	scrdef scr_seq_0141_079
	scrdef scr_seq_0141_080
	scrdef scr_seq_0141_081
	scrdef scr_seq_0141_082
	scrdef scr_seq_0141_083
	scrdef scr_seq_0141_084
	scrdef scr_seq_0141_085
	scrdef scr_seq_0141_086
	scrdef scr_seq_0141_087
	scrdef scr_seq_0141_088
	scrdef scr_seq_0141_089
	scrdef scr_seq_0141_090
	scrdef scr_seq_0141_091
	scrdef scr_seq_0141_092
	scrdef scr_seq_0141_093
	scrdef scr_seq_0141_094
	scrdef scr_seq_0141_095
	scrdef scr_seq_0141_096
	scrdef scr_seq_0141_097
	scrdef scr_seq_0141_098
	scrdef scr_seq_0141_099
	scrdef scr_seq_0141_100
	scrdef scr_seq_0141_101
	scrdef scr_seq_0141_102
	scrdef scr_seq_0141_103
	scrdef scr_seq_0141_104
	scrdef scr_seq_0141_105
	scrdef scr_seq_0141_106
	scrdef scr_seq_0141_107
	scrdef scr_seq_0141_108
	scrdef scr_seq_0141_109
	scrdef scr_seq_0141_110
	scrdef scr_seq_0141_111
	scrdef scr_seq_0141_112
	scrdef scr_seq_0141_113
	scrdef scr_seq_0141_114
	scrdef scr_seq_0141_115
	scrdef scr_seq_0141_116
	scrdef scr_seq_0141_117
	scrdef scr_seq_0141_118
	scrdef scr_seq_0141_119
	scrdef scr_seq_0141_120
	scrdef scr_seq_0141_121
	scrdef scr_seq_0141_122
	scrdef scr_seq_0141_123
	scrdef scr_seq_0141_124
	scrdef scr_seq_0141_125
	scrdef scr_seq_0141_126
	scrdef scr_seq_0141_127
	scrdef scr_seq_0141_128
	scrdef scr_seq_0141_129
	scrdef scr_seq_0141_130
	scrdef scr_seq_0141_131
	scrdef scr_seq_0141_132
	scrdef scr_seq_0141_133
	scrdef scr_seq_0141_134
	scrdef scr_seq_0141_135
	scrdef scr_seq_0141_136
	scrdef scr_seq_0141_137
	scrdef scr_seq_0141_138
	scrdef scr_seq_0141_139
	scrdef scr_seq_0141_140
	scrdef scr_seq_0141_141
	scrdef scr_seq_0141_142
	scrdef scr_seq_0141_143
	scrdef scr_seq_0141_144
	scrdef scr_seq_0141_145
	scrdef scr_seq_0141_146
	scrdef scr_seq_0141_147
	scrdef scr_seq_0141_148
	scrdef scr_seq_0141_149
	scrdef scr_seq_0141_150
	scrdef scr_seq_0141_151
	scrdef scr_seq_0141_152
	scrdef scr_seq_0141_153
	scrdef scr_seq_0141_154
	scrdef scr_seq_0141_155
	scrdef scr_seq_0141_156
	scrdef scr_seq_0141_157
	scrdef scr_seq_0141_158
	scrdef scr_seq_0141_159
	scrdef scr_seq_0141_160
	scrdef scr_seq_0141_161
	scrdef scr_seq_0141_162
	scrdef scr_seq_0141_163
	scrdef scr_seq_0141_164
	scrdef scr_seq_0141_165
	scrdef scr_seq_0141_166
	scrdef scr_seq_0141_167
	scrdef scr_seq_0141_168
	scrdef scr_seq_0141_169
	scrdef scr_seq_0141_170
	scrdef scr_seq_0141_171
	scrdef scr_seq_0141_172
	scrdef scr_seq_0141_173
	scrdef scr_seq_0141_174
	scrdef scr_seq_0141_175
	scrdef scr_seq_0141_176
	scrdef scr_seq_0141_177
	scrdef scr_seq_0141_178
	scrdef scr_seq_0141_179
	scrdef scr_seq_0141_180
	scrdef scr_seq_0141_181
	scrdef scr_seq_0141_182
	scrdef scr_seq_0141_183
	scrdef scr_seq_0141_184
	scrdef scr_seq_0141_185
	scrdef scr_seq_0141_186
	scrdef scr_seq_0141_187
	scrdef scr_seq_0141_188
	scrdef scr_seq_0141_189
	scrdef scr_seq_0141_190
	scrdef scr_seq_0141_191
	scrdef scr_seq_0141_192
	scrdef scr_seq_0141_193
	scrdef scr_seq_0141_194
	scrdef scr_seq_0141_195
	scrdef scr_seq_0141_196
	scrdef scr_seq_0141_197
	scrdef scr_seq_0141_198
	scrdef scr_seq_0141_199
	scrdef scr_seq_0141_200
	scrdef scr_seq_0141_201
	scrdef scr_seq_0141_202
	scrdef scr_seq_0141_203
	scrdef scr_seq_0141_204
	scrdef scr_seq_0141_205
	scrdef scr_seq_0141_206
	scrdef scr_seq_0141_207
	scrdef scr_seq_0141_208
	scrdef scr_seq_0141_209
	scrdef scr_seq_0141_210
	scrdef scr_seq_0141_211
	scrdef scr_seq_0141_212
	scrdef scr_seq_0141_213
	scrdef scr_seq_0141_214
	scrdef scr_seq_0141_215
	scrdef scr_seq_0141_216
	scrdef scr_seq_0141_217
	scrdef scr_seq_0141_218
	scrdef scr_seq_0141_219
	scrdef scr_seq_0141_220
	scrdef scr_seq_0141_221
	scrdef scr_seq_0141_222
	scrdef scr_seq_0141_223
	scrdef scr_seq_0141_224
	scrdef scr_seq_0141_225
	scrdef scr_seq_0141_226
	scrdef scr_seq_0141_227
	scrdef scr_seq_0141_228
	scrdef scr_seq_0141_229
	scrdef scr_seq_0141_230
	scrdef scr_seq_0141_231
	scrdef scr_seq_0141_232
	scrdef scr_seq_0141_233
	scrdef scr_seq_0141_234
	scrdef scr_seq_0141_235
	scrdef scr_seq_0141_236
	scrdef scr_seq_0141_237
	scrdef scr_seq_0141_238
	scrdef scr_seq_0141_239
	scrdef scr_seq_0141_240
	scrdef scr_seq_0141_241
	scrdef scr_seq_0141_242
	scrdef scr_seq_0141_243
	scrdef scr_seq_0141_244
	scrdef scr_seq_0141_245
	scrdef scr_seq_0141_246
	scrdef scr_seq_0141_247
	scrdef scr_seq_0141_248
	scrdef scr_seq_0141_249
	scrdef scr_seq_0141_250
	scrdef scr_seq_0141_251
	scrdef scr_seq_0141_252
	scrdef scr_seq_0141_253
	scrdef scr_seq_0141_254
	scrdef scr_seq_0141_255
	scrdef_end

scr_seq_0141_000:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_001:
	setvar VAR_SPECIAL_x8008, 18
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_002:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_003:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_004:
	setvar VAR_SPECIAL_x8008, 4
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_005:
	setvar VAR_SPECIAL_x8008, 50
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_006:
	setvar VAR_SPECIAL_x8008, 51
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_007:
	setvar VAR_SPECIAL_x8008, 22
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_008:
	setvar VAR_SPECIAL_x8008, 60
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_009:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_010:
	setvar VAR_SPECIAL_x8008, 78
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_011:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_012:
	setvar VAR_SPECIAL_x8008, 25
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_013:
	setvar VAR_SPECIAL_x8008, 36
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_014:
	setvar VAR_SPECIAL_x8008, 34
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_015:
	setvar VAR_SPECIAL_x8008, 155
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_016:
	setvar VAR_SPECIAL_x8008, 151
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_017:
	setvar VAR_SPECIAL_x8008, 36
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_018:
	setvar VAR_SPECIAL_x8008, 35
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_019:
	setvar VAR_SPECIAL_x8008, 158
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_020:
	setvar VAR_SPECIAL_x8008, 81
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_021:
	setvar VAR_SPECIAL_x8008, 90
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_022:
	setvar VAR_SPECIAL_x8008, 91
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_023:
	setvar VAR_SPECIAL_x8008, 154
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_024:
	setvar VAR_SPECIAL_x8008, 243
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_025:
	setvar VAR_SPECIAL_x8008, 37
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_026:
	setvar VAR_SPECIAL_x8008, 249
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_027:
	setvar VAR_SPECIAL_x8008, 270
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_028:
	setvar VAR_SPECIAL_x8008, 154
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_029:
	setvar VAR_SPECIAL_x8008, 79
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_030:
	setvar VAR_SPECIAL_x8008, 3
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_031:
	setvar VAR_SPECIAL_x8008, 336
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_032:
	setvar VAR_SPECIAL_x8008, 253
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_033:
	setvar VAR_SPECIAL_x8008, 57
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_034:
	setvar VAR_SPECIAL_x8008, 3
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_035:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_036:
	setvar VAR_SPECIAL_x8008, 21
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_037:
	setvar VAR_SPECIAL_x8008, 58
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_038:
	setvar VAR_SPECIAL_x8008, 366
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_039:
	setvar VAR_SPECIAL_x8008, 40
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_040:
	setvar VAR_SPECIAL_x8008, 25
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_041:
	setvar VAR_SPECIAL_x8008, 26
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_042:
	setvar VAR_SPECIAL_x8008, 345
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_043:
	setvar VAR_SPECIAL_x8008, 28
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_044:
	setvar VAR_SPECIAL_x8008, 57
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_045:
	setvar VAR_SPECIAL_x8008, 18
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_046:
	setvar VAR_SPECIAL_x8008, 38
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_047:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_048:
	setvar VAR_SPECIAL_x8008, 390
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_049:
	setvar VAR_SPECIAL_x8008, 409
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_050:
	setvar VAR_SPECIAL_x8008, 39
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_051:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_052:
	setvar VAR_SPECIAL_x8008, 19
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_053:
	setvar VAR_SPECIAL_x8008, 223
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_054:
	setvar VAR_SPECIAL_x8008, 38
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_055:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_056:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_057:
	setvar VAR_SPECIAL_x8008, 228
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_058:
	setvar VAR_SPECIAL_x8008, 444
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_059:
	setvar VAR_SPECIAL_x8008, 405
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_060:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_061:
	setvar VAR_SPECIAL_x8008, 393
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_062:
	setvar VAR_SPECIAL_x8008, 22
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_063:
	setvar VAR_SPECIAL_x8008, 218
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_064:
	setvar VAR_SPECIAL_x8008, 355
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_065:
	setvar VAR_SPECIAL_x8008, 107
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_066:
	setvar VAR_SPECIAL_x8008, 25
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_067:
	setvar VAR_SPECIAL_x8008, 18
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_068:
	setvar VAR_SPECIAL_x8008, 45
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_069:
	setvar VAR_SPECIAL_x8008, 339
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_070:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_071:
	setvar VAR_SPECIAL_x8008, 78
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_072:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_073:
	setvar VAR_SPECIAL_x8008, 51
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_074:
	setvar VAR_SPECIAL_x8008, 50
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_075:
	setvar VAR_SPECIAL_x8008, 24
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_076:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_077:
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_078:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_079:
	setvar VAR_SPECIAL_x8008, 41
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_080:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_081:
	setvar VAR_SPECIAL_x8008, 45
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_082:
	setvar VAR_SPECIAL_x8008, 24
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_083:
	setvar VAR_SPECIAL_x8008, 255
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_084:
	setvar VAR_SPECIAL_x8008, 387
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_085:
	setvar VAR_SPECIAL_x8008, 384
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_086:
	setvar VAR_SPECIAL_x8008, 50
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_087:
	setvar VAR_SPECIAL_x8008, 38
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_088:
	setvar VAR_SPECIAL_x8008, 414
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_089:
	setvar VAR_SPECIAL_x8008, 76
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_090:
	setvar VAR_SPECIAL_x8008, 26
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_091:
	setvar VAR_SPECIAL_x8008, 415
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_092:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_093:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_094:
	setvar VAR_SPECIAL_x8008, 78
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_095:
	setvar VAR_SPECIAL_x8008, 48
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_096:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_097:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_098:
	setvar VAR_SPECIAL_x8008, 49
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_099:
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_100:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_101:
	setvar VAR_SPECIAL_x8008, 41
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_102:
	setvar VAR_SPECIAL_x8008, 50
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_103:
	setvar VAR_SPECIAL_x8008, 28
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_104:
	setvar VAR_SPECIAL_x8008, 279
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_105:
	setvar VAR_SPECIAL_x8008, 317
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_106:
	setvar VAR_SPECIAL_x8008, 69
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_107:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_108:
	setvar VAR_SPECIAL_x8008, 26
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_109:
	setvar VAR_SPECIAL_x8008, 324
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_110:
	setvar VAR_SPECIAL_x8008, 392
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_111:
	setvar VAR_SPECIAL_x8008, 38
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_112:
	setvar VAR_SPECIAL_x8008, 28
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_113:
	setvar VAR_SPECIAL_x8008, 78
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_114:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_115:
	setvar VAR_SPECIAL_x8008, 278
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_116:
	setvar VAR_SPECIAL_x8008, 24
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_117:
	setvar VAR_SPECIAL_x8008, 47
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_118:
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_119:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_120:
	setvar VAR_SPECIAL_x8008, 316
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_121:
	setvar VAR_SPECIAL_x8008, 321
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_122:
	setvar VAR_SPECIAL_x8008, 50
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_123:
	setvar VAR_SPECIAL_x8008, 24
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_124:
	setvar VAR_SPECIAL_x8008, 367
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_125:
	setvar VAR_SPECIAL_x8008, 40
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_126:
	setvar VAR_SPECIAL_x8008, 235
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_127:
	setvar VAR_SPECIAL_x8008, 78
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_128:
	setvar VAR_SPECIAL_x8008, 48
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_129:
	setvar VAR_SPECIAL_x8008, 51
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_130:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_131:
	setvar VAR_SPECIAL_x8008, 39
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_132:
	setvar VAR_SPECIAL_x8008, 25
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_133:
	setvar VAR_SPECIAL_x8008, 25
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_134:
	setvar VAR_SPECIAL_x8008, 55
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_135:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_136:
	setvar VAR_SPECIAL_x8008, 373
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_137:
	setvar VAR_SPECIAL_x8008, 376
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_138:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_139:
	setvar VAR_SPECIAL_x8008, 46
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_140:
	setvar VAR_SPECIAL_x8008, 61
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_141:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_142:
	setvar VAR_SPECIAL_x8008, 39
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_143:
	setvar VAR_SPECIAL_x8008, 370
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_144:
	setvar VAR_SPECIAL_x8008, 297
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_145:
	setvar VAR_SPECIAL_x8008, 67
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_146:
	setvar VAR_SPECIAL_x8008, 77
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_147:
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_148:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_149:
	setvar VAR_SPECIAL_x8008, 426
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_150:
	setvar VAR_SPECIAL_x8008, 46
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_151:
	setvar VAR_SPECIAL_x8008, 51
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_152:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_153:
	setvar VAR_SPECIAL_x8008, 24
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_154:
	setvar VAR_SPECIAL_x8008, 246
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_155:
	setvar VAR_SPECIAL_x8008, 399
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_156:
	setvar VAR_SPECIAL_x8008, 47
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_157:
	setvar VAR_SPECIAL_x8008, 49
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_158:
	setvar VAR_SPECIAL_x8008, 41
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_159:
	setvar VAR_SPECIAL_x8008, 250
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_160:
	setvar VAR_SPECIAL_x8008, 40
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_161:
	setvar VAR_SPECIAL_x8008, 24
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_162:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_163:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_164:
	setvar VAR_SPECIAL_x8008, 28
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_165:
	setvar VAR_SPECIAL_x8008, 59
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_166:
	setvar VAR_SPECIAL_x8008, 381
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_167:
	setvar VAR_SPECIAL_x8008, 28
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_168:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_169:
	setvar VAR_SPECIAL_x8008, 25
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_170:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_171:
	setvar VAR_SPECIAL_x8008, 56
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_172:
	setvar VAR_SPECIAL_x8008, 68
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_173:
	setvar VAR_SPECIAL_x8008, 81
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_174:
	setvar VAR_SPECIAL_x8008, 50
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_175:
	setvar VAR_SPECIAL_x8008, 329
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_176:
	setvar VAR_SPECIAL_x8008, 280
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_177:
	setvar VAR_SPECIAL_x8008, 41
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_178:
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_179:
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_180:
	setvar VAR_SPECIAL_x8008, 17
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_181:
	setvar VAR_SPECIAL_x8008, 353
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_182:
	setvar VAR_SPECIAL_x8008, 45
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_183:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_184:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_185:
	setvar VAR_SPECIAL_x8008, 406
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_186:
	setvar VAR_SPECIAL_x8008, 50
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_187:
	setvar VAR_SPECIAL_x8008, 319
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_188:
	setvar VAR_SPECIAL_x8008, 288
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_189:
	setvar VAR_SPECIAL_x8008, 53
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_190:
	setvar VAR_SPECIAL_x8008, 315
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_191:
	setvar VAR_SPECIAL_x8008, 389
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_192:
	setvar VAR_SPECIAL_x8008, 368
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_193:
	setvar VAR_SPECIAL_x8008, 396
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_194:
	setvar VAR_SPECIAL_x8008, 40
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_195:
	setvar VAR_SPECIAL_x8008, 383
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_196:
	setvar VAR_SPECIAL_x8008, 47
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_197:
	setvar VAR_SPECIAL_x8008, 51
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_198:
	setvar VAR_SPECIAL_x8008, 28
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_199:
	setvar VAR_SPECIAL_x8008, 110
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_200:
	setvar VAR_SPECIAL_x8008, 418
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_201:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_202:
	setvar VAR_SPECIAL_x8008, 269
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_203:
	setvar VAR_SPECIAL_x8008, 24
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_204:
	setvar VAR_SPECIAL_x8008, 46
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_205:
	setvar VAR_SPECIAL_x8008, 219
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_206:
	setvar VAR_SPECIAL_x8008, 394
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_207:
	setvar VAR_SPECIAL_x8008, 49
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_208:
	setvar VAR_SPECIAL_x8008, 66
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_209:
	setvar VAR_SPECIAL_x8008, 51
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_210:
	setvar VAR_SPECIAL_x8008, 318
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_211:
	setvar VAR_SPECIAL_x8008, 413
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_212:
	setvar VAR_SPECIAL_x8008, 48
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_213:
	setvar VAR_SPECIAL_x8008, 40
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_214:
	setvar VAR_SPECIAL_x8008, 56
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_215:
	setvar VAR_SPECIAL_x8008, 65
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_216:
	setvar VAR_SPECIAL_x8008, 85
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_217:
	setvar VAR_SPECIAL_x8008, 404
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_218:
	setvar VAR_SPECIAL_x8008, 267
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_219:
	setvar VAR_SPECIAL_x8008, 296
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_220:
	setvar VAR_SPECIAL_x8008, 45
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_221:
	setvar VAR_SPECIAL_x8008, 323
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_222:
	setvar VAR_SPECIAL_x8008, 20
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_223:
	setvar VAR_SPECIAL_x8008, 286
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_224:
	setvar VAR_SPECIAL_x8008, 84
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_225:
	setvar VAR_SPECIAL_x8008, 28
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_226:
	setvar VAR_SPECIAL_x8008, 89
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_227:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_228:
	setvar VAR_SPECIAL_x8008, 340
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_229:
	setvar VAR_SPECIAL_x8008, 382
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_230:
	setvar VAR_SPECIAL_x8008, 362
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_231:
	setvar VAR_SPECIAL_x8008, 325
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_232:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_233:
	setvar VAR_SPECIAL_x8008, 320
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_234:
	setvar VAR_SPECIAL_x8008, 109
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_235:
	setvar VAR_SPECIAL_x8008, 78
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_236:
	setvar VAR_SPECIAL_x8008, 403
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_237:
	setvar VAR_SPECIAL_x8008, 268
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_238:
	setvar VAR_SPECIAL_x8008, 41
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_239:
	setvar VAR_SPECIAL_x8008, 49
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_240:
	setvar VAR_SPECIAL_x8008, 46
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_241:
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_242:
	setvar VAR_SPECIAL_x8008, 41
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_243:
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_244:
	setvar VAR_SPECIAL_x8008, 92
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_245:
	setvar VAR_SPECIAL_x8008, 254
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_246:
	setvar VAR_SPECIAL_x8008, 51
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_247:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_248:
	setvar VAR_SPECIAL_x8008, 351
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_249:
	setvar VAR_SPECIAL_x8008, 314
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_250:
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_251:
	setvar VAR_SPECIAL_x8008, 2
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_252:
	setvar VAR_SPECIAL_x8008, 108
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_253:
	setvar VAR_SPECIAL_x8008, 322
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_254:
	setvar VAR_SPECIAL_x8008, 281
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0141_255
	end

scr_seq_0141_255:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	wait_se SEQ_SE_DP_SELECT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8008
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8009
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _1830
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _19B8
	end

_182A:
	closemsg
	releaseall
	end

_1830:
	callstd std_hidden_item_fanfare
	hide_person VAR_SPECIAL_LAST_TALKED
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	itemistmorhm VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _198D
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _19A5
	end

_1862:
	wait_fanfare
	buffer_players_name 0
	buffer_item_name 1, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	switch VAR_SPECIAL_RESULT
	case 7, _18F5
	case 0, _18E2
	case 4, _1941
	case 1, _192E
	case 2, _1954
	case 6, _1967
	case 5, _191B
	case 3, _1908
	end

_18E2:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _197A
	end

_18F5:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _197A
	end

_1908:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _197A
	end

_191B:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _197A
	end

_192E:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _197A
	end

_1941:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _197A
	end

_1954:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _197A
	end

_1967:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _197A
	end

_197A:
	npc_msg msg_0199_00009
	wait_button_or_walk_away
	setvar VAR_SPECIAL_RESULT, 1
	goto _182A
	end

_198D:
	buffer_players_name 0
	buffer_item_name_indef 1, VAR_SPECIAL_x8004
	buffer_tmhm_move_name 2, VAR_SPECIAL_x8004
	npc_msg msg_0199_00006
	goto _1862
	end

_19A5:
	buffer_players_name 0
	buffer_item_name_indef 1, VAR_SPECIAL_x8004
	npc_msg msg_0199_00003
	goto _1862
	end

_19B8:
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0199_00004
	wait_button_or_walk_away
	setvar VAR_SPECIAL_RESULT, 0
	goto _182A
	end

	.balign 4, 0
