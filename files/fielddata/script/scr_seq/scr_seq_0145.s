#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0145.h"
#include "msgdata/msg/msg_0210.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0145_000
	scrdef scr_seq_0145_001
	scrdef scr_seq_0145_002
	scrdef scr_seq_0145_003
	scrdef scr_seq_0145_004
	scrdef scr_seq_0145_005
	scrdef scr_seq_0145_006
	scrdef scr_seq_0145_007
	scrdef scr_seq_0145_008
	scrdef scr_seq_0145_009
	scrdef scr_seq_0145_010
	scrdef scr_seq_0145_011
	scrdef scr_seq_0145_012
	scrdef scr_seq_0145_013
	scrdef scr_seq_0145_014
	scrdef scr_seq_0145_015
	scrdef scr_seq_0145_016
	scrdef scr_seq_0145_017
	scrdef scr_seq_0145_018
	scrdef scr_seq_0145_019
	scrdef scr_seq_0145_020
	scrdef scr_seq_0145_021
	scrdef scr_seq_0145_022
	scrdef scr_seq_0145_023
	scrdef scr_seq_0145_024
	scrdef scr_seq_0145_025
	scrdef scr_seq_0145_026
	scrdef scr_seq_0145_027
	scrdef scr_seq_0145_028
	scrdef scr_seq_0145_029
	scrdef scr_seq_0145_030
	scrdef scr_seq_0145_031
	scrdef scr_seq_0145_032
	scrdef scr_seq_0145_033
	scrdef scr_seq_0145_034
	scrdef scr_seq_0145_035
	scrdef scr_seq_0145_036
	scrdef scr_seq_0145_037
	scrdef scr_seq_0145_038
	scrdef scr_seq_0145_039
	scrdef scr_seq_0145_040
	scrdef scr_seq_0145_041
	scrdef scr_seq_0145_042
	scrdef scr_seq_0145_043
	scrdef scr_seq_0145_044
	scrdef scr_seq_0145_045
	scrdef scr_seq_0145_046
	scrdef scr_seq_0145_047
	scrdef scr_seq_0145_048
	scrdef scr_seq_0145_049
	scrdef scr_seq_0145_050
	scrdef scr_seq_0145_051
	scrdef scr_seq_0145_052
	scrdef scr_seq_0145_053
	scrdef scr_seq_0145_054
	scrdef scr_seq_0145_055
	scrdef scr_seq_0145_056
	scrdef scr_seq_0145_057
	scrdef scr_seq_0145_058
	scrdef scr_seq_0145_059
	scrdef scr_seq_0145_060
	scrdef scr_seq_0145_061
	scrdef scr_seq_0145_062
	scrdef scr_seq_0145_063
	scrdef scr_seq_0145_064
	scrdef scr_seq_0145_065
	scrdef scr_seq_0145_066
	scrdef scr_seq_0145_067
	scrdef scr_seq_0145_068
	scrdef scr_seq_0145_069
	scrdef scr_seq_0145_070
	scrdef scr_seq_0145_071
	scrdef scr_seq_0145_072
	scrdef scr_seq_0145_073
	scrdef scr_seq_0145_074
	scrdef scr_seq_0145_075
	scrdef scr_seq_0145_076
	scrdef scr_seq_0145_077
	scrdef scr_seq_0145_078
	scrdef scr_seq_0145_079
	scrdef scr_seq_0145_080
	scrdef scr_seq_0145_081
	scrdef scr_seq_0145_082
	scrdef scr_seq_0145_083
	scrdef scr_seq_0145_084
	scrdef scr_seq_0145_085
	scrdef scr_seq_0145_086
	scrdef scr_seq_0145_087
	scrdef scr_seq_0145_088
	scrdef scr_seq_0145_089
	scrdef scr_seq_0145_090
	scrdef scr_seq_0145_091
	scrdef scr_seq_0145_092
	scrdef scr_seq_0145_093
	scrdef scr_seq_0145_094
	scrdef scr_seq_0145_095
	scrdef scr_seq_0145_096
	scrdef scr_seq_0145_097
	scrdef scr_seq_0145_098
	scrdef scr_seq_0145_099
	scrdef scr_seq_0145_100
	scrdef scr_seq_0145_101
	scrdef scr_seq_0145_102
	scrdef scr_seq_0145_103
	scrdef scr_seq_0145_104
	scrdef scr_seq_0145_105
	scrdef scr_seq_0145_106
	scrdef scr_seq_0145_107
	scrdef scr_seq_0145_108
	scrdef scr_seq_0145_109
	scrdef scr_seq_0145_110
	scrdef scr_seq_0145_111
	scrdef scr_seq_0145_112
	scrdef scr_seq_0145_113
	scrdef scr_seq_0145_114
	scrdef scr_seq_0145_115
	scrdef scr_seq_0145_116
	scrdef scr_seq_0145_117
	scrdef scr_seq_0145_118
	scrdef scr_seq_0145_119
	scrdef scr_seq_0145_120
	scrdef scr_seq_0145_121
	scrdef scr_seq_0145_122
	scrdef scr_seq_0145_123
	scrdef scr_seq_0145_124
	scrdef scr_seq_0145_125
	scrdef scr_seq_0145_126
	scrdef scr_seq_0145_127
	scrdef scr_seq_0145_128
	scrdef scr_seq_0145_129
	scrdef scr_seq_0145_130
	scrdef scr_seq_0145_131
	scrdef scr_seq_0145_132
	scrdef scr_seq_0145_133
	scrdef scr_seq_0145_134
	scrdef scr_seq_0145_135
	scrdef scr_seq_0145_136
	scrdef scr_seq_0145_137
	scrdef scr_seq_0145_138
	scrdef scr_seq_0145_139
	scrdef scr_seq_0145_140
	scrdef scr_seq_0145_141
	scrdef scr_seq_0145_142
	scrdef scr_seq_0145_143
	scrdef scr_seq_0145_144
	scrdef scr_seq_0145_145
	scrdef scr_seq_0145_146
	scrdef scr_seq_0145_147
	scrdef scr_seq_0145_148
	scrdef scr_seq_0145_149
	scrdef scr_seq_0145_150
	scrdef scr_seq_0145_151
	scrdef scr_seq_0145_152
	scrdef scr_seq_0145_153
	scrdef scr_seq_0145_154
	scrdef scr_seq_0145_155
	scrdef scr_seq_0145_156
	scrdef scr_seq_0145_157
	scrdef scr_seq_0145_158
	scrdef scr_seq_0145_159
	scrdef scr_seq_0145_160
	scrdef scr_seq_0145_161
	scrdef scr_seq_0145_162
	scrdef scr_seq_0145_163
	scrdef scr_seq_0145_164
	scrdef scr_seq_0145_165
	scrdef scr_seq_0145_166
	scrdef scr_seq_0145_167
	scrdef scr_seq_0145_168
	scrdef scr_seq_0145_169
	scrdef scr_seq_0145_170
	scrdef scr_seq_0145_171
	scrdef scr_seq_0145_172
	scrdef scr_seq_0145_173
	scrdef scr_seq_0145_174
	scrdef scr_seq_0145_175
	scrdef scr_seq_0145_176
	scrdef scr_seq_0145_177
	scrdef scr_seq_0145_178
	scrdef scr_seq_0145_179
	scrdef scr_seq_0145_180
	scrdef scr_seq_0145_181
	scrdef scr_seq_0145_182
	scrdef scr_seq_0145_183
	scrdef scr_seq_0145_184
	scrdef scr_seq_0145_185
	scrdef scr_seq_0145_186
	scrdef scr_seq_0145_187
	scrdef scr_seq_0145_188
	scrdef scr_seq_0145_189
	scrdef scr_seq_0145_190
	scrdef scr_seq_0145_191
	scrdef scr_seq_0145_192
	scrdef scr_seq_0145_193
	scrdef scr_seq_0145_194
	scrdef scr_seq_0145_195
	scrdef scr_seq_0145_196
	scrdef scr_seq_0145_197
	scrdef scr_seq_0145_198
	scrdef scr_seq_0145_199
	scrdef scr_seq_0145_200
	scrdef scr_seq_0145_201
	scrdef scr_seq_0145_202
	scrdef scr_seq_0145_203
	scrdef scr_seq_0145_204
	scrdef scr_seq_0145_205
	scrdef scr_seq_0145_206
	scrdef scr_seq_0145_207
	scrdef scr_seq_0145_208
	scrdef scr_seq_0145_209
	scrdef scr_seq_0145_210
	scrdef scr_seq_0145_211
	scrdef scr_seq_0145_212
	scrdef scr_seq_0145_213
	scrdef scr_seq_0145_214
	scrdef scr_seq_0145_215
	scrdef scr_seq_0145_216
	scrdef scr_seq_0145_217
	scrdef scr_seq_0145_218
	scrdef scr_seq_0145_219
	scrdef scr_seq_0145_220
	scrdef scr_seq_0145_221
	scrdef scr_seq_0145_222
	scrdef scr_seq_0145_223
	scrdef scr_seq_0145_224
	scrdef scr_seq_0145_225
	scrdef scr_seq_0145_226
	scrdef scr_seq_0145_227
	scrdef scr_seq_0145_228
	scrdef scr_seq_0145_229
	scrdef scr_seq_0145_230
	scrdef scr_seq_0145_231
	scrdef scr_seq_0145_232
	scrdef scr_seq_0145_233
	scrdef scr_seq_0145_234
	scrdef scr_seq_0145_235
	scrdef scr_seq_0145_236
	scrdef scr_seq_0145_237
	scrdef scr_seq_0145_238
	scrdef scr_seq_0145_239
	scrdef scr_seq_0145_240
	scrdef scr_seq_0145_241
	scrdef scr_seq_0145_242
	scrdef scr_seq_0145_243
	scrdef scr_seq_0145_244
	scrdef scr_seq_0145_245
	scrdef scr_seq_0145_246
	scrdef scr_seq_0145_247
	scrdef scr_seq_0145_248
	scrdef scr_seq_0145_249
	scrdef scr_seq_0145_250
	scrdef scr_seq_0145_251
	scrdef scr_seq_0145_252
	scrdef scr_seq_0145_253
	scrdef scr_seq_0145_254
	scrdef scr_seq_0145_255
	scrdef_end

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
	wait_se SEQ_SE_DP_SELECT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8000
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8001
	copyvar VAR_SPECIAL_x8006, VAR_SPECIAL_x8002
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0440
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _05C8
	end

