#include "global.h"
#include "alph_puzzle.h"
#include "certificates_app.h"
#include "choose_starter_app.h"
#include "field/launch_application.h"
#include "field/launch_application_data.h"
#include "overlay_manager.h"
#include "overlay_trainer_card.h"
#include "overlay_trainer_card_signature.h"
#include "overlay_14.h"
#include "overlay_15.h"
#include "overlay_16.h"
#include "overlay_18.h"
#include "overlay_41.h"
#include "overlay_43.h"
#include "overlay_37.h"
#include "overlay_54.h"
#include "overlay_55.h"
#include "overlay_58.h"
#include "overlay_63.h"
#include "overlay_64.h"
#include "overlay_65.h"
#include "overlay_67.h"
#include "overlay_68.h"
#include "overlay_69.h"
#include "overlay_70.h"
#include "overlay_71.h"
#include "overlay_72.h"
#include "overlay_73.h"
#include "overlay_86.h"
#include "overlay_87.h"
#include "overlay_96.h"
#include "overlay_99.h"
#include "overlay_100.h"
#include "overlay_101.h"
#include "overlay_102.h"
#include "overlay_103.h"
#include "overlay_104.h"
#include "overlay_105.h"
#include "overlay_108.h"
#include "overlay_109.h"
#include "overlay_111.h"
#include "overlay_113.h"
#include "overlay_121.h"
#include "unk_020192D0.h"
#include "unk_02097B78.h"
#include "voltorb_flip/voltorb_flip.h"

FS_EXTERN_OVERLAY(certificates_app);
FS_EXTERN_OVERLAY(credits);
FS_EXTERN_OVERLAY(trainer_card);
FS_EXTERN_OVERLAY(trainer_card_signature);
FS_EXTERN_OVERLAY(voltorb_flip);
FS_EXTERN_OVERLAY(OVY_12);
FS_EXTERN_OVERLAY(OVY_14);
FS_EXTERN_OVERLAY(OVY_15);
FS_EXTERN_OVERLAY(OVY_16);
FS_EXTERN_OVERLAY(OVY_18);
FS_EXTERN_OVERLAY(OVY_37);
FS_EXTERN_OVERLAY(OVY_39);
FS_EXTERN_OVERLAY(OVY_41);
FS_EXTERN_OVERLAY(OVY_43);
FS_EXTERN_OVERLAY(OVY_54);
FS_EXTERN_OVERLAY(OVY_55);
FS_EXTERN_OVERLAY(OVY_58);
FS_EXTERN_OVERLAY(OVY_61);
FS_EXTERN_OVERLAY(OVY_63);
FS_EXTERN_OVERLAY(OVY_64);
FS_EXTERN_OVERLAY(OVY_65);
FS_EXTERN_OVERLAY(OVY_67);
FS_EXTERN_OVERLAY(OVY_68);
FS_EXTERN_OVERLAY(OVY_69);
FS_EXTERN_OVERLAY(OVY_70);
FS_EXTERN_OVERLAY(OVY_71);
FS_EXTERN_OVERLAY(OVY_72);
FS_EXTERN_OVERLAY(OVY_73);
FS_EXTERN_OVERLAY(OVY_86);
FS_EXTERN_OVERLAY(OVY_87);
FS_EXTERN_OVERLAY(OVY_96);
FS_EXTERN_OVERLAY(OVY_99);
FS_EXTERN_OVERLAY(OVY_100);
FS_EXTERN_OVERLAY(OVY_101);
FS_EXTERN_OVERLAY(OVY_102);
FS_EXTERN_OVERLAY(OVY_103);
FS_EXTERN_OVERLAY(OVY_104);
FS_EXTERN_OVERLAY(OVY_105);
FS_EXTERN_OVERLAY(OVY_106);
FS_EXTERN_OVERLAY(OVY_108);
FS_EXTERN_OVERLAY(OVY_109);
FS_EXTERN_OVERLAY(OVY_110);
FS_EXTERN_OVERLAY(OVY_111);
FS_EXTERN_OVERLAY(OVY_113);
FS_EXTERN_OVERLAY(OVY_121);

