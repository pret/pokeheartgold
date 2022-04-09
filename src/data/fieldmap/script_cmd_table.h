#ifdef _IN_SCRCMD_C

extern BOOL ScrCmd_Nop(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_Dummy(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_End(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_Wait(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_LoadByte(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_LoadWord(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_LoadByteFromAddr(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_WriteByteToAddr(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetPtrByte(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CopyLocal(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CopyByte(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CompareLocalToLocal(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CompareLocalToValue(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CompareLocalToAddr(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CompareAddrToLocal(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CompareAddrToValue(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CompareAddrToAddr(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CompareVarToValue(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CompareVarToVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_RunScript(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CallStd(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_RestartCurrentScript(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GoTo(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ObjectGoTo(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BgGoTo(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_DirectionGoTo(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_Call(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_Return(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GoToIf(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CallIf(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetFlag(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ClearFlag(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckFlag(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetFlagVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ClearFlagVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckFlagVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetTrainerFlag(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ClearTrainerFlag(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckTrainerFlag(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_AddVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SubVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CopyVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetOrCopyVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_NonNPCMsg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_NPCMsg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_NonNpcMsgVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_NpcMsgVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_048(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_WaitButton(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_WaitButton(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_WaitButtonOrDpad(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_OpenMsg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CloseMsg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_HoldMsg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_DirectionSignpost(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_055(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_057(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_058(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TrainerTips(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_060(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_061(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_062(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_063(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_064(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_065(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_066(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_067(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_068(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_069(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_070(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_071(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_072(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PlaySE(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_StopSE(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_WaitSE(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PlayCry(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_WaitCry(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PlayFanfare(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_WaitFanfare(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PlayBGM(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_081(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ResetBGM(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_083(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_FadeOutBGM(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_085(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_086(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TempBGM(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_088(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ChatotHasCry(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ChatotStartRecording(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ChatotStopRecording(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ChatotSaveRecording(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_093(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ApplyMovement(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_WaitMovement(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_LockAll(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ReleaseAll(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_098(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_099(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ShowPerson(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_HidePerson(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_102(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_103(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_FacePlayer(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPlayerCoords(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPersonCoords(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_107(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_108(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_109(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_AddMoney(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SubMoneyImmediate(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_HasEnoughMoneyImmediate(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ShowMoneyBox(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_HideMoneyBox(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_UpdateMoneyBox(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_116(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_117(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_118(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetCoinAmount(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveCoins(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TakeCoins(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveAthletePoints(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TakeAthletePoints(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckAthletePoints(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveItem(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TakeItem(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_HasSpaceForItem(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_HasItem(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ItemIsTMOrHM(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetItemPocket(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetStarterChoice(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GenderMsgbox(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetSealQuantity(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveOrTakeSeal(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveRandomSeal(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_136(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveMon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveEgg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetMonMove(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonHasMove(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPartySlotWithMove(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPhoneBookRematch(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_NameRival(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetFriendSprite(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_RegisterPokegearCard(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_RegisterGearNumber(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckRegisteredPhoneNumber(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_148(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_149(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_150(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_151(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_152(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_153(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_154(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_155(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_156(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TownMap(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_158(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_159(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_160(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_161(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_162(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_HOF_Credits(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_164(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_165(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_166(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ChooseStarter(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetTrainerPathToPlayer(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TrainerStepTowardsPlayer(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetTrainerEyeType(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetEyeTrainerNum(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_172(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_NicknameInput(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_FadeScreen(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_WaitFade(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_Warp(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_RockClimb(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_Surf(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_Waterfall(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_180(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_181(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_182(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_183(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PlayerOnBikeCheck(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PlayerOnBikeSet(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_186(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPlayerState(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetAvatarBits(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_UpdateAvatarState(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferPlayersName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferRivalsName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferFriendsName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferMonSpeciesName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferItemName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferPocketName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferTMHMMoveName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferMoveName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferInt(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferPartyMonNick(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferTrainerClassName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferPlayerUnionAvatarClassName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferSpeciesName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferStarterSpeciesName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferDPPtRivalStarterSpeciesName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferDPPtFriendStarterSpeciesName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetStarterChoice(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferDecorationName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_208(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_209(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferMapSecName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_211(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetTrainerNum(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TrainerBattle(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TrainerMessage(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetTrainerMsgParams(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetRematchMsgParams(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TrainerIsDoubleBattle(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_EncounterMusic(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_WhiteOut(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckBattleWon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_221(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PartyCheckForDouble(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_223(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_224(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_225(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_226(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_227(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_228(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_229(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_230(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_231(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_232(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_233(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_234(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_235(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_236(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_237(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PartyHasPokerus(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonGetGender(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetDynamicWarp(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetDynamicWarpFloorNo(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ElevatorCurFloorBox(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountJohtoDexSeen(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountJohtoDexOwned(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountNationalDexSeen(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountNationalDexOwned(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_247(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetDexEvalResult(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_249(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_250(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CatchingTutorial(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_252(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetSaveFileState(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SaveGameNormal(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_255(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_256(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_257(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_258(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_259(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_260(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_261(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_262(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_263(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_264(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_265(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_266(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_267(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_268(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_269(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_270(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_271(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_272(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_273(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_274(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MartBuy(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SpecialMartBuy(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_DecorationMart(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SealMart(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_OverworldWhiteOut(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetSpawn(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPlayerGender(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_HealParty(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_283(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_284(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_285(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_286(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_287(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_288(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_289(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckPokedex(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GivePokedex(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckRunningShoes(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveRunningShoes(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckBadge(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveBadge(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountBadges(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_297(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_298(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckEscortMode(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetEscortMode(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ClearEscortMode(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_302(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_303(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_304(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_305(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_306(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_307(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_308(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_309(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_310(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_311(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferDayCareMonNicks(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetDayCareState(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_EcruteakGymInit(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_315(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_316(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_317(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CianwoodGymInit(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CianwoodGymTurnWinch(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_VermilionGymInit(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_VermilionGymLockAction(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_VermilionGymCanCheck(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ResampleVermilionGymCans(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_VioletGymInit(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_325(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_AzaleaGymInit(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_AzaleaGymSpinarak(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_AzaleaGymSwitch(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BlackthornGymInit(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_FuchsiaGymInit(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ViridianGymInit(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPartyCount(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_333(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_334(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_335(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferBerryName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferNatureName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_338(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MovePerson(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetObjectMovementType(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_341(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_342(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_343(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_344(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_345(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_346(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_347(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_WaitButtonOrDelay(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PartySelectUI(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_350(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PartySelect(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ChooseMoveUI(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetMoveSelection(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPartyMonSpecies(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PartymonIsMine(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PartyCountNotEgg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountAliveMons(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PokeathloScrCmd_CountAliveMonsAndPCnPartyCount(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PartyCountEgg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SubMoneyVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_RetrieveDayCareMon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveLoanMon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckReturnLoanMon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TakeMon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ResetDayCareEgg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveDayCareEgg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferDayCareWithdrawCost(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_HasEnoughMoneyVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_EggHatchAnim(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_370(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferDayCareMonGrowth(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetTailDayCareMonSpeciesAndNick(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PutMonInDayCare(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_374(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_375(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_376(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_377(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_378(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_379(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_Random(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_381(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonGetFriendship(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonAddFriendship(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonSubtractFriendship(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferDayCareMonStats(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPlayerFacing(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetDayCareCompatibility(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckDayCareEgg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PlayerHasSpecies(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SizeRecordCompare(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SizeRecordUpdate(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferMonSize(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferRecordSize(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_394(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_395(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountMonMoves(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonForgetMove(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonGetMove(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferPartyMonMoveName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_StrengthFlagAction(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_FlashAction(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_DefogAction(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_403(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_404(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_405(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_406(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_407(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_408(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_409(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_410(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_411(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_412(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_413(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_414(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_415(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_416(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_417(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_418(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_419(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_420(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_421(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_422(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckJohtoDexComplete(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckNationalDexComplete(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_425(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_KenyaCheck(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_427(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonGiveMail(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountFossils(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetPhoneCall(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_RunPhoneCall(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetFossilPokemon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetFossilMinimumAmount(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PartyCountMonsAtOrBelowLevel(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SurvivePoisoning(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_436(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_DebugWatch(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetStdMsgNaix(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_NonNpcMsgExtern(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MsgboxExtern(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_441(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_442(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_443(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_444(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_445(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_446(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SafariZoneAction(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_448(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_449(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_450(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_451(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_452(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_453(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_454(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_455(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_456(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonGetNature(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPartySlotWithNature(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_459(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_LoadPhoneDat(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPhoneContactMsgIds(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_462(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_EnableMassOutbreaks(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CreateRoamer(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_465(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_466(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MoveRelearnerInit(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MoveTutorInit(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MoveRelearnerGetResult(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_LoadNPCTrade(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetOfferedSpecies(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_NPCTradeGetReqSpecies(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_NPCTradeExec(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_NPCTradeEnd(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_475(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_476(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_NatDexFlagAction(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonGetRibbonCount(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPartyRibbonCount(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonHasRibbon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveRibbon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferRibbonName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetEVTotal(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetWeekday(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_485(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_Dummy(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PokeCenAnim(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ElevatorAnim(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MysteryGift(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_NopVar490(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_491(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_492(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PromptEasyChat(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_494(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetGameVersion(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPartyLead(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetMonTypes(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PrimoPasswordCheck1(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PrimoPasswordCheck2(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_500(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_501(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_502(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_LotoIdGet(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_LotoIdSearch(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_LotoIdSet(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferBoxMonNick(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountPCEmptySpace(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_508(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_509(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_510(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_511(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PlayerMovementSavingSet(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PlayerMovementSavingClear(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_HallOfFameAnim(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_AddSpecialGameStat(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferFashionName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_517(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_518(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_519(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_520(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_521(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_522(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_523(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_524(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_525(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_526(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_527(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_528(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPartyLeadAlive(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_530(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferBackgroundName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckCoinsImmediate(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckGiveCoins(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_534(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonGetLevel(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_536(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_537(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_538(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_539(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_540(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferIntEx(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonGetContestValue(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_543(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_544(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_545(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_546(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_547(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_548(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_549(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_550(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_551(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_552(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_553(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_554(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_555(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_556(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckBattlePoints(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_558(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_559(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_560(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_561(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MultiBattle(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_563(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_564(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_565(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_566(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetDPPlPrizeItemIdAndCost(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_568(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_569(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckCoinsVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_571(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_572(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_573(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_574(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_575(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_576(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_577(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_578(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_579(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferSealName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_LockLastTalked(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_582(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_583(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PartyLegalCheck(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_585(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_586(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_587(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_588(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_WildBattle(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetTrcardStars(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_591(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_592(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ShowSaveStats(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_HideSaveStats(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_595(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_596(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_597(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_598(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_599(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_600(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_FollowPokeFacePlayer(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_602(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_603(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_604(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_605(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_606(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_607(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_608(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_609(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_610(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_Pokeathlon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetNpcTradeUnusedFlag(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPhoneContactRandomGiftBerry(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPhoneContactGiftItem(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CameronPhoto(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_616(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_617(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PhotoAlbumIsFull(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_RocketCostumeFlagCheck(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_RocketCostumeFlagAction(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_621(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_622(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_AnimApricornTree(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ApricornTreeGetApricorn(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveApricornFromTree(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferApricornName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_627(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_628(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_629(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_630(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_631(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountPartyMonsOfSpecies(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_633(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_634(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_635(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_636(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_637(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_638(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_639(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_640(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SaveWipeExtraChunks(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_642(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_643(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_644(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_645(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_646(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPartySlotWithSpecies(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_648(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ScratchOffCard(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ScratchOffCardEnd(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetScratchOffPrize(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_652(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MoveTutorChooseMove(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TutorMoveTeachInSlot(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TutorMoveGetPrice(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_656(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_StatJudge(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferStatName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetMonForme(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferTrainerName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_661(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_662(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_663(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_664(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_665(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_666(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_667(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferTypeName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetItemQuantity(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetHiddenPowerType(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_671(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_672(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetOwnedRotomFormes(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountTranformedRotomsInParty(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_UpdateRotomForme(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPartyMonForme(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_677(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_678(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_679(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_AddSpecialGameStat(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_681(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_682(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_683(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_684(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPlayerXYZ(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_686(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_687(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPartySlotWithFatefulEncounter(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CommSanitizeParty(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_DayCareSanitizeMon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_691(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferBattleHallStreak(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BattleHallCountUsedSpecies(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BattleHallGetTotalStreak(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_695(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_696(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_697(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_FollowerPokeIsEventTrigger(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_699(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_700(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonHasItem(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_702(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_703(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_704(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_705(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_706(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_707(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_708(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_709(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_710(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_FollowPokeInteract(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_712(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_AlphPuzzle(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_714(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_UpdateDayCareMonObjects(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_716(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_717(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_718(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_719(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_720(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_721(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_722(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_723(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_724(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_725(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_726(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_727(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_728(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_729(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_730(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_731(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_732(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_733(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_734(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_735(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_736(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_737(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_738(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_739(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_740(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_741(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_742(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_743(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_744(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferPokeathlonCourseName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TouchscreenMenuHide(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TouchscreenMenuShow(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetMenuChoice(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MenuInitStdGmm(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MenuInit(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MenuItemAdd(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MenuExec(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_753(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_754(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_755(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_756(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_757(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_758(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_759(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_760(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_761(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_762(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_763(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_764(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_765(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_766(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_767(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_768(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_769(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_770(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_771(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_772(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_Cinematic(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_774(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_775(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveTogepiEgg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_777(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveSpikyEarPichu(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_RadioMusicIsPlaying(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CasinoGame(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_KenyaCheckPartyOrMailbox(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MartSell(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetFollowPokeInhibitState(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ScriptOverlayCmd(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BugContestAction(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferBugContestWinner(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_JudgeBugContest(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferBugContestMonNick(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BugContestGetTimeLeft(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_IsBugContestantRegistered(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_791(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_792(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BankTransaction(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckBankBalance(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_795(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_796(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_797(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferRulesetName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_799(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_800(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_801(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_802(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_803(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_804(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_805(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_806(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_807(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_808(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_809(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_810(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_811(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_812(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MomGiftCheck(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_814(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_815(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_UnownCircle(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_817(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MystriStageGymmickInit(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_819(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_820(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetBuenasPassword(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_822(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_823(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_824(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_825(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_826(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPartymonForme(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonAddContestValue(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_829(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_830(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_831(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_832(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_833(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_834(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_835(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_836(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_837(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BankOrWalletIsFull(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_839(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_840(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_841(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_842(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferItemNameIndef(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferItemNamePlural(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferPartyMonSpeciesNameIndef(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferSpeciesNameIndef(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferDPPtFriendStarterSpeciesNameIndef(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferFashionNameIndef(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferTrainerClassNameIndef(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferSealNamePlural(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_Capitalize(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferDeptStoreFloorNo(SCRIPTCONTEXT *ctx);

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
    ScrCmd_WaitButton,
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
    ScrCmd_063,
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
    ScrCmd_172,
    ScrCmd_NicknameInput,
    ScrCmd_FadeScreen,
    ScrCmd_WaitFade,
    ScrCmd_Warp,
    ScrCmd_RockClimb,
    ScrCmd_Surf,
    ScrCmd_Waterfall,
    ScrCmd_180,
    ScrCmd_181,
    ScrCmd_182,
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
    ScrCmd_225,
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
    ScrCmd_249,
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
    ScrCmd_325,
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
    ScrCmd_338,
    ScrCmd_MovePerson,
    ScrCmd_SetObjectMovementType,
    ScrCmd_341,
    ScrCmd_342,
    ScrCmd_343,
    ScrCmd_344,
    ScrCmd_345,
    ScrCmd_346,
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
    ScrCmd_AddSpecialGameStat,
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
    ScrCmd_753,
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