_043C:
	closemsg
	end

_0440:
	callstd std_hidden_item_fanfare
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	itemistmorhm VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _059D
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _05B5
	end

_046E:
	wait_fanfare
	buffer_players_name 0
	buffer_item_name 1, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	switch VAR_SPECIAL_RESULT
	case 7, _0501
	case 0, _04EE
	case 4, _054D
	case 1, _053A
	case 2, _0560
	case 6, _0573
	case 5, _0527
	case 3, _0514
	end

_04EE:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _0586
	end

_0501:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _0586
	end

_0514:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _0586
	end

_0527:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _0586
	end

_053A:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _0586
	end

_054D:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _0586
	end

_0560:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _0586
	end

_0573:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	goto _0586
	end

_0586:
	setflagvar VAR_SPECIAL_x8006
	npc_msg msg_0210_00009
	wait_button_or_walk_away
	setvar VAR_SPECIAL_RESULT, 1
	goto _043C
	end

_059D:
	buffer_players_name 0
	buffer_item_name_indef 1, VAR_SPECIAL_x8004
	buffer_tmhm_move_name 2, VAR_SPECIAL_x8004
	npc_msg msg_0210_00006
	goto _046E
	end

_05B5:
	buffer_players_name 0
	buffer_item_name_indef 1, VAR_SPECIAL_x8004
	npc_msg msg_0210_00003
	goto _046E
	end

_05C8:
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0210_00004
	wait_button_or_walk_away
	setvar VAR_SPECIAL_RESULT, 0
	goto _043C
	end

	.balign 4, 0
