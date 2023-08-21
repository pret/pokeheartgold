#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "unk_02004A44.inc"
	.include "global.inc"

	.rodata

_020F5710:
	.byte 0x00, 0x2A, 0x00, 0x00
	.byte 0x40, 0x6B, 0x00, 0x00
	.byte 0x20, 0x2F, 0x00, 0x00
	.byte 0x40, 0x77, 0x00, 0x00
	.byte 0x00, 0x3E, 0x00, 0x00
	.byte 0x30, 0x7F, 0x00, 0x00
	.byte 0x00, 0x34, 0x00, 0x00
	.byte 0x30, 0x75, 0x00, 0x00
_020F5730:
	.short SEQ_GS_TITLE, SEQ_GS_P_TITLE
	.short SEQ_GS_TITLE01, SEQ_GS_P_TITLE01
	.short SEQ_GS_OPENING_TITLE_G, SEQ_GS_P_OPENING_TITLE_G
	.short SEQ_GS_OPENING_TITLE_S, SEQ_GS_P_OPENING_TITLE_S
	.short SEQ_GS_POKEMON_THEME, SEQ_GS_P_POKEMON_THEME
	.short SEQ_GS_SHINKA, SEQ_GS_P_SHINKA
	.short SEQ_GS_KOUKAN, SEQ_GS_P_KOUKAN
	.short SEQ_GS_BICYCLE, SEQ_GS_P_BICYCLE
	.short SEQ_GS_NAMINORI, SEQ_GS_P_NAMINORI
	.short SEQ_GS_E_DENDOUIRI, SEQ_GS_P_E_DENDOUIRI
	.short SEQ_GS_T_WAKABA, SEQ_GS_P_T_WAKABA
	.short SEQ_GS_C_YOSHINO, SEQ_GS_P_C_YOSHINO
	.short SEQ_GS_C_KIKYOU, SEQ_GS_P_C_KIKYOU
	.short SEQ_GS_T_HIWADA, SEQ_GS_P_T_HIWADA
	.short SEQ_GS_C_KOGANE, SEQ_GS_P_C_KOGANE
	.short SEQ_GS_C_ENJU, SEQ_GS_P_C_ENJU
	.short SEQ_GS_C_ASAGI, SEQ_GS_P_C_ASAGI
	.short SEQ_GS_C_TANBA, SEQ_GS_P_C_TANBA
	.short SEQ_GS_T_CHOUJI, SEQ_GS_P_T_CHOUJI
	.short SEQ_GS_C_FUSUBE, SEQ_GS_P_C_FUSUBE
	.short SEQ_GS_R_1_29, SEQ_GS_P_R_1_29
	.short SEQ_GS_R_1_30, SEQ_GS_P_R_1_30
	.short SEQ_GS_R_2_30, SEQ_GS_P_R_2_30
	.short SEQ_GS_R_3_30, SEQ_GS_P_R_3_30
	.short SEQ_GS_R_4_34, SEQ_GS_P_R_4_34
	.short SEQ_GS_R_5_34, SEQ_GS_P_R_5_34
	.short SEQ_GS_R_6_34, SEQ_GS_P_R_6_34
	.short SEQ_GS_R_8_34, SEQ_GS_P_R_8_34
	.short SEQ_GS_R_6_38, SEQ_GS_P_R_6_38
	.short SEQ_GS_R_7_42, SEQ_GS_P_R_7_42
	.short SEQ_GS_C_KUCHIBA, SEQ_GS_P_C_KUCHIBA
	.short SEQ_GS_C_YAMABUKI, SEQ_GS_P_C_YAMABUKI
	.short SEQ_GS_C_HANADA, SEQ_GS_P_C_HANADA
	.short SEQ_GS_T_CHION, SEQ_GS_P_T_CHION
	.short SEQ_GS_C_TAMAMUSHI, SEQ_GS_P_C_TAMAMUSHI
	.short SEQ_GS_C_SEKICHIKU, SEQ_GS_P_C_SEKICHIKU
	.short SEQ_GS_C_NIBI, SEQ_GS_P_C_NIBI
	.short SEQ_GS_C_TOKIWA, SEQ_GS_P_C_TOKIWA
	.short SEQ_GS_T_MASARA, SEQ_GS_P_T_MASARA
	.short SEQ_GS_T_GUREN, SEQ_GS_P_T_GUREN
	.short SEQ_GS_R_9_01, SEQ_GS_P_R_9_01
	.short SEQ_GS_R_16_01, SEQ_GS_P_R_16_01
	.short SEQ_GS_R_17_01, SEQ_GS_P_R_17_01
	.short SEQ_GS_R_9_03, SEQ_GS_P_R_9_03
	.short SEQ_GS_R_10_03, SEQ_GS_P_R_10_03
	.short SEQ_GS_R_12_03, SEQ_GS_P_R_12_03
	.short SEQ_GS_R_13_03, SEQ_GS_P_R_13_03
	.short SEQ_GS_R_14_03, SEQ_GS_P_R_14_03
	.short SEQ_GS_R_15_03, SEQ_GS_P_R_15_03
	.short SEQ_GS_R_16_03, SEQ_GS_P_R_16_03
	.short SEQ_GS_R_17_03, SEQ_GS_P_R_17_03
	.short SEQ_GS_R_10_11, SEQ_GS_P_R_10_11
	.short SEQ_GS_R_13_11, SEQ_GS_P_R_13_11
	.short SEQ_GS_R_12_24, SEQ_GS_P_R_12_24
	.short SEQ_GS_R_1_26, SEQ_GS_P_R_1_26
	.short SEQ_GS_POKESEN, SEQ_GS_P_POKESEN
	.short SEQ_GS_FS, SEQ_GS_P_FS
	.short SEQ_GS_GYM, SEQ_GS_P_GYM
	.short SEQ_GS_UTSUGI_RABO, SEQ_GS_P_UTSUGI_RABO
	.short SEQ_GS_OHKIDO, SEQ_GS_P_OHKIDO
	.short SEQ_GS_KABURENJOU, SEQ_GS_P_KABURENJOU
	.short SEQ_GS_GAME, SEQ_GS_P_GAME
	.short SEQ_GS_BATTLETOWER, SEQ_GS_P_BATTLETOWER
	.short SEQ_GS_BATTLETOWER2, SEQ_GS_P_BATTLETOWER2
	.short SEQ_GS_TO_MADATSUBOMI1, SEQ_GS_P_TO_MADATSUBOMI1
	.short SEQ_GS_D_CHIKATSUURO, SEQ_GS_P_D_CHIKATSUURO
	.short SEQ_GS_D_UNKNOWN_ISEKI, SEQ_GS_P_D_UNKNOWN_ISEKI
	.short SEQ_GS_D_KOUEN, SEQ_GS_P_D_KOUEN
	.short SEQ_GS_TO_YAKETA, SEQ_GS_P_TO_YAKETA
	.short SEQ_GS_TO_SUZU, SEQ_GS_P_TO_SUZU
	.short SEQ_GS_TO_TOUDAI, SEQ_GS_P_TO_TOUDAI
	.short SEQ_GS_D_AJITO, SEQ_GS_P_D_AJITO
	.short SEQ_GS_D_KOORINONUKE, SEQ_GS_P_D_KOORINONUKE
	.short SEQ_GS_RYUUNOANA, SEQ_GS_P_RYUUNOANA
	.short SEQ_GS_D_IWAYAMA, SEQ_GS_P_D_IWAYAMA
	.short SEQ_GS_D_TOKIWANOMORI3, SEQ_GS_P_D_TOKIWANOMORI3
	.short SEQ_GS_D_CHAMPROAD, SEQ_GS_P_D_CHAMPROAD
	.short SEQ_GS_CHAMPROAD, SEQ_GS_P_CHAMPROAD
	.short SEQ_GS_E_TSURETEKE1, SEQ_GS_P_E_TSURETEKE1
	.short SEQ_GS_E_TSURETEKE2, SEQ_GS_P_E_TSURETEKE2
	.short SEQ_GS_E_RIVAL1, SEQ_GS_P_E_RIVAL1
	.short SEQ_GS_E_RIVAL2, SEQ_GS_P_E_RIVAL2
	.short SEQ_GS_TAIKAIMAE, SEQ_GS_P_TAIKAIMAE
	.short SEQ_GS_TAIKAI, SEQ_GS_P_TAIKAI
	.short SEQ_GS_KAIDENPA, SEQ_GS_P_KAIDENPA
	.short SEQ_GS_SENKYO, SEQ_GS_P_SENKYO
	.short SEQ_GS_E_LINEAR, SEQ_GS_P_E_LINEAR
	.short SEQ_GS_KOUSOKUSEN, SEQ_GS_P_KOUSOKUSEN
	.short SEQ_GS_OTSUKIMI_EVENT, SEQ_GS_P_OTSUKIMI_EVENT
	.short SEQ_GS_RADIO_JINGLE, SEQ_GS_P_RADIO_JINGLE
	.short SEQ_GS_RADIO_KOMORIUTA, SEQ_GS_P_RADIO_KOMORIUTA
	.short SEQ_GS_RADIO_MARCH, SEQ_GS_P_RADIO_MARCH
	.short SEQ_GS_RADIO_UNKNOWN, SEQ_GS_P_RADIO_UNKNOWN
	.short SEQ_GS_HUE, SEQ_GS_P_HUE
	.short SEQ_GS_OHKIDO_RABO, SEQ_GS_P_OHKIDO_RABO
	.short SEQ_GS_AIKOTOBA, SEQ_GS_P_AIKOTOBA
	.short SEQ_GS_E_MINAKI, SEQ_GS_P_E_MINAKI
	.short SEQ_GS_IBUKI, SEQ_GS_P_IBUKI
	.short SEQ_GS_EYE_J_SHOUJO, SEQ_GS_P_EYE_J_SHOUJO
	.short SEQ_GS_EYE_J_SHOUNEN, SEQ_GS_P_EYE_J_SHOUNEN
	.short SEQ_GS_EYE_J_AYASHII, SEQ_GS_P_EYE_J_AYASHII
	.short SEQ_GS_EYE_BOUZU, SEQ_GS_P_EYE_BOUZU
	.short SEQ_GS_EYE_MAIKO, SEQ_GS_P_EYE_MAIKO
	.short SEQ_GS_EYE_ROCKET, SEQ_GS_P_EYE_ROCKET
	.short SEQ_GS_EYE_K_SHOUJO, SEQ_GS_P_EYE_K_SHOUJO
	.short SEQ_GS_EYE_K_SHOUNEN, SEQ_GS_P_EYE_K_SHOUNEN
	.short SEQ_GS_EYE_K_AYASHII, SEQ_GS_P_EYE_K_AYASHII
	.short SEQ_GS_VS_NORAPOKE, SEQ_GS_P_VS_NORAPOKE
	.short SEQ_GS_VS_TRAINER, SEQ_GS_P_VS_TRAINER
	.short SEQ_GS_VS_GYMREADER, SEQ_GS_P_VS_GYMREADER
	.short SEQ_GS_VS_RIVAL, SEQ_GS_P_VS_RIVAL
	.short SEQ_GS_VS_ROCKET, SEQ_GS_P_VS_ROCKET
	.short SEQ_GS_VS_SUICUNE, SEQ_GS_P_VS_SUICUNE
	.short SEQ_GS_VS_ENTEI, SEQ_GS_P_VS_ENTEI
	.short SEQ_GS_VS_RAIKOU, SEQ_GS_P_VS_RAIKOU
	.short SEQ_GS_VS_CHAMP, SEQ_GS_P_VS_CHAMP
	.short SEQ_GS_VS_NORAPOKE_KANTO, SEQ_GS_P_VS_NORAPOKE_KANTO
	.short SEQ_GS_VS_TRAINER_KANTO, SEQ_GS_P_VS_TRAINER_KANTO
	.short SEQ_GS_VS_GYMREADER_KANTO, SEQ_GS_P_VS_GYMREADER_KANTO
	.short SEQ_GS_WIN1, SEQ_GS_P_WIN1
	.short SEQ_GS_WIN2, SEQ_GS_P_WIN2
	.short SEQ_GS_WIN2_NOT_FAN, SEQ_GS_P_WIN2_NOT_FAN
	.short SEQ_GS_WIN3, SEQ_GS_P_WIN3
	.short SEQ_GS_PT_ENTR, SEQ_GS_P_PT_ENTR
	.short SEQ_GS_PT_OPEN, SEQ_GS_P_PT_OPEN
	.short SEQ_GS_PT_TITLE, SEQ_GS_P_PT_TITLE
	.short SEQ_GS_PT_GAME, SEQ_GS_P_PT_GAME
	.short SEQ_GS_PT_GAMEF, SEQ_GS_P_PT_GAMEF
	.short SEQ_GS_PT_RESULT, SEQ_GS_P_PT_RESULT
	.short SEQ_GS_PT_END, SEQ_GS_P_PT_END
	.short SEQ_GS_PT_END_FIELD, SEQ_GS_P_PT_END_FIELD
	.short SEQ_GS_WIFITOWER, SEQ_GS_P_WIFITOWER
	.short SEQ_GS_SAFARI_ROAD, SEQ_GS_P_SAFARI_ROAD
	.short SEQ_GS_SAFARI_HOUSE, SEQ_GS_P_SAFARI_HOUSE
	.short SEQ_GS_SAFARI_FIELD, SEQ_GS_P_SAFARI_FIELD
	.short SEQ_PL_BICYCLE, SEQ_PL_P_BICYCLE

	.bss

