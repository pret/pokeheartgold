#ifdef _IN_SCRCMD_C
BOOL ScrCmd_Nop(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_Dummy(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_End(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_Wait(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_LoadByte(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_LoadWord(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_LoadByteFromAddr(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_WriteByteToAddr(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetPtrByte(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CopyLocal(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CopyByte(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CompareLocalToLocal(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CompareLocalToValue(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CompareLocalToAddr(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CompareAddrToLocal(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CompareAddrToValue(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CompareAddrToAddr(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CompareVarToValue(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CompareVarToVar(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_RunScript(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CallStd(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_RestartCurrentScript(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GoTo(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ObjectGoTo(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BgGoTo(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_DirectionGoTo(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_Call(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_Return(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GoToIf(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CallIf(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetFlag(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ClearFlag(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckFlag(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetFlagVar(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ClearFlagVar(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckFlagVar(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetTrainerFlag(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ClearTrainerFlag(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckTrainerFlag(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_AddVar(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SubVar(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetVar(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CopyVar(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetOrCopyVar(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_NonNPCMsg(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_NPCMsg(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_NonNpcMsgVar(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_NpcMsgVar(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_048(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_WaitButton(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_WaitButtonOrWalkAway(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_WaitButtonOrDpad(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_OpenMsg(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CloseMsg(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_HoldMsg(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_DirectionSignpost(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_055(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_057(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_058(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_TrainerTips(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_060(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_061(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_062(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_YesNo(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_064(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_065(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_066(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_067(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_068(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_069(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_070(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_071(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_072(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PlaySE(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_StopSE(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_WaitSE(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PlayCry(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_WaitCry(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PlayFanfare(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_WaitFanfare(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PlayBGM(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_081(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ResetBGM(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_083(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_FadeOutBGM(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_085(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_086(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_TempBGM(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_088(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ChatotHasCry(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ChatotStartRecording(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ChatotStopRecording(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ChatotSaveRecording(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_093(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ApplyMovement(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_WaitMovement(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_LockAll(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ReleaseAll(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_098(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_099(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ShowPerson(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_HidePerson(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_102(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_103(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_FacePlayer(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPlayerCoords(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPersonCoords(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_107(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_108(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_109(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_AddMoney(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SubMoneyImmediate(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_HasEnoughMoneyImmediate(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ShowMoneyBox(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_HideMoneyBox(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_UpdateMoneyBox(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_116(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_117(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_118(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetCoinAmount(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GiveCoins(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_TakeCoins(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GiveAthletePoints(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_TakeAthletePoints(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckAthletePoints(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GiveItem(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_TakeItem(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_HasSpaceForItem(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_HasItem(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ItemIsTMOrHM(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetItemPocket(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetStarterChoice(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GenderMsgbox(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetSealQuantity(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GiveOrTakeSeal(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GiveRandomSeal(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_136(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GiveMon(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GiveEgg(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetMonMove(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MonHasMove(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPartySlotWithMove(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPhoneBookRematch(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_NameRival(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetFriendSprite(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_RegisterPokegearCard(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_RegisterGearNumber(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckRegisteredPhoneNumber(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_148(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_149(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_150(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_151(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_152(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_153(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_154(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_155(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_156(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_TownMap(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_158(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_159(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_160(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_161(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_162(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_HOF_Credits(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_164(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_165(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_166(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ChooseStarter(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetTrainerPathToPlayer(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_TrainerStepTowardsPlayer(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetTrainerEyeType(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetEyeTrainerNum(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_NamePlayer(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_NicknameInput(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_FadeScreen(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_WaitFade(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_Warp(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_RockClimb(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_Surf(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_Waterfall(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_180(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_FlashEffect(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_Whirlpool(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_183(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PlayerOnBikeCheck(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PlayerOnBikeSet(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_186(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPlayerState(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetAvatarBits(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_UpdateAvatarState(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferPlayersName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferRivalsName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferFriendsName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferMonSpeciesName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferItemName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferPocketName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferTMHMMoveName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferMoveName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferInt(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferPartyMonNick(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferTrainerClassName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferPlayerUnionAvatarClassName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferSpeciesName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferStarterSpeciesName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferDPPtRivalStarterSpeciesName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferDPPtFriendStarterSpeciesName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetStarterChoice(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferDecorationName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_208(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_209(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferMapSecName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_211(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetTrainerNum(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_TrainerBattle(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_TrainerMessage(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetTrainerMsgParams(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetRematchMsgParams(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_TrainerIsDoubleBattle(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_EncounterMusic(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_WhiteOut(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckBattleWon(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_221(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PartyCheckForDouble(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_223(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_224(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GotoIfTrainerDefeated(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_226(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_227(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_228(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_229(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_230(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_231(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_232(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_233(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_234(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_235(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_236(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_237(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PartyHasPokerus(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MonGetGender(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetDynamicWarp(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetDynamicWarpFloorNo(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ElevatorCurFloorBox(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CountJohtoDexSeen(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CountJohtoDexOwned(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CountNationalDexSeen(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CountNationalDexOwned(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_247(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetDexEvalResult(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_RocketTrapBattle(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_250(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CatchingTutorial(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_252(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetSaveFileState(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SaveGameNormal(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_255(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_256(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_257(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_258(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_259(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_260(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_261(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_262(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_263(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_264(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_265(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_266(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_267(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_268(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_269(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_270(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_271(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_272(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_273(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_274(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MartBuy(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SpecialMartBuy(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_DecorationMart(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SealMart(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_OverworldWhiteOut(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetSpawn(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPlayerGender(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_HealParty(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_283(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_284(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_285(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_286(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_287(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_288(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_289(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckPokedex(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GivePokedex(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckRunningShoes(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GiveRunningShoes(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckBadge(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GiveBadge(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CountBadges(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_297(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_298(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckEscortMode(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetEscortMode(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ClearEscortMode(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_302(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_303(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_304(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_305(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_306(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_307(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_308(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_309(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_310(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_311(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferDayCareMonNicks(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetDayCareState(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_EcruteakGymInit(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_315(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_316(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_317(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CianwoodGymInit(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CianwoodGymTurnWinch(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_VermilionGymInit(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_VermilionGymLockAction(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_VermilionGymCanCheck(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ResampleVermilionGymCans(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_VioletGymInit(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_VioletGymElevator(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_AzaleaGymInit(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_AzaleaGymSpinarak(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_AzaleaGymSwitch(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BlackthornGymInit(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_FuchsiaGymInit(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ViridianGymInit(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPartyCount(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_333(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_334(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_335(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferBerryName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferNatureName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MovePerson(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MovePersonFacing(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetObjectMovementType(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetObjectFacing(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MoveWarp(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MoveBgEvent(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_344(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_AddWaitingIcon(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_RemoveWaitingIcon(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_347(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_WaitButtonOrDelay(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PartySelectUI(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_350(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PartySelect(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ChooseMoveUI(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetMoveSelection(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPartyMonSpecies(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PartymonIsMine(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PartyCountNotEgg(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CountAliveMons(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CountAliveMonsAndPC(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PartyCountEgg(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SubMoneyVar(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_RetrieveDayCareMon(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GiveLoanMon(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckReturnLoanMon(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_TakeMon(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ResetDayCareEgg(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GiveDayCareEgg(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferDayCareWithdrawCost(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_HasEnoughMoneyVar(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_EggHatchAnim(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_370(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferDayCareMonGrowth(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetTailDayCareMonSpeciesAndNick(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PutMonInDayCare(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_374(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_375(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_376(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_377(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_378(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_379(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_Random(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_381(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MonGetFriendship(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MonAddFriendship(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MonSubtractFriendship(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferDayCareMonStats(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPlayerFacing(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetDayCareCompatibility(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckDayCareEgg(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PlayerHasSpecies(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SizeRecordCompare(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SizeRecordUpdate(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferMonSize(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferRecordSize(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_394(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_395(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CountMonMoves(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MonForgetMove(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MonGetMove(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferPartyMonMoveName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_StrengthFlagAction(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_FlashAction(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_DefogAction(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_403(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_404(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_405(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_406(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_407(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_408(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_409(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_410(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_411(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_412(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_413(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_414(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_415(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_416(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_417(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_418(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_419(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_420(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_421(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_422(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckJohtoDexComplete(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckNationalDexComplete(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_425(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_KenyaCheck(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_427(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MonGiveMail(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CountFossils(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetPhoneCall(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_RunPhoneCall(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetFossilPokemon(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetFossilMinimumAmount(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PartyCountMonsAtOrBelowLevel(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SurvivePoisoning(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_436(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_DebugWatch(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetStdMsgNaix(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_NonNpcMsgExtern(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MsgboxExtern(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_441(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_442(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_443(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_444(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_445(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_446(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SafariZoneAction(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_448(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_449(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_450(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_451(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_452(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_453(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_454(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_455(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_456(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MonGetNature(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPartySlotWithNature(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_459(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_LoadPhoneDat(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPhoneContactMsgIds(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_462(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_EnableMassOutbreaks(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CreateRoamer(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_465(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_466(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MoveRelearnerInit(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MoveTutorInit(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MoveRelearnerGetResult(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_LoadNPCTrade(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetOfferedSpecies(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_NPCTradeGetReqSpecies(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_NPCTradeExec(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_NPCTradeEnd(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_475(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_476(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_NatDexFlagAction(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MonGetRibbonCount(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPartyRibbonCount(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MonHasRibbon(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GiveRibbon(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferRibbonName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetEVTotal(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetWeekday(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_485(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_Dummy(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PokeCenAnim(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ElevatorAnim(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MysteryGift(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_NopVar490(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_491(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_492(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PromptEasyChat(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_494(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetGameVersion(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPartyLead(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetMonTypes(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PrimoPasswordCheck1(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PrimoPasswordCheck2(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_500(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_501(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_502(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_LotoIdGet(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_LotoIdSearch(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_LotoIdSet(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferBoxMonNick(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CountPCEmptySpace(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_508(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_509(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_510(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_511(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PlayerMovementSavingSet(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PlayerMovementSavingClear(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_HallOfFameAnim(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_AddSpecialGameStat(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferFashionName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_517(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_518(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_519(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_520(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_521(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_522(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_523(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_524(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_525(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_526(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_527(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_528(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPartyLeadAlive(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_530(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferBackgroundName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckCoinsImmediate(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckGiveCoins(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_534(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MonGetLevel(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_536(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_537(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_538(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_539(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_540(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferIntEx(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MonGetContestValue(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_543(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_544(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_545(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_546(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_547(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_548(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_549(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_550(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_551(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_552(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_553(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_554(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_555(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_556(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckBattlePoints(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_558(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_559(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_560(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_561(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MultiBattle(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_563(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_564(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_565(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_566(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetDPPlPrizeItemIdAndCost(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_568(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_569(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckCoinsVar(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_571(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_572(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_573(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_574(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_575(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_576(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_577(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_578(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_579(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferSealName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_LockLastTalked(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_582(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_583(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PartyLegalCheck(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_585(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_586(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_587(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_588(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_WildBattle(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetTrcardStars(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_591(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_592(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ShowSaveStats(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_HideSaveStats(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_595(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_596(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_597(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_598(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_599(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_600(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_FollowPokeFacePlayer(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_602(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_603(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_604(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_605(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_606(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_607(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_608(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_609(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_610(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_Pokeathlon(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetNpcTradeUnusedFlag(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPhoneContactRandomGiftBerry(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPhoneContactGiftItem(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CameronPhoto(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_616(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_617(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_PhotoAlbumIsFull(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_RocketCostumeFlagCheck(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_RocketCostumeFlagAction(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_621(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_622(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_AnimApricornTree(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ApricornTreeGetApricorn(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GiveApricornFromTree(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferApricornName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_627(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_628(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_629(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_630(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_631(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CountPartyMonsOfSpecies(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_633(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_634(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_635(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_636(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_637(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_638(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_639(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_640(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SaveWipeExtraChunks(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_642(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_643(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_644(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_645(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_646(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPartySlotWithSpecies(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_648(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ScratchOffCard(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ScratchOffCardEnd(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetScratchOffPrize(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_652(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MoveTutorChooseMove(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_TutorMoveTeachInSlot(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_TutorMoveGetPrice(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_656(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_StatJudge(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferStatName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetMonForme(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferTrainerName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_661(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_662(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_663(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_664(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_665(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_666(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_667(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferTypeName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetItemQuantity(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetHiddenPowerType(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_671(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_672(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetOwnedRotomFormes(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CountTranformedRotomsInParty(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_UpdateRotomForme(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPartyMonForme(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_677(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_678(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_679(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_AddSpecialGameStat2(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_681(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_682(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_683(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_684(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPlayerXYZ(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_686(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_687(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPartySlotWithFatefulEncounter(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CommSanitizeParty(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_DayCareSanitizeMon(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_691(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferBattleHallStreak(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BattleHallCountUsedSpecies(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BattleHallGetTotalStreak(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_695(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_696(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_697(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_FollowerPokeIsEventTrigger(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_699(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_700(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MonHasItem(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_702(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_703(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_704(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_705(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_706(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_707(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_708(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_709(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_710(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_FollowPokeInteract(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_712(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_AlphPuzzle(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_714(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_UpdateDayCareMonObjects(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_716(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_717(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_718(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_719(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_720(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_721(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_722(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_723(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_724(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_725(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_726(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_727(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_728(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_729(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_730(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_731(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_732(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_733(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_734(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_735(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_736(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_737(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_738(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_739(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_740(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_741(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_742(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_743(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_744(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferPokeathlonCourseName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_TouchscreenMenuHide(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_TouchscreenMenuShow(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetMenuChoice(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MenuInitStdGmm(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MenuInit(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MenuItemAdd(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MenuExec(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_RockSmashItemCheck(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_754(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_755(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_756(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_757(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_758(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_759(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_760(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_761(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_762(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_763(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_764(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_765(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_766(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_767(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_768(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_769(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_770(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_771(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_772(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_Cinematic(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_774(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_775(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GiveTogepiEgg(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_777(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GiveSpikyEarPichu(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_RadioMusicIsPlaying(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CasinoGame(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_KenyaCheckPartyOrMailbox(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MartSell(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_SetFollowPokeInhibitState(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_ScriptOverlayCmd(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BugContestAction(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferBugContestWinner(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_JudgeBugContest(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferBugContestMonNick(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BugContestGetTimeLeft(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_IsBugContestantRegistered(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_791(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_792(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BankTransaction(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_CheckBankBalance(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_795(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_796(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_797(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferRulesetName(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_799(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_800(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_801(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_802(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_803(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_804(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_805(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_806(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_807(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_808(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_809(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_810(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_811(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_812(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MomGiftCheck(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_814(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_815(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_UnownCircle(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_817(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MystriStageGymmickInit(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_819(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_820(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetBuenasPassword(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_822(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_823(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_824(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_825(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_826(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_GetPartymonForme(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_MonAddContestValue(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_829(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_830(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_831(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_832(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_833(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_834(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_835(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_836(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_837(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BankOrWalletIsFull(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_839(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_840(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_841(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_842(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferItemNameIndef(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferItemNamePlural(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferPartyMonSpeciesNameIndef(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferSpeciesNameIndef(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferDPPtFriendStarterSpeciesNameIndef(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferFashionNameIndef(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferTrainerClassNameIndef(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferSealNamePlural(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_Capitalize(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_BufferDeptStoreFloorNo(SCRIPTCONTEXT *ctx);

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
    ScrCmd_081,
    ScrCmd_ResetBGM,
    ScrCmd_083,
    ScrCmd_FadeOutBGM,
    ScrCmd_085,
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
    ScrCmd_150,
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
    ScrCmd_186,
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
    ScrCmd_221,
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
    ScrCmd_287,
    ScrCmd_288,
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
    ScrCmd_BufferDayCareMonNicks,
    ScrCmd_GetDayCareState,
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
    ScrCmd_ChooseMoveUI,
    ScrCmd_GetMoveSelection,
    ScrCmd_GetPartyMonSpecies,
    ScrCmd_PartymonIsMine,
    ScrCmd_PartyCountNotEgg,
    ScrCmd_CountAliveMons,
    ScrCmd_CountAliveMonsAndPC,
    ScrCmd_PartyCountEgg,
    ScrCmd_SubMoneyVar,
    ScrCmd_RetrieveDayCareMon,
    ScrCmd_GiveLoanMon,
    ScrCmd_CheckReturnLoanMon,
    ScrCmd_TakeMon,
    ScrCmd_ResetDayCareEgg,
    ScrCmd_GiveDayCareEgg,
    ScrCmd_BufferDayCareWithdrawCost,
    ScrCmd_HasEnoughMoneyVar,
    ScrCmd_EggHatchAnim,
    ScrCmd_370,
    ScrCmd_BufferDayCareMonGrowth,
    ScrCmd_GetTailDayCareMonSpeciesAndNick,
    ScrCmd_PutMonInDayCare,
    ScrCmd_374,
    ScrCmd_375,
    ScrCmd_376,
    ScrCmd_377,
    ScrCmd_378,
    ScrCmd_379,
    ScrCmd_Random,
    ScrCmd_381,
    ScrCmd_MonGetFriendship,
    ScrCmd_MonAddFriendship,
    ScrCmd_MonSubtractFriendship,
    ScrCmd_BufferDayCareMonStats,
    ScrCmd_GetPlayerFacing,
    ScrCmd_GetDayCareCompatibility,
    ScrCmd_CheckDayCareEgg,
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
    ScrCmd_425,
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
    ScrCmd_MoveRelearnerInit,
    ScrCmd_MoveTutorInit,
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
    ScrCmd_508,
    ScrCmd_509,
    ScrCmd_510,
    ScrCmd_511,
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
    ScrCmd_558,
    ScrCmd_559,
    ScrCmd_560,
    ScrCmd_561,
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
    ScrCmd_572,
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
    ScrCmd_588,
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
    ScrCmd_FollowPokeFacePlayer,
    ScrCmd_602,
    ScrCmd_603,
    ScrCmd_604,
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
    ScrCmd_616,
    ScrCmd_617,
    ScrCmd_PhotoAlbumIsFull,
    ScrCmd_RocketCostumeFlagCheck,
    ScrCmd_RocketCostumeFlagAction,
    ScrCmd_621,
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
    ScrCmd_SetMonForme,
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
    ScrCmd_671,
    ScrCmd_672,
    ScrCmd_GetOwnedRotomFormes,
    ScrCmd_CountTranformedRotomsInParty,
    ScrCmd_UpdateRotomForme,
    ScrCmd_GetPartyMonForme,
    ScrCmd_677,
    ScrCmd_678,
    ScrCmd_679,
    ScrCmd_AddSpecialGameStat2,
    ScrCmd_681,
    ScrCmd_682,
    ScrCmd_683,
    ScrCmd_684,
    ScrCmd_GetPlayerXYZ,
    ScrCmd_686,
    ScrCmd_687,
    ScrCmd_GetPartySlotWithFatefulEncounter,
    ScrCmd_CommSanitizeParty,
    ScrCmd_DayCareSanitizeMon,
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
    ScrCmd_702,
    ScrCmd_703,
    ScrCmd_704,
    ScrCmd_705,
    ScrCmd_706,
    ScrCmd_707,
    ScrCmd_708,
    ScrCmd_709,
    ScrCmd_710,
    ScrCmd_FollowPokeInteract,
    ScrCmd_712,
    ScrCmd_AlphPuzzle,
    ScrCmd_714,
    ScrCmd_UpdateDayCareMonObjects,
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
    ScrCmd_727,
    ScrCmd_728,
    ScrCmd_729,
    ScrCmd_730,
    ScrCmd_731,
    ScrCmd_732,
    ScrCmd_733,
    ScrCmd_734,
    ScrCmd_735,
    ScrCmd_736,
    ScrCmd_737,
    ScrCmd_738,
    ScrCmd_739,
    ScrCmd_740,
    ScrCmd_741,
    ScrCmd_742,
    ScrCmd_743,
    ScrCmd_744,
    ScrCmd_BufferPokeathlonCourseName,
    ScrCmd_TouchscreenMenuHide,
    ScrCmd_TouchscreenMenuShow,
    ScrCmd_GetMenuChoice,
    ScrCmd_MenuInitStdGmm,
    ScrCmd_MenuInit,
    ScrCmd_MenuItemAdd,
    ScrCmd_MenuExec,
    ScrCmd_RockSmashItemCheck,
    ScrCmd_754,
    ScrCmd_755,
    ScrCmd_756,
    ScrCmd_757,
    ScrCmd_758,
    ScrCmd_759,
    ScrCmd_760,
    ScrCmd_761,
    ScrCmd_762,
    ScrCmd_763,
    ScrCmd_764,
    ScrCmd_765,
    ScrCmd_766,
    ScrCmd_767,
    ScrCmd_768,
    ScrCmd_769,
    ScrCmd_770,
    ScrCmd_771,
    ScrCmd_772,
    ScrCmd_Cinematic,
    ScrCmd_774,
    ScrCmd_775,
    ScrCmd_GiveTogepiEgg,
    ScrCmd_777,
    ScrCmd_GiveSpikyEarPichu,
    ScrCmd_RadioMusicIsPlaying,
    ScrCmd_CasinoGame,
    ScrCmd_KenyaCheckPartyOrMailbox,
    ScrCmd_MartSell,
    ScrCmd_SetFollowPokeInhibitState,
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
    ScrCmd_807,
    ScrCmd_808,
    ScrCmd_809,
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
    ScrCmd_825,
    ScrCmd_826,
    ScrCmd_GetPartymonForme,
    ScrCmd_MonAddContestValue,
    ScrCmd_829,
    ScrCmd_830,
    ScrCmd_831,
    ScrCmd_832,
    ScrCmd_833,
    ScrCmd_834,
    ScrCmd_835,
    ScrCmd_836,
    ScrCmd_837,
    ScrCmd_BankOrWalletIsFull,
    ScrCmd_839,
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
