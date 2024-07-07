#ifndef POKEHEARTGOLD_SPL_H
#define POKEHEARTGOLD_SPL_H

// Software particle library

#include "spl_emitter.h"
#include "spl_manager.h"

extern SPLEmitter *SPL_CreateWithInitialize(SPLManager *p_mgr, int res_no, void (*fp_callback)(struct SPLEmitter *));

#endif // POKEHEARTGOLD_SPL_H