_021D05E8:
	.space 0x10

_021D05F8:
	.space 0x28

_021D0620:
	.space 0x7D0

	.text

	thumb_func_start GF_SND_BGM_DisableSet
GF_SND_BGM_DisableSet: ; 0x02004A44
	push {r4, lr}
	add r4, r0, #0
	mov r0, #5
	bl GF_SdatGetAttrPtr
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end GF_SND_BGM_DisableSet

	thumb_func_start GF_SND_BGM_DisableCheck
GF_SND_BGM_DisableCheck: ; 0x02004A54
	push {r3, lr}
	mov r0, #5
	bl GF_SdatGetAttrPtr
	ldrb r0, [r0]
	pop {r3, pc}
	thumb_func_end GF_SND_BGM_DisableCheck

	thumb_func_start sub_02004A60
sub_02004A60: ; 0x02004A60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xa
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	ldr r0, _02004A8C ; =SEQ_GS_P_START
	cmp r5, r0
	bls _02004A82
	add r0, r5, #0
	bl sub_02004AB8
	add r0, r5, #0
	bl GBSounds_GetDSSeqNoByGBSeqNo
	strh r0, [r4]
	b _02004A84
_02004A82:
	strh r5, [r4]
_02004A84:
	mov r0, #0
	bl GF_SetCurrentPlayingBGM
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02004A8C: .word SEQ_GS_P_START
	thumb_func_end sub_02004A60

	thumb_func_start GF_GetCurrentPlayingBGM
GF_GetCurrentPlayingBGM: ; 0x02004A90
	push {r3, lr}
	mov r0, #0xa
	bl GF_SdatGetAttrPtr
	ldrh r0, [r0]
	pop {r3, pc}
	thumb_func_end GF_GetCurrentPlayingBGM

	thumb_func_start GF_SetCurrentPlayingBGM
GF_SetCurrentPlayingBGM: ; 0x02004A9C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb
	bl GF_SdatGetAttrPtr
	strh r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end GF_SetCurrentPlayingBGM

	thumb_func_start sub_02004AAC
sub_02004AAC: ; 0x02004AAC
	push {r3, lr}
	mov r0, #0xb
	bl GF_SdatGetAttrPtr
	ldrh r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02004AAC

	thumb_func_start sub_02004AB8
sub_02004AB8: ; 0x02004AB8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x3a
	bl GF_SdatGetAttrPtr
	strh r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02004AB8

	thumb_func_start sub_02004AC8
sub_02004AC8: ; 0x02004AC8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x20
	bl GF_SdatGetAttrPtr
	strh r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02004AC8

	thumb_func_start sub_02004AD8
sub_02004AD8: ; 0x02004AD8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x15
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	mov r0, #0x16
	bl GF_SdatGetAttrPtr
	cmp r5, #0x33
	bhs _02004AF6
	strb r5, [r4]
	mov r1, #0
	strb r1, [r0]
	pop {r3, r4, r5, pc}
