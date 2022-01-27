#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "party_menu.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start SetScriptFlag
SetScriptFlag: ; 0x0206659C
	ldr r3, _020665A0 ; =SetFlagInArray
	bx r3
	.balign 4, 0
_020665A0: .word SetFlagInArray
	thumb_func_end SetScriptFlag

	thumb_func_start ClearScriptFlag
ClearScriptFlag: ; 0x020665A4
	ldr r3, _020665A8 ; =ClearFlagInArray
	bx r3
	.balign 4, 0
_020665A8: .word ClearFlagInArray
	thumb_func_end ClearScriptFlag

	thumb_func_start CheckScriptFlag
CheckScriptFlag: ; 0x020665AC
	ldr r3, _020665B0 ; =CheckFlagInArray
	bx r3
	.balign 4, 0
_020665B0: .word CheckFlagInArray
	thumb_func_end CheckScriptFlag

	thumb_func_start FlagAction
FlagAction: ; 0x020665B4
	push {r3, lr}
	cmp r1, #0
	beq _020665CE
	cmp r1, #1
	beq _020665C4
	cmp r1, #2
	beq _020665D8
	b _020665E2
_020665C4:
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	bl SetScriptFlag
	b _020665E6
_020665CE:
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	bl ClearScriptFlag
	b _020665E6
_020665D8:
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	bl CheckScriptFlag
	pop {r3, pc}
_020665E2:
	bl GF_AssertFail
_020665E6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end FlagAction

	thumb_func_start sub_020665EC
sub_020665EC: ; 0x020665EC
	ldr r3, _020665F4 ; =SetScriptFlag
	mov r1, #FLAG_UNK_960>>4
	lsl r1, r1, #4
	bx r3
	.balign 4, 0
_020665F4: .word SetScriptFlag
	thumb_func_end sub_020665EC

	thumb_func_start sub_020665F8
sub_020665F8: ; 0x020665F8
	ldr r3, _02066600 ; =CheckScriptFlag
	mov r1, #FLAG_UNK_960>>4
	lsl r1, r1, #4
	bx r3
	.balign 4, 0
_02066600: .word CheckScriptFlag
	thumb_func_end sub_020665F8

	thumb_func_start SetGameClearFlag
SetGameClearFlag: ; 0x02066604
	ldr r3, _0206660C ; =SetScriptFlag
	ldr r1, _02066610 ; =FLAG_GAME_CLEAR
	bx r3
	nop
_0206660C: .word SetScriptFlag
_02066610: .word FLAG_GAME_CLEAR
	thumb_func_end SetGameClearFlag

	thumb_func_start CheckGameClearFlag
CheckGameClearFlag: ; 0x02066614
	ldr r3, _0206661C ; =CheckScriptFlag
	ldr r1, _02066620 ; =FLAG_GAME_CLEAR
	bx r3
	nop
_0206661C: .word CheckScriptFlag
_02066620: .word FLAG_GAME_CLEAR
	thumb_func_end CheckGameClearFlag

	thumb_func_start ScriptState_SetHaveFollowerFlag
ScriptState_SetHaveFollowerFlag: ; 0x02066624
	ldr r3, _0206662C ; =SetScriptFlag
	ldr r1, _02066630 ; =FLAG_HAVE_FOLLOWER
	bx r3
	nop
_0206662C: .word SetScriptFlag
_02066630: .word FLAG_HAVE_FOLLOWER
	thumb_func_end ScriptState_SetHaveFollowerFlag

	thumb_func_start ScriptState_ClearHaveFollowerFlag
ScriptState_ClearHaveFollowerFlag: ; 0x02066634
	ldr r3, _0206663C ; =ClearScriptFlag
	ldr r1, _02066640 ; =FLAG_HAVE_FOLLOWER
	bx r3
	nop
_0206663C: .word ClearScriptFlag
_02066640: .word FLAG_HAVE_FOLLOWER
	thumb_func_end ScriptState_ClearHaveFollowerFlag

	thumb_func_start ScriptState_CheckHaveFollower
ScriptState_CheckHaveFollower: ; 0x02066644
	ldr r3, _0206664C ; =CheckScriptFlag
	ldr r1, _02066650 ; =FLAG_HAVE_FOLLOWER
	bx r3
	nop
