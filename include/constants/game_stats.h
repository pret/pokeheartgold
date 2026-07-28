#ifndef POKEHEARTGOLD_CONSTANTS_GAME_STATS_H
#define POKEHEARTGOLD_CONSTANTS_GAME_STATS_H

#define GAME_STAT_STEPS_WALKED              0
#define GAME_STAT_STEPS_BIKED               1
#define GAME_STAT_SCORE                     2
#define GAME_STAT_BERRIES_PLANTED           5
#define GAME_STAT_UNK6                      6
#define GAME_STAT_WILD_ENCOUNTERS           8
#define GAME_STAT_TRAINER_BATTLES           9
#define GAME_STAT_CAUGHT_MON                10
#define GAME_STAT_FISH_LANDED               11
#define GAME_STAT_EGGS_HATCHED              12
#define GAME_STAT_UNIQUE_MONS_CAUGHT        13  // TODO: Confirm this is just Pokedex completion.
#define GAME_STAT_UNK14                     14
#define GAME_STAT_BATTLE_TOWER_BATTLE_COUNT 16  // TODO: Double check
#define GAME_STAT_UNK17                     17
#define GAME_STAT_LOCAL_LINK_TRADES         20
#define GAME_STAT_LOCAL_LINK_BATTLES        21
#define GAME_STAT_LOCAL_LINK_BATTLE_WINS    22
#define GAME_STAT_LOCAL_LINK_BATTLE_LOSSES  23
#define GAME_STAT_LOCAL_LINK_BATTLE_DRAWS   24  // Includes draws and forfeits.
#define GAME_STAT_WIFI_TRADES               25
#define GAME_STAT_WIFI_BATTLES              26
#define GAME_STAT_WIFI_BATTLE_WINS          27
#define GAME_STAT_WIFI_BATTLE_LOSSES        28
#define GAME_STAT_WIFI_BATTLE_DRAWS         29  // Includes draws and forfeits.
#define GAME_STAT_BATTLE_TOWER_WIN_COUNT    30
#define GAME_STAT_UNK33                     33  // Link related. Probably also Battle Tower related.
#define GAME_STAT_CURRENCY_SPENT            36  // Includes Athlete Points.
#define GAME_STAT_MONS_SENT_TO_DAYCARE      41
#define GAME_STAT_OPPONENT_MON_FAINTED      42
#define GAME_STAT_UNK45                     45  // Relates to overlay 70. Trades of some sort. Possibly in-game trades?
#define GAME_STAT_MAIL_WRITTEN              46
#define GAME_STAT_UNK47                     47  // Related to overlays 45 and 49.
#define GAME_STAT_NICKNAMES_GIVEN           50
#define GAME_STAT_PREMIER_BALLS_EARNED      51
#define GAME_STAT_FRONTIER_PARTICIPATIONS   59
#define GAME_STAT_UNK65                     65  // Frontier related.
#define GAME_STAT_UNK66                     66  // Frontier related.
#define GAME_STAT_BATTLE_POINTS_RECEIVED    69
#define GAME_STAT_BATTLE_POINTS_SPENT       70
#define GAME_STAT_LEAGUE_WINS               74
#define GAME_STAT_SPLASHES                  77
#define GAME_STAT_SELFDESTRUCTS             79
#define GAME_STAT_EXPLOSIONS                80
#define GAME_STAT_LOCAL_CONTEST_ENTRIES     91
#define GAME_STAT_COMM_CONTEST_ENTRIES      92
#define GAME_STAT_LOCAL_CONTEST_WINS        93
#define GAME_STAT_COMM_CONTEST_WINS         94
#define GAME_STAT_RIBBONS_EARNED            95
#define GAME_STAT_INEFFECTIVE_MOVES         96  // Tracks instances where the player uses a move on a type with immunity.
#define GAME_STAT_PLAYER_MON_FAINTED        97
#define GAME_STAT_ALLIES_DAMAGED            98  // Tracks instances of damage dealt to targets on the same side of the field, so may include confusion.
#define GAME_STAT_RUN_FAILURES              99
#define GAME_STAT_WILD_MON_FLED             100
#define GAME_STAT_FISH_GOT_AWAY             101
#define GAME_STAT_UNK114                    114 // Also wifi trades??
#define GAME_STAT_TRAINER_CARDS_SIGNED      115
#define GAME_STAT_FOSSILS_REVIVED           116
#define GAME_STAT_UNK119                    119 // Related to overlays 45 and 49.
#define GAME_STAT_EGGS_SPUN                 120

#define NUM_GAME_STATS_WORD 72
#define NUM_GAME_STATS      149

#define SCORE_EVENT_BERRY_PICKED            0
#define SCORE_EVENT_APRICORN_HARVESTED      1
#define SCORE_EVENT_WROTE_MAIL              2
#define SCORE_EVENT_HAD_INTERVIEW           3
#define SCORE_EVENT_TRAINER_CARD_SIGNED     4
#define SCORE_EVENT_5_UNUSED                5  // Likely for the JP-only slot machines.
#define SCORE_EVENT_VOLTORB_FLIP            6
#define SCORE_EVENT_BALL_CAPSULE_MODIFIED   7
#define SCORE_EVENT_POKEMON_DRESSED         8
#define SCORE_EVENT_WILD_MON_DEFEATED       9
#define SCORE_EVENT_MON_CAUGHT_REGIONAL     10
#define SCORE_EVENT_MON_CAUGHT_NATIONAL     11
#define SCORE_EVENT_TRAINER_DEFEATED        12
#define SCORE_EVENT_POKEATHLON_WON          13
#define SCORE_EVENT_BATTLE_TOWER_SET_WON    14
#define SCORE_EVENT_HATCHED_EGG             15
#define SCORE_EVENT_LINK_TRADE              16
#define SCORE_EVENT_CATCHING_SHOW           17
#define SCORE_EVENT_POKEATHLON_WON_LINK     18
#define SCORE_EVENT_RECORDS_MIXED           19
#define SCORE_EVENT_LINK_BATTLE             20
#define SCORE_EVENT_REGISTER_SPECIES_CAUGHT 21
#define SCORE_EVENT_BADGE_GET               22
#define SCORE_EVENT_LEAGUE_WIN              23
#define SCORE_EVENT_GTS_TRADE               24
#define SCORE_EVENT_REGIONAL_DEX_COMPLETE   25
#define SCORE_EVENT_NATIONAL_DEX_COMPLETE   26
#define SCORE_EVENT_BATTLE_FACTORY_SET_WON  27
#define SCORE_EVENT_BATTLE_CASTLE_SET_WON   28
#define SCORE_EVENT_BATTLE_HALL_SET_WON     29
#define SCORE_EVENT_BATTLE_ARCADE_SET_WON   30
#define SCORE_EVENT_GOT_ALL_GOLD_PRINTS     31
#define SCORE_EVENT_FRONTIER_LINK           32
#define SCORE_EVENT_WIFI_PLAZA_ACCESSED     33
#define SCORE_EVENT_SPIN_TRADE              34
#define SCORE_EVENT_UPLOADED_BATTLE_VIDEO   35
#define SCORE_EVENT_UPLOADED_DRESS_UP_DATA  36
#define SCORE_EVENT_UPLOADED_PC_BOX_RECORDS 37
#define SCORE_EVENT_38_UNUSED               38 // Likely for completing the villa in Platinum.
#define SCORE_EVENT_WIFI_PLAZA_MINIGAME     39
#define SCORE_EVENT_COUNT                   40

#endif // POKEHEARTGOLD_CONSTANTS_GAME_STATS_H
