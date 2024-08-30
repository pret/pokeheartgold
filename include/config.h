#ifndef POKEHEARTGOLD_CONFIG_H
#define POKEHEARTGOLD_CONFIG_H

#define VERSION_SAPPHIRE   1
#define VERSION_RUBY       2
#define VERSION_EMERALD    3
#define VERSION_FIRE_RED   4
#define VERSION_LEAF_GREEN 5
#define VERSION_HEARTGOLD  7
#define VERSION_SOULSILVER 8
#define VERSION_DIAMOND    10
#define VERSION_PEARL      11
#define VERSION_PLATINUM   12
#define VERSION_GAMECUBE   15

#define LANGUAGE_JAPANESE 1
#define LANGUAGE_ENGLISH  2
#define LANGUAGE_FRENCH   3
#define LANGUAGE_ITALIAN  4
#define LANGUAGE_GERMAN   5
#define LANGUAGE_SPANISH  7
#define LANGUAGE_KOREAN   8

// Sets HeartGold as default to help IDEs.
#if !defined(HEARTGOLD) && !defined(SOULSILVER)
#define HEARTGOLD
#endif

#if defined(HEARTGOLD)
#define GAME_VERSION VERSION_HEARTGOLD
#else
#define GAME_VERSION VERSION_SOULSILVER
#endif

// Sets English as default. Add here all supported ROM languages.
#if !defined(ENGLISH)
#define ENGLISH
#endif

#ifdef ENGLISH
#define GAME_LANGUAGE LANGUAGE_ENGLISH
#else
#error "Missing or unrecognized game language define"
#endif

#ifndef __MWERKS__
#define NONMATCHING
#endif //__MWERKS__

#include "constants/bugfix.h"

#endif // POKEHEARTGOLD_CONFIG_H
