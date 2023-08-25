#include "global.h"
#include "assert.h"
#include "battle/battle_command.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "heap.h"
#include "message_format.h"
#include "msgdata.h"
#include "overlay_01.h"
#include "party.h"
#include "pm_string.h"
#include "pokemon_storage_system.h"
#include "pokemon.h"
#include "scrcmd.h"
#include "script_pokemon_util.h"
#include "script.h"
#include "constants/species.h"
#include "msgdata/msg.naix"

// Note: move tutors for Blast Burn, Hydro Cannon, Frenzy Plant
// and Draco Meteor are handled separately in scr_seq_0948_T30R0601.s

typedef struct TutorMove {
    u16 move;
    u8 cost;
    u8 tutorNpc;
} TutorMove;

typedef struct MoveTutorLearnset {
    u8 moves[8];
} MoveTutorLearnset;

#define MAX_TUTOR_MOVES_PER_PAGE (6);

static const TutorMove sTutorMoves[] = {
    { MOVE_DIVE,          40, MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT     },
    { MOVE_MUD_SLAP,      32, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_FURY_CUTTER,   32, MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT     },
    { MOVE_ICY_WIND,      48, MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT     },
    { MOVE_ROLLOUT,       32, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_THUNDER_PUNCH, 64, MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT     },
    { MOVE_FIRE_PUNCH,    64, MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT     },
    { MOVE_SUPERPOWER,    48, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_ICE_PUNCH,     64, MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT     },
    { MOVE_IRON_HEAD,     40, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_AQUA_TAIL,     40, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_OMINOUS_WIND,  48, MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT     },
    { MOVE_GASTRO_ACID,   32, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_SNORE,         32, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_SPITE,         40, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_AIR_CUTTER,    48, MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT     },
    { MOVE_HELPING_HAND,  40, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_ENDEAVOR,      64, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_OUTRAGE,       48, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_ANCIENT_POWER, 40, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_SYNTHESIS,     40, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_SIGNAL_BEAM,   40, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_ZEN_HEADBUTT,  64, MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT     },
    { MOVE_VACUUM_WAVE,   48, MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT     },
    { MOVE_EARTH_POWER,   40, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_GUNK_SHOT,     32, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_TWISTER,       40, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_SEED_BOMB,     40, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_IRON_DEFENSE,  40, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_MAGNET_RISE,   40, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_LAST_RESORT,   48, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_BOUNCE,        32, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_TRICK,         48, MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT     },
    { MOVE_HEAT_WAVE,     48, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_KNOCK_OFF,     40, MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT     },
    { MOVE_SUCKER_PUNCH,  40, MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT     },
    { MOVE_SWIFT,         40, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_UPROAR,        48, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_SUPER_FANG,    40, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_PAIN_SPLIT,    64, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_STRING_SHOT,   32, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_TAILWIND,      48, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_GRAVITY,       32, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_WORRY_SEED,    32, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_MAGIC_COAT,    32, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_ROLE_PLAY,     48, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_HEAL_BELL,     48, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_LOW_KICK,      32, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_SKY_ATTACK,    64, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    },
    { MOVE_BLOCK,         32, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT },
    { MOVE_BUG_BITE,      32, MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT     },
    { MOVE_HEADBUTT,       0, MOVE_TUTOR_NPC_HEADBUTT              },
};

static u16 GetMoveTutorLearnsetIndex(u16 species, u8 form);
static u16 GetLearnableTutorMoves(Pokemon *mon, u32 moveTutorNpc, u8 dest[]);
static MoveTutorLearnset *GetMoveTutorLearnset(HeapID heapId, u32 index);
static BOOL ov01_0220305C(ScriptContext *ctx);

// get number of pages needed to show learnable moves from move tutor
BOOL ScrCmd_652(ScriptContext *ctx) {
    u16 slot = ScriptGetVar(ctx);
    u16 moveTutorNpc = ScriptGetVar(ctx);
    u16 *result = ScriptGetVarPointer(ctx);
    Party *party = SaveArray_Party_Get(ctx->fieldSystem->saveData);
    Pokemon *mon = Party_GetMonByIndex(party, slot);
    u32 numLearnableMoves = GetLearnableTutorMoves(mon, moveTutorNpc, NULL);
    if (numLearnableMoves == 0) {
        *result = 0;
    } else if (numLearnableMoves <= 7) {
        *result = 1;
    } else {
        *result = ((s32) numLearnableMoves / 6) + 1;
    }
    return FALSE;
}

BOOL ScrCmd_TutorMoveTeachInSlot(ScriptContext *ctx) {
    u16 partySlot = ScriptGetVar(ctx);
    u16 moveSlot = ScriptGetVar(ctx);
    u16 move = ScriptGetVar(ctx);
    Party *party = SaveArray_Party_Get(ctx->fieldSystem->saveData);
    PartyMonSetMoveInSlot(party, partySlot, moveSlot, move);
    return FALSE;
}

