#ifndef HEARTGOLD_UNK_02097720_H
#define HEARTGOLD_UNK_02097720_H

#include "task.h"

typedef struct Unknown_02097720 {
    u32 unknown_0;
    u16* unknown_4;
    u16* unknown_8; // most likely a struct pointer
} Unknown_02097720;

void sub_02097720(TaskManager* taskManager, u16* unknownPtr);
BOOL sub_02097754(TaskManager *taskManager);

#endif  // HEARTGOLD_UNK_02097720_HH
