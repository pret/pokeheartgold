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
extern BOOL ScrCmd_RunScriptWait(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_046(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_047(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_048(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_049(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_049(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_051(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_052(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CloseMsg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_054(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_055(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_056(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_057(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_058(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_059(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_074(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_WaitSE(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_076(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_077(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_089(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_090(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_091(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_092(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_113(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_114(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_115(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_116(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_117(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_118(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_119(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_120(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_121(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_122(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_123(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_124(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveItem(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TakeItem(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_HasSpaceForItem(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_HasItem(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_ItemIsTMOrHM(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetItemPocket(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetStarterChoice(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GenderMsgbox(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_133(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_134(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_135(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_136(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveMon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveEgg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetMonMove(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonHasMove(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_AnyMonHasMove(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPhoneBookRematch(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_NameRival(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetFriendSprite(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_RegisterPokegearCard(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_RegisterGearNumber(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_147(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_148(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_149(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_150(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_151(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_152(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_153(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_154(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_155(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_156(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_157(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_158(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_159(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_160(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_161(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_162(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_163(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_164(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_165(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_166(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_167(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_168(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_169(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_170(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_171(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_172(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_NicknameInput(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_FadeScreen(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_WaitFade(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_176(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_177(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_178(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_179(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_180(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_181(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_182(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_183(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_184(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_185(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_186(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetTrcardStars(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_188(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_189(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferPlayersName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_191(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_192(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferMonSpeciesName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferItemName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferPocketName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferTMHMMoveName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferMoveName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferInt(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferPartyMonNick(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferTrainerClassName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferPlayerUnionAvatarClassName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferSpeciesNameCustom(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferStarterSpeciesName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferDPPtRivalStarterSpeciesName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferDPPtFriendStarterSpeciesName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetStarterChoice(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferDecorationName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_208(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_209(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferMapSecName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_211(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_212(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_TrainerBattle(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_214(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_215(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_216(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_217(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_218(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_WhiteOut(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckBattleWon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_221(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_222(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_238(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_239(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_240(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_241(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_242(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountJohtoDexSeen(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountJohtoDexOwned(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountNationalDexSeen(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountNationalDexOwned(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_247(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetDexEvalResult(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_249(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_250(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_251(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_252(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_253(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_254(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_275(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_276(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_277(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_278(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_OverworldWhiteOut(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_280(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPlayerGender(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_HealParty(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_283(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_284(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_285(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_286(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_287(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_288(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_289(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_290(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_291(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_292(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveRunningShoes(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckBadge(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveBadge(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountBadges(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_297(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_298(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_299(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_300(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_301(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_312(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_313(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_314(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_315(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_316(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_317(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_318(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_319(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_320(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_321(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_322(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_323(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_324(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_325(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_326(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_327(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_328(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_329(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_330(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_331(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPartyCount(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_333(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_334(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_335(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferBerryName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferNatureName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_338(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MovePerson(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_340(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_341(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_342(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_343(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_344(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_345(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_346(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_347(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_348(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_349(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_350(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_351(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_352(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_353(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPartyMonSpecies(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PartymonIsMine(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PartyCountNotEgg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountAliveMons(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_358(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_359(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SubMoneyVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_361(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_362(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_363(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_364(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_365(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_366(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_367(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_HasEnoughMoneyVar(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_369(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_370(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_371(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_372(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_373(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_374(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_375(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_376(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_377(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_378(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_379(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_380(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_381(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_382(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_383(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_384(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_385(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_386(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_387(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_388(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_389(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_390(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_391(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_392(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_393(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_394(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_395(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_396(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_397(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_398(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferPartyMonMoveName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_400(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_401(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_402(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_426(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_427(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_428(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountFossils(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_SetPhoneCall(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_RunPhoneCall(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetFossilPokemon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetFossilMinimumAmount(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_434(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_447(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_448(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_449(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_450(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_451(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_452(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_453(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_454(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_455(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_456(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_457(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_458(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_459(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_460(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPhoneContactMsgIds(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_462(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_463(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_464(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_465(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_466(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_467(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_468(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_469(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_470(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_471(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_472(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_473(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_474(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_475(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_476(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_NatDexFlagAction(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_478(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_479(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_MonHasRibbon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveRibbon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferRibbonName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_483(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetWeekday(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_485(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_Dummy(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PokeCenAnim(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_488(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_489(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_490(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_491(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_492(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PromptEasyChat(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_494(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_495(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_496(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_497(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PrimoPasswordCheck1(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PrimoPasswordCheck2(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_500(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_501(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_502(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_503(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_504(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_505(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_506(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CountPCEmptySpace(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_508(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_509(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_510(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_511(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_512(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_513(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_514(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_PartySelectMon(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_530(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_531(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_532(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckGiveCoins(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_534(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_535(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_536(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_537(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_538(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_539(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_540(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_541(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_542(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_557(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_558(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_559(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_560(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_561(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_562(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_563(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_564(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_565(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_566(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_567(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_568(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_569(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_570(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_581(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_582(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_583(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_584(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_585(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_586(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_587(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_588(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_589(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_590(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_591(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_592(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_593(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_594(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_595(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_596(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_597(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_598(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_599(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_600(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_601(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_602(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_603(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_604(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_605(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_606(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_607(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_608(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_609(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_610(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_611(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_612(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPhoneContactRandomGiftBerry(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPhoneContactGiftItem(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CameronPhoto(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_616(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_617(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_PhotoAlbumIsFull(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_619(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_620(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_621(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_622(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_623(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_624(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_625(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BufferApricornName(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_627(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_628(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_629(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_630(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_631(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_632(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_633(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_634(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_635(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_636(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_637(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_638(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_639(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_640(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_641(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_642(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_643(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_644(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_645(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_646(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_647(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_648(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_649(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_650(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_651(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_652(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_653(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_654(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_655(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_656(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_657(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_658(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_659(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_670(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_671(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_672(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_673(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_674(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_675(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_676(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_677(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_678(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_679(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_680(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_681(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_682(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_683(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_684(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_685(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_686(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_687(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_688(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_689(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_690(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_691(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_692(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_693(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_694(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_695(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_696(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_697(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_698(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_699(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_700(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_701(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_702(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_703(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_704(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_705(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_706(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_707(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_708(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_709(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_710(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_711(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_712(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_713(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_714(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_715(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_745(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_773(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_774(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_775(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GiveTogepiEgg(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_777(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_778(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_779(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_780(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_781(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_782(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_783(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_784(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_785(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_786(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_787(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_788(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_789(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_790(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_791(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_792(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_BankTransaction(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_CheckBankBalance(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_795(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_796(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_797(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_798(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_813(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_814(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_815(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_816(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_817(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_818(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_819(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_820(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_821(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_822(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_823(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_824(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_825(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_826(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_GetPartymonForme(SCRIPTCONTEXT *ctx);
extern BOOL ScrCmd_828(SCRIPTCONTEXT *ctx);
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
extern BOOL ScrCmd_852(SCRIPTCONTEXT *ctx);

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
    ScrCmd_RunScriptWait,
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
    ScrCmd_046,
    ScrCmd_047,
    ScrCmd_048,
    ScrCmd_049,
    ScrCmd_049,
    ScrCmd_051,
    ScrCmd_052,
    ScrCmd_CloseMsg,
    ScrCmd_054,
    ScrCmd_055,
    ScrCmd_056,
    ScrCmd_057,
    ScrCmd_058,
    ScrCmd_059,
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
    ScrCmd_074,
    ScrCmd_WaitSE,
    ScrCmd_076,
    ScrCmd_077,
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
    ScrCmd_089,
    ScrCmd_090,
    ScrCmd_091,
    ScrCmd_092,
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
    ScrCmd_113,
    ScrCmd_114,
    ScrCmd_115,
    ScrCmd_116,
    ScrCmd_117,
    ScrCmd_118,
    ScrCmd_119,
    ScrCmd_120,
    ScrCmd_121,
    ScrCmd_122,
    ScrCmd_123,
    ScrCmd_124,
    ScrCmd_GiveItem,
    ScrCmd_TakeItem,
    ScrCmd_HasSpaceForItem,
    ScrCmd_HasItem,
    ScrCmd_ItemIsTMOrHM,
    ScrCmd_GetItemPocket,
    ScrCmd_SetStarterChoice,
    ScrCmd_GenderMsgbox,
    ScrCmd_133,
    ScrCmd_134,
    ScrCmd_135,
    ScrCmd_136,
    ScrCmd_GiveMon,
    ScrCmd_GiveEgg,
    ScrCmd_SetMonMove,
    ScrCmd_MonHasMove,
    ScrCmd_AnyMonHasMove,
    ScrCmd_GetPhoneBookRematch,
    ScrCmd_NameRival,
    ScrCmd_GetFriendSprite,
    ScrCmd_RegisterPokegearCard,
    ScrCmd_RegisterGearNumber,
    ScrCmd_147,
    ScrCmd_148,
    ScrCmd_149,
    ScrCmd_150,
    ScrCmd_151,
    ScrCmd_152,
    ScrCmd_153,
    ScrCmd_154,
    ScrCmd_155,
    ScrCmd_156,
    ScrCmd_157,
    ScrCmd_158,
    ScrCmd_159,
    ScrCmd_160,
    ScrCmd_161,
    ScrCmd_162,
    ScrCmd_163,
    ScrCmd_164,
    ScrCmd_165,
    ScrCmd_166,
    ScrCmd_167,
    ScrCmd_168,
    ScrCmd_169,
    ScrCmd_170,
    ScrCmd_171,
    ScrCmd_172,
    ScrCmd_NicknameInput,
    ScrCmd_FadeScreen,
    ScrCmd_WaitFade,
    ScrCmd_176,
    ScrCmd_177,
    ScrCmd_178,
    ScrCmd_179,
    ScrCmd_180,
    ScrCmd_181,
    ScrCmd_182,
    ScrCmd_183,
    ScrCmd_184,
    ScrCmd_185,
    ScrCmd_186,
    ScrCmd_GetTrcardStars,
    ScrCmd_188,
    ScrCmd_189,
    ScrCmd_BufferPlayersName,
    ScrCmd_191,
    ScrCmd_192,
    ScrCmd_BufferMonSpeciesName,
    ScrCmd_BufferItemName,
    ScrCmd_BufferPocketName,
    ScrCmd_BufferTMHMMoveName,
    ScrCmd_BufferMoveName,
    ScrCmd_BufferInt,
    ScrCmd_BufferPartyMonNick,
    ScrCmd_BufferTrainerClassName,
    ScrCmd_BufferPlayerUnionAvatarClassName,
    ScrCmd_BufferSpeciesNameCustom,
    ScrCmd_BufferStarterSpeciesName,
    ScrCmd_BufferDPPtRivalStarterSpeciesName,
    ScrCmd_BufferDPPtFriendStarterSpeciesName,
    ScrCmd_GetStarterChoice,
    ScrCmd_BufferDecorationName,
    ScrCmd_208,
    ScrCmd_209,
    ScrCmd_BufferMapSecName,
    ScrCmd_211,
    ScrCmd_212,
    ScrCmd_TrainerBattle,
    ScrCmd_214,
    ScrCmd_215,
    ScrCmd_216,
    ScrCmd_217,
    ScrCmd_218,
    ScrCmd_WhiteOut,
    ScrCmd_CheckBattleWon,
    ScrCmd_221,
    ScrCmd_222,
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
    ScrCmd_238,
    ScrCmd_239,
    ScrCmd_240,
    ScrCmd_241,
    ScrCmd_242,
    ScrCmd_CountJohtoDexSeen,
    ScrCmd_CountJohtoDexOwned,
    ScrCmd_CountNationalDexSeen,
    ScrCmd_CountNationalDexOwned,
    ScrCmd_247,
    ScrCmd_GetDexEvalResult,
    ScrCmd_249,
    ScrCmd_250,
    ScrCmd_251,
    ScrCmd_252,
    ScrCmd_253,
    ScrCmd_254,
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
    ScrCmd_275,
    ScrCmd_276,
    ScrCmd_277,
    ScrCmd_278,
    ScrCmd_OverworldWhiteOut,
    ScrCmd_280,
    ScrCmd_GetPlayerGender,
    ScrCmd_HealParty,
    ScrCmd_283,
    ScrCmd_284,
    ScrCmd_285,
    ScrCmd_286,
    ScrCmd_287,
    ScrCmd_288,
    ScrCmd_289,
    ScrCmd_290,
    ScrCmd_291,
    ScrCmd_292,
    ScrCmd_GiveRunningShoes,
    ScrCmd_CheckBadge,
    ScrCmd_GiveBadge,
    ScrCmd_CountBadges,
    ScrCmd_297,
    ScrCmd_298,
    ScrCmd_299,
    ScrCmd_300,
    ScrCmd_301,
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
    ScrCmd_312,
    ScrCmd_313,
    ScrCmd_314,
    ScrCmd_315,
    ScrCmd_316,
    ScrCmd_317,
    ScrCmd_318,
    ScrCmd_319,
    ScrCmd_320,
    ScrCmd_321,
    ScrCmd_322,
    ScrCmd_323,
    ScrCmd_324,
    ScrCmd_325,
    ScrCmd_326,
    ScrCmd_327,
    ScrCmd_328,
    ScrCmd_329,
    ScrCmd_330,
    ScrCmd_331,
    ScrCmd_GetPartyCount,
    ScrCmd_333,
    ScrCmd_334,
    ScrCmd_335,
    ScrCmd_BufferBerryName,
    ScrCmd_BufferNatureName,
    ScrCmd_338,
    ScrCmd_MovePerson,
    ScrCmd_340,
    ScrCmd_341,
    ScrCmd_342,
    ScrCmd_343,
    ScrCmd_344,
    ScrCmd_345,
    ScrCmd_346,
    ScrCmd_347,
    ScrCmd_348,
    ScrCmd_349,
    ScrCmd_350,
    ScrCmd_351,
    ScrCmd_352,
    ScrCmd_353,
    ScrCmd_GetPartyMonSpecies,
    ScrCmd_PartymonIsMine,
    ScrCmd_PartyCountNotEgg,
    ScrCmd_CountAliveMons,
    ScrCmd_358,
    ScrCmd_359,
    ScrCmd_SubMoneyVar,
    ScrCmd_361,
    ScrCmd_362,
    ScrCmd_363,
    ScrCmd_364,
    ScrCmd_365,
    ScrCmd_366,
    ScrCmd_367,
    ScrCmd_HasEnoughMoneyVar,
    ScrCmd_369,
    ScrCmd_370,
    ScrCmd_371,
    ScrCmd_372,
    ScrCmd_373,
    ScrCmd_374,
    ScrCmd_375,
    ScrCmd_376,
    ScrCmd_377,
    ScrCmd_378,
    ScrCmd_379,
    ScrCmd_380,
    ScrCmd_381,
    ScrCmd_382,
    ScrCmd_383,
    ScrCmd_384,
    ScrCmd_385,
    ScrCmd_386,
    ScrCmd_387,
    ScrCmd_388,
    ScrCmd_389,
    ScrCmd_390,
    ScrCmd_391,
    ScrCmd_392,
    ScrCmd_393,
    ScrCmd_394,
    ScrCmd_395,
    ScrCmd_396,
    ScrCmd_397,
    ScrCmd_398,
    ScrCmd_BufferPartyMonMoveName,
    ScrCmd_400,
    ScrCmd_401,
    ScrCmd_402,
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
    ScrCmd_426,
    ScrCmd_427,
    ScrCmd_428,
    ScrCmd_CountFossils,
    ScrCmd_SetPhoneCall,
    ScrCmd_RunPhoneCall,
    ScrCmd_GetFossilPokemon,
    ScrCmd_GetFossilMinimumAmount,
    ScrCmd_434,
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
    ScrCmd_447,
    ScrCmd_448,
    ScrCmd_449,
    ScrCmd_450,
    ScrCmd_451,
    ScrCmd_452,
    ScrCmd_453,
    ScrCmd_454,
    ScrCmd_455,
    ScrCmd_456,
    ScrCmd_457,
    ScrCmd_458,
    ScrCmd_459,
    ScrCmd_460,
    ScrCmd_GetPhoneContactMsgIds,
    ScrCmd_462,
    ScrCmd_463,
    ScrCmd_464,
    ScrCmd_465,
    ScrCmd_466,
    ScrCmd_467,
    ScrCmd_468,
    ScrCmd_469,
    ScrCmd_470,
    ScrCmd_471,
    ScrCmd_472,
    ScrCmd_473,
    ScrCmd_474,
    ScrCmd_475,
    ScrCmd_476,
    ScrCmd_NatDexFlagAction,
    ScrCmd_478,
    ScrCmd_479,
    ScrCmd_MonHasRibbon,
    ScrCmd_GiveRibbon,
    ScrCmd_BufferRibbonName,
    ScrCmd_483,
    ScrCmd_GetWeekday,
    ScrCmd_485,
    ScrCmd_Dummy,
    ScrCmd_PokeCenAnim,
    ScrCmd_488,
    ScrCmd_489,
    ScrCmd_490,
    ScrCmd_491,
    ScrCmd_492,
    ScrCmd_PromptEasyChat,
    ScrCmd_494,
    ScrCmd_495,
    ScrCmd_496,
    ScrCmd_497,
    ScrCmd_PrimoPasswordCheck1,
    ScrCmd_PrimoPasswordCheck2,
    ScrCmd_500,
    ScrCmd_501,
    ScrCmd_502,
    ScrCmd_503,
    ScrCmd_504,
    ScrCmd_505,
    ScrCmd_506,
    ScrCmd_CountPCEmptySpace,
    ScrCmd_508,
    ScrCmd_509,
    ScrCmd_510,
    ScrCmd_511,
    ScrCmd_512,
    ScrCmd_513,
    ScrCmd_514,
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
    ScrCmd_PartySelectMon,
    ScrCmd_530,
    ScrCmd_531,
    ScrCmd_532,
    ScrCmd_CheckGiveCoins,
    ScrCmd_534,
    ScrCmd_535,
    ScrCmd_536,
    ScrCmd_537,
    ScrCmd_538,
    ScrCmd_539,
    ScrCmd_540,
    ScrCmd_541,
    ScrCmd_542,
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
    ScrCmd_557,
    ScrCmd_558,
    ScrCmd_559,
    ScrCmd_560,
    ScrCmd_561,
    ScrCmd_562,
    ScrCmd_563,
    ScrCmd_564,
    ScrCmd_565,
    ScrCmd_566,
    ScrCmd_567,
    ScrCmd_568,
    ScrCmd_569,
    ScrCmd_570,
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
    ScrCmd_581,
    ScrCmd_582,
    ScrCmd_583,
    ScrCmd_584,
    ScrCmd_585,
    ScrCmd_586,
    ScrCmd_587,
    ScrCmd_588,
    ScrCmd_589,
    ScrCmd_590,
    ScrCmd_591,
    ScrCmd_592,
    ScrCmd_593,
    ScrCmd_594,
    ScrCmd_595,
    ScrCmd_596,
    ScrCmd_597,
    ScrCmd_598,
    ScrCmd_599,
    ScrCmd_600,
    ScrCmd_601,
    ScrCmd_602,
    ScrCmd_603,
    ScrCmd_604,
    ScrCmd_605,
    ScrCmd_606,
    ScrCmd_607,
    ScrCmd_608,
    ScrCmd_609,
    ScrCmd_610,
    ScrCmd_611,
    ScrCmd_612,
    ScrCmd_GetPhoneContactRandomGiftBerry,
    ScrCmd_GetPhoneContactGiftItem,
    ScrCmd_CameronPhoto,
    ScrCmd_616,
    ScrCmd_617,
    ScrCmd_PhotoAlbumIsFull,
    ScrCmd_619,
    ScrCmd_620,
    ScrCmd_621,
    ScrCmd_622,
    ScrCmd_623,
    ScrCmd_624,
    ScrCmd_625,
    ScrCmd_BufferApricornName,
    ScrCmd_627,
    ScrCmd_628,
    ScrCmd_629,
    ScrCmd_630,
    ScrCmd_631,
    ScrCmd_632,
    ScrCmd_633,
    ScrCmd_634,
    ScrCmd_635,
    ScrCmd_636,
    ScrCmd_637,
    ScrCmd_638,
    ScrCmd_639,
    ScrCmd_640,
    ScrCmd_641,
    ScrCmd_642,
    ScrCmd_643,
    ScrCmd_644,
    ScrCmd_645,
    ScrCmd_646,
    ScrCmd_647,
    ScrCmd_648,
    ScrCmd_649,
    ScrCmd_650,
    ScrCmd_651,
    ScrCmd_652,
    ScrCmd_653,
    ScrCmd_654,
    ScrCmd_655,
    ScrCmd_656,
    ScrCmd_657,
    ScrCmd_658,
    ScrCmd_659,
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
    ScrCmd_670,
    ScrCmd_671,
    ScrCmd_672,
    ScrCmd_673,
    ScrCmd_674,
    ScrCmd_675,
    ScrCmd_676,
    ScrCmd_677,
    ScrCmd_678,
    ScrCmd_679,
    ScrCmd_680,
    ScrCmd_681,
    ScrCmd_682,
    ScrCmd_683,
    ScrCmd_684,
    ScrCmd_685,
    ScrCmd_686,
    ScrCmd_687,
    ScrCmd_688,
    ScrCmd_689,
    ScrCmd_690,
    ScrCmd_691,
    ScrCmd_692,
    ScrCmd_693,
    ScrCmd_694,
    ScrCmd_695,
    ScrCmd_696,
    ScrCmd_697,
    ScrCmd_698,
    ScrCmd_699,
    ScrCmd_700,
    ScrCmd_701,
    ScrCmd_702,
    ScrCmd_703,
    ScrCmd_704,
    ScrCmd_705,
    ScrCmd_706,
    ScrCmd_707,
    ScrCmd_708,
    ScrCmd_709,
    ScrCmd_710,
    ScrCmd_711,
    ScrCmd_712,
    ScrCmd_713,
    ScrCmd_714,
    ScrCmd_715,
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
    ScrCmd_745,
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
    ScrCmd_773,
    ScrCmd_774,
    ScrCmd_775,
    ScrCmd_GiveTogepiEgg,
    ScrCmd_777,
    ScrCmd_778,
    ScrCmd_779,
    ScrCmd_780,
    ScrCmd_781,
    ScrCmd_782,
    ScrCmd_783,
    ScrCmd_784,
    ScrCmd_785,
    ScrCmd_786,
    ScrCmd_787,
    ScrCmd_788,
    ScrCmd_789,
    ScrCmd_790,
    ScrCmd_791,
    ScrCmd_792,
    ScrCmd_BankTransaction,
    ScrCmd_CheckBankBalance,
    ScrCmd_795,
    ScrCmd_796,
    ScrCmd_797,
    ScrCmd_798,
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
    ScrCmd_813,
    ScrCmd_814,
    ScrCmd_815,
    ScrCmd_816,
    ScrCmd_817,
    ScrCmd_818,
    ScrCmd_819,
    ScrCmd_820,
    ScrCmd_821,
    ScrCmd_822,
    ScrCmd_823,
    ScrCmd_824,
    ScrCmd_825,
    ScrCmd_826,
    ScrCmd_GetPartymonForme,
    ScrCmd_828,
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
    ScrCmd_852,
};
const u32 sNumScriptCmds = NELEMS(gScriptCmdTable);

#else
extern const ScrCmdFunc gScriptCmdTable[];
extern const u32 sNumScriptCmds;
#endif //_IN_SCRCMD_C
