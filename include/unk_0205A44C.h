#ifndef POKEHEARTGOLD_UNK_0205A44C_H
#define POKEHEARTGOLD_UNK_0205A44C_H

#include "easy_chat.h"
#include "script.h"

BOOL sub_0205A478(struct UnkStruct_02059E1C *fieldSystem_unk80);
BOOL sub_0205A4D8(struct UnkStruct_02059E1C *fieldSystem_unk80);
int sub_0205A6AC(MessageFormat *msgFmt);
int sub_0205A750(struct UnkStruct_02059E1C *fieldSystem_unk80, int objId, int a2, MessageFormat *msgFmt);
u32 sub_0205A894(void);
void sub_0205A904(int command);
int sub_0205A9A0(struct UnkStruct_02059E1C *fieldSystem_unk80, MessageFormat *msgFmt);
void sub_0205AA9C(MessageFormat *msgFmt, u16 a1, u16 objId, PlayerProfile *profile, SaveEasyChat *easyChat);
void sub_0205ABB0(struct UnkStruct_02059E1C *fieldSystem_unk80);
void sub_0205A508(int a0);
void sub_0205AB88(MailMessage *mailMessage);
void sub_0205AA6C(struct UnkStruct_02059E1C *fieldSystem_unk80, MailMessage *mailMessage);

#endif // POKEHEARTGOLD_UNK_0205A44C_H
