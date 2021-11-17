#include "constants/species.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FF4E4: ; Held item odds
	.short 45, 95
	.short 20, 80
_020FF4EC: ; Rotom moves
	.short MOVE_NONE
	.short MOVE_OVERHEAT
	.short MOVE_HYDRO_PUMP
	.short MOVE_BLIZZARD
	.short MOVE_AIR_SLASH
	.short MOVE_LEAF_STORM
_020FF4F8: ; Mythicals
	.short SPECIES_MEW
	.short SPECIES_CELEBI
	.short SPECIES_JIRACHI
	.short SPECIES_DEOXYS
	.short SPECIES_PHIONE
	.short SPECIES_MANAPHY
	.short SPECIES_DARKRAI
	.short SPECIES_SHAYMIN
	.short SPECIES_ARCEUS
	.balign 4, 0
_020FF50C:
	.word 0x00000000
	.word 0x00000001
	.word 0x00000001
	.word 0x00000002
	.word 0x00000000
	.word 0x00000003
	.public sFriendshipModTable
sFriendshipModTable: ; Friendship table
	.byte   5,   3,   2
	.byte   5,   3,   2
	.byte   1,   1,   0
	.byte   3,   2,   1
	.byte   1,   1,   0
	.byte   1,   1,   1
	.byte  -1,  -1,  -1
	.byte  -5,  -5, -10
	.byte  -5,  -5, -10
	.byte   3,   2,   1
	.balign 4, 0
_020FF544:
	.word           1
	.word          10
	.word         100
	.word        1000
	.word       10000
	.word      100000
	.word     1000000
	.word    10000000
_020FF564: ; Legendaries
	.short SPECIES_MEWTWO
	.short SPECIES_MEW
	.short SPECIES_LUGIA
	.short SPECIES_HO_OH
	.short SPECIES_CELEBI
	.short SPECIES_KYOGRE
	.short SPECIES_GROUDON
	.short SPECIES_RAYQUAZA
	.short SPECIES_JIRACHI
	.short SPECIES_DEOXYS
	.short SPECIES_DIALGA
	.short SPECIES_PALKIA
	.short SPECIES_GIRATINA
	.short SPECIES_PHIONE
	.short SPECIES_MANAPHY
	.short SPECIES_DARKRAI
	.short SPECIES_SHAYMIN
	.short SPECIES_ARCEUS

	.balign 4, 0
_020FF588:
	.short 0x0000 ; s16
	.short 0x0000 ; s16
	.short 0x0000 ; s16
	.short 0x0000 ; u16
	.word 0x00000000 ; u32
	.word 0x00000000 ; u32
	.word 0x00000001 ; u32
	.word 0x00004E2F, 0x00004E2A, 0x00004E27, 0x00004E27, 0xFFFFFFFF, 0xFFFFFFFF ; u32[6]
	.word 0x00000002 ; u32
	.word 0x00000001 ; u32
_020FF5BC: ; Flavor preferences
	.byte  0,  0,  0,  0,  0
	.byte  1,  0,  0,  0, -1
	.byte  1,  0, -1,  0,  0
	.byte  1, -1,  0,  0,  0
	.byte  1,  0,  0, -1,  0
	.byte -1,  0,  0,  0,  1
	.byte  0,  0,  0,  0,  0
	.byte  0,  0, -1,  0,  1
	.byte  0, -1,  0,  0,  1
	.byte  0,  0,  0, -1,  1
	.byte -1,  0,  1,  0,  0
	.byte  0,  0,  1,  0, -1
	.byte  0,  0,  0,  0,  0
	.byte  0, -1,  1,  0,  0
	.byte  0,  0,  1, -1,  0
	.byte -1,  1,  0,  0,  0
	.byte  0,  1,  0,  0, -1
	.byte  0,  1, -1,  0,  0
	.byte  0,  0,  0,  0,  0
	.byte  0,  1,  0, -1,  0
	.byte -1,  0,  0,  1,  0
	.byte  0,  0,  0,  1, -1
	.byte  0,  0, -1,  1,  0
	.byte  0, -1,  0,  1,  0
	.byte  0,  0,  0,  0,  0
	.public sNatureStatMods
sNatureStatMods: ; Nature stat mods
	.byte  0,  0,  0,  0,  0
	.byte  1, -1,  0,  0,  0
	.byte  1,  0, -1,  0,  0
	.byte  1,  0,  0, -1,  0
	.byte  1,  0,  0,  0, -1
	.byte -1,  1,  0,  0,  0
	.byte  0,  0,  0,  0,  0
	.byte  0,  1, -1,  0,  0
	.byte  0,  1,  0, -1,  0
	.byte  0,  1,  0,  0, -1
	.byte -1,  0,  1,  0,  0
	.byte  0, -1,  1,  0,  0
	.byte  0,  0,  0,  0,  0
	.byte  0,  0,  1, -1,  0
	.byte  0,  0,  1,  0, -1
	.byte -1,  0,  0,  1,  0
	.byte  0, -1,  0,  1,  0
	.byte  0,  0, -1,  1,  0
	.byte  0,  0,  0,  0,  0
	.byte  0,  0,  0,  1, -1
	.byte -1,  0,  0,  0,  1
	.byte  0, -1,  0,  0,  1
	.byte  0,  0, -1,  0,  1
	.byte  0,  0,  0, -1,  1
	.byte  0,  0,  0,  0,  0
_020FF6B6: ; Pokeathlon performance mods? type: s8[][5]
	.byte  10,   0,   0,   0, -10
	.byte  35, -35,   0,   0,   0
	.byte  35,   0,   0,   0, -35
	.byte  35,   0,   0, -35,   0
	.byte  35,   0, -35,   0,   0
	.byte -35,  35,   0,   0,   0
	.byte   0,  10,   0, -10,   0
	.byte   0,  35,   0,   0, -35
	.byte   0,  35,   0, -35,   0
	.byte   0,  35, -35,   0,   0
	.byte -35,   0,   0,   0,  35
	.byte   0, -35,   0,   0,  35
	.byte   0,   0, -10,   0,  10
	.byte   0,   0,   0, -35,  35
	.byte   0,   0, -35,   0,  35
	.byte -35,   0,   0,  35,   0
	.byte   0, -35,   0,  35,   0
	.byte   0,   0,   0,  35, -35
	.byte -10,   0,   0,  10,   0
	.byte   0,   0, -35,  35,   0
	.byte -35,   0,  35,   0,   0
	.byte   0, -35,  35,   0,   0
	.byte   0,   0,  35,   0, -35
	.byte   0,   0,  35, -35,   0
	.byte   0, -10,  10,   0,   0
_020FF733: ; Substruct offsets
	.byte 0x00, 0x20, 0x40, 0x60
	.byte 0x00, 0x20, 0x60, 0x40
	.byte 0x00, 0x40, 0x20, 0x60
	.byte 0x00, 0x60, 0x20, 0x40
	.byte 0x00, 0x40, 0x60, 0x20
	.byte 0x00, 0x60, 0x40, 0x20
	.byte 0x20, 0x00, 0x40, 0x60
	.byte 0x20, 0x00, 0x60, 0x40
	.byte 0x40, 0x00, 0x20, 0x60
	.byte 0x60, 0x00, 0x20, 0x40
	.byte 0x40, 0x00, 0x60, 0x20
	.byte 0x60, 0x00, 0x40, 0x20
	.byte 0x20, 0x40, 0x00, 0x60
	.byte 0x20, 0x60, 0x00, 0x40
	.byte 0x40, 0x20, 0x00, 0x60
	.byte 0x60, 0x20, 0x00, 0x40
	.byte 0x40, 0x60, 0x00, 0x20
	.byte 0x60, 0x40, 0x00, 0x20
	.byte 0x20, 0x40, 0x60, 0x00
	.byte 0x20, 0x60, 0x40, 0x00
	.byte 0x40, 0x20, 0x60, 0x00
	.byte 0x60, 0x20, 0x40, 0x00
	.byte 0x40, 0x60, 0x20, 0x00
	.byte 0x60, 0x40, 0x20, 0x00
	.byte 0x00, 0x20, 0x40, 0x60
	.byte 0x00, 0x20, 0x60, 0x40
	.byte 0x00, 0x40, 0x20, 0x60
	.byte 0x00, 0x60, 0x20, 0x40
	.byte 0x00, 0x40, 0x60, 0x20
	.byte 0x00, 0x60, 0x40, 0x20
	.byte 0x20, 0x00, 0x40, 0x60
	.byte 0x20, 0x00, 0x60, 0x40
	.balign 2, 0
_020FF7B4: ; aprijuice related?
	.short 0x0000
	.short 0x0000
	.short 0x0001
	.short 0x0002
	.short 0x0003
	.short 0x0004
	.short 0x0005
	.short 0x0006
	.short 0x0007
	.short 0x0008
	.short 0x0009
	.short 0x000A
	.short 0x000B
	.short 0x000C
	.short 0x000D
	.short 0x000E
	.short 0x000F
	.short 0x0010
	.short 0x0011
	.short 0x0012
	.short 0x0013
	.short 0x0014
	.short 0x0015
	.short 0x0016
	.short 0x0017
	.short 0x0018
	.short 0x0019
	.short 0x001A
	.short 0x001B
	.short 0x001C
	.short 0x001D
	.short 0x001E
	.short 0x001F
	.short 0x0020
	.short 0x0021
	.short 0x0022
	.short 0x0023
	.short 0x0024
	.short 0x0025
	.short 0x0026
	.short 0x0027
	.short 0x0028
	.short 0x0029
	.short 0x002A
	.short 0x002B
	.short 0x002C
	.short 0x002D
	.short 0x002E
	.short 0x002F
	.short 0x0030
	.short 0x0031
	.short 0x0032
	.short 0x0033
	.short 0x0034
	.short 0x0035
	.short 0x0036
	.short 0x0037
	.short 0x0038
	.short 0x0039
	.short 0x003A
	.short 0x003B
	.short 0x003C
	.short 0x003D
	.short 0x003E
	.short 0x003F
	.short 0x0040
	.short 0x0041
	.short 0x0042
	.short 0x0043
	.short 0x0044
	.short 0x0045
	.short 0x0046
	.short 0x0047
	.short 0x0048
	.short 0x0049
	.short 0x004A
	.short 0x004B
	.short 0x004C
	.short 0x004D
	.short 0x004E
	.short 0x004F
	.short 0x0050
	.short 0x0051
	.short 0x0052
	.short 0x0053
	.short 0x0054
	.short 0x0055
	.short 0x0056
	.short 0x0057
	.short 0x0058
	.short 0x0059
	.short 0x005A
	.short 0x005B
	.short 0x005C
	.short 0x005D
	.short 0x005E
	.short 0x005F
	.short 0x0060
	.short 0x0061
	.short 0x0062
	.short 0x0063
	.short 0x0064
	.short 0x0065
	.short 0x0066
	.short 0x0067
	.short 0x0068
	.short 0x0069
	.short 0x006A
	.short 0x006B
	.short 0x006C
	.short 0x006D
	.short 0x006E
	.short 0x006F
	.short 0x0070
	.short 0x0071
	.short 0x0072
	.short 0x0073
	.short 0x0074
	.short 0x0075
	.short 0x0076
	.short 0x0077
	.short 0x0078
	.short 0x0079
	.short 0x007A
	.short 0x007B
	.short 0x007C
	.short 0x007D
	.short 0x007E
	.short 0x007F
	.short 0x0080
	.short 0x0081
	.short 0x0082
	.short 0x0083
	.short 0x0084
	.short 0x0085
	.short 0x0086
	.short 0x0087
	.short 0x0088
	.short 0x0089
	.short 0x008A
	.short 0x008B
	.short 0x008C
	.short 0x008D
	.short 0x008E
	.short 0x008F
	.short 0x0090
	.short 0x0091
	.short 0x0092
	.short 0x0093
	.short 0x0094
	.short 0x0095
	.short 0x0096
	.short 0x0097
	.short 0x0098
	.short 0x0099
	.short 0x009A
	.short 0x009B
	.short 0x009C
	.short 0x009D
	.short 0x009E
	.short 0x009F
	.short 0x00A0
	.short 0x00A1
	.short 0x00A2
	.short 0x00A3
	.short 0x00A4
	.short 0x00A5
	.short 0x00A6
	.short 0x00A7
	.short 0x00A8
	.short 0x00A9
	.short 0x00AA
	.short 0x00AB
	.short 0x00AD
	.short 0x00AE
	.short 0x00AF
	.short 0x00B0
	.short 0x00B1
	.short 0x00B2
	.short 0x00B3
	.short 0x00B4
	.short 0x00B5
	.short 0x00B6
	.short 0x00B7
	.short 0x00B8
	.short 0x00B9
	.short 0x00BA
	.short 0x00BB
	.short 0x00BC
	.short 0x00BD
	.short 0x00BE
	.short 0x00BF
	.short 0x00C0
	.short 0x00C1
	.short 0x00C2
	.short 0x00C3
	.short 0x00C4
	.short 0x00C5
	.short 0x00C6
	.short 0x00C7
	.short 0x00C8
	.short 0x00C9
	.short 0x00E5
	.short 0x00E6
	.short 0x00E7
	.short 0x00E8
	.short 0x00E9
	.short 0x00EA
	.short 0x00EB
	.short 0x00EC
	.short 0x00ED
	.short 0x00EE
	.short 0x00EF
	.short 0x00F0
	.short 0x00F1
	.short 0x00F2
	.short 0x00F3
	.short 0x00F4
	.short 0x00F5
	.short 0x00F6
	.short 0x00F7
	.short 0x00F8
	.short 0x00F9
	.short 0x00FA
	.short 0x00FB
	.short 0x00FC
	.short 0x00FD
	.short 0x00FE
	.short 0x00FF
	.short 0x0100
	.short 0x0101
	.short 0x0102
	.short 0x0103
	.short 0x0104
	.short 0x0105
	.short 0x0106
	.short 0x0107
	.short 0x0108
	.short 0x0109
	.short 0x010A
	.short 0x010B
	.short 0x010C
	.short 0x010D
	.short 0x010E
	.short 0x010F
	.short 0x0110
	.short 0x0111
	.short 0x0112
	.short 0x0113
	.short 0x0114
	.short 0x0115
	.short 0x0116
	.short 0x0117
	.short 0x0118
	.short 0x0119
	.short 0x011A
	.short 0x011B
	.short 0x011C
	.short 0x011D
	.short 0x011E
	.short 0x011F
	.short 0x0120
	.short 0x0121
	.short 0x0122
	.short 0x0123
	.short 0x0124
	.short 0x0125
	.short 0x0126
	.short 0x0127
	.short 0x0128
	.short 0x0129
	.short 0x012A
	.short 0x012B
	.short 0x012C
	.short 0x012D
	.short 0x012E
	.short 0x012F
	.short 0x0130
	.short 0x0131
	.short 0x0132
	.short 0x0133
	.short 0x0134
	.short 0x0135
	.short 0x0136
	.short 0x0137
	.short 0x0138
	.short 0x0139
	.short 0x013A
	.short 0x013B
	.short 0x013C
	.short 0x013D
	.short 0x013E
	.short 0x013F
	.short 0x0140
	.short 0x0141
	.short 0x0142
	.short 0x0143
	.short 0x0144
	.short 0x0145
	.short 0x0146
	.short 0x0147
	.short 0x0148
	.short 0x0149
	.short 0x014A
	.short 0x014B
	.short 0x014C
	.short 0x014D
	.short 0x014E
	.short 0x014F
	.short 0x0150
	.short 0x0151
	.short 0x0152
	.short 0x0153
	.short 0x0154
	.short 0x0155
	.short 0x0156
	.short 0x0157
	.short 0x0158
	.short 0x0159
	.short 0x015A
	.short 0x015B
	.short 0x015C
	.short 0x015D
	.short 0x015E
	.short 0x015F
	.short 0x0160
	.short 0x0161
	.short 0x0162
	.short 0x0163
	.short 0x0164
	.short 0x0165
	.short 0x0166
	.short 0x0167
	.short 0x0168
	.short 0x0169
	.short 0x016A
	.short 0x016B
	.short 0x016C
	.short 0x016D
	.short 0x016E
	.short 0x016F
	.short 0x0170
	.short 0x0171
	.short 0x0172
	.short 0x0173
	.short 0x0174
	.short 0x0175
	.short 0x0176
	.short 0x0177
	.short 0x0178
	.short 0x0179
	.short 0x017A
	.short 0x017B
	.short 0x017C
	.short 0x017D
	.short 0x017E
	.short 0x017F
	.short 0x0180
	.short 0x0181
	.short 0x0182
	.short 0x0183
	.short 0x0184
	.short 0x0185
	.short 0x0186
	.short 0x0187
	.short 0x0188
	.short 0x0189
	.short 0x018A
	.short 0x018B
	.short 0x018C
	.short 0x018D
	.short 0x018E
	.short 0x018F
	.short 0x0190
	.short 0x0191
	.short 0x0192
	.short 0x0193
	.short 0x0194
	.short 0x0195
	.short 0x0196
	.short 0x0197
	.short 0x0198
	.short 0x0199
	.short 0x019A
	.short 0x019B
	.short 0x019C
	.short 0x019D
	.short 0x01A1
	.short 0x01A2
	.short 0x01A3
	.short 0x01A4
	.short 0x01A5
	.short 0x01A6
	.short 0x01A7
	.short 0x01A8
	.short 0x01A9
	.short 0x01AA
	.short 0x01AB
	.short 0x01AC
	.short 0x01AD
	.short 0x01AE
	.short 0x01AF
	.short 0x01B0
	.short 0x01B1
	.short 0x01B2
	.short 0x01B3
	.short 0x01B4
	.short 0x01B5
	.short 0x01B6
	.short 0x01B7
	.short 0x01B8
	.short 0x01B9
	.short 0x01BA
	.short 0x01BD
	.short 0x01C0
	.short 0x01C1
	.short 0x01C2
	.short 0x01C3
	.short 0x01C4
	.short 0x01C5
	.short 0x01C6
	.short 0x01C7
	.short 0x01C8
	.short 0x01CA
	.short 0x01CC
	.short 0x01CD
	.short 0x01CE
	.short 0x01CF
	.short 0x01D0
	.short 0x01D1
	.short 0x01D2
	.short 0x01D3
	.short 0x01D4
	.short 0x01D5
	.short 0x01D6
	.short 0x01D7
	.short 0x01D8
	.short 0x01D9
	.short 0x01DA
	.short 0x01DB
	.short 0x01DC
	.short 0x01DD
	.short 0x01DE
	.short 0x01DF
	.short 0x01E0
	.short 0x01E1
	.short 0x01E2
	.short 0x01E3
	.short 0x01E4
	.short 0x01E5
	.short 0x01E6
	.short 0x01E7
	.short 0x01E8
	.short 0x01E9
	.short 0x01EA
	.short 0x01EB
	.short 0x01EC
	.short 0x01ED
	.short 0x01EE
	.short 0x01EF
	.short 0x01F0
	.short 0x01F1
	.short 0x01F2
	.short 0x01F3
	.short 0x01F4
	.short 0x01F5
	.short 0x01F6
	.short 0x01F7
	.short 0x01F8
	.short 0x01F9
	.short 0x01FA
	.short 0x01FB
	.short 0x01FC
	.short 0x01FD
	.short 0x01FE
	.short 0x01FF
	.short 0x0200
	.short 0x0201
	.short 0x0202
	.short 0x0203
	.short 0x0209
	.short 0x020A
	.short 0x020B
	.short 0x020C
	.short 0x020D
	.short 0x020E
	.short 0x020F
	.short 0x0210
	.short 0x0212
	.short 0x0213
	.short 0x0214
	.short 0x0215
	.short 0x0216
	.short 0x0218

	.data

