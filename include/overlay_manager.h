#ifndef POKEHEARTGOLD_OVERLAY_MANAGER_H
#define POKEHEARTGOLD_OVERLAY_MANAGER_H

#include "heap.h"
#include "poke_overlay.h"

#define FS_OVERLAY_ID_NONE       (-1)

typedef struct OVY_MANAGER OVY_MANAGER;

typedef int (*OVY_FUNC)(OVY_MANAGER *manager, int *state);

typedef struct OVY_MGR_TEMPLATE {
    OVY_FUNC init;
    OVY_FUNC exec;
    OVY_FUNC exit;
    FSOverlayID ovy_id;
} OVY_MGR_TEMPLATE;

struct OVY_MANAGER {
    OVY_MGR_TEMPLATE template;
    int exec_state;
    int proc_state;
    void *unk_18;
    void *data;
    u32 unk_20;
    u32 unk_24;
};

#endif //POKEHEARTGOLD_OVERLAY_MANAGER_H
