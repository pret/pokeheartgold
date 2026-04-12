#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0145.h"
#include "msgdata/msg/msg_0210.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0145_000
	ScrDef scr_seq_0145_001
	ScrDef scr_seq_0145_002
	ScrDef scr_seq_0145_003
	ScrDef scr_seq_0145_004
	ScrDef scr_seq_0145_005
	ScrDef scr_seq_0145_006
	ScrDef scr_seq_0145_007
	ScrDef scr_seq_0145_008
	ScrDef scr_seq_0145_009
	ScrDef scr_seq_0145_010
	ScrDef scr_seq_0145_011
	ScrDef scr_seq_0145_012
	ScrDef scr_seq_0145_013
	ScrDef scr_seq_0145_014
	ScrDef scr_seq_0145_015
	ScrDef scr_seq_0145_016
	ScrDef scr_seq_0145_017
	ScrDef scr_seq_0145_018
	ScrDef scr_seq_0145_019
	ScrDef scr_seq_0145_020
	ScrDef scr_seq_0145_021
	ScrDef scr_seq_0145_022
	ScrDef scr_seq_0145_023
	ScrDef scr_seq_0145_024
	ScrDef scr_seq_0145_025
	ScrDef scr_seq_0145_026
	ScrDef scr_seq_0145_027
	ScrDef scr_seq_0145_028
	ScrDef scr_seq_0145_029
	ScrDef scr_seq_0145_030
	ScrDef scr_seq_0145_031
	ScrDef scr_seq_0145_032
	ScrDef scr_seq_0145_033
	ScrDef scr_seq_0145_034
	ScrDef scr_seq_0145_035
	ScrDef scr_seq_0145_036
	ScrDef scr_seq_0145_037
	ScrDef scr_seq_0145_038
	ScrDef scr_seq_0145_039
	ScrDef scr_seq_0145_040
	ScrDef scr_seq_0145_041
	ScrDef scr_seq_0145_042
	ScrDef scr_seq_0145_043
	ScrDef scr_seq_0145_044
	ScrDef scr_seq_0145_045
	ScrDef scr_seq_0145_046
	ScrDef scr_seq_0145_047
	ScrDef scr_seq_0145_048
	ScrDef scr_seq_0145_049
	ScrDef scr_seq_0145_050
	ScrDef scr_seq_0145_051
	ScrDef scr_seq_0145_052
	ScrDef scr_seq_0145_053
	ScrDef scr_seq_0145_054
	ScrDef scr_seq_0145_055
	ScrDef scr_seq_0145_056
	ScrDef scr_seq_0145_057
	ScrDef scr_seq_0145_058
	ScrDef scr_seq_0145_059
	ScrDef scr_seq_0145_060
	ScrDef scr_seq_0145_061
	ScrDef scr_seq_0145_062
	ScrDef scr_seq_0145_063
	ScrDef scr_seq_0145_064
	ScrDef scr_seq_0145_065
	ScrDef scr_seq_0145_066
	ScrDef scr_seq_0145_067
	ScrDef scr_seq_0145_068
	ScrDef scr_seq_0145_069
	ScrDef scr_seq_0145_070
	ScrDef scr_seq_0145_071
	ScrDef scr_seq_0145_072
	ScrDef scr_seq_0145_073
	ScrDef scr_seq_0145_074
	ScrDef scr_seq_0145_075
	ScrDef scr_seq_0145_076
	ScrDef scr_seq_0145_077
	ScrDef scr_seq_0145_078
	ScrDef scr_seq_0145_079
	ScrDef scr_seq_0145_080
	ScrDef scr_seq_0145_081
	ScrDef scr_seq_0145_082
	ScrDef scr_seq_0145_083
	ScrDef scr_seq_0145_084
	ScrDef scr_seq_0145_085
	ScrDef scr_seq_0145_086
	ScrDef scr_seq_0145_087
	ScrDef scr_seq_0145_088
	ScrDef scr_seq_0145_089
	ScrDef scr_seq_0145_090
	ScrDef scr_seq_0145_091
	ScrDef scr_seq_0145_092
	ScrDef scr_seq_0145_093
	ScrDef scr_seq_0145_094
	ScrDef scr_seq_0145_095
	ScrDef scr_seq_0145_096
	ScrDef scr_seq_0145_097
	ScrDef scr_seq_0145_098
	ScrDef scr_seq_0145_099
	ScrDef scr_seq_0145_100
	ScrDef scr_seq_0145_101
	ScrDef scr_seq_0145_102
	ScrDef scr_seq_0145_103
	ScrDef scr_seq_0145_104
	ScrDef scr_seq_0145_105
	ScrDef scr_seq_0145_106
	ScrDef scr_seq_0145_107
	ScrDef scr_seq_0145_108
	ScrDef scr_seq_0145_109
	ScrDef scr_seq_0145_110
	ScrDef scr_seq_0145_111
	ScrDef scr_seq_0145_112
	ScrDef scr_seq_0145_113
	ScrDef scr_seq_0145_114
	ScrDef scr_seq_0145_115
	ScrDef scr_seq_0145_116
	ScrDef scr_seq_0145_117
	ScrDef scr_seq_0145_118
	ScrDef scr_seq_0145_119
	ScrDef scr_seq_0145_120
	ScrDef scr_seq_0145_121
	ScrDef scr_seq_0145_122
	ScrDef scr_seq_0145_123
	ScrDef scr_seq_0145_124
	ScrDef scr_seq_0145_125
	ScrDef scr_seq_0145_126
	ScrDef scr_seq_0145_127
	ScrDef scr_seq_0145_128
	ScrDef scr_seq_0145_129
	ScrDef scr_seq_0145_130
	ScrDef scr_seq_0145_131
	ScrDef scr_seq_0145_132
	ScrDef scr_seq_0145_133
	ScrDef scr_seq_0145_134
	ScrDef scr_seq_0145_135
	ScrDef scr_seq_0145_136
	ScrDef scr_seq_0145_137
	ScrDef scr_seq_0145_138
	ScrDef scr_seq_0145_139
	ScrDef scr_seq_0145_140
	ScrDef scr_seq_0145_141
	ScrDef scr_seq_0145_142
	ScrDef scr_seq_0145_143
	ScrDef scr_seq_0145_144
	ScrDef scr_seq_0145_145
	ScrDef scr_seq_0145_146
	ScrDef scr_seq_0145_147
	ScrDef scr_seq_0145_148
	ScrDef scr_seq_0145_149
	ScrDef scr_seq_0145_150
	ScrDef scr_seq_0145_151
	ScrDef scr_seq_0145_152
	ScrDef scr_seq_0145_153
	ScrDef scr_seq_0145_154
	ScrDef scr_seq_0145_155
	ScrDef scr_seq_0145_156
	ScrDef scr_seq_0145_157
	ScrDef scr_seq_0145_158
	ScrDef scr_seq_0145_159
	ScrDef scr_seq_0145_160
	ScrDef scr_seq_0145_161
	ScrDef scr_seq_0145_162
	ScrDef scr_seq_0145_163
	ScrDef scr_seq_0145_164
	ScrDef scr_seq_0145_165
	ScrDef scr_seq_0145_166
	ScrDef scr_seq_0145_167
	ScrDef scr_seq_0145_168
	ScrDef scr_seq_0145_169
	ScrDef scr_seq_0145_170
	ScrDef scr_seq_0145_171
	ScrDef scr_seq_0145_172
	ScrDef scr_seq_0145_173
	ScrDef scr_seq_0145_174
	ScrDef scr_seq_0145_175
	ScrDef scr_seq_0145_176
	ScrDef scr_seq_0145_177
	ScrDef scr_seq_0145_178
	ScrDef scr_seq_0145_179
	ScrDef scr_seq_0145_180
	ScrDef scr_seq_0145_181
	ScrDef scr_seq_0145_182
	ScrDef scr_seq_0145_183
	ScrDef scr_seq_0145_184
	ScrDef scr_seq_0145_185
	ScrDef scr_seq_0145_186
	ScrDef scr_seq_0145_187
	ScrDef scr_seq_0145_188
	ScrDef scr_seq_0145_189
	ScrDef scr_seq_0145_190
	ScrDef scr_seq_0145_191
	ScrDef scr_seq_0145_192
	ScrDef scr_seq_0145_193
	ScrDef scr_seq_0145_194
	ScrDef scr_seq_0145_195
	ScrDef scr_seq_0145_196
	ScrDef scr_seq_0145_197
	ScrDef scr_seq_0145_198
	ScrDef scr_seq_0145_199
	ScrDef scr_seq_0145_200
	ScrDef scr_seq_0145_201
	ScrDef scr_seq_0145_202
	ScrDef scr_seq_0145_203
	ScrDef scr_seq_0145_204
	ScrDef scr_seq_0145_205
	ScrDef scr_seq_0145_206
	ScrDef scr_seq_0145_207
	ScrDef scr_seq_0145_208
	ScrDef scr_seq_0145_209
	ScrDef scr_seq_0145_210
	ScrDef scr_seq_0145_211
	ScrDef scr_seq_0145_212
	ScrDef scr_seq_0145_213
	ScrDef scr_seq_0145_214
	ScrDef scr_seq_0145_215
	ScrDef scr_seq_0145_216
	ScrDef scr_seq_0145_217
	ScrDef scr_seq_0145_218
	ScrDef scr_seq_0145_219
	ScrDef scr_seq_0145_220
	ScrDef scr_seq_0145_221
	ScrDef scr_seq_0145_222
	ScrDef scr_seq_0145_223
	ScrDef scr_seq_0145_224
	ScrDef scr_seq_0145_225
	ScrDef scr_seq_0145_226
	ScrDef scr_seq_0145_227
	ScrDef scr_seq_0145_228
	ScrDef scr_seq_0145_229
	ScrDef scr_seq_0145_230
	ScrDef scr_seq_0145_231
	ScrDef scr_seq_0145_232
	ScrDef scr_seq_0145_233
	ScrDef scr_seq_0145_234
	ScrDef scr_seq_0145_235
	ScrDef scr_seq_0145_236
	ScrDef scr_seq_0145_237
	ScrDef scr_seq_0145_238
	ScrDef scr_seq_0145_239
	ScrDef scr_seq_0145_240
	ScrDef scr_seq_0145_241
	ScrDef scr_seq_0145_242
	ScrDef scr_seq_0145_243
	ScrDef scr_seq_0145_244
	ScrDef scr_seq_0145_245
	ScrDef scr_seq_0145_246
	ScrDef scr_seq_0145_247
	ScrDef scr_seq_0145_248
	ScrDef scr_seq_0145_249
	ScrDef scr_seq_0145_250
	ScrDef scr_seq_0145_251
	ScrDef scr_seq_0145_252
	ScrDef scr_seq_0145_253
	ScrDef scr_seq_0145_254
	ScrDef scr_seq_0145_255
	ScrDefEnd

