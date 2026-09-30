#include "battle/battle_controller.h"

// static
void BattleController_SendMessage(BattleSystem *battleSys, int recipient, int battler, void *message, u8 size) {
    int i;
    BattleMessageInfo info;
    u8 *src;
    u8 *dest;
    u16 *writeIndex;
    u16 *endIndex;

    if (recipient == 1) {
        dest = BattleSystem_GetClientMessage(battleSys);
        writeIndex = BattleSystem_GetClientWriteIndex(battleSys);
        endIndex = BattleSystem_GetClientEndIndex(battleSys);
    } else {
        dest = BattleSystem_GetServerMessage(battleSys);
        writeIndex = BattleSystem_GetServerWriteIndex(battleSys);
        endIndex = BattleSystem_GetServerEndIndex(battleSys);
    }

    if (writeIndex[0] + sizeof(BattleMessageInfo) + size + 1 > 0x1000) {
        endIndex[0] = writeIndex[0];
        writeIndex[0] = 0;
    }

    info.recipient = recipient;
    info.battler = battler;
    info.size = size;

    src = (u8 *)&info;

    for (i = 0; i < sizeof(BattleMessageInfo); i++) {
        dest[writeIndex[0]] = src[i];
        writeIndex[0]++;
    }

    src = (u8 *)message;

    for (i = 0; i < size; i++) {
        dest[writeIndex[0]] = src[i];
        writeIndex[0]++;
    }
}

//static 
BOOL BattleController_RecvMessage(BattleSystem *battleSys, void *message) {
    u8 *src = (u8 *)message;
    int i;
    BOOL success = FALSE;

    u8 recipient = src[0];
    u8 battler = src[1];
    int size = src[2] | (src[3] << 8);

    src += sizeof(BattleMessageInfo);

    if (recipient == 0) {
        if (battleSys->ctx->battleBuffer[battler][0] == 0) {
            for (i = 0; i < size; i++) {
                battleSys->ctx->battleBuffer[battler][i] = src[i];
            }

            success = TRUE;
        }
    } else if (recipient == 1) {
        if (battleSys->opponentData[battler]->unk94[0] == 0) {
            for (i = 0; i < size; i++) {
                battleSys->opponentData[battler]->unk94[i] = src[i];
            }

            success = TRUE;
        }
    } else if (recipient == 2) {
        int val = src[0];
        int id = src[1];

        if (BattleSystem_IsInitialized(battleSys)) {
            ov12_0224ED00(battleSys->ctx, id, battler, val);
        }

        success = TRUE;
    }

    return success;
}

void BattleSystem_TryRecvMessage(BattleSystem *battleSys, int recipient) {
    u8 *src;
    u16 *readIndex;
    u16 *writeIndex;
    u16 *endIndex;
    int size;

    if (recipient == 1) {
        src = BattleSystem_GetClientMessage(battleSys);
        readIndex = BattleSystem_GetClientReadIndex(battleSys);
        writeIndex = BattleSystem_GetClientWriteIndex(battleSys);
        endIndex = BattleSystem_GetClientEndIndex(battleSys);
    } else {
        src = BattleSystem_GetServerMessage(battleSys);
        readIndex = BattleSystem_GetServerReadIndex(battleSys);
        writeIndex = BattleSystem_GetServerWriteIndex(battleSys);
        endIndex = BattleSystem_GetServerEndIndex(battleSys);
    }

    if (readIndex[0] == writeIndex[0]) {
        return;
    }

    if (readIndex[0] == endIndex[0]) {
        readIndex[0] = 0;
        endIndex[0] = 0;
    }

    if (BattleController_RecvMessage(battleSys, (void *)&src[readIndex[0]]) == 1) {
        size = sizeof(BattleMessageInfo) + (src[readIndex[0] + 2] | (src[readIndex[0] + 3] << 8));
        readIndex[0] += size;
    }
}