_0206664C: .word CheckScriptFlag
_02066650: .word FLAG_HAVE_FOLLOWER
	thumb_func_end ScriptState_CheckHaveFollower

	thumb_func_start sub_02066654
sub_02066654: ; 0x02066654
	ldr r3, _0206665C ; =SetScriptFlag
	ldr r1, _02066660 ; =FLAG_UNK_99C
	bx r3
	nop
_0206665C: .word SetScriptFlag
_02066660: .word FLAG_UNK_99C
	thumb_func_end sub_02066654

	thumb_func_start sub_02066664
sub_02066664: ; 0x02066664
	ldr r3, _0206666C ; =SetScriptFlag
	ldr r1, _02066670 ; =FLAG_UNK_965
	bx r3
	nop
_0206666C: .word SetScriptFlag
_02066670: .word FLAG_UNK_965
	thumb_func_end sub_02066664

	thumb_func_start sub_02066674
sub_02066674: ; 0x02066674
	ldr r3, _0206667C ; =ClearScriptFlag
	ldr r1, _02066680 ; =FLAG_UNK_965
	bx r3
	nop
_0206667C: .word ClearScriptFlag
_02066680: .word FLAG_UNK_965
	thumb_func_end sub_02066674

	thumb_func_start sub_02066684
sub_02066684: ; 0x02066684
	ldr r3, _0206668C ; =CheckScriptFlag
	ldr r1, _02066690 ; =FLAG_UNK_965
	bx r3
	nop
_0206668C: .word CheckScriptFlag
_02066690: .word FLAG_UNK_965
	thumb_func_end sub_02066684

	thumb_func_start sub_02066694
sub_02066694: ; 0x02066694
	ldr r3, _0206669C ; =SetScriptFlag
	ldr r1, _020666A0 ; =FLAG_UNK_969
	bx r3
	nop
_0206669C: .word SetScriptFlag
_020666A0: .word FLAG_UNK_969
	thumb_func_end sub_02066694

	thumb_func_start sub_020666A4
sub_020666A4: ; 0x020666A4
	ldr r3, _020666AC ; =ClearScriptFlag
	ldr r1, _020666B0 ; =FLAG_UNK_969
	bx r3
	nop
_020666AC: .word ClearScriptFlag
_020666B0: .word FLAG_UNK_969
	thumb_func_end sub_020666A4

	thumb_func_start sub_020666B4
sub_020666B4: ; 0x020666B4
	ldr r3, _020666BC ; =CheckScriptFlag
	ldr r1, _020666C0 ; =FLAG_UNK_969
	bx r3
	nop
_020666BC: .word CheckScriptFlag
_020666C0: .word FLAG_UNK_969
	thumb_func_end sub_020666B4

	thumb_func_start EventFlagCheck_RematchGroup
EventFlagCheck_RematchGroup: ; 0x020666C4
	ldr r2, _020666D0 ; =FLAG_UNK_97B
	ldr r3, _020666D4 ; =CheckScriptFlag
	add r1, r1, r2
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bx r3
	.balign 4, 0
_020666D0: .word FLAG_UNK_97B
_020666D4: .word CheckScriptFlag
	thumb_func_end EventFlagCheck_RematchGroup

	thumb_func_start ScriptState_SetAlphPuzzleFlag
ScriptState_SetAlphPuzzleFlag: ; 0x020666D8
	push {r3, lr}
	cmp r1, #3
	bhi _02066710
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020666EA: ; jump table
	.short _020666F2 - _020666EA - 2 ; case 0
	.short _020666FA - _020666EA - 2 ; case 1
	.short _02066702 - _020666EA - 2 ; case 2
	.short _0206670A - _020666EA - 2 ; case 3
_020666F2:
	ldr r1, _02066714 ; =FLAG_SYS_ALPH_PUZZLE_KABUTO
	bl SetScriptFlag
	pop {r3, pc}
_020666FA:
	ldr r1, _02066718 ; =FLAG_SYS_ALPH_PUZZLE_AERODACTYL
	bl SetScriptFlag
	pop {r3, pc}
_02066702:
	ldr r1, _0206671C ; =FLAG_SYS_ALPH_PUZZLE_OMANYTE
	bl SetScriptFlag
	pop {r3, pc}