// _020FA444 is not referenced so the linker deadstrips it.
// HACK: We can force the linker to include this symbol with -force-active.
#ifdef NONMATCHING
const OVY_MGR_TEMPLATE _020FA1C4 =
    { sub_020192D0, sub_0201935C, sub_02019490, FS_OVERLAY_ID(OVY_39) };
const OVY_MGR_TEMPLATE _020FA1D4 =
    { ov105_021E5900, ov105_021E59DC, ov105_021E5B14, FS_OVERLAY_ID(OVY_105) };
const OVY_MGR_TEMPLATE sOvyTemplate_MoveRelearner =
    { MoveRelearner_OvyInit, MoveRelearner_OvyExec, MoveRelearner_OvyExit, FS_OVERLAY_ID(OVY_68) };
const OVY_MGR_TEMPLATE sOvyTemplate_Credits =
    { Credits_OvyInit, Credits_OvyExec, Credits_OvyExit, FS_OVERLAY_ID(credits) };
const OVY_MGR_TEMPLATE sOvyTemplate_HallOfFameCongrats =
    { HallOfFameCongrats_OvyInit, HallOfFameCongrats_OvyExec, HallOfFameCongrats_OvyExit, FS_OVERLAY_ID(OVY_64) };
const OVY_MGR_TEMPLATE _020FA214 =
    { ov63_0221BE20, ov63_0221BF88, ov63_0221BF28, FS_OVERLAY_ID(OVY_63) };
const OVY_MGR_TEMPLATE sOvyTemplate_GeonetGlobe =
    { GeonetGlobe_OvyInit, GeonetGlobe_OvyExec, GeonetGlobe_OvyExit, FS_OVERLAY_ID(OVY_69) };
const OVY_MGR_TEMPLATE sOvyTemplate_VoltorbFlip =
    { VoltorbFlip_OvyInit, VoltorbFlip_OvyExec, VoltorbFlip_OvyExit, FS_OVERLAY_ID(voltorb_flip) };
const OVY_MGR_TEMPLATE sOvyTemplate_PokeathlonCourse =
    { PokeathlonCourse_OvyInit, PokeathlonCourse_OvyExec, PokeathlonCourse_OvyExit, FS_OVERLAY_ID(OVY_96) };
const OVY_MGR_TEMPLATE sOvyTemplate_TrainerCardSignature =
    { TrainerCardSignature_OvyInit, TrainerCardSignature_OvyExec, TrainerCardSignature_OvyExit, FS_OVERLAY_ID(trainer_card_signature) };
const OVY_MGR_TEMPLATE _020FA264 =
    { ov70_02238430, ov70_022385C0, ov70_022386F4, FS_OVERLAY_ID(OVY_70) };
const OVY_MGR_TEMPLATE sOvyTemplate_ChooseStarter =
    { ChooseStarter_OvyInit, ChooseStarter_OvyExec, ChooseStarter_OvyExit, FS_OVERLAY_ID(OVY_61) };
const OVY_MGR_TEMPLATE sOvyTemplate_Pokedex =
    { Pokedex_OvyInit, Pokedex_OvyExec, Pokedex_OvyExit, FS_OVERLAY_ID(OVY_18) };
const OVY_MGR_TEMPLATE sOvyTemplate_TrainerCard =
    { TrainerCard_OvyInit, TrainerCard_OvyExec, TrainerCard_OvyExit, FS_OVERLAY_ID(trainer_card) };
const OVY_MGR_TEMPLATE sOvyTemplate_PalPad =
    { PalPad_OvyInit, PalPad_OvyExec, PalPad_OvyExit, FS_OVERLAY_ID(OVY_43) };
const OVY_MGR_TEMPLATE _020FA2B4 =
    { ov73_021E5900, ov73_021E5AB8, ov73_021E5BAC, FS_OVERLAY_ID(OVY_73) };
const OVY_MGR_TEMPLATE _020FA2C4 =
    { ov37_021E5900, ov37_021E5A84, ov37_021E5B94, FS_OVERLAY_ID(OVY_37) };
