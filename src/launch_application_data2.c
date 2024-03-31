#include "global.h"
#include "alph_puzzle.h"
#include "certificates_app.h"
#include "choose_starter_app.h"
#include "launch_application.h"
#include "launch_application_data.h"
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
#include "register_hall_of_fame.h"
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
FS_EXTERN_OVERLAY(options_app);
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
//
// SOLUTIONS:
//  - [Proper] Create a new dummy routine that receives _020FA444's data as
//    const (see `MATH_CalcCRC16CCITT()` in math_util.c).
//  - Force the linker to include the symbol with -force_active.
#ifdef NONMATCHING
const OVY_MGR_TEMPLATE _020FA1C4 =
    { sub_020192D0, sub_0201935C, sub_02019490, FS_OVERLAY_ID(OVY_39) };
const OVY_MGR_TEMPLATE _020FA1D4 =
    { ov105_021E5900, ov105_021E59DC, ov105_021E5B14, FS_OVERLAY_ID(OVY_105) };
const OVY_MGR_TEMPLATE sOverlayTemplate_MoveRelearner =
    { MoveRelearner_Init, MoveRelearner_Main, MoveRelearner_Exit, FS_OVERLAY_ID(OVY_68) };
const OVY_MGR_TEMPLATE sOverlayTemplate_Credits =
    { Credits_Init, Credits_Main, Credits_Exit, FS_OVERLAY_ID(credits) };
const OVY_MGR_TEMPLATE sOverlayTemplate_HallOfFameShowcase =
    { HallOfFameShowcase_Init, HallOfFameShowcase_Main, HallOfFameShowcase_Exit, FS_OVERLAY_ID(OVY_64) };
const OVY_MGR_TEMPLATE sOverlayTemplate_RegisterHallOfFame =
    { RegisterHallOfFame_Init, RegisterHallOfFame_Main, RegisterHallOfFame_Exit, FS_OVERLAY_ID(OVY_63) };
const OVY_MGR_TEMPLATE sOverlayTemplate_GeonetGlobe =
    { GeonetGlobe_Init, GeonetGlobe_Main, GeonetGlobe_Exit, FS_OVERLAY_ID(OVY_69) };
const OVY_MGR_TEMPLATE sOverlayTemplate_VoltorbFlip =
    { VoltorbFlip_Init, VoltorbFlip_Main, VoltorbFlip_Exit, FS_OVERLAY_ID(voltorb_flip) };
const OVY_MGR_TEMPLATE sOverlayTemplate_PokeathlonCourse =
    { PokeathlonCourse_Init, PokeathlonCourse_Main, PokeathlonCourse_Exit, FS_OVERLAY_ID(OVY_96) };
const OVY_MGR_TEMPLATE sOverlayTemplate_TrainerCardSignature =
    { TrainerCardSignature_Init, TrainerCardSignature_Main, TrainerCardSignature_Exit, FS_OVERLAY_ID(trainer_card_signature) };
const OVY_MGR_TEMPLATE _020FA264 =
    { ov70_02238430, ov70_022385C0, ov70_022386F4, FS_OVERLAY_ID(OVY_70) };
const OVY_MGR_TEMPLATE sOverlayTemplate_ChooseStarter =
    { ChooseStarter_Init, ChooseStarter_Main, ChooseStarter_Exit, FS_OVERLAY_ID(OVY_61) };
const OVY_MGR_TEMPLATE sOverlayTemplate_Pokedex =
    { Pokedex_Init, Pokedex_Main, Pokedex_Exit, FS_OVERLAY_ID(OVY_18) };
const OVY_MGR_TEMPLATE sOverlayTemplate_TrainerCard =
    { TrainerCard_Init, TrainerCard_Main, TrainerCard_Exit, FS_OVERLAY_ID(trainer_card) };
const OVY_MGR_TEMPLATE sOverlayTemplate_PalPad =
    { PalPad_Init, PalPad_Main, PalPad_Exit, FS_OVERLAY_ID(OVY_43) };