_021100E8:
	.asciz "poketool/personal/pms.narc"

	.text

	.public GenPersonalityByGenderAndNature
	.public LoadGrowthTable
	.public GetExpByGrowthRateAndLevel
	.public sub_02070560

	thumb_func_start sub_020708D8
sub_020708D8: ; 0x020708D8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r1, #0
	add r1, r3, #0
	add r5, r0, #0
	add r4, r2, #0
	bl sub_02070438
	ldr r1, _02070A60 ; =0x000001A5
	cmp r5, r1
	bgt _0207093E
	bge _020709CC
	add r2, r1, #0
	sub r2, #0x46
	cmp r5, r2
	bgt _0207090E
	sub r1, #0x46
	cmp r5, r1
	bge _020709E0
	cmp r5, #0xac
	bgt _02070908
	bne _02070906
	b _02070A32
_02070906:
	b _02070A3E
_02070908:
	cmp r5, #0xc9
	beq _020709F4
	b _02070A3E
_0207090E:
	add r2, r1, #0
	sub r2, #0x23
	cmp r5, r2
	bgt _0207091E
	sub r1, #0x23
	cmp r5, r1
	beq _020709EA
	b _02070A3E
_0207091E:
	add r2, r1, #0
	sub r2, #8
	cmp r5, r2
	bgt _0207093C
	add r2, r1, #0
	sub r2, #9
	cmp r5, r2
	blt _0207093C
	add r2, r1, #0
	sub r2, #9
	cmp r5, r2
	beq _020709A4
	sub r1, #8
	cmp r5, r1
	beq _020709B0
_0207093C:
	b _02070A3E
_0207093E:
	add r2, r1, #0
	add r2, #0x42
	cmp r5, r2
	bgt _0207096C
	add r2, r1, #0
	add r2, #0x42
	cmp r5, r2
	bge _02070A26
	add r2, r1, #2
	cmp r5, r2
	bgt _02070964
	add r2, r1, #1
	cmp r5, r2
	blt _02070A3E
	beq _020709BC
	add r1, r1, #2
	cmp r5, r1
	beq _020709C4
	b _02070A3E
_02070964:
	add r1, #0x3a
	cmp r5, r1
	beq _02070A1A
	b _02070A3E
_0207096C:
	add r2, r1, #0
	add r2, #0x47
	cmp r5, r2
	bgt _0207097C
	add r1, #0x47
	cmp r5, r1
	beq _02070A0E
	b _02070A3E
_0207097C:
	add r2, r1, #0
	add r2, #0x4a
	cmp r5, r2
	bgt _02070A3E
	add r2, r1, #0
	add r2, #0x48
	cmp r5, r2
	blt _02070A3E
	add r2, r1, #0
	add r2, #0x48
	cmp r5, r2
	beq _020709D4
	add r2, r1, #0
	add r2, #0x49
	cmp r5, r2
	beq _02070A00
	add r1, #0x4a
	cmp r5, r1
	beq _02070A08
	b _02070A3E
_020709A4:
	lsr r2, r4, #1
	add r2, #0x48
	lsl r0, r0, #1
	mov r1, #0x75
	add r2, r2, r0
	b _02070A50
_020709B0:
	lsr r2, r4, #1
	add r2, #0x4e
	lsl r0, r0, #1
	mov r1, #0x75
	add r2, r2, r0
	b _02070A50
_020709BC:
	add r4, #0x54
	mov r1, #0x75
	add r2, r4, r0
	b _02070A50
_020709C4:
	add r4, #0x58
	mov r1, #0x75
	add r2, r4, r0
	b _02070A50
_020709CC:
	add r4, #0x5c
	mov r1, #0x75
	add r2, r4, r0
	b _02070A50
_020709D4:
	lsr r2, r4, #1
	add r2, #0x60
	lsl r0, r0, #1
	mov r1, #0x75
	add r2, r2, r0
	b _02070A50
_020709E0:
	lsl r2, r4, #1
	add r2, #0x40
	mov r1, #0x75
	add r2, r0, r2
	b _02070A50
_020709EA:
	lsr r2, r4, #1
	lsl r0, r0, #1
	mov r1, #0x75
	add r2, r2, r0
	b _02070A50
_020709F4:
	lsr r2, r4, #1
	add r2, #8
	lsl r0, r0, #1
	mov r1, #0x75
	add r2, r2, r0
	b _02070A50
_02070A00:
	add r2, r0, #0
	mov r1, #0x75
	add r2, #0x84
	b _02070A50
_02070A08:
	mov r1, #0x75
	mov r2, #0x84
	b _02070A50
_02070A0E:
	lsr r2, r4, #1
	add r2, #0x88
	lsl r0, r0, #1
	mov r1, #0x75
	add r2, r2, r0
	b _02070A50
_02070A1A:
	lsr r2, r4, #1
	add r2, #0x8c
	lsl r0, r0, #1
	mov r1, #0x75
	add r2, r2, r0
	b _02070A50
_02070A26:
	lsr r2, r4, #1
	add r2, #0x98
	lsl r0, r0, #1
	mov r1, #0x75
	add r2, r2, r0
	b _02070A50
_02070A32:
	lsr r2, r4, #1
	add r2, #0x9c
	lsl r0, r0, #1
	mov r1, #0x75
	add r2, r2, r0
	b _02070A50
_02070A3E:
	mov r1, #5
	cmp r6, #1
	beq _02070A48
	mov r2, #1
	b _02070A4A
_02070A48:
	mov r2, #0
_02070A4A:
	lsl r0, r5, #2
	add r0, r4, r0
	add r2, r0, r2
_02070A50:
	add r0, sp, #0
	bl ReadWholeNarcMemberByIdPair
	add r0, sp, #0
	ldrb r0, [r0]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02070A60: .word 0x000001A5
	thumb_func_end sub_020708D8

	thumb_func_start sub_02070A64
sub_02070A64: ; 0x02070A64
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r1, #0
	add r1, r3, #0
	add r5, r0, #0
	add r4, r2, #0
	bl sub_02070438
	ldr r1, _02070C20 ; =0x000001A5
	cmp r5, r1
	bgt _02070AC0
	bge _02070B50
	add r2, r1, #0
	sub r2, #0x46
	cmp r5, r2
	bgt _02070A90
	sub r1, #0x46
	cmp r5, r1
	bge _02070B64
	cmp r5, #0xc9
	beq _02070B78
	b _02070BFE
_02070A90:
	add r2, r1, #0
	sub r2, #0x23
	cmp r5, r2
	bgt _02070AA0
	sub r1, #0x23
	cmp r5, r1
	beq _02070B6E
	b _02070BFE
_02070AA0:
	add r2, r1, #0
	sub r2, #8
	cmp r5, r2
	bgt _02070ABE
	add r2, r1, #0
	sub r2, #9
	cmp r5, r2
	blt _02070ABE
	add r2, r1, #0
	sub r2, #9
	cmp r5, r2
	beq _02070B28
	sub r1, #8
	cmp r5, r1
	beq _02070B34
_02070ABE:
	b _02070BFE
_02070AC0:
	add r2, r1, #0
	add r2, #0x42
	cmp r5, r2
	bgt _02070AF0
	add r2, r1, #0
	add r2, #0x42
	cmp r5, r2
	blt _02070AD2
	b _02070BDA
_02070AD2:
	add r2, r1, #2
	cmp r5, r2
	bgt _02070AE8
	add r2, r1, #1
	cmp r5, r2
	blt _02070AE6
	beq _02070B40
	add r1, r1, #2
	cmp r5, r1
	beq _02070B48
_02070AE6:
	b _02070BFE
_02070AE8:
	add r1, #0x3a
	cmp r5, r1
	beq _02070BB6
	b _02070BFE
_02070AF0:
	add r2, r1, #0
	add r2, #0x47
	cmp r5, r2
	bgt _02070B00
	add r1, #0x47
	cmp r5, r1
	beq _02070B92
	b _02070BFE
_02070B00:
	add r2, r1, #0
	add r2, #0x4a
	cmp r5, r2
	bgt _02070BFE
	add r2, r1, #0
	add r2, #0x48
	cmp r5, r2
	blt _02070BFE
	add r2, r1, #0
	add r2, #0x48
	cmp r5, r2
	beq _02070B58
	add r2, r1, #0
	add r2, #0x49
	cmp r5, r2
	beq _02070B84
	add r1, #0x4a
	cmp r5, r1
	beq _02070B8C
	b _02070BFE
_02070B28:
	lsr r2, r4, #1
	add r2, #0x48
	lsl r0, r0, #1
	mov r1, #0xc5
	add r2, r2, r0
	b _02070C10
_02070B34:
	lsr r2, r4, #1
	add r2, #0x4e
	lsl r0, r0, #1
	mov r1, #0xc5
	add r2, r2, r0
	b _02070C10
_02070B40:
	add r4, #0x54
	mov r1, #0xc5
	add r2, r4, r0
	b _02070C10
_02070B48:
	add r4, #0x58
	mov r1, #0xc5
	add r2, r4, r0
	b _02070C10
_02070B50:
	add r4, #0x5c
	mov r1, #0xc5
	add r2, r4, r0
	b _02070C10
_02070B58:
	lsr r2, r4, #1
	add r2, #0x60
	lsl r0, r0, #1
	mov r1, #0xc5
	add r2, r2, r0
	b _02070C10
_02070B64:
	lsl r2, r4, #1
	add r2, #0x40
	mov r1, #0xc5
	add r2, r0, r2
	b _02070C10
_02070B6E:
	lsr r2, r4, #1
	lsl r0, r0, #1
	mov r1, #0xc5
	add r2, r2, r0
	b _02070C10
_02070B78:
	lsr r2, r4, #1
	add r2, #8
	lsl r0, r0, #1
	mov r1, #0xc5
	add r2, r2, r0
	b _02070C10
_02070B84:
	add r2, r0, #0
	mov r1, #0xc5
	add r2, #0x84
	b _02070C10
_02070B8C:
	mov r1, #0xc5
	mov r2, #0x84
	b _02070C10
_02070B92:
	cmp r0, #0
	beq _02070BA2
	lsr r2, r4, #1
	add r2, #0x88
	lsl r0, r0, #1
	mov r1, #0x75
	add r2, r2, r0
	b _02070C10
_02070BA2:
	mov r1, #0xc4
	cmp r6, #1
	beq _02070BAC
	mov r2, #1
	b _02070BAE
_02070BAC:
	mov r2, #0
_02070BAE:
	lsl r0, r5, #2
	add r0, r4, r0
	add r2, r0, r2
	b _02070C10
_02070BB6:
	cmp r0, #0
	beq _02070BC6
	lsr r2, r4, #1
	add r2, #0x8c
	lsl r0, r0, #1
	mov r1, #0x75
	add r2, r2, r0
	b _02070C10
_02070BC6:
	mov r1, #0xc4
	cmp r6, #1
	beq _02070BD0
	mov r2, #1
	b _02070BD2
_02070BD0:
	mov r2, #0
_02070BD2:
	lsl r0, r5, #2
	add r0, r4, r0
	add r2, r0, r2
	b _02070C10
_02070BDA:
	cmp r0, #0
	beq _02070BEA
	lsr r2, r4, #1
	add r2, #0x98
	lsl r0, r0, #1
	mov r1, #0x75
	add r2, r2, r0
	b _02070C10
_02070BEA:
	mov r1, #0xc4
	cmp r6, #1
	beq _02070BF4
	mov r2, #1
	b _02070BF6
_02070BF4:
	mov r2, #0
_02070BF6:
	lsl r0, r5, #2
	add r0, r4, r0
	add r2, r0, r2
	b _02070C10
_02070BFE:
	mov r1, #0xc4
	cmp r6, #1
	beq _02070C08
	mov r2, #1
	b _02070C0A
_02070C08:
	mov r2, #0
_02070C0A:
	lsl r0, r5, #2
	add r0, r4, r0
	add r2, r0, r2
_02070C10:
	add r0, sp, #0
	bl ReadWholeNarcMemberByIdPair
	add r0, sp, #0
	ldrb r0, [r0]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02070C20: .word 0x000001A5
	thumb_func_end sub_02070A64

	thumb_func_start sub_02070C24