_02004AF6:
	strb r5, [r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02004AD8

	thumb_func_start sub_02004AFC
sub_02004AFC: ; 0x02004AFC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x15
	bl GF_SdatGetAttrPtr
	mov r0, #0x16
	bl GF_SdatGetAttrPtr
	strb r4, [r0]
	pop {r4, pc}
	thumb_func_end sub_02004AFC

	thumb_func_start sub_02004B10
sub_02004B10: ; 0x02004B10
	push {r4, lr}
	mov r0, #0x16
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	bl sub_02005318
	mov r0, #0
	strb r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02004B10

	thumb_func_start sub_02004B24
sub_02004B24: ; 0x02004B24
	push {r4, lr}
	cmp r0, #0x4b
	bls _02004B2C
	b _02004E42
_02004B2C:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02004B38: ; jump table
	.short _02004E42 - _02004B38 - 2 ; case 0
	.short _02004BD0 - _02004B38 - 2 ; case 1
	.short _02004C76 - _02004B38 - 2 ; case 2
	.short _02004C94 - _02004B38 - 2 ; case 3
	.short _02004C9E - _02004B38 - 2 ; case 4
	.short _02004CA8 - _02004B38 - 2 ; case 5
	.short _02004CBC - _02004B38 - 2 ; case 6
	.short _02004D32 - _02004B38 - 2 ; case 7
	.short _02004CC6 - _02004B38 - 2 ; case 8
	.short _02004BD0 - _02004B38 - 2 ; case 9
	.short _02004BD0 - _02004B38 - 2 ; case 10
	.short _02004CB2 - _02004B38 - 2 ; case 11
	.short _02004CD0 - _02004B38 - 2 ; case 12
	.short _02004C76 - _02004B38 - 2 ; case 13
	.short _02004C6C - _02004B38 - 2 ; case 14
	.short _02004CEA - _02004B38 - 2 ; case 15
	.short _02004CDA - _02004B38 - 2 ; case 16
	.short _02004BD0 - _02004B38 - 2 ; case 17
	.short _02004E42 - _02004B38 - 2 ; case 18
	.short _02004BDA - _02004B38 - 2 ; case 19
	.short _02004BD0 - _02004B38 - 2 ; case 20
	.short _02004C80 - _02004B38 - 2 ; case 21
	.short _02004C9E - _02004B38 - 2 ; case 22
	.short _02004BD0 - _02004B38 - 2 ; case 23
	.short _02004CF4 - _02004B38 - 2 ; case 24
	.short _02004D04 - _02004B38 - 2 ; case 25
	.short _02004E42 - _02004B38 - 2 ; case 26
	.short _02004E42 - _02004B38 - 2 ; case 27
	.short _02004E42 - _02004B38 - 2 ; case 28
	.short _02004E42 - _02004B38 - 2 ; case 29
	.short _02004E42 - _02004B38 - 2 ; case 30
	.short _02004E42 - _02004B38 - 2 ; case 31
	.short _02004E42 - _02004B38 - 2 ; case 32
	.short _02004E42 - _02004B38 - 2 ; case 33
	.short _02004E42 - _02004B38 - 2 ; case 34
	.short _02004E42 - _02004B38 - 2 ; case 35
	.short _02004E42 - _02004B38 - 2 ; case 36
	.short _02004E42 - _02004B38 - 2 ; case 37
	.short _02004E42 - _02004B38 - 2 ; case 38
	.short _02004E42 - _02004B38 - 2 ; case 39
	.short _02004E42 - _02004B38 - 2 ; case 40
	.short _02004E42 - _02004B38 - 2 ; case 41
	.short _02004E42 - _02004B38 - 2 ; case 42
	.short _02004E42 - _02004B38 - 2 ; case 43
	.short _02004E42 - _02004B38 - 2 ; case 44
	.short _02004E42 - _02004B38 - 2 ; case 45
	.short _02004E42 - _02004B38 - 2 ; case 46
	.short _02004E42 - _02004B38 - 2 ; case 47
	.short _02004E42 - _02004B38 - 2 ; case 48
	.short _02004E42 - _02004B38 - 2 ; case 49
	.short _02004E42 - _02004B38 - 2 ; case 50
	.short _02004D14 - _02004B38 - 2 ; case 51
	.short _02004D28 - _02004B38 - 2 ; case 52
	.short _02004D32 - _02004B38 - 2 ; case 53
	.short _02004D3C - _02004B38 - 2 ; case 54
	.short _02004D46 - _02004B38 - 2 ; case 55
	.short _02004D56 - _02004B38 - 2 ; case 56
	.short _02004D60 - _02004B38 - 2 ; case 57
	.short _02004D6A - _02004B38 - 2 ; case 58
	.short _02004D74 - _02004B38 - 2 ; case 59
	.short _02004D7E - _02004B38 - 2 ; case 60
	.short _02004D88 - _02004B38 - 2 ; case 61
	.short _02004D92 - _02004B38 - 2 ; case 62
	.short _02004D9C - _02004B38 - 2 ; case 63
	.short _02004D1E - _02004B38 - 2 ; case 64
	.short _02004D46 - _02004B38 - 2 ; case 65
	.short _02004DA6 - _02004B38 - 2 ; case 66
	.short _02004D28 - _02004B38 - 2 ; case 67
	.short _02004DC6 - _02004B38 - 2 ; case 68
	.short _02004DB6 - _02004B38 - 2 ; case 69
	.short _02004DDA - _02004B38 - 2 ; case 70
	.short _02004DEA - _02004B38 - 2 ; case 71
	.short _02004DFA - _02004B38 - 2 ; case 72
	.short _02004E0E - _02004B38 - 2 ; case 73
	.short _02004E22 - _02004B38 - 2 ; case 74
	.short _02004E32 - _02004B38 - 2 ; case 75
_02004BD0:
	mov r0, #GROUP_SE_FIELD
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004BDA:
	mov r0, #GROUP_SE_FIELD
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	ldr r0, _02004E4C ; =SEQ_SE_PL_BALLOON02
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E50 ; =SEQ_SE_PL_BALLOON03_2
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E54 ; =SEQ_SE_PL_BALLOON05
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E58 ; =SEQ_SE_PL_BALLOON01
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E5C ; =SEQ_SE_PL_BALLOON07
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E60 ; =SEQ_SE_PL_ALERT4
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E64 ; =SEQ_SE_DP_FW104
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E68 ; =SEQ_SE_PL_NOMI02
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E6C ; =SEQ_SE_DP_023
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E70 ; =SEQ_SE_PL_POINT1
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E74 ; =SEQ_SE_PL_POINT2
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E78 ; =SEQ_SE_PL_POINT3
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E7C ; =SEQ_SE_PL_BALLOON05_2
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E80 ; =SEQ_SE_DP_HAMARU
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E84 ; =SEQ_SE_DP_CON_016
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E88 ; =SEQ_SE_PL_KIRAKIRA
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	ldr r0, _02004E8C ; =SEQ_SE_PL_FCALL
	mov r1, #1
	bl GF_Snd_LoadSeqEx
	b _02004E48
_02004C6C:
	mov r0, #GROUP_SE_NUTMIXER
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004C76:
	mov r0, #GROUP_SE_BATTLE
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004C80:
	mov r0, #WAVE_ARC_SE_HIROBA>>8
	lsl r0, r0, #8
	bl GF_Snd_LoadBank
	mov r0, #3
	lsl r0, r0, #8
	bl GF_Snd_LoadWaveArc
	add r4, r0, #0
	b _02004E48
_02004C94:
	mov r0, #GROUP_SE_TRADE
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004C9E:
	mov r0, #GROUP_SE_FIELD
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CA8:
	mov r0, #GROUP_SE_BATTLE
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CB2:
	mov r0, #GROUP_SE_FIELD
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CBC:
	mov r0, #GROUP_SE_CONTEST
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CC6:
	mov r0, #GROUP_SE_FIELD
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CD0:
	mov r0, #GROUP_SE_NUTMIXER
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CDA:
	mov r0, #GROUP_SE_FIELD
	bl GF_Snd_LoadGroup
	mov r0, #GROUP_SE_DIG
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CEA:
	mov r0, #GROUP_SE_FIELD
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004CF4:
	ldr r0, _02004E90 ; =BANK_SE_THLON
	bl GF_Snd_LoadBank
	ldr r0, _02004E90 ; =WAVE_ARC_SE_THLON
	bl GF_Snd_LoadWaveArc
	add r4, r0, #0
	b _02004E48
_02004D04:
	ldr r0, _02004E94 ; =BANK_SE_THLON_OPED
	bl GF_Snd_LoadBank
	ldr r0, _02004E94 ; =WAVE_ARC_SE_THLON_OPED
	bl GF_Snd_LoadWaveArc
	add r4, r0, #0
	b _02004E48
_02004D14:
	mov r0, #GROUP_SE_BAG
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D1E:
	mov r0, #GROUP_SE_SLOT
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D28:
	mov r0, #GROUP_SE_NAMEIN
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D32:
	mov r0, #GROUP_SE_IMAGE
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D3C:
	mov r0, #GROUP_SE_ZUKAN
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D46:
	ldr r0, _02004E98 ; =BANK_SE_TOWNMAP
	bl GF_Snd_LoadBank
	ldr r0, _02004E98 ; =WAVE_ARC_SE_TOWNMAP
	bl GF_Snd_LoadWaveArc
	add r4, r0, #0
	b _02004E48
_02004D56:
	mov r0, #GROUP_SE_TRCARD
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D60:
	mov r0, #GROUP_SE_POKELIST
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D6A:
	mov r0, #GROUP_SE_DIG
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D74:
	mov r0, #GROUP_SE_CUSTOM
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D7E:
	mov r0, #GROUP_SE_BAG
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D88:
	mov r0, #GROUP_SE_NAMEIN
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D92:
	mov r0, #GROUP_SE_CUSTOM
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004D9C:
	mov r0, #GROUP_SE_CLIMAX
	bl GF_Snd_LoadGroup
	add r4, r0, #0
	b _02004E48
_02004DA6:
	ldr r0, _02004E9C ; =BANK_SE_SCRATCH
	bl GF_Snd_LoadBank
	ldr r0, _02004E9C ; =WAVE_ARC_SE_SCRATCH
	bl GF_Snd_LoadWaveArc
	add r4, r0, #0
	b _02004E48
_02004DB6:
	ldr r0, _02004EA0 ; =BANK_SE_PLANTER
	bl GF_Snd_LoadBank
	ldr r0, _02004EA0 ; =WAVE_ARC_SE_PLANTER
	bl GF_Snd_LoadWaveArc
	add r4, r0, #0
	b _02004E48
_02004DC6:
	mov r0, #BANK_SE_LINEAR>>2
	lsl r0, r0, #2
	bl GF_Snd_LoadBank
	mov r0, #WAVE_ARC_SE_LINEAR>>2
	lsl r0, r0, #2
	bl GF_Snd_LoadWaveArc
	add r4, r0, #0
	b _02004E48
_02004DDA:
	ldr r0, _02004EA4 ; =BANK_SE_COIN
	bl GF_Snd_LoadBank
	ldr r0, _02004EA4 ; =WAVE_ARC_SE_COIN
	bl GF_Snd_LoadWaveArc
	add r4, r0, #0
	b _02004E48
_02004DEA:
	ldr r0, _02004EA8 ; =BANK_SE_DENDO
	bl GF_Snd_LoadBank
	ldr r0, _02004EA8 ; =WAVE_ARC_SE_DENDO
	bl GF_Snd_LoadWaveArc
	add r4, r0, #0
	b _02004E48
_02004DFA:
	mov r0, #BANK_SE_JUICE>>2
	lsl r0, r0, #2
	bl GF_Snd_LoadBank
	mov r0, #WAVE_ARC_SE_JUICE>>2
	lsl r0, r0, #2
	bl GF_Snd_LoadWaveArc
	add r4, r0, #0
	b _02004E48
_02004E0E:
	mov r0, #BANK_SE_PHC>>2
	lsl r0, r0, #2
	bl GF_Snd_LoadBank
	mov r0, #WAVE_ARC_SE_PHC>>2
	lsl r0, r0, #2
	bl GF_Snd_LoadWaveArc
	add r4, r0, #0
	b _02004E48
_02004E22:
	ldr r0, _02004EAC ; =BANK_SE_SEKIBAN
	bl GF_Snd_LoadBank
	ldr r0, _02004EAC ; =WAVE_ARC_SE_SEKIBAN
	bl GF_Snd_LoadWaveArc
	add r4, r0, #0
	b _02004E48
_02004E32:
	ldr r0, _02004EB0 ; =BANK_SE_EVENT
	bl GF_Snd_LoadBank
	ldr r0, _02004EB0 ; =WAVE_ARC_SE_EVENT
	bl GF_Snd_LoadWaveArc
	add r4, r0, #0
	b _02004E48
_02004E42:
	bl GF_AssertFail
	mov r4, #0
_02004E48:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02004E4C: .word SEQ_SE_PL_BALLOON02
_02004E50: .word SEQ_SE_PL_BALLOON03_2
_02004E54: .word SEQ_SE_PL_BALLOON05
_02004E58: .word SEQ_SE_PL_BALLOON01
_02004E5C: .word SEQ_SE_PL_BALLOON07
_02004E60: .word SEQ_SE_PL_ALERT4
_02004E64: .word SEQ_SE_DP_FW104
_02004E68: .word SEQ_SE_PL_NOMI02
_02004E6C: .word SEQ_SE_DP_023
_02004E70: .word SEQ_SE_PL_POINT1
_02004E74: .word SEQ_SE_PL_POINT2
_02004E78: .word SEQ_SE_PL_POINT3
_02004E7C: .word SEQ_SE_PL_BALLOON05_2
_02004E80: .word SEQ_SE_DP_HAMARU
_02004E84: .word SEQ_SE_DP_CON_016
_02004E88: .word SEQ_SE_PL_KIRAKIRA
_02004E8C: .word SEQ_SE_PL_FCALL
_02004E90: .word BANK_SE_THLON
_02004E94: .word BANK_SE_THLON_OPED
_02004E98: .word BANK_SE_TOWNMAP
_02004E9C: .word BANK_SE_SCRATCH
_02004EA0: .word BANK_SE_PLANTER
_02004EA4: .word BANK_SE_COIN
_02004EA8: .word BANK_SE_DENDO
_02004EAC: .word BANK_SE_SEKIBAN
_02004EB0: .word BANK_SE_EVENT
	thumb_func_end sub_02004B24

	thumb_func_start sub_02004EB4
sub_02004EB4: ; 0x02004EB4
	ldr r3, _02004EC0 ; =sub_02004EC4
	add r1, r0, #0
	mov r0, #4
	mov r2, #1
	bx r3
	nop
_02004EC0: .word sub_02004EC4
	thumb_func_end sub_02004EB4

	thumb_func_start sub_02004EC4
sub_02004EC4: ; 0x02004EC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x15
	add r5, r1, #0
	add r6, r2, #0
	bl GF_SdatGetAttrPtr
	str r0, [sp]
	mov r0, #0x16
	bl GF_SdatGetAttrPtr
	str r0, [sp, #4]
	mov r0, #0xe
	bl GF_SdatGetAttrPtr
	add r7, r0, #0
	cmp r4, #0x33
	bhs _02004EF8
	ldr r0, [sp]
	ldrb r0, [r0]
	cmp r0, r4
	bne _02004F06
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02004EF8:
	ldr r0, [sp, #4]
	ldrb r0, [r0]
	cmp r0, r4
	bne _02004F06
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02004F06:
	add r0, r4, #0
	bl sub_02004AD8
	cmp r4, #0x4a
	bls _02004F12
	b _02005054
_02004F12:
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02004F1E: ; jump table
	.short _02005054 - _02004F1E - 2 ; case 0
	.short _02005006 - _02004F1E - 2 ; case 1
	.short _0200502A - _02004F1E - 2 ; case 2
	.short _0200503C - _02004F1E - 2 ; case 3
	.short _02004FB4 - _02004F1E - 2 ; case 4
	.short _02004FC8 - _02004F1E - 2 ; case 5
	.short _02004FDC - _02004F1E - 2 ; case 6
	.short _02004FE6 - _02004F1E - 2 ; case 7
	.short _0200503C - _02004F1E - 2 ; case 8
	.short _0200503C - _02004F1E - 2 ; case 9
	.short _0200503C - _02004F1E - 2 ; case 10
	.short _02004FD2 - _02004F1E - 2 ; case 11
	.short _0200503C - _02004F1E - 2 ; case 12
	.short _0200503C - _02004F1E - 2 ; case 13
	.short _02005018 - _02004F1E - 2 ; case 14
	.short _0200503C - _02004F1E - 2 ; case 15
	.short _0200503C - _02004F1E - 2 ; case 16
	.short _0200503C - _02004F1E - 2 ; case 17
	.short _0200503C - _02004F1E - 2 ; case 18
	.short _0200503C - _02004F1E - 2 ; case 19
	.short _0200503C - _02004F1E - 2 ; case 20
	.short _0200503C - _02004F1E - 2 ; case 21
	.short _02005048 - _02004F1E - 2 ; case 22
	.short _0200503C - _02004F1E - 2 ; case 23
	.short _0200503C - _02004F1E - 2 ; case 24
	.short _0200503C - _02004F1E - 2 ; case 25
	.short _02005054 - _02004F1E - 2 ; case 26
	.short _02005054 - _02004F1E - 2 ; case 27
	.short _02005054 - _02004F1E - 2 ; case 28
	.short _02005054 - _02004F1E - 2 ; case 29
	.short _02005054 - _02004F1E - 2 ; case 30
	.short _02005054 - _02004F1E - 2 ; case 31
	.short _02005054 - _02004F1E - 2 ; case 32
	.short _02005054 - _02004F1E - 2 ; case 33
	.short _02005054 - _02004F1E - 2 ; case 34
	.short _02005054 - _02004F1E - 2 ; case 35
	.short _02005054 - _02004F1E - 2 ; case 36
	.short _02005054 - _02004F1E - 2 ; case 37
	.short _02005054 - _02004F1E - 2 ; case 38
	.short _02005054 - _02004F1E - 2 ; case 39
	.short _02005054 - _02004F1E - 2 ; case 40
	.short _02005054 - _02004F1E - 2 ; case 41
	.short _02005054 - _02004F1E - 2 ; case 42
	.short _02005054 - _02004F1E - 2 ; case 43
	.short _02005054 - _02004F1E - 2 ; case 44
	.short _02005054 - _02004F1E - 2 ; case 45
	.short _02005054 - _02004F1E - 2 ; case 46
	.short _02005054 - _02004F1E - 2 ; case 47
	.short _02005054 - _02004F1E - 2 ; case 48
	.short _02005054 - _02004F1E - 2 ; case 49
	.short _02005054 - _02004F1E - 2 ; case 50
	.short _02004FF0 - _02004F1E - 2 ; case 51
	.short _02004FF0 - _02004F1E - 2 ; case 52
	.short _02004FF0 - _02004F1E - 2 ; case 53
	.short _02004FF0 - _02004F1E - 2 ; case 54
	.short _02004FF0 - _02004F1E - 2 ; case 55
	.short _02004FF0 - _02004F1E - 2 ; case 56
	.short _02004FF0 - _02004F1E - 2 ; case 57
	.short _02004FF0 - _02004F1E - 2 ; case 58
	.short _02004FF0 - _02004F1E - 2 ; case 59
	.short _02004FF0 - _02004F1E - 2 ; case 60
	.short _02004FF0 - _02004F1E - 2 ; case 61
	.short _02004FF0 - _02004F1E - 2 ; case 62
	.short _02004FF0 - _02004F1E - 2 ; case 63
	.short _02004FF0 - _02004F1E - 2 ; case 64
	.short _02004FF0 - _02004F1E - 2 ; case 65
	.short _02004FF0 - _02004F1E - 2 ; case 66
	.short _02004FF0 - _02004F1E - 2 ; case 67
	.short _02004FF8 - _02004F1E - 2 ; case 68
	.short _02004FF0 - _02004F1E - 2 ; case 69
	.short _02004FF0 - _02004F1E - 2 ; case 70
	.short _02004FF0 - _02004F1E - 2 ; case 71
	.short _02004FF0 - _02004F1E - 2 ; case 72
	.short _0200503C - _02004F1E - 2 ; case 73
	.short _02004FF0 - _02004F1E - 2 ; case 74
_02004FB4:
	mov r0, #0
	bl sub_02005AF8
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0200508C
	mov r0, #0
	strh r0, [r7]
	b _0200505A
_02004FC8:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02005228
	b _0200505A
_02004FD2:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02005260
	b _0200505A
_02004FDC:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02005280
	b _0200505A
_02004FE6:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020052A4
	b _0200505A
_02004FF0:
	add r0, r4, #0
	bl sub_020052C8
	b _0200505A
_02004FF8:
	add r0, r4, #0
	bl sub_020052C8
	add r0, r5, #0
	bl PlayBGM
	b _0200505A
_02005006:
	mov r0, #1
	bl sub_02005AF8
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_020052E4
	b _0200505A
_02005018:
	mov r0, #2
	bl sub_02005AF8
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_020052E4
	b _0200505A
_0200502A:
	mov r0, #0
	bl sub_02005AF8
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_020052E4
	b _0200505A
_0200503C:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_020052E4
	b _0200505A
_02005048:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_020052E4
	b _0200505A
_02005054:
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0200505A:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02004EC4

	thumb_func_start sub_02005060
sub_02005060: ; 0x02005060
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl GF_SdatGetAttrPtr
	ldr r0, [r0]
	bl GF_Snd_LoadState
	mov r0, #0x19
	bl GF_SdatGetAttrPtr
	bl GF_Snd_SaveState
	add r0, r4, #0
	bl sub_02004B24
	mov r0, #0x1a
	bl GF_SdatGetAttrPtr
	bl GF_Snd_SaveState
	pop {r4, pc}
	thumb_func_end sub_02005060

	thumb_func_start sub_0200508C
sub_0200508C: ; 0x0200508C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xc
	bl GF_SdatGetAttrPtr
	add r6, r0, #0
	mov r0, #0x18
	bl GF_SdatGetAttrPtr
	mov r0, #0x20
	bl GF_SdatGetAttrPtr
	mov r0, #0
	bl GF_GetSoundHandle
	bl GF_NNS_SndPlayerGetSeqNo
	add r7, r0, #0
	lsl r0, r7, #0x10
	lsr r4, r0, #0x10
	ldr r0, _02005144 ; =SEQ_GS_P_START
	cmp r7, r0
	ble _020050C2
	add r0, r4, #0
	bl GBSounds_GetDSSeqNoByGBSeqNo
	add r4, r0, #0
_020050C2:
	ldrb r0, [r6]
	cmp r0, #0
	bne _020050D6
	cmp r4, r5
	bne _020050D6
	bl sub_02004AAC
	ldr r1, _02005148 ; =SEQ_GS_BICYCLE
	cmp r0, r1
	bne _02005142
_020050D6:
	mov r0, #1
	bl sub_020059E0
	ldr r0, _0200514C ; =_021D05E8
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _020050EA
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _020050F4
_020050EA:
	bl sub_02005FD8
	ldr r0, _0200514C ; =_021D05E8
	mov r1, #1
	str r1, [r0, #4]
_020050F4:
	cmp r4, r5
	beq _02005104
	mov r0, #1
	mov r1, #0
	bl sub_020053A8
	bl Sound_Stop
_02005104:
	ldrb r0, [r6]
	cmp r0, #1
	bne _0200513C
	mov r0, #2
	bl sub_02005328
	bl GF_Snd_LoadState
	mov r0, #4
	bl sub_02004B24
	mov r0, #0x1a
	bl GF_SdatGetAttrPtr
	bl GF_Snd_SaveState
	cmp r4, r5
	beq _02005130
	mov r0, #1
	mov r1, #0
	bl sub_020053A8
_02005130:
	lsl r1, r7, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl sub_02005150
	pop {r3, r4, r5, r6, r7, pc}
_0200513C:
	add r0, r5, #0
	bl PlayBGM
_02005142:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02005144: .word SEQ_GS_P_START
_02005148: .word SEQ_GS_BICYCLE
_0200514C: .word _021D05E8
	thumb_func_end sub_0200508C

	thumb_func_start sub_02005150
sub_02005150: ; 0x02005150
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x20
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	ldrh r0, [r4]
	bl GF_GetBankBySeqNo
	mov r1, #0xaf
	lsl r1, r1, #2
	cmp r0, r1
	bne _02005178
	add r0, r5, #0
	mov r1, #4
	bl GF_Snd_LoadSeqEx
	bl GF_AssertFail
	b _02005180
_02005178:
	ldrh r0, [r4]
	mov r1, #6
	bl GF_Snd_LoadSeqEx
_02005180:
	mov r0, #0x1b
	bl GF_SdatGetAttrPtr
	bl GF_Snd_SaveState
	mov r0, #1
	mov r1, #0
	bl sub_020053A8
	mov r0, #0x7f
	mov r1, #0x28
	mov r2, #0
	bl GF_SndStartFadeInBGM
	mov r0, #0
	bl sub_020059E0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005150

	thumb_func_start sub_020051A4
sub_020051A4: ; 0x020051A4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x13
	add r5, r1, #0
	bl GF_SdatGetAttrPtr
	add r6, r0, #0
	mov r0, #0x20
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	ldrb r0, [r6]
	cmp r0, #1
	beq _020051C4
	cmp r5, #0
	bne _02005224
_020051C4:
	mov r0, #1
	bl sub_02005328
	bl GF_Snd_LoadState
	mov r0, #0
	bl sub_02004AFC
	ldrh r0, [r4]
	mov r1, #2
	bl GF_Snd_LoadSeqEx
	mov r0, #0x19
	bl GF_SdatGetAttrPtr
	bl GF_Snd_SaveState
	mov r0, #4
	bl sub_02004B24
	mov r0, #0x1a
	bl GF_SdatGetAttrPtr
	bl GF_Snd_SaveState
	ldrh r0, [r4]
	bl GF_GetBankBySeqNo
	mov r1, #0xaf
	lsl r1, r1, #2
	cmp r0, r1
	bne _02005212
	add r0, r7, #0
	mov r1, #4
	bl GF_Snd_LoadSeqEx
	bl GF_AssertFail
	b _0200521A
_02005212:
	ldrh r0, [r4]
	mov r1, #4
	bl GF_Snd_LoadSeqEx
_0200521A:
	mov r0, #0x1b
	bl GF_SdatGetAttrPtr
	bl GF_Snd_SaveState
_02005224:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020051A4

	thumb_func_start sub_02005228
sub_02005228: ; 0x02005228
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl GF_SdatGetAttrPtr
	bl sub_02005B20
	mov r0, #2
	bl sub_02005328
	bl GF_Snd_LoadState
	mov r0, #5
	bl sub_02004B24
	mov r0, #0x1a
	bl GF_SdatGetAttrPtr
	bl GF_Snd_SaveState
	mov r0, #1
	bl sub_020059E0
	add r0, r4, #0
	bl PlayBGM
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005228

	thumb_func_start sub_02005260
sub_02005260: ; 0x02005260
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl GF_SdatGetAttrPtr
	bl Sound_Stop
	bl sub_020053F0
	mov r0, #4
	bl sub_02005060
	add r0, r4, #0
	bl PlayBGM
	pop {r4, pc}
	thumb_func_end sub_02005260

	thumb_func_start sub_02005280
sub_02005280: ; 0x02005280
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl GF_SdatGetAttrPtr
	bl Sound_Stop
	mov r0, #6
	bl sub_02005060
	mov r0, #1
	bl sub_020059E0
	add r0, r4, #0
	bl PlayBGM
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005280

	thumb_func_start sub_020052A4
sub_020052A4: ; 0x020052A4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl GF_SdatGetAttrPtr
	bl Sound_Stop
	mov r0, #7
	bl sub_02005060
	mov r0, #1
	bl sub_020059E0
	add r0, r4, #0
	bl PlayBGM
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020052A4

	thumb_func_start sub_020052C8
sub_020052C8: ; 0x020052C8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02005318
	add r0, r4, #0
	bl sub_02004B24
	mov r0, #0x1c
	bl GF_SdatGetAttrPtr
	bl GF_Snd_SaveState
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020052C8

	thumb_func_start sub_020052E4
sub_020052E4: ; 0x020052E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x18
	add r4, r1, #0
	bl GF_SdatGetAttrPtr
	bl Sound_Stop
	add r0, r5, #0
	bl sub_02005060
	add r0, r4, #0
	bl PlayBGM
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020052E4

	thumb_func_start BGM_SaveStateAndPlayNew
BGM_SaveStateAndPlayNew: ; 0x02005304
	push {r4, lr}
	add r4, r0, #0
	bl GetSoundDataPointer
	bl sub_02005B20
	add r0, r4, #0
	bl PlayBGM
	pop {r4, pc}
	thumb_func_end BGM_SaveStateAndPlayNew

	thumb_func_start sub_02005318
sub_02005318: ; 0x02005318
	push {r3, lr}
	mov r0, #4
	bl sub_02005328
	bl GF_Snd_LoadState
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005318

	thumb_func_start sub_02005328
sub_02005328: ; 0x02005328
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl GetSoundDataPointer
	cmp r4, #7
	blt _02005342
	bl GF_AssertFail
	mov r0, #0x1b
	bl GF_SdatGetAttrPtr
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
_02005342:
	cmp r4, #6
	bhi _020053A4
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02005352: ; jump table
	.short _02005360 - _02005352 - 2 ; case 0
	.short _0200536A - _02005352 - 2 ; case 1
	.short _02005374 - _02005352 - 2 ; case 2
	.short _0200537E - _02005352 - 2 ; case 3
	.short _02005388 - _02005352 - 2 ; case 4
	.short _02005392 - _02005352 - 2 ; case 5
	.short _0200539C - _02005352 - 2 ; case 6
_02005360:
	mov r0, #0x17
	bl GF_SdatGetAttrPtr
	add r5, r0, #0
	b _020053A4
_0200536A:
	mov r0, #0x18
	bl GF_SdatGetAttrPtr
	add r5, r0, #0
	b _020053A4
_02005374:
	mov r0, #0x19
	bl GF_SdatGetAttrPtr
	add r5, r0, #0
	b _020053A4
_0200537E:
	mov r0, #0x1a
	bl GF_SdatGetAttrPtr
	add r5, r0, #0
	b _020053A4
_02005388:
	mov r0, #0x1b
	bl GF_SdatGetAttrPtr
	add r5, r0, #0
	b _020053A4
_02005392:
	mov r0, #0x1c
	bl GF_SdatGetAttrPtr
	add r5, r0, #0
	b _020053A4
_0200539C:
	mov r0, #0x1d
	bl GF_SdatGetAttrPtr
	add r5, r0, #0
_020053A4:
	ldr r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005328

	thumb_func_start sub_020053A8
sub_020053A8: ; 0x020053A8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	cmp r0, #1
	bne _020053BC
	mov r0, #0xc
	bl GF_SdatGetAttrPtr
	add r6, r0, #0
	mov r4, #0
	b _020053CA
_020053BC:
	cmp r0, #7
	bne _020053EE
	mov r0, #0xd
	bl GF_SdatGetAttrPtr
	add r6, r0, #0
	mov r4, #7
_020053CA:
	cmp r5, #0
	bne _020053E0
	add r0, r4, #0
	bl GF_GetSoundHandle
	bl GF_NNS_SndPlayerGetSeqNo
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02004A60
_020053E0:
	add r0, r4, #0
	bl GF_GetSoundHandle
	add r1, r5, #0
	bl NNS_SndPlayerPause
	strb r5, [r6]
_020053EE:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020053A8

	thumb_func_start sub_020053F0
sub_020053F0: ; 0x020053F0
	push {r4, lr}
	mov r0, #0xc
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	mov r0, #0xd
	bl GF_SdatGetAttrPtr
	mov r1, #0
	strb r1, [r4]
	strb r1, [r0]
	pop {r4, pc}
	thumb_func_end sub_020053F0

	thumb_func_start GF_SndHandleMoveVolume
GF_SndHandleMoveVolume: ; 0x02005408
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r6, r0, #0
	bl GF_GetSoundHandle
	add r1, r5, #0
	add r2, r4, #0
	bl NNS_SndPlayerMoveVolume
	cmp r6, #0
	bne _02005428
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl GF_SndWorkSetGbSoundsVolume
_02005428:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end GF_SndHandleMoveVolume

	thumb_func_start GF_SndHandleSetInitialVolume
GF_SndHandleSetInitialVolume: ; 0x0200542C
	push {r4, lr}
	add r4, r1, #0
	bpl _02005434
	mov r4, #0
_02005434:
	cmp r4, #0x7f
	ble _0200543A
	mov r4, #0x7f
_0200543A:
	bl GF_GetSoundHandle
	add r1, r4, #0
	bl NNS_SndPlayerSetInitialVolume
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end GF_SndHandleSetInitialVolume

	thumb_func_start sub_02005448
sub_02005448: ; 0x02005448
	push {r4, lr}
	add r4, r0, #0
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl GF_GetPlayerNoBySeq
	bl GF_GetSndHandleByPlayerNo
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02005464
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005448

	thumb_func_start sub_02005464
sub_02005464: ; 0x02005464
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl NNS_SndArcGetSeqParam
	cmp r5, #1
	beq _02005474
	cmp r5, #8
	bne _02005478
_02005474:
	mov r4, #0x7f
	b _0200547E
_02005478:
	cmp r0, #0
	beq _02005496
	ldrb r4, [r0, #2]
_0200547E:
	bl sub_020378CC
	cmp r0, #1
	bne _02005496
	add r0, r4, #0
	mov r1, #5
	bl _s32_div_f
	add r1, r0, #0
	add r0, r5, #0
	bl GF_SndHandleSetInitialVolume
_02005496:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005464

	thumb_func_start GF_GetVolumeBySeqNo
GF_GetVolumeBySeqNo: ; 0x02005498
	push {r3, lr}
	bl NNS_SndArcGetSeqParam
	cmp r0, #0
	bne _020054A6
	mov r0, #0
	pop {r3, pc}
_020054A6:
	ldrb r0, [r0, #2]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end GF_GetVolumeBySeqNo

	thumb_func_start GF_SetVolumeBySeqNo
GF_SetVolumeBySeqNo: ; 0x020054AC
	push {r4, lr}
	add r4, r1, #0
	bl GF_GetPlayerNoBySeq
	bl GF_GetSndHandleByPlayerNo
	add r1, r4, #0
	bl GF_SndHandleSetInitialVolume
	pop {r4, pc}
	thumb_func_end GF_SetVolumeBySeqNo

	thumb_func_start GF_SndPlayerCountPlayingSeqByPlayerNo
GF_SndPlayerCountPlayingSeqByPlayerNo: ; 0x020054C0
	push {r4, lr}
	add r4, r0, #0
	bpl _020054CA
	bl GF_AssertFail
_020054CA:
	add r0, r4, #0
	bl NNS_SndPlayerCountPlayingSeqByPlayerNo
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end GF_SndPlayerCountPlayingSeqByPlayerNo

	thumb_func_start GF_GetPlayerNoBySeq
GF_GetPlayerNoBySeq: ; 0x020054D4
	push {r3, lr}
	cmp r0, #0
	bne _020054DE
	mov r0, #0xff
	pop {r3, pc}
_020054DE:
	bl NNS_SndArcGetSeqParam
	cmp r0, #0
	bne _020054EA
	mov r0, #0xff
	pop {r3, pc}
_020054EA:
	ldrb r0, [r0, #5]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end GF_GetPlayerNoBySeq

	thumb_func_start GF_NNS_SndPlayerGetSeqNo
GF_NNS_SndPlayerGetSeqNo: ; 0x020054F0
	ldr r3, _020054F4 ; =NNS_SndPlayerGetSeqNo
	bx r3
	.balign 4, 0
_020054F4: .word NNS_SndPlayerGetSeqNo
	thumb_func_end GF_NNS_SndPlayerGetSeqNo

	thumb_func_start GF_GetBankInfoBySeqNo
GF_GetBankInfoBySeqNo: ; 0x020054F8
	push {r3, lr}
	bl GF_GetBankBySeqNo
	bl NNS_SndArcGetBankInfo
	pop {r3, pc}
	thumb_func_end GF_GetBankInfoBySeqNo

	thumb_func_start GF_GetBankBySeqNo
GF_GetBankBySeqNo: ; 0x02005504
	push {r3, lr}
	bl NNS_SndArcGetSeqParam
	cmp r0, #0
	bne _02005512
	mov r0, #0
	pop {r3, pc}
_02005512:
	ldrh r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end GF_GetBankBySeqNo

	thumb_func_start sub_02005518
sub_02005518: ; 0x02005518
	ldr r3, _0200551C ; =GF_SndWorkMicCounterFull
	bx r3
	.balign 4, 0
_0200551C: .word GF_SndWorkMicCounterFull
	thumb_func_end sub_02005518

	thumb_func_start GF_MIC_StartAutoSampling
GF_MIC_StartAutoSampling: ; 0x02005520
	push {r4, lr}
	add r4, r0, #0
	bl MIC_StartAutoSampling
	add r3, r0, #0
	ldr r0, _02005548 ; =_021D05E8
	mov r1, #1
	strb r1, [r0]
	ldr r2, _0200554C ; =_021D05F8
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	add r0, r3, #0
	pop {r4, pc}
	nop
_02005548: .word _021D05E8
_0200554C: .word _021D05F8
	thumb_func_end GF_MIC_StartAutoSampling

	thumb_func_start GF_MIC_StopAutoSampling
GF_MIC_StopAutoSampling: ; 0x02005550
	push {r3, lr}
	bl GetSoundDataPointer
	ldr r0, _02005564 ; =_021D05E8
	mov r1, #0
	strb r1, [r0]
	bl MIC_StopAutoSampling
	pop {r3, pc}
	nop
_02005564: .word _021D05E8
	thumb_func_end GF_MIC_StopAutoSampling

	thumb_func_start GF_MicPauseOnLidClose
GF_MicPauseOnLidClose: ; 0x02005568
	push {r3, lr}
	ldr r0, _02005580 ; =_021D05E8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200557E
	bl MIC_StopAutoSampling
	cmp r0, #0
	beq _0200557E
	bl GF_AssertFail
_0200557E:
	pop {r3, pc}
	.balign 4, 0
_02005580: .word _021D05E8
	thumb_func_end GF_MicPauseOnLidClose

	thumb_func_start GF_MicResumeOnLidOpen
GF_MicResumeOnLidOpen: ; 0x02005584
	push {r3, lr}
	ldr r0, _020055A4 ; =_021D05E8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200559C
	ldr r0, _020055A8 ; =_021D05F8
	bl MIC_StartAutoSampling
	cmp r0, #0
	beq _0200559C
	bl GF_AssertFail
_0200559C:
	bl GF_SndWorkMicCounterReset
	pop {r3, pc}
	nop
_020055A4: .word _021D05E8
_020055A8: .word _021D05F8
	thumb_func_end GF_MicResumeOnLidOpen

	thumb_func_start sub_020055AC
sub_020055AC: ; 0x020055AC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl GetSoundDataPointer
	mov r0, #0x10
	bl GF_SdatGetAttrPtr
	add r6, r0, #0
	mov r0, #0x11
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	cmp r5, #0xe
	beq _020055D0
	cmp r5, #0xf
	beq _020055D0
	bl GF_AssertFail
_020055D0:
	cmp r5, #0xe
	bne _020055DE
	ldrb r0, [r6]
	cmp r0, #0
	bne _020055DE
	bl GF_AssertFail
_020055DE:
	cmp r5, #0xf
	bne _020055EC
	ldrb r0, [r4]
	cmp r0, #0
	bne _020055EC
	bl GF_AssertFail
_020055EC:
	cmp r5, #0xe
	bne _020055F8
	mov r0, #0
	bl GF_SdatGetAttrPtr
	pop {r4, r5, r6, pc}
_020055F8:
	mov r0, #1
	bl GF_SdatGetAttrPtr
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020055AC

	thumb_func_start sub_02005600
sub_02005600: ; 0x02005600
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl GetSoundDataPointer
	mov r0, #0x10
	bl GF_SdatGetAttrPtr
	add r6, r0, #0
	mov r0, #0x11
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	cmp r5, #0xe
	beq _02005624
	cmp r5, #0xf
	beq _02005624
	bl GF_AssertFail
_02005624:
	cmp r5, #0xe
	bne _02005652
	ldrb r0, [r6]
	cmp r0, #0
	bne _0200564C
	mov r0, #0
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	add r0, r5, #0
	bl NNS_SndWaveOutAllocChannel
	str r0, [r4]
	cmp r0, #0
	bne _02005646
	mov r0, #0
	pop {r4, r5, r6, pc}
_02005646:
	mov r0, #1
	strb r0, [r6]
	b _0200567A
_0200564C:
	bl GF_AssertFail
	b _0200567A
_02005652:
	ldrb r0, [r4]
	cmp r0, #0
	bne _02005676
	mov r0, #1
	bl GF_SdatGetAttrPtr
	add r6, r0, #0
	add r0, r5, #0
	bl NNS_SndWaveOutAllocChannel
	str r0, [r6]
	cmp r0, #0
	bne _02005670
	mov r0, #0
	pop {r4, r5, r6, pc}
_02005670:
	mov r0, #1
	strb r0, [r4]
	b _0200567A
_02005676:
	bl GF_AssertFail
_0200567A:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005600

	thumb_func_start sub_02005680
sub_02005680: ; 0x02005680
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl GetSoundDataPointer
	mov r0, #0x10
	bl GF_SdatGetAttrPtr
	add r6, r0, #0
	mov r0, #0x11
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	cmp r5, #0xe
	beq _020056A6
	cmp r5, #0xf
	beq _020056A6
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_020056A6:
	cmp r5, #0xe
	bne _020056C8
	ldrb r0, [r6]
	cmp r0, #1
	bne _020056C2
	add r0, r5, #0
	bl sub_020055AC
	ldr r0, [r0]
	bl NNS_SndWaveOutFreeChannel
	mov r0, #0
	strb r0, [r6]
	pop {r4, r5, r6, pc}
_020056C2:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_020056C8:
	ldrb r0, [r4]
	cmp r0, #1
	bne _020056E0
	add r0, r5, #0
	bl sub_020055AC
	ldr r0, [r0]
	bl NNS_SndWaveOutFreeChannel
	mov r0, #0
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_020056E0:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005680

	thumb_func_start sub_020056E8
sub_020056E8: ; 0x020056E8
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r3, r0, #0
	ldr r0, [r3, #0x10]
	add r4, r1, #0
	str r0, [sp]
	ldr r0, [r3, #0x14]
	str r0, [sp, #4]
	ldr r0, [r3, #0x18]
	str r0, [sp, #8]
	ldr r0, [r3, #0x1c]
	str r0, [sp, #0xc]
	ldr r0, [r3, #0x20]
	str r0, [sp, #0x10]
	ldr r0, [r3, #0x24]
	str r0, [sp, #0x14]
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r2, [r3, #8]
	ldr r0, [r0]
	ldr r3, [r3, #0xc]
	bl NNS_SndWaveOutStart
	add r5, r0, #0
	bne _02005720
	add r0, r4, #0
	bl sub_02005680
_02005720:
	add r0, r5, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020056E8

	thumb_func_start sub_02005728
sub_02005728: ; 0x02005728
	push {r3, lr}
	bl sub_020055AC
	ldr r0, [r0]
	bl NNS_SndWaveOutStop
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005728

	thumb_func_start sub_02005738
sub_02005738: ; 0x02005738
	push {r3, lr}
	bl sub_020055AC
	ldr r0, [r0]
	bl NNS_SndWaveOutIsPlaying
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005738

	thumb_func_start sub_02005748
sub_02005748: ; 0x02005748
	push {r4, lr}
	add r4, r1, #0
	cmp r4, #0x7f
	bls _02005752
	mov r4, #0x7f
_02005752:
	bl sub_020055AC
	ldr r0, [r0]
	add r1, r4, #0
	bl NNS_SndWaveOutSetPan
	pop {r4, pc}
	thumb_func_end sub_02005748

	thumb_func_start sub_02005760
sub_02005760: ; 0x02005760
	push {r4, lr}
	add r4, r1, #0
	bl sub_020055AC
	ldr r0, [r0]
	add r1, r4, #0
	bl NNS_SndWaveOutSetSpeed
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005760

	thumb_func_start sub_02005774
sub_02005774: ; 0x02005774
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl sub_020378CC
	cmp r0, #1
	bne _0200579C
	add r0, r4, #0
	bl sub_020055AC
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #5
	bl _s32_div_f
	add r1, r0, #0
	ldr r0, [r4]
	bl NNS_SndWaveOutSetVolume
	pop {r3, r4, r5, pc}
_0200579C:
	add r0, r4, #0
	bl sub_020055AC
	ldr r0, [r0]
	add r1, r5, #0
	bl NNS_SndWaveOutSetVolume
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005774

	thumb_func_start sub_020057AC
sub_020057AC: ; 0x020057AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r6, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	add r5, r3, #0
	bl GetSoundDataPointer
	mov r0, #0x22
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	cmp r5, #0xe
	beq _020057D0
	cmp r5, #0xf
	beq _020057D0
	bl GF_AssertFail
_020057D0:
	add r0, r6, #0
	bl NNS_SndArcGetWaveArcInfo
	add r7, r0, #0
	bne _020057E4
	bl GF_AssertFail
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020057E4:
	ldr r0, [r7]
	lsl r0, r0, #8
	lsr r0, r0, #8
	bl NNS_SndArcGetFileSize
	add r6, r0, #0
	bne _020057FC
	bl GF_AssertFail
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020057FC:
	cmp r5, #0xe
	bne _0200584A
	ldr r0, [sp, #0x48]
	add r1, r6, #0
	bl AllocFromHeap
	str r0, [r4]
	cmp r0, #0
	bne _02005818
	bl GF_AssertFail
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02005818:
	mov r1, #0
	add r2, r6, #0
	bl memset
	ldr r0, [r7]
	ldr r1, [r4]
	lsl r0, r0, #8
	lsr r0, r0, #8
	add r2, r6, #0
	mov r3, #0
	bl NNS_SndArcReadFile
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02005842
	bl GF_AssertFail
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02005842:
	ldr r0, [r4]
	add r1, r6, #0
	bl sub_02005898
_0200584A:
	add r0, r5, #0
	bl sub_020055AC
	mov r1, #0
	str r1, [sp, #0xc]
	str r0, [sp, #8]
	ldr r0, [r4]
	str r0, [sp, #0x10]
	ldr r0, _02005894 ; =0x00003443
	str r1, [sp, #0x14]
	str r0, [sp, #0x20]
	ldr r0, [sp]
	str r1, [sp, #0x18]
	str r0, [sp, #0x24]
	mov r0, #6
	lsl r0, r0, #0xc
	str r0, [sp, #0x28]
	ldr r0, [sp, #4]
	add r1, r5, #0
	str r0, [sp, #0x2c]
	add r0, sp, #8
	str r6, [sp, #0x1c]
	bl sub_020056E8
	add r4, r0, #0
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_02005774
	mov r0, #0xf
	bl GF_SdatGetAttrPtr
	mov r1, #1
	strb r1, [r0]
	add r0, r4, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02005894: .word 0x00003443
	thumb_func_end sub_020057AC

	thumb_func_start sub_02005898
sub_02005898: ; 0x02005898
	push {r3, r4, r5, r6}
	mov r5, #0
	lsr r6, r1, #1
	beq _020058B2
	sub r2, r1, #1
_020058A2:
	sub r3, r2, r5
	ldrb r4, [r0, r5]
	ldrb r1, [r0, r3]
	strb r1, [r0, r5]
	add r5, r5, #1
	strb r4, [r0, r3]
	cmp r5, r6
	blo _020058A2
_020058B2:
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02005898

	thumb_func_start sub_020058B8
sub_020058B8: ; 0x020058B8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl GetSoundDataPointer
	mov r0, #0xf
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	mov r0, #0x22
	bl GF_SdatGetAttrPtr
	add r6, r0, #0
	cmp r5, #0xe
	beq _020058DC
	cmp r5, #0xf
	beq _020058DC
	bl GF_AssertFail
_020058DC:
	add r0, r5, #0
	bl sub_02005728
	ldrb r0, [r4]
	cmp r0, #1
	bne _020058F2
	mov r0, #0
	strb r0, [r4]
	ldr r0, [r6]
	bl FreeToHeap
_020058F2:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020058B8

	thumb_func_start sub_020058F4
sub_020058F4: ; 0x020058F4
	push {r4, lr}
	bl NNS_SndCaptureIsActive
	add r4, r0, #0
	cmp r4, #1
	bne _02005904
	bl sub_02005908
_02005904:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_020058F4

	thumb_func_start sub_02005908
sub_02005908: ; 0x02005908
	ldr r3, _0200590C ; =NNS_SndCaptureGetCaptureType
	bx r3
	.balign 4, 0
_0200590C: .word NNS_SndCaptureGetCaptureType
	thumb_func_end sub_02005908

	thumb_func_start sub_02005910
sub_02005910: ; 0x02005910
	ldr r3, _02005914 ; =NNS_SndCaptureStopReverb
	bx r3
	.balign 4, 0
_02005914: .word NNS_SndCaptureStopReverb
	thumb_func_end sub_02005910

	thumb_func_start GF_SndHandleSetTrackPitch
GF_SndHandleSetTrackPitch: ; 0x02005918
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl GF_GetSoundHandle
	add r1, r5, #0
	add r2, r4, #0
	bl NNS_SndPlayerSetTrackPitch
	pop {r3, r4, r5, pc}
	thumb_func_end GF_SndHandleSetTrackPitch

	thumb_func_start sub_0200592C
sub_0200592C: ; 0x0200592C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl GF_GetPlayerNoBySeq
	bl GF_GetSndHandleByPlayerNo
	add r1, r5, #0
	add r2, r4, #0
	bl GF_SndHandleSetTrackPitch
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0200592C

	thumb_func_start sub_02005944
sub_02005944: ; 0x02005944
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl GF_GetSndHandleByPlayerNo
	add r1, r5, #0
	add r2, r4, #0
	bl GF_SndHandleSetTrackPitch
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005944

	thumb_func_start GF_SndHandleSetTrackPan
GF_SndHandleSetTrackPan: ; 0x02005958
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl GF_GetSoundHandle
	add r1, r5, #0
	add r2, r4, #0
	bl NNS_SndPlayerSetTrackPan
	pop {r3, r4, r5, pc}
	thumb_func_end GF_SndHandleSetTrackPan

	thumb_func_start GF_SndHandleSetTempoRatio
GF_SndHandleSetTempoRatio: ; 0x0200596C
	push {r4, lr}
	add r4, r1, #0
	bl GF_GetSoundHandle
	add r1, r4, #0
	bl NNS_SndPlayerSetTempoRatio
	pop {r4, pc}
	thumb_func_end GF_SndHandleSetTempoRatio

	thumb_func_start GF_SndSetMonoFlag
GF_SndSetMonoFlag: ; 0x0200597C
	push {r4, lr}
	add r4, r0, #0
	bl NNS_SndSetMonoFlag
	ldr r0, _0200598C ; =_021D05E8
	str r4, [r0, #8]
	pop {r4, pc}
	nop
_0200598C: .word _021D05E8
	thumb_func_end GF_SndSetMonoFlag

	thumb_func_start sub_02005990
sub_02005990: ; 0x02005990
	push {r4, lr}
	add r4, r0, #0
	mov r0, #7
	bl GF_SdatGetAttrPtr
	str r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005990

	thumb_func_start sub_020059A0
sub_020059A0: ; 0x020059A0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #8
	bl GF_SdatGetAttrPtr
	str r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020059A0

	thumb_func_start GF_SndGetAfterFadeDelayTimer
GF_SndGetAfterFadeDelayTimer: ; 0x020059B0
	push {r3, lr}
	mov r0, #8
	bl GF_SdatGetAttrPtr
	ldrh r1, [r0]
	cmp r1, #0
	bne _020059C6
	mov r1, #0
	strh r1, [r0]
	add r0, r1, #0
	pop {r3, pc}
_020059C6:
	sub r1, r1, #1
	strh r1, [r0]
	ldrh r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end GF_SndGetAfterFadeDelayTimer

	thumb_func_start Sound_SetMasterVolume
Sound_SetMasterVolume: ; 0x020059D0
	ldr r3, _020059D4 ; =NNS_SndSetMasterVolume
	bx r3
	.balign 4, 0
_020059D4: .word NNS_SndSetMasterVolume
	thumb_func_end Sound_SetMasterVolume

	thumb_func_start sub_020059D8
sub_020059D8: ; 0x020059D8
	ldr r0, _020059DC ; =_021D0620
	bx lr
	.balign 4, 0
_020059DC: .word _021D0620
	thumb_func_end sub_020059D8

	thumb_func_start sub_020059E0
sub_020059E0: ; 0x020059E0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x13
	bl GF_SdatGetAttrPtr
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020059E0

	thumb_func_start GF_NowStartMusicId
GF_NowStartMusicId: ; 0x020059F0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	str r3, [sp]
	ldr r0, [sp, #0x18]
	add r1, r6, #0
	str r0, [sp, #4]
	mov r0, #4
	add r2, r5, #0
	add r3, r4, #0
	bl sub_02005A10
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end GF_NowStartMusicId

	thumb_func_start sub_02005A10
sub_02005A10: ; 0x02005A10
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x16
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	ldr r3, [sp, #8]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, [sp, #0x24]
	add r2, r7, #0
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_02005AB0
	mov r0, #0
	strb r0, [r4]
	mov r0, #5
	bl GF_SndSetState
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02005A10

	thumb_func_start GF_FadeStartMusicId
GF_FadeStartMusicId: ; 0x02005A4C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r0, #0
	str r3, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	add r5, r1, #0
	add r4, r2, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	add r1, r6, #0
	str r0, [sp, #8]
	mov r0, #4
	add r2, r5, #0
	add r3, r4, #0
	bl sub_02005A74
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end GF_FadeStartMusicId

	thumb_func_start sub_02005A74
sub_02005A74: ; 0x02005A74
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #9
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	add r0, sp, #0x10
	ldrb r0, [r0, #0x14]
	ldr r3, [sp, #8]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, [sp, #0x28]
	add r2, r7, #0
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_02005AB0
	ldr r0, [sp, #0x20]
	str r0, [r4]
	mov r0, #6
	bl GF_SndSetState
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02005A74

	thumb_func_start sub_02005AB0
sub_02005AB0: ; 0x02005AB0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	mov r0, #2
	add r5, r1, #0
	add r7, r3, #0
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	mov r0, #0
	add r1, r6, #0
	bl GF_SndStartFadeOutBGM
	mov r0, #0
	bl sub_02004A60
	add r0, r5, #0
	bl GF_SetCurrentPlayingBGM
	add r0, r7, #0
	bl sub_020059A0
	add r0, r5, #0
	bl GF_GetBankInfoBySeqNo
	str r0, [r4]
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	bl sub_020059E0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02005AB0

	thumb_func_start GF_SndSetAllocatableChannelForBGMPlayer
GF_SndSetAllocatableChannelForBGMPlayer: ; 0x02005AEC
	ldr r3, _02005AF4 ; =NNS_SndPlayerSetAllocatableChannel
	add r1, r0, #0
	mov r0, #7
	bx r3
	.balign 4, 0
_02005AF4: .word NNS_SndPlayerSetAllocatableChannel
	thumb_func_end GF_SndSetAllocatableChannelForBGMPlayer

	thumb_func_start sub_02005AF8
sub_02005AF8: ; 0x02005AF8
	push {r3, lr}
	cmp r0, #0
	bne _02005B0C
	ldr r0, _02005B18 ; =0x0000A7FE
	bl GF_SndSetAllocatableChannelForBGMPlayer
	mov r0, #0
	bl sub_02005910
	b _02005B12
_02005B0C:
	ldr r0, _02005B1C ; =0x00003FFF
	bl GF_SndSetAllocatableChannelForBGMPlayer
_02005B12:
	bl sub_020058F4
	pop {r3, pc}
	.balign 4, 0
_02005B18: .word 0x0000A7FE
_02005B1C: .word 0x00003FFF
	thumb_func_end sub_02005AF8

	thumb_func_start sub_02005B20
sub_02005B20: ; 0x02005B20
	push {r3, lr}
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _02005B4A
	mov r0, #0
	bl GF_GetSoundHandle
	bl GF_NNS_SndPlayerGetSeqNo
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02005B4A
	bl sub_02005FD8
	mov r0, #1
	add r1, r0, #0
	bl sub_020053A8
	pop {r3, pc}
_02005B4A:
	bl Sound_Stop
	pop {r3, pc}
	thumb_func_end sub_02005B20

	thumb_func_start GF_SndHandleSetPlayerVolume
GF_SndHandleSetPlayerVolume: ; 0x02005B50
	ldr r3, _02005B54 ; =NNS_SndPlayerSetPlayerVolume
	bx r3
	.balign 4, 0
_02005B54: .word NNS_SndPlayerSetPlayerVolume
	thumb_func_end GF_SndHandleSetPlayerVolume

	thumb_func_start sub_02005B58
sub_02005B58: ; 0x02005B58
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x35
	bl GF_SdatGetAttrPtr
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005B58

	thumb_func_start sub_02005B68
sub_02005B68: ; 0x02005B68
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x36
	bl GF_SdatGetAttrPtr
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005B68

	thumb_func_start sub_02005B78
sub_02005B78: ; 0x02005B78
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bne _02005B86
	bl GF_AssertFail
_02005B86:
	cmp r4, #0xf
	bls _02005B8E
	bl GF_AssertFail
_02005B8E:
	add r0, r5, #0
	bl GF_GetPlayerNoBySeq
	bl GF_GetSndHandleByPlayerNo
	bl GF_GetSoundHandle
	add r1, r4, #0
	add r2, r6, #0
	bl NNS_SndPlayerReadVariable
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005B78

	thumb_func_start sub_02005BA8
sub_02005BA8: ; 0x02005BA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x37
	bl GF_SdatGetAttrPtr
	add r4, r0, #0
	ldrb r1, [r4]
	add r0, r5, #0
	lsl r2, r1, #2
	ldr r1, _02005BE0 ; =_020F5710 + 1
	ldrb r1, [r1, r2]
	bl GF_SetVolumeBySeqNo
	ldrb r2, [r4]
	ldr r1, _02005BE4 ; =0x0000FFFF
	mov r0, #4
	lsl r3, r2, #2
	ldr r2, _02005BE8 ; =_020F5710
	ldrb r2, [r2, r3]
	bl GF_SndHandleSetTrackPitch
	ldrb r0, [r4, #1]
	cmp r0, #8
	blo _02005BDC
	mov r0, #0
	strb r0, [r4, #1]
_02005BDC:
	pop {r3, r4, r5, pc}
	nop
_02005BE0: .word _020F5710 + 1
_02005BE4: .word 0x0000FFFF
_02005BE8: .word _020F5710
	thumb_func_end sub_02005BA8

	thumb_func_start sub_02005BEC
sub_02005BEC: ; 0x02005BEC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x38
	bl GF_SdatGetAttrPtr
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005BEC

	thumb_func_start sub_02005BFC
sub_02005BFC: ; 0x02005BFC
	push {r3, lr}
	mov r0, #0x38
	bl GF_SdatGetAttrPtr
	ldrb r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02005BFC

	thumb_func_start sub_02005C08
sub_02005C08: ; 0x02005C08
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x39
	bl GF_SdatGetAttrPtr
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005C08

	thumb_func_start SoundSys_GetGBSoundsState
SoundSys_GetGBSoundsState: ; 0x02005C18
	push {r3, lr}
	mov r0, #0x39
	bl GF_SdatGetAttrPtr
	ldrb r0, [r0]
	pop {r3, pc}
	thumb_func_end SoundSys_GetGBSoundsState

	thumb_func_start SoundSys_ToggleGBSounds
SoundSys_ToggleGBSounds: ; 0x02005C24
	push {r3, r4, r5, lr}
	bl SoundSys_GetGBSoundsState
	cmp r0, #0
	bne _02005C36
	mov r0, #1
	bl sub_02005C08
	b _02005C3C
_02005C36:
	mov r0, #0
	bl sub_02005C08
_02005C3C:
	bl sub_02004AAC
	cmp r0, #0
	bne _02005C6A
	bl GF_GetCurrentPlayingBGM
	add r4, r0, #0
	bl GF_SndWorkGetGbSoundsVolume
	add r5, r0, #0
	add r0, r4, #0
	bl GBSounds_GetGBSeqNoByDSSeqNo
	cmp r4, r0
	beq _02005C60
	add r0, r4, #0
	bl PlayBGM
_02005C60:
	mov r0, #0
	add r1, r5, #0
	add r2, r0, #0
	bl GF_SndHandleMoveVolume
_02005C6A:
	pop {r3, r4, r5, pc}
	thumb_func_end SoundSys_ToggleGBSounds

	thumb_func_start GBSounds_GetGBSeqNoByDSSeqNo
GBSounds_GetGBSeqNoByDSSeqNo: ; 0x02005C6C
	push {r3, r4}
	ldr r2, _02005C90 ; =_020F5730
	mov r4, #0
_02005C72:
	lsl r3, r4, #2
	ldrh r1, [r2, r3]
	cmp r0, r1
	bne _02005C82
	ldr r0, _02005C94 ; =_020F5730 + 2
	ldrh r0, [r0, r3]
	pop {r3, r4}
	bx lr
_02005C82:
	add r1, r4, #1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r4, #0x88
	blo _02005C72
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02005C90: .word _020F5730
_02005C94: .word _020F5730 + 2
	thumb_func_end GBSounds_GetGBSeqNoByDSSeqNo

	thumb_func_start GBSounds_GetDSSeqNoByGBSeqNo
GBSounds_GetDSSeqNoByGBSeqNo: ; 0x02005C98
	push {r3, r4}
	ldr r2, _02005CBC ; =_020F5730
	mov r4, #0
_02005C9E:
	lsl r3, r4, #2
	add r1, r2, r3
	ldrh r1, [r1, #2]
	cmp r0, r1
	bne _02005CAE
	ldrh r0, [r2, r3]
	pop {r3, r4}
	bx lr
_02005CAE:
	add r1, r4, #1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r4, #0x88
	blo _02005C9E
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02005CBC: .word _020F5730
	thumb_func_end GBSounds_GetDSSeqNoByGBSeqNo

	thumb_func_start GBSounds_SetAllocatableChannels
GBSounds_SetAllocatableChannels: ; 0x02005CC0
	push {r3, lr}
	mov r0, #0 ; HANDLE_FIELD
	bl GF_GetSoundHandle
	ldr r2, _02005CF0 ; =0x0000A7FE
	mov r1, #0xf
	bl NNS_SndPlayerSetTrackAllocatableChannel
	mov r0, #7 ; HANDLE_BGM
	bl GF_GetSoundHandle
	ldr r2, _02005CF0 ; =0x0000A7FE
	mov r1, #0xf
	bl NNS_SndPlayerSetTrackAllocatableChannel
	mov r0, #2 ; HANDLE_ME
	bl GF_GetSoundHandle
	ldr r2, _02005CF0 ; =0x0000A7FE
	mov r1, #0xf
	bl NNS_SndPlayerSetTrackAllocatableChannel
	pop {r3, pc}
	nop
_02005CF0: .word 0x0000A7FE
	thumb_func_end GBSounds_SetAllocatableChannels

	thumb_func_start sub_02005CF4
sub_02005CF4: ; 0x02005CF4
	ldr r1, _02005CFC ; =_021D05E8
	str r0, [r1, #0xc]
	bx lr
	nop
_02005CFC: .word _021D05E8
	thumb_func_end sub_02005CF4

	thumb_func_start sub_02005D00
sub_02005D00: ; 0x02005D00
	ldr r0, _02005D0C ; =_021D05E8
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #4]
	bx lr
	nop
_02005D0C: .word _021D05E8
	thumb_func_end sub_02005D00
