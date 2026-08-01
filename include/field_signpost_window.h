#ifndef POKEHEARTGOLD_OV_01_021F3D38_H
#define POKEHEARTGOLD_OV_01_021F3D38_H

#include "constants/scrcmd.h"

#include "field_system.h"

struct FieldSignpostWindow *FieldSignpostWindow_New(enum HeapID heapId);
void FieldSignpostWindow_Delete(struct FieldSignpostWindow *fieldSignpostWindow);
void FieldSignpostWindow_SetParam(struct FieldSignpostWindow *fieldSignpostWindow, u8 type, u16 map);
void FieldSignpostWindow_SetCommand(struct FieldSignpostWindow *fieldSignpostWindow, u8 cmd);
Window *FieldSignpostWindow_GetWindow(struct FieldSignpostWindow *fieldSignpostWindow);
u8 FieldSignpostWindow_GetType(struct FieldSignpostWindow *fieldSignpostWindow);
BOOL FieldSignpostWindow_CommandIsFinished(struct FieldSignpostWindow *fieldSignpostWindow);
void FieldSystem_ExecuteSignpostWindowCommand(FieldSystem *fieldSystem);
void FieldSystem_SetAndExecuteSignpostWindowCommand(FieldSystem *fieldSystem, u8 cmd);

#endif
