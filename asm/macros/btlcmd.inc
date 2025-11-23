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
    .long BTLCMD_PLAY_ENCOUNTER_ANIMATION
    .endm

    .macro SetPokemonEncounter battler
    .long BTLCMD_SET_POKEMON_ENCOUNTER
    .long \battler
    .endm

    .macro PokemonSlideIn battler
    .long BTLCMD_POKEMON_SLIDE_IN
    .long \battler
    .endm

    .macro PokemonSendOut battler
    .long BTLCMD_POKEMON_SEND_OUT
    .long \battler
    .endm

    .macro RecallPokemon battler
    .long BTLCMD_RECALL_POKEMON
    .long \battler
    .endm

    .macro DeletePokemon battler
    .long BTLCMD_DELETE_POKEMON
    .long \battler
    .endm

    .macro SetTrainerEncounter battler
    .long BTLCMD_SET_TRAINER_ENCOUNTER
    .long \battler
    .endm

    .macro ThrowPokeball battler, type
    .long BTLCMD_THROW_POKEBALL
    .long \battler
    .long \type
    .endm

    .macro TrainerSlideOut battler
    .long BTLCMD_TRAINER_SLIDE_OUT
    .long \battler
    .endm

    .macro TrainerSlideIn battler, pos
    .long BTLCMD_TRAINER_SLIDE_IN
    .long \battler
    .long \pos
    .endm

    .macro BackgroundSlideIn
    .long BTLCMD_BACKGROUND_SLIDE_IN
    .endm

    .macro HealthbarSlideIn battler
    .long BTLCMD_HEALTHBAR_SLIDE_IN
    .long \battler
    .endm

    .macro HealthbarSlideInDelay battler
    .long BTLCMD_HEALTHBAR_SLIDE_IN_DELAY
    .long \battler
    .endm

    .macro HealthbarSlideOut battler
    .long BTLCMD_HEALTHBAR_SLIDE_OUT
    .long \battler
    .endm

    .macro Wait
    .long BTLCMD_WAIT
    .endm

    .macro CalcDamage
    .long BTLCMD_CALC_DAMAGE
    .endm

    .macro CalcMaxDamage
    .long BTLCMD_CALC_MAX_DAMAGE
    .endm

    .macro PrintAttackMessage
    .long BTLCMD_PRINT_ATTACK_MESSAGE
    .endm

    .macro PrintMessage msg_id, tag, arg_0, arg_1, arg_2, arg_3, arg_4, arg_5
    .long BTLCMD_PRINT_MESSAGE
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
    .long BTLCMD_PRINT_GLOBAL_MESSAGE
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
    .long BTLCMD_PRINT_BUFFERED_MESSAGE
    .endm

    .macro BufferMessage msg_id, tag, arg_0, arg_1, arg_2, arg_3, arg_4, arg_5
    .long BTLCMD_BUFFER_MESSAGE
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
    .long BTLCMD_BUFFER_LOCAL_MESSAGE
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
    .long BTLCMD_PLAY_MOVE_ANIMATION
    .long \move_src
    .endm

    .macro PlayMoveAnimationOnMons move_src, attacker, defender
    .long BTLCMD_PLAY_MOVE_ANIMATION_ON_MONS
    .long \move_src
    .long \attacker
    .long \defender
    .endm

    .macro FlickerMon battler
    .long BTLCMD_FLICKER_MON
    .long \battler
    .endm

    .macro UpdateHealthBarValue battler
    .long BTLCMD_UPDATE_HEALTHBAR_VALUE
    .long \battler
    .endm

    .macro UpdateHealthBar battler
    .long BTLCMD_UPDATE_HEALTHBAR 
    .long \battler
    .endm

    .macro TryFaintMon battler
    .long BTLCMD_TRY_FAINT_MON
    .long \battler
    .endm

    .macro PlayFaintAnimation
    .long BTLCMD_PLAY_FAINT_ANIMATION
    .endm

    .macro WaitButtonABTime frames
    .long BTLCMD_WAIT_BUTTON_AB_TIME
    .long \frames
    .endm

    .macro PlaySound battler, sdat_id
    .long BTLCMD_PLAY_SOUND
    .long \battler
    .long \sdat_id
    .endm

    .macro CompareVarToValue op, var, val, jump
    .long BTLCMD_COMPARE_VAR_TO_VALUE
    .long \op
    .long \var
    .long \val
    .long (\jump-.) / 4 - 1
    .endm

    .macro CompareMonDataToValue op, battler, param, val, jump
    .long BTLCMD_COMPARE_MON_DATA_TO_VALUE
    .long \op
    .long \battler
    .long \param
    .long \val
    .long (\jump-.) / 4 - 1
    .endm

    .macro FadeOutBattle
    .long BTLCMD_FADE_OUT_BATTLE
    .endm

    .macro GoToSubscript subscript
    .long BTLCMD_GOTO_SUBSCRIPT
    .long \subscript
    .endm

    .macro GoToEffectScript
    .long BTLCMD_GOTO_EFFECT_SCRIPT
    .endm

    .macro GoToMoveScript is_target_set
    .long BTLCMD_GOTO_MOVE_SCRIPT
    .long \is_target_set
    .endm

    .macro CalcCrit
    .long BTLCMD_CALC_CRIT
    .endm

    .macro CalcExpGain jump
    .long BTLCMD_CALC_EXP_GAIN
    .long (\jump-.) / 4 - 1
    .endm

    .macro StartGetExpTask
    .long BTLCMD_START_GET_EXP_TASK
    .endm

    .macro WaitGetExpTask
    .long BTLCMD_WAIT_GET_EXP_TASK
    .endm

    .macro WaitGetExpTaskLoop unused
    .long BTLCMD_WAIT_GET_EXP_TASK_LOOP
    .long \unused
    .endm

    .macro ShowParty
    .long BTLCMD_SHOW_PARTY
    .endm

    .macro WaitMonSelection
    .long BTLCMD_WAIT_MON_SELECTION
    .endm

    .macro SwitchAndUpdateMon battler
    .long BTLCMD_SWITCH_AND_UPDATE_MON
    .long \battler
    .endm

    .macro GoToIfAnySwitches jump
    .long BTLCMD_GOTO_IF_ANY_SWITCHES
    .long (\jump-.) / 4 - 1
    .endm

    .macro StartCatchMonTask is_safari_capture
    .long BTLCMD_START_CATCH_MON_TASK
    .long \is_safari_capture
    .endm

    .macro WaitCatchMonTask
    .long BTLCMD_WAIT_CATCH_MON_TASK
    .endm

    .macro SetMultiHit hits, flags
    .long BTLCMD_SET_MULTI_HIT
    .long \hits
    .long \flags
    .endm

    .macro UpdateVar op, var, val
    .long BTLCMD_UPDATE_VAR
    .long \op
    .long \var
    .long \val
    .endm

    .macro ChangeStatStage jump_no_change, jump_blocked, jump_substitute
    .long BTLCMD_CHANGE_STAT_STAGE
    .long (\jump_no_change-.) / 4 - 3
    .long (\jump_blocked-.) / 4 - 2
    .long (\jump_substitute-.) / 4 - 1
    .endm

    .macro UpdateMonData op, battler, param, val
    .long BTLCMD_UPDATE_MON_DATA
    .long \op
    .long \battler
    .long \param
    .long \val
    .endm

    .macro ClearVolatileStatus battler, status
    .long BTLCMD_CLEAR_VOLATILE_STATUS
    .long \battler
    .long \status
    .endm

    .macro ToggleVanish battler, toggle
    .long BTLCMD_TOGGLE_VANISH
    .long \battler
    .long \toggle
    .endm

    .macro CheckAbility op, battler, ability, jump
    .long BTLCMD_CHECK_ABILITY
    .long \op
    .long \battler
    .long \ability
    .long (\jump-.) / 4 - 1
    .endm

    .macro Random upper_bound, offset
    .long BTLCMD_RANDOM
    .long \upper_bound
    .long \offset
    .endm

    .macro UpdateVarFromVar op, dst, src
    .long BTLCMD_UPDATE_VAR_FROM_VAR
    .long \op
    .long \dst
    .long \src
    .endm

    .macro UpdateMonDataFromVar op, battler, dst, src
    .long BTLCMD_UPDATE_MON_DATA_FROM_VAR
    .long \op
    .long \battler
    .long \dst
    .long \src
    .endm

    .macro GoTo jump
    .long BTLCMD_GOTO
    .long (\jump-.) / 4 - 1
    .endm

    .macro Call subscript
    .long BTLCMD_CALL
    .long \subscript
    .endm

    .macro CallFromVar var
    .long BTLCMD_CALL_FROM_VAR
    .long \var
    .endm

    .macro SetMirrorMove
    .long BTLCMD_SET_MIRROR_MOVE
    .endm

    .macro ResetAllStatChanges
    .long BTLCMD_RESET_ALL_STAT_CHANGES
    .endm

    .macro LockMoveChoice battler
    .long BTLCMD_LOCK_MOVE_CHOICE
    .long \battler
    .endm

    .macro UnlockMoveChoice battler
    .long BTLCMD_UNLOCK_MOVE_CHOICE
    .long \battler
    .endm

    .macro SetHealthbarStatus battler, status
    .long BTLCMD_SET_HEALTHBAR_STATUS
    .long \battler
    .long \status
    .endm

    .macro PrintTrainerMessage battler, type
    .long BTLCMD_PRINT_TRAINER_MESSAGE
    .long \battler
    .long \type
    .endm

    .macro PayPrizeMoney
    .long BTLCMD_PAY_PRIZE_MONEY
    .endm

    .macro PlayBattleAnimation battler, animation
    .long BTLCMD_PLAY_BATTLE_ANIMATION
    .long \battler
    .long \animation
    .endm

    .macro PlayBattleAnimationOnMons attacker, defender, animation
    .long BTLCMD_PLAY_BATTLE_ANIMATION_ON_MONS
    .long \attacker
    .long \defender
    .long \animation
    .endm

    .macro PlayBattleAnimationFromVar battler, var
    .long BTLCMD_PLAY_BATTLE_ANIMATION_FROM_VAR
    .long \battler
    .long \var
    .endm

    .macro PrintRecallMessage battler
    .long BTLCMD_PRINT_RECALL_MESSAGE
    .long \battler
    .endm

    .macro PrintSendOutMessage battler
    .long BTLCMD_PRINT_SEND_OUT_MESSAGE
    .long \battler
    .endm

    .macro PrintEncounterMessage battler
    .long BTLCMD_PRINT_ENCOUNTER_MESSAGE
    .long \battler
    .endm

    .macro PrintFirstSendOutMessage battler
    .long BTLCMD_PRINT_FIRST_SEND_OUT_MESSAGE
    .long \battler
    .endm

    .macro PrintBufferedTrainerMessage battler
    .long BTLCMD_PRINT_BUFFERED_TRAINER_MESSAGE
    .long \battler
    .endm

    .macro TryConversion jump_if_fail
    .long BTLCMD_TRY_CONVERSION
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CompareVarToVar op, lhs, rhs, jump
    .long BTLCMD_COMPARE_VAR_TO_VAR
    .long \op
    .long \lhs
    .long \rhs
    .long (\jump-.) / 4 - 1
    .endm

    .macro CompareMonDataToVar op, battler, lhs, rhs, jump
    .long BTLCMD_COMPARE_MON_DATA_TO_VAR
    .long \op
    .long \battler
    .long \lhs
    .long \rhs
    .long (\jump-.) / 4 - 1
    .endm

    .macro AddPayDayMoney
    .long BTLCMD_ADD_PAY_DAY_MONEY
    .endm

    .macro TryLightScreen jump_if_fail
    .long BTLCMD_TRY_LIGHT_SCREEN
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryReflect jump_if_fail
    .long BTLCMD_TRY_REFLECT
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryMist jump_if_fail
    .long BTLCMD_TRY_MIST
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryOHKOMove
    .long BTLCMD_TRY_OHKO_MOVE
    .endm

    .macro DivideVarByValue var, val
    .long BTLCMD_DIVIDE_VAR_BY_VALUE
    .long \var
    .long \val
    .endm

    .macro DivideVarByVar dividend, divisor
    .long BTLCMD_DIVIDE_VAR_BY_VAR
    .long \dividend
    .long \divisor
    .endm

    .macro TryMimic jump_if_fail
    .long BTLCMD_TRY_MIMIC
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro Metronome
    .long BTLCMD_METRONOME
    .endm

    .macro TryDisable jump_if_fail
    .long BTLCMD_TRY_DISABLE
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro Counter
    .long BTLCMD_COUNTER
    .endm

    .macro MirrorCoat
    .long BTLCMD_MIRROR_COAT
    .endm

    .macro TryEncore jump_if_fail
    .long BTLCMD_TRY_ENCORE
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryConversion2 jump_if_fail
    .long BTLCMD_TRY_CONVERSION2
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TrySketch jump_if_fail
    .long BTLCMD_TRY_SKETCH
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TrySleepTalk jump_if_fail
    .long BTLCMD_TRY_SLEEP_TALK
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CalcFlailPower
    .long BTLCMD_CALC_FLAIL_POWER
    .endm

    .macro TrySpite jump_if_fail
    .long BTLCMD_TRY_SPITE
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryPartyStatusRefresh
    .long BTLCMD_TRY_PARTY_STATUS_REFRESH
    .endm

    .macro TryStealItem jump_if_fail, jump_sticky_hold
    .long BTLCMD_TRY_STEAL_ITEM
    .long (\jump_if_fail-.) / 4 - 2
    .long (\jump_sticky_hold-.) / 4 - 1
    .endm

    .macro TryProtection jump_if_fail
    .long BTLCMD_TRY_PROTECTION
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TrySubstitute jump_if_fail
    .long BTLCMD_TRY_SUBSTITUTE
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryWhirlwind jump_if_fail
    .long BTLCMD_TRY_WHIRLWIND
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro Transform
    .long BTLCMD_TRANSFORM
    .endm

    .macro TrySpikes jump_if_fail
    .long BTLCMD_TRY_SPIKES
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CheckSpikes battler, jump_no_spikes
    .long BTLCMD_CHECK_SPIKES
    .long \battler
    .long (\jump_no_spikes-.) / 4 - 1
    .endm

    .macro TryPerishSong jump_if_fail
    .long BTLCMD_TRY_PERISH_SONG
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro GetCurrentTurnOrderIteratorMon dst_var
    .long BTLCMD_GET_CURRENT_TURN_ORDER_ITERATION_MON
    .long \dst_var
    .endm

    .macro GoToIfValidMon var, jump
    .long BTLCMD_GOTO_IF_VALID_MON
    .long \var
    .long (\jump-.) / 4 - 1
    .endm

    .macro EndOfTurnWeatherEffect battler
    .long BTLCMD_END_OF_TURN_WEATHER_EFFECT
    .long \battler
    .endm

    .macro CalcRolloutPower
    .long BTLCMD_CALC_ROLLOUT_POWER
    .endm

    .macro CalcFuryCutterPower
    .long BTLCMD_CALC_FURY_CUTTER_POWER
    .endm

    .macro TryAttract jump_if_fail
    .long BTLCMD_TRY_ATTRACT
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TrySafeguard jump_if_fail
    .long BTLCMD_TRY_SAFEGUARD
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro Present jump_if_heal
    .long BTLCMD_PRESENT
    .long (\jump_if_heal-.) / 4 - 1
    .endm

    .macro CalcMagnitudePower
    .long BTLCMD_CALC_MAGNITUDE_POWER
    .endm

    .macro TryReplaceFaintedMon battler, open_party_list, jump_if_fail
    .long BTLCMD_TRY_REPLACE_FAINTED_MON
    .long \battler
    .long \open_party_list
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro RapidSpin
    .long BTLCMD_RAPID_SPIN
    .endm

    .macro WeatherHPRecovery
    .long BTLCMD_WEATHER_HP_RECOVERY
    .endm

    .macro CalcHiddenPowerParams
    .long BTLCMD_CALC_HIDDEN_POWER_PARAMS
    .endm

    .macro CopyStatStages
    .long BTLCMD_COPY_STAT_STAGES
    .endm

    .macro TryFutureSight jump_if_fail
    .long BTLCMD_TRY_FUTURE_SIGHT
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CheckMoveHit attacker, defender, move_src, jump_if_miss
    .long BTLCMD_CHECK_MOVE_HIT
    .long \attacker
    .long \defender
    .long \move_src
    .long (\jump_if_miss-.) / 4 - 1
    .endm

    .macro TryTeleport jump_if_fail
    .long BTLCMD_TRY_TELEPORT
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro BeatUp
    .long BTLCMD_BEAT_UP
    .endm

    .macro FollowMe
    .long BTLCMD_FOLLOW_ME
    .endm

    .macro TryHelpingHand jump_if_fail
    .long BTLCMD_TRY_HELPING_HAND
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TrySwapItems jump_if_fail, jump_sticky_hold
    .long BTLCMD_TRY_SWAP_ITEMS
    .long (\jump_if_fail-.) / 4 - 2
    .long (\jump_sticky_hold-.) / 4 - 1
    .endm

    .macro TryWish jump_if_fail
    .long BTLCMD_TRY_WISH
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryAssist jump_if_fail
    .long BTLCMD_TRY_ASSIST
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TrySetMagicCoat jump_if_fail
    .long BTLCMD_TRY_SET_MAGIC_COAT
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro MagicCoat
    .long BTLCMD_MAGIC_COAT
    .endm

    .macro CalcRevengePowerMul
    .long BTLCMD_CALC_REVENGE_POWER_MUL
    .endm

    .macro TryBreakScreens jump_no_screens
    .long BTLCMD_TRY_BREAK_SCREENS
    .long (\jump_no_screens-.) / 4 - 1
    .endm

    .macro TryYawn jump_if_fail
    .long BTLCMD_TRY_YAWN
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryKnockOff jump_if_fail
    .long BTLCMD_TRY_KNOCK_OFF
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CalcHPFalloffPower
    .long BTLCMD_CALC_HP_FALLOFF_POWER
    .endm

    .macro TryImprison jump_if_fail
    .long BTLCMD_TRY_IMPRISON
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryGrudge jump_if_fail
    .long BTLCMD_TRY_GRUDGE
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TrySnatch jump_if_fail
    .long BTLCMD_TRY_SNATCH
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CalcWeightBasedPower
    .long BTLCMD_CALC_WEIGHT_BASED_POWER
    .endm

    .macro CalcWeatherBallParams
    .long BTLCMD_CALC_WEATHER_BALL_PARAMS
    .endm

    .macro TryPursuit jump_no_trigger
    .long BTLCMD_TRY_PURSUIT
    .long (\jump_no_trigger-.) / 4 - 1
    .endm

    .macro ApplyTypeEffectiveness
    .long BTLCMD_APPLY_TYPE_EFFECTIVENESS
    .endm

    .macro IfTurnFlag battler, flag, compare_to, jump
    .long BTLCMD_IF_TURN_FLAG
    .long \battler
    .long \flag
    .long \compare_to
    .long (\jump-.) / 4 - 1
    .endm

    .macro SetTurnFlag battler, flag, val
    .long BTLCMD_SET_TURN_FLAG
    .long \battler
    .long \flag
    .long \val
    .endm

    .macro CalcGyroBallPower
    .long BTLCMD_CALC_GYRO_BALL_POWER
    .endm

    .macro TryMetalBurst jump_if_fail
    .long BTLCMD_TRY_METAL_BURST
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CalcPaybackPower
    .long BTLCMD_CALC_P interworking veneersAYBACK_POWER
    .endm

    .macro CalcTrumpCardPower
    .long BTLCMD_CALC_TRUMP_CARD_POWER
    .endm

    .macro CalcWringOutPower
    .long BTLCMD_CALC_WRING_OUT_POWER
    .endm

    .macro TryMeFirst jump_if_fail
    .long BTLCMD_TRY_ME_FIRST
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryCopycat jump_if_fail
    .long BTLCMD_TRY_COPYCAT
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CalcPunishmentPower
    .long BTLCMD_CALC_PUNISHMENT_POWER
    .endm

    .macro TrySuckerPunch jump_if_fail
    .long BTLCMD_TRY_SUCKER_PUNCH
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CheckSideCondition battler, op, condition, jump
    .long BTLCMD_CHECK_SIDE_CONDITION
    .long \battler
    .long \op
    .long \condition
    .long (\jump-.) / 4 - 1
    .endm

    .macro TryFeint jump_if_fail
    .long BTLCMD_TRY_FEINT
    .long (\jump_if_fail-.) / 4 - 1
    .endm

