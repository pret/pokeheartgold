	.include "asm/macros.inc"
	.include "launch_application.inc"
	.include "global.inc"

	.public Battle_OvyInit
	.public Battle_OvyExec
	.public Battle_OvyExit
	.public _020FA0B0

	.public _020FA17C
	.public _020FA190
	.public sOvyTemplate_Bag
	.public sAllPockets
	.public sItemPocket
	.public sPockets
	.public sBerryPocket
	.public _020FA1B0
	.public _020FA1A8
	.public sOvyTemplate_PCBox
	.public sOvyTemplate_EasyChat
	.public sOvyTemplate_EasyChat
	.public sOvyTemplate_Phone
	.public sOvyTemplate_TownMap
	.public sOvyTemplate_SafariAreaCustomizer
	.public sOvyTemplate_SafariDecoration
	.public sOvyTemplate_PhotoAlbum
	.public sOvyTemplate_AlphPuzzle
	.public gOvyTemplate_UnownReport
	.public sOvyTemplate_BerryPots
	.public sOvyTemplate_ApricornBox
	.public sOvyTemplate_BugContestSwapMon
	.public sOvyTemplate_OptionsMenu
	.public sOvyTemplate_PokeathlonCourseRecord
	.public sOvyTemplate_PokeathlonMedals
	.public sOvyTemplate_PokeathlonEventRecord
	.public sOvyTemplate_PokeathlonUnkApp
	.public _020FA434
	.public _020FA2F4
	.public _020FA2E4
	.public _0210F9AC
	.public sOvyTemplate_AccessoryPortrait
	.public sOvyTemplate_WirelessTradeSelectMon
	.public sOvyTemplate_TradeSequence
	.public _020FA2C4
	.public _020FA2B4
	.public sOvyTemplate_PalPad
	.public sOvyTemplate_TrainerCard
	.public sOvyTemplate_Pokedex
    .public sOvyTemplate_ChooseStarter
    .public sOvyTemplate_TrainerCardSignature
    .public _020FA264
    .public sOvyTemplate_NintendoWifiConnect
    .public sOvyTemplate_GeonetGlobe
    .public _020FA214
    .public sOvyTemplate_HallOfFameCongrats
    .public sOvyTemplate_Credits
    .public sOvyTemplate_MoveRelearner
    .public sOvyTemplate_VoltorbFlip
    .public sOvyTemplate_Certificates
    .public _0210F9BC
    .public sOvyTemplate_ScratchOffCards
    .public _020FA1C4
    .public sOvyTemplate_PokeathlonCourse
    .public _020FA454
    .public _020FA1D4
    .public sOvyTemplate_LegendaryCinematic
    .public _020FA494

#ifndef NONMATCHING
	.rodata

_020FA1C4:
	.word sub_020192D0, sub_0201935C, sub_02019490, FS_OVERLAY_ID(OVY_39)
_020FA1D4:
	.word ov105_021E5900, ov105_021E59DC, ov105_021E5B14, FS_OVERLAY_ID(OVY_105)
sOvyTemplate_MoveRelearner:
	.word MoveRelearner_OvyInit, MoveRelearner_OvyExec, MoveRelearner_OvyExit, FS_OVERLAY_ID(OVY_68)
sOvyTemplate_Credits:
	.word Credits_OvyInit, Credits_OvyExec, Credits_OvyExit, FS_OVERLAY_ID(credits)
sOvyTemplate_HallOfFameCongrats:
	.word HallOfFameCongrats_OvyInit, HallOfFameCongrats_OvyExec, HallOfFameCongrats_OvyExit, FS_OVERLAY_ID(OVY_64)
_020FA214:
	.word ov63_0221BE20, ov63_0221BF88, ov63_0221BF28, FS_OVERLAY_ID(OVY_63)
sOvyTemplate_GeonetGlobe:
	.word GeonetGlobe_OvyInit, GeonetGlobe_OvyExec, GeonetGlobe_OvyExit, FS_OVERLAY_ID(OVY_69)
sOvyTemplate_VoltorbFlip:
	.word VoltorbFlip_OvyInit, VoltorbFlip_OvyExec, VoltorbFlip_OvyExit, FS_OVERLAY_ID(voltorb_flip)
