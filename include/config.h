#ifndef POKEHEARTGOLD_CONFIG_H
#define POKEHEARTGOLD_CONFIG_H

#define VERSION_HEARTGOLD 7
#define VERSION_SOULSILVER 8

#define LANGUAGE_ENGLISH 2

#undef GAME_VERSION
#if defined(HEARTGOLD)
#define GAME_VERSION VERSION_HEARTGOLD
#elif defined(SOULSILVER)
#define GAME_VERSION VERSION_SOULSILVER
#else
#error "Missing or unrecognized game version define"
#endif

#undef GAME_LANGUAGE
#ifdef ENGLISH
#define GAME_LANGUAGE LANGUAGE_ENGLISH
#else
#error "Missing or unrecognized game language define"
#endif

#endif //POKEHEARTGOLD_CONFIG_H
