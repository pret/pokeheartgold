#ifndef POKEHEARTGOLD_CONSTANTS_BUGFIX_H
#define POKEHEARTGOLD_CONSTANTS_BUGFIX_H

// When setting the loto number ID, the high 16 bits are set to overwrite the
// low 16 bits, and the variable that's supposed to hold the high 16 bits is
// never written. Uncomment this to use the intended behavior.
// #define BUGFIX_LOTO_NUMBER_HI

// When checking your party against battle rules, the flag that bans Soul Dew
// uses the most significant bit of the total party level, however this is
// incorrectly checked. Uncomment this to use the intended behavior.
// #define BUGFIX_SOUL_DEW_BAN

#endif // POKEHEARTGOLD_CONSTANTS_BUGFIX_H
