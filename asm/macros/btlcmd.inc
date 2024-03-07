    .ifndef ASM_BATTLE_SCRIPT_INC
    .set ASM_BATTLE_SCRIPT_INC, 1
#define __ASM_PM_

#include "constants/abilities.h"
#include "constants/battle.h"
#include "constants/battle_script.h"
#include "constants/battle_subscript.h"
#include "constants/game_stats.h"
#include "constants/global.h"
#include "constants/items.h"
#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/pokemon.h"
#include "constants/message_tags.h"
#include "constants/moves.h"
#include "constants/opcode.h"
#include "msg/msg_0197.h"

    .equ FALSE 0
    .equ TRUE 1

    .macro PlayEncounterAnimation
    .long 0
    .endm

    .macro SetPokemonEncounter battler
    .long 1
    .long \battler
    .endm

    .macro PokemonSlideIn battler
    .long 2
    .long \battler
    .endm

    .macro PokemonSendOut battler
    .long 3
    .long \battler
    .endm

    .macro RecallPokemon battler
    .long 4
    .long \battler
    .endm

    .macro DeletePokemon battler
    .long 5
    .long \battler
    .endm

    .macro SetTrainerEncounter battler
    .long 6
    .long \battler
    .endm

    .macro ThrowPokeball battler, type
    .long 7
    .long \battler
    .long \type
    .endm

    .macro TrainerSlideOut battler
    .long 8
    .long \battler
    .endm

    .macro TrainerSlideIn battler, pos
    .long 9
    .long \battler
    .long \pos
    .endm

    .macro BackgroundSlideIn
    .long 10
    .endm

    .macro HealthbarSlideIn battler
    .long 11
    .long \battler
    .endm

    .macro HealthbarSlideInDelay battler
    .long 12
    .long \battler
    .endm

    .macro HealthbarSlideOut battler
    .long 13
    .long \battler
    .endm

    .macro Wait
    .long 14
    .endm

    .macro CalcDamage
    .long 15
    .endm

    .macro CalcMaxDamage
    .long 16
    .endm

    .macro PrintAttackMessage
    .long 17
    .endm

    .macro PrintMessage msg_id, tag, arg_0, arg_1, arg_2, arg_3, arg_4, arg_5
    .long 18
    .long \msg_id
    .long \tag
    .if \tag > TAG_NONE
        .long \arg_0
        .if \tag > TAG_TRNAME
            .long \arg_1
            .if \tag > TAG_TRCLASS_TRNAME
                .long \arg_2
                .if \tag > TAG_TRCLASS_TRNAME_ITEM
                    .long \arg_3
                    .if \tag > TAG_TRCLASS_TRNAME_TRCLASS_TRNAME
                        .long \arg_4
                        .long \arg_5
                    .endif
                .endif
            .endif
        .endif
    .endif
    .endm

    .macro PrintGlobalMessage msg_id, tag, arg_0, arg_1, arg_2, arg_3, arg_4, arg_5
    .long 19
    .long \msg_id
    .long \tag
    .if \tag > TAG_NONE
        .long \arg_0
        .if \tag > TAG_TRNAME
            .long \arg_1
            .if \tag > TAG_TRCLASS_TRNAME
                .long \arg_2
                .if \tag > TAG_TRCLASS_TRNAME_ITEM
                    .long \arg_3
                    .if \tag > TAG_TRCLASS_TRNAME_TRCLASS_TRNAME
                        .long \arg_4
                        .long \arg_5
                    .endif
                .endif
            .endif
        .endif
    .endif
    .endm

    .macro PrintBufferedMessage
    .long 20
    .endm

    .macro BufferMessage msg_id, tag, arg_0, arg_1, arg_2, arg_3, arg_4, arg_5
    .long 21
    .long \msg_id
    .long \tag
    .if \tag > TAG_NONE
        .long \arg_0
        .if \tag > TAG_TRNAME
            .long \arg_1
            .if \tag > TAG_TRCLASS_TRNAME
                .long \arg_2
                .if \tag > TAG_TRCLASS_TRNAME_ITEM
                    .long \arg_3
                    .if \tag > TAG_TRCLASS_TRNAME_TRCLASS_TRNAME
                        .long \arg_4
                        .long \arg_5
                    .endif
                .endif
            .endif
        .endif
    .endif
    .endm

    .macro BufferLocalMessage battler, msg_id, tag, arg_0, arg_1, arg_2, arg_3, arg_4, arg_5
    .long 22
    .long \battler
    .long \msg_id
    .long \tag
    .if \tag > TAG_NONE
        .long \arg_0
        .if \tag > TAG_TRNAME
            .long \arg_1
            .if \tag > TAG_TRCLASS_TRNAME
                .long \arg_2
                .if \tag > TAG_TRCLASS_TRNAME_ITEM
                    .long \arg_3
                    .if \tag > TAG_TRCLASS_TRNAME_TRCLASS_TRNAME
                        .long \arg_4
                        .long \arg_5
                    .endif
                .endif
            .endif
        .endif
    .endif
    .endm

    .macro PlayMoveAnimation move_src
    .long 23
    .long \move_src
    .endm

    .macro PlayMoveAnimationOnMons move_src, attacker, defender
    .long 24
    .long \move_src
    .long \attacker
    .long \defender
    .endm

    .macro FlickerMon battler
    .long 25
    .long \battler
    .endm

    .macro UpdateHealthBarValue battler
    .long 26
    .long \battler
    .endm

    .macro UpdateHealthBar battler
    .long 27
    .long \battler
    .endm

    .macro TryFaintMon battler
    .long 28
    .long \battler
    .endm

    .macro PlayFaintAnimation
    .long 29
    .endm

    .macro WaitButtonABTime frames
    .long 30
    .long \frames
    .endm

    .macro PlaySound battler, sdat_id
    .long 31
    .long \battler
    .long \sdat_id
    .endm

    .macro CompareVarToValue op, var, val, jump
    .long 32
    .long \op
    .long \var
    .long \val
    .long (\jump-.) / 4 - 1
    .endm

    .macro CompareMonDataToValue op, battler, param, val, jump
    .long 33
    .long \op
    .long \battler
    .long \param
    .long \val
    .long (\jump-.) / 4 - 1
    .endm

    .macro FadeOutBattle
    .long 34
    .endm

    .macro GoToSubscript subscript
    .long 35
    .long \subscript
    .endm

    .macro GoToEffectScript
    .long 36
    .endm

    .macro GoToMoveScript is_target_set
    .long 37
    .long \is_target_set
    .endm

    .macro CalcCrit
    .long 38
    .endm

    .macro CalcExpGain jump
    .long 39
    .long (\jump-.) / 4 - 1
    .endm

    .macro StartGetExpTask
    .long 40
    .endm

    .macro WaitGetExpTask
    .long 41
    .endm

    .macro Dummy2A arg_0
    .long 42
    .long \arg_0
    .endm

    .macro ShowParty
    .long 43
    .endm

    .macro WaitMonSelection
    .long 44
    .endm

    .macro SwitchAndUpdateMon battler
    .long 45
    .long \battler
    .endm

    .macro GoToIfAnySwitches jump
    .long 46
    .long (\jump-.) / 4 - 1
    .endm

    .macro StartCatchMonTask is_safari_capture
    .long 47
    .long \is_safari_capture
    .endm

    .macro WaitCatchMonTask
    .long 48
    .endm

    .macro SetMultiHit hits, flags
    .long 49
    .long \hits
    .long \flags
    .endm

    .macro UpdateVar op, var, val
    .long 50
    .long \op
    .long \var
    .long \val
    .endm

    .macro ChangeStatStage jump_no_change, jump_blocked, jump_substitute
    .long 51
    .long (\jump_no_change-.) / 4 - 3
    .long (\jump_blocked-.) / 4 - 2
    .long (\jump_substitute-.) / 4 - 1
    .endm

    .macro UpdateMonData op, battler, param, val
    .long 52
    .long \op
    .long \battler
    .long \param
    .long \val
    .endm

    .macro ClearVolatileStatus battler, status
    .long 53
    .long \battler
    .long \status
    .endm

    .macro ToggleVanish battler, toggle
    .long 54
    .long \battler
    .long \toggle
    .endm

    .macro CheckAbility op, battler, ability, jump
    .long 55
    .long \op
    .long \battler
    .long \ability
    .long (\jump-.) / 4 - 1
    .endm

    .macro Random upper_bound, offset
    .long 56
    .long \upper_bound
    .long \offset
    .endm

    .macro UpdateVarFromVar op, dst, src
    .long 57
    .long \op
    .long \dst
    .long \src
    .endm

    .macro UpdateMonDataFromVar op, battler, dst, src
    .long 58
    .long \op
    .long \battler
    .long \dst
    .long \src
    .endm

    .macro GoTo jump
    .long 59
    .long (\jump-.) / 4 - 1
    .endm

    .macro Call subscript
    .long 60
    .long \subscript
    .endm

    .macro CallFromVar var
    .long 61
    .long \var
    .endm

    .macro SetMirrorMove
    .long 62
    .endm

    .macro ResetAllStatChanges
    .long 63
    .endm

    .macro LockMoveChoice battler
    .long 64
    .long \battler
    .endm

    .macro UnlockMoveChoice battler
    .long 65
    .long \battler
    .endm

    .macro SetHealthbarStatus battler, status
    .long 66
    .long \battler
    .long \status
    .endm

    .macro PrintTrainerMessage battler, type
    .long 67
    .long \battler
    .long \type
    .endm

    .macro PayPrizeMoney
    .long 68
    .endm

    .macro PlayBattleAnimation battler, animation
    .long 69
    .long \battler
    .long \animation
    .endm

    .macro PlayBattleAnimationOnMons attacker, defender, animation
    .long 70
    .long \attacker
    .long \defender
    .long \animation
    .endm

    .macro PlayBattleAnimationFromVar battler, var
    .long 71
    .long \battler
    .long \var
    .endm

    .macro PrintRecallMessage battler
    .long 72
    .long \battler
    .endm

    .macro PrintSendOutMessage battler
    .long 73
    .long \battler
    .endm

    .macro PrintEncounterMessage battler
    .long 74
    .long \battler
    .endm

    .macro PrintFirstSendOutMessage battler
    .long 75
    .long \battler
    .endm

    .macro PrintBufferedTrainerMessage battler
    .long 76
    .long \battler
    .endm

    .macro TryConversion jump_if_fail
    .long 77
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CompareVarToVar op, lhs, rhs, jump
    .long 78
    .long \op
    .long \lhs
    .long \rhs
    .long (\jump-.) / 4 - 1
    .endm

    .macro CompareMonDataToVar op, battler, lhs, rhs, jump
    .long 79
    .long \op
    .long \battler
    .long \lhs
    .long \rhs
    .long (\jump-.) / 4 - 1
    .endm

    .macro AddPayDayMoney
    .long 80
    .endm

    .macro TryLightScreen jump_if_fail
    .long 81
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryReflect jump_if_fail
    .long 82
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryMist jump_if_fail
    .long 83
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryOHKOMove
    .long 84
    .endm

    .macro DivideVarByValue var, val
    .long 85
    .long \var
    .long \val
    .endm

    .macro DivideVarByVar dividend, divisor
    .long 86
    .long \dividend
    .long \divisor
    .endm

    .macro TryMimic jump_if_fail
    .long 87
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro Metronome
    .long 88
    .endm

    .macro TryDisable jump_if_fail
    .long 89
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro Counter
    .long 90
    .endm

    .macro MirrorCoat
    .long 91
    .endm

    .macro TryEncore jump_if_fail
    .long 92
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryConversion2 jump_if_fail
    .long 93
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TrySketch jump_if_fail
    .long 94
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TrySleepTalk jump_if_fail
    .long 95
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CalcFlailPower
    .long 96
    .endm

    .macro TrySpite jump_if_fail
    .long 97
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryPartyStatusRefresh
    .long 98
    .endm

    .macro TryStealItem jump_if_fail, jump_sticky_hold
    .long 99
    .long (\jump_if_fail-.) / 4 - 2
    .long (\jump_sticky_hold-.) / 4 - 1
    .endm

    .macro TryProtection jump_if_fail
    .long 100
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TrySubstitute jump_if_fail
    .long 101
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryWhirlwind jump_if_fail
    .long 102
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro Transform
    .long 103
    .endm

    .macro TrySpikes jump_if_fail
    .long 104
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CheckSpikes battler, jump_no_spikes
    .long 105
    .long \battler
    .long (\jump_no_spikes-.) / 4 - 1
    .endm

    .macro TryPerishSong jump_if_fail
    .long 106
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro GetMonBySpeedOrder dst_var
    .long 107
    .long \dst_var
    .endm

    .macro GoToIfValidMon var, jump
    .long 108
    .long \var
    .long (\jump-.) / 4 - 1
    .endm

    .macro EndOfTurnWeatherEffect battler
    .long 109
    .long \battler
    .endm

    .macro CalcRolloutPower
    .long 110
    .endm

    .macro CalcFuryCutterPower
    .long 111
    .endm

    .macro TryAttract jump_if_fail
    .long 112
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TrySafeguard jump_if_fail
    .long 113
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro Present jump_if_heal
    .long 114
    .long (\jump_if_heal-.) / 4 - 1
    .endm

    .macro CalcMagnitudePower
    .long 115
    .endm

    .macro TryReplaceFaintedMon battler, open_party_list, jump_if_fail
    .long 116
    .long \battler
    .long \open_party_list
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro RapidSpin
    .long 117
    .endm

    .macro WeatherHPRecovery
    .long 118
    .endm

    .macro CalcHiddenPowerParams
    .long 119
    .endm

    .macro CopyStatStages
    .long 120
    .endm

    .macro TryFutureSight jump_if_fail
    .long 121
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CheckMoveHit attacker, defender, move_src, jump_if_miss
    .long 122
    .long \attacker
    .long \defender
    .long \move_src
    .long (\jump_if_miss-.) / 4 - 1
    .endm

    .macro TryTeleport jump_if_fail
    .long 123
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro BeatUp
    .long 124
    .endm

    .macro FollowMe
    .long 125
    .endm

    .macro TryHelpingHand jump_if_fail
    .long 126
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TrySwapItems jump_if_fail, jump_sticky_hold
    .long 127
    .long (\jump_if_fail-.) / 4 - 2
    .long (\jump_sticky_hold-.) / 4 - 1
    .endm

    .macro TryWish jump_if_fail
    .long 128
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryAssist jump_if_fail
    .long 129
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TrySetMagicCoat jump_if_fail
    .long 130
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro MagicCoat
    .long 131
    .endm

    .macro CalcRevengePowerMul
    .long 132
    .endm

    .macro TryBreakScreens jump_no_screens
    .long 133
    .long (\jump_no_screens-.) / 4 - 1
    .endm

    .macro TryYawn jump_if_fail
    .long 134
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryKnockOff jump_if_fail
    .long 135
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CalcHPFalloffPower
    .long 136
    .endm

    .macro TryImprison jump_if_fail
    .long 137
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryGrudge jump_if_fail
    .long 138
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TrySnatch jump_if_fail
    .long 139
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CalcWeightBasedPower
    .long 140
    .endm

    .macro CalcWeatherBallParams
    .long 141
    .endm

    .macro TryPursuit jump_no_trigger
    .long 142
    .long (\jump_no_trigger-.) / 4 - 1
    .endm

    .macro ApplyTypeEffectiveness
    .long 143
    .endm

    .macro IfTurnFlag battler, flag, compare_to, jump
    .long 144
    .long \battler
    .long \flag
    .long \compare_to
    .long (\jump-.) / 4 - 1
    .endm

    .macro SetTurnFlag battler, flag, val
    .long 145
    .long \battler
    .long \flag
    .long \val
    .endm

    .macro CalcGyroBallPower
    .long 146
    .endm

    .macro TryMetalBurst jump_if_fail
    .long 147
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CalcPaybackPower
    .long 148
    .endm

    .macro CalcTrumpCardPower
    .long 149
    .endm

    .macro CalcWringOutPower
    .long 150
    .endm

    .macro TryMeFirst jump_if_fail
    .long 151
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryCopycat jump_if_fail
    .long 152
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CalcPunishmentPower
    .long 153
    .endm

    .macro TrySuckerPunch jump_if_fail
    .long 154
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CheckSideCondition battler, op, condition, jump
    .long 155
    .long \battler
    .long \op
    .long \condition
    .long (\jump-.) / 4 - 1
    .endm

    .macro TryFeint jump_if_fail
    .long 156
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CheckCanShareStatus jump_if_fail
    .long 157
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryLastResort jump_if_fail
    .long 158
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryToxicSpikes jump_if_fail
    .long 159
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CheckToxicSpikes battler, jump_no_spikes
    .long 160
    .long \battler
    .long (\jump_no_spikes-.) / 4 - 1
    .endm

    .macro CheckIgnorableAbility op, battler, ability, jump
    .long 161
    .long \op
    .long \battler
    .long \ability
    .long (\jump-.) / 4 - 1
    .endm

    .macro IfSameSide battler_1, battler_2, jump_same_side
    .long 162
    .long \battler_1
    .long \battler_2
    .long (\jump_same_side-.) / 4 - 1
    .endm

    .macro GenerateEndOfBattleItem
    .long 163
    .endm

    .macro TrickRoom
    .long 164
    .endm

    .macro IfMovedThisTurn battler, jump
    .long 165
    .long \battler
    .long (\jump-.) / 4 - 1
    .endm

    .macro CheckItemHoldEffect op, battler, effect, jump
    .long 166
    .long \op
    .long \battler
    .long \effect
    .long (\jump-.) / 4 - 1
    .endm

    .macro GetItemHoldEffect battler, dst
    .long 167
    .long \battler
    .long \dst
    .endm

    .macro GetItemEffectParam battler, dst
    .long 168
    .long \battler
    .long \dst
    .endm

    .macro TryCamouflage jump_if_fail
    .long 169
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro GetTerrainMove
    .long 170
    .endm

    .macro GetTerrainSecondaryEffect
    .long 171
    .endm

    .macro CalcNaturalGiftParams jump_if_fail
    .long 172
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryPluck jump_sticky_hold, jump_no_effect
    .long 173
    .long (\jump_sticky_hold-.) / 4 - 2
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro TryFling jump_no_effect
    .long 174
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro YesNoMenu type
    .long 175
    .long \type
    .endm

    .macro WaitYesNoResult jump_yes, jump_no
    .long 176
    .long (\jump_yes-.) / 4 - 2
    .long (\jump_no-.) / 4 - 1
    .endm

    .macro ChoosePokemonMenu
    .long 177
    .endm

    .macro WaitPokemonMenuResult jump_cancel
    .long 178
    .long (\jump_cancel-.) / 4 - 1
    .endm

    .macro SetLinkBattleResult
    .long 179
    .endm

    .macro CheckStealthRock battler, jump_no_rocks
    .long 180
    .long \battler
    .long (\jump_no_rocks-.) / 4 - 1
    .endm

    .macro CheckEffectActivation jump_no_effect
    .long 181
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro CheckChatterActivation jump_no_effect
    .long 182
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro GetCurrentMoveData param
    .long 183
    .long \param
    .endm

    .macro SetMosaic battler, distortion, delay
    .long 184
    .long \battler
    .long \distortion
    .long \delay
    .endm

    .macro ChangeForm battler
    .long 185
    .long \battler
    .endm

    .macro SetBattleBackground
    .long 186
    .endm

    .macro UseBagItem battler
    .long 187
    .long \battler
    .endm

    .macro TryEscape battler, jump_if_fail
    .long 188
    .long \battler
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro ShowBattleStartPartyGauge battler
    .long 189
    .long \battler
    .endm

    .macro HideBattleStartPartyGauge battler
    .long 190
    .long \battler
    .endm

    .macro ShowPartyGauge battler
    .long 191
    .long \battler
    .endm

    .macro HidePartyGauge battler
    .long 192
    .long \battler
    .endm

    .macro LoadPartyGaugeGraphics
    .long 193
    .endm

    .macro FreePartyGaugeGraphics
    .long 194
    .endm

    .macro IncrementGameStat battler, battler_type, game_stat
    .long 195
    .long \battler
    .long \battler_type
    .long \game_stat
    .endm

    .macro RestoreSprite battler
    .long 196
    .long \battler
    .endm

    .macro TriggerAbilityOnHit jump_no_effect
    .long 197
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro SpriteToOAM battler
    .long 198
    .long \battler
    .endm

    .macro OAMToSprite battler
    .long 199
    .long \battler
    .endm

    .macro CheckBlackOut battler, jump
    .long 200
    .long \battler
    .long (\jump-.) / 4 - 1
    .endm

    .macro BoostRandomStatBy2 jump_no_change
    .long 201
    .long (\jump_no_change-.) / 4 - 1
    .endm

    .macro RemoveItem battler
    .long 202
    .long \battler
    .endm

    .macro TryRecycle jump_if_fail
    .long 203
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TriggerHeldItemOnHit jump_no_effect
    .long 204
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro PrintBattleResultMessage
    .long 205
    .endm

    .macro PrintEscapeMessage
    .long 206
    .endm

    .macro PrintForfeitMessage
    .long 207
    .endm

    .macro CheckHoldOnWith1HP battler
    .long 208
    .long \battler
    .endm

    .macro TryRestoreStatusOnSwitch battler, jump_no_effect
    .long 209
    .long \battler
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro CheckSubstitute battler, jump_sub_active
    .long 210
    .long \battler
    .long (\jump_sub_active-.) / 4 - 1
    .endm

    .macro CheckIgnoreWeather jump
    .long 211
    .long (\jump-.) / 4 - 1
    .endm

    .macro SetRandomTarget battler
    .long 212
    .long \battler
    .endm

    .macro TriggerHeldItemOnPivotMove jump_no_effect
    .long 213
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro RefreshSprite battler
    .long 214
    .long \battler
    .endm

    .macro PlayMoveHitSound battler
    .long 215
    .long \battler
    .endm

    .macro PlayBGM battler, sdat_id
    .long 216
    .long \battler
    .long \sdat_id
    .endm

    .macro CheckSafariGameDone jump_not_over
    .long 217
    .long (\jump_not_over-.) / 4 - 1
    .endm

    .macro WaitTime delay
    .long 218
    .long \delay
    .endm

    .macro CheckCurMoveIsType type, jump
    .long 219
    .long \type
    .long (\jump-.) / 4 - 1
    .endm

    .macro LoadArchivedMonData species, form_var, param
    .long 220
    .long \species
    .long \form_var
    .long \param
    .endm

    .macro RefreshMonData battler
    .long 221
    .long \battler
    .endm

    .macro COMMAND_DE side, msg
    .long 222
    .long \side
    .long \msg
    .endm

    .macro COMMAND_DF param
    .long 223
    .long \param
    .endm

    .macro End
    .long 224
    .endm

    .endif // ASM_BATTLE_SCRIPT_INC