BOOL ScrCmd_TutorMoveGetPrice(ScriptContext *ctx) {
    u16 move = ScriptGetVar(ctx);
    u16 *result = ScriptGetVarPointer(ctx);
    for (u32 i = 0; i < NELEMS(sTutorMoves); i++) {
        if (sTutorMoves[i].move == move) {
            *result = sTutorMoves[i].cost;
            return FALSE;
        }
    }
    GF_ASSERT(FALSE);
    *result = 0;
    return FALSE;
}

// check if mon at given slot can learn from headbutt move tutor
BOOL ScrCmd_656(ScriptContext *ctx) {
    u16 slot = ScriptGetVar(ctx);
    u16 *result = ScriptGetVarPointer(ctx);
    Party *party = SaveArray_Party_Get(ctx->fieldSystem->saveData);
    Pokemon *mon = Party_GetMonByIndex(party, slot);
    u32 numLearnableMoves = GetLearnableTutorMoves(mon, MOVE_TUTOR_NPC_HEADBUTT, NULL);
    *result = numLearnableMoves > 0 ? TRUE : FALSE;
    return FALSE;
}

static u16 GetMoveTutorLearnsetIndex(u16 species, u8 form) {
    u16 index;
    // subtract 2 because SPECIES_EGG and SPECIES_BAD_EGG are missing
    switch (species) {
        case SPECIES_DEOXYS:
            if (form == DEOXYS_ATTACK) {
                index = SPECIES_DEOXYS_ATK - 2;
            } else if (form == DEOXYS_DEFENSE) {
                index = SPECIES_DEOXYS_DEF - 2;
            } else if (form == DEOXYS_SPEED) {
                index = SPECIES_DEOXYS_SPD - 2;
            }
            break;
        case SPECIES_WORMADAM:
            if (form == WORMADAM_SANDY) {
                index = SPECIES_WORMADAM_SANDY - 2;
            } else if (form == WORMADAM_TRASH) {
                index = SPECIES_WORMADAM_TRASH - 2;
            }
            break;
        case SPECIES_GIRATINA:
            if (form == GIRATINA_ORIGIN) {
                index = SPECIES_GIRATINA_ORIGIN - 2;
            }
            break;
        case SPECIES_SHAYMIN:
            if (form == SHAYMIN_SKY) {
                index = SPECIES_SHAYMIN_SKY - 2;
            }
            break;
        case SPECIES_ROTOM:
            if (form == ROTOM_HEAT) {
                index = SPECIES_ROTOM_HEAT - 2;
            } else if (form == ROTOM_WASH) {
                index = SPECIES_ROTOM_WASH - 2;
            } else if (form == ROTOM_FROST) {
                index = SPECIES_ROTOM_FROST - 2;
            } else if (form == ROTOM_FAN) {
                index = SPECIES_ROTOM_FAN - 2;
            } else if (form == ROTOM_MOW) {
                index = SPECIES_ROTOM_MOW - 2;
            }
            break;
    }
    return index - 1;
}

static u16 GetLearnableTutorMoves(Pokemon *mon, u32 moveTutorNpc, u8 dest[]) {
    s32 i, j;
    u16 currentMoves[MAX_MON_MOVES];
    for (i = 0; i < MAX_MON_MOVES; i++) {
        currentMoves[i] = GetMonData(mon, MON_DATA_MOVE1 + i, NULL);
    }
    u32 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    u32 form = GetMonData(mon, MON_DATA_FORM, NULL);
    MoveTutorLearnset *learnset = GetMoveTutorLearnset(HEAP_ID_FIELD, GetMoveTutorLearnsetIndex(species, form));
    u16 numLearnableMoves = 0;
    for (j = 0; j < NELEMS(sTutorMoves); j++) {
        // this is equivalent to treating `learnset` as a bitfield of 64 bits
        // and then checking whether bit j is set
        BOOL canLearnMove = (learnset->moves[j / 8] >> (j % 8)) & 1;
        if (canLearnMove && moveTutorNpc == sTutorMoves[j].tutorNpc) {
            for (i = 0; i < MAX_MON_MOVES; i++) {
                if (currentMoves[i] == sTutorMoves[j].move) {
                    break;
                }
            }
            if (i < MAX_MON_MOVES) { // move already currently learned by pokemon
                continue;
            }
            if (dest != NULL) {
                dest[numLearnableMoves] = j;
            }
            numLearnableMoves++;
        }
    }
    FreeToHeap(learnset);
    return numLearnableMoves;
}

static MoveTutorLearnset *GetMoveTutorLearnset(HeapID heapId, u32 index) {
    FSFile file;
    FS_InitFile(&file);
    if (FS_OpenFile(&file, "fielddata/wazaoshie/waza_oshie.bin") == FALSE) {
        GF_ASSERT(FALSE);
        return NULL;
    }
    // subtract 2 because SPECIES_EGG and SPECIES_BAD_EGG are missing
    u32 filesize = (NUM_SPECIES - 2) * sizeof(MoveTutorLearnset);
    if (file.prop.file.bottom - file.prop.file.top != filesize) {
        GF_ASSERT(FALSE);
    }
    MoveTutorLearnset *learnset = AllocFromHeapAtEnd(heapId, sizeof(MoveTutorLearnset));
    FS_SeekFile(&file, index * sizeof(MoveTutorLearnset), FS_SEEK_SET);
    FS_ReadFile(&file, learnset, sizeof(MoveTutorLearnset));
    FS_CloseFile(&file);
    return learnset;
}

