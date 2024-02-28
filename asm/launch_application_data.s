	.include "asm/macros.inc"
	.include "launch_application.inc"
	.include "global.inc"

#ifndef NONMATCHING
	.rodata

_020FA1C4:
	.word sub_020192D0, sub_0201935C, sub_02019490, FS_OVERLAY_ID(OVY_39)
_020FA1D4:
	.word ov105_021E5900, ov105_021E59DC, ov105_021E5B14, FS_OVERLAY_ID(OVY_105)
sOverlayTemplate_MoveRelearner:
	.word MoveRelearner_Init, MoveRelearner_Main, MoveRelearner_Exit, FS_OVERLAY_ID(OVY_68)
sOverlayTemplate_Credits:
	.word Credits_Init, Credits_Main, Credits_Exit, FS_OVERLAY_ID(credits)
sOverlayTemplate_HallOfFameShowcase:
	.word HallOfFameShowcase_Init, HallOfFameShowcase_Main, HallOfFameShowcase_Exit, FS_OVERLAY_ID(OVY_64)
sOverlayTemplate_RegisterHallOfFame:
	.word RegisterHallOfFame_Init, RegisterHallOfFame_Main, RegisterHallOfFame_Exit, FS_OVERLAY_ID(OVY_63)
sOverlayTemplate_GeonetGlobe:
	.word GeonetGlobe_Init, GeonetGlobe_Main, GeonetGlobe_Exit, FS_OVERLAY_ID(OVY_69)
sOverlayTemplate_VoltorbFlip:
	.word VoltorbFlip_Init, VoltorbFlip_Main, VoltorbFlip_Exit, FS_OVERLAY_ID(voltorb_flip)
sOverlayTemplate_PokeathlonCourse:
	.word PokeathlonCourse_Init, PokeathlonCourse_Main, PokeathlonCourse_Exit, FS_OVERLAY_ID(OVY_96)
sOverlayTemplate_TrainerCardSignature:
	.word TrainerCardSignature_Init, TrainerCardSignature_Main, TrainerCardSignature_Exit, FS_OVERLAY_ID(trainer_card_signature)
_020FA264:
	.word ov70_02238430, ov70_022385C0, ov70_022386F4, FS_OVERLAY_ID(OVY_70)
sOverlayTemplate_ChooseStarter:
	.word ChooseStarter_Init, ChooseStarter_Main, ChooseStarter_Exit, FS_OVERLAY_ID(OVY_61)
sOverlayTemplate_Pokedex:
	.word Pokedex_Init, Pokedex_Main, Pokedex_Exit, FS_OVERLAY_ID(OVY_18)
sOverlayTemplate_TrainerCard:
	.word TrainerCard_Init, TrainerCard_Main, TrainerCard_Exit, FS_OVERLAY_ID(trainer_card)
sOverlayTemplate_PalPad:
	.word PalPad_Init, PalPad_Main, PalPad_Exit, FS_OVERLAY_ID(OVY_43)
_020FA2B4:
	.word ov73_021E5900, ov73_021E5AB8, ov73_021E5BAC, FS_OVERLAY_ID(OVY_73)
_020FA2C4:
	.word ov37_021E5900, ov37_021E5A84, ov37_021E5B94, FS_OVERLAY_ID(OVY_37)
sOverlayTemplate_TradeSequence:
	.word TradeSequence_Init, TradeSequence_Main, TradeSequence_Exit, FS_OVERLAY_ID(OVY_71)
_020FA2E4:
	.word ov67_021E5900, ov67_021E5984, ov67_021E5968, FS_OVERLAY_ID(OVY_67)
_020FA2F4:
	.word ov103_021EC940, ov103_021EC988, ov103_021EC9A4, FS_OVERLAY_ID(OVY_103)
sOverlayTemplate_Certificates:
	.word Certificates_Init, Certificates_Main, Certificates_Exit, FS_OVERLAY_ID(certificates_app)
sOverlayTemplate_PokeathlonMedals:
	.word PokeathlonMedals_Init, PokeathlonMedals_Main, PokeathlonMedals_Exit, FS_OVERLAY_ID(OVY_99)
sOverlayTemplate_PokeathlonEventRecord:
	.word PokeathlonEventRecord_Init, PokeathlonEventRecord_Main, PokeathlonEventRecord_Exit, FS_OVERLAY_ID(OVY_99)
sOverlayTemplate_NintendoWifiConnect:
	.word NintendoWfc_Init, NintendoWfc_Main, NintendoWfc_Exit, FS_OVERLAY_ID(OVY_72)
sOverlayTemplate_PokeathlonCourseRecord:
	.word PokeathlonCourseRecord_Init, PokeathlonCourseRecord_Main, PokeathlonCourseRecord_Exit, FS_OVERLAY_ID(OVY_99)
