#ifdef _IN_SCRCMD_C
BOOL ScrCmd_Nop(ScriptContext *ctx);
BOOL ScrCmd_Dummy(ScriptContext *ctx);
BOOL ScrCmd_End(ScriptContext *ctx);
BOOL ScrCmd_Wait(ScriptContext *ctx);
BOOL ScrCmd_LoadByte(ScriptContext *ctx);
BOOL ScrCmd_LoadWord(ScriptContext *ctx);
BOOL ScrCmd_LoadByteFromAddr(ScriptContext *ctx);
BOOL ScrCmd_WriteByteToAddr(ScriptContext *ctx);
BOOL ScrCmd_SetPtrByte(ScriptContext *ctx);
BOOL ScrCmd_CopyLocal(ScriptContext *ctx);
BOOL ScrCmd_CopyByte(ScriptContext *ctx);
BOOL ScrCmd_CompareLocalToLocal(ScriptContext *ctx);
BOOL ScrCmd_CompareLocalToValue(ScriptContext *ctx);
BOOL ScrCmd_CompareLocalToAddr(ScriptContext *ctx);
BOOL ScrCmd_CompareAddrToLocal(ScriptContext *ctx);
BOOL ScrCmd_CompareAddrToValue(ScriptContext *ctx);
BOOL ScrCmd_CompareAddrToAddr(ScriptContext *ctx);
BOOL ScrCmd_CompareVarToValue(ScriptContext *ctx);
BOOL ScrCmd_CompareVarToVar(ScriptContext *ctx);
BOOL ScrCmd_RunScript(ScriptContext *ctx);
BOOL ScrCmd_CallStd(ScriptContext *ctx);
BOOL ScrCmd_RestartCurrentScript(ScriptContext *ctx);
BOOL ScrCmd_GoTo(ScriptContext *ctx);
BOOL ScrCmd_ObjectGoTo(ScriptContext *ctx);
BOOL ScrCmd_BgGoTo(ScriptContext *ctx);
BOOL ScrCmd_DirectionGoTo(ScriptContext *ctx);
BOOL ScrCmd_Call(ScriptContext *ctx);
BOOL ScrCmd_Return(ScriptContext *ctx);
BOOL ScrCmd_GoToIf(ScriptContext *ctx);
BOOL ScrCmd_CallIf(ScriptContext *ctx);
BOOL ScrCmd_SetFlag(ScriptContext *ctx);
BOOL ScrCmd_ClearFlag(ScriptContext *ctx);
BOOL ScrCmd_CheckFlag(ScriptContext *ctx);
BOOL ScrCmd_SetFlagVar(ScriptContext *ctx);
BOOL ScrCmd_ClearFlagVar(ScriptContext *ctx);
BOOL ScrCmd_CheckFlagVar(ScriptContext *ctx);
BOOL ScrCmd_SetTrainerFlag(ScriptContext *ctx);
BOOL ScrCmd_ClearTrainerFlag(ScriptContext *ctx);
BOOL ScrCmd_CheckTrainerFlag(ScriptContext *ctx);
BOOL ScrCmd_AddVar(ScriptContext *ctx);
BOOL ScrCmd_SubVar(ScriptContext *ctx);
BOOL ScrCmd_SetVar(ScriptContext *ctx);
BOOL ScrCmd_CopyVar(ScriptContext *ctx);
BOOL ScrCmd_SetOrCopyVar(ScriptContext *ctx);
BOOL ScrCmd_NonNPCMsg(ScriptContext *ctx);
BOOL ScrCmd_NPCMsg(ScriptContext *ctx);
BOOL ScrCmd_NonNpcMsgVar(ScriptContext *ctx);
BOOL ScrCmd_NpcMsgVar(ScriptContext *ctx);
BOOL ScrCmd_048(ScriptContext *ctx);
BOOL ScrCmd_WaitButton(ScriptContext *ctx);
BOOL ScrCmd_WaitButtonOrWalkAway(ScriptContext *ctx);
BOOL ScrCmd_WaitButtonOrDpad(ScriptContext *ctx);
BOOL ScrCmd_OpenMsg(ScriptContext *ctx);
BOOL ScrCmd_CloseMsg(ScriptContext *ctx);
BOOL ScrCmd_HoldMsg(ScriptContext *ctx);
BOOL ScrCmd_DirectionSignpost(ScriptContext *ctx);
BOOL ScrCmd_055(ScriptContext *ctx);
BOOL ScrCmd_057(ScriptContext *ctx);
BOOL ScrCmd_058(ScriptContext *ctx);
BOOL ScrCmd_TrainerTips(ScriptContext *ctx);
BOOL ScrCmd_060(ScriptContext *ctx);
BOOL ScrCmd_061(ScriptContext *ctx);
BOOL ScrCmd_062(ScriptContext *ctx);
BOOL ScrCmd_YesNo(ScriptContext *ctx);
BOOL ScrCmd_064(ScriptContext *ctx);
BOOL ScrCmd_065(ScriptContext *ctx);
BOOL ScrCmd_066(ScriptContext *ctx);
BOOL ScrCmd_067(ScriptContext *ctx);
BOOL ScrCmd_068(ScriptContext *ctx);
BOOL ScrCmd_069(ScriptContext *ctx);
BOOL ScrCmd_070(ScriptContext *ctx);
BOOL ScrCmd_071(ScriptContext *ctx);
BOOL ScrCmd_072(ScriptContext *ctx);
BOOL ScrCmd_PlaySE(ScriptContext *ctx);
BOOL ScrCmd_StopSE(ScriptContext *ctx);
BOOL ScrCmd_WaitSE(ScriptContext *ctx);
BOOL ScrCmd_PlayCry(ScriptContext *ctx);
BOOL ScrCmd_WaitCry(ScriptContext *ctx);
BOOL ScrCmd_PlayFanfare(ScriptContext *ctx);
BOOL ScrCmd_WaitFanfare(ScriptContext *ctx);
BOOL ScrCmd_PlayBGM(ScriptContext *ctx);
BOOL ScrCmd_StopBGM(ScriptContext *ctx);
BOOL ScrCmd_ResetBGM(ScriptContext *ctx);
BOOL ScrCmd_083(ScriptContext *ctx);
BOOL ScrCmd_FadeOutBGM(ScriptContext *ctx);
BOOL ScrCmd_FadeInBGM(ScriptContext *ctx);
BOOL ScrCmd_086(ScriptContext *ctx);
BOOL ScrCmd_TempBGM(ScriptContext *ctx);
BOOL ScrCmd_088(ScriptContext *ctx);
BOOL ScrCmd_ChatotHasCry(ScriptContext *ctx);
BOOL ScrCmd_ChatotStartRecording(ScriptContext *ctx);
BOOL ScrCmd_ChatotStopRecording(ScriptContext *ctx);
BOOL ScrCmd_ChatotSaveRecording(ScriptContext *ctx);
BOOL ScrCmd_093(ScriptContext *ctx);
BOOL ScrCmd_ApplyMovement(ScriptContext *ctx);
BOOL ScrCmd_WaitMovement(ScriptContext *ctx);
BOOL ScrCmd_LockAll(ScriptContext *ctx);
BOOL ScrCmd_ReleaseAll(ScriptContext *ctx);
BOOL ScrCmd_098(ScriptContext *ctx);
BOOL ScrCmd_099(ScriptContext *ctx);
BOOL ScrCmd_ShowPerson(ScriptContext *ctx);
BOOL ScrCmd_HidePerson(ScriptContext *ctx);
BOOL ScrCmd_102(ScriptContext *ctx);
BOOL ScrCmd_103(ScriptContext *ctx);
BOOL ScrCmd_FacePlayer(ScriptContext *ctx);
BOOL ScrCmd_GetPlayerCoords(ScriptContext *ctx);
BOOL ScrCmd_GetPersonCoords(ScriptContext *ctx);
BOOL ScrCmd_107(ScriptContext *ctx);
BOOL ScrCmd_108(ScriptContext *ctx);
BOOL ScrCmd_109(ScriptContext *ctx);
BOOL ScrCmd_AddMoney(ScriptContext *ctx);
BOOL ScrCmd_SubMoneyImmediate(ScriptContext *ctx);
BOOL ScrCmd_HasEnoughMoneyImmediate(ScriptContext *ctx);
BOOL ScrCmd_ShowMoneyBox(ScriptContext *ctx);
BOOL ScrCmd_HideMoneyBox(ScriptContext *ctx);
BOOL ScrCmd_UpdateMoneyBox(ScriptContext *ctx);
BOOL ScrCmd_116(ScriptContext *ctx);
BOOL ScrCmd_117(ScriptContext *ctx);
BOOL ScrCmd_118(ScriptContext *ctx);
BOOL ScrCmd_GetCoinAmount(ScriptContext *ctx);
BOOL ScrCmd_GiveCoins(ScriptContext *ctx);
BOOL ScrCmd_TakeCoins(ScriptContext *ctx);
BOOL ScrCmd_GiveAthletePoints(ScriptContext *ctx);
BOOL ScrCmd_TakeAthletePoints(ScriptContext *ctx);
BOOL ScrCmd_CheckAthletePoints(ScriptContext *ctx);
BOOL ScrCmd_GiveItem(ScriptContext *ctx);
BOOL ScrCmd_TakeItem(ScriptContext *ctx);
BOOL ScrCmd_HasSpaceForItem(ScriptContext *ctx);
BOOL ScrCmd_HasItem(ScriptContext *ctx);
BOOL ScrCmd_ItemIsTMOrHM(ScriptContext *ctx);
BOOL ScrCmd_GetItemPocket(ScriptContext *ctx);
BOOL ScrCmd_SetStarterChoice(ScriptContext *ctx);
BOOL ScrCmd_GenderMsgbox(ScriptContext *ctx);
BOOL ScrCmd_GetSealQuantity(ScriptContext *ctx);
BOOL ScrCmd_GiveOrTakeSeal(ScriptContext *ctx);
BOOL ScrCmd_GiveRandomSeal(ScriptContext *ctx);
BOOL ScrCmd_136(ScriptContext *ctx);
BOOL ScrCmd_GiveMon(ScriptContext *ctx);
BOOL ScrCmd_GiveEgg(ScriptContext *ctx);
BOOL ScrCmd_SetMonMove(ScriptContext *ctx);
BOOL ScrCmd_MonHasMove(ScriptContext *ctx);
BOOL ScrCmd_GetPartySlotWithMove(ScriptContext *ctx);
BOOL ScrCmd_GetPhoneBookRematch(ScriptContext *ctx);
BOOL ScrCmd_NameRival(ScriptContext *ctx);
BOOL ScrCmd_GetFriendSprite(ScriptContext *ctx);
BOOL ScrCmd_RegisterPokegearCard(ScriptContext *ctx);
BOOL ScrCmd_RegisterGearNumber(ScriptContext *ctx);
BOOL ScrCmd_CheckRegisteredPhoneNumber(ScriptContext *ctx);
BOOL ScrCmd_148(ScriptContext *ctx);
BOOL ScrCmd_149(ScriptContext *ctx);
BOOL ScrCmd_RestoreOverworld(ScriptContext *ctx);
BOOL ScrCmd_151(ScriptContext *ctx);
BOOL ScrCmd_152(ScriptContext *ctx);
BOOL ScrCmd_153(ScriptContext *ctx);
BOOL ScrCmd_154(ScriptContext *ctx);
BOOL ScrCmd_155(ScriptContext *ctx);
BOOL ScrCmd_156(ScriptContext *ctx);
BOOL ScrCmd_TownMap(ScriptContext *ctx);
BOOL ScrCmd_158(ScriptContext *ctx);
BOOL ScrCmd_159(ScriptContext *ctx);
BOOL ScrCmd_160(ScriptContext *ctx);
BOOL ScrCmd_161(ScriptContext *ctx);
BOOL ScrCmd_162(ScriptContext *ctx);
BOOL ScrCmd_HOF_Credits(ScriptContext *ctx);
BOOL ScrCmd_164(ScriptContext *ctx);
BOOL ScrCmd_165(ScriptContext *ctx);
BOOL ScrCmd_166(ScriptContext *ctx);
BOOL ScrCmd_ChooseStarter(ScriptContext *ctx);
BOOL ScrCmd_GetTrainerPathToPlayer(ScriptContext *ctx);
BOOL ScrCmd_TrainerStepTowardsPlayer(ScriptContext *ctx);
BOOL ScrCmd_GetTrainerEyeType(ScriptContext *ctx);
BOOL ScrCmd_GetEyeTrainerNum(ScriptContext *ctx);
BOOL ScrCmd_NamePlayer(ScriptContext *ctx);
BOOL ScrCmd_NicknameInput(ScriptContext *ctx);
BOOL ScrCmd_FadeScreen(ScriptContext *ctx);
BOOL ScrCmd_WaitFade(ScriptContext *ctx);
BOOL ScrCmd_Warp(ScriptContext *ctx);
BOOL ScrCmd_RockClimb(ScriptContext *ctx);
BOOL ScrCmd_Surf(ScriptContext *ctx);
BOOL ScrCmd_Waterfall(ScriptContext *ctx);
BOOL ScrCmd_180(ScriptContext *ctx);
BOOL ScrCmd_FlashEffect(ScriptContext *ctx);
BOOL ScrCmd_Whirlpool(ScriptContext *ctx);
BOOL ScrCmd_183(ScriptContext *ctx);
BOOL ScrCmd_PlayerOnBikeCheck(ScriptContext *ctx);
BOOL ScrCmd_PlayerOnBikeSet(ScriptContext *ctx);
BOOL ScrCmd_SetBikeStateLock(ScriptContext *ctx);
BOOL ScrCmd_GetPlayerState(ScriptContext *ctx);
BOOL ScrCmd_SetAvatarBits(ScriptContext *ctx);
BOOL ScrCmd_UpdateAvatarState(ScriptContext *ctx);
BOOL ScrCmd_BufferPlayersName(ScriptContext *ctx);
BOOL ScrCmd_BufferRivalsName(ScriptContext *ctx);
BOOL ScrCmd_BufferFriendsName(ScriptContext *ctx);
BOOL ScrCmd_BufferMonSpeciesName(ScriptContext *ctx);
BOOL ScrCmd_BufferItemName(ScriptContext *ctx);
BOOL ScrCmd_BufferPocketName(ScriptContext *ctx);
BOOL ScrCmd_BufferTMHMMoveName(ScriptContext *ctx);
BOOL ScrCmd_BufferMoveName(ScriptContext *ctx);
BOOL ScrCmd_BufferInt(ScriptContext *ctx);
BOOL ScrCmd_BufferPartyMonNick(ScriptContext *ctx);
BOOL ScrCmd_BufferTrainerClassName(ScriptContext *ctx);
BOOL ScrCmd_BufferPlayerUnionAvatarClassName(ScriptContext *ctx);
BOOL ScrCmd_BufferSpeciesName(ScriptContext *ctx);
BOOL ScrCmd_BufferStarterSpeciesName(ScriptContext *ctx);
BOOL ScrCmd_BufferDPPtRivalStarterSpeciesName(ScriptContext *ctx);
BOOL ScrCmd_BufferDPPtFriendStarterSpeciesName(ScriptContext *ctx);
BOOL ScrCmd_GetStarterChoice(ScriptContext *ctx);
BOOL ScrCmd_BufferDecorationName(ScriptContext *ctx);
BOOL ScrCmd_208(ScriptContext *ctx);
BOOL ScrCmd_209(ScriptContext *ctx);
BOOL ScrCmd_BufferMapSecName(ScriptContext *ctx);
BOOL ScrCmd_211(ScriptContext *ctx);
BOOL ScrCmd_GetTrainerNum(ScriptContext *ctx);
BOOL ScrCmd_TrainerBattle(ScriptContext *ctx);
BOOL ScrCmd_TrainerMessage(ScriptContext *ctx);
BOOL ScrCmd_GetTrainerMsgParams(ScriptContext *ctx);
BOOL ScrCmd_GetRematchMsgParams(ScriptContext *ctx);
BOOL ScrCmd_TrainerIsDoubleBattle(ScriptContext *ctx);
BOOL ScrCmd_EncounterMusic(ScriptContext *ctx);
BOOL ScrCmd_WhiteOut(ScriptContext *ctx);
BOOL ScrCmd_CheckBattleWon(ScriptContext *ctx);
BOOL ScrCmd_StaticWildWonOrCaughtCheck(ScriptContext *ctx);
BOOL ScrCmd_PartyCheckForDouble(ScriptContext *ctx);
BOOL ScrCmd_223(ScriptContext *ctx);
BOOL ScrCmd_224(ScriptContext *ctx);
BOOL ScrCmd_GotoIfTrainerDefeated(ScriptContext *ctx);
BOOL ScrCmd_226(ScriptContext *ctx);
BOOL ScrCmd_227(ScriptContext *ctx);
BOOL ScrCmd_228(ScriptContext *ctx);
BOOL ScrCmd_229(ScriptContext *ctx);
BOOL ScrCmd_230(ScriptContext *ctx);
BOOL ScrCmd_231(ScriptContext *ctx);
BOOL ScrCmd_232(ScriptContext *ctx);
BOOL ScrCmd_233(ScriptContext *ctx);
BOOL ScrCmd_234(ScriptContext *ctx);
BOOL ScrCmd_235(ScriptContext *ctx);
BOOL ScrCmd_236(ScriptContext *ctx);
BOOL ScrCmd_237(ScriptContext *ctx);
BOOL ScrCmd_PartyHasPokerus(ScriptContext *ctx);
BOOL ScrCmd_MonGetGender(ScriptContext *ctx);
BOOL ScrCmd_SetDynamicWarp(ScriptContext *ctx);
BOOL ScrCmd_GetDynamicWarpFloorNo(ScriptContext *ctx);
BOOL ScrCmd_ElevatorCurFloorBox(ScriptContext *ctx);
BOOL ScrCmd_CountJohtoDexSeen(ScriptContext *ctx);
BOOL ScrCmd_CountJohtoDexOwned(ScriptContext *ctx);
BOOL ScrCmd_CountNationalDexSeen(ScriptContext *ctx);
BOOL ScrCmd_CountNationalDexOwned(ScriptContext *ctx);
BOOL ScrCmd_247(ScriptContext *ctx);
BOOL ScrCmd_GetDexEvalResult(ScriptContext *ctx);
BOOL ScrCmd_RocketTrapBattle(ScriptContext *ctx);
BOOL ScrCmd_250(ScriptContext *ctx);
BOOL ScrCmd_CatchingTutorial(ScriptContext *ctx);
BOOL ScrCmd_252(ScriptContext *ctx);
BOOL ScrCmd_GetSaveFileState(ScriptContext *ctx);
BOOL ScrCmd_SaveGameNormal(ScriptContext *ctx);
BOOL ScrCmd_255(ScriptContext *ctx);
BOOL ScrCmd_256(ScriptContext *ctx);
BOOL ScrCmd_257(ScriptContext *ctx);
BOOL ScrCmd_258(ScriptContext *ctx);
BOOL ScrCmd_259(ScriptContext *ctx);
BOOL ScrCmd_260(ScriptContext *ctx);
BOOL ScrCmd_261(ScriptContext *ctx);
BOOL ScrCmd_262(ScriptContext *ctx);
BOOL ScrCmd_263(ScriptContext *ctx);
BOOL ScrCmd_264(ScriptContext *ctx);
BOOL ScrCmd_265(ScriptContext *ctx);
BOOL ScrCmd_266(ScriptContext *ctx);
BOOL ScrCmd_267(ScriptContext *ctx);
BOOL ScrCmd_268(ScriptContext *ctx);
BOOL ScrCmd_269(ScriptContext *ctx);
BOOL ScrCmd_270(ScriptContext *ctx);
BOOL ScrCmd_271(ScriptContext *ctx);
BOOL ScrCmd_272(ScriptContext *ctx);
BOOL ScrCmd_273(ScriptContext *ctx);
BOOL ScrCmd_274(ScriptContext *ctx);
BOOL ScrCmd_MartBuy(ScriptContext *ctx);
BOOL ScrCmd_SpecialMartBuy(ScriptContext *ctx);
BOOL ScrCmd_DecorationMart(ScriptContext *ctx);
BOOL ScrCmd_SealMart(ScriptContext *ctx);
BOOL ScrCmd_OverworldWhiteOut(ScriptContext *ctx);
BOOL ScrCmd_SetSpawn(ScriptContext *ctx);
BOOL ScrCmd_GetPlayerGender(ScriptContext *ctx);
BOOL ScrCmd_HealParty(ScriptContext *ctx);
BOOL ScrCmd_283(ScriptContext *ctx);
BOOL ScrCmd_284(ScriptContext *ctx);
BOOL ScrCmd_285(ScriptContext *ctx);
BOOL ScrCmd_286(ScriptContext *ctx);
BOOL ScrCmd_BufferUnionRoomAvatarChoices(ScriptContext *ctx);
BOOL ScrCmd_UnionRoomAvatarIdxToTrainerClass(ScriptContext *ctx);
BOOL ScrCmd_289(ScriptContext *ctx);
BOOL ScrCmd_CheckPokedex(ScriptContext *ctx);
BOOL ScrCmd_GivePokedex(ScriptContext *ctx);
BOOL ScrCmd_CheckRunningShoes(ScriptContext *ctx);
BOOL ScrCmd_GiveRunningShoes(ScriptContext *ctx);
BOOL ScrCmd_CheckBadge(ScriptContext *ctx);
BOOL ScrCmd_GiveBadge(ScriptContext *ctx);
BOOL ScrCmd_CountBadges(ScriptContext *ctx);
BOOL ScrCmd_297(ScriptContext *ctx);
BOOL ScrCmd_298(ScriptContext *ctx);
BOOL ScrCmd_CheckEscortMode(ScriptContext *ctx);
BOOL ScrCmd_SetEscortMode(ScriptContext *ctx);
BOOL ScrCmd_ClearEscortMode(ScriptContext *ctx);
BOOL ScrCmd_302(ScriptContext *ctx);
BOOL ScrCmd_303(ScriptContext *ctx);
BOOL ScrCmd_304(ScriptContext *ctx);
BOOL ScrCmd_305(ScriptContext *ctx);
BOOL ScrCmd_306(ScriptContext *ctx);
BOOL ScrCmd_307(ScriptContext *ctx);
BOOL ScrCmd_308(ScriptContext *ctx);
BOOL ScrCmd_309(ScriptContext *ctx);
BOOL ScrCmd_310(ScriptContext *ctx);
BOOL ScrCmd_311(ScriptContext *ctx);
BOOL ScrCmd_BufferDaycareMonNicks(ScriptContext *ctx);
BOOL ScrCmd_GetDaycareState(ScriptContext *ctx);
BOOL ScrCmd_EcruteakGymInit(ScriptContext *ctx);
BOOL ScrCmd_315(ScriptContext *ctx);
BOOL ScrCmd_316(ScriptContext *ctx);
BOOL ScrCmd_317(ScriptContext *ctx);
BOOL ScrCmd_CianwoodGymInit(ScriptContext *ctx);
BOOL ScrCmd_CianwoodGymTurnWinch(ScriptContext *ctx);
BOOL ScrCmd_VermilionGymInit(ScriptContext *ctx);
BOOL ScrCmd_VermilionGymLockAction(ScriptContext *ctx);
BOOL ScrCmd_VermilionGymCanCheck(ScriptContext *ctx);
BOOL ScrCmd_ResampleVermilionGymCans(ScriptContext *ctx);
BOOL ScrCmd_VioletGymInit(ScriptContext *ctx);
BOOL ScrCmd_VioletGymElevator(ScriptContext *ctx);
BOOL ScrCmd_AzaleaGymInit(ScriptContext *ctx);
BOOL ScrCmd_AzaleaGymSpinarak(ScriptContext *ctx);
BOOL ScrCmd_AzaleaGymSwitch(ScriptContext *ctx);
BOOL ScrCmd_BlackthornGymInit(ScriptContext *ctx);
BOOL ScrCmd_FuchsiaGymInit(ScriptContext *ctx);
BOOL ScrCmd_ViridianGymInit(ScriptContext *ctx);
BOOL ScrCmd_GetPartyCount(ScriptContext *ctx);
BOOL ScrCmd_333(ScriptContext *ctx);
BOOL ScrCmd_334(ScriptContext *ctx);
BOOL ScrCmd_335(ScriptContext *ctx);
BOOL ScrCmd_BufferBerryName(ScriptContext *ctx);
BOOL ScrCmd_BufferNatureName(ScriptContext *ctx);
BOOL ScrCmd_MovePerson(ScriptContext *ctx);
BOOL ScrCmd_MovePersonFacing(ScriptContext *ctx);
BOOL ScrCmd_SetObjectMovementType(ScriptContext *ctx);
BOOL ScrCmd_SetObjectFacing(ScriptContext *ctx);
BOOL ScrCmd_MoveWarp(ScriptContext *ctx);
BOOL ScrCmd_MoveBgEvent(ScriptContext *ctx);
BOOL ScrCmd_344(ScriptContext *ctx);
BOOL ScrCmd_AddWaitingIcon(ScriptContext *ctx);
BOOL ScrCmd_RemoveWaitingIcon(ScriptContext *ctx);
BOOL ScrCmd_347(ScriptContext *ctx);
BOOL ScrCmd_WaitButtonOrDelay(ScriptContext *ctx);
BOOL ScrCmd_PartySelectUI(ScriptContext *ctx);
BOOL ScrCmd_350(ScriptContext *ctx);
BOOL ScrCmd_PartySelect(ScriptContext *ctx);
BOOL ScrCmd_PokemonSummaryScreen(ScriptContext *ctx);
BOOL ScrCmd_GetMoveSelection(ScriptContext *ctx);
BOOL ScrCmd_GetPartyMonSpecies(ScriptContext *ctx);
BOOL ScrCmd_PartymonIsMine(ScriptContext *ctx);
BOOL ScrCmd_PartyCountNotEgg(ScriptContext *ctx);
BOOL ScrCmd_CountAliveMons(ScriptContext *ctx);
BOOL ScrCmd_CountAliveMonsAndPC(ScriptContext *ctx);
BOOL ScrCmd_PartyCountEgg(ScriptContext *ctx);
BOOL ScrCmd_SubMoneyVar(ScriptContext *ctx);
BOOL ScrCmd_RetrieveDaycareMon(ScriptContext *ctx);
BOOL ScrCmd_GiveLoanMon(ScriptContext *ctx);
BOOL ScrCmd_CheckReturnLoanMon(ScriptContext *ctx);
BOOL ScrCmd_TakeMon(ScriptContext *ctx);
BOOL ScrCmd_ResetDaycareEgg(ScriptContext *ctx);
BOOL ScrCmd_GiveDaycareEgg(ScriptContext *ctx);
BOOL ScrCmd_BufferDaycareWithdrawCost(ScriptContext *ctx);
BOOL ScrCmd_HasEnoughMoneyVar(ScriptContext *ctx);
BOOL ScrCmd_EggHatchAnim(ScriptContext *ctx);
BOOL ScrCmd_370(ScriptContext *ctx);
BOOL ScrCmd_BufferDaycareMonGrowth(ScriptContext *ctx);
BOOL ScrCmd_GetTailDaycareMonSpeciesAndNick(ScriptContext *ctx);
BOOL ScrCmd_PutMonInDaycare(ScriptContext *ctx);
BOOL ScrCmd_374(ScriptContext *ctx);
BOOL ScrCmd_MakeObjectVisible(ScriptContext *ctx);
BOOL ScrCmd_376(ScriptContext *ctx);
BOOL ScrCmd_377(ScriptContext *ctx);
BOOL ScrCmd_ViewRankings(ScriptContext *ctx);
BOOL ScrCmd_379(ScriptContext *ctx);
BOOL ScrCmd_Random(ScriptContext *ctx);
BOOL ScrCmd_381(ScriptContext *ctx);
BOOL ScrCmd_MonGetFriendship(ScriptContext *ctx);
BOOL ScrCmd_MonAddFriendship(ScriptContext *ctx);
BOOL ScrCmd_MonSubtractFriendship(ScriptContext *ctx);
BOOL ScrCmd_BufferDaycareMonStats(ScriptContext *ctx);
BOOL ScrCmd_GetPlayerFacing(ScriptContext *ctx);
BOOL ScrCmd_GetDaycareCompatibility(ScriptContext *ctx);
BOOL ScrCmd_CheckDaycareEgg(ScriptContext *ctx);
BOOL ScrCmd_PlayerHasSpecies(ScriptContext *ctx);
BOOL ScrCmd_SizeRecordCompare(ScriptContext *ctx);
BOOL ScrCmd_SizeRecordUpdate(ScriptContext *ctx);
BOOL ScrCmd_BufferMonSize(ScriptContext *ctx);
BOOL ScrCmd_BufferRecordSize(ScriptContext *ctx);
BOOL ScrCmd_394(ScriptContext *ctx);
BOOL ScrCmd_395(ScriptContext *ctx);
BOOL ScrCmd_CountMonMoves(ScriptContext *ctx);
BOOL ScrCmd_MonForgetMove(ScriptContext *ctx);
BOOL ScrCmd_MonGetMove(ScriptContext *ctx);
BOOL ScrCmd_BufferPartyMonMoveName(ScriptContext *ctx);
BOOL ScrCmd_StrengthFlagAction(ScriptContext *ctx);
BOOL ScrCmd_FlashAction(ScriptContext *ctx);
BOOL ScrCmd_DefogAction(ScriptContext *ctx);
BOOL ScrCmd_403(ScriptContext *ctx);
BOOL ScrCmd_404(ScriptContext *ctx);
BOOL ScrCmd_405(ScriptContext *ctx);
BOOL ScrCmd_406(ScriptContext *ctx);
BOOL ScrCmd_407(ScriptContext *ctx);
BOOL ScrCmd_408(ScriptContext *ctx);
BOOL ScrCmd_409(ScriptContext *ctx);
BOOL ScrCmd_410(ScriptContext *ctx);
BOOL ScrCmd_411(ScriptContext *ctx);
BOOL ScrCmd_412(ScriptContext *ctx);
BOOL ScrCmd_413(ScriptContext *ctx);
BOOL ScrCmd_414(ScriptContext *ctx);
BOOL ScrCmd_415(ScriptContext *ctx);
BOOL ScrCmd_416(ScriptContext *ctx);
BOOL ScrCmd_417(ScriptContext *ctx);
BOOL ScrCmd_418(ScriptContext *ctx);
BOOL ScrCmd_419(ScriptContext *ctx);
BOOL ScrCmd_420(ScriptContext *ctx);
BOOL ScrCmd_421(ScriptContext *ctx);
BOOL ScrCmd_422(ScriptContext *ctx);
BOOL ScrCmd_CheckJohtoDexComplete(ScriptContext *ctx);
BOOL ScrCmd_CheckNationalDexComplete(ScriptContext *ctx);
BOOL ScrCmd_ShowCertificate(ScriptContext *ctx);
BOOL ScrCmd_KenyaCheck(ScriptContext *ctx);
BOOL ScrCmd_427(ScriptContext *ctx);
BOOL ScrCmd_MonGiveMail(ScriptContext *ctx);
BOOL ScrCmd_CountFossils(ScriptContext *ctx);
BOOL ScrCmd_SetPhoneCall(ScriptContext *ctx);
BOOL ScrCmd_RunPhoneCall(ScriptContext *ctx);
BOOL ScrCmd_GetFossilPokemon(ScriptContext *ctx);
BOOL ScrCmd_GetFossilMinimumAmount(ScriptContext *ctx);
BOOL ScrCmd_PartyCountMonsAtOrBelowLevel(ScriptContext *ctx);
BOOL ScrCmd_SurvivePoisoning(ScriptContext *ctx);
BOOL ScrCmd_436(ScriptContext *ctx);
BOOL ScrCmd_DebugWatch(ScriptContext *ctx);
BOOL ScrCmd_GetStdMsgNaix(ScriptContext *ctx);
BOOL ScrCmd_NonNpcMsgExtern(ScriptContext *ctx);
BOOL ScrCmd_MsgboxExtern(ScriptContext *ctx);
BOOL ScrCmd_441(ScriptContext *ctx);
BOOL ScrCmd_442(ScriptContext *ctx);
BOOL ScrCmd_443(ScriptContext *ctx);
BOOL ScrCmd_444(ScriptContext *ctx);
BOOL ScrCmd_445(ScriptContext *ctx);
BOOL ScrCmd_446(ScriptContext *ctx);
BOOL ScrCmd_SafariZoneAction(ScriptContext *ctx);
BOOL ScrCmd_448(ScriptContext *ctx);
BOOL ScrCmd_449(ScriptContext *ctx);
BOOL ScrCmd_450(ScriptContext *ctx);
BOOL ScrCmd_451(ScriptContext *ctx);
BOOL ScrCmd_452(ScriptContext *ctx);
BOOL ScrCmd_453(ScriptContext *ctx);
BOOL ScrCmd_454(ScriptContext *ctx);
BOOL ScrCmd_455(ScriptContext *ctx);
BOOL ScrCmd_456(ScriptContext *ctx);
BOOL ScrCmd_MonGetNature(ScriptContext *ctx);
BOOL ScrCmd_GetPartySlotWithNature(ScriptContext *ctx);
BOOL ScrCmd_459(ScriptContext *ctx);
BOOL ScrCmd_LoadPhoneDat(ScriptContext *ctx);
BOOL ScrCmd_GetPhoneContactMsgIds(ScriptContext *ctx);
BOOL ScrCmd_462(ScriptContext *ctx);
BOOL ScrCmd_EnableMassOutbreaks(ScriptContext *ctx);
BOOL ScrCmd_CreateRoamer(ScriptContext *ctx);
BOOL ScrCmd_465(ScriptContext *ctx);
BOOL ScrCmd_466(ScriptContext *ctx);
BOOL ScrCmd_MoveRelearner(ScriptContext *ctx);
BOOL ScrCmd_MoveTutor(ScriptContext *ctx);
BOOL ScrCmd_MoveRelearnerGetResult(ScriptContext *ctx);
BOOL ScrCmd_LoadNPCTrade(ScriptContext *ctx);
BOOL ScrCmd_GetOfferedSpecies(ScriptContext *ctx);
BOOL ScrCmd_NPCTradeGetReqSpecies(ScriptContext *ctx);
BOOL ScrCmd_NPCTradeExec(ScriptContext *ctx);
BOOL ScrCmd_NPCTradeEnd(ScriptContext *ctx);
BOOL ScrCmd_475(ScriptContext *ctx);
BOOL ScrCmd_476(ScriptContext *ctx);
BOOL ScrCmd_NatDexFlagAction(ScriptContext *ctx);
BOOL ScrCmd_MonGetRibbonCount(ScriptContext *ctx);
BOOL ScrCmd_GetPartyRibbonCount(ScriptContext *ctx);
BOOL ScrCmd_MonHasRibbon(ScriptContext *ctx);
BOOL ScrCmd_GiveRibbon(ScriptContext *ctx);
BOOL ScrCmd_BufferRibbonName(ScriptContext *ctx);
BOOL ScrCmd_GetEVTotal(ScriptContext *ctx);
BOOL ScrCmd_GetWeekday(ScriptContext *ctx);
BOOL ScrCmd_485(ScriptContext *ctx);
BOOL ScrCmd_Dummy(ScriptContext *ctx);
BOOL ScrCmd_PokeCenAnim(ScriptContext *ctx);
BOOL ScrCmd_ElevatorAnim(ScriptContext *ctx);
BOOL ScrCmd_MysteryGift(ScriptContext *ctx);
BOOL ScrCmd_NopVar490(ScriptContext *ctx);
BOOL ScrCmd_491(ScriptContext *ctx);
BOOL ScrCmd_492(ScriptContext *ctx);
BOOL ScrCmd_PromptEasyChat(ScriptContext *ctx);
BOOL ScrCmd_494(ScriptContext *ctx);
BOOL ScrCmd_GetGameVersion(ScriptContext *ctx);
BOOL ScrCmd_GetPartyLead(ScriptContext *ctx);
BOOL ScrCmd_GetMonTypes(ScriptContext *ctx);
BOOL ScrCmd_PrimoPasswordCheck1(ScriptContext *ctx);
BOOL ScrCmd_PrimoPasswordCheck2(ScriptContext *ctx);
BOOL ScrCmd_500(ScriptContext *ctx);
BOOL ScrCmd_501(ScriptContext *ctx);
BOOL ScrCmd_502(ScriptContext *ctx);
BOOL ScrCmd_LotoIdGet(ScriptContext *ctx);
BOOL ScrCmd_LotoIdSearch(ScriptContext *ctx);
BOOL ScrCmd_LotoIdSet(ScriptContext *ctx);
BOOL ScrCmd_BufferBoxMonNick(ScriptContext *ctx);
BOOL ScrCmd_CountPCEmptySpace(ScriptContext *ctx);
BOOL ScrCmd_PalParkAction(ScriptContext *ctx);
BOOL ScrCmd_509(ScriptContext *ctx);
BOOL ScrCmd_510(ScriptContext *ctx);
BOOL ScrCmd_PalParkScoreGet(ScriptContext *ctx);
BOOL ScrCmd_PlayerMovementSavingSet(ScriptContext *ctx);
BOOL ScrCmd_PlayerMovementSavingClear(ScriptContext *ctx);
BOOL ScrCmd_HallOfFameAnim(ScriptContext *ctx);
BOOL ScrCmd_AddSpecialGameStat(ScriptContext *ctx);
BOOL ScrCmd_BufferFashionName(ScriptContext *ctx);
BOOL ScrCmd_517(ScriptContext *ctx);
BOOL ScrCmd_518(ScriptContext *ctx);
BOOL ScrCmd_519(ScriptContext *ctx);
BOOL ScrCmd_520(ScriptContext *ctx);
BOOL ScrCmd_521(ScriptContext *ctx);
BOOL ScrCmd_522(ScriptContext *ctx);
BOOL ScrCmd_523(ScriptContext *ctx);
BOOL ScrCmd_524(ScriptContext *ctx);
BOOL ScrCmd_525(ScriptContext *ctx);
BOOL ScrCmd_526(ScriptContext *ctx);
BOOL ScrCmd_527(ScriptContext *ctx);
BOOL ScrCmd_528(ScriptContext *ctx);
BOOL ScrCmd_GetPartyLeadAlive(ScriptContext *ctx);
BOOL ScrCmd_530(ScriptContext *ctx);
BOOL ScrCmd_BufferBackgroundName(ScriptContext *ctx);
BOOL ScrCmd_CheckCoinsImmediate(ScriptContext *ctx);
BOOL ScrCmd_CheckGiveCoins(ScriptContext *ctx);
BOOL ScrCmd_534(ScriptContext *ctx);
BOOL ScrCmd_MonGetLevel(ScriptContext *ctx);
BOOL ScrCmd_536(ScriptContext *ctx);
BOOL ScrCmd_537(ScriptContext *ctx);
BOOL ScrCmd_538(ScriptContext *ctx);
BOOL ScrCmd_539(ScriptContext *ctx);
BOOL ScrCmd_540(ScriptContext *ctx);
BOOL ScrCmd_BufferIntEx(ScriptContext *ctx);
BOOL ScrCmd_MonGetContestValue(ScriptContext *ctx);
BOOL ScrCmd_543(ScriptContext *ctx);
BOOL ScrCmd_544(ScriptContext *ctx);
BOOL ScrCmd_545(ScriptContext *ctx);
BOOL ScrCmd_546(ScriptContext *ctx);
BOOL ScrCmd_547(ScriptContext *ctx);
BOOL ScrCmd_548(ScriptContext *ctx);
BOOL ScrCmd_549(ScriptContext *ctx);
BOOL ScrCmd_550(ScriptContext *ctx);
BOOL ScrCmd_551(ScriptContext *ctx);
BOOL ScrCmd_552(ScriptContext *ctx);
BOOL ScrCmd_553(ScriptContext *ctx);
BOOL ScrCmd_554(ScriptContext *ctx);
BOOL ScrCmd_555(ScriptContext *ctx);
BOOL ScrCmd_556(ScriptContext *ctx);
BOOL ScrCmd_CheckBattlePoints(ScriptContext *ctx);
BOOL ScrCmd_UnionRoomAvatarIdxToSprite(ScriptContext *ctx);
BOOL ScrCmd_559(ScriptContext *ctx);
BOOL ScrCmd_560(ScriptContext *ctx);
BOOL ScrCmd_ScreenShake(ScriptContext *ctx);
BOOL ScrCmd_MultiBattle(ScriptContext *ctx);
BOOL ScrCmd_563(ScriptContext *ctx);
BOOL ScrCmd_564(ScriptContext *ctx);
BOOL ScrCmd_565(ScriptContext *ctx);
BOOL ScrCmd_566(ScriptContext *ctx);
BOOL ScrCmd_GetDPPlPrizeItemIdAndCost(ScriptContext *ctx);
BOOL ScrCmd_568(ScriptContext *ctx);
BOOL ScrCmd_569(ScriptContext *ctx);
BOOL ScrCmd_CheckCoinsVar(ScriptContext *ctx);
BOOL ScrCmd_571(ScriptContext *ctx);
BOOL ScrCmd_GetUniqueSealsQuantity(ScriptContext *ctx);
BOOL ScrCmd_573(ScriptContext *ctx);
BOOL ScrCmd_574(ScriptContext *ctx);
BOOL ScrCmd_575(ScriptContext *ctx);
BOOL ScrCmd_576(ScriptContext *ctx);
BOOL ScrCmd_577(ScriptContext *ctx);
BOOL ScrCmd_578(ScriptContext *ctx);
BOOL ScrCmd_579(ScriptContext *ctx);
BOOL ScrCmd_BufferSealName(ScriptContext *ctx);
BOOL ScrCmd_LockLastTalked(ScriptContext *ctx);
BOOL ScrCmd_582(ScriptContext *ctx);
BOOL ScrCmd_583(ScriptContext *ctx);
BOOL ScrCmd_PartyLegalCheck(ScriptContext *ctx);
BOOL ScrCmd_585(ScriptContext *ctx);
BOOL ScrCmd_586(ScriptContext *ctx);
BOOL ScrCmd_587(ScriptContext *ctx);
BOOL Scrcmd_LatiCaughtCheck(ScriptContext *ctx);
BOOL ScrCmd_WildBattle(ScriptContext *ctx);
BOOL ScrCmd_GetTrcardStars(ScriptContext *ctx);
BOOL ScrCmd_591(ScriptContext *ctx);
BOOL ScrCmd_592(ScriptContext *ctx);
BOOL ScrCmd_ShowSaveStats(ScriptContext *ctx);
BOOL ScrCmd_HideSaveStats(ScriptContext *ctx);
BOOL ScrCmd_595(ScriptContext *ctx);
BOOL ScrCmd_596(ScriptContext *ctx);
BOOL ScrCmd_597(ScriptContext *ctx);
BOOL ScrCmd_598(ScriptContext *ctx);
BOOL ScrCmd_599(ScriptContext *ctx);
BOOL ScrCmd_600(ScriptContext *ctx);
BOOL ScrCmd_FollowMonFacePlayer(ScriptContext *ctx);
BOOL ScrCmd_ToggleFollowingPokemonMovement(ScriptContext *ctx);
BOOL ScrCmd_WaitFollowingPokemonMovement(ScriptContext *ctx);
BOOL ScrCmd_FollowingPokemonMovement(ScriptContext *ctx);
BOOL ScrCmd_605(ScriptContext *ctx);
BOOL ScrCmd_606(ScriptContext *ctx);
BOOL ScrCmd_607(ScriptContext *ctx);
BOOL ScrCmd_608(ScriptContext *ctx);
BOOL ScrCmd_609(ScriptContext *ctx);
BOOL ScrCmd_610(ScriptContext *ctx);
BOOL ScrCmd_Pokeathlon(ScriptContext *ctx);
BOOL ScrCmd_GetNpcTradeUnusedFlag(ScriptContext *ctx);
BOOL ScrCmd_GetPhoneContactRandomGiftBerry(ScriptContext *ctx);
BOOL ScrCmd_GetPhoneContactGiftItem(ScriptContext *ctx);
BOOL ScrCmd_CameronPhoto(ScriptContext *ctx);
BOOL ScrCmd_CountSavedPhotos(ScriptContext *ctx);
BOOL ScrCmd_OpenPhotoAlbum(ScriptContext *ctx);
BOOL ScrCmd_PhotoAlbumIsFull(ScriptContext *ctx);
BOOL ScrCmd_RocketCostumeFlagCheck(ScriptContext *ctx);
BOOL ScrCmd_RocketCostumeFlagAction(ScriptContext *ctx);
BOOL ScrCmd_PlaceStarterBallsInElmsLab(ScriptContext *ctx);
BOOL ScrCmd_622(ScriptContext *ctx);
BOOL ScrCmd_AnimApricornTree(ScriptContext *ctx);
BOOL ScrCmd_ApricornTreeGetApricorn(ScriptContext *ctx);
BOOL ScrCmd_GiveApricornFromTree(ScriptContext *ctx);
BOOL ScrCmd_BufferApricornName(ScriptContext *ctx);
BOOL ScrCmd_627(ScriptContext *ctx);
BOOL ScrCmd_628(ScriptContext *ctx);
BOOL ScrCmd_629(ScriptContext *ctx);
BOOL ScrCmd_630(ScriptContext *ctx);
BOOL ScrCmd_631(ScriptContext *ctx);
BOOL ScrCmd_CountPartyMonsOfSpecies(ScriptContext *ctx);
BOOL ScrCmd_633(ScriptContext *ctx);
BOOL ScrCmd_634(ScriptContext *ctx);
BOOL ScrCmd_635(ScriptContext *ctx);
BOOL ScrCmd_636(ScriptContext *ctx);
BOOL ScrCmd_637(ScriptContext *ctx);
BOOL ScrCmd_638(ScriptContext *ctx);
BOOL ScrCmd_639(ScriptContext *ctx);
BOOL ScrCmd_640(ScriptContext *ctx);
BOOL ScrCmd_SaveWipeExtraChunks(ScriptContext *ctx);
BOOL ScrCmd_642(ScriptContext *ctx);
BOOL ScrCmd_643(ScriptContext *ctx);
BOOL ScrCmd_644(ScriptContext *ctx);
BOOL ScrCmd_645(ScriptContext *ctx);
BOOL ScrCmd_646(ScriptContext *ctx);
BOOL ScrCmd_GetPartySlotWithSpecies(ScriptContext *ctx);
BOOL ScrCmd_648(ScriptContext *ctx);
BOOL ScrCmd_ScratchOffCard(ScriptContext *ctx);
BOOL ScrCmd_ScratchOffCardEnd(ScriptContext *ctx);
BOOL ScrCmd_GetScratchOffPrize(ScriptContext *ctx);
BOOL ScrCmd_652(ScriptContext *ctx);
BOOL ScrCmd_MoveTutorChooseMove(ScriptContext *ctx);
BOOL ScrCmd_TutorMoveTeachInSlot(ScriptContext *ctx);
BOOL ScrCmd_TutorMoveGetPrice(ScriptContext *ctx);
BOOL ScrCmd_656(ScriptContext *ctx);
BOOL ScrCmd_StatJudge(ScriptContext *ctx);
BOOL ScrCmd_BufferStatName(ScriptContext *ctx);
BOOL ScrCmd_SetMonForm(ScriptContext *ctx);
BOOL ScrCmd_BufferTrainerName(ScriptContext *ctx);
BOOL ScrCmd_661(ScriptContext *ctx);
BOOL ScrCmd_662(ScriptContext *ctx);
BOOL ScrCmd_663(ScriptContext *ctx);
BOOL ScrCmd_664(ScriptContext *ctx);
BOOL ScrCmd_665(ScriptContext *ctx);
BOOL ScrCmd_666(ScriptContext *ctx);
BOOL ScrCmd_667(ScriptContext *ctx);
BOOL ScrCmd_BufferTypeName(ScriptContext *ctx);
BOOL ScrCmd_GetItemQuantity(ScriptContext *ctx);
BOOL ScrCmd_GetHiddenPowerType(ScriptContext *ctx);
BOOL ScrCmd_SetFavoriteMon(ScriptContext *ctx);
BOOL ScrCmd_GetFavoriteMon(ScriptContext *ctx);
BOOL ScrCmd_GetOwnedRotomForms(ScriptContext *ctx);
BOOL ScrCmd_CountTranformedRotomsInParty(ScriptContext *ctx);
BOOL ScrCmd_UpdateRotomForm(ScriptContext *ctx);
BOOL ScrCmd_GetPartyMonForm(ScriptContext *ctx);
BOOL ScrCmd_677(ScriptContext *ctx);
BOOL ScrCmd_678(ScriptContext *ctx);
BOOL ScrCmd_679(ScriptContext *ctx);
BOOL ScrCmd_AddSpecialGameStat2(ScriptContext *ctx);
BOOL ScrCmd_681(ScriptContext *ctx);
BOOL ScrCmd_682(ScriptContext *ctx);
BOOL ScrCmd_GetStaticEncounterOutcomeFlag(ScriptContext *ctx);
BOOL ScrCmd_684(ScriptContext *ctx);
BOOL ScrCmd_GetPlayerXYZ(ScriptContext *ctx);
BOOL ScrCmd_686(ScriptContext *ctx);
BOOL ScrCmd_687(ScriptContext *ctx);
BOOL ScrCmd_GetPartySlotWithFatefulEncounter(ScriptContext *ctx);
BOOL ScrCmd_CommSanitizeParty(ScriptContext *ctx);
BOOL ScrCmd_DaycareSanitizeMon(ScriptContext *ctx);
BOOL ScrCmd_691(ScriptContext *ctx);
BOOL ScrCmd_BufferBattleHallStreak(ScriptContext *ctx);
BOOL ScrCmd_BattleHallCountUsedSpecies(ScriptContext *ctx);
BOOL ScrCmd_BattleHallGetTotalStreak(ScriptContext *ctx);
BOOL ScrCmd_695(ScriptContext *ctx);
BOOL ScrCmd_696(ScriptContext *ctx);
BOOL ScrCmd_697(ScriptContext *ctx);
BOOL ScrCmd_FollowerPokeIsEventTrigger(ScriptContext *ctx);
BOOL ScrCmd_699(ScriptContext *ctx);
BOOL ScrCmd_700(ScriptContext *ctx);
BOOL ScrCmd_MonHasItem(ScriptContext *ctx);
BOOL ScrCmd_BattleTowerSetUpMultiBattle(ScriptContext *ctx);
BOOL ScrCmd_SetPlayerVolume(ScriptContext *ctx);
BOOL ScrCmd_704(ScriptContext *ctx);
BOOL ScrCmd_705(ScriptContext *ctx);
BOOL ScrCmd_706(ScriptContext *ctx);
BOOL ScrCmd_CheckMonSeen(ScriptContext *ctx);
BOOL ScrCmd_708(ScriptContext *ctx);
BOOL ScrCmd_709(ScriptContext *ctx);
BOOL ScrCmd_710(ScriptContext *ctx);
BOOL ScrCmd_FollowMonInteract(ScriptContext *ctx);
BOOL ScrCmd_712(ScriptContext *ctx);
BOOL ScrCmd_AlphPuzzle(ScriptContext *ctx);
BOOL ScrCmd_OpenAlphHiddenRoom(ScriptContext *ctx);
BOOL ScrCmd_UpdateDaycareMonObjects(ScriptContext *ctx);
BOOL ScrCmd_716(ScriptContext *ctx);
BOOL ScrCmd_717(ScriptContext *ctx);
BOOL ScrCmd_718(ScriptContext *ctx);
BOOL ScrCmd_719(ScriptContext *ctx);
BOOL ScrCmd_720(ScriptContext *ctx);
BOOL ScrCmd_721(ScriptContext *ctx);
BOOL ScrCmd_722(ScriptContext *ctx);
BOOL ScrCmd_723(ScriptContext *ctx);
BOOL ScrCmd_724(ScriptContext *ctx);
BOOL ScrCmd_725(ScriptContext *ctx);
BOOL ScrCmd_726(ScriptContext *ctx);
BOOL ScrCmd_GetFollowPokePartyIndex(ScriptContext *ctx);
BOOL ScrCmd_728(ScriptContext *ctx);
BOOL ScrCmd_729(ScriptContext *ctx);
BOOL ScrCmd_730(ScriptContext *ctx);
BOOL ScrCmd_731(ScriptContext *ctx);
BOOL ScrCmd_732(ScriptContext *ctx);
BOOL ScrCmd_733(ScriptContext *ctx);
BOOL ScrCmd_734(ScriptContext *ctx);
BOOL ScrCmd_735(ScriptContext *ctx);
BOOL ScrCmd_ClearKurtApricorn(ScriptContext *ctx);
BOOL ScrCmd_737(ScriptContext *ctx);
BOOL ScrCmd_GetTotalApricornCount(ScriptContext *ctx);
BOOL ScrCmd_739(ScriptContext *ctx);
BOOL ScrCmd_740(ScriptContext *ctx);
BOOL ScrCmd_741(ScriptContext *ctx);
BOOL ScrCmd_742(ScriptContext *ctx);
BOOL ScrCmd_743(ScriptContext *ctx);
BOOL ScrCmd_CreatePokeathlonFriendshipRoomStatues(ScriptContext *ctx);
BOOL ScrCmd_BufferPokeathlonCourseName(ScriptContext *ctx);
BOOL ScrCmd_TouchscreenMenuHide(ScriptContext *ctx);
BOOL ScrCmd_TouchscreenMenuShow(ScriptContext *ctx);
BOOL ScrCmd_GetMenuChoice(ScriptContext *ctx);
BOOL ScrCmd_MenuInitStdGmm(ScriptContext *ctx);
BOOL ScrCmd_MenuInit(ScriptContext *ctx);
BOOL ScrCmd_MenuItemAdd(ScriptContext *ctx);
BOOL ScrCmd_MenuExec(ScriptContext *ctx);
BOOL ScrCmd_RockSmashItemCheck(ScriptContext *ctx);
BOOL ScrCmd_TryHeadbuttEncounter(ScriptContext *ctx);
BOOL ScrCmd_LegendCutsceneClearBellAnimBegin(ScriptContext *ctx);
BOOL ScrCmd_LegendCutsceneClearBellAnimEnd(ScriptContext *ctx);
BOOL ScrCmd_LegendCutsceneClearBellRiseFromBag(ScriptContext *ctx);
BOOL ScrCmd_LegendCutsceneClearBellShimmer(ScriptContext *ctx);
BOOL ScrCmd_LegendCutsceneLugiaEyeGlimmerEffect(ScriptContext *ctx);
BOOL ScrCmd_760(ScriptContext *ctx);
BOOL ScrCmd_LegendCutsceneMoveCameraTo(ScriptContext *ctx);
BOOL ScrCmd_LegendCutscenePanCameraTo(ScriptContext *ctx);
BOOL ScrCmd_LegendCutsceneWaitCameraPan(ScriptContext *ctx);
BOOL ScrCmd_LegendCutsceneBirdFinalApproach(ScriptContext *ctx);
BOOL ScrCmd_LegendCutsceneWavesOrLeavesEffectBegin(ScriptContext *ctx);
BOOL ScrCmd_LegendCutsceneWavesOrLeavesEffectEnd(ScriptContext *ctx);
BOOL ScrCmd_LegendCutsceneLugiaArrivesEffectBegin(ScriptContext *ctx);
BOOL ScrCmd_LegendCutsceneLugiaArrivesEffectEnd(ScriptContext *ctx);
BOOL ScrCmd_LegendCutsceneLugiaArrivesEffectCameraPan(ScriptContext *ctx);
BOOL ScrCmd_CheckSeenAllLetterUnown(ScriptContext *ctx);
BOOL ScrCmd_771(ScriptContext *ctx);
BOOL ScrCmd_772(ScriptContext *ctx);
BOOL ScrCmd_Cinematic(ScriptContext *ctx);
BOOL ScrCmd_ShowLegendaryWing(ScriptContext *ctx);
BOOL ScrCmd_775(ScriptContext *ctx);
BOOL ScrCmd_GiveTogepiEgg(ScriptContext *ctx);
BOOL ScrCmd_777(ScriptContext *ctx);
BOOL ScrCmd_GiveSpikyEarPichu(ScriptContext *ctx);
BOOL ScrCmd_RadioMusicIsPlaying(ScriptContext *ctx);
BOOL ScrCmd_CasinoGame(ScriptContext *ctx);
BOOL ScrCmd_KenyaCheckPartyOrMailbox(ScriptContext *ctx);
BOOL ScrCmd_MartSell(ScriptContext *ctx);
BOOL ScrCmd_SetFollowMonInhibitState(ScriptContext *ctx);
BOOL ScrCmd_ScriptOverlayCmd(ScriptContext *ctx);
BOOL ScrCmd_BugContestAction(ScriptContext *ctx);
BOOL ScrCmd_BufferBugContestWinner(ScriptContext *ctx);
BOOL ScrCmd_JudgeBugContest(ScriptContext *ctx);
BOOL ScrCmd_BufferBugContestMonNick(ScriptContext *ctx);
BOOL ScrCmd_BugContestGetTimeLeft(ScriptContext *ctx);
BOOL ScrCmd_IsBugContestantRegistered(ScriptContext *ctx);
BOOL ScrCmd_791(ScriptContext *ctx);
BOOL ScrCmd_792(ScriptContext *ctx);
BOOL ScrCmd_BankTransaction(ScriptContext *ctx);
BOOL ScrCmd_CheckBankBalance(ScriptContext *ctx);
BOOL ScrCmd_795(ScriptContext *ctx);
BOOL ScrCmd_796(ScriptContext *ctx);
BOOL ScrCmd_797(ScriptContext *ctx);
BOOL ScrCmd_BufferRulesetName(ScriptContext *ctx);
BOOL ScrCmd_799(ScriptContext *ctx);
BOOL ScrCmd_800(ScriptContext *ctx);
BOOL ScrCmd_801(ScriptContext *ctx);
BOOL ScrCmd_802(ScriptContext *ctx);
BOOL ScrCmd_803(ScriptContext *ctx);
BOOL ScrCmd_804(ScriptContext *ctx);
BOOL ScrCmd_805(ScriptContext *ctx);
BOOL ScrCmd_806(ScriptContext *ctx);
BOOL ScrCmd_SetTrainerHouseSprite(ScriptContext *ctx);
BOOL ScrCmd_808(ScriptContext *ctx);
BOOL ScrCmd_ShowTrainerHouseIntroMessage(ScriptContext *ctx);
BOOL ScrCmd_810(ScriptContext *ctx);
BOOL ScrCmd_811(ScriptContext *ctx);
BOOL ScrCmd_812(ScriptContext *ctx);
BOOL ScrCmd_MomGiftCheck(ScriptContext *ctx);
BOOL ScrCmd_814(ScriptContext *ctx);
BOOL ScrCmd_815(ScriptContext *ctx);
BOOL ScrCmd_UnownCircle(ScriptContext *ctx);
BOOL ScrCmd_817(ScriptContext *ctx);
BOOL ScrCmd_MystriStageGymmickInit(ScriptContext *ctx);
BOOL ScrCmd_819(ScriptContext *ctx);
BOOL ScrCmd_820(ScriptContext *ctx);
BOOL ScrCmd_GetBuenasPassword(ScriptContext *ctx);
BOOL ScrCmd_822(ScriptContext *ctx);
BOOL ScrCmd_823(ScriptContext *ctx);
BOOL ScrCmd_824(ScriptContext *ctx);
BOOL ScrCmd_GetShinyLeafCount(ScriptContext *ctx);
BOOL ScrCmd_TryGiveShinyLeafCrown(ScriptContext *ctx);
BOOL ScrCmd_GetPartymonForm(ScriptContext *ctx);
BOOL ScrCmd_MonAddContestValue(ScriptContext *ctx);
BOOL ScrCmd_829(ScriptContext *ctx);
BOOL ScrCmd_830(ScriptContext *ctx);
BOOL ScrCmd_831(ScriptContext *ctx);
BOOL ScrCmd_832(ScriptContext *ctx);
BOOL ScrCmd_833(ScriptContext *ctx);
BOOL ScrCmd_834(ScriptContext *ctx);
BOOL ScrCmd_835(ScriptContext *ctx);
BOOL ScrCmd_CheckKyogreGroudonInParty(ScriptContext *ctx);
BOOL ScrCmd_837(ScriptContext *ctx);
BOOL ScrCmd_BankOrWalletIsFull(ScriptContext *ctx);
BOOL ScrCmd_SysSetSleepFlag(ScriptContext *ctx);
BOOL ScrCmd_840(ScriptContext *ctx);
BOOL ScrCmd_841(ScriptContext *ctx);
BOOL ScrCmd_842(ScriptContext *ctx);
BOOL ScrCmd_BufferItemNameIndef(ScriptContext *ctx);
BOOL ScrCmd_BufferItemNamePlural(ScriptContext *ctx);
BOOL ScrCmd_BufferPartyMonSpeciesNameIndef(ScriptContext *ctx);
BOOL ScrCmd_BufferSpeciesNameIndef(ScriptContext *ctx);
BOOL ScrCmd_BufferDPPtFriendStarterSpeciesNameIndef(ScriptContext *ctx);
BOOL ScrCmd_BufferFashionNameIndef(ScriptContext *ctx);
BOOL ScrCmd_BufferTrainerClassNameIndef(ScriptContext *ctx);
BOOL ScrCmd_BufferSealNamePlural(ScriptContext *ctx);
BOOL ScrCmd_Capitalize(ScriptContext *ctx);
BOOL ScrCmd_BufferDeptStoreFloorNo(ScriptContext *ctx);