sub_02070C24: ; 0x02070C24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	add r6, r0, #0
	str r1, [sp, #0x18]
	str r2, [sp, #0x1c]
	str r3, [sp, #0x20]
	ldr r0, [sp, #0x8c]
	ldr r1, [sp, #0x90]
	ldr r2, [sp, #0x94]
	add r3, sp, #0x24
	ldr r5, [sp, #0x98]
	mov r7, #1
	bl sub_02070D3C
	ldr r0, [sp, #0x8c]
	cmp r0, #0x66
	bne _02070C48
	mov r7, #2
_02070C48:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x9c]
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _02070D28 ; =0x00004E2F
	ldr r1, [sp, #0x18]
	add r0, r5, r0
	str r0, [sp, #8]
	ldr r3, [sp, #0x28]
	add r0, r6, #0
	add r2, r4, #0
	bl sub_0200D504
	str r4, [sp]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x18]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, _02070D2C ; =0x00004E2A
	mov r1, #2
	add r0, r5, r0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	add r2, r6, #0
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	ldr r0, _02070D30 ; =0x00004E27
	ldr r1, [sp, #0x18]
	add r0, r5, r0
	str r0, [sp, #4]
	ldr r3, [sp, #0x30]
	add r0, r6, #0
	add r2, r4, #0
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _02070D30 ; =0x00004E27
	ldr r1, [sp, #0x18]
	add r0, r5, r0
	str r0, [sp, #4]
	ldr r3, [sp, #0x34]
	add r0, r6, #0
	add r2, r4, #0
	bl sub_0200D71C
	add r0, r4, #0
	bl NARC_dtor
	ldr r4, _02070D34 ; =_020FF588
	add r3, sp, #0x3c
	mov r2, #6
_02070CC6:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02070CC6
	ldr r0, [r4]
	ldr r1, _02070D28 ; =0x00004E2F
	str r0, [r3]
	add r0, r5, r1
	str r0, [sp, #0x50]
	sub r0, r1, #5
	add r0, r5, r0
	sub r1, #8
	str r0, [sp, #0x54]
	add r0, r5, r1
	str r0, [sp, #0x58]
	str r0, [sp, #0x5c]
	ldr r0, _02070D38 ; =_020FF50C
	lsl r1, r5, #2
	ldr r0, [r0, r1]
	ldr r1, [sp, #0x18]
	str r0, [sp, #0x44]
	add r0, r6, #0
	add r2, sp, #0x3c
	bl sub_0200D734
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #0
	bl sub_02024AA8
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x88]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	add r0, r4, #0
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add r0, r4, #0
	bl sub_0200DC18
	add r0, r4, #0
	mov r1, #1
	bl sub_0200DC78
	add r0, r4, #0
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02070D28: .word 0x00004E2F
_02070D2C: .word 0x00004E2A
_02070D30: .word 0x00004E27
_02070D34: .word _020FF588
_02070D38: .word _020FF50C
	thumb_func_end sub_02070C24

	thumb_func_start sub_02070D3C
sub_02070D3C: ; 0x02070D3C
	push {r4, lr}
	add r4, r3, #0
	cmp r1, #2
	bne _02070D60
	mov r1, #0x3a
	str r1, [r4]
	lsl r1, r0, #2
	add r1, r0, r1
	str r1, [r4, #4]
	add r0, r1, #1
	str r0, [r4, #8]
	add r0, r1, #2
	str r0, [r4, #0xc]
	add r0, r1, #3
	str r0, [r4, #0x10]
	add r0, r1, #4
	str r0, [r4, #0x14]
	pop {r4, pc}
_02070D60:
	mov r1, #6
	str r1, [r4]
	add r1, r2, #0
	bl sub_0207280C
	lsl r1, r0, #2
	add r1, r0, r1
	str r1, [r4, #4]
	add r0, r1, #1
	str r0, [r4, #8]
	add r0, r1, #2
	str r0, [r4, #0xc]
	add r0, r1, #3
	str r0, [r4, #0x10]
	add r0, r1, #4
	str r0, [r4, #0x14]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02070D3C

	thumb_func_start sub_02070D84
sub_02070D84: ; 0x02070D84
	push {r3, lr}
	add r3, r2, #0
	mov r2, #0
	bl sub_02070D3C
	pop {r3, pc}
	thumb_func_end sub_02070D84

	thumb_func_start sub_02070D90
sub_02070D90: ; 0x02070D90
	mov r0, #0xec
	bx lr
	thumb_func_end sub_02070D90

	thumb_func_start sub_02070D94
sub_02070D94: ; 0x02070D94
	mov r0, #0x88
	bx lr
	thumb_func_end sub_02070D94

	thumb_func_start GetMonUnownLetter
GetMonUnownLetter: ; 0x02070D98
	ldr r3, _02070D9C ; =GetBoxMonUnownLetter
	bx r3
	.balign 4, 0
_02070D9C: .word GetBoxMonUnownLetter
	thumb_func_end GetMonUnownLetter

	thumb_func_start GetBoxMonUnownLetter
GetBoxMonUnownLetter: ; 0x02070DA0
	push {r3, lr}
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end GetBoxMonUnownLetter

	thumb_func_start Mon_GetBoxMon
Mon_GetBoxMon: ; 0x02070DB0
	bx lr
	.balign 4, 0
	thumb_func_end Mon_GetBoxMon

	thumb_func_start sub_02070DB4
sub_02070DB4: ; 0x02070DB4
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	add r1, r0, #1
	add r0, sp, #0
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	bl GetMonData
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x15
	bl GetMonBaseStat
	mov r1, #0x64
	add r5, r0, #0
	bl GetExpByGrowthRateAndLevel
	ldr r1, [sp, #4]
	cmp r1, r0
	bls _02070E04
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #8
	add r2, sp, #4
	bl SetMonData
_02070E04:
	add r0, sp, #0
	ldrb r1, [r0]
	cmp r1, #0x64
	bls _02070E12
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_02070E12:
	add r0, r5, #0
	bl GetExpByGrowthRateAndLevel
	ldr r1, [sp, #4]
	cmp r1, r0
	blo _02070E2E
	add r0, r4, #0
	mov r1, #0xa1
	add r2, sp, #0
	bl SetMonData
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, pc}
_02070E2E:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02070DB4

	thumb_func_start GetMonEvolution
GetMonEvolution: ; 0x02070E34
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r7, r1, #0
	str r0, [sp]
	str r2, [sp, #4]
	mov r6, #0
	add r0, r7, #0
	mov r1, #5
	add r2, r6, #0
	str r3, [sp, #8]
	ldr r5, [sp, #0x58]
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r7, #0
	mov r1, #6
	add r2, r6, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	add r1, r6, #0
	str r0, [sp, #0x2c]
	add r0, r7, #0
	add r2, r1, #0
	bl GetMonData
	str r0, [sp, #0x30]
	add r0, r7, #0
	mov r1, #0x14
	add r2, r6, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r1, _0207114C ; =0xFFFF0000
	ldr r0, [sp, #0x30]
	add r2, r6, #0
	and r0, r1
	lsr r0, r0, #0x10
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x2c]
	mov r1, #1
	bl GetItemAttr
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r4, #0x40
	beq _02070EAE
	cmp r0, #0x40
	bne _02070EAE
	ldr r0, [sp, #4]
	cmp r0, #3
	beq _02070EAE
	add sp, #0x44
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_02070EAE:
	cmp r4, #0xac
	bne _02070EC6
	add r0, r7, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _02070EC6
	add sp, #0x44
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02070EC6:
	cmp r5, #0
	bne _02070ECC
	add r5, sp, #0x40
_02070ECC:
	mov r0, #0
	mov r1, #0x2a
	bl AllocFromHeap
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x1c]
	add r0, r4, #0
	bl sub_020725C8
	ldr r0, [sp, #4]
	cmp r0, #3
	bls _02070EE6
	b _02071230
_02070EE6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02070EF2: ; jump table
	.short _02070EFA - _02070EF2 - 2 ; case 0
	.short _02071170 - _02070EF2 - 2 ; case 1
	.short _020711A4 - _02070EF2 - 2 ; case 2
	.short _020711A4 - _02070EF2 - 2 ; case 3
_02070EFA:
	add r0, r7, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	add r0, r7, #0
	mov r1, #9
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x24]
	mov r0, #0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x20]
	mov r1, #0xa
	ldr r4, [sp, #0x1c]
	bl _s32_div_f
	str r1, [sp, #0xc]
_02070F2A:
	ldrh r0, [r4]
	cmp r0, #0x1a
	bls _02070F32
	b _0207115C
_02070F32:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02070F3E: ; jump table
	.short _0207115C - _02070F3E - 2 ; case 0
	.short _02070F74 - _02070F3E - 2 ; case 1
	.short _02070F82 - _02070F3E - 2 ; case 2
	.short _02070F98 - _02070F3E - 2 ; case 3
	.short _02070FAE - _02070F3E - 2 ; case 4
	.short _0207115C - _02070F3E - 2 ; case 5
	.short _0207115C - _02070F3E - 2 ; case 6
	.short _0207115C - _02070F3E - 2 ; case 7
	.short _02070FBE - _02070F3E - 2 ; case 8
	.short _02070FEA - _02070F3E - 2 ; case 9
	.short _02071016 - _02070F3E - 2 ; case 10
	.short _02071042 - _02070F3E - 2 ; case 11
	.short _0207105A - _02070F3E - 2 ; case 12
	.short _02071070 - _02070F3E - 2 ; case 13
	.short _02071080 - _02070F3E - 2 ; case 14
	.short _02071086 - _02070F3E - 2 ; case 15
	.short _0207115C - _02070F3E - 2 ; case 16
	.short _0207115C - _02070F3E - 2 ; case 17
	.short _02071096 - _02070F3E - 2 ; case 18
	.short _020710AE - _02070F3E - 2 ; case 19
	.short _020710C6 - _02070F3E - 2 ; case 20
	.short _020710DA - _02070F3E - 2 ; case 21
	.short _020710F2 - _02070F3E - 2 ; case 22
	.short _02071110 - _02070F3E - 2 ; case 23
	.short _0207112E - _02070F3E - 2 ; case 24
	.short _0207113C - _02070F3E - 2 ; case 25
	.short _02071150 - _02070F3E - 2 ; case 26
_02070F74:
	ldr r0, [sp, #0x24]
	cmp r0, #0xdc
	blo _02071050
	ldrh r6, [r4, #4]
	mov r0, #1
	str r0, [r5]
	b _0207115C
_02070F82:
	bl IsNighttime
	cmp r0, #0
	bne _02071050
	ldr r0, [sp, #0x24]
	cmp r0, #0xdc
	blo _02071050
	ldrh r6, [r4, #4]
	mov r0, #2
	str r0, [r5]
	b _0207115C
_02070F98:
	bl IsNighttime
	cmp r0, #1
	bne _02071050
	ldr r0, [sp, #0x24]
	cmp r0, #0xdc
	blo _02071050
	ldrh r6, [r4, #4]
	mov r0, #3
	str r0, [r5]
	b _0207115C
_02070FAE:
	ldrh r1, [r4, #2]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bgt _02071050
	ldrh r6, [r4, #4]
	mov r0, #4
	str r0, [r5]
	b _0207115C
_02070FBE:
	ldrh r1, [r4, #2]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bgt _02071050
	add r0, r7, #0
	mov r1, #0xa5
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x34]
	add r0, r7, #0
	mov r1, #0xa6
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x34]
	cmp r1, r0
	bls _02071050
	ldrh r6, [r4, #4]
	mov r0, #8
	str r0, [r5]
	b _0207115C
_02070FEA:
	ldrh r1, [r4, #2]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bgt _02071050
	add r0, r7, #0
	mov r1, #0xa5
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x38]
	add r0, r7, #0
	mov r1, #0xa6
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x38]
	cmp r1, r0
	bne _02071050
	ldrh r6, [r4, #4]
	mov r0, #9
	str r0, [r5]
	b _0207115C
_02071016:
	ldrh r1, [r4, #2]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bgt _02071050
	add r0, r7, #0
	mov r1, #0xa5
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x3c]
	add r0, r7, #0
	mov r1, #0xa6
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x3c]
	cmp r1, r0
	bhs _02071050
	ldrh r6, [r4, #4]
	mov r0, #0xa
	str r0, [r5]
	b _0207115C
_02071042:
	ldrh r1, [r4, #2]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bgt _02071050
	ldr r0, [sp, #0xc]
	cmp r0, #5
	blt _02071052
_02071050:
	b _0207115C
_02071052:
	ldrh r6, [r4, #4]
	mov r0, #0xb
	str r0, [r5]
	b _0207115C
_0207105A:
	ldrh r1, [r4, #2]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bgt _0207115C
	ldr r0, [sp, #0xc]
	cmp r0, #5
	blt _0207115C
	ldrh r6, [r4, #4]
	mov r0, #0xc
	str r0, [r5]
	b _0207115C
_02071070:
	ldrh r1, [r4, #2]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bgt _0207115C
	ldrh r6, [r4, #4]
	mov r0, #0xd
	str r0, [r5]
	b _0207115C
_02071080:
	mov r0, #0xe
	str r0, [r5]
	b _0207115C
_02071086:
	ldrh r1, [r4, #2]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	bgt _0207115C
	ldrh r6, [r4, #4]
	mov r0, #0xf
	str r0, [r5]
	b _0207115C
_02071096:
	bl IsNighttime
	cmp r0, #0
	bne _0207115C
	ldrh r1, [r4, #2]
	ldr r0, [sp, #0x2c]
	cmp r0, r1
	bne _0207115C
	ldrh r6, [r4, #4]
	mov r0, #0x12
	str r0, [r5]
	b _0207115C
_020710AE:
	bl IsNighttime
	cmp r0, #1
	bne _0207115C
	ldrh r1, [r4, #2]
	ldr r0, [sp, #0x2c]
	cmp r0, r1
	bne _0207115C
	ldrh r6, [r4, #4]
	mov r0, #0x13
	str r0, [r5]
	b _0207115C
_020710C6:
	ldrh r1, [r4, #2]
	add r0, r7, #0
	bl MonHasMove
	cmp r0, #1
	bne _0207115C
	ldrh r6, [r4, #4]
	mov r0, #0x14
	str r0, [r5]
	b _0207115C
_020710DA:
	ldr r0, [sp]
	cmp r0, #0
	beq _0207115C
	ldrh r1, [r4, #2]
	bl sub_020748CC
	cmp r0, #1
	bne _0207115C
	ldrh r6, [r4, #4]
	mov r0, #0x15
	str r0, [r5]
	b _0207115C
_020710F2:
	add r0, r7, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0207115C
	ldrh r1, [r4, #2]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bgt _0207115C
	ldrh r6, [r4, #4]
	mov r0, #0x16
	str r0, [r5]
	b _0207115C
_02071110:
	add r0, r7, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0207115C
	ldrh r1, [r4, #2]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bgt _0207115C
	ldrh r6, [r4, #4]
	mov r0, #0x17
	str r0, [r5]
	b _0207115C
_0207112E:
	ldr r1, [sp, #8]
	cmp r1, r0
	bne _0207115C
	ldrh r6, [r4, #4]
	mov r0, #0x18
	str r0, [r5]
	b _0207115C
_0207113C:
	ldr r1, [sp, #8]
	cmp r1, r0
	bne _0207115C
	ldrh r6, [r4, #4]
	mov r0, #0x19
	str r0, [r5]
	b _0207115C
	nop
_0207114C: .word 0xFFFF0000
_02071150:
	ldr r1, [sp, #8]
	cmp r1, r0
	bne _0207115C
	ldrh r6, [r4, #4]
	mov r0, #0x1a
	str r0, [r5]
_0207115C:
	cmp r6, #0
	bne _02071230
	ldr r0, [sp, #0x28]
	add r4, r4, #6
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #7
	bge _0207116E
	b _02070F2A
_0207116E:
	b _02071230
_02071170:
	ldr r3, [sp, #0x1c]
	mov r4, #0
	mov r7, #6
	mov r2, #5
_02071178:
	ldrh r0, [r3]
	cmp r0, #5
	beq _02071184
	cmp r0, #6
	beq _0207118A
	b _02071196
_02071184:
	ldrh r6, [r3, #4]
	str r2, [r5]
	b _02071196
_0207118A:
	ldrh r1, [r3, #2]
	ldr r0, [sp, #0x2c]
	cmp r0, r1
	bne _02071196
	ldrh r6, [r3, #4]
	str r7, [r5]
_02071196:
	cmp r6, #0
	bne _02071230
	add r4, r4, #1
	add r3, r3, #6
	cmp r4, #7
	blt _02071178
	b _02071230
_020711A4:
	mov r0, #0
	ldr r4, [sp, #0x1c]
	str r0, [sp, #0x10]
_020711AA:
	ldrh r2, [r4]
	cmp r2, #7
	bne _020711CA
	ldrh r1, [r4, #2]
	ldr r0, [sp, #8]
	cmp r0, r1
	bne _020711CA
	ldr r0, [sp, #0x10]
	mov r1, #6
	mul r1, r0
	ldr r0, [sp, #0x1c]
	add r0, r0, r1
	ldrh r6, [r0, #4]
	mov r0, #0
	str r0, [r5]
	b _02071230
_020711CA:
	cmp r2, #0x10
	bne _020711F6
	add r0, r7, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _020711F6
	ldrh r1, [r4, #2]
	ldr r0, [sp, #8]
	cmp r0, r1
	bne _020711F6
	ldr r0, [sp, #0x10]
	mov r1, #6
	mul r1, r0
	ldr r0, [sp, #0x1c]
	add r0, r0, r1
	ldrh r6, [r0, #4]
	mov r0, #0
	str r0, [r5]
	b _02071230
_020711F6:
	ldrh r0, [r4]
	cmp r0, #0x11
	bne _02071224
	add r0, r7, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _02071224
	ldrh r1, [r4, #2]
	ldr r0, [sp, #8]
	cmp r0, r1
	bne _02071224
	ldr r0, [sp, #0x10]
	mov r1, #6
	mul r1, r0
	ldr r0, [sp, #0x1c]
	add r0, r0, r1
	ldrh r6, [r0, #4]
	mov r0, #0
	str r0, [r5]
	b _02071230
_02071224:
	ldr r0, [sp, #0x10]
	add r4, r4, #6
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #7
	blt _020711AA
_02071230:
	ldr r0, [sp, #0x1c]
	bl FreeToHeap
	add r0, r6, #0
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	thumb_func_end GetMonEvolution

	thumb_func_start ReadFromPersonalPmsNarc
ReadFromPersonalPmsNarc: ; 0x0207123C
	push {r3, r4, lr}
	sub sp, #0x4c
	add r4, r0, #0
	mov r1, #0
	add r0, sp, #0
	strh r1, [r0]
	ldr r0, _02071284 ; =0x000001EE
	cmp r4, r0
	blo _02071252
	bl GF_AssertFail
_02071252:
	add r0, sp, #4
	bl FS_InitFile
	ldr r1, _02071288 ; =0x021100E8 poketool/personal/pms.narc
	add r0, sp, #4
	bl FS_OpenFile
	add r0, sp, #4
	lsl r1, r4, #1
	mov r2, #0
	bl FS_SeekFile
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #2
	bl FS_ReadFile
	add r0, sp, #4
	bl FS_CloseFile
	add r0, sp, #0
	ldrh r0, [r0]
	add sp, #0x4c
	pop {r3, r4, pc}
	nop
_02071284: .word 0x000001EE
_02071288: .word 0x021100E8
	thumb_func_end ReadFromPersonalPmsNarc

	thumb_func_start GetEggSpecies
GetEggSpecies: ; 0x0207128C
	push {r3, lr}
	cmp r0, #0xb9
	bgt _020712B0
	cmp r0, #0xb7
	blt _0207129E
	beq _020712D0
	cmp r0, #0xb9
	beq _020712D0
	b _020712CC
_0207129E:
	cmp r0, #0x7a
	bgt _020712AA
	bge _020712D0
	cmp r0, #0x71
	beq _020712D0
	b _020712CC
_020712AA:
	cmp r0, #0x8f
	beq _020712D0
	b _020712CC
_020712B0:
	cmp r0, #0xe2
	bgt _020712BC
	bge _020712D0
	cmp r0, #0xca
	beq _020712D0
	b _020712CC
_020712BC:
	ldr r1, _020712D4 ; =0x0000013B
	cmp r0, r1
	bgt _020712C6
	beq _020712D0
	b _020712CC
_020712C6:
	add r1, #0x2b
	cmp r0, r1
	beq _020712D0
_020712CC:
	bl ReadFromPersonalPmsNarc
_020712D0:
	pop {r3, pc}
	nop
_020712D4: .word 0x0000013B
	thumb_func_end GetEggSpecies

	thumb_func_start InitBoxMonMoveset
InitBoxMonMoveset: ; 0x020712D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0
	mov r1, #0x2c
	bl AllocFromHeap
	str r0, [sp]
	add r0, r5, #0
	bl AcquireBoxMonLock
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	add r7, r0, #0
	add r0, r5, #0
	bl CalcBoxMonLevel
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r2, [sp]
	add r0, r4, #0
	add r1, r7, #0
	bl LoadWotbl_HandleAlternateForme
	ldr r0, [sp]
	ldrh r1, [r0]
	ldr r0, _02071374 ; =0x0000FFFF
	cmp r1, r0
	beq _02071360
	ldr r4, [sp]
	lsl r7, r6, #9
_0207132C:
	ldrh r1, [r4]
	mov r0, #0xfe
	lsl r0, r0, #8
	and r0, r1
	cmp r0, r7
	bgt _02071360
	ldr r0, _02071378 ; =0x000001FF
	and r0, r1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r5, #0
	add r1, r6, #0
	bl TryAppendBoxMonMove
	ldr r1, _02071374 ; =0x0000FFFF
	cmp r0, r1
	bne _02071356
	add r0, r5, #0
	add r1, r6, #0
	bl DeleteBoxMonFirstMoveAndAppend
_02071356:
	add r4, r4, #2
	ldrh r1, [r4]
	ldr r0, _02071374 ; =0x0000FFFF
	cmp r1, r0
	bne _0207132C
_02071360:
	ldr r0, [sp]
	bl FreeToHeap
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl ReleaseBoxMonLock
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02071374: .word 0x0000FFFF
_02071378: .word 0x000001FF
	thumb_func_end InitBoxMonMoveset

	thumb_func_start TryAppendMonMove
TryAppendMonMove: ; 0x0207137C
	push {r4, lr}
	add r4, r1, #0
	bl Mon_GetBoxMon
	add r1, r4, #0
	bl TryAppendBoxMonMove
	pop {r4, pc}
	thumb_func_end TryAppendMonMove

	thumb_func_start TryAppendBoxMonMove
TryAppendBoxMonMove: ; 0x0207138C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	ldr r1, _020713E4 ; =0x0000FFFF
	add r6, r0, #0
	str r1, [sp, #4]
	bl AcquireBoxMonLock
	mov r4, #0
	str r0, [sp]
	add r7, r4, #0
_020713A2:
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x36
	add r2, r7, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _020713C4
	lsl r2, r4, #0x18
	add r0, r6, #0
	add r1, r5, #0
	lsr r2, r2, #0x18
	bl BoxMonSetMoveInSlot
	str r5, [sp, #4]
	b _020713D4
_020713C4:
	cmp r0, r5
	bne _020713CE
	ldr r0, _020713E8 ; =0x0000FFFE
	str r0, [sp, #4]
	b _020713D4
_020713CE:
	add r4, r4, #1
	cmp r4, #4
	blt _020713A2
_020713D4:
	ldr r1, [sp]
	add r0, r6, #0
	bl ReleaseBoxMonLock
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020713E4: .word 0x0000FFFF
_020713E8: .word 0x0000FFFE
	thumb_func_end TryAppendBoxMonMove

	thumb_func_start DeleteMonFirstMoveAndAppend
DeleteMonFirstMoveAndAppend: ; 0x020713EC
	push {r4, lr}
	add r4, r1, #0
	bl Mon_GetBoxMon
	add r1, r4, #0
	bl DeleteBoxMonFirstMoveAndAppend
	pop {r4, pc}
	thumb_func_end DeleteMonFirstMoveAndAppend

	thumb_func_start DeleteBoxMonFirstMoveAndAppend
DeleteBoxMonFirstMoveAndAppend: ; 0x020713FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	str r1, [sp]
	bl AcquireBoxMonLock
	str r0, [sp, #0xc]
	add r0, sp, #0x18
	mov r4, #0
	str r0, [sp, #4]
	add r7, sp, #0x14
	add r6, sp, #0x10
_02071414:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x37
	mov r2, #0
	bl GetBoxMonData
	ldr r1, [sp, #4]
	mov r2, #0
	strh r0, [r1]
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x3b
	bl GetBoxMonData
	add r1, r4, #0
	strb r0, [r7]
	add r0, r5, #0
	add r1, #0x3f
	mov r2, #0
	bl GetBoxMonData
	strb r0, [r6]
	ldr r0, [sp, #4]
	add r4, r4, #1
	add r0, r0, #2
	str r0, [sp, #4]
	add r7, r7, #1
	add r6, r6, #1
	cmp r4, #3
	blt _02071414
	ldr r0, [sp]
	add r1, sp, #0x10
	strh r0, [r1, #0xe]
	ldr r0, [sp]
	mov r1, #5
	bl GetWazaAttr
	add r1, sp, #0x10
	strb r0, [r1, #7]
	mov r4, #0
	add r0, sp, #0x18
	strb r4, [r1, #3]
	str r0, [sp, #8]
	add r7, sp, #0x14
	add r6, sp, #0x10
_0207146E:
	add r1, r4, #0
	ldr r2, [sp, #8]
	add r0, r5, #0
	add r1, #0x36
	bl SetBoxMonData
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x3a
	add r2, r7, #0
	bl SetBoxMonData
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x3e
	add r2, r6, #0
	bl SetBoxMonData
	ldr r0, [sp, #8]
	add r4, r4, #1
	add r0, r0, #2
	str r0, [sp, #8]
	add r7, r7, #1
	add r6, r6, #1
	cmp r4, #4
	blt _0207146E
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl ReleaseBoxMonLock
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end DeleteBoxMonFirstMoveAndAppend

	thumb_func_start MonSetMoveInSlot_ResetPpUp
MonSetMoveInSlot_ResetPpUp: ; 0x020714B0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	bl MonSetMoveInSlot
	mov r0, #0
	add r1, r4, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, #0x3e
	add r2, sp, #0
	bl SetMonData
	add r0, r6, #0
	mov r1, #0
	bl WazaGetMaxPp
	add r4, #0x3a
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #4
	bl SetMonData
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end MonSetMoveInSlot_ResetPpUp

	thumb_func_start MonSetMoveInSlot
MonSetMoveInSlot: ; 0x020714E8
	ldr r3, _020714EC ; =BoxMonSetMoveInSlot
	bx r3
	.balign 4, 0
_020714EC: .word BoxMonSetMoveInSlot
	thumb_func_end MonSetMoveInSlot

	thumb_func_start BoxMonSetMoveInSlot
BoxMonSetMoveInSlot: ; 0x020714F0
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r1, r4, #0
	add r1, #0x36
	add r2, sp, #0x14
	add r5, r0, #0
	bl SetBoxMonData
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x3e
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	add r0, sp, #0x10
	ldrh r0, [r0, #4]
	bl WazaGetMaxPp
	add r1, sp, #0
	strb r0, [r1]
	add r4, #0x3a
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0
	bl SetBoxMonData
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end BoxMonSetMoveInSlot

	thumb_func_start MonTryLearnMoveOnLevelUp
MonTryLearnMoveOnLevelUp: ; 0x02071534
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	add r5, r1, #0
	mov r0, #0
	mov r1, #0x2c
	str r2, [sp]
	str r0, [sp, #8]
	bl AllocFromHeap
	add r4, r0, #0
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xc]
	add r0, r7, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r0, [sp, #4]
	ldr r1, [sp, #0xc]
	add r2, r4, #0
	bl LoadWotbl_HandleAlternateForme
	ldr r0, [r5]
	lsl r0, r0, #1
	ldrh r2, [r4, r0]
	ldr r0, _020715F4 ; =0x0000FFFF
	cmp r2, r0
	bne _02071596
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02071596:
	mov r0, #0xfe
	lsl r0, r0, #8
	add r3, r2, #0
	and r3, r0
	lsl r6, r6, #9
	cmp r6, r3
	beq _020715C8
	ldr r1, _020715F4 ; =0x0000FFFF
_020715A6:
	ldr r2, [r5]
	add r2, r2, #1
	str r2, [r5]
	lsl r2, r2, #1
	ldrh r2, [r4, r2]
	cmp r2, r1
	bne _020715C0
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020715C0:
	add r3, r2, #0
	and r3, r0
	cmp r6, r3
	bne _020715A6
_020715C8:
	cmp r6, r3
	bne _020715E8
	ldr r0, _020715F8 ; =0x000001FF
	add r1, r2, #0
	and r1, r0
	ldr r0, [sp]
	strh r1, [r0]
	ldr r0, [r5]
	ldr r1, [sp]
	add r0, r0, #1
	str r0, [r5]
	ldrh r1, [r1]
	add r0, r7, #0
	bl TryAppendMonMove
	str r0, [sp, #8]
_020715E8:
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [sp, #8]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020715F4: .word 0x0000FFFF
_020715F8: .word 0x000001FF
	thumb_func_end MonTryLearnMoveOnLevelUp

	thumb_func_start MonSwapMoves
MonSwapMoves: ; 0x020715FC
	ldr r3, _02071600 ; =BoxMonSwapMoves
	bx r3
	.balign 4, 0
_02071600: .word BoxMonSwapMoves
	thumb_func_end MonSwapMoves

	thumb_func_start BoxMonSwapMoves
BoxMonSwapMoves: ; 0x02071604
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	add r6, r2, #0
	add r1, #0x36
	mov r2, #0
	add r5, r0, #0
	bl GetBoxMonData
	add r1, sp, #0
	strh r0, [r1, #4]
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x3a
	mov r2, #0
	bl GetBoxMonData
	add r1, sp, #0
	strb r0, [r1, #2]
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x3e
	mov r2, #0
	bl GetBoxMonData
	add r1, sp, #0
	strb r0, [r1]
	add r1, r6, #0
	add r0, r5, #0
	add r1, #0x36
	mov r2, #0
	bl GetBoxMonData
	add r1, sp, #0
	strh r0, [r1, #6]
	add r1, r6, #0
	add r0, r5, #0
	add r1, #0x3a
	mov r2, #0
	bl GetBoxMonData
	add r1, sp, #0
	strb r0, [r1, #3]
	add r1, r6, #0
	add r0, r5, #0
	add r1, #0x3e
	mov r2, #0
	bl GetBoxMonData
	add r1, sp, #0
	strb r0, [r1, #1]
	add r1, r4, #0
	add r2, sp, #4
	add r0, r5, #0
	add r1, #0x36
	add r2, #2
	bl SetBoxMonData
	add r1, r4, #0
	add r2, sp, #0
	add r0, r5, #0
	add r1, #0x3a
	add r2, #3
	bl SetBoxMonData
	add r4, #0x3e
	add r2, sp, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, #1
	bl SetBoxMonData
	add r1, r6, #0
	add r0, r5, #0
	add r1, #0x36
	add r2, sp, #4
	bl SetBoxMonData
	add r1, r6, #0
	add r2, sp, #0
	add r0, r5, #0
	add r1, #0x3a
	add r2, #2
	bl SetBoxMonData
	add r6, #0x3e
	add r0, r5, #0
	add r1, r6, #0
	add r2, sp, #0
	bl SetBoxMonData
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end BoxMonSwapMoves

	thumb_func_start MonDeleteMoveSlot
MonDeleteMoveSlot: ; 0x020716C0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #3
	bhs _02071726
	mov r7, #0
	add r6, sp, #0
_020716CE:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x37
	add r2, r7, #0
	bl GetMonData
	add r1, r4, #0
	strh r0, [r6, #2]
	add r0, r5, #0
	add r1, #0x3b
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	strb r0, [r6, #1]
	add r0, r5, #0
	add r1, #0x3f
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r2, sp, #0
	strb r0, [r6]
	add r0, r5, #0
	add r1, #0x36
	add r2, #2
	bl SetMonData
	add r1, r4, #0
	add r2, sp, #0
	add r0, r5, #0
	add r1, #0x3a
	add r2, #1
	bl SetMonData
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x3e
	add r2, sp, #0
	bl SetMonData
	add r4, r4, #1
	cmp r4, #3
	blo _020716CE
_02071726:
	mov r1, #0
	add r0, sp, #0
	strh r1, [r0, #2]
	strb r1, [r0, #1]
	strb r1, [r0]
	add r2, sp, #0
	add r0, r5, #0
	mov r1, #0x39
	add r2, #2
	bl SetMonData
	add r2, sp, #0
	add r0, r5, #0
	mov r1, #0x3d
	add r2, #1
	bl SetMonData
	add r0, r5, #0
	mov r1, #0x41
	add r2, sp, #0
	bl SetMonData
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end MonDeleteMoveSlot

	thumb_func_start MonHasMove
MonHasMove: ; 0x02071754
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	add r6, r0, #0
	add r5, r1, #0
	add r7, r4, #0
_0207175E:
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x36
	add r2, r7, #0
	bl GetMonData
	cmp r5, r0
	beq _02071774
	add r4, r4, #1
	cmp r4, #4
	blt _0207175E
_02071774:
	cmp r4, #4
	beq _0207177C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207177C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end MonHasMove

	thumb_func_start CopyBoxPokemonToPokemon
CopyBoxPokemonToPokemon: ; 0x02071780
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	str r0, [sp]
	add r3, r4, #0
	mov r2, #0x11
_02071790:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02071790
	ldrh r1, [r4, #4]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1f
	beq _020717AA
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strh r0, [r4, #4]
_020717AA:
	add r0, r4, #0
	mov r1, #0xa0
	add r2, sp, #0
	bl SetMonData
	add r0, r4, #0
	mov r1, #0xa3
	add r2, sp, #0
	bl SetMonData
	add r0, r4, #0
	mov r1, #0xa4
	add r2, sp, #0
	bl SetMonData
	mov r0, #0
	bl Mail_new
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0xaa
	add r2, r5, #0
	bl SetMonData
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0xa2
	add r2, sp, #0
	bl SetMonData
	mov r0, #0
	add r1, sp, #4
	mov r2, #0x18
	bl MIi_CpuClearFast
	add r0, r4, #0
	mov r1, #0xab
	add r2, sp, #4
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end CopyBoxPokemonToPokemon

	thumb_func_start Party_GetMaxLevel
Party_GetMaxLevel: ; 0x02071808
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl GetPartyCount
	add r7, r0, #0
	mov r6, #1
	mov r5, #0
	cmp r7, #0
	ble _02071858
_0207181A:
	ldr r0, [sp]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02071852
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02071852
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, r6
	bls _02071852
	add r6, r0, #0
_02071852:
	add r5, r5, #1
	cmp r5, r7
	blt _0207181A
_02071858:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end Party_GetMaxLevel

	thumb_func_start SpeciesToJohtoDexNo
SpeciesToJohtoDexNo: ; 0x0207185C
	push {r3, lr}
	sub sp, #8
	add r3, r0, #0
	mov r0, #2
	str r0, [sp]
	add r0, sp, #4
	mov r1, #0x8a
	mov r2, #0
	lsl r3, r3, #1
	bl ReadFromNarcMemberByIdPair
	add r0, sp, #4
	ldrh r0, [r0]
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end SpeciesToJohtoDexNo

	thumb_func_start LoadSpeciesToJohtoDexNoLUT
LoadSpeciesToJohtoDexNoLUT: ; 0x0207187C
	ldr r3, _02071888 ; =AllocAtEndAndReadWholeNarcMemberByIdPair
	mov r0, #0x8a
	mov r1, #0
	mov r2, #3
	bx r3
	nop
_02071888: .word AllocAtEndAndReadWholeNarcMemberByIdPair
	thumb_func_end LoadSpeciesToJohtoDexNoLUT

	thumb_func_start CopyPokemonToPokemon
CopyPokemonToPokemon: ; 0x0207188C
	push {r3, r4}
	add r4, r0, #0
	add r3, r1, #0
	mov r2, #0x1d
_02071894:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02071894
	ldr r0, [r4]
	str r0, [r3]
	pop {r3, r4}
	bx lr
	thumb_func_end CopyPokemonToPokemon

	thumb_func_start CopyPokemonToBoxPokemon
CopyPokemonToBoxPokemon: ; 0x020718A4
	push {r3, r4}
	add r4, r0, #0
	add r3, r1, #0
	mov r2, #0x11
_020718AC:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020718AC
	pop {r3, r4}
	bx lr
	thumb_func_end CopyPokemonToBoxPokemon

	thumb_func_start CopyBoxPokemonToBoxPokemon
CopyBoxPokemonToBoxPokemon: ; 0x020718B8
	push {r3, r4}
	add r4, r0, #0
	add r3, r1, #0
	mov r2, #0x11
_020718C0:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020718C0
	pop {r3, r4}
	bx lr
	thumb_func_end CopyBoxPokemonToBoxPokemon

	thumb_func_start MonGetFlavorPreference
MonGetFlavorPreference: ; 0x020718CC
	ldr r3, _020718D0 ; =BoxMonGetFlavorPreference
	bx r3
	.balign 4, 0
_020718D0: .word BoxMonGetFlavorPreference
	thumb_func_end MonGetFlavorPreference

	thumb_func_start BoxMonGetFlavorPreference
BoxMonGetFlavorPreference: ; 0x020718D4
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0
	add r2, r1, #0
	bl GetBoxMonData
	add r1, r4, #0
	bl GetFlavorPreferenceFromPID
	pop {r4, pc}
	thumb_func_end BoxMonGetFlavorPreference

	thumb_func_start GetFlavorPreferenceFromPID
GetFlavorPreferenceFromPID: ; 0x020718E8
	push {r4, lr}
	add r4, r1, #0
	bl GetNatureFromPersonality
	lsl r1, r0, #2
	add r1, r0, r1
	ldr r0, _020718FC ; =_020FF5BC
	add r0, r0, r1
	ldrsb r0, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_020718FC: .word _020FF5BC
	thumb_func_end GetFlavorPreferenceFromPID

	thumb_func_start Species_LoadLearnsetTable
Species_LoadLearnsetTable: ; 0x02071900
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r7, r1, #0
	mov r0, #0
	mov r1, #0x2c
	add r5, r2, #0
	bl AllocFromHeap
	add r6, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	add r2, r6, #0
	bl LoadWotbl_HandleAlternateForme
	ldrh r1, [r6]
	ldr r0, _02071948 ; =0x0000FFFF
	mov r4, #0
	cmp r1, r0
	beq _0207193E
	ldr r1, _0207194C ; =0x000001FF
	ldr r2, _02071948 ; =0x0000FFFF
	add r0, r6, #0
_0207192C:
	ldrh r3, [r0]
	add r0, r0, #2
	add r4, r4, #1
	and r3, r1
	strh r3, [r5]
	ldrh r3, [r0]
	add r5, r5, #2
	cmp r3, r2
	bne _0207192C
_0207193E:
	add r0, r6, #0
	bl FreeToHeap
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02071948: .word 0x0000FFFF
_0207194C: .word 0x000001FF
	thumb_func_end Species_LoadLearnsetTable

	thumb_func_start Party_GivePokerusAtRandom
Party_GivePokerusAtRandom: ; 0x02071950
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl GetPartyCount
	add r6, r0, #0
	bl LCRandom
	mov r1, #1
	lsl r1, r1, #0xe
	cmp r0, r1
	beq _02071974
	lsl r1, r1, #1
	cmp r0, r1
	beq _02071974
	mov r1, #3
	lsl r1, r1, #0xe
	cmp r0, r1
	bne _020719F6
_02071974:
	bl LCRandom
	add r1, r6, #0
	bl _s32_div_f
	add r0, r5, #0
	add r7, r1, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02071974
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02071974
	add r0, r7, #0
	bl MaskOfFlagNo
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl Party_MaskMonsWithPokerus
	cmp r0, #0
	bne _020719F6
	add r5, sp, #0
	mov r6, #7
_020719BC:
	bl LCRandom
	strb r0, [r5]
	ldrb r2, [r5]
	add r1, r2, #0
	and r1, r6
	beq _020719BC
	mov r0, #0xf0
	tst r0, r2
	beq _020719D4
	add r0, sp, #0
	strb r1, [r0]
_020719D4:
	add r1, sp, #0
	ldrb r2, [r1]
	lsl r0, r2, #4
	orr r0, r2
	strb r0, [r1]
	ldrb r2, [r1]
	mov r0, #0xf3
	and r0, r2
	strb r0, [r1]
	ldrb r0, [r1]
	add r2, sp, #0
	add r0, r0, #1
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0x9a
	bl SetMonData
_020719F6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end Party_GivePokerusAtRandom

	thumb_func_start Party_MaskMonsWithPokerus
Party_MaskMonsWithPokerus: ; 0x020719F8
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	add r5, r1, #0
	str r0, [sp]
	mov r4, #1
	add r7, r6, #0
	cmp r5, #0
	beq _02071A36
_02071A08:
	mov r0, #1
	tst r0, r5
	beq _02071A2A
	ldr r0, [sp]
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #0x9a
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02071A2A
	add r0, r7, #0
	orr r0, r4
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
_02071A2A:
	lsl r0, r5, #0x17
	add r6, r6, #1
	lsl r4, r4, #1
	lsr r5, r0, #0x18
	bne _02071A08
	b _02071A4E
_02071A36:
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #0x9a
	add r2, r6, #0
	bl GetMonData
	cmp r0, #0
	beq _02071A4E
	add r0, r7, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
_02071A4E:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end Party_MaskMonsWithPokerus

	thumb_func_start Party_UpdatePokerus
Party_UpdatePokerus: ; 0x02071A54
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r5, r1, #0
	bl GetPartyCount
	mov r6, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _02071AC6
	add r4, sp, #8
_02071A6A:
	ldr r0, [sp]
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02071ABE
	add r0, r7, #0
	mov r1, #0x9a
	mov r2, #0
	bl GetMonData
	strb r0, [r4]
	ldrb r1, [r4]
	mov r0, #0xf
	and r0, r1
	beq _02071ABE
	cmp r0, r5
	blt _02071A9C
	cmp r5, #4
	ble _02071AA6
_02071A9C:
	ldrb r1, [r4]
	mov r0, #0xf0
	and r0, r1
	strb r0, [r4]
	b _02071AAA
_02071AA6:
	sub r0, r1, r5
	strb r0, [r4]
_02071AAA:
	ldrb r0, [r4]
	cmp r0, #0
	bne _02071AB4
	mov r0, #0x10
	strb r0, [r4]
_02071AB4:
	add r0, r7, #0
	mov r1, #0x9a
	add r2, sp, #8
	bl SetMonData
_02071ABE:
	ldr r0, [sp, #4]
	add r6, r6, #1
	cmp r6, r0
	blt _02071A6A
_02071AC6:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end Party_UpdatePokerus

	thumb_func_start Party_SpreadPokerus
Party_SpreadPokerus: ; 0x02071ACC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl GetPartyCount
	add r7, r0, #0
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	cmp r1, #0
	bne _02071B74
	mov r4, #0
	cmp r7, #0
	ble _02071B74
	sub r0, r7, #1
	str r0, [sp]
_02071AF0:
	add r0, r5, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02071B6E
	add r0, r6, #0
	mov r1, #0x9a
	mov r2, #0
	bl GetMonData
	add r1, sp, #4
	strb r0, [r1]
	add r0, r1, #0
	ldrb r1, [r0]
	mov r0, #0xf
	tst r0, r1
	beq _02071B6E
	cmp r4, #0
	beq _02071B44
	add r0, r5, #0
	sub r1, r4, #1
	bl GetPartyMonByIndex
	mov r1, #0x9a
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	mov r1, #0xf0
	tst r0, r1
	bne _02071B44
	add r0, r6, #0
	mov r1, #0x9a
	add r2, sp, #4
	bl SetMonData
_02071B44:
	ldr r0, [sp]
	cmp r4, r0
	bge _02071B6E
	add r0, r5, #0
	add r1, r4, #1
	bl GetPartyMonByIndex
	mov r1, #0x9a
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	mov r1, #0xf0
	tst r0, r1
	bne _02071B6E
	add r0, r6, #0
	mov r1, #0x9a
	add r2, sp, #4
	bl SetMonData
	add r4, r4, #1
_02071B6E:
	add r4, r4, #1
	cmp r4, r7
	blt _02071AF0
_02071B74:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end Party_SpreadPokerus

	thumb_func_start Pokemon_HasPokerus
Pokemon_HasPokerus: ; 0x02071B78
	ldr r3, _02071B7C ; =BoxMon_HasPokerus
	bx r3
	.balign 4, 0
_02071B7C: .word BoxMon_HasPokerus
	thumb_func_end Pokemon_HasPokerus

	thumb_func_start BoxMon_HasPokerus
BoxMon_HasPokerus: ; 0x02071B80
	push {r3, lr}
	mov r1, #0x9a
	mov r2, #0
	bl GetBoxMonData
	mov r1, #0xf
	tst r0, r1
	beq _02071B94
	mov r0, #1
	pop {r3, pc}
_02071B94:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end BoxMon_HasPokerus

	thumb_func_start Pokemon_IsImmuneToPokerus
Pokemon_IsImmuneToPokerus: ; 0x02071B98
	ldr r3, _02071B9C ; =BoxMon_IsImmuneToPokerus
	bx r3
	.balign 4, 0
_02071B9C: .word BoxMon_IsImmuneToPokerus
	thumb_func_end Pokemon_IsImmuneToPokerus

	thumb_func_start BoxMon_IsImmuneToPokerus
BoxMon_IsImmuneToPokerus: ; 0x02071BA0
	push {r3, lr}
	mov r1, #0x9a
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0xf
	tst r0, r1
	beq _02071BB8
	mov r0, #0
	pop {r3, pc}
_02071BB8:
	mov r0, #0xf0
	tst r0, r1
	beq _02071BC2
	mov r0, #1
	pop {r3, pc}
_02071BC2:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end BoxMon_IsImmuneToPokerus

	thumb_func_start sub_02071BC8
sub_02071BC8: ; 0x02071BC8
	ldr r3, _02071BCC ; =sub_02071BD0
	bx r3
	.balign 4, 0
_02071BCC: .word sub_02071BD0
	thumb_func_end sub_02071BC8

	thumb_func_start sub_02071BD0
sub_02071BD0: ; 0x02071BD0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0xa
	mov r2, #0
	bl GetBoxMonData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	ldr r1, _02071C24 ; =0x000001ED
	cmp r4, r1
	bne _02071C20
	cmp r6, #0x79
	bne _02071C20
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #1
	mov r2, #0
	bl GetItemAttr
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GetArceusTypeByHeldItemEffect
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x70
	add r2, sp, #0
	bl SetBoxMonData
_02071C20:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02071C24: .word 0x000001ED
	thumb_func_end sub_02071BD0

	thumb_func_start GetArceusTypeByHeldItemEffect
GetArceusTypeByHeldItemEffect: ; 0x02071C28
	sub r0, #0x7e
	cmp r0, #0xf
	bhi _02071C9A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02071C3A: ; jump table
	.short _02071C5A - _02071C3A - 2 ; case 0
	.short _02071C5E - _02071C3A - 2 ; case 1
	.short _02071C62 - _02071C3A - 2 ; case 2
	.short _02071C66 - _02071C3A - 2 ; case 3
	.short _02071C6A - _02071C3A - 2 ; case 4
	.short _02071C6E - _02071C3A - 2 ; case 5
	.short _02071C72 - _02071C3A - 2 ; case 6
	.short _02071C76 - _02071C3A - 2 ; case 7
	.short _02071C7A - _02071C3A - 2 ; case 8
	.short _02071C7E - _02071C3A - 2 ; case 9
	.short _02071C82 - _02071C3A - 2 ; case 10
	.short _02071C86 - _02071C3A - 2 ; case 11
	.short _02071C8A - _02071C3A - 2 ; case 12
	.short _02071C8E - _02071C3A - 2 ; case 13
	.short _02071C92 - _02071C3A - 2 ; case 14
	.short _02071C96 - _02071C3A - 2 ; case 15
_02071C5A:
	mov r0, #0xa
	bx lr
_02071C5E:
	mov r0, #0xb
	bx lr
_02071C62:
	mov r0, #0xd
	bx lr
_02071C66:
	mov r0, #0xc
	bx lr
_02071C6A:
	mov r0, #0xf
	bx lr
_02071C6E:
	mov r0, #1
	bx lr
_02071C72:
	mov r0, #3
	bx lr
_02071C76:
	mov r0, #4
	bx lr
_02071C7A:
	mov r0, #2
	bx lr
_02071C7E:
	mov r0, #0xe
	bx lr
_02071C82:
	mov r0, #6
	bx lr
_02071C86:
	mov r0, #5
	bx lr
_02071C8A:
	mov r0, #7
	bx lr
_02071C8E:
	mov r0, #0x10
	bx lr
_02071C92:
	mov r0, #0x11
	bx lr
_02071C96:
	mov r0, #8
	bx lr
_02071C9A:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end GetArceusTypeByHeldItemEffect

	thumb_func_start Mon_UpdateGiratinaForme
Mon_UpdateGiratinaForme: ; 0x02071CA0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl BoxMon_UpdateGiratinaForme
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _02071CB8
	add r0, r5, #0
	bl CalcMonLevelAndStats
_02071CB8:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end Mon_UpdateGiratinaForme

	thumb_func_start BoxMon_UpdateGiratinaForme
BoxMon_UpdateGiratinaForme: ; 0x02071CBC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	ldr r1, _02071D00 ; =0x000001E7 SPECIES_GIRATINA
	cmp r4, r1
	bne _02071CFA
	cmp r0, #0x70 ; ITEM_GRISEOUS_ORB
	bne _02071CE2
	mov r0, #1
	b _02071CE4
_02071CE2:
	mov r0, #0
_02071CE4:
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x70
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r5, #0
	bl UpdateBoxMonAbility
	ldr r0, [sp]
	pop {r3, r4, r5, pc}
_02071CFA:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02071D00: .word 0x000001E7
	thumb_func_end BoxMon_UpdateGiratinaForme

	thumb_func_start Mon_ForceSetGiratinaOriginForme
Mon_ForceSetGiratinaOriginForme: ; 0x02071D04
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #1
	str r1, [sp]
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	ldr r1, _02071D38 ; =0x000001E7
	cmp r0, r1
	bne _02071D32
	add r0, r4, #0
	mov r1, #0x70
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	bl UpdateBoxMonAbility
	add r0, r4, #0
	bl CalcMonLevelAndStats
_02071D32:
	add sp, #4
	pop {r3, r4, pc}
	nop
_02071D38: .word 0x000001E7
	thumb_func_end Mon_ForceSetGiratinaOriginForme

	thumb_func_start sub_02071D3C
sub_02071D3C: ; 0x02071D3C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	bl GetPartyCount
	add r6, r0, #0
	mov r4, #0
	cmp r6, #0
	ble _02071D6A
_02071D4E:
	add r0, r7, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	cmp r5, #0
	beq _02071D60
	bl Mon_ForceSetGiratinaOriginForme
	b _02071D64
_02071D60:
	bl Mon_UpdateGiratinaForme
_02071D64:
	add r4, r4, #1
	cmp r4, r6
	blt _02071D4E
_02071D6A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02071D3C

	thumb_func_start Mon_UpdateShayminForme
Mon_UpdateShayminForme: ; 0x02071D6C
	push {r4, lr}
	add r4, r0, #0
	bl BoxMon_UpdateShayminForme
	add r0, r4, #0
	bl CalcMonLevelAndStats
	pop {r4, pc}
	thumb_func_end Mon_UpdateShayminForme

	thumb_func_start BoxMon_UpdateShayminForme
BoxMon_UpdateShayminForme: ; 0x02071D7C
	push {r0, r1, r2, r3}
	push {r4, lr}
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetBoxMonData
	mov r1, #0x7b
	lsl r1, r1, #2 ; SPECIES_SHAYMIN
	cmp r0, r1
	bne _02071DAC
	ldr r0, [sp, #0xc]
	cmp r0, #1
	ble _02071D9C
	bl GF_AssertFail
_02071D9C:
	add r0, r4, #0
	mov r1, #0x70
	add r2, sp, #0xc
	bl SetBoxMonData
	add r0, r4, #0
	bl UpdateBoxMonAbility
_02071DAC:
	pop {r4}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end BoxMon_UpdateShayminForme

	thumb_func_start Mon_CanUseGracidea
Mon_CanUseGracidea: ; 0x02071DB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, sp, #4
	bl GF_RTC_CopyTime
	mov r0, #0x7b
	lsl r0, r0, #2
	cmp r5, r0 ; SPECIES_SHAYMIN
	bne _02071E26
	cmp r6, #0 ; Land forme
	bne _02071E26
	ldr r0, [sp]
	cmp r0, #0 ; Not fainted
	beq _02071E26
	cmp r4, #1 ; Is fateful encounter
	bne _02071E26
	mov r0, #0x20
	tst r0, r7
	bne _02071E26 ; Not frozen
	ldr r0, [sp, #4]
	; Time between 05-20
	cmp r0, #4
	blo _02071E26
	cmp r0, #0x14
	bhs _02071E26
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02071E26:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end Mon_CanUseGracidea

	thumb_func_start Party_ResetAllShayminToLandForme
Party_ResetAllShayminToLandForme: ; 0x02071E2C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl GetPartyCount
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _02071E74
_02071E3C:
	ldr r0, [sp]
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r4, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	mov r1, #0x7b
	lsl r1, r1, #2
	cmp r6, r1
	bne _02071E6E
	cmp r0, #1
	bne _02071E6E
	add r0, r4, #0
	mov r1, #0
	bl Mon_UpdateShayminForme
_02071E6E:
	add r5, r5, #1
	cmp r5, r7
	blt _02071E3C
_02071E74:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end Party_ResetAllShayminToLandForme

	thumb_func_start Party_TryResetShaymin
Party_TryResetShaymin: ; 0x02071E78
	push {r4, lr}
	ldr r3, [r2]
	cmp r3, #0x14
	bhs _02071E84
	cmp r3, #4
	bhs _02071EA6
_02071E84:
	cmp r3, #4
	bge _02071E8A
	add r3, #0x18
_02071E8A:
	ldr r4, [r2, #4]
	sub r3, #0x14
	mov r2, #0x3c
	mul r2, r3
	add r2, r4, r2
	add r1, r1, #1
	cmp r2, r1
	bge _02071EA2
	bl Party_ResetAllShayminToLandForme
	mov r0, #1
	pop {r4, pc}
_02071EA2:
	mov r0, #0
	pop {r4, pc}
_02071EA6:
	ldr r4, [r2, #4]
	sub r3, r3, #4
	mov r2, #0x3c
	mul r2, r3
	add r2, r4, r2
	cmp r2, r1
	bge _02071EBC
	bl Party_ResetAllShayminToLandForme
	mov r0, #1
	pop {r4, pc}
_02071EBC:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end Party_TryResetShaymin

	thumb_func_start Mon_UpdateRotomForme
Mon_UpdateRotomForme: ; 0x02071EC0
	push {r0, r1, r2, r3}
	push {r3, r4, r5, r6, r7, lr}
	str r2, [sp]
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	ldr r1, _02071FBC ; =0x000001DF SPECIES_ROTOM
	cmp r0, r1
	beq _02071EE0
	mov r0, #0
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
_02071EE0:
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	ldr r0, [sp, #0x1c]
	mov r5, #0
	lsl r1, r0, #1
	ldr r0, _02071FC0 ; =_020FF4EC
	add r7, r5, #0
	ldrh r6, [r0, r1] ; Move associated with the old forme
_02071EF6:
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x36
	add r2, r7, #0
	bl GetMonData
	ldr r3, _02071FC4 ; =_020FF4EC + 2
	add r2, r0, #0
	mov r1, #1
_02071F08:
	cmp r2, #0
	beq _02071F34
	ldrh r0, [r3]
	cmp r2, r0
	bne _02071F34
	cmp r6, #0
	beq _02071F28
	lsl r1, r6, #0x10
	lsl r2, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x18
	bl MonSetMoveInSlot_ResetPpUp
	mov r6, #0
	b _02071F3C
_02071F28:
	add r0, r4, #0
	add r1, r5, #0
	bl MonDeleteMoveSlot
	sub r5, r5, #1
	b _02071F3C
_02071F34:
	add r1, r1, #1
	add r3, r3, #2
	cmp r1, #6
	blo _02071F08
_02071F3C:
	add r5, r5, #1
	cmp r5, #4
	blt _02071EF6
	cmp r6, #0
	beq _02071F84
	mov r5, #0
	add r7, r5, #0
_02071F4A:
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x36
	add r2, r7, #0
	bl GetMonData
	cmp r0, #0
	bne _02071F6A
	lsl r1, r6, #0x10
	lsl r2, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x18
	bl MonSetMoveInSlot_ResetPpUp
	b _02071F70
_02071F6A:
	add r5, r5, #1
	cmp r5, #4
	blt _02071F4A
_02071F70:
	cmp r5, #4
	bne _02071F84
	ldr r2, [sp]
	lsl r1, r6, #0x10
	lsl r2, r2, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x18
	bl MonSetMoveInSlot_ResetPpUp
_02071F84:
	add r0, r4, #0
	mov r1, #0x36
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02071F9C
	add r0, r4, #0
	mov r1, #0x54
	mov r2, #0
	bl MonSetMoveInSlot_ResetPpUp
_02071F9C:
	add r0, r4, #0
	mov r1, #0x70
	add r2, sp, #0x1c
	bl SetMonData
	add r0, r4, #0
	bl UpdateMonAbility
	add r0, r4, #0
	bl CalcMonLevelAndStats
	mov r0, #1
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_02071FBC: .word 0x000001DF
_02071FC0: .word _020FF4EC
_02071FC4: .word _020FF4EC + 2
	thumb_func_end Mon_UpdateRotomForme

	thumb_func_start LoadWotbl_HandleAlternateForme
LoadWotbl_HandleAlternateForme: ; 0x02071FC8
	push {r4, lr}
	add r4, r2, #0
	bl ResolveMonForme
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x21
	bl ReadWholeNarcMemberByIdPair
	pop {r4, pc}
	thumb_func_end LoadWotbl_HandleAlternateForme

	thumb_func_start sub_02071FDC
sub_02071FDC: ; 0x02071FDC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	ldr r0, _02072048 ; =0x000001B9 SPECIES_CHATOT
	add r4, r2, #0
	add r5, r1, #0
	cmp r4, r0
	bne _02072030
	add r0, r5, #0
	bl sub_02006F30
	cmp r0, #0
	bne _02072014
	mov r0, #1
	bl sub_02006E3C
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x18]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r3, [sp, #0x1c]
	add r0, r5, #0
	add r1, r4, #0
	bl PlayCryEx
	add sp, #8
	pop {r4, r5, r6, pc}
_02072014:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _02072020
	mov r0, #1
	bl sub_02006E3C
_02072020:
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	add r0, r6, #0
	mov r1, #0
	bl sub_02006E4C
	add sp, #8
	pop {r4, r5, r6, pc}
_02072030:
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x18]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r3, [sp, #0x1c]
	add r0, r5, #0
	add r1, r4, #0
	bl PlayCryEx
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02072048: .word 0x000001B9
	thumb_func_end sub_02071FDC

	thumb_func_start sub_0207204C
sub_0207204C: ; 0x0207204C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	ldr r0, _020720D0 ; =0x000001B9
	add r5, r2, #0
	add r6, r1, #0
	add r4, r3, #0
	cmp r5, r0
	bne _020720B0
	add r0, r6, #0
	bl sub_02006F30
	cmp r0, #0
	bne _0207208E
	mov r0, #1
	bl sub_02006E3C
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	add r0, sp, #0x30
	ldrb r0, [r0]
	ldr r3, [sp, #0x24]
	add r1, r5, #0
	str r0, [sp, #4]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r6, #0
	bl sub_02006920
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0207208E:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _0207209A
	mov r0, #1
	bl sub_02006E3C
_0207209A:
	add r0, sp, #0x30
	ldrb r0, [r0]
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	add r0, r7, #0
	mov r1, #0
	bl sub_02006EA0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_020720B0:
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	add r0, sp, #0x30
	ldrb r0, [r0]
	ldr r3, [sp, #0x24]
	add r1, r5, #0
	str r0, [sp, #4]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r6, #0
	bl sub_02006920
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020720D0: .word 0x000001B9
	thumb_func_end sub_0207204C

	thumb_func_start sub_020720D4
sub_020720D4: ; 0x020720D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	lsl r0, r4, #0x10
	lsl r1, r1, #0x18
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	bl PlayCry
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020720D4

	thumb_func_start sub_020720FC
sub_020720FC: ; 0x020720FC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, [sp, #0x20]
	add r5, r0, #0
	str r6, [sp]
	ldr r6, [sp, #0x24]
	add r4, r2, #0
	str r6, [sp, #4]
	bl sub_0207213C
	cmp r4, #0xe
	bne _02072138
	add r0, r5, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0xa3
	add r2, sp, #8
	bl SetMonData
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0xa0
	add r2, sp, #8
	bl SetMonData
_02072138:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_020720FC

	thumb_func_start sub_0207213C
sub_0207213C: ; 0x0207213C
	push {r0, r1, r2, r3}
	push {r3, r4, lr}
	sub sp, #4
	ldr r2, [sp, #0x24]
	add r4, r0, #0
	str r2, [sp]
	mov r2, #0
	bl sub_0208F270
	ldr r2, _02072178 ; =gGameVersion
	add r0, r4, #0
	mov r1, #0x7a
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x9b
	add r2, sp, #0x18
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x9e
	add r2, sp, #0x20
	bl SetBoxMonData
	add sp, #4
	pop {r3, r4}
	pop {r3}
	add sp, #0x10
	bx r3
	nop
_02072178: .word gGameVersion
	thumb_func_end sub_0207213C

	thumb_func_start sub_0207217C
sub_0207217C: ; 0x0207217C
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x14]
	str r4, [sp, #4]
	bl sub_02072190
	add sp, #8
	pop {r4, pc}
	thumb_func_end sub_0207217C

	thumb_func_start sub_02072190
sub_02072190: ; 0x02072190
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x14]
	str r4, [sp, #4]
	bl sub_0207213C
	add sp, #8
	pop {r4, pc}
	thumb_func_end sub_02072190

	thumb_func_start sub_020721A4
sub_020721A4: ; 0x020721A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x81
	add r7, r2, #0
	tst r0, r1
	bne _0207223E
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	add r4, r1, #0
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r1, [sp]
	add r0, r6, #0
	mov r2, #0x10
	bl GetMonBaseStat_HandleAlternateForme
	add r1, sp, #4
	strh r0, [r1, #2]
	ldr r1, [sp]
	add r0, r6, #0
	mov r2, #0x11
	bl GetMonBaseStat_HandleAlternateForme
	add r1, sp, #4
	strh r0, [r1]
	ldrh r2, [r1, #2]
	ldrh r0, [r1]
	cmp r2, r0
	bne _02072214
	cmp r2, #0
	beq _02072214
	add r2, sp, #4
	add r0, r5, #0
	mov r1, #6
	add r2, #2
	bl SetMonData
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02072214:
	ldr r0, _02072244 ; =_020FF4E4
	lsl r1, r7, #2
	ldrh r0, [r0, r1]
	cmp r4, r0
	blo _0207223E
	ldr r0, _02072248 ; =_020FF4E4 + 2
	ldrh r0, [r0, r1]
	cmp r4, r0
	add r2, sp, #4
	bhs _02072236
	add r0, r5, #0
	mov r1, #6
	add r2, #2
	bl SetMonData
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02072236:
	add r0, r5, #0
	mov r1, #6
	bl SetMonData
_0207223E:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02072244: .word _020FF4E4
_02072248: .word _020FF4E4 + 2
	thumb_func_end sub_020721A4

	thumb_func_start sub_0207224C
sub_0207224C: ; 0x0207224C
	ldr r3, _02072250 ; =sub_02072254
	bx r3
	.balign 4, 0
_02072250: .word sub_02072254
	thumb_func_end sub_0207224C

	thumb_func_start sub_02072254
sub_02072254: ; 0x02072254
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #0xae
	mov r2, #0
	add r5, r0, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	add r1, r0, #0
	add r0, r4, #0
	add r2, r6, #0
	bl sub_0207227C
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02072254

	thumb_func_start sub_0207227C
sub_0207227C: ; 0x0207227C
	push {r4, lr}
	ldr r3, _020722D0 ; =0x000001EE
	cmp r0, r3
	bne _02072288
	mov r0, #0
	pop {r4, pc}
_02072288:
	cmp r2, #0x20
	bhs _02072296
	mov r3, #1
	add r4, r3, #0
	lsl r4, r2
	mov r2, #0x1d
	b _020722C0
_02072296:
	cmp r2, #0x40
	bhs _020722A6
	mov r3, #1
	sub r2, #0x20
	add r4, r3, #0
	lsl r4, r2
	mov r2, #0x1e
	b _020722C0
_020722A6:
	cmp r2, #0x60
	bhs _020722B6
	mov r3, #1
	sub r2, #0x40
	add r4, r3, #0
	lsl r4, r2
	mov r2, #0x1f
	b _020722C0
_020722B6:
	mov r3, #1
	sub r2, #0x60
	add r4, r3, #0
	lsl r4, r2
	mov r2, #0x20
_020722C0:
	bl GetMonBaseStat_HandleAlternateForme
	tst r0, r4
	beq _020722CC
	mov r0, #1
	pop {r4, pc}
_020722CC:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_020722D0: .word 0x000001EE
	thumb_func_end sub_0207227C

	thumb_func_start UpdateMonAbility
UpdateMonAbility: ; 0x020722D4
	ldr r3, _020722D8 ; =UpdateBoxMonAbility
	bx r3
	.balign 4, 0
_020722D8: .word UpdateBoxMonAbility
	thumb_func_end UpdateMonAbility

	thumb_func_start UpdateBoxMonAbility
UpdateBoxMonAbility: ; 0x020722DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl AcquireBoxMonLock
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	mov r1, #0
	add r4, r0, #0
	add r0, r5, #0
	add r2, r1, #0
	bl GetBoxMonData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp]
	ldr r1, [sp]
	add r0, r4, #0
	mov r2, #0x18
	bl GetMonBaseStat_HandleAlternateForme
	str r0, [sp, #8]
	ldr r1, [sp]
	add r0, r4, #0
	mov r2, #0x19
	bl GetMonBaseStat_HandleAlternateForme
	str r0, [sp, #4]
	cmp r0, #0
	beq _02072346
	mov r0, #1
	tst r0, r6
	beq _0207233A
	add r0, r5, #0
	mov r1, #0xa
	add r2, sp, #4
	bl SetBoxMonData
	b _02072350
_0207233A:
	add r0, r5, #0
	mov r1, #0xa
	add r2, sp, #8
	bl SetBoxMonData
	b _02072350
_02072346:
	add r0, r5, #0
	mov r1, #0xa
	add r2, sp, #8
	bl SetBoxMonData
_02072350:
	add r0, r5, #0
	add r1, r7, #0
	bl ReleaseBoxMonLock
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end UpdateBoxMonAbility

	thumb_func_start sub_0207235C
sub_0207235C: ; 0x0207235C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #0
	str r1, [sp]
	bl AllocMonZeroed
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl CopyPokemonToPokemon
	ldr r0, [sp, #4]
	ldr r1, [r5]
	mov r2, #0
	bl GetSubstruct
	add r4, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [r5]
	mov r2, #1
	bl GetSubstruct
	add r6, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [r5]
	mov r2, #2
	bl GetSubstruct
	add r7, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [r5]
	mov r2, #3
	bl GetSubstruct
	str r0, [sp, #8]
	ldr r1, [sp]
	add r0, r5, #0
	mov r2, #0
	bl GetSubstruct
	str r0, [sp, #0xc]
	ldr r1, [sp]
	add r0, r5, #0
	mov r2, #1
	bl GetSubstruct
	str r0, [sp, #0x10]
	ldr r1, [sp]
	add r0, r5, #0
	mov r2, #2
	bl GetSubstruct
	str r0, [sp, #0x14]
	ldr r1, [sp]
	add r0, r5, #0
	mov r2, #3
	bl GetSubstruct
	ldr r2, [sp, #4]
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	ldrh r2, [r2, #6]
	add r0, #8
	mov r1, #0x80
	bl MonDecryptSegment
	add r0, r5, #0
	ldr r2, [r5]
	add r0, #0x88
	mov r1, #0x64
	bl MonDecryptSegment
	add r0, r5, #0
	ldrh r2, [r5, #6]
	add r0, #8
	mov r1, #0x80
	bl MonDecryptSegment
	ldr r0, [sp]
	str r0, [r5]
	ldr r2, [sp, #0xc]
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	str r2, [sp, #0xc]
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	str r2, [sp, #0xc]
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	str r2, [sp, #0xc]
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	str r2, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldmia r6!, {r0, r1}
	stmia r2!, {r0, r1}
	str r2, [sp, #0x10]
	ldmia r6!, {r0, r1}
	stmia r2!, {r0, r1}
	str r2, [sp, #0x10]
	ldmia r6!, {r0, r1}
	stmia r2!, {r0, r1}
	str r2, [sp, #0x10]
	ldmia r6!, {r0, r1}
	stmia r2!, {r0, r1}
	str r2, [sp, #0x10]
	ldr r2, [sp, #0x14]
	ldmia r7!, {r0, r1}
	stmia r2!, {r0, r1}
	str r2, [sp, #0x14]
	ldmia r7!, {r0, r1}
	stmia r2!, {r0, r1}
	str r2, [sp, #0x14]
	ldmia r7!, {r0, r1}
	stmia r2!, {r0, r1}
	str r2, [sp, #0x14]
	ldmia r7!, {r0, r1}
	stmia r2!, {r0, r1}
	str r2, [sp, #0x14]
	mov r0, #0x10
_0207244E:
	ldr r1, [sp, #8]
	ldrh r2, [r1]
	add r1, r1, #2
	str r1, [sp, #8]
	ldr r1, [sp, #0x18]
	strh r2, [r1]
	add r1, r1, #2
	str r1, [sp, #0x18]
	sub r0, r0, #1
	bne _0207244E
	add r0, r5, #0
	add r0, #8
	mov r1, #0x80
	bl CalcMonChecksum
	strh r0, [r5, #6]
	add r0, r5, #0
	ldrh r2, [r5, #6]
	add r0, #8
	mov r1, #0x80
	bl MonEncryptSegment
	add r0, r5, #0
	ldr r2, [r5]
	add r0, #0x88
	mov r1, #0x64
	bl MonEncryptSegment
	ldr r0, [sp, #4]
	bl FreeToHeap
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0207235C

	thumb_func_start sub_02072490
sub_02072490: ; 0x02072490
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r3, [sp]
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	add r6, r1, #0
	add r7, r2, #0
	cmp r0, #2
	blo _020724A6
	bl GF_AssertFail
_020724A6:
	ldr r0, [sp]
	cmp r0, #0xff
	bne _020724B0
	bl GF_AssertFail
_020724B0:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _020724EC
	ldr r0, _020725A0 ; =0xFFFF0000
	add r2, r7, #0
	and r0, r5
	lsr r1, r0, #0x10
	lsl r0, r5, #0x10
	add r4, r1, #0
	lsr r0, r0, #0x10
	eor r4, r0
	ldr r1, [sp]
	add r0, r6, #0
	bl GenPersonalityByGenderAndNature
	add r5, r0, #0
	mov r0, #1
	add r1, r5, #0
	and r1, r0
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	cmp r1, r0
	beq _020724E0
	add r5, r5, #1
_020724E0:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	eor r0, r4
	lsl r0, r0, #0x10
	orr r5, r0
	b _0207259A
_020724EC:
	add r0, r6, #0
	mov r1, #0x12
	bl GetMonBaseStat
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, sp, #8
	ldrb r6, [r0, #0x10]
	mov r0, #1
	and r0, r7
	cmp r0, r6
	beq _02072508
	bl GF_AssertFail
_02072508:
	ldr r0, _020725A0 ; =0xFFFF0000
	and r0, r5
	lsr r1, r0, #0x10
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	eor r1, r0
	mov r0, #0xff
	lsl r0, r0, #8
	and r1, r0
	eor r0, r1
	lsl r5, r0, #0x10
	add r0, r5, #0
	mov r1, #0x19
	bl _u32_div_f
	sub r0, r7, r1
	add r5, r5, r0
	cmp r4, #0
	beq _0207259A
	cmp r4, #0xfe
	beq _0207259A
	cmp r4, #0xff
	beq _0207259A
	ldr r0, [sp]
	cmp r0, #0
	bne _0207256C
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	cmp r4, r0
	bls _0207259A
	sub r0, r4, r0
	mov r1, #0x19
	bl _u32_div_f
	add r1, r0, #1
	mov r0, #0x19
	mul r0, r1
	add r5, r5, r0
	mov r0, #1
	and r0, r5
	cmp r0, r6
	beq _0207259A
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0xe6
	bls _02072568
	bl GF_AssertFail
_02072568:
	add r5, #0x19
	b _0207259A
_0207256C:
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	cmp r4, r0
	bhs _0207259A
	sub r0, r0, r4
	mov r1, #0x19
	bl _u32_div_f
	add r1, r0, #1
	mov r0, #0x19
	mul r0, r1
	sub r5, r5, r0
	mov r0, #1
	and r0, r5
	cmp r0, r6
	beq _0207259A
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0x19
	bhs _02072598
	bl GF_AssertFail
_02072598:
	sub r5, #0x19
_0207259A:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020725A0: .word 0xFFFF0000
	thumb_func_end sub_02072490

	thumb_func_start LoadMonPersonal
LoadMonPersonal: ; 0x020725A4
	ldr r3, _020725B0 ; =ReadWholeNarcMemberByIdPair
	add r2, r0, #0
	add r0, r1, #0
	mov r1, #2
	bx r3
	nop
_020725B0: .word ReadWholeNarcMemberByIdPair
	thumb_func_end LoadMonPersonal

	thumb_func_start LoadMonBaseStats_HandleAlternateForme
LoadMonBaseStats_HandleAlternateForme: ; 0x020725B4
	push {r4, lr}
	add r4, r2, #0
	bl ResolveMonForme
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #2
	bl ReadWholeNarcMemberByIdPair
	pop {r4, pc}
	thumb_func_end LoadMonBaseStats_HandleAlternateForme

	thumb_func_start sub_020725C8
sub_020725C8: ; 0x020725C8
	ldr r3, _020725D4 ; =ReadWholeNarcMemberByIdPair
	add r2, r0, #0
	add r0, r1, #0
	mov r1, #0x22
	bx r3
	nop
_020725D4: .word ReadWholeNarcMemberByIdPair
	thumb_func_end sub_020725C8

	thumb_func_start MonEncryptSegment
MonEncryptSegment: ; 0x020725D8
	ldr r3, _020725DC ; =_MonEncryptSegment
	bx r3
	.balign 4, 0
_020725DC: .word _MonEncryptSegment
	thumb_func_end MonEncryptSegment

	thumb_func_start MonDecryptSegment
MonDecryptSegment: ; 0x020725E0
	ldr r3, _020725E4 ; =_MonDecryptSegment
	bx r3
	.balign 4, 0
_020725E4: .word _MonDecryptSegment
	thumb_func_end MonDecryptSegment

	thumb_func_start CalcMonChecksum
CalcMonChecksum: ; 0x020725E8
	push {r3, r4}
	mov r3, #0
	add r2, r3, #0
	lsr r4, r1, #1
	beq _02072602
_020725F2:
	ldrh r1, [r0]
	add r2, r2, #1
	add r0, r0, #2
	add r1, r3, r1
	lsl r1, r1, #0x10
	lsr r3, r1, #0x10
	cmp r2, r4
	blo _020725F2
_02072602:
	add r0, r3, #0
	pop {r3, r4}
	bx lr
	thumb_func_end CalcMonChecksum

	thumb_func_start GetSubstruct
GetSubstruct: ; 0x02072608
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x3e
	add r4, r1, #0
	lsl r0, r0, #0xc
	and r0, r4
	add r6, r2, #0
	lsr r4, r0, #0xd
	cmp r6, #3
	bls _02072620
	bl GF_AssertFail
_02072620:
	ldr r0, _02072630 ; =_020FF733
	lsl r1, r4, #2
	add r0, r0, r1
	ldrb r0, [r6, r0]
	add r5, #8
	add r0, r5, r0
	pop {r4, r5, r6, pc}
	nop
_02072630: .word _020FF733
	thumb_func_end GetSubstruct

	thumb_func_start ResolveMonForme
ResolveMonForme: ; 0x02072634
	ldr r2, _020726BC ; =0x000001DF
	cmp r0, r2
	bgt _02072658
	bge _020726AC
	add r3, r2, #0
	sub r3, #0x5d
	cmp r0, r3
	bgt _0207264E
	add r3, r2, #0
	sub r3, #0x5d
	cmp r0, r3
	beq _02072674
	bx lr
_0207264E:
	add r3, r2, #0
	sub r3, #0x42
	cmp r0, r3
	beq _02072682
	bx lr
_02072658:
	add r3, r2, #0
	add r3, #8
	cmp r0, r3
	bgt _0207266A
	add r3, r2, #0
	add r3, #8
	cmp r0, r3
	beq _02072690
	bx lr
_0207266A:
	add r3, r2, #0
	add r3, #0xd
	cmp r0, r3
	beq _0207269E
	bx lr
_02072674:
	cmp r1, #0
	beq _020726B8
	cmp r1, #3
	bgt _020726B8
	add r2, #0x10
	add r0, r1, r2
	bx lr
_02072682:
	cmp r1, #0
	beq _020726B8
	cmp r1, #2
	bgt _020726B8
	add r2, #0x13
	add r0, r1, r2
	bx lr
_02072690:
	cmp r1, #0
	beq _020726B8
	cmp r1, #1
	bgt _020726B8
	add r2, #0x15
	add r0, r1, r2
	bx lr
_0207269E:
	cmp r1, #0
	beq _020726B8
	cmp r1, #1
	bgt _020726B8
	add r2, #0x16
	add r0, r1, r2
	bx lr
_020726AC:
	cmp r1, #0
	beq _020726B8
	cmp r1, #5
	bgt _020726B8
	add r2, #0x17
	add r0, r1, r2
_020726B8:
	bx lr
	nop
_020726BC: .word 0x000001DF
	thumb_func_end ResolveMonForme

	thumb_func_start MaskOfFlagNo
MaskOfFlagNo: ; 0x020726C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #1
	cmp r5, #0x20
	blt _020726CE
	bl GF_AssertFail
_020726CE:
	mov r0, #0
	cmp r5, #0
	ble _020726DC
_020726D4:
	add r0, r0, #1
	lsl r4, r4, #1
	cmp r0, r5
	blt _020726D4
_020726DC:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end MaskOfFlagNo

	thumb_func_start sub_020726E0
sub_020726E0: ; 0x020726E0
	mov r3, #1
	mov r2, #0
_020726E4:
	add r1, r0, #0
	tst r1, r3
	bne _020726F2
	add r2, r2, #1
	lsl r3, r3, #1
	cmp r2, #0x20
	blt _020726E4
_020726F2:
	add r0, r2, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_020726E0

	thumb_func_start sub_020726F8
sub_020726F8: ; 0x020726F8
	push {r3, r4}
	ldr r4, _02072728 ; =_020FF564
	mov r3, #0
_020726FE:
	ldrh r2, [r4]
	cmp r0, r2
	bne _0207270A
	mov r0, #1
	pop {r3, r4}
	bx lr
_0207270A:
	add r3, r3, #1
	add r4, r4, #2
	cmp r3, #0x12
	blo _020726FE
	cmp r0, #0xac
	bne _02072720
	cmp r1, #1
	bne _02072720
	mov r0, #1
	pop {r3, r4}
	bx lr
_02072720:
	mov r0, #0
	pop {r3, r4}
	bx lr
	nop
_02072728: .word _020FF564
	thumb_func_end sub_020726F8

	thumb_func_start sub_0207272C
sub_0207272C: ; 0x0207272C
	cmp r0, #0x12
	blo _02072732
	mov r0, #0
_02072732:
	lsl r1, r0, #1
	ldr r0, _0207273C ; =_020FF564
	ldrh r0, [r0, r1]
	bx lr
	nop
_0207273C: .word _020FF564
	thumb_func_end sub_0207272C

	thumb_func_start sub_02072740
sub_02072740: ; 0x02072740
	ldr r3, _0207275C ; =_020FF4F8
	mov r2, #0
_02072744:
	ldrh r1, [r3]
	cmp r0, r1
	bne _0207274E
	mov r0, #1
	bx lr
_0207274E:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #9
	blo _02072744
	mov r0, #0
	bx lr
	nop
_0207275C: .word _020FF4F8
	thumb_func_end sub_02072740

	thumb_func_start sub_02072760
sub_02072760: ; 0x02072760
	push {r3, r4, r5, lr}
	mov r1, #5
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	add r0, r4, #0
	bl sub_020726F8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02072760

	thumb_func_start sub_02072788
sub_02072788: ; 0x02072788
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	bl PlayerProfile_GetTrainerID
	str r0, [sp]
	add r0, r5, #0
	mov r1, #7
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp, #4]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0x9d
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r1, r6, #0
	bl PlayerProfile_GetPlayerName_NewString
	add r7, r0, #0
	mov r0, #8
	add r1, r6, #0
	bl String_ctor
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x91
	add r2, r6, #0
	mov r4, #0
	bl GetBoxMonData
	ldr r1, [sp]
	ldr r0, [sp, #4]
	cmp r1, r0
	bne _020727F8
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bne _020727F8
	add r0, r7, #0
	add r1, r6, #0
	bl StringCompare
	cmp r0, #0
	bne _020727F8
	mov r4, #1
_020727F8:
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02072788

	thumb_func_start sub_0207280C
sub_0207280C: ; 0x0207280C
	push {r3, lr}
	cmp r0, #0x7b
	bgt _0207284E
	bge _02072878
	cmp r0, #0x17
	bgt _0207282A
	bge _02072870
	cmp r0, #1
	bgt _02072884
	cmp r0, #0
	blt _02072884
	beq _02072868
	cmp r0, #1
	beq _02072868
	b _02072884
_0207282A:
	cmp r0, #0x5a
	bgt _02072832
	beq _0207287C
	b _02072884
_02072832:
	add r1, r0, #0
	sub r1, #0x5b
	cmp r1, #3
	bhi _02072884
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02072846: ; jump table
	.short _0207287C - _02072846 - 2 ; case 0
	.short _0207287C - _02072846 - 2 ; case 1
	.short _0207287C - _02072846 - 2 ; case 2
	.short _0207287C - _02072846 - 2 ; case 3
_0207284E:
	cmp r0, #0x7e
	bgt _0207285A
	bge _02072874
	cmp r0, #0x7d
	beq _02072874
	b _02072884
_0207285A:
	cmp r0, #0x7f
	bgt _02072862
	beq _02072880
	b _02072884
_02072862:
	cmp r0, #0x80
	beq _02072880
	b _02072884
_02072868:
	cmp r1, #0
	beq _02072892
	add r0, #0xf
	pop {r3, pc}
_02072870:
	mov r0, #2
	pop {r3, pc}
_02072874:
	sub r0, #0x74
	pop {r3, pc}
_02072878:
	mov r0, #3
	pop {r3, pc}
_0207287C:
	sub r0, #0x56
	pop {r3, pc}
_02072880:
	sub r0, #0x73
	pop {r3, pc}
_02072884:
	bl TrainerClass_GetGenderOrTrainerCount
	cmp r0, #1
	bne _02072890
	mov r0, #1
	pop {r3, pc}
_02072890:
	mov r0, #0
_02072892:
	pop {r3, pc}
	thumb_func_end sub_0207280C

	thumb_func_start sub_02072894
sub_02072894: ; 0x02072894
	push {r3, r4, lr}
	sub sp, #0x1c
	add r4, r0, #0
	mov r0, #0
	add r1, sp, #0
	strb r0, [r1]
	add r1, sp, #0
	add r1, #1
	mov r2, #0x18
	bl MIi_CpuClearFast
	add r0, r4, #0
	mov r1, #0xa2
	add r2, sp, #0
	bl SetMonData
	add r2, sp, #0
	add r0, r4, #0
	mov r1, #0xab
	add r2, #1
	bl SetMonData
	add sp, #0x1c
	pop {r3, r4, pc}
	thumb_func_end sub_02072894

	thumb_func_start RestoreBoxMonPP
RestoreBoxMonPP: ; 0x020728C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl AcquireBoxMonLock
	mov r4, #0
	str r0, [sp]
	add r7, r4, #0
	add r6, sp, #4
_020728D6:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x36
	add r2, r7, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _02072900
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x42
	mov r2, #0
	bl GetBoxMonData
	add r1, r4, #0
	strb r0, [r6]
	add r0, r5, #0
	add r1, #0x3a
	add r2, sp, #4
	bl SetBoxMonData
_02072900:
	add r4, r4, #1
	cmp r4, #4
	blt _020728D6
	ldr r1, [sp]
	add r0, r5, #0
	bl ReleaseBoxMonLock
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end RestoreBoxMonPP

	thumb_func_start sub_02072914
sub_02072914: ; 0x02072914
	push {r4, r5, r6, lr}
	sub sp, #0x60
	add r4, r1, #0
	mov r5, #1
	add r1, r3, #0
	add r6, r2, #0
	tst r1, r5
	beq _02072926
	mov r5, #0
_02072926:
	add r1, sp, #4
	str r1, [sp]
	mov r3, #0x59
	add r2, r6, #0
	mov r1, #0
	mul r2, r3
	bl NARC_ReadFromMember
	mov r0, #0x2b
	add r1, sp, #4
	mul r0, r5
	add r0, r1, r0
	add r0, r0, #3
	add r1, r4, #0
	mov r2, #0x28
	bl MI_CpuCopy8
	add sp, #0x60
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02072914

	thumb_func_start sub_0207294C
sub_0207294C: ; 0x0207294C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	add r5, r1, #0
	ldr r1, [sp, #0x78]
	add r6, r2, #0
	add r2, r3, #0
	cmp r1, #2
	beq _02072960
	mov r4, #1
	b _02072962
_02072960:
	mov r4, #0
_02072962:
	add r1, sp, #8
	add r1, #2
	str r1, [sp]
	mov r7, #0x59
	add r3, r2, #0
	mul r3, r7
	add r2, r3, #0
	mov r1, #0
	add r3, r7, #0
	bl NARC_ReadFromMember
	mov r0, #0x2b
	add r1, sp, #8
	ldr r3, [sp, #0x80]
	mul r0, r4
	add r1, #3
	ldrb r2, [r1, r0]
	add r1, sp, #4
	lsl r3, r3, #0x18
	strh r2, [r1]
	add r2, sp, #0xc
	ldrb r0, [r2, r0]
	add r2, sp, #4
	lsr r3, r3, #0x18
	strh r0, [r1, #2]
	ldr r0, [sp, #0x7c]
	strb r0, [r1, #4]
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02016F40
	add sp, #0x64
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0207294C

	thumb_func_start sub_020729A4
sub_020729A4: ; 0x020729A4
	push {r4, r5, r6, lr}
	sub sp, #0x60
	add r4, r1, #0
	mov r5, #1
	add r1, r3, #0
	add r6, r2, #0
	tst r1, r5
	beq _020729B6
	mov r5, #0
_020729B6:
	add r1, sp, #4
	str r1, [sp]
	mov r3, #0x59
	add r2, r6, #0
	mov r1, #0
	mul r2, r3
	bl NARC_ReadFromMember
	mov r0, #0x2b
	add r1, r5, #0
	mul r1, r0
	add r0, sp, #4
	ldrb r0, [r0, r1]
	strb r0, [r4]
	add sp, #0x60
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020729A4

	thumb_func_start sub_020729D8
sub_020729D8: ; 0x020729D8
	push {r3, r4, r5, lr}
	sub sp, #0x60
	mov r3, #0x59
	add r5, r2, #0
	add r4, r1, #0
	add r1, sp, #4
	mul r5, r3
	str r1, [sp]
	mov r1, #0
	add r2, r5, #0
	bl NARC_ReadFromMember
	add r1, sp, #0x44
	mov r0, #0x16
	ldrsb r0, [r1, r0]
	strb r0, [r4]
	add sp, #0x60
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020729D8

	thumb_func_start sub_020729FC
sub_020729FC: ; 0x020729FC
	push {r3, r4, r5, lr}
	sub sp, #0x60
	mov r3, #0x59
	add r5, r2, #0
	add r4, r1, #0
	add r1, sp, #4
	mul r5, r3
	str r1, [sp]
	mov r1, #0
	add r2, r5, #0
	bl NARC_ReadFromMember
	add r1, sp, #0x44
	mov r0, #0x17
	ldrsb r0, [r1, r0]
	strb r0, [r4]
	add sp, #0x60
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020729FC

	thumb_func_start sub_02072A20
sub_02072A20: ; 0x02072A20
	push {r3, r4, r5, lr}
	sub sp, #0x60
	mov r3, #0x59
	add r5, r2, #0
	add r4, r1, #0
	add r1, sp, #4
	mul r5, r3
	str r1, [sp]
	mov r1, #0
	add r2, r5, #0
	bl NARC_ReadFromMember
	add r0, sp, #0x44
	ldrb r0, [r0, #0x18]
	strb r0, [r4]
	add sp, #0x60
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02072A20

	thumb_func_start SetTrMonCapsule
SetTrMonCapsule: ; 0x02072A44
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02072A56
	add sp, #0x20
	mov r0, #0
	pop {r4, r5, r6, pc}
_02072A56:
	mov r0, #0xb9
	add r1, r2, #0
	bl NARC_ctor
	mov r1, #1
	sub r5, r5, #1
	str r1, [sp, #4]
	add r1, sp, #8
	str r1, [sp]
	mov r3, #0x18
	add r2, r5, #0
	mov r1, #0
	mul r2, r3
	add r6, r0, #0
	bl NARC_ReadFromMember
	add r0, r4, #0
	mov r1, #0xa2
	add r2, sp, #4
	bl SetMonData
	add r0, r4, #0
	mov r1, #0xab
	add r2, sp, #8
	bl SetMonData
	add r0, r6, #0
	bl NARC_dtor
	mov r0, #1
	add sp, #0x20
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end SetTrMonCapsule

	thumb_func_start sub_02072A98
sub_02072A98: ; 0x02072A98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	ldrh r0, [r0, #4]
	add r4, r1, #0
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _02072AC4
	ldr r2, [sp]
	ldr r0, [sp]
	ldr r2, [r2]
	add r0, #0x88
	mov r1, #0x64
	bl MonDecryptSegment
	ldr r2, [sp]
	ldr r0, [sp]
	ldrh r2, [r2, #6]
	add r0, #8
	mov r1, #0x80
	bl MonDecryptSegment
_02072AC4:
	ldr r0, [sp]
	bl Mon_GetBoxMon
	add r6, r0, #0
	ldr r1, [r6]
	mov r2, #0
	bl GetSubstruct
	add r5, r0, #0
	ldr r1, [r6]
	add r0, r6, #0
	mov r2, #1
	bl GetSubstruct
	str r0, [sp, #4]
	ldr r1, [r6]
	add r0, r6, #0
	mov r2, #2
	bl GetSubstruct
	add r7, r0, #0
	ldr r1, [r6]
	add r0, r6, #0
	mov r2, #3
	bl GetSubstruct
	mov ip, r0
	ldr r0, [r6]
	ldr r3, [sp, #4]
	str r0, [r4]
	ldrh r1, [r4, #4]
	mov r0, #1
	mov r2, #0
	bic r1, r0
	strh r1, [r4, #4]
	ldrh r1, [r4, #4]
	mov r0, #2
	bic r1, r0
	strh r1, [r4, #4]
	ldrh r0, [r4, #4]
	mov r1, #4
	bic r0, r1
	ldrh r1, [r6, #4]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1d
	orr r0, r1
	strh r0, [r4, #4]
	ldrh r0, [r5]
	strh r0, [r4, #6]
	ldrh r0, [r5, #2]
	strh r0, [r4, #8]
	ldr r0, [r5, #4]
	str r0, [r4, #0xc]
	ldr r0, [r5, #8]
	str r0, [r4, #0x10]
	ldrb r0, [r5, #0xc]
	strb r0, [r4, #0x14]
	ldrb r0, [r5, #0xd]
	strb r0, [r4, #0x15]
	ldrb r0, [r5, #0x10]
	strb r0, [r4, #0x16]
	ldrb r0, [r5, #0x11]
	strb r0, [r4, #0x17]
	ldrb r0, [r5, #0x12]
	strb r0, [r4, #0x18]
	ldrb r0, [r5, #0x13]
	strb r0, [r4, #0x19]
	ldrb r0, [r5, #0x14]
	strb r0, [r4, #0x1a]
	ldrb r0, [r5, #0x15]
	strb r0, [r4, #0x1b]
	ldrb r1, [r5, #0xf]
	add r0, r4, #0
	add r0, #0x59
	strb r1, [r0]
	add r5, r4, #0
_02072B60:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r5, #0x1c]
	ldr r0, [sp, #4]
	add r5, r5, #2
	add r6, r0, r2
	add r0, r4, r2
	ldrb r1, [r6, #8]
	add r0, #0x24
	strb r1, [r0]
	add r0, r4, r2
	ldrb r1, [r6, #0xc]
	add r0, #0x28
	add r2, r2, #1
	strb r1, [r0]
	cmp r2, #4
	blt _02072B60
	ldr r0, [r4, #0x2c]
	mov r1, #0x1f
	bic r0, r1
	ldr r1, [sp, #4]
	ldr r1, [r1, #0x10]
	lsl r1, r1, #0x1b
	lsr r2, r1, #0x1b
	mov r1, #0x1f
	and r1, r2
	orr r1, r0
	ldr r0, _02072D48 ; =0xFFFFFC1F
	str r1, [r4, #0x2c]
	and r0, r1
	ldr r1, [sp, #4]
	mov r2, #1
	ldr r1, [r1, #0x10]
	lsl r1, r1, #0x16
	lsr r1, r1, #0x1b
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x16
	orr r1, r0
	ldr r0, _02072D4C ; =0xFFFF83FF
	str r1, [r4, #0x2c]
	and r0, r1
	ldr r1, [sp, #4]
	ldr r1, [r1, #0x10]
	lsl r1, r1, #0x11
	lsr r1, r1, #0x1b
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x11
	orr r1, r0
	ldr r0, _02072D50 ; =0xFFF07FFF
	str r1, [r4, #0x2c]
	and r0, r1
	ldr r1, [sp, #4]
	ldr r1, [r1, #0x10]
	lsl r1, r1, #0xc
	lsr r1, r1, #0x1b
	lsl r1, r1, #0x1b
	lsr r1, r1, #0xc
	orr r1, r0
	ldr r0, _02072D54 ; =0xFE0FFFFF
	str r1, [r4, #0x2c]
	and r0, r1
	ldr r1, [sp, #4]
	ldr r1, [r1, #0x10]
	lsl r1, r1, #7
	lsr r1, r1, #0x1b
	lsl r1, r1, #0x1b
	lsr r1, r1, #7
	orr r1, r0
	ldr r0, _02072D58 ; =0xC1FFFFFF
	str r1, [r4, #0x2c]
	and r0, r1
	ldr r1, [sp, #4]
	ldr r1, [r1, #0x10]
	lsl r1, r1, #2
	lsr r1, r1, #0x1b
	lsl r1, r1, #0x1b
	lsr r1, r1, #2
	orr r1, r0
	ldr r0, _02072D5C ; =0xBFFFFFFF
	str r1, [r4, #0x2c]
	and r0, r1
	ldr r1, [sp, #4]
	ldr r1, [r1, #0x10]
	lsl r1, r1, #1
	lsr r1, r1, #0x1f
	lsl r1, r1, #0x1f
	lsr r1, r1, #1
	orr r1, r0
	ldr r0, _02072D60 ; =0x7FFFFFFF
	str r1, [r4, #0x2c]
	and r0, r1
	ldr r1, [sp, #4]
	ldr r1, [r1, #0x10]
	lsr r1, r1, #0x1f
	lsl r1, r1, #0x1f
	orr r0, r1
	str r0, [r4, #0x2c]
	add r0, r4, #0
	add r0, #0x30
	ldrb r0, [r0]
	add r1, r4, #0
	add r1, #0x30
	bic r0, r2
	ldr r2, [sp, #4]
	ldrb r2, [r2, #0x18]
	lsl r2, r2, #0x1f
	lsr r3, r2, #0x1f
	mov r2, #1
	and r2, r3
	orr r2, r0
	add r0, r4, #0
	add r0, #0x30
	strb r2, [r0]
	add r0, r4, #0
	add r0, #0x30
	ldrb r0, [r0]
	mov r2, #6
	bic r0, r2
	ldr r2, [sp, #4]
	ldrb r2, [r2, #0x18]
	lsl r2, r2, #0x1d
	lsr r2, r2, #0x1e
	lsl r2, r2, #0x1e
	lsr r2, r2, #0x1d
	orr r2, r0
	add r0, r4, #0
	add r0, #0x30
	strb r2, [r0]
	ldrb r0, [r1]
	mov r2, #0xf8
	bic r0, r2
	ldr r2, [sp, #4]
	ldrb r2, [r2, #0x18]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1b
	lsl r2, r2, #0x1b
	lsr r2, r2, #0x18
	orr r0, r2
	strb r0, [r1]
	mov r2, #0
	add r1, r4, #0
_02072C7A:
	ldrh r0, [r7]
	add r2, r2, #1
	add r7, r7, #2
	strh r0, [r1, #0x32]
	add r1, r1, #2
	cmp r2, #0xb
	blt _02072C7A
	mov r5, #0
	mov r2, ip
	add r3, r4, #0
_02072C8E:
	ldrh r1, [r2]
	add r0, r3, #0
	add r0, #0x48
	add r5, r5, #1
	strh r1, [r0]
	add r2, r2, #2
	add r3, r3, #2
	cmp r5, #8
	blt _02072C8E
	mov r0, ip
	ldrb r1, [r0, #0x1b]
	add r0, r4, #0
	add r0, #0x58
	strb r1, [r0]
	ldr r0, [sp]
	add r0, #0x88
	ldr r0, [r0]
	str r0, [r4, #0x5c]
	ldr r0, [sp]
	add r0, #0x8c
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x60
	strb r1, [r0]
	ldr r0, [sp]
	add r0, #0x8d
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x61
	strb r1, [r0]
	ldr r0, [sp]
	add r0, #0x8e
	ldrh r1, [r0]
	add r0, r4, #0
	add r0, #0x62
	strh r1, [r0]
	ldr r0, [sp]
	add r0, #0x90
	ldrh r1, [r0]
	add r0, r4, #0
	add r0, #0x64
	strh r1, [r0]
	ldr r0, [sp]
	add r0, #0x92
	ldrh r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	strh r1, [r0]
	ldr r0, [sp]
	add r0, #0x94
	ldrh r1, [r0]
	add r0, r4, #0
	add r0, #0x68
	strh r1, [r0]
	ldr r0, [sp]
	add r0, #0x96
	ldrh r1, [r0]
	add r0, r4, #0
	add r0, #0x6a
	strh r1, [r0]
	ldr r0, [sp]
	add r0, #0x98
	ldrh r1, [r0]
	add r0, r4, #0
	add r0, #0x6c
	strh r1, [r0]
	ldr r0, [sp]
	add r4, #0x6e
	add r0, #0x9a
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r0, [sp]
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _02072D42
	ldr r2, [sp]
	ldr r0, [sp]
	ldr r2, [r2]
	add r0, #0x88
	mov r1, #0x64
	bl MonEncryptSegment
	ldr r2, [sp]
	ldr r0, [sp]
	ldrh r2, [r2, #6]
	add r0, #8
	mov r1, #0x80
	bl MonEncryptSegment
_02072D42:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02072D48: .word 0xFFFFFC1F
_02072D4C: .word 0xFFFF83FF
_02072D50: .word 0xFFF07FFF
_02072D54: .word 0xFE0FFFFF
_02072D58: .word 0xC1FFFFFF
_02072D5C: .word 0xBFFFFFFF
_02072D60: .word 0x7FFFFFFF
	thumb_func_end sub_02072A98

	thumb_func_start sub_02072D64
sub_02072D64: ; 0x02072D64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0
	mov r2, #0xec
	bl MIi_CpuClearFast
	ldr r0, [sp]
	bl Mon_GetBoxMon
	ldr r1, [r4]
	str r0, [sp, #4]
	mov r2, #0
	bl GetSubstruct
	add r5, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [r4]
	mov r2, #1
	bl GetSubstruct
	add r6, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [r4]
	mov r2, #2
	bl GetSubstruct
	add r7, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [r4]
	mov r2, #3
	bl GetSubstruct
	mov ip, r0
	ldr r1, [r4]
	ldr r0, [sp, #4]
	add r2, r4, #0
	str r1, [r0]
	ldrh r0, [r0, #4]
	mov r1, #1
	add r3, r6, #0
	bic r0, r1
	ldr r1, [sp, #4]
	strh r0, [r1, #4]
	add r0, r1, #0
	ldrh r0, [r0, #4]
	mov r1, #2
	bic r0, r1
	ldr r1, [sp, #4]
	strh r0, [r1, #4]
	add r0, r1, #0
	ldrh r0, [r0, #4]
	mov r1, #4
	bic r0, r1
	ldrh r1, [r4, #4]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1d
	orr r1, r0
	ldr r0, [sp, #4]
	strh r1, [r0, #4]
	ldrh r0, [r4, #6]
	mov r1, #0
	strh r0, [r5]
	ldrh r0, [r4, #8]
	strh r0, [r5, #2]
	ldr r0, [r4, #0xc]
	str r0, [r5, #4]
	ldr r0, [r4, #0x10]
	str r0, [r5, #8]
	ldrb r0, [r4, #0x14]
	strb r0, [r5, #0xc]
	ldrb r0, [r4, #0x15]
	strb r0, [r5, #0xd]
	ldrb r0, [r4, #0x16]
	strb r0, [r5, #0x10]
	ldrb r0, [r4, #0x17]
	strb r0, [r5, #0x11]
	ldrb r0, [r4, #0x18]
	strb r0, [r5, #0x12]
	ldrb r0, [r4, #0x19]
	strb r0, [r5, #0x13]
	ldrb r0, [r4, #0x1a]
	strb r0, [r5, #0x14]
	ldrb r0, [r4, #0x1b]
	strb r0, [r5, #0x15]
	add r0, r4, #0
	add r0, #0x59
	ldrb r0, [r0]
	strb r0, [r5, #0xf]
_02072E1C:
	ldrh r0, [r2, #0x1c]
	add r5, r4, r1
	add r5, #0x24
	strh r0, [r3]
	ldrb r5, [r5]
	add r0, r6, r1
	add r2, r2, #2
	strb r5, [r0, #8]
	add r5, r4, r1
	add r5, #0x28
	ldrb r5, [r5]
	add r1, r1, #1
	add r3, r3, #2
	strb r5, [r0, #0xc]
	cmp r1, #4
	blt _02072E1C
	ldr r0, [r6, #0x10]
	mov r1, #0x1f
	bic r0, r1
	ldr r1, [r4, #0x2c]
	lsl r1, r1, #0x1b
	lsr r2, r1, #0x1b
	mov r1, #0x1f
	and r1, r2
	orr r1, r0
	ldr r0, _02072FFC ; =0xFFFFFC1F
	str r1, [r6, #0x10]
	and r0, r1
	ldr r1, [r4, #0x2c]
	add r2, r6, #0
	lsl r1, r1, #0x16
	lsr r1, r1, #0x1b
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x16
	orr r1, r0
	ldr r0, _02073000 ; =0xFFFF83FF
	str r1, [r6, #0x10]
	and r0, r1
	ldr r1, [r4, #0x2c]
	add r2, #0x18
	lsl r1, r1, #0x11
	lsr r1, r1, #0x1b
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x11
	orr r1, r0
	ldr r0, _02073004 ; =0xFFF07FFF
	str r1, [r6, #0x10]
	and r0, r1
	ldr r1, [r4, #0x2c]
	lsl r1, r1, #0xc
	lsr r1, r1, #0x1b
	lsl r1, r1, #0x1b
	lsr r1, r1, #0xc
	orr r1, r0
	ldr r0, _02073008 ; =0xFE0FFFFF
	str r1, [r6, #0x10]
	and r0, r1
	ldr r1, [r4, #0x2c]
	lsl r1, r1, #7
	lsr r1, r1, #0x1b
	lsl r1, r1, #0x1b
	lsr r1, r1, #7
	orr r1, r0
	ldr r0, _0207300C ; =0xC1FFFFFF
	str r1, [r6, #0x10]
	and r0, r1
	ldr r1, [r4, #0x2c]
	lsl r1, r1, #2
	lsr r1, r1, #0x1b
	lsl r1, r1, #0x1b
	lsr r1, r1, #2
	orr r1, r0
	ldr r0, _02073010 ; =0xBFFFFFFF
	str r1, [r6, #0x10]
	and r0, r1
	ldr r1, [r4, #0x2c]
	lsl r1, r1, #1
	lsr r1, r1, #0x1f
	lsl r1, r1, #0x1f
	lsr r1, r1, #1
	orr r1, r0
	ldr r0, _02073014 ; =0x7FFFFFFF
	str r1, [r6, #0x10]
	and r0, r1
	ldr r1, [r4, #0x2c]
	lsr r1, r1, #0x1f
	lsl r1, r1, #0x1f
	orr r0, r1
	str r0, [r6, #0x10]
	ldrb r3, [r6, #0x18]
	mov r0, #1
	bic r3, r0
	add r0, r4, #0
	add r0, #0x30
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r1, r0, #0x1f
	mov r0, #1
	and r0, r1
	orr r0, r3
	strb r0, [r6, #0x18]
	ldrb r0, [r6, #0x18]
	mov r1, #6
	bic r0, r1
	add r1, r4, #0
	add r1, #0x30
	ldrb r1, [r1]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1e
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x1d
	orr r0, r1
	strb r0, [r6, #0x18]
	ldrb r0, [r2]
	mov r1, #0xf8
	bic r0, r1
	add r1, r4, #0
	add r1, #0x30
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1b
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r2]
	mov r2, #0
	add r1, r4, #0
_02072F1A:
	ldrh r0, [r1, #0x32]
	add r2, r2, #1
	add r1, r1, #2
	strh r0, [r7]
	add r7, r7, #2
	cmp r2, #0xb
	blt _02072F1A
	mov r3, #0
	add r1, r4, #0
	mov r2, ip
_02072F2E:
	add r0, r1, #0
	add r0, #0x48
	ldrh r0, [r0]
	add r3, r3, #1
	add r1, r1, #2
	strh r0, [r2]
	add r2, r2, #2
	cmp r3, #8
	blt _02072F2E
	add r0, r4, #0
	add r0, #0x58
	ldrb r1, [r0]
	mov r0, ip
	strb r1, [r0, #0x1e]
	add r0, r4, #0
	add r0, #0x58
	ldrb r1, [r0]
	cmp r1, #0x10
	bhi _02072F56
	b _02072F58
_02072F56:
	mov r1, #4
_02072F58:
	mov r0, ip
	strb r1, [r0, #0x1b]
	ldr r0, [sp]
	ldr r1, [r4, #0x5c]
	add r0, #0x88
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x60
	ldrb r1, [r0]
	ldr r0, [sp]
	ldr r2, [sp]
	add r0, #0x8c
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x61
	ldrb r1, [r0]
	ldr r0, [sp]
	add r0, #0x8d
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x62
	ldrh r1, [r0]
	ldr r0, [sp]
	add r0, #0x8e
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x64
	ldrh r1, [r0]
	ldr r0, [sp]
	add r0, #0x90
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	ldrh r1, [r0]
	ldr r0, [sp]
	add r0, #0x92
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x68
	ldrh r1, [r0]
	ldr r0, [sp]
	add r0, #0x94
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x6a
	ldrh r1, [r0]
	ldr r0, [sp]
	add r0, #0x96
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x6c
	ldrh r1, [r0]
	ldr r0, [sp]
	add r4, #0x6e
	add r0, #0x98
	strh r1, [r0]
	ldr r0, [sp]
	ldrh r1, [r4]
	add r0, #0x9a
	strh r1, [r0]
	ldr r0, [sp]
	ldr r2, [r2]
	add r0, #0x88
	mov r1, #0x64
	bl MonEncryptSegment
	ldr r0, [sp]
	mov r1, #0x80
	add r0, #8
	bl CalcMonChecksum
	ldr r1, [sp]
	ldr r2, [sp]
	strh r0, [r1, #6]
	add r0, r1, #0
	ldrh r2, [r2, #6]
	add r0, #8
	mov r1, #0x80
	bl MonEncryptSegment
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02072FFC: .word 0xFFFFFC1F
_02073000: .word 0xFFFF83FF
_02073004: .word 0xFFF07FFF
_02073008: .word 0xFE0FFFFF
_0207300C: .word 0xC1FFFFFF
_02073010: .word 0xBFFFFFFF
_02073014: .word 0x7FFFFFFF
	thumb_func_end sub_02072D64

	thumb_func_start _u32_getDigitN
_u32_getDigitN: ; 0x02073018
	push {r4, r5, r6, lr}
	sub sp, #0x20
	ldr r5, _02073054 ; =_020FF544
	add r3, sp, #0
	add r6, r0, #0
	add r4, r1, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r1, r4, #1
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	add r0, r6, #0
	bl _u32_div_f
	add r0, r1, #0
	lsl r2, r4, #2
	add r1, sp, #0
	ldr r1, [r1, r2]
	bl _u32_div_f
	add sp, #0x20
	pop {r4, r5, r6, pc}
	nop
_02073054: .word _020FF544
	thumb_func_end _u32_getDigitN

	thumb_func_start sub_02073058
sub_02073058: ; 0x02073058
	mov r2, #0x77
	mvn r2, r2
	cmp r0, r2
	bgt _02073066
	add r2, #0x74
	add r0, r2, #0
	bx lr
_02073066:
	add r1, r2, #0
	add r1, #0x28
	cmp r0, r1
	bgt _02073074
	add r2, #0x75
	add r0, r2, #0
	bx lr
_02073074:
	add r1, r2, #0
	add r1, #0x50
	cmp r0, r1
	bgt _02073082
	add r2, #0x76
	add r0, r2, #0
	bx lr
_02073082:
	add r1, r2, #0
	add r1, #0x69
	cmp r0, r1
	bgt _02073090
	add r2, #0x77
	add r0, r2, #0
	bx lr
_02073090:
	cmp r0, #0xe
	bgt _02073098
	mov r0, #0
	bx lr
_02073098:
	cmp r0, #0x27
	bgt _020730A0
	mov r0, #1
	bx lr
_020730A0:
	cmp r0, #0x4f
	bgt _020730A8
	mov r0, #2
	bx lr
_020730A8:
	cmp r0, #0x77
	bgt _020730B0
	mov r0, #3
	bx lr
_020730B0:
	mov r0, #4
	bx lr
	thumb_func_end sub_02073058

	thumb_func_start CalcBoxMonPokeathlonPerformance
CalcBoxMonPokeathlonPerformance: ; 0x020730B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r5, r1, #0
	mov r1, #0
	str r0, [sp]
	add r2, r1, #0
	bl GetBoxMonData
	str r0, [sp, #8]
	ldr r0, [sp]
	bl GetBoxMonNature
	add r6, r0, #0
	add r0, sp, #0x18
	add r1, sp, #0xc
	bl GF_RTC_CopyDateTime
	lsl r0, r6, #2
	ldr r1, _0207322C ; =_020FF6B6
	add r0, r6, r0
	add r6, r1, r0
	ldr r0, [sp, #0x20]
	mov r4, #0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add r7, r5, #0
	str r0, [sp, #4]
_020730EA:
	lsl r1, r4, #0x18
	ldr r0, [sp, #8]
	lsr r1, r1, #0x18
	bl _u32_getDigitN
	add r3, r0, #0
	mov r0, #7
	sub r1, r0, r4
	ldr r0, [sp, #4]
	add r2, r0, r1
	add r1, r4, #3
	add r0, r0, r1
	mul r0, r2
	add r0, r3, r0
	mov r1, #0
	bl _u32_getDigitN
	mov r1, #0
	ldrsb r1, [r6, r1]
	lsl r0, r0, #1
	sub r0, #9
	add r0, r1, r0
	strh r0, [r7, #2]
	add r4, r4, #1
	add r6, r6, #1
	add r7, r7, #4
	cmp r4, #5
	blo _020730EA
	ldr r0, [sp]
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	lsl r4, r0, #0x10
	ldr r0, [sp]
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	ldr r3, _02073230 ; =_020FF7B4
	lsr r4, r4, #0xf
	ldrh r3, [r3, r4]
	add r0, sp, #0x28
	mov r1, #0xa9
	add r2, r2, r3
	bl ReadWholeNarcMemberByIdPair
	add r1, sp, #0xc
	ldrb r2, [r1, #0x1c]
	mov r1, #7
	ldrh r3, [r5]
	mov r0, #7
	and r2, r1
	bic r3, r0
	orr r2, r3
	strh r2, [r5]
	add r4, sp, #0x28
	ldrb r6, [r4, #9]
	ldrh r3, [r5]
	ldr r2, _02073234 ; =0xFFFFFE3F
	lsl r6, r6, #0x1d
	and r3, r2
	lsr r6, r6, #0x17
	orr r3, r6
	strh r3, [r5]
	ldrb r7, [r4, #0xa]
	ldrh r6, [r5]
	mov r3, #0x38
	lsl r7, r7, #0x1d
	bic r6, r3
	lsr r7, r7, #0x1a
	orr r6, r7
	strh r6, [r5]
	add r7, sp, #0xc
	ldrh r6, [r5, #4]
	ldrb r7, [r7, #0x1f]
	bic r6, r0
	and r7, r1
	orr r6, r7
	strh r6, [r5, #4]
	ldrb r7, [r4, #0xf]
	ldrh r6, [r5, #4]
	lsl r7, r7, #0x1d
	and r6, r2
	lsr r7, r7, #0x17
	orr r6, r7
	strh r6, [r5, #4]
	ldrb r7, [r4, #0x10]
	ldrh r6, [r5, #4]
	lsl r7, r7, #0x1d
	bic r6, r3
	lsr r7, r7, #0x1a
	orr r6, r7
	strh r6, [r5, #4]
	ldrh r6, [r5, #8]
	ldrb r7, [r4, #4]
	bic r6, r0
	and r7, r1
	orr r6, r7
	strh r6, [r5, #8]
	ldrb r7, [r4, #0x11]
	ldrh r6, [r5, #8]
	lsl r7, r7, #0x1d
	and r6, r2
	lsr r7, r7, #0x17
	orr r6, r7
	strh r6, [r5, #8]
	ldrb r7, [r4, #0x12]
	ldrh r6, [r5, #8]
	lsl r7, r7, #0x1d
	bic r6, r3
	lsr r7, r7, #0x1a
	orr r6, r7
	strh r6, [r5, #8]
	add r7, sp, #0xc
	ldrh r6, [r5, #0xc]
	ldrb r7, [r7, #0x1e]
	bic r6, r0
	and r7, r1
	orr r6, r7
	strh r6, [r5, #0xc]
	ldrb r7, [r4, #0xd]
	ldrh r6, [r5, #0xc]
	lsl r7, r7, #0x1d
	and r6, r2
	lsr r7, r7, #0x17
	orr r6, r7
	strh r6, [r5, #0xc]
	ldrb r7, [r4, #0xe]
	ldrh r6, [r5, #0xc]
	lsl r7, r7, #0x1d
	bic r6, r3
	lsr r7, r7, #0x1a
	orr r6, r7
	strh r6, [r5, #0xc]
	ldrh r6, [r5, #0x10]
	bic r6, r0
	add r0, sp, #0xc
	ldrb r0, [r0, #0x1d]
	and r0, r1
	orr r0, r6
	strh r0, [r5, #0x10]
	ldrh r0, [r5, #0x10]
	add r1, r0, #0
	ldrb r0, [r4, #0xb]
	and r1, r2
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x17
	orr r0, r1
	strh r0, [r5, #0x10]
	ldrb r0, [r4, #0xc]
	ldrh r1, [r5, #0x10]
	lsl r0, r0, #0x1d
	bic r1, r3
	lsr r0, r0, #0x1a
	orr r0, r1
	strh r0, [r5, #0x10]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207322C: .word _020FF6B6
_02073230: .word _020FF7B4
_02073234: .word 0xFFFFFE3F
	thumb_func_end CalcBoxMonPokeathlonPerformance

	thumb_func_start CalcMonPokeathlonPerformance
CalcMonPokeathlonPerformance: ; 0x02073238
	push {r4, lr}
	add r4, r1, #0
	bl Mon_GetBoxMon
	add r1, r4, #0
	bl CalcBoxMonPokeathlonPerformance
	pop {r4, pc}
	thumb_func_end CalcMonPokeathlonPerformance

	thumb_func_start sub_02073248
sub_02073248: ; 0x02073248
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	str r2, [sp]
	mov r1, #0
	mov r2, #8
	add r5, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	add r1, sp, #4
	bl CalcBoxMonPokeathlonPerformance
	mov r4, #0
	add r6, sp, #4
	add r7, r4, #0
_02073268:
	ldr r0, [sp]
	cmp r0, #0
	beq _02073282
	mov r0, #2
	ldrsh r1, [r6, r0]
	ldr r0, [sp]
	ldrsb r0, [r0, r4]
	add r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	bl sub_02073058
	b _0207328A
_02073282:
	mov r0, #2
	ldrsh r0, [r6, r0]
	bl sub_02073058
_0207328A:
	ldrh r1, [r6]
	lsl r2, r1, #0x1d
	lsr r2, r2, #0x1d
	add r0, r0, r2
	lsl r0, r0, #0x10
	lsl r3, r1, #0x17
	asr r0, r0, #0x10
	lsr r3, r3, #0x1d
	cmp r0, r3
	bge _020732A4
	lsl r0, r3, #0x10
	asr r0, r0, #0x10
	b _020732B0
_020732A4:
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1d
	cmp r0, r1
	ble _020732B0
	lsl r0, r1, #0x10
	asr r0, r0, #0x10
_020732B0:
	cmp r0, r2
	bne _020732BC
	add r2, r5, r4
	mov r1, #0
	strb r1, [r2, #2]
	b _020732CE
_020732BC:
	cmp r0, r2
	bge _020732C8
	add r2, r5, r4
	mov r1, #2
	strb r1, [r2, #2]
	b _020732CE
_020732C8:
	add r2, r5, r4
	mov r1, #1
	strb r1, [r2, #2]
_020732CE:
	ldrh r1, [r5]
	lsl r0, r7
	orr r0, r1
	add r4, r4, #1
	strh r0, [r5]
	add r6, r6, #4
	add r7, r7, #3
	cmp r4, #5
	blo _02073268
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02073248

	thumb_func_start sub_020732E4
sub_020732E4: ; 0x020732E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	add r0, r1, #0
	bl Mon_GetBoxMon
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_02073248
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020732E4
