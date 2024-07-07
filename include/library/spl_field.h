#ifndef POKEHEARTGOLD_SPL_FIELD_H
#define POKEHEARTGOLD_SPL_FIELD_H

#include "spl_particle.h"

struct SPLEmitter;

typedef struct SPLField {
    void (*p_exec)(const void *, SPLParticle *, VecFx32 *, struct SPLEmitter *p_emtr);
    const void *p_obj;
} SPLField;

#endif // POKEHEARTGOLD_SPL_FIELD_H