sOvyTemplate_PokeathlonCourse:
	.word PokeathlonCourse_OvyInit, PokeathlonCourse_OvyExec, PokeathlonCourse_OvyExit, FS_OVERLAY_ID(OVY_96)
sOvyTemplate_TrainerCardSignature:
	.word TrainerCardSignature_OvyInit, TrainerCardSignature_OvyExec, TrainerCardSignature_OvyExit, FS_OVERLAY_ID(trainer_card_signature)
_020FA264:
	.word ov70_02238430, ov70_022385C0, ov70_022386F4, FS_OVERLAY_ID(OVY_70)
sOvyTemplate_ChooseStarter:
	.word ChooseStarter_OvyInit, ChooseStarter_OvyExec, ChooseStarter_OvyExit, FS_OVERLAY_ID(OVY_61)
sOvyTemplate_Pokedex:
	.word Pokedex_OvyInit, Pokedex_OvyExec, Pokedex_OvyExit, FS_OVERLAY_ID(OVY_18)
sOvyTemplate_TrainerCard:
	.word TrainerCard_OvyInit, TrainerCard_OvyExec, TrainerCard_OvyExit, FS_OVERLAY_ID(trainer_card)
sOvyTemplate_PalPad:
	.word PalPad_OvyInit, PalPad_OvyExec, PalPad_OvyExit, FS_OVERLAY_ID(OVY_43)
_020FA2B4:
	.word ov73_021E5900, ov73_021E5AB8, ov73_021E5BAC, FS_OVERLAY_ID(OVY_73)
_020FA2C4:
	.word ov37_021E5900, ov37_021E5A84, ov37_021E5B94, FS_OVERLAY_ID(OVY_37)
sOvyTemplate_TradeSequence:
	.word TradeSequence_OvyInit, TradeSequence_OvyExec, TradeSequence_OvyExit, FS_OVERLAY_ID(OVY_71)
_020FA2E4:
	.word ov67_021E5900, ov67_021E5984, ov67_021E5968, FS_OVERLAY_ID(OVY_67)
_020FA2F4:
	.word ov103_021EC940, ov103_021EC988, ov103_021EC9A4, FS_OVERLAY_ID(OVY_103)
sOvyTemplate_Certificates:
	.word Certificates_OvyInit, Certificates_OvyExec, Certificates_OvyExit, FS_OVERLAY_ID(certificates_app)
sOvyTemplate_PokeathlonMedals:
	.word PokeathlonMedals_OvyInit, PokeathlonMedals_OvyExec, PokeathlonMedals_OvyExit, FS_OVERLAY_ID(OVY_99)
sOvyTemplate_PokeathlonEventRecord:
	.word PokeathlonEventRecord_OvyInit, PokeathlonEventRecord_OvyExec, PokeathlonEventRecord_OvyExit, FS_OVERLAY_ID(OVY_99)
sOvyTemplate_NintendoWifiConnect:
	.word NintendoWifiConnect_OvyInit, NintendoWifiConnect_OvyExec, NintendoWifiConnect_OvyExit, FS_OVERLAY_ID(OVY_72)
sOvyTemplate_PokeathlonCourseRecord:
	.word PokeathlonCourseRecord_OvyInit, PokeathlonCourseRecord_OvyExec, PokeathlonCourseRecord_OvyExit, FS_OVERLAY_ID(OVY_99)
sOvyTemplate_OptionsMenu:
	.word OptionsMenu_OvyInit, OptionsMenu_OvyExec, OptionsMenu_OvyExit, FS_OVERLAY_ID(OVY_54)
sOvyTemplate_BugContestSwapMon:
	.word BugContestSwapMon_OvyInit, BugContestSwapMon_OvyExec, BugContestSwapMon_OvyExit, FS_OVERLAY_ID(OVY_111)
sOvyTemplate_ApricornBox:
	.word ApricornBox_OvyInit, ApricornBox_OvyExec, ApricornBox_OvyExit, FS_OVERLAY_ID(OVY_58)
sOvyTemplate_BerryPots:
	.word BerryPots_OvyInit, BerryPots_OvyExec, BerryPots_OvyExit, FS_OVERLAY_ID(OVY_16)
