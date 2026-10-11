//
// DO NOT MODIFY THIS FILE! It is auto-generated from files/fielddata/wazaoshie/waza_oshie.json and Inja template files/fielddata/wazaoshie/waza_oshie.json.txt
//

#include "constants/moves.h"

    .macro oshie_begin
    .set _waza_oshie_0, 0
    .set _waza_oshie_1, 0
    .set _waza_oshie_2, 0
    .set _waza_oshie_3, 0
    .set _waza_oshie_4, 0
    .set _waza_oshie_5, 0
    .set _waza_oshie_6, 0
    .set _waza_oshie_7, 0
    .endm

    .macro oshie_add waza
    .if \waza < 8
    .set _waza_oshie_0, _waza_oshie_0 | (1 << (\waza - 0))
    .elseif \waza < 16
    .set _waza_oshie_1, _waza_oshie_1 | (1 << (\waza - 8))
    .elseif \waza < 24
    .set _waza_oshie_2, _waza_oshie_2 | (1 << (\waza - 16))
    .elseif \waza < 32
    .set _waza_oshie_3, _waza_oshie_3 | (1 << (\waza - 24))
    .elseif \waza < 40
    .set _waza_oshie_4, _waza_oshie_4 | (1 << (\waza - 32))
    .elseif \waza < 48
    .set _waza_oshie_5, _waza_oshie_5 | (1 << (\waza - 40))
    .elseif \waza < 56
    .set _waza_oshie_6, _waza_oshie_6 | (1 << (\waza - 48))
    .elseif \waza < 64
    .set _waza_oshie_7, _waza_oshie_7 | (1 << (\waza - 56))
    .else
    .error "Tutor move out of range"
    .endif
    .endm

    .macro oshie_end
    .byte _waza_oshie_0, _waza_oshie_1, _waza_oshie_2, _waza_oshie_3, _waza_oshie_4, _waza_oshie_5, _waza_oshie_6, _waza_oshie_7
    .endm

    .rodata

    .global gMoveTutorMoves
    .type gMoveTutorMoves,@object
gMoveTutorMoves:
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_TAILWIND
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_TAILWIND
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_TAILWIND
    oshie_end
    oshie_begin
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_TAILWIND
    oshie_end
    oshie_begin
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_BLOCK
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_SWIFT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_SWIFT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_BOUNCE
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_SKY_ATTACK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_SKY_ATTACK
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_HEAL_BELL
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_HEAL_BELL
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_TAILWIND
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_end
    oshie_begin
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_PAIN_SPLIT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_PAIN_SPLIT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_SKY_ATTACK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEAL_BELL
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_SKY_ATTACK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEAL_BELL
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_TAILWIND
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SUPER_FANG
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SUPER_FANG
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_HEAL_BELL
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SWIFT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEAL_BELL
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_IRON_DEFENSE
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_SUPER_FANG
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEAL_BELL
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_GRAVITY
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_BLOCK
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_SKY_ATTACK
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SUPER_FANG
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_GASTRO_ACID
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_SKY_ATTACK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_SKY_ATTACK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_VACUUM_WAVE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEAL_BELL
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_BUG_BITE
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_THUNDER_PUNCH
    oshie_add TUTOR_FIRE_PUNCH
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_ICE_PUNCH
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_BLOCK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_PAIN_SPLIT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEAL_BELL
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_HELPING_HAND
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_BOUNCE
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_HEAL_BELL
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_DIVE
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_HEAT_WAVE
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SUPERPOWER
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_KNOCK_OFF
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_ROLE_PLAY
    oshie_add TUTOR_LOW_KICK
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_ROLLOUT
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_ENDEAVOR
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_GUNK_SHOT
    oshie_add TUTOR_IRON_DEFENSE
    oshie_add TUTOR_MAGNET_RISE
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_STRING_SHOT
    oshie_add TUTOR_BUG_BITE
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_FURY_CUTTER
    oshie_add TUTOR_ICY_WIND
    oshie_add TUTOR_IRON_HEAD
    oshie_add TUTOR_AQUA_TAIL
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_OUTRAGE
    oshie_add TUTOR_ANCIENT_POWER
    oshie_add TUTOR_EARTH_POWER
    oshie_add TUTOR_TWISTER
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_GRAVITY
    oshie_add TUTOR_MAGIC_COAT
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_AIR_CUTTER
    oshie_add TUTOR_SYNTHESIS
    oshie_add TUTOR_ZEN_HEADBUTT
    oshie_add TUTOR_SEED_BOMB
    oshie_add TUTOR_LAST_RESORT
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_TAILWIND
    oshie_add TUTOR_WORRY_SEED
    oshie_add TUTOR_HEADBUTT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_end
    oshie_begin
    oshie_add TUTOR_MUD_SLAP
    oshie_add TUTOR_OMINOUS_WIND
    oshie_add TUTOR_SNORE
    oshie_add TUTOR_SPITE
    oshie_add TUTOR_SIGNAL_BEAM
    oshie_add TUTOR_TRICK
    oshie_add TUTOR_SUCKER_PUNCH
    oshie_add TUTOR_SWIFT
    oshie_add TUTOR_UPROAR
    oshie_add TUTOR_PAIN_SPLIT
    oshie_end
    .size gMoveTutorMoves,.-gMoveTutorMoves