BOOL ScrCmd_MoveTutorChooseMove(ScriptContext *ctx) {
    u8 learnableMoves[52];
    s32 i;
    s32 numLearnableMoves;
    BOOL showNextButton;
    FieldSystem *fieldSystem = ctx->fieldSystem;
    struct UnkStruct_ov01_021EDC28 **unk = ov01_021F6B20(fieldSystem);
    u16 resultVarId;
    MsgData *messageData;
    u16 showAsTwoColumns;
    MessageFormat **messageFormat = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u16 slot = ScriptGetVar(ctx);
    u16 moveTutorNpc = ScriptGetVar(ctx);
    u16 pageNum = ScriptGetVar(ctx);
    resultVarId = ScriptReadHalfword(ctx);
    ctx->data[0] = resultVarId;
    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(ctx->fieldSystem->saveData), slot);
    numLearnableMoves = GetLearnableTutorMoves(mon, moveTutorNpc, learnableMoves);
    s32 numMovesToSkip;
    if (numLearnableMoves <= 7) {
        numMovesToSkip = 0;
        showNextButton = FALSE;
    } else if (numLearnableMoves > pageNum * 6) {
        numMovesToSkip = pageNum * MAX_TUTOR_MOVES_PER_PAGE;
        numLearnableMoves -= numMovesToSkip;
        if (numLearnableMoves > 6) {
            numLearnableMoves = MAX_TUTOR_MOVES_PER_PAGE;
        }
        showNextButton = TRUE;
    } else {
        // UB: showNextButton is never initialized in this branch.
        // Fortunately, this branch is never taken, as an
        // appropriate value of pageNum is always passed in
        // for all instances where this function is called.
        numLearnableMoves = MAX_TUTOR_MOVES_PER_PAGE;
        numMovesToSkip = 0;
    }
    u16 *result = GetVarPointer(fieldSystem, resultVarId);
    Window *window = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_WINDOW);
    *unk = ov01_021EDF78(fieldSystem, 1, 1, 0, 1, result, *messageFormat, window, ctx->msgdata);
    messageData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0750_bin, HEAP_ID_32);
    String *string = String_New(0x10, HEAP_ID_32);
    showAsTwoColumns = (numLearnableMoves + showNextButton >= 4) ? 1 : 0;
    for (i = 0; i < numLearnableMoves; i++) {
        ReadMsgDataIntoString(messageData, sTutorMoves[learnableMoves[i + numMovesToSkip]].move, string);
        BufferString(*messageFormat, 0, string, 2, 1, 2);
        BufferIntegerAsString(*messageFormat, 1, sTutorMoves[learnableMoves[i + numMovesToSkip]].cost, 2, PRINTING_MODE_RIGHT_ALIGN, TRUE);
        MoveTutorMenu_SetListItem(*unk, showAsTwoColumns, 0xff, sTutorMoves[learnableMoves[i + numMovesToSkip]].move);
    }
    String_Delete(string);
    DestroyMsgData(messageData);
    if (showNextButton) {
        MoveTutorMenu_SetListItem(*unk, 2, 0xff, 0xfffd);
    }
    MoveTutorMenu_SetListItem(*unk, 3, 0xff, 0xfffe);
    ov01_021F6ABC(fieldSystem, 3, 7, GetVarPointer(fieldSystem, ctx->data[0]));
    SetupNativeScript(ctx, ov01_0220305C);
    u16 *unused = GetVarPointer(fieldSystem, ctx->data[0]); // yes, this is needed here to match
    return TRUE;
}

static BOOL ov01_0220305C(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    struct UnkStruct_ov01_021EDC28 **unk = ov01_021F6B20(fieldSystem);
    u16 *result = GetVarPointer(fieldSystem, ctx->data[0]);
    if (*result == 0xeeee) {
        return FALSE;
    }
    ov01_021EDF00(*unk);
    return TRUE;
}

// Unused
BOOL ScrCmd_742(ScriptContext *ctx) {
    u16 slot = ScriptGetVar(ctx);
    u16 move = ScriptGetVar(ctx);
    u16 *result = ScriptGetVarPointer(ctx);
    *result = FALSE;
    Party *party = SaveArray_Party_Get(ctx->fieldSystem->saveData);
    Pokemon *mon = Party_GetMonByIndex(party, slot);
    u16 *unk = AllocFromHeapAtEnd(HEAP_ID_FIELD, 0x2c);
    u32 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    u32 form = GetMonData(mon, MON_DATA_FORM, NULL);
    s32 size = Species_LoadLearnsetTable(species, form, unk);
    for (s32 i = 0; i < size; i++) {
        if (move == unk[i]) {
            *result = TRUE;
            break;
        }
    }
    FreeToHeap(unk);
    return FALSE;
}