; TODO: Confirm this is only used by Psycho Shift before renaming
    .macro CheckCanShareStatus jump_if_fail
    .long BTLCMD_TRY_PSYCHO_SHIFT
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryLastResort jump_if_fail
    .long BTLCMD_TRY_LAST_RESORT
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryToxicSpikes jump_if_fail
    .long BTLCMD_TRY_TOXIC_SPIKES
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro CheckToxicSpikes battler, jump_no_spikes
    .long BTLCMD_CHECK_TOXIC_SPIKES
    .long \battler
    .long (\jump_no_spikes-.) / 4 - 1
    .endm

    .macro CheckIgnorableAbility op, battler, ability, jump
    .long BTLCMD_CHECK_IGNORABLE_ABILITY
    .long \op
    .long \battler
    .long \ability
    .long (\jump-.) / 4 - 1
    .endm

    .macro IfSameSide battler_1, battler_2, jump_same_side
    .long BTLCMD_IF_SAME_SIDE
    .long \battler_1
    .long \battler_2
    .long (\jump_same_side-.) / 4 - 1
    .endm

    .macro GenerateEndOfBattleItem
    .long BTLCMD_GENERATE_END_OF_BATTLE_ITEM
    .endm

    .macro TrickRoom
    .long BTLCMD_TRICK_ROOM
    .endm

    .macro IfMovedThisTurn battler, jump
    .long BTLCMD_IF_MOVED_THIS_TURN
    .long \battler
    .long (\jump-.) / 4 - 1
    .endm

    .macro CheckItemHoldEffect op, battler, effect, jump
    .long BTLCMD_CHECK_ITEM_HOLD_EFFECT
    .long \op
    .long \battler
    .long \effect
    .long (\jump-.) / 4 - 1
    .endm

    .macro GetItemHoldEffect battler, dst
    .long BTLCMD_GET_ITEM_HOLD_EFFECT
    .long \battler
    .long \dst
    .endm

    .macro GetItemEffectParam battler, dst
    .long BTLCMD_GET_ITEM_EFFECT_PARAM
    .long \battler
    .long \dst
    .endm

    .macro TryCamouflage jump_if_fail
    .long BTLCMD_TRY_CAMOUFLAGE
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro GetTerrainMove
    .long BTLCMD_GET_TERRAIN_MOVE
    .endm

    .macro GetTerrainSecondaryEffect
    .long BTLCMD_GET_TERRAIN_SECONDARY_EFFECT
    .endm

    .macro CalcNaturalGiftParams jump_if_fail
    .long BTLCMD_CALC_NATURAL_GIFT_PARAMS
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TryPluck jump_sticky_hold, jump_no_effect
    .long BTLCMD_TRY_PLUCK
    .long (\jump_sticky_hold-.) / 4 - 2
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro TryFling jump_no_effect
    .long BTLCMD_TRY_FLING
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro YesNoMenu type
    .long BTLCMD_YES_NO_MENU
    .long \type
    .endm

    .macro WaitYesNoResult jump_yes, jump_no
    .long BTLCMD_WAIT_YES_NO_RESULT
    .long (\jump_yes-.) / 4 - 2
    .long (\jump_no-.) / 4 - 1
    .endm

    .macro ChoosePokemonMenu
    .long BTLCMD_CHOOSE_POKEMON_MENU
    .endm

    .macro WaitPokemonMenuResult jump_cancel
    .long BTLCMD_WAIT_POKEMON_MENU_RESULT
    .long (\jump_cancel-.) / 4 - 1
    .endm

    .macro SetLinkBattleResult
    .long BTLCMD_SET_LINK_BATTLE_RESULT
    .endm

    .macro CheckStealthRock battler, jump_no_rocks
    .long BTLCMD_CHECK_STEALTH_ROCK
    .long \battler
    .long (\jump_no_rocks-.) / 4 - 1
    .endm

    .macro CheckEffectActivation jump_no_effect
    .long BTLCMD_CHECK_EFFECT_ACTIVATION
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro CheckChatterActivation jump_no_effect
    .long BTLCMD_CHECK_CHATTER_ACTIVATION
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro GetCurrentMoveData param
    .long BTLCMD_GET_CURRENT_MOVE_DATA
    .long \param
    .endm

    .macro SetMosaic battler, distortion, delay
    .long BTLCMD_SET_MOSAIC
    .long \battler
    .long \distortion
    .long \delay
    .endm

    .macro ChangeForm battler
    .long BTLCMD_CHANGE_FORM
    .long \battler
    .endm

    .macro SetBattleBackground
    .long BTLCMD_SET_BATTLE_BACKGROUND
    .endm

    .macro UseBagItem battler
    .long BTLCMD_USE_BAG_ITEM
    .long \battler
    .endm

    .macro TryEscape battler, jump_if_fail
    .long BTLCMD_TRY_ESCAPE
    .long \battler
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro ShowBattleStartPartyGauge battler
    .long BTLCMD_SHOW_BATTLE_START_PARTY_GAUGE
    .long \battler
    .endm

    .macro HideBattleStartPartyGauge battler
    .long BTLCMD_HIDE_BATTLE_START_PARTY_GAUGE
    .long \battler
    .endm

    .macro ShowPartyGauge battler
    .long BTLCMD_SHOW_PARTY_GAUGE
    .long \battler
    .endm

    .macro HidePartyGauge battler
    .long BTLCMD_HIDE_PARTY_GAUGE
    .long \battler
    .endm

    .macro LoadPartyGaugeGraphics
    .long BTLCMD_LOAD_PARTY_GAUGE_GRAPHICS
    .endm

    .macro FreePartyGaugeGraphics
    .long BTLCMD_FREE_PARTY_GAUGE_GRAPHICS
    .endm

    .macro IncrementGameStat battler, battler_type, game_stat
    .long BTLCMD_INCREMENT_GAME_STAT
    .long \battler
    .long \battler_type
    .long \game_stat
    .endm

    .macro RestoreSprite battler
    .long BTLCMD_RESTORE_SPRITE
    .long \battler
    .endm

    .macro TriggerAbilityOnHit jump_no_effect
    .long BTLCMD_TRIGGER_ABILITY_ON_HIT
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro SpriteToOAM battler
    .long BTLCMD_SPRITE_TO_OAM
    .long \battler
    .endm

    .macro OAMToSprite battler
    .long BTLCMD_OAM_TO_SPRITE
    .long \battler
    .endm

    .macro CheckBlackOut battler, jump
    .long BTLCMD_CHECK_WHITEOUT
    .long \battler
    .long (\jump-.) / 4 - 1
    .endm

    .macro BoostRandomStatBy2 jump_no_change
    .long BTLCMD_BOOST_RANDOM_STAT_BY_2
    .long (\jump_no_change-.) / 4 - 1
    .endm

    .macro RemoveItem battler
    .long BTLCMD_REMOVE_ITEM
    .long \battler
    .endm

    .macro TryRecycle jump_if_fail
    .long BTLCMD_TRY_RECYCLE
    .long (\jump_if_fail-.) / 4 - 1
    .endm

    .macro TriggerHeldItemOnHit jump_no_effect
    .long BTLCMD_TRIGGER_HELD_ITEM_ON_HIT
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro PrintBattleResultMessage
    .long BTLCMD_PRINT_BATTLE_RESULT_MESSAGE
    .endm

    .macro PrintEscapeMessage
    .long BTLCMD_PRINT_ESCAPE_MESSAGE
    .endm

    .macro PrintForfeitMessage
    .long BTLCMD_PRINT_FORFEIT_MESSAGE
    .endm

    .macro CheckHoldOnWith1HP battler
    .long BTLCMD_CHECK_HOLD_ON_WITH_1HP
    .long \battler
    .endm

    .macro TryRestoreStatusOnSwitch battler, jump_no_effect
    .long BTLCMD_TRY_RESTORE_STATUS_ON_SWITCH
    .long \battler
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro CheckSubstitute battler, jump_sub_active
    .long BTLCMD_CHECK_SUBSTITUTE
    .long \battler
    .long (\jump_sub_active-.) / 4 - 1
    .endm

    .macro CheckIgnoreWeather jump
    .long BTLCMD_CHECK_IGNORE_WEATHER
    .long (\jump-.) / 4 - 1
    .endm

    .macro SetRandomTarget battler
    .long BTLCMD_SET_RANDOM_TARGET
    .long \battler
    .endm

    .macro TriggerHeldItemOnPivotMove jump_no_effect
    .long BTLCMD_TRIGGER_HELD_ITEM_ON_PIVOT_MOVE
    .long (\jump_no_effect-.) / 4 - 1
    .endm

    .macro RefreshSprite battler
    .long BTLCMD_REFRESH_SPRITE
    .long \battler
    .endm

    .macro PlayMoveHitSound battler
    .long BTLCMD_PLAY_MOVE_HIT_SOUND
    .long \battler
    .endm

    .macro PlayBGM battler, sdat_id
    .long BTLCMD_PLAY_BGM
    .long \battler
    .long \sdat_id
    .endm

    .macro CheckSafariGameDone jump_not_over
    .long BTLCMD_CHECK_SAFARI_GAME_DONE
    .long (\jump_not_over-.) / 4 - 1
    .endm

    .macro WaitTime delay
    .long BTLCMD_WAIT_TIME
    .long \delay
    .endm

    .macro CheckCurMoveIsType type, jump
    .long BTLCMD_CHECK_CUR_MOVE_IS_TYPE
    .long \type
    .long (\jump-.) / 4 - 1
    .endm

    .macro LoadArchivedMonData species, form_var, param
    .long BTLCMD_LOAD_ARCHIVED_MON_DATA
    .long \species
    .long \form_var
    .long \param
    .endm

    .macro RefreshMonData battler
    .long BTLCMD_REFRESH_MON_DATA
    .long \battler
    .endm

    .macro COMMAND_DE side, msg
    .long BTLCMD_222
    .long \side
    .long \msg
    .endm

    .macro COMMAND_DF param
    .long BTLCMD_223
    .long \param
    .endm

    .macro End
    .long BTLCMD_END_SCRIPT
    .endm

    .endif // ASM_BATTLE_SCRIPT_INC
