	.ifndef ASM_SCRIPT_INC
	.set ASM_SCRIPT_INC, 1
#pragma once
#include "constants/scrcmd.h"
    .option alignment off

	.macro scrdef offset
	.word \offset - . - 4
	.endm

	.macro scrdef_end
	.short SCRDEF_END
	.endm

	; Dummy command
	.macro snop
	.short 0
	.endm

	; Dummy command
	.macro dummy
	.short 1
	.endm

	; Exits script execution and returns control to the player
	.macro end
	.short 2
	.endm

	; Pauses for some frames, tracks the timer in a script variable
	.macro wait frames, var
	.short 3
	.short \frames
	.short \var
	.endm

	; Loads 8-bit value into the specified script register
	.macro loadbyte reg, val
	.short 4
	.byte \reg
	.byte \val
	.endm

	; Loads 32-bit value into the specified script register
	.macro loadword reg, val
	.short 5
	.byte \reg
	.word \val
	.endm

	; Reads byte at a specific memory address into a script register
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro loadbytefromaddr reg, addr
	.short 6
	.byte \reg
	.word \addr
	.endm

	; Writes byte to a specific memory address from a script register
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro writebytetoaddr addr, reg
	.short 7
	.word \addr
	.byte \reg
	.endm

	; Writes byte literal to a specific memory address
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro setptrbyte addr, val
	.short 8
	.word \addr
	.byte \val
	.endm

	; Copies a byte between script registers
	.macro copylocal to, from
	.short 9
	.byte \to
	.byte \from
	.endm

	; Copies a byte between two memory addresses
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro copybyte to, from
	.short 10
	.word \to
	.word \from
	.endm

	; Compares values between script reg and script reg
	.macro comparelocaltolocal a, b
	.short 11
	.byte \a
	.byte \b
	.endm

	; Compares script reg to byte literal
	.macro comparelocaltovalue reg, val
	.short 12
	.byte \reg
	.byte \val
	.endm

	; Compares script reg to memory address
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro comparelocaltoaddr reg, addr
	.short 13
	.byte \reg
	.word \addr
	.endm

	; Compares memory address to script reg
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro compareaddrtolocal addr, reg
	.short 14
	.word \addr
	.byte \reg
	.endm

	; Compares memory address to byte literal
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro compareaddrtovalue addr, val
	.short 15
	.word \addr
	.byte \val
	.endm

	; Compares bytes at two memory addresses
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro compareaddrtoaddr a, b
	.short 16
	.word \a
	.word \b
	.endm

	; Compares variable to 16-bit literal
	.macro comparevartovalue var, val
	.short 17
	.short \var
	.short \val
	.endm

	; Compares two variables
	.macro comparevartovar a, b
	.short 18
	.short \a
	.short \b
	.endm

	; Creates a new script context to run the indicated script asynchronously
	.macro runscript id
	.short 19
	.short \id
	.endm

	; Creates a new script context to run the indicated script and wait
	.macro callstd id
	.short 20
	.short \id
	.endm

	; Yield to parent context
	.macro restartcurrentscript
	.short 21
	.endm

	; Absolute branch to offset in script
	.macro goto dest
	.short 22
	.word \dest-.-4
	.endm

	; Branch to offset in script if interacting with a specific object
	.macro objectgoto object, dest
	.short 23
	.byte \object
	.word \dest-.-4
	.endm

	; Branch to offset in script if interacting with a specific bg event
	.macro bggoto bg, dest
	.short 24
	.byte \bg
	.word \dest-.-4
	.endm

	; Branch to offset in script if facing a specific direction
	.macro directiongoto dir, dest
	.short 25
	.byte \dir
	.word \dest-.-4
	.endm

	; Call script as a subroutine
	.macro call sub
	.short 26
	.word \sub-.-4
	.endm

	; Return from subroutine
	.macro return
	.short 27
	.endm

	; Conditional branch to offset in script
	.macro gotoif condition, dest
	.short 28
	.byte \condition
	.word \dest-.-4
	.endm

	; Conditional call subroutine
	.macro callif condition, sub
	.short 29
	.byte \condition
	.word \sub-.-4
	.endm

	; Set event flag
	.macro setflag flag
	.short 30
	.short \flag
	.endm

	; Clear event flag
	.macro clearflag flag
	.short 31
	.short \flag
	.endm

	; Check event flag, store result on context
	.macro checkflag flag
	.short 32
	.short \flag
	.endm

	; Set event flag referenced in var
	.macro setflagvar var
	.short 33
	.short \var
	.endm

	; Clear event flag referenced in var
	.macro clearflagvar var
	.short 34
	.short \var
	.endm

	; Check event flag referenced in var, store result in other var
	.macro checkflagvar var_flag, var_dest
	.short 35
	.short \var_flag
	.short \var_dest
	.endm

	; Set trainer defeated flag
	.macro settrainerflag var_or_trno
	.short 36
	.short \var_or_trno
	.endm

	; Clear trainer defeated flag
	.macro cleartrainerflag var_or_trno
	.short 37
	.short \var_or_trno
	.endm

	; Check trainer defeated flag, store result on context
	.macro checktrainerflag var_or_trno
	.short 38
	.short \var_or_trno
	.endm

	; Increment var value by value
	.macro addvar var, var_or_addend
	.short 39
	.short \var
	.short \var_or_addend
	.endm

	; Decrement var value by value
	.macro subvar var, var_or_addend
	.short 40
	.short \var
	.short \var_or_addend
	.endm

	; Set var to short literal
	.macro setvar var, val
	.short 41
	.short \var
	.short \val
	.endm

	; Set var from other var
	.macro copyvar dst, src
	.short 42
	.short \dst
	.short \src
	.endm

	; Set var from other var or short literal
	.macro setorcopyvar dst, src
	.short 43
	.short \dst
	.short \src
	.endm

	; Print message in field window from current map message bank
	.macro message msg_id
	.short 44
	.byte \msg_id
	.endm

	.macro msgbox a
	.short 45
	.byte \a
	.endm

	.macro scrcmd_046 arg0
	.short 46
	.short \arg0
	.endm

	.macro scrcmd_047 arg0
	.short 47
	.short \arg0
	.endm

	.macro scrcmd_048 arg0
	.short 48
	.byte \arg0
	.endm

	.macro scrcmd_049
	.short 49
	.endm

	.macro waitbutton
	.short 50
	.endm

	.macro scrcmd_051
	.short 51
	.endm

	.macro scrcmd_052
	.short 52
	.endm

	.macro closemsg
	.short 53
	.endm

	.macro scrcmd_054
	.short 54
	.endm

	.macro scrcmd_055 arg0, arg1, arg2, arg3
	.short 55
	.byte \arg0
	.byte \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_056 arg0, arg1
	.short 56
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_057 arg0
	.short 57
	.byte \arg0
	.endm

	.macro scrcmd_058
	.short 58
	.endm

	.macro scrcmd_059 arg0, arg1
	.short 59
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_060 arg0
	.short 60
	.short \arg0
	.endm

	.macro scrcmd_061
	.short 61
	.endm

	.macro scrcmd_062 arg0, arg1, arg2, arg3, arg4, arg5
	.short 62
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.byte \arg4
	.byte \arg5
	.endm

	.macro scrcmd_063 arg0
	.short 63
	.short \arg0
	.endm

	.macro scrcmd_064 arg0, arg1, arg2, arg3, arg4
	.short 64
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro scrcmd_065 arg0, arg1, arg2, arg3, arg4
	.short 65
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro scrcmd_066 arg0, arg1
	.short 66
	.byte \arg0
	.byte \arg1
	.endm

	.macro scrcmd_067
	.short 67
	.endm

	.macro scrcmd_068 arg0, arg1, arg2, arg3, arg4
	.short 68
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro scrcmd_069 arg0, arg1, arg2, arg3, arg4
	.short 69
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro scrcmd_070 arg0, arg1, arg2
	.short 70
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_071
	.short 71
	.endm

	.macro scrcmd_072 arg0
	.short 72
	.byte \arg0
	.endm

	.macro play_se arg0
	.short 73
	.short \arg0
	.endm

	.macro scrcmd_074 arg0
	.short 74
	.short \arg0
	.endm

	.macro wait_se arg0
	.short 75
	.short \arg0
	.endm

	.macro scrcmd_076 arg0, arg1
	.short 76
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_077
	.short 77
	.endm

	.macro scrcmd_078 arg0
	.short 78
	.short \arg0
	.endm

	.macro scrcmd_079
	.short 79
	.endm

	.macro scrcmd_080 arg0
	.short 80
	.short \arg0
	.endm

	.macro scrcmd_081 arg0
	.short 81
	.short \arg0
	.endm

	.macro scrcmd_082
	.short 82
	.endm

	.macro scrcmd_083 arg0
	.short 83
	.short \arg0
	.endm

	.macro scrcmd_084 arg0, arg1
	.short 84
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_085 arg0
	.short 85
	.short \arg0
	.endm

	.macro scrcmd_086 arg0, arg1
	.short 86
	.byte \arg0
	.byte \arg1
	.endm

	.macro scrcmd_087 arg0
	.short 87
	.short \arg0
	.endm

	.macro scrcmd_088 arg0
	.short 88
	.byte \arg0
	.endm

	.macro scrcmd_089 arg0
	.short 89
	.short \arg0
	.endm

	.macro scrcmd_090 arg0
	.short 90
	.short \arg0
	.endm

	.macro scrcmd_091
	.short 91
	.endm

	.macro scrcmd_092
	.short 92
	.endm

	.macro scrcmd_093
	.short 93
	.endm

	.macro apply_movement arg0, arg1
	.short 94
	.short \arg0
	.word \arg1-.-4
	.endm

	.macro wait_movement
	.short 95
	.endm

	.macro lockall
	.short 96
	.endm

	.macro releaseall
	.short 97
	.endm

	.macro scrcmd_098 arg0
	.short 98
	.short \arg0
	.endm

	.macro scrcmd_099 arg0
	.short 99
	.short \arg0
	.endm

	.macro scrcmd_100 arg0
	.short 100
	.short \arg0
	.endm

	.macro scrcmd_101 arg0
	.short 101
	.short \arg0
	.endm

	.macro scrcmd_102 arg0, arg1
	.short 102
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_103
	.short 103
	.endm

	.macro faceplayer
	.short 104
	.endm

	.macro scrcmd_105 arg0, arg1
	.short 105
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_106 arg0, arg1, arg2
	.short 106
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_107 arg0, arg1, arg2
	.short 107
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_108 arg0, arg1
	.short 108
	.short \arg0
	.byte \arg1
	.endm

	.macro scrcmd_109 arg0, arg1
	.short 109
	.short \arg0
	.short \arg1
	.endm

	.macro addmoney arg0
	.short 110
	.word \arg0
	.endm

	.macro submoneyimmediate arg0
	.short 111
	.word \arg0
	.endm

	.macro hasenoughmoneyimmediate arg0, arg1
	.short 112
	.short \arg0
	.word \arg1
	.endm

	.macro scrcmd_113 arg0, arg1
	.short 113
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_114
	.short 114
	.endm

	.macro scrcmd_115
	.short 115
	.endm

	.macro scrcmd_116 arg0, arg1, arg2
	.short 116
	.byte \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_117
	.short 117
	.endm

	.macro scrcmd_118 arg0
	.short 118
	.byte \arg0
	.endm

	.macro scrcmd_119 arg0
	.short 119
	.short \arg0
	.endm

	.macro scrcmd_120 arg0
	.short 120
	.short \arg0
	.endm

	.macro scrcmd_121 arg0
	.short 121
	.short \arg0
	.endm

	.macro scrcmd_122 arg0
	.short 122
	.short \arg0
	.endm

	.macro scrcmd_123 arg0
	.short 123
	.short \arg0
	.endm

	.macro scrcmd_124 arg0, arg1
	.short 124
	.short \arg0
	.short \arg1
	.endm

	.macro giveitem arg0, arg1, arg2
	.short 125
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro takeitem arg0, arg1, arg2
	.short 126
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro hasspaceforitem arg0, arg1, arg2
	.short 127
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro hasitem arg0, arg1, arg2
	.short 128
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro itemistmorhm arg0, arg1
	.short 129
	.short \arg0
	.short \arg1
	.endm

	.macro getitempocket arg0, arg1
	.short 130
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_131 arg0
	.short 131
	.short \arg0
	.endm

	.macro scrcmd_132 arg0, arg1
	.short 132
	.byte \arg0
	.byte \arg1
	.endm

	.macro scrcmd_133 arg0, arg1
	.short 133
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_134 arg0, arg1
	.short 134
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_135 arg0, arg1, arg2
	.short 135
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_136 arg0, arg1
	.short 136
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_137 arg0, arg1, arg2, arg3, arg4, arg5
	.short 137
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.short \arg5
	.endm

	.macro scrcmd_138 arg0, arg1
	.short 138
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_139 arg0, arg1, arg2
	.short 139
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_140 arg0, arg1, arg2
	.short 140
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_141 arg0, arg1
	.short 141
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_142 arg0, arg1
	.short 142
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_143 arg0
	.short 143
	.short \arg0
	.endm

	.macro scrcmd_144 arg0
	.short 144
	.short \arg0
	.endm

	.macro scrcmd_145 arg0
	.short 145
	.byte \arg0
	.endm

	.macro scrcmd_146 arg0
	.short 146
	.short \arg0
	.endm

	.macro scrcmd_147 arg0, arg1
	.short 147
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_148 arg0, arg1
	.short 148
	.byte \arg0
	.byte \arg1
	.endm

	.macro scrcmd_149 arg0
	.short 149
	.byte \arg0
	.endm

	.macro scrcmd_150
	.short 150
	.endm

	.macro scrcmd_151
	.short 151
	.endm

	.macro scrcmd_152
	.short 152
	.endm

	.macro scrcmd_153 arg0
	.short 153
	.short \arg0
	.endm

	.macro scrcmd_154 arg0, arg1, arg2
	.short 154
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_155 arg0, arg1
	.short 155
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_156
	.short 156
	.endm

	.macro scrcmd_157
	.short 157
	.endm

	.macro scrcmd_158 arg0
	.short 158
	.byte \arg0
	.endm

	.macro scrcmd_159
	.short 159
	.endm

	.macro scrcmd_160
	.short 160
	.endm

	.macro scrcmd_161
	.short 161
	.endm

	.macro scrcmd_162
	.short 162
	.endm

	.macro scrcmd_163 arg0
	.short 163
	.short \arg0
	.endm

	.macro scrcmd_164
	.short 164
	.endm

	.macro scrcmd_165 arg0, arg1
	.short 165
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_166 arg0
	.short 166
	.short \arg0
	.endm

	.macro scrcmd_167
	.short 167
	.endm

	.macro scrcmd_168 arg0
	.short 168
	.short \arg0
	.endm

	.macro scrcmd_169 arg0, arg1
	.short 169
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_170 arg0
	.short 170
	.short \arg0
	.endm

	.macro scrcmd_171 arg0, arg1
	.short 171
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_172 arg0
	.short 172
	.short \arg0
	.endm

	.macro scrcmd_173 arg0, arg1
	.short 173
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_174 arg0, arg1, arg2, arg3
	.short 174
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_175
	.short 175
	.endm

	.macro scrcmd_176 arg0, arg1, arg2, arg3, arg4
	.short 176
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro scrcmd_177 arg0
	.short 177
	.short \arg0
	.endm

	.macro scrcmd_178 arg0
	.short 178
	.short \arg0
	.endm

	.macro scrcmd_179 arg0
	.short 179
	.short \arg0
	.endm

	.macro scrcmd_180 arg0, arg1, arg2
	.short 180
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_181
	.short 181
	.endm

	.macro scrcmd_182 arg0
	.short 182
	.short \arg0
	.endm

	.macro scrcmd_183 arg0
	.short 183
	.short \arg0
	.endm

	.macro scrcmd_184 arg0
	.short 184
	.short \arg0
	.endm

	.macro scrcmd_185 arg0
	.short 185
	.byte \arg0
	.endm

	.macro scrcmd_186 arg0
	.short 186
	.byte \arg0
	.endm

	.macro scrcmd_187 arg0
	.short 187
	.short \arg0
	.endm

	.macro scrcmd_188 arg0
	.short 188
	.short \arg0
	.endm

	.macro scrcmd_189
	.short 189
	.endm

	.macro scrcmd_190 arg0
	.short 190
	.byte \arg0
	.endm

	.macro scrcmd_191 arg0
	.short 191
	.byte \arg0
	.endm

	.macro scrcmd_192 arg0
	.short 192
	.byte \arg0
	.endm

	.macro scrcmd_193 arg0, arg1
	.short 193
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_194 arg0, arg1
	.short 194
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_195 arg0, arg1
	.short 195
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_196 arg0, arg1
	.short 196
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_197 arg0, arg1
	.short 197
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_198 arg0, arg1
	.short 198
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_199 arg0, arg1
	.short 199
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_200 arg0, arg1
	.short 200
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_201 arg0
	.short 201
	.byte \arg0
	.endm

	.macro scrcmd_202 arg0, arg1, arg2, arg3
	.short 202
	.byte \arg0
	.short \arg1
	.short \arg2
	.byte \arg3
	.endm

	.macro scrcmd_203 arg0
	.short 203
	.byte \arg0
	.endm

	.macro scrcmd_204 arg0
	.short 204
	.byte \arg0
	.endm

	.macro scrcmd_205 arg0
	.short 205
	.byte \arg0
	.endm

	.macro scrcmd_206 arg0
	.short 206
	.short \arg0
	.endm

	.macro scrcmd_207 arg0, arg1
	.short 207
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_208 arg0, arg1
	.short 208
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_209 arg0, arg1
	.short 209
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_210 arg0, arg1
	.short 210
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_211 arg0, arg1
	.short 211
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_212 arg0
	.short 212
	.short \arg0
	.endm

	.macro scrcmd_213 arg0, arg1, arg2, arg3
	.short 213
	.short \arg0
	.short \arg1
	.byte \arg2
	.byte \arg3
	.endm

	.macro scrcmd_214 arg0, arg1
	.short 214
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_215 arg0, arg1, arg2
	.short 215
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_216 arg0, arg1, arg2
	.short 216
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_217 arg0
	.short 217
	.short \arg0
	.endm

	.macro scrcmd_218 arg0
	.short 218
	.short \arg0
	.endm

	.macro scrcmd_219
	.short 219
	.endm

	.macro scrcmd_220 arg0
	.short 220
	.short \arg0
	.endm

	.macro scrcmd_221 arg0, arg1
	.short 221
	.short \arg0
	.byte \arg1
	.endm

	.macro scrcmd_222 arg0
	.short 222
	.short \arg0
	.endm

	.macro scrcmd_223
	.short 223
	.endm

	.macro scrcmd_224
	.short 224
	.endm

	.macro scrcmd_225 arg0
	.short 225
	.word \arg0-.-4
	.endm

	.macro scrcmd_226 arg0, arg1, arg2, arg3
	.short 226
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_227 arg0, arg1, arg2, arg3
	.short 227
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_228 arg0
	.short 228
	.short \arg0
	.endm

	.macro scrcmd_229 arg0
	.short 229
	.short \arg0
	.endm

	.macro scrcmd_230
	.short 230
	.endm

	.macro scrcmd_231
	.short 231
	.endm

	.macro scrcmd_232 arg0
	.short 232
	.short \arg0
	.endm

	.macro scrcmd_233 arg0
	.short 233
	.short \arg0
	.endm

	.macro scrcmd_234 arg0, arg1, arg2, arg3
	.short 234
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_235 arg0
	.short 235
	.short \arg0
	.endm

	.macro scrcmd_236 arg0
	.short 236
	.short \arg0
	.endm

	.macro scrcmd_237
	.short 237
	.endm

	.macro scrcmd_238 arg0
	.short 238
	.short \arg0
	.endm

	.macro scrcmd_239 arg0, arg1
	.short 239
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_240 arg0, arg1, arg2, arg3, arg4
	.short 240
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro scrcmd_241 arg0
	.short 241
	.short \arg0
	.endm

	.macro scrcmd_242 arg0, arg1, arg2, arg3
	.short 242
	.byte \arg0
	.byte \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_243 arg0
	.short 243
	.short \arg0
	.endm

	.macro scrcmd_244 arg0
	.short 244
	.short \arg0
	.endm

	.macro scrcmd_245 arg0
	.short 245
	.short \arg0
	.endm

	.macro scrcmd_246 arg0
	.short 246
	.short \arg0
	.endm

	.macro scrcmd_247
	.short 247
	.endm

	.macro scrcmd_248 arg0, arg1, arg2
	.short 248
	.byte \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_249 arg0, arg1
	.short 249
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_250 arg0, arg1
	.short 250
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_251
	.short 251
	.endm

	.macro scrcmd_252
	.short 252
	.endm

	.macro scrcmd_253 arg0
	.short 253
	.short \arg0
	.endm

	.macro scrcmd_254 arg0
	.short 254
	.short \arg0
	.endm

	.macro scrcmd_255 arg0, arg1
	.short 255
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_256 arg0
	.short 256
	.short \arg0
	.endm

	.macro scrcmd_257 arg0
	.short 257
	.short \arg0
	.endm

	.macro scrcmd_258
	.short 258
	.endm

	.macro scrcmd_259 arg0
	.short 259
	.short \arg0
	.endm

	.macro scrcmd_260 arg0
	.short 260
	.short \arg0
	.endm

	.macro scrcmd_261 arg0
	.short 261
	.short \arg0
	.endm

	.macro scrcmd_262
	.short 262
	.endm

	.macro scrcmd_263
	.short 263
	.endm

	.macro scrcmd_264 arg0
	.short 264
	.short \arg0
	.endm

	.macro scrcmd_265
	.short 265
	.endm

	.macro scrcmd_266
	.short 266
	.endm

	.macro scrcmd_267 arg0, arg1
	.short 267
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_268 arg0
	.short 268
	.short \arg0
	.endm

	.macro scrcmd_269 arg0
	.short 269
	.short \arg0
	.endm

	.macro scrcmd_270
	.short 270
	.endm

	.macro scrcmd_271 arg0, arg1
	.short 271
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_272 arg0
	.short 272
	.short \arg0
	.endm

	.macro scrcmd_273 arg0
	.short 273
	.short \arg0
	.endm

	.macro scrcmd_274 arg0, arg1
	.short 274
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_275 arg0
	.short 275
	.short \arg0
	.endm

	.macro scrcmd_276 arg0
	.short 276
	.short \arg0
	.endm

	.macro scrcmd_277 arg0
	.short 277
	.short \arg0
	.endm

	.macro scrcmd_278 arg0
	.short 278
	.short \arg0
	.endm

	.macro scrcmd_279
	.short 279
	.endm

	.macro scrcmd_280 arg0
	.short 280
	.short \arg0
	.endm

	.macro scrcmd_281 arg0
	.short 281
	.short \arg0
	.endm

	.macro scrcmd_282
	.short 282
	.endm

	.macro scrcmd_283
	.short 283
	.endm

	.macro scrcmd_284
	.short 284
	.endm

	.macro scrcmd_285 arg0
	.short 285
	.short \arg0
	.endm

	.macro scrcmd_286
	.short 286
	.endm

	.macro scrcmd_287
	.short 287
	.endm

	.macro scrcmd_288 arg0, arg1
	.short 288
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_289 arg0
	.short 289
	.short \arg0
	.endm

	.macro scrcmd_290 arg0
	.short 290
	.short \arg0
	.endm

	.macro scrcmd_291
	.short 291
	.endm

	.macro scrcmd_292 arg0
	.short 292
	.short \arg0
	.endm

	.macro scrcmd_293
	.short 293
	.endm

	.macro scrcmd_294 arg0, arg1
	.short 294
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_295 arg0
	.short 295
	.short \arg0
	.endm

	.macro scrcmd_296 arg0
	.short 296
	.short \arg0
	.endm

	.macro scrcmd_297 arg0
	.short 297
	.short \arg0
	.endm

	.macro scrcmd_298
	.short 298
	.endm

	.macro scrcmd_299 arg0
	.short 299
	.short \arg0
	.endm

	.macro scrcmd_300
	.short 300
	.endm

	.macro scrcmd_301
	.short 301
	.endm

	.macro scrcmd_302 arg0
	.short 302
	.short \arg0
	.endm

	.macro scrcmd_303
	.short 303
	.endm

	.macro scrcmd_304
	.short 304
	.endm

	.macro scrcmd_305 arg0
	.short 305
	.short \arg0
	.endm

	.macro scrcmd_306
	.short 306
	.endm

	.macro scrcmd_307 arg0, arg1, arg2, arg3, arg4
	.short 307
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.byte \arg4
	.endm

	.macro scrcmd_308 arg0
	.short 308
	.byte \arg0
	.endm

	.macro scrcmd_309 arg0
	.short 309
	.byte \arg0
	.endm

	.macro scrcmd_310 arg0
	.short 310
	.byte \arg0
	.endm

	.macro scrcmd_311 arg0
	.short 311
	.byte \arg0
	.endm

	.macro scrcmd_312
	.short 312
	.endm

	.macro scrcmd_313 arg0
	.short 313
	.short \arg0
	.endm

	.macro scrcmd_314
	.short 314
	.endm

	.macro scrcmd_315
	.short 315
	.endm

	.macro scrcmd_316
	.short 316
	.endm

	.macro scrcmd_317 arg0
	.short 317
	.byte \arg0
	.endm

	.macro scrcmd_318
	.short 318
	.endm

	.macro scrcmd_319 arg0
	.short 319
	.short \arg0
	.endm

	.macro scrcmd_320
	.short 320
	.endm

	.macro scrcmd_321 arg0, arg1
	.short 321
	.byte \arg0
	.byte \arg1
	.endm

	.macro scrcmd_322 arg0, arg1
	.short 322
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_323
	.short 323
	.endm

	.macro scrcmd_324
	.short 324
	.endm

	.macro scrcmd_325
	.short 325
	.endm

	.macro scrcmd_326
	.short 326
	.endm

	.macro scrcmd_327 arg0
	.short 327
	.byte \arg0
	.endm

	.macro scrcmd_328 arg0
	.short 328
	.byte \arg0
	.endm

	.macro scrcmd_329
	.short 329
	.endm

	.macro scrcmd_330
	.short 330
	.endm

	.macro scrcmd_331
	.short 331
	.endm

	.macro scrcmd_332 arg0
	.short 332
	.short \arg0
	.endm

	.macro scrcmd_333 arg0
	.short 333
	.byte \arg0
	.endm

	.macro scrcmd_334 arg0
	.short 334
	.short \arg0
	.endm

	.macro scrcmd_335 arg0, arg1
	.short 335
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_336 arg0, arg1, arg2
	.short 336
	.byte \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_337 arg0, arg1
	.short 337
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_338 arg0, arg1, arg2
	.short 338
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_339 arg0, arg1, arg2, arg3, arg4
	.short 339
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro scrcmd_340 arg0, arg1
	.short 340
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_341 arg0, arg1
	.short 341
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_342 arg0, arg1, arg2
	.short 342
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_343 arg0, arg1, arg2
	.short 343
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_344 arg0, arg1
	.short 344
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_345
	.short 345
	.endm

	.macro scrcmd_346
	.short 346
	.endm

	.macro scrcmd_347 arg0
	.short 347
	.short \arg0
	.endm

	.macro scrcmd_348 arg0
	.short 348
	.short \arg0
	.endm

	.macro scrcmd_349
	.short 349
	.endm

	.macro scrcmd_350
	.short 350
	.endm

	.macro scrcmd_351 arg0
	.short 351
	.short \arg0
	.endm

	.macro scrcmd_352 arg0, arg1, arg2
	.short 352
	.byte \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_353 arg0, arg1
	.short 353
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_354 arg0, arg1
	.short 354
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_355 arg0, arg1
	.short 355
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_356 arg0
	.short 356
	.short \arg0
	.endm

	.macro scrcmd_357 arg0, arg1
	.short 357
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_358 arg0
	.short 358
	.short \arg0
	.endm

	.macro scrcmd_359 arg0
	.short 359
	.short \arg0
	.endm

	.macro submoneyvar arg0
	.short 360
	.short \arg0
	.endm

	.macro scrcmd_361 arg0, arg1
	.short 361
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_362 arg0, arg1, arg2
	.short 362
	.byte \arg0
	.byte \arg1
	.short \arg2
	.endm

	.macro scrcmd_363 arg0, arg1, arg2
	.short 363
	.byte \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_364 arg0
	.short 364
	.short \arg0
	.endm

	.macro scrcmd_365
	.short 365
	.endm

	.macro scrcmd_366
	.short 366
	.endm

	.macro scrcmd_367 arg0, arg1
	.short 367
	.short \arg0
	.short \arg1
	.endm

	.macro hasenoughmoneyvar arg0, arg1
	.short 368
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_369
	.short 369
	.endm

	.macro scrcmd_370 arg0
	.short 370
	.byte \arg0
	.endm

	.macro scrcmd_371 arg0, arg1
	.short 371
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_372 arg0
	.short 372
	.short \arg0
	.endm

	.macro scrcmd_373 arg0
	.short 373
	.short \arg0
	.endm

	.macro scrcmd_374 arg0
	.short 374
	.short \arg0
	.endm

	.macro scrcmd_375 arg0
	.short 375
	.short \arg0
	.endm

	.macro scrcmd_376
	.short 376
	.endm

	.macro scrcmd_377 arg0
	.short 377
	.short \arg0
	.endm

	.macro scrcmd_378 arg0, arg1
	.short 378
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_379 arg0
	.short 379
	.short \arg0
	.endm

	.macro scrcmd_380 arg0, arg1
	.short 380
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_381 arg0, arg1
	.short 381
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_382 arg0, arg1
	.short 382
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_383 arg0, arg1
	.short 383
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_384 arg0, arg1
	.short 384
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_385 arg0, arg1, arg2, arg3
	.short 385
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_386 arg0
	.short 386
	.short \arg0
	.endm

	.macro scrcmd_387 arg0
	.short 387
	.short \arg0
	.endm

	.macro scrcmd_388 arg0
	.short 388
	.short \arg0
	.endm

	.macro scrcmd_389 arg0, arg1
	.short 389
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_390 arg0, arg1
	.short 390
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_391 arg0
	.short 391
	.short \arg0
	.endm

	.macro scrcmd_392 arg0, arg1, arg2
	.short 392
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_393 arg0, arg1, arg2
	.short 393
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_394 arg0
	.short 394
	.short \arg0
	.endm

	.macro scrcmd_395 arg0
	.short 395
	.short \arg0
	.endm

	.macro scrcmd_396 arg0, arg1
	.short 396
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_397 arg0, arg1
	.short 397
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_398 arg0, arg1, arg2
	.short 398
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_399 arg0, arg1, arg2
	.short 399
	.byte \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_400 arg0, arg1=0
	.short 400
	.byte \arg0
	.if \arg0 == 2
	.short \arg1
	.endif
	.endm

	.macro scrcmd_401 arg0, arg1
	.short 401
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_402 arg0, arg1
	.short 402
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_403 arg0, arg1
	.short 403
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_404 arg0, arg1, arg2
	.short 404
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_405 arg0, arg1, arg2
	.short 405
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_406 arg0
	.short 406
	.short \arg0
	.endm

	.macro scrcmd_407 arg0, arg1
	.short 407
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_408 arg0, arg1
	.short 408
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_409
	.short 409
	.endm

	.macro scrcmd_410 arg0, arg1
	.short 410
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_411
	.short 411
	.endm

	.macro scrcmd_412 arg0, arg1, arg2
	.short 412
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_413 arg0, arg1, arg2, arg3
	.short 413
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_414 arg0
	.short 414
	.short \arg0
	.endm

	.macro scrcmd_415 arg0
	.short 415
	.short \arg0
	.endm

	.macro scrcmd_416 arg0, arg1, arg2
	.short 416
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_417 arg0, arg1
	.short 417
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_418 arg0, arg1
	.short 418
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_419 arg0
	.short 419
	.short \arg0
	.endm

	.macro scrcmd_420 arg0
	.short 420
	.short \arg0
	.endm

	.macro scrcmd_421 arg0, arg1, arg2
	.short 421
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_422 arg0, arg1, arg2, arg3
	.short 422
	.short \arg0
	.short \arg1
	.short \arg2
	.byte \arg3
	.endm

	.macro scrcmd_423 arg0
	.short 423
	.short \arg0
	.endm

	.macro scrcmd_424 arg0
	.short 424
	.short \arg0
	.endm

	.macro scrcmd_425 arg0
	.short 425
	.short \arg0
	.endm

	.macro scrcmd_426 arg0, arg1, arg2
	.short 426
	.short \arg0
	.short \arg1
	.byte \arg2
	.endm

	.macro scrcmd_427 arg0
	.short 427
	.short \arg0
	.endm

	.macro scrcmd_428 arg0
	.short 428
	.short \arg0
	.endm

	.macro countfossils arg0
	.short 429
	.short \arg0
	.endm

	.macro scrcmd_430 arg0, arg1, arg2
	.short 430
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_431
	.short 431
	.endm

	.macro getfossilpokemon arg0, arg1
	.short 432
	.short \arg0
	.short \arg1
	.endm

	.macro getfossilminimumamount arg0, arg1, arg2
	.short 433
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_434 arg0, arg1
	.short 434
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_435 arg0, arg1
	.short 435
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_436
	.short 436
	.endm

	.macro debugwatch arg0
	.short 437
	.short \arg0
	.endm

	.macro scrcmd_438 arg0, arg1
	.short 438
	.short \arg0
	.short \arg1
	.endm

	.macro message_extern arg0, arg1
	.short 439
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_440 arg0, arg1
	.short 440
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_441 arg0, arg1, arg2, arg3
	.short 441
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_442 arg0, arg1, arg2, arg3
	.short 442
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_443 arg0
	.short 443
	.byte \arg0
	.endm

	.macro scrcmd_444 arg0, arg1, arg2, arg3
	.short 444
	.byte \arg0
	.short \arg1
	.short \arg2
	.byte \arg3
	.endm

	.macro scrcmd_445 arg0
	.short 445
	.short \arg0
	.endm

	.macro scrcmd_446 arg0
	.short 446
	.short \arg0
	.endm

	.macro scrcmd_447 arg0, arg1
	.short 447
	.byte \arg0
	.byte \arg1
	.endm

	.macro scrcmd_448 arg0, arg1, arg2, arg3, arg4
	.short 448
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro scrcmd_449
	.short 449
	.endm

	.macro scrcmd_450
	.short 450
	.endm

	.macro scrcmd_451 arg0
	.short 451
	.short \arg0
	.endm

	.macro scrcmd_452 arg0, arg1
	.short 452
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_453
	.short 453
	.endm

	.macro scrcmd_454
	.short 454
	.endm

	.macro scrcmd_455
	.short 455
	.endm

	.macro scrcmd_456 arg0
	.short 456
	.byte \arg0
	.endm

	.macro scrcmd_457 arg0, arg1
	.short 457
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_458 arg0, arg1
	.short 458
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_459
	.short 459
	.endm

	.macro scrcmd_460 arg0, arg1
	.short 460
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_461 arg0, arg1, arg2
	.short 461
	.byte \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_462 arg0
	.short 462
	.short \arg0
	.endm

	.macro scrcmd_463
	.short 463
	.endm

	.macro scrcmd_464 arg0
	.short 464
	.byte \arg0
	.endm

	.macro scrcmd_465 arg0, arg1=0, arg2=0
	.short 465
	.short \arg0
	.if \arg0 <= 3
		.short \arg1
		.short \arg2
	.else
		.if \arg0 != 6
			.short \arg1
		.endif
	.endif
	.endm

	.macro scrcmd_466 arg0, arg1
	.short 466
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_467 arg0
	.short 467
	.short \arg0
	.endm

	.macro scrcmd_468 arg0, arg1
	.short 468
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_469 arg0
	.short 469
	.short \arg0
	.endm

	.macro scrcmd_470 arg0
	.short 470
	.byte \arg0
	.endm

	.macro scrcmd_471 arg0
	.short 471
	.short \arg0
	.endm

	.macro scrcmd_472 arg0
	.short 472
	.short \arg0
	.endm

	.macro scrcmd_473 arg0
	.short 473
	.short \arg0
	.endm

	.macro scrcmd_474
	.short 474
	.endm

	.macro scrcmd_475
	.short 475
	.endm

	.macro scrcmd_476
	.short 476
	.endm

	.macro scrcmd_477 arg0, arg1
	.short 477
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_478 arg0, arg1
	.short 478
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_479 arg0
	.short 479
	.short \arg0
	.endm

	.macro scrcmd_480 arg0, arg1, arg2
	.short 480
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_481 arg0, arg1
	.short 481
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_482 arg0, arg1
	.short 482
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_483 arg0, arg1
	.short 483
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_484 arg0
	.short 484
	.short \arg0
	.endm

	.macro scrcmd_485 arg0
	.short 485
	.short \arg0
	.endm

	.macro dummy_486
	.short 486
	.endm

	.macro scrcmd_487 arg0
	.short 487
	.short \arg0
	.endm

	.macro scrcmd_488 arg0, arg1
	.short 488
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_489 arg0, arg1=0, arg2=0
	.short 489
	.short \arg0
	.if \arg0 >= 1 && \arg0 <= 3
	.short \arg1
	.else
	.if \arg0 == 5 || \arg0 == 6
	.short \arg1
	.short \arg2
	.endif
	.endif
	.endm

	.macro scrcmd_490 arg0
	.short 490
	.short \arg0
	.endm

	.macro scrcmd_491 arg0
	.short 491
	.short \arg0
	.endm

	.macro scrcmd_492 arg0, arg1, arg2
	.short 492
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_493 arg0, arg1, arg2
	.short 493
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_494 arg0, arg1
	.short 494
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_495 arg0
	.short 495
	.short \arg0
	.endm

	.macro scrcmd_496 arg0
	.short 496
	.short \arg0
	.endm

	.macro scrcmd_497 arg0, arg1, arg2
	.short 497
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_498 arg0, arg1, arg2, arg3, arg4
	.short 498
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro scrcmd_499 arg0, arg1, arg2, arg3, arg4
	.short 499
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro scrcmd_500 arg0
	.short 500
	.byte \arg0
	.endm

	.macro scrcmd_501 arg0
	.short 501
	.byte \arg0
	.endm

	.macro scrcmd_502 arg0
	.short 502
	.byte \arg0
	.endm

	.macro scrcmd_503 arg0
	.short 503
	.short \arg0
	.endm

	.macro scrcmd_504 arg0, arg1, arg2, arg3
	.short 504
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_505
	.short 505
	.endm

	.macro scrcmd_506 arg0, arg1
	.short 506
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_507 arg0
	.short 507
	.short \arg0
	.endm

	.macro scrcmd_508 arg0
	.short 508
	.short \arg0
	.endm

	.macro scrcmd_509 arg0
	.short 509
	.short \arg0
	.endm

	.macro scrcmd_510
	.short 510
	.endm

	.macro scrcmd_511 arg0, arg1
	.short 511
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_512
	.short 512
	.endm

	.macro scrcmd_513
	.short 513
	.endm

	.macro scrcmd_514 arg0
	.short 514
	.short \arg0
	.endm

	.macro scrcmd_515 arg0
	.short 515
	.short \arg0
	.endm

	.macro scrcmd_516 arg0, arg1
	.short 516
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_517 arg0, arg1
	.short 517
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_518 arg0
	.short 518
	.short \arg0
	.endm

	.macro scrcmd_519 arg0
	.short 519
	.short \arg0
	.endm

	.macro scrcmd_520
	.short 520
	.endm

	.macro scrcmd_521
	.short 521
	.endm

	.macro scrcmd_522 arg0
	.short 522
	.short \arg0
	.endm

	.macro scrcmd_523 arg0, arg1, arg2, arg3, arg4
	.short 523
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro scrcmd_524 arg0, arg1, arg2
	.short 524
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_525 arg0
	.short 525
	.short \arg0
	.endm

	.macro scrcmd_526 arg0
	.short 526
	.short \arg0
	.endm

	.macro scrcmd_527 arg0
	.short 527
	.short \arg0
	.endm

	.macro scrcmd_528 arg0
	.short 528
	.short \arg0
	.endm

	.macro scrcmd_529 arg0
	.short 529
	.short \arg0
	.endm

	.macro scrcmd_530 arg0, arg1
	.short 530
	.short \arg0
	.byte \arg1
	.endm

	.macro scrcmd_531 arg0, arg1
	.short 531
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_532 arg0, arg1
	.short 532
	.short \arg0
	.word \arg1
	.endm

	.macro checkgivecoins arg0, arg1
	.short 533
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_534 arg0
	.short 534
	.short \arg0
	.endm

	.macro scrcmd_535 arg0, arg1
	.short 535
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_536 arg0, arg1
	.short 536
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_537
	.short 537
	.endm

	.macro scrcmd_538 arg0, arg1
	.short 538
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_539 arg0
	.short 539
	.short \arg0
	.endm

	.macro scrcmd_540 arg0
	.short 540
	.short \arg0
	.endm

	.macro scrcmd_541 arg0, arg1, arg2, arg3
	.short 541
	.byte \arg0
	.short \arg1
	.byte \arg2
	.byte \arg3
	.endm

	.macro scrcmd_542 arg0, arg1, arg2
	.short 542
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_543 arg0
	.short 543
	.short \arg0
	.endm

	.macro scrcmd_544 arg0, arg1
	.short 544
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_545 arg0
	.short 545
	.short \arg0
	.endm

	.macro scrcmd_546 arg0, arg1
	.short 546
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_547 arg0
	.short 547
	.short \arg0
	.endm

	.macro scrcmd_548
	.short 548
	.endm

	.macro scrcmd_549 arg0
	.short 549
	.short \arg0
	.endm

	.macro scrcmd_550 arg0
	.short 550
	.short \arg0
	.endm

	.macro scrcmd_551 arg0
	.short 551
	.short \arg0
	.endm

	.macro scrcmd_552 arg0, arg1
	.short 552
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_553 arg0, arg1
	.short 553
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_554 arg0
	.short 554
	.short \arg0
	.endm

	.macro scrcmd_555 arg0
	.short 555
	.short \arg0
	.endm

	.macro scrcmd_556 arg0
	.short 556
	.short \arg0
	.endm

	.macro scrcmd_557 arg0, arg1
	.short 557
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_558 arg0, arg1
	.short 558
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_559 arg0, arg1
	.short 559
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_560 arg0, arg1
	.short 560
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_561 arg0, arg1, arg2, arg3
	.short 561
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_562 arg0, arg1, arg2, arg3
	.short 562
	.short \arg0
	.short \arg1
	.short \arg2
	.byte \arg3
	.endm

	.macro scrcmd_563 arg0, arg1, arg2
	.short 563
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_564 arg0
	.short 564
	.short \arg0
	.endm

	.macro scrcmd_565 arg0
	.short 565
	.short \arg0
	.endm

	.macro scrcmd_566
	.short 566
	.endm

	.macro scrcmd_567 arg0, arg1, arg2
	.short 567
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_568 arg0, arg1
	.short 568
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_569 arg0
	.short 569
	.short \arg0
	.endm

	.macro scrcmd_570 arg0, arg1
	.short 570
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_571 arg0, arg1, arg2, arg3, arg4
	.short 571
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro scrcmd_572 arg0
	.short 572
	.short \arg0
	.endm

	.macro scrcmd_573
	.short 573
	.endm

	.macro scrcmd_574 arg0, arg1
	.short 574
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_575 arg0, arg1
	.short 575
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_576 arg0
	.short 576
	.short \arg0
	.endm

	.macro scrcmd_577
	.short 577
	.endm

	.macro scrcmd_578
	.short 578
	.endm

	.macro scrcmd_579
	.short 579
	.endm

	.macro scrcmd_580 arg0, arg1
	.short 580
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_581
	.short 581
	.endm

	.macro scrcmd_582 arg0, arg1, arg2
	.short 582
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_583 arg0, arg1
	.short 583
	.short \arg0
	.byte \arg1
	.endm

	.macro scrcmd_584 arg0
	.short 584
	.short \arg0
	.endm

	.macro scrcmd_585
	.short 585
	.endm

	.macro scrcmd_586 arg0
	.short 586
	.short \arg0
	.endm

	.macro scrcmd_587
	.short 587
	.endm

	.macro scrcmd_588 arg0
	.short 588
	.short \arg0
	.endm

	.macro scrcmd_589 arg0, arg1, arg2
	.short 589
	.short \arg0
	.short \arg1
	.byte \arg2
	.endm

	.macro scrcmd_590 arg0
	.short 590
	.short \arg0
	.endm

	.macro scrcmd_591
	.short 591
	.endm

	.macro scrcmd_592 arg0
	.short 592
	.short \arg0
	.endm

	.macro scrcmd_593
	.short 593
	.endm

	.macro scrcmd_594
	.short 594
	.endm

	.macro scrcmd_595 arg0
	.short 595
	.byte \arg0
	.endm

	.macro scrcmd_596 arg0
	.short 596
	.short \arg0
	.endm

	.macro scrcmd_597
	.short 597
	.endm

	.macro scrcmd_598 arg0
	.short 598
	.short \arg0
	.endm

	.macro scrcmd_599
	.short 599
	.endm

	.macro scrcmd_600
	.short 600
	.endm

	.macro scrcmd_601
	.short 601
	.endm

	.macro scrcmd_602 arg0
	.short 602
	.short \arg0
	.endm

	.macro scrcmd_603
	.short 603
	.endm

	.macro scrcmd_604 arg0
	.short 604
	.short \arg0
	.endm

	.macro scrcmd_605 arg0, arg1
	.short 605
	.byte \arg0
	.byte \arg1
	.endm

	.macro scrcmd_606
	.short 606
	.endm

	.macro scrcmd_607
	.short 607
	.endm

	.macro scrcmd_608
	.short 608
	.endm

	.macro scrcmd_609
	.short 609
	.endm

	.macro scrcmd_610 arg0
	.short 610
	.short \arg0
	.endm

	.macro scrcmd_611 arg0, arg1, arg2, arg3, arg4, arg5, arg6
	.short 611
	.byte \arg0
	.byte \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.short \arg5
	.short \arg6
	.endm

	.macro scrcmd_612 arg0
	.short 612
	.short \arg0
	.endm

	.macro scrcmd_613 arg0
	.short 613
	.short \arg0
	.endm

	.macro scrcmd_614 arg0
	.short 614
	.short \arg0
	.endm

	.macro scrcmd_615 arg0
	.short 615
	.short \arg0
	.endm

	.macro scrcmd_616 arg0
	.short 616
	.short \arg0
	.endm

	.macro scrcmd_617
	.short 617
	.endm

	.macro scrcmd_618 arg0
	.short 618
	.short \arg0
	.endm

	.macro scrcmd_619 arg0
	.short 619
	.short \arg0
	.endm

	.macro scrcmd_620 arg0
	.short 620
	.byte \arg0
	.endm

	.macro scrcmd_621
	.short 621
	.endm

	.macro scrcmd_622 arg0, arg1
	.short 622
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_623 arg0
	.short 623
	.short \arg0
	.endm

	.macro scrcmd_624 arg0
	.short 624
	.short \arg0
	.endm

	.macro scrcmd_625 arg0, arg1, arg2
	.short 625
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_626 arg0, arg1
	.short 626
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_627 arg0
	.short 627
	.byte \arg0
	.endm

	.macro scrcmd_628 arg0, arg1
	.short 628
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_629
	.short 629
	.endm

	.macro scrcmd_630 arg0
	.short 630
	.short \arg0
	.endm

	.macro scrcmd_631 arg0, arg1, arg2
	.short 631
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_632 arg0, arg1
	.short 632
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_633 arg0, arg1, arg2
	.short 633
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_634 arg0, arg1
	.short 634
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_635 arg0, arg1
	.short 635
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_636 arg0
	.short 636
	.short \arg0
	.endm

	.macro scrcmd_637 arg0, arg1, arg2
	.short 637
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_638 arg0, arg1, arg2
	.short 638
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_639 arg0, arg1, arg2
	.short 639
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_640 arg0
	.short 640
	.short \arg0
	.endm

	.macro scrcmd_641
	.short 641
	.endm

	.macro scrcmd_642 arg0
	.short 642
	.short \arg0
	.endm

	.macro scrcmd_643 arg0, arg1, arg2
	.short 643
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_644 arg0, arg1, arg2
	.short 644
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_645 arg0, arg1, arg2
	.short 645
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_646 arg0
	.short 646
	.short \arg0
	.endm

	.macro scrcmd_647 arg0, arg1
	.short 647
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_648 arg0, arg1, arg2, arg3, arg4
	.short 648
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro scrcmd_649
	.short 649
	.endm

	.macro scrcmd_650
	.short 650
	.endm

	.macro scrcmd_651 arg0, arg1, arg2
	.short 651
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_652 arg0, arg1, arg2
	.short 652
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_653 arg0, arg1, arg2, arg3
	.short 653
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_654 arg0, arg1, arg2
	.short 654
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_655 arg0, arg1
	.short 655
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_656 arg0, arg1
	.short 656
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_657 arg0, arg1, arg2, arg3
	.short 657
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_658 arg0, arg1
	.short 658
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_659 arg0, arg1
	.short 659
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_660 arg0, arg1
	.short 660
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_661 arg0, arg1, arg2, arg3
	.short 661
	.byte \arg0
	.word \arg1
	.byte \arg2
	.byte \arg3
	.endm

	.macro scrcmd_662 arg0, arg1, arg2
	.short 662
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_663 arg0
	.short 663
	.short \arg0
	.endm

	.macro scrcmd_664
	.short 664
	.endm

	.macro scrcmd_665 arg0
	.short 665
	.short \arg0
	.endm

	.macro scrcmd_666 arg0
	.short 666
	.short \arg0
	.endm

	.macro scrcmd_667 arg0
	.short 667
	.short \arg0
	.endm

	.macro scrcmd_668 arg0, arg1
	.short 668
	.byte \arg0
	.short \arg1
	.endm

	.macro getitemquantity arg0, arg1
	.short 669
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_670 arg0, arg1
	.short 670
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_671
	.short 671
	.endm

	.macro scrcmd_672 arg0, arg1, arg2
	.short 672
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_673 arg0, arg1, arg2, arg3, arg4
	.short 673
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro scrcmd_674 arg0, arg1
	.short 674
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_675 arg0, arg1, arg2, arg3
	.short 675
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_676 arg0, arg1
	.short 676
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_677 arg0, arg1
	.short 677
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_678 arg0, arg1
	.short 678
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_679
	.short 679
	.endm

	.macro scrcmd_680 arg0
	.short 680
	.short \arg0
	.endm

	.macro scrcmd_681 arg0
	.short 681
	.short \arg0
	.endm

	.macro scrcmd_682 arg0
	.short 682
	.short \arg0
	.endm

	.macro scrcmd_683 arg0
	.short 683
	.short \arg0
	.endm

	.macro scrcmd_684 arg0
	.short 684
	.short \arg0
	.endm

	.macro scrcmd_685 arg0, arg1, arg2
	.short 685
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_686 arg0, arg1
	.short 686
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_687 arg0
	.short 687
	.short \arg0
	.endm

	.macro scrcmd_688 arg0, arg1
	.short 688
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_689 arg0
	.short 689
	.short \arg0
	.endm

	.macro scrcmd_690 arg0, arg1
	.short 690
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_691 arg0
	.short 691
	.short \arg0
	.endm

	.macro scrcmd_692 arg0, arg1, arg2, arg3, arg4, arg5
	.short 692
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.short \arg5
	.endm

	.macro scrcmd_693 arg0
	.short 693
	.short \arg0
	.endm

	.macro scrcmd_694 arg0
	.short 694
	.short \arg0
	.endm

	.macro scrcmd_695 arg0
	.short 695
	.short \arg0
	.endm

	.macro scrcmd_696 arg0
	.short 696
	.short \arg0
	.endm

	.macro scrcmd_697 arg0
	.short 697
	.short \arg0
	.endm

	.macro scrcmd_698 arg0, arg1, arg2
	.short 698
	.byte \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_699
	.short 699
	.endm

	.macro scrcmd_700
	.short 700
	.endm

	.macro scrcmd_701 arg0, arg1
	.short 701
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_702
	.short 702
	.endm

	.macro scrcmd_703 arg0
	.short 703
	.short \arg0
	.endm

	.macro scrcmd_704 arg0, arg1
	.short 704
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_705 arg0, arg1
	.short 705
	.short \arg0
	.word \arg1
	.endm

	.macro scrcmd_706 arg0
	.short 706
	.short \arg0
	.endm

	.macro scrcmd_707 arg0, arg1
	.short 707
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_708 arg0
	.short 708
	.short \arg0
	.endm

	.macro scrcmd_709
	.short 709
	.endm

	.macro scrcmd_710
	.short 710
	.endm

	.macro scrcmd_711
	.short 711
	.endm

	.macro scrcmd_712 arg0
	.short 712
	.byte \arg0
	.endm

	.macro scrcmd_713 arg0
	.short 713
	.byte \arg0
	.endm

	.macro scrcmd_714 arg0
	.short 714
	.byte \arg0
	.endm

	.macro scrcmd_715
	.short 715
	.endm

	.macro scrcmd_716
	.short 716
	.endm

	.macro scrcmd_717 arg0
	.short 717
	.short \arg0
	.endm

	.macro scrcmd_718 arg0, arg1
	.short 718
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_719 arg0, arg1
	.short 719
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_720 arg0
	.short 720
	.short \arg0
	.endm

	.macro scrcmd_721 arg0
	.short 721
	.short \arg0
	.endm

	.macro scrcmd_722 arg0, arg1, arg2, arg3, arg4
	.short 722
	.byte \arg0
	.byte \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro scrcmd_723 arg0, arg1, arg2, arg3, arg4
	.short 723
	.byte \arg0
	.byte \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro scrcmd_724 arg0, arg1
	.short 724
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_725 arg0, arg1
	.short 725
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_726
	.short 726
	.endm

	.macro scrcmd_727 arg0
	.short 727
	.short \arg0
	.endm

	.macro scrcmd_728 arg0, arg1
	.short 728
	.byte \arg0
	.byte \arg1
	.endm

	.macro scrcmd_729 arg0
	.short 729
	.short \arg0
	.endm

	.macro scrcmd_730 arg0
	.short 730
	.short \arg0
	.endm

	.macro scrcmd_731
	.short 731
	.endm

	.macro scrcmd_732 arg0
	.short 732
	.byte \arg0
	.endm

	.macro scrcmd_733 arg0, arg1
	.short 733
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_734 arg0
	.short 734
	.byte \arg0
	.endm

	.macro scrcmd_735 arg0
	.short 735
	.short \arg0
	.endm

	.macro scrcmd_736
	.short 736
	.endm

	.macro scrcmd_737 arg0
	.short 737
	.short \arg0
	.endm

	.macro scrcmd_738 arg0
	.short 738
	.short \arg0
	.endm

	.macro scrcmd_739
	.short 739
	.endm

	.macro scrcmd_740 arg0, arg1
	.short 740
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_741 arg0, arg1, arg2, arg3
	.short 741
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro scrcmd_742 arg0, arg1, arg2
	.short 742
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_743 arg0
	.short 743
	.short \arg0
	.endm

	.macro scrcmd_744
	.short 744
	.endm

	.macro scrcmd_745 arg0, arg1
	.short 745
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_746
	.short 746
	.endm

	.macro scrcmd_747
	.short 747
	.endm

	.macro scrcmd_748 arg0
	.short 748
	.short \arg0
	.endm

	.macro scrcmd_749 arg0, arg1, arg2, arg3, arg4
	.short 749
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro scrcmd_750 arg0, arg1, arg2, arg3, arg4
	.short 750
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro scrcmd_751 arg0, arg1, arg2
	.short 751
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_752
	.short 752
	.endm

	.macro scrcmd_753 arg0, arg1, arg2
	.short 753
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_754 arg0
	.short 754
	.short \arg0
	.endm

	.macro scrcmd_755
	.short 755
	.endm

	.macro scrcmd_756
	.short 756
	.endm

	.macro scrcmd_757
	.short 757
	.endm

	.macro scrcmd_758 arg0
	.short 758
	.short \arg0
	.endm

	.macro scrcmd_759
	.short 759
	.endm

	.macro scrcmd_760
	.short 760
	.endm

	.macro scrcmd_761 arg0
	.short 761
	.short \arg0
	.endm

	.macro scrcmd_762 arg0
	.short 762
	.short \arg0
	.endm

	.macro scrcmd_763
	.short 763
	.endm

	.macro scrcmd_764
	.short 764
	.endm

	.macro scrcmd_765
	.short 765
	.endm

	.macro scrcmd_766
	.short 766
	.endm

	.macro scrcmd_767
	.short 767
	.endm

	.macro scrcmd_768
	.short 768
	.endm

	.macro scrcmd_769
	.short 769
	.endm

	.macro scrcmd_770 arg0
	.short 770
	.short \arg0
	.endm

	.macro scrcmd_771
	.short 771
	.endm

	.macro scrcmd_772
	.short 772
	.endm

	.macro scrcmd_773 arg0
	.short 773
	.short \arg0
	.endm

	.macro scrcmd_774 arg0
	.short 774
	.short \arg0
	.endm

	.macro scrcmd_775 arg0, arg1
	.short 775
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_776
	.short 776
	.endm

	.macro scrcmd_777 arg0, arg1
	.short 777
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_778
	.short 778
	.endm

	.macro scrcmd_779 arg0, arg1
	.short 779
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_780 arg0, arg1
	.short 780
	.byte \arg0
	.byte \arg1
	.endm

	.macro scrcmd_781 arg0
	.short 781
	.short \arg0
	.endm

	.macro scrcmd_782
	.short 782
	.endm

	.macro scrcmd_783 arg0
	.short 783
	.byte \arg0
	.endm

	.macro scrcmd_784 arg0, arg1
	.short 784
	.byte \arg0
	.byte \arg1
	.endm

	.macro scrcmd_785 arg0, arg1
	.short 785
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_786 arg0
	.short 786
	.byte \arg0
	.endm

	.macro scrcmd_787 arg0, arg1, arg2
	.short 787
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro scrcmd_788 arg0, arg1
	.short 788
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_789 arg0
	.short 789
	.byte \arg0
	.endm

	.macro scrcmd_790 arg0, arg1
	.short 790
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_791 arg0, arg1
	.short 791
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_792
	.short 792
	.endm

	.macro scrcmd_793 arg0, arg1
	.short 793
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_794 arg0, arg1
	.short 794
	.short \arg0
	.word \arg1
	.endm

	.macro scrcmd_795 arg0, arg1
	.short 795
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_796
	.short 796
	.endm

	.macro scrcmd_797
	.short 797
	.endm

	.macro scrcmd_798 arg0
	.short 798
	.short \arg0
	.endm

	.macro scrcmd_799 arg0
	.short 799
	.short \arg0
	.endm

	.macro scrcmd_800 arg0
	.short 800
	.short \arg0
	.endm

	.macro scrcmd_801 arg0
	.short 801
	.short \arg0
	.endm

	.macro scrcmd_802
	.short 802
	.endm

	.macro scrcmd_803 arg0, arg1
	.short 803
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_804 arg0
	.short 804
	.byte \arg0
	.endm

	.macro scrcmd_805
	.short 805
	.endm

	.macro scrcmd_806
	.short 806
	.endm

	.macro scrcmd_807 arg0, arg1
	.short 807
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_808 arg0
	.short 808
	.short \arg0
	.endm

	.macro scrcmd_809 arg0
	.short 809
	.short \arg0
	.endm

	.macro scrcmd_810
	.short 810
	.endm

	.macro scrcmd_811 arg0, arg1
	.short 811
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_812
	.short 812
	.endm

	.macro scrcmd_813 arg0
	.short 813
	.short \arg0
	.endm

	.macro scrcmd_814
	.short 814
	.endm

	.macro scrcmd_815 arg0
	.short 815
	.short \arg0
	.endm

	.macro scrcmd_816
	.short 816
	.endm

	.macro scrcmd_817 arg0
	.short 817
	.byte \arg0
	.endm

	.macro scrcmd_818
	.short 818
	.endm

	.macro scrcmd_819
	.short 819
	.endm

	.macro scrcmd_820 arg0
	.short 820
	.byte \arg0
	.endm

	.macro scrcmd_821 arg0, arg1
	.short 821
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_822
	.short 822
	.endm

	.macro scrcmd_823 arg0
	.short 823
	.short \arg0
	.endm

	.macro scrcmd_824 arg0
	.short 824
	.short \arg0
	.endm

	.macro scrcmd_825 arg0, arg1
	.short 825
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_826 arg0
	.short 826
	.short \arg0
	.endm

	.macro scrcmd_827 arg0, arg1
	.short 827
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_828 arg0, arg1, arg2
	.short 828
	.short \arg0
	.byte \arg1
	.short \arg2
	.endm

	.macro scrcmd_829 arg0
	.short 829
	.short \arg0
	.endm

	.macro scrcmd_830 arg0
	.short 830
	.short \arg0
	.endm

	.macro scrcmd_831 arg0
	.short 831
	.short \arg0
	.endm

	.macro scrcmd_832 arg0
	.short 832
	.short \arg0
	.endm

	.macro scrcmd_833 arg0
	.short 833
	.short \arg0
	.endm

	.macro scrcmd_834 arg0
	.short 834
	.short \arg0
	.endm

	.macro scrcmd_835 arg0
	.short 835
	.short \arg0
	.endm

	.macro scrcmd_836 arg0
	.short 836
	.short \arg0
	.endm

	.macro scrcmd_837 arg0
	.short 837
	.short \arg0
	.endm

	.macro scrcmd_838 arg0, arg1
	.short 838
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_839 arg0
	.short 839
	.short \arg0
	.endm

	.macro scrcmd_840 arg0, arg1
	.short 840
	.short \arg0
	.short \arg1
	.endm

	.macro scrcmd_841 arg0
	.short 841
	.byte \arg0
	.endm

	.macro scrcmd_842 arg0
	.short 842
	.byte \arg0
	.endm

	.macro scrcmd_843 arg0, arg1
	.short 843
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_844 arg0, arg1
	.short 844
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_845 arg0, arg1
	.short 845
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_846 arg0, arg1, arg2, arg3
	.short 846
	.byte \arg0
	.short \arg1
	.short \arg2
	.byte \arg3
	.endm

	.macro scrcmd_847 arg0
	.short 847
	.byte \arg0
	.endm

	.macro scrcmd_848 arg0, arg1
	.short 848
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_849 arg0, arg1
	.short 849
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_850 arg0, arg1
	.short 850
	.byte \arg0
	.short \arg1
	.endm

	.macro scrcmd_851 arg0
	.short 851
	.byte \arg0
	.endm

	.macro scrcmd_852 arg0, arg1
	.short 852
	.byte \arg0
	.byte \arg1
	.endm

	.endif ; ASM_SCRIPT_INC