const OVY_MGR_TEMPLATE sOvyTemplate_TradeSequence =
    { TradeSequence_OvyInit, TradeSequence_OvyExec, TradeSequence_OvyExit, FS_OVERLAY_ID(OVY_71) };
const OVY_MGR_TEMPLATE _020FA2E4 =
    { ov67_021E5900, ov67_021E5984, ov67_021E5968, FS_OVERLAY_ID(OVY_67) };
const OVY_MGR_TEMPLATE _020FA2F4 =
    { ov103_021EC940, ov103_021EC988, ov103_021EC9A4, FS_OVERLAY_ID(OVY_103) };
const OVY_MGR_TEMPLATE sOvyTemplate_Certificates =
    { Certificates_OvyInit, Certificates_OvyExec, Certificates_OvyExit, FS_OVERLAY_ID(certificates_app) };
const OVY_MGR_TEMPLATE sOvyTemplate_PokeathlonMedals =
    { PokeathlonMedals_OvyInit, PokeathlonMedals_OvyExec, PokeathlonMedals_OvyExit, FS_OVERLAY_ID(OVY_99) };
const OVY_MGR_TEMPLATE sOvyTemplate_PokeathlonEventRecord =
    { PokeathlonEventRecord_OvyInit, PokeathlonEventRecord_OvyExec, PokeathlonEventRecord_OvyExit, FS_OVERLAY_ID(OVY_99) };
const OVY_MGR_TEMPLATE sOvyTemplate_NintendoWifiConnect =
    { NintendoWifiConnect_OvyInit, NintendoWifiConnect_OvyExec, NintendoWifiConnect_OvyExit, FS_OVERLAY_ID(OVY_72) };
const OVY_MGR_TEMPLATE sOvyTemplate_PokeathlonCourseRecord =
    { PokeathlonCourseRecord_OvyInit, PokeathlonCourseRecord_OvyExec, PokeathlonCourseRecord_OvyExit, FS_OVERLAY_ID(OVY_99) };
const OVY_MGR_TEMPLATE sOvyTemplate_OptionsMenu =
    { OptionsMenu_OvyInit, OptionsMenu_OvyExec, OptionsMenu_OvyExit, FS_OVERLAY_ID(OVY_54) };
const OVY_MGR_TEMPLATE sOvyTemplate_BugContestSwapMon =
    { BugContestSwapMon_OvyInit, BugContestSwapMon_OvyExec, BugContestSwapMon_OvyExit, FS_OVERLAY_ID(OVY_111) };
const OVY_MGR_TEMPLATE sOvyTemplate_ApricornBox =
    { ApricornBox_OvyInit, ApricornBox_OvyExec, ApricornBox_OvyExit, FS_OVERLAY_ID(OVY_58) };
const OVY_MGR_TEMPLATE sOvyTemplate_BerryPots =
    { BerryPots_OvyInit, BerryPots_OvyExec, BerryPots_OvyExit, FS_OVERLAY_ID(OVY_16) };
const OVY_MGR_TEMPLATE gOvyTemplate_UnownReport =
    { UnownReport_OvyInit, UnownReport_OvyExec, UnownReport_OvyExit, FS_OVERLAY_ID(OVY_113) };
const OVY_MGR_TEMPLATE sOvyTemplate_AlphPuzzle =
    { AlphPuzzle_OvyInit, AlphPuzzle_OvyExec, AlphPuzzle_OvyExit, FS_OVERLAY_ID(OVY_110) };
const OVY_MGR_TEMPLATE sOvyTemplate_PhotoAlbum =
    { PhotoAlbum_OvyInit, PhotoAlbum_OvyExec, PhotoAlbum_OvyExit, FS_OVERLAY_ID(OVY_109) };
const OVY_MGR_TEMPLATE sOvyTemplate_SafariDecoration =
    { SafariDecoration_OvyInit, SafariDecoration_OvyExec, SafariDecoration_OvyExit, FS_OVERLAY_ID(OVY_108) };
