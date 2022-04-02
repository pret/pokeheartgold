#ifndef POKEHEARTGOLD_UNK_0200E320_H
#define POKEHEARTGOLD_UNK_0200E320_H

typedef struct SysTask SysTask;
typedef void (*SysTaskFunc)(SysTask *task, void *data);

SysTask *CreateSysTask(SysTaskFunc func, void *data, int priority);
void DestroySysTask(SysTask *task);

#endif //POKEHEARTGOLD_UNK_0200E320_H