_0206670A:
	ldr r1, _02066720 ; =FLAG_SYS_ALPH_PUZZLE_HO_OH
	bl SetScriptFlag
_02066710:
	pop {r3, pc}
	nop
_02066714: .word FLAG_SYS_ALPH_PUZZLE_KABUTO
_02066718: .word FLAG_SYS_ALPH_PUZZLE_AERODACTYL
_0206671C: .word FLAG_SYS_ALPH_PUZZLE_OMANYTE
_02066720: .word FLAG_SYS_ALPH_PUZZLE_HO_OH
	thumb_func_end ScriptState_SetAlphPuzzleFlag

	thumb_func_start ScriptState_CheckAlphPuzzleFlag
ScriptState_CheckAlphPuzzleFlag: ; 0x02066724
	push {r3, lr}
	mov r2, #0
	cmp r1, #3
	bhi _02066766
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02066738: ; jump table
	.short _02066740 - _02066738 - 2 ; case 0
	.short _0206674A - _02066738 - 2 ; case 1
	.short _02066754 - _02066738 - 2 ; case 2
	.short _0206675E - _02066738 - 2 ; case 3
_02066740:
	ldr r1, _0206676C ; =FLAG_SYS_ALPH_PUZZLE_KABUTO
	bl CheckScriptFlag
	add r2, r0, #0
	b _02066766
_0206674A:
	ldr r1, _02066770 ; =FLAG_SYS_ALPH_PUZZLE_AERODACTYL
	bl CheckScriptFlag
	add r2, r0, #0
	b _02066766
_02066754:
	ldr r1, _02066774 ; =FLAG_SYS_ALPH_PUZZLE_OMANYTE
	bl CheckScriptFlag
	add r2, r0, #0
	b _02066766
_0206675E:
	ldr r1, _02066778 ; =FLAG_SYS_ALPH_PUZZLE_HO_OH
	bl CheckScriptFlag
	add r2, r0, #0
_02066766:
	add r0, r2, #0
	pop {r3, pc}
	nop
_0206676C: .word FLAG_SYS_ALPH_PUZZLE_KABUTO
_02066770: .word FLAG_SYS_ALPH_PUZZLE_AERODACTYL
_02066774: .word FLAG_SYS_ALPH_PUZZLE_OMANYTE
_02066778: .word FLAG_SYS_ALPH_PUZZLE_HO_OH
	thumb_func_end ScriptState_CheckAlphPuzzleFlag

	thumb_func_start sub_0206677C
sub_0206677C: ; 0x0206677C
	push {r3, lr}
	cmp r1, #0
	ldr r1, _02066790 ; =FLAG_UNK_986
	beq _0206678A
	bl SetScriptFlag
	pop {r3, pc}
_0206678A:
	bl ClearScriptFlag
	pop {r3, pc}
	.balign 4, 0
_02066790: .word FLAG_UNK_986
	thumb_func_end sub_0206677C

	thumb_func_start sub_02066794
sub_02066794: ; 0x02066794
	ldr r3, _0206679C ; =CheckScriptFlag
	ldr r1, _020667A0 ; =FLAG_UNK_986
	bx r3
	nop
_0206679C: .word CheckScriptFlag
_020667A0: .word FLAG_UNK_986
	thumb_func_end sub_02066794

	thumb_func_start GetOverriddenMapMusic
GetOverriddenMapMusic: ; 0x020667A4
	push {r3, r4, r5, r6, r7, lr}
	ldr r5, _020667D8 ; =_020FE454
	add r7, r0, #0
	add r6, r1, #0
	mov r4, #0
