	.include "asm/macros.inc"
	.include "overlay_17.inc"
	.include "global.inc"

	.rodata

; FIXME: Convert all of these to C structs/arrays and figure out what order they go in.

ov17_02203D50:
	.byte 2, 1, 0, 0

ov17_02203D54:
	.byte 5, 1, 0, 0

ov17_02203D58:
	.byte 3, 1, 0, 0

ov17_02203D5C:
	.byte 4, 3, 1, 0

	.public ov17_02203D60
// UnkStruct_ov17_02203D60
ov17_02203D60: ; 0x02203D60
	.byte 0, 2, 1, 0, 0, 4, 3, 0, 0, 6, 5, 0
	.short 0x403
	.short 0xB00
	.short 0
	.short 58
	.short 31
	.short 84

	.public ov17_02203D78
// u16[7]
ov17_02203D78: ; 0x02203D78
	.short 30 ; NARC_resdat_resdat_00000030_bin
	.short 31 ; NARC_resdat_resdat_00000031_bin
	.short 29 ; NARC_resdat_resdat_00000029_bin
	.short 28 ; NARC_resdat_resdat_00000028_bin
	.short 0xFFFF
	.short 0xFFFF
	.short 79 ; NARC_resdat_resdat_00000079_bin
	.balign 4, 0

	.public ov17_02203D88
// GraphicsModes
ov17_02203D88: ; 0x02203D88
	.word 1 ; GX_DISPMODE_GRAPHICS
	.word 0 ; GX_BGMODE_0
	.word 0 ; GX_BGMODE_0
	.word 0 ; GX_BG0_AS_2D

	.public ov17_02203D98
// Unk122_021E92D0
ov17_02203D98: ; 0x02203D98
	.word 0x8
	.word 0x10000
	.word 0x4000
	.word 0x10
	.word 0x10

	.public ov17_02203DAC
// SpriteResourceCountsListUnion
ov17_02203DAC: ; 0x02203DAC
	.word 1
	.word 1
	.word 1
	.word 1
	.word 0
	.word 0

	.public ov17_02203DC4
// WindowTemplate[3]
ov17_02203DC4: ; 0x02203DC4
	.byte 2
	.byte 25
	.byte 21
	.byte 6
	.byte 2
	.byte 9
	.short 0x1A2

	.byte 0
	.byte 2
	.byte 19
	.byte 19
	.byte 4
	.byte 12
	.short 0xCA

	.byte 0
	.byte 2
	.byte 19
	.byte 27
	.byte 4
	.byte 12
	.short 0x136

	.public ov17_02203DDC
// BgTemplate
ov17_02203DDC: ; 0x02203DDC
	.word 0
	.word 0
	.word 0x800
	.word 0
	.byte 1 ; GF_BG_SCR_SIZE_256x256
	.byte 0 ; GX_BG_COLORMODE_16
	.byte 30 ; GX_BG_SCRBASE_0xf000
	.byte 0 ; GX_BG_CHARBASE_0x00000
	.byte 0 ; GX_BG_EXTPLTT_01
	.byte 3
	.byte 0 ; GX_BG_AREAOVER_XLU
	.byte 0
	.word 0 ; FALSE

	.public ov17_02203DF8
// BgTemplate
ov17_02203DF8: ; 0x02203DF8
	.word 0
	.word 0
	.word 0x800
	.word 0
	.byte 1 ; GF_BG_SCR_SIZE_256x256
	.byte 0 ; GX_BG_COLORMODE_16
	.byte 31 ; GX_BG_SCRBASE_0xf800
	.byte 4 ; GX_BG_CHARBASE_0x10000
	.byte 0 ; GX_BG_EXTPLTT_01
	.byte 0
	.byte 0 ; GX_BG_AREAOVER_XLU
	.byte 0
	.word 0 ; FALSE

	.public ov17_02203E14
// BgTemplate
ov17_02203E14: ; 0x02203E14
	.word 0
	.word 0
	.word 0x800
	.word 0
	.byte 1 ; GF_BG_SCR_SIZE_256x256
	.byte 0 ; GX_BG_COLORMODE_16
	.byte 30 ; GX_BG_SCRBASE_0xf000
	.byte 4 ; GX_BG_CHARBASE_0x10000
	.byte 0 ; GX_BG_EXTPLTT_01
	.byte 2
	.byte 0 ; GX_BG_AREAOVER_XLU
	.byte 0
	.word 0 ; FALSE

	.public ov17_02203E30
