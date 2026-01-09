#include "unk_02091278.h"

#include "global.h"

#include "config.h"

// Maps Pokedex language flag indices to language codes
static const u8 sDexFlagToLanguage[] = {
    LANGUAGE_JAPANESE,
    LANGUAGE_ENGLISH,
    LANGUAGE_FRENCH,
    LANGUAGE_GERMAN,
    LANGUAGE_ITALIAN,
    LANGUAGE_SPANISH,
    0, // padding
    0, // padding
};

// Convert a language code to a Pokedex caught-language bit index
int LanguageToDexFlag(u32 language) {
    int i = 0;
    const u8 *ptr = sDexFlagToLanguage;

    while (i < 6) {
        if (language == *ptr) {
            break;
        }
        i++;
        ptr++;
    }

    return i;
}

// Convert a Pokedex caught-language bit index to a language code
int sub_02091294(int index) {
    GF_ASSERT(index < 6);

    return sDexFlagToLanguage[index];
}