const OVY_MGR_TEMPLATE _020FA2B4 =
    { ov73_021E5900, ov73_021E5AB8, ov73_021E5BAC, FS_OVERLAY_ID(OVY_73) };
const OVY_MGR_TEMPLATE _020FA2C4 =
    { ov37_021E5900, ov37_021E5A84, ov37_021E5B94, FS_OVERLAY_ID(OVY_37) };
const OVY_MGR_TEMPLATE sOverlayTemplate_TradeSequence =
    { TradeSequence_Init, TradeSequence_Main, TradeSequence_Exit, FS_OVERLAY_ID(OVY_71) };
const OVY_MGR_TEMPLATE _020FA2E4 =
    { ov67_021E5900, ov67_021E5984, ov67_021E5968, FS_OVERLAY_ID(OVY_67) };
const OVY_MGR_TEMPLATE _020FA2F4 =
    { ov103_021EC940, ov103_021EC988, ov103_021EC9A4, FS_OVERLAY_ID(OVY_103) };
const OVY_MGR_TEMPLATE sOverlayTemplate_Certificates =
    { Certificates_Init, Certificates_Main, Certificates_Exit, FS_OVERLAY_ID(certificates_app) };
const OVY_MGR_TEMPLATE sOverlayTemplate_PokeathlonMedals =
    { PokeathlonMedals_Init, PokeathlonMedals_Main, PokeathlonMedals_Exit, FS_OVERLAY_ID(OVY_99) };
const OVY_MGR_TEMPLATE sOverlayTemplate_PokeathlonEventRecord =
    { PokeathlonEventRecord_Init, PokeathlonEventRecord_Main, PokeathlonEventRecord_Exit, FS_OVERLAY_ID(OVY_99) };
const OVY_MGR_TEMPLATE sOverlayTemplate_NintendoWifiConnect =
    { NintendoWfc_Init, NintendoWfc_Main, NintendoWfc_Exit, FS_OVERLAY_ID(OVY_72) };
const OVY_MGR_TEMPLATE sOverlayTemplate_PokeathlonCourseRecord =
    { PokeathlonCourseRecord_Init, PokeathlonCourseRecord_Main, PokeathlonCourseRecord_Exit, FS_OVERLAY_ID(OVY_99) };
const OVY_MGR_TEMPLATE sOverlayTemplate_OptionsMenu =
    { OptionsMenu_Init, OptionsMenu_Main, OptionsMenu_Exit, FS_OVERLAY_ID(options_app) };
const OVY_MGR_TEMPLATE sOverlayTemplate_BugContestSwapMon =
    { BugContestSwapMon_Init, BugContestSwapMon_Main, BugContestSwapMon_Exit, FS_OVERLAY_ID(OVY_111) };
const OVY_MGR_TEMPLATE sOverlayTemplate_ApricornBox =
    { ApricornBox_Init, ApricornBox_Main, ApricornBox_Exit, FS_OVERLAY_ID(OVY_58) };
const OVY_MGR_TEMPLATE sOverlayTemplate_BerryPots =
    { BerryPots_Init, BerryPots_Main, BerryPots_Exit, FS_OVERLAY_ID(OVY_16) };
const OVY_MGR_TEMPLATE gOverlayTemplate_UnownReport =
    { UnownReport_Init, UnownReport_Main, UnownReport_Exit, FS_OVERLAY_ID(OVY_113) };
const OVY_MGR_TEMPLATE sOverlayTemplate_AlphPuzzle =
    { AlphPuzzle_Init, AlphPuzzle_Main, AlphPuzzle_Exit, FS_OVERLAY_ID(OVY_110) };
const OVY_MGR_TEMPLATE sOverlayTemplate_PhotoAlbum =
    { PhotoAlbum_Init, PhotoAlbum_Main, PhotoAlbum_Exit, FS_OVERLAY_ID(OVY_109) };
const OVY_MGR_TEMPLATE sOverlayTemplate_SafariDecoration =
    { SafariDecoration_Init, SafariDecoration_Main, SafariDecoration_Exit, FS_OVERLAY_ID(OVY_108) };