// BgTemplate
ov17_02203E30: ; 0x02203E30
	.word 0
	.word 0
	.word 0x800
	.word 0
	.byte 1 ; GF_BG_SCR_SIZE_256x256
	.byte 0 ; GX_BG_COLORMODE_16
	.byte 31 ; GX_BG_SCRBASE_0xf800
	.byte 4 ; GX_BG_CHARBASE_0x10000
	.byte 0 ; GX_BG_EXTPLTT_01
	.byte 0
	.byte 0 ; GX_BG_AREAOVER_XLU
	.byte 0
	.word 0 ; FALSE

	.public ov17_02203E4C
// BgTemplate
ov17_02203E4C: ; 0x02203E4C
	.word 0
	.word 0
	.word 0x800
	.word 0
	.byte 1 ; GF_BG_SCR_SIZE_256x256
	.byte 0 ; GX_BG_COLORMODE_16
	.byte 29 ; GX_BG_SCRBASE_0xe800
	.byte 0 ; GX_BG_CHARBASE_0x00000
	.byte 0 ; GX_BG_EXTPLTT_01
	.byte 3
	.byte 0 ; GX_BG_AREAOVER_XLU
	.byte 0
	.word 0 ; FALSE

	.public ov17_02203E68
// Unk122_021E92FC
ov17_02203E68: ; 0x02203E68
	.word 0
	.word 0x80
	.word 0
	.word 0x20
	.word 0
	.word 0x80
	.word 0
	.word 0x20

	.public ov17_02203E88
// UnkStruct_ov17_02203E88
ov17_02203E88: ; 0x02203E88
	.word 3, ov17_02203D5C
	.word 2, ov17_02203D58
	.word 2, ov17_02203D50
	.word 2, ov17_02203D54

	.public ov17_02203EA8
// UnkStruct_0200D2B4
ov17_02203EA8: ; 0x02203EA8
	.word 0
	.short 27
	.short 96
	.short 0
	.short 5
	.word 13
	.word 0
	.word 1 ; NNS_G2D_VRAM_TYPE_2DMAIN
	.word 1
	.word 0
	.word 0
	.word 0

	.public ov17_02203ED0
// GraphicsBanks
ov17_02203ED0: ; 0x02203ED0
	.word 1 ; GX_VRAM_BG_128_A
	.word 0 ; GX_VRAM_BGEXTPLTT_NONE
	.word 4 ; GX_VRAM_SUB_BG_128_C
	.word 0 ; GX_VRAM_SUB_BGEXTPLTT_NONE
	.word 16 ; GX_VRAM_OBJ_64_E
	.word 0 ; GX_VRAM_OBJEXTPLTT_NONE
	.word 256 ; GX_VRAM_SUB_OBJ_16_I
	.word 0 ; GX_VRAM_SUB_OBJEXTPLTT_NONE
	.word 0 ; GX_VRAM_TEX_NONE
	.word 0 ; GX_VRAM_TEXPLTT_NONE

	.public ov17_02203EF8
// UnkStruct_0200D2B4[2]
ov17_02203EF8: ; 0x02203EF8
	.word 0
	.short 224
	.short 176
	.short 0
	.short 0
	.word 15
	.word 0
	.word 1 ; NNS_G2D_VRAM_TYPE_2DMAIN
	.word 1
	.word 0
	.word 0
	.word 0

	.word 0
	.short 27
	.short 96
	.short 0
	.short 2
	.word 0
	.word 0
	.word 1 ; NNS_G2D_VRAM_TYPE_2DMAIN
	.word 1
	.word 0
	.word 0
	.word 0

	.public ov17_02203F48
// UnkStruct_0200D2B4
ov17_02203F48: ; 0x02203F48
	.word 0
	.short 31
	.short 56
	.short 0
	.short 8
	.word 1
	.word 0
	.word 1 ; NNS_G2D_VRAM_TYPE_2DMAIN
	.word 1
	.word 0
	.word 0
	.word 0

	.public ov17_02203F70
// UnkStruct_0200D2B4
ov17_02203F70: ; 0x02203F70
	.word 0
	.short 27
	.short 99
	.short 0
	.short 4
	.word 14
	.word 0
	.word 1 ; NNS_G2D_VRAM_TYPE_2DMAIN
	.word 1
	.word 0
	.word 0
	.word 0

	.public ov17_02203F98
// UnkStruct_0200D2B4
ov17_02203F98: ; 0x02203F98
	.word 0
	.short 27
	.short 88
	.short 0
	.short 7
	.word 12
	.word 0
	.word 1 ; NNS_G2D_VRAM_TYPE_2DMAIN
	.word 1
	.word 0
	.word 0
	.word 0

	.public ov17_02203FC0
// u8[4]
ov17_02203FC0: ; 0x02203FC0
	.byte 160, 192, 192, 0
