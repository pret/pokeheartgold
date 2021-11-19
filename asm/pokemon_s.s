#include "constants/species.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

	.public sItemOdds
sItemOdds: ; Held item odds
	.short 45, 95
	.short 20, 80
	.public _020FF4EC
_020FF4EC: ; Rotom moves
	.short MOVE_NONE
	.short MOVE_OVERHEAT
	.short MOVE_HYDRO_PUMP
	.short MOVE_BLIZZARD
	.short MOVE_AIR_SLASH
	.short MOVE_LEAF_STORM
	.public _020FF4F8
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
	.public _020FF50C
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
	.public sLegendaryMonsList
sLegendaryMonsList: ; Legendaries
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
	.public _020FF588
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

	.public sFlavorPreferencesByNature
sFlavorPreferencesByNature: ; Flavor preferences
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
	.public _020FF733
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

	.text

	.public GenPersonalityByGenderAndNature
	.public LoadGrowthTable
	.public GetExpByGrowthRateAndLevel
	.public sub_02070560
	.public Mon_ForceSetGiratinaOriginForme
	.public sub_0207213C

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
