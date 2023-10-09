	.include "asm/macros.inc"
	.include "unk_0203E348.inc"
	.include "global.inc"

	.public sub_0203E3A8
	.public sub_0203E3AC
	.public sub_0203E3C0
	.public _020FA0B0

	.public _020FA17C
	.public _020FA190
	.public _020FA464
	.public _020FA1B8
	.public _020FA1A4
	.public _0210F978
	.public _020FA1AC
	.public _020FA1B0
	.public _020FA1A8
	.public _020FA414
	.public _020FA404
	.public _020FA404
	.public _020FA3F4
	.public _020FA3E4
	.public _020FA3D4
	.public _020FA3C4
	.public _020FA3B4
	.public _020FA3A4
	.public _020FA394
	.public _020FA384
	.public _020FA374
	.public _020FA364
	.public _020FA354
	.public _020FA344
	.public _020FA314
	.public _020FA324
	.public _020FA424
	.public _020FA434
	.public _020FA2F4
	.public _020FA2E4
	.public _0210F9AC
	.public _0210F99C
	.public _0210F98C
	.public _020FA2D4
	.public _020FA2C4
	.public _020FA2B4
	.public _020FA2A4
	.public _020FA294
	.public _020FA284
    .public sAppTemplate_ChooseStarter
    .public _020FA254
    .public _020FA264
    .public _020FA334
    .public _020FA224
    .public _020FA214
    .public _020FA204
    .public _020FA1F4
    .public _020FA1E4
    .public _020FA234
    .public sAppTemplate_Certificates
    .public _0210F9BC
    .public _0210F97C
    .public _020FA1C4
    .public _020FA244
    .public _020FA454
    .public _020FA1D4
    .public _020FA474
    .public _020FA494

#ifndef NONMATCHING
	.rodata

_020FA1C4:
	.word sub_020192D0, sub_0201935C, sub_02019490, FS_OVERLAY_ID(OVY_39)
_020FA1D4:
	.word ov105_021E5900, ov105_021E59DC, ov105_021E5B14, FS_OVERLAY_ID(OVY_105)
_020FA1E4:
	.word ov68_021E5900, ov68_021E5968, ov68_021E5A3C, FS_OVERLAY_ID(OVY_68)
_020FA1F4:
	.word CreditsApp_OvyInit, CreditsApp_OvyExec, CreditsApp_OvyExit, FS_OVERLAY_ID(credits)
_020FA204:
	.word ov64_021E5900, ov64_021E5A18, ov64_021E59C8, FS_OVERLAY_ID(OVY_64)
_020FA214:
	.word ov63_0221BE20, ov63_0221BF88, ov63_0221BF28, FS_OVERLAY_ID(OVY_63)
_020FA224:
	.word ov69_021E5900, ov69_021E5A34, ov69_021E6080, FS_OVERLAY_ID(OVY_69)
_020FA234:
	.word VoltorbFlipApp_OvyInit, VoltorbFlipApp_OvyExec, VoltorbFlipApp_OvyExit, FS_OVERLAY_ID(voltorb_flip)
_020FA244:
	.word PokeathlonCourseApplication_OvyInit, PokeathlonCourseApplication_OvyExec, PokeathlonCourseApplication_OvyExit, FS_OVERLAY_ID(OVY_96)
_020FA254:
	.word SignBackOfTrainerCardApp_OvyInit, SignBackOfTrainerCardApp_OvyExec, SignBackOfTrainerCardApp_OvyExit, FS_OVERLAY_ID(trainer_card_signature)
_020FA264:
	.word ov70_02238430, ov70_022385C0, ov70_022386F4, FS_OVERLAY_ID(OVY_70)
sAppTemplate_ChooseStarter:
	.word ChooseStarterApplication_OvyInit, ChooseStarterApplication_OvyExec, ChooseStarterApplication_OvyExit, FS_OVERLAY_ID(OVY_61)
_020FA284:
	.word ov18_021E5AA0, ov18_021E5B64, ov18_021E5B80, FS_OVERLAY_ID(OVY_18)
_020FA294:
	.word TrainerCardApp_OvyInit, TrainerCardApp_OvyExec, TrainerCardApp_OvyExit, FS_OVERLAY_ID(trainer_card)
_020FA2A4:
	.word ov43_02229EE0, ov43_02229FB4, ov43_0222A0AC, FS_OVERLAY_ID(OVY_43)
_020FA2B4:
	.word ov73_021E5900, ov73_021E5AB8, ov73_021E5BAC, FS_OVERLAY_ID(OVY_73)
_020FA2C4:
	.word ov37_021E5900, ov37_021E5A84, ov37_021E5B94, FS_OVERLAY_ID(OVY_37)
_020FA2D4:
	.word ov71_02246960, ov71_02246BB8, ov71_02246B58, FS_OVERLAY_ID(OVY_71)
_020FA2E4:
	.word ov67_021E5900, ov67_021E5984, ov67_021E5968, FS_OVERLAY_ID(OVY_67)
