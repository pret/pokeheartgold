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

	thumb_func_start SetScriptVar
SetScriptVar: ; 0x02066A7C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl GetVarAddr
	mov r1, #1
	lsl r1, r1, #0xe
	cmp r5, r1
	blo _02066A94
	lsl r1, r1, #1
	cmp r5, r1
	bls _02066A9C
_02066A94:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_02066A9C:
	cmp r0, #0
	bne _02066AA4
	mov r0, #0
	pop {r3, r4, r5, pc}
_02066AA4:
	strh r4, [r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end SetScriptVar

	thumb_func_start GetScriptVar
GetScriptVar: ; 0x02066AAC
	push {r3, lr}
	bl GetVarAddr
	cmp r0, #0
	bne _02066ABA
	mov r0, #0
	pop {r3, pc}
_02066ABA:
	ldrh r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end GetScriptVar

	thumb_func_start ScriptState_SetFollowerTrainerNum
ScriptState_SetFollowerTrainerNum: ; 0x02066AC0
	ldr r3, _02066AC8 ; =SetScriptVar
	add r2, r1, #0
	ldr r1, _02066ACC ; =VAR_FOLLOWER_TRAINER_NUM
	bx r3
	.balign 4, 0
_02066AC8: .word SetScriptVar
_02066ACC: .word VAR_FOLLOWER_TRAINER_NUM
	thumb_func_end ScriptState_SetFollowerTrainerNum

	thumb_func_start ScriptState_GetFollowerTrainerNum
ScriptState_GetFollowerTrainerNum: ; 0x02066AD0
	ldr r3, _02066AD8 ; =GetScriptVar
	ldr r1, _02066ADC ; =VAR_FOLLOWER_TRAINER_NUM
	bx r3
	nop
_02066AD8: .word GetScriptVar
_02066ADC: .word VAR_FOLLOWER_TRAINER_NUM
	thumb_func_end ScriptState_GetFollowerTrainerNum

	thumb_func_start SetStarterToScriptState
SetStarterToScriptState: ; 0x02066AE0
	ldr r3, _02066AE8 ; =SetScriptVar
	add r2, r1, #0
	ldr r1, _02066AEC ; =VAR_PLAYER_STARTER
	bx r3
	.balign 4, 0
_02066AE8: .word SetScriptVar
_02066AEC: .word VAR_PLAYER_STARTER
	thumb_func_end SetStarterToScriptState

	thumb_func_start GetStarterFromScriptState
GetStarterFromScriptState: ; 0x02066AF0
	ldr r3, _02066AF8 ; =GetScriptVar
	ldr r1, _02066AFC ; =VAR_PLAYER_STARTER
	bx r3
	nop
_02066AF8: .word GetScriptVar
_02066AFC: .word VAR_PLAYER_STARTER
	thumb_func_end GetStarterFromScriptState

	thumb_func_start DPPtLeftover_GetRivalSpecies
DPPtLeftover_GetRivalSpecies: ; 0x02066B00
	; This will always return Turtwig
	push {r3, lr}
	ldr r1, _02066B20 ; =VAR_PLAYER_STARTER
	bl GetScriptVar
	ldr r2, _02066B24 ; =SPECIES_TURTWIG
	cmp r0, r2
	bne _02066B12
	add r2, r2, #3 ; SPECIES_CHIMCHAR
	b _02066B1A
_02066B12:
	add r1, r2, #3 ; SPECIES_CHIMCHAR
	cmp r0, r1
	bne _02066B1A
	add r2, r2, #6 ; SPECIES_PIPLUP
_02066B1A:
	add r0, r2, #0
	pop {r3, pc}
	nop
_02066B20: .word VAR_PLAYER_STARTER
_02066B24: .word SPECIES_TURTWIG
	thumb_func_end DPPtLeftover_GetRivalSpecies

	thumb_func_start DPPtLeftover_GetFriendStarterSpecies
DPPtLeftover_GetFriendStarterSpecies: ; 0x02066B28
	; This will always return Chimchar
	push {r3, lr}
	ldr r1, _02066B48 ; =VAR_PLAYER_STARTER
	bl GetScriptVar
	ldr r2, _02066B4C ; =SPECIES_TURTWIG
	cmp r0, r2
	bne _02066B3A
	add r2, r2, #6 ; SPECIES_PIPLUP
	b _02066B42
_02066B3A:
	add r1, r2, #3 ; SPECIES_CHIMCHAR
	cmp r0, r1
	beq _02066B42
	add r2, r2, #3 ; SPECIES_CHIMCHAR
_02066B42:
	add r0, r2, #0
	pop {r3, pc}
	nop
_02066B48: .word VAR_PLAYER_STARTER
_02066B4C: .word SPECIES_TURTWIG
	thumb_func_end DPPtLeftover_GetFriendStarterSpecies

	thumb_func_start ScriptState_GetFishingCompetitionLengthRecord
ScriptState_GetFishingCompetitionLengthRecord: ; 0x02066B50
	ldr r3, _02066B58 ; =GetScriptVar
	ldr r1, _02066B5C ; =VAR_MAGIKARP_SIZE_RECORD
	bx r3
	nop
_02066B58: .word GetScriptVar
_02066B5C: .word VAR_MAGIKARP_SIZE_RECORD
	thumb_func_end ScriptState_GetFishingCompetitionLengthRecord

	thumb_func_start ScriptState_SetFishingCompetitionLengthRecord
ScriptState_SetFishingCompetitionLengthRecord: ; 0x02066B60
	ldr r3, _02066B68 ; =SetScriptVar
	add r2, r1, #0
	ldr r1, _02066B6C ; =VAR_MAGIKARP_SIZE_RECORD
	bx r3
	.balign 4, 0
_02066B68: .word SetScriptVar
_02066B6C: .word VAR_MAGIKARP_SIZE_RECORD
	thumb_func_end ScriptState_SetFishingCompetitionLengthRecord

	thumb_func_start sub_02066B70
sub_02066B70: ; 0x02066B70
	ldr r3, _02066B78 ; =GetScriptVar
	ldr r1, _02066B7C ; =VAR_UNK_403E
	bx r3
	nop
_02066B78: .word GetScriptVar
_02066B7C: .word VAR_UNK_403E
	thumb_func_end sub_02066B70

	thumb_func_start sub_02066B80
sub_02066B80: ; 0x02066B80
	push {r4, lr}
	add r4, r0, #0
	bmi _02066B8A
	cmp r4, #2
	blo _02066B8E
_02066B8A:
	bl GF_AssertFail
_02066B8E:
	ldr r0, _02066B98 ; =_020FE4A4
	lsl r1, r4, #1
	ldrh r0, [r0, r1]
	pop {r4, pc}
	nop
_02066B98: .word _020FE4A4
	thumb_func_end sub_02066B80

	thumb_func_start sub_02066B9C
sub_02066B9C: ; 0x02066B9C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02066B80
	ldr r1, _02066BBC ; =VAR_UNK_4043
	add r2, r0, #0
	add r1, r4, r1
	lsl r1, r1, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl SetScriptVar
	pop {r3, r4, r5, pc}
	nop
_02066BBC: .word VAR_UNK_4043
	thumb_func_end sub_02066B9C

	thumb_func_start sub_02066BC0
sub_02066BC0: ; 0x02066BC0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _02066BE4 ; =VAR_UNK_4043
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl GetScriptVar
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02066B80
	cmp r5, r0
	bne _02066BE0
	mov r0, #1
	pop {r3, r4, r5, pc}
_02066BE0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02066BE4: .word VAR_UNK_4043
	thumb_func_end sub_02066BC0

	thumb_func_start sub_02066BE8
sub_02066BE8: ; 0x02066BE8
	push {r3, lr}
	cmp r1, #4
	bhs _02066BFA
	ldr r3, _02066BFC ; =VAR_UNK_4045
	add r1, r1, r3
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl SetScriptVar
_02066BFA:
	pop {r3, pc}
	.balign 4, 0
_02066BFC: .word VAR_UNK_4045
	thumb_func_end sub_02066BE8

	thumb_func_start sub_02066C00
sub_02066C00: ; 0x02066C00
	push {r4, lr}
	add r4, r0, #0
	bmi _02066C0A
	cmp r4, #4
	blt _02066C0E
_02066C0A:
	bl GF_AssertFail
_02066C0E:
	ldr r0, _02066C18 ; =_020FE4A8
	lsl r1, r4, #1
	ldrh r0, [r0, r1]
	pop {r4, pc}
	nop
_02066C18: .word _020FE4A8
	thumb_func_end sub_02066C00

	thumb_func_start sub_02066C1C
sub_02066C1C: ; 0x02066C1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bmi _02066C28
	cmp r4, #4
	blt _02066C2C
_02066C28:
	bl GF_AssertFail
_02066C2C:
	add r0, r4, #0
	bl sub_02066C00
	add r2, r0, #0
	ldr r1, _02066C48 ; =VAR_UNK_4036
	lsl r2, r2, #0x10
	add r1, r4, r1
	lsl r1, r1, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl SetScriptVar
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02066C48: .word VAR_UNK_4036
	thumb_func_end sub_02066C1C

	thumb_func_start sub_02066C4C
sub_02066C4C: ; 0x02066C4C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bmi _02066C58
	cmp r4, #4
	blt _02066C5C
_02066C58:
	bl GF_AssertFail
_02066C5C:
	ldr r1, _02066C70 ; =VAR_UNK_4036
	add r0, r5, #0
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	mov r2, #0
	bl SetScriptVar
	pop {r3, r4, r5, pc}
	nop
_02066C70: .word VAR_UNK_4036
	thumb_func_end sub_02066C4C

	thumb_func_start sub_02066C74
sub_02066C74: ; 0x02066C74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bmi _02066C80
	cmp r4, #4
	blt _02066C84
_02066C80:
	bl GF_AssertFail
_02066C84:
	ldr r1, _02066CA8 ; =VAR_UNK_4036
	add r0, r5, #0
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl GetScriptVar
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02066C00
	cmp r5, r0
	bne _02066CA2
	mov r0, #1
	pop {r3, r4, r5, pc}
_02066CA2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02066CA8: .word VAR_UNK_4036
	thumb_func_end sub_02066C74

	thumb_func_start sub_02066CAC
sub_02066CAC: ; 0x02066CAC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	lsl r2, r4, #0x10
	ldr r1, _02066CCC ; =VAR_LOTO_NUMBER_LO
	lsr r2, r2, #0x10
	add r5, r0, #0
	bl SetScriptVar
	lsr r2, r4, #0x10
	lsl r2, r2, #0x10
	.ifdef BUGFIX_LOTO_NUMBER_HI
	ldr r1, _pool_VAR_LOTO_NUMBER_HI ; =VAR_LOTO_NUMBER_HI
	.else
	ldr r1, _02066CCC ; =VAR_LOTO_NUMBER_LO ; bug: supposed to be VAR_LOTO_NUMBER_HI
	.endif
	add r0, r5, #0
	lsr r2, r2, #0x10
	bl SetScriptVar
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02066CCC: .word VAR_LOTO_NUMBER_LO
	.ifdef BUGFIX_LOTO_NUMBER_HI
_pool_VAR_LOTO_NUMBER_HI: .word VAR_LOTO_NUMBER_HI
	.endif
	thumb_func_end sub_02066CAC

	thumb_func_start ScriptState_GetLotoId
ScriptState_GetLotoId: ; 0x02066CD0
	push {r3, r4, r5, lr}
	ldr r1, _02066CEC ; =VAR_LOTO_NUMBER_LO
	add r5, r0, #0
	bl GetScriptVar
	add r4, r0, #0
	ldr r1, _02066CF0 ; =VAR_LOTO_NUMBER_HI
	add r0, r5, #0
	bl GetScriptVar
	lsl r0, r0, #0x10
	orr r0, r4
	pop {r3, r4, r5, pc}
	nop
_02066CEC: .word VAR_LOTO_NUMBER_LO
_02066CF0: .word VAR_LOTO_NUMBER_HI
	thumb_func_end ScriptState_GetLotoId

	thumb_func_start ScriptState_RollLotoId
ScriptState_RollLotoId: ; 0x02066CF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl LCRandom
	add r4, r0, #0
	bl LCRandom
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r5, #0
	orr r1, r4
	bl sub_02066CAC
	pop {r3, r4, r5, pc}
	thumb_func_end ScriptState_RollLotoId

	thumb_func_start Save_LCRNGAdvanceLotoID
Save_LCRNGAdvanceLotoID: ; 0x02066D10
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl SavArray_Flags_get
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0202C854
	bl sub_0202C7DC
	add r2, r0, #0
	ldr r1, _02066D38 ; =0x41C64E6D
	add r0, r4, #0
	mul r2, r1
	ldr r1, _02066D3C ; =0x00003039
	add r1, r2, r1
	bl sub_02066CAC
	pop {r3, r4, r5, pc}
	nop
_02066D38: .word 0x41C64E6D
_02066D3C: .word 0x00003039
	thumb_func_end Save_LCRNGAdvanceLotoID

	thumb_func_start sub_02066D40
sub_02066D40: ; 0x02066D40
	ldr r3, _02066D48 ; =GetScriptVar
	ldr r1, _02066D4C ; =VAR_UNK_4041
	bx r3
	nop
_02066D48: .word GetScriptVar
_02066D4C: .word VAR_UNK_4041
	thumb_func_end sub_02066D40

	thumb_func_start sub_02066D50
sub_02066D50: ; 0x02066D50
	ldr r3, _02066D58 ; =SetScriptVar
	add r2, r1, #0
	ldr r1, _02066D5C ; =VAR_UNK_4041
	bx r3
	.balign 4, 0
_02066D58: .word SetScriptVar
_02066D5C: .word VAR_UNK_4041
	thumb_func_end sub_02066D50

	thumb_func_start sub_02066D60
sub_02066D60: ; 0x02066D60
	push {r4, lr}
	bl SavArray_Flags_get
	add r4, r0, #0
	bl LCRandom
	mov r1, #0x62
	bl _s32_div_f
	add r1, r1, #2
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl sub_02066D50
	pop {r4, pc}
	thumb_func_end sub_02066D60

	thumb_func_start sub_02066D80
sub_02066D80: ; 0x02066D80
	push {r4, lr}
	ldr r1, _02066DA0 ; =VAR_UNK_4042
	add r4, r0, #0
	bl GetScriptVar
	ldr r2, _02066DA4 ; =0x00002710
	cmp r0, r2
	bhs _02066D96
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
_02066D96:
	ldr r1, _02066DA0 ; =VAR_UNK_4042
	add r0, r4, #0
	bl SetScriptVar
	pop {r4, pc}
	.balign 4, 0
_02066DA0: .word VAR_UNK_4042
_02066DA4: .word 0x00002710
	thumb_func_end sub_02066D80

	thumb_func_start sub_02066DA8
sub_02066DA8: ; 0x02066DA8
	ldr r3, _02066DB0 ; =GetScriptVar
	ldr r1, _02066DB4 ; =VAR_UNK_4042
	bx r3
	nop
_02066DB0: .word GetScriptVar
_02066DB4: .word VAR_UNK_4042
	thumb_func_end sub_02066DA8

	thumb_func_start sub_02066DB8
sub_02066DB8: ; 0x02066DB8
	ldr r3, _02066DC0 ; =GetScriptVar
	ldr r1, _02066DC4 ; =VAR_UNK_404B
	bx r3
	nop
_02066DC0: .word GetScriptVar
_02066DC4: .word VAR_UNK_404B
	thumb_func_end sub_02066DB8

	thumb_func_start sub_02066DC8
sub_02066DC8: ; 0x02066DC8
	ldr r3, _02066DD0 ; =SetScriptVar
	add r2, r1, #0
	ldr r1, _02066DD4 ; =VAR_UNK_404B
	bx r3
	.balign 4, 0
_02066DD0: .word SetScriptVar
_02066DD4: .word VAR_UNK_404B
	thumb_func_end sub_02066DC8

	thumb_func_start sub_02066DD8
sub_02066DD8: ; 0x02066DD8
	ldr r3, _02066DE0 ; =GetScriptVar
	ldr r1, _02066DE4 ; =VAR_BATTLE_FACTORY_PRINT_PROGRESS
	bx r3
	nop
_02066DE0: .word GetScriptVar
_02066DE4: .word VAR_BATTLE_FACTORY_PRINT_PROGRESS
	thumb_func_end sub_02066DD8

	thumb_func_start sub_02066DE8
sub_02066DE8: ; 0x02066DE8
	ldr r3, _02066DF0 ; =GetScriptVar
	ldr r1, _02066DF4 ; =VAR_BATTLE_HALL_PRINT_PROGRESS
	bx r3
	nop
_02066DF0: .word GetScriptVar
_02066DF4: .word VAR_BATTLE_HALL_PRINT_PROGRESS
	thumb_func_end sub_02066DE8

	thumb_func_start sub_02066DF8
sub_02066DF8: ; 0x02066DF8
	ldr r3, _02066E00 ; =GetScriptVar
	ldr r1, _02066E04 ; =VAR_BATTLE_CASTLE_PRINT_PROGRESS
	bx r3
	nop
_02066E00: .word GetScriptVar
_02066E04: .word VAR_BATTLE_CASTLE_PRINT_PROGRESS
	thumb_func_end sub_02066DF8

	thumb_func_start sub_02066E08
sub_02066E08: ; 0x02066E08
	ldr r3, _02066E10 ; =GetScriptVar
	ldr r1, _02066E14 ; =VAR_BATTLE_ARCADE_PRINT_PROGRESS
	bx r3
	nop
_02066E10: .word GetScriptVar
_02066E14: .word VAR_BATTLE_ARCADE_PRINT_PROGRESS
	thumb_func_end sub_02066E08

	thumb_func_start sub_02066E18
sub_02066E18: ; 0x02066E18
	ldr r3, _02066E20 ; =GetScriptVar
	ldr r1, _02066E24 ; =VAR_BATTLE_TOWER_PRINT_PROGRESS
	bx r3
	nop
_02066E20: .word GetScriptVar
_02066E24: .word VAR_BATTLE_TOWER_PRINT_PROGRESS
	thumb_func_end sub_02066E18

	thumb_func_start sub_02066E28
sub_02066E28: ; 0x02066E28
	ldr r3, _02066E30 ; =GetScriptVar
	ldr r1, _02066E34 ; =VAR_UNK_404C
	bx r3
	nop
_02066E30: .word GetScriptVar
_02066E34: .word VAR_UNK_404C
	thumb_func_end sub_02066E28

	thumb_func_start sub_02066E38
sub_02066E38: ; 0x02066E38
	ldr r3, _02066E40 ; =SetScriptVar
	add r2, r1, #0
	ldr r1, _02066E44 ; =VAR_UNK_404C
	bx r3
	.balign 4, 0
_02066E40: .word SetScriptVar
_02066E44: .word VAR_UNK_404C
	thumb_func_end sub_02066E38

	thumb_func_start sub_02066E48
sub_02066E48: ; 0x02066E48
	ldr r3, _02066E50 ; =GetScriptVar
	ldr r1, _02066E54 ; =VAR_UNK_4052
	bx r3
	nop
_02066E50: .word GetScriptVar
_02066E54: .word VAR_UNK_4052
	thumb_func_end sub_02066E48

	thumb_func_start sub_02066E58
sub_02066E58: ; 0x02066E58
	push {r3, lr}
	ldr r1, _02066E70 ; =VAR_UNK_4077
	bl GetScriptVar
	cmp r0, #2
	blo _02066E68
	cmp r0, #4
	bls _02066E6C
_02066E68:
	mov r0, #0
	pop {r3, pc}
_02066E6C:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02066E70: .word VAR_UNK_4077
	thumb_func_end sub_02066E58

	thumb_func_start sub_02066E74
sub_02066E74: ; 0x02066E74
	ldr r3, _02066E7C ; =GetScriptVar
	ldr r1, _02066E80 ; =VAR_UNK_4057
	bx r3
	nop
_02066E7C: .word GetScriptVar
_02066E80: .word VAR_UNK_4057
	thumb_func_end sub_02066E74

	thumb_func_start sub_02066E84
sub_02066E84: ; 0x02066E84
	ldr r3, _02066E8C ; =SetScriptVar
	add r2, r1, #0
	ldr r1, _02066E90 ; =VAR_UNK_4057
	bx r3
	.balign 4, 0
_02066E8C: .word SetScriptVar
_02066E90: .word VAR_UNK_4057
	thumb_func_end sub_02066E84

	thumb_func_start sub_02066E94
sub_02066E94: ; 0x02066E94
	push {r3, r4, r5, lr}
	ldr r1, _02066EC8 ; =VAR_UNK_4033
	add r5, r0, #0
	bl GetScriptVar
	add r4, r0, #0
	bl LCRandom
	mov r1, #0x1e
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r2, r0, #0x10
	cmp r4, r2
	bne _02066EBE
	add r0, r2, #1
	mov r1, #0x1e
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r2, r0, #0x10
_02066EBE:
	ldr r1, _02066EC8 ; =VAR_UNK_4033
	add r0, r5, #0
	bl SetScriptVar
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02066EC8: .word VAR_UNK_4033
	thumb_func_end sub_02066E94

	thumb_func_start sub_02066ECC
sub_02066ECC: ; 0x02066ECC
	ldr r3, _02066ED4 ; =GetScriptVar
	ldr r1, _02066ED8 ; =VAR_UNK_4033
	bx r3
	nop
_02066ED4: .word GetScriptVar
_02066ED8: .word VAR_UNK_4033
	thumb_func_end sub_02066ECC

	.rodata

	.balign 4, 0
_020FE4A4:
	.short 0x06F2, 0xAD7C
_020FE4A8:
	.short 0x6208
	.short 0xF229
	.short 0x0382
	.short 0x1228