scr_seq_0145_000:
scr_seq_0145_001:
scr_seq_0145_002:
scr_seq_0145_003:
scr_seq_0145_004:
scr_seq_0145_005:
scr_seq_0145_006:
scr_seq_0145_007:
scr_seq_0145_008:
scr_seq_0145_009:
scr_seq_0145_010:
scr_seq_0145_011:
scr_seq_0145_012:
scr_seq_0145_013:
scr_seq_0145_014:
scr_seq_0145_015:
scr_seq_0145_016:
scr_seq_0145_017:
scr_seq_0145_018:
scr_seq_0145_019:
scr_seq_0145_020:
scr_seq_0145_021:
scr_seq_0145_022:
scr_seq_0145_023:
scr_seq_0145_024:
scr_seq_0145_025:
scr_seq_0145_026:
scr_seq_0145_027:
scr_seq_0145_028:
scr_seq_0145_029:
scr_seq_0145_030:
scr_seq_0145_031:
scr_seq_0145_032:
scr_seq_0145_033:
scr_seq_0145_034:
scr_seq_0145_035:
scr_seq_0145_036:
scr_seq_0145_037:
scr_seq_0145_038:
scr_seq_0145_039:
scr_seq_0145_040:
scr_seq_0145_041:
scr_seq_0145_042:
scr_seq_0145_043:
scr_seq_0145_044:
scr_seq_0145_045:
scr_seq_0145_046:
scr_seq_0145_047:
scr_seq_0145_048:
scr_seq_0145_049:
scr_seq_0145_050:
scr_seq_0145_051:
scr_seq_0145_052:
scr_seq_0145_053:
scr_seq_0145_054:
scr_seq_0145_055:
scr_seq_0145_056:
scr_seq_0145_057:
scr_seq_0145_058:
scr_seq_0145_059:
scr_seq_0145_060:
scr_seq_0145_061:
scr_seq_0145_062:
scr_seq_0145_063:
scr_seq_0145_064:
scr_seq_0145_065:
scr_seq_0145_066:
scr_seq_0145_067:
scr_seq_0145_068:
scr_seq_0145_069:
scr_seq_0145_070:
scr_seq_0145_071:
scr_seq_0145_072:
scr_seq_0145_073:
scr_seq_0145_074:
scr_seq_0145_075:
scr_seq_0145_076:
scr_seq_0145_077:
scr_seq_0145_078:
scr_seq_0145_079:
scr_seq_0145_080:
scr_seq_0145_081:
scr_seq_0145_082:
scr_seq_0145_083:
scr_seq_0145_084:
scr_seq_0145_085:
scr_seq_0145_086:
scr_seq_0145_087:
scr_seq_0145_088:
scr_seq_0145_089:
scr_seq_0145_090:
scr_seq_0145_091:
scr_seq_0145_092:
scr_seq_0145_093:
scr_seq_0145_094:
scr_seq_0145_095:
scr_seq_0145_096:
scr_seq_0145_097:
scr_seq_0145_098:
scr_seq_0145_099:
scr_seq_0145_100:
scr_seq_0145_101:
scr_seq_0145_102:
scr_seq_0145_103:
scr_seq_0145_104:
scr_seq_0145_105:
scr_seq_0145_106:
scr_seq_0145_107:
scr_seq_0145_108:
scr_seq_0145_109:
scr_seq_0145_110:
scr_seq_0145_111:
scr_seq_0145_112:
scr_seq_0145_113:
scr_seq_0145_114:
scr_seq_0145_115:
scr_seq_0145_116:
scr_seq_0145_117:
scr_seq_0145_118:
scr_seq_0145_119:
scr_seq_0145_120:
scr_seq_0145_121:
scr_seq_0145_122:
scr_seq_0145_123:
scr_seq_0145_124:
scr_seq_0145_125:
scr_seq_0145_126:
scr_seq_0145_127:
scr_seq_0145_128:
scr_seq_0145_129:
scr_seq_0145_130:
scr_seq_0145_131:
scr_seq_0145_132:
scr_seq_0145_133:
scr_seq_0145_134:
scr_seq_0145_135:
scr_seq_0145_136:
scr_seq_0145_137:
scr_seq_0145_138:
scr_seq_0145_139:
scr_seq_0145_140:
scr_seq_0145_141:
scr_seq_0145_142:
scr_seq_0145_143:
scr_seq_0145_144:
scr_seq_0145_145:
scr_seq_0145_146:
scr_seq_0145_147:
scr_seq_0145_148:
scr_seq_0145_149:
scr_seq_0145_150:
scr_seq_0145_151:
scr_seq_0145_152:
scr_seq_0145_153:
scr_seq_0145_154:
scr_seq_0145_155:
scr_seq_0145_156:
scr_seq_0145_157:
scr_seq_0145_158:
scr_seq_0145_159:
scr_seq_0145_160:
scr_seq_0145_161:
scr_seq_0145_162:
scr_seq_0145_163:
scr_seq_0145_164:
scr_seq_0145_165:
scr_seq_0145_166:
scr_seq_0145_167:
scr_seq_0145_168:
scr_seq_0145_169:
scr_seq_0145_170:
scr_seq_0145_171:
scr_seq_0145_172:
scr_seq_0145_173:
scr_seq_0145_174:
scr_seq_0145_175:
scr_seq_0145_176:
scr_seq_0145_177:
scr_seq_0145_178:
scr_seq_0145_179:
scr_seq_0145_180:
scr_seq_0145_181:
scr_seq_0145_182:
scr_seq_0145_183:
scr_seq_0145_184:
scr_seq_0145_185:
scr_seq_0145_186:
scr_seq_0145_187:
scr_seq_0145_188:
scr_seq_0145_189:
scr_seq_0145_190:
scr_seq_0145_191:
scr_seq_0145_192:
scr_seq_0145_193:
scr_seq_0145_194:
scr_seq_0145_195:
scr_seq_0145_196:
scr_seq_0145_197:
scr_seq_0145_198:
scr_seq_0145_199:
scr_seq_0145_200:
scr_seq_0145_201:
scr_seq_0145_202:
scr_seq_0145_203:
scr_seq_0145_204:
scr_seq_0145_205:
scr_seq_0145_206:
scr_seq_0145_207:
scr_seq_0145_208:
scr_seq_0145_209:
scr_seq_0145_210:
scr_seq_0145_211:
scr_seq_0145_212:
scr_seq_0145_213:
scr_seq_0145_214:
scr_seq_0145_215:
scr_seq_0145_216:
scr_seq_0145_217:
scr_seq_0145_218:
scr_seq_0145_219:
scr_seq_0145_220:
scr_seq_0145_221:
scr_seq_0145_222:
scr_seq_0145_223:
scr_seq_0145_224:
scr_seq_0145_225:
scr_seq_0145_226:
scr_seq_0145_227:
scr_seq_0145_228:
scr_seq_0145_229:
scr_seq_0145_230:
scr_seq_0145_231:
scr_seq_0145_232:
scr_seq_0145_233:
scr_seq_0145_234:
scr_seq_0145_235:
scr_seq_0145_236:
scr_seq_0145_237:
scr_seq_0145_238:
scr_seq_0145_239:
scr_seq_0145_240:
scr_seq_0145_241:
scr_seq_0145_242:
scr_seq_0145_243:
scr_seq_0145_244:
scr_seq_0145_245:
scr_seq_0145_246:
scr_seq_0145_247:
scr_seq_0145_248:
scr_seq_0145_249:
scr_seq_0145_250:
scr_seq_0145_251:
scr_seq_0145_252:
scr_seq_0145_253:
scr_seq_0145_254:
scr_seq_0145_255:
	WaitSE SEQ_SE_DP_SELECT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_x8000
	CopyVar VAR_SPECIAL_x8005, VAR_SPECIAL_x8001
	CopyVar VAR_SPECIAL_x8006, VAR_SPECIAL_x8002
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0440
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _05C8
	End