_020FA2F4:
	.word ov103_021EC940, ov103_021EC988, ov103_021EC9A4, FS_OVERLAY_ID(OVY_103)
sAppTemplate_Certificates:
	.word CertificatesApp_Init, CertificatesApp_Run, CertificatesApp_Exit, FS_OVERLAY_ID(certificates_app)
_020FA314:
	.word ov99_021E7818, ov99_021E794C, ov99_021E78F0, FS_OVERLAY_ID(OVY_99)
_020FA324:
	.word ov99_021E8304, ov99_021E83F4, ov99_021E83AC, FS_OVERLAY_ID(OVY_99)
_020FA334:
	.word ov72_02237E20, ov72_02237F9C, ov72_02238070, FS_OVERLAY_ID(OVY_72)
_020FA344:
	.word ov99_021E5900, ov99_021E5A38, ov99_021E5A04, FS_OVERLAY_ID(OVY_99)
_020FA354:
	.word ov54_021E5900, ov54_021E5B3C, ov54_021E5A10, FS_OVERLAY_ID(OVY_54)
_020FA364:
	.word ov111_021E5900, ov111_021E59B8, ov111_021E5960, FS_OVERLAY_ID(OVY_111)
_020FA374:
	.word ov58_022378E4, ov58_02237924, ov58_0223799C, FS_OVERLAY_ID(OVY_58)
_020FA384:
	.word ov16_0220196C, ov16_022019B8, ov16_02201A04, FS_OVERLAY_ID(OVY_16)
_020FA394:
	.word ov113_021E5900, ov113_021E5968, ov113_021E59C8, FS_OVERLAY_ID(OVY_113)
_020FA3A4:
	.word ov110_AlphPuzzle_OvyInit, ov110_AlphPuzzle_OvyExec, ov110_AlphPuzzle_OvyExit, FS_OVERLAY_ID(OVY_110)
_020FA3B4:
	.word ov109_021E5900, ov109_021E5968, ov109_021E59F0, FS_OVERLAY_ID(OVY_109)
_020FA3C4:
	.word ov108_021E8850, ov108_021E8904, ov108_021E88C4, FS_OVERLAY_ID(OVY_108)
_020FA3D4:
	.word ov108_021E5900, ov108_021E5978, ov108_021E5948, FS_OVERLAY_ID(OVY_108)
_020FA3E4:
	.word ov101_TownMap_OvyInit, ov101_TownMap_OvyExec, ov101_TownMap_OvyExit, FS_OVERLAY_ID(OVY_101)
_020FA3F4:
	.word ov100_Phone_OvyInit, ov100_Phone_OvyExec, ov100_Phone_OvyExit, FS_OVERLAY_ID(OVY_100)
_020FA404:
	.word ov102_021E7740, ov102_021E77B8, ov102_021E7868, FS_OVERLAY_ID(OVY_102)
_020FA414:
	.word ov14_021E5900, ov14_021E596C, ov14_021E5988, FS_OVERLAY_ID(OVY_14)
_020FA424:
	.word ov99_021E677C, ov99_021E6888, ov99_021E6840, FS_OVERLAY_ID(OVY_99)
_020FA434:
	.word ov55_UnkApp_Init, ov55_UnkApp_Main, ov55_UnkApp_Exit, FS_OVERLAY_ID(OVY_55)
_020FA444:
	.word ov73_021E7E4C, ov73_021E7FB8, ov73_021E808C, FS_OVERLAY_ID(OVY_72)
_020FA454:
	.word ov104_021E5900, ov104_021E59E4, ov104_021E5B14, FS_OVERLAY_ID(OVY_104)
_020FA464:
	.word ov15_BagApp_Init, ov15_BagApp_Exec, ov15_BagApp_Exit, FS_OVERLAY_ID(OVY_15)
_020FA474:
	.word sub_02097B78, sub_02097BAC, sub_02097BD0, FS_OVERLAY_ID(OVY_106)
	.public _020FA484
_020FA484:
	.word sub_0203E3A8, sub_0203E3AC, sub_0203E3C0, FS_OVERLAY_ID(OVY_12)
_020FA494:
	.word ov121_021E5900, ov121_021E590C, ov121_021E59BC, FS_OVERLAY_ID(OVY_121)

	.data

_0210F978:
	.word 0x00000000
_0210F97C:
	.word ov87_021E5900, ov87_021E59B4, ov87_021E5AC0, FS_OVERLAY_ID(OVY_87)
_0210F98C:
	.word ov65_0221BE20, ov65_0221C250, ov65_0221CD74, FS_OVERLAY_ID(OVY_65)
_0210F99C:
	.word ov41_0224BA10, ov41_0224BACC, ov41_0224BBA4, FS_OVERLAY_ID(OVY_41)
_0210F9AC:
	.word ov41_02246DE0, ov41_02246F08, ov41_02247150, FS_OVERLAY_ID(OVY_41)
_0210F9BC:
	.word ov86_021E5900, ov86_021E5A40, ov86_021E5AA4, FS_OVERLAY_ID(OVY_86)
#endif //NONMATCHING