sOverlayTemplate_OptionsMenu:
	.word OptionsMenu_Init, OptionsMenu_Main, OptionsMenu_Exit, FS_OVERLAY_ID(options_app)
sOverlayTemplate_BugContestSwapMon:
	.word BugContestSwapMon_Init, BugContestSwapMon_Main, BugContestSwapMon_Exit, FS_OVERLAY_ID(OVY_111)
sOverlayTemplate_ApricornBox:
	.word ApricornBox_Init, ApricornBox_Main, ApricornBox_Exit, FS_OVERLAY_ID(OVY_58)
sOverlayTemplate_BerryPots:
	.word BerryPots_Init, BerryPots_Main, BerryPots_Exit, FS_OVERLAY_ID(OVY_16)
gOverlayTemplate_UnownReport:
	.word UnownReport_Init, UnownReport_Main, UnownReport_Exit, FS_OVERLAY_ID(OVY_113)
sOverlayTemplate_AlphPuzzle:
	.word AlphPuzzle_Init, AlphPuzzle_Main, AlphPuzzle_Exit, FS_OVERLAY_ID(OVY_110)
sOverlayTemplate_PhotoAlbum:
	.word PhotoAlbum_Init, PhotoAlbum_Main, PhotoAlbum_Exit, FS_OVERLAY_ID(OVY_109)
sOverlayTemplate_SafariDecoration:
	.word SafariDecoration_Init, SafariDecoration_Main, SafariDecoration_Exit, FS_OVERLAY_ID(OVY_108)
sOverlayTemplate_SafariAreaCustomizer:
	.word SafariAreaCustomizer_Init, SafariAreaCustomizer_Main, SafariAreaCustomizer_Exit, FS_OVERLAY_ID(OVY_108)
sOverlayTemplate_TownMap:
	.word TownMap_Init, TownMap_Main, TownMap_Exit, FS_OVERLAY_ID(OVY_101)
sOverlayTemplate_Phone:
	.word Phone_Init, Phone_Main, Phone_Exit, FS_OVERLAY_ID(OVY_100)
sOverlayTemplate_EasyChat:
	.word EasyChat_Init, EasyChat_Main, EasyChat_Exit, FS_OVERLAY_ID(OVY_102)
sOverlayTemplate_PCBox:
	.word PCBox_Init, PCBox_Main, PCBox_Exit, FS_OVERLAY_ID(OVY_14)
sOverlayTemplate_PokeathlonUnkApp:
	.word ov99_021E677C, ov99_021E6888, ov99_021E6840, FS_OVERLAY_ID(OVY_99)
_020FA434:
	.word ov55_UnkApp_Init, ov55_UnkApp_Main, ov55_UnkApp_Exit, FS_OVERLAY_ID(OVY_55)
_020FA444:
	.word ov73_021E7E4C, ov73_021E7FB8, ov73_021E808C, FS_OVERLAY_ID(OVY_72)
_020FA454:
	.word ov104_021E5900, ov104_021E59E4, ov104_021E5B14, FS_OVERLAY_ID(OVY_104)
sOverlayTemplate_Bag:
	.word Bag_Init, Bag_Main, Bag_Exit, FS_OVERLAY_ID(OVY_15)
sOverlayTemplate_LegendaryCinematic:
	.word LegendaryCinematic_Init, LegendaryCinematic_Main, LegendaryCinematic_Exit, FS_OVERLAY_ID(OVY_106)
	.public gOverlayTemplate_Battle
gOverlayTemplate_Battle:
	.word Battle_Init, Battle_Main, Battle_Exit, FS_OVERLAY_ID(OVY_12)
_020FA494:
	.word ov121_021E5900, ov121_021E590C, ov121_021E59BC, FS_OVERLAY_ID(OVY_121)

	.data

sPockets:
	.word 0x00000000
sOverlayTemplate_ScratchOffCards:
	.word ScratchOffCards_Init, ScratchOffCards_Main, ScratchOffCards_Exit, FS_OVERLAY_ID(OVY_87)
sOverlayTemplate_WirelessTradeSelectMon:
	.word WirelessTradeSelectMon_Init, WirelessTradeSelectMon_Main, WirelessTradeSelectMon_Exit, FS_OVERLAY_ID(OVY_65)
sOverlayTemplate_AccessoryPortrait:
	.word AccessoryPortrait_Init, AccessoryPortrait_Main, AccessoryPortrait_Exit, FS_OVERLAY_ID(OVY_41)
_0210F9AC:
	.word ov41_02246DE0, ov41_02246F08, ov41_02247150, FS_OVERLAY_ID(OVY_41)
_0210F9BC:
	.word ov86_021E5900, ov86_021E5A40, ov86_021E5AA4, FS_OVERLAY_ID(OVY_86)
#endif //NONMATCHING