gOvyTemplate_UnownReport:
	.word UnownReport_OvyInit, UnownReport_OvyExec, UnownReport_OvyExit, FS_OVERLAY_ID(OVY_113)
sOvyTemplate_AlphPuzzle:
	.word AlphPuzzle_OvyInit, AlphPuzzle_OvyExec, AlphPuzzle_OvyExit, FS_OVERLAY_ID(OVY_110)
sOvyTemplate_PhotoAlbum:
	.word PhotoAlbum_OvyInit, PhotoAlbum_OvyExec, PhotoAlbum_OvyExit, FS_OVERLAY_ID(OVY_109)
sOvyTemplate_SafariDecoration:
	.word SafariDecoration_OvyInit, SafariDecoration_OvyExec, SafariDecoration_OvyExit, FS_OVERLAY_ID(OVY_108)
sOvyTemplate_SafariAreaCustomizer:
	.word SafariAreaCustomizer_OvyInit, SafariAreaCustomizer_OvyExec, SafariAreaCustomizer_OvyExit, FS_OVERLAY_ID(OVY_108)
sOvyTemplate_TownMap:
	.word TownMap_OvyInit, TownMap_OvyExec, TownMap_OvyExit, FS_OVERLAY_ID(OVY_101)
sOvyTemplate_Phone:
	.word Phone_OvyInit, Phone_OvyExec, Phone_OvyExit, FS_OVERLAY_ID(OVY_100)
sOvyTemplate_EasyChat:
	.word EasyChat_OvyInit, EasyChat_OvyExec, EasyChat_OvyExit, FS_OVERLAY_ID(OVY_102)
sOvyTemplate_PCBox:
	.word PCBox_OvyInit, PCBox_OvyExec, PCBox_OvyExit, FS_OVERLAY_ID(OVY_14)
sOvyTemplate_PokeathlonUnkApp:
	.word ov99_021E677C, ov99_021E6888, ov99_021E6840, FS_OVERLAY_ID(OVY_99)
_020FA434:
	.word ov55_UnkApp_Init, ov55_UnkApp_Main, ov55_UnkApp_Exit, FS_OVERLAY_ID(OVY_55)
_020FA444:
	.word ov73_021E7E4C, ov73_021E7FB8, ov73_021E808C, FS_OVERLAY_ID(OVY_72)
_020FA454:
	.word ov104_021E5900, ov104_021E59E4, ov104_021E5B14, FS_OVERLAY_ID(OVY_104)
sOvyTemplate_Bag:
	.word Bag_OvyInit, Bag_OvyExec, Bag_OvyExit, FS_OVERLAY_ID(OVY_15)
sOvyTemplate_LegendaryCinematic:
	.word LegendaryCinematic_OvyInit, LegendaryCinematic_OvyExec, LegendaryCinematic_OvyExit, FS_OVERLAY_ID(OVY_106)
	.public gOvyTemplate_Battle
gOvyTemplate_Battle:
	.word Battle_OvyInit, Battle_OvyExec, Battle_OvyExit, FS_OVERLAY_ID(OVY_12)
_020FA494:
	.word ov121_021E5900, ov121_021E590C, ov121_021E59BC, FS_OVERLAY_ID(OVY_121)

	.data

sPockets:
	.word 0x00000000
sOvyTemplate_ScratchOffCards:
	.word ScratchOffCards_OvyInit, ScratchOffCards_OvyExec, ScratchOffCards_OvyExit, FS_OVERLAY_ID(OVY_87)
sOvyTemplate_WirelessTradeSelectMon:
	.word WirelessTradeSelectMon_OvyInit, WirelessTradeSelectMon_OvyExec, WirelessTradeSelectMon_OvyExit, FS_OVERLAY_ID(OVY_65)
sOvyTemplate_AccessoryPortrait:
	.word AccessoryPortrait_OvyInit, AccessoryPortrait_OvyExec, AccessoryPortrait_OvyExit, FS_OVERLAY_ID(OVY_41)
_0210F9AC:
	.word ov41_02246DE0, ov41_02246F08, ov41_02247150, FS_OVERLAY_ID(OVY_41)
_0210F9BC:
	.word ov86_021E5900, ov86_021E5A40, ov86_021E5AA4, FS_OVERLAY_ID(OVY_86)
#endif //NONMATCHING
