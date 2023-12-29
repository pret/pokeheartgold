#ifndef POKEHEARTGOLD_UNK_0200E320_H
#define POKEHEARTGOLD_UNK_0200E320_H

typedef struct SysTask SysTask;
typedef void (*SysTaskFunc)(SysTask *task, void *data);
typedef void (*UnkSysTaskFunc)(int a0, void *data, int a2);

SysTask *CreateSysTask(SysTaskFunc func, void *data, int priority);
SysTask *sub_0200E33C(UnkSysTaskFunc, void *data, int a2);
SysTask *sub_0200E358(SysTaskFunc func, void *data, int priority);
void DestroySysTask(SysTask *task);

#endif //POKEHEARTGOLD_UNK_0200E320_H