const OVY_MGR_TEMPLATE sOverlayTemplate_SafariAreaCustomizer =
    { SafariAreaCustomizer_Init, SafariAreaCustomizer_Main, SafariAreaCustomizer_Exit, FS_OVERLAY_ID(OVY_108) };
const OVY_MGR_TEMPLATE sOverlayTemplate_TownMap =
    { TownMap_Init, TownMap_Main, TownMap_Exit, FS_OVERLAY_ID(OVY_101) };
const OVY_MGR_TEMPLATE sOverlayTemplate_Phone =
    { Phone_Init, Phone_Main, Phone_Exit, FS_OVERLAY_ID(OVY_100) };
const OVY_MGR_TEMPLATE sOverlayTemplate_EasyChat =
    { EasyChat_Init, EasyChat_Main, EasyChat_Exit, FS_OVERLAY_ID(OVY_102) };
const OVY_MGR_TEMPLATE sOverlayTemplate_PCBox =
    { PCBox_Init, PCBox_Main, PCBox_Exit, FS_OVERLAY_ID(OVY_14) };
const OVY_MGR_TEMPLATE sOverlayTemplate_PokeathlonUnkApp =
    { ov99_021E677C, ov99_021E6888, ov99_021E6840, FS_OVERLAY_ID(OVY_99) };
const OVY_MGR_TEMPLATE _020FA434 =
    { ov55_UnkApp_Init, ov55_UnkApp_Main, ov55_UnkApp_Exit, FS_OVERLAY_ID(OVY_55) };
const OVY_MGR_TEMPLATE _020FA444 =
    { ov73_021E7E4C, ov73_021E7FB8, ov73_021E808C, FS_OVERLAY_ID(OVY_72) };
const OVY_MGR_TEMPLATE _020FA454 =
    { ov104_021E5900, ov104_021E59E4, ov104_021E5B14, FS_OVERLAY_ID(OVY_104) };
const OVY_MGR_TEMPLATE sOverlayTemplate_Bag =
    { Bag_Init, Bag_Main, Bag_Exit, FS_OVERLAY_ID(OVY_15) };
const OVY_MGR_TEMPLATE sOverlayTemplate_LegendaryCinematic =
    { LegendaryCinematic_Init, LegendaryCinematic_Main, LegendaryCinematic_Exit, FS_OVERLAY_ID(OVY_106) };
const OVY_MGR_TEMPLATE gOverlayTemplate_Battle =
    { Battle_Init, Battle_Main, Battle_Exit, FS_OVERLAY_ID(OVY_12) };
const OVY_MGR_TEMPLATE _020FA494 =
    { ov121_021E5900, ov121_021E590C, ov121_021E59BC, FS_OVERLAY_ID(OVY_121) };

const u8 *sPockets = NULL;
OVY_MGR_TEMPLATE sOverlayTemplate_ScratchOffCards =
    { ScratchOffCards_Init, ScratchOffCards_Main, ScratchOffCards_Exit, FS_OVERLAY_ID(OVY_87) };
OVY_MGR_TEMPLATE sOverlayTemplate_WirelessTradeSelectMon =
    { WirelessTradeSelectMon_Init, WirelessTradeSelectMon_Main, WirelessTradeSelectMon_Exit, FS_OVERLAY_ID(OVY_65) };
OVY_MGR_TEMPLATE sOverlayTemplate_AccessoryPortrait =
    { AccessoryPortrait_Init, AccessoryPortrait_Main, AccessoryPortrait_Exit, FS_OVERLAY_ID(OVY_41) };
OVY_MGR_TEMPLATE _0210F9AC =
    { ov41_02246DE0, ov41_02246F08, ov41_02247150, FS_OVERLAY_ID(OVY_41) };
OVY_MGR_TEMPLATE _0210F9BC =
    { ov86_021E5900, ov86_021E5A40, ov86_021E5AA4, FS_OVERLAY_ID(OVY_86) };
#endif //NONMATCHING