const ScrCmdFunc gScriptCmdTable[] = {
    ScrCmd_Nop,
    ScrCmd_Dummy,
    ScrCmd_End,
    ScrCmd_Wait,
    ScrCmd_LoadByte,
    ScrCmd_LoadWord,
    ScrCmd_LoadByteFromAddr,
    ScrCmd_WriteByteToAddr,
    ScrCmd_SetPtrByte,
    ScrCmd_CopyLocal,
    ScrCmd_CopyByte,
    ScrCmd_CompareLocalToLocal,
    ScrCmd_CompareLocalToValue,
    ScrCmd_CompareLocalToAddr,
    ScrCmd_CompareAddrToLocal,
    ScrCmd_CompareAddrToValue,
    ScrCmd_CompareAddrToAddr,
    ScrCmd_CompareVarToValue,
    ScrCmd_CompareVarToVar,
    ScrCmd_RunScript,
    ScrCmd_CallStd,
    ScrCmd_RestartCurrentScript,
    ScrCmd_GoTo,
    ScrCmd_ObjectGoTo,
    ScrCmd_BgGoTo,
    ScrCmd_DirectionGoTo,
    ScrCmd_Call,
    ScrCmd_Return,
    ScrCmd_GoToIf,
    ScrCmd_CallIf,
    ScrCmd_SetFlag,
    ScrCmd_ClearFlag,
    ScrCmd_CheckFlag,
    ScrCmd_SetFlagVar,
    ScrCmd_ClearFlagVar,
    ScrCmd_CheckFlagVar,
    ScrCmd_SetTrainerFlag,
    ScrCmd_ClearTrainerFlag,
    ScrCmd_CheckTrainerFlag,
    ScrCmd_AddVar,
    ScrCmd_SubVar,
    ScrCmd_SetVar,
    ScrCmd_CopyVar,
    ScrCmd_SetOrCopyVar,
    ScrCmd_NonNPCMsg,
    ScrCmd_NPCMsg,
    ScrCmd_NonNpcMsgVar,
    ScrCmd_NpcMsgVar,
    ScrCmd_048,
    ScrCmd_WaitButton,
    ScrCmd_WaitButtonOrWalkAway,
    ScrCmd_WaitButtonOrDpad,
    ScrCmd_OpenMsg,
    ScrCmd_CloseMsg,
    ScrCmd_HoldMsg,
    ScrCmd_DirectionSignpost,
    ScrCmd_055,
    ScrCmd_057,
    ScrCmd_058,
    ScrCmd_TrainerTips,
    ScrCmd_060,
    ScrCmd_061,
    ScrCmd_062,
    ScrCmd_YesNo,
    ScrCmd_064,
    ScrCmd_065,
    ScrCmd_066,
    ScrCmd_067,
    ScrCmd_068,
    ScrCmd_069,
    ScrCmd_070,
    ScrCmd_071,
    ScrCmd_072,
    ScrCmd_PlaySE,
    ScrCmd_StopSE,
    ScrCmd_WaitSE,
    ScrCmd_PlayCry,
    ScrCmd_WaitCry,
    ScrCmd_PlayFanfare,
    ScrCmd_WaitFanfare,
    ScrCmd_PlayBGM,
    ScrCmd_StopBGM,
    ScrCmd_ResetBGM,
    ScrCmd_083,
    ScrCmd_FadeOutBGM,
    ScrCmd_FadeInBGM,
    ScrCmd_086,
    ScrCmd_TempBGM,
    ScrCmd_088,
    ScrCmd_ChatotHasCry,
    ScrCmd_ChatotStartRecording,
    ScrCmd_ChatotStopRecording,
    ScrCmd_ChatotSaveRecording,
    ScrCmd_093,
    ScrCmd_ApplyMovement,
    ScrCmd_WaitMovement,
    ScrCmd_LockAll,
    ScrCmd_ReleaseAll,
    ScrCmd_098,
    ScrCmd_099,
    ScrCmd_ShowPerson,
    ScrCmd_HidePerson,
    ScrCmd_102,
    ScrCmd_103,
    ScrCmd_FacePlayer,
    ScrCmd_GetPlayerCoords,
    ScrCmd_GetPersonCoords,
    ScrCmd_107,
    ScrCmd_108,
    ScrCmd_109,
    ScrCmd_AddMoney,
    ScrCmd_SubMoneyImmediate,
    ScrCmd_HasEnoughMoneyImmediate,
    ScrCmd_ShowMoneyBox,
    ScrCmd_HideMoneyBox,
    ScrCmd_UpdateMoneyBox,
    ScrCmd_116,
    ScrCmd_117,
    ScrCmd_118,
    ScrCmd_GetCoinAmount,
    ScrCmd_GiveCoins,
    ScrCmd_TakeCoins,
    ScrCmd_GiveAthletePoints,
    ScrCmd_TakeAthletePoints,
    ScrCmd_CheckAthletePoints,
    ScrCmd_GiveItem,
    ScrCmd_TakeItem,
    ScrCmd_HasSpaceForItem,
    ScrCmd_HasItem,
    ScrCmd_ItemIsTMOrHM,
    ScrCmd_GetItemPocket,
    ScrCmd_SetStarterChoice,
    ScrCmd_GenderMsgbox,
    ScrCmd_GetSealQuantity,
    ScrCmd_GiveOrTakeSeal,
    ScrCmd_GiveRandomSeal,
    ScrCmd_136,
    ScrCmd_GiveMon,
    ScrCmd_GiveEgg,
    ScrCmd_SetMonMove,
    ScrCmd_MonHasMove,
    ScrCmd_GetPartySlotWithMove,
    ScrCmd_GetPhoneBookRematch,
    ScrCmd_NameRival,
    ScrCmd_GetFriendSprite,
    ScrCmd_RegisterPokegearCard,
    ScrCmd_RegisterGearNumber,
    ScrCmd_CheckRegisteredPhoneNumber,
    ScrCmd_148,
    ScrCmd_149,
    ScrCmd_RestoreOverworld,
    ScrCmd_151,
    ScrCmd_152,
    ScrCmd_153,
    ScrCmd_154,
    ScrCmd_155,
    ScrCmd_156,
    ScrCmd_TownMap,
    ScrCmd_158,
    ScrCmd_159,
    ScrCmd_160,
    ScrCmd_161,
    ScrCmd_162,
    ScrCmd_HOF_Credits,
    ScrCmd_164,
    ScrCmd_165,
    ScrCmd_166,
    ScrCmd_ChooseStarter,
    ScrCmd_GetTrainerPathToPlayer,
    ScrCmd_TrainerStepTowardsPlayer,
    ScrCmd_GetTrainerEyeType,
    ScrCmd_GetEyeTrainerNum,
    ScrCmd_NamePlayer,
    ScrCmd_NicknameInput,
    ScrCmd_FadeScreen,
    ScrCmd_WaitFade,
    ScrCmd_Warp,
    ScrCmd_RockClimb,
    ScrCmd_Surf,
    ScrCmd_Waterfall,
    ScrCmd_180,
    ScrCmd_FlashEffect,
    ScrCmd_Whirlpool,
    ScrCmd_183,
    ScrCmd_PlayerOnBikeCheck,
    ScrCmd_PlayerOnBikeSet,
    ScrCmd_SetBikeStateLock,
    ScrCmd_GetPlayerState,
    ScrCmd_SetAvatarBits,
    ScrCmd_UpdateAvatarState,
    ScrCmd_BufferPlayersName,
    ScrCmd_BufferRivalsName,
    ScrCmd_BufferFriendsName,
    ScrCmd_BufferMonSpeciesName,
    ScrCmd_BufferItemName,
    ScrCmd_BufferPocketName,
    ScrCmd_BufferTMHMMoveName,
    ScrCmd_BufferMoveName,
    ScrCmd_BufferInt,
    ScrCmd_BufferPartyMonNick,
    ScrCmd_BufferTrainerClassName,
    ScrCmd_BufferPlayerUnionAvatarClassName,
    ScrCmd_BufferSpeciesName,
    ScrCmd_BufferStarterSpeciesName,
    ScrCmd_BufferDPPtRivalStarterSpeciesName,
    ScrCmd_BufferDPPtFriendStarterSpeciesName,
    ScrCmd_GetStarterChoice,
    ScrCmd_BufferDecorationName,
    ScrCmd_208,
    ScrCmd_209,
    ScrCmd_BufferMapSecName,
    ScrCmd_211,
    ScrCmd_GetTrainerNum,
    ScrCmd_TrainerBattle,
    ScrCmd_TrainerMessage,
    ScrCmd_GetTrainerMsgParams,
    ScrCmd_GetRematchMsgParams,
    ScrCmd_TrainerIsDoubleBattle,
    ScrCmd_EncounterMusic,
    ScrCmd_WhiteOut,
    ScrCmd_CheckBattleWon,
    ScrCmd_StaticWildWonOrCaughtCheck,
    ScrCmd_PartyCheckForDouble,
    ScrCmd_223,
    ScrCmd_224,
    ScrCmd_GotoIfTrainerDefeated,
    ScrCmd_226,
    ScrCmd_227,
    ScrCmd_228,
    ScrCmd_229,
    ScrCmd_230,
    ScrCmd_231,
    ScrCmd_232,
    ScrCmd_233,
    ScrCmd_234,
    ScrCmd_235,
    ScrCmd_236,
    ScrCmd_237,
    ScrCmd_PartyHasPokerus,
    ScrCmd_MonGetGender,
    ScrCmd_SetDynamicWarp,
    ScrCmd_GetDynamicWarpFloorNo,
    ScrCmd_ElevatorCurFloorBox,
    ScrCmd_CountJohtoDexSeen,
    ScrCmd_CountJohtoDexOwned,
    ScrCmd_CountNationalDexSeen,
    ScrCmd_CountNationalDexOwned,
    ScrCmd_247,
    ScrCmd_GetDexEvalResult,
    ScrCmd_RocketTrapBattle,
    ScrCmd_250,
    ScrCmd_CatchingTutorial,
    ScrCmd_252,
    ScrCmd_GetSaveFileState,
    ScrCmd_SaveGameNormal,
    ScrCmd_255,
    ScrCmd_256,
    ScrCmd_257,
    ScrCmd_258,
    ScrCmd_259,
    ScrCmd_260,
    ScrCmd_261,
    ScrCmd_262,
    ScrCmd_263,
    ScrCmd_264,
    ScrCmd_265,
    ScrCmd_266,
    ScrCmd_267,
    ScrCmd_268,
    ScrCmd_269,
    ScrCmd_270,
    ScrCmd_271,
    ScrCmd_272,
    ScrCmd_273,
    ScrCmd_274,
    ScrCmd_MartBuy,
    ScrCmd_SpecialMartBuy,
    ScrCmd_DecorationMart,
    ScrCmd_SealMart,
    ScrCmd_OverworldWhiteOut,
    ScrCmd_SetSpawn,
    ScrCmd_GetPlayerGender,
    ScrCmd_HealParty,
    ScrCmd_283,
    ScrCmd_284,
    ScrCmd_285,
    ScrCmd_286,
    ScrCmd_BufferUnionRoomAvatarChoices,
    ScrCmd_UnionRoomAvatarIdxToTrainerClass,
    ScrCmd_289,
    ScrCmd_CheckPokedex,
    ScrCmd_GivePokedex,
    ScrCmd_CheckRunningShoes,
    ScrCmd_GiveRunningShoes,
    ScrCmd_CheckBadge,
    ScrCmd_GiveBadge,
    ScrCmd_CountBadges,
    ScrCmd_297,
    ScrCmd_298,
    ScrCmd_CheckEscortMode,
    ScrCmd_SetEscortMode,
    ScrCmd_ClearEscortMode,
    ScrCmd_302,
    ScrCmd_303,
    ScrCmd_304,
    ScrCmd_305,
    ScrCmd_306,
    ScrCmd_307,
    ScrCmd_308,
    ScrCmd_309,
    ScrCmd_310,
    ScrCmd_311,
    ScrCmd_BufferDaycareMonNicks,
    ScrCmd_GetDaycareState,
    ScrCmd_EcruteakGymInit,
    ScrCmd_315,
    ScrCmd_316,
    ScrCmd_317,
    ScrCmd_CianwoodGymInit,
    ScrCmd_CianwoodGymTurnWinch,
    ScrCmd_VermilionGymInit,
    ScrCmd_VermilionGymLockAction,
    ScrCmd_VermilionGymCanCheck,
    ScrCmd_ResampleVermilionGymCans,
    ScrCmd_VioletGymInit,
    ScrCmd_VioletGymElevator,
    ScrCmd_AzaleaGymInit,
    ScrCmd_AzaleaGymSpinarak,
    ScrCmd_AzaleaGymSwitch,
    ScrCmd_BlackthornGymInit,
    ScrCmd_FuchsiaGymInit,
    ScrCmd_ViridianGymInit,
    ScrCmd_GetPartyCount,
    ScrCmd_333,
    ScrCmd_334,
    ScrCmd_335,
    ScrCmd_BufferBerryName,
    ScrCmd_BufferNatureName,
    ScrCmd_MovePerson,
    ScrCmd_MovePersonFacing,
    ScrCmd_SetObjectMovementType,
    ScrCmd_SetObjectFacing,
    ScrCmd_MoveWarp,
    ScrCmd_MoveBgEvent,
    ScrCmd_344,
    ScrCmd_AddWaitingIcon,
    ScrCmd_RemoveWaitingIcon,
    ScrCmd_347,
    ScrCmd_WaitButtonOrDelay,
    ScrCmd_PartySelectUI,
    ScrCmd_350,
    ScrCmd_PartySelect,
    ScrCmd_PokemonSummaryScreen,
    ScrCmd_GetMoveSelection,
    ScrCmd_GetPartyMonSpecies,
    ScrCmd_PartymonIsMine,
    ScrCmd_PartyCountNotEgg,
    ScrCmd_CountAliveMons,
    ScrCmd_CountAliveMonsAndPC,
    ScrCmd_PartyCountEgg,
    ScrCmd_SubMoneyVar,
    ScrCmd_RetrieveDaycareMon,
    ScrCmd_GiveLoanMon,
    ScrCmd_CheckReturnLoanMon,
    ScrCmd_TakeMon,
    ScrCmd_ResetDaycareEgg,
    ScrCmd_GiveDaycareEgg,
    ScrCmd_BufferDaycareWithdrawCost,
    ScrCmd_HasEnoughMoneyVar,
    ScrCmd_EggHatchAnim,
    ScrCmd_370,
    ScrCmd_BufferDaycareMonGrowth,
    ScrCmd_GetTailDaycareMonSpeciesAndNick,
    ScrCmd_PutMonInDaycare,
    ScrCmd_374,
    ScrCmd_MakeObjectVisible,
    ScrCmd_376,
    ScrCmd_377,
    ScrCmd_ViewRankings,
    ScrCmd_379,
    ScrCmd_Random,
    ScrCmd_381,
    ScrCmd_MonGetFriendship,
    ScrCmd_MonAddFriendship,
    ScrCmd_MonSubtractFriendship,
    ScrCmd_BufferDaycareMonStats,
    ScrCmd_GetPlayerFacing,
    ScrCmd_GetDaycareCompatibility,
    ScrCmd_CheckDaycareEgg,
    ScrCmd_PlayerHasSpecies,
    ScrCmd_SizeRecordCompare,
    ScrCmd_SizeRecordUpdate,
    ScrCmd_BufferMonSize,
    ScrCmd_BufferRecordSize,
    ScrCmd_394,
    ScrCmd_395,
    ScrCmd_CountMonMoves,
    ScrCmd_MonForgetMove,
    ScrCmd_MonGetMove,
    ScrCmd_BufferPartyMonMoveName,
    ScrCmd_StrengthFlagAction,
    ScrCmd_FlashAction,
    ScrCmd_DefogAction,
    ScrCmd_403,
    ScrCmd_404,
    ScrCmd_405,
    ScrCmd_406,
    ScrCmd_407,
    ScrCmd_408,
    ScrCmd_409,
    ScrCmd_410,
    ScrCmd_411,
    ScrCmd_412,
    ScrCmd_413,
    ScrCmd_414,
    ScrCmd_415,
    ScrCmd_416,
    ScrCmd_417,
    ScrCmd_418,
    ScrCmd_419,
    ScrCmd_420,
    ScrCmd_421,
    ScrCmd_422,
    ScrCmd_CheckJohtoDexComplete,
    ScrCmd_CheckNationalDexComplete,
    ScrCmd_ShowCertificate,
    ScrCmd_KenyaCheck,
    ScrCmd_427,
    ScrCmd_MonGiveMail,
    ScrCmd_CountFossils,
    ScrCmd_SetPhoneCall,
    ScrCmd_RunPhoneCall,
    ScrCmd_GetFossilPokemon,
    ScrCmd_GetFossilMinimumAmount,
    ScrCmd_PartyCountMonsAtOrBelowLevel,
    ScrCmd_SurvivePoisoning,
    ScrCmd_436,
    ScrCmd_DebugWatch,
    ScrCmd_GetStdMsgNaix,
    ScrCmd_NonNpcMsgExtern,
    ScrCmd_MsgboxExtern,
    ScrCmd_441,
    ScrCmd_442,
    ScrCmd_443,
    ScrCmd_444,
    ScrCmd_445,
    ScrCmd_446,
    ScrCmd_SafariZoneAction,
    ScrCmd_448,
    ScrCmd_449,
    ScrCmd_450,
    ScrCmd_451,
    ScrCmd_452,
    ScrCmd_453,
    ScrCmd_454,
    ScrCmd_455,
    ScrCmd_456,
    ScrCmd_MonGetNature,
    ScrCmd_GetPartySlotWithNature,
    ScrCmd_459,
    ScrCmd_LoadPhoneDat,
    ScrCmd_GetPhoneContactMsgIds,
    ScrCmd_462,
    ScrCmd_EnableMassOutbreaks,
    ScrCmd_CreateRoamer,
    ScrCmd_465,
    ScrCmd_466,
    ScrCmd_MoveRelearner,
    ScrCmd_MoveTutor,
    ScrCmd_MoveRelearnerGetResult,
    ScrCmd_LoadNPCTrade,
    ScrCmd_GetOfferedSpecies,
    ScrCmd_NPCTradeGetReqSpecies,
    ScrCmd_NPCTradeExec,
    ScrCmd_NPCTradeEnd,
    ScrCmd_475,
    ScrCmd_476,
    ScrCmd_NatDexFlagAction,
    ScrCmd_MonGetRibbonCount,
    ScrCmd_GetPartyRibbonCount,
    ScrCmd_MonHasRibbon,
    ScrCmd_GiveRibbon,
    ScrCmd_BufferRibbonName,
    ScrCmd_GetEVTotal,
    ScrCmd_GetWeekday,
    ScrCmd_485,
    ScrCmd_Dummy,
    ScrCmd_PokeCenAnim,
    ScrCmd_ElevatorAnim,
    ScrCmd_MysteryGift,
    ScrCmd_NopVar490,
    ScrCmd_491,
    ScrCmd_492,
    ScrCmd_PromptEasyChat,
    ScrCmd_494,
    ScrCmd_GetGameVersion,
    ScrCmd_GetPartyLead,
    ScrCmd_GetMonTypes,
    ScrCmd_PrimoPasswordCheck1,
    ScrCmd_PrimoPasswordCheck2,
    ScrCmd_500,
    ScrCmd_501,
    ScrCmd_502,
    ScrCmd_LotoIdGet,
    ScrCmd_LotoIdSearch,
    ScrCmd_LotoIdSet,
    ScrCmd_BufferBoxMonNick,
    ScrCmd_CountPCEmptySpace,
    ScrCmd_PalParkAction,
    ScrCmd_509,
    ScrCmd_510,
    ScrCmd_PalParkScoreGet,
    ScrCmd_PlayerMovementSavingSet,
    ScrCmd_PlayerMovementSavingClear,
    ScrCmd_HallOfFameAnim,
    ScrCmd_AddSpecialGameStat,
    ScrCmd_BufferFashionName,
    ScrCmd_517,
    ScrCmd_518,
    ScrCmd_519,
    ScrCmd_520,
    ScrCmd_521,
    ScrCmd_522,
    ScrCmd_523,
    ScrCmd_524,
    ScrCmd_525,
    ScrCmd_526,
    ScrCmd_527,
    ScrCmd_528,
    ScrCmd_GetPartyLeadAlive,
    ScrCmd_530,
    ScrCmd_BufferBackgroundName,
    ScrCmd_CheckCoinsImmediate,
    ScrCmd_CheckGiveCoins,
    ScrCmd_534,
    ScrCmd_MonGetLevel,
    ScrCmd_536,
    ScrCmd_537,
    ScrCmd_538,
    ScrCmd_539,
    ScrCmd_540,
    ScrCmd_BufferIntEx,
    ScrCmd_MonGetContestValue,
    ScrCmd_543,
    ScrCmd_544,
    ScrCmd_545,
    ScrCmd_546,
    ScrCmd_547,
    ScrCmd_548,
    ScrCmd_549,
    ScrCmd_550,
    ScrCmd_551,
    ScrCmd_552,
    ScrCmd_553,
    ScrCmd_554,
    ScrCmd_555,
    ScrCmd_556,
    ScrCmd_CheckBattlePoints,
    ScrCmd_UnionRoomAvatarIdxToSprite,
    ScrCmd_559,
    ScrCmd_560,
    ScrCmd_ScreenShake,
    ScrCmd_MultiBattle,
    ScrCmd_563,
    ScrCmd_564,
    ScrCmd_565,
    ScrCmd_566,
    ScrCmd_GetDPPlPrizeItemIdAndCost,
    ScrCmd_568,
    ScrCmd_569,
    ScrCmd_CheckCoinsVar,
    ScrCmd_571,
    ScrCmd_GetUniqueSealsQuantity,
    ScrCmd_573,
    ScrCmd_574,
    ScrCmd_575,
    ScrCmd_576,
    ScrCmd_577,
    ScrCmd_578,
    ScrCmd_579,
    ScrCmd_BufferSealName,
    ScrCmd_LockLastTalked,
    ScrCmd_582,
    ScrCmd_583,
    ScrCmd_PartyLegalCheck,
    ScrCmd_585,
    ScrCmd_586,
    ScrCmd_587,
    Scrcmd_LatiCaughtCheck,
    ScrCmd_WildBattle,
    ScrCmd_GetTrcardStars,
    ScrCmd_591,
    ScrCmd_592,
    ScrCmd_ShowSaveStats,
    ScrCmd_HideSaveStats,
    ScrCmd_595,
    ScrCmd_596,
    ScrCmd_597,
    ScrCmd_598,
    ScrCmd_599,
    ScrCmd_600,
    ScrCmd_FollowMonFacePlayer,
    ScrCmd_ToggleFollowingPokemonMovement,
    ScrCmd_WaitFollowingPokemonMovement,
    ScrCmd_FollowingPokemonMovement,
    ScrCmd_605,
    ScrCmd_606,
    ScrCmd_607,
    ScrCmd_608,
    ScrCmd_609,
    ScrCmd_610,
    ScrCmd_Pokeathlon,
    ScrCmd_GetNpcTradeUnusedFlag,
    ScrCmd_GetPhoneContactRandomGiftBerry,
    ScrCmd_GetPhoneContactGiftItem,
    ScrCmd_CameronPhoto,
    ScrCmd_CountSavedPhotos,
    ScrCmd_OpenPhotoAlbum,
    ScrCmd_PhotoAlbumIsFull,
    ScrCmd_RocketCostumeFlagCheck,
    ScrCmd_RocketCostumeFlagAction,
    ScrCmd_PlaceStarterBallsInElmsLab,
    ScrCmd_622,
    ScrCmd_AnimApricornTree,
    ScrCmd_ApricornTreeGetApricorn,
    ScrCmd_GiveApricornFromTree,
    ScrCmd_BufferApricornName,
    ScrCmd_627,
    ScrCmd_628,
    ScrCmd_629,
    ScrCmd_630,
    ScrCmd_631,
    ScrCmd_CountPartyMonsOfSpecies,
    ScrCmd_633,
    ScrCmd_634,
    ScrCmd_635,
    ScrCmd_636,
    ScrCmd_637,
    ScrCmd_638,
    ScrCmd_639,
    ScrCmd_640,
    ScrCmd_SaveWipeExtraChunks,
    ScrCmd_642,
    ScrCmd_643,
    ScrCmd_644,
    ScrCmd_645,
    ScrCmd_646,
    ScrCmd_GetPartySlotWithSpecies,
    ScrCmd_648,
    ScrCmd_ScratchOffCard,
    ScrCmd_ScratchOffCardEnd,
    ScrCmd_GetScratchOffPrize,
    ScrCmd_652,
    ScrCmd_MoveTutorChooseMove,
    ScrCmd_TutorMoveTeachInSlot,
    ScrCmd_TutorMoveGetPrice,
    ScrCmd_656,
    ScrCmd_StatJudge,
    ScrCmd_BufferStatName,
    ScrCmd_SetMonForm,
    ScrCmd_BufferTrainerName,
    ScrCmd_661,
    ScrCmd_662,
    ScrCmd_663,
    ScrCmd_664,
    ScrCmd_665,
    ScrCmd_666,
    ScrCmd_667,
    ScrCmd_BufferTypeName,
    ScrCmd_GetItemQuantity,
    ScrCmd_GetHiddenPowerType,
    ScrCmd_SetFavoriteMon,
    ScrCmd_GetFavoriteMon,
    ScrCmd_GetOwnedRotomForms,
    ScrCmd_CountTranformedRotomsInParty,
    ScrCmd_UpdateRotomForm,
    ScrCmd_GetPartyMonForm,
    ScrCmd_677,
    ScrCmd_678,
    ScrCmd_679,
    ScrCmd_AddSpecialGameStat2,
    ScrCmd_681,
    ScrCmd_682,
    ScrCmd_GetStaticEncounterOutcomeFlag,
    ScrCmd_684,
    ScrCmd_GetPlayerXYZ,
    ScrCmd_686,
    ScrCmd_687,
    ScrCmd_GetPartySlotWithFatefulEncounter,
    ScrCmd_CommSanitizeParty,
    ScrCmd_DaycareSanitizeMon,
    ScrCmd_691,
    ScrCmd_BufferBattleHallStreak,
    ScrCmd_BattleHallCountUsedSpecies,
    ScrCmd_BattleHallGetTotalStreak,
    ScrCmd_695,
    ScrCmd_696,
    ScrCmd_697,
    ScrCmd_FollowerPokeIsEventTrigger,
    ScrCmd_699,
    ScrCmd_700,
    ScrCmd_MonHasItem,
    ScrCmd_BattleTowerSetUpMultiBattle,
    ScrCmd_SetPlayerVolume,
    ScrCmd_704,
    ScrCmd_705,
    ScrCmd_706,
    ScrCmd_CheckMonSeen,
    ScrCmd_708,
    ScrCmd_709,
    ScrCmd_710,
    ScrCmd_FollowMonInteract,
    ScrCmd_712,
    ScrCmd_AlphPuzzle,
    ScrCmd_OpenAlphHiddenRoom,
    ScrCmd_UpdateDaycareMonObjects,
    ScrCmd_716,
    ScrCmd_717,
    ScrCmd_718,
    ScrCmd_719,
    ScrCmd_720,
    ScrCmd_721,
    ScrCmd_722,
    ScrCmd_723,
    ScrCmd_724,
    ScrCmd_725,
    ScrCmd_726,
    ScrCmd_GetFollowPokePartyIndex,
    ScrCmd_728,
    ScrCmd_729,
    ScrCmd_730,
    ScrCmd_731,
    ScrCmd_732,
    ScrCmd_733,
    ScrCmd_734,
    ScrCmd_735,
    ScrCmd_ClearKurtApricorn,
    ScrCmd_737,
    ScrCmd_GetTotalApricornCount,
    ScrCmd_739,
    ScrCmd_740,
    ScrCmd_741,
    ScrCmd_742,
    ScrCmd_743,
    ScrCmd_CreatePokeathlonFriendshipRoomStatues,
    ScrCmd_BufferPokeathlonCourseName,
    ScrCmd_TouchscreenMenuHide,
    ScrCmd_TouchscreenMenuShow,
    ScrCmd_GetMenuChoice,
    ScrCmd_MenuInitStdGmm,
    ScrCmd_MenuInit,
    ScrCmd_MenuItemAdd,
    ScrCmd_MenuExec,
    ScrCmd_RockSmashItemCheck,
    ScrCmd_TryHeadbuttEncounter,
    ScrCmd_LegendCutsceneClearBellAnimBegin,
    ScrCmd_LegendCutsceneClearBellAnimEnd,
    ScrCmd_LegendCutsceneClearBellRiseFromBag,
    ScrCmd_LegendCutsceneClearBellShimmer,
    ScrCmd_LegendCutsceneLugiaEyeGlimmerEffect,
    ScrCmd_760,
    ScrCmd_LegendCutsceneMoveCameraTo,
    ScrCmd_LegendCutscenePanCameraTo,
    ScrCmd_LegendCutsceneWaitCameraPan,
    ScrCmd_LegendCutsceneBirdFinalApproach,
    ScrCmd_LegendCutsceneWavesOrLeavesEffectBegin,
    ScrCmd_LegendCutsceneWavesOrLeavesEffectEnd,
    ScrCmd_LegendCutsceneLugiaArrivesEffectBegin,
    ScrCmd_LegendCutsceneLugiaArrivesEffectEnd,
    ScrCmd_LegendCutsceneLugiaArrivesEffectCameraPan,
    ScrCmd_CheckSeenAllLetterUnown,
    ScrCmd_771,
    ScrCmd_772,
    ScrCmd_Cinematic,
    ScrCmd_ShowLegendaryWing,
    ScrCmd_775,
    ScrCmd_GiveTogepiEgg,
    ScrCmd_777,
    ScrCmd_GiveSpikyEarPichu,
    ScrCmd_RadioMusicIsPlaying,
    ScrCmd_CasinoGame,
    ScrCmd_KenyaCheckPartyOrMailbox,
    ScrCmd_MartSell,
    ScrCmd_SetFollowMonInhibitState,
    ScrCmd_ScriptOverlayCmd,
    ScrCmd_BugContestAction,
    ScrCmd_BufferBugContestWinner,
    ScrCmd_JudgeBugContest,
    ScrCmd_BufferBugContestMonNick,
    ScrCmd_BugContestGetTimeLeft,
    ScrCmd_IsBugContestantRegistered,
    ScrCmd_791,
    ScrCmd_792,
    ScrCmd_BankTransaction,
    ScrCmd_CheckBankBalance,
    ScrCmd_795,
    ScrCmd_796,
    ScrCmd_797,
    ScrCmd_BufferRulesetName,
    ScrCmd_799,
    ScrCmd_800,
    ScrCmd_801,
    ScrCmd_802,
    ScrCmd_803,
    ScrCmd_804,
    ScrCmd_805,
    ScrCmd_806,
    ScrCmd_SetTrainerHouseSprite,
    ScrCmd_808,
    ScrCmd_ShowTrainerHouseIntroMessage,
    ScrCmd_810,
    ScrCmd_811,
    ScrCmd_812,
    ScrCmd_MomGiftCheck,
    ScrCmd_814,
    ScrCmd_815,
    ScrCmd_UnownCircle,
    ScrCmd_817,
    ScrCmd_MystriStageGymmickInit,
    ScrCmd_819,
    ScrCmd_820,
    ScrCmd_GetBuenasPassword,
    ScrCmd_822,
    ScrCmd_823,
    ScrCmd_824,
    ScrCmd_GetShinyLeafCount,
    ScrCmd_TryGiveShinyLeafCrown,
    ScrCmd_GetPartymonForm,
    ScrCmd_MonAddContestValue,
    ScrCmd_829,
    ScrCmd_830,
    ScrCmd_831,
    ScrCmd_832,
    ScrCmd_833,
    ScrCmd_834,
    ScrCmd_835,
    ScrCmd_CheckKyogreGroudonInParty,
    ScrCmd_837,
    ScrCmd_BankOrWalletIsFull,
    ScrCmd_SysSetSleepFlag,
    ScrCmd_840,
    ScrCmd_841,
    ScrCmd_842,
    ScrCmd_BufferItemNameIndef,
    ScrCmd_BufferItemNamePlural,
    ScrCmd_BufferPartyMonSpeciesNameIndef,
    ScrCmd_BufferSpeciesNameIndef,
    ScrCmd_BufferDPPtFriendStarterSpeciesNameIndef,
    ScrCmd_BufferFashionNameIndef,
    ScrCmd_BufferTrainerClassNameIndef,
    ScrCmd_BufferSealNamePlural,
    ScrCmd_Capitalize,
    ScrCmd_BufferDeptStoreFloorNo,
};
const u32 sNumScriptCmds = NELEMS(gScriptCmdTable);

#else
extern const ScrCmdFunc gScriptCmdTable[];
extern const u32 sNumScriptCmds;
#endif //_IN_SCRCMD_C
