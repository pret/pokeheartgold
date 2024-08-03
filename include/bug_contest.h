#ifndef POKEHEARTGOLD_BUG_CONTEST_H
#define POKEHEARTGOLD_BUG_CONTEST_H

#include "bug_contest_internal.h"
#include "script.h"

void FieldSystem_StartBugContestTimer(FieldSystem *fieldSystem);
BugContest *BugContest_New(FieldSystem *fieldSystem, u32 weekday);
void BugContest_Delete(BugContest *bugContest);
void BugContest_Judge(BugContest *bugContest);
void BugContest_BufferContestWinnerNames(BugContest *bugContest, MsgData *msgData, MessageFormat *msgFmt, u8 place);
BOOL BugContest_ContestantIsRegistered(BugContest *bugContest, u8 id);
BOOL BugContest_BufferCaughtMonNick(BugContest *bugContest, MessageFormat *msgFmt, u8 slot);
void BugContest_BackUpParty(BugContest *bugContest);
void BugContest_RestoreParty_RetrieveCaughtPokemon(BugContest *bugContest);
BOOL BugContest_ContestantIsRegisteredN(BugContest *bugContest, u8 id, u8 n);
void BugContest_InitOpponents(BugContest *bugContest);
void BugContest_InitEncounters(BugContest *bugContest);
u16 BugContest_JudgePlayerMon(BugContest *bugContest, Pokemon *pokemon);
ENC_SLOT *BugContest_GetEncounterSlot(BugContest *bugContest, HeapID heapId);

#endif // POKEHEARTGOLD_BUG_CONTEST_H
