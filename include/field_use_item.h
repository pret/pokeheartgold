#ifndef POKEHEARTGOLD_FIELD_USE_ITEM_H
#define POKEHEARTGOLD_FIELD_USE_ITEM_H

#include "bag_types_def.h"
#include "mail.h"
#include "party.h"
#include "task.h"
#include "unk_0202E41C.h"

#define USE_ITEM_TASK_MENU  0
#define USE_ITEM_TASK_FIELD 1
#define USE_ITEM_TASK_CHECK 2

struct AlphItemUseData {
    int scriptNo;
    u16 var_8000;
    u16 var_8001;
    u16 var_8002;
    u16 var_8003;
};

typedef void *(*FieldApplicationWorkCtor)(FieldSystem *fieldSystem);

typedef struct ItemFieldUseData {
    FieldSystem *fieldSystem;      // 00
    struct ItemCheckUseData dat;   // 04
    FieldApplicationWorkCtor ctor; // 1C
    void *work;                    // 20
    u16 itemId;                    // 24
    u8 state;                      // 26
    u8 no_app;                     // 27
} ItemFieldUseData;

typedef struct ItemMenuUseData {
    TaskManager *taskManager;
    u16 itemId;
    u8 partySlot;
} ItemMenuUseData;

typedef void (*ItemMenuUseFunc)(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
typedef BOOL (*ItemFieldUseFunc)(struct ItemFieldUseData *data);
typedef enum ItemUseError (*ItemCheckUseFunc)(const struct ItemCheckUseData *data);

struct RegisteredKeyItemUseMessagePrintTaskData {
    Window window;
    String *strbuf;
    u16 printerId;
    u16 state;
};

void *GetItemFieldUseFunc(int funcType, u16 itemType);
void ItemCheckUseData_Init(FieldSystem *fieldSystem, struct ItemCheckUseData *dat);
BOOL Leftover_CanPlantBerry(const struct ItemCheckUseData *data);
int UseRegisteredItemButtonInField(FieldSystem *fieldSystem, u8 slot);

#endif // POKEHEARTGOLD_FIELD_USE_ITEM_H