_020667AE:
	ldrh r0, [r5]
	cmp r6, r0
	bne _020667CC
	ldrh r1, [r5, #2]
	add r0, r7, #0
	bl CheckScriptFlag
	cmp r0, #0
	beq _020667CC
	mov r0, #6
	add r1, r4, #0
	mul r1, r0
	ldr r0, _020667DC ; =_020FE454 + 4
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
_020667CC:
	add r4, r4, #1
	add r5, r5, #6
	cmp r4, #0xd
	blo _020667AE
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020667D8: .word _020FE454
_020667DC: .word _020FE454 + 4
	thumb_func_end GetOverriddenMapMusic

	thumb_func_start sub_020667E0
sub_020667E0: ; 0x020667E0
	ldr r3, _020667E8 ; =SetScriptFlag
	ldr r1, _020667EC ; =FLAG_UNK_966
	bx r3
	nop
_020667E8: .word SetScriptFlag
_020667EC: .word FLAG_UNK_966
	thumb_func_end sub_020667E0

	thumb_func_start sub_020667F0
sub_020667F0: ; 0x020667F0
	ldr r3, _020667F8 ; =ClearScriptFlag
	ldr r1, _020667FC ; =FLAG_UNK_966
	bx r3
	nop
_020667F8: .word ClearScriptFlag
_020667FC: .word FLAG_UNK_966
	thumb_func_end sub_020667F0

	thumb_func_start sub_02066800
sub_02066800: ; 0x02066800
	ldr r3, _02066808 ; =CheckScriptFlag
	ldr r1, _0206680C ; =FLAG_UNK_966
	bx r3
	nop
_02066808: .word CheckScriptFlag
_0206680C: .word FLAG_UNK_966
	thumb_func_end sub_02066800

	thumb_func_start sub_02066810
sub_02066810: ; 0x02066810
	ldr r3, _02066818 ; =CheckScriptFlag
	ldr r1, _0206681C ; =FLAG_SYS_MET_BILL
	bx r3
	nop
_02066818: .word CheckScriptFlag
_0206681C: .word FLAG_SYS_MET_BILL
	thumb_func_end sub_02066810

	thumb_func_start sub_02066820
sub_02066820: ; 0x02066820
	ldr r3, _02066828 ; =SetScriptFlag
	ldr r1, _0206682C ; =FLAG_UNK_975
	bx r3
	nop
_02066828: .word SetScriptFlag
_0206682C: .word FLAG_UNK_975
	thumb_func_end sub_02066820

	thumb_func_start sub_02066830
sub_02066830: ; 0x02066830
	ldr r3, _02066838 ; =ClearScriptFlag
	ldr r1, _0206683C ; =FLAG_UNK_975
	bx r3
	nop
_02066838: .word ClearScriptFlag
_0206683C: .word FLAG_UNK_975
	thumb_func_end sub_02066830

	thumb_func_start ScriptState_SetSafariSysFlag
ScriptState_SetSafariSysFlag: ; 0x02066840
	ldr r3, _02066848 ; =SetScriptFlag
	ldr r1, _0206684C ; =FLAG_SYS_SAFARI
	bx r3
	nop
_02066848: .word SetScriptFlag
_0206684C: .word FLAG_SYS_SAFARI
	thumb_func_end ScriptState_SetSafariSysFlag

	thumb_func_start ScriptState_ClearSafariSysFlag
ScriptState_ClearSafariSysFlag: ; 0x02066850
	ldr r3, _02066858 ; =ClearScriptFlag
	ldr r1, _0206685C ; =FLAG_SYS_SAFARI
	bx r3
	nop
_02066858: .word ClearScriptFlag
_0206685C: .word FLAG_SYS_SAFARI
	thumb_func_end ScriptState_ClearSafariSysFlag

	thumb_func_start ScriptState_CheckSafariSysFlag
ScriptState_CheckSafariSysFlag: ; 0x02066860
	ldr r3, _02066868 ; =CheckScriptFlag
	ldr r1, _0206686C ; =FLAG_SYS_SAFARI
	bx r3
	nop
_02066868: .word CheckScriptFlag
_0206686C: .word FLAG_SYS_SAFARI
	thumb_func_end ScriptState_CheckSafariSysFlag

	thumb_func_start sub_02066870
sub_02066870: ; 0x02066870
	ldr r3, _02066878 ; =CheckScriptFlag
	ldr r1, _0206687C ; =FLAG_UNK_996
	bx r3
	nop
_02066878: .word CheckScriptFlag
_0206687C: .word FLAG_UNK_996
	thumb_func_end sub_02066870

	thumb_func_start ScriptState_SetPalParkSysFlag
ScriptState_SetPalParkSysFlag: ; 0x02066880
	ldr r3, _02066888 ; =SetScriptFlag
	ldr r1, _0206688C ; =FLAG_SYS_PAL_PARK
	bx r3
	nop
_02066888: .word SetScriptFlag
_0206688C: .word FLAG_SYS_PAL_PARK
	thumb_func_end ScriptState_SetPalParkSysFlag

	thumb_func_start ScriptState_ClearPalParkSysFlag
ScriptState_ClearPalParkSysFlag: ; 0x02066890
	ldr r3, _02066898 ; =ClearScriptFlag
	ldr r1, _0206689C ; =FLAG_SYS_PAL_PARK
	bx r3
	nop
_02066898: .word ClearScriptFlag
_0206689C: .word FLAG_SYS_PAL_PARK
	thumb_func_end ScriptState_ClearPalParkSysFlag

	thumb_func_start ScriptState_CheckPalParkSysFlag
ScriptState_CheckPalParkSysFlag: ; 0x020668A0
	ldr r3, _020668A8 ; =CheckScriptFlag
	ldr r1, _020668AC ; =FLAG_SYS_PAL_PARK
	bx r3
	nop
_020668A8: .word CheckScriptFlag
_020668AC: .word FLAG_SYS_PAL_PARK
	thumb_func_end ScriptState_CheckPalParkSysFlag

	thumb_func_start sub_020668B0
sub_020668B0: ; 0x020668B0
	ldr r3, _020668B8 ; =ClearScriptFlag
	ldr r1, _020668BC ; =FLAG_UNK_972
	bx r3
	nop
_020668B8: .word ClearScriptFlag
_020668BC: .word FLAG_UNK_972
	thumb_func_end sub_020668B0

	thumb_func_start StrengthFlagAction
StrengthFlagAction: ; 0x020668C0
	ldr r3, _020668C8 ; =FlagAction
	ldr r2, _020668CC ; =FLAG_STRENGTH_ACTIVE
	bx r3
	nop
_020668C8: .word FlagAction
_020668CC: .word FLAG_STRENGTH_ACTIVE
	thumb_func_end StrengthFlagAction

	thumb_func_start sub_020668D0
sub_020668D0: ; 0x020668D0
	ldr r3, _020668D8 ; =SetScriptFlag
	ldr r1, _020668DC ; =FLAG_UNK_973
	bx r3
	nop
_020668D8: .word SetScriptFlag
_020668DC: .word FLAG_UNK_973
	thumb_func_end sub_020668D0

	thumb_func_start sub_020668E0
sub_020668E0: ; 0x020668E0
	ldr r3, _020668E8 ; =ClearScriptFlag
	ldr r1, _020668EC ; =FLAG_UNK_973
	bx r3
	nop
_020668E8: .word ClearScriptFlag
_020668EC: .word FLAG_UNK_973
	thumb_func_end sub_020668E0

	thumb_func_start sub_020668F0
sub_020668F0: ; 0x020668F0
	ldr r3, _020668F8 ; =CheckScriptFlag
	ldr r1, _020668FC ; =FLAG_UNK_973
	bx r3
	nop
_020668F8: .word CheckScriptFlag
_020668FC: .word FLAG_UNK_973
	thumb_func_end sub_020668F0

	thumb_func_start sub_02066900
sub_02066900: ; 0x02066900
	ldr r3, _02066908 ; =SetScriptFlag
	ldr r1, _0206690C ; =FLAG_UNK_974
	bx r3
	nop
_02066908: .word SetScriptFlag
_0206690C: .word FLAG_UNK_974
	thumb_func_end sub_02066900

	thumb_func_start sub_02066910
sub_02066910: ; 0x02066910
	ldr r3, _02066918 ; =ClearScriptFlag
	ldr r1, _0206691C ; =FLAG_UNK_974
	bx r3
	nop
_02066918: .word ClearScriptFlag
_0206691C: .word FLAG_UNK_974
	thumb_func_end sub_02066910

	thumb_func_start sub_02066920
sub_02066920: ; 0x02066920
	ldr r3, _02066928 ; =CheckScriptFlag
	ldr r1, _0206692C ; =FLAG_UNK_974
	bx r3
	nop
_02066928: .word CheckScriptFlag
_0206692C: .word FLAG_UNK_974
	thumb_func_end sub_02066920

	thumb_func_start ScriptState_FlypointFlagAction
ScriptState_FlypointFlagAction: ; 0x02066930
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	cmp r4, #0x26
	blo _02066940
	bl GF_AssertFail
_02066940:
	mov r2, #FLAG_SYS_FLYPOINT_PALLET>>4
	lsl r2, r2, #4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, r2
	bl FlagAction
	pop {r4, r5, r6, pc}
	thumb_func_end ScriptState_FlypointFlagAction

	thumb_func_start sub_02066950
sub_02066950: ; 0x02066950
	ldr r3, _02066958 ; =SetScriptFlag
	mov r1, #FLAG_UNK_970>>4
	lsl r1, r1, #4
	bx r3
	.balign 4, 0
_02066958: .word SetScriptFlag
	thumb_func_end sub_02066950

	thumb_func_start CheckGotStarter
CheckGotStarter: ; 0x0206695C
	ldr r3, _02066964 ; =CheckScriptFlag
	mov r1, #FLAG_GOT_STARTER
	bx r3
	nop
_02066964: .word CheckScriptFlag
	thumb_func_end CheckGotStarter

	thumb_func_start CheckGotPokegear
CheckGotPokegear: ; 0x02066968
	ldr r3, _02066970 ; =CheckScriptFlag
	mov r1, #FLAG_GOT_POKEGEAR
	bx r3
	nop
_02066970: .word CheckScriptFlag
	thumb_func_end CheckGotPokegear

	thumb_func_start CheckGotPokedex
CheckGotPokedex: ; 0x02066974
	ldr r3, _0206697C ; =CheckScriptFlag
	mov r1, #FLAG_GOT_POKEDEX
	bx r3
	nop
_0206697C: .word CheckScriptFlag
	thumb_func_end CheckGotPokedex

	thumb_func_start CheckGotMenuIconI
CheckGotMenuIconI: ; 0x02066980
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	blt _0206698E
	bl GF_AssertFail
_0206698E:
	ldr r1, _020669A0 ; =FLAG_GOT_BAG
	add r0, r5, #0
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl CheckScriptFlag
	pop {r3, r4, r5, pc}
	nop
_020669A0: .word FLAG_GOT_BAG
	thumb_func_end CheckGotMenuIconI

	thumb_func_start sub_020669A4
sub_020669A4: ; 0x020669A4
	ldr r3, _020669AC ; =CheckScriptFlag
	ldr r1, _020669B0 ; =FLAG_UNK_96A
	bx r3
	nop
_020669AC: .word CheckScriptFlag
_020669B0: .word FLAG_UNK_96A
	thumb_func_end sub_020669A4

	thumb_func_start sub_020669B4
sub_020669B4: ; 0x020669B4
	push {r3, lr}
	cmp r1, #2
	bls _020669BE
	mov r0, #0
	pop {r3, pc}
_020669BE:
	ldr r2, _020669CC ; =FLAG_UNK_96B
	add r1, r1, r2
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl CheckScriptFlag
	pop {r3, pc}
	.balign 4, 0
_020669CC: .word FLAG_UNK_96B
	thumb_func_end sub_020669B4

	thumb_func_start sub_020669D0
sub_020669D0: ; 0x020669D0
	ldr r3, _020669D8 ; =CheckScriptFlag
	ldr r1, _020669DC ; =FLAG_SYS_CIANWOOD_WATERFALL_DISABLE
	bx r3
	nop
_020669D8: .word CheckScriptFlag
_020669DC: .word FLAG_SYS_CIANWOOD_WATERFALL_DISABLE
	thumb_func_end sub_020669D0

	thumb_func_start sub_020669E0
sub_020669E0: ; 0x020669E0
	ldr r3, _020669E8 ; =CheckScriptFlag
	ldr r1, _020669EC ; =FLAG_SYS_SOLVED_LT_SURGE_GYM
	bx r3
	nop
_020669E8: .word CheckScriptFlag
_020669EC: .word FLAG_SYS_SOLVED_LT_SURGE_GYM
	thumb_func_end sub_020669E0

	thumb_func_start sub_020669F0
sub_020669F0: ; 0x020669F0
	ldr r3, _020669F8 ; =CheckScriptFlag
	ldr r1, _020669FC ; =FLAG_UNK_982
	bx r3
	nop
_020669F8: .word CheckScriptFlag
_020669FC: .word FLAG_UNK_982
	thumb_func_end sub_020669F0

	thumb_func_start sub_02066A00
sub_02066A00: ; 0x02066A00
	ldr r3, _02066A08 ; =CheckScriptFlag
	mov r1, #FLAG_UNK_09A
	bx r3
	nop
_02066A08: .word CheckScriptFlag
	thumb_func_end sub_02066A00

	thumb_func_start sub_02066A0C
sub_02066A0C: ; 0x02066A0C
	ldr r3, _02066A14 ; =CheckScriptFlag
	ldr r1, _02066A18 ; =FLAG_UNK_997
	bx r3
	nop
_02066A14: .word CheckScriptFlag
_02066A18: .word FLAG_UNK_997
	thumb_func_end sub_02066A0C

	thumb_func_start sub_02066A1C
sub_02066A1C: ; 0x02066A1C
	ldr r3, _02066A24 ; =SetScriptFlag
	ldr r1, _02066A28 ; =FLAG_UNK_99A
	bx r3
	nop
_02066A24: .word SetScriptFlag
_02066A28: .word FLAG_UNK_99A
	thumb_func_end sub_02066A1C

	thumb_func_start sub_02066A2C
sub_02066A2C: ; 0x02066A2C
	ldr r3, _02066A34 ; =ClearScriptFlag
	ldr r1, _02066A38 ; =FLAG_UNK_99A
	bx r3
	nop
_02066A34: .word ClearScriptFlag
_02066A38: .word FLAG_UNK_99A
	thumb_func_end sub_02066A2C

	thumb_func_start sub_02066A3C
sub_02066A3C: ; 0x02066A3C
	ldr r3, _02066A44 ; =CheckScriptFlag
	ldr r1, _02066A48 ; =FLAG_UNK_99A
	bx r3
	nop
_02066A44: .word CheckScriptFlag
_02066A48: .word FLAG_UNK_99A
	thumb_func_end sub_02066A3C

	thumb_func_start sub_02066A4C
sub_02066A4C: ; 0x02066A4C
	ldr r3, _02066A54 ; =CheckScriptFlag
	mov r1, #FLAG_SNORLAX_MEET
	bx r3
	nop
_02066A54: .word CheckScriptFlag
	thumb_func_end sub_02066A4C

	thumb_func_start sub_02066A58
sub_02066A58: ; 0x02066A58
	ldr r3, _02066A60 ; =CheckScriptFlag
	mov r1, #FLAG_RED_GYARADOS_MEET
	bx r3
	nop
_02066A60: .word CheckScriptFlag
	thumb_func_end sub_02066A58

	thumb_func_start sub_02066A64
sub_02066A64: ; 0x02066A64
	push {r3, lr}
	cmp r1, #0
	ldr r1, _02066A78 ; =FLAG_UNK_99D
	beq _02066A72
	bl SetScriptFlag
	pop {r3, pc}
_02066A72:
	bl ClearScriptFlag
	pop {r3, pc}
	.balign 4, 0
_02066A78: .word FLAG_UNK_99D
	thumb_func_end sub_02066A64

	.rodata

_020FE454:
	.short MAP_D22R0101, FLAG_BUG_CONTEST_ACTIVE, SEQ_GS_TAIKAIMAE_D5
	.short MAP_R35R0201, FLAG_BUG_CONTEST_ACTIVE, SEQ_GS_TAIKAIMAE
	.short MAP_R36R0201, FLAG_BUG_CONTEST_ACTIVE, SEQ_GS_TAIKAIMAE
	.short MAP_T04GYM0101, FLAG_UNK_994, SEQ_GS_EYE_ROCKET
	.short MAP_R24, FLAG_UNK_995, SEQ_GS_EYE_ROCKET
	.short MAP_D10R0101, FLAG_UNK_999, SEQ_GS_SAFARI_FIELD
	.short MAP_D23R0101, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO
	.short MAP_D23R0102, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO
	.short MAP_D23R0103, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO
	.short MAP_D23R0104, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO
	.short MAP_D23R0105, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO
	.short MAP_D23R0106, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO
	.short MAP_D23R0107, FLAG_ROCKET_TAKEOVER_ACTIVE, SEQ_GS_SENKYO
