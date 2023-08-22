#ifndef POKEHEARTGOLD_BUG_CONTEST_H
#define POKEHEARTGOLD_BUG_CONTEST_H

#include "bug_contest_internal.h"
#include "script.h"

void FieldSystem_StartBugContestTimer(FieldSystem *fieldSystem);
BUGCONTEST *BugContest_New(FieldSystem *fieldSystem, u32 weekday);
void BugContest_Delete(BUGCONTEST *bugContest);
void BugContest_Judge(BUGCONTEST *bugContest);
void BugContest_BufferContestWinnerNames(BUGCONTEST *bugContest, MsgData *msgData, MessageFormat *msgFmt, u8 place);
BOOL BugContest_ContestantIsRegistered(BUGCONTEST *bugContest, u8 id);
BOOL BugContest_BufferCaughtMonNick(BUGCONTEST *bugContest, MessageFormat *msgFmt, u8 slot);
void BugContest_BackUpParty(BUGCONTEST *bugContest);
void BugContest_RestoreParty_RetrieveCaughtPokemon(BUGCONTEST *bugContest);
BOOL BugContest_ContestantIsRegisteredN(BUGCONTEST *bugContest, u8 id, u8 n);
void BugContest_InitOpponents(BUGCONTEST *bugContest);
void BugContest_InitEncounters(BUGCONTEST *bugContest);
u16 BugContest_JudgePlayerMon(BUGCONTEST *bugContest, Pokemon *pokemon);
ENC_SLOT *BugContest_GetEncounterSlot(BUGCONTEST *bugContest, HeapID heapId);

#endif //POKEHEARTGOLD_BUG_CONTEST_H