const OVY_MGR_TEMPLATE sOvyTemplate_SafariAreaCustomizer =
    { SafariAreaCustomizer_OvyInit, SafariAreaCustomizer_OvyExec, SafariAreaCustomizer_OvyExit, FS_OVERLAY_ID(OVY_108) };
const OVY_MGR_TEMPLATE sOvyTemplate_TownMap =
    { TownMap_OvyInit, TownMap_OvyExec, TownMap_OvyExit, FS_OVERLAY_ID(OVY_101) };
const OVY_MGR_TEMPLATE sOvyTemplate_Phone =
    { Phone_OvyInit, Phone_OvyExec, Phone_OvyExit, FS_OVERLAY_ID(OVY_100) };
const OVY_MGR_TEMPLATE sOvyTemplate_EasyChat =
    { EasyChat_OvyInit, EasyChat_OvyExec, EasyChat_OvyExit, FS_OVERLAY_ID(OVY_102) };
const OVY_MGR_TEMPLATE sOvyTemplate_PCBox =
    { PCBox_OvyInit, PCBox_OvyExec, PCBox_OvyExit, FS_OVERLAY_ID(OVY_14) };
const OVY_MGR_TEMPLATE sOvyTemplate_PokeathlonUnkApp =
    { ov99_021E677C, ov99_021E6888, ov99_021E6840, FS_OVERLAY_ID(OVY_99) };
const OVY_MGR_TEMPLATE _020FA434 =
    { ov55_UnkApp_Init, ov55_UnkApp_Main, ov55_UnkApp_Exit, FS_OVERLAY_ID(OVY_55) };
const OVY_MGR_TEMPLATE _020FA444 =
    { ov73_021E7E4C, ov73_021E7FB8, ov73_021E808C, FS_OVERLAY_ID(OVY_72) };
const OVY_MGR_TEMPLATE _020FA454 =
    { ov104_021E5900, ov104_021E59E4, ov104_021E5B14, FS_OVERLAY_ID(OVY_104) };
const OVY_MGR_TEMPLATE sOvyTemplate_Bag =
    { Bag_OvyInit, Bag_OvyExec, Bag_OvyExit, FS_OVERLAY_ID(OVY_15) };
const OVY_MGR_TEMPLATE sOvyTemplate_LegendaryCinematic =
    { LegendaryCinematic_OvyInit, LegendaryCinematic_OvyExec, LegendaryCinematic_OvyExit, FS_OVERLAY_ID(OVY_106) };
const OVY_MGR_TEMPLATE gOvyTemplate_Battle =
    { Battle_OvyInit, Battle_OvyExec, Battle_OvyExit, FS_OVERLAY_ID(OVY_12) };
const OVY_MGR_TEMPLATE _020FA494 =
    { ov121_021E5900, ov121_021E590C, ov121_021E59BC, FS_OVERLAY_ID(OVY_121) };

const u8 *sPockets = NULL;
OVY_MGR_TEMPLATE sOvyTemplate_ScratchOffCards =
    { ScratchOffCards_OvyInit, ScratchOffCards_OvyExec, ScratchOffCards_OvyExit, FS_OVERLAY_ID(OVY_87) };
OVY_MGR_TEMPLATE sOvyTemplate_WirelessTradeSelectMon =
    { WirelessTradeSelectMon_OvyInit, WirelessTradeSelectMon_OvyExec, WirelessTradeSelectMon_OvyExit, FS_OVERLAY_ID(OVY_65) };
OVY_MGR_TEMPLATE sOvyTemplate_AccessoryPortrait =
    { AccessoryPortrait_OvyInit, AccessoryPortrait_OvyExec, AccessoryPortrait_OvyExit, FS_OVERLAY_ID(OVY_41) };
OVY_MGR_TEMPLATE _0210F9AC =
    { ov41_02246DE0, ov41_02246F08, ov41_02247150, FS_OVERLAY_ID(OVY_41) };
OVY_MGR_TEMPLATE _0210F9BC =
    { ov86_021E5900, ov86_021E5A40, ov86_021E5AA4, FS_OVERLAY_ID(OVY_86) };
#endif //NONMATCHING
