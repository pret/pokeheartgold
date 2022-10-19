#ifndef POKEHEARTGOLD_BUG_CONTEST_H
#define POKEHEARTGOLD_BUG_CONTEST_H

#include "bug_contest_internal.h"
#include "script.h"

void FieldSys_StartBugContestTimer(FieldSystem *fsys);
BUGCONTEST *BugContest_new(FieldSystem *fsys, u32 weekday);
void BugContest_delete(BUGCONTEST *bugContest);
void BugContest_Judge(BUGCONTEST *bugContest);
void BugContest_BufferContestWinnerNames(BUGCONTEST *bugContest, MSGDATA *msgData, MSGFMT *msgFmt, u8 place);
BOOL BugContest_ContestantIsRegistered(BUGCONTEST *bugContest, u8 id);
BOOL BugContest_BufferCaughtMonNick(BUGCONTEST *bugContest, MSGFMT *msgFmt, u8 slot);
void BugContest_BackUpParty(BUGCONTEST *bugContest);
void BugContest_RestoreParty_RetrieveCaughtPokemon(BUGCONTEST *bugContest);
BOOL BugContest_ContestantIsRegisteredN(BUGCONTEST *bugContest, u8 id, u8 n);
void BugContest_InitOpponents(BUGCONTEST *bugContest);
void BugContest_InitEncounters(BUGCONTEST *bugContest);
u16 BugContest_JudgePlayerMon(BUGCONTEST *bugContest, POKEMON *pokemon);

#endif //POKEHEARTGOLD_BUG_CONTEST_H