_043C:
	CloseMsg
	End

_0440:
	CallStd std_hidden_item_fanfare
	GiveItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	ItemIsTMOrHM VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _059D
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _05B5
	End

_046E:
	WaitFanfare
	BufferPlayersName 0
	BufferItemName 1, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 7, _0501
	Case 0, _04EE
	Case 4, _054D
	Case 1, _053A
	Case 2, _0560
	Case 6, _0573
	Case 5, _0527
	Case 3, _0514
	End

_04EE:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _0586
	End

_0501:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _0586
	End

_0514:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _0586
	End

_0527:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _0586
	End

_053A:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _0586
	End

_054D:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _0586
	End

_0560:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _0586
	End

_0573:
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 2, VAR_SPECIAL_RESULT
	GoTo _0586
	End

_0586:
	SetFlagVar VAR_SPECIAL_x8006
	NPCMsg msg_0210_00009
	WaitButton
	SetVar VAR_SPECIAL_RESULT, 1
	GoTo _043C
	End

_059D:
	BufferPlayersName 0
	BufferItemNameIndef 1, VAR_SPECIAL_x8004
	BufferTMHMMoveName 2, VAR_SPECIAL_x8004
	NPCMsg msg_0210_00006
	GoTo _046E
	End

_05B5:
	BufferPlayersName 0
	BufferItemNameIndef 1, VAR_SPECIAL_x8004
	NPCMsg msg_0210_00003
	GoTo _046E
	End

_05C8:
	BufferItemName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0210_00004
	WaitButton
	SetVar VAR_SPECIAL_RESULT, 0
	GoTo _043C
	End

	.balign 4, 0
