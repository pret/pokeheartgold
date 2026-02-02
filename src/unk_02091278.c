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
};

// Convert a language code to a Pokedex caught-language bit index
int LanguageToDexFlag(u32 language) {
    int i;

    for (i = 0; i < 6; i++) {
        if (language == sDexFlagToLanguage[i]) {
            break;
        }
    }

    return i;
}

// Convert a Pokedex caught-language bit index to a language code
int sub_02091294(int index) {
    GF_ASSERT(index < 6);

    return sDexFlagToLanguage[index];
}
